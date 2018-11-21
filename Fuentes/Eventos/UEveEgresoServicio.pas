 unit UEveEgresoServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveServicioBasico, DB, IBCustomDataSet, IBQuery, ActnList,
  ComCtrls, StdCtrls, MemoAuto, DBCtrls, UDBLookupComboBoxAuto, Types,
  DateTimePickerAuto, Grids, DBGrids, UBDBGrid, Buttons, DateUtils,
  ExtCtrls, IBDatabase, IBStoredProc, UFrameMangazo, DataExport, DataToXLS,
  WinXP, EditAuto, ImgList, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveEgresoServicio = class(TFEveServicioBasico)
    Label1: TLabel;
    LCondicionCorporal: TLabel;
    DBLCBACondicionCorporal: TDBLookupComboBoxAuto;
    Label2: TLabel;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    SPCerrar_Servicio: TIBStoredProc;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleSERVICIO: TIBStringField;
    IBDSSimpleIDSERVICIO: TIntegerField;
    IBDSSimpleIDCONDCORPORAL: TIntegerField;
    IBDSSimpleCONDICION_CORPORAL: TFloatField;
    IBDSSimpleEW: TIBStringField;
    CBCondicionCorporal: TCheckBox;
    IBQRNCerrarServicio: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BDBGServiciosCellClick(Column: TColumn);
    procedure ATerminarExecute(Sender: TObject);
    procedure DBLCBAPotreroCloseUp(Sender: TObject);
    procedure IBDSSimpleRESPSetText(Sender: TField; const Text: String);
    procedure FormShow(Sender: TObject);
    procedure BDBGSimpleCellClick(Column: TColumn);
    procedure IBDSSimpleCONDICION_CORPORALSetText(Sender: TField;
      const Text: String);
    procedure TSMangaShow(Sender: TObject);
    procedure CBCondicionCorporalClick(Sender: TObject);
    procedure CBCondicionCorporalKeyPress(Sender: TObject; var Key: Char);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
  private
    procedure controlCondicionCorporal;//agregue codigo
    function ChekCierreServicio : Boolean;
    procedure CerrarServicio;
    function evaluarCierreServicio: boolean;
  protected
    Procedure CargarParametrosRN;override;
    Procedure CargarParametrosSP;override;
    Procedure CargarParametrosMasivo; override;
    procedure CargarDatosGrilla; override;
    procedure LoadSQLStringList;override;
  public
    { Public declarations }
  end;

var
  FEveEgresoServicio: TFEveEgresoServicio;

implementation

uses UPrincipal, uTiposGlobales, UDMSoftVet,UClassType, UEveUniversal, UEveSimple,
  UMensajeHuella, UABMPotreros, UAbmEmpleados, UABMSimple, UTraduccion;

{$R *.dfm}

(*
  Carga los parametros necesarios para las Reglas de Negocio Asociadas al evento
*)
Procedure TFEveEgresoServicio.CargarParametrosRN;
begin
 IBQSPRN.ParamByName('servicio').AsInteger := IDServicio;
 IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
 if(self.ModoEve = meIndividual)then
   begin
     IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
     IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
   end
 else
   begin
     IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
     IBQSPRN.ParamByName('fecha').AsDateTime := IBDSSimple.fieldbyname('fecha').AsDateTime;
   end;
end;

(*
  carga los parametros de la grilla detalle para el SP de insercion correspondiente
*)
Procedure TFEveEgresoServicio.CargarParametrosSP;
begin
 IBQSPEventoInd.ParamByName('FECHA').Value  := DTPAFecha.GetDato;
 IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
 IBQSPEventoInd.ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
 IBQSPEventoInd.ParamByName('SERVICIO').Value := IDServicio;
 if (DBLCBACondicionCorporal.KeyValue <> Null) and (DBLCBACondicionCorporal.KeyValue <> 0)then
   IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value :=DBLCBACondicionCorporal.KeyValue;
 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IDGrupo;
 IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBAPotrero.GetDato;
 IBQSPEventoInd.ParamByName('TIPOEGRESO').Value := 2;
