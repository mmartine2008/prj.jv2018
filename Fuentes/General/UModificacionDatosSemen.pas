unit UModificacionDatosSemen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, PngImage, jpeg, ExtCtrls, Buttons, DBCtrls,
  UDBLookupComboBoxAuto, JvEnterTab, ImgList, PngImageList, JvGIF,
  JvExExtCtrls, JvImage;

type
  TFModificacionDatosSemen = class(TFUniversal)
    PSuperior: TPanel;
    PCentral: TPanel;
    PBotones: TPanel;
    IFondoB: TImage;
    IAyuda: TImage;
    LAyuda: TLabel;
    ITerminar: TImage;
    LTerminar: TLabel;
    LCancelar: TLabel;
    ICancelar: TImage;
    BBCancelar: TBitBtn;
    BBAceptar: TBitBtn;
    BBAyuda: TBitBtn;
    LAnimal: TLabel;
    DTPFecha: TDateTimePicker;
    ECantidadSemen: TEdit;
    ECertificadoSemen: TEdit;
    EPrecioSemen: TEdit;
    DBLCBACentrosSemen: TDBLookupComboBoxAuto;
    JvEnterAsTab1: TJvEnterAsTab;
    LFecha: TLabel;
    LCantidad: TLabel;
    LCertificado: TLabel;
    LPrecio: TLabel;
    LCentros: TLabel;
    IBSPDatosSemen: TIBStoredProc;
    LSigno: TLabel;
    LTipoBaja: TLabel;
    LCliente: TLabel;
    DBLCBATipoBaja: TDBLookupComboBoxAuto;
    DBLCBACliente: TDBLookupComboBoxAuto;
    IBQTiposBajaSemen: TIBQuery;
    IBQDatosClientes: TIBQuery;
    DSTiposBajaSemen: TDataSource;
    DSDatosClientes: TDataSource;
    ISeleccionarPartidas: TImage;
    LSeleccionarPartida: TLabel;
    IBQDatosAnimal: TIBQuery;
    LDosisDisponibles: TLabel;
    LDosisDisponiblesValue: TLabel;
    Label1: TLabel;
    ENroRemito: TEdit;
    procedure FormShow(Sender: TObject);
    procedure ITerminarClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure LCentrosMouseEnter(Sender: TObject);
    procedure LCentrosMouseLeave(Sender: TObject);
    procedure LCentrosClick(Sender: TObject);
    procedure ECantidadSemenKeyPress(Sender: TObject; var Key: Char);
    procedure ECertificadoSemenKeyPress(Sender: TObject; var Key: Char);
    procedure EPrecioSemenKeyPress(Sender: TObject; var Key: Char);
    procedure LClienteMouseEnter(Sender: TObject);
    procedure LClienteMouseLeave(Sender: TObject);
    procedure DBLCBATipoBajaCloseUp(Sender: TObject);
    procedure LClienteClick(Sender: TObject);
    procedure ISeleccionarPartidasClick(Sender: TObject);
  private
    { Private declarations }

    procedure CargarParametrosSP;
  public
    { Public declarations }
    FSemen : integer;
    FTipo : integer;
    FCantidad : integer;
  end;

var
  FModificacionDatosSemen: TFModificacionDatosSemen;
  cantidad : integer;
  precio : double;
  certificado : integer;

implementation

uses UPrincipal, uTiposGlobales, UMensajeHuella, UAbmCentrosInseminacion, UDMSoftvet, UDatosClienteComprador;//, USelectorPartidas;

{$R *.dfm}

procedure TFModificacionDatosSemen.FormShow(Sender: TObject);
begin
  inherited;

  IBQDatosClientes.Close;
  IBQDatosClientes.Open;
  IBQDatosClientes.Last;
  IBQDatosClientes.First;

  IBQTiposBajaSemen.Close;
  IBQTiposBajaSemen.Open;
  IBQTiposBajaSemen.Last;
  IBQTiposBajaSemen.First;

  ECantidadSemen.SetFocus;

  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;

  DMSoftvet.IBQCentrosInsem.Close;
  DMSoftvet.IBQCentrosInsem.Open;

