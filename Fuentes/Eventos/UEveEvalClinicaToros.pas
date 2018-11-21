unit UEveEvalClinicaToros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DBCtrls, UDBLookupComboBoxAuto,
  DateTimePickerAuto, DataExport, DataToXLS, WinXP, EditAuto, ImgList,
  PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage,
  jpeg, JvGIF, JvComponentBase, JvBalloonHint, JvExStdCtrls, JvGroupBox,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;


type
  TFEveEvalClinicaToros = class(TFEveSimple)
    DTPFechaEval: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DBLCBAResponsableEval: TDBLookupComboBoxAuto;
    GBExamenClinico: TJvGroupBox;
    GBCircunferenciaEscrotal: TJvGroupBox;
    GB1MuestreoToros: TJvGroupBox;
    GB2MuestreoToros: TJvGroupBox;
    GBSangrado: TJvGroupBox;
    GBTuberculinizacion: TJvGroupBox;
    DTPExamenClinico: TDateTimePicker;
    DTPCircunferencia: TDateTimePicker;
    DTP1Muestreo: TDateTimePicker;
    DTP2Muestreo: TDateTimePicker;
    DTPSangrado: TDateTimePicker;
    DTPTuberculina: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBLCBAMetodoExamenClinico: TDBLookupComboBoxAuto;
    DBLCBACausaExamenClinico: TDBLookupComboBoxAuto;
    DBLCBAResultExamenClinico: TDBLookupComboBoxAuto;
    LValor: TLabel;
    EACircunferenciaE: TEditAuto;
    Label6: TLabel;
    alos18meses: TCheckBox;
    DBLCBAResultado1Muestreo: TDBLookupComboBoxAuto;
    DBLCBAResultadoCampi1Muestreo: TDBLookupComboBoxAuto;
    DBLCBAResultadoTrico1Muestreo: TDBLookupComboBoxAuto;
    LResultadoTrico: TLabel;
    LResultadoCampi: TLabel;
    LResultado: TLabel;
    DBLCBAResultadoTrico2Muestreo: TDBLookupComboBoxAuto;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBLCBAResultadoCampi2Muestreo: TDBLookupComboBoxAuto;
    DBLCBAResultado2Muestreo: TDBLookupComboBoxAuto;
    Label10: TLabel;
    DBLCBAResultadoSangrado: TDBLookupComboBoxAuto;
    DBLCBAResultadoTuberculina: TDBLookupComboBoxAuto;
    Label11: TLabel;
    GBCapacidadServicio: TJvGroupBox;
    DTPCapacidadServicio: TDateTimePicker;
    GBCalidadSeminal: TJvGroupBox;
    DTPCalidadSeminal: TDateTimePicker;
    RB10: TRadioButton;
    RB20: TRadioButton;
    LMetodologia: TLabel;
    Label12: TLabel;
    DBLCBAValorCapServicio: TDBLookupComboBoxAuto;
    DBLCBATipoCapServicio: TDBLookupComboBoxAuto;
    LTipo: TLabel;
    DBLCBAResultadoCalidadSemen: TDBLookupComboBoxAuto;
    Label13: TLabel;
    LMetodoToma: TLabel;
    DBLCBAMetodoTomaCalidadSemen: TDBLookupComboBoxAuto;
    MObsExamenClinico: TMemo;
    MObs1Muestreo: TMemo;
    MObs2Muestreo: TMemo;
    MObsCircunferencia: TMemo;
    MObsSangrado: TMemo;
    MObsTuberculina: TMemo;
    MObsCalidadSeminal: TMemo;
    MObsCapacidadServicio: TMemo;
    IBQResult1Muestreo: TIBQuery;
    DSResult1Muestreo: TDataSource;
    IBQResult2Muestreo: TIBQuery;
    DSResult2Muestreo: TDataSource;
    IBQResultSangrado: TIBQuery;
    DSResultSangrado: TDataSource;
    IBQResultTuberculina: TIBQuery;
    DSResultTuberculina: TDataSource;
    IBQResultCalidadSemen: TIBQuery;
    DSResultCalidadSemen: TDataSource;
    IBQResultCapacidadServicio: TIBQuery;
    DSResultCapacidadServicio: TDataSource;
    IBQGenericosEspecial11: TIBQuery;
    DSGenericosEspecial11: TDataSource;
    IBQGenericosEspecial12: TIBQuery;
    DSGenericosEspecial12: TDataSource;
    DSGenericosEspecial21: TDataSource;
    IBQGenericosEspecial21: TIBQuery;
    DSGenericosEspecial22: TDataSource;
    IBQGenericosEspecial22: TIBQuery;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleD1: TDateField;
    IBDSSimpleD2: TDateField;
    IBDSSimpleD3: TDateField;
    IBDSSimpleD4: TDateField;
    IBDSSimpleD5: TDateField;
    IBDSSimpleD6: TDateField;
    IBDSSimpleD7: TDateField;
    IBDSSimpleD8: TDateField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleVUNO2: TIBStringField;
    IBDSSimpleV2: TIBStringField;
    IBDSSimpleI3: TIntegerField;
    IBDSSimpleV3: TIBStringField;
    IBDSSimpleVUNO4: TIBStringField;
    IBDSSimpleV4: TIBStringField;
    IBDSSimpleVUNO5: TIBStringField;
    IBDSSimpleV5: TIBStringField;
    IBDSSimpleVUNO6: TIBStringField;
    IBDSSimpleV6: TIBStringField;
    IBDSSimpleVUNO7: TIBStringField;
    IBDSSimpleV7: TIBStringField;
    IBDSSimpleVUNO8: TIBStringField;
    IBDSSimpleV8: TIBStringField;
    IBDSSimpleVUNO9: TIBStringField;
    IBDSSimpleV9: TIBStringField;
    IBDSSimpleVUNO10: TIBStringField;
    IBDSSimpleV10: TIBStringField;
    IBDSSimpleVUNO11: TIBStringField;
    IBDSSimpleV11: TIBStringField;
    IBDSSimpleI12: TIntegerField;
    IBDSSimpleV12: TIBStringField;
    IBDSSimpleVUNO13: TIBStringField;
    IBDSSimpleV13: TIBStringField;
    IBDSSimpleI14: TIntegerField;
    IBDSSimpleV14: TIBStringField;
    IBDSSimpleVUNO12: TIBStringField;
    IBDSSimpleV15: TIBStringField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleOBSERVACION1: TIBStringField;
    IBDSSimpleOBSERVACION2: TIBStringField;
    IBDSSimpleOBSERVACION3: TIBStringField;
    IBDSSimpleOBSERVACION4: TIBStringField;
    IBDSSimpleOBSERVACION5: TIBStringField;
    IBDSSimpleOBSERVACION6: TIBStringField;
    IBDSSimpleOBSERVACION7: TIBStringField;
    IBDSSimpleVUNO1: TIBStringField;
    IBDSSimpleVUNO14: TIBStringField;
    IBDSSimpleV16: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleNOMBRE: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleF1: TFloatField;
    GBCC: TJvGroupBox;
    Label14: TLabel;
    DTPCC: TDateTimePicker;
    MObsCC: TMemo;
    DBLCBACC: TDBLookupComboBoxAuto;
    IBQCC: TIBQuery;
    DSCC: TDataSource;
    IBDSSimpleI16: TIntegerField;
    IBDSSimpleV17: TIBStringField;
    IBDSSimpleOBSERVACION8: TIBStringField;
    IBDSSimpleD9: TDateField;
    IBQMetodoCapServ: TIBQuery;
    DSMetodoCapServ: TDataSource;
    CBCE: TCheckBox;
    CBExClinic: TCheckBox;
    CB1Muest: TCheckBox;
    CB2Muest: TCheckBox;
    CBSangrado: TCheckBox;
    CBTuberc: TCheckBox;
    CBCapServ: TCheckBox;
    CBCS: TCheckBox;
    CBCC: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDSSimpleV1SetText(Sender: TField; const Text: String);
    procedure CBCCClick(Sender: TObject);
    procedure CBCEClick(Sender: TObject);
    procedure CBExClinicClick(Sender: TObject);
    procedure CB1MuestClick(Sender: TObject);
    procedure CB2MuestClick(Sender: TObject);
    procedure CBSangradoClick(Sender: TObject);
    procedure CBTubercClick(Sender: TObject);
    procedure CBCapServClick(Sender: TObject);
    procedure CBCSClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    procedure CargarParametrosSP;override;
    procedure CargarParametrosRN;override;
    procedure CargarDatosGrilla;override;
    procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
  public
    { Public declarations }
  end;

