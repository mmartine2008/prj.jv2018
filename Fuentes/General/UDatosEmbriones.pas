
unit UDatosEmbriones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  EditAuto, DateTimePickerAuto, DBCtrls, UDBLookupComboBoxAuto, Grids,
  DBGrids, UBDBGrid, Buttons, UDMSoftvet, IBUpdateSQL, Mask, UDBEditAuto,
  UDBDateTimePickerAuto, DateUtils, JvExControls, JvLabel, JvGIF, ImgList,
  PngImageList, JvExExtCtrls, JvImage, PngImage, jpeg;

type
  TModoColeccion = (mcExterno, mcInterno);
  TTipoDeDato = (tddAlta, tddEliminar, tddTodo, tddEditar);
  TFDatosEmbriones = class(TFUniversal)
    IBQDatosServicios: TIBQuery;
    IBQCalidad: TIBQuery;
    DSCalidad: TDataSource;
    IBQEstadios: TIBQuery;
    DSEstadios: TDataSource;
    IBQDestino: TIBQuery;
    DSDestino: TDataSource;
    IBQDescDestino: TIBQuery;
    DSDescDestino: TDataSource;
    IBQEmbriones: TIBQuery;
    IBUSQLEmbrion: TIBUpdateSQL;
    DSEmbrion: TDataSource;
    IBQDatosAnimal: TIBQuery;
    DSCentrosTransplante: TDataSource;
    IBQCentrosTransplante: TIBQuery;
    IBQEstadiosID_ESTADIO: TIntegerField;
    IBQEstadiosNOMBRE: TIBStringField;
    IBQEstadiosCODIGO: TIBStringField;
    IBQEstadiosSINONIMO: TIBStringField;
    IBQCalidadID_CALIDAD: TIntegerField;
    IBQCalidadNOMBRE: TIBStringField;
    IBQCalidadCODIGO: TIBStringField;
    IBQCalidadSINONIMO: TIBStringField;
    IBQEmbrionesID_EMBRION: TIntegerField;
    IBQEmbrionesESTABLECIMIENTO: TIntegerField;
    IBQEmbrionesFECHA_COLECCION: TDateField;
    IBQEmbrionesID_DESTINO: TIntegerField;
    IBQEmbrionesDESTINO: TIBStringField;
    IBQEmbrionesID_DESCRIPCION: TIntegerField;
    IBQEmbrionesDESCRIPCION: TIBStringField;
    IBQEmbrionesSERIE: TIBStringField;
    IBQEmbrionesNRO_ENVASE: TIBStringField;
    IBQEmbrionesID_ESTADIO: TIntegerField;
    IBQEmbrionesESTADIO: TIBStringField;
    IBQEmbrionesID_CALIDAD: TIntegerField;
    IBQEmbrionesCALIDAD: TIBStringField;
    IBQEmbrionesID_RESP: TIntegerField;
    IBQEmbrionesRESPONSABLE: TIBStringField;
    IBQEmbrionesOBSERVACION: TIBStringField;
    IBQEmbrionesMADRE: TIntegerField;
    IBQEmbrionesPADRE_1: TIntegerField;
    IBQEmbrionesPADRE_2: TIntegerField;
    IBQEmbrionesPADRE_EXTERNO_1: TIBStringField;
    IBQEmbrionesPADRE_EXTERNO_2: TIBStringField;
    IBQEmbrionesMADRE_INTERNA: TIBStringField;
    IBQEmbrionesUSADO: TIBStringField;
    IBQEmbrionesCANT_LAVAJES: TIntegerField;
    IBQEmbrionesPRECIO: TFloatField;
    IBQEmbrionesCENTRO_TRANSPLANTE: TIntegerField;
    IBQCalidadVALOR: TIntegerField;
    IBQEstadiosVALOR: TIntegerField;
    IBQEmbrionesDIAS_GESTACION: TIntegerField;
    IBQEmbrionesNRO_ORDEN: TIBStringField;
    IBQUpdateDel: TIBQuery;
    IBQDelAuxEmbriones: TIBQuery;
    PCDatosEmbriones: TPageControl;
    TSDatos: TTabSheet;
    TSDetalle: TTabSheet;
    PngImageList1: TPngImageList;
    GBDatos: TGroupBox;
    GBDonante: TGroupBox;
    LMadre: TLabel;
    LPadre1: TLabel;
    LServicio1: TLabel;
    LPadre2: TLabel;
    LServicio2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Panel1: TPanel;
    BBEliminar: TBitBtn;
    BBAgregar: TBitBtn;
    BBCancelar: TBitBtn;
    BBTerminar: TBitBtn;
    PEmbriones: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    LResponsable: TLabel;
    LPrecio: TLabel;
    LCentros: TLabel;
    DBDTPFecha: TDateTimePickerAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    DBEAPrecio: TDBEditAuto;
    DBLCBACentrosTrans: TDBLookupComboBoxAuto;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    LCalidad: TLabel;
    LEstadio: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    LDestino: TLabel;
    LDesc: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    DBEALavajes: TDBEditAuto;
    DBLCBACalidad: TDBLookupComboBoxAuto;
    DBLCBAEstadio: TDBLookupComboBoxAuto;
    DBEASerie: TDBEditAuto;
    DBEAEnvase: TDBEditAuto;
    DBEAOrden: TDBEditAuto;
    DBLCBADestino: TDBLookupComboBoxAuto;
    DBLCBADescripcion: TDBLookupComboBoxAuto;
    DBEADiasGestacion: TDBEditAuto;
    EANroOrden: TEditAuto;
    BReceptora: TButton;
    GBDetalle: TGroupBox;
    BDBGEmbriones: TBitDBGrid;
    PBotones: TPanel;
    SBSelTodos: TSpeedButton;
    Image1: TImage;
    JvIAyuda: TJvImage;
    LAyuda: TLabel;
    BBSiguiente: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BBAnterior: TBitBtn;
    BBAyuda: TBitBtn;
    PL: TPanel;
    Image6: TImage;
    LBBCancelar: TLabel;
    LBBAnterior: TLabel;
    LBBSiguiente: TLabel;
    LBBTerminar: TLabel;
    JvTerminar: TJvImage;
    JvSiguiente: TJvImage;
    JvAnteriror: TJvImage;
    JvCancelar: TJvImage;
    BSacarAnimal: TBitBtn;
    BBXlsImport: TBitBtn;
    BAgregarAnimal: TBitBtn;
    GBCantEmbriones: TGroupBox;
    Label7: TLabel;
    EACantidadEmbriones: TEdit;
    BConfirmarCantidad: TButton;
    IConfirma: TImage;
    LConfirma: TLabel;
    Label13: TLabel;
    IBQExisteMadre: TIBQuery;
    IBQInsAuxEmbriones: TIBQuery;
    IBQGenIdEmbrion: TIBQuery;
    IBQEliminarAux: TIBQuery;
    IEliminarEmbrion: TImage;
    LEliminarEmbrion: TLabel;
    IBSPEliminarEmbrion: TIBStoredProc;
    procedure DBLCBADestinoCloseUp(Sender: TObject);
    procedure IBQEmbrionesBeforePost(DataSet: TDataSet);
