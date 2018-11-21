unit UBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBStoredProc, WinXP, DataExport, DataToXLS, {ZipMstr,}
  IBQuery, IniFiles, AbBase, AbBrowse, AbZBrows, AbZipper, AbMeter, ShlObj,
  ImgList, PngImageList, JvExControls, JvLabel, JvGIF, pngimage,
  JvExExtCtrls, JvImage, IBServices, FileCtrl, JvExComCtrls, JvProgressBar;

type
  TFBackup = class(TFUniversal)
    SDBackup: TSaveDialog;
    RGSeleccion: TRadioGroup;
    GBDescripcion: TGroupBox;
    EDescripcion: TEdit;
    GroupBox2: TGroupBox;
    BBAceptar: TBitBtn;
    BBAyuda: TBitBtn;
    //zipper: TZipMaster;
    cbComprimir: TCheckBox;
    cbEnviar: TCheckBox;
    zipper: TAbZipper;
    barra: TAbMeter;
    AbVCLMeterLink1: TAbVCLMeterLink;
    IBBackupService1: TIBBackupService;
    lbProgress: TLabel;
    AvanceBackup: TJvProgressBar;
    procedure BBAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RGSeleccionClick(Sender: TObject);
    procedure EDescripcionKeyPress(Sender: TObject; var Key: Char);
    //procedure zipperTotalProgress(Sender: TObject; TotalSize: Int64;
      //PerCent: Integer);
    procedure cbComprimirClick(Sender: TObject);
    procedure lbProgressClick(Sender: TObject);
  private
    ArchivoIni : TiniFile;
     percentage : integer;
     lastUpdate : TDateTime;
    procedure backup; //guarda bd en la carpeta backup donde esta ubicada huella
    procedure borrarArchivosResguardo; //si no existe la carpeta de backup borro los archivos del .ini
    procedure enviarPorMail(dir:string;titulo:string;texto:string;archivo:string);
    { Private declarations }
//    procedure RealizarBackup(Direccion : String; Tipo : Integer);
    procedure BackUpRed(srvIP, srvDIR, userDst : String);
    procedure startProgress();
    procedure showProgress(mess : string);
  public
    procedure guardarBD(Tipo : Integer);//guarda bd en otra ubicación
    function generateFileNameByDate(direccion : string):string;
  end;

var
  FBackup: TFBackup;
  dirDstBackUp : string = '';

implementation
uses UMensajeHuella, UCartel, UFunctions,UPrincipal, UAvanceTerminar, Math,ShellAPI,
  ComObj, URestaurar, UTraduccion, DateUtils, UDMSoftvet;

{$R *.dfm}



procedure TFBackup.borrarArchivosResguardo;
var ArchivoIni : TiniFile;
    Cantidad, i : integer;
    TextoAPegar : string;
begin
    ArchivoIni := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
    ArchivoIni.EraseSection('Backup');

    ArchivoIni.Free; //cierra el archivo .INI

end;

procedure TFBackup.backup;
var nombre_archivo_nuevo,formattedDateTime, fechasola : string;
    nombre_archivo_origen, nombre_archivo_destino : string;
    i, Cantidad : integer;
    cartel: TCartel;
    msje: String;