var
  FEveEvalClinicaToros: TFEveEvalClinicaToros;

implementation

uses UDMSoftvet, UPrincipal, UEveUniversal, UClassType, UFunctions, DateUtils, UABMExamenesFertilidad,
     UAbmMetodosExamenSanitario;

{$R *.dfm}

procedure TFEveEvalClinicaToros.FormCreate(Sender: TObject);
begin
  inherited;

  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_hba, id_pc, id_otro, id_ie, fecha_nacimiento, nombre, apodo from VIS_REVISION_TOROS';

  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').AsString := 'AR';
  DMSoftvet.IBQCodigosGenericos.Open;
  IBQResult1Muestreo.Close;
  IBQResult1Muestreo.ParamByName('tipo').AsString := 'PN';
  IBQResult1Muestreo.Open;
  IBQResult2Muestreo.Close;
  IBQResult2Muestreo.ParamByName('tipo').AsString := 'PN';
  IBQResult2Muestreo.Open;
  IBQResultCalidadSemen.Close;
  IBQResultCalidadSemen.ParamByName('tipo').AsString := 'AR';
  IBQResultCalidadSemen.Open;
  IBQResultCapacidadServicio.Close;
  IBQResultCapacidadServicio.ParamByName('tipo').AsString := 'AR';
  IBQResultCapacidadServicio.Open;
  IBQResultSangrado.Close;
  IBQResultSangrado.ParamByName('tipo').AsString := 'PN';
  IBQResultSangrado.Open;
  IBQResultTuberculina.Close;
  IBQResultTuberculina.ParamByName('tipo').AsString := 'PN';
  IBQResultTuberculina.Open;

  IBQResult1Muestreo.Last;
  IBQResult1Muestreo.First;
  IBQResult2Muestreo.Last;
  IBQResult2Muestreo.First;
  IBQResultCalidadSemen.Last;
  IBQResultCalidadSemen.First;
  IBQResultCapacidadServicio.Last;
  IBQResultCapacidadServicio.First;
  IBQResultSangrado.Last;
  IBQResultSangrado.First;
  IBQResultTuberculina.Last;
  IBQResultTuberculina.First;

  IBQGenericosEspecial11.Close;
  IBQGenericosEspecial11.ParamByName('tipo').Value := 'PN';
  IBQGenericosEspecial11.Open;
  IBQGenericosEspecial12.Close;
  IBQGenericosEspecial12.ParamByName('tipo').Value := 'PN';
  IBQGenericosEspecial12.Open;
  IBQGenericosEspecial21.Close;
  IBQGenericosEspecial21.ParamByName('tipo').Value := 'PN';
  IBQGenericosEspecial21.Open;
  IBQGenericosEspecial22.Close;
  IBQGenericosEspecial22.ParamByName('tipo').Value := 'PN';
  IBQGenericosEspecial22.Open;
  IBQGenericosEspecial11.Last;
  IBQGenericosEspecial11.First;
  IBQGenericosEspecial12.Last;
  IBQGenericosEspecial12.First;
  IBQGenericosEspecial21.Last;
  IBQGenericosEspecial21.First;
  IBQGenericosEspecial22.Last;
  IBQGenericosEspecial22.First;

  IBQCC.Close;
  IBQCC.SQL.Clear;
  if FPrincipal.EscalaCondicionCorporal = 5 then
    IBQCC.SQL.Add('select valor_escala_5 as valor, id_condicion_corporal from cod_condiciones_corporales')
  else
    IBQCC.SQL.Add('select valor_escala_10 as valor, id_condicion_corporal from cod_condiciones_corporales');
  IBQCC.Open;
  IBQCC.Last;
  IBQCC.First;

  IBQMetodoCapServ.Close;
  IBQMetodoCapServ.Open;
  IBQMetodoCapServ.Last;
  IBQMetodoCapServ.Open;


