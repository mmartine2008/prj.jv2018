unit UREPCMEvaluacionToros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,                         
  Grids, DBGrids, UBDBGrid, ActnList, ComCtrls, ExtCtrls, IBStoredProc,
  DataExport, DataToXLS, WinXP, DBCtrls, UDBLookupComboBoxAuto,
  DateTimePickerAuto, UMensajeImpresora, JvGIF, PngImage, jpeg,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPCMEvaluacionToros = class(TFUniversal)
    GBAnimales: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    IBQAnimales: TIBQuery;
    DSAnimales: TDataSource;
    ASalir: TAction;
    AImprimirReporte: TAction;
    IBQAnimalesRP: TIBStringField;
    IBQAnimalesEDAD: TIBStringField;
    IBQAnimalesVENEREA1: TIBStringField;
    IBQAnimalesVENEREA2: TIBStringField;
    IBQAnimalesBRUCELOSIS: TIBStringField;
    IBQAnimalesCAPACIDAD_SERVICIO: TIBStringField;
    IBQAnimalesCALIDAD_SEMINAL: TIBStringField;
    IBQAnimalesCLINICO: TIBStringField;
    IBQAnimalesID_ANIMAL: TIntegerField;
    IBQAnimalesFECHACIRCUNF: TDateField;
    IBQAnimalesFECHAVENEREA1: TDateField;
    IBQAnimalesFECHAVENEREA2: TDateField;
    IBQAnimalesFECHABRUCELOSIS: TDateField;
    IBQAnimalesFECHACAPSERVICIO: TDateField;
    IBQAnimalesFECHACALSEMINAL: TDateField;
    IBQAnimalesFECHACLINICO: TDateField;
    IBQAnimalesTUBERCULINIZACION: TIBStringField;
    IBQAnimalesFECHATUBERC: TDateField;
    PTop: TPanel;
    Splitter2: TSplitter;
    GBFiltros: TGroupBox;
    DBLCBASeleccionGrupo: TDBLookupComboBoxAuto;
    IBQGrupos: TIBQuery;
    DSGrupos: TDataSource;
    IBQAnimalesVENEREACAMPI1: TIBStringField;
    IBQAnimalesVENEREATRICO1: TIBStringField;
    IBQAnimalesVENEREACAMPI2: TIBStringField;
    IBQAnimalesVENEREATRICO2: TIBStringField;
    CBGrupo: TCheckBox;
    IBQAnimalesRODEO: TIntegerField;
    IBQAnimalesPOTRERO: TIntegerField;
    CBAnimal: TCheckBox;
    DBEAnimal: TEdit;
    IBQPotrero: TIBQuery;
    IBQRodeo: TIBQuery;
    DSRodeo: TDataSource;
    DSPotrero: TDataSource;
    CBPotrero: TCheckBox;
    CBRodeo: TCheckBox;
    DBLCBRodeo: TDBLookupComboBoxAuto;
    DBLCBPotrero: TDBLookupComboBoxAuto;
    GroupBox1: TGroupBox;
    MObservaciones: TMemo;
    IBQAnimalesCIRCUNFERENCIA: TFloatField;
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
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BDBGAnimalesKeyPress(Sender: TObject; var Key: Char);
    procedure CBPotreroClick(Sender: TObject);
    procedure CBRodeoClick(Sender: TObject);
    procedure CBGrupoClick(Sender: TObject);
    procedure DBEAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBPotreroCloseUp(Sender: TObject);
    procedure DBLCBPotreroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBRodeoCloseUp(Sender: TObject);
    procedure DBLCBRodeoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEAnimalChange(Sender: TObject);
    procedure CBAnimalClick(Sender: TObject);
    procedure DBLCBASeleccionGrupoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBASeleccionGrupoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);

  private
    { Private declarations }
  select, where, order: String;
  procedure ActualizarConsulta();
  procedure Inic_Filtros;
  procedure InicializarSelect();
  public
    { Public declarations }
  end;

var
  FREPCMEvaluacionToros: TFREPCMEvaluacionToros;

implementation

uses UPrincipal,uTiposGlobales, UREPCMEvaluacionTorosPreview, UREPFichaAnimal, UCartel, UTraduccion,
  DateUtils;

{$R *.dfm}

procedure TFREPCMEvaluacionToros.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close;
end;

