unit UREPPAProyeccionPartos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons,
  Grids, DBGrids, UBDBGrid, TeEngine, Series, TeeProcs, Chart, DbChart, 
  DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, DB, IBCustomDataSet,
  IBQuery, IBStoredProc, DataExport, DataToXLS, WinXP, GanttCh, DateUtils,
  UMensajeImpresora, PngImage, jpeg, JvGIF, JvExControls, JvLabel, ImgList,
  PngImageList, JvExExtCtrls, JvImage;

type
  TFREPPAProyeccionPartos = class(TFUniversal)
    PTop: TPanel;
    Splitter2: TSplitter;
    GBCategorias: TGroupBox;
    GBRodeos: TGroupBox;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    RGTipo: TRadioGroup;
    PGraficos: TPanel;
    Ptactadas: TPanel;
    GBTactadas: TGroupBox;
    DBCDistribucion: TDBChart;
    DBLCBACategorias: TDBLookupComboBoxAuto;
    IBQAnimales: TIBQuery;
    ASalir: TAction;
    AImprimirReporte: TAction;
    DSCategorias: TDataSource;
    IBQCategorias: TIBQuery;
    DSAnimales: TDataSource;
    IBQGrafico: TIBQuery;
    PAnimales: TPanel;
    DSGrafico: TDataSource;
    GBAnimales: TGroupBox;
    BitDBGrid1: TBitDBGrid;
    IBQContarIndefinidos: TIBQuery;
    Panel1: TPanel;
    Label1: TLabel;
    LtotalIndefinido: TLabel;
    IBQAnimalesRP: TIBStringField;
    IBQAnimalesRODEO: TIntegerField;
    IBQAnimalesCATEGORIA: TIntegerField;
    IBQAnimalesINDEFINIDO: TIBStringField;
    IBQAnimalesMES: TIntegerField;
    IBQAnimalesANIO: TIntegerField;
    IBQAnimalesCAPTION: TIBStringField;
    IBQAnimalesID_ANIMAL: TIntegerField;
    IBQAnimalesINI_PERIODO: TDateField;
    IBQAnimalesFIN_PERIODO: TDateField;
    IBQGraficoCANTIDAD: TIntegerField;
    IBQGraficoANIO: TIntegerField;
    IBQGraficoMES: TIntegerField;
    IBQGraficoCAPTION: TIBStringField;
    IBQGraficoINI_PERIODO: TDateField;
    IBQGraficoFIN_PERIODO: TDateField;
    Series2: TGanttSeries;
    IBQGetVentana: TIBQuery;
    Series1: TBarSeries;
    IBQGraficoFECHA_PARTO: TDateField;
    GBDatos: TGroupBox;
    LMes1: TLabel;
    LMes2: TLabel;
    LMes3: TLabel;
    LTMes1: TLabel;
    LTMes2: TLabel;
    LTMes3: TLabel;
    LVentana: TLabel;
    LValVentana: TLabel;
    LMes4: TLabel;
    LTMes4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LM1: TLabel;
    LM2: TLabel;
    LM3: TLabel;
    LM4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    CBListado: TCheckBox;
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
    GroupBox1: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    procedure ASalirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure DBLCBACategoriasKeyPress(Sender: TObject; var Key: Char);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure BitDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure DBCDistribucionGetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure DBCDistribucionGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure BitDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    SerieTotales : TBarSeries;
    ventana : Integer;
    procedure GetVentana();
    procedure filtrarRodeos;
    procedure filtrarCategorias;
    procedure filtrarTodos;
    procedure despuesDeFiltrar;
    procedure HacerGrafico();
    function GetMeses(mes : integer) : String;
  public
    { Public declarations }
  end;

var
  FREPPAProyeccionPartos: TFREPPAProyeccionPartos;

implementation

uses
  UDMSoftvet, UPrincipal, UREPPAProyeccionPartosPreview, UREPFichaAnimal, UCartel,
  UTraduccion;

{$R *.dfm}

procedure TFREPPAProyeccionPartos.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close;
end;


