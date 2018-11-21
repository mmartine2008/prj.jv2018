unit UREPInfoGralGest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, DateTimePickerAuto,
  DBCtrls, UDBLookupComboBoxAuto, Grids, DBGrids, UBDBGrid, ComboBoxAuto,
  Buttons, Series, TeEngine, TeeProcs, Chart, DbChart, UPrincipal, IBQuery,
  TeeFunci, UREPInfoGralGestPreview, QuickRpt, QRCtrls, UCartel,
  DateUtils, Types, UMensajeImpresora, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit;

type
  TFREPInfoGralGest = class(TFUniversal)
    Panel1: TPanel;
    RGTipo: TRadioGroup;
    GBGrupos: TGroupBox;
    DBLCBASeleccionGrupo: TDBLookupComboBoxAuto;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    Panel2: TPanel;
    RGFiltros: TRadioGroup;
    GroupBox2: TGroupBox;
    CBListado: TCheckBox;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    MObservaciones: TMemo;
    Panel4: TPanel;
    GBAnimales: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    CBACategoria: TComboBoxAuto;
    DBCCondPrenezVacias: TDBChart;
    DBCCondPrenezPreniadas: TDBChart;
    DBCTactadas: TDBChart;
    DBCServidas: TDBChart;
    DBCDistribucion: TDBChart;
    PieSeries2: TPieSeries;
    SGTablaCron: TStringGrid;
    IBQSPPorcentajesPrenez: TIBQuery;
    IBQSPPorcentajesPrenezCANTIDAD: TIntegerField;
    IBQSPPorcentajesPrenezNOMBRE: TIBStringField;
    IBQSPPorcentajesPrenezSERVIDA: TIBStringField;
    IBQCantDist: TIBQuery;
    IBQCantDistCond: TIBQuery;
    IBQCantDistCron: TIBQuery;
    IBQCantDistCondCANTIDAD: TIntegerField;
    IBQCantDistCondCONDICION: TIntegerField;
    IBQCantDistCondVALORCONDICION: TIBStringField;
    IBQCantDistCondREPRO: TIBStringField;
    DBCCronPreniezVacias: TDBChart;
    SGTablaCond: TStringGrid;
    IBQAux: TIBQuery;
    IBQCantDistCondID_CODIGO_PRENEZ: TIBStringField;
    IBQGrupos: TIBQuery;
    DSGrupos: TDataSource;
    IBQInfoGralGest: TIBQuery;
    IBQInfoGralGestRP_ANIMAL: TIBStringField;
    IBQInfoGralGestRAZA: TIBStringField;
    IBQInfoGralGestCRONOLOGIA: TIBStringField;
    IBQInfoGralGestDISTRIBUCION: TIBStringField;
    IBQInfoGralGestCONDICION: TIBStringField;
    IBQInfoGralGestRESULT_BRUC: TIBStringField;
    DSListado: TDataSource;
    IBQInfoGralGestCATEGORIA: TIntegerField;
    IBQInfoGralGestRODEO: TIntegerField;
    IBQCantDistCANTIDAD: TIntegerField;
    IBQCantDistNOMBRE: TIBStringField;
    IBQInfoGralGestOBSERVACIONES_DIAG: TIBStringField;
    DBCPorPrenCron: TDBChart;
    DBPorPrenCond: TDBChart;
    DBCronPreniezPreniadas: TDBChart;
    IBQInfoGralGestFECHA: TDateField;
    IBQInfoGralGestID_ANIMAL: TIntegerField;
    IBQInfoGralGestEDAD: TIntegerField;
    RGTipoAnalisis: TRadioGroup;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    LExpExcel: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    GroupBox3: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    IBQRodeo: TIBQuery;
    CBRodeo: TComboBox;
    procedure RGTipoClick(Sender: TObject);
    procedure DBLCBASeleccionGrupoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGFiltrosClick(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure CBACategoriaCloseUp(Sender: TObject);
    function PieSeries1BeforeAdd(Sender: TChartSeries): Boolean;
    function Series7BeforeAdd(Sender: TChartSeries): Boolean;
    function Series2BeforeAdd(Sender: TChartSeries): Boolean;
    function BarSeries1BeforeAdd(Sender: TChartSeries): Boolean;
    function BarSeries2BeforeAdd(Sender: TChartSeries): Boolean;
    procedure SGTablaCronDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGTablaCondDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GetMarkText(Sender: TChartSeries;
      ValueIndex: Integer; var MarkText: String);
    procedure GetAxisLabelCron(Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
      var LabelText: String);
    procedure GetAxisLabelCond(Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
      var LabelText: String);
    procedure BeforeDrawAxes(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure IBQGruposAfterOpen(DataSet: TDataSet);
    procedure BBSalirClick(Sender: TObject);
    procedure IBQInfoGralGestAfterOpen(DataSet: TDataSet);
    procedure BBXlsClick(Sender: TObject);
    procedure GetMarkText1(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: String);
    procedure DBCDistribucionAfterDraw(Sender: TObject);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure DBLCBASeleccionGrupoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGTipoAnalisisClick(Sender: TObject);
    procedure DTPACloseUpFechas(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBASeleccionGrupoClick(Sender: TObject);
    procedure DTPADesdeClick(Sender: TObject);
    procedure LHastaClick(Sender: TObject);
    procedure CBRodeoClick(Sender: TObject);
    procedure CBACategoriaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
    procedure DatosChange(Sender: TObject);
  private
    Desde, Hasta : TDate;
    Grupo, Rodeo, Categoria, Indice : integer;
    PorGrupo, PorCategoria, PorRodeo : Boolean;
    TotalCond, TotalCron : integer;
    NomGrupo, NomCateg, NomRodeo : String;
    CronVac, CronPre, CondVac, CondPre, PorPrenCond, PorPrenCron : TBarSeries;
    PorcentajeTactadas, PorcentajeServidas : TPieSeries;
    Listado, CantDist, CantDistCond, CantDistCron, Porcentaje : String;
    Condicion, CondicionRodeo, CondicionCategoria : String;
    Total : Integer;
    TotalBrucN, TotalBrucP, TotalBrucS, TotalBrucND : integer;
    RListado, RCantDist, RCantDistCond, RCantDistCron, RPorcentaje : String;
//    CartelOpen : TFCartelOpenQuery;
    procedure ActualizarDistPreniez();
    procedure ActualizarPorcentajes();
    procedure ActualizarListado();
    procedure ActualizarConsultas();
    procedure ArmarTablas();
    procedure ValoresTablaComunes(SGTabla : TStringGrid);
    procedure CargarValoresBlancosCron();
    procedure CargarValoresBlancosCond();
    procedure CargarValorDatosPorCron();
    procedure CargarValorDatosPorCond();
    procedure CrearSeries();
    procedure ArmarSeries();
    procedure ArmarTablaCondPreview(F : TFREPInfoGralGestPreview);
    procedure ArmarTablaCronPreview(F : TFREPInfoGralGestPreview);
  public

  end;

var
  FREPInfoGralGest: TFREPInfoGralGest;

implementation

uses UREPFichaAnimal, UTraduccion;

{$R *.dfm}

procedure TFREPInfoGralGest.ActualizarDistPreniez();
begin
  IBQCantDist.Close;
  IBQCantDist.SQL.Clear;
  if Condicion = '' then
    IBQCantDist.SQL.Add(CantDist+' where nombre <> ''Vacia'' '+Condicion+RCantDist)
  else
    IBQCantDist.SQL.Add(CantDist+Condicion+' and nombre <> ''Vacia'' '+RCantDist);
  if PorGrupo then
  begin
    IBQCantDist.ParamByName('desde').Value := null;
    IBQCantDist.ParamByName('hasta').Value := null;
    IBQCantDist.ParamByName('grupo').AsInteger := Grupo;
  end
  else
  begin
    IBQCantDist.ParamByName('desde').AsDate := Desde;
    IBQCantDist.ParamByName('hasta').AsDate := Hasta;
    IBQCantDist.ParamByName('grupo').Value := null;
  end;
  IBQCantDist.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCantDist.ParamByName('actual').AsDate := Date();
  IBQCantDist.Open;

  IBQCantDistCron.Close;
  IBQCantDistCron.SQL.Clear;
  IBQCantDistCron.SQL.Add(CantDistCron+Condicion+RCantDistCron);
  if PorGrupo then
  begin
    IBQCantDistCron.ParamByName('desde').Value := null;
    IBQCantDistCron.ParamByName('hasta').Value := null;
    IBQCantDistCron.ParamByName('grupo').AsInteger := Grupo;
  end
  else
  begin
    IBQCantDistCron.ParamByName('desde').AsDate := Desde;
    IBQCantDistCron.ParamByName('hasta').AsDate := Hasta;
    IBQCantDistCron.ParamByName('grupo').Value := null;
  end;
  IBQCantDistCron.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCantDistCron.ParamByName('actual').AsDate := Date();
  IBQCantDistCron.Open;

  IBQCantDistCond.Close;
  IBQCantDistCond.SQL.Clear;
  IBQCantDistCond.SQL.Add(CantDistCond+Condicion+RCantDistCond);
  if PorGrupo then
  begin
    IBQCantDistCond.ParamByName('desde').Value := null;
    IBQCantDistCond.ParamByName('hasta').Value := null;
    IBQCantDistCond.ParamByName('grupo').AsInteger := Grupo;
  end
  else
  begin
    IBQCantDistCond.ParamByName('desde').AsDate := Desde;
    IBQCantDistCond.ParamByName('hasta').AsDate := Hasta;
    IBQCantDistCond.ParamByName('grupo').Value := null;
  end;
  IBQCantDistCond.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCantDistCond.ParamByName('actual').AsDate := Date();
  IBQCantDistCond.Open;
end;

procedure TFREPInfoGralGest.ActualizarPorcentajes();
begin
  IBQSPPorcentajesPrenez.Close;
  IBQSPPorcentajesPrenez.SQL.Clear;
  IBQSPPorcentajesPrenez.SQL.Add(Porcentaje+Condicion+RPorcentaje);
  if PorGrupo then
  begin
    IBQSPPorcentajesPrenez.ParamByName('grupo').AsInteger := Grupo;
    IBQSPPorcentajesPrenez.ParamByName('desde').Value := null;
    IBQSPPorcentajesPrenez.ParamByName('hasta').Value := null;
  end
  else
  begin
    IBQSPPorcentajesPrenez.ParamByName('desde').AsDate := Desde;
    IBQSPPorcentajesPrenez.ParamByName('hasta').AsDate := Hasta;
    IBQSPPorcentajesPrenez.ParamByName('grupo').Value := null;
  end;
  IBQSPPorcentajesPrenez.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPPorcentajesPrenez.Open;
end;

procedure TFREPInfoGralGest.ActualizarListado();
var
  sqldebug: string;
begin
  TotalBrucN := 0;
  TotalBrucP := 0;
  TotalBrucND := 0;
  TotalBrucS := 0;
  IBQInfoGralGest.Close;
  IBQInfoGralGest.SQL.Clear;
  IBQInfoGralGest.SQL.Add(Listado+Condicion+RListado);
  if PorGrupo then
  begin
    IBQInfoGralGest.ParamByName('grupo').AsInteger := Grupo;
    IBQInfoGralGest.ParamByName('desde').Value := null;
    IBQInfoGralGest.ParamByName('hasta').Value := null;
  end
  else
  begin
    IBQInfoGralGest.ParamByName('desde').AsDate := Desde;
    IBQInfoGralGest.ParamByName('hasta').AsDate := Hasta;
    IBQInfoGralGest.ParamByName('grupo').Value := null;
  end;
  IBQInfoGralGest.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQInfoGralGest.ParamByName('actual').AsDate := Date();

//  sqldebug := IBQInfoGralGest.SQL.Text;
//  showMessage(sqldebug);

  IBQInfoGralGest.Open;
end;

procedure TFREPInfoGralGest.ActualizarConsultas();
var
  cartelCarga : TCartel;
  msje, separador : String;
begin
  cartelCarga:= TCartel.getInstance();
  msje:= 'Calculando Datos de los Diagnosticos de Gestacion ...';
  cartelCarga.abrirCartelProgressBar(msje);

  Condicion := '';
  //Armar condicion:
  if ((CondicionRodeo <> '') or (CondicionCategoria <> '')) then
  begin
    separador := ' where';
    if (CondicionRodeo <> '') then
    begin
      Condicion := Condicion + separador + CondicionRodeo;
      separador := ' and';
    end;
    if (CondicionCategoria <> '') then
    begin
      Condicion := Condicion + separador + CondicionCategoria;
    end;
  end;

  {Estos son los procesos que mas demoran:}

  cartelCarga.setCartelProgressBar('Actualizando porcentajes',0);
  ActualizarPorcentajes();

  cartelCarga.setCartelProgressBar('Actualizando distribucion por Preñez',30);
  ActualizarDistPreniez();

  cartelCarga.setCartelProgressBar('Actualizando listado',30);
  ActualizarListado();

  cartelCarga.setCartelProgressBar('Cargando valores por cond.corp.',8);
  CargarValorDatosPorCond();

  cartelCarga.setCartelProgressBar('Cargando valores por cron.',8);
  CargarValorDatosPorCron();

  cartelCarga.setCartelProgressBar('Armando series',4);
  ArmarSeries();

  cartelCarga.cerrarcartel();
  cartelCarga.FreeInstance();
end;

procedure TFREPInfoGralGest.RGTipoClick(Sender: TObject);
begin
  inherited;
  PorGrupo := RGTipo.ItemIndex = 0;
  if PorGrupo then
  begin
    DBLCBASeleccionGrupo.Enabled := true;
    GBGrupos.Enabled := true;
    DTPADesde.Enabled := false;
    DTPAHasta.Enabled := false;
    GBSeleccionFechas.Enabled := false;
    if DBLCBASeleccionGrupo.KeyValue = null then
      Grupo := 0
    else
      Grupo := DBLCBASeleccionGrupo.KeyValue;
  end
  else
  begin
    DBLCBASeleccionGrupo.Enabled := false;
    GBGrupos.Enabled := false;
    DTPADesde.Enabled := true;
    DTPAHasta.Enabled := true;
    GBSeleccionFechas.Enabled := true;
    Desde := DTPADesde.Date;
    Hasta := DTPAHasta.Date;
  end;
  DatosChange(nil);
end;

procedure TFREPInfoGralGest.DBLCBASeleccionGrupoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBASeleccionGrupo.KeyValue <> null then
  begin
    Grupo := DBLCBASeleccionGrupo.KeyValue;
    NomGrupo := DBLCBASeleccionGrupo.Text;
 //   ActualizarConsultas();
  end;
end;

procedure TFREPInfoGralGest.FormCreate(Sender: TObject);
begin
  inherited;

  //CartelOpen := TFCartelOpenQuery.Create(self);

  IBQGrupos.Close;
  IBQGrupos.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQGrupos.Open;
  if (DBLCBASeleccionGrupo.KeyValue = NULL) then
    DBLCBASeleccionGrupo.KeyValue := IBQGrupos.FieldValues['ID_GRUPO'];

  DTPADesde.DateTime := IncYear(now,-1);
  DTPAHasta.DateTime := now;

  CantDist := 'select count(*) as cantidad, nombre from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :grupo, :actual)';
  CantDistCond := 'select count(*) as cantidad, condicion, valorcondicion, repro, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :grupo, :actual)';


  CantDistCron := 'select count(*) as cantidad, cronologia, valorcronologia, repro, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :grupo, :actual)';
  //CantDistCron := 'select count(*) as cantidad, edad, repro, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :grupo, :actual)';

  Porcentaje := 'select count(*) as cantidad, nombre, servida from GET_PORCENTAJES_PRENEZ (:esta, :desde, :hasta, :grupo) ';
  Listado := 'select * from get_info_gral_gestacion(:esta,:desde,:hasta,:grupo,:actual)';

  Condicion := '';

  RCantDist := ' group by nombre';
  RCantDistCond := ' group by condicion, valorcondicion, repro, id_codigo_prenez';

  RCantDistCron := ' group by cronologia, valorcronologia, repro, id_codigo_prenez';
  //RCantDistCron := ' group by edad, repro, id_codigo_prenez';

  RPorcentaje := ' group by repro, nombre, servida';
  RListado := ' order by rp_animal asc';

  CrearSeries();
  PorGrupo := false;
  PorCategoria := false;
  PorRodeo := false;
  ArmarTablas();

  RGTipoClick(nil);

  //Inicializa Combo Box Rodeos
  IBQRodeo.Close;
  IBQRodeo.ParamByName('esta').AsInteger := Fprincipal.EstablecimientoActual;
  IBQRodeo.Open;
  CBRodeo.Items.Clear;
  CBRodeo.Items.Add('TODOS');
  while not (IBQRodeo.Eof) do
  begin
    CBRodeo.Items.Add(IBQRodeo.FieldValues['nombre']);
    IBQRodeo.Next;
  end;

end;

procedure TFREPInfoGralGest.RGFiltrosClick(Sender: TObject);
begin
  inherited;
  case RGFiltros.ItemIndex of
    0 : begin
          CBRodeo.Enabled := true;
          CBRodeo.OnCloseUp(nil);
          CBACategoria.Enabled := true;
          CBACategoria.OnCloseUp(nil);
        end;
    1 : begin
          CBRodeo.Enabled := false;
          CBACategoria.Enabled := false;
          CondicionRodeo := '';
          CondicionCategoria := '';
        end;
  end;
  DatosChange(nil);
end;

procedure TFREPInfoGralGest.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if (CBRodeo.Text <> 'TODOS') then
  begin
    CondicionRodeo := ' rodeo = '+IntToStr(IBQRodeo.Lookup('nombre',CBRodeo.Text,'id_rodeo'));
    NomRodeo := CBRodeo.Text;
  end
  else
  begin
    CondicionRodeo := '';
    NomRodeo := 'TODOS';
  end;
end;

procedure TFREPInfoGralGest.CBACategoriaCloseUp(Sender: TObject);
begin
  inherited;
  case CBACategoria.ItemIndex of
    0 : CondicionCategoria := '';
    1 : CondicionCategoria := ' categoria = 6';
    2 : CondicionCategoria := ' categoria = 5';
  end;
  NomCateg := CBACategoria.Text;
end;

function TFREPInfoGralGest.PieSeries1BeforeAdd(
  Sender: TChartSeries): Boolean;
begin
  inherited;
  Result := IBQSPPorcentajesPrenez.FieldByName('Servida').AsString = 'S';
end;

function TFREPInfoGralGest.Series7BeforeAdd(Sender: TChartSeries): Boolean;
begin
  inherited;
  Result := IBQCantDistCond.FieldByName('repro').AsString = 'V';
end;

function TFREPInfoGralGest.Series2BeforeAdd(Sender: TChartSeries): Boolean;
begin
  inherited;
  Result := IBQCantDistCond.FieldByName('repro').AsString = 'P';
end;

function TFREPInfoGralGest.BarSeries1BeforeAdd(
  Sender: TChartSeries): Boolean;
begin
  inherited;
  Result := IBQCantDistCron.FieldByName('repro').AsString = 'V';
end;

function TFREPInfoGralGest.BarSeries2BeforeAdd(
  Sender: TChartSeries): Boolean;
begin
  inherited;
  Result := IBQCantDistCron.FieldByName('repro').AsString = 'P';
end;

procedure TFREPInfoGralGest.ArmarTablas();
var
  i, valor : integer;
begin
  ValoresTablaComunes(SGTablaCron);
  ValoresTablaComunes(SGTablaCond);
  SGTablaCron.Cells[12,0] := Traducir('  Total');
  SGTablaCron.Cells[13,0] := Traducir('  Prom.');
  SGTablaCond.Cells[12,0] := SGTablaCron.Cells[12,0];
  SGTablaCond.Cells[13,0] := SGTablaCron.Cells[13,0];

  //Valores Para la condicion corporal
  IBQAux.Close;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select valor from rel_parametros_establecimiento where parametro=3 and establecimiento=:esta');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Open;
  valor := IBQAux.FieldValues['valor'];

  IBQAux.Close;
  IBQAux.SQL.Clear;
  if valor = 5 then
    IBQAux.SQL.Add('select valor_escala_5 as valor from cod_condiciones_corporales')
  else
    IBQAux.SQL.Add('select valor_escala_10 as valor from cod_condiciones_corporales');
  IBQAux.Open;

  IBQAux.First;
  i := 2;
  while not IBQAux.Eof do
  begin
    if valor = 5 then
      SGTablaCron.Cells[i,0] := FormatFloat('0.0',IBQAux.FieldValues['valor'])
    else
      SGTablaCron.Cells[i,0] := FormatFloat('0',IBQAux.FieldValues['valor']);
    Inc(i);
    IBQAux.Next;
  end;
  SGTablaCron.Cells[i,0] := Traducir('No Def.');

  if RGTipoAnalisis.ItemIndex = 0 then
  begin
    //Valores para la edad
    for i:=2 to 11 do
      SGTablaCond.Cells[i,0] := IntToStr(i-1);
  end
  else
  begin
    //Valores Para la cronologia dentaria
    IBQAux.Close;
    IBQAux.SQL.Clear;
    IBQAux.SQL.Add('select codigo from cod_cronologias_dentarias');
    IBQAux.Open;

    IBQAux.First;
    IBQAux.Next; //para poner el NN al final
    i := 2;
    while not IBQAux.Eof do
    begin
      SGTablaCond.Cells[i,0] := IBQAux.FieldValues['codigo'];
      Inc(i);
      IBQAux.Next;
    end;
    SGTablaCond.Cells[i,0] := Traducir('No Def.'); //En lugar de poner NN se pone No Def.
  end;
  CargarValoresBlancosCron();
  CargarValoresBlancosCond();
end;

procedure TFREPInfoGralGest.CargarValoresBlancosCron();
var
  x, y: integer;
begin
  for x := 1 to 16 do
    for y := 2 to 13 do
    begin
      if ((x mod 2) = 0) then
      begin
        if y <> 13 then
          SGTablaCond.Cells[y,x] := '0';
      end
      else
          SGTablaCond.Cells[y,x] := '0';
    end;
end;

procedure TFREPInfoGralGest.CargarValoresBlancosCond();
var
  x, y: integer;
begin
  for x := 1 to 16 do
    for y := 2 to 13 do
    begin
      if ((x mod 2) = 0) then
      begin
        if y <> 13 then
          SGTablaCron.Cells[y,x] := '0';
      end
      else
        SGTablaCron.Cells[y,x] := '0';
    end;
end;

procedure TFREPInfoGralGest.ValoresTablaComunes(SGTabla : TStringGrid);
begin
  SGTabla.Cells[0,2] := Traducir('Vientres');
  SGTabla.Cells[0,4] := Traducir('preñados');
  SGTabla.Cells[1,1] := Traducir(' Cabeza');
  SGTabla.Cells[1,2] := '   %';
  SGTabla.Cells[1,3] := Traducir(' Cuerpo');
  SGTabla.Cells[1,4] := '   %';
  SGTabla.Cells[1,5] := Traducir(' Cola');
  SGTabla.Cells[1,6] := '   %';
  SGTabla.Cells[1,7] := Traducir('Inseminación');
  SGTabla.Cells[1,8] := '   %';

  SGTabla.Cells[0,9] := Traducir('Subtotal');
  SGTabla.Cells[1,9] := Traducir('  Cab.');
  SGTabla.Cells[1,10] := '   %';

  SGTabla.Cells[0,11] := Traducir(' Vacias');
  SGTabla.Cells[1,11] := Traducir('  Cab.');
  SGTabla.Cells[1,12] := '   %';

  SGTabla.Cells[0,13] := Traducir('Total de ');
  SGTabla.Cells[1,13] := Traducir('Vientres');
  SGTabla.Cells[1,14] := '   %';
  SGTabla.Cells[0,15] := Traducir(' % de ');
  SGTabla.Cells[1,15] := Traducir('Preñez ');
end;

procedure TFREPInfoGralGest.SGTablaCronDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if ((ARow in [1..8]) and (ACol=0)) then
    SGTablaCron.Canvas.Brush.Color := clGreen;

  if ((ARow in [1..2]) and (ACol in [1..13])) then
    SGTablaCron.Canvas.Brush.Color := $00AFD3AF;

  if ((ARow in [3..4]) and (ACol in [1..13])) then
    SGTablaCron.Canvas.Brush.Color := clMoneyGreen;

  if ((ARow in [5..6]) and (ACol in [1..13])) then
    SGTablaCron.Canvas.Brush.Color := $00CCE3CC;

  if ((ARow=0) and (ACol in [0..13])) then
    SGTablaCron.Canvas.Brush.Color := clSkyBlue;

  if ((ARow in [13..16]) and (ACol in [0..13])) then
    SGTablaCron.Canvas.Brush.Color := clSkyBlue;

  if ((ARow in [9..10]) and (ACol in [0..13])) then
    SGTablaCron.Canvas.Brush.Color := clSkyBlue;

  if ((ARow in [11..12]) and (ACol in [0..13])) then
    SGTablaCron.Canvas.Brush.Color := clCream;

  SGTablaCron.Canvas.FillRect(Rect);
  if ((ACol = 13) or ((ACol=12) and (ARow=13))) then
    SGTablaCron.Canvas.Font.Color := clNavy
  else
    SGTablaCron.Canvas.Font.Color := clBlack;
  if ((ACol=0) and ((ARow=2) or (ARow=4))) then
    SGTablaCron.Canvas.Font.Color := clWhite;

  SGTablaCron.Canvas.TextOut( Rect.Left, Rect.Top, SGTablaCron.Cells[ACol, ARow]);
end;

procedure TFREPInfoGralGest.SGTablaCondDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if ((ARow in [1..8]) and (ACol=0)) then
    SGTablaCond.Canvas.Brush.Color := clGreen;

  if ((ARow in [1..2]) and (ACol in [1..13])) then
    SGTablaCond.Canvas.Brush.Color := $00AFD3AF;

  if ((ARow in [3..4]) and (ACol in [1..13])) then
    SGTablaCond.Canvas.Brush.Color := clMoneyGreen;

  if ((ARow in [5..6]) and (ACol in [1..13])) then
    SGTablaCond.Canvas.Brush.Color := $00CCE3CC;

  if ((ARow=0) and (ACol in [0..13])) then
    SGTablaCond.Canvas.Brush.Color := clSkyBlue;

  if ((ARow in [13..15]) and (ACol in [0..13])) then
    SGTablaCond.Canvas.Brush.Color := clSkyBlue;

  if ((ARow in [9..10]) and (ACol in [0..13])) then
    SGTablaCond.Canvas.Brush.Color := clSkyBlue;

  if ((ARow in [11..12]) and (ACol in [0..13])) then
    SGTablaCond.Canvas.Brush.Color := clCream;

  SGTablaCond.Canvas.FillRect(Rect);
  if ((ACol = 13) or ((ACol=12) and (ARow=13))) then
    SGTablaCond.Canvas.Font.Color := clNavy
  else
    SGTablaCond.Canvas.Font.Color := clBlack;
  if ((ACol=0) and ((ARow=2) or (ARow=4))) then
    SGTablaCond.Canvas.Font.Color := clWhite;

  SGTablaCond.Canvas.TextOut( Rect.Left, Rect.Top, SGTablaCond.Cells[ACol, ARow]);
end;

procedure TFREPInfoGralGest.CargarValorDatosPorCond();
var
  Col, Fil, cant, CantVacias, CantPreniadas : integer;
  Codigo : String;
  SumaCol, SumaFila : integer;
  SumaPorcCol, SumaPorcFila, porc, acumulado, cond : real;
begin
  CargarValoresBlancosCond();
  TotalCond := 0;
  IBQCantDistCond.First;
  while not IBQCantDistCond.Eof do
  begin
    if IBQCantDistCond.FieldValues['condicion'] = null then
      Col := 11
    else
      Col := IBQCantDistCond.FieldValues['condicion']+1;

    if IBQCantDistCond.FieldValues['id_codigo_prenez'] <> null then
    begin
      Codigo := IBQCantDistCond.FieldValues['id_codigo_prenez'];
      if Codigo = 'A' then Fil := 1;
      if Codigo = 'U' then Fil := 3;
      if Codigo = 'O' then Fil := 5;
      if Codigo = 'I' then Fil := 7;
      if Codigo = 'V' then Fil := 11;
    end
    else
      Fil := 9;

    cant := IBQCantDistCond.FieldValues['cantidad'];
    SGTablaCron.Cells[Col,Fil] := IntToStr(cant);
    TotalCond := TotalCond+cant;
    IBQCantDistCond.Next;
  end;
  SGTablaCron.Cells[12,13] := IntToStr(TotalCond);

  SumaPorcCol := 0;
  SumaCol := 0;
  if TotalCond > 0 then
  begin
    for Col := 2 to 11 do
    begin
      for Fil := 2 to 12 do
      begin
        if (((Fil mod 2) = 0) and (Fil <> 10)) then
        begin
          porc := StrToInt(SGTablaCron.Cells[Col,Fil-1])/TotalCond;
          SGTablaCron.Cells[Col,Fil] := FloatToStr(porc);
          SumaPorcCol := SumaPorcCol+porc;
          SumaCol := SumaCol+StrToInt(SGTablaCron.Cells[Col,Fil-1]);
        end;
        if (Fil = 9) then
        begin
          SGTablaCron.Cells[Col,9] := IntToStr(SumaCol);
          SGTablaCron.Cells[Col,10] := FloatToStr(SumaPorcCol);
        end;
      end;
      SGTablaCron.Cells[Col,13] := IntToStr(SumaCol);
      SGTablaCron.Cells[Col,14] := FloatToStr(SumaPorcCol);
      SumaPorcCol := 0;
      SumaCol := 0;
    end;

    SumaFila := 0;
    SumaPorcFila := 0;
    acumulado := 0;
    for Fil := 1 to 14 do
    begin
      for Col := 2 to 11 do
      begin
        if (Fil mod 2) <> 0 then
        begin
          if SGTablaCron.Cells[Col,0] = Traducir('No Def.') then
            cond := 0
          else
            cond := StrToFloat(SGTablaCron.Cells[Col,0]);
          acumulado := acumulado+(cond*StrToInt(SGTablaCron.Cells[Col,Fil]));
          SumaFila := SumaFila+StrToInt(SGTablaCron.Cells[Col,Fil]);
        end
        else
          SumaPorcFila := SumaPorcFila+StrToFloat(SGTablaCron.Cells[Col,Fil]);
      end;

      if (Fil mod 2) <> 0 then
        SGTablaCron.Cells[12,Fil] := IntToStr(SumaFila)
      else
      begin
        SGTablaCron.Cells[12,Fil] := FloatToStr(SumaPorcFila);
        if SumaFila > 0 then
        begin
          SGTablaCron.Cells[13,Fil] := FormatFloat('0.00',acumulado/SumaFila);
          acumulado := 0;
          SumaFila := 0;
          SumaPorcFila := 0;
        end;
      end;
    end;

    for Fil := 2 to 14 do
      for Col := 2 to 12 do
        if ((Fil mod 2) = 0) then
          SGTablaCron.Cells[Col,Fil] := FormatFloat('0.0',StrToFloat(SGTablaCron.Cells[Col,Fil])*100)+'%';

    for Col := 2 to 12 do
      if SGTablaCron.Cells[Col,13] <> '0' then
        SGTablaCron.Cells[Col,15] := FormatFloat('0',(StrToInt(SGTablaCron.Cells[Col,9])/StrToInt(SGTablaCron.Cells[Col,13]))*100);

    acumulado := 0;
    SumaFila := 0;
    for col := 2 to 11 do
    begin
      if col = 11 then cond := 0
      else cond := StrToFloat(SGTablaCron.Cells[col,0]);
      acumulado := acumulado+(StrToInt(SGTablaCron.Cells[col,15])*cond);
      SumaFila := SumaFila+StrToInt(SGTablaCron.Cells[col,15]);
    end;
    if SumaFila <> 0 then
      SGTablaCron.Cells[13,15] := FormatFloat('0.00',acumulado/SumaFila);

    for col := 2 to 11 do
    begin
      if SGTablaCron.Cells[12,9] <> '0' then
        SGTablaCron.Cells[col,10] := FormatFloat('0.0',(StrToInt(SGTablaCron.Cells[col,9])/StrToInt(SGTablaCron.Cells[12,9]))*100)+'%';
      if SGTablaCron.Cells[12,11] <> '0' then
        SGTablaCron.Cells[col,12] := FormatFloat('0.0',(StrToInt(SGTablaCron.Cells[col,11])/StrToInt(SGTablaCron.Cells[12,11]))*100)+'%';
    end;
  end;

  for fil := 2 to 14 do
    if (fil mod 2) <> 0 then
      SGTablaCron.Cells[13,fil] := '';

end;

procedure TFREPInfoGralGest.CargarValorDatosPorCron();
var
  Col, Fil, cant : integer;
  Codigo : String;
  SumaCol, SumaFila : integer;
  SumaPorcCol, SumaPorcFila, porc, acumulado : real;
begin
  CargarValoresBlancosCron();
  TotalCron := 0;
  IBQCantDistCron.First;
  while not IBQCantDistCron.Eof do
  begin

    if RGTipoAnalisis.ItemIndex = 0 then
      Col := IBQCantDistCron.FieldValues['edad']+1
    else
    begin
      if IBQCantDistCron.FieldValues['cronologia'] = 0 then
        Col := 11
      else
        Col := IBQCantDistCron.FieldValues['cronologia']+1;
    end;
    if IBQCantDistCron.FieldValues['id_codigo_prenez'] <> null then
    begin
      Codigo := IBQCantDistCron.FieldValues['id_codigo_prenez'];
      if Codigo = 'A' then Fil := 1;
      if Codigo = 'U' then Fil := 3;
      if Codigo = 'O' then Fil := 5;
      if Codigo = 'I' then Fil := 7;
      if Codigo = 'V' then Fil := 11;
    end
    else
      Fil := 9;
    cant := IBQCantDistCron.FieldValues['cantidad'];
    SGTablaCond.Cells[Col,Fil] := IntToStr(cant);
    TotalCron := TotalCron+cant;
    IBQCantDistCron.Next;
  end;
  SGTablaCond.Cells[12,13] := IntToStr(TotalCron);

  SumaPorcCol := 0;
  SumaCol := 0;
  if TotalCron > 0 then
  begin
    for Col := 2 to 11 do
    begin
      for Fil := 2 to 12 do
      begin
        if (((Fil mod 2) = 0) and (Fil <> 10)) then
        begin
          porc := StrToInt(SGTablaCond.Cells[Col,Fil-1])/TotalCron;
          SGTablaCond.Cells[Col,Fil] := FloatToStr(porc);
          SumaPorcCol := SumaPorcCol+porc;
          SumaCol := SumaCol+StrToInt(SGTablaCond.Cells[Col,Fil-1]);
        end;
        if (Fil = 9) then
        begin
          SGTablaCond.Cells[Col,9] := IntToStr(SumaCol);
          SGTablaCond.Cells[Col,10] := FloatToStr(SumaPorcCol);
        end;
      end;
      SGTablaCond.Cells[Col,13] := IntToStr(SumaCol);
      SGTablaCond.Cells[Col,14] := FloatToStr(SumaPorcCol);
      SumaPorcCol := 0;
      SumaCol := 0;
    end;

    SumaFila := 0;
    SumaPorcFila := 0;
    acumulado := 0;
    for Fil := 1 to 14 do
    begin
      for Col := 2 to 11 do
      begin
        if (Fil mod 2) <> 0 then
        begin
          acumulado := acumulado+((Col-1)*StrToInt(SGTablaCond.Cells[Col,Fil]));
          SumaFila := SumaFila+StrToInt(SGTablaCond.Cells[Col,Fil]);
        end
        else
          SumaPorcFila := SumaPorcFila+StrToFloat(SGTablaCond.Cells[Col,Fil]);
      end;

      if (Fil mod 2) <> 0 then
        SGTablaCond.Cells[12,Fil] := IntToStr(SumaFila)
      else
      begin
        SGTablaCond.Cells[12,Fil] := FloatToStr(SumaPorcFila);
        if SumaFila > 0 then
        begin
          SGTablaCond.Cells[13,Fil] := FormatFloat('0.00',acumulado/SumaFila);
          acumulado := 0;
          SumaFila := 0;
          SumaPorcFila := 0;
        end;
      end;
    end;

    for Fil := 2 to 14 do
      for Col := 2 to 12 do
        if ((Fil mod 2) = 0) then
          SGTablaCond.Cells[Col,Fil] := FormatFloat('0.0',StrToFloat(SGTablaCond.Cells[Col,Fil])*100)+'%';

    for Col := 2 to 12 do
      if SGTablaCond.Cells[Col,13] <> '0' then
        SGTablaCond.Cells[Col,15] := FormatFloat('0',(StrToInt(SGTablaCond.Cells[Col,9])/StrToInt(SGTablaCond.Cells[Col,13]))*100);

    acumulado := 0;
    SumaFila := 0;
    for col := 2 to 11 do
    begin
      acumulado := acumulado+(StrToInt(SGTablaCond.Cells[col,15])*(col-1));
      SumaFila := SumaFila+StrToInt(SGTablaCond.Cells[col,15]);
    end;
    if SumaFila <> 0 then
      SGTablaCond.Cells[13,15] := FormatFloat('0.00',acumulado/SumaFila);

    for col := 2 to 11 do
    begin
      if SGTablaCond.Cells[12,9] <> '0' then
        SGTablaCond.Cells[col,10] := FormatFloat('0.0',(StrToInt(SGTablaCond.Cells[col,9])/StrToInt(SGTablaCond.Cells[12,9]))*100)+'%';
      if SGTablaCond.Cells[12,11] <> '0' then
        SGTablaCond.Cells[col,12] := FormatFloat('0.0',(StrToInt(SGTablaCond.Cells[col,11])/StrToInt(SGTablaCond.Cells[12,11]))*100)+'%';
    end;
  end;

  for fil := 2 to 14 do
    if (fil mod 2) <> 0 then
      SGTablaCond.Cells[13,fil] := '';

end;

procedure TFREPInfoGralGest.CrearSeries();
begin
  CronVac := TBarSeries.Create(nil);
  CronVac.Title := ' ';
  CronVac.Name := 'CronVac';
  CronVac.SeriesColor := $00D5F3FF;
  CronVac.Marks.Visible := true;
  CronVac.PercentFormat := '#0.# %';
  CronVac.Marks.Style := smsPercent;
  CronVac.Marks.Font.Size := 6;
  CronVac.Marks.Transparent := false;
  CronVac.Marks.Clip := true;
  CronVac.Marks.ArrowLength := 5;
  CronVac.Marks.BackColor := clWhite;
  CronVac.OnGetMarkText := GetMarkText;

  CronPre := TBarSeries.Create(nil);
  CronPre.Title := ' ';
  CronPre.Name := 'CronPre';
  CronPre.SeriesColor := clGreen;
  CronPre.Marks.Visible := true;
  CronPre.PercentFormat := '#0.# %';
  CronPre.Marks.Style := smsPercent;
  CronPre.Marks.Font.Size := 6;
  CronPre.Marks.Transparent := false;
  CronPre.Marks.Clip := true;
  CronPre.Marks.ArrowLength := 5;
  CronPre.Marks.BackColor := clWhite;
  CronPre.OnGetMarkText := GetMarkText;

  CondPre := TBarSeries.Create(nil);
  CondPre.Title := ' ';
  CondPre.Name := 'CondPre';
  CondPre.SeriesColor := clGreen;
  CondPre.Marks.Visible := true;
  CondPre.Marks.Font.Size := 6;
  CondPre.PercentFormat := '#0.# %';
  CondPre.Marks.Style := smsPercent;
  CondPre.Marks.Transparent := false;
  CondPre.Marks.Clip := true;
  CondPre.Marks.ArrowLength := 5;
  CondPre.Marks.BackColor := clWhite;
  CondPre.OnGetMarkText := GetMarkText;

  CondVac := TBarSeries.Create(nil);
  CondVac.Title := ' ';
  CondVac.Name := 'CondVac';
  CondVac.SeriesColor := $00D5F3FF;
  CondVac.Marks.Visible := true;
  CondVac.PercentFormat := '#0.# %';
  CondVac.Marks.Style := smsPercent;
  CondVac.Marks.Font.Size := 6; 
  CondVac.Marks.Transparent := false;
  CondVac.Marks.Clip := true;
  CondVac.Marks.ArrowLength := 5;
  CondVac.Marks.BackColor := clWhite;
  CondVac.OnGetMarkText := GetMarkText;

  PorPrenCond := TBarSeries.Create(nil);
  PorPrenCond.Title := ' ';
  PorPrenCond.Name := 'PorPrenCond';
  PorPrenCond.SeriesColor := $003232C9;
  PorPrenCond.Marks.Visible := true;
  PorPrenCond.PercentFormat := '#0.# %';
  PorPrenCond.Marks.Style := smsValue;
  PorPrenCond.Marks.Font.Size := 6;
  PorPrenCond.Marks.Transparent := false;
  PorPrenCond.Marks.Clip := true;
  PorPrenCond.Marks.ArrowLength := 5;
  PorPrenCond.Marks.BackColor := clWhite;
  PorPrenCond.OnGetMarkText := GetMarkText1;

  PorPrenCron := TBarSeries.Create(nil);
  PorPrenCron.Title := ' ';
  PorPrenCron.Name := 'PorPrenCron';
  PorPrenCron.SeriesColor := $003232C9;
  PorPrenCron.Marks.Visible := true;
  PorPrenCron.PercentFormat := '#0.# %';
  PorPrenCron.Marks.Style := smsValue;
  PorPrenCron.Marks.Font.Size := 6;
  PorPrenCron.Marks.Transparent := false;
  PorPrenCron.Marks.Clip := true;
  PorPrenCron.Marks.ArrowLength := 5;
  PorPrenCron.Marks.BackColor := clWhite;
  PorPrenCron.OnGetMarkText := GetMarkText1;

  PorcentajeTactadas := TPieSeries.Create(nil);
  PorcentajeTactadas.Marks.Style := smsPercent;
  PorcentajeServidas := TPieSeries.Create(nil);
  PorcentajeServidas.Marks.Style := smsPercent;
end;

procedure TFREPInfoGralGest.ArmarSeries();
var
  TotalPorc, TotalPorcS : Array [0..1] of Double;
  TotalPCond, TotalVCond, TotalPCron, TotalVCron, TotalPrenCond, TotalPrenCron : Array [0..10] of Double;
  col : integer;
begin

  DBCronPreniezPreniadas.Title.Text.Clear;
  DBCCronPreniezVacias.Title.Text.Clear;
  if RGTipoAnalisis.ItemIndex = 0 then
  begin
    DBCronPreniezPreniadas.Title.Text.Add(Traducir('Edad (En Años) en las preñadas'));
    DBCCronPreniezVacias.Title.Text.Add(Traducir('Edad (En Años) en las vacias'));

    DBCPorPrenCron.BottomAxis.Title.Caption := Traducir('Edades (En años)');
    DBCCronPreniezVacias.BottomAxis.Title.Caption := Traducir('Edades (En años)');
    DBCronPreniezPreniadas.BottomAxis.Title.Caption := Traducir('Edades (En años)');
  end
  else
  begin
    DBCronPreniezPreniadas.Title.Text.Add(Traducir('Cronología Dentaria en las preñadas'));
    DBCCronPreniezVacias.Title.Text.Add(Traducir('Cronología Dentaria en las vacias'));

    DBCPorPrenCron.BottomAxis.Title.Caption := Traducir('Cronologias Dentarias');
    DBCCronPreniezVacias.BottomAxis.Title.Caption := Traducir('Cronologias Dentarias');
    DBCronPreniezPreniadas.BottomAxis.Title.Caption := Traducir('Cronologias Dentarias');
  end;

  for col := 2 to 11 do
  begin
    TotalPCond[col-1] := StrToInt(SGTablaCron.Cells[col,9]);
    TotalVCond[col-1] := StrToInt(SGTablaCron.Cells[col,11]);
    TotalPCron[col-1] := StrToInt(SGTablaCond.Cells[col,9]);
    TotalVCron[col-1] := StrToInt(SGTablaCond.Cells[col,11]);
    TotalPrenCond[col-1] := StrToFloat(SGTablaCron.Cells[col,15]);
    TotalPrenCron[col-1] := StrToFloat(SGTablaCond.Cells[col,15]);
  end;

  CronVac.Clear;
  DBCCronPreniezVacias.AddSeries(CronVac);
  CronVac.AddArray(TotalVCron);

  CronPre.Clear;
  DBCronPreniezPreniadas.AddSeries(CronPre);
  CronPre.AddArray(TotalPCron);

  CondVac.Clear;
  DBCCondPrenezVacias.AddSeries(CondVac);
  CondVac.AddArray(TotalVCond);

  CondPre.Clear;
  DBCCondPrenezPreniadas.AddSeries(CondPre);
  CondPre.AddArray(TotalPCond);

  PorPrenCond.Clear;
  DBPorPrenCond.AddSeries(PorPrenCond);
  PorPrenCond.AddArray(TotalPrenCond);

  PorPrenCron.Clear;
  DBCPorPrenCron.AddSeries(PorPrenCron);
  PorPrenCron.AddArray(TotalPrenCron);

  //Tactadas
  IBQSPPorcentajesPrenez.First;
  while not IBQSPPorcentajesPrenez.Eof do
  begin
    if IBQSPPorcentajesPrenez.FieldByName('nombre').AsString = 'VACIA' then
      TotalPorc[0] := TotalPorc[0]+IBQSPPorcentajesPrenez.FieldValues['cantidad']
    else
      TotalPorc[1] := TotalPorc[1]+IBQSPPorcentajesPrenez.FieldValues['cantidad'];
    IBQSPPorcentajesPrenez.Next;
  end;

  PorcentajeTactadas.Clear;
  DBCTactadas.AddSeries(PorcentajeTactadas);
  PorcentajeTactadas.Add(TotalPorc[0],Traducir('VACIAS'),clRed);
  PorcentajeTactadas.Add(TotalPorc[1],Traducir('PREÑADAS'),clGreen);
  //Servidas
  IBQSPPorcentajesPrenez.First;
  while not IBQSPPorcentajesPrenez.Eof do
  begin
    if IBQSPPorcentajesPrenez.FieldByName('Servida').AsString = 'S' then
    begin
      if IBQSPPorcentajesPrenez.FieldByName('nombre').AsString = 'VACIA' then
        TotalPorcS[0] := TotalPorcS[0]+IBQSPPorcentajesPrenez.FieldValues['cantidad']
      else
        TotalPorcS[1] := TotalPorcS[1]+IBQSPPorcentajesPrenez.FieldValues['cantidad'];
    end;
    IBQSPPorcentajesPrenez.Next;
  end;

  PorcentajeServidas.Clear;
  DBCServidas.AddSeries(PorcentajeServidas);
  PorcentajeServidas.Add(TotalPorcS[0],Traducir('VACIAS'),clRed);
  PorcentajeServidas.Add(TotalPorcS[1],Traducir('PREÑADAS'),clGreen);

  if ((TotalPorcS[0] = 0) and (TotalPorcS[1] = 0)) then
    DBCServidas.RemoveAllSeries;

end;

procedure TFREPInfoGralGest.GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  inherited;
  if MarkText='0 %' then MarkText := '';
end;

procedure TFREPInfoGralGest.GetMarkText1(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  inherited;
  if MarkText='0' then MarkText := ''
  else MarkText := MarkText+'%'
end;

procedure TFREPInfoGralGest.GetAxisLabelCron(Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
  var LabelText: String);
begin
  inherited;
  if ((Sender.Horizontal) and (Indice<>-1)) then
  begin
    if Indice <> 12 then
      LabelText := SGTablaCond.Cells[Indice,0]
    else
      LabelText := '-';
    Dec(Indice);
  end;
end;

procedure TFREPInfoGralGest.GetAxisLabelCond(Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
  var LabelText: String);
begin
  if ((Sender.Horizontal) and (Indice<>-1)) then
  begin
    if Indice <> 12 then
      LabelText := SGTablaCron.Cells[Indice,0]
    else
      LabelText := '-';
    Dec(Indice);
  end;
end;

procedure TFREPInfoGralGest.BeforeDrawAxes(Sender: TObject);
begin
  inherited;
  Indice := 14;
end;

procedure TFREPInfoGralGest.BBImprimirReporteClick(Sender: TObject);
var
  F : TFREPInfoGralGestPreview;
  cartel : TCartel;
  totalBruc : integer;
  msje, Dir : String;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del Reporte General de Gestación ...';
  cartel.abrircartel(msje);

  Dir := ExtractFilePath(Application.ExeName);
  DBCCondPrenezPreniadas.SaveToMetafile(Dir+'ConPren.wmf');
  DBCCondPrenezVacias.SaveToMetafile(Dir+'ConVac.wmf');
  DBCronPreniezPreniadas.SaveToMetafile(Dir+'CronPren.wmf');
  DBCCronPreniezVacias.SaveToMetafile(Dir+'CronVac.wmf');
  DBCDistribucion.SaveToMetafile(Dir+'Dist.wmf');
  DBCServidas.SaveToMetafile(Dir+'Serv.wmf');
  DBCTactadas.SaveToMetafile(Dir+'Tact.wmf');
  DBPorPrenCond.SaveToMetafile(Dir+'PorPrenCond.wmf');
  DBCPorPrenCron.SaveToMetafile(Dir+'PorPrenCron.wmf');

  F := TFREPInfoGralGestPreview.Create(self,nil);

  ArmarTablaCondPreview(F);
  ArmarTablaCronPreview(F);

  if RGTipoAnalisis.ItemIndex = 0 then
    F.QRLPorCronDent.Caption := Traducir('Edad discriminada por estadio de gestación')
  else
    F.QRLPorCronDent.Caption := Traducir('Cronología dentaria discriminada por estadio de gestación');

  if (TotalBrucP+TotalBrucN+TotalBrucS+TotalBrucND) = 0 then
  begin
    F.QRBand33.Enabled := false;
    F.QRBand33.Visible := false;
  end
  else
  begin
    totalBruc := TotalBrucN+TotalBrucP+TotalBrucS+TotalBrucND;
    F.QRLResBrucN.Caption := IntToStr(TotalBrucN);
    F.QRLResBrucP.Caption := IntToStr(TotalBrucP);
    F.QRLResBrucS.Caption := IntToStr(TotalBrucS);
    F.QRLResBrucND.Caption := IntToStr(TotalBrucND);
    F.QRLPorBrucN.Caption := FormatFloat('0.0',(TotalBrucN/totalBruc)*100)+'%';
    F.QRLPorBrucND.Caption := FormatFloat('0.0',(TotalBrucND/totalBruc)*100)+'%';
    F.QRLPorBrucP.Caption := FormatFloat('0.0',(TotalBrucP/totalBruc)*100)+'%';
    F.QRLPorBrucS.Caption := FormatFloat('0.0',(TotalBrucS/totalBruc)*100)+'%';
    F.QRLResTotal.Caption := IntToStr(totalBruc);
    F.QRLPorTotal.Caption := '100%'; 
  end;
  if not CBListado.Checked then
  begin
    F.QRGroup.Enabled := false;
    F.QRBTabList.Enabled := false;
    F.QRGroup.Visible := false;
    F.QRBTabList.Visible := false;
  end;
  case RGTipo.ItemIndex of
    1 : begin
          F.QRLTitulo.Caption := Traducir('Periodo Seleccionado');
          F.QRLFecha.Enabled := true;
          F.QRLTipo.Enabled := false;
          F.Grupo.Enabled := false;
          F.Fecha.Caption := DateToStr(Desde)+'  Hasta: '+DateToStr(Hasta);
        end;
    0 : begin
          F.QRLTitulo.Caption := Traducir('Grupo Seleccionado');
          F.QRLFecha.Enabled := false;
          F.QRLTipo.Enabled := true;
          F.Grupo.Caption := NomGrupo;
          F.Fecha.Enabled := false;
        end;
  end;

  F.TipoF.Enabled := false;
  F.Filtro.Enabled := false;
  F.TipoFc.Enabled := false;
  F.Filtroc.Enabled := false;
  if (RGFiltros.ItemIndex = 1) then
  begin
    NomRodeo := 'TODOS';
    NomCateg := 'TODAS';
  end;
  if (NomRodeo <> 'TODOS') then
  begin
    F.TipoF.Enabled := true;
    F.Filtro.Enabled := true;
    F.TipoF.Caption := Traducir('Rodeo:');
    F.Filtro.Caption := NomRodeo;
  end;
  if (NomCateg <> 'TODAS') then
  begin
    F.TipoFc.Enabled := true;
    F.Filtroc.Enabled := true;
    F.TipoFc.Caption := Traducir('Categoria:');
    F.Filtroc.Caption := NomCateg;
    if (NomRodeo <> 'TODOS') then
    begin
      F.TipoF.Top := 62;
      F.Filtro.Top := 62;
      F.TipoFc.Top := 86;
      F.Filtroc.Top := 86;
    end;
  end
  else
  begin
    if (NomRodeo = 'TODOS') then
         F.QRLFiltro.Enabled := false;
  end;

  F.QRLTotal.Caption := IntToStr(Total);
  F.QRMemo.Lines.AddStrings(MObservaciones.Lines);

  cartel.cerrarcartel();
  cartel.FreeInstance();

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFREPInfoGralGest.ArmarTablaCondPreview(F : TFREPInfoGralGestPreview);
var col : integer;
    fil : integer;
    ProxTop : integer;
    ProxLeft : integer;
begin
  ProxTop := 39;
  for fil := 0 to SGTablaCron.RowCount-1 do
    begin
      ProxLeft := 117;
      for col := 2 to SGTablaCron.ColCount-1 do
        begin
          with (TQRLabel(F.QRBand6.AddPrintable(TQRLabel))) do
            begin
              Left := ProxLeft;
              Top := ProxTop;

              case fil of
                0,9,10,13,14 : color := clSkyBlue;
                1,2 : color := $00AFD3AF;
                3,4 : color := clMoneyGreen;
                5,6 : color := $00CCE3CC;
                7,8 : color := $00CCE3CC;
                11,12 : color := $00D5F3FF;
                15 : color := $003232C9;
              end;

              if fil = 15 then Font.Color := clWhite
              else Font.Color := clBlack;

              if ((fil in [9..10]) or (fil in [13..15]) or (col in [12..13]) or (fil=0)) then
                Font.Name := 'Arial Black'
              else
                Font.Name := 'Arial';

              if (fil = 15) and (col in [2..12]) then
                OnPrint := F.QRLabePrint;

              autoSize := false;
              alignment := taLeftJustify;
              Height := 13;
              Width := 50;
              Font.Size := 7;
              Caption := ' '+SGTablaCron.Cells[col,fil];
            end;
          ProxLeft := ProxLeft + 50;
        end;
      ProxTop := ProxTop + 13;
    end;
end;

procedure TFREPInfoGralGest.ArmarTablaCronPreview(F : TFREPInfoGralGestPreview);
var col : integer;
    fil : integer;
    ProxTop : integer;
    ProxLeft : integer;
begin
  ProxTop := 87;
  for fil := 0 to SGTablaCron.RowCount-1 do
    begin
      ProxLeft := 115;
      for col := 2 to SGTablaCond.ColCount-1 do
        begin
          with (TQRLabel(F.QRBand11.AddPrintable(TQRLabel))) do
            begin
              Left := ProxLeft;
              Top := ProxTop;

              case fil of
                0,9,10,13,14 : color := clSkyBlue;
                1,2 : color := $00AFD3AF;
                3,4 : color := clMoneyGreen;
                5,6 : color := $00CCE3CC;
                7,8 : color := $00CCE3CC;
                11,12 : color := $00D5F3FF;
                15 : color := $003232C9;
              end;

              if ((fil in [9..10]) or (fil in [12..15]) or (col in [12..13]) or (fil=0)) then
                Font.Name := 'Arial Black'
              else
                Font.Name := 'Arial';

              if fil = 15 then Font.Color := clWhite
              else Font.Color := clBlack;

              if (fil = 15) and (col in [2..12]) then
                OnPrint := F.QRLabePrint;

              autoSize := false;
              alignment := taLeftJustify;
              Height := 13;
              Width := 50;
              Font.Size := 7;
              Caption := ' '+SGTablaCond.Cells[col,fil];
            end;
          ProxLeft := ProxLeft + 50;
        end;
      ProxTop := ProxTop + 13;
    end;
end;

procedure TFREPInfoGralGest.IBQGruposAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQGrupos.Last;
  IBQGrupos.First;
end;

procedure TFREPInfoGralGest.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;


procedure TFREPInfoGralGest.IBQInfoGralGestAfterOpen(DataSet: TDataSet);

begin
  inherited;


  BDBGAnimales.DataSource := DSListado;
  {BBImprimirReporte.Enabled := not IBQInfoGralGest.IsEmpty;
  BBXls.Enabled := not IBQInfoGralGest.IsEmpty;}
  IPreview.Enabled := not IBQInfoGralGest.IsEmpty;
  LPreview.Enabled := not IBQInfoGralGest.IsEmpty;
  LExpExcel.Enabled := not IBQInfoGralGest.IsEmpty;
  IExpExcel.Enabled := not IBQInfoGralGest.IsEmpty;

  IBQInfoGralGest.First;
  while not IBQInfoGralGest.Eof do
  begin
    if IBQInfoGralGest.FieldByName('RESULT_BRUC').Value <> null then
    begin
      if IBQInfoGralGest.FieldByName('RESULT_BRUC').AsString = 'NEGATIVO' then TotalBrucN := TotalBrucN+1;
      if IBQInfoGralGest.FieldByName('RESULT_BRUC').AsString = 'NO DEFINIDO' then TotalBrucND := TotalBrucND+1;
      if IBQInfoGralGest.FieldByName('RESULT_BRUC').AsString = 'POSITIVO' then TotalBrucP := TotalBrucP+1;
      if IBQInfoGralGest.FieldByName('RESULT_BRUC').AsString = 'SOSPECHOSO' then TotalBrucS := TotalBrucS+1;
    end;
    IBQInfoGralGest.Next;
  end;
  GBAnimales.Caption := Traducir(' Animales [')+IntToStr(IBQInfoGralGest.RecordCount)+'] ';
    Total := IBQInfoGralGest.RecordCount; 
end;

procedure TFREPInfoGralGest.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPInfoGralGest.DBCDistribucionAfterDraw(Sender: TObject);
begin
  inherited;
  if ((not IBQCantDist.IsEmpty)  and (PieSeries2.CountLegendItems>2)) then
    PieSeries2.SwapValueIndex(1,2);
  PieSeries2.CountLegendItems
end;

procedure TFREPInfoGralGest.BDBGAnimalesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (BDBGAnimales.SelectedIndex = 0) then
    if not(IBQInfoGralGest.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQInfoGralGest.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPInfoGralGest.DBLCBASeleccionGrupoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBASeleccionGrupo.ListVisible) then
   begin
      DBLCBASeleccionGrupoCloseUp(nil);
   end;
end;

procedure TFREPInfoGralGest.RGTipoAnalisisClick(Sender: TObject);
begin
  inherited;
  if RGTipoAnalisis.ItemIndex = 0 then
  begin
    CantDistCron := 'select count(*) as cantidad, edad, repro, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :grupo, :actual)';
    RCantDistCron := ' group by edad, repro, id_codigo_prenez';
  end
  else
  begin
    CantDistCron := 'select count(*) as cantidad, cronologia, valorcronologia, repro, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :grupo, :actual)';
    RCantDistCron := ' group by cronologia, valorcronologia, repro, id_codigo_prenez';
  end;
  ArmarTablas();
  DatosChange(nil);
end;

procedure TFREPInfoGralGest.DTPACloseUpFechas(Sender: TObject);
var
  Fecha : TDateTimePickerAuto;
begin
  inherited;
  Fecha := Sender as TDateTimePickerAuto;
  if (Fecha.Name = 'DTPADesde') then
  begin
    if DaysBetween(DTPAHasta.Date,Fecha.Date)>365 then
      DTPAHasta.Date := IncYear(Fecha.Date,1)
    else if CompareDate(DTPAHasta.Date,Fecha.Date)=LessThanValue then
          DTPADesde.Date := DTPAHasta.Date;
    Desde := DTPADesde.Date;
  end;

  if (Fecha.Name = 'DTPAHasta') then
  begin
    if DaysBetween(DTPADesde.Date,Fecha.Date)>365 then
      DTPADesde.Date := IncYear(Fecha.Date,-1)
    else if CompareDate(DTPADesde.Date,Fecha.Date)=GreaterThanValue then
          DTPAHasta.Date := DTPADesde.Date;
    Hasta := DTPAHasta.Date;
  end;
 // ActualizarConsultas();
end;

procedure TFREPInfoGralGest.DTPADesdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUpFechas(Sender);
end;

procedure TFREPInfoGralGest.DBLCBASeleccionGrupoClick(Sender: TObject);
begin
  inherited;
  RGTipo.ItemIndex := 0;
  RGTipoClick(RGTipo);
end;

procedure TFREPInfoGralGest.DTPADesdeClick(Sender: TObject);
begin
  inherited;
  RGTipo.ItemIndex := 1;
  RGTipoClick(RGTipo);
end;

procedure TFREPInfoGralGest.LHastaClick(Sender: TObject);
begin
  inherited;
  if not DTPADesde.Enabled then
  begin
    RGTipo.ItemIndex := 1;
    RGTipoClick(RGTipo);
  end;
end;

procedure TFREPInfoGralGest.CBRodeoClick(Sender: TObject);
begin
  inherited;
  RGFiltros.ItemIndex := 0;
  RGFiltrosClick(RGFiltros);
end;

procedure TFREPInfoGralGest.CBACategoriaClick(Sender: TObject);
begin
  inherited;
  RGFiltros.ItemIndex := 0;
  RGFiltrosClick(RGFiltros);
end;

procedure TFREPInfoGralGest.Button1Click(Sender: TObject);
begin
  inherited;
  ActualizarConsultas();
end;

procedure TFREPInfoGralGest.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

procedure TFREPInfoGralGest.DatosChange(Sender: TObject);
begin
  GBAnimales.Caption := Traducir(' Animales ');
  BDBGAnimales.DataSource := nil;
  IPreview.Enabled := false;
  LPreview.Enabled := false;
end;

end.

