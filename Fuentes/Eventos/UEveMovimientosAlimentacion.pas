unit UEveMovimientosAlimentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls,
  jpeg, pngimage, ExtCtrls, StdCtrls, JvGIF, Grids, DBGrids, DBCtrls,
  ImgList, PngImageList, JvExControls, JvLabel;

type
  TFEveMovimientosAlimentacion = class(TFUniversal)
    PBotones: TPanel;
    Image1: TImage;
    PAlimentos: TPanel;
    PFiltros: TPanel;
    DBGAlimentos: TDBGrid;
    IBQAlimentos: TIBQuery;
    DSAlimentos: TDataSource;
    PAlta: TPanel;
    LAlimentoAlta: TLabel;
    IBQTipoMovAlta: TIBQuery;
    DSTipoMovAlta: TDataSource;
    IBQTipoMovBaja: TIBQuery;
    DSTipoMovBaja: TDataSource;
    Label1: TLabel;
    DTPFechaAlta: TDateTimePicker;
    Label2: TLabel;
    ECantidadAlta: TEdit;
    Label3: TLabel;
    ECostoAlta: TEdit;
    Label4: TLabel;
    DBLCBTipoAlta: TDBLookupComboBox;
    IAlta: TImage;
    IBaja: TImage;
    IGuardar: TImage;
    ICancelar: TImage;
    IBQSPMovimientoAlimentacion: TIBQuery;
    PBaja: TPanel;
    LAlimentoBaja: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DTPFechaBaja: TDateTimePicker;
    ECantidadBaja: TEdit;
    ECostoBaja: TEdit;
    DBLCBTipoBaja: TDBLookupComboBox;
    IAgregarAlimento: TImage;
    LAgregaAlimento: TLabel;
    LMedio: TLabel;
    LGuardar: TLabel;
    Label11: TLabel;
    LTotalCompra: TLabel;
    LTotalVenta: TLabel;
    IBQAlimentosID_TIPO_SUPLEMENTACION: TIntegerField;
    IBQAlimentosNOMBRE: TIBStringField;
    IBQAlimentosCODIGO: TIBStringField;
    IBQAlimentosSINONIMO: TIBStringField;
    IBQAlimentosPORC_MS: TFloatField;
    IBQAlimentosCANTIDAD: TFloatField;
    IBQAlimentosPRECIO: TFloatField;
    PResumen: TPanel;
    LTotalStock: TLabel;
    LTotalInventario: TLabel;
    EBuscar: TEdit;
    LBuscar: TLabel;
    IBuscarPartida: TImage;
    IPreview: TImage;
    IBQCantidad: TIBQuery;
    IBQAlimentosPRECIO_INV: TFloatField;
    IBQCantAlimento: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure DBGAlimentosCellClick(Column: TColumn);
    procedure IAltaClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure IGuardarClick(Sender: TObject);
    procedure IBajaClick(Sender: TObject);
    procedure IAgregarAlimentoClick(Sender: TObject);
    procedure ECostoBajaChange(Sender: TObject);
    procedure ECantidadBajaChange(Sender: TObject);
    procedure ECantidadAltaChange(Sender: TObject);
    procedure ECostoAltaChange(Sender: TObject);
    procedure IPreviewClick(Sender: TObject);
    procedure EBuscarChange(Sender: TObject);
    procedure DBGAlimentosDblClick(Sender: TObject);
    procedure IBQAlimentosCalcFields(DataSet: TDataSet);
  private
    TipoMovimiento : Integer;
    cantidad, costo, totalCant, totalCosto : Double;
    SQLStr, busqueda : String;
    procedure CalcularTotal;
    procedure ActConsulta;
  public
    alimento : integer;
    desdeEve : Boolean;
    cantResult : Double;
  published
    constructor Create(AOwner : TComponent; tipo : Integer); reintroduce; {1:Alta, 2: Baja, 3: Stock}
  end;

var
  FEveMovimientosAlimentacion: TFEveMovimientosAlimentacion;

implementation

{$R *.dfm}

uses
  UPrincipal, UABMSuplementacion, UAbmSimple, UMensajeHuella, URepStockAlimentos;

constructor TFEveMovimientosAlimentacion.Create(AOwner : TComponent; tipo : Integer);
begin
  inherited Create(AOwner);
  TipoMovimiento := tipo;
  ActConsulta;
  IBQTipoMovAlta.Close;
  IBQTipoMovAlta.Open;
  IBQTipoMovAlta.Last;
  IBQTipoMovAlta.First;
  IBQTipoMovBaja.Close;
  IBQTipoMovBaja.Open;
  IBQTipoMovBaja.Last;
  IBQTipoMovBaja.First;
  DTPFechaAlta.Date := Date();
  alimento := -1;
  costo := 0;
  cantidad := 0;
  busqueda := '';
  desdeEve := false;
