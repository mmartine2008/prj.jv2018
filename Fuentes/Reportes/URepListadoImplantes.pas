unit URepListadoImplantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  DateTimePickerAuto, DBCtrls, UDBLookupComboBoxAuto, ComboBoxAuto, Buttons,
  Grids, DBGrids, UBDBGrid, DateUtils, PngImage, jpeg, JvGIF, JvExControls,
  JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFRepListadoImplantes = class(TFUniversal)
    POpciones: TPanel;
    RGTipo: TRadioGroup;
    GBGrupos: TGroupBox;
    Label1: TLabel;
    DBLCBAGrupos: TDBLookupComboBoxAuto;
    GBFechas: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    PDatos: TPanel;
    GroupBox2: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    IBQListadoImplantes: TIBQuery;
    DSListadoImplantes: TDataSource;
    Panel1: TPanel;
    IBQGrupos: TIBQuery;
    IBQGruposID_GRUPO: TIntegerField;
    IBQGruposNOMBRE: TIBStringField;
    DSGrupos: TDataSource;
    IBQListadoImplantesID_RECEPTORA: TIntegerField;
    IBQListadoImplantesRP_RECEPTORA: TIBStringField;
    IBQListadoImplantesCATEGORIA_RECEPTORA: TIBStringField;
    IBQListadoImplantesRAZA_RECEPTORA: TIBStringField;
    IBQListadoImplantesFECHA_IMPLANTE: TDateField;
    IBQListadoImplantesFECHA_COLECTA: TDateField;
    IBQListadoImplantesCENTRO_TRANSPLANTE: TIBStringField;
    IBQListadoImplantesID_DONANTE: TIntegerField;
    IBQListadoImplantesMINT: TIBStringField;
    IBQListadoImplantesRP_DONANTE: TIBStringField;
    IBQListadoImplantesHBA_DONANTE: TIBStringField;
    IBQListadoImplantesNOMBRE_DONANTE: TIBStringField;
    IBQListadoImplantesID_PADRE_1: TIntegerField;
    IBQListadoImplantesEXT1: TIBStringField;
    IBQListadoImplantesRP_PADRE_1: TIBStringField;
    IBQListadoImplantesHBA_PADRE_1: TIBStringField;
    IBQListadoImplantesNOMBRE_PADRE_1: TIBStringField;
    IBQListadoImplantesID_PADRE_2: TIntegerField;
    IBQListadoImplantesEXT2: TIBStringField;
    IBQListadoImplantesRP_PADRE_2: TIBStringField;
    IBQListadoImplantesHBA_PADRE_2: TIBStringField;
    IBQListadoImplantesNOMBRE_PADRE_2: TIBStringField;
    IBQListadoImplantesFECHA_TACTO: TDateField;
    IBQListadoImplantesDIAG_GESTACION: TIBStringField;
    IBQListadoImplantesDIAS_GESTACION_TACTO: TIntegerField;
    IBQListadoImplantesDIAS_GESTACION_ACTUAL: TIntegerField;
    IBQListadoImplantesEST_REP: TIntegerField;
    IBQListadoImplantesFECHA_PARTO: TDateField;
    IBQListadoImplantesFECHA_PROB_PARTO: TDateField;
    IBQListadoImplantesRP_CRIA_1: TIBStringField;
    IBQListadoImplantesHBA_CRIA_1: TIBStringField;
    IBQListadoImplantesNOMBRE_CRIA_1: TIBStringField;
    IBQListadoImplantesSEXO_1: TIBStringField;
    IBQListadoImplantesRP_CRIA_2: TIBStringField;
    IBQListadoImplantesHBA_CRIA_2: TIBStringField;
    IBQListadoImplantesNOMBRE_CRIA_2: TIBStringField;
    IBQListadoImplantesSEXO_2: TIBStringField;
    IBQListadoImplantesRP_CRIA_3: TIBStringField;
    IBQListadoImplantesHBA_CRIA_3: TIBStringField;
    IBQListadoImplantesNOMBRE_CRIA_3: TIBStringField;
    IBQListadoImplantesSEXO_3: TIBStringField;
    IBQEstabAnimalExt: TIBQuery;
    GBFiltros: TGroupBox;
    CBReceptora: TCheckBox;
    CBDonante: TCheckBox;
    CBPadre: TCheckBox;
    CBRodeo: TCheckBox;
    DBLCBAReceptoras: TDBLookupComboBoxAuto;
    DBLCBADonantes: TDBLookupComboBoxAuto;
    DBLCBAPadres: TDBLookupComboBoxAuto;
    DSPadres: TDataSource;
    IBQPadres: TIBQuery;
    IBQPadresID: TIntegerField;
    IBQPadresID_RP: TIBStringField;
    IBQPadresNOMBRE: TIBStringField;
    IBQPadresID_HBA: TIBStringField;
    IBQPadresEXTERNO: TIBStringField;
    IBQMadres: TIBQuery;
    IBQMadresID: TIntegerField;
    IBQMadresID_RP: TIBStringField;
    IBQMadresNOMBRE: TIBStringField;
    IBQMadresID_HBA: TIBStringField;
    IBQMadresINTERNA: TIBStringField;
    DSMadres: TDataSource;
    IBQReceptoras: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    DSReceptoras: TDataSource;
    IBQMadresNOM: TStringField;
    IBQPadresNOM: TStringField;
    IBQReceptorasNOM: TStringField;
    CBDG: TComboBox;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    DBLCBAPotreros: TDBLookupComboBoxAuto;
    CBDiagGesta: TCheckBox;
    CBPotrero: TCheckBox;
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
    procedure BBSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure DBLCBAGruposCloseUp(Sender: TObject);
    procedure DBLCBARodeosCloseUp(Sender: TObject);
    procedure DBLCBAPotrerosCloseUp(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure IBQListadoImplantesAfterOpen(DataSet: TDataSet);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQGruposAfterOpen(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure IBQMadresCalcFields(DataSet: TDataSet);
    procedure IBQPadresCalcFields(DataSet: TDataSet);
    procedure IBQReceptorasCalcFields(DataSet: TDataSet);
    procedure IBQAfterOpen(DataSet: TDataSet);
    procedure DBLCBAReceptorasCloseUp(Sender: TObject);
    procedure DBLCBADonantesCloseUp(Sender: TObject);
    procedure DBLCBAPadresCloseUp(Sender: TObject);
    procedure CBReceptoraClick(Sender: TObject);
    procedure CBDonanteClick(Sender: TObject);
    procedure CBPadreClick(Sender: TObject);
    procedure IBQListadoImplantesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure CBDiagGestaClick(Sender: TObject);
    procedure CBDGCloseUp(Sender: TObject);
    procedure CBRodeoClick(Sender: TObject);
    procedure CBPotreroClick(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    potrero, rodeo, grupo, receptora, donante, padre, dg : Variant;
    por_fecha : Boolean;
    procedure ActConsulta();
    procedure AccederFichaPadres(ID : Integer; Externo : String);
  public
    { Public declarations }
  end;

var
  FRepListadoImplantes: TFRepListadoImplantes;

implementation

uses
  UPrincipal, UDMSoftvet, URepListadoImplantesPreview, UCartel,
  UREPFichaAnimal, UABMPadresExternos, IBDButtonABM, UABMSimple;

{$R *.dfm}

procedure TFRepListadoImplantes.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFRepListadoImplantes.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  DMSoftvet.IBQRodeo.First;
  if (DBLCBARodeos.KeyValue = NULL) then
    DBLCBARodeos.KeyValue := DMSoftvet.IBQRodeo.FieldValues['ID_RODEO'];

  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  DMSoftvet.IBQPotrero.First;
  if (DBLCBAPotreros.KeyValue = NULL) then
    DBLCBAPotreros.KeyValue := DMSoftvet.IBQPotrero.FieldValues['ID_POTRERO'];

  IBQGrupos.Close;
  IBQGrupos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGrupos.Open;
  IBQGrupos.First;
  if (DBLCBAGrupos.KeyValue = NULL) then
    DBLCBAGrupos.KeyValue := IBQGrupos.FieldValues['ID_GRUPO'];

  IBQMadres.Close;
  IBQMadres.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQMadres.Open;
  IBQMadres.First;
  if (DBLCBADonantes.KeyValue = NULL) then
    DBLCBADonantes.KeyValue := IBQMadres.FieldValues['ID'];

  IBQPadres.Close;
  IBQPadres.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPadres.Open;
  IBQPadres.First;
  if (DBLCBAPadres.KeyValue = NULL) then
    DBLCBAPadres.KeyValue := IBQPadres.FieldValues['ID'];

  IBQReceptoras.Close;
  IBQReceptoras.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQReceptoras.Open;
  IBQReceptoras.First;
  if (DBLCBAReceptoras.KeyValue = NULL) then
    DBLCBAReceptoras.KeyValue := IBQReceptoras.FieldValues['ID'];

  DTPADesde.Date := IncYear(Date(),-1);
  DTPAHasta.Date := Date();
  por_fecha := true;
  rodeo := null;
  potrero := null;
  receptora := null;
  donante := null;
  padre := null;
  dg := null;
  grupo := 0;
end;

procedure TFREPListadoImplantes.ActConsulta();
var
  Cartel : TCartel;
begin
  Cartel := TCartel.GetInstance();
  Cartel.abrircartel('Generando Listado de Implantes');

  IBQListadoImplantes.Close;
  if por_fecha then
  begin
    IBQListadoImplantes.ParamByName('fecha_ini').AsDate := DTPADesde.Date;
    IBQListadoImplantes.ParamByName('fecha_fin').AsDate := DTPAHasta.Date;
    IBQListadoImplantes.ParamByName('grupo').Value := null;
  end
  else
  begin
    IBQListadoImplantes.ParamByName('fecha_ini').Value := null;
    IBQListadoImplantes.ParamByName('fecha_fin').Value := null;
    IBQListadoImplantes.ParamByName('grupo').Value := grupo;
  end;
  IBQListadoImplantes.ParamByName('rodeo').Value := rodeo;
  IBQListadoImplantes.ParamByName('potrero').Value := potrero;
  IBQListadoImplantes.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQListadoImplantes.Open;

  Cartel.cerrarcartel;
  Cartel.FreeInstance;
end;

procedure TFRepListadoImplantes.RGTipoClick(Sender: TObject);
begin
  inherited;
  if RGTipo.ItemIndex = 0 then
  begin
    GBFechas.Enabled := true;
    label1.Enabled := false;
    DBLCBAGrupos.Enabled := false;
    GBGrupos.Enabled := false;
    label2.Enabled := true;
    label3.Enabled := true;
    DTPADesde.Enabled := true;
    DTPAHasta.Enabled := true;
    por_fecha := true;
    grupo := 0;
  end;
  if RGTipo.ItemIndex = 1 then
  begin
    GBFechas.Enabled := false;
    label1.Enabled := true;
    DBLCBAGrupos.Enabled := true;
    GBGrupos.Enabled := true;
    label2.Enabled := false;
    label3.Enabled := false;
    DTPADesde.Enabled := false;
    DTPAHasta.Enabled := false;
    por_fecha := false;
    grupo := 0;
  end;
end;

procedure TFRepListadoImplantes.DBLCBAGruposCloseUp(Sender: TObject);
begin
  inherited;
  grupo := 0;
  if DBLCBAGrupos.KeyValue <> null then
    grupo := DBLCBAGrupos.KeyValue;
end;

procedure TFRepListadoImplantes.DBLCBARodeosCloseUp(Sender: TObject);
begin
  inherited;
  rodeo := DBLCBARodeos.KeyValue;
end;

procedure TFRepListadoImplantes.DBLCBAPotrerosCloseUp(Sender: TObject);
begin
  inherited;
  potrero := DBLCBAPotreros.KeyValue;
end;

procedure TFRepListadoImplantes.BBImprimirReporteClick(Sender: TObject);
var
  F : TFRepListadoImplantesPreview;
  Cartel : TCartel;
begin
  inherited;
  HabilitarDesabilitarControles();
  Cartel := TCartel.GetInstance;
  Cartel.abrircartel('Generando Reporte de Listado de Implantes');

  F := TFRepListadoImplantesPreview.Create(nil);
  if por_fecha then
  begin
    F.QRLDesde.Enabled := true;
    F.QRLHasta.Enabled := true;
    F.QRLDesdeValue.Enabled := true;
    F.QRLHastaValue.Enabled := true;
    F.QRLDesdeValue.Caption := DateToStr(DTPADesde.Date);
    F.QRLHastaValue.Caption := DateToStr(DTPAHasta.Date);
    F.QRLGrupo.Enabled := false;
    F.QRLGrupoValue.Enabled := false;
  end
  else
  begin
    F.QRLDesde.Enabled := false;
    F.QRLHasta.Enabled := false;
    F.QRLDesdeValue.Enabled := false;
    F.QRLHastaValue.Enabled := false;
    F.QRLGrupo.Enabled := true;
    F.QRLGrupoValue.Enabled := true;
    F.QRLGrupoValue.Caption := DBLCBAGrupos.Text;
  end;

  F.QRLFiltros.Caption := '';
 {* if RGFiltros.ItemIndex = 0 then
    F.QRLFiltros.Caption := 'Rodeo: '+DBLCBARodeos.Text;
  if RGFiltros.ItemIndex = 1 then
    F.QRLFiltros.Caption := 'Potrero: '+DBLCBAPotreros.Text;
  if RGFiltros.ItemIndex = 2 then
    F.QRLFiltros.Caption := 'Todos';*}

  F.LCant.Caption := IntToStr(IBQListadoImplantes.RecordCount);

  Cartel.cerrarcartel;
  Cartel.FreeInstance;

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFRepListadoImplantes.IBQListadoImplantesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
  {BBimprimirReporte.Enabled := not DataSet.IsEmpty;
  BBXls.Enabled := not DataSet.IsEmpty;}
  IPreview.Enabled := not DataSet.IsEmpty;
  LPreview.Enabled := not DataSet.IsEmpty;
  LExpExcel.Enabled := not DataSet.IsEmpty;
  IExpExcel.Enabled := not DataSet.IsEmpty;
end;

procedure TFRepListadoImplantes.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXlS.SaveToFile(SDXLS.FileName);
end;

procedure TFRepListadoImplantes.IBQGruposAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFRepListadoImplantes.AccederFichaPadres(ID : Integer; Externo : String);
var
  F : TFREPFichaAnimal;
  E : TFAbmPadresExternos;
  Iabm : IButtonABM;
begin
  if (Externo = 'N') then
  begin
    F := TFREPFichaAnimal.Create(self);
    F.animal := ID;
    F.ShowModal;
    F.Destroy;
  end
  else
    if (Iabm = nil) then
    begin
      IBQEstabAnimalExt.Close;
      IBQEstabAnimalExt.ParamByName('animal').AsInteger := ID;
      IBQEstabAnimalExt.Open;
      E := TFABMPadresExternos.Create(self);
      E.EstabAux := IBQEstabAnimalExt.FieldValues['establecimiento'];
      E.nom := inttostr(ID);
      Iabm := IButtonABM(E);
      Iabm.ISetCampoRetorno('id_animal_externo');
      Iabm.IFitrate(-1,IBQEstabAnimalExt.FieldValues['establecimiento']);
      Iabm.IAbrir(faabm);
    end;
end;

procedure TFRepListadoImplantes.BDBGAnimalesDblClick(Sender: TObject);
var
  M_INT : String;
begin
  inherited;
  case BDBGAnimales.SelectedIndex of
    0 : AccederFichaPadres(IBQListadoImplantes.FieldValues['ID_RECEPTORA'],'N');
    2,3,4 : begin
              if IBQListadoImplantes.FieldValues['MINT'] = 'S' then
                M_INT := 'N'
              else
                M_INT := 'S';
              AccederFichaPadres(IBQListadoImplantes.FieldValues['ID_DONANTE'],M_INT);
            end;
    5,6,7 : AccederFichaPadres(IBQListadoImplantes.FieldValues['ID_PADRE_1'],IBQListadoImplantes.FieldValues['EXT1']);
  end;
end;

procedure TFRepListadoImplantes.IBQMadresCalcFields(DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('nombre').Value <> null then
    nombre := nombre+'-'+DataSet.FieldValues['nombre'];
  if DataSet.FieldByName('id_hba').Value <> null then
    nombre := nombre+'-'+DataSet.FieldValues['id_hba'];
  IBQMadresNOM.Value := nombre;
end;

procedure TFRepListadoImplantes.IBQPadresCalcFields(DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('nombre').Value <> null then
    nombre := nombre+'-'+DataSet.FieldValues['nombre'];
  if DataSet.FieldByName('id_hba').Value <> null then
    nombre := nombre+'-'+DataSet.FieldValues['id_hba'];
  IBQPadresNOM.Value := nombre;
end;

procedure TFRepListadoImplantes.IBQReceptorasCalcFields(DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('nombre').Value <> null then
    nombre := nombre+'-'+DataSet.FieldValues['nombre'];
  if DataSet.FieldByName('id_hba').Value <> null then
    nombre := nombre+'-'+DataSet.FieldValues['id_hba'];
  IBQReceptorasNOM.Value := nombre;
end;

procedure TFRepListadoImplantes.IBQAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

procedure TFRepListadoImplantes.DBLCBAReceptorasCloseUp(Sender: TObject);
begin
  inherited;
  receptora := DBLCBAReceptoras.KeyValue;
end;

procedure TFRepListadoImplantes.DBLCBADonantesCloseUp(Sender: TObject);
begin
  inherited;
  donante := DBLCBADonantes.KeyValue;
end;

procedure TFRepListadoImplantes.DBLCBAPadresCloseUp(Sender: TObject);
begin
  inherited;
  padre := DBLCBAPadres.KeyValue;
end;

procedure TFRepListadoImplantes.CBReceptoraClick(Sender: TObject);
begin
  inherited;
  DBLCBAReceptoras.Enabled := CBReceptora.Checked;
  receptora := null;
end;

procedure TFRepListadoImplantes.CBDonanteClick(Sender: TObject);
begin
  inherited;
  DBLCBADonantes.Enabled := CBDonante.Checked;
  donante := null;
end;

procedure TFRepListadoImplantes.CBPadreClick(Sender: TObject);
begin
  inherited;
  DBLCBAPadres.Enabled := CBPadre.Checked;
  padre := null;
end;

procedure TFRepListadoImplantes.IBQListadoImplantesFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := true;
  if (receptora <> null) and Accept then
    Accept := DataSet.FieldByName('ID_RECEPTORA').AsInteger = receptora;
  if (donante <> null) and Accept then
    Accept := DataSet.FieldByName('ID_DONANTE').AsInteger = donante;
  if (padre <> null) and Accept then
    Accept := (DataSet.FieldByName('ID_PADRE_1').AsInteger = padre) OR (DataSet.FieldByName('ID_PADRE_2').AsInteger = padre);
  if (dg <> null) and Accept then
    Accept := DataSet.FieldByName('DIAG_GESTACION').AsString = dg;
end;

procedure TFRepListadoImplantes.CBDiagGestaClick(Sender: TObject);
begin
  inherited;
  CBDG.Enabled := CBDiagGesta.Checked;
  dg := null;
end;

procedure TFRepListadoImplantes.CBDGCloseUp(Sender: TObject);
begin
  inherited;
  if CBDG.ItemIndex = 0 then
    dg := 'VACIA'
  else
    dg := 'PREÑADA';
end;

procedure TFRepListadoImplantes.CBRodeoClick(Sender: TObject);
begin
  inherited;
  DBLCBARodeos.Enabled := CBRodeo.Checked;
  rodeo := null;
end;

procedure TFRepListadoImplantes.CBPotreroClick(Sender: TObject);
begin
  inherited;
  DBLCBAPotreros.Enabled := CBPotrero.Checked;
  potrero := null;
end;

procedure TFRepListadoImplantes.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFRepListadoImplantes.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
