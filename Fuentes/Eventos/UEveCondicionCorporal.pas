unit UEveCondicionCorporal;

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
  TFEveCondicionCorporal = class(TFEveSimple)
    LObservador: TLabel;
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LCondicionCorporal: TLabel;
    DBLCBACondicionCorporal: TDBLookupComboBoxAuto;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleCONDICION_CORPORAL: TFloatField;
    IBDSSimpleIDCONDICION_CORPORAL: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    IBQTipoCond: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure IBDSSimpleRESPSetText(Sender: TField; const Text: String);
    procedure FormShow(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);

  private
    { Private declarations }
  protected
    Procedure CargarParametrosSP;override;
    Procedure CargarParametrosRN;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
  public
    { Public declarations }
  end;

var
  FEveCondicionCorporal: TFEveCondicionCorporal;

implementation

uses UDMSoftvet, UPrincipal, UClassType, DateUtils, UABMEmpleados,
    UImportacion, UFunctions;

{$R *.dfm}



procedure TFEveCondicionCorporal.CargarParametrosSP;
begin
  inherited;
  IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').AsInteger := DBLCBACondicionCorporal.GetDato;
  IBQSPEventoInd.ParamByName('FECHA').AsDate  := DTPAFecha.Date;
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
  IBQSPEventoInd.ParamByName('DISPARADOR').Value :=  NULL;

end;

procedure TFEveCondicionCorporal.CargarDatosGrilla;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
  begin
    IBDSSimple.Insert;  }
    IDAnimal := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value := MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.Date]);
    //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
    RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[DBLCBAResponsable.Text,DBLCBAResponsable.GetDato]);
    //IBDSSimple.FieldByName('RESP').Value:= DBLCBAResponsable.Text;
    //IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.GetDato;
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
    IBDSSimple.FieldByName('ID_ANIMAL').Value:= IDAnimal;
    RealizarCambio(DBLCBACondicionCorporal,[IBDSSimple.FieldByName('CONDICION_CORPORAL'),IBDSSimple.FieldByName('idcondicion_corporal')],[StrToFloat(DBLCBACondicionCorporal.Text),DBLCBACondicionCorporal.GetDato]);
    //IBDSSimple.FieldByName('CONDICION_CORPORAL').AsFloat:= StrToFloat(DBLCBACondicionCorporal.Text);
    //IBDSSimple.FieldByName('idcondicion_corporal').Value:= DBLCBACondicionCorporal.GetDato;
  //end;
end;

procedure TFEveCondicionCorporal.CargarParametrosMasivo;
begin
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').AsInteger := IBDSSimpleIDCONDICION_CORPORAL.AsInteger;
  IBQSPEventoInd.ParamByName('DISPARADOR').Value :=  NULL;
end;

procedure TFEveCondicionCorporal.CargarParametrosRN;
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


procedure TFEveCondicionCorporal.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQEscalaCondCorp.Close;
  DMSoftvet.IBQEscalaCondCorp.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQEscalaCondCorp.Open;
  MSimple.SQLBasico := 'select ID_RP,ID_SENASA,ID_ANIMAL, id_pc, id_hba, id_otro, id_ie, nombre, apodo  from VIS_CONDICION_CORPORAL';
  DBLCBAResponsable.KeyValue:=-1;
end;

procedure TFEveCondicionCorporal.LoadSQLStringList;
begin
  inherited;
  SQLStringList.AddObject('RESP',DMSoftvet.DSResponsable);
  SQLStringList.AddObject('CONDICION_CORPORAL',DMSoftvet.DSCondicionCorporal);
end;

procedure TFEveCondicionCorporal.IBDSSimpleRESPSetText(Sender: TField;
  const Text: String);
var PickPos: integer;
    condicion : String;
    aux: Extended;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin

      SetText(Sender,Text);
      if(Sender.FieldName = 'CONDICION_CORPORAL')then
         begin
           IBQTipoCond.Close;
           IBQTipoCond.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQTipoCond.Open;
           if (IBQTipoCond.FieldByName('valor').AsInteger = 10) then
            condicion := 'VALOR_ESCALA_10'
           else
            condicion := 'VALOR_ESCALA_5';

           IBQValidaciones.Close;
           IBQValidaciones.Params.Clear;
           IBQValidaciones.SQL.text :='select '+condicion+'  as escala from COD_CONDICIONES_CORPORALES where ('+condicion+' = :valor) ';
           if (Length(Text) < 6) then
             if (TryStrToFloat(UpperCase(Text),aux)) then
              begin
               IBQValidaciones.ParamByName('valor').AsFloat:= StrToFloat(UpperCase(Text));
               IBQValidaciones.Open;
              end;
           if not(IBQValidaciones.IsEmpty) then
           begin
              Sender.AsVariant := IBQValidaciones.FieldByName('escala').AsString ;
              PickPos := BDBGSimple.ColumnByField('CONDICION_CORPORAL').PickList.IndexOf(BDBGSimple.ColumnByField('CONDICION_CORPORAL').Field.AsString);
              IBDSSimpleIDCONDICION_CORPORAL.AsInteger := TClassType(BDBGSimple.ColumnByField('CONDICION_CORPORAL').PickList.Objects[PickPos]).getValue;
           end;
         end;
      if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
              IBDSSimple.FieldValues['EW'] := 'M';
  end;

end;


procedure TFEveCondicionCorporal.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFecha.Date := DateOf(now);
//  DTPAFecha.MaxDate:= now;    
//  MSimple.PasarParametros(0,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  MSimple.PasarParametros(0,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
end;

procedure TFEveCondicionCorporal.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveCondicionCorporal.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(dblcbaresponsable,nroID);
end;

procedure TFEveCondicionCorporal.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveCondicionCorporal.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveCondicionCorporal.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
  var str:string;
  begin
  inherited;
  //hereda
end;

procedure TFEveCondicionCorporal.cargarDatos(i:integer);
begin
  inherited;
    IBDSSimple.FieldByName('ID_SENASA').Value := getDato('senasa',anim[i]);
    IBDSSimple.FieldByName('RESP').Value:= getDato('responsable',anim[i]);
    IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
    IBDSSimple.FieldByName('CONDICION_CORPORAL').AsFloat:= StrToFloat(getDato('condición',anim[i]));
    IBDSSimple.FieldByName('idcondicion_corporal').Value:= DBLCBACondicionCorporal.ListSource.DataSet.Lookup('escala',IBDSSimple.FieldByName('CONDICION_CORPORAL').Value,'ID_CONDICION_CORPORAL');
end;

end.
