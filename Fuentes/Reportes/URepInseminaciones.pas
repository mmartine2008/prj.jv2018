unit URepInseminaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, DBCtrls, UDBLookupComboBoxAuto, StdCtrls, IBQuery,
  WinXP, DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc,
  ActnList, ComCtrls, ExtCtrls, Buttons, Grids, DBGrids, UBDBGrid,
  TeeProcs, TeEngine, Chart, DbChart, Series, DateTimePickerAuto, DateUtils,
  QRCtrls, URepInseminacionesPreview, ComboBoxAuto, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TRegGrafico = record
    Nombre : String;
    Vacias : Integer;
    Preniadas : Integer;
  end;

  TArrGrafico = Array of TRegGrafico;

  TFRepInseminaciones = class(TFUniversal)
    PServicio: TPanel;
    PGraficos: TPanel;
    PAnimales: TPanel;
    GBGraficos: TGroupBox;
    GBAnimales: TGroupBox;
    GBServicio: TGroupBox;
    Label1: TLabel;
    DBLCBAServicio: TDBLookupComboBoxAuto;
    IBQServicios: TIBQuery;
    DSServicios: TDataSource;
    IBQRepInseminacion: TIBQuery;
    DSRepInseminaciones: TDataSource;
    BDBGAnimales: TBitDBGrid;
    PObservaciones: TPanel;
    GroupBox2: TGroupBox;
    MObservaciones: TMemo;
    GBFechas: TGroupBox;
    PFiltros: TPanel;
    GroupBox3: TGroupBox;
    CBListado: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    RGFiltros: TRadioGroup;
    GBServicios: TGroupBox;
    Panel1: TPanel;
    DBCPorToro: TDBChart;
    DBCInseminador: TDBChart;
    DBCMetodo: TDBChart;
    DBCTotales: TDBChart;
    RGTipo: TRadioGroup;
    SGServicios: TStringGrid;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    IBQCondCorp: TIBQuery;
    IBQCondCorpVALOR: TFloatField;
    IBQCondCorpID_CONDICION_CORPORAL: TIntegerField;
    DBCCC: TDBChart;
    DBCGDR: TDBChart;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    CBACategoria: TComboBoxAuto;
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
    IBQRepInseminacionVACA: TIntegerField;
    IBQRepInseminacionNOM_SERVICIO: TIBStringField;
    IBQRepInseminacionRP_VACA: TIBStringField;
    IBQRepInseminacionRAZA: TIBStringField;
    IBQRepInseminacionFECHA_SINCRO: TDateField;
    IBQRepInseminacionMETODO_SINCRO: TIBStringField;
    IBQRepInseminacionFECHA_IATF: TDateField;
    IBQRepInseminacionTORO_IATF: TIntegerField;
    IBQRepInseminacionNOM_TORO: TIBStringField;
    IBQRepInseminacionRESP_IATF: TIntegerField;
    IBQRepInseminacionNOM_RESP_IATF: TIBStringField;
    IBQRepInseminacionFECHA_DG: TDateField;
    IBQRepInseminacionDIAGNOSTICO: TIntegerField;
    IBQRepInseminacionNOM_DIAG: TIBStringField;
    IBQRepInseminacionCONDICION_CORPORAL: TIntegerField;
    IBQRepInseminacionGDR: TIntegerField;
    IBQRepInseminacionVALOR_CC: TFloatField;
    CBATipoServicio: TComboBoxAuto;
    DBLCBATipoRegistro: TDBLookupComboBoxAuto;
    GConsulta: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    procedure FormCreate(Sender: TObject);
    procedure DBLCBAServicioCloseUp(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure IBQServiciosAfterOpen(DataSet: TDataSet);
    procedure DBCPorToroGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure DBCInseminadorGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure DBCMetodoGetAxisLabel(Sender: TChartAxis;
      Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
    procedure GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: String);
    procedure DBCGetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure DBCCCGetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
    procedure DBCGDRGetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
    procedure IBQRepInseminacionAfterOpen(DataSet: TDataSet);
    procedure DBLCBARodeosCloseUp(Sender: TObject);
    procedure CBACategoriaCloseUp(Sender: TObject);
    procedure RGFiltrosClick(Sender: TObject);
    procedure DBLCBAServicioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure CBATipoServicioCloseUp(Sender: TObject);
    procedure DBLCBATipoRegistroCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    porServicio : Boolean;
    TipoServ, Servicio, Rodeo, Categoria, TipoRegistro, TipoServicio : Variant;
    ArrToro, ArrInseminador, ArrMetodo, ArrServicio, ArrCC, ArrGDR : TArrGrafico;
    SToroVacias, SToroPreniadas : TBarSeries;
    SInseminadorVacias, SInseminadorPreniadas : TBarSeries;
    SMetodoVacias, SMetodoPreniadas : TBarSeries;
    SCCVacias, SCCPreniadas : TBarSeries;
    SGDRVacias, SGDRPreniadas : TBarSeries;
    STotales : TPieSeries;
    procedure ActConsulta();
    procedure CalcularPorcentajes();
    procedure Agregar(var Arr : TArrGrafico; Nombre : Variant; Diag : Integer);
    procedure ArmarGraficos();
    procedure Ordenar(var Arr : TArrGrafico);
    procedure ArmarTabla();
    procedure ArmarTablaPreview(F : TFRepInseminacionesPreview);
    procedure InicFijos();
    procedure ArmarCuadros(F : TFRepInseminacionesPreview);
  public
    { Public declarations }
  end;

var
  FRepInseminaciones: TFRepInseminaciones;

implementation

uses
  UPrincipal, UDMSoftvet, UCartel, UREPFichaAnimal, UTraduccion;

{$R *.dfm}

procedure TFRepInseminaciones.ActConsulta;
var
  Cartel : TCartel;
begin
  Cartel := TCartel.GetInstance();
  Cartel.abrircartel('Generando Informe de Inseminación Artificial/Servicio a Corral');

  IBQRepInseminacion.Close;
  IBQRepInseminacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  if porServicio then
  begin
    IBQRepInseminacion.ParamByName('servicio').Value := Servicio;
    IBQRepInseminacion.ParamByName('tipo').Value := TipoServ;
    IBQRepInseminacion.ParamByName('desde').Value := null;
    IBQRepInseminacion.ParamByName('hasta').Value := null;
  end
  else
  begin
    IBQRepInseminacion.ParamByName('servicio').Value := null;
    IBQRepInseminacion.ParamByName('tipo').Value := null;
    IBQRepInseminacion.ParamByName('desde').AsDate := DTPADesde.Date;
    IBQRepInseminacion.ParamByName('hasta').AsDate := DTPAHasta.Date;
  end;
  IBQRepInseminacion.ParamByName('categ').Value := Categoria;
  IBQRepInseminacion.ParamByName('rodeo').Value := Rodeo;
  IBQRepInseminacion.ParamByName('reg').Value := TipoRegistro;
  IBQRepInseminacion.ParamByName('serv').Value := TipoServicio;
  IBQRepInseminacion.Open;
  CalcularPorcentajes();

  Cartel.cerrarcartel();
  Cartel.FreeInstance;
end;

procedure TFRepInseminaciones.FormCreate(Sender: TObject);
begin
  inherited;
  porServicio := false;
  DTPAHasta.Date := Date;
  DTPADesde.Date := IncYear(Date(),-1);
  TipoServ := 0;
  Servicio := 0;
  IBQServicios.Close;
  IBQServicios.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQServicios.Open;
  IBQServicios.First;
  if (DBLCBAServicio.KeyValue = NULL) then
    DBLCBAServicio.KeyValue := IBQServicios.FieldValues['ID_SERVICIO'];

  Rodeo := null;
  Categoria := null;
  TipoServicio := null;
  TipoRegistro := null;

  IBQCondCorp.Close;
  IBQCondCorp.SQL.Clear;
  IBQCondCorp.SQL.Add('select id_condicion_corporal, '+FPrincipal.StringEscalaCC+' as valor from cod_condiciones_corporales');
  IBQCondCorp.Open;

  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  DMSoftvet.IBQRodeo.First;
  if (DBLCBARodeos.KeyValue = NULL) then
    DBLCBARodeos.KeyValue := DMSoftvet.IBQRodeo.FieldValues['ID_RODEO'];

  DMSoftvet.IBQSubCategoriaRaza.Close;
  DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := 29;
  DMSoftvet.IBQSubCategoriaRaza.Open;
  DMSoftvet.IBQSubCategoriaRaza.First;
  if (DBLCBATipoRegistro.KeyValue = NULL) then
    DBLCBATipoRegistro.KeyValue := DMSoftvet.IBQSubCategoriaRaza.FieldValues['ID_SUBCATEGORIA'];
end;

procedure TFRepInseminaciones.DBLCBAServicioCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBAServicio.KeyValue <> null then
  begin
    Servicio := DBLCBAServicio.KeyValue;
    TipoServ := IBQServicios.FieldValues['tipo'];
  end
  else
  begin
    Servicio := 0;
    TipoServ := 0;
  end;
end;

procedure TFRepInseminaciones.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFRepInseminaciones.Agregar(var Arr : TArrGrafico; Nombre : Variant; Diag : Integer);
var
  I : Integer;
begin
  if Nombre <> null then
  begin
    I := 0;
    while I <= (Length(Arr)-1) do
    begin
      if Arr[I].Nombre = Nombre then
        break;
      Inc(I);
    end;

    if I = Length(Arr) then
    begin
      SetLength(Arr,I+1);
      Arr[I].Nombre := '';
      Arr[I].Preniadas := 0;
      Arr[I].Vacias := 0;
    end;

    Arr[I].Nombre := Nombre;
    if Diag = 1 then
      Inc(Arr[I].Vacias)
    else
      Inc(Arr[I].Preniadas);
  end;
end;

procedure TFRepInseminaciones.Ordenar(var Arr : TArrGrafico);
var
  i, j : Integer;
  Aux : TRegGrafico;
begin
  for i := 0 to Length(Arr)-1 do
    for j := i to Length(Arr)-1 do
      if (Arr[i].Preniadas+Arr[i].Vacias) < (Arr[j].Preniadas+Arr[j].Vacias) then
      begin
        Aux := Arr[i];
        Arr[i] := Arr[j];
        Arr[j] := Aux;
      end;
end;

procedure TFRepInseminaciones.InicFijos;
var
  I : Integer;
begin
  for I := 0 to Length(ArrGDR)-1 do
  begin
    ArrGDR[I].Preniadas := 0;
    ArrGDR[I].Vacias := 0;
    ArrGDR[I].Nombre := IntToStr(I+1);
  end;
  ArrGDR[4].Nombre := '0';
  IBQCondCorp.First;
  for I := 0 to Length(ArrCC)-1 do
  begin
    ArrCC[I].Preniadas := 0;
    ArrCC[I].Vacias := 0;
    ArrCC[I].Nombre := IBQCondCorp.FieldValues['VALOR'];
    IBQCondCorp.Next;
  end;
end;

procedure TFRepInseminaciones.CalcularPorcentajes;
begin
  SetLength(ArrToro,0);
  SetLength(ArrInseminador,0);
  SetLength(ArrMetodo,0);
  SetLength(ArrServicio,0);
  SetLength(ArrCC,9);
  SetLength(ArrGDR,5);
  InicFijos();
  IBQRepInseminacion.First;
  while not IBQRepInseminacion.Eof do
  begin
    Agregar(ArrToro,IBQRepInseminacion.FieldValues['NOM_TORO'],IBQRepInseminacion.FieldValues['DIAGNOSTICO']);
    Agregar(ArrInseminador,IBQRepInseminacion.FieldValues['NOM_RESP_IATF'],IBQRepInseminacion.FieldValues['DIAGNOSTICO']);
    Agregar(ArrMetodo,IBQRepInseminacion.FieldValues['METODO_SINCRO'],IBQRepInseminacion.FieldValues['DIAGNOSTICO']);
    Agregar(ArrServicio,IBQRepInseminacion.FieldValues['NOM_SERVICIO'],IBQRepInseminacion.FieldValues['DIAGNOSTICO']);
    Agregar(ArrCC,IBQRepInseminacion.FieldValues['VALOR_CC'],IBQRepInseminacion.FieldValues['DIAGNOSTICO']);
    Agregar(ArrGDR,IBQRepInseminacion.FieldValues['GDR'],IBQRepInseminacion.FieldValues['DIAGNOSTICO']);
    IBQRepInseminacion.Next;
  end;
  Ordenar(ArrToro);
  Ordenar(ArrInseminador);
  Ordenar(ArrMetodo);
  Ordenar(ArrServicio);
  ArmarTabla;
  ArmarGraficos;
end;

procedure TFRepInseminaciones.ArmarTablaPreview(F : TFRepInseminacionesPreview);
var
  ProxTopL, ProxTopS, I : Integer;
  TotalPren : double;
  TotalCantP, TotalCantV, Total : integer;
begin
  ProxTopL := 117;
  ProxTopS := 112;
  TotalPren := 0;
  TotalCantP := 0;
  TotalCantV := 0;
  Total := 0;
  for I := 0 to Length(ArrServicio)-1 do
  if ArrServicio[i].Preniadas > 0 then
  begin
    //////SHAPES
    ///Servicio
    with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
      begin
        Left := 128;
        Top := ProxTopS;
        Height := 20;
        Width := 321;
        Shape := qrsRectangle;
      end;
      ///%Preñez
      with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
      begin
        Left := 448;
        Top := ProxTopS;
        Height := 20;
        Width := 113;
        Shape := qrsRectangle;
      end;
      ///Cant Preñadas
      with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
      begin
        Left := 560;
        Top := ProxTopS;
        Height := 20;
        Width := 131;
        Shape := qrsRectangle;
      end;
      ///Cant Vacias
      with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
      begin
        Left := 690;
        Top := ProxTopS;
        Height := 20;
        Width := 129;
        Shape := qrsRectangle;
      end;
      ///Total
      with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
      begin
        Left := 818;
        Top := ProxTopS;
        Height := 20;
        Width := 129;
        Shape := qrsRectangle;
      end;
    ///LABELS
    ///Servicio
    with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
    begin
      Left := 144;
      Top := ProxTopL;
      autoSize := false;
      autoStretch := true;
      alignment := taLeftJustify;
      Height := 15;
      Width := 281;
      Font.Size := 8;
      Caption := ArrServicio[I].Nombre;
      Transparent := true;
    end;
    ///%Preñez
    with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
    begin
      Left := 472;
      Top := ProxTopL;
      autoSize := false;
      autoStretch := true;
      alignment := taCenter;
      Height := 15;
      Width := 65;
      Font.Size := 8;
      Caption := FormatFloat('##.##',(ArrServicio[I].Preniadas/(ArrServicio[I].Preniadas+ArrServicio[I].Vacias)*100))+' %';
      Transparent := true;
    end;
    TotalPren := TotalPren + ArrServicio[I].Preniadas/(ArrServicio[I].Preniadas+ArrServicio[I].Vacias);
    ///Cant Preñadas
    with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
    begin
      Left := 600;
      Top := ProxTopL;
      autoSize := false;
      autoStretch := true;
      alignment := taLeftJustify;
      Height := 15;
      Width := 65;
      Font.Size := 8;
      Caption := IntToStr(ArrServicio[I].Preniadas);
      Transparent := true;
    end;
    TotalCantP := TotalCantP + ArrServicio[I].Preniadas;
    ///Cant Vacias
    with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
    begin
      Left := 728;
      Top := ProxTopL;
      autoSize := false;
      autoStretch := true;
      alignment := taCenter;
      Height := 15;
      Width := 65;
      Font.Size := 8;
      Caption := IntToStr(ArrServicio[I].Vacias);
      Transparent := true;
    end;
    TotalCantV := TotalCantV + ArrServicio[I].Vacias;
    ///Total
    with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
    begin
      Left := 848;
      Top := ProxTopL;
      autoSize := false;
      autoStretch := true;
      alignment := taCenter;
      Height := 15;
      Width := 65;
      Font.Size := 8;
      Font.Style := [fsBold];
      Caption := IntToStr(ArrServicio[I].Preniadas+ArrServicio[I].Vacias);
      Transparent := true;
    end;
    Total := Total + ArrServicio[I].Preniadas+ArrServicio[I].Vacias;
    ProxTopL := ProxTopL+19;
    ProxTopS := ProxTopS+19;
    F.QRBand2.Height := F.QRBand2.Height+19;
  end;
  ///////Para los Totales
  ///% preñez
  with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
  begin
    Left := 448;
    Top := ProxTopS;
    Height := 20;
    Width := 113;
    Shape := qrsRectangle;
    Brush.Color := clSilver;
  end;
  ///Cant Preñadas
  with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
  begin
    Left := 560;
    Top := ProxTopS;
    Height := 20;
    Width := 131;
    Shape := qrsRectangle;
    Brush.Color := clSilver;
  end;
  ///Cant Vacias
  with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
  begin
    Left := 690;
    Top := ProxTopS;
    Height := 20;
    Width := 129;
    Shape := qrsRectangle;
    Brush.Color := clSilver;
  end;
  ///Total
  with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
  begin
    Left := 818;
    Top := ProxTopS;
    Height := 20;
    Width := 129;
    Shape := qrsRectangle;
    Brush.Color := clSilver;
  end;
  ///%Preñez
  with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
  begin
    Left := 472;
    Top := ProxTopL;
    autoSize := false;
    autoStretch := true;
    alignment := taCenter;
    Height := 15;
    Width := 65;
    Font.Size := 8;
    Font.Style := [fsBold];
    Caption := FormatFloat('##.##',(TotalCantP/Total*100))+' %';
    Transparent := true;
  end;
  ///Cant Preñadas
  with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
  begin
    Left := 600;
    Top := ProxTopL;
    autoSize := false;
    autoStretch := true;
    alignment := taLeftJustify;
    Height := 15;
    Width := 65;
    Font.Size := 8;
    Font.Style := [fsBold];
    Caption := IntToStr(TotalCantP);
    Transparent := true;
  end;
  ///Cant Vacias
  with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
  begin
    Left := 728;
    Top := ProxTopL;
    autoSize := false;
    autoStretch := true;
    alignment := taCenter;
    Height := 15;
    Width := 65;
    Font.Size := 8;
    Font.Style := [fsBold];
    Caption := IntToStr(TotalCantV);
    Transparent := true;
  end;
  ///Total
  with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
  begin
    Left := 848;
    Top := ProxTopL;
    autoSize := false;
    autoStretch := true;
    alignment := taCenter;
    Height := 15;
    Width := 65;
    Font.Size := 8;
    Font.Style := [fsBold];
    Caption := IntToStr(Total);
    Transparent := true;
  end;
  F.QRBand2.Height := F.QRBand2.Height+19;
end;

procedure TFRepInseminaciones.ArmarTabla();
var
  I, K : Integer;
begin
  SGServicios.RowCount := Length(ArrServicio)+1;

  for I := 0 to SGServicios.ColCount-1 do
    for K := 0 to SGServicios.RowCount-1 do
      SGServicios.Cells[I,K] := '';

  SGServicios.ColWidths[0] := 280;
  SGServicios.ColWidths[1] := 57;

  for I := 0 to Length(ArrServicio)-1 do
  begin
    SGServicios.Cells[0,I] := ArrServicio[I].Nombre;
    SGServicios.Cells[1,I] := FormatFloat('##.##',ArrServicio[I].Preniadas/(ArrServicio[I].Preniadas+ArrServicio[I].Vacias)*100)+' %';
  end;
end;

procedure TFRepInseminaciones.ArmarGraficos();
var
  ArrAux : Array [1..5] of double;
  ArrAux2 : Array [1..10] of double;
  ArrAuxCC : Array [1..9] of double;
  Total, Preniadas, Vacias : Integer;
  I : Integer;
begin
  SToroVacias := TBarSeries.Create(nil);
  SToroPreniadas := TBarSeries.Create(nil);
  SInseminadorVacias := TBarSeries.Create(nil);
  SInseminadorPreniadas := TBarSeries.Create(nil);
  SMetodoVacias := TBarSeries.Create(nil);
  SMetodoPreniadas := TBarSeries.Create(nil);
  SCCVacias := TBarSeries.Create(nil);
  SCCPreniadas := TBarSeries.Create(nil);
  SGDRVacias := TBarSeries.Create(nil);
  SGDRPreniadas := TBarSeries.Create(nil);
  STotales := TPieSeries.Create(nil);

  //////////////////////////////////////////////////
  ///Grafico por Toro
  //////////////////////////////////////////////////
  SToroVacias.SeriesColor := clRed;
  SToroVacias.Marks.Visible := true;
  SToroVacias.PercentFormat := '#0.# %';
  SToroVacias.Marks.Style := smsValue;
  SToroVacias.Marks.Font.Size := 6;
  SToroVacias.Marks.Transparent := false;
  SToroVacias.Marks.Clip := true;
  SToroVacias.Marks.ArrowLength := 5;
  SToroVacias.Marks.BackColor := clWhite;
  SToroVacias.OnGetMarkText := GetMarkText;
  SToroVacias.Name := 'SToroVacias';

  SToroPreniadas.SeriesColor := clGreen;
  SToroPreniadas.Marks.Visible := true;
  SToroPreniadas.PercentFormat := '#0.# %';
  SToroPreniadas.Marks.Style := smsValue;
  SToroPreniadas.Marks.Font.Size := 6;
  SToroPreniadas.Marks.Transparent := false;
  SToroPreniadas.Marks.Clip := true;
  SToroPreniadas.Marks.ArrowLength := 5;
  SToroPreniadas.Marks.BackColor := clWhite;
  SToroPreniadas.OnGetMarkText := GetMarkText;
  SToroPreniadas.Name := 'SToroPreniadas';

  DBCPorToro.RemoveAllSeries;

  for I := 1 to 10 do
    ArrAux2[I] := 0;

  for I := 0 to (Length(ArrToro)-1) do
    if I < 10 then
      ArrAux2[I+1] := (ArrToro[I].Preniadas / (ArrToro[I].Vacias+ArrToro[I].Preniadas))*100
    else
      break;

  DBCPorToro.AddSeries(SToroPreniadas);
  SToroPreniadas.AddArray(ArrAux2);


  for I := 1 to 10 do
    ArrAux2[I] := 0;

  for I := 0 to (Length(ArrToro)-1) do
    if I < 10 then
      ArrAux2[I+1] := (ArrToro[I].Vacias / (ArrToro[I].Vacias+ArrToro[I].Preniadas))*100
    else
      break;

  if Length(ArrToro) = 0 then
  begin
    DBCPorToro.LeftAxis.Automatic := false;
    DBCPorToro.LeftAxis.Minimum := 0;
    DBCPorToro.LeftAxis.Maximum := 1;
    DBCPorToro.LeftAxis.Increment := 1;
  end
  else
    DBCPorToro.LeftAxis.Automatic := true;

  DBCPorToro.AddSeries(SToroVacias);
  SToroVacias.AddArray(ArrAux2);
  //////////////////////////////////////////////////////
  ///Por Inseminador
  /////////////////////////////////////////////////////
  SInseminadorVacias.SeriesColor := clRed;
  SInseminadorVacias.Marks.Visible := true;
  SInseminadorVacias.PercentFormat := '#0.# %';
  SInseminadorVacias.Marks.Style := smsValue;
  SInseminadorVacias.Marks.Font.Size := 6;
  SInseminadorVacias.Marks.Transparent := false;
  SInseminadorVacias.Marks.Clip := true;
  SInseminadorVacias.Marks.ArrowLength := 5;
  SInseminadorVacias.Marks.BackColor := clWhite;
  SInseminadorVacias.OnGetMarkText := GetMarkText;
  SInseminadorVacias.Name := 'SInseminadorVacias';

  SInseminadorPreniadas.SeriesColor := clGreen;
  SInseminadorPreniadas.Marks.Visible := true;
  SInseminadorPreniadas.PercentFormat := '#0.# %';
  SInseminadorPreniadas.Marks.Style := smsValue;
  SInseminadorPreniadas.Marks.Font.Size := 6;
  SInseminadorPreniadas.Marks.Transparent := false;
  SInseminadorPreniadas.Marks.Clip := true;
  SInseminadorPreniadas.Marks.ArrowLength := 5;
  SInseminadorPreniadas.Marks.BackColor := clWhite;
  SInseminadorPreniadas.OnGetMarkText := GetMarkText;
  SInseminadorPreniadas.Name := 'SInseminadorPreniadas';

  DBCInseminador.RemoveAllSeries;

  for I := 1 to 5 do
    ArrAux[I] := 0;

  for I := 0 to (Length(ArrInseminador)-1) do
    if I < 5 then
      ArrAux[I+1] := (ArrInseminador[I].Preniadas / (ArrInseminador[I].Vacias+ArrInseminador[I].Preniadas))*100
    else
      break;

  DBCInseminador.AddSeries(SInseminadorPreniadas);
  SInseminadorPreniadas.AddArray(ArrAux);

  for I := 1 to 5 do
    ArrAux[I] := 0;

  for I := 0 to (Length(ArrInseminador)-1) do
    if I < 5 then
      ArrAux[I+1] := (ArrInseminador[I].Vacias / (ArrInseminador[I].Vacias+ArrInseminador[I].Preniadas))*100
    else
      break;

  if Length(ArrInseminador) = 0 then
  begin
    DBCInseminador.LeftAxis.Automatic := false;
    DBCInseminador.LeftAxis.Minimum := 0;
    DBCInseminador.LeftAxis.Maximum := 1;
    DBCInseminador.LeftAxis.Increment := 1;
  end
  else
    DBCInseminador.LeftAxis.Automatic := true;

  DBCInseminador.AddSeries(SInseminadorVacias);
  SInseminadorVacias.AddArray(ArrAux);
  /////////////////////////////////////////////////////////////////
  ///// Por Metodo de Sincronizacion
  ////////////////////////////////////////////////////////////////
  SMetodoVacias.SeriesColor := clRed;
  SMetodoVacias.Marks.Visible := true;
  SMetodoVacias.PercentFormat := '#0.# %';
  SMetodoVacias.Marks.Style := smsValue;
  SMetodoVacias.Marks.Font.Size := 6;
  SMetodoVacias.Marks.Transparent := false;
  SMetodoVacias.Marks.Clip := true;
  SMetodoVacias.Marks.ArrowLength := 5;
  SMetodoVacias.Marks.BackColor := clWhite;
  SMetodoVacias.OnGetMarkText := GetMarkText;
  SMetodoVacias.Name := 'SMetodoVacias';

  SMetodoPreniadas.SeriesColor := clGreen;
  SMetodoPreniadas.Marks.Visible := true;
  SMetodoPreniadas.PercentFormat := '#0.# %';
  SMetodoPreniadas.Marks.Style := smsValue;
  SMetodoPreniadas.Marks.Font.Size := 6;
  SMetodoPreniadas.Marks.Transparent := false;
  SMetodoPreniadas.Marks.Clip := true;
  SMetodoPreniadas.Marks.ArrowLength := 5;
  SMetodoPreniadas.Marks.BackColor := clWhite;
  SMetodoPreniadas.OnGetMarkText := GetMarkText;
  SMetodoPreniadas.Name := 'SMetodoPreniadas';
  DBCMetodo.RemoveAllSeries;

  for I := 1 to 5 do
    ArrAux[I] := 0;

  for I := 0 to (Length(ArrMetodo)-1) do
    if I < 5 then
      ArrAux[I+1] := (ArrMetodo[I].Preniadas / (ArrMetodo[I].Vacias+ArrMetodo[I].Preniadas))*100
    else
      break;

  DBCMetodo.AddSeries(SMetodoPreniadas);
  SMetodoPreniadas.AddArray(ArrAux);

  for I := 1 to 5 do
    ArrAux[I] := 0;

  for I := 0 to (Length(ArrMetodo)-1) do
    if I < 5 then
      ArrAux[I+1] := (ArrMetodo[I].Vacias / (ArrMetodo[I].Vacias+ArrMetodo[I].Preniadas))*100
    else
      break;

  if Length(ArrMetodo) = 0 then
  begin
    DBCMetodo.LeftAxis.Automatic := false;
    DBCMetodo.LeftAxis.Minimum := 0;
    DBCMetodo.LeftAxis.Maximum := 1;
    DBCMetodo.LeftAxis.Increment := 1;
  end
  else
    DBCMetodo.LeftAxis.Automatic := true;

  DBCMetodo.AddSeries(SMetodoVacias);
  SMetodoVacias.AddArray(ArrAux);
    /////////////////////////////////////////////////////////////////
  ///// Por Condicion Corporal
  ////////////////////////////////////////////////////////////////
  SCCVacias.SeriesColor := clRed;
  SCCVacias.Marks.Visible := true;
  SCCVacias.PercentFormat := '#0.# %';
  SCCVacias.Marks.Style := smsValue;
  SCCVacias.Marks.Font.Size := 6;
  SCCVacias.Marks.Transparent := false;
  SCCVacias.Marks.Clip := true;
  SCCVacias.Marks.ArrowLength := 5;
  SCCVacias.Marks.BackColor := clWhite;
  SCCVacias.OnGetMarkText := GetMarkText;
  SCCVacias.Name := 'SCCVacias';

  SCCPreniadas.SeriesColor := clGreen;
  SCCPreniadas.Marks.Visible := true;
  SCCPreniadas.PercentFormat := '#0.# %';
  SCCPreniadas.Marks.Style := smsValue;
  SCCPreniadas.Marks.Font.Size := 6;
  SCCPreniadas.Marks.Transparent := false;
  SCCPreniadas.Marks.Clip := true;
  SCCPreniadas.Marks.ArrowLength := 5;
  SCCPreniadas.Marks.BackColor := clWhite;
  SCCPreniadas.OnGetMarkText := GetMarkText;
  SCCPreniadas.Name := 'SCCPreniadas';
  DBCCC.RemoveAllSeries;

  for I := 1 to 9 do
    ArrAuxCC[I] := 0;

  for I := 0 to (Length(ArrCC)-1) do
    if I < 9 then
    begin
      Total := ArrCC[I].Vacias+ArrCC[I].Preniadas;
      if Total = 0 then
        ArrAuxCC[I+1] := Total
      else
        ArrAuxCC[I+1] := (ArrCC[I].Preniadas / Total)*100;
    end
    else
      break;

  DBCCC.AddSeries(SCCPreniadas);
  SCCPreniadas.AddArray(ArrAuxCC);

  for I := 1 to 9 do
    ArrAuxCC[I] := 0;

  for I := 0 to (Length(ArrCC)-1) do
    if I < 9 then
    begin
      Total := ArrCC[I].Vacias+ArrCC[I].Preniadas;
      if Total = 0 then
        ArrAuxCC[I+1] := Total
      else
        ArrAuxCC[I+1] := (ArrCC[I].Vacias / Total)*100;
    end
    else
      break;

  if Length(ArrCC) = 0 then
  begin
    DBCCC.LeftAxis.Automatic := false;
    DBCCC.LeftAxis.Minimum := 0;
    DBCCC.LeftAxis.Maximum := 1;
    DBCCC.LeftAxis.Increment := 1;
  end
  else
    DBCCC.LeftAxis.Automatic := true;

  DBCCC.AddSeries(SCCVacias);
  SCCVacias.AddArray(ArrAuxCC);
  /////////////////////////////////////////////////////////////////
  ///// Por GDR
  ////////////////////////////////////////////////////////////////
  SGDRVacias.SeriesColor := clRed;
  SGDRVacias.Marks.Visible := true;
  SGDRVacias.PercentFormat := '#0.# %';
  SGDRVacias.Marks.Style := smsValue;
  SGDRVacias.Marks.Font.Size := 6;
  SGDRVacias.Marks.Transparent := false;
  SGDRVacias.Marks.Clip := true;
  SGDRVacias.Marks.ArrowLength := 5;
  SGDRVacias.Marks.BackColor := clWhite;
  SGDRVacias.OnGetMarkText := GetMarkText;
  SGDRVacias.Name := 'SGDRVacias';

  SGDRPreniadas.SeriesColor := clGreen;
  SGDRPreniadas.Marks.Visible := true;
  SGDRPreniadas.PercentFormat := '#0.# %';
  SGDRPreniadas.Marks.Style := smsValue;
  SGDRPreniadas.Marks.Font.Size := 6;
  SGDRPreniadas.Marks.Transparent := false;
  SGDRPreniadas.Marks.Clip := true;
  SGDRPreniadas.Marks.ArrowLength := 5;
  SGDRPreniadas.Marks.BackColor := clWhite;
  SGDRPreniadas.OnGetMarkText := GetMarkText;
  SGDRPreniadas.Name := 'SGDRPreniadas';
  
  DBCGDR.RemoveAllSeries;

  for I := 1 to 5 do
    ArrAux[I] := 0;

  for I := 0 to (Length(ArrGDR)-1) do
    if I < 5 then
    begin
      Total := ArrGDR[I].Vacias+ArrGDR[I].Preniadas;
      if Total = 0 then
        ArrAux[I+1] := Total
      else
        ArrAux[I+1] := (ArrGDR[I].Preniadas / Total)*100;
    end
    else
      break;

  DBCGDR.AddSeries(SGDRPreniadas);
  SGDRPreniadas.AddArray(ArrAux);

  for I := 1 to 5 do
    ArrAux[I] := 0;

  for I := 0 to (Length(ArrGDR)-1) do
    if I < 5 then
    begin
      Total := ArrGDR[I].Vacias+ArrGDR[I].Preniadas;
      if Total = 0 then
        ArrAux[I+1] := Total
      else
        ArrAux[I+1] := (ArrGDR[I].Vacias / Total)*100;
    end
    else
      break;

  if Length(ArrGDR) = 0 then
  begin
    DBCGDR.LeftAxis.Automatic := false;
    DBCGDR.LeftAxis.Minimum := 0;
    DBCGDR.LeftAxis.Maximum := 1;
    DBCGDR.LeftAxis.Increment := 1;
  end
  else
    DBCGDR.LeftAxis.Automatic := true;

  ArrGDR[4].Nombre := 'NN';
  DBCGDR.AddSeries(SGDRVacias);
  SGDRVacias.AddArray(ArrAux);
  ////////////////////////////////////////////////////////////////////
  /////Todos los Servicios
  ///////////////////////////////////////////////////////////////////
  STotales.Clear;
  STotales.Marks.Style := smsPercent;
  STotales.Marks.BackColor := clWhite;

  Total := 0;
  Vacias := 0;
  Preniadas := 0;

  for I := 0 to Length(ArrServicio)-1 do
  begin
    //MServicios.Lines.Add(ArrServicio[I].Nombre+' - '+FormatFloat('##.##',ArrServicio[I].Preniadas/(ArrServicio[I].Preniadas+ArrServicio[I].Vacias))+'%');
    Vacias := Vacias + ArrServicio[I].Vacias;
    Preniadas := Preniadas + ArrServicio[I].Preniadas;
  end;
  Total := Vacias+Preniadas;

  DBCTotales.RemoveAllSeries;
  DBCTotales.AddSeries(STotales);
  if Total > 0 then
  begin
    STotales.Add(Preniadas/Total,'Preñadas',clGreen);
    STotales.Add(Vacias/Total,'Vacias',clRed);
  end;
  ///////////////////////////////////////////////////////////////////
end;

procedure TFRepInseminaciones.IBQServiciosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

procedure TFRepInseminaciones.DBCPorToroGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  inherited;
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrToro)>valor) then
      begin
        if ArrToro[valor].Nombre = '-' then
          LabelText := '-'
        else
          LabelText := ArrToro[valor].Nombre;
      end
      else
        LabelText := '-'