// cambio el query para filtrar categorias
procedure TFREPPAProyeccionPartos.filtrarCategorias;
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Cargando Proyección de Partos ...';
  cartel.abrircartel(msje);

  // esto es para la grilla de animales
  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add('select * from rep_proyeccion_partos(:esta,''C'',:cate) where (indefinido <> ''A'') order by ini_periodo asc');
  IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.ParamByName('cate').AsInteger := DBLCBACategorias.KeyValue;
  IBQAnimales.Open;

  // esto es para contar no definidos
  IBQContarIndefinidos.Close;
  IBQContarIndefinidos.SQL.Clear;
  IBQContarIndefinidos.SQL.Add('select count(*) as cantidad from rep_proyeccion_partos(:esta,''C'',:cate) where (indefinido = ''S'') ');
  IBQContarIndefinidos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQContarIndefinidos.ParamByName('cate').AsInteger := DBLCBACategorias.KeyValue;
  IBQContarIndefinidos.Open;

  // para el grafico
  IBQGrafico.Close;
  IBQGrafico.SQL.Clear;
  IBQGrafico.SQL.Add('select count(*) as cantidad, anio, mes, fecha_parto, caption, ini_periodo, fin_periodo from rep_proyeccion_partos(:esta,''C'',:cate) where (indefinido <> ''S'') group by anio, mes, fecha_parto, caption, ini_periodo, fin_periodo order by fecha_parto asc');
  IBQGrafico.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGrafico.ParamByName('cate').AsInteger := DBLCBACategorias.KeyValue;
  IBQGrafico.Open;

  despuesDeFiltrar;

  cartel.cerrarcartel();
  cartel.FreeInstance(); 
end;

// cambio el query para filtrar rodeos
procedure TFREPPAProyeccionPartos.filtrarRodeos;
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Cargando Proyección de Partos ...';
  cartel.abrircartel(msje);
  // esto es para la grilla de animales
  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add('select * from rep_proyeccion_partos(:esta,''R'',:rodeo) where (indefinido <> ''A'') order by ini_periodo asc');
  IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.ParamByName('rodeo').AsInteger := DBLCBARodeos.KeyValue;
  IBQAnimales.Open;

    // esto es para la grilla de animales
  IBQContarIndefinidos.Close;
  IBQContarIndefinidos.SQL.Clear;
  IBQContarIndefinidos.SQL.Add('select count(*) as cantidad from rep_proyeccion_partos(:esta,''R'',:rodeo) where (indefinido = ''S'') ');
  IBQContarIndefinidos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQContarIndefinidos.ParamByName('rodeo').AsInteger := DBLCBARodeos.KeyValue;
  IBQContarIndefinidos.Open;

    // para el grafico
  IBQGrafico.Close;
  IBQGrafico.SQL.Clear;
  IBQGrafico.SQL.Add('select count(*) as cantidad, anio, mes, fecha_parto, caption, ini_periodo, fin_periodo from rep_proyeccion_partos(:esta,''R'',:rodeo) where (indefinido <> ''S'')  group by anio, mes, fecha_parto, caption, ini_periodo, fin_periodo order by fecha_parto asc');
  IBQGrafico.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGrafico.ParamByName('rodeo').AsInteger := DBLCBARodeos.KeyValue;
  IBQGrafico.Open;

  despuesDeFiltrar;

  cartel.cerrarcartel();
  cartel.FreeInstance(); 
end;


// cambio el query para no filtrar
procedure TFREPPAProyeccionPartos.filtrarTodos;
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Cargando Proyección de Partos ...';
  cartel.abrircartel(msje);
  // esto es para la grilla de animales
  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add('select * from rep_proyeccion_partos(:esta,''N'',0) where (indefinido <> ''A'') order by ini_periodo asc ');
  IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.Open;

  // esto es para la grilla de animales
  IBQContarIndefinidos.Close;
  IBQContarIndefinidos.SQL.Clear;
  IBQContarIndefinidos.SQL.Add('select count(*) as cantidad from rep_proyeccion_partos(:esta,''N'',0) where (indefinido = ''S'')');
  IBQContarIndefinidos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQContarIndefinidos.Open;

  // para el grafico
  IBQGrafico.Close;
  IBQGrafico.SQL.Clear;
  IBQGrafico.SQL.Add('select count(*) as cantidad, anio, mes, fecha_parto, caption, ini_periodo, fin_periodo from rep_proyeccion_partos(:esta,''N'',0) where (indefinido <> ''S'') group by anio, mes, fecha_parto, caption, ini_periodo, fin_periodo order by fecha_parto asc');
  IBQGrafico.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGrafico.Open;

  despuesDeFiltrar;
  cartel.cerrarcartel();
  cartel.FreeInstance(); 
