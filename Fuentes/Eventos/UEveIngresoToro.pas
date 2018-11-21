unit UEveIngresoToro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveServicioBasico, DB, IBCustomDataSet, IBQuery, ActnList,
  ComCtrls, StdCtrls, MemoAuto, DBCtrls, UDBLookupComboBoxAuto,
  DateTimePickerAuto, Grids, DBGrids, UBDBGrid, Buttons,
  ExtCtrls, IBDatabase, IBStoredProc, UFrameMangazo, DataExport, DataToXLS,
  WinXP, EditAuto, ImgList, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveIngresoToro = class(TFEveServicioBasico)
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
    IBDSSimpleEW: TIBStringField;
    IBQEdadAnimal: TIBQuery;
    IBQEdadAnimalVALOR: TIBStringField;
    IBSPVerificarAnimalServ: TIBStoredProc;
    IBQDeleteServicios: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BDBGServiciosCellClick(Column: TColumn);
    procedure ATerminarExecute(Sender: TObject);
    procedure IBDSSimpleRESPSetText(Sender: TField; const Text: String);
    procedure ACancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
  private
    FEdadMinima:integer;
  protected
    Procedure CargarParametrosRN; override;
    Procedure CargarParametrosSP; override;
    procedure CargarDatosGrilla;  override;
    Procedure CargarParametrosMasivo; override;
    procedure LoadSQLStringList;override;
  public
    RealizoIntercambio : Boolean;
  end;

var
  FEveIngresoToro: TFEveIngresoToro;

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, UDMSoftvet, UEveUniversal, UEveSimple, UClassType, UABMEmpleados;

(*
  Carga los parametros necesarios para las Reglas de Negocio Asociadas al evento
*)
Procedure TFEveIngresoToro.CargarParametrosRN;
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
Procedure TFEveIngresoToro.CargarParametrosSP;
begin
   IBQSPEventoInd.ParamByName('FECHA').Value  := DTPAFecha.GetDato;
   IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
   IBQSPEventoInd.ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
   IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
   IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
   IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
   IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
   IBQSPEventoInd.ParamByName('ID_GRUPO').Value   := IDGrupo;
   IBQSPEventoInd.ParamByName('SERVICIO').Value   := IDServicio;
   IBQSPEventoInd.ParamByName('ID_POTRERO').Value := IDPotrero;
end;

(*
  Agrega los datos del evento a la grilla
*)
procedure TFEveIngresoToro.CargarDatosGrilla;
begin
  inherited;
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
    RealizarCambio(BDBGServicios,[IBDSSimple.FieldByName('SERVICIO'),IBDSSimple.FieldByName('IDSERVICIO')],[BDBGServicios.DataSource.DataSet.FieldValues['NOMBRE'],IDServicio]);
    //IBDSSimple.FieldByName('SERVICIO').Value:= BDBGServicios.DataSource.DataSet.FieldValues['NOMBRE'];
    //IBDSSimple.FieldByName('IDSERVICIO').Value:= IDServicio;
  //end;
end;

(*
  carga los parametros de la grilla detalle para  el SP correspondiente
*)
Procedure TFEveIngresoToro.CargarParametrosMasivo;
begin
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value:= IBDSSimple.FieldValues['RESPONSABLE'];
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('SERVICIO').Value := IDServicio;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IDGrupo;
  IBQSPEventoInd.ParamByName('ID_POTRERO').Value := IDPotrero;
end;

procedure TFEveIngresoToro.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;

  {Obtengo la cantidad minima de meses que debe tener una hembra para entrar a servicio sin mostrar una advertencia}
  IBQEdadAnimal.Close;
  IBQEdadAnimal.ParamByName('nombreparametro').AsString := 'MSEDADSER1';
  IBQEdadAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEdadAnimal.Open;
  FEdadMinima := IBQEdadAnimalVALOR.AsInteger * 30;

  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, nombre, apodo from VIS_INGRESO_TORO where (CURRENT_DATE - FECHA_NACIMIENTO) >'+ IntToStr(FEdadMinima);// minima edad para entrar a servico
  FCrearGrupo := false;
  RealizoIntercambio := false;
end;

procedure TFEveIngresoToro.BDBGServiciosCellClick(Column: TColumn);
begin
  inherited;
  (*Si el evento es masivo, abre por defecto la manga con todos los animales
  a los cuales puede efectuarse el evento*)
  {if(ModoEve = meMasivo)then
    MSimple.RBTodas.Checked := true;}
end;

procedure TFEveIngresoToro.ATerminarExecute(Sender: TObject);
begin
  IBQDeleteServicios.Close;
  IBQDeleteServicios.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDeleteServicios.Open;
  inherited;
  RealizoIntercambio := PuedeTerminar;
  //self.ModalResult := 1;      //estaba deshabilitada pero hacia macanas en el egreso
end;

(*
  Carga el string List que se va a mostrar en el lookup de la columna correspondiente
*)
procedure TFEveIngresoToro.LoadSQLStringList;
begin
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  inherited;
end;

procedure TFEveIngresoToro.IBDSSimpleRESPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
    SetText(Sender,Text);
end;

procedure TFEveIngresoToro.ACancelarExecute(Sender: TObject);
begin
  self.ModalResult := 2;
  inherited;
  RealizoIntercambio := false;
end;

procedure TFEveIngresoToro.FormShow(Sender: TObject);
begin
  inherited;
//  MSimple.PasarParametros(1,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  MSimple.PasarParametros(1,6);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
end;

procedure TFEveIngresoToro.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveIngresoToro.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveIngresoToro.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveIngresoToro.PCBasicoChange(Sender: TObject);
begin
  inherited;
  TSServicio.ImageIndex := 7;
  if(PCBasico.ActivePage = TSServicio)then
    TSServicio.ImageIndex := 6;
end;

end.

