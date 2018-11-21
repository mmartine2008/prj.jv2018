unit UEveSincronizacionCelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DBCtrls, UDBLookupComboBoxAuto,
  DateTimePickerAuto, DataExport, DataToXLS, WinXP, EditAuto, ImgList,
  PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage,
  jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom,
  XMLDoc, Menus;

type
  TFEveSincronizacionCelo = class(TFEveSimple)
    LFecha: TLabel;
    LMetodo: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    DBLCBAMetodo: TDBLookupComboBoxAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LResponsable: TLabel;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleIDMETODO: TIntegerField;
    IBDSSimpleMETODO: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    LDesc: TLabel;
    DBLCBADescMetodos: TDBLookupComboBoxAuto;
    IBQDescMetodos: TIBQuery;
    DSDescMetodos: TDataSource;
    DBLCBACondCorp: TDBLookupComboBoxAuto;
    CBCondCorp: TCheckBox;
    IBQCondCorp: TIBQuery;
    DSCondCorp: TDataSource;
    IBDSSimpleI3: TIntegerField;
    IBDSSimpleV3: TIBStringField;
    IBDSSimpleI4: TIntegerField;
    IBDSSimpleV4: TIBStringField;
    CBDeteccion: TCheckBox;
    CBTratamiento: TCheckBox;
    LHora: TLabel;
    DTPAHora: TDateTimePickerAuto;
    IBDSSimpleH1: TTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure LMetodoClick(Sender: TObject);
    procedure LDescClick(Sender: TObject);
    procedure DBLCBAMetodoCloseUp(Sender: TObject);
    procedure CBCondCorpClick(Sender: TObject);
    procedure IBQCondCorpAfterOpen(DataSet: TDataSet);
    procedure ATerminarExecute(Sender: TObject);
    procedure IBQDescMetodosAfterOpen(DataSet: TDataSet);
   
  private
    procedure EjecutarDeteccion();
    procedure EjecutarTratamiento();
  protected
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
    procedure configurarColumnasACargar;override;
  public
    { Public declarations }
  end;

var
  FEveSincronizacionCelo: TFEveSincronizacionCelo;

implementation

{$R *.dfm}

uses
  UDMSoftvet, UPrincipal,UClassType, UABMEmpleados, UImportacion, UABMMetodosSincronizacion,
  UABMDescMetodoSinc, UEveDeteccionCelo, UEveTratamiento, UMensajeHuella,
  UEveUniversal;

{ TFEveSincronizacionCelo }

procedure TFEveSincronizacionCelo.CargarDatosGrilla;
begin
  inherited;

    IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_SENASA').Value := MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];

    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.Date]);
    RealizarCambio(DTPAHora,[IBDSSimple.FieldByName('H1')],[DTPAHora.Time]);
    RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[DBLCBAResponsable.GetDato,DBLCBAResponsable.Text]);
    RealizarCambio(DBLCBAMetodo,[IBDSSimple.FieldByName('IDMETODO'),IBDSSimple.FieldByName('METODO')],[DBLCBAMetodo.KeyValue,DBLCBAMetodo.Text]);
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    RealizarCambio(DBLCBADescMetodos,[IBDSSimple.FieldByName('I3'),IBDSSimple.FieldByName('V3')],[DBLCBADescMetodos.KeyValue,DBLCBADescMetodos.Text]);
    RealizarCambio(DBLCBACondCorp,[IBDSSimple.FieldByName('I4'),IBDSSimple.FieldByName('V4')],[DBLCBACondCorp.KeyValue,DBLCBACondCorp.Text]);
   { if RegistroCambio(DTPAFecha) then
      IBDSSimple.FieldByName('FECHA').Value := DTPAFecha.Date ;

    if RegistroCambio(DBLCBAResponsable) then
    begin
      IBDSSimple.FieldByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
      IBDSSimple.FieldByName('RESP').Value := DBLCBAResponsable.Text;
    end;

    IBDSSimple.FieldByName('OBSERVACION').Value := MAObservacion.GetDato;

    if RegistroCambio(DBLCBAMetodo) then
    begin
      IBDSSimple.FieldByName('IDMETODO').Value := DBLCBAMetodo.KeyValue;
      IBDSSimple.FieldByName('METODO').Value := DBLCBAMetodo.Text;
    end; }

