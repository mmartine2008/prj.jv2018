unit UPresentacion;

interface
//{$DEFINE EC}
//{$DEFINE DEMO}


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, DB, IBCustomDataSet, IBStoredProc, IniFiles, UUniversal, Registry, Ufunctions,
  PngImage, JvExControls, JvLabel, ImgList, PngImageList;

type
  TFPresentacion = class(TForm)
    IPresentacion: TImage;
    Timer1: TTimer;
    IBSPEventoTemporal: TIBStoredProc;
    LabelLinea1: TLabel;
    LabelLinea2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LTipoVersionLicenciaCentro1: TLabel;
    LTipoVersionLicenciaCentro: TJvLabel;
    IVersion: TImage;
    PLVersion: TPngImageList;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure EventoTemporal;
    function controlRegistro:boolean;
  public
  end;

var
  FPresentacion: TFPresentacion;

implementation

uses UPrincipal, uTiposGlobales,UMensajeHuella, UTraduccion;

{$R *.dfm}

(*
  Ejecucion del evento temporal de arranque:
    1: Cambio de categorias por edad
*)
procedure TFPresentacion.EventoTemporal;
var ArchivoIni : TiniFile;
    Ultima : TDate;
begin
  try
    begin
      ArchivoIni := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
      Ultima := ArchivoIni.ReadDate('Sistema','Ultimo proceso',0);
      if (Ultima <> Date) then
        begin
          ArchivoIni.WriteDateTime('Sistema','Ultimo proceso', Date);
          IBSPEventoTemporal.ExecProc;
          fprincipal.IBTPrincipal.CommitRetaining;
          TIcon.Create
        end
    end
  except on e:Exception do
  end
end;

(*
  Al mostrar controlamos que el sistema esté bien instalado,
  de no ser asi cerramos todo
*)
procedure TFPresentacion.FormShow(Sender: TObject);
var Registro : TRegistry;
    LicenciaREG : string;
    ArchivoIni : TiniFile;
    usuarioINI : string;
begin
  LabelLinea1.Caption := Traducir('Se autoriza el uso de este producto a:');
  LabelLinea2.Caption := Traducir('Identificación de producto:');
  {$IFDEF PEN} //esto es lo que agregue para la version pen drive
      { PARA LA version PENDRIVE, NO SE MUESTRAN DATOS DE USUARIO Y LICENCIA}
        ArchivoIni := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
        usuarioINI := ArchivoIni.ReadString('Sistema','usuario','');
        LabelLinea1.Caption := LabelLinea1.Caption + ' '+usuarioINI;
        LabelLinea2.Caption := '';

        Timer1.Enabled := False;
        IPresentacion.Picture.LoadFromFile(pathDirExe+'imagenes/iniciando.png');
        sleep(1000);
        EventoTemporal;
        Timer1.Enabled := True;

        {$IFDEF TERMINAL}
          LTipoVersionLicenciaCentro.Caption:= Traducir('');
          
        {$ELSE}
          {$IFDEF DEMO}
            {$IFDEF EC}
              LTipoVersionLicenciaCentro.Caption:= Traducir('Educación Continua');
            {$ELSE}
              LTipoVersionLicenciaCentro.Caption:= Traducir('');
            {$ENDIF}
          {$ELSE}
            LTipoVersionLicenciaCentro.Caption:= Traducir('MODULO PENDRIVE');
          {$ENDIF}
        {$ENDIF}
        PLVersion.GetBitmap(3,IVersion.Picture.Bitmap);
  {$ELSE}
  if (controlRegistro) then
    begin
      ArchivoIni := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
      usuarioINI := ArchivoIni.ReadString('Sistema','usuario','');
      Registro := TRegistry.Create;
      Registro.RootKey := HKEY_CLASSES_ROOT;
      {$IFDEF DEMO}
      { PARA LA DEMO, NO SE MUESTRAN DATOS DE USUARIO Y LICENCIA}
        LabelLinea1.Caption := '';
        LabelLinea2.Caption := '';
      {$ELSE}
      {$IFDEF PRODUCTORES}
             if Registro.OpenKey('Software\Huella\Prod', False) then begin
      {$ELSE}
             if Registro.OpenKey('Software\Huella\Vet', False) then begin
      {$ENDIF}
        LicenciaREG := Registro.ReadString('licencia');
        LabelLinea1.Caption := LabelLinea1.Caption + ' '+usuarioINI;
        LabelLinea2.Caption := LabelLinea2.Caption + ' '+LicenciaREG;
      end;
{$ENDIF}

      Timer1.Enabled := False;
      IPresentacion.Picture.LoadFromFile(pathDirExe+'imagenes/iniciando.png');
      sleep(1000);
      EventoTemporal;
      Timer1.Enabled := True;
    end
  else
    begin
       MostrarMensaje(tmError, 'Huella no ha sido instalado correctamente y no puede ejecutarse');
       Fprincipal.Close;
       Application.Terminate;
    end;

    LTipoVersionLicenciaCentro.Caption:= '';
    {$IFDEF PRODUCTORES}
       LTipoVersionLicenciaCentro.Font.Color:= RGB(82,189,115);
    {$ELSE}
       LTipoVersionLicenciaCentro.Font.Color:= RGB(4,138,131);
    {$ENDIF}

    {$IFDEF PEN}
       {$IFDEF TERMINAL}
        LTipoVersionLicenciaCentro.Caption:= Traducir('');
      {$ELSE}
        {$IFDEF DEMO}
          {$IFDEF EC}
            LTipoVersionLicenciaCentro.Caption:= Traducir('Educación Continua');
          {$ELSE}
            LTipoVersionLicenciaCentro.Caption:= Traducir('Versión DEMO');
          {$ENDIF}
          {$ELSE}
            LTipoVersionLicenciaCentro.Caption:= Traducir('MODULO PENDRIVE');
          {$ENDIF}
      {$ENDIF}
    {$ELSE}
      {$IFDEF DEMO}
        {$IFDEF EC}
            LTipoVersionLicenciaCentro.Caption:= Traducir('Educación Continua');
          {$ELSE}
            LTipoVersionLicenciaCentro.Caption:= Traducir('Versión DEMO');
          {$ENDIF}
      {$ELSE}
      if (FPrincipal <> nil) then
        if (FPrincipal.TipoVersionLicencia = 'Basico') then
          begin
            LTipoVersionLicenciaCentro.Caption:= Traducir('');
          end
         else
          if (FPrincipal.TipoVersionLicencia = 'Estandar') then
            begin
              LTipoVersionLicenciaCentro.Caption:= Traducir('');
            end
           else
            if (FPrincipal.TipoVersionLicencia = 'Full') then
              begin
                LTipoVersionLicenciaCentro.Caption:= '';
              end;
      {$ENDIF}
    {$ENDIF}
{$ENDIF}
  IVersion.BringToFront;
