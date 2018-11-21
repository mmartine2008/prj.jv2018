unit UEveActividad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, IBQuery, DB, IBCustomDataSet, WinXP, DataExport,
  DataToXLS, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids,
  DBGrids, UBDBGrid, MemoAuto, EditAuto, UFrameMangazo, Buttons, DBCtrls,
  UDBLookupComboBoxAuto, DateTimePickerAuto, UDMSoftvet, ImgList,
  PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage,
  jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom,
  XMLDoc, Menus;

type

  TFEveActividad = class(TFEveSimple)
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleACT: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleACTIVIDAD: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleSUBCATEGORIA: TIntegerField;
    IBDSSimpleSUBCAT: TIBStringField;
    IBDSSimpleCODIGOMANEJO: TIntegerField;
    IBDSSimpleCODMAN: TIBStringField;
    GBSubcat: TGroupBox;
    DBLCBASubCategoria: TDBLookupComboBoxAuto;
    GBActividad: TGroupBox;
    LCodigoManejo: TLabel;
    DBLCBACodigoManejo: TDBLookupComboBoxAuto;
    DBLCBAActividad: TDBLookupComboBoxAuto;
    CBSubCat: TCheckBox;
    CBActividad: TCheckBox;
    LSubCat: TLabel;
    LActividad: TLabel;
    IBQGetRaza: TIBQuery;
    GBInspeccion: TGroupBox;
    LDestino: TLabel;
    LResult: TLabel;
    DBLCBACodDestCabania: TDBLookupComboBoxAuto;
    DBLCBAInspeccion: TDBLookupComboBoxAuto;
    CBInspeccion: TCheckBox;
    IBDSSimpleINSPECCION: TIntegerField;
    IBDSSimpleINSP: TIBStringField;
    IBDSSimpleDESTINO: TIntegerField;
    IBDSSimpleDEST: TIBStringField;
    GBSubcategoria: TGroupBox;
    LSubcategorizacion: TLabel;
    DBLCBASubcategorizacion: TDBLookupComboBoxAuto;
    CBSubcategorizacion: TCheckBox;
    IBQSubcategorizacion: TIBQuery;
    DSSubcategorizacion: TDataSource;
    IBDSSimpleI7: TIntegerField;
    IBDSSimpleV7: TIBStringField;
    IBQSubCategoriaRaza: TIBQuery;
    DSSubCategoriaRaza: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure IBDSSimpleACTIVIDADSetText(Sender: TField;
      const Text: String);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LActividadClick(Sender: TObject);
    procedure IBDSSimpleRESPChange(Sender: TField);
    procedure IBDSSimpleRESPSetText(Sender: TField; const Text: String);
    procedure MSimpleRBTodasClick(Sender: TObject);
    procedure MSimpleDBLCBCategoriaCloseUp(Sender: TObject);
    procedure MSimpleCBCategoriaClick(Sender: TObject);
    procedure DBLCBAActividadCloseUp(Sender: TObject);
    procedure MSimpleDBLCBARazaCloseUp(Sender: TObject);
    procedure IBDSSimpleSUBCATChange(Sender: TField);
    procedure IBDSSimpleSUBCATSetText(Sender: TField; const Text: String);
    procedure LSubCategoriaClick(Sender: TObject);
    procedure LCodigoManejoClick(Sender: TObject);
    procedure IBDSSimpleCODMANChange(Sender: TField);
    procedure IBDSSimpleCODMANSetText(Sender: TField; const Text: String);
    procedure CBSubCatClick(Sender: TObject);
    procedure CBActividadClick(Sender: TObject);
    procedure LSubCatClick(Sender: TObject);
    procedure LSubCatMouseEnter(Sender: TObject);
    procedure LSubCatMouseLeave(Sender: TObject);
    procedure LActividadMouseEnter(Sender: TObject);
    procedure LActividadMouseLeave(Sender: TObject);
    procedure IBDSSimpleINSPChange(Sender: TField);
    procedure IBDSSimpleINSPSetText(Sender: TField; const Text: String);
    procedure IBDSSimpleDESTChange(Sender: TField);
    procedure IBDSSimpleDESTSetText(Sender: TField; const Text: String);
    procedure BDBGSimpleColEnter(Sender: TObject);
    procedure BDBGSimpleCellClick(Column: TColumn);
    procedure LResultClick(Sender: TObject);
    procedure LResultMouseEnter(Sender: TObject);
    procedure LResultMouseLeave(Sender: TObject);
    procedure LDestinoClick(Sender: TObject);
    procedure LDestinoMouseEnter(Sender: TObject);
    procedure LDestinoMouseLeave(Sender: TObject);
    procedure IBDSSimpleV7Change(Sender: TField);
    procedure IBDSSimpleV7SetText(Sender: TField; const Text: String);
    procedure LSubcategorizacionMouseEnter(Sender: TObject);
    procedure LSubcategorizacionMouseLeave(Sender: TObject);
    procedure LSubcategorizacionClick(Sender: TObject);
    procedure DBLCBAInspeccionClick(Sender: TObject);
    procedure MSimpleBBAgregarUnoClick(Sender: TObject);
    procedure MSimpleBBAgregarTodosClick(Sender: TObject);
    procedure CBxRazaChange(Sender: TObject);
    procedure IBQSubCategoriaRazaAfterOpen(DataSet: TDataSet);


  private
    { Private declarations }
    RazaAnimal : Integer;
    procedure RazaFija();
    procedure CargarSubCategoriasporRaza();
    function  MismaRaza() : Boolean;
    function  GetRazaFija() : integer;

  public
    { Public declarations }
  protected
    Procedure CargarParametrosSP;override;
    Procedure CargarParametrosRN;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
  end;