end;

procedure TFREPPAProyeccionPartos.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;

  IBQCategorias.Open;
  DBLCBARodeos.KeyValue := 0;
  DBLCBACategorias.KeyValue := 5;
  DMSoftvet.IBQAfterOpen(IBQCategorias);
  DMSoftvet.IBQAfterOpen(DMSoftvet.DSRodeo.DataSet);

  SerieTotales := TBarSeries.Create(self);
  SerieTotales.SeriesColor := clRed;
  SerieTotales.Marks.Visible := false;
  DBCDistribucion.BottomAxis.Minimum := 0;
  DBCDistribucion.BottomAxis.Maximum := 15;
  DBCDistribucion.BottomAxis.Increment := 1;
  GetVentana();
end;

procedure TFREPPAProyeccionPartos.RGTipoClick(Sender: TObject);
begin
  inherited;
  case RGTipo.ItemIndex of
    0 : begin
          GBRodeos.Enabled := true;
          GBCategorias.Enabled := false;
          DBLCBARodeos.Enabled:= true;
          DBLCBACategorias.Enabled:= false;
        end;
    1 : begin
          GBRodeos.Enabled := false;
          GBCategorias.Enabled := true;
          DBLCBARodeos.Enabled:= false;
          DBLCBACategorias.Enabled:= true;
        end;
    2 : begin
          GBRodeos.Enabled := false;
          GBCategorias.Enabled := false;
          DBLCBARodeos.Enabled:= false;
          DBLCBACategorias.Enabled:= false;
        end;
  end;
end;

procedure TFREPPAProyeccionPartos.DBLCBACategoriasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := #13;
end;

procedure TFREPPAProyeccionPartos.AImprimirReporteExecute(Sender: TObject);
var
  cartel : TCartel;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando Reporte de Proyeccion de Partos...');

  Application.CreateForm(TFREPPAProyeccionPartosPreview, FREPPAProyeccionPartosPreview);
  DBCDistribucion.SaveToMetafile(ExtractFilePath(Application.ExeName)+'grafico.wmf');
  FREPPAProyeccionPartosPreview.QRIProyeccion.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'grafico.wmf');
  FREPPAProyeccionPartosPreview.QRL1.Caption := LM1.Caption;
  FREPPAProyeccionPartosPreview.QRL2.Caption := LM2.Caption;
  FREPPAProyeccionPartosPreview.QRL3.Caption := LM3.Caption;
  FREPPAProyeccionPartosPreview.QRL4.Caption := LM4.Caption;
  FREPPAProyeccionPartosPreview.QRLM1.Caption := LMes1.Caption;
  FREPPAProyeccionPartosPreview.QRLM2.Caption := LMes2.Caption;
  FREPPAProyeccionPartosPreview.QRLM3.Caption := LMes3.Caption;
  FREPPAProyeccionPartosPreview.QRLM4.Caption := LMes4.Caption;
  FREPPAProyeccionPartosPreview.QRLT1.Caption := LTMes1.Caption;
  FREPPAProyeccionPartosPreview.QRLT2.Caption := LTMes2.Caption;
  FREPPAProyeccionPartosPreview.QRLT3.Caption := LTMes3.Caption;
  FREPPAProyeccionPartosPreview.QRLT4.Caption := LTMes4.Caption;
  FREPPAProyeccionPartosPreview.QRLVentana.Caption := LValVentana.Caption;
  case RGTipo.ItemIndex of
    0 : begin
          FREPPAProyeccionPartosPreview.QRLTF.Caption := Traducir('Rodeo: ');
          FREPPAProyeccionPartosPreview.QRLTipoFiltro.Enabled := true;
          FREPPAProyeccionPartosPreview.QRLTipoFiltro.Caption := DBLCBARodeos.Text;
        end;
    1 : begin
          FREPPAProyeccionPartosPreview.QRLTF.Caption := Traducir('Categoria: ');
          FREPPAProyeccionPartosPreview.QRLTipoFiltro.Enabled := true;
          FREPPAProyeccionPartosPreview.QRLTipoFiltro.Caption := DBLCBACategorias.Text;
        end;
    2 : begin
          FREPPAProyeccionPartosPreview.QRLTF.Caption := Traducir('Todos ');
          FREPPAProyeccionPartosPreview.QRLTipoFiltro.Enabled := false;
        end;
  end;
  if not(CBListado.Checked) then
  begin
    FREPPAProyeccionPartosPreview.QRBand2.Enabled := false;
    FREPPAProyeccionPartosPreview.QRGroup1.Enabled := false;
  end;
  cartel.cerrarcartel;
  cartel.FreeInstance;

  FREPPAProyeccionPartosPreview.ShowModal;
  FREPPAProyeccionPartosPreview.Destroy;

  HabilitarDesabilitarControles();
