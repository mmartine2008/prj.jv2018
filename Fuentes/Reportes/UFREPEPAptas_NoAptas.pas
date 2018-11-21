unit UFREPEPAptas_NoAptas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, DBCtrls, ComCtrls, StdCtrls, ActnList, ExtCtrls,
  Buttons, UDBLookupComboBoxAuto, DateTimePickerAuto, TeEngine, Series,
  TeeProcs, Chart, DbChart, Grids, DBGrids, UBDBGrid, DB, IBCustomDataSet,
  IBQuery, IBStoredProc, DataExport, DataToXLS, WinXP, UMensajeImpresora,
  QRCtrls, MXGRID, MXDB, Mxstore, DBTables, MXTABLES, MXPIVSRC, DBXpress,
  FMTBcd, SqlExpr, IBDatabase, JvExControls, JvXPCore, JvXPContainer,
  MXGRAPH, UREPEPAptas_NoAptasPreview, JvGIF, PngImage, jpeg, JvLabel,
  ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TRegAptasNoAptas = record
    cant_no_aptas : integer;
    valor_no_aptas : double;
    por_no_aptas : double;
    cant_aptas : integer;
    valor_aptas : double;
    por_aptas : double;
  end;

  TRegGraficos = record
    valor_i : integer;
    valor_d : double;
    nombre : String;
  end;

  TRegPorRaza = record
    nombre : String;
    Datos : TRegAptasNoAptas;
  end;

  TRegTabla = record
    Nombre : String;
    Cant : Integer;
    Porcentaje : Double;
  end;

  TArrAreaP = Array [1..10] of TRegGraficos;

  TArrGraficos = Array of TRegGraficos;

  TFREPPreservicio = class(TFUniversal)
    PAnimales: TPanel;
    GBAnimales: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    PGraficos: TPanel;
    PTop: TPanel;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    GBGrupos: TGroupBox;
    DBLCBASeleccionGrupo: TDBLookupComboBoxAuto;
    RGTipo: TRadioGroup;
    DSGrupos: TDataSource;
    IBQGrupos: TIBQuery;
    IBQSPAptasNoAptasG: TIBQuery;
    DSAnimales: TDataSource;
    IBQAnimales: TIBQuery;
    PAptasNOAptas: TPanel;
    GBTactadas: TGroupBox;
    DBCAptasNoAptas: TDBChart;
    GroupBox2: TGroupBox;
    CBListado: TCheckBox;
    DBCAreaPTotal: TDBChart;
    DBCAreaPAptas: TDBChart;
    DBCFrameTotal: TDBChart;
    DBCFrameAptas: TDBChart;
    DBCAreaPFrame: TDBChart;
    CBDetalle: TCheckBox;
    GBVariables: TGroupBox;
    DCVariables: TDecisionCube;
    DSVariables: TDecisionSource;
    DGVariables: TDecisionGrid;
    IBQVariables: TIBQuery;
    IBQInsertAux: TIBQuery;
    DPVariables: TDecisionPivot;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Shape1: TShape;
    IBQCriteriosPreservicio: TIBQuery;
    IBQAnimalesID_ANIMAL: TIntegerField;
    IBQAnimalesRP_ANIMAL: TIBStringField;
    IBQAnimalesFRAME: TIBBCDField;
    IBQAnimalesID_GDR: TIntegerField;
    IBQAnimalesGDR: TIBStringField;
    IBQAnimalesPRENIEZ_ROBO: TIBStringField;
    IBQAnimalesRECHAZO: TIntegerField;
    IBQAnimalesAPROB_MANUAL: TIBStringField;
    IBQAnimalesEVALUACION_CALCULADA: TIBStringField;
    IBQAnimalesROBO: TIBStringField;
    IBQAnimalesRAZA: TIBStringField;
    IBQAnimalesPESO: TFloatField;
    IBQAnimalesAREA_PELVICA: TFloatField;
    IBQAnimalesALTO: TFloatField;
    IBQAnimalesANCHO: TFloatField;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    IExpExcel: TImage;
    Label1: TLabel;
    GConsulta: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    procedure RGTipoClick(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure DBLCBASeleccionGrupoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPAHastaChange(Sender: TObject);
    procedure DTPACloseUpFechas(Sender: TObject);
    procedure BBVerReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure BDBGAnimalesKeyPress(Sender: TObject; var Key: Char);
    procedure DBCAptasNoAptasGetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure DBCAreaPTotalGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure DBCAreaPAptasGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure GetMarkText(Sender: TChartSeries;
      ValueIndex: Integer; var MarkText: String);
    procedure DBCFrameTotalGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure DBCFrameAptasGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure IBQVariablesAfterOpen(DataSet: TDataSet);
    procedure DBCAreaPFrameGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure DBCAreaPFrameGetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    PorGrupo : Boolean;
    Fecha_ini, Fecha_fin : TDate;
    Grupo : Integer;



    ArrGdr : Array [1..5] of TRegAptasNoAptas;
    ArrAP : Array [1..5] of TRegAptasNoAptas;
    ArrPeso : Array [1..3] of TRegAptasNoAptas;
    ArrFrame : TRegAptasNoAptas;
    ArrRaza : Array of TRegPorRaza;
    ArrCriteriosTabla : Array [0..9] of TRegTabla;

    ArrTotalAreaP : TArrAreaP;
    ArrAptasAreaP : TArrAreaP;
    ArrTotalFrame : Array [1..9] of TRegGraficos;
    ArrAptasFrame : Array [1..9] of TRegGraficos;
    ArrRazaFrame : TArrGraficos;
    ArrRazaAreaP : TArrGraficos;
    ArrAptasNoAptas : Array [1..2] of TRegGraficos;

    SAreaPTotal, SAreaPAptas : TBarSeries;
    SFrameTotal, SFrameAptas : TBarSeries;
    SFrameRaza : TLineSeries;
    SAreaPRaza : TBarSeries;
    SAptasNoAptas : TPieSeries;

    function Apta() : Boolean;
    procedure AgregarAreaP(var Arreglo : TArrAreaP);
    procedure ArmarGraficos();
    procedure CalcularPromedios();
    procedure IniciarDetalle();
    procedure CalcularDetalles();
    procedure ActualizarConsulta();
    procedure AgregarRaza();
    procedure AgregarRazaGrafico(var Arr : TArrGraficos; valor : Double);
    procedure OrdenarRaza();
    procedure ArmarTablaNoAptas(F : TFREPDEPAptas_NoAptasPreview);
    procedure EvaluarAnimal;
    procedure CalcularPorcentajesYOrdenar();
    procedure ArmarTabla(F : TFREPDEPAptas_NoAptasPreview);
  public
    { Public declarations }
  end;

var
  FREPPreservicio: TFREPPreservicio;

implementation

uses UREPListadoEventoPreview, UDMSoftvet, UPrincipal, UREPFichaAnimal,
   UCartel, UTraduccion;

{$R *.dfm}


procedure TFREPPreservicio.RGTipoClick(Sender: TObject);
begin
  inherited;
  PorGrupo := TRadioGroup(Sender).ItemIndex = 1;

  DBLCBASeleccionGrupo.Enabled := PorGrupo;
  GBGrupos.Enabled := PorGrupo;
  GBSeleccionFechas.Enabled := not PorGrupo;
  LDesde.Enabled := not PorGrupo;
  LHasta.Enabled := not PorGrupo;
  DTPADesde.Enabled := not PorGrupo;
  DTPAHasta.Enabled := not PorGrupo;
end;

procedure TFREPPreservicio.BBSalirClick(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFREPPreservicio.ActualizarConsulta();
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance;
  msje:= 'Calculando Hembras Aptas/No Aptas para Servicio ...';
  cartel.abrircartel(msje);

 { IBQSPAptasNoAptasG.Close;
  IBQSPAptasNoAptasG.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;}

  IBQAnimales.Close;
  IBQAnimales.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;

  if PorGrupo then
  begin
   { IBQSPAptasNoAptasG.ParamByName('FECHA_INI').Value := null;
    IBQSPAptasNoAptasG.ParamByName('FECHA_FIN').Value := null;
    IBQSPAptasNoAptasG.ParamByName('GRUPO').AsInteger := Grupo;}

    IBQAnimales.ParamByName('FECHA_INI').Value := null;
    IBQAnimales.ParamByName('FECHA_FIN').Value := null;
    IBQAnimales.ParamByName('GRUPO').AsInteger := Grupo;
  end
  else
  begin
    {IBQSPAptasNoAptasG.ParamByName('FECHA_INI').AsDate := Fecha_Ini;
    IBQSPAptasNoAptasG.ParamByName('FECHA_FIN').AsDate := Fecha_Fin;
    IBQSPAptasNoAptasG.ParamByName('GRUPO').Value := null;}

    IBQAnimales.ParamByName('FECHA_INI').AsDate := Fecha_Ini;
    IBQAnimales.ParamByName('FECHA_FIN').AsDate := Fecha_Fin;
    IBQAnimales.ParamByName('GRUPO').Value := null;
  end;

  //IBQSPAptasNoAptasG.Open;
  IBQAnimales.Open;

 { DPVariables.Visible := false;          ------esto es para usar el cubo de desiciones
  DCVariables.DataSet := nil;
  IBQVariables.Close;
  IBQVariables.Open;

  if IBQVariables.RecordCount > 1 then
  begin
    DPVariables.Visible := true;
    DCVariables.DataSet := IBQVariables;
  end;                 }

  cartel.cerrarcartel;
  cartel.FreeInstance;

  CalcularDetalles();
end;

procedure TFREPPreservicio.DBLCBASeleccionGrupoClick(Sender: TObject);
begin
  inherited;
  if (DBLCBASeleccionGrupo.KeyValue <> null) then
  begin
    Grupo := DBLCBASeleccionGrupo.KeyValue;
  end;

end;

procedure TFREPPreservicio.FormShow(Sender: TObject);
begin
  inherited;
  IBQGrupos.Close;
  IBQGrupos.ParamByName('esta').AsInteger := Fprincipal.establecimientoActual;
  IBQGrupos.Open;
  IBQGrupos.Last;
  IBQGrupos.First;
  if (DBLCBASeleccionGrupo.KeyValue = NULL) then
    DBLCBASeleccionGrupo.KeyValue := IBQGrupos.FieldValues['ID_GRUPO'];

  DTPAHasta.DateTime := now;
  DTPADesde.DateTime := DTPAHasta.DateTime - 365;
  //BBVerReporte.Enabled := not(BDBGAnimales.DataSource.DataSet.IsEmpty);
  Fecha_Ini := DTPADesde.Date;
  Fecha_Fin := DTPAHasta.Date;
  PorGrupo := false;
  //DecimalSeparator:='.';
end;

procedure TFREPPreservicio.DTPAHastaChange(Sender: TObject);
begin
  inherited;
{  if(DTPAHasta.Date > now) then
      DTPAHasta.Date:=now;
  Fecha_Fin := DTPAHasta.Date;
  ActualizarConsulta();}
end;

procedure TFREPPreservicio.DTPACloseUpFechas(Sender: TObject);
begin
  inherited;
  if (TDateTimePickerAuto(Sender).Name = 'DTPADesde') then
    begin
      if(DTPADesde.Date >= DTPAHasta.Date) then
         DTPADesde.Date:= DTPAHasta.Date;
      Fecha_Ini := DTPADesde.Date;
    end
   else
    if (TDateTimePickerAuto(Sender).Name = 'DTPAHasta') then
      begin
        if(DTPAHasta.Date > now) then
            DTPAHasta.Date:=now;
        Fecha_Fin := DTPAHasta.Date;
      end;
end;

procedure TFREPPreservicio.BBVerReporteClick(Sender: TObject);
var
  cartel : TCartel;
  I : Integer;
  Componente : TComponent;
  Total : Double;
begin
//   MostrarMensajeImpresion();
  inherited;
  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando Reporte de Hembras Aptas/No Aptas para Servicio...');
  Application.CreateForm(TFREPDEPAptas_NoAptasPreview, FREPDEPAptas_NoAptasPreview);
  if (RGTipo.ItemIndex = 1) then
  begin
    FREPDEPAptas_NoAptasPreview.QRLD.Enabled := false;
    FREPDEPAptas_NoAptasPreview.QRLDesde.Enabled := false;
    FREPDEPAptas_NoAptasPreview.QRLG.Enabled := true;
    FREPDEPAptas_NoAptasPreview.QRLGrupo.Enabled := true;
    FREPDEPAptas_NoAptasPreview.QRLGrupo.Caption := DBLCBASeleccionGrupo.Text;
    FREPDEPAptas_NoAptasPreview.QRLH.Enabled := false;
    FREPDEPAptas_NoAptasPreview.QRLHasta.Enabled := false;
    FREPDEPAptas_NoAptasPreview.QRLPeriodo.Enabled := false;
  end
  else
  begin
    FREPDEPAptas_NoAptasPreview.QRLD.Enabled := true;
    FREPDEPAptas_NoAptasPreview.QRLDesde.Enabled := true;
    FREPDEPAptas_NoAptasPreview.QRLG.Enabled := false;
    FREPDEPAptas_NoAptasPreview.QRLGrupo.Enabled := false;
    FREPDEPAptas_NoAptasPreview.QRLDesde.Caption := DateToStr(DTPADesde.Date);
    FREPDEPAptas_NoAptasPreview.QRLHasta.Caption := DateToStr(DTPAHasta.Date);
    FREPDEPAptas_NoAptasPreview.QRLH.Enabled := true;
    FREPDEPAptas_NoAptasPreview.QRLHasta.Enabled := true;
    FREPDEPAptas_NoAptasPreview.QRLPeriodo.Enabled := true;
  end;
  FREPDEPAptas_NoAptasPreview.Detalle := CBDetalle.Checked;
  FREPDEPAptas_NoAptasPreview.Listado := CBListado.Checked;

  DBCAptasNoAptas.SaveToMetafile(ExtractFilePath(Application.ExeName)+'grafico.wmf');
  FREPDEPAptas_NoAptasPreview.QRIAptasNoAptas.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'grafico.wmf');

  //DGVariables.

  ArmarTablaNoAptas(FREPDEPAptas_NoAptasPreview);
  FREPDEPAptas_NoAptasPreview.QRLPorNoAptas.Caption := FormatFloat('#0.0#',ArrAptasNoAptas[2].valor_d/(ArrAptasNoAptas[1].valor_d+ArrAptasNoAptas[2].valor_d)*100)+'%';


  if CBDetalle.Checked then
  begin
    DBCAreaPTotal.SaveToMetafile(ExtractFilePath(Application.ExeName)+'AreaPTotal.wmf');
    DBCAreaPAptas.SaveToMetafile(ExtractFilePath(Application.ExeName)+'AreaPAptas.wmf');
    DBCFrameTotal.SaveToMetafile(ExtractFilePath(Application.ExeName)+'FrameTotal.wmf');
    DBCFrameAptas.SaveToMetafile(ExtractFilePath(Application.ExeName)+'FrameAptas.wmf');
    DBCAreaPFrame.SaveToMetafile(ExtractFilePath(Application.ExeName)+'FrameAreaP.wmf');

    ///////////////////CUADRO GRADO DESARROLLO REPRODUCTIVO //////////////////////////////////////
    Total := ArrGDR[1].cant_aptas+ArrGDR[2].cant_aptas+ArrGDR[3].cant_aptas+ArrGDR[4].cant_aptas
    +ArrGDR[1].cant_no_aptas+ArrGDR[2].cant_no_aptas+ArrGDR[3].cant_no_aptas+ArrGDR[4].cant_no_aptas;

    FREPDEPAptas_NoAptasPreview.Cant1Aptas.Caption := IntToStr(ArrGDR[1].cant_aptas);
    FREPDEPAptas_NoAptasPreview.Cant1NoAptas.Caption := IntToStr(ArrGDR[1].cant_no_aptas);
    FREPDEPAptas_NoAptasPreview.Cant1Total.Caption := IntToStr((ArrGDR[1].cant_aptas+ArrGDR[1].cant_no_aptas));
    FREPDEPAptas_NoAptasPreview.Cant2Aptas.Caption := IntToStr(ArrGDR[2].cant_aptas);
    FREPDEPAptas_NoAptasPreview.Cant2NoAptas.Caption := IntToStr(ArrGDR[2].cant_no_aptas);
    FREPDEPAptas_NoAptasPreview.Cant2Total.Caption := IntToStr((ArrGDR[2].cant_aptas+ArrGDR[2].cant_no_aptas));
    FREPDEPAptas_NoAptasPreview.Cant3Aptas.Caption := IntToStr(ArrGDR[3].cant_aptas);
    FREPDEPAptas_NoAptasPreview.Cant3NoAptas.Caption := IntToStr(ArrGDR[3].cant_no_aptas);
    FREPDEPAptas_NoAptasPreview.Cant3Total.Caption := IntToStr((ArrGDR[3].cant_aptas+ArrGDR[3].cant_no_aptas));
    FREPDEPAptas_NoAptasPreview.Cant4Aptas.Caption := IntToStr(ArrGDR[4].cant_aptas);
    FREPDEPAptas_NoAptasPreview.Cant4NoAptas.Caption := IntToStr(ArrGDR[4].cant_no_aptas);
    FREPDEPAptas_NoAptasPreview.Cant4Total.Caption := IntToStr((ArrGDR[4].cant_aptas+ArrGDR[4].cant_no_aptas));
    FREPDEPAptas_NoAptasPreview.CantAptas.Caption := IntToStr(ArrGDR[1].cant_aptas+ArrGDR[2].cant_aptas+ArrGDR[3].cant_aptas+ArrGDR[4].cant_aptas);
    FREPDEPAptas_NoAptasPreview.CantNoAptas.Caption := IntToStr(ArrGDR[1].cant_no_aptas+ArrGDR[2].cant_no_aptas+ArrGDR[3].cant_no_aptas+ArrGDR[4].cant_no_aptas);
    FREPDEPAptas_NoAptasPreview.CantTotal.Caption := FormatFloat('##.#',Total);

    FREPDEPAptas_NoAptasPreview.Por1Aptas.Caption := FormatFloat('#0.#',(ArrGDR[1].por_aptas)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por1NoAptas.Caption := FormatFloat('#0.#',(ArrGDR[1].por_no_aptas)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por1Total.Caption := FormatFloat('#0.#',((ArrGDR[1].cant_aptas+ArrGDR[1].cant_no_aptas)/Total)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por2Aptas.Caption := FormatFloat('#0.#',(ArrGDR[2].por_aptas)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por2NoAptas.Caption := FormatFloat('#0.#',(ArrGDR[2].por_no_aptas)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por2Total.Caption := FormatFloat('#0.#',((ArrGDR[2].cant_aptas+ArrGDR[2].cant_no_aptas)/Total)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por3Aptas.Caption := FormatFloat('#0.#',(ArrGDR[3].por_aptas)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por3NoAptas.Caption := FormatFloat('#0.#',(ArrGDR[3].por_no_aptas)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por3Total.Caption := FormatFloat('#0.#',((ArrGDR[3].cant_aptas+ArrGDR[3].cant_no_aptas)/Total)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por4Aptas.Caption := FormatFloat('#0.#',(ArrGDR[4].por_aptas)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por4NoAptas.Caption := FormatFloat('#0.#',(ArrGDR[4].por_no_aptas)*100)+'%';
    FREPDEPAptas_NoAptasPreview.Por4Total.Caption := FormatFloat('#0.#',((ArrGDR[4].cant_aptas+ArrGDR[4].cant_no_aptas)/Total)*100)+'%';
    FREPDEPAptas_NoAptasPreview.PorAptas.Caption := FormatFloat('#0.#',(ArrGDR[1].por_aptas+ArrGDR[2].por_aptas+ArrGDR[3].por_aptas+ArrGDR[4].por_aptas)*100)+'%';
    FREPDEPAptas_NoAptasPreview.PorNoAptas.Caption := FormatFloat('#0.#',(ArrGDR[1].por_no_aptas+ArrGDR[2].por_no_aptas+ArrGDR[3].por_no_aptas+ArrGDR[4].por_no_aptas)*100)+'%';
    FREPDEPAptas_NoAptasPreview.PorTotal.Caption := FormatFloat('#0.#',1*100)+'%';
    //////////////////////////////////////////////////////////////////////////////
    ///////////////////////CUADRO AREA PELVICA///////////////////////////////////
    FREPDEPAptas_NoAptasPreview.AnchoAptas.Caption := FormatFloat('#0.##',ArrAP[1].valor_aptas);
    FREPDEPAptas_NoAptasPreview.AnchoNoAptas.Caption := FormatFloat('#0.##',ArrAP[1].valor_no_aptas);
    FREPDEPAptas_NoAptasPreview.AnchoTotal.Caption := FormatFloat('#0.##',(ArrAP[1].valor_aptas+ArrAP[1].valor_no_aptas)/2);
    FREPDEPAptas_NoAptasPreview.AltoAptas.Caption := FormatFloat('#0.##',ArrAP[2].valor_aptas);
    FREPDEPAptas_NoAptasPreview.AltoNoAptas.Caption := FormatFloat('#0.##',ArrAP[2].valor_no_aptas);
    FREPDEPAptas_NoAptasPreview.AltoTotal.Caption := FormatFloat('#0.##',(ArrAP[2].valor_aptas+ArrAP[2].valor_no_aptas)/2);
    FREPDEPAptas_NoAptasPreview.APAptas.Caption := FormatFloat('#0.##',ArrAP[3].valor_aptas);
    FREPDEPAptas_NoAptasPreview.APNoAptas.Caption := FormatFloat('#0.##',ArrAP[3].valor_no_aptas);
    FREPDEPAptas_NoAptasPreview.APTotal.Caption := FormatFloat('#0.##',(ArrAP[3].valor_aptas+ArrAP[3].valor_no_aptas)/2);
    FREPDEPAptas_NoAptasPreview.APMinAptas.Caption := FormatFloat('#0.##',ArrAP[4].valor_aptas);
    FREPDEPAptas_NoAptasPreview.APMinNoAptas.Caption := FormatFloat('#0.##',ArrAP[4].valor_no_aptas);
    if ArrAP[4].valor_aptas < ArrAP[4].valor_no_aptas then
      FREPDEPAptas_NoAptasPreview.APMinTotal.Caption := FormatFloat('#0.##',ArrAP[4].valor_aptas)
    else
      FREPDEPAptas_NoAptasPreview.APMinTotal.Caption := FormatFloat('#0.##',ArrAP[4].valor_no_aptas);
    FREPDEPAptas_NoAptasPreview.APMaxAptas.Caption := FormatFloat('#0.##',ArrAP[5].valor_aptas);
    FREPDEPAptas_NoAptasPreview.APMaxNoAptas.Caption := FormatFloat('#0.##',ArrAP[5].valor_no_aptas);
    if ArrAP[5].valor_aptas > ArrAP[5].valor_no_aptas then
      FREPDEPAptas_NoAptasPreview.APMaxTotal.Caption := FormatFloat('#0.##',ArrAP[5].valor_aptas)
    else
      FREPDEPAptas_NoAptasPreview.APMaxTotal.Caption := FormatFloat('#0.##',ArrAP[5].valor_no_aptas);
    //////////////////////////////////////////////////////////////////////////////
    /////////////////////////////GRAFICOS AREA PELVICA////////////////////////////
    FREPDEPAptas_NoAptasPreview.QRIAreaPTotal.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'AreaPTotal.wmf');
    FREPDEPAptas_NoAptasPreview.QRIAreaPAptas.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'AreaPAptas.wmf');
    //////////////////////////////////////////////////////////////////////////////
    /////////////////////////////TABLA DE PESO////////////////////////////////////
    FREPDEPAptas_NoAptasPreview.PesoAptas.Caption := FormatFloat('#0.##',ArrPeso[1].valor_aptas)+'kgs';
    FREPDEPAptas_NoAptasPreview.PesoNoAptas.Caption := FormatFloat('#0.##',ArrPeso[1].valor_no_aptas)+'kgs';
    FREPDEPAptas_NoAptasPreview.PesoTotal.Caption := FormatFloat('#0.##',(ArrPeso[1].valor_aptas+ArrPeso[1].valor_no_aptas)/2)+'kgs';
    if ArrPeso[2].valor_aptas = 10000 then
      ArrPeso[2].valor_aptas := 0;
    if ArrPeso[2].valor_no_aptas = 10000 then
      ArrPeso[2].valor_no_aptas := 0;
    FREPDEPAptas_NoAptasPreview.PesoMinAptas.Caption := FormatFloat('#0.##',ArrPeso[2].valor_aptas)+'kgs';
    FREPDEPAptas_NoAptasPreview.PesoMinNoAptas.Caption := FormatFloat('#0.##',ArrPeso[2].valor_no_aptas)+'kgs';
    if ArrPeso[2].valor_aptas < ArrPeso[2].valor_no_aptas then
      FREPDEPAptas_NoAptasPreview.PesoMinTotal.Caption := FormatFloat('#0.##',ArrPeso[2].valor_aptas)+'kgs'
    else
      FREPDEPAptas_NoAptasPreview.PesoMinTotal.Caption := FormatFloat('#0.##',ArrPeso[2].valor_no_aptas)+'kgs';
    FREPDEPAptas_NoAptasPreview.PesoMaxAptas.Caption := FormatFloat('#0.##',ArrPeso[3].valor_aptas)+'kgs';
    FREPDEPAptas_NoAptasPreview.PesoMaxNoAptas.Caption := FormatFloat('#0.##',ArrPeso[3].valor_no_aptas)+'kgs';
    if ArrPeso[3].valor_aptas > ArrPeso[3].valor_no_aptas then
      FREPDEPAptas_NoAptasPreview.PesoMaxTotal.Caption := FormatFloat('#0.##',ArrPeso[3].valor_aptas)+'kgs'
    else
      FREPDEPAptas_NoAptasPreview.PesoMaxTotal.Caption := FormatFloat('#0.##',ArrPeso[3].valor_no_aptas)+'kgs';
    //////////////////////////////////////////////////////////////////////////////
    ////////////////////////////TABLA DE FRAME////////////////////////////////////
    FREPDEPAptas_NoAptasPreview.FrameAptas.Caption := FormatFloat('#0.##',ArrFrame.valor_aptas);
    FREPDEPAptas_NoAptasPreview.FrameNoAptas.Caption := FormatFloat('#0.##',ArrFrame.valor_no_aptas);
    FREPDEPAptas_NoAptasPreview.FrameTotal.Caption := FormatFloat('#0.##',(ArrFrame.valor_aptas+ArrFrame.valor_no_aptas)/2);
    //////////////////////////////////////////////////////////////////////////////
    //////////////////////////GRAFICOS DE FRAME///////////////////////////////////
    FREPDEPAptas_NoAptasPreview.QRIFrameTotal.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'FrameTotal.wmf');
    FREPDEPAptas_NoAptasPreview.QRIFrameAptas.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'FrameAptas.wmf');
    //////////////////////////////////////////////////////////////////////////////
    //////////////////////////TABLA DE RAZAS//////////////////////////////////////
    Total := 0;
    for I := 0 to Length(ArrRaza)-1 do
      Total := Total+ArrRaza[I].Datos.cant_aptas+ArrRaza[I].Datos.cant_no_aptas;
      
    for I := 0 to Length(ArrRaza)-1 do
    begin
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('QRLRaza'+IntToStr(I+1));
      if Componente <> nil then
        (Componente as TQRLabel).Caption := ArrRaza[I].nombre;

      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('CantR'+IntToStr(I+1)+'Aptas');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := IntToStr(ArrRaza[I].Datos.cant_aptas);
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('PorR'+IntToStr(I+1)+'Aptas');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := FormatFloat('##.##',ArrRaza[I].Datos.por_aptas*100)+'%';
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('CantR'+IntToStr(I+1)+'NoAptas');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := IntToStr(ArrRaza[I].Datos.cant_no_aptas);
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('PorR'+IntToStr(I+1)+'NoAptas');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := FormatFloat('##.##',ArrRaza[I].Datos.por_no_aptas*100)+'%';
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('CantR'+IntToStr(I+1)+'Total');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := IntToStr(ArrRaza[I].Datos.cant_aptas+ArrRaza[I].Datos.cant_no_aptas);
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('PorR'+IntToStr(I+1)+'Total');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := FormatFloat('##.##',(ArrRaza[I].Datos.cant_aptas+ArrRaza[I].Datos.cant_no_aptas)/Total*100)+'%';
    end;
    I := Length(ArrRaza);
    while (I < 4) do
    begin
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('QRLRaza'+IntToStr(I+1));
      if Componente <> nil then
        (Componente as TQRLabel).Caption := '-';
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('CantR'+IntToStr(I+1)+'Aptas');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := ' ';
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('PorR'+IntToStr(I+1)+'Aptas');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := ' ';
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('CantR'+IntToStr(I+1)+'NoAptas');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := ' ';
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('PorR'+IntToStr(I+1)+'NoAptas');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := ' ';
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('CantR'+IntToStr(I+1)+'Total');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := ' ';
      Componente := FREPDEPAptas_NoAptasPreview.FindComponent('PorR'+IntToStr(I+1)+'Total');
      if Componente <> nil then
        (Componente as TQRLabel).Caption := ' ';
      Inc(I);
    end;
    Total := 0;
    for I := 0 to Length(ArrRaza)-1 do
      Total := Total+ArrRaza[I].Datos.cant_aptas;
    FREPDEPAptas_NoAptasPreview.CantRAptas.Caption := FormatFloat('#0',Total);
    Total := 0;
    for I := 0 to Length(ArrRaza)-1 do
      Total := Total+ArrRaza[I].Datos.por_aptas;
    FREPDEPAptas_NoAptasPreview.PorRAptas.Caption := FormatFloat('#0.##',Total*100)+'%';
    Total := 0;
    for I := 0 to Length(ArrRaza)-1 do
      Total := Total+ArrRaza[I].Datos.cant_no_aptas;
    FREPDEPAptas_NoAptasPreview.CantRNoAptas.Caption := FormatFloat('#0',Total);
    Total := 0;
    for I := 0 to Length(ArrRaza)-1 do
      Total := Total+ArrRaza[I].Datos.por_no_aptas;
    FREPDEPAptas_NoAptasPreview.PorRNoAptas.Caption := FormatFloat('#0.##',Total*100)+'%';
    Total := 0;
    for I := 0 to Length(ArrRaza)-1 do
      Total := Total+ArrRaza[I].Datos.cant_aptas+ArrRaza[I].Datos.cant_no_aptas;
    FREPDEPAptas_NoAptasPreview.CantRTotal.Caption := FormatFloat('#0',Total);
    {Total := 0;
    for I := 0 to Length(ArrRaza)-1 do
      Total := Total+ArrRaza[I].Datos.por_aptas+ArrRaza[I].Datos.por_no_aptas;}
    FREPDEPAptas_NoAptasPreview.PorRTotal.Caption := FormatFloat('#0.##',1*100)+'%';
    //////////////////////////////////////////////////////////////////////////////
    ///////////////////////GRAFICO DE FRAME Vs AREA PELVICA POR RAZA//////////////
    FREPDEPAptas_NoAptasPreview.QRIFrameAreaP.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'FrameAreaP.wmf');
    //////////////////////////////////////////////////////////////////////////////
  end;
  
  cartel.cerrarcartel;
  cartel.FreeInstance;

  FREPDEPAptas_NoAptasPreview.ShowModal;
  FREPDEPAptas_NoAptasPreview.Destroy;

end;

procedure TFREPPreservicio.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(IBQGrupos);
end;


procedure TFREPPreservicio.IBQAnimalesAfterOpen(DataSet: TDataSet);

begin
  inherited;

  IBQAnimales.Last;
  IBQAnimales.First;
  BDBGAnimales.DataSource := DSAnimales;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQAnimales.RecordCount)+']';


  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFREPPreservicio.BDBGAnimalesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BDBGAnimales.SelectedIndex = 0 then
    if not(IBQAnimales.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQAnimales.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPPreservicio.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPPreservicio.BDBGAnimalesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BDBGAnimalesDblClick(nil);
end;

procedure TFREPPreservicio.DBCAptasNoAptasGetLegendText(
  Sender: TCustomAxisPanel; LegendStyle: TLegendStyle; Index: Integer;
  var LegendText: String);
begin
  inherited;
  {LegendText := StringReplace(LegendText,'P',FormatFloat('####',ArrAptasNoAptas[1].valor_d)+' Aptas',[rfReplaceAll, rfIgnoreCase]);
  LegendText := StringReplace(LegendText,'N',FormatFloat('####',ArrAptasNoAptas[2].valor_d)+' No Aptas',[rfReplaceAll, rfIgnoreCase]);}
end;

procedure TFREPPreservicio.IniciarDetalle();
var
  I : Integer;
begin
  for I := 1 to 5 do
  begin
    ArrGDR[I].cant_no_aptas := 0;
    ArrGDR[I].cant_aptas := 0;
    ArrGDR[I].por_aptas := 0;
    ArrGDR[I].por_no_aptas := 0;
    ArrGDR[I].valor_aptas := 0;
    ArrGDR[I].valor_no_aptas := 0;

    ArrAP[I].cant_aptas := 0;
    ArrAP[I].cant_no_aptas := 0;
    ArrAP[I].por_aptas := 0;
    ArrAP[I].por_no_aptas := 0;
    ArrAP[I].valor_aptas := 0;
    ArrAP[I].valor_no_aptas := 0;

    if I <= 3 then
    begin
      ArrPeso[I].cant_aptas := 0;
      ArrPeso[I].cant_no_aptas := 0;
      ArrPeso[I].por_aptas := 0;
      ArrPeso[I].por_no_aptas := 0;
      ArrPeso[I].valor_aptas := 0;
      ArrPeso[I].valor_no_aptas := 0;
    end;
  end;

  ArrAP[4].valor_aptas := 10000;
  ArrAP[4].valor_no_aptas := 10000;
  ArrPeso[2].valor_aptas := 10000;
  ArrPeso[2].valor_no_aptas := 10000;

  ArrFrame.cant_aptas := 0;
  ArrFrame.cant_no_aptas := 0;
  ArrFrame.por_aptas := 0;
  ArrFrame.por_no_aptas := 0;
  ArrFrame.valor_aptas := 0;
  ArrFrame.valor_no_aptas := 0;

  for I := 1 to 10 do
  begin
    case I of
      1 : begin
            ArrTotalAreaP[I].nombre := '< 120 cm2';
            ArrAptasAreaP[I].nombre := '< 120 cm2';
          end;
      2 : begin
            ArrTotalAreaP[I].nombre := '120-130 cm2';
            ArrAptasAreaP[I].nombre := '120-130 cm2';
          end;
      3 : begin
            ArrTotalAreaP[I].nombre := '130-140 cm2';
            ArrAptasAreaP[I].nombre := '130-140 cm2';
          end;
      4 : begin
            ArrTotalAreaP[I].nombre := '140-150 cm2';
            ArrAptasAreaP[I].nombre := '140-150 cm2';
          end;
      5 : begin
            ArrTotalAreaP[I].nombre := '150-160 cm2';
            ArrAptasAreaP[I].nombre := '150-160 cm2';
          end;
      6 : begin
            ArrTotalAreaP[I].nombre := '160-170 cm2';
            ArrAptasAreaP[I].nombre := '160-170 cm2';
          end;
      7 : begin
            ArrTotalAreaP[I].nombre := '170-180 cm2';
            ArrAptasAreaP[I].nombre := '170-180 cm2';
          end;
      8 : begin
            ArrTotalAreaP[I].nombre := '180-190 cm2';
            ArrAptasAreaP[I].nombre := '180-190 cm2';
          end;
      9 : begin
            ArrTotalAreaP[I].nombre := '190-200 cm2';
            ArrAptasAreaP[I].nombre := '190-200 cm2';
          end;
      10 : begin
            ArrTotalAreaP[I].nombre := '> 200 cm2';
            ArrAptasAreaP[I].nombre := '> 200 cm2';
          end;
    end;
    ArrTotalAreaP[I].valor_i := 0;
    ArrAptasAreaP[I].valor_i := 0;
  end;

  for I := 1 to 9 do
  begin
    ArrTotalFrame[I].nombre := IntToStr(I);
    ArrTotalFrame[I].valor_i := 0;
    ArrAptasFrame[I].valor_i := 0;
    ArrAptasFrame[I].nombre := IntToStr(I);
  end;
  SetLength(ArrRaza,0);
  SetLength(ArrRazaFrame,0);
  SetLength(ArrRazaAreaP,0);

  ArrAptasNoAptas[1].nombre := 'Aptas';
  ArrAptasNoAptas[1].valor_d := 0;
  ArrAptasNoAptas[2].nombre := 'No Aptas';
  ArrAptasNoAptas[2].valor_d := 0;

end;

function TFREPPreservicio.Apta : Boolean;
begin
  Result := ((IBQAnimales.FieldByName('APROB_MANUAL').Value = 'N') AND (IBQAnimales.FieldByName('EVALUACION_CALCULADA').Value = 'P'))
            OR
            ((IBQAnimales.FieldByName('APROB_MANUAL').Value = 'S') AND (IBQAnimales.FieldByName('EVALUACION_CALCULADA').Value = 'N'))
end;

procedure TFREPPreservicio.AgregarAreaP(var Arreglo : TArrAreaP);
begin
  if IBQAnimales.FieldByName('AREA_PELVICA').AsInteger < 120 then
    Inc(Arreglo[1].valor_i);
  if IBQAnimales.FieldByName('AREA_PELVICA').AsInteger in [120..130] then
    Inc(Arreglo[2].valor_i);
  if IBQAnimales.FieldByName('AREA_PELVICA').AsInteger in [130..140] then
    Inc(Arreglo[3].valor_i);
  if IBQAnimales.FieldByName('AREA_PELVICA').AsInteger in [140..150] then
    Inc(Arreglo[4].valor_i);
  if IBQAnimales.FieldByName('AREA_PELVICA').AsInteger in [150..160] then
    Inc(Arreglo[5].valor_i);
  if IBQAnimales.FieldByName('AREA_PELVICA').AsInteger in [160..170] then
    Inc(Arreglo[6].valor_i);
  if IBQAnimales.FieldByName('AREA_PELVICA').AsInteger in [170..180] then
    Inc(Arreglo[7].valor_i);
  if IBQAnimales.FieldByName('AREA_PELVICA').AsInteger in [180..190] then
    Inc(Arreglo[8].valor_i);
  if IBQAnimales.FieldByName('AREA_PELVICA').AsInteger in [190..200] then
    Inc(Arreglo[9].valor_i);
  if IBQAnimales.FieldByName('AREA_PELVICA').AsInteger > 200 then
    Inc(Arreglo[10].valor_i);
end;

procedure TFREPPreservicio.CalcularDetalles();
var
  I : Integer;
begin
  IniciarDetalle;
  IBQAnimales.First;
  while not IBQAnimales.Eof do
  begin
    if Apta then
      ArrAptasNoAptas[1].valor_d := ArrAptasNoAptas[1].valor_d+1
    else
      ArrAptasNoAptas[2].valor_d := ArrAptasNoAptas[2].valor_d+1;
    //GDR
    if IBQAnimales.FieldValues['ID_GDR'] <> null then
      if IBQAnimales.FieldByName('ID_GDR').Value <> 0 then
      begin
        if Apta then
          Inc(ArrGDR[IBQAnimales.FieldByName('ID_GDR').AsInteger].cant_aptas)
        else
          Inc(ArrGDR[IBQAnimales.FieldByName('ID_GDR').AsInteger].cant_no_aptas);
      end;
    //AreaPelvica
    if IBQAnimales.FieldByName('AREA_PELVICA').AsFloat > 0 then
    begin
      AgregarAreaP(ArrTotalAreaP);
      AgregarRazaGrafico(ArrRazaAreaP,IBQAnimales.FieldByName('AREA_PELVICA').AsFloat);
    end;
    if Apta then
    begin
      if IBQAnimales.FieldByName('AREA_PELVICA').AsFloat > 0 then
      begin
        AgregarAreaP(ArrAptasAreaP);
        ArrAP[1].valor_aptas := ArrAP[1].valor_aptas + IBQAnimales.fieldByName('ANCHO').AsFloat;
        Inc(ArrAP[1].cant_aptas);
        ArrAP[2].valor_aptas := ArrAP[2].valor_aptas + IBQAnimales.fieldByName('ALTO').AsFloat;
        Inc(ArrAP[2].cant_aptas);
        ArrAP[3].valor_aptas := ArrAP[3].valor_aptas + IBQAnimales.fieldByName('AREA_PELVICA').AsFloat;
        Inc(ArrAP[3].cant_aptas);

        if ArrAP[4].valor_aptas > IBQAnimales.FieldByName('AREA_PELVICA').AsFloat then
          ArrAP[4].valor_aptas := IBQAnimales.FieldByName('AREA_PELVICA').AsFloat;
        if ArrAP[5].valor_aptas < IBQAnimales.FieldByName('AREA_PELVICA').AsFloat then
          ArrAP[5].valor_aptas := IBQAnimales.FieldByName('AREA_PELVICA').AsFloat;
      end;
    end
    else
    begin
      if IBQAnimales.FieldByName('AREA_PELVICA').AsFloat > 0 then
      begin
        ArrAP[1].valor_no_aptas := ArrAP[1].valor_no_aptas + IBQAnimales.fieldByName('ANCHO').AsFloat;
        Inc(ArrAP[1].cant_no_aptas);
        ArrAP[2].valor_no_aptas := ArrAP[2].valor_no_aptas + IBQAnimales.fieldByName('ALTO').AsFloat;
        Inc(ArrAP[2].cant_no_aptas);
        ArrAP[3].valor_no_aptas := ArrAP[3].valor_no_aptas + IBQAnimales.fieldByName('AREA_PELVICA').AsFloat;
        Inc(ArrAP[3].cant_no_aptas);

        if ArrAP[4].valor_no_aptas > IBQAnimales.FieldByName('AREA_PELVICA').AsFloat then
          ArrAP[4].valor_no_aptas := IBQAnimales.FieldByName('AREA_PELVICA').AsFloat;
        if ArrAP[5].valor_no_aptas < IBQAnimales.FieldByName('AREA_PELVICA').AsFloat then
          ArrAP[5].valor_no_aptas := IBQAnimales.FieldByName('AREA_PELVICA').AsFloat;
      end;
    end;
    //Peso
    if IBQAnimales.FieldValues['PESO'] <> null then
    begin
      if Apta then
      begin
        ArrPeso[1].valor_aptas := ArrPeso[1].valor_aptas + IBQAnimales.fieldByName('PESO').AsFloat;
        Inc(ArrPeso[1].cant_aptas);
        if ArrPeso[2].valor_aptas > IBQAnimales.FieldByName('PESO').AsFloat then
          ArrPeso[2].valor_aptas := IBQAnimales.FieldByName('PESO').AsFloat;
        if ArrPeso[3].valor_aptas < IBQAnimales.FieldByName('PESO').AsFloat then
          ArrPeso[3].valor_aptas := IBQAnimales.FieldByName('PESO').AsFloat;
      end
      else
      begin
        ArrPeso[1].valor_no_aptas := ArrPeso[1].valor_no_aptas + IBQAnimales.fieldByName('PESO').AsFloat;
        Inc(ArrPeso[1].cant_no_aptas);
        if ArrPeso[2].valor_no_aptas > IBQAnimales.FieldByName('PESO').AsFloat then
          ArrPeso[2].valor_no_aptas := IBQAnimales.FieldByName('PESO').AsFloat;
        if ArrPeso[3].valor_no_aptas < IBQAnimales.FieldByName('PESO').AsFloat then
          ArrPeso[3].valor_no_aptas := IBQAnimales.FieldByName('PESO').AsFloat;
      end;
    end;
    //Frame
    I := Round(IBQAnimales.FieldByName('FRAME').AsFloat);
    if Apta then
    begin
      if IBQAnimales.fieldByName('FRAME').AsFloat > 0 then
      begin
        ArrFrame.valor_aptas := ArrFrame.valor_aptas + IBQAnimales.fieldByName('FRAME').AsFloat;
        Inc(ArrFrame.cant_aptas);
        Inc(ArrAptasFrame[I].valor_i);
      end;
    end
    else
    begin
      if IBQAnimales.fieldByName('FRAME').AsFloat > 0 then
      begin
        ArrFrame.valor_no_aptas := ArrFrame.valor_no_aptas + IBQAnimales.fieldByName('FRAME').AsFloat;
        Inc(ArrFrame.cant_no_aptas);
      end;
    end;
    if IBQAnimales.fieldByName('FRAME').AsFloat > 0 then
    begin
      Inc(ArrTotalFrame[I].valor_i);
      AgregarRazaGrafico(ArrRazaFrame,IBQAnimales.FieldByName('FRAME').AsFloat);
    end;
    //Raza
    AgregarRaza();
    ///
    IBQAnimales.Next;
  end;
  OrdenarRaza();
  CalcularPromedios();
  ArmarGraficos();
end;

procedure TFREPPreservicio.OrdenarRaza();
var
  I, K, C : Integer;
  Aux : TRegPorRaza;
  Aux1 : TRegGraficos;
begin

  C := Length(ArrRazaFrame); //prueba para saber si ese arreglo tiene valores

  for I := 0 to 3 do  //4 primaras razas
  begin
    for K := I to Length(ArrRaza)-1 do
      if ArrRaza[I].Datos.cant_aptas < ArrRaza[K].Datos.cant_aptas then
      begin
        Aux := ArrRaza[I];
        ArrRaza[I] := ArrRaza[K];
        ArrRaza[K] := Aux;

        Aux1 := ArrRazaFrame[I];
        ArrRazaFrame[I] := ArrRazaFrame[K];
        ArrRazaFrame[K] := Aux1;

        Aux1 := ArrRazaAreaP[I];
        ArrRazaAreaP[I] := ArrRazaAreaP[K];
        ArrRazaAreaP[K] := Aux1;
      end;
    if (Length(ArrRaza)>0) and (ArrRaza[I].Datos.cant_aptas = 0) then
      for K := I+1 to Length(ArrRaza)-1 do
        if ArrRaza[I].Datos.cant_no_aptas < ArrRaza[K].Datos.cant_no_aptas then
        begin
          Aux := ArrRaza[I];
          ArrRaza[I] := ArrRaza[K];
          ArrRaza[K] := Aux;

          Aux1 := ArrRazaFrame[I];
          ArrRazaFrame[I] := ArrRazaFrame[K];
          ArrRazaFrame[K] := Aux1;

          Aux1 := ArrRazaAreaP[I];
          ArrRazaAreaP[I] := ArrRazaAreaP[K];
          ArrRazaAreaP[K] := Aux1;
        end;
  end;
end;

procedure TFREPPreservicio.AgregarRazaGrafico(var Arr : TArrGraficos; valor : Double);
var
  I : Integer;
begin
  ///primero busco para ver si ya existe la raza
  I := 0;
  while I < Length(Arr) do
  begin
    if Arr[I].nombre <> IBQAnimales.FieldByName('RAZA').AsString then
      Inc(I)
    else
      break;

  end;

  if I = Length(Arr) then
  begin
    SetLength(Arr,I+1);
    Arr[I].nombre := '-';
    Arr[I].valor_i := 0;
    Arr[I].valor_d := 0;
  end;
  ///
  Arr[I].nombre := IBQAnimales.FieldByName('RAZA').AsString;
  Arr[I].valor_d := Arr[I].valor_d + valor;
  Arr[I].valor_i := Arr[I].valor_i + 1;
end;

procedure TFREPPreservicio.AgregarRaza();
var
  I : Integer;
begin
  ///primero busco para ver si ya existe la raza
  I := 0;
  while I < Length(ArrRaza) do
  begin
    if ArrRaza[I].nombre = IBQAnimales.FieldByName('RAZA').AsString then
      break;
    Inc(I);
  end;
  if I = Length(ArrRaza) then
  begin
    SetLength(ArrRaza,I+1);
    ArrRaza[I].Datos.cant_no_aptas := 0;
    ArrRaza[I].Datos.cant_aptas := 0;
    ArrRaza[I].Datos.por_aptas := 0;
    ArrRaza[I].Datos.por_no_aptas := 0;
    ArrRaza[I].Datos.valor_aptas := 0;
    ArrRaza[I].Datos.valor_no_aptas := 0;
    ArrRaza[I].nombre := '-';
  end;
  ///
  ArrRaza[I].nombre := IBQAnimales.FieldValues['RAZA'];
  if Apta then
    Inc(ArrRaza[I].Datos.cant_aptas)
  else
    Inc(ArrRaza[I].Datos.cant_no_aptas);

end;

procedure TFREPPreservicio.CalcularPromedios();
var
  Total, I : Integer;
begin
  ///GDR
  ArrGDR[5].cant_aptas := ArrGDR[1].cant_aptas+ArrGDR[2].cant_aptas+ArrGDR[3].cant_aptas+ArrGDR[4].cant_aptas;
  ArrGDR[5].cant_no_aptas := ArrGDR[1].cant_no_aptas+ArrGDR[2].cant_no_aptas+ArrGDR[3].cant_no_aptas+ArrGDR[4].cant_no_aptas;
  Total := ArrGDR[1].cant_aptas+ArrGDR[2].cant_aptas+ArrGDR[3].cant_aptas+ArrGDR[4].cant_aptas;
  if total > 0 then
  begin
    ArrGDR[1].por_aptas := ArrGDR[1].cant_aptas / Total;
    ArrGDR[2].por_aptas := ArrGDR[2].cant_aptas / Total;
    ArrGDR[3].por_aptas := ArrGDR[3].cant_aptas / Total;
    ArrGDR[4].por_aptas := ArrGDR[4].cant_aptas / Total;
  end;
  Total := ArrGDR[1].cant_no_aptas+ArrGDR[2].cant_no_aptas+ArrGDR[3].cant_no_aptas+ArrGDR[4].cant_no_aptas;
  if total > 0 then
  begin
    ArrGDR[1].por_no_aptas := ArrGDR[1].cant_no_aptas / Total;
    ArrGDR[2].por_no_aptas := ArrGDR[2].cant_no_aptas / Total;
    ArrGDR[3].por_no_aptas := ArrGDR[3].cant_no_aptas / Total;
    ArrGDR[4].por_no_aptas := ArrGDR[4].cant_no_aptas / Total;
  end;
  ///Area Pelvica
  if ArrAP[1].cant_aptas > 0 then
    ArrAP[1].valor_aptas := ArrAP[1].valor_aptas / ArrAP[1].cant_aptas;
  if ArrAP[2].cant_aptas > 0 then
    ArrAP[2].valor_aptas := ArrAP[2].valor_aptas / ArrAP[2].cant_aptas;
  if ArrAP[3].cant_aptas > 0 then
    ArrAP[3].valor_aptas := ArrAP[3].valor_aptas / ArrAP[3].cant_aptas;

  if ArrAP[1].cant_no_aptas > 0 then
    ArrAP[1].valor_no_aptas := ArrAP[1].valor_no_aptas / ArrAP[1].cant_no_aptas;
  if ArrAP[2].cant_no_aptas > 0 then
    ArrAP[2].valor_no_aptas := ArrAP[2].valor_no_aptas / ArrAP[2].cant_no_aptas;
  if ArrAP[3].cant_no_aptas > 0 then
    ArrAP[3].valor_no_aptas := ArrAP[3].valor_no_aptas / ArrAP[3].cant_no_aptas;
  ///Peso
  if ArrPeso[1].cant_aptas > 0 then
    ArrPeso[1].valor_aptas := ArrPeso[1].valor_aptas / ArrPeso[1].cant_aptas;
  if ArrPeso[1].cant_no_aptas > 0 then
    ArrPeso[1].valor_no_aptas := ArrPeso[1].valor_no_aptas / ArrPeso[1].cant_no_aptas;
  ///Frame
  if ArrFrame.cant_aptas > 0 then
    ArrFrame.valor_aptas := ArrFrame.valor_aptas / ArrFrame.cant_aptas;
  if ArrFrame.cant_no_aptas > 0 then
    ArrFrame.valor_no_aptas := ArrFrame.valor_no_aptas / ArrFrame.cant_no_aptas;
  ///Raza
  Total := 0;
  I := 0;
  while((I <= (Length(ArrRaza)-1)) and (I <= 4)) do
  begin
    Total := Total + ArrRaza[I].Datos.cant_aptas;
    Inc(I);
  end;
  if Total > 0 then
  begin
    I := 0;
    while ((I<=(Length(ArrRaza)-1)) and (I <= 4)) do
    begin
      ArrRaza[I].Datos.por_aptas := ArrRaza[I].Datos.cant_aptas / Total;
      Inc(I);
    end;
  end;

  Total := 0;
  I := 0;
  while((I<=(Length(ArrRaza)-1)) and (I <= 4)) do
  begin
    Total := Total + ArrRaza[I].Datos.cant_no_aptas;
    Inc(I);
  end;
  if Total > 0 then
  begin
    I := 0;
    while ((I<=(Length(ArrRaza)-1)) and (I <= 4)) do
    begin
      ArrRaza[I].Datos.por_no_aptas := ArrRaza[I].Datos.cant_no_aptas / Total;
      Inc(I);
    end;
  end;
  ////

end;

procedure TFREPPreservicio.ArmarGraficos();
var
  ArrAux : Array [1..10] of double;
  ArrAux1 : Array [1..9] of double;
  ArrAux2 : Array [1..5] of double;
  ArrAux3 : Array [1..2] of double;
  I : Integer;
begin
  SAreaPTotal := TBarSeries.Create(nil);
  SAreaPAptas := TBarSeries.Create(nil);
  SFrameTotal := TBarSeries.Create(nil);
  SFrameAptas := TBarSeries.Create(nil);
  SFrameRaza := TLineSeries.Create(nil);
  SAreaPRaza := TBarSeries.Create(nil);
  SAptasNoAptas := TPieSeries.Create(nil);

  SAreaPTotal.Clear;
  SAreaPTotal.SeriesColor := clGreen;
  SAreaPTotal.Marks.Style := smsValue;
  SAreaPTotal.Marks.Transparent := false;
  SAreaPTotal.Marks.Clip := true;
  SAreaPTotal.Marks.ArrowLength := 5;
  SAreaPTotal.Marks.BackColor := clWhite;

  SAreaPTotal.OnGetMarkText := GetMarkText;

  SAreaPAptas.Clear;
  SAreaPAptas.SeriesColor := clGreen;
  SAreaPAptas.Marks.Style := smsValue;
  SAreaPAptas.Marks.Transparent := false;
  SAreaPAptas.Marks.Clip := true;
  SAreaPAptas.Marks.ArrowLength := 5;
  SAreaPAptas.Marks.BackColor := clWhite;

  SAreaPAptas.OnGetMarkText := GetMarkText;

  SFrameTotal.Clear;
  SFrameTotal.SeriesColor := clGreen;
  SFrameTotal.Marks.Style := smsValue;
  SFrameTotal.Marks.Transparent := false;
  SFrameTotal.Marks.Clip := true;
  SFrameTotal.Marks.ArrowLength := 5;
  SFrameTotal.Marks.BackColor := clWhite;

  SFrameTotal.OnGetMarkText := GetMarkText;

  SFrameAptas.Clear;
  SFrameAptas.SeriesColor := clGreen;
  SFrameAptas.Marks.Style := smsValue;
  SFrameAptas.Marks.Transparent := false;
  SFrameAptas.Marks.Clip := true;
  SFrameAptas.Marks.ArrowLength := 5;
  SFrameAptas.Marks.BackColor := clWhite;

  SFrameAptas.OnGetMarkText := GetMarkText;

  SAreaPRaza.Clear;
  SAreaPRaza.SeriesColor := clGreen;
  SAreaPRaza.Marks.Visible := true;
  SAreaPRaza.Marks.Style := smsValue;
  SAreaPRaza.Marks.Transparent := false;
  SAreaPRaza.Marks.Clip := true;
  SAreaPRaza.Marks.ArrowLength := 5;
  SAreaPRaza.Marks.BackColor := clWhite;
//  SAreaPRaza.VertAxis := aLeftAxis;

  SAreaPRaza.OnGetMarkText := GetMarkText;

  SFrameRaza.Clear;
  SFrameRaza.SeriesColor := clBlue;
  SFrameRaza.Marks.Visible := true;
  SFrameRaza.Marks.Style := smsValue;
  SFrameRaza.Marks.Transparent := false;
  SFrameRaza.Marks.Clip := true;
  SFrameRaza.Marks.ArrowLength := 5;
  SFrameRaza.Marks.BackColor := clWhite;
  SFRameRaza.Pointer.Style := psTriangle;
  SFrameRaza.Pointer.Visible := true;
  SFrameRaza.VertAxis := aRightAxis;

  SFrameRaza.OnGetMarkText := GetMarkText;

  SAptasNoAPtas.Clear;
  SAptasNoAptas.Marks.Style := smsPercent;
  SAptasNoAPtas.Marks.BackColor := clWhite;
  {SAptasNoAPtas.Marks.Transparent := false;
  SAptasNoAPtas.Marks.Clip := true;
  SAptasNoAPtas.Marks.ArrowLength := 5;}

  for I := 1 to 10 do
    ArrAux[I] := ArrTotalAreaP[I].valor_i;

  DBCAreaPTotal.RemoveAllSeries;
  DBCAreaPTotal.AddSeries(SAreaPTotal);
  SAreaPTotal.AddArray(ArrAux);

  for I := 1 to 10 do
    ArrAux[I] := ArrAptasAreaP[I].valor_i;

  DBCAreaPAptas.RemoveAllSeries;
  DBCAreaPAptas.AddSeries(SAreaPAptas);
  SAreaPAptas.AddArray(ArrAux);

  for I := 1 to 9 do
    ArrAux1[I] := ArrTotalFrame[I].valor_i;

  DBCFrameTotal.RemoveAllSeries;
  DBCFrameTotal.AddSeries(SFrameTotal);
  SFrameTotal.AddArray(ArrAux1);

  for I := 1 to 9 do
    ArrAux1[I] := ArrAptasFrame[I].valor_i;

  DBCFrameAptas.RemoveAllSeries;
  DBCFrameAptas.AddSeries(SFrameAptas);
  SFrameAptas.AddArray(ArrAux1);

  DBCAreaPFrame.RemoveAllSeries;

  for  I := 1 to 5 do
    ArrAux2[I] := 0;

  if Length(ArrRazaAreaP) > 0 then
  begin
    I := 0;
    while ((I<=(Length(ArrRazaAreaP)-1)) and (I <= 4)) do
    begin
      ArrAux2[I+1] := ArrRazaAreaP[I].valor_d / ArrRazaAreaP[I].valor_i;//(ArrRaza[I].Datos.cant_aptas+ArrRaza[I].Datos.cant_no_aptas);
      Inc(I);
    end;

    DBCAreaPFrame.AddSeries(SAreaPRaza);
    SAreaPRaza.AddArray(ArrAux2);
  end;

  for  I := 1 to 5 do
    ArrAux2[I] := 0;

  if Length(ArrRazaFrame) > 0 then
  begin
    I := 0;
    while ((I<=(Length(ArrRazaFrame)-1)) and (I <= 4)) do
    begin
      ArrAux2[I+1] := ArrRazaFrame[I].valor_d / ArrRazaFrame[I].valor_i;//(ArrRaza[I].Datos.cant_aptas+ArrRaza[I].Datos.cant_no_aptas);
      Inc(I);
    end;

    DBCAreaPFrame.AddSeries(SFrameRaza);
    for I := 1 to Length(ArrRazaFrame) do
      SFrameRaza.Add(ArrAux2[I],'',clBlue);
    //SFrameRaza.AddArray(ArrAux2);
  end;

  ArrAux3[1] := ArrAptasNoAptas[1].valor_d; {/ (ArrAptasNoAptas[1].valor_d+ArrAptasNoAptas[2].valor_d);}
  ArrAux3[2] := ArrAptasNoAptas[2].valor_d; {/ (ArrAptasNoAptas[1].valor_d+ArrAptasNoAptas[2].valor_d);}
  DBCAptasNoAptas.RemoveAllSeries;
  DBCAptasNoAptas.AddSeries(SAptasNoAptas);
  SAptasNoAptas.Add(ArrAux3[1],'Aptas',clGreen);
  SAptasNoAptas.Add(ArrAux3[2],'No Aptas',clRed);

end;

procedure TFREPPreservicio.DBCAreaPTotalGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrTotalAreaP)>0) then
      begin
        if ArrTotalAreaP[valor+1].nombre = '-' then
          LabelText := ArrTotalAreaP[valor+1].nombre
        else
          LabelText := ArrTotalAreaP[valor+1].nombre;
      end;
end;

procedure TFREPPreservicio.DBCAreaPAptasGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrAptasAreaP)>0) then
      begin
        if ArrAptasAreaP[valor+1].nombre = '-' then
          LabelText := ArrAptasAreaP[valor+1].nombre
        else
          LabelText := ArrAptasAreaP[valor+1].nombre;
      end;
end;

procedure TFREPPreservicio.GetMarkText(Sender: TChartSeries;
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

procedure TFREPPreservicio.DBCFrameTotalGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrTotalFrame)>0) then
      begin
        if ArrTotalFrame[valor+1].nombre = '-' then
          LabelText := ArrTotalFrame[valor+1].nombre
        else
          LabelText := ArrTotalFrame[valor+1].nombre;
      end;
end;

procedure TFREPPreservicio.DBCFrameAptasGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrAptasFrame)>0) then
      begin
        if ArrAptasFrame[valor+1].nombre = '-' then
          LabelText := ArrAptasFrame[valor+1].nombre
        else
          LabelText := ArrAptasFrame[valor+1].nombre;
      end;
