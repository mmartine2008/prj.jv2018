unit UREPInfoGeneralPartos;

interface

uses          
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids, Buttons,
  DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, IBQuery, DBGrids,
  UBDBGrid, TeEngine, Series, TeeProcs, Chart, DbChart, UMensajeImpresora,
  Mask, EditAuto, UREPInfoGeneralPartosPreview, QRCtrls, QuickRpt,
  PngImage, jpeg, JvGIF, JvExControls, JvLabel, JvExExtCtrls,
  JvExtComponent, JvCaptionPanel, ImgList, PngImageList, JvImage;

type
  ///////DISTOCIA////////////////////
  TRegSeries = record
    nombre : String;
    valor : double;
    total : integer;
    cant_machos : integer;
    cant_hembras : integer;
    cant_machos_dist : integer;
    cant_hembras_dist : integer;
    peso_macho : integer;
    peso_hembra : integer;
    peso_macho_dist : integer;
    peso_hembra_dist : integer;
    muerto_36hs : integer;
    muerto_30dias : integer;
    distocicos : integer;
  end;

  TArrSeries = Array of TRegSeries;
  /////////////////////////////////////////////

  TFREPInfoGeneralPartos = class(TFUniversal)
    PTop: TPanel;
    Splitter2: TSplitter;
    PResumenParto: TPanel;
    GBResumenParto: TGroupBox;
    IBQResumenParto: TIBQuery;
    ASalir: TAction;
    AImprimirReporte: TAction;
    BitDBGrid1: TBitDBGrid;
    DSNacimientos: TDataSource;
    IBQNacimientos: TIBQuery;
    IBQPotreros: TIBQuery;
    DSPotreros: TDataSource;
    PGraficos: TPanel;
    PServidas: TPanel;
    GBServidas: TGroupBox;
    IBQCantNacimientos: TIBQuery;
    DSCantNacimientos: TDataSource;
    DSResumenParto: TDataSource;
    GroupBox2: TGroupBox;
    CBListado: TCheckBox;
    IBQGrupos: TIBQuery;
    DSGrupos: TDataSource;
    GroupBox3: TGroupBox;
    CBAnalisis: TCheckBox;
    IBQDistPesoNacer: TIBQuery;
    DSDistPesoNacer: TDataSource;
    GroupBox4: TGroupBox;
    CBMensual: TCheckBox;
    CBSemanal: TCheckBox;
    CBAcumulado: TCheckBox;
    IBQParametros: TIBQuery;
    DBCDistPesoNacer: TDBChart;
    Panel1: TPanel;
    GBSeleccionFechas: TGroupBox;
    UpDown1: TUpDown;
    EAAnio: TEditAuto;
    GBPotreros: TGroupBox;
    DBLCBASeleccionPotrero: TDBLookupComboBoxAuto;
    Panel2: TPanel;
    LMes1: TLabel;
    LMes2: TLabel;
    LMes3: TLabel;
    LMes4: TLabel;
    LMes5: TLabel;
    LMes6: TLabel;
    LMes7: TLabel;
    LMes8: TLabel;
    LMes9: TLabel;
    LMes10: TLabel;
    LMes11: TLabel;
    LMes12: TLabel;
    SMes1: TShape;
    SMes2: TShape;
    SMes3: TShape;
    SMes4: TShape;
    SMes5: TShape;
    SMes6: TShape;
    SMes7: TShape;
    SMes8: TShape;
    SMes9: TShape;
    SMes10: TShape;
    SMes11: TShape;
    Shape1: TShape;
    DBCRodeo: TDBChart;
    DBCGrado: TDBChart;
    DBCPadre: TDBChart;
    DBCCC: TDBChart;
    DBCAreaP: TDBChart;
    DBCRaza: TDBChart;
    DBCFrame: TDBChart;
    DBCMuertos: TDBChart;
    IBQRepPartosDistocicos: TIBQuery;
    DBCNacimientos: TDBChart;
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
    Image1: TImage;
    LAnioB: TLabel;
    CPSeleccionAnio: TJvCaptionPanel;
    L1: TLabel;
    L2: TLabel;
    L3: TLabel;
    L4: TLabel;
    L5: TLabel;
    L6: TLabel;
    L7: TLabel;
    L8: TLabel;
    L9: TLabel;
    L10: TLabel;
    Image5: TImage;

    RGTipo: TRadioGroup;
    GroupBox1: TGroupBox;
    Button1: TButton;
    GroupBox5: TGroupBox;
    JvIBotonBuscar: TJvImage;
    procedure FormShow(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure DBLCBASeleccionPotreroCloseUp(Sender: TObject);
    procedure DTPADesdeChange(Sender: TObject);
    procedure DTPAHastaChange(Sender: TObject);
    procedure BitDBGrid1DblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQNacimientosAfterOpen(DataSet: TDataSet);
    procedure DBLCBASeleccionPotreroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBCNacimientosGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure CBSemanalClick(Sender: TObject);
    procedure CBMensualClick(Sender: TObject);
    procedure CBAcumuladoClick(Sender: TObject);
    procedure EAAnioKeyPress(Sender: TObject; var Key: Char);
    procedure EAAnioChange(Sender: TObject);


    ///////////////////////////DISTOCICO/////////////////////////////////
    procedure _D_DBCRodeoGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure _D_DBCGradoGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure _D_DBCPadreGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure _D_DBCCCGetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
    procedure _D_DBCAreaPGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure _D_DBCRazaGetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
    procedure _D_DBCFrameGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure _D_DBCMuertosGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure _D_GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: String);
    procedure _D_DBCGetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure _D_DBCMuertosGetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure FormCreate(Sender: TObject);
    procedure DBCRodeoGetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure DBCGradoGetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure FormResize(Sender: TObject);
    procedure LAnioBClick(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure RGPartosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
   

    /////////////////////////////////////////////////////////////////////

  private
    { Private declarations }
    traceList :TStringList;
    CantNacimientosNormales, CantNacimientosDistocicos, DistPesoMacho, DistPesoHembra: TBarSeries;
    CantNacimientosNormalesMes, CantNacimientosDistocicosMes: TBarSeries;
    CantNacimientosAcumulado: TLineSeries;
    DistPesoAcumulado: TLineSeries;
    LabelNacimientos: Array [1..48] of String;
    MatDistPesoNacer: Array [0..4] of array of String;
    minpeso, maxpeso: Integer;
    fechadesde, fechahasta: TDateTime;
    parto1, parto2, parto3, parto4, todos : String;
    {/***/*/*/*/*/*/*/*/*/*/*}

    cantMachosVivos, cantMachosMuertos, cantHembrasVivas, cantHembrasMuertas: Integer;
    cantPartosDistociaVivos, cantPartosDistociaMuertos: Integer;

    promPesoNacimientoVivo, promPesoNacimientoMuerto: Double;
    promPesoNacimientoVivoMacho,promPesoNacimientoMuertoMacho, promPesoNacimientoVivoHembra, promPesoNacimientoMuertoHembra: Double;

    cantMachosParaPromedioVivo, cantMachosParaPromedioMuerto,cantHembrasParaPromedioVivo,cantHembrasParaPromedioMuerto: integer;

    totalnacnormalmes,totalnacdistomes: double;    

    {/***/*/*/*/*/*/*/*/*/*/*}

    /////////DISTOICICO//////////////////
    SDistRodeo, SPesoRodeo : TBarSeries;
    SDistGrado, SPesoGrado : TBarSeries;
    SDistPadre, SPesoPadre : TBarSeries;
    SDistAreaP, SPesoAreaP : TBarSeries;
    SDistFrame, SPesoFrame : TBarSeries;
    SDistRaza, SPesoRaza : TBarSeries;
    SDistCC, SPesoCC : TBarSeries;
    SDistMuertos, SPesoMuertos : TBarSeries;

    ArrDistRodeo, ArrPesoRodeo : TArrSeries;
    ArrDistGrado, ArrPesoGrado : TArrSeries;
    ArrDistPadre, ArrPesoPadre : TArrSeries;
    ArrDistAreaP, ArrPesoAreaP : TArrSeries;
    ArrDistFrame, ArrPesoFrame : TArrSeries;
    ArrDistRaza, ArrPesoRaza : TArrSeries;
    ArrDistCC, ArrPesoCC : TArrSeries;
    ArrDistMuertos, ArrPesoMuertos : TArrSeries;
    ////////////////////////////////////////////////


    TotalNacimientosNormales,TotalNacimientosDistocicos, TotalNacimientos, TotalNacimientosAcumulado : Array [1..48] of Double;
    TotalNacimientosNormalesMes, TotalNacimientosDistocicosMes, TotalNacimientosMes, TotalNacimientosAcumuladoMes : Array [1..12] of Double;

    procedure CalcularMaxMinPeso();
    procedure CrearMatDistPesoNacer();
    procedure cargarLabelNacimientos(Fecha :TDateTime);
    procedure actualizarFiltro();
    procedure actualizarBotones();
    procedure CrearSeries();
    procedure ArmarSeries();
    procedure ArmarSeries2();
    function GetRangoMes(fecha: TDateTime): String;
    function GetPosSegunRangoMes(mes:Integer; rango:String): Integer;
    procedure VerMeses;
    procedure AjustarMesesGraficoNacimientos();


    //////////////////////DISTOCICO////////////////
    procedure _D_CrearSeries;
    procedure _D_ArmarSeries;
    procedure _D_CargarSerie(CampoComparacion, Peso : Variant; var ArrDist, ArrPeso : TArrSeries);
    procedure _D_CargarSerieMuertos(var ArrDist, ArrPeso : TArrSeries);
    procedure _D_AgregarValor(var Arr : TArrSeries; Registro : TRegSeries; Tipo : Integer);
    procedure _D_CargarDatosAdicionales(var Arr : TArrSeries; Indice : Integer);
    procedure _D_Cargar_ArmarSerie(var Serie : TBarSeries; Grafico : TDBChart; VertAxis : TVertAxis; Arreglo : TArrSeries; Prom : Boolean);
    procedure _D_Crear_CrearSerie(Serie : TBarSeries; Nombre : String; Estilo : TSeriesMarksStyle; Color : TColor);
    procedure _D_CargarValoresPredefinidos();
    procedure _D_Ordenar(var Arr : TArrSeries; Cantidad : Integer);
    procedure _D_Completar(var Arr : TArrSeries; Cantidad : Integer);
    procedure _D_ClearArreglos();
    procedure _D_ArmarTablasPreview(var T : TFREPInfoGeneralPartosPreview);
    procedure _D_ArmarPreview(var T : TFREPInfoGeneralPartosPreview);
    //////////////////////////////////////////////////

    procedure HabilitarComponentesVersionBasica; override;    

    procedure ArmarAnios;
  public
    RGPartos: TRadioGroup;
    { Public declarations }
    function calcularPartos : Integer;
    function GetMeses(mes : integer) : String;
    procedure CompletarMeses();
  end;

var
  FREPInfoGeneralPartos: TFREPInfoGeneralPartos;

implementation

{$R *.dfm}

uses UDMSoftvet, UPrincipal, UREPFichaAnimal, Math,
     UCartel, DateUtils, UTraduccion;

procedure TFREPInfoGeneralPartos.FormShow(Sender: TObject);
begin
  inherited;
  IBQGrupos.Close;
  IBQGrupos.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQGrupos.Open;
  DMSoftvet.IBQAfterOpen(IBQGrupos);
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;

  IBQPotreros.First;

  parto1 := 'N';
  parto2 := 'N';
  parto3 := 'N';
  parto4 := 'N';
  todos := 'S';
  EAAnio.Text:= IntToStr(YearOf(Now()));
  EAAnio.OnChange := EAAnioChange;
  RGTipoClick(self);
end;

procedure TFREPInfoGeneralPartos.ArmarAnios;
var
  anio : Integer;
  i : Integer;
begin
  anio := YearOf(Date());
  L1.Caption := IntToStr(anio);
  L1.Tag := anio;
  L2.Caption := IntToStr(anio-1);
  L2.Tag := anio-1;
  L3.Caption := IntToStr(anio-2);
  L3.Tag := anio-2;
  L4.Caption := IntToStr(anio-3);
  L4.Tag := anio-3;
  L5.Caption := IntToStr(anio-4);
  L5.Tag := anio-4;
  L6.Caption := IntToStr(anio-5);
  L6.Tag := anio-5;
  L7.Caption := IntToStr(anio-6);
  L7.Tag := anio-6;
  L8.Caption := IntToStr(anio-7);
  L8.Tag := anio-7;
  L9.Caption := IntToStr(anio-8);
  L9.Tag := anio-8;
  L10.Caption := IntToStr(anio-9);
  L10.Tag := anio-9;
end;

procedure TFREPInfoGeneralPartos.FormCreate(Sender: TObject);
begin
  inherited;

  EAAnio.OnChange := nil;

  IBQPotreros.ParamByName('esta').Value := fprincipal.establecimientoactual;
  IBQPotreros.Open;

  EAAnio.Text:= IntToStr(YearOf(Now()));
  fechadesde := StrToDate('01/01/' + EAAnio.Text);
  fechahasta := StrToDate('31/12/' + EAAnio.Text);


  DMSoftvet.IBQAfterOpen(IBQPotreros);
  CrearSeries();
  cargarLabelNacimientos(fechadesde);
  CalcularMaxMinPeso();

  WindowState := wsMaximized;

  LAnioB.Caption := IntToStr(YearOf(Date()));
  ArmarAnios;

end;

procedure TFREPInfoGeneralPartos.RGTipoClick(Sender: TObject);
begin
  inherited;
   if (TRadioGroup(Sender).ItemIndex = 0) then
    begin
      DBLCBASeleccionPotrero.Enabled := false;
    end
   else
     if (TRadioGroup(Sender).ItemIndex = 1) then   //potreros
      begin
        DBLCBASeleccionPotrero.Enabled := true;
        GBPotreros.Caption:= Traducir('Selección de Potreros');
        DBLCBASeleccionPotrero.ListSource:= nil;
        DBLCBASeleccionPotrero.KeyField:= '';
        DBLCBASeleccionPotrero.ListField:= '';
        DBLCBASeleccionPotrero.ListSource:= DSPotreros;
        DBLCBASeleccionPotrero.KeyField:= 'ID_POTRERO';
        DBLCBASeleccionPotrero.ListField:= 'NOMBRE';
        DBLCBASeleccionPotrero.KeyValue:= 0;
      end
    else
       if (TRadioGroup(Sender).ItemIndex = 2) then   //rodeos
        begin
          DBLCBASeleccionPotrero.Enabled := true;
          GBPotreros.Caption:= Traducir('Selección de Rodeos');
          DBLCBASeleccionPotrero.ListSource:= nil;
          DBLCBASeleccionPotrero.KeyField:= '';
          DBLCBASeleccionPotrero.ListField:= '';
          DBLCBASeleccionPotrero.ListSource:= DMSoftvet.DSRodeo;
          DBLCBASeleccionPotrero.KeyField:= 'ID_RODEO';
          DBLCBASeleccionPotrero.ListField:= 'NOMBRE';
          DBLCBASeleccionPotrero.KeyValue:= 0;
        end
       else
         if (TRadioGroup(Sender).ItemIndex = 3) then   //grupo
          begin
            DBLCBASeleccionPotrero.Enabled := true;
            GBPotreros.Caption:= Traducir('Selección de Grupos');
            DBLCBASeleccionPotrero.ListSource:= nil;
            DBLCBASeleccionPotrero.KeyField:= '';
            DBLCBASeleccionPotrero.ListField:= '';
            DBLCBASeleccionPotrero.ListSource:= DSGrupos;
            DBLCBASeleccionPotrero.KeyField:= 'ID_GRUPO';
            DBLCBASeleccionPotrero.ListField:= 'NOMBRE';
           end;

 {  if (TRadioGroup(Sender).ItemIndex = 0) then
     actualizarFiltro;     }
end;


function TFREPInfoGeneralPartos.calcularPartos() : Integer;
begin
   if (parto1 = 'S') then
      Result := 1;

   if (parto2 = 'S') then
      Result := 2;

   if (parto3 = 'S') then
      Result := 3;

   if (parto4 = 'S') then
      Result := 4;

   if (todos = 'S') then
      Result := 0;
end;

procedure TFREPInfoGeneralPartos.actualizarFiltro;
var query, com, com2:string;
    cartel: TCartel;
    msje, consulta: String;
    cant_partos: Integer;
begin

  cartel:= TCartel.getInstance();
  msje:= 'Calculando Nacimientos ...';
  cartel.abrircartel(msje);

  HabilitarDesabilitarControles();

  DBCNacimientos.RemoveAllSeries;
  DBCDistPesoNacer.RemoveAllSeries;

  IBQNacimientos.Active := false;
  IBQNacimientos.Params.Clear;
  IBQNacimientos.SQL.Clear;

  IBQCantNacimientos.Active := false;
  IBQCantNacimientos.Params.Clear;
  IBQCantNacimientos.SQL.Clear;


  IBQDistPesoNacer.Active := false;
  IBQDistPesoNacer.Params.Clear;
  IBQDistPesoNacer.SQL.Clear;


  IBQResumenParto.Active := false;
  IBQResumenParto.Params.Clear;
  IBQResumenParto.SQL.Clear;

  com:= ' ';
  com2:='';

  cant_partos := calcularPartos();

  if (RGTipo.ItemIndex = 0) then  // todos
    begin
      query:='select * from REP_INFOGRALLIS_NACIMIENTOS(:esta,NULL,:desde,:hasta,:cant)';

      IBQNacimientos.SQL.Add(query);
      IBQNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;
      IBQNacimientos.ParamByName('desde').Value := fechadesde;
      IBQNacimientos.ParamByName('hasta').Value := fechahasta;
      IBQNacimientos.ParamByName('cant').Value := cant_partos;


      query := 'select * from rep_partos_distocicos(:establecimiento,:desde,:hasta,null,null,:cant)';

      IBQRepPartosDistocicos.Close;
      IBQRepPartosDistocicos.SQL.Clear;
      IBQRepPartosDistocicos.SQL.Add(query);
      IBQRepPartosDistocicos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQRepPartosDistocicos.ParamByName('desde').AsDate := fechadesde;
      IBQRepPartosDistocicos.ParamByName('hasta').AsDate := fechahasta;
      IBQRepPartosDistocicos.ParamByName('cant').Value := cant_partos;

    end
   else
    if (RGTipo.ItemIndex = 1) then  // selecciono un potrero
      begin
        query:='select * from REP_INFOGRALLIS_NACIMIENTOS(:esta,NULL,:desde,:hasta,:cant) where potrero = :potrero';

        IBQNacimientos.SQL.Add(query);
        IBQNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;
        IBQNacimientos.ParamByName('desde').Value := fechadesde;
        IBQNacimientos.ParamByName('hasta').Value := fechahasta;
        IBQNacimientos.ParamByName('cant').Value := cant_partos;
        IBQNacimientos.ParamByName('potrero').Value := DBLCBASeleccionPotrero.KeyValue;

        query := 'select * from rep_partos_distocicos(:establecimiento,:desde,:hasta,null,:potrero,:cant)';

        IBQRepPartosDistocicos.Close;
        IBQRepPartosDistocicos.SQL.Clear;
        IBQRepPartosDistocicos.SQL.Add(query);
        IBQRepPartosDistocicos.ParamByName('establecimiento').Value := FPrincipal.EstablecimientoActual;
        IBQRepPartosDistocicos.ParamByName('desde').Value := fechadesde;
        IBQRepPartosDistocicos.ParamByName('hasta').Value := fechahasta;
        IBQRepPartosDistocicos.ParamByName('cant').Value := cant_partos;
        IBQRepPartosDistocicos.ParamByName('potrero').Value := DBLCBASeleccionPotrero.KeyValue;
      end
    else
      if (RGTipo.ItemIndex = 2) then                                // selecciono rodeo
        begin
          query:='select * from REP_INFOGRALLIS_NACIMIENTOS(:esta,NULL,:desde,:hasta,:cant) where rodeo = :rodeo';

          IBQNacimientos.SQL.Add(query);
          IBQNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;
          IBQNacimientos.ParamByName('desde').Value := fechadesde;
          IBQNacimientos.ParamByName('hasta').Value := fechahasta;
          IBQNacimientos.ParamByName('cant').Value := cant_partos;
          IBQNacimientos.ParamByName('rodeo').Value := DBLCBASeleccionPotrero.KeyValue;

          query := 'select * from rep_partos_distocicos(:establecimiento,:desde,:hasta,null,null,:cant) where id_rodeo = :rodeo';

          IBQRepPartosDistocicos.Close;
          IBQRepPartosDistocicos.SQL.Clear;
          IBQRepPartosDistocicos.SQL.Add(query);
          IBQRepPartosDistocicos.ParamByName('establecimiento').Value := FPrincipal.EstablecimientoActual;
          IBQRepPartosDistocicos.ParamByName('desde').Value := fechadesde;
          IBQRepPartosDistocicos.ParamByName('hasta').Value := fechahasta;
          IBQRepPartosDistocicos.ParamByName('cant').Value := cant_partos;
          IBQRepPartosDistocicos.ParamByName('rodeo').Value := DBLCBASeleccionPotrero.KeyValue;
        end
      else
        if (RGTipo.ItemIndex = 3) then
        begin
          query:='select * from REP_INFOGRALLIS_NACIMIENTOS(:esta,:grupo,:desde,:hasta,:cant)';

          IBQNacimientos.SQL.Add(query);
          IBQNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;
          IBQNacimientos.ParamByName('desde').Value := fechadesde;
          IBQNacimientos.ParamByName('hasta').Value := fechahasta;
          IBQNacimientos.ParamByName('cant').Value := cant_partos;
          IBQNacimientos.ParamByName('grupo').Value := DBLCBASeleccionPotrero.KeyValue;

          query := 'select * from rep_partos_distocicos(:establecimiento,:desde,:hasta,:grupo,null,:cant)';

          IBQRepPartosDistocicos.Close;
          IBQRepPartosDistocicos.SQL.Clear;
          IBQRepPartosDistocicos.SQL.Add(query);
          IBQRepPartosDistocicos.ParamByName('establecimiento').Value := FPrincipal.EstablecimientoActual;
          IBQRepPartosDistocicos.ParamByName('desde').Value := fechadesde;
          IBQRepPartosDistocicos.ParamByName('hasta').Value := fechahasta;
          IBQRepPartosDistocicos.ParamByName('cant').Value := cant_partos;
          IBQRepPartosDistocicos.ParamByName('grupo').Value := DBLCBASeleccionPotrero.KeyValue;
        end;

  HabilitarDesabilitarControles();
  CompletarMeses();

  consulta := IBQNacimientos.sql.text;
  traceList := TStringList.create();
  traceList.Clear;
  traceList.Add(consulta);
  traceList.SaveToFile('consultaReporte.txt');

  IBQNacimientos.Close;
  IBQNacimientos.Open;

  IBQRepPartosDistocicos.Close;
  IBQRepPartosDistocicos.Open;
  IBQRepPartosDistocicos.Last;
  IBQRepPartosDistocicos.First;
  _D_ArmarSeries();

  actualizarBotones;
  ArmarSeries2();

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFREPInfoGeneralPartos.actualizarBotones;
begin
  IPreview.Enabled := not(IBQNacimientos.IsEmpty);
  LPreview.Enabled := not(IBQNacimientos.IsEmpty);
  LExpExcel.Enabled := not(IBQNacimientos.IsEmpty);
  IExpExcel.Enabled := not(IBQNacimientos.IsEmpty);
end;

procedure TFREPInfoGeneralPartos.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFREPInfoGeneralPartos.AImprimirReporteExecute(Sender: TObject);
var cartel: TCartel;
    msje: String;
    aux1, aux2: Extended;
    i: Integer;
    AppPath : String;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del Informe General de Partos / Nacimientos ...';
  cartel.abrircartel(msje);

  Application.CreateForm(TFREPInfoGeneralPartosPreview, FREPInfoGeneralPartosPreview);
  DBCNacimientos.SaveToMetafile(ExtractFilePath(Application.ExeName)+'nacimientos.wmf');
  FREPInfoGeneralPartosPreview.QRINacimientos.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'nacimientos.wmf');

  DBCDistPesoNacer.SaveToMetafile(ExtractFilePath(Application.ExeName)+'distpeso.wmf');
  FREPInfoGeneralPartosPreview.QRIDistPeso.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'distpeso.wmf');

  FREPInfoGeneralPartosPreview.QRLabel35.Caption:= FormatFloat('#0.#',(cantMachosParaPromedioVivo + cantHembrasParaPromedioVivo));

  //////////////////////////////////DISTOCIA///////////////////////////////////////////////////
  if not CBAnalisis.Checked then
  begin
    FREPInfoGeneralPartosPreview.QRBand15.Enabled := false;
    FREPInfoGeneralPartosPreview.QRBand10.Enabled := false;
    FREPInfoGeneralPartosPreview.QRBand11.Enabled := false;
    FREPInfoGeneralPartosPreview.QRBand13.Enabled := false;
  end
  else
  begin
    FREPInfoGeneralPartosPreview.QRBand15.Enabled := true;
    FREPInfoGeneralPartosPreview.QRBand10.Enabled := true;
    FREPInfoGeneralPartosPreview.QRBand11.Enabled := true;
    FREPInfoGeneralPartosPreview.QRBand13.Enabled := true;
    _D_ArmarPreview(FREPInfoGeneralPartosPreview);
  end;
  //////////////////////////////////////////////////////////////////////////////////////////////

  if (RGTipo.ItemIndex = 0) then
    begin
       FREPInfoGeneralPartosPreview.QRLabel27.Enabled:= TRUE;
       FREPInfoGeneralPartosPreview.QRLabel28.Enabled:= TRUE;
       FREPInfoGeneralPartosPreview.QRLDesde.Enabled:= TRUE;
       FREPInfoGeneralPartosPreview.QRLPotrero.Enabled:= true;
       FREPInfoGeneralPartosPreview.QRLPotrero.Caption:= Traducir('Todos');
       FREPInfoGeneralPartosPreview.QRLDesde.Caption:= EAAnio.Text;
    end
   else
    if (RGTipo.ItemIndex = 1) then
      begin
       FREPInfoGeneralPartosPreview.QRLabel27.Enabled:= true;
       FREPInfoGeneralPartosPreview.QRLabel28.Enabled:= true;
       FREPInfoGeneralPartosPreview.QRLDesde.Enabled:= true;
       FREPInfoGeneralPartosPreview.QRLPotrero.Enabled:= true;
       FREPInfoGeneralPartosPreview.QRLPotreroSel.Enabled:= true;
       FREPInfoGeneralPartosPreview.QRLPotrero.Caption:= Traducir('Potrero');
       FREPInfoGeneralPartosPreview.QRLPotreroSel.Caption:= DBLCBASeleccionPotrero.Text;
       FREPInfoGeneralPartosPreview.QRLDesde.Caption:= EAAnio.Text;
      end
     else
      if (RGTipo.ItemIndex = 2) then
        begin
         FREPInfoGeneralPartosPreview.QRLabel27.Enabled:= true;
         FREPInfoGeneralPartosPreview.QRLabel28.Enabled:= true;
         FREPInfoGeneralPartosPreview.QRLDesde.Enabled:= true;
         FREPInfoGeneralPartosPreview.QRLPotrero.Enabled:= true;
         FREPInfoGeneralPartosPreview.QRLPotreroSel.Enabled:= true;
         FREPInfoGeneralPartosPreview.QRLPotrero.Caption:= Traducir('Rodeo');
         FREPInfoGeneralPartosPreview.QRLPotreroSel.Caption:= DBLCBASeleccionPotrero.Text;
         FREPInfoGeneralPartosPreview.QRLDesde.Caption:= EAAnio.Text;
        end
       else
        if (RGTipo.ItemIndex = 3) then
          begin
           FREPInfoGeneralPartosPreview.QRLabel27.Enabled:= true;
           FREPInfoGeneralPartosPreview.QRLabel28.Enabled:= true;
           FREPInfoGeneralPartosPreview.QRLDesde.Enabled:= true;
           FREPInfoGeneralPartosPreview.QRLPotrero.Enabled:= true;
           FREPInfoGeneralPartosPreview.QRLPotreroSel.Enabled:= true;
           FREPInfoGeneralPartosPreview.QRLPotrero.Caption:= Traducir('Grupo');
           FREPInfoGeneralPartosPreview.QRLPotreroSel.Caption:= DBLCBASeleccionPotrero.Text;
           FREPInfoGeneralPartosPreview.QRLDesde.Caption:= EAAnio.Text;
          end;

  FREPInfoGeneralPartosPreview.QRLMachosVivos.Caption:= IntToStr(cantMachosVivos);
  FREPInfoGeneralPartosPreview.QRLMachosMuertos.Caption:= IntToStr(cantMachosMuertos);
  FREPInfoGeneralPartosPreview.QRLHembrasVivas.Caption:= IntToStr(cantHembrasVivas);
  FREPInfoGeneralPartosPreview.QRLHembrasMuertas.Caption:= IntToStr(cantHembrasMuertas);
  FREPInfoGeneralPartosPreview.QRLDistVivos.Caption:= IntToStr(cantPartosDistociaVivos);
  FREPInfoGeneralPartosPreview.QRLDistMuertos.Caption:= IntToStr(cantPartosDistociaMuertos);
  FREPInfoGeneralPartosPreview.QRLPromVivos.Caption:= FormatFloat('#0.#',promPesoNacimientoVivo);
  FREPInfoGeneralPartosPreview.QRLPromMuertos.Caption:= FormatFloat('#0.#',promPesoNacimientoMuerto);

  FREPInfoGeneralPartosPreview.QRLTotalVivos.Caption:= IntToStr(StrToInt(FREPInfoGeneralPartosPreview.QRLMachosVivos.Caption) + StrToInt(FREPInfoGeneralPartosPreview.QRLHembrasVivas.Caption));
  FREPInfoGeneralPartosPreview.QRLTotalMuertos.Caption:= IntToStr(StrToInt(FREPInfoGeneralPartosPreview.QRLMachosMuertos.Caption) + StrToInt(FREPInfoGeneralPartosPreview.QRLHembrasMuertas.Caption));

  FREPInfoGeneralPartosPreview.QRLTotalMachos.Caption:= IntToStr(StrToInt(FREPInfoGeneralPartosPreview.QRLMachosVivos.Caption) + StrToInt(FREPInfoGeneralPartosPreview.QRLMachosMuertos.Caption));
  FREPInfoGeneralPartosPreview.QRLTotalHembras.Caption:= IntToStr(StrToInt(FREPInfoGeneralPartosPreview.QRLHembrasVivas.Caption) + StrToInt(FREPInfoGeneralPartosPreview.QRLHembrasMuertas.Caption));

  FREPInfoGeneralPartosPreview.QRLTotalTotal.Caption:= IntToStr(StrToInt(FREPInfoGeneralPartosPreview.QRLTotalVivos.Caption) + StrToInt(FREPInfoGeneralPartosPreview.QRLTotalMuertos.Caption));

  FREPInfoGeneralPartosPreview.QRLTotalDistocia.Caption:= IntToStr(StrToInt(FREPInfoGeneralPartosPreview.QRLDistVivos.Caption) + StrToInt(FREPInfoGeneralPartosPreview.QRLDistMuertos.Caption));

