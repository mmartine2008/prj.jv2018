unit UEveTransferenciaEmbrionaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, IBQuery, DB, IBCustomDataSet, WinXP, DataExport,
  DataToXLS, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids,
  DBGrids, UBDBGrid, MemoAuto, EditAuto, UFrameMangazo, Buttons, UClassType,
  DateTimePickerAuto, DBCtrls, UDBLookupComboBoxAuto, UDMSoftvet, ImgList,
  DateUtils, Types, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveTransferenciaEmbrionaria = class(TFEveSimple)
    GroupBox1: TGroupBox;
    LSincronizacion: TLabel;
    LTratamiento: TLabel;
    LDeteccion: TLabel;
    GBDatosAnimal: TGroupBox;
    DTPAFecha: TDateTimePickerAuto;
    Label1: TLabel;
    LResp: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    Label5: TLabel;
    DBLCBACentroTrans: TDBLookupComboBoxAuto;
    CBCondCorp: TCheckBox;
    DBLCBACondCorp: TDBLookupComboBoxAuto;
    Label6: TLabel;
    EACuerpoLuteo: TEditAuto;
    LUtero: TLabel;
    DBLCBAUtero: TDBLookupComboBoxAuto;
    DBLCBAUbicacion: TDBLookupComboBoxAuto;
    LUbicacion: TLabel;
    DBLCBADificultad: TDBLookupComboBoxAuto;
    LDificultad: TLabel;
    IBQUbicacion: TIBQuery;
    IBQUtero: TIBQuery;
    IBQDificultad: TIBQuery;
    IBQCondCorp: TIBQuery;
    IBQCentros: TIBQuery;
    DSCentros: TDataSource;
    DSCondCorp: TDataSource;
    DSDificultad: TDataSource;
    DSUtero: TDataSource;
    DSUbicacion: TDataSource;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_HBA: TIBStringField;
    IBDSSimpleNOMBRE: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleI2: TIntegerField;
    IBDSSimpleV2: TIBStringField;
    IBDSSimpleI3: TIntegerField;
    IBDSSimpleV3: TIBStringField;
    IBDSSimpleI4: TIntegerField;
    IBDSSimpleV4: TIBStringField;
    IBDSSimpleI5: TIntegerField;
    IBDSSimpleV5: TIBStringField;
    IBDSSimpleF1: TFloatField;
    IBDSSimpleF2: TFloatField;
    IBDSSimpleI8: TIntegerField;
    IBDSSimpleI9: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleI6: TIntegerField;
    IBDSSimpleV6: TIBStringField;
    Label10: TLabel;
    DBLCBACuernoUterino: TDBLookupComboBoxAuto;
    IBQCuernoUterino: TIBQuery;
    DSCuernoUterino: TDataSource;
    IBDSSimpleV11: TIBStringField;
    IBDSSimpleV7: TIBStringField;
    IBDSSimpleV8: TIBStringField;
    ILEmbriones: TImageList;
    IBDSSimpleV9: TIBStringField;
    IBDSSimpleV10: TIBStringField;
    IBDSSimpleVUNO1: TIBStringField;
    Panel1: TPanel;
    GBCelo: TGroupBox;
    LmensajeEventoCelo: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CBRegistrarCelo: TCheckBox;
    MEHorasPostCelo: TEdit;
    GBEmbrion: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    LMadre: TLabel;
    LPadre: TLabel;
    LEmbrion: TLabel;
    BBEmbrion: TBitBtn;
    EAEmbrion: TEditAuto;
    Label14: TLabel;
    EAPrecio: TEditAuto;
    IBDSSimpleF3: TFloatField;
    IBQActEmbriones: TIBQuery;
    IBQDatosEmbrion: TIBQuery;
    ISeleccionarEmbrion: TImage;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure LSincronizacionClick(Sender: TObject);
    procedure LTratamientoClick(Sender: TObject);
    procedure LDeteccionClick(Sender: TObject);
    procedure IBQAfterOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure BDBGSimpleDblClick(Sender: TObject);
    procedure BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CBCondCorpClick(Sender: TObject);
    procedure IBDSSimpleSetText(Sender: TField; const Text: String);
    procedure BDBGSimpleCellClick(Column: TColumn);
    procedure PCBasicoChange(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure BBEmbrionClick(Sender: TObject);
    procedure EAPrecioChange(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LRespClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure LUteroClick(Sender: TObject);
    procedure LUbicacionClick(Sender: TObject);
    procedure LDificultadClick(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure DTPAFechaChange(Sender: TObject);
    procedure ASacarAnimalExecute(Sender: TObject);
    procedure BBXlsImportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure BorrarAux();
    procedure ArmarFechaHoraCelo(FechaTrans : TDate; CantHoras : Integer;
      var FechaCelo : TDate; var HoraCelo : TTime);
    procedure AcomodarGrilla();
    procedure continuarGrilla;override;
    procedure configurarColumnasACargar;override;
  public
    Embrion : Integer;
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    procedure CargarDatosGrilla; override;
    procedure CargarParametrosMasivo; override;
    procedure LoadSQLStringList; override;
    procedure cargarDatos(i:integer);override;
    procedure HabilitarMenu(Habilitado : Boolean);
  end;

var
  FEveTransferenciaEmbrionaria: TFEveTransferenciaEmbrionaria;

implementation

uses
  UPrincipal, UDatosEmbriones, UMensajeHuella, UEveSincronizacionCelo, UEveTratamiento,
  UEveDeteccionCelo, USeleccionEmbrion, UImportacion, UEveFlushing, UTraduccion;

{$R *.dfm}

procedure TFEveTransferenciaEmbrionaria.FormCreate(Sender: TObject);
begin
  inherited;
  if Owner is TFEveFlushing then
  begin
    MSimple.IBQSeleccionados.Close;
    MSimple.IBQSeleccionados.SQL.Clear;
    MSimple.IBQSeleccionados.SQL.Add('select  ID_AUX,ID_RP,ID_SENASA,id_animal, id_pc, id_hba, id_otro, sexo from AUX_ANIMALES where id_animal > 0 and VUNO1 = ''S''');
    MSimple.IBQSeleccionados.Open;
  end;
  MSimple.SQLBasico := 'select id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, nombre, apodo from vis_transferencia';
  MSimple.PasarParametros(5,5);
  Embrion := 0;
  DTPAFecha.Date := Date();
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  IBQUbicacion.Close;
  IBQUbicacion.Open;
  IBQUtero.Close;
  IBQUtero.Open;
  IBQDificultad.Close;
  IBQDificultad.Open;
  IBQCondCorp.Close;
  IBQCondCorp.SQL.Clear;
  IBQCondCorp.SQL.Add('select id_condicion_corporal,'+FPrincipal.StringEscalaCC+' as valor from cod_condiciones_corporales');
  IBQCondCorp.Open;
  IBQCuernoUterino.Close;
  IBQCuernoUterino.Open;
  GBEmbrion.Visible := ModoEve = meIndividual;
  EAEmbrion.EsRequerido := ModoEve = meIndividual;
  HAbilitarMenu(True);
end;

procedure TFEveTransferenciaEmbrionaria.BorrarAux;
begin
  IBQDelEventosAux.Close;
  IBQDelEventosAux.Open;
end;

procedure TFEveTransferenciaEmbrionaria.LSincronizacionClick(
  Sender: TObject);
var
  F : TFEveSincronizacionCelo;
begin
  inherited;
  try
    F := TFEveSincronizacionCelo.Create(nil);
    F.ConManga := modoEve = meMasivo;
    F.ModoEve := ModoEve;
    BorrarAux();
    F.DTPAFecha.Date := DTPAFecha.Date;
    F.IDAnimal := IDAnimal;
    F.ShowModal;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveTransferenciaEmbrionaria.LTratamientoClick(Sender: TObject);
var
  F : TFEveTratamiento;
begin
  inherited;
  try
    F := TFEveTratamiento.Create(nil);
    F.ConManga := modoEve = meMasivo;
    F.ModoEve := ModoEve;
    F.DesdeFlushing := true;
    F.CBDiagnosticar.Visible := false;
    BorrarAux();
    F.DBLCBATipo.KeyValue := 6; //Solo tratamientos Hormonales
    F.DBLCBATipoCloseUp(nil); //Para que active las descripciones del tratamiento
    F.DBLCBATipo.Enabled := false;
    F.DTPAFecha.Date := DTPAFecha.Date;
    F.IDAnimal := IDAnimal;
    F.ShowModal;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveTransferenciaEmbrionaria.LDeteccionClick(Sender: TObject);
var
  F : TFEveDeteccionCelo;
begin
  inherited;
  try
    F := TFEveDeteccionCelo.Create(nil);
    F.ConManga := modoEve = meMasivo;
    F.ModoEve := ModoEve;
    BorrarAux();
    F.DTPAFecha.Date := DTPAFecha.Date;
    F.IDAnimal := IDAnimal;
    F.ShowModal;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveTransferenciaEmbrionaria.ArmarFechaHoraCelo(FechaTrans : TDate; CantHoras : Integer;
  var FechaCelo : TDate; var HoraCelo : TTime);
var
  FechaAux1, FechaAux2 : TDateTime;
  Anio, Mes, Dia, Hora, Min, Seg, MSeg : Word;
begin
  DecodeTime(DTPAFecha.Date,Hora,Min,Seg,Mseg);
  DecodeDate(FechaTrans,Anio,Mes,Dia);
  FechaAux1 := EncodeDateTime(Anio,Mes,Dia,Hora,Min,Seg,MSeg);

  FechaAux2 := IncHour(FechaAux1,-CantHoras);
  DecodeDate(FechaAux2,Anio,Mes,Dia);
  FechaCelo := EncodeDate(Anio,Mes,Dia);
  DecodeTime(FechaAux2,Hora,Min,Seg,MSeg);
  HoraCelo := EncodeTime(Hora,Min,Seg,MSeg);
end;

procedure TFEveTransferenciaEmbrionaria.CargarParametrosRN;
var
  val : double;
  FechaC : TDate;
  HoraC : TTime;
begin
  IBQSPRN.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  if ModoEve = meIndividual then
  begin
    val := 0;
    TryStrToFloat(MEHorasPostCelo.Text,val);
    ArmarFechaHoraCelo(DTPAFecha.Date,Trunc(val),FechaC,HoraC);
    IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
    IBQSPRN.ParamByName('fecha').AsDate := DTPAFecha.Date;
    IBQSPRN.ParamByName('embrion').AsInteger := Embrion;
    IBQSPRN.ParamByName('fecha_celo').AsDateTime := FechaC;
  end
  else
  begin
    IBQSPRN.ParamByName('animal').AsInteger := IBDSSimple.FieldValues['id_animal'];
    IBQSPRN.ParamByName('fecha').AsDate := IBDSSimple.FieldValues['fecha'];
    IBQSPRN.ParamByName('embrion').AsInteger := IBDSSimple.FieldValues['I8'];
    if IBDSSimple.FieldValues['F1'] <> null then
    begin
      ArmarFechaHoraCelo(IBDSSimple.FieldValues['fecha'],Trunc(IBDSSimple.FieldValues['F1']),FechaC,HoraC);
      IBQSPRN.ParamByName('fecha_celo').AsDate := FechaC;
    end
    else
      IBQSPRN.ParamByName('fecha_celo').Value := null;
  end;
end;

procedure TFEveTransferenciaEmbrionaria.CargarParametrosSP;
var
  valor : double;
  FechaC : TDate;
  HoraC : TTime;
begin
  IBQSPEventoInd.ParamByName('fecha').AsDate := DTPAFecha.Date;
  IBQSPEventoInd.ParamByName('animal').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('observacion').AsString := MAObservacion.Text;
  IBQSPEventoInd.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('responsable').AsInteger := DBLCBAResponsable.KeyValue;
  IBQSPEventoInd.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('log_fecha_modificado').AsDate := Date();
  IBQSPEventoInd.ParamByName('grupo').Value := null;
  IBQSPEventoInd.ParamByName('disparador').Value := null;
  valor := 0;
  TryStrToFloat(MEHorasPostCelo.Text,valor);
  ArmarFechaHoraCelo(DTPAFecha.Date,Trunc(valor),FechaC,HoraC);
  IBQSPEventoInd.ParamByName('fecha_celo').AsDate := FechaC;
  IBQSPEventoInd.ParamByName('horas_poscelo').AsTime := HoraC;
  valor := 0;
  TryStrToFloat(EACuerpoLuteo.Text,valor);
  IBQSPEventoInd.ParamByName('cuerpo_luteo').Value := valor;
  IBQSPEventoInd.ParamByName('utero').Value := DBLCBAUtero.KeyValue;
  IBQSPEventoInd.ParamByName('cuerno_uterino').Value := DBLCBACuernoUterino.KeyValue;
  IBQSPEventoInd.ParamByName('ubicacion').Value := DBLCBAUbicacion.KeyValue;
  IBQSPEventoInd.ParamByName('dificultad').Value := DBLCBADificultad.KeyValue;
  IBQSPEventoInd.ParamByName('centro_transplante').Value := DBLCBACentroTrans.KeyValue;
  if CBCondCorp.Checked then
    IBQSPEventoInd.ParamByName('cond_corp').Value := DBLCBACondCorp.KeyValue
  else
    IBQSPEventoInd.ParamByName('cond_corp').Value := null;
  IBQSPEventoInd.ParamByName('embrion').Value := Embrion;
  if CBRegistrarCelo.Checked then
    IBQSPEventoInd.ParamByName('reg_celo').Value := 1
  else
    IBQSPEventoInd.ParamByName('reg_celo').Value := null;
  valor := 0;
  TryStrToFloat(EAPrecio.Text,valor);
  IBQSPEventoInd.ParamByName('precio').Value := valor;
end;

procedure TFEveTransferenciaEmbrionaria.CargarDatosGrilla;
var
  val_d : double;
begin
  if Owner is TFEveFlushing then
  begin
    IBQDatosEmbrion.Close;
    IBQDatosEmbrion.ParamByName('id').AsInteger := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBQDatosEmbrion.Open;
    if not IBQDatosEmbrion.IsEmpty then
    begin
      IBDSSimple.FieldByName('I8').Value := IBQDatosEmbrion.FieldValues['embrion'];
      IBDSSimple.FieldByName('V8').Value := IBQDatosEmbrion.FieldValues['V1'];
      IBDSSimple.FieldByName('V9').Value := IBQDatosEmbrion.FieldValues['V2'];
      IBDSSimple.FieldByName('V10').Value := IBQDatosEmbrion.FieldValues['V3'];
    end;
  end;
  IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
  IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
  IBDSSimple.FieldByName('ID_SENASA').Value :=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
  RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('fecha')],[DTPAFecha.Date]);
  RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('I6'),IBDSSimple.FieldByName('V6')],[DBLCBAResponsable.KeyValue,DBLCBAResponsable.Text]);
  RealizarCambio(DBLCBACentroTrans,[IBDSSimple.FieldByName('I1'),IBDSSimple.FieldByName('V1')],[DBLCBACentroTrans.KeyValue,DBLCBACentroTrans.Text]);
  val_d := 0;
  TryStrToFloat(MEHorasPostCelo.Text,val_d);
  RealizarCambio(MEHorasPostCelo,[IBDSSimple.FieldByName('F1')],[val_d]);
  RealizarCambio(DBLCBACondCorp,[IBDSSimple.FieldByName('I2'),IBDSSimple.FieldByName('V2')],[DBLCBACondCorp.KeyValue,DBLCBACondCorp.Text]);
  val_d := 0;
  TryStrToFloat(EACuerpoLuteo.Text,val_d);
  RealizarCambio(EACuerpoLuteo,[IBDSSimple.FieldByName('F2')],[val_d]);
  RealizarCambio(DBLCBAUtero,[IBDSSimple.FieldByName('I3'),IBDSSimple.FieldByName('V3')],[DBLCBAUtero.KeyValue,DBLCBAUtero.Text]);
  RealizarCambio(DBLCBAUbicacion,[IBDSSimple.FieldByName('I4'),IBDSSimple.FieldByName('V4')],[DBLCBAUbicacion.KeyValue,DBLCBAUbicacion.Text]);
  RealizarCambio(DBLCBADificultad,[IBDSSimple.FieldByName('I5'),IBDSSimple.FieldByName('V5')],[DBLCBADificultad.KeyValue,DBLCBADificultad.Text]);
  RealizarCambio(DBLCBACuernoUterino,[IBDSSimple.FieldByName('V11'),IBDSSimple.FieldByName('V7')],[DBLCBACuernoUterino.KeyValue,DBLCBACuernoUterino.Text]);
  if CBRegistrarCelo.Checked then
    RealizarCambio(CBRegistrarCelo,[IBDSSimple.FieldByName('VUNO1')],[1])
  else
    RealizarCambio(CBRegistrarCelo,[IBDSSimple.FieldByName('VUNO1')],[0]);
  val_d := 0;
  TryStrToFloat(EAPrecio.Text,val_d);
  RealizarCambio(EAPrecio,[IBDSSimple.FieldByName('F3')],[val_d]);