end;

procedure TFRepInseminaciones.DBCInseminadorGetAxisLabel(
  Sender: TChartAxis; Series: TChartSeries; ValueIndex: Integer;
  var LabelText: String);
var
  valor : integer;
begin
  inherited;
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrInseminador)>valor) then
      begin
        if ArrInseminador[valor].Nombre = '-' then
          LabelText := '-'
        else
          LabelText := ArrInseminador[valor].Nombre;
      end
      else
        LabelText := '-'
end;

procedure TFRepInseminaciones.DBCMetodoGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  inherited;
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrMetodo)>valor) then
      begin
        if ArrMetodo[valor].Nombre = '-' then
          LabelText := '-'
        else
          LabelText := ArrMetodo[valor].Nombre;
      end
      else
        LabelText := '-'

end;

procedure TFRepInseminaciones.GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  inherited;
  if MarkText <> '0' then
    MarkText := FormatFloat('##.#',StrToFloat(MarkText))+'%'
  else
    MarkText := '';
end;

procedure TFRepInseminaciones.DBCGetLegendText(
  Sender: TCustomAxisPanel; LegendStyle: TLegendStyle; Index: Integer;
  var LegendText: String);
begin
  inherited;
  if Index = 1 then
    LegendText := 'Vacias'
  else
    LegendText := 'Preñadas';
