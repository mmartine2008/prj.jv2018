unit UEveFlushing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, IBQuery, DB, IBCustomDataSet, WinXP, DataExport,
  DataToXLS, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids,
  DBGrids, UBDBGrid, MemoAuto, EditAuto, UFrameMangazo, Buttons, UDMSoftvet,
  DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, UClassType, ImgList,
  Types, DateUtils, PngImageList, JvExControls, JvLabel, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveFlushing = class(TFEveSimple)
    GroupBox1: TGroupBox;
    LSincronizacion: TLabel;
    LTratamiento: TLabel;
    LDeteccion: TLabel;
    LInseminacion: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    LCantEmbrionesValue: TLabel;
    DTPAFechaColeccion: TDateTimePickerAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleI2: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleI3: TIntegerField;
    ILEmbriones: TImageList;
    IBQActCantidad: TIBQuery;
    LCentros: TLabel;
    DBLCBACentrosTrans: TDBLookupComboBoxAuto;
    IBQCentrosTransplante: TIBQuery;
    DSCentrosTransplante: TDataSource;
    IBDSSimpleID_HBA: TIBStringField;
    IBDSSimpleNOMBRE: TIBStringField;
    IBDSSimpleI4: TIntegerField;
    IBDSSimpleV4: TIBStringField;
    Label8: TLabel;
    EAPrecio: TEditAuto;
    IBDSSimpleF1: TFloatField;
    IBQSPGuardarEmbriones: TIBQuery;
    BBCargarEmbriones: TBitBtn;
    EACant: TEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    EASinFertilizar: TEditAuto;
    EADegenerados: TEditAuto;
    IBDSSimpleI5: TIntegerField;
    IBDSSimpleI6: TIntegerField;
    IBDSSimpleTOTAL: TIntegerField;
    IBDSSimpleVUNO1: TIBStringField;
    CBSinEmbriones: TCheckBox;
    IBQVerificarTransferencia: TIBQuery;
    IBQSelReceptora: TIBQuery;
    ICargarEmbriones: TImage;
    LCargarEmbriones: TLabel;
    IBQExisteDatos: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure IBDSSimpleV1SetText(Sender: TField; const Text: String);
    procedure BDBGSimpleDblClick(Sender: TObject);
    procedure BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IBQCentrosTransplanteAfterPost(DataSet: TDataSet);
    procedure EAPrecioChange(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure BBCargarEmbrionesClick(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure LSincronizacionClick(Sender: TObject);
    procedure LTratamientoClick(Sender: TObject);
    procedure LDeteccionClick(Sender: TObject);
    procedure LInseminacionClick(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LCentrosClick(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure DTPAFechaColeccionChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBACloseUp(Sender: TObject);
    procedure ASacarAnimalExecute(Sender: TObject);
    procedure BBXlsImportClick(Sender: TObject);
    procedure EASinFertilizarChange(Sender: TObject);
    procedure EADegeneradosChange(Sender: TObject);
    procedure IBDSSimpleCalcFields(DataSet: TDataSet);
    procedure BDBGSimpleCellClick(Column: TColumn);
    procedure CBSinEmbrionesClick(Sender: TObject);
  private
    precio : Double;
    sin_fertilizar, degenerados : integer;
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    procedure CargarDatosGrilla; override;
    procedure CargarParametrosMasivo; override;
    procedure LoadSQLStringList; override;
    procedure ManejarDatosDeSP; override;
    procedure cargarDatos(i:integer);override;
    procedure continuarGrilla;override;
    function ActCantEmbriones(ID : Integer; Fecha : TDate) : Integer;
    procedure BorrarAux();
    procedure DatosEmbriones(Madre, Responsable : Integer; Fecha : TDate);
    procedure AcomodarGrilla();
  public
    procedure HabilitarMenu(Habilitado : Boolean);
  end;

var
  FEveFlushing: TFEveFlushing;

implementation

uses
  UPrincipal, UImportacion, UDatosEmbriones, UMensajeHuella, UEveSincronizacionCelo,
  UEveTratamiento, UEveDeteccionCelo, UEveInseminacionArtificial, UAvanceTerminar,
  UEveTransferenciaEmbrionaria, Utraduccion;

{$R *.dfm}

procedure TFEveFlushing.FormCreate(Sender: TObject);
begin
  inherited;
  MSimple.SQLBasico := 'select id_rp, id_animal, id_senasa, nombre, id_hba, id_pc, id_otro, id_ie, nombre, apodo from vis_flushing';
  MSimple.PasarParametros(5,5);
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMsoftvet.IBQResponsable.Open;
  DTPAFechaColeccion.Date := Date();
  precio := 0;
  sin_fertilizar := 0;
  degenerados := 0;
  HabilitarMenu(True);
end;

procedure TFEveFlushing.CargarParametrosRN;
begin
  IBQSPRN.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  if ModoEve = meIndividual then
  begin
    IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
    IBQSPRN.ParamByName('fecha').AsDate := DTPAFechaColeccion.Date;
  end
  else
  begin
    IBQSPRN.ParamByName('animal').AsInteger := IBDSSimple.FieldValues['id_animal'];
    IBQSPRN.ParamByName('fecha').AsDate := IBDSSimple.FieldValues['fecha'];
  end;
end;

procedure TFEveFlushing.CargarParametrosSP;
var
  valor : double;
begin
  IBQSPEventoInd.ParamByName('fecha').AsDate := DTPAFechaColeccion.Date;
  IBQSPEventoInd.ParamByName('animal').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('observacion').AsString := MAObservacion.Text;
  IBQSPEventoInd.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('responsable').AsInteger := DBLCBAResponsable.KeyValue;
  IBQSPEventoInd.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('log_fecha_modificacion').AsDate := Date();
  IBQSPEventoInd.ParamByName('id_grupo').Value := null;
  IBQSPEventoInd.ParamByName('disparador').Value := null;
  IBQSPEventoInd.ParamByName('cant_embriones').AsInteger := StrToInt(EACant.Text);
  IBQSPEventoInd.ParamByName('precio').Value := precio;
  IBQSPEventoInd.ParamByName('centro_transplante').Value := DBLCBACentrosTrans.KeyValue;
  IBQSPEventoInd.ParamByName('sin_fertilizar').Value := sin_fertilizar;
  IBQSPEventoInd.ParamByName('degenerados').Value := degenerados;
 { if CBSinEmbriones.Checked then
    IBQSPEventoInd.ParamByName('sin_embriones').Value := 'S'
  else
    IBQSPEventoInd.ParamByName('sin_embriones').Value := 'N';}
end;

procedure TFEveFlushing.CargarDatosGrilla;
var
  val_i : integer;
  val_d : double;
begin
  IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
  IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
  IBDSSimple.FieldByName('ID_SENASA').Value :=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
  IBDSSimple.FieldByName('ID_HBA').Value :=MSimple.IBQSeleccionados.FieldValues['ID_HBA'];
  IBDSSimple.FieldByName('NOMBRE').Value :=MSimple.IBQSeleccionados.FieldValues['NOMBRE'];

  RealizarCambio(DTPAFechaColeccion,[IBDSSimple.FieldByName('FECHA')],[DTPAFechaColeccion.Date]);
  val_i := 0;
  TryStrToInt(LCantEmbrionesValue.Caption,val_i);
  RealizarCambio(LCantEmbrionesValue,[IBDSSimple.FieldByName('I2')],[val_i]);
  RealizarCambio(LCantEmbrionesValue,[IBDSSimple.FieldByName('I3')],[val_i]);//para el icono
  RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('I1'),IBDSSimple.FieldByName('V1')],[DBLCBAResponsable.KeyValue,DBLCBAResponsable.Text]);
  RealizarCambio(DBLCBACentrosTrans,[IBDSSimple.FieldByName('I4'),IBDSSimple.FieldByName('V4')],[DBLCBACentrosTrans.KeyValue,DBLCBACentrosTrans.Text]);
  val_d := 0;
  TryStrToFloat(EAPrecio.Text,val_d);
  RealizarCambio(EAPrecio,[IBDSSimple.FieldByName('F1')],[val_d]);
  val_i := 0;
  TryStrToInt(EASinFertilizar.Text,val_i);
  RealizarCambio(EASinFertilizar,[IBDSSimple.FieldByName('I5')],[val_i]);
  val_i := 0;
  TryStrToInt(EADegenerados.Text,val_i);
  RealizarCambio(EADegenerados,[IBDSSimple.FieldByName('I6')],[val_i]);
  if CBSinEmbriones.Checked then
    RealizarCambio(CBSinEmbriones,[IBDSSimple.FieldByName('VUNO1')],['S'])
  else
    RealizarCambio(CBSinEmbriones,[IBDSSimple.FieldByName('VUNO1')],['N']);
end;

procedure TFEveFlushing.CargarParametrosMasivo;
begin
  IBQSPEventoInd.ParamByName('fecha').AsDate := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('animal').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('observacion').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('establecimiento').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('responsable').Value := IBDSSimple.FieldValues['I1'];
  IBQSPEventoInd.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('log_fecha_modificacion').AsDate := Date();
  IBQSPEventoInd.ParamByName('id_grupo').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;
  IBQSPEventoInd.ParamByName('disparador').Value := null;
  IBQSPEventoInd.ParamByName('cant_embriones').Value := IBDSSimple.FieldValues['I2'];
  IBQSPEventoInd.ParamByName('precio').Value := IBDSSimple.FieldValues['F1'];
  IBQSPEventoInd.ParamByName('centro_transplante').Value := IBDSSimple.FieldValues['I4'];
  IBQSPEventoInd.ParamByName('sin_fertilizar').Value := IBDSSimple.FieldValues['I5'];
  IBQSPEventoInd.ParamByName('degenerados').Value := IBDSSimple.FieldValues['I6'];
  {if IBDSSimple.FieldByName('VUNO1').AsString = 'S' then
    IBQSPEventoInd.ParamByName('sin_embriones').Value := 'S'
  else
    IBQSPEventoInd.ParamByName('sin_embriones').Value := 'N';}
end;

procedure TFEveFlushing.ManejarDatosDeSP;
var
  check : Boolean;
begin
  if modoEve = meIndividual then
    check := CBSinEmbriones.Checked or (StrToInt(EACant.Text) = 0)
  else
    check := (IBDSSimple.FieldByName('VUNO1').AsString = 'S') or (IBDSSimple.FieldByName('I2').AsInteger = 0);
  if not check then
  begin
    IBQSPGuardarEmbriones.Close;
    IBQSPGuardarEmbriones.ParamByName('INTERNA').AsString := 'S';
    IBQSPGuardarEmbriones.ParamByName('EVENTO').AsInteger := IBQSPEventoInd.FieldValues['EVENTO'];
    if modoEve = meIndividual then
    begin
      IBQSPGuardarEmbriones.ParamByName('MADRE').AsInteger := IDAnimal;
      IBQSPGuardarEmbriones.ParamByName('CENTRO_TRANSPLANTE').AsInteger := DBLCBACentrosTrans.KeyValue;
    end
    else
    begin
      IBQSPGuardarEmbriones.ParamByName('MADRE').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
      IBQSPGuardarEmbriones.ParamByName('CENTRO_TRANSPLANTE').AsInteger := IBDSSimple.FieldValues['I4'];
    end;
    IBQSPGuardarEmbriones.Open;
  end;
end;

procedure TFEveFlushing.LoadSQLStringList;
begin
  SQLStringList.AddObject('V1',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('V4',TObject(DSCentrosTransplante));
end;

procedure TFEveFlushing.IBDSSimpleV1SetText(Sender: TField;
  const Text: String);
var
  PickPos : Integer;
  val_d : double;
  val_i : integer;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    if (Sender.FieldName = 'V1') then  //Responsable
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
      IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
        PickPos := BDBGSimple.ColumnByField('V1').PickList.IndexOf(BDBGSimple.ColumnByField('V1').Field.AsString);
        IBDSSimple.FieldByName('I1').Value :=  TClassType(BDBGSimple.ColumnByField('V1').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'V4') then  //Responsable
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from centros_transplante where nombre like '''+UpperCase(Text)+'%''');
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V4').PickList.IndexOf(BDBGSimple.ColumnByField('V4').Field.AsString);
        IBDSSimple.FieldByName('I4').Value :=  TClassType(BDBGSimple.ColumnByField('V4').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if (Sender.FieldName = 'I5') then
    begin
      val_i := 0;
      if TryStrToInt(Text, val_i) then
      begin
        if (val_i > 0) and (IBDSSimpleVUNO1.Value = 'S') then
          IBDSSimpleVUNO1.Value := 'N';
        Sender.Value := val_i;
      end;
    end;
    if (Sender.FieldName = 'I6') then
    begin
      val_i := 0;
      if TryStrToInt(Text,val_i) then
      begin
        if (val_i > 0) and (IBDSSimpleVUNO1.Value = 'S') then
          IBDSSimpleVUNO1.Value := 'N';
        Sender.Value := val_i;
      end;
    end;
  end;
end;

function TFEveFlushing.ActCantEmbriones(ID : Integer; Fecha : TDate) : Integer;
begin
  IBQActCantidad.Close;
  IBQActCantidad.ParamByName('id').AsInteger := ID;
  IBQActCantidad.ParamByName('fecha').AsDate := Fecha;
  IBQActCantidad.Open;
  Result := IBQActCantidad.FieldValues['CANT'];
end;

procedure TFEveFlushing.BDBGSimpleDblClick(Sender: TObject);
begin
  //inherited;
  if BDBGSimple.SelectedIndex = BDBGSimple.ColumnByField('I3').Index then
  begin
    DatosEmbriones(IBDSSimple.FieldValues['ID_ANIMAL'],IBDSSimple.FieldValues['I1'],IBDSSimple.FieldValues['FECHA']);
    IBDSSimple.Edit;
    IBDSSimple.FieldValues['I2'] := ActCantEmbriones(IBDSSimple.FieldValues['ID_ANIMAL'],IBDSSimple.FieldValues['FECHA']);
    if (IBDSSimple.FieldValues['VUNO1'] = 'S') then
      IBDSSimpleVUNO1.Value := 'N';
    BDBGSimple.Repaint;
  end;
end;

procedure TFEveFlushing.BDBGSimpleDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bitmap : TBitmap;
  CheckBoxRectangle : TRect;
  val : integer;
  i : integer;
Const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  inherited;
  if Column.FieldName = 'VUNO1' then
  begin
    if VarType(Column.Field.Value) = varString then
    begin
      BDBGSimple.Canvas.FillRect(Rect);
      CheckBoxRectangle.Left := Rect.Left + 15;
      CheckBoxRectangle.Right := Rect.Right - 15;
      CheckBoxRectangle.Top := Rect.Top + 15;
      CheckBoxRectangle.Bottom := Rect.Bottom - 15;
      if (Column.Field.Value = 'N') then
          DrawFrameControl(BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false])
        else
          DrawFrameControl(BDBGSimple.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true]);
    end;
  end;
  if Column.FieldName = 'I3' then
  begin
    bitmap := TBitmap.Create;
    if IBDSSimple.FieldByName('I2').AsInteger = 0 then
      ILEmbriones.GetBitmap(0,bitmap)
    else
      ILEmbriones.GetBitmap(1,bitmap);
    BDBGSimple.Canvas.StretchDraw(Rect,bitmap);
  end;
  for i := 0 to BDBGSimple.RowCount-1 do
    BDBGSimple.RowHeights[i] := 46;
end;

procedure TFEveFlushing.IBQCentrosTransplanteAfterPost(DataSet: TDataSet);
var
  con : integer;
begin
  con := 0;
  while (not(DataSet.Eof) and (con < 21)) do begin
    DataSet.Next;
    inc(con);
  end;
end;

procedure TFEveFlushing.EAPrecioChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EAPrecio.Text,precio) then
    EAPrecio.Text := '0';