end;

procedure TFEveMovimientosAlimentacion.ActConsulta;
var
  SQLStr2 : String;
begin
  totalCant := 0;
  totalCosto := 0;
  SQLStr := 'select * from cod_tipos_suplementaciones where id_tipo_suplementacion > 0 and nombre like :busqueda';
  SQLStr2 := 'select sum(cantidad/1000) as cant, sum(precio*cantidad/1000) as precio from cod_tipos_suplementaciones where id_tipo_suplementacion > 0 and nombre like :busqueda';
//  SQLStr2 := 'select sum(cantidad) as cant, sum(precio*cantidad) as precio from cod_tipos_suplementaciones where id_tipo_suplementacion > 1 and nombre like :busqueda';
// modificado x tere Unid Consumo kgs
  if TipoMovimiento = 3 then
  begin
    SQLStr := 'select * from cod_tipos_suplementaciones where id_tipo_suplementacion >0 and nombre like :busqueda; '; // and cantidad > 0';
    SQLStr2 := 'select sum(cantidad/1000) as cant, sum(precio*cantidad/1000) as precio from cod_tipos_suplementaciones where id_tipo_suplementacion > 0 and nombre like :busqueda ' ; // and cantidad > 0';
//SQLStr2 := 'select sum(cantidad) as cant, sum(precio*cantidad/1000) as precio from cod_tipos_suplementaciones where id_tipo_suplementacion > 1 and nombre like :busqueda and cantidad > 0';
// modificado x tere Unid Consumo kgs
  end;
  IBQAlimentos.Close;
  IBQAlimentos.SQL.Clear;
  IBQAlimentos.SQL.Add(SQLStr);
  if busqueda <> '' then
    IBQAlimentos.ParamByName('busqueda').Value := '%'+busqueda+'%'
  else
    IBQAlimentos.ParamByName('busqueda').Value := '%';
  IBQAlimentos.Open;

  IBQCantidad.Close;
  IBQCantidad.SQL.Clear;
  IBQCantidad.SQL.Add(SQLStr2);
  if busqueda <> '' then
    IBQCantidad.ParamByName('busqueda').Value := '%'+busqueda+'%'
  else
    IBQCantidad.ParamByName('busqueda').Value := '%';
  IBQCantidad.Open;

  if ((IBQCantidad.FieldValues['cant'] <> null) and (IBQCantidad.FieldValues['precio'] <> null)) then
  begin
      LTotalStock.Caption := 'Total en Stock: '+FormatFloat('#0.0',IBQCantidad.FieldValues['cant'])+' Ton';      ///%1000
      LTotalInventario.Caption := 'Inventario Total: $'+FormatFloat('#0.0',IBQCantidad.FieldValues['precio']); /// %1000
  end
  else                                                            /// dividi x 1000 para error  redondeo
  begin
      LTotalStock.Caption := 'Total en Stock: 0 Ton';
      LTotalInventario.Caption := 'Inventario Total: $ 0,0';
  end;

end;

procedure TFEveMovimientosAlimentacion.FormShow(Sender: TObject);
begin
  inherited;
  PAlimentos.Visible := true;
  PAlimentos.BringToFront;
  PAlimentos.Align := alClient;
 
  case TipoMovimiento of
    1 : begin
          IAlta.Visible := true;
          LMedio.Caption := 'Alta de Alimentos';
          LTitulo.Caption := 'Alta de Alimentos';
          ICancelar.Visible := true;
        end;
    2 : begin
          IBaja.Visible := true;
          LMedio.Caption := 'Baja de Alimentos';
          LTitulo.Caption := 'Baja de Alimentos';
          ICancelar.Visible := true;
        end;
    3 : begin
          IPreview.Visible := true;
          LMedio.Caption := 'Vista previa';
          LTitulo.Caption := 'Stock de Alimentos';
          ICancelar.Visible := true;
        end;
  end;

  if desdeEve then
  begin
    IBQAlimentos.Locate('id_tipo_suplementacion',alimento,[]);

    IAltaClick(nil);
  end;

end;

procedure TFEveMovimientosAlimentacion.DBGAlimentosCellClick(
  Column: TColumn);
begin
  inherited;
  alimento := IBQAlimentos.FieldValues['id_tipo_suplementacion'];
  LAlimentoAlta.Caption := IBQAlimentos.FieldValues['nombre'];
  LAlimentoBaja.Caption := IBQAlimentos.FieldValues['nombre'];
end;

