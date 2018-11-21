unit UEducacionContinua;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, ComObj,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, StdCtrls,
  ExtCtrls, JvGIF, jpeg, OleCtnrs, DateUtils, TeEngine, Series, TeeProcs,
  Chart, DbChart, Grids, UREPInfoGralGestPreview, QuickRpt, QRCtrls, QRPrntr,
  QRPDFFilt, ShellCtrls, OleCtrls, AcroPDFLib_TLB, AppEvnts, cxControls,
  cxSSheet, DBGrids, IBUpdateSQL, JvExStdCtrls, JvRadioButton, Menus,
  JvExGrids, JvStringGrid, ClipBrd, StrUtils;

const
  MAX_FILA = 10000;
  MAX_COLUMNA = 100;

type
  TMatGrilla = Array [0..MAX_COLUMNA,0..MAX_FILA] of Boolean;
  TRegDiagnostico = record
    RP : String;
    FechaTacto : TDate;
    Categoria : String;
    EstadoRep : String;
    CronDent : String;
    CondCorp : String;
    ResBruc : String;
    Rodeo : String;
    Raza : String;
    Obs : String;
    Archivo : String;
  end;

  TRegDato = record
    Dato : String;
    Fil : integer;
    Col : IntegeR;
  end;

  TRegDeshacer = record
    ColIni : IntegeR;
    FilIni : IntegeR;
    ColFin : Integer;
    FilFin : Integer;
    Datos : Array of TRegDato;
    Cant :Integer;
  end;

  TCelda = class(TObject)
  private
    col: integer;
    fil: integer;
  public
    function getCol: integer;
    function getFil: integer;
  published
    constructor Create(col: integer; fil: integer);reintroduce;
  end;

  TArrDiagnostico = Array of TRegDiagnostico;

  TFEducacionContinua = class(TFUniversal)
    Pcli: TPanel;
    BDiagnostico: TButton;
    PDiagnostico: TPanel;
    PBotonesDiag: TPanel;
    BVolverDiag: TButton;
    BInformeDiag: TButton;
    Image1: TImage;
    JvIDiagnostico: TJvImage;
    JvIDiagnosticoRep: TJvImage;
    Label9: TLabel;
    Label10: TLabel;
    PInformes: TPanel;
    SLVInformes: TShellListView;
    Panel1: TPanel;
    Image5: TImage;
    BVovlerdeinfor: TButton;
    PDatosGral: TPanel;
    PDatos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EEstablecimiento: TEdit;
    ERENSPA: TEdit;
    EPropietario: TEdit;
    EVeterinario: TEdit;
    EDireccion: TEdit;
    ETElefono: TEdit;
    EMail: TEdit;
    EWeb: TEdit;
    PExcel: TPanel;
    PInforme: TPanel;
    DBCCondPrenezVacias: TDBChart;
    DBCCronPreniezVacias: TDBChart;
    DBCDistribucion: TDBChart;
    DBCPorPrenCron: TDBChart;
    DBCronPreniezPreniadas: TDBChart;
    DBCTactadas: TDBChart;
    DBPorPrenCond: TDBChart;
    SGTablaCond: TStringGrid;
    SGTablaCron: TStringGrid;
    DBCCondPrenezPreniadas: TDBChart;
    BSiguiente: TButton;
    PFiltros: TPanel;
    CBRodeos: TComboBox;
    CBCategoria: TComboBox;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    BCancelar: TButton;
    Label11: TLabel;
    AppEventEC: TApplicationEvents;
    SSExcel: TcxSpreadSheet;
    IVolver: TImage;
    LVolver: TLabel;
    ISiguiente: TImage;
    LSiguiente: TLabel;
    IInforme: TImage;
    LInforme: TLabel;
    ICancelar: TImage;
    LCancelar: TLabel;
    PErrores: TPanel;
    GBErrores: TGroupBox;
    LBErrores: TListBox;
    MObs: TMemo;
    IBQEstabsEC: TIBQuery;
    PEstablecimiento: TPanel;
    IEstabNuevo: TImage;
    ISelEstab: TImage;
    PEstablecimientosExistentes: TPanel;
    DBGEstablecimientos: TDBGrid;
    DSEstabsEC: TDataSource;
    IAceptarEstab: TImage;
    ICancelarEstab: TImage;
    LAceptarEstab: TLabel;
    Label22: TLabel;
    IBQInsertRel: TIBQuery;
    IBQEstabsECNOMBRE: TIBStringField;
    IBQEstabsECRENSPA: TIBStringField;
    IBQEstabsECPROPIETARIO: TIBStringField;
    IBQEstabsECVETERINARIO: TIBStringField;
    IBQEstabsECDIRECCION: TIBStringField;
    IBQEstabsECTELEFONO: TIBStringField;
    IBQEstabsECMAIL: TIBStringField;
    IBQEstabsECWEB: TIBStringField;
    IBQEstabsECID_ESTAB: TIntegerField;
    IBUSQLEstabEc: TIBUpdateSQL;
    Label23: TLabel;
    Label24: TLabel;
    IFondoEstablecimiento: TImage;
    IFondoDatosGrales: TImage;
    IFondoEstaExistente: TImage;
    Label25: TLabel;
    PDatosEvento: TPanel;
    IFondoDatosEvento: TImage;
    Label26: TLabel;
    Label19: TLabel;
    ErodeoAC: TEdit;
    CBSangradoAC: TComboBox;
    Label18: TLabel;
    Label17: TLabel;
    CBCCAC: TComboBox;
    CBCronDentAC: TComboBox;
    Label16: TLabel;
    Label15: TLabel;
    CBEstadoAC: TComboBox;
    DTPFecha: TDateTimePicker;
    Label14: TLabel;
    Label13: TLabel;
    CBCategAC: TComboBox;
    EcantAC: TEdit;
    Label12: TLabel;
    Label27: TLabel;
    Mdescx: TMemo;
    RBCC5: TJvRadioButton;
    RBCC9: TJvRadioButton;
    Label20: TLabel;
    DTPIniServ: TDateTimePicker;
    Label28: TLabel;
    DTPFinServ: TDateTimePicker;
    Label29: TLabel;
    CBMetodoDiag: TComboBox;
    Image6: TImage;
    IBQReportes: TIBQuery;
    Label21: TLabel;
    ERazaAC: TEdit;
    IBQListado: TIBQuery;
    IBQBorar: TIBQuery;
    IBQCargar: TIBQuery;
    LCantEstab: TLabel;
    IEliminarEstab: TImage;
    Label30: TLabel;
    SGPlanilla: TJvStringGrid;
    PMOpciones: TPopupMenu;
    Copiar1: TMenuItem;
    Pegar1: TMenuItem;
    Cortar1: TMenuItem;
    BorrarContenido1: TMenuItem;
    ILIconos: TImageList;
    TSavePlanilla: TTimer;
    Label31: TLabel;
    Label32: TLabel;
    CBGrupo: TComboBox;
    IDeshacer: TImage;
    LDeshacer: TLabel;
    IExpExcel: TImage;
    LexpExcel: TLabel;
    SDExcel: TSaveDialog;
    ISacarAnimal: TJvImage;
    LElimAnimal: TLabel;
    procedure BSalirClick(Sender: TObject);
    procedure BHuellaClick(Sender: TObject);
    procedure BDiagnosticoClick(Sender: TObject);
    procedure BVolverDiagClick(Sender: TObject);
    procedure BInformeDiagClick(Sender: TObject);
    procedure VerInformeClick(Sender: TObject);
    procedure GetMarkText(Sender: TChartSeries;
      ValueIndex: Integer; var MarkText: String);
    procedure GetMarkText1(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: String);
    procedure JvIDiagnosticoRepClick(Sender: TObject);
    procedure BVovlerdeinforClick(Sender: TObject);
    procedure BSiguienteClick(Sender: TObject);
    procedure BSalirReporteClick(Sender: TObject);
    procedure CBRodeosChange(Sender: TObject);
    procedure CBCategoriaChange(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure SLVInformesClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BHistorialClick(Sender: TObject);
    procedure CBRodeosCloseUp(Sender: TObject);
    procedure CBCategoriaCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SSExcelEditing(Sender: TcxSSBookSheet; const ACol,
      ARow: Integer; var CanEdit: Boolean);
    procedure SSExcelEndEdit(Sender: TObject);
    procedure LBErroresClick(Sender: TObject);
    procedure SiguienteRepClick(Sender: TObject);
    procedure VolverDeRepClick(Sender: TObject);
    procedure AceptarSelRepRepClick(Sender: TObject);
    procedure IEstabNuevoClick(Sender: TObject);
    procedure CargarEstab;
    procedure IAceptarEstabClick(Sender: TObject);
    procedure DBGEstablecimientosCellClick(Column: TColumn);
    procedure ICancelarEstabClick(Sender: TObject);
    procedure ISelEstabClick(Sender: TObject);
    procedure RBCC5Click(Sender: TObject);
    procedure RBCC9Click(Sender: TObject);
    procedure DBCCondPrenezPreniadasBeforeDrawAxes(Sender: TObject);
    procedure DBCCondPrenezPreniadasGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure DBCCronPreniezVaciasGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure IEliminarEstabClick(Sender: TObject);
    procedure DBGEstablecimientosDblClick(Sender: TObject);
    procedure TSavePlanillaTimer(Sender: TObject);
    procedure SGPlanillaExitCell(Sender: TJvStringGrid; AColumn,
      ARow: Integer; const EditText: String);
    procedure CBGrupoChange(Sender: TObject);
    procedure CBGrupoCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SGPlanillaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IDeshacerClick(Sender: TObject);
    procedure IExpExcelClick(Sender: TObject);
    procedure CBCategACChange(Sender: TObject);
    procedure CBCCACChange(Sender: TObject);
    procedure CBCronDentACChange(Sender: TObject);
    procedure CBEstadoACChange(Sender: TObject);
    procedure CBSangradoACChange(Sender: TObject);
    procedure ERazaACChange(Sender: TObject);
    procedure ISacarAnimalClick(Sender: TObject);
        
        
   
  private
    ArrDiagnostico : TArrDiagnostico;
    CantAnimales : Integer;
    archivo_importacion : String;
    //Tacto
    CondCorpDiag : String;
    seleccion : boolean;
    CronVac, CronPre, CondVac, CondPre, PorPrenCond, PorPrenCron : TBarSeries;
    PorcentajeTactadas, PorcentajeDistribucion : TPieSeries;
    Listado, CantDist, CantDistCond, CantDistCron, Porcentaje : String;
    Condicion : String;
    Total : Integer;
    TotalBrucN, TotalBrucP, TotalBrucS, TotalBrucND : integer;
    RListado, RCantDist, RCantDistCond, RCantDistCron, RPorcentaje : String;
    TotalCond, TotalCron : integer;
    OleCExcel: TOleContainer;
    Ingreso : Integer;
    Pagina : Integer;
    C, F :Integer;
    id_estable, tipo_CC : Integer;
    ind_garcifo : Integer;
    procedure CargarCC;
    procedure CargarDatosGenerales();
    procedure CargarPlanillaDiag;
    procedure GenerarInformeDiag;
    procedure ActualizarListado();
    procedure ArmarTablas();
    procedure ValoresTablaComunes(SGTabla : TStringGrid);
    procedure CargarValoresBlancosCron();
    procedure CargarValoresBlancosCond();
    procedure CargarValorDatosPorCron();
    procedure CargarValorDatosPorCond();
    procedure CalcularBrucelosis();
    procedure CrearSeries();
    procedure ArmarSeries();
    procedure ArmarTablaCondPreview(F : TFREPInfoGralGestPreview);
    procedure ArmarTablaCronPreview(F : TFREPInfoGralGestPreview);
    procedure ArmarPreview;
    procedure RecorrerDirectorio(Directorio : String);
    procedure CargarTodasLasPlanillas(Arch : String);
    function VerificarPlanilla : Boolean;
    ////////////////
    procedure CargarAnimales(Archivo : String; Tipo : Integer);
    procedure seleccionarCelda(col,fil: integer);
    function PerteneceAEstab(Arch : String) : Boolean;
  public
    Salida : INteger;
    IndRep : Integer;
    function CargarBanda(F : TFREPInfoGralGestPreview) : Boolean;
  published
    constructor Create(AOwner : TComponent; TipoIngreso : Integer); reintroduce;

    /////////////////////////////////////////////////////////////////////para manejo tipo Excel

    procedure SGPlanillaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGPlanillaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SGPlanillaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SGPlanillaSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure Pegar1Click(Sender: TObject);
    procedure BorrarContenido1Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure Cortar1Click(Sender: TObject);
    procedure SGPlanillaDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure SGPlanillaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CBCloseUp(Sender: TObject);
    procedure SGPlanillaKeyPress(Sender: TObject; var Key: Char);
    procedure SGPlanillaClick(Sender: TObject);

  private
    Grilla : TMatGrilla;
    ValorPrimeroInt, InicioArrastreF, InicioArrastrCol, FilW, ColW  : Integer;
    FilSel, ColSel, FinArrastreF, FinArrastreCol : Integer;
    ValorPrimeroStr : String;
    Deshacer : TRegDeshacer;
    procedure InicBordes;
    function RefToCell(ARow, ACol: Integer): string;
    function SaveAsExcelFile(AGrid: TStringGrid; ASheetName, AFileName: string): Boolean;
  end;

var
  FEducacionContinua: TFEducacionContinua;

implementation

uses
  UCartel, UMensajeHuella, Uprincipal;

{$R *.dfm}

constructor TCelda.Create(col: integer; fil: integer);
begin
  inherited Create();
  self.col := col;
  self.fil := fil;
end;

function TCelda.getCol() :integer;
begin
  Result := self.col;
end;

function TCelda.getFil() :integer;
begin
  Result := self.fil;
end;

procedure TFEducacionContinua.seleccionarCelda(col,fil: integer);
begin
  SGPlanilla.Col := col;
  SGPlanilla.Row := fil;
end;

constructor TFEducacionContinua.Create(AOwner : TComponent; TipoIngreso : Integer);
begin
  inherited Create(AOwner);
  Ingreso := TipoIngreso;
  Salida := 0; //Sigue en Huella
  InicBordes;
  ValorPrimeroInt := -1;
  IFondoDatosGrales.Align := alClient;
  IFondoEstablecimiento.Align := alClient;
  IFondoEstaExistente.Align := alClient;
  IFondoDatosEvento.Align := alClient;
end;

procedure TFEducacionContinua.GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  inherited;
  if MarkText='0 %' then MarkText := '';
end;

procedure TFEducacionContinua.GetMarkText1(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  inherited;
  if MarkText='0' then MarkText := ''
  else MarkText := MarkText+'%'
end;

procedure TFEducacionContinua.ValoresTablaComunes(SGTabla : TStringGrid);
begin
  SGTabla.Cells[0,2] := 'Vientres';
  SGTabla.Cells[0,4] := 'preñados';
  SGTabla.Cells[1,1] := ' Cabeza';
  SGTabla.Cells[1,2] := '   %';
  SGTabla.Cells[1,3] := ' Cuerpo';
  SGTabla.Cells[1,4] := '   %';
  SGTabla.Cells[1,5] := ' Cola';
  SGTabla.Cells[1,6] := '   %';
  SGTabla.Cells[1,7] := 'Inseminación';
  SGTabla.Cells[1,8] := '   %';

  SGTabla.Cells[0,9] := 'Subtotal';
  SGTabla.Cells[1,9] := '  Cab.';
  SGTabla.Cells[1,10] := '   %';

  SGTabla.Cells[0,11] := ' Vacias';
  SGTabla.Cells[1,11] := '  Cab.';
  SGTabla.Cells[1,12] := '   %';

  SGTabla.Cells[0,13] := 'Total de ';
  SGTabla.Cells[1,13] := 'Vientres';
  SGTabla.Cells[1,14] := '   %';
  SGTabla.Cells[0,15] := ' % de ';
  SGTabla.Cells[1,15] := 'Preñez ';
end;

procedure TFEducacionContinua.CrearSeries;
begin
CronVac := TBarSeries.Create(nil);
  CronVac.Title := ' ';
  CronVac.Name := 'CronVac';
  CronVac.SeriesColor := $00D5F3FF;
  CronVac.Marks.Visible := true;
  CronVac.PercentFormat := '#0.# %';
  CronVac.Marks.Style := smsPercent;
  CronVac.Marks.Font.Size := 8;
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
  CronPre.Marks.Font.Size := 8;
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
  CondPre.Marks.Font.Size := 8;
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
  CondVac.Marks.Font.Size := 8;
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
  PorPrenCond.Marks.Font.Size := 8;
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
  PorPrenCron.Marks.Font.Size := 8;
  PorPrenCron.Marks.Transparent := false;
  PorPrenCron.Marks.Clip := true;
  PorPrenCron.Marks.ArrowLength := 5;
  PorPrenCron.Marks.BackColor := clWhite;
  PorPrenCron.OnGetMarkText := GetMarkText1;

  PorcentajeTactadas := TPieSeries.Create(nil);
  PorcentajeTactadas.Marks.Style := smsPercent;
  PorcentajeTactadas.Marks.Font.Size := 10;
  PorcentajeDistribucion := TPieSeries.Create(nil);
  PorcentajeDistribucion.Marks.Style := smsPercent;
  PorcentajeDistribucion.Marks.Font.Size := 10;
end;

procedure TFEducacionContinua.CargarValoresBlancosCron;
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

procedure TFEducacionContinua.CargarValoresBlancosCond;
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

procedure TFEducacionContinua.CargarValorDatosPorCron;
var
  Col, Fil, cant, indice : integer;
  Codigo : String;
  SumaCol, SumaFila : integer;
  SumaPorcCol, SumaPorcFila, porc, acumulado : real;
  cat, rod, pasac, pasar, gru, pasargru : Boolean;
begin
  CargarValoresBlancosCron();
  TotalCron := 0;
  indice := 0;

  cat := (CBCategoria.Text <> 'CATEGORIA') and (CBCategoria.Text <> '(TODAS)');
  rod := (CBRodeos.Text <> 'RODEO') and (CBRodeos.Text <> '(TODOS)');
  gru := (CBGrupo.Text <> 'GRUPO') and (CBGrupo.Text <> '(TODOS)');

  pasac := true;
  pasar := true;
  pasargru := true;

  while indice <= Length(ArrDiagnostico)-1 do
  begin

    if (ArrDiagnostico[indice].CronDent = 'NN') or (ArrDiagnostico[indice].CronDent = 'NO DEFINIDA') or (ArrDiagnostico[indice].CronDent = '') then
      Col := 11;
    if (ArrDiagnostico[indice].CronDent = 'DL') or (ArrDiagnostico[indice].CronDent = 'DIENTE DE LECHE') then
      Col := 2;
    if (ArrDiagnostico[indice].CronDent = '2D') or (ArrDiagnostico[indice].CronDent = '2 DIENTES') then
      Col := 3;
    if (ArrDiagnostico[indice].CronDent = '4D') or (ArrDiagnostico[indice].CronDent = '4 DIENTES') then
      Col := 4;
    if (ArrDiagnostico[indice].CronDent = '6D') or (ArrDiagnostico[indice].CronDent = '6 DIENTES') then
      Col := 5;
    if (ArrDiagnostico[indice].CronDent = 'BL') or (ArrDiagnostico[indice].CronDent = 'BOCA LLENA') then
      Col := 6;
    if (ArrDiagnostico[indice].CronDent = 'TD') or (ArrDiagnostico[indice].CronDent = 'TRES CUARTOS DIENTE') then
      Col := 7;
    if (ArrDiagnostico[indice].CronDent = 'MD') or (ArrDiagnostico[indice].CronDent = 'MEDIO DIENTE') then
      Col := 8;
    if (ArrDiagnostico[indice].CronDent = 'CD') or (ArrDiagnostico[indice].CronDent = 'CUARTO DIENTE') then
      Col := 9;
    if (ArrDiagnostico[indice].CronDent = 'SD') or (ArrDiagnostico[indice].CronDent = 'SIN DIENTE') then
      Col := 10;

    if (ArrDiagnostico[indice].EstadoRep = 'CA') or (ArrDiagnostico[indice].EstadoRep = 'CABEZA') then
      Fil := 1;
    if (ArrDiagnostico[indice].EstadoRep = 'CU') or (ArrDiagnostico[indice].EstadoRep = 'CUERPO') then
      Fil := 3;
    if (ArrDiagnostico[indice].EstadoRep = 'CO') or (ArrDiagnostico[indice].EstadoRep = 'COLA') then
      Fil := 5;
    if (ArrDiagnostico[indice].EstadoRep = 'PR') or (ArrDiagnostico[indice].EstadoRep = 'PREÑADA') then
      Fil := 7;
    if (ArrDiagnostico[indice].EstadoRep = 'VA') or (ArrDiagnostico[indice].EstadoRep = 'VACIA') then
      Fil := 11;

    if (ArrDiagnostico[indice].FechaTacto >= DTPDesde.Date) and (ArrDiagnostico[indice].FechaTacto <= DTPHasta.Date) then
    begin

      if cat then
        pasac := ArrDiagnostico[indice].Categoria = CBCategoria.Text;
      if rod then
        pasar := ArrDiagnostico[indice].Rodeo = CBRodeos.Text;
      if gru then
        pasargru := ArrDiagnostico[indice].Archivo = CBGrupo.Text;

      if pasac and pasar and pasargru then
      begin
        if not TryStrToInt(SGTablaCond.Cells[Col,Fil],cant) then
          cant := 0;
        cant := cant + 1;
        SGTablaCond.Cells[Col,Fil] := IntToStr(cant);
        TotalCron := TotalCron+cant;
      end;
    end;
    Inc(Indice);
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

procedure TFEducacionContinua.CargarValorDatosPorCond;
var
  Col, Fil, cant, CantVacias, CantPreniadas, indice : integer;
  Codigo : String;
  SumaCol, SumaFila : integer;
  SumaPorcCol, SumaPorcFila, porc, acumulado, cond : real;
  rod, cat, pasac, pasar, gru, pasaru : Boolean;
begin
  CargarValoresBlancosCond();
  TotalCond := 0;
  indice := 0;

  cat := (CBCategoria.Text <> 'CATEGORIA') and (CBCategoria.Text <> '(TODAS)');
  rod := (CBRodeos.Text <> 'RODEO') and (CBRodeos.Text <> '(TODOS)');
  gru := (CBGrupo.Text <> 'GRUPO') and (CBGrupo.Text <> '(TODOS)');
  pasac := true;
  pasar := true;
  pasaru := true;

  while indice <= Length(ArrDiagnostico)-1 do
  begin
    if ArrDiagnostico[indice].CondCorp = '' then
      Col := 11;
    if (ArrDiagnostico[indice].CondCorp = '1') then
      Col := 2;
    if tipo_CC = 1 then
    begin
      if (ArrDiagnostico[indice].CondCorp = '2') then
        Col := 3;
      if (ArrDiagnostico[indice].CondCorp = '3') then
        Col := 4;
      if (ArrDiagnostico[indice].CondCorp = '4') then
        Col := 5;
      if (ArrDiagnostico[indice].CondCorp = '5') then
        Col := 6;
      if (ArrDiagnostico[indice].CondCorp = '6') then
        Col := 7;
      if (ArrDiagnostico[indice].CondCorp = '7') then
        Col := 8;
      if (ArrDiagnostico[indice].CondCorp = '8') then
        Col := 9;
      if (ArrDiagnostico[indice].CondCorp = '9') then
        Col := 10;
    end
    else
    begin
      if (ArrDiagnostico[indice].CondCorp = '1,5') then
        Col := 3;
      if (ArrDiagnostico[indice].CondCorp = '2') then
        Col := 4;
      if (ArrDiagnostico[indice].CondCorp = '2,5') then
        Col := 5;
      if (ArrDiagnostico[indice].CondCorp = '3') then
        Col := 6;
      if (ArrDiagnostico[indice].CondCorp = '3,5') then
        Col := 7;
      if (ArrDiagnostico[indice].CondCorp = '4') then
        Col := 8;
      if (ArrDiagnostico[indice].CondCorp = '4,5') then
        Col := 9;
      if (ArrDiagnostico[indice].CondCorp = '5') then
        Col := 10;
    end;

    if (ArrDiagnostico[indice].EstadoRep = 'CA') or (ArrDiagnostico[indice].EstadoRep = 'CABEZA') then
      Fil := 1;
    if (ArrDiagnostico[indice].EstadoRep = 'CU') or (ArrDiagnostico[indice].EstadoRep = 'CUERPO') then
      Fil := 3;
    if (ArrDiagnostico[indice].EstadoRep = 'CO') or (ArrDiagnostico[indice].EstadoRep = 'COLA') then
      Fil := 5;
    if (ArrDiagnostico[indice].EstadoRep = 'PR') or (ArrDiagnostico[indice].EstadoRep = 'PREÑADA') then
      Fil := 7;
    if (ArrDiagnostico[indice].EstadoRep = 'VA') or (ArrDiagnostico[indice].EstadoRep = 'VACIA') then
      Fil := 11;

    if (ArrDiagnostico[indice].FechaTacto >= DTPDesde.Date) and (ArrDiagnostico[indice].FechaTacto <= DTPHasta.Date) then
    begin

      if cat then
        pasac := ArrDiagnostico[indice].Categoria = CBCategoria.Text;
      if rod then
        pasar := ArrDiagnostico[indice].Rodeo = CBRodeos.Text;
      if gru then
        pasaru := ArrDiagnostico[indice].Archivo = CBGrupo.Text;

      if pasac and pasar and pasaru then
      begin
        if not TryStrToInt(SGTablaCron.Cells[Col,Fil],cant) then
          cant := 0;
        cant := cant + 1;
        SGTablaCron.Cells[Col,Fil] := IntToStr(cant);
        TotalCond := TotalCond+cant;
      end;
    end;
    Inc(indice);
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
          if SGTablaCron.Cells[Col,0] = 'No Def.' then
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

procedure TFEducacionContinua.ArmarTablas;
var
  cc : double;
  i, valor, cant : integer;
begin
  ValoresTablaComunes(SGTablaCron);
  ValoresTablaComunes(SGTablaCond);
  SGTablaCron.Cells[12,0] := '  Total';
  SGTablaCron.Cells[13,0] := '  Prom.';
  SGTablaCond.Cells[12,0] := SGTablaCron.Cells[12,0];
  SGTablaCond.Cells[13,0] := SGTablaCron.Cells[13,0];

  //Valores Para la condicion corporal

  i := 2;
  cc := 1;
  cant := 0;
  while cant < 10 do
  begin
    if tipo_CC = 2 then
    begin
      SGTablaCron.Cells[i,0] := FormatFloat('0.0',cc);
      cc := cc + 0.5;
    end
    else
    begin
      SGTablaCron.Cells[i,0] := FormatFloat('0',cc);
      cc := cc + 1;
    end;
    inc(cant);
    Inc(i);
  end;
  SGTablaCron.Cells[i,0] := 'No Def.';

  SGTablaCond.Cells[2,0] := 'DL';
  SGTablaCond.Cells[3,0] := '2D';
  SGTablaCond.Cells[4,0] := '4D';
  SGTablaCond.Cells[5,0] := '6D';
  SGTablaCond.Cells[6,0] := 'BL';
  SGTablaCond.Cells[7,0] := 'TD';
  SGTablaCond.Cells[8,0] := 'MD';
  SGTablaCond.Cells[9,0] := 'CD';
  SGTablaCond.Cells[10,0] := 'SD';
  SGTablaCond.Cells[11,0] := 'No Def.';

  CargarValoresBlancosCron();
  CargarValoresBlancosCond();
end;

procedure TFEducacionContinua.ArmarTablaCronPreview(F : TFREPInfoGralGestPreview);
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

procedure TFEducacionContinua.CalcularBrucelosis;
var
  I : Integer;
  cat, rod, gru, pasac, pasar, pasagru : Boolean;
begin
  i := 0;
  TotalBrucN := 0;
  TotalBrucND := 0;
  TotalBrucP := 0;
  TotalBrucS := 0;

  cat := (CBCategoria.Text <> 'CATEGORIA') and (CBCategoria.Text <> '(TODAS)');
  rod := (CBRodeos.Text <> 'RODEO') and (CBRodeos.Text <> '(TODOS)');
  gru := (CBGrupo.Text <> 'GRUPO') and (CBGrupo.Text <> '(TODOS)');
  pasac := true;
  pasar := true;
  pasagru := true;

  while i <= Length(ArrDiagnostico)-1 do
  begin
    if (ArrDiagnostico[i].FechaTacto >= DTPDesde.Date) and (ArrDiagnostico[i].FechaTacto <= DTPHasta.Date) then
    begin

      if cat then
        pasac := ArrDiagnostico[i].Categoria = CBCategoria.Text;
      if rod then
        pasar := ArrDiagnostico[i].Rodeo = CBRodeos.Text;
      if gru then
        pasagru := ArrDiagnostico[i].Archivo = CBGrupo.Text;

      if pasac and pasar and pasagru then
      begin
        if ArrDiagnostico[i].ResBruc = 'NEGATIVO' then
          TotalBrucN := TotalBrucN + 1;
        if ArrDiagnostico[i].ResBruc = 'POSITIVO' then
          TotalBrucP := TotalBrucP + 1;
        if ArrDiagnostico[i].ResBruc = 'SOSPECHOSO' then
          TotalBrucS := TotalBrucS + 1;
        if ArrDiagnostico[i].ResBruc = 'NO DEFINIDO' then
          TotalBrucND := TotalBrucND + 1;
      end;
    end;
    Inc(i);
  end;
end;

procedure TFEducacionContinua.ArmarTablaCondPreview(F : TFREPInfoGralGestPreview);
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

procedure TFEducacionContinua.ArmarSeries;
var
  TotalPorc : Array [0..1] of Double;
  TotalPorcDist : Array [0..3] of Double;
  TotalPCond, TotalVCond, TotalPCron, TotalVCron, TotalPrenCond, TotalPrenCron : Array [0..10] of Double;
  col, indice : integer;
  cat, rod, gru, pasac, pasar, pasagru : Boolean;
begin

  DBCronPreniezPreniadas.Title.Text.Clear;
  DBCCronPreniezVacias.Title.Text.Clear;

  DBCronPreniezPreniadas.Title.Text.Add('Cronología Dentaria en las preñadas');
  DBCCronPreniezVacias.Title.Text.Add('Cronología Dentaria en las vacias');

  DBCPorPrenCron.BottomAxis.Title.Caption := 'Cronologías Dentarias';
  DBCCronPreniezVacias.BottomAxis.Title.Caption := 'Cronologías Dentarias';
  DBCronPreniezPreniadas.BottomAxis.Title.Caption := 'Cronologías Dentarias';

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
  DBCCronPreniezVacias.RemoveAllSeries;
  DBCCronPreniezVacias.AddSeries(CronVac);
  CronVac.AddArray(TotalVCron);

  CronPre.Clear;
  DBCronPreniezPreniadas.RemoveAllSeries;
  DBCronPreniezPreniadas.AddSeries(CronPre);
  CronPre.AddArray(TotalPCron);

  CondVac.Clear;
  DBCCondPrenezVacias.RemoveAllSeries;
  DBCCondPrenezVacias.AddSeries(CondVac);
  CondVac.AddArray(TotalVCond);

  CondPre.Clear;
  DBCCondPrenezPreniadas.RemoveAllSeries;
  DBCCondPrenezPreniadas.AddSeries(CondPre);
  CondPre.AddArray(TotalPCond);

  PorPrenCond.Clear;
  DBPorPrenCond.RemoveAllSeries;
  DBPorPrenCond.AddSeries(PorPrenCond);
  PorPrenCond.AddArray(TotalPrenCond);

  PorPrenCron.Clear;
  DBCPorPrenCron.RemoveAllSeries;
  DBCPorPrenCron.AddSeries(PorPrenCron);
  PorPrenCron.AddArray(TotalPrenCron);

  //Tactadas
  indice := 0;

  cat := (CBCategoria.Text <> 'CATEGORIA') and (CBCategoria.Text <> '(TODAS)');
  rod := (CBRodeos.Text <> 'RODEO') and (CBRodeos.Text <> '(TODOS)');
  gru := (CBGrupo.Text <> 'GRUPO') and (CBGrupo.Text <> '(TODOS)');
  pasac := true;
  pasar := true;
  pasagru := true;

  while indice <= Length(ArrDiagnostico)-1 do
  begin

    if (ArrDiagnostico[indice].FechaTacto >= DTPDesde.Date) and (ArrDiagnostico[indice].FechaTacto <= DTPHasta.Date) then
    begin

      if cat then
        pasac := ArrDiagnostico[indice].Categoria = CBCategoria.Text;
      if rod then
        pasar := ArrDiagnostico[indice].Rodeo = CBRodeos.Text;
      if gru then
        pasagru := ArrDiagnostico[indice].Archivo = CBGrupo.Text;

      if pasac and pasar and pasagru then
      begin
        if ArrDiagnostico[Indice].EstadoRep = 'VACIA' then
          TotalPorc[0] := TotalPorc[0] + 1
        else
          TotalPorc[1] := TotalPorc[1] + 1;
      end;
    end;
    Inc(indice);
  end;

  PorcentajeTactadas.Clear;
  DBCTactadas.RemoveAllSeries;
  DBCTactadas.AddSeries(PorcentajeTactadas);
  if TotalPorc[0] > 0 then
    PorcentajeTactadas.Add(TotalPorc[0],'VACIAS',clRed);
  if TotalPorc[1] > 0 then
    PorcentajeTactadas.Add(TotalPorc[1],'PREÑADAS',clGreen);

  //Distribucion
  indice := 0;

  cat := (CBCategoria.Text <> 'CATEGORIA') and (CBCategoria.Text <> '(TODAS)');
  rod := (CBRodeos.Text <> 'RODEO') and (CBRodeos.Text <> '(TODOS)');
  gru := (CBGrupo.Text <> 'GRUPO') and (CBGrupo.Text <> '(TODOS)');
  pasac := true;
  pasar := true;
  pasagru := true;

  while indice <= Length(ArrDiagnostico)-1 do
  begin

    if (ArrDiagnostico[indice].FechaTacto >= DTPDesde.Date) and (ArrDiagnostico[indice].FechaTacto <= DTPHasta.Date) then
    begin

      if cat then
        pasac := ArrDiagnostico[indice].Categoria = CBCategoria.Text;
      if rod then
        pasar := ArrDiagnostico[indice].Rodeo = CBRodeos.Text;
      if gru then
        pasagru := ArrDiagnostico[indice].Archivo = CBGrupo.Text;

      if pasac and pasar and pasagru then
      begin

        if ArrDiagnostico[indice].EstadoRep = 'CABEZA' then
          TotalPorcDist[0] := TotalPorcDist[0] + 1;
        if ArrDiagnostico[indice].EstadoRep = 'CUERPO' then
          TotalPorcDist[1] := TotalPorcDist[1] + 1;
        if ArrDiagnostico[indice].EstadoRep = 'COLA' then
          TotalPorcDist[2] := TotalPorcDist[2] + 1;
        if ArrDiagnostico[indice].EstadoRep = 'INSEMINACION' then
          TotalPorcDist[3] := TotalPorcDist[3] + 1;
      end;
    end;
    Inc(indice);
  end;

  PorcentajeDistribucion.Clear;
  DBCDistribucion.RemoveAllSeries;
  DBCDistribucion.AddSeries(PorcentajeDistribucion);

  if TotalPorcDist[0] > 0 then
    PorcentajeDistribucion.Add(TotalPorcDist[0],'CABEZA',clRed);
  if TotalPorcDist[1] > 0 then
    PorcentajeDistribucion.Add(TotalPorcDist[1],'CUERPO',clBlue);
  if TotalPorcDist[2] > 0 then
    PorcentajeDistribucion.Add(TotalPorcDist[2],'COLA',clYellow);
  if TotalPorcDist[3] > 0 then
    PorcentajeDistribucion.Add(TotalPorcDist[3],'INSEMINACION',clGreen);
end;

procedure TFEducacionContinua.ActualizarListado;
begin
end;

procedure TFEducacionContinua.FormCreate(Sender: TObject);
begin
  inherited;

end;

procedure TFEducacionContinua.BSalirClick(Sender: TObject);
begin
  inherited;
  Salida := 0;
  Close;
end;

procedure TFEducacionContinua.BHuellaClick(Sender: TObject);
begin
  inherited;
  Salida := 1;
  Close;
end;

procedure TFEducacionContinua.BDiagnosticoClick(Sender: TObject);
begin
  inherited;

  PDiagnostico.Visible := true;
  PDiagnostico.Align := alClient;
  PDiagnostico.BringToFront;

  PDatosGral.Visible := true;
  PDatosGral.Align := alClient;
  
  PEstablecimiento.Align := alClient;
  PEstablecimiento.Visible := true;

  PExcel.Visible := false;
  TSavePlanilla.Enabled := false;
  PInforme.Visible := false;
  LInforme.Visible := false;
  IInforme.Visible := false;
  IExpExcel.Visible := false;
  LexpExcel.Visible := false;
  ISacarAnimal.Visible := false;
  LElimAnimal.Visible := false;

  Pagina := 1;

  CargarPlanillaDiag;

end;

procedure TFEducacionContinua.BVolverDiagClick(Sender: TObject);
begin
  inherited;
  if Pagina = 1 then
  begin
    PDiagnostico.Visible := false;
  end;
  if Pagina = 2 then
  begin
    PDatos.Visible := true;
    PDatosEvento.Visible := false;
    Pagina := 1;
    IVolver.Visible := false;
    LVolver.Visible := false;
    LInforme.Visible := false;
    IInforme.Visible := false;
    IExpExcel.Visible := false;
    LexpExcel.Visible := false;
    ISacarAnimal.Visible := false;
    LElimAnimal.Visible := false;

    LSiguiente.Visible := true;
    ISiguiente.Visible := true;
  end;
  if Pagina = 3 then
  begin
    PDatosGral.Visible := true;
    PDatosEvento.Visible := true;
    LInforme.Visible := false;
    IInforme.Visible := false;
    LexpExcel.Visible := false;
    IExpExcel.Visible := false;
    PExcel.Visible := false;
    ISacarAnimal.Visible := false;
    LElimAnimal.Visible := false;
    TSavePlanilla.Enabled := false;
    LSiguiente.Visible := true;
    ISiguiente.Visible := true;
    Pagina := 2;
  end;
  if Pagina = 4 then
  begin
    LSiguiente.Visible := false;
    ISiguiente.Visible := false;
    LInforme.Visible := true;
    IInforme.Visible := true;
    LexpExcel.Visible := true;
    IExpExcel.Visible := true;
    ISacarAnimal.Visible := true;
    LElimAnimal.Visible := true;
    LInforme.OnClick := BInformeDiagClick;
    IInforme.OnClick := BInformeDiagClick;
    LInforme.Caption := 'Informe';
    PDatosGral.Visible := false;
    PInforme.Visible := false;
    PExcel.Visible := true;
    PExcel.Align := alClient;
    TSavePlanilla.Enabled := true;
    //SSExcel.Align := alClient;
    //SSExcel.SetFocus;
    SGPlanilla.Align := alClient;
    SGPlanilla.SetFocus;
    Pagina := 3;
    LCancelar.Caption := 'Cancelar';
  end;
end;

procedure TFEducacionContinua.CargarPlanillaDiag;
var
  ext, exp : String;
  Archivo, DirCopia : String;
  I : Integer;
begin
  CantAnimales := 0;

  //Archivo := ExtractFilePath(Application.ExeName)+'Planillas\Gestacion\Diagnostico Gestacion.xls';

  //ext := ExtractFileExt(Archivo);
  //Archivo := StringReplace(Archivo,ext,'',[rfReplaceAll]);

  DirCopia := ExtractFilePath(Application.ExeName)+'Planillas Excel\Gestacion\';

  if not DirectoryExists(DirCopia) then
    MkDir(DirCopia);

  archivo_Importacion := DirCopia+'Diagnostico_Gestacion_'+IntToStr(HourOf(Time))+'-'+IntToStr(MinuteOf(Time))+'_'+StringReplace(DateToStr(Date),'/','-',[rfReplaceAll])+'.CSV';
  exp := Archivo+ext;

  //CopyFile(PAnsiChar(exp),PAnsiChar(archivo_Importacion),false);

  Application.ProcessMessages;

  //SSExcel.LoadFromFile(archivo_importacion);
  //SSExcel.ShowHeaders := false;

end;

procedure TFEducacionContinua.GenerarInformeDiag;
begin
  try
    CargarAnimales('',1);
 finally

 end;

end;

procedure TFEducacionContinua.CargarAnimales(Archivo : String; Tipo : Integer);
var
  I : Integer;
  d : TDateTime;
  Arch : TextFile;
  Val : String;
  Linea : TStringList;
  NomArch : String;
begin
  if Tipo = 2 then
  begin
    try

    NomArch := ExtractFileName(Archivo);
    NomArch := StringReplace(NomArch,'_',' ',[rfReplaceAll]);
    NomArch := StringReplace(NomArch,'-',':',[]);
    NomArch := StringReplace(NomArch,'-','/',[rfReplaceAll]);
    NomArch := StringReplace(NomArch,ExtractFileExt(Archivo),'',[rfReplaceAll]);

    AssignFile(Arch,Archivo);
    Reset(Arch);
    Readln(Arch);
    Linea := TStringList.Create;

    while (not Eof(Arch)) do
    begin
      Linea.Clear;
      Readln(Arch,Val);
      Val := StringReplace(Val,' ','$',[rfReplaceAll]);
      Linea.Delimiter := ';';
      Linea.DelimitedText := Val;
      if Linea.Strings[1] <> '' then
      begin
        SetLength(ArrDiagnostico,CantAnimales+1);
        ArrDiagnostico[CantAnimales].RP := StringReplace(Linea.Strings[1],'$',' ',[rfReplaceAll]);
        if TryStrToDate(Linea.Strings[2],d) then
          ArrDiagnostico[CantAnimales].FechaTacto := d
        else
          ArrDiagnostico[CantAnimales].FechaTacto := Date;  
        ArrDiagnostico[CantAnimales].Categoria := UpperCase(StringReplace(Linea.Strings[3],'$',' ',[rfReplaceAll]));
        ArrDiagnostico[CantAnimales].Raza := StringReplace(Linea.Strings[4],'$',' ',[rfReplaceAll]);
        ArrDiagnostico[CantAnimales].CronDent := Uppercase(StringReplace(Linea.Strings[5],'$',' ',[rfReplaceAll]));
        ArrDiagnostico[CantAnimales].CondCorp := StringReplace(Linea.Strings[6],'$',' ',[rfReplaceAll]);
        ArrDiagnostico[CantAnimales].EstadoRep := Uppercase(StringReplace(Linea.Strings[7],'$',' ',[rfReplaceAll]));
        ArrDiagnostico[CantAnimales].ResBruc := Uppercase(StringReplace(Linea.Strings[8],'$',' ',[rfReplaceAll]));
        ArrDiagnostico[CantAnimales].Rodeo := StringReplace(Linea.Strings[9],'$',' ',[rfReplaceAll]);
        ArrDiagnostico[CantAnimales].Obs := StringReplace(Linea.Strings[10],'$',' ',[rfReplaceAll]);
        ArrDiagnostico[CantAnimales].Archivo := NomArch;

        if ArrDiagnostico[CantAnimales].Archivo <> '' then
          if CBGrupo.Items.IndexOf(ArrDiagnostico[CantAnimales].Archivo) = -1 then
            CBGrupo.Items.Add(ArrDiagnostico[CantAnimales].Archivo);

        if ArrDiagnostico[CantAnimales].Rodeo <> '' then
          if CBRodeos.Items.IndexOf(ArrDiagnostico[CantAnimales].Rodeo) = -1 then
            CBRodeos.Items.Add(ArrDiagnostico[CantAnimales].Rodeo);

        if ArrDiagnostico[CantAnimales].Categoria <> '' then
          if CBCategoria.Items.IndexOf(ArrDiagnostico[CantAnimales].Categoria) = -1 then
            CBCategoria.Items.Add(ArrDiagnostico[CantAnimales].Categoria);

        if ArrDiagnostico[CantAnimales].FechaTacto <= DTPDesde.Date then
          DTPDesde.Date := ArrDiagnostico[CantAnimales].FechaTacto-1;
        if ArrDiagnostico[CantAnimales].FechaTacto >= DTPHasta.Date then
          DTPHasta.Date := ArrDiagnostico[CantAnimales].FechaTacto+1;

        Inc(CantAnimales);
        Inc(I);
      end;
    end;
    CloseFile(Arch);
   except

   end;

  end
  else
  begin
    I := 1;
    CantAnimales := 0;
    CBGrupo.Visible := false;
    while SGPlanilla.Cells[1,I] <> '' do
    begin

      SetLength(ArrDiagnostico,CantAnimales+1);
      ArrDiagnostico[CantAnimales].RP := UpperCase(Trim(SGPlanilla.Cells[1,I]));
      if TryStrToDate(UpperCase(Trim(SGPlanilla.Cells[2,I])),d) then
        ArrDiagnostico[CantAnimales].FechaTacto := StrToDate(UpperCase(Trim(SGPlanilla.Cells[2,I])))
      else
        ArrDiagnostico[CantAnimales].FechaTacto := Date;
      ArrDiagnostico[CantAnimales].Categoria := UpperCase(Trim(SGPlanilla.Cells[3,I]));
      ArrDiagnostico[CantAnimales].Raza := UpperCase(Trim(SGPlanilla.Cells[4,I]));
      ArrDiagnostico[CantAnimales].EstadoRep := UpperCase(Trim(SGPlanilla.Cells[7,I]));
      ArrDiagnostico[CantAnimales].CronDent := UpperCase(Trim(SGPlanilla.Cells[5,I]));
      ArrDiagnostico[CantAnimales].CondCorp := UpperCase(Trim(SGPlanilla.Cells[6,I]));
      ArrDiagnostico[CantAnimales].ResBruc := UpperCase(Trim(SGPlanilla.Cells[8,I]));
      ArrDiagnostico[CantAnimales].Rodeo := UpperCase(Trim(SGPlanilla.Cells[9,I]));
      ArrDiagnostico[CantAnimales].Obs := UpperCase(Trim(SGPlanilla.Cells[10,I]));

      if ArrDiagnostico[CantAnimales].Rodeo <> '' then
        if CBRodeos.Items.IndexOf(ArrDiagnostico[CantAnimales].Rodeo) = -1 then
          CBRodeos.Items.Add(ArrDiagnostico[CantAnimales].Rodeo);

      if ArrDiagnostico[CantAnimales].Categoria <> '' then
        if CBCategoria.Items.IndexOf(ArrDiagnostico[CantAnimales].Categoria) = -1 then
          CBCategoria.Items.Add(ArrDiagnostico[CantAnimales].Categoria);

      if ArrDiagnostico[CantAnimales].FechaTacto <= DTPDesde.Date then
        DTPDesde.Date := ArrDiagnostico[CantAnimales].FechaTacto-1;
      if ArrDiagnostico[CantAnimales].FechaTacto >= DTPHasta.Date then
        DTPHasta.Date := ArrDiagnostico[CantAnimales].FechaTacto+1;

      Inc(CantAnimales);
      Inc(I);
    end;
  end;

end;

procedure TFEducacionContinua.BInformeDiagClick(Sender: TObject);
begin
  inherited;
  PErrores.Visible := false;
  if VerificarPlanilla then
  begin
    Pagina := 4;
    DTPDesde.Date := IncYear(Date(),-1);
    DTPHasta.Date := Date();
    CBCategoria.Items.Clear;
    CBRodeos.Items.Clear;
    CBGrupo.Items.Clear;
    CBCategoria.Items.Add('(TODAS)');
    CBRodeos.Items.Add('(TODOS)');
    CBGrupo.Items.Add('(TODOS)');
    //SSExcel.SaveToFile(archivo_importacion);
    GenerarInformeDiag;
    CrearSeries;
    ArmarTablas;
    CargarValorDatosPorCond;
    CargarValorDatosPorCron;
    ArmarSeries;
    CalcularBrucelosis;
    PInforme.Visible := true;
    PExcel.Visible := false;
    TSavePlanilla.Enabled := false;
    PInforme.Align := alClient;
    //BInformeDiag.OnClick := VerInformeClick;
    LInforme.OnClick := VerInformeClick;
    IInforme.OnClick := VerInformeClick;
    LInforme.Caption := 'Vista Previa';
    //BCancelar.Caption := 'Salir';
    LCancelar.Caption := 'Salir';
  end
  else
  begin
    PErrores.Visible := true;
  end;
end;

procedure TFEducacionContinua.VerInformeClick(Sender: TObject);
begin
  ArmarPreview;
end;

procedure TFEducacionContinua.ArmarPreview;
var
  F : TFREPInfoGralGestPreview;
  totalBruc : integer;
  Dir, DirDocs : String;
  indice : Integer;
  cat, rod, gru, pasac, pasar, pasagru : Boolean;
  C : TCartel;
begin

  C := TCartel.getInstance;
  C.abrircartel('Generando Informe General de Gestación');

  //Listado
  try
    IBQBorar.Close;
    IBQBorar.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;


    for indice := 0 to Length(ArrDiagnostico)-1 do
    begin

        cat := (CBCategoria.Text <> 'CATEGORIA') and (CBCategoria.Text <> '(TODAS)');
        rod := (CBRodeos.Text <> 'RODEO') and (CBRodeos.Text <> '(TODOS)');
        gru := (CBGrupo.Text <> 'GRUPO') and (CBGrupo.Text <> '(TODOS)');
        pasac := true;
        pasar := true;
        pasagru := true;
        if (ArrDiagnostico[indice].FechaTacto >= DTPDesde.Date) and (ArrDiagnostico[indice].FechaTacto <= DTPHasta.Date) then
        begin

          if cat then
            pasac := ArrDiagnostico[indice].Categoria = CBCategoria.Text;
          if rod then
            pasar := ArrDiagnostico[indice].Rodeo = CBRodeos.Text;
          if gru then
            pasagru := ArrDiagnostico[indice].Archivo = CBGrupo.Text;

          if pasac and pasar and pasagru then
          begin

            try
              IBQCargar.Close;
              IBQCargar.ParamByName('rp').Value := ArrDiagnostico[indice].RP;
              IBQCargar.ParamByName('fecha').Value := DateToStr(ArrDiagnostico[indice].FechaTacto);
              IBQCargar.ParamByName('raza').Value := ArrDiagnostico[indice].Raza;
              IBQCargar.ParamByName('cond').Value := ArrDiagnostico[indice].CondCorp;
              IBQCargar.ParamByName('cron').Value := ArrDiagnostico[indice].CronDent;
              IBQCargar.ParamByName('dist').Value := ArrDiagnostico[indice].EstadoRep;
              IBQCargar.ParamByName('bruc').Value := ArrDiagnostico[indice].ResBruc;
              IBQCargar.ParamByName('obs').Value := ArrDiagnostico[indice].Obs;
              IBQCargar.Open;

              FPrincipal.IBTPrincipal.CommitRetaining;
             except
              FPrincipal.IBTPrincipal.RollbackRetaining;
             end;

          end;
        end;
    end;

  IBQListado.Close;
  IBQListado.Open;
  IBQListado.Last;
  IBQListado.First;

  Dir := ExtractFilePath(Application.ExeName);
  DBCCondPrenezPreniadas.SaveToMetafile(Dir+'ConPren.wmf');
  DBCCondPrenezVacias.SaveToMetafile(Dir+'ConVac.wmf');
  DBCronPreniezPreniadas.SaveToMetafile(Dir+'CronPren.wmf');
  DBCCronPreniezVacias.SaveToMetafile(Dir+'CronVac.wmf');
  DBCDistribucion.SaveToMetafile(Dir+'Dist.wmf');
  DBCTactadas.SaveToMetafile(Dir+'Tact.wmf');
  DBPorPrenCond.SaveToMetafile(Dir+'PorPrenCond.wmf');
  DBCPorPrenCron.SaveToMetafile(Dir+'PorPrenCron.wmf');

  IndRep := 0;

  F := TFREPInfoGralGestPreview.Create(self,self);

  ArmarTablaCondPreview(F);
  ArmarTablaCronPreview(F);

  F.QRLPorCronDent.Caption := 'Cronología dentaria discriminada por estadio de gestación';

  F.Filtro.Enabled := false;
  F.QRLFiltro.Enabled := false;
  F.TipoF.Caption := '';
  F.TipoF.Left := 240;
  F.QRLFecha.Caption := 'Fecha: ';
  if (CBRodeos.Text <> '(TODOS)') and (CBRodeos.Text <> 'RODEO') then
    F.TipoF.Caption := 'Rodeo: '+CBRodeos.Text;
  if (CBCategoria.Text <> '(TODAS)') and (CBCategoria.Text <> 'CATEGORIA') then
  begin
    if F.TipoF.Caption <> '' then
      F.TipoF.Caption := F.TipoF.Caption + ' - Categoría: '+CBCategoria.Text
    else
      F.TipoF.Caption := 'Categoría: '+CBCategoria.Text;
  end;
  if (CBGrupo.Text <> '(TODOS)') and (CBGrupo.Text <> 'GRUPO') then
  begin
    if F.TipoF.Caption <> '' then
      F.TipoF.Caption := F.TipoF.Caption + ' - Grupo: '+CBGrupo.Text
    else
      F.TipoF.Caption := 'Grupo: '+CBGrupo.Text;
  end;

  F.QRMemo.Lines.AddStrings(MObs.Lines);

  if Pagina < 5 then
  begin
    F.QRLServicio.Enabled := true;
    F.QRLServicio.Caption := 'Servicio del '+DateToStr(DTPIniServ.Date)+' al '+DateToStr(DTPFinServ.Date);
  end;

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

  F.QRLTitulo.Caption := 'Fecha del Diagnóstico de Gestación:';
  F.QRLFecha.Enabled := true;
  F.QRLTipo.Enabled := false;
  F.Grupo.Enabled := false;
  F.Fecha.Caption := DateToStr(ArrDiagnostico[0].FechaTacto);

  F.QRLTotal.Caption := IntToStr(IBQListado.RecordCount);

  F.Estab := EEstablecimiento.Text;
  F.RENS := ERENSPA.Text;
  F.Prop := EPropietario.Text;
  F.Vet := EVeterinario.Text;
  F.DirVet := EDireccion.Text;
  F.Tel := ETElefono.Text;
  F.Mail := EMail.Text;
  F.URL := EWeb.Text; 

  C.cerrarcartel;
  C.FreeInstance;

  F.ShowModal;

  F.Destroy;
end;

procedure TFEducacionContinua.AceptarSelRepRepClick(Sender : TObject);
begin
  IBQReportes.Close;
  IBQReportes.ParamByName('id').Value := id_estable;
  IBQReportes.Open;
  PEstablecimientosExistentes.Visible := false;
  CargarEstab;
  PInforme.Visible := true;
  PInforme.BringToFront;

  LSiguiente.Visible := false;
  ISiguiente.Visible := false;
  IInforme.Visible := true;
  LInforme.Visible := true;
  LexpExcel.Visible := false;
  IExpExcel.Visible := false;
  ISacarAnimal.Visible := false;
  LElimAnimal.Visible := false;

  DTPDesde.Date := IncYear(Date(),-1);
  DTPHasta.Date := Date();
  CBCategoria.Items.Clear;
  CBRodeos.Items.Clear;
  CBGrupo.Items.Clear;
  CBCategoria.Items.Add('(TODAS)');
  CBRodeos.Items.Add('(TODOS)');
  CBGrupo.Items.Add('(TODOS)');
  RecorrerDirectorio(ExtractFilePath(Application.ExeName)+'Planillas Excel\Gestacion\');
  CrearSeries;
  ArmarTablas;
  CargarValorDatosPorCond;
  CargarValorDatosPorCron;
  ArmarSeries;
  CalcularBrucelosis;
end;

procedure TFEducacionContinua.JvIDiagnosticoRepClick(Sender: TObject);
begin
  inherited;
  PDiagnostico.Visible := true;
  PDiagnostico.Align := alClient;
  PInforme.Visible := false;
  PDatosGral.Visible := true;
  PDatosGral.Align := alClient;
  PEstablecimiento.Visible := false;
  PEstablecimientosExistentes.Visible := true;
  PEstablecimientosExistentes.Align := alClient;
  PExcel.Visible := false;
  TSavePlanilla.Enabled := false;
  PInforme.Align := alClient;

  IAceptarEstab.OnClick := AceptarSelRepRepClick;
  LAceptarEstab.OnClick := AceptarSelRepRepClick;

  IInforme.Visible := false;
  LInforme.Visible := false;
  LexpExcel.Visible := false;
  LexpExcel.Visible := false;
  IInforme.OnClick := VerInformeClick;
  LInforme.OnClick := VerInformeClick;
  LSiguiente.Visible := true;
  ISiguiente.Visible := true;
  LSiguiente.OnClick := SiguienteRepClick;
  ISiguiente.OnClick := SiguienteRepClick;
  LVolver.OnClick := VolverDeRepClick;
  IVolver.OnClick := VolverDeRepClick;

  LCancelar.Caption := 'Salir';
  LCancelar.OnClick := BSalirReporteClick;
  ICancelar.OnClick := BSalirReporteClick;
  Pagina := 5;
end;

procedure TFEducacionContinua.SiguienteRepClick(Sender : TObject);
begin
  PInforme.Visible := true;
  PEstablecimientosExistentes.Visible := false;
  PInforme.BringToFront;
  LSiguiente.Visible := false;
  ISiguiente.Visible := false;
  LInforme.Visible := true;
  IInforme.Visible := true;
  IExpExcel.Visible := false;
  LexpExcel.Visible := false;
  ISacarAnimal.Visible := false;
  LElimAnimal.Visible := false;
  LVolver.Visible := true;
  IVolver.Visible := true;
  LInforme.Caption := 'Vista Previa';
end;

procedure TFEducacionContinua.VolverDeRepClick(Sender : TObject);
begin
  PInforme.Visible := false;
  PEstablecimientosExistentes.Visible := true;
  PEstablecimientosExistentes.BringToFront;
  ISiguiente.Visible := true;
  LSiguiente.Visible := true;
  IVolver.Visible := false;
  LVolver.Visible := false;
  IInforme.Visible := false;
  LInforme.Visible := false;
  LexpExcel.Visible := false;
  IExpExcel.Visible := false;
  ISacarAnimal.Visible := false;
  LElimAnimal.Visible := false;
end;

procedure TFEducacionContinua.BHistorialClick(Sender : TObject);
begin
  PInformes.Visible := true;
  PInformes.Align := alClient;
  PInformes.BringToFront;
  SLVInformes.Root := ExtractFilePath(Application.ExeName)+'Informes\Gestacion';
  SLVInformes.Align := alLeft;
  //AcroPDF.Align := alClient;
end;

procedure TFEducacionContinua.BVovlerdeinforClick(Sender: TObject);
begin
  inherited;
  PInformes.Visible := false;
  PInformes.SendToBack;
end;

procedure TFEducacionContinua.BSiguienteClick(Sender: TObject);
begin
  inherited;
  seleccion := false;
  if Pagina = 1 then
  begin
    PDatos.Visible := false;
    PDatosEvento.Visible := true;
    PDatosEvento.Align := alClient;
    LVolver.Visible := true;
    IVolver.Visible := true;
    Pagina := 2;
  end
  else
  begin
    if Pagina = 2 then
    begin
      LSiguiente.Visible := false;
      ISiguiente.Visible := false;
      IVolver.Visible := true;
      LVolver.Visible := true;

      IInforme.Visible := true;
      LInforme.Visible := true;
      PDatosGral.Visible := false;
      LexpExcel.Visible := true;
      IExpExcel.Visible := true;
      ISacarAnimal.Visible := true;
      LElimAnimal.Visible := true;
      CargarDatosGenerales;

      PExcel.Visible := true;
      TSavePlanilla.Enabled := true;
      PExcel.Align := alClient;

      //SSExcel.Align := alClient;
      //SSExcel.SetFocus;
      SGPlanilla.Align := alClient;
      SGPlanilla.SetFocus;
      Pagina := 3;
    end;
  end;
end;

procedure TFEducacionContinua.CBRodeosChange(Sender: TObject);
begin
  inherited;
  if CBRodeos.Text = '(TODOS)' then
    CBRodeos.Text := 'RODEO';
  CargarValorDatosPorCond;
  CargarValorDatosPorCron;
  ArmarSeries;
  CalcularBrucelosis;
end;

procedure TFEducacionContinua.CBCategoriaChange(Sender: TObject);
begin
  inherited;
  if CBCategoria.Text = '(TODAS)' then
    CBCategoria.Text := 'CATEGORIA';
  CargarValorDatosPorCond;
  CargarValorDatosPorCron;
  ArmarSeries;
  CalcularBrucelosis;
end;

procedure TFEducacionContinua.DTPDesdeChange(Sender: TObject);
begin
  inherited;
  CargarValorDatosPorCond;
  CargarValorDatosPorCron;
  ArmarSeries;
  CalcularBrucelosis;
end;

procedure TFEducacionContinua.DTPHastaChange(Sender: TObject);
begin
  inherited;
  CargarValorDatosPorCond;
  CargarValorDatosPorCron;
  ArmarSeries;
  CalcularBrucelosis;
end;

procedure TFEducacionContinua.SLVInformesClick(Sender: TObject);
begin
  inherited;
  //AcroPDF.src := SLVInformes.Folders[SLVInformes.ItemIndex].PathName;
end;

function TFEducacionContinua.CargarBanda(F : TFREPInfoGralGestPreview) : Boolean;
begin

end;

procedure TFEducacionContinua.BCancelarClick(Sender: TObject);
begin
  inherited;
  if (PInforme.Visible = true) or (PDatosGral.Visible = true) then
     close
  else
     if(MostrarMensaje(tmConsulta,'¿Desea salir de Diagnóstico de Gestación?(Se perderán los datos cargados en esta planilla)') = mrYes) then
          Close;
end;

procedure TFEducacionContinua.CBRodeosCloseUp(Sender: TObject);
begin
  inherited;
  if CBRodeos.Text = '(TODOS)' then
    CBRodeos.Text := 'RODEO';
end;

procedure TFEducacionContinua.CBCategoriaCloseUp(Sender: TObject);
begin
  inherited;
  if CBCategoria.Text = '(TODAS)' then
    CBCategoria.Text := 'CATEGORIA';
end;

function TFEducacionContinua.PerteneceAEstab(Arch : String) : Boolean;
begin
  Result := false;
  IBQReportes.First;
  while not IBQReportes.Eof do
  begin
    if Arch = IBQReportes.FieldByName('archivo').AsString then
      Result := true;
    IBQReportes.Next;
  end;
end;

procedure TFEducacionContinua.RecorrerDirectorio(Directorio : String);
var
  sr : TSearchRec;
  ind : Integer;
  E : String;
begin
  if FindFirst(Directorio + '*.*',faAnyFile, sr) = 0 then
  repeat
    E := ExtractFileExt(sr.Name);
    if (UpperCase(e) = '.CSV') then
    begin
      if PerteneceAEstab(Directorio+sr.Name) then
        CargarAnimales(Directorio+sr.Name,2);
    end;
  until FindNext(sr) <> 0;
  FindClose(sr);
end;

procedure TFEducacionContinua.CargarTodasLasPlanillas(Arch : String);
begin


end;

procedure TFEducacionContinua.BSalirReporteClick(Sender : TObject);
begin
  Close;
end;

procedure TFEducacionContinua.FormShow(Sender: TObject);
begin
  inherited;
  DTPFecha.Date := Today();
  DTPFinServ.Date := IncMonth(Date(),-2);
  DTPIniServ.Date := IncMonth(Date(),-5);
  IBQEstabsEC.Close;
  IBQEstabsEC.Open;
  IBQEstabsEC.Last;
  IBQEstabsEC.First;
  LCantEstab.Caption := 'Cantidad de Establecimientos: '+IntToStr(IBQEstabsEC.RecordCount);
  tipo_CC := 1; //9
  case Ingreso of
    1 : BDiagnostico.Click;
    2 : JvIDiagnosticoRepClick(nil);
  end;
end;

procedure TFEducacionContinua.SSExcelEditing(Sender: TcxSSBookSheet;
  const ACol, ARow: Integer; var CanEdit: Boolean);
begin
  inherited;

  CanEdit := (ARow > 1) and (ACol > 0);
  C := ACol;
  F := ARow;
  Mdescx.Visible := false;
  case ACol of
    2 : begin
          Mdescx.Visible := true;
          Mdescx.Lines.Clear;
          Mdescx.Lines.Add(' Fecha: ');
          Mdescx.Lines.Add('    dd/mm/aaaa');
        end;
    3 : begin
          Mdescx.Visible := true;
          Mdescx.Lines.Clear;
          Mdescx.Lines.Add(' Categoría: ');
          Mdescx.Lines.Add('    VACA o VAQUILLONA');
        end;
    4 : begin
          Mdescx.Visible := true;
          Mdescx.Lines.Clear;
          Mdescx.Lines.Add(' Estado Reproductivo: ');
          Mdescx.Lines.Add('    CABEZA, CUERPO, COLA, VACIA o INSEMINACION');
        end;
    5 : begin
          Mdescx.Visible := true;
          Mdescx.Lines.Clear;
          Mdescx.Lines.Add(' Cronología Dentaria: ');
          Mdescx.Lines.Add('    NN (NO DEFINIDO), DL (DIENTE DE LECHE), 2D (2 DIENTES), 4D (4 DIENTES), 6D (6 DIENTES)');
          Mdescx.Lines.Add('    BL (BOCA LLENA), TD (TRES CUARTOS DIENTE), MD (MEDIO DIENTE), CD (CUARTO DIENTE) o SD (SIN DIENTE)');
        end;
     6 : begin
          Mdescx.Visible := true;
          Mdescx.Lines.Clear;
          Mdescx.Lines.Add(' Condición Corporal: ');
          if tipo_CC = 1 then
            Mdescx.Lines.Add('    1, 2, 3, 4, 5, 6, 7, 8 o 9')
          else
            Mdescx.Lines.Add('    1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5 o 5');
        end;
     7 : begin
          Mdescx.Visible := true;
          Mdescx.Lines.Clear;
          Mdescx.Lines.Add(' Sangrado: ');
          Mdescx.Lines.Add('    NO DEFINIDO, NEGATIVO, POSITIVO o SOSPECHOSO');
        end;

  end;
end;

procedure TFEducacionContinua.SSExcelEndEdit(Sender: TObject);
var
  d : TDateTime;
begin
  inherited;
  if Trim(SSExcel.Sheet.GetCellObject(C,F).DisplayText) <> '' then
  begin
  case C of
    2 : begin
          if not TryStrToDate(UpperCase(Trim(SSExcel.Sheet.GetCellObject(C,F).DisplayText)),d) then
          begin
            MostrarMensaje(tmError,'La fecha esta mal escrita el formato es dd/mm/aaaa');
            SSExcel.Sheet.GetCellObject(C,F).Text := '';
            SSExcel.Sheet.SelectCell(C,F,false);
          end;
        end;
    3 : begin
          if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(C,F).DisplayText)) <> 'VACA') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(C,F).DisplayText)) <> 'VAQUILLONA') then
          begin
            MostrarMensaje(tmError,'La categoria debe ser VACA o VAQUILLONA');
            SSExcel.Sheet.GetCellObject(C,F).Text := '';
            SSExcel.Sheet.SelectCell(C,F,false);
          end;
        end;
    7 : begin
          if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'VACIA') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'CABEZA')
            and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'CUERPO') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'COLA')
            and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'INSEMINACION') then
          begin
            MostrarMensaje(tmError,'El Estado Reproductivo debe ser CABEZA, CUERPO, COLA, VACIA o INSEMINACION');
            SSExcel.Sheet.GetCellObject(C,F).Text := '';
            SSExcel.Sheet.SelectCell(C,F,false);
          end;
        end;
     5 : begin
          if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'NN') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '2D')
            and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '4D') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '6D')
            and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'BL') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'TD')
            and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'MD') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'DL')
            and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'CD') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'SD')
            and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '') then
          begin
            MostrarMensaje(tmError,'La Cronología Dentaria debe ser NN, DL, 2D, 4D, 6D, BL, TD, MD, CD o SD');
            SSExcel.Sheet.GetCellObject(C,F).Text := '';
            SSExcel.Sheet.SelectCell(C,F,false);
          end;
        end;
     6 : begin
          if tipo_CC = 1 then
              begin
                if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '1') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '2')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '3') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '4')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '5') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '6')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '7') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '8')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '9') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '') then
                begin
                  MostrarMensaje(tmError,'La Condición Corporal debe ser de 1 a 9');
                  SSExcel.Sheet.GetCellObject(C,F).Text := '';
                  SSExcel.Sheet.SelectCell(C,F,false);
                end;
              end
              else
              begin
                if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '1') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '1,5')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '2') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '2,5')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '3') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '3,5')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '4') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '4,5')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '5') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '') then
                begin
                  MostrarMensaje(tmError,'La Condición Corporal debe ser de 1 a 5');
                  SSExcel.Sheet.GetCellObject(C,F).Text := '';
                  SSExcel.Sheet.SelectCell(C,F,false);
                end;
              end;
        end;
     8 : begin
          if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'NO DEFINIDO') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'NEGATIVO')
            and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'POSITIVO') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'SOSPECHOSO')
            and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '') then
          begin
            MostrarMensaje(tmError,'El Sangrado debe ser NO DEFINIDO, NEGATIVO, POSITIVO o SOSPECHOSO');
            SSExcel.Sheet.GetCellObject(C,F).Text := '';
            SSExcel.Sheet.SelectCell(C,F,false);
          end;
        end;
  end;
  end;