end;

procedure TFEveSincronizacionCelo.CargarParametrosMasivo;

begin
  Inherited;
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('METODO').Value := IBDSSimpleIDMETODO.AsInteger;
  IBQSPEventoInd.ParamByName('DESC_METODO').Value := IBDSSimpleI3.AsInteger;
  if IBDSSimpleI4.AsString<>'' then
    IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := IBDSSimpleI4.AsInteger
  else
    IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := null;
  IBQSPEventoInd.ParamByName('HORA').Value:=IBDSSimple.FieldValues['H1'];
end;

procedure TFEveSincronizacionCelo.CargarParametrosRN;
begin
  inherited;
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPRN.ParamByName('FECHA').AsDate := DTPAFecha.Date;
  if(self.ModoEve = meIndividual)then
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal
  else
      IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
end;

procedure TFEveSincronizacionCelo.CargarParametrosSP;
begin
  inherited;
  IBQSPEventoInd.ParamByName('FECHA').AsDate  := DTPAFecha.Date;
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
  if(ModoEve = meMasivo)then
     IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupoIDNUEVOGRUPO.AsInteger ;
  IBQSPEventoInd.ParamByName('METODO').Value := DBLCBAMetodo.KeyValue;
  IBQSPEventoInd.ParamByName('DESC_METODO').Value := DBLCBADescMetodos.KeyValue;
  if CBCondCorp.Checked then
    IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := DBLCBACondCorp.KeyValue
  else
    IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := null;

end;

procedure TFEveSincronizacionCelo.LoadSQLStringList;
begin
  inherited;
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('METODO',TObject(DMSoftvet.DSmetodosSincronizacion));
  SQLStringList.AddObject('V3',TObject(DSDescMetodos));
  SQLStringList.AddObject('V4',TObject(DSCondCorp));
end;

procedure TFEveSincronizacionCelo.FormCreate(Sender: TObject);
begin
  inherited;

  DBLCBACondCorp.ListField := 'VALOR';//uppercase(FPrincipal.StringEscalaCC);
  IBQCondCorp.Close;
  IBQCondCorp.SQL.Clear;
  IBQCondCorp.SQL.Add('select id_condicion_corporal, '+FPrincipal.StringEscalaCC+' as VALOR from cod_condiciones_corporales');
  IBQCondCorp.Open;



  DTPAFecha.DateTime := now;
//  DTPAFecha.MaxDate:= now;
  DMSoftvet.IBQmetodosSincronizacion.Close;
  DMSoftvet.IBQmetodosSincronizacion.Open;

  IBQDescMetodos.Close;
  IBQDescMetodos.ParamByName('id').AsInteger := 0;//DBLCBAMetodo.KeyValue;
  IBQDescMetodos.Open;

  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, nombre, apodo from VIS_SINCRONIZACION_CELO where ((CURRENT_DATE - FECHA_NACIMIENTO) > 270)';
end;

