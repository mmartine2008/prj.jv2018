unit UEveCompraEmbriones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, PngImage, jpeg, JvExControls, JvLabel,
  JvGIF, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TTipoStock = (tsCompra, tsBaja);
  TFEveCompraEmbriones = class(TFUniversal)
    PPadres: TPanel;
    PBotones: TPanel;
    BBCompraEmbriones: TBitBtn;
    BBAddPadres: TSpeedButton;
    BDBGAnimales: TBitDBGrid;
    IBQPadres: TIBQuery;
    DSPadres: TDataSource;
    IBSPAuxEmbriones: TIBStoredProc;
    IBSPCargarEmbriones: TIBStoredProc;
    BBSalir: TBitBtn;
    IFondoB: TImage;
    ICancelar: TImage;
    LCancelar: TLabel;
    IInsertar: TImage;
    LInsertar: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    PSuperior: TPanel;
    EBuscar: TEdit;
    Label1: TLabel;
    IBuscarAnimales: TImage;
    LCantidad: TLabel;
    LVerAnimales: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BBAddPadresClick(Sender: TObject);
    procedure BDBGAnimalesCellClick(Column: TColumn);
    procedure BBCompraEmbrionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBQPadresAfterOpen(DataSet: TDataSet);
    procedure BBSalirClick(Sender: TObject);
    procedure IBuscarAnimalesClick(Sender: TObject);
    procedure EBuscarKeyPress(Sender: TObject; var Key: Char);
  private
    FTipoStock : TTipoStock;
    Madre, Padre1, Padre2 : Variant;
    IntM, ExtP1, ExtP2 : Variant;
    procedure SetTipoStock(Value : TTipoStock);
    procedure ActPadres();
    procedure BorrarAuxiliares();
    procedure CargarAuxiliares();
    function DatosEmbriones() : TModalResult;
    procedure GuardarDatosEmbriones();
    procedure HabilitarPadre();
    procedure ConfigColumnas();
  public
    property TipoStock : TTipoStock read FTipoStock write SetTipoStock;
  end;

var
  FEveCompraEmbriones: TFEveCompraEmbriones;
  consulta : string;

implementation

uses
  UPrincipal, UEvePadresCompra, UDatosEmbriones, UTraduccion;

{$R *.dfm}

procedure TFEveCompraEmbriones.FormCreate(Sender: TObject);
begin
  inherited;

//  consulta := 'SELECT * FROM SP_DATOS_COMPRA_EMBRION(:ESTA,''C'') order by RP_MADRE, RP_PADRE1';

//  ActPadres;
end;

procedure TFEveCompraEmbriones.ActPadres();
begin
  IBQPadres.Close;
  IBQPadres.SQL.Clear;
  IBQPadres.SQL.Add(consulta);
  IBQPadres.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPadres.Open;
  IBQPadres.Last;
  IBQPadres.First;

  LCantidad.Caption := 'Cantidad de Animales: '+IntToStr(IBQPadres.RecordCount);

  HabilitarPadre();
  ConfigColumnas();
end;

procedure TFEveCompraEmbriones.HabilitarPadre();
begin
  IBQPadres.First;
  while not IBQPadres.Eof do
  begin
    if IBQPadres.FieldByName('ID_PADRE2').AsInteger > 0 then
    begin
      BDBGAnimales.Columns[8].Visible := true;
      BDBGAnimales.Columns[9].Visible := true;
      BDBGAnimales.Columns[10].Visible := true;
      break;
    end;
    IBQPadres.Next;
  end;
end;

procedure TFEveCompraEmbriones.ConfigColumnas;
begin
  BDBGAnimales.Columns[0].Width := 118;
  BDBGAnimales.Columns[1].Width := 110;
  BDBGAnimales.Columns[2].Width := 125;
  BDBGAnimales.Columns[3].Width := 200;
  BDBGAnimales.Columns[4].Width := 90;
  BDBGAnimales.Columns[5].Width := 125;
  BDBGAnimales.Columns[6].Width := 200;
  BDBGAnimales.Columns[7].Width := 100;
  BDBGAnimales.Columns[8].Width := 125;
  BDBGAnimales.Columns[9].Width := 200;
  BDBGAnimales.Columns[10].Width := 100;
end;

procedure TFEveCompraEmbriones.BBAddPadresClick(Sender: TObject);
var
  F : TFEvePadresCompra;
begin
  inherited;
  F := TFEvePadresCompra.Create(nil);
  F.ShowModal;
  if F.ModalResult <> mrCancel then
    GuardarDatosEmbriones;
  ActPadres();
  F.Destroy;
end;

procedure TFEveCompraEmbriones.BDBGAnimalesCellClick(Column: TColumn);
begin
  inherited;
  Madre := IBQPadres.FieldValues['ID_MADRE'];
  Padre1 := IBQPadres.FieldValues['ID_PADRE1'];
  Padre2 := IBQPadres.FieldValues['ID_PADRE2'];
  IntM := IBQPadres.FieldValues['MADRE_INT'];
  ExtP1 := IBQPadres.FieldValues['EXT_1'];
  ExtP2 := IBQPadres.FieldValues['EXT_2'];
  BBCompraEmbriones.Enabled := Madre <> null;
end;