end;

(*
  Agrega los datos del evento a la grilla
*)
procedure TFEveEgresoServicio.CargarDatosGrilla;
begin
  inherited;
  {todo -ocarina : una vez que tengamos la tabla aux, chequear que se agregen solo las filas que faltan}
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
  begin
    IBDSSimple.Insert;  }
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
    RealizarCambio(BDBGServicios,[IBDSSimple.FieldByName('SERVICIO'),IBDSSimple.FieldByName('IDSERVICIO')],[BDBGServicios.DataSource.DataSet.FieldValues['NOMBRE'],IDServicio]);
    //IBDSSimple.FieldByName('SERVICIO').Value := BDBGServicios.DataSource.DataSet.FieldValues['NOMBRE'];
    //IBDSSimple.FieldByName('IDSERVICIO').Value:= IDServicio;
    if (DBLCBACondicionCorporal.KeyValue <> Null) and (DBLCBACondicionCorporal.KeyValue <> 0) then
      begin
       RealizarCambio(DBLCBACondicionCorporal,[IBDSSimple.FieldByName('IDCONDCORPORAL'),IBDSSimple.FieldByName('CONDICION_CORPORAL')],[DBLCBACondicionCorporal.KeyValue,DBLCBACondicionCorporal.Text]);
       //IBDSSimple.FieldByName('IDCONDCORPORAL').Value:= DBLCBACondicionCorporal.KeyValue;
       //IBDSSimple.FieldByName('CONDICION_CORPORAL').Value:= DBLCBACondicionCorporal.Text;
      end;
  //end;
end;

(*
  carga los parametros de la grilla detalle para  el SP correspondiente
*)
Procedure TFEveEgresoServicio.CargarParametrosMasivo;
begin
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('SERVICIO').Value := IDServicio;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IDGrupo;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('POTRERO').Value := IDPotrero;
  //if (DBLCBACondicionCorporal.KeyValue <> 0) then
  IBQSPEventoInd.ParamByName('condicion_corporal').Value := IBDSSimple.FieldValues['IDCONDCORPORAL'];
  IBQSPEventoInd.ParamByName('TIPOEGRESO').Value := 2;
end;

procedure TFEveEgresoServicio.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQCondicionCorporal.Open;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  MSimple.SQLBasico := 'select ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otro, sexo, ID_SERVICIO, nombre, apodo From VIS_EGRESO_HEMBRA';
  //FSQLInicial := 'select ID_RP, ID_SENASA,id_animal, sexo From VIS_EGRESO_HEMBRA A where A.establecimiento = '+inttostr(FPrincipal.EstablecimientoActual);
  ControlEventoOnExit(self);
  FCrearGrupo := false;
end;

procedure TFEveEgresoServicio.BDBGServiciosCellClick(Column: TColumn);
begin
  inherited;
  MSimple.SQLBasico :='select ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otro, sexo, ID_SERVICIO From VIS_EGRESO_HEMBRA where (ID_SERVICIO = '+ IntToStr(DMSoftvet.IBQIngEgrServicio.FieldValues['ID_SERVICIO'])+') AND (GRUPO = '+ IntToStr(DMSoftvet.IBQIngEgrServicio.FieldValues['GRUPO'])+')';
  MSimple.IBQDisponibles.Close;
  MSimple.IBQDisponibles.SQL.Clear;
  MSimple.IBQDisponibles.SQL.Add(MSimple.SQLBasico);
  MSimple.IBQDisponibles.Open;
  MSimple.IBQSeleccionados.Close;
  MSimple.IBQSeleccionados.Open;
end;

function TFEveEgresoServicio.ChekCierreServicio : Boolean;
var
  fecha : TDate;
  resultado : Boolean;