end;

(*
  Al dar el reloj cerramos la presentacion
*)
procedure TFPresentacion.Timer1Timer(Sender: TObject);
begin
  Close;
end;

(*
  Al cerrar la presentacion paramos el reloj
*)
procedure TFPresentacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
end;

(*
  Controla que las variables Empresa, Usuario y Version estén en el regisro,
  además Empresa y Usuario deben coincidir con lo que está en huella.ini
*)
function TFPresentacion.controlRegistro: boolean;
var ArchivoIni : TiniFile;
    Registro : TRegistry;
    usuarioINI : string;
    empresaINI : string;
    usuarioREG : string;
    empresaREG : string;
    versionREG : string;
    retorno : boolean;
    _1,_2,_3 : string;
    versionINI : string;
begin
  retorno := true;

  // recupero los datos del archivo ini
  ArchivoIni := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
  usuarioINI := ArchivoIni.ReadString('Sistema','usuario','');
  empresaINI := ArchivoIni.ReadString('Sistema','empresa','');
  versionINI := ArchivoIni.ReadString('Sistema','version','');//

  // recupero los datos del registro
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_CLASSES_ROOT;
{$IFDEF DEMO}
  if Registro.OpenKey('Software\Huella\Demo', False) then begin
  //{$IFDEF PRODUCTORES}
  //    if Registro.OpenKey('Software\Huella\Demo\Prod', False) then begin
  //{$ELSE}
  //  if Registro.OpenKey('Software\Huella\Demo\Vet', False) then begin
  //{$ENDIF}
{$ELSE}
  {$IFDEF PRODUCTORES}
//    {$IFDEF BASICO}
//      if Registro.OpenKey('Software\Huella\Base\Prod', False) then begin
//    {$ELSE}
//      {$IFDEF ESTANDAR}
//        if Registro.OpenKey('Software\Huella\Estandar\Prod', False) then begin
//      {$ELSE}
         if Registro.OpenKey('Software\Huella\Prod', False) then begin
//      {$ENDIF}
//    {$ENDIF}
  {$ELSE}
//    {$IFDEF BASICO}
//      if Registro.OpenKey('Software\Huella\Base\Vet', False) then begin
//    {$ELSE}
//      {$IFDEF ESTANDAR}
//        if Registro.OpenKey('Software\Huella\Estandar\Vet', False) then begin
//      {$ELSE}
         if Registro.OpenKey('Software\Huella\Vet', False) then begin
//      {$ENDIF}
//    {$ENDIF}
  {$ENDIF}
{$ENDIF}
    usuarioREG := Registro.ReadString('usuario');
    empresaREG := Registro.ReadString('empresa');
    versionREG := Registro.ReadString('version');
    if Registro.ValueExists('TipoBase') then
      FPrincipal.TipoBase := 1
    else
      FPrincipal.TipoBase := 0;
    _1 := trim(encriptar(usuarioINI,49));
    _2 := trim(encriptar(empresaINI,49));
    _3 := trim(encriptar(versionINI,49));//

//    if ((trim(encriptar(usuarioINI,49)) <> usuarioREG) or (trim(encriptar(empresaINI,49)) <> empresaREG) or (versionREG = '')) then
    if ((trim(encriptar(usuarioINI,49)) <> usuarioREG) or (trim(encriptar(empresaINI,49)) <> empresaREG) or (trim(encriptar(versionINI,49)) <> versionREG)) then
      retorno := false;
  end else
    retorno := false;
  result := true;//retorno;
end;

end.
