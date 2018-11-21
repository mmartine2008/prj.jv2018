unit UREPDGVersusPrenez;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, DBCtrls, Types,
  UDBLookupComboBoxAuto, DateTimePickerAuto, StdCtrls, TeEngine, Series,
  TeeProcs, Chart, DbChart, Buttons, Grids, DBGrids, UBDBGrid, DB,
  IBCustomDataSet, IBQuery, ComboBoxAuto, DBTables, MXTABLES, MXDB, MXGRAPH,
  Mxstore, ValEdit, QuickRpt, QRCtrls, IBStoredProc, WinXP, DataExport,
  DataToXLS, TeeFunci, DateUtils, UMensajeImpresora, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPDGVersusPrenez = class(TFUniversal)
    PAnimales: TPanel;
    GBAnimales: TGroupBox;
    BitDBGrid1: TBitDBGrid;
    PGraficos: TPanel;
    PTop: TPanel;
    Splitter2: TSplitter;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    GBGrupos: TGroupBox;
    DBLCBASeleccionGrupo: TDBLookupComboBoxAuto;
    RGTipo: TRadioGroup;
    DSAnimales: TDataSource;
    IBQAnimales: TIBQuery;
    DSGrupos: TDataSource;
    IBQGrupos: TIBQuery;
    IBQCA: TIBQuery;
    Panel2: TPanel;
    ASalir: TAction;
    AImprimirReporte: TAction;
    IBQCU: TIBQuery;
    IBQCO: TIBQuery;
    IBQNN: TIBQuery;
    IBQVA: TIBQuery;
    Ptactadas: TPanel;
    GBGrafico: TGroupBox;
    GBTabla: TGroupBox;
    SGTabla: TStringGrid;
    IBQAux: TIBQuery;
    Panel3: TPanel;
    Panel4: TPanel;
    PTituloTabla: TPanel;
    IBQPreniadas: TIBQuery;
    PConfiguracion: TPanel;
    RGTipoReporte: TRadioGroup;
    RGFiltro: TRadioGroup;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    CBACategoria: TComboBoxAuto;
    RGGrafico: TRadioGroup;
    DBCPrenezPreniadas: TDBChart;
    DBCPrenezVacias: TDBChart;
    CBImprimirGrafico: TCheckBox;
    CBImprimirTabla: TCheckBox;
    IBQCondCorp: TIBQuery;
    IBQCodsCronDentVacias: TIBQuery;
    IBQCodsCronDentPreniadas: TIBQuery;
    Series7: TBarSeries;
    GroupBox1: TGroupBox;
    CBCabeza: TCheckBox;
    CBCuerpo: TCheckBox;
    CBCola: TCheckBox;
    Series5: TBarSeries;
    Series4: TBarSeries;
    Series6: TBarSeries;
    IBQDistribucion: TIBQuery;
    CBListado: TCheckBox;
    IBQCantidades: TIBQuery;
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
    GConsulta: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RGFiltroClick(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure RGTipoReporteClick(Sender: TObject);
    procedure RGGraficoClick(Sender: TObject);
    procedure Rodeos(Sender: TObject);
    procedure CBACategoriaChange(Sender: TObject);
    procedure SGTablaDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure IBQGruposBeforeOpen(DataSet: TDataSet);
    procedure BitDBGrid1DblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure DBCPrenezVaciasBeforeDrawAxes(Sender: TObject);
    procedure DBCPrenezVaciasGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure DBCPrenezPreniadasBeforeDrawAxes(Sender: TObject);
    procedure DBCPrenezPreniadasGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure CBCabezaClick(Sender: TObject);
    procedure CBCuerpoClick(Sender: TObject);
    procedure CBColaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function Series4BeforeAdd(Sender: TChartSeries): Boolean;
    function Series5BeforeAdd(Sender: TChartSeries): Boolean;
    function Series6BeforeAdd(Sender: TChartSeries): Boolean;
    function Series7BeforeAdd(Sender: TChartSeries): Boolean;
    procedure GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: String);
    procedure IBQCantidadesAfterOpen(DataSet: TDataSet);
    procedure BitDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure DTPACloseUpFechas(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    escala : Integer;
    incremento : real;
    Total : TBarSeries;
    procedure actualizarConsulta;
    procedure vaciarTodo;
    procedure llenarParametros(valor : integer);
    procedure llenarQuerys(s1 : AnsiString; s2 : AnsiString );
    procedure parametrizar(s1 : AnsiString; valor : Variant);
    procedure configurarGrafico(TitleVacias, TitleBottom, TitlePreniadas : AnsiString);
    procedure ArmarTabla;
    procedure ArmarTablaCronologiaDentaria;
    procedure ArmarTablaCondicionCorporal;
    procedure ArmarEncabezadoFilas;
    procedure ArmarColumna(col : Integer; KeyValue : variant);
    procedure LimpiarTotales;
    procedure llenarTotalesFilas(col : integer);
    function buscarEnQuery(col : integer; fil : integer; KeyValue : variant; IBQ : TIBQuery; distribucion : String) :integer;
    procedure ActualizarBotones;
    procedure ConfigurarReporte;
    procedure GenerarReporteTabla;
    procedure CrearTotales();
    procedure CalcAnchoBarra(Inc : Boolean);
  public
  end;

var
  FREPDGVersusPrenez: TFREPDGVersusPrenez;
  TotCA : integer;
  TotCU : integer;
  TotCO : integer;
  TotNN : integer;
  TotVA : integer;
  AnchoBarra : Integer = 100;

implementation

uses UDMSoftvet, UPrincipal, UREPDGVersusPrenezPreview, UREPFichaAnimal, UCartel, UTraduccion;

{$R *.dfm}

procedure TFREPDGVersusPrenez.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

// metodo para configurar el reporte
procedure TFREPDGVersusPrenez.AImprimirReporteExecute(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  MostrarMensajeImpresion();
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del Reporte de Comparación de Preñez ...';
  cartel.abrircartel(msje);
  inherited;
  Application.CreateForm(TFREPDGVersusPrenezPreview, FREPDGVersusPrenezPreview);
  if (RGTipo.ItemIndex = 0) then
  begin
    FREPDGVersusPrenezPreview.QRLD.Enabled := false;
    FREPDGVersusPrenezPreview.QRLDesde.Enabled := false;
    FREPDGVersusPrenezPreview.QRLG.Enabled := true;
    FREPDGVersusPrenezPreview.QRLGrupo.Enabled := true;
    FREPDGVersusPrenezPreview.QRLGrupo.Caption := DBLCBASeleccionGrupo.Text;
    FREPDGVersusPrenezPreview.QRLH.Enabled := false;
    FREPDGVersusPrenezPreview.QRLHasta.Enabled := false;
    FREPDGVersusPrenezPreview.QRLPeriodo.Enabled := false;
  end
  else
  begin
    FREPDGVersusPrenezPreview.QRLD.Enabled := true;
    FREPDGVersusPrenezPreview.QRLDesde.Enabled := true;
    FREPDGVersusPrenezPreview.QRLG.Enabled := false;
    FREPDGVersusPrenezPreview.QRLGrupo.Enabled := false;
    FREPDGVersusPrenezPreview.QRLDesde.Caption := DateToStr(DTPADesde.Date);
    FREPDGVersusPrenezPreview.QRLHasta.Caption := DateToStr(DTPAHasta.Date);
    FREPDGVersusPrenezPreview.QRLH.Enabled := true;
    FREPDGVersusPrenezPreview.QRLHasta.Enabled := true;
    FREPDGVersusPrenezPreview.QRLPeriodo.Enabled := true;
  end;
  FREPDGVersusPrenezPreview.Grafico := CBImprimirGrafico.Checked;
  FREPDGVersusPrenezPreview.Tabla := CBImprimirTabla.Checked;
  DBCPrenezVacias.SaveToMetafile(ExtractFilePath(Application.ExeName)+'grafico.wmf');
  DBCPrenezPreniadas.SaveToMetafile(ExtractFilePath(Application.ExeName)+'grafico1.wmf');
  FREPDGVersusPrenezPreview.QRIVersusVacias.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'grafico.wmf');
  FREPDGVersusPrenezPreview.QRIVersusPreniadas.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'grafico1.wmf');
  ConfigurarReporte;

  cartel.cerrarcartel();
  cartel.FreeInstance();  
  FREPDGVersusPrenezPreview.ShowModal;
  HabilitarDesabilitarControles();  
