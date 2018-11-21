unit UEveIngresoServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveServicioBasico, DB, IBCustomDataSet, IBQuery, ActnList,
  ComCtrls, StdCtrls, MemoAuto, DBCtrls, UDBLookupComboBoxAuto,
  DateTimePickerAuto, UFrameMangazo, Grids, DBGrids, UBDBGrid, Buttons,
  ExtCtrls, IBDatabase, IBStoredProc, DataExport, DataToXLS, WinXP,
  EditAuto, ImgList, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveIngresoServicio = class(TFEveServicioBasico)
    LCondicionCorporal: TLabel;
    IBQSPRNRESULT: TIBStringField;
    IBQSPRNMENSAJE: TIBStringField;
    DBLCBACondicionCorporal: TDBLookupComboBoxAuto;
    IBQEdadAnimal: TIBQuery;
    IBQEdadAnimalVALOR: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleIDSERVICIO: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleSERVICIO: TIBStringField;
    IBDSSimpleIDCONDCORPORAL: TIntegerField;
    IBDSSimpleCONDICIONCORPORAL: TFloatField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBSPVerificarAnimalServ: TIBStoredProc;
    IBQDeleteServicios: TIBQuery;
    CBCondicionCorporal: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure IBDSSimpleFECHASetText(Sender: TField; const Text: String);
    procedure FormShow(Sender: TObject);
    procedure BDBGServiciosCellClick(Column: TColumn);
    procedure IBDSSimpleCONDICIONCORPORALSetText(Sender: TField;
      const Text: String);
    procedure ATerminarExecute(Sender: TObject);
    procedure CBCondicionCorporalClick(Sender: TObject);
    procedure CBCondicionCorporalKeyPress(Sender: TObject; var Key: Char);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
  private
    FEdadMinima:Integer;
    FEdadMaxima:Integer;
    procedure controlCondicionCorporal;//agregue codigo      
  protected
    Procedure CargarParametrosRN;override;
    Procedure CargarParametrosSP;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
  public
    { Public declarations }
  end;

var
  FEveIngresoServicio: TFEveIngresoServicio;

implementation

uses UPrincipal, uTiposGlobales, UDMSoftvet, UEveSimple, UClassType, UABMEmpleados;

{$R *.dfm}

(*
  Carga los parametros necesarios para las Reglas de Negocio Asociadas al evento
*)
Procedure TFEveIngresoServicio.CargarParametrosRN;
begin
 IBQSPRN.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
 IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
 IBQSPRN.ParamByName('servicio').AsInteger := IDServicio;
 if(self.ModoEve = meIndividual)then
   IBQSPRN.ParamByName('animal').AsInteger := IDAnimal
 else
   IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
end;

(*
  carga los parametros de la grilla detalle para el SP de insercion correspondiente
*)
Procedure TFEveIngresoServicio.CargarParametrosSP;
begin
 IBQSPEventoInd.ParamByName('FECHA').Value  := DTPAFecha.GetDato;
 IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal; //a esta instancia ya se conoce el animal
 IBQSPEventoInd.ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
 IBQSPEventoInd.ParamByName('ID_POTRERO').Value := IDPotrero;
 IBQSPEventoInd.ParamByName('SERVICIO').Value :=  IDServicio;
 if (DBLCBACondicionCorporal.KeyValue <> Null) and (DBLCBACondicionCorporal.KeyValue <> 0)then
   IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := DBLCBACondicionCorporal.KeyValue;
 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IDGrupo;
end;

(*
  Agrega los datos del evento a la grilla
*)
procedure TFEveIngresoServicio.CargarDatosGrilla;
begin
  inherited;
  {todo -ocarina : una vez que tengamos la tabla aux, chequear que se agregen solo las filas que faltan}
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
  begin
    IBDSSimple.Insert;}
    IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    IBDSSimple.FieldByName('ID_ANIMAL').Value:=MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];

    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
    //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
    RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[DBLCBAResponsable.GetDato,DBLCBAResponsable.Text]);
    //IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.GetDato;
    //IBDSSimple.FieldByName('RESP').Value:= DBLCBAResponsable.Text;
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;

    if (DBLCBACondicionCorporal.KeyValue <> Null) and (DBLCBACondicionCorporal.KeyValue <> 0) then
     begin
        RealizarCambio(DBLCBACondicionCorporal,[IBDSSimple.FieldByName('CONDICIONCORPORAL'),IBDSSimple.FieldByName('IDCONDCORPORAL')],[DBLCBACondicionCorporal.Text,DBLCBACondicionCorporal.KeyValue]);
        //IBDSSimple.FieldByName('CONDICIONCORPORAL').Value:= DBLCBACondicionCorporal.Text;
        //IBDSSimple.FieldByName('IDCONDCORPORAL').Value:= DBLCBACondicionCorporal.KeyValue;
     end;
    RealizarCambio(BDBGServicios,[IBDSSimple.FieldByName('SERVICIO'),IBDSSimple.FieldByName('IDSERVICIO')],[BDBGServicios.DataSource.DataSet.FieldValues['NOMBRE'],IDServicio]);
    //IBDSSimple.FieldByName('SERVICIO').Value:= BDBGServicios.DataSource.DataSet.FieldValues['NOMBRE'];
    //IBDSSimple.FieldByName('IDSERVICIO').Value:= IDServicio;
  //end;
end;

(*
  carga los parametros de la grilla detalle para  el SP correspondiente
*)
Procedure TFEveIngresoServicio.CargarParametrosMasivo;
begin
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value:= IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('SERVICIO').Value := IDServicio;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IDGrupo;
  IBQSPEventoInd.ParamByName('ID_POTRERO').Value := IDPotrero;
  //if (DBLCBACondicionCorporal.KeyValue <> 0) then
  IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := IBDSSimple.FieldValues['IDCONDCORPORAL'];
