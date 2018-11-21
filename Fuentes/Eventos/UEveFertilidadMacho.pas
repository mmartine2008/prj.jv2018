unit UEveFertilidadMacho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, DataExport, DataToXLS, WinXP, EditAuto,
  JvExExtCtrls, JvImage, jpeg, PngImage, ImgList, PngImageList,
  JvExControls, JvLabel, JvGIF, JvComponentBase, JvBalloonHint, xmldom,
  XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveFertilidadMacho = class(TFEveSimple)
    DTPAFecha: TDateTimePickerAuto;
    CBAObservador: TDBLookupComboBoxAuto;
    LObservador: TLabel;
    LFecha: TLabel;
    LCausa: TLabel;
    DBLCBACausa: TDBLookupComboBoxAuto;
    LMetodo: TLabel;
    DBLCBAMetodo: TDBLookupComboBoxAuto;
    LResultado: TLabel;
    DBLCBAResultado: TDBLookupComboBoxAuto;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleID_CAUSA: TIntegerField;
    IBDSSimpleCAUSA: TIBStringField;
    IBDSSimpleID_RESULTADO: TIBStringField;
    IBDSSimpleRESULTADO: TIBStringField;
    IBDSSimpleID_METODO: TIntegerField;
    IBDSSimpleMETODO: TIBStringField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    Label3: TLabel;
    EPrecio: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDSSimpleFECHASetText(Sender: TField; const Text: String);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure EPrecioChange(Sender: TObject);
    procedure DBLCBAMetodoCloseUp(Sender: TObject);
    procedure BBXlsImportClick(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure LCausaClick(Sender: TObject);
  private
    Precio : double;
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
  FEveFertilidadMacho: TFEveFertilidadMacho;

implementation

{$R *.dfm}

uses UDMSoftvet, UPrincipal, DateUtils,UClassType, UUniversal, UABMEmpleados, UImportacion,
     UABMExamenesFertilidad;


procedure TFEveFertilidadMacho.CargarDatosGrilla;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['id_animal'],DSSimple))then
  begin
    IBDSSimple.Insert;  }
    IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];

    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
    //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
    RealizarCambio(CBAObservador,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[CBAObservador.GetDato,CBAObservador.Text]);
    //IBDSSimple.FieldByName('RESPONSABLE').Value:= CBAObservador.GetDato;
    //IBDSSimple.FieldByName('RESP').Value:= CBAObservador.Text;
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
    RealizarCambio(DBLCBAMetodo,[IBDSSimple.FieldByName('ID_METODO'),IBDSSimple.FieldByName('METODO')],[DBLCBAMetodo.GetDato,DBLCBAMetodo.Text]);
    //IBDSSimple.FieldByName('ID_METODO').Value:= DBLCBAMetodo.GetDato;
    //IBDSSimple.FieldByName('METODO').Value:= DBLCBAMetodo.Text;
    RealizarCambio(DBLCBAResultado,[IBDSSimple.FieldByName('RESULTADO'),IBDSSimple.FieldByName('id_RESULTADO')],[DBLCBAResultado.text,DBLCBAResultado.KeyValue]);
    //IBDSSimple.FieldByName('RESULTADO').Value:= DBLCBAResultado.text;
    //IBDSSimple.FieldByName('id_RESULTADO').Value:= DBLCBAResultado.KeyValue;
    RealizarCambio(DBLCBACausa,[IBDSSimple.FieldByName('ID_CAUSA'),IBDSSimple.FieldByName('CAUSA')],[DBLCBACausa.GetDato,DBLCBACausa.Text]);
    //IBDSSimple.FieldByName('ID_CAUSA').Value:= DBLCBACausa.GetDato;
    //IBDSSimple.FieldByName('CAUSA').Value:= DBLCBACausa.Text;
  //end;
end;

procedure TFEveFertilidadMacho.CargarParametrosMasivo;