end;

procedure TFREPDGVersusPrenez.FormShow(Sender: TObject);
begin
  inherited;
  DTPADesde.DateTime := IncYear(now,-1);
  DTPAHasta.DateTime := now;

  // selecciono los rodeos del establecimiento
  DMSoftvet.IBQRodeo.close;
  DMSoftvet.IBQRodeo.ParamByName('esta').Value := Fprincipal.establecimientoActual;
  DMSoftvet.IBQRodeo.Open;

  IBQGrupos.Open;
  DMSoftvet.IBQAfterOpen(IBQGrupos);

  IBQGrupos.First;
  if (DBLCBASeleccionGrupo.KeyValue = NULL) then
    DBLCBASeleccionGrupo.KeyValue := IBQGrupos.FieldValues['ID_GRUPO'];

  LDesde.Enabled:= false;
  LHasta.Enabled:= false;
  DTPADesde.Enabled:= false;
  DTPAHasta.Enabled:= false;

  IBQCodsCronDentVacias.Close;
  IBQCodsCronDentVacias.Open;

  IBQCodsCronDentPreniadas.Close;
  IBQCodsCronDentPreniadas.Open;

  CBCabeza.Checked:= false;
  CBCuerpo.Checked:= false;
  CBCola.Checked:= false;
end;

// selecciono tipo de filtro y actualizo la consulta
procedure TFREPDGVersusPrenez.RGFiltroClick(Sender: TObject);
begin
  inherited;
  case (RGFiltro.ItemIndex) of
    0: begin
         DBLCBARodeos.Enabled := true;
         CBACategoria.Enabled := false;
         if (DBLCBARodeos.KeyValue = Null) then
             DBLCBARodeos.KeyValue:= 0;
       end;
    1: begin
         DBLCBARodeos.Enabled := false;
         CBACategoria.Enabled := true;
       end;
    2: begin
         DBLCBARodeos.Enabled := false;
         CBACategoria.Enabled := false;
       end;
    end;
end;

procedure TFREPDGVersusPrenez.RGTipoClick(Sender: TObject);
begin
  inherited;
  if (TRadioGroup(Sender).ItemIndex = 0) then
    begin
      GBGrupos.Enabled := true;
      GBSeleccionFechas.Enabled := false;
      DBLCBASeleccionGrupo.Enabled := true;
      LDesde.Enabled:= false;
      LHasta.Enabled:= false;
      DTPADesde.Enabled:= false;
      DTPAHasta.Enabled:= false;
    end
  else
    begin
      DBLCBASeleccionGrupo.Enabled := false;
      GBGrupos.Enabled := false;
      GBSeleccionFechas.Enabled := true;

      LDesde.Enabled:= true;
      LHasta.Enabled:= true;
      DTPADesde.Enabled:= true;
      DTPAHasta.Enabled:= true;
    end;
