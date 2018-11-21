unit UEveImportarPartosNacimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, ExtCtrls, IBQuery, DB, IBCustomDataSet, WinXP,
  DataExport, DataToXLS, IBStoredProc, ActnList, ComCtrls, StdCtrls, Grids,
  DBGrids, UBDBGrid, MemoAuto, EditAuto, UFrameMangazo, Buttons, Menus,
  UClassType, ImgList, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint,
  xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TRegPadreMadre = record
    id_animal : Integer;
    id_padre : Integer;
    id_madre : Integer;
    padre_ext : String;
    madre_ext : String;
  end;

  TArrPadresMadres = Array of TRegPadreMadre;

  TFEveImportarPartosNacimientos = class(TFEveSimple)
    PopupMenu1: TPopupMenu;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleV2: TIBStringField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleI3: TIntegerField;
    IBDSSimpleV3: TIBStringField;
    IBDSSimpleI4: TIntegerField;
    IBDSSimpleV4: TIBStringField;
    IBDSSimpleI5: TIntegerField;
    IBDSSimpleV5: TIBStringField;
    IBDSSimpleV6: TIBStringField;
    IBDSSimpleV7: TIBStringField;
    IBDSSimpleV8: TIBStringField;
    IBDSSimpleID_PC: TIBStringField;
    IBDSSimpleI6: TIntegerField;
    IBDSSimpleV9: TIBStringField;
    IBDSSimpleI7: TIntegerField;
    IBDSSimpleV10: TIBStringField;
    IBDSSimpleI8: TIntegerField;
    IBDSSimpleV11: TIBStringField;
    IBDSSimpleID_HBA: TIBStringField;
    IBDSSimpleNOMBRE: TIBStringField;
    IBDSSimpleID_OTRO: TIBStringField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleI9: TIntegerField;
    IBQCondicionCorporal: TIBQuery;
    DSCondicionCorporal: TDataSource;
    IBDSSimpleVUNO1: TIBStringField;
    IBQCategorias: TIBQuery;
    DSCategorias: TDataSource;
    IBQAnimalInt: TIBQuery;
    IBQAnimalExt: TIBQuery;
    IBDSSimpleI2: TIntegerField;
    IBDSSimpleAPODO: TIBStringField;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleDTA_BAJA: TIBStringField;
    IBQAgregarPadre: TIBQuery;
    IBQBorrarAuxExt: TIBQuery;
    BitBtn1: TBitBtn;
    IBQColor: TIBQuery;
    DSColor: TDataSource;
    IBDSSimpleI10: TIntegerField;
    IBDSSimpleV13: TIBStringField;
    IBDSSimpleV14: TIBStringField;
    IBDSSimpleOBSERVACION2: TIBStringField;
    IBDSSimpleOBSERVACION3: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure PcBasicoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure TSGrillaShow(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure IBDSSimpleV2SetText(Sender: TField; const Text: String);
  private
    ArrPadresMadres : TArrPadresMadres;
    procedure CargarParametrosMasivo; override;
    procedure CargarParametrosRN; override;
    procedure LoadSQLStringList; override;
    procedure cargarDatos(i:integer); override;
    procedure AjustarColumnas();
    function CheckPadresyMadres() : Boolean;
    function BuscarAnimal(id_animal : Integer) : Integer;
    procedure AgregarPadre(I : Integer; RP : String);
    procedure BorrarAux(id : Integer);
    procedure InicIBQs;
  public
    { Public declarations }
  end;

var
  FEveImportarPartosNacimientos: TFEveImportarPartosNacimientos;

implementation

{$R *.dfm}

uses
  UPrincipal, UDMSoftvet, UImportacion, UMensajeAnimalesNuevos, UMovCargarDatos;

procedure TFEveImportarPartosNacimientos.InicIBQs;
begin
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQTiposParto.Close;
  DMSoftvet.IBQTiposParto.Open;
  DMSoftvet.IBQCausaDistocia.Close;
  DMSoftvet.IBQCausaDistocia.Open;
  DMSoftvet.IBQGradoAsistencia.Close;
  DMSoftvet.IBQGradoAsistencia.Open;
  DMSoftvet.IBQTipoSexo.Close;
  DMSoftvet.IBQTipoSexo.Open;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').AsString := 'SN';
  DMSoftvet.IBQCodigosGenericos.Open;
  IBQCategorias.Close;
  IBQCategorias.Open;
  IBQCondicionCorporal.Close;
  IBQCondicionCorporal.SQL.Clear;
  IBQCondicionCorporal.SQL.Add('select id_condicion_corporal,'+FPrincipal.StringEscalaCC+' from cod_condiciones_corporales');
  IBQCondicionCorporal.Open;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  DMSoftvet.IBQRodeo.Close;
  DMsoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  IBQColor.Close;
  IBQColor.Open;
  MSimple.PasarParametros(0,1);
end;

procedure TFEveImportarPartosNacimientos.FormCreate(Sender: TObject);
begin
  inherited;
  MSimple.SQLBasico := 'select * from vis_parto';
  BBAnterior.Visible := false;
  BBSiguiente.Visible := false;
  BBTerminar.Enabled := false;
  BSacarAnimal.Visible := false;
  SBSelTodos.Visible := false;
  InicIBQs;
end;

procedure TFEveImportarPartosNacimientos.CargarParametrosMasivo;
var
  I : Integer;
  V6: Variant;
begin
  inherited;
  IBQSPEventoInd.ParamByName('fecha').AsDate := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('responsable').value := IBDSSimple.FieldValues['RESPONSABLE'];
  IBQSPEventoInd.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('log_fecha_modificado').AsDateTime := now;
  IBQSPEventoInd.ParamByName('animal').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('disparador').Value := NULL;
  IBQSPEventoInd.ParamByName('potrero').Value := IBDSSimple.FieldValues['I2'];
  IBQSPEventoInd.ParamByName('rodeo').Value := IBDSSimple.FieldValues['ID_AUX_EVENTO'];


  I := BuscarAnimal(IBDSSimple.FieldValues['ID_ANIMAL']);
  if (ArrPadresMadres[I].id_madre <> 0) and (ArrPadresMadres[I].id_madre <> -1) then
    IBQSPEventoInd.ParamByName('madre_biologica').Value := ArrPadresMadres[I].id_madre
  else
    IBQSPEventoInd.ParamByName('madre_biologica').Value := null;

  if IBDSSimple.FieldValues['I1'] = 2 then
  begin
    IBQSPEventoInd.ParamByName('causa').AsInteger := IBDSSimple.FieldValues['I3'];
    IBQSPEventoInd.ParamByName('grado').AsInteger := IBDSSimple.FieldValues['I4'];
  end
  else
  begin
    IBQSPEventoInd.ParamByName('causa').Value := null;
    IBQSPEventoInd.ParamByName('grado').Value := null;
  end;

  IBQSPEventoInd.ParamByName('observacion').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('condicion_corporal').Value := IBDSSimple.FieldValues['I5'];
  IBQSPEventoInd.ParamByName('cantidad').AsInteger := 1;
  IBQSPEventoInd.ParamByName('sexo0').AsInteger := IBDSSimple.FieldValues['I6'];
  IBQSPEventoInd.ParamByName('vivo0').AsString := IBDSSimple.FieldValues['VUNO1'];
  IBQSPEventoInd.ParamByName('peso0').Value := IBDSSimple.FieldValues['I8'];
  if IBDSSimple.FieldValues['I10'] <> null then
    IBQSPEventoInd.ParamByName('COLOR0').Value := IBDSSimple.FieldValues['I10']
  else
    IBQSPEventoInd.ParamByName('COLOR0').Value := 0;
  if (IBDSSimple.FieldValues['ID_PC'] = 'N/N') or (IBDSSimple.FieldValues['ID_PC'] = 'NN') then
    IBQSPEventoInd.ParamByName('rp0').Value := null
  else
    IBQSPEventoInd.ParamByName('rp0').AsString := IBDSSimple.FieldValues['ID_PC'];
  IBQSPEventoInd.ParamByName('sen0').Value := null;
  IBQSPEventoInd.ParamByName('pc0').Value := null;
  IBQSPEventoInd.ParamByName('hba0').Value := IBDSSimple.FieldValues['ID_HBA'];
  IBQSPEventoInd.ParamByName('ra0').Value := null;
  IBQSPEventoInd.ParamByName('otro0').Value := null;
  IBQSPEventoInd.ParamByName('ie0').Value := IBDSSimple.FieldValues['V14'];
  IBQSPEventoInd.ParamByName('NOMBRE0').Value := IBDSSimple.FieldValues['NOMBRE'];
  IBQSPEventoInd.ParamByName('sexo1').AsInteger := 0;
  IBQSPEventoInd.ParamByName('vivo1').AsString := '';
  IBQSPEventoInd.ParamByName('peso1').AsInteger := 0;
  IBQSPEventoInd.ParamByName('rp1').value := '';
  IBQSPEventoInd.ParamByName('sen1').Value := '';
  IBQSPEventoInd.ParamByName('pc1').Value := '';
  IBQSPEventoInd.ParamByName('hba1').Value := '';
  IBQSPEventoInd.ParamByName('ra1').Value := '';
  IBQSPEventoInd.ParamByName('otro1').Value := '';
  IBQSPEventoInd.ParamByName('ie1').Value := '';
  IBQSPEventoInd.ParamByName('COLOR1').Value := 0;
  IBQSPEventoInd.ParamByName('NOMBRE1').Value := '';
  IBQSPEventoInd.ParamByName('sexo2').AsInteger := 0;
  IBQSPEventoInd.ParamByName('vivo2').AsString := '';
  IBQSPEventoInd.ParamByName('peso2').AsInteger := 0;
  IBQSPEventoInd.ParamByName('rp2').value := '';
  IBQSPEventoInd.ParamByName('sen2').Value := '';
  IBQSPEventoInd.ParamByName('pc2').Value := '';
  IBQSPEventoInd.ParamByName('hba2').Value := '';
  IBQSPEventoInd.ParamByName('ra2').Value := '';
  IBQSPEventoInd.ParamByName('otro2').Value := '';
  IBQSPEventoInd.ParamByName('ie2').Value := '';
  IBQSPEventoInd.ParamByName('COLOR2').Value := 0;
  IBQSPEventoInd.ParamByName('NOMBRE2').Value := '';
  IBQSPEventoInd.ParamByName('apodo0').Value := '';
  IBQSPEventoInd.ParamByName('apodo1').Value := '';
  IBQSPEventoInd.ParamByName('apodo2').Value := '';
  IBQSPEventoInd.ParamByName('observacion_nacimientos').Value := IBDSSimple.FieldValues['OBSERVACION'];

  if (ArrPadresMadres[I].id_padre <> 0) and (ArrPadresMadres[I].id_padre <> -1) then
  begin
    IBQSPEventoInd.ParamByName('padre').Value := ArrPadresMadres[I].id_padre;
    V6 := IBDSSimple.FieldValues['V6'];
    if VarIsNull(V6) then
    begin
       ShowMessage('El animal id :'+inttostr(I)+' ID_PC: '+IBDSSimple.FieldValues['ID_PC']+' no tiene padre valido');
    end
    else
    begin
      AgregarPadre(I, V6);
    end;
  end
  else
    IBQSPEventoInd.ParamByName('padre').Value := null;

end;

procedure TFEveImportarPartosNacimientos.AgregarPadre(I : Integer; RP : String);
begin
  try
    IBQAgregarPadre.Close;
    IBQAgregarPadre.ParamByName('id_animal_externo').AsInteger := ArrPadresMadres[I].id_padre;
    IBQAgregarPadre.ParamByName('id_aux').AsInteger := ArrPadresMadres[I].id_padre;
    IBQAgregarPadre.ParamByName('id_rp').AsString := RP;
    IBQAgregarPadre.ParamByName('sexo').AsInteger := 1;
    if ArrPadresMadres[I].padre_ext = 'S' then
      IBQAgregarPadre.ParamByName('interno').AsString := 'N'
    else
      IBQAgregarPadre.ParamByName('interno').AsString := 'S';
    IBQAgregarPadre.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFEveImportarPartosNacimientos.BorrarAux(id : Integer);
begin
  try
    IBQBorrarAuxExt.Close;
    IBQBorrarAuxExt.ParamByName('id').AsInteger := id;
    IBQBorrarAuxExt.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFEveImportarPartosNacimientos.CargarParametrosRN;
begin
  IBQSPRN.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPRN.ParamByName('animal').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPRN.ParamByName('fecha').AsDateTime := IBDSSimple.FieldValues['FECHA'];
  IBQSPRN.ParamByName('p').Value := IBDSSimple.FieldValues['I8'];
  IBQSPRN.ParamByName('rp').Value := IBDSSimple.FieldValues['ID_PC'];
  IBQSPRN.ParamByName('sen').Value := null;
  IBQSPRN.ParamByName('pc').Value := null;
  IBQSPRN.ParamByName('hba').Value := null;
  IBQSPRN.ParamByName('ra').Value := null;
  IBQSPRN.ParamByName('otro').Value := null;
  IBQSPRN.ParamByName('ie').Value := null;
  IBQSPRN.ParamByName('sexo').Value := IBDSSimple.FieldValues['I6'];
  IBQSPRN.ParamByName('p1').Value := null;
  IBQSPRN.ParamByName('rp1').Value := null;
  IBQSPRN.ParamByName('sen1').Value := null;
  IBQSPRN.ParamByName('pc1').Value := null;
  IBQSPRN.ParamByName('hba1').Value := null;
  IBQSPRN.ParamByName('ra1').Value := null;
  IBQSPRN.ParamByName('otro1').Value := null;
  IBQSPRN.ParamByName('ie1').Value := null;
  IBQSPRN.ParamByName('sexo1').Value := null;
  IBQSPRN.ParamByName('p2').Value := null;
  IBQSPRN.ParamByName('rp2').Value := null;
  IBQSPRN.ParamByName('sen2').Value := null;
  IBQSPRN.ParamByName('pc2').Value := null;
  IBQSPRN.ParamByName('hba2').Value := null;
  IBQSPRN.ParamByName('ra2').Value := null;
  IBQSPRN.ParamByName('otro2').Value := null;
  IBQSPRN.ParamByName('ie2').Value := null;
  IBQSPRN.ParamByName('sexo2').Value := null;
  IBQSPRN.ParamByName('co').Value := null;
end;

procedure TFEveImportarPartosNacimientos.LoadSQLStringList;
begin
  SQLStringList.AddObject('V2',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('V1',TObject(DMSoftvet.DSTiposParto));
  SQLStringList.AddObject('V3',TObject(DMSoftvet.DSCausaDistocia));
  SQLStringList.AddObject('V4',TObject(DMSoftvet.DSGradoAsistencia));
  SQLStringList.AddObject('V5',TObject(DSCondicionCorporal));
  SQLStringList.AddObject('V9',TObject(DMSoftvet.DSTipoSexo));
  SQLStringList.AddObject('V10',TObject(DMSoftvet.DSCodigosGenericos));
  SQLStringList.AddObject('V11',TObject(DSCategorias));
  SQLStringList.AddObject('APODO',TObject(DMSoftvet.DSPotrero));
  SQLStringList.AddObject('DTA_BAJA',TObject(DMSoftvet.DSRodeo));
  SQLStringList.AddObject('V13',TObject(DSColor));
end;

procedure TFEveImportarPartosNacimientos.cargarDatos(i : Integer);
var
  vivo : String;
  aux : string;
begin
  IBDSSimple.FieldByName('ID_ANIMAL').AsInteger := anim[i].id;
  IBDSSimple.FieldValues['ID_PC'] := getDato('rp (ternero)',anim[i]);
  IBDSSimple.FieldValues['FECHA'] := getDato('fecha de nacimiento',anim[i]);
  IBDSSimple.FieldValues['V2'] := UpperCase(getDato('responsable',anim[i]));
  IBDSSimple.FieldValues['RESPONSABLE'] := DMSoftvet.IBQResponsable.Lookup('nombre',IBDSSimple.FieldValues['V2'],'id_empleado');
  IBDSSimple.FieldValues['V1'] := UpperCase(getDato('tipo parto',anim[i]));
  IBDSSimple.FieldValues['I1'] := DMSoftvet.IBQTiposParto.Lookup('nombre',IBDSSimple.FieldValues['V1'],'id_tipo_parto');
  if IBDSSimple.FieldValues['I1'] = 2 then
  begin
    BDBGSimple.Columns[9].Visible := true;  // Esta y la de abajo no corresponden, por las dudas no las comento porque asi estaban, pero agregue la 12 y la 13
    BDBGSimple.Columns[10].Visible := true;
    BDBGSimple.Columns[12].Visible := true;
    BDBGSimple.Columns[13].Visible := true;
    IBDSSimple.FieldValues['V3'] := UpperCase(getDato('causa',anim[i]));
    IBDSSimple.FieldValues['I3'] := DMSoftvet.IBQCausaDistocia.Lookup('nombre',IBDSSimple.FieldValues['V3'],'id_causa_distocia');
    IBDSSimple.FieldValues['V4'] := UpperCase(getDato('grado',anim[i]));
    IBDSSimple.FieldValues['I4'] := DMSoftvet.IBQGradoAsistencia.Lookup('nombre',IBDSSimple.FieldValues['V4'],'id_grado_asistencia');
  end;
  IBDSSimple.FieldValues['V11'] := getDato('categoría',anim[i]);
  IBDSSimple.FieldValues['I9'] := IBQCategorias.Lookup('nombre',IBDSSimple.FieldValues['V11'],'id_categoria');
  IBDSSimple.FieldValues['V13'] := getDato('color',anim[i]);
  IBDSSimple.FieldValues['I10'] := IBQColor.Lookup('nombre',IBDSSimple.FieldValues['V13'],'id_color');
  IBDSSimple.FieldValues['V5'] := getDato('cond. corp.',anim[i]);
  IBDSSimple.FieldValues['I5'] := IBQCondicionCorporal.Lookup(Fprincipal.StringEscalaCC,IBDSSimple.FieldValues['V5'],'id_condicion_corporal');
  IBDSSimple.FieldValues['V6'] := getDato('rp (padre)',anim[i]);
  IBDSSimple.FieldValues['V7'] := getDato('hba (padre)',anim[i]);
  IBDSSimple.FieldValues['V8'] := getDato('nombre (padre)',anim[i]);
  IBDSSimple.FieldValues['ID_OTRO'] := getDato('rp (madre transf. embr.)',anim[i]);
  IBDSSimple.FieldValues['ID_HBA'] := getDato('hba (ternero)',anim[i]);
  IBDSSimple.FieldValues['NOMBRE'] := getDato('nombre (ternero)',anim[i]);
  IBDSSimple.FieldValues['OBSERVACION2'] := getDato('hba (madre transf. embr.)',anim[i]);
  IBDSSimple.FieldValues['OBSERVACION3'] := getDato('nombre (madre transf. embr.)',anim[i]);
  IBDSSimple.FieldValues['ID_RP'] := getDato('rp (madre evento)',anim[i]);

  IBDSSimple.FieldValues['V9'] := uppercase(getDato('sexo',anim[i]));
  IBDSSimple.FieldValues['I6'] := DMSoftvet.IBQTipoSexo.Lookup('nombre',IBDSSimple.FieldValues['V9'],'id_tipo_sexo');
  IBDSSimple.FieldValues['V14'] := getDato('ie (ternero)',anim[i]);
  vivo := getDato('vivo',anim[i]);
  if (vivo = 'VIVO') or (lowercase(vivo)='si') then
  begin
    IBDSSimple.FieldByName('V10').AsString := 'SI';
    IBDSSimple.FieldByName('VUNO1').AsString := 'S';
  end
  else
  begin
    IBDSSimple.FieldByName('V10').AsString := 'NO';
    IBDSSimple.FieldByName('VUNO1').AsString := 'N';
  end;

  aux := getDato('peso',anim[i]);
  if (aux='') then
    aux := getDato('Peso (Ternero)',anim[i]);
  if aux = '' then
    IBDSSimple.FieldValues['I8'] := null
  else
    IBDSSimple.FieldValues['I8'] := aux;
  //if (IBDSSimple.FieldValues['I8'] = 0) or ((IBDSSimple.FieldValues['I8'] = ''))then
  //  IBDSSimple.FieldValues['I8'] := null;
  aux:= getDato('observaciones',anim[i]);
  if (aux='') then aux := getDato('observacion',anim[i]);
  IBDSSimple.FieldValues['OBSERVACION'] := aux;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.Open;
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.Open;
  IBDSSimple.FieldValues['APODO'] := Uppercase(getDato('potrero',anim[i]));
  IBDSSimple.FieldValues['I2'] := DMSoftvet.IBQPotrero.Lookup('nombre',IBDSSimple.FieldValues['APODO'],'id_potrero');
  IBDSSimple.FieldValues['DTA_BAJA'] := UpperCase(getDato('rodeo',anim[i]));
  IBDSSimple.FieldValues['ID_AUX_EVENTO'] := DMSoftvet.IBQRodeo.Lookup('nombre',IBDSSimple.FieldValues['DTA_BAJA'],'id_rodeo');
end;

procedure TFEveImportarPartosNacimientos.FormShow(Sender: TObject);
begin
  inherited;
  TSManga.TabVisible := false;
  CrearGrupo := false;
//  if (owner is TFMovCargarDatos) then

end;

procedure TFEveImportarPartosNacimientos.PCBasicoChange(Sender: TObject);
begin
  inherited;
  TSManga.TabVisible := false;
  BSacarAnimal.Visible := false;
  SBSelTodos.Visible := false;
  AjustarColumnas;
end;

procedure TFEveImportarPartosNacimientos.PcBasicoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  //inherited;
end;

procedure TFEveImportarPartosNacimientos.AjustarColumnas;
begin     
  AutoAjustarColumnas;
end;

procedure TFEveImportarPartosNacimientos.TSGrillaShow(Sender: TObject);
begin
  inherited;
  AjustarColumnas;
end;

function TFEveImportarPartosNacimientos.CheckPadresyMadres : Boolean;
var
  Indice : Integer;
  id_madre, id_padre : Integer;
  F : TFMensajeAnimalesNuevos;
  rp, hba, nombre : String;
  hay_nuevos : Boolean;
begin
  Indice := -1;
  IBDSSimple.First;
  hay_nuevos := false;
  F := TFMensajeAnimalesNuevos.Create(self);
  while not IBDSSimple.Eof do
  begin
    Inc(Indice);
    SetLength(ArrPadresMadres,Indice+1);
    ArrPadresMadres[Indice].id_animal := IBDSSimple.FieldValues['id_animal'];
    //Chequeo las madre Biologica
    if ((IBDSSimple.FieldValues['id_otro'] <> null) and (IBDSSimple.FieldValues['id_otro'] <> '') or
        (IBDSSimple.FieldValues['observacion2'] <> null) and (IBDSSimple.FieldValues['observacion2'] <> '') or
        (IBDSSimple.FieldValues['observacion3'] <> null) and (IBDSSimple.FieldValues['observacion3'] <> '')) then
    begin
      IBQAnimalInt.Close;
      IBQAnimalInt.ParamByName('rp').Value := IBDSSimple.FieldValues['id_otro'];
      IBQAnimalInt.ParamByName('hba').Value := IBDSSimple.FieldValues['observacion2'];
      IBQAnimalInt.ParamByName('nombre').Value := IBDSSimple.FieldValues['observacion3'];
      IBQAnimalInt.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQAnimalInt.Open;
      if IBQAnimalInt.IsEmpty then
      begin
        IBQAnimalExt.Close;
        IBQAnimalExt.ParamByName('rp').Value := IBDSSimple.FieldValues['id_otro'];
        IBQAnimalExt.ParamByName('hba').Value := IBDSSimple.FieldValues['observacion2'];
        IBQAnimalExt.ParamByName('nombre').Value := IBDSSimple.FieldValues['observacion3'];
        IBQAnimalExt.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQAnimalExt.Open;
        if IBQAnimalExt.IsEmpty then
        begin
          hay_nuevos := true;
          ArrPadresMadres[Indice].id_madre := -1;
          ArrPadresMadres[Indice].madre_ext := 'S';
          rp := '';
          hba := '';
          nombre := '';
          if (IBDSSimple.FieldValues['id_otro'] <> null) and (IBDSSimple.FieldValues['id_otro'] <> '') then
            rp := IBDSSimple.FieldValues['id_otro'];
          if (IBDSSimple.FieldValues['observacion2'] <> null) and (IBDSSimple.FieldValues['observacion2'] <> '') then
            hba := IBDSSimple.FieldValues['observacion2'];
          if (IBDSSimple.FieldValues['observacion3'] <> null) and (IBDSSimple.FieldValues['observacion3'] <> '') then
            nombre := IBDSSimple.FieldValues['observacion3'];
          F.AgregarMadre(ArrPadresMadres[Indice].id_animal,rp,hba,nombre);
        end
        else
        begin
          IBDSSimple.Edit;
          IBDSSimple.FieldValues['id_otro'] := IBQAnimalExt.FieldValues['id_rp'];
          IBDSSimple.FieldValues['observacion2'] := IBQAnimalExt.FieldValues['id_hba'];
          IBDSSimple.FieldValues['observacion3'] := IBQAnimalExt.FieldValues['nombre'];
          ArrPadresMadres[Indice].id_madre := IBQAnimalExt.FieldValues['id_animal_externo'];
          ArrPadresMadres[Indice].madre_ext := 'S';
        end;
      end
      else
      begin
        IBDSSimple.Edit;
        IBDSSimple.FieldValues['id_otro'] := IBQAnimalInt.FieldValues['id_rp'];
        IBDSSimple.FieldValues['observacion2'] := IBQAnimalInt.FieldValues['id_hba'];
        IBDSSimple.FieldValues['observacion3'] := IBQAnimalInt.FieldValues['nombre'];
        ArrPadresMadres[Indice].id_madre := IBQAnimalInt.FieldValues['id_animal'];
        ArrPadresMadres[Indice].madre_ext := 'N';
      end;
    end
    else
      ArrPadresMadres[Indice].id_madre := 0;
    //Chequeo los padres
    if ((IBDSSimple.FieldValues['V6'] <> null) and (IBDSSimple.FieldValues['V6'] <> '') or
        (IBDSSimple.FieldValues['V7'] <> null) and (IBDSSimple.FieldValues['V7'] <> '') or
        (IBDSSimple.FieldValues['V8'] <> null) and (IBDSSimple.FieldValues['V8'] <> ''))then
    begin
      IBQAnimalInt.Close;
      IBQAnimalInt.ParamByName('rp').Value := IBDSSimple.FieldValues['V6'];
      IBQAnimalInt.ParamByName('hba').Value := IBDSSimple.FieldValues['V7'];
      IBQAnimalInt.ParamByName('nombre').Value := IBDSSimple.FieldValues['V8'];
      IBQAnimalInt.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQAnimalInt.Open;
      if IBQAnimalInt.IsEmpty then
      begin
        IBQAnimalExt.Close;
        IBQAnimalExt.ParamByName('rp').Value := IBDSSimple.FieldValues['V6'];
        IBQAnimalExt.ParamByName('hba').Value := IBDSSimple.FieldValues['V7'];
        IBQAnimalExt.ParamByName('nombre').Value := IBDSSimple.FieldValues['V8'];
        IBQAnimalExt.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQAnimalExt.Open;
        if IBQAnimalExt.IsEmpty then
        begin
          hay_nuevos := true;
          ArrPadresMadres[Indice].id_padre := -1;
          ArrPadresMadres[Indice].padre_ext := 'S';
          rp := '';
          hba := '';
          nombre := '';
          if (IBDSSimple.FieldValues['V6'] <> null) and (IBDSSimple.FieldValues['V6'] <> '') then
            rp := IBDSSimple.FieldValues['V6'];
          if (IBDSSimple.FieldValues['V7'] <> null) and (IBDSSimple.FieldValues['V7'] <> '') then
            hba := IBDSSimple.FieldValues['V7'];
          if (IBDSSimple.FieldValues['V8'] <> null) and (IBDSSimple.FieldValues['V8'] <> '') then
            nombre := IBDSSimple.FieldValues['V8'];
          F.AgregarPadre(ArrPadresMadres[Indice].id_animal,rp,hba,nombre);
        end
        else
        begin
          IBDSSimple.Edit;
          IBDSSimple.FieldValues['V6'] := IBQAnimalExt.FieldValues['id_rp'];
          IBDSSimple.FieldValues['V7'] := IBQAnimalExt.FieldValues['id_hba'];
          IBDSSimple.FieldValues['V8'] := IBQAnimalExt.FieldValues['nombre'];
          ArrPadresMadres[Indice].id_padre := IBQAnimalExt.FieldValues['id_animal_externo'];
          ArrPadresMadres[Indice].padre_ext := 'S';
        end;
      end
      else
      begin
        IBDSSimple.Edit;
        IBDSSimple.FieldValues['V6'] := IBQAnimalInt.FieldValues['id_rp'];
        IBDSSimple.FieldValues['V7'] := IBQAnimalInt.FieldValues['id_hba'];
        IBDSSimple.FieldValues['V8'] := IBQAnimalInt.FieldValues['nombre'];
        ArrPadresMadres[Indice].id_padre := IBQAnimalInt.FieldValues['id_animal'];
        ArrPadresMadres[Indice].padre_ext := 'N';
      end;
    end
    else
      ArrPadresMadres[Indice].id_padre := 0;
    IBDSSimple.Next;
  end;
  if hay_nuevos then
  begin
    F.ShowModal;
    if F.Termina then
    begin
      for Indice := 0 to Length(ArrPadresMadres)-1 do
      begin
        if ArrPadresMadres[Indice].id_madre = -1 then
          ArrPadresMadres[Indice].id_madre := F.Madre(ArrPadresMadres[Indice].id_animal);
        if ArrPadresMadres[Indice].id_padre = -1 then
          ArrPadresMadres[Indice].id_padre := F.Padre(ArrPadresMadres[Indice].id_animal);
      end;
      Result := true;
    end
    else
      Result := false;
  end
  else
    Result := true;
  F.Destroy;
end;

procedure TFEveImportarPartosNacimientos.ATerminarExecute(Sender: TObject);
begin
  if CheckPadresyMadres then
    inherited;
end;

function TFEveImportarPartosNacimientos.BuscarAnimal(id_animal : Integer) : Integer;
var
  I, res : Integer;
begin
  res := -1;
  for I := 0 to Length(ArrPadresMadres)-1 do
    if ArrPadresMadres[I].id_animal = id_animal then
    begin
      res := I;
      break;
    end;
  Result := res;
end;

procedure TFEveImportarPartosNacimientos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  BBXlsImportClick(Sender);
  BSacarAnimal.Visible := false;
  SBSelTodos.Visible := false;
  AjustarColumnas;
end;

procedure TFEveImportarPartosNacimientos.IBDSSimpleV2SetText(
  Sender: TField; const Text: String);
var
  aux : double;
  aux2 : String;
  PickPos : integer;
  f : TDateTime;
begin
  inherited;
  if((IBDSSimple.State <> dsInsert) or cargaXLS) then
  begin
    SetText(Sender,Text);
    if (Sender.FieldName = 'V2') then   //Responsable
    begin
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
        IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        BEGIN
            Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
            PickPos := BDBGSimple.ColumnByField('V2').PickList.IndexOf(BDBGSimple.ColumnByField('V2').Field.AsString);
            IBDSSimpleRESPONSABLE.Value :=  TClassType(BDBGSimple.ColumnByField('V2').PickList.Objects[PickPos]).getValue;
        END;
    end;
    if (Sender.FieldName = 'V5') then   //Condicion Corporal
    begin
      if (TryStrTofloat(text,aux)) then
      begin
        aux2 := StringReplace(FormatFloat('0.0',aux), ',', '.',[]);
        IBQValidaciones.Params.Clear;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select count(*)as cantidad from cod_condiciones_corporales where ('+fprincipal.StringEscalaCC+' = '+aux2+')');
        IBQValidaciones.Active := true;

        if (IBQValidaciones.FieldByName('cantidad').AsInteger <> 0) then
          begin
            IBQValidaciones.Active := false;
            IBQValidaciones.SQL.Clear;
            IBQValidaciones.SQL.Add('select '+FPrincipal.StringEscalaCC+' from cod_condiciones_corporales where ('+FPrincipal.StringEscalaCC+' = '+aux2+')');
            IBQValidaciones.Active := true;
            Sender.Value := IBQValidaciones.FieldByName(FPrincipal.StringEscalaCC).Value;
            PickPos := BDBGSimple.ColumnByField('V5').PickList.IndexOf(BDBGSimple.ColumnByField('V5').Field.AsString);
            IBDSSimple.FieldByName('I5').Value :=  TClassType(BDBGSimple.ColumnByField('V5').PickList.Objects[PickPos]).getValue;
          end;
      end;
    end;
    if(Sender.FieldName = 'FECHA')then
    begin
      if (TryStrToDate(Text,f)) then
           Sender.AsVariant := StrToDate(text);
    end;
    if(Sender.FieldName = 'V1') then  //Tipo de Parto
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_tipos_parto where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString ;
        PickPos := BDBGSimple.ColumnByField('V1').PickList.IndexOf(BDBGSimple.ColumnByField('V1').Field.AsString);
        IBDSSimpleI1.Value := TClassType(BDBGSimple.ColumnByField('V1').PickList.Objects[PickPos]).getValue;
        if (IBDSSimpleI1.Value = 2) then
        begin
          BDBGSimple.ColumnByField('V3').Visible := true;
          BDBGSimple.ColumnByField('V4').Visible := true;
          IBDSSimpleV2SetText(IBDSSimpleV3,'N');
          IBDSSimpleV2SetText(IBDSSimpleV4,'N');
        end
        else
          if (BDBGSimple.ColumnByField('V3').Visible) then
          begin
            IBDSSimpleV3.Value := '';
            IBDSSimpleV4.Value := '';
          end
      end;
    end;
    if (Sender.FieldName = 'V3') then  //Causa Distocia
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_causas_distocia where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V3').PickList.IndexOf(BDBGSimple.ColumnByField('V3').Field.AsString);
        IBDSSimpleI3.Value := TClassType(BDBGSimple.ColumnByField('V3').PickList.Objects[PickPos]).getValue;
      end;
      IBDSSimpleV1.Value := 'DISTOCICO';
      if (IBDSSimpleV4.Value = '') then
        IBDSSimpleV2SetText(IBDSSimpleV4,'N');
    end;
    if (Sender.FieldName = 'V13') then  //Color
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_colores where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V13').PickList.IndexOf(BDBGSimple.ColumnByField('V13').Field.AsString);
        IBDSSimpleI10.Value := TClassType(BDBGSimple.ColumnByField('V13').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V4') then  //Grado de Asistencia
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_grados_asistencia where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V4').PickList.IndexOf(BDBGSimple.ColumnByField('V4').Field.AsString);
        IBDSSimpleI4.Value := TClassType(BDBGSimple.ColumnByField('V4').PickList.Objects[PickPos]).getValue;
      end;
      IBDSSimpleV1.Value := 'DISTOCICO';
      if (IBDSSimpleV3.Value = '') then
        IBDSSimpleV2SetText(IBDSSimpleV3,'N');
    end;
    if (Sender.FieldName = 'DTA_BAJA') then  //Rodeo
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from tab_rodeos where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('DTA_BAJA').PickList.IndexOf(BDBGSimple.ColumnByField('DTA_BAJA').Field.AsString);
        IBDSSimpleID_AUX_EVENTO.Value := TClassType(BDBGSimple.ColumnByField('DTA_BAJA').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'APODO') then  //Potrero
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from tab_potreros where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('APODO').PickList.IndexOf(BDBGSimple.ColumnByField('APODO').Field.AsString);
        IBDSSimpleI2.Value := TClassType(BDBGSimple.ColumnByField('APODO').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V9') then  //Sexo
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_sexos where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V9').PickList.IndexOf(BDBGSimple.ColumnByField('V9').Field.AsString);
        IBDSSimpleI6.Value := TClassType(BDBGSimple.ColumnByField('V9').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V10') then  //Vivo
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select valor from cod_genericos where ((valor like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString;
        PickPos := BDBGSimple.ColumnByField('V10').PickList.IndexOf(BDBGSimple.ColumnByField('V10').Field.AsString);
        IBDSSimpleVUNO1.Value := TClassType(BDBGSimple.ColumnByField('V10').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V11') then  //Categoria
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_categorias where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not IBQValidaciones.IsEmpty then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V11').PickList.IndexOf(BDBGSimple.ColumnByField('V11').Field.AsString);
        IBDSSimpleI9.Value := TClassType(BDBGSimple.ColumnByField('V11').PickList.Objects[PickPos]).getValue;
      end;
    end;
  end;
end;

end.
