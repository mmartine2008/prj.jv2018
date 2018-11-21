unit UEveSuplementacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, EditAuto, WinXP, DataExport, UEveDiagnosticoEnfermedad, DataToXLS,
  DateUtils, Types, UClassType, ImgList, PngImageList, JvExControls,
  JvLabel, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF, BaseGrid, AdvGrid,
  JvExStdCtrls, JvEdit, QuickRpt, QRCtrls, JvComponentBase, JvBalloonHint,
  xmldom, XMLIntf, msxmldom, XMLDoc, Menus ;

type
  TRegCat = record
    Peso : Double;
    Cant : Integer;
    Categ : String;
    IdCateg : Integer;
  end;
  
  TArrPesoCat = Array of TRegCat;

  TRegAlimentos = record
    Nombre : String;
    PorcUsado : Double;
    PorcMS : Double;
    PrecioPorTon : Double;
    PrecioPorKg : Double;
    KgTalCual : Double;
    KgMs : Double;
    Cantidad : Double;
    id_alimento : Integer;
  end;

  TArrAlimentos = Array of TRegAlimentos;

  TFEveSuplementacion = class(TFEveSimple)
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleD1: TDateField;
    IBDSSimpleI3: TIntegerField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleF3: TFloatField;
    IBDSSimpleF1: TFloatField;
    IBDSSimpleF2: TFloatField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleV2: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    GroupBox1: TGroupBox;
    DTPAFechaIni: TDateTimePickerAuto;
    Label1: TLabel;
    DTPAFechaFin: TDateTimePickerAuto;
    Label2: TLabel;
    Label3: TLabel;
    EACantDias: TEditAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LResponsable: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    LSuplementacion: TLabel;
    DBLCBATipoSuplementacion: TDBLookupComboBoxAuto;
    IBDSSimpleF4: TFloatField;
    IBQAuxPorcMS: TIBQuery;
    IBQCantCategoria: TIBQuery;
    GBCategorias: TGroupBox;
    Label15: TLabel;
    Label13: TLabel;
    IBQRaciones: TIBQuery;
    DSRaciones: TDataSource;
    IBQSuplementosRac: TIBQuery;
    IBQPesoPromCateg: TIBQuery;
    LCantAnimales: TLabel;
    LAnimales: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LPrecioPorAnimal: TLabel;
    LPorcMS: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    SG1: TAdvStringGrid;
    EAPorcentaje: TJvEdit;
    EARacion: TJvEdit;
    EARacion1: TJvEdit;
    IBQInsertIndAux: TIBQuery;
    Shape3: TShape;
    IBQSPMovimientoAlimentacion: TIBQuery;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    SBCategorias: TScrollBox;
    IBQueryfecha: TIBQuery;
    IBQuerying: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure IBDSSimpleSetText(Sender: TField; const Text: String);
    procedure DTPAFechaFinChange(Sender: TObject);
    procedure EACantDiasChange(Sender: TObject);
    procedure DTPAFechaIniChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LSuplementacionClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure CapturarEvento(Sender : TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure DBLCBATipoSuplementacionCloseUp(Sender: TObject);
    procedure EACategoriasChange(Sender: TObject);
    procedure EAPorcentaje1Change(Sender: TObject);
    procedure IBQRacionesAfterOpen(DataSet: TDataSet);
    procedure EARacion11Change(Sender: TObject);
    procedure EARacion12Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EAPorcentajeMouseEnter(Sender: TObject);
    procedure EAPorcentajeMouseLeave(Sender: TObject);
    procedure EARacionMouseLeave(Sender: TObject);
    procedure EARacionMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure EARacion1MouseLeave(Sender: TObject);
    procedure EARacion1MouseEnter(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    CantDias : Integer;
    CantRacion, CantRacion1 ,CantRaciong : Double;
    CostoUnitario : Double;
    CantAnimales : Integer;
    PorcMS , PorcMTC: Double;
    PrecioTotal : Double;
    Porcentaje : Double;
    PesosCat : TArrPesoCat;
    PesoPromedioTotal : Double;
    AlimentosRacion : TArrAlimentos;

    KgsTotal, KgMSTotal, CostoTotal : Double;

    procedure CalcularCostoTotal;
    procedure CalcularCostoTotal1(sender : TObject);
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    procedure CargarDatosGrilla; override;
    procedure CargarParametrosMasivo; override;
    procedure LoadSQLStringList; override;
    procedure cargarDatos(i:integer); override;
    procedure ArmarCategorias;
    procedure CalcularPromPeso;
    function PesoPromedioCategoria(Categoria : Integer) : Integer;
    procedure ArmarGrillaAlimentacion;
    procedure CalcularDatosAlimento;
    procedure CalcularProporcMateria;
    procedure CargarMovimiento;
    procedure ArmarReporteMixer;
  public
    { Public declarations }
  end;

var
  FEveSuplementacion: TFEveSuplementacion;

implementation

uses
  UPrincipal, UDMSoftvet, UMensajeHuella, UABMEmpleados, UABMSuplementacion, UImportacion, UTraduccion, URacion,
  UEveMovimientosAlimentacion, URepInfoMixerPreview, UCartel,
  UEveUniversal;

{$R *.dfm}

procedure TFEveSuplementacion.FormCreate(Sender: TObject);
begin
  inherited;
  PesoPromedioTotal := 0;
  MSimple.SQLBasico := 'SELECT id_rp, id_senasa, id_animal, id_hba, id_pc, id_otro, id_ie, fecha_nacimiento, nombre, apodo FROM VIS_SUPLEMENTACION';
  MSimple.PasarParametros(0,0);
  DTPAFechaIni.Date := Date();
  DTPAFechaFin.Date := Date();
  CantDias := 0;
  CostoTotal := 0;
  CostoUnitario := 0;
  CantRacion := 0;
  CantRacion1 := 0;
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  IBQRaciones.First;
  {if IBQRaciones.IsEmpty then
    LSuplementacion.Caption := 'AGREGAR RACION:';}  

  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  CantAnimales := 0;
  if ModoEve = meIndividual then
    CantAnimales:= 1;
  PorcMS := 0;
end;

procedure TFEveSuplementacion.CargarDatosGrilla;
var
  val_i : integer;
  val_d : double;
begin
  IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
  IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
  IBDSSimple.FieldByName('ID_SENASA').Value :=MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
  RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.Text]);
  RealizarCambio(DTPAFechaIni,[IBDSSimple.FieldByName('FECHA')],[DTPAFechaIni.Date]);
  RealizarCambio(DTPAFechaFin,[IBDSSimple.FieldByName('D1')],[DTPAFechaFin.Date]);

  val_i := 0;