//  UREPResumenPartoPreview.QRLTotalPromedio.Caption:= FloatToStr(StrToFloat(FREPInfoGeneralPartosPreview.QRLPromVivos.Caption) + StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPromMuertos.Caption));

  FREPInfoGeneralPartosPreview.QRLPorcMachos.Caption:= FormatFloat('#0.#',100 * (StrToFloat(FREPInfoGeneralPartosPreview.QRLTotalMachos.Caption) / StrToFloat(FREPInfoGeneralPartosPreview.QRLTotalTotal.Caption)));

  FREPInfoGeneralPartosPreview.QRLPorcHembras.Caption:= FormatFloat('#0.#',100 * (StrToFloat(FREPInfoGeneralPartosPreview.QRLTotalHembras.Caption) / StrToFloat(FREPInfoGeneralPartosPreview.QRLTotalTotal.Caption)));

  FREPInfoGeneralPartosPreview.QRLTotalPorc.Caption:= '100';

  FREPInfoGeneralPartosPreview.QRLPorcPorc.Caption:= '100';

  FREPInfoGeneralPartosPreview.QRLPorcVivos.Caption:= FormatFloat('#0.#',100 * (StrToFloat(FREPInfoGeneralPartosPreview.QRLTotalVivos.Caption) / StrToFloat(FREPInfoGeneralPartosPreview.QRLTotalTotal.Caption)));

  FREPInfoGeneralPartosPreview.QRLPorcMuertos.Caption:= FormatFloat('#0.#',100 * (StrToFloat(FREPInfoGeneralPartosPreview.QRLTotalMuertos.Caption) / StrToFloat(FREPInfoGeneralPartosPreview.QRLTotalTotal.Caption)));

  FREPInfoGeneralPartosPreview.QRLPorcDistocia.Caption:= FormatFloat('#0.#',100 * (StrToFloat(FREPInfoGeneralPartosPreview.QRLTotalDistocia.Caption) / StrToFloat(FREPInfoGeneralPartosPreview.QRLTotalTotal.Caption)));

  FREPInfoGeneralPartosPreview.QRPromMachosVivos.Caption:= FormatFloat('#0.##',promPesoNacimientoVivoMacho);
  FREPInfoGeneralPartosPreview.QRPromMachosMuertos.Caption:= FormatFloat('#0.##',promPesoNacimientoMuertoMacho);
  FREPInfoGeneralPartosPreview.QRPromHembrasVivos.Caption:= FormatFloat('#0.##',promPesoNacimientoVivoHembra);
  FREPInfoGeneralPartosPreview.QRPromHembrasMuertas.Caption:= FormatFloat('#0.##',promPesoNacimientoMuertoHembra);


  aux1:= StrToFloat(FREPInfoGeneralPartosPreview.QRPromHembrasVivos.Caption);
  aux1:= aux1 * StrToInt(FREPInfoGeneralPartosPreview.QRLHembrasVivas.Caption);
  aux2:= StrToFloat(FREPInfoGeneralPartosPreview.QRPromHembrasMuertas.Caption);
  aux2:= aux2 * StrToInt(FREPInfoGeneralPartosPreview.QRLHembrasMuertas.Caption);

  if (StrToInt(FREPInfoGeneralPartosPreview.QRLTotalHembras.Caption) <> 0) then
    aux1:= (aux1 + aux2)/StrToInt(FREPInfoGeneralPartosPreview.QRLTotalHembras.Caption)
   else
     aux1:= 0;

  FREPInfoGeneralPartosPreview.QRLTotalPromedioHembra.Caption:= FormatFloat('#0.#',aux1);

  aux1:= StrToFloat(FREPInfoGeneralPartosPreview.QRPromMachosVivos.Caption);
  aux1:= aux1 * StrToInt(FREPInfoGeneralPartosPreview.QRLMachosVivos.Caption);
  aux2:= StrToFloat(FREPInfoGeneralPartosPreview.QRPromMachosMuertos.Caption);
  aux2:= aux2 * StrToInt(FREPInfoGeneralPartosPreview.QRLMachosMuertos.Caption);

  if (StrToInt(FREPInfoGeneralPartosPreview.QRLTotalMachos.Caption) <> 0) then
    aux1:= (aux1 + aux2)/StrToInt(FREPInfoGeneralPartosPreview.QRLTotalMachos.Caption)
   else
     aux1:= 0;

  FREPInfoGeneralPartosPreview.QRLTotalPromedioMacho.Caption:= FormatFloat('#0.#',aux1);

  aux1:= StrToFloat(FREPInfoGeneralPartosPreview.QRLPromVivos.Caption);
  aux1:= aux1 * (StrToInt(FREPInfoGeneralPartosPreview.QRLMachosVivos.Caption) + StrToInt(FREPInfoGeneralPartosPreview.QRLHembrasVivas.Caption));
  aux2:= StrToFloat(FREPInfoGeneralPartosPreview.QRLPromMuertos.Caption);
  aux2:= aux2 * (StrToInt(FREPInfoGeneralPartosPreview.QRLMachosMuertos.Caption) + StrToInt(FREPInfoGeneralPartosPreview.QRLHembrasMuertas.Caption));

  if ((StrToInt(FREPInfoGeneralPartosPreview.QRLTotalMachos.Caption) + StrToInt(FREPInfoGeneralPartosPreview.QRLTotalHembras.Caption)) <> 0) then
    aux1:= (aux1 + aux2)/(StrToInt(FREPInfoGeneralPartosPreview.QRLTotalMachos.Caption) + StrToInt(FREPInfoGeneralPartosPreview.QRLTotalHembras.Caption))
   else
     aux1:= 0;
     
  FREPInfoGeneralPartosPreview.QRLTotalPromedio.Caption:= FormatFloat('#0.#',aux1);


  {tabla meses}

  FREPInfoGeneralPartosPreview.tpmes1.Caption:= FloatToStr(TotalNacimientosNormalesMes[1]);
  FREPInfoGeneralPartosPreview.tpmes2.Caption:= FloatToStr(TotalNacimientosNormalesMes[2]);
  FREPInfoGeneralPartosPreview.tpmes3.Caption:= FloatToStr(TotalNacimientosNormalesMes[3]);
  FREPInfoGeneralPartosPreview.tpmes4.Caption:= FloatToStr(TotalNacimientosNormalesMes[4]);
  FREPInfoGeneralPartosPreview.tpmes5.Caption:= FloatToStr(TotalNacimientosNormalesMes[5]);
  FREPInfoGeneralPartosPreview.tpmes6.Caption:= FloatToStr(TotalNacimientosNormalesMes[6]);
  FREPInfoGeneralPartosPreview.tpmes7.Caption:= FloatToStr(TotalNacimientosNormalesMes[7]);
  FREPInfoGeneralPartosPreview.tpmes8.Caption:= FloatToStr(TotalNacimientosNormalesMes[8]);
  FREPInfoGeneralPartosPreview.tpmes9.Caption:= FloatToStr(TotalNacimientosNormalesMes[9]);
  FREPInfoGeneralPartosPreview.tpmes10.Caption:= FloatToStr(TotalNacimientosNormalesMes[10]);
  FREPInfoGeneralPartosPreview.tpmes11.Caption:= FloatToStr(TotalNacimientosNormalesMes[11]);
  FREPInfoGeneralPartosPreview.tpmes12.Caption:= FloatToStr(TotalNacimientosNormalesMes[12]);

  FREPInfoGeneralPartosPreview.tpdmes1.Caption:= FloatToStr(TotalNacimientosDistocicosMes[1]);
  FREPInfoGeneralPartosPreview.tpdmes2.Caption:= FloatToStr(TotalNacimientosDistocicosMes[2]);
  FREPInfoGeneralPartosPreview.tpdmes3.Caption:= FloatToStr(TotalNacimientosDistocicosMes[3]);
  FREPInfoGeneralPartosPreview.tpdmes4.Caption:= FloatToStr(TotalNacimientosDistocicosMes[4]);
  FREPInfoGeneralPartosPreview.tpdmes5.Caption:= FloatToStr(TotalNacimientosDistocicosMes[5]);
  FREPInfoGeneralPartosPreview.tpdmes6.Caption:= FloatToStr(TotalNacimientosDistocicosMes[6]);
  FREPInfoGeneralPartosPreview.tpdmes7.Caption:= FloatToStr(TotalNacimientosDistocicosMes[7]);
  FREPInfoGeneralPartosPreview.tpdmes8.Caption:= FloatToStr(TotalNacimientosDistocicosMes[8]);
  FREPInfoGeneralPartosPreview.tpdmes9.Caption:= FloatToStr(TotalNacimientosDistocicosMes[9]);
  FREPInfoGeneralPartosPreview.tpdmes10.Caption:= FloatToStr(TotalNacimientosDistocicosMes[10]);
  FREPInfoGeneralPartosPreview.tpdmes11.Caption:= FloatToStr(TotalNacimientosDistocicosMes[11]);
  FREPInfoGeneralPartosPreview.tpdmes12.Caption:= FloatToStr(TotalNacimientosDistocicosMes[12]);
                                                   


  FREPInfoGeneralPartosPreview.totalpartos.Caption:= FloatToStr(totalnacnormalmes);
  FREPInfoGeneralPartosPreview.totalpartosdistocicos.Caption:= FloatToStr(totalnacdistomes);

  if ((totalnacnormalmes + totalnacdistomes) <> 0) then   //probar todos los casos
    begin
      FREPInfoGeneralPartosPreview.porcentajePartoDistocicos.Caption:= FormatFloat('#0.#',(totalnacdistomes/(totalnacnormalmes + totalnacdistomes))*100);
    end;

  if ((totalnacnormalmes + totalnacdistomes) <> 0) then
    begin
      FREPInfoGeneralPartosPreview.porcAcumMes1.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[1]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes2.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[2]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes3.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[3]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes4.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[4]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes5.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[5]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes6.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[6]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes7.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[7]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes8.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[8]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes9.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[9]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes10.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[10]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes11.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[11]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumMes12.Caption:= FormatFloat('#0.#',(TotalNacimientosAcumuladoMes[12]/(totalnacnormalmes + totalnacdistomes))*100);
      FREPInfoGeneralPartosPreview.porcAcumTotal.Caption:= '100';
    end
   else
      begin
        FREPInfoGeneralPartosPreview.porcAcumMes1.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumMes2.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumMes3.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumMes4.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumMes5.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumMes6.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumMes7.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumMes8.Caption:= '0';;
        FREPInfoGeneralPartosPreview.porcAcumMes9.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumMes10.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumMes11.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumMes12.Caption:= '0';
        FREPInfoGeneralPartosPreview.porcAcumTotal.Caption:= '0';
      end;

  {tabla meses}


  if not(CBListado.Checked) then
  begin
    FREPInfoGeneralPartosPreview.QRGroup1.Enabled := false;
    FREPInfoGeneralPartosPreview.QRBand12.Enabled := false;
  end;

  cartel.cerrarcartel();
  cartel.FreeInstance();

  FREPInfoGeneralPartosPreview.ShowModal;
  FREPInfoGeneralPartosPreview.Destroy;
  HabilitarDesabilitarControles();  

