unit UREPDGPorcentajePrenez;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons, Types,
  DateTimePickerAuto, TeeProcs, TeEngine, Chart, DbChart, Series, DB,
  IBCustomDataSet, IBQuery, DBCtrls, UDBLookupComboBoxAuto, Grids, DBGrids,
  UBDBGrid, IBStoredProc, DataExport, DataToXLS, WinXP, ComboBoxAuto, DateUtils,
  UMensajeImpresora, PngImage, jpeg, JvGIF, JvExControls,
  JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPDGPorcentajePrenez = class(TFUniversal)
    ASalir: TAction;
    AImprimirReporte: TAction;
    PTop: TPanel;
    PGraficos: TPanel;
    Ptactadas: TPanel;
    GBTactadas: TGroupBox;
    DBCTactadas: TDBChart;
    IBQSPPorcentajesPrenez: TIBQuery;
    DSPorcentajesPrenez: TDataSource;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    GBGrupos: TGroupBox;
    Splitter2: TSplitter;
    DBLCBASeleccionGrupo: TDBLookupComboBoxAuto;
    RGTipo: TRadioGroup;
    DSGrupos: TDataSource;
    IBQGrupos: TIBQuery;
    PServidas: TPanel;
    GBServidas: TGroupBox;
    DBCServidas: TDBChart;
    IBQPorcentajeServidas: TIBQuery;
    PAnimales: TPanel;
    GBAnimales: TGroupBox;
    IBQAnimales: TIBQuery;
    BitDBGrid1: TBitDBGrid;
    Panel1: TPanel;
    RGFiltros: TRadioGroup;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    CBACategoria: TComboBoxAuto;
    GroupBox2: TGroupBox;
    CBListado: TCheckBox;
    IBQSPPorcentajesPrenezCANTIDAD: TIntegerField;
    IBQSPPorcentajesPrenezNOMBRE: TIBStringField;
    IBQSPPorcentajesPrenezSERVIDA: TIBStringField;
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
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure ASalirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actualizarFechas ();
    procedure actualizarGrupos ();
    procedure RGTipoClick(Sender: TObject);
    procedure DBLCBASeleccionGrupoCloseUp(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure IBQGruposBeforeOpen(DataSet: TDataSet);
    procedure BitDBGrid1DblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGFiltrosClick(Sender: TObject);
    procedure DBLCBARodeosCloseUp(Sender: TObject);
    procedure DBCTactadasGetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    function PieSeries1BeforeAdd(Sender: TChartSeries): Boolean;
    procedure DBLCBARodeosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBACategoriaChange(Sender: TObject);
    procedure CBACategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure GetMarkTextT(Sender: TChartSeries;
      ValueIndex: Integer; var MarkText: String);
    procedure GetMarkTextS(Sender: TChartSeries;
      ValueIndex: Integer; var MarkText: String);
    procedure BitDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure IBQBeforeOpen(DataSet: TDataSet);
    procedure IBQAfterOpen(DataSet: TDataSet);
    procedure DTPACloseUpFechas(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    SQLBasicoCons, SQLConsultaCons, RestoSQLCons : String;
    SQLBasicoContS, SQLConsultaContS, RestoSQLContS : String;
    SQLBasicoContP, SQLConsultaContP, RestoSQLContP : String;
//    CartelOpen : TFCartelOpenQuery;
    FiltroSQL : String;
    valor : Integer;
    Tactadas, Servidas : TPieSeries;
    CantidadAnimalesT, CantidadAnimalesS : integer;
    function Cantidad_Animales : integer;
    procedure CrearSerie();
  public
    { Public declarations }
  end;

var
  FREPDGPorcentajePrenez: TFREPDGPorcentajePrenez;

implementation

uses UPrincipal,uTiposGlobales, UREPDGPorcentajePrenezPreview, UDMSoftvet, UREPFichaAnimal, UCartel, Utraduccion;

{$R *.dfm}

// muestro un previe del reporte
procedure TFREPDGPorcentajePrenez.AImprimirReporteExecute(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  MostrarMensajeImpresion();
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del reporte Porcentaje de Preñez ...';
  cartel.abrircartel(msje);
  inherited;
  Application.CreateForm(TFREPDGPorcentajePrenezPreview, FREPDGPorcentajePrenezPreview);
  DBCTactadas.SaveToMetafile(ExtractFilePath(Application.ExeName)+'grafico.wmf');
  DBCServidas.SaveToMetafile(ExtractFilePath(Application.ExeName)+'grafico1.wmf');
  if (RGTipo.ItemIndex = 0) then
  begin
    FREPDGPorcentajePrenezPreview.QRLD.Enabled := false;
    FREPDGPorcentajePrenezPreview.QRLDesde.Enabled := false;
    FREPDGPorcentajePrenezPreview.QRLG.Enabled := true;
    FREPDGPorcentajePrenezPreview.QRLGrupo.Enabled := true;
    FREPDGPorcentajePrenezPreview.QRLGrupo.Caption := DBLCBASeleccionGrupo.Text;
    FREPDGPorcentajePrenezPreview.QRLH.Enabled := false;
    FREPDGPorcentajePrenezPreview.QRLHasta.Enabled := false;
    FREPDGPorcentajePrenezPreview.QRLPeriodo.Enabled := false;
  end
  else
  begin
    FREPDGPorcentajePrenezPreview.QRLD.Enabled := true;
    FREPDGPorcentajePrenezPreview.QRLDesde.Enabled := true;
    FREPDGPorcentajePrenezPreview.QRLG.Enabled := false;
    FREPDGPorcentajePrenezPreview.QRLGrupo.Enabled := false;
    FREPDGPorcentajePrenezPreview.QRLDesde.Caption := DateToStr(DTPADesde.Date);
    FREPDGPorcentajePrenezPreview.QRLHasta.Caption := DateToStr(DTPAHasta.Date);
    FREPDGPorcentajePrenezPreview.QRLH.Enabled := true;
    FREPDGPorcentajePrenezPreview.QRLHasta.Enabled := true;
    FREPDGPorcentajePrenezPreview.QRLPeriodo.Enabled := true;
  end;

  if (RGFiltros.ItemIndex = 0) then //rodeos
    begin
     FREPDGPorcentajePrenezPreview.QRLRC.Enabled:= true;
     FREPDGPorcentajePrenezPreview.QRLRodeoCategoria.Enabled:= true;
     FREPDGPorcentajePrenezPreview.QRLRC.Caption:= Traducir('Rodeo:');
     FREPDGPorcentajePrenezPreview.QRLRodeoCategoria.Caption:= DBLCBARodeos.Text;
    end
   else
     if (RGFiltros.ItemIndex = 1) then //categoría
       begin
         FREPDGPorcentajePrenezPreview.QRLRC.Enabled:= true;
         FREPDGPorcentajePrenezPreview.QRLRodeoCategoria.Enabled:= true;
         FREPDGPorcentajePrenezPreview.QRLRC.Caption:= Traducir('Categoría:');
         FREPDGPorcentajePrenezPreview.QRLRodeoCategoria.Caption:= CBACategoria.Text;
       end
      else
        if (RGFiltros.ItemIndex = 2) then  //todos
           begin
             FREPDGPorcentajePrenezPreview.QRLRC.Enabled:= true;
             FREPDGPorcentajePrenezPreview.QRLRodeoCategoria.Enabled:= false;
             FREPDGPorcentajePrenezPreview.QRLRC.Caption:= Traducir('TODOS');
           end;

  if not(CBListado.Checked) then
  begin
    FREPDGPorcentajePrenezPreview.QRBand3.Enabled := false;
    FREPDGPorcentajePrenezPreview.QRGroup1.Enabled := false;
    FREPDGPorcentajePrenezPreview.QRBand2.Enabled := false;
  end;
  FREPDGPorcentajePrenezPreview.QRITratadas.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'grafico.wmf');
  FREPDGPorcentajePrenezPreview.QRIServidas.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'grafico1.wmf');
  
  cartel.cerrarcartel();
  cartel.FreeInstance();
  FREPDGPorcentajePrenezPreview.ShowModal;
  HabilitarDesabilitarControles();  
end;

procedure TFREPDGPorcentajePrenez.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFREPDGPorcentajePrenez.FormShow(Sender: TObject);
begin
  inherited;
  DTPADesde.DateTime := IncYear(now,-1);
  DTPAHasta.DateTime := now;

  IBQGrupos.Open;
  DMSoftvet.IBQAfterOpen(IBQGrupos);
  IBQGrupos.First;
  if (DBLCBASeleccionGrupo.KeyValue = NULL) then
    DBLCBASeleccionGrupo.KeyValue := IBQGrupos.FieldValues['ID_GRUPO'];

  LDesde.Enabled:= false;
  LHasta.Enabled:= false;
  DTPADesde.Enabled:= false;
  DTPAHasta.Enabled:= false;
  {AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);}
  IPreview.Enabled := not(IBQAnimales.IsEmpty);
  LPreview.Enabled := not(IBQAnimales.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimales.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimales.IsEmpty);