var
  FEveActividad: TFEveActividad;


implementation

{$R *.dfm}

uses UPrincipal, uTiposGlobales, UImportacion, UClassType, UABMActividad, UABMEmpleados,
     UABMSubcategorias, UABMCodigosManejo, UMensajeHuella, UABMInspeccion, UABMDestCabania,
     UABMSubcategorizacion;

procedure TFEveActividad.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQInspeccion.Close;
  DMSoftvet.IBQInspeccion.Open;
  DMSoftvet.IBQCodDestCabania.Close;
  DMSoftvet.IBQCodDestCabania.Open;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQActividad.Close;
  DMSoftvet.IBQActividad.Open;
  DMSoftvet.IBQRaza.Close;
  DMSoftvet.IBQRaza.Open;
  IBQSubcategorizacion.Close;
  IBQSubcategorizacion.Open;
  IBQSubcategorizacion.Last;
  IBQSubcategorizacion.First;
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, fecha_nacimiento, nombre, apodo from VIS_ACTIVIDAD';
  AsignarValoresDefecto;

end;

Procedure TFEveActividad.CargarParametrosSP;
begin
 IBQSPEventoInd.ParamByName('FECHA').AsDate  := DTPAFecha.Date;
 IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
 IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
 IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
 IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := DBLCBAResponsable.GetDato;
 IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
 IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
 if CBActividad.Checked then
 begin
  IBQSPEventoInd.ParamByName('ACTIVIDAD').AsInteger := DBLCBAActividad.GetDato;
  if (DBLCBAActividad.KeyValue = 3) then
    IBQSPEventoInd.ParamByName('CODIGOMANEJO').AsInteger := DBLCBACodigoManejo.GetDato
  else
    IBQSPEventoInd.ParamByName('CODIGOMANEJO').AsInteger := 0;
 end
 else
  IBQSPEventoInd.ParamByName('ACTIVIDAD').Value := null;

 if CBSubCat.Checked then
  IBQSPEventoInd.ParamByName('SUBCATEGORIA').AsInteger := DBLCBASubCategoria.GetDato
 else
  IBQSPEventoInd.ParamByName('SUBCATEGORIA').Value := null;

 if CBSubcategorizacion.Checked then
  IBQSPEventoInd.ParamByName('SUBCATEGORIZACION').AsInteger := DBLCBASubcategorizacion.GetDato
 else
  IBQSPEventoInd.ParamByName('SUBCATEGORIZACION').Value := null;

 if CBInspeccion.Checked then
 begin
    IBQSPEventoInd.ParamByName('INSPECCION').AsInteger := DBLCBAInspeccion.KeyValue;
    IBQSPEventoInd.ParamByName('DESTINO').AsInteger := DBLCBACodDestCabania.KeyValue;
 end
 else
 begin
  IBQSPEventoInd.ParamByName('INSPECCION').Value := null;
  IBQSPEventoInd.ParamByName('DESTINO').Value := null;
 end;

 IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
end;

Procedure TFEveActividad.CargarParametrosRN;
begin
 IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
   if(self.ModoEve = meIndividual)then
   begin
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
      if CBActividad.Checked then
        IBQSPRN.ParamByName('ACTIVIDAD').AsInteger := DBLCBAActividad.GetDato
      else
        IBQSPRN.ParamByName('ACTIVIDAD').Value := null;

      if CBSubcat.Checked then
        IBQSPRN.ParamByName('SUBCATEGORIA').AsInteger := DBLCBASubCategoria.GetDato
      else
        IBQSPRN.ParamByName('SUBCATEGORIA').Value := null;

      if (CBActividad.Checked) and (DBLCBAActividad.KeyValue = 3) then
        IBQSPRN.ParamByName('CODIGOMANEJO').AsInteger := DBLCBACodigoManejo.GetDato
      else
        IBQSPRN.ParamByName('CODIGOMANEJO').AsInteger := 0;
   end
   else
   begin
      IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
      if CBActividad.Checked then
        IBQSPRN.ParamByName('ACTIVIDAD').AsInteger := IBDSSimpleACT.AsInteger
      else
        IBQSPRN.ParamByName('ACTIVIDAD').Value := null;
      if CBSubcat.Checked then
        IBQSPRN.ParamByName('SUBCATEGORIA').AsInteger := IBDSSimpleSUBCATEGORIA.AsInteger
      else
        IBQSPRN.ParamByName('SUBCATEGORIA').Value := null;

      if (CBActividad.Checked) and (IBDSSimpleACT.AsInteger = 3) then
        IBQSPRN.ParamByName('CODIGOMANEJO').AsInteger := IBDSSimpleCODIGOMANEJO.AsInteger
      else
        IBQSPRN.ParamByName('CODIGOMANEJO').AsInteger := 0;
   end;
 IBQSPRN.ParamByName('RAZA').Value := NULL;
 IBQSPRN.ParamByName('FECHA').AsDate := DTPAFecha.Date;