end;

procedure TFREPInfoGeneralPartos.DBLCBASeleccionPotreroCloseUp(Sender: TObject);
begin
  inherited;
 // actualizarFiltro;
end;

procedure TFREPInfoGeneralPartos.DTPADesdeChange(Sender: TObject);
begin
  inherited;
 // actualizarFiltro;
end;

procedure TFREPInfoGeneralPartos.DTPAHastaChange(Sender: TObject);
begin
  inherited;
//  actualizarFiltro;
end;

procedure TFREPInfoGeneralPartos.BitDBGrid1DblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BitDBGrid1.SelectedIndex = 0 then
  begin
    if not(IBQNacimientos.eof) then
    begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQNacimientos.fieldByName('id_madre').AsInteger;
      F.ShowModal;
      F.Destroy;
    end;
  end
  else
  begin
    if BitDBGrid1.SelectedIndex = 9 then
    begin
      if not(IBQNacimientos.eof) then
      begin
        F := TFREPFichaAnimal.Create(self);
        F.animal := IBQNacimientos.fieldByName('id_animal').AsInteger;
        F.ShowModal;
        F.Destroy;
      end;
    end;
  end;
end;

procedure TFREPInfoGeneralPartos.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPInfoGeneralPartos.IBQNacimientosAfterOpen(DataSet: TDataSet);
begin
  inherited;

  IBQNacimientos.Last;
  IBQNacimientos.First;
  BitDBGrid1.DataSource := DSNacimientos;
  GBResumenParto.Caption := Traducir('Animales [')+IntToStr(IBQNacimientos.RecordCount)+']';
  BBImprimirReporte.Enabled := not(IBQNacimientos.IsEmpty);
  BBXls.Enabled := not(IBQNacimientos.IsEmpty);
end;

procedure TFREPInfoGeneralPartos.DBLCBASeleccionPotreroKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBASeleccionPotrero.ListVisible) then
  //  actualizarFiltro;
end;

procedure TFREPInfoGeneralPartos.BitDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BitDBGrid1DblClick(nil);
end;


procedure TFREPInfoGeneralPartos.CrearSeries();
begin
  CantNacimientosDistocicos := TBarSeries.Create(nil);
  CantNacimientosDistocicos.Title := ' ';
  CantNacimientosDistocicos.Name := 'CNacDistocico';
  CantNacimientosDistocicos.SeriesColor := clRed;
  CantNacimientosDistocicos.Marks.Visible := false;
  CantNacimientosDistocicos.Title:='Nacimientos Distocicos';

  CantNacimientosDistocicosMes := TBarSeries.Create(nil);
  CantNacimientosDistocicosMes.Title := ' ';
  CantNacimientosDistocicosMes.Name := 'CNacDistocicoMes';
  CantNacimientosDistocicosMes.SeriesColor := clRed;
  CantNacimientosDistocicosMes.Marks.Visible := false;
  CantNacimientosDistocicosMes.Title:='Nacimientos Distocicos';
  
  CantNacimientosNormales := TBarSeries.Create(nil);
  CantNacimientosNormales.Title := ' ';
  CantNacimientosNormales.Name := 'CNacNormal';
  CantNacimientosNormales.SeriesColor := clGreen;

  CantNacimientosNormales.Marks.Visible := false;
  CantNacimientosNormales.Title:='Nacimientos Normales';



  CantNacimientosNormalesMes := TBarSeries.Create(nil);
  CantNacimientosNormalesMes.Title := ' ';
  CantNacimientosNormalesMes.Name := 'CNacNormalMes';
  CantNacimientosNormalesMes.SeriesColor := clGreen;

  CantNacimientosNormalesMes.Marks.Visible := false;
  CantNacimientosNormalesMes.Title:='Nacimientos Normales';

  CantNacimientosAcumulado := TLineSeries.Create(nil);
  CantNacimientosAcumulado.Title := ' ';
  CantNacimientosAcumulado.Name := 'CNacAcumulado';
  CantNacimientosAcumulado.SeriesColor := $0015A479;
  CantNacimientosAcumulado.LinePen.Width := 4;
  CantNacimientosAcumulado.Marks.Visible := false;
  CantNacimientosAcumulado.Title:='Acumulado';

  CantNacimientosAcumulado.VertAxis:= aRightAxis;
  CantNacimientosAcumulado.PercentFormat := '#0.# %';
//  CantNacimientosAcumulado.Marks.Style := smsPercent;
  
  DistPesoMacho := TBarSeries.Create(nil);
  DistPesoMacho.Title := ' ';
  DistPesoMacho.Name := 'DPesoMacho';
  DistPesoMacho.SeriesColor := clRed;
  DistPesoMacho.Marks.Visible := false;
  DistPesoMacho.Title:='Macho';

  DistPesoHembra := TBarSeries.Create(nil);
  DistPesoHembra.Title := ' ';
  DistPesoHembra.Name := 'DPesoHembra';
  DistPesoHembra.SeriesColor := clGreen;
  DistPesoHembra.Marks.Visible := false;
  DistPesoHembra.Title:='Hembra';

  DistPesoAcumulado := TLineSeries.Create(nil);
  DistPesoAcumulado.Title := ' ';
  DistPesoAcumulado.Name := 'DPesoAcum';
  DistPesoAcumulado.SeriesColor := clBlue;
  DistPesoAcumulado.Marks.Visible := false;
  DistPesoAcumulado.Title:='Acumulado';

  _D_CrearSeries(); //Graficos de Distocia

end;

procedure TFREPInfoGeneralPartos.ArmarSeries();
var
  ArregloDistPesoMacho, ArregloDistPesoHembra, ArregloDistPesoTotal, ArregloDistPesoAcum: Array of Double;
  i: integer;
