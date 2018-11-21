unit UEveCastracion;

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
  TFEveCastracion = class(TFEveSimple)
    LFecha: TLabel;
    LObservador: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    DBLCBAMetodoCastracion: TDBLookupComboBoxAuto;
    Label1: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleMETODO_CASTRACION: TIBStringField;
    IBDSSimpleID_METODO_CASTRACION: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDSSimpleFECHASetText(Sender: TField; const Text: String);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
   
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
  FEveCastracion: TFEveCastracion;

implementation

{$R *.dfm}
uses UDMSoftvet, UPrincipal,UClassType, DateUtils, UABMEmpleados,UImportacion;


{ TFEveCastracion }


procedure TFEveCastracion.CargarParametrosSP;
begin
  inherited;
  IBQSPEventoInd.ParamByName('ID_METODO_CASTRACION').AsInteger := DBLCBAMetodoCastracion.GetDato;
  IBQSPEventoInd.ParamByName('FECHA').AsDate  := DTPAFecha.Date;
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
end;


procedure TFEveCastracion.CargarDatosGrilla;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
  begin
    IBDSSimple.Insert;   }
    IDAnimal := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value := MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.Date]);
    //IBDSSimple.FieldByName('FECHA').Value := DTPAFecha.GetDato;
    RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[DBLCBAResponsable.Text,DBLCBAResponsable.GetDato]);
    //IBDSSimple.FieldByName('RESP').Value := DBLCBAResponsable.Text;
    //IBDSSimple.FieldByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    //IBDSSimple.FieldByName('OBSERVACION').Value := MAObservacion.GetDato;
    IBDSSimple.FieldByName('ID_ANIMAL').Value := IDAnimal;
    RealizarCambio(DBLCBAMetodoCastracion,[IBDSSimple.FieldByName('ID_METODO_CASTRACION'),IBDSSimple.FieldByName('METODO_CASTRACION')],[DBLCBAMetodoCastracion.GetDato,DBLCBAMetodoCastracion.Text]);
    //IBDSSimple.FieldByName('ID_METODO_CASTRACION').Value := DBLCBAMetodoCastracion.GetDato;
    //IBDSSimple.FieldByName('METODO_CASTRACION').Value := DBLCBAMetodoCastracion.Text;
  //end;
end;

procedure TFEveCastracion.CargarParametrosMasivo;
begin
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('ID_METODO_CASTRACION').Value := IBDSSimpleID_METODO_CASTRACION.AsInteger;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;

end;

procedure TFEveCastracion.CargarParametrosRN;
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


procedure TFEveCastracion.LoadSQLStringList;
begin
  inherited;
  SQLStringList.AddObject('RESP',DMSoftvet.DSResponsable);
  SQLStringList.AddObject('METODO_CASTRACION',DMSoftvet.DSMetodoCastracion);
end;

procedure TFEveCastracion.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  MSimple.SQLBasico := 'select ID_RP, ID_SENASA, ID_ANIMAL, id_pc, id_hba, id_otro, id_ie, nombre, apodo from VIS_CASTRACION';
  DBLCBAMetodoCastracion.AsignarValorDefecto;
end;

procedure TFEveCastracion.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFecha.Date := DateOf(now);
//  DTPAFecha.MaxDate:= now;
//  MSimple.PasarParametros(1);{Para filtrar las categorias para el Combo de la Manga}
  MSimple.PasarParametros(1,4);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  DBLCBAResponsable.AsignarValorDefecto;
end;

procedure TFEveCastracion.IBDSSimpleFECHASetText(Sender: TField;
  const Text: String);
var PickPos: integer;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin

    SetText(sender,Text);
    if(Sender.FieldName = 'METODO_CASTRACION')then
      begin
         IBQValidaciones.Params.Clear;
         IBQValidaciones.SQL.text :='select sinonimo as valor from COD_METODOS_CASTRACION where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or (CODIGO like '''+UpperCase(Text)+'%'')';
         IBQValidaciones.Open;
         if not(IBQValidaciones.IsEmpty) then
         begin
            Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
            PickPos := BDBGSimple.ColumnByField('METODO_CASTRACION').PickList.IndexOf(BDBGSimple.ColumnByField('METODO_CASTRACION').Field.AsString);
            IBDSSimpleID_METODO_CASTRACION.AsInteger := TClassType(BDBGSimple.ColumnByField('METODO_CASTRACION').PickList.Objects[PickPos]).getValue;
         end;
       end;
    if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
            IBDSSimple.FieldValues['EW'] := 'M';

  end;          
end;

procedure TFEveCastracion.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveCastracion.LResponsableClick(Sender: TObject);
begin
  inherited;
  if nroID>0 then
        begin
        DBLCBAResponsable.KeyValue:=nroID;
        nroID:=-1;
        end;
end;

procedure TFEveCastracion.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveCastracion.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveCastracion.cargarDatos(i:integer);
begin
  inherited;
    IBDSSimple.FieldByName('ID_SENASA').Value := getDato('senasa',anim[i]);
    IBDSSimple.FieldByName('RESP').Value := getDato('responsable',anim[i]);
    IBDSSimple.FieldByName('RESPONSABLE').Value := DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
    IBDSSimple.FieldByName('METODO_CASTRACION').Value := getDato('método',anim[i]);
    IBDSSimple.FieldByName('ID_METODO_CASTRACION').Value := DBLCBAMetodoCastracion.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('METODO_CASTRACION').Value,'ID_METODO_CASTRACION');
end;



end.
