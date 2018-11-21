unit UEveEgresoToro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveServicioBasico, DB, IBCustomDataSet, IBQuery, ActnList,
  ComCtrls, StdCtrls, MemoAuto, DBCtrls, UDBLookupComboBoxAuto, Types,
  DateTimePickerAuto, Grids, DBGrids, UBDBGrid, Buttons, DateUtils,
  ExtCtrls, IBStoredProc, IBDatabase, UFrameMangazo, DataExport, DataToXLS,
  WinXP, EditAuto, ImgList, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveEgresoToro = class(TFEveServicioBasico)
    Label1: TLabel;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    SPCerrar_Servicio: TIBStoredProc;
    IBQFechaIngresoServicio: TIBQuery;
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
    IBQRNCerrarServicio: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure BDBGServiciosCellClick(Column: TColumn);
    procedure DTPAFechaCloseUp(Sender: TObject);
    procedure IBDSSimpleRESPSetText(Sender: TField; const Text: String);
    procedure IBQPotreroAfterOpen(DataSet: TDataSet);
    procedure DBLCBAPotreroCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
  private
    function ChekCierreServicio() : Boolean;
    procedure CerrarServicio;
  protected
    Procedure CargarParametrosRN;override;
    Procedure CargarParametrosSP;override;
    procedure CargarDatosGrilla; override;
    Procedure CargarParametrosMasivo; override;
    procedure LoadSQLStringList;override;
  public
  end;

var
  FEveEgresoToro: TFEveEgresoToro;

implementation

uses UDMSoftvet, UPrincipal, UEveSimple, UEveUniversal,UEveIngresoToro,UClassType,
  UMensajeHuella, UABMPotreros, UAbmEmpleados, UABMSimple, UTraduccion;

{$R *.dfm}

(*
  Carga los parametros necesarios para las Reglas de Negocio Asociadas al evento
*)
Procedure TFEveEgresoToro.CargarParametrosRN;
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
Procedure TFEveEgresoToro.CargarParametrosSP;
begin
 IBQSPEventoInd.ParamByName('FECHA').Value  := DTPAFecha.GetDato;
 IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal; //a esta instancia ya se conoce el animal
 IBQSPEventoInd.ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IDGrupo;
 IBQSPEventoInd.ParamByName('SERVICIO').Value := IDServicio;
 IBQSPEventoInd.ParamByName('POTRERO').Value := IDPotrero;
 IBQSPEventoInd.ParamByName('TIPOEGRESO').Value := 1;
end;


procedure TFEveEgresoToro.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;

  MSimple.SQLBasico := 'select ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otro, sexo, ID_SERVICIO, nombre, apodo From VIS_EGRESO_TORO';
  //FSQLInicial := 'select ID_RP, ID_SENASA,id_animal, sexo From VIS_EGRESO_TORO A where A.establecimiento = '+inttostr(FPrincipal.EstablecimientoActual);
  FCrearGrupo := false;
  ControlEventoOnExit(self);
end;

(*
  Agrega los datos del evento a la grilla
*)
procedure TFEveEgresoToro.CargarDatosGrilla;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
  begin
    IBDSSimple.Insert;}
    IBDSSimple.FieldByName('ID_RP').Value:= MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value:= MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    IBDSSimple.FieldByName('ID_ANIMAL').Value:= MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];

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
  //end;
end;


(*
  carga los parametros de la grilla detalle para  el SP correspondiente
*)
Procedure TFEveEgresoToro.CargarParametrosMasivo;
begin
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('SERVICIO').Value := idservicio;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := IBDSSimple.FieldValues['RESPONSABLE'];
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IDGrupo;
  IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBAPotrero.GetDato;
  IBQSPEventoInd.ParamByName('TIPOEGRESO').Value := 1;
end;


procedure TFEveEgresoToro.CerrarServicio;
var
  fecha: TDate;
  potrero: integer;