end;

procedure TFRepInseminaciones.BBImprimirReporteClick(Sender: TObject);
var
  F : TFRepInseminacionesPreview;
  Cartel : TCartel;
begin
  inherited;
  HabilitarDesabilitarControles();
  Cartel := TCartel.GetInstance();
  Cartel.abrircartel('Generando Informe de Inseminacion Artificial/Servicio a Corral');

  F := TFRepInseminacionesPreview.Create(nil);

  DBCPorToro.SaveToMetafile(ExtractFilePath(Application.ExeName)+'PorToro.wmf');
  DBCInseminador.SaveToMetafile(ExtractFilePath(Application.ExeName)+'PorInseminador.wmf');
  DBCMetodo.SaveToMetafile(ExtractFilePath(Application.ExeName)+'PorMetodo.wmf');
  DBCTotales.SaveToMetafile(ExtractFilePath(Application.ExeName)+'TotalesPorPren.wmf');
  DBCCC.SaveToMetafile(ExtractFilePath(Application.ExeName)+'PorCC.wmf');
  DBCGDR.SaveToMetafile(ExtractFilePath(Application.ExeName)+'PorGDR.wmf');

  //F.QRLServicio.Caption := DBLCBAServicio.Text;
  F.QRIToro.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'PorToro.wmf');
  F.QRIInseminador.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'PorInseminador.wmf');
  F.QRIMetodo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'PorMetodo.wmf');
  F.QRITotales.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'TotalesPorPren.wmf');
  F.QRICC.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'PorCC.wmf');
  F.QRIGDR.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'PorGDR.wmf');

  ArmarTablaPreview(F);
  ArmarCuadros(F);

  F.QRObservacviones.Lines := MObservaciones.Lines;
  F.Listado := CBListado.Checked;

  if not porServicio then
  begin
    F.QRLTipo.Caption := Traducir('Periodo: ');
    F.QRLServicio.Caption := Traducir('Desde: ')+DateToStr(DTPADesde.Date)+Traducir(' Hasta: ')+DateToStr(DTPAHasta.Date);
  end
  else
  begin
    F.QRLTipo.Caption := Traducir('Servicio: ');
    F.QRLServicio.Caption := ArrServicio[0].Nombre;
  end;

  Cartel.cerrarcartel;
  Cartel.FreeInstance;

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFRepInseminaciones.RGTipoClick(Sender: TObject);
begin
  inherited;
    if (TRadioGroup(Sender).ItemIndex = 1) then
    begin
      GBServicio.Enabled := true;
      GBFechas.Enabled := false;
      DBLCBAServicio.Enabled := true;
      label2.Enabled:= false;
      label3.Enabled:= false;
      DTPADesde.Enabled:= false;
      DTPAHasta.Enabled:= false;
    end
  else
    begin
      DBLCBAServicio.Enabled := false;
      GBServicio.Enabled := false;
      GBFechas.Enabled := true;
      label2.Enabled:= true;
      label3.Enabled:= true;
      DTPADesde.Enabled:= true;
      DTPAHasta.Enabled:= true;
    end;
  porServicio := RGTipo.ItemIndex = 1;
