unit UEveCapacidadServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBCustomDataSet, IBQuery, ActnList, ComCtrls,
  Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto, Buttons,
  ExtCtrls, EditAuto, Spin, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, ComboBoxAuto, IBStoredProc, UFrameMangazo,
  DataExport, DataToXLS, WinXP, ImgList, PngImageList, JvExControls,
  JvLabel, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase,
  JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveCapacidadServicio = class(TFEveSimple)
    LValor: TLabel;
    LObservador: TLabel;
    LFecha: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    DTPAFecha: TDateTimePickerAuto;
    LMetodologia: TLabel;
    LTipo: TLabel;
    DBLCBAValor: TDBLookupComboBoxAuto;
    RB10: TRadioButton;
    RB20: TRadioButton;
    DBLCBATipo: TDBLookupComboBoxAuto;
    IBQCodigosGenericos: TIBQuery;
    DSCodigosGenericos: TDataSource;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleIDVALOR: TIntegerField;
    IBDSSimpleVALOR: TIBStringField;
    IBDSSimpleMETODOLOGIA: TIBStringField;
    IBDSSimpleID_METODOLOGIA: TIBStringField;
    IBDSSimpleTIPO: TIBStringField;
    IBDSSimpleNOMTIPO: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDSSimpleVALORSetText(Sender: TField; const Text: String);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
  private
  protected
      Procedure CargarParametrosSP;override;
      Procedure CargarParametrosRN;override;
      procedure CargarDatosGrilla;override;
      Procedure CargarParametrosMasivo;override;
      procedure LoadSQLStringList;override;
      procedure cargarDatos(i:integer);override;
  published

  public
     { Public declarations }
  end;

var
  FEveCapacidadServicio: TFEveCapacidadServicio;

implementation

uses UEveUniversal,UPrincipal,UDMSoftvet,UClassType,DateUtils, UABMEmpleados,UImportacion;
{$R *.dfm}

(*
  Carga los parametros necesarios para las Reglas de Negocio Asociadas al evento
*)
Procedure TFEveCapacidadServicio.CargarParametrosRN;
begin
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  if(self.ModoEve = meIndividual)then
    begin
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
      IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
    end
  else
    begin
      IBQSPRN.ParamByName('animal').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
      IBQSPRN.ParamByName('fecha').AsDateTime := IBDSSimple.fieldbyname('fecha').AsDateTime;
    end;
end;

(*
  carga los parametros de la grilla detalle para el SP de insercion correspondiente
*)
Procedure TFEveCapacidadServicio.CargarParametrosSP;
begin
 IBQSPEventoInd.ParamByName('FECHA').Value  := DTPAFecha.GetDato;
 IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
 IBQSPEventoInd.ParamByName('DISPARADOR').Value := NULL;
 IBQSPEventoInd.ParamByName('OBSERVACION').Value     := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
 IBQSPEventoInd.ParamByName('VALOR').Value := DBLCBAValor.GetDato;
 IBQSPEventoInd.ParamByName('TIPO').Value := DBLCBATipo.GetDato;
 if(RB10.Checked)then IBQSPEventoInd.ParamByName('METODOLOGIA').Value := 'D'
   else IBQSPEventoInd.ParamByName('METODOLOGIA').Value := 'V';
 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
end;

procedure TFEveCapacidadServicio.FormCreate(Sender: TObject);
begin
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQValorCapacidad.Close;
  DMSoftvet.IBQValorCapacidad.Open;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value := 'AR';
  DMSoftvet.IBQCodigosGenericos.Open;
  MSimple.SQLBasico := 'select ID_RP, ID_SENASA,ID_ANIMAL, id_pc, id_hba, id_otro, id_ie, nombre, apodo from VIS_CAPACIDAD_SERVICIO';
//  MSimple.PasarParametros(1);

  inherited;
end;

(*
  Agrega los datos del evento a la grilla
*)
procedure TFEveCapacidadServicio.CargarDatosGrilla;

begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
  begin
    IBDSSimple.Insert;}
    IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];

    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.Date]);
    //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    //IBDSSimple.FieldByName('OBSERVACION').Value :=MAObservacion.GetDato;
    RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[DBLCBAResponsable.Text,DBLCBAResponsable.GetDato]);
    //IBDSSimple.FieldByName('RESP').Value:= DBLCBAResponsable.Text;
    //IBDSSimple.FieldByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
    RealizarCambio(DBLCBAValor,[IBDSSimple.FieldByName('VALOR'),IBDSSimple.FieldByName('IDVALOR')],[DBLCBAValor.Text,DBLCBAValor.GetDato]);
    //IBDSSimple.FieldByName('VALOR').Value:= DBLCBAValor.Text;
    //IBDSSimple.FieldByName('IDVALOR').AsString:= DBLCBAValor.GetDato;
    RealizarCambio(DBLCBATipo,[IBDSSimple.FieldByName('TIPO'),IBDSSimple.FieldByName('NOMTIPO')],[DBLCBATipo.KeyValue,DBLCBATipo.Text]);
    //IBDSSimple.FieldByName('TIPO').Value:= DBLCBATipo.KeyValue;
    //IBDSSimple.FieldByName('NOMTIPO').Value:= DBLCBATipo.Text;
    if(RB10.Checked)then
    begin
     //IBDSSimple.FieldByName('METODOLOGIA').Value:= 'DIEZ MINUTOS';
     IBQValidaciones.SQL.Clear;
     IBQValidaciones.SQL.Add('select id_codigo, valor from cod_genericos where ((tipo = ''DV'') and (valor =''DIEZ MINUTOS''))');
     IBQValidaciones.Open;
     //RealizarCambio(nil,[IBDSSimple.FieldByName('METODOLOGIA'),IBDSSimple.FieldByName('ID_METODOLOGIA')],[IBQValidaciones.FieldByName('valor').AsString,IBQValidaciones.FieldByName('id_codigo').AsString]);
     //IBDSSimple.FieldByName('METODOLOGIA').Value:= IBQValidaciones.FieldByName('valor').AsString;
     //IBDSSimple.FieldByName('ID_METODOLOGIA').Value:= IBQValidaciones.FieldByName('id_codigo').AsString;
    end
    else
    begin
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select id_codigo, valor from cod_genericos where ((tipo = ''DV'') and (valor =''VEINTE MINUTOS''))');
      IBQValidaciones.Open;
      //RealizarCambio(nil,[IBDSSimple.FieldByName('METODOLOGIA'),IBDSSimple.FieldByName('ID_METODOLOGIA')],[IBQValidaciones.FieldByName('valor').AsString,IBQValidaciones.FieldByName('id_codigo').AsString]);
      //IBDSSimple.FieldByName('METODOLOGIA').Value:= IBQValidaciones.FieldByName('valor').AsString;
      //IBDSSimple.FieldByName('ID_METODOLOGIA').Value:= IBQValidaciones.FieldByName('id_codigo').AsString;
    end;

    RealizarCambio(RB10,[IBDSSimple.FieldByName('METODOLOGIA'),IBDSSimple.FieldByName('ID_METODOLOGIA')],[IBQValidaciones.FieldByName('valor').AsString,IBQValidaciones.FieldByName('id_codigo').AsString]);
    RealizarCambio(RB20,[IBDSSimple.FieldByName('METODOLOGIA'),IBDSSimple.FieldByName('ID_METODOLOGIA')],[IBQValidaciones.FieldByName('valor').AsString,IBQValidaciones.FieldByName('id_codigo').AsString]);
  //end;
end;


(*
  carga los parametros de la grilla detalle para el SP de insercion correspondiente
*)
Procedure TFEveCapacidadServicio.CargarParametrosMasivo;

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
  IBQSPEventoInd.ParamByName('METODOLOGIA').Value := IBDSSimpleID_METODOLOGIA.Value;
  IBQSPEventoInd.ParamByName('VALOR').AsInteger := IBDSSimpleIDVALOR.Value;
  IBQSPEventoInd.ParamByName('TIPO').Value := IBDSSimpleTIPO.Value;
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := NULL;
end;


(*
  Carga el string List que se va a mostrar en el lookup de la columna correspondiente
*)
procedure TFEveCapacidadServicio.LoadSQLStringList;
begin
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('VALOR',TObject(DMSoftvet.DSValorCapacidad));
// DMSoftvet.IBQCodigosGenericos.State=dsInactive then
//  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value := 'AR';
  DMSoftvet.IBQCodigosGenericos.Open;
  SQLStringList.AddObject('NOMTIPO',TObject(DMSoftvet.DSCodigosGenericos));
  IBQCodigosGenericos.Close;
  IBQCodigosGenericos.ParamByName('tipo').Value := 'DV';
  IBQCodigosGenericos.Open;
  SQLStringList.AddObject('METODOLOGIA',TObject(DSCodigosGenericos));
  inherited;
end;


procedure TFEveCapacidadServicio.FormShow(Sender: TObject);
begin
  inherited;
  RB10.Checked := true;
  DTPAFecha.Date := DateOf(Now);
//  DTPAFecha.MaxDate:= now;    
//  MSimple.PasarParametros(1);{Para filtrar las categorias para el Combo de la Manga}//aca cambie codigo
  MSimple.PasarParametros(1,6);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
end;

procedure TFEveCapacidadServicio.IBDSSimpleVALORSetText(Sender: TField;
  const Text: String);