begin
  DBCNacimientos.SeriesList.Clear;
  DBCDistPesoNacer.SeriesList.Clear;
  if (CBSemanal.Checked) then
   begin
    for i := 1 to 48 do
     begin
        TotalNacimientosNormales[i]:= 0;
        TotalNacimientosDistocicos[i]:= 0;

        if (i<= 12) then
          begin
            TotalNacimientosNormalesMes[i]:= 0;
            TotalNacimientosDistocicosMes[i]:= 0;
          end;
     end;


    IBQCantNacimientos.First;
    while not(IBQCantNacimientos.Eof) do
      begin
        TotalNacimientosNormales[GetPosSegunRangoMes(IBQCantNacimientos.FieldByName('mes').AsInteger,IBQCantNacimientos.FieldByName('rangomes').AsString)]:= TotalNacimientosNormales[GetPosSegunRangoMes(IBQCantNacimientos.FieldByName('mes').AsInteger,IBQCantNacimientos.FieldByName('rangomes').AsString)] + IBQCantNacimientos.FieldByName('cantpartosnormales').AsInteger;
        TotalNacimientosDistocicos[GetPosSegunRangoMes(IBQCantNacimientos.FieldByName('mes').AsInteger,IBQCantNacimientos.FieldByName('rangomes').AsString)]:= TotalNacimientosDistocicos[GetPosSegunRangoMes(IBQCantNacimientos.FieldByName('mes').AsInteger,IBQCantNacimientos.FieldByName('rangomes').AsString)] + IBQCantNacimientos.FieldByName('cantpartosdistocicos').AsInteger;

        TotalNacimientosNormalesMes[IBQCantNacimientos.FieldByName('mes').AsInteger]:= TotalNacimientosNormalesMes[IBQCantNacimientos.FieldByName('mes').AsInteger] + IBQCantNacimientos.FieldByName('cantpartosnormales').AsInteger;
        TotalNacimientosDistocicosMes[IBQCantNacimientos.FieldByName('mes').AsInteger]:= TotalNacimientosDistocicosMes[IBQCantNacimientos.FieldByName('mes').AsInteger] + IBQCantNacimientos.FieldByName('cantpartosdistocicos').AsInteger;
        IBQCantNacimientos.Next;
      end;

    for i := 1 to 48 do
      TotalNacimientos[i]:= TotalNacimientosNormales[i] + TotalNacimientosDistocicos[i];

    CantNacimientosDistocicos.Clear;
    DBCNacimientos.AddSeries(CantNacimientosDistocicos);
    CantNacimientosDistocicos.MultiBar:= mbStacked;
    CantNacimientosDistocicos.AddArray(TotalNacimientosDistocicos);      

    CantNacimientosNormales.Clear;
    DBCNacimientos.AddSeries(CantNacimientosNormales);
    CantNacimientosNormales.MultiBar:= mbStacked;
    CantNacimientosNormales.AddArray(TotalNacimientosNormales);

    for i := 1 to 48 do
     begin
        if (i = 1) then
          TotalNacimientosAcumulado[i]:= TotalNacimientos[i]
         else
            TotalNacimientosAcumulado[i]:= TotalNacimientos[i] + TotalNacimientosAcumulado[i-1];
     end;
     
    if (CBAcumulado.Checked) then
      begin
        CantNacimientosAcumulado.Clear;
        DBCNacimientos.AddSeries(CantNacimientosAcumulado);
        CantNacimientosAcumulado.AddArray(TotalNacimientosAcumulado);
      end;
   end
  else
    if (CBMensual.Checked) then
      begin
        for i := 1 to 12 do
         begin
            TotalNacimientosNormalesMes[i]:= 0;
            TotalNacimientosDistocicosMes[i]:= 0;
         end;

        IBQCantNacimientos.First;
        while not(IBQCantNacimientos.Eof) do
          begin
            TotalNacimientosNormalesMes[IBQCantNacimientos.FieldByName('mes').AsInteger]:= TotalNacimientosNormalesMes[IBQCantNacimientos.FieldByName('mes').AsInteger] + IBQCantNacimientos.FieldByName('cantpartosnormales').AsInteger;
            TotalNacimientosDistocicosMes[IBQCantNacimientos.FieldByName('mes').AsInteger]:= TotalNacimientosDistocicosMes[IBQCantNacimientos.FieldByName('mes').AsInteger] + IBQCantNacimientos.FieldByName('cantpartosdistocicos').AsInteger;
            IBQCantNacimientos.Next;
          end;

        for i := 1 to 12 do
          TotalNacimientosMes[i]:= TotalNacimientosNormalesMes[i] + TotalNacimientosDistocicosMes[i];

        CantNacimientosDistocicosMes.Clear;
        DBCNacimientos.AddSeries(CantNacimientosDistocicosMes);
        CantNacimientosDistocicosMes.MultiBar:= mbStacked;
        CantNacimientosDistocicosMes.AddArray(TotalNacimientosDistocicosMes);

        CantNacimientosNormalesMes.Clear;
        DBCNacimientos.AddSeries(CantNacimientosNormalesMes);
        CantNacimientosNormalesMes.MultiBar:= mbStacked;
        CantNacimientosNormalesMes.AddArray(TotalNacimientosNormalesMes);

        for i := 1 to 12 do
         begin
            if (i = 1) then
              TotalNacimientosAcumuladoMes[i]:= TotalNacimientosMes[i]
             else
                TotalNacimientosAcumuladoMes[i]:= TotalNacimientosMes[i] + TotalNacimientosAcumuladoMes[i-1];
         end;

        if (CBAcumulado.Checked) then
          begin
            CantNacimientosAcumulado.Clear;
            DBCNacimientos.AddSeries(CantNacimientosAcumulado);
            CantNacimientosAcumulado.AddArray(TotalNacimientosAcumuladoMes);
          end;
      end;

  VerMeses();
 {/*/*/*/*/*}

  ArregloDistPesoMacho:= nil;
  ArregloDistPesoHembra:= nil;
  setLength(ArregloDistPesoMacho,maxpeso-minpeso+2);  //mal
  setLength(ArregloDistPesoHembra,maxpeso-minpeso+2);

  for i := 0 to Length(ArregloDistPesoMacho) - 1 do
   begin
      ArregloDistPesoMacho[i]:= 0;
      ArregloDistPesoHembra[i]:= 0;
   end;

  IBQDistPesoNacer.First;
  while not(IBQDistPesoNacer.Eof) do
    begin
      if (IBQDistPesoNacer.FieldByName('sexo').AsString = 'MACHO') then
        ArregloDistPesoMacho[IBQDistPesoNacer.FieldByName('peso').AsInteger]:= IBQDistPesoNacer.FieldByName('cantsexo').AsInteger;

      if (IBQDistPesoNacer.FieldByName('sexo').AsString = 'HEMBRA') then
        ArregloDistPesoHembra[IBQDistPesoNacer.FieldByName('peso').AsInteger]:= IBQDistPesoNacer.FieldByName('cantsexo').AsInteger;

      IBQDistPesoNacer.Next;
    end;

  ArregloDistPesoTotal:= nil;
  setLength(ArregloDistPesoTotal,maxpeso-minpeso+2);

  ArregloDistPesoAcum:= nil;
  setLength(ArregloDistPesoAcum,maxpeso-minpeso+2);

  for i := 0 to Length(ArregloDistPesoMacho) - 1 do
   begin
      ArregloDistPesoTotal[i]:= ArregloDistPesoMacho[i] + ArregloDistPesoHembra[i];
      if (i = 0) then
        ArregloDistPesoAcum[i]:= ArregloDistPesoTotal[i]
       else
          ArregloDistPesoAcum[i]:= ArregloDistPesoTotal[i] + ArregloDistPesoAcum[i-1];
   end;


  DistPesoMacho.Clear;
  DBCDistPesoNacer.AddSeries(DistPesoMacho);
  DistPesoMacho.AddArray(ArregloDistPesoMacho);

  DistPesoHembra.Clear;
  DBCDistPesoNacer.AddSeries(DistPesoHembra);
  DistPesoHembra.AddArray(ArregloDistPesoHembra);

  DistPesoAcumulado.Clear;
  DBCDistPesoNacer.AddSeries(DistPesoAcumulado);
  DistPesoAcumulado.AddArray(ArregloDistPesoAcum);

end;

//*/*/*/*/*/*/*/*

procedure TFREPInfoGeneralPartos.ArmarSeries2();
var
  ArregloDistPesoMacho, ArregloDistPesoHembra, ArregloDistPesoTotal, ArregloDistPesoAcum: Array of Double;
  i, j, h, contMaxPeso: Integer;
begin
  DBCNacimientos.SeriesList.Clear;
  DBCDistPesoNacer.SeriesList.Clear;

  ArregloDistPesoMacho:= nil;
  ArregloDistPesoHembra:= nil;
  setLength(ArregloDistPesoMacho,maxpeso);
  setLength(ArregloDistPesoHembra,maxpeso);

  cantMachosVivos:= 0;   //
  cantMachosMuertos:= 0; //
  cantHembrasVivas:= 0;  //
  cantHembrasMuertas:= 0;//
  cantPartosDistociaVivos:= 0; //
  cantPartosDistociaMuertos:= 0; //

  promPesoNacimientoVivo:= 0;
  promPesoNacimientoMuerto:= 0;
  promPesoNacimientoVivoMacho:= 0;//
  promPesoNacimientoMuertoMacho:= 0; //
  promPesoNacimientoVivoHembra:= 0; //
  promPesoNacimientoMuertoHembra:= 0; //

  cantMachosParaPromedioVivo:= 0;
  cantHembrasParaPromedioVivo:= 0;
  cantMachosParaPromedioMuerto:= 0;
  cantHembrasParaPromedioMuerto:= 0;

  cantMachosParaPromedioVivo:= 0;
  cantMachosParaPromedioMuerto:= 0;
  cantHembrasParaPromedioVivo:= 0;
  cantHembrasParaPromedioMuerto:= 0;  

  BitDBGrid1.DataSource:= nil;

  for i := 0 to Length(ArregloDistPesoMacho) - 1 do
   begin
      ArregloDistPesoMacho[i]:= 0;
      ArregloDistPesoHembra[i]:= 0;
   end;

  if (CBSemanal.Checked) then
   begin
    for i := 1 to 48 do
     begin
        TotalNacimientosNormales[i]:= 0;
        TotalNacimientosDistocicos[i]:= 0;
        TotalNacimientosAcumulado[i]:= 0;

        if (i<= 12) then
          begin
            TotalNacimientosNormalesMes[i]:= 0;
            TotalNacimientosDistocicosMes[i]:= 0;
            TotalNacimientosAcumuladoMes[i]:= 0;
          end;
     end;


    IBQNacimientos.First;
    while not(IBQNacimientos.Eof) do
      begin
        TotalNacimientosNormales[GetPosSegunRangoMes(IBQNacimientos.FieldByName('mes').AsInteger,IBQNacimientos.FieldByName('rangomes').AsString)]:= TotalNacimientosNormales[GetPosSegunRangoMes(IBQNacimientos.FieldByName('mes').AsInteger,IBQNacimientos.FieldByName('rangomes').AsString)] + IBQNacimientos.FieldByName('cantpartosnormales').AsInteger;
        TotalNacimientosDistocicos[GetPosSegunRangoMes(IBQNacimientos.FieldByName('mes').AsInteger,IBQNacimientos.FieldByName('rangomes').AsString)]:= TotalNacimientosDistocicos[GetPosSegunRangoMes(IBQNacimientos.FieldByName('mes').AsInteger,IBQNacimientos.FieldByName('rangomes').AsString)] + IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger;

        TotalNacimientosNormalesMes[IBQNacimientos.FieldByName('mes').AsInteger]:= TotalNacimientosNormalesMes[IBQNacimientos.FieldByName('mes').AsInteger] + IBQNacimientos.FieldByName('cantpartosnormales').AsInteger;
        TotalNacimientosDistocicosMes[IBQNacimientos.FieldByName('mes').AsInteger]:= TotalNacimientosDistocicosMes[IBQNacimientos.FieldByName('mes').AsInteger] + IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger;

        if (IBQNacimientos.FieldByName('sexo').AsString = 'MACHO') then
          begin
            if (IBQNacimientos.FieldByName('vivo').AsString = 'SI') then
              begin
                inc(cantMachosVivos);
                if (IBQNacimientos.FieldByName('peso').AsInteger <> 0) then
                  begin
                    ArregloDistPesoMacho[IBQNacimientos.FieldByName('peso').AsInteger]:= ArregloDistPesoMacho[IBQNacimientos.FieldByName('peso').AsInteger] + 1;
                    promPesoNacimientoVivoMacho:= promPesoNacimientoVivoMacho + IBQNacimientos.FieldByName('peso').AsInteger;
                    inc(cantMachosParaPromedioVivo);
                  end;

                if (IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger = 1) then
                   inc(cantPartosDistociaVivos);
              end
             else
               begin
                 inc(cantMachosMuertos);
                 if (IBQNacimientos.FieldByName('peso').AsInteger <> 0) then
                   begin
                     ArregloDistPesoMacho[IBQNacimientos.FieldByName('peso').AsInteger]:= ArregloDistPesoMacho[IBQNacimientos.FieldByName('peso').AsInteger] + 1;
                     promPesoNacimientoMuertoMacho:= promPesoNacimientoMuertoMacho + IBQNacimientos.FieldByName('peso').AsInteger;
                     inc(cantMachosParaPromedioMuerto);
                   end;

                 if (IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger = 1) then
                   inc(cantPartosDistociaMuertos);
               end
          end;

        if (IBQNacimientos.FieldByName('sexo').AsString = 'HEMBRA') then
          begin
            if (IBQNacimientos.FieldByName('vivo').AsString = 'SI') then
              begin
                 inc(cantHembrasVivas);
                 if (IBQNacimientos.FieldByName('peso').AsInteger <> 0) then
                   begin
                     ArregloDistPesoHembra[IBQNacimientos.FieldByName('peso').AsInteger]:= ArregloDistPesoHembra[IBQNacimientos.FieldByName('peso').AsInteger] + 1;
                     promPesoNacimientoVivoHembra:= promPesoNacimientoVivoHembra + IBQNacimientos.FieldByName('peso').AsInteger;
                     inc(cantHembrasParaPromedioVivo);
                   end;

                 if (IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger = 1) then
                    inc(cantPartosDistociaVivos);
              end
             else
                begin
                  inc(cantHembrasMuertas);
                  if (IBQNacimientos.FieldByName('peso').AsInteger <> 0) then
                    begin
                      ArregloDistPesoHembra[IBQNacimientos.FieldByName('peso').AsInteger]:= ArregloDistPesoHembra[IBQNacimientos.FieldByName('peso').AsInteger] + 1;
                      promPesoNacimientoMuertoHembra:= promPesoNacimientoMuertoHembra + IBQNacimientos.FieldByName('peso').AsInteger;
                      inc(cantHembrasParaPromedioMuerto);
                    end;

                  if (IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger = 1) then
                     inc(cantPartosDistociaMuertos);
                end;
          end;
        IBQNacimientos.Next;
      end;



    for i := 1 to 48 do
      TotalNacimientos[i]:= TotalNacimientosNormales[i] + TotalNacimientosDistocicos[i];

    CantNacimientosDistocicos.Clear;
    DBCNacimientos.AddSeries(CantNacimientosDistocicos);
    CantNacimientosDistocicos.MultiBar:= mbStacked;
    CantNacimientosDistocicos.AddArray(TotalNacimientosDistocicos);

    CantNacimientosNormales.Clear;
    DBCNacimientos.AddSeries(CantNacimientosNormales);
    CantNacimientosNormales.MultiBar:= mbStacked;
    CantNacimientosNormales.AddArray(TotalNacimientosNormales);


    for i := 1 to 48 do
     begin
        if (i = 1) then
          TotalNacimientosAcumulado[i]:= TotalNacimientos[i]
         else
            TotalNacimientosAcumulado[i]:= TotalNacimientos[i] + TotalNacimientosAcumulado[i-1];
     end;

    h:= 1; //revisarlo  bien es para el primer cuadro del preview % distocico

    j:= 4;
    while (h <= 12) do
     begin
       TotalNacimientosAcumuladoMes[h]:= TotalNacimientosAcumuladoMes[h] + TotalNacimientosAcumulado[j];
       inc(h);
       j:= j + 4;
     end;

    if (CBAcumulado.Checked) then
      begin
        CantNacimientosAcumulado.Clear;
        DBCNacimientos.AddSeries(CantNacimientosAcumulado);
        CantNacimientosAcumulado.AddArray(TotalNacimientosAcumulado);
      end;
   end
  else
    if (CBMensual.Checked) then
      begin
        for i := 1 to 12 do
         begin
            TotalNacimientosNormalesMes[i]:= 0;
            TotalNacimientosDistocicosMes[i]:= 0;
            TotalNacimientosAcumuladoMes[i]:= 0;
         end;

        IBQNacimientos.First;
        while not(IBQNacimientos.Eof) do
          begin
            TotalNacimientosNormalesMes[IBQNacimientos.FieldByName('mes').AsInteger]:= TotalNacimientosNormalesMes[IBQNacimientos.FieldByName('mes').AsInteger] + IBQNacimientos.FieldByName('cantpartosnormales').AsInteger;
            TotalNacimientosDistocicosMes[IBQNacimientos.FieldByName('mes').AsInteger]:= TotalNacimientosDistocicosMes[IBQNacimientos.FieldByName('mes').AsInteger] + IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger;

            if (IBQNacimientos.FieldByName('sexo').AsString = 'MACHO') then
              begin
                 if (IBQNacimientos.FieldByName('vivo').AsString = 'SI') then
                   begin
                     inc(cantMachosVivos);
                     if (IBQNacimientos.FieldByName('peso').AsInteger <> 0) then
                      begin
                        ArregloDistPesoMacho[IBQNacimientos.FieldByName('peso').AsInteger]:= ArregloDistPesoMacho[IBQNacimientos.FieldByName('peso').AsInteger] + 1;
                        promPesoNacimientoVivoMacho:= promPesoNacimientoVivoMacho + IBQNacimientos.FieldByName('peso').AsInteger;
                        inc(cantMachosParaPromedioVivo);
                      end;

                     if (IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger = 1) then
                        inc(cantPartosDistociaVivos);
                   end
                  else
                    begin
                      inc(cantMachosMuertos);
                      if (IBQNacimientos.FieldByName('peso').AsInteger <> 0) then
                        begin
                          ArregloDistPesoMacho[IBQNacimientos.FieldByName('peso').AsInteger]:= ArregloDistPesoMacho[IBQNacimientos.FieldByName('peso').AsInteger] + 1;
                          promPesoNacimientoMuertoMacho:= promPesoNacimientoMuertoMacho + IBQNacimientos.FieldByName('peso').AsInteger;
                          inc(cantMachosParaPromedioMuerto);
                        end;
                      if (IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger = 1) then
                        inc(cantPartosDistociaMuertos);
                    end
              end;

            if (IBQNacimientos.FieldByName('sexo').AsString = 'HEMBRA') then
              begin
                 if (IBQNacimientos.FieldByName('vivo').AsString = 'SI') then
                   begin
                      inc(cantHembrasVivas);
                      if (IBQNacimientos.FieldByName('peso').AsInteger <> 0) then
                        begin
                          ArregloDistPesoHembra[IBQNacimientos.FieldByName('peso').AsInteger]:= ArregloDistPesoHembra[IBQNacimientos.FieldByName('peso').AsInteger] + 1;
                          promPesoNacimientoVivoHembra:= promPesoNacimientoVivoHembra + IBQNacimientos.FieldByName('peso').AsInteger;
                          inc(cantHembrasParaPromedioVivo);
                        end;

                      if (IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger = 1) then
                         inc(cantPartosDistociaVivos);
                   end
                  else
                     begin
                       inc(cantHembrasMuertas);
                       if (IBQNacimientos.FieldByName('peso').AsInteger <> 0) then
                         begin
                           ArregloDistPesoHembra[IBQNacimientos.FieldByName('peso').AsInteger]:= ArregloDistPesoHembra[IBQNacimientos.FieldByName('peso').AsInteger] + 1;
                           promPesoNacimientoMuertoHembra:= promPesoNacimientoMuertoHembra + IBQNacimientos.FieldByName('peso').AsInteger;
                           inc(cantHembrasParaPromedioMuerto);
                         end;

                       if (IBQNacimientos.FieldByName('cantpartosdistocicos').AsInteger = 1) then
                          inc(cantPartosDistociaMuertos);
                     end;
               end;

            IBQNacimientos.Next;
          end;

        for i := 1 to 12 do
          TotalNacimientosMes[i]:= TotalNacimientosNormalesMes[i] + TotalNacimientosDistocicosMes[i];

        CantNacimientosDistocicosMes.Clear;
        DBCNacimientos.AddSeries(CantNacimientosDistocicosMes);
        CantNacimientosDistocicosMes.MultiBar:= mbStacked;
        CantNacimientosDistocicosMes.AddArray(TotalNacimientosDistocicosMes);

        CantNacimientosNormalesMes.Clear;
        DBCNacimientos.AddSeries(CantNacimientosNormalesMes);
        CantNacimientosNormalesMes.MultiBar:= mbStacked;
        CantNacimientosNormalesMes.AddArray(TotalNacimientosNormalesMes);

        for i := 1 to 12 do
         begin
            if (i = 1) then
              TotalNacimientosAcumuladoMes[i]:= TotalNacimientosMes[i]
             else
                TotalNacimientosAcumuladoMes[i]:= TotalNacimientosMes[i] + TotalNacimientosAcumuladoMes[i-1];
         end;

        if (CBAcumulado.Checked) then
          begin
            CantNacimientosAcumulado.Clear;
            DBCNacimientos.AddSeries(CantNacimientosAcumulado);
            CantNacimientosAcumulado.AddArray(TotalNacimientosAcumuladoMes);
          end;
      end;

  VerMeses();
 {/*/*/*/*/*}

 if ((promPesoNacimientoVivoMacho + promPesoNacimientoVivoHembra) <> 0) then
    promPesoNacimientoVivo:= (promPesoNacimientoVivoMacho + promPesoNacimientoVivoHembra)/(cantMachosParaPromedioVivo + cantHembrasParaPromedioVivo)
  else
    promPesoNacimientoVivo:= 0;

 if ((promPesoNacimientoMuertoMacho + promPesoNacimientoMuertoHembra) <> 0) then
    promPesoNacimientoMuerto:= (promPesoNacimientoMuertoMacho + promPesoNacimientoMuertoHembra)/(cantMachosParaPromedioMuerto + cantHembrasParaPromedioMuerto)
  else
    promPesoNacimientoMuerto:= 0;

 if (cantMachosParaPromedioVivo <> 0) then
   promPesoNacimientoVivoMacho:= promPesoNacimientoVivoMacho / cantMachosParaPromedioVivo
  else
    promPesoNacimientoVivoMacho:= 0;

 if (cantMachosParaPromedioMuerto <> 0) then
   promPesoNacimientoMuertoMacho:= promPesoNacimientoMuertoMacho / cantMachosParaPromedioMuerto
  else
    promPesoNacimientoMuertoMacho:= 0;

 if (cantHembrasParaPromedioVivo <> 0) then
   promPesoNacimientoVivoHembra:= promPesoNacimientoVivoHembra / cantHembrasParaPromedioVivo
  else
    promPesoNacimientoVivoHembra:= 0;

 if (cantHembrasParaPromedioMuerto <> 0) then
   promPesoNacimientoMuertoHembra:= promPesoNacimientoMuertoHembra / cantHembrasParaPromedioMuerto
  else
    promPesoNacimientoMuertoHembra:= 0;



  ArregloDistPesoTotal:= nil;
  setLength(ArregloDistPesoTotal,maxpeso);

  ArregloDistPesoAcum:= nil;
  setLength(ArregloDistPesoAcum,maxpeso);
  contMaxPeso:= maxpeso;
  for i := 0 to Length(ArregloDistPesoTotal) - 1 do
   begin
      ArregloDistPesoTotal[i]:= ArregloDistPesoMacho[i] + ArregloDistPesoHembra[i];
      if (ArregloDistPesoTotal[i] <> 0) then
        contMaxPeso:= i;
   end;

  totalnacnormalmes:= 0;
  totalnacdistomes:= 0;
  for i:= 1 to 12 do
    begin
      totalnacnormalmes:= totalnacnormalmes + TotalNacimientosNormalesMes[i];
      totalnacdistomes:= totalnacdistomes + TotalNacimientosDistocicosMes[i];
    end;

  DBCDistPesoNacer.BottomAxis.Maximum:= contMaxPeso + 2;
  DBCDistPesoNacer.BottomAxis.Minimum:= minpeso - 10; 
  DBCDistPesoNacer.BottomAxis.Increment:= 1;


  DistPesoMacho.Clear;
  DBCDistPesoNacer.AddSeries(DistPesoMacho);
  DistPesoMacho.AddArray(ArregloDistPesoMacho);

  DistPesoHembra.Clear;
  DBCDistPesoNacer.AddSeries(DistPesoHembra);
  DistPesoHembra.AddArray(ArregloDistPesoHembra);

  BitDBGrid1.DataSource:= DSNacimientos;
end;

//*/*/*/*/*/*/*/*

procedure TFREPInfoGeneralPartos.DBCNacimientosGetAxisLabel(
  Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
  var LabelText: String);
var valor: Integer;
begin
  inherited;
  if (Sender.Horizontal) then
  begin
   if (CBSemanal.Checked) then
   begin
     if TryStrToInt(LabelText,valor) then
       if ((valor >= 0) and (valor <= 48)) then
        LabelText:= LabelNacimientos[valor+1];
   end
    else
      if (CBMensual.Checked) then
        LabelText:= (GetMeses(Trunc(StrToFloat(LabelText)+1)));
  end;
end;

function TFREPInfoGeneralPartos.GetMeses(mes : integer) : String;
begin
  case mes of
    0 : Result := 'Diciembre';
    1 : Result := 'Enero';
    2 : Result := 'Febrero';
    3 : Result := 'Marzo';
    4 : Result := 'Abril';
    5 : Result := 'Mayo';
    6 : Result := 'Junio';
    7 : Result := 'Julio';
    8 : Result := 'Agosto';
    9 : Result := 'Septiembre';
    10 : Result := 'Octubre';
    11 : Result := 'Noviembre';
    12 : Result := 'Diciembre';
  end;
  Result:= UpperCase(Result);
end;

procedure TFREPInfoGeneralPartos.CompletarMeses;
var mes1:Integer;
begin
    mes1:= 1;

    LMes1.Caption:= GetMeses((mes1) mod 12);
    LMes2.Caption:= GetMeses((mes1+1) mod 12);
    LMes3.Caption:= GetMeses((mes1+2) mod 12);
    LMes4.Caption:= GetMeses((mes1+3) mod 12);
    LMes5.Caption:= GetMeses((mes1+4) mod 12);
    LMes6.Caption:= GetMeses((mes1+5) mod 12);
    LMes7.Caption:= GetMeses((mes1+6) mod 12);
    LMes8.Caption:= GetMeses((mes1+7) mod 12);
    LMes9.Caption:= GetMeses((mes1+8) mod 12);
    LMes10.Caption:= GetMeses((mes1+9) mod 12);
    LMes11.Caption:= GetMeses((mes1+10) mod 12);
    LMes12.Caption:= GetMeses((mes1+11) mod 12);
end;

procedure TFREPInfoGeneralPartos.CBSemanalClick(Sender: TObject);
begin
  inherited;
  CBMensual.Checked:= not CBSemanal.Checked;
  if CBSemanal.Checked then
  begin
    DBCNacimientos.RemoveAllSeries;
    DBCDistPesoNacer.RemoveAllSeries;
    ArmarSeries2();
  end;
  AjustarMesesGraficoNacimientos();
end;

procedure TFREPInfoGeneralPartos.CBMensualClick(Sender: TObject);
begin
  inherited;
  CBSemanal.Checked:= not CBMensual.Checked;
  if CBMensual.Checked then
  begin
    DBCNacimientos.RemoveAllSeries;
    DBCDistPesoNacer.RemoveAllSeries;
    ArmarSeries2();
  end;
  AjustarMesesGraficoNacimientos();  
end;

procedure TFREPInfoGeneralPartos.CBAcumuladoClick(Sender: TObject);
begin
  inherited;
  DBCNacimientos.RemoveAllSeries;
  DBCDistPesoNacer.RemoveAllSeries;
  ArmarSeries2();
  AjustarMesesGraficoNacimientos();
end;

function TFREPInfoGeneralPartos.GetRangoMes(fecha: TDateTime): String;
var DIA, MES, ANIO: WORD;
    RANGO : String;
begin
  DIA:= DayOf(Fecha);
  MES:= MonthOf(fecha);
  ANIO:= YearOf(fecha);

  if ((DIA >= 1) AND (DIA <= 7)) then
    RANGO:= '01-07'
   ELSE
     if ((DIA >= 8) AND (DIA <= 14)) then
        RANGO:= '08-14'
      ELSE
        if ((DIA >= 15) AND (DIA <= 21)) then
          RANGO:= '15-21'
         ELSE
           if ((MES = 1) or (MES = 3) or (MES = 5) or (MES = 7) or (MES = 8) or
               (MES = 10) or (MES = 12))then
               RANGO:= '22-31'
            ELSE
              if ((MES = 4) or (MES = 6) or (MES = 9) or (MES = 11))then
                 RANGO:= '22-30'
               ELSE
                 if (MES = 2) then
                      if ((ANIO - 4*(ANIO / 4)) = 0) then
                         RANGO:= '22-29'
                       ELSE
                          RANGO:= '22-28';

   result:= RANGO;
end;

function TFREPInfoGeneralPartos.GetPosSegunRangoMes(mes: Integer;
  rango: String): Integer;
begin
  if (rango = '01-07') then
    result:= mes*4 - 3
   else
      if (rango = '08-14') then
        result:= mes*4 - 2
       else
          if (rango = '15-21') then
            result:= mes*4 - 1
           else
                result:= mes*4;
end;

procedure TFREPInfoGeneralPartos.cargarLabelNacimientos(Fecha :TDateTime);
var i, j: Integer;
    rang: String;
begin
 i:= 1;
 while (i <= 4) do
   begin
     if (i = 1) then
       rang:= '01-07'
      else
        if (i = 2) then
          rang:= '08-14'
         else
           if (i = 3) then
             rang:= '15-21'
            else
              if (i = 4) then
                rang:= '22-31';
     j:= i;
     while (j <= 48) do
       begin
         LabelNacimientos[j]:= rang;
         j:= j + 4;
       end;
     inc(i);  
   end;

   if (IsLeapYear(YearOf(Fecha))) then
     rang:= '22-29'
    else
      rang:= '22-28'; 

   LabelNacimientos[8]:= rang;      

   rang:= '22-30';
   LabelNacimientos[16]:= rang;
   LabelNacimientos[24]:= rang;
   LabelNacimientos[36]:= rang;
   LabelNacimientos[44]:= rang;

end;

procedure TFREPInfoGeneralPartos.VerMeses;
begin
  if (CBSemanal.Checked) then
    begin
      LMes1.Visible:= true;
      LMes2.Visible:= true;
      LMes3.Visible:= true;
      LMes4.Visible:= true;
      LMes5.Visible:= true;
      LMes6.Visible:= true;
      LMes7.Visible:= true;
      LMes8.Visible:= true;
      LMes9.Visible:= true;
      LMes10.Visible:= true;
      LMes11.Visible:= true;
      LMes12.Visible:= true;
      SMes1.Visible:= true;
      SMes2.Visible:= true;
      SMes3.Visible:= true;
      SMes4.Visible:= true;
      SMes5.Visible:= true;
      SMes6.Visible:= true;
      SMes7.Visible:= true;
      SMes8.Visible:= true;
      SMes9.Visible:= true;
      SMes10.Visible:= true;
      SMes11.Visible:= true;
      Shape1.Visible:= true;
      Panel2.Visible:= true;      
    end
   else
     if (CBMensual.Checked) then
       begin
          LMes1.Visible:= false;
          LMes2.Visible:= false;
          LMes3.Visible:= false;
          LMes4.Visible:= false;
          LMes5.Visible:= false;
          LMes6.Visible:= false;
          LMes7.Visible:= false;
          LMes8.Visible:= false;
          LMes9.Visible:= false;
          LMes10.Visible:= false;
          LMes11.Visible:= false;
          LMes12.Visible:= false;
          SMes1.Visible:= false;
          SMes2.Visible:= false;
          SMes3.Visible:= false;
          SMes4.Visible:= false;
          SMes5.Visible:= false;
          SMes6.Visible:= false;
          SMes7.Visible:= false;
          SMes8.Visible:= false;
          SMes9.Visible:= false;
          SMes10.Visible:= false;
          SMes11.Visible:= false;
          Shape1.Visible:= false;
          Panel2.Visible:= false;
       end;
end;

procedure TFREPInfoGeneralPartos.CrearMatDistPesoNacer();
var i, j: Integer;
begin

  for i:= 0 to Length(MatDistPesoNacer) - 1 do
   SetLength(MatDistPesoNacer[i],maxpeso);//incluyo el 0;

  for i:= 0 to Length(MatDistPesoNacer) - 1 do
   for j:= 0 to Length(MatDistPesoNacer[i]) - 1 do
     MatDistPesoNacer[i,j]:= '0';

end;

procedure TFREPInfoGeneralPartos.CalcularMaxMinPeso;
begin
  IBQParametros.Close;
  IBQParametros.ParamByName('esta').AsInteger:= fprincipal.establecimientoactual;
  IBQParametros.ParamByName('parametro').AsInteger:= 17;
  IBQParametros.Open;

  IBQParametros.First;

  minpeso:= IBQParametros.FieldByName('valor').AsInteger;

  IBQParametros.Close;
  IBQParametros.ParamByName('esta').AsInteger:= fprincipal.establecimientoactual;
  IBQParametros.ParamByName('parametro').AsInteger:= 21;
  IBQParametros.Open;

  IBQParametros.First;

  maxpeso:= IBQParametros.FieldByName('valor').AsInteger;
end;

procedure TFREPInfoGeneralPartos.EAAnioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 4)) and (key <> #8)) then key:=#0;
end;

procedure TFREPInfoGeneralPartos.EAAnioChange(Sender: TObject);
begin
  inherited;
  fechadesde:=StrToDate('01/01/' + EAAnio.Text);
  fechahasta:=StrToDate('31/12/' + EAAnio.Text);

  //actualizarFiltro;
end;

/////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
///////////////////////DISTOCIA/////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

procedure TFREPInfoGeneralPartos._D_Crear_CrearSerie(Serie : TBarSeries; Nombre : String; Estilo : TSeriesMarksStyle; Color : TColor);
begin
  Serie.Clear;
  Serie.Title := ' ';
  Serie.Name := Nombre;
  Serie.SeriesColor := Color;
  Serie.Marks.Style := Estilo;
  Serie.Marks.Font.Size := 5;
  Serie.Marks.Transparent := false;
  Serie.Marks.Clip := true;
  Serie.Marks.ArrowLength := 5;
  Serie.Marks.BackColor := clWhite;
  Serie.ShowInLegend := true;
  Serie.OnGetMarkText := _D_GetMarkText;
end;

procedure TFREPInfoGeneralPartos._D_CrearSeries();
begin
  /////Series de Rodeo
  SDistRodeo := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SDistRodeo,'SDistRodeo',smsValue,clRed);
  SPesoRodeo := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SPesoRodeo,'SPesoRodeo',smsLabel,clGreen);
  //////////////////////////////////////
  ////Series de Grado de Asistencia
  SDistGrado := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SDistGrado,'SDistGrado',smsValue,clRed);
  SPesoGrado := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SPesoGrado,'SPesoGrado',smsLabel,clGreen);
  //////////////////////////////////////
  ////Series de Padres
  SDistPadre := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SDistPadre,'SDistPadre',smsValue,clRed);
  SPesoPadre := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SPesoPadre,'SPesoPadre',smsLabel,clGreen);
  //////////////////////////////////////
  ////Series por Area Pelvica
  SDistAreaP := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SDistAreaP,'SDistAreaP',smsValue,clRed);
  SPesoAreaP := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SPesoAreaP,'SPesoAreaP',smsLabel,clGreen);
  //////////////////////////////////////
  ////Series por Frame
  SDistFrame := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SDistFrame,'SDistFrame',smsValue,clRed);
  SPesoFrame := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SPesoFrame,'SPesoFrame',smsLabel,clGreen);
  //////////////////////////////////////
  ////Series por Condicion Corporal
  SDistCC := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SDistCC,'SDistCC',smsValue,clRed);
  SPesoCC := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SPesoCC,'SPesoCC',smsLabel,clGreen);
  //////////////////////////////////////
  ////Series por Raza
  SDistRaza := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SDistRaza,'SDistRaza',smsValue,clRed);
  SPesoRaza := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SPesoRaza,'SPesoRaza',smsLabel,clGreen);
  //////////////////////////////////////
  ////Series por Muertes
  SDistMuertos := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SDistMuertos,'SDistMuertos',smsValue,clRed);
  SPesoMuertos := TBarSeries.Create(nil);
  _D_Crear_CrearSerie(SPesoMuertos,'SPesoMuertos',smsLabel,clGreen);
  //////////////////////////////////////