end;

procedure TFREPPreservicio.IBQVariablesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

procedure TFREPPreservicio.DBCAreaPFrameGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  inherited;
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrRaza)>valor) then
      begin
        if ArrRaza[valor].nombre = '-' then
          LabelText := ArrRaza[valor].nombre
        else
          LabelText := ArrRaza[valor].nombre;
      end
      else
        LabelText := '-'
end;

procedure TFREPPreservicio.DBCAreaPFrameGetLegendText(
  Sender: TCustomAxisPanel; LegendStyle: TLegendStyle; Index: Integer;
  var LegendText: String);
begin
  inherited;
  if Index = 0 then LegendText := 'Area Pelvica';
  if Index = 1 then LegendText := 'Frame';
end;

procedure TFREPPreservicio.ArmarTablaNoAptas(F : TFREPDEPAptas_NoAptasPreview);
begin
  ArrCriteriosTabla[0].Cant := 0;
  ArrCriteriosTabla[0].Nombre := 'GDR';
  ArrCriteriosTabla[0].Porcentaje := 0;
  ArrCriteriosTabla[1].Cant := 0;
  ArrCriteriosTabla[1].Nombre := 'Frame';
  ArrCriteriosTabla[1].Porcentaje := 0;
  ArrCriteriosTabla[2].Cant := 0;
  ArrCriteriosTabla[2].Nombre := 'Area Pelvica';
  ArrCriteriosTabla[2].Porcentaje := 0;
  ArrCriteriosTabla[3].Cant := 0;
  ArrCriteriosTabla[3].Nombre := 'Peso';
  ArrCriteriosTabla[3].Porcentaje := 0;
  ArrCriteriosTabla[4].Cant := 0;
  ArrCriteriosTabla[4].Nombre := 'Preñez por Robo';
  ArrCriteriosTabla[4].Porcentaje := 0;
  ArrCriteriosTabla[5].Cant := 0;
  ArrCriteriosTabla[5].Nombre := 'Infantilismo';
  ArrCriteriosTabla[5].Porcentaje := 0;
  ArrCriteriosTabla[6].Cant := 0;
  ArrCriteriosTabla[6].Nombre := 'Free Martin';
  ArrCriteriosTabla[6].Porcentaje := 0;
  ArrCriteriosTabla[7].Cant := 0;
  ArrCriteriosTabla[7].Nombre := 'Anormalidad Uterina';
  ArrCriteriosTabla[7].Porcentaje := 0;
  ArrCriteriosTabla[8].Cant := 0;
  ArrCriteriosTabla[8].Nombre := 'Desaprobación Manual';
  ArrCriteriosTabla[8].Porcentaje := 0;
  ArrCriteriosTabla[9].Cant := 0;
  ArrCriteriosTabla[9].Nombre := 'Total';
  ArrCriteriosTabla[9].Porcentaje := 0;

  IBQCriteriosPreservicio.Close;
  IBQCriteriosPreservicio.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCriteriosPreservicio.Open;

  IBQAnimales.First;
  while not IBQAnimales.Eof do
  begin
    if not Apta then
      EvaluarAnimal;
    IBQAnimales.Next;
  end;
  IBQAnimales.First;
  CalcularPorcentajesYOrdenar();
  ArmarTabla(F);
