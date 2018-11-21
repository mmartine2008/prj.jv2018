unit USelPotreroMapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, Buttons, PngImage, jpeg,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, IBUpdateSQL,
  JvExExtCtrls, JvImage, cxGraphics;

type
  TFSelPotreroMapa = class(TFUniversal)
    PBotones: TPanel;
    IFondoBottom: TImage;
    ICancel: TImage;
    LCancel: TLabel;
    IAceptar: TImage;
    LAceptar: TLabel;
    BBAceptar: TBitBtn;
    BBSiaTodo: TBitBtn;
    BBSi: TBitBtn;
    BBNo: TBitBtn;
    BBCancelar: TBitBtn;
    PCli: TPanel;
    PPotExistentes: TPanel;
    PPotNuevos: TPanel;
    DSPotreros: TDataSource;
    IBQPotreros: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    EPotNuevo: TcxTextEdit;
    IBQPotNuevo: TIBQuery;
    IBUPotNuevo: TIBUpdateSQL;
    IBQSPEventosPotreros: TIBQuery;
    cxCBPotreros: TcxComboBox;
    POpciones: TPanel;
    IVolver1: TImage;
    IVolver2: TImage;
    IPotsExist: TImage;
    IPotsNuevos: TImage;
    LabelPotExist: TLabel;
    Label3: TLabel;
    LVolver1: TLabel;
    LVolver2: TLabel;
    IBQVerificarNombre: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure ICancelClick(Sender: TObject);
    procedure EPotNuevoPropertiesChange(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure cxCBPotrerosPropertiesCloseUp(Sender: TObject);
    procedure IPotsExistClick(Sender: TObject);
    procedure IPotsNuevosClick(Sender: TObject);
    procedure IVolver1Click(Sender: TObject);
    procedure IVolver2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CargarEventosPotreros;
  public
    id_potrero : Integer;
    Tipo : Integer;
  end;

var
  FSelPotreroMapa: TFSelPotreroMapa;

implementation

uses
  UPrincipal, UMapaGoogle, UMensajeHuella;

{$R *.dfm}

procedure TFSelPotreroMapa.FormCreate(Sender: TObject);
begin
  inherited;
  IBQPotreros.Close;
  IBQPotreros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotreros.Open;
  IBQPotreros.First;
  cxCBPotreros.Properties.Items.Clear;
  while not IBQPotreros.Eof do
  begin
    cxCBPotreros.Properties.Items.Add(IBQPotreros.FieldValues['nombre']);
    IBQPotreros.Next;
  end;
  PPotExistentes.Visible := IBQPotreros.RecordCount > 1;
  id_potrero := -1;
  Tipo := 0;
  if IBQPotreros.IsEmpty then
    Tipo := 1;
end;

procedure TFSelPotreroMapa.ICancelClick(Sender: TObject);
begin
  inherited;
  (self.Owner as TFMapaGoogle).PASeleccionPotrero.Visible := false;
  (self.Owner as TFMapaGoogle).PASelPotrero.Visible := false;
  id_potrero := -1;
  Close;
end;

procedure TFSelPotreroMapa.EPotNuevoPropertiesChange(Sender: TObject);
begin
  inherited;
  IAceptar.Visible := EPotNuevo.Text <> '';
  LAceptar.Visible := EPotNuevo.Text <> '';
  if EPotNuevo.Text <> '' then
  begin
    cxCBPotreros.Text := '';
  end;
end;

procedure TFSelPotreroMapa.IAceptarClick(Sender: TObject);
var nombreIncorrecto: Boolean;
begin
  inherited;
  nombreIncorrecto := false;
  (self.Owner as TFMapaGoogle).PASeleccionPotrero.Visible := false;
  (self.Owner as TFMapaGoogle).PANuevoPot.Visible:= false;
  if EPotNuevo.Text <> '' then
  begin
    //Verifica si el nombre ya existe
    IBQVerificarNombre.Close;
    IBQVerificarNombre.ParamByName('nombre').AsString := UpperCase(trim(EPotNuevo.Text));
    IBQVerificarNombre.ParamByName('estab').AsInteger := fprincipal.EstablecimientoActual;
    IBQVerificarNombre.Open;
    if not (IBQVerificarNombre.IsEmpty) then
    begin
      MostrarMensaje(tmInformacion,'El nombre del potrero ya existe. Escriba otro nombre por favor.');
      nombreIncorrecto := true;
      EPotNuevo.SelectAll;
      EPotNuevo.SetFocus;
    end
    else
    begin
      try
        IBQPotNuevo.Close;
        IBQPotNuevo.Open;
        IBQPotNuevo.Insert;
        IBQPotNuevo.FieldByName('NOMBRE').AsString := EPotNuevo.Text;
        IBQPotNuevo.FieldByName('FECHA_RECURSO_FORRAJERO').AsDateTime := Date();
        IBQPotNuevo.FieldByName('RECURSO_FORRAJERO').AsInteger := 0;
        IBQPotNuevo.FieldByName('ESTABLECIMIENTO').AsInteger := Fprincipal.EstablecimientoActual;
        IBQPotNuevo.FieldByName('HECTAREAS').AsInteger := 0;
        IBQPotNuevo.FieldByName('DESCRIPCION').AsString := '';
        IBQPotNuevo.FieldByName('VISIBLE').AsInteger := 1;
        IBQPotNuevo.Post;
        FPrincipal.IBDPrincipal.ApplyUpdates([IBQPotNuevo]);
        id_potrero := IBQPotNuevo.FieldValues['ID_POTRERO'];
        CargarEventosPotreros;
      except
        IBQPotNuevo.CancelUpdates;
      end;
    end;
  end;
  if FPrincipal.AsistenteMapa then
    (self.Owner as TFMapaGoogle).PAPasosDib.Visible:=true;
  if not (nombreIncorrecto) then
    Close;
end;

procedure TFSelPotreroMapa.CargarEventosPotreros;
begin
  try
    IBQSPEventosPotreros.Close;
    IBQSPEventosPotreros.ParamByName('FECHA').AsDate  := now();
    IBQSPEventosPotreros.ParamByName('OBSERVACION').Value  := null;
    IBQSPEventosPotreros.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
    IBQSPEventosPotreros.ParamByName('RESPONSABLE').AsInteger  := 0;
    IBQSPEventosPotreros.ParamByName('POTRERO').AsInteger  := id_potrero;
    IBQSPEventosPotreros.ParamByName('SUPERFICIETOTAL').AsFloat  := 1;
    IBQSPEventosPotreros.ParamByName('SUPERFICIEGANADERA').AsFloat  := 1;
    IBQSPEventosPotreros.ParamByName('SUPERFICIEAGRICOLA').AsFloat  := 0;
    IBQSPEventosPotreros.ParamByName('RECURSO').Value  := null;
    IBQSPEventosPotreros.ParamByName('TRATAMIENTO').Value  := null;
    IBQSPEventosPotreros.ParamByName('MATERIASECA').Value  := null;
    IBQSPEventosPotreros.ParamByName('OBSERVACIOANALISISSUELO').Value  := null;
    IBQSPEventosPotreros.ParamByName('RESERVAFORRAJERAS').Value:= null;
    IBQSPEventosPotreros.ParamByName('CANTIDADRESERVA').Value:= null;
    IBQSPEventosPotreros.ParamByName('UNIDADRESERVA').Value:= null;
    IBQSPEventosPotreros.ParamByName('VISIBLE').Value:= 1;
    IBQSPEventosPotreros.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFSelPotreroMapa.cxCBPotrerosPropertiesCloseUp(Sender: TObject);
begin
  inherited;

  IAceptar.Visible := cxCBPotreros.Text <> '';
  LAceptar.Visible := cxCBPotreros.Text <> '';

  if (cxCBPotreros.Text <> '')  and (cxCBPotreros.Text <> 'Potreros Disponibles' ) then
    begin
    id_potrero := IBQPotreros.Lookup('nombre',cxCBPotreros.Text,'id_potrero');
    EPotNuevo.Text := '';
  end;
end;

procedure TFSelPotreroMapa.IPotsExistClick(Sender: TObject);
begin
  inherited;
  POpciones.Visible := false;
  PPotExistentes.Visible := true;
  PPotNuevos.Visible := false;
  EPotNuevo.Clear;
end;

procedure TFSelPotreroMapa.IPotsNuevosClick(Sender: TObject);
begin
  inherited;
  POpciones.Visible := false;
  PPotNuevos.Visible := true;
  PPotExistentes.Visible := false;
  EPotNuevo.SetFocus;
end;

procedure TFSelPotreroMapa.IVolver1Click(Sender: TObject);
begin
  inherited;
  POpciones.Visible := true;
  PPotExistentes.Visible := false;
  IAceptar.Visible := false;
  LAceptar.Visible := false;
  PPotExistentes.SendToBack;
end;

procedure TFSelPotreroMapa.IVolver2Click(Sender: TObject);
begin
  inherited;
  POpciones.Visible := true;
  PPotNuevos.Visible := false;
  IAceptar.Visible := false;
  LAceptar.Visible := false;
  EPotNuevo.Text := '';
  PPotNuevos.SendToBack;
end;

procedure TFSelPotreroMapa.FormShow(Sender: TObject);
begin
  inherited;
  if Tipo = 1 then
    IPotsNuevosClick(nil);
end;

end.