end;

function TFEducacionContinua.VerificarPlanilla : Boolean;
var
  C,F : Integer;
  ColNombre : String;
  CronDentaria: String;
  celda : TCelda;
  d : TDateTime;
begin
  Result := true;
  {for C := 0 to SSExcel.Sheet.ColumnCount-1 do
  begin
    F := 2;
    case C of
      2 : begin   //Fecha
            ColNombre := 'Fecha';
            while SSExcel.Sheet.GetCellObject(1,f).DisplayText <> '' do
            begin
              if not TryStrToDate(UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).DisplayText)),d) then
              begin
                celda := TCelda.Create(C,F);
                LBErrores.AddItem('Error de código en la columna: '+IntToStr(c+1)+ ', fila: '+IntToStr(f+1)+'. Causa del error: ('+SSExcel.Sheet.GetCellObject(c,f).Text+')',celda);
                Result := false;
              end;
              Inc(f);
            end;
          end;
      3 : begin  //Categoria
            ColNombre := 'Categoría';
            while SSExcel.Sheet.GetCellObject(1,f).DisplayText <> '' do
            begin
              if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'VACA') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'VAQUILLONA') then
              begin
                celda := TCelda.Create(C,F);
                LBErrores.AddItem('Error de código en la columna: '+IntToStr(c+1)+ ', fila: '+IntToStr(f+1)+'. Causa del error: ('+SSExcel.Sheet.GetCellObject(c,f).Text+')',celda);
                Result := false;
              end;
              Inc(F);
            end;
          end;
      7 : begin  //Est Rep
            ColNombre := 'Estado Reproductivo';
            while SSExcel.Sheet.GetCellObject(1,f).DisplayText <> '' do
            begin
              if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'VACIA') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'CABEZA')
                  and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'CUERPO') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'COLA')
                  and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'INSEMINACION') then
              begin
                celda := TCelda.Create(C,F);
                LBErrores.AddItem('Error de código en la columna: '+IntToStr(c+1)+ ', fila: '+IntToStr(f+1)+'. Causa del error: ('+SSExcel.Sheet.GetCellObject(c,f).Text+')',celda);
                Result := false;
              end;
              Inc(F);
            end;
          end;
      5 : begin  //Cron Dent
            ColNombre := 'Cronología Dentaria';
            while SSExcel.Sheet.GetCellObject(1,f).DisplayText <> '' do
            begin
              if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'NN') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '2D')
                  and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '4D') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '6D')
                  and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'BL') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'TD')
                  and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'MD') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'DL')
                  and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'CD') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'SD')
                  and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '') then
              begin
                celda := TCelda.Create(C,F);
                LBErrores.AddItem('Error de código en la columna: '+IntToStr(c+1)+ ', fila: '+IntToStr(f+1)+'. Causa del error: ('+SSExcel.Sheet.GetCellObject(c,f).Text+')',celda);
                Result := false;
              end;
              Inc(F);
            end;
          end;
      6 : begin  //Cond Corp
            ColNombre := 'Condicion Corporal';
            while SSExcel.Sheet.GetCellObject(1,f).DisplayText <> '' do
            begin
              if tipo_CC = 1 then
              begin
                if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '1') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '2')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '3') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '4')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '5') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '6')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '7') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '8')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '9') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '') then
                begin
                  celda := TCelda.Create(C,F);
                  LBErrores.AddItem('Error de código en la columna: '+IntToStr(c+1)+ ', fila: '+IntToStr(f+1)+'. Causa del error: ('+SSExcel.Sheet.GetCellObject(c,f).Text+')',celda);
                  Result := false;
                end;
              end
              else
              begin
                if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '1') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '1,5')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '2') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '2,5')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '3') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '3,5')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '4') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '4,5')
                    and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '5') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '') then
                begin
                  celda := TCelda.Create(C,F);
                  LBErrores.AddItem('Error de código en la columna: '+IntToStr(c+1)+ ', fila: '+IntToStr(f+1)+'. Causa del error: ('+SSExcel.Sheet.GetCellObject(c,f).Text+')',celda);
                  Result := false;
                end;
              end;
              Inc(F);
            end;
          end;
      8 : begin  //Sangrado
            ColNombre := 'Sangrado';
            while SSExcel.Sheet.GetCellObject(1,f).DisplayText <> '' do
            begin
              if (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'NO DEFINIDO') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'NEGATIVO')
                  and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'POSITIVO') and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> 'SOSPECHOSO')
                  and (UpperCase(Trim(SSExcel.Sheet.GetCellObject(c,f).Text)) <> '') then
              begin
                celda := TCelda.Create(C,F);
                LBErrores.AddItem('Error de código en la columna: '+IntToStr(c+1)+ ', fila: '+IntToStr(f+1)+'. Causa del error: ('+SSExcel.Sheet.GetCellObject(c,f).Text+')',celda);
                Result := false;
              end;
              Inc(F);
            end;
          end;
      end;

  end; }
  C := 1;
  LBErrores.Clear;
  while SGPlanilla.Cells[C,0] <> '' do
  begin
    F := 1;
    case C of
      2 : begin   //Fecha
            ColNombre := 'Fecha';
            while SGPlanilla.Cells[1,F] <> '' do
            begin
              if not TryStrToDate(UpperCase(Trim(SGPlanilla.Cells[C,F])),d) then
              begin
                celda := TCelda.Create(C,F);
                LBErrores.AddItem('Error de código en la columna: '+IntToStr(c)+ ', fila: '+IntToStr(f)+'. Causa del error: La fecha está mal escrita ('+SGPlanilla.Cells[C,F]+')',celda);
                Result := false;
              end;
              Inc(f);
            end;
          end;
      3 : begin  //Categoria
            ColNombre := 'Categoría';
            while SGPlanilla.Cells[1,F] <> '' do
            begin
              if (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'VACA') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'VAQUILLONA') then
              begin
                celda := TCelda.Create(C,F);
                LBErrores.AddItem('Error de código en la columna: '+IntToStr(c)+ ', fila: '+IntToStr(f)+'. Causa del error: La categoría no es correcta ('+SGPlanilla.Cells[C,F]+')',celda);
                Result := false;
              end;
              Inc(F);
            end;
          end;
      7 : begin  //Est Rep
            ColNombre := 'Estado Reproductivo';
            while SGPlanilla.Cells[1,F] <> '' do
            begin
              if (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'VACIA') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'CABEZA')
                  and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'CUERPO') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'COLA')
                  and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'INSEMINACION') then
              begin
                celda := TCelda.Create(C,F);
                LBErrores.AddItem('Error de código en la columna: '+IntToStr(c)+ ', fila: '+IntToStr(f)+'. Causa del error: El estado reproductivo no es correcto ('+SGPlanilla.Cells[C,F]+')',celda);
                Result := false;
              end;
              Inc(F);
            end;
          end;
      5 : begin  //Cron Dent
            ColNombre := 'Cronología Dentaria';
            CronDentaria := UpperCase(Trim(SGPlanilla.Cells[C,F]));
            while SGPlanilla.Cells[1,F] <> '' do
            begin
              if ((CronDentaria <> 'NN') and (CronDentaria <> 'NO DEFINIDO'))
                  and ((CronDentaria <> '2D') and (CronDentaria <> '2 DIENTES'))
                  and ((CronDentaria <> '4D') and (CronDentaria <> '4 DIENTES'))
                  and ((CronDentaria <> '6D') and (CronDentaria <> '6 DIENTES'))
                  and ((CronDentaria <> 'BL') and (CronDentaria <> 'BOCA LLENA'))
                  and ((CronDentaria <> 'TD') and (CronDentaria <> 'TRES CUARTOS DIENTE'))
                  and ((CronDentaria <> 'MD') and (CronDentaria <> 'MEDIO DIENTE'))
                  and ((CronDentaria <> 'DL') and (CronDentaria <> 'DIENTE DE LECHE'))
                  and ((CronDentaria <> 'CD') and (CronDentaria <> 'CUARTO DIENTE'))
                  and ((CronDentaria <> 'SD') and (CronDentaria <> 'SIN DIENTE'))
                  and (CronDentaria <> '') then
              begin
                celda := TCelda.Create(C,F);
                LBErrores.AddItem('Error de código en la columna: '+IntToStr(c)+ ', fila: '+IntToStr(f)+'. Causa del error: La cronología dentaria no es correcta ('+SGPlanilla.Cells[C,F]+')',celda);
                Result := false;
              end;
              Inc(F);
            end;
          end;
      6 : begin  //Cond Corp
            ColNombre := 'Condicion Corporal';
            while SGPlanilla.Cells[1,F] <> '' do
            begin
              if tipo_CC = 1 then
              begin
                if (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '1') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '2')
                    and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '3') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '4')
                    and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '5') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '6')
                    and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '7') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '8')
                    and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '9') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '') then
                begin
                  celda := TCelda.Create(C,F);
                  LBErrores.AddItem('Error de código en la columna: '+IntToStr(c)+ ', fila: '+IntToStr(f)+'. Causa del error: La condición corporal no es correcta ('+SGPlanilla.Cells[C,F]+')',celda);
                  Result := false;
                end;
              end
              else
              begin
                if (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '1') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '1,5')
                    and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '2') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '2,5')
                    and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '3') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '3,5')
                    and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '4') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '4,5')
                    and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '5') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '') then
                begin
                  celda := TCelda.Create(C,F);
                  LBErrores.AddItem('Error de código en la columna: '+IntToStr(c)+ ', fila: '+IntToStr(f)+'. Causa del error: La condición corporal no es correcta ('+SGPlanilla.Cells[C,F]+')',celda);
                  Result := false;
                end;
              end;
              Inc(F);
            end;
          end;
      8 : begin  //Sangrado
            ColNombre := 'Sangrado';
            while SGPlanilla.Cells[1,F] <> '' do
            begin
              if (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'NO DEFINIDO') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'NEGATIVO')
                  and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'POSITIVO') and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> 'SOSPECHOSO')
                  and (UpperCase(Trim(SGPlanilla.Cells[C,F])) <> '') then
              begin
                celda := TCelda.Create(C,F);
                LBErrores.AddItem('Error de código en la columna: '+IntToStr(c)+ ', fila: '+IntToStr(f)+'. Causa del error: El sangrado no es correcto ('+SGPlanilla.Cells[C,F]+')',celda);
                Result := false;
              end;
              Inc(F);
            end;
          end;
      end;
      Inc(C);
  end;