end;

procedure TFREPDGVersusPrenez.RGTipoReporteClick(Sender: TObject);
begin
  inherited;
  if (RGTipoReporte.ItemIndex = 0) then
    configurarGrafico('Condición corporal en las vacías', 'Condiciones Corporales', 'Condición corporal en las preñadas')
  else
    configurarGrafico('Cronología dentaria en las vacías', 'Cronologias Dentarias', 'Cronología dentaria en las preñadas');
  CrearTotales();
end;

procedure TFREPDGVersusPrenez.RGGraficoClick(Sender: TObject);
begin
  inherited;
  if (RGGrafico.ItemIndex = 0) then
    begin
      GBGrafico.Visible := true;
      GBGrafico.Align := alClient;
      GBTabla.Visible := false;
    end
  else
    begin
      GBGrafico.Visible := false;
      GBTabla.Visible := true;
      ArmarTabla;
    end;
end;

procedure TFREPDGVersusPrenez.Rodeos(Sender: TObject);
begin
  inherited;
end;



// DADO ALGUN CAMBIO EN EL FORMULARIO DE CUALQUIER TIPO CAMBIO LAS CONSULTA Y ACTULIZO EL FORMULARIO
procedure TFREPDGVersusPrenez.actualizarConsulta;
var sentencia : AnsiString;
    sentenciaAnimales : AnsiString;
begin
  vaciarTodo;
  if (RGTipo.ItemIndex = 0) then // 1- selecciono por grupos
    begin
      if (RGTipoReporte.ItemIndex = 0) then  // 2- condicion corporal
        begin
          case RGFiltro.ItemIndex of
            0 : begin  // 3- Rodeos
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, null,null, :grupo, ''today'') where (rodeo= :rodeo) order by condicion, orden';
                  //sentencia := 'select count(*) as cantidad,valorcondicion as la,Condicion as valor,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ(:esta,null,null,:grupo,''today'')where(id_codigo_prenez=<<replace>>)and(rodeo=:rodeo)group by condicion, valorcondicion,id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad,valorcondicion as la,Condicion as valor,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ(:esta,null,null,:grupo,''today'')where(rodeo=:rodeo)group by condicion, valorcondicion,id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(1);
                end;
            1 : begin  // 3- Categorias
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, null,null, :grupo, ''today'') where (categoria = :c) order by condicion, orden';
                  //sentencia := 'select count(*) as cantidad,valorcondicion as la,Condicion as valor,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ(:esta,null,null,:grupo,''today'')where(id_codigo_prenez=<<replace>>)and(categoria=:c)group by condicion,valorcondicion,id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad,valorcondicion as la,Condicion as valor,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ(:esta,null,null,:grupo,''today'')where(categoria=:c)group by condicion,valorcondicion,id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(2);
                end;
            2 : begin  // 3- Todos
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, null,null, :grupo, ''today'') order by condicion, orden';
                  //sentencia := 'select count(*) as cantidad, valorcondicion as la, Condicion as valor, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, null, null, :grupo, ''today'') where (id_codigo_prenez =<<replace>>) group by condicion, valorcondicion, id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad, valorcondicion as la, Condicion as valor, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, null, null, :grupo, ''today'') group by condicion, valorcondicion, id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(3);
                end;
          end;
        end
      else
        begin     // 2- cronologia dentaria

          case RGFiltro.ItemIndex of
            0 : begin  // 3- Rodeos
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, null,null, :grupo, ''today'') where (rodeo= :rodeo) order by cronologia, orden';
                  //sentencia := 'select count(*) as cantidad,cronologia as valor,valorcronologia as la,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ(:esta,null,null,:grupo,''today'')where(id_codigo_prenez=<<replace>>)and(rodeo=:rodeo)group by cronologia,valorCronologia,id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad,cronologia as valor,valorcronologia as la,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ(:esta,null,null,:grupo,''today'')where(rodeo=:rodeo)group by cronologia,valorCronologia,id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(1);
                end;
            1 : begin  // 3- Categorias
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, null,null, :grupo, ''today'') where (categoria = :c) order by cronologia, orden';
                  //sentencia := 'select count(*) as cantidad,cronologia as valor,valorcronologia as la,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ(:esta,null,null,:grupo,''today'')'+'where(id_codigo_prenez=<<replace>>)and(categoria=:c)group by cronologia,valorCronologia,id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad,cronologia as valor,valorcronologia as la,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ(:esta,null,null,:grupo,''today'')'+'where(categoria=:c)group by cronologia,valorCronologia,id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(2);
                end;
            2 : begin  // 3- Todos
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, null,null, :grupo, ''today'') order by cronologia, orden';
                  //sentencia := 'select count(*) as cantidad, cronologia as valor, valorcronologia as la, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, null, null, :grupo, ''today'') where (id_codigo_prenez =<<replace>>) group by cronologia, valorCronologia, id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad, cronologia as valor, valorcronologia as la, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, null, null, :grupo, ''today'') group by cronologia, valorCronologia, id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(3);
                end;
          end;
        end;
    end
  else
    begin  // 1- selecciono por fechas
      if (RGTipoReporte.ItemIndex = 0) then  // 2- condicion corporal
        begin
          case RGFiltro.ItemIndex of
            0 : begin  // 3- Rodeos
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'') where (rodeo= :rodeo) order by condicion, orden';
                  //sentencia := 'select count(*) as cantidad,valorcondicion as la,Condicion as valor,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta,:desde,:hasta,null,''today'')where(id_codigo_prenez=<<replace>>)and(rodeo=:rodeo)group by condicion, valorcondicion,id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad,valorcondicion as la,Condicion as valor,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta,:desde,:hasta,null,''today'')where(rodeo=:rodeo)group by condicion, valorcondicion,id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(4);
                end;
            1 : begin  // 3- Categorias
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'') where (categoria = :c) order by condicion, orden';
                  //sentencia := 'select count(*) as cantidad,valorcondicion as la,Condicion as valor,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ(:esta,:desde,:hasta,null,''today'')where(id_codigo_prenez=<<replace>>)and(categoria=:c)group by condicion, valorcondicion,id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad,valorcondicion as la,Condicion as valor,id_codigo_prenez from GET_DISTRIBUCION_PRENEZ(:esta,:desde,:hasta,null,''today'')where(categoria=:c)group by condicion, valorcondicion,id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(5);
                end;
            2 : begin  // 3- Todos
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'') order by condicion, orden';
                  //sentencia := 'select count(*) as cantidad, valorcondicion as la, Condicion as valor, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'') where (id_codigo_prenez =<<replace>>) group by condicion, valorcondicion, id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad, valorcondicion as la, Condicion as valor, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'') group by condicion, valorcondicion, id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(6);
                end;
          end;
        end
      else
        begin     // 2- cronologia dentaria
          case RGFiltro.ItemIndex of
            0 : begin  // 3- Rodeos
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'') ccc where (rodeo= :rodeo) order by cronologia, orden';
                  //sentencia := 'select count(*) as cantidad, cronologia as valor, valorcronologia as la, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'')'+' where (id_codigo_prenez =<<replace>>) and (rodeo= :rodeo) group by cronologia, valorCronologia, id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad, cronologia as valor, valorcronologia as la, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'')'+' where (rodeo= :rodeo) group by cronologia, valorCronologia, id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(4);
                end;
            1 : begin  // 3- Categorias
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'') where (categoria = :c) order by cronologia, orden';
                  //sentencia := 'select count(*) as cantidad, cronologia as valor, valorcronologia as la, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'')'+' where (id_codigo_prenez =<<replace>>) and (categoria= :c) group by cronologia, valorCronologia, id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad, cronologia as valor, valorcronologia as la, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'')'+' where (categoria= :c) group by cronologia, valorCronologia, id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(5);
                end;
            2 : begin  // 3- Todos
                  sentenciaAnimales := 'select rp_animal, nombre, ValorCondicion as condicion, ValorCronologia as cronologia, rodeo, categoria, ID_ANIMAL from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, null, ''today'') order by cronologia, orden';
                  //sentencia := 'select count(*) as cantidad, cronologia as valor, valorcronologia as la, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :null, ''today'') where (id_codigo_prenez =<<replace>>) group by cronologia, valorCronologia, id_codigo_prenez';
                  sentencia := 'select count(*) as cantidad, cronologia as valor, valorcronologia as la, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :null, ''today'') group by cronologia, valorCronologia, id_codigo_prenez';
                  llenarQuerys(sentencia, sentenciaAnimales);
                  //configurarXLabels('valor');
                  llenarParametros(6);
                end;
          end;
        end;
    end;