end;

procedure TFEveEvalClinicaToros.FormShow(Sender: TObject);
begin
  inherited;
  MSimple.PasarParametros(1,6);//cambie codigo
  DTPFechaEval.Date := now;
  DTPExamenClinico.Date := now;
  DTPCircunferencia.Date := now;
  DTP1Muestreo.Date := now;
  DTP2Muestreo.Date := now;
  DTPSangrado.Date := now;
  DTPTuberculina.Date := now;
  DTPCalidadSeminal.Date := now;
  DTPCapacidadServicio.Date := now;
  DTPCC.Date := now;
  BDBGSimple.Columns[2].Visible := FPrincipal.FuncActividad;
  GBCalidadSeminal.Checked := false;
  GBCapacidadServicio.Checked := false;
  GB1MuestreoToros.Checked := false;
  GB2MuestreoToros.Checked := false;
  GBTuberculinizacion.Checked := false;
  GBCC.Checked := false;
  GBCircunferenciaEscrotal.Checked := false;
  GBExamenClinico.Checked := false;
  GBSangrado.Checked := false;
end;

procedure TFEveEvalClinicaToros.CargarParametrosSP;
var
  d : Double;
begin
 IBQSPEventoInd.ParamByName('FECHA').AsDate  := DTPFechaEval.Date;
 IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsableEval.KeyValue;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
 if GBExamenClinico.Checked then
  IBQSPEventoInd.ParamByName('HACE_EXAMEN').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_EXAMEN').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_EXAMEN').AsDate  := DTPExamenClinico.Date;
 IBQSPEventoInd.ParamByName('RESULTADO_EXAMEN').value  := DBLCBAResultExamenClinico.KeyValue;
 IBQSPEventoInd.ParamByName('METODO_EXAMEN').value  := DBLCBAMetodoExamenClinico.KeyValue;
 IBQSPEventoInd.ParamByName('CAUSA_EXAMEN').value  := DBLCBACausaExamenClinico.KeyValue;
 IBQSPEventoInd.ParamByName('OBS_EXAMEN').value  := MObsExamenClinico.Text;

 if GB1MuestreoToros.Checked then
  IBQSPEventoInd.ParamByName('HACE_MUESTREO_1').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_MUESTREO_1').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_MUESTREO_1').AsDate  := DTP1Muestreo.Date;
 IBQSPEventoInd.ParamByName('RESULTADO_RASPADO1').value  := DBLCBAResultado1Muestreo.KeyValue;
 IBQSPEventoInd.ParamByName('RESULTADOCAMPI1').value  := DBLCBAResultadoCampi1Muestreo.KeyValue;
 IBQSPEventoInd.ParamByName('RESULTADOTRICO1').value  := DBLCBAResultadoTrico1Muestreo.KeyValue;
 IBQSPEventoInd.ParamByName('OBS_MUESTREO1').value  := MObs1Muestreo.Text;

 if GB2MuestreoToros.Checked then
  IBQSPEventoInd.ParamByName('HACE_MUESTREO_2').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_MUESTREO_2').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_MUESTREO_2').AsDate  := DTP2Muestreo.Date;
 IBQSPEventoInd.ParamByName('RESULTADO_RASPADO2').value  := DBLCBAResultado2Muestreo.KeyValue;
 IBQSPEventoInd.ParamByName('RESULTADOCAMPI2').value  := DBLCBAResultadoCampi2Muestreo.KeyValue;
 IBQSPEventoInd.ParamByName('RESULTADOTRICO2').value  := DBLCBAResultadoTrico2Muestreo.KeyValue;
 IBQSPEventoInd.ParamByName('OBS_MUESTREO2').value  := MObs2Muestreo.Text;

 if GBCircunferenciaEscrotal.Checked then
  IBQSPEventoInd.ParamByName('HACE_CIRCUNFERENCIA').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_CIRCUNFERENCIA').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_CIRCUNFERENCIA').AsDate  := DTPCircunferencia.Date;
 d := 0;
 TryStrToFloat(EACircunferenciaE.Text,d);
 IBQSPEventoInd.ParamByName('VALOR_CIRCUNFERENCIA').value  := d;
 if alos18meses.Checked then
  IBQSPEventoInd.ParamByName('ALOS18MESES').value  := 'S'
 else
  IBQSPEventoInd.ParamByName('ALOS18MESES').value  := 'N';
 IBQSPEventoInd.ParamByName('OBS_CIRCUNFERENCIA').value  := MObsCircunferencia.Text;

 if GBSangrado.Checked then
  IBQSPEventoInd.ParamByName('HACE_SANGRADO').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_SANGRADO').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_SANGRADO').AsDate  := DTPSangrado.Date;
 IBQSPEventoInd.ParamByName('RESULTADO_SANGRADO').value  := DBLCBAResultadoSangrado.KeyValue;
 IBQSPEventoInd.ParamByName('OBS_SANGRADO').value  := MObsSangrado.Text;

 if GBTuberculinizacion.Checked then
  IBQSPEventoInd.ParamByName('HACE_TUBERCULINA').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_TUBERCULINA').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_TUBERCULINA').AsDate  := DTPTuberculina.Date;
 IBQSPEventoInd.ParamByName('RESULTADO_TUBERCULINA').value  := DBLCBAResultadoTuberculina.KeyValue;
 IBQSPEventoInd.ParamByName('OBS_TUBERCULINA').value  := MObsTuberculina.Text;

 if GBCalidadSeminal.Checked then
  IBQSPEventoInd.ParamByName('HACE_CALIDAD').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_CALIDAD').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_CALIDAD').AsDate  := DTPCalidadSeminal.Date;
 IBQSPEventoInd.ParamByName('RESULTADO_CALIDAD').value  := DBLCBAResultadoCalidadSemen.KeyValue;
 IBQSPEventoInd.ParamByName('ID_RESULTADO_CALIDAD').value  := null;
 IBQSPEventoInd.ParamByName('ID_METODO_TOMA').value  := DBLCBAMetodoTomaCalidadSemen.KeyValue;
 IBQSPEventoInd.ParamByName('OBS_CALIDAD').value  := MObsCalidadSeminal.Text;

 if GBCapacidadServicio.Checked then
  IBQSPEventoInd.ParamByName('HACE_CAPACIDAD').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_CAPACIDAD').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_CAPACIDAD').AsDate  := DTPCapacidadServicio.Date;
 if(RB10.Checked)then
  IBQSPEventoInd.ParamByName('METODO_CAPACIDAD').Value := 'D'
 else
  IBQSPEventoInd.ParamByName('METODO_CAPACIDAD').Value := 'V';
 IBQSPEventoInd.ParamByName('TIPO_CAPACIDAD').value  := DBLCBATipoCapServicio.KeyValue;
 IBQSPEventoInd.ParamByName('VALOR_CAPACIDAD').value  := DBLCBAValorCapServicio.KeyValue;
 IBQSPEventoInd.ParamByName('OBS_CAPACIDAD').value  := MObsCapacidadServicio.Text;

 if GBCC.Checked then
  IBQSPEventoInd.ParamByName('HACE_CC').Value := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_CC').Value := 'N';
 IBQSPEventoInd.ParamByName('FECHA_CC').AsDate := DTPCC.Date;
 IBQSPEventoInd.ParamByName('ID_CC').Value := DBLCBACC.KeyValue;
 IBQSPEventoInd.ParamByName('OBS_CC').Value := MObsCC.Text;