begin
  if (CrearDirectorio(ExtractFilePath(Application.ExeName) + 'Backup\')) then
    borrarArchivosResguardo;
  cartel:= TCartel.getInstance();
  msje:= 'Realizando backup ...';
  cartel.abrircartel(msje);
  inherited;
  DateTimeToString(fechasola, 'ddddd', now);
  DateSeparator := '_';
  TimeSeparator := '_';
  DateTimeToString(formattedDateTime, 'ddddd', now);
  nombre_archivo_nuevo := 'Huella'+ formattedDateTime +'_'+ TimeToStr(now)+ '.BKP';
  nombre_archivo_origen := copy(Application.ExeName, 0, length(Application.ExeName) -4) + '.fdb';
  nombre_archivo_destino := ExtractFilePath(Application.ExeName)+'backup\'+ nombre_archivo_nuevo;
  CopyFile(pchar(nombre_archivo_origen), pchar(nombre_archivo_destino), true);
  ArchivoIni := TIniFile.Create (ExtractFilePath(Application.ExeName)+'huella.ini');
  Cantidad := ArchivoIni.ReadInteger ('Backup','Cantidad',0);
  i := Cantidad + 1;
  ArchivoIni.WriteInteger ('Backup','Cantidad',i);
  ArchivoIni.WriteString ('Backup','Archivo'+IntToStr(i),nombre_archivo_nuevo);
  ArchivoIni.WriteString ('Backup','Descripcion'+IntToStr(i),EDescripcion.Text);
  ArchivoIni.WriteString ('Backup','Fecha'+IntToStr(i),fechasola);
  ArchivoIni.Free; //cierra el archivo .INI
  cartel.cerrarcartel();
  cartel.FreeInstance();
  MostrarMensaje(tmInformacion, 'El Backup se realizó con Exito');
  DateSeparator := '/';
  TimeSeparator := ':';
end;

procedure TFBackup.BBAceptarClick(Sender: TObject);
var srv : string;
begin
  inherited;
  if (RGSeleccion.ItemIndex = 0) then
  begin
    backup;
    close;
  end
  else
  begin
    guardarBD(1);
  end;
end;
{
PROGRESS STAGE
1. generating zip
2. writing domain
3. writing column
4. writing parameter
5. writing index
6. writing privilege
7. writing constraint
 }
var indicadorProgreso : integer = 0;

procedure TFBackup.startProgress();
begin
   percentage := 0;
   lastUpdate := now();
end;

procedure TFBackup.showProgress(mess : string);
begin
//Para reducir el fliqueo, no actualizo todos los mensajes
 if MilliSecondsBetween(now, lastUpdate)<200 then exit;
  lastUpdate := now();
 if AnsiPos('GENERATING ZIP', uppercase(mess)) >= 1 then
   percentage :=max(percentage, 1)
 else
 if AnsiPos('WRITING DOMAIN', uppercase(mess)) >= 1 then
   percentage :=max(percentage, 10)
 else
 if AnsiPos('WRITING COLUMN', uppercase(mess)) >= 1 then
   percentage :=max(percentage, 30)
 else
 if AnsiPos('WRITING PARAMETER', uppercase(mess)) >= 1 then
   percentage :=max(percentage, 50)
 else
 if AnsiPos('WRITING INDEX', uppercase(mess)) >= 1 then
   percentage :=max(percentage, 80)
 else
 if AnsiPos('WRITING PRIVILEGE', uppercase(mess)) >= 1 then
   percentage :=max(percentage, 90)
 else
 if AnsiPos('WRITING CONSTRAINT', uppercase(mess)) >= 1 then
   percentage :=max(percentage, 100);

   AvanceBackup.Position := percentage;
   //lbProgress.Caption :=  'Procesando '+intToStr(percentage)+'%.';
   // Muestro el progreso
  IF  lbProgress.tag = 1 then
    lbProgress.Caption := lbProgress.Caption + mess
  else
  begin

     indicadorProgreso := (indicadorProgreso + 1) mod 4;
  end;
  Application.ProcessMessages();
end;

procedure TFBackup.BackUpRed(srvIP, srvDIR, userDst : String);
begin
IBBackupService1.Active := false;

with IBBackupService1 do
  begin
    AvanceBackup.Visible := true;
    AvanceBackup.Min := 0;
    AvanceBackup.Max := 100;
    ServerName := srvIP;
    LoginPrompt := False;
    Protocol := TProtocol(0);
    Params.Add('user_name=sysdba');
    Params.Add('password=masterkey');
    Active := True;
    try
      Verbose := True;
      Options := [];
      DatabaseName := srvDIR;
      BackupFile.clear();
      BackupFile.Add(userDst);   (* error, must be: BackupFile.Add('c:\temp\e1.gbk=2048');   *)
      ServiceStart();

      While not Eof do
      begin
        showProgress(  GetNextLine());

        application.ProcessMessages();
      end;
       MostrarMensaje(tmInformacion,'El Backup se realizó con Exito.');
       Active := False;
       Self.Close;
    except
      on e:Exception do
       MostrarMensaje(tmInformacion,'Ha ocurrido un error. ' + e.message);
    end;

  end;
     AvanceBackup.Visible := false;
end;

function TFBackup.generateFileNameByDate(direccion : string) : string;
var
  nombre: String;
begin

 nombre := Direccion+'huella'+ '_'+DateToStr(Date())+  StringReplace(TimeToStr(Now()),':','',[rfReplaceAll]);
 nombre :=  StringReplace(nombre,'/','_',[rfReplaceAll]) ;
 nombre :=  StringReplace(nombre,' p.m.','',[rfReplaceAll]) ;

 result := nombre;
end;

procedure TFBackup.guardarBD(Tipo : Integer);
var
  desktopFolder : array[0..MAX_PATH] of Char;
  PIDL : PItemIDList;
  srv ,bckname,zipBck, bckDir,archtmp, Escritorio,bbddDir, localDir : String;
begin
  inherited;
  // Si es local, lo copia en el directorio de la APP
  if (FPrincipal.ServidorBD = '') or  (uppercase(FPrincipal.ServidorBD) = 'LOCALHOST') then
  begin
    srv := 'LOCALHOST';
    if  FPrincipal.dirBD = '' then
       bbddDir :=extractFilePath( application.exename)
     else
       bbddDir :=  extractFilePath( FPrincipal.dirBD);
    bckDir  :=extractFilePath( application.exename)  + 'backup\';
    localDir := bbddDir;
  end
  // El backUp se genera en el servidor.
  else
  begin
   srv :=  FPrincipal.ServidorBD;
   bbddDir :=extractFilePath( FPrincipal.DirBD);
   bbddDir := copy(bbddDir, 4,length(bbddDir));
   bbddDir  :='\\'+  FPrincipal.ServidorBD + '\'+bbddDir ;
   bckDir  :=bbddDir  + 'backup\';
   localDir := extractFilePath( FPrincipal.DirBD);
  end;
  self.Show();

  case Tipo of
    1 : begin
          // Mostrar Mensaje:
          //MostrarMensaje(tmInformacion, 'A continuación, seleccione la carpeta donde se realizará la copia de seguridad');
          bckDir := ExtractFilePath(Application.ExeName);
//          SDBackup.Filter:='Todos los archivos|*.*';
          bckname := generateFileNameByDate(bckDir);
          SDBackup.FileName :=  bckname;
          if SDBackup.Execute then
          begin
             bckDir := SDBackup.GetNamePath + '\';

             bckname := SDBackup.FileName;
             bckname := StringReplace(bckname,'.fdb','',[rfReplaceAll]) ;
            // // Si el usuario cambio el nombre, se lo debo acomodar:
            { if strpos(PChar(bckname), '.fbk') = nil then
             begin
               bckname := StringReplace(bckname,'.*.zip','',[rfReplaceAll]) ;
               bckname := bckname + '.fbk';
             end;}

//             zipBck := copy(bckname,1, length(bckname)-4) +'.zip';
             zipBck := bckname +'.zip';
          end
         else
          begin
            self.close();
            exit;
          end;
        end;
    2 : begin
           bckname :=  generateFileNameByDate(extractFilePath(FPrincipal.DirBD) + 'backup\');
           zipBck := copy(bckname,1, length(bckname)-4) +'.zip';
       end;
   end;
   // Genero los nombres de directorios y archivos
  if not DirectoryExists(bckDir) then
    MkDir(bckDir);

  SDBackup.InitialDir := bckDir;

   // Genero el archivo ZIP
   archtmp :=bckDir+'huella.fdb';
   CopyFile(pchar(bbddDir+'huella.fdb'), pchar(archtmp), false);
   showProgress('GENERATING ZIP');
   FPrincipal.IBTPrincipal.CommitRetaining;
   FPrincipal.IBDPrincipal.Connected := False; //desconecto la base

   bckname := bckname  +'.fbk' ;
// Hago el backup usando el servicio del Firebird con la direccion de la BBDD dentro del servidor

   {$IFDEF PEN}
   // No hace backup, poruqe el embebido creo no lo soporta
   {$ELSE}
   BackUpRed( srv , localDir+'huella.fdb' ,  bckname);
   {$ENDIF}

   // Agrego los archivos para comprimir
   zipper.FileName :=zipBck;//nombre_archivo_destino;
   zipper.AddFiles(archtmp,0);

   {$IFDEF PEN}
    // No se genero el archivo, no lo agrego al zip
   {$ELSE}
     zipper.AddFiles(bckname,0);
   {$ENDIF}


   zipper.Save();
   zipper.CloseArchive();

   // Borro los datos temporales
   DeleteFile(archtmp);
   DeleteFile(bckname);

   // Vuelvo al menu principal  y reinicio los datos
   setCurrentDir(extractFilePath(application.exename));
   FPrincipal.IBDPrincipal.Open();
   DMSoftvet.IBQEstablecimiento.open();
   DMSoftvet.IBQSeguridad.Open();

end;

procedure TFBackup.FormShow(Sender: TObject);
begin
  inherited;
  lbProgress.Caption := 'Realizando Backup. Aguarde por favor';
  {if Owner is TFRestaurar then
    guardarBD(2)
  else
    guardarBD(1);}

 { SDBackup.FileName:= ExtractFileName(copy(Application.ExeName, 0, length(Application.ExeName) -4) + '.fdb');
  EDescripcion.SetFocus;
  EDescripcion.SelectAll;}
end;

procedure TFBackup.RGSeleccionClick(Sender: TObject);
begin
  inherited;
  if RGSeleccion.ItemIndex=0 then
    begin
    GBDescripcion.Caption:=Traducir('Descripción');
    EDescripcion.Visible:=true;
    cbComprimir.Visible:=false;
    cbEnviar.Visible:=false;
    EDescripcion.Enabled:=true;
    EDescripcion.SetFocus;
    EDescripcion.SelectAll;
    end;
  if RGSeleccion.ItemIndex=1 then
    begin
    GBDescripcion.Caption:=Traducir('Opciones');
    EDescripcion.Visible:=false;
    cbComprimir.Visible:=true;
    cbEnviar.Visible:=false;
    EDescripcion.Enabled:=false;
    end;

end;

procedure TFBackup.EDescripcionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if(key = #13) then   BBAceptarClick(nil);
  if(key = #27) then   close;
end;

procedure TFBackup.cbComprimirClick(Sender: TObject);
begin
  inherited;
  if cbComprimir.Checked then
    begin
    SDBackup.Filter:='Archivo ZIP|*.zip';
    SDBackup.FileName:= ExtractFileName(copy(Application.ExeName, 0, length(Application.ExeName) -4) + '.zip');
    end
  else
    begin
    SDBackup.Filter:='Base de Datos Firebird|*.fdb';
    SDBackup.FileName:= ExtractFileName(copy(Application.ExeName, 0, length(Application.ExeName) -4) + '.fdb');
    end;
end;

procedure TFBackup.enviarPorMail(dir:string;titulo:string;texto:string;archivo:string);
const
  olMailItem = 0;
var
  Outlook, MailItem: OLEVariant;
begin
  try
    Outlook := GetActiveOleObject('Outlook.Application');
  except
    Outlook := CreateOleObject('Outlook.Application');
  end;

  MailItem := Outlook.CreateItem(olMailItem);

  MailItem.Recipients.Add(dir);
  MailItem.Subject := titulo;
  MailItem.Body := texto;
  MailItem.Attachments.Add(archivo);
  MailItem.Display;

  //VarClear(Outlook);
  Outlook := Unassigned;
end;

procedure TFBackup.lbProgressClick(Sender: TObject);
begin
  inherited;
  // Cambio el estado del Progreso
  lbProgress.Tag := (lbProgress.Tag +1 ) mod 2;
end;

end.
