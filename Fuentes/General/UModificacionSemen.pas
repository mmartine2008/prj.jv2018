unit UModificacionSemen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, Buttons, ActnList, ComCtrls, ExtCtrls,
  EditAuto, DateTimePickerAuto, DB, IBCustomDataSet, IBStoredProc, DBCtrls,
  UDBLookupComboBoxAuto, Mask, MemoAuto, ComboBoxAuto, WinXP, DataExport,
  DataToXLS, IBQuery, JvExControls, JvLabel, JvGIF, PngImage, jpeg,
  ImgList, PngImageList, JvExExtCtrls, JvImage;

type
   TFModificacionSemen = class(TFUniversal)
    PControles: TPanel;
    LCantidad: TLabel;
    PBotones: TPanel;
    BBCancelar: TBitBtn;
    BBAceptar: TBitBtn;
    EACANTIDAD: TEditAuto;
    LPrecio: TLabel;
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    IBSPSemen: TIBStoredProc;
    EAPrecio: TEditAuto;
    LSigno: TLabel;
    Panel1: TPanel;
    LAnimal: TLabel;
    GroupBox1: TGroupBox;
    MAObservacion: TMemoAuto;
    LCentros: TLabel;
    DBLCBACentros: TDBLookupComboBoxAuto;
    BBAyuda: TBitBtn;
    LCertificado: TLabel;
    EACERTIFICADOS: TEditAuto;
    IFondoB: TImage;
    IAyuda: TImage;
    LAyuda: TLabel;
    ITerminar: TImage;
    LTerminar: TLabel;
    LCancelar: TLabel;
    ICancelar: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure EACANTIDADKeyPress(Sender: TObject; var Key: Char);
    procedure EACANTIDADExit(Sender: TObject);
    procedure EAPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure EAPrecioExit(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LCentrosClick(Sender: TObject);
    procedure LCentrosMouseEnter(Sender: TObject);
    procedure LCentrosMouseLeave(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    Fsemen:Integer;
    Fanimal:Integer;
    Fcantidad: Integer;
    procedure CargarParametrosSP;

{ Public declarations }
  end;

var
  FModificacionSemen: TFModificacionSemen;

implementation

{$R *.dfm}
uses UPrincipal,uTiposGlobales, UDMSoftvet, UABMCentrosInseminacion;

procedure TFModificacionSemen.CargarParametrosSP;
begin
  IBSPSemen.ParamByName('FECHA').Value := DTPAFecha.Date;

  if(EACANTIDAD.Text = '')then
      IBSPSemen.ParamByName('NUEVACANTIDAD').AsInteger := 0
  else IBSPSemen.ParamByName('NUEVACANTIDAD').AsInteger := StrToInt(EACANTIDAD.Text);

  if(EACERTIFICADOS.Text = '')then
      IBSPSemen.ParamByName('NUEVOCERTIFICADO').AsInteger := 0
  else IBSPSemen.ParamByName('NUEVOCERTIFICADO').AsInteger := StrToInt(EACERTIFICADOS.Text);

  if(EAPrecio.Text = '')then
       IBSPSemen.ParamByName('PRECIO').Value := 0
  else IBSPSemen.ParamByName('PRECIO').Value := StrToFloat(EAPrecio.Text);

  IBSPSemen.ParamByName('SEMEN').Value := Fsemen;
  if(DBLCBACentros.Visible)then
    IBSPSemen.ParamByName('CENTRO_INSEMINACION').Value := DBLCBACentros.KeyValue
  else
    IBSPSemen.ParamByName('CENTRO_INSEMINACION').Value := Null;
  IBSPSemen.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
  IBSPSemen.ExecProc;
end;

procedure TFModificacionSemen.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQCentrosInsem.Close;
  DMSoftvet.IBQCentrosInsem.Open;
  EAPrecio.Text := FormatFloat('###0.00',0);
  DTPAFecha.DateTime := now;
  DBLCBACentros.KeyValue:= 0;
//  DTPAFecha.MaxDate:= now;    
end;

procedure TFModificacionSemen.BBAceptarClick(Sender: TObject);
begin

  FPrincipal.IBTPrincipal.CommitRetaining;
  ModalResult := mrOk;
  Application.ProcessMessages;

  //Close;
end;

procedure TFModificacionSemen.EACANTIDADKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFModificacionSemen.EACANTIDADExit(Sender: TObject);
begin
  inherited;
  if (TEditAuto(Sender).Text = '') then  TEditAuto(Sender).Text := '0';
end;

procedure TFModificacionSemen.EAPrecioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = '.') then
    Key := ',';

  if (pos(',',TEditAuto(Sender).Text)=0) then
    begin
      if not (key in ['0'..'9',',',#8]) then key:=#0;
    end
  else if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFModificacionSemen.EAPrecioExit(Sender: TObject);
begin
  inherited;
  if (EAPrecio.Text = '') then  EAPrecio.Text := FormatFloat('###0.00',0);
end;

procedure TFModificacionSemen.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
end;

procedure TFModificacionSemen.LCentrosClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMCentrosInseminacion.Create(self));
      DMSoftvet.IBQCentrosInsem.Close;
      DMSoftvet.IBQCentrosInsem.Open;
    end;
  if nroID > -1 then
  begin
    DBLCBACentros.KeyValue := nroID;
    nroID := -1;
  end;
end;

procedure TFModificacionSemen.LCentrosMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCentros.Font.Color:= $00606C02;
      LCentros.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFModificacionSemen.LCentrosMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCentros.Font.Color:= clWindowText;
      LCentros.Font.Style:= [fsUnderline];
    end;
end;

procedure TFModificacionSemen.BBCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  Application.ProcessMessages;
  
  //Close;
end;

end.