end;

procedure TFEducacionContinua.LBErroresClick(Sender: TObject);
var
  celda: TCelda;
begin
  inherited;
  if (LBErrores.ItemIndex <> -1) then
  begin
    celda := TCelda(LBErrores.Items.Objects[LBErrores.ItemIndex]);
    seleccionarCelda(celda.getCol(),celda.getFil());
  end;
end;

procedure TFEducacionContinua.IEstabNuevoClick(Sender: TObject);
begin
  inherited;
  PEstablecimiento.Visible := false;
  PDatos.Visible := true;
  PDatos.Align := alClient;
  id_estable := -1;
  if not IBQEstabsEC.IsEmpty then
  begin
    IBQEstabsEC.First;
    while not IBQEstabsEC.Eof do
    begin
      if IBQEstabsEC.FieldByName('veterinario').Value <> null then
        break;
      IBQEstabsEC.Next;
    end;
    if IBQEstabsEC.FieldValues['veterinario'] <> null then
      EVeterinario.Text := IBQEstabsEC.FieldValues['veterinario'];
    if IBQEstabsEC.FieldValues['direccion'] <> null then
      EDireccion.Text := IBQEstabsEC.FieldValues['direccion'];
    if IBQEstabsEC.FieldValues['telefono'] <> null then
      ETElefono.Text := IBQEstabsEC.FieldValues['telefono'];
    if IBQEstabsEC.FieldValues['mail'] <> null then
      EMail.Text := IBQEstabsEC.FieldValues['mail'];
    if IBQEstabsEC.FieldValues['web'] <> null then
      EWeb.Text := IBQEstabsEC.FieldValues['web'];
  end;