begin
  resultado := false;
  IBQRNCerrarServicio.Close;
  IBQRNCerrarServicio.ParamByName('servicio').Value := IDServicio;
  IBQRNCerrarServicio.ParamByName('grupo').Value := IDGrupo;
  IBQRNCerrarServicio.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQRNCerrarServicio.Open;
  fecha := IBQRNCerrarServicio.FieldValues['fecha_maxima'];
  if CompareDate(fecha,DTPAFecha.Date)= LessThanValue then
    resultado := true
  else
  begin
    resultado := false;
    MostrarMensaje(tmError,Traducir('No se puede cerrar el servicio hasta la fecha ')+DateToStr(fecha)+Traducir(', dado que se ingresaron animales al servicio el dia ')+DateToStr(fecha));
  end;
  Result := resultado;
end;

procedure TFEveEgresoServicio.CerrarServicio;
begin
  SPCerrar_Servicio.ParamByName('FECHA_FIN').AsDate := DTPAFecha.Date;
  SPCerrar_Servicio.ParamByName('SERVICIO').AsInteger  := IDServicio;
  SPCerrar_Servicio.ParamByName('ID_GRUPO').AsInteger  := IDGrupo;
  SPCerrar_Servicio.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  SPCerrar_Servicio.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.KeyValue;
  SPCerrar_Servicio.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
  SPCerrar_Servicio.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
  SPCerrar_Servicio.ParamByName('POTRERO').AsInteger := IDPotrero;
  SPCerrar_Servicio.ParamByName('DISPARADOR').Value := NULL;
  if ((DBLCBACondicionCorporal.KeyValue <> Null) and (DBLCBACondicionCorporal.KeyValue <> 0)) then
    SPCerrar_Servicio.ParamByName('CONDICION_CORPORAL').Value := DBLCBACondicionCorporal.GetDato
  else
    SPCerrar_Servicio.ParamByName('CONDICION_CORPORAL').Value := NULL;
  SPCerrar_Servicio.ParamByName('TIPOEGRESO').Value := 2;//TIPOEGRESO HEMBRA
  SPCerrar_Servicio.ExecProc;
end;

function TFEveEgresoServicio.evaluarCierreServicio: boolean;
var
  resultado: boolean;
begin
  resultado := false;
  
  if not(FConManga) then
  begin
    MSimple.IBQDisponibles.Close;
    MSimple.IBQDisponibles.SQL.Clear;
    MSimple.IBQDisponibles.SQL.Add(MSimple.SQLBasico);
    MSimple.IBQDisponibles.Open;
    MSimple.IBQDisponibles.Last;
    MSimple.IBQDisponibles.First;

    resultado := MSimple.IBQDisponibles.RecordCount <= 1;
  end
  else
  begin
    resultado := MSimple.IBQDisponibles.IsEmpty;
  end;

  evaluarCierreServicio := resultado;
end;

procedure TFEveEgresoServicio.ATerminarExecute(Sender: TObject);
var
  evaluarCierre : Boolean;
  sqlString: string;
begin
 evaluarCierre := evaluarCierreServicio;

 if (evaluarCierre)then
 begin
    if ChekCierreServicio then
    begin
      inherited;
      if (MostrarMensaje(tmConsulta, 'Desea cerrar el Servicio?') = mrYes) then
      begin
//        inherited;
        if (PuedeTerminar) then
          CerrarServicio;
      end;
    end
    else
    begin
      MostrarMensaje(tmAdvertencia, 'El evento será cancelado');
      Close;
    end;
  end
  else
  begin
    inherited;
  end;
  FPrincipal.IBTPrincipal.CommitRetaining;
end;

(*
  Carga el string List que se va a mostrar en el lookup de la columna correspondiente
*)
procedure TFEveEgresoServicio.LoadSQLStringList;
begin
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('CONDICION_CORPORAL',TObject(DMSoftvet.DSCondicionCorporal));
  inherited;
end;


procedure TFEveEgresoServicio.DBLCBAPotreroCloseUp(Sender: TObject);
begin
  inherited;
  IDPotrero := DBLCBAPotrero.KeyValue;
end;

procedure TFEveEgresoServicio.IBDSSimpleRESPSetText(Sender: TField;
  const Text: String);