end;
// limpio todos los componentes para graficar o para llenar la tabla
procedure TFREPDGVersusPrenez.vaciarTodo;
begin
  {IBQCA.Close;
  IBQCA.SQL.Clear;
  IBQCA.Params.Clear;

  IBQCU.Close;
  IBQCU.SQL.Clear;
  IBQCU.Params.Clear;

  IBQCO.Close;
  IBQCO.SQL.Clear;
  IBQCO.Params.Clear;

  IBQNN.Close;
  IBQNN.SQL.Clear;
  IBQNN.Params.Clear;

  IBQVA.Close;
  IBQVA.SQL.Clear;
  IBQVA.Params.Clear;

  IBQPreniadas.Close;
  IBQPreniadas.SQL.Clear;
  IBQPreniadas.Params.Clear;    }

  IBQCantidades.Close;
  IBQCantidades.SQL.Clear;
  IBQCantidades.Params.Clear;

  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.Params.Clear;
end;

// cargo los parametros correspondientes dependiendo del caso y activo los querys
procedure TFREPDGVersusPrenez.llenarParametros(valor: integer);
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Realizando la Comparación de Preñez ...';
  cartel.abrircartel(msje);

  parametrizar('esta', Fprincipal.EstablecimientoActual);

  case (valor) of
    1, 4 : parametrizar ('rodeo', DBLCBARodeos.KeyValue);
    2, 5 : begin
             if (CBACategoria.ItemIndex= 0) then // vaca
               parametrizar('c', 6)
             else
               parametrizar('c', 5);
           end;
  end;

  case (valor) of
    1, 2, 3 : parametrizar('grupo', DBLCBASeleccionGrupo.KeyValue);
    4, 5, 6 : begin
                parametrizar('desde',DTPADesde.DateTime);
                parametrizar('hasta',DTPAHasta.DateTime);
              end;
  end;
 { IBQCA.Open;
  IBQCO.Open;
  IBQCU.Open;
  IBQNN.Open;
  IBQVA.Open;
  IBQPreniadas.Open;  }
  IBQCantidades.Open;
  IBQAnimales.Open;
  ActualizarBotones;
  cartel.cerrarcartel();
  cartel.FreeInstance();   
end;