end;

procedure TFREPPreservicio.CalcularPorcentajesYOrdenar();
var
  i, k : integer;
  RegAux : TRegTabla;
  max : double;
begin
  ///Calcular porcentajes;
  for i := 0 to 9 do
    ArrCriteriosTabla[i].Porcentaje := ArrCriteriosTabla[i].Cant/ArrCriteriosTabla[9].Cant;
  ///Ordenar
  for i := 0 to 8 do
  begin
    Max := ArrCriteriosTabla[i].Porcentaje;
    for k := i+1 to 8 do
    if Max < ArrCriteriosTabla[k].Porcentaje then
    begin
      RegAux := ArrCriteriosTabla[i];
      ArrCriteriosTabla[i] := ArrCriteriosTabla[k];
      ArrCriteriosTabla[k] := RegAux;
      Max := ArrCriteriosTabla[i].Porcentaje;
    end;
  end;
end;

procedure TFREPPreservicio.EvaluarAnimal;
var pPeso, pGDRMin, pFrameMin, pFrameMax, pAreaPelvMin, pAreaPelvMax : integer;
begin
   // Ubico y recupero el peso.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMINPE',[]);
   pPeso := IBQCriteriosPreservicio.FieldValues['VALOR'];
   // Ubico y recupero el Gdr.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMINGDR',[]);
   pGDRMin := IBQCriteriosPreservicio.FieldValues['VALOR'];
   // Ubico y recupero el frame min.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMINFR',[]);
   pFrameMin := IBQCriteriosPreservicio.FieldValues['VALOR'];
   // Ubico y recupero el frame max.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMAXFR',[]);
   pFrameMax := IBQCriteriosPreservicio.FieldValues['VALOR'];
   // Ubico y recupero el area pelvica min.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMINAP',[]);
   pAreaPelvMin := IBQCriteriosPreservicio.FieldValues['VALOR'];
   // Ubico y recupero el area pelvica max.
   IBQCriteriosPreservicio.Locate('NOMBRE','MPMAXAP',[]);
   pAreaPelvMax := IBQCriteriosPreservicio.FieldValues['VALOR'];


   ///FRAME
   if IBQAnimales.FieldValues['FRAME'] <> null then
    if ((IBQAnimales.FieldValues['FRAME'] > pFrameMax) or (IBQAnimales.FieldValues['FRAME'] < pFrameMin)) then
      Inc(ArrCriteriosTabla[1].Cant);

   ////GDR
   if IBQAnimales.FieldValues['ID_GDR'] = 1 then
    Inc(ArrCriteriosTabla[0].Cant);

   ////Area Pelvica
   if IBQAnimales.FieldValues['AREA_PELVICA'] <> null then
    if ((IBQAnimales.FieldValues['AREA_PELVICA'] > pAreaPelvMax) or (IBQAnimales.FieldValues['AREA_PELVICA'] < pAreaPelvMin)) then
      Inc(ArrCriteriosTabla[2].Cant);

   ////PESO
   if IBQAnimales.FieldValues['PESO'] <> null then
    if (IBQAnimales.FieldValues['PESO'] < pPeso) then
      Inc(ArrCriteriosTabla[3].Cant);

   ////PRENIEZ POR ROBO
   if IBQAnimales.FieldValues['PRENIEZ_ROBO'] = 'S' then
    Inc(ArrCriteriosTabla[4].Cant);

   ////RECHAZO
   if IBQAnimales.FieldValues['RECHAZO'] <> 0 then
    case IBQAnimales.FieldValues['RECHAZO'] of
      1 : Inc(ArrCriteriosTabla[5].Cant);
      2 : Inc(ArrCriteriosTabla[6].Cant);
      3 : Inc(ArrCriteriosTabla[7].Cant);
    end;

   ////Rechazo Manual
   if (IBQAnimales.FieldValues['EVALUACION_CALCULADA'] = 'P') and (IBQAnimales.FieldValues['APROB_MANUAL'] = 'S') then
    Inc(ArrCriteriosTabla[8].Cant);

   ///Total
   Inc(ArrCriteriosTabla[9].Cant);
