unit UMapaGoogle;

interface

////////////
///////////////
// CLASE PARA EL MANEJO DE MAPAS de GOOGLE
// Utilizando una wrapper al Navegador CHROMIUM
// VERSION Chromium :  Delphi Chromium Embeded 3
//
// Ultima actualizacion uMapaGoogle : 13 Abril 2016..
// Cambio realizado :
//         * incorporacion de la ultima version del Chromium

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, JvExStdCtrls, Math,
  JvCombobox, JvColorCombo, PngImage, jpeg, OleCtrls, SHDocVw, MSHTML, IBUpdateSQL,
  DBCtrls, UDBLookupComboBoxAuto, JvListComb, JvExExtCtrls, JvImage, DynamicArrayUnit,
  JvExtComponent, JvRollOut, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, UEveSimple,
  cxDBLookupComboBox, cxMemo, cxColorComboBox, Menus, AdvMenus, 
  GISShape, GISImage, DrawMarkUnit, URepMapaPreview,
  SVOLegend, Ayuda3, cxGraphics, cefgui, cefvcl, ceflib; 
type
///////////////////////////////////////////////////
//////////////////////////////////////////////////
TPotrerosActivos = record
    id : integer;
    nombre : String;
    MedidasVisibles : Boolean;
    ProduccionVisible : Boolean;
    Visible : Boolean;
  end;

  TArrPotreros = Array of TPotrerosActivos;

  TCoordenada = record
    CoordNormalizada : TDoublePoint;
    Coord : TDoublePoint;
    Latitud : String;
    Longitud : String;
  end;

  TBoundingBox = record
    MinLat : Double;
    MaxLat : Double;
    MinLong : Double;
    MaxLong : Double;
  end;

  PMalla = ^TMalla;

  TTipoMalla = (ttmAgricola,ttmGanadero);

  TInfoMalla = record
    Nombre : String;
    UltimoEve : String;
    CabsHas : Double;
    Hs : String;
    Tipo : TTipoMalla;
    Teros, Teras, Novs, Vq, Vacas, Toros : String;
    Stroke : Cardinal;
    Fill : Cardinal;
    Area : Integer;
  end;

  TMalla = record
    Puntos : Array of TCoordenada;
    Vecinos : Array of PMalla;
    Info : TInfoMalla;
    Referencia : Boolean;
    _Ref_Pot : Integer;
  end;

  TMapa = record
    Mallas : Array of TMalla;
    BoundingBox : TBoundingBox;
  end;

//////////////////////////////////////////////////
/////////////////////////////////////////////////
  TModo = (mNavega,mEdita);

  TPunto = record
    indice : Integer;
    lat : double;
    lng : double;
  end;

  TInfo = record
    indice : Integer;
    nombre : String;
    Info : String;
    StrokeColor : String;
    StrokeWeigth : String;
    StrokeOpacity : String;
    FillColor : String;
    FillOpacity : String;
  end;

  TArrInfo = Array of TInfo;
  TArrPuntos = Array of TPunto;

  // Registro de consulta a la pagina.
  TRegistroGMap = record
		coordenadas: String;
		info_coord: String;
		aux_id: String;
		aux_id_ref: String;
		info_marca: String;
		info_marca_pe: String;
		info_poly_pe: String;
		area_poly: String;
		id_poly_eve : String;
		id_poly_ficha: String;
		text_info: String;
		text_error: String;
    mapa_finalizado: String;
    setModoNavega_finalizado: String;
    cambios: String;
  end;

   TCustomRenderProcessHandler = class(TCefRenderProcessHandlerOwn)
  protected
    procedure OnWebKitInitialized; override;
    function OnProcessMessageReceived(const browser: ICefBrowser; sourceProcess: TCefProcessId;
      const message: ICefProcessMessage): Boolean; override;
  end;



  TFMapaGoogle = class(TFUniversal)
    IBQInfo: TIBQuery;
    IBQEliminarInfoMapa: TIBQuery;
    IBQEliminarCoordenadas: TIBQuery;
    IBQCoordenadas: TIBQuery;
    IBUCoordenadas: TIBUpdateSQL;
    IBUSQLInfoMapa: TIBUpdateSQL;
    TChechID: TTimer;
    PDatosPotrero: TPanel;
    Panel2: TPanel;
    ENombre: TEdit;
    PBotom: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EStrokeW: TEdit;
    EStrokeOp: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    EFillOp: TEdit;
    PControles: TPanel;
    IF1: TImage;
    IIr: TImage;
    LModificar: TLabel;
    BIr: TButton;
    BEdicion: TButton;
    Button1: TButton;
    Button2: TButton;
    IBQPotreros: TIBQuery;
    DSPotreros: TDataSource;
    IBQGetDatosPotreros: TIBQuery;
    Splitter1: TSplitter;
    TiInic: TTimer;
    ITerminar: TImage;
    LGuardar: TLabel;
    IEliminarP: TImage;
    LEliminar: TLabel;
    ISalir: TImage;
    LSalir: TLabel;
    IImprimir: TImage;
    LImprimir: TLabel;
    IEdicion: TImage;
    LPotrero: TLabel;
    LRefDireccion: TLabel;
    PRefMarcas: TPanel;
    PLReferencia: TPngImageList;
    ILBReferencias: TJvImageListBox;
    IGuardarRef: TImage;
    LGuardarRef: TLabel;
    TCheckIdRef: TTimer;
    IDibujar: TImage;
    LDibujar: TLabel;
    LReferencia: TLabel;
    IReferencia: TImage;
    BPoligonos: TButton;
    BMarcas: TButton;
    IVolver: TImage;
    LVolver: TLabel;
    IAppImagen: TJvImage;
    JvROReferencias: TJvRollOut;
    PReferencias: TPanel;
    PTopRef: TPanel;
    LNombreEsta: TLabel;
    SBReferencias: TScrollBox;
    IlRef: TPngImageList;
    Label2: TLabel;
    TCheckEdit: TTimer;
    Button3: TButton;
    EDireccion: TcxTextEdit;
    ENomMarca: TcxTextEdit;
    MinfoMarca: TcxMemo;
    MInfo: TcxMemo;
    DBLCBAPotreros: TcxLookupComboBox;
    CBColorLine: TcxColorComboBox;
    CBColorShape: TcxColorComboBox;
    TCheckEvento: TTimer;
    PEventos: TPanel;
    SBEventos: TScrollBox;
    LGenerales: TJvLabel;
    LCria: TJvLabel;
    JvLabel15: TJvLabel;
    LPartos: TJvLabel;
    LSanitarios: TJvLabel;
    LServicios: TJvLabel;
    Image1: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image11: TImage;
    LTransferencia: TJvLabel;
    Image12: TImage;
    Lmovimientos: TJvLabel;
    Label1: TLabel;
    PCria: TPanel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvImage1: TJvImage;
    JvImage2: TJvImage;
    JvImage3: TJvImage;
    PGeneral: TPanel;
    JvImage4: TJvImage;
    JvImage5: TJvImage;
    JvImage6: TJvImage;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    JvImage7: TJvImage;
    JvLabel7: TJvLabel;
    JvImage8: TJvImage;
    JvLabel8: TJvLabel;
    JvImage9: TJvImage;
    JvImage10: TJvImage;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    JvLabel9: TJvLabel;
    JvImage11: TJvImage;
    JvLabel12: TJvLabel;
    JvImage12: TJvImage;
    JvLabel13: TJvLabel;
    JvImage13: TJvImage;
    PSanitario: TPanel;
    JvImage14: TJvImage;
    JvImage15: TJvImage;
    JvLabel14: TJvLabel;
    JvImage18: TJvImage;
    JvImage19: TJvImage;
    JvImage20: TJvImage;
    JvImage21: TJvImage;
    JvImage22: TJvImage;
    JvImage23: TJvImage;
    JvLabel16: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel18: TJvLabel;
    JvLabel19: TJvLabel;
    JvLabel20: TJvLabel;
    JvLabel21: TJvLabel;
    JvLabel22: TJvLabel;
    Pservicios: TPanel;
    JvImage16: TJvImage;
    JvImage26: TJvImage;
    JvImage27: TJvImage;
    JvImage28: TJvImage;
    JvImage29: TJvImage;
    JvImage30: TJvImage;
    JvImage31: TJvImage;
    LServicioNatural: TJvLabel;
    JvLabel25: TJvLabel;
    JvLabel26: TJvLabel;
    JvLabel27: TJvLabel;
    JvLabel28: TJvLabel;
    JvLabel29: TJvLabel;
    JvLabel30: TJvLabel;
    PServicioNatural: TPanel;
    JvImage25: TJvImage;
    JvImage32: TJvImage;
    JvImage33: TJvImage;
    JvImage34: TJvImage;
    JvImage35: TJvImage;
    JvLabel23: TJvLabel;
    JvLabel24: TJvLabel;
    JvLabel32: TJvLabel;
    JvLabel33: TJvLabel;
    JvLabel34: TJvLabel;
    PTransferencia: TPanel;
    JvImage37: TJvImage;
    JvImage38: TJvImage;
    JvLabel35: TJvLabel;
    JvLabel36: TJvLabel;
    PMovimientos: TPanel;
    JvImage17: TJvImage;
    JvImage24: TJvImage;
    JvLabel37: TJvLabel;
    JvLabel38: TJvLabel;
    PParto: TPanel;
    JvImage36: TJvImage;
    JvImage39: TJvImage;
    JvImage40: TJvImage;
    JvLabel39: TJvLabel;
    JvLabel40: TJvLabel;
    JvLabel41: TJvLabel;
    ISalirEves: TImage;
    LSalirEves: TLabel;
    ALEventos: TActionList;
    AEveCastracion: TAction;
    AEveDestete: TAction;
    AEveFrame: TAction;
    AEveActividad: TAction;
    AEveSuplementacion: TAction;
    AEveIdentificacion: TAction;
    AEvePeso: TAction;
    AEveReidentifica: TAction;
    AEveExamenClinico: TAction;
    AEveCalidadSemen: TAction;
    AEveCircunferencia: TAction;
    AEveCondicionCorporal: TAction;
    AEveCalidadCarne: TAction;
    AEveImportarPartosNacimientos: TAction;
    AEvePartoMasivo: TAction;
    AEveNacimientos: TAction;
    AEveTratamiento: TAction;
    AEveDiagnosticoEnfermedad: TAction;
    AEveVenereas: TAction;
    AEveSangrado: TAction;
    AEveTuberculina: TAction;
    AEveCargaVenereas: TAction;
    AEveCargaBrucelosis: TAction;
    AEveCargaTuberculina: TAction;
    AEveServicioNatural: TAction;
    AEveIngresoHembra: TAction;
    AEveIngresoToro: TAction;
    AEveEgresoHembras: TAction;
    AEveEgresoToro: TAction;
    AEveInseminacionArtificial: TAction;
    AEveServicioCorral: TAction;
    AEveDeteccionCelo: TAction;
    AEveCapacidadServicio: TAction;
    AEveEvalPreservicio: TAction;
    AEveSincroCelo: TAction;
    AEveFlushing: TAction;
    AEveTransferencia: TAction;
    AEveAltaMasiva: TAction;
    AEveCambioUbicacion: TAction;
    AEveBaja: TAction;
    JvLabel31: TJvLabel;
    JvImage41: TJvImage;
    AEveDiagnosticoGestacion: TAction;
    IUndoUP: TImage;
    LUndoUP: TLabel;
    IBQUpdateHectareas: TIBQuery;
    SBPotreros: TScrollBox;
    PGRal: TPanel;
    Image13: TImage;
    ScrollBox1: TScrollBox;
    TCheckFicha: TTimer;
    IBQCategoriasPotreros: TIBQuery;
    Mapa: TSVOGISImage;
    IBQDelAuxImpresion: TIBQuery;
    IBQInsertAuxImpresio: TIBQuery;
    IBQCoordParaImprimir: TIBQuery;
    IBQInfoParaImprimir: TIBQuery;
    IBQCategPots: TIBQuery;
    MInfoPrt: TMemo;
    PASelPotrero: TPanelAyudaHuella3;
    JvImage52: TJvImage;
    Label41: TLabel;
    JvImage53: TJvImage;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    JvImage54: TJvImage;
    Label47: TLabel;
    CheckBox4: TCheckBox;
    PASeleccionPotrero: TPanelAyudaHuella3;
    JvImage49: TJvImage;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    JvImage50: TJvImage;
    JvImage51: TJvImage;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label37: TLabel;
    Label51: TLabel;
    CheckBox3: TCheckBox;
    PAReferencia: TPanelAyudaHuella3;
    JvImage66: TJvImage;
    JvImage67: TJvImage;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Image16: TImage;
    CheckBox9: TCheckBox;
    PAPasosDib: TPanelAyudaHuella3;
    JvImage58: TJvImage;
    JvImage59: TJvImage;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label68: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Image14: TImage;
    CheckBox6: TCheckBox;
    PANuevoPot: TPanelAyudaHuella3;
    JvImage55: TJvImage;
    Label39: TLabel;
    Label52: TLabel;
    JvImage56: TJvImage;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    JvImage57: TJvImage;
    Label56: TLabel;
    CheckBox5: TCheckBox;
    PAMapaUbicacion: TPanelAyudaHuella3;
    JvImage42: TJvImage;
    JvImage43: TJvImage;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    JvImage44: TJvImage;
    Label14: TLabel;
    CheckBox2: TCheckBox;
    PAFinRef: TPanelAyudaHuella3;
    JvImage71: TJvImage;
    Label121: TLabel;
    Image17: TImage;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    JvImage70: TJvImage;
    JvImage72: TJvImage;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    CheckBox11: TCheckBox;
    PAFinalizoPot: TPanelAyudaHuella3;
    JvImage61: TJvImage;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label67: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    JvImage69: TJvImage;
    JvImage60: TJvImage;
    Image15: TImage;
    CheckBox7: TCheckBox;
    PAEleccion: TPanelAyudaHuella3;
    JvImage45: TJvImage;
    JvImage46: TJvImage;
    Label15: TLabel;
    Label16: TLabel;
    JvImage47: TJvImage;
    JvImage48: TJvImage;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    CheckBox1: TCheckBox;
    PADibMapa: TPanelAyudaHuella3;
    JvImage62: TJvImage;
    JvImage63: TJvImage;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    JvImage64: TJvImage;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    JvImage65: TJvImage;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    CheckBox8: TCheckBox;
    EDireccion2: TcxTextEdit;
    cxMObservacion: TcxMemo;
    Label17: TLabel;
    Label74: TLabel;
    Image18: TImage;
    WB: TChromium;
    TimerUpdateValues: TTimer;
    TimerFinalizar: TTimer;
    TimerCalcularSuperficie: TTimer;
    TimerFinalizaEditar: TTimer;
    IBQAnimalesActivos: TIBQuery;
    IBQAnimalesActivosACTIVO: TIBStringField;
    Label75: TLabel;
    
    procedure FormCreate(Sender: TObject);
    procedure BIrClick(Sender: TObject);
    procedure BPoligonosClick(Sender: TObject);
    procedure BMarcasClick(Sender: TObject);
    procedure BEdicionClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Click(Sender: TObject);
    procedure MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ENombreChange(Sender: TObject);
    procedure MInfoChange(Sender: TObject);
    procedure CBColorShapeChange(Sender: TObject);
    procedure CBColorLineChange(Sender: TObject);
    procedure EStrokeWChange(Sender: TObject);
    procedure EStrokeOpChange(Sender: TObject);
    procedure EFillOpChange(Sender: TObject);
    procedure TChechIDTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBLCBAPotrerosCloseUp(Sender: TObject);
    procedure TiInicTimer(Sender: TObject);
    procedure ITerminarClick(Sender: TObject);
    procedure IEliminarClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure EDireccionKeyPress(Sender: TObject; var Key: Char);
    procedure ILBReferenciasClick(Sender: TObject);
    procedure ENomMarcaChange(Sender: TObject);
    procedure MinfoMarcaChange(Sender: TObject);
    procedure TCheckIdRefTimer(Sender: TObject);
    procedure IGuardarRefClick(Sender: TObject);
    procedure ClickImg(Sender : TObject);
    procedure ClickCheckBoxPoly(Sender : TObject);
    procedure ClickCheckBoxRef(Sender : TObject);
    procedure IVolverClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvROReferenciasExpand(Sender: TObject);
    procedure JvROReferenciasCollapse(Sender: TObject);
    procedure LPotreroClick(Sender: TObject);
    procedure LPotreroMouseEnter(Sender: TObject);
    procedure LPotreroMouseLeave(Sender: TObject);
    procedure TCheckEditTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TCheckEventoTimer(Sender: TObject);
    procedure LCriaClick(Sender: TObject);
    procedure JvCriaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvGeneralMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvDiagnosticoGestacionMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvServiciosMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvServicioNaturalMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvSanitarioMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvPartoMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvTransferenciaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvMovimientosMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LGeneralesClick(Sender: TObject);
    procedure LPartosClick(Sender: TObject);
    procedure LSanitariosClick(Sender: TObject);
    procedure LServiciosClick(Sender: TObject);
    procedure LServicioNaturalClick(Sender: TObject);
    procedure LTransferenciaClick(Sender: TObject);
    procedure LmovimientosClick(Sender: TObject);
    procedure ISalirEvesClick(Sender: TObject);
    procedure AEveCastracionExecute(Sender: TObject);
    procedure AEveDesteteExecute(Sender: TObject);
    procedure AEveFrameExecute(Sender: TObject);
    procedure AEveActividadExecute(Sender: TObject);
    procedure AEveSuplementacionExecute(Sender: TObject);
    procedure AEveIdentificacionExecute(Sender: TObject);
    procedure AEvePesoExecute(Sender: TObject);
    procedure AEveReidentificaExecute(Sender: TObject);
    procedure AEveExamenClinicoExecute(Sender: TObject);
    procedure AEveCalidadSemenExecute(Sender: TObject);
    procedure AEveCircunferenciaExecute(Sender: TObject);
    procedure AEveCondicionCorporalExecute(Sender: TObject);
    procedure AEveCalidadCarneExecute(Sender: TObject);
    procedure AEveImportarPartosNacimientosExecute(Sender: TObject);
    procedure AEvePartoMasivoExecute(Sender: TObject);
    procedure AEveNacimientosExecute(Sender: TObject);
    procedure AEveTratamientoExecute(Sender: TObject);
    procedure AEveDiagnosticoEnfermedadExecute(Sender: TObject);
    procedure AEveVenereasExecute(Sender: TObject);
    procedure AEveSangradoExecute(Sender: TObject);
    procedure AEveTuberculinaExecute(Sender: TObject);
    procedure AEveCargaVenereasExecute(Sender: TObject);
    procedure AEveCargaBrucelosisExecute(Sender: TObject);
    procedure AEveCargaTuberculinaExecute(Sender: TObject);
    procedure AEveServicioNaturalExecute(Sender: TObject);
    procedure AEveIngresoHembraExecute(Sender: TObject);
    procedure AEveIngresoToroExecute(Sender: TObject);
    procedure AEveEgresoHembrasExecute(Sender: TObject);
    procedure AEveEgresoToroExecute(Sender: TObject);
    procedure AEveInseminacionArtificialExecute(Sender: TObject);
    procedure AEveServicioCorralExecute(Sender: TObject);
    procedure AEveDeteccionCeloExecute(Sender: TObject);
    procedure AEveCapacidadServicioExecute(Sender: TObject);
    procedure AEveEvalPreservicioExecute(Sender: TObject);
    procedure AEveSincroCeloExecute(Sender: TObject);
    procedure AEveFlushingExecute(Sender: TObject);
    procedure AEveTransferenciaExecute(Sender: TObject);
    procedure AEveAltaMasivaExecute(Sender: TObject);
    procedure AEveCambioUbicacionExecute(Sender: TObject);
    procedure AEveBajaExecute(Sender: TObject);
    procedure AEveDiagnosticoGestacionExecute(Sender: TObject);
    procedure TCheckFichaTimer(Sender: TObject);
    procedure JvImage43Click(Sender: TObject);
    procedure JvImage46Click(Sender: TObject);
    procedure JvImage49Click(Sender: TObject);
    procedure JvImage53Click(Sender: TObject);
    procedure JvImage55Click(Sender: TObject);
    procedure JvImage58Click(Sender: TObject);
    procedure JvImage61Click(Sender: TObject);
    procedure JvImage62Click(Sender: TObject);
    procedure JvImage66Click(Sender: TObject);
    procedure JvImage47Click(Sender: TObject);
    procedure EDireccion2PropertiesChange(Sender: TObject);
    procedure JvImage71Click(Sender: TObject);
    procedure cxMObservacionPropertiesChange(Sender: TObject);
    procedure TimerUpdateValuesTimer(Sender: TObject);
    procedure TimerFinalizarTimer(Sender: TObject);
    procedure TimerCalcularSuperficieTimer(Sender: TObject);
    procedure TimerFinalizaEditarTimer(Sender: TObject);
    procedure BorrarTablasAuxiliares();
    procedure WBLoadEnd(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; httpStatusCode: Integer);
    procedure FormDestroy(Sender: TObject);

  private
      Marcar : Boolean;
    Marca : Boolean;
    Modo : TModo;
    Puntos : TArrPuntos;
    Informacion : TArrInfo;
    colorS, colorL : String;
    WStroke, OpStroke, OpFill : String;
    Nombre, Info : String;
    id_potrero, id_aux, id_referencia, id_aux_ref: Integer;
    id_potrero_eve, id_aux_eve : Integer;
    id_potrero_ficha, id_aux_ficha : Integer;
    NomRef, InfoRef, ImgRef : String;

    /////////////////////
    Map : TMapa;
    /////////////////////
    function ImgRefIndex: Integer;
    function getValorPuntos : String;
    function getValorInfo : String;
    procedure GuardarValores;
    procedure GuardarEnBD;
    procedure CargarDatos;
    function PasarAStrnigPoligonos : String;
    function PasarAStrnigMarcas : String;
    procedure EliminarCoordenadas;
    function PasarAStrnigInformacion : String;
    procedure ArmarReferencias;
    procedure ActualizarPotrero(id_nuevo, id_anterior : Integer);
    procedure InicIndices;
    function getValorInfoRef : String;
    function PasarAStrnigInformacionRef : String;
    procedure ArmarReferenciasMarca;
    procedure InicIndiceRef;
    procedure LimpiarReferencias;
    function PotreroEnUso(id : Integer) : Boolean;
    procedure HabilitarParaEdicion(edicion : boolean);
    function getHectareas() : Double;
    procedure CambiarSuperfice(var info : String; id_pot : Integer);
    procedure ArmarReferenciasEventos;
    procedure AbrirEventos(Eve : TFEveSimple);
    procedure InicPotrerosEvento();
    procedure InicPotrerosFicha();
    function ActualizarDatosPotrero(id : Integer) : String;
    procedure ActInfoPotrero(id_potrero : Integer);
 
    procedure CargarTopImgHints(Itop: String);
    procedure CargarCenterImgHints(ICenter: String);
    procedure CargarBottomImgHints(IBottom: String);

  public
    TerminoMapa: Boolean;
    FinReferencia: Boolean;
    PotreroCreado: Boolean;
    PotrerosCreados: Boolean;
    id_potreroaux: Integer;
    // Esta variable se consulta y carga todos los valores

    procedure DibujarPotreoParaImpresion;
    procedure ArmarImagenes;
    procedure inicializarMapa();
    procedure DibujarPotreoParaImpresionGlobal(W,H : Integer; Ruta : String);
    procedure ArmarImagenesGlobal(W,H : Integer; Ruta : String);
    procedure AgregarReferencias(Tipo : Integer);
    procedure cambiarVisibilidad();
    procedure trazarInvocacionScript(jssScript , metodoInvocacion, linea : string);
    function verificaMapaHabilitado: Boolean;
    procedure FinalizarMapa;
    procedure CalcularSuperficie;
    procedure TerminarPotrero;
    procedure MostrarCartelDirecto;
  end;

