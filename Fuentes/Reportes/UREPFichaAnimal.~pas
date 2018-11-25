unit UREPFichaAnimal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  EditAuto, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, ValEdit, ImgList,
  Menus, UEveSimple, UFunctions, IBStoredProc, DataExport, DataToXLS, WinXP,
  AdvPicture, ThumbnailList, Spin, FileCtrl, jpeg, AppEvnts, UMensajeImpresora,
  Mask, Types, JvFullColorSpaces, JvFullColorCtrls, StrUtils, DBCtrls,
  UDBLookupComboBoxAuto, IniLang2, PngImage, JvGIF, JvExExtCtrls,
  JvExtComponent, JvCaptionPanel, JvComponentBase, JvgHint, JvExControls,
  JvLabel, TeEngine, Series, TeeProcs, Chart, PngImageList, AdvMenus,
  JvMenus, UFrameGrafico, JvPanel, JvImage;


type
  TArrayPointer = ^TArrayStoreProcedure;

  TGraphType = (gtBitmap, gtIcon, gtMetafile, gtJpeg);

  TRegDatosArbol = record
    Dato : TArrayPointer;
    Nodo : TTreeNode;
  end;

  TArrayStoreProcedure = record
    id_animal : integer;
    nombre : string;
    apodo : string;
    raza : integer;
    externo : string;
    madre : string;
    id_rp : string;
    id_senasa : string;
    id_hba : string;
    id_pc : string;
    id_ra : string;
    id_otro : string;
    padres_de : integer;
    nivel_arbol : integer;
  end;

  TFREPFichaAnimal = class(TFUniversal)

    PBotones: TPanel;
    ARepPreviewReporte: TAction;
    PCFichaAnimal: TPageControl;
    TSBasicos: TTabSheet;
    LabelNacimiento: TLabel;
    LabelSexo: TLabel;
    LabelPeso: TLabel;
    LabelCategoria: TLabel;
    LabelRaza: TLabel;
    IBQAnimales: TIBQuery;
    DSAnimales: TDataSource;
    TSIdenficadores: TTabSheet;
    LabelIDSenasa: TLabel;
    LabelIDPC: TLabel;
    LabelIDHBA: TLabel;
    LabelIDRA: TLabel;
    LabelIDOtro: TLabel;
    PanelEventos: TPanel;
    GBListaEventos: TGroupBox;
    DBGEventos: TDBGrid;
    IBQConsultaEventos: TIBQuery;
    DSConsultaEventos: TDataSource;
    LabelEstado: TLabel;
    LabelFechaAlta: TLabel;
    LabelTipoAlta: TLabel;
    LabelEdad: TLabel;
    LabelPrecioCompra: TLabel;
    IBQAlta: TIBQuery;
    IBQGetArbol: TIBQuery;
    IBQAux: TIBQuery;
    TSTV: TTabSheet;
    TVArbolGenea: TTreeView;
    ImageTree: TImageList;
    DataSource1: TDataSource;
    GBDatosAnimalSeleccionado: TGroupBox;
    LabelGeneaRP: TLabel;
    LabelGeneaPC: TLabel;
    LabelGeneaHBA: TLabel;
    LabelGeneaRA: TLabel;
    LabelGeneaOtro: TLabel;
    LabelGeneaRaza: TLabel;
    AEveAborto: TAction;
    AEveBaja: TAction;
    AEveCalidadSeminal: TAction;
    AEveCambioUbicacion: TAction;
    AEveCapacidadServicio: TAction;
    AEveCastracion: TAction;
    AEveCircunferenciaEscrotal: TAction;
    AEveCondicionCorporal: TAction;
    AEveDestete: TAction;
    AEveDeteccionCelo: TAction;
    AEveDiagnosticoEnfermedad: TAction;
    AEveDiagnosticoGestacion: TAction;
    AEveEgresoServicio: TAction;
    AEveEgresoToro: TAction;
    AEveEvaluacionPreservicio: TAction;
    AEveFertilidadMacho: TAction;
    AEveIdentificacion: TAction;
    AEveIngresoServicio: TAction;
    AEveIngresoToro: TAction;
    AEveMedicionFrame: TAction;
    AEveParto: TAction;
    AEvePeso: TAction;
    AEveSincronizacionCelo: TAction;
    AEveTratamiento: TAction;
    AEveInseminacionArtificial: TAction;
    IBQRNs: TIBQuery;
    AVerFichaEvento: TAction;
    LabelGeneaRPValue: TLabel;
    LabelGeneaPCValue: TLabel;
    LabelGeneaHBAValue: TLabel;
    LabelGeneaRAValue: TLabel;
    LabelGeneaOtroValue: TLabel;
    LabelGeneaRazaValue: TLabel;
    LabelRazaValue: TLabel;
    LabelNacimientoValue: TLabel;
    LabelEdadValue: TLabel;
    LabelPesoValue: TLabel;
    LabelSexoValue: TLabel;
    LabelCategoriaValue: TLabel;
    LabelEstadoActual: TLabel;
    LabelFechaAltaValue: TLabel;
    LabelPrecioCompraValue: TLabel;
    LabelTipoAltaValue: TLabel;
    LabelIDSenasaValue: TLabel;
    LabelIDPCValue: TLabel;
    LabelIDHBAValue: TLabel;
    LabelIDRAValue: TLabel;
    LabelIDOtroValue: TLabel;
    ALFichaAnimal: TActionList;
    ACSalir: TAction;
    ARepImprimirReporte: TAction;
    ARepPreviewReportePedigree: TAction;
    ACEliminarEvento: TAction;
    AEveRaspadoToros: TAction;
    AEveReidentificacion: TAction;
    AEveSangradoBrucelosis: TAction;
    AEveTuberculinizacion: TAction;
    IBQEliminarEvento: TIBQuery;
    IBQEliminarEventoMJE: TIBStringField;
    IBQConsultaEventosFECHA: TDateField;
    IBQConsultaEventosTIPOEVENTO: TIBStringField;
    IBQConsultaEventosINFOEVENTO: TIBStringField;
    IBQConsultaEventosRESPONSABLE: TIBStringField;
    IBQConsultaEventosCATEGORIAEVENTO: TIBStringField;
    IBQConsultaEventosID_CATEGORIA: TIntegerField;
    IBQConsultaEventosEVENTO: TIntegerField;
    IBQConsultaEventosDISPARADOR: TIBStringField;
    IBQBorrado: TIBQuery;
    AEveCargaBrucelosis: TAction;
    AEveCargaTuberculina: TAction;
    AEveCargaVenereas: TAction;
    Label1: TLabel;
    LabelPotreroValue: TLabel;
    Label3: TLabel;
    LabelRodeoValue: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelCronoValue: TLabel;
    LabelEstadoL: TLabel;
    LabelEstadoLactacion: TLabel;
    IBQConsultaEventosIDTIPOEVENTO: TIntegerField;
    AcRemoverRechazo: TAction;
    IBQQuitarRechazo: TIBQuery;
    LDtaIngreso: TLabel;
    LDtaValueIngreso: TLabel;
    LDtaEgreso: TLabel;
    LDtaValueEgreso: TLabel;
    LDigVerif: TLabel;
    Ldigito: TLabel;
    IBQPesoAnimal: TIBQuery;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label6: TLabel;
    CBMostrarDescripcion: TCheckBox;
    SpinEdit1: TSpinEdit;
    CBMultiColumnas: TCheckBox;
    APPreview: TAdvPicture;
    BBAyuda: TBitBtn;
    BBImprimirReporte: TBitBtn;
    BPedigree: TBitBtn;
    BBXls: TBitBtn;
    BBModificar: TBitBtn;
    BQuitarRechazo: TButton;
    BAgregarEvento: TBitBtn;
    BEliminar: TBitBtn;
    BBSalir: TBitBtn;
    PMPedigree: TPopupMenu;
    ReportedePedigree1: TMenuItem;
    ReporteIndividual1: TMenuItem;
    ODFotos: TOpenDialog;
    BBAgregarFoto: TBitBtn;
    IBQAgregarFoto: TIBQuery;
    IBQGetIdImagen: TIBQuery;
    IBQImagen: TIBQuery;
    BBEliminarFoto: TBitBtn;
    IBQEliminarFoto: TIBQuery;
    IBQAltaNacimientos: TIBQuery;
    ApplicationEvents1: TApplicationEvents;
    AEveCalidadCarne: TAction;
    TabSheet2: TTabSheet;
    IBQDEPS: TIBQuery;
    DSDeps: TDataSource;
    IBQRegDep: TIBQuery;
    DSRegDep: TDataSource;
    Panel3: TPanel;
    BBModificarDep: TBitBtn;
    BBImprimirDeps: TBitBtn;
    Panel2: TPanel;
    PArgentina: TPanel;
    Shape1: TShape;
    LAnio: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    LHBA: TLabel;
    LNombre: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Shape19: TShape;
    LNombreAnimalDEP: TLabel;
    LHBADEP: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    LNombrePadreDEP: TLabel;
    LNombreMadreDEP: TLabel;
    LAnioNacDEP: TLabel;
    EADEPGest: TEditAuto;
    EAPrecGest: TEditAuto;
    EADEPNacer: TEditAuto;
    EAPrecNacer: TEditAuto;
    EADEPDest: TEditAuto;
    EAPrecDest: TEditAuto;
    EADEPLeche: TEditAuto;
    EAPrecLeche: TEditAuto;
    EADEPFinal: TEditAuto;
    EAPrecFinal: TEditAuto;
    EADEPCE: TEditAuto;
    EAPrecCE: TEditAuto;
    EADEPAltura: TEditAuto;
    EAPrecAltura: TEditAuto;
    EADEPEGD: TEditAuto;
    EAPrecEGD: TEditAuto;
    EADEPEGC: TEditAuto;
    EAPrecEGC: TEditAuto;
    EADEPAOB: TEditAuto;
    EAPrecAOB: TEditAuto;
    EADEPPorcGI: TEditAuto;
    EAPrecPorcGI: TEditAuto;
    EADEPPorcCM: TEditAuto;
    EAPrecPorcCM: TEditAuto;
    EACrias: TEditAuto;
    EARodeo: TEditAuto;
    PUruguay: TPanel;
    Shape20: TShape;
    LAnioUruguay: TLabel;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Shape24: TShape;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Shape29: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Shape38: TShape;
    LHBUDEP: TLabel;
    LRPUruguay: TLabel;
    LRP: TLabel;
    LNacimientoUruguay: TLabel;
    Label101: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label56: TLabel;
    Shape39: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Shape43: TShape;
    Label57: TLabel;
    Label61: TLabel;
    Label64: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Label69: TLabel;
    LNombreDepUruguay: TLabel;
    EADEPPN: TEditAuto;
    EAPrecPN: TEditAuto;
    EADEPPD: TEditAuto;
    EAPrecPD: TEditAuto;
    EADEPHL: TEditAuto;
    EAPrecHL: TEditAuto;
    EADEPCEUru: TEditAuto;
    EAPrecCEUru: TEditAuto;
    EADEPP18: TEditAuto;
    EAPrecP18: TEditAuto;
    EADEPEGCUru: TEditAuto;
    EAPrecEGCUru: TEditAuto;
    EADEPAOBUru: TEditAuto;
    EAPrecAOBUru: TEditAuto;
    EANhijU: TEditAuto;
    EANhijM: TEditAuto;
    EANhij: TEditAuto;
    EACodigoProp: TEditAuto;
    EACriador: TEditAuto;
    Panel4: TPanel;
    Label7: TLabel;
    EAAnio: TEditAuto;
    UDAnio: TUpDown;
    AEveActividad: TAction;
    LabelIE: TLabel;
    LabelIDIEValue: TLabel;
    AEveSuplementacion: TAction;
    BBGuardar: TBitBtn;
    BBCancelar: TBitBtn;
    IBQSPImportarDeps: TIBQuery;
    AEveFlushing: TAction;
    AEveTransferenciaEmbrionaria: TAction;
    IBQPadres: TIBQuery;
    DSQPadres: TDataSource;
    IBQEstaAnimal: TIBQuery;
    IBQConsultaEventosESTABLECIMIENTO: TIntegerField;
    IBQEstabAnimalExt: TIBQuery;
    TSObservacion: TTabSheet;
    MObservacion: TMemo;
    Label51: TLabel;
    Label73: TLabel;
    LabelPropietario: TLabel;
    LPropietario1: TLabel;
    IBQObservacion: TIBQuery;
    IBQConsultaEventosORDEN: TIntegerField;
    IBQFechaBaja: TIBQuery;
    DSQFechaBaja: TDataSource;
    IBQFuenteDeps: TIBQuery;
    DSFuentesDeps: TDataSource;
    IBQRazaAnimal: TIBQuery;
    IBQInsertarFuenteDeps: TIBQuery;
    IBQDEPsAnimal: TIBQuery;
    IBQEliminarFuenteDEP: TIBQuery;
    PFuenteDeps: TPanel;
    DBLCBAFuenteDeps: TDBLookupComboBoxAuto;
    LFuente: TLabel;
    IBQArbolAux: TIBQuery;
    PNavega: TPanel;
    SBAnterior: TSpeedButton;
    SBSiguiente: TSpeedButton;
    IBQListadoAnimales: TIBQuery;
    LAnterior: TLabel;
    LSiguiente: TLabel;
    Label76: TLabel;
    EARP: TEditAuto;
    LabelSubcategoria: TLabel;
    LabelSubcategoriaValue: TLabel;
    Label79: TLabel;
    LabelCodigoManejoValue: TLabel;
    LNroFolioValue: TLabel;
    LNroFolio: TLabel;
    LLinea: TLabel;
    LLineaValue: TLabel;
    IBQPropietarios: TIBQuery;
    DSPropietarios: TDataSource;
    LPropietario2: TLabel;
    LPropietario3: TLabel;
    LPropietario4: TLabel;
    LPropietario5: TLabel;
    PGenea5: TPanel;
    LAnimal: TLabel;
    InfP: TLabel;
    InfM: TLabel;
    InfPM: TLabel;
    InfPP: TLabel;
    InfPPP: TLabel;
    InfPPM: TLabel;
    InfPPPP: TLabel;
    InfPPPM: TLabel;
    InfPPMP: TLabel;
    InfPPMM: TLabel;
    InfPMP: TLabel;
    InfPMPP: TLabel;
    InfPMPM: TLabel;
    InfPMM: TLabel;
    InfPMMP: TLabel;
    InfPMMM: TLabel;
    InfMM: TLabel;
    InfMP: TLabel;
    InfMPP: TLabel;
    InfMPM: TLabel;
    InfMMP: TLabel;
    InfMMM: TLabel;
    InfMMMM: TLabel;
    InfMMMP: TLabel;
    InfMMPM: TLabel;
    InfMMPP: TLabel;
    InfMPMM: TLabel;
    InfMPMP: TLabel;
    InfMPPM: TLabel;
    InfMPPP: TLabel;
    ImSexo: TImageList;
    IP: TImage;
    IM: TImage;
    IPP: TImage;
    IPM: TImage;
    IMP: TImage;
    IMM: TImage;
    IPPP: TImage;
    IPPM: TImage;
    IPMP: TImage;
    IPMM: TImage;
    IMPP: TImage;
    IMPM: TImage;
    IMMP: TImage;
    IMMM: TImage;
    IPPPP: TImage;
    Image17: TImage;
    IPPPM: TImage;
    IPPMP: TImage;
    IPPMM: TImage;
    IPMPP: TImage;
    IPMPM: TImage;
    IPMMP: TImage;
    IMPPP: TImage;
    IMPPM: TImage;
    IMPMP: TImage;
    IMPMM: TImage;
    IMMPP: TImage;
    IMMPM: TImage;
    IMMMP: TImage;
    IMMMM: TImage;
    IPMMM: TImage;
    Shape28: TShape;
    Shape44: TShape;
    Shape45: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Shape49: TShape;
    Shape50: TShape;
    Shape51: TShape;
    Shape52: TShape;
    Shape53: TShape;
    Shape54: TShape;
    Shape55: TShape;
    Shape56: TShape;
    Shape57: TShape;
    Shape58: TShape;
    Shape59: TShape;
    Shape60: TShape;
    Shape61: TShape;
    Shape62: TShape;
    Shape63: TShape;
    Shape64: TShape;
    Shape65: TShape;
    Shape66: TShape;
    BGenealogiaCompleta: TButton;
    Shape67: TShape;
    Shape68: TShape;
    Shape69: TShape;
    Shape70: TShape;
    LMocho: TLabel;
    LMochoValue: TLabel;
    LInspeccion: TLabel;
    LInspeccionValue: TLabel;
    LDestino: TLabel;
    LDestinoValue: TLabel;
    IFondoB: TImage;
    IPreview: TImage;
    IExcel: TImage;
    IAyuda: TImage;
    IAgregaEve: TImage;
    IEliminarEve: TImage;
    ISalir: TImage;
    IPedigree: TImage;
    LAyuda: TLabel;
    LPreview: TLabel;
    LPedigree: TLabel;
    LExcel: TLabel;
    LAgEvento: TLabel;
    LEliminaEve: TLabel;
    LSalir: TLabel;
    IModifAnimales: TImage;
    LmodifAnimal: TLabel;
    IQuitarRechazo: TImage;
    LQuitarRechazo: TLabel;
    JvCPHint: TJvCaptionPanel;
    LFecha: TJvLabel;
    LTipoE: TJvLabel;
    LDesc: TJvLabel;
    TPanel: TTimer;
    Image5: TImage;
    LabelRP: TLabel;
    LabelRPValue: TLabel;
    LabelNombre: TLabel;
    LabelNombreValue: TLabel;
    PPedigree: TPanel;
    Image1: TImage;
    IRepPedigree: TImage;
    IRepIndividual: TImage;
    LRepPedigree: TJvLabel;
    LRepIndividual: TJvLabel;
    LabelNombreAnimal: TLabel;
    LabelNombreAnimalValue: TLabel;
    IBQAnioParaDeps: TIBQuery;
    IDisPed: TImage;
    JvSeleccionImagen: TJvCaptionPanel;
    THLAnimales: TThumbnailList;
    BBSeleccionFoto: TBitBtn;
    IAgregaFoto: TImage;
    IELiminaFOto: TImage;
    ISelFoto: TImage;
    LAgregaFoto: TLabel;
    LEliminaFoto: TLabel;
    LSelFoto: TLabel;
    PFotoFiltro: TPanel;
    GBReferencias: TGroupBox;
    JvFCLGeneral: TJvFullColorLabel;
    JvFCLEstablecimiento: TJvFullColorLabel;
    JvFCLCriaRecria: TJvFullColorLabel;
    JvFCLInvernada: TJvFullColorLabel;
    JvFCLServicio: TJvFullColorLabel;
    JvFCLGestacion: TJvFullColorLabel;
    JvFCLPartoNacimiento: TJvFullColorLabel;
    JvFCLSanitario: TJvFullColorLabel;
    JvFCLOtroEstable: TJvFullColorLabel;
    CBGeneral: TCheckBox;
    CBEstablecimiento: TCheckBox;
    CBCriaRecria: TCheckBox;
    CBInvernada: TCheckBox;
    CBServicios: TCheckBox;
    CBGestacion: TCheckBox;
    CBPartoNac: TCheckBox;
    CBSanitario: TCheckBox;
    CBOtroEstab: TCheckBox;
    APFoto: TAdvPicture;
    LTipSang: TLabel;
    LTipSangValue: TLabel;
    IModificar: TImage;
    IImprimirHistorico: TImage;
    IGuardar: TImage;
    ICancelDeps: TImage;
    LModifValores: TLabel;
    LImprimir: TLabel;
    LGuardar: TLabel;
    LCancelar: TLabel;
    LColor: TLabel;
    LColorValue: TLabel;
    LColorGenea: TLabel;
    LColorGeneaValue: TLabel;
    PngImageList1: TPngImageList;
    PListaEventos: TPanel;
    LActividad: TLabel;
    LAborto: TLabel;
    LBaja: TLabel;
    LCalidadSeminal: TLabel;
    LCalidadCarne: TLabel;
    LCambioUbicacion: TLabel;
    LCapacidadServicio: TLabel;
    LCargaResultadosBrucelosis: TLabel;
    LCargaResultadosTuberculina: TLabel;
    LCargaResultadosVenereas: TLabel;
    LCastracion: TLabel;
    LCircunferenciaEscrotal: TLabel;
    LColectaEmbriones: TLabel;
    LCondicionCorporal: TLabel;
    LDestete: TLabel;
    LDeteccionCelo: TLabel;
    LDiagnosticoEnfermedad: TLabel;
    LDiagnosticoGestacion: TLabel;
    LDistocia: TLabel;
    LEgresoServicio: TLabel;
    LEgresoToro: TLabel;
    LEvaluacionPreservicio: TLabel;
    LExamenClinicoMacho: TLabel;
    LIdentificacion: TLabel;
    LIngresoServicio: TLabel;
    LIngresoToro: TLabel;
    LInseminacionArtificial: TLabel;
    LMedicionFrame: TLabel;
    LMuestreoTorosVenereas: TLabel;
    LParto: TLabel;
    LPeso: TLabel;
    LReidentificacion: TLabel;
    LSangradoBrucelosis: TLabel;
    LServiciocorral: TLabel;
    LSincronizacionCelo: TLabel;
    LSuplementacion: TLabel;
    LTransferenciaEmbrionaria: TLabel;
    LTratamiento: TLabel;
    LTuberculinizacion: TLabel;
    TPanelEventos: TTimer;
    AEveServicioCorral: TAction;
    IFondoListaEve: TImage;
    TimerLector: TTimer;
    PILIconosEventos: TPngImageList;
    JvPMEventos: TJvPopupMenu;
    Cria2: TMenuItem;
    Generales2: TMenuItem;
    Castracin1: TMenuItem;
    Destete3: TMenuItem;
    Actividad2: TMenuItem;
    Identificacin3: TMenuItem;
    MedicindeFrame3: TMenuItem;
    Gestacin3: TMenuItem;
    Peso3: TMenuItem;
    Reidentificacin3: TMenuItem;
    MuestreodeTorosporVenreas2: TMenuItem;
    CircunferenciaEscrotal3: TMenuItem;
    CondicinCorporal3: TMenuItem;
    SincronizacindeCelo3: TMenuItem;
    CalidaddeCarne3: TMenuItem;
    Alimentacin2: TMenuItem;
    DiagnsticodeGestacin3: TMenuItem;
    Movimientos2: TMenuItem;
    Baja3: TMenuItem;
    CambiodeUbicacin3: TMenuItem;
    PartosNacimientos2: TMenuItem;
    Parto3: TMenuItem;
    Sanitarios2: TMenuItem;
    ratamiento3: TMenuItem;
    DiagnsticodeEnfermedad3: TMenuItem;
    MuestreodeTorosporVenreas3: TMenuItem;
    SangradoporBrucelosis3: TMenuItem;
    uberculinizacin3: TMenuItem;
    CargadeResultadosBrucelosis4: TMenuItem;
    CargadeResultadosTuberculina3: TMenuItem;
    CargadeResultadosTuberculina4: TMenuItem;
    Servicios2: TMenuItem;
    IngresoaServicio3: TMenuItem;
    IngresodeToro2: TMenuItem;
    EgresodeServicio3: TMenuItem;
    EgresodeServicio4: TMenuItem;
    InseminacinArtificial3: TMenuItem;
    DeteccindeCelo3: TMenuItem;
    Aborto1: TMenuItem;
    EvaluacindePreservicio3: TMenuItem;
    ransferenciaEmbrionaria4: TMenuItem;
    ColeccindeEmbriones3: TMenuItem;
    ransferenciaEmbrionaria5: TMenuItem;
    TSCargaFenotipos: TTabSheet;
    PDatos: TPanel;
    PGraficoFicha: TPanel;
    Panel6: TPanel;
    ICargaFenotipos: TImage;
    Label80: TLabel;
    IBQFenotiposSinteticos: TIBQuery;
    IBQGetEscala: TIBQuery;
    IBDSAuxGraficos: TIBDataSet;
    IBDSAuxGraficosID_ANIMAL: TIntegerField;
    IBDSAuxGraficosIMG_GRA: TBlobField;
    IBQGetImgGrafico: TIBQuery;
    ICMG: TImage;
    JvLCMG: TJvLabel;
    PArgentinaBrangus: TPanel;
    Shape71: TShape;
    Label81: TLabel;
    Shape72: TShape;
    Shape73: TShape;
    Shape74: TShape;
    Label85: TLabel;
    Label88: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Shape75: TShape;
    Shape76: TShape;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Shape77: TShape;
    Shape78: TShape;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Shape79: TShape;
    Shape80: TShape;
    Shape81: TShape;
    Shape83: TShape;
    Shape84: TShape;
    Shape85: TShape;
    Shape87: TShape;
    Shape88: TShape;
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
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Shape89: TShape;
    LDepNombreAnimalBrangus: TLabel;
    LDepHbaAnimalBrangus: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    LDepNombrePadreBrangus: TLabel;
    LDepNombreMadreBrangus: TLabel;
    LDepNacAnimalBrangus: TLabel;
    EADEPAptitudBran: TEditAuto;
    EAPRECAptitudBran: TEditAuto;
    EADEPPesoNacBran: TEditAuto;
    EAPRECPesoNacBran: TEditAuto;
    EADEPPesoDestBran: TEditAuto;
    EAPRECPesoDestBran: TEditAuto;
    EADEPLecheBran: TEditAuto;
    EditAuto8: TEditAuto;
    EADEPPesoFinalBran: TEditAuto;
    EAPRECPesoFinalBran: TEditAuto;
    EADEPCEBran: TEditAuto;
    EAPRECCEBran: TEditAuto;
    EditAuto13: TEditAuto;
    EditAuto14: TEditAuto;
    EADEPGDBran: TEditAuto;
    EAPRECGDBran: TEditAuto;
    EADEPGCBran: TEditAuto;
    EAPRECGCBran: TEditAuto;
    EADEPAOBBran: TEditAuto;
    EAPRECAOBBran: TEditAuto;
    EADEPGIBran: TEditAuto;
    EAPRECGIBran: TEditAuto;
    EditAuto23: TEditAuto;
    EditAuto24: TEditAuto;
    EACriasBran: TEditAuto;
    EARodeoBran: TEditAuto;
    PArgentinaBraford: TPanel;
    Shape82: TShape;
    Label139: TLabel;
    Shape86: TShape;
    Shape90: TShape;
    Shape91: TShape;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Shape92: TShape;
    Shape93: TShape;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Shape94: TShape;
    Shape95: TShape;
    Label152: TLabel;
    Shape96: TShape;
    Shape97: TShape;
    Shape98: TShape;
    Shape99: TShape;
    Shape100: TShape;
    Shape101: TShape;
    Shape102: TShape;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    Label166: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    Label176: TLabel;
    Shape104: TShape;
    LDepNombreAnimalBraford: TLabel;
    LDepHbaAnimalBraford: TLabel;
    Label179: TLabel;
    Label180: TLabel;
    LDepNombrePadreBraford: TLabel;
    LDepNombreMadreBraford: TLabel;
    LDepNacAnimalBraford: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    Label188: TLabel;
    EADEPAptitudBraf: TEditAuto;
    EAPRECAptitudBraf: TEditAuto;
    EADEPPesoNacBraf: TEditAuto;
    EAPRECPesoNacBraf: TEditAuto;
    EADEPPesoDestBraf: TEditAuto;
    EAPRECPesoDestBraf: TEditAuto;
    EADEPLecheBraf: TEditAuto;
    EditAuto9: TEditAuto;
    EADEPPesoFinalBraf: TEditAuto;
    EAPRECPesoFinalBraf: TEditAuto;
    EADEPCEBraf: TEditAuto;
    EAPRECCEBraf: TEditAuto;
    EditAuto16: TEditAuto;
    EditAuto17: TEditAuto;
    EditAuto18: TEditAuto;
    EditAuto19: TEditAuto;
    EditAuto20: TEditAuto;
    EditAuto21: TEditAuto;
    EditAuto22: TEditAuto;
    EditAuto25: TEditAuto;
    EditAuto26: TEditAuto;
    EditAuto27: TEditAuto;
    EditAuto28: TEditAuto;
    EditAuto29: TEditAuto;
    EACriasBraford: TEditAuto;
    EARodeoBraford: TEditAuto;
    Shape105: TShape;
    Label189: TLabel;
    LDepApodoAnimalBraford: TLabel;
    Label177: TLabel;
    LDepAbaAnimalBraford: TLabel;
    PArgentinaHereford: TPanel;
    Shape103: TShape;
    Shape116: TShape;
    Label132: TLabel;
    Shape117: TShape;
    Shape118: TShape;
    Label133: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label178: TLabel;
    Label181: TLabel;
    Shape119: TShape;
    Label183: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label193: TLabel;
    Label194: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    Label201: TLabel;
    Label202: TLabel;
    Label203: TLabel;
    LDEPNombreAnimalHereford: TLabel;
    LDEPHbaAnimalHereford: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    LDepNombrePadreHereford: TLabel;
    Label209: TLabel;
    LDEPFechaNacAnimalHereford: TLabel;
    Label211: TLabel;
    Label212: TLabel;
    Label213: TLabel;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label224: TLabel;
    Label225: TLabel;
    Label226: TLabel;
    Label227: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    Label231: TLabel;
    Label232: TLabel;
    Label233: TLabel;
    Label234: TLabel;
    EADEPLMHereford: TEditAuto;
    EAPRECLMHereford: TEditAuto;
    EADEPPAHereford: TEditAuto;
    EAPRECPAHereford: TEditAuto;
    EADEPPFHereford: TEditAuto;
    EAPRECPFHereford: TEditAuto;
    EADEPLecheHereford: TEditAuto;
    EADEPProgHereford: TEditAuto;
    EADEPAOBHereford: TEditAuto;
    EAPRECAOBHereford: TEditAuto;
    EADEPGDHereford: TEditAuto;
    EAPRECGDHereford: TEditAuto;
    EADEPRodeosHereford: TEditAuto;
    EditAuto32: TEditAuto;
    EditAuto33: TEditAuto;
    EditAuto34: TEditAuto;
    EditAuto35: TEditAuto;
    EditAuto36: TEditAuto;
    EADEPPDHereford: TEditAuto;
    EAPRECPDHereford: TEditAuto;
    EADEPPNHereford: TEditAuto;
    EAPRECPNHereford: TEditAuto;
    EADEPCEHereford: TEditAuto;
    EAPRECCEHereford: TEditAuto;
    EADEPHijasHereford: TEditAuto;
    EADEPProgEco: TEditAuto;
    PArgentinaBrahman: TPanel;
    Shape106: TShape;
    Label182: TLabel;
    Shape122: TShape;
    Label204: TLabel;
    Label205: TLabel;
    Label210: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    Label223: TLabel;
    Label235: TLabel;
    Label236: TLabel;
    Shape125: TShape;
    Label237: TLabel;
    Label238: TLabel;
    Label239: TLabel;
    Label240: TLabel;
    Label241: TLabel;
    Label242: TLabel;
    Label243: TLabel;
    Label244: TLabel;
    Label245: TLabel;
    Label246: TLabel;
    Label247: TLabel;
    Label248: TLabel;
    Label249: TLabel;
    LDepNombreAnimalBrahman: TLabel;
    LDepHbaAnimalBrahman: TLabel;
    LDepNacAnimalBrahman: TLabel;
    Label257: TLabel;
    Label258: TLabel;
    Label259: TLabel;
    Label260: TLabel;
    Label261: TLabel;
    Label262: TLabel;
    Label263: TLabel;
    Label264: TLabel;
    Label267: TLabel;
    Label268: TLabel;
    Label269: TLabel;
    Label270: TLabel;
    Label271: TLabel;
    Label272: TLabel;
    Label273: TLabel;
    Label274: TLabel;
    Label275: TLabel;
    Label276: TLabel;
    Label277: TLabel;
    Label278: TLabel;
    Label279: TLabel;
    Label280: TLabel;
    EADEPAptitudBrahman: TEditAuto;
    EAPRECAptitudBrahman: TEditAuto;
    EADEPPesoNacerBrahman: TEditAuto;
    EAPRECPesoNacerBrahman: TEditAuto;
    EADEPPesoDestBrahman: TEditAuto;
    EAPRECPesoDestBrahman: TEditAuto;
    EADEPLecheBrahman: TEditAuto;
    EditAuto10: TEditAuto;
    EADEPPesoFinalBrahman: TEditAuto;
    EAPRECPesoFinalBrahman: TEditAuto;
    EADEPCEBrahman: TEditAuto;
    EAPRECCEBrahman: TEditAuto;
    EditAuto31: TEditAuto;
    EditAuto37: TEditAuto;
    EditAuto38: TEditAuto;
    EditAuto39: TEditAuto;
    EditAuto40: TEditAuto;
    EditAuto41: TEditAuto;
    EditAuto42: TEditAuto;
    EditAuto43: TEditAuto;
    EditAuto44: TEditAuto;
    EditAuto45: TEditAuto;
    EditAuto46: TEditAuto;
    EditAuto47: TEditAuto;
    EADEPCriasBrahman: TEditAuto;
    EADEPCabaniasBrahman: TEditAuto;
    Shape121: TShape;
    Shape107: TShape;
    Shape108: TShape;
    Shape109: TShape;
    Shape110: TShape;
    Shape111: TShape;
    Shape112: TShape;
    Shape113: TShape;
    Shape114: TShape;
    Shape115: TShape;
    Shape120: TShape;
    Shape123: TShape;
    Shape124: TShape;
    Shape127: TShape;
    Shape128: TShape;
    PArgentinaShorthorn: TPanel;
    Shape126: TShape;
    Label208: TLabel;
    Shape129: TShape;
    Label250: TLabel;
    Label251: TLabel;
    Label252: TLabel;
    Label254: TLabel;
    LDepNombreAnimalShorthorn: TLabel;
    Shape132: TShape;
    Shape133: TShape;
    Label256: TLabel;
    Label265: TLabel;
    Label266: TLabel;
    Label281: TLabel;
    Label282: TLabel;
    Label283: TLabel;
    Label284: TLabel;
    Label285: TLabel;
    Shape134: TShape;
    Shape135: TShape;
    Label286: TLabel;
    Label287: TLabel;
    Label288: TLabel;
    Label289: TLabel;
    Shape136: TShape;
    Shape137: TShape;
    Shape138: TShape;
    Shape139: TShape;
    Shape140: TShape;
    Shape141: TShape;
    Shape142: TShape;
    Shape143: TShape;
    Shape144: TShape;
    Shape145: TShape;
    Label290: TLabel;
    Label291: TLabel;
    Label292: TLabel;
    Label293: TLabel;
    Label294: TLabel;
    Label295: TLabel;
    Label296: TLabel;
    Label297: TLabel;
    Label298: TLabel;
    Label299: TLabel;
    Label300: TLabel;
    Label301: TLabel;
    Label302: TLabel;
    Label303: TLabel;
    Label304: TLabel;
    Label305: TLabel;
    Label306: TLabel;
    Label307: TLabel;
    Label308: TLabel;
    Label309: TLabel;
    Label310: TLabel;
    Label311: TLabel;
    Label312: TLabel;
    Label313: TLabel;
    Label314: TLabel;
    LDepHbaAnimalShorthorn: TLabel;
    Label316: TLabel;
    Label317: TLabel;
    LDepPadreAnimalShorthorn: TLabel;
    LDepMadreAnimalShorthorn: TLabel;
    LDepAnioNacAnimalShorthorn: TLabel;
    EADEPGestShorthorn: TEditAuto;
    EAPRECGestShorthorn: TEditAuto;
    EADEPNacerShorthorn: TEditAuto;
    EAPRECNacerShorthorn: TEditAuto;
    EADEPDestShorthorn: TEditAuto;
    EAPRECDestShorthorn: TEditAuto;
    EADEPLecheShorthorn: TEditAuto;
    EAPRECLecheShorthorn: TEditAuto;
    EADEPFinalShorthorn: TEditAuto;
    EAPRECFinalShorthorn: TEditAuto;
    EADEPCEShorthorn: TEditAuto;
    EAPRECCEShorthorn: TEditAuto;
    EADEPAlturaShorthorn: TEditAuto;
    EAPRECAlturaShorthorn: TEditAuto;
    EADEPEGDShorthorn: TEditAuto;
    EAPRECEGDShorthorn: TEditAuto;
    EADEPEGCShorthorn: TEditAuto;
    EAPRECEGCShorthorn: TEditAuto;
    EADEPAOBShorthorn: TEditAuto;
    EAPRECAOBShorthorn: TEditAuto;
    EADEPPorcGIShorthorn: TEditAuto;
    EAPRECPorcGIShorthorn: TEditAuto;
    EADEPPorcCMShorthorn: TEditAuto;
    EAPRECPorcCMShorthorn: TEditAuto;
    EADEPCriasShorthorn: TEditAuto;
    EADEPRodeoShorthorn: TEditAuto;
    Shape130: TShape;
    Shape131: TShape;
    Shape146: TShape;
    Shape147: TShape;
    JvPanelDeps: TJvPanel;
    Shape148: TShape;
    Aborto2: TMenuItem;
    AEveExtraccionSemen: TAction;
    CalidadSeminal1: TMenuItem;
    ExtraccindeSemen1: TMenuItem;
    IHExtrac: TImage;
    LHExtract: TLabel;
    Button1: TButton;
    IMasEventos: TImage;
    LMasEventos: TLabel;
    IMenosEventos: TImage;
    LMenosEventos: TLabel;
    IBQCategorias: TIBQuery;
    AEveCambioCategoria: TAction;
    CambiodeCategora1: TMenuItem;
    ILVets: TImageList;
    LADN: TLabel;
    LADNValue: TLabel;
    LSubcategorizacion: TLabel;
    LSubcategorizacionValue: TLabel;
    IBQSubcategorizacion: TIBQuery;
    IBQObservacionLarga: TIBQuery;

    //******************************************************//
    //	INCIDENCIA: 408									                    //
    //	INICIO Declaración componentes AFIP.                //
    //	Carla Gareis							              04/12/2014  //
    //******************************************************//
    LabelAfip: TLabel;
    LabelAfipValue: TLabel;
    LDeclaracionAfip: TLabel;
    DeclaracionAfip: TMenuItem;
    AEveDeclaracionAfip: TAction;
    IBQAgregado: TIBQuery;
    //******************************************************//
    //	INCIDENCIA: 408									                    //
    //	FIN Declaración componentes AFIP.                   //
    //	Carla Gareis							              04/12/2014  //
    //******************************************************//

    procedure ACSalirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TVArbolGeneaChange(Sender: TObject; Node: TTreeNode);
    procedure ARepImprimirReporte1Execute(Sender: TObject);
    procedure DBGEventosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ARepPreviewReportePedigree1Execute(Sender: TObject);
    procedure SBPopupEventosClick(Sender: TObject);
    procedure AEveAbortoExecute(Sender: TObject);
    procedure AEveBajaExecute(Sender: TObject);
    procedure AEveCalidadSeminalExecute(Sender: TObject);
    procedure AEveCambioUbicacionExecute(Sender: TObject);
    procedure AEveCapacidadServicioExecute(Sender: TObject);
    procedure AEveCastracionExecute(Sender: TObject);
    procedure AEveCircunferenciaEscrotalExecute(Sender: TObject);
    procedure AEveCondicionCorporalExecute(Sender: TObject);
    procedure AEveDesteteExecute(Sender: TObject);
    procedure AEveDeteccionCeloExecute(Sender: TObject);
    procedure AEveDiagnosticoEnfermedadExecute(Sender: TObject);
    procedure AEveDiagnosticoGestacionExecute(Sender: TObject);
    procedure AEveEgresoServicioExecute(Sender: TObject);
    procedure AEveEgresoToroExecute(Sender: TObject);
    procedure AEveEvaluacionPreservicioExecute(Sender: TObject);
    procedure AEveFertilidadMachoExecute(Sender: TObject);
    procedure AEveIdentificacionExecute(Sender: TObject);
    procedure AEveIngresoServicioExecute(Sender: TObject);
    procedure AEveIngresoToroExecute(Sender: TObject);
    procedure AEveMedicionFrameExecute(Sender: TObject);
    procedure AEvePartoExecute(Sender: TObject);
    procedure AEvePesoExecute(Sender: TObject);
    procedure AEveSincronizacionCeloExecute(Sender: TObject);
    procedure AEveTratamientoExecute(Sender: TObject);
    procedure AEveInseminacionArtificialExecute(Sender: TObject);
    procedure AVerFichaEventoExecute(Sender: TObject);
    procedure ARepImprimirReporteExecute(Sender: TObject);
    procedure ARepPreviewReportePedigreeExecute(Sender: TObject);
    procedure DSConsultaEventosDataChange(Sender: TObject; Field: TField);
    procedure AEveRaspadoTorosExecute(Sender: TObject);
    procedure AEveReidentificacionExecute(Sender: TObject);
    procedure AEveSangradoBrucelosisExecute(Sender: TObject);
    procedure AEveTuberculinizacionExecute(Sender: TObject);
    procedure ACEliminarEventoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AEveCargaBrucelosisExecute(Sender: TObject);
    procedure AEveCargaTuberculinaExecute(Sender: TObject);
    procedure AEveCargaVenereasExecute(Sender: TObject);
    procedure AcRemoverRechazoExecute(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure BBModificarClick(Sender: TObject);
    procedure TVArbolGeneaDblClick(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure PCFichaAnimalChange(Sender: TObject);
    procedure ReporteIndividual1Click(Sender: TObject);
    procedure ReportedePedigree1Click(Sender: TObject);
    procedure THLAnimalesClick(Sender: TObject);
    procedure BBAgregarFotoClick(Sender: TObject);
    procedure BBEliminarFotoClick(Sender: TObject);
    procedure THLAnimalesExit(Sender: TObject);
    procedure THLAnimalesDblClick(Sender: TObject);
    procedure DBGEventosColEnter(Sender: TObject);
    procedure IBQConsultaEventosAfterScroll(DataSet: TDataSet);
    procedure IBQConsultaEventosAfterOpen(DataSet: TDataSet);
    procedure DBGEventosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure DBGEventosTitleClick(Column: TColumn);
    procedure AEveCalidadCarneExecute(Sender: TObject);
    procedure EADEPGestKeyPress(Sender: TObject; var Key: Char);
    procedure EADEPGestExit(Sender: TObject);
    procedure EAPrecGestKeyPress(Sender: TObject; var Key: Char);
    procedure EAPrecGestExit(Sender: TObject);
    procedure EAAnioChange(Sender: TObject);
    procedure BBImprimirDepsClick(Sender: TObject);
    procedure BBModificarDepClick(Sender: TObject);
    procedure EANhijKeyPress(Sender: TObject; var Key: Char);
    procedure AEveActividadExecute(Sender: TObject);
    procedure AEveSuplementacionExecute(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure BBGuardarClick(Sender: TObject);
    procedure EACriasKeyPress(Sender: TObject; var Key: Char);
    procedure EACriasExit(Sender: TObject);
    procedure AEveFlushingExecute(Sender: TObject);
    procedure AEveTransferenciaEmbrionariaExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EACriasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EARodeoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPGestKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecGestKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPNacerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecNacerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPDestKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecDestKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPLecheKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecLecheKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPCEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPAlturaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecAlturaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPEGDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecEGDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPEGCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecEGCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPAOBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecAOBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPPorcGIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecPorcGIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecCEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPPorcCMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EACriadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EACodigoPropKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EANhijKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EANhijMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EANhijUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPPNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecPNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPPDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecPDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPHLKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecHLKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPP18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecP18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPCEUruKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecCEUruKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPAOBUruKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecAOBUruKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADEPEGCUruKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabelTipoEventoClick(Sender : TObject);
    procedure CBTipoEventoClick(Sender : TObject);
    procedure IBQFuenteDepsAfterOpen(DataSet: TDataSet);
    procedure TVArbolGeneaDeletion(Sender: TObject; Node: TTreeNode);
    procedure SBAnteriorClick(Sender: TObject);
    procedure SBSiguienteClick(Sender: TObject);
    procedure EARPChange(Sender: TObject);
    procedure BGenealogiaCompletaClick(Sender: TObject);
    procedure TPanelTimer(Sender: TObject);
    procedure DBGEventosColExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure JvSeleccionImagenButtonClick(Sender: TObject;
      Button: TJvCapBtnStyle);
    procedure BBSeleccionFotoClick(Sender: TObject);
    procedure InfMClick(Sender: TObject);
    procedure ICancelDepsClick(Sender: TObject);
    procedure TPanelEventosTimer(Sender: TObject);
    procedure LTuberculinizacionMouseEnter(Sender: TObject);
    procedure LTuberculinizacionMouseLeave(Sender: TObject);
    procedure LRepPedigreeMouseEnter(Sender: TObject);
    procedure LRepPedigreeMouseLeave(Sender: TObject);
    procedure LRepIndividualMouseEnter(Sender: TObject);
    procedure LRepIndividualMouseLeave(Sender: TObject);
    procedure TimerLectorTimer(Sender: TObject);
    procedure ICargaFenotiposClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvLCMGClick(Sender: TObject);
    procedure JvLCMGMouseEnter(Sender: TObject);
    procedure JvLCMGMouseLeave(Sender: TObject);
    procedure EAPRECCEHerefordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AEveExtraccionSemenExecute(Sender: TObject);
    procedure IHExtracClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AEveCambioCategoriaExecute(Sender: TObject);
    procedure EADatoDepChange(Sender: TObject);

    //******************************************************//
    //	INCIDENCIA: 408									                    //
    //	INICIO Declaración método que invoca evento AFIP.   //
    //	Carla Gareis							              04/12/2014  //
    //******************************************************//
    procedure AEveDeclaracionAfipExecute(Sender: TObject);
    //******************************************************//
    //	INCIDENCIA: 408									                    //
    //	FIN Declaración método que invoca a evento AFIP.    //
    //	Carla Gareis							              04/12/2014  //
    //******************************************************//

  published
    procedure LFuenteMouseEnter(Sender: TObject);
    procedure LFuenteMouseLeave(Sender: TObject);
    procedure LFuenteClick(Sender: TObject);

  private
    id_animal : integer;
    PasoIdent, PasoGenea, PasoFeno, PasoDeps, PasoFotos, PasoObs : Boolean;
    MasEventos : Boolean;
    NivelGenealogia : Integer;
    sig, ant : String;
    puede_modificar : boolean;
    evento_sel : integer;
    insertar : Integer;
    EstabAnimal : Integer;
    StrFiltros : String;
    id_dep : Integer;
    nodoPrincipal, nodoSeleccionado : TTreeNode;
    arreglo11 : array of TArrayPointer;
    Indarr : Integer;
    BorrarNodo : Boolean;
    IGeneral, IIdentificacion, IGenealogia, IFenotipos, IDEPs, IFotos, IObservacion : TBitmap;
    IGeneralA, IIdentificacionA, IGenealogiaA, IFenotiposA, IDEPsA, IFotosA, IObservacionA : TBitmap;
    function GetAnimal: integer;
    procedure SetAnimal(const Value: integer);
    function GetModificar : Boolean;
    procedure SetModificar(const Value : boolean);
    function calcularEdad: string;
    procedure armarArbol( animal :integer; nodoPadre : TTreeNode; EXT:String; Tope : Integer );
    procedure ArmarArbol2( animal : Integer; nodoPadre : TTreeNode; EXT : String);
    function ExisteAnimal(animal, padre_de : Integer; Nodos : Array of TRegDatosArbol) : Boolean;
    procedure AdministrarEventos(evento : integer);
    procedure MostrarPosiblesEventos();
    procedure noVisiblesEventos();
    function cumpleRegla(sentencia : string; evento : integer) : boolean;
    procedure ActualizarEventos(Animal : Integer);
    procedure ActivarAcciones;
    procedure DesActivarAcciones;
    procedure AbrirEventoIndividual(Eve: TFEveSimple);
    procedure ActualizarDatosAnimal;
    procedure MostrarMensajeUndoServicio;
    procedure CargarImagenesAnimal();
    procedure ControlarBotonEliminar();
    procedure CrearDirectorio(dir: String);
    procedure TerminaThread(Sender : TObject);
    procedure ClearDeps();
    procedure CargarDeps();
    procedure HabilitarCompDeps(estado:boolean);
    procedure CargarDatosGeneralesDeps();
    function CheckFormatoDep(var Valor : String) : Boolean;
    function CheckFormatoPrec(var Valor : String) : Boolean;
    function PasarDepAFloat(DEP:String): Double;
    function PasarFloatADep(valor:Double): String;
    procedure HabilitarBotones(valor: boolean);
    procedure InsertarModificarDeps();
    procedure ObtenerEstabAnimal();
    procedure HabilitarSegunEstablecimiento();
    function BuscarArchivo(const directorio, mascara, NomArch: string; atributos: Integer) : String;
    procedure HabilitarComponentesVersionBasica; override;
    procedure AbrirFuentesDEPs;
    procedure InsertarFuentesDEPs;
    procedure HabilitarFuentesDEPs;
    procedure Siguiente;
    procedure Anterior;
    procedure CargarGenea5;
    procedure retornarAlternativo(id: integer; externo: boolean; var identif, value: string);
    procedure AcomodarNombreyRP;

    procedure PasarPorArbol;
    procedure PasarPorDEPs;
    procedure PasarPorFeno;
    procedure ActualizarEventos20(id_animal : Integer);


    procedure CargarSolapaGenealogia;

    procedure AlienarAcciones;
    procedure ResaltarLabelEnter(Sender : TObject);
    procedure ResartalLabelLeave(Sender : TObject);

    procedure ArmarGraficoDatosFenotipicos;
    procedure GuardarGrafico;
    procedure GenerarImgDeps(PanelDeps : TPanel);
    procedure SeleccionDepsImg;

    { Private declarations }
  protected
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
  public
    ConLector : Boolean;


    procedure crearLector;
    procedure cerrarLector;
    procedure identificarAnimalPorLector;
    
    function partirString(nom:string;pos:integer):string;
    { Public declarations }
  published
    property modificar : boolean read GetModificar write SetModificar;
    property animal : integer read GetAnimal write SetAnimal;

  end;

var
  FREPFichaAnimal: TFREPFichaAnimal;
  Establecimiento : integer;
  Id_animal : integer;
  identifPadres : array[1..20] of integer;
  vPrimerIngreso, vPrimeraGrafica, vGraficoDeps, CargaResiente : boolean;
  vDatosCompletos: boolean;
  vTopEve, vTamPanel, RazaAnimal : integer;
  fra : TFFrameGrafico;
  vIngresoSolapaDeps, vIngresoSolapaGenea, vIngresoSolapaFoto, vIngresoSolapaObserv : boolean;

implementation

uses
  UPrincipal, UDMSoftvet, UFichaEvento,
  UREPHistorialAnimalPreview, UREPPedigreePreview, UREPHistoriaAnimal,
  UEveAborto, UEveBaja, UEveCalidadSeminal, UEveCambioUbicacion, UEveCapacidadServicio,
  UEveCastracion, UEveCircunferenciaEscrotal, UEveCondicionCorporal, UEveDestete,
  UEveDeteccionCelo, UEveDiagnosticoEnfermedad, UEveDiagnosticoGestacion,
  UEveEgresoServicio, UEveEgresoToro, UEveEvaluacionPreservicio, UEveFertilidadMacho,
  UEveIdentificacion, UEveIngresoServicio, UEveIngresoToro, UEveInseminacionArtificial,
  UEveMedicionFrame, UEveParto, UEvePeso, UEveEnfermedadesMasivas, UEveSincronizacionCelo,
  UEveTratamiento, UMensajeHuella, ueveCargaResultados, UEveCambioCategoria,
  UEveModifDatosAnimal, UCartel, UREPIndividual, UEveCalidadCarne,
  DateUtils, URepRegHistoricoDEPSPreview, UEveActividad, UEveSuplementacion,
  UEveFlushing, UEveTransferenciaEmbrionaria, UABMPadresExternos,IBDButtonABM,UAbmSimple,
  UABMFuentesDeps, UTraduccion, UEveServicioCorral, ULectorElectronico,ULectorAllFlexSerie,
  UCargaFenotipos, URepCertificadoMeritoGenetico, UEveExtraccionSemen, URepDetalleSemenAnimal,
  UEveDeclaracionAFIP;

{$R *.dfm}

procedure TFREPFichaAnimal.ACSalirExecute(Sender: TObject);
begin
  inherited;

  if ((IGuardar.Visible) or (ICancelDeps.Visible)) and PasoDeps then
     MostrarMensaje(tmInformacion, 'Seguramente aun esta editando las DEPs. Presione guardar o cancelar, y luego presione salir.')
  else
  begin
    BBSalir.SetFocus;
    close;
  end;

end;

// METODOS DE LA PROPERTY ANIMAL *************
function TFREPFichaAnimal.GetAnimal: integer;
begin
  result := id_animal;
end;
procedure TFREPFichaAnimal.SetAnimal(const Value: integer);
begin
  id_animal := Value;
end;

//*******************************************

// CALCULO LA EDAD DEL ANIMAL QUE ESTA SELECCIONADO
function TFREPFichaAnimal.calcularEdad: string;
var value : variant;
    value2 : variant;
    intermedio : integer;
    sql: String;
begin
  value2 := now;

  {sql:= 'select ee.fecha as fecha ' +
        'from eve_eventos ee join eve_baja eb on ee.id_evento = eb.id_evento ' +
        'where ee.tipo = 3 and ee.establecimiento = :esta and ee.animal = :animal ' +
        'order by ee.fecha desc, ee.id_evento desc';

  IBQFechaBaja.Close;
  IBQFechaBaja.SQL.Clear;
  IBQFechaBaja.SQL.Add(sql);
  IBQFechaBaja.ParamByName('animal').AsInteger := Id_animal;
  IBQFechaBaja.ParamByName('esta').AsInteger := Fprincipal.EstablecimientoActual;
  IBQFechaBaja.Open;
  IBQFechaBaja.First;

  if not(IBQFechaBaja.IsEmpty) then
    value2:= IBQFechaBaja.fieldbyname('fecha').Value
   else
     begin
        sql:= 'select ee.fecha as fecha ' +
              'from eve_eventos ee join eve_nacimiento en on ee.id_evento = en.id_evento ' +
              'where ee.tipo = 23 and ee.establecimiento = :esta and ee.animal = :animal and ' +
              'en.vivo = ''N'' ' +
              'order by ee.fecha desc, ee.id_evento desc ';

        IBQFechaBaja.Close;
        IBQFechaBaja.SQL.Clear;
        IBQFechaBaja.SQL.Add(sql);
        IBQFechaBaja.ParamByName('animal').AsInteger := Id_animal;
        IBQFechaBaja.ParamByName('esta').AsInteger := Fprincipal.EstablecimientoActual;
        IBQFechaBaja.Open;
        IBQFechaBaja.First;

        if not(IBQFechaBaja.IsEmpty) then
          value2:= IBQFechaBaja.fieldbyname('fecha').Value;
     end; }

  value := IBQAnimales.fieldByname('fecha_Nacimiento').Value;
  intermedio := TRUNC( (value2 - value) /365);
  if (intermedio < 2) then
    result := intToStr(TRUNC( (value2 - value) /dias_mes))+' meses'
  else
    result := intToStr(TRUNC( (value2 - value) /365))+' años';
end;

// muestra toda la informacion del animal que se setea
procedure TFREPFichaAnimal.FormShow(Sender: TObject);
begin

  PasoDeps := false;
  PasoFeno := false;
  PasoFotos := false;
  PasoGenea := false;
  PasoIdent := false;
  PasoObs := false;

  BringToFront;

  NivelGenealogia := 3;

  vTopEve := 3;

  inherited;
  nodoSeleccionado:= nil;

  //Self.WindowState := wsMaximized;

  vPrimeraGrafica := true;
  vGraficoDeps := true;

  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) <> 0) then //No es Administrador
  begin
    LmodifAnimal.Enabled := false;
    IModifAnimales.Enabled := false;
  end;

  PListaEventos.Visible := false;

  LPropietario1.Caption := '';
  LPropietario2.Caption := '';
  LPropietario3.Caption := '';
  LPropietario4.Caption := '';
  LPropietario5.Caption := '';

  LmodifAnimal.Enabled := puede_modificar;
  IModifAnimales.Enabled := puede_modificar;

  //para las fotos

  THLAnimales.ShowSelection := true;

  CBMostrarDescripcion.Checked := false;
  CBMultiColumnas.Checked := false;

  SpinEdit1Change(nil);

  CrearDirectorio(ExtractFilePath(Application.ExeName)+'Fotos\');
  CrearDirectorio(ExtractFilePath(Application.ExeName)+'Fotos\'+FPrincipal.NombreEstablecimiento);

  ComponentesVisiblesPorPais(FPrincipal.Pais);

  ActualizarDatosAnimal;
  ActualizarEventos20(Id_animal);
  MasEventos := false;

  SBAnterior.Visible := false;
  SBSiguiente.Visible := false;
  LAnterior.Visible := false;
  LSiguiente.Visible := false;

  if not (FPrincipal.TipoVersionLicencia = 'Basico') then // pasar aniamles en la ficha solo para la version estandar y full
  begin
    if Owner <> nil then
      if Owner is TFREPHistoriaAnimal then
      begin
        SBAnterior.Visible := true;
        SBSiguiente.Visible := true;
        LAnterior.Visible := true;
        LSiguiente.Visible := true;
        Siguiente;
        Anterior;
      end;
  end;
  insertar := -1;//insertar o modificar

  HabilitarSegunEstablecimiento;

  //fillCustomIni;
  TSTV.TabVisible := FPrincipal.FuncGenealogia;
  TabSheet2.TabVisible := FPrincipal.FuncDEPs;
  TabSheet1.TabVisible := FPrincipal.FuncActividad;
  LabelSubcategoria.Visible := FPrincipal.FuncActividad;
  LabelSubcategoriaValue.Visible := FPrincipal.FuncActividad;
  LabelPropietario.Visible := FPrincipal.FuncActividad;
  LPropietario1.Visible := FPrincipal.FuncActividad;
  LPropietario2.Visible := FPrincipal.FuncActividad;
  LPropietario3.Visible := FPrincipal.FuncActividad;
  LPropietario4.Visible := FPrincipal.FuncActividad;
  LPropietario5.Visible := FPrincipal.FuncActividad;
  IPedigree.Enabled := FPrincipal.FuncActividad;
  LPedigree.Enabled := FPrincipal.FuncActividad;

  if not FPrincipal.FuncActividad then
    IPedigree.Picture := IDisPed.Picture;

  if (FPrincipal.ConfiguroLector) then
  begin
    //crearLector;
    TimerLector.Enabled := true;
  end;

  GBReferencias.Visible := true;

end;

function TFREPFichaAnimal.ExisteAnimal(animal, padre_de : Integer; Nodos : Array of TRegDatosArbol) : Boolean;
var
  I : Integer;
begin
  Result := false;
  for I := 0 to Length(Nodos)-1 do
    if (Nodos[I].Dato.id_animal = animal) and (Nodos[I].Dato.padres_de = padre_de) then
    begin
      Result := true;
      break;
    end;
end;

procedure TFREPFichaAnimal.ArmarArbol2( animal : Integer; nodoPadre : TTreeNode; EXT : String);
var
  Ind, K : Integer;
  NodosArbol : Array of TRegDatosArbol;
  StringCaptionNodo : String;
  Padre, Madre, Hijo : Integer;
  nodoAux, nodoP : TTreeNode;
  HijoExterno : String;
begin
  BorrarNodo := False;
  IBQArbolAux.Close;
  IBQArbolAux.ParamByName('ID').AsInteger := animal;
  IBQArbolAux.ParamByName('Nivel').AsInteger := NivelGenealogia;
  IBQArbolAux.Open;
  IBQArbolAux.First;
  // Primero paso toda la genealogia a un arreglo de TTreeNode
  Ind := 0;
  while not IBQArbolAux.Eof do
  begin
    if not ExisteAnimal(IBQArbolAux.fieldByName('id_animal').AsInteger,IBQArbolAux.fieldByName('padres_de').AsInteger, NodosArbol) then
    begin
      SetLength(NodosArbol,Ind+1);
      new(NodosArbol[Ind].Dato);
      TTreeNode.Create(TTreeNodes.Create(TVArbolGenea));
      with NodosArbol[Ind].Dato^ do
      begin
        apodo:= '';
        if (IBQArbolAux.FieldValues['apodo'] <> null) then
          apodo := IBQArbolAux.FieldValues['apodo'];
        id_animal := IBQArbolAux.fieldByName('id_animal').AsInteger;
        padres_de := IBQArbolAux.fieldByName('padres_de').AsInteger;
        nivel_arbol := IBQArbolAux.fieldByName('nivel_arbol').AsInteger;
        raza := IBQArbolAux.fieldByName('raza').AsInteger;
        id_rp := IBQArbolAux.fieldByName('id_rp').AsString;
        id_senasa := IBQArbolAux.fieldByName('id_senasa').AsString;
        id_hba := IBQArbolAux.fieldByName('id_hba').AsString;
        id_ra := IBQArbolAux.fieldByName('id_ra').AsString;
        id_otro := IBQArbolAux.fieldByName('id_otro').AsString;
        id_pc := IBQArbolAux.fieldByName('id_pc').AsString;
        madre := IBQArbolAux.fieldByName('madre').AsString;
        externo := IBQArbolAux.fieldByName('externo').AsString;
        apodo := IBQArbolAux.fieldByName('apodo').AsString;
        nombre := IBQArbolAux.fieldByName('nombre').AsString;
      end;
      NodosArbol[Ind].Nodo := TVArbolGenea.Items.AddChildObject(nodoPadre,NodosArbol[Ind].Dato^.id_rp+' : '+NodosArbol[Ind].Dato^.nombre,NodosArbol[Ind].Dato);
      Inc(Ind);
    end;
    IBQArbolAux.Next;
  end;
  //Armo el arbol en base al arreglo
  if Ind > 0 then
  begin
    Ind := 0;
    //Agrego los 2 primeros
    while (Ind <= Length(NodosArbol)-1) do
    begin
      if (NodosArbol[Ind].Dato^.nivel_arbol > 0) then
        break;
      TTreeNode.Create(TTreeNodes.Create(TVArbolGenea));
      nodoAux :=  TVArbolGenea.Items.AddChildObject(nodoPadre,NodosArbol[Ind].Dato^.id_rp+' : '+NodosArbol[Ind].Dato^.nombre,NodosArbol[Ind].Dato);
      if (NodosArbol[Ind].Dato^.madre = 'S') then
        nodoAux.ImageIndex := 1
      else
        nodoAux.ImageIndex := 0;
      TVArbolGenea.Items.Delete(TVArbolGenea.Items.GetNode(NodosArbol[Ind].Nodo.ItemId));
      NodosArbol[Ind].Nodo := nodoAux;
      Inc(Ind);
    end;
    //Ahora agrego el resto
    Ind := 0;
    while Ind <= Length(NodosArbol)-1 do
    begin
      Hijo := NodosArbol[Ind].Dato^.id_animal;
      HijoExterno := NodosArbol[Ind].Dato^.externo;
      Madre := -1;
      Padre := -1;
      for K := Ind to Length(NodosArbol)-1 do
      begin
        if (NodosArbol[K].Dato^.padres_de = Hijo) and (NodosArbol[K].Dato^.madre = 'S') then
        begin
          if (NodosArbol[k].Dato^.id_animal = Hijo) then
          begin
            if NodosArbol[K].Dato^.externo <> HijoExterno then
              Madre := K;
          end
          else
            Madre := K;
        end;
        if (NodosArbol[K].Dato^.padres_de = Hijo) and (NodosArbol[K].Dato^.madre = 'N') then
        begin
          if (NodosArbol[k].Dato^.id_animal = Hijo) then
          begin
            if NodosArbol[K].Dato^.externo <> HijoExterno then
              Padre := K;
          end
          else
            Padre := K;
        end;
      end;
      if Madre <> -1 then
      begin
        TTreeNode.Create(TTreeNodes.Create(TVArbolGenea));
        nodoAux := TVArbolGenea.Items.AddChildObject(TVArbolGenea.Items.GetNode(NodosArbol[Ind].Nodo.ItemId),NodosArbol[Madre].Dato^.id_rp+' : '+NodosArbol[Madre].Dato^.nombre,NodosArbol[Madre].Dato);
        nodoAux.ImageIndex := 1;
        TVArbolGenea.Items.Delete(TVArbolGenea.Items.GetNode(NodosArbol[Madre].Nodo.ItemId));
        NodosArbol[Madre].Nodo := nodoAux;
      end;
      if Padre <> -1 then
      begin
        TTreeNode.Create(TTreeNodes.Create(TVArbolGenea));
        nodoAux := TVArbolGenea.Items.AddChildObject(TVArbolGenea.Items.GetNode(NodosArbol[Ind].Nodo.ItemId),NodosArbol[Padre].Dato^.id_rp+' : '+NodosArbol[Padre].Dato^.nombre,NodosArbol[Padre].Dato);
        nodoAux.ImageIndex := 0;
        TVArbolGenea.Items.Delete(TVArbolGenea.Items.GetNode(NodosArbol[Padre].Nodo.ItemId));
        NodosArbol[Padre].Nodo := nodoAux;
      end;
      Inc(Ind);
    end;
  end;
end;

// METODO PARA ARMAR EL ARBOL N-ARIO (RECURSIVO)
procedure TFREPFichaAnimal.armarArbol(animal: integer; nodoPadre : TTreeNode; EXT:String; Tope : Integer);
var nodoAux : TTreeNode;
    StringCaptionNodo : string;
    madre : string;
    externo : string;
    arreglo : array of TArrayPointer;
    cont : integer;
    cantidad : integer;
    entro : boolean;

begin
  cantidad := 0;
  cont := 0;
  with IBQAux do
    begin
      active := false;
      sql.Clear;
      sql.Add('select distinct * from get_arbol_genea_multi_padres(1,:n,1,'''',:EXT) where (padres_de = :p) order by madre desc');
      paramByName('n').AsInteger := animal;
      paramByName('p').AsInteger := animal;
      paramByName('EXT').AsString := EXT;
      active := true;
      first;
    end;
  entro := false;
  while not(IBQAux.Eof) do
    begin
      cantidad := cont;
      SetLength(arreglo, cont+1);
      new(arreglo[cont]);
      arreglo[cont]^.id_animal := IBQaux.fieldByName('id_animal').AsInteger;
      arreglo[cont]^.padres_de := IBQaux.fieldByName('padres_de').AsInteger;
      arreglo[cont]^.nivel_arbol := IBQaux.fieldByName('nivel_arbol').AsInteger;
      arreglo[cont]^.raza := IBQaux.fieldByName('raza').AsInteger;
      arreglo[cont]^.id_rp := IBQaux.fieldByName('id_rp').AsString;
      arreglo[cont]^.id_senasa := IBQaux.fieldByName('id_senasa').AsString;
      arreglo[cont]^.id_hba := IBQaux.fieldByName('id_hba').AsString;
      arreglo[cont]^.id_ra := IBQaux.fieldByName('id_ra').AsString;
      arreglo[cont]^.id_otro := IBQaux.fieldByName('id_otro').AsString;
      arreglo[cont]^.id_pc := IBQaux.fieldByName('id_pc').AsString;
      arreglo[cont]^.madre := IBQaux.fieldByName('madre').AsString;
      arreglo[cont]^.externo := IBQaux.fieldByName('externo').AsString;
      arreglo[cont]^.apodo := IBQaux.fieldByName('apodo').AsString;
      arreglo[cont]^.nombre := IBQaux.fieldByName('nombre').AsString;

      entro := true;
      inc (cont);
      IBQAux.Next;
    end;
  cont := 0;

  while ((cont <= cantidad ) and (entro))do
    begin
      madre := arreglo[cont]^.madre;
      externo := arreglo[cont]^.externo;
      StringCaptionNodo := arreglo[cont]^.id_rp+' : '+ arreglo[cont]^.nombre;
      TTreeNode.Create(TTreeNodes.Create(TVArbolGenea));
      nodoAux := TVArbolGenea.Items.AddChildObject(nodoPadre, StringCaptionNodo, arreglo[cont]);

      //if tope < 4 then
      armarArbol(arreglo[cont]^.id_animal, nodoAux,externo,tope+1);


      if (madre = 'S') then
        nodoAux.ImageIndex := 1
      else
        nodoAux.ImageIndex := 0;
      nodoAux.SelectedIndex := nodoAux.ImageIndex;
      inc(cont);
    end;
end;

// metodo que se ejecuta cada vez que se selecciona un nodo del arbol
procedure TFREPFichaAnimal.TVArbolGeneaChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  LabelGeneaRPValue.Caption := TArrayPointer(Node.Data)^.id_rp;
  LabelGeneaPCValue.Caption := TArrayPointer(Node.Data)^.id_pc;
  LabelGeneaHBAValue.Caption := TArrayPointer(Node.Data)^.id_hba;
  LabelGeneaRAValue.Caption := TArrayPointer(Node.Data)^.id_ra;
  LabelGeneaOtroValue.Caption := TArrayPointer(Node.Data)^.id_otro;

  nodoSeleccionado:= nil;
  nodoSeleccionado:= Node;

  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select nombre from cod_razas where id_raza = :n');
  IBQAux.ParamByName('n').AsInteger := TArrayPointer(Node.Data)^.raza;
  IBQAux.Active := true;
  LabelGeneaRazaValue.Caption := IBQAux.fieldByName('nombre').AsString;
end;

// accion para mandar a imprimir los reportes, ahora hace un preview pero despues puedo mandar a imprimir directamente
procedure TFREPFichaAnimal.ARepImprimirReporte1Execute(Sender: TObject);
begin
  inherited;
end;

// Para cambiar los colores de la grilla dependiendo de la categoria del evento
procedure TFREPFichaAnimal.DBGEventosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var //id_categoria : integer;
    Modo : string;
    bitmap : TBitmap;
    id_categoria : integer;
begin
  inherited;
  // CODIGO PARA PINTAR LAS DISTINTAS CATEGORIAS DE EVENTOS
  // LO SACAMOS PARA PODER VER EL SELECCIONADO Y ADEMAS PORQUE NO SE SABE QUE COLOR ES QUE CATEGORIA
  if (IBQConsultaEventos.FieldValues['establecimiento'] = FPrincipal.EstablecimientoActual) then
  begin
      if IBQConsultaEventos.FieldValues['id_categoria']<>null then
        begin
          id_categoria := StrToInt(IBQConsultaEventos.FieldValues['id_categoria']);
          case id_categoria of
            1: DBGEventos.Canvas.Brush.Color := RGB(150, 200, 200); //General
            2: DBGEventos.Canvas.Brush.Color := RGB(100, 200, 150); //Establecimiento
            3: DBGEventos.Canvas.Brush.Color := RGB(185, 230, 210); //Cria Recria
            4: DBGEventos.Canvas.Brush.Color := RGB(200, 215, 200); //Invernada
            5: DBGEventos.Canvas.Brush.Color := RGB(200, 225, 190); //Servicio
            6: DBGEventos.Canvas.Brush.Color := RGB(200, 235, 180); //Gestacion
            7: DBGEventos.Canvas.Brush.Color := RGB(150, 200, 170); //Parto Nacimiento
            8: DBGEventos.Canvas.Brush.Color := RGB(150, 200, 120); //Sanitario
          end;
        end;
  end
  else
    DBGEventos.Canvas.Brush.Color := $00CAD1D5;

  if IBQConsultaEventos.FieldValues['evento'] = evento_sel then
  begin
    DBGEventos.Canvas.Brush.Color := RGB(229,170,122);
    DBGEventos.Canvas.Font.Color := clWhite;
  end
  else
    DBGEventos.Canvas.Font.Color := clBlack;

  DBGEventos.Canvas.FillRect(Rect);
  DBGEventos.Canvas.TextOut( Rect.Left+2, Rect.Top+2, Column.Field.Text);

  if (column.FieldName = 'DISPARADOR') then
    begin
      Modo := IBQConsultaEventos.fieldByName('Disparador').AsString;
      if ((Modo = 'I') or (Modo = 'P')) then
        begin
          bitmap := TBitmap.Create;
          ImageTree.GetBitmap(3,bitmap);
          DBGEventos.Canvas.StretchDraw(Rect,bitmap);
        end
      else
        begin
          if Modo = 'C' then
          begin
            bitmap := TBitmap.Create;
            ImageTree.GetBitmap(6,bitmap);
            DBGEventos.Canvas.StretchDraw(Rect,bitmap);
          end
          else
          begin
            bitmap := TBitmap.Create;
            ImageTree.GetBitmap(4,bitmap);
            DBGEventos.Canvas.StretchDraw(Rect,bitmap);
          end;
        end;
    end;
end;

// metodo para mandar a imprimir el reporte de pedigree
procedure TFREPFichaAnimal.ARepPreviewReportePedigree1Execute(Sender: TObject);
begin
  inherited;
end;

// medoto que muestra los posibles eventos que se le pueden agregar a el animal que estamos viendo
procedure TFREPFichaAnimal.SBPopupEventosClick(Sender: TObject);
begin
  inherited;
//  PMEventos.Popup(BAgregarEvento.Left+self.Left+4, self.Top+ Ptitulo.Height+self.Height+PanelEventos.Height+BAgregarEvento.Top+20);

  {PListaEventos.Left := 523;
  PListaEventos.Width := 217;

  PListaEventos.Visible := true;
  PListaEventos.BringToFront;

  TPanelEventos.Enabled := true;}
  JvPMEventos.Popup(IAgregaEve.Left+self.Left+4, self.Top+ Ptitulo.Height+self.Height+PanelEventos.Height+IAgregaEve.Top+40);
end;

// metodo que desbilita eventos de acuerdo a las reglas del negocio
procedure TFREPFichaAnimal.AdministrarEventos(evento : integer);
begin

    case evento of
    1 :   begin // aborto
            AEveAborto.Visible := true;
            LAborto.Visible := true;
            LAborto.Top := vTopEve;
//           vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Aborto(:animal, :establecimiento, ''TODAY'')',1)) then
            begin
              AEveAborto.Enabled := false;
              LAborto.Enabled := false;
              LAborto.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    3 :   begin // baja
            AEveBaja.Visible := true;
            LBaja.Visible := true;
            LBaja.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Baja(:animal, :establecimiento, ''today'', null)',3)) then
            begin
              AEveBaja.Enabled := false;
              LBaja.Enabled := false;
              LBaja.Visible := false;
//            vTopEve := vTopEve - 16;
            end;
          end;
    4 :   begin // Calidad seminal
            AEveCalidadSeminal.Visible := true;
            LCalidadSeminal.Visible := true;
            LCalidadSeminal.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Calidad_Seminal(:animal, :establecimiento, ''today'')',4)) then
            begin
              AEveCalidadSeminal.Enabled := false;
              LCalidadSeminal.Enabled := false;
              LCalidadSeminal.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    5 :   begin // cambio ubicacion
            AEveCambioUbicacion.Visible := true;
            LCambioUbicacion.Visible := true;
            LCambioUbicacion.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Cambio_Ubicacion(:animal, :establecimiento, ''today'')',5)) then
            begin
               AEveCambioUbicacion.Enabled := false;
               LCambioUbicacion.Enabled := false;
               LCambioUbicacion.Visible := false;
//               vTopEve := vTopEve - 16;
            end;
          end;
    6 :   begin // capacidad de servicio
            AEveCapacidadServicio.Visible := true;
            LCapacidadServicio.Visible := true;
            LCapacidadServicio.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Capacidad_Servicio(:animal, :establecimiento, ''today'')',6)) then
            begin
              AEveCapacidadServicio.Enabled := false;
              LCapacidadServicio.Enabled := false;
              LCapacidadServicio.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    7 :   begin // castracion
            AEveCastracion.Visible := true;
            LCastracion.Visible := true;
            LCastracion.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Castracion(:animal, :establecimiento, ''today'')',7)) then
            begin
              AEveCastracion.Enabled := false;
              LCastracion.Enabled := false;
              LCastracion.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    8 :   begin // circunferencia escrotal
            AEveCircunferenciaEscrotal.Visible := true;
            LCircunferenciaEscrotal.Visible := true;
            LCircunferenciaEscrotal.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Circunferencia_Escrotal(:animal, null, :establecimiento, ''today'')',8)) then
            begin
              AEveCircunferenciaEscrotal.Enabled := false;
              LCircunferenciaEscrotal.Enabled := false;
              LCircunferenciaEscrotal.Visible := false;
///              vTopEve := vTopEve - 16;
            end;
          end;
    9 :   begin // condicion corporal
            AEveCondicionCorporal.Visible := true;
            LCondicionCorporal.Visible := true;
            LCondicionCorporal.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Condicion_Corporal(:animal, :establecimiento, ''today'')',9)) then
            begin
              AEveCondicionCorporal.Enabled := false;
              LCondicionCorporal.Enabled := false;
              LCondicionCorporal.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    10 :  begin // destete
            AEveDestete.Visible := true;
            LDestete.Visible := true;
            LDestete.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Destete(:animal, :establecimiento, ''TODAY'', null)',10)) then
            begin
              AEveDestete.Enabled := false;
              LDestete.Enabled := false;
              LDestete.Visible := false;
///              vTopEve := vTopEve - 16;
            end;
          end;
    11 :  begin // deteccion de celo
            AEveDeteccionCelo.Visible := true;
            LDeteccionCelo.Visible := true;
            LDeteccionCelo.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Deteccion_Celo(:animal, :establecimiento, ''today'')',11)) then
            begin
              AEveDeteccionCelo.Enabled := false;
              LDeteccionCelo.Enabled := false;
              LDeteccionCelo.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    12 :  begin // diagnostico de enfermedad
            AEveDiagnosticoEnfermedad.Visible := true;
            LDiagnosticoEnfermedad.Visible := true;
            LDiagnosticoEnfermedad.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Diagnostico_Enfermedad(:animal, ''today'')',12)) then
            begin
              AEveDiagnosticoEnfermedad.Enabled := false;
              LDiagnosticoEnfermedad.Enabled := false;
              LDiagnosticoEnfermedad.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    13 :  begin // diagnostico de gestacion
            AEveDiagnosticoGestacion.Visible := true;
            LDiagnosticoGestacion.Visible := true;
            LDiagnosticoGestacion.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Diagnostico_Gestacion(:animal, 0, ''today'',:establecimiento, -1,''10/10/2000'',''10/10/2000'')',13)) then
            begin
              AEveDiagnosticoGestacion.Enabled := false;
              LDiagnosticoGestacion.Enabled := false;
              LDiagnosticoGestacion.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    14 :  begin // distocia
//            AEveDistocia.Visible := true;
//            if not(cumpleRegla('select result from rn_Distocia(:animal)',14)) then
//              AEveDistocia.Enabled := false;
          end;
    15 :  begin // egreso de servicio
            AEveEgresoServicio.Visible := true;
            LEgresoServicio.Visible := true;
            LEgresoServicio.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Egreso_Servicio(0,:animal, :establecimiento, ''today'')',15)) then
            begin
              AEveEgresoServicio.Enabled := false;
              LEgresoServicio.Enabled := false;
              LEgresoServicio.Visible := false;
///              vTopEve := vTopEve - 16;
            end;
          end;
    16 :  begin // egreso de toro
            AEveEgresoToro.Visible := true;
            LEgresoToro.Visible := true;
            LEgresoToro.Top := vTopEve;
 ///           vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Egreso_Toro(0,:animal, :establecimiento, ''today'')',16)) then
            begin
              AEveEgresoToro.Enabled := false;
              LEgresoToro.Enabled := false;
              LEgresoToro.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    17 :  begin // evaluacion de preservicio
            AEveEvaluacionPreservicio.Visible := true;
            LEvaluacionPreservicio.Visible := true;
            LEvaluacionPreservicio.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Evaluacion_Preservicio(:animal, 0, :establecimiento, ''today'',0)',17)) then
            begin
              AEveEvaluacionPreservicio.Enabled := false;
              LEvaluacionPreservicio.Enabled := false;
              LEvaluacionPreservicio.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    18 :  begin // fertilidad de macho
            AEveFertilidadMacho.Visible := true;
            LExamenClinicoMacho.Visible := true;
            LExamenClinicoMacho.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Fertilidad_Macho(:animal, :establecimiento, ''today'')',18)) then
            begin
              AEveFertilidadMacho.Enabled := false;
              LExamenClinicoMacho.Enabled := false;
              LExamenClinicoMacho.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    19 :  begin // identificacion
            AEveIdentificacion.Visible := true;
            LIdentificacion.Visible := true;
            LIdentificacion.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            //if not(cumpleRegla('select FIRST 1 result from rn_Identificacion(:animal, :establecimiento, null, null, null, null, null, null, ''today'')',19)) then
            if (IBQAnimales.FieldByName('id_rp').AsString <> 'N/N') then
            begin
              AEveIdentificacion.Enabled := false;
              LIdentificacion.Enabled := false;
              LIdentificacion.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    20 :  begin // ingreso de servicio
            AEveIngresoServicio.Visible := true;
            LIngresoServicio.Visible := true;
            LIngresoServicio.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result, mensaje from rn_Ingreso_Servicio(:animal, ''TODAY'', :establecimiento,0)',20)) then
            begin
              AEveIngresoServicio.Enabled := false;
              LIngresoServicio.Enabled := false;
              LIngresoServicio.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    21 :  begin // ingreso de toro
            AEveIngresoToro.Visible := true;
            LIngresoToro.Visible := true;
            LIngresoToro.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result, mensaje from rn_Ingreso_Toro(:animal, ''TODAY'', :establecimiento,0)',21)) then
            begin
              AEveIngresoToro.Enabled := false;
              LIngresoToro.Enabled := false;
              LIngresoToro.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    22 :  begin // medicion de frame
            AEveMedicionFrame.Visible := true;
            LMedicionFrame.Visible := true;
            LMedicionFrame.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Medicion_Frame(:animal, null, :establecimiento, ''TODAY'')',22)) then
            begin
              AEveMedicionFrame.Enabled := false;
              LMedicionFrame.Enabled := false;
              LMedicionFrame.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    24 :  begin // Parto
            AEveParto.Visible := true;
            LParto.Visible := true;
            LParto.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Parto(:animal, :establecimiento, null, null, null, ''TODAY'', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,null,null,null,null)',24)) then


            begin
              AEveParto.Enabled := false;
              LParto.Enabled := false;
              LParto.Visible := false;
//              vTopEve := vTopEve - 16;
            end;

          end;
    25 :  begin // Peso
            AEvePeso.Visible := true;
            LPeso.Visible := true;
            LPeso.Top := vTopEve;
///            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Peso(:animal, ''G'', ''TODAY'', :establecimiento, null)',25)) then
            begin
              AEvePeso.Enabled := false;
              LPeso.Enabled := false;
              LPeso.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    26 :  begin // Sincronizacion de celo
            AEveSincronizacionCelo.Visible := true;
            LSincronizacionCelo.Visible := true;
            LSincronizacionCelo.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Sincronizacion_Celo(:animal, :establecimiento, ''TODAY'')',26)) then
            begin
              AEveSincronizacionCelo.Enabled := false;
              LSincronizacionCelo.Enabled := false;
              LSincronizacionCelo.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    27 :  begin // tratamiento
            AEveTratamiento.Visible := true;
            LTratamiento.Visible := true;
            LTratamiento.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Tratamiento(:animal, ''TODAY'')',27)) then
            begin
              AEveTratamiento.Enabled := false;
              LTratamiento.Enabled := false;
              LTratamiento.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    28 :  begin // Inseminacion artificial
            AEveInseminacionArtificial.Visible := true;
            LInseminacionArtificial.Visible := true;
            LInseminacionArtificial.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from rn_Inseminacion_Artificial(:establecimiento, :animal, ''TODAY'',null,null)',28)) then
            begin
              AEveInseminacionArtificial.Enabled := false;
              LInseminacionArtificial.Enabled := false;
              LInseminacionArtificial.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    30 :  begin // Sangrado por Brucelosis
            AEveSangradoBrucelosis.Visible := true;
            LSangradoBrucelosis.Visible := true;
            LSangradoBrucelosis.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from RN_Sangrado_Brucelosis(:animal, ''today'')',30)) then
            begin
              AEveSangradoBrucelosis.Enabled := false;
              LSangradoBrucelosis.Enabled := false;
              LSangradoBrucelosis.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    31 :  begin // Tuberculinizacion
            AEveTuberculinizacion.Visible := true;
            LTuberculinizacion.Visible := true;
            LTuberculinizacion.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from RN_Tuberculinizacion(:animal, ''today'')',31)) then
            begin
              AEveTuberculinizacion.Enabled := false;
              LTuberculinizacion.Enabled := false;
              LTuberculinizacion.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    32 :  begin // Raspado Toros
            AEveRaspadoToros.Visible := true;
            LMuestreoTorosVenereas.Visible := true;
            LMuestreoTorosVenereas.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from RN_Raspado_Toro(:animal, ''today'')',32)) then
            begin
              AEveRaspadoToros.Enabled := false;
              LMuestreoTorosVenereas.Enabled := false;
              LMuestreoTorosVenereas.Visible := false;
///              vTopEve := vTopEve - 16;
            end;
          end;
    33 :  begin // Resultado de sangrado
            AEveCargaBrucelosis.Visible := true;
            LCargaResultadosBrucelosis.Visible := true;
            LCargaResultadosBrucelosis.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from RN_Resultado_Brucelosis(:animal, ''today'', NULL, NULL)',33)) then
            begin
              AEveCargaBrucelosis.Enabled := false;
              LCargaResultadosBrucelosis.Enabled := false;
              LCargaResultadosBrucelosis.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    34 :  begin // Resultado de tuberculinizacion
            AEveCargaTuberculina.Visible := true;
            LCargaResultadosTuberculina.Visible := true;
            LCargaResultadosTuberculina.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from RN_Resultado_Tuberculina(:animal, ''today'', NULL)',34)) then
            begin
              AEveCargaTuberculina.Enabled := false;
              LCargaResultadosTuberculina.Enabled := false;
              LCargaResultadosTuberculina.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    35 :  begin // Resultado de venereas
            AEveCargaVenereas.Visible := true;
            LCargaResultadosVenereas.Visible := true;
            LCargaResultadosVenereas.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from RN_Resultado_Raspado_Toro(:animal, ''today'', NULL, NULL)',35)) then
            begin
              AEveCargaVenereas.Enabled := false;
              LCargaResultadosVenereas.Enabled := false;
              LCargaResultadosVenereas.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    36 :  begin //Reidentificacion
            AEveReidentificacion.Visible := true;
            LReidentificacion.Visible := true;
            LReidentificacion.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            //if not(cumpleRegla('select result from rn_Identificacion(:animal, :establecimiento, null, null, null, null, null, null, ''today'')',36))) then
            if (IBQAnimales.FieldByName('id_rp').AsString = 'N/N') then
            begin
              AEveReidentificacion.Enabled := false;
              LReidentificacion.Enabled := false;
              LReidentificacion.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    41 :  begin // Calidad de Carne
            if FPrincipal.FuncCalidadCarne then
            begin
              AEveCalidadCarne.Visible := true ;
              LCalidadCarne.Visible := true;
              LCalidadCarne.Top := vTopEve;
  //            vTopEve := vTopEve + 16;
              if not(cumpleRegla('select FIRST 1 result from RN_Calidad_Carne(:animal, NULL, NULL, NULL, NULL, :establecimiento, ''today'')',41)) then
              begin
                AEveCalidadCarne.Enabled := false;
                LCalidadCarne.Enabled := false;
                LCalidadCarne.Visible := false;
  //              vTopEve := vTopEve - 16;
              end;
            end
            else
            begin
              AEveCalidadCarne.Enabled := false;
              LCalidadCarne.Enabled := false;
              LCalidadCarne.Visible := false;
            end;
          end;
    44 :  begin // Actividad
            if FPrincipal.FuncActividad then
            begin
              AEveActividad.Visible := true;
              LActividad.Visible := true;
              LActividad.Top := vTopEve;
  ///            vTopEve := vTopEve + 16;
              if not(cumpleRegla('select FIRST 1 result from RN_Actividad(:animal, :establecimiento, ''today'', NULL,0,0,NULL)',44)) then
              begin
                AEveActividad.Enabled := false;
                LActividad.Enabled := false;
                LActividad.Visible := false;
  //              vTopEve := vTopEve - 16;
              end;
            end
            else
            begin
              AEveActividad.Enabled := false;
              LActividad.Enabled := false;
              LActividad.Visible := false;
            end;
          end;
    45 :  begin // Suplementacion
            AEveSuplementacion.Visible := true;
            LSuplementacion.Visible := true;
            LSuplementacion.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from RN_SUPLEMENTACION(:animal,''Today'',:establecimiento)',45)) then
            begin
              AEveSuplementacion.Enabled := false;
              LSuplementacion.Enabled := false;
              LSuplementacion.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    47 :  begin // Flushing  en testing
            if FPrincipal.FuncTransferencia then
            begin
              AEveFlushing.Visible := true;
              LColectaEmbriones.Visible := true;
              LColectaEmbriones.Top := vTopEve;
  //            vTopEve := vTopEve + 16;
              if not(cumpleRegla('select FIRST 1 result from RN_FLUSHING(:establecimiento,:animal,''Today'')',47)) then
              begin
                AEveFlushing.Enabled := false;
                LColectaEmbriones.Enabled := false;
                LColectaEmbriones.Visible := false;
  //              vTopEve := vTopEve - 16;
              end;
            end
            else
            begin
              AEveFlushing.Enabled := false;
              LColectaEmbriones.Enabled := false;
              LColectaEmbriones.Visible := false;
            end;
          end;
    48 :  begin // Transferencia Embrionaria     en testing
            if FPrincipal.FuncTransferencia then
            begin
              AEveTransferenciaEmbrionaria.Visible := true;
              LTransferenciaEmbrionaria.Visible := true;
              LTransferenciaEmbrionaria.Top := vTopEve;
  //            vTopEve := vTopEve + 16;
              if not(cumpleRegla('select FIRST 1 result from RN_TRANSFERENCIA(:establecimiento,:animal,''Today'',NULL,''Today'')',48)) then
              begin
                AEveTransferenciaEmbrionaria.Enabled := false;
                LTransferenciaEmbrionaria.Enabled := false;
                LTransferenciaEmbrionaria.Visible := false;
  //              vTopEve := vTopEve - 16;
              end;
            end
            else
            begin
              AEveTransferenciaEmbrionaria.Enabled := false;
              LTransferenciaEmbrionaria.Enabled := false;
              LTransferenciaEmbrionaria.Visible := false;
            end;
          end;
    52 :  begin // Extraccion de semen
            AEveExtraccionSemen.Visible := true;
            //LSuplementacion.Visible := true;
            //LSuplementacion.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from RN_EXTRACCION_SEMEN(:animal,:establecimiento,''Today'')',52)) then
            begin
              AEveExtraccionSemen.Enabled := false;
              //LSuplementacion.Enabled := false;
              //LSuplementacion.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;
    53 :  begin //  Cambio de Categoría
            AEveCambioCategoria.Visible := true;
            //LSuplementacion.Visible := true;
            //LSuplementacion.Top := vTopEve;
//            vTopEve := vTopEve + 16;
            if not(cumpleRegla('select FIRST 1 result from RN_CAMBIO_CATEGORIA(:animal,''Today'',:establecimiento)',53)) then
            begin
              AEveCambioCategoria.Enabled := false;
              //LSuplementacion.Enabled := false;
              //LSuplementacion.Visible := false;
//              vTopEve := vTopEve - 16;
            end;
          end;

    //******************************************************//
    //	INCIDENCIA: 408									                    //
    //	INICIO Llamada a evento AFIP.                       //
    //	Carla Gareis							              04/12/2014  //
    //******************************************************//
    58 :  begin //Declaración AFIP
            AEveDeclaracionAfip.Visible := True;
            AEveDeclaracionAfip.Enabled := True;
            DeclaracionAfip.Visible := True;
            if (LabelAfipValue.Caption = 'NO') then
            begin
              AEveDeclaracionAfip.Enabled := True;
              DeclaracionAfip.Enabled := True;
            end
            else
            begin
              AEveDeclaracionAfip.Enabled:= False;
              DeclaracionAfip.Enabled := False;
            end
          end;
    //******************************************************//
    //	INCIDENCIA: 408									                    //
    //	FIN Llamada a evento AFIP.                          //
    //	Carla Gareis							              04/12/2014  //
    //******************************************************//

  end;
end;

// metodo generico para ejecutar reglas del negocio
function TFREPFichaAnimal.cumpleRegla(sentencia: string; evento : integer): boolean;
var error : boolean;
begin
  error := true;
  if (evento = 9) then
  begin
  // Dummy
      IBQRNs.ParamByName('establecimiento').AsInteger := Fprincipal.EstablecimientoActual;
  end;
  IBQRNs.Close;
  IBQRNs.SQL.Clear;
  IBQRNs.SQL.Add(sentencia);
  IBQRNs.ParamByName('animal').AsInteger := Id_animal;
  if (IBQRNS.Params.FindParam('establecimiento') <>  nil) then
     IBQRNs.ParamByName('establecimiento').AsInteger := Fprincipal.EstablecimientoActual;
  IBQRNs.Open;
  IBQRNs.First;
  while (not(IBQRNs.Eof) and error)  do
    begin
      if (IBQRNs.FieldByName('result').AsString = 'E') then
        error := false;
      IBQRNs.Next;
    end;
  result := error;
end;

// con este metodo hago visible o no los posibles eventos para el animal
procedure TFREPFichaAnimal.MostrarPosiblesEventos;
var
  cod : Integer;
  v : Variant;
begin
  IBQAnimales.Close;
  IBQAnimales.Open;

  cod := IBQAnimales.FieldValues['categoria'];
  v := IBQCategorias.Lookup('id_categoria',cod,'ref_categ');
  if v <> null then
    cod := v;

  if (IBQAnimales.fieldbyname('activo').AsString = 'S') then
    begin
      noVisiblesEventos();

      IBQAux.Active := false;
      IBQAux.SQL.Clear;
      IBQAux.SQL.Add('select tipo_evento from rel_categorias_tipos_evento where categoria = :cate');
      IBQAux.ParamByName('cate').AsInteger := cod;
      IBQAux.Active := true;
      IBQAux.First;
      while not(IBQAux.Eof) do
        begin
          AdministrarEventos(IBQAux.fieldbyname('tipo_evento').AsInteger);
          IBQAux.Next;
        end;
      LAgEvento.Enabled := true;
      IAgregaEve.Enabled := true;
    end
  else
    begin
      LAgEvento.Enabled := false;
      IAgregaEve.Enabled := false;
    end;

    AlienarAcciones;

end;

procedure TFREPFichaAnimal.AbrirEventoIndividual(Eve: TFEveSimple);

begin
  if (FPrincipal.ConfiguroLector) then
    TimerLector.Enabled := false;
  //cerrarLector;

  Eve.IDAnimal := id_animal;
  Eve.ConManga := false;
  Eve.ModoEve := meIndividual;
  Eve.ShowModal;
  Eve.Destroy;

  //crearLector;
  if (FPrincipal.ConfiguroLector) then
    TimerLector.Enabled := true;

  ActualizarDatosAnimal;
  if not MasEventos then
    ActualizarEventos20(id_animal)
  else
    ActualizarEventos(id_animal);
end;

// ejecuto el evento aborto
procedure TFREPFichaAnimal.AEveAbortoExecute( Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveAborto.Create(self));
end;

// ejecuto el evento baja
procedure TFREPFichaAnimal.AEveBajaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveBaja.Create(self));
  MostrarPosiblesEventos;
end;

// ejecuto el evento calidad seminal
procedure TFREPFichaAnimal.AEveCalidadSeminalExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCalidadSeminal.Create(self));
end;

procedure TFREPFichaAnimal.AEveCambioUbicacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCambioUbicacion.Create(self));
end;

procedure TFREPFichaAnimal.AEveCapacidadServicioExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCapacidadServicio.Create(self));
end;

procedure TFREPFichaAnimal.AEveCastracionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCastracion.Create(self));
end;

procedure TFREPFichaAnimal.AEveCircunferenciaEscrotalExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCircunferenciaEscrotal.Create(self));
end;

procedure TFREPFichaAnimal.AEveCondicionCorporalExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCondicionCorporal.Create(self));
end;

procedure TFREPFichaAnimal.AEveDesteteExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveDestete.Create(self));
end;

procedure TFREPFichaAnimal.AEveDeteccionCeloExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveDeteccionCelo.Create(self));
end;

procedure TFREPFichaAnimal.AEveDiagnosticoEnfermedadExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveDiagnosticoEnfermedad.Create(self));
end;

procedure TFREPFichaAnimal.AEveDiagnosticoGestacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveDiagnosticoGestacion.Create(self));
end;

procedure TFREPFichaAnimal.AEveEgresoServicioExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveEgresoServicio.Create(self));
end;

procedure TFREPFichaAnimal.AEveEgresoToroExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveEgresoToro.Create(self));
end;

procedure TFREPFichaAnimal.AEveEvaluacionPreservicioExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveEvaluacionPreservicio.Create(self));
end;

procedure TFREPFichaAnimal.AEveFertilidadMachoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveFertilidadMacho.Create(self));
end;

procedure TFREPFichaAnimal.AEveIdentificacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveIdentificacion.Create(self, true));
end;

procedure TFREPFichaAnimal.AEveIngresoServicioExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveIngresoServicio.Create(self));
end;

procedure TFREPFichaAnimal.AEveIngresoToroExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveIngresoToro.Create(self));
end;

procedure TFREPFichaAnimal.AEveInseminacionArtificialExecute(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQSemen.Close;
  DMSoftvet.IBQSemen.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQSemen.Open;
  if (DMSoftvet.IBQSemen.FieldByName('totalToros').AsInteger = 0)then
    begin
      MostrarMensaje(tmAdvertencia, 'No existe Stock de Semen para poder inseminar');
    end
  else
    AbrirEventoIndividual(TFEveInseminacionArtificial.Create(self));
end;

procedure TFREPFichaAnimal.AEveMedicionFrameExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveMedicionFrame.Create(self));
end;

procedure TFREPFichaAnimal.AEvePartoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveParto.Create(self));
end;

procedure TFREPFichaAnimal.AEvePesoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEvePeso.Create(self));
end;

procedure TFREPFichaAnimal.AEveRaspadoTorosExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveEnfermedadesMasivas.Create(self, memRaspadoToro));
end;

procedure TFREPFichaAnimal.AEveReidentificacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveIdentificacion.Create(self, false));

end;

procedure TFREPFichaAnimal.AEveSangradoBrucelosisExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveEnfermedadesMasivas.Create(self, memSangradoBrucelosis));
end;

procedure TFREPFichaAnimal.AEveSincronizacionCeloExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveSincronizacionCelo.Create(self));
end;

procedure TFREPFichaAnimal.AEveTratamientoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveTratamiento.Create(self));
end;

procedure TFREPFichaAnimal.AEveTuberculinizacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveEnfermedadesMasivas.Create(self, memTuberculinizacion));
end;


//******************************************************//
//	INCIDENCIA: 408									                    //
//	INICIO Proceso invocado para ejecutar evento AFIP.  //
//	Carla Gareis							              04/12/2014  //
//******************************************************//
procedure TFREPFichaAnimal.AEveDeclaracionAfipExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveDeclaracionAfip.Create(self));
end;
//******************************************************//
//	INCIDENCIA: 408									                    //
//	FIN Proceso invocado para ejecutar evento AFIP.     //
//	Carla Gareis							              04/12/2014  //
//******************************************************//


// inicializo los eventos para luego configurarlo despues de acuedo a la caracteristica del animal
procedure TFREPFichaAnimal.noVisiblesEventos;
var
  ind, i : Integer;
  act : TAction;
  comp : TComponent;
begin

  {for i := 0 to PListaEventos.ComponentCount -1 do
  begin
       if (PListaEventos.Components[i] is TLabel) then
       begin
          (PListaEventos.Components[i] as TLabel).Visible := false;
          (PListaEventos.Components[i] as TLabel).Enabled := true;
       end;
  end; }

  for ind := 0 to ALUniversal.ActionCount -1 do
  begin
    act := TAction(ALUniversal.Actions[ind]);
    if (act.Category = 'Eventos') then
    begin
      act.Visible := False;
      act.Enabled := True;

     { comp := FindComponent('L'+act.Caption);
      if (comp <> nil) then
      begin
        (comp as TLabel).Visible := false;
        (comp as TLabel).Enabled := true;
      end;  }
    end;
  end;

end;

// actualizo los eventos del animal si es que se le agrego alguno
procedure TFREPFichaAnimal.ActualizarEventos(Animal : Integer);
begin
  IBQConsultaEventos.Close;
  IBQConsultaEventos.SQL.Clear;
  IBQConsultaEventos.SQL.Add('select * from get_datos_eventos(:n) '+StrFiltros+' order by fecha desc, ORDEN desc');
  IBQConsultaEventos.ParamByName('n').AsInteger := Animal;
  IBQConsultaEventos.Open;
end;

procedure TFREPFichaAnimal.ActualizarEventos20(id_animal : Integer);
begin
  IBQConsultaEventos.Close;
  IBQConsultaEventos.SQL.Clear;
  IBQConsultaEventos.SQL.Add('select first 20 * from get_datos_eventos(:n) '+StrFiltros+' order by fecha desc, ORDEN desc');
  IBQConsultaEventos.ParamByName('n').AsInteger := Animal;
  IBQConsultaEventos.Open;
end;

procedure TFREPFichaAnimal.ActivarAcciones;
var
    i : integer;
    tipo_usuario : integer;
begin
    DMSoftvet.IBQSeguridad.Open;
    DMSoftvet.IBQSeguridad.First;
    IBQAux.Close;
    IBQAux.SQL.Clear;
    IBQAux.SQL.Add('select * from REL_USUARIO_ACCION RUA join SYS_ACCIONES SA on RUA.ID_accion = SA.id_accion where RUA.id_usuario = :usuario');
    IBQAux.ParamByName('usuario').AsInteger := DMSoftvet.IBQSeguridad.FieldValues['id_usuario'];
    IBQAux.Open;
    for i:= 0 to ALUniversal.ActionCount - 1 do
      begin
        if (IBQAux.Locate('nombre',ALUniversal.Actions[i].Name,[])) then
          begin
            TAction(ALUniversal.Actions[i]).Enabled := True and TAction(ALUniversal.Actions[i]).Enabled;
            TAction(ALUniversal.Actions[i]).Update;
          end
        else
          begin
            TAction(ALUniversal.Actions[i]).Enabled := false;
            TAction(ALUniversal.Actions[i]).Update;
          end;
      end;
      AAyuda.Visible := True;
      AAyuda.Enabled := True;

      AEveActividad.Enabled := FPrincipal.FuncActividad and AEveActividad.Enabled;
      AEveCalidadCarne.Enabled := FPrincipal.FuncCalidadCarne and AEveCalidadCarne.Enabled;
      AEveTransferenciaEmbrionaria.Enabled := FPrincipal.FuncTransferencia and AEveTransferenciaEmbrionaria.Enabled;
      AEveFlushing.Enabled := FPrincipal.FuncTransferencia and AEveFlushing.Enabled;
end;

procedure TFREPFichaAnimal.DesActivarAcciones;
var i : integer;
begin
    for i:= 0 to ALUniversal.ActionCount - 1 do
       if ALUniversal.Actions[i].Name <> 'AGenSalir' then
          TAction(ALUniversal.Actions[i]).Visible := false
         else
          //dejo visible las siguientes acciones para todos los usuarios.
          TAction(ALUniversal.Actions[i]).Visible := true;
end;

// metodo para mostrar la ficha del evento
procedure TFREPFichaAnimal.AVerFichaEventoExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFFichaEvento, FFichaEvento);
  FFichaEvento.IDEvento := IBQConsultaEventos.fieldbyname('evento').AsInteger;
  FFichaEvento.ShowModal;
end;

procedure TFREPFichaAnimal.ARepImprimirReporteExecute(Sender: TObject);
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  Application.CreateForm(TFREPHistorialAnimalPreview, FREPHistorialAnimalPreview);
  FREPHistorialAnimalPreview.autoConfigurar(id_animal,StrFiltros);
  HabilitarDesabilitarControles();  
end;

procedure TFREPFichaAnimal.ARepPreviewReportePedigreeExecute(Sender: TObject);
begin
  TPanel.Enabled := true;
  PPedigree.Visible := true;
  PPedigree.Top := (PBotones.Top + (PBotones.Height div 2)) - PPedigree.Height;
  PPedigree.Left := IPedigree.Left + (IPedigree.Width div 2);
end;

procedure TFREPFichaAnimal.DSConsultaEventosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  IBQBorrado.Close;
  IBQBorrado.ParamByName('n').AsInteger := Id_animal;
  IBQBorrado.Open;

  ACEliminarEvento.Enabled := (DBGEventos.DataSource.DataSet.FieldByName('evento').AsInteger = IBQBorrado.FieldByName('evento').AsInteger) and (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0);
//  ACEliminarEvento.Enabled := (DBGEventos.DataSource.DataSet.FieldByName('evento').AsInteger = IBQBorrado.FieldByName('evento').AsInteger) and (FPrincipal.UsuarioActual = 1);

  BBAgregarFoto.Enabled := BBAgregarFoto.Enabled and (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0);

  BBEliminarFoto.Enabled := BBEliminarFoto.Enabled and (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0);
end;

procedure TFREPFichaAnimal.ACEliminarEventoExecute(Sender: TObject);
var tipoEvento : integer;
begin
  inherited;
  tipoEvento := IBQConsultaEventos.FieldByName('idtipoEvento').AsInteger;
  if ( tipoEvento = 20 ) or ( tipoEvento = 21 ) or ( tipoEvento = 15 ) or ( tipoEvento = 16 ) {or ( tipoEvento = 28 ) }then
      MostrarMensajeUndoServicio
  else
    begin
      if (tipoEvento = 23) then
      begin
        MostrarMensaje(tmError,'Para Eliminar el Nacimiento debe Eliminar el Parto cargado a la madre');
        exit;
      end;

      if (MostrarMensaje(tmConsulta, 'Esta Seguro de Eliminar el Evento ?') = mrYes)then
      begin
      try
        IBQEliminarEvento.Close;
        IBQEliminarEvento.ParamByName('IdEvento').AsInteger := DSConsultaEventos.DataSet.FieldValues['evento'];
        IBQEliminarEvento.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;

        {IBQConsultaEventos.Active := false;
        IBQConsultaEventos.ParamByName('n').AsInteger := id_animal;
        IBQConsultaEventos.Active := true;}
        if not MasEventos then
          ActualizarEventos20(id_animal)
        else
          ActualizarEventos(id_animal);

        if (IBQConsultaEventos.IsEmpty) then
          begin
          ShowMessage('Se han eliminado todos los eventos, por lo tanto se eliminó el animal');
          Close
          end
        else
          ActualizarDatosAnimal;
      except
         MostrarMensaje(tmError, 'No se pudo eliminar el evento. Existen datos relacionados al Evento o al Animal')
      end;
    end;
 end;
end;

procedure TFREPFichaAnimal.FormCreate(Sender: TObject);
begin
  inherited;
 { IGeneral, IIdentificacion, IGenealogia, IFenotipos, IDEPs, IFotos, IObservacion : TBitmap;
  IGeneralA, IIdentificacionA, IGenealogiaA, IFenotiposA, IDEPsA, IFotosA, IObservacionA : TBitmap;}

  try
    IGeneral := TBitmap.Create;
    IIdentificacion := TBitmap.Create;
    IGenealogia := TBitmap.Create;
    IFenotipos := TBitmap.Create;
    IDEPs := TBitmap.Create;
    IFotos := TBitmap.Create;
    IIdentificacionA := TBitmap.Create;
    IObservacion := TBitmap.Create;
    IGeneralA := TBitmap.Create;
    IGenealogiaA := TBitmap.Create;
    IFenotiposA := TBitmap.Create;
    IDEPsA := TBitmap.Create;
    IFotosA := TBitmap.Create;
    IObservacionA := TBitmap.Create;
    IGeneral.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\General.bmp');
    IGeneralA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\GeneralA.bmp');
    IIdentificacion.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Identificacion.bmp');
    IIdentificacionA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\IdentificacionA.bmp');
    IGenealogia.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Genealogia.bmp');
    IGenealogiaA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\GenealogiaA.bmp');
    IFenotipos.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Fenotipos.bmp');
    IFenotiposA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\FenotiposA.bmp');
    IDEPs.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\DEPs.bmp');
    IDEPsA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\DEPsA.bmp');
    IFotos.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Fotos.bmp');
    IFotosA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\FotosA.bmp');
    IObservacion.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Observacion.bmp');
    IObservacionA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\ObservacionA.bmp');
    ILVets.Add(IGeneral,nil);
    ILVets.Add(IIdentificacion,nil);
    ILVets.Add(IGenealogia,nil);
    ILVets.Add(IFenotipos,nil);
    ILVets.Add(IDEPs,nil);
    ILVets.Add(IFotos,nil);
    ILVets.Add(IObservacion,nil);
    ILVets.Add(IGeneralA,nil);
    ILVets.Add(IIdentificacionA,nil);
    ILVets.Add(IGenealogiaA,nil);
    ILVets.Add(IFenotiposA,nil);
    ILVets.Add(IDEPsA,nil);
    ILVets.Add(IFotosA,nil);
    ILVets.Add(IObservacionA,nil);

    TSBasicos.ImageIndex := 7;
    TSIdenficadores.ImageIndex := 1;
    TSTV.ImageIndex := 2;
    TSCargaFenotipos.ImageIndex := 3;
    TabSheet2.ImageIndex := 4;
    TabSheet1.ImageIndex := 5;
    TSObservacion.ImageIndex := 6;

  except
  end;


  IBQCategorias.Close;
  IBQCategorias.Open;

  ConLector := false;
  ACEliminarEvento.Enabled := false;
  evento_sel := -1;
  puede_modificar := true;
  StrFiltros := '';
  id_dep := -1;
  vDatosCompletos:= false;

  vIngresoSolapaDeps := false;
  vIngresoSolapaGenea := false;
  vIngresoSolapaFoto := false;
  vIngresoSolapaObserv := false;

  CargaResiente := false;

  JvSeleccionImagen.Top := 117;
  JvSeleccionImagen.Left := 227;
end;

procedure TFREPFichaAnimal.PasarPorArbol;
begin
  ArmarArbol2(id_animal,nodoPrincipal,'N');
  CargarGenea5;
end;

procedure TFREPFichaAnimal.PasarPorDEPs;
begin
  {CargarDatosGeneralesDeps();
  CargarDeps();
  SeleccionDepsImg;        }
  HabilitarBotones(false);
  HabilitarCompDeps(false);
end;

procedure TFREPFichaAnimal.PasarPorFeno;
begin

end;

procedure TFREPFichaAnimal.ActualizarDatosAnimal;
var PunteroPrincipal : TArrayPointer;
    sen_valor : String;
    primerLetra, segundaLetra : Char;
    cartel: TCartel;
    msje: String;
    i, rz : integer;
    V: variant;
begin
  inherited;

  cartel:= TCartel.getInstance();
  msje:= '.......................Cargando datos del animal........................';
  cartel.abrircartel(msje);

  //ActualizarEventos(id_animal);

  // RECUPERO LOS DATOS DEL ANIMAL
  IBQAnimales.Active := false;
  IBQAnimales.ParamByName('n').AsInteger := id_animal;
  IBQAnimales.Active := true;

  // DATOS ESPECIALES DE LA FECHA DEL ALTA (EVENTO)
  IBQAlta.Active := false;
  IBQAlta.ParamByName('n').AsInteger := id_animal;
  IBQAlta.Active := true;

  // OBSERVACIONES DEL ANIMAL
  IBQObservacion.Close;
  IBQObservacion.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
  IBQObservacion.ParamByName('id_animal').AsInteger:=Id_animal;
  IBQObservacion.Open;

  //OBSERVACION LARGA
  IBQObservacionLarga.Close;
  IBQObservacionLarga.ParamByName('id').AsInteger:=Id_animal;
  IBQObservacionLarga.Open;

  //* SOLAPA GENERAL *//
  new(PunteroPrincipal);

  msje:= '.......................Cargando datos del animal........................';



  rz := IBQAnimales.FieldValues['raza'];

  RazaAnimal := rz;

  LabelIDPc.Visible := false;
  LabelIDPcValue.Visible := false;
  LabelIDRAValue.Visible := false;
  LabelIDRA.Visible := false;
  LabelGeneaPC.Visible := false;
  LabelGeneaPCValue.Visible := false;
  LabelGeneaRA.Visible := false;
  LabelGeneaRAValue.Visible := false;
  LMocho.Visible := false;
  LMochoValue.Visible := false;
  LInspeccion.Visible := false;
  LInspeccionValue.Visible := false;
  LDestino.Visible := false;
  LDestinoValue.Visible := false;

  ICMG.Visible := false;
  JvLCMG.Visible := false;
  PPedigree.Height := 85;

  if ((rz = 29) or (rz = 2) or (rz = 3)) then
  begin
       ICMG.Visible := true;
       JvLCMG.Visible := true;
       PPedigree.Height := 115;
       SeleccionDepsImg;
  end;

  if ((rz <> 11) and (rz <> 12) and (rz <> 28) and (rz <> 30) and (rz <> 10)   and (rz<>4)  and (rz<>5) ) then
  begin
       TSCargaFenotipos.TabVisible := false;
       TabSheet2.TabVisible := true;
  end;

  if ((rz = 11) or (rz = 12) or (rz = 28) or (rz = 30) or (rz = 10) or(rz=4) or (rz=5) ) then
  begin
       TSCargaFenotipos.TabVisible := true;
       TabSheet2.TabVisible := true;
       PCFichaAnimal.ActivePage := TabSheet2;
       SeleccionDepsImg;
       PCFichaAnimal.ActivePage := TSBasicos;
       ArmarGraficoDatosFenotipicos;
  end
  else
  begin
       TSCargaFenotipos.TabVisible := false;
       TabSheet2.TabVisible := true;
  end;

  case rz of
    2,3 : begin
            LabelIDPC.Visible := true;
            LabelIDPCValue.Visible := true;
            LabelIDPC.Caption := Traducir('PC:');
            LabelGeneaPC.Visible := true;
            LabelGeneaPCValue.Visible := true;
            LabelGeneaPC.Caption := Traducir('PC:');
//            LabelRaza.Visible := false;
//            LabelRazaValue.Visible := false;
            if IBQAnimales.FieldValues['ID_PC'] <> null then
            begin
              LabelIDPCValue.Caption := IBQAnimales.FieldValues['ID_PC'];
              LabelGeneaPCValue.Caption := IBQAnimales.FieldValues['ID_PC'];
            end
            else
            begin
              LabelIDPCValue.Caption := '';
              LabelGeneaPCValue.Caption := '';
            end;
          end;
    10 : begin
            LabelIDPC.Visible := true;
            LabelIDPCValue.Visible := true;
            LabelIDPC.Caption := Traducir('RGB:');
            LabelGeneaPC.Visible := true;
            LabelGeneaPCValue.Visible := true;
            LabelGeneaPC.Caption := Traducir('RGB:');
            if IBQAnimales.FieldValues['ID_PC'] <> null then
            begin
              LabelIDPCValue.Caption := IBQAnimales.FieldValues['ID_PC'];
              LabelGeneaPCValue.Caption := IBQAnimales.FieldValues['ID_PC'];
            end
            else
            begin
              LabelIDPCValue.Caption := '';
              LabelGeneaPCValue.Caption := '';
            end;
            LMocho.Visible := true;
            LMochoValue.Visible := true;
            LInspeccion.Visible := true;
            LInspeccionValue.Visible := true;
            LDestino.Visible := true;
            LDestinoValue.Visible := true;
            if IBQAnimales.FieldValues['MOCHO'] <> null then
              LMochoValue.Caption := IBQAnimales.FieldValues['MOCHO']
            else
              LMochoValue.Caption := '';
            if IBQAnimales.FieldValues['INSPECCION'] <> null then
              LInspeccionValue.Caption := IBQAnimales.FieldValues['INSPECCION']
            else
              LInspeccionValue.Caption := '';
            if IBQAnimales.FieldValues['DESTINO_CAB'] <> null then
              LDestinoValue.Caption := IBQAnimales.FieldValues['DESTINO_CAB']
            else
              LDestinoValue.Caption := '';

         end;
    11 : begin
            LabelIDPC.Visible := true;
            LabelIDPCValue.Visible := true;
            LabelIDRA.Visible := true;
            LabelIDRAValue.Visible := true;
            LabelIDPC.Caption := Traducir('ABA:');
            LabelIDRA.Caption := Traducir('UBB:');
            LabelGeneaPC.Visible := true;
            LabelGeneaPCValue.Visible := true;
            LabelGeneaRA.Visible := true;
            LabelGeneaRAValue.Visible := true;
            LabelGeneaPC.Caption := Traducir('ABA:');
            LabelGeneaRA.Caption := Traducir('UBB:');
            if IBQAnimales.FieldValues['ID_PC'] <> null then
            begin
              LabelIDPCValue.Caption := IBQAnimales.FieldValues['ID_PC'];
              LabelGeneaPCValue.Caption := IBQAnimales.FieldValues['ID_PC'];
            end
            else
            begin
              LabelIDPCValue.Caption := '';
              LabelGeneaPCValue.Caption := '';
            end;
            if IBQAnimales.FieldValues['ID_RA'] <> null then
            begin
              LabelIDRAValue.Caption := IBQAnimales.FieldValues['ID_RA'];
              LabelGeneaRAValue.Caption := IBQAnimales.FieldValues['ID_RA'];
            end
            else
            begin
              LabelIDRAValue.Caption := '';
              LabelGeneaRAValue.Caption := '';
            end;
            LMocho.Visible := true;
            LMochoValue.Visible := true;
            LInspeccion.Visible := true;
            LInspeccionValue.Visible := true;
            LDestino.Visible := true;
            LDestinoValue.Visible := true;
            if IBQAnimales.FieldValues['MOCHO'] <> null then
              LMochoValue.Caption := IBQAnimales.FieldValues['MOCHO']
            else
              LMochoValue.Caption := '';
            if IBQAnimales.FieldValues['INSPECCION'] <> null then
              LInspeccionValue.Caption := IBQAnimales.FieldValues['INSPECCION']
            else
              LInspeccionValue.Caption := '';
            if IBQAnimales.FieldValues['DESTINO_CAB'] <> null then
              LDestinoValue.Caption := IBQAnimales.FieldValues['DESTINO_CAB']
            else
              LDestinoValue.Caption := '';
         end;
    12,28,30 : begin
              LabelIDPC.Visible := true;
              LabelIDPCValue.Visible := true;
              LabelIDPC.Caption := Traducir('AAB:');
              LabelGeneaPC.Visible := true;
              LabelGeneaPCValue.Visible := true;
              LabelGeneaPC.Caption := Traducir('AAB:');
              if IBQAnimales.FieldValues['ID_PC'] <> null then
              begin
                LabelIDPCValue.Caption := IBQAnimales.FieldValues['ID_PC'];
                LabelGeneaPCValue.Caption := IBQAnimales.FieldValues['ID_PC'];
              end
              else
              begin
                LabelIDPCValue.Caption := '';
                LabelGeneaPCValue.Caption := '';
              end;
              LMocho.Visible := true;
              LMochoValue.Visible := true;
              LInspeccion.Visible := true;
              LInspeccionValue.Visible := true;
              LDestino.Visible := true;
              LDestinoValue.Visible := true;
              if IBQAnimales.FieldValues['MOCHO'] <> null then
                LMochoValue.Caption := IBQAnimales.FieldValues['MOCHO']
              else
                LMochoValue.Caption := '';
              if IBQAnimales.FieldValues['INSPECCION'] <> null then
                LInspeccionValue.Caption := IBQAnimales.FieldValues['INSPECCION']
              else
                LInspeccionValue.Caption := '';
              if IBQAnimales.FieldValues['DESTINO_CAB'] <> null then
                LDestinoValue.Caption := IBQAnimales.FieldValues['DESTINO_CAB']
              else
                LDestinoValue.Caption := '';
            end;
  end;

  msje:= '              Cargando datos del animal.............';

  try
  sen_valor := IBQAnimales.fieldByName('ID_SENASA').AsString;
  if (sen_valor <> '') then primerLetra := sen_valor[1];
  if (sen_valor <> '') and (primerLetra <> ' ') then
  begin
    if (Ord(primerLetra)>=48) and (Ord(primerLetra)<=57) then
    begin
      LabelIDSenasa.Caption := Traducir('Senasa:');
      LDigVerif.Visible := false;
      Ldigito.Visible := false;
    end
    else
    begin
      segundaLetra := sen_valor[2];
      LabelIDSenasa.Caption := Traducir('CUIG - Senasa:');
      LDigVerif.Visible := true;
      Ldigito.Visible := true;
      if (Ord(segundaLetra)>=48) and (Ord(segundaLetra)<=57) then
        Ldigito.Caption := IntToStr(UFunctions.DigitoVerificadorCaravana('00'+sen_valor))
       else
         Ldigito.Caption := IntToStr(UFunctions.DigitoVerificadorCaravana(sen_valor))
    end;
  end;
  except
  end;

  LQuitarRechazo.Visible := false;//(IBQAnimales.fieldByName('estado_rechazo').AsString = 'S');
  IQuitarRechazo.Visible := false;//(IBQAnimales.fieldByName('estado_rechazo').AsString = 'S');


  LabelRPValue.Caption := IBQAnimales.fieldByName('id_rp').AsString;
  LTitulo.Caption:=LabelRPValue.Caption+Traducir('  -  Ficha del animal');
  LabelNombreAnimalValue.Caption := IBQAnimales.fieldByName('nombreAnimal').AsString;
  LColorValue.Caption := IBQAnimales.fieldByName('color').AsString;
  LColorGeneaValue.Caption := IBQAnimales.fieldByName('color').AsString;
  LabelNombreAnimalValue.Hint := LabelNombreAnimalValue.Caption;
  LabelRazaValue.Caption := IBQAnimales.fieldByName('nombreRaza').AsString;
  LabelSubcategoriaValue.Caption := IBQAnimales.fieldByName('subcategoria').AsString;
  LabelCodigoManejoValue.Caption := IBQAnimales.fieldByName('codigomanejo').AsString;
  LabelCodigoManejoValue.Hint := LabelCodigoManejoValue.Caption;
  LabelNacimientoValue.Caption := IBQAnimales.fieldByName('fecha_nacimiento').AsString;
  LabelSexoValue.Caption := IBQAnimales.fieldByName('nombreSexo').AsString;
  LabelCategoriaValue.Caption := IBQAnimales.fieldByName('nombreCategoria').AsString;

  //******************************************************//
  //	INCIDENCIA: 408									                    //
  //	INICIO Asignación valores a componentes AFIP.      //
  //	Carla Gareis							              04/12/2014  //
  //******************************************************//
  LabelAfipValue.Caption := IBQAnimales.fieldByName('informado_afip').AsString;
  //******************************************************//
  //	INCIDENCIA: 408									                    //
  //	FIN Asignación valores a componentes AFIP.          //
  //	Carla Gareis							              04/12/2014  //
  //******************************************************//

  if IBQAnimales.fieldByName('tipificacion_sanguinea').Value <> null then
  begin
    LTipSang.Visible := true;
    LTipSangValue.Visible := true;
    LTipSangValue.Caption := IBQAnimales.fieldByName('tipificacion_sanguinea').AsString;
  end
  else
  begin
    LTipSang.Visible := false;
    LTipSangValue.Visible := false;
  end;

  if IBQAnimales.fieldByName('adn').Value <> null then
  begin
    LADN.Visible := true;
    LADNValue.Visible := true;
    LADNValue.Caption := IBQAnimales.fieldByName('adn').AsString;
  end
  else
  begin
    LADN.Visible := false;
    LADNValue.Visible := false;
  end;

  IBQSubcategorizacion.Close;
  IBQSubcategorizacion.ParamByName('animal').AsInteger := Id_animal;
  IBQSubcategorizacion.Open;
  if not IBQSubcategorizacion.IsEmpty then
  begin
    LSubcategorizacion.Visible := true;
    LSubcategorizacionValue.Visible := true;
    LSubcategorizacionValue.Caption := IBQSubcategorizacion.FieldValues['nombre'];
  end;

  LabelNombreValue.Caption := '';


  if ( IBQAnimales.FieldByName('apodo').AsString = '' )  and (IBQAnimales.FieldByName('nombreAnimal').AsString = '' ) then
  begin
      LabelNombreAnimal.Visible := false;
      LabelNombreAnimalValue.Visible := false;
      LabelNombre.Visible := false;
      LabelNombreValue.Visible := false;
  end
  else if ( IBQAnimales.FieldByName('apodo').AsString = '' ) and (IBQAnimales.FieldByName('nombreAnimal').AsString <> '' ) then
       begin
          LabelNombreAnimal.Visible := false;
          LabelNombreAnimalValue.Visible := false;
          LabelNombre.Caption := 'Nombre:';
          LabelNombreValue.Caption := IBQAnimales.FieldByName('nombreAnimal').AsString;
        end
        else  if  ( IBQAnimales.FieldByName('apodo').AsString <> '' ) and (IBQAnimales.FieldByName('nombreAnimal').AsString <> '' ) then
              begin
                    LabelNombreAnimalValue.Caption := IBQAnimales.FieldByName('nombreAnimal').AsString;
                    LabelNombreValue.Caption := IBQAnimales.FieldByName('apodo').AsString;
              end;



  if(IBQAnimales.fieldByName('peso').AsString = '')then
      LabelPesoValue.Caption := Traducir('NO DEFINIDO')
  else
    LabelPesoValue.Caption := IBQAnimales.fieldByName('peso').AsString+' KGs';

  LDtaValueIngreso.Caption := IBQAnimales.FieldByName('DTA').AsString;
  if (IBQAnimales.FieldByName('activo').AsString = 'S') then
  begin
    LDtaValueEgreso.Caption := '-';
    LDtaValueEgreso.Enabled := false;
    LDtaEgreso.Enabled := false;
  end
  else
  begin
    LDtaValueEgreso.Caption := '-';
    LDtaValueEgreso.Enabled := true;
    LDtaEgreso.Enabled := true;
    LDtaValueEgreso.Caption := IBQAnimales.FieldByName('DTA_BAJA').AsString;
  end;

  if IBQAnimales.fieldByName('Cronologia').Value <> null then
    LabelCronoValue.Caption := IBQAnimales.fieldByName('Cronologia').AsString;
  LabelEdadValue.Caption := calcularEdad;

  LabelPrecioCompraValue.Caption := FormatFloat('0.00',0)+' $/KG';
  if (IBQAlta.FieldByName('fechaAlta').IsNull) then
    begin
      IBQAltaNacimientos.Active := false;
      IBQAltaNacimientos.ParamByName('n').AsInteger := id_animal;
      IBQAltaNacimientos.Active := true;
      LabelFechaAltaValue.Caption := IBQAltaNacimientos.fieldByName('fechaAlta').AsString;
      LabelTipoAltaValue.Caption:=Traducir('NACIMIENTO');
    end
   else
     begin
        LabelFechaAltaValue.Caption := IBQAlta.fieldByName('fechaAlta').AsString;
        LabelTipoAltaValue.Caption := IBQAlta.fieldByName('nombreTipoAlta').AsString;
        LabelPrecioCompraValue.Caption := FormatFloat('0.00',IBQAlta.fieldByName('precio').asFloat)+' $/KG';
     end;
  if (IBQAnimales.FieldByName('folio').Value <> null) and (IBQAnimales.FieldByName('folio').Value <> '') then
  begin
    LLinea.Visible := true;
    LNroFolio.Visible := true;
    LNroFolioValue.Visible := true;
    LLineaValue.Visible := true;
    LNroFolioValue.Caption := IBQAnimales.FieldValues['FOLIO'];
    LLineaValue.Caption := IBQAnimales.FieldValues['LINEA'];
  end
  else
  begin
    LLinea.Visible := false;
    LNroFolio.Visible := false;
    LNroFolioValue.Visible := false;
    LLineaValue.Visible := false;
  end;


  LabelPotreroValue.Caption := IBQAnimales.fieldByName('nombrePotrero').AsString;
  LabelPotreroValue.Hint := LabelPotreroValue.Caption;
  LabelRodeoValue.Caption := IBQAnimales.fieldByName('nombreRodeo').AsString;
  LabelRodeoValue.Hint := LabelRodeoValue.Caption;
  LabelEstadoActual.Caption := retornarEstado(IBQAux,id_animal);

  if (IBQAnimales.FieldByName('categoria').AsInteger = 3) then
  begin
        IHExtrac.Visible := true;
        LHExtract.Visible := true;
  end
  else
  begin
        IHExtrac.Visible := false;
        LHExtract.Visible := false;
  end;

  if(IBQAnimales.FieldByName('categoria').AsInteger= 6)then
  begin
    if(IBQAnimales.FieldByName('estado_lactacion').AsInteger = 0)then
       LabelEstadoLactacion.Caption := Traducir('NO DEFINIDO')
    else
       LabelEstadoLactacion.Caption := IBQAnimales.fieldByName('estado_lactacion').AsString;
     LabelEstadoLactacion.Visible := true;
     LabelEstadoL.Visible := true;
  end
  else
  begin
     LabelEstadoLactacion.Visible := false;
     LabelEstadoL.Visible := false;
  end;

  Application.ProcessMessages;

  msje:= '              Cargando datos del animal..........................';

  LPropietario1.Caption:= '';
  LPropietario2.Caption:= '';
  LPropietario3.Caption:= '';
  LPropietario4.Caption:= '';
  LPropietario5.Caption:= '';

  IBQPropietarios.Close;
  IBQPropietarios.ParamByName('id_animal').AsInteger:= id_animal;
  IBQPropietarios.Open;
  IBQPropietarios.First;
  i := 0;
  while not IBQPropietarios.Eof do
  begin
    case i of
      0 : begin
            LPropietario1.Visible := true;
            LPropietario1.Caption := '- '+IBQPropietarios.FieldByName('NOMBRE').AsString+': '+FormatFloat('##.##',IBQPropietarios.FieldByName('porcentaje').AsFloat)+ '%';
            LPropietario1.Hint:= LPropietario1.Caption;
          end;
      1 : begin
            LPropietario2.Visible := true;
            LPropietario2.Caption := '- '+IBQPropietarios.FieldByName('NOMBRE').AsString+': '+FormatFloat('##.##',IBQPropietarios.FieldByName('porcentaje').AsFloat)+ '%';
            LPropietario2.Hint:= LPropietario2.Caption;
          end;
      2 : begin
            LPropietario3.Visible := true;
            LPropietario3.Caption := '- '+IBQPropietarios.FieldByName('NOMBRE').AsString+': '+FormatFloat('##.##',IBQPropietarios.FieldByName('porcentaje').AsFloat)+ '%';
            LPropietario3.Hint:= LPropietario3.Caption;
          end;
      3 : begin
            LPropietario4.Visible := true;
            LPropietario4.Caption := '- '+IBQPropietarios.FieldByName('NOMBRE').AsString+': '+FormatFloat('##.##',IBQPropietarios.FieldByName('porcentaje').AsFloat)+ '%';
            LPropietario4.Hint:= LPropietario4.Caption;
          end;
      4 : begin
            LPropietario5.Visible := true;
            LPropietario5.Caption := '- '+IBQPropietarios.FieldByName('NOMBRE').AsString+': '+FormatFloat('##.##',IBQPropietarios.FieldByName('porcentaje').AsFloat)+ '%';
            LPropietario5.Hint:= LPropietario5.Caption;
          end;
      end;

      Inc(i);
      IBQPropietarios.Next;


  end;

  if i > 0 then
  begin
    LabelPropietario.Visible := true;
    if i > 1 then
      LabelPropietario.Caption := Traducir('Propietarios:');
  end;

  //* SOLAPA IDENTIFICADORES *//
  LabelIDSenasaValue.Caption := IBQAnimales.fieldByName('id_senasa').AsString;
  if (FPrincipal.Pais <> 1) then // Si el pais es distinto de Argentina toma el valor de la caravana oficial
  LabelIDSenasaValue.Caption := IBQAnimales.fieldByName('caravana_oficial').AsString;
  LabelIDPCValue.Caption := IBQAnimales.fieldByName('id_pc').AsString;
  LabelIDHBAValue.Caption := IBQAnimales.fieldByName('id_hba').AsString;
  LabelIDRAValue.Caption := IBQAnimales.fieldByName('id_ra').AsString;
  LabelIDOtroValue.Caption := IBQAnimales.fieldByName('id_otro').AsString;
  LabelIDIEValue.Caption := IBQAnimales.fieldByName('id_ie').AsString;

  // pongo la solapa que deseo para la implementacion despues va la 0
  PCFichaAnimal.TabIndex := 0;


  // SOLAPA DE ARBOL GENEALOGICO N-ARIO
  TVArbolGenea.Items.Clear;
  new(PunteroPrincipal);
  PunteroPrincipal^.id_animal := id_animal;
  PunteroPrincipal^.padres_de := 0;
  PunteroPrincipal^.nivel_arbol := 0;
  PunteroPrincipal^.raza := IBQAnimales.fieldByName('raza').AsInteger;
  PunteroPrincipal^.id_rp := IBQAnimales.fieldByName('id_rp').AsString;
  PunteroPrincipal^.id_senasa := IBQAnimales.fieldByName('id_senasa').AsString;
  PunteroPrincipal^.id_hba := IBQAnimales.fieldByName('id_hba').AsString;
  PunteroPrincipal^.id_ra := IBQAnimales.fieldByName('id_ra').AsString;
  PunteroPrincipal^.id_otro := IBQAnimales.fieldByName('id_otro').AsString;
  PunteroPrincipal^.id_pc := IBQAnimales.fieldByName('id_pc').AsString;
  PunteroPrincipal^.madre := 'N';
  PunteroPrincipal^.externo := 'N';
  PunteroPrincipal^.nombre := IBQAnimales.fieldByName('nombreAnimal').AsString;

  Application.ProcessMessages;

  //MODIFIQUE LABELNOMBREVALUE POR LABELNOMBREANIMALVALUE
  nodoPrincipal := TVArbolGenea.Items.AddObject(nil, LabelRPValue.Caption +' : '+LabelNombreValue.Caption, PunteroPrincipal);
  if (LabelSexoValue.Caption = Traducir('MACHO')) then
    nodoPrincipal.ImageIndex := 0
  else
    nodoPrincipal.ImageIndex := 1;
  nodoPrincipal.SelectedIndex := nodoPrincipal.ImageIndex;
  Indarr := 0;

 { ArmarArbol2(id_animal,nodoPrincipal,'N');
  CargarGenea5; }

  DesActivarAcciones;

  // cargo los posibles eventos en el popup que se le pueden aplicar dependiendo de la categoria del animal
  MostrarPosiblesEventos;
  ActivarAcciones;

  ACSalir.Visible := true;
  AVerFichaEvento.Visible := true;
  ARepImprimirReporte.Visible := true;
  ARepPreviewReporte.Visible := true;
  ARepPreviewReportePedigree.Visible := true;

  IRepIndividual.Enabled := IBQAnimales.FieldByName('categoria').AsInteger = 3;
  LRepIndividual.Enabled := IBQAnimales.FieldByName('categoria').AsInteger = 3;

  ComponentesVisiblesPorPais(FPrincipal.Pais);

  HabilitarComponentesVersionBasica();//para versión basico

  CargarImagenesAnimal();
  ControlarBotonEliminar();

  EAAnio.Text:= IntToStr(YearOf(Now()));
  UDAnio.Max:= YearOf(Now());

  vPrimerIngreso:= true;

  CargarDatosGeneralesDeps();
  CargarDeps();
  SeleccionDepsImg;
  //*.*.*.*.* PRUEBA DE IVAN *.*.*.*.*
   //HabilitarCompDeps(false);
  {HabilitarBotones(false);
  HabilitarCompDeps(false);}

  FormResize(nil);

  msje:= '              Cargando datos del animal...........................................';

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFREPFichaAnimal.AEveCargaBrucelosisExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCargaResultados.Create(self, memSangradoBrucelosis));
end;

procedure TFREPFichaAnimal.AEveCargaTuberculinaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCargaResultados.Create(self, memTuberculinizacion));
end;

procedure TFREPFichaAnimal.AEveCargaVenereasExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCargaResultados.Create(self, memRaspadoToro));
end;

// mensaje generico para los undo de servicio
procedure TFREPFichaAnimal.MostrarMensajeUndoServicio;
begin
  MostrarMensaje(tmInformacion, 'Para eliminar eventos relacionados con servicios, debe eliminar el servicio. La opción se encuentra en Eventos/Servicio/Eliminar Servicio');
end;

procedure TFREPFichaAnimal.AcRemoverRechazoExecute(Sender: TObject);
begin
  inherited;
   if (MostrarMensaje(tmConsulta, 'Está seguro que desea quitar la condición de Rechazo a este animal?') = mrYes)then
      begin
      try
        IBQQuitarRechazo.Close;
        IBQQuitarRechazo.ParamByName('IdAnimal').AsInteger := animal;
        IBQQuitarRechazo.Open;
        ActualizarDatosAnimal;
      except
         MostrarMensaje(tmError, 'No se pudo eliminar el evento.')
      end;
    end;
end;

procedure TFREPFichaAnimal.BBXlsClick(Sender: TObject);
begin
  inherited;
  if SDXLS.Execute then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPFichaAnimal.BBModificarClick(Sender: TObject);
var
  PuedeModificar : Boolean;
  Cont : Integer;
  Disparador : String;
  cartel: TCartel;
begin
  inherited;

  PasoDeps := false;
  PasoFeno := false;
  PasoFotos := false;
  PasoGenea := false;
  PasoIdent := false;
  PasoObs := false;

  cartel:= TCartel.getInstance();
  cartel.abrircartel('Abriendo Pantalla para Modificacion de Datos del Animal ...');

  PuedeModificar := false;
  Cont := 0;

  if not MasEventos then
    ActualizarEventos20(id_animal)
  else
    ActualizarEventos(animal);

  IBQConsultaEventos.First;

  while not IBQConsultaEventos.Eof do
  begin
      Disparador := IBQConsultaEventos.FieldByName('DISPARADOR').AsString;
      if ((Disparador = 'P') or (Disparador = 'I'))then
        Cont := Cont+1;
      IBQConsultaEventos.Next;
  end;
  if ((Cont = 1) and (IBQConsultaEventos.FieldByName('TIPOEVENTO').AsString = 'Alta Directa')) then
    PuedeModificar := true;    //Solo se puede modificar si el unico evento padre o independiente es un alta directa

  Application.CreateForm(TFEveModifDatosAnimal,FEveModifDatosAnimal);
  FEveModifDatosAnimal.ID_ANIMAL := animal;
  FEveModifDatosAnimal.Puede_Modificar:= PuedeModificar;


  cartel.cerrarcartel;
  cartel.FreeInstance;

  FEveModifDatosAnimal.ShowModal();

  ActualizarDatosAnimal;
  CargarDatosGeneralesDeps;

  vIngresoSolapaDeps := false;
  vIngresoSolapaGenea := false;
  vIngresoSolapaFoto := false;
  vIngresoSolapaObserv := false;

end;

procedure TFREPFichaAnimal.TVArbolGeneaDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
  E : TFAbmPadresExternos;
  Iabm:IButtonABM;
  animal : integer;
begin
  inherited;
  if (nodoSeleccionado <> nodoPrincipal) then
   begin
     if (nodoSeleccionado <> nil) then
      if (TArrayPointer(nodoSeleccionado.Data)^.externo = 'N') then
       begin
         F := TFREPFichaAnimal.Create(self);
         F.animal := TArrayPointer(nodoSeleccionado.Data)^.id_animal;
         F.ShowModal;
         F.Destroy;
       end
      else
        if (Iabm = nil) then
        begin
          animal := TArrayPointer(nodoSeleccionado.Data)^.id_animal;
          IBQEstabAnimalExt.Close;
          IBQEstabAnimalExt.ParamByName('animal').AsInteger := animal;
          IBQEstabAnimalExt.Open;
          Application.CreateForm(TFABMPadresExternos, FABMPadresExternos);
          FABMPadresExternos:=TFABMPadresExternos.Create(self);
          FABMPadresExternos.EstabAux := IBQEstabAnimalExt.FieldValues['establecimiento'];
          FABMPadresExternos.nom:=inttostr(animal);
          Iabm := IButtonABM(FABMPadresExternos);
          Iabm.ISetCampoRetorno('id_animal_externo');
          Iabm.IFitrate(-1,IBQEstabAnimalExt.FieldValues['establecimiento']);
          Iabm.IAbrir(faabm); (*tambien llama al ShowModal*)
        end;
   end;
end;


// parte de fotos
procedure TFREPFichaAnimal.SpinEdit1Change(Sender: TObject);
begin
  inherited;
  //THLAnimales.ThumbnailSize := SpinEdit1.Value;
end;

procedure TFREPFichaAnimal.PCFichaAnimalChange(Sender: TObject);
begin
  inherited;
  TSBasicos.ImageIndex := 0;
  TSIdenficadores.ImageIndex := 1;
  TSTV.ImageIndex := 2;
  TSCargaFenotipos.ImageIndex := 3;
  TabSheet2.ImageIndex := 4;
  TabSheet1.ImageIndex := 5;
  TSObservacion.ImageIndex := 6;
  if PCFichaAnimal.ActivePage = TSBasicos then
    TSBasicos.ImageIndex := 7;
  if PCFichaAnimal.ActivePage = TSIdenficadores then
    TSIdenficadores.ImageIndex := 8;
  if PCFichaAnimal.ActivePage = TSTV then
    TSTV.ImageIndex := 9;
  if PCFichaAnimal.ActivePage = TSCargaFenotipos then
    TSCargaFenotipos.ImageIndex := 10;
  if PCFichaAnimal.ActivePage = TabSheet2 then
    TabSheet2.ImageIndex := 11;
  if PCFichaAnimal.ActivePage = TabSheet1 then
    TabSheet1.ImageIndex := 12;
  if PCFichaAnimal.ActivePage = TSObservacion then
    TSObservacion.ImageIndex := 13;



  GBReferencias.Visible := true;

  if PCFichaAnimal.ActivePage = TSBasicos then
    PCFichaAnimal.Height := 268;

  if PCFichaAnimal.ActivePage = TSIdenficadores then
    PCFichaAnimal.Height := 232;

  if PCFichaAnimal.ActivePage = TSTV then
  begin
    PCFichaAnimal.Height := 340;
    APFoto.Height := 100;
    GBReferencias.Visible := false;
  end;

  if PCFichaAnimal.ActivePage = TSCargaFenotipos then
  begin
    PCFichaAnimal.Height := PGraficoFicha.Height + 30;
  end;

  if PCFichaAnimal.ActivePage = TabSheet2 then
  begin
    if not PasoDeps then
    begin
      PasarPorDEPs;
      PasoDeps := true;
    end;
    PCFichaAnimal.Height := 265;
    EAAnio.SetFocus;
  end;

  if PCFichaAnimal.ActivePage = TabSheet1 then
  begin
    PCFichaAnimal.Height := 224;
  end;

  if PCFichaAnimal.ActivePage = TSObservacion then
  begin
    PCFichaAnimal.Height := 216;
    if (IBQObservacionLarga.IsEmpty) then
      MObservacion.Text := IBQObservacion.FieldByName('observacion').AsString
    else
      MObservacion.Text := IBQObservacionLarga.FieldByName('observacion').AsString;
  end;

  if(PCFichaAnimal.ActivePage = TSTV)then
  begin
    if not PasoGenea then
    begin
      PasarPorArbol;
      PasoGenea := true;
    end;
    TVArbolGeneaChange(nil,TVArbolGenea.Items[0]);
  end;
end;

procedure TFREPFichaAnimal.ReporteIndividual1Click(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del Reporte Individual ...';
  cartel.abrircartel(msje);
  inherited;

  IBQRegDep.Close;
  IBQRegDep.SQL.Clear;
  IBQRegDep.SQL.Add('select first 1 * from REP_REGISTRO_DEPS(:esta,:animal,:tipo_animal)');
  IBQRegDep.ParamByName('esta').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQRegDep.ParamByName('animal').AsInteger:= id_animal;
  IBQRegDep.ParamByName('tipo_animal').AsString:= 'I';
  IBQRegDep.Open;

  Application.CreateForm(TFREPIndividual, FREPIndividual);
  FREPIndividual.SetDataSet(IBQRegDep);
  if (FPrincipal.Pais = 1) then // Argentina
    begin
      FREPIndividual.QRBand10.Enabled:= false;
    end
   else
    if (FPrincipal.Pais = 2) then // Uruguay
      begin
        FREPIndividual.QRBand7.Enabled:= false;
      end
     else
        begin
          FREPIndividual.QRBand7.Enabled:= false;
        end;


  FREPIndividual.Show;
  FRepIndividual.tiene_deps:= not IBQRegDep.IsEmpty;
  FREPIndividual.Hide;
  FREPIndividual.ID_Animal := ID_ANIMAL;
  FREPIndividual.prepararReporte(id_animal, IBQAnimales.fieldByName('establecimiento').AsInteger);
  FREPIndividual.armarArbol;
  cartel.cerrarcartel();
  cartel.FreeInstance();
  FREPIndividual.QRCRIndividual.Preview;
  HabilitarDesabilitarControles();  
  FREPIndividual.Close;
end;

procedure TFREPFichaAnimal.ReportedePedigree1Click(Sender: TObject);
var cartel: TCartel;
    msje: String;
    valor, top: integer;
    Imag : TBitmap;
begin
  MostrarMensajeImpresion();

//  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del Pedigree del animal ...';
  cartel.abrircartel(msje);

  IBQRegDep.Close;
  IBQRegDep.SQL.Clear;
  IBQRegDep.SQL.Add('select first 3 * from REP_REGISTRO_DEPS(:esta,:animal,:tipo_animal)');
  IBQRegDep.ParamByName('esta').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQRegDep.ParamByName('animal').AsInteger:= id_animal;
  IBQRegDep.ParamByName('tipo_animal').AsString:= 'I';
  IBQRegDep.Open;

  Application.CreateForm(TFREPPedigreePreview, FREPPedigreePreview);

  valor := 0;
  top := 405;

  if ((not(IBQGetImgGrafico.IsEmpty)) or (not(IBQRegDep.IsEmpty))) then
    FREPPedigreePreview.QRBand1.Height := 405
  else
    FREPPedigreePreview.QRBand1.Height := 370;

  if ((razaAnimal = 11) or (razaAnimal = 12) or (razaAnimal = 28) or (razaAnimal = 30)) then
  begin
    GuardarGrafico;
    IBQGetImgGrafico.Close;
    IBQGetImgGrafico.ParamByName('id').AsInteger := Id_animal;
    IBQGetImgGrafico.Open;

    if not(IBQGetImgGrafico.IsEmpty) then
    begin
        valor := FREPPedigreePreview.QRBand1.Height + FREPPedigreePreview.QRIGrafico.Height;
        FREPPedigreePreview.QRBand1.Height := valor + 50;
        FREPPedigreePreview.QRIGrafico.Picture.LoadFromFile(pathDirExe+'\grafico.bmp');
        FREPPedigreePreview.QRIGrafico.Visible := true;
        FREPPedigreePreview.QRIGrafico.Top := top;
        FREPPedigreePreview.QRLabel16.Enabled:= true;
        FREPPedigreePreview.QRShape54.Enabled:= true;
    end
    else
    begin
        FREPPedigreePreview.QRLabel16.Enabled:= false;
        FREPPedigreePreview.QRShape54.Enabled:= false;
        FREPPedigreePreview.QRIGrafico.Visible := false;
    end;
  end;

  if not(IBQRegDep.IsEmpty) then
  begin
        FREPPedigreePreview.QRIDeps.Picture.LoadFromFile(pathDirExe+'\deps_2.bmp');
        FREPPedigreePreview.QRIDeps.Visible := true;
        FREPPedigreePreview.QRIDeps.Top := 32;

        if (IBQRegDep.FieldValues['fuente'] <> null) then
          FREPPedigreePreview.QRLFuente.Caption := IBQRegDep.FieldValues['fuente']
        else
          FREPPedigreePreview.QRLFuente.Caption := '';

        if (IBQRegDep.FieldValues['anio'] <> null) then
          FREPPedigreePreview.QRLAnio.Caption := IBQRegDep.FieldValues['anio']
        else
          FREPPedigreePreview.QRLAnio.Caption := '';

        FREPPedigreePreview.QRBand11.Enabled:= true;
        FREPPedigreePreview.QRLabel16.Enabled:= true;
        FREPPedigreePreview.QRShape54.Enabled:= true;
        if (IBQGetImgGrafico.IsEmpty) then
          FREPPedigreePreview.QRIGrafico.Visible := false;
  end
  else
  begin
        FREPPedigreePreview.QRLabel16.Enabled:= false;
        FREPPedigreePreview.QRShape54.Enabled:= false;
        FREPPedigreePreview.QRBand11.Enabled:= false;
        FREPPedigreePreview.QRIDeps.Visible := false;
        FREPPedigreePreview.QRLabel79.Visible := false;
//        FREPPedigreePreview.QRDBText57.Visible := false;
  end;


  FREPPedigreePreview.prepararReportes(id_animal, IBQAnimales.fieldByName('establecimiento').AsInteger);
  cartel.cerrarcartel();
  cartel.FreeInstance();

  FREPPedigreePreview.ShowModal;
  FREPPedigreePreview.Destroy;
//  HabilitarDesabilitarControles();
end;

procedure TFREPFichaAnimal.THLAnimalesClick(Sender: TObject);
begin
  inherited;
  if (THLAnimales.ItemIndex <> -1) then
  begin
    with THLAnimales.Thumbnails.Items[THLAnimales.ItemIndex] do
      begin
       if (ExtractFileExt(FileName) = '.jpg') or (ExtractFileExt(FileName) = '.bmp') then
       begin
        APPreview.Picture.LoadFromFile(FileName);
        APFoto.Visible := true;
        if THLAnimales.ItemIndex > -1 then
          APFoto.Picture := APPreview.Picture
        else
          APFoto.Visible := false;
       end;
      end;
    ControlarBotonEliminar();
  end;  
end;

procedure TFREPFichaAnimal.BBAgregarFotoClick(Sender: TObject);
var foto: TThumbnail;
    nomDestino, archivo: String;
begin
  inherited;
  if (ODFotos.Execute) then
    begin
      IBQAgregarFoto.ParamByName('animal').AsInteger:= id_animal;
      IBQAgregarFoto.ExecSQL;
      FPrincipal.IBTPrincipal.CommitRetaining;
      IBQGetIdImagen.Close;
      IBQGetIdImagen.Open;

      nomDestino:= 'ani'+IntToStr(id_animal)+'id'+IntToStr(IBQGetIdImagen.fieldbyname('id_imagen').AsInteger)+'.jpg';
      foto:= THLAnimales.Thumbnails.Add;
      archivo:= ExtractFilePath(Application.ExeName)+'Fotos\'+FPrincipal.NombreEstablecimiento+'\'+nomDestino;
      CopyFile(pchar(ODFotos.FileName),pchar(archivo),true);
      SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_READONLY);
      foto.Tag:= IBQGetIdImagen.fieldbyname('id_imagen').AsInteger; //en el tag guardo el id de la imagen
      foto.Filename:= archivo;
      foto.Picture.LoadFromFile(archivo);
      THLAnimales.ItemIndex := 0;
      THLAnimalesClick(nil);
    end;
end;

procedure TFREPFichaAnimal.CargarImagenesAnimal;
var foto: TThumbnail;
    nomDestino, archivo: String;
    I : Integer;
begin
  inherited;
  THLAnimales.Thumbnails.Clear;
  APPreview.Picture:= nil;
  IBQImagen.Close;
  IBQImagen.ParamByName('animal').AsInteger:= id_animal;
  IBQImagen.Open;

  IBQImagen.First;

  while not(IBQImagen.Eof) do
   begin
      nomDestino:= 'ani'+IntToStr(id_animal)+'id'+IntToStr(IBQImagen.fieldbyname('id_imagen').AsInteger)+'.jpg';

      archivo := BuscarArchivo(ExtractFilePath(Application.ExeName)+'Fotos','*.jpg',nomDestino,faAnyFile);

      if (FileExists(archivo)) then
      begin
          foto:= THLAnimales.Thumbnails.Add;
          foto.Filename:= archivo;
          foto.Picture.LoadFromFile(archivo);
          foto.Tag:= IBQImagen.fieldbyname('id_imagen').AsInteger; //en el tag guardo el id de la imagen
      end;
      IBQImagen.Next;
   end;

  LSelFoto.Visible := I > 1;
  ISelFoto.Visible := I > 1;

  THLAnimales.ItemIndex := 0;
  THLAnimalesClick(nil);
  APFoto.Visible := true;
  if THLAnimales.ItemIndex > -1 then
    APFoto.Picture := APPreview.Picture
  else
    APFoto.Visible := false;

end;

procedure TFREPFichaAnimal.BBEliminarFotoClick(Sender: TObject);
var id_imagen: Integer;
    nomDestino, archivo: String;
begin
  inherited;
  if (THLAnimales.ItemIndex <> -1) then
    begin
     If (MostrarMensaje(tmConsulta, 'Está seguro que desea eliminar esta imagen?.') = mrYes) then
      begin
        id_imagen:= THLAnimales.Thumbnails.Items[THLAnimales.ItemIndex].Tag;
        IBQEliminarFoto.Close;
        IBQEliminarFoto.ParamByName('id_imagen').AsInteger:= id_imagen;
        IBQEliminarFoto.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
        nomDestino:= 'ani'+IntToStr(id_animal)+'id'+IntToStr(id_imagen)+'.jpg';
        archivo:= ExtractFilePath(Application.ExeName)+'Fotos\'+FPrincipal.NombreEstablecimiento+'\'+nomDestino;
        SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_NORMAL);
        DeleteFile(archivo);
        THLAnimales.DeleteSelected;
        APPreview.Picture:= nil;
        CargarImagenesAnimal();
        ControlarBotonEliminar();
      end;
    end
end;

procedure TFREPFichaAnimal.THLAnimalesExit(Sender: TObject);
begin
  inherited;
  ControlarBotonEliminar();
end;

procedure TFREPFichaAnimal.ControlarBotonEliminar;
begin

  IELiminaFOto.Visible := THLAnimales.ItemIndex <> -1;
  LEliminaFoto.Visible := THLAnimales.ItemIndex <> -1;

  ObtenerEstabAnimal;

  LAgregaFoto.Visible := (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0)
                            and (EstabAnimal = FPrincipal.EstablecimientoActual);
  IAgregaFoto.Visible := (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0)
                            and (EstabAnimal = FPrincipal.EstablecimientoActual);

  LEliminaFoto.Visible := (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0)
                            and (EstabAnimal = FPrincipal.EstablecimientoActual);
  IELiminaFOto.Visible := (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0)
                            and (EstabAnimal = FPrincipal.EstablecimientoActual);

  LSelFoto.Visible := (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0)
                            and (EstabAnimal = FPrincipal.EstablecimientoActual);
  ISelFoto.Visible := (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0)
                            and (EstabAnimal = FPrincipal.EstablecimientoActual);
end;

procedure TFREPFichaAnimal.THLAnimalesDblClick(Sender: TObject);
begin
  inherited;
  if (THLAnimales.ItemIndex <> -1) then
    WinExec(PChar(THLAnimales.Thumbnails.Items[THLAnimales.ItemIndex].filename),SW_SHOWNORMAL);
end;

procedure TFREPFichaAnimal.CrearDirectorio(dir: String);
var
  dir_aux : String;
begin
  {dir_aux := UFunctions.LimpiarCadenadeCaracteres(dir);
  if (not DirectoryExists(UFunctions.LimpiarCadenadeCaracteres(dir_aux))) then
    MkDir(dir_aux);}
  if (not DirectoryExists(dir)) then
    MkDir(dir);
end;

procedure TFREPFichaAnimal.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  LabelIDHBA.Caption:= FPrincipal.PaisHerdBook+':';
  if (pais = 1) then //Argentina
  begin
    if (LabelIDSenasaValue.Caption <> '') and (LabelIDSenasaValue.Caption[1] <> ' ') then
      if (Ord(LabelIDSenasaValue.Caption[1])>=48) and (Ord(LabelIDSenasaValue.Caption[1])<=57) then
      begin
        LabelIDSenasa.Caption:= FPrincipal.PaisNombreCaravana+':';
      end
      else
      begin
        LabelIDSenasa.Caption:= Traducir('CUIG - ') + FPrincipal.PaisNombreCaravana+':';
      end;
     LabelIDSenasaValue.Left:= LabelIdSenasa.Left+LabelIDSenasa.Width+5;//93;
  end
  else
    if (pais = 2) then //Uruguay
    begin
       LabelIDSenasaValue.Left:= LabelIdSenasa.Left+LabelIDSenasa.Width+5;//120;
       LabelIDSenasa.Caption:= FPrincipal.PaisNombreCaravana+':';
    end
    else
       begin
         LabelIDSenasaValue.Left:= LabelIdSenasa.Left+LabelIDSenasa.Width+5;//120;
         LabelIDSenasa.Caption:= FPrincipal.PaisNombreCaravana+':';
       end;
end;

procedure TFREPFichaAnimal.DBGEventosColEnter(Sender: TObject);
var
  S : String;
begin
  inherited;
  evento_sel := IBQConsultaEventos.FieldValues['evento'];
  DBGEventos.Repaint;
  DBGEventos.OnDblClick:= AVerFichaEventoExecute;
  HabilitarSegunEstablecimiento();
  LFecha.Caption := 'Fecha: '+DateToStr(IBQConsultaEventos.FieldValues['fecha']);
  LTipoE.Caption := 'Tipo: '+IBQConsultaEventos.FieldValues['CATEGORIAEVENTO'];
  LDesc.Caption := 'Descripción: '+IBQConsultaEventos.FieldValues['infoevento'];
  TPanel.Enabled := true;
  JvCPHint.Visible := true;
end;

procedure TFREPFichaAnimal.IBQConsultaEventosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  evento_sel := -1;
  DBGEventos.Repaint;
end;

procedure TFREPFichaAnimal.IBQConsultaEventosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQConsultaEventos.Last;
  IBQConsultaEventos.First;
  GBListaEventos.Caption := Traducir('Lista de Eventos (') + IntToStr(IBQConsultaEventos.RecordCount)+')';
  ARepImprimirReporte.Enabled := not(IBQConsultaEventos.IsEmpty);
  BBXls.Enabled := not(IBQConsultaEventos.IsEmpty);
  HabilitarSegunEstablecimiento;
end;

procedure TFREPFichaAnimal.TerminaThread(Sender : TObject);
begin
{  DBGEventos.DataSource := DSConsultaEventos;
  GBListaEventos.Caption := 'Lista de Eventos (' + IntToStr(IBQConsultaEventos.RecordCount)+')';
  ARepImprimirReporte.Enabled := not(IBQConsultaEventos.IsEmpty);
  BBXls.Enabled := not(IBQConsultaEventos.IsEmpty);

  IBQBorrado.Close;
  IBQBorrado.ParamByName('n').AsInteger := Id_animal;
  IBQBorrado.Open;
  ACEliminarEvento.Enabled := (DBGEventos.DataSource.DataSet.FieldByName('evento').AsInteger = IBQBorrado.FieldByName('evento').AsInteger) and (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0);
//  ACEliminarEvento.Enabled := (DBGEventos.DataSource.DataSet.FieldByName('evento').AsInteger = IBQBorrado.FieldByName('evento').AsInteger) and (FPrincipal.UsuarioActual = 1);
  BBAgregarFoto.Enabled := (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0);
  BBEliminarFoto.Enabled := (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0); }
end;

procedure TFREPFichaAnimal.DBGEventosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_END,
    VK_HOME, VK_PRIOR, VK_NEXT]) then
    begin
      evento_sel := IBQConsultaEventos.FieldValues['evento'];
      DBGEventos.Repaint;
    end;  
end;

procedure TFREPFichaAnimal.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var i: SmallInt;
begin
  inherited;
  if Msg.message = WM_MOUSEWHEEL then
    begin
    end;

end;

procedure TFREPFichaAnimal.DBGEventosTitleClick(Column: TColumn);
begin
  inherited;
  DBGEventos.OnDblClick:= nil;
end;

procedure TFREPFichaAnimal.SetModificar(const Value : boolean);
begin
  puede_modificar := Value;
end;

function TFREPFichaAnimal.GetModificar : Boolean;
begin
  Result := puede_modificar;
end;

procedure TFREPFichaAnimal.AEveCalidadCarneExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCalidadCarne.Create(self));
end;

procedure TFREPFichaAnimal.CargarDeps;
begin

  ClearDeps();

  IBQAnioParaDeps.Close;

  IBQAnioParaDeps.ParamByName('id_animal').AsInteger := id_animal;
  IBQAnioParaDeps.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

  IBQAnioParaDeps.Open;

  if ((IBQAnioParaDeps.FieldByName('ultimoanio').AsInteger <> 0) and (vPrimerIngreso)) then
  begin
    EAAnio.Text := IntToStr(IBQAnioParaDeps.FieldByName('ultimoanio').asInteger);
    vPrimerIngreso:= false;
  end;

  LAnio.Caption:= EAAnio.Text;
  LAnioUruguay.Caption:= EAAnio.Text;
  IBQDEPS.Close;
  IBQDEPS.ParamByName('anio').AsInteger:= StrToInt(EAAnio.Text);
  IBQDEPS.ParamByName('animal').AsInteger:= id_animal;
  IBQDEPS.Open;

  if not(IBQDEPS.Eof) then
    begin
      id_dep := IBQDEPS.FieldValues['id_dep'];
      BBModificarDep.Caption:= Traducir('Modificar Valores');
      insertar:= 0;
      if (FPrincipal.Pais = 1) then  //argentina
        begin
          if IBQDEPS.fieldByName('gestdep').Value<>null then
          begin
              EADEPGest.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('gestdep').AsFloat);
              EADEPAptitudBran.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('gestdep').AsFloat);
              EADEPAptitudBraf.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('gestdep').AsFloat);
              EADEPLMHereford.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('gestdep').AsFloat);
              EADEPAptitudBrahman.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('gestdep').AsFloat);
              EADEPGestShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('gestdep').AsFloat);
          end;

          if IBQDEPS.fieldByName('nacerdep').Value<>null then
          begin
              EADEPNacer.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('nacerdep').AsFloat);
              EADEPPesoNacBran.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('nacerdep').AsFloat);
              EADEPPesoNacBraf.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('nacerdep').AsFloat);
              EADEPPNHereford.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('nacerdep').AsFloat);
              EADEPPesoNacerBrahman.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('nacerdep').AsFloat);
              EADEPNacerShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('nacerdep').AsFloat);
          end;

          if IBQDEPS.fieldByName('destdep').Value<>null then
          begin
              EADEPDest.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('destdep').AsFloat);
              EADEPPesoDestBran.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('destdep').AsFloat);
              EADEPPesoDestBraf.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('destdep').AsFloat);
              EADEPPDHereford.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('destdep').AsFloat);
              EADEPPesoDestBrahman.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('destdep').AsFloat);
              EADEPDestShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('destdep').AsFloat);
          end;

          if IBQDEPS.fieldByName('lechedep').Value<>null then
          begin
              EADEPLeche.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('lechedep').AsFloat);
              EADEPLecheBran.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('lechedep').AsFloat);
              EADEPLecheBraf.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('lechedep').AsFloat);
              EADEPLecheHereford.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('lechedep').AsFloat);
              EADEPLecheBrahman.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('lechedep').AsFloat);
              EADEPLecheShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('lechedep').AsFloat);
          end;

          if IBQDEPS.fieldByName('finaldep').Value<>null then
          begin
              EADEPFinal.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('finaldep').AsFloat);
              EADEPPesoFinalBran.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('finaldep').AsFloat);
              EADEPPesoFinalBraf.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('finaldep').AsFloat);
              EADEPPFHereford.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('finaldep').AsFloat);
              EADEPPesoFinalBrahman.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('finaldep').AsFloat);
              EADEPFinalShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('finaldep').AsFloat);
          end;

          if IBQDEPS.fieldByName('cedep').Value<>null then
          begin
              EADEPCE.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('cedep').AsFloat);
              EADEPCEBran.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('cedep').AsFloat);
              EADEPCEBraf.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('cedep').AsFloat);
              EADEPCEHereford.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('cedep').AsFloat);
              EADEPCEBrahman.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('cedep').AsFloat);
              EADEPCEShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('cedep').AsFloat);
          end;

          if IBQDEPS.fieldByName('alturadep').Value<>null then
          begin
              EADEPAltura.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('alturadep').AsFloat);
              EADEPProgEco.Text := formatfloat('0;0',IBQDEPS.fieldByName('alturadep').AsFloat);
              EADEPAlturaShorthorn.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('alturadep').AsFloat);
          end;

          if IBQDEPS.fieldByName('egddep').Value<>null then
          begin
              EADEPEGD.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('egddep').AsFloat);
              EADEPGDBran.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('egddep').AsFloat);
              EADEPGDHereford.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('egddep').AsFloat);
              EADEPEGDShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('egddep').AsFloat);
          end;

          if IBQDEPS.fieldByName('egcdep').Value<>null then
          begin
              EADEPEGC.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('egcdep').AsFloat);
              EADEPGCBran.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('egcdep').AsFloat);
              EADEPPAHereford.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('egcdep').AsFloat);
              EADEPEGCShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('egcdep').AsFloat);
          end;

          if IBQDEPS.fieldByName('aobdep').Value<>null then
          begin
              EADEPAOB.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('aobdep').AsFloat);
              EADEPAOBBran.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('aobdep').AsFloat);
              EADEPAOBHereford.Text := formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('aobdep').AsFloat);
              EADEPAOBShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('aobdep').AsFloat);
          end;

          if IBQDEPS.fieldByName('porgidep').Value<>null then
          begin
              EADEPPorcGI.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('porgidep').AsFloat);
              EADEPGIBran.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('porgidep').AsFloat);
              EADEPProgHereford.Text := formatfloat('0;0',IBQDEPS.fieldByName('porgidep').AsFloat);
              EADEPPorcGIShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('porgidep').AsFloat);
          end;

          if IBQDEPS.fieldByName('porcmdep').Value<>null then
          begin
              EADEPPorcCM.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('porcmdep').AsFloat);
              EADEPPorcCMShorthorn.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('porcmdep').AsFloat);
          end;

          if IBQDEPS.fieldByName('gestprec').Value<>null then
          begin
              EAPrecGest.Text:=formatfloat('0.00',IBQDEPS.fieldByName('gestprec').AsFloat);
              EAPRECAptitudBran.Text:=formatfloat('0.00',IBQDEPS.fieldByName('gestprec').AsFloat);
              EAPRECAptitudBraf.Text:=formatfloat('0.00',IBQDEPS.fieldByName('gestprec').AsFloat);
              EAPRECLMHereford.Text :=formatfloat('0.00',IBQDEPS.fieldByName('gestprec').AsFloat);
              EAPRECAptitudBrahman.Text:=formatfloat('0.00',IBQDEPS.fieldByName('gestprec').AsFloat);
              EAPRECGestShorthorn.Text:=formatfloat('0.00',IBQDEPS.fieldByName('gestprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('nacerprec').Value<>null then
          begin
              EAPrecNacer.Text:= formatfloat('0.00',IBQDEPS.fieldByName('nacerprec').AsFloat);
              EAPRECPesoNacBran.Text:= formatfloat('0.00',IBQDEPS.fieldByName('nacerprec').AsFloat);
              EAPRECPesoNacBraf.Text:= formatfloat('0.00',IBQDEPS.fieldByName('nacerprec').AsFloat);
              EAPRECPNHereford.Text := formatfloat('0.00',IBQDEPS.fieldByName('nacerprec').AsFloat);
              EAPRECPesoNacerBrahman.Text:= formatfloat('0.00',IBQDEPS.fieldByName('nacerprec').AsFloat);
              EAPRECNacerShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('nacerprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('destprec').Value<>null then
          begin
              EAPrecDest.Text:= formatfloat('0.00',IBQDEPS.fieldByName('destprec').AsFloat);
              EAPRECPesoDestBran.Text:= formatfloat('0.00',IBQDEPS.fieldByName('destprec').AsFloat);
              EAPRECPesoDestBraf.Text:= formatfloat('0.00',IBQDEPS.fieldByName('destprec').AsFloat);
              EAPRECPDHereford.Text := formatfloat('0.00',IBQDEPS.fieldByName('destprec').AsFloat);
              EAPRECPesoDestBrahman.Text:= formatfloat('0.00',IBQDEPS.fieldByName('destprec').AsFloat);
              EAPRECDestShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('destprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('lecheprec').Value<>null  then
          begin
              EAPrecLeche.Text:= formatfloat('0.00',IBQDEPS.fieldByName('lecheprec').AsFloat);
              EAPRECLecheShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('lecheprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('finalprec').Value<>null  then
          begin
              EAPrecFinal.Text:= formatfloat('0.00',IBQDEPS.fieldByName('finalprec').AsFloat);
              EAPRECPesoFinalBran.Text:= formatfloat('0.00',IBQDEPS.fieldByName('finalprec').AsFloat);
              EAPRECPesoFinalBraf.Text:= formatfloat('0.00',IBQDEPS.fieldByName('finalprec').AsFloat);
              EAPRECPFHereford.Text := formatfloat('0.00',IBQDEPS.fieldByName('finalprec').AsFloat);
              EAPRECPesoFinalBrahman.Text:= formatfloat('0.00',IBQDEPS.fieldByName('finalprec').AsFloat);
              EAPRECFinalShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('finalprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('ceprec').Value<>null  then
          begin
              EAPrecCE.Text:= formatfloat('0.00',IBQDEPS.fieldByName('ceprec').AsFloat);
              EAPRECCEBran.Text:= formatfloat('0.00',IBQDEPS.fieldByName('ceprec').AsFloat);
              EAPRECCEBraf.Text:= formatfloat('0.00',IBQDEPS.fieldByName('ceprec').AsFloat);
              EAPRECCEHereford.Text := formatfloat('0.00',IBQDEPS.fieldByName('ceprec').AsFloat);
              EAPRECCEBrahman.Text:= formatfloat('0.00',IBQDEPS.fieldByName('ceprec').AsFloat);
              EAPRECCEShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('ceprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('alturaprec').Value<>null  then
          begin
              EAPrecAltura.Text:= formatfloat('0.00',IBQDEPS.fieldByName('alturaprec').AsFloat);
              EAPRECAlturaShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('alturaprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('egdprec').Value<>null  then
          begin
              EAPrecEGD.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egdprec').AsFloat);
              EAPRECGDBran.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egdprec').AsFloat);
              EAPRECGDHereford.Text := formatfloat('0.00',IBQDEPS.fieldByName('egdprec').AsFloat);
              EAPRECEGDShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egdprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('egcprec').Value<>null  then
          begin
              EAPrecEGC.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egcprec').AsFloat);
              EAPRECGCBran.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egcprec').AsFloat);
              EAPRECPAHereford.Text := formatfloat('0.00',IBQDEPS.fieldByName('egcprec').AsFloat);
              EAPRECEGCShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egcprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('aobprec').Value<>null  then
          begin
              EAPrecAOB.Text:= formatfloat('0.00',IBQDEPS.fieldByName('aobprec').AsFloat);
              EAPRECAOBBran.Text:= formatfloat('0.00',IBQDEPS.fieldByName('aobprec').AsFloat);
              EAPRECAOBHereford.Text := formatfloat('0.00',IBQDEPS.fieldByName('aobprec').AsFloat);
              EAPRECAOBShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('aobprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('porgiprec').Value<>null  then
          begin
              EAPrecPorcGI.Text:= formatfloat('0.00',IBQDEPS.fieldByName('porgiprec').AsFloat);
              EAPRECGIBran.Text:= formatfloat('0.00',IBQDEPS.fieldByName('porgiprec').AsFloat);
              EAPRECPorcGIShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('porgiprec').AsFloat);
          end;

          if IBQDEPS.fieldByName('porcmprec').Value<>null  then
          begin
              EAPrecPorcCM.Text:= formatfloat('0.00',IBQDEPS.fieldByName('porcmprec').AsFloat);
              EAPRECPorcCMShorthorn.Text:= formatfloat('0.00',IBQDEPS.fieldByName('porcmprec').AsFloat);
          end;

          EACrias.Text:= IBQDEPS.fieldByName('crias').AsString;
          EARodeo.Text:= IBQDEPS.fieldByName('rodeo').AsString;
          EACriasBran.Text:= IBQDEPS.fieldByName('crias').AsString;
          EARodeoBran.Text:= IBQDEPS.fieldByName('rodeo').AsString;
          EACriasBraford.Text:= IBQDEPS.fieldByName('crias').AsString;
          EADEPCriasBrahman.Text:= IBQDEPS.fieldByName('crias').AsString;
          EADEPCriasShorthorn.Text := IBQDEPS.fieldByName('crias').AsString;
          EARodeoBraford.Text:= IBQDEPS.fieldByName('rodeo').AsString;
          EADEPHijasHereford.Text := IBQDEPS.fieldByName('crias').AsString;
          EADEPRodeosHereford.Text := IBQDEPS.fieldByName('rodeo').AsString;
          EADEPCabaniasBrahman.Text := IBQDEPS.fieldByName('rodeo').AsString;
          EADEPRodeoShorthorn.Text := IBQDEPS.fieldByName('rodeo').AsString;
        end
       else
        if (FPrincipal.Pais = 2) then // Uruguay
          begin
            if IBQDEPS.fieldByName('nacerdep').Value<>null then EADEPPN.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('nacerdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('nacerdep').AsFloat);
            if IBQDEPS.fieldByName('destdep').Value<>null then EADEPPD.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('destdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('destdep').AsFloat);
            if IBQDEPS.fieldByName('lechedep').Value<>null then EADEPHL.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('lechedep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('lechedep').AsFloat);
            if IBQDEPS.fieldByName('p18dep').Value<>null then EADEPP18.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('p18dep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('p18dep').AsFloat);
            if IBQDEPS.fieldByName('cedep').Value<>null then EADEPCEUru.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('cedep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('cedep').AsFloat);
            if IBQDEPS.fieldByName('egcdep').Value<>null then EADEPEGCUru.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('egcdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('egcdep').AsFloat);
            if IBQDEPS.fieldByName('aobdep').Value<>null then EADEPAOBUru.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('aobdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('aobdep').AsFloat);

            if IBQDEPS.fieldByName('nacerprec').Value<>null then EAPrecPN.Text:= formatfloat('0.00',IBQDEPS.fieldByName('nacerprec').AsFloat);
            if IBQDEPS.fieldByName('destprec').Value<>null then EAPrecPD.Text:= formatfloat('0.00',IBQDEPS.fieldByName('destprec').AsFloat);
            if IBQDEPS.fieldByName('lecheprec').Value<>null then EAPrecHL.Text:= formatfloat('0.00',IBQDEPS.fieldByName('lecheprec').AsFloat);
            if IBQDEPS.fieldByName('p18prec').Value<>null then EAPrecP18.Text:= formatfloat('0.00',IBQDEPS.fieldByName('p18prec').AsFloat);
            if IBQDEPS.fieldByName('ceprec').Value<>null then EAPrecCEUru.Text:= formatfloat('0.00',IBQDEPS.fieldByName('ceprec').AsFloat);
            if IBQDEPS.fieldByName('egcprec').Value<>null then EAPrecEGCUru.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egcprec').AsFloat);
            if IBQDEPS.fieldByName('aobprec').Value<>null then EAPrecAOBUru.Text:= formatfloat('0.00',IBQDEPS.fieldByName('aobprec').AsFloat);

            EACriador.Text:= IBQDEPS.fieldByName('criador').AsString;
            EACodigoProp.Text:= IBQDEPS.fieldByName('codigo_propietario').AsString;
            EANhij.Text:= IBQDEPS.fieldByName('nhij').AsString;
            EANhijM.Text:= IBQDEPS.fieldByName('nhijm').AsString;
            EANhijU.Text:= IBQDEPS.fieldByName('nhiju').AsString;
          end
         else
            begin
              if IBQDEPS.fieldByName('nacerdep').Value<>null then EADEPPN.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('nacerdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('nacerdep').AsFloat);
              if IBQDEPS.fieldByName('destdep').Value<>null then EADEPPD.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('destdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('destdep').AsFloat);
              if IBQDEPS.fieldByName('lechedep').Value<>null then EADEPHL.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('lechedep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('lechedep').AsFloat);
              if IBQDEPS.fieldByName('p18dep').Value<>null then EADEPP18.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('p18dep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('p18dep').AsFloat);
              if IBQDEPS.fieldByName('cedep').Value<>null then EADEPCEUru.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('cedep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('cedep').AsFloat);
              if IBQDEPS.fieldByName('egcdep').Value<>null then EADEPEGCUru.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('egcdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('egcdep').AsFloat);
              if IBQDEPS.fieldByName('aobdep').Value<>null then EADEPAOBUru.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('aobdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('aobdep').AsFloat);

              if IBQDEPS.fieldByName('nacerprec').Value<>null then EAPrecPN.Text:= formatfloat('0.00',IBQDEPS.fieldByName('nacerprec').AsFloat);
              if IBQDEPS.fieldByName('destprec').Value<>null then EAPrecPD.Text:= formatfloat('0.00',IBQDEPS.fieldByName('destprec').AsFloat);
              if IBQDEPS.fieldByName('lecheprec').Value<>null then EAPrecHL.Text:= formatfloat('0.00',IBQDEPS.fieldByName('lecheprec').AsFloat);
              if IBQDEPS.fieldByName('p18prec').Value<>null then EAPrecP18.Text:= formatfloat('0.00',IBQDEPS.fieldByName('p18prec').AsFloat);
              if IBQDEPS.fieldByName('ceprec').Value<>null then EAPrecCEUru.Text:= formatfloat('0.00',IBQDEPS.fieldByName('ceprec').AsFloat);
              if IBQDEPS.fieldByName('egcprec').Value<>null then EAPrecEGCUru.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egcprec').AsFloat);
              if IBQDEPS.fieldByName('aobprec').Value<>null then EAPrecAOBUru.Text:= formatfloat('0.00',IBQDEPS.fieldByName('aobprec').AsFloat);

              EACriador.Text:= IBQDEPS.fieldByName('criador').AsString;
              EACodigoProp.Text:= IBQDEPS.fieldByName('codigo_propietario').AsString;
              EANhij.Text:= IBQDEPS.fieldByName('nhij').AsString;
              EANhijM.Text:= IBQDEPS.fieldByName('nhijm').AsString;
              EANhijU.Text:= IBQDEPS.fieldByName('nhiju').AsString;
            end;
   end
  else
      begin
         insertar:= 1;
         BBModificarDep.Caption:= Traducir('Insertar Valores');
         id_dep := -1;
      end;
  HabilitarFuentesDEPs();
end;

procedure TFREPFichaAnimal.ClearDeps;
begin
      if (FPrincipal.Pais = 1) then  //argentina
      begin
          EADEPLMHereford.Text := '';
          EAPRECLMHereford.Text := '';
          EADEPPNHereford.Text := '';
          EAPRECPNHereford.Text := '';
          EADEPPDHereford.Text := '';
          EAPRECPDHereford.Text := '';
          EADEPLecheHereford.Text := '';
          EADEPPFHereford.Text := '';
          EAPRECPFHereford.Text := '';
          EADEPCEHereford.Text := '';
          EAPRECCEHereford.Text := '';
          EADEPProgHereford.Text := '';
          EADEPGDHereford.Text := '';
          EAPRECGDHereford.Text := '';
          EADEPPAHereford.Text := '';
          EAPRECPAHereford.Text := '';
          EADEPAOBHereford.Text := '';
          EAPRECAOBHereford.Text := '';
          EADEPProgHereford.Text := '';
          EADEPProgEco.Text := '';
          EADEPHijasHereford.Text := '';
          EADEPRodeosHereford.Text := '';


          EADEPGest.Text:= '';
          EADEPGestShorthorn.Text:= '';
          EADEPAptitudBran.Text := '';
          EADEPAptitudBraf.Text := '';
          EADEPAptitudBrahman.Text := '';

          EADEPNacer.Text:= '';
          EADEPNacerShorthorn.Text:= '';
          EADEPPesoNacBran.Text := '';
          EADEPPesoNacBraf.Text := '';
          EADEPPesoNacerBrahman.Text := '';

          EADEPDest.Text:= '';
          EADEPDestShorthorn.Text:= '';
          EADEPPesoDestBran.Text := '';
          EADEPPesoDestBraf.Text := '';
          EADEPPesoDestBrahman.Text := '';

          EADEPLeche.Text:= '';
          EADEPLecheShorthorn.Text:= '';
          EADEPLecheBran.Text := '';
          EADEPLecheBraf.Text := '';
          EADEPLecheBrahman.Text := '';

          EADEPFinal.Text:= '';
          EADEPFinalShorthorn.Text:= '';
          EADEPPesoFinalBran.Text := '';
          EADEPPesoFinalBraf.Text := '';
          EADEPPesoFinalBrahman.Text := '';

          EADEPCE.Text:= '';
          EADEPCEShorthorn.Text:= '';
          EADEPCEBran.Text := '';
          EADEPCEBraf.Text := '';
          EADEPCEBrahman.Text := '';

          EADEPAltura.Text:= '';
          EADEPAlturaShorthorn.Text:= '';

          EADEPEGD.Text:= '';
          EADEPEGDShorthorn.Text:= '';
          EADEPGDBran.Text := '';

          EADEPEGC.Text:= '';
          EADEPEGCShorthorn.Text:= '';
          EADEPGCBran.Text := '';

          EADEPAOB.Text:= '';
          EADEPAOBShorthorn.Text:= '';
          EADEPAOBBran.Text := '';

          EADEPPorcGI.Text:= '';
          EADEPPorcGIShorthorn.Text:= '';
          EADEPGIBran.Text := '';

          EADEPPorcCM.Text:= '';
          EADEPPorcCMShorthorn.Text:= '';

          EAPrecGest.Text:= '';
          EAPRECGestShorthorn.Text:= '';
          EAPRECAptitudBran.Text := '';
          EAPRECAptitudBraf.Text := '';
          EAPRECAptitudBrahman.Text := '';

          EAPrecNacer.Text:= '';
          EAPRECNacerShorthorn.Text:= '';
          EAPRECPesoNacBran.Text := '';
          EAPRECPesoNacBraf.Text := '';
          EAPRECPesoNacerBrahman.Text := '';

          EAPrecDest.Text:= '';
          EAPRECDestShorthorn.Text:= '';
          EAPRECPesoDestBran.Text := '';
          EAPRECPesoDestBraf.Text := '';
          EAPRECPesoDestBrahman.Text := '';

          EAPrecLeche.Text:= '';
          EAPRECLecheShorthorn.Text:= '';

          EAPrecFinal.Text:= '';
          EAPRECFinalShorthorn.Text:= '';
          EAPRECPesoFinalBran.Text := '';
          EAPRECPesoFinalBraf.Text := '';
          EAPRECPesoFinalBrahman.Text := '';

          EAPrecCE.Text:= '';
          EAPRECCEShorthorn.Text:= '';
          EAPRECCEBran.Text := '';
          EAPRECCEBraf.Text := '';
          EAPRECCEBrahman.Text := '';

          EAPrecAltura.Text:= '';
          EAPRECAlturaShorthorn.Text:= '';

          EAPrecEGD.Text:= '';
          EAPRECEGDShorthorn.Text:= '';
          EAPRECGDBran.Text := '';

          EAPrecEGC.Text:= '';
          EAPRECEGCShorthorn.Text:= '';
          EAPRECGCBran.Text := '';

          EAPrecAOB.Text:= '';
          EAPRECAOBShorthorn.Text:= '';
          EAPRECAOBBran.Text := '';

          EAPrecPorcGI.Text:= '';
          EAPRECPorcGIShorthorn.Text:= '';
          EAPRECGIBran.Text := '';

          EAPrecPorcCM.Text:= '';
          EAPRECPorcCMShorthorn.Text:= '';

          EACrias.Text:= '';
          EACriasBran.Text := '';
          EACriasBraford.Text := '';
          EADEPCriasBrahman.Text := '';
          EADEPCriasShorthorn.Text := '';

          EARodeo.Text:= '';
          EARodeoBran.Text := '';
          EARodeoBraford.Text := '';
          EADEPCabaniasBrahman.Text := '';
          EADEPCriasShorthorn.Text := '';
        end
       else
        if (FPrincipal.Pais = 2) then // Uruguay
          begin
            EADEPPN.Text:= '';
            EADEPPD.Text:= '';
            EADEPHL.Text:= '';
            EADEPP18.Text:= '';
            EADEPCEUru.Text:= '';
            EADEPEGCUru.Text:= '';
            EADEPAOBUru.Text:= '';

            EAPrecPN.Text:= '';
            EAPrecPD.Text:= '';
            EAPrecHL.Text:= '';
            EAPrecP18.Text:= '';
            EAPrecCEUru.Text:= '';
            EAPrecEGCUru.Text:= '';
            EAPrecAOBUru.Text:= '';

            EACriador.Text:= '';
            EACodigoProp.Text:= '';
            EANhij.Text:= '';
            EANhijM.Text:= '';
            EANhijU.Text:= '';
         end
        else 
            begin
              EADEPPN.Text:= '';
              EADEPPD.Text:= '';
              EADEPHL.Text:= '';
              EADEPP18.Text:= '';
              EADEPCEUru.Text:= '';
              EADEPEGCUru.Text:= '';
              EADEPAOBUru.Text:= '';

              EAPrecPN.Text:= '';
              EAPrecPD.Text:= '';
              EAPrecHL.Text:= '';
              EAPrecP18.Text:= '';
              EAPrecCEUru.Text:= '';
              EAPrecEGCUru.Text:= '';
              EAPrecAOBUru.Text:= '';

              EACriador.Text:= '';
              EACodigoProp.Text:= '';
              EANhij.Text:= '';
              EANhijM.Text:= '';
              EANhijU.Text:= '';
           end;
end;

procedure TFREPFichaAnimal.EADEPGestKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9','+','-',',',' ','.'])) or (Length(TEditAuto(Sender).Text) >= 6)) and (key <> #8)) then key:=#0;

  if (key = '.') then
    key:= ',';
end;

function TFREPFichaAnimal.CheckFormatoDep(var Valor: String): Boolean;
var auxvalor: double;
    i: Integer;
    campo, decimales: String;
begin
  result:= false;

  if (Valor <> '') then
    begin
      if (((Valor[1] = '+') or (Valor[1] = '-'))) then
        begin
          campo:= '';
          for i:= 2 to  Length(Valor) do
             campo:= campo + Valor[i];
         /// Verifica si el String es un Flotante
          if (TryStrToFloat(campo,auxvalor)) then
            begin
              result:= true;
              decimales:= '';
              // Si en realidad es un entero, le añade un decimal
              if (IsInteger(campo)) then
                decimales:= ',0';
              Valor:= Valor[1] + FloatToStr(auxvalor) + decimales;
            end;
        end
    end
   else
     result:= true;
end;

procedure TFREPFichaAnimal.EADEPGestExit(Sender: TObject);
var valor:String;
begin
  inherited;
  if (TEditAuto(Sender).Name <> 'EADEPRodeosHereford') then
  begin
      valor:= TEditAuto(Sender).Text;
      if not (CheckFormatoDep(valor)) then
      begin
          MostrarMensaje(tmError, 'Valor de DEP inválido. El formato debe ser +/-1,2');
          TEditAuto(Sender).SetFocus;
          TEditAuto(Sender).SelectAll;
      end
      else
      begin
          if (TEditAuto(Sender).Text <> '') then
              if (((StrToFloat(TEditAuto(Sender).Text) < -150) or (StrToFloat(TEditAuto(Sender).Text) > 150))) then
              begin
                  MostrarMensaje(tmError, 'Valor de DEP. se debe encontrar entre 0 y 150.');
                  TEditAuto(Sender).SetFocus;
                  TEditAuto(Sender).SelectAll;
              end;
              
          TEditAuto(Sender).Text:= valor;
      end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecGestKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9',',','.'])) or (Length(TEditAuto(Sender).Text) >= 4)) and (key <> #8)) then key:=#0;

  if (key = '.') then
    key:= ',';  
end;

procedure TFREPFichaAnimal.EAPrecGestExit(Sender: TObject);
var valor : String;
begin
  inherited;
  if (TEditAuto(Sender).Name <> 'EADEPProgHereford') then
  begin
      valor:= TEditAuto(Sender).Text;
      if (CheckFormatoPrec(valor)) then
      begin
          if (TEditAuto(Sender).Text <> '') then
              if (((StrToFloat(TEditAuto(Sender).Text) < 0) or (StrToFloat(TEditAuto(Sender).Text) > 1))) then
              begin
                  MostrarMensaje(tmError, 'Valor de Prec. se debe encontrar entre 0 y 1.');
                  TEditAuto(Sender).SetFocus;
                  TEditAuto(Sender).SelectAll;
              end;
      end
      else
      begin
          MostrarMensaje(tmError, 'Valor de Prec inválido. El formato debe ser 0,84');
          TEditAuto(Sender).SetFocus;
          TEditAuto(Sender).SelectAll;
      end;
  end;
end;

procedure TFREPFichaAnimal.EAAnioChange(Sender: TObject);
begin
  inherited;
  if (EAAnio.Text <> '') then
    if (Length(EAAnio.Text) = 4) then
      CargarDeps();
  EADatoDepChange(nil);
end;

procedure TFREPFichaAnimal.CargarDatosGeneralesDeps;
var nom,str,str2:string;
    i:integer;
begin
  IBQRegDep.Close;
  IBQRegDep.SQL.Clear;
  IBQRegDep.SQL.Add('select * from REP_REGISTRO_DEPS(:esta,:animal,:tipo_animal)');
  IBQRegDep.ParamByName('esta').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQRegDep.ParamByName('animal').AsInteger:= id_animal;
  IBQRegDep.ParamByName('tipo_animal').AsString:= 'I';
  IBQRegDep.Open;

  if (FPrincipal.Pais = 1) then // Argentina
    begin
      IBQPadres.Close;
      IBQPadres.SQL.Clear;
      IBQPadres.SQL.Add('select * from REP_PADRES(:esta,:animal,:tipo_animal)');
      IBQPadres.ParamByName('esta').AsInteger:= FPrincipal.EstablecimientoActual;
      IBQPadres.ParamByName('animal').AsInteger:= id_animal;
      IBQPadres.ParamByName('tipo_animal').AsString:= 'I';
      IBQPadres.Open;


      if IBQPadres.fieldbyname('padre').AsString = '' then
      begin
        LNombrePadreDep.Caption:= IBQPadres.fieldbyname('rppadre').AsString;
        LDepNombrePadreBraford.Caption := IBQPadres.fieldbyname('rppadre').AsString;
        LDepNombrePadreBrangus.Caption := IBQPadres.fieldbyname('rppadre').AsString;
        LDepNombrePadreHereford.Caption := IBQPadres.fieldbyname('rppadre').AsString;
        LDepPadreAnimalShorthorn.Caption := IBQPadres.fieldbyname('rppadre').AsString;
      end
      else
      begin
        LNombrePadreDep.Caption:= IBQPadres.fieldbyname('padre').AsString;
        LDepNombrePadreBraford.Caption := IBQPadres.fieldbyname('padre').AsString;
        LDepNombrePadreBrangus.Caption := IBQPadres.fieldbyname('padre').AsString;
        LDepNombrePadreHereford.Caption := IBQPadres.fieldbyname('padre').AsString;
        LDepPadreAnimalShorthorn.Caption := IBQPadres.fieldbyname('padre').AsString;
      end;

      if IBQPadres.fieldbyname('madre').AsString = '' then
      begin
        LNombreMadreDep.Caption:= IBQPadres.fieldbyname('rpmadre').AsString;
        LDepNombreMadreBraford.Caption := IBQPadres.fieldbyname('rpmadre').AsString;
        LDepNombreMadreBrangus.Caption := IBQPadres.fieldbyname('rpmadre').AsString;
        LDepMadreAnimalShorthorn.Caption := IBQPadres.fieldbyname('rpmadre').AsString;
      end
      else
      begin
        LNombreMadreDep.Caption:= IBQPadres.fieldbyname('madre').AsString;
        LDepNombreMadreBraford.Caption := IBQPadres.fieldbyname('madre').AsString;
        LDepNombreMadreBrangus.Caption := IBQPadres.fieldbyname('madre').AsString;
        LDepMadreAnimalShorthorn.Caption := IBQPadres.fieldbyname('madre').AsString;
      end;

      if not IBQPadres.IsEmpty then
      begin
        if IBQPadres.FieldValues['idpadre'] <> null then
        begin
          LNombrePadreDEP.Tag := IBQPadres.FieldValues['idpadre'];
          LDepNombrePadreBraford.Tag := IBQPadres.FieldValues['idpadre'];
          LDepNombrePadreBrangus.Tag := IBQPadres.FieldValues['idpadre'];
          LDepNombrePadreHereford.Tag := IBQPadres.FieldValues['idpadre'];
          LDepPadreAnimalShorthorn.Tag := IBQPadres.FieldValues['idpadre'];
          if IBQPadres.FieldByName('tipo_animal_padre').AsString = 'E' then
          begin
            LNombrePadreDEP.Transparent := true;
            LDepNombrePadreBraford.Transparent := true;
            LDepNombrePadreBrangus.Transparent := true;
            LDepNombrePadreHereford.Transparent := true;
            LDepPadreAnimalShorthorn.Transparent := true;
          end
          else
          begin
            LNombrePadreDEP.Transparent := false;
            LDepNombrePadreBraford.Transparent := false;
            LDepNombrePadreBrangus.Transparent := false;
            LDepNombrePadreHereford.Transparent := false;
            LDepPadreAnimalShorthorn.Transparent := false;
          end;
        end;
        if IBQPadres.FieldValues['idmadre'] <> null then
        begin
          LNombreMadreDEP.Tag := IBQPadres.FieldValues['idmadre'];
          LDepNombreMadreBraford.Tag := IBQPadres.FieldValues['idmadre'];
          LDepNombreMadreBrangus.Tag := IBQPadres.FieldValues['idmadre'];
          LDepMadreAnimalShorthorn.Tag := IBQPadres.FieldValues['idmadre'];
          if IBQPadres.FieldByName('tipo_animal_madre').AsString = 'E' then
          begin
            LNombreMadreDEP.Transparent := true;
            LDepNombreMadreBraford.Transparent := true;
            LDepNombreMadreBrangus.Transparent := true;
            LDepMadreAnimalShorthorn.Transparent := true;
          end
          else
          begin
            LNombreMadreDEP.Transparent := false;
            LDepNombreMadreBraford.Transparent := false;
            LDepNombreMadreBrangus.Transparent := false;
            LDepMadreAnimalShorthorn.Transparent := false;
          end;            
        end;
      end;

      if ((RazaAnimal = 29) or (RazaAnimal = 2) or (RazaAnimal = 3)) then
      begin
          PArgentina.Visible := true;
          PArgentina.Align := alClient;
          PUruguay.Visible := false;
          PUruguay.SendToBack;
          PArgentinaBrangus.Visible := false;
          PArgentinaBrangus.SendToBack;
          PArgentinaBraford.Visible := false;
          PArgentinaBraford.SendToBack;
          PArgentinaHereford.Visible := false;
          PArgentinaHereford.SendToBack;
          PArgentinaBrahman.Visible := false;
          PArgentinaBrahman.SendToBack;
          PArgentinaShorthorn.Visible := false;
          PArgentinaShorthorn.SendToBack;
          PFuenteDeps.Align := alBottom;
          PFuenteDeps.Visible := true;
          PFuenteDeps.Left := 72;
      end
      else
        if ((RazaAnimal = 28) or (RazaAnimal = 12) or (RazaAnimal = 30)) then
        begin
            PArgentina.Visible := false;
            PArgentina.SendToBack;
            PArgentinaBrangus.Visible := true;
            PArgentinaBraford.Visible := false;
            PArgentinaBraford.SendToBack;
            PArgentinaHereford.Visible := false;
            PArgentinaHereford.SendToBack;
            PArgentinaBrahman.Visible := false;
            PArgentinaBrahman.SendToBack;
            PArgentinaBrangus.Align := alClient;
            PArgentinaShorthorn.Visible := false;
            PArgentinaShorthorn.SendToBack;
            PUruguay.Visible:= false;
            PUruguay.SendToBack;
            PFuenteDeps.Align := alBottom;
            PFuenteDeps.Visible := true;
            PFuenteDeps.Left := 72;
        end
        else
          if (RazaAnimal = 11) then
          begin
              PArgentina.Visible := false;
              PArgentina.SendToBack;
              PArgentinaBrangus.Visible := false;
              PArgentinaBrangus.SendToBack;
              PArgentinaBraford.Visible := true;
              PArgentinaHereford.Visible := false;
              PArgentinaHereford.SendToBack;
              PArgentinaBrahman.Visible := false;
              PArgentinaBrahman.SendToBack;
              PArgentinaBraford.Align := alClient;
              PArgentinaShorthorn.Visible := false;
              PArgentinaShorthorn.SendToBack;
              PUruguay.Visible:= false;
              PUruguay.SendToBack;
              PFuenteDeps.Align := alBottom;
              PFuenteDeps.Visible := true;
              PFuenteDeps.Left := 72;
          end
          else
            if ((RazaAnimal = 4) or (RazaAnimal = 5)) then
            begin
                PArgentina.Visible := false;
                PArgentina.SendToBack;
                PArgentinaBrangus.Visible := false;
                PArgentinaBrangus.SendToBack;
                PArgentinaBraford.Visible := false;
                PArgentinaBraford.SendToBack;
                PArgentinaHereford.Visible := true;
                PArgentinaBrahman.Visible := false;
                PArgentinaBrahman.SendToBack;
                PArgentinaHereford.Align := alClient;
                PArgentinaShorthorn.Visible := false;
                PArgentinaShorthorn.SendToBack;
                PUruguay.Visible:= false;
                PUruguay.SendToBack;
                PFuenteDeps.Align := alBottom;
                PFuenteDeps.Visible := true;
                PFuenteDeps.Left := 72;
            end
            else
              if (RazaAnimal = 10) then
              begin
                  PArgentina.Visible := false;
                  PArgentina.SendToBack;
                  PArgentinaBrangus.Visible := false;
                  PArgentinaBrangus.SendToBack;
                  PArgentinaBraford.Visible := false;
                  PArgentinaBraford.SendToBack;
                  PArgentinaHereford.Visible := false;
                  PArgentinaHereford.SendToBack;
                  PArgentinaBrahman.Visible := true;
                  PArgentinaBrahman.Align := alClient;
                  PArgentinaShorthorn.Visible := false;
                  PArgentinaShorthorn.SendToBack;
                  PUruguay.Visible:= false;
                  PUruguay.SendToBack;
                  PFuenteDeps.Align := alBottom;
                  PFuenteDeps.Visible := true;
                  PFuenteDeps.Left := 72;
              end
              else
                if (RazaAnimal = 7) then
                begin
                    PArgentina.Visible := false;
                    PArgentina.SendToBack;
                    PArgentinaBrangus.Visible := false;
                    PArgentinaBrangus.SendToBack;
                    PArgentinaBraford.Visible := false;
                    PArgentinaBraford.SendToBack;
                    PArgentinaHereford.Visible := false;
                    PArgentinaHereford.SendToBack;
                    PArgentinaBrahman.Visible := false;
                    PArgentinaBrahman.SendToBack;
                    PArgentinaShorthorn.Align := alClient;
                    PArgentinaShorthorn.Visible := true;
                    PUruguay.Visible:= false;
                    PUruguay.SendToBack;
                    PFuenteDeps.Align := alBottom;
                    PFuenteDeps.Visible := true;
                    PFuenteDeps.Left := 72;
                end
                else
                begin
                    PArgentina.Visible := true;
                    PArgentina.Align := alClient;
                    PUruguay.Visible := false;
                    PUruguay.SendToBack;
                    PArgentinaBrangus.Visible := false;
                    PArgentinaBrangus.SendToBack;
                    PArgentinaBraford.Visible := false;
                    PArgentinaBraford.SendToBack;
                    PArgentinaHereford.Visible := false;
                    PArgentinaHereford.SendToBack;
                    PArgentinaBrahman.Visible := false;
                    PArgentinaBrahman.SendToBack;
                    PArgentinaShorthorn.Visible := false;
                    PArgentinaShorthorn.SendToBack;
                    PFuenteDeps.Align := alBottom;
                    PFuenteDeps.Visible := true;
                    PFuenteDeps.Left := 72;
                end;


      LNombreAnimalDEP.Caption:= '';
      LDepNombreAnimalBraford.Caption := '';
      LDepNombreAnimalBrangus.Caption := '';
      LDEPNombreAnimalHereford.Caption := '';
      LDepNombreAnimalBrahman.Caption := '';
      LDepNombreAnimalShorthorn.Caption := '';

      LHBADEP.Caption:= '';
      LDepHbaAnimalBraford.Caption := '';
      LDepHbaAnimalBrangus.Caption := '';
      LDEPHbaAnimalHereford.Caption := '';
      LDepHbaAnimalBrahman.Caption := '';
      LDepHbaAnimalShorthorn.Caption := '';

      LAnioNacDEP.Caption:= '';
      LDepNacAnimalBrangus.Caption := '';
      LDepNacAnimalBraford.Caption := '';
      LDEPFechaNacAnimalHereford.Caption := '';
      LDepNacAnimalBrahman.Caption := '';
      LDepAnioNacAnimalShorthorn.Caption := '';

      if (IBQAnimales.fieldByName('nombreAnimal').Value <> null) then
      begin
          LNombreAnimalDEP.Caption:= IBQAnimales.fieldByName('nombreAnimal').AsString;
          LDepNombreAnimalBraford.Caption := IBQAnimales.fieldByName('nombreAnimal').AsString;
          LDepNombreAnimalBrangus.Caption := IBQAnimales.fieldByName('nombreAnimal').AsString;
          LDEPNombreAnimalHereford.Caption := IBQAnimales.fieldByName('nombreAnimal').AsString;
          LDepNombreAnimalBrahman.Caption := IBQAnimales.fieldByName('nombreAnimal').AsString;
          LDepNombreAnimalShorthorn.Caption := IBQAnimales.fieldByName('nombreAnimal').AsString;
      end;

      if (IBQAnimales.fieldByName('id_hba').Value <> null) then
      begin
          LHBADEP.Caption:= IBQAnimales.fieldByName('id_hba').AsString;
          LDepHbaAnimalBraford.Caption := IBQAnimales.fieldByName('id_hba').AsString;
          LDepHbaAnimalBrangus.Caption := IBQAnimales.fieldByName('id_hba').AsString;
          LDEPHbaAnimalHereford.Caption := IBQAnimales.fieldByName('id_hba').AsString;
          LDepHbaAnimalBrahman.Caption := IBQAnimales.fieldByName('id_hba').AsString;
          LDepHbaAnimalShorthorn.Caption := IBQAnimales.fieldByName('id_hba').AsString;
      end;

      if (IBQAnimales.fieldByName('fecha_nacimiento').Value <> null) then
      begin
          LAnioNacDEP.Caption:= IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
          LDepNacAnimalBraford.Caption := IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
          LDepNacAnimalBrangus.Caption := IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
          LDEPFechaNacAnimalHereford.Caption := DateTimeToStr(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime);
          LDepNacAnimalBrahman.Caption := IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
          LDepAnioNacAnimalShorthorn.Caption := IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
      end;

      if (RazaAnimal = 11) then
      begin
           if (IBQAnimales.fieldByName('apodo').Value <> null) then
             LDepApodoAnimalBraford.Caption := IBQAnimales.fieldByName('apodo').AsString
           else
             LDepApodoAnimalBraford.Caption := '';

           if (IBQAnimales.fieldByName('id_pc').Value <> null) then
              LDepAbaAnimalBraford.Caption := IBQAnimales.fieldByName('id_pc').AsString
           else
              LDepAbaAnimalBraford.Caption := '';
      end;
    end
   else
     if (FPrincipal.Pais = 2) then // Uruguay
       begin
          PUruguay.Visible:= true;
          PUruguay.Align:= alClient;
          PArgentina.Visible:= false;
          LHBUDEP.Caption:= '';
          LRPUruguay.Caption:= '';
          LNacimientoUruguay.Caption:= '';
          LNombreDepUruguay.Caption:= '';

          LHBUDEP.Caption:= IBQAnimales.fieldByName('id_hba').AsString;
          LRPUruguay.Caption:= IBQAnimales.fieldByName('id_rp').AsString;
          LNacimientoUruguay.Caption:= IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
          LNombreDepUruguay.Caption:=partirString(IBQAnimales.fieldByName('nombreAnimal').AsString,13);
       end
     else
         begin
            PUruguay.Visible:= true;
            PUruguay.Align:= alClient;
            PArgentina.Visible:= false;
            LHBUDEP.Caption:= '';
            LRPUruguay.Caption:= '';
            LNacimientoUruguay.Caption:= '';
            LNombreDepUruguay.Caption:= '';

            LHBUDEP.Caption:= IBQAnimales.fieldByName('id_hba').AsString;
            LRPUruguay.Caption:= IBQAnimales.fieldByName('id_rp').AsString;
            LNacimientoUruguay.Caption:= IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
            LNombreDepUruguay.Caption:=partirString(IBQAnimales.fieldByName('nombreAnimal').AsString,13);
         end;
end;

procedure TFREPFichaAnimal.BBImprimirDepsClick(Sender: TObject);
begin
  inherited;

  IBQRegDep.Close;
  IBQRegDep.SQL.Clear;
  IBQRegDep.SQL.Add('select first 3 * from REP_REGISTRO_DEPS(:esta,:animal,:tipo_animal)');
  IBQRegDep.ParamByName('esta').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQRegDep.ParamByName('animal').AsInteger:= id_animal;
  IBQRegDep.ParamByName('tipo_animal').AsString:= 'I';
  IBQRegDep.Open;

  if not(IBQRegDep.IsEmpty) then
    begin
      Application.CreateForm(TFRepRegHistoricoDEPSPreview, FRepRegHistoricoDEPSPreview);
      FRepRegHistoricoDEPSPreview.SetearDataSet(IBQRegDep);
      if (FPrincipal.Pais = 1) then // Argentina
        begin
          FRepRegHistoricoDEPSPreview.QRLNombre.Caption:= IBQAnimales.fieldByName('nombreAnimal').AsString;
          FRepRegHistoricoDEPSPreview.QRLHBA.Caption:= IBQAnimales.fieldByName('id_hba').AsString;
          FRepRegHistoricoDEPSPreview.QRLAnio.Caption:= IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
          FRepRegHistoricoDEPSPreview.QRLPadre.Caption:= LNombrePadreDEP.Caption;
          FRepRegHistoricoDEPSPreview.QRLMadre.Caption:= LNombreMadreDEP.Caption;          
        end
      else
        if (FPrincipal.Pais = 2) then // Uruguay
          begin
            FRepRegHistoricoDEPSPreview.QRLRPUru.Caption:= IBQAnimales.fieldByName('id_rp').AsString;
            FRepRegHistoricoDEPSPreview.QRLNombreUru.Caption:= IBQAnimales.fieldByName('nombreAnimal').AsString;
            FRepRegHistoricoDEPSPreview.QRLHBU.Caption:= IBQAnimales.fieldByName('id_hba').AsString;
            FRepRegHistoricoDEPSPreview.QRLNacUru.Caption:= IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
          end
        else
            begin
              FRepRegHistoricoDEPSPreview.QRLRPUru.Caption:= IBQAnimales.fieldByName('id_rp').AsString;
              FRepRegHistoricoDEPSPreview.QRLNombreUru.Caption:= IBQAnimales.fieldByName('nombreAnimal').AsString;
              FRepRegHistoricoDEPSPreview.QRLHBU.Caption:= IBQAnimales.fieldByName('id_hba').AsString;
              FRepRegHistoricoDEPSPreview.QRLNacUru.Caption:= IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
            end;


      FRepRegHistoricoDEPSPreview.QRRegHistoDeps.PreviewModal;
    end
   else
      MostrarMensaje(tmAdvertencia, 'Este animal no tiene cargado DEPs.');
end;

procedure TFREPFichaAnimal.LFuenteMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LFuente.Font.Color:= $00606C02;
      LFuente.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFREPFichaAnimal.LFuenteMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LFuente.Font.Color:= clWindowText;
      LFuente.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFREPFichaAnimal.LFuenteClick(Sender: TObject);
var
  F : TFABMFuentesDeps;
  cant_fuentes : Integer;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      //FPrincipal.AbrirFormNormal(TFABMFuentesDeps.Create(self));
      F := TFABMFuentesDeps.Create(self);
      if IBQAnimales.FieldValues['raza'] <> null then
        if IBQAnimales.FieldValues['raza'] > 0 then //Que tenga raza y que este definida
          F.Raza := IBQAnimales.FieldValues['raza'];
      F.inserta_nuevo := true;
      F.ShowModal;
      AbrirFuentesDeps;
      DBLCBAFuenteDeps.KeyValue := F.Fuente;
      IBQAgregado.Close;
      IBQAgregado.Open;
      DBLCBAFuenteDeps.KeyValue := IBQAgregado.FieldValues['ID_FUENTE_DEPS'];
      F.Destroy;
  end;
end;

procedure TFREPFichaAnimal.HabilitarCompDeps(estado: boolean);
begin
      //BBModificarDep.Enabled:= estado;
    if (FPrincipal.Pais = 1) then // Argentina
    begin
          EADEPPesoNacerBrahman.ReadOnly := estado;
          EADEPPesoNacerBrahman.Enabled := not estado;
          EADEPPesoDestBrahman.ReadOnly := estado;
          EADEPPesoDestBrahman.Enabled := not estado;
          EADEPAptitudBrahman.ReadOnly := estado;
          EADEPAptitudBrahman.Enabled := not estado;
          EADEPLecheBrahman.ReadOnly := estado;
          EADEPLecheBrahman.Enabled := not estado;
          EADEPPesoFinalBrahman.ReadOnly := estado;
          EADEPPesoFinalBrahman.Enabled := not estado;
          EADEPCEBrahman.ReadOnly := estado;
          EADEPCEBrahman.Enabled := not estado;

          EAPRECPesoNacerBrahman.ReadOnly := estado;
          EAPRECPesoNacerBrahman.Enabled := not estado;
          EAPRECPesoDestBrahman.ReadOnly := estado;
          EAPRECPesoDestBrahman.Enabled := not estado;
          EAPRECAptitudBrahman.ReadOnly := estado;
          EAPRECAptitudBrahman.Enabled := not estado;
          EAPRECPesoFinalBrahman.ReadOnly := estado;
          EAPRECPesoFinalBrahman.Enabled := not estado;
          EAPRECCEBrahman.ReadOnly := estado;
          EAPRECCEBrahman.Enabled := not estado;


          EADEPLMHereford.ReadOnly := estado;
          EADEPLMHereford.Enabled := not estado;
          EADEPPNHereford.ReadOnly := estado;
          EADEPPNHereford.Enabled := not estado;
          EADEPPDHereford.ReadOnly := estado;
          EADEPPDHereford.Enabled := not estado;
          EADEPLecheHereford.ReadOnly := estado;
          EADEPLecheHereford.Enabled := not estado;
          EADEPPFHereford.ReadOnly := estado;
          EADEPPFHereford.Enabled := not estado;
          EADEPCEHereford.ReadOnly := estado;
          EADEPCEHereford.Enabled := not estado;
          EADEPProgHereford.ReadOnly := estado;
          EADEPProgHereford.Enabled := not estado;
          EADEPGDHereford.ReadOnly := estado;
          EADEPGDHereford.Enabled := not estado;
          EADEPPAHereford.ReadOnly := estado;
          EADEPPAHereford.Enabled := not estado;
          EADEPAOBHereford.ReadOnly := estado;
          EADEPAOBHereford.Enabled := not estado;
          EADEPPNHereford.ReadOnly := estado;
          EADEPPNHereford.Enabled := not estado;

          EAPRECLMHereford.ReadOnly := estado;
          EAPRECLMHereford.Enabled := not estado;
          EAPRECPNHereford.ReadOnly := estado;
          EAPRECPNHereford.Enabled := not estado;
          EAPRECPDHereford.ReadOnly := estado;
          EAPRECPDHereford.Enabled := not estado;
          EAPRECPFHereford.ReadOnly := estado;
          EAPRECPFHereford.Enabled := not estado;
          EAPRECCEHereford.ReadOnly := estado;
          EAPRECCEHereford.Enabled := not estado;
          EAPRECGDHereford.ReadOnly := estado;
          EAPRECGDHereford.Enabled := not estado;
          EAPRECPAHereford.ReadOnly := estado;
          EAPRECPAHereford.Enabled := not estado;
          EAPRECAOBHereford.ReadOnly := estado;
          EAPRECAOBHereford.Enabled := not estado;
          EAPRECPNHereford.ReadOnly := estado;
          EAPRECPNHereford.Enabled := not estado;


          EADEPGest.ReadOnly := estado;
          EADEPGest.Enabled := not estado;
          EADEPGestShorthorn.ReadOnly := estado;
          EADEPGestShorthorn.Enabled := not estado;
          EADEPAptitudBran.ReadOnly := estado;
          EADEPAptitudBran.Enabled := not estado;
          EADEPAptitudBraf.ReadOnly := estado;
          EADEPAptitudBraf.Enabled := not estado;

          EADEPNacer.ReadOnly := estado;
          EADEPNacer.Enabled := not estado;
          EADEPNacerShorthorn.ReadOnly := estado;
          EADEPNacerShorthorn.Enabled := not estado;
          EADEPPesoNacBran.ReadOnly := estado;
          EADEPPesoNacBran.Enabled := not estado;
          EADEPPesoNacBraf.ReadOnly := estado;
          EADEPPesoNacBraf.Enabled := not estado;

          EADEPDest.ReadOnly := estado;
          EADEPDest.Enabled := not estado;
          EADEPDestShorthorn.ReadOnly := estado;
          EADEPDestShorthorn.Enabled := not estado;
          EADEPPesoDestBran.ReadOnly := estado;
          EADEPPesoDestBran.Enabled := not estado;
          EADEPPesoDestBraf.ReadOnly := estado;
          EADEPPesoDestBraf.Enabled := not estado;

          EADEPLeche.ReadOnly := estado;
          EADEPLeche.Enabled := not estado;
          EADEPLecheShorthorn.ReadOnly := estado;
          EADEPLecheShorthorn.Enabled := not estado;
          EADEPLecheBran.ReadOnly := estado;
          EADEPLecheBran.Enabled := not estado;
          EADEPLecheBraf.ReadOnly := estado;
          EADEPLecheBraf.Enabled := not estado;

          EADEPFinal.ReadOnly := estado;
          EADEPFinal.Enabled := not estado;
          EADEPFinalShorthorn.ReadOnly := estado;
          EADEPFinalShorthorn.Enabled := not estado;
          EADEPPesoFinalBran.ReadOnly := estado;
          EADEPPesoFinalBran.Enabled := not estado;
          EADEPPesoFinalBraf.ReadOnly := estado;
          EADEPPesoFinalBraf.Enabled := not estado;

          EADEPCE.ReadOnly := estado;
          EADEPCE.Enabled := not estado;
          EADEPCEShorthorn.ReadOnly := estado;
          EADEPCEShorthorn.Enabled := not estado;
          EADEPCEBran.ReadOnly := estado;
          EADEPCEBran.Enabled := not estado;
          EADEPCEBraf.ReadOnly := estado;
          EADEPCEBraf.Enabled := not estado;

          EADEPAltura.ReadOnly := estado;
          EADEPAltura.Enabled := not estado;
          EADEPAlturaShorthorn.ReadOnly := estado;
          EADEPAlturaShorthorn.Enabled := not estado;

          EADEPEGD.ReadOnly := estado;
          EADEPEGD.Enabled := not estado;
          EADEPEGDShorthorn.ReadOnly := estado;
          EADEPEGDShorthorn.Enabled := not estado;
          EADEPGDBran.ReadOnly := estado;
          EADEPGDBran.Enabled := not estado;

          EADEPEGC.ReadOnly := estado;
          EADEPEGC.Enabled := not estado;
          EADEPEGCShorthorn.ReadOnly := estado;
          EADEPEGCShorthorn.Enabled := not estado;
          EADEPGCBran.ReadOnly := estado;
          EADEPGCBran.Enabled := not estado;

          EADEPAOB.ReadOnly := estado;
          EADEPAOB.Enabled := not estado;
          EADEPAOBShorthorn.ReadOnly := estado;
          EADEPAOBShorthorn.Enabled := not estado;
          EADEPAOBBran.ReadOnly := estado;
          EADEPAOBBran.Enabled := not estado;

          EADEPPorcGI.ReadOnly := estado;
          EADEPPorcGI.Enabled := not estado;
          EADEPPorcGIShorthorn.ReadOnly := estado;
          EADEPPorcGIShorthorn.Enabled := not estado;
          EADEPGIBran.ReadOnly := estado;
          EADEPGIBran.Enabled := not estado;

          EADEPPorcCM.ReadOnly := estado;
          EADEPPorcCM.Enabled := not estado;
          EADEPPorcCMShorthorn.ReadOnly := estado;
          EADEPPorcCMShorthorn.Enabled := not estado;

          EAPrecGest.ReadOnly := estado;
          EAPrecGest.Enabled := not estado;
          EAPRECGestShorthorn.ReadOnly := estado;
          EAPRECGestShorthorn.Enabled := not estado;
          EAPRECAptitudBran.ReadOnly := estado;
          EAPRECAptitudBran.Enabled := not estado;
          EAPRECAptitudBraf.ReadOnly := estado;
          EAPRECAptitudBraf.Enabled := not estado;

          EAPrecNacer.ReadOnly := estado;
          EAPrecNacer.Enabled := not estado;
          EAPRECNacerShorthorn.ReadOnly := estado;
          EAPRECNacerShorthorn.Enabled := not estado;
          EAPRECPesoNacBran.ReadOnly := estado;
          EAPRECPesoNacBran.Enabled := not estado;
          EAPRECPesoNacBraf.ReadOnly := estado;
          EAPRECPesoNacBraf.Enabled := not estado;

          EAPrecDest.ReadOnly := estado;
          EAPrecDest.Enabled := not estado;
          EAPRECDestShorthorn.ReadOnly := estado;
          EAPRECDestShorthorn.Enabled := not estado;
          EAPRECPesoDestBran.ReadOnly := estado;
          EAPRECPesoDestBran.Enabled := not estado;
          EAPRECPesoDestBraf.ReadOnly := estado;
          EAPRECPesoDestBraf.Enabled := not estado;

          EAPrecLeche.ReadOnly := estado;
          EAPrecLeche.Enabled := not estado;
          EAPRECLecheShorthorn.ReadOnly := estado;
          EAPRECLecheShorthorn.Enabled := not estado;

          EAPrecFinal.ReadOnly := estado;
          EAPrecFinal.Enabled := not estado;
          EAPRECFinalShorthorn.ReadOnly := estado;
          EAPRECFinalShorthorn.Enabled := not estado;
          EAPRECPesoFinalBran.ReadOnly := estado;
          EAPRECPesoFinalBran.Enabled := not estado;
          EAPRECPesoFinalBraf.ReadOnly := estado;
          EAPRECPesoFinalBraf.Enabled := not estado;

          EAPrecCE.ReadOnly := estado;
          EAPrecCE.Enabled := not estado;
          EAPRECCEShorthorn.ReadOnly := estado;
          EAPRECCEShorthorn.Enabled := not estado;
          EAPRECCEBran.ReadOnly := estado;
          EAPRECCEBran.Enabled := not estado;
          EAPRECCEBraf.ReadOnly := estado;
          EAPRECCEBraf.Enabled := not estado;

          EAPrecAltura.ReadOnly := estado;
          EAPrecAltura.Enabled := not estado;
          EAPRECAlturaShorthorn.ReadOnly := estado;
          EAPRECAlturaShorthorn.Enabled := not estado;

          EAPrecEGD.ReadOnly := estado;
          EAPrecEGD.Enabled := not estado;
          EAPRECEGDShorthorn.ReadOnly := estado;
          EAPRECEGDShorthorn.Enabled := not estado;
          EAPRECGDBran.ReadOnly := estado;
          EAPRECGDBran.Enabled := not estado;

          EAPrecEGC.ReadOnly := estado;
          EAPrecEGC.Enabled := not estado;
          EAPRECEGCShorthorn.ReadOnly := estado;
          EAPRECEGCShorthorn.Enabled := not estado;
          EAPRECGCBran.ReadOnly := estado;
          EAPRECGCBran.Enabled := not estado;

          EAPrecAOB.ReadOnly := estado;
          EAPrecAOB.Enabled := not estado;
          EAPRECAOBShorthorn.ReadOnly := estado;
          EAPRECAOBShorthorn.Enabled := not estado;
          EAPRECAOBBran.ReadOnly := estado;
          EAPRECAOBBran.Enabled := not estado;

          EAPrecPorcGI.ReadOnly := estado;
          EAPrecPorcGI.Enabled := not estado;
          EAPRECPorcGIShorthorn.ReadOnly := estado;
          EAPRECPorcGIShorthorn.Enabled := not estado;
          EAPRECGIBran.ReadOnly := estado;
          EAPRECGIBran.Enabled := not estado;

          EAPrecPorcCM.ReadOnly := estado;
          EAPrecPorcCM.Enabled := not estado;
          EAPRECPorcCMShorthorn.ReadOnly := estado;
          EAPRECPorcCMShorthorn.Enabled := not estado;

          EACrias.ReadOnly := estado;
          EACrias.Enabled := not estado;
          EACriasBran.ReadOnly := estado;
          EACriasBran.Enabled := not estado;
          EADEPHijasHereford.ReadOnly := estado;
          EADEPHijasHereford.Enabled := not estado;
          EADEPCriasBrahman.ReadOnly := estado;
          EADEPCriasBrahman.Enabled := not estado;
          EACriasBraford.ReadOnly := estado;
          EACriasBraford.Enabled := not estado;
          EADEPCriasShorthorn.ReadOnly := estado;
          EADEPCriasShorthorn.Enabled := not estado;

          EARodeo.ReadOnly := estado;
          EARodeo.Enabled := not estado;
          EARodeoBran.ReadOnly := estado;
          EARodeoBran.Enabled := not estado;
          EARodeoBraford.ReadOnly := estado;
          EARodeoBraford.Enabled := not estado;
          EADEPRodeosHereford.ReadOnly := estado;
          EADEPRodeosHereford.Enabled := not estado;
          EADEPCabaniasBrahman.ReadOnly := estado;
          EADEPCabaniasBrahman.Enabled := not estado;
          EADEPCriasShorthorn.ReadOnly := estado;
          EADEPCriasShorthorn.Enabled := not estado;
          EADEPRodeoShorthorn.ReadOnly := estado;
          EADEPRodeoShorthorn.Enabled := not estado;

          EADEPProgEco.ReadOnly := estado;
          EADEPProgEco.Enabled := not estado;

          if not(estado) then
          begin
              if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then
              begin
                  if not(EACrias.ReadOnly) then
                  begin
                       EACrias.SetFocus;
                       EACrias.SelectAll;
                  end;
              end;

              if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then
              begin
                  if not(EACriasBran.ReadOnly) then
                  begin
                       EACriasBran.SetFocus;
                       EACriasBran.SelectAll;
                  end;
              end;

              if (RazaAnimal = 11) then
              begin
                  if not(EACriasBraford.ReadOnly) then
                  begin
                       EACriasBraford.SetFocus;
                       EACriasBraford.SelectAll;
                  end;
              end;

              if ((RazaAnimal = 4) or (RazaAnimal = 5)) then
              begin
                  if not(EADEPHijasHereford.ReadOnly) then
                  begin
                       EADEPHijasHereford.SetFocus;
                       EADEPHijasHereford.SelectAll;
                  end;
              end;

              if (RazaAnimal = 10) then
              begin
                  if not(EADEPCriasBrahman.ReadOnly) then
                  begin
                       EADEPCriasBrahman.SetFocus;
                       EADEPCriasBrahman.SelectAll;
                  end;
              end;
              if (RazaAnimal = 7) then
              begin
                  if not(EADEPCriasShorthorn.ReadOnly) then
                  begin
                       EADEPCriasShorthorn.SetFocus;
                       EADEPCriasShorthorn.SelectAll;
                  end;
              end;

          end;
         end
       else
        if (FPrincipal.Pais = 2) then // Uruguay
          begin
            EADEPPN.ReadOnly:= estado;
            EADEPPN.Enabled:= not estado;

            EADEPPD.ReadOnly:= estado;
            EADEPPD.Enabled:= not estado;

            EADEPHL.ReadOnly:= estado;
            EADEPHL.Enabled:= not estado;

            EADEPP18.ReadOnly:= estado;
            EADEPP18.Enabled:= not estado;

            EADEPCEUru.ReadOnly:= estado;
            EADEPCEUru.Enabled:= not estado;

            EADEPEGCUru.ReadOnly:= estado;
            EADEPEGCUru.Enabled:= not estado;

            EADEPAOBUru.ReadOnly:= estado;
            EADEPAOBUru.Enabled:= not estado;

            EAPrecPN.ReadOnly:= estado;
            EAPrecPN.Enabled:= not estado;

            EAPrecPD.ReadOnly:= estado;
            EAPrecPD.Enabled:= not estado;

            EAPrecHL.ReadOnly:= estado;
            EAPrecHL.Enabled:= not estado;

            EAPrecP18.ReadOnly:= estado;
            EAPrecP18.Enabled:= not estado;

            EAPrecCEUru.ReadOnly:= estado;
            EAPrecCEUru.Enabled:= not estado;
            
            EAPrecEGCUru.ReadOnly:= estado;
            EAPrecEGCUru.Enabled:= not estado;

            EAPrecAOBUru.ReadOnly:= estado;
            EAPrecAOBUru.Enabled:= not estado;

            EACriador.ReadOnly:= estado;
            EACriador.Enabled:= not estado;

            EACodigoProp.ReadOnly:= estado;
            EACodigoProp.Enabled:= not estado;

            EANhij.ReadOnly:= estado;
            EANhij.Enabled:= not estado;

            EANhijM.ReadOnly:= estado;
            EANhijM.Enabled:= not estado;

            EANhijU.ReadOnly:= estado;
            EANhijU.Enabled:= not estado;
            if (estado) then
            begin
                if not(EACriador.ReadOnly) then
                begin
                  EACriador.SetFocus;
                  EACriador.SelectAll;
                end;
            end;
         end
       else
            begin
              EADEPPN.ReadOnly:= estado;
              EADEPPN.Enabled:= not estado;

              EADEPPD.ReadOnly:= estado;
              EADEPPD.Enabled:= not estado;

              EADEPHL.ReadOnly:= estado;
              EADEPHL.Enabled:= not estado;

              EADEPP18.ReadOnly:= estado;
              EADEPP18.Enabled:= not estado;

              EADEPCEUru.ReadOnly:= estado;
              EADEPCEUru.Enabled:= not estado;

              EADEPEGCUru.ReadOnly:= estado;
              EADEPEGCUru.Enabled:= not estado;

              EADEPAOBUru.ReadOnly:= estado;
              EADEPAOBUru.Enabled:= not estado;

              EAPrecPN.ReadOnly:= estado;
              EAPrecPN.Enabled:= not estado;

              EAPrecPD.ReadOnly:= estado;
              EAPrecPD.Enabled:= not estado;

              EAPrecHL.ReadOnly:= estado;
              EAPrecHL.Enabled:= not estado;

              EAPrecP18.ReadOnly:= estado;
              EAPrecP18.Enabled:= not estado;
              
              EAPrecCEUru.ReadOnly:= estado;
              EAPrecCEUru.Enabled:= not estado;
              
              EAPrecEGCUru.ReadOnly:= estado;
              EAPrecEGCUru.Enabled:= not estado;

              EAPrecAOBUru.ReadOnly:= estado;
              EAPrecAOBUru.Enabled:= not estado;

              EACriador.ReadOnly:= estado;
              EACriador.Enabled:= not estado;

              EACodigoProp.ReadOnly:= estado;
              EACodigoProp.Enabled:= not estado;
              
              EANhij.ReadOnly:= estado;
              EANhij.Enabled:= not estado;

              EANhijM.ReadOnly:= estado;
              EANhijM.Enabled:= not estado;

              EANhijU.ReadOnly:= estado;
              EANhijU.Enabled:= not estado;
              
              if (estado) then
              begin
                  if not(EACriador.ReadOnly) then
                  begin
                    EACriador.SetFocus;
                    EACriador.SelectAll;
                  end;
              end;
           end;
end;

procedure TFREPFichaAnimal.BBModificarDepClick(Sender: TObject);
begin
  inherited;
  HabilitarBotones(true);
  HabilitarCompDeps(false);
end;

procedure TFREPFichaAnimal.AbrirFuentesDEPs;
begin
  IBQDEPsAnimal.Close;
  IBQDEPsAnimal.ParamByName('dep').AsInteger := id_dep;
  IBQDEPsAnimal.Open;
  IBQRazaAnimal.Close;
  IBQRazaAnimal.ParamByName('animal').AsInteger := Id_animal;
  IBQRazaAnimal.Open;
  IBQFuenteDEPs.Close;
  IBQFuenteDEPs.SQL.Clear;
  if IBQRazaAnimal.FieldByName('raza').AsInteger > 0 then
  begin
    IBQFuenteDEPs.Close;
    IBQFuenteDEPs.SQL.Clear;
    IBQFuenteDEPs.SQL.Add('select * from cod_fuentes_deps where raza = :raza');
    IBQFuenteDEPs.ParamByName('raza').AsInteger := IBQRazaAnimal.FieldValues['raza'];
    IBQFuenteDEPs.Open;
    if IBQFuenteDEPs.IsEmpty then
    begin
      IBQFuenteDEPs.Close;
      IBQFuenteDEPs.SQL.Clear;
      IBQFuenteDEPs.SQL.Add('select * from cod_fuentes_deps');
      IBQFuenteDEPs.Open;
    end;
  end
  else
  begin
    IBQFuenteDEPs.Close;
    IBQFuenteDEPs.SQL.Clear;
    IBQFuenteDEPs.SQL.Add('select * from cod_fuentes_deps');
    IBQFuenteDEPs.Open;
  end;

  if IBQDEPsAnimal.IsEmpty then
    DBLCBAFuenteDeps.KeyValue := 0
  else
    DBLCBAFuenteDeps.KeyValue := IBQDEPsAnimal.FieldValues['fuente'];
end;

procedure TFREPFichaAnimal.EANhijKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 6)) and (key <> #8)) then key:=#0;
end;

function TFREPFichaAnimal.PasarDepAFloat(DEP: String): Double;
var auxDep: String;
    i: Integer;
begin
  SetLength(auxDep,Length(DEP));
  auxDep:= '';
  for i:= 1 to Length(DEP) do
    begin
      if (DEP[i]<>'+') then
        auxDep:= auxDep + DEP[i];
    end;
  result:= StrToFloat(auxDep);
end;

function TFREPFichaAnimal.PasarFloatADep(valor: Double): String;
var aux, decimales: String;
    i: Integer;
begin
  aux:= '';
  if (valor >= 0) then
    aux:= '+';

  //if (valor = 0) then
    //result:= ''
   //else
     decimales:= '';
     if (IsInteger(FloatToStr(valor))) then
       decimales:= ',0';
     result:= aux + FloatToStr(valor) + decimales;
end;

procedure TFREPFichaAnimal.AEveActividadExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveActividad.Create(self));
end;

procedure TFREPFichaAnimal.AEveSuplementacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveSuplementacion.Create(self));
end;

procedure TFREPFichaAnimal.HabilitarBotones(valor: boolean);
var ind: Integer;
begin
  {if PasoDeps then
  begin}
    DBLCBAFuenteDeps.Enabled := valor;
   { if IBQFuenteDeps.FieldByName('id_fuente_deps').Value <> null then
      DBLCBAFuenteDeps.KeyValue := IBQFuenteDeps.FieldByName('id_fuente_deps').AsInteger;}

    IGuardar.Visible := valor;
    LGuardar.Visible := valor;

    ICancelDeps.Visible := valor;
    LCancelar.Visible := valor;


    IModificar.Enabled := true;
    LModifValores.Enabled := true;

    IImprimirHistorico.Enabled := true;
    LImprimir.Enabled := true;

    LFuente.Enabled := valor;
 // end;
end;

procedure TFREPFichaAnimal.BBCancelarClick(Sender: TObject);
begin

  CargarDeps();
  HabilitarCompDeps(false);
  HabilitarBotones(false);
end;

procedure TFREPFichaAnimal.BBGuardarClick(Sender: TObject);
begin
  inherited;
     if (DBLCBAFuenteDeps.Text = '') then
     MostrarMensaje(tmInformacion, 'Debe seleccionar una fuente de la Evaluación Genética antes de almacenar los valores de DEPs')
  else
    begin
      InsertarModificarDeps();
      InsertarFuentesDEPs();
      CargarDeps();
      HabilitarCompDeps(true);
      CargarDatosGeneralesDeps();
      PCFichaAnimal.ActivePage := TabSheet2;
      SeleccionDepsImg;
      HabilitarBotones(false);
    end 
end;

procedure TFREPFichaAnimal.InsertarFuentesDEPs;
begin
  IBQDEPS.Close;
  IBQDEPS.ParamByName('anio').AsInteger:= StrToInt(EAAnio.Text);
  IBQDEPS.ParamByName('animal').AsInteger:= id_animal;
  IBQDEPS.Open;
  if not IBQDEPS.IsEmpty then
  begin
    try
      {Esto es solo mientras se pueda agregar una sola fuente al DEP}
      IBQEliminarFuenteDEP.Close;
      IBQEliminarFuenteDEP.ParamByName('dep').AsInteger := IBQDEPS.FieldValues['id_dep'];
      IBQEliminarFuenteDEP.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
      {-------------------------------------------------------------}
      IBQInsertarFuenteDeps.Close;

      IBQInsertarFuenteDeps.ParamByName('fuente').AsInteger := DBLCBAFuenteDeps.KeyValue;
      IBQInsertarFuenteDeps.ParamByName('dep').AsInteger := IBQDEPS.FieldValues['id_dep'];
      IBQInsertarFuenteDeps.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

procedure TFREPFichaAnimal.HabilitarFuentesDEPs;
begin
  AbrirFuentesDEPs;
end;

function TFREPFichaAnimal.CheckFormatoPrec(var Valor: String): Boolean;
var auxvalor: double;
    i: Integer;
begin
  result:= false;

  if (Valor <> '') then
    begin
      if (TryStrToFloat(Valor,auxvalor)) then
        begin
          result:= true;
          Valor:= FloatToStr(auxvalor);
        end;
    end
   else
     result:= true;
end;

procedure TFREPFichaAnimal.InsertarModificarDeps;
begin
     try
      if (FPrincipal.Pais = 1) then // Argentina
      begin
        IBQSPImportarDeps.ParamByName('ANIO').AsInteger:= StrToInt(EAAnio.Text);
        IBQSPImportarDeps.ParamByName('ANIMAL').AsInteger:= id_animal;
        IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstablecimientoActual;

          if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then   //Para Angus
          begin
              if (Trim(EACrias.Text) <> '') then
                IBQSPImportarDeps.ParamByName('CRIAS').AsInteger := EACrias.GetDato
              else
                 IBQSPImportarDeps.ParamByName('CRIAS').Value := null;

              if (Trim(EARodeo.Text) <> '') then
                IBQSPImportarDeps.ParamByName('RODEO').AsInteger:= EARodeo.GetDato
              else
                 IBQSPImportarDeps.ParamByName('RODEO').Value:= null;

              if (Trim(EADEPGest.Text) <> '') then
                IBQSPImportarDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPGest.Text)
              else
                 IBQSPImportarDeps.ParamByName('GESTDEP').Value:= null;

              if (Trim(EAPrecGest.Text) <> '') then
                IBQSPImportarDeps.ParamByName('GESTPREC').AsFloat:= EAPrecGest.GetDato
              else
                 IBQSPImportarDeps.ParamByName('GESTPREC').Value:= null;

              if (Trim(EADEPNacer.Text) <> '') then
                IBQSPImportarDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPNacer.Text)
               else
                  IBQSPImportarDeps.ParamByName('NACERDEP').Value:= null;

              if (Trim(EAPrecNacer.Text) <> '') then
                IBQSPImportarDeps.ParamByName('NACERPREC').AsFloat:= EAPrecNacer.GetDato
               else
                 IBQSPImportarDeps.ParamByName('NACERPREC').Value:= null;

              if (Trim(EADEPDest.Text) <> '') then
                IBQSPImportarDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPDest.GetDato)
               else
                 IBQSPImportarDeps.ParamByName('DESTDEP').Value:= null;

              if (Trim(EAPrecDest.Text) <> '') then
                IBQSPImportarDeps.ParamByName('DESTPREC').AsFloat:= EAPrecDest.GetDato
               else
                 IBQSPImportarDeps.ParamByName('DESTPREC').Value:= null;

              if (Trim(EADEPLeche.Text) <> '') then
                IBQSPImportarDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLeche.GetDato)
               else
                 IBQSPImportarDeps.ParamByName('LECHEDEP').Value:= null;

              if (Trim(EAPrecLeche.Text) <> '') then
                IBQSPImportarDeps.ParamByName('LECHEPREC').AsFloat:= EAPrecLeche.GetDato
               else
                 IBQSPImportarDeps.ParamByName('LECHEPREC').Value:= null;

              if (Trim(EADEPFinal.Text) <> '') then
                IBQSPImportarDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPFinal.GetDato)
               else
                 IBQSPImportarDeps.ParamByName('FINALDEP').Value:= null;

              if (Trim(EAPrecFinal.Text) <> '') then
                IBQSPImportarDeps.ParamByName('FINALPREC').AsFloat:= EAPrecFinal.GetDato
               else
                 IBQSPImportarDeps.ParamByName('FINALPREC').Value:= null;

              if (Trim(EADEPCE.Text) <> '') then
                IBQSPImportarDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCE.GetDato)
               else
                 IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

              if (Trim(EAPrecCE.Text) <> '') then
                IBQSPImportarDeps.ParamByName('CEPREC').AsFloat:= EAPrecCE.GetDato
               else
                 IBQSPImportarDeps.ParamByName('CEPREC').Value:= null;

              if (Trim(EADEPAltura.Text) <> '') then
                IBQSPImportarDeps.ParamByName('ALTURADEP').AsFloat:= PasarDepAFloat(EADEPAltura.GetDato)
               else
                 IBQSPImportarDeps.ParamByName('ALTURADEP').Value:= null;

              if (Trim(EAPrecAltura.Text) <> '') then
                IBQSPImportarDeps.ParamByName('ALTURAPREC').AsFloat:= EAPrecAltura.GetDato
               else
                 IBQSPImportarDeps.ParamByName('ALTURAPREC').Value:= null;

              if (Trim(EADEPEGD.Text) <> '') then
                IBQSPImportarDeps.ParamByName('EGDDEP').AsFloat:= PasarDepAFloat(EADEPEGD.GetDato)
               else
                 IBQSPImportarDeps.ParamByName('EGDDEP').Value:= null;

              if (Trim(EAPrecEGD.Text) <> '') then
                IBQSPImportarDeps.ParamByName('EGDPREC').AsFloat:= EAPrecEGD.GetDato
               else
                 IBQSPImportarDeps.ParamByName('EGDPREC').Value:= null;

              if (Trim(EADEPEGC.Text) <> '') then
                IBQSPImportarDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPEGC.GetDato)
               else
                 IBQSPImportarDeps.ParamByName('EGCDEP').Value:= null;

              if (Trim(EAPrecEGC.Text) <> '') then
                IBQSPImportarDeps.ParamByName('EGCPREC').AsFloat:= EAPrecEGC.GetDato
               else
                 IBQSPImportarDeps.ParamByName('EGCPREC').Value:= null;

              if (Trim(EADEPAOB.Text) <> '') then
                IBQSPImportarDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOB.GetDato)
               else
                 IBQSPImportarDeps.ParamByName('AOBDEP').Value:= null;

              if (Trim(EAPrecAOB.Text) <> '') then
                IBQSPImportarDeps.ParamByName('AOBPREC').AsFloat:= EAPrecAOB.GetDato
               else
                 IBQSPImportarDeps.ParamByName('AOBPREC').Value:= null;

              if (Trim(EADEPPorcGI.Text) <> '') then
                IBQSPImportarDeps.ParamByName('PORGIDEP').AsFloat:= PasarDepAFloat(EADEPPorcGI.GetDato)
               else
                 IBQSPImportarDeps.ParamByName('PORGIDEP').Value:= null;

              if (Trim(EAPrecPorcGI.Text) <> '') then
                IBQSPImportarDeps.ParamByName('PORGIPREC').AsFloat:= EAPrecPorcGI.GetDato
               else
                 IBQSPImportarDeps.ParamByName('PORGIPREC').Value:= null;

              if (Trim(EADEPPorcCM.Text) <> '') then
                IBQSPImportarDeps.ParamByName('PORCMDEP').AsFloat:= PasarDepAFloat(EADEPPorcCM.GetDato)
               else
                 IBQSPImportarDeps.ParamByName('PORCMDEP').Value:= null;

              if (Trim(EAPrecPorcCM.Text) <> '') then
                IBQSPImportarDeps.ParamByName('PORCMPREC').AsFloat:= EAPrecPorcCM.GetDato
               else
                 IBQSPImportarDeps.ParamByName('PORCMPREC').Value:= null;
          end
          else
            if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then //Para Brangus
            begin
                if (Trim(EACriasBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('CRIAS').AsInteger := EACriasBran.GetDato
                else
                  IBQSPImportarDeps.ParamByName('CRIAS').Value := null;

                if (Trim(EARodeoBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('RODEO').AsInteger:= EARodeoBran.GetDato
                else
                   IBQSPImportarDeps.ParamByName('RODEO').Value:= null;

                if (Trim(EADEPAptitudBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPAptitudBran.Text)
                else
                   IBQSPImportarDeps.ParamByName('GESTDEP').Value:= null;

                if (Trim(EAPRECAptitudBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('GESTPREC').AsFloat:= EAPRECAptitudBran.GetDato
                else
                   IBQSPImportarDeps.ParamByName('GESTPREC').Value:= null;

                if (Trim(EADEPPesoNacBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPesoNacBran.Text)
                 else
                    IBQSPImportarDeps.ParamByName('NACERDEP').Value:= null;

                if (Trim(EAPRECPesoNacBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('NACERPREC').AsFloat:= EAPRECPesoNacBran.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('NACERPREC').Value:= null;

                if (Trim(EADEPPesoDestBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPesoDestBran.GetDato)
                 else
                   IBQSPImportarDeps.ParamByName('DESTDEP').Value:= null;

                if (Trim(EAPRECPesoDestBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('DESTPREC').AsFloat:= EAPRECPesoDestBran.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('DESTPREC').Value:= null;

                if (Trim(EADEPLecheBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLecheBran.GetDato)
                 else
                   IBQSPImportarDeps.ParamByName('LECHEDEP').Value:= null;

                IBQSPImportarDeps.ParamByName('LECHEPREC').Value:= null;

                if (Trim(EADEPPesoFinalBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPPesoFinalBran.GetDato)
                 else
                   IBQSPImportarDeps.ParamByName('FINALDEP').Value:= null;

                if (Trim(EAPRECPesoFinalBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('FINALPREC').AsFloat:= EAPRECPesoFinalBran.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('FINALPREC').Value:= null;

                if (Trim(EADEPCEBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEBran.GetDato)
                 else
                   IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

                if (Trim(EAPRECCEBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('CEPREC').AsFloat:= EAPRECCEBran.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('CEPREC').Value:= null;

                IBQSPImportarDeps.ParamByName('ALTURADEP').Value:= null;

                IBQSPImportarDeps.ParamByName('ALTURAPREC').Value:= null;

                if (Trim(EADEPGDBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('EGDDEP').AsFloat:= PasarDepAFloat(EADEPGDBran.GetDato)
                 else
                   IBQSPImportarDeps.ParamByName('EGDDEP').Value:= null;

                if (Trim(EAPRECGDBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('EGDPREC').AsFloat:= EAPRECGDBran.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('EGDPREC').Value:= null;

                if (Trim(EADEPGCBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPGCBran.GetDato)
                 else
                   IBQSPImportarDeps.ParamByName('EGCDEP').Value:= null;

                if (Trim(EAPRECGCBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('EGCPREC').AsFloat:= EAPRECGCBran.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('EGCPREC').Value:= null;

                if (Trim(EADEPAOBBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOBBran.GetDato)
                 else
                   IBQSPImportarDeps.ParamByName('AOBDEP').Value:= null;

                if (Trim(EAPRECAOBBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('AOBPREC').AsFloat:= EAPRECAOBBran.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('AOBPREC').Value:= null;

                if (Trim(EADEPGIBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('PORGIDEP').AsFloat:= PasarDepAFloat(EADEPGIBran.GetDato)
                 else
                   IBQSPImportarDeps.ParamByName('PORGIDEP').Value:= null;

                if (Trim(EAPRECGIBran.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('PORGIPREC').AsFloat:= EAPRECGIBran.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('PORGIPREC').Value:= null;


                IBQSPImportarDeps.ParamByName('PORCMDEP').Value:= null;

                IBQSPImportarDeps.ParamByName('PORCMPREC').Value:= null;
            end
            else
                if ((RazaAnimal = 11)) then //Para Braford
                begin

                    if (Trim(EACriasBraford.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('CRIAS').AsInteger := EACriasBraford.GetDato
                    else
                       IBQSPImportarDeps.ParamByName('CRIAS').Value := null;

                    if (Trim(EARodeoBraford.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('RODEO').AsInteger:= EARodeoBraford.GetDato
                    else
                       IBQSPImportarDeps.ParamByName('RODEO').Value:= null;

                    if (Trim(EADEPAptitudBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPAptitudBraf.Text)
                    else
                       IBQSPImportarDeps.ParamByName('GESTDEP').Value:= null;

                    if (Trim(EAPRECAptitudBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('GESTPREC').AsFloat:= EAPRECAptitudBraf.GetDato
                    else
                       IBQSPImportarDeps.ParamByName('GESTPREC').Value:= null;

                    if (Trim(EADEPPesoNacBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPesoNacBraf.Text)
                     else
                        IBQSPImportarDeps.ParamByName('NACERDEP').Value:= null;

                    if (Trim(EAPRECPesoNacBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('NACERPREC').AsFloat:= EAPRECPesoNacBraf.GetDato
                     else
                       IBQSPImportarDeps.ParamByName('NACERPREC').Value:= null;

                    if (Trim(EADEPPesoDestBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPesoDestBraf.GetDato)
                     else
                       IBQSPImportarDeps.ParamByName('DESTDEP').Value:= null;

                    if (Trim(EAPRECPesoDestBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('DESTPREC').AsFloat:= EAPRECPesoDestBraf.GetDato
                     else
                       IBQSPImportarDeps.ParamByName('DESTPREC').Value:= null;

                    if (Trim(EADEPLecheBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLecheBraf.GetDato)
                     else
                       IBQSPImportarDeps.ParamByName('LECHEDEP').Value:= null;

                    IBQSPImportarDeps.ParamByName('LECHEPREC').Value:= null;

                    if (Trim(EADEPPesoFinalBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPPesoFinalBraf.GetDato)
                     else
                       IBQSPImportarDeps.ParamByName('FINALDEP').Value:= null;

                    if (Trim(EAPRECPesoFinalBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('FINALPREC').AsFloat:= EAPRECPesoFinalBraf.GetDato
                     else
                       IBQSPImportarDeps.ParamByName('FINALPREC').Value:= null;

                    if (Trim(EADEPCEBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEBraf.GetDato)
                     else
                       IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

                    if (Trim(EAPRECCEBraf.Text) <> '') then
                      IBQSPImportarDeps.ParamByName('CEPREC').AsFloat:= EAPRECCEBraf.GetDato
                     else
                       IBQSPImportarDeps.ParamByName('CEPREC').Value:= null;

                    IBQSPImportarDeps.ParamByName('ALTURADEP').Value:= null;
                    IBQSPImportarDeps.ParamByName('ALTURAPREC').Value:= null;
                    IBQSPImportarDeps.ParamByName('EGDDEP').Value:= null;
                    IBQSPImportarDeps.ParamByName('EGDPREC').Value:= null;
                    IBQSPImportarDeps.ParamByName('EGCDEP').Value:= null;
                    IBQSPImportarDeps.ParamByName('EGCPREC').Value:= null;
                    IBQSPImportarDeps.ParamByName('AOBDEP').Value:= null;
                    IBQSPImportarDeps.ParamByName('AOBPREC').Value:= null;
                    IBQSPImportarDeps.ParamByName('PORGIDEP').Value:= null;
                    IBQSPImportarDeps.ParamByName('PORGIPREC').Value:= null;
                    IBQSPImportarDeps.ParamByName('PORCMDEP').Value:= null;
                    IBQSPImportarDeps.ParamByName('PORCMPREC').Value:= null;
                end
                else
                    if ((RazaAnimal = 4) or (RazaAnimal = 5)) then  //Para Hereford
                    begin
                        if (Trim(EADEPHijasHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('CRIAS').AsInteger := EADEPHijasHereford.GetDato
                        else
                           IBQSPImportarDeps.ParamByName('CRIAS').Value := null;

                        if (Trim(EADEPRodeosHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('RODEO').AsInteger:= EADEPRodeosHereford.GetDato
                        else
                           IBQSPImportarDeps.ParamByName('RODEO').Value:= null;

                        if (Trim(EADEPLMHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPLMHereford.Text)
                        else
                           IBQSPImportarDeps.ParamByName('GESTDEP').Value:= null;

                        if (Trim(EAPRECLMHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('GESTPREC').AsFloat:= EAPRECLMHereford.GetDato
                        else
                           IBQSPImportarDeps.ParamByName('GESTPREC').Value:= null;

                        if (Trim(EADEPPNHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPNHereford.Text)
                         else
                            IBQSPImportarDeps.ParamByName('NACERDEP').Value:= null;

                        if (Trim(EAPRECPNHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('NACERPREC').AsFloat:= EAPRECPNHereford.GetDato
                         else
                           IBQSPImportarDeps.ParamByName('NACERPREC').Value:= null;

                        if (Trim(EADEPPDHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPDHereford.GetDato)
                         else
                           IBQSPImportarDeps.ParamByName('DESTDEP').Value:= null;

                        if (Trim(EAPRECPDHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('DESTPREC').AsFloat:= EAPRECPDHereford.GetDato
                         else
                           IBQSPImportarDeps.ParamByName('DESTPREC').Value:= null;

                        if (Trim(EADEPLecheHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLecheHereford.GetDato)
                         else
                           IBQSPImportarDeps.ParamByName('LECHEDEP').Value:= null;

                        IBQSPImportarDeps.ParamByName('LECHEPREC').Value:= null;

                        if (Trim(EADEPPFHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPPFHereford.GetDato)
                         else
                           IBQSPImportarDeps.ParamByName('FINALDEP').Value:= null;

                        if (Trim(EAPRECPFHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('FINALPREC').AsFloat:= EAPRECPFHereford.GetDato
                         else
                           IBQSPImportarDeps.ParamByName('FINALPREC').Value:= null;

                        if (Trim(EADEPCEHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEHereford.GetDato)
                         else
                           IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

                        if (Trim(EAPRECCEHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('CEPREC').AsFloat:= EAPRECCEHereford.GetDato
                         else
                           IBQSPImportarDeps.ParamByName('CEPREC').Value:= null;

                        if (Trim(EADEPProgEco.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('ALTURADEP').Value:= PasarDepAFloat(EADEPProgEco.GetDato)
                        else
                          IBQSPImportarDeps.ParamByName('ALTURADEP').Value:= null;

                        IBQSPImportarDeps.ParamByName('ALTURAPREC').Value:= null;

                        if (Trim(EADEPGDHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('EGDDEP').AsFloat:= PasarDepAFloat(EADEPGDHereford.GetDato)
                         else
                           IBQSPImportarDeps.ParamByName('EGDDEP').Value:= null;

                        if (Trim(EAPRECGDHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('EGDPREC').AsFloat:= EAPRECGDHereford.GetDato
                         else
                           IBQSPImportarDeps.ParamByName('EGDPREC').Value:= null;

                        if (Trim(EADEPPAHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPPAHereford.GetDato)
                         else
                           IBQSPImportarDeps.ParamByName('EGCDEP').Value:= null;

                        if (Trim(EAPRECPAHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('EGCPREC').AsFloat:= EAPRECPAHereford.GetDato
                         else
                           IBQSPImportarDeps.ParamByName('EGCPREC').Value:= null;

                        if (Trim(EADEPAOBHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOBHereford.GetDato)
                         else
                           IBQSPImportarDeps.ParamByName('AOBDEP').Value:= null;

                        if (Trim(EAPRECAOBHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('AOBPREC').AsFloat:= EAPRECAOBHereford.GetDato
                         else
                           IBQSPImportarDeps.ParamByName('AOBPREC').Value:= null;

                        if (Trim(EADEPProgHereford.Text) <> '') then
                          IBQSPImportarDeps.ParamByName('PORGIDEP').AsFloat:= PasarDepAFloat(EADEPProgHereford.GetDato)
                         else
                           IBQSPImportarDeps.ParamByName('PORGIDEP').Value:= null;

                        IBQSPImportarDeps.ParamByName('PORGIPREC').Value:= null;
                        IBQSPImportarDeps.ParamByName('PORCMDEP').Value:= null;
                        IBQSPImportarDeps.ParamByName('PORCMPREC').Value:= null;
                    end
                    else
                        if ((RazaAnimal = 10)) then //Para Brahman
                        begin
                            if (Trim(EADEPCriasBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('CRIAS').AsInteger := EADEPCriasBrahman.GetDato
                            else
                               IBQSPImportarDeps.ParamByName('CRIAS').Value := null;

                            if (Trim(EADEPCabaniasBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('RODEO').AsInteger:= EADEPCabaniasBrahman.GetDato
                            else
                               IBQSPImportarDeps.ParamByName('RODEO').Value:= null;

                            if (Trim(EADEPAptitudBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPAptitudBrahman.Text)
                            else
                               IBQSPImportarDeps.ParamByName('GESTDEP').Value:= null;

                            if (Trim(EAPRECAptitudBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('GESTPREC').AsFloat:= EAPRECAptitudBrahman.GetDato
                            else
                               IBQSPImportarDeps.ParamByName('GESTPREC').Value:= null;

                            if (Trim(EADEPPesoNacerBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPesoNacerBrahman.Text)
                             else
                                IBQSPImportarDeps.ParamByName('NACERDEP').Value:= null;

                            if (Trim(EAPRECPesoNacerBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('NACERPREC').AsFloat:= EAPRECPesoNacerBrahman.GetDato
                             else
                               IBQSPImportarDeps.ParamByName('NACERPREC').Value:= null;

                            if (Trim(EADEPPesoDestBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPesoDestBrahman.GetDato)
                             else
                               IBQSPImportarDeps.ParamByName('DESTDEP').Value:= null;

                            if (Trim(EAPRECPesoDestBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('DESTPREC').AsFloat:= EAPRECPesoDestBrahman.GetDato
                             else
                               IBQSPImportarDeps.ParamByName('DESTPREC').Value:= null;

                            if (Trim(EADEPLecheBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLecheBrahman.GetDato)
                             else
                               IBQSPImportarDeps.ParamByName('LECHEDEP').Value:= null;

                            IBQSPImportarDeps.ParamByName('LECHEPREC').Value:= null;

                            if (Trim(EADEPPesoFinalBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPPesoFinalBrahman.GetDato)
                             else
                               IBQSPImportarDeps.ParamByName('FINALDEP').Value:= null;

                            if (Trim(EAPRECPesoFinalBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('FINALPREC').AsFloat:= EAPRECPesoFinalBrahman.GetDato
                             else
                               IBQSPImportarDeps.ParamByName('FINALPREC').Value:= null;

                            if (Trim(EADEPCEBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEBrahman.GetDato)
                             else
                               IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

                            if (Trim(EAPRECCEBrahman.Text) <> '') then
                              IBQSPImportarDeps.ParamByName('CEPREC').AsFloat:= EAPRECCEBrahman.GetDato
                             else
                               IBQSPImportarDeps.ParamByName('CEPREC').Value:= null;

                            IBQSPImportarDeps.ParamByName('ALTURADEP').Value:= null;
                            IBQSPImportarDeps.ParamByName('ALTURAPREC').Value:= null;
                            IBQSPImportarDeps.ParamByName('EGDDEP').Value:= null;
                            IBQSPImportarDeps.ParamByName('EGDPREC').Value:= null;
                            IBQSPImportarDeps.ParamByName('EGCDEP').Value:= null;
                            IBQSPImportarDeps.ParamByName('EGCPREC').Value:= null;
                            IBQSPImportarDeps.ParamByName('AOBDEP').Value:= null;
                            IBQSPImportarDeps.ParamByName('AOBPREC').Value:= null;
                            IBQSPImportarDeps.ParamByName('PORGIDEP').Value:= null;
                            IBQSPImportarDeps.ParamByName('PORGIPREC').Value:= null;
                            IBQSPImportarDeps.ParamByName('PORCMDEP').Value:= null;
                            IBQSPImportarDeps.ParamByName('PORCMPREC').Value:= null;
                        end
                        else
                            if (RazaAnimal = 7) then //Para Shorthorn
                            begin
                                if (Trim(EADEPCriasShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('CRIAS').AsInteger := EADEPCriasShorthorn.GetDato
                                else
                                   IBQSPImportarDeps.ParamByName('CRIAS').Value := null;

                                if (Trim(EADEPRodeoShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('RODEO').AsInteger:= EADEPRodeoShorthorn.GetDato
                                else
                                   IBQSPImportarDeps.ParamByName('RODEO').Value:= null;

                                if (Trim(EADEPGestShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPGestShorthorn.Text)
                                else
                                   IBQSPImportarDeps.ParamByName('GESTDEP').Value:= null;

                                if (Trim(EAPRECGestShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('GESTPREC').AsFloat:= EAPRECGestShorthorn.GetDato
                                else
                                   IBQSPImportarDeps.ParamByName('GESTPREC').Value:= null;

                                if (Trim(EADEPNacerShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPNacerShorthorn.Text)
                                 else
                                    IBQSPImportarDeps.ParamByName('NACERDEP').Value:= null;

                                if (Trim(EAPRECNacerShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('NACERPREC').AsFloat:= EAPRECNacerShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('NACERPREC').Value:= null;

                                if (Trim(EADEPDestShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPDestShorthorn.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('DESTDEP').Value:= null;

                                if (Trim(EAPRECDestShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('DESTPREC').AsFloat:= EAPRECDestShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('DESTPREC').Value:= null;

                                if (Trim(EADEPLecheShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLecheShorthorn.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('LECHEDEP').Value:= null;

                                if (Trim(EAPRECLecheShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('LECHEPREC').AsFloat:= EAPRECLecheShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('LECHEPREC').Value:= null;

                                if (Trim(EADEPFinalShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPFinalShorthorn.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('FINALDEP').Value:= null;

                                if (Trim(EAPRECFinalShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('FINALPREC').AsFloat:= EAPRECFinalShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('FINALPREC').Value:= null;

                                if (Trim(EADEPCEShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEShorthorn.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

                                if (Trim(EAPRECCEShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('CEPREC').AsFloat:= EAPRECCEShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('CEPREC').Value:= null;

                                if (Trim(EADEPAlturaShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('ALTURADEP').AsFloat:= PasarDepAFloat(EADEPAlturaShorthorn.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('ALTURADEP').Value:= null;

                                if (Trim(EAPRECAlturaShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('ALTURAPREC').AsFloat:= EAPRECAlturaShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('ALTURAPREC').Value:= null;

                                if (Trim(EADEPEGDShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('EGDDEP').AsFloat:= PasarDepAFloat(EADEPEGDShorthorn.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('EGDDEP').Value:= null;

                                if (Trim(EAPRECEGDShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('EGDPREC').AsFloat:= EAPRECEGDShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('EGDPREC').Value:= null;

                                if (Trim(EADEPEGDShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPEGDShorthorn.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('EGCDEP').Value:= null;

                                if (Trim(EAPRECEGCShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('EGCPREC').AsFloat:= EAPRECEGCShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('EGCPREC').Value:= null;

                                if (Trim(EADEPAOBShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOBShorthorn.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('AOBDEP').Value:= null;

                                if (Trim(EAPRECAOBShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('AOBPREC').AsFloat:= EAPRECAOBShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('AOBPREC').Value:= null;

                                if (Trim(EADEPPorcGIShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('PORGIDEP').AsFloat:= PasarDepAFloat(EADEPPorcGIShorthorn.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('PORGIDEP').Value:= null;

                                if (Trim(EAPRECPorcGIShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('PORGIPREC').AsFloat:= EAPRECPorcGIShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('PORGIPREC').Value:= null;

                                if (Trim(EADEPPorcCMShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('PORCMDEP').AsFloat:= PasarDepAFloat(EADEPPorcCMShorthorn.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('PORCMDEP').Value:= null;

                                if (Trim(EAPRECPorcCMShorthorn.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('PORCMPREC').AsFloat:= EAPRECPorcCMShorthorn.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('PORCMPREC').Value:= null;
                            end
                            else
                            begin
                                if (Trim(EACrias.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('CRIAS').AsInteger := EACrias.GetDato
                                else
                                   IBQSPImportarDeps.ParamByName('CRIAS').Value := null;

                                if (Trim(EARodeo.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('RODEO').AsInteger:= EARodeo.GetDato
                                else
                                   IBQSPImportarDeps.ParamByName('RODEO').Value:= null;

                                if (Trim(EADEPGest.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPGest.Text)
                                else
                                   IBQSPImportarDeps.ParamByName('GESTDEP').Value:= null;

                                if (Trim(EAPrecGest.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('GESTPREC').AsFloat:= EAPrecGest.GetDato
                                else
                                   IBQSPImportarDeps.ParamByName('GESTPREC').Value:= null;

                                if (Trim(EADEPNacer.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPNacer.Text)
                                 else
                                    IBQSPImportarDeps.ParamByName('NACERDEP').Value:= null;

                                if (Trim(EAPrecNacer.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('NACERPREC').AsFloat:= EAPrecNacer.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('NACERPREC').Value:= null;

                                if (Trim(EADEPDest.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPDest.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('DESTDEP').Value:= null;

                                if (Trim(EAPrecDest.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('DESTPREC').AsFloat:= EAPrecDest.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('DESTPREC').Value:= null;

                                if (Trim(EADEPLeche.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLeche.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('LECHEDEP').Value:= null;

                                if (Trim(EAPrecLeche.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('LECHEPREC').AsFloat:= EAPrecLeche.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('LECHEPREC').Value:= null;

                                if (Trim(EADEPFinal.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPFinal.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('FINALDEP').Value:= null;

                                if (Trim(EAPrecFinal.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('FINALPREC').AsFloat:= EAPrecFinal.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('FINALPREC').Value:= null;

                                if (Trim(EADEPCE.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCE.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

                                if (Trim(EAPrecCE.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('CEPREC').AsFloat:= EAPrecCE.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('CEPREC').Value:= null;

                                if (Trim(EADEPAltura.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('ALTURADEP').AsFloat:= PasarDepAFloat(EADEPAltura.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('ALTURADEP').Value:= null;

                                if (Trim(EAPrecAltura.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('ALTURAPREC').AsFloat:= EAPrecAltura.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('ALTURAPREC').Value:= null;

                                if (Trim(EADEPEGD.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('EGDDEP').AsFloat:= PasarDepAFloat(EADEPEGD.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('EGDDEP').Value:= null;

                                if (Trim(EAPrecEGD.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('EGDPREC').AsFloat:= EAPrecEGD.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('EGDPREC').Value:= null;

                                if (Trim(EADEPEGC.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPEGC.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('EGCDEP').Value:= null;

                                if (Trim(EAPrecEGC.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('EGCPREC').AsFloat:= EAPrecEGC.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('EGCPREC').Value:= null;

                                if (Trim(EADEPAOB.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOB.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('AOBDEP').Value:= null;

                                if (Trim(EAPrecAOB.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('AOBPREC').AsFloat:= EAPrecAOB.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('AOBPREC').Value:= null;

                                if (Trim(EADEPPorcGI.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('PORGIDEP').AsFloat:= PasarDepAFloat(EADEPPorcGI.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('PORGIDEP').Value:= null;

                                if (Trim(EAPrecPorcGI.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('PORGIPREC').AsFloat:= EAPrecPorcGI.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('PORGIPREC').Value:= null;

                                if (Trim(EADEPPorcCM.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('PORCMDEP').AsFloat:= PasarDepAFloat(EADEPPorcCM.GetDato)
                                 else
                                   IBQSPImportarDeps.ParamByName('PORCMDEP').Value:= null;

                                if (Trim(EAPrecPorcCM.Text) <> '') then
                                  IBQSPImportarDeps.ParamByName('PORCMPREC').AsFloat:= EAPrecPorcCM.GetDato
                                 else
                                   IBQSPImportarDeps.ParamByName('PORCMPREC').Value:= null;
                            end;
       end
       else
         if (FPrincipal.Pais = 2) then // Uruguay
         begin
              IBQSPImportarDeps.ParamByName('ANIO').AsInteger:= StrToInt(EAAnio.Text);
              IBQSPImportarDeps.ParamByName('ANIMAL').AsInteger:= id_animal;
              IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstablecimientoActual;

              if (Trim(EADEPPN.Text) <> '') then
                IBQSPImportarDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPN.Text)
               else
                 IBQSPImportarDeps.ParamByName('NACERDEP').Value:= null;


              if (Trim(EAPrecPN.Text) <> '') then
                IBQSPImportarDeps.ParamByName('NACERPREC').AsFloat:= EAPrecPN.GetDato
               else
                 IBQSPImportarDeps.ParamByName('NACERPREC').Value:= null;

              if (Trim(EADEPPD.Text) <> '') then
                IBQSPImportarDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPD.Text)
               else
                 IBQSPImportarDeps.ParamByName('DESTDEP').Value:= null;

              if (Trim(EAPrecPD.Text) <> '') then
                IBQSPImportarDeps.ParamByName('DESTPREC').AsFloat:= EAPrecPD.GetDato
               else
                 IBQSPImportarDeps.ParamByName('DESTPREC').Value:= null;

              if (Trim(EADEPHL.Text) <> '') then
                IBQSPImportarDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPHL.Text)
               else
                 IBQSPImportarDeps.ParamByName('LECHEDEP').Value:= null;

              if (Trim(EAPrecHL.Text) <> '') then
                IBQSPImportarDeps.ParamByName('LECHEPREC').AsFloat:= EAPrecHL.GetDato
               else
                 IBQSPImportarDeps.ParamByName('LECHEPREC').Value:= null;

              if (Trim(EADEPCEUru.Text) <> '') then
                IBQSPImportarDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEUru.Text)
               else
                 IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

              if (Trim(EAPrecCEUru.Text) <> '') then
                IBQSPImportarDeps.ParamByName('CEPREC').AsFloat:= EAPrecCEUru.GetDato
               else
                 IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

              if (Trim(EADEPEGCUru.Text) <> '') then
                IBQSPImportarDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPEGCUru.Text)
               else
                 IBQSPImportarDeps.ParamByName('EGCDEP').Value:= null;

              if (Trim(EAPrecEGCUru.Text) <> '') then
                IBQSPImportarDeps.ParamByName('EGCPREC').AsFloat:= EAPrecEGCUru.GetDato
               else
                 IBQSPImportarDeps.ParamByName('EGCPREC').Value:= null;

              if (Trim(EADEPAOBUru.Text) <> '') then
                IBQSPImportarDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOBUru.Text)
               else
                 IBQSPImportarDeps.ParamByName('AOBDEP').Value:= null;

              if (Trim(EAPrecAOBUru.Text) <> '') then
                IBQSPImportarDeps.ParamByName('AOBPREC').AsFloat:= EAPrecAOBUru.GetDato
               else
                 IBQSPImportarDeps.ParamByName('AOBPREC').Value:= null;

              if (Trim(EACriador.Text) <> '') then
                IBQSPImportarDeps.ParamByName('CRIADOR').AsString:= EACriador.GetDato
               else
                 IBQSPImportarDeps.ParamByName('CRIADOR').Value:= null;

              if (Trim(EACodigoProp.Text) <> '') then
                IBQSPImportarDeps.ParamByName('CODIGO_PROPIETARIO').AsString:= EACodigoProp.GetDato
               else
                 IBQSPImportarDeps.ParamByName('CODIGO_PROPIETARIO').Value:= null;

              if (Trim(EANhij.Text) <> '') then
                IBQSPImportarDeps.ParamByName('NHIJ').AsInteger:= EANhij.GetDato
               else
                 IBQSPImportarDeps.ParamByName('NHIJ').Value:= null;

              if (Trim(EANhijM.Text) <> '') then
                IBQSPImportarDeps.ParamByName('NHIJM').AsInteger:= EANhijM.GetDato
               else
                 IBQSPImportarDeps.ParamByName('NHIJ').Value:= null;

              if (Trim(EANhijU.Text) <> '') then
                IBQSPImportarDeps.ParamByName('NHIJU').AsInteger:= EANhijU.GetDato
               else
                 IBQSPImportarDeps.ParamByName('NHIJU').Value:= null;

              IBQSPImportarDeps.ParamByName('DATO_PD').AsString:= '*';

              if (Trim(EADEPP18.Text) <> '') then
                IBQSPImportarDeps.ParamByName('P18DEP').AsFloat:= PasarDepAFloat(EADEPP18.Text)
               else
                 IBQSPImportarDeps.ParamByName('P18DEP').Value:= null;

              if (Trim(EAPrecP18.Text) <> '') then
                IBQSPImportarDeps.ParamByName('P18PREC').AsFloat:= EAPrecP18.GetDato
               else
                 IBQSPImportarDeps.ParamByName('P18PREC').Value:= null;
           end
         else
             begin
                IBQSPImportarDeps.ParamByName('ANIO').AsInteger:= StrToInt(EAAnio.Text);
                IBQSPImportarDeps.ParamByName('ANIMAL').AsInteger:= id_animal;
                IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstablecimientoActual;

                if (Trim(EADEPPN.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPN.Text)
                 else
                   IBQSPImportarDeps.ParamByName('NACERDEP').Value:= null;


                if (Trim(EAPrecPN.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('NACERPREC').AsFloat:= EAPrecPN.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('NACERPREC').Value:= null;

                if (Trim(EADEPPD.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPD.Text)
                 else
                   IBQSPImportarDeps.ParamByName('DESTDEP').Value:= null;

                if (Trim(EAPrecPD.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('DESTPREC').AsFloat:= EAPrecPD.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('DESTPREC').Value:= null;

                if (Trim(EADEPHL.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPHL.Text)
                 else
                   IBQSPImportarDeps.ParamByName('LECHEDEP').Value:= null;

                if (Trim(EAPrecHL.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('LECHEPREC').AsFloat:= EAPrecHL.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('LECHEPREC').Value:= null;

                if (Trim(EADEPCEUru.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEUru.Text)
                 else
                   IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

                if (Trim(EAPrecCEUru.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('CEPREC').AsFloat:= EAPrecCEUru.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('CEDEP').Value:= null;

                if (Trim(EADEPEGCUru.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPEGCUru.Text)
                 else
                   IBQSPImportarDeps.ParamByName('EGCDEP').Value:= null;

                if (Trim(EAPrecEGCUru.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('EGCPREC').AsFloat:= EAPrecEGCUru.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('EGCPREC').Value:= null;

                if (Trim(EADEPAOBUru.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOBUru.Text)
                 else
                   IBQSPImportarDeps.ParamByName('AOBDEP').Value:= null;

                if (Trim(EAPrecAOBUru.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('AOBPREC').AsFloat:= EAPrecAOBUru.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('AOBPREC').Value:= null;

                if (Trim(EACriador.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('CRIADOR').AsString:= EACriador.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('CRIADOR').Value:= null;

                if (Trim(EACodigoProp.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('CODIGO_PROPIETARIO').AsString:= EACodigoProp.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('CODIGO_PROPIETARIO').Value:= null;

                if (Trim(EANhij.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('NHIJ').AsInteger:= EANhij.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('NHIJ').Value:= null;

                if (Trim(EANhijM.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('NHIJM').AsInteger:= EANhijM.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('NHIJ').Value:= null;

                if (Trim(EANhijU.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('NHIJU').AsInteger:= EANhijU.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('NHIJU').Value:= null;

                IBQSPImportarDeps.ParamByName('DATO_PD').AsString:= '*';

                if (Trim(EADEPP18.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('P18DEP').AsFloat:= PasarDepAFloat(EADEPP18.Text)
                 else
                   IBQSPImportarDeps.ParamByName('P18DEP').Value:= null;

                if (Trim(EAPrecP18.Text) <> '') then
                  IBQSPImportarDeps.ParamByName('P18PREC').AsFloat:= EAPrecP18.GetDato
                 else
                   IBQSPImportarDeps.ParamByName('P18PREC').Value:= null;
             end;
       IBQSPImportarDeps.ParamByName('TIPO_ANIMAL').AsString:= 'I';
       IBQSPImportarDeps.ParamByName('FUENTE').Value := DBLCBAFuenteDeps.KeyValue;
       IBQSPImportarDeps.ExecSQL;
       FPrincipal.IBTPrincipal.CommitRetaining;
       if (insertar = 1) then
         MostrarMensaje(tmInformacion,'Los DEPs del animal se insertaron correctamente.')
        else
           MostrarMensaje(tmInformacion,'Los DEPs del animal se modificaron correctamente.' );
     except on e:exception do
        FPrincipal.IBTPrincipal.RollbackRetaining;
     end;
end;

procedure TFREPFichaAnimal.EACriasKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 4)) and (key <> #8)) then key:=#0;
end;

procedure TFREPFichaAnimal.EACriasExit(Sender: TObject);
var auxvalor : Integer;
begin
  inherited;
  if ((TEditAuto(Sender).Name <> 'EADEPProgEco') and (TEditAuto(Sender).Name <> 'EADEPHijasHereford')) then
  begin
      if (trim((TEditAuto(Sender).Text)) <> '') then
        if not(TryStrToInt(TEditAuto(Sender).Text,auxvalor)) then
        begin
            MostrarMensaje(tmError, 'Valor Inválido.');
            TEditAuto(Sender).SetFocus;
            TEditAuto(Sender).SelectAll;
        end;
  end;
end;

procedure TFREPFichaAnimal.AEveFlushingExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveFlushing.Create(self));
end;

procedure TFREPFichaAnimal.AEveTransferenciaEmbrionariaExecute(
  Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveTransferenciaEmbrionaria.Create(self));
end;

function TFREPFichaAnimal.partirString(nom:string;pos:integer):string;   //parte el string en varias lineas de longitud pos, intercalandoles un salto de linea
var str:string;
    i:integer;
begin
   for i:=1 to length(nom) do
     begin
     if (i mod pos)=0 then
       str:=str+nom[i]+#13
     else
       str:=str+nom[i];
     end;

  partirString:=str;
end;

procedure TFREPFichaAnimal.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  I : Integer;
begin
  inherited;
  HabilitarBotones(true);

  if ( vIngresoSolapaDeps  ) then
    HabilitarCompDeps(false);

  if ( vIngresoSolapaGenea ) then
  begin
    BorrarNodo := true;
    TVArbolGenea.Items.Delete(nodoPrincipal);
  end;

  if (FPrincipal.ConfiguroLector) then
  begin
    TimerLector.Enabled := false;
    //cerrarLector;
  end;
end;

procedure TFREPFichaAnimal.ObtenerEstabAnimal;
begin
  IBQEstaAnimal.Close;
  IBQEstaAnimal.ParamByName('id_animal').AsInteger := id_animal;
  IBQEstaAnimal.Open;
  EstabAnimal := IBQEstaAnimal.FieldValues['establecimiento'];
end;

procedure TFREPFichaAnimal.HabilitarSegunEstablecimiento;
var
  EstablecimientoEve : Integer;
begin
  ObtenerEstabAnimal;
  if IBQConsultaEventos.FieldValues['establecimiento'] <> null then
    EstablecimientoEve := IBQConsultaEventos.FieldValues['establecimiento'];
  //BBModificar.Enabled := BBModificar.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
  LmodifAnimal.Enabled := LmodifAnimal.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
  IModifAnimales.Enabled := IModifAnimales.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
  
  //BAgregarEvento.Enabled := BAgregarEvento.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
  LAgEvento.Enabled := LAgEvento.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
  IAgregaEve.Enabled := IAgregaEve.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);

  //BEliminar.Enabled := BEliminar.Enabled and (EstablecimientoEve = FPrincipal.EstablecimientoActual);
  IEliminarEve.Enabled := ((EstablecimientoEve = FPrincipal.EstablecimientoActual) or (IBQConsultaEventosIDTIPOEVENTO.Value = 5));
  LEliminaEve.Enabled := ((EstablecimientoEve = FPrincipal.EstablecimientoActual) or (IBQConsultaEventosIDTIPOEVENTO.Value = 5));
  //BQuitarRechazo.Enabled := BQuitarRechazo.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
  LQuitarRechazo.Enabled := LQuitarRechazo.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
  IQuitarRechazo.Enabled := IQuitarRechazo.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);

  BBModificarDep.Enabled := BBModificarDep.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
  BBImprimirDeps.Enabled := BBImprimirDeps.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
  BBAgregarFoto.Enabled := BBAgregarFoto.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
  BBEliminarFoto.Enabled := BBEliminarFoto.Enabled and (EstabAnimal = FPrincipal.EstablecimientoActual);
end;

function TFREPFichaAnimal.BuscarArchivo(const directorio, mascara, NomArch: string; atributos: Integer) : String;
  // Procedimiento anidado
  //
var
  resultado : String;
  function Buscar(var subdirectorio : String) : Boolean;
  var
    regBusqueda: TSearchRec;
    path : String;
  begin
    // Buscar en el directorio
    Result := false;
    if FindFirst(subdirectorio + mascara,atributos,regBusqueda) = 0 then
    begin
      try
        repeat
          Application.ProcessMessages;
          if (regBusqueda.Attr and faDirectory = 0) or (regBusqueda.Name <> '.') and (regBusqueda.Name <> '..') then
          begin
            if (regBusqueda.Name = NomArch) then
            begin
              subdirectorio := subdirectorio+NomArch;
              Result := true;
              Exit;
            end
            else
              Result := false;
          end;
        until FindNext(regBusqueda) <> 0;
      except
        FindClose(regBusqueda);
      end;
      FindClose(regBusqueda);
    end;
    // Buscar en los subdirectorios
    if FindFirst(subdirectorio + '*', atributos or faDirectory, regBusqueda) = 0 then
    begin
      try
        repeat
          Application.ProcessMessages;
          if ((regBusqueda.Attr and faDirectory) <> 0) and (regBusqueda.Name <> '.') and (regBusqueda.Name <> '..') then
          begin
            path := subdirectorio + regBusqueda.Name + '\';
            Result := Buscar(path);
            if Result then
            begin
              subdirectorio := path;
              Exit;
            end;
          end;
        until FindNext(regBusqueda) <> 0;
      except
        FindClose(regBusqueda);
      end;
      FindClose(regBusqueda);
    end;
  end;
   //
  // Fin del procedimiento anidado:
 // Comienza "BuscarArchivos(...)"
//
begin
  resultado := directorio+'\';
  if Buscar(resultado) then
    Result := resultado;
end;

procedure TFREPFichaAnimal.EACriasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then   //Angus
      begin
          EARodeo.SetFocus;
          EARodeo.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then//Brangus
          begin
              EARodeoBran.SetFocus;
              EARodeoBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                     //Braford
              begin
                  EARodeoBraford.SetFocus;
                  EARodeoBraford.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                 //Brahman
                  begin
                      EADEPPesoNacerBrahman.SetFocus;
                      EADEPPesoNacerBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then        //Hereford
                      begin
                          EADEPPNHereford.SetFocus;
                          EADEPPNHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                          //Shorthorn
                          begin
                              EADEPRodeoShorthorn.SetFocus;
                              EADEPRodeoShorthorn.SelectAll;
                          end
                          else
                          begin                                             //Otra raza
                              EARodeo.SetFocus;
                              EARodeo.SelectAll;
                          end;
  end;
end;

procedure TFREPFichaAnimal.EARodeoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then //Angus
      begin
          EADEPGest.SetFocus;
          EADEPGest.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                //Brangus
          begin
              EADEPPesoNacBran.SetFocus;
              EADEPPesoNacBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                   //Braford
              begin
                  EADEPPesoNacBraf.SetFocus;
                  EADEPPesoNacBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                               //Brahman
                  begin
                      EADEPCriasBrahman.SetFocus;
                      EADEPCriasBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EADEPHijasHereford.SetFocus;
                          EADEPHijasHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                          //Shorthorn
                          begin
                              EADEPGestShorthorn.SetFocus;
                              EADEPGestShorthorn.SelectAll;
                          end
                          else
                          begin
                              EADEPGest.SetFocus;
                              EADEPGest.SelectAll;
                          end;
    end;
end;

procedure TFREPFichaAnimal.EADEPGestKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecGest.SetFocus;
          EAPrecGest.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EAPRECAptitudBran.SetFocus;
              EAPRECAptitudBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                    //Braford
              begin
                  EAPRECAptitudBraf.SetFocus;
                  EAPRECAptitudBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                //Brahman
                  begin
                      EAPRECAptitudBrahman.SetFocus;
                      EAPRECAptitudBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EAPRECLMHereford.SetFocus;
                          EAPRECLMHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                         //Shorthorn
                          begin
                              EAPRECGestShorthorn.SetFocus;
                              EAPRECGestShorthorn.SelectAll;
                          end
                          else
                          begin                                            //Otra raza
                              EAPrecGest.SetFocus;
                              EAPrecGest.SelectAll;
                          end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecGestKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPNacer.SetFocus;
          EADEPNacer.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EADEPLecheBran.SetFocus;
              EADEPLecheBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                    //Braford
              begin
                  EADEPLecheBraf.SetFocus;
                  EADEPLecheBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                //Brahman
                  begin
                      EADEPLecheBrahman.SetFocus;
                      EADEPLecheBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EADEPLecheHereford.SetFocus;
                          EADEPLecheHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                         //Shorthorn
                          begin
                              EADEPNacerShorthorn.SetFocus;
                              EADEPNacerShorthorn.SelectAll;
                          end
                          else
                          begin                                            //Otra raza
                              EADEPNacer.SetFocus;
                              EADEPNacer.SelectAll;
                          end;
  end;
end;

procedure TFREPFichaAnimal.EADEPNacerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecNacer.SetFocus;
          EAPrecNacer.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EAPRECPesoNacBran.SetFocus;
              EAPRECPesoNacBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                    //Braford
              begin
                  EAPRECPesoNacBraf.SetFocus;
                  EAPRECPesoNacBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                //Brahman
                  begin
                      EAPRECPesoNacerBrahman.SetFocus;
                      EAPRECPesoNacerBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EAPRECPAHereford.SetFocus;
                          EAPRECPAHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                         //Shorthorn
                          begin
                              EAPRECNacerShorthorn.SetFocus;
                              EAPRECNacerShorthorn.SelectAll;
                          end
                          else
                          begin                                            //Otras Razas
                              EAPrecNacer.SetFocus;
                              EAPrecNacer.SelectAll;
                          end;
   end;
end;

procedure TFREPFichaAnimal.EAPrecNacerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPDest.SetFocus;
          EADEPDest.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EADEPPesoDestBran.SetFocus;
              EADEPPesoDestBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                    //Braford
              begin
                  EADEPPesoDestBraf.SetFocus;
                  EADEPPesoDestBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                //Brahman
                  begin
                      EADEPPesoDestBrahman.SetFocus;
                      EADEPPesoDestBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EADEPPFHereford.SetFocus;
                          EADEPPFHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                         //Shorthorn
                          begin
                              EADEPDestShorthorn.SetFocus;
                              EADEPDestShorthorn.SelectAll;
                          end
                          else
                          begin                                            //Otra raza
                              EADEPDest.SetFocus;
                              EADEPDest.SelectAll;
                          end;
  end;
end;

procedure TFREPFichaAnimal.EADEPDestKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecDest.SetFocus;
          EAPrecDest.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EAPRECPesoDestBran.SetFocus;
              EAPRECPesoDestBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                    //Braford
              begin
                  EAPRECPesoDestBraf.SetFocus;
                  EAPRECPesoDestBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                //Brahman
                  begin
                      EAPRECPesoDestBrahman.SetFocus;
                      EAPRECPesoDestBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EAPRECPFHereford.SetFocus;
                          EAPRECPFHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                         //Shorthorn
                          begin
                              EAPRECDestShorthorn.SetFocus;
                              EAPRECDestShorthorn.SelectAll;
                          end
                          else
                          begin                                            //Otra raza
                              EAPrecDest.SetFocus;
                              EAPrecDest.SelectAll;
                          end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecDestKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPLeche.SetFocus;
          EADEPLeche.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EADEPAptitudBran.SetFocus;
              EADEPAptitudBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                    //Braford
              begin
                  EADEPAptitudBraf.SetFocus;
                  EADEPAptitudBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                //Brahman
                  begin
                      EADEPAptitudBrahman.SetFocus;
                      EADEPAptitudBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EADEPLMHereford.SetFocus;
                          EADEPLMHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                         //Shorthorn
                          begin
                              EADEPLecheShorthorn.SetFocus;
                              EADEPLecheShorthorn.SelectAll;
                          end
                          else                                             //Otra raza
                          begin
                              EADEPLeche.SetFocus;
                              EADEPLeche.SelectAll;
                          end;
  end;
end;

procedure TFREPFichaAnimal.EADEPLecheKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecLeche.SetFocus;
          EAPrecLeche.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EADEPPesoFinalBran.SetFocus;
              EADEPPesoFinalBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                    //Braford
              begin
                  EADEPPesoFinalBraf.SetFocus;
                  EADEPPesoFinalBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                //Brahman
                  begin
                      EADEPPesoFinalBrahman.SetFocus;
                      EADEPPesoFinalBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EADEPCEHereford.SetFocus;
                          EADEPCEHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                         //Shorthorn
                          begin
                              EAPRECLecheShorthorn.SetFocus;
                              EAPRECLecheShorthorn.SelectAll;
                          end
                          else
                          begin                                            //Otra raza
                              EAPrecLeche.SetFocus;
                              EAPrecLeche.SelectAll;
                          end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecLecheKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPFinal.SetFocus;
          EADEPFinal.SelectAll;
      end
      else
          if ((RazaAnimal = 4) or (RazaAnimal = 5)) then                   //Hereford
          begin
              EADEPProgEco.SetFocus;
              EADEPProgEco.SelectAll;
          end
          else
              if (RazaAnimal = 7) then                                     //Shorthorn
              begin
                  EADEPFinalShorthorn.SetFocus;
                  EADEPFinalShorthorn.SelectAll;
              end
              else                                                         //Otra raza
              begin
                  EADEPFinal.SetFocus;
                  EADEPFinal.SelectAll;
              end;
  end;
end;

procedure TFREPFichaAnimal.EADEPFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecFinal.SetFocus;
          EAPrecFinal.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EAPRECPesoFinalBran.SetFocus;
              EAPRECPesoFinalBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                    //Braford
              begin
                  EAPRECPesoFinalBraf.SetFocus;
                  EAPRECPesoFinalBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                //Brahman
                  begin
                      EAPRECPesoFinalBrahman.SetFocus;
                      EAPRECPesoFinalBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EAPRECAOBHereford.SetFocus;
                          EAPRECAOBHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                         //Shorthorn
                          begin
                              EAPRECFinalShorthorn.SetFocus;
                              EAPRECFinalShorthorn.SelectAll;
                          end
                          else
                          begin
                              EAPrecFinal.SetFocus;                        //Otra raza
                              EAPrecFinal.SelectAll;
                          end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPCE.SetFocus;
          EADEPCE.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EADEPCEBran.SetFocus;
              EADEPCEBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                    //Braford
              begin
                  EADEPCEBraf.SetFocus;
                  EADEPCEBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                //Brahman
                  begin
                      EADEPCEBrahman.SetFocus;
                      EADEPCEBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EADEPGDHereford.SetFocus;
                          EADEPGDHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                         //Shorthorn
                          begin
                              EADEPCEShorthorn.SetFocus;
                              EADEPCEShorthorn.SelectAll;
                          end
                          else
                          begin                                            //Otra raza
                              EADEPCE.SetFocus;
                              EADEPCE.SelectAll;
                          end;
  end;
end;

procedure TFREPFichaAnimal.EADEPCEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecCE.SetFocus;
          EAPrecCE.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EAPRECCEBran.SetFocus;
              EAPRECCEBran.SelectAll;
          end
          else
              if (RazaAnimal = 11) then                                    //Braford
              begin
                  EAPRECCEBraf.SetFocus;
                  EAPRECCEBraf.SelectAll;
              end
              else
                  if (RazaAnimal = 10) then                                //Brahman
                  begin
                      EAPRECCEBrahman.SetFocus;
                      EAPRECCEBrahman.SelectAll;
                  end
                  else
                      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then       //Hereford
                      begin
                          EAPRECGDHereford.SetFocus;
                          EAPRECGDHereford.SelectAll;
                      end
                      else
                          if (RazaAnimal = 7) then                         //Shorthorn
                          begin
                              EAPRECCEShorthorn.SetFocus;
                              EAPRECCEShorthorn.SelectAll;
                          end
                          else
                          begin                                            //Otra raza
                              EAPrecCE.SetFocus;
                              EAPrecCE.SelectAll;
                          end;
  end;
end;

procedure TFREPFichaAnimal.EADEPAlturaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecAltura.SetFocus;
          EAPrecAltura.SelectAll;
      end
      else
          if ((RazaAnimal = 4) or (RazaAnimal = 5)) then                   //Hereford
          begin
              EADEPProgHereford.SetFocus;
              EADEPProgHereford.SelectAll;
          end
          else
              if (RazaAnimal = 7) then                                     //Shorthorn
              begin
                  EAPRECAlturaShorthorn.SetFocus;
                  EAPRECAlturaShorthorn.SelectAll;
              end
              else                                                         //Otra raza
              begin
                  EAPrecAltura.SetFocus;
                  EAPrecAltura.SelectAll;
              end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecAlturaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPEGD.SetFocus;
          EADEPEGD.SelectAll;
      end
      else
          if (RazaAnimal = 7) then                                         //Shorthorn
          begin
              EADEPEGDShorthorn.SetFocus;
              EADEPEGDShorthorn.SelectAll;
          end
          else
          begin                                                            //Otra raza
              EADEPEGD.SetFocus;
              EADEPEGD.SelectAll;
          end;
  end;
end;

procedure TFREPFichaAnimal.EADEPEGDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecEGD.SetFocus;
          EAPrecEGD.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EAPRECGDBran.SetFocus;
              EAPRECGDBran.SelectAll;
          end
          else
              if ((RazaAnimal = 4) or (RazaAnimal = 5)) then               //Hereford
              begin
                  EAPRECGDHereford.SetFocus;
                  EAPRECGDHereford.SelectAll;
              end
              else
                  if (RazaAnimal = 7) then                                 //Shorthorn
                  begin
                      EAPRECEGDShorthorn.SetFocus;
                      EAPRECEGDShorthorn.SelectAll;
                  end
                  else                                                     //Otra raza
                  begin
                      EAPrecEGD.SetFocus;
                      EAPrecEGD.SelectAll;
                  end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecEGDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPEGC.SetFocus;
          EADEPEGC.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EADEPGIBran.SetFocus;
              EADEPGIBran.SelectAll;
          end
          else
              if (RazaAnimal = 7) then                                     //Shorthorn
              begin
                  EADEPEGCShorthorn.SetFocus;
                  EADEPEGCShorthorn.SelectAll;
              end
              else
              begin                                                        //Otra raza
                  EADEPEGC.SetFocus;
                  EADEPEGC.SelectAll;
              end;
  end;
end;

procedure TFREPFichaAnimal.EADEPEGCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecEGC.SetFocus;
          EAPrecEGC.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EAPRECGCBran.SetFocus;
              EAPRECGCBran.SelectAll;
          end
          else
              if ((RazaAnimal = 4) or (RazaAnimal = 5)) then               //Hereford
              begin
                  EAPRECPAHereford.SetFocus;
                  EAPRECPAHereford.SelectAll;
              end
              else
                  if (RazaAnimal = 7) then                                 //Shorthorn
                  begin
                      EAPRECEGCShorthorn.SetFocus;
                      EAPRECEGCShorthorn.SelectAll;
                  end
                  else
                  begin                                                    //Otra raza
                      EAPrecEGC.SetFocus;
                      EAPrecEGC.SelectAll;
                  end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecEGCKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPAOB.SetFocus;
          EADEPAOB.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EADEPGDBran.SetFocus;
              EADEPGDBran.SelectAll;
          end
          else
              if ((RazaAnimal = 4) or (RazaAnimal = 5)) then               //Hereford
              begin
                  EADEPPFHereford.SetFocus;
                  EADEPPFHereford.SelectAll;
              end
              else
                  if (RazaAnimal = 7) then                                 //Shorthorn
                  begin
                      EADEPAOBShorthorn.SetFocus;
                      EADEPAOBShorthorn.SelectAll;
                  end
                  else                                                     //Otra raza
                  begin
                      EADEPAOB.SetFocus;
                      EADEPAOB.SelectAll;
                  end;
  end;
end;

procedure TFREPFichaAnimal.EADEPAOBKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecAOB.SetFocus;
          EAPrecAOB.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EAPRECAOBBran.SetFocus;
              EAPRECAOBBran.SelectAll;
          end
          else
              if ((RazaAnimal = 4) or (RazaAnimal = 5)) then               //Hereford
              begin
                  EAPRECPDHereford.SetFocus;
                  EAPRECPDHereford.SelectAll;
              end
              else
                  if (RazaAnimal = 7) then                                 //Shorthorn
                  begin
                      EAPRECAOBShorthorn.SetFocus;
                      EAPRECAOBShorthorn.SelectAll;
                  end
                  else
                  begin                                                    //Otra raza
                      EAPrecAOB.SetFocus;
                      EAPrecAOB.SelectAll;
                  end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecAOBKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPPorcGI.SetFocus;
          EADEPPorcGI.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EADEPGCBran.SetFocus;
              EADEPGCBran.SelectAll;
          end
          else
              if ((RazaAnimal = 4) or (RazaAnimal = 5)) then               //Hereford
              begin
                  EADEPPAHereford.SetFocus;
                  EADEPPAHereford.SelectAll;
              end
              else
                  if (RazaAnimal = 7) then                                 //Shorthorn
                  begin
                      EADEPPorcGIShorthorn.SetFocus;
                      EADEPPorcGIShorthorn.SelectAll;
                  end
                  else
                  begin                                                    //Otra raza
                      EADEPPorcGI.SetFocus;
                      EADEPPorcGI.SelectAll;
                  end;
  end;
end;

procedure TFREPFichaAnimal.EADEPPorcGIKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecPorcGI.SetFocus;
          EAPrecPorcGI.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EAPRECGIBran.SetFocus;
              EAPRECGIBran.SelectAll;
          end
          else
              if ((RazaAnimal = 4) or (RazaAnimal = 5)) then               //Hereford
              begin
                  EAPRECPNHereford.SetFocus;
                  EAPRECPNHereford.SelectAll;
              end
              else
                  if (RazaAnimal = 7) then                                 //Shorthorn
                  begin
                      EAPRECPorcGIShorthorn.SetFocus;
                      EAPRECPorcGIShorthorn.SelectAll;
                  end
                  else
                  begin                                                    //Otra raza
                      EAPrecPorcGI.SetFocus;
                      EAPrecPorcGI.SelectAll;
                  end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecPorcGIKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPPorcCM.SetFocus;
          EADEPPorcCM.SelectAll;
      end
      else
          if ((RazaAnimal = 4) or (RazaAnimal = 5)) then                   //Hereford
          begin
              EADEPPDHereford.SetFocus;
              EADEPPDHereford.SelectAll;
          end
          else
              if (RazaAnimal = 7) then                                     //Shorthorn
              begin
                  EADEPPorcCMShorthorn.SetFocus;
                  EAPRECPorcCMShorthorn.SelectAll;
              end
              else
              begin                                                        //Otra raza
                  EADEPPorcCM.SetFocus;
                  EADEPPorcCM.SelectAll;
              end;
  end;
end;

procedure TFREPFichaAnimal.EAPrecCEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EADEPAltura.SetFocus;
          EADEPAltura.SelectAll;
      end
      else
          if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then                 //Brangus
          begin
              EADEPAOBBran.SetFocus;
              EADEPAOBBran.SelectAll;
          end
          else
              if (RazaAnimal = 7) then                                     //Shorthorn
              begin
                  EADEPAlturaShorthorn.SetFocus;
                  EADEPAlturaShorthorn.SelectAll;
              end
              else
              begin                                                        //Otra raza
                  EADEPAltura.SetFocus;
                  EADEPAltura.SelectAll;
              end;
  end;
end;

procedure TFREPFichaAnimal.EADEPPorcCMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Char(Key) = #13) or (Key = VK_DOWN) or (Key = VK_RIGHT)) then
  begin
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then  //Angus
      begin
          EAPrecPorcCM.SetFocus;
          EAPrecPorcCM.SelectAll;
      end
      else
          if ((RazaAnimal = 4) or (RazaAnimal = 5)) then                   //Hereford
          begin
              EAPRECCEHereford.SetFocus;
              EAPRECCEHereford.SelectAll;
          end
          else
              if (RazaAnimal = 7) then                                     //Shorthorn
              begin
                  EAPRECPorcCMShorthorn.SetFocus;
                  EAPRECPorcCMShorthorn.SelectAll;
              end
              else                                                         //Otra raza
              begin
                  EAPrecPorcCM.SetFocus;
                  EAPrecPorcCM.SelectAll;
              end;
  end;
end;

procedure TFREPFichaAnimal.EACriadorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
  begin
      EACodigoProp.SetFocus;
      EACodigoProp.SelectAll;
  end;
end;

procedure TFREPFichaAnimal.EACodigoPropKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EANhij.SetFocus;
      EANhij.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EANhijKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EANhijM.SetFocus;
      EANhijM.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EANhijMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EANhijU.SetFocus;
      EANhijU.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EANhijUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPPN.SetFocus;
      EADEPPN.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EADEPPNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecPN.SetFocus;
      EAPrecPN.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EAPrecPNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPPD.SetFocus;
      EADEPPD.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EADEPPDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecPD.SetFocus;
      EAPrecPD.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EAPrecPDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPHL.SetFocus;
      EADEPHL.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EADEPHLKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecHL.SetFocus;
      EAPrecHL.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EAPrecHLKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPP18.SetFocus;
      EADEPP18.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EADEPP18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecP18.SetFocus;
      EAPrecP18.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EAPrecP18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPCEUru.SetFocus;
      EADEPCEUru.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EADEPCEUruKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecCEUru.SetFocus;
      EAPrecCEUru.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EAPrecCEUruKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPAOBUru.SetFocus;
      EADEPAOBUru.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EADEPAOBUruKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecAOBUru.SetFocus;
      EAPrecAOBUru.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EAPrecAOBUruKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPEGCUru.SetFocus;
      EADEPEGCUru.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.EADEPEGCUruKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecEGCUru.SetFocus;
      EAPrecEGCUru.SelectAll;
    end;
end;

procedure TFREPFichaAnimal.HabilitarComponentesVersionBasica;
begin
  inherited;    
//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
    begin
      ReportedePedigree1.Enabled:= false;
      ReporteIndividual1.Enabled:= false;

      TSTV.TabVisible:= false;
      TabSheet2.TabVisible:= false;
      TabSheet1.TabVisible:= false;

      AEveCalidadCarne.Enabled:= false;
      AEveSuplementacion.Enabled:= false;
      AEveFlushing.Enabled:= false;
      AEveTransferenciaEmbrionaria.Enabled:= false;
   end;
//  {$ELSE}
    //
//  {$ENDIF}
end;

procedure TFREPFichaAnimal.LabelTipoEventoClick(Sender : TObject);
begin
  case (Sender as TJvFullColorLabel).Tag of
    1: CBGeneral.Checked := not CBGeneral.Checked;
    2: CBEstablecimiento.Checked := not CBEstablecimiento.Checked;
    3: CBCriaRecria.Checked := not CBCriaRecria.Checked;
    4: CBInvernada.Checked := not CBInvernada.Checked;
    5: CBServicios.Checked := not CBServicios.Checked;
    6: CBGestacion.Checked := not CBGestacion.Checked;
    7: CBPartoNac.Checked := not CBPartoNac.Checked;
    8: CBSanitario.Checked := not CBSanitario.Checked;
    9: CBOtroEstab.Checked := not CBOtroEstab.Checked;
  end;
  CBTipoEventoClick(nil);
end;

procedure TFREPFichaAnimal.CBTipoEventoClick(Sender : TObject);
var
  cartel: TCartel;
  msje: String;
begin
  StrFiltros := '';
  if CBGeneral.Checked then StrFiltros := StrFiltros+' or id_categoria = '+IntToStr(CBGeneral.Tag)+' ';
  if CBEstablecimiento.Checked then StrFiltros := StrFiltros+' or id_categoria = '+IntToStr(CBEstablecimiento.Tag)+' ';
  if CBCriaRecria.Checked then StrFiltros := StrFiltros+' or id_categoria = '+IntToStr(CBCriaRecria.Tag)+' ';
  if CBInvernada.Checked then StrFiltros := StrFiltros+' or id_categoria = '+IntToStr(CBInvernada.Tag)+' ';
  if CBServicios.Checked then StrFiltros := StrFiltros+' or id_categoria = '+IntToStr(CBServicios.Tag)+' ';
  if CBGestacion.Checked then StrFiltros := StrFiltros+' or id_categoria = '+IntToStr(CBGestacion.Tag)+' ';
  if CBPartoNac.Checked then StrFiltros := StrFiltros+' or id_categoria = '+IntToStr(CBPartoNac.Tag)+' ';
  if CBSanitario.Checked then StrFiltros := StrFiltros+' or id_categoria = '+IntToStr(CBSanitario.Tag)+' ';
  if StrFiltros <> '' then
  begin
    StrFiltros := StringReplace(StrFiltros,'or','where (',[]);
    StrFiltros := StrFiltros+' ) ';
  end;
  if CBOtroEstab.Checked then
  begin
    if AnsiContainsStr(StrFiltros,'where') then
      StrFiltros := StrFiltros+' and establecimiento <> '+IntToStr(FPrincipal.EstablecimientoActual)+' '
    else
      StrFiltros := StrFiltros+' where establecimiento <> '+IntToStr(FPrincipal.EstablecimientoActual)+' '
  end;

  cartel:= TCartel.getInstance();
  msje:= 'Cargando eventos del animal. Aguarde unos segundos...';
  cartel.abrircartel(msje);

  if not MasEventos then
    ActualizarEventos20(id_animal)
  else
    ActualizarEventos(id_animal);

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFREPFichaAnimal.IBQFuenteDepsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

procedure TFREPFichaAnimal.TVArbolGeneaDeletion(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  if BorrarNodo then
    Dispose(Node.Data);
end;

procedure TFREPFichaAnimal.SBAnteriorClick(Sender: TObject);
begin
  inherited;

  IBQListadoAnimales.Prior;

  animal := IBQListadoAnimales.FieldValues['animal'];

  HabilitarBotones(true);

  ActualizarDatosAnimal;

  Siguiente;
  Anterior;
end;

procedure TFREPFichaAnimal.SBSiguienteClick(Sender: TObject);
begin
  inherited;
  IBQListadoAnimales.Next;

  animal := IBQListadoAnimales.FieldValues['animal'];

  HabilitarBotones(true);

  ActualizarDatosAnimal;
  Siguiente;
  Anterior;
end;

procedure TFREPFichaAnimal.Siguiente;
begin
  IBQListadoAnimales.Next;

  sig := IBQListadoAnimales.FieldValues['RP'];

  LSiguiente.Caption := Traducir('RP Siguiente: ')+sig;

  IBQListadoAnimales.Prior;

end;

procedure TFREPFichaAnimal.Anterior;
begin
  IBQListadoAnimales.Prior;

  ant := IBQListadoAnimales.FieldValues['RP'];

  LAnterior.Caption := Traducir('RP Anterior: ')+ant;

  IBQListadoAnimales.Next;

end;

procedure TFREPFichaAnimal.EARPChange(Sender: TObject);
begin
  inherited;
  if IBQListadoAnimales.Locate('rp',EARP.Text,[]) then
  begin
    animal := IBQListadoAnimales.FieldValues['animal'];
    ActualizarDatosAnimal;
    Siguiente;
    Anterior;
  end;
end;

procedure TFREPFichaAnimal.BGenealogiaCompletaClick(Sender: TObject);
begin
  inherited;
  if PGenea5.Visible then
  begin
    NivelGenealogia := 100;
    BGenealogiaCompleta.Caption := Traducir('Obtener Genealogía Resumida');
  end
  else
  begin
    NivelGenealogia := 3;
    BGenealogiaCompleta.Caption := Traducir('Obtener Genealogía Completa');
  end;
  ActualizarDatosAnimal;
  PCFichaAnimal.ActivePage := TSTV;
  PGenea5.Visible := not PGenea5.Visible;
  TVArbolGenea.Visible := not TVArbolGenea.Visible;
end;

procedure TFREPFichaAnimal.CargarGenea5;
var alter:string;
    valor:string;
    externo:boolean;
begin
  InfP.Caption := Traducir('Desconocido');
  InfM.Caption := Traducir('Desconocido');
  InfPP.Caption := Traducir('Desconocido');
  InfPM.Caption := Traducir('Desconocido');
  InfMP.Caption := Traducir('Desconocido');
  InfMM.Caption := Traducir('Desconocido');
  InfPPP.Caption := Traducir('Desconocido');
  InfPPM.Caption := Traducir('Desconocido');
  InfPMP.Caption := Traducir('Desconocido');
  InfPMM.Caption := Traducir('Desconocido');
  InfMPP.Caption := Traducir('Desconocido');
  InfMPM.Caption := Traducir('Desconocido');
  InfMMP.Caption := Traducir('Desconocido');
  InfMMM.Caption := Traducir('Desconocido');

  externo := false;

  retornarAlternativo(animal,externo, alter, valor);
  LAnimal.Caption := Traducir('RP: ')+LabelRPValue.Caption+' - '+LabelNombreValue.Caption+' - '+alter+' '+valor;

  IBQArbolAux.Active := false;
  IBQArbolAux.ParamByName('id').AsInteger := animal;
  IBQArbolAux.ParamByName('nivel').AsInteger := 3;
  IBQArbolAux.Active := true;

  IBQArbolAux.First;
  while not IBQArbolAux.Eof do
  begin
    externo := IBQArbolAux.FieldByName('externo').AsString = 'S';

    if IBQArbolAux.FieldByName('relacion').AsString = 'P' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IP.Picture.Bitmap);
      InfP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'M' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IM.Picture.Bitmap);
      InfM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPP.Picture.Bitmap);
      InfPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPM.Picture.Bitmap);
      InfPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMP.Picture.Bitmap);
      InfMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMM.Picture.Bitmap);
      InfMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPP.Picture.Bitmap);
      InfPPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPM.Picture.Bitmap);
      InfPPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMP.Picture.Bitmap);
      InfPMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMM.Picture.Bitmap);
      InfPMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPP.Picture.Bitmap);
      InfMPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPM.Picture.Bitmap);
      InfMPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMP.Picture.Bitmap);
      InfMMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMM.Picture.Bitmap);
      InfMMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMM.Transparent := externo;
    end;

    if IBQArbolAux.FieldByName('relacion').AsString = 'PPPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPPP.Picture.Bitmap);
      InfPPPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPPP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PPPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPPM.Picture.Bitmap);
      InfPPPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPPM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PPMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPMP.Picture.Bitmap);
      InfPPMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPMP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PPMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPMM.Picture.Bitmap);
      InfPPMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPMM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMPP.Picture.Bitmap);
      InfPMPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMPP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMPM.Picture.Bitmap);
      InfPMPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMPM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMMP.Picture.Bitmap);
      InfPMMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMMP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMMM.Picture.Bitmap);
      InfPMMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMMM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPPP.Picture.Bitmap);
      InfMPPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPPP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPPM.Picture.Bitmap);
      InfMPPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPPM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPMP.Picture.Bitmap);
      InfMPMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPMP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPMM.Picture.Bitmap);
      InfMPMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPMM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMPP.Picture.Bitmap);
      InfMMPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMPP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMPM.Picture.Bitmap);
      InfMMPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMPM.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMMP.Picture.Bitmap);
      InfMMMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMMP.Transparent := externo;
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMMM.Picture.Bitmap);
      InfMMMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMMM.Transparent := externo;
    end;

    IBQArbolAux.Next;
  end;
end;

procedure TFREPFichaAnimal.retornarAlternativo(id: integer;
  externo: boolean; var identif, value: string);
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  if (externo) then
    IBQAux.sql.add('select * from tab_animales_externos where (id_animal_externo = :n) and (establecimiento = :esta)')
  else
    IBQAux.sql.add('select * from tab_animales where (id_animal = :n)  and (establecimiento = :esta)');
    
  IBQAux.ParamByName('n').AsInteger := id;
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;

  if ((IBQAux.fieldbyname('id_hba').AsString <> '') and (IBQAux.fieldbyname('id_hba').Value <> null))then
    begin
      identif := FPrincipal.PaisHerdBook+': ';
      value := IBQAux.fieldbyname('id_hba').AsString;
    end
  else
    if ((IBQAux.fieldbyname('id_pc').AsString <> '') and (IBQAux.fieldbyname('id_pc').Value <> null)) then
      begin
        case RazaAnimal of
          2,3 :  identif := 'PC: ';
          10 :  identif := 'RGB: ';
          11 :  identif := 'ABA: ';
          12,28,30 :  identif := 'AAB: ';
        end;
        value := IBQAux.fieldbyname('id_pc').AsString;
      end
    else
      if ((IBQAux.fieldbyname('id_ra').AsString <> '') and (IBQAux.fieldbyname('id_ra').Value <> null)) then
        begin
          identif := 'UBB: ';
          value := IBQAux.fieldbyname('id_ra').AsString;
        end
      else
        if ((IBQAux.fieldbyname('id_senasa').AsString <> '') and (IBQAux.fieldbyname('id_senasa').Value <> null))then
          begin
            identif := FPrincipal.PaisNombreCaravana+': ';
            value := IBQAux.fieldbyname('id_senasa').AsString;
          end
        else
          begin
            identif := '';
            value := '';
          end;
end;

procedure TFREPFichaAnimal.TPanelTimer(Sender: TObject);
begin
  inherited;
  TPanel.Enabled := false;
  JvCPHint.Visible := false;
  PPedigree.Visible := false;
end;

procedure TFREPFichaAnimal.DBGEventosColExit(Sender: TObject);
begin
  inherited;
  JvCPHint.Visible := false;
end;

procedure TFREPFichaAnimal.AcomodarNombreyRP;
var
  largoTotal : Integer;
begin
  if (LabelNombreValue.Caption <> '-') and (LabelNombreValue.Caption <> '') and (LabelNombreValue.Caption <> ' ') then
  begin
    largoTotal := LabelRP.Width + LabelRPValue.Width + LabelNombre.Width + LabelNombreValue.Width;
    LabelRP.Left := (PNavega.Width div 2) - (largoTotal div 2);
    LabelRPValue.Left := LabelRP.Left + LabelRP.Width + 2;
    LabelNombre.Left := LabelRPValue.Left + LabelRPValue.Width + 10;
    LabelNombreValue.Left := LabelNombre.Left + LabelNombre.Width + 5;
    LabelNombre.Visible := true;
    LabelNombreValue.Visible := true;
  end
  else
  begin
    largoTotal := LabelRP.Width + LabelRPValue.Width;
    LabelRP.Left := (PNavega.Width div 2) - (largoTotal div 2);
    LabelRPValue.Left := LabelRP.Left + LabelRP.Width + 2;
  end;
  LSiguiente.Left := PNavega.Width - LSiguiente.Width - SBSiguiente.Width - 10;
  SBSiguiente.Left := PNavega.Width - SBSiguiente.Width - 10;
end;

procedure TFREPFichaAnimal.FormResize(Sender: TObject);
begin
  inherited;
  AcomodarNombreyRP;
end;

procedure TFREPFichaAnimal.FormClick(Sender: TObject);
begin
  inherited;
  PPedigree.Visible := false;
end;

procedure TFREPFichaAnimal.CargarSolapaGenealogia;
var PunteroPrincipal : TArrayPointer;
begin

  // SOLAPA DE ARBOL GENEALOGICO N-ARIO
  TVArbolGenea.Items.Clear;
  new(PunteroPrincipal);
  PunteroPrincipal^.id_animal := id_animal;
  PunteroPrincipal^.padres_de := 0;
  PunteroPrincipal^.nivel_arbol := 0;
  PunteroPrincipal^.raza := IBQAnimales.fieldByName('raza').AsInteger;
  PunteroPrincipal^.id_rp := IBQAnimales.fieldByName('id_rp').AsString;
  PunteroPrincipal^.id_senasa := IBQAnimales.fieldByName('id_senasa').AsString;
  PunteroPrincipal^.id_hba := IBQAnimales.fieldByName('id_hba').AsString;
  PunteroPrincipal^.id_ra := IBQAnimales.fieldByName('id_ra').AsString;
  PunteroPrincipal^.id_otro := IBQAnimales.fieldByName('id_otro').AsString;
  PunteroPrincipal^.id_pc := IBQAnimales.fieldByName('id_pc').AsString;
  PunteroPrincipal^.madre := 'N';
  PunteroPrincipal^.externo := 'N';
  PunteroPrincipal^.nombre := IBQAnimales.fieldByName('nombreAnimal').AsString;

  Application.ProcessMessages;

  //MODIFIQUE LABELNOMBREVALUE POR LABELNOMBREANIMALVALUE
  nodoPrincipal := TVArbolGenea.Items.AddObject(nil, LabelRPValue.Caption +' : '+LabelNombreValue.Caption, PunteroPrincipal);
  if (LabelSexoValue.Caption = Traducir('MACHO')) then
    nodoPrincipal.ImageIndex := 0
  else
    nodoPrincipal.ImageIndex := 1;
  nodoPrincipal.SelectedIndex := nodoPrincipal.ImageIndex;
  Indarr := 0;
  ArmarArbol2(id_animal,nodoPrincipal,'N');
  CargarGenea5;

end;


procedure TFREPFichaAnimal.JvSeleccionImagenButtonClick(Sender: TObject;
  Button: TJvCapBtnStyle);
begin
  inherited;
  JvSeleccionImagen.Visible := false;
end;

procedure TFREPFichaAnimal.BBSeleccionFotoClick(Sender: TObject);
begin
  inherited;
  JvSeleccionImagen.Visible := true;
end;

procedure TFREPFichaAnimal.InfMClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
  E : TFAbmPadresExternos;
  Iabm:IButtonABM;
  id_animal_ex : integer;
begin
  inherited;
  if ((Sender as TLabel).Tag > 0) and ((Sender as TLabel).Caption <> 'Desconocido') then
   begin
      if not (Sender as TLabel).Transparent then
       begin
         F := TFREPFichaAnimal.Create(self);
         F.animal := (Sender as TLabel).Tag;
         F.ShowModal;
         F.Destroy;
       end
      else
        if (Iabm = nil) then
        begin
          id_animal_ex :=(Sender as Tlabel).Tag;
          //id_animal_ex := (Sender as Tlabel).Tag;
          IBQEstabAnimalExt.Close;
          IBQEstabAnimalExt.ParamByName('animal').AsInteger := id_animal_ex;
          IBQEstabAnimalExt.Open;
          Application.CreateForm(TFABMPadresExternos, FABMPadresExternos);
          FABMPadresExternos:=TFABMPadresExternos.Create(self);
          FABMPadresExternos.EstabAux := IBQEstabAnimalExt.FieldValues['establecimiento'];
          FABMPadresExternos.nom:=inttostr(id_animal_ex);
          FABMPadresExternos.id_animal_ex := id_animal_ex;
          Iabm := IButtonABM(FABMPadresExternos);
         // FABMPadresExternos.AcEditarExecute(Sender);
          Iabm.ISetCampoRetorno('id_animal_externo');
          Iabm.IFitrate(-1,IBQEstabAnimalExt.FieldValues['establecimiento']);
          Iabm.IAbrir(faabm);
        end;
        ActualizarDatosAnimal;
        self.FormShow(Sender);
   end;
end;

procedure TFREPFichaAnimal.ICancelDepsClick(Sender: TObject);
begin
  CargarDeps();
  HabilitarCompDeps(true);
  HabilitarBotones(false);
end;

procedure TFREPFichaAnimal.TPanelEventosTimer(Sender: TObject);
begin
  inherited;

  PListaEventos.Visible := false;
end;

procedure TFREPFichaAnimal.AlienarAcciones;
var i, tope, ind : integer;
    arrPos : array of integer;
    arrVis : array of TComponent;
begin

     tope := 3;
     SetLength(arrPos,39);
     SetLength(arrVis,39);

     for i := 0 to 39-1 do
     begin
          arrPos[i] := tope;
          tope := tope + 19;

          arrVis[i] := nil;
     end;

     PListaEventos.Height := tope + 3;
     PListaEventos.Top := 85;

     for i := 0 to ComponentCount-1 do
     begin
          if (Components[i].GetParentComponent = PListaEventos) then
          begin
               if (Components[i] is TLabel) then
               begin
                    if ((Components[i] as TLabel).Visible) then
                    begin
                         arrVis[(Components[i] as TLabel).Tag-1] := Components[i];
                    end;
               end;
          end;
     end;

     ind := 0;

     for i := 0 to 39-1 do
     begin
          if (arrVis[i] <> nil) then
          begin
            (arrVis[i] as TLabel).Top := arrPos[ind];
            Inc(ind);
          end;
     end;

end;

procedure TFREPFichaAnimal.ResaltarLabelEnter(Sender : TObject);
begin
     (Sender as TLabel).Font.Style := [fsBold];
     (Sender as TLabel).Font.Size := 10;
end;

procedure TFREPFichaAnimal.ResartalLabelLeave(Sender : TObject);
begin

     (Sender as TLabel).Font.Style := [fsBold];
     (Sender as TLabel).Font.Size := 9;

end;

procedure TFREPFichaAnimal.LTuberculinizacionMouseEnter(Sender: TObject);
begin
  inherited;

  ResaltarLabelEnter(Sender);
end;

procedure TFREPFichaAnimal.LTuberculinizacionMouseLeave(Sender: TObject);
begin
  inherited;

  ResartalLabelLeave(Sender);
end;

procedure TFREPFichaAnimal.LRepPedigreeMouseEnter(Sender: TObject);
begin
  inherited;

  LRepPedigree.Font.Size := 10;
end;

procedure TFREPFichaAnimal.LRepPedigreeMouseLeave(Sender: TObject);
begin
  inherited;

  LRepPedigree.Font.Size := 9;
end;

procedure TFREPFichaAnimal.LRepIndividualMouseEnter(Sender: TObject);
begin
  inherited;
  LRepIndividual.Font.Size := 10;
end;

procedure TFREPFichaAnimal.LRepIndividualMouseLeave(Sender: TObject);
begin
  inherited;
  LRepIndividual.Font.Size := 9;
end;

procedure TFREPFichaAnimal.identificarAnimalPorLector;
var rec:TRecordData;
    id_aux : Integer;
    auxlectura,rpaux, auxie: String;
begin
  auxlectura := FLectorElectronico.Lectura;
  FLectorElectronico.Lectura := '';

  if(auxlectura<>'')then
  begin
    auxlectura := FLectorElectronico.Limpiar(auxlectura);

    if DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal')<>null then
    begin
      DMSoftvet.IBQDatosAnimal.Close;
      DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQDatosAnimal.Open;
      id_aux := DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
      rpaux := DMSoftvet.IBQDatosAnimal.Lookup('id_animal',id_aux,'id_rp');

     Try
      id_animal := id_aux;
      ActualizarDatosAnimal;
      ActualizarEventos20(Id_animal);
     Except
      MostrarMensaje(tmError,'El animal con I.E. '+auxlectura+' no existe en el establecimiento');
     End;

    end
    else
      MostrarMensaje(tmError,'El animal con I.E. '+auxlectura+' no existe en el establecimiento');
  end;
end;

procedure TFREPFichaAnimal.TimerLectorTimer(Sender: TObject);
begin
  inherited;
  identificarAnimalPorLector;
end;

procedure TFREPFichaAnimal.crearLector;
begin
  FLectorElectronico:= TLectorAllFlexSerie.Create();//creo segun el que estamos usando
  FLectorElectronico.ConfigurarVaComm();
  FLectorElectronico.OpenVAComm; // abro la conexion  }
end;

procedure TFREPFichaAnimal.cerrarLector;
begin
  if FLectorElectronico<>nil then
  begin
    FLectorElectronico.CloseVAComm;
    FLectorElectronico.Destroy;
    FLectorElectronico:=nil;
  end;
end;

procedure TFREPFichaAnimal.ArmarGraficoDatosFenotipicos;
var val_ini : integer;
    val_aux : string;
begin
    IBQFenotiposSinteticos.Close;
    IBQFenotiposSinteticos.ParamByName('animal').AsInteger := id_animal;
    IBQFenotiposSinteticos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQFenotiposSinteticos.Open;
    IBQFenotiposSinteticos.First;

    IBQGetEscala.Close;
    IBQGetEscala.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQGetEscala.Open;

    val_aux := IBQGetEscala.FieldValues['valor'];

    if (val_aux[1] <> '') then
      if (val_aux[1] = '0') then
        val_ini := 0
      else
        val_ini := -5;

    if (IBQFenotiposSinteticos.IsEmpty) then
    begin
        PGraficoFicha.Align := alNone;
        PGraficoFicha.Visible := false;

        PDatos.Align := alClient;
        ICargaFenotipos.Left := 430;
        Label80.Left := 432;

        Panel6.Align := alNone;
        Panel6.Visible := false;
    end
    else
    begin
        PDatos.Align := alLeft;
        PDatos.Width := 120;
        ICargaFenotipos.Left := 6;
        Label80.Left := 8;

        Panel6.Visible := true;
        Panel6.Align := alRight;

        PGraficoFicha.Visible := true;
        PGraficoFicha.Align := alClient;

        if (fra = nil) then
        begin
          fra := TFFrameGrafico.Create(self);
          fra.ArmarGraficoDatosFenotipicos(IBQFenotiposSinteticos,val_ini,0);
          fra.Name := 'FFrameGrafico1';
          fra.Parent := PGraficoFicha;

          fra.Align := alClient;

          PGraficoFicha.Width := fra.PGrafico.Width;
          PGraficoFicha.Height := fra.PGrafico.Height;
          vTamPanel := PCFichaAnimal.Height;
        end
        else
        begin
          if FindComponent('FFrameGrafico1') <> nil then
            fra.Destroy;
          fra := nil;
          PCFichaAnimal.Height := 184;
          ArmarGraficoDatosFenotipicos;
        end;
    end;

end;

procedure TFREPFichaAnimal.GuardarGrafico;
var m, f : TStream;
    s : string;
begin

    try

      IBDSAuxGraficos.Close;
      IBDSAuxGraficos.Open;

      IBDSAuxGraficos.Insert;

      IBDSAuxGraficosID_ANIMAL.AsInteger := id_animal;

      m := IBDSAuxGraficos.CreateBlobStream(IBDSAuxGraficosIMG_GRA, bmWrite);

      f := TFileStream.Create(ExtractFilePath(Application.ExeName)+'grafico.bmp', fmOpenRead);

      m.CopyFrom(f, f.Size);

      IBDSAuxGraficos.Post;

      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;

    f.Free;
    m.Free;
end;



procedure TFREPFichaAnimal.ICargaFenotiposClick(Sender: TObject);
var F : TFCargaFenotipos;
begin
    inherited;

    if ((RazaAnimal = 11) or (RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30) or (RazaAnimal = 10)or (RazaAnimal=4) or (RazaAnimal=5)) then
    begin

        vPrimeraGrafica := false;

        F := TFCargaFenotipos.Create(self);
        F.tipoCarga := 'Individual';
        F.id := Id_animal;
        F.ShowModal;
        F.Destroy;

        ArmarGraficoDatosFenotipicos;
        if (PCFichaAnimal.Height < fra.PGrafico.Height) then
          PCFichaAnimal.Height := fra.PGrafico.Height;

        CargaResiente := true;  
        FormActivate(sender);
    end
    else
        MostrarMensaje(tmInformacion,'Esta opción solo se puede realizar en animales de raza Braford o Brangus.');
end;

procedure TFREPFichaAnimal.FormActivate(Sender: TObject);
begin
  inherited;

  if not(vPrimeraGrafica) then
  begin
       fra.Destroy;
       fra := nil;
       ArmarGraficoDatosFenotipicos;
  end;

  if (CargaResiente) then
  begin
    PCFichaAnimal.ActivePage := TSCargaFenotipos;
    CargaResiente := false;
  end
  else
  begin
    PCFichaAnimal.ActivePage := TabSheet2;
    PCFichaAnimal.Height := 265;
    SeleccionDepsImg;
    PCFichaAnimal.ActivePage := TSBasicos;
    PCFichaAnimal.Height := 268;
  end;
  
end;

procedure TFREPFichaAnimal.JvLCMGClick(Sender: TObject);
var F : TFRepCertificadoMeritoGenetico;
    fecha : TDate;
    aNo, Mes, Dia : Word;
begin
  inherited;

  F := TFRepCertificadoMeritoGenetico.Create(self);

  F.InicializarLabels;

  F.QRLNombreValue.Caption := LabelNombreAnimalValue.Caption;

  F.QRLCabaniaValue.Caption := 'Nombre cabaña';

  if (IBQAnimales.FieldValues['apodo'] <> null) then
    F.QRLApodoValue.Caption := IBQAnimales.FieldValues['apodo']
  else
    F.QRLApodoValue.Caption := '';

  F.QRLCriadorValue.Caption := 'Nombre criador';

  F.QRLCategoriaValue.Caption := LabelCategoriaValue.Caption;
  F.QRLRpValue.Caption := LabelRPValue.Caption;
  F.QRLHbaValue.Caption := LabelIDHBAValue.Caption;

  fecha := StrToDate(LabelNacimientoValue.Caption);
  DecodeDate(fecha, aNo, Mes, Dia);

  F.QRLAnioNacValue.Caption := IntToStr(aNo);
  F.QRLTipSangValue.Caption := LTipSangValue.Caption;

  F.prepararReportes(Id_animal,FPrincipal.EstablecimientoActual);
  F.animal_cte := Id_animal;

  F.anio_cte := StrToInt(EAAnio.Text);
  F.prepararDeps;
  F.prepararDatosAnimal(Id_animal);

  F.ShowModal;
  F.Destroy;

end;

procedure TFREPFichaAnimal.JvLCMGMouseEnter(Sender: TObject);
begin
  inherited;
  JvLCMG.Font.Size := 10;
end;

procedure TFREPFichaAnimal.JvLCMGMouseLeave(Sender: TObject);
begin
  inherited;
  JvLCMG.Font.Size := 9;
end;

procedure TFREPFichaAnimal.EAPRECCEHerefordKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ((RazaAnimal = 4) or (RazaAnimal = 5)) then
  begin
      EADEPAOBHereford.SetFocus;
      EADEPAOBHereford.SelectAll;
  end;
end;


procedure TFREPFichaAnimal.GenerarImgDeps(PanelDeps : TPanel);
var Imag : TBitmap;
    aux : string;
begin

  JvPanelDeps.Refresh;  
  JvPanelDeps.Top := PanelDeps.Top;

  if (PanelDeps.Name = 'PArgentina') then
  begin
    JvPanelDeps.Left := 436;
    JvPanelDeps.Width := 570;
    JvPanelDeps.Height := 144;
  end;

  if (PanelDeps.Name = 'PArgentinaBrahman') then
  begin
    JvPanelDeps.Left := 327;
    JvPanelDeps.Width := 673;
    JvPanelDeps.Height := 91;
  end;

  if (PanelDeps.Name = 'PArgentinaHereford') then
  begin
    JvPanelDeps.Left := 406;
    JvPanelDeps.Width := 594;
    JvPanelDeps.Height := 114;
  end;

  if (PanelDeps.Name = 'PArgentinaBraford') then
  begin
    JvPanelDeps.Left := 462;
    JvPanelDeps.Width := 540;
    JvPanelDeps.Height := 107;
  end;

  if (PanelDeps.Name = 'PArgentinaBrangus') then
  begin
    JvPanelDeps.Left := 449;
    JvPanelDeps.Width := 550;
    JvPanelDeps.Height := 134;
  end;

  if (PanelDeps.Name = 'PArgentinaShorthorn') then
  begin
    JvPanelDeps.Left := 70;
    JvPanelDeps.Width := 716;
    JvPanelDeps.Height := 87;
    JvPanelDeps.Top := 51;
  end;

  PanelDeps.PaintTo(GetDC(JvPanelDeps.Handle),0,0);

  Imag := TBitmap.Create;
  Imag.Width := JvPanelDeps.Width;
  Imag.Height := JvPanelDeps.Height;
  Imag.Canvas.CopyRect(Rect(0,0,Imag.Width,Imag.Height),JvPanelDeps.Canvas,Rect(0,0,JvPanelDeps.Width,JvPanelDeps.Height));
  Imag.SaveToFile(pathDirExe+'\deps_2.bmp');

  Imag.Destroy;

end;

procedure TFREPFichaAnimal.SeleccionDepsImg;
begin

      DeleteFile(pathDirExe+'\deps_2.bmp');
      
      if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then   //Angus
      begin
        PArgentina.Repaint;
        GenerarImgDeps(PArgentina);
      end;

      if (RazaAnimal = 10) then                                             //Brahman
      begin
        PArgentinaBrahman.Repaint;
        GenerarImgDeps(PArgentinaBrahman);
      end;

      if (RazaAnimal = 11) then                                             //Braford
      begin
        PArgentinaBraford.Repaint;
        GenerarImgDeps(PArgentinaBraford);
      end;

      if ((RazaAnimal = 12) or (RazaAnimal = 28) or (RazaAnimal = 30)) then //Brangus
      begin
        PArgentinaBrangus.Repaint;
        GenerarImgDeps(PArgentinaBrangus);
      end;

      if ((RazaAnimal = 4) or (RazaAnimal = 5)) then                        //Hereford
      begin
        LDepNombrePadreHereford.Visible := false;
        PArgentinaHereford.Repaint;
        GenerarImgDeps(PArgentinaHereford);
        LDepNombrePadreHereford.Visible := true;
      end;

      if (RazaAnimal = 7) then                                              //Shorthorn
      begin
        PArgentinaShorthorn.Repaint;
        GenerarImgDeps(PArgentinaShorthorn);
      end;
end;



procedure TFREPFichaAnimal.AEveExtraccionSemenExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveExtraccionSemen.Create(self));
end;

procedure TFREPFichaAnimal.IHExtracClick(Sender: TObject);
var
  F : TFRepDetalleSemenAnimal;
begin
  inherited;
  F := TFRepDetalleSemenAnimal.Create(self);
  F.id_animal := id_animal;
  F.ShowModal;
  F.Destroy;
end;

procedure TFREPFichaAnimal.Button1Click(Sender: TObject);
begin
  inherited;
  MasEventos := not MasEventos;
  IMasEventos.Visible := not MasEventos;
  LMasEventos.Visible := not MasEventos;
  LMenosEventos.Visible := MasEventos;
  IMenosEventos.Visible := MasEventos;
  if not MasEventos then
    ActualizarEventos20(id_animal)
  else
    ActualizarEventos(id_animal);
end;

procedure TFREPFichaAnimal.AEveCambioCategoriaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoIndividual(TFEveCambioCategoria.Create(self));
end;

procedure TFREPFichaAnimal.EADatoDepChange(Sender: TObject);
begin
  inherited;
  //showmessage ('cambio');
  //if(not IGuardar.Visible)then
    HabilitarBotones(true);    // Ivan: Si descomento funciona mal la logica de los botones Guardar y cancelar.
end;

end.