end;

Procedure TFEveActividad.CargarDatosGrilla;
begin
inherited;
{if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
begin
  IBDSSimple.Insert;}
  IDAnimal :=MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
  IBDSSimple.FieldByName('ID_RP').Value:=MSimple.IBQSeleccionados.FieldValues['ID_RP'];
  IBDSSimple.FieldByName('ID_SENASA').Value:=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];

  RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
  //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
  RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[DBLCBAResponsable.GetDato,DBLCBAResponsable.Text]);
  if CBActividad.Checked then
  begin
    RealizarCambio(DBLCBAActividad,[IBDSSimple.FieldByName('ACT'),IBDSSimple.FieldByName('ACTIVIDAD')],[DBLCBAActividad.GetDato,DBLCBAActividad.Text]);
    if DBLCBAActividad.KeyValue <> null then
      if DBLCBAActividad.KeyValue = 3 then
        RealizarCambio(DBLCBACodigoManejo,[IBDSSimple.FieldByName('CODIGOMANEJO'),IBDSSimple.FieldByName('CODMAN')],[DBLCBACodigoManejo.GetDato,DBLCBACodigoManejo.Text]);
  end;
  RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
  //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;

  if CBSubCat.Checked then
    RealizarCambio(DBLCBASubCategoria,[IBDSSimple.FieldByName('SUBCATEGORIA'),IBDSSimple.FieldByName('SUBCAT')],[DBLCBASubCategoria.GetDato,DBLCBASubCategoria.Text]);

  if CBSubcategorizacion.Checked then
    RealizarCambio(DBLCBASubcategorizacion,[IBDSSimple.FieldByName('I7'),IBDSSimple.FieldByName('V7')],[DBLCBASubcategorizacion.GetDato,DBLCBASubcategorizacion.Text]);

  if CBInspeccion.Checked then
  begin
    RealizarCambio(DBLCBAInspeccion,[IBDSSimple.FieldByName('INSPECCION'),IBDSSimple.FieldByName('INSP')],[DBLCBAInspeccion.KeyValue,DBLCBAInspeccion.Text]);
    RealizarCambio(DBLCBACodDestCabania,[IBDSSimple.FieldByName('DESTINO'),IBDSSimple.FieldByName('DEST')],[DBLCBACodDestCabania.KeyValue,DBLCBACodDestCabania.Text]);
  end;

  IBDSSimple.FieldByName('ID_ANIMAL').Value:= IDAnimal;
end;

Procedure TFEveActividad.CargarParametrosMasivo;

begin
  if(CrearGrupo)then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  if CBActividad.Checked then
  begin
    IBQSPEventoInd.ParamByName('ACTIVIDAD').Value := IBDSSimple.FieldValues['ACT'];
    if (IBDSSimpleACT.AsInteger = 3) then
      IBQSPEventoInd.ParamByName('CODIGOMANEJO').AsInteger := IBDSSimpleCODIGOMANEJO.AsInteger
    else
      IBQSPEventoInd.ParamByName('CODIGOMANEJO').AsInteger := 0;
  end
  else
  begin
    IBQSPEventoInd.ParamByName('ACTIVIDAD').Value := null;
  end;
  if CBSubCat.Checked then
    IBQSPEventoInd.ParamByName('SUBCATEGORIA').AsInteger := IBDSSimpleSUBCATEGORIA.AsInteger
  else
    IBQSPEventoInd.ParamByName('SUBCATEGORIA').Value := null;

  if CBSubcategorizacion.Checked then
    IBQSPEventoInd.ParamByName('SUBCATEGORIZACION').AsInteger := IBDSSimpleI7.AsInteger
  else
    IBQSPEventoInd.ParamByName('SUBCATEGORIZACION').Value := null;

  if CBInspeccion.Checked then
  begin
    IBQSPEventoInd.ParamByName('INSPECCION').AsInteger := IBDSSimpleINSPECCION.AsInteger;
    IBQSPEventoInd.ParamByName('DESTINO').AsInteger := IBDSSimpleDESTINO.AsInteger;
  end
  else
  begin
    IBQSPEventoInd.ParamByName('INSPECCION').Value := null;
    IBQSPEventoInd.ParamByName('DESTINO').Value := null;
  end;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;