end;

procedure TFEducacionContinua.CargarEstab;
begin
  if IBQEstabsEC.FieldValues['nombre'] <> null then
    EEstablecimiento.Text := IBQEstabsEC.FieldValues['nombre'];
  if IBQEstabsEC.FieldValues['renspa'] <> null then
    ERENSPA.Text := IBQEstabsEC.FieldValues['renspa'];
  if IBQEstabsEC.FieldValues['propietario'] <> null then
    EPropietario.Text := IBQEstabsEC.FieldValues['propietario'];
  if IBQEstabsEC.FieldValues['veterinario'] <> null then
    EVeterinario.Text := IBQEstabsEC.FieldValues['veterinario'];
  if IBQEstabsEC.FieldValues['direccion'] <> null then
    EDireccion.Text := IBQEstabsEC.FieldValues['direccion'];
  if IBQEstabsEC.FieldValues['telefono'] <> null then
    ETElefono.Text := IBQEstabsEC.FieldValues['telefono'];
  if IBQEstabsEC.FieldValues['mail'] <> null then
    EMail.Text := IBQEstabsEC.FieldValues['mail'];
  if IBQEstabsEC.FieldValues['web'] <> null then
    EWeb.Text := IBQEstabsEC.FieldValues['web'];
end;

procedure TFEducacionContinua.IAceptarEstabClick(Sender: TObject);
begin
  inherited;
  PEstablecimientosExistentes.Visible := false;
  CargarEstab;
  PDatos.Visible := true;
  PDatos.Align := alClient;
  LSiguiente.Visible := true;
  ISiguiente.Visible := true;
