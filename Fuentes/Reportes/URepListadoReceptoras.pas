unit URepListadoReceptoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  Grids, DBGrids, UBDBGrid, Buttons, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, DateUtils, ComboBoxAuto, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFRepListadoReceptoras = class(TFUniversal)
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
    DSListadoImplantes: TDataSource;
    IBQListadoImplantes: TIBQuery;
    DSGrupos: TDataSource;
    IBQGrupos: TIBQuery;
    IBQGruposID_GRUPO: TIntegerField;
    IBQGruposNOMBRE: TIBStringField;
    GBOrden: TGroupBox;
    RBFechaImplante: TRadioButton;
    RBFechaTacto: TRadioButton;
    RBRPReceptora: TRadioButton;
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
    IBQListadoImplantesID_CRIA_1: TIntegerField;
    IBQListadoImplantesRP_CRIA_1: TIBStringField;
    IBQListadoImplantesHBA_CRIA_1: TIBStringField;
    IBQListadoImplantesNOMBRE_CRIA_1: TIBStringField;
    IBQListadoImplantesSEXO_1: TIBStringField;
    IBQListadoImplantesID_CRIA_2: TIntegerField;
    IBQListadoImplantesRP_CRIA_2: TIBStringField;
    IBQListadoImplantesHBA_CRIA_2: TIBStringField;
    IBQListadoImplantesNOMBRE_CRIA_2: TIBStringField;
    IBQListadoImplantesSEXO_2: TIBStringField;
    IBQListadoImplantesID_CRIA_3: TIntegerField;
    IBQListadoImplantesRP_CRIA_3: TIBStringField;
    IBQListadoImplantesHBA_CRIA_3: TIBStringField;
    IBQListadoImplantesNOMBRE_CRIA_3: TIBStringField;
    IBQListadoImplantesSEXO_3: TIBStringField;
    CBAEstadoRepro: TComboBoxAuto;
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
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure RGFiltrosClick(Sender: TObject);
    procedure DBLCBARodeosCloseUp(Sender: TObject);
    procedure DBLCBAPotrerosCloseUp(Sender: TObject);
    procedure DBLCBAGruposCloseUp(Sender: TObject);
    procedure IBQListadoImplantesAfterOpen(DataSet: TDataSet);
    procedure IBQGruposAfterOpen(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure RBFechaClick(Sender: TObject);
    procedure IBQListadoImplantesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure BBXlsClick(Sender: TObject);
    procedure CBAEstadoReproCloseUp(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    potrero, rodeo, grupo, est_repro : Variant;
    por_fecha : Boolean;
    cant_tactadas, cant_preniadas : integer;
    procedure ActConsulta();
  public
    { Public declarations }
  end;

var
  FRepListadoReceptoras: TFRepListadoReceptoras;

implementation

uses
  UPrincipal, UDMSoftvet, URepListadoReceptorasPreview, UCartel,
  UREPFichaAnimal, UTraduccion;

{$R *.dfm}

procedure TFRepListadoReceptoras.ActConsulta();
var
  Cartel : TCartel;
begin
  Cartel := TCartel.getInstance;
  Cartel.abrircartel('Generando Listado de Receptoras');

  cant_preniadas := 0;
  cant_tactadas := 0;
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
  IBQListadoImplantes.ParamByName('estado_repro').Value := est_repro;

  IBQListadoImplantes.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQListadoImplantes.Open;

  Cartel.cerrarcartel;
  Cartel.FreeInstance;
end;

procedure TFRepListadoReceptoras.BBImprimirReporteClick(Sender: TObject);
var
  F : TFRepListadoReceptorasPreview;
  Cartel : TCartel;
begin
  inherited;
  HabilitarDesabilitarControles();
  Cartel := TCartel.getInstance;
  Cartel.abrircartel('Generando Reporte de Listado de Receptoras');

  F := TFRepListadoReceptorasPreview.Create(nil);
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
    F.QRLFiltros.Caption := Traducir('Estado Reproductivo: ')+CBAEstadoRepro.Text;
  if RGFiltros.ItemIndex = 3 then
    F.QRLFiltros.Caption := Traducir('Todos');

  F.LCant.Caption := IntToStr(IBQListadoImplantes.RecordCount);
  if cant_tactadas > 0 then
  begin
    F.QRLPrenTacto.Caption := FormatFloat('##,##',(cant_preniadas/cant_tactadas)*100)+'%';
    F.QRLPrenImplante.Caption := FormatFloat('##,##',(cant_preniadas/IBQListadoImplantes.RecordCount)*100)+'%';
  end
  else
  begin
    F.QRLPrenTacto.Caption := Traducir('Sin Tacto');
    F.QRLPrenImplante.Caption := Traducir('Sin Tacto');
  end;

  Cartel.cerrarcartel;
  Cartel.FreeInstance;

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFRepListadoReceptoras.FormCreate(Sender: TObject);
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
  est_repro := null;
  grupo := 0;
end;

procedure TFRepListadoReceptoras.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFRepListadoReceptoras.RGTipoClick(Sender: TObject);
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

procedure TFRepListadoReceptoras.RGFiltrosClick(Sender: TObject);
begin
  inherited;
  if RGFiltros.ItemIndex = 0 then
  begin
    DBLCBARodeos.Enabled := true;
    rodeo := 0;
    potrero := null;
    DBLCBAPotreros.Enabled := false;
    CBAEstadoRepro.Enabled := false;
    est_repro := null;
  end;
  if RGFiltros.ItemIndex = 1 then
  begin
    DBLCBARodeos.Enabled := false;
    rodeo := null;
    potrero := 0;
    DBLCBAPotreros.Enabled := true;
    CBAEstadoRepro.Enabled := false;
    est_repro := null;
  end;
  if RGFiltros.ItemIndex = 2 then
  begin
    DBLCBARodeos.Enabled := false;
    DBLCBAPotreros.Enabled := false;
    CBAEstadoRepro.Enabled := true;
    rodeo := null;
    potrero := null;
    est_repro := 1;
  end;
  if RGFiltros.ItemIndex = 3 then
  begin
    DBLCBARodeos.Enabled := false;
    rodeo := null;
    potrero := null;
    DBLCBAPotreros.Enabled := false;
    CBAEstadoRepro.Enabled := false;
    est_repro := null;
  end;
end;

procedure TFRepListadoReceptoras.DBLCBARodeosCloseUp(Sender: TObject);
begin
  inherited;
  rodeo := DBLCBARodeos.KeyValue;
end;

procedure TFRepListadoReceptoras.DBLCBAPotrerosCloseUp(Sender: TObject);
begin
  inherited;
  potrero := DBLCBAPotreros.KeyValue;
end;

procedure TFRepListadoReceptoras.DBLCBAGruposCloseUp(Sender: TObject);
begin
  inherited;
  grupo := 0;
  if DBLCBAGrupos.KeyValue <> null then
    grupo := DBLCBAGrupos.KeyValue;
end;

procedure TFRepListadoReceptoras.IBQListadoImplantesAfterOpen(
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

procedure TFRepListadoReceptoras.IBQGruposAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFRepListadoReceptoras.BDBGAnimalesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BDBGAnimales.SelectedIndex = 0 then
    if not(IBQListadoImplantes.Eof) then
    begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQListadoImplantes.FieldByName('ID_RECEPTORA').AsInteger;
      F.ShowModal;
      F.Destroy;
    end;
  if (BDBGAnimales.SelectedIndex = 8) and (IBQListadoImplantes.FieldByName('ID_CRIA_1').Value <> null) then
    if not(IBQListadoImplantes.Eof) then
    begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQListadoImplantes.FieldByName('ID_CRIA_1').AsInteger;
      F.ShowModal;
      F.Destroy;
    end;
end;

procedure TFRepListadoReceptoras.RBFechaClick(Sender: TObject);
var
  SQL : String;
begin
  inherited;
  SQL := 'select * from rep_listado_implantes(:fecha_ini, :fecha_fin, :grupo, :rodeo, :potrero, :establecimiento, :estado_repro)';
  IBQListadoImplantes.Close;
  IBQListadoImplantes.SQL.Clear;
  if RBFechaImplante.Checked then
    SQL := SQL+' order by fecha_implante asc';
  if RBFechaTacto.Checked then
    SQL := SQL+' order by fecha_tacto asc';
  if RBRPReceptora.Checked then
    SQL := SQL+' order by rp_receptora asc';
  IBQListadoImplantes.SQL.Add(SQL);
end;

procedure TFRepListadoReceptoras.IBQListadoImplantesFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := true;

  if (DataSet.FieldByName('EST_REP').Value <> null) then
  begin
    Inc(cant_tactadas);
    if DataSet.FieldByName('EST_REP').Value = 2 then
      Inc(cant_preniadas);
  end;
end;

procedure TFRepListadoReceptoras.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXlS.SaveToFile(SDXLS.FileName);
end;

procedure TFRepListadoReceptoras.CBAEstadoReproCloseUp(Sender: TObject);
begin
  inherited;
  est_repro := CBAEstadoRepro.ItemIndex+1;
end;

procedure TFRepListadoReceptoras.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFRepListadoReceptoras.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