var PickPos: integer;
begin
   inherited;
   if(IBDSSimple.State <> dsInsert)then
   begin

       SetText(sender,Text);
       if(Sender.FieldName = 'METODOLOGIA')then
       begin
        if (Text <> '') then
         begin
           IBQValidaciones.Params.Clear;
           IBQValidaciones.SQL.Clear;           
           IBQValidaciones.SQL.Add('select valor from cod_genericos where ((tipo = ''DV'') and (valor like '''+UpperCase(Text)+'''||''%''))or (ID_CODIGO like '''+UpperCase(Text)+'%'')');
           IBQValidaciones.Open;
           if not(IBQValidaciones.IsEmpty) then
            begin
              Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
              PickPos := BDBGSimple.ColumnByField('METODOLOGIA').PickList.IndexOf(BDBGSimple.ColumnByField('METODOLOGIA').Field.AsString);
              IBDSSimpleID_METODOLOGIA.AsString :=  TClassType(BDBGSimple.ColumnByField('METODOLOGIA').PickList.Objects[PickPos]).getValue;
              IBDSSimpleID_METODOLOGIA.AsString :=  TClassType(BDBGSimple.ColumnByField('METODOLOGIA').PickList.Objects[PickPos]).getValue;
            end;
         end;   
       end
       else
         if(Sender.FieldName = 'VALOR')then
         begin
           IBQValidaciones.Params.Clear;
           IBQValidaciones.SQL.Clear;
           IBQValidaciones.SQL.Add('select sinonimo as valor from COD_VALORES_CAPACIDAD where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or (CODIGO like '''+UpperCase(Text)+'%'')');
           IBQValidaciones.Open;
           if not(IBQValidaciones.IsEmpty) then
           begin
              Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
              PickPos := BDBGSimple.ColumnByField('VALOR').PickList.IndexOf(BDBGSimple.ColumnByField('VALOR').Field.AsString);
              IBDSSimpleIDVALOR.Value := TClassType(BDBGSimple.ColumnByField('VALOR').PickList.Objects[PickPos]).getValue;
           end;
         end
         else
         if(Sender.FieldName = 'NOMTIPO')then
          begin
           IBQValidaciones.Params.Clear;
           IBQValidaciones.SQL.Clear;
           IBQValidaciones.SQL.Add('select valor from cod_genericos where ((tipo = ''AR'') and (valor like '''+UpperCase(Text)+'''||''%''))');
           IBQValidaciones.Open;
           if not (IBQValidaciones.IsEmpty) then
           begin
              Sender.AsString := IBQValidaciones.FieldByName('valor').AsString ;
              PickPos := BDBGSimple.ColumnByField('NOMTIPO').PickList.IndexOf(BDBGSimple.ColumnByField('NOMTIPO').Field.AsString);
              IBDSSimpleTIPO.Value := TClassType(BDBGSimple.ColumnByField('NOMTIPO').PickList.Objects[PickPos]).getValue;
          end;
          end
    end;
end;

procedure TFEveCapacidadServicio.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;

end;

procedure TFEveCapacidadServicio.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveCapacidadServicio.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveCapacidadServicio.LResponsableClick(Sender: TObject);
begin
  inherited;
  if nroID>0 then
        begin
        DBLCBAResponsable.KeyValue:=nroID;
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

procedure TFEveCapacidadServicio.cargarDatos(i:integer);
begin
  inherited;
    IBDSSimple.FieldByName('ID_SENASA').Value :=  DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_SENASA');
    IBDSSimple.FieldByName('RESP').Value:= getDato('responsable',anim[i]);
    IBDSSimple.FieldByName('RESPONSABLE').Value := DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
    IBDSSimple.FieldByName('VALOR').Value:= getDato('valor',anim[i]);
    IBDSSimple.FieldByName('IDVALOR').AsString:= DBLCBAValor.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('VALOR').Value,'ID_VALOR_CAPACIDAD');
    IBQValidaciones.SQL.Clear;
    IBQValidaciones.SQL.Add('select id_codigo, valor from cod_genericos where (tipo = ''AR'')');
    IBQValidaciones.Open;
    IBDSSimple.FieldByName('NOMTIPO').Value:= getDato('resultado',anim[i]);
    IBDSSimple.FieldByName('TIPO').Value:=DBLCBATipo.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('NOMTIPO').Value,'ID_CODIGO');
    IBQValidaciones.SQL.Clear;
    IBQValidaciones.SQL.Add('select id_codigo, valor from cod_genericos where (tipo = ''DV'')');
    IBQValidaciones.Open;
    IBDSSimple.FieldByName('METODOLOGIA').Value:= getDato('metodología',anim[i]);
    IBDSSimple.FieldByName('ID_METODOLOGIA').Value:= IBQValidaciones.Lookup('VALOR',IBDSSimple.FieldByName('METODOLOGIA').Value,'ID_CODIGO');
end;

procedure TFEveCapacidadServicio.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda
end;

end.
