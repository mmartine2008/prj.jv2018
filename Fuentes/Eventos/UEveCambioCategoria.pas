unit UEveCambioCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, ExtCtrls, ImgList, PngImageList, WinXP, IBQuery, DB,
  IBCustomDataSet, DataExport, DataToXLS, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, Buttons, JvExExtCtrls, JvImage, UClassType,
  PngImage, Grids, DBGrids, UBDBGrid, MemoAuto, EditAuto, UFrameMangazo,
  jpeg, JvGIF, DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto,
  JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveCambioCategoria = class(TFEveSimple)
    DTPAFecha: TDateTimePickerAuto;
    LFecha: TLabel;
    LObservador: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LCategoria: TLabel;
    DBLCBACategoria: TDBLookupComboBoxAuto;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleV2: TIBStringField;
    IBDSSimpleI2: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleV3: TIBStringField;
    IBQCategoria: TIBQuery;
    DSCategoria: TDataSource;
    IBQGetCatEdad: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDSSimpleV1SetText(Sender: TField; const Text: String);
    procedure DTPAFechaChange(Sender: TObject);
    procedure LObservadorClick(Sender: TObject);
    procedure LCategoriaClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure LCategoriaMouseEnter(Sender: TObject);
    procedure LCategoriaMouseLeave(Sender: TObject);
  private
    procedure CargarParametrosSP;override;
    procedure CargarParametrosRN;override;
    procedure CargarDatosGrilla;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
    procedure CargarParametrosMasivo;override;
  public
    { Public declarations }
  end;

var
  FEveCambioCategoria: TFEveCambioCategoria;

implementation

uses
  UPrincipal, UDMSoftvet, UImportacion, UABMCategorias, UABMEmpleados, UABMSimple;

{$R *.dfm}

procedure TFEveCambioCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQCategorias.Close;
  DMSoftvet.IBQCategorias.Open;
  IBQCategoria.Close;
  IBQCategoria.Open;
  IBQCategoria.Last;
  IBQCategoria.First;
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_hba, id_pc, id_otro, id_ie, fecha_nacimiento, nombre, apodo, categoria from VIS_ANIMALES';
  AsignarValoresDefecto;
end;                                                                                                                                                                                         

procedure TFEveCambioCategoria.FormShow(Sender: TObject);
begin
  inherited;
  MSimple.PasarParametros(0,0);//cambie codigo
  DTPAFecha.Date := now;
end;

procedure TFEveCambioCategoria.cargarDatos(i : Integer);
begin
  inherited;
  if DBLCBAResponsable.ListSource.DataSet.Locate('nombre',getDato('Responsable',anim[i]),[]) then
    IBDSSimple.FieldByName('V3').AsString:=getDato('Responsable',anim[i])
  else
    IBDSSimple.FieldByName('V3').AsString:='INDEFINIDO';
  IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('V3').Value,'ID_EMPLEADO');

  IBDSSimple.FieldValues['I2'] := DBLCBACategoria.ListSource.DataSet.Lookup('NOMBRE',getDato('Categoría',anim[i]),'ID_CATEGORIA');
  IBDSSimple.FieldByName('V2').AsString := getDato('Categoría',anim[i]);

  IBDSSimple.FieldValues['I1'] := DBLCBACategoria.ListSource.DataSet.Lookup('NOMBRE',getDato('Categoría Nueva',anim[i]),'ID_CATEGORIA');
  IBDSSimple.FieldByName('V1').AsString := getDato('Categoría Nueva',anim[i]);
end;

procedure TFEveCambioCategoria.CargarDatosGrilla;
var
  id_categ: integer;
begin
  IDAnimal := MSimple.IBQSeleccionados.FieldValues['id_animal'];
  IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
  IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
  RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
  RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('V3')],[DBLCBAResponsable.GetDato,DBLCBAResponsable.Text]);
  RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
  RealizarCambio(DBLCBACategoria,[IBDSSimple.FieldByName('I1'),IBDSSimple.FieldByName('V1')],[DBLCBACategoria.KeyValue,DBLCBACategoria.Text]);
  IBDSSimple.FieldByName('ID_ANIMAL').Value := IDAnimal;

  IBQGetCatEdad.Close;
  IBQGetCatEdad.ParamByName('fecha').Value := IBDSSimple.FieldByName('FECHA').Value;
  IBQGetCatEdad.ParamByName('animal').Value := IDAnimal;
  IBQGetCatEdad.Open;
  if IBQGetCatEdad.FieldByName('categoria').Value <> null then
    id_categ := IBQGetCatEdad.FieldValues['categoria']
  else
    id_categ := MSimple.IBQSeleccionados.FieldValues['categoria'];

  IBDSSimple.FieldByName('V2').AsString := DMSoftvet.IBQCategorias.Lookup('ID_CATEGORIA',id_categ,'NOMBRE');
  IBDSSimple.FieldByName('I2').AsInteger := id_categ;