end;

procedure TFRepInseminaciones.DBCCCGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  inherited;
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrCC)>valor) then
      begin
        if ArrCC[valor].Nombre = '-' then
          LabelText := '-'
        else
          LabelText := ArrCC[valor].Nombre;
      end
      else
        LabelText := '-'
end;

procedure TFRepInseminaciones.DBCGDRGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  valor : integer;
begin
  inherited;
  if Sender.Horizontal then
    if TryStrToInt(LabelText,valor) then
      if (valor >= 0) and (Length(ArrGDR)>valor) then
      begin
        if ArrGDR[valor].Nombre = '-' then
          LabelText := '-'
        else
          LabelText := ArrGDR[valor].Nombre;
      end
      else
        LabelText := '-'
end;

procedure TFRepInseminaciones.IBQRepInseminacionAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  IBQRepInseminacion.Last;
  IBQRepInseminacion.First;
  GBAnimales.Caption := Traducir('Animales con diagnóstico de gestación [')+IntToStr(IBQRepInseminacion.RecordCount)+']';
  {BBImprimirReporte.Enabled := not IBQRepInseminacion.IsEmpty;
  BBXls.Enabled := not IBQRepInseminacion.IsEmpty;}
  IPreview.Enabled := not IBQRepInseminacion.IsEmpty;
  LPreview.Enabled := not IBQRepInseminacion.IsEmpty;
  LExpExcel.Enabled := not IBQRepInseminacion.IsEmpty;
  IExpExcel.Enabled := not IBQRepInseminacion.IsEmpty;
