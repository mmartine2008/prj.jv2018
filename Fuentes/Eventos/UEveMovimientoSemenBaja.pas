unit UEveMovimientoSemenBaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSemenBasico, IBStoredProc, DB, IBCustomDataSet, ActnList,
  StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, WinXP,
  DataExport, DataToXLS, IBQuery, JvExControls, JvLabel, PngImage, jpeg,
  JvGIF, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFBajadeSemen = class(TFMovimientosdeSemen)
    PSuperior: TPanel;
    LBuscarPor: TLabel;
    RBUltimosDiezA: TRadioButton;
    RBTodos: TRadioButton;
    EBuscar: TEdit;
    IVerAnimales: TImage;
    LVerAnimales: TLabel;
    LCant: TLabel;
    IEliminarDosis: TImage;
    LEliminarDosis: TLabel;
    IBQPrecioAnimal: TIBQuery;
    IListadoVentas: TImage;
    LListadoVentas: TLabel;
    RBTerceros: TRadioButton;
    IBQParametroDeTerceros: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BDBGSemenDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IVerAnimalesClick(Sender: TObject);
    procedure EBuscarChange(Sender: TObject);
    procedure EBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure BDBGSemenTitleClick(Column: TColumn);
    procedure IListadoVentasClick(Sender: TObject);
  private

    procedure AjustarColumnas;
  protected
    function ChequearCantidad(A:integer; B:integer(*sale*)):Boolean; override;
    procedure PasarParametro;override;{ Private declarations }
  public
    SQLTodos, SQLOriginal : string;
  end;

var
  FBajadeSemen: TFBajadeSemen;
  vFiltrar : boolean;
  orden_consulta : string;
  columna_anterior : string;

implementation

{$R *.dfm}
uses UModificacionSemen, UPrincipal, UMensajeHuella, UTraduccion,
     UUniversal, UModificacionDatosSemen, URepListadoVentas, DateUtils;

procedure TFBajadeSemen.FormCreate(Sender: TObject);
begin
  inherited;
  FTipoModificacionSemen := 2;//Tipo Movimiento = Baja
  self.SBSemental.Visible := false;
  FEsCompra := false;  
end;


function TFBajadeSemen.ChequearCantidad(A:integer; B:integer(*sale*)):Boolean;
begin
  Result := (A >= B);
  if not(result) then
     MostrarMensaje(tmError, 'No hay suficientes Dosis');
end;

procedure TFBajadeSemen.BDBGSemenDblClick(Sender: TObject);
var F : TFModificacionDatosSemen;
begin

    F := TFModificacionDatosSemen.Create(self);
    F.LAnimal.Caption := 'RP: ' + IBDSToros.FieldbyName('id_rp').AsString + ' - H.B.A: ' + IBDSToros.FieldbyName('id_hba').AsString + ' - ' + Traducir('Nombre: ') + IBDSToros.FieldbyName('Nombre').AsString + ' - Apodo: ' + IBDSToros.FieldbyName('Apodo').AsString;
//    F.LPrecio.Visible := false;
//    F.EPrecioSemen.Visible := false;
//    F.LSigno.Visible := false;
//    F.DBLCBACentrosSemen.Visible := false;
//    F.LCentros.Visible := false;

    IBQPrecioAnimal.Close;
    IBQPrecioAnimal.ParamByName('aux_semen').AsInteger := IBDSToros.FieldValues['id_semen'];
    IBQPrecioAnimal.Open;

    if (IBQPrecioAnimal.FieldValues['precio'] <> null) then
      F.EPrecioSemen.Text := FloatToStr(IBQPrecioAnimal.FieldValues['precio'])
    else
      F.EPrecioSemen.Text := '';

    F.LDosisDisponiblesValue.Caption := IntToStr(IBDSToros.FieldValues['cantidad']) + ')';

    F.FSemen := IBDSToros.FieldValues['id_semen'];
    F.FCantidad := IBDSToros.FieldValues['cantidad'];
    F.FTipo := FTipoModificacionSemen;

    F.ShowModal;
    F.Destroy;

    IVerAnimalesClick(sender);
end;

procedure TFBajadeSemen.BitBtn1Click(Sender: TObject);
begin
  self.BDBGSemenDblClick(sender);
end;

procedure TFBajadeSemen.PasarParametro;
begin
  inherited;
  IBDSToros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBDSToros.ParamByName('tipo').AsInteger := 1;
end;