end;

Procedure TFEveActividad.LoadSQLStringList;
begin
 SQLStringList.AddObject('RESP',DMSoftvet.DSResponsable);
 SQLStringList.AddObject('ACTIVIDAD',DMSoftvet.DSActividad);
 SQLStringList.AddObject('SUBCAT',DMSoftvet.DSSubCategoriaRaza);
 SQLStringList.AddObject('CODMAN',DMSoftvet.DSCodigosManejo);
 SQLStringList.AddObject('INSP',DMSoftvet.DSInspeccion);
 SQLStringList.AddObject('DEST',DMSoftvet.DSCodDestCabania);
 SQLStringList.AddObject('NOMRAZA',DMSoftvet.DSRaza);
 SQLStringList.AddObject('V7',DSSubcategorizacion);
 inherited;
end;



procedure TFEveActividad.FormShow(Sender: TObject);
begin
  inherited;

  MSimple.PasarParametros(0,0);//cambie codigo
  DTPAFecha.Date := now;
  //DTPAFecha.MaxDate:= now;
  DMSoftvet.IBQCodigosManejo.Close;
  DMSoftvet.IBQCodigosManejo.Open;
  if ModoEve = meIndividual then
  begin
    IBQGetRaza.Close;
    IBQGetRaza.ParamByName('id').AsInteger := IdAnimal;
    IBQGetRaza.Open;
    RazaAnimal := IBQGetRaza.FieldValues['raza'];
    IBQSubCategoriaRaza.Close;
    IBQSubCategoriaRaza.ParamByName('raza').AsInteger := RazaAnimal;
    IBQSubCategoriaRaza.Open;
  end;

//  GBEspecificFenotip.Visible := true;

end;

procedure TFEveActividad.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveActividad.cargarDatos(i:integer);
begin
  inherited;
  DMSoftvet.IBQDatosAnimal.Close;
  DMSoftvet.IBQDatosAnimal.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQDatosAnimal.Open;
  IBDSSimple.FieldByName('ID_SENASA').Value:=DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',IBDSSimple.FieldByName('ID_ANIMAL').Value,'ID_SENASA');
  IBDSSimple.FieldByName('ACTIVIDAD').Value:=getDato('actividad',anim[i]);
  IBDSSimple.FieldByName('ACT').Value:=DBLCBAActividad.ListSource.DataSet.Lookup('SINONIMO',IBDSSimple.FieldByName('ACTIVIDAD').Value,'ID_ACTIVIDAD');
  IBDSSimple.FieldByName('RESP').Value:=getDato('responsable',anim[i]);
  IBDSSimple.FieldByName('RESPONSABLE').Value:=DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
  IBDSSimple.FieldByName('SUBCAT').Value:=0;
  IBDSSimple.FieldByName('CODMAN').Value:=0;  
end;

procedure TFEveActividad.IBDSSimpleID_RPSetText(Sender: TField;const Text: String);
begin
  inherited;
  //hereda
end;

procedure TFEveActividad.IBDSSimpleACTIVIDADSetText(Sender: TField;
  const Text: String);
var PickPos:integer;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
      SetText(Sender,text);
      if(Sender.FieldName = 'ACTIVIDAD')then
       begin
           IBQValidaciones.Close;
           IBQValidaciones.Params.Clear;
           IBQValidaciones.SQL.Add('select sinonimo as valor from COD_ACTIVIDAD where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or (CODIGO like '''+UpperCase(Text)+'%'')');
           IBQValidaciones.Open;
           if not(IBQValidaciones.IsEmpty) then
           begin
              Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
              PickPos := BDBGSimple.ColumnByField('ACTIVIDAD').PickList.IndexOf(BDBGSimple.ColumnByField('ACTIVIDAD').Field.AsString);
              IBDSSimpleACT.Value := TClassType(BDBGSimple.ColumnByField('ACTIVIDAD').PickList.Objects[PickPos]).getValue;
           end;
      end
   end;
end;