end;

procedure TFEveFlushing.ATerminarExecute(Sender: TObject);
var
  TodosCargados : Boolean;
  cant, cant_receptoras : Integer;
  F : TFEveTransferenciaEmbrionaria;
begin
  if modoEve = meMasivo then
  begin
    IBDSSimple.First;
    TodosCargados := true;
    while not IBDSSimple.Eof do
      if (IBDSSimple.FieldValues['I2'] > 0) or (IBDSSimple.FieldValues['VUNO1'] = 'S') or
        ((IBDSSimple.FieldValues['I2'] = 0) and ((IBDSSimple.FieldValues['I5'] > 0) or (IBDSSimple.FieldValues['I6'] > 0))) then
        IBDSSimple.Next
      else
      begin
        TodosCargados := false;
        break;
      end;
  end
  else
  begin
    cant := ActCantEmbriones(IDAnimal,DTPAFechaColeccion.Date);
    TodosCargados := (cant > 0) or CBSinEmbriones.Checked or ((cant = 0) and ((sin_fertilizar > 0) or (degenerados > 0)));
  end;
  if TodosCargados then
  begin
    inherited;
    IBQVerificarTransferencia.Close;
    IBQVerificarTransferencia.Open;
    cant_receptoras := IBQVerificarTransferencia.FieldByName('cant').AsInteger;
    if cant_receptoras > 0 then
      if MostrarMensaje(tmConsulta,'Se cargaron embriones frescos en las receptoras seleccionadas. Desea cargar la transferencia embrionaria de las mismas? .Si no carga la transferencia embrionaria perdera la relación entre los embriones y las madres receptoras seleccionadas') = mrYes then
      begin
        F := TFEveTransferenciaEmbrionaria.Create(self);
        F.ConManga := cant_receptoras > 1;
        if cant_receptoras > 1 then
          F.ModoEve := meMasivo
        else
        begin
          IBQSelReceptora.Close;
          IBQSelReceptora.Open;
          F.IDAnimal := IBQSelReceptora.FieldValues['ID_ANIMAL'];
          F.ModoEve := meIndividual;
        end;
        F.DTPAFecha.Date := DTPAFechaColeccion.Date;
        F.ShowModal;
        F.Destroy;
      end;
  end
  else
    MostrarMensaje(tmError,'Hay animales a los que no se le cargaron embriones');