// metodo que setea las sentencias sql para los querys del grafico y ademas el query de los animales
procedure TFREPDGVersusPrenez.llenarQuerys(s1, s2: AnsiString);
begin
  {IBQCA.SQL.Add(stringReplace(s1,'<<replace>>','''A''', [rfIgnoreCase]));
  IBQCU.SQL.Add(stringReplace(s1,'<<replace>>','''U''', [rfIgnoreCase]));
  IBQCO.SQL.Add(stringReplace(s1,'<<replace>>','''O''', [rfIgnoreCase]));
  IBQNN.SQL.Add(stringReplace(s1,'<<replace>>','''N''', [rfIgnoreCase]));
  IBQVA.SQL.Add(stringReplace(s1,'<<replace>>','''V''', [rfIgnoreCase]));
  IBQPreniadas.SQL.Add(stringReplace(s1,'=<<replace>>','<>''V''', [rfIgnoreCase]));}
  IBQCantidades.SQL.Add(s1);
  IBQAnimales.SQL.Add(s2);
end;

procedure TFREPDGVersusPrenez.CBACategoriaChange(Sender: TObject);
begin
  inherited;
end;

// lleno de uno el parametro que me pasan
procedure TFREPDGVersusPrenez.parametrizar(s1: AnsiString; valor: Variant);
begin
  {IBQCA.ParamByName(s1).Value := valor;
  IBQCU.ParamByName(s1).Value := valor;
  IBQCO.ParamByName(s1).Value := valor;
  IBQNN.ParamByName(s1).Value := valor;
  IBQVA.ParamByName(s1).Value := valor;
  IBQPreniadas.ParamByName(s1).Value := valor;}
  IBQCantidades.ParamByName(s1).Value := valor;
  IBQAnimales.ParamByName(s1).Value := valor;
end;

// metodo para cambiar los titulos del grafico
procedure TFREPDGVersusPrenez.configurarGrafico(TitleVacias, TitleBottom, TitlePreniadas : AnsiString);
begin
  DBCPrenezVacias.Title.Text.Clear;
  DBCPrenezVacias.Title.Text.Add(TitleVacias);
  DBCPrenezVacias.BottomAxis.Title.Caption := TitleBottom;

  DBCPrenezPreniadas.Title.Text.Clear;
  DBCPrenezPreniadas.Title.Text.Add(TitlePreniadas);
  DBCPrenezPreniadas.BottomAxis.Title.Caption := TitleBottom;
end;

// metodo para armar la tabla de acuerdo al tipo de reporte
procedure TFREPDGVersusPrenez.ArmarTabla;
begin
  if (RGTipoReporte.ItemIndex = 0) then
    ArmarTablaCondicionCorporal
  else
    ArmarTablaCronologiaDentaria;
end;

// metodo para armar la tabla por condicion corporal
procedure TFREPDGVersusPrenez.ArmarTablaCondicionCorporal;
var cont : integer;
begin
  // FALTA ARMAR LA PARA TE LA SUMA PARA CADA VALOR EN PARTICULAR
  PTituloTabla.Caption := Traducir('Preñez Vs Condición Corporal');
  cont := 1;
  SGTabla.ColCount := 11;
  LimpiarTotales;
  ArmarEncabezadoFilas;
  IBQAux.Close;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select * from cod_condiciones_corporales order by id_condicion_corporal');
  IBQAux.Open;
  IBQAux.First;
  while not(IBQAux.Eof) do
    begin
      if  escala = 5 then
        SGTabla.Cells[cont,0] := IBQAux.FieldValues['valor_escala_5']
      else
        SGTabla.Cells[cont,0] := IBQAux.FieldValues['valor_escala_10'];
        
      ArmarColumna(cont, IBQAux.FieldValues['id_condicion_corporal']);
      SGTabla.ColWidths[cont] := 30;
      inc(cont);
      IBQAux.next;
    end;
  SGTabla.Cells[cont,0] := Traducir('TOTAL');
  SGTabla.ColWidths[cont] := 50;
  llenarTotalesFilas(cont);
end;

// metodo para armar la tabla por cronologia dentaria    (no anda muy bien (primero probar un backup))ver
procedure TFREPDGVersusPrenez.ArmarTablaCronologiaDentaria;
var cont : integer;
begin

// FALTA ARMAR LA PARA TE LA SUMA PARA CADA VALOR EN PARTICULAR
  PTituloTabla.Caption := Traducir('Preñez Vs Cronología Dentaria');
  cont := 1;
  SGTabla.ColCount := 12;
  LimpiarTotales;
  ArmarEncabezadoFilas;
  IBQAux.Close;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select * from cod_cronologias_dentarias order by id_cronologia_dentaria');
  IBQAux.Open;
  IBQAux.First;
  while not(IBQAux.Eof) do
    begin
      SGTabla.Cells[cont,0] := IBQAux.FieldValues['codigo'];
      ArmarColumna(cont, IBQAux.FieldValues['id_cronologia_dentaria']);
      SGTabla.ColWidths[cont] := 30;
      inc(cont);
      IBQAux.next;
    end;
  SGTabla.Cells[cont,0] := Traducir('TOTAL');
  SGTabla.ColWidths[cont] := 50;
  llenarTotalesFilas(cont);
end;

// metodo fijo para todos para setear los valores en la fila
procedure TFREPDGVersusPrenez.ArmarEncabezadoFilas;
begin
  SGTabla.Cells[0,1] := Traducir('Cabeza');
  SGTabla.Cells[0,2] := Traducir('Cuerpo');
  SGTabla.Cells[0,3] := Traducir('Cola');
  SGTabla.Cells[0,4] := Traducir('No Definido');
  SGTabla.Cells[0,5] := Traducir('Vacía');
  SGTabla.Cells[0,6] := Traducir('TOTAL');
end;