end;

// deshabilito la opcion de ver el reporte cuando no hay animales
procedure TFREPPAProyeccionPartos.despuesDeFiltrar;
begin
  AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  LtotalIndefinido.Caption := IBQContarIndefinidos.fieldByName('cantidad').AsString;
end;

procedure TFREPPAProyeccionPartos.IBQAnimalesAfterOpen(DataSet: TDataSet);

begin
  inherited;

  IBQAnimales.Last;
  IBQAnimales.First;
  BitDBGrid1.DataSource := DSAnimales;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQAnimales.RecordCount)+']';
  {BBImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);}
  IPreview.Enabled := not(IBQAnimales.IsEmpty);
  LPreview.Enabled := not(IBQAnimales.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimales.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimales.IsEmpty);
end;

procedure TFREPPAProyeccionPartos.BitDBGrid1DblClick(Sender: TObject);
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

procedure TFREPPAProyeccionPartos.FormShow(Sender: TObject);
begin
  inherited;
    DBLCBARodeos.Enabled:= false;
    DBLCBACategorias.Enabled:= false;
end;

procedure TFREPPAProyeccionPartos.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPPAProyeccionPartos.GetVentana();
begin
  IBQGetVentana.Close;
  IBQGetVentana.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetVentana.Open;
  ventana := IBQGetVentana.fieldByName('valor').AsInteger;
end;

procedure TFREPPAProyeccionPartos.DBCDistribucionGetLegendText(
  Sender: TCustomAxisPanel; LegendStyle: TLegendStyle; Index: Integer;
  var LegendText: String);
begin
  inherited;
  //LegendText := DateToStr(Series2.StartValues.Value[index])+' - '+DateToStr(Series2.EndValues.Value[index]);
end;

procedure TFREPPAProyeccionPartos.DBCDistribucionGetAxisLabel(
  Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
  var LabelText: String);
var
  X, Y : Integer;
