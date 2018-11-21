unit URepMovimientosAlimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls,
  jpeg, pngimage, ExtCtrls, StdCtrls, JvGIF, Grids, DBGrids, UBDBGrid, DateUtils,
  ImgList, PngImageList, JvExControls, JvLabel;

type
  TFRepMovimientosAlimentos = class(TFUniversal)
    Panel1: TPanel;
    GBFiltros: TGroupBox;
    LBuscar: TLabel;
    LDesde: TLabel;
    LHasta: TLabel;
    IBuscarPartida: TImage;
    EBuscar: TEdit;
    CBxTipoAlta: TComboBox;
    CBxTiposBaja: TComboBox;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    PBotones: TPanel;
    PGrilla: TPanel;
    GBDetalle: TGroupBox;
    BDBGDetalle: TBitDBGrid;
    Image1: TImage;
    IBQMovimientos: TIBQuery;
    DSMovimientos: TDataSource;
    IBQTipoMovAlta: TIBQuery;
    IBQTipoMovBaja: TIBQuery;
    DSTipoMovBaja: TDataSource;
    DSTipoMovAlta: TDataSource;
    IBQMovimientosTIPO_MOVIMIENTO: TIBStringField;
    IBQMovimientosFECHA: TDateField;
    IBQMovimientosALIMENTO: TIBStringField;
    IBQMovimientosCANTIDAD: TFloatField;
    IBQMovimientosPRECIO: TFloatField;
    IPreview: TImage;
    LPreview: TLabel;
    ISalir: TImage;
    LSalir: TLabel;
    IBQCantidad: TIBQuery;
    GroupBox1: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    procedure FormCreate(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure CBxTipoAltaChange(Sender: TObject);
    procedure CBxTipoAltaCloseUp(Sender: TObject);
    procedure CBxTiposBajaChange(Sender: TObject);
    procedure CBxTiposBajaCloseUp(Sender: TObject);
    procedure IPreviewClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IBuscarPartidaClick(Sender: TObject);
    procedure EBuscarChange(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    desde, hasta, nombre, tipo_alta, tipo_baja : Variant;
  { DAIANA - 12.12.2014 - Incidencia 412 - Inicio
    Error al abrir QReport, mostraba basura }
    DelTipoAlta, DelTipoBaja, Consulta : Boolean;
  { DAIANA - 12.12.2014 - Incidencia 412 - Fin }
    procedure ActConsulta;
    procedure CargarCombos;
  public
    { Public declarations }
  end;

var
  FRepMovimientosAlimentos: TFRepMovimientosAlimentos;

implementation

{$R *.dfm}

uses
  UPrincipal, URepMovimientosAlimentacionPreview;

procedure TFRepMovimientosAlimentos.FormCreate(Sender: TObject);
begin
  inherited;
  DTPDesde.Date := IncYear(Date(),-1);
  DTPHasta.Date := Date();
  desde := DTPDesde.Date;
  hasta := DTPHasta.Date;
  nombre := null;
  tipo_alta := null;
  tipo_baja := null;
  CargarCombos;
{ DAIANA - 12.12.2014 - Incidencia 412 - Inicio
  Error al abrir QReport, mostraba basura }
  Consulta := false;
{ DAIANA - 12.12.2014 - Incidencia 412 - Fin }
end;

procedure TFRepMovimientosAlimentos.CargarCombos;
var
  I : Integer;
begin
  IBQTipoMovAlta.Close;
  IBQTipoMovAlta.Open;
  IBQTipoMovBaja.Close;
  IBQTipoMovBaja.Open;

  DelTipoAlta := false;
  DelTipoBaja := false;

  CBxTiposBaja.Items.Insert(0,'TIPOS DE BAJA');
  CBxTiposBaja.Items.Insert(1,'SIN FILTRO');
  CBxTiposBaja.Items.Insert(2,'(TODOS)');
  i := 3;
  while not(IBQTipoMovBaja.Eof) do
  begin
       CBxTiposBaja.Items.Insert(i,IBQTipoMovBaja.FieldValues['nombre']);
       IBQTipoMovBaja.Next;
       Inc(i);
  end;

  CBxTipoAlta.Items.Insert(0,'TIPOS DE ALTA');
  CBxTipoAlta.Items.Insert(1,'SIN FILTRO');
  CBxTipoAlta.Items.Insert(2,'(TODOS)');
  i := 3;
  while not(IBQTipoMovAlta.Eof) do
  begin
       CBxTipoAlta.Items.Insert(i,IBQTipoMovAlta.FieldValues['nombre']);
       IBQTipoMovAlta.Next;
       Inc(i);
  end;

  CBxTiposBaja.ItemIndex := 0;
  CBxTipoAlta.ItemIndex := 0;

end;

procedure TFRepMovimientosAlimentos.ActConsulta;
begin
  IBQMovimientos.Close;
  IBQMovimientos.ParamByName('desde').AsDate := desde;
  IBQMovimientos.ParamByName('hasta').AsDate := hasta;
  IBQMovimientos.ParamByName('nombre').Value := nombre;
  IBQMovimientos.ParamByName('tipoalta').Value := tipo_alta;
  IBQMovimientos.ParamByName('tipobaja').Value := tipo_baja;
  IBQMovimientos.Open;
  IBQCantidad.Close;
  IBQCantidad.ParamByName('desde').AsDate := desde;
  IBQCantidad.ParamByName('hasta').AsDate := hasta;
  IBQCantidad.ParamByName('nombre').Value := nombre;
  IBQCantidad.ParamByName('tipoalta').Value := tipo_alta;
  IBQCantidad.ParamByName('tipobaja').Value := tipo_baja;
  IBQCantidad.Open;
{ DAIANA - 12.12.2014 - Incidencia 412 - Inicio
  Error al abrir QReport, mostraba basura }
  Consulta := true;
{ DAIANA - 12.12.2014 - Incidencia 412 - Fin }
end;

procedure TFRepMovimientosAlimentos.DTPDesdeChange(Sender: TObject);
begin
  inherited;
  desde := DTPDesde.Date;
end;

procedure TFRepMovimientosAlimentos.DTPHastaChange(Sender: TObject);
begin
  inherited;
  hasta := DTPHasta.Date;
end;

procedure TFRepMovimientosAlimentos.CBxTipoAltaChange(Sender: TObject);
begin
  inherited;
  if ((CBxTipoAlta.Text <> 'TIPOS DE ALTA') and (CBxTipoAlta.Text <> '') and (CBxTipoAlta.Text <> 'SIN FILTRO')) then
  begin
    if CBxTipoAlta.Text = '(TODOS)' then
      tipo_alta := null
    else
      tipo_alta := IBQTipoMovAlta.Lookup('nombre',CBxTipoAlta.Text,'id_movimiento_alimentacion');
  end
  else
  begin
       tipo_alta := null;
     { DAIANA - 12.12.2014 - Incidencia 412 - Inicio
       Errores al clickear combo box }
       if not (CBxTipoAlta.Items.IndexOf('TIPOS DE ALTA') = 0) then
         CBxTipoAlta.Items.Insert(0,'TIPOS DE ALTA');
     { DAIANA - 12.12.2014 - Incidencia 412 - Fin }
       CBxTipoAlta.ItemIndex := 0;
       DelTipoAlta := false;
  end;
end;

procedure TFRepMovimientosAlimentos.CBxTipoAltaCloseUp(Sender: TObject);
begin
  inherited;
{ DAIANA - 12.12.2014 - Incidencia 412 - Inicio
  Errores al clickear combo box }
  if not(DelTipoAlta) and (CBxTipoAlta.Text <> 'TIPOS DE ALTA') then
{ DAIANA - 12.12.2014 - Incidencia 412 - Fin }
  begin
       CBxTipoAlta.Items.Delete(0);
       DelTipoAlta := true; 
  end;
end;

procedure TFRepMovimientosAlimentos.CBxTiposBajaChange(Sender: TObject);
begin
  inherited;
  if ((CBxTiposBaja.Text <> 'TIPOS DE BAJA') and (CBxTiposBaja.Text <> '') and (CBxTiposBaja.Text <> 'SIN FILTRO')) then
  begin
       if (CBxTiposBaja.Text = '(TODOS)') then
          tipo_baja := null
       else
          tipo_baja := IBQTipoMovBaja.Lookup('nombre',CBxTiposBaja.Text,'id_movimiento_alimentacion');
  end
  else
  begin
       tipo_baja := null;
     { DAIANA - 12.12.2014 - Incidencia 412 - Inicio
       Errores al clickear combo box }
       if not (CBxTiposBaja.Items.IndexOf('TIPOS DE BAJA') = 0) then
         CBxTiposBaja.Items.Insert(0,'TIPOS DE BAJA');
     { DAIANA - 12.12.2014 - Incidencia 412 - Fin }
       CBxTiposBaja.ItemIndex := 0;
       DelTipoBaja := false;
  end;
end;

procedure TFRepMovimientosAlimentos.CBxTiposBajaCloseUp(Sender: TObject);
begin
  inherited;
{ DAIANA - 12.12.2014 - Incidencia 412 - Inicio
  Errores al clickear combo box }
  if not(DelTipoBaja) and (CBxTiposBaja.Text <> 'TIPOS DE BAJA') then
{ DAIANA - 12.12.2014 - Incidencia 412 - Fin }
  begin
    CBxTiposBaja.Items.Delete(0);
    DelTipoBaja := true; 
  end;
end;

procedure TFRepMovimientosAlimentos.IPreviewClick(Sender: TObject);
var
  F : TFRepMovimientosAlimentacionPreview;
begin
  inherited;
  F := TFRepMovimientosAlimentacionPreview.Create(self);
{ DAIANA - 12.12.2014 - Incidencia 412 - Inicio
  Error al abrir QReport, mostraba basura }
  if (Consulta) then
  begin
{ DAIANA - 12.12.2014 - Incidencia 412 - Fin }
  IBQCantidad.First;
  F.QRLPeriodo.Caption := 'Desde el ' +DateToStr(DTPDesde.Date)+' a el '+DateToStr(DTPHasta.Date);
  while not IBQCantidad.Eof do
  begin
    if IBQCantidad.FieldValues['tipo_movimiento'] = 'COMPRA' then
      F.QRLCompra.Caption := FormatFloat('#0.00',IBQCantidad.FieldValues['cant']);
    if IBQCantidad.FieldValues['tipo_movimiento'] = 'PRODUCCION' then
      F.QRLProduccion.Caption := FormatFloat('#0.00',IBQCantidad.FieldValues['cant']);
    if IBQCantidad.FieldValues['tipo_movimiento'] = 'AJUSTE ALTA' then
      F.QRLAjusteAlta.Caption := FormatFloat('#0.00',IBQCantidad.FieldValues['cant']);
    if IBQCantidad.FieldValues['tipo_movimiento'] = 'CONSUMO' then
      F.QRLConsumo.Caption := FormatFloat('#0.00',IBQCantidad.FieldValues['cant']);
    if IBQCantidad.FieldValues['tipo_movimiento'] = 'VENTA' then
      F.QRLVenta.Caption := FormatFloat('#0.00',IBQCantidad.FieldValues['cant']);
    if IBQCantidad.FieldValues['tipo_movimiento'] = 'AJUSTE BAJA' then
      F.QRLAjusteBaja.Caption := FormatFloat('#0.00',IBQCantidad.FieldValues['cant']);
    IBQCantidad.Next;
  end;
  end;
  F.ShowModal;
  F.Destroy;
end;

procedure TFRepMovimientosAlimentos.ISalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFRepMovimientosAlimentos.IBuscarPartidaClick(Sender: TObject);
begin
  inherited;
  if EBuscar.Text = '' then
    nombre := null
  else
    nombre := EBuscar.Text;
end;

procedure TFRepMovimientosAlimentos.EBuscarChange(Sender: TObject);
begin
  inherited;
  if EBuscar.Text = '' then
    nombre := null
  else
    nombre := EBuscar.Text;
end;

procedure TFRepMovimientosAlimentos.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFRepMovimientosAlimentos.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.                                                   