begin
  inherited;
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('FECHA').AsDate  := IBDSSimple.FieldByName('FECHA').AsDateTime;
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldByName('id_ANIMAL').AsInteger;
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := NULL;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldByName('OBSERVACION').AsString ;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;
  IBQSPEventoInd.ParamByName('CAUSA').AsInteger := IBDSSimpleID_CAUSA.AsInteger;
  IBQSPEventoInd.ParamByName('RESULTADO').Value :=IBDSSimpleID_RESULTADO.Value;
  IBQSPEventoInd.ParamByName('METODO_EXAMEN').Value := IBDSSimpleID_METODO.Value;
  IBQSPEventoInd.ParamByName('PRECIO').Value := Precio;
end;

procedure TFEveFertilidadMacho.CargarParametrosRN;
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

procedure TFEveFertilidadMacho.CargarParametrosSP;
begin
  inherited;
  IBQSPEventoInd.ParamByName('FECHA').AsDate  := DateOf(DTPAFecha.DateTime);
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := NULL;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := CBAObservador.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDate := now;
  IBQSPEventoInd.ParamByName('RESULTADO').Value := DBLCBAResultado.GetDato;
  IBQSPEventoInd.ParamByName('CAUSA').Value := DBLCBACausa.GetDato;
  IBQSPEventoInd.ParamByName('METODO_EXAMEN').Value := DBLCBAMetodo.GetDato;
  IBQSPEventoInd.ParamByName('PRECIO').AsFloat := Precio;
end;

procedure TFEveFertilidadMacho.FormCreate(Sender: TObject);
begin
  inherited;
  Precio := 0;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('TIPO').Value := 'AR';
  DMSoftvet.IBQCodigosGenericos.Open;
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, nombre, apodo from VIS_FERTILIDAD_MACHO ';
  DBLCBACausa.AsignarValorDefecto;
  CBAObservador.AsignarValorDefecto;
  DBLCBAResultado.AsignarValorDefecto;

end;

procedure TFEveFertilidadMacho.LoadSQLStringList;
begin
  inherited;
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('METODO',TObject(DMSoftvet.DSExamenSanitario));
  SQLStringList.AddObject('CAUSA',TObject(DMSoftvet.DSExamenClinico));
  SQLStringList.AddObject('RESULTADO',TObject(DMSoftvet.DSCodigosGenericos));
end;

procedure TFEveFertilidadMacho.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFecha.Date := DateOf(Now);
//  DTPAFecha.MaxDate:= now;    
  //MSimple.PasarParametros(1,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  //MSimple.PasarParametros(1,4);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  MSimple.PasarParametros(1,6);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
end;

procedure TFEveFertilidadMacho.IBDSSimpleFECHASetText(Sender: TField;
  const Text: String);