end;

procedure TFEducacionContinua.DBGEstablecimientosCellClick(
  Column: TColumn);
begin
  inherited;
  id_estable := IBQEstabsEC.FieldValues['id_estab'];
end;

procedure TFEducacionContinua.ICancelarEstabClick(Sender: TObject);
begin
  inherited;
  PEstablecimientosExistentes.Visible := false;
  PDatos.Visible := true;
  PDatos.Align := alClient;
  LSiguiente.Visible := true;
  ISiguiente.Visible := true;
end;

procedure TFEducacionContinua.ISelEstabClick(Sender: TObject);
begin
  inherited;
  PEstablecimientosExistentes.Visible := true;
  PEstablecimiento.Visible := false;
  PEstablecimientosExistentes.Align := alClient;
end;

procedure TFEducacionContinua.CargarDatosGenerales;
var
  cant, I : Integer;
begin
  if TryStrToInt(EcantAC.Text,cant) then
  begin
    for I := 1 to cant do
    begin

      {if (CBCategAC.ItemIndex > -1) and (SSExcel.Sheet.GetCellObject(3,I).Text = '') then
        SSExcel.Sheet.GetCellObject(3,I).Text := CBCategAC.Text;
      if (ERazaAC.Text <> '') and (SSExcel.Sheet.GetCellObject(4,I).Text = '') then
        SSExcel.Sheet.GetCellObject(4,I).Text := ERazaAC.Text;
      if (CBEstadoAC.ItemIndex > -1) and (SSExcel.Sheet.GetCellObject(7,I).Text = '') then
        SSExcel.Sheet.GetCellObject(7,I).Text := CBEstadoAC.Text;
      if (CBCronDentAC.ItemIndex > -1) and (SSExcel.Sheet.GetCellObject(5,I).Text = '') then
        SSExcel.Sheet.GetCellObject(5,I).Text := CBCronDentAC.Text;
      if (CBCCAC.ItemIndex > -1) and (SSExcel.Sheet.GetCellObject(6,I).Text = '') then
        SSExcel.Sheet.GetCellObject(6,I).Text := CBCCAC.Text;
      if (CBSangradoAC.ItemIndex > -1) and (SSExcel.Sheet.GetCellObject(8,I).Text = '') then
        SSExcel.Sheet.GetCellObject(8,I).Text := CBSangradoAC.Text;
      if (ErodeoAC.Text <> '') and (SSExcel.Sheet.GetCellObject(9,I).Text = '') then
        SSExcel.Sheet.GetCellObject(9,I).Text := ErodeoAC.Text;

      if (SSExcel.Sheet.GetCellObject(2,I).Text = '') then
        SSExcel.Sheet.GetCellObject(2,I).Text := DateToStr(DTPFecha.Date);

      if (SSExcel.Sheet.GetCellObject(1,I).Text = '') then
        SSExcel.Sheet.GetCellObject(1,I).Text := IntToStr(I-1);      }

     if (CBCategAC.ItemIndex > -1) and (SGPlanilla.Cells[3,I] = '') then
        SGPlanilla.Cells[3,I] := CBCategAC.Text;
      if (ERazaAC.Text <> '') and (SGPlanilla.Cells[4,I]  = '') then
        SGPlanilla.Cells[4,I] := ERazaAC.Text;
      if (CBEstadoAC.ItemIndex > -1) and (SGPlanilla.Cells[7,I] = '') then
        SGPlanilla.Cells[7,I]  := CBEstadoAC.Text;
      if (CBCronDentAC.ItemIndex > -1) and (SGPlanilla.Cells[5,I]  = '') then
        SGPlanilla.Cells[5,I]  := CBCronDentAC.Text;
      if (CBCCAC.ItemIndex > -1) and (SGPlanilla.Cells[6,I]  = '') then
        SGPlanilla.Cells[6,I]  := CBCCAC.Text;
      if (CBSangradoAC.ItemIndex > -1) and (SGPlanilla.Cells[8,I]  = '') then
        SGPlanilla.Cells[8,I]  := CBSangradoAC.Text;
      if (ErodeoAC.Text <> '') and (SGPlanilla.Cells[9,I]  = '') then
        SGPlanilla.Cells[9,I]  := ErodeoAC.Text; 
      if (ErodeoAC.Text <> '')  then
        SGPlanilla.Cells[9,I]  := ErodeoAC.Text;

      if (SGPlanilla.Cells[2,I]  = '') then
        SGPlanilla.Cells[2,I]  := DateToStr(DTPFecha.Date);

      if (SGPlanilla.Cells[1,I]  = '') then
        SGPlanilla.Cells[1,I]  := IntToStr(I);


    end;
  end;