var
  FMapaGoogle: TFMapaGoogle;
  traceList :TStringList = nil;
  RegistroGMap: TRegistroGMap;

implementation

{$R *.dfm}

uses
  ActiveX, UPrincipal, UMensajeHuella, UABMPotreros, UABMSimple, UDMSoftvet,
  StrUtils, USelTipoRepMapa,

  UEveNacimientos, UEveCambioUbicacion, UEveCastracion, UEveDeteccionCelo, UEveServicioNatural,
  UEveCondicionCorporal, UEveMedicionFrame, UEvePeso, UEveCalidadSeminal, UEveCapacidadServicio, UEveSuplementacion,
  UEveCircunferenciaEscrotal, UEveEgresoServicio, UEveEgresoToro, UEveIngresoServicio, UEveInseminacionArtificial, UEveIngresoToro,
  UEveServicioCorral, UEveAltaMasiva, UEveDiagnosticoGestacion, UEveDestete, UEveDiagnosticoEnfermedad,
  UEveTratamiento, UEveEnfermedadesMasivas, UEveIdentificacion, UEveEvaluacionPreservicio, UEveActividad,
  UEveBaja, UEveSincronizacionCelo, UEveFertilidadMacho, UEveRecursoForrajero, UEveCalidadCarne, UEveImportarPartosNacimientos,
  UEveCargaResultados, UEvePartoMasivo, UEveFlushing, UEveTransferenciaEmbrionaria, USelPotreroMapa,
  DateUtils;


function BuscarNodo(Node: ICefDomNode; nombre: String): ICefDomNode;
var
  element_Name : String;
  Encontrado : ICefDomNode;
begin
  // Si es nulo, no sigue:
  if not Assigned(Node) then
  begin
    BuscarNodo := nil;
    Exit;
  end;

  // Si no es nulo, lo compara, iterando por los hermanos
  repeat
    //
    if SameText(Node.ElementTagName, 'INPUT') then
    begin
      element_Name := Node.GetElementAttribute('name');
      if element_Name = nombre then
      begin
        BuscarNodo := Node;
        Exit;
      end
    end;

    if Node.HasChildren then
    begin
      Encontrado := BuscarNodo(Node.FirstChild, nombre);
      if Encontrado <> nil then
      begin
        BuscarNodo := Encontrado;
        Exit;
      end;
    end;

    Node := Node.NextSibling;
  until not Assigned(Node);
  BuscarNodo := nil;
  Exit;

end;

procedure buscarCampo(const Doc: ICefDomNode; const nombreCampo: String; var target:String);
var
  q: ICefDomNode;
begin
	  q := BuscarNodo(Doc, nombreCampo);
    if q <> nil then
    begin
      // Para los hidden, es necesario usarlo asi:
	    target := q.GetElementAttribute('value');
      // Para los text, es necesario usarlo asi:
      //target := q.GetValue;
    end;

end;

procedure DomProc(const Doc: ICefDomDocument);
var
  Raiz: ICefDomNode;

begin
    Raiz := Doc.Body;

    buscarCampo(Raiz, 'mapa_finalizado', RegistroGMap.mapa_finalizado);
    buscarCampo(Raiz, 'coordenadas',     RegistroGMap.coordenadas);
    buscarCampo(Raiz, 'info_coord',      RegistroGMap.info_coord);
    buscarCampo(Raiz, 'aux_id',          RegistroGMap.aux_id);
    buscarCampo(Raiz, 'aux_id_ref',      RegistroGMap.aux_id_ref);
    buscarCampo(Raiz, 'info_marca',      RegistroGMap.info_marca);
    buscarCampo(Raiz, 'info_marca_pe',   RegistroGMap.info_marca_pe);
    buscarCampo(Raiz, 'info_poly_pe',    RegistroGMap.info_poly_pe);
    buscarCampo(Raiz, 'area_poly',       RegistroGMap.area_poly);
    buscarCampo(Raiz, 'id_poly_eve',     RegistroGMap.id_poly_eve);
    buscarCampo(Raiz, 'id_poly_ficha',   RegistroGMap.id_poly_ficha);
    buscarCampo(Raiz, 'text_info',       RegistroGMap.text_info);
    buscarCampo(Raiz, 'text_error',      RegistroGMap.text_error);
    buscarCampo(Raiz, 'setModoNavega_finalizado',      RegistroGMap.setModoNavega_finalizado);
    buscarCampo(Raiz, 'cambios',      RegistroGMap.cambios);

     FMapaGoogle.Label75.Caption :=   ' Mapa cargado :' + ' ' +
                                     RegistroGMap.info_coord;
end;

procedure TFMapaGoogle.trazarInvocacionScript(jssScript, metodoInvocacion, linea: string);
begin
try
  traceList.Add('[' + linea+ ']' + metodoInvocacion +':'+jssScript);
  traceList.SaveToFile(extractfilePath(application.exename)+'MapaGoogleTrace.txt');
  WB.Browser.MainFrame.ExecuteJavaScript(jssScript, 'about:blank', 0);
except
  label75.Caption := 'Error al invocar jsScript '+jssScript;
end;
end;

procedure TFMapaGoogle.BorrarTablasAuxiliares();
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFMapaGoogle.AbrirEventos(Eve : TFEveSimple);
begin
  Eve.Hide;
  Eve.ConManga := True;
  Eve.ModoEve  := meMasivo;
  Eve.NomPotreroMapa := IBQPotreros.Lookup('id_potrero',id_potrero_eve,'nombre');
  Eve.IdPotreroMapa := id_potrero_eve;
  Eve.ShowModal;
  Eve.Destroy;

  ActInfoPotrero(id_potrero_eve);
  BorrarTablasAuxiliares();

end;

procedure TFMapaGoogle.FormCreate(Sender: TObject);
var

  st :TStringList;
  localHTMLStr : AnsiString;
  fileNameMapa : String;
  appPath: String;
begin
  FMapaGoogle := self;
  //Screen.HintFont.Size := 14;
  //Screen.HintFont.Name := 'Trebuchet MS';
  //Screen.HintFont.Style := [fsBold];
  if (traceList = nil) then
  begin
      traceList := TStringList.create();
  end
  else
  begin
      traceList.Clear;
  end;


  appPath :=   ExtractFilePath(Application.ExeName);
  try
    CargarBottomImgHints(appPath+'Imagenes\BottomHint.png');
    CargarCenterImgHints(appPath+'Imagenes\CenterHint.png');
    CargarTopImgHints(appPath+'Imagenes\TopHint.png');
  except
  end;
  TerminoMapa:= false;
  Marcar := true;
  Marca := false;
  Modo := mNavega;
  IBQPotreros.Close;
  IBQPotreros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotreros.Open;
  IBQPotreros.Last;
  IBQPotreros.First;
  id_aux := -1;
  id_aux_ref := -1;
  id_aux_eve := -1;
  id_potrero_eve := -1;
  id_potrero_ficha := -1;
  id_aux_ficha := -1;
  fileNameMapa := 'imagenes\mapa.html';
