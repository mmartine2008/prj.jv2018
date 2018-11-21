unit URestaurar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, Buttons, ActnList, ComCtrls, ExtCtrls,UMensajeHuella,
  DB, IBCustomDataSet, IBStoredProc, UBackup, DataExport, DataToXLS, WinXP, IniFiles,
  IBQuery, AbBase, AbBrowse, AbZBrows, AbUnzper, StrUtils, IBDatabase, ShlObj,
  ShellCtrls, JvExControls, JvLabel, JvGIF, ImgList, PngImageList,    UCartel,
  JvExExtCtrls, JvImage, IBServices, pngimage, JvGradient, JvExComCtrls,                  
  JvProgressBar, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TFRestaurar = class(TFUniversal)
    Panel1: TPanel;
    Panel2: TPanel;
    BBCancelar: TBitBtn;
    BBRestaurar: TBitBtn;
    GroupBox1: TGroupBox;
    LBArchivos: TListBox;
    BBAyuda: TBitBtn;
    BBOtroDirectorio: TBitBtn;
    ODCambiarDir: TOpenDialog;
    BBEliminar: TBitBtn;
    IBQFechas: TIBQuery;
    unzipper: TAbUnZipper;
    IBDNueva: TIBDatabase;
    IBTNueva: TIBTransaction;
    IBQEstablecimientos: TIBQuery;
    IBQAnimales: TIBQuery;
    IBRestoreService1: TIBRestoreService;
    lbProgress: TLabel;
    IBQUltActu: TIBQuery;
    XMLCliente: TXMLDocument;
    procedure BBRestaurarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure BBOtroDirectorioClick(Sender: TObject);
    procedure BBEliminarClick(Sender: TObject);
  private
    back : TFUniversal;
    procedure recuperar_Archivos;
    procedure GuardarFechasArchivo(fecha : TDate);
    procedure GuardarCantidadEjecuciones(ce : Integer);
    procedure BorrarEntrada(ind:Integer; ArchivoIni:TiniFile);
    procedure renombrarEntradas(seleccionado:Integer; ArchivoIni:TiniFile; cantidad:Integer);
    procedure limpiarArchivos(Sender: TObject);
    procedure modificarCantidad(inc:Integer;ArchivoIni : TiniFile);
    procedure DelArchivosEstablecimientos(Directorio : String);
    function VerificarVersion(Base : String) : Boolean;
  public
    percentage : integer;
    lastUpdate : TDateTime;
    procedure AbrirArchivo;
    procedure showProgress(cartel : TCartel; mess : string);
    procedure startProgress();
    function RestoreFromNetAsService(srvIP, backupDIR, userDst ,tmpDst : String) : boolean;
    procedure BuscarNodo(XmlClientNode : IXMLNode; fecha : Tdate);
    procedure Actualizar_xml(fecha_script : TDate);
  end;

var
  FRestaurar: TFRestaurar;

implementation
uses  UPrincipal,  AbArcTyp, UDMSoftvet, ULogin, math,DateUtils;
{$R *.dfm}

procedure TFRestaurar.recuperar_Archivos;
var ArchivoIni : TiniFile;
    Cantidad, i : integer;
    TextoAPegar : string;
begin
    ArchivoIni := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
    Cantidad := ArchivoIni.ReadInteger ('Backup','Cantidad',0);
    for i := 1 to Cantidad do
     begin
      TextoAPegar := ArchivoIni.ReadString ('Backup','Fecha'+IntToStr(i),'Fecha')+' - '+ ArchivoIni.ReadString ('Backup','Descripcion'+IntToStr(i),'Descripción');
      LBArchivos.Items.Add( TextoAPegar);
     end;
    ArchivoIni.Free; //cierra el archivo .INI
end;

procedure TFRestaurar.limpiarArchivos(Sender: TObject);
begin
  LBArchivos.Items.Clear;
  recuperar_Archivos;
  BBEliminar.Enabled:=LBArchivos.Items.Count > 0;
end;

