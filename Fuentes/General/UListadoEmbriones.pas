unit UListadoEmbriones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  DateTimePickerAuto, DBCtrls, UDBLookupComboBoxAuto, Grids, DBGrids,
  UBDBGrid, Buttons, EditAutoMinuscula, JvExControls, JvLabel, JvGIF,
  PngImage, jpeg, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFListadoEmbriones = class(TFUniversal)
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
    GBFiltros: TGroupBox;
    GBTiposFiltros: TGroupBox;
    CBDestino: TCheckBox;
    CBDonante: TCheckBox;
    CBPadre: TCheckBox;
    RGFiltros: TRadioGroup;
    DBLCBADestino: TDBLookupComboBoxAuto;
    DBLCBADonante: TDBLookupComboBoxAuto;
    DBLCBAToro: TDBLookupComboBoxAuto;
    PEmbriones: TPanel;
    GBEmbriones: TGroupBox;
    BDBGEmbriones: TBitDBGrid;
    DSEmbriones: TDataSource;
    IBQEmbriones: TIBQuery;
    IBQEstadio: TIBQuery;
    IBQCalidad: TIBQuery;
    IBQEmbrionesID_EMBRION: TIntegerField;
    IBQEmbrionesESTABLECIMIENTO: TIntegerField;
    IBQEmbrionesFECHA_COLECCION: TDateField;
    IBQEmbrionesDESTINO: TIntegerField;
    IBQEmbrionesDESCRIPCION: TIntegerField;
    IBQEmbrionesSERIE: TIBStringField;
    IBQEmbrionesNRO_ENVASE: TIBStringField;
    IBQEmbrionesESTADIO: TIntegerField;
    IBQEmbrionesCALIDAD: TIntegerField;
    IBQEmbrionesRESPONSABLE: TIntegerField;
    IBQEmbrionesOBSERVACION: TIBStringField;
    IBQEmbrionesMADRE: TIntegerField;
    IBQEmbrionesPADRE_1: TIntegerField;
    IBQEmbrionesPADRE_EXTERNO_1: TIBStringField;
    IBQEmbrionesPADRE_2: TIntegerField;
    IBQEmbrionesPADRE_EXTERNO_2: TIBStringField;
    IBQEmbrionesMADRE_INTERNA: TIBStringField;
    IBQEmbrionesUSADO: TIBStringField;
    IBQEmbrionesCANT_LAVAJES: TIntegerField;
    IBQEmbrionesID_EVE_TRANS: TIntegerField;
    IBQEmbrionesPRECIO: TFloatField;
    IBQEmbrionesCENTRO_TRANSPLANTE: TIntegerField;
    IBQEmbrionesDIAS_GESTACION: TIntegerField;
    IBQEmbrionesNRO_ORDEN: TIBStringField;
    IBQEmbrionesVAL_CALIDAD: TIntegerField;
    IBQEmbrionesVAL_ESTADIO: TIntegerField;
    IBQDestinos: TIBQuery;
    DSDestinos: TDataSource;
    DSPadres: TDataSource;
    IBQPadres: TIBQuery;
    IBQPadresID: TIntegerField;
    IBQPadresID_RP: TIBStringField;
    IBQPadresNOMBRE: TIBStringField;
    IBQPadresID_HBA: TIBStringField;
    IBQPadresEXTERNO: TIBStringField;
    IBQPadresNOM: TStringField;
    IBQMadres: TIBQuery;
    IBQMadresID: TIntegerField;
    IBQMadresID_RP: TIBStringField;
    IBQMadresNOMBRE: TIBStringField;
    IBQMadresID_HBA: TIBStringField;
    IBQMadresINTERNA: TIBStringField;
    IBQMadresNOM: TStringField;
    DSMadres: TDataSource;
    IBQGrupos: TIBQuery;
    IBQGruposID_GRUPO: TIntegerField;
    IBQGruposNOMBRE: TIBStringField;
    DSGrupos: TDataSource;
    IBQAgregarEmbrionAux: TIBQuery;
    IBQModificarEmbriones: TIBQuery;
    IBQEmbrionAux: TIBQuery;
    IBQDelAuxEmbriones: TIBQuery;
    CBSerie: TCheckBox;
    CBEnvase: TCheckBox;
    CBEstadio: TCheckBox;
    EAMSerie: TEditAutoMinuscula;
    EAMEnvase: TEditAutoMinuscula;
    DBLCBAEstadio: TDBLookupComboBoxAuto;
    DBLCBACalidad: TDBLookupComboBoxAuto;
    DSEstadios: TDataSource;
    DSCalidad: TDataSource;
    CBCalidad: TCheckBox;
    IBQEmbrionesNOM_DEST: TStringField;
    IBQDescripcion: TIBQuery;
    IBQEmbrionesNOM_DESC: TStringField;
    IBQEmbrionesESTADO: TStringField;
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
    procedure FormCreate(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure RGFiltrosClick(Sender: TObject);
    procedure DBLCBAGruposCloseUp(Sender: TObject);
    procedure DBLCBADonanteCloseUp(Sender: TObject);
    procedure DBLCBAToroCloseUp(Sender: TObject);
    procedure DBLCBADestinoCloseUp(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure CBDestinoClick(Sender: TObject);
    procedure CBDonanteClick(Sender: TObject);
    procedure CBPadreClick(Sender: TObject);
    procedure IBQMadresCalcFields(DataSet: TDataSet);
    procedure IBQPadresCalcFields(DataSet: TDataSet);
    procedure DTPADesdeCloseUp(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGEmbrionesDblClick(Sender: TObject);
    procedure EAMSerieChange(Sender: TObject);
    procedure EAMEnvaseChange(Sender: TObject);
    procedure DBLCBAEstadioCloseUp(Sender: TObject);
    procedure DBLCBACalidadCloseUp(Sender: TObject);
    procedure CBSerieClick(Sender: TObject);
    procedure CBEnvaseClick(Sender: TObject);
    procedure CBEstadioClick(Sender: TObject);
    procedure CBCalidadClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure IBQEmbrionesAfterOpen(DataSet: TDataSet);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQEmbrionesCalcFields(DataSet: TDataSet);
  private
    serie, envase, donante_int, toro_ext : String;
    estadio, calidad, grupo, toro, donante, destino : Integer;
    por_fecha : Boolean;
    procedure ActConsulta();
    procedure AgregarEmbrionAux;
    procedure PasarEmbriones;
  public
    { Public declarations }
  end;

var
  FListadoEmbriones: TFListadoEmbriones;

implementation

{$R *.dfm}

uses
  Uprincipal, UDMSoftvet, DateUtils, UDatosEmbriones, UREPListadoEmbriones, UEveTransferenciaEmbrionaria,
  UMensajeHuella, UEveSimple, UTraduccion;

procedure TFListadoEmbriones.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  IBQGrupos.Close;
  IBQGrupos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGrupos.Open;
  IBQMadres.Close;
  IBQMadres.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQMadres.Open;
  IBQPadres.Close;
  IBQPadres.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPadres.Open;
  IBQDestinos.Close;
  IBQDestinos.Open;
  DMSoftvet.IBQAfterOpen(IBQMadres);
  DMSoftvet.IBQAfterOpen(IBQPadres);
  DMSoftvet.IBQAfterOpen(IBQDestinos);
  DTPADesde.Date := IncYear(Date(),-1);
  DTPAHasta.Date := Date();
  por_fecha := true;
  estadio := 0;
  calidad := 0;
  serie := '%';
  envase := '%';
  grupo := 0;
  toro := 0;
  donante := 0;
  destino := 0;
  donante_int := 'S';
  toro_ext := 'S';
  ActConsulta;
end;

procedure TFListadoEmbriones.ActConsulta;
var
  StrSQL : String;
begin
  StrSQL:= 'select * from tab_embriones where id_embrion > 1 and establecimiento = :establecimiento';
  if por_fecha then
    StrSQL := StrSQL+' and fecha_coleccion between :f1 and :f2 '
  else
    StrSQL := StrSQL+' and id_eve_trans in (select evento from rel_grupos_evento where grupo = :grupo and establecimiento = :esta)';

  if CBDestino.Checked then
    StrSQL := StrSQL+' and destino = '+IntToStr(destino)+' ';
  if CBDonante.Checked then
    StrSQL := StrSQL+' and madre = '+IntToStr(donante)+' and madre_interna = '''+donante_int+''' ';
  if CBPadre.Checked then
    StrSQL := StrSQL+' and ((padre_1 = '+IntToStr(toro)+' and padre_externo_1 = '''+toro_ext+''') or (padre_2 = '+IntToStr(toro)+' and padre_externo_2 = '''+toro_ext+'''))';
  if CBSerie.Checked then
    StrSQL := StrSQL+' and serie like :serie ';
  if CBEnvase.Checked then
    StrSQL := StrSQL+' and nro_envase like :envase ';
  if CBEstadio.Checked then
    StrSQL := StrSQL+' and estadio = '+IntToStr(estadio)+' ';
  if CBCalidad.Checked then
    StrSQL := StrSQL+' and calidad = '+IntToStr(calidad)+' ';

  IBQEmbriones.Close;
  IBQEmbriones.SQL.Clear;
  IBQEmbriones.SQL.Add(StrSQL);

  IBQEmbriones.ParamByName('establecimiento').Value := FPrincipal.EstablecimientoActual;
  if por_fecha then
  begin
    IBQEmbriones.ParamByName('f1').AsDate := DTPADesde.Date;
    IBQEmbriones.ParamByName('f2').AsDate := DTPAHasta.Date;
  end
  else
    IBQEmbriones.ParamByName('grupo').AsInteger := grupo;
  if CBSerie.Checked then
    IBQEmbriones.ParamByName('serie').AsString := serie;
  if CBEnvase.Checked then
    IBQEmbriones.ParamByName('envase').AsString := envase;
  IBQEmbriones.Open;
end;

procedure TFListadoEmbriones.RGTipoClick(Sender: TObject);
begin
  inherited;
  if RGTipo.ItemIndex = 0 then
  begin
    GBFechas.Enabled := true;
    GBGrupos.Enabled := false;
    por_fecha := true;
    grupo := 0;
  end;
  if RGTipo.ItemIndex = 1 then
  begin
    GBFechas.Enabled := false;
    GBGrupos.Enabled := true;
    por_fecha := false;
    grupo := 0;
  end;
  ActConsulta();
end;

procedure TFListadoEmbriones.RGFiltrosClick(Sender: TObject);
begin
  inherited;
  if RGFiltros.ItemIndex = 0 then
  begin
    CBDestino.Enabled := false;
    CBDonante.Enabled := false;
    CBPadre.Enabled := false;
    CBSerie.Enabled := false;
    CBEnvase.Enabled := false;
    CBEstadio.Enabled := false;
    CBCalidad.Enabled := false;
    DBLCBADonante.Enabled := false;
    DBLCBAToro.Enabled := false;
    DBLCBADestino.Enabled := false;
    DBLCBACalidad.Enabled := false;
    DBLCBAEstadio.Enabled := false;
    EAMSerie.Enabled := false;
    EAMSerie.Enabled := false;

    estadio := 0;
    calidad := 0;
    serie := '%';
    envase := '%';
    toro := 0;
    toro_ext := 'S';
    donante := 0;
    donante_int := 'S';
    destino := 0;
    GBTiposFiltros.Enabled := false;
  end;
  if RGFiltros.ItemIndex = 1 then
  begin
    CBDestino.Enabled := true;
    CBDonante.Enabled := true;
    CBPadre.Enabled := true;
    CBSerie.Enabled := true;
    CBEnvase.Enabled := true;
    CBEstadio.Enabled := true;
    CBCalidad.Enabled := true;
    GBTiposFiltros.Enabled := true;
  end;
  ActConsulta();
end;

procedure TFListadoEmbriones.DBLCBAGruposCloseUp(Sender: TObject);
begin
  inherited;
  grupo := 0;
  if DBLCBAGrupos.KeyValue then
    grupo := DBLCBAGrupos.KeyValue;
  ActConsulta();
end;

procedure TFListadoEmbriones.DBLCBADonanteCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBADonante.KeyValue <> null then
  begin
    donante := DBLCBADonante.KeyValue;
    donante_int := IBQMadres.FieldValues['INTERNA'];
    ActConsulta();
  end;
end;

procedure TFListadoEmbriones.DBLCBAToroCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBAToro.KeyValue <> null then
  begin
    toro := DBLCBAToro.KeyValue;
    toro_ext := IBQPadres.FieldValues['EXTERNO'];
    ActConsulta();
  end;
end;

procedure TFListadoEmbriones.DBLCBADestinoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBADestino.KeyValue <> null then
  begin
    destino := DBLCBADestino.KeyValue;
    ActConsulta();
  end;
end;

procedure TFListadoEmbriones.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFListadoEmbriones.CBDestinoClick(Sender: TObject);
begin
  inherited;
  DBLCBADestino.Enabled := CBDestino.Checked;
  destino := 0;
  ActConsulta();
end;

procedure TFListadoEmbriones.CBDonanteClick(Sender: TObject);
begin
  inherited;
  DBLCBADonante.Enabled := CBDonante.Checked;
  donante := 0;
  donante_int := 'S';
  ActConsulta();
end;

procedure TFListadoEmbriones.CBPadreClick(Sender: TObject);
begin
  inherited;
  DBLCBAToro.Enabled := CBPadre.Checked;
  toro := 0;
  toro_ext := 'S';
  ActConsulta();
end;

procedure TFListadoEmbriones.IBQMadresCalcFields(DataSet: TDataSet);
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

procedure TFListadoEmbriones.IBQPadresCalcFields(DataSet: TDataSet);
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

procedure TFListadoEmbriones.DTPADesdeCloseUp(Sender: TObject);
begin
  inherited;
  ActConsulta();
end;

procedure TFListadoEmbriones.DTPADesdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPADesdeCloseUp(Sender);
end;

procedure TFListadoEmbriones.BDBGEmbrionesDblClick(Sender: TObject);
var
  F : TFDatosEmbriones;
  cant_receptoras : Integer;
  FT : TFEveTransferenciaEmbrionaria;
begin
  inherited;
  AgregarEmbrionAux;
  F := TFDatosEmbriones.Create(self,IBQEmbriones.FieldValues['responsable'],IBQEmbriones.FieldValues['fecha_coleccion']);
  F.TipoDeDato := tddEditar;
  F.DeListado := true;
  if IBQEmbriones.FieldValues['MADRE_INTERNA'] = 'S' then
    F.ModoColeccion := mcInterno
  else
    F.ModoColeccion := mcExterno;
  F.Madre := IBQEmbriones.FieldValues['MADRE'];
  F.Padre_1 := IBQEmbriones.FieldValues['PADRE_1'];
  F.Externo_1 := IBQEmbriones.FieldValues['PADRE_EXTERNO_1'];
  if IBQEmbriones.FieldValues['PADRE_2'] > 0 then
  begin
    F.Padre_2 := IBQEmbriones.FieldValues['PADRE_2'];
    F.Externo_2 := IBQEmbriones.FieldValues['PADRE_EXTERNO_2'];
  end;
  F.ObtenerDatosIA;
  F.ShowModal;
  F.Destroy;
  PasarEmbriones;
  ActConsulta;
end;

procedure TFListadoEmbriones.AgregarEmbrionAux;
begin
  try
    IBQAgregarEmbrionAux.Close;
    IBQAgregarEmbrionAux.ParamByName('id').Value := IBQEmbriones.FieldValues['id_embrion'];
    IBQAgregarEmbrionAux.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
    IBQAgregarEmbrionAux.ParamByName('fecha').Value := IBQEmbriones.FieldValues['fecha_coleccion'];
    IBQAgregarEmbrionAux.ParamByName('dest').Value := IBQEmbriones.FieldValues['destino'];
    IBQAgregarEmbrionAux.ParamByName('desc').Value := IBQEmbriones.FieldValues['descripcion'];
    IBQAgregarEmbrionAux.ParamByName('serie').Value := IBQEmbriones.FieldValues['serie'];
    IBQAgregarEmbrionAux.ParamByName('envase').Value := IBQEmbriones.FieldValues['nro_envase'];
    IBQAgregarEmbrionAux.ParamByName('estadio').Value := IBQEmbriones.FieldValues['estadio'];
    IBQAgregarEmbrionAux.ParamByName('calidad').Value := IBQEmbriones.FieldValues['calidad'];
    IBQAgregarEmbrionAux.ParamByName('resp').Value := IBQEmbriones.FieldValues['responsable'];
    IBQAgregarEmbrionAux.ParamByName('observacion').Value := IBQEmbriones.FieldValues['observacion'];
    IBQAgregarEmbrionAux.ParamByName('madre').Value := IBQEmbriones.FieldValues['madre'];
    IBQAgregarEmbrionAux.ParamByName('padre1').Value := IBQEmbriones.FieldValues['padre_1'];
    IBQAgregarEmbrionAux.ParamByName('padre2').Value := IBQEmbriones.FieldValues['padre_2'];
    IBQAgregarEmbrionAux.ParamByName('ext1').Value := IBQEmbriones.FieldValues['padre_externo_1'];
    IBQAgregarEmbrionAux.ParamByName('ext2').Value := IBQEmbriones.FieldValues['padre_externo_2'];
    IBQAgregarEmbrionAux.ParamByName('mint').Value := IBQEmbriones.FieldValues['madre_interna'];
    IBQAgregarEmbrionAux.ParamByName('usado').Value := IBQEmbriones.FieldValues['usado'];
    IBQAgregarEmbrionAux.ParamByName('lavajes').Value := IBQEmbriones.FieldValues['cant_lavajes'];
    IBQAgregarEmbrionAux.ParamByName('precio').Value := IBQEmbriones.FieldValues['precio'];
    IBQAgregarEmbrionAux.ParamByName('centro').Value := IBQEmbriones.FieldValues['centro_transplante'];
    IBQAgregarEmbrionAux.ParamByName('dias').Value := IBQEmbriones.FieldValues['dias_gestacion'];
    IBQAgregarEmbrionAux.ParamByName('orden').Value := IBQEmbriones.FieldValues['nro_orden'];
    IBQAgregarEmbrionAux.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFListadoEmbriones.PasarEmbriones;
begin
  IBQEmbrionAux.Close;
  IBQEmbrionAux.ParamByName('id').Value := IBQEmbriones.FieldValues['id_embrion'];
  IBQEmbrionAux.Open;
  try
    IBQModificarEmbriones.Close;
    IBQModificarEmbriones.ParamByName('id').Value := IBQEmbriones.FieldValues['id_embrion'];
    IBQModificarEmbriones.ParamByName('serie').Value := IBQEmbrionAux.FieldValues['serie'];
    IBQModificarEmbriones.ParamByName('orden').Value := IBQEmbrionAux.FieldValues['nro_orden'];
    IBQModificarEmbriones.ParamByName('envase').Value := IBQEmbrionAux.FieldValues['nro_envase'];
    IBQModificarEmbriones.ParamByName('lavajes').Value := IBQEmbrionAux.FieldValues['cant_lavajes'];
    IBQModificarEmbriones.ParamByName('estadio').Value := IBQEmbrionAux.FieldValues['id_estadio'];
    IBQModificarEmbriones.ParamByName('calidad').Value := IBQEmbrionAux.FieldValues['id_calidad'];
    IBQModificarEmbriones.ParamByName('destino').Value := IBQEmbrionAux.FieldValues['id_destino'];
    IBQModificarEmbriones.ParamByName('descripcion').Value := IBQEmbrionAux.FieldValues['id_descripcion'];
    IBQModificarEmbriones.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  try
    IBQDelAuxEmbriones.Close;
    IBQDelAuxEmbriones.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFListadoEmbriones.EAMSerieChange(Sender: TObject);
begin
  inherited;
  serie := EAMSerie.Text+'%';
  ActConsulta();
end;

procedure TFListadoEmbriones.EAMEnvaseChange(Sender: TObject);
begin
  inherited;
  envase := EAMEnvase.Text+'%';
  ActConsulta();
end;

procedure TFListadoEmbriones.DBLCBAEstadioCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBAEstadio.KeyValue <> null then
  begin
    estadio := DBLCBAEstadio.KeyValue;
    ActConsulta();
  end;
end;

procedure TFListadoEmbriones.DBLCBACalidadCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBACalidad.KeyValue <> null then
  begin
    calidad := DBLCBACalidad.KeyValue;
    ActConsulta();
  end;
end;

procedure TFListadoEmbriones.CBSerieClick(Sender: TObject);
begin
  inherited;
  EAMSerie.Enabled := CBSerie.Checked;
  EAMSerie.Text := '';
  serie := '%';
  ActConsulta();
end;

procedure TFListadoEmbriones.CBEnvaseClick(Sender: TObject);
begin
  inherited;
  EAMEnvase.Enabled := CBEnvase.Checked;
  EAMEnvase.Text := '';
  envase := '%';
  ActConsulta();
end;

procedure TFListadoEmbriones.CBEstadioClick(Sender: TObject);
begin
  inherited;
  DBLCBAEstadio.Enabled := CBEstadio.Checked;
  estadio := 0;
  ActConsulta();
end;

procedure TFListadoEmbriones.CBCalidadClick(Sender: TObject);
begin
  inherited;
  DBLCBACalidad.Enabled := CBCalidad.Checked;
  calidad := 0;
  ActConsulta();
end;

procedure TFListadoEmbriones.BBImprimirReporteClick(Sender: TObject);
var
  F : TFREPListadoEmbriones;
begin
  inherited;
  F := TFREPListadoEmbriones.Create(self);
  if por_fecha then
  begin
    F.QRLFDesde.Enabled := true;
    F.QRLFHasta.Enabled := true;
    F.QRLDesde.Enabled := true;
    F.QRLHasta.Enabled := true;
    F.QRLDesde.Caption := DateToStr(DTPADesde.Date);
    F.QRLHasta.Caption := DateToStr(DTPAHasta.Date);
    F.QRLGrupo.Enabled := false;
    F.QRLGrupoVal.Enabled := false;
  end
  else
  begin
    F.QRLFDesde.Enabled := false;
    F.QRLFHasta.Enabled := false;
    F.QRLDesde.Enabled := false;
    F.QRLHasta.Enabled := false;
    F.QRLGrupo.Enabled := true;
    F.QRLGrupoVal.Enabled := true;
    F.QRLGrupoVal.Caption := DBLCBAGrupos.Text;
  end;
  F.QRLCantEmbriones.Caption := IntToStr(IBQEmbriones.RecordCount);
  F.ShowModal;
  F.Destroy;
end;

procedure TFListadoEmbriones.IBQEmbrionesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQEmbriones.Last;
  IBQEmbriones.First;
  GBEmbriones.Caption := Traducir('Embriones [')+IntToStr(IBQEmbriones.RecordCount)+']';
  {BBImprimirReporte.Enabled := not IBQEmbriones.IsEmpty;
  BBXls.Enabled := not IBQEmbriones.IsEmpty;}
  LPreview.Enabled := not IBQEmbriones.IsEmpty;
  IPreview.Enabled := not IBQEmbriones.IsEmpty;
  LExpExcel.Enabled := not IBQEmbriones.IsEmpty;
  IExpExcel.Enabled := not IBQEmbriones.IsEmpty;
end;

procedure TFListadoEmbriones.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFListadoEmbriones.IBQEmbrionesCalcFields(DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('USADO').AsString = 'S' then
    IBQEmbrionesESTADO.Value := 'Transferido'
  else
    IBQEmbrionesESTADO.Value := '';
end;

end.