//  fileNameMapa := 'imagenes\mapa_working.html';

  //file:///C:/Proyecto/Huella30v2/Objetos/imagenes/mapa_working.html

  if fileExists(fileNameMapa) then
  begin
    fileNameMapa := appPath + fileNameMapa;
    fileNameMapa := StringReplace(fileNameMapa,'\','/',[rfReplaceAll]);
    WB.Load(fileNameMapa);

   st :=TStringList.create();
   st.loadfromfile(fileNameMapa);
   localHTMLStr := st.Text;
   localHTMLStr := StringReplace(localHTMLStr,#$A,'',[rfReplaceAll]);
   //localHTMLStr := StringReplace(localHTMLStr,#$D,'',[rfReplaceAll]);
   localHTMLStr := StringReplace(localHTMLStr,#$9,'',[rfReplaceAll]);
   st.Clear();
   st.Add(localHTMLStr);
   st.SaveToFile('mapa_debug.txt');
   st.destroy();
  end
  else
    localHTMLStr := '';

  try
   cargarDatos();
  except
  end;   

  LNombreEsta.Caption := FPrincipal.NombreEstablecimiento;
end;

procedure TFMapaGoogle.BIrClick(Sender: TObject);
var
   address    : string;
   jssScript : String;
begin
   address := EDireccion.Text;
   address := StringReplace(StringReplace(Trim(address), #13, ' ', [rfReplaceAll]), #10, ' ', [rfReplaceAll]);
   jssScript := Format('showAddress(%s)',[QuotedStr(address)]);
   trazarInvocacionScript(jssScript , 'BIrClick', '821');

   if Length(Puntos) = 0 then
   begin
    BEdicionClick(nil);
   end;
end;

procedure TFMapaGoogle.BPoligonosClick(Sender: TObject);
var
  F : TFSelPotreroMapa;
  jssScript : string;
begin
  InicIndices;
  if FPrincipal.AsistenteMapa then
   begin
    PAEleccion.Visible:=false;
    PASeleccionPotrero.Visible:=true;
   end;
  F := TFSelPotreroMapa.Create(self);
  F.ShowModal;
  id_potrero := F.id_potrero;
  id_potreroaux := id_potrero;
  if id_potrero <> -1 then
  begin
    IBQPotreros.Close;
    IBQPotreros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQPotreros.Open;
    DBLCBAPotreros.EditValue := id_potrero;
    DBLCBAPotrerosCloseUp(DBLCBAPotreros);
    F.Destroy;

    jssScript :=Format('startShape(%s,%s,%s,%s,%s,%s,%s,%s)',[IntToStr(id_potrero),colorL,colorS,WStroke,OpStroke,OpFill,Nombre,Info]);    trazarInvocacionScript(jssScript , 'BPoligonosClick', '852'); 

    PControles.Visible := false;
    PDatosPotrero.Visible := true;
    IEliminarP.Visible := false;
    LEliminar.Visible := false;

    PDatosPotrero.Top := PTitulo.Height+10;
    PDatosPotrero.Left := 0;
    MostrarCartelDirecto;
    end
  else
  begin
    F.Destroy;
  end;
end;

function TFMapaGoogle.getValorPuntos : String;
begin
  getValorPuntos := RegistroGMap.coordenadas;
end;

function TFMapaGoogle.getValorInfo : String;
begin
  getValorInfo := RegistroGMap.info_coord;
end;

function TFMapaGoogle.getValorInfoRef : String;
begin
  getValorInfoRef := RegistroGMap.info_marca;
end;

procedure TFMapaGoogle.BMarcasClick(Sender: TObject);
begin
  InicIndiceRef;
  PAEleccion.Visible:= false;
  if FPrincipal.AsistenteMapa then
    PAReferencia.Visible:= true;


  PControles.Visible := false;
  PRefMarcas.Visible := true;
  PRefMarcas.Top := PTitulo.Height+10;
  PRefMarcas.Left := 0;

end;

procedure TFMapaGoogle.BEdicionClick(Sender: TObject);
begin
  if Modo = mNavega then
  begin
    OpStroke := '0.5';
    OpFill := '0.5';
    WStroke := '3';
    colorL := '"#000000"';
    colorS := '"#4d7d31"';
    Nombre := '"Nombre"';
    Info := '"Informacion"';
    NomRef := '"Nombre"';
    InfoRef := '"Informacion"';
    ImgRef := '"casa"';
    TChechID.Enabled := true;
    TCheckIdRef.Enabled := true;
    
    HabilitarParaEdicion(true);
    Modo := mEdita;

    FormResize(nil);
  end;
  FinReferencia:= false;
  PAFinalizoPot.Visible:= false;
  PAFinRef.Visible:= false;
  TerminoMapa:= false;
  if FPrincipal.AsistenteMapa then
    begin
      PAEleccion.Visible:=true;
      PAMapaUbicacion.Visible:= false;
      PADibMapa.Visible:=false;
    end;
end;

procedure TFMapaGoogle.EliminarCoordenadas;
begin
  try
    IBQEliminarCoordenadas.Close;
    IBQEliminarCoordenadas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQEliminarCoordenadas.Open;
    IBQEliminarInfoMapa.Close;
    IBQEliminarInfoMapa.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQEliminarInfoMapa.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFMapaGoogle.GuardarEnBD;
var
  I : Integer;
begin
  EliminarCoordenadas;
  IBQCoordenadas.Close;
  IBQCoordenadas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCoordenadas.Open;
  for I := 0 to Length(Puntos)-1 do
  begin
    try
      IBQCoordenadas.Insert;
      IBQCoordenadas.FieldByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQCoordenadas.FieldByName('lat_decimal').AsFloat := Puntos[I].lat;
      IBQCoordenadas.FieldByName('lng_decimal').AsFloat := Puntos[I].lng;
      IBQCoordenadas.FieldByName('potrero').AsInteger := Puntos[I].indice;
      IBQCoordenadas.Post;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;

  IBQInfo.Close;
  IBQInfo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQInfo.Open;
  for i := 0 to Length(Informacion)-1 do
  begin
    try
      IBQInfo.Insert;
      IBQInfo.FieldByName('potrero').AsInteger := Informacion[i].indice;
      IBQInfo.FieldByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQInfo.FieldByName('nombre').AsString := Informacion[i].nombre;
      IBQInfo.FieldByName('info').AsString := Informacion[i].Info;
      IBQInfo.FieldByName('stroke_color').AsString := Informacion[i].StrokeColor;
      IBQInfo.FieldByName('stroke_weigth').AsString := Informacion[i].StrokeWeigth;
      IBQInfo.FieldByName('stroke_opacity').AsString := Informacion[i].StrokeOpacity;
      IBQInfo.FieldByName('fill_color').AsString := Informacion[i].FillColor;
      IBQInfo.FieldByName('fill_opacity').AsString := Informacion[i].FillOpacity;
      IBQInfo.Post;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;

end;

procedure TFMapaGoogle.GuardarValores;
var
  S, Aux : String;
  I, IndArr, K, Pot : Integer;
  lng, lat : Double;
  Inf,Nom,SC,SW,SO,FC,FO : String;
begin
  IndArr := 0;
  SetLength(Puntos,IndArr);
  K := 0;
  S := getValorPuntos;

  for I := 1 to Length(S) do
  begin
    if S[I] <> '/' then
    begin
      if S[I] <> ';' then
        Aux := Aux + S[I]
      else
      begin
        Aux := StringReplace(Aux,'.',SysUtils.DecimalSeparator,[]);
        Aux := StringReplace(Aux,',',SysUtils.DecimalSeparator,[]);
        Aux := StringReplace(Aux,';',SysUtils.DecimalSeparator,[]);
        case K of
          0 : begin Pot := StrToInt(Aux); K := 1; Aux := ''; end;
          1 : begin lat := StrToFloat(Aux); K := 2; Aux := ''; end;
          2 : begin lng := StrToFloat(Aux); K := 0; Aux := ''; end;
        end;
      end;
    end
    else
    begin
      SetLength(Puntos,IndArr+1);
      Puntos[IndArr].indice := Pot;
      Puntos[IndArr].lat := lat;
      Puntos[IndArr].lng := lng;
      Inc(IndArr);
    end;
  end;

  IndArr := 0;
  SetLength(Informacion,IndArr);
  K := 0;
  S := getValorInfo;
  for I := 1 to Length(S) do
  begin
    if S[I] <> '$' then
    begin
      if S[I] <> ';' then
        Aux := Aux + S[I]
      else
      begin
        case K of
          0 : begin Pot := StrToInt(Aux); K := 1; Aux := ''; end;
          1 : begin Nom := Aux; K := 2; Aux := ''; end;
          2 : begin Inf := Aux; K := 3; Aux := ''; end;
          3 : begin SC := Aux; K := 4; Aux := ''; end;
          4 : begin SW := Aux; K := 5; Aux := ''; end;
          5 : begin SO := Aux; K := 6; Aux := ''; end;
          6 : begin FC := Aux; K := 7; Aux := ''; end;
          7 : begin FO := Aux; K := 0; Aux := ''; end;
        end;
      end;
    end
    else
    begin
      SetLength(Informacion,IndArr+1);
      Informacion[IndArr].indice := Pot;
      Informacion[IndArr].nombre := Nom;
      //nico debo reemplazar aca la palabra pesos por el simbolo, sino mas arriba lo usa para separar
      inf := StringReplace(inf, 'pesos', '$',[rfReplaceAll]);
      Informacion[IndArr].Info := inf;
      Informacion[IndArr].StrokeColor := SC;
      Informacion[IndArr].StrokeWeigth := SW;
      Informacion[IndArr].StrokeOpacity := SO;
      Informacion[IndArr].FillColor := FC;
      Informacion[IndArr].FillOpacity := FO;
      Inc(IndArr);
    end;
  end;
  S := getValorInfoRef;
  for I := 1 to Length(S) do
  begin
    if S[I] <> '$' then
    begin
      if S[I] <> ';' then
        Aux := Aux + S[I]
      else
      begin
        case K of
          0 : begin Pot := StrToInt(Aux); K := 1; Aux := ''; end;
          1 : begin Nom := Aux; K := 2; Aux := ''; end;
          2 : begin Inf := Aux; K := 3; Aux := ''; end;
          3 : begin SC := Aux; K := 0; Aux := ''; end;
        end;
      end;
    end
    else
    begin
      SetLength(Informacion,IndArr+1);
      Informacion[IndArr].indice := Pot;
      Informacion[IndArr].nombre := Nom;
      Informacion[IndArr].Info := inf;
      Informacion[IndArr].StrokeColor := SC;
      Inc(IndArr);
    end;
  end;
end;

procedure TFMapaGoogle.ClickCheckBoxPoly(Sender : TObject);
var
  a : String;
begin
  a := IntToStr((Sender as TJvImage).Tag);
  if (Sender as TJvImage).State = stDefault then
    (Sender as TJvImage).State := stClicked1
  else
    (Sender as TJvImage).State := stDefault;

  if (Sender as TJvImage).State = stDefault then
  begin
    (Sender as TJvImage).Hint := 'Haga clic para no mostrar esta referencia en el mapa';

    trazarInvocacionScript(Format('mostrar_poly(%s)',[a]) , 'ClickCheckBoxPoly', '1173');

  end
  else
  begin
    (Sender as TJvImage).Hint := 'Haga clic para mostrar esta referencia en el mapa';
    trazarInvocacionScript(Format('ocultar_poly(%s)',[a]) , 'ClickCheckBoxPoly', '1179');

  end;
end;

procedure TFMapaGoogle.ClickCheckBoxRef(Sender : TObject);
var
  a : String;
begin
  a := IntToStr((Sender as TJvImage).Tag);
  if (Sender as TJvImage).State = stDefault then
    (Sender as TJvImage).State := stClicked1
  else
    (Sender as TJvImage).State := stDefault;

  if (Sender as TJvImage).State = stDefault then
  begin
    (Sender as TJvImage).Hint := 'Haga clic para no mostrar esta referencia en el mapa';
    trazarInvocacionScript(Format('mostrar_ref(%s)',[a]) , 'ClickCheckBoxRef', '1197');

  end
  else
  begin
    (Sender as TJvImage).Hint := 'Haga clic para mostrar esta referencia en el mapa';

    trazarInvocacionScript(Format('ocultar_ref(%s)',[a]) , 'ClickCheckBoxRef', '1204');

  end;
end;

procedure TFMapaGoogle.LimpiarReferencias;
begin
  SBReferencias.Destroy;
  SBReferencias := TScrollBox.Create(self);
  SBReferencias.Parent := PReferencias;
  SBReferencias.Name := 'SBREferencias';
  SBReferencias.Align := alClient;
  SBReferencias.BevelInner := bvNone;
  SBReferencias.BorderStyle := bsNone;
end;

function TFMapaGoogle.ActualizarDatosPotrero(id : Integer) : String;
var
  Info : String;
  CantTotal : Integer;
  HA : double;
begin
  IBQGetDatosPotreros.Close;
  IBQGetDatosPotreros.ParamByName('pot').AsInteger := id;
  IBQGetDatosPotreros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetDatosPotreros.Open;

  IBQCategoriasPotreros.Close;
  IBQCategoriasPotreros.ParamByName('p').AsInteger := id;
  IBQCategoriasPotreros.Open;

  Info := '';

  if (not IBQGetDatosPotreros.IsEmpty) and (IBQGetDatosPotreros.FieldValues['NOMBRE'] <> null) then
  begin
    if VarIsNull(IBQGetDatosPotreros.FieldValues['HS']) then
    begin
      HA := 0;
    end
    else
    begin
      HA := roundto(IBQGetDatosPotreros.FieldValues['HS'],-2);
    end;
    Info := Info + 'Potrero: '+IBQGetDatosPotreros.FieldValues['NOMBRE'];
    Info := Info + ''#$D#$A'';
    Info := Info + 'Superficie aprox. (Has.): '+floatToStr(HA)+' Has.';
    Info := Info + ''#$D#$A'';
    if IBQGetDatosPotreros.FieldValues['RECURSO'] <> null then
    begin
      Info := Info + 'Recurso Forrajero: '+IBQGetDatosPotreros.FieldValues['RECURSO'];
      Info := Info + ''#$D#$A'';
    end;
    Info := Info + 'Cab/Ha.:';
    Info := Info + ''#$D#$A'';
    Info := Info + 'Categorias:';
    Info := Info + ''#$D#$A'';
    CantTotal := 0;

    IBQCategoriasPotreros.First;
    while not IBQCategoriasPotreros.Eof do
    begin
      Info := Info + FormatFloat('#0.##',IBQCategoriasPotreros.FieldValues['CANT'])+' '+IBQCategoriasPotreros.FieldValues['CATEG']+'S '#$D#$A'';
      CantTotal := CantTotal+ IBQCategoriasPotreros.FieldValues['CANT'];
      IBQCategoriasPotreros.Next;
    end;

    IBQAnimalesActivos.Close;
    IBQAnimalesActivos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQAnimalesActivos.ParamByName('potrero').AsInteger := id;
    IbqAnimalesActivos.open;

    Info := Info + ''#$D#$A'';
    if HA > 0 then
    begin
      Info := StringReplace(Info,'Cab/Ha.:','Cab/Ha.: '+FormatFloat('#0.##',CantTotal/HA),[rfReplaceAll]) + ''#$D#$A'';
    end;

    if (IBQGetDatosPotreros.FieldValues['ULTIMO_EVE'] <> '') and (IBQAnimalesActivos.FieldValues['ACTIVO'] <> null) then
      Info := Info + 'Ultimo Evento: '+IBQGetDatosPotreros['ULTIMO_EVE'] + ''#$D#$A'';
  end;

  Result := Info;

end;

procedure TFMapaGoogle.CargarDatos;
var
  I : Integer;
  S : TShape;
  L : TLabel;

  Im : TImage;
  B : TBevel;
  Img : TJvImage;
  NextTop : Integer;
  cAuxStroke, cAuxFill : String;
  potrero: Integer;
  lat_decimal: double;
  lng_decimal: double;
begin
  LimpiarReferencias;
  I := 0;
  IBQCoordenadas.Close;
  IBQCoordenadas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCoordenadas.Open;
  IBQCoordenadas.First;
  while not IBQCoordenadas.Eof do
  begin
    potrero     :=  IBQCoordenadas.FieldValues['potrero'];
    lat_decimal := IBQCoordenadas.FieldValues['lat_decimal'];
    lng_decimal := IBQCoordenadas.FieldValues['lng_decimal'];

//    if (not puntoRepetido(potrero, lat_decimal, lng_decimal)) then
//    begin
      SetLength(Puntos,I+1);
      Puntos[I].indice := potrero;
      Puntos[I].lat := lat_decimal;
      Puntos[I].lng := lng_decimal;
      Inc(I);
//    end;
    IBQCoordenadas.Next;
  end;

  I := 0;
  IBQInfo.Close;
  IBQInfo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQInfo.Open;
  NextTop := 10;
  while not IBQInfo.Eof do
  begin
    SetLength(Informacion,I+1);
    Informacion[I].indice := IBQInfo.FieldValues['potrero'];
    Informacion[I].nombre := IBQInfo.FieldValues['nombre'];
    Informacion[I].Info := StringReplace(ActualizarDatosPotrero(IBQInfo.FieldValues['potrero']),''#$D#$A'','<br>',[rfReplaceAll]);
    Informacion[I].StrokeColor := IBQInfo.FieldValues['stroke_color'];
    if Informacion[I].indice < 5000 then
    begin
      Informacion[I].StrokeWeigth := IBQInfo.FieldValues['stroke_weigth'];
      Informacion[I].StrokeOpacity := IBQInfo.FieldValues['stroke_opacity'];
      Informacion[I].FillColor := IBQInfo.FieldValues['fill_color'];
      Informacion[I].FillOpacity := IBQInfo.FieldValues['fill_opacity'];

      cAuxStroke := StringReplace(Informacion[I].StrokeColor,'#','',[]);
      cAuxFill := StringReplace(Informacion[I].FillColor,'#','',[]);

      Img := TJvImage.Create(PReferencias);
      Img.Parent := SBReferencias;
      Img.Cursor := crHandPoint;
      Img.Picture := IAppImagen.Picture;
      Img.Pictures.PicClicked1 := IAppImagen.Pictures.PicClicked1;
      Img.AutoSize := true;
      Img.Left := 10;
      Img.Top := NextTop + 2;
      Img.Tag := Informacion[I].indice;
      Img.OnClick := ClickCheckBoxPoly;
      Img.ShowHint := true;
      Img.Hint := 'Haga clic para no mostrar esta referencia en el mapa';

      S := TShape.Create(PReferencias);
      S.Parent := SBReferencias;
      S.Brush.Color :=  RGB(StrToInt('$'+Copy(cAuxFill, 1, 2)),StrToInt('$'+Copy(cAuxFill, 3, 2)),StrToInt('$'+Copy(cAuxFill, 5, 2)));
      S.Pen.Color := RGB(StrToInt('$'+Copy(cAuxStroke, 1, 2)),StrToInt('$'+Copy(cAuxStroke, 3, 2)),StrToInt('$'+Copy(cAuxStroke, 5, 2)));
      S.Pen.Width := StrToInt(Informacion[I].StrokeWeigth);
      S.Width := 30;
      S.Height := 30;
      S.Top := NextTop;
      S.Left := Img.Left + Img.Width + 5;
      S.Tag := Informacion[I].indice;
      S.Cursor := crHandPoint;
      S.OnMouseUp := MouseUp;

      L := TLabel.Create(PReferencias);
      L.Parent := SBReferencias;
      L.Left := S.Left + S.Width + 5;
      L.Font.Name := 'Arial';
      L.Font.Size := 10;
      L.Caption := Informacion[I].nombre;
      L.Top := NextTop + 5;
      L.Tag := Informacion[I].indice;
      L.Cursor := crHandPoint;
      L.OnClick := Click;
    end
    else
    begin

      Img := TJvImage.Create(PReferencias);
      Img.Parent := SBReferencias;
      Img.Cursor := crHandPoint;
      Img.Picture := IAppImagen.Picture;
      Img.Pictures.PicClicked1 := IAppImagen.Pictures.PicClicked1;
      Img.AutoSize := true;
      Img.Left := 10;
      Img.Top := NextTop + 2;
      Img.Tag := Informacion[I].indice;
      Img.OnClick := ClickCheckBoxRef;
      Img.ShowHint := true;
      Img.Hint := 'Haga clic para no mostrar esta referencia en el mapa';

      Im := TImage.Create(PReferencias);
      Im.Parent := SBReferencias;
      Im.Left := Img.Left + Img.Width + 5;
      Im.Top := NextTop;
      Im.AutoSize := true;
      Im.Cursor := crHandPoint;
      Im.OnClick := ClickImg;
      Im.Tag := Informacion[I].indice;
      if Informacion[I].StrokeColor = 'bebedero' then
        PLReferencia.GetBitmap(0, Im.Picture.Bitmap);
      if Informacion[I].StrokeColor = 'casa' then
        PLReferencia.GetBitmap(1, Im.Picture.Bitmap);
      if Informacion[I].StrokeColor = 'entrada' then
        PLReferencia.GetBitmap(2, Im.Picture.Bitmap);
      if Informacion[I].StrokeColor = 'galpon' then
        PLReferencia.GetBitmap(3, Im.Picture.Bitmap);
      if Informacion[I].StrokeColor = 'molino' then
        PLReferencia.GetBitmap(4, Im.Picture.Bitmap);
      if Informacion[I].StrokeColor = 'casilla' then
        PLReferencia.GetBitmap(5, Im.Picture.Bitmap);
      if Informacion[I].StrokeColor = 'silos' then
        PLReferencia.GetBitmap(6, Im.Picture.Bitmap);
      if Informacion[I].StrokeColor = 'tranquera' then
        PLReferencia.GetBitmap(7, Im.Picture.Bitmap);

      L := TLabel.Create(PReferencias);
      L.Parent := SBReferencias;
      L.Left := Im.Left + Im.Width + 5;
      L.Font.Name := 'Arial';
      L.Font.Size := 10;
      L.Caption := Informacion[I].nombre;
      L.Top := NextTop + 5;
      L.Tag := Informacion[I].indice;
      L.Cursor := crHandPoint;
      L.OnClick := Click;
    end;

    B := TBevel.Create(PReferencias);
    B.Parent := SBReferencias;
    B.Shape := bsBottomLine;
    B.Height := 4;
    B.Width := SBReferencias.Width;
    B.Left := 0;
    B.Top := NextTop + 33;

    NextTop := NextTop + 40;

    Inc(I);
    IBQInfo.Next;
  end;
end;

procedure TFMapaGoogle.ClickImg(Sender: TObject);
var
  a : String;
begin
  // El tag es el ID de la imagen
  a := IntToStr((Sender as TImage).Tag);

  trazarInvocacionScript(Format('seleccion_marca(%s)',[a]) , 'ClickImg', '1440');

end;

function TFMapaGoogle.PasarAStrnigPoligonos : String;
var
  I : Integer;
  SRes : String;
  ind_ant : Integer;
begin
  SRes := '';
  if Length(Puntos)>0 then
    ind_ant := Puntos[0].indice;
  for I := 0 to Length(Puntos)-1 do
  begin
    if Puntos[i].indice < 5000 then
    begin
      if ind_ant <> Puntos[i].indice then
      begin
        SRes := SRes + '$';
        ind_ant := Puntos[i].indice;
      end;
      SRes := SRes+(IntToStr(Puntos[i].indice))+';'+(FloatToStr(Puntos[i].lat))+';'+(FloatToStr(Puntos[i].lng))+';/';
    end;
  end;
  Result := SRes;
end;

function TFMapaGoogle.PasarAStrnigInformacion : String;
var
  I : Integer;
  SRes, infoaux : String;
  ind_ant : Integer;
begin
  SRes := '';
  if Length(Informacion)>0 then
    ind_ant := informacion[0].indice;
  for I := 0 to Length(Informacion)-1 do
  begin
    if Informacion[i].indice < 5000 then
    begin
      if ind_ant <> Informacion[i].indice then
      begin
        ind_ant := Informacion[i].indice;
      end;
      infoaux := StringReplace(Informacion[i].Info, '$', 'pesos',[rfReplaceAll]);
      SRes := SRes+(IntToStr(Informacion[i].indice))+';'+Informacion[i].nombre+';'+infoaux+';'+Informacion[i].StrokeColor+';'+Informacion[i].StrokeWeigth+';'+Informacion[i].StrokeOpacity+';'+Informacion[i].FillColor+';'+Informacion[i].FillOpacity+';$';
    end;
  end;
  Result := SRes;
end;

function TFMapaGoogle.PasarAStrnigInformacionRef : String;
var
  I : Integer;
  SRes : String;
  ind_ant : Integer;
begin
  SRes := '';
  if Length(Informacion)>0 then
    ind_ant := informacion[0].indice;
  for I := 0 to Length(Informacion)-1 do
  begin
    if Informacion[i].indice >= 5000 then
    begin
      if ind_ant <> Informacion[i].indice then
      begin
        ind_ant := Informacion[i].indice;
      end;
      SRes := SRes+(IntToStr(Informacion[i].indice))+';'+Informacion[i].nombre+';'+Informacion[i].Info+';'+Informacion[i].StrokeColor+';$';
    end;
  end;
  Result := SRes;
end;

function TFMapaGoogle.PasarAStrnigMarcas : String;
var
  I : Integer;
  SRes : String;
  ind_ant : Integer;
begin
  SRes := '';
  if Length(Puntos)>0 then
    ind_ant := Puntos[0].indice;
  for I := 0 to Length(Puntos)-1 do
  begin
    if Puntos[i].indice >= 5000 then
    begin
      if ind_ant <> Puntos[i].indice then
      begin
        SRes := SRes + '$';
        ind_ant := Puntos[i].indice;
      end;
      SRes := SRes+(IntToStr(Puntos[i].indice))+';'+(FloatToStr(Puntos[i].lat))+';'+(FloatToStr(Puntos[i].lng))+';';
    end;
  end;
  Result := SRes;
end;

procedure TFMapaGoogle.inicializarMapa();
var
  DatosPoligonos, DatosMarcas, DatosInfo, DatosInfoMarcas , jssScript: String;
begin
 // Serializar los datos
  DatosPoligonos := '"'+PasarAStrnigPoligonos+'"';
  DatosMarcas := '"'+PasarAStrnigMarcas+'"';
  DatosInfo := '"'+PasarAStrnigInformacion+'"';
  DatosPoligonos := StringReplace(DatosPoligonos,SysUtils.DecimalSeparator,'.',[rfReplaceAll]);
  DatosMarcas := StringReplace(DatosMarcas,SysUtils.DecimalSeparator,'.',[rfReplaceAll]);
  DatosInfoMarcas := '"'+PasarAStrnigInformacionRef+'"';
  if Length(Puntos) = 0 then
  begin
    PotreroCreado:= false;
    PotrerosCreados:= false;
    if FPrincipal.AsistenteMapa then
    begin
     (self.Owner as TFPrincipal).PAInicioMapa.Visible:=false;
      PAMapaUbicacion.Visible:=true;
    end;
    //-- La primera vez inicia vacia
    trazarInvocacionScript(Format('inic_vacio()',[]) , 'inicializarMapa', '1559');

  end
  else
  begin
    if FPrincipal.AsistenteMapa then
    begin
      PotreroCreado:= true;
      PotrerosCreados:= true;
    end;
    // Carga el mapa con los datos leido de la BBDD
    jssScript :=Format('inic_con_shapes(%s,%s,%s,%s)',[DatosPoligonos,DatosMarcas,DatosInfo,DatosInfoMarcas]);
    trazarInvocacionScript(jssScript , 'inicializarMapa', '1571');
    HabilitarParaEdicion(false);
  end;
end;

procedure TFMapaGoogle.Button1Click(Sender: TObject);
begin
  inicializarMapa();
end;

procedure TFMapaGoogle.Click(Sender: TObject);
var
  a : String;
begin
  a := IntToStr((Sender as TLabel).Tag);
  trazarInvocacionScript(Format('seleccion(%s)',[a]) , 'Click', '1588');
end;

procedure TFMapaGoogle.MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  a : String;
begin
  a := IntToStr((Sender as TShape).Tag);
  trazarInvocacionScript(Format('seleccion(%s)',[a]) , 'MouseUp', '1598');
end;

procedure TFMapaGoogle.ENombreChange(Sender: TObject);
begin
  Nombre := '"'+ENombre.Text+'"';
end;

procedure TFMapaGoogle.MInfoChange(Sender: TObject);
begin
  Info := '"'+StringReplace(MInfo.Text,''#$D#$A'','<br>',[rfReplaceAll])+'"';
end;

procedure TFMapaGoogle.CBColorShapeChange(Sender: TObject);
begin
  colorS := '"#'+IntToHex(GetRValue(CBColorShape.ColorValue),2)+IntToHex(GetGValue(CBColorShape.ColorValue),2)+IntToHex(GetBValue(CBColorShape.ColorValue),2)+'"';
  colorS := LowerCase(colorS);
end;

procedure TFMapaGoogle.CBColorLineChange(Sender: TObject);
begin
  colorL := '"#'+IntToHex(GetRValue(CBColorLine.ColorValue),2)+IntToHex(GetGValue(CBColorLine.ColorValue),2)+IntToHex(GetBValue(CBColorLine.ColorValue),2)+'"';
  colorL := LowerCase(colorL);
end;

procedure TFMapaGoogle.EStrokeWChange(Sender: TObject);
var
  I : Integer;
begin
  EStrokeW.Text := StringReplace(EStrokeW.Text,'.',SysUtils.DecimalSeparator,[]);
  EStrokeW.Text := StringReplace(EStrokeW.Text,',',SysUtils.DecimalSeparator,[]);
  EStrokeW.Text := StringReplace(EStrokeW.Text,';',SysUtils.DecimalSeparator,[]);
  if TryStrToInt(EStrokeW.Text,I) then
    WStroke := StringReplace(EStrokeW.Text,DecimalSeparator,'.',[]);
end;

procedure TFMapaGoogle.EStrokeOpChange(Sender: TObject);
var
  d : double;
begin
  EStrokeOp.Text := StringReplace(EStrokeOp.Text,'.',SysUtils.DecimalSeparator,[]);
  EStrokeOp.Text := StringReplace(EStrokeOp.Text,',',SysUtils.DecimalSeparator,[]);
  EStrokeOp.Text := StringReplace(EStrokeOp.Text,';',SysUtils.DecimalSeparator,[]);
  if TryStrToFloat(EStrokeOp.Text,d) then
    OpStroke := StringReplace(EStrokeOp.Text,DecimalSeparator,'.',[]);
end;

procedure TFMapaGoogle.EFillOpChange(Sender: TObject);
var
  d : double;
begin
  EFillOp.Text := StringReplace(EFillOp.Text,'.',SysUtils.DecimalSeparator,[]);
  EFillOp.Text := StringReplace(EFillOp.Text,',',SysUtils.DecimalSeparator,[]);
  EFillOp.Text := StringReplace(EFillOp.Text,';',SysUtils.DecimalSeparator,[]);
  if TryStrToFloat(EFillOp.Text,d) then
    OpFill := StringReplace(EFillOp.Text,DecimalSeparator,'.',[]);
end;

procedure TFMapaGoogle.TChechIDTimer(Sender: TObject);
var
  aux: String;
begin
try
  aux := RegistroGMap.aux_id;
  id_potrero := StrToInt(aux);
except
  label75.caption :=('ID de potrero no reconocido');
end;
end;

function TFMapaGoogle.getHectareas() : Double;
var
  aux : String;
begin

  aux := RegistroGMap.area_poly;
  if aux = '' then
  begin
    getHectareas := 0;
  end
  else
  begin
      aux := StringReplace(aux,'.',DecimalSeparator,[rfReplaceAll]);
      aux := StringReplace(aux,',',DecimalSeparator,[rfReplaceAll]);
      getHectareas := StrToFloat(aux) * 0.0001;
  end;

end;

procedure TFMapaGoogle.ArmarReferencias;
var
  I : Integer;
  cAuxStroke, cAuxFill : String;
begin
  PDatosPotrero.Visible := true;
  PDatosPotrero.Top := PTitulo.Height+10;
  PDatosPotrero.Left := 0;
  PDatosPotrero.Height := WB.Height;
  PControles.Visible := false;
  for I := 0 to Length(Informacion)-1 do
  begin
    if Informacion[I].indice = id_potrero then
    begin
      DBLCBAPotreros.Properties.ListFieldIndex := id_potrero;
      IBQPotreros.Locate('id_potrero',id_potrero,[]);
      DBLCBAPotreros.Text := IBQPotreros.FieldValues['nombre'];
      colorL := '"'+Informacion[I].StrokeColor+'"';
      colorS := '"'+Informacion[I].FillColor+'"';
      cAuxStroke := StringReplace(Informacion[I].StrokeColor,'#','',[]);
      cAuxFill := StringReplace(Informacion[I].FillColor,'#','',[]);
      CBColorShape.ColorValue :=  RGB(StrToInt('$'+Copy(cAuxFill, 1, 2)),StrToInt('$'+Copy(cAuxFill, 3, 2)),StrToInt('$'+Copy(cAuxFill, 5, 2)));
      CBColorLine.ColorValue := RGB(StrToInt('$'+Copy(cAuxStroke, 1, 2)),StrToInt('$'+Copy(cAuxStroke, 3, 2)),StrToInt('$'+Copy(cAuxStroke, 5, 2)));
      EStrokeW.Text := Informacion[I].StrokeWeigth;
      EStrokeOp.Text := StringReplace(Informacion[I].StrokeOpacity,'.',DecimalSeparator,[]);
      EFillOp.Text := StringReplace(Informacion[I].FillOpacity,'.',DecimalSeparator,[]);
      ENombre.Text := StringReplace(Informacion[I].nombre,'"','',[rfReplaceAll]);
      MInfo.Text := StringReplace(Informacion[I].Info,'"','',[rfReplaceAll]);
      MInfo.Text := StringReplace(MInfo.Text,'<br>',''#$D#$A'',[rfReplaceAll]);
    end;
  end;
end;

procedure TFMapaGoogle.Button2Click(Sender: TObject);
var
  F : TFSelTipoRepMapa;
begin
  F := TFSelTipoRepMapa.Create(self,self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFMapaGoogle.ActualizarPotrero(id_nuevo, id_anterior : Integer);
var
  I : Integer;
begin
  for I := 0 to Length(Puntos)-1 do
    if Puntos[I].indice = id_anterior then
    begin
      Puntos[I].indice := id_nuevo;
      break;
    end;
  for I := 0 to Length(Informacion)-1 do
    if Informacion[I].indice = id_anterior then
    begin
      Informacion[I].indice := id_nuevo;
      break;
    end;
  TChechID.Enabled := false;
  trazarInvocacionScript(Format('act_indices(%s,%s)',[IntToStr(id_nuevo),IntToStr(id_anterior)]) , 'ActualizarPotrero', '1778');

  TChechID.Enabled := true;
end;

function TFMapaGoogle.PotreroEnUso(id : Integer) : Boolean;
var
  I : Integer;
begin
  Result := false;
  for I := 0 to Length(Puntos)-1 do
    if Puntos[I].indice = id then
    begin
      Result := true;
      break;
    end;
end;

procedure TFMapaGoogle.DBLCBAPotrerosCloseUp(Sender: TObject);
var
  CantTotal, HA : Double;
begin
  inherited;

  if DBLCBAPotreros.EditValue <> null then
  begin

    if not PotreroEnUso(DBLCBAPotreros.EditValue) then
    begin
      IBQGetDatosPotreros.Close;
      IBQGetDatosPotreros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQGetDatosPotreros.ParamByName('pot').AsInteger := DBLCBAPotreros.EditValue;
      IBQGetDatosPotreros.Open;

      IBQCategoriasPotreros.Close;
      IBQCategoriasPotreros.ParamByName('p').AsInteger := DBLCBAPotreros.EditValue;
      IBQCategoriasPotreros.Open;

      ActualizarPotrero(DBLCBAPotreros.EditValue,id_potrero);

      id_potrero := DBLCBAPotreros.EditValue;
      id_aux := id_potrero;

      ENombre.Text := DBLCBAPotreros.Text;

      MInfo.Lines.Clear;
      MInfo.Lines.Add('Potrero: '+DBLCBAPotreros.Text);
      if not IBQGetDatosPotreros.IsEmpty then
      begin
        if VarIsNull(IBQPotreros.FieldValues['hectareas']) then
           HA := 0
        else
           HA := IBQPotreros.FieldValues['hectareas'];
        Minfo.Lines.Add('');
        MInfo.Lines.Add('Superficie (Has.): '+FormatFloat('#0.##',HA));
        Minfo.Lines.Add('');
        MInfo.Lines.Add('Cab/Ha.:');
        if IBQGetDatosPotreros.FieldValues['RECURSO'] <> null then
        begin
          MInfo.Lines.Add('');
          MInfo.Lines.Add('Recurso Forrajero: '+IBQGetDatosPotreros.FieldValues['RECURSO']);
        end;
        Minfo.Lines.Add('');
        Minfo.Lines.Add('Categorias:');
        Minfo.Lines.Add('');
        CantTotal := 0;

        IBQCategoriasPotreros.First;
        while not IBQCategoriasPotreros.Eof do
        begin
          MInfo.Lines.Add(FormatFloat('#0.##',IBQCategoriasPotreros.FieldValues['CANT'])+' '+IBQCategoriasPotreros.FieldValues['CATEG']+'S');
          CantTotal := CantTotal+ IBQCategoriasPotreros.FieldValues['CANT'];
          IBQCategoriasPotreros.Next;
        end;
        Minfo.Lines.Add('');
        if HA > 0 then
        begin
          //Info := StringReplace(
          MInfo.Text := StringReplace(Minfo.Text,'Cab/Ha.:','Cab/Ha.: '+FormatFloat('#0.##',CantTotal/HA),[rfReplaceAll]) + ''#$D#$A'';
          //MInfo.Lines.Insert(MInfo.Lines.IndexOf('Cab/Ha.:'),'Cab/Ha.: '+FormatFloat('#0.##',CantTotal/HA));
        end;
        IBQAnimalesActivos.Close;
        IBQAnimalesActivos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQAnimalesActivos.ParamByName('potrero').AsInteger := id_potrero;
        IbqAnimalesActivos.open;

        if IBQGetDatosPotreros.FieldValues['ULTIMO_EVE'] <> '' then
        begin
          MInfo.Lines.Add('');
          if (IBQAnimalesActivos.FieldValues['ACTIVO'] <> null) then
              MInfo.Lines.Add('Ultimo Evento: '+IBQGetDatosPotreros.FieldValues['ULTIMO_EVE']);
        end;
      end;
    end
    else
    begin
      MostrarMensaje(tmError, 'El potrero '+DBLCBAPotreros.Text+' ya ha sido asignado');
    end;
  end;
end;

procedure TFMapaGoogle.TiInicTimer(Sender: TObject);
begin
  inherited;

  if verificaMapaHabilitado() then
  begin
    TiInic.Enabled := false;
    InicializarMapa();
    TCheckEdit.Enabled := true;
    TCheckEvento.Enabled := true;
    TCheckFicha.Enabled := true;
  end;
end;

procedure TFMapaGoogle.CambiarSuperfice(var Info : String; id_pot : Integer);
var
  has_calc : double;
  has : String;
  todo : TStringList;
  ind : Integer;

begin

  has_calc := roundto(getHectareas(),-2);
  has := floatToStr(has_calc);

  todo := TStringList.Create;
  Info := StringReplace(Info,'"','',[rfReplaceAll]);
  Info := StringReplace(Info,'<br><br><br>','<br>',[rfReplaceAll]);
  Info := StringReplace(Info,'<br><br>','<br>',[rfReplaceAll]);
  Info := StringReplace(Info,'<br>','|',[rfReplaceAll]);
  ExtractStrings(['|'],[' '],PChar(Info),todo);

  for ind := 0 to todo.Count-1 do
    if AnsiContainsStr(todo[ind],'Superficie') then
    begin
      todo[ind] := 'Superficie aprox. (Has.): '+has+' Has.';
      break;
    end;
  info := '';
  for ind := 0 to todo.Count-1 do
    info := info+todo[ind]+'|';
  Info := StringReplace(Info,'|','<br>',[rfReplaceAll]);
  Info := '"'+StringReplace(Info,'<br>','<br><br>',[rfReplaceAll])+'"';

  try
    IBQUpdateHectareas.Close;
    IBQUpdateHectareas.ParamByName('fecha').AsDate := Date();
    IBQUpdateHectareas.ParamByName('potrero').AsInteger := id_pot;
    IBQUpdateHectareas.ParamByName('superficietotal').Value := has_calc;
    IBQUpdateHectareas.ParamByName('superficieganadera').Value := has_calc;
    IBQUpdateHectareas.ParamByName('superficieagricola').Value := 0;
    IBQUpdateHectareas.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQUpdateHectareas.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

end;

procedure TFMapaGoogle.ITerminarClick(Sender: TObject);
begin
  inherited;
  if TerminoMapa then
  begin
    showMessage('Haga click en al mapa para cerrar el poligono');
  end
  else
  begin
    IEliminarP.Visible := true;
    LEliminar.Visible := true;
    id_potreroaux := id_potrero;
    // Necesito pedir el calculo de superficie antes de poder usarlo
    CalcularSuperficie();
    // Habilito la espera de respuesta
    TimerCalcularSuperficie.Enabled := true;
  end;
end;

procedure TFMapaGoogle.IEliminarClick(Sender: TObject);
begin
  inherited;
  trazarInvocacionScript(Format('remove_shape(%s)',[IntToStr(id_potrero)]) , 'IEliminarClick', '1942');

  PControles.Visible := true;
  PDatosPotrero.Visible := false;
  FormResize(nil);
  InicIndices;
  IVolverClick(nil);
end;

procedure TFMapaGoogle.InicIndices;
begin
  TChechID.Enabled := false;
  trazarInvocacionScript(Format('clear_value()',[]) , 'InicIndices', '1954');

  id_potrero := -1;
  id_aux := -1;
  ENombre.Text := 'Nombre';
  MInfo.Text := 'Información';
  DBLCBAPotreros.ClearSelection;
  CBColorLine.ColorValue := clBlack;
  CBColorShape.ColorValue := clGreen;
  EStrokeOp.Text := '0.7';
  EStrokeW.Text := '2';
  EFillOp.Text := '0.7';
  TChechID.Enabled := true;
end;

procedure TFMapaGoogle.ISalirClick(Sender: TObject);
begin
  //inherited;
  if (RegistroGMap.cambios = 'true') then
    begin
    FinalizarMapa;
    end
  else
    begin
    close;
    end;
end;

procedure TFMapaGoogle.EDireccionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
    BIrClick(BIr);
    Key:= #0;
  end;
end;

procedure TFMapaGoogle.ILBReferenciasClick(Sender: TObject);
begin
  inherited;
  case ILBReferencias.ItemIndex of
    0 : ImgRef := '"bebedero"';
    1 : ImgRef := '"casa"';
    2 : ImgRef := '"entrada"';
    3 : ImgRef := '"galpon"';
    4 : ImgRef := '"molino"';
    5 : ImgRef := '"casilla"';
    6 : ImgRef := '"silos"';
    7 : ImgRef := '"tranquera"';
  end;

  //Queda mejor aca, cada vez q hace un click en la imagen dispara placemarker
  trazarInvocacionScript(Format('placeMarker(%s,%s,%s)',[NomRef,InfoRef,ImgRef]) , 'ILBReferenciasClick', '947');

  end;

procedure TFMapaGoogle.ENomMarcaChange(Sender: TObject);
begin
  inherited;
  NomRef := '"'+ENomMarca.Text+'"';
end;

procedure TFMapaGoogle.MinfoMarcaChange(Sender: TObject);
begin
  inherited;
  InfoRef := '"'+StringReplace(MinfoMarca.Text,''#$D#$A'','<br>',[rfReplaceAll])+'"';
end;

procedure TFMapaGoogle.TCheckIdRefTimer(Sender: TObject);
var
  aux: String;
begin
try
  aux := RegistroGMap.aux_id_ref;
  id_referencia := StrToInt(aux);
  if id_referencia <> id_aux_ref then
  begin
     id_aux_ref := id_referencia;
     ArmarReferenciasMarca;
  end;
except
  label75.caption :=('ID de referencia invalido');
end;

end;

procedure TFMapaGoogle.ArmarReferenciasMarca;
var
  I : Integer;

begin
  PRefMarcas.Visible := true;
  PRefMarcas.Top := PTitulo.Height+10;
  PRefMarcas.Left := 0;
  PRefMarcas.Height := Psocalo.Top;
  PControles.Visible := false;
  for I := 0 to Length(Informacion)-1 do
  begin
    if Informacion[I].indice = id_referencia then
    begin
      ENomMarca.Text := StringReplace(Informacion[I].nombre,'"','',[rfReplaceAll]);
      MinfoMarca.Text := StringReplace(Informacion[I].Info,'"','',[rfReplaceAll]);
      MinfoMarca.Text := StringReplace(MInfo.Text,'<br>',''#$D#$A'',[rfReplaceAll]);
      if Informacion[I].StrokeColor = 'bebedero' then
        ILBReferencias.ItemIndex := 0;
      if Informacion[I].StrokeColor = 'casa' then
        ILBReferencias.ItemIndex := 1;
      if Informacion[I].StrokeColor = 'entrada' then
        ILBReferencias.ItemIndex := 2;
      if Informacion[I].StrokeColor = 'galpon' then
        ILBReferencias.ItemIndex := 3;
      if Informacion[I].StrokeColor = 'molino' then
        ILBReferencias.ItemIndex := 4;
      if Informacion[I].StrokeColor = 'casilla' then
        ILBReferencias.ItemIndex := 5;
      if Informacion[I].StrokeColor = 'silos' then
        ILBReferencias.ItemIndex := 6;
      if Informacion[I].StrokeColor = 'tranquera' then
        ILBReferencias.ItemIndex := 7;
      ImgRef := '"'+Informacion[I].StrokeColor+'"';
    end;
  end;
end;

procedure TFMapaGoogle.IGuardarRefClick(Sender: TObject);
begin
  inherited;
  PControles.Visible := true;
  PRefMarcas.Visible := false;
  FormResize(nil);
  InicIndiceRef;
  FinReferencia:=true;
  IVolverClick(nil);
  PAFinalizoPot.Visible:= false;
end;


function TFMapaGoogle.ImgRefIndex: Integer;
begin
  if ImgRef = '"bebedero"' then
    ImgRefIndex := 0;
  if ImgRef = '"casa"' then
    ImgRefIndex := 1;
  if ImgRef = '"entrada"' then
    ImgRefIndex := 2;
  if ImgRef = '"galpon"' then
    ImgRefIndex := 3;
  if ImgRef = '"molino"' then
    ImgRefIndex := 4;
  if ImgRef = '"casilla"' then
    ImgRefIndex := 5;
  if ImgRef = '"silos"' then
    ImgRefIndex := 6;
  if ImgRef = '"tranquera"' then
    ImgRefIndex := 7;
end;

procedure TFMapaGoogle.InicIndiceRef;
begin
  TCheckIdRef.Enabled := false;
  trazarInvocacionScript(Format('clear_ref()',[]) , 'InicIndiceRef', '2113');

  id_referencia := -1;
  id_aux_ref := -1;
  ENomMarca.Text := 'Nombre';
  MInfoMarca.Text := 'Información';
  ILBReferencias.ItemIndex := ImgRefIndex;
  TCheckIdRef.Enabled := true;
end;

procedure TFMapaGoogle.HabilitarParaEdicion(edicion : boolean);
begin
  TCheckEdit.Enabled := not edicion;
  TCheckEvento.Enabled := not edicion;
  TCheckFicha.Enabled := not edicion;
  IEdicion.Visible := not edicion;
  LModificar.Visible := not edicion;
  IImprimir.Visible := not edicion;
  LImprimir.Visible := not edicion;
  ISalir.Visible := not edicion;
  LSalir.Visible := not edicion;
  LRefDireccion.Visible := not edicion;
  IIr.Visible := not edicion;
  EDireccion.Visible := not edicion;
  PReferencias.Visible := not edicion;
  JvROReferencias.Visible := not edicion;
  IDibujar.Visible := edicion;
  LDibujar.Visible := edicion;
  IReferencia.Visible := edicion;
  LReferencia.Visible := edicion;
  LVolver.Visible := edicion;
  IVolver.Visible := edicion;
  if FPrincipal.AsistenteMapa and not PotreroCreado then
  begin
    PAEleccion.Visible:=true;
    PAMapaUbicacion.Visible:= false;
  end
  else
  if FPrincipal.AsistenteMapa then
    PADibMapa.Visible:=true;

  PotreroCreado:= false;
end;

procedure TFMapaGoogle.IVolverClick(Sender: TObject);
begin
  inherited;
  TChechID.Enabled := false;
  TCheckIdRef.Enabled := false;
  Modo := mNavega;
  HabilitarParaEdicion(false);

  trazarInvocacionScript(Format('SetModoNavega()',[]) , 'IVolverClick', '2165');
  TimerFinalizaEditar.Enabled := true;

end;

procedure TFMapaGoogle.FormResize(Sender: TObject);
var
  WTotal : Integer;
  LIzq : Integer;
begin
  inherited;
  PRefMarcas.Height := WB.Height;
  PDatosPotrero.Height := WB.Height;

  if Modo = mNavega then
  begin
    WTotal := (PControles.Width - (IIr.Left + IIr.Width + 16)) div 3;
    LIzq := IIr.Left + IIr.Width + 16;

    IEdicion.Left := (WTotal div 2) - (IEdicion.Width div 2) + LIzq;
    LModificar.Left := (WTotal div 2) - (LModificar.Width div 2) + LIzq;
    IImprimir.Left := (WTotal div 2) - (IImprimir.Width div 2) + LIzq + WTotal;
    LImprimir.Left := (WTotal div 2) - (LImprimir.Width div 2) + LIzq + WTotal;
    ISalir.Left := (WTotal div 2) - (ISalir.Width div 2) + LIzq + WTotal*2;
    LSalir.Left := (WTotal div 2) - (LSalir.Width div 2) + LIzq + WTotal*2;

  end;
  if Modo = mEdita then
  begin

    WTotal := (PControles.Width) div 3;
    LIzq := 0;

    IDibujar.Left := (WTotal div 2) - (IDibujar.Width div 2) + LIzq;
    LDibujar.Left := (WTotal div 2) - (LDibujar.Width div 2) + LIzq;

    LIzq := LIzq + WTotal;
    IReferencia.Left := (WTotal div 2) - (IReferencia.Width div 2) + LIzq;
    LReferencia.Left := (WTotal div 2) - (LReferencia.Width div 2) + LIzq;

    LIzq := LIzq + WTotal;
    IVolver.Left := (WTotal div 2) - (IVolver.Width div 2) + LIzq;
    LVolver.Left := (WTotal div 2) - (LVolver.Width div 2) + LIzq;
  end;

end;

procedure TFMapaGoogle.FormShow(Sender: TObject);
begin
  inherited;
  self.WindowState := wsMaximized;
  Application.ProcessMessages;
end;

procedure TFMapaGoogle.JvROReferenciasExpand(Sender: TObject);
begin
  inherited;
  JvROReferencias.Height := WB.Height;
end;

procedure TFMapaGoogle.JvROReferenciasCollapse(Sender: TObject);
begin
  inherited;
  JvROReferencias.Height := 30;
end;

procedure TFMapaGoogle.LPotreroClick(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      abm := TFABMPotreros.Create(self);
      abm.CampoRetorno := 'id_potrero';
      abm.Abrir(faAbm);
      IBQPotreros.Close;
      IBQPotreros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQPotreros.Open;
      if abm.ValorRetorno > -1 then
      begin
        DBLCBAPotreros.EditValue := abm.ValorRetorno;
        DBLCBAPotrerosCloseUp(DBLCBAPotreros);
        nroID:=-1;
      end;
    end;
end;

procedure TFMapaGoogle.LPotreroMouseEnter(Sender: TObject);
begin
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    LPotrero.Font.Color:= $00606C02;
    LPotrero.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFMapaGoogle.LPotreroMouseLeave(Sender: TObject);
begin
  inherited;
  LPotrero.Font.Color:= clWindowText;
  LPotrero.Font.Style:= [fsUnderline];
end;

procedure TFMapaGoogle.TCheckEditTimer(Sender: TObject);
var
  aux: String;
begin
try
  aux := RegistroGMap.info_poly_pe;
  if (aux = '-1') then
  begin
    id_potrero := -1
  end
  else
  begin
    id_potrero := StrToInt(aux);
    if id_potrero <> id_aux then
    begin
      id_aux := id_potrero;
      BEdicionClick(nil);
      ArmarReferencias;
      trazarInvocacionScript('document.form_mapa.info_poly_pe.value = -1;', 'TCheckEditTimer', '3554');
    end;
  end;

  aux := RegistroGMap.info_marca_pe;
  if (aux = '-1') then
  begin
    id_referencia := -1
  end
  else
  begin
    id_referencia := StrToInt(aux);
    if id_referencia <> id_aux_ref then
    begin
      id_aux_ref := id_referencia;
      BEdicionClick(nil);
      ArmarReferenciasMarca;
    end;
  end;
except
  label75.caption :=(' Error al cargar las referencias');
end;
end;

procedure TFMapaGoogle.Button3Click(Sender: TObject);
begin
  inherited;

  trazarInvocacionScript(Format('deshacerUltimoPunto(%s)',[IntToStr(id_potrero)]) , 'Button3Click', '2370');

end;

procedure TFMapaGoogle.TCheckEventoTimer(Sender: TObject);
var
  aux9: String;
begin
try
  aux9 := RegistroGMap.id_poly_eve;
  if (aux9 = '-1') then
  begin
    id_potrero_eve := -1
  end
  else
  begin
    id_potrero_eve := StrToInt(aux9);
    if id_potrero_eve <> id_aux_eve then
    begin
      //ACA desactivo el timer
      TCheckEvento.Enabled := false;

      id_aux_eve := id_potrero_eve;
      id_potreroaux := id_potrero_eve;

      ArmarReferenciasEventos;
    end;
  end;
except
on e: exception do
  label75.caption :='Error al cargar evento de potrero';
end;
end;

procedure TFMapaGoogle.ArmarReferenciasEventos;
begin
  PEventos.Visible := true;
end;

procedure TFMapaGoogle.LCriaClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := true;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  PCria.Top := PEventos.Top+LCria.Top;
  PCria.Left := LCria.Left + LCria.Width + 3;
end;

procedure TFMapaGoogle.InicPotrerosEvento;
begin
  TCheckEvento.Enabled := false;
  id_potrero_eve := -1;
  id_aux_eve := -1;
  trazarInvocacionScript(Format('clear_value_poly_eve()',[]) , 'InicPotrerosEvento', '2431');

  TCheckEvento.Enabled := true;
end;

procedure TFMapaGoogle.InicPotrerosFicha;
begin
  //lo quite, lo desactivo antes de que llamen a este procedure
  //TCheckFicha.Enabled := false;
  id_potrero_ficha := -1;
  id_aux_ficha := -1;
  trazarInvocacionScript(Format('clear_value_poly_ficha()',[]) , 'InicPotrerosFicha', '2441');

  TCheckFicha.Enabled := true;
end;

procedure TFMapaGoogle.JvCriaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PCria.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
  MostrarCartelDirecto;
end;

procedure TFMapaGoogle.JvGeneralMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PGeneral.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
  MostrarCartelDirecto;
end;

procedure TFMapaGoogle.JvDiagnosticoGestacionMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
  MostrarCartelDirecto;
end;

procedure TFMapaGoogle.JvServiciosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Pservicios.Visible := false;
  PEventos.Visible := false;
  PServicioNatural.Visible := false;
  InicPotrerosEvento;
  MostrarCartelDirecto;
end;

procedure TFMapaGoogle.JvServicioNaturalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PServicioNatural.Visible := false;
  PEventos.Visible := false;
  Pservicios.Visible := false;
  InicPotrerosEvento;
  MostrarCartelDirecto;
  end;

procedure TFMapaGoogle.JvSanitarioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PSanitario.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
  MostrarCartelDirecto;
end;

procedure TFMapaGoogle.JvPartoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PParto.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
  MostrarCartelDirecto;
end;

procedure TFMapaGoogle.JvTransferenciaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PTransferencia.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
  MostrarCartelDirecto;
end;

procedure TFMapaGoogle.JvMovimientosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PMovimientos.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
  MostrarCartelDirecto;
end;

procedure TFMapaGoogle.LGeneralesClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := true;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  PGeneral.Top := PEventos.Top+LGenerales.Top;
  PGeneral.Left := LGenerales.Left + LGenerales.Width + 3;
end;

procedure TFMapaGoogle.LPartosClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := true;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  PParto.Top := PEventos.Top+LPartos.Top;
  PParto.Left := LPartos.Left + LPartos.Width + 3;
end;

procedure TFMapaGoogle.LSanitariosClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := true;
  PTransferencia.Visible := false;
  PSanitario.Top := PEventos.Top+LSanitarios.Top;
  PSanitario.Left := LSanitarios.Left + LSanitarios.Width + 3;
end;

procedure TFMapaGoogle.LServiciosClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := true;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  Pservicios.Top := PEventos.Top+LServicios.Top;
  Pservicios.Left := LServicios.Left + LServicios.Width + 3;
end;

procedure TFMapaGoogle.LServicioNaturalClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := true;
  PServicioNatural.Visible := true;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  Pservicios.Top := PEventos.Top + LServicios.Top;
  Pservicios.Left := LServicios.Left + LServicios.Width + 3;
  PservicioNatural.Top := PEventos.Top + 175;
  PservicioNatural.Left := LServicios.Left + LServicios.Width + PEventos.Left + LServicioNatural.Width + 30;
end;

procedure TFMapaGoogle.LTransferenciaClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := true;
  PTransferencia.Top := PEventos.Top+LTransferencia.Top;
  PTransferencia.Left := LTransferencia.Left + LTransferencia.Width + 3;
end;

procedure TFMapaGoogle.LmovimientosClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := true;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  PMovimientos.Top := PEventos.Top+Lmovimientos.Top;
  PMovimientos.Left := Lmovimientos.Left + Lmovimientos.Width + 3;
end;

procedure TFMapaGoogle.ISalirEvesClick(Sender: TObject);
begin
  inherited;
  PEventos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  PSanitario.Visible := false;
  Pservicios.Visible := false;
  PTransferencia.Visible := false;
  PMovimientos.Visible := false;
  InicPotrerosEvento;
  MostrarCartelDirecto;
end;

procedure TFMapaGoogle.AEveCastracionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCastracion.Create(self));  
end;

procedure TFMapaGoogle.AEveDesteteExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveDestete.Create(self));
end;

procedure TFMapaGoogle.AEveFrameExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveMedicionFrame.Create(self));
end;

procedure TFMapaGoogle.AEveActividadExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveActividad.Create(self));
end;

procedure TFMapaGoogle.AEveSuplementacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveSuplementacion.Create(self));
end;

procedure TFMapaGoogle.AEveIdentificacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveIdentificacion.Create(self,true));
end;

procedure TFMapaGoogle.AEvePesoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEvePeso.Create(self));
end;

procedure TFMapaGoogle.AEveReidentificaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveIdentificacion.Create(self,false));
end;

procedure TFMapaGoogle.AEveExamenClinicoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveFertilidadMacho.Create(self));
end;

procedure TFMapaGoogle.AEveCalidadSemenExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCalidadSeminal.Create(self));
end;

procedure TFMapaGoogle.AEveCircunferenciaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCircunferenciaEscrotal.Create(self));
end;

procedure TFMapaGoogle.AEveCondicionCorporalExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCondicionCorporal.Create(self));
end;

