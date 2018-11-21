unit ULogin;

interface

//{$DEFINE EC}
//{$DEFINE DEMO}



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  DBCtrls, UDBLookupComboBoxAuto, DB, IBCustomDataSet, IBQuery, uTiposGlobales,
  IBStoredProc, UFunctions, WinXP, DataExport, DataToXLS, jpeg, mxProtector,
  JvExExtCtrls, JvImage, PngImage, JvGIF, AdvEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, JvExControls, JvLabel, ImgList, PngImageList;

type
  TFLogin = class(TFUniversal)
    PControles: TPanel;
    LUsuario: TLabel;
    LClave: TLabel;
    LEstablecimiento: TLabel;
    EClave: TEdit;
    DBLCBEstablecimiento: TDBLookupComboBoxAuto;
    DBLCBUsuario: TDBLookupComboBoxAuto;
    LCambiarServidor: TLabel;
    IBQUpdateCantEjecuciones: TIBQuery;
    IBQGetCantEjecuciones: TIBQuery;
    IFondoBB: TImage;
    JvAceptar: TJvImage;
    LAceptar: TLabel;
    JvCancelar: TJvImage;
    Label2: TLabel;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EClaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    function UsuarioCorrecto:boolean;
    function UsuarioLogueado:boolean;
    procedure cerrarFormulario;
    procedure InicializarLogin();
    procedure VerificarCaducidad();
  public
    { Public declarations }
    SoloUsuario : Boolean;
  end;

var
  FLogin: TFLogin;
  aceptar : boolean;

implementation

{$R *.dfm}

uses UDMSoftvet, UPrincipal, UMensajeHuella;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  inherited;
  InicializarLogin();
end;

procedure TFLogin.InicializarLogin;
begin
  try
    Image8.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\FondoLogin.png');
    IFondoBB.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\IBienvenida.jpg');
    Image5.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\Tope.jpg');
    Image6.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\logo_huella.png');
    SoloUsuario := false;
    aceptar := false;
    DMSoftvet.IBQEstablecimiento.Open;
    DMSoftvet.IBQEstablecimiento.Last;
    DMSoftvet.IBQEstablecimiento.First;
    DMSoftvet.IBQUsuario.Open;
    DMSoftvet.IBQUsuario.Last;
    DMSoftvet.IBQUsuario.First;
    DBLCBUsuario.KeyValue := 1;
    DBLCBEstablecimiento.KeyValue := DMSoftvet.IBQEstablecimiento.FieldValues['ID_ESTABLECIMIENTO'];
    
  except
  end;
end;

procedure TFLogin.BBAceptarClick(Sender: TObject);
begin
  inherited;
  if (DBLCBEstablecimiento.KeyValue <> null) and (DBLCBUsuario.KeyValue <> null) and (EClave.Text <> '') then
     begin
      FPrincipal.UsuarioActual := DBLCBUsuario.KeyValue;
      FPrincipal.EstablecimientoActual := DBLCBEstablecimiento.KeyValue;

      FPrincipal.TipoActividad := ttaCabania;
      FPrincipal.MAX_ANIMALES := 5;
      FPrincipal.MAX_EVENTOS := 6;
      FPrincipal.MAX_REPORTES := 6;

      if DMSoftvet.IBQEstablecimiento.FieldValues['actividad'] = null then
      begin
        if (FPrincipal.TipoVersionLicencia = 'Estandar') or (FPrincipal.TipoVersionLicencia = 'Basico') then
        begin
          FPrincipal.TipoActividad := ttaCria;
          FPrincipal.MAX_ANIMALES := 4;
          FPrincipal.MAX_EVENTOS := 6;
          FPrincipal.MAX_REPORTES := 6;
        end
        else
        begin
          FPrincipal.TipoActividad := ttaCabania;
          FPrincipal.MAX_ANIMALES := 5;
          FPrincipal.MAX_EVENTOS := 6;
          FPrincipal.MAX_REPORTES := 6;
        end;
      end
      else
      begin
        case DMSoftvet.IBQEstablecimiento.FieldValues['actividad'] of
          1 : begin
                FPrincipal.TipoActividad := ttaCria;
                FPrincipal.MAX_ANIMALES := 4;
                FPrincipal.MAX_EVENTOS := 6;
                FPrincipal.MAX_REPORTES := 6;
              end;
          2 : begin
                FPrincipal.TipoActividad := ttaInvernada;
                FPrincipal.MAX_ANIMALES := 4;
                FPrincipal.MAX_EVENTOS := 6;
                FPrincipal.MAX_REPORTES := 6;
              end;
          3 : begin
                FPrincipal.TipoActividad := ttaCabania;
                FPrincipal.MAX_ANIMALES := 5;
                FPrincipal.MAX_EVENTOS := 6;
                FPrincipal.MAX_REPORTES := 6;
              end;
          4 : begin
                FPrincipal.TipoActividad := ttaFeedlot;
                FPrincipal.MAX_ANIMALES := 3;
                FPrincipal.MAX_EVENTOS := 3;
                FPrincipal.MAX_REPORTES := 4;
              end;
        end;
      end;  

      if NOT UsuarioCorrecto then
         begin
            MostrarMensaje(tmError, 'Clave incorrecta !!');
            EClave.Clear;
            EClave.SetFocus;
            aceptar := False;
         end
        else
          if UsuarioLogueado then
             begin
                MostrarMensaje(tmError, 'Este usuario se encuentra logueado en el sistema.');
                EClave.Clear;
                EClave.SetFocus;
                aceptar := False;
             end
           else
             begin
               DMSoftvet.IBQSeguridad.Close;
               DMSoftvet.IBQSeguridad.ParamByName('Usuario').AsInteger := DMSoftvet.IBQUsuario.FieldValues['id_usuario'];
               DMSoftvet.IBQSeguridad.Open;
               aceptar := true;

               FPrincipal.SetLogueo(DBLCBUsuario.KeyValue,'S');

               {$IFDEF DEMO}
                 h.Hide;
                 h.Destroy;  //destruye el hint
               {$ENDIF}
               close;
             end
     end
    else begin
      MostrarMensaje(tmError, 'Información Errónea para ingreso al Sistema');
    end
