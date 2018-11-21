unit UREPDGDistribucionPrenezCACUCO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, DBCtrls, Types,
  UDBLookupComboBoxAuto, DateTimePickerAuto, StdCtrls, Buttons, Grids,
  DBGrids, UBDBGrid, TeEngine, Series, TeeProcs, Chart, DbChart, DB,
  IBCustomDataSet, IBQuery, IBStoredProc, DataExport, DataToXLS, WinXP,
  ComboBoxAuto, DateUtils, UMensajeImpresora, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPDGDistribucionPrenezCACUCO = class(TFUniversal)
    PTop: TPanel;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    GBGrupos: TGroupBox;
    DBLCBASeleccionGrupo: TDBLookupComboBoxAuto;
    RGTipo: TRadioGroup;
    PAnimales: TPanel;
    GBAnimales: TGroupBox;
    BitDBGrid1: TBitDBGrid;
    ASalir: TAction;
    AImprimirReporte: TAction;
    IBQGrupos: TIBQuery;
    DSGrupos: TDataSource;
    IBQSPDistribucionPrenez: TIBQuery;
    DSAnimales: TDataSource;
    IBQAnimales: TIBQuery;
    IBQAnimalesID_ANIMAL: TIntegerField;
    IBQAnimalesRP_ANIMAL: TIBStringField;
    IBQAnimalesID_EVENTO: TIntegerField;
    IBQAnimalesDIAS_ACTUALES: TIntegerField;
    IBQAnimalesID_CODIGO_PRENEZ: TIBStringField;
    IBQAnimalesNOMBRE: TIBStringField;
    IBQAnimalesORDEN: TIntegerField;
    IBQAnimalesDIAS_AL_TACTO: TIntegerField;
    IBQSPDistribucionPrenezCANTIDAD: TIntegerField;
    IBQSPDistribucionPrenezNOMBRE: TIBStringField;
    IBQAnimalesFECHA_PARTO: TDateField;
    Panel1: TPanel;
    RGFiltros: TRadioGroup;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    CBACategoria: TComboBoxAuto;
    GBTactadas: TGroupBox;
    DBCDistribucion: TDBChart;
    Series1: TPieSeries;
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
    GConsulta: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure DBLCBASeleccionGrupoCloseUp(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure IBQGruposBeforeOpen(DataSet: TDataSet);
    procedure BitDBGrid1DblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGFiltrosClick(Sender: TObject);
    procedure DBLCBARodeosCloseUp(Sender: TObject);
    procedure DBLCBASeleccionGrupoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBARodeosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBACategoriaChange(Sender: TObject);
    procedure CBACategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure BitDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DTPACloseUpFechas(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    SQLBasicoCons, SQLBasicoCont, SQLConsultaCons, SQLConsultaCont, RestoSQLCons, RestoSQLCont, FiltroSQL : String;
    valor : Integer;
    procedure ActualizarGrupos;
    procedure ActualizarFechas;
    procedure ActualizarBotones;
    function Cantidad_Animales : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREPDGDistribucionPrenezCACUCO: TFREPDGDistribucionPrenezCACUCO;

implementation

uses UPrincipal,uTiposGlobales, UREPDGDistribucionPrenezCACUCOPreview, UDMSoftvet, UREPFichaAnimal,
     UCartel, UTraduccion;

{$R *.dfm}

procedure TFREPDGDistribucionPrenezCACUCO.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;
// muestro el reporte 
procedure TFREPDGDistribucionPrenezCACUCO.AImprimirReporteExecute(
  Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  MostrarMensajeImpresion();
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del Reporte de Distribución de Preñez ...';
  cartel.abrircartel(msje);
  inherited;
  Application.CreateForm(TFREPDGDistribucionPrenezCACUCOPreview, FREPDGDistribucionPrenezCACUCOPreview);
  DBCDistribucion.SaveToMetafile(ExtractFilePath(Application.ExeName)+'grafico.wmf');
  if (RGTipo.ItemIndex = 0) then
  begin
    FREPDGDistribucionPrenezCACUCOPreview.QRLD.Enabled := false;
    FREPDGDistribucionPrenezCACUCOPreview.QRLDesde.Enabled := false;
    FREPDGDistribucionPrenezCACUCOPreview.QRLG.Enabled := true;
    FREPDGDistribucionPrenezCACUCOPreview.QRLGrupo.Enabled := true;
    FREPDGDistribucionPrenezCACUCOPreview.QRLGrupo.Caption := DBLCBASeleccionGrupo.Text;
    FREPDGDistribucionPrenezCACUCOPreview.QRLH.Enabled := false;
    FREPDGDistribucionPrenezCACUCOPreview.QRLHasta.Enabled := false;
    FREPDGDistribucionPrenezCACUCOPreview.QRLPeriodo.Enabled := false;
  end
  else
  begin
    FREPDGDistribucionPrenezCACUCOPreview.QRLD.Enabled := true;
    FREPDGDistribucionPrenezCACUCOPreview.QRLDesde.Enabled := true;
    FREPDGDistribucionPrenezCACUCOPreview.QRLG.Enabled := false;
    FREPDGDistribucionPrenezCACUCOPreview.QRLGrupo.Enabled := false;
    FREPDGDistribucionPrenezCACUCOPreview.QRLDesde.Caption := DateToStr(DTPADesde.Date);
    FREPDGDistribucionPrenezCACUCOPreview.QRLHasta.Caption := DateToStr(DTPAHasta.Date);
    FREPDGDistribucionPrenezCACUCOPreview.QRLH.Enabled := true;
    FREPDGDistribucionPrenezCACUCOPreview.QRLHasta.Enabled := true;
    FREPDGDistribucionPrenezCACUCOPreview.QRLPeriodo.Enabled := true;
  end;
  if not(CBListado.Checked) then
  begin
    FREPDGDistribucionPrenezCACUCOPreview.QRBand3.Enabled := false;
    FREPDGDistribucionPrenezCACUCOPreview.QRGroup1.Enabled := false;
    FREPDGDistribucionPrenezCACUCOPreview.QRBand2.Enabled := false;
  end;
  FREPDGDistribucionPrenezCACUCOPreview.QRITratadas.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'grafico.wmf');
//  FREPDGDistribucionPrenezCACUCOPreview.QRCReporte.Preview;
  cartel.cerrarcartel();
  cartel.FreeInstance();
  FREPDGDistribucionPrenezCACUCOPreview.ShowModal;
  HabilitarDesabilitarControles();  
end;

procedure TFREPDGDistribucionPrenezCACUCO.FormShow(Sender: TObject);
begin
  inherited;
  IBQGrupos.Open;
  DMSoftvet.IBQAfterOpen(IBQGrupos);
  IBQGrupos.First;
  if (DBLCBASeleccionGrupo.KeyValue = NULL) then
    DBLCBASeleccionGrupo.KeyValue := IBQGrupos.FieldValues['ID_GRUPO'];

  DTPADesde.DateTime := IncYear(now,-1);
  DTPAHasta.DateTime := now;

  LDesde.Enabled:= false;
  LHasta.Enabled:= false;
  DTPADesde.Enabled:= false;
  DTPAHasta.Enabled:= false;
end;

// seteo los parametros del sp
procedure TFREPDGDistribucionPrenezCACUCO.ActualizarGrupos;
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Generando Distribución de Preñez ...';
  cartel.abrircartel(msje);
  // grafico
  SQLConsultaCont := SQLBasicoCont+FiltroSQL+RestoSQLCont;
  IBQSPDistribucionPrenez.Close;
  IBQSPDistribucionPrenez.SQL.Clear;
  IBQSPDistribucionPrenez.SQL.Add(SQLConsultaCont);
  IBQSPDistribucionPrenez.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQSPDistribucionPrenez.ParamByName('grupo').Value := DBLCBASeleccionGrupo.KeyValue;
  if (FiltroSQL <> ' ') then
    IBQSPDistribucionPrenez.ParamByName('var').Value := valor;
  IBQSPDistribucionPrenez.Open;

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

  ActualizarBotones;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFREPDGDistribucionPrenezCACUCO.actualizarFechas;
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Generando Distribución de Preñez ...';
  cartel.abrircartel(msje);   
  // grafico
  SQLConsultaCont := SQLBasicoCont+FiltroSQL+RestoSQLCont;
  IBQSPDistribucionPrenez.Close;
  IBQSPDistribucionPrenez.SQL.Clear;
  IBQSPDistribucionPrenez.SQL.Add(SQLConsultaCont);
  IBQSPDistribucionPrenez.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQSPDistribucionPrenez.ParamByName('desde').Value := DTPADesde.DateTime;
  IBQSPDistribucionPrenez.ParamByName('hasta').Value := DTPAHasta.DateTime;
  IBQSPDistribucionPrenez.ParamByName('grupo').Value := null;
  if (FiltroSQL <> ' ') then
    IBQSPDistribucionPrenez.ParamByName('var').Value := valor;
  IBQSPDistribucionPrenez.Open;

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

  ActualizarBotones;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

// selecciono como graficar
procedure TFREPDGDistribucionPrenezCACUCO.RGTipoClick(Sender: TObject);
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

procedure TFREPDGDistribucionPrenezCACUCO.DBLCBASeleccionGrupoCloseUp(
  Sender: TObject);
begin
  inherited;
end;
 
//  muestro el boton para ver el reporte
procedure TFREPDGDistribucionPrenezCACUCO.ActualizarBotones;
begin
  //AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  IPreview.Enabled := not(IBQAnimales.IsEmpty);
  LPreview.Enabled := not(IBQAnimales.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimales.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimales.IsEmpty);
end;


procedure TFREPDGDistribucionPrenezCACUCO.IBQAnimalesAfterOpen(DataSet: TDataSet);

begin
  inherited;


  IBQAnimales.Last;
  IBQAnimales.First;  
  BitDBGrid1.DataSource := DSAnimales;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQAnimales.RecordCount)+']';
  AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);