procedure TFEveSincronizacionCelo.FormShow(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
//  MSimple.PasarParametros(2,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  MSimple.PasarParametros(2,5);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
end;

procedure TFEveSincronizacionCelo.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
var
  PickPos: integer;
  valor : double;
begin
  //inherited;
  if(IBDSSimple.State <> dsInsert) then
  begin
      SetText(Sender,Text);
      IBDSSimple.Edit;
      if(Sender.FieldName = 'METODO')then
      begin
           IBQValidaciones.Close;
           IBQValidaciones.SQL.Clear;
           IBQValidaciones.SQL.Add('select sinonimo as valor from COD_METODOS_SINCRONIZACION where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or (CODIGO like '''+UpperCase(Text)+'%'')');
           IBQValidaciones.Open;
           if not(IBQValidaciones.IsEmpty) then
           begin
             Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
             PickPos := BDBGSimple.ColumnByField('METODO').PickList.IndexOf(BDBGSimple.ColumnByField('METODO').Field.AsString);
             IBDSSimpleIDMETODO.AsInteger := TClassType(BDBGSimple.ColumnByField('METODO').PickList.Objects[PickPos]).getValue;
           end;
      end;
      if(Sender.FieldName = 'V3')then    //Descripcion
      begin
            IBQValidaciones.Close;
            IBQValidaciones.SQL.Clear;
            IBQValidaciones.SQL.Add('select sinonimo as valor from COD_DESC_METODOS_SINC where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or (CODIGO like '''+UpperCase(Text)+'%'')');
            IBQValidaciones.Open;
            if not(IBQValidaciones.IsEmpty) then
            begin
              Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
              PickPos := BDBGSimple.ColumnByField('V3').PickList.IndexOf(BDBGSimple.ColumnByField('V3').Field.AsString);
              IBDSSimpleI3.AsInteger := TClassType(BDBGSimple.ColumnByField('V3').PickList.Objects[PickPos]).getValue;
            end;
      end;
      if(Sender.FieldName = 'V4')then   //Cond Corp
      begin
            IBQValidaciones.Close;
            IBQValidaciones.SQL.Clear;
            IBQValidaciones.SQL.Add('select '+FPrincipal.StringEscalaCC+' as valor from COD_CONDICIONES_CORPORALES where '+FPrincipal.StringEscalaCC+' = :valor');
            if TryStrToFloat(Text,valor) then
              IBQValidaciones.ParamByName('valor').Value := valor
            else
              IBQValidaciones.ParamByName('valor').Value := -1;
            IBQValidaciones.Open;
           if not(IBQValidaciones.IsEmpty) then
           begin
             Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
             PickPos := BDBGSimple.ColumnByField('V4').PickList.IndexOf(BDBGSimple.ColumnByField('V4').Field.AsString);
             IBDSSimpleI4.AsInteger := TClassType(BDBGSimple.ColumnByField('V4').PickList.Objects[PickPos]).getValue;
           end;
      end;
      if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
              IBDSSimple.FieldValues['EW'] := 'M';
      if (Sender.FieldName = 'RESP') then  //Responsable
      begin
        IBQValidaciones.Close;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
        IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
            Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
            PickPos := BDBGSimple.ColumnByField('RESP').PickList.IndexOf(BDBGSimple.ColumnByField('RESP').Field.AsString);
            IBDSSimple.FieldByName('RESPONSABLE').Value :=  TClassType(BDBGSimple.ColumnByField('RESP').PickList.Objects[PickPos]).getValue;
        end;
      end;
      if(Sender.FieldName = 'OBSERVACION')then
      begin
        Sender.AsVariant := text;
      end;
   end;
end;

procedure TFEveSincronizacionCelo.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveSincronizacionCelo.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveSincronizacionCelo.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      (Sender as TLabel).Font.Color:= $00606C02;
      (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveSincronizacionCelo.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      (Sender as TLabel).Font.Color:= clWindowText;
      (Sender as TLabel).Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveSincronizacionCelo.cargarDatos(i:integer);
var str:string;
begin
    inherited;
    DMSoftvet.IBQResponsable.Close;
    DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQResponsable.Open;
    IBDSSimple.FieldByName('RESP').Value:=getDato('responsable',anim[i]);
    IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
    IBDSSimple.FieldByName('ID_SENASA').Value := MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    IBDSSimple.FieldByName('METODO').Value:=getDato('método',anim[i]);
    IBDSSimple.FieldByName('IDMETODO').Value:=DBLCBAMetodo.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('METODO').Value,'ID_METODO');
    IBQDescMetodos.Close;
    IBQDescMetodos.ParamByName('id').AsInteger:=IBDSSimple.FieldByName('IDMETODO').Value;
    IBQDescMetodos.Open;
    if DBLCBADescMetodos.ListSource.DataSet.Lookup('SINONIMO',getDato('Descripción',anim[i]),'ID_DESCRIPCION')<>null then
      begin
      IBDSSimple.FieldByName('V3').Value:=getDato('Descripción',anim[i]);
      IBDSSimple.FieldByName('I3').Value:=DBLCBADescMetodos.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('V3').Value,'ID_DESCRIPCION');
     end
    else
      begin
      IBDSSimple.FieldByName('V3').Value:='NO DEFINIDO';
      IBDSSimple.FieldByName('I3').Value:=0;
      end;
    IBDSSimple.FieldByName('V4').Value:=getDato('Cond. Corporal',anim[i]);
    IBDSSimple.FieldByName('I4').Value:=DBLCBACondCorp.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('V4').Value,'ID_CONDICION_CORPORAL');
    IBDSSimple.FieldByName('H1').Value:=getDato('hora',anim[i]);

    DBLCBAResponsable.KeyValue:=1;
    CBCondCorp.Checked:=true;
    CBCondCorpClick(self);
