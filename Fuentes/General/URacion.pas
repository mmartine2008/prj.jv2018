unit URacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,DBGrids,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, UFrameDBSeleccion, jpeg, PngImage,
  JvExExtCtrls, JvExtComponent, JvCaptionPanel, JvImage, DBCtrls,
  UDBLookupComboBoxAuto, ImgList, PngImageList;

type
  TFRacion = class(TFUniversal)
    PBottom: TPanel;
    PTop: TPanel;
    PClient: TPanel;
    FrameSuplementos: TFrameSeleccion;
    IAceptar: TImage;
    LAceptar: TLabel;
    ICancel: TImage;
    LCancel: TLabel;
    IFondoB: TImage;
    IBQInsertRacion: TIBQuery;
    IBQInsertRelRacion: TIBQuery;
    IBQGenIDRacion: TIBQuery;
    PTopCli: TPanel;
    Label3: TLabel;
    IBQBorrarAux: TIBQuery;
    GBNueva: TGroupBox;
    ERacion: TEdit;
    Label1: TLabel;
    GBActuales: TGroupBox;
    Label2: TLabel;
    DBLCBARaciones: TDBLookupComboBoxAuto;
    IBQRaciones: TIBQuery;
    DSRaciones: TDataSource;
    IBQRelRacionSuplemento: TIBQuery;
    IBQInsertAuxRacion: TIBQuery;
    IBQUpdateRacionVieja: TIBQuery;
    IBQSuplementos: TIBQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    IAddAlimento: TImage;
    LStock: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    lbPorcMSRacion: TLabel;
    lbPorcTotal: TLabel;
    Label6: TLabel;
    lbMatTalCual: TLabel;
    Label7: TLabel;
    procedure SeleccionarUnAnimal(Sender : TObject);
    procedure FormCreate(Sender: TObject);
    procedure FrameSuplementosBBAgregarUnoClick(Sender: TObject);
    procedure FrameSuplementosBBEliminarUnoClick(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure FrameSuplementosIBQDisponiblesAfterOpen(DataSet: TDataSet);
    procedure FrameSuplementosIBQSeleccionadosAfterOpen(DataSet: TDataSet);
    procedure ICancelClick(Sender: TObject);
    procedure ERacionChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBARacionesCloseUp(Sender: TObject);
    procedure ERacionClick(Sender: TObject);
    procedure DBLCBARacionesClick(Sender: TObject);
    procedure LStockClick(Sender: TObject);
    procedure FrameSuplementosBDBGSeleccionadosCellClick(Column: TColumn);
    procedure FrameSuplementosBDBGSeleccionadosDblClick(Sender: TObject);
    procedure Label7Click(Sender: TObject);
  private
    PorcentajeTotal : Double;
    PorcentajeMS , PorcentajeMTC : double;
    precio, porc : Double;
    editar : Boolean;
    procedure ControlTerminar();
    procedure BorrarAuxiliar;
  public
    ID_RACION : Integer;
    selected_index : integer;
    racion_seleccionada : variant;
    function calcularPorcTotal():double;
    function calcularPorcMS():double;
    procedure updateUI();
    procedure seleccionarRacion(rn : variant);
  end;

var
  FRacion: TFRacion;

implementation

{$R *.dfm}

uses
  UMensajeHuella, URacionDatosAd, Uprincipal, UABMSuplementacion,
  UDMSoftvet, UABMSimple;

procedure TFRacion.SeleccionarUnAnimal(Sender : TObject);
begin
  FrameSuplementos.IBQSeleccionados.Insert;
  FrameSuplementos.IBQSeleccionados.FieldByName('ID_SUPLEMENTO').Value := FrameSuplementos.IBQDisponibles.fieldByName('ID_TIPO_SUPLEMENTACION').AsInteger;
  FrameSuplementos.IBQSeleccionados.FieldByName('PRECIO').Value := precio;
  FrameSuplementos.IBQSeleccionados.FieldByName('PORCENTAJE').Value := porc;
  FrameSuplementos.IBQSeleccionados.FieldByName('NOMBRE').Value := FrameSuplementos.IBQDisponibles.fieldByName('NOMBRE').AsString;
  FrameSuplementos.IBQSeleccionados.FieldByName('PORC_MS').Value := FrameSuplementos.IBQDisponibles.fieldByName('PORC_MS').Value;
  FrameSuplementos.IBQSeleccionados.FieldByName('CANTIDAD').Value := FrameSuplementos.IBQDisponibles.fieldByName('CANTIDAD').Value;
end;

procedure TFRacion.FormCreate(Sender: TObject);
begin
  inherited;
  PorcentajeTotal := 0;
  editar := false;
end;

procedure TFRacion.FrameSuplementosBBAgregarUnoClick(Sender: TObject);
var
  F : TFRacionDatosAd;
begin
  inherited;
  F := TFRacionDatosAd.Create(self);
  F.EPrecio.Text := FormatFloat('#0.00',FrameSuplementos.IBQDisponibles.fieldByName('PRECIO').Value);
  F.precio := FrameSuplementos.IBQDisponibles.fieldByName('PRECIO').Value;
  F.ShowModal;
  porc := F.porc;
  precio := F.precio;
  F.Destroy;

  PorcentajeTotal := PorcentajeTotal + Porc;
  if PorcentajeTotal > 100 then
  begin
    MostrarMensaje(tmError,'El porcentaje total no puede ser mayor al 100%');
    PorcentajeTotal := PorcentajeTotal - Porc;
  end
  else
    FrameSuplementos.BBAgregarUnoClick(Sender);

  ControlTerminar();
end;

procedure TFRacion.FrameSuplementosBBEliminarUnoClick(Sender: TObject);
var
  p : double;
begin
  p := 0;
  if FrameSuplementos.IBQSeleccionados.FieldValues['porcentaje'] <> null then
    p := FrameSuplementos.IBQSeleccionados.FieldValues['porcentaje'];
  PorcentajeTotal := PorcentajeTotal - p;
  inherited;
  FrameSuplementos.BBEliminarUnoClick(Sender);
  ControlTerminar;
end;

procedure TFRacion.IAceptarClick(Sender: TObject);
var
  rac : Integer;
  rac_ant : Integer;
begin
  inherited;
  if FrameSuplementos.IBQSeleccionados.IsEmpty then
    MostrarMensaje(tmError,'No se ha seleccionado ningún suplemento')
  else
  begin
    IBQGenIDRacion.Close;
    IBQGenIDRacion.Open;
    rac := IBQGenIDRacion.FieldValues['id'];
    if editar then
    begin
      IBQUpdateRacionVieja.Close;
      IBQUpdateRacionVieja.ParamByName('id').AsInteger := ID_RACION;
      IBQUpdateRacionVieja.Open;
    end;

    try
      IBQInsertRacion.Close;
      IBQInsertRacion.ParamByName('id').Value := rac;
      if editar then
        IBQInsertRacion.ParamByName('nombre').Value := DBLCBARaciones.Text
      else
        IBQInsertRacion.ParamByName('nombre').Value := ERacion.Text;
      IBQInsertRacion.ParamByName('fecha').AsDate := Date();
      IBQInsertRacion.ParamByName('visible').AsString := 'S';
      IBQInsertRacion.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
      ID_RACION := rac;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
    try
      FrameSuplementos.IBQSeleccionados.First;
      while not FrameSuplementos.IBQSeleccionados.Eof do
      begin
        IBQInsertRelRacion.Close;
        IBQInsertRelRacion.ParamByName('racion').Value := rac;
        IBQInsertRelRacion.ParamByName('suplemento').Value := FrameSuplementos.IBQSeleccionados.FieldValues['id_suplemento'];
        IBQInsertRelRacion.ParamByName('porcentaje').Value := FrameSuplementos.IBQSeleccionados.FieldValues['porcentaje'];
        IBQInsertRelRacion.ParamByName('precio').Value := FrameSuplementos.IBQSeleccionados.FieldValues['precio'];
        IBQInsertRelRacion.Open;
        FrameSuplementos.IBQSeleccionados.Next;
      end;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
    BorrarAuxiliar;
    Close;
  end;
end;

procedure TFRacion.FrameSuplementosIBQDisponiblesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameSuplementos.BDBGDisponibles.Columns[0].Width := 215;
  FrameSuplementos.BDBGDisponibles.Columns[1].Width := 42;
  FrameSuplementos.BDBGDisponibles.Columns[2].Width := 78;

  FrameSuplementos.BDBGSeleccionados.Columns[0].Width := 162;
  FrameSuplementos.BDBGSeleccionados.Columns[1].Width := 45;
  FrameSuplementos.BDBGSeleccionados.Columns[2].Width := 73;
  FrameSuplementos.BDBGSeleccionados.Columns[3].Width := 55;
  FrameSuplementos.BDBGSeleccionados.Columns[4].Width := 82;

  FrameSuplementos.IBQDisponibles.Last;
  FrameSuplementos.IBQDisponibles.First;
  FrameSuplementos.GBDisponibles.Caption := 'Alimentos Disponibles ['+ IntToStr(FrameSuplementos.IBQDisponibles.RecordCount)+']';
end;

procedure TFRacion.FrameSuplementosIBQSeleccionadosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameSuplementos.BDBGDisponibles.Columns[0].Width := 215;
  FrameSuplementos.BDBGDisponibles.Columns[1].Width := 42;
  FrameSuplementos.BDBGDisponibles.Columns[2].Width := 78;

  FrameSuplementos.BDBGSeleccionados.Columns[0].Width := 162;
  FrameSuplementos.BDBGSeleccionados.Columns[1].Width := 45;
  FrameSuplementos.BDBGSeleccionados.Columns[2].Width := 73;
  FrameSuplementos.BDBGSeleccionados.Columns[3].Width := 55;
  FrameSuplementos.BDBGSeleccionados.Columns[4].Width := 82;

  FrameSuplementos.IBQSeleccionados.Last;
  FrameSuplementos.IBQSeleccionados.First;
  FrameSuplementos.GBSeleccionados.Caption := 'Alimentos Seleccionados ['+ IntToStr(FrameSuplementos.IBQSeleccionados.RecordCount)+'] - Porcentaje Total: '+FormatFloat('#0.##',PorcentajeTotal)+' %';

  calcularPorcTotal();
  calcularPorcMS();

  lbPorcTotal.Caption := FormatFloat('#0.00',PorcentajeTotal);
  lbPorcMSRacion.Caption := FormatFloat('#0.00',PorcentajeMS);
  lbMatTalCual.Caption := FormatFloat('#0.00',PorcentajeMTC);

end;

procedure TFRacion.ICancelClick(Sender: TObject);
begin
  inherited;
  BorrarAuxiliar;
  Close;
end;

procedure TFRacion.ControlTerminar;
begin
  FrameSuplementos.IBQSeleccionados.Last;
  FrameSuplementos.IBQSeleccionados.First;
  LAceptar.Enabled := (FrameSuplementos.IBQSeleccionados.RecordCount > 0) and ((ERacion.Text <> '') or (editar));
  IAceptar.Enabled := (FrameSuplementos.IBQSeleccionados.RecordCount > 0) and ((ERacion.Text <> '') or (editar));
end;

procedure TFRacion.seleccionarRacion(rn : variant);
begin
 try
  racion_seleccionada := rn;
  except
  end;
end;

procedure TFRacion.updateUI();
begin
  // Fuerzo la visual
  FrameSuplementos.BDBGDisponibles.SelectedRows.Clear();
  FrameSuplementos.BDBGDisponibles.SelectCell(1,1);

  ControlTerminar();
end;

procedure TFRacion.ERacionChange(Sender: TObject);
begin
  inherited;
  ControlTerminar;
  PClient.Visible := true;
end;

procedure TFRacion.BorrarAuxiliar;
begin
  IBQBorrarAux.Close;
  IBQBorrarAux.Open;
end;

procedure TFRacion.FormShow(Sender: TObject);
begin
  inherited;
  GBNueva.Visible := false;
  //(FrameSuplementos.IBQDisponibles.FieldByName('cantidad') as TFloatField).DisplayFormat := '#0.00';
  FrameSuplementos.OnSelectItem := SeleccionarUnAnimal;
  FrameSuplementos.ActualizarLosQuery;
  FrameSuplementos.ControlarBotones;

  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  IBQRaciones.First;
  IBQSuplementos.Close;
  IBQSuplementos.Open;
  try
    if not (VarIsNull(racion_seleccionada)) then
    begin
      DBLCBARaciones.KeyValue := racion_seleccionada;
      DBLCBARacionesCloseUp( DBLCBARaciones);
    end;
//   IBQRaciones.Locate('id_racion',racion_seleccionada,[]);
  except
  end;

 // Calculo los porcentajes y los muestro
  updateUI();
end;

procedure TFRacion.DBLCBARacionesCloseUp(Sender: TObject);
begin
  inherited;
  ID_RACION := -1;
  if DBLCBARaciones.KeyValue <> null then
  begin
    FrameSuplementos.ActualizarLosQuery;

    editar := true;

    ID_RACION := DBLCBARaciones.KeyValue;

    IBQRelRacionSuplemento.Close;
    IBQRelRacionSuplemento.ParamByName('r').AsInteger := ID_RACION;
    IBQRelRacionSuplemento.Open;
    //ERacion.Text := DBLCBARaciones.Text;
    IBQBorrarAux.Close;
    IBQBorrarAux.Open;
    PorcentajeTotal := 0;

    while not IBQRelRacionSuplemento.Eof do
    begin
      try
        porc := IBQRelRacionSuplemento.FieldValues['porcentaje'];
        PorcentajeTotal := PorcentajeTotal + porc;
        precio := IBQRelRacionSuplemento.FieldValues['precio'];

        IBQInsertAuxRacion.Close;
        IBQInsertAuxRacion.ParamByName('suplemento').Value := IBQRelRacionSuplemento.FieldValues['id_suplemento'];
        IBQInsertAuxRacion.ParamByName('porc').Value := porc;
        IBQInsertAuxRacion.ParamByName('precio').Value := precio;
        IBQInsertAuxRacion.ParamByName('nombre').Value := IBQSuplementos.Lookup('id_tipo_suplementacion',IBQRelRacionSuplemento.FieldValues['id_suplemento'],'nombre');
        IBQInsertAuxRacion.ParamByName('ms').Value := IBQSuplementos.Lookup('id_tipo_suplementacion',IBQRelRacionSuplemento.FieldValues['id_suplemento'],'porc_ms');
        IBQInsertAuxRacion.ParamByName('cantidad').Value := IBQSuplementos.Lookup('id_tipo_suplementacion',IBQRelRacionSuplemento.FieldValues['id_suplemento'],'cantidad');
        IBQInsertAuxRacion.Open;

        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
      IBQRelRacionSuplemento.Next;
    end;
    FrameSuplementos.ActualizarLosQuery;
    PClient.Visible := true;
  end;
  updateUI();
  GBNueva.Visible := false;
  ControlTerminar;
end;

procedure TFRacion.ERacionClick(Sender: TObject);
begin
  inherited;
  editar := false;
  ERacion.Color := clMoneyGreen;
  try
    IBQBorrarAux.Close;
    IBQBorrarAux.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  FrameSuplementos.ActualizarLosQuery;
end;

procedure TFRacion.DBLCBARacionesClick(Sender: TObject);
begin
  inherited;
  ControlTerminar();
end;

procedure TFRacion.LStockClick(Sender: TObject);
var
  abm : TFABMSuplementacion;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      abm := TFABMSuplementacion.Create(self);
      // se abre para elegir
      abm.desdeEvento := -1;
      abm.Abrir(faElegir);
      DMSoftvet.IBQPotrerosAll.Close;
     // DMSoftvet.IBQPotrerosAll.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQPotrerosAll.Open;
      FrameSuplementos.IBQDisponibles.Close;
      FrameSuplementos.IBQDisponibles.Open;
      FrameSuplementos.IBQDisponibles.Last;
      FrameSuplementos.IBQDisponibles.First;
    end;
end;

function TFRacion.calcularPorcMS():double;
begin
  PorcentajeMS := 0.0;
  PorcentajeMTC := 0.0;
  FrameSuplementos.IBQSeleccionados.first();
  while not FrameSuplementos.IBQSeleccionados.eof do
  begin
    PorcentajeMS := PorcentajeMS   + FrameSuplementos.IBQSeleccionados.fieldByName('porcentaje').Value*
                                     FrameSuplementos.IBQSeleccionados.fieldByName('PORC_MS').Value;
    PorcentajeMTC := PorcentajeMTC   + FrameSuplementos.IBQSeleccionados.fieldByName('porcentaje').Value /
                                     FrameSuplementos.IBQSeleccionados.fieldByName('PORC_MS').Value;
    FrameSuplementos.IBQSeleccionados.next();
  end;
  PorcentajeMS := PorcentajeMS/100;
  if (PorcentajeMTC>0) then
   PorcentajeMTC := 100 / PorcentajeMTC
  else
   PorcentajeMTC := 100;
  result := PorcentajeMS;
end;

function TFRacion.calcularPorcTotal():double;
begin
  PorcentajeTotal := 0.0;
  FrameSuplementos.IBQSeleccionados.first();
  while not FrameSuplementos.IBQSeleccionados.eof do
  begin
    PorcentajeTotal := PorcentajeTotal+FrameSuplementos.IBQSeleccionados.fieldByName('porcentaje').Value;
    FrameSuplementos.IBQSeleccionados.next();
  end;
  result := PorcentajeTotal;
end;

procedure TFRacion.FrameSuplementosBDBGSeleccionadosCellClick(
  Column: TColumn);
begin
  inherited;
// Muestro el formulario para editar el valor de porcentaje
  FrameSuplementos.BDBGSeleccionadosCellClick(Column);

end;

procedure TFRacion.FrameSuplementosBDBGSeleccionadosDblClick(
  Sender: TObject);
var
  F : TFRacionDatosAd;
  precio, porc : single;

begin
  inherited;
  if (FrameSuplementos.BDBGSeleccionados.SelectedRows.Count=0) then exit;
// Muestro el formulario para editar el valor de porcentaje

  FrameSuplementos.IBQSeleccionados.GotoBookmark(pointer(FrameSuplementos.BDBGSeleccionados.SelectedRows.Items[0]));

  F := TFRacionDatosAd.Create(self);
  F.porc :=FrameSuplementos.IBQSeleccionados.fieldByName('porcentaje').Value;
  F.origPorc :=  FrameSuplementos.IBQSeleccionados.fieldByName('porcentaje').Value;
  F.totalRacion :=  PorcentajeTotal;

  F.EPrecio.Text := FormatFloat('#0.00',FrameSuplementos.IBQSeleccionados.fieldByName('PRECIO').Value);
  F.EPorc.Text := FormatFloat('#0.00',FrameSuplementos.IBQSeleccionados.fieldByName('porcentaje').Value);
  F.precio := FrameSuplementos.IBQSeleccionados.fieldByName('PRECIO').Value;
  F.lbTotalRacion.visible := true;
  F.ShowModal;
  porc := F.porc;
  precio := F.precio;
  F.Destroy;
 // Actualizo el valor en la BBDD
  FrameSuplementos.IBQSeleccionados.Edit();
  FrameSuplementos.IBQSeleccionados.fieldByName('porcentaje').Value := porc;
  FrameSuplementos.IBQSeleccionados.fieldByName('PRECIO').Value := precio;
  calcularPorcTotal();
  // Puede haber errores de redondeo
  if PorcentajeTotal > 100.001 then
  begin
    MostrarMensaje(tmError,'El porcentaje total no puede ser mayor al 100%');
    PorcentajeTotal := PorcentajeTotal - Porc;
  end;
  updateUI();
  FrameSuplementosIBQSeleccionadosAfterOpen(FrameSuplementos.IBQSeleccionados);
end;

procedure TFRacion.Label7Click(Sender: TObject);
begin
  inherited;
  PorcentajeTotal := 0;
  FrameSuplementos.BBEliminarTodosClick(sender);
  GBNueva.Visible := true;
  editar := False;
end;

end.