//  val_i:=
 // showmessage(datetostr(DTPAFechaini.Date));
  TryStrToInt(EACantDias.Text,val_i);
  RealizarCambio(EACantDias,[IBDSSimple.FieldByName('I3')],[val_i]);
  RealizarCambio(DTPAFechaIni,[IBDSSimple.FieldByName('FECHA')],[DTPAFechaIni.Date]);
  RealizarCambio(DBLCBATipoSuplementacion,[IBDSSimple.FieldByName('I1'),IBDSSimple.FieldByName('V1'),IBDSSimple.FieldByName('F4')],[DBLCBATipoSuplementacion.KeyValue,DBLCBATipoSuplementacion.Text,PorcMS]);
  RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('V2')],[DBLCBAResponsable.KeyValue,DBLCBAResponsable.Text]);
  val_d := 0;
  TryStrToFloat(EARacion.Text,val_d);
  RealizarCambio(EARAcion,[IBDSSimple.FieldByName('F3')],[val_d]);
  {val_d := 0;
  TryStrToFloat(EACostoUnitario.Text,val_d);
  RealizarCambio(EACostoUnitario,[IBDSSimple.FieldByName('F1')],[val_d]);
  IBDSSimple.FieldValues['F2'] := IBDSSimple.FieldByName('F1').Value*(IBDSSimple.FieldByName('F3').Value*100/PorcMS)*IBDSSimple.FieldByName('I3').Value; }
end;
                                                                        
procedure TFEveSuplementacion.CargarParametrosRN;
begin
  IBQSPRN.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  if ModoEve = meIndividual then
  begin
    IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
    IBQSPRN.ParamByName('fecha').AsDate := DTPAFechaIni.Date;
  end
  else
  begin
    IBQSPRN.ParamByName('animal').AsInteger := IBDSSimple.FieldValues['id_animal'];
    IBQSPRN.ParamByName('fecha').AsDate := IBDSSimple.FieldValues['fecha'];
  end;
end;

procedure TFEveSuplementacion.CargarParametrosSP;

begin
  IBQSPEventoInd.ParamByName('fecha_ini').AsDate := DTPAFechaIni.Date;
  IBQSPEventoInd.ParamByName('fecha_fin').AsDate := DTPAFechaFin.Date;
  IBQSPEventoInd.ParamByName('animal').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('observacion').AsString := MAObservacion.Text;
  IBQSPEventoInd.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('responsable').AsInteger := DBLCBAResponsable.KeyValue;
  IBQSPEventoInd.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('log_fecha_modificado').AsDate := Date();
  IBQSPEventoInd.ParamByName('id_grupo').Value := null;
  IBQSPEventoInd.ParamByName('disparador').Value := null;
  IBQSPEventoInd.ParamByName('cant_dias').AsInteger := StrToInt(EACantDias.Text);
  IBQSPEventoInd.ParamByName('tipo_suplementacion').AsInteger := DBLCBATipoSuplementacion.KeyValue;
  IBQSPEventoInd.ParamByName('cant_racion').AsFloat := CostoTotal;
  IBQSPEventoInd.ParamByName('costo_unitario').AsFloat := CostoUnitario;
  IBQSPEventoInd.ParamByName('costo_total').AsFloat := CostoTotal;
end;

procedure TFEveSuplementacion.CargarParametrosMasivo();

begin
  IBQSPEventoInd.ParamByName('fecha_ini').AsDate := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('fecha_fin').AsDate := IBDSSimple.FieldValues['D1'];
  IBQSPEventoInd.ParamByName('animal').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('observacion').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('establecimiento').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('responsable').Value := IBDSSimple.FieldValues['RESPONSABLE'];
  IBQSPEventoInd.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('log_fecha_modificado').AsDate := Date();
  IBQSPEventoInd.ParamByName('id_grupo').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;
  IBQSPEventoInd.ParamByName('disparador').Value := null;
  IBQSPEventoInd.ParamByName('cant_dias').Value := IBDSSimple.FieldValues['I3'];
  IBQSPEventoInd.ParamByName('tipo_suplementacion').Value := IBDSSimple.FieldValues['I1'];
  IBQSPEventoInd.ParamByName('cant_racion').Value := IBDSSimple.FieldValues['F3'];
  IBQSPEventoInd.ParamByName('costo_unitario').Value := IBDSSimple.FieldValues['F1'];
  IBQSPEventoInd.ParamByName('costo_total').Value := IBDSSimple.FieldValues['F2'];
end;

