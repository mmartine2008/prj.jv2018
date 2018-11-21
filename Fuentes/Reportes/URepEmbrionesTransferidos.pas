unit URepEmbrionesTransferidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  Grids, DBGrids, UBDBGrid, Buttons, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, DateUtils, PngImage, jpeg, JvGIF, JvExControls,
  JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFRepEmbrionesTransferidos = class(TFUniversal)
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
    RGFiltros: TRadioGroup;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    DBLCBAPotreros: TDBLookupComboBoxAuto;
    PDatos: TPanel;
    GroupBox2: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    IBQListadoImplantes: TIBQuery;
    DSListadoImplantes: TDataSource;
    IBQGrupos: TIBQuery;
    IBQGruposID_GRUPO: TIntegerField;
    IBQGruposNOMBRE: TIBStringField;
    DSGrupos: TDataSource;
    GBOrden: TGroupBox;
    RBFechaImplante: TRadioButton;
    RBFechaColecta: TRadioButton;
    IBQEstabAnimalExt: TIBQuery;
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
    procedure RGTipoClick(Sender: TObject);
    procedure DBLCBAGruposCloseUp(Sender: TObject);
    procedure RGFiltrosClick(Sender: TObject);
    procedure DBLCBARodeosCloseUp(Sender: TObject);
    procedure DBLCBAPotrerosCloseUp(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure IBQListadoImplantesAfterOpen(DataSet: TDataSet);
    procedure BBSalirClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQGruposAfterOpen(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure RBFechaClick(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    potrero, rodeo, grupo : Variant;
    por_fecha : Boolean;
    procedure ActConsulta();
    procedure AccederFichaPadres(ID : Integer; Externo : String);
  public
    { Public declarations }
  end;

var
  FRepEmbrionesTransferidos: TFRepEmbrionesTransferidos;

implementation

uses
  UPrincipal, UDMSoftvet, URepEmbrionesTransferidosPreview, UCartel,
  UABMPadresExternos, UREPFichaAnimal, IBDButtonABM, UABMSimple, UTraduccion;

{$R *.dfm}

procedure TFRepEmbrionesTransferidos.FormCreate(Sender: TObject);
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


  DTPADesde.Date := IncYear(Date(),-1);
  DTPAHasta.Date := Date();
  por_fecha := true;
  rodeo := null;
  potrero := null;
  grupo := 0;

  label1.Enabled := false;
  DBLCBAGrupos.Enabled := false;

end;

procedure TFRepEmbrionesTransferidos.ActConsulta();
var
  Cartel : TCartel;
begin
  Cartel := TCartel.getInstance;
  Cartel.abrircartel('Generando Informe de Embriones Transferidos');

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

procedure TFRepEmbrionesTransferidos.RGTipoClick(Sender: TObject);
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

procedure TFRepEmbrionesTransferidos.DBLCBAGruposCloseUp(Sender: TObject);
begin
  inherited;
  grupo := 0;
  if DBLCBAGrupos.KeyValue <> null then
    grupo := DBLCBAGrupos.KeyValue;
end;

procedure TFRepEmbrionesTransferidos.RGFiltrosClick(Sender: TObject);
begin
  inherited;
  if RGFiltros.ItemIndex = 0 then
  begin
    DBLCBARodeos.Enabled := true;
    rodeo := 0;
    potrero := null;
    DBLCBAPotreros.Enabled := false;
  end;
  if RGFiltros.ItemIndex = 1 then
  begin
    DBLCBARodeos.Enabled := false;
    rodeo := null;
    potrero := 0;
    DBLCBAPotreros.Enabled := true;
  end;
  if RGFiltros.ItemIndex = 2 then
  begin
    DBLCBARodeos.Enabled := false;
    rodeo := null;
    potrero := null;
    DBLCBAPotreros.Enabled := false;
  end;
end;

procedure TFRepEmbrionesTransferidos.DBLCBARodeosCloseUp(Sender: TObject);
begin
  inherited;
  rodeo := DBLCBARodeos.KeyValue;
end;

procedure TFRepEmbrionesTransferidos.DBLCBAPotrerosCloseUp(
  Sender: TObject);
begin
  inherited;
  potrero := DBLCBAPotreros.KeyValue;
end;

procedure TFRepEmbrionesTransferidos.BBImprimirReporteClick(
  Sender: TObject);
var
  F : TFRepEmbrionesTransferidosPreview;
  Cartel : TCartel;
begin
  inherited;
  HabilitarDesabilitarControles();
  Cartel := TCartel.getInstance;
  Cartel.abrircartel('Generando Reporte de Embriones Transferidos');

  F := TFRepEmbrionesTransferidosPreview.Create(nil);
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
    F.QRLFiltros.Caption := Traducir('Rodeo: ')+DBLCBARodeos.Text;
  if RGFiltros.ItemIndex = 1 then
    F.QRLFiltros.Caption := Traducir('Potrero: ')+DBLCBAPotreros.Text;
  if RGFiltros.ItemIndex = 2 then
    F.QRLFiltros.Caption := Traducir('Todos');

  F.LCant.Caption := IntToStr(IBQListadoImplantes.RecordCount);

  Cartel.cerrarcartel;
  Cartel.FreeInstance;

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFRepEmbrionesTransferidos.IBQListadoImplantesAfterOpen(
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

procedure TFRepEmbrionesTransferidos.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFRepEmbrionesTransferidos.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXlS.SaveToFile(SDXLS.FileName);
end;

procedure TFRepEmbrionesTransferidos.IBQGruposAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFRepEmbrionesTransferidos.AccederFichaPadres(ID : Integer; Externo : String);
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

procedure TFRepEmbrionesTransferidos.BDBGAnimalesDblClick(Sender: TObject);
var
  M_INT : String;
begin
  inherited;
  case BDBGAnimales.SelectedIndex of
    0 : AccederFichaPadres(IBQListadoImplantes.FieldValues['ID_RECEPTORA'],'N');
    5,6,7 : begin
              if IBQListadoImplantes.FieldValues['MINT'] = 'S' then
                M_INT := 'N'
              else
                M_INT := 'S';
              AccederFichaPadres(IBQListadoImplantes.FieldValues['ID_DONANTE'],M_INT);
            end;
    8,9,10 : AccederFichaPadres(IBQListadoImplantes.FieldValues['ID_PADRE_1'],IBQListadoImplantes.FieldValues['EXT1']);
  end;
end;

procedure TFRepEmbrionesTransferidos.RBFechaClick(Sender: TObject);
var
  SQL : String;
begin
  inherited;
  SQL := 'select * from rep_listado_implantes(:fecha_ini, :fecha_fin, :grupo, :rodeo, :potrero, :establecimiento,null)';
  IBQListadoImplantes.Close;
  IBQListadoImplantes.SQL.Clear;
  if RBFechaImplante.Checked then
    SQL := SQL+' order by fecha_implante asc'
  else
    SQL := SQL+' order by fecha_colecta asc';
  IBQListadoImplantes.SQL.Add(SQL);
end;

procedure TFRepEmbrionesTransferidos.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFRepEmbrionesTransferidos.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
