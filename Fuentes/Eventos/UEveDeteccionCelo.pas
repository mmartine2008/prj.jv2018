unit UEveDeteccionCelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBCustomDataSet, IBQuery, ActnList, StdCtrls,
  MemoAuto, ComCtrls, Buttons, ExtCtrls, DBCtrls, UDBLookupComboBoxAuto,
  DateTimePickerAuto, Grids, DBGrids, UBDBGrid, DBClient,
  DBLocal, DBLocalI, IBUpdateSQL, UDBControl, IBStoredProc, UFrameMangazo,
  DataExport, DataToXLS, WinXP, EditAuto, ImgList, PngImageList,
  JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF,
  JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveDeteccionCelo = class(TFEveSimple)
    LFecha: TLabel;
    LObservador: TLabel;
    LHora: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    DTPAHora: TDateTimePickerAuto;
    CBAObservador: TDBLookupComboBoxAuto;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleHORA: TTimeField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDSSimpleHORASetText(Sender: TField; const Text: String);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);

  private
  protected
    procedure CargarDatosGrilla; override;
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
  protected
  public
end;

var
  FEveDeteccionCelo: TFEveDeteccionCelo;

implementation

uses UEveUniversal, UMensajeHuella,UPrincipal, UDMSoftvet, ComObj,UClassType, DateUtils,
  UUniversal, UABMEmpleados,UImportacion;

{$R *.dfm}

(*
  Carga los parametros necesarios para las Reglas de Negocio Asociadas al evento
*)
procedure TFEveDeteccionCelo.CargarParametrosRN;
begin
  inherited;
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
procedure TFEveDeteccionCelo.CargarParametrosSP;
begin
  inherited;
  IBQSPEventoInd.ParamByName('FECHA').Value := DTPAFecha.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := CBAObservador.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value :=NOW;
  IBQSPEventoInd.ParamByName('HORA').AsDateTime :=DTPAHora.Time;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
end;

procedure TFEveDeteccionCelo.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Active := False;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Active := True;
  MSimple.SQLBasico := 'select  ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otro, id_ie, sexo, nombre, apodo From VIS_DETECCION_CELO';
  DTPAFecha.Date := DateOf(Now);
  DTPAHora.DateTime:=Time;
end;


procedure TFEveDeteccionCelo.FormShow(Sender: TObject);
begin
  inherited;
//  DTPAFecha.MaxDate:= now;    
  //MSimple.PasarParametros(2,0);{Para filtrar las categorias para el Combo de la Manga}
  MSimple.PasarParametros(2,5);{Para filtrar las categorias para el Combo de la Manga}
  CBAObservador.AsignarValorDefecto;
end;

(*
  Agrega los datos del evento a la grilla
*)
procedure TFEveDeteccionCelo.CargarDatosGrilla;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
  begin
    IBDSSimple.Insert; }
    IDAnimal :=MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];

    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.Date]);
    //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
    RealizarCambio(CBAObservador,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[CBAObservador.Text,CBAObservador.GetDato]);
    //IBDSSimple.FieldByName('RESP').Value:= CBAObservador.Text;
    //IBDSSimple.FieldByName('RESPONSABLE').Value:=CBAObservador.KeyValue;
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
    RealizarCambio(DTPAHora,[IBDSSimple.FieldByName('HORA')],[DTPAHora.Time]);
    //IBDSSimple.FieldByName('HORA').Value:= DTPAHora.Time;

    IBDSSimple.FieldByName('ID_ANIMAL').Value:= IDAnimal;
  //end;
end;

(*
  carga los parametros de la grilla detalle para  el SP correspondiente
*)
Procedure TFEveDeteccionCelo.CargarParametrosMasivo;
begin
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('HORA').Value := TimeOf(IBDSSimpleHORA.AsDateTime);
end;

(*
  Carga el string List que se va a mostrar en el lookup de la columna correspondiente
*)
procedure TFEveDeteccionCelo.LoadSQLStringList;
begin
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
end;



procedure TFEveDeteccionCelo.IBDSSimpleHORASetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    SetText(Sender,Text);
    if(Sender.FieldName = 'HORA')then
    try
      Sender.AsDateTime :=  StrToTime(Text);
    except on e:Exception do
     begin
       MostrarMensaje(tmError, 'El formato de la hora es inválido');
     end;
    end;
  end;  
end;

procedure TFEveDeteccionCelo.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveDeteccionCelo.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(CBAObservador,nroID);
end;

procedure TFEveDeteccionCelo.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveDeteccionCelo.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveDeteccionCelo.cargarDatos(i:integer);
begin
  inherited;
    IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    IBDSSimple.FieldByName('RESP').Value:= getDato('responsable',anim[i]);
    IBDSSimple.FieldByName('RESPONSABLE').Value:=CBAObservador.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
    IBDSSimple.FieldByName('HORA').Value:= getDato('hora',anim[i]);
end;

procedure TFEveDeteccionCelo.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda
end;

end.