//    procedure BBAgregarClick(Sender: TObject);
//    procedure BBTerminarClick(Sender: TObject);
//    procedure BBCancelarClick(Sender: TObject);
//    procedure BBEliminarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBQEstadiosAfterOpen(DataSet: TDataSet);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure DBLCBAResponsableCloseUp(Sender: TObject);
    procedure BDBGEmbrionesCellClick(Column: TColumn);
    procedure Change(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LCentrosClick(Sender: TObject);
    procedure LEstadioClick(Sender: TObject);
    procedure LCalidadClick(Sender: TObject);
    procedure LDestinoClick(Sender: TObject);
    procedure LDescClick(Sender: TObject);
    procedure EANroOrdenChange(Sender: TObject);
//    procedure IBQEmbrionesAfterOpen(DataSet: TDataSet);
    procedure DBEADiasGestacionExit(Sender: TObject);
    procedure BDBGEmbrionesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure IBQEmbrionesAfterInsert(DataSet: TDataSet);
    procedure BReceptoraClick(Sender: TObject);
    procedure JvCancelarClick(Sender: TObject);
    procedure JvAnterirorClick(Sender: TObject);
    procedure JvSiguienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
//    procedure BConfirmarCantidadClick(Sender: TObject);
    procedure JvTerminarClick(Sender: TObject);
    procedure IConfirmaClick(Sender: TObject);
    procedure EACantidadEmbrionesChange(Sender: TObject);
    procedure TSDetalleShow(Sender: TObject);
    procedure PCDatosEmbrionesChange(Sender: TObject);
    procedure IEliminarEmbrionClick(Sender: TObject);
    procedure IBQEmbrionesVALORCALIDADSetText(Sender: TField; const Text: String);
   private
    UltimoEmbrion : Integer;
    FModoColeccion : TModoColeccion;
    FTipoDeDato : TTipoDeDato;
    FPadre1, FPadre2, FMadre : Integer;
    CantPadres, Resp : Integer;
    FPadreExt1, FPadreExt2 : String;
    NomServ1, NomServ2 : String;
    Precio : Double;
    Fecha_IA_1, Fecha_IA_2  : TDate;
    DiasGestacion, DiasGestacion_Aux : Integer;
    CargaActual : Integer;
    Agrega : Boolean;
    ///////////Para cuando se inserta uno nuevo////////////
    FechaV : TDate;
    RespV : Integer;
    PrecioV, SerieV, OrdenV, EnvaseV, LavajesV, CentrosV, DiasGestV : Variant;
    SQLStringList: TStringList;
    ///////////////////////////////////////////////////////
    procedure SetPadre1(Value : Integer);
    procedure SetPadre2(Value : Integer);
    procedure SetMadre (Value : Integer);
    procedure SetTipoDeDato (Value : TTipoDeDato);
    procedure SetExterno1 (Value : String);
    procedure SetExterno2 (Value : String);
    procedure SetModoColeccion(Value : TModoColeccion);

    procedure ActConsulta();
    procedure DatosAnimal(SQL : String; ID : Integer);
    procedure CalcularDiasGest();
    procedure CargarMostrarDatosPadres(L : TLabel; Tipo : String);
    function AumentarNroOrden(Orden : String) : String;

    procedure CargarGrillaEmbriones;

    procedure CargarStringList();
    procedure FillPickList(const campo: string; const Qry: TDataSet);
    procedure RealizarCambio(Component : TComponent; CamposBD : array of TField; ValoresCamposBD : array of Variant);
    function RegistroCambio(Component : TComponent) : Boolean;

  public
    DeListado : Boolean;
    Masivo : boolean;
    property ModoColeccion : TModoColeccion read FModoColeccion write SetModoColeccion;
    property TipoDeDato : TTipoDeDato read FTipoDeDato write SetTipoDeDato;
    property Padre_1 : Integer read FPadre1 write SetPadre1;
    property Padre_2 : Integer read FPadre2 write SetPadre2;
    property Externo_1 : String read FPadreExt1 write SetExterno1;
    property Externo_2 : String read FPadreExt2 write SetExterno2;
    property Madre : Integer read FMadre write SetMadre;

    function ObtenerDatosIA() : Boolean;
  published
    constructor Create(Owner : TComponent; Responsable : Integer; FechaColeccion : TDate); reintroduce;
  end;

var
  FDatosEmbriones: TFDatosEmbriones;
  cantidadEmbriones : integer;
  cantidadConfirmada : boolean;

implementation

uses
  UPrincipal, UMensajeHuella, UMangaReceptoras, UTraduccion,UClassType;

{$R *.dfm}

constructor TFDatosEmbriones.Create(Owner : TComponent; Responsable : Integer; FechaColeccion : TDate);
begin
  inherited Create(Owner);
  DBDTPFecha.Date := FechaColeccion;
  ModoColeccion := mcInterno;
  Resp := Responsable;
  NomServ1 := '';
  NomServ2 := '';
  Precio := 0;
  IBQCalidad.Close;
  IBQCalidad.Open;

  IBQCalidad.Locate('id_calidad',1,[]);

  IBQEstadios.Close;
  IBQEstadios.Open;

  IBQEstadios.Locate('id_estadio',5,[]);

  DiasGestacion := 0;
  Fecha_IA_1 := FechaColeccion;
  Fecha_IA_2 := FechaColeccion;
  UltimoEmbrion := 0;
  CargaActual := 0;
  DeListado := false;
  Agrega := true;
  DBEALavajes.Text := '1';
  DBLCBADescripcion.KeyValue := 1;
  DBLCBAEstadio.KeyValue := 4;
  DBLCBACalidad.KeyValue := 0;
end;

function TFDatosEmbriones.ObtenerDatosIA() : Boolean;
begin
  IBQDatosServicios.Close;
  IBQDatosServicios.ParamByName('fecha').AsDate := DBDTPFecha.Date;
  IBQDatosServicios.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosServicios.ParamByName('madre').AsInteger := Madre;
  IBQDatosServicios.Open;

  IBQDatosServicios.Last;
  IBQDatosServicios.First;

  CantPadres := IBQDatosServicios.RecordCount;

  Result := true;

  if CantPadres > 0 then
  begin
    Padre_1 := IBQDatosServicios.FieldValues['PADRE'];
    Externo_1 := IBQDatosServicios.FieldValues['PADRE_EXTERNO'];
    NomServ1 := IBQDatosServicios.FieldValues['NOMBRE_SERVICIO'];
    Fecha_IA_1 := IBQDatosServicios.FieldValues['FECHA_IA'];
    LServicio1.Caption := '';
    if CantPadres > 1 then
    begin
      LServicio2.Visible := true;
      IBQDatosServicios.Next;
      Padre_2 := IBQDatosServicios.FieldValues['PADRE'];
      Externo_2 := IBQDatosServicios.FieldValues['PADRE_EXTERNO'];
      NomServ2 := IBQDatosServicios.FieldValues['NOMBRE_SERVICIO'];
      Fecha_IA_2 := IBQDatosServicios.FieldValues['FECHA_IA'];
      LServicio1.Caption := '';
      LServicio2.Caption := ''+NomServ2;
    end
    else
      DBEADiasGestacion.ReadOnly := true;
    LServicio1.Caption := LServicio1.Caption + NomServ1;
  end
  else
    Result := false;
end;

procedure TFDatosEmbriones.DBLCBADestinoCloseUp(Sender: TObject);
begin
  inherited;
//  DBLCBADescripcion.EsRequerido := DBLCBADestino.KeyValue = 1;
  DBLCBADescripcion.Visible := DBLCBADestino.KeyValue = 1;
  LDesc.Visible := DBLCBADestino.KeyValue = 1;
  //BReceptora.Visible := (DBLCBADestino.KeyValue = 0) and not(DeListado);
  Change(Sender);
end;

procedure TFDatosEmbriones.IBQEmbrionesBeforePost(DataSet: TDataSet);
begin
  inherited;
  {if (IBQEmbriones.State = dsInsert) or (IBQEmbriones.State = dsEdit) then
  begin
    IBQEmbriones.FieldValues['FECHA_COLECCION'] := DBDTPFecha.Date;
    IBQEmbriones.FieldValues['PADRE_1'] := Padre_1;
    IBQEmbriones.FieldValues['PADRE_2'] := Padre_2;
    IBQEmbriones.FieldValues['PADRE_EXTERNO_1'] := Externo_1;
    IBQEmbriones.FieldValues['PADRE_EXTERNO_2'] := Externo_2;
    IBQEmbriones.FieldValues['ESTABLECIMIENTO'] := FPrincipal.EstablecimientoActual;
    IBQEmbriones.FieldValues['MADRE'] := Madre;
    IBQEmbriones.FieldValues['USADO'] := 'N';
    IBQEmbriones.FieldValues['DESTINO'] :=  DBLCBADestino.Text;
    IBQEmbriones.FieldValues['DESCRIPCION'] := DBLCBADescripcion.Text;
    IBQEmbriones.FieldValues['ESTADIO'] := DBLCBAEstadio.Text;
    IBQEmbriones.FieldValues['CALIDAD'] := DBLCBACalidad.Text;
    IBQEmbriones.FieldValues['RESPONSABLE'] := DBLCBAResponsable.Text;

    IBQEmbriones.FieldValues['ID_ESTADIO'] := DBLCBAEstadio.KeyValue;
    IBQEmbriones.FieldValues['ID_CALIDAD'] := DBLCBACalidad.KeyValue;
    IBQEmbriones.FieldValues['ID_DESTINO'] := DBLCBADestino.KeyValue;
    IBQEmbriones.FieldValues['ID_DESCRIPCION'] := DBLCBADescripcion.KeyValue;
  end       }
end;

procedure TFDatosEmbriones.ActConsulta();
var
  StrSQL : String;
begin
  if TipoDeDato = tddEditar then
    StrSQL := 'select * from aux_embriones where madre = :id and fecha_coleccion = :fecha order by nro_orden asc'
  else
    StrSQL := 'select * from aux_embriones where madre = :id and usado = ''N'' and fecha_coleccion = :fecha order by nro_orden asc';

  IBQEmbriones.Close;
  IBQEmbriones.SQL.Clear;
  IBQEmbriones.SQL.Add(StrSQL);
  IBQEmbriones.ParamByName('id').AsInteger := Madre;
  IBQEmbriones.ParamByName('fecha').AsDate := DBDTPFecha.Date;
  IBQEmbriones.Open;
//  BBEliminar.Enabled := not IBQEmbriones.IsEmpty;

  if (not IBQEmbriones.IsEmpty) and (UltimoEmbrion = 0) then
  begin
    IBQEmbriones.Last;
    UltimoEmbrion := IBQEmbriones.FieldValues['ID_EMBRION'];
  end;
  if IBQEmbriones.IsEmpty then
    UltimoEmbrion := 1;

   IBQEmbriones.Edit;
end;
{
procedure TFDatosEmbriones.BBAgregarClick(Sender: TObject);
var
  i, nroOrden : integer;
  ordenNro : string;
begin
  inherited;
  FechaV := DBDTPFecha.Date;
  RespV := DBLCBAResponsable.Field.Value;
  PrecioV := DBEAPrecio.Field.Value;
  SerieV := DBEASerie.Field.Value;
{OrdenV}{ordenNro := EANroOrden.Text;
  EnvaseV := DBEAEnvase.Field.Value;
  LavajesV := DBEALavajes.Field.Value;
  CentrosV := DBLCBACentrosTrans.Field.Value;
  DiasGestV := DBEADiasGestacion.Field.Value;
  if {OrdenV}{ordenNro <> null then
  begin
     nroOrden := StrToInt(ordenNro);
     Inc(nroOrden);
     ordenNro := IntToStr(nroOrden);
    //OrdenV := AumentarNroOrden(OrdenV);
  end;

  IBQEmbriones.Insert;
  BReceptora.Visible := false;

  DBDTPFecha.Date := FechaV;
  DBLCBAResponsable.Field.Value := RespV;
  if PrecioV <> null then
    DBEAPrecio.Field.Value := FormatFloat('##.###',PrecioV);

  DBEASerie.Field.Value := SerieV;
  DBEAEnvase.Field.Value := EnvaseV;
  DBEALavajes.Field.Value := LavajesV;
  DBEADiasGestacion.Field.Value := DiasGestV;
  DBLCBACentrosTrans.Field.Value := CentrosV;
  LDesc.Visible := false;
  DBLCBADescripcion.Visible := false;
  EANroOrden.Text := ordenNro; //OrdenV;   //ACA NO LE ASIGNA EL NUMERO AL TEX, ES CUALQUIERA.

  IBQEmbriones.Post;
  ActConsulta();
  IBQEmbriones.Last;

  DBLCBAEstadio.KeyValue := null;
  DBLCBACalidad.KeyValue := null;
  DBLCBADestino.KeyValue := null;
  DBLCBADescripcion.KeyValue := null;

  IBQEmbriones.Edit;

//  BDBGEmbriones.Enabled := false;
end; }
{
procedure TFDatosEmbriones.BBTerminarClick(Sender: TObject);
begin
  inherited;
  try
    IBQEmbriones.Post;
    FPrincipal.IBDPrincipal.ApplyUpdates([IBQEmbriones]);
    Fprincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  Close();
end;       }
 {
procedure TFDatosEmbriones.BBCancelarClick(Sender: TObject);
begin
  inherited;
  IBQEmbriones.CancelUpdates;
  try
    IBQDelAuxEmbriones.Close;
    IBQDelAuxEmbriones.ParamByName('id').AsInteger := UltimoEmbrion;
    IBQDelAuxEmbriones.ParamByName('id_madre').AsInteger := Madre;
    IBQDelAuxEmbriones.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;      }
 {
procedure TFDatosEmbriones.BBEliminarClick(Sender: TObject);
begin
  inherited;
  try
    IBQUpdateDel.Close;
    IBQUpdateDel.ParamByName('id').AsInteger := IBQEmbriones.FieldValues['id_embrion'];
    IBQUpdateDel.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  ActConsulta();
  BBTerminar.Enabled := true;
end;            }

procedure TFDatosEmbriones.SetPadre1(Value : Integer);
begin
  FPadre1 := Value;
end;

procedure TFDatosEmbriones.SetPadre2(Value : Integer);
begin
  FPadre2 := Value;
end;

procedure TFDatosEmbriones.SetMadre (Value : Integer);
begin
  FMadre := Value;
end;

procedure TFDatosEmbriones.SetExterno1 (Value : String);
begin
  FPadreExt1 := Value;
end;

procedure TFDatosEmbriones.SetExterno2 (Value : String);
begin
  FPadreExt2 := Value;
end;

procedure TFDatosEmbriones.SetModoColeccion(Value : TModoColeccion);
begin
  FModoColeccion := Value;
end;

procedure TFDatosEmbriones.SetTipoDeDato(Value : TTipoDeDato);
begin
  FTipoDeDato := Value;
end;

procedure TFDatosEmbriones.CargarMostrarDatosPadres(L : TLabel; Tipo : String);
var
  RP, Nombre, HBA : String;
begin
  RP := '';
  Nombre := '';
  HBA := '';
  if IBQDatosAnimal.FieldValues['ID_RP'] <> null then
    RP := IBQDatosAnimal.FieldValues['ID_RP'];
  if IBQDatosAnimal.FieldValues['NOMBRE'] <> null then
    Nombre := IBQDatosAnimal.FieldValues['NOMBRE'];
  if IBQDatosAnimal.FieldValues['ID_HBA'] <> null then
    HBA := IBQDatosAnimal.FieldValues['ID_HBA'];

  if Tipo = 'M' then
    L.Caption := Traducir(' RP: ')+RP+Traducir(' - Nombre: ')+Nombre+Traducir(' - HBA: ')+HBA;

  if Tipo = 'P1' then
  begin
    if CantPadres > 1 then
      L.Caption := Traducir(' RP: ')+RP+Traducir(' - Nombre: ')+Nombre+Traducir(' - HBA: ')+HBA
    else
      L.Caption := Traducir(' RP: ')+RP+Traducir(' - Nombre: ')+Nombre+Traducir(' - HBA: ')+HBA;
  end;
  if Tipo = 'P2' then
    L.Caption := Traducir(' RP: ')+RP+Traducir(' - Nombre: ')+Nombre+Traducir(' - HBA: ')+HBA;
end;

procedure TFDatosEmbriones.FormShow(Sender: TObject);
var
  SQL : String;
begin
  inherited;

  EACantidadEmbriones.SetFocus;


  IBQExisteMadre.Close;
  IBQExisteMadre.ParamByName('id_madre').AsInteger := Madre;
  IBQExisteMadre.Open;

//  if not(IBQExisteMadre.IsEmpty) then
//    TipoDeDato := tddEditar;

  JvTerminar.Visible := (TipoDeDato = tddEditar);
  JvTerminar.Enabled := (TipoDeDato = tddEditar);
  LBBTerminar.Visible := (TipoDeDato = tddEditar);
  LBBTerminar.Enabled := (TipoDeDato = tddEditar);

  GBDetalle.Visible := true;//not (TipoDeDato = tddEditar);
  DBDTPFecha.Enabled := not (TipoDeDato = tddEditar);
  DBLCBAResponsable.Enabled := not (TipoDeDato = tddEditar);
  LResponsable.Enabled := not (TipoDeDato = tddEditar);
  LPrecio.Enabled := true;//not (TipoDeDato = tddEditar);
  DBEAPrecio.Enabled := true;//not (TipoDeDato = tddEditar);

  LCentros.Enabled := not (TipoDeDato = tddEditar);
  DBLCBACentrosTrans.Enabled := not (TipoDeDato = tddEditar);

  DBEADiasGestacion.Enabled := not (TipoDeDato = tddEditar);


//  if TipoDeDato = tddEditar then
//     Height := Height - GBDetalle.Height;

    if ModoColeccion = mcInterno then
    begin
      LServicio1.Visible := true;
      SQL := 'SELECT ID_RP, NOMBRE, ID_HBA FROM TAB_ANIMALES WHERE ID_ANIMAL = :ANIMAL';
      DatosAnimal(SQL,Madre);
      CargarMostrarDatosPadres(LMadre,'M');
      if Externo_1 = 'S' then
        SQL := 'SELECT ID_RP, NOMBRE, ID_HBA FROM TAB_ANIMALES_EXTERNOS WHERE ID_ANIMAL_EXTERNO = :ANIMAL';
      DatosAnimal(SQL,Padre_1);
      CargarMostrarDatosPadres(LPadre1,'P1');
      if CantPadres > 1 then
      begin
        LPadre2.Visible := true;
        if Externo_2 = 'S' then
          SQL := 'SELECT ID_RP, NOMBRE, ID_HBA FROM TAB_ANIMALES_EXTERNOS WHERE ID_ANIMAL_EXTERNO = :ANIMAL'
        else
          SQL := 'SELECT ID_RP, NOMBRE, ID_HBA FROM TAB_ANIMALES WHERE ID_ANIMAL = :ANIMAL';
        DatosAnimal(SQL,Padre_2);
        CargarMostrarDatosPadres(LPadre2,'P2');
      end;
    end
    else
    begin
      DBEADiasGestacion.Text := IntToStr(0);
      DBEADiasGestacion.ReadOnly := false;
      SQL := 'SELECT ID_RP, NOMBRE, ID_HBA FROM TAB_ANIMALES_EXTERNOS WHERE ID_ANIMAL_EXTERNO = :ANIMAL';
      DatosAnimal(SQL,Madre);
      CargarMostrarDatosPadres(LMadre,'M');
      if Externo_1 = 'N' then
        SQL := 'SELECT ID_RP, NOMBRE, ID_HBA FROM TAB_ANIMALES WHERE ID_ANIMAL_EXTERNO = :ANIMAL';
      DatosAnimal(SQL,Padre_1);
      CargarMostrarDatosPadres(LPadre1,'P1');
      if Padre_2 >  0 then
      begin
        CantPadres := 2;
        LPadre2.Visible := true;
        if Externo_2 = 'S' then
          SQL := 'SELECT ID_RP, NOMBRE, ID_HBA FROM TAB_ANIMALES_EXTERNOS WHERE ID_ANIMAL_EXTERNO = :ANIMAL'
        else
          SQL := 'SELECT ID_RP, NOMBRE, ID_HBA FROM TAB_ANIMALES WHERE ID_ANIMAL = :ANIMAL';
        DatosAnimal(SQL,Padre_2);
        CargarMostrarDatosPadres(LPadre2,'P2');
      end;
      LServicio1.Visible := false;
    end;

    DMSoftvet.IBQResponsable.Close;
    DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQResponsable.Open;

    IBQDestino.Close;
    IBQDestino.Open;
    IBQDescDestino.Close;
    IBQDescDestino.Open;
    if modoColeccion = mcExterno then
    begin
      IBQCentrosTransplante.Close;
      IBQCentrosTransplante.Open;
      DBLCBACentrosTrans.Visible := true;
      LCentros.Visible := true;
//      DBLCBACentrosTrans.EsRequerido := true;
    end
    else
    begin
      DBLCBACentrosTrans.Visible := false;
      LCentros.Visible := false;
//      DBLCBACentrosTrans.EsRequerido := false;
    end;

    CargarStringList;

    ActConsulta();

//------------------------------------------------------------------------------

    if (TipoDeDato = tddEditar) then
    begin
      cantidadConfirmada := true;
      EACantidadEmbriones.Text := IntToStr(IBQEmbriones.RecordCount);
      PCDatosEmbriones.ActivePage := TSDetalle;
    end;

    EACantidadEmbriones.Enabled := not (TipoDeDato = tddEditar);
    IConfirma.Enabled := not (TipoDeDato = tddEditar);
    LConfirma.Enabled := not (TipoDeDato = tddEditar);
    Label13.Enabled := not (TipoDeDato = tddEditar);

    DBEASerie.Enabled := not (TipoDeDato = tddEditar);
    DBEAOrden.Enabled := not (TipoDeDato = tddEditar);
    EANroOrden.Enabled := not (TipoDeDato = tddEditar);
    DBEAEnvase.Enabled := not (TipoDeDato = tddEditar);
    DBEALavajes.Enabled := not (TipoDeDato = tddEditar);
    DBEADiasGestacion.Enabled := not (TipoDeDato = tddEditar);
    DBLCBAEstadio.Enabled := not (TipoDeDato = tddEditar);
    DBLCBACalidad.Enabled := not (TipoDeDato = tddEditar);
    DBLCBADestino.Enabled := not (TipoDeDato = tddEditar);
    DBLCBADescripcion.Enabled := not (TipoDeDato = tddEditar);

//------------------------------------------------------------------------------

    CalcularDiasGest;
    DBLCBAResponsable.Field.Value := Resp;



  if (TipoDeDato = tddEditar) then
  begin
    DBLCBADestino.KeyValue := IBQEmbriones.FieldValues['id_destino'];
    DBLCBADescripcion.KeyValue := IBQEmbriones.FieldValues['id_descripcion'];
    DBLCBACalidad.KeyValue := IBQEmbriones.FieldValues['id_calidad'];
    DBLCBAEstadio.KeyValue := IBQEmbriones.FieldValues['id_estadio'];
    DBLCBADescripcion.Visible := IBQEmbriones.FieldValues['id_descripcion'] <> null;
    LDesc.Visible := IBQEmbriones.FieldValues['id_descripcion'] <> null;
//    DBLCBADescripcion.EsRequerido := IBQEmbriones.FieldValues['id_descripcion'] <> null;
    Change(DBLCBADescripcion);
  end;

  if (TipoDeDato = tddEliminar) then
  begin
       IEliminarEmbrion.Visible := true;
       LEliminarEmbrion.Visible := true;
       TSDatos.TabVisible := false;
       JvAnteriror.Visible := false;
       JvSiguiente.Visible := false;
       LBBAnterior.Visible := false;
       LBBSiguiente.Visible := false;
       JvTerminar.Visible := true;
       LBBTerminar.Visible := true;
       JvTerminar.Enabled := true;
       LBBTerminar.Enabled := true;

       BDBGEmbriones.Options := [dgTitles,dgColLines,dgRowLines,dgRowSelect,dgConfirmDelete,dgCancelOnExit];
  end
  else
  begin
       IEliminarEmbrion.Visible := false;
       LEliminarEmbrion.Visible := false;
  end;

  ActConsulta;
  Change(DBDTPFecha);
end;

procedure TFDatosEmbriones.DatosAnimal(SQL : String; ID : Integer);
begin
  IBQDatosAnimal.Close;
  IBQDatosAnimal.SQL.Clear;
  IBQDatosAnimal.SQL.Add(SQL);
  IBQDatosAnimal.ParamByName('ANIMAL').AsInteger := ID;
  IBQDatosAnimal.Open;
end;

procedure TFDatosEmbriones.IBQEstadiosAfterOpen(DataSet: TDataSet);
var
  con : integer;
begin
  con := 0;
  while (not(DataSet.Eof) and (con < 21)) do begin
    DataSet.Next;
    inc(con);
  end;
end;

procedure TFDatosEmbriones.LabelMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      (Sender as TLabel).Font.Color:= $00606C02;
      (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFDatosEmbriones.LabelMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      (Sender as TLabel).Font.Color:= clWindowText;
      (Sender as TLabel).Font.Style:= [fsUnderline];
    end;
end;

procedure TFDatosEmbriones.DBLCBAResponsableCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBAResponsable.KeyValue <> null then
    Resp := DBLCBAResponsable.KeyValue
  else
    Resp := 0;
end;

procedure TFDatosEmbriones.BDBGEmbrionesCellClick(Column: TColumn);
begin
  inherited;
  
  if (TipoDeDato <> tddEliminar) then
  begin
//    DBLCBADescripcion.Visible := DBLCBADestino.KeyValue = 1;
//    LDesc.Visible := DBLCBADescripcion.Visible;
  end;

//  if (Column.Title = 'Calidad') then

end;

procedure TFDatosEmbriones.CalcularDiasGest();
begin
  DiasGestacion := DaysBetween(DBDTPFecha.Date,Fecha_IA_1);
  DiasGestacion_Aux := DaysBetween(DBDTPFecha.Date,Fecha_IA_2);
  if IBQEmbriones.State <> dsInactive then
  begin
    IBQEmbriones.Edit;
    DBEADiasGestacion.Field.Value := DiasGestacion;
  end;
end;

procedure TFDatosEmbriones.Change(Sender: TObject);
var
  I : integer;
  valor : Integer;
  Resultado : Boolean;
begin

  if (Sender is TDBEditAuto) then
  begin
    if (Sender as TDBEditAuto).Name = 'DBEAOrden' then
      if DBEAOrden.Text <> '' then
      begin
        EANroOrden.OnChange := nil;
        EANroOrden.Text := DBEAOrden.Field.Value;
        EANroOrden.OnChange := EANroOrdenChange;
      end;
  end;

  if (Sender is TDateTimePickerAuto) then
    if (Sender as TDateTimePickerAuto).Name = 'DBDTPFecha' then
      CalcularDiasGest();

  Resultado := true;
  for I := 0 to ComponentCount-1 do
  begin
    if Components[I] is TEditAuto then
      if (Components[I] as TEditAuto).EsRequerido then
        Resultado := resultado and (Components[I] as TEditAuto).PuedeGrabar;
    if Components[I] is TDBEditAuto then
      if (Components[I] as TDBEditAuto).EsRequerido then
        Resultado := resultado and (Components[I] as TDBEditAuto).PuedeGrabar;
    if Components[I] is TDBLookupComboBoxAuto then
      if (Components[I] as TDBlookupComboBoxAuto).EsRequerido then
        Resultado := resultado and (Components[I] as TDBlookupComboBoxAuto).PuedeGrabar;
  end;

  //BBTerminar.Enabled := Resultado;
  //JvTerminar.Enabled := Resultado;
  JvSiguiente.Enabled := Resultado;
  LBBSiguiente.Enabled := Resultado;

  BReceptora.Enabled := Resultado;
//  BBAgregar.Enabled := Resultado;
//  BBEliminar.Enabled := Resultado;
//  BDBGEmbriones.Enabled := Resultado;
end;

procedure TFDatosEmbriones.LResponsableClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AAbmEmpleadosExecute(self);
    DMSoftvet.IBQResponsable.Close;
    DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQResponsable.Open;
  end;
end;

procedure TFDatosEmbriones.LCentrosClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMCentrosTransplantesExecute(self);
    IBQCentrosTransplante.Close;
    IBQCentrosTransplante.Open;
  end;
end;

procedure TFDatosEmbriones.LEstadioClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMEstadioEmbrionExecute(self);
    IBQEstadios.Close;
    IBQEstadios.Open;
  end;
end;

procedure TFDatosEmbriones.LCalidadClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMCalidadEmbrionExecute(self);
    IBQCalidad.Close;
    IBQCalidad.Open;
  end;
end;

procedure TFDatosEmbriones.LDestinoClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMDestinoEmbrionExecute(self);
    IBQDestino.Close;
    IBQDestino.Open;
  end;
end;

procedure TFDatosEmbriones.LDescClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMDestDescEmbrionExecute(self);
    IBQDescDestino.Close;
    IBQDescDestino.Open;
  end;
end;

procedure TFDatosEmbriones.EANroOrdenChange(Sender: TObject);
var
  valor : integer;
begin
  inherited;
  valor := 0;
    if TryStrToInt(EANroOrden.Text,valor) then
      DBEAOrden.Field.Value := EANroOrden.Text
    else
    begin
      EANroOrden.OnChange := nil;
      EANroOrden.Text := '';
      if IBQEmbriones.State = dsEdit then
        DBEAOrden.Field.Value := 0;
      EANroOrden.OnChange := EANroOrdenChange;
    end;
end;

function TFDatosEmbriones.AumentarNroOrden(Orden : String) : String;
var
  L, Val, I, j, v1, v2, v3 : Integer;
  R, Res : String;
begin
  v1 := StrToInt(EACantidadEmbriones.Text);
  v2 := StrToInt(EANroOrden.Text);
  v3 := v1 + v2;

  I := Length(IntToStr(v3));

  Val := StrToInt(Orden);
  Inc(Val);
  R := IntToStr(Val);
  L := Length(R);
//  I := Length(EACantidadEmbriones.Text);

  SetLength(Res, I-L);
  for j := 1 to I-L do
      Res[j] := '0';

  Res := Res + R;

  result := res;

{  SetLength(Res,L-Length(R));
  if Length(R) < L then
  begin
    for I := 1 to L-Length(R) do
      Res[I] := '0';
    Res := Res+R;
  end
  else
    Res := R;

  Result := Res;}
end;
 {
procedure TFDatosEmbriones.IBQEmbrionesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQEmbriones.Last;
  IBQEmbriones.First;
  if (IBQEmbriones.RecordCount-1) < 0 then
    LCant.Caption := '0'
  else
    LCant.Caption := IntToStr(IBQEmbriones.RecordCount-1);
end;         }

procedure TFDatosEmbriones.DBEADiasGestacionExit(Sender: TObject);
var
  valor : Integer;
begin
  inherited;
  if modoColeccion = mcInterno then
    if DBEADiasGestacion.Text <> '' then
    begin
      TryStrToInt(DBEADiasGestacion.Field.AsString, valor);
      if (valor <> DiasGestacion) then
        if (valor <> DiasGestacion_Aux) then
        begin
          MostrarMensaje(tmError,Traducir('Los días desde celo solo pueden ser ')+IntToStr(DiasGestacion)+' o '+IntToStr(DiasGestacion_Aux)+Traducir(' días según los servicios realizados'));
          CalcularDiasGest;
        end;
    end;
end;

procedure TFDatosEmbriones.BDBGEmbrionesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  {if Column.Color <> $00F5DFD3 then
  begin
    if (IBQEmbriones.FieldValues['id_embrion'] = CargaActual) then
      BDBGEmbriones.Canvas.Brush.Color := clWhite
    else
      BDBGEmbriones.Canvas.Brush.Color := $00DFFEFF;
  end;

  BDBGEmbriones.Canvas.FillRect(Rect);
  if (IBQEmbriones.FieldValues['id_embrion'] = CargaActual) then
    BDBGEmbriones.Canvas.Font.Color := clSilver
  else
    BDBGEmbriones.Canvas.Font.Color := clBlack;
  BDBGEmbriones.Canvas.TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);

  if (TipoDeDato = tddEliminar) then
  begin
      BDBGEmbriones.Canvas.Brush.Color := clBlue;
  end;  }
end;

procedure TFDatosEmbriones.IBQEmbrionesAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CargaActual := IBQEmbriones.FieldValues['id_embrion'];
end;

procedure TFDatosEmbriones.BReceptoraClick(Sender: TObject);
var
  F : TFMangaReceptoras;
begin
  inherited;
  F := TFMangaReceptoras.Create(self);
  F.Embrion := IBQEmbriones.FieldValues['ID_EMBRION'];
  F.RPMadre := LMadre.Caption;
  F.Padres := LPadre1.Caption+' '+LPadre2.Caption;
  F.Info := 'Serie: '+DBEASerie.Text+' - Calidad: '+DBLCBAEstadio.Text+':'+DBLCBACalidad.Text;
  F.ShowModal;
  F.Destroy;
end;

//-----------------------------------------------------------------------------------------------------------------------

procedure TFDatosEmbriones.JvCancelarClick(Sender: TObject);
var F : TFMensaje;
    r : TModalResult;
begin
  inherited;

  F := TFMensaje.Create(self,tmConsulta,'¿Desea cancelar el evento realmente?');
  F.ShowModal;
  r := F.ModalResult;
  F.Destroy;

  if (r = mrYes) then
  begin
    IBQEmbriones.CancelUpdates;
    try
      IBQDelAuxEmbriones.Close;
      IBQDelAuxEmbriones.ParamByName('id').AsInteger := UltimoEmbrion;
      IBQDelAuxEmbriones.ParamByName('id_madre').AsInteger := Madre;
      IBQDelAuxEmbriones.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
    Close();
  end;

end;

procedure TFDatosEmbriones.JvAnterirorClick(Sender: TObject);
begin
  PCDatosEmbriones.ActivePage := TSDatos;
  JvTerminar.Visible := false;
  LBBTerminar.Visible := false;  
  PCDatosEmbrionesChange(nil);
  {if (PCDatosEmbriones.ActivePage.Name = 'TSDetalle') then
      TSDatos.Show;}
end;

procedure TFDatosEmbriones.JvSiguienteClick(Sender: TObject);
var
  I : Integer;
begin
  if TryStrToInt(EACantidadEmbriones.Text,I) then
  begin
    if (PCDatosEmbriones.ActivePage.Name = 'TSDatos') then
    begin
      if (I > 0) then
      begin
        if(TipoDeDato <> tddEditar) then
            CargarGrillaEmbriones;

        PCDatosEmbriones.ActivePage := TSDetalle;
        JvTerminar.Enabled := true;
        LBBTerminar.Enabled := true;
        LBBTerminar.Visible := True;
        JvTerminar.Visible := true;
      end
      else
      begin
          MostrarMensaje(tmAdvertencia,'Debe cargar al menos 1 embrión');
          EACantidadEmbriones.SetFocus;
      end;
    end;
  end
  else
  begin
    MostrarMensaje(tmAdvertencia,'Debe cargar al menos 1 embrión');
    EACantidadEmbriones.SetFocus;
  end;
end;

procedure TFDatosEmbriones.FormCreate(Sender: TObject);
begin

    EACantidadEmbriones.Text := '';
    cantidadEmbriones := 0;

    cantidadConfirmada := False;

    JvTerminar.Visible := False;
    LBBTerminar.Visible := False;
    JvSiguiente.Enabled := False;
    LBBSiguiente.Enabled := False;

    PCDatosEmbriones.ActivePage := TSDatos;

end;

{
procedure TFDatosEmbriones.BConfirmarCantidadClick(Sender: TObject);
begin
    cantidadEmbriones := StrToInt(EACantidadEmbriones.Text);
    cantidadConfirmada := True;
end;       }

procedure TFDatosEmbriones.CargarGrillaEmbriones;
var i, nroOrden : integer;
begin

    FPrincipal.IBTPrincipal.CommitRetaining;
    if not(Masivo) then
    begin
      IBQEliminarAux.Close;
      IBQEliminarAux.Open;
    end;
    FPrincipal.IBTPrincipal.CommitRetaining;

   { if (EANroOrden.Text <> '') then
    begin}
      if EANroOrden.Text <> '' then
        OrdenV := EANroOrden.Text
      else
      begin
        EANroOrden.Text := '1';
        OrdenV := '1';
      end;
      nroOrden := StrToInt(OrdenV);
      if (nroOrden > 0) then
      begin
        Dec(nroOrden);
        OrdenV := AumentarNroOrden(IntToStr(nroOrden));
      end;
   // end;
    
    for i:=1 to cantidadEmbriones do
    begin

      try

        IBQGenIdEmbrion.Close;
        IBQGenIdEmbrion.Open;
        IBQInsAuxEmbriones.Close;

        IBQInsAuxEmbriones.ParamByName('FECHA_COLECCION').AsDate := DBDTPFecha.Date;
        IBQInsAuxEmbriones.ParamByName('PADRE_1').AsInteger := Padre_1;
        IBQInsAuxEmbriones.ParamByName('PADRE_2').AsInteger := Padre_2;
        IBQInsAuxEmbriones.ParamByName('PADRE_EXTERNO_1').AsString := Externo_1;
        IBQInsAuxEmbriones.ParamByName('PADRE_EXTERNO_2').AsString := Externo_2;
        IBQInsAuxEmbriones.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
        IBQInsAuxEmbriones.ParamByName('MADRE').AsInteger := Madre;
        IBQInsAuxEmbriones.ParamByName('USADO').AsString := 'N';
        IBQInsAuxEmbriones.ParamByName('DESTINO').AsString :=  DBLCBADestino.Text;

        if (DBLCBADescripcion.Text <> '') then
          IBQInsAuxEmbriones.ParamByName('DESCRIPCION').AsString := DBLCBADescripcion.Text
        else
          IBQInsAuxEmbriones.ParamByName('DESCRIPCION').Value := null;

        //RealizarCambio(EAPeso,[IBDSSimple.FieldByName('PESO')],[peso]);
        //RealizarCambio(DBLCBACalidad,[IBQInsAuxEmbriones.FieldByName('CALIDAD')],[DBLCBACalidad.Text]);

        IBQInsAuxEmbriones.ParamByName('ESTADIO').AsString := DBLCBAEstadio.Text;
        IBQInsAuxEmbriones.ParamByName('CALIDAD').AsString := DBLCBACalidad.Text;

        if (DBLCBAResponsable.Text <> '') then
          IBQInsAuxEmbriones.ParamByName('RESPONSABLE').AsString := DBLCBAResponsable.Text
        else
          IBQInsAuxEmbriones.ParamByName('RESPONSABLE').Value := null;

        IBQInsAuxEmbriones.ParamByName('ID_ESTADIO').AsInteger := DBLCBAEstadio.KeyValue;
        IBQInsAuxEmbriones.ParamByName('ID_CALIDAD').AsInteger := DBLCBACalidad.KeyValue;
        IBQInsAuxEmbriones.ParamByName('ID_DESTINO').AsInteger := DBLCBADestino.KeyValue;

        if (DBLCBADescripcion.KeyValue <> null) then
          IBQInsAuxEmbriones.ParamByName('ID_DESCRIPCION').Value := DBLCBADescripcion.KeyValue
        else
          IBQInsAuxEmbriones.ParamByName('ID_DESCRIPCION').Value := null;


        IBQInsAuxEmbriones.ParamByName('PRECIO').Value := DBEAPrecio.Text;
        if DBEASerie.Text <> '' then
          IBQInsAuxEmbriones.ParamByName('SERIE').Value:= DBEASerie.Text
        else
          IBQInsAuxEmbriones.ParamByName('SERIE').AsString := '0';

        if DBEAEnvase.Text <> '' then
          IBQInsAuxEmbriones.ParamByName('NRO_ENVASE').Value := DBEAEnvase.Text
        else
          IBQInsAuxEmbriones.ParamByName('NRO_ENVASE').AsString := '0';

        if DBEALavajes.Text <> '' then
          IBQInsAuxEmbriones.ParamByName('CANT_LAVAJES').Value := DBEALavajes.Text
        else
          IBQInsAuxEmbriones.ParamByName('CANT_LAVAJES').AsInteger := 0;


        IBQInsAuxEmbriones.ParamByName('CENTRO_TRANSPLANTE').Value := DBLCBACentrosTrans.KeyValue;

        if DBEADiasGestacion.Text <> '' then
          IBQInsAuxEmbriones.ParamByName('DIAS_GESTACION').Value := DBEADiasGestacion.Text
        else
          IBQInsAuxEmbriones.ParamByName('DIAS_GESTACION').AsInteger := 0;

        IBQInsAuxEmbriones.ParamByName('ID_EMBRION').AsInteger := IBQGenIdEmbrion.FieldValues['ID'];

        IBQInsAuxEmbriones.ParamByName('NRO_ORDEN').AsString := OrdenV;


        IBQInsAuxEmbriones.Open;

      except


      end;

        if (EANroOrden.Text <> '') then
          OrdenV := AumentarNroOrden(OrdenV);
    end;

   ActConsulta();
end;

procedure TFDatosEmbriones.JvTerminarClick(Sender: TObject);
begin
  inherited;

  if (TipoDeDato = tddEliminar) then
  begin
     try
       IBSPEliminarEmbrion.Close;
       IBSPEliminarEmbrion.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
       IBSPEliminarEmbrion.ParamByName('fecha').AsDate := DBDTPFecha.Date;
       IBSPEliminarEmbrion.ExecProc;
       FPrincipal.IBTPrincipal.CommitRetaining;
     except
       FPrincipal.IBTPrincipal.RollbackRetaining;
     end;
  end
  else
  begin
    try
      //    IBQEmbriones.Post;
      //FPrincipal.IBDPrincipal.ApplyUpdates([IBQEmbriones]);
      Fprincipal.IBTPrincipal.CommitRetaining;
      MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
    except
      MostrarMensaje(tmError,'No se han podido guardar los datos.');
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
  Close();
end;

procedure TFDatosEmbriones.IConfirmaClick(Sender: TObject);
begin
  inherited;
    cantidadEmbriones := StrToInt(EACantidadEmbriones.Text);
    cantidadConfirmada := True;
end;

procedure TFDatosEmbriones.EACantidadEmbrionesChange(Sender: TObject);
var
  I : Integer;
begin
  inherited;
  Agrega := true;
  if TryStrToInt(EACantidadEmbriones.Text,I) then
    if I > 0 then
      cantidadEmbriones := I;
end;

procedure TFDatosEmbriones.TSDetalleShow(Sender: TObject);
begin
  inherited;
  Agrega := false;
end;

procedure TFDatosEmbriones.PCDatosEmbrionesChange(Sender: TObject);
begin
  inherited;
  if PCDatosEmbriones.ActivePage = TSDatos then
    IBQEmbriones.Edit;
end;

procedure TFDatosEmbriones.IEliminarEmbrionClick(Sender: TObject);
begin
  inherited;
  
  try
    IBQUpdateDel.Close;
    IBQUpdateDel.ParamByName('id').AsInteger := IBQEmbriones.FieldValues['id_embrion'];
    IBQUpdateDel.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  ActConsulta();

end;

procedure TFDatosEmbriones.IBQEmbrionesVALORCALIDADSetText(Sender: TField; const Text: String);
var PickPos:integer;
begin
  inherited;
  if((TipoDeDato = tddAlta)or (TipoDeDato = tddTodo))then
  begin
      if IBQEmbriones.State <> dsInsert then
      begin

        if(Sender.FieldName = 'CALIDAD')then
         begin
          IBQEmbrionesCALIDAD.AsString := Text;
          PickPos := BDBGEmbriones.ColumnByField('CALIDAD').PickList.IndexOf(BDBGEmbriones.ColumnByField('CALIDAD').Field.AsString);
          IBQEmbrionesID_CALIDAD.AsInteger := TClassType(BDBGEmbriones.ColumnByField('CALIDAD').PickList.Objects[PickPos]).getValue;
        end;
        if(Sender.FieldName = 'ESTADIO')then
         begin
          IBQEmbrionesESTADIO.AsString := Text;
          PickPos := BDBGEmbriones.ColumnByField('ESTADIO').PickList.IndexOf(BDBGEmbriones.ColumnByField('ESTADIO').Field.AsString);
          IBQEmbrionesID_ESTADIO.AsInteger := TClassType(BDBGEmbriones.ColumnByField('ESTADIO').PickList.Objects[PickPos]).getValue;
        end;
        if(Sender.FieldName = 'DESTINO')then
         begin
          IBQEmbrionesDESTINO.AsString := Text;
          PickPos := BDBGEmbriones.ColumnByField('DESTINO').PickList.IndexOf(BDBGEmbriones.ColumnByField('DESTINO').Field.AsString);
          IBQEmbrionesID_DESTINO.AsInteger := TClassType(BDBGEmbriones.ColumnByField('DESTINO').PickList.Objects[PickPos]).getValue;
        end;

      end;
  end;
end;

procedure TFDatosEmbriones.CargarStringList;
var i : integer;
begin
  SQLStringList:= TStringList.Create;
  SQLStringList.AddObject('CALIDAD',TObject(DSCalidad));
  SQLStringList.AddObject('DESTINO',TObject(DSDestino));
  SQLStringList.AddObject('ESTADIO',TObject(DSEstadios));

  for i := 0 to SQLStringList.Count -1 do
   if not((TDataSource(SQLStringList.Objects[i]).DataSet).IsEmpty)then
     FillPickList(SQLStringList.Strings[i], TDataSource(SQLStringList.Objects[i]).DataSet);

end;

procedure TFDatosEmbriones.FillPickList(const campo: string; const Qry: TDataSet);
var slPickList: TStringList;
    i:integer;
    aux:integer;
begin
  slPickList:= TStringList.Create;
  try
   Qry.First;
    while not (Qry.Eof) do
    begin
     if (TryStrToInt(Qry.Fields[0].AsString,aux)) then
     begin
      if campo = 'DESTINO' then
        slPickList.AddObject(Qry.Fields[1].AsString, TClassType.CreateClassTypeInteger(Qry.Fields[0].AsInteger))
      else
        slPickList.AddObject(Qry.Fields[4].AsString, TClassType.CreateClassTypeInteger(Qry.Fields[0].AsInteger));
     end
     else
     begin
      if campo = 'DESTINO' then
        slPickList.AddObject(Qry.Fields[1].AsString, TClassType.CreateClassTypeString(Qry.Fields[0].AsString))
      else
        slPickList.AddObject(Qry.Fields[4].AsString, TClassType.CreateClassTypeString(Qry.Fields[0].AsString));
     end;
      Qry.Next;
    end;
    for i:= 0 to BDBGEmbriones.Columns.Count - 1 do
      if(BDBGEmbriones.Columns[i].FieldName = campo)then
      begin
         BDBGEmbriones.Columns[i].PickList := slPickList;
         break;
      end;
  finally
    slPickList.Free;
  end;
end;

procedure TFDatosEmbriones.RealizarCambio(Component : TComponent; CamposBD : array of TField;
  ValoresCamposBD : array of Variant);
var
  I : Integer;
begin
  if Length(ValoresCamposBD) = Length(CamposBD) then
  begin
    if RegistroCambio(Component) then
      for I := 0 to Length(CamposBD)-1 do
      begin
          try
            CamposBD[I].Value := ValoresCamposBD[I];
          except
          end;
      end;
  end
  else
    raise Exception.Create('La cantidad de elementos de CamposBD debe ser igual a la de ValoresCamposBD');
end;

function TFDatosEmbriones.RegistroCambio(Component : TComponent) : Boolean;
var
  Indice : Integer;
  Resultado : Boolean;
begin
//  Resultado := false;
{  if (true and (Component <> nil) and not false) then
  begin
    for Indice := 0 to Length(ArrComponents)-1 do
      if Component.Name = ArrComponents[Indice].Name then
      begin
        Resultado := true;
        break;
      end;
  end
  else                }
    Resultado := true;
  Result := Resultado;
end;


end.