begin
  fecha := DTPAFecha.GetDato;
  SPCerrar_Servicio.ParamByName('FECHA_FIN').Value := DTPAFecha.GetDato;
  SPCerrar_Servicio.ParamByName('SERVICIO').Value  := IDServicio;
  SPCerrar_Servicio.ParamByName('ID_GRUPO').Value  := IDGrupo;
    SPCerrar_Servicio.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;

  SPCerrar_Servicio.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.KeyValue;

  SPCerrar_Servicio.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
  SPCerrar_Servicio.ParamByName('LOG_FECHA_MODIFICADO').Value := now;

  potrero := DBLCBAPotrero.GetDato;
  SPCerrar_Servicio.ParamByName('POTRERO').Value := DBLCBAPotrero.GetDato;

  SPCerrar_Servicio.ParamByName('DISPARADOR').Value :=  NULL;
  SPCerrar_Servicio.ParamByName('CONDICION_CORPORAL').Value := NULL;
  SPCerrar_Servicio.ParamByName('TIPOEGRESO').Value := 1;  //TIPOEGRESO TORO
  SPCerrar_Servicio.ExecProc;
end;


function TFEveEgresoToro.ChekCierreServicio : Boolean;
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
  if (CompareDate(fecha,DTPAFecha.Date)= LessThanValue) then
    resultado := true
  else
  begin
    resultado := false;
    MostrarMensaje(tmError,'No se puede cerrar el servicio hasta la fecha '+DateToStr(fecha)+', dado que se ingresaron animales al servicio el dia '+DateToStr(fecha));
  end;
  Result := resultado;
end;

procedure TFEveEgresoToro.ATerminarExecute(Sender: TObject);
var v:TFEveIngresoToro;
    p:boolean;
begin
  IDPotrero := DBLCBAPotrero.KeyValue;
  if not(FConManga) then
  begin
    MSimple.IBQDisponibles.Close;
    MSimple.IBQDisponibles.SQL.Clear;
    MSimple.IBQDisponibles.SQL.Add(MSimple.SQLBasico);
    MSimple.IBQDisponibles.Open;
    MSimple.IBQDisponibles.Last;
    MSimple.IBQDisponibles.First;
    if (MSimple.IBQDisponibles.RecordCount>1) then p := false
    else p := true;
  end
  else
    p := MSimple.IBQDisponibles.IsEmpty;
  if(p)then
  Begin
   if (MostrarMensaje(tmConsulta, 'Desea realizar un Intercambio de Toros?') = mrYes) then
   begin
      v := TFEveIngresoToro.Create(self);
      v.ModoEve  := meMasivo;
      v.ConManga := true;
      v.HacerCommit := false;
      v.TSServicio.TabVisible:= false;
      v.PTitulo.Caption := Traducir('Intercambio');
      v.IDServicio := self.IDServicio;
      v.BDBGServicios.DataSource.DataSet.Locate('ID_SERVICIO',self.IDServicio,[loCaseInsensitive]);
      v.ConServicio := true;
      v.IDGrupo := self.IDGrupo;
      v.DTPAFecha.Date := DTPAFecha.Date;
      v.DBLCBAResponsable.KeyValue := self.DBLCBAResponsable.KeyValue;
      v.MSimple.IBQSeleccionados.Open;
      v.ShowModal;

      if(v.RealizoIntercambio)then
      begin
        inherited ATerminarExecute(self);
        MSimple.IBQDisponibles.Close;
        MSimple.IBQDisponibles.Open;
      end
      else
      begin
        if ChekCierreServicio then
        begin
          if (MostrarMensaje(tmConsulta, 'Desea cerrar el Servicio?') = mrYes) then
          begin
            inherited;
            if (PuedeTerminar) then
              CerrarServicio;
          end;
        end;
      end;
      v.Destroy;
   end
   else
      if ChekCierreServicio then
      begin
        if (MostrarMensaje(tmConsulta, 'Desea cerrar el Servicio?') = mrYes) then
        begin
         inherited;
          if (PuedeTerminar) then
            CerrarServicio;
        end;
      end;
  end
 else
  begin
    //showmessage('aca pasa');
    inherited; {esta linea esta para que se efectue el commit luego de cerrar el servicio x que el commit
                del principal se hace en el inherited y no gurda los cambios del cerrar servicio}
   end ;  //260617              
 
  FPrincipal.IBTPrincipal.CommitRetaining;
End;