procedure TFMapaGoogle.AEveCalidadCarneExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCalidadCarne.Create(self));
end;

procedure TFMapaGoogle.AEveImportarPartosNacimientosExecute(
  Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveImportarPartosNacimientos.Create(self));
end;

procedure TFMapaGoogle.AEvePartoMasivoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEvePartoMasivo.Create(self));
end;

procedure TFMapaGoogle.AEveNacimientosExecute(Sender: TObject);
var
  F : TFEveNacimientos;
begin
  inherited;

  DMSoftvet.IBQHayNacimientos.Close;
  DMSoftvet.IBQHayNacimientos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQHayNacimientos.Open;
  if (not DMSoftvet.IBQHayNacimientos.IsEmpty) then
    begin
        F := TFEveNacimientos.Create(self);
        F.id_potreroaux := id_potreroaux;
        F.ShowModal;
        F.Destroy;
        ActInfoPotrero(id_potrero_eve);
        BorrarTablasAuxiliares();
    end
  else
    MostrarMensaje(tmAdvertencia, 'No se pueden cargar nacimientos masivos porque no existen nacimientos pendientes.');

  //AbrirEventos(TFEveNacimientos.Create(self));
  //FPrincipal.AEveNacimientosExecute(self);
end;

procedure TFMapaGoogle.AEveTratamientoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveTratamiento.Create(self));
end;