end;

procedure TFEducacionContinua.CargarCC;
begin
  CBCCAC.Items.Clear;
  if RBCC5.Checked then
  begin
    tipo_CC := 2;
    CBCCAC.Items.Add('1');
    CBCCAC.Items.Add('1,5');
    CBCCAC.Items.Add('2');
    CBCCAC.Items.Add('2,5');
    CBCCAC.Items.Add('3');
    CBCCAC.Items.Add('3,5');
    CBCCAC.Items.Add('4');
    CBCCAC.Items.Add('4,5');
    CBCCAC.Items.Add('5');
  end;
  if RBCC9.Checked then
  begin
    tipo_CC := 1;
    CBCCAC.Items.Add('1');
    CBCCAC.Items.Add('2');
    CBCCAC.Items.Add('3');
    CBCCAC.Items.Add('4');
    CBCCAC.Items.Add('5');
    CBCCAC.Items.Add('6');
    CBCCAC.Items.Add('7');
    CBCCAC.Items.Add('8');
    CBCCAC.Items.Add('9');
  end;
end;

procedure TFEducacionContinua.RBCC5Click(Sender: TObject);
begin
  inherited;
  CargarCC;
end;

procedure TFEducacionContinua.RBCC9Click(Sender: TObject);
begin
  inherited;
  CargarCC;
end;

procedure TFEducacionContinua.DBCCondPrenezPreniadasBeforeDrawAxes(
  Sender: TObject);
begin
  inherited;
  ind_garcifo := 14;
end;

procedure TFEducacionContinua.DBCCondPrenezPreniadasGetAxisLabel(
  Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
  var LabelText: String);
begin
  inherited;
  if ((Sender.Horizontal) and (ind_garcifo<>-1)) then
  begin
    if ind_garcifo <> 12 then
      LabelText := SGTablaCron.Cells[ind_garcifo,0]
    else
      LabelText := '-';
    Dec(ind_garcifo);
  end;
end;

procedure TFEducacionContinua.DBCCronPreniezVaciasGetAxisLabel(
  Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
  var LabelText: String);
begin
  inherited;
  if ((Sender.Horizontal) and (ind_garcifo<>-1)) then
  begin
    if ind_garcifo <> 12 then
      LabelText := SGTablaCond.Cells[ind_garcifo,0]
    else
      LabelText := '-';
    Dec(ind_garcifo);
  end;
end;

procedure TFEducacionContinua.IEliminarEstabClick(Sender: TObject);
begin
  inherited;
  if id_estable <> -1 then
  begin
    try
      IBQEstabsEC.Delete;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
     FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
    IBQEstabsEC.Close;
    IBQEstabsEC.Open;
    IBQEstabsEC.Last;
    IBQEstabsEC.First;
    LCantEstab.Caption := 'Cantidad de Establecimientos: '+intToStr(IBQEstabsEC.RecordCount);
  end;
end;

procedure TFEducacionContinua.DBGEstablecimientosDblClick(Sender: TObject);
begin
  inherited;
  if Pagina <> 5 then
    IAceptarEstabClick(nil)
  else
    AceptarSelRepRepClick(nil);

end;


///////////////////////////////////////////maenjo tipo Excel/////////////////////

procedure TFEducacionContinua.SGPlanillaSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
  F,C : Integer;