procedure TFRestaurar.AbrirArchivo;
var
  desktopFolder : array[0..MAX_PATH] of Char;
  PIDL : PItemIDList;
  Escritorio, remoteDir : String;
  srv ,bckname, bckDir, bbddDir : String;
  F : TFLogin;
  fecha_script : TDate;

begin

  // Si es local, lo copia en el directorio de la APP
  if (FPrincipal.ServidorBD = '') or  (uppercase(FPrincipal.ServidorBD) = 'LOCALHOST') then
  begin
    srv := 'LOCALHOST';
    bbddDir :=extractFilePath( application.exename);
    bckDir  :=extractFilePath( application.exename)  + 'backup\';
  end
  // El backUp se genera en el servidor.
  else
  begin
   srv :=  FPrincipal.ServidorBD;
   bbddDir :=extractFilePath( FPrincipal.DirBD);
   bbddDir := copy(bbddDir, 4,length(bbddDir));
   bbddDir  :='\\'+  FPrincipal.ServidorBD + '\'+bbddDir ;
   bckDir  :=bbddDir  + 'backup\';
  end;

  ODCambiarDir.InitialDir := bckDir;
  if ODCambiarDir.Execute then
  begin
     if uppercase(ExtractFileExt(ODCambiarDir.FileName)) = '.ZIP' then
     begin
//       if (FPrincipal.ServidorBD = '') or  (uppercase(FPrincipal.ServidorBD) = 'LOCALHOST') then
          BBOtroDirectorioClick(nil)
//       else
//          MostrarMensaje(tmError,'No se puede restaurar este archivo local a un Servidor. Copie el archivo al destino y pruebe nuevamente.');

     end
     else
     if uppercase(ExtractFileExt(ODCambiarDir.FileName)) = '.FBK' then
         RestoreFromNetAsService(  srv ,ODCambiarDir.FileName   ,
                bbddDir+'huella.fdb', bbddDir+'huella_temp.fdb')
     else
        begin
          MostrarMensaje(tmError,'Este archivo tiene una extension no reconocida (solo se reconocen .ZIP y .FBK).');
          Close;
        end;
   Close();
   // Vuelvo al menu principal  y reinicio los datos
   setCurrentDir(extractFilePath(application.exename));
   FPrincipal.IBDPrincipal.Open();
   DMSoftvet.IBQEstablecimiento.open();
   DMSoftvet.IBQSeguridad.Open();
   F := TFLogin.Create(self);
   F.SoloUsuario := false;
   F.ShowModal;
   F.Destroy;

   Try
     Try
       IBQUltActu.Close;
       IBQUltActu.Open;
       fecha_script := IBQUltActu.FieldValues['ultima'];
     Except
      on e : exception do
        fecha_script := strtodate('01/05/2014');
     End;
   Finally
     Actualizar_xml(fecha_script);

     MostrarMensaje(tmInformacion,'Se recomienda realizar una actualización del sistema');
   End;

 end
  else
    Close();

end;

procedure TFRestaurar.Actualizar_xml(fecha_script : TDate);
var XmlClientNode, Nodo : IXMLNode;
    Cant, i : Integer;
    path : String;
    Encontro : Boolean;

begin
   Path := ExtractFilePath(Application.ExeName) + 'Huella Update\UpdateClient.xml';
   xmlCliente.LoadFromFile(path);
   xmlCliente.Active := true;

   Nodo := XmlCliente.ChildNodes.FindNode('UpdateInfo');

   buscarNodo(Nodo,fecha_script);

   XMLCliente.SaveToFile(path);

end;

procedure TFRestaurar.BuscarNodo(XmlClientNode : IXMLNode; fecha : Tdate);
var
  I : Integer;
begin
  if (XmlClientNode.Attributes['tipo'] = 'tnScripts') then
  begin
    XmlClientNode.Attributes['fecha'] := datetostr(fecha);
    close;
  end
  else
    for I := 0 to XmlClientNode.ChildNodes.Count-1 do
       BuscarNodo(XmlClientNode.ChildNodes[I],fecha);