end;

procedure TFEveSincronizacionCelo.LMetodoClick(Sender: TObject);
begin
  inherited;
   if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMMetodosSincronizacion.Create(self));
      DMSoftvet.IBQmetodosSincronizacion.Close;
      DMSoftvet.IBQmetodosSincronizacion.Open;
    end;
   cambiarCB(DBLCBAMetodo,nroID);
end;

procedure TFEveSincronizacionCelo.LDescClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMDescMetodoSinc.Create(self));
      IBQDescMetodos.Close;
      IBQDescMetodos.ParamByName('id').AsInteger := DBLCBAMetodo.KeyValue;
      IBQDescMetodos.Open;
    end;
  cambiarCB(DBLCBADescMetodos,nroID);
end;

procedure TFEveSincronizacionCelo.DBLCBAMetodoCloseUp(Sender: TObject);
begin
  inherited;
  IBQDescMetodos.Close;
  IBQDescMetodos.ParamByName('id').Value := DBLCBAMetodo.KeyValue;
  IBQDescMetodos.Open;
  CBDeteccion.Visible := false;
  CBTratamiento.Visible := false;
  if DBLCBAMetodo.KeyValue <> null then
  begin
    if DBLCBAMetodo.KeyValue = 1 then //Prostaglandina
      CBDeteccion.Visible := true;
    if DBLCBAMetodo.KeyValue = 2 then //Progestageno
      CBTratamiento.Visible := true;
  end;
  DBLCBADescMetodos.KeyValue:=0;
end;

procedure TFEveSincronizacionCelo.CBCondCorpClick(Sender: TObject);
begin
  inherited;
  DBLCBACondCorp.Enabled := CBCondCorp.Checked;
  BDBGSimple.Columns[3].Visible := CBCondCorp.Checked;
  if CBCondCorp.Checked then
    DBLCBACondCorp.KeyValue := 1;
end;

procedure TFEveSincronizacionCelo.IBQCondCorpAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQCondCorp.Last;
  IBQCondCorp.First;
end;

procedure TFEveSincronizacionCelo.EjecutarDeteccion();
var
  F : TFEveDeteccionCelo;
begin
  F := TFEveDeteccionCelo.Create(nil);
  F.ConManga := ModoEve = meMasivo;
  F.ModoEve := ModoEve;
  if modoEve = meIndividual then
    F.IDAnimal := IDAnimal;
  F.ShowModal;
  F.Destroy;
end;

procedure TFEveSincronizacionCelo.EjecutarTratamiento();
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
    //BorrarAux();
    F.DBLCBATipo.KeyValue := 6; //Solo tratamientos Hormonales
    F.DBLCBATipoCloseUp(nil); //Para que active las descripciones del tratamiento
    F.DBLCBATipo.Enabled := false;
    F.DTPAFecha.Date := DTPAFecha.Date;
    if modoEve = meIndividual then
      F.IDAnimal := IDAnimal;
    F.ShowModal;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveSincronizacionCelo.ATerminarExecute(Sender: TObject);
begin
  inherited;
  if PuedeTerminar and CBDeteccion.Visible then
    if CBDeteccion.Checked then
      EjecutarDeteccion;
  if PuedeTerminar and CBTratamiento.Visible then
    if CBTratamiento.Checked then
      EjecutarTratamiento;
end;

procedure TFEveSincronizacionCelo.IBQDescMetodosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

procedure TFEveSincronizacionCelo.configurarColumnasACargar;
begin
inherited;
if existeCampo('Condición') then CBCondCorp.Checked:=true;
end;



end.