end;

procedure TFREPInfoGeneralPartos._D_CargarDatosAdicionales(var Arr : TArrSeries; Indice : Integer);
var
  I : Integer;
begin
  for I := 1 to 3 do
  begin

    if (IBQRepPartosDistocicos.FieldByName('MUERTO_36HS_'+IntToStr(I)).Value <> null) then
      if (IBQRepPartosDistocicos.FieldByName('MUERTO_36HS_'+IntToStr(I)).AsString = 'S') then
        Inc(Arr[Indice].muerto_36hs);
    if (IBQRepPartosDistocicos.FieldByName('MUERTO_30DIAS_'+IntToStr(I)).Value <> null) then
      if (IBQRepPartosDistocicos.FieldByName('MUERTO_30DIAS_'+IntToStr(I)).AsString = 'S') then
        Inc(Arr[Indice].muerto_30dias);


    if IBQRepPartosDistocicos.FieldByName('SEXO_'+IntToStr(I)).Value <> null then
      case IBQRepPartosDistocicos.FieldByName('SEXO_'+IntToStr(I)).AsInteger of
        1 : begin

              if (IBQRepPartosDistocicos.FieldByName('GRADO_DISTOCIA').Value <> null) then
                Inc(Arr[Indice].cant_machos_dist)
              else
                Inc(Arr[Indice].cant_machos);

              if ((IBQRepPartosDistocicos.FieldByName('PESO_NACIMIENTO_'+IntToStr(I)).Value <> null)) then
              begin
                if (IBQRepPartosDistocicos.FieldByName('GRADO_DISTOCIA').Value <> null) then
                  Arr[Indice].peso_macho_dist := Arr[Indice].peso_macho_dist+IBQRepPartosDistocicos.FieldByName('PESO_NACIMIENTO_'+IntToStr(I)).AsInteger
                else
                  Arr[Indice].peso_macho := Arr[Indice].peso_macho+IBQRepPartosDistocicos.FieldByName('PESO_NACIMIENTO_'+IntToStr(I)).AsInteger;
              end;
            end;
        2 : begin

              if (IBQRepPartosDistocicos.FieldByName('GRADO_DISTOCIA').Value <> null) then
                Inc(Arr[Indice].cant_hembras_dist)
              else
                Inc(Arr[Indice].cant_hembras);

              if ((IBQRepPartosDistocicos.FieldByName('PESO_NACIMIENTO_'+IntToStr(I)).Value <> null)) then
              begin
                if (IBQRepPartosDistocicos.FieldByName('GRADO_DISTOCIA').Value <> null) then
                  Arr[Indice].peso_hembra_dist := Arr[Indice].peso_hembra_dist+IBQRepPartosDistocicos.FieldByName('PESO_NACIMIENTO_'+IntToStr(I)).AsInteger
                else
                  Arr[Indice].peso_hembra := Arr[Indice].peso_hembra+IBQRepPartosDistocicos.FieldByName('PESO_NACIMIENTO_'+IntToStr(I)).AsInteger;
              end;
            end;
      end;
  end;