end;

function TFRestaurar.VerificarVersion(Base : String) : Boolean;
var
  cant_est : Integer;
begin
  try
    Result := true;
    IBDNueva.DatabaseName := Base;
    IBDNueva.Params.Add('user_name=SYSDBA');
    IBDNueva.Params.Add('password=masterkey');
    IBDNueva.Connected := true;
    IBTNueva.Active := true;
    IBQEstablecimientos.Close;
    IBQEstablecimientos.Open;
    IBQEstablecimientos.First;
    cant_est := 0;
    while not IBQEstablecimientos.Eof do
    begin
      {$IFDEF PRODUCTORES}
      if cant_est > 1 then
      begin
        Result := false;
        break;
      end;
      {$ELSE}
      if cant_est > 3 then
      begin
        Result := false;
        break;
      end;
      {$ENDIF}
      IBQAnimales.Close;
      IBQAnimales.ParamByName('esta').AsInteger := IBQEstablecimientos.FieldValues['id'];
      IBQAnimales.Open;
      if IBQAnimales.FieldByName('cant').AsInteger > 1000 then
      begin
        Result := false;
        break;
      end;
      Inc(cant_est);
      IBQEstablecimientos.Next;
    end;
   finally
    IBTNueva.Active := false;
    IBDNueva.Connected := false;
   end;
end;

procedure TFRestaurar.GuardarFechasArchivo(fecha : TDate);
var
  arch : TextFile;
begin
  try
    assignfile(arch, ExtractFilePath(Application.ExeName)+'\fechas.hll');
    rewrite(arch);
    writeln(arch,DateToStr(fecha));
    closefile(arch);
  except
  end;
end;

procedure TFRestaurar.GuardarCantidadEjecuciones(ce : Integer);
var
  arch : TextFile;
begin
  try
    assignfile(arch, ExtractFilePath(Application.ExeName)+'\ce.hll');
    rewrite(arch);
    writeln(arch,IntToHex(ce,3));
    closefile(arch);
  except
  end;
end;
// Resetea las variables para definir el progreso
procedure TFRestaurar.startProgress();
begin
   percentage := 0;
   lastUpdate := now();
end;


procedure TFRestaurar.showProgress( cartel : TCartel;mess : string);
begin
//Para reducir el fliqueo, no actualizo todos los mensajes
 if MilliSecondsBetween(now, lastUpdate)<200 then exit;
  lastUpdate := now();

 if AnsiPos('RESTORING DOMAIN', uppercase(mess)) >= 1 then
   percentage :=max(percentage, 20)
 else
 if AnsiPos('RESTORING COLUMN', uppercase(mess)) >= 1 then
   percentage := max(percentage, 45)
 else
 if AnsiPos('RESTORING PARAMETER', uppercase(mess)) >= 1 then
   percentage := max(percentage, 70)
 else
 if AnsiPos('RESTORING INDEX', uppercase(mess)) >= 1 then
   max(percentage, 80)
 else
 if AnsiPos('RESTORING PRIVILEGE', uppercase(mess)) >= 1 then
   max(percentage, 90)
 else
 if AnsiPos('RESTORING CONSTRAINT', uppercase(mess)) >= 1 then
   max(percentage, 95);

 cartel.ThConexion.FormBase.ProgressBar1.Position := percentage;
// cartel.ThConexion.FormBase.Label2.Caption := 'Procesando '+intToStr(percentage)+'%.['+mess+']';
 Application.ProcessMessages();
end;


function TFRestaurar.RestoreFromNetAsService(srvIP, backupDIR, userDst ,tmpDst : String) : boolean   ;
var dirTMP, dirFinal : string;
    cartel : TCartel;
begin
result := false;
cartel:= TCartel.getInstance();
cartel.abrircartel('Restaurando base de datos ...');
cartel.ThConexion.FormBase.ProgressBar1.Max := 100;
cartel.ThConexion.FormBase.ProgressBar1.min := 0;
cartel.ThConexion.FormBase.ProgressBar1.Visible := true;