procedure TFMapaGoogle.AEveDiagnosticoEnfermedadExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveDiagnosticoEnfermedad.Create(self));
end;

procedure TFMapaGoogle.AEveVenereasExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEnfermedadesMasivas.Create(self,memRaspadoToro));
end;

procedure TFMapaGoogle.AEveSangradoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEnfermedadesMasivas.Create(self,memSangradoBrucelosis));
end;

procedure TFMapaGoogle.AEveTuberculinaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEnfermedadesMasivas.Create(self,memTuberculinizacion));
end;

procedure TFMapaGoogle.AEveCargaVenereasExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCargaResultados.Create(self,memRaspadoToro));
end;

procedure TFMapaGoogle.AEveCargaBrucelosisExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCargaResultados.Create(self,memSangradoBrucelosis));
end;

procedure TFMapaGoogle.AEveCargaTuberculinaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCargaResultados.Create(self,memTuberculinizacion));
end;

procedure TFMapaGoogle.AEveServicioNaturalExecute(Sender: TObject);
var
  F : TFEveServicioNatural;
begin
  inherited;
  F := TFEveServicioNatural.Create(self);
  F.ShowModal;
  F.Destroy;
  BorrarTablasAuxiliares();
end;

procedure TFMapaGoogle.AEveIngresoHembraExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveIngresoServicio.Create(self));
end;