begin
  if (ACol > 0) and (ARow > 0) then
  begin
    FilSel := ARow;
    ColSel := ACol;
    seleccion := true;
    for C := 0 to MAX_COLUMNA do
      for F := 0 to MAX_FILA do
        Grilla[C,F] := false;
    Grilla[ColSel,FilSel] := true;
    Grilla[0,FilSel] := true;
    Grilla[ColSel,0] := true;
    SGPlanilla.Repaint;


    CanSelect := (ARow > 0) and (ACol > 0);
    C := ACol;
    F := ARow;
    Mdescx.Visible := false;
    case ACol of
      2 : begin
            Mdescx.Visible := true;
            Mdescx.Lines.Clear;
            Mdescx.Lines.Add(' Fecha: ');
            Mdescx.Lines.Add('    dd/mm/aaaa');
          end;
      3 : begin
            Mdescx.Visible := true;
            Mdescx.Lines.Clear;
            Mdescx.Lines.Add(' Categoría: ');
            Mdescx.Lines.Add('    VACA o VAQUILLONA');
          end;
      {4 : begin
            Mdescx.Visible := true;
            Mdescx.Lines.Clear;
            Mdescx.Lines.Add(' Estado Reproductivo: ');
            Mdescx.Lines.Add('    CABEZA, CUERPO, COLA, VACIA o INSEMINACION');
          end;}
      5 : begin
            Mdescx.Visible := true;
            Mdescx.Lines.Clear;
            Mdescx.Lines.Add(' Cronología Dentaria: ');
            Mdescx.Lines.Add('    NN (NO DEFINIDO), DL (DIENTE DE LECHE), 2D (2 DIENTES), 4D (4 DIENTES), 6D (6 DIENTES)');
            Mdescx.Lines.Add('    BL (BOCA LLENA), TD (TRES CUARTOS DIENTE), MD (MEDIO DIENTE), CD (CUARTO DIENTE) o SD (SIN DIENTE)');
          end;
       6 : begin
            Mdescx.Visible := true;
            Mdescx.Lines.Clear;
            Mdescx.Lines.Add(' Condición Corporal: ');
            if tipo_CC = 1 then
              Mdescx.Lines.Add('    1, 2, 3, 4, 5, 6, 7, 8 o 9')
            else
              Mdescx.Lines.Add('    1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5 o 5');
          end;
       7 : begin
            Mdescx.Visible := true;
            Mdescx.Lines.Clear;
            Mdescx.Lines.Add(' Estado Reproductivo: ');
            Mdescx.Lines.Add('    CABEZA, CUERPO, COLA, VACIA o INSEMINACION');
          end;
       8 : begin
            Mdescx.Visible := true;
            Mdescx.Lines.Clear;
            Mdescx.Lines.Add(' Sangrado: ');
            Mdescx.Lines.Add('    NO DEFINIDO, NEGATIVO, POSITIVO o SOSPECHOSO');
          end;

    end;

  end;
end;

procedure TFEducacionContinua.InicBordes;
var
  I : Integer;                                                                           
  TS : TStringList;
begin
  for I := 1 to SGPlanilla.RowCount-1 do
    SGPlanilla.Cells[0,I] := intToStr(I);
  SGPlanilla.Cells[1,0] := 'Caravana';
  SGPlanilla.Cells[2,0] := 'Fecha de Tacto';
  SGPlanilla.Cells[3,0] := 'Categoría';
  SGPlanilla.Cells[4,0] := 'Raza';
  SGPlanilla.Cells[5,0] := 'Cron. Dent';
  SGPlanilla.Cells[6,0] := 'Cond. Corp.';
  SGPlanilla.Cells[7,0] := 'Estado Reproductivo';
  SGPlanilla.Cells[8,0] := 'Sangrado';
  SGPlanilla.Cells[9,0] := 'Rodeo';
  SGPlanilla.Cells[10,0] := 'Observación';
  for I := 1 to 10 do
    SGPlanilla.ColWidths[I] :=  SGPlanilla.Canvas.TextWidth(SGPlanilla.Cells[I,0])+30;

  TS := TStringList.Create;
  TS.Insert(0,'CABEZA');
  TS.Insert(1,'CUERPO');
  TS.Insert(2,'COLA');

end;

procedure TFEducacionContinua.SGPlanillaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 { if (SGPlanilla.Col > 0) and (SGPlanilla.Row > 0) then
  begin
    InicioArrastrCol := SGPlanilla.Col;
    InicioArrastreF := SGPlanilla.Row;
    FilW := InicioArrastreF;
    ColW := InicioArrastrCol;
    if ssLeft in Shift then
      SGPlanilla.Cursor := crCross;
    Application.ProcessMessages;
  end;    }
end;

procedure TFEducacionContinua.SGPlanillaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  A, B : Integer;
begin
  if ssLeft in Shift then
  begin
    SGPlanilla.MouseToCell(X,Y,A,B);
    SGPlanilla.ActivateCell(A,B);
    Grilla[A,B] := not Grilla[A,B];
    Grilla[0,B] := not Grilla[0,B];
    Grilla[A,0] := not Grilla[A,0];
    if SGPlanilla.Cells[1,B] <> '' then
    begin
      if (A = InicioArrastrCol) and (B <> FilW) then
      begin
        {if (SGPlanilla.Cells[A,B] = '') then
        begin}
          case A of
            1 : begin
                  if ValorPrimeroInt <> -1 then
                  begin
                    Inc(ValorPrimeroInt);
                    SGPlanilla.Cells[A,B] := IntToStr(ValorPrimeroInt);
                  end
                  else
                  begin
                    SGPlanilla.Cells[A,B] := ValorPrimeroStr;
                  end;
                end;
            else
            begin
              SGPlanilla.Cells[A,B] := ValorPrimeroStr;
            end;
          end;
        //end;
        ColW := A;
        FilW := B;
      end;
    end;
  end;
end;

procedure TFEducacionContinua.SGPlanillaSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
var
  I : Integer;
  d : TDateTime;
begin
  case SGPlanilla.Col of
    1 : begin
          ValorPrimeroInt := -1;
          if TryStrToInt(SGPlanilla.Cells[ACol,ARow],I) then
            ValorPrimeroInt := I
          else
            ValorPrimeroStr := SGPlanilla.Cells[ACol,ARow];
        end;
    2 : begin
          ValorPrimeroStr := SGPlanilla.Cells[ACol,ARow];
        end;
    3 : begin
          if LeftStr(Trim(UpperCase(Value)),3) = 'VAC' then
            SGPlanilla.Cells[ACol,ARow] := 'VACA'
          else
          begin
            if LeftStr(Trim(UpperCase(Value)),3) = 'VAQ' then
              SGPlanilla.Cells[ACol,ARow] := 'VAQUILLONA'
          end;
          ValorPrimeroStr := SGPlanilla.Cells[ACol,ARow];
        end;
    4 : begin
          ValorPrimeroStr := SGPlanilla.Cells[ACol,ARow];
        end;
    5 : begin
          if LeftStr(Trim(UpperCase(Value)),2) = 'NN' then
            SGPlanilla.Cells[ACol,ARow] := 'NO DEFINIDO';
          if LeftStr(Trim(UpperCase(Value)),2) = 'DL' then
            SGPlanilla.Cells[ACol,ARow] := 'DIENTE DE LECHE';
          if LeftStr(Trim(UpperCase(Value)),2) = '2D' then
            SGPlanilla.Cells[ACol,ARow] := '2 DIENTES';
          if LeftStr(Trim(UpperCase(Value)),2) = '4D' then
            SGPlanilla.Cells[ACol,ARow] := '4 DIENTES';
          if LeftStr(Trim(UpperCase(Value)),1) = '6D' then
            SGPlanilla.Cells[ACol,ARow] := '6 DIENTES';
          if LeftStr(Trim(UpperCase(Value)),1) = 'BL' then
            SGPlanilla.Cells[ACol,ARow] := 'BOCA LLENA';
          if LeftStr(Trim(UpperCase(Value)),1) = 'TD' then
            SGPlanilla.Cells[ACol,ARow] := 'TRES CUARTOS DIENTE';
          if LeftStr(Trim(UpperCase(Value)),1) = 'MD' then
            SGPlanilla.Cells[ACol,ARow] := 'MEDIO DIENTE';
          if LeftStr(Trim(UpperCase(Value)),1) = 'CD' then
            SGPlanilla.Cells[ACol,ARow] := 'CUARTO DIENTE';
          if LeftStr(Trim(UpperCase(Value)),1) = 'SD' then
            SGPlanilla.Cells[ACol,ARow] := 'SIN DIENTE';

          ValorPrimeroStr := SGPlanilla.Cells[ACol,ARow];
        end;
     6 : begin
          if tipo_CC = 1 then
          begin
            if LeftStr(Trim(UpperCase(Value)),1) = '1' then
              SGPlanilla.Cells[ACol,ARow] := '1';
            if LeftStr(Trim(UpperCase(Value)),1) = '2' then
              SGPlanilla.Cells[ACol,ARow] := '2';
            if LeftStr(Trim(UpperCase(Value)),1) = '3' then
              SGPlanilla.Cells[ACol,ARow] := '3';
            if LeftStr(Trim(UpperCase(Value)),1) = '4' then
              SGPlanilla.Cells[ACol,ARow] := '4';
            if LeftStr(Trim(UpperCase(Value)),1) = '5' then
              SGPlanilla.Cells[ACol,ARow] := '5';
            if LeftStr(Trim(UpperCase(Value)),1) = '6' then
              SGPlanilla.Cells[ACol,ARow] := '6';
            if LeftStr(Trim(UpperCase(Value)),1) = '7' then
              SGPlanilla.Cells[ACol,ARow] := '7';
            if LeftStr(Trim(UpperCase(Value)),1) = '8' then
              SGPlanilla.Cells[ACol,ARow] := '8';
            if LeftStr(Trim(UpperCase(Value)),1) = '9' then
              SGPlanilla.Cells[ACol,ARow] := '9';
          end;
          if tipo_CC = 2 then
          begin
          {  if LeftStr(Trim(UpperCase(Value)),1) = '1' then
              SGPlanilla.Cells[ACol,ARow] := '1';  }
            if (LeftStr(Trim(UpperCase(Value)),2) = '1,') or (LeftStr(Trim(UpperCase(Value)),2) = '1.') then
              SGPlanilla.Cells[ACol,ARow] := '1,5';
          {  if LeftStr(Trim(UpperCase(Value)),1) = '2' then
              SGPlanilla.Cells[ACol,ARow] := '2'; }
            if (LeftStr(Trim(UpperCase(Value)),2) = '2,') or (LeftStr(Trim(UpperCase(Value)),2) = '2.') then
              SGPlanilla.Cells[ACol,ARow] := '2,5';
          { if LeftStr(Trim(UpperCase(Value)),1) = '3' then
              SGPlanilla.Cells[ACol,ARow] := '3';  }
            if (LeftStr(Trim(UpperCase(Value)),2) = '3,') or (LeftStr(Trim(UpperCase(Value)),2) = '3.') then
              SGPlanilla.Cells[ACol,ARow] := '3,5';
         {   if LeftStr(Trim(UpperCase(Value)),1) = '4' then
              SGPlanilla.Cells[ACol,ARow] := '4'; }
            if (LeftStr(Trim(UpperCase(Value)),2) = '4,') or (LeftStr(Trim(UpperCase(Value)),2) = '4.') then
              SGPlanilla.Cells[ACol,ARow] := '4,5';
          {  if LeftStr(Trim(UpperCase(Value)),1) = '5' then
              SGPlanilla.Cells[ACol,ARow] := '5';   }
          end;
       end;
     7 : begin
          if LeftStr(Trim(UpperCase(Value)),2) = 'CA' then
            SGPlanilla.Cells[ACol,ARow] := 'CABEZA';
          if LeftStr(Trim(UpperCase(Value)),2) = 'CU' then
            SGPlanilla.Cells[ACol,ARow] := 'CUERPO';
          if LeftStr(Trim(UpperCase(Value)),2) = 'CO' then
            SGPlanilla.Cells[ACol,ARow] := 'COLA';
          if LeftStr(Trim(UpperCase(Value)),1) = 'V' then
            SGPlanilla.Cells[ACol,ARow] := 'VACIA';
          if LeftStr(Trim(UpperCase(Value)),1) = 'I' then
            SGPlanilla.Cells[ACol,ARow] := 'INSEMINACION';

          ValorPrimeroStr := SGPlanilla.Cells[ACol,ARow];
         end;
     8 : begin
          if LeftStr(Trim(UpperCase(Value)),1) = 'P' then
            SGPlanilla.Cells[ACol,ARow] := 'POSITIVO';
          if LeftStr(Trim(UpperCase(Value)),2) = 'NE' then
            SGPlanilla.Cells[ACol,ARow] := 'NEGATIVO';
          if LeftStr(Trim(UpperCase(Value)),1) = 'S' then
            SGPlanilla.Cells[ACol,ARow] := 'SOSPECHOSO';
          if LeftStr(Trim(UpperCase(Value)),2) = 'ND' then
            SGPlanilla.Cells[ACol,ARow] := 'NO DEFINIDO';
          ValorPrimeroStr := SGPlanilla.Cells[ACol,ARow];
        end;
     9 : begin
          ValorPrimeroStr := SGPlanilla.Cells[ACol,ARow];
        end;
     10 : begin
          ValorPrimeroStr := SGPlanilla.Cells[ACol,ARow];
        end;
  end;
end;

procedure TFEducacionContinua.Pegar1Click(Sender: TObject);
var
  C, F, IFil, ICol : Integer;
  Texto, TextoF : String;
  DatosF, DatosC : TStringList;