end;

procedure TFRepInseminaciones.DBLCBARodeosCloseUp(Sender: TObject);
begin
  inherited;
  Rodeo := DBLCBARodeos.KeyValue;
end;

procedure TFRepInseminaciones.CBACategoriaCloseUp(Sender: TObject);
begin
  inherited;
  case CBACategoria.ItemIndex of
    0 : Categoria := 6;
    1 : Categoria := 5;
  end;
end;

procedure TFRepInseminaciones.RGFiltrosClick(Sender: TObject);
begin
  inherited;
  case RGFiltros.ItemIndex of
    0 : begin
          DBLCBARodeos.Enabled := true;
          CBACategoria.Enabled := false;
          TipoRegistro := null;
          TipoServicio := null;
          CBATipoServicio.Enabled := false;
          DBLCBATipoRegistro.Enabled := false;
          Categoria := null;
        end;
    1 : begin
          TipoRegistro := null;
          TipoServicio := null;
          CBATipoServicio.Enabled := false;
          DBLCBATipoRegistro.Enabled := false;
          DBLCBARodeos.Enabled := false;
          CBACategoria.Enabled := true;
          Rodeo := null;
        end;
    2 : begin
          TipoRegistro := null;
          TipoServicio := null;
          CBATipoServicio.Enabled := false;
          DBLCBATipoRegistro.Enabled := false;
          DBLCBARodeos.Enabled := false;
          CBACategoria.Enabled := false;
          Rodeo := null;
          Categoria := null;
        end;
    3 : begin
          DBLCBARodeos.Enabled := false;
          CBACategoria.Enabled := false;
          TipoRegistro := null;
          CBATipoServicio.Enabled := true;
          DBLCBATipoRegistro.Enabled := false;
          Categoria := null;
          Rodeo := null;
          TipoServicio := 0;
        end;
    4 : begin
          DBLCBARodeos.Enabled := false;
          CBACategoria.Enabled := false;
          TipoServicio := null;
          CBATipoServicio.Enabled := false;
          DBLCBATipoRegistro.Enabled := true;
          Categoria := null;
          Rodeo := null;
        end;
  end;