end;

procedure TFEveFlushing.DatosEmbriones(Madre, Responsable : Integer; Fecha : TDate);
var
  F : TFDatosEmbriones;
begin
  F := TFDatosEmbriones.Create(self,Responsable,Fecha);
  F.Madre := Madre;
  F.ModoColeccion := mcInterno;

  IBQExisteDatos.Close;
  IBQExisteDatos.ParamByName('id_madre').AsInteger := madre;
  IBQExisteDatos.Open;
{
  if (IBQExisteDatos.IsEmpty) then
    F.TipoDeDato := tddTodo
  else
    F.TipoDeDato := tddEditar;
}
  if (ModoEve = meMasivo) then
    F.Masivo := true
  else
    F.Masivo := false;

  if F.ObtenerDatosIA then
    F.ShowModal
  else
    MostrarMensaje(tmError,'No se registraron servicios para ese animal en los ultimos 30 dias');
  F.Destroy;
end;

procedure TFEveFlushing.BBCargarEmbrionesClick(Sender: TObject);
var
  cant : Integer;
begin
  inherited;
  DatosEmbriones(IDAnimal,DBLCBAResponsable.KeyValue,DTPAFechaColeccion.Date);
  cant := ActCantEmbriones(IDAnimal,DTPAFechaColeccion.Date);
  if cant > 0 then EACant.Text := IntToStr(cant)
  else EACant.Clear;
  LCantEmbrionesValue.Caption := Traducir('Cant. Embriones: ')+IntToStr(cant+sin_fertilizar+degenerados);