end;


// seteo las fechas en los sp
procedure TFREPDGPorcentajePrenez.actualizarFechas;
var  cartel: TCartel;
     msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando porcentaje preñez sobre tactadas ...';
  cartel.abrircartel(msje);
  // TACTADAS
  SQLConsultaContP := SQLBasicoContP+FiltroSQL+RestoSQLContP;
  IBQSPPorcentajesPrenez.Close;
  IBQSPPorcentajesPrenez.SQL.Clear;
  IBQSPPorcentajesPrenez.SQL.Add(SQLConsultaContP);
  IBQSPPorcentajesPrenez.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQSPPorcentajesPrenez.ParamByName('desde').Value := DTPADesde.DateTime;
  IBQSPPorcentajesPrenez.ParamByName('hasta').Value := DTPAHasta.DateTime;
  IBQSPPorcentajesPrenez.ParamByName('grupo').Value := null;
  if (FiltroSQL <> ' ') then
    IBQSPPorcentajesPrenez.ParamByName('var').Value := valor;
  IBQSPPorcentajesPrenez.Open;

  CrearSerie();

  cartel.cerrarcartel();
  cartel.FreeInstance();

 { cartel:= TCartel.getInstance();
  msje:= 'Calculando porcentaje preñez sobre servidas ...';
  cartel.abrircartel(msje);
  // SERVIDAS
  SQLConsultaContS := SQLBasicoContS+FiltroSQL+RestoSQLContS;
  IBQPorcentajeServidas.Close;
  IBQPorcentajeServidas.SQL.Clear;
  IBQPorcentajeServidas.SQL.Add(SQLConsultaContS);
  IBQPorcentajeServidas.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQPorcentajeServidas.ParamByName('desde').Value := DTPADesde.DateTime;
  IBQPorcentajeServidas.ParamByName('hasta').Value := DTPAHasta.DateTime;
  IBQPorcentajeServidas.ParamByName('grupo').Value := null;
  if (FiltroSQL <> ' ') then
    IBQPorcentajeServidas.ParamByName('var').Value := valor;
  IBQPorcentajeServidas.Open;

  cartel.cerrarcartel();
  cartel.FreeInstance();   }

  cartel:= TCartel.getInstance();
  msje:= 'Armando grilla de preñez ...';
  cartel.abrircartel(msje);
  // grilla
  SQLConsultaCons := SQLBasicoCons+FiltroSQL+RestoSQLCons;
  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add(SQLConsultaCons);
  IBQAnimales.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQAnimales.ParamByName('desde').Value := DTPADesde.DateTime;
  IBQAnimales.ParamByName('hasta').Value := DTPAHasta.DateTime;
  IBQAnimales.ParamByName('grupo').Value := null;
  if (FiltroSQL <> ' ') then
    IBQAnimales.ParamByName('var').Value := valor;
  IBQAnimales.Open;

  GBAnimales.Caption := Traducir(' Animales  [')+IntToStr(Cantidad_Animales)+']';
  AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);

  cartel.cerrarcartel();
  cartel.FreeInstance();
  if (CantidadAnimalesT = 0) then
    DBCTactadas.RemoveAllSeries;
  if (CantidadAnimalesS = 0) then
    DBCServidas.RemoveAllSeries;