end;

procedure TFEveEvalClinicaToros.CargarParametrosRN;
begin
  if ModoEve = meIndividual then
    IBQSPRN.ParamByName('animal').Value := IDAnimal
  else
    IBQSPRN.ParamByName('animal').Value := IBDSSimple.FieldValues['id_animal'];
end;

procedure TFEveEvalClinicaToros.CargarDatosGrilla;
var
  valor : sTRING;
  d : Double;
begin
    IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    RealizarCambio(DBLCBAResponsableEval,[IBDSSimple.FieldByName('NOMBRE'),IBDSSimple.FieldByName('RESPONSABLE')],[DBLCBAResponsableEval.Text,DBLCBAResponsableEval.KeyValue]);

    RealizarCambio(DTPFechaEval,[IBDSSimple.FieldByName('FECHA')],[DTPFechaEval.Date]);
    RealizarCambio(DTP1Muestreo,[IBDSSimple.FieldByName('d2')],[DTP1Muestreo.Date]);
    RealizarCambio(DTP2Muestreo,[IBDSSimple.FieldByName('d3')],[DTP2Muestreo.Date]);
    RealizarCambio(DTPCalidadSeminal,[IBDSSimple.FieldByName('d7')],[DTPCalidadSeminal.Date]);
    RealizarCambio(DTPCapacidadServicio,[IBDSSimple.FieldByName('d8')],[DTPCapacidadServicio.Date]);
    RealizarCambio(DTPCircunferencia,[IBDSSimple.FieldByName('d4')],[DTPCircunferencia.Date]);
    RealizarCambio(DTPExamenClinico,[IBDSSimple.FieldByName('d1')],[DTPExamenClinico.Date]);
    RealizarCambio(DTPSangrado,[IBDSSimple.FieldByName('d5')],[DTPSangrado.Date]);
    RealizarCambio(DTPTuberculina,[IBDSSimple.FieldByName('d6')],[DTPTuberculina.Date]);
    RealizarCambio(DTPCC,[IBDSSimple.FieldByName('d9')],[DTPCC.Date]);

    RealizarCambio(DBLCBAMetodoExamenClinico,[IBDSSimple.FieldByName('v1'),IBDSSimple.FieldByName('i1')],[DBLCBAMetodoExamenClinico.Text,DBLCBAMetodoExamenClinico.KeyValue]);
    RealizarCambio(DBLCBACausaExamenClinico,[IBDSSimple.FieldByName('v3'),IBDSSimple.FieldByName('i3')],[DBLCBACausaExamenClinico.Text,DBLCBACausaExamenClinico.KeyValue]);
    RealizarCambio(DBLCBAResultExamenClinico,[IBDSSimple.FieldByName('v2'),IBDSSimple.FieldByName('vuno2')],[DBLCBAResultExamenClinico.Text,DBLCBAResultExamenClinico.KeyValue]);
    RealizarCambio(DBLCBAResultado1Muestreo,[IBDSSimple.FieldByName('v4'),IBDSSimple.FieldByName('vuno4')],[DBLCBAResultado1Muestreo.Text,DBLCBAResultado1Muestreo.KeyValue]);
    RealizarCambio(DBLCBAResultadoCampi1Muestreo,[IBDSSimple.FieldByName('v5'),IBDSSimple.FieldByName('vuno5')],[DBLCBAResultadoCampi1Muestreo.Text,DBLCBAResultadoCampi1Muestreo.KeyValue]);
    RealizarCambio(DBLCBAResultadoTrico1Muestreo,[IBDSSimple.FieldByName('v6'),IBDSSimple.FieldByName('vuno6')],[DBLCBAResultadoTrico1Muestreo.Text,DBLCBAResultadoTrico1Muestreo.KeyValue]);
    RealizarCambio(DBLCBAResultado2Muestreo,[IBDSSimple.FieldByName('v7'),IBDSSimple.FieldByName('vuno7')],[DBLCBAResultado2Muestreo.Text,DBLCBAResultado2Muestreo.KeyValue]);
    RealizarCambio(DBLCBAResultadoCampi2Muestreo,[IBDSSimple.FieldByName('v8'),IBDSSimple.FieldByName('vuno8')],[DBLCBAResultadoCampi2Muestreo.Text,DBLCBAResultadoCampi2Muestreo.KeyValue]);
    RealizarCambio(DBLCBAResultadoTrico2Muestreo,[IBDSSimple.FieldByName('v9'),IBDSSimple.FieldByName('vuno9')],[DBLCBAResultadoTrico2Muestreo.Text,DBLCBAResultadoTrico2Muestreo.KeyValue]);
    RealizarCambio(DBLCBAResultadoSangrado,[IBDSSimple.FieldByName('v10'),IBDSSimple.FieldByName('vuno10')],[DBLCBAResultadoSangrado.Text,DBLCBAResultadoSangrado.KeyValue]);
    RealizarCambio(DBLCBAResultadoTuberculina,[IBDSSimple.FieldByName('v11'),IBDSSimple.FieldByName('vuno11')],[DBLCBAResultadoTuberculina.Text,DBLCBAResultadoTuberculina.KeyValue]);
    RealizarCambio(DBLCBAValorCapServicio,[IBDSSimple.FieldByName('v12'),IBDSSimple.FieldByName('i12')],[DBLCBAValorCapServicio.Text,DBLCBAValorCapServicio.KeyValue]);
    RealizarCambio(DBLCBATipoCapServicio,[IBDSSimple.FieldByName('v13'),IBDSSimple.FieldByName('vuno13')],[DBLCBATipoCapServicio.Text,DBLCBATipoCapServicio.KeyValue]);
    RealizarCambio(DBLCBAMetodoTomaCalidadSemen,[IBDSSimple.FieldByName('v14'),IBDSSimple.FieldByName('i14')],[DBLCBAMetodoTomaCalidadSemen.Text,DBLCBAMetodoTomaCalidadSemen.KeyValue]);
    RealizarCambio(DBLCBAResultadoCalidadSemen,[IBDSSimple.FieldByName('v15'),IBDSSimple.FieldByName('vuno12')],[DBLCBAResultadoCalidadSemen.Text,DBLCBAResultadoCalidadSemen.KeyValue]);
    RealizarCambio(DBLCBACC,[IBDSSimple.FieldByName('v17'),IBDSSimple.FieldByName('i16')],[DBLCBACC.Text,DBLCBACC.KeyValue]);

    RealizarCambio(MObsExamenClinico,[IBDSSimple.FieldByName('observacion')],[MObsExamenClinico.Text]);
    RealizarCambio(MObs1Muestreo,[IBDSSimple.FieldByName('observacion1')],[MObs1Muestreo.Text]);
    RealizarCambio(MObs2Muestreo,[IBDSSimple.FieldByName('observacion2')],[MObs2Muestreo.Text]);
    RealizarCambio(MObsCircunferencia,[IBDSSimple.FieldByName('observacion3')],[MObsCircunferencia.Text]);
    RealizarCambio(MObsSangrado,[IBDSSimple.FieldByName('observacion4')],[MObsSangrado.Text]);
    RealizarCambio(MObsTuberculina,[IBDSSimple.FieldByName('observacion5')],[MObsTuberculina.Text]);
    RealizarCambio(MObsCapacidadServicio,[IBDSSimple.FieldByName('observacion6')],[MObsCapacidadServicio.Text]);
    RealizarCambio(MObsCalidadSeminal,[IBDSSimple.FieldByName('observacion7')],[MObsCalidadSeminal.Text]);
    RealizarCambio(MObsCC,[IBDSSimple.FieldByName('observacion8')],[MObsCC.Text]);

    d := 0;
    TryStrToFloat(EACircunferenciaE.Text,d);
    RealizarCambio(EACircunferenciaE,[IBDSSimple.FieldByName('f1')],[d]);

    if(RB10.Checked)then
    begin
     IBQValidaciones.SQL.Clear;
     IBQValidaciones.SQL.Add('select id_codigo, valor from cod_genericos where ((tipo = ''DV'') and (valor =''DIEZ MINUTOS''))');
     IBQValidaciones.Open;
    end
    else
    begin
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select id_codigo, valor from cod_genericos where ((tipo = ''DV'') and (valor =''VEINTE MINUTOS''))');
      IBQValidaciones.Open;
    end;

    RealizarCambio(RB10,[IBDSSimple.FieldByName('v16'),IBDSSimple.FieldByName('vuno14')],[IBQValidaciones.FieldByName('valor').AsString,IBQValidaciones.FieldByName('id_codigo').AsString]);
    RealizarCambio(RB20,[IBDSSimple.FieldByName('v16'),IBDSSimple.FieldByName('vuno14')],[IBQValidaciones.FieldByName('valor').AsString,IBQValidaciones.FieldByName('id_codigo').AsString]);

    if (alos18meses.Checked) then
      valor := 'S'
    else
      valor := 'N';
      
    RealizarCambio(ALOS18MESES,[IBDSSimple.FieldByName('vuno1')],[valor])