end;

procedure TFREPDGDistribucionPrenezCACUCO.IBQGruposBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  IBQGrupos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
end;

procedure TFREPDGDistribucionPrenezCACUCO.BitDBGrid1DblClick(
  Sender: TObject);
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

procedure TFREPDGDistribucionPrenezCACUCO.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPDGDistribucionPrenezCACUCO.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQRodeo.close;
  DMSoftvet.IBQRodeo.ParamByName('esta').Value := Fprincipal.establecimientoActual;
  DMSoftvet.IBQRodeo.Open;

  SQLBasicoCont := 'select count(*) as cantidad, nombre from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :grupo, ''TODAY'') where (repro = ''P'') and (dias_al_tacto>0)';
  SQLBasicoCons := 'select * from GET_Distribucion_PRENEZ (:esta, :desde, :hasta, :grupo, ''Today'') where (repro = ''P'') and (dias_al_tacto>0)';
  RestoSQLCons := ' order by orden, rp_animal';
  RestoSQLCont := ' group by id_codigo_prenez, nombre';
  FiltroSQL := ' ';
  SQLConsultaCons := SQLBasicoCons+FiltroSQL+RestoSQLCons;
  SQLConsultaCont := SQLBasicoCont+FiltroSQL+RestoSQLCont;

end;