end;

procedure TFREPDGPorcentajePrenez.RGTipoClick(Sender: TObject);
begin
  inherited;
  if (TRadioGroup(Sender).ItemIndex = 0) then
    begin
      IBQAnimales.Close;
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

// selecciono un grupo actualizo la consulta
procedure TFREPDGPorcentajePrenez.DBLCBASeleccionGrupoCloseUp(
  Sender: TObject);
begin
  inherited;
end;

// actulizo los parametros para que se seleccione por grupo
procedure TFREPDGPorcentajePrenez.actualizarGrupos;
var  cartel: TCartel;
     msje: String;
begin

if (DBLCBASeleccionGrupo.KeyValue <> Null) then
 begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando porcentaje preñez sobre tactadas ...';
  cartel.abrircartel(msje);
  // TACTADAS
  SQLConsultaContP := SQLBasicoContP+FiltroSQL+RestoSQLContP;
  IBQSPPorcentajesPrenez.Close;
  IBQSPPorcentajesPrenez.SQL.Clear;
  IBQSPPorcentajesPrenez.SQL.Add(SQLConsultaContP);
  IBQSPPorcentajesPrenez.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQSPPorcentajesPrenez.ParamByName('grupo').Value := DBLCBASeleccionGrupo.KeyValue;
  if (FiltroSQL <> ' ') then
    IBQSPPorcentajesPrenez.ParamByName('var').Value := valor;
  IBQSPPorcentajesPrenez.Open;

  CrearSerie();

  cartel.cerrarcartel();
  cartel.FreeInstance();

 { cartel:= TCartel.getInstance();
  msje:= 'Calculando porcentaje preñez sobre servidas ...';
  cartel.abrircartel(msje);
  //SERVIDAS
  SQLConsultaContS := SQLBasicoContS+FiltroSQL+RestoSQLContS;
  IBQPorcentajeServidas.Close;
  IBQPorcentajeServidas.SQL.Clear;
  IBQPorcentajeServidas.SQL.Add(SQLConsultaContS);
  IBQPorcentajeServidas.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQPorcentajeServidas.ParamByName('grupo').Value := DBLCBASeleccionGrupo.KeyValue;
  if (FiltroSQL <> ' ') then
    IBQPorcentajeServidas.ParamByName('var').Value := valor;
  IBQPorcentajeServidas.Open;


  cartel.cerrarcartel();
  cartel.FreeInstance();  }

  cartel:= TCartel.getInstance();
  msje:= 'Armando grilla de preñez ...';
  cartel.abrircartel(msje);
  // grilla
  SQLConsultaCons := SQLBasicoCons+FiltroSQL+RestoSQLCons;
  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add(SQLConsultaCons);
  IBQAnimales.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQAnimales.ParamByName('grupo').Value := DBLCBASeleccionGrupo.KeyValue;
  if (FiltroSQL <> ' ') then
    IBQAnimales.ParamByName('var').Value := valor;
  IBQAnimales.Open;

  GBAnimales.Caption := Traducir(' Animales  [')+IntToStr(Cantidad_Animales)+']';
  AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);

  cartel.cerrarcartel();
  cartel.FreeInstance();
  if (CantidadAnimalesT = 0) then
    DBCTactadas.RemoveAllSeries;
  if (CantidadAnimalesS = 0) then
    DBCServidas.RemoveAllSeries;
 end;