procedure TFREPCMEvaluacionToros.AImprimirReporteExecute(Sender: TObject);
var
  cartel : TCartel;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel := TCartel.getInstance();
  cartel.abrircartel('Generando Reporte de Evaluación de Toros...');

  cartel.cerrarcartel;
  cartel.FreeInstance;

  Application.CreateForm(TFREPCMEvaluacionTorosPreview, FREPCMEvaluacionTorosPreview);

  FREPCMEvaluacionTorosPreview.QRLPotreroText.Caption:= DBLCBPotrero.Text;
  FREPCMEvaluacionTorosPreview.QRLRodeoText.Caption:= DBLCBRodeo.Text;
  FREPCMEvaluacionTorosPreview.QRLGrupoText.Caption:= DBLCBASeleccionGrupo.Text;

  FREPCMEvaluacionTorosPreview.QRLTodos.Enabled:= not(CBAnimal.Checked) and not(CBPotrero.Checked) and not(CBRodeo.Checked) and not(CBGrupo.Checked);
  FREPCMEvaluacionTorosPreview.QRLPotreros.Enabled:= CBPotrero.Checked;
  FREPCMEvaluacionTorosPreview.QRLRodeos.Enabled:= CBRodeo.Checked;
  FREPCMEvaluacionTorosPreview.QRLGrupos.Enabled:= CBGrupo.Checked;
  FREPCMEvaluacionTorosPreview.QRLPotreroText.Enabled:= CBPotrero.Checked;
  FREPCMEvaluacionTorosPreview.QRLRodeoText.Enabled:= CBRodeo.Checked;
  FREPCMEvaluacionTorosPreview.QRLGrupoText.Enabled:= CBGrupo.Checked;

  FREPCMEvaluacionTorosPreview.QRMemo.Lines.AddStrings(MObservaciones.Lines);

  FREPCMEvaluacionTorosPreview.ShowModal;
  HabilitarDesabilitarControles();  
end;

procedure TFREPCMEvaluacionToros.IBQAnimalesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQAnimales.Last;
  IBQAnimales.First;  
  BDBGAnimales.DataSource := DSAnimales;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQAnimales.RecordCount)+']';
  {AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);}
  IPreview.Enabled := not(IBQAnimales.IsEmpty);
  LPreview.Enabled := not(IBQAnimales.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimales.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimales.IsEmpty);
end;