end;

procedure TFEveEvalClinicaToros.CargarParametrosMasivo;
var
  d : Double;
begin
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
   IBQSPEventoInd.ParamByName('FECHA').AsDate  := IBDSSimple.FieldValues['Fecha'];
 IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['id_animal'];
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').Value := IBDSSimple.FieldValues['responsable'];
 IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
 if GBExamenClinico.Checked then
  IBQSPEventoInd.ParamByName('HACE_EXAMEN').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_EXAMEN').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_EXAMEN').AsDate  := IBDSSimple.FieldValues['d1'];
 IBQSPEventoInd.ParamByName('RESULTADO_EXAMEN').value  := IBDSSimple.FieldValues['vuno2'];
 IBQSPEventoInd.ParamByName('METODO_EXAMEN').value  := IBDSSimple.FieldValues['i1'];
 IBQSPEventoInd.ParamByName('CAUSA_EXAMEN').value  := IBDSSimple.FieldValues['i3'];
 IBQSPEventoInd.ParamByName('OBS_EXAMEN').value  := IBDSSimple.FieldValues['observacion'];

 if GB1MuestreoToros.Checked then
  IBQSPEventoInd.ParamByName('HACE_MUESTREO_1').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_MUESTREO_1').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_MUESTREO_1').AsDate  := IBDSSimple.FieldValues['d2'];
 IBQSPEventoInd.ParamByName('RESULTADO_RASPADO1').value  := IBDSSimple.FieldValues['vuno4'];
 IBQSPEventoInd.ParamByName('RESULTADOCAMPI1').value  := IBDSSimple.FieldValues['vuno5'];
 IBQSPEventoInd.ParamByName('RESULTADOTRICO1').value  := IBDSSimple.FieldValues['vuno6'];
 IBQSPEventoInd.ParamByName('OBS_MUESTREO1').value  := IBDSSimple.FieldValues['observacion1'];

 if GB2MuestreoToros.Checked then
  IBQSPEventoInd.ParamByName('HACE_MUESTREO_2').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_MUESTREO_2').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_MUESTREO_2').AsDate  := IBDSSimple.FieldValues['d3'];
 IBQSPEventoInd.ParamByName('RESULTADO_RASPADO2').value  := IBDSSimple.FieldValues['vuno7'];
 IBQSPEventoInd.ParamByName('RESULTADOCAMPI2').value  := IBDSSimple.FieldValues['vuno8'];
 IBQSPEventoInd.ParamByName('RESULTADOTRICO2').value  := IBDSSimple.FieldValues['vuno9'];
 IBQSPEventoInd.ParamByName('OBS_MUESTREO2').value  := IBDSSimple.FieldValues['observacion2'];

 if GBCircunferenciaEscrotal.Checked then
  IBQSPEventoInd.ParamByName('HACE_CIRCUNFERENCIA').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_CIRCUNFERENCIA').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_CIRCUNFERENCIA').AsDate  := IBDSSimple.FieldValues['d4'];
 d := 0;
 if IBDSSimple.FieldValues['f1'] <> null then
  TryStrToFloat(IBDSSimple.FieldValues['f1'],d);
 IBQSPEventoInd.ParamByName('VALOR_CIRCUNFERENCIA').value  := d;
 IBQSPEventoInd.ParamByName('ALOS18MESES').value  := IBDSSimple.FieldValues['vuno1'];
 IBQSPEventoInd.ParamByName('OBS_CIRCUNFERENCIA').value  := IBDSSimple.FieldValues['observacion3'];

 if GBSangrado.Checked then
  IBQSPEventoInd.ParamByName('HACE_SANGRADO').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_SANGRADO').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_SANGRADO').AsDate  := IBDSSimple.FieldValues['d5'];
 IBQSPEventoInd.ParamByName('RESULTADO_SANGRADO').value  := IBDSSimple.FieldValues['vuno10'];
 IBQSPEventoInd.ParamByName('OBS_SANGRADO').value  := IBDSSimple.FieldValues['observacion4'];

 if GBTuberculinizacion.Checked then
  IBQSPEventoInd.ParamByName('HACE_TUBERCULINA').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_TUBERCULINA').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_TUBERCULINA').AsDate  := IBDSSimple.FieldValues['d6'];
 IBQSPEventoInd.ParamByName('RESULTADO_TUBERCULINA').value  := IBDSSimple.FieldValues['vuno11'];
 IBQSPEventoInd.ParamByName('OBS_TUBERCULINA').value  := IBDSSimple.FieldValues['observacion5'];

 if GBCalidadSeminal.Checked then
  IBQSPEventoInd.ParamByName('HACE_CALIDAD').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_CALIDAD').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_CALIDAD').AsDate  := IBDSSimple.FieldValues['d7'];
 IBQSPEventoInd.ParamByName('RESULTADO_CALIDAD').value  := IBDSSimple.FieldValues['vuno12'];
 IBQSPEventoInd.ParamByName('ID_RESULTADO_CALIDAD').value  := null;
 IBQSPEventoInd.ParamByName('ID_METODO_TOMA').value  := IBDSSimple.FieldValues['i14'];
 IBQSPEventoInd.ParamByName('OBS_CALIDAD').value  := IBDSSimple.FieldValues['observacion7'];

 if GBCapacidadServicio.Checked then
  IBQSPEventoInd.ParamByName('HACE_CAPACIDAD').VALUE  := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_CAPACIDAD').VALUE  := 'N';
 IBQSPEventoInd.ParamByName('FECHA_CAPACIDAD').AsDate  := IBDSSimple.FieldValues['d8'];
 IBQSPEventoInd.ParamByName('METODO_CAPACIDAD').Value := IBDSSimple.FieldValues['vuno14'];
 IBQSPEventoInd.ParamByName('TIPO_CAPACIDAD').value  := IBDSSimple.FieldValues['vuno13'];
 IBQSPEventoInd.ParamByName('VALOR_CAPACIDAD').value  := IBDSSimple.FieldValues['i12'];
 IBQSPEventoInd.ParamByName('OBS_CAPACIDAD').value  := IBDSSimple.FieldValues['observacion6'];

 if GBCC.Checked then
  IBQSPEventoInd.ParamByName('HACE_CC').Value := 'S'
 else
  IBQSPEventoInd.ParamByName('HACE_CC').Value := 'N';
 IBQSPEventoInd.ParamByName('FECHA_CC').AsDate := IBDSSimple.FieldValues['d9'];
 IBQSPEventoInd.ParamByName('ID_CC').Value := IBDSSimple.FieldValues['i16'];
 IBQSPEventoInd.ParamByName('OBS_CC').Value := IBDSSimple.FieldValues['observacion8'];