end;

procedure TFRepInseminaciones.ArmarCuadros(F : TFRepInseminacionesPreview);
var
  I, Total : Integer;
begin
  //Cuadro de Condicion Corporal
  for I := 0 to Length(ArrCC)-1 do
  begin
    Total := ArrCC[I].Preniadas+ArrCC[I].Vacias;
    case I of
      0 : if Total > 0 then
            F.CC1.Caption := IntToStr(Total);
      1 : if Total > 0 then
            F.CC2.Caption := IntToStr(Total);
      2 : if Total > 0 then
            F.CC3.Caption := IntToStr(Total);
      3 : if Total > 0 then
            F.CC4.Caption := IntToStr(Total);
      4 : if Total > 0 then
            F.CC5.Caption := IntToStr(Total);
      5 : if Total > 0 then
            F.CC6.Caption := IntToStr(Total);
      6 : if Total > 0 then
            F.CC7.Caption := IntToStr(Total);
      7 : if Total > 0 then
            F.CC8.Caption := IntToStr(Total);
      8 : if Total > 0 then
            F.CC9.Caption := IntToStr(Total);
    end;
  end;
  //Cuadro de GDR
  for I := 0 to Length(ArrGDR)-1 do
  begin
    Total := ArrGDR[I].Preniadas+ArrGDR[I].Vacias;
    case I of
      0 : if Total > 0 then
            F.GDR1.Caption := IntToStr(Total);
      1 : if Total > 0 then
            F.GDR2.Caption := IntToStr(Total);
      2 : if Total > 0 then
            F.GDR3.Caption := IntToStr(Total);
      3 : if Total > 0 then
            F.GDR4.Caption := IntToStr(Total);
      4 : if Total > 0 then
            F.GDR5.Caption := IntToStr(Total);
    end;
  end;
  //Cuadro de Toro
  for I := 0 to Length(ArrToro)-1 do
  begin
    Total := ArrToro[I].Preniadas+ArrToro[I].Vacias;
    case I of
      0 : if Total > 0 then
            F.Toro1.Caption := IntToStr(Total);
      1 : if Total > 0 then
            F.Toro2.Caption := IntToStr(Total);
      2 : if Total > 0 then
            F.Toro3.Caption := IntToStr(Total);
      3 : if Total > 0 then
            F.Toro4.Caption := IntToStr(Total);
      4 : if Total > 0 then
            F.Toro5.Caption := IntToStr(Total);
      5 : if Total > 0 then
            F.Toro6.Caption := IntToStr(Total);
      6 : if Total > 0 then
            F.Toro7.Caption := IntToStr(Total);
      7 : if Total > 0 then
            F.Toro8.Caption := IntToStr(Total);
      8 : if Total > 0 then
            F.Toro9.Caption := IntToStr(Total);
      9 : if Total > 0 then
            F.Toro10.Caption := IntToStr(Total);
     { 10 : if Total > 0 then
            F.Toro11.Caption := IntToStr(Total);
      11 : if Total > 0 then
            F.Toro12.Caption := IntToStr(Total);
      12 : if Total > 0 then
            F.Toro13.Caption := IntToStr(Total);
      13 : if Total > 0 then
            F.Toro14.Caption := IntToStr(Total);
      14 : if Total > 0 then
            F.Toro15.Caption := IntToStr(Total);
      15 : if Total > 0 then
            F.Toro16.Caption := IntToStr(Total);
      16 : if Total > 0 then
            F.Toro17.Caption := IntToStr(Total);
      17 : if Total > 0 then
            F.Toro18.Caption := IntToStr(Total);
      18 : if Total > 0 then
            F.Toro19.Caption := IntToStr(Total);
      19 : if Total > 0 then
            F.Toro20.Caption := IntToStr(Total);  }
    end;
  end;
  //Cuadro de Inseminador
  for I := 0 to Length(ArrInseminador)-1 do
  begin
    Total := ArrInseminador[I].Preniadas+ArrInseminador[I].Vacias;
    case I of
      0 : if Total > 0 then
            F.Ins1.Caption := IntToStr(Total);
      1 : if Total > 0 then
            F.Ins2.Caption := IntToStr(Total);
      2 : if Total > 0 then
            F.Ins3.Caption := IntToStr(Total);
      3 : if Total > 0 then
            F.Ins4.Caption := IntToStr(Total);
      4 : if Total > 0 then
            F.Ins5.Caption := IntToStr(Total);
    end;
  end;
  //Cuadro de Metodo de Sincronizacion
  for I := 0 to Length(ArrMetodo)-1 do
  begin
    Total := ArrMetodo[I].Preniadas+ArrMetodo[I].Vacias;
    case I of
      0 : if Total > 0 then
            F.Metodo1.Caption := IntToStr(Total);
      1 : if Total > 0 then
            F.Metodo2.Caption := IntToStr(Total);
      2 : if Total > 0 then
            F.Metodo3.Caption := IntToStr(Total);
      3 : if Total > 0 then
            F.Metodo4.Caption := IntToStr(Total);
      4 : if Total > 0 then
            F.Metodo5.Caption := IntToStr(Total);
    end;
  end;
end;

procedure TFRepInseminaciones.DBLCBAServicioKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBAServicio.ListVisible) then
    DBLCBAServicioCloseUp(nil);
end;

procedure TFRepInseminaciones.BDBGAnimalesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (BDBGAnimales.SelectedIndex = 0) then
    if not(IBQRepInseminacion.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQRepInseminacion.fieldByName('vaca').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFRepInseminaciones.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFRepInseminaciones.CBATipoServicioCloseUp(Sender: TObject);
begin
  inherited;
  TipoServicio := CBATipoServicio.ItemIndex;
end;

procedure TFRepInseminaciones.DBLCBATipoRegistroCloseUp(Sender: TObject);
begin
  inherited;
  TipoRegistro := DBLCBATipoRegistro.KeyValue;
end;

procedure TFRepInseminaciones.FormShow(Sender: TObject);
begin
  inherited;
  RGFiltrosClick(nil);
end;

procedure TFRepInseminaciones.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFRepInseminaciones.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