end;

procedure TFREPPreservicio.ArmarTabla(F : TFREPDEPAptas_NoAptasPreview);
var
  ProxTop : Integer;
  fil : integer;
begin
  ProxTop := 617;
  for fil := 0 to 9 do
    if ArrCriteriosTabla[fil].Cant > 0 then
    begin
      ///////////////////////////////////////////
      /////////////SHAPES
      with (TQRShape(F.QRBand4.AddPrintable(TQRShape))) do
      begin
        Left := 166;
        Top := ProxTop;
        Height := 17;
        Width := 145;
        Shape := qrsRectangle;
      end;
      //Cantidad
      with (TQRShape(F.QRBand4.AddPrintable(TQRShape))) do
      begin
        Left := 310;
        Top := ProxTop;
        Height := 17;
        Width := 121;
        Shape := qrsRectangle;
      end;
      //Porcentaje
      with (TQRShape(F.QRBand4.AddPrintable(TQRShape))) do
      begin
        Left := 430;
        Top := ProxTop;
        Height := 17;
        Width := 129;
        Shape := qrsRectangle;
      end;
      ////////////////////////////////////////
      /////////////////LABELS
      //Nombre
      with (TQRLabel(F.QRBand4.AddPrintable(TQRLabel))) do
      begin
        Left := 168;
        Top := ProxTop;
        autoSize := false;
        alignment := taLeftJustify;
        Height := 17;
        Width := 145;
        Font.Size := 10;
        if ArrCriteriosTabla[fil].nombre = 'Total' then
          Font.Style := [fsBold];
        Caption := ArrCriteriosTabla[fil].Nombre;
        Transparent := true;
      end;
      //Cantidad
      with (TQRLabel(F.QRBand4.AddPrintable(TQRLabel))) do
      begin
        Left := 310;
        Top := ProxTop;
        autoSize := false;
        alignment := taCenter;
        Height := 17;
        Width := 121;
        Font.Size := 10;
        if ArrCriteriosTabla[fil].nombre = 'Total' then
          Font.Style := [fsBold];
        Caption := IntToStr(ArrCriteriosTabla[fil].Cant);
        Transparent := true;
      end;
      //Porcentaje
      with (TQRLabel(F.QRBand4.AddPrintable(TQRLabel))) do
      begin
        Left := 430;
        Top := ProxTop;
        autoSize := false;
        alignment := taCenter;
        Height := 17;
        Width := 129;
        Font.Size := 10;
        if ArrCriteriosTabla[fil].nombre = 'Total' then
          Font.Style := [fsBold];
        Caption := FormatFloat('#0.0#',ArrCriteriosTabla[fil].Porcentaje*100)+'%';
        Transparent := true;
      end;
      ProxTop := ProxTop + 17;
    end;
end;

procedure TFREPPreservicio.DTPADesdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUpFechas(Sender);
end;

procedure TFREPPreservicio.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFREPPreservicio.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