procedure TFREPDGDistribucionPrenezCACUCO.RGFiltrosClick(Sender: TObject);
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

procedure TFREPDGDistribucionPrenezCACUCO.DBLCBARodeosCloseUp(
  Sender: TObject);
begin
  inherited;
  valor := DBLCBARodeos.KeyValue;
  //if (RGTipo.ItemIndex = 0) then ActualizarGrupos
  //else  ActualizarFechas;
end;

function TFREPDGDistribucionPrenezCACUCO.Cantidad_Animales : integer;
var
  i, resultado : integer;
begin
  resultado := 0;
  for i := 0 to Series1.PieValues.Count-1 do
    resultado := resultado+Trunc(Series1.PieValues.Value[i]);
  Result := resultado;
end;

procedure TFREPDGDistribucionPrenezCACUCO.DBLCBASeleccionGrupoKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  //if not(DBLCBASeleccionGrupo.ListVisible) then
    //actualizarGrupos;
end;

procedure TFREPDGDistribucionPrenezCACUCO.DBLCBARodeosKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBARodeos.ListVisible) then
   DBLCBARodeosCloseUp(nil);
end;

procedure TFREPDGDistribucionPrenezCACUCO.CBACategoriaChange(
  Sender: TObject);
begin
  inherited;
  if (CBACategoria.ItemIndex = 0) then
    valor := 6
  else
    valor := 5;
  //if (RGTipo.ItemIndex = 0) then ActualizarGrupos
  //else  ActualizarFechas;
end;

procedure TFREPDGDistribucionPrenezCACUCO.CBACategoriaKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFREPDGDistribucionPrenezCACUCO.BitDBGrid1KeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (key=#13) then
    BitDBGrid1DblClick(nil);
end;

procedure TFREPDGDistribucionPrenezCACUCO.DTPACloseUpFechas(
  Sender: TObject);
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

procedure TFREPDGDistribucionPrenezCACUCO.DTPADesdeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUpFechas(Sender);
end;

procedure TFREPDGDistribucionPrenezCACUCO.BConsultaClick(Sender: TObject);
begin
  inherited;
  if (RGTipo.ItemIndex = 0) then
    ActualizarGrupos
  else
    ActualizarFechas;
end;

procedure TFREPDGDistribucionPrenezCACUCO.JvIBotonBuscarClick(
  Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