procedure TFMapaGoogle.AEveIngresoToroExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveIngresoToro.Create(self));
end;

procedure TFMapaGoogle.AEveEgresoHembrasExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEgresoServicio.Create(self));
end;

procedure TFMapaGoogle.AEveEgresoToroExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEgresoToro.Create(self));
end;

procedure TFMapaGoogle.AEveInseminacionArtificialExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveInseminacionArtificial.Create(self));
end;

procedure TFMapaGoogle.AEveServicioCorralExecute(Sender: TObject);
var
  F : TFEveServicioCorral;
begin
  inherited;
  F := TFEveServicioCorral.Create(self);
  F.id_potreroaux := id_potreroaux;
  F.ShowModal;
  F.Destroy;
  BorrarTablasAuxiliares();
end;

procedure TFMapaGoogle.AEveDeteccionCeloExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveDeteccionCelo.Create(self));
end;

procedure TFMapaGoogle.AEveCapacidadServicioExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCapacidadServicio.Create(self));
end;

procedure TFMapaGoogle.AEveEvalPreservicioExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEvaluacionPreservicio.Create(self));
end;

procedure TFMapaGoogle.AEveSincroCeloExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveSincronizacionCelo.Create(self));
end;

procedure TFMapaGoogle.AEveFlushingExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveFlushing.Create(self));
end;