procedure TFEveMovimientosAlimentacion.IAltaClick(Sender: TObject);
begin
  inherited;
  IGuardar.Visible := true;
  LGuardar.Visible := true;
  PAlimentos.Visible := false;
  DTPFechaAlta.Date := date;
  ECantidadAlta.Clear;
  ECostoAlta.Clear;
  DBLCBTipoAlta.KeyValue := null;
  PAlta.Visible := true;
  PAlta.BringToFront;
  PAlta.Align := alClient;
  IAgregarAlimento.Visible := false;
  LAgregaAlimento.Visible := false;
  IAlta.Visible := false;
  LMedio.Visible := false;
end;

procedure TFEveMovimientosAlimentacion.ICancelarClick(Sender: TObject);
begin
  inherited;
  if PAlimentos.Visible then
  begin
    Close;
  end
  else
  begin
    case TipoMovimiento of
      1 : begin
            IGuardar.Visible := false;
            LGuardar.Visible := false;
            PAlta.Visible := false;
            PAlimentos.Visible := true;
            PAlimentos.BringToFront;
            IAgregarAlimento.Visible := true;
            LAgregaAlimento.Visible := true;
            IAlta.Visible := true;
            LMedio.Visible := true;
          end;
      2 : begin
            IGuardar.Visible := false;
            LGuardar.Visible := false;
            PBaja.Visible := false;
            PAlimentos.Visible := true;
            PAlimentos.BringToFront;
            IAgregarAlimento.Visible := true;
            LAgregaAlimento.Visible := true;
            IBaja.Visible := true;
            LMedio.Visible := true;
          end;
    end;
  end;
end;

procedure TFEveMovimientosAlimentacion.IGuardarClick(Sender: TObject);
var cant: integer;
begin
  inherited;
  case TipoMovimiento of
    1:begin
        try
          IBQSPMovimientoAlimentacion.Close;
          IBQSPMovimientoAlimentacion.ParamByName('alimento').AsInteger := alimento;
          IBQSPMovimientoAlimentacion.ParamByName('tipo').AsInteger := TipoMovimiento;
          IBQSPMovimientoAlimentacion.ParamByName('fecha').AsDate := DTPFechaAlta.Date;
          IBQSPMovimientoAlimentacion.ParamByName('costo').AsFloat := costo;
          IBQSPMovimientoAlimentacion.ParamByName('cantidad').AsFloat := cantidad;
          IBQSPMovimientoAlimentacion.ParamByName('tipo_movimiento').AsInteger := DBLCBTipoAlta.KeyValue;
          IBQSPMovimientoAlimentacion.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
        PAlta.Visible := false;
        PAlimentos.Visible := true;
        PAlimentos.BringToFront;
        IGuardar.Visible := false;
        LGuardar.Visible := false;
        IAgregarAlimento.Visible := true;
        LAgregaAlimento.Visible := true;
        IAlta.Visible := true;
        LMedio.Visible := true;
        ActConsulta;
        if desdeEve then
        begin
          cantResult := cantidad;
          Close;
        end;
      end;
    2:begin

          IBQCantAlimento.Close;
          IBQCantAlimento.ParamByName('alimento').AsInteger := alimento;
          IBQCantAlimento.Open;

          cant := IBQCantAlimento.FieldByName('cantidad').Value;

          if (cant > 0) and (cant >= cantidad) then
          begin
            try
              IBQSPMovimientoAlimentacion.Close;
              IBQSPMovimientoAlimentacion.ParamByName('alimento').AsInteger := alimento;
              IBQSPMovimientoAlimentacion.ParamByName('tipo').AsInteger := TipoMovimiento;
              IBQSPMovimientoAlimentacion.ParamByName('fecha').AsDate := DTPFechaBaja.Date;
              IBQSPMovimientoAlimentacion.ParamByName('costo').AsFloat := costo;
              IBQSPMovimientoAlimentacion.ParamByName('cantidad').AsFloat := cantidad;
              IBQSPMovimientoAlimentacion.ParamByName('tipo_movimiento').AsInteger := DBLCBTipoBaja.KeyValue;
              IBQSPMovimientoAlimentacion.Open;
              FPrincipal.IBTPrincipal.CommitRetaining;
            except
                FPrincipal.IBTPrincipal.RollbackRetaining;
            end;
          end
          else
              MostrarMensaje(tmInformacion,'No puede eliminarse esa cantidad, ya que es menor al stock actual');


        PAlta.Visible := false;
        PAlimentos.Visible := true;
        PAlimentos.BringToFront;
        IGuardar.Visible := false;
        LGuardar.Visible := false;
        IAgregarAlimento.Visible := true;
        LAgregaAlimento.Visible := true;
        IBaja.Visible := true;
        LMedio.Visible := true;
        ActConsulta;
      end;
  end;
end;