end;

procedure TFEveIngresoServicio.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQCondicionCorporal.Open;
  IBQEdadAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  {Obtengo la cantidad minima de meses que debe tener una hembra para entrar a servicio sin mostrar una advertencia}
  IBQEdadAnimal.Close;
  IBQEdadAnimal.ParamByName('nombreparametro').AsString := 'MSEDADSER1';
  IBQEdadAnimal.Open;
  FEdadMinima := IBQEdadAnimalVALOR.AsInteger*30;
  {Obtengo la cantidad maxima de meses que debe tener una hembra para entrar a servicio}
  IBQEdadAnimal.Close;
  IBQEdadAnimal.ParamByName('nombreparametro').AsString := 'MSEDADSER4';
  IBQEdadAnimal.Open;
  FEdadMaxima := IBQEdadAnimalVALOR.AsInteger*30;
  {MSimple.SQLBasico := Hembras que sean  > 10(300 dias) meses y < 240(720 dias) meses pueden entrar a servicio}
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, nombre, apodo from VIS_INGRESO_HEMBRA where ((CURRENT_DATE - FECHA_NACIMIENTO) >'+ IntToStr(FEdadMinima)+' ) and ((CURRENT_DATE - FECHA_NACIMIENTO) <'+IntToStr(FEdadMaxima)+' )';
  FCrearGrupo := false;
  end;

(*
  Carga el string List que se va a mostrar en el lookup de la columna correspondiente
*)
procedure TFEveIngresoServicio.LoadSQLStringList;
begin
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('CONDICIONCORPORAL',TObject(DMSoftvet.DSCondicionCorporal));
  inherited;
end;

procedure TFEveIngresoServicio.IBDSSimpleFECHASetText(Sender: TField;
  const Text: String);
var PickPos: integer;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
      SetText(Sender,Text);
      if(Sender.FieldName = 'CONDICIONCORPORAL')then
      begin
         if((StrToInt(Text) > 0) and (StrToInt(Text) <= 10))then
         begin
           Sender.AsInteger := StrToInt(Text);
           PickPos := BDBGSimple.ColumnByField('CONDICIONCORPORAL').PickList.IndexOf(BDBGSimple.ColumnByField('CONDICIONCORPORAL').Field.AsString);
           IBDSSimpleCONDICIONCORPORAL.AsInteger := TClassType(BDBGSimple.ColumnByField('CONDICIONCORPORAL').PickList.Objects[PickPos]).getValue;
         end;

      end;
  end;
end;

procedure TFEveIngresoServicio.FormShow(Sender: TObject);
begin
  inherited;
//  MSimple.PasarParametros(2,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  MSimple.PasarParametros(2,5);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  DBLCBAResponsable.AsignarValorDefecto;

  DBLCBACondicionCorporal.KeyValue := 0;
  DBLCBACondicionCorporal.Enabled:= false;
  controlCondicionCorporal;
end;

procedure TFEveIngresoServicio.BDBGServiciosCellClick(Column: TColumn);
begin
  inherited;
 (*Si el evento es masivo, abre por defecto la manga con todos los animales
  a los cuales puede efectuarse el evento*)
 { if(ModoEve = meMasivo)then
    MSimple.RBTodas.Checked := true;}

end;

procedure TFEveIngresoServicio.IBDSSimpleCONDICIONCORPORALSetText(
  Sender: TField; const Text: String);
var aux: double;
    aux2 : string;
    PickPos :integer;
begin
  inherited;
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

          PickPos := BDBGSimple.ColumnByField('CONDICIONCORPORAL').PickList.IndexOf(BDBGSimple.ColumnByField('CONDICIONCORPORAL').Field.AsString);
          //IBDSSimpleCONDICIONCORPORAL.AsInteger := TClassType(BDBGSimple.ColumnByField('CONDICIONCORPORAL').PickList.Objects[PickPos]).getValue;
          IBDSSimple.FieldByName('IDCONDCORPORAL').Value :=  TClassType(BDBGSimple.ColumnByField('CONDICIONCORPORAL').PickList.Objects[PickPos]).getValue;
        end;
  end;

end;

procedure TFEveIngresoServicio.ATerminarExecute(Sender: TObject);
begin
  IBQDeleteServicios.Close;
  IBQDeleteServicios.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDeleteServicios.Open;
  inherited;
end;

procedure TFEveIngresoServicio.controlCondicionCorporal;
begin
  DBLCBACondicionCorporal.Enabled := CBCondicionCorporal.Checked;
  if (not DBLCBACondicionCorporal.Enabled) then
    DBLCBACondicionCorporal.KeyValue := null;

  if (CBCondicionCorporal.Checked) then
    begin
      DBLCBACondicionCorporal.EsRequerido:= true;
      LCondicionCorporal.Enabled:= true;
      DBLCBACondicionCorporal.KeyValue:= 1;
    end
   else
    begin
       DBLCBACondicionCorporal.EsRequerido:= false;
       DBLCBACondicionCorporal.KeyValue := 0;       
       LCondicionCorporal.Enabled:= false;
     end;
end;

procedure TFEveIngresoServicio.CBCondicionCorporalClick(Sender: TObject);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveIngresoServicio.CBCondicionCorporalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveIngresoServicio.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveIngresoServicio.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveIngresoServicio.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveIngresoServicio.PCBasicoChange(Sender: TObject);
begin
  inherited;
  TSServicio.ImageIndex := 7;
  if(PCBasico.ActivePage = TSServicio)then
    TSServicio.ImageIndex := 6;
end;

end.