startProgress();
try

with IBRestoreService1 do
  begin
// You have to setup the IBRestoreService1.ServerName property if the IBRestoreService1.Protocol is not Local
    ServerName := srvIP;
    LoginPrompt := False;
    Protocol := TProtocol(0);
    Params.Add('user_name=sysdba');
    Params.Add('password=masterkey');
    Active := True;
    Verbose := True;
    Options := [Replace, UseAllSpace];
    PageBuffers := 3000;
    PageSize := 4096;

    DatabaseName.clear();
    DatabaseName.add( tmpDst);
    BackupFile.clear();
    BackupFile.Add(backupDIR);   (* error, must be: BackupFile.Add('c:\temp\e1.gbk=2048');   *)

    ServiceStart;

    While not Eof do
    begin
        lbProgress.caption := 'PROCESANDO.['+GetNextLine()+']';
        showProgress(cartel, GetNextLine());
        application.ProcessMessages();
    end;
      if (uppercase(srvIP)='LOCALHOST') or (srvIP ='') then
      begin
      dirTMP :=( tmpDst);
      dirFinal :=( userDst);
      end
      else
      begin
      cartel.ThConexion.FormBase.ProgressBar1.Position := 80;
      dirTMP :=extractFilePath( tmpDst);
      dirTMP := copy(dirTMP, 4,length(dirTMP));
      dirTMP  :='\\'+ srvIP + '\'+dirTMP + ExtractFileName(tmpDst) ;

      cartel.ThConexion.FormBase.ProgressBar1.Position := 90;
      dirFinal :=extractFilePath( userDst);
      dirFinal := copy(dirFinal, 4,length(dirFinal));
      dirFinal  :='\\'+ srvIP + '\'+dirFinal + ExtractFileName(userDst) ;
      end;
      FPrincipal.IBDPrincipal.Close;

      cartel.ThConexion.FormBase.ProgressBar1.Position := 95;
      cartel.ThConexion.FormBase.ProgressBar1.Repaint;
      cartel.ThConexion.FormBase.ProgressBar1.Refresh;

      Active := False;
      Sleep(2000);
      DeleteFile(dirFinal);


      //Si no se pudo manipular el archivo
      if fileExists(dirFinal) then
      begin
        MostrarMensaje(tmInformacion,'El sistema no pudo reemplazar la Base actual. Verifique los permisos y si existen otros usuarios conectados.');
        deleteFile(dirTMP);
        result := false;
      end
      else
      if fileExists(dirTMP) then
       begin
          RenameFile(dirTMP, dirFinal);
          FPrincipal.IBDPrincipal.Open;
          result := true;
      end
      else
      begin
        MostrarMensaje(tmInformacion,'El sistema no pudo generar el archivo temporal. Verifique los permisos y si existen otros usuarios conectados.');
        result:= false;
      end;

  end;

except
    on e:Exception do
       MostrarMensaje(tmInformacion,'Ha ocurrido un error y no se realizo la restauracion.' + e.message);
    end;
    cartel.cerrarcartel();
    cartel.FreeInstance();

end;


procedure TFRestaurar.BBRestaurarClick(Sender: TObject);
var i, ind, seleccionado: integer;
    textoFecha, nombreArchivo,  nombre_archivo_origen : string;
    ArchivoIni : TiniFile;
    pathAplicacion : String;
    fecha : TDate;
    srv ,bckname,zipBck, bckDir,archtmp, Escritorio,bbddDir : String;
  {$IFDEF DEMO}
    ce: integer;
{$ENDIF}
begin
  inherited;
  RestoreFromNetAsService(  FPrincipal.ServidorBD ,''   ,
              FPrincipal.DirBD, extractFilePath( FPrincipal.DirBD)+'huella_temp.fdb')  ;

end;