// metodo que arma las columnas
procedure TFREPDGVersusPrenez.ArmarColumna(col:integer; KeyValue: variant);
var total : integer;
    aux : integer;
begin
  total := 0;
  //aux := buscarEnQuery(col, 1, KeyValue, IBQCA);
  aux := buscarEnQuery(col, 1, KeyValue, IBQCantidades, 'A');
  total := total + aux;
  TotCA := TotCA + aux;

  //aux := buscarEnQuery(col, 2, KeyValue, IBQCU);
  aux := buscarEnQuery(col, 2, KeyValue, IBQCantidades, 'U');
  total := total + aux;
  TotCU := TotCU + aux;

  //aux := buscarEnQuery(col, 3, KeyValue, IBQCO);
  aux := buscarEnQuery(col, 3, KeyValue, IBQCantidades, 'O');
  total := total + aux;
  TotCO := TotCO + aux;

  //aux := buscarEnQuery(col, 4, KeyValue, IBQNN);
  aux := buscarEnQuery(col, 4, KeyValue, IBQCantidades, 'N');
  total := total + aux;
  TotNN := TotNN + aux;

  //aux := buscarEnQuery(col, 5, KeyValue, IBQVA);
  aux := buscarEnQuery(col, 5, KeyValue, IBQCantidades, 'V');
  total := total + aux;
  TotVA := TotVA + aux;

  SGTabla.Cells[col, 6] := IntToStr(total);
end;

// busca la cantidad de cada valor en el query que paso como parametro
function TFREPDGVersusPrenez.buscarEnQuery(col, fil: integer; KeyValue: variant; IBQ : TIBQuery; distribucion : String): integer;
begin
  if (IBQ.Locate('valor;id_codigo_prenez',VarArrayOf([KeyValue,distribucion]), [] )) then
    begin
      SGTabla.Cells[col, fil] := IBQ.FieldValues['cantidad'];
      Result := IBQ.FieldValues['cantidad'];
    end
  else
    begin
      SGTabla.Cells[col, fil] := '0';
      Result := 0;
    end;
end;

procedure TFREPDGVersusPrenez.LimpiarTotales;
begin
  TotCA := 0;
  TotCU := 0;
  TotCO := 0;
  TotNN := 0;
  TotVA := 0;
end;

// imprime los totales de las filas
procedure TFREPDGVersusPrenez.llenarTotalesFilas(col : integer);
begin
  SGTabla.Canvas.Brush.Color := clAqua;
  SGTabla.Canvas.FillRect(SGTabla.CellRect(col,1));
  SGTabla.Canvas.FillRect(SGTabla.CellRect(col,2));
  SGTabla.Canvas.FillRect(SGTabla.CellRect(col,3));
  SGTabla.Canvas.FillRect(SGTabla.CellRect(col,4));
  SGTabla.Canvas.FillRect(SGTabla.CellRect(col,5));
  SGTabla.Canvas.FillRect(SGTabla.CellRect(col,6));

  SGTabla.Cells[col, 1] := IntToStr(TotCA);
  SGTabla.Cells[col, 2] := IntToStr(TotCU);
  SGTabla.Cells[col, 3] := IntToStr(TotCO);
  SGTabla.Cells[col, 4] := IntToStr(TotNN);
  SGTabla.Cells[col, 5] := IntToStr(TotVA);

  SGTabla.Cells[col, 6] := IntToStr(TotCA+TotCU+TotCO+TotNN+TotVA);
end;

procedure TFREPDGVersusPrenez.SGTablaDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if (((ACol = SGTabla.ColCount-1) and (ARow <> 0)) or ((ARow = SGTabla.RowCount-1 ) and (ACol <> 0))) then
    begin
      SGTabla.Canvas.Brush.Color := $00FAEDE2;
      SGTabla.Canvas.FillRect(Rect);
    end;
  if ((ACol = 0) or (ARow = 0)) then
    begin
      SGTabla.Canvas.Brush.Color := clCream;
      SGTabla.Canvas.FillRect(Rect);
    end;
  SGTabla.Canvas.Font.Color := clBlack;
  SGTabla.Canvas.TextOut( Rect.Left+2, Rect.Top+2, SGTabla.Cells[ACol, ARow]);
end;

// si no tengo animales no puedo ver el reporte
procedure TFREPDGVersusPrenez.ActualizarBotones;
begin
  //AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  IPreview.Enabled := not(IBQAnimales.IsEmpty);
  LPreview.Enabled := not(IBQAnimales.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimales.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimales.IsEmpty);
end;

// configuro le reporte
procedure TFREPDGVersusPrenez.ConfigurarReporte;
begin
  FREPDGVersusPrenezPreview.LabelTitulo.Caption := Traducir('Reporte de ')+RGTipoReporte.Items.Strings[RGTipoReporte.itemIndex];
  FREPDGVersusPrenezPreview.LabelTitulo2.Caption := FREPDGVersusPrenezPreview.LabelTitulo.Caption;
  FREPDGVersusPrenezPreview.LabelTitulo3.Caption := FREPDGVersusPrenezPreview.LabelTitulo.Caption;
  FREPDGVersusPrenezPreview.LabelTitulo4.Caption := FREPDGVersusPrenezPreview.LabelTitulo.Caption;

  if (CBListado.Checked) then
  begin
    FREPDGVersusPrenezPreview.QRAnimales.DataSet := IBQAnimales;
    FREPDGVersusPrenezPreview.QRDBTRPAnimal.DataSet := IBQAnimales;
    FREPDGVersusPrenezPreview.QRDBText1.DataSet := IBQAnimales;
    FREPDGVersusPrenezPreview.QRDBText3.DataSet := IBQAnimales;
    FREPDGVersusPrenezPreview.QRDBText2.DataSet := IBQAnimales;
  end;
  GenerarReporteTabla;