procedure TFEveActividad.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      (Sender as TLabel).Font.Color:= $00606C02;
      (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveActividad.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= clWindowText;
    (Sender as TLabel).Font.Style:= [fsUnderline];
  end;
end;

procedure TFEveActividad.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
  {if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
    DMSoftvet.IBQResponsable.Close;
    DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQResponsable.Open;
  end;}
end;

procedure TFEveActividad.LActividadClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    //nroID:=0;
    FPrincipal.AbrirFormNormal(TFABMActividad.Create(self));
    DMSoftvet.IBQActividad.Close;
    DMSoftvet.IBQActividad.Open;
    cambiarCB(DBLCBAResponsable,nroID);
  end;
end;

procedure TFEveActividad.IBDSSimpleRESPChange(Sender: TField);
var PickPos : integer;
begin
  inherited;
  if (IBDSSimple.State <> dsInsert ) then
    begin
      PickPos := BDBGSimple.ColumnByField('RESP').PickList.IndexOf(BDBGSimple.ColumnByField('RESP').Field.AsString);
      IBDSSimpleRESPONSABLE.Value := TClassType(BDBGSimple.ColumnByField('RESP').PickList.Objects[PickPos]).getValue;
    end;
end;

procedure TFEveActividad.IBDSSimpleRESPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
      IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
        Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
    end;
end;

procedure TFEveActividad.MSimpleRBTodasClick(Sender: TObject);
begin
  inherited;
//  MSimple.DBLCBARaza.Enabled:= true;
//  MSimple.CBRaza.Enabled:= true;

//  MSimple.DBLCBARaza.KeyValue:= 0;
//  MSimple.CBRaza.Checked:= true;
//  MSimple.CBRaza.OnClick:= nil;
 // MSimple.RBTodasClick(nil);

  RazaFija();

  //MSimple.DBLCBARaza.KeyValue:= 0;
  //MSimple.CBRaza.Enabled:= false;
//  MSimple.CBClick(MSimple.CBRaza);
//
end;

procedure TFEveActividad.MSimpleDBLCBCategoriaCloseUp(Sender: TObject);
begin
  inherited;
  RazaFija();
end;

procedure TFEveActividad.MSimpleCBCategoriaClick(Sender: TObject);
begin
  inherited;
  MSimple.CBClick(Sender);
  RazaFija();
end;

procedure TFEveActividad.DBLCBAActividadCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBAActividad.KeyValue = 3) then
    begin
      LCodigoManejo.Visible:= true;
      DBLCBACodigoManejo.Visible:= true;
      DBLCBACodigoManejo.EsRequerido := true;
      BDBGSimple.Columns[5].Visible := true;
    end
   else
     begin
        LCodigoManejo.Visible:= false;
        DBLCBACodigoManejo.Visible:= false;
        DBLCBACodigoManejo.EsRequerido := false;
        BDBGSimple.Columns[5].Visible := false;
     end;     
end;

procedure TFEveActividad.RazaFija;
begin
  MSimple.CBRaza.Checked:= true;
  MSimple.DBLCBARaza.Enabled:= true;
  if (MSimple.DBLCBARaza.KeyValue = null) then
    MSimple.DBLCBARaza.KeyValue:= 0;
  MSimple.DBLCBACloseUp(MSimple.DBLCBARaza);
  MSimple.CBRaza.Enabled:= false;
  CargarSubCategoriasporRaza();
  MSimple.CBRaza.Checked:= false;
end;

procedure TFEveActividad.CargarSubCategoriasporRaza;
begin
  IBQSubCategoriaRaza.Close;
  IBQSubCategoriaRaza.ParamByName('raza').Value := GetRazaFija();
  IBQSubCategoriaRaza.Open;
  IBQSubCategoriaRaza.First;
end;

procedure TFEveActividad.MSimpleDBLCBARazaCloseUp(Sender: TObject);
var cod_raza : integer;
begin
  inherited;

//--------------- AGREGADO PARA DESARROLLO BRAFORD------------------------------
  cod_raza := MSimple.DBLCBARaza.KeyValue;
{
  if ((cod_raza = 11) or (cod_raza = 12) or (cod_raza = 28)) then
  begin
    GBActividad.Visible := false;
    GBEspecificFenotip.Visible := true;
  end
  else
  begin
    GBActividad.Visible := true;
    GBEspecificFenotip.Visible := false;
  end;
}
//------------------------------------------------------------------------------  
  CargarSubCategoriasporRaza();
  MSimple.DBLCBARazaCloseUp(Sender);
end;

procedure TFEveActividad.IBDSSimpleSUBCATChange(Sender: TField);
var PickPos : integer;
begin
  inherited;
  if (IBDSSimple.State <> dsInsert ) then
    begin
      PickPos := BDBGSimple.ColumnByField('SUBCAT').PickList.IndexOf(BDBGSimple.ColumnByField('SUBCAT').Field.AsString);
      IBDSSimpleSUBCATEGORIA.Value := TClassType(BDBGSimple.ColumnByField('SUBCAT').PickList.Objects[PickPos]).getValue;
    end;
end;