end;

procedure TFREPInfoGeneralPartos._D_AgregarValor(var Arr : TArrSeries; Registro : TRegSeries; Tipo : Integer);
var
  Indice : Integer;
begin
  Indice := 0;
  while Indice <= Length(Arr)-1 do
  begin
    if StrComp(PAnsiChar(Registro.nombre),PAnsiChar(Arr[Indice].nombre))=0 then
      break;
    Indice := Indice+1;
  end;
  case Tipo of
{Dsit}1 : begin
            if Indice < Length(Arr) then
            begin
              Inc(Arr[Indice].total);
              if (IBQRepPartosDistocicos.FieldByName('GRADO_DISTOCIA').Value <> null) then
                Inc(Arr[Indice].distocicos);
            end
            else
            begin
              SetLength(Arr,Indice+1);
              Arr[Indice].nombre := Registro.nombre;
              Arr[Indice].total := 1;
              Arr[Indice].cant_machos := 0;
              Arr[Indice].cant_hembras := 0;
              Arr[Indice].peso_macho := 0;
              Arr[Indice].peso_hembra := 0;
              Arr[Indice].muerto_30dias := 0;
              Arr[Indice].muerto_36hs := 0;
              Arr[Indice].cant_hembras_dist := 0;
              Arr[Indice].cant_machos_dist := 0;
              if (IBQRepPartosDistocicos.FieldByName('GRADO_DISTOCIA').Value <> null) then
                Arr[Indice].distocicos := 1;
            end;
          end;
{Peso}2 : begin
            if Indice < Length(Arr) then
            begin
              Inc(Arr[Indice].total);
              Arr[Indice].valor := Arr[Indice].valor+Registro.valor;
              if (IBQRepPartosDistocicos.FieldByName('GRADO_DISTOCIA').Value <> null) then
                Inc(Arr[Indice].distocicos);
            end
            else
            begin
              SetLength(Arr,Indice+1);
              Arr[Indice].nombre := Registro.nombre;
              Arr[Indice].total := 1;
              Arr[Indice].valor := Registro.valor;
              Arr[Indice].cant_machos := 0;
              Arr[Indice].cant_hembras := 0;
              Arr[Indice].peso_macho := 0;
              Arr[Indice].peso_hembra := 0;
              Arr[Indice].muerto_30dias := 0;
              Arr[Indice].muerto_36hs := 0;
              Arr[Indice].cant_hembras_dist := 0;
              Arr[Indice].cant_machos_dist := 0;
              if (IBQRepPartosDistocicos.FieldByName('GRADO_DISTOCIA').Value <> null) then
                Arr[Indice].distocicos := 1;
            end;
          end;
  end;
  _D_CargarDatosAdicionales(Arr,Indice);
end;

procedure TFREPInfoGeneralPartos._D_CargarSerie(CampoComparacion, Peso : Variant; var ArrDist, ArrPeso : TArrSeries);
var
  Reg : TRegSeries;
begin
  if CampoComparacion <> null then
  begin
    Reg.nombre := CampoComparacion;
    _D_AgregarValor(ArrDist,Reg,1);
    if Peso <> null then
    begin
      Reg.valor := Peso;
      _D_AgregarValor(ArrPeso,Reg,2);
    end;
  end;
end;

procedure TFREPInfoGeneralPartos._D_CargarSerieMuertos(var ArrDist, ArrPeso : TArrSeries);
var
  Reg : TRegSeries;
  I : Integer;
begin
  if IBQRepPartosDistocicos.FieldByName('GRADO_DISTOCIA').Value <> null then
  for I := 1 to 3 do
  begin
    if IBQRepPartosDistocicos.FieldByName('SEXO_'+IntToStr(I)).Value <> null then
        if (IBQRepPartosDistocicos.FieldByName('MUERTO_36HS_'+IntToStr(I)).Value = 'S') or (IBQRepPartosDistocicos.FieldByName('MUERTO_30DIAS_'+IntToStr(I)).Value = 'S') then
        begin
            Reg.nombre := IBQRepPartosDistocicos.FieldByName('GRADO_DISTOCIA').AsString;
            _D_AgregarValor(ArrDist,Reg,1);
            if IBQRepPartosDistocicos.FieldByName('PESO_NACIMIENTO_'+IntToStr(I)).Value <> null then
            begin
              Reg.valor := IBQRepPartosDistocicos.FieldByName('PESO_NACIMIENTO_'+IntToStr(I)).AsInteger;
              _D_AgregarValor(ArrPeso,Reg,2);
            end;
        end;
  end;
end;

procedure TFREPInfoGeneralPartos._D_Cargar_ArmarSerie(var Serie : TBarSeries; Grafico : TDBChart; VertAxis : TVertAxis; Arreglo : TArrSeries; Prom : Boolean);
var
  ArrAux : Array of Double;
  Indice : Integer;
  Total : Integer;
  con_dist : boolean;
  muertos : Boolean;
  automaticos : boolean;
begin

  Serie.Clear;
  Serie.MultiBar := mbSide;
  Serie.VertAxis := VertAxis;
  SetLength(ArrAux,0);

  if VertAxis = aLeftAxis then
  begin
    automaticos := false;
    for Indice := 0 to Length(Arreglo)-1 do
      if Arreglo[Indice].cant_hembras_dist+Arreglo[Indice].cant_machos_dist > 0 then
      begin
        automaticos := true;
        break;
      end;
    Grafico.LeftAxis.Automatic := automaticos;
    Grafico.LeftAxis.AutomaticMaximum := automaticos;
    Grafico.LeftAxis.AutomaticMinimum := automaticos;
    if not automaticos then
    begin
      Grafico.LeftAxis.Maximum := 1;
      Grafico.LeftAxis.Minimum := 0;
      Grafico.LeftAxis.Increment := 1;
    end;
  end;

  Total := 0;
  con_dist := false;
  muertos := false;

  if (StrComp(PAnsiChar(Serie.Name), PAnsiChar('SDistMuertos')) = 0)  or
     (StrComp(PAnsiChar(Serie.Name), PAnsiChar('SPesoMuertos')) = 0)  then
    muertos := true;

  if (StrComp(PAnsiChar(Serie.Name), PAnsiChar('SDistGrado')) = 0)  or
     (StrComp(PAnsiChar(Serie.Name), PAnsiChar('SPesoGrado')) = 0)  then
  begin
    con_dist := true;
    for Indice := 0 to Length(Arreglo)-1 do
      if Arreglo[Indice].nombre <> '-' then
        Total := Total+Arreglo[Indice].distocicos;
  end;

  if Total = 0 then Total := 1;

  for Indice := 0 to Length(Arreglo)-1 do
  begin
    SetLength(ArrAux,Indice+1);
    if Prom then
    begin
      if con_dist then
      begin
        Total := Arreglo[Indice].cant_hembras_dist+Arreglo[Indice].cant_machos_dist;
        if Total = 0 then Total := 1;
        ArrAux[Indice] := (Arreglo[Indice].peso_hembra_dist+Arreglo[Indice].peso_macho_dist)/Total;
      end
      else
      begin
        Total := Arreglo[Indice].cant_hembras+Arreglo[Indice].cant_hembras_dist+Arreglo[Indice].cant_machos+Arreglo[Indice].cant_machos_dist;
        if Total = 0 then Total := 1;
        ArrAux[Indice] := Arreglo[Indice].valor/Total;
      end;
    end
    else
    begin
      if con_dist then
        ArrAux[Indice] := (Arreglo[Indice].distocicos/Total)*100
      else if muertos then
              if ArrDistGrado[Indice].distocicos = 0 then
                ArrAux[Indice] := 0
              else
                ArrAux[Indice] := ((Arreglo[Indice].muerto_30dias+Arreglo[Indice].muerto_36hs)/ArrDistGrado[Indice].distocicos)*100
           else
           begin
              Total := Arreglo[Indice].cant_hembras+Arreglo[Indice].cant_hembras_dist+Arreglo[Indice].cant_machos+Arreglo[Indice].cant_machos_dist;
              if Total = 0 then Total := 1;
              ArrAux[Indice] := (Arreglo[Indice].distocicos/Total)*100;
           end;
    end;
  end;
  Grafico.AddSeries(Serie);
  Serie.AddArray(ArrAux);
end;

procedure TFREPInfoGeneralPartos._D_CargarValoresPredefinidos();
var
  I : Integer;
  F : Real;
begin
  //Armar los arreglos con longitud definida (FRAME, AREA PELVICA, CONDICION CORPORAL)
  SetLength(ArrDistFrame,9);
  SetLength(ArrPesoFrame,9);
  SetLength(ArrDistAreaP,10);
  SetLength(ArrPesoAreaP,10);
  SetLength(ArrDistCC,10);
  SetLength(ArrPesoCC,10);
  //FRAME
  for I := 0 to 8 do
  begin
    ArrDistFrame[I].nombre := IntToStr(I+1);
    ArrPesoFrame[I].nombre := IntToStr(I+1);
    ArrDistFrame[I].total := 1;
    ArrDistFrame[I].valor := 0;
    ArrPesoFrame[I].total := 1;
    ArrPesoFrame[I].valor := 0;
  end;
  //AREA PELVICA
  for I := 0 to 9 do
  begin
    case I of
      0 : begin
            ArrDistAreaP[I].nombre := '< 120 cm2';
            ArrPesoAreaP[I].nombre := '< 120 cm2';
          end;
      1 : begin
            ArrDistAreaP[I].nombre := '120-130 cm2';
            ArrPesoAreaP[I].nombre := '120-130 cm2';
          end;
      2 : begin
            ArrDistAreaP[I].nombre := '130-140 cm2';
            ArrPesoAreaP[I].nombre := '130-140 cm2';
          end;
      3 : begin
            ArrDistAreaP[I].nombre := '140-150 cm2';
            ArrPesoAreaP[I].nombre := '140-150 cm2';
          end;
      4 : begin
            ArrDistAreaP[I].nombre := '150-160 cm2';
            ArrPesoAreaP[I].nombre := '150-160 cm2';
          end;
      5 : begin
            ArrDistAreaP[I].nombre := '160-170 cm2';
            ArrPesoAreaP[I].nombre := '160-170 cm2';
          end;
      6 : begin
            ArrDistAreaP[I].nombre := '170-180 cm2';
            ArrPesoAreaP[I].nombre := '170-180 cm2';
          end;
      7 : begin
            ArrDistAreaP[I].nombre := '180-190 cm2';
            ArrPesoAreaP[I].nombre := '180-190 cm2';
          end;
      8 : begin
            ArrDistAreaP[I].nombre := '190-200 cm2';
            ArrPesoAreaP[I].nombre := '190-200 cm2';
          end;
      9 : begin
            ArrDistAreaP[I].nombre := '> 200 cm2';
            ArrPesoAreaP[I].nombre := '> 200 cm2';
          end;
    end;
    ArrDistAreaP[I].total := 1;
    ArrDistAreaP[I].valor := 0;
    ArrPesoAreaP[I].total := 1;
    ArrPesoAreaP[I].valor := 0;
  end;
  //CONDICION CORPORAL
  F := 0.5;
  if FPrincipal.EscalaCondicionCorporal = 5 then
    for I := 0 to 9 do
    begin
      ArrDistCC[I].nombre := FormatFloat('#0.#',F);
      ArrPesoCC[I].nombre := FormatFloat('#0.#',F);
      ArrDistCC[I].total := 1;
      ArrDistCC[I].valor := 0;
      ArrPesoCC[I].total := 1;
      ArrPesoCC[I].valor := 0;
      F := F + 0.5;
    end
  else
    for I := 0 to 9 do
    begin
      ArrDistCC[I].nombre := IntToStr(I+1);
      ArrPesoCC[I].nombre := IntToStr(I+1);
      ArrDistCC[I].total := 1;
      ArrDistCC[I].valor := 0;
      ArrPesoCC[I].total := 1;
      ArrPesoCC[I].valor := 0;
    end;
  //
  //GRADO DE ASISTENCIA
  DMSoftvet.IBQGradoAsistencia.Close;
  DMSoftvet.IBQGradoAsistencia.Open;
  DMSoftvet.IBQGradoAsistencia.First;
  I := 0;
  while not DMSoftvet.IBQGradoAsistencia.Eof do
  begin
    Inc(I);
    SetLength(ArrDistGrado,I);
    SetLength(ArrDistMuertos,I);
    SetLength(ArrPesoGrado,I);
    SetLength(ArrPesoMuertos,I);

    ArrDistGrado[I-1].nombre := DMSoftvet.IBQGradoAsistencia.FieldValues['NOMBRE'];
    ArrDistMuertos[I-1].nombre := DMSoftvet.IBQGradoAsistencia.FieldValues['NOMBRE'];
    ArrPesoGrado[I-1].nombre := DMSoftvet.IBQGradoAsistencia.FieldValues['NOMBRE'];
    ArrPesoMuertos[I-1].nombre := DMSoftvet.IBQGradoAsistencia.FieldValues['NOMBRE'];

    ArrDistGrado[I-1].total := 1;
    ArrDistMuertos[I-1].total := 1;
    ArrPesoGrado[I-1].total := 1;
    ArrPesoMuertos[I-1].total := 1;

    ArrDistGrado[I-1].valor := 0;
    ArrDistMuertos[I-1].valor := 0;
    ArrPesoGrado[I-1].valor := 0;
    ArrPesoMuertos[I-1].valor := 0;

    DMSoftvet.IBQGradoAsistencia.Next;
  end;