end;

procedure TFEveFlushing.PCBasicoChange(Sender: TObject);
var
  cant : Integer;
begin
  inherited;
  if modoEve = meIndividual then
  begin
    cant := 0;
    cant := ActCantEmbriones(IDAnimal,DTPAFechaColeccion.Date);
    if cant > 0 then
      EACant.Text := IntToStr(cant)
    else
      EACant.Text := '';
    EACant.EsRequerido := true;
    BBCargarEmbriones.Visible := true;
    LCantEmbrionesValue.Caption := Traducir('Cant. Embriones: ')+IntToStr(cant);
    LCantEmbrionesValue.Visible := true;
  end
  else
  begin
    EACant.EsRequerido := false;
    BBCargarEmbriones.Visible := false;
    LCantEmbrionesValue.Caption := '0';
    LCantEmbrionesValue.Visible := false;
  end;
  if PCBasico.ActivePage = TSGrilla then
    AcomodarGrilla();
end;

procedure TFEveFlushing.BorrarAux();
begin
    IBQDelEventosAux.Close;
    IBQDelEventosAux.Open;
end;

procedure TFEveFlushing.LSincronizacionClick(Sender: TObject);
var
  F : TFEveSincronizacionCelo;
begin
  inherited;
  try
    F := TFEveSincronizacionCelo.Create(nil);
    F.ConManga := modoEve = meMasivo;
    F.ModoEve := ModoEve;
    F.IDAnimal := IDAnimal;
    BorrarAux();
    F.DTPAFecha.Date := DTPAFechaColeccion.Date;
    F.ShowModal;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveFlushing.LTratamientoClick(Sender: TObject);