begin
  inherited;
  if ((ValueIndex <> -1) and (Sender = DBCDistribucion.BottomAxis))then
  begin
   { X := Series1.CalcXPos(ValueIndex);
    Y := Series1.CalcYPos(ValueIndex)-50;
    if (ValueIndex<Series1.Count-1) then
      if ((Series1.CalcXSizeValue(ValueIndex)+Series1.CalcXPos(ValueIndex))>Series1.CalcXPos(ValueIndex+1)) then
      begin
        Sender.DrawAxisLabel(X,Y,0,FormatDateTime('dd/mm',Series2.StartValues.Value[ValueIndex])+#13+FormatDateTime('dd/mm',Series2.EndValues.Value[ValueIndex])+#13);
        //Sender.
        LabelText := ' ';
      end
      else
        LabelText := FormatDateTime('dd/mm',Series2.StartValues.Value[ValueIndex])+#13+FormatDateTime('dd/mm',Series2.EndValues.Value[ValueIndex])+#13
    else
      LabelText := FormatDateTime('dd/mm',Series2.StartValues.Value[ValueIndex])+#13+FormatDateTime('dd/mm',Series2.EndValues.Value[ValueIndex])+#13;}
  end;
end;

function TFREPPAProyeccionPartos.GetMeses(mes : integer) : String;
begin
  case mes of
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
end;

procedure TFREPPAProyeccionPartos.HacerGrafico();
var
  Totales : Array [0..16] of double;
  Meses : Array [0..3,0..1] of Integer;
  indice, indMeses : integer;
  primeraSemana, Semana, Mes, MesAnt, i, tope: Integer;
  Maximo : Double;
  anio, mes1, dia : word;
begin
  indMeses := 0;
  for indice := 0 to 15 do
    Totales[indice] := 0;
  IBQGrafico.First;
  primeraSemana := WeekOfTheYear(IBQGrafico.fieldByName('fecha_parto').AsDateTime);
  MesAnt := IBQGrafico.fieldByName('mes').AsInteger;
  Meses[0,0] := MesAnt;
  for i := 1 to 3 do
  begin
    if MesAnt>=12 then
      MesAnt := 0;
    MesAnt := MesAnt + 1;
    Meses[i,0] := MesAnt;
  end;
  tope := 0;
  while not(IBQGrafico.Eof) do
  begin
    DecodeDate(IBQGrafico.fieldByName('fecha_parto').AsDateTime,anio,mes1,dia);
    if (dia <= 7) then Semana := 1
    else if ((dia <= 14) and (dia >7)) then Semana := 2
         else if ((dia <= 21) and (dia > 14)) then Semana := 3
              else Semana := 4;
    Mes := IBQGrafico.fieldByName('mes').AsInteger;
    if (Mes<>Meses[indMeses,0]) then
      while ((Mes<>Meses[indMeses,0])and (indMeses<Length(Meses))) do
      begin
        indMeses := indMeses+1;
        tope := tope+4;
      end;
    Meses[indMeses,1] := Meses[indMeses,1]+IBQGrafico.fieldByName('cantidad').AsInteger;
    Totales[tope+Semana] := Totales[tope+Semana]+IBQGrafico.fieldByName('cantidad').AsInteger;
    IBQGrafico.Next;
  end;
  Maximo := 0;
  for indice := 0 to 15 do
    if (Totales[indice]>Maximo) then
      Maximo := Totales[indice];
  LValVentana.Caption := '-'+IntToStr(Ventana)+'    +'+IntToStr(ventana)+Traducir('   dias');
  LMes1.Caption := GetMeses(Meses[0,0]);
  LMes2.Caption := GetMeses(Meses[1,0]);
  LMes3.Caption := GetMeses(Meses[2,0]);
  LMes4.Caption := GetMeses(Meses[3,0]);
  LTMes1.Caption := IntToStr(Meses[0,1]);
  LTMes2.Caption := IntToStr(Meses[1,1]);
  LTMes3.Caption := IntToStr(Meses[2,1]);
  LTMes4.Caption := IntToStr(Meses[3,1]);
  LM1.Caption := GetMeses(Meses[0,0]);
  LM2.Caption := GetMeses(Meses[1,0]);
  LM3.Caption := GetMeses(Meses[2,0]);
  LM4.Caption := GetMeses(Meses[3,0]);
  DBCDistribucion.LeftAxis.Maximum := Maximo;
  SerieTotales.Clear;
  DBCDistribucion.AddSeries(SerieTotales);
  SerieTotales.AddArray(Totales);
end;

procedure TFREPPAProyeccionPartos.BitDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BitDBGrid1DblClick(nil);
end;

procedure TFREPPAProyeccionPartos.Button1Click(Sender: TObject);
begin
  inherited;
  if RGTipo.ItemIndex = 0 then
    filtrarRodeos
  else if RGTipo.ItemIndex = 1 then
      filtrarCategorias
    else
      filtrarTodos;
  HacerGrafico;
end;

procedure TFREPPAProyeccionPartos.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

end.