end;

procedure TFREPInfoGeneralPartos._D_ClearArreglos();
begin
  SetLength(ArrDistRodeo,0);
  SetLength(ArrPesoRodeo,0);
  SetLength(ArrDistGrado,0);
  SetLength(ArrPesoGrado,0);
  SetLength(ArrDistPadre,0);
  SetLength(ArrPesoPadre,0);
  SetLength(ArrDistCC,0);
  SetLength(ArrPesoCC,0);
  SetLength(ArrDistAreaP,0);
  SetLength(ArrPesoAreaP,0);
  SetLength(ArrDistFrame,0);
  SetLength(ArrPesoFrame,0);
  SetLength(ArrDistRaza,0);
  SetLength(ArrDistRaza,0);
  SetLength(ArrDistMuertos,0);
  SetLength(ArrPesoMuertos,0);
end;

procedure TFREPInfoGeneralPartos._D_ArmarSeries;
begin
  _D_ClearArreglos();
  _D_CargarValoresPredefinidos();
  //
  IBQRepPartosDistocicos.First;
  while not IBQRepPartosDistocicos.Eof do
  begin
    _D_CargarSerie(IBQRepPartosDistocicos.FieldValues['ROD'],IBQRepPartosDistocicos.FieldValues['PESO_NACIMIENTO_PROM'],ArrDistRodeo,ArrPesoRodeo);
    _D_CargarSerie(IBQRepPartosDistocicos.FieldValues['GRADO_DISTOCIA'],IBQRepPartosDistocicos.FieldValues['PESO_NACIMIENTO_PROM'],ArrDistGrado,ArrPesoGrado);
    _D_CargarSerie(IBQRepPartosDistocicos.FieldValues['NOMBRE_PADRE'],IBQRepPartosDistocicos.FieldValues['PESO_NACIMIENTO_PROM'],ArrDistPadre,ArrPesoPadre);
    _D_CargarSerie(IBQRepPartosDistocicos.FieldValues['CONDICION_CORPORAL'],IBQRepPartosDistocicos.FieldValues['PESO_NACIMIENTO_PROM'],ArrDistCC,ArrPesoCC);
    _D_CargarSerie(IBQRepPartosDistocicos.FieldValues['AREA_PELVICA'],IBQRepPartosDistocicos.FieldValues['PESO_NACIMIENTO_PROM'],ArrDistAreaP,ArrPesoAreaP);
    _D_CargarSerie(IBQRepPartosDistocicos.FieldValues['FRAME'],IBQRepPartosDistocicos.FieldValues['PESO_NACIMIENTO_PROM'],ArrDistFrame,ArrPesoFrame);
    _D_CargarSerie(IBQRepPartosDistocicos.FieldValues['RAZA'],IBQRepPartosDistocicos.FieldValues['PESO_NACIMIENTO_PROM'],ArrDistRaza,ArrPesoRaza);
    _D_CargarSerieMuertos(ArrDistMuertos,ArrPesoMuertos);
    IBQRepPartosDistocicos.Next;
  end;
  //Grafico 1 : Serie de Distocia por Rodeo y Peso por Rodeo
  _D_Ordenar(ArrDistRodeo,7);
  //Ordenar(ArrPesoRodeo,7);
  _D_Cargar_ArmarSerie(SDistRodeo,DBCRodeo,aLeftAxis,ArrDistRodeo,false);
  //Cargar_ArmarSerie(SPesoRodeo,DBCRodeo,aRightAxis,ArrPesoRodeo,true);
  /////////
  //Grafico 2 : Serie de Distocia por Grado de Asistencia y Peso por Grado de Distocia
  _D_Completar(ArrDistGrado,5);
  _D_Completar(ArrPesoGrado,5);
  _D_Cargar_ArmarSerie(SDistGrado,DBCGrado,aLeftAxis,ArrDistGrado,false);
  _D_Cargar_ArmarSerie(SPesoGrado,DBCGrado,aRightAxis,ArrPesoGrado,true);
  /////////
  //Grafico 3 : Serie de Distocia segun Padre y Peso segun Padre
  _D_Ordenar(ArrDistPadre,8);
  _D_Ordenar(ArrPesoPadre,8);
  _D_Cargar_ArmarSerie(SDistPadre,DBCPadre,aLeftAxis,ArrDistPadre,false);
  _D_Cargar_ArmarSerie(SPesoPadre,DBCPadre,aRightAxis,ArrPesoPadre,true);
  //////////
  //Grafico 4 : Serie de Distocia segun Condicion Corporal y Peso segun Condicion Corporal
  _D_Cargar_ArmarSerie(SDistCC,DBCCC,aLeftAxis,ArrDistCC,false);
  _D_Cargar_ArmarSerie(SPesoCC,DBCCC,aRightAxis,ArrPesoCC,true);
  //////////
  //Grafico 5 : Serie de Distocia segun Area Pelvica y Peso segun Area Pelvica
  _D_Cargar_ArmarSerie(SDistAreaP,DBCAreaP,aLeftAxis,ArrDistAreaP,false);
  _D_Cargar_ArmarSerie(SPesoAreaP,DBCAreaP,aRightAxis,ArrPesoAreaP,true);
  //////////
  //Grafico 6 : Serie de Distocia segun Raza y Peso segun Raza
  _D_Ordenar(ArrDistRaza,8);
  _D_Ordenar(ArrPesoRaza,8);
  _D_Cargar_ArmarSerie(SDistRaza,DBCRaza,aLeftAxis,ArrDistRaza,false);
  _D_Cargar_ArmarSerie(SPesoRaza,DBCRaza,aRightAxis,ArrPesoRaza,true);
  //////////
  //Grafico 7 : Serie de Distocia segun Frame y Peso segun Frame
  _D_Cargar_ArmarSerie(SDistFrame,DBCFrame,aLeftAxis,ArrDistFrame,false);
  _D_Cargar_ArmarSerie(SPesoFrame,DBCFrame,aRightAxis,ArrPesoFrame,true);
  //////////
  //Grafico 8 : Serie de Muertos segun Grado de Asistencia y Peso Muertos segun Grado de Asistencia
  _D_Completar(ArrDistMuertos,5);
  _D_Completar(ArrPesoMuertos,5);
  _D_Cargar_ArmarSerie(SDistMuertos,DBCMuertos,aLeftAxis,ArrDistMuertos,false);
  _D_Cargar_ArmarSerie(SPesoMuertos,DBCMuertos,aRightAxis,ArrPesoMuertos,true);
  //////////
end;

procedure TFREPInfoGeneralPartos._D_DBCRodeoGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrDistRodeo)>0) then
        LabelText := ArrDistRodeo[valor].nombre
end;

procedure TFREPInfoGeneralPartos._D_DBCGradoGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrDistGrado)>0) then
      begin
        if ArrDistGrado[valor].nombre = '-' then
          LabelText := ArrPesoGrado[valor].nombre
        else
          LabelText := ArrDistGrado[valor].nombre;
      end;
end;

procedure TFREPInfoGeneralPartos._D_DBCPadreGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrDistPadre)>0) then
      begin
        if ArrDistPadre[valor].nombre = '-' then
          LabelText := ArrPesoPadre[valor].nombre
        else
          LabelText := ArrDistPadre[valor].nombre;
      end;
end;

procedure TFREPInfoGeneralPartos._D_DBCCCGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrDistCC)>0) then
      begin
        if ArrDistCC[valor].nombre = '-' then
          LabelText := ArrPesoCC[valor].nombre
        else
          LabelText := ArrDistCC[valor].nombre;
      end;
end;


procedure TFREPInfoGeneralPartos._D_DBCAreaPGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrDistAreaP)>0) then
      begin
        if ArrDistAreaP[valor].nombre = '-' then
          LabelText := ArrPesoAreaP[valor].nombre
        else
          LabelText := ArrDistAreaP[valor].nombre;
      end;
end;

procedure TFREPInfoGeneralPartos._D_DBCRazaGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrDistRaza)>0) then
      begin
        if ArrDistRaza[valor].nombre = '-' then
          LabelText := ArrPesoRaza[valor].nombre
        else
          LabelText := ArrDistRaza[valor].nombre;
      end;
end;

procedure TFREPInfoGeneralPartos._D_DBCFrameGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrDistFrame)>0) then
      begin
        if ArrDistFrame[valor].nombre = '-' then
          LabelText := ArrPesoFrame[valor].nombre
        else
          LabelText := ArrDistFrame[valor].nombre;
      end;
end;

procedure TFREPInfoGeneralPartos._D_DBCMuertosGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrDistMuertos)>0) then
      begin
        if ArrDistMuertos[valor].nombre = '-' then
          LabelText := ArrPesoMuertos[valor].nombre
        else
          LabelText := ArrDistMuertos[valor].nombre;
      end;
end;

procedure TFREPInfoGeneralPartos._D_Ordenar(var Arr : TArrSeries; Cantidad : Integer);
var
  Aux : TRegSeries;
  I, K, I_Mayor : Integer;
  cambio : Boolean;
begin
  //Ordeno de Mayor a Menor
  for I := 0 to Length(Arr)-1 do
  begin
    cambio := false;
    I_Mayor := I;
    for K := I to Length(Arr)-1 do
      if (Arr[K].cant_hembras+Arr[K].cant_machos+Arr[K].cant_hembras_dist+Arr[K].cant_machos_dist)
          > (Arr[I_Mayor].cant_hembras+Arr[I_Mayor].cant_machos+Arr[I_Mayor].cant_hembras_dist+Arr[I_Mayor].cant_machos_dist) then
      begin
        I_Mayor := K;
        cambio := true;
      end;
    if cambio then
    begin
      Aux := Arr[I_Mayor];
      Arr[I_Mayor] := Arr[I];
      Arr[I] := Aux;
    end;
  end;
  //Dejo solo los primeros 10
  if Length(Arr) > Cantidad then
    SetLength(Arr,Cantidad)
  else
    _D_Completar(Arr,Cantidad);
end;

procedure TFREPInfoGeneralPartos._D_Completar(var Arr : TArrSeries; Cantidad : Integer);
var
  I : Integer;
begin
  if Length(Arr) < Cantidad then
    for I := Length(Arr) to Cantidad-1 do
    begin
      SetLength(Arr,I+1);
      Arr[I].total := 1;
      Arr[I].cant_hembras := 0;
      Arr[I].cant_machos := 0;
      Arr[I].muerto_30dias := 0;
      Arr[I].muerto_36hs := 0;
      Arr[I].valor := 0;
      Arr[I].nombre := '-';
    end;
end;

procedure TFREPInfoGeneralPartos._D_GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
var
  valor : double;
begin
  if TryStrToFloat(MarkText,valor) then
    MarkText := FormatFloat('#0.#',valor);
  if MarkText = '0 %' then MarkText := '';
  if MarkText = '0' then MarkText := '';
  if MarkText = '100 %' then MarkText := '';
end;