end;
// armo la tabla dinamicamente
procedure TFREPDGVersusPrenez.GenerarReporteTabla;
var col : integer;
    fil : integer;
    ProxTop : integer;
    ProxLeft : integer;
begin
  FREPDGVersusPrenezPreview.QRLTituloTabla.Caption := RGTipoReporte.Items.Strings[RGTipoReporte.itemIndex];
  ProxTop := 67;
  for fil := 0 to SGTabla.RowCount-1 do
    begin
      ProxLeft := 216;
      for col := 1 to SGTabla.ColCount-1 do
        begin
          with  (TQRLabel (FREPDGVersusPrenezPreview.QRBTabla.AddPrintable(TQRLabel))) do
            begin
              Left := ProxLeft;
              Top := ProxTop;
              autoSize := false;
              alignment := taLeftJustify;
              Height := 20;
              // color
              if (fil = 0) then
                color := clCream
              else
                if ((col = SGTabla.ColCount-1) or (fil = SGTabla.RowCount-1)) then
                    color := $00FAEDE2
                else
                    color := clBtnFace;
              // ancho
              Width := 30;
              if (col = SGTabla.ColCount-1) then
                Width := 50;
              Caption := '  '+SGTabla.Cells[col,fil];
            end;
          ProxLeft := ProxLeft + 30;
        end;
      ProxTop := ProxTop + 19;
    end;
end;

procedure TFREPDGVersusPrenez.IBQGruposBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  IBQGrupos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
end;