end;

procedure TFEveCambioCategoria.CargarParametrosMasivo;
begin
  if(CrearGrupo)then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;
  IBQSPEventoInd.ParamByName('FECHA').AsDate := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDate := Date();
  IBQSPEventoInd.ParamByName('CATEGORIA_ANTERIOR').Value := IBDSSimple.FieldValues['I2'];
  IBQSPEventoInd.ParamByName('CATEGORIA_NUEVA').AsFloat := IBDSSimple.FieldValues['I1'];
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;
end;

procedure TFEveCambioCategoria.CargarParametrosRN;
begin
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
   if(self.ModoEve = meIndividual)then
   begin
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
      IBQSPRN.ParamByName('FECHA').AsDate := DTPAFecha.Date;
      IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
      IBQSPRN.ParamByName('CATEGORIA_ANTERIOR').AsInteger := MSimple.IBQSeleccionados.FieldValues['categoria'];
      IBQSPRN.ParamByName('CATEGORIA_NUEVA').AsInteger := DBLCBACategoria.KeyValue;
   end
   else
   begin
      IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
      IBQSPRN.ParamByName('FECHA').AsDate := IBDSSimpleFECHA.AsDateTime;
      IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
      IBQSPRN.ParamByName('CATEGORIA_ANTERIOR').AsInteger := IBDSSimple.FieldValues['I2'];
      IBQSPRN.ParamByName('CATEGORIA_NUEVA').AsInteger := IBDSSimple.FieldValues['I1'];
   end;
end;

procedure TFEveCambioCategoria.CargarParametrosSP;
begin
   IBQSPEventoInd.ParamByName('FECHA').AsDate  := DTPAFecha.Date;
   IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
   IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
   IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
   IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.GetDato;
   IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
   IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
   IBQSPEventoInd.ParamByName('CATEGORIA_ANTERIOR').Value := MSimple.IBQSeleccionados.FieldValues['CATEGORIA'];
   IBQSPEventoInd.ParamByName('CATEGORIA_NUEVA').Value := DBLCBACategoria.KeyValue;
   IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
end;

procedure TFEveCambioCategoria.LoadSQLStringList;
begin
 SQLStringList.AddObject('V3',DMSoftvet.DSResponsable);
 SQLStringList.AddObject('V1',DSCategoria);
 inherited;
end;

procedure TFEveCambioCategoria.IBDSSimpleV1SetText(Sender: TField;
  const Text: String);
var
  PickPos : Integer;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)) then
  begin
    SetText(Sender,Text);
    if(Sender.FieldName = 'V1')then //Categoria Nueva
       begin
         IBQValidaciones.Close;
         IBQValidaciones.Params.Clear;
         IBQValidaciones.SQL.Add('select nombre from cod_categorias where (((nombre like '''+UpperCase(Text)+'''||''%'') or (CODIGO like '''+UpperCase(Text)+'%'')));');
         IBQValidaciones.Open;
         if not(IBQValidaciones.IsEmpty) then
         begin
            Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString ;
            PickPos := BDBGSimple.ColumnByField('V1').PickList.IndexOf(BDBGSimple.ColumnByField('V1').Field.AsString);
            IBDSSimpleI1.Value := TClassType(BDBGSimple.ColumnByField('V1').PickList.Objects[PickPos]).getValue;
         end;
       end
  end;
end;

procedure TFEveCambioCategoria.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveCambioCategoria.LObservadorClick(Sender: TObject);
var
  abm : TFABMEmpleados;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    abm := TFABMEmpleados.Create(self);
    abm.Abrir(faAbm);
    CambiarCB(DBLCBAResponsable,nroID);
  end;
end;

procedure TFEveCambioCategoria.LCategoriaClick(Sender: TObject);
var
  abm : TFABMCategorias;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    abm := TFABMCategorias.Create(self);
    abm.Abrir(faAbm);
    DMSoftvet.IBQResponsable.Close;
    DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQResponsable.Open;
    CambiarCB(DBLCBACategoria,nroID);
  end;
end;

procedure TFEveCambioCategoria.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveCambioCategoria.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveCambioCategoria.LCategoriaMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCategoria.Font.Color:= $00606C02;
      LCategoria.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveCambioCategoria.LCategoriaMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCategoria.Font.Color:= clWindowText;
      LCategoria.Font.Style:= [fsUnderline];
    end;
end;

end.