end;

procedure TFREPDGPorcentajePrenez.CrearSerie();
var
  Arr : Array [0..1] of Double;
  Arr1 : Array [0..1] of Double;
begin
  //Tactadas
  Arr[0] := 0;
  Arr[1] := 0;
  CantidadAnimalesT := 0;
  Tactadas := TPieSeries.Create(nil);
  Tactadas.Clear;
  IBQSPPorcentajesPrenez.First;
  while not IBQSPPorcentajesPrenez.Eof do
  begin
    if IBQSPPorcentajesPrenez.FieldByName('NOMBRE').AsString='VACIA' then
      Arr[0] := Arr[0]+IBQSPPorcentajesPrenez.FieldValues['cantidad']
    else
      Arr[1] := Arr[1]+IBQSPPorcentajesPrenez.FieldValues['cantidad'];
    CantidadAnimalesT := CantidadAnimalesT+IBQSPPorcentajesPrenez.FieldValues['cantidad'];
    IBQSPPorcentajesPrenez.Next;
  end;
  DBCTactadas.RemoveAllSeries;
  DBCTactadas.AddSeries(Tactadas);
  Tactadas.Add(Arr[0],Traducir('VACIA'),clRed);
  Tactadas.Add(Arr[1],Traducir('PREÑADA'),clGreen);
  Tactadas.OnGetMarkText := GetMarkTextT;

  //Servidas
  Arr1[0] := 0;
  Arr1[1] := 0;
  CantidadAnimalesS := 0;
  Servidas := TPieSeries.Create(nil);
  Servidas.Clear;
  IBQSPPorcentajesPrenez.First;
  while not IBQSPPorcentajesPrenez.Eof do
  begin
    if IBQSPPorcentajesPrenez.FieldByName('Servida').AsString='S' then
    begin
      if IBQSPPorcentajesPrenez.FieldByName('NOMBRE').AsString='VACIA' then
        Arr1[0] := Arr1[0]+IBQSPPorcentajesPrenez.FieldValues['cantidad']
      else
        Arr1[1] := Arr1[1]+IBQSPPorcentajesPrenez.FieldValues['cantidad'];
      CantidadAnimalesS := CantidadAnimalesS+IBQSPPorcentajesPrenez.FieldValues['cantidad'];
    end;
    IBQSPPorcentajesPrenez.Next;
  end;
  DBCServidas.RemoveAllSeries;
  DBCServidas.AddSeries(Servidas);
  Servidas.Add(Arr1[0],Traducir('VACIA'),clRed);
  Servidas.Add(Arr1[1],Traducir('PREÑADA'),clGreen);
  Servidas.OnGetMarkText := GetMarkTextS;