procedure TFEveMovimientosAlimentacion.IBajaClick(Sender: TObject);
begin
  inherited;
  IGuardar.Visible := true;
  LGuardar.Visible := true;
  PAlimentos.Visible := false;
  DTPFechaBaja.Date := date;
  ECantidadBaja.Clear;
  ECostoBaja.Clear;
  DBLCBTipoBaja.KeyValue := null;
  PBaja.Visible := true;
  PBaja.BringToFront;
  PBaja.Align := alClient;
  IAgregarAlimento.Visible := false;
  LAgregaAlimento.Visible := false;
  IBaja.Visible := false;
  LMedio.Visible := false;
end;

procedure TFEveMovimientosAlimentacion.IAgregarAlimentoClick(
  Sender: TObject);
var
  F : TFABMSuplementacion;
begin
  inherited;
  F := TFABMSuplementacion.Create(self);
  F.desdeEvento := 0;
  F.ShowModal;
  alimento := F.ValorRetorno;
  F.Destroy;
  ActConsulta;
  IBQAlimentos.Locate('id_tipo_suplementacion',alimento,[]);
  DBGAlimentosCellClick(nil);
  case TipoMovimiento of
    1 : begin
          IGuardar.Visible := true;
          LGuardar.Visible := true;
          PAlimentos.Visible := false;
          DTPFechaAlta.Date := date;
          ECantidadAlta.Clear;
          ECostoAlta.Clear;
          DBLCBTipoAlta.KeyValue := null;
          PAlta.Visible := true;
          PAlta.BringToFront;
          PAlta.Align := alClient;
        end;
    2 : begin
          IGuardar.Visible := true;
          LGuardar.Visible := true;
          PAlimentos.Visible := false;
          DTPFechaBaja.Date := date;
          ECantidadBaja.Clear;
          ECostoBaja.Clear;
          DBLCBTipoBaja.KeyValue := null;
          PBaja.Visible := true;
          PBaja.BringToFront;
          PBaja.Align := alClient;
        end;
  end;
end;

procedure TFEveMovimientosAlimentacion.CalcularTotal;
begin
  if (cantidad > 0) and (costo > 0) then
  begin
    LTotalCompra.Visible := true;
    LTotalVenta.Visible := true;
    LTotalCompra.Caption := '$'+FormatFloat('#0.00',cantidad/1000*costo)+' Totales';      //xq se cambio unidad de ton a kgs
    LTotalVenta.Caption := '$'+FormatFloat('#0.00',cantidad/1000*costo)+' Totales';
    //costo := cantidad * costo;
  end;
end;

procedure TFEveMovimientosAlimentacion.ECostoBajaChange(Sender: TObject);
var
  d : Double;
begin
  inherited;
  d := 0;
  costo := 0;
  if TryStrToFloat(ECostoBaja.Text,d) then
    costo := d;
  CalcularTotal;
end;

procedure TFEveMovimientosAlimentacion.ECantidadBajaChange(
  Sender: TObject);
var
  d : Double;
begin
  inherited;
  d := 0;
  cantidad := 0;
  if TryStrToFloat(ECantidadBaja.Text,d) then
    cantidad := d;
  CalcularTotal;
end;

procedure TFEveMovimientosAlimentacion.ECantidadAltaChange(
  Sender: TObject);
var
  d : Double;
begin
  inherited;
  d := 0;
  cantidad := 0;
  if TryStrToFloat(ECantidadAlta.Text,d) then
    cantidad := d;
  CalcularTotal;
end;

procedure TFEveMovimientosAlimentacion.ECostoAltaChange(Sender: TObject);
var
  d : Double;
begin
  inherited;
  d := 0;
  costo := 0;
  if TryStrToFloat(ECostoAlta.Text,d) then
    costo := d;
  CalcularTotal;
end;

procedure TFEveMovimientosAlimentacion.IPreviewClick(Sender: TObject);
var
  F : TFRepStockAlimentos;
begin
  inherited;
  F := TFRepStockAlimentos.Create(self);
  F.QRLCants.Caption := LTotalStock.Caption+'        '+LTotalInventario.Caption;
  F.ShowModal;
  F.Destroy;
end;

procedure TFEveMovimientosAlimentacion.EBuscarChange(Sender: TObject);
begin
  inherited;
  busqueda := EBuscar.Text;
  ActConsulta;
end;

procedure TFEveMovimientosAlimentacion.DBGAlimentosDblClick(
  Sender: TObject);
begin
  inherited;
  case TipoMovimiento of
    1 : IAltaClick(nil);
    2 : IBajaClick(nil);
  end;
end;

procedure TFEveMovimientosAlimentacion.IBQAlimentosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  IBQAlimentosPRECIO_INV.Value := (IBQAlimentosPRECIO.Value * IBQAlimentosCANTIDAD.Value )/1000;
 //IBQAlimentosCANTIDAD.Value := ( IBQAlimentosCANTIDAD.Value/1000);
end;

end.