procedure TFEveActividad.IBDSSimpleSUBCATSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select SINONIMO from COD_SUBCATEGORIAS where (SINONIMO like '''+UpperCase(Text)+'%'')');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
        Sender.AsString := IBQValidaciones.FieldByName('SINONIMO').AsString;
    end;
end;

procedure TFEveActividad.LSubCategoriaClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    //nroID:=0;
    FPrincipal.AbrirFormNormal(TFABMSubCategorias.Create(self));
    IBQSubCategoriaRaza.Close;
    IBQSubCategoriaRaza.Open;
    cambiarCB(DBLCBASubCategoria,nroID);
  end;
end;

procedure TFEveActividad.LCodigoManejoClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    //nroID:=0;
    FPrincipal.AbrirFormNormal(TFABMCodigosManejo.Create(self));
    DMSoftvet.IBQCodigosManejo.Close;
    DMSoftvet.IBQCodigosManejo.Open;
    cambiarCB(DBLCBACodigoManejo,nroID);
  end;
end;

procedure TFEveActividad.IBDSSimpleCODMANChange(Sender: TField);
var PickPos : integer;
begin
  inherited;
  if (IBDSSimple.State <> dsInsert ) then
    begin
      PickPos := BDBGSimple.ColumnByField('CODMAN').PickList.IndexOf(BDBGSimple.ColumnByField('CODMAN').Field.AsString);
      IBDSSimpleCODIGOMANEJO.Value := TClassType(BDBGSimple.ColumnByField('CODMAN').PickList.Objects[PickPos]).getValue;
    end;
end;

procedure TFEveActividad.IBDSSimpleCODMANSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select SINONIMO from COD_CODIGOS_MANEJO where (SINONIMO like '''+UpperCase(Text)+'%'')');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
        Sender.AsString := IBQValidaciones.FieldByName('SINONIMO').AsString;
    end;
end;

procedure TFEveActividad.CBSubCatClick(Sender: TObject);
begin
  inherited;

  if (not CBSubCat.Checked) and (not CBActividad.Checked) and (not CBInspeccion.Checked) and (not CBSubcategorizacion.Checked) then
  begin
    DBLCBASubCategoria.Enabled := true;
    DBLCBASubCategoria.EsRequerido := true;
    BDBGSimple.Columns[4].Visible := true;
    CBSubCat.Checked := true;
    MostrarMensaje(tmAdvertencia,'Debe seleccionar alguna de las tres opciones');
  end
  else
  begin
    //Subcategoria
    DBLCBASubCategoria.Enabled := CBSubCat.Checked;
    DBLCBASubCategoria.EsRequerido := CBSubCat.Checked;
    BDBGSimple.Columns[4].Visible := CBSubCat.Checked;
    //Actividad
    DBLCBAActividad.Enabled := CBActividad.Checked;
    DBLCBAActividad.EsRequerido := CBActividad.Checked;
    BDBGSimple.Columns[2].Visible := CBActividad.Checked;
    LCodigoManejo.Visible:= CBActividad.Checked and DBLCBAActividad.KeyValue = 3;
    DBLCBACodigoManejo.Visible:= CBActividad.Checked and DBLCBAActividad.KeyValue = 3;
    DBLCBACodigoManejo.EsRequerido := CBActividad.Checked and DBLCBAActividad.KeyValue = 3;
    BDBGSimple.Columns[5].Visible := CBActividad.Checked and DBLCBAActividad.KeyValue = 3;
    //Inspeccion
    DBLCBAInspeccion.Enabled := CBInspeccion.Checked;
    DBLCBAInspeccion.EsRequerido := CBInspeccion.Checked;
    DBLCBACodDestCabania.Enabled := CBInspeccion.Checked;
    BDBGSimple.Columns[6].Visible := CBInspeccion.Checked;
    BDBGSimple.Columns[7].Visible := CBInspeccion.Checked;
    //Subcategorizacion
    DBLCBASubcategorizacion.Enabled := CBSubcategorizacion.Checked;
    DBLCBASubcategorizacion.EsRequerido := CBSubcategorizacion.Checked;
    BDBGSimple.Columns[8].Visible := CBSubcategorizacion.Checked;
  end;
{  if (CBSubCat.Checked) then
  begin
    DBLCBASubCategoria.Enabled := true;
    DBLCBASubCategoria.EsRequerido := true;
    BDBGSimple.Columns[4].Visible := true;
  end
  else
  begin
    if (CBActividad.Checked) then
    begin
      DBLCBASubCategoria.Enabled := false;
      DBLCBASubCategoria.EsRequerido := false;
      BDBGSimple.Columns[4].Visible := false;
    end
    else
    begin
      MostrarMensaje(tmAdvertencia,'Debe seleccionar alguna de las dos opciones');
      CBSubCat.Checked := true;
    end;
  end;   }

  ControlEventoOnExit(nil);

end;