procedure TFRestaurar.BBCancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFRestaurar.BBOtroDirectorioClick(Sender: TObject);
var
  nombre_archivo_origen,archivo : String;
  pathAplicacion,driveAplicacion : String;
  extension: String;
  msje: String;
  fecha : TDate;
  i:integer;
  puede_cambiar : Boolean;
{$IFDEF DEMO}
  ce: integer;
{$ENDIF}
begin
  inherited;
  puede_cambiar := true;

  FPrincipal.IBTPrincipal.CommitRetaining;
  if (FPrincipal.ServidorBD = '') then
    FPrincipal.ServidorBD := 'LOCALHOST';

  if   (uppercase(FPrincipal.ServidorBD) = 'LOCALHOST') then
  begin
      if FPrincipal.DirBD <>'' then
        pathAplicacion := ExtractFilePath(FPrincipal.DirBD)
      else
        pathAplicacion := ExtractFilePath(Application.ExeName);
  end
  else
  begin
       pathAplicacion :=extractFilePath( FPrincipal.DirBD);
       pathAplicacion := copy(pathAplicacion, 4,length(pathAplicacion));
       pathAplicacion  :='\\'+  FPrincipal.ServidorBD + '\'+pathAplicacion ;
  end;

  driveAplicacion:= ExtractFileDrive(Application.ExeName);
  nombre_archivo_origen := ODCambiarDir.FileName;
 // Extraigo el contenido del archivo
  if ansilowercase(ExtractFileExt(nombre_archivo_origen))='.zip' then
  begin
     unzipper.FileName:=nombre_archivo_origen;
     unzipper.BaseDirectory:=driveAplicacion;
     for i:=0 to unzipper.Count-1 do
     begin
         if (Lowercase(ExtractFileExt(unzipper.Items[i].FileName))='.fdb') or
            (Lowercase(ExtractFileExt(unzipper.Items[i].FileName))='.bkp') then
         begin
              archivo:=unzipper.Items[i].FileName;
         end
         else if (Lowercase(ExtractFileExt(unzipper.Items[i].FileName))='.fbk') then
         begin
              archivo:=unzipper.Items[i].FileName;
         end;
     end;
  end;
 // Si es un formato posible
  if archivo<>'' then
  begin
     extension := uppercase(ExtractFileExt(archivo));
     // Si el archivo que extraigo es del ipo FBK
          if (extension = '.FBK') or
             (extension = '.FDB') then
          begin
                unzipper.BaseDirectory :=  pathAplicacion;
                unzipper.ExtractFiles(archivo);
                {$IFDEF PEN}
                  // Si es PEN hago la restauracion comun
                  FPrincipal.IBDPrincipal.Connected := False; //desconecto la base
                  DelArchivosEstablecimientos(pathAplicacion);
                  DeleteFile(pathAplicacion+'huella.fdb');
                  unzipper.BaseDirectory :=  pathAplicacion;
                  unzipper.ExtractFiles(archivo);
                {$ELSE}
                if not (RestoreFromNetAsService(FPrincipal.ServidorBD, pathAplicacion+archivo,
                          pathAplicacion+'huella.fdb', pathAplicacion+'huella_temp.fdb')) then
                          // no pude restaurar
                            exit;
                {$ENDIF}
          end
          else
       // Si extraigo el archivo FDB
          if (archivo = 'huella.fdb') then
          begin
            FPrincipal.IBDPrincipal.Connected := False; //desconecto la base

            DelArchivosEstablecimientos(pathAplicacion);
            DeleteFile(pathAplicacion+'huella.fdb');
            unzipper.BaseDirectory :=  pathAplicacion;
            unzipper.ExtractFiles(archivo);
       end
       else
       // No encintre nada
       begin
           MostrarMensaje(tmInformacion, 'No se encontro ninguna Base de Datos en el archivo');
           exit;
       end
   end
    else
     begin
           MostrarMensaje(tmInformacion, 'No se encontro ninguna Base de Datos en el archivo');
           exit;
     end;
     // Ahora si anduvo
     FPrincipal.IBDPrincipal.Connected := true;
     GuardarFechasArchivo(fecha);
     {$IFDEF DEMO}
     GuardarCantidadEjecuciones(ce);
     {$ENDIF}
     MostrarMensaje(tmInformacion, 'Restauración Exitosa.');