procedure TFREPInfoGeneralPartos._D_DBCGetLegendText(Sender: TCustomAxisPanel;
  LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
begin
  if Index = 1 then LegendText := 'Prom. P.N. General Kgs';
  if Index = 0 then LegendText := '% Partos Distócicos';
end;

procedure TFREPInfoGeneralPartos._D_DBCMuertosGetLegendText(Sender: TCustomAxisPanel;
  LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
begin
  if Index = 1 then LegendText := 'Prom. P.N. Distócicos Kgs';
  if Index = 0 then LegendText := '% Nacimientos Muertos';
end;

procedure TFREPInfoGeneralPartos.DBCGradoGetLegendText(
  Sender: TCustomAxisPanel; LegendStyle: TLegendStyle; Index: Integer;
  var LegendText: String);
begin
  inherited;
  if Index = 1 then LegendText := 'Prom. P.N. Distócicos Kgs';
  if Index = 0 then LegendText := '% Partos Distócicos';
end;

procedure TFREPInfoGeneralPartos.DBCRodeoGetLegendText(
  Sender: TCustomAxisPanel; LegendStyle: TLegendStyle; Index: Integer;
  var LegendText: String);
begin
  inherited;
  if Index = 0 then LegendText := '% Partos Distócicos';
end;

procedure TFRepInfoGeneralPArtos._D_ArmarPreview(var T : TFREPInfoGeneralPartosPreview);
var
  AppPath : String;
begin
  AppPath := ExtractFilePath(Application.ExeName);
  DBCRodeo.SaveToMetafile(AppPath+'_D_rodeos.wmf');
  DBCGrado.SaveToMetafile(AppPath+'_D_grado.wmf');
  DBCPadre.SaveToMetafile(AppPath+'_D_padre.wmf');
  DBCCC.SaveToMetafile(AppPath+'_D_cc.wmf');
  DBCAreaP.SaveToMetafile(AppPath+'_D_areaP.wmf');
  DBCRaza.SaveToMetafile(AppPath+'_D_raza.wmf');
  DBCFrame.SaveToMetafile(AppPath+'_D_frame.wmf');
  DBCMuertos.SaveToMetafile(AppPath+'_D_muertos.wmf');
  T.QRIDistAreaP.Picture.LoadFromFile(AppPath+'_D_areaP.wmf');
  T.QRIDistCC.Picture.LoadFromFile(AppPath+'_D_cc.wmf');
  T.QRIDistFrame.Picture.LoadFromFile(AppPath+'_D_frame.wmf');
  T.QRIDistGrado.Picture.LoadFromFile(AppPath+'_D_grado.wmf');
  T.QRIDistMuerte.Picture.LoadFromFile(AppPath+'_D_muertos.wmf');
  T.QRIDistPadres.Picture.LoadFromFile(AppPath+'_D_padre.wmf');
  T.QRIDistRaza.Picture.LoadFromFile(AppPath+'_D_raza.wmf');
  T.QRIDistRodeo.Picture.LoadFromFile(AppPath+'_D_rodeos.wmf');
  _D_ArmarTablasPreview(T);
end;

procedure TFREPInfoGeneralPartos._D_ArmarTablasPreview(var T : TFREPInfoGeneralPartosPreview);
var
  Indice, IndReg, Total : Integer;
  _Top, _Left, _Prox : Integer;
begin
  //Tabla de Padres
  _Left := 620;
  for Indice := 0 to Length(ArrDistPadre)-1 do
  if (ArrDistPadre[Indice].nombre <> '-') then
  begin
    _Top := 392;
    for IndReg := 1 to 6 do
    begin
      with (TQRLabel(T.QRBand15.AddPrintable(TQRLabel))) do
      begin
        Top := _Top;
        Left := _Left;
        AutoSize := true;
        Font.Size := 7;
        Transparent := true;
        case IndReg of
          1 : begin
                Font.Style := [fsBold];
                Caption := IntToStr(ArrDistPadre[Indice].cant_machos_dist+ArrDistPadre[Indice].cant_hembras_dist);
              end;
          2 : Caption := IntToStr(ArrDistPadre[Indice].cant_machos_dist);
          3 : Caption := IntToStr(ArrDistPadre[Indice].cant_hembras_dist);

          4 : Caption := FormatFloat('#0.#',(ArrDistPadre[Indice].peso_macho_dist+ArrDistPadre[Indice].peso_hembra_dist)/ArrDistPadre[Indice].distocicos);
          5 : Caption := FormatFloat('#0.#',(ArrDistPadre[Indice].peso_hembra+ArrDistPadre[Indice].peso_macho)/(ArrDistPadre[Indice].cant_machos+ArrDistPadre[Indice].cant_hembras));
          6 : Caption := FormatFloat('#0.#',(ArrDistPadre[Indice].peso_hembra+
                                              ArrDistPadre[Indice].peso_hembra_dist+
                                              ArrDistPadre[Indice].peso_macho+
                                              ArrDistPadre[Indice].peso_macho_dist)/(ArrDistPadre[Indice].cant_hembras+ArrDistPadre[Indice].cant_machos+ArrDistPadre[Indice].distocicos));
        end;
        if Caption = 'NAN' then Caption := '';
      end;
      _Top := _Top+24;
    end;
    _Left := _Left+35;
  end;

  //Tabla por Grado de Asistencia
  _Left := 157;
  for Indice := 0 to Length(ArrDistGrado)-1 do
  if (ArrDistGrado[Indice].nombre <> '-') then
  begin
    _Top := 392;
    for IndReg := 1 to 4 do
    begin
      with (TQRLabel(T.QRBand13.AddPrintable(TQRLabel))) do
      begin
        Top := _Top;
        Left := _Left;
        AutoSize := true;
        Font.Size := 7;
        Transparent := true;
        case IndReg of
          1 : begin
                Font.Style := [fsBold];
                Caption := IntToStr(ArrDistGrado[Indice].cant_machos_dist+ArrDistGrado[Indice].cant_hembras_dist);
              end;
          2 : Caption := IntToStr(ArrDistGrado[Indice].cant_machos_dist);
          3 : Caption := IntToStr(ArrDistGrado[Indice].cant_hembras_dist);
          4 : Caption := FormatFloat('#0.#',(ArrDistGrado[Indice].peso_hembra_dist+
                                              ArrDistGrado[Indice].peso_macho_dist)/ArrDistGrado[Indice].distocicos);
        end;
        if Caption = 'NAN' then Caption := '';
      end;
      _Top := _Top+24;
    end;
    _Left := _Left+51;
  end;

  //Tabla de Muertos
  _Left := 626;
  for Indice := 0 to Length(ArrDistMuertos)-1 do
  if (ArrDistMuertos[Indice].nombre <> '-') then
  begin
    _Top := 392;
    for IndReg := 1 to 6 do
    begin
      with (TQRLabel(T.QRBand13.AddPrintable(TQRLabel))) do
      begin
        Top := _Top;
        Left := _Left;
        AutoSize := true;
        Font.Size := 7;
        Transparent := true;
        case IndReg of
          1 : Caption := IntToStr(ArrDistMuertos[Indice].muerto_36hs);
          2 : Caption := IntToStr(ArrDistMuertos[Indice].muerto_30dias);
          3 : begin
                Font.Style := [fsBold];
                Caption := IntToStr(ArrDistMuertos[Indice].cant_machos_dist+ArrDistMuertos[Indice].cant_hembras_dist);
              end;
          4 : Caption := IntToStr(ArrDistMuertos[Indice].cant_machos_dist);
          5 : Caption := IntToStr(ArrDistMuertos[Indice].cant_hembras_dist);
          6 : Caption := FormatFloat('#0.#',(ArrDistMuertos[Indice].peso_hembra_dist+
                                              ArrDistMuertos[Indice].peso_macho_dist)/ArrDistMuertos[Indice].distocicos);
        end;
        if Caption = 'NAN' then Caption := '';
      end;
      _Top := _Top+24;
    end;
    _Left := _Left+51;
  end;

  //Tabla de Area Pelvica
  _Left := 162;
  for Indice := 0 to Length(ArrDistAreaP)-1 do
  begin
    _Top := 392;
    for IndReg := 1 to 6 do
    begin
      with (TQRLabel(T.QRBand11.AddPrintable(TQRLabel))) do
      begin
        Top := _Top;
        Left := _Left;
        AutoSize := true;
        Font.Size := 7;
        Transparent := true;
        Total := ArrDistAreaP[Indice].cant_hembras_dist+ArrDistAreaP[Indice].cant_machos_dist+ArrDistAreaP[Indice].cant_hembras+ArrDistAreaP[Indice].cant_machos;
        if (Total > 0) then
        begin
          case IndReg of
            1 : begin
                  Font.Style := [fsBold];
                  Caption := IntToStr(ArrDistAreaP[Indice].cant_machos_dist+ArrDistAreaP[Indice].cant_hembras_dist);
                end;
            2 : Caption := IntToStr(ArrDistAreaP[Indice].cant_machos_dist);
            3 : Caption := IntToStr(ArrDistAreaP[Indice].cant_hembras_dist);

            4 : Caption := FormatFloat('#0.#',(ArrDistAreaP[Indice].peso_macho_dist+ArrDistAreaP[Indice].peso_hembra_dist)/ArrDistAreaP[Indice].distocicos);
            5 : Caption := FormatFloat('#0.#',(ArrDistAreaP[Indice].peso_hembra+ArrDistAreaP[Indice].peso_macho)/(ArrDistAreaP[Indice].cant_machos+ArrDistAreaP[Indice].cant_hembras));
            6 : Caption := FormatFloat('#0.#',(ArrDistAreaP[Indice].peso_hembra+
                                              ArrDistAreaP[Indice].peso_hembra_dist+
                                              ArrDistAreaP[Indice].peso_macho+
                                              ArrDistAreaP[Indice].peso_macho_dist)/(ArrDistAreaP[Indice].cant_hembras+ArrDistAreaP[Indice].cant_machos+ArrDistAreaP[Indice].distocicos));
          end;
          if Caption = 'NAN' then Caption := '';
        end
        else
          Caption := '';
      end;
      _Top := _Top+24;
    end;
    _Left := _Left+27+(Indice mod 2);
  end;

  //Tabla de Frame
  _Left := 628;
  for Indice := 0 to Length(ArrDistFrame)-1 do
  begin
    _Top := 392;
    for IndReg := 1 to 6 do
    begin
      with (TQRLabel(T.QRBand11.AddPrintable(TQRLabel))) do
      begin
        Top := _Top;
        Left := _Left;
        AutoSize := true;
        Font.Size := 7;
        Transparent := true;
        Total := ArrDistFrame[Indice].cant_hembras_dist+ArrDistFrame[Indice].cant_machos_dist+ArrDistFrame[Indice].cant_hembras+ArrDistFrame[Indice].cant_machos;
        if (Total > 0) then
        begin
          case IndReg of
            1 : begin
                  Font.Style := [fsBold];
                  Caption := IntToStr(ArrDistFrame[Indice].cant_machos_dist+ArrDistFrame[Indice].cant_hembras_dist);
                end;
            2 : Caption := IntToStr(ArrDistFrame[Indice].cant_machos_dist);
            3 : Caption := IntToStr(ArrDistFrame[Indice].cant_hembras_dist);

            4 : Caption := FormatFloat('#0.#',(ArrDistFrame[Indice].peso_macho_dist+ArrDistFrame[Indice].peso_hembra_dist)/ArrDistFrame[Indice].distocicos);
            5 : Caption := FormatFloat('#0.#',(ArrDistFrame[Indice].peso_hembra+ArrDistFrame[Indice].peso_macho)/(ArrDistFrame[Indice].cant_machos+ArrDistFrame[Indice].cant_hembras));
            6 : Caption := FormatFloat('#0.#',(ArrDistFrame[Indice].peso_hembra+
                                              ArrDistFrame[Indice].peso_hembra_dist+
                                              ArrDistFrame[Indice].peso_macho+
                                              ArrDistFrame[Indice].peso_macho_dist)/(ArrDistFrame[Indice].cant_hembras+ArrDistFrame[Indice].cant_machos+ArrDistFrame[Indice].distocicos));
          end;
          if Caption = 'NAN' then Caption := '';
        end
        else
          Caption := '';
      end;
      _Top := _Top+24;
    end;
    _Left := _Left+28+(Indice mod 2);
  end;

  //Tabla de CC
  _Left := 165;
  for Indice := 0 to Length(ArrDistCC)-1 do
  begin
    _Top := 392;
    for IndReg := 1 to 6 do
    begin
      with (TQRLabel(T.QRBand10.AddPrintable(TQRLabel))) do
      begin
        Top := _Top;
        Left := _Left;
        AutoSize := true;
        Font.Size := 7;
        Transparent := true;
        Total := ArrDistCC[Indice].cant_hembras_dist+ArrDistCC[Indice].cant_machos_dist+ArrDistCC[Indice].cant_hembras+ArrDistCC[Indice].cant_machos;
        if (Total > 0) then
        begin
          case IndReg of
            1 : begin
                  Font.Style := [fsBold];
                  Caption := IntToStr(ArrDistCC[Indice].cant_machos_dist+ArrDistCC[Indice].cant_hembras_dist);
                end;
            2 : Caption := IntToStr(ArrDistCC[Indice].cant_machos_dist);
            3 : Caption := IntToStr(ArrDistCC[Indice].cant_hembras_dist);

            4 : Caption := FormatFloat('#0.#',(ArrDistCC[Indice].peso_macho_dist+ArrDistCC[Indice].peso_hembra_dist)/ArrDistCC[Indice].distocicos);
            5 : Caption := FormatFloat('#0.#',(ArrDistCC[Indice].peso_hembra+ArrDistCC[Indice].peso_macho)/(ArrDistCC[Indice].cant_machos+ArrDistCC[Indice].cant_hembras));
            6 : Caption := FormatFloat('#0.#',(ArrDistCC[Indice].peso_hembra+
                                              ArrDistCC[Indice].peso_hembra_dist+
                                              ArrDistCC[Indice].peso_macho+
                                              ArrDistCC[Indice].peso_macho_dist)/(ArrDistCC[Indice].cant_hembras+ArrDistCC[Indice].cant_machos+ArrDistCC[Indice].distocicos));
          end;
          if Caption = 'NAN' then Caption := '';
        end
        else
          Caption := '';
      end;
      _Top := _Top+24;
    end;
    _Left := _Left+31;
  end;

  //Tabla de Raza
  _Left := 629;
  for Indice := 0 to Length(ArrDistRaza)-1 do
  begin
    _Top := 392;
    for IndReg := 1 to 6 do
    begin
      with (TQRLabel(T.QRBand10.AddPrintable(TQRLabel))) do
      begin
        Top := _Top;
        Left := _Left;
        AutoSize := true;
        Font.Size := 7;
        Transparent := true;
        Total := ArrDistRaza[Indice].cant_hembras_dist+ArrDistRaza[Indice].cant_machos_dist+ArrDistRaza[Indice].cant_hembras+ArrDistRaza[Indice].cant_machos;
        if (Total > 0) then
        begin
          case IndReg of
            1 : begin
                  Font.Style := [fsBold];
                  Caption := IntToStr(ArrDistRaza[Indice].cant_machos_dist+ArrDistRaza[Indice].cant_hembras_dist);
                end;
            2 : Caption := IntToStr(ArrDistRaza[Indice].cant_machos_dist);
            3 : Caption := IntToStr(ArrDistRaza[Indice].cant_hembras_dist);

            4 : Caption := FormatFloat('#0.#',(ArrDistRaza[Indice].peso_macho_dist+ArrDistRaza[Indice].peso_hembra_dist)/ArrDistRaza[Indice].distocicos);
            5 : Caption := FormatFloat('#0.#',(ArrDistRaza[Indice].peso_hembra+ArrDistRaza[Indice].peso_macho)/(ArrDistRaza[Indice].cant_machos+ArrDistRaza[Indice].cant_hembras));
            6 : Caption := FormatFloat('#0.#',(ArrDistRaza[Indice].peso_hembra+
                                              ArrDistRaza[Indice].peso_hembra_dist+
                                              ArrDistRaza[Indice].peso_macho+
                                              ArrDistRaza[Indice].peso_macho_dist)/(ArrDistRaza[Indice].cant_hembras+ArrDistRaza[Indice].cant_machos+ArrDistRaza[Indice].distocicos));
          end;
          if Caption = 'NAN' then Caption := '';
        end
        else
          Caption := '';
      end;
      _Top := _Top+24;
    end;
    _Left := _Left+38+(Indice mod 2);
  end;
end;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


procedure TFREPInfoGeneralPartos.AjustarMesesGraficoNacimientos;
begin
  if not(CBAcumulado.Checked) then
      DBCNacimientos.MarginRight:= 5
   else
        DBCNacimientos.MarginRight:= 3;
end;

procedure TFREPInfoGeneralPartos.FormResize(Sender: TObject);
begin
  inherited;
  Shape1.Left:=floor(Panel2.Left+Panel2.Width*772/10000);
  Shape1.Width:=floor(Panel2.Width*87/100);   //859/1000

  SMes1.Left:=floor(Shape1.Left+Shape1.Width/12);
  SMes2.Left:=floor(Shape1.Left+(Shape1.Width/12)*2);
  SMes3.Left:=floor(Shape1.Left+(Shape1.Width/12)*3);
  SMes4.Left:=floor(Shape1.Left+(Shape1.Width/12)*4);
  SMes5.Left:=floor(Shape1.Left+(Shape1.Width/12)*5);
  SMes6.Left:=floor(Shape1.Left+(Shape1.Width/12)*6);
  SMes7.Left:=floor(Shape1.Left+(Shape1.Width/12)*7);
  SMes8.Left:=floor(Shape1.Left+(Shape1.Width/12)*8);
  SMes9.Left:=floor(Shape1.Left+(Shape1.Width/12)*9);
  SMes10.Left:=floor(Shape1.Left+(Shape1.Width/12)*10);
  SMes11.Left:=floor(Shape1.Left+(Shape1.Width/12)*11);

  LMes1.Left:=Shape1.Left+5;
  LMes2.Left:=Smes1.Left+5;
  LMes3.Left:=Smes2.Left+5;
  LMes4.Left:=Smes3.Left+5;
  LMes5.Left:=Smes4.Left+5;
  LMes6.Left:=Smes5.Left+5;
  LMes7.Left:=Smes6.Left+5;
  LMes8.Left:=Smes7.Left+5;
  LMes9.Left:=Smes8.Left+5;
  LMes10.Left:=Smes9.Left+5;
  LMes11.Left:=Smes10.Left+5;
  LMes12.Left:=Smes11.Left+5;


  LMes1.Width:=Smes2.Left-Smes1.Left-5;
  LMes2.Width:=Smes2.Left-Smes1.Left-5;
  LMes3.Width:=Smes2.Left-Smes1.Left-5;
  LMes4.Width:=Smes2.Left-Smes1.Left-5;
  LMes5.Width:=Smes2.Left-Smes1.Left-5;
  LMes6.Width:=Smes2.Left-Smes1.Left-5;
  LMes7.Width:=Smes2.Left-Smes1.Left-5;
  LMes8.Width:=Smes2.Left-Smes1.Left-5;
  LMes9.Width:=Smes2.Left-Smes1.Left-5;
  LMes10.Width:=Smes2.Left-Smes1.Left-5;
  LMes11.Width:=Smes2.Left-Smes1.Left-5;
  LMes12.Width:=Smes2.Left-Smes1.Left-5;

end;

procedure TFREPInfoGeneralPartos.HabilitarComponentesVersionBasica;
var ind : Integer;
begin
  inherited;
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
  begin
    CBAnalisis.Checked:= false;
    CBAnalisis.Enabled:= false;
  end;
end;

procedure TFREPInfoGeneralPartos.LAnioBClick(Sender: TObject);
begin
  inherited;
  CPSeleccionAnio.Visible := true;
end;

procedure TFREPInfoGeneralPartos.L1Click(Sender: TObject);
begin
  inherited;
  LAnioB.Caption := (Sender as Tlabel).Caption;
  CPSeleccionAnio.Visible := false;
  EAAnio.Text := LAnioB.Caption;
end;


procedure TFREPInfoGeneralPartos.RGPartosClick(Sender: TObject);
begin
  inherited;

 if (TRadioGroup(Sender).ItemIndex = 0) then
  begin
     parto1 := 'S';
     parto2 := 'N';
     parto3 := 'N';
     parto4 := 'N';
     todos := 'N';
  end;

  if (TRadioGroup(Sender).ItemIndex = 1) then
  begin
     parto1 := 'N';
     parto2 := 'S';
     parto3 := 'N';
     parto4 := 'N';
     todos := 'N';
  end;

  if (TRadioGroup(Sender).ItemIndex = 2) then
  begin
     parto1 := 'N';
     parto2 := 'N';
     parto3 := 'S';
     parto4 := 'N';
     todos := 'N';
  end;

  if (TRadioGroup(Sender).ItemIndex = 3) then
  begin
     parto1 := 'N';
     parto2 := 'N';
     parto3 := 'N';
     parto4 := 'S';
     todos := 'N';
  end;

  if (TRadioGroup(Sender).ItemIndex = 4) then
  begin
     parto1 := 'N';
     parto2 := 'N';
     parto3 := 'N';
     parto4 := 'N';
     todos := 'S';
  end;
  //actualizarFiltro;
end;

procedure TFREPInfoGeneralPartos.Button1Click(Sender: TObject);
begin
  inherited;
  actualizarFiltro;
end;



procedure TFREPInfoGeneralPartos.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

end.