var
  F : TFEveTratamiento;
begin
  inherited;
  try
    F := TFEveTratamiento.Create(nil);
    F.ConManga := modoEve = meMasivo;
    F.ModoEve := ModoEve;
    F.DesdeFlushing := true;
    F.CBDiagnosticar.Visible := false;
    BorrarAux();
    F.DBLCBATipo.KeyValue := 6; //Solo tratamientos Hormonales
    F.DBLCBATipoCloseUp(nil); //Para que active las descripciones del tratamiento
    F.IDAnimal := IDAnimal;
    F.DBLCBATipo.Enabled := false;
    F.DTPAFecha.Date := DTPAFechaColeccion.Date;
    F.ShowModal;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveFlushing.LDeteccionClick(Sender: TObject);
var
  F : TFEveDeteccionCelo;
begin
  inherited;
  try
    F := TFEveDeteccionCelo.Create(nil);
    F.ConManga := modoEve = meMasivo;
    F.ModoEve := ModoEve;
    F.IDAnimal := IDAnimal;
    BorrarAux();
    F.DTPAFecha.Date := DTPAFechaColeccion.Date;
    F.ShowModal;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveFlushing.LInseminacionClick(Sender: TObject);
var
  F : TFEveInseminacionArtificial;
begin
  inherited;
  try
    F := TFEveInseminacionArtificial.Create(nil);
    F.ConManga := modoEve = meMasivo;
    F.ModoEve := ModoEve;
    F.IDAnimal := IDAnimal;
    BorrarAux();
    F.DTPAFechaInicio.Date := DTPAFechaColeccion.Date;
    F.HabilitarMenu(False);
    F.ShowModal;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveFlushing.LabelMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      (Sender as TLabel).Font.Color:= $00606C02;
      (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveFlushing.LabelMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      (Sender as TLabel).Font.Color:= clWindowText;
      (Sender as TLabel).Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveFlushing.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveFlushing.LCentrosClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMCentrosTransplantesExecute(self);
    IBQCentrosTransplante.Close;
    IBQCentrosTransplante.Open;
  end;
end;

procedure TFEveFlushing.cargarDatos(i:integer);
var str:string;
begin
  inherited;
  DBLCBACentrosTrans.KeyValue:=0;
  DBLCBAResponsable.KeyValue:=0;
  EAPrecio.Text:='0';
  EACant.Text:='0';

  //MSimple.IBQDisponibles.Locate('ID_ANIMAL',IBDSSimple.FieldByName('ID_ANIMAL').Value,[]);
  IBDSSimple.FieldByName('ID_SENASA').Value :=MSimple.IBQDisponibles.FieldValues['ID_SENASA'];
  IBDSSimple.FieldByName('ID_HBA').Value :=MSimple.IBQDisponibles.FieldValues['ID_HBA'];
  IBDSSimple.FieldByName('NOMBRE').Value :=MSimple.IBQDisponibles.FieldValues['NOMBRE'];

  IBDSSimple.FieldByName('I2').AsInteger:=0;
  IBDSSimple.FieldByName('I3').AsInteger:=0;//para el icono
  str:=getDato('responsable',anim[i]);
  IBDSSimple.FieldByName('I1').AsInteger:=DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',str,'ID_EMPLEADO');
  IBDSSimple.FieldByName('V1').AsString:=str;
  str:=getDato('centro',anim[i]);
  DBLCBACentrosTrans.ListSource.DataSet.Close;
  DBLCBACentrosTrans.ListSource.DataSet.Open;
  if DBLCBACentrosTrans.ListSource.DataSet.Lookup('NOMBRE',str,'ID_CENTRO_TRANSPLANTE')<>null then
    begin
    IBDSSimple.FieldByName('I4').AsInteger:=DBLCBACentrosTrans.ListSource.DataSet.Lookup('NOMBRE',str,'ID_CENTRO_TRANSPLANTE');
    IBDSSimple.FieldByName('V4').AsString:=str;
    end
  else
    begin
    IBDSSimple.FieldByName('I4').AsInteger:=DBLCBACentrosTrans.ListSource.DataSet.Lookup('NOMBRE','NO DEFINIDO','ID_CENTRO_TRANSPLANTE');
    IBDSSimple.FieldByName('V4').AsString:='NO DEFINIDO';
    end;

  IBDSSimple.FieldByName('F1').AsFloat:=strtofloat(getDato('precio',anim[i]));
  //IBDSSimple.FieldByName('VUNO1').Value :=

  AcomodarGrilla;
end;

procedure TFEveFlushing.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda
end;

procedure TFEveFlushing.DTPAFechaColeccionChange(Sender: TObject);
begin
  inherited;
  if CompareDate(DTPAFechaColeccion.Date,Date()) = GreaterThanValue then
    DTPAFechaColeccion.Date := Date();
end;

procedure TFEveFlushing.FormShow(Sender: TObject);
begin
  inherited;
  if modoEve = meIndividual then
  begin
    EACant.EsRequerido := true;
    BBCargarEmbriones.Visible := true;
    LCantEmbrionesValue.Caption := Traducir('Cant. Embriones: ')+'0';
    LCantEmbrionesValue.Visible := true;
    ICargarEmbriones.Visible := false;
    LCargarEmbriones.Visible := false;
  end
  else
  begin
      EACant.EsRequerido := false;
      BBCargarEmbriones.Visible := false;
      LCantEmbrionesValue.Caption := '0';
      LCantEmbrionesValue.Visible := false;
      ICargarEmbriones.Visible := false;
      LCargarEmbriones.Visible := false;
  end;
  DBLCBAResponsable.AsignarValorDefecto;
  DBLCBACentrosTrans.AsignarValorDefecto;
end;

procedure TFEveFlushing.DBLCBACloseUp(Sender: TObject);
begin
  inherited;
  BBCargarEmbriones.Enabled := DBLCBAResponsable.PuedeGrabar and DBLCBACentrosTrans.PuedeGrabar;

  if (modoEve = meIndividual) then
  begin
    ICargarEmbriones.Visible := true;
    LCargarEmbriones.Visible := true;
  end;
end;

procedure TFEveFlushing.HabilitarMenu(Habilitado : Boolean);
begin
  LSincronizacion.Enabled := Habilitado;
  LTratamiento.Enabled := Habilitado;
  LDeteccion.Enabled := Habilitado;
  LInseminacion.Enabled := Habilitado;  
end;

procedure TFEveFlushing.AcomodarGrilla;
var
  i : integer;
begin
  BDBGSimple.Columns[0].Width := 53;
  BDBGSimple.Columns[1].Width := 79;
  BDBGSimple.Columns[2].Width := 195;
  BDBGSimple.Columns[3].Width := 64;
  BDBGSimple.Columns[4].Width := 72;
  BDBGSimple.Columns[5].Width := 77;
  BDBGSimple.Columns[6].Width := 67;
  BDBGSimple.Columns[7].Width := 61;
  BDBGSimple.Columns[8].Width := 70;
  BDBGSimple.Columns[9].Width := 64;
  BDBGSimple.Columns[10].Width := 46;
  BDBGSimple.Columns[11].Width := 147;
  BDBGSimple.Columns[12].Width := 82;
  BDBGSimple.Columns[13].Width := 140;
end;

procedure TFEveFlushing.ASacarAnimalExecute(Sender: TObject);
begin
  inherited;
  PCBasicoChange(nil);
end;

procedure TFEveFlushing.BBXlsImportClick(Sender: TObject);
begin
  inherited;
  AcomodarGrilla;
end;

procedure TFEveFlushing.continuarGrilla;
begin
  inherited;
  AcomodarGrilla;
end;

procedure TFEveFlushing.EASinFertilizarChange(Sender: TObject);
begin
  inherited;
  if not TryStrToInt(EASinFertilizar.Text,sin_fertilizar) then
    EASinFertilizar.Text := '0';
end;

procedure TFEveFlushing.EADegeneradosChange(Sender: TObject);
begin
  inherited;
  if not TryStrToInt(EADegenerados.Text,degenerados) then
    EADegenerados.Text := '0';
end;

procedure TFEveFlushing.IBDSSimpleCalcFields(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.FieldValues['I2'] <> null) and (DataSet.FieldValues['I5'] <> null) and (DataSet.FieldValues['I6'] <> null) then
    IBDSSimpleTotal.Value := DataSet.FieldValues['I2']+DataSet.FieldValues['I5']+DataSet.FieldValues['I6'];
end;

procedure TFEveFlushing.BDBGSimpleCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'VUNO1' then
  begin
    Column.Field.DataSet.Edit;
    if(Column.Field.AsString = 'S')then
      Column.Field.AsString := 'N'
    else
    begin
      Column.Field.AsString := 'S';
      IBDSSimple.FieldValues['I2'] := 0;
      IBDSSimple.FieldValues['I5'] := 0;
      IBDSSimple.FieldValues['I6'] := 0;
    end;
    Column.Field.DataSet.Post;
  end;
end;

procedure TFEveFlushing.CBSinEmbrionesClick(Sender: TObject);
begin
  inherited;
  if CBSinEmbriones.Checked then
  begin
    sin_fertilizar := 0;
    degenerados := 0;
    EASinFertilizar.Text := '0';
    EADegenerados.Text := '0';
    if modoEve = meIndividual then
      EACant.Text := '0'
    else
      EACant.Text := '';
  end;
end;

end.

