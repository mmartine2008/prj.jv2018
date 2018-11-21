unit UEveCalidadSeminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBCustomDataSet, IBQuery, ActnList, ComCtrls,
  Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto, Buttons,
  ExtCtrls, ComboBoxAuto, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, IBStoredProc, EditAuto, UFrameMangazo, DataExport,
  DataToXLS, WinXP, JvExExtCtrls, JvImage, jpeg, PngImage, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, JvComponentBase,
  JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveCalidadSeminal = class(TFEveSimple)
    LResultado: TLabel;
    LObservador: TLabel;
    LFecha: TLabel;
    LMetodoToma: TLabel;
    CBAObservador: TDBLookupComboBoxAuto;
    DTPAFecha: TDateTimePickerAuto;
    DBLCBAMetodoToma: TDBLookupComboBoxAuto;
    DBLCBAResultado: TDBLookupComboBoxAuto;
    IBQCodigosGenericos: TIBQuery;
    DSCodigosGenericos: TDataSource;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleID_METODO_TOMA: TIntegerField;
    IBDSSimpleMETODO: TIBStringField;
    IBDSSimpleRESULTADO: TIBStringField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleID_RESULTADO: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDSSimpleFECHASetText(Sender: TField; const Text: String);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure DBLCBAMetodoTomaCloseUp(Sender: TObject);
  private
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
  FEveCalidadSeminal: TFEveCalidadSeminal;

implementation

uses UDMSoftvet, UPrincipal, Types,UClassType, DateUtils, UABMEmpleados,UImportacion;

{$R *.dfm}

procedure TFEveCalidadSeminal.FormCreate(Sender: TObject);
begin

  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('TIPO').Value := 'AR';
  DMSoftvet.IBQCodigosGenericos.Open;
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, nombre, apodo from VIS_CALIDAD_SEMINAL';
  inherited;
end;
(*
  Carga los parametros necesarios para las Reglas de Negocio Asociadas al evento
*)
Procedure TFEveCalidadSeminal.CargarParametrosRN;
begin
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
  Carga los parametros necesarios para el Store Procedure que carga el evento asociado
*)
Procedure TFEveCalidadSeminal.CargarParametrosSP;
begin
 IBQSPEventoInd.ParamByName('FECHA').AsDate  := DateOf(DTPAFecha.DateTime);
 IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
 IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').Value := CBAObservador.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
 IBQSPEventoInd.ParamByName('RESULTADO').Value := DBLCBAResultado.GetDato;
 IBQSPEventoInd.ParamByName('ID_METODO_TOMA').Value := DBLCBAMetodoToma.GetDato;
 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
 IBQSPEventoInd.ParamByName('DISPARADOR').Value := Null;
end;

(*
  Agrega los datos del evento a la grilla
*)
procedure TFEveCalidadSeminal.CargarDatosGrilla;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['id_animal'],DSSimple))then
  begin
    IBDSSimple.Insert;  }
    IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_SENASA').Value := MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];

    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
    //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
    RealizarCambio(CBAObservador,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[CBAObservador.GetDato,CBAObservador.Text]);
    //IBDSSimple.FieldByName('RESPONSABLE').Value:= CBAObservador.GetDato;
    //IBDSSimple.FieldByName('RESP').Value:= CBAObservador.Text;
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
    RealizarCambio(DBLCBAMetodoToma,[IBDSSimple.FieldByName('ID_METODO_TOMA'),IBDSSimple.FieldByName('METODO')],[DBLCBAMetodoToma.GetDato,DBLCBAMetodoToma.Text]);
    //IBDSSimple.FieldByName('ID_METODO_TOMA').Value:= DBLCBAMetodoToma.GetDato;
    //IBDSSimple.FieldByName('METODO').Value:= DBLCBAMetodoToma.Text;
    RealizarCambio(DBLCBAResultado,[IBDSSimple.FieldByName('RESULTADO'),IBDSSimple.FieldByName('ID_RESULTADO')],[DBLCBAResultado.text,DBLCBAResultado.KeyValue]);
    //IBDSSimple.FieldByName('RESULTADO').Value:= DBLCBAResultado.text;
    //IBDSSimple.FieldByName('ID_RESULTADO').Value:= DBLCBAResultado.KeyValue;
  //end;
end;

(*
  carga los parametros de la grilla detalle para el SP de insercion correspondiente
*)
Procedure TFEveCalidadSeminal.CargarParametrosMasivo;

begin

  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
{  PickPos := BDBGSimple.ColumnByField('RESP').PickList.IndexOf(BDBGSimple.ColumnByField('RESP').Field.AsString);
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := TClassType(BDBGSimple.ColumnByField('RESP').PickList.Objects[PickPos]).getValue;}

  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value :=IBDSSimple.FieldValues['RESPONSABLE'];
  IBQSPEventoInd.ParamByName('ID_METODO_TOMA').Value :=IBDSSimple.FieldValues['ID_METODO_TOMA'];
  IBQSPEventoInd.ParamByName('RESULTADO').Value :=IBDSSimple.FieldValues['ID_RESULTADO'];
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := Null;