procedure TFBajadeSemen.FormShow(Sender: TObject);
begin
  inherited;

  IBQParametroDeTerceros.Close;
  IBQParametroDeTerceros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQParametroDeTerceros.Open;
  RBTerceros.Visible := false;
  if IBQParametroDeTerceros.FieldValues['valor'] <> null then
    RBTerceros.Visible := IBQParametroDeTerceros.FieldByName('valor').AsString = 'S';

  vFiltrar := false;
  RBUltimosDiezA.Checked := true;

  EBuscar.SetFocus;

  IVerAnimalesClick(sender);

  AjustarColumnas;

end;

procedure TFBajadeSemen.IVerAnimalesClick(Sender: TObject);
var SQLStr, SQLFiltro : string;
    tipo : integer;
begin
  inherited;

  SQLStr:= 'select * from sp_listado_animales_baja_semen(:establecimiento, :tipo)';

  SQLFiltro := ' where ((id_rp like ''%' +EBuscar.Text+ '%'') or (id_hba like ''%' +EBuscar.Text+ '%'') or (nombre like ''%' +EBuscar.Text+ '%'') or (apodo like ''%' +EBuscar.Text+ '%''))';

  if (RBUltimosDiezA.Checked) then
    tipo := 0;
  if (RBTodos.Checked) then
    tipo := 1;
  if (RBTerceros.Checked) then
    tipo := 2;

  IBDSToros.Close;
  IBDSToros.SelectSQL.Clear;

  if ((vFiltrar) and (orden_consulta = '')) then
  begin
    SQLStr := SQLStr + SQLFiltro + ' order by id_rp';
  end
  else
  begin
    if ((vFiltrar) and (orden_consulta <> '')) then
        SQLStr := SQLStr + SQLFiltro + orden_consulta
    else
        if (orden_consulta <> '') then
          SQLStr := SQLStr + orden_consulta;
  end;
  
  IBDSToros.SelectSQL.Add(SQLStr);

  IBDSToros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBDSToros.ParamByName('tipo').AsInteger := tipo;

  IBDSToros.Open;
  IBDSToros.Last;
  IBDSToros.First;

  LCant.Caption := 'Cantidad de animales: ' + IntToStr(IBDSToros.RecordCount);

  EBuscar.Text := '';
  vFiltrar := false;

end;

procedure TFBajadeSemen.EBuscarChange(Sender: TObject);
begin

  if (EBuscar.Text <> '') then
    vFiltrar := true
  else
    vFiltrar := false;
    
end;

procedure TFBajadeSemen.EBuscarKeyPress(Sender: TObject; var Key: Char);
begin

  if (key = #13) then
  begin
       vFiltrar := true;
       IVerAnimalesClick(sender);
       key := #0; 
  end;

end;

procedure TFBajadeSemen.AjustarColumnas;
begin
  BDBGSemen.Columns[0].Width := 80;
  BDBGSemen.Columns[1].Width := 80;
  BDBGSemen.Columns[2].Width := 80;
  BDBGSemen.Columns[3].Width := 265;
  BDBGSemen.Columns[4].Width := 265;
  BDBGSemen.Columns[5].Width := 75;
  BDBGSemen.Columns[6].Width := 75;
end;

procedure TFBajadeSemen.BDBGSemenTitleClick(Column: TColumn);
var
  i : Integer;
begin
  inherited;

  for i := 0 to BDBGSemen.Columns.Count-1 do
    BDBGSemen.Columns[i].Title.Color := clBtnFace;

  if Column.FieldName = columna_anterior then
  begin
    orden_consulta := ' order by '+Column.FieldName+' asc';
    Column.Title.Color := clMoneyGreen;
    columna_anterior := '';
  end
  else
  begin
    orden_consulta := ' order by '+Column.FieldName+' desc';
    columna_anterior := Column.FieldName;
    Column.Title.Color := clMoneyGreen;
  end;

  IVerAnimalesClick(self);

end;

procedure TFBajadeSemen.IListadoVentasClick(Sender: TObject);
var F : TFListadoVentas;
    sql1, sql2, sql3, sqlGral, sqlConsulta : string;
    desde, hasta : TDate;
begin
  inherited;

  sql1 := 'select * from rep_listado_ventas(:desde,:hasta,:establecimiento)';
  sql3 := ' order by dosis desc';

  sqlGral := sql1 + sql3;

  hasta := Now();
  desde := IncYear(Now(),-1);

  F := TFListadoVentas.Create(self);

  F.IBQListadoVentas.Close;
  F.IBQListadoVentas.SQL.Clear;
  F.IBQListadoVentas.SQL.Add(sqlGral);
  F.IBQListadoVentas.ParamByName('desde').AsDate := desde;
  F.IBQListadoVentas.ParamByName('hasta').AsDate := hasta;
  F.IBQListadoVentas.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  F.IBQListadoVentas.Open;

  F.QRListadoVentas.Preview;
  F.Destroy;

end;

end.