procedure TFEveEgresoToro.BDBGServiciosCellClick(Column: TColumn);
begin
  inherited;
  MSimple.SQLBasico :='select ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otro, sexo, ID_SERVICIO From VIS_EGRESO_TORO where (ID_SERVICIO = '+ IntToStr(DMSoftvet.IBQIngEgrServicio.FieldValues['ID_SERVICIO'])+') AND (GRUPO = '+ IntToStr(DMSoftvet.IBQIngEgrServicio.FieldValues['GRUPO'])+')';
  MSimple.IBQDisponibles.Close;
  MSimple.IBQDisponibles.SQL.Clear;
  MSimple.IBQDisponibles.SQL.Add(MSimple.SQLBasico);
  MSimple.IBQDisponibles.Open;
  MSimple.IBQSeleccionados.Close;
  MSimple.IBQSeleccionados.Open;

  IDPotrero := BDBGServicios.DataSource.DataSet.FieldValues['id_POTRERO'];
end;


(*
  Carga el string List que se va a mostrar en el lookup de la columna correspondiente
*)
procedure TFEveEgresoToro.LoadSQLStringList;
begin
  inherited;
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
end;

procedure TFEveEgresoToro.DTPAFechaCloseUp(Sender: TObject);
begin
  inherited;
  IBQFechaIngresoServicio.Close;
  IBQFechaIngresoServicio.ParamByName('idservicio').Value := IDservicio;
  IBQFechaIngresoServicio.Open;
  if(IBQFechaIngresoServicio.FieldByName('fecha').Value > DTPAFecha.Date)then
    MostrarMensaje(tmAdvertencia, 'La Fecha de Egreso no puede ser menor a la de Ingreso a servicio');

end;

procedure TFEveEgresoToro.IBDSSimpleRESPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
    SetText(Sender,Text);
end;

procedure TFEveEgresoToro.IBQPotreroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFEveEgresoToro.DBLCBAPotreroCloseUp(Sender: TObject);
begin
  inherited;
  IDPotrero := DBLCBAPotrero.KeyValue;
end;

procedure TFEveEgresoToro.FormShow(Sender: TObject);
begin
  inherited;
  //MSimple.PasarParametros(1,0);{Para filtrar las categorias para el Combo de la Manga
    // - "2" solo muestra categorias de hembras}
  MSimple.PasarParametros(1,6);     
  DBLCBAPotrero.AsignarValorDefecto;
//  IDPotrero := DBLCBAPotrero.KeyValue;
  DBLCBAResponsable.AsignarValorDefecto;
  DMSoftvet.IBQIngEgrServicio.First;
  if not ConServicio then
    BDBGServiciosCellClick(nil);
end;

procedure TFEveEgresoToro.PCBasicoChange(Sender: TObject);
begin
  inherited;
  if (PCBasico.ActivePage = TSManga) then
  begin
     { MSimple.IBQDisponibles.Close;
      msimple.SQLBasico := FSQLInicial +' and (A.ID_SERVICIO = '+ IntToStr(DMSoftvet.IBQIngEgrServicio.FieldValues['ID_SERVICIO'])+') AND (A.GRUPO = '+ IntToStr(DMSoftvet.IBQIngEgrServicio.FieldValues['GRUPO'])+')';
      MSimple.IBQDisponibles.Open;
      MSimple.IBQSeleccionados.Close;
      MSimple.IBQSeleccionados.Open;   }
  end;
  if ( PCBasico.ActivePage = TSDatos) then
    DTPAFecha.Date := DMSoftvet.IBQIngEgrServicio.FieldValues['FECHA_FIN_ESTIMADA'];
  TSServicio.ImageIndex := 7;
  if(PCBasico.ActivePage = TSServicio)then
    TSServicio.ImageIndex := 6;
end;

procedure TFEveEgresoToro.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveEgresoToro.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveEgresoToro.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveEgresoToro.Label1Click(Sender: TObject);
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

procedure TFEveEgresoToro.Label1MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label1.Font.Color:= $00606C02;
      Label1.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveEgresoToro.Label1MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label1.Font.Color:= clWindowText;
      Label1.Font.Style:= [fsUnderline];
    end;  
end;

end.
