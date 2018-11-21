unit UREPInfoDonantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  DateTimePickerAuto, DBCtrls, UDBLookupComboBoxAuto, Grids, DBGrids,
  UBDBGrid, Buttons, DateUtils, PngImage, jpeg, JvGIF, JvExControls,
  JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPInfoDonantes = class(TFUniversal)
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
    Panel1: TPanel;
    GBFiltros: TGroupBox;
    GBTiposFiltros: TGroupBox;
    CBDonante: TCheckBox;
    CBPadre: TCheckBox;
    CBPotrero: TCheckBox;
    CBRodeo: TCheckBox;
    RGFiltros: TRadioGroup;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    DBLCBAPotreros: TDBLookupComboBoxAuto;
    DBLCBAToro: TDBLookupComboBoxAuto;
    DBLCBADonante: TDBLookupComboBoxAuto;
    PDatos: TPanel;
    GroupBox2: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    IBQMadres: TIBQuery;
    DSMadres: TDataSource;
    DSPadres: TDataSource;
    IBQPadres: TIBQuery;
    IBQGrupos: TIBQuery;
    IBQGruposID_GRUPO: TIntegerField;
    IBQGruposNOMBRE: TIBStringField;
    DSGrupos: TDataSource;
    DSRepStockEmbriones: TDataSource;
    IBQRepInfoDonantes: TIBQuery;
    IBQRepInfoDonantesRP_DONANTE: TIBStringField;
    IBQRepInfoDonantesHBA_DONANTE: TIBStringField;
    IBQRepInfoDonantesNOMBRE_DONANTE: TIBStringField;
    IBQRepInfoDonantesRP_PADRE_1: TIBStringField;
    IBQRepInfoDonantesHBA_PADRE_1: TIBStringField;
    IBQRepInfoDonantesNOMBRE_PADRE_1: TIBStringField;
    IBQRepInfoDonantesRP_PADRE_2: TIBStringField;
    IBQRepInfoDonantesHBA_PADRE_2: TIBStringField;
    IBQRepInfoDonantesNOMBRE_PADRE_2: TIBStringField;
    IBQRepInfoDonantesCANT_EMBRIONES_TRANSFERIBLES: TIntegerField;
    IBQRepInfoDonantesCANT_EMBRIONES_DEG: TIntegerField;
    IBQRepInfoDonantesCANT_EMBRIONES_SIN_FERT: TIntegerField;
    IBQRepInfoDonantesCANT_HUEVOS: TIntegerField;
    IBQRepInfoDonantesCANT_EMBRIONES_TRANSFERIDOS: TIntegerField;
    IBQRepInfoDonantesPOR_TRANS: TFloatField;
    RGOrden: TRadioGroup;
    IBQMadresID: TIntegerField;
    IBQMadresID_RP: TIBStringField;
    IBQMadresNOMBRE: TIBStringField;
    IBQMadresID_HBA: TIBStringField;
    IBQMadresINTERNA: TIBStringField;
    IBQMadresNOM: TStringField;
    IBQPadresID: TIntegerField;
    IBQPadresID_RP: TIBStringField;
    IBQPadresNOMBRE: TIBStringField;
    IBQPadresID_HBA: TIBStringField;
    IBQPadresEXTERNO: TIBStringField;
    IBQPadresNOM: TStringField;
    IBQRepInfoDonantesID_DONANTE: TIntegerField;
    IBQRepInfoDonantesMINT: TIBStringField;
    IBQRepInfoDonantesID_PADRE_1: TIntegerField;
    IBQRepInfoDonantesEXT1: TIBStringField;
    IBQRepInfoDonantesID_PADRE_2: TIntegerField;
    IBQRepInfoDonantesEXT2: TIBStringField;
    IBQEstabAnimalExt: TIBQuery;
    IBQRepInfoDonantesFECHA: TDateField;
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
    procedure FormCreate(Sender: TObject);
    procedure RGFiltrosClick(Sender: TObject);
    procedure CBDonanteClick(Sender: TObject);
    procedure CBPadreClick(Sender: TObject);
    procedure CBPotreroClick(Sender: TObject);
    procedure CBRodeoClick(Sender: TObject);
    procedure DBLCBADonanteCloseUp(Sender: TObject);
    procedure DBLCBAToroCloseUp(Sender: TObject);
    procedure DBLCBAPotrerosCloseUp(Sender: TObject);
    procedure DBLCBARodeosCloseUp(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure DBLCBAGruposCloseUp(Sender: TObject);
    procedure IBQRepInfoDonantesAfterOpen(DataSet: TDataSet);
    procedure RGTipoClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure RGOrdenClick(Sender: TObject);
    procedure IBQRepInfoDonantesCalcFields(DataSet: TDataSet);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQGruposAfterOpen(DataSet: TDataSet);
    procedure IBQMadresCalcFields(DataSet: TDataSet);
    procedure IBQPadresCalcFields(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    potrero, rodeo, grupo, toro, donante, donante_int, toro_ext : Variant;
    por_fecha : Boolean;
    procedure ActConsulta();
    procedure AccederFichaPadres(ID : Integer; Externo : String);
  public
    { Public declarations }
  end;

var
  FREPInfoDonantes: TFREPInfoDonantes;

implementation

uses
  UPrincipal, UCartel, UDMSoftvet, UREPInfoDonantesPreview, UABMPadresExternos, UREPFichaAnimal,
  IBDButtonABM, UABMSimple, UTraduccion;

{$R *.dfm}

procedure TFREPInfoDonantes.FormCreate(Sender: TObject);
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
  if (DBLCBADonante.KeyValue = NULL) then
    DBLCBADonante.KeyValue := IBQMadres.FieldValues['ID'];

  IBQPadres.Close;
  IBQPadres.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPadres.Open;
  IBQPadres.First;
  if (DBLCBAToro.KeyValue = NULL) then
    DBLCBAToro.KeyValue := IBQPadres.FieldValues['ID'];

  DMSoftvet.IBQAfterOpen(IBQMadres);
  DMSoftvet.IBQAfterOpen(IBQPadres);

  DTPADesde.Date := IncYear(Date(),-1);
  DTPAHasta.Date := Date();

  por_fecha := true;
  rodeo := null;
  potrero := null;
  grupo := 0;
  toro := null;
  donante := null;
  donante_int := null;
  toro_ext := null;
end;

procedure TFREPInfoDonantes.ActConsulta();
var
  Cartel : TCartel;
begin
  Cartel := TCartel.getInstance;
  Cartel.abrircartel('Generando Informe de Donantes');

  IBQRepInfoDonantes.Close;
  if por_fecha then
  begin
    IBQRepInfoDonantes.ParamByName('fecha_ini').AsDate := DTPADesde.Date;
    IBQRepInfoDonantes.ParamByName('fecha_fin').AsDate := DTPAHasta.Date;
    IBQRepInfoDonantes.ParamByName('grupo').Value := null;
  end
  else
  begin
    IBQRepInfoDonantes.ParamByName('fecha_ini').Value := null;
    IBQRepInfoDonantes.ParamByName('fecha_fin').Value := null;
    IBQRepInfoDonantes.ParamByName('grupo').Value := grupo;
  end;
  IBQRepInfoDonantes.ParamByName('rodeo').Value := rodeo;
  IBQRepInfoDonantes.ParamByName('potrero').Value := potrero;
  IBQRepInfoDonantes.ParamByName('donante').Value := donante;
  IBQRepInfoDonantes.ParamByName('donante_int').Value := donante_int;
  IBQRepInfoDonantes.ParamByName('toro').Value := toro;
  IBQRepInfoDonantes.ParamByName('toro_ext').Value := toro_ext;
  IBQRepInfoDonantes.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRepInfoDonantes.Open;

  Cartel.cerrarcartel;
  Cartel.FreeInstance;
end;

procedure TFREPInfoDonantes.RGFiltrosClick(Sender: TObject);
begin
  inherited;
  if RGFiltros.ItemIndex = 0 then
  begin
    CBDonante.Enabled := false;
    CBPadre.Enabled := false;
    CBPotrero.Enabled := false;
    CBRodeo.Enabled := false;
    DBLCBADonante.Enabled := false;
    DBLCBAPotreros.Enabled := false;
    DBLCBAToro.Enabled := false;
    DBLCBARodeos.Enabled := false;
    rodeo := null;
    potrero := null;
    toro := null;
    toro_ext := null;
    donante := null;
    donante_int := null;
    GBTiposFiltros.Enabled := false;
  end;
  if RGFiltros.ItemIndex = 1 then
  begin
    CBDonante.Enabled := true;
    CBPadre.Enabled := true;
    CBPotrero.Enabled := true;
    CBRodeo.Enabled := true;
    GBTiposFiltros.Enabled := true;
  end;
end;

procedure TFREPInfoDonantes.CBDonanteClick(Sender: TObject);
begin
  inherited;
  if CBDonante.Checked then
  begin
    DBLCBADonante.Enabled := true;
    donante := 0;
    donante_int := 'S';
  end
  else
  begin
    DBLCBADonante.Enabled := false;
    donante := null;
    donante_int := null;
  end;
end;

procedure TFREPInfoDonantes.CBPadreClick(Sender: TObject);
begin
  inherited;
  if CBPadre.Checked then
  begin
    DBLCBAToro.Enabled := true;
    toro := 0;
    toro_ext := 'N';
  end
  else
  begin
    DBLCBAToro.Enabled := false;
    toro := null;
    toro_ext := null;
  end;
end;

procedure TFREPInfoDonantes.CBPotreroClick(Sender: TObject);
begin
  inherited;
  if CBPotrero.Checked then
  begin
    DBLCBAPotreros.Enabled := true;
    potrero := 0;
  end
  else
  begin
    DBLCBAPotreros.Enabled := false;
    potrero := null;
  end;
end;

procedure TFREPInfoDonantes.CBRodeoClick(Sender: TObject);
begin
  inherited;
  if CBRodeo.Checked then
  begin
    DBLCBARodeos.Enabled := true;
    rodeo := 0;
  end
  else
  begin
    DBLCBARodeos.Enabled := false;
    rodeo := null;
  end;
end;

procedure TFREPInfoDonantes.DBLCBADonanteCloseUp(Sender: TObject);
begin
  inherited;
  donante := DBLCBADonante.KeyValue;
  donante_int := IBQMadres.FieldValues['INTERNA'];
end;

procedure TFREPInfoDonantes.DBLCBAToroCloseUp(Sender: TObject);
begin
  inherited;
  toro := DBLCBAToro.KeyValue;
  toro_ext := IBQPadres.FieldValues['EXTERNO'];
end;

procedure TFREPInfoDonantes.DBLCBAPotrerosCloseUp(Sender: TObject);
begin
  inherited;
  potrero := DBLCBAPotreros.KeyValue;
end;

procedure TFREPInfoDonantes.DBLCBARodeosCloseUp(Sender: TObject);
begin
  inherited;
  rodeo := DBLCBARodeos.KeyValue;
end;

procedure TFREPInfoDonantes.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFREPInfoDonantes.DBLCBAGruposCloseUp(Sender: TObject);
begin
  inherited;
  grupo := 0;
  if DBLCBAGrupos.KeyValue then
    grupo := DBLCBAGrupos.KeyValue;
end;

procedure TFREPInfoDonantes.IBQRepInfoDonantesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  {BBImprimirReporte.Enabled := not DataSet.IsEmpty;
  BBXls.Enabled := not DataSet.IsEmpty;}
  IPreview.Enabled := not DataSet.IsEmpty;
  LPreview.Enabled := not DataSet.IsEmpty;
  LExpExcel.Enabled := not DataSet.IsEmpty;
  IExpExcel.Enabled := not DataSet.IsEmpty;
end;

procedure TFREPInfoDonantes.RGTipoClick(Sender: TObject);
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

procedure TFREPInfoDonantes.BBImprimirReporteClick(Sender: TObject);
var
  F : TFREPInfoDonantesPreview;
  Cartel : TCartel;
begin
  inherited;
  HabilitarDesabilitarControles();
  Cartel := TCartel.getInstance;
  Cartel.abrircartel('Generando Reporte de Informe de Donantes');

  F := TFREPInfoDonantesPreview.Create(nil);
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

  if RGFiltros.ItemIndex = 0 then
    F.QRLFiltros.Caption := Traducir('Todos')
  else
  begin
    F.QRLFiltros.Caption := ' - ';
    if CBDonante.Checked then
      F.QRLFiltros.Caption := F.QRLFiltros.Caption+Traducir(' Donante: ')+DBLCBADonante.Text+' - ';
    if CBPadre.Checked then
      F.QRLFiltros.Caption := F.QRLFiltros.Caption+Traducir(' Toro: ')+DBLCBAToro.Text+' - ';
    if CBRodeo.Checked then
      F.QRLFiltros.Caption := F.QRLFiltros.Caption+Traducir(' Rodeo: ')+DBLCBARodeos.Text+' - ';
    if CBPotrero.Checked then
      F.QRLFiltros.Caption := F.QRLFiltros.Caption+Traducir(' Potrero: ')+DBLCBAPotreros.Text+' - ';
  end;

  Cartel.cerrarcartel;
  Cartel.FreeInstance;

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFREPInfoDonantes.RGOrdenClick(Sender: TObject);
var
  SQL : String;
begin
  inherited;
  SQL := 'select * from rep_info_donantes(:establecimiento,:fecha_ini,:fecha_fin,:grupo,:potrero,:rodeo,:donante,:donante_int,:toro,:toro_ext)';
  IBQRepInfoDonantes.Close;
  IBQRepInfoDonantes.SQL.Clear;
  if RGOrden.ItemIndex = 0 then
    SQL := SQL+' order by fecha desc';
  if RGOrden.ItemIndex = 1 then
    SQL := SQL+' order by cant_huevos desc';
  if RGOrden.ItemIndex = 2 then
    SQL := SQL+' order by cant_embriones_transferidos desc';
  IBQRepInfoDonantes.SQL.Add(SQL);
end;

procedure TFREPInfoDonantes.IBQRepInfoDonantesCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('cant_huevos').Value <> null then
    if DataSet.FieldByName('cant_huevos').Value > 0 then
      IBQRepInfoDonantesPOR_TRANS.Value := (DataSet.FieldValues['cant_embriones_transferidos']/DataSet.FieldValues['cant_huevos'])*100;
end;

procedure TFREPInfoDonantes.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXlS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPInfoDonantes.IBQGruposAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFREPInfoDonantes.IBQMadresCalcFields(DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('nombre').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['nombre'];
  if DataSet.FieldByName('id_hba').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['id_hba'];
  IBQMadresNOM.Value := nombre;
end;

procedure TFREPInfoDonantes.IBQPadresCalcFields(DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('nombre').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['nombre'];
  if DataSet.FieldByName('id_hba').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['id_hba'];
  IBQPadresNOM.Value := nombre;
end;

procedure TFREPInfoDonantes.AccederFichaPadres(ID : Integer; Externo : String);
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
      E.id_animal_ex := ID;
      Iabm := IButtonABM(E);
      Iabm.ISetCampoRetorno('id_animal_externo');
      Iabm.IFitrate(-1,IBQEstabAnimalExt.FieldValues['establecimiento']);
      Iabm.IAbrir(faabm);
    end;
end;

procedure TFREPInfoDonantes.BDBGAnimalesDblClick(Sender: TObject);
begin
  inherited;
  case BDBGAnimales.SelectedIndex of
    0,1,2 : AccederFichaPadres(IBQRepInfoDonantes.FieldValues['ID_DONANTE'],'N');
    3,4,5 : AccederFichaPadres(IBQRepInfoDonantes.FieldValues['ID_PADRE_1'],IBQRepInfoDonantes.FieldValues['EXT1']);
  end;
end;

procedure TFREPInfoDonantes.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFREPInfoDonantes.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