VAR PickPos: integer;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin

      SetText(sender,text);
      if(Sender.FieldName = 'RESULTADO')then
      begin
       IBQValidaciones.Params.Clear;
       IBQValidaciones.SQL.Clear;
       IBQValidaciones.SQL.Add('select valor from cod_genericos where ((tipo = ''AR'') and (valor like '''+UpperCase(Text)+'''||''%''))');
       IBQValidaciones.Open;
       if not (IBQValidaciones.IsEmpty) then
       begin
          Sender.AsString := IBQValidaciones.FieldByName('valor').AsString ;
          PickPos := BDBGSimple.ColumnByField('RESULTADO').PickList.IndexOf(BDBGSimple.ColumnByField('RESULTADO').Field.AsString);
          IBDSSimpleID_RESULTADO.Value := TClassType(BDBGSimple.ColumnByField('RESULTADO').PickList.Objects[PickPos]).getValue;
       end;
      end
      else
       if(Sender.FieldName = 'METODO')then
       begin
       (*en el caso de llenar el sinonimo*)
         IBQValidaciones.Params.Clear;
         IBQValidaciones.SQL.Clear;
         IBQValidaciones.SQL.Add('select sinonimo as valor from COD_METODOS_EXAMEN_SANITARIO where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or(codigo like '''+UpperCase(Text)+'%'')');
         IBQValidaciones.Open;
         if not(IBQValidaciones.IsEmpty) then
         begin
            Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString;
            PickPos := BDBGSimple.ColumnByField('METODO').PickList.IndexOf(BDBGSimple.ColumnByField('METODO').Field.AsString);
            IBDSSimpleID_METODO.AsInteger := TClassType(BDBGSimple.ColumnByField('METODO').PickList.Objects[PickPos]).getValue;
         end;
       end;
        if(Sender.FieldName = 'CAUSA')then
       begin
       (*en el caso de llenar el sinonimo*)
         IBQValidaciones.Params.Clear;
         IBQValidaciones.SQL.Clear;
         IBQValidaciones.SQL.Add('select sinonimo as valor from COD_EXAMENES_FERTILIDAD where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or(codigo like '''+UpperCase(Text)+'%'')');
         IBQValidaciones.Open;
         if not(IBQValidaciones.IsEmpty) then
         begin
            Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString;
            PickPos := BDBGSimple.ColumnByField('CAUSA').PickList.IndexOf(BDBGSimple.ColumnByField('CAUSA').Field.AsString);
            IBDSSimpleID_CAUSA.AsInteger := TClassType(BDBGSimple.ColumnByField('CAUSA').PickList.Objects[PickPos]).getValue;
         end;
       end;
  end;

end;

procedure TFEveFertilidadMacho.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
end;

procedure TFEveFertilidadMacho.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(CBAObservador,nroID);
end;

procedure TFEveFertilidadMacho.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= $00606C02;
    (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveFertilidadMacho.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= clWindowText;
    (Sender as TLabel).Font.Style:= [fsUnderline];
  end;
end;

procedure TFEveFertilidadMacho.EPrecioChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EPrecio.Text,Precio) then
  begin
    EPrecio.Text := '';
    Precio := 0;
  end;
end;

procedure TFEveFertilidadMacho.DBLCBAMetodoCloseUp(Sender: TObject);
begin
  inherited;
  GetEvent(DBLCBAMetodo);  
end;

procedure TFEveFertilidadMacho.cargarDatos(i:integer);
begin
  inherited;
    IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    IBDSSimple.FieldByName('RESP').Value:= getDato('responsable',anim[i]);
    IBDSSimple.FieldByName('RESPONSABLE').Value:= CBAObservador.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
    IBDSSimple.FieldByName('METODO').Value:= getDato('método',anim[i]);
    IBDSSimple.FieldByName('ID_METODO').Value:= DBLCBAMetodo.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('METODO').Value,'ID_METODO_EXAMEN');
    IBDSSimple.FieldByName('RESULTADO').Value:= getDato('resultado',anim[i]);
    IBDSSimple.FieldByName('ID_Resultado').Value:= DBLCBAResultado.ListSource.DataSet.Lookup('VALOR',IBDSSimple.FieldByName('RESULTADO').Value,'ID_CODIGO');
    IBDSSimple.FieldByName('CAUSA').Value:= getDato('causa',anim[i]);
    IBDSSimple.FieldByName('ID_CAUSA').Value:= DBLCBACausa.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('CAUSA').Value,'ID_EXAMEN_CLINICO');
end;

procedure TFEveFertilidadMacho.BBXlsImportClick(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('TIPO').Value:='AR';
  DMSoftvet.IBQCodigosGenericos.Open;
end;

procedure TFEveFertilidadMacho.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda de evesimple
end;

procedure TFEveFertilidadMacho.LCausaClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AbrirFormNormal(TFABMExamenesFertilidad.Create(self));
    DMSoftvet.IBQExamenClinico.Close;
    DMSoftvet.IBQExamenClinico.Open;
  end;
  cambiarCB(DBLCBACausa,nroID);
end;

end.