end;



procedure TFREPDGPorcentajePrenez.IBQAnimalesAfterOpen(DataSet: TDataSet);

begin
  inherited;


  IBQAnimales.Last;
  IBQAnimales.First;
  BitDBGrid1.DataSource := DSPorcentajesPrenez;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQAnimales.RecordCount)+']';
  {AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);}
  LPreview.Enabled := not(IBQAnimales.IsEmpty);
  IPreview.Enabled := not(IBQAnimales.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimales.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimales.IsEmpty);
end;

procedure TFREPDGPorcentajePrenez.IBQGruposBeforeOpen(DataSet: TDataSet);
begin
  inherited;
    IBQGrupos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
end;

procedure TFREPDGPorcentajePrenez.BitDBGrid1DblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BitDBGrid1.SelectedIndex = 0 then
    if not(IBQAnimales.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQAnimales.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPDGPorcentajePrenez.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPDGPorcentajePrenez.FormCreate(Sender: TObject);
begin
  inherited;
//  CartelOpen := TFCartelOpenQuery.Create(self);

  CantidadAnimalesT := 0;
  CantidadAnimalesS := 0;

  DMSoftvet.IBQRodeo.close;
  DMSoftvet.IBQRodeo.ParamByName('esta').Value := Fprincipal.establecimientoActual;
  DMSoftvet.IBQRodeo.Open;

  FiltroSQL := ' ';
  RestoSQLCons := ' order by rp_animal';
  SQLBasicoCons := 'select * from GET_PORCENTAJES_PRENEZ (:esta, :desde, :hasta, :grupo) where (id_animal > 0)';
  SQLConsultaCons := SQLBasicoCons+FiltroSQL+RestoSQLCons;

  SQLBasicoContS := 'select count(*) as cantidad, nombre from GET_PORCENTAJES_PRENEZ (:esta, :desde, :hasta, :grupo) where (servida = ''S'')';
  RestoSQLContS := ' group by repro, nombre';
  SQLConsultaContS := SQLBasicoContS+FiltroSQL+RestoSQLContS;

  SQLBasicoContP := 'select count(*) as cantidad, nombre, servida from GET_PORCENTAJES_PRENEZ (:esta, :desde, :hasta, :grupo) where (id_animal > 0)';
  RestoSQLContP := ' group by repro, nombre, servida';
  SQLConsultaContP := SQLBasicoContP+FiltroSQL+RestoSQLContP;
end;

procedure TFREPDGPorcentajePrenez.RGFiltrosClick(Sender: TObject);
begin
  inherited;
  case (RGFiltros.ItemIndex) of
    0: begin
         DBLCBARodeos.Enabled := true;
         CBACategoria.Enabled := false;
         FiltroSQL := ' and (rodeo = :var)';
         if (DBLCBARodeos.KeyValue = NULL) then
             DBLCBARodeos.KeyValue := 0;
         DBLCBARodeosCloseUp(Sender);
       end;
    1: begin
         DBLCBARodeos.Enabled := false;
         CBACategoria.Enabled := true;
         FiltroSQL := ' and (categoria = :var)';
         CBACategoriaChange(Sender);
       end;
    2: begin
         DBLCBARodeos.Enabled := false;
         CBACategoria.Enabled := false;
         FiltroSQL := ' ';
         //if (RGTipo.ItemIndex = 0) then ActualizarGrupos
         //else  ActualizarFechas;
       end;
    end;
end;

procedure TFREPDGPorcentajePrenez.DBLCBARodeosCloseUp(Sender: TObject);
begin
  inherited;
  valor := DBLCBARodeos.KeyValue;
  //if (RGTipo.ItemIndex = 0) then ActualizarGrupos
  //else  ActualizarFechas;
end;

procedure TFREPDGPorcentajePrenez.DBCTactadasGetLegendText(
  Sender: TCustomAxisPanel; LegendStyle: TLegendStyle; Index: Integer;
  var LegendText: String);
begin
  inherited;
  LegendText := LegendText+'S';
end;

function TFREPDGPorcentajePrenez.PieSeries1BeforeAdd(
  Sender: TChartSeries): Boolean;
begin
  inherited;
  //Result := IBQSPPorcentajesPrenez.FieldByName('Servida').AsString = 'S';
end;

function TFREPDGPorcentajePrenez.Cantidad_Animales : integer;
begin
  Result := CantidadAnimalesT;
end;

procedure TFREPDGPorcentajePrenez.DBLCBARodeosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBARodeos.ListVisible) then
    begin
      valor := DBLCBARodeos.KeyValue;
      //if (RGTipo.ItemIndex = 0) then ActualizarGrupos
      //else  ActualizarFechas;
    end;