end;

procedure TFLogin.BBCancelarClick(Sender: TObject);
begin
  inherited;
  if SoloUsuario then
  begin
    aceptar := true;
    Close;
  end
  else
  begin
    FPrincipal.Close;
    Application.Terminate;
  end;
end;

// controlar clave y demás de un usuario.
function TFLogin.UsuarioCorrecto: boolean;
var lclave : string;
begin
    UsuarioCorrecto := false;
    lclave := DMSoftvet.IBQUsuario.FieldValues['clave'];
    if (lclave = encriptar(EClave.Text, 19)) then
      UsuarioCorrecto := true;
end;

function TFLogin.UsuarioLogueado: boolean;
begin
  Result := false;
end;

procedure TFLogin.FormShow(Sender: TObject);
var t: TRect;
begin
  inherited;
  VerificarCaducidad();
  if SoloUsuario then
  begin
    LEstablecimiento.Enabled := false;
    DBLCBEstablecimiento.Enabled := false;
  end;

  Itope.Visible := false;
  //IFondoBB.Picture.LoadFromFile(pathDirExe+'imagenes/logologin.png');

  if (FPrincipal.TipoVersionLicencia = 'Basico') then
    begin
      EClave.Text:= 'huella';
      DBLCBUsuario.Enabled:= false;
      EClave.Enabled:= false;
      LUsuario.Enabled:= false;
      LClave.Enabled:= false;
      DBLCBUsuario.Visible:= false;
      EClave.Visible:= false;
      LUsuario.Visible:= false;
      LClave.Visible:= false;

      LEstablecimiento.Top:= LClave.Top;
      DBLCBEstablecimiento.Top:= EClave.Top;

    end
  else
    EClave.SetFocus;

  LCambiarServidor.Visible:= false;

  {$IFDEF DEMO}
    t.Left:=FLogin.Left+FLogin.Width - 20;
    t.Top:=FLogin.Top + EClave.Top + 20;
    t.Right:=FLogin.Left + FLogin.Width + 70;
    t.Bottom:=FLogin.Top + EClave.Top + 80;

    {$IFDEF EC}
      h.ActivateHint(t,'La clave para ingresar a Huella es "huella"');

    {$ELSE}
      h.ActivateHint(t,'La Clave Para la Version DEMO es "huella"');
      
    {$ENDIF}
    h.Show;
    EClave.Text := 'huella';
  {$ENDIF}

  if DMSoftvet.IBQEstablecimiento.IsEmpty then
      cerrarFormulario;
end;

procedure TFLogin.cerrarFormulario;
begin
     close;
end;

procedure TFLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose := aceptar;
end;

procedure TFLogin.VerificarCaducidad;
begin
{$IFDEF DEMO}
  {$IFDEF EC}
     IBQGetCantEjecuciones.Close;
     IBQGetCantEjecuciones.Open;
     if not(IBQGetCantEjecuciones.Eof) then
       begin
        if (IBQGetCantEjecuciones.FieldByName('ce').AsInteger = 0) then
           begin
              JvAceptar.Visible := false;
              LAceptar.Visible := false;
              EClave.OnKeyDown := nil;
              IBQUpdateCantEjecuciones.ParamByName('ce').Value:= IBQGetCantEjecuciones.FieldByName('ce').AsInteger;
              MostrarMensaje(tmInformacion,'Ha superado la cantidad de ejecuciones permitidas. Ingrese a http://www.softhuella.com.ar para más información.');
           end
         else
          begin
            //BBAceptar.Enabled:=TRUE;
            IBQUpdateCantEjecuciones.ParamByName('ce').Value:= IBQGetCantEjecuciones.FieldByName('ce').AsInteger - 1;
          end;
       end;
     try
       IBQUpdateCantEjecuciones.ExecSQL;
       FPrincipal.IBTPrincipal.CommitRetaining;
     except on e:exception do
        FPrincipal.IBTPrincipal.RollbackRetaining;
     end;
     //ProgressBar.Max := 20;//mxProtector.MaxStartNumber;//si es DEMO TRADICIONAL
     //ProgressBar.Position := IBQGetCantEjecuciones.FieldByName('ce').AsInteger;
  {$ENDIF}
{$ELSE}
     //lbl_Remaining.Visible:= false;
     //ProgressBar.Visible:= false;
{$ENDIF}
end;

procedure TFLogin.EClaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BBAceptarClick(nil);
end;

end.