end;

procedure TFEveTransferenciaEmbrionaria.CargarParametrosMasivo;
var
  FechaC : TDate;
  HoraC : TTime;
begin
  IBQSPEventoInd.ParamByName('fecha').AsDate := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('animal').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('observacion').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('establecimiento').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('responsable').Value := IBDSSimple.FieldValues['I6'];
  IBQSPEventoInd.ParamByName('log_usuario').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('log_fecha_modificado').AsDate := Date();
  IBQSPEventoInd.ParamByName('grupo').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;
  IBQSPEventoInd.ParamByName('disparador').Value := null;
  ArmarFechaHoraCelo(IBDSSimple.FieldValues['FECHA'],Trunc(IBDSSimple.FieldValues['F1']),FechaC,HoraC);
  IBQSPEventoInd.ParamByName('fecha_celo').AsDate := FechaC;
  IBQSPEventoInd.ParamByName('horas_poscelo').AsTime := HoraC;
  IBQSPEventoInd.ParamByName('cuerpo_luteo').Value := IBDSSimple.FieldValues['F2'];
  IBQSPEventoInd.ParamByName('utero').Value := IBDSSimple.FieldValues['I3'];
  IBQSPEventoInd.ParamByName('cuerno_uterino').Value := IBDSSimple.FieldValues['V11'];
  IBQSPEventoInd.ParamByName('ubicacion').Value := IBDSSimple.FieldValues['I4'];
  IBQSPEventoInd.ParamByName('dificultad').Value := IBDSSimple.FieldValues['I5'];
  IBQSPEventoInd.ParamByName('centro_transplante').Value := IBDSSimple.FieldValues['I1'];
  if CBCondCorp.Checked then
    IBQSPEventoInd.ParamByName('cond_corp').Value := IBDSSimple.FieldValues['I2']
  else
    IBQSPEventoInd.ParamByName('cond_corp').Value := null;
  IBQSPEventoInd.ParamByName('embrion').Value := IBDSSimple.FieldValues['I8'];
  if IBDSSimple.FieldValues['VUNO1'] = 1 then
    IBQSPEventoInd.ParamByName('reg_celo').Value := IBDSSimple.FieldValues['VUNO1']
  else
    IBQSPEventoInd.ParamByName('reg_celo').Value := null;
  IBQSPEventoInd.ParamByName('precio').Value := IBDSSimple.FieldValues['F3'];