begin
  if (FilSel <> 0) and (ColSel <> 0) then
  begin
    Deshacer.Cant := 0;
    Deshacer.FilIni := FilSel;
    Deshacer.ColIni := ColSel;
    Deshacer.ColFin := ColSel;
    Deshacer.FilFin := FilSel;
    F := FilSel;
    Texto := StringReplace(ClipBrd.Clipboard.AsText,''#$D#$A'','&',[rfReplaceAll]);
    Texto := StringReplace(Texto,''#9'','%',[rfReplaceAll]);
    Texto := StringReplace(Texto,' ','|',[rfReplaceAll]);
    DatosF := TStringList.Create;
    DatosC := TStringList.Create;
    DatosF.Delimiter := '&';
    DatosF.DelimitedText := Texto;
    for IFil := 0 to DatosF.Count-1 do
    begin
      DatosC.Clear;
      DatosC.Delimiter := '%';
      DatosC.DelimitedText := DatosF.Strings[IFil];
      C := ColSel;
      for ICol := 0 to DatosC.Count-1 do
      begin
        SetLength(Deshacer.Datos,Deshacer.Cant+1);
        Deshacer.Datos[Deshacer.Cant].Dato := SGPlanilla.Cells[C,F];
        Deshacer.Datos[Deshacer.Cant].Fil:= F;
        Deshacer.Datos[Deshacer.Cant].Col := C;
        SGPlanilla.Cells[C,F] := StringReplace(DatosC.Strings[ICol],'|',' ',[rfReplaceAll]);
        Inc(C);
        Inc(Deshacer.Cant);
        Inc(Deshacer.ColFin);
      end;
      Inc(F);
      Inc(Deshacer.FilFin);
    end;
    LDeshacer.Visible := Deshacer.Cant > 0;
    IDeshacer.Visible := Deshacer.Cant > 0;
    EcantAC.Text := IntToStr(DatosF.Count-1);
  end;
end;

procedure TFEducacionContinua.BorrarContenido1Click(Sender: TObject);
begin
  SGPlanilla.Cells[ColSel,FilSel] := '';
end;

procedure TFEducacionContinua.Copiar1Click(Sender: TObject);
var
  F,C : Integer;
  Texto : String;
begin
  Clipboard.Clear;
  for F := InicioArrastreF to FinArrastreF do
  begin
    for C := InicioArrastrCol to FinArrastreCol do
    begin
      Texto := Texto + SGPlanilla.Cells[C,F];
      if C < FinArrastreCol then
        Texto := Texto+''#9'';
    end;
    if F < FinArrastreF then
      Texto := Texto + ''#$D#$A'';
  end;
  Clipboard.AsText := Texto;
end;

procedure TFEducacionContinua.Cortar1Click(Sender: TObject);
begin
  Clipboard.Clear;
  Clipboard.AsText := SGPlanilla.Cells[ColSel,FilSel];
  SGPlanilla.Cells[ColSel,FilSel] := '';
end;

procedure TFEducacionContinua.SGPlanillaDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Info : String;
  R : TRect;
begin
  if (ACol > 0) and (ARow > 0) then
  begin
    Info := SGPlanilla.Cells[ACol,ARow];
    if Grilla[ACol,ARow] then
    begin
      SGPlanilla.Canvas.Brush.Color := clMoneyGreen;
    end
    else
    begin
      SGPlanilla.Canvas.Brush.Color := clWhite;
    end;

    SGPlanilla.Canvas.FillRect(Rect);
    SGPlanilla.Canvas.TextOut(Rect.Left+5,Rect.Top+5,Info);
  end
  else
  begin
    Info := SGPlanilla.Cells[ACol,ARow];
    if Grilla[ACol,ARow] then
    begin
      SGPlanilla.Canvas.Brush.Color := clGreen;
    end
    else
    begin
      SGPlanilla.Canvas.Brush.Color := clSilver;
    end;
    SGPlanilla.Canvas.FillRect(Rect);
    SGPlanilla.Canvas.TextOut(Rect.Left+5,Rect.Top+5,Info);
  end;
end;

procedure TFEducacionContinua.SGPlanillaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not(ssRight in Shift) then
  begin
    LDeshacer.Visible := Deshacer.Cant > 0;
    IDeshacer.Visible := Deshacer.Cant > 0;
    SGPlanilla.MouseToCell(X,Y,FinArrastreCol,FinArrastreF);
    SGPlanilla.Cursor := crHandPoint;
    Application.ProcessMessages;
  end;
end;

procedure TFEducacionContinua.CBCloseUp(Sender: TObject);
begin
  showmessage(IntToStr((Sender as TComboBox).ItemIndex));
end;

procedure TFEducacionContinua.SGPlanillaKeyPress(Sender: TObject; var Key: Char);
begin
  {if Key = #13 then
    SGPlanilla.Row := SGPlanilla.Row + 1;   }
end;

procedure TFEducacionContinua.SGPlanillaClick(Sender: TObject);
var
  C, I, Fil, Col : Integer;
  d : String;
begin
  C := SGPlanilla.Col;
  D := SGPlanilla.Cells[SGPlanilla.Col,SGPlanilla.Row];

  for Col := 0 to MAX_COLUMNA do
    for Fil := 0 to MAX_FILA do
      Grilla[Col,Fil] := false;
  Grilla[SGPlanilla.Col,SGPlanilla.Row] := true;
  Grilla[0,SGPlanilla.Row] := true;
  Grilla[SGPlanilla.Col,0] := true;
  SGPlanilla.Repaint;

 case C of
    1 : begin
          if TryStrToInt(D,I) then
            ValorPrimeroInt := I
          else
            ValorPrimeroStr := D;
        end;
    else
      ValorPrimeroStr := D;
  end;
end;

procedure TFEducacionContinua.TSavePlanillaTimer(Sender: TObject);
begin
  inherited;
  if (archivo_importacion <> '') then
      SGPlanilla.SaveToCSV(archivo_importacion);
end;

procedure TFEducacionContinua.SGPlanillaExitCell(Sender: TJvStringGrid;
  AColumn, ARow: Integer; const EditText: String);
var
  d : TDateTime;
begin
  inherited;
  case AColumn of
    2 : begin
          if not TryStrToDate(UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])),d) and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '') then
          begin
            MostrarMensaje(tmError,'La fecha esta mal escrita el formato es dd/mm/aaaa');
            SGPlanilla.Cells[AColumn,ARow] := '';
          end;
        end;
    3 : begin
          if (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'VACA') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'VAQUILLONA') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '') then
          begin
            MostrarMensaje(tmError,'La categoria debe ser VACA o VAQUILLONA');
            SGPlanilla.Cells[AColumn,ARow] := '';
          end;
        end;
    5 : begin
          if (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'NN') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '2D')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '4D') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '6D')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'BL') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'TD')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'MD') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'DL')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'CD') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'SD')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'NO DEFINIDO')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '2 DIENTES') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '4 DIENTES')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '6 DIENTES') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'BOCA LLENA')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'TRES CUARTOS DIENTE') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'MEDIO DIENTE')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'DIENTE DE LECHE') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'CUARTO DIENTE')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'SIN DIENTE') then
          begin
            MostrarMensaje(tmError,'La Cronología Dentaria debe ser NN, DL, 2D, 4D, 6D, BL, TD, MD, CD o SD');
            SGPlanilla.Cells[AColumn,ARow] := '';
          end;
        end;
    6 : begin
          if tipo_CC = 1 then
          begin
            if (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '1') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '2')
                and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '3') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '4')
                and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '5') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '6')
                and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '7') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '8')
                and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '9') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '') then
            begin
              MostrarMensaje(tmError,'La Condición Corporal debe ser de 1 a 9');
              SGPlanilla.Cells[AColumn,ARow] := '';
            end;
          end
          else
          begin
            if (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '1') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '1,5')
                and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '2') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '2,5')
                and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '3') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '3,5')
                and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '4') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '4,5')
                and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '5') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '') then
            begin
              MostrarMensaje(tmError,'La Condición Corporal debe ser de 1 a 5');
              SGPlanilla.Cells[AColumn,ARow] := '';
            end;
          end;
        end;
    7 : begin
          if (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'VACIA') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'CABEZA')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'CUERPO') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'COLA')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'INSEMINACION') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '') then
          begin
            MostrarMensaje(tmError,'El Estado Reproductivo debe ser CABEZA, CUERPO, COLA, VACIA o INSEMINACION');
            SGPlanilla.Cells[AColumn,ARow] := '';
          end;
        end;
    8 : begin
          if (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'NO DEFINIDO') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'NEGATIVO')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'POSITIVO') and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> 'SOSPECHOSO')
            and (UpperCase(Trim(SGPlanilla.Cells[AColumn,ARow])) <> '') then
          begin
            MostrarMensaje(tmError,'El Sangrado debe ser NO DEFINIDO, NEGATIVO, POSITIVO o SOSPECHOSO');
            SGPlanilla.Cells[AColumn,ARow] := '';
          end;
        end;
  end;
end;

procedure TFEducacionContinua.CBGrupoChange(Sender: TObject);
begin
  inherited;
  if CBGrupo.Text = '(TODOS)' then
    CBGrupo.Text := 'GRUPO';
  CargarValorDatosPorCond;
  CargarValorDatosPorCron;
  ArmarSeries;
  CalcularBrucelosis;
end;

procedure TFEducacionContinua.CBGrupoCloseUp(Sender: TObject);
begin
  inherited;
  if CBGrupo.Text = '(TODOS)' then
    CBGrupo.Text := 'GRUPO';
end;

procedure TFEducacionContinua.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if Ingreso = 1 then
  begin
    if (EEstablecimiento.Text <> '') and (id_estable = -1) then
    begin
      try
        IBQEstabsEC.Insert;
        IBQEstabsEC.FieldByName('nombre').Value := EEstablecimiento.Text;
        IBQEstabsEC.FieldByName('renspa').Value := ERENSPA.Text;
        IBQEstabsEC.FieldByName('propietario').Value := EPropietario.Text;
        IBQEstabsEC.FieldByName('veterinario').Value := EVeterinario.Text;
        IBQEstabsEC.FieldByName('direccion').Value := EDireccion.Text;
        IBQEstabsEC.FieldByName('telefono').Value := ETElefono.Text;
        IBQEstabsEC.FieldByName('mail').Value := EMail.Text;
        IBQEstabsEC.FieldByName('web').Value := EWeb.Text;
        IBQEstabsEC.Post;
        FPrincipal.IBTPrincipal.CommitRetaining;
     except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;

      id_estable := IBQEstabsEC.FieldValues['id_estab'];
    end;

    if id_estable <> -1 then
    begin
      try
        IBQInsertRel.Close;
        IBQInsertRel.ParamByName('id').Value := id_estable;
        IBQInsertRel.ParamByName('arch').Value := archivo_importacion;
        IBQInsertRel.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
    if (archivo_Importacion <> '') then
        SGPlanilla.SaveToCSV(archivo_importacion);
  end;
end;

procedure TFEducacionContinua.SGPlanillaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) and (Key = Ord('C')) then
  begin
    Clipboard.Clear;
    Clipboard.AsText := SGPlanilla.Cells[SGPlanilla.Col,SGPlanilla.Row];
  end;
end;

procedure TFEducacionContinua.IDeshacerClick(Sender: TObject);
var
  F, C : Integer;
  Ca : Integer;
begin
  inherited;
  Ca := 0;
  { for C := Deshacer.ColIni to Deshacer.ColFin - 1 do
    for F := Deshacer.FilIni to Deshacer.FilFin - 1 do
    begin
      if Ca < Deshacer.Cant then
      begin
        SGPlanilla.Cells[C,F] := Deshacer.Datos[Ca];
      end;
      Inc(Ca);
    end;}
  for ca := 0 to Deshacer.Cant-1 do
  begin
    SGPlanilla.Cells[Deshacer.Datos[Ca].Col,Deshacer.Datos[Ca].Fil] := Deshacer.Datos[Ca].Dato;
  end;
  Deshacer.Cant := 0;
  LDeshacer.Visible := false;
  IDeshacer.Visible := false;
end;

function TFEducacionContinua.RefToCell(ARow, ACol: Integer): string;
begin
  Result := Chr(Ord('A') + ACol - 1) + IntToStr(ARow);
end;

function TFEducacionContinua.SaveAsExcelFile(AGrid: TStringGrid; ASheetName, AFileName: string): Boolean;
const
  xlWBATWorksheet = -4167;
var
  Row, Col: Integer;
  GridPrevFile: string;
  XLApp, Sheet, Data: OLEVariant;
  i, j, k, l, filas, cols: Integer;
begin
  // Prepare Data
  Data := VarArrayCreate([1, AGrid.RowCount, 1, AGrid.ColCount], varVariant);
  for i := 0 to AGrid.ColCount - 1 do
    for j := 0 to AGrid.RowCount - 1 do
      if AGrid.Cells[1, j] <> '' then
      begin
        Data[j + 1, i + 1] := AGrid.Cells[i, j];
        filas := j;
        cols := i;
      end;
  // Create Excel-OLE Object
  Result := False;
  XLApp := CreateOleObject('Excel.Application');
  try
    // Hide Excel
    XLApp.Visible := False;
    // Add new Workbook
    XLApp.Workbooks.Add(xlWBatWorkSheet);
    Sheet := XLApp.Workbooks[1].WorkSheets[1];
    Sheet.Name := ASheetName;
    // Fill up the sheet
    //Sheet.Range[RefToCell(1, 1), RefToCell(AGrid.RowCount-1, AGrid.ColCount-1)].Value := Data;
    for k := 0 to cols do
      for l := 0 to filas do
        Sheet.Cells[l+1,k+1] := Data[l+1,k+1];
    // Save Excel Worksheet
    try
      XLApp.Workbooks[1].SaveAs(AFileName);
      Result := True;
    except
      // Error ?
    end;
  finally
    // Quit Excel
    if not VarIsEmpty(XLApp) then
    begin
      XLApp.DisplayAlerts := False;
      XLApp.Quit;
      XLAPP := Unassigned;
      Sheet := Unassigned;
    end;
  end;
end;

procedure TFEducacionContinua.IExpExcelClick(Sender: TObject);
begin
  inherited;
  if SDExcel.Execute then
    SaveAsExcelFile(SGPlanilla,'Diagnostico de Gestacion',SDExcel.FileName);
end;


 
procedure TFEducacionContinua.CBCategACChange(Sender: TObject);
var cant, I : Integer;
begin
  inherited;
  if TryStrToInt(EcantAC.Text,cant) then
  begin
    for I := 1 to cant do
    begin
      if (CBCategAC.ItemIndex > -1)  then
          SGPlanilla.Cells[3,I] := CBCategAC.Text
      else
          SGPlanilla.Cells[3,I] := '';
    end;
  end;
end;

procedure TFEducacionContinua.CBCCACChange(Sender: TObject);
var cant, I : Integer;
begin
  inherited;
  if TryStrToInt(EcantAC.Text,cant) then
  begin
    for I := 1 to cant do
    begin
    if (CBCCAC.ItemIndex > -1) then
        SGPlanilla.Cells[6,I]  := CBCCAC.Text
    else
      SGPlanilla.Cells[6,I]  := '';
    end;
  end;
end;

procedure TFEducacionContinua.CBCronDentACChange(Sender: TObject);
var cant, I : Integer;
begin
  inherited;
  if TryStrToInt(EcantAC.Text,cant) then
  begin
    for I := 1 to cant do
    begin
      if (CBCronDentAC.ItemIndex > -1)  then
        SGPlanilla.Cells[5,I]  := CBCronDentAC.Text
      else
        SGPlanilla.Cells[5,I]  := '';
    end;
  end;
end;

procedure TFEducacionContinua.CBEstadoACChange(Sender: TObject);
var cant, I : Integer;
begin
  inherited;
  if TryStrToInt(EcantAC.Text,cant) then
  begin
    for I := 1 to cant do
    begin
      if (CBEstadoAC.ItemIndex > -1)  then
        SGPlanilla.Cells[7,I]  := CBEstadoAC.Text
      else
        SGPlanilla.Cells[7,I]  := '';
    end;
  end;
end;

procedure TFEducacionContinua.CBSangradoACChange(Sender: TObject);
var cant, I : Integer;
begin
  inherited;
  if TryStrToInt(EcantAC.Text,cant) then
  begin
    for I := 1 to cant do
    begin
      if (CBSangradoAC.ItemIndex > -1) then
          SGPlanilla.Cells[8,I]  := CBSangradoAC.Text
      else
          SGPlanilla.Cells[8,I]  := '';
    end;
  end;
end;

procedure TFEducacionContinua.ERazaACChange(Sender: TObject);
var cant, I : Integer;
begin
  inherited;
  if TryStrToInt(EcantAC.Text,cant) then
  begin
    for I := 1 to cant do
    begin
      if (ERazaAC.Text <> '')  then
        SGPlanilla.Cells[4,I] := ERazaAC.Text
      else
        SGPlanilla.Cells[4,I] := '';
    end;
  end;
end;


procedure TFEducacionContinua.ISacarAnimalClick(Sender: TObject);
var fila, col, cant, filaSig, actual: integer;
begin
  inherited;
  if (seleccion = false) then
     MostrarMensaje(tmInformacion, 'No existe ningún animal seleccionado')
  else
  begin
     fila := SGPlanilla.Row;
     if (MostrarMensaje(tmConsulta, 'Está seguro de eliminar el animal con caravana '+SGPlanilla.Cells[1,fila]+' ?') = mryes ) then
     begin
        cant := strtoint(EcantAC.Text) - 1;
        EcantAC.Text := inttostr(cant);
        filaSig := fila + 1;
        for actual := fila to cant do
        begin
            for col := 1 to 10 do
              SGPlanilla.Cells[col,fila] := SGPlanilla.Cells[col,filaSig];
            fila := fila + 1;
            filaSig := filaSig + 1;
        end;
        for col := 1 to cant + 1 do
           SGPlanilla.Cells[col,fila] := '';
     end;
  end;
end;

end.