//  EPrecioSemen.Text := '';
  DTPFecha.DateTime := now;
  DBLCBACentrosSemen.KeyValue:= 0;

  if (FTipo = 2) then
  begin
       LCliente.Visible := true;
       DBLCBACliente.Visible := true;
       //LCliente.Top := 138;
       //LCliente.Left := 184;
       //DBLCBACliente.Top := 136;
       //DBLCBACliente.Left := 344;

       LTipoBaja.Visible := true;
       DBLCBATipoBaja.Visible := true;
       DBLCBATipoBaja.KeyValue := 0;
       //LTipoBaja.Top := 109;
       //LTipoBaja.Left := 184;
       //DBLCBATipoBaja.Top := 106;
       //DBLCBATipoBaja.Left := 344;

       LPrecio.Visible := true;
       EPrecioSemen.Visible := true;
       LSigno.Visible := true; 
  end;

  LDosisDisponiblesValue.Caption := inttostr(Fcantidad)+')';
end;

procedure TFModificacionDatosSemen.ITerminarClick(Sender: TObject);
var aux_cant : integer;
begin
  inherited;

  aux_cant := StrToInt(ECantidadSemen.Text);

  if (FTipo = 2) and (FCantidad < aux_cant) then
    begin
       MostrarMensaje(tmError,'La cantidad de dosis a dar de baja, es mayor al stock de este animal.');
       ECantidadSemen.SetFocus;
    end;

  try
      CargarParametrosSP;
      FPrincipal.IBTPrincipal.CommitRetaining;
  except
      FPrincipal.IBTPrincipal.RollbackRetaining;
      MostrarMensaje(tmError,'Se ha producido una falla. Los datos no han sido cargados.');
  end;
    Close;

end;

procedure TFModificacionDatosSemen.ICancelarClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFModificacionDatosSemen.CargarParametrosSP;
begin
  IBSPDatosSemen.ParamByName('FECHA').Value := DTPFecha.Date;

  if(ECantidadSemen.Text = '')then
      IBSPDatosSemen.ParamByName('NUEVACANTIDAD').AsInteger := 0
  else
      IBSPDatosSemen.ParamByName('NUEVACANTIDAD').AsInteger := StrToInt(ECantidadSemen.Text);

  if(ECertificadoSemen.Text = '')then
      IBSPDatosSemen.ParamByName('NUEVOCERTIFICADO').AsInteger := 0
  else
      IBSPDatosSemen.ParamByName('NUEVOCERTIFICADO').AsInteger := StrToInt(ECertificadoSemen.Text);

  if (EPrecioSemen.Visible) then
  begin
    if(EPrecioSemen.Text = '')then
        IBSPDatosSemen.ParamByName('PRECIO').Value := 0
    else
        IBSPDatosSemen.ParamByName('PRECIO').Value := StrToFloat(EPrecioSemen.Text);
  end
  else
    IBSPDatosSemen.ParamByName('PRECIO').Value := 0;

  IBSPDatosSemen.ParamByName('SEMEN').Value := Fsemen;
  IBSPDatosSemen.ParamByName('TIPO').Value := FTipo;

  if(DBLCBACentrosSemen.Visible)then
    IBSPDatosSemen.ParamByName('CENTRO_INSEMINACION').Value := DBLCBACentrosSemen.KeyValue
  else
    IBSPDatosSemen.ParamByName('CENTRO_INSEMINACION').Value := Null;

  IBSPDatosSemen.ParamByName('OBSERVACION').value := Null;

  if (DBLCBACliente.Visible) then
    IBSPDatosSemen.ParamByName('CLIENTE').Value := DBLCBACliente.KeyValue
  else
    IBSPDatosSemen.ParamByName('CLIENTE').Value := Null;

  if (DBLCBATipoBaja.Visible) then
    IBSPDatosSemen.ParamByName('TIPO_BAJA').Value := DBLCBATipoBaja.KeyValue
  else
    IBSPDatosSemen.ParamByName('TIPO_BAJA').Value := Null;

  IBSPDatosSemen.ParamByName('CONGELO').AsString := 'S';

  IBSPDatosSemen.ParamByName('NRO_REMITO').AsString := ENroRemito.Text;

  IBSPDatosSemen.ExecProc;
  