procedure TFEveActividad.CBActividadClick(Sender: TObject);
begin
  inherited;
  if (CBActividad.Checked) then
  begin
    DBLCBAActividad.Enabled := true;
    DBLCBAActividad.EsRequerido := true;
    BDBGSimple.Columns[2].Visible := true;
  end
  else
  begin
    if (CBSubCat.Checked) then
    begin
      DBLCBAActividad.Enabled := false;
      DBLCBAActividad.EsRequerido := false;
      BDBGSimple.Columns[2].Visible := false;
      BDBGSimple.Columns[5].Visible := false;
      LCodigoManejo.Visible := false;
      DBLCBACodigoManejo.Visible := false;
    end
    else
    begin
      MostrarMensaje(tmAdvertencia,'Debe seleccionar alguna de las dos opciones');
      CBActividad.Checked := true;
    end;
  end;
end;

procedure TFEveActividad.LSubCatClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AbrirFormNormal(TFABMSubCategorias.Create(Self));
    IBQSubCategoriaRaza.Close;
    IBQSubCategoriaRaza.ParamByName('raza').Value := GetRazaFija();
    IBQSubCategoriaRaza.Open;
    if nroID>-1 then
    begin
      DBLCBASubCategoria.KeyValue:=nroID;
      nroID:=-1;
    end;
  end;
end;

procedure TFEveActividad.LSubCatMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LSubCat.Font.Color:= $00606C02;
      LSubCat.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveActividad.LSubCatMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LSubCat.Font.Color:= clWindowText;
      LSubCat.Font.Style:= [fsUnderline];
  end;
end;

procedure TFEveActividad.LActividadMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LActividad.Font.Color:= $00606C02;
      LActividad.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveActividad.LActividadMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LActividad.Font.Color:= clWindowText;
      LActividad.Font.Style:= [fsUnderline];
  end;
end;

procedure TFEveActividad.IBDSSimpleINSPChange(Sender: TField);
var PickPos : integer;
begin
  inherited;
  if (IBDSSimple.State <> dsInsert ) then
    begin
      PickPos := BDBGSimple.ColumnByField('INSP').PickList.IndexOf(BDBGSimple.ColumnByField('INSP').Field.AsString);
      IBDSSimpleINSPECCION.Value := TClassType(BDBGSimple.ColumnByField('INSP').PickList.Objects[PickPos]).getValue;
    end;
end;

procedure TFEveActividad.IBDSSimpleINSPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select SINONIMO from COD_INSPECCION where (SINONIMO like '''+UpperCase(Text)+'%'')');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
        Sender.AsString := IBQValidaciones.FieldByName('SINONIMO').AsString;
    end;
end;

procedure TFEveActividad.IBDSSimpleDESTChange(Sender: TField);
var PickPos : integer;
begin
  inherited;
  if (IBDSSimple.State <> dsInsert ) then
    begin
      PickPos := BDBGSimple.ColumnByField('DEST').PickList.IndexOf(BDBGSimple.ColumnByField('DEST').Field.AsString);
      IBDSSimpleDESTINO.Value := TClassType(BDBGSimple.ColumnByField('DEST').PickList.Objects[PickPos]).getValue;
    end;
end;

procedure TFEveActividad.IBDSSimpleDESTSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select SINONIMO from COD_DEST_CABANIA where (SINONIMO like '''+UpperCase(Text)+'%'')');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
        Sender.AsString := IBQValidaciones.FieldByName('SINONIMO').AsString;
    end;
end;

procedure TFEveActividad.BDBGSimpleColEnter(Sender: TObject);
begin
  IBQGetRaza.Close;
  IBQGetRaza.ParamByName('id').AsInteger := IBDSSimpleID_ANIMAL.AsInteger;
  IBQGetRaza.Open;
  DMSoftvet.IBQSubCategoriaRaza.Close;
  DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').Value := IBQGetRaza.FieldValues['raza'];
  DMSoftvet.IBQSubCategoriaRaza.Open;
  LoadSQLStringList;
  inherited;
end;

procedure TFEveActividad.BDBGSimpleCellClick(Column: TColumn);
begin
  inherited;
  BDBGSimpleColEnter(nil);
end;

procedure TFEveActividad.LResultClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    //nroID:=0;
    FPrincipal.AbrirFormNormal(TFABMInspeccion.Create(self));
    DMSoftvet.IBQInspeccion.Close;
    DMSoftvet.IBQInspeccion.Open;
    cambiarCB(DBLCBAInspeccion,nroID);
  end;
end;

procedure TFEveActividad.LResultMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LResult.Font.Color:= $00606C02;
      LResult.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveActividad.LResultMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LResult.Font.Color:= clWindowText;
      LResult.Font.Style:= [fsUnderline];
  end;
end;



procedure TFEveActividad.LDestinoClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    //nroID:=0;
    FPrincipal.AbrirFormNormal(TFABMDestCabania.Create(self));
    DMSoftvet.IBQCodDestCabania.Close;
    DMSoftvet.IBQCodDestCabania.Open;
    cambiarCB(DBLCBACodDestCabania,nroID);
  end;
end;

procedure TFEveActividad.LDestinoMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LDestino.Font.Color:= $00606C02;
      LDestino.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveActividad.LDestinoMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LDestino.Font.Color:= clWindowText;
      LDestino.Font.Style:= [fsUnderline];
  end;