procedure TFMapaGoogle.AEveTransferenciaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveTransferenciaEmbrionaria.Create(self));
end;

procedure TFMapaGoogle.AEveAltaMasivaExecute(Sender: TObject);
var
  F : TFEveAltaMasiva;
begin
  inherited;
  F := TFEveAltaMasiva.Create(self);
  F.DBLCBAPotrero.KeyValue := id_potrero_eve;
  F.ShowModal;
  F.Destroy;
  BorrarTablasAuxiliares();
  ActInfoPotrero(id_potrero_eve);
end;

procedure TFMapaGoogle.ActInfoPotrero(id_potrero : Integer);
var
  I : Integer;
  Comando, InfoPotreroTexto, infoaux: String;
begin
  I := 0;
  while I < Length(Informacion) do
  begin
      if (Informacion[I].indice < 5000) then
      begin
        InfoPotreroTexto := StringReplace(ActualizarDatosPotrero(Informacion[I].indice),''#$D#$A'','<br>',[rfReplaceAll]);
        Informacion[I].Info := InfoPotreroTexto;
        infoaux := StringReplace(InfoPotreroTexto, '$', 'pesos',[rfReplaceAll]);
        comando := 'act_infoEve('+IntToStr(Informacion[I].indice)+', '+'"'+InfoPotreroTexto+'"'+')';
        trazarInvocacionScript(comando, 'ActInfoPotrero', '2874');
      end;
      Inc(I);
  end;

  (*I := 0;
  while I < Length(Informacion) do
  begin
    if Informacion[I].indice = id_potrero then
      break;
    Inc(I);
  end;

  InfoPotreroTexto := StringReplace(ActualizarDatosPotrero(id_potrero),''#$D#$A'','<br>',[rfReplaceAll]);
  Informacion[I].Info := InfoPotreroTexto;
  comando := 'act_infoEve('+IntToStr(id_potrero)+', '+'"'+InfoPotreroTexto+'"'+')';
  trazarInvocacionScript(comando, 'ActInfoPotrero', '2874');
  *)
end;

procedure TFMapaGoogle.AEveCambioUbicacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCambioUbicacion.Create(self));
end;

procedure TFMapaGoogle.AEveBajaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveBaja.Create(self));
end;

procedure TFMapaGoogle.AEveDiagnosticoGestacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveDiagnosticoGestacion.Create(self));
end;

function TFMapaGoogle.verificaMapaHabilitado: Boolean;
var
  mapaHabilitado : String;
begin
  mapaHabilitado := RegistroGMap.mapa_finalizado;
  if mapaHabilitado = 'true' then
  begin
    verificaMapaHabilitado := true;
  end
  else
  begin
    verificaMapaHabilitado := false;
  end
end;

procedure TFMapaGoogle.TCheckFichaTimer(Sender: TObject);
var
  F : TFEveRecursoForrajero;
  aux: String;
begin
  aux := RegistroGMap.id_poly_ficha;
  if (aux = '-1') then
  begin
     id_potrero_ficha := -1;
  end
  else
  begin
    id_potrero_ficha := StrToInt(aux);
    if id_potrero_ficha <> id_aux_ficha then
    begin
      TCheckFicha.Enabled := false;
      id_aux_ficha := id_potrero_ficha;
      F := TFEveRecursoForrajero.Create(self);
      F.IdPotreroMapa := id_potrero_ficha;
      id_potreroaux := id_potrero_ficha;
      F.ShowModal;
      F.Destroy;
      ActInfoPotrero(id_potrero_ficha);
      InicPotrerosFicha;
      MostrarCartelDirecto;
    end;
  end;
end;

procedure TFMapaGoogle.ArmarImagenes;
var
  Mesh, Point, I : Integer;
  StrCategs : String;
  has : double;

  function HexToColor(sColor : string) : TColor;
  begin
     Result :=
       RGB(
         StrToInt('$'+Copy(sColor, 1, 2)),
         StrToInt('$'+Copy(sColor, 3, 2)),
         StrToInt('$'+Copy(sColor, 5, 2))
       ) ;
  end;
begin

  IBQPotreros.Close;
  IBQPotreros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotreros.Open;

  try
    IBQDelAuxImpresion.Close;
    IBQDelAuxImpresion.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  while not IBQPotreros.Eof do
  begin
    IBQCoordParaImprimir.Close;
    IBQCoordParaImprimir.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQCoordParaImprimir.ParamByName('pot').AsInteger := IBQPotreros.FieldValues['id_potrero'];
    IBQCoordParaImprimir.Open;

    IBQCategPots.Close;
    IBQCategPots.ParamByName('p').Value := IBQPotreros.FieldValues['id_potrero'];
    IBQCategPots.ParamByName('e').AsInteger := FPrincipal.EstablecimientoActual;
    IBQCategPots.Open;
    IBQCategPots.First;
    MInfoPrt.Lines.Clear;
    I := 0;
    StrCategs := '';
    while not IBQCategPots.Eof do
    begin
      if I >= 3 then
      begin
        I := 0;
        MInfoPrt.Lines.Add(StrCategs);
        StrCategs := '';
      end;
      StrCategs := StrCategs + ' | '+IBQCategPots.FieldValues['nom']+': '+IntToStr(IBQCategPots.FieldValues['cant'])+' | ';
      IBQCategPots.Next;
      Inc(I);
    end;
    if I in [1..3] then
      MInfoPrt.Lines.Add(StrCategs);

    if not IBQCoordParaImprimir.IsEmpty then
    begin
      IBQInfoParaImprimir.Close;
      IBQInfoParaImprimir.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQInfoParaImprimir.ParamByName('pot').AsInteger := IBQPotreros.FieldValues['id_potrero'];
      IBQInfoParaImprimir.Open;



      if VarIsNull(IBQPotreros.FieldValues['hectareas']) then
         has := 0
      else
         has := IBQPotreros.FieldValues['hectareas'];



      Mesh := 1;
      Point := 1;
      SetLength(Map.Mallas,Mesh);
      Map.Mallas[Mesh-1].Info.Nombre := IBQPotreros.FieldValues['nombre']+IntToStr(IBQPotreros.FieldValues['id_potrero']);
      Map.Mallas[Mesh-1]._Ref_Pot := IBQPotreros.FieldValues['id_potrero'];
      Map.Mallas[Mesh-1].Info.UltimoEve := IBQPotreros.FieldValues['nombre']+' - '+FormatFloat('#0.##',has)+' has.';
      //Map.Mallas[Mesh-1].Info.UltimoEve := IBQPotreros.FieldValues['nombre']+' - '+roundto(IBQPotreros.FieldValues['hectareas'],-2)+' has.';

      if IBQInfoParaImprimir.FieldValues['fill_color'] <> null then
        Map.Mallas[Mesh-1].Info.Fill := HexToColor(StringReplace(IBQInfoParaImprimir.FieldValues['fill_color'],'#','',[rfReplaceAll]));
      if IBQInfoParaImprimir.FieldValues['stroke_color'] <> null then
        Map.Mallas[Mesh-1].Info.Stroke := HexToColor(StringReplace(IBQInfoParaImprimir.FieldValues['stroke_color'],'#','',[rfReplaceAll]));

      while not IBQCoordParaImprimir.Eof do
      begin
        SetLength(Map.Mallas[Mesh-1].Puntos,Point);
        //Longitud
        Map.Mallas[Mesh-1].Puntos[Point-1].Coord.x := IBQCoordParaImprimir.FieldValues['lng_decimal'];
        //Latitud
        Map.Mallas[Mesh-1].Puntos[Point-1].Coord.y := IBQCoordParaImprimir.FieldValues['lat_decimal'];
        Point := Point+1;
        IBQCoordParaImprimir.Next;
      end;
      DibujarPotreoParaImpresion;
    end;
    IBQPotreros.Next;
  end;
end;

procedure TFMapaGoogle.DibujarPotreoParaImpresion;
var
  Mesh, Point : Integer;
  Lista : TSVOShapeList;
  Arr : TSVOShapePointArray;
  Polygon : TSVOPolygonShape;
  Img : TBitmap;
  Stream, StreamText : TStringStream;
begin
  Mapa.ClearShapes;

  for Mesh := 0 to Length(Map.Mallas) -1 do
  begin
    Arr := TSVOShapePointArray.Create(0);
    for Point := 0 to Length(Map.Mallas[Mesh].Puntos) -1 do
      Arr.AddPoint(Map.Mallas[Mesh].Puntos[Point].Coord);
    Lista := TSVOShapeList.Create;
    Mapa.AddShapeList(Lista);
    Polygon := TSVOPolygonShape.Create(nil,nil);
    Polygon.SetShape(Arr);

    Polygon.GraphicStyles.Pen.Width := 2;
    Lista.Add(Polygon);
    Lista.GraphicStyles.Assign(Polygon.GraphicStyles);
    Polygon.GraphicStyles.Brush.Style := bsSolid;
    Polygon.GraphicStyles.Brush.Color := Map.Mallas[Mesh].Info.Fill;
    Polygon.GraphicStyles.Pen.Color := Map.Mallas[Mesh].Info.Stroke;
    Polygon.GraphicStyles.Pen.Width := 3;
  end;

  Mapa.Boundary := Lista.BoundaryBox;
  Mapa.Draw;
  AgregarReferencias(0);

  if FileExists(ExtractFilePath(Application.ExeName)+Map.Mallas[0].Info.Nombre+'.bmp') then
    DeleteFile(ExtractFilePath(Application.ExeName)+Map.Mallas[0].Info.Nombre+'.bmp');

  Mapa.SaveAsBitmap(ExtractFilePath(Application.ExeName)+Map.Mallas[0].Info.Nombre+'.bmp',262,130);

  Img := TBitmap.Create;
  Stream := TStringStream.Create('');
  Img.LoadFromFile(ExtractFilePath(Application.ExeName)+Map.Mallas[0].Info.Nombre+'.bmp');
  Img.SaveToStream(Stream);

  StreamText := TStringStream.Create('');
  MInfoPrt.Lines.SaveToStream(StreamText);

  try
    IBQInsertAuxImpresio.Close;
    IBQInsertAuxImpresio.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQInsertAuxImpresio.ParamByName('pot').AsInteger := Map.Mallas[0]._Ref_Pot;
    IBQInsertAuxImpresio.ParamByName('img').AsBlob := Stream.DataString;
    IBQInsertAuxImpresio.ParamByName('info').AsBlob := StreamText.DataString;
    IBQInsertAuxImpresio.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  Img.Destroy;
  Stream.Destroy;
  StreamText.Destroy;
end;

procedure TFMapaGoogle.ArmarImagenesGlobal(W,H : Integer; Ruta : String);
var
  Mesh, Point : Integer;
  has : double;
  function HexToColor(sColor : string) : TColor;
  begin
     Result :=
       RGB(
         StrToInt('$'+Copy(sColor, 1, 2)),
         StrToInt('$'+Copy(sColor, 3, 2)),
         StrToInt('$'+Copy(sColor, 5, 2))
       ) ;
  end;
begin

  IBQPotreros.Close;
  IBQPotreros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotreros.Open;

  Mesh := 1;

  while not IBQPotreros.Eof do
  begin
    IBQCoordParaImprimir.Close;
    IBQCoordParaImprimir.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQCoordParaImprimir.ParamByName('pot').AsInteger := IBQPotreros.FieldValues['id_potrero'];
    IBQCoordParaImprimir.Open;

    if not IBQCoordParaImprimir.IsEmpty then
    begin
      IBQInfoParaImprimir.Close;
      IBQInfoParaImprimir.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQInfoParaImprimir.ParamByName('pot').AsInteger := IBQPotreros.FieldValues['id_potrero'];
      IBQInfoParaImprimir.Open;

      Point := 1;

      if VarIsNull(IBQPotreros.FieldValues['hectareas']) then
         has := 0
      else
         has := IBQPotreros.FieldValues['hectareas'];

      SetLength(Map.Mallas,Mesh);
      Map.Mallas[Mesh-1].Info.Nombre := IBQPotreros.FieldValues['nombre']+IntToStr(IBQPotreros.FieldValues['id_potrero']);
      Map.Mallas[Mesh-1]._Ref_Pot := IBQPotreros.FieldValues['id_potrero'];
      Map.Mallas[Mesh-1].Info.UltimoEve := IBQPotreros.FieldValues['nombre']+' - '+FormatFloat('#0.##',has)+' has.';

      if (IBQInfoParaImprimir.FieldValues['fill_color'] <> null) then
          Map.Mallas[Mesh-1].Info.Fill := HexToColor(StringReplace(IBQInfoParaImprimir.FieldValues['fill_color'],'#','',[rfReplaceAll]));

      if (IBQInfoParaImprimir.FieldValues['stroke_color'] <> null) then
          Map.Mallas[Mesh-1].Info.Stroke := HexToColor(StringReplace(IBQInfoParaImprimir.FieldValues['stroke_color'],'#','',[rfReplaceAll]));

      
      while not IBQCoordParaImprimir.Eof do
      begin
        SetLength(Map.Mallas[Mesh-1].Puntos,Point);
        //Longitud
        Map.Mallas[Mesh-1].Puntos[Point-1].Coord.x := IBQCoordParaImprimir.FieldValues['lng_decimal'];
        //Latitud
        Map.Mallas[Mesh-1].Puntos[Point-1].Coord.y := IBQCoordParaImprimir.FieldValues['lat_decimal'];
        Point := Point+1;
        IBQCoordParaImprimir.Next;
      end;

      Mesh := Mesh + 1;
    end;
    IBQPotreros.Next;
  end;
  DibujarPotreoParaImpresionGlobal(W,H, Ruta);
end;

procedure TFMapaGoogle.DibujarPotreoParaImpresionGlobal(W,H : Integer; Ruta : String);
var
  Mesh, Point : Integer;
  Lista : TSVOShapeList;
  Arr : TSVOShapePointArray;
  Polygon : TSVOPolygonShape;