end;

procedure TFREPDGPorcentajePrenez.CBACategoriaChange(Sender: TObject);
begin
  inherited;
  if (CBACategoria.ItemIndex = 0) then
    valor := 6
  else
    valor := 5;
  //if (RGTipo.ItemIndex = 0) then ActualizarGrupos
  //else  ActualizarFechas;
end;

procedure TFREPDGPorcentajePrenez.CBACategoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFREPDGPorcentajePrenez.GetMarkTextT(
  Sender: TChartSeries; ValueIndex: Integer; var MarkText: String);
begin
  inherited;
  if (CantidadAnimalesT <> 0) then
    MarkText := FormatFloat('0.00',((Tactadas.PieValues.Value[ValueIndex]/CantidadAnimalesT)*100))+'%';
end;

procedure TFREPDGPorcentajePrenez.GetMarkTextS(
  Sender: TChartSeries; ValueIndex: Integer; var MarkText: String);
begin
  inherited;
  if (CantidadAnimalesS <> 0) then
    MarkText := FormatFloat('0.00',((Servidas.PieValues.Value[ValueIndex]/CantidadAnimalesS)*100))+'%';
end;

procedure TFREPDGPorcentajePrenez.BitDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BitDBGrid1DblClick(nil);
end;

procedure TFREPDGPorcentajePrenez.IBQBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
//  CartelOpen.BeforeOpenQuery;
end;

procedure TFREPDGPorcentajePrenez.IBQAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
//  CartelOpen.AfterOpenQuery;
end;

procedure TFREPDGPorcentajePrenez.DTPACloseUpFechas(Sender: TObject);
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

procedure TFREPDGPorcentajePrenez.DTPADesdeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUpFechas(Sender);
end;

procedure TFREPDGPorcentajePrenez.BConsultaClick(Sender: TObject);
begin
  inherited;
  if (RGTipo.ItemIndex = 0) then
    ActualizarGrupos
  else
    ActualizarFechas;
end;

procedure TFREPDGPorcentajePrenez.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