var PickPos: integer;
begin
  inherited;
  SetText(Sender,Text);
  if(Sender.FieldName = 'CONDICIONCORPORAL')then
  begin
     if((StrToInt(Text) > 0) and (StrToInt(Text) <= 10))then
         Sender.AsInteger := StrToInt(Text);
      PickPos := BDBGSimple.ColumnByField('CONDICION_CORPORAL').PickList.IndexOf(BDBGSimple.ColumnByField('CONDICION_CORPORAL').Field.AsString);
      IBDSSimpleCONDICION_CORPORAL.AsInteger := TClassType(BDBGSimple.ColumnByField('CONDICION_CORPORAL').PickList.Objects[PickPos]).getValue;
  end;
end;

procedure TFEveEgresoServicio.FormShow(Sender: TObject);
begin
  inherited;
  //MSimple.PasarParametros(2,0);{Para filtrar las categorias para el Combo de la Manga
  //  - "2" solo muestra categorias de hembras}
  MSimple.PasarParametros(2,5);
  DBLCBAResponsable.AsignarValorDefecto;
  DBLCBACondicionCorporal.KeyValue := 0;
  DBLCBACondicionCorporal.Enabled:= false;
  controlCondicionCorporal;
  DMSoftvet.IBQIngEgrServicio.First;
  DBLCBAPotrero.AsignarValorDefecto;
  if not ConServicio then
    BDBGServiciosCellClick(nil);
end;

procedure TFEveEgresoServicio.BDBGSimpleCellClick(Column: TColumn);
begin
  inherited;
  (*Si el evento es masivo, abre por defecto la manga con todos los animales
  a los cuales puede efectuarse el evento*)
  {if(ModoEve = meMasivo)then
    MSimple.RBTodas.Checked := true;}

end;

procedure TFEveEgresoServicio.IBDSSimpleCONDICION_CORPORALSetText(
  Sender: TField; const Text: String);
var aux: double;
    aux2 : string;
    PickPos :integer;    
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
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

            PickPos := BDBGSimple.ColumnByField('CONDICION_CORPORAL').PickList.IndexOf(BDBGSimple.ColumnByField('CONDICION_CORPORAL').Field.AsString);
            //IBDSSimpleCONDICION_CORPORAL.AsInteger := TClassType(BDBGSimple.ColumnByField('CONDICION_CORPORAL').PickList.Objects[PickPos]).getValue;
            IBDSSimple.FieldByName('IDCONDCORPORAL').Value :=  TClassType(BDBGSimple.ColumnByField('CONDICION_CORPORAL').PickList.Objects[PickPos]).getValue;
          end;
     end;
   end;  
end;

procedure TFEveEgresoServicio.TSMangaShow(Sender: TObject);
begin
  inherited;
  //MSimpleRBTodasClick(self);
end;

procedure TFEveEgresoServicio.controlCondicionCorporal;
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

procedure TFEveEgresoServicio.CBCondicionCorporalClick(Sender: TObject);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveEgresoServicio.CBCondicionCorporalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveEgresoServicio.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveEgresoServicio.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveEgresoServicio.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveEgresoServicio.Label2Click(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQPotrero.Close;
      DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQPotrero.Open;
    end;
  cambiarCB(DBLCBAPotrero,nroID);
end;

procedure TFEveEgresoServicio.Label2MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label2.Font.Color:= $00606C02;
      Label2.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveEgresoServicio.Label2MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label2.Font.Color:= clWindowText;
      Label2.Font.Style:= [fsUnderline];
    end;  
end;


procedure TFEveEgresoServicio.PCBasicoChange(Sender: TObject);
begin
  inherited;
  if (PCBasico.ActivePage = TSDatos) then
    DTPAFecha.Date := DMSoftvet.IBQIngEgrServicio.FieldValues['fecha_fin_estimada'];
  TSServicio.ImageIndex := 7;
  if(PCBasico.ActivePage = TSServicio)then
    TSServicio.ImageIndex := 6;
end;

end.