procedure TFEveCompraEmbriones.BorrarAuxiliares;
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFEveCompraEmbriones.CargarAuxiliares;
begin
  try
    IBSPAuxEmbriones.Close;
    IBSPAuxEmbriones.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBSPAuxEmbriones.ParamByName('fecha').AsDate := IBQPadres.FieldValues['FECHA_COLECCION'];
    IBSPAuxEmbriones.ParamByName('madre').Value := Madre;
    IBSPAuxEmbriones.ParamByName('padre1').Value := Padre1;
    IBSPAuxEmbriones.ParamByName('padre2').Value := Padre2;
    IBSPAuxEmbriones.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

function TFEveCompraEmbriones.DatosEmbriones : TModalResult;
var
  F : TFDatosEmbriones;
begin
  F := TFDatosEmbriones.Create(self,0,IBQPadres.FieldValues['FECHA_COLECCION']);
  if IBQPadres.FieldValues['MADRE_INT'] = 'S' then
    F.ModoColeccion := mcInterno
  else
    F.ModoColeccion := mcExterno;
  F.Madre := Madre;
  F.Padre_1 := Padre1;
  
  if TipoStock = tsCompra then
    F.TipoDeDato := tddAlta;

  if TipoStock = tsBaja then
    F.TipoDeDato := tddEliminar;
    
  F.Externo_1 := IBQPadres.FieldValues['EXT_1'];
  F.Padre_2 := Padre2;
  if IBQPadres.FieldValues['EXT_2'] <> null then
    F.Externo_2 := IBQPadres.FieldValues['EXT_2'];
  F.ShowModal;
  Result := F.ModalResult;
  F.Destroy;
end;

procedure TFEveCompraEmbriones.BBCompraEmbrionesClick(Sender: TObject);

begin
  inherited;
  if not IBQPadres.IsEmpty then
  begin
    BorrarAuxiliares;
    CargarAuxiliares;
    if DatosEmbriones <> mrCancel then
      GuardarDatosEmbriones;
    BorrarAuxiliares;
    ActPadres;
  end;
end;

procedure TFEveCompraEmbriones.SetTipoStock(Value : TTipoStock);
begin
  FTipoStock := Value;
end;

procedure TFEveCompraEmbriones.FormShow(Sender: TObject);
begin
  inherited;
  if TipoStock = tsCompra then
  begin
    LTitulo.Caption := Traducir('Compra de Embriones');
    BBAddPadres.Visible := true;
    LInsertar.Visible := true;
    IInsertar.Visible := true;
    BBCompraEmbriones.Caption := Traducir('Ingresar Datos de Compra');

    consulta := 'SELECT * FROM SP_DATOS_COMPRA_EMBRION(:ESTA,''C'') order by RP_MADRE, RP_PADRE1';
  end;

  if TipoStock = tsBaja then
  begin
    LTitulo.Caption := Traducir('Baja de Embriones');
    PTitulo.Caption := Traducir('Baja de Embriones');
    BBAddPadres.Visible := false;
    LInsertar.Visible := false;
    IInsertar.Visible := false;
    BBCompraEmbriones.Caption := Traducir('Eliminar Embriones');

    consulta := 'SELECT * FROM SP_DATOS_COMPRA_EMBRION(:ESTA,''B'') order by RP_MADRE, RP_PADRE1';    
  end;

  ActPadres;
end;

procedure TFEveCompraEmbriones.GuardarDatosEmbriones;
begin
  try
    IBSPCargarEmbriones.Close;
    IBSPCargarEmbriones.ParamByName('madre').AsInteger := Madre;
    IBSPCargarEmbriones.ParamByName('interna').AsString := 'N';
    IBSPCargarEmbriones.ParamByName('evento').Value := null;
    IBSPCargarEmbriones.ParamByName('centro_transplante').Value := null;
    if TipoStock = tsBaja then
      IBSPCargarEmbriones.ParamByName('tipo').Value := 'D'
    else
      IBSPCargarEmbriones.ParamByName('tipo').Value := 'A';
    IBSPCargarEmbriones.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFEveCompraEmbriones.IBQPadresAfterOpen(DataSet: TDataSet);
begin
  inherited;
  //BBCompraEmbriones.Enabled := not DataSet.IsEmpty;
end;

procedure TFEveCompraEmbriones.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFEveCompraEmbriones.IBuscarAnimalesClick(Sender: TObject);
var sql1, sql2 : string;
begin
  inherited;

  if (EBuscar.Text <> '') then
  begin
    sql1 := 'SELECT * FROM SP_DATOS_COMPRA_EMBRION(:ESTA,''C'')';
    sql2 := ' where (RP_MADRE LIKE ''%' +EBuscar.Text+ '%'') or (N_MADRE LIKE ''%' +EBuscar.Text+ '%'') or (HBA_MADRE LIKE ''%' +EBuscar.Text+ '%'') or (RP_PADRE1 LIKE ''%' +EBuscar.Text+ '%'') or (N_PADRE1 LIKE ''%' +EBuscar.Text+ '%'') or (HBA_PADRE1 LIKE ''%' +EBuscar.Text+ '%'') or (RP_PADRE2 LIKE ''%' +EBuscar.Text+ '%'') or (N_PADRE2 LIKE ''%' +EBuscar.Text+ '%'') or (HBA_PADRE2 LIKE ''%' +EBuscar.Text+ '%'') order by RP_MADRE, RP_PADRE1';
    consulta := sql1 + sql2;
  end
  else
    consulta := 'SELECT * FROM SP_DATOS_COMPRA_EMBRION(:ESTA,''C'') order by RP_MADRE, RP_PADRE1';

  ActPadres;
end;

procedure TFEveCompraEmbriones.EBuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
       IBuscarAnimalesClick(sender);
       key := #0;
  end;
end;

end.