end;

procedure TFEveTransferenciaEmbrionaria.LoadSQLStringList;
begin
  SQLStringList.AddObject('V1',TObject(DSCentros));
  SQLStringList.AddObject('V2',TObject(DSCondCorp));
  SQLStringList.AddObject('V3',TObject(DSUtero));
  SQLStringList.AddObject('V4',TObject(DSUbicacion));
  SQLStringList.AddObject('V5',TObject(DSDificultad));
  SQLStringList.AddObject('V6',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('V7',TObject(DSCuernoUterino));
end;

procedure TFEveTransferenciaEmbrionaria.IBQAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

procedure TFEveTransferenciaEmbrionaria.Button1Click(Sender: TObject);
var
  F : TFSeleccionEmbrion;
begin
  inherited;
  F := TFSeleccionEmbrion.Create(nil,nil);
  F.Embrion := @Embrion;
  F.ShowModal;
  F.Destroy;
end;

procedure TFEveTransferenciaEmbrionaria.BDBGSimpleDblClick(
  Sender: TObject);
var
  F : TFSeleccionEmbrion;
  E : Integer;
  M, P, I : String;
begin
  //inherited;
  if BDBGSimple.SelectedIndex = BDBGSimple.ColumnByField('I8').Index then
  begin
    if IBDSSimple.FieldValues['I8'] <> null then
    begin
      if IBDSSimple.FieldValues['I8'] > 0 then
      begin
        E := IBDSSimple.FieldValues['I8'];
        M := IBDSSimple.FieldValues['V8'];
        P := IBDSSimple.FieldValues['V9'];
        I := IBDSSimple.FieldValues['V10'];
      end;
    end
    else
      E := 0;
    F := TFSeleccionEmbrion.Create(nil,IBDSSimple);
    F.Embrion := @E;
    F.Madre := @M;
    F.Padre := @P;
    F.Info_Embrion := @I;
    F.ShowModal;
    F.Destroy;
    IBDSSimple.Edit;
    IBDSSimple.FieldValues['I8'] := E;
    if E > 0 then
    begin
      IBDSSimple.FieldValues['V8'] := M;
      IBDSSimple.FieldValues['V9'] := P;
      IBDSSimple.FieldValues['V10'] := I;
    end;
  end
end;

procedure TFEveTransferenciaEmbrionaria.BDBGSimpleDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bitmap : TBitmap;
  CheckBoxRectangle : TRect;
  val : integer;
  i : integer;
Const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  inherited;
  if Column.FieldName = 'VUNO1' then
  begin
    if VarType(Column.Field.Value) = varString then
    begin
      if TryStrToInt(Column.Field.Value,val) then
      begin
        BDBGSimple.Canvas.FillRect(Rect);
        CheckBoxRectangle.Left := Rect.Left + 15;
        CheckBoxRectangle.Right := Rect.Right - 15;
        CheckBoxRectangle.Top := Rect.Top + 15;
        CheckBoxRectangle.Bottom := Rect.Bottom - 15;
        if (val = 0) then
          DrawFrameControl(BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false])
        else
          DrawFrameControl(BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true]);
      end;
    end;
  end;
  if Column.FieldName = 'I8' then
  begin
    bitmap := TBitmap.Create;
    if IBDSSimple.FieldByName('I8').AsInteger = 0 then
      ILEmbriones.GetBitmap(0,bitmap)
    else
      ILEmbriones.GetBitmap(1,bitmap);
    BDBGSimple.Canvas.StretchDraw(Rect,bitmap);
  end;
  for i := 0 to BDBGSimple.RowCount-1 do
    BDBGSimple.RowHeights[i] := 46;