begin
  Mapa.ClearShapes();
  for Mesh := 0 to Length(Map.Mallas) -1 do
  begin
    Arr := TSVOShapePointArray.Create(0);
    for Point := 0 to Length(Map.Mallas[Mesh].Puntos) -1 do
      Arr.AddPoint(Map.Mallas[Mesh].Puntos[Point].Coord);
    Lista := TSVOShapeList.Create;
    Lista.Source := Map.Mallas[Mesh].Info.UltimoEve;
    Mapa.AddShapeList(Lista);
    Polygon := TSVOPolygonShape.Create(nil,nil);
    Polygon.SetShape(Arr);
    Polygon.GraphicStyles.Pen.Width := 2;
    Lista.Add(Polygon);
    Lista.GraphicStyles.Assign(Polygon.GraphicStyles);
    Polygon.GraphicStyles.Brush.Style := bsSolid;
    Polygon.GraphicStyles.Brush.Color := Map.Mallas[Mesh].Info.Fill;
    Polygon.GraphicStyles.Pen.Color := Map.Mallas[Mesh].Info.Stroke;
    Polygon.GraphicStyles.Pen.Width := 3;
  end;
  
  if (Lista<>nil) then
    Mapa.Boundary := Lista.BoundaryBox;
  Mapa.Draw;
  AgregarReferencias(1);

  if FileExists(Ruta) then
    DeleteFile(Ruta);

  Mapa.SaveAsBitmap(Ruta,W,H);
end;

procedure TFMapaGoogle.AgregarReferencias(Tipo : Integer);
var
  Figura, I : integer;
   Punto : TSVOPointShape;
  Lista : TSVOShapeList;
  DP : TDoublePoint;

begin
  Lista := TSVOShapeList.Create;
  Lista.Source := 'Nombres';
  Mapa.AddShapeList(Lista);
  I := 0;
  for Figura := 0 to Mapa.ShapeLists.Count-1 do
   if (Mapa.ShapeList[Figura].ShapeType = stPolygon) then
   begin
    DP := Mapa.ShapeList[Figura].ShapeAsPolygon[0].Centroid;
    Punto := TSVOPointShape.Create(Lista);
    Punto.SetShape(DP);
    Punto.Labels.Create;
    if Tipo = 0 then
      Punto.Labels.Caption := Map.Mallas[I].Info.UltimoEve
    else
      Punto.Labels.Caption := Mapa.ShapeList[Figura].Source;
    Punto.Labels.Font.Name := 'Arial';
    Punto.Labels.Font.Size := 8;
    Punto.Labels.Font.Style := [];
    Punto.GraphicStyles.Pen.Width := 1;
    Punto.GraphicStyles.Pen.Color := Map.Mallas[I].Info.Fill;
    Punto.GraphicStyles.Brush.Color := Map.Mallas[I].Info.Fill;
    Punto.Tag := -10;
    Punto.DrawLabel(Mapa.Canvas,Mapa.ScaleParams);
    Lista.GraphicStyles.Assign(Punto.GraphicStyles);
    inc(I);
    end;
  Mapa.Draw;
end;
{
TO DELETE ?
procedure TFMapaGoogle.RotateBitmap(OrigBmp: TBitmap; Angle: real; DestBmp: TBitmap);
var
  ang, sinang, cosang, xori, yori, xrot, yrot, dx, dy : extended;
  i, j : integer;
  tmpbmp : TBitmap;
begin
 tmpbmp := TBitmap.Create;
 try
  tmpbmp.Width := OrigBmp.Width;
  tmpbmp.Height := OrigBmp.Height;
  tmpbmp.PixelFormat := OrigBmp.PixelFormat;
  ang := DegToRad(Angle);
  dx := (OrigBmp.Width-1) / 2;
  dy := (OrigBmp.Height-1) / 2;
  SinCos(ang, sinang, cosang);
  for i := 0 to tmpbmp.Height -1 do
  begin
    for j := 0 to tmpbmp.Width - 1 do
    begin
      xori := j - dx;
      yori := i - dy;
      xrot := (xori * cosang) - (yori * sinang);
      yrot := (xori * sinang) + (yori * cosang);
      xrot := xrot + dx;
      yrot := yrot + dy;
      tmpbmp.Canvas.Pixels[j, i] :=
      OrigBmp.Canvas.Pixels[Round(xrot), Round(yrot)];
    end;
  end;
  DestBmp.Assign(tmpbmp);
 finally
  tmpbmp.Free;
 end;
end;
}
procedure TFMapaGoogle.JvImage43Click(Sender: TObject);
begin
  inherited;
  PAMapaUbicacion.Visible:=false;
end;

procedure TFMapaGoogle.JvImage46Click(Sender: TObject);
begin
  inherited;
  PAEleccion.Visible:=False;  
end;

procedure TFMapaGoogle.JvImage49Click(Sender: TObject);
begin
  inherited;
  PASeleccionPotrero.Visible:=false;
end;

procedure TFMapaGoogle.JvImage53Click(Sender: TObject);
begin
  inherited;
  PASelPotrero.Visible:= false;
end;

procedure TFMapaGoogle.cambiarVisibilidad();
begin
    PASeleccionPotrero.Visible:=false;
    PASelPotrero.Visible:= true;
end;

procedure TFMapaGoogle.JvImage55Click(Sender: TObject);
begin
  inherited;
  PANuevoPot.Visible:=false;  
end;

procedure TFMapaGoogle.JvImage58Click(Sender: TObject);
begin
  inherited;
  PAPasosDib.Visible:=false;
end;

procedure TFMapaGoogle.JvImage61Click(Sender: TObject);
begin
  inherited;
  PAFinalizoPot.Visible:=false;
end;

procedure TFMapaGoogle.JvImage62Click(Sender: TObject);
begin
  inherited;
  PADibMapa.Visible:= false; 
end;

procedure TFMapaGoogle.JvImage66Click(Sender: TObject);
begin
  inherited;
  PAReferencia.Visible:= false;
end;

procedure TFMapaGoogle.JvImage47Click(Sender: TObject);
begin
  inherited;
  BPoligonos.Click;
end;

procedure TFMapaGoogle.CargarTopImgHints(Itop: String);
begin
   PADibMapa.AsignarTop(ITop);
   PAEleccion.AsignarTop(ITop);
   PAFinalizoPot.AsignarTop(ITop);
   PAFinRef.AsignarTop(ITop);
   PAMapaUbicacion.AsignarTop(ITop);
   PANuevoPot.AsignarTop(ITop);
   PAPasosDib.AsignarTop(ITop);
   PAReferencia.AsignarTop(ITop);
   PASeleccionPotrero.AsignarTop(ITop);
   PASelPotrero.AsignarTop(ITop);
end;


procedure TFMapaGoogle.CargarCenterImgHints(ICenter: String);
begin
   PADibMapa.AsignarCenter(ICenter);
   PAEleccion.AsignarCenter(ICenter);
   PAFinalizoPot.AsignarCenter(ICenter);
   PAFinRef.AsignarCenter(ICenter);
   PAMapaUbicacion.AsignarCenter(ICenter);
   PANuevoPot.AsignarCenter(ICenter);
   PAPasosDib.AsignarCenter(ICenter);
   PAReferencia.AsignarCenter(ICenter);
   PASeleccionPotrero.AsignarCenter(ICenter);
   PASelPotrero.AsignarCenter(ICenter);
end;


procedure TFMapaGoogle.CargarBottomImgHints(IBottom: String);
begin
   PADibMapa.AsignarBottom(Ibottom);
   PAEleccion.AsignarBottom(Ibottom);
   PAFinalizoPot.AsignarBottom(Ibottom);
   PAFinRef.AsignarBottom(Ibottom);
   PAMapaUbicacion.AsignarBottom(Ibottom);
   PANuevoPot.AsignarBottom(Ibottom);
   PAPasosDib.AsignarBottom(Ibottom);
   PAReferencia.AsignarBottom(Ibottom);
   PASeleccionPotrero.AsignarBottom(Ibottom);
   PASelPotrero.AsignarBottom(Ibottom);
end;

procedure TFMapaGoogle.EDireccion2PropertiesChange(Sender: TObject);
begin
  inherited;
  EDireccion.Text := EDireccion2.Text;
end;

procedure TFMapaGoogle.JvImage71Click(Sender: TObject);
begin
  inherited;
  PAFinRef.Visible := false;
end;

procedure TFMapaGoogle.cxMObservacionPropertiesChange(Sender: TObject);
begin
  inherited;
  Info := StringReplace(info,'"','',[rfReplaceAll]);
  Info := '"'+Info + '<br>'+ StringReplace(cxMObservacion.Text,''#$D#$A'','<br>',[rfReplaceAll])+'<br>"';
end;

procedure TFMapaGoogle.TimerUpdateValuesTimer(Sender: TObject);
begin
  inherited;
   WB.browser.SendProcessMessage(PID_RENDERER,
    TCefProcessMessageRef.New('visitdom'));

end;

procedure TFMapaGoogle.FinalizarMapa;
begin
  PAFinalizoPot.Visible := false;
  (self.Owner as TFPrincipal).PAInicioMapa.Visible:=false;
  FPrincipal.AsistenteMapa := false;

  trazarInvocacionScript(Format('SetModoNavega()',[]) , 'IVolverClick', '2165');

  TimerFinalizar.Enabled := true;
  TCheckEdit.Enabled     := false;
  TCheckEvento.Enabled   := false;
  TCheckFicha.Enabled    := false;
end;

procedure TFMapaGoogle.TimerFinalizarTimer(Sender: TObject);
begin
  inherited;

  if (RegistroGMap.setModoNavega_finalizado = 'true') then
  begin
    Label75.Caption := 'Preparando datos para mostrar';
    //Una vez que entra, lo pongo en false sino a veces se generaban ciclos
    TimerFinalizar.Enabled := false;
    GuardarValores();
    GuardarEnBD();
    CargarDatos();
    close;
    Label75.Caption := 'Datos cargados';
  end
  else
    begin
    ShowMessage('setModoNavega_finalizado es falso');
    end;
end;

procedure TFMapaGoogle.MostrarCartelDirecto;
begin
  trazarInvocacionScript(Format('MostrarCartelDirecto(%s)',[IntToStr(id_potreroaux)]) , 'nm', '13');
end;

procedure TFMapaGoogle.TerminarPotrero;
begin
  TerminoMapa := true;
  if FPrincipal.AsistenteMapa then
  	PAFinalizoPot.Visible:= true;

  CambiarSuperfice(Info,id_potrero);

  trazarInvocacionScript(Format('act_shape(%s,%s,%s,%s,%s,%s,%s,%s)',[IntToStr(id_potrero),colorS,colorL,WStroke,OpStroke,OpFill,Nombre,Info]) , 'inicializarMapa', '1930');

  PControles.Visible := true;
  PDatosPotrero.Visible := false;
  FormResize(nil);
  InicIndices;
  IVolverClick(nil);
  MostrarCartelDirecto;
end;

procedure TFMapaGoogle.CalcularSuperficie;
begin
    trazarInvocacionScript(Format('obtenerArea(%s)',[IntToStr(id_potrero)]) ,
        'CalcularSuperficie', '3514');
end;

procedure TFMapaGoogle.TimerCalcularSuperficieTimer(Sender: TObject);
begin
  inherited;
  // Si ya se calculo el area
  if RegistroGMap.area_poly <> '-1' then
  begin
    TerminarPotrero;
    TimerCalcularSuperficie.Enabled := false;
    trazarInvocacionScript('document.form_mapa.area_poly.value = -1;', 'inicializarMapa', '1930');
  end;


end;

procedure TFMapaGoogle.TimerFinalizaEditarTimer(Sender: TObject);
begin
  inherited;

  if RegistroGMap.setModoNavega_finalizado = 'true' then
  begin
    //nico cambio a falso, asi no vuelve a entrar aca
	  TimerFinalizaEditar.Enabled := false;
    Label75.caption := 'Preparando datos para mostrar';
    GuardarValores();
    GuardarEnBD();
    CargarDatos();

	  if  FPrincipal.AsistenteMapa and TerminoMapa then
		begin
		 PAMapaUbicacion.Visible:=false;
		 PAEleccion.Visible:=false;
		 PASeleccionPotrero.Visible:=false;
		 PASelPotrero.Visible:=false;
		 PAPasosDib.Visible:=false;
		 PAReferencia.Visible:= false;
		 PAFinalizoPot.Visible:=true;
		end;

	  if FPrincipal.AsistenteMapa and FinReferencia then
		begin
		 PAMapaUbicacion.Visible:=false;
		 PAEleccion.Visible:=false;
		 PASeleccionPotrero.Visible:=false;
		 PASelPotrero.Visible:=false;
		 PAPasosDib.Visible:=false;
		 PAReferencia.Visible:= false;
		 PAFinRef.Visible:=true;
		end;

	  if FPrincipal.AsistenteMapa and (not(TerminoMapa)) and (not(FinReferencia)) and (not(PotrerosCreados))then
	  begin
		  PAMapaUbicacion.Visible:=true;
		  PAEleccion.Visible:=false;
		  PASeleccionPotrero.Visible:=false;
		  PASelPotrero.Visible:=false;
		  PAPasosDib.Visible:=false;
		  PAFinalizoPot.Visible:=false;
		  PAReferencia.Visible:= false;
	  end;

	  if FPrincipal.AsistenteMapa and (not(TerminoMapa)) and (not(FinReferencia)) and PotrerosCreados then
	  begin
		  PAMapaUbicacion.Visible:=false;
		  PAEleccion.Visible:=false;
		  PASeleccionPotrero.Visible:=false;
		  PASelPotrero.Visible:=false;
		  PAPasosDib.Visible:=false;
		  PAFinalizoPot.Visible:=false;
		  PAReferencia.Visible:= false;
		  PADibMapa.Visible:= true;
	  end;

	  FormResize(nil);
    trazarInvocacionScript('document.form_mapa.setModoNavega_finalizado.value = ''false'';', 'TimerFinalizaEditarTimer', '3554');
     Label75.caption := 'Datos OK';
  end;

end;

procedure TFMapaGoogle.WBLoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  httpStatusCode: Integer);
begin
  inherited;
  TimerUpdateValues.Enabled := true;
end;

function TCustomRenderProcessHandler.OnProcessMessageReceived(
  const browser: ICefBrowser; sourceProcess: TCefProcessId;
  const message: ICefProcessMessage): Boolean;
begin
  if (message.Name = 'visitdom') then
    begin
      RegistroGMap.text_error := '... a verificar ...';
      browser.MainFrame.VisitDomProc(  domProc);
    end
  else
    Result := False;
end;

procedure TCustomRenderProcessHandler.OnWebKitInitialized;
begin
{$IFDEF DELPHI14_UP}
  TCefRTTIExtension.Register('app', TTestExtension);
{$ENDIF}
end;

procedure TFMapaGoogle.FormDestroy(Sender: TObject);
begin
try
  wb.Browser.StopLoad();
  self.timerUpdateValues.enabled := false;
  self.TCheckEvento.enabled := false;
  self.TCheckFicha.enabled := false;
  self.TimerFinalizar.enabled := false;
  self.timerCalcularSuperficie.enabled := false;
  self.TChechId.enabled := false;
  self.TCheckIdRef.enabled := false;
  self.TiInic.enabled := false;
  self.TCheckEdit.enabled := false;
except

end;
end;

initialization
  CefRemoteDebuggingPort := 9000;
  CefRenderProcessHandler := TCustomRenderProcessHandler.Create;
  CefBrowserProcessHandler := TCefBrowserProcessHandlerOwn.Create;



end.