procedure TFREPDGVersusPrenez.BitDBGrid1DblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BitDBGrid1.SelectedIndex = 0 then
    if not(IBQAnimales.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQAnimales.fieldByName('ID_ANIMAL').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPDGVersusPrenez.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPDGVersusPrenez.DBCPrenezVaciasBeforeDrawAxes(
  Sender: TObject);
begin
  inherited;
  if (RGTipoReporte.ItemIndex = 1) then
    IBQCodsCronDentVacias.Last
  else
  begin
    if (escala = 5) then
      incremento := 6.5
  end;
end;

procedure TFREPDGVersusPrenez.DBCPrenezVaciasGetAxisLabel(
  Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
  var LabelText: String);
begin
  inherited;
  if ((RGTipoReporte.ItemIndex = 1) and Sender.Horizontal) then
  begin
    if ((LabelText <> '-1') and (LabelText <> '10')) then
    begin
      LabelText := IBQCodsCronDentVacias.fieldByName('codigo').AsString;
      IBQCodsCronDentVacias.Prior;
    end
    else
      LabelText := '-';
  end
  else
  begin
    if ((escala = 5) and Sender.Horizontal) then
    begin
      LabelText := FloatToStr(incremento);
      incremento := incremento-0.5;
    end;
  end;
end;

procedure TFREPDGVersusPrenez.DBCPrenezPreniadasBeforeDrawAxes(
  Sender: TObject);
begin
  inherited;
  if (RGTipoReporte.ItemIndex = 1) then
    IBQCodsCronDentPreniadas.Last
  else
  begin
    if (escala = 5) then
      incremento := 6.5
  end;
end;

procedure TFREPDGVersusPrenez.DBCPrenezPreniadasGetAxisLabel(
  Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
  var LabelText: String);
begin
  inherited;
  if ((RGTipoReporte.ItemIndex = 1) and Sender.Horizontal) then
  begin
    if ((LabelText <> '0') and (LabelText<>'11')) then
    begin
      LabelText := IBQCodsCronDentPreniadas.fieldByName('codigo').AsString;
      IBQCodsCronDentPreniadas.Prior;
    end
    else
      LabelText := '-';
  end
  else
  begin
    if ((escala = 5) and Sender.Horizontal) then
    begin
      LabelText := FloatToStr(incremento);
      incremento := incremento-0.5;
    end;
  end;
end;

procedure TFREPDGVersusPrenez.CalcAnchoBarra(Inc : Boolean);
begin
  Total.BarWidthPercent := AnchoBarra;
  Series6.BarWidthPercent := AnchoBarra;
  Series5.BarWidthPercent := AnchoBarra;
  Series4.BarWidthPercent := AnchoBarra;
end;

procedure TFREPDGVersusPrenez.CBCabezaClick(Sender: TObject);
begin
  inherited;
  CalcAnchoBarra(CBCabeza.Checked);
  if (CBCabeza.Checked) then
    DBCPrenezPreniadas.AddSeries(Series6)
  else
    DBCPrenezPreniadas.RemoveSeries(Series6);
end;

procedure TFREPDGVersusPrenez.CBCuerpoClick(Sender: TObject);
begin
  inherited;
  CalcAnchoBarra(CBCuerpo.Checked);
  if (CBCuerpo.Checked) then
    DBCPrenezPreniadas.AddSeries(Series4)
  else
    DBCPrenezPreniadas.RemoveSeries(Series4);
end;

procedure TFREPDGVersusPrenez.CBColaClick(Sender: TObject);
begin
  inherited;
  CalcAnchoBarra(CBCola.Checked);
  if (CBCola.Checked) then
    DBCPrenezPreniadas.AddSeries(Series5)
  else
    DBCPrenezPreniadas.RemoveSeries(Series5);
end;

procedure TFREPDGVersusPrenez.CrearTotales();
var
  IndiceItems, IndiceArr, limite : Integer;
  Totales : Array [0..10] of Double;
  cantCA, cantCO, cantCU : integer;
begin
  IndiceItems := 1;

  Totales[0] := 0;

  if ((RGTipoReporte.ItemIndex = 0) and (escala=5))  then
  begin
    limite := 8;
    IndiceArr := 2;
  end
  else
  begin
    limite := 10;
    IndiceArr := 1;
  end;


  while ((IndiceArr < 10) and (IndiceItems<=limite)) do
  begin
    if SGTabla.Cells[IndiceItems,1] = '' then
      cantCA := 0
    else
      cantCA := StrToInt(SGTabla.Cells[IndiceItems,1]);

    if SGTabla.Cells[IndiceItems,2] = '' then
      cantCO := 0
    else
      cantCO := StrToInt(SGTabla.Cells[IndiceItems,2]);

    if SGTabla.Cells[IndiceItems,3] = '' then
      cantCU := 0
    else
      cantCU := StrToInt(SGTabla.Cells[IndiceItems,3]);
    Totales[IndiceArr] := cantCA+cantCU+cantCO;
    Inc(IndiceItems);
    Inc(IndiceArr);
  end;

  Total.Clear;
  DBCPrenezPreniadas.AddSeries(Total);
  Total.AddArray(Totales);
end;

procedure TFREPDGVersusPrenez.FormCreate(Sender: TObject);
begin
  inherited;
  Total := TBarSeries.Create(self);
  Total.Title := 'Total';
  Total.SeriesColor := clRed;
  Total.Marks.Visible := true;
  Total.Marks.Style := smsValue;
  Total.Marks.Transparent := false;
  Total.Marks.Clip := true;
  Total.Marks.ArrowLength := 5;
  Total.Marks.BackColor := clWhite;
  Total.OnGetMarkText := GetMarkText;

  IBQCondCorp.Close;
  IBQCondCorp.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCondCorp.Open;
  escala := StrToInt(IBQCondCorp.fieldByName('valor').AsString);

  IBQDistribucion.Close;
  IBQDistribucion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDistribucion.Open;

  if (IBQDistribucion.FieldByName('valor').AsInteger = 3) then
    CBCuerpo.Enabled := true
  else
    CBCuerpo.Enabled := false;

end;

function TFREPDGVersusPrenez.Series4BeforeAdd(
  Sender: TChartSeries): Boolean;
begin
  inherited;
  Result := IBQCantidades.FieldByName('id_codigo_prenez').AsString = 'U';
end;

function TFREPDGVersusPrenez.Series5BeforeAdd(
  Sender: TChartSeries): Boolean;
begin
  inherited;
  Result := IBQCantidades.FieldByName('id_codigo_prenez').AsString = 'O';
end;

function TFREPDGVersusPrenez.Series6BeforeAdd(
  Sender: TChartSeries): Boolean;
begin
  inherited;
  Result := IBQCantidades.FieldByName('id_codigo_prenez').AsString = 'A';
end;

function TFREPDGVersusPrenez.Series7BeforeAdd(
  Sender: TChartSeries): Boolean;
begin
  inherited;
  Result := IBQCantidades.FieldByName('id_codigo_prenez').AsString = 'V';
end;

procedure TFREPDGVersusPrenez.GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  inherited;
  if MarkText='0' then MarkText := '';
end;

procedure TFREPDGVersusPrenez.IBQCantidadesAfterOpen(DataSet: TDataSet);
var
  cant : integer;
begin
  inherited;
  //A lo sumo debera recorrer 10 registros, 1 por cada tipo de cronologia dentaria
  DataSet.First;
  cant := 0;
  while not DataSet.Eof do
  begin
    cant := cant+DataSet.FieldValues['cantidad'];
    DataSet.Next;
  end;

  GBAnimales.Caption := Traducir(' Animales  [')+IntToStr(cant)+']';
  AImprimirReporte.Enabled := not(DataSet.IsEmpty);
  BBXls.Enabled := not(DataSet.IsEmpty);
end;

procedure TFREPDGVersusPrenez.BitDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BitDBGrid1DblClick(nil);
end;

procedure TFREPDGVersusPrenez.IBQAnimalesAfterOpen(DataSet: TDataSet);

begin
  inherited;


  IBQAnimales.Last;
  IBQAnimales.First;
  BitDBGrid1.DataSource := DSAnimales;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQAnimales.RecordCount)+']';
  AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);
end;

procedure TFREPDGVersusPrenez.DTPACloseUpFechas(Sender: TObject);
var
  Fecha : TDateTimePickerAuto;
begin
  inherited;
  Fecha := Sender as TDateTimePickerAuto;
  if (Fecha.Name = 'DTPADesde') then
    if DaysBetween(DTPAHasta.Date,Fecha.Date)>365 then
      DTPAHasta.Date := IncYear(Fecha.Date,1)
    else if CompareDate(DTPAHasta.Date,Fecha.Date)=LessThanValue then
          DTPADesde.Date := DTPAHasta.Date;

  if (Fecha.Name = 'DTPAHasta') then
    if DaysBetween(DTPADesde.Date,Fecha.Date)>365 then
      DTPADesde.Date := IncYear(Fecha.Date,-1)
    else if CompareDate(DTPADesde.Date,Fecha.Date)=GreaterThanValue then
          DTPAHasta.Date := DTPADesde.Date;
end;

procedure TFREPDGVersusPrenez.DTPADesdeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUpFechas(Sender);
end;

procedure TFREPDGVersusPrenez.BConsultaClick(Sender: TObject);
begin
  inherited;
  actualizarConsulta;
  ArmarTabla;
  CrearTotales();
end;

procedure TFREPDGVersusPrenez.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.