end;

//------------------------------------------------------------------------------


procedure TFEveActividad.IBDSSimpleV7Change(Sender: TField);
var PickPos : integer;
begin
  inherited;
  if (IBDSSimple.State <> dsInsert ) then
    begin
      PickPos := BDBGSimple.ColumnByField('V7').PickList.IndexOf(BDBGSimple.ColumnByField('V7').Field.AsString);
      IBDSSimpleI7.Value := TClassType(BDBGSimple.ColumnByField('V7').PickList.Objects[PickPos]).getValue;
    end;
end;


procedure TFEveActividad.IBDSSimpleV7SetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select SINONIMO from COD_SUBCATEGORIZACION where (SINONIMO like '''+UpperCase(Text)+'%'') or (NOMBRE like '''+UpperCase(Text)+'%'') ');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
        Sender.AsString := IBQValidaciones.FieldByName('SINONIMO').AsString;
    end;
end;

procedure TFEveActividad.LSubcategorizacionMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LSubcategorizacion.Font.Color:= $00606C02;
      LSubcategorizacion.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveActividad.LSubcategorizacionMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LSubcategorizacion.Font.Color:= clWindowText;
      LSubcategorizacion.Font.Style:= [fsUnderline];
  end;
end;

procedure TFEveActividad.LSubcategorizacionClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    //nroID:=0;
    FPrincipal.AbrirFormNormal(TFABMSubcategorizacion.Create(self));
    IBQSubcategorizacion.Close;
    IBQSubcategorizacion.Open;
    cambiarCB(DBLCBASubcategorizacion,nroID);
  end;
end;

procedure TFEveActividad.DBLCBAInspeccionClick(Sender: TObject);
begin
  DBLCBACodDestCabania.AsignarValorDefecto;
end;

procedure TFEveActividad.MSimpleBBAgregarUnoClick(Sender: TObject);
begin
  inherited;
  if MismaRaza then
  begin
    MostrarMensaje(tmError, 'Los animales seleccionados deben ser de la misma raza.');
    MSimple.BBEliminarTodos.OnClick(nil);
  end
  else CBxRazaChange(nil);
end;

procedure TFEveActividad.MSimpleBBAgregarTodosClick(Sender: TObject);
begin
  inherited;
  if MismaRaza then
  begin
    MostrarMensaje(tmError, 'Los animales seleccionados deben ser de la misma raza.');
    MSimple.BBEliminarTodos.OnClick(nil);
  end
  else CBxRazaChange(nil);
end;

function TFEveActividad.MismaRaza : Boolean;
var id_aux, raza, raza_aux : integer;
begin
  raza := -1;
  MSimple.IBQSeleccionados.First;
  while not (MSimple.IBQSeleccionados.Eof) do
  begin
    id_aux := MSimple.IBQSeleccionados.FieldByName('id_animal').AsInteger;
    IBQGetRaza.Close;
    IBQGetRaza.ParamByName('id').AsInteger := id_aux;
    IBQGetRaza.Open;
    if (raza = -1) then
    begin
      raza := IBQGetRaza.FieldValues['raza'];
    end
    else
    begin
      raza_aux := IBQGetRaza.FieldValues['raza'];
      if (raza <> raza_aux) then
      begin
        result := true; exit;
      end;
    end;
    MSimple.IBQSeleccionados.Next;
  end;
  result := false;
end;

function TFEveActividad.GetRazaFija : integer;
var animal_aux : integer;
begin
  MSimple.IBQSeleccionados.First;
  if not (MSimple.IBQSeleccionados.Eof) then
  begin
      animal_aux := MSimple.IBQSeleccionados.FieldByName('id_animal').AsInteger;
      IBQGetRaza.Close;
      IBQGetRaza.ParamByName('id').AsInteger := animal_aux;
      IBQGetRaza.Open;
      result := IBQGetRaza.FieldValues['raza']; exit;
  end
  else
  if ((MSimple.CBxRaza.Text <> 'RAZA') and (MSimple.CBxRaza.Text <> '(TODAS)') and (MSimple.CBxRaza.Text <> '')) then
  begin
      result := DMSoftvet.IBQRaza.Lookup('sinonimo',MSimple.CBxRaza.Text,'id_raza'); exit;
  end;
  result := 0;
end;

procedure TFEveActividad.CBxRazaChange(Sender: TObject);
begin
  IBQSubCategoriaRaza.Close;
  IBQSubCategoriaRaza.ParamByName('raza').AsInteger := GetRazaFija();
  IBQSubCategoriaRaza.Open;
  IBQSubCategoriaRaza.First;
  MSimple.CBxRazaChange(self);
end;

procedure TFEveActividad.IBQSubCategoriaRazaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    MoveBy(20);
    First;
  end;
end;

end.