{  PickPos := BDBGSimple.ColumnByField('METODO').PickList.IndexOf(BDBGSimple.ColumnByField('METODO').Field.AsString);
  IBQSPEventoInd.ParamByName('ID_METODO_TOMA').Value := TClassType(BDBGSimple.ColumnByField('METODO').PickList.Objects[PickPos]).getValue;}

{  PickPos := BDBGSimple.ColumnByField('RESULTADO').PickList.IndexOf(BDBGSimple.ColumnByField('RESULTADO').Field.AsString);
  IBQSPEventoInd.ParamByName('RESULTADO').Value :=TClassType(BDBGSimple.ColumnByField('RESULTADO').PickList.Objects[PickPos]).getValue;}
end;

(*
  Carga el string List que se va a mostrar en el lookup de la columna correspondiente
*)
procedure TFEveCalidadSeminal.LoadSQLStringList;
begin
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('METODO',TObject(DMSoftvet.DSMetodo));
  IBQCodigosGenericos.Close;
  IBQCodigosGenericos.ParamByName('tipo').Value := 'AR';
  IBQCodigosGenericos.Open;
  SQLStringList.AddObject('RESULTADO',TObject(DSCodigosGenericos));
  inherited;
end;

procedure TFEveCalidadSeminal.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFecha.Date := DateOf(Now);
//  DTPAFecha.MaxDate:= now;    
//  MSimple.PasarParametros(1);{Para filtrar las categorias para el Combo de la Manga} // aca cambie codigo
  MSimple.PasarParametros(1,6);//cambie codigo{Para filtrar las categorias para el Combo de la Manga}
end;



procedure TFEveCalidadSeminal.IBDSSimpleFECHASetText(Sender: TField;
  const Text: String);
VAR PickPos: integer;
begin
  inherited;
 if(IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)) then
 begin

      SetText(sender,text);
      if(Sender.FieldName = 'RESULTADO')then
      begin
       IBQValidaciones.Params.Clear;
       IBQValidaciones.SQL.Add('select valor from cod_genericos where (tipo = ''AR'') and ((valor like '''+UpperCase(Text)+'''||''%'') or (ID_CODIGO like '''+UpperCase(Text)+'%''))');
       IBQValidaciones.Open;
       if not (IBQValidaciones.IsEmpty) then
       begin
          Sender.AsString := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('RESULTADO').PickList.IndexOf(BDBGSimple.ColumnByField('RESULTADO').Field.AsString);
          IBDSSimple.FieldByName('ID_RESULTADO').Value :=TClassType(BDBGSimple.ColumnByField('RESULTADO').PickList.Objects[PickPos]).getValue;
       end;
       if(Sender.AsString = 'REPRUEBA') then
       begin
         { SBUniversal.Font.Style :=[fsBold];
          SBUniversal.SimpleText := 'El Animal será reprobado';}
       end
       else
         //SBUniversal.SimpleText := '';
      end
      else
       if(Sender.FieldName = 'METODO')then
       begin
       (*en el caso de llenar el sinonimo*)
         IBQValidaciones.Params.Clear;
         IBQValidaciones.SQL.Add('select sinonimo as valor from COD_METODOS_TOMA_PRUEBA where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or(codigo like '''+UpperCase(Text)+'%'')');
         IBQValidaciones.Open;
         if not(IBQValidaciones.IsEmpty) then
         begin
            Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString;
            PickPos := BDBGSimple.ColumnByField('METODO').PickList.IndexOf(BDBGSimple.ColumnByField('METODO').Field.AsString);
            IBDSSimple.FieldByName('ID_METODO_TOMA').Value := TClassType(BDBGSimple.ColumnByField('METODO').PickList.Objects[PickPos]).getValue;
         end;
       end;
   end;
end;

procedure TFEveCalidadSeminal.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
end;

procedure TFEveCalidadSeminal.LResponsableClick(Sender: TObject);
begin
  inherited;
  if nroID>0 then
        begin
        CBAObservador.KeyValue:=nroID;
        nroID:=-1;
        end;
  {if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
      DMSoftvet.IBQResponsable.Close;
      DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQResponsable.Open;
    end;}
end;

procedure TFEveCalidadSeminal.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveCalidadSeminal.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveCalidadSeminal.DBLCBAMetodoTomaCloseUp(Sender: TObject);
begin
  inherited;
  GetEvent(DBLCBAMetodoToma);
end;

procedure TFEveCalidadSeminal.cargarDatos(i:integer);
begin
  inherited;
    IBDSSimple.FieldByName('RESP').Value:=getDato('responsable',anim[i]);
    IBDSSimple.FieldByName('RESPONSABLE').Value:= CBAObservador.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
    IBDSSimple.FieldByName('METODO').Value:= getDato('método',anim[i]);
    IBDSSimple.FieldByName('ID_METODO_TOMA').Value:=DBLCBAMetodoToma.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('METODO').Value,'ID_METODO_TOMA');
    IBDSSimple.FieldByName('RESULTADO').Value:= getDato('resultado',anim[i]);
    IBDSSimple.FieldByName('ID_RESULTADO').Value:= DBLCBAResultado.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('RESULTADO').Value,'ID_CODIGO');
end;

end.