procedure TFREPCMEvaluacionToros.BDBGAnimalesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BDBGAnimales.SelectedIndex = 0 then
    if not(IBQAnimales.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQAnimales.fieldByName('ID_ANIMAL').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPCMEvaluacionToros.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPCMEvaluacionToros.FormShow(Sender: TObject);
begin
  inherited;
  InicializarSelect();
  Inic_Filtros;

  //ActualizarConsulta();
end;

procedure TFREPCMEvaluacionToros.BDBGAnimalesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BDBGAnimalesDblClick(nil);
end;

procedure TFREPCMEvaluacionToros.CBPotreroClick(Sender: TObject);
begin
  inherited;
  DBLCBPotrero.Enabled:= CBPotrero.Checked;
  if (CBPotrero.Checked) then
    DBLCBPotrero.KeyValue:= 0;
  DBLCBPotreroCloseUp(nil);
end;

procedure TFREPCMEvaluacionToros.Inic_Filtros;
begin
  try
    IBQRodeo.Close;
    IBQRodeo.ParamByName('id_establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQRodeo.Open;
    IBQRodeo.Last;
    IBQRodeo.First;

    IBQPotrero.Close;
    IBQPotrero.ParamByName('id_establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQPotrero.Open;
    IBQPotrero.Last;
    IBQPotrero.First;

    IBQGrupos.Close;
    IBQGrupos.ParamByName('esta').AsInteger := Fprincipal.establecimientoActual;
    IBQGrupos.Open;
    IBQGrupos.Last;
    IBQGrupos.First;
  except
  end;
end;
procedure TFREPCMEvaluacionToros.CBRodeoClick(Sender: TObject);
begin
  inherited;
  DBLCBRodeo.Enabled:= CBRodeo.Checked;
  if (CBRodeo.Checked) then
    DBLCBRodeo.KeyValue:= 0;
  DBLCBRodeoCloseUp(nil);
end;

procedure TFREPCMEvaluacionToros.CBGrupoClick(Sender: TObject);
begin
  inherited;
  DBLCBASeleccionGrupo.Enabled:= CBGrupo.Checked;

  if (CBGrupo.Checked) then
    DBLCBASeleccionGrupo.KeyValue:= 0;
  DBLCBASeleccionGrupoCloseUp(nil);
end;

procedure TFREPCMEvaluacionToros.DBEAnimalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if(Length(DBEAnimal.Text) = DBEAnimal.MaxLength) and (key <> #8) then
    key:=#0;
end;

procedure TFREPCMEvaluacionToros.DBLCBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  if (CBPotrero.Checked) then
    where:= where + ' and potrero = :potrero'
   else
     where:= StringReplace(where,' and potrero = :potrero','',[rfReplaceAll]);
  //ActualizarConsulta();
end;

procedure TFREPCMEvaluacionToros.DBLCBPotreroKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not (Sender as TDBLookupComboBoxAuto).ListVisible then
    DBLCBPotreroCloseUp(Sender);
end;

procedure TFREPCMEvaluacionToros.DBLCBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if (CBRodeo.Checked) then
    where:= where + ' and rodeo = :rodeo'
   else
     where:= StringReplace(where,' and rodeo = :rodeo','',[rfReplaceAll]);
  //ActualizarConsulta();
end;

procedure TFREPCMEvaluacionToros.ActualizarConsulta;
var
  cartel : TCartel;
begin
  cartel := TCartel.getInstance();
  cartel.abrircartel('Generando Evaluación de Toros...');
  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add(select+where+order);
  if (CBPotrero.Checked) then
    begin
      if (DBLCBPotrero.KeyValue<> null) then
        IBQAnimales.ParamByName('potrero').AsInteger := DBLCBPotrero.KeyValue;
    end;

  if (CBRodeo.Checked) then
    begin
      if (DBLCBRodeo.KeyValue <> null) then
        IBQAnimales.ParamByName('rodeo').AsInteger := DBLCBRodeo.KeyValue;
    end;

  if (CBGrupo.Checked) then
    begin
      if (DBLCBASeleccionGrupo.KeyValue <> null) then
        IBQAnimales.ParamByName('grupo').AsInteger := DBLCBASeleccionGrupo.KeyValue
    end
   else
     IBQAnimales.ParamByName('grupo').Value := null;
  if (CBAnimal.Checked) then
    begin
     if (Length(DBEAnimal.Text) < 10) then
       IBQAnimales.ParamByName('rp').AsString := Trim(DBEAnimal.Text)+'%'
      else
        if (Length(DBEAnimal.Text) = 10) then
          IBQAnimales.ParamByName('rp').AsString := Trim(DBEAnimal.Text);
    end;
  IBQAnimales.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQAnimales.ParamByName('hasta').AsDate := DTPHasta.Date;
  IBQAnimales.ParamByName('esta').AsInteger := Fprincipal.EstablecimientoActual;
  IBQAnimales.Open;
  cartel.cerrarcartel;
  cartel.FreeInstance;
end;

procedure TFREPCMEvaluacionToros.InicializarSelect;
begin
  select:= 'select RET.*, TA.id_animal, TA.rodeo, TA.potrero' +
           ' from REP_Evaluacion_Toros(:esta,:grupo,:desde,:hasta) RET, tab_animales TA' +
           ' where RET.RP = TA.id_rp and ta.categoria=3' +
           ' and TA.establecimiento = :esta and TA.activo <> ''N''';
  where:= '';
  order:= ' order by rp asc';
end;

procedure TFREPCMEvaluacionToros.DBLCBRodeoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not (Sender as TDBLookupComboBoxAuto).ListVisible then
    DBLCBRodeoCloseUp(Sender);
end;

procedure TFREPCMEvaluacionToros.DBEAnimalChange(Sender: TObject);
begin
  inherited;
  if (CBAnimal.Checked) then
    where:= where + ' and (RP like :RP)'
   else
     where:= StringReplace(where,' and (RP like :RP)','',[rfReplaceAll]);
  //ActualizarConsulta();

end;

procedure TFREPCMEvaluacionToros.CBAnimalClick(Sender: TObject);
begin
  inherited;
  DBEAnimal.Enabled:= CBAnimal.Checked;

  if (CBAnimal.Checked) then
    begin
      DBEAnimal.Text:= '';
      DBEAnimal.SetFocus;
    end;  

  if (trim(DBEAnimal.Text) <> '') then
    DBEAnimalChange(nil);
end;

procedure TFREPCMEvaluacionToros.DBLCBASeleccionGrupoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not (Sender as TDBLookupComboBoxAuto).ListVisible then
    DBLCBASeleccionGrupoCloseUp(Sender);
end;

procedure TFREPCMEvaluacionToros.DBLCBASeleccionGrupoCloseUp(
  Sender: TObject);
begin
  inherited;
  if (DBLCBASeleccionGrupo.KeyValue <> null) then
   // ActualizarConsulta();
end;

procedure TFREPCMEvaluacionToros.FormCreate(Sender: TObject);
begin
  inherited;
  DTPDesde.Date := IncYear(Date,-1);
  DTPHasta.Date := Date;
end;

procedure TFREPCMEvaluacionToros.DTPDesdeChange(Sender: TObject);
begin
  inherited;
  //ActualizarConsulta;
end;

procedure TFREPCMEvaluacionToros.DTPHastaChange(Sender: TObject);
begin
  inherited;
 // ActualizarConsulta;
end;

procedure TFREPCMEvaluacionToros.Button1Click(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;



procedure TFREPCMEvaluacionToros.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

end.