end;

procedure TFEveEvalClinicaToros.LoadSQLStringList;
begin
  SQLStringList.AddObject('NOMBRE',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('V1',TObject(DMSoftvet.DSExamenSanitario));
  SQLStringList.AddObject('V2',TObject(DMSoftvet.DSCodigosGenericos));
  SQLStringList.AddObject('V3',TObject(DMSoftvet.DSExamenClinico));
  SQLStringList.AddObject('V4',TObject(DSResult1Muestreo));
  SQLStringList.AddObject('V5',TObject(DSGenericosEspecial11));
  SQLStringList.AddObject('V6',TObject(DSGenericosEspecial12));
  SQLStringList.AddObject('V7',TObject(DSResult2Muestreo));
  SQLStringList.AddObject('V8',TObject(DSGenericosEspecial21));
  SQLStringList.AddObject('V9',TObject(DSGenericosEspecial22));
  SQLStringList.AddObject('V10',TObject(DSResultSangrado));
  SQLStringList.AddObject('V11',TObject(DSResultTuberculina));
  SQLStringList.AddObject('V12',TObject(DMSoftvet.DSValorCapacidad));
  SQLStringList.AddObject('V13',TObject(DSResultCapacidadServicio));
  SQLStringList.AddObject('V14',TObject(DMSoftvet.DSMetodo));
  SQLStringList.AddObject('V15',TObject(DSResultCalidadSemen));
  SQLStringList.AddObject('V17',TObject(DSCC));
  SQLStringList.AddObject('V16',TObject(DSMetodoCapServ));
end;


procedure TFEveEvalClinicaToros.cargarDatos(i:integer);
begin
end;


procedure TFEveEvalClinicaToros.IBDSSimpleV1SetText(Sender: TField;
  const Text: String);
var PickPos: integer;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
   begin
     SetText(sender,Text);
     if Sender.FieldName = 'V1' then  //Metodo Examen Clinico
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_METODO_EXAMEN, NOMBRE as valor from COD_METODOS_EXAMEN_SANITARIO where (nombre like '''+UpperCase(Text)+'''||''%'')or (sinonimo like '''+UpperCase(Text)+'%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v1').PickList.IndexOf(BDBGSimple.ColumnByField('v1').Field.AsString);
          IBDSSimpleI1.AsInteger :=  TClassType(BDBGSimple.ColumnByField('v1').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V2' then   //Result Examen Clinico
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''AR'') and (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v2').PickList.IndexOf(BDBGSimple.ColumnByField('v2').Field.AsString);
          IBDSSimpleVUNO2.AsString :=  TClassType(BDBGSimple.ColumnByField('v2').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V3' then   //Causa Examen Clinico
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_EXAMEN_CLINICO, NOMBRE as valor from COD_EXAMENES_FERTILIDAD where (nombre like '''+UpperCase(Text)+'''||''%'')or (sinonimo like '''+UpperCase(Text)+'%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v3').PickList.IndexOf(BDBGSimple.ColumnByField('v3').Field.AsString);
          IBDSSimpleI3.AsInteger :=  TClassType(BDBGSimple.ColumnByField('v3').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V4' then   //Result 1 Muestreo
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''PN'') and (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v4').PickList.IndexOf(BDBGSimple.ColumnByField('v4').Field.AsString);
          IBDSSimpleVUNO4.AsString :=  TClassType(BDBGSimple.ColumnByField('v4').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V5' then   //Result 1 Campi
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''PN'') and (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v5').PickList.IndexOf(BDBGSimple.ColumnByField('v5').Field.AsString);
          IBDSSimpleVUNO5.AsString :=  TClassType(BDBGSimple.ColumnByField('v5').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V6' then   //Result 1 Trico
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''PN'') and (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v6').PickList.IndexOf(BDBGSimple.ColumnByField('v6').Field.AsString);
          IBDSSimpleVUNO6.AsString :=  TClassType(BDBGSimple.ColumnByField('v6').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V7' then   //Result 2 Muestreo
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''PN'') and (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v7').PickList.IndexOf(BDBGSimple.ColumnByField('v7').Field.AsString);
          IBDSSimpleVUNO7.AsString :=  TClassType(BDBGSimple.ColumnByField('v7').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V8' then   //Result 2 Campi
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''PN'') and (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v8').PickList.IndexOf(BDBGSimple.ColumnByField('v8').Field.AsString);
          IBDSSimpleVUNO8.AsString :=  TClassType(BDBGSimple.ColumnByField('v8').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V9' then   //Result 2 Trico
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''PN'') and (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v9').PickList.IndexOf(BDBGSimple.ColumnByField('v9').Field.AsString);
          IBDSSimpleVUNO9.AsString :=  TClassType(BDBGSimple.ColumnByField('v9').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V10' then   //Result Sangrado
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''PN'') and (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v10').PickList.IndexOf(BDBGSimple.ColumnByField('v10').Field.AsString);
          IBDSSimpleVUNO10.AsString :=  TClassType(BDBGSimple.ColumnByField('v10').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V11' then   //Result Tuberc
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''PN'') and (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v11').PickList.IndexOf(BDBGSimple.ColumnByField('v11').Field.AsString);
          IBDSSimpleVUNO11.AsString :=  TClassType(BDBGSimple.ColumnByField('v11').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V12' then   //Valor Cap Serv
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_VALOR_CAPACIDAD, NOMBRE as valor from COD_VALORES_CAPACIDAD where (nombre like '''+UpperCase(Text)+'''||''%'') or (sinonimo like '''+UpperCase(Text)+'%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v12').PickList.IndexOf(BDBGSimple.ColumnByField('v12').Field.AsString);
          IBDSSimpleI12.AsInteger :=  TClassType(BDBGSimple.ColumnByField('v12').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V13' then   //Result Cap Serv
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''AR'') and (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v13').PickList.IndexOf(BDBGSimple.ColumnByField('v13').Field.AsString);
          IBDSSimpleVUNO13.AsString :=  TClassType(BDBGSimple.ColumnByField('v13').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V14' then   //Metodo Toma  CS
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_METODO_TOMA, NOMBRE as valor from COD_METODOS_TOMA_PRUEBA where (nombre like '''+UpperCase(Text)+'''||''%'')or (sinonimo like '''+UpperCase(Text)+'%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v14').PickList.IndexOf(BDBGSimple.ColumnByField('v14').Field.AsString);
          IBDSSimpleI14.AsInteger :=  TClassType(BDBGSimple.ColumnByField('v14').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V15' then   //Result CS
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = ''AR'') where (valor like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v15').PickList.IndexOf(BDBGSimple.ColumnByField('v15').Field.AsString);
          IBDSSimpleVUNO12.AsString :=  TClassType(BDBGSimple.ColumnByField('v15').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V17' then   //CC
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        if FPrincipal.EscalaCondicionCorporal = 5 then
          IBQValidaciones.SQL.Add('select valor_escala_5 as valor, id_condicion_corporal from cod_condiciones_corporales where (valor_escala_5 like '''+UpperCase(Text)+'''||''%'')')
        else
          IBQValidaciones.SQL.Add('select valor_escala_10 as valor, id_condicion_corporal from cod_condiciones_corporales where (valor_escala_10 like '''+UpperCase(Text)+'''||''%'')');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v17').PickList.IndexOf(BDBGSimple.ColumnByField('v17').Field.AsString);
          IBDSSimpleI16.AsInteger :=  TClassType(BDBGSimple.ColumnByField('v17').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

     if Sender.FieldName = 'V16' then   //Metodo Cap Serv
     begin
      if Text <> '' then
      begin
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Add('select id_codigo, valor from cod_genericos where ((tipo = ''DV'') and (valor like '''+UpperCase(Text)+'''||''%''))');
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('v16').PickList.IndexOf(BDBGSimple.ColumnByField('v16').Field.AsString);
          IBDSSimpleVUNO14.AsString :=  TClassType(BDBGSimple.ColumnByField('v16').PickList.Objects[PickPos]).getValue;
        end;
      end;
     end;

  end;
end;

procedure TFEveEvalClinicaToros.CBCCClick(Sender: TObject);
begin
  inherited;
  GBCC.Checked := CBCC.Checked;
  BDBGSimple.Columns[2].Visible := GBCC.Checked;
  BDBGSimple.Columns[4].Visible := GBCC.Checked;
end;

procedure TFEveEvalClinicaToros.CBCEClick(Sender: TObject);
begin
  inherited;
  GBCircunferenciaEscrotal.Checked := CBCE.Checked;
  BDBGSimple.Columns[6].Visible := GBCircunferenciaEscrotal.Checked;
  BDBGSimple.Columns[9].Visible := GBCircunferenciaEscrotal.Checked;
end;

procedure TFEveEvalClinicaToros.CBExClinicClick(Sender: TObject);
begin
  inherited;
  GBExamenClinico.Checked := CBExClinic.Checked;
  BDBGSimple.Columns[11].Visible := GBExamenClinico.Checked;
  BDBGSimple.Columns[13].Visible := GBExamenClinico.Checked;
  BDBGSimple.Columns[14].Visible := GBExamenClinico.Checked;
  BDBGSimple.Columns[15].Visible := GBExamenClinico.Checked;
  BDBGSimple.Columns[16].Visible := GBExamenClinico.Checked;
end;

procedure TFEveEvalClinicaToros.CB1MuestClick(Sender: TObject);
begin
  inherited;
  GB1MuestreoToros.Checked := CB1Muest.Checked;
  BDBGSimple.Columns[17].Visible := GB1MuestreoToros.Checked;
  BDBGSimple.Columns[19].Visible := GB1MuestreoToros.Checked;
  BDBGSimple.Columns[20].Visible := GB1MuestreoToros.Checked;
  BDBGSimple.Columns[21].Visible := GB1MuestreoToros.Checked;
end;

procedure TFEveEvalClinicaToros.CB2MuestClick(Sender: TObject);
begin
  inherited;
  GB2MuestreoToros.Checked := CB2Muest.Checked;
  BDBGSimple.Columns[23].Visible := GB2MuestreoToros.Checked;
  BDBGSimple.Columns[25].Visible := GB2MuestreoToros.Checked;
  BDBGSimple.Columns[26].Visible := GB2MuestreoToros.Checked;
  BDBGSimple.Columns[27].Visible := GB2MuestreoToros.Checked;
end;

procedure TFEveEvalClinicaToros.CBSangradoClick(Sender: TObject);
begin
  inherited;
  GBSangrado.Checked := CBSangrado.Checked;
  BDBGSimple.Columns[29].Visible := GBSangrado.Checked;
  BDBGSimple.Columns[31].Visible := GBSangrado.Checked;
end;

procedure TFEveEvalClinicaToros.CBTubercClick(Sender: TObject);
begin
  inherited;
  GBTuberculinizacion.Checked := CBTuberc.Checked;
  BDBGSimple.Columns[33].Visible := GBTuberculinizacion.Checked;
  BDBGSimple.Columns[35].Visible := GBTuberculinizacion.Checked;
end;

procedure TFEveEvalClinicaToros.CBCapServClick(Sender: TObject);
begin
  inherited;
  GBCapacidadServicio.Checked := CBCapServ.Checked;
  BDBGSimple.Columns[37].Visible := GBCapacidadServicio.Checked;
  BDBGSimple.Columns[39].Visible := GBCapacidadServicio.Checked;
  BDBGSimple.Columns[40].Visible := GBCapacidadServicio.Checked;
  BDBGSimple.Columns[41].Visible := GBCapacidadServicio.Checked;
  BDBGSimple.Columns[42].Visible := GBCapacidadServicio.Checked;
end;

procedure TFEveEvalClinicaToros.CBCSClick(Sender: TObject);
begin
  inherited;
  GBCalidadSeminal.Checked := CBCS.Checked;
  BDBGSimple.Columns[43].Visible := GBCalidadSeminal.Checked;
  BDBGSimple.Columns[45].Visible := GBCalidadSeminal.Checked;
  BDBGSimple.Columns[46].Visible := GBCalidadSeminal.Checked;
end;

procedure TFEveEvalClinicaToros.Label4Click(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AbrirFormNormal(TFABMExamenesFertilidad.Create(self));
    DMSoftvet.IBQExamenClinico.Close;
    DMSoftvet.IBQExamenClinico.Open;
  end;
  cambiarCB(DBLCBACausaExamenClinico,nroID);
end;

procedure TFEveEvalClinicaToros.Label3Click(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AbrirFormNormal(TFABMMetodosExamenSanitario.Create(self));
    DMSoftvet.IBQExamenSanitario.Close;
    DMSoftvet.IBQExamenSanitario.Open;
  end;
  cambiarCB(DBLCBAMetodoExamenClinico,nroID);
end;

end.