procedure TFEveSuplementacion.LoadSQLStringList;
begin
  SQLStringList.AddObject('V2',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('V1',TObject(DMSoftvet.DSTipoSuplementacion));
end;

procedure TFEveSuplementacion.IBDSSimpleSetText(Sender: TField;
  const Text: String);
var
  PickPos, val_i : Integer;
  Fecha : TDateTime;
  val_d : double;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    if Sender.FieldName = 'D1' then   //Fecha de Fin
    begin
      if TryStrToDate(Text,Fecha) then
      begin
        if CompareDate(Fecha,IBDSSimple.FieldValues['FECHA']) = GreaterThanValue then
        begin
            Sender.Value := Fecha;
            IBDSSimple.FieldValues['I3'] := DaysBetween(Fecha,IBDSSimple.FieldValues['FECHA']);
            IBDSSimpleF2.Value := (IBDSSimple.FieldValues['F3']*100/IBDSSimple.FieldValues['F4'])*IBDSSimple.FieldValues['F1']*IBDSSimple.FieldValues['I3'];
        end
        else
          MostrarMensaje(tmError,'La fecha de fin no puede ser menor a la de inicio');
      end
      else
        MostrarMensaje(tmError,'El formato de la fecha no es valido');
    end;
    if Sender.FieldName = 'I3' then   //Cant Dias
    begin
      if TryStrToInt(Text,val_i) then
      begin
        Sender.Value := val_i;
        IBDSSimpleF2.Value := (IBDSSimple.FieldValues['F3']*100/IBDSSimple.FieldValues['F4'])*IBDSSimple.FieldValues['F1']*val_i;
        IBDSSimple.FieldValues['D1'] := IncDay(IBDSSimple.FieldValues['FECHA'],val_i);
      end
      else
        MostrarMensaje(tmError,'No es una cantidad valida');
    end;
    if Sender.FieldName = 'F3' then  //Cant Racion
        begin
      if TryStrToFloat(Text,val_d) then
      begin
        Sender.Value := val_d;
        IBDSSimpleF2.Value := (val_d*100/IBDSSimple.FieldValues['F4'])*IBDSSimple.FieldValues['F1']*IBDSSimple.FieldValues['I3'];
      end
      else
        MostrarMensaje(tmError,'No es una cantidad valida');
    end;
    if Sender.FieldName = 'V1' then  //Tipos de Suplementacion
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select sinonimo as valor from COD_TIPOS_SUPLEMENTACIONES where ((sinonimo like '''+UpperCase(Text)+'''||''%''))or (CODIGO like '''+UpperCase(Text)+'%'')');
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
        PickPos := BDBGSimple.ColumnByField('V1').PickList.IndexOf(BDBGSimple.ColumnByField('V1').Field.AsString);
        IBDSSimpleI1.AsInteger := TClassType(BDBGSimple.ColumnByField('V1').PickList.Objects[PickPos]).getValue;
        IBQAuxPorcMS.Close;
        IBQAuxPorcMS.ParamByName('id').AsInteger := IBDSSimpleI1.AsInteger;
        IBQAuxPorcMS.Open;
        IBDSSimpleF4.AsFloat := IBQAuxPorcMS.FieldValues['PORC_MS'];
        IBDSSimpleF2.Value := (IBDSSimple.FieldValues['F3']*100/IBDSSimple.FieldValues['F4'])*IBDSSimple.FieldValues['F1']*IBDSSimple.FieldValues['I3'];
      end;
    end;
    if (Sender.FieldName = 'V2') then  //Responsable
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
      IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQValidaciones.Active := true;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
        PickPos := BDBGSimple.ColumnByField('V2').PickList.IndexOf(BDBGSimple.ColumnByField('V2').Field.AsString);
        IBDSSimple.FieldByName('RESPONSABLE').Value :=  TClassType(BDBGSimple.ColumnByField('V2').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if Sender.FieldName = 'F1' then //Costo Unitario
    begin
      if TryStrToFloat(Text,val_d) then
      begin
        Sender.Value := val_d;
        IBDSSimpleF2.Value := (IBDSSimple.FieldValues['F3']*100/IBDSSimple.FieldValues['F4'])*IBDSSimple.FieldValues['I3']*val_d;
      end
      else
        MostrarMensaje(tmError,'No es una cantidad valida');
    end;
  end;
end;

procedure TFEveSuplementacion.DTPAFechaFinChange(Sender: TObject);
begin
  inherited;
  CantDias := DaysBetween(DTPAFechaFin.Date,DTPAFechaIni.Date);
  EACantDias.Text := IntToStr(CantDias);
  CalcularCostoTotal();
end;

procedure TFEveSuplementacion.EACantDiasChange(Sender: TObject);
var
  valor_i : integer;
begin
  inherited;
  if TryStrToInt(EACantDias.Text,valor_i) then
  begin
   
    CantDias := valor_i;
    DTPAFechaFin.Date := IncDay(DTPAFechaIni.Date,valor_i);
    CalcularCostoTotal();
  end
  else
    EACantDias.Text := '0';
end;

procedure TFEveSuplementacion.DTPAFechaIniChange(Sender: TObject);
begin
  inherited;
  // proximas 2 lineas copiadas de fecha fin change originalmente no estaban
  CantDias := DaysBetween(DTPAFechaFin.Date,DTPAFechaIni.Date);
  EACantDias.Text := IntToStr(CantDias);
 // sHOWMESSAGE ('CANTIDAS');
 // SHOWMESSAGE(EACantDias.Text);
  /// hasta aqui....
  if CantDias > 0 then
  begin
    DTPAFechaFin.Date := IncDay(DTPAFechaIni.Date,CantDias);
  end;
end;

procedure TFEveSuplementacion.CalcularCostoTotal();
begin
end;

procedure TFEveSuplementacion.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveSuplementacion.LSuplementacionClick(Sender: TObject);
var
  F : TFRacion;
begin
  inherited;
  if (FPrincipal.RolUsuarioActual <> 'ADMINISTRADOR') then
  begin
      MostrarMensaje(tmError,'No tiene permisos para realizar esta operacion. Debe ser Administrador.');
  end;

  F := TFRacion.Create(self);
//-- Selecciona la racion actual
  F.seleccionarRacion(IBQRaciones.FieldValues['id_racion']);
  F.ShowModal;
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  if  not IBQRaciones.IsEmpty then
  begin
    //LSuplementacion.Caption := 'SELECCIONE RACION:';
    IBQRaciones.Locate('id_racion',F.ID_RACION,[]);
    DBLCBATipoSuplementacion.KeyValue := IBQRaciones.FieldValues['id_racion'];
    DBLCBATipoSuplementacionCloseUp(DBLCBATipoSuplementacion);
  end;
  F.Destroy;
end;

procedure TFEveSuplementacion.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    LResponsable.Font.Color:= $00606C02;
    LResponsable.Font.Style:= [fsUnderline];
  end;
end;

procedure TFEveSuplementacion.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    LResponsable.Font.Color:= clWindowText;
    LResponsable.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveSuplementacion.cargarDatos(i:integer);
var val_i:integer;
    val_d:double;
begin
  EACantDias.Text:='0';
  EARacion.Text:='0';
  DBLCBAResponsable.KeyValue:=0;
  inherited;
  IBDSSimple.FieldByName('FECHA').AsDateTime:=strtodatetime(getDato('fecha inicio',anim[i]));
  IBDSSimple.FieldByName('D1').AsDateTime:=strtodatetime(getDato('fecha fin',anim[i]));
  val_i := 0;
  TryStrToInt(getDato('cant. días',anim[i]),val_i);
  IBDSSimple.FieldByName('I3').asInteger:=val_i;
  IBDSSimple.FieldByName('V1').AsString:=getDato('tipo de suplementación',anim[i]);
  IBDSSimple.FieldByName('I1').AsInteger:=DBLCBATipoSuplementacion.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V1').AsString,'ID_TIPO_SUPLEMENTACION');
  IBDSSimple.FieldByName('V2').AsString:=getDato('responsable',anim[i]);
  IBDSSimple.FieldByName('RESPONSABLE').AsInteger:=DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('V2').AsString,'ID_EMPLEADO');
  val_d := 0;
  TryStrToFloat(getDato('cant. ración',anim[i]),val_d);
  IBDSSimple.FieldByName('F3').AsFloat:=val_d;
  IBDSSimple.FieldByName('F1').AsFloat:=strtofloat(getDato('costo u',anim[i]));
  if getDato('costo t',anim[i])='' then
    IBDSSimple.FieldValues['F2'] := IBDSSimple.FieldByName('F1').Value*IBDSSimple.FieldByName('F3').Value*IBDSSimple.FieldByName('I3').Value
  else
    IBDSSimple.FieldValues['F2'] := getDato('costo t',anim[i]);
end;

procedure TFEveSuplementacion.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  //hereda de evesimple
end;

procedure TFEveSuplementacion.CapturarEvento(Sender : TObject);
begin
  GetEvent(DTPAFechaIni);
  GetEvent(DTPAFechaFin);
  GetEvent(EACantDias);
  GetEvent(EARacion);
  GetEvent(EARacion1);
end;

procedure TFEveSuplementacion.PCBasicoChange(Sender: TObject);
begin
  inherited;
  if PCBasico.ActivePage = TSDatos then
  begin
    MSimple.IBQSeleccionados.Last;
    MSimple.IBQSeleccionados.First;
    CantAnimales := MSimple.IBQSeleccionados.RecordCount;
    LAnimales.Caption := IntToStr(CantAnimales);
    ArmarCategorias;
  end;
end;

function TFEveSuplementacion.PesoPromedioCategoria(Categoria : Integer) : Integer;
begin
  IBQPesoPromCateg.Close;
  IBQPesoPromCateg.ParamByName('categoria').AsInteger := Categoria;
  IBQPesoPromCateg.Open;
  if IBQPesoPromCateg.FieldValues['prom'] <> null then
    Result := IBQPesoPromCateg.FieldValues['prom']
  else
    Result := 0;
end;

procedure TFEveSuplementacion.ArmarCategorias;
var
  I : Integer;
  L, L1 : TLabel;
  E : TEditAuto;
  NextLeft, NextTop : Integer;
begin
  IBQCantCategoria.Close;
  IBQCantCategoria.Open;
  IBQCantCategoria.First;
  I := 0;
  while not IBQCantCategoria.Eof do
  begin
    SetLength(PesosCat,I+1);
    PesosCat[I].Peso := PesoPromedioCategoria(IBQCantCategoria.FieldByName('categ').AsInteger);
    PesosCat[I].Cant := IBQCantCategoria.FieldByName('cant').AsInteger;
    PesosCat[I].IdCateg := IBQCantCategoria.FieldByName('categ').AsInteger;
    PesosCat[I].Categ := IBQCantCategoria.FieldByName('nombre').AsString;
    Inc(I);
    IBQCantCategoria.Next;
  end;

  NextLeft := 88;
  NextTop := 5;
  for I := 0 to Length(PesosCat)-1 do
  begin
    if PesosCat[I].Cant > 0 then
    begin
      L := TLabel.Create(self);
      L.Parent := SBCategorias;
      L.AutoSize := false;
      L.Transparent := true;
      L.Left := NextLeft;
      L.Top := NextTop;
      L.Width := 80;
      L.Height := 15;
      L.Caption := PesosCat[I].Categ;
      L.BringToFront;

      E := TEditAuto.Create(self);
      E.Parent := SBCategorias;
      E.Left := NextLeft + 85;
      E.Top := NextTop - 4;
      E.Text := FormatFloat('##.##',PesosCat[I].Peso);
      E.Tag := I;
      E.Width := 56;
      E.EsRequerido := true;
      E.OnChange := EACategoriasChange;
      
      L1 := TLabel.Create(self);
      L1.Parent := SBCategorias;
      L1.Transparent := true;
      L1.AutoSize := true;
      L1.Left := E.Left + E.Width + 5;
      L1.Top := NextTop;
      L1.Caption := 'Kg';
      L1.BringToFront;

      NextTop := NextTop + 30;
    end;
  end;
end;

procedure TFEveSuplementacion.EACategoriasChange(Sender: TObject);
var
  valor_d : double;
begin
  inherited;
  if TryStrToFloat((Sender as TEditAuto).Text,valor_d) then
    PesosCat[(Sender as TEditAuto).Tag].Peso := valor_d
  else
    (Sender as TEditAuto).Text := '0';
  CalcularCostoTotal1(sender);
end;

procedure TFEveSuplementacion.CalcularPromPeso;
var
  I, C : Integer;
begin
  C := 0;
  PesoPromedioTotal := 0;
  for I := 0 to Length(PesosCat)-1 do
    if PesosCat[I].Cant > 0 then
    begin
      C := C+1;
      PesoPromedioTotal := PesoPromedioTotal + PesosCat[I].Peso;
    end;
  if C > 0 then
    PesoPromedioTotal := PesoPromedioTotal / C;
end;

procedure TFEveSuplementacion.ArmarGrillaAlimentacion;
var
  I : Integer;
  D : Double;
  T : Double;
begin
  SG1.RowCount := 2;
  SG1.Cells[0,0] := 'Alimento';
  SG1.Cells[2,0] := '% Usado';
  SG1.Cells[3,0] := 'Kg MS';
  SG1.Cells[4,0] := 'Kg Tal Cual';
  SG1.Cells[5,0] := '$';
  SG1.Cells[1,0] := '$/Tn.';
  SG1.CellProperties[0,0].Alignment := taCenter;
  SG1.CellProperties[1,0].Alignment := taCenter;
  SG1.CellProperties[2,0].Alignment := taCenter;
  SG1.CellProperties[3,0].Alignment := taCenter;
  SG1.CellProperties[4,0].Alignment := taCenter;
  SG1.CellProperties[5,0].Alignment := taCenter;
  T := 0;
  for I := 0 to Length(AlimentosRacion)-1 do
  begin
    if I <= 10 then
    begin
    // Se indica que no hay alimentos suficientes
      if (AlimentosRacion[I].Cantidad*1000) < AlimentosRacion[I].KgTalCual then
            SG1.RowColor[i+1] := RGB(255,128,128)
      else
          SG1.RowColor[i+1] := clWhite;

      SG1.Cells[0,I+1] := AlimentosRacion[I].Nombre;
      SG1.Cells[2,I+1] := FormatFloat('#0.##',AlimentosRacion[I].PorcUsado)+' %';
      SG1.Cells[3,I+1] := FormatFloat('#0.##',AlimentosRacion[I].KgMs)+' Kg';
      SG1.Cells[4,I+1] := FormatFloat('#0.##',AlimentosRacion[I].KgTalCual)+' Kg';
      SG1.Cells[5,I+1] := '$ '+FormatFloat('#0.##',AlimentosRacion[I].PrecioPorKg);
      SG1.Cells[1,I+1] := '$ '+FormatFloat('#0.##',AlimentosRacion[I].PrecioPorTon);
      SG1.RowCount := SG1.RowCount + 1;
      SG1.Height := SG1.Height + 27;

      T := T + AlimentosRacion[I].PrecioPorTon;

      SG1.CellProperties[0,I+1].Alignment := taCenter;
      SG1.CellProperties[1,I+1].Alignment := taCenter;
      SG1.CellProperties[2,I+1].Alignment := taCenter;
      SG1.CellProperties[3,I+1].Alignment := taCenter;
      SG1.CellProperties[4,I+1].Alignment := taCenter;
      SG1.CellProperties[5,I+1].Alignment := taCenter;
    end
    else
      break;
  end;

  SG1.CellProperties[0,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[1,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[2,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[3,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[4,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[5,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[0,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[1,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[2,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[3,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[4,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[5,SG1.RowCount-1].FontStyle := [fsBold];

  SG1.Cells[0,SG1.RowCount-1] := 'Total';
  SG1.Cells[3,SG1.RowCount-1] := FormatFloat('##.##',KgMSTotal)+' Kg';
  SG1.Cells[4,SG1.RowCount-1] := FormatFloat('##.##',KgsTotal)+' Kg';
  SG1.Cells[5,SG1.RowCount-1] := '$ '+FormatFloat('##.##',CostoTotal);
  //SG1.Cells[1,SG1.RowCount-1] := '$ '+FormatFloat('##.##',T);

end;

procedure TFEveSuplementacion.DBLCBATipoSuplementacionCloseUp(
  Sender: TObject);
var
  I : Integer;
  Indice : Integer;
begin
  inherited;
  SG1.Clear();

  if DBLCBATipoSuplementacion.KeyValue <> null then
  begin
    EAPorcentaje.Visible := true;
    Label13.Visible := true;
    //Label4.Visible := true;
    //Label14.Visible := true;
    Label5.Visible := true;
    Label6.Visible := true;
    Label7.Visible := true;
    Shape1.Visible := true;
    Shape2.Visible := true;
    Shape3.Visible := true;
    EARacion.Visible := true;
    EARacion1.Visible := true;

    Indice := 0;
    SetLength(AlimentosRacion,Indice);
    IBQSuplementosRac.Close;
    IBQSuplementosRac.ParamByName('racion').Value := DBLCBATipoSuplementacion.KeyValue;
    IBQSuplementosRac.Open;
    IBQSuplementosRac.First;
    I := 0;
    PorcMS := 0;
    while not IBQSuplementosRac.Eof do
    begin
      PorcMS := PorcMS + IBQSuplementosRac.FieldValues['porc_ms'] * IBQSuplementosRac.FieldValues['porcentaje'];
      PrecioTotal := PrecioTotal + (IBQSuplementosRac.FieldValues['precio']*(IBQSuplementosRac.FieldValues['porcentaje']/100));
      SetLength(AlimentosRacion,Indice+1);
      AlimentosRacion[Indice].Nombre := IBQSuplementosRac.FieldValues['nombre'];
      AlimentosRacion[Indice].PorcMS := IBQSuplementosRac.FieldValues['porc_ms'];
      AlimentosRacion[Indice].PorcUsado := IBQSuplementosRac.FieldValues['porcentaje'];
      AlimentosRacion[Indice].PrecioPorTon := IBQSuplementosRac.FieldValues['precio'];
      AlimentosRacion[Indice].Cantidad := IBQSuplementosRac.FieldValues['cantidad'];
      AlimentosRacion[Indice].id_alimento := IBQSuplementosRac.FieldValues['id_tipo_suplementacion'];
      Inc(Indice);
      I := I +1;
      IBQSuplementosRac.Next;
    end;
    if I > 0 then
     PorcMS := 0.01 * PorcMS ;   //tere 1506 deje igual anterior 1606 no permitia segui flecha y ms 8000
    LPorcMS.Caption := FormatFloat('##.##',PorcMS)+' % MS';
    if ( PorcMS > 100.01)  then
       LPorcMS.Color := clRed
    else
       LPorcMS.Color := clBlack;

    CalcularCostoTotal1(nil);
  end;
end;

procedure TFEveSuplementacion.CalcularCostoTotal1(sender : TObject);
var
  I : Integer;
  D : double;
begin
try
  CalcularPromPeso();
// Deshabilito los eventos
  EARacion.OnChange := nil;
  EARacion1.OnChange := nil;
  EAPorcentaje.OnChange := nil;
  CalcularProporcMateria();

// Seteo un solo valor para hacer los calculos
  // Calculo los restantes
  if CantRacion1 <> 0 then
  begin
    CantRaciong :=CantRacion1 ; ///  nva vble, debe mantener cantidad talcual de dieta para calc alimentos
    CantRacion := CantRacion1 * (PorcMS/10000 );                 // 19/10/2016
    Porcentaje := 100*CantRacion /PesoPromedioTotal   ;

  end
  else
  if CantRacion <> 0 then
  begin
     CantRaciong:= CantRacion / (PorcMS/10000 );    // esto tbn fue agregado para reservar valor cdo carga Cant MS
    CantRacion1 := CantRacion / (PorcMS/10000 );                   //19/10/2016
    Porcentaje := 100*CantRacion / PesoPromedioTotal   ;
  end
  else
  if Porcentaje <> 0 then
  begin
    CantRacion := PesoPromedioTotal * Porcentaje/100;
    CantRacion1 := CantRacion / (PorcMS/10000);
    CantRaciong :=CantRacion1;                // aca tbn modifique 19/10/2016
  end;
except
   CantRacion1 := 0.0;
   CantRacion := 0.0;
   Porcentaje := 0.0;
end;
  CostoUnitario := (CantRacion1*PrecioTotal)/1000;

  CalcularDatosAlimento();
  ArmarGrillaAlimentacion();
  SG1.Visible := true;

  if ((CostoTotal > 0) and (KGSTotal > 0) ) then
    D := (CostoTotal * CantRacion1)/KGSTotal;
  LPrecioPorAnimal.Caption := '$ '+FormatFloat('#0.##',D);
  // Formateo los datos
  if sender <> EARacion1 then
    EARacion1.Text := FormatFloat('##.00',CantRacion1);

  if sender <> EARacion then
    EARacion.Text := FormatFloat('##.00',CantRacion);

  if sender <> EAPorcentaje then
    EAPorcentaje.Text := FormatFloat('##.00',Porcentaje);

  EARacion.OnChange := EARacion11Change;
  EARacion1.OnChange := EARacion12Change;
  EAPorcentaje.OnChange := EAPorcentaje1Change;

  {
  if (CantRacion <> 0) and (CantRacion1 <> 0) and (Porcentaje <> 0) then
  begin
    CantRacion1 := 0;
    Porcentaje := 0;
    CantRacion := (PesoPromedioTotal * Porcentaje)/100;
    EARacion.OnChange := nil;
    EARacion.Text := FormatFloat('##.##',CantRacion);
    EARacion.OnChange := EARacion11Change;
    CantRacion1 := 0;
  end;

  if CantRacion = 0 then
  begin
    if Porcentaje = 0 then
    begin
      for I := 0 to Length(AlimentosRacion)-1 do
        CantRacion := CantRacion + (((CantRacion1*(AlimentosRacion[I].PorcUsado/100))*AlimentosRacion[I].PorcMS)/100);
      //CantRacion := CantRacion1 * (PorcMS / 100);
    end
    else
      CantRacion := (PesoPromedioTotal * Porcentaje)/100;
    EARacion.OnChange := nil;
    EARacion.Text := FormatFloat('##.##',CantRacion);
    EARacion.OnChange := EARacion11Change;
  end;
  if Porcentaje = 0 then
  begin
    if PesoPromedioTotal > 0 then
      Porcentaje := (CantRacion * 100)/PesoPromedioTotal
    else
      Porcentaje := 0;
    EAPorcentaje.OnChange := nil;
    EAPorcentaje.Text := FormatFloat('##.##',Porcentaje);
    EAPorcentaje.OnChange := EAPorcentaje1Change;
  end;
  if CantRacion1 = 0 then
  begin
    if CantRacion > 0 then
    begin
      for I := 0 to Length(AlimentosRacion)-1 do
        CantRacion1 := CantRacion1 + (((CantRacion*(AlimentosRacion[I].PorcUsado/100))*100)/AlimentosRacion[I].PorcMS);
      //CantRacion1 := (CantRacion * 100) / PorcMS
    end
    else
      CantRacion1 := 0;
    EARacion1.OnChange := nil;
    EARacion1.Text := FormatFloat('##.##',CantRacion1);
    EARacion1.OnChange := EARacion12Change;
  end;

  CostoUnitario := (CantRacion1*PrecioTotal)/1000;

  CalcularDatosAlimento;
  ArmarGrillaAlimentacion;

  SG1.Visible := true;
}
end;

procedure TFEveSuplementacion.EAPorcentaje1Change(Sender: TObject);
var
  valor_d : double;
begin
  inherited;
  if TryStrToFloat((Sender as TJvEdit).Text,valor_d) then
  begin
    Porcentaje := valor_d;
  end
  else
  begin
    (Sender as TJvEdit).Text := '0';
  end;
  CantRacion := 0;
  CantRacion1 := 0;
  CalcularCostoTotal1(sender);
end;

procedure TFEveSuplementacion.IBQRacionesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQRaciones.Last;
  IBQRaciones.First;
end;

procedure TFEveSuplementacion.EARacion11Change(Sender: TObject);
var
  valor_d : Double;
begin
  inherited;
  if TryStrToFloat((Sender as TJvEdit).Text,valor_d) then
  begin
    CantRacion := valor_d;
  end
  else
  begin
    (Sender as TJvEdit).Text := '0';
  end;
  Shape3.Brush.Color := clWhite;
  Shape1.Brush.Color := $00DBEEDF;
  Shape2.Brush.Color := clWhite;
  Porcentaje := 0;
  CantRacion1 := 0;
  CalcularCostoTotal1(sender);
end;


procedure TFEveSuplementacion.CalcularProporcMateria();
var i:integer;
begin
  PorcMTC := 0.0;
  PorcMS := 0.0;
  for I := 0 to Length(AlimentosRacion)-1 do
  begin
    PorcMTC := PorcMTC +  (AlimentosRacion[I].PorcUsado ) / AlimentosRacion[I].PorcMS;
    PorcMS := PorcMS +  (AlimentosRacion[I].PorcUsado ) * AlimentosRacion[I].PorcMS;
   end;
 if (  PorcMTC > 0) then
      PorcMTC := 1 / PorcMTC
 else
      PorcMTC := 1;

end;

procedure TFEveSuplementacion.CalcularDatosAlimento;
var
  I : Integer;
  F : TFEveMovimientosAlimentacion;
  puedeContinuar : boolean;
begin
  KgsTotal := 0;
  KgMSTotal := 0;
  CostoTotal := 0;
  PorcMTC := 0;
  puedeContinuar := true;

  for I := 0 to Length(AlimentosRacion)-1 do
  begin
   AlimentosRacion[I].KgTalCual := (CantRaciong *(AlimentosRacion[I].PorcUsado / 100) * CantAnimales);
   AlimentosRacion[I].KgMs := (CantRaciong * (AlimentosRacion[I].PorcUsado / 100) * CantAnimales * (AlimentosRacion[I].PorcMS / 100));
  //  AlimentosRacion[I].KgMs := (CantRaciong * (AlimentosRacion[I].PorcUsado / 100)) * CantAnimales;
   //modifique  x por %MS x cada alimento, antes lo calc con %MS de la dieta total
//    AlimenhuelltosRacion[I].KgTalCual := (AlimentosRacion[I].KgMs * 100) / (PorcMS / 100);
    //AlimentosRacion[I].PrecioPorKg := ((AlimentosRacion[I].KgTalCual / 1000) * AlimentosRacion[I].PrecioPorTon);
    // saque divisionx 1000 para que precio sea por kilogramo   y lo puse de nuevo 02/08/2016
    AlimentosRacion[I].PrecioPorKg := ((AlimentosRacion[I].KgTalCual/1000 ) * AlimentosRacion[I].PrecioPorTon);
  //  if (AlimentosRacion[I].Cantidad*1000) < AlimentosRacion[I].KgTalCual then
    if (AlimentosRacion[I].Cantidad) < AlimentosRacion[I].KgTalCual then
    begin
      if MostrarMensaje(tmConsulta,'No hay suficiente '+AlimentosRacion[I].Nombre+'. Desea cargar la compra?') = mrYes then
      begin
        puedeContinuar := false;
        F := TFEveMovimientosAlimentacion.Create(self,1);
        F.desdeEve := true;
        F.alimento := AlimentosRacion[I].id_alimento;
        F.ShowModal;
        AlimentosRacion[I].Cantidad := F.cantResult;
        F.Destroy;
      end;
    end;
    KgMSTotal := KgMSTotal + AlimentosRacion[I].KgMs;
    KgsTotal := KgsTotal + ALimentosRacion[I].KgTalCual;
    CostoTotal := CostoTotal + AlimentosRacion[I].PrecioPorKg;
  end;
   // No deberia hacerse aca el control
//  ATerminar.Enabled := puedeContinuar;
//  jvTerminar.Visible := puedeContinuar;
end;

procedure TFEveSuplementacion.EARacion12Change(Sender: TObject);
var
  valor_d : Double;
begin
  inherited;
  if TryStrToFloat((Sender as TJvEdit).Text,valor_d) then
  begin
    CantRacion1 := valor_d;
    CantRaciong := CantRacion1;
  end
  else
  begin
    (Sender as TJvEdit).Text := '0';
  end;
  Shape3.Brush.Color := clWhite;
  Shape1.Brush.Color := clWhite;
  Shape2.Brush.Color := $00DBEEDF;
  Porcentaje := 0;
  CantRacion := 0;
  CalcularCostoTotal1(sender);
end;

procedure TFEveSuplementacion.FormShow(Sender: TObject);
begin
  inherited;
  // En el inicio se borran los colores
  LPorcMS.Color := clSilver;
  LPrecioPorAnimal.Color := clSilver;
  LAnimales.Color := clSilver;
  
  if ModoEve = meIndividual then
  begin
    try
      IBQInsertIndAux.Close;
      IBQInsertIndAux.ParamByName('animal').AsInteger := IDAnimal;
      IBQInsertIndAux.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
      ArmarCategorias;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

procedure TFEveSuplementacion.EAPorcentajeMouseEnter(Sender: TObject);
begin
  inherited;
  Shape3.Brush.Color := $00DBEEDF;
  Shape1.Brush.Color := clWhite;
  Shape2.Brush.Color := clWhite;
end;

procedure TFEveSuplementacion.EAPorcentajeMouseLeave(Sender: TObject);
begin
  inherited;
  Shape3.Brush.Color := clWhite;
  Shape1.Brush.Color := clWhite;
  Shape2.Brush.Color := clWhite;
end;

procedure TFEveSuplementacion.EARacionMouseLeave(Sender: TObject);
begin
  inherited;
  Shape3.Brush.Color := clWhite;
  Shape1.Brush.Color := clWhite;
  Shape2.Brush.Color := clWhite;
end;

procedure TFEveSuplementacion.EARacionMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Shape3.Brush.Color := clWhite;
  Shape1.Brush.Color := $00DBEEDF;
  Shape2.Brush.Color := clWhite;
end;

procedure TFEveSuplementacion.EARacion1MouseLeave(Sender: TObject);
begin
  inherited;
  Shape3.Brush.Color := clWhite;
  Shape1.Brush.Color := clWhite;
  Shape2.Brush.Color := clWhite;
end;

procedure TFEveSuplementacion.EARacion1MouseEnter(Sender: TObject);
begin
  inherited;
  Shape3.Brush.Color := clWhite;
  Shape1.Brush.Color := clWhite;
  Shape2.Brush.Color := $00DBEEDF;
end;

procedure TFEveSuplementacion.CargarMovimiento;

var

  i : Integer;
//  cdias :integer;
  //d3:real;
  //pp : string; // tdate;
 // ppd ,ppd2 :tdate;
 // pp2 ,pp3,
  pp4: string; // tdatetime;    ////// pp4 debe ser string !!!!!!!! 23/08
 // pp22 :integer;
  ppp:string;
  pp5: tdate;
  pfechai :tdate;

 // dt1,dt2 :Tdatetime;
 // hoy :tdatetime;
//  hoy2:tdate;
  vv ,v2 :variant;
begin
// aca deberia traer la cantidad de dias a descontar
// toma el ultimo registro de alimentacion de ese lote
// o encaso de no existir toma la decha de ultimo ingreso al lote.
// y multiplicar para cada racio i

{
  anterior a modificacion 19/06
  ppp:= DateToStr(DTPAFechaIni.Date);      //aca txt
  IBQueryfecha.ParamByName('diaact').AsDatetime:=now();
  IBQueryfecha.ParamByName('fectran').AsDatetime:=DTPAFechaIni.Date;
  IBQueryfecha.Close;
  IBQueryfecha.Open;
  if (IBQueryfecha.FieldByName('FECHA').Value = null) THEN

    BEGIN
    IBQuerying.ParamByName('dia2').AsDatetime:=now();  // antes tdatetime
    IBQuerying.ParamByName('fect2').AsDatetime:=DTPAFechaIni.Date;  //antes tdatetime
    IBQuerying.Close;
    IBQuerying.Open;                            // aca ibqueryng.fieldByname is null
    vv:=DTPAFechaIni.Date- StrToDate(IBQuerying.FieldByName('FECHA').value);
    END
   ELSE
     /// aca deberia comparar cual es mas reciente si fecha de aimentacion o alta
   /// en caso que anteriormente se haya alimentado en este corral y vuelve
   /// toma ultima alimentacion en lugar de ultimo alta o ingreso....16/06/2017
   /// analizr bien para abarcar T casos.

     if   (DTPAFechaIni.Date > StrToDate(IBQueryfecha.FieldByName('FECHA').value)) THEN
       vv:=  DTPAFechaIni.Date- StrToDate(IBQueryfecha.FieldByName('FECHA').value)
       ELSE
         begin
         SHOWMESSAGE( 'Existe una Alimentacion Posterior.. Intente con una fecha posterior');
         FPrincipal.IBTPrincipal.RollbackRetaining;
         end ;

  v2:= trunc(vv);
  Cantdias:=v2; }

  ppp:= DateToStr(DTPAFechaIni.Date);      //aca txt
  IBQueryfecha.ParamByName('diaact').AsDatetime:=now();
  IBQueryfecha.ParamByName('fectran').AsDatetime:=DTPAFechaIni.Date;
  IBQueryfecha.Close;
  IBQueryfecha.Open;

  IBQuerying.ParamByName('dia2').AsDatetime:=now();  // antes tdatetime
  IBQuerying.ParamByName('fect2').AsDatetime:=DTPAFechaIni.Date;  //antes tdatetime
  IBQuerying.Close;
  IBQuerying.Open;
   //pfechai:= DTPAFechaIni.Date;
  { if  (IBQueryfecha.FieldByName('FECHA').value=null) then
          pfechai:= DTPAFechaIni.Date
          else
           pfechai:=IBQueryfecha.FieldByName('FECHA').value;
   if   ((DTPAFechaIni.Date) <= pfechai ) THEN
     BEGIN
          SHOWMESSAGE( 'Existe una Alimentacion Posterior.. Intente con una fecha posterior');
           FPrincipal.IBTPrincipal.RollbackRetaining;
    END
 ELSE
   BEGIN }
       //  if   ((DTPAFechaIni.Date) <= StrToDate(IBQueryfecha.FieldByName('FECHA').value)) THEN
       //     BEGIN
       //         SHOWMESSAGE( 'Existe una Alimentacion Posterior.. Intente con una fecha posterior');
       //         FPrincipal.IBTPrincipal.RollbackRetaining;
      //     END
      //   ELSE
      //    BEGIN
     IF (IBQueryfecha.FieldByName('FECHA').Value = null) THEN
        BEGIN
         IF (IBQuerying.FieldByName('FECHA').value =NULL ) THEN
         SHOWMESSAGE('ERROR NO EXISTE ALIMENTACION NI MOV DE ANIMALES')
         else
            if    ( DTPAFechaIni.Date >   StrToDate(IBQuerying.FieldByName('FECHA').value)) then
               vv:=DTPAFechaIni.Date- StrToDate(IBQuerying.FieldByName('FECHA').value)
              else
                  SHOWMESSAGE('ERRROR :FECHA DE ALIMENTACION ANTERIOR AL INGRESO DE ANIMALES')  ;
        END
      ELSE
       BEGIN
         IF (IBQueryfecha.FieldByName('FECHA').Value >=IBQuerying.FieldByName('FECHA').value )
            OR   (IBQuerying.FieldByName('FECHA').value = NULL ) THEN
            begin
             if  (DTPAFechaIni.Date > StrToDate(IBQueryfecha.FieldByName('FECHA').value)) then        //ult modi 210617
                     vv:=  DTPAFechaIni.Date- StrToDate(IBQueryfecha.FieldByName('FECHA').value)
                   else
                    begin
                    SHOWMESSAGE( 'Existe una Alimentacion Posterior.. Intente con una fecha posterior');
                    FPrincipal.IBTPrincipal.RollbackRetaining;
                    end;
             end                                                   //ACA PONER AVISOS DE
          ELSE                                                                               // FECHA ALIMENTACION SI ES MENOR
            vv:=DTPAFechaIni.Date- StrToDate(IBQuerying.FieldByName('FECHA').value);
       END ;
  // END;

     /// aca deberia comparar cual es mas reciente si fecha de aimentacion o alta
   /// en caso que anteriormente se haya alimentado en este corral y vuelve
   /// toma ultima alimentacion en lugar de ultimo alta o ingreso....16/06/2017
   /// analizr bien para abarcar T casos.



  v2:= trunc(vv);
  Cantdias:=v2;

  for i := 0 to Length(AlimentosRacion)-1 do
  begin
    try
      IBQSPMovimientoAlimentacion.Close;
      IBQSPMovimientoAlimentacion.ParamByName('alimento').AsInteger := AlimentosRacion[I].id_alimento;
      IBQSPMovimientoAlimentacion.ParamByName('tipo').AsInteger := 2;
      IBQSPMovimientoAlimentacion.ParamByName('fecha').AsDate := DTPAFechaIni.Date;
//       IBQSPMovimientoAlimentacion.ParamByName('costo').AsFloat := ((AlimentosRacion[I].KgTalCual / 1000) * AlimentosRacion[I].PrecioPorTon);
//      IBQSPMovimientoAlimentacion.ParamByName('cantidad').AsFloat := (AlimentosRacion[I].KgTalCual / 1000);
// le saque div por error en redondeo float para trabajar direc con kgss en lugar de tn
      IBQSPMovimientoAlimentacion.ParamByName('costo').AsFloat := ((AlimentosRacion[I].KgTalCual ) * AlimentosRacion[I].PrecioPorTon);
      IBQSPMovimientoAlimentacion.ParamByName('cantidad').AsFloat := (AlimentosRacion[I].KgTalCual)*v2;
      IBQSPMovimientoAlimentacion.ParamByName('tipo_movimiento').AsInteger := 4;
      IBQSPMovimientoAlimentacion.Open;
     // showmessage('ahora va COSTO Y CANTIDAD PARAMETROS SP MOVIMIE');
     // showmessage(floatToStr((AlimentosRacion[I].KgTalCual ) * AlimentosRacion[I].PrecioPorTon));
     // showmessage(floatToStr(AlimentosRacion[I].CANTIDAD));
      //showmessage(floatToStr(AlimentosRacion[I].PrecioPorTon));
      //showmessage(floatToStr((AlimentosRacion[I].KgTalCual ) * AlimentosRacion[I].PrecioPorTon));
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

procedure TFEveSuplementacion.ArmarReporteMixer;
var
  F : TFRepInfoMixerPreview;
  I : Integer;
  nextTS, nextTL : Integer;
  TotalRacion : Double;
  C : TCartel;
begin
  C := TCartel.getInstance;
  C.abrircartel('Generando informe...');

  F := TFRepInfoMixerPreview.Create(self);
  nextTS := 252;
  nextTL := 257;
  TotalRacion := 0;
  for I := 0 to Length(AlimentosRacion)-1 do
  begin
    with (TQRShape(F.QRBand1.AddPrintable(TQRShape))) do
    begin
      Shape := qrsRectangle;
      Top := nextTS;
      Left := 79;
      Width := 374;
      Height := 25;
    end;
    with (TQRLabel(F.QRBand1.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      WordWrap := false;
      Alignment := taCenter;
      Top := nextTL;
      Left := 86;
      Width := 363;
      Height := 17;
      Caption := AlimentosRacion[I].Nombre;
    end;
    with (TQRShape(F.QRBand1.AddPrintable(TQRShape))) do
    begin
      Shape := qrsRectangle;
      Top := nextTS;
      Left := 452;
      Width := 188;
      Height := 25;
    end;
    with (TQRLabel(F.QRBand1.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      WordWrap := false;
      Alignment := taCenter;
      Top := nextTL;
      Left := 457;
      Width := 178;
      Height := 17;
      Caption := FormatFloat('#0.00',AlimentosRacion[I].KgTalCual);
    end;
    TotalRacion := TotalRacion + AlimentosRacion[I].KgTalCual;
    nextTL := nextTL + 25;
    nextTS := nextTS + 24;
  end;

  F.QRLFechaReparto.Caption := DateToStr(DTPAFechaIni.Date);
  F.QRLRacion.Caption := DBLCBATipoSuplementacion.Text;
  F.QRLKgMixer.Caption := FormatFloat('#0.00',TotalRacion);

  C.cerrarcartel;
  C.FreeInstance;

  F.ShowModal;

  F.Destroy;


end;

procedure TFEveSuplementacion.ATerminarExecute(Sender: TObject);
begin
  inherited;
  CargarMovimiento;
  if MostrarMensaje(tmConsulta,'Desea imprimir la ración para realizar la carga del Mixer?') = mrYes then
    ArmarReporteMixer;
end;

procedure TFEveSuplementacion.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ArmarReporteMixer;
end;

end.