end;

procedure TFModificacionDatosSemen.LCentrosMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LCentros.Font.Color:= $00606C02;
      LCentros.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFModificacionDatosSemen.LCentrosMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LCentros.Font.Color:= clWindowText;
      LCentros.Font.Style:= [fsUnderline];
  end;
end;

procedure TFModificacionDatosSemen.LCentrosClick(Sender: TObject);
var F : TFABMCentrosInseminacion;
begin
  inherited;

  F := TFABMCentrosInseminacion.Create(self);
  F.ShowModal;
  F.Destroy;

  DMSoftvet.IBQCentrosInsem.Close;
  DMSoftvet.IBQCentrosInsem.Open;

end;

procedure TFModificacionDatosSemen.ECantidadSemenKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if not(key in (['0'..'9'])) then
      key := #0;

end;

procedure TFModificacionDatosSemen.ECertificadoSemenKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;

  if not(key in (['0'..'9'])) then
      key := #0;

end;

procedure TFModificacionDatosSemen.EPrecioSemenKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  
  if (Key = '.') then
    Key := ',';

  if (pos(',',TEdit(Sender).Text)=0) then
  begin
      if not (key in ['0'..'9',',',#8]) then key:=#0;
  end
  else if not (key in ['0'..'9',#8]) then key:=#0;

end;


procedure TFModificacionDatosSemen.LClienteMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LCliente.Font.Color:= $00606C02;
      LCliente.Font.Style:= [fsBold,fsUnderline];
  end;

end;

procedure TFModificacionDatosSemen.LClienteMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LCliente.Font.Color:= clWindowText;
      LCliente.Font.Style:= [fsUnderline];
  end;
end;

procedure TFModificacionDatosSemen.DBLCBATipoBajaCloseUp(Sender: TObject);
begin
  inherited;

  if ((DBLCBATipoBaja.KeyValue = 1) or (DBLCBATipoBaja.KeyValue = 2)) then
  begin
//       LPrecio.Visible := true;
//       EPrecioSemen.Visible := true;
//       LSigno.Visible := true;
{       LPrecio.Top := 170;
       LPrecio.Left := 184;
       EPrecioSemen.Top := 168;
       EPrecioSemen.Left := 344;
       LSigno.Top := 170;
       LSigno.Left := 437;      }
  end
  else
  begin
{       LPrecio.Visible := false;
       EPrecioSemen.Visible := false;
       LSigno.Visible := false;    }
  end;
end;

procedure TFModificacionDatosSemen.LClienteClick(Sender: TObject);
var F : TFDatosClienteComprador;
begin
  inherited;

  F := TFDatosClienteComprador.Create(self);
  F.ShowModal;
  F.Destroy;

  IBQDatosClientes.Close;
  IBQDatosClientes.Open;
  IBQDatosClientes.Last;
  IBQDatosClientes.First;

end;

procedure TFModificacionDatosSemen.ISeleccionarPartidasClick(Sender: TObject);
//var F : TFSelecctorPartidas;
begin
  inherited;
{
  IBQDatosAnimal.Close;
  IBQDatosAnimal.ParamByName('sem').AsInteger := FSemen;
  IBQDatosAnimal.Open;

  F := TFSelecctorPartidas.Create(self);
  F.Id_Animal := IBQDatosAnimal.FieldValues['animal'];
  F.ShowModal;
  F.Destroy;
}
end;

end.