end;

procedure TFEveTransferenciaEmbrionaria.CBCondCorpClick(Sender: TObject);
begin
  inherited;
  DBLCBACondCorp.Enabled := CBCondCorp.Checked;
  BDBGSimple.Columns[10].Visible := CBCondCorp.Checked;
  if CBCondCorp.Checked then
    DBLCBACondCorp.KeyValue := 1;
end;

procedure TFEveTransferenciaEmbrionaria.IBDSSimpleSetText(Sender: TField;
  const Text: String);
var
  PickPos : Integer;
  val : Double;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    if (Sender.FieldName = 'V6') then  //Responsable
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
      IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
        PickPos := BDBGSimple.ColumnByField('V6').PickList.IndexOf(BDBGSimple.ColumnByField('V6').Field.AsString);
        IBDSSimple.FieldByName('I6').Value :=  TClassType(BDBGSimple.ColumnByField('V6').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V1') then  //Centros de Transplante
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from centros_transplante where nombre like '''+UpperCase(Text)+'%''');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V1').PickList.IndexOf(BDBGSimple.ColumnByField('V1').Field.AsString);
        IBDSSimple.FieldByName('I1').Value :=  TClassType(BDBGSimple.ColumnByField('V1').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V3') then  //Utero
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_utero_transferencia where nombre like '''+UpperCase(Text)+'%''');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V3').PickList.IndexOf(BDBGSimple.ColumnByField('V3').Field.AsString);
        IBDSSimple.FieldByName('I3').Value :=  TClassType(BDBGSimple.ColumnByField('V3').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V7') then  //Cuerno Uterino
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select valor from cod_genericos where id_codigo = ''L'' and valor like '''+UpperCase(Text)+'%''');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
        PickPos := BDBGSimple.ColumnByField('V7').PickList.IndexOf(BDBGSimple.ColumnByField('V7').Field.AsString);
        IBDSSimple.FieldByName('V11').Value :=  TClassType(BDBGSimple.ColumnByField('V7').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V4') then  //Ubicacion
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_ubicacion_transferencia where nombre like '''+UpperCase(Text)+'%''');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V4').PickList.IndexOf(BDBGSimple.ColumnByField('V4').Field.AsString);
        IBDSSimple.FieldByName('I4').Value :=  TClassType(BDBGSimple.ColumnByField('V4').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V5') then  //Dificultad
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_dificultad_transferencia where nombre like '''+UpperCase(Text)+'%''');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V5').PickList.IndexOf(BDBGSimple.ColumnByField('V5').Field.AsString);
        IBDSSimple.FieldByName('I5').Value :=  TClassType(BDBGSimple.ColumnByField('V5').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V2') then  //Condicion Corporal
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select '+FPrincipal.StringEscalaCC+' as escala from cod_condiciones_corporales where '+FPrincipal.StringEscalaCC+' = :valor');
      val := 0;
      TryStrToFloat(Text,val);
      IBQValidaciones.ParamByName('valor').AsFloat := val;
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('escala').AsString;
        PickPos := BDBGSimple.ColumnByField('V2').PickList.IndexOf(BDBGSimple.ColumnByField('V2').Field.AsString);
        IBDSSimple.FieldByName('I2').Value :=  TClassType(BDBGSimple.ColumnByField('V2').PickList.Objects[PickPos]).getValue;
      end;
    end;
  end;
end;

procedure TFEveTransferenciaEmbrionaria.BDBGSimpleCellClick(
  Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'VUNO1' then
  begin
    Column.Field.DataSet.Edit;
    if(Column.Field.AsInteger = 0)then
      Column.Field.AsInteger := 1
    else
      Column.Field.AsInteger := 0;
    Column.Field.DataSet.Post;
  end;
end;

procedure TFEveTransferenciaEmbrionaria.PCBasicoChange(Sender: TObject);
begin
  inherited;
  GBEmbrion.Visible := ModoEve = meIndividual;
  EAEmbrion.EsRequerido := ModoEve = meIndividual;
  if PCBasico.ActivePage = TSGrilla then
    AcomodarGrilla;
end;

procedure TFEveTransferenciaEmbrionaria.ATerminarExecute(Sender: TObject);
var
  TodosCargados : Boolean;
begin
  if ModoEve = meMasivo then
  begin
    TodosCargados := true;
    IBDSSimple.First;
    while not IBDSSimple.Eof do
      if IBDSSimple.FieldByName('I8').AsInteger > 0 then
        IBDSSimple.Next
      else
      begin
        TodosCargados := false;
        break;
      end;
  end;
  if TodosCargados then
    inherited
  else
    MostrarMensaje(tmError,'No se le implantaron embriones a todos los animales');
end;

procedure TFEveTransferenciaEmbrionaria.BBEmbrionClick(Sender: TObject);
var
  F : TFSeleccionEmbrion;
  E : Integer;
  M, P, I : String;
begin
  E := Embrion;
  F := TFSeleccionEmbrion.Create(nil,nil);
  F.Embrion := @E;
  F.Madre := @M;
  F.Padre := @P;
  F.Info_Embrion := @I;
  F.ShowModal;
  F.Destroy;
  Embrion := E;
  if E > 0 then
  begin
    EAEmbrion.Text := IntToStr(E);
    LMadre.Caption := M;
    LPadre.Caption := P;
    LEmbrion.Caption := I;
  end
  else
  begin
    EAEmbrion.Clear;
    LMadre.Caption := '-';
    LPadre.Caption := '-';
    LEmbrion.Caption := '-';
  end
end;

procedure TFEveTransferenciaEmbrionaria.EAPrecioChange(Sender: TObject);
var
  valor : Double;
begin
  inherited;
  if not TryStrToFloat(EAPrecio.Text,valor) then
    EAPrecio.Text := '0';
end;

procedure TFEveTransferenciaEmbrionaria.LabelMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      (Sender as TLabel).Font.Color:= $00606C02;
      (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveTransferenciaEmbrionaria.LabelMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      (Sender as TLabel).Font.Color:= clWindowText;
      (Sender as TLabel).Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveTransferenciaEmbrionaria.LRespClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveTransferenciaEmbrionaria.Label5Click(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMCentrosTransplantesExecute(self);
    IBQCentros.Close;
    IBQCentros.Open;
  end;
end;

procedure TFEveTransferenciaEmbrionaria.LUteroClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMUteroTransferenciaExecute(self);
    IBQUtero.Close;
    IBQUtero.Open;
  end;
end;

procedure TFEveTransferenciaEmbrionaria.LUbicacionClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMUbicacionTransferenciaExecute(self);
    IBQUbicacion.Close;
    IBQUbicacion.Open;
  end;
end;

procedure TFEveTransferenciaEmbrionaria.LDificultadClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMDificultadTransferenciaExecute(self);
    IBQDificultad.Close;
    IBQDificultad.Open;
  end;
end;

procedure TFEveTransferenciaEmbrionaria.cargarDatos(i:integer);
var str:string;
begin
  inherited;
  DBLCBAResponsable.KeyValue:=0;
  DBLCBACentroTrans.KeyValue:=0;
  //DBLCBACuernoUterino.KeyValue:='IZ';
  //DBLCBAUbicacion.KeyValue:=0;
  EAEmbrion.Text:='0';

  if getDato('registrar celo',anim[i])='1' then
    IBDSSimple.FieldByName('VUNO1').Value:=1
  else
    IBDSSimple.FieldByName('VUNO1').Value:=0;

  msimple.IBQDisponibles.Locate('ID_ANIMAL',IBDSSimple.FieldByName('ID_ANIMAL').Value,[]);
  IBDSSimple.FieldByName('ID_SENASA').Value :=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
  IBDSSimple.FieldByName('V6').AsString:=getDato('responsable',anim[i]);
  IBDSSimple.FieldByName('I6').AsInteger:=DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V6').AsString,'ID_EMPLEADO');
  DBLCBACentroTrans.ListSource.DataSet.Close;
  DBLCBACentroTrans.ListSource.DataSet.Open;
  str:=getDato('centro',anim[i]);
  if DBLCBACentroTrans.ListSource.DataSet.Lookup('NOMBRE',str,'ID_CENTRO_TRANSPLANTE')<>null then
    begin
    IBDSSimple.FieldByName('V1').AsString:=str;
    IBDSSimple.FieldByName('I1').AsInteger:=DBLCBACentroTrans.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V1').AsString,'ID_CENTRO_TRANSPLANTE');
    end
  else
    begin
    IBDSSimple.FieldByName('V1').AsString:='NO DEFINIDO';
    IBDSSimple.FieldByName('I1').AsInteger:=DBLCBACentroTrans.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V1').AsString,'ID_CENTRO_TRANSPLANTE');
    end;
  str:=getDato('horas',anim[i]);
  if str<>'' then
    IBDSSimple.FieldByName('F1').Value:=str;
  if CBCondCorp.Checked then
    begin
    str:=getDato('condición c',anim[i]);
    if str<>'' then
      begin
      IBDSSimple.FieldByName('V2').Value:=str;
      IBDSSimple.FieldByName('I2').AsInteger:=DBLCBACondCorp.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('V2').Value,'ID_CONDICION_CORPORAL');
      end;
    end;
  str:=getDato('cuerpo lúteo',anim[i]);
  if str<>'' then
    IBDSSimple.FieldByName('F2').Value:=strtofloat(str);
  str:=getDato('utero',anim[i]);
  if str<>'' then
    begin
    IBDSSimple.FieldByName('V3').AsString:=str;
    IBDSSimple.FieldByName('I3').AsInteger:=DBLCBAUtero.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V3').AsString,'ID_UTERO_TRANSFERENCIA');
    end;
  IBDSSimple.FieldByName('V4').Asstring:=getDato('ubicación',anim[i]);
  IBDSSimple.FieldByName('I4').AsInteger:=DBLCBAUbicacion.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V4').Asstring,'ID_UBICACION_TRANSFERENCIA');
  str:=getDato('dificultad',anim[i]);
  if str<>'' then
    begin
    IBDSSimple.FieldByName('V5').AsString:=str;
    IBDSSimple.FieldByName('I5').AsInteger:=DBLCBADificultad.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V5').Asstring,'ID_DIFICULTAD_TRANSFERENCIA');
    end;
  IBDSSimple.FieldByName('V7').AsString:=getDato('cuerno',anim[i]);
  IBDSSimple.FieldByName('V11').AsString:=DBLCBACuernoUterino.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('V7').Asstring,'TIPO');
  str:=getDato('precio',anim[i]);
  if str<>'' then
    IBDSSimple.FieldByName('F3').Value:=strtofloat(str);
end;

procedure TFEveTransferenciaEmbrionaria.IBDSSimpleID_RPSetText(
  Sender: TField; const Text: String);
begin
  inherited;
  //hereda de evesimple
end;

procedure TFEveTransferenciaEmbrionaria.DTPAFechaChange(Sender: TObject);
begin
  inherited;
  if CompareDate(DTPAFecha.Date,Date()) = GreaterThanValue then
    DTPAFecha.Date := Date();
end;

procedure TFEveTransferenciaEmbrionaria.HabilitarMenu(Habilitado : Boolean);
begin
  LSincronizacion.Enabled := Habilitado;
  LTratamiento.Enabled := Habilitado;
  LDeteccion.Enabled := Habilitado;
end;

procedure TFEveTransferenciaEmbrionaria.AcomodarGrilla;
begin
  BDBGSimple.Columns[0].Width := 50;
  BDBGSimple.Columns[1].Width := 69;
  BDBGSimple.Columns[2].Width := 64;
  BDBGSimple.Columns[3].Width := 64;
  BDBGSimple.Columns[4].Width := 64;
  BDBGSimple.Columns[5].Width := 130;
  BDBGSimple.Columns[6].Width := 61;
  BDBGSimple.Columns[7].Width := 56;
  BDBGSimple.Columns[8].Width := 55;
  BDBGSimple.Columns[9].Width := 46;
  BDBGSimple.Columns[10].Width := 51;
  if BDBGSimple.Columns[11].Visible then
    BDBGSimple.Columns[11].Width := 52;
  BDBGSimple.Columns[12].Width := 51;
  BDBGSimple.Columns[13].Width := 51;
  BDBGSimple.Columns[14].Width := 39;
  BDBGSimple.Columns[15].Width := 96;
  BDBGSimple.Columns[16].Width := 74;
  BDBGSimple.Columns[17].Width := 79;
end;

procedure TFEveTransferenciaEmbrionaria.ASacarAnimalExecute(
  Sender: TObject);
begin
  inherited;
  PCBasicoChange(nil);
end;

procedure TFEveTransferenciaEmbrionaria.BBXlsImportClick(Sender: TObject);
begin
  inherited;
  AcomodarGrilla;
end;

procedure TFEveTransferenciaEmbrionaria.continuarGrilla;
begin
  inherited;
  AcomodarGrilla;
end;

procedure TFEveTransferenciaEmbrionaria.configurarColumnasACargar;
begin
if ExisteCampo('Condición Corporal') then CBCondCorp.Checked:=true;
end;

procedure TFEveTransferenciaEmbrionaria.FormShow(Sender: TObject);
begin
  inherited;
  if (Owner is TFEveFlushing) and (ModoEve = meIndividual) then
  begin
    IBQDatosEmbrion.Close;
    IBQDatosEmbrion.ParamByName('id').AsInteger := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBQDatosEmbrion.Open;
    if not IBQDatosEmbrion.IsEmpty then
    begin
      BBEmbrion.Caption := Traducir('Cambiar Embrión');
      Embrion := IBQDatosEmbrion.FieldValues['EMBRION'];
      EAEmbrion.Text := IBQDatosEmbrion.FieldValues['EMBRION'];
      LMadre.Caption := IBQDatosEmbrion.FieldValues['V1'];
      LPadre.Caption := IBQDatosEmbrion.FieldValues['V2'];
      LEmbrion.Caption := IBQDatosEmbrion.FieldValues['V3'];
    end;
  end;
end;

end.