end;

procedure TFRestaurar.modificarCantidad(inc:Integer;ArchivoIni : TiniFile);
var
 Cantidad:Integer;
begin
    Cantidad := ArchivoIni.ReadInteger ('Backup','Cantidad',0);
    ArchivoIni.WriteInteger ('Backup','Cantidad',Cantidad + inc);
end;


procedure TFRestaurar.BBEliminarClick(Sender: TObject);
var
   i,ind, seleccionado: integer;
   nombreArchivo: string;
   ArchivoIni : TiniFile;
   pathAplicacion : String;
begin
  nombreArchivo := '';
  pathAplicacion:= ExtractFilePath(Application.ExeName);
  seleccionado:= -1;
  i := LBArchivos.Items.Count;
  for ind := 0 to i-1 do
     if LBArchivos.Selected[ind] then
          seleccionado := ind;

  if seleccionado <> -1 then
    if(MostrarMensaje(tmConsulta, 'Eliminar el registro seleccionado?')=mrYes) then
    begin
      ArchivoIni := TIniFile.Create (pathAplicacion+'huella.ini');

      //modifica la cantidad de archivos en el .ini
      modificarCantidad(-1, ArchivoIni);

      //Borra el archivo de la carpeta Backup
      nombreArchivo := ArchivoIni.ReadString ('Backup','Archivo'+IntToStr(seleccionado+1),'');
      if(FileExists(pathAplicacion+'Backup\'+nombreArchivo)) then
        DeleteFile(pathAplicacion+'Backup\'+nombreArchivo);

      //elimina la entrada del archivo .ini
      BorrarEntrada(seleccionado+1, ArchivoIni);

      //remonbrar la entradas
      renombrarEntradas(seleccionado,ArchivoIni, i);

      ArchivoIni.Free; //cierra el archivo .INI
      limpiarArchivos(nil);
    end
    else
      LBArchivos.ClearSelection;
end;

procedure TFRestaurar.renombrarEntradas(seleccionado:Integer; ArchivoIni:TiniFile; cantidad:Integer);
var
  ind:Integer;
  archivo, fecha, descripcion : String;
begin
 for ind := seleccionado+2  to Cantidad do
    begin
        archivo:=ArchivoIni.ReadString ('Backup','Archivo'+ IntToStr(ind),'');
        fecha:=ArchivoIni.ReadString ('Backup','Fecha'+ IntToStr(ind),'');
        descripcion:=ArchivoIni.ReadString ('Backup','Descripcion'+IntToStr(ind),'');

        BorrarEntrada(ind, ArchivoIni);

        ArchivoIni.WriteString('Backup','Archivo'+ IntToStr(ind-1), archivo);
        ArchivoIni.WriteString('Backup','Fecha'+ IntToStr(ind-1), fecha);
        ArchivoIni.WriteString('Backup','Descripcion'+ IntToStr(ind-1), descripcion);
    end;

end;

procedure TFRestaurar.DelArchivosEstablecimientos(Directorio : String);
var
  sr : TSearchRec;
begin
  if FindFirst(Directorio + '*',faDirectory, sr) = 0 then
  repeat
    if (AnsiContainsStr(sr.Name,'temp-')) then
    begin
      SetFileAttributes(PChar(Directorio+sr.Name),FILE_ATTRIBUTE_NORMAL);
      DeleteFile(Directorio+sr.Name);
    end;
  until FindNext(sr) <> 0;
end;

procedure TFRestaurar.BorrarEntrada(ind:Integer; ArchivoIni:TiniFile);
begin
    ArchivoIni.DeleteKey('Backup','Archivo' + IntToStr(ind));
    ArchivoIni.DeleteKey('Backup','Descripcion' + IntToStr(ind));
    ArchivoIni.DeleteKey('Backup','Fecha' + IntToStr(ind));
end;

end.
