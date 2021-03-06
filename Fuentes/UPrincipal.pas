unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Menus, DB, IBDatabase, ComCtrls, ExtCtrls,
  UUniversal, UABMSimple, StdCtrls, UEveUniversal, UEveSimple,
  Buttons, UButtonABM, UModificacionParametros, jpeg, ToolWin,
  ActnMan, ActnCtrls, ImgList, DateUtils, Types,
  StdStyleActnCtrls, ActnMenus, HtmlHlp, IniFiles, IBCustomDataSet,
  IBStoredProc, Rockey4ND, DataExport, DataToXLS, WinXP, ToolPanels,
  dxNavBarCollns, dxNavBarStyles, dxNavBarBase, dxNavBar, dxDockControl,
  dxDockPanel, dxsbar, dxBar, cxLookAndFeels, AdvFontCombo, IBTable,
  IBQuery, MPlayer, AppEvnts, JvExControls
, JvButton, JvTransparentButton,
  IBDatabaseInfo, IBExtract, IBEvents, IBSQLMonitor, UThreadBckBase, URepRankinsDeps,
  VaClasses, VaComm, dxBarExtItems, JvBaseDlg, JvDesktopAlert, IBServices,
  xmldom, XMLIntf, msxmldom, XMLDoc, JvNavigationPane, JvLabel, JvXPCore,
   dximctrl, Shlobj, ActiveX, ComObj, ULectorElectronico, ULectorAllFlexSerie, ULectorShearWellData,
  JvExExtCtrls,  PngImage, JvGIF, PngImageList, OleCtrls,
  AcroPDFLib_TLB, Ayuda3, JvComponentBase, JvBalloonHint , uTiposGlobales,
  JvImage,UMensajeGuardarVincular, UVisorCaravanasUHRfid;


type
  TFPrincipal = class(TFUniversal)
    ARepEstadoServicio: TAction;
    AGenFichaAnimal: TAction;
    AEveAltaMasiva: TAction;
    ARepAltaDirecta: TAction;
    ARepStockSimple: TAction;
    ARepDenunciaServicio: TAction;
    AAbmGrupos: TAction;
    AGenParametros: TAction;
    AGenAlarmas: TAction;
    AEveAltaSemen: TAction;
    AEveExtraccionSemen: TAction;
    ARepPorcentajePrenez: TAction;
    ARepNoTactadas: TAction;
    AAbmCausasDistocia: TAction;
    AAbmCentrosInseminacion: TAction;
    AAbmEnfermedades: TAction;
    AAbmExamenesFertilidad: TAction;
    AAbmGradosAsistencia: TAction;
    AAbmMetodosCastracion: TAction;
    AAbmMetodosDiagnostico: TAction;
    AAbmMetodosExamenSanitario: TAction;
    AAbmMetodosSincronizacion: TAction;
    AAbmMetodosTomaPrueba: TAction;
    AAbmRechazosPreservicio: TAction;
    AAbmSexos: TAction;
    AAbmTecnicasTratamiento: TAction;
    AAbmTiposAborto: TAction;
    AAbmTiposBaja: TAction;
    AAbmTiposDestete: TAction;
    AAbmServicios : TAction;
    AAbmTiposEnfermedad: TAction;
    AAbmTiposParto: TAction;
    AAbmTiposTratamiento: TAction;
    AAbmValoresCapacidad: TAction;
    AEveBajaSemen: TAction;
    ARepListaTactadas: TAction;
    ARepDistribucionPrenez: TAction;
    ARepVsPrenez: TAction;
    AEveSangradoBrucelosis: TAction;
    AEveTuberculinizacion: TAction;
    AEveRaspadoToros: TAction;
    AEveReidentificacion: TAction;
    AGenPlanillasManga: TAction;
    AAbmUsuarios: TAction;
    AGenAsistenteEstablecimiento: TAction;
    ILMenuPrincipal: TImageList;
    AEveRecursoForrajero: TAction;
    ARepAptasNoAptas: TAction;
    ARepGananciaDiariaPeso: TAction;
    ARepStockSemen: TAction;
    AGenAyuda: TAction;
    AGenAcercaDe: TAction;
    AGenBackup: TAction;
    AGenRestaurar: TAction;
    ARepListadoEventos: TAction;
    AAbmEmpleados: TAction;
    ARepSospechosasAborto: TAction;
    ARepEvaluacionToros: TAction;
    ARepProyeccionPartos: TAction;
    ADOTri: TAction;
    AEveCargaBrucelosis: TAction;
    AEveCargaTuberculina: TAction;
    AEveCargaVenereas: TAction;
    TimerLlave: TTimer;
    ILMenuEmergente: TImageList;
    ADOCertificadoPredespacho: TAction;
    AREPExistenciaPorLote: TAction;
    AREPParteMensual: TAction;
    AREPInformePesadas: TAction;
    AREPDistGananciaDiariaPeso: TAction;
    AREPResumenParto: TAction;
    AABMPadresExternos: TAction;
    AABMModificarCUIG: TAction;
    AIntro: TAction;
    IBQVerAlarma: TIBQuery;
    AABMPropietarioHuella: TAction;
    ACalendario: TAction;
    TCheck: TTimer;
    AABMRecursosForrajeros: TAction;
    IBSPCambiarCategoria: TIBStoredProc;
    AConfigGrupos: TAction;
    IBSPFixEstadoActualAnimales: TIBStoredProc;
    IBQUpdateUsuario: TIBQuery;
    AABMDescTratamiento: TAction;
    AEvePartoMasivo: TAction;
    AEveNacimientos: TAction;
    AREPExistenciaRodeoPotrero: TAction;
    AREPResumenTratamiento: TAction;
    AREPInfoGralGest: TAction;
    AREPProduccionExternos: TAction;
    AEveEliminarAnimal: TAction;
    IBQFechas: TIBQuery;
    IBQInsertFix: TIBQuery;
    IBQConsultaFix: TIBQuery;
    AABMLaboratorios: TAction;
    AREPMovimientosExistencia: TAction;
    ARepCostosVete: TAction;
    AABMTiposEmpleados: TAction;
    AEveCalidadCarne: TAction;
    LEstab: TLabel;
    LEstabVal: TLabel;
    LProp: TLabel;
    LPropVal: TLabel;
    LtipoReg: TLabel;
    LTipoRegVal: TLabel;
    LTipoUsr: TLabel;
    LTipoUsrVal: TLabel;
    LUsrVal: TLabel;
    LUsr: TLabel;
    ARepInfoMortandad: TAction;
    IBSPFixCategoriasVacaEvento: TIBStoredProc;
    IBSPDesactivarTriggers: TIBStoredProc;
    IBSPActivarTriggers: TIBStoredProc;
    AREPProcreo: TAction;
    AREPRankinsDeps: TAction;
    AREPProduccionCarne: TAction;
    AEveActividad: TAction;
    AABMActividad: TAction;
    IBSPParamEstablecimientoFecha: TIBStoredProc;
    AABMSuplementacion: TAction;
    AEveSuplementacion: TAction;
    AREPCostoSuplementacion: TAction;
    AABMOrigen: TAction;
    AABMDestino: TAction;
    AABMPropietarioAnimal: TAction;
    AABMCriador: TAction;
    AEveFlushing: TAction;
    AABMReservasForrajeras: TAction;
    AABMPotrerosTratamientos: TAction;
    IBSPFixPotrerosHectareas: TIBStoredProc;
    AABMDescMetodoSinc: TAction;
    ARepListadoAnimalesExternos: TAction;
    ARepInseminaciones: TAction;
    VaComm1: TVaComm;
    AImpDeps: TAction;
    AExpDeps: TAction;
    AEveTransferenciaEmbrionaria: TAction;
    AABMCentrosTransplantes: TAction;
    AABMDificultadTransferencia: TAction;
    AABMUbicacionTransferencia: TAction;
    AABMUteroTransferencia: TAction;
    AABMCalidadEmbrion: TAction;
    AABMEstadioEmbrion: TAction;
    AABMDestinoEmbrion: TAction;
    AABMDestDescEmbrion: TAction;
    AEveCompraEmbriones: TAction;
    AEveBajaEmbriones: TAction;
    ARepListadoImplantes: TAction;
    ARepListadoReceptoras: TAction;
    ARepEmbrionesTransferidos: TAction;
    ARepStockEmbriones: TAction;
    AppEventPrincipal: TApplicationEvents;
    AREPInfoDonantes: TAction;
    ADOCertificadoRecupEmbriones: TAction;
    JvDAActualizacion: TJvDesktopAlert;
    TimerActualizador: TTimer;
    IBSPFixVisiblePotreroRodeo: TIBStoredProc;
    IBBackupService1: TIBBackupService;
    IBRestoreService1: TIBRestoreService;
    TimerRegistroLicencia: TTimer;
    IBSPTiposSuplementaciones: TIBStoredProc;
    IBSPFIXCasosDiagGest: TIBStoredProc;
    IBSPFixEstadoLactaVacas: TIBStoredProc;
    IBSPDelGruposVacios: TIBStoredProc;
    TCheckActualizador: TTimer;
    BitBtn6: TBitBtn;
    ADOSRADenunciaNacimientos: TAction;
    LTipoVersionLicenciaImagenesPrincip: TLabel;
    AEveEliminarEvento: TAction;
    AListadoEmbriones: TAction;
    AABMFuentesDEPs: TAction;
    ImageList1: TImageList;
    AEveImportarPartosNacimientos: TAction;
    AABMSubCategorias: TAction;
    AABMCodigosManejo: TAction;
    ARepDenunciaBaja: TAction;
    ADOSRATipiSangADN: TAction;
    AAccesoDirecto: TAction;
    AImpERA: TAction;
    AMasUsados: TAction;
    IBEError: TIBEvents;
    IBQSetEjecuciones: TIBQuery;
    Timer1: TTimer;
    IBQAnimales: TIBQuery;
    IBQEstablecimientos: TIBQuery;
    AABMInspeccion: TAction;
    AABMDestCabania: TAction;
    IBQIdioma: TIBQuery;
    AREPMultiEsta: TAction;
    Ptop: TPanel;
    ILogoHuella: TImage;
    JvIBotonBuscar: TJvImage;
    EBusqueda: TEdit;
    PClient: TPanel;
    JvAnimales3N: TJvImage;
    JvIEventos3N: TJvImage;
    JvIReportes3N: TJvImage;
    JvIConfig3N: TJvImage;
    JvIHerramientas3N: TJvImage;
    JvFondo3N: TJvImage;
    JvVolver: TJvImage;
    IFondo3N: TImage;
    ITope3N: TImage;
    PReportes: TPanel;
    IFondoReportes: TImage;
    JvFolRServicios: TJvImage;
    JvFolRTransferencia: TJvImage;
    JvFolRGenericos: TJvImage;
    JvFolROficial: TJvImage;
    JvFolRSanitarios: TJvImage;
    JvFolRProduccion: TJvImage;
    JvFolRPartos: TJvImage;
    JvFolRGestacion: TJvImage;
    JvFolRGral: TJvImage;
    JvRSanitarios: TJvImage;
    JvROficial: TJvImage;
    JvRGenericos: TJvImage;
    JvRTransferencia: TJvImage;
    JvRServicios: TJvImage;
    JvRProduccion: TJvImage;
    JvRPartos: TJvImage;
    JvRGestacion: TJvImage;
    JvRGral: TJvImage;
    PHerramientas: TPanel;
    IFondoHerramientas: TImage;
    JvFolHojasManga: TJvImage;
    JvHojasManga: TJvImage;
    JvFolCalendarios: TJvImage;
    JvCalendarios: TJvImage;
    JvFolBackup: TJvImage;
    JvBackup: TJvImage;
    JvFolActualizar: TJvImage;
    JvActualizar: TJvImage;
    JvFolMovil: TJvImage;
    JvFolRestaurar: TJvImage;
    JvRestaurar: TJvImage;
    JvMovil: TJvImage;
    PEventos: TPanel;
    IFondoEventos: TImage;
    JvFolECria: TJvImage;
    JvFolEEstab: TJvImage;
    JvFolEGral: TJvImage;
    JvFolEGestacion: TJvImage;
    JvFolESanitarios: TJvImage;
    JvFolEServicios: TJvImage;
    JvFolETransferencia: TJvImage;
    JvFolEEliminar: TJvImage;
    JvECria: TJvImage;
    JvEEstab: TJvImage;
    JvEGral: TJvImage;
    JvEGestacion: TJvImage;
    JvESanitarios: TJvImage;
    JvEServicios: TJvImage;
    JvETransferencia: TJvImage;
    JvEEliminar: TJvImage;
    JvFolEPartos: TJvImage;
    JvEPartos: TJvImage;
    PAnimales: TPanel;
    IFondoAnimales: TImage;
    JvFolSelector: TJvImage;
    JvFolMovimiento: TJvImage;
    JvFolGrupos: TJvImage;
    JvFolSemen: TJvImage;
    JvFolEmbriones: TJvImage;
    JvFolDEPS: TJvImage;
    JvFolExternos: TJvImage;
    JvFolEliminar: TJvImage;
    JvSelector: TJvImage;
    JvMovimiento: TJvImage;
    JvGrupos: TJvImage;
    JvSemen: TJvImage;
    JvEmbriones: TJvImage;
    JvDEPS: TJvImage;
    JvExternos: TJvImage;
    JvEliminar: TJvImage;
    PConfig: TPanel;
    IFondoConfig: TImage;
    JvFolParametros: TJvImage;
    JvFolCEstablecimiento: TJvImage;
    JvFolGruposVisibles: TJvImage;
    JvFolPropietario: TJvImage;
    JvFolUsuarios: TJvImage;
    JvFolCambioEsta: TJvImage;
    JvFolCambioUsuario: TJvImage;
    JvParametros: TJvImage;
    JvCEstablecimiento: TJvImage;
    JvGruposVisibles: TJvImage;
    JvPropietario: TJvImage;
    JvUsuarios: TJvImage;
    JvCambioEsta: TJvImage;
    JvCambioUsuario: TJvImage;
    PLeft: TPanel;
    IBarraIzq: TImage;
    PRight: TPanel;
    IBarraDer: TImage;
    ACargarMovil: TAction;
    LLabel: TLabel;
    PAyuda: TPanel;
    PBusqueda: TPanel;
    Panel1: TPanel;
    Image15: TImage;
    IBusquedaPan: TImage;
    LBusquedaPan: TLabel;
    PCliBusqueda: TPanel;
    SBBusqueda: TScrollBox;
    IFondoBusqueda: TImage;
    IFonodB1: TImage;
    IFondoB2: TImage;
    IBAnimales: TImage;
    IBConfig: TImage;
    IBEventos: TImage;
    IBHerramientas: TImage;
    IBReportes: TImage;
    PBienvenida: TPanel;
    IBienvenida: TImage;
    IBQBusquedaAnimal: TIBQuery;
    ISelector: TImage;
    ACalendarioGral: TAction;
    ACalendarioSani: TAction;
    ACalendarioRepro: TAction;
    AActualizador: TAction;
    IFondo3NAnimales: TImage;
    IFondo3NEventos: TImage;
    IFondo3NReportes: TImage;
    IFondo3NHerramientas: TImage;
    IFondo3NConfiguracion: TImage;
    LVersionHuella: TJvLabel;
    INotFound: TImage;
    LEstabActual: TLabel;
    JvCaravanaElect: TJvImage;
    JvFolCaravanaElect: TJvImage;
    AConfigElectronico: TAction;
    JvIDis3N: TJvImage;
    IBDis: TImage;
    Button1: TButton;
    Button2: TButton;
    AGenSeleccionUsuario: TAction;
    AGenSincro: TAction;
    AMapaEstab: TAction;
    AABMDatosSiembra: TAction;
    AIndicesProductivos: TAction;
    PngImageList1: TPngImageList;
    IBQSetVisibilidadAnimExt: TIBQuery;
    IBQListaAnimales: TIBQuery;
    IBSPAgregarColor: TIBStoredProc;
    TimerLector: TTimer;
    JvFolRSRA: TJvImage;
    JvRSRA: TJvImage;
    ASRANacimientosTransfer: TAction;
    JvFolElectronico: TJvImage;
    AControlAnimales: TAction;
    IBSPFixMap: TIBStoredProc;
    PMiHuella: TPanel;
    IFondoMiHuella: TImage;
    PILDragDrop: TPngImageList;
    JvIMiHuella3N: TJvImage;
    AConfiguracionFenotipos: TAction;
    ACargaFenotipos: TAction;
    ARepDenunciaBajas: TAction;
    ARepFlushing: TAction;
    ARepImplantes: TAction;
    ARepInspeccion: TAction;
    ARepNacimientos: TAction;
    ARepServicios: TAction;
    ARepTransferencia: TAction;
    ARepVientresAEmpadronar: TAction;
    ARepListadoDeAnimalesConFenotipos: TAction;
    IBQRazaPredEstablecimiento: TIBQuery;
    JvFolFenotipos: TJvImage;
    JvFenotipos: TJvImage;
    JvFolDocAsociaciones: TJvImage;
    JvDocAsociaciones: TJvImage;
    JvFolConfigFenotipos: TJvImage;
    JvConfigFenotipos: TJvImage;
    IBSPFixParametrosFenotipos: TIBStoredProc;
    AREPResumenMovimiento: TAction;
    IBSPFixSubCatBrangus: TIBStoredProc;
    IBSPFixRazaBrangusAnim: TIBStoredProc;
    ARepMovimientoSemen: TAction;
    APartidasSemenAprobar: TAction;
    ARepListadoExtracciones: TAction;
    Iconos3NGx127: TPngImageList;
    Iconos3NCGx88: TPngImageList;
    Iconos3Nx115: TPngImageList;
    Iconos3NCx80: TPngImageList;
    IBQUpdateStockSemen: TIBQuery;
    IBubble: TImage;
    AHuellaVet: TAction;
    IBubbleProd: TImage;
    ISeleccionarRazaPredom: TImage;
    ACesionEmbrionesTercerosBrangus: TAction;
    ATransferenciaBrangus: TAction;
    AInspeccionBrangus: TAction;
    ANacimientosBrangus: TAction;
    AServiciosBrangus: TAction;
    Button3: TButton;
    ARazaPredom: TAction;
    IBQListaAnimalesID_ANIMAL: TIntegerField;
    IBQListaAnimalesRP: TIBStringField;
    IBQListaAnimalesHBA: TIBStringField;
    IBQListaAnimalesID_RAZA: TIntegerField;
    IBQListaAnimalesSENASA: TIBStringField;
    IBQListaAnimalesFECHA_NAC: TDateField;
    IBQListaAnimalesCATEGORIA: TIBStringField;
    IBQListaAnimalesSUBCATEGO: TIntegerField;
    IBQListaAnimalesESTADOACT: TIBStringField;
    IBQListaAnimalesRAZA: TIBStringField;
    IBQListaAnimalesACTIVO: TIBStringField;
    IBQListaAnimalesCODRAZA: TIBStringField;
    IBQListaAnimalesPESO: TFloatField;
    IBQListaAnimalesIE: TIBStringField;
    IBQListaAnimalesNOMBRE: TIBStringField;
    IBQListaAnimalesAPODO: TIBStringField;
    IBQListaAnimalesPESONACER: TFloatField;
    IBQListaAnimalesTS: TIBStringField;
    IBQListaAnimalesADN: TIBStringField;
    IBQListaAnimalesPADREI: TIntegerField;
    IBQListaAnimalesPADREE: TIntegerField;
    IBQListaAnimalesMBE: TIntegerField;
    IBQListaAnimalesMBI: TIntegerField;
    IBQListaAnimalesCOLOR: TIBStringField;
    IBQListaAnimalesNOMSUBCAT: TIBStringField;
    IBQListaAnimalesCODSUBCAT: TIBStringField;
    IBQListaAnimalesSEXO: TIntegerField;
    IBQListaAnimalesNOM_SEX: TIBStringField;
    IBQListaAnimalesRP_AUX: TStringField;
    IBSPFixParametrosTerceros: TIBStoredProc;
    JvFolParametrosEsta: TJvImage;
    JvParametrosEsta: TJvImage;
    JvFolCreaEstab: TJvImage;
    JvCreaEstab: TJvImage;
    ARepCierreLote: TAction;
    IBSPFixStockSemen: TIBStoredProc;
    IBSPFixCategBaja: TIBStoredProc;
    AABMTipoCategoria: TAction;
    IBQCategorias: TIBQuery;
    IBQTipoCateg: TIBQuery;
    IBQInsertAuxCategorias: TIBQuery;
    IBQBorrarAuxCat: TIBQuery;
    AEveCambioCategoria: TAction;
    IFondoPtop: TImage;
    IFondoPestanias: TImage;
    JvAnimales: TJvImage;
    JvEventos: TJvImage;
    JvReportes: TJvImage;
    JvHerramientas: TJvImage;
    JvConfig: TJvImage;
    JvMiHuella: TJvImage;
    JvBarraBuscarAyuda: TJvImage;
    JvIContenedor: TJvImage;
    JvIBaseContenedor: TJvImage;
    JvIContable: TJvImage;
    JvISimulador: TJvImage;
    JvIMapa: TJvImage;
    JvImage1: TJvImage;
    JvImage2: TJvImage;
    JvImage3: TJvImage;
    JvImage4: TJvImage;
    JvImage5: TJvImage;
    JvImage6: TJvImage;
    JvIAnimalesA: TJvImage;
    JvIEventosA: TJvImage;
    JvIReportesA: TJvImage;
    JvIConfigA: TJvImage;
    JvIHerramientasA: TJvImage;
    JvIMiHuellaA: TJvImage;
    JvIBotAyuda: TJvImage;
    LAyuda: TLabel;
    JvISalir: TJvImage;
    LSalir: TLabel;
    JvIVolverPast: TJvImage;
    JvIVolver: TJvImage;
    LVolver: TLabel;
    JvIContenedor2: TJvImage;
    JvIContenedor3: TJvImage;
    PAyudaInicial: TPanel;
    IFondoAyudaInicial: TImage;
    JvIBurbujaAyudaInicial: TJvImage;
    JvIFondoOpcion1: TJvImage;
    JvIFondoOpcion2: TJvImage;
    JvIFondoOpcion3: TJvImage;
    JvIBotonOpcion1: TJvImage;
    JvIBotonOpcion2: TJvImage;
    JvIBotonOpcion3: TJvImage;
    JvIBotOpcion1: TJvImage;
    JvIBotOpcion2: TJvImage;
    JvIBotOpcion3: TJvImage;
    LTituloOpcion1: TLabel;
    LTituloOpcion2: TLabel;
    LTituloOpcion3: TLabel;
    JvIMiHuella5: TJvImage;
    JvIMiHuella4: TJvImage;
    JvIMiHuella3: TJvImage;
    JvIMiHuella2: TJvImage;
    JvIMiHuella1: TJvImage;
    JvIFondoAIMiHuella: TJvImage;
    JvIFondoConfigMiHuella: TJvImage;
    JvIFondoFavoritosMiHuella: TJvImage;
    LAiTitulo: TLabel;
    LConfigTitulo: TLabel;
    LFrecuentesTitulos: TLabel;
    JvIAIBot1: TJvImage;
    JvIAIBot2: TJvImage;
    JvIAIBot3: TJvImage;
    JvIConfigBot1: TJvImage;
    JvIConfigBot2: TJvImage;
    JvIConfigBot3: TJvImage;
    JvIConfigBot4: TJvImage;
    JvIVolverAyudaInic: TJvImage;
    JvIFavorBot1: TJvImage;
    JvIFavorBot2: TJvImage;
    JvIFavorBot3: TJvImage;
    JvIFavorBot4: TJvImage;
    JvIFavorBot5: TJvImage;
    JvIFavorBot6: TJvImage;
    LEtiquetaPestaniaActual: TLabel;
    LEtiquetaPestaniaAnterior: TLabel;
    JvIFondoEstablecimiento: TJvImage;
    IFondoAyuda: TImage;
    ILogoMarcaAgua: TJvImage;
    PAInicioMapa: TPanelAyudaHuella3;
    JvImage7: TJvImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    JvImage8: TJvImage;
    CheckBox1: TCheckBox;
    PAInicioCMP: TPanelAyudaHuella3;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    JvImage10: TJvImage;
    Label29: TLabel;
    JvImage9: TJvImage;
    CheckBox5: TCheckBox;
    PAInicioCargaM: TPanelAyudaHuella3;
    JvImage11: TJvImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    JvImage12: TJvImage;
    Label9: TLabel;
    CheckBox3: TCheckBox;
    PACargaMP: TPanelAyudaHuella3;
    JvImage13: TJvImage;
    Label31: TLabel;
    Label32: TLabel;
    JvImage14: TJvImage;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    CheckBox6: TCheckBox;
    PACargaM: TPanelAyudaHuella3;
    JvImage15: TJvImage;
    Label18: TLabel;
    Label19: TLabel;
    JvImage16: TJvImage;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    CheckBox4: TCheckBox;
    PAAnimales: TPanelAyudaHuella3;
    JvImage17: TJvImage;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    JvImage18: TJvImage;
    CheckBox7: TCheckBox;
    IBottomHint: TJvImage;
    ICenterHint: TJvImage;
    ITopHint: TJvImage;
    LFavorBot1C: TLabel;
    LFavorBot2C: TLabel;
    LFavorBot3C: TLabel;
    LFavorBot4C: TLabel;
    LFavorBot5C: TLabel;
    LFavorBot6C: TLabel;
    LAIMapa: TLabel;
    LAICM: TLabel;
    LAICMP: TLabel;
    LConfPropietario: TLabel;
    LConfUsuarios: TLabel;
    LconfCambioUsr: TLabel;
    LconfCambioEsta: TLabel;
    LFavor1: TLabel;
    LFavor2: TLabel;
    LFavor3: TLabel;
    LFavor4: TLabel;
    LFavor5: TLabel;
    LFavor6: TLabel;
    L1Op1: TLabel;
    L2Op1: TLabel;
    L3Op1: TLabel;
    L4Op1: TLabel;
    L41Op1: TLabel;
    L5Op1: TLabel;
    L6Op1: TLabel;
    L7Op1: TLabel;
    L8Op1: TLabel;
    L9Op1: TLabel;
    L10Op1: TLabel;
    L10Op2: TLabel;
    L9Op2: TLabel;
    L8Op2: TLabel;
    L7Op2: TLabel;
    L6Op2: TLabel;
    L5Op2: TLabel;
    L4Op2: TLabel;
    L3Op2: TLabel;
    L2Op2: TLabel;
    L1Op2: TLabel;
    L41Op2: TLabel;
    L10Op3: TLabel;
    L9Op3: TLabel;
    L8Op3: TLabel;
    L7Op3: TLabel;
    L6Op3: TLabel;
    L5Op3: TLabel;
    L4Op3: TLabel;
    L3Op3: TLabel;
    L2Op3: TLabel;
    L1Op3: TLabel;
    L51Op3: TLabel;
    L31Op2: TLabel;
    L42Op2: TLabel;
    L61Op3: TLabel;
    ASimulInv: TAction;
    JvIActualiza: TJvImage;
    JvBHint: TJvBalloonHint;
    JvIAyudaSkype: TJvImage;
    JvIAyudaMail: TJvImage;
    JvIAyudaTelefono: TJvImage;
    JvIAyudaMsn: TJvImage;
    JvIFondoSkype: TJvImage;
    JvIFondoMail: TJvImage;
    JvIFondoMsn: TJvImage;
    JvIFondoTelefono: TJvImage;
    LTituloAyuda: TLabel;
    LSkype: TLabel;
    LMail: TLabel;
    LTelefono: TLabel;
    LMsn: TLabel;
    LSkype1: TLabel;
    LSkype2: TLabel;
    LSkype11: TLabel;
    LSkype3: TLabel;
    LSkype4: TLabel;
    LSkype7: TLabel;
    LSkype6: TLabel;
    LSkype5: TLabel;
    LMail7: TLabel;
    LMail6: TLabel;
    LMail5: TLabel;
    LMail4: TLabel;
    LMail3: TLabel;
    LMail2: TLabel;
    LMail1: TLabel;
    LMail1a: TLabel;
    LMail8: TLabel;
    LMail9: TLabel;
    LTel1: TLabel;
    LTel2: TLabel;
    LTel1a: TLabel;
    LTel3: TLabel;
    LTel4: TLabel;
    LTel5: TLabel;
    LTel6: TLabel;
    LTel7: TLabel;
    LMsn4: TLabel;
    LMsn3: TLabel;
    LMsn2: TLabel;
    LMsn1: TLabel;
    LMsn1a: TLabel;
    JvFolDEPS60: TJvImage;
    JvFolDEPS84: TJvImage;
    JvFolDEPSFondo: TJvImage;
    JvFolElectronico60: TJvImage;
    JvFolElectronico84: TJvImage;
    JvFolElectronicoFondo: TJvImage;
    JvFolEliminar60: TJvImage;
    JvFolEliminar84: TJvImage;
    JvFolEliminarFondo: TJvImage;
    JvFolEmbriones60: TJvImage;
    JvFolEmbriones84: TJvImage;
    JvFolEmbrionesFondo: TJvImage;
    JvFolExternos60: TJvImage;
    JvFolExternos84: TJvImage;
    JvFolExternosFondo: TJvImage;
    JvFolFenotipos60: TJvImage;
    JvFolFenotipos84: TJvImage;
    JvFolFenotiposFondo: TJvImage;
    JvFolGrupos60: TJvImage;
    JvFolGrupos84: TJvImage;
    JvFolGruposFondo: TJvImage;
    JvFolMovimiento60: TJvImage;
    JvFolMovimiento84: TJvImage;
    JvFolMovimientoFondo: TJvImage;
    JvFolSelector60: TJvImage;
    JvFolSelector84: TJvImage;
    JvFolSelectorFondo: TJvImage;
    JvFolSemen60: TJvImage;
    JvFolSemen84: TJvImage;
    JvFolSemenFondo: TJvImage;
    JvFolCambioEsta60: TJvImage;
    JvFolCambioEsta84: TJvImage;
    JvFolCambioEstaFondo: TJvImage;
    JvFolCambioUsuario60: TJvImage;
    JvFolCambioUsuario84: TJvImage;
    JvFolCambioUsuarioFondo: TJvImage;
    JvFolCEstablecimiento60: TJvImage;
    JvFolCEstablecimiento84: TJvImage;
    JvFolCEstablecimientoFondo: TJvImage;
    JvFolConfigFenotipos60: TJvImage;
    JvFolConfigFenotipos84: TJvImage;
    JvFolConfigFenotiposFondo: TJvImage;
    JvFolCreaEstab60: TJvImage;
    JvFolCreaEstab84: TJvImage;
    JvFolCreaEstabFondo: TJvImage;
    JvFolGruposVisibles60: TJvImage;
    JvFolGruposVisibles84: TJvImage;
    JvFolGruposVisiblesFondo: TJvImage;
    JvFolParametros60: TJvImage;
    JvFolParametros84: TJvImage;
    JvFolParametrosFondo: TJvImage;
    JvFolPropietario60: TJvImage;
    JvFolPropietario84: TJvImage;
    JvFolPropietarioFondo: TJvImage;
    JvFolUsuarios60: TJvImage;
    JvFolUsuarios84: TJvImage;
    JvFolUsuariosFondo: TJvImage;
    JvFolParametrosEsta60: TJvImage;
    JvFolParametrosEsta84: TJvImage;
    JvFolParametrosEstaFondo: TJvImage;
    JvFolECria60: TJvImage;
    JvFolECria84: TJvImage;
    JvFolECriaFondo: TJvImage;
    JvFolEEliminar60: TJvImage;
    JvFolEEliminar84: TJvImage;
    JvFolEEliminarFondo: TJvImage;
    JvFolEEstab60: TJvImage;
    JvFolEEstab84: TJvImage;
    JvFolEEstabFondo: TJvImage;
    JvFolEGestacion60: TJvImage;
    JvFolEGestacion84: TJvImage;
    JvFolEGestacionFondo: TJvImage;
    JvFolEGral60: TJvImage;
    JvFolEGral84: TJvImage;
    JvFolEGralFondo: TJvImage;
    JvFolEPartos60: TJvImage;
    JvFolEPartos84: TJvImage;
    JvFolEPartosFondo: TJvImage;
    JvFolESanitarios60: TJvImage;
    JvFolESanitarios84: TJvImage;
    JvFolESanitariosFondo: TJvImage;
    JvFolEServicios60: TJvImage;
    JvFolEServicios84: TJvImage;
    JvFolEServiciosFondo: TJvImage;
    JvFolETransferencia60: TJvImage;
    JvFolETransferencia84: TJvImage;
    JvFolETransferenciaFondo: TJvImage;
    JvFolActualizar60: TJvImage;
    JvFolActualizar84: TJvImage;
    JvFolActualizarFondo: TJvImage;
    JvFolBackup60: TJvImage;
    JvFolBackup84: TJvImage;
    JvFolBackupFondo: TJvImage;
    JvFolCalendarios60: TJvImage;
    JvFolCalendarios84: TJvImage;
    JvFolCalendariosFondo: TJvImage;
    JvFolCaravanaElect60: TJvImage;
    JvFolCaravanaElect84: TJvImage;
    JvFolCaravanaElectFondo: TJvImage;
    JvFolHojasManga60: TJvImage;
    JvFolHojasManga84: TJvImage;
    JvFolHojasMangaFondo: TJvImage;
    JvFolMovil60: TJvImage;
    JvFolMovil84: TJvImage;
    JvFolMovilFondo: TJvImage;
    JvFolRestaurar60: TJvImage;
    JvFolRestaurar84: TJvImage;
    JvFolRestaurarFondo: TJvImage;
    JvFolDocAsociaciones60: TJvImage;
    JvFolDocAsociaciones84: TJvImage;
    JvFolDocAsociacionesFondo: TJvImage;
    JvFolRGenericos60: TJvImage;
    JvFolRGenericos84: TJvImage;
    JvFolRGenericosFondo: TJvImage;
    JvFolRGestacion60: TJvImage;
    JvFolRGestacion84: TJvImage;
    JvFolRGestacionFondo: TJvImage;
    JvFolRGral60: TJvImage;
    JvFolRGral84: TJvImage;
    JvFolRGralFondo: TJvImage;
    JvFolROficial60: TJvImage;
    JvFolROficial84: TJvImage;
    JvFolROficialFondo: TJvImage;
    JvFolRPartos60: TJvImage;
    JvFolRPartos84: TJvImage;
    JvFolRPartosFondo: TJvImage;
    JvFolRProduccion60: TJvImage;
    JvFolRProduccion84: TJvImage;
    JvFolRProduccionFondo: TJvImage;
    JvFolRSanitarios60: TJvImage;
    JvFolRSanitarios84: TJvImage;
    JvFolRSanitariosFondo: TJvImage;
    JvFolRServicios60: TJvImage;
    JvFolRServicios84: TJvImage;
    JvFolRServiciosFondo: TJvImage;
    JvFolRSRA60: TJvImage;
    JvFolRSRA84: TJvImage;
    JvFolRSRAFondo: TJvImage;
    JvFolRTransferencia60: TJvImage;
    JvFolRTransferencia84: TJvImage;
    JvFolRTransferenciaFondo: TJvImage;
    ARepListadosPersonalizados: TAction;
    TimagenActualizador: TTimer;
    Label1: TLabel;
    JvFolRAlimentacion: TJvImage;
    JvFolRAlimentacion60: TJvImage;
    JvFolRAlimentacion84: TJvImage;
    JvFolRAlimentacionFondo: TJvImage;
    JvRAlimentacion: TJvImage;
    JvFolEAlimentacion: TJvImage;
    JvFolEAlimentacion60: TJvImage;
    JvFolEAlimentacion84: TJvImage;
    JvFolEAlimentacionFondo: TJvImage;
    JvEAlimentacion: TJvImage;
    AEveAltaAlimentacion: TAction;
    AEveBajaAlimentacion: TAction;
    AEveStockAlimentacion: TAction;
    ARepMovimientosAlimentos: TAction;
    ARepHojaDeCampo: TAction;
    PEducacionContinua: TPanel;
    IFondoEducacionContinua: TImage;
    JvIDiagnostico: TJvImage;
    LDGEC: TLabel;
    JvIDiagnosticoRep: TJvImage;
    LDGREC: TLabel;
    LHojaMangaEC: TLabel;
    JvIHojaMangaEC: TJvImage;
    AEveEvalClinicaToros: TAction;
    Shape1: TShape;
    mainPNGList: TPngImageList;
    IBSFix: TIBStoredProc;
    IBQEstabAniExterno: TIBQuery;
    IBQListaAnimalesINFORMADO_AFIP: TIBStringField;
    // Inicio Ana Laura se agregan funciones para los botones agregados en los reportes de Senasa
    ADODocTransitoElectronico: TAction;
    ADOResumenMovimientos: TAction;
    AEveDeclaracionAFIP: TAction;
    PSifta: TPanel;
    IFondoSifta: TImage;
    JvIMovimientos: TJvImage;
    JvIHerramientas: TJvImage;
    JvIReportes: TJvImage;
    LMovimientos: TLabel;
    LHerramientas: TLabel;
    LReportes: TLabel;
    JvICargaIndividual: TJvImage;
    JvIBaja: TJvImage;
    JvIConfElectro: TJvImage;
    JvICargaMovil: TJvImage;
    JvIBackup: TJvImage;
    JvImage29: TJvImage;
    JvITRI: TJvImage;
    JvIDTE: TJvImage;
    JvISelector: TJvImage;
    JvIResMovimientos: TJvImage;
    JvITratamientos: TJvImage;
    JvIPersonalizados: TJvImage;
    LCargaMasiva: TLabel;
    LCargaIndivi: TLabel;
    LBaja: TLabel;
    LConfElectro: TLabel;
    LCargaMovil: TLabel;
    LBackup: TLabel;
    LTRI: TLabel;
    LDTE: TLabel;
    LSelector: TLabel;
    LMoviemientos: TLabel;
    LResTratamientos: TLabel;
    LPersonalizados: TLabel;
    LAltaAfip: TLabel;
    JvIAltaAfip: TJvImage;
    JvICargaMasiva: TJvImage;
    Label42: TLabel;
    LCambEstab: TLabel;
    JvICambiarEstab: TJvImage;
    IBQBusca: TIBQuery;
    BtnUHFRFID: TBitBtn;

    procedure ADODocTransitoElectronicoExecute(Sender: TObject);
    procedure ADOResumenMovimientosExecute(Sender: TObject);
    procedure AEveDeclaracionAFIPExecute(Sender: TObject);
    // FIN Ana Laura se agregan funciones para los botones agregados en los reportes de Senasa

    procedure LLinkAcrobatClic(Sender : TObject);
    procedure ARepEstadoServicioExecute(Sender: TObject);
    procedure ARepHistoriaAnimalExecute(Sender: TObject);
    procedure AGenFichaAnimalExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AEveAltaMasivaExecute(Sender: TObject);
    procedure ARepAltaDirectaExecute(Sender: TObject);
    procedure ARepStockSimpleExecute(Sender: TObject);
    procedure ARepDenunciaServicioExecute(Sender: TObject);
    procedure AAbmGruposExecute(Sender: TObject);
    procedure ActualizarEnCascada(Sender: TObject);
    procedure AGenAlarmasExecute(Sender: TObject);
    procedure AGenParametrosExecute(Sender: TObject);
    procedure AEveAltaSemenExecute(Sender: TObject);
    procedure AEveExtraccionSemenExecute(Sender: TObject);
    procedure ARepPorcentajePrenezExecute(Sender: TObject);
    procedure ARepNoTactadasExecute(Sender: TObject);
    procedure AAbmCausasDistociaExecute(Sender: TObject);
    procedure AAbmCentrosInseminacionExecute(Sender: TObject);
    procedure AAbmEnfermedadesExecute(Sender: TObject);
    procedure AAbmExamenesFertilidadExecute(Sender: TObject);
    procedure AAbmGradosAsistenciaExecute(Sender: TObject);
    procedure AAbmMetodosCastracionExecute(Sender: TObject);
    procedure AAbmMetodosDiagnosticoExecute(Sender: TObject);
    procedure AAbmMetodosExamenSanitarioExecute(Sender: TObject);
    procedure AAbmMetodosSincronizacionExecute(Sender: TObject);
    procedure AAbmMetodosTomaPruebaExecute(Sender: TObject);
    procedure AAbmRechazosPreservicioExecute(Sender: TObject);
    procedure AAbmSexosExecute(Sender: TObject);
    procedure AAbmTecnicasTratamientoExecute(Sender: TObject);
    procedure AAbmTiposAbortoExecute(Sender: TObject);
    procedure AAbmTiposBajaExecute(Sender: TObject);
    procedure AAbmTiposDesteteExecute(Sender: TObject);
    procedure AAbmTiposEnfermedadExecute(Sender: TObject);
    procedure AAbmTiposPartoExecute(Sender: TObject);
    procedure AAbmTiposTratamientoExecute(Sender: TObject);
    procedure AAbmValoresCapacidadExecute(Sender: TObject);
    procedure AEveBajaSemenExecute(Sender: TObject);
    procedure ARepListaTactadasExecute(Sender: TObject);
    procedure ARepDistribucionPrenezExecute(Sender: TObject);
    procedure ARepVsPrenezExecute(Sender: TObject);
    procedure AEveSangradoBrucelosisExecute(Sender: TObject);
    procedure AEveTuberculinizacionExecute(Sender: TObject);
    procedure AEveRaspadoTorosExecute(Sender: TObject);
    procedure AEveReidentificacionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AGenPlanillasMangaExecute(Sender: TObject);
    procedure AAbmUsuariosExecute(Sender: TObject);
    procedure AGenAsistenteEstablecimientoExecute(Sender: TObject);
    procedure AIndicesProductivosExecute(Sender: TObject);
    procedure AEveRecursoForrajeroExecute(Sender: TObject);
    procedure ARepAptasNoAptasExecute(Sender: TObject);
    procedure ARepGananciaDiariaPesoExecute(Sender: TObject);
    procedure ARepStockSemenExecute(Sender: TObject);
    procedure AGenAyudaExecute(Sender: TObject);
    procedure AGenAcercaDeExecute(Sender: TObject);
    procedure AGenBackupExecute(Sender: TObject);
    procedure AGenRestaurarExecute(Sender: TObject);
    procedure ARepListadoEventosExecute(Sender: TObject);
    procedure AAbmEmpleadosExecute(Sender: TObject);
    procedure ARepSospechosasAbortoExecute(Sender: TObject);
    procedure ARepEvaluacionTorosExecute(Sender: TObject);
    procedure ARepProyeccionPartosExecute(Sender: TObject);
    procedure ADOTriExecute(Sender: TObject);
    procedure AEveCargaBrucelosisExecute(Sender: TObject);
    procedure AEveCargaTuberculinaExecute(Sender: TObject);
    procedure AEveCargaVenereasExecute(Sender: TObject);
    function PuedeAcceder(accion : TAction) : boolean;
    procedure TimerLlaveTimer(Sender: TObject);
    procedure AchicarDockSite();
    procedure AgrandarDockSite();
    procedure AcomodarDockSite(Panel : TdxDockPanel ;var PanelOpen : boolean);
    procedure dxDSMenuHideControl(Sender: TdxDockSite;
      AControl: TdxCustomDockControl);
    procedure dxDSMenuShowControl(Sender: TdxDockSite;
      AControl: TdxCustomDockControl);
    procedure dxDPAnimalesAutoHideChanging(Sender: TdxCustomDockControl);
    procedure dxDPEventosAutoHideChanging(Sender: TdxCustomDockControl);
    procedure dxDPReportesAutoHideChanging(Sender: TdxCustomDockControl);
    procedure dxDPAnimalesCanResize(Sender: TdxCustomDockControl; NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure dxDPEventosCanResize(Sender: TdxCustomDockControl; NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure dxDPReportesCanResize(Sender: TdxCustomDockControl; NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ADOCertificadoPredespachoExecute(Sender: TObject);
    procedure AREPExistenciaPorLoteExecute(Sender: TObject);
    procedure AREPParteMensualExecute(Sender: TObject);
    procedure AREPInformePesadasExecute(Sender: TObject);
    procedure AREPDistGananciaDiariaPesoExecute(Sender: TObject);
    procedure AREPResumenPartoExecute(Sender: TObject);
    procedure AABMPadresExternosExecute(Sender: TObject);
    procedure AABMModificarCUIGExecute(Sender: TObject);
    procedure AIntroExecute(Sender: TObject);
    procedure IBQVerAlarmaBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure AABMPropietarioHuellaExecute(Sender: TObject);
    procedure ACalendarioExecute(Sender: TObject);
    procedure TCheckTimer(Sender: TObject);
    procedure AABMRecursosForrajerosExecute(Sender: TObject);
    procedure AConfigGruposExecute(Sender: TObject);
    procedure AABMDescTratamientoExecute(Sender: TObject);
    procedure AEvePartoMasivoExecute(Sender: TObject);
    procedure AEveNacimientosExecute(Sender: TObject);
    procedure AREPExistenciaRodeoPotreroExecute(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure AREPResumenTratamientoExecute(Sender: TObject);
    procedure AREPInfoGralGestExecute(Sender: TObject);
    procedure AREPProduccionExternosExecute(Sender: TObject);
    procedure AEveEliminarAnimalExecute(Sender: TObject);
    procedure AABMLaboratoriosExecute(Sender: TObject);
    procedure AREPMovimientosExistenciaExecute(Sender: TObject);
    procedure ARepCostosVeteExecute(Sender: TObject);
    procedure AABMTiposEmpleadosExecute(Sender: TObject);
    procedure AEveCalidadCarneExecute(Sender: TObject);
//    procedure BBCambioUsuarioClick(Sender: TObject);
    procedure ARepInfoMortandadExecute(Sender: TObject);
    procedure AREPProcreoExecute(Sender: TObject);
    procedure AREPRankinsDepsExecute(Sender: TObject);
    procedure AREPProduccionCarneExecute(Sender: TObject);
    procedure AEveActividadExecute(Sender: TObject);
    procedure AABMActividadExecute(Sender: TObject);
    procedure AABMSuplementacionExecute(Sender: TObject);
    procedure AEveSuplementacionExecute(Sender: TObject);
    procedure AREPCostoSuplementacionExecute(Sender: TObject);
    procedure AABMOrigenExecute(Sender: TObject);
    procedure AABMDestinoExecute(Sender: TObject);
    procedure AABMPropietarioAnimalExecute(Sender: TObject);
    procedure AABMCriadorExecute(Sender: TObject);
    procedure AEveFlushingExecute(Sender: TObject);
    procedure AABMReservasForrajerasExecute(Sender: TObject);
    procedure AABMPotrerosTratamientosExecute(Sender: TObject);
    procedure AABMDescMetodoSincExecute(Sender: TObject);
    procedure ARepListadoAnimalesExternosExecute(Sender: TObject);
    procedure ARepInseminacionesExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure AImpDepsExecute(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure AEveTransferenciaEmbrionariaExecute(Sender: TObject);
    procedure AABMCentrosTransplantesExecute(Sender: TObject);
    procedure AABMDificultadTransferenciaExecute(Sender: TObject);
    procedure AABMUbicacionTransferenciaExecute(Sender: TObject);
    procedure AABMUteroTransferenciaExecute(Sender: TObject);
    procedure AABMCalidadEmbrionExecute(Sender: TObject);
    procedure AABMEstadioEmbrionExecute(Sender: TObject);
    procedure AABMDestinoEmbrionExecute(Sender: TObject);
    procedure AABMDestDescEmbrionExecute(Sender: TObject);
    procedure AEveCompraEmbrionesExecute(Sender: TObject);
    procedure AEveBajaEmbrionesExecute(Sender: TObject);
    procedure ARepListadoImplantesExecute(Sender: TObject);
    procedure ARepListadoReceptorasExecute(Sender: TObject);
    procedure ARepEmbrionesTransferidosExecute(Sender: TObject);
    procedure ARepStockEmbrionesExecute(Sender: TObject);
    procedure AppEventPrincipalException(Sender: TObject; E: Exception);
    procedure AREPInfoDonantesExecute(Sender: TObject);
    procedure ADOCertificadoRecupEmbrionesExecute(Sender: TObject);
    procedure AExpDepsExecute(Sender: TObject);
    procedure TimerActualizadorTimer(Sender: TObject);
    procedure JvDAActualizacionMessageClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure TimerRegistroLicenciaTimer(Sender: TObject);
    procedure JvDAActualizacionCloseButtonClick(Sender: TObject);
    procedure JvDAActualizacionButtons0Click(Sender: TObject);

//**************************************

    procedure PMouseLeave(Sender: TObject);
    procedure MMPrincipalClickItem(Sender: TdxBarManager;
      ClickedItem: TdxBarItem);
    procedure AActualizadorExecute(Sender: TObject);
    procedure TCheckActualizadorTimer(Sender: TObject);
    procedure ADOSRADenunciaNacimientosExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure AEveEliminarEventoExecute(Sender: TObject);
    procedure AListadoEmbrionesExecute(Sender: TObject);
    procedure AABMFuentesDEPsExecute(Sender: TObject);
    procedure dxNVEventosLinkPress(Sender: TObject;
      ALink: TdxNavBarItemLink);
    procedure AEveImportarPartosNacimientosExecute(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure AABMSubCategoriasExecute(Sender: TObject);
    procedure AABMCodigosManejoExecute(Sender: TObject);
    procedure ARepDenunciaBajaExecute(Sender: TObject);
    procedure ADOSRATipiSangADNExecute(Sender: TObject);
    procedure AAccesoDirectoExecute(Sender: TObject);
    procedure AImpERAExecute(Sender: TObject);
    procedure AMasUsadosExecute(Sender: TObject);
    procedure AABMInspeccionExecute(Sender: TObject);
    procedure AABMDestCabaniaExecute(Sender: TObject);
    procedure AREPMultiEstaExecute(Sender: TObject);

    //****************************************

    procedure JvImageClick(Sender: TObject);
    procedure JvSalirClick(Sender: TObject);
    procedure CerrarVentana(Sender: TObject; var Action: TCloseAction);
    procedure MouseEnter(Sender: TObject);
    procedure MouseLeave(Sender: TObject);
    procedure Click(Sender: TObject);
    procedure LabelEnter(Sender: TObject);
    procedure LabelLeave(Sender: TObject);
    procedure ImageEnter(Sender: TObject);
    procedure ImageLeave(Sender: TObject);
    procedure ACargarMovilExecute(Sender: TObject);
    procedure JvFavoritosClick(Sender: TObject);
    procedure JvAyudaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
    procedure ClickFichaAnimal(Sender: TObject);
    procedure EBusquedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ACalendarioGralExecute(Sender: TObject);
    procedure ACalendarioSaniExecute(Sender: TObject);
    procedure ACalendarioReproExecute(Sender: TObject);
    procedure AConfigElectronicoExecute(Sender: TObject);
    procedure AGenSeleccionUsuarioExecute(Sender: TObject);
    procedure AGenSincroExecute(Sender: TObject);
    procedure JvIPanelControlClick(Sender: TObject);
    procedure AMapaEstabExecute(Sender: TObject);
    procedure IMapaClick(Sender: TObject);
    procedure AABMDatosSiembraExecute(Sender: TObject);
    procedure IIndicesProductivosClick(Sender: TObject);
    procedure TimerLectorTimer(Sender: TObject);
    procedure ASRANacimientosTransferExecute(Sender: TObject);
    procedure AControlAnimalesExecute(Sender: TObject);
    procedure JvMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure ITabsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure LMiHuellaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure JvMiHuellaDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ITabsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure JvMiHuellaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LMiHuellaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure JvIMiHuellaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvIMiHuellaStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure IEliminarDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure IEliminarDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure AConfiguracionFenotiposExecute(Sender: TObject);
    procedure ACargaFenotiposExecute(Sender: TObject);
    procedure ARepDenunciaBajasExecute(Sender: TObject);
    procedure ARepFlushingExecute(Sender: TObject);
    procedure ARepImplantesExecute(Sender: TObject);
    procedure ARepInspeccionExecute(Sender: TObject);
    procedure ARepNacimientosExecute(Sender: TObject);
    procedure ARepServiciosExecute(Sender: TObject);
    procedure ARepTransferenciaExecute(Sender: TObject);
    procedure ARepVientresAEmpadronarExecute(Sender: TObject);
    procedure ARepListadoDeAnimalesConFenotiposExecute(Sender: TObject);
    procedure AREPResumenMovimientoExecute(Sender: TObject);
    procedure ARepMovimientoSemenExecute(Sender: TObject);
    procedure APartidasSemenAprobarExecute(Sender: TObject);
    procedure ARepListadoExtraccionesExecute(Sender: TObject);
    procedure AHuellaVetExecute(Sender: TObject);
    procedure IBubbleClick(Sender: TObject);
    procedure JvHuellaProdClick(Sender: TObject);
    procedure IBubbleProdClick(Sender: TObject);
    procedure ISeleccionarRazaPredomClick(Sender: TObject);
    procedure ACesionEmbrionesTercerosBrangusExecute(Sender: TObject);
    procedure ATransferenciaBrangusExecute(Sender: TObject);
    procedure AInspeccionBrangusExecute(Sender: TObject);
    procedure ANacimientosBrangusExecute(Sender: TObject);
    procedure AServiciosBrangusExecute(Sender: TObject);
    procedure LCerrarAsistenteClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ARazaPredomExecute(Sender: TObject);
    procedure IBQListaAnimalesCalcFields(DataSet: TDataSet);
    procedure ARepCierreLoteExecute(Sender: TObject);
    procedure AABMTipoCategoriaExecute(Sender: TObject);
    procedure AEveCambioCategoriaExecute(Sender: TObject);
    procedure ILogoMarcaAguaClick(Sender: TObject);
    procedure JvIVolverAyudaInicClick(Sender: TObject);
    procedure JvIBotAyudaClick(Sender: TObject);
    procedure JvIBotonOpcion1Click(Sender: TObject);
    procedure JvIBotonOpcion2Click(Sender: TObject);
    procedure JvIBotonOpcion3Click(Sender: TObject);
    procedure JvImage8Click(Sender: TObject);
    procedure JvIFavorBotClick(Sender: TObject);
    procedure JvImage16Click(Sender: TObject);
    procedure JvImage14Click(Sender: TObject);
    procedure JvImage7Click(Sender: TObject);
    procedure JvImage17Click(Sender: TObject);
    procedure JvImage10Click(Sender: TObject);
    procedure JvImage12Click(Sender: TObject);
    procedure ASimulInvExecute(Sender: TObject);
    procedure JvIMapaMouseEnter(Sender: TObject);
    procedure JvIMapaMouseLeave(Sender: TObject);
    procedure JvISimuladorMouseEnter(Sender: TObject);
    procedure JvISimuladorMouseLeave(Sender: TObject);
    procedure JvIContableMouseEnter(Sender: TObject);
    procedure JvIContableMouseLeave(Sender: TObject);
    procedure JvIActualizaMouseEnter(Sender: TObject);
    procedure JvIActualizaMouseLeave(Sender: TObject);
    procedure IFondoAnimalesDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure JvIVolverClick(Sender: TObject);
    procedure ARepListadosPersonalizadosExecute(Sender: TObject);
    procedure TimagenActualizadorTimer(Sender: TObject);
    procedure JvIAIBot1Click(Sender: TObject);
    procedure JvIAIBot2Click(Sender: TObject);
    procedure JvIAIBot3Click(Sender: TObject);
    procedure AEveAltaAlimentacionExecute(Sender: TObject);
    procedure AEveBajaAlimentacionExecute(Sender: TObject);
    procedure AEveStockAlimentacionExecute(Sender: TObject);
    procedure ARepMovimientosAlimentosExecute(Sender: TObject);
    procedure ARepHojaDeCampoExecute(Sender: TObject);
    procedure JvIDiagnosticoClick(Sender: TObject);
    procedure JvIDiagnosticoRepClick(Sender: TObject);
    procedure JvIHojaMangaECClick(Sender: TObject);
    procedure AEveEvalClinicaTorosExecute(Sender: TObject);
    procedure JvICargaIndividualClick(Sender: TObject);
    procedure JvIBajaClick(Sender: TObject);
    procedure JvIConfElectroClick(Sender: TObject);
    procedure JvIBackupClick(Sender: TObject);
    procedure JvICargaMovilClick(Sender: TObject);
    procedure JvITRIClick(Sender: TObject);
    procedure JvISelectorClick(Sender: TObject);
    procedure JvITratamientosClick(Sender: TObject);
    procedure JvIPersonalizadosClick(Sender: TObject);
    procedure JvIResMovimientosClick(Sender: TObject);
    procedure JvIDTEClick(Sender: TObject);
    procedure BtnUHFRFIDClick(Sender: TObject);
   
    //**************************************
  public
    GAnimales : TGrillaAnimales;
    GEventos : TGrillaEventos;
    GReportes : TGrillaReportes;
    GHerramientas : TGrillaHerramientas;
    GConfig : TGrillaConfig;
    Acciones : TArrAcciones;
    Cant_Ejecuciones : Integer;
	  Rodeo_creado : Integer;
    idCargaElectronica : String;
    //GFavoritos : TGrillaFavoritos;
    //GMiHuella : TGrillaMiHuella;

    ConfiguroLector : Boolean;
    MarcaLector : String;
    DirFirebird : String;
    FUsuarioActual: Integer;
    FRolUsuarioActual: String;
    FNombreEstablecimiento : string;
    FNombreServidor : String;
    FNombreVeterinario : string;
    FNombreEmpresa : string;
    FNombrePropietario : string;
    FRenspa : string;
    FTipoVersion : TTipoVersion;
    HayServicios : Boolean;
    FPais: Integer;
    FPaisNombre: String;
    FPaisNombreCaravana: String;
    FPaisNombreRegistro: String;
    FPaisHerdBook: String;
    FMessagePuertoSerie : String;
    ThreadAct : TThreadActualizador;
    FTipoVersionLicencia: String; //Basica, Estandar, Full
    AccesosVisibles : Boolean;
    UsadosVisibles : Boolean;
    LLinkAcrobat : TLabel;

    MiHuella : TArrMiHuella;
    Cant_MiHuella : Integer;
    ImgDragged : TJvImage;
    procedure AgregarFuncion(Tag : Integer);
    procedure GuardarMiHuella;
    procedure CargarMiHuella;
    procedure SacarIconoMiHuella(Tag : Integer);
    procedure ReacomodarGrillaMiHuella;
    procedure leerParametrosConexion(var DirBD, ServidorBD: String);

    ///*****
    function VerificarAcrobat() : Boolean;
    procedure AcomodarBottom;
    procedure HabilitarPestania(Pestania : Integer);
    procedure HabilitarPaneles(Panel : Integer);
    procedure InicGrillas;
    procedure AcomodarImagenes;
    procedure RecalcularDimensiones;
    procedure AcomodarTabs;
    procedure ArmarPanelesTercerNivel(var Reg : TRegCasillaGrilla);
    procedure RedimensionarSubPaneles(var Reg : TRegCasillaGrilla; Padre : TPanel);
    procedure HabilitarPanel(Panel : TPanel; Actual : String; TP : TTipoMenu);
    procedure AgregarAccionEjecucion(Tag, Fila, Columna : Integer; Accion : TTipoAccion; Tipo : TTipoMenu; GC: TPuntComplejo; GS: TPuntSimple);
    function BuscarAccion(Tag : Integer) : TRegTagsAcciones;

    procedure BuildFavoritos(Reg : TRegAccionesMASUSADOS; Posicion, Indice : Integer);
    ///*****
    function VerificarVersion(Base : String) : Boolean;
    procedure SetUsuarioActual(const Value: Integer);
    procedure ActivarAcciones;
    procedure DesActivarAcciones;
    procedure SetEscalaCondicionCorporal(const Value: integer);
    function getStringEscalaCC: string;
    function getNombreVeterinario: string;
    function getNombrePropietario: string;
    function getRenspa: string;
    function getPais: Integer;
    function getPaisNombre: String;
    function getPaisNombreCaravana: String;
    function getPaisNombreRegistro: String;
    function getPaisHerdBook: String;
    function getTipoVersion: TTipoVersion;
    function verificarLlave(): boolean;//aca codigo nuevo llave
    function CompararFechas(fecha : TDate) : Boolean;
    function VerificarSalida() : Integer;
    function ExecuteProcess(ProcessName: String): Cardinal;
    function LeerRegistro() : Boolean;
    procedure BorrarArchivosTemporales();
    procedure SetMessagePuertoSerie(const Value: String);
    function GetWindowsVersion() : string;

    procedure HabilitarComponentesVersionBasica; override;

//**********************************************
    procedure AgregarAccion(Nombre : String; Caption : String; Categoria : Integer; Icono, IconoPadre : TJvImage; Iniciales : String);

//**********************************************
    procedure CargarCategorias();

    procedure crearLector;
    procedure cerrarLector;

  published
    IBDPrincipal: TIBDatabase;
    IBTPrincipal: TIBTransaction;
    AGenSalir: TAction;
    AAbmRazas: TAction;
    AAbmEstablecimientos: TAction;
    AAbmTiposAlta: TAction;
    AAbmCategorias: TAction;
    AAbmCronologiasDentarias: TAction;
    AAbmEstadosReproductivos: TAction;
    AAbmCondicionesCorporales: TAction;
    AAbmGdr: TAction;
    AEveAltaDirecta: TAction;
    AEveDeteccionCelo: TAction;
    AAbmPotreros: TAction;
    AAbmRodeos: TAction;
    AEveServicioNatural: TAction;
    AGenSeleccionEstablecimiento: TAction;
    AEveAborto: TAction;
    AEveBaja: TAction;
    AEveCalidadSeminal: TAction;
    AEveCambioUbicacion: TAction;
    AEveCapacidadServicio: TAction;
    AEveCastracion: TAction;
    AEveCircunferenciaEscrotal: TAction;
    AEveCondicionCorporal: TAction;
    AEveDestete: TAction;
    AEveDiagnosticoEnfermedad: TAction;
    AEveDiagnosticoGestacion: TAction;
    AEveEgresoServicio: TAction;
    AEveEgresoToro: TAction;
    AEveEvaluacionPreservicio: TAction;
    AEveFertilidadMacho: TAction;
    AEveIdentificacion: TAction;
    AEveIngresoServicio: TAction;
    AEveInseminacionArtificial: TAction;
    AEveIngresoToro: TAction;
    AEveServicioCorral: TAction;
    AEveMedicionFrame: TAction;
    AEvePeso: TAction;
    AEveSincronizacionCelo: TAction;
    AEveTratamiento: TAction;
    procedure AGenSalirExecute(Sender: TObject);
    procedure AAbmRazasExecute(Sender: TObject);
    procedure AAbmCategoriasRazasExecute(Sender: TObject);
    procedure AAbmEstablecimientosExecute(Sender: TObject);
    procedure AAbmTiposAltaExecute(Sender: TObject);
    procedure AAbmCategoriasExecute(Sender: TObject);
    procedure AAbmCronologiasDentariasExecute(Sender: TObject);
//    procedure ACompuestoExecute(Sender: TObject);
    procedure AAbmEstadosReproductivosExecute(Sender: TObject);
    procedure AAbmCondicionesCorporalesExecute(Sender: TObject);
    procedure AAbmGdrExecute(Sender: TObject);
//    procedure AAbmTipoServicioExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AEveAltaDirectaExecute(Sender: TObject);
    procedure AAbmPotrerosExecute(Sender: TObject);
    procedure AAbmRodeosExecute(Sender: TObject);
    procedure AAbmServiciosExecute(Sender: TObject);
    procedure AEveServicioNaturalExecute(Sender: TObject);
    procedure AGenSeleccionEstablecimientoExecute(Sender: TObject);
    procedure AEveDeteccionCeloExecute(Sender: TObject);
    procedure AEveAbortoExecute(Sender: TObject);
    procedure AEveBajaExecute(Sender: TObject);
    procedure AEveCalidadSeminalExecute(Sender: TObject);
    procedure AEveCambioUbicacionExecute(Sender: TObject);
    procedure AEveCapacidadServicioExecute(Sender: TObject);
    procedure AEveCastracionExecute(Sender: TObject);
    procedure AEveCircunferenciaEscrotalExecute(Sender: TObject);
    procedure AEveCondicionCorporalExecute(Sender: TObject);
    procedure AEveDesteteExecute(Sender: TObject);
    procedure AEveDiagnosticoEnfermedadExecute(Sender: TObject);
    procedure AEveDiagnosticoGestacionExecute(Sender: TObject);
    procedure AEveEgresoServicioExecute(Sender: TObject);
    procedure AEveEgresoToroExecute(Sender: TObject);
    procedure AEveEvaluacionPreservicioExecute(Sender: TObject);
    procedure AEveFertilidadMachoExecute(Sender: TObject);
    procedure AEveIdentificacionExecute(Sender: TObject);
    procedure AEveIngresoServicioExecute(Sender: TObject);
    procedure AEveInseminacionArtificialExecute(Sender: TObject);
    procedure AEveIngresoToroExecute(Sender: TObject);
    procedure AEveServicioCorralExecute(Sender: TObject);
    procedure AEveMedicionFrameExecute(Sender: TObject);
    procedure AEvePesoExecute(Sender: TObject);
    procedure AEveSincronizacionCeloExecute(Sender: TObject);
    procedure AEveTratamientoExecute(Sender: TObject);
    procedure ClickVolver(Sender : TObject);
  private
    FIdioma : Integer;
    FEstablecimientoActual: Integer;
    FescalaCondicionCorporal : integer;
    ori: TdxNavBarItem;

    //FLectorElectronico : TLectorElectronico;
   // FCUIGActual : Integer;
    procedure SetEstablecimientoActual(const Value: Integer);
    procedure Colores();
    procedure ActualizarBD();
    procedure EjecutarFix(SP : TIBStoredProc);overload;
    procedure EjecutarFix(SP : TIBStoredProc; ProcName :string);overload;
    procedure CargarMenuEscritorio();
    procedure CargarTopImgHints(Itop: String);
    procedure CargarCenterImgHints(ICenter: String);
    procedure CargarBottomImgHints(IBottom: String);
   // procedure SetCUIGActual(const Value: Integer);
  private
    ConectadoAServidor : Boolean;

    procedure BorrarTablasAuxiliares();
    procedure ActualizarXML(Fecha : TDate);
    function IsConnected: Boolean;
    procedure CrearAccesoActualizador();
    procedure CargarMasUsados;
    function VerificarServidorBD : Boolean;
    procedure CrearAccesoHuellaSinInstall;
    procedure HabilitarAyuda(Tag:integer);
  protected
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
  public
    MAX_ANIMALES : Integer;
    MAX_EVENTOS : Integer;
    MAX_REPORTES : Integer;

    DirBD, ServidorBD, DirAux : String;

    CantMaximaDeEstablecimientos : Integer;
    CantMaximaDeAnimales : Integer;
    OpcionDeEstablecimiento : Integer;

    _DISPOSITIVO_EL : String;
    _DISPOSITIVO_MODEL : String;
    _USO_DISP : Boolean;
    _LECTOR_ONLINE : Boolean;
    TipoCalendario : Integer;
    TipoBase : Integer;
    _PUERTO_S : TRegConfigPuertoSerie;
    FuncActividad : Boolean;
    FuncDEPs : Boolean;
    FuncTransferencia : Boolean;
    FuncSRA : Boolean;
    FuncCalidadCarne : Boolean;
    FuncGenealogia : Boolean;
    FuncProduccion : Boolean;
    FuncSincro : Boolean;
    FuncPanel : Boolean;
    FuncExcel : Boolean;
    FuncFenotipos : Boolean;
    FuncCaravanasElectronicas : Boolean;
    FuncImagenesNuevas : Boolean;
    FuncCambioActividad : Boolean;
    MuestraFenotipos : Boolean;

    RazaAngus : boolean;
    RazaBraford : boolean;
    RazaBrangus : boolean;

    TipoActividad : TTipoActividad;

    firstLog : boolean; // Chequea si es el primer log definido

    AsistenteMapa:Boolean;
    AsistenteCargaMasiva:Boolean;
    AsistenteCMasivaPlanilla:Boolean;
    importaMovil: Boolean;



//    RazaPredom : Integer;
    function VerificarActualizaciones(Automatico : Boolean) : Boolean;

    procedure EjecutarPresentacion();
    procedure AbrirFormNormal(Univ: TFUniversal);
    procedure AbrirEventoConManga(Eve: TFEveSimple);
    function VerIntroduccion():Boolean;
    procedure VerificarAlarmasServicio();
    function conectarBD(): Boolean;
    procedure SetLogueo(usuario:Integer;valorLog:string);
    function getNombreEstablecimiento: string;
    procedure leerDatosPais();
    procedure RedibujarPaneles;
    procedure SeleccionarRazaPredom;

    procedure LogginLoading( s : string);

    function EstabAnimalExterno(id_animal : Integer) : Integer;



  published

    property StringEscalaCC: string read getStringEscalaCC;
    property EscalaCondicionCorporal: integer read FescalaCondicionCorporal write SetEscalaCondicionCorporal;
    property EstablecimientoActual: Integer read FEstablecimientoActual write SetEstablecimientoActual;
    property UsuarioActual: Integer read FUsuarioActual write SetUsuarioActual;
    property NombreServidor: String read FNombreServidor write FNombreServidor;
    property RolUsuarioActual: String read FRolUsuarioActual;
    property NombreEstablecimiento: string read getNombreEstablecimiento;
    {property NumeroDeCUIGActual: Integer read FCUIGActual write SetCUIGActual;
    property CUIG: String read getCUIG write setCUIG;
    property UltimoIdentificador: String read getUltimoIdent write setUltimoIdent;}
    property NombreVeterinario: string read getNombreVeterinario;
    property NombrePropietario: string read getNombrePropietario;
    property Renspa: string read getRenspa;
    property TipoVersion: TTipoVersion read getTipoVersion;
    property Pais: Integer read getPais;
    property PaisNombre: String read getPaisNombre;
    property PaisNombreCaravana: String read getPaisNombreCaravana;
    property PaisNombreRegistro: String read getPaisNombreRegistro;
    property PaisHerdBook: String read getPaisHerdBook;
    property MessagePuertoSerie: String read FMessagePuertoSerie write SetMessagePuertoSerie;
    property TipoVersionLicencia: String read FTipoVersionLicencia write FTipoVersionLicencia;
    property OrigenDrag: TdxNavBarItem read ori;
    property Idioma : Integer read FIdioma write FIdioma;

    function consultarDeseaBackup(texto: String): boolean;
  private

    Favoritos : TArrAccionesMASUSADOS;
    Busqueda : TArrBusqueda;
    PDFAyuda : TAcroPDF;
    LeyendaAyuda : Tlabel;
    procedure Refresh;
    procedure Clasificar;
    procedure Ordenar;
    procedure ResizeFavoritos;
    procedure RedimensionarFavoritos;
    procedure RealizarBusqueda;
    procedure EliminarBusqueda;
    procedure RedimensionarBusqueda;
    procedure BuscarAnimales(RP : String);
    procedure BuscarAnimalesIE (IE : string);
    procedure AccederAFicha(id_animal : Integer);
    procedure AcomodarBienvenida;
    procedure AcomodarPanel;
    function findPendrive(): string;
    function isHuella(drive: string): boolean;
    function VerificarNuevaVersion : Boolean;
    procedure AcomodarTop;

    //procedure crearLector;
    //procedure cerrarLector;
    procedure Mensaje(var Message: TMessage); message WM_USER+1;
    procedure AsignarImagenesInferiores(Panel : TPanel; Nivel : Integer);
    function CalcularVisibles(Reg : TRegCasillaGrilla) : integer;
    procedure AcomodarAyudaInicial;
    procedure AcomodarAyuda;
    procedure AcomodarEC;
    procedure CargarFuncionesHabilitadas;

    procedure IniciarSimulador;

//    function existeIEAnimal(auxlectura: string): integer;
    procedure identificarAnimalPorLector;
  end;


var
  FPrincipal: TFPrincipal;
  VGEstablecimiento : integer;
  FV : TFMensajeGuardarVincular;
  //llave nuevo codigo
  mBuf:array[0..100] of Byte;
  mFun,mP1,mP2,mP3,mP4,rt:Word;
  lP1,lP2:LongWord;
  mHand:array[0..16] of Word;
  mHardID:array[0..16] of LongWord;
  rc:array[0..4] of Word;
  //llave nuevo codigo

  RazasElegidas : array of integer;

  open : Boolean = false; //se usa para saber si el menu esta desplegado
  MenuOpen : Array [1..3] of Boolean = (false,false,false);
  Resolucion : Integer;
  h_version : String;

  FLectorElectronico : TLectorElectronico;

  gv_eveIdentificacion : boolean;
implementation

uses
  UDMSoftvet, ULogin, UAcerca, USeleccionEstablecimiento, Math,   uLayOutPrincipal,
  UAbmCategorias, UABMCausasDistocia, UABMCentrosInseminacion, UAbmCondicionCorporal,
  UAbmCronologiaDentaria, UAbmEnfermedades, UAbmEstadoReproductivo, UABMExamenesFertilidad,
  UAbmGdr, UAbmGradosAsistencia, UAbmMetodosCastracion, UAbmMetodosDiagnostico,
  UAbmMetodosExamenSanitario, UABMMetodosSincronizacion, UABMMetodosTomaPrueba, UAbmRaza,
  UABMRechazosPreservicio, UABMSexos, UABMTecnicasTratamiento,  uLectorUHFRfid, 
  UABMTipoAborto, UAbmTipoAlta, UAbmTipoBaja, UAbmTiposDestete, UAbmTiposEnfermedad,
  UAbmTiposParto, UAbmTipoTratamiento, UAbmValoresCapacidad, UREPInformePesadas, UFunctions, 

  UAbmEstablecimientos, UAbmUsuarios, UABMPropietario, UCalendario,
  UAbmCompuesto, UABMRodeos, UAbmRecursosForrajeros,
  Uabmpotreros, UNDOServicios,  UABMPadresExternos, UTareasPendientes,

  UREPListadoEvento, UREPServicios, UREPHistoriaAnimal, URepDenunciaServicio,
  URepStockSimple, URepListadoAlta, UREPDGInformeNoTactadas, UREPDGPorcentajePrenez,
  UREPDGVersusPrenez, UREPDGAnimalesFiltrados, UREPDGDistribucionPrenezCACUCO,
  UFREPEPAptas_NoAptas, UREPGananciaDiariaPeso, UREPStockSemen, UREPABSospechozasAborto,
  UREPCMEvaluacionToros, UREPExistenciaPorLote, UREPParteMensual, UREPDistGananciaDiariaPeso,
  URepResumenParto, UAbmModificarCUIG, UConfigGrupos, UEveNacimientos,

  UDOTri, UDOCertificadoPredespacho, URepCostosVete,

  UEveAltaDirecta, UEveCambioUbicacion, UEveCastracion, UEveDeteccionCelo, UEveServicioNatural,
  UEveCondicionCorporal, UEveMedicionFrame, UEvePeso, UEveMovimientoSemenBaja,
  UEveCalidadSeminal, UEveCapacidadServicio, UEveCircunferenciaEscrotal, UEveEgresoServicio,
  UEveEgresoToro, UEveIngresoServicio, UEveInseminacionArtificial, UEveIngresoToro,
  UEveServicioCorral, UEveAltaMasiva, UEveDiagnosticoGestacion, UEveMovimientoSemenCompra,
  UEveMovimientoSemenExtraccion, UEveAborto, UEveDestete, UEveDiagnosticoEnfermedad,
  UEveTratamiento, UEveEnfermedadesMasivas, UEveIdentificacion, UEveEvaluacionPreservicio,
  UEveBaja, UEveSincronizacionCelo, UEveFertilidadMacho, UEveRecursoForrajero,
  UEveCargaResultados,UAlaServicioNatural, UEvePartoMasivo,

  UColumnSeleccion, UAbmGrupos, UAgenda, UPresentacion, UPlanillasManga,
  UAsistenteEstablecimiento, UBackup, URestaurar, UREPPAProyeccionPartos, UAbmEmpleados, UMensajeHuella,
  MaskUtils, ShellAPI, WinInet, UCartel,  UAbmDescTipoTratamiento,
  URepExistenciaRodeoPotrero, URepResumenTratamiento, UEveEliminarAnimal, UREPInfoGralGest, UREPProduccionExternos,
  Registry,  UABMLaboratorios, URepMovimientosExistencia, UAbmTiposEmpleados,
  UEveCalidadCarne, UMovCargarDatos, URepInfoMortandad, URegistroLicencia,
  UREPInfoGeneralPartos, UREPProcreo, UImpDeps, UREPProduccionCarne, UEveActividad,
  UABMActividad, UABMGruposNuevo, UABMSuplementacion, UEveSuplementacion, UREPCostoSuplementacion,

  UABMOrigen, UABMDestino, UABMPropietarioAnimal, UABMCriador, UABMReservasForrajeras,
  UABMPotrerosTratamientos, UABMDescMetodoSinc, IBDButtonABM, URepInseminaciones,

  UEveFlushing, UEveCompraEmbriones, UEveTransferenciaEmbrionaria,UABMUbicacionTransferencia,
  UABMUteroTransferencia, UABMCalidadEmbrion, UABMCentrosTransplantes, UABMDescDestEmbrion, UABMDestinoEmbrion,
  UABMDificultadTransferencia, UABMEstadioEmbrion, UREPListadoImplantes, UREPListadoReceptoras,
  URepEmbrionesTransferidos,URepStockEmbriones, UREPinfoDonantes, UDOCertificadoRecupEmbriones,
  UExpDeps, UActualizador, UEveEliminarEvento,
  UDOSRADenunciaNacimientosPreview, UDOSRADenunciaNacimientos, UABMFuentesDeps,
  UListadoEmbriones, {UMenuEscritorio,} UEveImportarPartosNacimientos, UImpSRA,
  UABMSubCategorias, UABMCodigosManejo, URepDenunciaBaja, UCoopropiedad, UDOSRATipiSangADN,
  UImpERA, {UMasUsados,} UABMInspeccion, UABMDestCabania, UProcessViewer, UTraduccion, UREPMultiEsta,
  UConfigIdioma, StrUtils, UREPFichaAnimal, UConfigLector, USincroBaseDatos, UMapa, UABMDatosSiembra,
  UIndicesProductivos, USelectorAnimales, UDOSRADenunciaNacimientosPorTransfer, UControlAnimales, UMapaGoogle,
  UConfigValoresFenotipicos, UCargaFenotipos, UExpBrafordBaja, UExpBrafordFlushing, UExpBrafordImplantes, UExpBrafordInspeccion,
  UExpBrafordNacimientos, UExpBrafordServicios, UExpBrafordTransferencia, UExpBrafordVientresEmpadronar, URepListadoAnimalesFenotipos,
  UImportacionDepsRazasExcel, UREPResumenMovimientos, UImportacionDepsRazas, UEveExtraccionSemen, URepMovimientosSemen,
  UPartidasSemenAprobar, URepListadoExtracciones, USelectorRazasPredom, UExpBrangusTransferencia, UExpBrangusImplantes,
  UExpBrangusInspeccion, UExpBrangusNacimientos, UExpBrangusServicios, URepCierreLote,
  UABMTiposCategorias, UREPListadosPersonalizados, UEveCambioCategoria, USimuladorA, UEveMovimientosAlimentacion, URepMovimientosAlimentos,
  URepHojaDeCampo, UEducacionContinua, UEveEvalClinicaToros, UEveDeclaracionAFIP, URepMovimientos, UDte
  ;

{$R *.dfm}



procedure TFPrincipal.Refresh;
var
  Usados : TIniFile;
  Indice, IndArr : Integer;
begin
  try
    IndArr := 0;
    Usados := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Favoritos.ini');
    for Indice := 0 to FPrincipal.ALUniversal.ActionCount-1 do
      if Usados.SectionExists(Fprincipal.ALUniversal.Actions[Indice].Name) then
      begin
        SetLength(Favoritos,IndArr+1);
        Favoritos[IndArr].cantidad := Usados.ReadInteger(Fprincipal.ALUniversal.Actions[Indice].Name,'cantidad',0);
        Favoritos[IndArr].Caption := Traducir(Usados.ReadString(Fprincipal.ALUniversal.Actions[Indice].Name,'namecaption',''));
        Favoritos[IndArr].Name := Usados.ReadString(Fprincipal.ALUniversal.Actions[Indice].Name,'nameaction','');
        Favoritos[IndArr].Categoria := Usados.ReadInteger(Fprincipal.ALUniversal.Actions[Indice].Name,'tipo',0);
        //Favoritos[IndArr].Imagen := (FindComponent(Usados.ReadString(Fprincipal.ALUniversal.Actions[Indice].Name,'imagen','')) as TJvImage);
        Favoritos[IndArr].ImagenPadre := (FindComponent(Usados.ReadString(Fprincipal.ALUniversal.Actions[Indice].Name,'imagenpadre','')+'Fondo') as TJvImage);
        Favoritos[IndArr].Iniciales := Usados.ReadString(Fprincipal.ALUniversal.Actions[Indice].Name,'iniciales','');
        Inc(IndArr);
      end;
    Ordenar;
    Clasificar;
  finally
    Usados.Free;
  end;
end;

procedure TFPrincipal.Clasificar;
var
  IndArr,  Cant : Integer;
begin

  IndArr := 0;
  Cant := 0;
  while (IndArr < 6)do
  begin
    if IndArr < (Length(Favoritos)-1) then
    begin
      BuildFavoritos(Favoritos[IndArr],Cant+1,IndArr);
      Inc(Cant);

    end;
    Inc(IndArr);
  end;
end;

procedure TFPrincipal.BuildFavoritos(Reg : TRegAccionesMASUSADOS; Posicion, Indice : Integer);
begin
  case Posicion of
    1: begin
        if Reg.ImagenPadre <> nil then
        begin
          {JvIFavorBot1C.Visible := true;
          JvIFavorBot1C.Picture := Reg.Imagen.Picture;
          JvIFavorBot1C.Tag := Indice;}
          LFavorBot1C.Visible := true;
          LFavorBot1C.Caption := Reg.Iniciales;
          LFavorBot1C.Tag := Indice;
          case Reg.Categoria of
            1 : LFavorBot1C.Font.Color := $0015243C;
            2 : LFavorBot1C.Font.Color := $00BC751C;
            3 : LFavorBot1C.Font.Color := $0090392B;
            4 : LFavorBot1C.Font.Color := $00715800;
            5 : LFavorBot1C.Font.Color := $002D1EBE;
          end;
        end;
        LFavor1.Visible := true;
        LFavor1.Caption := Reg.Caption;
        LFavor1.Tag := Indice;
        JvIFavorBot1.Picture := Reg.ImagenPadre.Picture;
        JvIFavorBot1.Tag := Indice;
       end;
    2: begin
        if Reg.ImagenPadre <> nil then
        begin
          {JvIFavorBot2C.Visible := true;
          JvIFavorBot2C.Picture := Reg.Imagen.Picture;
          JvIFavorBot2C.Tag := Indice;}
          LFavorBot2C.Visible := true;
          LFavorBot2C.Caption := Reg.Iniciales;
          LFavorBot2C.Tag := Indice;
          case Reg.Categoria of
            1 : LFavorBot2C.Font.Color := $0015243C;
            2 : LFavorBot2C.Font.Color := $00BC751C;
            3 : LFavorBot2C.Font.Color := $0090392B;
            4 : LFavorBot2C.Font.Color := $00715800;
            5 : LFavorBot2C.Font.Color := $002D1EBE;
          end;
        end;
        LFavor2.Visible := true;
        LFavor2.Caption := Reg.Caption;
        LFavor2.Tag := Indice;
        JvIFavorBot2.Picture := Reg.ImagenPadre.Picture;
        JvIFavorBot2.Tag := Indice;
       end;
    3: begin
        if Reg.ImagenPadre <> nil then
        begin
          {JvIFavorBot3C.Visible := true;
          JvIFavorBot3C.Picture := Reg.Imagen.Picture;
          JvIFavorBot3C.Tag := Indice;}
          LFavorBot3C.Visible := true;
          LFavorBot3C.Caption := Reg.Iniciales;
          LFavorBot3C.Tag := Indice;
          case Reg.Categoria of
            1 : LFavorBot3C.Font.Color := $0015243C;
            2 : LFavorBot3C.Font.Color := $00BC751C;
            3 : LFavorBot3C.Font.Color := $0090392B;
            4 : LFavorBot3C.Font.Color := $00715800;
            5 : LFavorBot3C.Font.Color := $002D1EBE;
          end;
        end;
        LFavor3.Visible := true;
        LFavor3.Caption := Reg.Caption;
        LFavor3.Tag := Indice;
        JvIFavorBot3.Picture := Reg.ImagenPadre.Picture;
        JvIFavorBot3.Tag := Indice;
       end;
    4: begin
        if Reg.ImagenPadre <> nil then
        begin
          {JvIFavorBot4C.Visible := true;
          JvIFavorBot4C.Picture := Reg.Imagen.Picture;
          JvIFavorBot4C.Tag := Indice;}
          LFavorBot4C.Visible := true;
          LFavorBot4C.Caption := Reg.Iniciales;
          LFavorBot4C.Tag := Indice;
          case Reg.Categoria of
            1 : LFavorBot4C.Font.Color := $0015243C;
            2 : LFavorBot4C.Font.Color := $00BC751C;
            3 : LFavorBot4C.Font.Color := $0090392B;
            4 : LFavorBot4C.Font.Color := $00715800;
            5 : LFavorBot4C.Font.Color := $002D1EBE;
          end;
        end;
        LFavor4.Visible := true;
        LFavor4.Caption := Reg.Caption;
        LFavor4.Tag := Indice;
        JvIFavorBot4.Picture := Reg.ImagenPadre.Picture;
        JvIFavorBot4.Tag := Indice;
       end;
    5: begin
        if Reg.ImagenPadre <> nil then
        begin
          {JvIFavorBot5C.Visible := true;
          JvIFavorBot5C.Picture := Reg.Imagen.Picture;
          JvIFavorBot5C.Tag := Indice;}
          LFavorBot5C.Visible := true;
          LFavorBot5C.Caption := Reg.Iniciales;
          LFavorBot5C.Tag := Indice;
          case Reg.Categoria of
            1 : LFavorBot5C.Font.Color := $0015243C;
            2 : LFavorBot5C.Font.Color := $00BC751C;
            3 : LFavorBot5C.Font.Color := $0090392B;
            4 : LFavorBot5C.Font.Color := $00715800;
            5 : LFavorBot5C.Font.Color := $002D1EBE;
          end;
        end;
        LFavor5.Visible := true;
        LFavor5.Caption := Reg.Caption;
        LFavor5.Tag := Indice;
        JvIFavorBot5.Picture := Reg.ImagenPadre.Picture;
        JvIFavorBot5.Tag := Indice;
       end;
    6: begin
        if Reg.ImagenPadre <> nil then
        begin
          {JvIFavorBot6C.Visible := true;
          JvIFavorBot6C.Picture := Reg.Imagen.Picture;
          JvIFavorBot6C.Tag := Indice;}
          LFavorBot6C.Visible := true;
          LFavorBot6C.Caption := Reg.Iniciales;
          LFavorBot6C.Tag := Indice;
          case Reg.Categoria of
            1 : LFavorBot6C.Font.Color := $0015243C;
            2 : LFavorBot6C.Font.Color := $00BC751C;
            3 : LFavorBot6C.Font.Color := $0090392B;
            4 : LFavorBot6C.Font.Color := $00715800;
            5 : LFavorBot6C.Font.Color := $002D1EBE;
          end;
        end;
        LFavor6.Visible := true;
        LFavor6.Caption := Reg.Caption;
        LFavor6.Tag := Indice;
        JvIFavorBot6.Picture := Reg.ImagenPadre.Picture;
        JvIFavorBot6.Tag := Indice;
       end;
  end;
end;

procedure TFprincipal.RedimensionarFavoritos;
begin
end;

procedure TFprincipal.ResizeFavoritos;
begin
end;

procedure TFPrincipal.Ordenar;
var
  Indice, K : Integer;
  Reg : TRegAccionesMASUSADOS;
begin
  Reg.cantidad := -1;
  for Indice := 0 to Length(Favoritos)-1 do
    for K := Indice+1 to Length(Favoritos)-1 do
      if Favoritos[Indice].cantidad < Favoritos[K].cantidad then
      begin
        Reg := Favoritos[Indice];
        Favoritos[Indice] := Favoritos[K];
        Favoritos[K] := Reg;
      end;
end;

procedure TFPrincipal.AGenSalirExecute(Sender: TObject);
begin
  inherited;
  if MostrarMensaje(tmConsulta,'Realmente desea salir de Huella?') = mrYes then
  begin
    FPrincipal.Close;
    Application.Terminate;
  end;
end;

procedure TFPrincipal.AAbmCategoriasRazasExecute(Sender: TObject);
begin
  inherited;
end;

procedure TFPrincipal.AAbmEstablecimientosExecute(Sender: TObject);
var
  abm : TFABMEstablecimientos;
begin
  inherited;
  abm := TFABMEstablecimientos.Create(self);
  abm.Abrir(faAbm);
  leerDatosPais();
end;

//llave nuevo codigo
function TFPrincipal.verificarLlave: boolean;
var
    i:Integer;
    str:string;
begin
{$IFDEF DEMO}
  Result:= true;
{$ELSE}

  if (TipoVersionLicencia = 'Basico') then
    Result:= true
   else

     if (TipoVersionLicencia = 'Estandar') then

        Result:= true
      else
       if (TipoVersionLicencia = 'Full') then

        begin                                                                                
          R4ND_Init();
      //    List.Items.Clear();
          mP1:=$8210;   //passwords
          mP2:=$7d42;
          mP3:=$81db;
          mP4:=$4181;
          for i:=0 to 30 do
               mBuf[i]:=0;
          rt:=0;
          mFun:=1;
          rt:= Rockey(mFun,mHand[0],lP1,lP2,mP1,mP2,mP3,mP4,mBuf[0]);
          if rt<>0 then
           begin
             FmtStr(str,'cannot find ROCKEY1,error:%d ',[rt]);
             Result:= false;
           end
          else
            begin
             Result:= true;
            end;
       end;
{$ENDIF}
end;
//llave nuevo codigo



procedure TFPrincipal.CrearAccesoActualizador;
var
   IObject_1, IObject_2 : IUnknown;
   ISLink_1, ISLink_2 : IShellLink;
   IPFile_1, IPFile_2 : IPersistFile;
   PIDL : PItemIDList;
   TargetName_1, TargetName_2 : string;
   desktopFolder : array[0..MAX_PATH] of Char;
   LinkName_1, LinkName_2 : WideString;
   dir : array [0..MAX_PATH] of Char;
begin
  try
    SHGetSpecialFolderLocation(0, CSIDL_DESKTOPDIRECTORY, PIDL) ;
    SHGetPathFromIDList(PIDL, desktopFolder) ;
    if FileExists(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe') then
      TargetName_1 := ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe'
    else
      TargetName_1 := ExtractFilePath(Application.ExeName)+'Huella Update\Actualizador.exe';
    IObject_1 := CreateComObject(CLSID_ShellLink) ;
    ISLink_1 := IObject_1 as IShellLink;
    IPFile_1 := IObject_1 as IPersistFile;
    with ISLink_1 do
    begin
      SetPath(pChar(TargetName_1)) ;  // Path y nombre archivo c:\prueba\pepe.exe
      SetWorkingDirectory(pChar(ExtractFilePath(TargetName_1))) ; //directorio de trabajo solo path
      if FileExists(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe') then
        SetIconLocation(PChar(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe'), 0)  // Icono del exe
      else
        SetIconLocation(PChar(ExtractFilePath(Application.ExeName)+'Huella Update\Actualizador.exe'), 0);  // Icono del exe
    end;
    LinkName_1 := desktopFolder + '\Huella Actualizador.lnk';
    try
      IPFile_1.Save(PWChar(LinkName_1), false) ;
    except
    end;

    GetWindowsDirectory(dir, MAX_PATH);
    SHGetSpecialFolderLocation(0, CSIDL_DESKTOPDIRECTORY, PIDL) ;
    SHGetPathFromIDList(PIDL, desktopFolder) ;
    TargetName_2 := ExtractFilePath(Application.ExeName)+'Planillas\';
    IObject_2 := CreateComObject(CLSID_ShellLink) ;
    ISLink_2 := IObject_2 as IShellLink;
    IPFile_2 := IObject_2 as IPersistFile;
    with ISLink_2 do
    begin
      SetPath(pChar(TargetName_2)) ;  // Path y nombre archivo c:\prueba\pepe.exe
      SetWorkingDirectory(pChar(ExtractFilePath(TargetName_2))) ; //directorio de trabajo solo path
      SetIconLocation(PChar(dir+'System32\SHELL32.dll'), 3);  // Icono del exe
    end;
    LinkName_2 := desktopFolder + '\Planillas de Excel - Huella.lnk';
    try
      IPFile_2.Save(PWChar(LinkName_2), false) ;
    except
    end;
  except
  end;
end;

procedure TFPrincipal.CrearAccesoHuellaSinInstall;
var
   IObject_2 : IUnknown;
   ISLink_2 : IShellLink;
   IPFile_2 : IPersistFile;
   PIDL : PItemIDList;
   TargetName_2 : string;
   desktopFolder : array[0..MAX_PATH] of Char;
   LinkName_2 : WideString;
   dir : array [0..MAX_PATH] of Char;
begin
  try
    GetWindowsDirectory(dir, MAX_PATH);
    SHGetSpecialFolderLocation(0, CSIDL_DESKTOPDIRECTORY, PIDL) ;
    SHGetPathFromIDList(PIDL, desktopFolder) ;
    TargetName_2 := ExtractFilePath(Application.ExeName)+'huella.exe';
    IObject_2 := CreateComObject(CLSID_ShellLink) ;
    ISLink_2 := IObject_2 as IShellLink;
    IPFile_2 := IObject_2 as IPersistFile;
    with ISLink_2 do
    begin
      SetPath(pChar(TargetName_2)) ;  // Path y nombre archivo c:\prueba\pepe.exe
      SetWorkingDirectory(pChar(ExtractFilePath(Application.ExeName))) ; //directorio de trabajo solo path
      SetIconLocation(PChar(ExtractFilePath(Application.ExeName)+'huella.exe'), 0);  // Icono del exe
    end;

    {$IFDEF EC}
      LinkName_2 := desktopFolder + '\Huella Educacion Continua.lnk';
    {$ELSE}
      LinkName_2 := desktopFolder + '\Demo Huella.lnk';
      
    {$ENDIF}

    try
      IPFile_2.Save(PWChar(LinkName_2), false) ;
    except
    end;
  except
  end;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
var
    abm : TFABMPropietario;
    verifllave, veriflic : Boolean;


begin

  inherited;

  {$IFDEF TERMINAL}
  {if not VerficarUsuarioRed then
  begin
    MostrarMensaje(tmInformacion,'El usuario '+GetLoginName+' no se encuentra habilitado para utilizar Huella.');
    Application.Terminate;
  end;}
  {$ENDIF}

  LVersionHuella.Caption := LTipoVersionLicenciaDerecha.Caption;

  {$IFDEF PEN}
        {$IFDEF DEMO}
          CrearAccesoHuellaSinInstall;
        {$ENDIF}
  {$ELSE}
    {$IFDEF DEMO}
      //
    {$ELSE}
      CrearAccesoActualizador;
    {$ENDIF}
  {$ENDIF}

  TimerLlave.Enabled:= false;
//  Caption := Traducir('Gesti�n de Bovinos de Carne . V3.51');

  if ( ServidorBD = '') and (dirBD = '') then
    FPrincipal.Caption := 'Huella. Gesti�n de Bovinos de Carne. '+h_version +' [Connected to: Default]'
  else
  if ( ServidorBD = '') and (dirBD <> '') then
    FPrincipal.Caption := 'Huella. Gesti�n de Bovinos de Carne. '+h_version+' [Connected to: '+dirBD+']'
  else
    FPrincipal.Caption := 'Huella. Gesti�n de Bovinos de Carne. '+h_version+' [Connected to:'+  ServidorBD+']';

  PTitulo.Caption := Caption;
  PTitulo.Visible := False;
  Application.Title := Caption;
  Application.CreateForm(TFPresentacion, FPresentacion);
  BorrarArchivosTemporales();
  FPresentacion.ShowModal;
  FPresentacion.Destroy;

    if (TipoVersionLicencia = 'Basico') then
  //    {$IFDEF BASICO}
      begin
        //esto va para la licencia entra en la version 2.0
        Application.CreateForm(TFRegistroLicencia, FRegistroLicencia);
        if not FRegistroLicencia.verificacopia then
         begin
           TimerRegistroLicencia.Enabled:= false;
           MostrarMensaje(tmAdvertencia, 'El Producto no se encuentra registrado. Presione aceptar y complete el Registro de Licencia.');
           FRegistroLicencia.ShowModal;
           TimerRegistroLicencia.Enabled:= true;
         end
        else
          FRegistroLicencia.Destroy;
      end
    else
    begin
      if (TipoVersionLicencia = 'Estandar') then
        begin
          //esto va para la licencia entra en la version 2.0
          Application.CreateForm(TFRegistroLicencia, FRegistroLicencia);
          if not FRegistroLicencia.verificacopia then
           begin
          {$IFDEF PEN}
          if FRegistroLicencia.EstadoLicencia = '3' then
          begin
              MostrarMensaje(tmAdvertencia, 'El Producto no se encuentra registrado. Por favor comun�quese con el soporte t�cnico de HUELLA - sac@softhuella.com.ar.');
              exit;
          end;
          {$ENDIF}
             TimerRegistroLicencia.Enabled:= false;
             MostrarMensaje(tmAdvertencia, 'El Producto no se encuentra registrado. Presione aceptar y complete el Registro de Licencia.');
             FRegistroLicencia.ShowModal;
             TimerRegistroLicencia.Enabled:= true;
           end
          else
            FRegistroLicencia.Destroy;
        end
        else
        begin
          if TipoVersionLicencia = 'Full' then
          begin
            Application.CreateForm(TFRegistroLicencia, FRegistroLicencia);
            verifllave := verificarLlave;
            veriflic := FRegistroLicencia.verificacopia;

            TimerLlave.Enabled := false;
            TimerRegistroLicencia.Enabled := false;

            if verifllave then
            begin
              TimerLlave.Enabled := true;
              TimerRegistroLicencia.Enabled := false;
            end;
            if veriflic then
            begin
              TimerLlave.Enabled := false;
              TimerRegistroLicencia.Enabled := true;
            end;

            if not veriflic and not verifllave then
             begin
               TimerRegistroLicencia.Enabled:= false;
               MostrarMensaje(tmAdvertencia, 'El Producto no se encuentra registrado o no esta puesta la llave de seguridad. Presione aceptar y complete el Registro de Licencia, o ponga su llave de seguridad.');
               FRegistroLicencia.ShowModal;
               TimerRegistroLicencia.Enabled:= true;
             end
            else
              FRegistroLicencia.Destroy;
          end;
        end;
      end;
    try
      if (DMSoftvet.IBQEstablecimiento.IsEmpty) then
         begin
          DMSoftvet.IBQUsuario.First;
          SetUsuarioActual(1);
          DMSoftvet.IBQSeguridad.Close;
          DMSoftvet.IBQSeguridad.ParamByName('Usuario').AsInteger := 1;
          DMSoftvet.IBQSeguridad.Open;
          //cambiarlo muy mal
          Application.CreateForm(TFLogin, FLogin);
          FLogin.Destroy;
          AbrirFormNormal(TFAsistenteEstablecimiento.Create(self));
          abm := TFABMPropietario.Create(self);
          abm.Abrir(faAbm);
         end
       else
         begin
            if (TipoVersionLicencia = 'Basico') then
              begin
                DMSoftvet.IBQUsuario.First;
                SetUsuarioActual(1);
                DMSoftvet.IBQSeguridad.Close;
                DMSoftvet.IBQSeguridad.ParamByName('Usuario').AsInteger := 1;
                DMSoftvet.IBQSeguridad.Open;

                Application.CreateForm(TFLogin, FLogin);
                FLogin.ShowModal;
                FLogin.Destroy;
              end
            else
              begin
                Application.CreateForm(TFLogin, FLogin);
                FLogin.ShowModal;
                FLogin.Destroy;
              end;
            VerificarAlarmasServicio();
         end;
     except
     end;
    // CUIDADO: La variable ftipoversion hay que setearla usando una variable de
    // compilacion

    try
      AbrirImagenes(self);
      HabilitarPestania(9);
      HabilitarPaneles(9);
      //RedibujarPaneles;
    except
     on e : exception do
     begin
       e.Message := e.Message + ' .Error en carga de Imagenes y Pestanias';
       AppEventPrincipalException(self, e);
     end;
    end;                                            
    FormResize(self);

    ComponentesVisiblesPorPais(Pais);
    FTipoVersion := tvVeterinario;
    Colores();
    Application.HelpFile := copy(Application.ExeName, 0, length(Application.ExeName) -4) + '.chm';

    {$IFDEF DEMO}
         AGenBackup.Enabled:= true;
    {$ELSE}
      //Verifico si hay actualizaciones solo para las versiones comerciales
      {if IsConnected then
        TimerActualizador.Enabled := true;} 
      {$IFDEF PRODUCTORES}
      {$ELSE}                           
      {$ENDIF}    
    {$ENDIF}

   HabilitarComponentesVersionBasica();
   AREPMovimientosExistencia.Enabled:= true;

   LTipoVersionLicenciaImagenesPrincip.Caption:= '';

  {$IFDEF PEN}
      {$IFDEF TERMINAL}
        LTipoVersionLicenciaDerecha.Caption:= Traducir('');
      {$ELSE}
        LTipoVersionLicenciaDerecha.Caption:= Traducir('MODULO PENDRIVE');
      {$ENDIF}
  {$ELSE}
   {if (FPrincipal <> nil) then
     if (FPrincipal.TipoVersionLicencia = 'Basico') then
       begin
         LTipoVersionLicenciaImagenesPrincip.Caption:= Traducir('MODULO BASE');
       end
      else
       if (FPrincipal.TipoVersionLicencia = 'Estandar') then
         begin
           LTipoVersionLicenciaImagenesPrincip.Caption:= Traducir('MODULO ESTANDAR');
         end
        else
         if (FPrincipal.TipoVersionLicencia = 'Full') then
           begin
             LTipoVersionLicenciaImagenesPrincip.Caption:= '';
           end;  }
  {$ENDIF}

  MuestraFenotipos := false;
  SeleccionarRazaPredom;

  CargarMenuEscritorio();   //lo desactive para educacion continua
  CargarMasUsados();

  if TipoVersionLicencia = 'Basico' then
    if TipoBase = 1 then
      if not VerificarVersion('') then
      begin
        MostrarMensaje(tmError,'La base de datos no corresponde a un Modulo Base de Huella');
        FPrincipal.Close;
        Application.Terminate;
      end;

  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Huella Update\UpdateClient.xml'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\barra_derecha.png'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\barra_izquierda.png'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\bienvenido.jpg'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\borde.jpg'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\borde_up.png'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\cartel.png'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\Creacion.jpg'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\Huella.ico'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\iniciando.png'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\logo_80x50.jpg'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\logo_huella.png'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\logologin.png'),FILE_ATTRIBUTE_NORMAL);
  SetFileAttributes(Pchar(ExtractFilePath(Application.ExeName)+'Imagenes\logoregistro.jpg'),FILE_ATTRIBUTE_NORMAL);

  try
    IBQUpdateStockSemen.Close;
    IBQUpdateStockSemen.Open;
    IBTPrincipal.CommitRetaining;
  except
    IBTPrincipal.RollbackRetaining;
  end;
  idCargaElectronica := '';
end;


procedure TFPrincipal.CargarCategorias;
begin

end;


procedure TFPrincipal.VerificarAlarmasServicio();
begin
  HayServicios := false;
  IBQVerAlarma.Close;
  IBQVerAlarma.Open;
  HayServicios := (IBQVerAlarma.FieldByName('cant').AsInteger > 0);
  TCheck.Enabled := true;
  if (HayServicios) then
    AbrirFormNormal(TFALAServicioNatural.Create(self));
end;

procedure TFPrincipal.Colores();
begin

end;

procedure TFPrincipal.AEveAltaDirectaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFEveAltaDirecta.Create(self));
  AgregarAccion(AEveAltaDirecta.Name,'Carga Individual',1,JvAnimales3N,JvFolMovimiento,'CAI');
end;

procedure TFPrincipal.AAbmPotrerosExecute(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  abm := TFABMPotreros.Create(self);
  abm.Abrir(faAbm);
end;

procedure TFPrincipal.AAbmRodeosExecute(Sender: TObject);
var
  abm : TFABMRodeos;
begin
  inherited;
  abm := TFABMRodeos.Create(self);
  abm.Abrir(faAbm);
end;

procedure TFPrincipal.AAbmServiciosExecute(Sender: TObject);
begin
  inherited;

  DMSoftvet.IBQServiciosBorrables.Close;
  DMSoftvet.IBQServiciosBorrables.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQServiciosBorrables.Open;
  if(not DMSoftvet.IBQServiciosBorrables.IsEmpty)then
    AbrirFormNormal(TFUndoServicios.Create(self))
  else
    MostrarMensaje(tmAdvertencia,'No Existen Servicios Activos ');
 AgregarAccion(AAbmServicios.Name,'Eliminar Servicio',2,JvIEventos3N,JvFolEServicios,'ES');
end;

procedure TFPrincipal.AEveServicioNaturalExecute(Sender: TObject);
begin
  inherited;
  {DMSoftvet.IBQPotrerosVacios.Close;
  DMSoftvet.IBQPotrerosVacios.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrerosVacios.Open;
  if(DMSoftvet.IBQPotrerosVacios.IsEmpty)then
  begin
     MostrarMensaje(tmAdvertencia,'No hay potreros disponibles para la creaci�n del servicio.');
     If (MostrarMensaje(tmConsulta, 'Desea agregar un potrero al establecimiento?') = mrYes) then
     begin
        AAbmPotrerosExecute(nil);
        AEveServicioNaturalExecute(nil);
     end;
  end
  else }
    AbrirFormNormal(TFEveServicioNatural.Create(self));
  AgregarAccion(AEveServicioNatural.Name,'Servicio Natural - Creacion',2,JvIEventos3N,JvFolEServicios,'CSN');
end;

function TFPrincipal.EstabAnimalExterno(id_animal : Integer) : Integer;
var
  id_establecimiento_externo: integer;
begin
   ibqEstabAniExterno.Close;
   IBQEstabAniExterno.ParamByName('id_animal').Value := id_animal;
   IBQEstabAniExterno.Open;

   // Si tiene establecimiento lo recupera, sino toma el actual.
   if (IBQEstabAniExterno.FieldValues['Establecimiento'] <> null) then
   begin
      Result := IBQEstabAniExterno.FieldValues['Establecimiento'];
   end
   else
   begin
      Result := FEstablecimientoActual;
   end;
end;

procedure TFPrincipal.AGenSeleccionEstablecimientoExecute(Sender: TObject);
var
  a : Integer;
  p : TTipoActividad;
begin
  inherited;
  a := EstablecimientoActual;
  p := TipoActividad;
  AbrirFormNormal(TFSeleccionEstablecimiento.Create(self));
  if FPrincipal.EstablecimientoActual <> a then
  begin
    if p <> TipoActividad then
    begin
      leerDatosPais();
      AbrirImagenes(self);
      RedibujarPaneles;
    end;
  end;
  //AgregarAccion(AGenSeleccionEstablecimiento.Name,'Cambio de Establecimiento',4,nil,JvFolCambioEsta,'');
end;

procedure TFPrincipal.AEveDeteccionCeloExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveDeteccionCelo.Create(self));
  AgregarAccion(AEveDeteccionCelo.Name,'Deteccion de Celo',2,JvIEventos3N,JvFolEServicios,'DDC');
end;

procedure TFPrincipal.AEveAbortoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveAborto.Create(self));
end;

procedure TFPrincipal.AEveBajaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveBaja.Create(self));
  AgregarAccion(AEveBaja.Name,'Baja',1,JvAnimales3N,JvFolMovimiento,'BAJ');
end;

procedure TFPrincipal.AbrirFormNormal(Univ: TFUniversal);
begin
  inherited;
  if (ConfiguroLector) then
    FPrincipal.TimerLector.Enabled := false;
  Univ.Hide;
  Univ.ShowModal;

  if Univ is TFConfigLector then
    ConfiguroLector := (_USO_DISP and _LECTOR_ONLINE);

  Univ.Destroy;
  BorrarTablasAuxiliares();
  if (ConfiguroLector) then
    FPrincipal.TimerLector.Enabled := true;
end;

procedure TFPrincipal.AbrirEventoConManga(Eve: TFEveSimple);
begin
  inherited;
  if ConfiguroLector then
    Fprincipal.TimerLector.Enabled := false;
  Eve.Hide;
  Eve.ConManga := True;
  Eve.ModoEve  := meMasivo;
  Eve.ShowModal;
  Eve.Destroy;
  BorrarTablasAuxiliares();
  if(ConfiguroLector)then
    FPrincipal.TimerLector.Enabled := true;
end;

procedure TFPrincipal.AEveCalidadSeminalExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCalidadSeminal.Create(self));
  AgregarAccion(AEveCalidadSeminal.Name,'Examen de Calidad Seminal',2,JvIEventos3N,JvFolEServicios,'ECS');
end;

procedure TFPrincipal.AEveCambioUbicacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCambioUbicacion.Create(self));
  AgregarAccion(AEveCambioUbicacion.Name,'Cambio de Ubicacion',1,JvAnimales3N,JvFolMovimiento,'CDU');
end;

procedure TFPrincipal.AEveCapacidadServicioExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCapacidadServicio.Create(self));
  AgregarAccion(AEveCapacidadServicio.Name,'Determinacion de Capacidad de Servicio',2,JvIEventos3N,JvFolEServicios,'DCS');
end;

procedure TFPrincipal.AEveCastracionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCastracion.Create(self));
  AgregarAccion(AEveCastracion.Name,'Castracion',2,JvIEventos3N,JvFolECria,'CAS');
end;

procedure TFPrincipal.AEveCircunferenciaEscrotalExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCircunferenciaEscrotal.Create(self));
  AgregarAccion(AEveCircunferenciaEscrotal.Name,'Medicion de Circunferencia Escrotal',2,JvIEventos3N,JvFolEGral,'MCE');
end;

procedure TFPrincipal.AEveCondicionCorporalExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCondicionCorporal.Create(self));
  AgregarAccion(AEveCondicionCorporal.Name,'Determinacion de Condicion Corporal',2,JvIEventos3N,JvFolEGral,'DCC');
end;

procedure TFPrincipal.AEveDesteteExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveDestete.Create(self));
  AgregarAccion(AEveDestete.Name,'Destete',2,JvIEventos3N,JvFolECria,'DES');
end;

procedure TFPrincipal.AEveDiagnosticoEnfermedadExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveDiagnosticoEnfermedad.Create(self));
  AgregarAccion(AEveDiagnosticoEnfermedad.Name,'Diagnostico de Enfermedad',2,JvIEventos3N,JvFolESanitarios,'DDE');
end;

procedure TFPrincipal.AEveDiagnosticoGestacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveDiagnosticoGestacion.Create(self));
  AgregarAccion(AEveDiagnosticoGestacion.Name,'Diagnostico de Gestacion',2,JvIEventos3N,JvFolEGestacion,'DDG');
end;

procedure TFPrincipal.AEveEgresoServicioExecute(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQIngEgrServicio.Close;
  DMSoftvet.IBQIngEgrServicio.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQIngEgrServicio.Open;
  if(not DMSoftvet.IBQIngEgrServicio.IsEmpty) then
    AbrirEventoConManga(TFEveEgresoServicio.Create(self))
  else
    MostrarMensaje(tmAdvertencia, 'No se puede realizar movimientos de Animales. No se ha creado servicio');
  AgregarAccion(AEveEgresoServicio.Name,'Servicio Natural - Egreso de Hembras',2,JvIEventos3N,JvFolEServicios,'SEH');
end;

procedure TFPrincipal.AEveEgresoToroExecute(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQIngEgrServicio.Close;
  DMSoftvet.IBQIngEgrServicio.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQIngEgrServicio.Open;
  if(DMSoftvet.IBQIngEgrServicio.IsEmpty)then
  begin
     if(MostrarMensaje(tmAdvertencia, 'No se puede realizar movimientos de Animales. No se ha creado servicio') <> 2) then
        //se cierra
  end
  else
    AbrirEventoConManga(TFEveEgresoToro.Create(self));
  AgregarAccion(AEveEgresoToro.Name,'Servicio Natural - Egreso de Toro.',2,JvIEventos3N,JvFolEServicios,'SET');
end;

procedure TFPrincipal.AEveEvaluacionPreservicioExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveEvaluacionPreservicio.Create(self));
  AgregarAccion(AEveEvaluacionPreservicio.Name,'Evaluacion de Preservicio',2,JvIEventos3N,JvFolEServicios,'EPR');
end;

procedure TFPrincipal.AEveFertilidadMachoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveFertilidadMacho.Create(self));
  AgregarAccion(AEveFertilidadMacho.Name,'Examen Clinico Macho',2,JvIEventos3N,JvFolEGral,'ECM');
end;

procedure TFPrincipal.AEveIdentificacionExecute(Sender: TObject);
begin
  inherited;
  gv_eveIdentificacion := True;
  AbrirEventoConManga(TFEveIdentificacion.Create(self,true));
  AgregarAccion(AEveIdentificacion.Name,'Identificacion',2,JvIEventos3N,JvFolEGral,'IDN');
end;

procedure TFPrincipal.AEveReidentificacionExecute(Sender: TObject);
begin
  inherited;
  gv_eveIdentificacion := False;
  AbrirEventoConManga(TFEveIdentificacion.Create(self,false));
  AgregarAccion(AEveReidentificacion.Name,'Reidentificacion',2,JvIEventos3N,JvFolEGral,'RID');
end;

procedure TFPrincipal.AEveIngresoServicioExecute(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQIngEgrServicio.Close;
  DMSoftvet.IBQIngEgrServicio.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQIngEgrServicio.Open;
  if(not DMSoftvet.IBQIngEgrServicio.IsEmpty) then
    AbrirEventoConManga(TFEveIngresoServicio.Create(self))
  else
    MostrarMensaje(tmAdvertencia, 'No se puede realizar movimientos de Animales. No se ha creado servicio.');
  AgregarAccion(AEveIngresoServicio.Name,'Servicio Natural - Ingreso de Hembras',2,JvIEventos3N,JvFolEServicios,'SIH');
end;

procedure TFPrincipal.AEveInseminacionArtificialExecute(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQSemen.Close;
  DMSoftvet.IBQSemen.ParamByName('establecimiento').AsInteger := EstablecimientoActual;
  DMSoftvet.IBQSemen.Open;
  if (DMSoftvet.IBQSemen.FieldByName('totalToros').AsInteger = 0)then
     begin
      //  MostrarMensaje(tmAdvertencia, 'No existe Stock de Semen para poder inseminar.');
        If (MostrarMensaje(tmConsulta, 'No existe Stock de Semen. Desea agregar Stock de Semen para poder inseminar?') = mrYes) then
        begin
           If (MostrarMensaje(tmConsulta, 'Desea Comprar semen para poder inseminar?') = mrYes) then
              AEveAltaSemenExecute(nil);

           If (MostrarMensaje(tmConsulta, 'Desea Extraer semen para poder inseminar?') = mrYes) then
              AEveExtraccionSemenExecute(nil);

           AEveInseminacionArtificialExecute(nil);
        end;
     end
    else
     AbrirEventoConManga(TFEveInseminacionArtificial.Create(self));
  AgregarAccion(AEveInseminacionArtificial.Name,'Inseminaci�n Artificial',2,JvIEventos3N,JvFolEServicios,'IAR');
end;

procedure TFPrincipal.AEveIngresoToroExecute(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQIngEgrServicio.Close;
  DMSoftvet.IBQIngEgrServicio.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQIngEgrServicio.Open;
  if (not DMSoftvet.IBQIngEgrServicio.IsEmpty) then
    AbrirEventoConManga(TFEveIngresoToro.Create(self))
  else
    MostrarMensaje(tmAdvertencia, 'No se puede realizar movimientos de Animales. No se ha creado servicio.');
  AgregarAccion(AEveIngresoToro.Name,'Servicio Natural - Ingreso de Toros',2,JvIEventos3N,JvFolEServicios,'SIT');
end;

procedure TFPrincipal.AEveServicioCorralExecute(Sender: TObject);
begin
  inherited;
  {DMSoftvet.IBQPotrerosVacios.Close;
  DMSoftvet.IBQPotrerosVacios.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrerosVacios.Open;
  if (not DMSoftvet.IBQPotrerosVacios.IsEmpty) then}
    AbrirFormNormal(TFEveServicioCorral.Create(self));
 { else
  begin
    MostrarMensaje(tmAdvertencia, 'No hay potreros disponibles para la creaci�n del servicio.');
    If (MostrarMensaje(tmConsulta, 'Desea agregar un potrero al establecimiento?') = mrYes) then
    begin
      AAbmPotrerosExecute(nil);
      AEveServicioCorralExecute(nil);
    end;
  end; }
  AgregarAccion(AEveServicioCorral.Name,'Servicio A Corral',2,JvIEventos3N,JvFolEServicios,'SAC');
end;

procedure TFPrincipal.AEveMedicionFrameExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveMedicionFrame.Create(self));
  AgregarAccion(AEveMedicionFrame.Name,'Medicion de Frame',2,JvIEventos3N,JvFolECria,'MDF');
end;

procedure TFPrincipal.AEvePesoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEvePeso.Create(self));
  AgregarAccion(AEvePeso.Name,'Peso',2,JvIEventos3N,JvFolEGral,'PES');
end;

procedure TFPrincipal.AEveSincronizacionCeloExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveSincronizacionCelo.Create(self));
  AgregarAccion(AEveSincronizacionCelo.Name,'Sincronizacion de Celo',2,JvIEventos3N,JvFolEServicios,'SDC');
end;

procedure TFPrincipal.AEveTratamientoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveTratamiento.Create(self));
  AgregarAccion(AEveTratamiento.Name,'Aplicacion de Tratamiento',2,JvIEventos3N,JvFolESanitarios,'ADT');
end;

procedure TFPrincipal.SetEstablecimientoActual(const Value: Integer);
begin
  FEstablecimientoActual := Value;
  DMSoftvet.IBQEstablecimiento.Locate('id_establecimiento',VarArrayOf([Value]), [] );
  // Hay que recuperar el nombre del veterinario y si es version veterianario o productor
//  FNombreVeterinario := 'Hay que recuperarlo';
  FNombrePropietario := DMSoftvet.IBQEstablecimiento.FieldByName('propietario').AsString;
  leerDatosPais();//lee los datos del pais
  FNombreEstablecimiento := DMSoftvet.IBQEstablecimiento.FieldByName('nombre').AsString;
  DMSoftvet.IBQEscalaCondCorp.Close;
  DMSoftvet.IBQEscalaCondCorp.ParamByName('establecimiento').AsInteger := Value;
  DMSoftvet.IBQEscalaCondCorp.open;

  LEstabActual.Caption := 'Establecimiento: '+FNombreEstablecimiento;

  EscalaCondicionCorporal := DMSoftvet.IBQEscalaCondCorp.FieldByName('valor').Value;

  DMSoftvet.IBQCUIGActual.Close;
  DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := Value;
  DMSoftvet.IBQCUIGActual.Open;

  {setCUIGActual(DMSoftvet.IBQCUIGActual.fieldByName('ID_CUIG').AsInteger);
  setCUIG(DMSoftvet.IBQCUIGActual.fieldByName('ENCABEZADO').AsString);
  setUltimoIdent(DMSoftvet.IBQCUIGActual.fieldByName('ULTIMO_IDENTIFICADOR').AsString);}

  {SBUniversal.Panels[0].Width:= Length(' '+ FNombreEstablecimiento + ' ')*6;
  SBUniversal.Panels[0].Text := FNombreEstablecimiento;}  //Version 1.5

  //VerificarAlarmasServicio();
  FormActivate(nil);

  LEstabVal.Caption := FNombreEstablecimiento;
  LPropVal.Caption := FNombrePropietario;
end;

procedure TFPrincipal.SetUsuarioActual(const Value: Integer);
begin
  try
    FUsuarioActual := Value;
    //SBUniversal.Panels[1].Text := DMSoftvet.IBQUsuario.FieldByName('nombre').AsString;
    //LUsrVal.Caption := SBUniversal.Panels[1].Text; //Version 1.5
    FRolUsuarioActual:= verificarRol(Value);
    LTipoUsrVal.Caption := FRolUsuarioActual;
    ComponentesVisiblesPorPais(Pais);
  except on e:Exception do
    begin
    end;
  end;
end;

procedure TFPrincipal.ARepEstadoServicioExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPServicio.Create(self));
  AgregarAccion(ARepEstadoServicio.Name,'Estado de Servicios',3,JvIReportes3N,JvFolRServicios,'EDS');
end;

procedure TFPrincipal.ARepHistoriaAnimalExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPHistoriaAnimal.Create(self));
end;

procedure TFPrincipal.AGenFichaAnimalExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal({TFREPHistoriaAnimal.Create(Self)}TFSelectorAnimales.Create(self));
  AgregarAccion(AGenFichaAnimal.Name,'Ficha del Animal',1,nil,JvFolSelector,'');
end;

function TFPrincipal.VerificarAcrobat : Boolean;
begin
  {Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Result := Reg.OpenKey('SOFTWARE\Adobe\Acrobat Reader\9.0',false);
  Reg.Destroy;}
  Result := true;
end;

function TFPrincipal.isHuella(drive: string): boolean;
begin
  Result := DirectoryExists(pChar(drive)+'versionPENDRIVE');
end;

function TFPrincipal.findPendrive(): string;
var
  r: LongWord;
  Unidades: array[0..128] of char;
  pUnidad: pchar;
begin
  Result := '';
  r := GetLogicalDriveStrings(sizeof(Unidades), Unidades);
  if r = 0 then exit;
  if r > sizeof(Unidades) then
    raise Exception.Create(SysErrorMessage(ERROR_OUTOFMEMORY));
  pUnidad := Unidades;  // Apunta a la primera unidad
  while pUnidad^ <> #0 do
  begin
    if (GetDriveType(pUnidad) = DRIVE_REMOVABLE) and
        (StrUpper(pUnidad) <> 'A:\') and
        (StrUpper(pUnidad) <> 'B:\') and
        isHuella(pUnidad) then
    begin
      Result := pUnidad;
      exit;
    end;
    inc(pUnidad, 4);  // Apunta a la siguiente unidad
  end;
end;

procedure TFPrincipal.LLinkAcrobatClic(Sender : TObject);
begin
  {$IFDEF PEN}
    if DirectoryExists(findPendrive+'Utilidades\Acrobat-Reader-9.0\') then
      WinExec(PAnsiChar(findPendrive+'Utilidades\Acrobat-Reader-9.0\AdbeRdr933_es_ES.exe'),SW_HIDE)
    else
      ShellExecute(Application.MainForm.Handle ,'open',PChar('www.softhuella.com.ar/AcrobatReader9.exe'), nil, nil, SW_MAXIMIZE);
  {$ELSE}
    if DirectoryExists('C:\TEMP\HUELLA\Utilidades\Acrobat-Reader-9.0') then
      WinExec(PAnsiChar('C:\TEMP\HUELLA\Utilidades\Acrobat-Reader-9.0\AdbeRdr933_es_ES.exe'),SW_HIDE)
    else
      ShellExecute(Application.MainForm.Handle ,'open',PChar('www.softhuella.com.ar/AcrobatReader9.exe'), nil, nil, SW_MAXIMIZE);
  {$ENDIF}
end;

function TFPrincipal.VerificarNuevaVersion : Boolean;
begin
  Result := FileExists(ExtractFilePath(Application.ExeName)+'VersionControl.vlf');
end;

procedure TFPrincipal.CargarFuncionesHabilitadas;
var
  PathCfg, PathCfg2, Val : String;
  ArchCfg, ArchCfg2 : TextFile;
  Num : Integer;
  NuevaVersion : Boolean;

begin
  FuncCaravanasElectronicas := false;
  FuncImagenesNuevas := false;
  FuncActividad := false;
  FuncCalidadCarne := false;
  FuncDEPs := false;
  FuncGenealogia := false;
  FuncProduccion := false;
  FuncSRA := false;
  FuncTransferencia := false;
  FuncPanel := false;
  FuncSincro := false;
  FuncExcel := false;
  FuncFenotipos := false;
  FuncCambioActividad := false;
  NuevaVersion := VerificarNuevaVersion;

  PathCfg := ExtractFilePath(Application.ExeName)+'HuellaFunc.cfg';
  if FileExists(PathCfg) then
  begin
    AssignFile(ArchCfg,PathCfg);
    Reset(ArchCfg);

    Readln(ArchCfg,Val);
    if TryStrToInt(Val,Num) then
      FuncActividad := Num = 1
    else
      FuncActividad := false;

    Readln(ArchCfg,Val);
    if TryStrToInt(Val,Num) then
      FuncCalidadCarne := Num = 1
    else
      FuncCalidadCarne := false;

    Readln(ArchCfg,Val);
    if TryStrToInt(Val,Num) then
      FuncDEPs := Num = 1
    else
      FuncDEPs := false;

    Readln(ArchCfg,Val);
    if TryStrToInt(Val,Num) then
      FuncGenealogia := Num = 1
    else
      FuncGenealogia := false;

    Readln(ArchCfg,Val);
    if TryStrToInt(Val,Num) then
      FuncProduccion := Num = 1
    else
      FuncProduccion := false;

    Readln(ArchCfg,Val);
    if TryStrToInt(Val,Num) then
      FuncSRA := Num = 1
    else
      FuncSRA := false;

    Readln(ArchCfg,Val);
    if TryStrToInt(Val,Num) then
      FuncTransferencia := Num = 1
    else
      FuncTransferencia := false;


    if NuevaVersion then
    begin
      Readln(ArchCfg,Val);
      if TryStrToInt(Val,Num) then
        FuncSincro := Num = 1
      else
        FuncSincro := false;

      Readln(ArchCfg,Val);
      if TryStrToInt(Val,Num) then
        FuncPanel := Num = 1
      else
        FuncPanel := false;

      Readln(ArchCfg,Val);
      if TryStrToInt(Val,Num) then
        FuncExcel := Num = 1
      else
        FuncExcel := false;

      Readln(ArchCfg,Val);
      if TryStrToInt(Val,Num) then
        FuncFenotipos := Num = 1
      else
        FuncFenotipos := false;

      Readln(ArchCfg,Val);
      if TryStrToInt(Val,Num) then
        FuncImagenesNuevas := Num = 1
      else
        FuncImagenesNuevas := false;

      Readln(ArchCfg,Val);
      if TryStrToInt(Val,Num) then
        FuncCaravanasElectronicas := Num = 1
      else
        FuncCaravanasElectronicas := false;
      try
        Readln(ArchCfg,Val);
        if TryStrToInt(Val,Num) then
           FuncCambioActividad := Num = 1
        else
           FuncCambioActividad := false;
       except
         FuncCambioActividad := true;
       end;
    end
    else
    begin
      FuncSincro := false;
      FuncPanel := false;
      FuncExcel := false;
      FuncFenotipos := false;
      FuncCaravanasElectronicas := false;
      FuncImagenesNuevas := false;
      FuncCambioActividad := false;
    end;

    CloseFile(ArchCfg);
  end
  else
  begin
    AssignFile(ArchCfg,PathCfg);
    Rewrite(ArchCfg);
    if (TipoVersionLicencia = 'Basico') or (TipoVersionLicencia = 'Estandar') then
    begin
      FuncActividad := false;
      FuncCalidadCarne := false;
      FuncDEPs := false;
      FuncGenealogia := false;
      FuncProduccion := false;
      FuncSRA := false;
      FuncTransferencia := false;
      Writeln(ArchCfg,'0');
      Writeln(ArchCfg,'0');
      Writeln(ArchCfg,'0');
      Writeln(ArchCfg,'0');
      Writeln(ArchCfg,'0');
      Writeln(ArchCfg,'0');
      Writeln(ArchCfg,'0');
      if NuevaVersion then
      begin
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'1');
        Writeln(ArchCfg,'1');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'1');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        FuncSincro := false;
        FuncPanel := true;
        FuncExcel := true;
        FuncFenotipos := false;
        FuncImagenesNuevas := true;
        FuncCaravanasElectronicas := false;
        FuncCambioActividad := false;
      end
      else
      begin
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        FuncSincro := false;
        FuncPanel := false;
        FuncExcel := false;
        FuncFenotipos := false;
        FuncImagenesNuevas := false;
        FuncCaravanasElectronicas := false;
        FuncCambioActividad := false;
      end;
    end
    else
    begin
      FuncActividad := true;
      FuncCalidadCarne := true;
      FuncDEPs := true;
      FuncGenealogia := true;
      FuncProduccion := true;
      FuncSRA := true;
      FuncTransferencia := true;
      Writeln(ArchCfg,'1');
      Writeln(ArchCfg,'1');
      Writeln(ArchCfg,'1');
      Writeln(ArchCfg,'1');
      Writeln(ArchCfg,'1');
      Writeln(ArchCfg,'1');
      Writeln(ArchCfg,'1');
      if NuevaVersion then
      begin
        Writeln(ArchCfg,'1');
        Writeln(ArchCfg,'1');
        Writeln(ArchCfg,'1');
        Writeln(ArchCfg,'1');
        Writeln(ArchCfg,'1');
        Writeln(ArchCfg,'1');
        Writeln(ArchCfg,'1');
        FuncExcel := true;
        FuncSincro := true;
        FuncPanel := true;
        FuncFenotipos := true;
        FuncImagenesNuevas := true;
        FuncCaravanasElectronicas := true;
        FuncCambioActividad := true;
      end
      else
      begin
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        Writeln(ArchCfg,'0');
        FuncExcel := false;
        FuncSincro := false;
        FuncPanel := false;
        FuncFenotipos := false;
        FuncImagenesNuevas := false;
        FuncCaravanasElectronicas := false;
        FuncCambioActividad := false;
      end;
    end;
    CloseFile(ArchCfg);
  end;

end;

procedure TFPrincipal.FormCreate(Sender: TObject);
var
  PathCfg, PathCfg2, Val : String;
  Ini : TiniFile;
  ArchCfg, ArchCfg2 : TextFile;
  Num : Integer;
  NuevaVersion : Boolean;
  //F : TFEducacionContinua;

begin
  {$IFDEF EC}
   { F := TFEducacionContinua.Create(self);
    F.ShowModal;
    SalidaEC := F.Salida;
    if SalidaEC = 0 then
      Application.Terminate; }
  {$ENDIF}
  h_version := 'Versi�n 4.4';
  try
    Self.DoubleBuffered := true;
    firstLog := true;

    try
      CargarBottomImgHints(ExtractFilePath(Application.ExeName)+'Imagenes\BottomHint.png');
      CargarCenterImgHints(ExtractFilePath(Application.ExeName)+'Imagenes\CenterHint.png');
      CargarTopImgHints(ExtractFilePath(Application.ExeName)+'Imagenes\TopHint.png');
    except

    end;

    CantMaximaDeAnimales := 100000;
    CantMaximaDeEstablecimientos := 1000;
    OpcionDeEstablecimiento := 1;
    try
      PathCfg2 := ExtractFilePath(Application.ExeName)+'CfgInicial.dlf';
      if FileExists(PathCfg2) then
      begin
        AssignFile(ArchCfg2,PathCfg2);
        Reset(ArchCfg2);

        Readln(ArchCfg2,Val);
        if TryStrToInt(Val,Num) then
          OpcionDeEstablecimiento := Num
        else
          OpcionDeEstablecimiento := 0;

        Readln(ArchCfg2,Val);
        if TryStrToInt(Val,Num) then
          CantMaximaDeEstablecimientos := Num
        else
          CantMaximaDeEstablecimientos := 0;

        Readln(ArchCfg2,Val);
        if TryStrToInt(Val,Num) then
          CantMaximaDeAnimales := Num
        else
          CantMaximaDeAnimales := 0;
      end;
    except
    end;


    AsistenteMapa:=false;
    AsistenteCargaMasiva:=false;
    AsistenteCMasivaPlanilla:=false;

  {  MonitorBckBaseDatos := TThreadBckBase.Create;
    MonitorBckBaseDatos.Resume; }

    MAX_ANIMALES := 5;
    MAX_EVENTOS := 5;
    MAX_REPORTES := 6;

    CantMaximaDeAnimales := 10000000;
    CantMaximaDeEstablecimientos := 5000;

    Cant_MiHuella := 1;

    MuestraFenotipos := false;
    ConfiguroLector := false;

    inherited;

    Ini := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
    FNombreVeterinario := Ini.ReadString('Sistema', 'Usuario', '');
    FNombreEmpresa:= Ini.ReadString('Sistema', 'Empresa', '');
    TipoVersionLicencia:= Ini.ReadString('Sistema', 'Version', '');
    if Ini.SectionExists('Accesos') then
      AccesosVisibles := Ini.ReadBool('Accesos','Visible',true)
    else
    begin
      Ini.WriteBool('Accesos','Visible',true);
      AccesosVisibles := true;
    end;
    if Ini.SectionExists('MasUsados') then
      UsadosVisibles := Ini.ReadBool('MasUsados','Visible',true)
    else
    begin
      Ini.WriteBool('MasUsados','Visible',true);
      UsadosVisibles := true;
    end;
    if Ini.SectionExists('Ejecuciones') then
      Cant_Ejecuciones := Ini.ReadInteger('Ejecuciones','Cantidad',0)
    else
    begin
      Ini.WriteInteger('Ejecuciones','Cantidad',0);
      Cant_Ejecuciones := 0;
    end;
    if (Ini.ReadString('Sistema', 'TipoVersion', '') = '') then
      begin
        {$IFDEF PRODUCTORES}
            Ini.WriteString('Sistema','TipoVersion','Productores');
        {$ELSE}
             Ini.WriteString('Sistema','TipoVersion','Veterinarios');
        {$ENDIF}
      end;
    //WindowState := wsMaximized;
    Position:= poScreenCenter;
  except
  end;

  //Verificacion de Idioma

  NuevaVersion := VerificarNuevaVersion;
  LogginLoading('Nueva version chequeada');


  RazaAngus := false;
  RazaBraford := false;
  RazaBrangus := false;

  CargarFuncionesHabilitadas;

  FuncImagenesNuevas := true;

 {$IFDEF PEN}
 {$ELSE}

   {$IFDEF DEMO}
   {$ELSE}
   if not VerificarServidorBD then
   begin
      Application.Terminate;
   end;
  {$ENDIF}
  {$ENDIF}

  conectarBD();
  LogginLoading('BBDD Conectada');
  // NO SE PUDO CONECTAR CON LA BBDD
  if ( not IBDPrincipal.Connected ) then
  begin
     MostrarMensaje(tmError, 'Base de Datos innacessible'+
                              ServidorBD + DirBD +']'+ 'La aplicacion se cerrar�.');
     FPrincipal.Close();
     Application.Terminate();
  end;


  _PUERTO_S.Brate := TVaBaudRate(br9600);
  _PUERTO_S.Btooth := false;
  _PUERTO_S.CPort := 1;
  _PUERTO_S.DBits := TVaDatabits(db8);
  _PUERTO_S.FControl := 0;
  _PUERTO_S.IdFabri := 982;
  _PUERTO_S.Pari := TVaParity(0);
  _PUERTO_S.Puerto := 'COM1';
  _PUERTO_S.SBits := TVaStopbits(sb1);

  _USO_DISP := false;

  AbrirImagenes(self);
  InicGrillas;
  AcomodarImagenes;
  LogginLoading('Imagenes cargadas OK');
  /////////////////////////
  //Esto es para cuando se actualiza el actualizador
  if FileExists(ExtractFilePath(Application.ExeName)+'Actualizador.exe') then
  begin
    if FileExists(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe') then
    begin
      DeleteFile(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe');
      MoveFile(PAnsiChar(ExtractFilePath(Application.ExeName)+'Actualizador.exe'),PAnsiChar(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe'))
    end
    else
    begin
      DeleteFile(ExtractFilePath(Application.ExeName)+'Huella Update\Actualizador.exe');
      MoveFile(PAnsiChar(ExtractFilePath(Application.ExeName)+'Actualizador.exe'),PAnsiChar(ExtractFilePath(Application.ExeName)+'Huella Update\Actualizador.exe'))
    end;
  end;
  ////////////////////////////////////////////////////

  ///Esto es para saber si el sistema fue actualizado con errores
  if FileExists(ExtractFilePath(Application.ExeName)+'Error_Act.huella') then
  begin
    if MostrarMensaje(tmConsulta,'Huella ha sido actualizado con errores. Para poder utilizarlo debe actualizar nuevamente.Desea actualizar ahora?') = mrYes then
       winexec(PChar(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe'),0);
    Application.Terminate;
  end;

end;

function TFPrincipal.CompararFechas(fecha : TDate) : Boolean;
begin
  Result := true;
 { try
    if FileExists(ExtractFilePath(Application.ExeName)+'\fechas.hll') then
    begin
      AssignFile(arch,ExtractFilePath(Application.ExeName)+'\fechas.hll');
      reset(arch);
      readln(arch,f);
      closefile(arch);
      fecha_vieja := StrToDate(f);
      if CompareDate(fecha_vieja,fecha) = GreaterThanValue then
      begin
        {if (MostrarMensaje(tmConsulta,'La base de datos debe ser actualizada antes de ejecutarse el sistema. Desea descargar la actualizaci�n? ') = mrYes ) then
          ShellExecute(Application.MainForm.Handle ,'open',PChar('http://www.softhuella.com.ar/Huella_Actualizador.exe'), nil, nil, SW_MAXIMIZE);}
  {      Result := false;
      end;
    end;
  except
  end; }
end;

procedure TFPrincipal.ActualizarXML(Fecha : TDate);
var
  XMLClient : TXMLDocument;
  Nodo : IXMLNode;
  Path : String;
  Encuentra : Boolean;
  function BuscarNodo(Nodo : IXMLNode; var Encontro : Boolean) : IXMLNode;
  var
    I : Integer;
  begin
    if Nodo.Attributes['tipo'] = 'tnScripts' then
    begin
      Encontro := true;
      Result := Nodo;
    end
    else
      for I := 0 to Nodo.ChildNodes.Count - 1 do
        if not Encontro then
          Result := BuscarNodo(Nodo.ChildNodes[I],Encontro); 
  end;
begin
  Encuentra := false;
  Path := ExtractFilePath(Application.ExeName)+'Huella Update 1.5\';
  XMLClient := TXMLDocument.Create(self);
  XMLClient.DOMVendor := GetDOMVendor('MSXML');
  XMLClient.LoadFromFile(Path+'UpdateClient.xml');
  XMLClient.Active := true;
  Nodo := BuscarNodo(XMLClient.ChildNodes.FindNode('UpdateInfo'),Encuentra);
  if Nodo <> nil then
    Nodo.Attributes['fecha'] := DateToStr(Fecha)
  else
    raise Exception.Create('No se pudo actualizar el archivo XML');
  XMLClient.SaveToFile(Path+'UpdateClient.XML');
end;

function TFPrincipal.VerificarVersion(Base : String) : Boolean;
var
  cant_est : Integer;
begin
    Result := true;
    IBQEstablecimientos.Close;
    IBQEstablecimientos.Open;
    IBQEstablecimientos.First;
    cant_est := 0;
    while not IBQEstablecimientos.Eof do
    begin
      {$IFDEF PRODUCTORES}
      if cant_est > 1 then
      begin
        Result := false;
        break;
      end;
      {$ELSE}
      if cant_est > 3 then
      begin
        Result := false;
        break;
      end;
      {$ENDIF}
      IBQAnimales.Close;
      IBQAnimales.ParamByName('esta').AsInteger := IBQEstablecimientos.FieldValues['id'];
      IBQAnimales.Open;
      if IBQAnimales.FieldByName('cant').AsInteger > 1000 then
      begin
        Result := false;
        break;
      end;
      Inc(cant_est);
      IBQEstablecimientos.Next;
    end;
end;

function TFPrincipal.VerificarServidorBD : Boolean;
const
  Max = 1000000000;
var
  Reg : TRegistry;
  Comando : String;
  I : Integer;
begin
  I := 0;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  if Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',false) then
    Comando := Reg.ReadString('Firebird')
  else
    Comando := '';
  Reg.Destroy;
  if not UprocessViewer.IsFileActive('fbserver.exe') then
  begin
    if Comando = '' then
    begin
      MostrarMensaje(tmError,'No se puede iniciar al servidor de Base de Datos. Por favor comuniquese con el servicio tecnico de Huella Software. Disculpe las molestias');
      Application.Terminate;
    end
    else
    begin
        winexec(PAnsiChar(Comando),SW_HIDE);
        while (not UProcessViewer.IsFileActive('fbserver.exe')) and (I < Max) do
          Inc(I);
        if I < Max then
        begin
          Result := true;
          Exit;
        end
        else
        begin
          MostrarMensaje(tmError,'No se puede iniciar al servidor de Base de Datos. Por favor comuniquese con el servicio tecnico de Huella Software. Disculpe las molestias');
          Application.Terminate;
        end;
    end;
  end
  else
  begin
    Result := true;
    Exit;
  end;
end;

procedure TFPrincipal.leerParametrosConexion(
    var DirBD, ServidorBD: String);
var
  AppPath: String;
  Ini,IniID : TiniFile;

begin
    AppPath := ExtractFilePath(Application.ExeName);
    Ini := TIniFile.Create(AppPath+'CONECTION.INI');
    if Ini.SectionExists('CONECTION') then
    begin
      DirBD := Ini.ReadString('CONECTION','DIRECTION','');
      if ExtractFilePath (DirBD) = '' then
      begin
        DirBD := AppPath+'HUELLA.FDB';
        Ini.WriteString('CONECTION','DIRECTION',DirBD);
      end;
      ServidorBD := Ini.ReadString('CONECTION','SERVER','');
    end
    else
    begin
      DirBD := '';
      ServidorBD := '';
    end;
end;

function TFPrincipal.conectarBD: Boolean;
var
    i:integer;
    dir,  servidor : String;
    fecha : TDate;
    Archivo : TextFile;
    hexa : string;
    pen: String;
    AppPath: String;
    Ini,IniID : TiniFile;
begin
  // La conexion a la base debe hacerse antes del inherited
  // para que funcione el IBSPEstadisticas del Universal
  IBDPrincipal.Connected := False;
  AppPath := ExtractFilePath(Application.ExeName);
  CopyFile(pChar(AppPath+'huella.fdb'),pchar(AppPath+'huella_1.fdb'),false);

  ConectadoAServidor := false;

  {$IFDEF PEN}
  if TipoVersionLicencia = 'Full' then
  begin
    pen := findPendrive;
    pen := pen + 'VersionPENDRIVE\huella.fdb';
    CopyFile(pChar(pen),pChar(AppPath+'huella.fdb'),false);
  end;
  {$ENDIF}

  try
    leerParametrosConexion(DirBD, ServidorBD);

    ConectadoAServidor := false;
    // Intenta conectarse de forma remota a otro servidor
    if (ServidorBD <> '') and (DirBD <> '') then
    begin
      try
        IBDPrincipal.Connected := false;
        IBDPrincipal.DatabaseName := ServidorBD+':'+DirBD;
        IBDPrincipal.Connected := true;
        FPrincipal.Caption := 'Huella '+h_version+' [Connected to:'+  ServidorBD+']';
        ConectadoAServidor := true;
      finally
        if not ConectadoAServidor then
        begin
          IBDPrincipal.DatabaseName := AppPath + 'huella.fdb';
          IBDPrincipal.Connected := True;
          ConectadoAServidor := true;
          FPrincipal.Caption := 'Huella '+h_version+'. [Connected with default ]';
          MostrarMensaje(tmError,'No se puede conectar al servidor: '+ServidorBD+' - '+DirBD +'. Se trabajara con la base de datos local');
        end;
      end;
    end
    else
    // Intenta conectarse a una BBDD por nombre
    if (ServidorBD = '') and (dirBD <>'') then
    begin
        try
        IBDPrincipal.Connected := false;
        IBDPrincipal.DatabaseName := dirBD;
        IBDPrincipal.Connected := true;
        ConectadoAServidor := true;
        FPrincipal.Caption := 'Huella '+h_version+' [Connected to:'+  dirBD+']';
      finally
        if not ConectadoAServidor then
        begin
          IBDPrincipal.DatabaseName := dir + 'huella.fdb';
          IBDPrincipal.Connected := True;
          ConectadoAServidor := true;
          FPrincipal.Caption := 'Huella '+h_version+'. [Connected with default ]';
          MostrarMensaje(tmError,'No se pudo encontrar la Base: '+DirBD +'. Se trabajara con la base de datos local');
        end;
      end;
    end;

  except on e:Exception do
    begin
     MostrarMensaje(tmError, Traducir('No se pudo acceder a la base de datos.') + #13 + Traducir('Detalle:  ') + e.Message);
     Application.Terminate;     
    end;
  end;

   if not   ConectadoAServidor then
// Por defecto, busca la BBDD que esta en el mismo directorio
    begin
      IBDPrincipal.DatabaseName := AppPath + 'huella.fdb';
      IBDPrincipal.Connected := True;
      ConectadoAServidor := true;
      FPrincipal.Caption := 'Huella '+h_version+'. [Connected with default ]';
    end;


    try
      IniID := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Huella.ini');
      Idioma := IniID.ReadInteger('Sistema','Idioma',1);
      if Idioma = 1 then
        IniID.WriteInteger('Sistema','Idioma',1);
    finally
      IniID.Destroy;
    end;
    FTraduccion := TFTraduccion.Create(self);
    IBQFechas.Close;
    IBQFechas.Open;
    {$IFDEF DEMO}
      if FileExists(ExtractFilePath(Application.ExeName)+'\ce.hll') then
      begin
        AssignFile(Archivo,ExtractFilePath(Application.ExeName)+'\ce.hll');
        Reset(Archivo);
        Readln(Archivo,Hexa);
        CloseFile(Archivo);
        try
          IBQSetEjecuciones.Close;
          IBQSetEjecuciones.ParamByName('ce').AsInteger := StrToInt('$'+Hexa);
          IBQSetEjecuciones.Open;
          IBTPrincipal.CommitRetaining;
        except
          IBTPrincipal.RollbackRetaining;
        end;
        DeleteFile(ExtractFilePath(Application.ExeName)+'\ce.hll');
      end;
    {$ENDIF}
    fecha := IBQFechas.FieldValues['fecha'];
    if not CompararFechas(fecha) then
    begin
      ActualizarXML(fecha);
      raise EAbort.Create('No podra ejecutar huella hasta que no haya sido actualizado');
    end
    else
      ActualizarBD();

    //ActualizarBD();
    for i:= 0 to ComponentCount-1 do
      begin
        if (self.components[i] is TMenuItem) and (TMenuItem(self.components[i]).action <> nil) then
           TMenuItem(self.components[i]).action.OnUpdate:= ActualizarEnCascada;
      end;
      DMSoftvet:=nil;
    if (DMSoftvet = nil) then
      begin
        Application.CreateForm(TDMSoftvet, DMSoftvet); // lo crea solo si se puede conectar a la base
      end;
    NombreServidor:= servidor;
end;

procedure TFPrincipal.AEveAltaMasivaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFEveAltaMasiva.Create(self));
  //AgregarAccion(AEveAltaMasiva.Name,'Carga Masiva',1,JvAnimales3N,JvFolMovimiento,'CMA');
end;

procedure TFPrincipal.ARepAltaDirectaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPListadoAlta.Create(Self));
  AgregarAccion(ARepAltaDirecta.Name,'Carga Individual',3,JvIReportes3N,JvFolMovimiento,'CIA');
end;

procedure TFPrincipal.ARepStockSimpleExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPStockSimple.Create(Self));
  AgregarAccion(ARepStockSimple.Name,'Stock Simple',3,JvIReportes3N,JvFolRGral,'SSL');
end;

procedure TFPrincipal.ARepDenunciaServicioExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPDenunciaServicio.Create(Self));
  AgregarAccion(ARepDenunciaServicio.Name,'Denuncia de Servicios',3,JvIReportes3N,JvFolRSRA,'DDS');
end;

procedure TFPrincipal.AAbmGruposExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMGruposNuevo.Create(Self));
  AgregarAccion(AAbmGrupos.Name,'Grupos',1,nil,JvFolGrupos,'');
end;

procedure TFPrincipal.ActivarAcciones;
var nombreAccion : string;
    i : integer;
begin
  try
    DMSoftvet.IBQSeguridad.First;
    while not(DMSoftvet.IBQSeguridad.Eof) do
    begin
      nombreAccion := DMSoftvet.IBQSeguridad.FieldValues['NOMBRE'];
      for i:= 0 to ALUniversal.ActionCount - 1 do
        if nombreAccion = ALUniversal.Actions[i].Name then
         begin
          TAction(ALUniversal.Actions[i]).Enabled := PuedeAcceder(TAction(ALUniversal.Actions[i]));
          TAction(ALUniversal.Actions[i]).Update;
         end;
      DMSoftvet.IBQSeguridad.Next;
    end;
    {$IFDEF DEMO}
      {$IFDEF EC}
      {$ELSE}
        AEveEliminarAnimal.Enabled := false;
        AGenRestaurar.Enabled := false;
      {$ENDIF}
    {$ENDIF}
  except on e:Exception do
    begin
    end;
  end;
end;

procedure TFPrincipal.DesActivarAcciones;
var i : integer;
begin
    for i:= 0 to ALUniversal.ActionCount - 1 do
       if ALUniversal.Actions[i].Name <> 'AGenSalir' then
          TAction(ALUniversal.Actions[i]).Enabled := False
         else
          TAction(ALUniversal.Actions[i]).Enabled := True;
end;

procedure TFPrincipal.ActualizarEnCascada(Sender: TObject);
var i: integer;
    LMenuItem: TMenuItem;
begin
   if (sender is TAction) and TAction(sender).Enabled then //visible then
   for i:= 0 to ComponentCount-1 do
   begin
      if (self.components[i] is TMenuItem) and (TMenuItem(self.components[i]).action <> nil)
         and (TMenuItem(self.components[i]).action.Name = Taction(sender).Name) then
      begin
         LMenuItem:= TMenuItem(self.components[i]).Parent;
         while true do
         begin
            if LMenuItem = nil then break;
            LMenuItem.Enabled := True; //visible := true;
            LMenuItem:= LMenuItem.Parent;
         end;
         break;
      end
   end
end;

procedure TFPrincipal.AGenAlarmasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFAgenda.Create(Self));
end;

procedure TFPrincipal.AGenParametrosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFModificacionParametros.Create(self));
end;

procedure TFPrincipal.AEveAltaSemenExecute(Sender: TObject);
begin
  inherited;
  if FuncTransferencia then
  begin
    AbrirFormNormal(TFMovimientosdeSemenCompra.Create(self));
    AgregarAccion(AEveAltaSemen.Name,'Semen - Alta',1,JvAnimales3N,JvFolSemen,'SEA');
  end
  else
  begin
     MostrarMensaje(tmInformacion, 'No disponible en esta versi�n');
  end

end;

procedure TFPrincipal.AEveExtraccionSemenExecute(Sender: TObject);
begin
  inherited;

  if FuncTransferencia then
  begin
    AbrirFormNormal(TFMovimientosdeSemenExtraccion.Create(self));
    AgregarAccion(AEveExtraccionSemen.Name,'Semen - Extraccion',1,JvAnimales3N,JvFolSemen,'SEE');
  end
  else
  begin
     MostrarMensaje(tmInformacion, 'No disponible en esta versi�n');
  end;

end;

procedure TFPrincipal.AEveSangradoBrucelosisExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveEnfermedadesMasivas.Create(self, memSangradoBrucelosis));
  AgregarAccion(AEveSangradoBrucelosis.Name,'Sangrado para Brucelosis',2,JvIEventos3N,JvFolESanitarios,'SPB');
end;

procedure TFPrincipal.AEveTuberculinizacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveEnfermedadesMasivas.Create(self, memTuberculinizacion));
  AgregarAccion(AEveTuberculinizacion.Name,'Tuberculinizacion',2,JvIEventos3N,JvFolESanitarios,'TBR');
end;

procedure TFPrincipal.AEveRaspadoTorosExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveEnfermedadesMasivas.Create(self, memRaspadoToro));
  AgregarAccion(AEveRaspadoToros.Name,'Muestreo de Toros por Venerea',2,JvIEventos3N,JvFolESanitarios,'MTV');
end;

procedure TFPrincipal.AAbmCategoriasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMCategorias.Create(self));
end;

procedure TFPrincipal.AAbmCausasDistociaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMCausasDistocia.Create(self));
end;

procedure TFPrincipal.AAbmCentrosInseminacionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMCentrosInseminacion.Create(self));
end;

procedure TFPrincipal.AAbmCondicionesCorporalesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMCondicionCorporal.Create(self));
end;

procedure TFPrincipal.AAbmCronologiasDentariasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMCronologiaDentaria.Create(self));
end;

procedure TFPrincipal.AAbmEnfermedadesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMEnfermedades.Create(self));
end;

procedure TFPrincipal.AAbmEstadosReproductivosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMEstadoReproductivo.Create(self));
end;

procedure TFPrincipal.AAbmExamenesFertilidadExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMExamenesFertilidad.Create(self));
end;

procedure TFPrincipal.AAbmGdrExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMGdr.Create(self));
end;

procedure TFPrincipal.AAbmGradosAsistenciaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMGradosAsistencia.Create(self));
end;

procedure TFPrincipal.AAbmMetodosCastracionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMMetodosCastracion.Create(self));
end;

procedure TFPrincipal.AAbmMetodosDiagnosticoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMMetodosDiagnostico.Create(self));
end;

procedure TFPrincipal.AAbmMetodosExamenSanitarioExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMMetodosExamenSanitario.Create(self));
end;

procedure TFPrincipal.AAbmMetodosSincronizacionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMMetodosSincronizacion.Create(self));
end;

procedure TFPrincipal.AAbmMetodosTomaPruebaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMMetodosTomaPrueba.Create(self));
end;

procedure TFPrincipal.AAbmRazasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMRaza.Create(self));
end;

procedure TFPrincipal.AAbmRechazosPreservicioExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMRechazosPreservicio.Create(self));
end;

procedure TFPrincipal.AAbmSexosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMSexos.Create(self));
end;

procedure TFPrincipal.AAbmTecnicasTratamientoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMTecnicasTratamiento.Create(self));
end;

procedure TFPrincipal.AAbmTiposAbortoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMTipoAborto.Create(self));
end;

procedure TFPrincipal.AAbmTiposAltaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMTipoAlta.Create(self));
end;

procedure TFPrincipal.AAbmTiposBajaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMTiposBaja.Create(self));
end;

procedure TFPrincipal.AAbmTiposDesteteExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMTiposDestete.Create(self));
end;

procedure TFPrincipal.AAbmTiposEnfermedadExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMTiposEnfermedad.Create(self));
end;

procedure TFPrincipal.AAbmTiposPartoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMTiposParto.Create(self));
end;

procedure TFPrincipal.AAbmTiposTratamientoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMTipoTratamiento.Create(self));
end;

procedure TFPrincipal.AAbmValoresCapacidadExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMValoresCapacidad.Create(self));
end;

procedure TFPrincipal.AEveBajaSemenExecute(Sender: TObject);
begin
  inherited;

  if FuncTransferencia then
  begin
    AbrirFormNormal(TFBajaDeSemen.Create(self));
    AgregarAccion(AEveBajaSemen.Name,'Semen - Baja',1,JvAnimales3N,JvFolSemen,'SEB');
  end
  else
  begin
     MostrarMensaje(tmInformacion, 'No disponible en esta versi�n');
  end;

end;

procedure TFPrincipal.ARepPorcentajePrenezExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPDGPorcentajePrenez.Create(self));
  AgregarAccion(ARepPorcentajePrenez.Name,'Porcentaje Pre�ez',3,JvIReportes3N, JvFolRGestacion,'PPR');
end;

procedure TFPrincipal.ARepNoTactadasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPDGInformeNoTactadas.Create(self));
  AgregarAccion(ARepNoTactadas.Name,'Animales sin Diagnostico de Gestacion',3,JvIReportes3N,JvFolRGestacion,'ADG');
end;

procedure TFPrincipal.ARepListaTactadasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPDGAnimalesFiltrados.Create(self));
  AgregarAccion(ARepListaTactadas.Name,'Listado de Tactadas',3,JvIReportes3N,JvFolRGestacion,'LDT');
end;

procedure TFPrincipal.ARepDistribucionPrenezExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPDGDistribucionPrenezCACUCO.Create(self));
  AgregarAccion(ARepDistribucionPrenez.Name,'Distribucion de Pre�ez',3,JvIReportes3N,JvFolRGestacion,'DDP');
end;

procedure TFPrincipal.ARepVsPrenezExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPDGVersusPrenez.Create(self));
  AgregarAccion(ARepVsPrenez.Name,'Comparacion de Pre�ez',3,JvIReportes3N,JvFolRGestacion,'CDP');
end;

// property para la escala de condicion corporal
procedure TFPrincipal.SetEscalaCondicionCorporal(const Value: integer);
begin
  FescalaCondicionCorporal := Value;
  // modifico el query en el modulo de datos
  DMSoftvet.IBQCondicionCorporal.Close;
  DMSoftvet.IBQCondicionCorporal.SQL.Clear;
  DMSoftvet.IBQCondicionCorporal.SQL.Add('select id_condicion_corporal, ' + getStringEscalaCC + ' as escala from cod_condiciones_corporales');
  DMSoftvet.IBQCondicionCorporal.open;
end;

// retorno el string de la escala de la condicion corporal
function TFPrincipal.getStringEscalaCC: string;
begin
  if (FescalaCondicionCorporal = 10) then
    Result := 'valor_escala_10'
  else
    Result := 'valor_escala_5';
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var
  dir : String;
  Ini : TIniFile;
  cartel : TCartel;
  Origen, Destino : String;
  pen: String;
begin
  inherited;

  consultarDeseaBackup('Desea realizar una copia de respaldo de la base de datos?');

  if ConectadoAServidor then
  begin
    cartel := TCartel.getInstance;
    cartel.abrircartel('Cerrando el sistema');
    Origen := StringReplace(DirBD,ExtractFileDrive(DirBD),'',[]);
    Origen := '\\'+ServidorBD+Origen;
    Destino := ExtractFilePath(Application.ExeName)+'huella.fdb';
    // Solo hago esta copia en caso de que sea un sistema red, para traer la base.
    if FileExists(Destino) and (ServidorBD <> 'localhost') then
    begin
      DeleteFile(Destino);
      CopyFile(PAnsiChar(Origen),PAnsiChar(Destino),false);
    end;
    cartel.cerrarcartel;
    cartel.FreeInstance;
  end;

  dir  := ExtractFilePath(Application.ExeName);

  CopyFile(pchar(dir+'huella.fdb'),pchar(dir+'huella_2.fdb'),false);

  {$IFDEF PEN}
  if TipoVersionLicencia = 'Full' then
  begin
    pen := findPendrive;
    pen := pen + 'VersionPENDRIVE\huella.fdb';
    CopyFile(pChar(dir+'huella.fdb'),pChar(pen),false);
  end;
  {$ENDIF}

  GuardarMiHuella;

  try
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Huella.ini');
    Inc(Cant_Ejecuciones);
    Ini.WriteInteger('Ejecuciones','Cantidad',Cant_Ejecuciones);
  finally
    Ini.Destroy;
  end;

  SetLogueo(UsuarioActual,'N');
  VerificarSalida();
  Application.Terminate;
end;

procedure TFPrincipal.AGenPlanillasMangaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFPlanillasManga.Create(self,nil));
  AgregarAccion(AGenPlanillasManga.Name,'Hojas de Trabajo',4,nil,JvFolHojasManga,'HDT');
end;

procedure TFPrincipal.AAbmUsuariosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMUsuarios.Create(self));
end;

procedure TFPrincipal.AGenAsistenteEstablecimientoExecute(Sender: TObject);
var
  a : Integer;
begin
  inherited;
  if VerificarCantEstablecimientosBase then
  begin
    a := EstablecimientoActual;
    FAsistenteEstablecimiento := TFAsistenteEstablecimiento.Create(self);
    FAsistenteEstablecimiento.ShowModal;
    FAsistenteEstablecimiento.Destroy;
    ComponentesVisiblesPorPais(Pais);
    if FPrincipal.EstablecimientoActual <> a then
    begin
      leerDatosPais();
      AbrirImagenes(self);
      RedibujarPaneles;
    end;
  end;
end;

procedure TFPrincipal.AIndicesProductivosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFIndicesProductivos.Create(self));
  //AgregarAccion(AIndicesProductivos.Name,'Indices Productivos',2,JvIHerramientas3N,'IP');
end;

procedure TFPrincipal.AEveRecursoForrajeroExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFEveRecursoForrajero.Create(self));
  AgregarAccion(AEveRecursoForrajero.Name,'Potreros',2,JvIEventos3N,JvFolCEstablecimiento,'POT');
end;

procedure TFPrincipal.ARepAptasNoAptasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPPreservicio.Create(self));
  AgregarAccion(ARepAptasNoAptas.Name,'Hembras Aptas/No Aptas para Servicio',3,JvIReportes3N,JvFolRServicios,'HAS');
end;

procedure TFPrincipal.ARepGananciaDiariaPesoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPGananciaDiariaPeso.Create(self));
  AgregarAccion(ARepGananciaDiariaPeso.Name,'Ganancia Diaria de Peso',3,JvIReportes3N,JvFolRProduccion,'GDP');
end;

procedure TFPrincipal.ARepStockSemenExecute(Sender: TObject);
begin
  inherited;

  if FuncTransferencia then
  begin
    AbrirFormNormal(TFREPStockSemen.Create(self));
    AgregarAccion(ARepStockSemen.Name,'Stock de Semen',3,JvIReportes3N,JvFolSemen,'SSE');
  end
  else
  begin
     MostrarMensaje(tmInformacion, 'No disponible en esta versi�n');
  end;

end;

procedure TFPrincipal.AGenAyudaExecute(Sender: TObject);
begin
  inherited;
  {aux := PAnsiChar(copy(Application.ExeName, 0, length(Application.ExeName) -4) + '.chm');
  HtmlHelp(0, aux, HH_HELP_CONTEXT, helpcontext);}
  AAyudaExecute(Sender);
end;

procedure TFPrincipal.AGenAcercaDeExecute(Sender: TObject);
begin
  AbrirFormNormal(TFAcerca.Create(self));
end;

procedure TFPrincipal.AGenBackupExecute(Sender: TObject);
var
  F : TFBackup;
begin
  inherited;
  F := TFBackup.Create(self);
  F.guardarBD(1);
  F.Destroy;
  //AbrirFormNormal(TFBackup.Create(self));
  AgregarAccion(AGenBackup.Name,'Copiar Base de Datos',4,JvIHerramientas3N,JvFolBackup,'CBD');
end;

procedure TFPrincipal.AGenRestaurarExecute(Sender: TObject);
var
  F : TFRestaurar;
begin
  inherited;
  F := TFRestaurar.Create(self);
  F.AbrirArchivo;
  F.Destroy;
  //AbrirFormNormal(TFRestaurar.Create(self));
  AgregarAccion(AGenRestaurar.Name,'Restaurar Base de Datos',4,JvIHerramientas3N,JvFolBackup,'RBD');
end;

procedure TFPrincipal.ARepListadoEventosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPListadoEvento.Create(self));
  AgregarAccion(ARepListadoEventos.Name,'Reportes Gen�ricos',3,nil,JvFolRGenericos,'');
end;

function TFPrincipal.getNombreEstablecimiento: string;
begin
  Result := FNombreEstablecimiento;
end;

function TFPrincipal.getNombreVeterinario: string;
begin
  result := FNombreVeterinario;
end;

function TFPrincipal.getNombrePropietario: string;                                
begin
  result := FNombrePropietario;
end;

function TFPrincipal.getRenspa: string;
begin
  result := FormatMaskText('CC.CCC.C.CCCCC.CC;0;_',FRenspa);
end;
                                                           
function TFPrincipal.getTipoVersion: TTipoVersion;
begin
  result := FTipoVersion;
end;



procedure TFPrincipal.AAbmEmpleadosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMEmpleados.Create(self));
end;

procedure TFPrincipal.ARepSospechosasAbortoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPABSospechozasAborto.Create(Self));
  AgregarAccion(ARepSospechosasAborto.Name,'Hembras Sospechosas de Aborto',3,JvIReportes3N,JvFolRGestacion,'HSA');
end;

procedure TFPrincipal.ARepEvaluacionTorosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPCMEvaluacionToros.Create(Self));
  AgregarAccion(ARepEvaluacionToros.Name,'Evaluacion de Toros',3,JvIReportes3N, JvFolRSanitarios,'EDT');
end;

procedure TFPrincipal.ARepProyeccionPartosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPPAProyeccionPartos.Create(Self));
  AgregarAccion(ARepProyeccionPartos.Name,'Proyeccion de Partos',3,JvIReportes3N,JvFolRGestacion,'PDP');
end;

procedure TFPrincipal.ADOTriExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFEveTri.Create(self));
  AgregarAccion(ADOTri.Name,'Generar TRI',3,JvIReportes3N,JvFolROficial,'TRI');
end;

procedure TFPrincipal.AEveCargaBrucelosisExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCargaResultados.Create(self, memSangradoBrucelosis));
  AgregarAccion(AEveCargaBrucelosis.Name,'Carga de Resultados Brucelosis',2,JvIEventos3N,JvFolESanitarios,'CRB');
end;

procedure TFPrincipal.AEveCargaTuberculinaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCargaResultados.Create(self, memTuberculinizacion));
  AgregarAccion(AEveCargaTuberculina.Name,'Carga de Resultados Tuberculina',2,JvIEventos3N,JvFolESanitarios,'CRT');
end;

procedure TFPrincipal.AEveCargaVenereasExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCargaResultados.Create(self, memRaspadoToro));
  AgregarAccion(AEveCargaVenereas.Name,'Carga de Resultados Venereas',2,JvIEventos3N,JvFolESanitarios,'CRV');
end;

// codigo
function TFPrincipal.PuedeAcceder(accion : TAction): boolean;
var retorno : boolean;
begin
  retorno := True;
  if (FPrincipal.TipoVersion = tvProductor) and
     ((accion.Name = 'ARepAptasNoAptas') or (accion.Name = 'ARepEvaluacionToros') or
      (accion.Name = 'ARepNoTactadas') or (accion.Name = 'ARepVsPrenez') or
      (accion.Name = 'ARepSospechosasAborto')) then
    retorno := False;
  result := retorno;  
end;

procedure TFPrincipal.TimerLlaveTimer(Sender: TObject);
begin
  inherited;
//nuevo codigo
  if (not verificarLlave()) then   //llave nuevo codigo
   begin
    TimerLlave.Enabled:= false;
    If (MostrarMensaje(tmConsulta, 'Usted ha retirado la llave de seguridad de Huella. Si la tiene coloquel� en su equipo.') = mrYes) then
      begin
       TimerLlave.Enabled:= true;
      end
     else
      begin
        Fprincipal.Close;
        Application.Terminate;
      end
   end;
end;
//nuevo codigo

procedure TFPrincipal.AchicarDockSite();
begin
 { if not (MenuOpen[1] or MenuOpen [2] or MenuOpen[3]) then
  begin
    dxDSMenu.Width := dxDSMenu.Width - 257;
    IFondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\principal_'+IntToStr(Resolucion)+'.jpg');
  end; } //Version 1.5
end;

procedure TFPrincipal.AgrandarDockSite();
begin
  {if not (MenuOpen[1] or MenuOpen [2] or MenuOpen[3]) then
  begin
    dxDSMenu.Width := dxDSMenu.Width + 257;
    IFondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\principal_'+IntToStr(Resolucion)+'(Corto).jpg');
  end;} //Version 1.5
end;

procedure TFPrincipal.AcomodarDockSite(Panel : TdxDockPanel ;var PanelOpen : boolean);
begin
 { if (MenuOpen[1] or MenuOpen [2] or MenuOpen[3]) then
  begin
    if not (PanelOpen) then
      dxDSMenu.Width := dxDSMenu.Width + Panel.Width
    else
      dxDSMenu.Width := dxDSMenu.Width - Panel.Width;
  end;
  PanelOpen := not PanelOpen;
  AcomodarFondo();} //Version 1.5
end;

procedure TFPrincipal.dxDSMenuHideControl(Sender: TdxDockSite;
  AControl: TdxCustomDockControl);
begin
  inherited;
  AchicarDockSite();
end;

procedure TFPrincipal.dxDSMenuShowControl(Sender: TdxDockSite;
  AControl: TdxCustomDockControl);
begin
  inherited;
  AgrandarDockSite();
end;

procedure TFPrincipal.dxDPAnimalesAutoHideChanging(
  Sender: TdxCustomDockControl);
begin
  inherited;
  AcomodarDockSite(Sender as TdxDockPanel,MenuOpen[1]);
end;

procedure TFPrincipal.dxDPEventosAutoHideChanging(
  Sender: TdxCustomDockControl);
begin
  inherited;
  AcomodarDockSite(Sender as TdxDockPanel, MenuOpen[2]);
end;

procedure TFPrincipal.dxDPReportesAutoHideChanging(
  Sender: TdxCustomDockControl);
begin
  inherited;
  AcomodarDockSite(Sender as TdxDockPanel, MenuOpen[3]);
end;

procedure TFPrincipal.dxDPAnimalesCanResize(Sender: TdxCustomDockControl;
  NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  inherited;
  Resize := false;
end;

procedure TFPrincipal.dxDPEventosCanResize(Sender: TdxCustomDockControl;
  NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  inherited;
  Resize := false;
end;

procedure TFPrincipal.dxDPReportesCanResize(Sender: TdxCustomDockControl;
  NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  inherited;
  Resize := false;
end;

procedure TFPrincipal.ADOCertificadoPredespachoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFEveCertificadoPredespacho.Create(self));
  AgregarAccion(ADOCertificadoPredespacho.Name,'Certificado de Predespacho',3,JvIReportes3N,JvFolROficial,'CDP');
end;

// Inicio Ana Laura se agregan las acciones de los botones de los reportes de senasa
procedure TFPrincipal.ADODocTransitoElectronicoExecute(Sender: TObject);
begin
  inherited;
{ DAIANA - 19.12.2014 - Incidencia 413 - Inicio
  Documentacion transito electronico }
  AbrirFormNormal(TFDte.Create(self));
{ DAIANA - 19.12.2014 - Incidencia 413 - Fin }
  AgregarAccion(ADODocTransitoElectronico.Name,'Documento Tr�nsito Electr�nico',3,JvIReportes3N,JvFolROficial,'DTE');
end;

procedure TFPrincipal.ADOResumenMovimientosExecute(Sender: TObject);
begin
  inherited;
{ DAIANA - 12.12.2014 - Incidencia 412 - Inicio
  Abrir reporte movimientos }
  AbrirFormNormal(TFRepMovimientos.Create(self));
{ DAIANA - 12.12.2014 - Incidencia 412 - Fin }
  AgregarAccion(ADOResumenMovimientos.Name,'Resumen de Movimientos',3,JvIReportes3N,JvFolROficial,'RDM');
end;

procedure TFPrincipal.AEveDeclaracionAFIPExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveDeclaracionAFIP.Create(self));
  AgregarAccion(AEveDeclaracionAFIP.Name,'Declaraci�n AFIP',2,JvIEventos3N,JvFolECria,'DEA');
end;

// FIN Ana Laura se agregan las acciones de los botones de los reportes de senasa

procedure TFPrincipal.AREPExistenciaPorLoteExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPExistenciaPorLote.Create(self));
  AgregarAccion(ARepExistenciaPorLote.Name,'Existencia por Potrero',3,JvIReportes3N,JvFolRGral,'EPP');
end;

procedure TFPrincipal.AREPParteMensualExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPParteMensual.Create(self));
  AgregarAccion(ARepParteMensual.Name,'Parte Mensual',3,JvIReportes3N,JvFolRGral,'PAM');
end;

procedure TFPrincipal.AREPInformePesadasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPInformePesadas.Create(self));
  AgregarAccion(ARepInformePesadas.Name,'Informe de Pesadas',3,JvIReportes3N,JvFolRProduccion,'IDP');
end;

procedure TFPrincipal.AREPDistGananciaDiariaPesoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPDistGananciaDiariaPeso.Create(self));
  AgregarAccion(ARepDistGananciaDiariaPeso.Name,'Distribucion de Gcia. Diaria de Peso',3,JvIReportes3N,JvFolRProduccion,'DGP');
end;

procedure TFPrincipal.AREPResumenPartoExecute(Sender: TObject);
begin
  inherited;
  //AbrirFormNormal(TFREPResumenParto.Create(Self));
  AbrirFormNormal(TFREPInfoGeneralPartos.Create(Self));
  AgregarAccion(ARepResumenParto.Name,'Informe General Partos/Nacimientos',3,JvIReportes3N,JvFolRPartos,'IGP');
end;

procedure TFPrincipal.AABMPadresExternosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMPadresExternos.Create(Self));
  AgregarAccion(AABMPadresExternos.Name,'Semen - Animales Externos',1,JvAnimales3N,JvFolSemen,'SAE');
end;

procedure TFPrincipal.ActualizarBD();
var
  cartel: TCartel;
  msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Accediendo a la Base de Datos ...';
  cartel.abrircartel(msje);
  inherited;
  try
    IBSPDesactivarTriggers.ExecProc;  // DESACTIVA LOS TRIGGERS PARA QUE LA ACTUALIZACION NO TARDEN
    IBTPrincipal.Commit;          //TAL VEZ PONERLO M�S ARRIBA

    IBSPCambiarCategoria.ExecProc; //cambia de categor�a las terneras
    IBSPBorrarTablasAuxiliares.ExecProc;

    (*pone en estado de lactacion de cada hembra un cero cuando esta se encuentra en null*)
    EjecutarFix(IBSFix,'FIX_ESTADO_LACTACION');
    //carga el estado actual de todos los animales para que en la aplicacion no lo calcule cuando se accede a la ficha del animal
    EjecutarFix(IBSFix,'FIX_ESTADO_ACTUAL_ANIMALES');
   //carga el ultimo evento de todos los animales para que en la aplicacion no lo calcule cuando se accede a la ficha del animal
    EjecutarFix(IBSFix,'FIX_ULTIMO_EVENTO_ANIMALES');
    EjecutarFix(IBSFix,'FIX_ULTIMO_PESO_ANIMALES');
// arregla las descripciones de tratamiento que estan en null colocando no definido segun su tipo
    EjecutarFix(IBSFix,'FIX_ID_TRATAMIENTO');
// arregla algunos generadores
    EjecutarFix(IBSFix,'FIX_GENERADORES');
 //Agrega los potreros si estan en null en la tabla de parto masivo
    EjecutarFix(IBSFix,'FIX_EVE_PARTO_MASIVO');
// a los establecimientos que est�n creados les agrega el pais en este caso argentina. Si desean pueden cambiar el Pais.
    EjecutarFix(IBSFix,'FIX_TAB_ESTABLECIMIENTO_PAIS');
    EjecutarFix(IBSFix,'FIX_REL_GRUPOS_EVENTOS');
    EjecutarFix(IBSFix,'FIX_EVE_EVENTOS');
//arregla en tab_animales el campo estado_lactacion que lleva la cantidad de partos de cada animal
    EjecutarFix(IBSFix,'FIX_CANT_PARTOS');
//arregla en TAB_EMPLEADOS COLOCANDO EN ID_tIPOS_EMPLEADOS EL TIPO NO DEFINIDO
    EjecutarFix(IBSFix,'FIX_ID_TIPOS_EMPLEADOS');
//arregla en REL_USUARIO_ACCION EL 527 DE RESUMEN DE TRATAMIENTO
    EjecutarFix(IBSFix,'FIX_ROL_USUARIO_ACCION');
    EjecutarFix(IBSFix,'FIX_CAT_VACA_NOV_EVENTO');
    EjecutarFix(IBSFix,'FIX_PARAMETROS_ESTACION');
    EjecutarFix(IBSFix,'FIX_PARAMETROS_ESTACION_FECHA');
    EjecutarFix(IBSFix,'FIX_PARAMETROS_FRAME');
    EjecutarFix(IBSFix,'FIX_ANIMALES_TRANSF');
    EjecutarFix(IBSFix,'FIX_POTREROS_HECTAREAS');
    EjecutarFix(IBSFix,'FIX_EVE_EVALUACION_PRESERVICIO');
    EjecutarFix(IBSFix,'FIX_FECHA_NAC_ANIM_EXTERNOS');
    EjecutarFix(IBSFix,'FIX_ESTADO_LACTACION_MACHOS');
    EjecutarFix(IBSFix,'FIX_EVE_ALTA_DIRECTA_BAJA');
    EjecutarFix(IBSFix,'FIX_VISIBLE_POTRERO_RODEO');
    EjecutarFix(IBSFix,'FIX_RELACION_PADRES_ANIMALES');
    EjecutarFix(IBSFix,'FIX_COD_TIPOS_SUPLEMENTACIONES');
    EjecutarFix(IBSFix,'FIX_DISTRIBUCIONES_PRENIEZ');
    EjecutarFix(IBSFix,'FIX_ESTADO_LACTACION_NAC');
    EjecutarFix(IBSFix,'FIX_INSEMINACION_ARTIFICIAL');
    EjecutarFix(IBSFix,'FIX_REL_ANIM_PADRES_EXT_CICLICO');
    EjecutarFix(IBSFix,'FIX_EVENTOS_HIJOS');
    EjecutarFix(IBSFix,'FIX_ESTADO_REPRO_SERVICIO');
    EjecutarFix(IBSFix,'FIX_ULTIMO_ESTADO_REPRO');
    EjecutarFix(IBSFix,'FIX_INSEMINACIONES_ARTIFICIALES');
    EjecutarFix(IBSFix,'FIX_PARAMETRO_AJUSTE_PESO');
    EjecutarFix(IBSFix,'FIX_ESTADO_REPRO');
    EjecutarFix(IBSFix,'FIX_TIPO_AJUSTE_PESO');
    EjecutarFix(IBSFix,'FIX_SUBCATEGORIA');
    EjecutarFix(IBSFix,'FIX_CODIGO_MANEJO');
    EjecutarFix(IBSFix,'FIX_COOPROPIEDAD');
    EjecutarFix(IBSFix,'FIX_TAB_ANIMALES_GDR');
    EjecutarFix(IBSFix,'FIX_SUBCATEGORIA_BRANG_BRAF');
    EjecutarFix(IBSFix,'FIX_MIN_PESO');
    EjecutarFix(IBSFix,'FIX_COD_SUBCATEGORIA_BRAHMAN');
    EjecutarFix(IBSFix,'FIX_FUENTES_DEPS');
    EjecutarFix(IBSFix,'AUX_AGREGAR_COLOR');
    EjecutarFix(IBSFix,'AUX_CAMBIO_RAZA');
    EjecutarFix(IBSFix,'FIX_MAPA');
    EjecutarFix(IBSFix,'FIX_RAZA_BRANGUS_TABANIM');
    EjecutarFix(IBSFix,'FIX_CAMBIO_SUBCATEGO_BRANGUS');
    EjecutarFix(IBSFix,'FIX_PARAMETROS_APODO');
    EjecutarFix(IBSFix,'FIX_PARAMETROS_ESTABLECIMIENTOS');
    EjecutarFix(IBSFix,'FIX_STOCK_SEMEN');
    EjecutarFix(IBSFix,'FIX_CATEGORIAS_BAJAS');
    EjecutarFix(IBSFix,'FIX_PESO_NACER');
    EjecutarFix(IBSFix,'FIX_ANIMALES_EXTERNOS');


    IBSPActivarTriggers.ExecProc;
    IBTPrincipal.Commit;
  except on e:exception do
   begin
    IBTPrincipal.Rollback;
    raise EAbort.Create(' No se puede iniciar huella porque la base de datos se encuentra desactualizada ');
   end;
  end;

  try
    EjecutarFix(IBSFix,'FIX_RELACION_PADRES_ANIMALES');
//    IBSPFixRelacionPadresAnimales.Close;
//    IBSPFixRelacionPadresAnimales.ExecProc;
    IBTPrincipal.CommitRetaining;
  except
    IBTPrincipal.RollbackRetaining;
  end;

  try
    IBQSetVisibilidadAnimExt.Close;
    IBQSetVisibilidadAnimExt.ParamByName('fecha').AsDate := Now();
    IBQSetVisibilidadAnimExt.Open;
    IBTPrincipal.CommitRetaining;
  except
    IBTPrincipal.RollbackRetaining;
  end;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFPrincipal.AABMModificarCUIGExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMModificarCUIG.Create(Self));
end;

procedure TFPrincipal.AIntroExecute(Sender: TObject);
begin
  inherited;
//  AbrirFormNormal(TFIntro.Create(self));
    {$IFDEF DEMO}                          //aca una vez que esten realizadas todas
      //{$IFDEF PRODUCTORES}                 // las presentaciones se sacan todos los condicionales
      //  EjecutarPresentacion();
      //{$ELSE}
      //  EjecutarPresentacion();
        {if (VerIntroduccion) then
          FIntro.Show;}
      //AbrirFormNormal(TFIntro.Create(self));
      //{$ENDIF}
    {$ELSE}
      {$IFDEF PRODUCTORES}
         //
      {$ELSE}
         EjecutarPresentacion();
        {if (VerIntroduccion) then
          FIntro.Show;}
      //AbrirFormNormal(TFIntro.Create(self));
      {$ENDIF}
    {$ENDIF}
end;

function TFPrincipal.VerIntroduccion: Boolean;
var ArchivoIni : TiniFile;
    mostrarIntro: Integer;
begin
  result:= false;
  try
    begin
      ArchivoIni := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');
      mostrarIntro:= ArchivoIni.ReadInteger('Introduccion','Mostrar',-1);
      if (mostrarIntro = -1) then
        begin
          ArchivoIni.WriteInteger('Introduccion','Mostrar', 1);
          result:= true;
        end
       else
        if (mostrarIntro = 0) then
          result:= false
         else
           result:= true;
    end
  except on e:Exception do
  end
end;

procedure TFPrincipal.EjecutarPresentacion;
var aplic, dir1, dir2: string;
begin
    dir1 := '"'+ExtractFilePath(Application.ExeName)+'Documentacion\Presentacion\';
    dir2 := dir1;
    aplic:= dir1+'pptview.exe"  '+dir2+'Autoguia.pps"';
    WinExec(PChar(aplic),1);
end;

procedure TFPrincipal.IBQVerAlarmaBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  IBQVerAlarma.ParamByName('esta').AsInteger := EstablecimientoActual;
end;

procedure TFPrincipal.FormActivate(Sender: TObject);
begin
  inherited;
  IBQListaAnimales.Close;
  IBQListaAnimales.ParamByName('estable').AsInteger := EstablecimientoActual;
  IBQListaAnimales.Open;

end;

procedure TFPrincipal.AABMPropietarioHuellaExecute(Sender: TObject);
var
  abm : TFABMPropietario;
begin
  inherited;
  abm := TFABMPropietario.Create(self);
  abm.Abrir(faAbm);
end;

procedure TFPrincipal.ACalendarioExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFCalendario.Create(self));
end;

procedure TFPrincipal.TCheckTimer(Sender: TObject);
var
  hora, min, sec, milsec : Word;
  F : TFTareasPendientes;
begin
  inherited;
  DecodeTime(Now(),hora,min,sec,milsec);
  TCheck.Enabled := false;
  F := TFTareasPendientes.Create(self);
  if (F.ChekTareas(hora,min,0)) then
    F.ShowModal;
  F.Destroy;
  TCheck.Enabled := true;
end;

function TFPrincipal.IsConnected: Boolean;
var ConnectedState: Cardinal;
begin
  ConnectedState := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@ConnectedState, 0);

  //el siguiente codigo es para detectar tiene que ir en algun timer
  {  if IsConnected = False then
    ShowMessage('You are not connected to internet')
  else
    ShowMessage('You are connected to internet'); }
end;

procedure TFPrincipal.AABMRecursosForrajerosExecute(Sender: TObject);
var
  abm : TFABMRecursosForrajeros;
begin
  inherited;
  abm := TFABMRecursosForrajeros.Create(self);
  abm.Abrir(faAbm);
end;


procedure TFPrincipal.AConfigGruposExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFConfigGrupos.Create(self));
  AgregarAccion(AConfigGrupos.Name,'Grupos Visibles',4,nil,JvFolGruposVisibles,'');
end;

procedure TFPrincipal.SetLogueo(usuario: Integer; valorLog: string);
begin
end;

procedure TFPrincipal.AABMDescTratamientoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMDescTipoTratamiento.Create(self));
end;

procedure TFPrincipal.AEvePartoMasivoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEvePartoMasivo.Create(self));
  AgregarAccion(AEvePartoMasivo.Name,'Parto Masivo',2,JvIEventos3N,JvFolEPartos,'PRM');
end;

procedure TFPrincipal.AEveNacimientosExecute(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQHayNacimientos.Close;
  DMSoftvet.IBQHayNacimientos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQHayNacimientos.Open;
  if (not DMSoftvet.IBQHayNacimientos.IsEmpty) then
    AbrirFormNormal(TFEveNacimientos.Create(self))
  else
    MostrarMensaje(tmAdvertencia, 'No se pueden cargar nacimientos masivos porque no existen nacimientos pendientes.');
  AgregarAccion(AEveNacimientos.Name,'Nacimientos',2,JvIEventos3N,JvFolEPartos,'NAC');
end;

procedure TFPrincipal.AREPExistenciaRodeoPotreroExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPExistenciaRodeoPotrero.Create(self));
  AgregarAccion(ARepExistenciaRodeoPotrero.Name,'Existencia Rodeo/Potrero',3,JvIReportes3N,JvFolRGral,'ERP');
end;

procedure TFPrincipal.BitBtn2Click(Sender: TObject);
begin
  inherited;
{uses ShellApi; calculadora
ShellExecute(Handle, 'open', 'calc.exe', nil, nil, SW_SHOW);}

end;

procedure TFPrincipal.AREPResumenTratamientoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFRepResumenTratamiento.Create(Self));
  AgregarAccion(ARepResumenTratamiento.Name,'Resumen Tratamiento',3,JvIReportes3N,JvFolRSanitarios,'RTR');
end;

procedure TFPrincipal.AREPInfoGralGestExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPInfoGralGest.Create(self));
  AgregarAccion(ARepInfoGralGest.Name,'Informe General de Gestacion',3,JvIReportes3N,JvFolRGestacion,'IGG');
end;

procedure TFPrincipal.AREPProduccionExternosExecute(Sender: TObject);
begin
  inherited;
  if FuncTransferencia then
  begin
    AbrirFormNormal(TFREPProduccionExternos.Create(self));
    AgregarAccion(ARepProduccionExternos.Name,'Performance de Semen Utilizado',3,JvIReportes3N,JvFolRServicios,'PSU');
  end
  else
  begin
     MostrarMensaje(tmInformacion, 'No disponible en esta versi�n');
  end
end;

procedure TFPrincipal.AEveEliminarAnimalExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveEliminarAnimal.Create(self));
  AgregarAccion(AEveEliminarAnimal.Name,'Eliminar Animales',1,nil,JvFolEliminar,'');
end;

function TFPrincipal.getPais: Integer;
begin
  result := FPais;
end;

procedure TFPrincipal.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  if (pais = 1) then //Argentina
   begin
     AABMModificarCUIG.Visible:= True;
     ADOTri.Visible:= True;
     ADOCertificadoPredespacho.Visible:= True;
     //DocumentosOficiales1.Visible:= ivAlways;
     //dxNVReportesReportesGDocGenerales.Visible:= True;
     ADOSRADenunciaNacimientos.Visible:= True;
   end
  else
    if (pais = 2) then //Uruguay
     begin
       AABMModificarCUIG.Visible:= False;
       ADOTri.Visible:= False;
       ADOCertificadoPredespacho.Visible:= False;
       //DocumentosOficiales1.Visible:= ivNever;
       //dxNVReportesReportesGDocGenerales.Visible:= False;
       ADOSRADenunciaNacimientos.Visible:= False;
     end
    else
       begin
         AABMModificarCUIG.Visible:= False;
         ADOTri.Visible:= False;
         ADOCertificadoPredespacho.Visible:= False;
         //DocumentosOficiales1.Visible:= ivNever;
         //dxNVReportesReportesGDocGenerales.Visible:= False;
         ADOSRADenunciaNacimientos.Visible:= False;         
       end
end;

function TFPrincipal.getPaisNombre: String;
begin
  result := FPaisNombre;
end;

function TFPrincipal.getPaisNombreCaravana: String;
begin
  result := FPaisNombreCaravana;
end;

function TFPrincipal.getPaisNombreRegistro: String;
begin
  result := FPaisNombreRegistro;
end;

function TFPrincipal.getPaisHerdBook: String;
begin
  result := FPaisHerdBook;
end;

procedure TFPrincipal.leerDatosPais;
var esta : Integer;
begin
 // DMSoftvet.IBQEstablecimiento.Close;
 // DMSoftvet.IBQEstablecimiento.Open;
  esta := DMSoftvet.IBQEstablecimiento.FieldByName('id_establecimiento').AsInteger;
  DMSoftvet.IBQEstablecimiento.Close;
  DMSoftvet.IBQEstablecimiento.Open;
  DMSoftvet.IBQEstablecimiento.Locate('id_establecimiento',VarArrayOf([esta]), [] );
  FRenspa := DMSoftvet.IBQEstablecimiento.FieldByName('renspa').AsString;
  FPais := DMSoftvet.IBQEstablecimiento.FieldByName('pais').AsInteger;
  DMSoftvet.IBQPais.Close;
  DMSoftvet.IBQPais.ParamByName('pais').AsInteger:= FPais;
  DMSoftvet.IBQPais.Open;
  FPaisNombre:= DMSoftvet.IBQPais.FieldByName('nombre').AsString;
  FPaisNombreCaravana:= DMSoftvet.IBQPais.FieldByName('nombrecaravana').AsString;
  FPaisNombreRegistro:= DMSoftvet.IBQPais.FieldByName('registro').AsString;
  FPaisHerdBook:= DMSoftvet.IBQPais.FieldByName('herdbook').AsString;
  ComponentesVisiblesPorPais(Pais);

  LTipoReg.Caption := FPaisNombreRegistro+' :';
  LTipoRegVal.Caption := FRenspa;

end;


function TFPrincipal.VerificarSalida: Integer;
var Ini : TiniFile;
    salida : Integer;
begin
  salida:= 0;
  try
    begin
    //verifico si cerro bien la �ltima vez que se us� Huella
    Ini := TIniFile.Create (copy(Application.ExeName, 0, length(Application.ExeName) -10)+'huella.ini');    
    salida:= Ini.ReadInteger('Sistema','Entrada',-1);
    if ((salida = -1) or (salida = 0)) then
      begin
        Ini.WriteInteger('Sistema','Entrada', 1);
        salida := 1;
      end
    end;  
  except on e:Exception do
  end;
  result:= salida;
end;


function TFPrincipal.ExecuteProcess(ProcessName: String): Cardinal;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  Result := 0;
  FillChar(StartInfo, SizeOf(StartInfo), 0);
  StartInfo.cb := SizeOf(StartInfo);
  StartInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartInfo.wShowWindow := SW_SHOW; //SW_HIDE
  if CreateProcess(PChar(ProcessName), nil, nil, nil, false, 0,nil, nil, StartInfo,ProcInfo) then
    Result := ProcInfo.hProcess;
end;


function TFPrincipal.LeerRegistro: Boolean;
var
  RegFirebird, RegAplicacion : TRegistry;
begin
  LeerRegistro := false;
  RegFirebird := TRegistry.Create;
  RegAplicacion := TRegistry.Create;
  RegFirebird.RootKey := HKEY_LOCAL_MACHINE;
  RegAplicacion.RootKey := HKEY_CLASSES_ROOT;
  if (RegFirebird.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FBDBServer_1_5_is1',False)) then
    begin
      DirFirebird := RegFirebird.ReadString('Inno Setup: App Path');
      LeerRegistro := true;
    end;
{ if (RegAplicacion.OpenKey(Registro,False)) then
  begin
    if (RegAplicacion.ValueExists('App Path')) then
    begin
      DirAplicacion := RegAplicacion.ReadString('App Path');
      LeerRegistro := true;
    end
  end;
}//falta leer el registro donde esta instalada la aplicacion
end;

procedure TFPrincipal.EjecutarFix(SP : TIBStoredProc; ProcName :string);
begin
  try
    IBQConsultaFix.Close;
//    IBQConsultaFix.sql.clear();
    IBQConsultaFix.ParamByName('NOMBRE').AsString := ProcName;
  //  IBQConsultaFix.sql.add(' SELECT * FROM FIX_PROCEDURES WHERE NOMBRE ='+ quotedStr( ProcName));
    IBQConsultaFix.Active := true;
    if IBQConsultaFix.IsEmpty then
    begin
      SP.StoredProcName := ProcName;
      SP.ExecProc;
      IBQInsertFix.Close;
      IBQInsertFix.ParamByName('NOMBRE').AsString := ProcName;
      IBQInsertFix.ParamByName('FECHA').AsDate := Date();
      IBQInsertFix.Open;
    end;
  except
  end;
end;


//Esto deberia ir en UDMSoftvet, pero esta unidad no es creada hasta despues
//de que se actualiza la base de datos
procedure TFPrincipal.EjecutarFix(SP : TIBStoredProc);
begin
  try
    IBQConsultaFix.Close;
    IBQConsultaFix.ParamByName('NOMBRE').AsString := SP.StoredProcName;
    IBQConsultaFix.Open;
    if IBQConsultaFix.IsEmpty then
    begin
      SP.ExecProc;
      IBQInsertFix.Close;
      IBQInsertFix.ParamByName('NOMBRE').AsString := SP.StoredProcName;
      IBQInsertFix.ParamByName('FECHA').AsDate := Date();
      IBQInsertFix.Open;
    end;
  except
  end;
end;


procedure TFPrincipal.AABMLaboratoriosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMLaboratorios.Create(self));
end;

procedure TFPrincipal.AREPMovimientosExistenciaExecute(Sender: TObject);
begin
  inherited;
  //AbrirFormNormal(TFREPMovimientosExistencia.Create(Self));
//  AbrirFormNormal(TFREPInfoGeneralPartos.Create(Self));
//AbirFormNormal(TFREPProcreo.Create(Self));
//AbrirFormNormal(TFEveCompraEmbriones.Create(self));
//  AbrirFormNormal(TFRepListadoImplantes.Create(self));
 // AbrirFormNormal(TFRepListadoReceptoras.Create(self));
 //AbrirFormNormal(TFRepEmbrionesTransferidos.Create(self));
 AbrirFormNormal(TFrepStockEmbriones.Create(self));
end;

procedure TFPrincipal.ARepCostosVeteExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFRepCostosVete.Create(self));
  AgregarAccion(ARepCostosVete.Name,'Costos Sanitarios',3,JvIReportes3N,JvFolRSanitarios,'CSS');
end;

procedure TFPrincipal.AABMTiposEmpleadosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMTiposEmpleados.Create(Self));
end;

procedure TFPrincipal.AEveCalidadCarneExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCalidadCarne.Create(Self));
  AgregarAccion(AEveCalidadCarne.Name,'Calidad de Carne',3,JvIReportes3N,JvFolRProduccion,'CDC');
end;
{
procedure TFPrincipal.BBCambioUsuarioClick(Sender: TObject);
var
  F : TFLogin;
begin
  inherited;
  F := TFLogin.Create(self);
  F.SoloUsuario := true;
  F.ShowModal;
  F.Destroy;
  DesActivarAcciones();
  ActivarAcciones();
end;
}
procedure TFPrincipal.BorrarTablasAuxiliares();
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFPrincipal.ARepInfoMortandadExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPInfoMortandad.Create(Self));
  AgregarAccion(ARepInfoMortandad.Name,'Informe de Mortandad',3,JvIReportes3N,JvFolRProduccion,'IDM');
end;

procedure TFPrincipal.AREPProcreoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPProcreo.Create(Self));
  AgregarAccion(ARepProcreo.Name,'Informe de Procreo',3,JvIReportes3N,JvFolRProduccion,'IDP');
end;

procedure TFPrincipal.AREPRankinsDepsExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFRepRankinsDeps.Create(self));
  AgregarAccion(ARepRankinsDeps.Name,'Informe de Ranking de DEPs',3,JvIReportes3N,JvFolRProduccion,'IRD');
end;

procedure TFPrincipal.AREPProduccionCarneExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPProduccionCarne.Create(self));
  AgregarAccion(ARepProduccionCarne.Name,'Informe de Produccion de Carne',3,JvIReportes3N,JvFolRProduccion,'IRC');
end;

procedure TFPrincipal.AEveActividadExecute(Sender: TObject);
begin
  inherited;
    AbrirEventoConManga(TFEveActividad.Create(Self));
    AgregarAccion(AEveActividad.Name,'Actividad - Registro - Inspeccion',2,JvIEventos3N,JvFolEGral,'ARI');
end;

procedure TFPrincipal.AABMActividadExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMActividad.Create(Self));
end;

procedure TFPrincipal.AABMSuplementacionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMSuplementacion.Create(self));
end;

procedure TFPrincipal.AEveSuplementacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveSuplementacion.Create(self));
  AgregarAccion(AEveSuplementacion.Name,'Alimentacion',2,JvIEventos3N,JvFolEGral,'ALI');
end;

procedure TFPrincipal.AREPCostoSuplementacionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPCostoSuplementacion.Create(self));
  AgregarAccion(ARepCostoSuplementacion.Name,'Costos de Alimentacion',3,JvIReportes3N,JvFolRGral,'CDA');
end;

procedure TFPrincipal.AABMOrigenExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMOrigen.Create(self));
end;


procedure TFPrincipal.AABMDestinoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMDestino.Create(self));
end;

procedure TFPrincipal.AABMPropietarioAnimalExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMpropietarioAnimal.Create(self));
end;

procedure TFPrincipal.AABMCriadorExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMCriador.Create(self));
end;

procedure TFPrincipal.AEveFlushingExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveFlushing.Create(self));
  AgregarAccion(AEveFlushing.Name,'Colecta de Embriones',2,JvIEventos3N,JvFolETransferencia,'CE');
end;

procedure TFPrincipal.AABMReservasForrajerasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMReservasForrajeras.Create(self));
end;

procedure TFPrincipal.AABMPotrerosTratamientosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMPotrerosTratamientos.Create(self));
end;

procedure TFPrincipal.AABMDescMetodoSincExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMDescMetodoSinc.Create(self));
end;

procedure TFPrincipal.BorrarArchivosTemporales;
begin
{  Directorio := ExtractFilePath(Application.ExeName);
  DeleteFile(Directorio+'*.wmf'); }
end;

procedure TFPrincipal.ARepListadoAnimalesExternosExecute(Sender: TObject);
var
  Iabm: IButtonABM;
begin
  inherited;
  Iabm := IButtonABM(TFABMPadresExternos.Create(self));
  Iabm.ISetCampoRetorno('id_animal_externo');
  Iabm.IFitrate(-1,FPrincipal.EstablecimientoActual);
  Iabm.IAbrir(faAbm); (*tambien llama al ShowModal*)
  AgregarAccion(ARepListadoAnimalesExternos.Name,'Listado de Animales Externos',1,nil,JvFolExternos,'');
end;

procedure TFPrincipal.ARepInseminacionesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFRepInseminaciones.Create(self));
  AgregarAccion(ARepInseminaciones.Name,'Informe de Inseminacion Artificial/S.C.',3,JvIReportes3N,JvFolRServicios,'IIA');
end;

procedure TFPrincipal.Button1Click(Sender: TObject);
var //F : TFAyudaInicialdos;
  F : TFREPCierreLote;
begin
  inherited;

  F := TFREPCierreLote.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.Button2Click(Sender: TObject);
var F : TFREPListadosPersonalizados; //F : TFAyudaInicial;
begin
  inherited;

{  F := TFAyudaInicial.Create(self);
  F.ShowModal;
  F.Destroy;}

  F := TFREPListadosPersonalizados.Create(self);
  F.ShowModal;
  F.Destroy;

end;


procedure TFPrincipal.BitBtn3Click(Sender: TObject);
var

  F : TFConfigIdioma;
begin
  inherited;
  F := TFConfigIdioma.Create(self);
  F.ShowModal;
  F.Destroy;
  //FLectorElectronico.WriteTextVAComm(Edit1.Text);
  //VaComm1.WriteText(Edit1.Text);
  //C := nil;
  //C.Enabled := false;
  //AbrirFormNormal(TFDOCertificadoRecupEmbriones.Create(self));
  //AbrirEventoConManga(TFEveEliminarEvento.Create(self));
  //AbrirFormNormal(TFABMFuentesDeps.Create(self));
end;

procedure TFPrincipal.SetMessagePuertoSerie(const Value: String);
begin
  FMessagePuertoSerie := Value;
end;

procedure TFPrincipal.AImpDepsExecute(Sender: TObject);
begin
  inherited;
  if FuncDEPs then
  begin
    AbrirFormNormal(TFImportacionDepsRazas.Create(Self));
    AgregarAccion(AImpDEPS.Name,'Importacion de Datos Geneticos',1,JvAnimales3N,JvFolDEPS,'IDG');
  end
  else
  begin
     MostrarMensaje(tmInformacion, 'No disponible en esta versi�n');
  end
end;

procedure TFPrincipal.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  showmessage(Key);
end;

procedure TFPrincipal.AEveTransferenciaEmbrionariaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveTransferenciaEmbrionaria.Create(self));
  AgregarAccion(AEveTransferenciaEmbrionaria.Name,'Transferencia Embrionaria',2,JvIEventos3N,JvFolETransferencia,'TRE');
end;

procedure TFPrincipal.AABMCentrosTransplantesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMCentrosTransplantes.Create(self));
end;

procedure TFPrincipal.AABMDificultadTransferenciaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMDificultadTransferencia.Create(self));
end;

procedure TFPrincipal.AABMUbicacionTransferenciaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMUbicacionTransferencia.Create(self));
end;

procedure TFPrincipal.AABMUteroTransferenciaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMUteroTransferencia.Create(self));
end;

procedure TFPrincipal.AABMCalidadEmbrionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMCalidadEmbrion.Create(self));
end;

procedure TFPrincipal.AABMEstadioEmbrionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMEstadioEmbrion.Create(self));
end;

procedure TFPrincipal.AABMDestinoEmbrionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMDestinoEmbrion.Create(self));
end;

procedure TFPrincipal.AABMDestDescEmbrionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMDescDestEmbrion.Create(self));
end;

procedure TFPrincipal.AEveCompraEmbrionesExecute(Sender: TObject);
var
  F: TFEveCompraEmbriones;
begin
  inherited;
  F := TFEveCompraEmbriones.Create(self);
  F.TipoStock := tsCompra;
  F.ShowModal;
  F.Destroy;
  AgregarAccion(AEveCompraEmbriones.Name,'Compra de Embriones',1,JvAnimales3N,JvFolEmbriones,'CDE');
end;

procedure TFPrincipal.AEveBajaEmbrionesExecute(Sender: TObject);
var
  F: TFEveCompraEmbriones;
begin
  inherited;
  F := TFEveCompraEmbriones.Create(self);
  F.TipoStock := tsBaja;
  F.ShowModal;
  F.Destroy;
  AgregarAccion(AEveBajaEmbriones.Name,'Baja de Embriones',1,JvAnimales3N,JvFolEmbriones,'BDE');
end;

procedure TFPrincipal.ARepListadoImplantesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPListadoImplantes.Create(self));
  AgregarAccion(ARepListadoImplantes.Name,'Listado de Implantes',3,JvIReportes3N,JvFolRTransferencia,'LDI');
end;

procedure TFPrincipal.ARepListadoReceptorasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFRepListadoReceptoras.Create(self));
  AgregarAccion(ARepListadoReceptoras.Name,'Listado de Receptoras',3,JvIReportes3N,JvFolRTransferencia,'LDR');
end;

procedure TFPrincipal.ARepEmbrionesTransferidosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFRepEmbrionesTransferidos.Create(self));
  AgregarAccion(ARepEmbrionesTransferidos.Name,'Embriones Transferidos',3,JvIReportes3N, JvFolRTransferencia,'ETR');
end;

procedure TFPrincipal.ARepStockEmbrionesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFRepStockEmbriones.Create(self));
  AgregarAccion(ARepStockEmbriones.Name,'Stock de Embriones',3,JvIReportes3N,JvFolRTransferencia,'SDE');
end;



procedure TFPrincipal.AppEventPrincipalException(Sender: TObject;
  E: Exception);
var
  LogFile : TextFile;
  NomArch, Mensaje, Originador, Error : String;
begin
  inherited;

  if Sender is TComponent then
  begin
    Originador := 'ORIGINADO - Clase: '+(Sender as TComponent).Owner.ClassName+' - Componente: '+(Sender as TComponent).Name;

   { if Assigned(Rutina.Code) then
      Detalle := (((Sender as TComponent).Owner) as TFUniversal).MethodName(Rutina.Code);}
  end
  else
    Originador := 'ORIGINADO - No es TComponent - Clase: '+Sender.ClassName;
  Mensaje := 'DETALLE - Fecha: '+DateToStr(Date())+' - Hora: '+TimeToStr(Now)+' - Windows: '+GetWindowsVersion();
  Error := 'EXCEPCION - Error: '+E.Message+' - Exception: '+E.ClassName;

  try
    NomArch := ExtractFilePath(Application.ExeName)+'LogErrorHuella.txt';
    AssignFile(LogFile,NomArch);
    if FileExists(NomArch) then
    begin
      Append(LogFile);
      Writeln(LogFile,'****************************************');
    end
    else
    begin
      Rewrite(LogFile);
      Writeln(LogFile,'****************************************');
      Writeln(LogFile,'**********ARCHIVO DE LOG HUELLA*********');
      Writeln(LogFile,'****************************************');
    end;
    Writeln(LogFile,Mensaje);
    Writeln(LogFile,Originador);
    //Writeln(LogFile,Detalle);
    Writeln(LogFile,Error);
  finally
    {$I-}
    CloseFile(LogFile);
    {$I+}
  end;
end;
{
  Metodo para loguear el acceso
}
procedure TFPrincipal.LogginLoading( s : string);
var
  LogFile : TextFile;
  NomArch, Mensaje : String;
begin
  Mensaje := 'DETALLE - Fecha: '+DateToStr(Date())+' - Hora: '+TimeToStr(Now)+' - Windows: '+GetWindowsVersion();
  try
    NomArch := ExtractFilePath(Application.ExeName)+'LogginLoad.txt';
    AssignFile(LogFile,NomArch);
    if FileExists(NomArch) then
    begin
      Append(LogFile);
      if (firstLog) then
      begin
        Writeln(LogFile,'****************************************');
        firstLog := false;
       end;
    end
    else
    begin
      Rewrite(LogFile);
      Writeln(LogFile,'****************************************');
      Writeln(LogFile,'**********ARCHIVO DE LOG HUELLA*********');
      Writeln(LogFile,'****************************************');
      Mensaje := 'DETALLE - Fecha: '+DateToStr(Date())+' - Hora: '+TimeToStr(Now)+' - Windows: '+GetWindowsVersion();
      Writeln(LogFile,Mensaje);
    end;

    Writeln(LogFile,'DETALLE - Fecha: '+DateToStr(Date())+' - Hora: '+TimeToStr(Now)+' '+s);
  finally
    {$I-}
    CloseFile(LogFile);
    {$I+}
  end;
end;



function TFPrincipal.GetWindowsVersion() : string;
var
  VerInfo: TOsversionInfo;
  PlatformId, VersionNumber: string;
  Reg: TRegistry;
begin
  VerInfo.dwOSVersionInfoSize := SizeOf(VerInfo);
  GetVersionEx(VerInfo);
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  case VerInfo.dwPlatformId of
    VER_PLATFORM_WIN32s:
    begin
      PlatformId := 'Windows 3.1';
    end;
    VER_PLATFORM_WIN32_WINDOWS:
    begin
      Reg.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion', False);
      PlatformId    := Reg.ReadString('ProductName');
      VersionNumber := Reg.ReadString('VersionNumber');
    end;
    VER_PLATFORM_WIN32_NT:
    begin
      Reg.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion', False);
      PlatformId    := Reg.ReadString('ProductName');
      VersionNumber := Reg.ReadString('CurrentVersion');
    end;
  end;
  Reg.Free;
  Result := PlatformId + ' (version ' + VersionNumber + ')';
end;

procedure TFPrincipal.AREPInfoDonantesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPInfoDonantes.Create(self));
  AgregarAccion(ARepInfoDonantes.Name,'Informe de Donantes',3,JvIReportes3N,JvFolRTransferencia,'IDD');
end;

procedure TFPrincipal.ADOCertificadoRecupEmbrionesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFDOCertificadoRecupEmbriones.Create(self));
  AgregarAccion(ADOCertificadoRecupEmbriones.Name,'Certificado de Recuperacion de Embriones',3,JvIReportes3N,JvFolRSRA,'CRE');
end;


procedure TFPrincipal.AExpDepsExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFExpDeps.Create(Self));
  AgregarAccion(AExpDeps.Name,'Exportacion de Datos Fenotipicos',1,JvAnimales3N,JvFolDEPS,'EDF');
end;

///////////Verificacion de Actualizaciones////////////////////////////////////////

function TFPrincipal.VerificarActualizaciones(Automatico : Boolean) : Boolean;
var
  F : TActualizador;
  Cartel : TCartel;
  HayActualizacion : Integer;
begin
  Result := true;
  if not Automatico then
  begin
    Cartel := TCartel.getInstance;
    Cartel.abrircartel('Verificando Actualizaciones...');
  end;

  F := TActualizador.Create(ExtractFilePath(Application.ExeName));
  HayActualizacion := F.VerificarActualizaciones;
  F.Destroy;

  if not Automatico then
  begin
    Cartel.cerrarcartel;
    Cartel.FreeInstance;
  end;

  case HayActualizacion of
    1 : begin
          {JvDAActualizacion.Font.Style := [fsUnderline];
          JvDAActualizacion.Options := [daoCanClick,daoCanMove,daoCanMoveAnywhere,daoCanClose];
          JvDAActualizacion.MessageText := 'Hay Actualizaciones Pendientes'+#13+'(Para no ver mas la Advertencia haga Click en ''X'')';}
          JvIActualiza.Visible := true;
          TimagenActualizador.Enabled := true;
          {JvBHint.ActivateHint(JvIActualiza,'Hay actualizaciones disponibles'+#13+'haga click para actualizar HUELLA',500);
          JvBHint.CancelHint;}
        end;
    0 : begin
          {JvDAActualizacion.Font.Style := [fsBold];
          JvDAActualizacion.MessageText := 'No Hay Actualizaciones Pendientes';
          JvDAActualizacion.Options := [daoCanMove,daoCanMoveAnywhere,daoCanClose];}
          MostrarMensaje(tmInformacion, 'No hay Actualizaciones pendientes');
          if Automatico then
           Result := false;
        end;
   -1 : begin
          {JvDAActualizacion.Font.Style := [fsBold];
          JvDAActualizacion.MessageText := 'No se puede conectar con el servidor. Verifique las actualizaciones manualmente';
          JvDAActualizacion.Options := [daoCanMove,daoCanMoveAnywhere,daoCanClose];}
          MostrarMensaje(tmInformacion, 'No se puede conectar con el servidor. Verifique las actualizaciones desde el icono del escritorio');
          if Automatico then
           Result := false;
        end;
  end;

  {if (HayActualizacion = 1) or (HayActualizacion = -1) or not Automatico then
    JvDAActualizacion.Execute}
end;

procedure TFPrincipal.TimerActualizadorTimer(Sender: TObject);
begin
  inherited;
  if Active then
  begin
    TCheckActualizador.Enabled := true;
    ThreadAct := TThreadActualizador.Create(true);
    ThreadAct.Resume;
  end;
end;

procedure TFPrincipal.JvDAActualizacionButtons0Click(Sender: TObject);
begin
  inherited;
  TimerActualizador.Enabled := false;
  JvDAActualizacion.Close(true);
end;

procedure TFPrincipal.JvDAActualizacionCloseButtonClick(Sender: TObject);
begin
  inherited;
  TimerActualizador.Enabled := false;
  JvDAActualizacion.Close(true);
end;

procedure TFPrincipal.AActualizadorExecute(Sender: TObject);
var
  mostrar : boolean;
begin
  inherited;
  {$IFDEF DEMO}
    {$IFDEF EC}
      MostrarMensaje(tmInformacion,'Para actualizar la versi�n de Educaci�n Continua envia un mail a sac@softhuella.com.ar y se le enviara la actualizaci�n');
    {$ELSE}
      MostrarMensaje(tmInformacion,'No se puede actualizar la versi�n Demo');
    {$ENDIF}
  {$ELSE}
    if IsConnected then
    begin
      mostrar := TimerActualizador.Enabled;
      if TimerActualizador.Enabled then
        TimerActualizador.Enabled := false;
      VerificarActualizaciones(false);
      TimerActualizador.Enabled := mostrar;
    end
    else
      mostrarMensaje(tmInformacion,'Para verificar si hay actualizaciones se debe encontrar conectado a Internet');
  {$ENDIF}
  JvIActualiza.Visible := false;
end;

procedure TFPrincipal.JvDAActualizacionMessageClick(Sender: TObject);  
var
  PathAct : String;
begin
  inherited;
  PathAct := ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe';
  if DirectoryExists(ExtractFilePath(Application.ExeName)+'Huella Update 1.5') then
    PathAct := ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe'
  else
    PathAct := ExtractFilePath(Application.ExeName)+'Huella Update\Actualizador.exe';
  if ExecuteProcess(PathAct) <> 0 then
  begin
    JvDAActualizacion.Close(true);
    TimerActualizador.Enabled := false;
  end;
end;

procedure TFPrincipal.TCheckActualizadorTimer(Sender: TObject);
begin
  inherited;
  ThreadAct.Suspend;
  TCheckActualizador.Enabled := false;
  //MostrarMensaje(tmError,'La respuesta del servidor esta tardando demasiado. Verifique si hay actualizaciones desde el actualizador');
 { JvDAActualizacion.Font.Style := [fsBold];
  JvDAActualizacion.MessageText := 'No se puede conectar con el servidor. Verifique las actualizaciones manualmente';
  JvDAActualizacion.Options := [daoCanMove,daoCanMoveAnywhere,daoCanClose];
  JvDAActualizacion.Execute;}
end;


////////////////////////////////////////////////////////////////////////////////////////

procedure TFPrincipal.BitBtn4Click(Sender: TObject);
begin
  inherited;
 { with IBBackupService1 do
   begin
     ServerName :='localhost';
     LoginPrompt := False;
     Params.Add('user_name=sysdba');
     Params.Add('password=masterkey');
     Active := True;
     try
       Verbose := True;
       Options := [NonTransportable, IgnoreLimbo];
       DatabaseName := 'C:\Archivos de programa\Huella\Huella Productores 1.5\huella.fdb';
       BackupFile.Add('C:\Archivos de programa\Huella\Huella Productores 1.5\huella.fdk');

       ServiceStart;
       While not Eof do
         begin
           Application.ProcessMessages;
           Memo1.Lines.Add(GetNextLine);
         end
     finally
       Active := False;
     end;
   end; }
end;

procedure TFPrincipal.BitBtn5Click(Sender: TObject);
begin
  inherited;
  with IBRestoreService1 do
   begin
     ServerName := 'localhost';
     LoginPrompt := False;
     Params.Add('user_name=sysdba');
     Params.Add('password=masterkey');
     Active := True;
     try
       Verbose := True;
       Options := [Replace, UseAllSpace];
       PageBuffers := 3000;
       PageSize := 4096;
       DatabaseName.Add('C:\Archivos de programa\Huella\Huella Productores 1.5\huella.fdb');
 
       BackupFile.Add('C:\Archivos de programa\Huella\Huella Productores 1.5\huella.fdk');
       ServiceStart;
       While not Eof do
         begin
           Application.ProcessMessages;
           //Memo1.Lines.Add(GetNextLine); Version 1.5
         end;  
     finally
       Active := False;
     end;
   end;
   showmessage('fin');

end;

procedure TFPrincipal.HabilitarComponentesVersionBasica;
begin
  inherited;
//  {$IFDEF BASICO}
  if (TipoVersionLicencia = 'Basico') then
    begin
      //dxDSMenu.Visible:= false; Version 1.5

//Animales
   //Embriones
      AEveCompraEmbriones.Enabled:= false;
      AEveFlushing.Enabled:= false;
      AEveBajaEmbriones.Enabled:= false;
      AABMCentrosTransplantes.Enabled:= false;

   //Deps
      AImpDeps.Enabled:= false;
      AExpDeps.Enabled:= false;

//Eventos
   //Servicio
        //Servicio a Corral
      AEveServicioCorral.Enabled:= false;

   //General
      AEveCalidadCarne.Enabled:= false;

   //Transferencia Embrionaria
      AEveFlushing.Enabled:= false;
      AEveTransferenciaEmbrionaria.Enabled:= false;

//Reportes
   //Servicio

      ARepAptasNoAptas.Enabled:= false;
      ARepInseminaciones.Enabled:= false;
      
   //General

      ARepGananciaDiariaPeso.Enabled:= false;
     // AREPExistenciaRodeoPotrero.Enabled:= false;
      AREPDistGananciaDiariaPeso.Enabled:= false;
     // AREPProcreo.Enabled:= false;
      AREPRankinsDeps.Enabled:= false;
     // AREPProduccionCarne.Enabled:= false;
     // AREPCostoSuplementacion.Enabled:= false;

   //Gestaci�n

      ARepPorcentajePrenez.Enabled:= false;
      ARepNoTactadas.Enabled:= false;
      ARepVsPrenez.Enabled:= false;
      ARepDistribucionPrenez.Enabled:= false;
      ARepProyeccionPartos.Enabled:= false;

   //Parto/Nacimiento


   //Sanitario

      ARepCostosVete.Enabled:= false;
      AREPResumenTratamiento.Enabled:= false;

   //Produccion

      AREPProduccionExternos.Enabled:= false;

   //Transferencia embrionaria

      ADOCertificadoRecupEmbriones.Enabled:= false;
      ARepEmbrionesTransferidos.Enabled:= false;
      AREPInfoDonantes.Enabled:= false;
      ARepListadoImplantes.Enabled:= false;
      ARepListadoReceptoras.Enabled:= false;
      ARepStockEmbriones.Enabled:= false;


//Configuracion
   //Usuarios

      AAbmUsuarios.Enabled:= false;

   //C�digos
       //Transferencia Embrionaria

      AABMCalidadEmbrion.Enabled:= false;
      AABMEstadioEmbrion.Enabled:= false;
      AABMDestDescEmbrion.Enabled:= false;
      AABMDestinoEmbrion.Enabled:= false;
      AABMDificultadTransferencia.Enabled:= false;
      AABMUbicacionTransferencia.Enabled:= false;
      AABMUteroTransferencia.Enabled:= false;

   //Grupos Visibles

      AConfigGrupos.Enabled:= false;

   //Cambio de Usuario...

      //BBCambioUsuario.Enabled:= false; Version 1.5

//Herramientas
   //Calendarios

      //dxBarButton16.Enabled:= false; Version 1.5
      //dxBarButton17.Enabled:= false; Version 1.5

   //Cargar datos desde movil
      //CargarDeMovil.Enabled:= false; Version 1.5
   end
  else
//  {$ELSE}
      //dxDSMenu.Visible:= true; Version 1.5

//  {$ENDIF}
end;

procedure TFPrincipal.TimerRegistroLicenciaTimer(Sender: TObject);
begin
  inherited;
//    {$IFDEF BASICO}
  if (TipoVersionLicencia = 'Basico') then
    begin
      Application.CreateForm(TFRegistroLicencia, FRegistroLicencia);

      if not FRegistroLicencia.verificacopia then
       begin
         TimerRegistroLicencia.Enabled:= false;
         MostrarMensaje(tmAdvertencia, 'El Producto no se encuentra registrado. Presione aceptar y complete el Registro de Licencia.');
         FRegistroLicencia.ShowModal;
         TimerRegistroLicencia.Enabled:= true;
       end
      else
        FRegistroLicencia.Destroy;
    end;
//    {$ENDIF}
end;

//*******************************************************

procedure TFPrincipal.PMouseLeave(Sender: TObject);
begin

end;

//*******************************************************

procedure TFPrincipal.MMPrincipalClickItem(Sender: TdxBarManager;
  ClickedItem: TdxBarItem);
begin
  inherited;
end;

//*********************************************************

procedure TFPrincipal.ADOSRADenunciaNacimientosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFDOSRADenunciaNacimientos.Create(self));
  AgregarAccion(ADOSRADenunciaNacimientos.Name,'Denuncia Nacimientos - SRA',3,JvIReportes3N,JvFolRSRA,'DN');
end;


procedure TFPrincipal.FormResize(Sender: TObject);
begin
  inherited;
    {LTipoVersionLicenciaImagenesPrincip.Left:= trunc(IFondo.Width*(0.79));
    LTipoVersionLicenciaImagenesPrincip.Top:= trunc(IFondo.Height*(0.08));} //Version 1.5
  RecalcularDimensiones;
  AcomodarTabs;
  AcomodarImagenes;
  AcomodarBottom;
  ResizeFavoritos;
  AcomodarAyudaInicial;
  AcomodarAyuda;
  RedimensionarBusqueda;
  AcomodarBienvenida;
  AcomodarPanel;
  AcomodarTop;
  AcomodarEC;
  {IEliminar.Left := IFondoMiHuella.Width-IEliminar.Width;
  IEliminar.Top := IFondoMiHuella.Height-IELiminar.Height;}
end;

procedure TFPrincipal.AEveEliminarEventoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveEliminarEvento.Create(self));
  AgregarAccion(AEveEliminarEvento.Name,'Eliminar Evento',2,nil,JvFolEEliminar,'');
end;

procedure TFPrincipal.AListadoEmbrionesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFListadoEmbriones.Create(self));
  AgregarAccion(AListadoEmbriones.Name,'Listado de Embriones',1,JvAnimales3N,JvFolEmbriones,'LDE');
end;

procedure TFPrincipal.AABMFuentesDEPsExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMFuentesDEPS.Create(self));
end;

procedure TFPrincipal.dxNVEventosLinkPress(Sender: TObject;
  ALink: TdxNavBarItemLink);
begin
  inherited;
 ori:= ALink.Item;
end;

procedure TFPrincipal.CargarMenuEscritorio;
begin

end;

procedure TFPrincipal.CargarMasUsados;
begin

end;

procedure TFPrincipal.AEveImportarPartosNacimientosExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveImportarPartosNacimientos.Create(self));
  AgregarAccion(AEveImportarPartosNacimientos.Name,'Importar Partos y Nacimientos',2,JvIEventos3N,JvFolEPartos,'IPN');
end;

procedure TFPrincipal.BitBtn7Click(Sender: TObject);
var
  F : TForm2;
begin
  inherited;
  F := TForm2.Create(self);
  F.ShowModal;
  F.Destroy;
  //UImpSRA.Form2.ShowModal;
end;

procedure TFPrincipal.AABMSubCategoriasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMSubCategorias.Create(self));
end;

procedure TFPrincipal.AABMCodigosManejoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMCodigosManejo.Create(self));
end;

procedure TFPrincipal.ARepDenunciaBajaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPDenunciaBaja.Create(Self));
  AgregarAccion(ARepDenunciaBaja.Name,'Denuncia de Baja',3,JvIReportes3N,JvFolRSRA,'DDB');
end;

procedure TFPrincipal.ADOSRATipiSangADNExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFDOSRATipiSangADN.Create(self));
  AgregarAccion(ADOSRATipiSangADN.Name,'Certificado Tipificacion Sanguinea/ADN.',3,JvIReportes3N,JvFolRSRA,'CTS');
end;

procedure TFPrincipal.AAccesoDirectoExecute(Sender: TObject);
begin
  inherited;
  {if (dxBarButton85.Down) then
    FMenuEscritorio.Show
  else
    FMenuEscritorio.Close; } //Version 1.5
end;

procedure TFPrincipal.AImpERAExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFImpERA.Create(self));
  AgregarAccion(AImpERA.Name,'Importacion de Evaluaci�n Gen�tica',1,JvAnimales3N,JvFolDEPS,'IDE');
end;

procedure TFPrincipal.AgregarAccion(Nombre : String; Caption : String; Categoria : Integer; Icono, IconoPadre : TJvImage; Iniciales : String);
var
  Usados : TIniFile;
  cant : Integer;
begin
  try
    Usados := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Favoritos.ini');
    if Usados.SectionExists(Nombre) then
    begin
      cant := Usados.ReadInteger(Nombre,'cantidad',0);
      Inc(cant);
      Usados.WriteInteger(Nombre,'cantidad',cant);
    end
    else
    begin
      Usados.WriteString(Nombre,'namecaption',Caption);
      Usados.WriteString(Nombre,'nameaction',Nombre);
      Usados.WriteInteger(Nombre,'cantidad',1);
      Usados.WriteInteger(Nombre,'tipo',Categoria);
      if Icono <> nil then
        Usados.WriteString(Nombre,'imagen',Icono.Name)
      else
        Usados.WriteString(Nombre,'imagen','');
      Usados.WriteString(Nombre,'imagenpadre',IconoPadre.Name);
      Usados.WriteString(Nombre,'iniciales',Iniciales);
    end;
  finally
    Usados.Free;
  end;
end;

procedure TFPrincipal.AMasUsadosExecute(Sender: TObject);
begin
  inherited;
  {if dxBarButton90.Down then
    FMasUsados.Show
  else
    FMasUsados.Hide;} //Version 1.5
end;

procedure TFPrincipal.AABMInspeccionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMInspeccion.Create(self));
end;

procedure TFPrincipal.AABMDestCabaniaExecute(Sender: TObject);
begin
  inherited;                                                                                                            
  AbrirFormNormal(TFABMDestCabania.Create(self));
end;

procedure TFPrincipal.AREPMultiEstaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPMultiEsta.Create(self));
  AgregarAccion(AREPMultiEsta.Name,'Informe Multiestablecimiento',3,JvIReportes3N,JvFolRProduccion,'IME');
end;

///******************************************************************************************************************************************************************
///******************************************************************************************************************************************************************
///******************************************************************************************************************************************************************
///******************************************************************************************************************************************************************
///******************************************************************************************************************************************************************
///******************************************************************************************************************************************************************
///******************************************************************************************************************************************************************
///******************************************************************************************************************************************************************

procedure TFPrincipal.AgregarAccionEjecucion(Tag, Fila, Columna : Integer; Accion : TTipoAccion; Tipo : TTipoMenu; GC: TPuntComplejo; GS: TPuntSimple);
var
  Indice : Integer;
begin
  Indice := Length(Acciones);
  SetLength(Acciones,Indice+1);
  Acciones[Indice].Accion := Accion;
  Acciones[Indice].Tag := Tag;
  Acciones[Indice].Fila := Fila;
  Acciones[Indice].Columna := Columna;
  Acciones[Indice].Tipo := Tipo;
  Acciones[Indice].GrillaComp := GC;
  Acciones[Indice].GrillaSimple := GS;
  Acciones[Indice].EnUso := true;
end;

function TFPrincipal.BuscarAccion(Tag : Integer) : TRegTagsAcciones;
var
  Indice : Integer;
begin
  Result.Columna := -1;
  for Indice := 0 to Length(Acciones)-1 do
    if (Acciones[Indice].Tag = Tag) and (Acciones[Indice].EnUso) then
    begin
      Result := Acciones[Indice];
      break;
    end;
end;

procedure TFPrincipal.CerrarVentana(Sender: TObject; var Action: TCloseAction);
begin
  Sender.Destroy;
  PClient.Visible := true;
end;

procedure TFPrincipal.AcomodarTop;
begin
  JvBarraBuscarAyuda.Top := 0;
  JvBarraBuscarAyuda.Left := Ptop.Width - JvBarraBuscarAyuda.Width;

  LAyuda.Left := JvBarraBuscarAyuda.Left + 26;
  LAyuda.Top := (JvBarraBuscarAyuda.Height div 2) - (LAyuda.Height div 2) - 3;
  JvIBotAyuda.Left := LAyuda.Left + LAyuda.Width + 5;
  JvIBotAyuda.Top := (JvBarraBuscarAyuda.Height div 2) - (JvIBotAyuda.Height div 2) - 3;
  EBusqueda.Left := JvBarraBuscarAyuda.Left + 135;
  EBusqueda.Top := (JvBarraBuscarAyuda.Height div 2) - (EBusqueda.Height div 2) - 3;
  JvIBotonBuscar.Left := EBusqueda.Left + EBusqueda.Width + 5;
  JvIBotonBuscar.Top := (JvBarraBuscarAyuda.Height div 2) - (JvIBotonBuscar.Height div 2) - 3;

  LSalir.Left := JvBarraBuscarAyuda.Left + 366;
  LSalir.Top := (JvBarraBuscarAyuda.Height div 2) - (LSalir.Height div 2) - 3;
  JvISalir.Left := LSalir.Left + LSalir.Width + 5;
  JvISalir.Top := (JvBarraBuscarAyuda.Height div 2) - (JvISalir.Height div 2) - 3;

  LEstabActual.Left := Ptop.Width - LEstabActual.Width - 70;
  LEstabActual.Top := JvBarraBuscarAyuda.Top + JvBarraBuscarAyuda.Height + 20;
  JvIFondoEstablecimiento.Left := LEstabActual.Left - 15;
  JvIFondoEstablecimiento.Width := LEstabActual.Width + 30;
  JvIFondoEstablecimiento.Top := LEstabActual.Top - 6;

  LDerechos.Left := (PClient.Width div 2) - (LDerechos.Width div 2);
end;

procedure TFPrincipal.AcomodarTabs;
begin
  IFondoPestanias.Top := Ptop.Height -  IFondoPestanias.Height;
  JvReportes.Top := Ptop.Height - JvReportes.Height;
  JvHerramientas.Top := Ptop.Height - JvHerramientas.Height;
  JvEventos.Top := Ptop.Height - JvEventos.Height;
  JvAnimales.Top := Ptop.Height - JvAnimales.Height;
  JvConfig.Top := Ptop.Height - JvConfig.Height;
  if TipoActividad = ttaFeedlot then
  begin
    JvReportes.Left := (IFondoPtop.Width div 2) - (JvReportes.Width div 2);
    JvHerramientas.Left := JvReportes.Left + JvReportes.Width - 12;
    JvEventos.Left := JvReportes.Left - JvEventos.Width + 12;
    JvAnimales.Left := JvEventos.Left - JvAnimales.Width + 39;
    JvConfig.Left := JvHerramientas.Left + JvHerramientas.Width - 35;
  end
  else
  begin
    //Solapas
    GConfig.Grilla.Solapa.SolapaActiva.Left := IFondoPtop.Width-GConfig.Grilla.Solapa.Icono.Width-5;
    GHerramientas.Grilla.Solapa.SolapaActiva.Left := GConfig.Grilla.Solapa.Icono.Left - GHerramientas.Grilla.Solapa.Icono.Width+40;
    GReportes.Grilla.Solapa.SolapaActiva.Left := GHerramientas.Grilla.Solapa.Icono.Left - GReportes.Grilla.Solapa.Icono.Width+40;
    GEventos.Grilla.Solapa.SolapaActiva.Left := GReportes.Grilla.Solapa.Icono.Left - GEventos.Grilla.Solapa.Icono.Width+40;
    GAnimales.Grilla.Solapa.SolapaActiva.Left := GEventos.Grilla.Solapa.Icono.Left - GAnimales.Grilla.Solapa.Icono.Width+40;

    JvIMiHuellaA.Left := 0;
    //IReciber.Left := GMiHuella.Grilla.Solapa.SolapaActiva^.Left;
    //Iconos
    GConfig.Grilla.Solapa.Icono.Left := IFondoPtop.Width-GConfig.Grilla.Solapa.Icono.Width-5;
    GHerramientas.Grilla.Solapa.Icono.Left := GConfig.Grilla.Solapa.Icono.Left - GHerramientas.Grilla.Solapa.Icono.Width+40;
    GReportes.Grilla.Solapa.Icono.Left := GHerramientas.Grilla.Solapa.Icono.Left - GReportes.Grilla.Solapa.Icono.Width+40;
    GEventos.Grilla.Solapa.Icono.Left := GReportes.Grilla.Solapa.Icono.Left - GEventos.Grilla.Solapa.Icono.Width+40;
    GAnimales.Grilla.Solapa.Icono.Left := GEventos.Grilla.Solapa.Icono.Left - GAnimales.Grilla.Solapa.Icono.Width+40;
    JvIMiHuellaA.Left := 0;

  end;

end;

procedure TFPrincipal.AcomodarBottom;
begin
  JvIBaseContenedor.Left := (PClient.Width div 2) - (JvIBaseContenedor.Width div 2);
  JvIBaseContenedor.Top := PClient.Height - JvIBaseContenedor.Height + (JvSocalo.Height div 2);

  JvIMapa.Left := JvIBaseContenedor.Left + 37;
  JvIMapa.Top := JvIBaseContenedor.Top - (JvIMapa.Height div 3);
  JvISimulador.Left := JvIMapa.Left + JvIMapa.Width + 14;
  JvISimulador.Top := JvIMapa.Top;
  JvIContable.Left := JvISimulador.Left + JvISimulador.Width + 14;
  JvIContable.Top := JvIMapa.Top;

  JvIVolverPast.Left := JvIBaseContenedor.Left + 800 + 13;
  JvIVolver.Left := JvIVolverPast.Left + 4;
  LVolver.Left := JvIVolver.Left + JvIVolver.Width + 5;
  JvIVolverPast.Top := JvIBaseContenedor.Top + 3;
  JvIVolver.Top := JvIVolverPast.Top + (JvIVolverPast.Height div 2) - (JvIVolver.Height div 2);
  LVolver.Top := JvIVolverPast.Top + (JvIVolverPast.Height div 2) - (LVolver.Height div 2);

  JvIMiHuella1.Left := JvIBaseContenedor.Left + 300 + 50 - (JvIMiHuella1.Width div 2);
  JvIMiHuella1.Top := JvIBaseContenedor.Top - 10;
  JvIMiHuella2.Left := JvIBaseContenedor.Left + 300 + 150 - (JvIMiHuella2.Width div 2);
  JvIMiHuella2.Top := JvIBaseContenedor.Top - 10;
  JvIMiHuella3.Left := JvIBaseContenedor.Left + 300 + 250 - (JvIMiHuella3.Width div 2);
  JvIMiHuella3.Top := JvIBaseContenedor.Top - 10;
  JvIMiHuella4.Left := JvIBaseContenedor.Left + 300 + 350 - (JvIMiHuella4.Width div 2);
  JvIMiHuella4.Top := JvIBaseContenedor.Top - 10;
  JvIMiHuella5.Left := JvIBaseContenedor.Left + 300 + 450 - (JvIMiHuella5.Width div 2);
  JvIMiHuella5.Top := JvIBaseContenedor.Top - 10;

  JvIActualiza.Left := JvIBaseContenedor.Left + JvIBaseContenedor.Width - JvIActualiza.Width - 27;
  JvIActualiza.Top := JvIBaseContenedor.Top;

  JvIMapa.Visible := true;
  JvISimulador.Visible := true;
  JvIContable.Visible := true;
end;

function TFPrincipal.CalcularVisibles(Reg : TRegCasillaGrilla) : integer;
var I, K, Q : integer;
begin
  Q := 0;
  if Assigned(Reg.PanelHijo) then
  begin
    for I := 1 to Reg.ColumnasHijo do
      for K := 1 to Reg.FilasHijo do
      begin
        if (Reg.GrillaHijos[I,K].Visible) then
          Inc(Q);
      end;
  end;

  Result := Q;
end;

procedure TFPrincipal.RedimensionarSubPaneles(var Reg : TRegCasillaGrilla; Padre : TPanel);
var I,K, Cantidad : Integer;
    TA, LA, HA, WA: Integer;
    Max_Visible_COL, Max_Visible_FIL : Integer;
begin
  if Assigned(Reg.PanelHijo) then
  begin
    Max_Visible_COL := 1;
    Max_Visible_FIL := 1;
    Cantidad := 0;

    for I := 1 to Reg.ColumnasHijo do
      for K := 1 to min( Reg.FilasHijo, high(Reg.GrillaHijos[I])) do
        if   (Reg.GrillaHijos[I,K].Visible) then Inc(Cantidad);

    Max_Visible_COL := 5;
    if (Cantidad > 0) and (Cantidad <=5) then
    begin
      Max_Visible_FIL := 1;
      Max_Visible_COL := Cantidad;
    end;
    if (Cantidad > 5) and (Cantidad <=10) then
      Max_Visible_FIL := 2;
    if (Cantidad > 10) and (Cantidad <=15) then
      Max_Visible_FIL := 3;
    if (Cantidad > 15) and (Cantidad <=20) then
      Max_Visible_FIL := 4;

    HA := JvIContenedor.Height div Max_Visible_FIL;

    WA := JvIContenedor.Width div Max_Visible_COL;

    TA := JvIContenedor.Top;
    for I := 1 to Reg.ColumnasHijo do
    begin
      LA := JvIContenedor.Left;
//      for K := 1 to Reg.FilasHijo do
      for K := 1 to min( Reg.FilasHijo, high(Reg.GrillaHijos[I])) do
      begin
        if Reg.GrillaHijos[I,K].Visible then
        begin
          Reg.GrillaHijos[I,K].Left := LA;
          Reg.GrillaHijos[I,K].Top := TA;
          Reg.GrillaHijos[I,K].Width := WA;
          Reg.GrillaHijos[I,K].Height := HA;
          LA := LA + WA;
        end;
      end;
      TA := TA + HA;
    end;
  end;
end;

procedure TFPrincipal.RecalcularDimensiones;
var
  I,K,I1,K1 : Integer;
  TA, LA, HA, WA : Integer;
  Img : TPNGObject;
begin

  JvIContenedor.Width := PClient.Width - 100;
  JvIContenedor.Height := PClient.Height - JvIBaseContenedor.Height - 100;
  JvIContenedor.Top := 50;
  JvIContenedor.Left := 50;

  JvIContenedor2.Width := PClient.Width - 100;
  JvIContenedor2.Height := PClient.Height - JvIBaseContenedor.Height - 90;
  JvIContenedor2.Top := 40;
  JvIContenedor2.Left := 50;

  LEtiquetaPestaniaAnterior.Left := JvIContenedor2.Left + Trunc(JvIContenedor2.Width * 0.0533);
  LEtiquetaPestaniaAnterior.Top := JvIContenedor2.Top + 6;

  LEtiquetaPestaniaActual.Left := JvIContenedor2.Left + Trunc(JvIContenedor2.Width * 0.1667);
  LEtiquetaPestaniaActual.Top := JvIContenedor2.Top + 6;

  //Reacomodar Animales
  with GAnimales do
  begin
    HA := JvIContenedor.Height div 2;
    WA := JvIContenedor.Width div MAX_ANIMALES;
    TA := JvIContenedor.Top;
    for I := 1 to 2 do
    begin
      LA := JvIContenedor.Left;
      for K := 1 to MAX_ANIMALES_ARR do
      begin
        if Iconos[I,K].Visible then
        begin
          Iconos[I,K].Left := LA;
          Iconos[I,K].Top := TA;
          Iconos[I,K].Width := WA;
          Iconos[I,K].Height := HA;
          RedimensionarSubPaneles(Iconos[I,K],PAnimales);
          LA := LA + WA;
        end;
      end;
      TA := TA + HA;
    end;
  end;
  //Reacomodar Eventos
  with GEventos do
  begin
    HA := JvIContenedor.Height div 2;
    WA := JvIContenedor.Width div MAX_EVENTOS;
    TA := JvIContenedor.Top;
    for I := 1 to 2 do
    begin
      LA := JvIContenedor.Left;
      for K := 1 to MAX_EVENTOS_ARR do
      begin
        if Iconos[I,K].Visible then
        begin
          Iconos[I,K].Left := LA;
          Iconos[I,K].Top := TA;
          Iconos[I,K].Width := WA;
          Iconos[I,K].Height := HA;
          RedimensionarSubPaneles(Iconos[I,K],PEventos);
          if Iconos[I,k].Cant_Subnivel > 0 then
            if Assigned(Iconos[I,k].GrillaHijos[1,1].GrillaHijos) then
              RedimensionarSubPaneles(Iconos[I,k].GrillaHijos[1,1].GrillaHijos^,PEventos);
          LA := LA + WA;
        end;
      end;
      TA := TA + HA;
    end;
  end;
  //Reacomodar Reportes
  with GReportes do
  begin
    HA := JvIContenedor.Height div 2;
    {if TipoActividad = ttaCabania then
      WA := JvIContenedor.Width div (MAX_REPORTES-1)
    else}
      WA := JvIContenedor.Width div MAX_REPORTES;
    TA := JvIContenedor.Top;
    for I := 1 to 2 do
    begin
      LA := JvIContenedor.Left;
      for K := 1 to MAX_REPORTES_ARR do
      begin
        if Iconos[I,K].Visible then
        begin
          Iconos[I,K].Left := LA;
          Iconos[I,K].Top := TA;
          Iconos[I,K].Width := WA;
          Iconos[I,K].Height := HA;
          RedimensionarSubPaneles(Iconos[I,K],PReportes);
          if Iconos[I,k].Cant_Subnivel > 0 then
            if Assigned(Iconos[I,k].GrillaHijos[1,1].GrillaHijos) then
              RedimensionarSubPaneles(Iconos[I,k].GrillaHijos[1,1].GrillaHijos^,PReportes);
          //if not((MuestraFenotipos) and (K =4) and (I=2)) then
            LA := LA + WA;
        end;
      end;
      TA := TA + HA;
    end;
  end;
  //Reacomodar Herramientas
  with GHerramientas do
  begin
    HA := JvIContenedor.Height div 2;
    WA := JvIContenedor.Width div MAX_HERRAMIENTAS;
    TA := JvIContenedor.Top;
    for I := 1 to 2 do
    begin
      LA := JvIContenedor.Left;
      for K := 1 to MAX_HERRAMIENTAS do
      begin
        if Iconos[I,K].Visible then
        begin
          Iconos[I,K].Left := LA;
          Iconos[I,K].Top := TA;
          Iconos[I,K].Width := WA;
          Iconos[I,K].Height := HA;
          RedimensionarSubPaneles(Iconos[I,K],PHerramientas);
          LA := LA + WA;
        end;
      end;
      TA := TA + HA;
    end;
  end;
  //Reacomodar Configuracion
  with GConfig do
  begin
    HA := JvIContenedor.Height div 2;
    WA := JvIContenedor.Width div MAX_CONGIF;
    TA := JvIContenedor.Top;
    for I := 1 to 2 do
    begin
      LA := JvIContenedor.Left;
      for K := 1 to MAX_CONGIF do
      begin
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        RedimensionarSubPaneles(Iconos[I,K],PConfig);
        if Iconos[I,k].Cant_Subnivel > 0 then
          for I1 := 1 to Iconos[I,k].ColumnasHijo do
            for K1 := 1 to Iconos[I,k].FilasHijo do
            begin
              if Assigned(Iconos[I,k].GrillaHijos[I1,K1].GrillaHijos) then
                RedimensionarSubPaneles(Iconos[I,k].GrillaHijos[I1,k1].GrillaHijos^,PConfig);
            end;
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;

end;

procedure TFPrincipal.AcomodarImagenes;
var
  I, K : Integer;
begin

  for I := 1 to 2 do
    for K := 1 to MAX_ANIMALES_ARR do
      AcomodarIcono(GAnimales.Iconos[I,K]);

  for I := 1 to 2 do
    for K := 1 to MAX_EVENTOS_ARR do
      AcomodarIcono(GEventos.Iconos[I,K]);

  for I := 1 to 2 do
    for K := 1 to MAX_REPORTES_ARR do
      AcomodarIcono(GReportes.Iconos[I,K]);

  for I := 1 to 2 do
    for K := 1 to MAX_HERRAMIENTAS do
      AcomodarIcono(GHerramientas.Iconos[I,K]);

  for I := 1 to 2 do
    for K := 1 to MAX_CONGIF do
      AcomodarIcono(GConfig.Iconos[I,K]);
end;

procedure TFPrincipal.ArmarPanelesTercerNivel(var Reg : TRegCasillaGrilla);
var
  Panel,P1, P2 : TPanel;
  Fila, Col, Indice : Integer;
  ImgAnterior, Imagen, Fondo, Volver, F : TJvImage;
  MAX_FILA : Integer;
  MAX_COL : Integer;
  WA, HA : Integer;
  LA, TA : Integer;
  Cantidad : Integer;
  Leyenda, Iniciales, Posicion, Vuelta : TLabel;
  Tag3N, TagPadre : Integer;
begin
  if Assigned(Reg.Icono) then
  begin
    if (Reg.TipoPadre = tpmEveServicioNatural) or (Reg.TipoPadre = tpmCodigosEstabAnimales) or (Reg.TipoPadre = tpmCodigosEstabCria)
       or (Reg.TipoPadre = tpmCodigosEstabEstab) or (Reg.TipoPadre = tpmCodigosEstabGeneral) or (Reg.TipoPadre = tpmCodigosEstabGesta)
       or (Reg.TipoPadre = tpmCodigosEstabParto) or (Reg.TipoPadre = tpmCodigosEstabServicio) or (Reg.TipoPadre = tpmCodigosEstabSanitarios)
       or (Reg.TipoPadre = tpmCodigosEstabTransferencia) or (Reg.TipoPadre = tpmDocBraford) or (Reg.TipoPadre = tpmDocBrangus) or (Reg.TipoPadre = tpmDocAsociaciones) then
    begin
      Tag3N := (Reg.Leyenda.Tag * 1000)+1 ;

    end
    else
      Tag3N := (Reg.Carpeta.Tag * 100)+1;
    TagPadre := Reg.Carpeta.Tag;
    Cantidad := 0;
    Panel := TPanel.Create(self);
    Panel.ControlStyle := Panel.ControlStyle + [csDisplayDragImage];
    Panel.Parent := PClient;
    Panel.Caption := '';
    Panel.Align := alClient;
    Panel.Visible := false;
    Panel.BevelOuter := bvNone;
    Panel.BevelInner := bvNone;
    {if (Reg.TipoPadre = tpmEveServicioNatural) or (Reg.TipoPadre = tpmCodigosEstabAnimales) or (Reg.TipoPadre = tpmCodigosEstabCria)
       or (Reg.TipoPadre = tpmCodigosEstabEstab) or (Reg.TipoPadre = tpmCodigosEstabGeneral) or (Reg.TipoPadre = tpmCodigosEstabGesta)
       or (Reg.TipoPadre = tpmCodigosEstabParto) or (Reg.TipoPadre = tpmCodigosEstabServicio) or (Reg.TipoPadre = tpmCodigosEstabSanitarios)
       or (Reg.TipoPadre = tpmCodigosEstabTransferencia) or (Reg.TipoPadre = tpmDocBraford) or (Reg.TipoPadre = tpmDocBrangus) or (Reg.TipoPadre = tpmDocAsociaciones) then  }
    Panel.Tag := TagPadre;
    Reg.PanelHijo := Panel;
    Panel.Tag := Reg.Carpeta.Tag;
    Fondo := TJvImage.Create(self);
    Fondo.Parent := Panel;
    Fondo.Align := alClient;
    Fondo.AutoSize := true;
    Fondo.Stretch := true;
    Fondo.ControlStyle := Fondo.ControlStyle + [csDisplayDragImage];
    Fondo.OnDragOver := JvMiHuellaDragOver;
    Fondo.OnDragDrop := IFondoAnimalesDragDrop;
    Reg.PanelIconosHijos := Panel;
    case Reg.Tipo of
      ttmAnimales : begin Fondo.Picture := IFondo3NAnimales.Picture; end;
      ttmConfig : begin Fondo.Picture := IFondo3NConfiguracion.Picture; end;
      ttmEventos : begin Fondo.Picture := IFondo3NEventos.Picture; end;
      ttmHerramientas : begin Fondo.Picture := IFondo3NHerramientas.Picture; end;
      ttmReportes : begin Fondo.Picture := IFondo3NReportes.Picture; end;
      ttmCodigos : begin Fondo.Picture := IFondo3NConfiguracion.Picture; end;
      ttmServicio : begin Fondo.Picture := IFondo3NEventos.Picture; end;
      //ttmMiHuella : begin Fondo.Picture := IFondo3NEventos.Picture; end;
    end;
    Reg.Fondo := Fondo;

    MAX_FILA := 5;
    if (Reg.Cant_Subnivel > 0) and (Reg.Cant_Subnivel <= 5) then
    begin
      MAX_FILA := Reg.Cant_Subnivel;
      MAX_COL := 1;
    end;
    if (Reg.Cant_Subnivel > 5) and (Reg.Cant_Subnivel <= 10) then
      MAX_COL := 2;
    if (Reg.Cant_Subnivel > 10) and (Reg.Cant_Subnivel <= 15) then
      MAX_COL := 3;
    if (Reg.Cant_Subnivel > 15) and (Reg.Cant_Subnivel <= 20) then
      MAX_COL := 4;

    if Reg.Cant_Subnivel = 0 then
      MAX_COL := 0;
    SetLength(Reg.GrillaHijos,MAX_COL+1);
    if MAX_FILA > 0 then
      WA := Panel.ClientWidth div MAX_FILA;
    if MAX_COL > 0 then
      HA := Panel.ClientHeight div MAX_COL;
    Reg.ColumnasHijo := MAX_COL;
    Reg.FilasHijo := MAX_FILA;
    TA := 0;
    for Col := 1 to MAX_COL do
    begin
      SetLength(Reg.GrillaHijos[Col],MAX_FILA+1);
      LA := 0;
      for Fila := 1 to MAX_FILA do
      begin
        if (Cantidad >= Reg.Cant_Subnivel) then
          break;
        Inc(Cantidad);

        Imagen := TJvImage.Create(self);
        Imagen.Picture := Reg.Icono60.Picture;
        if ( Reg.Icono60<>nil) and  (Reg.Icono60.Pictures<>nil) then
           Imagen.Pictures.PicEnter := Reg.Icono60.Pictures.PicEnter
        else
        begin
        // Esto no tendria que pasar.. Se estaria inicializando mal
//          showMessage('');
        end;
        Imagen.Parent := Panel;
        Imagen.AutoSize := true;
        Imagen.Left := LA;
        Imagen.Top := TA;
        Imagen.Center := true;
        Imagen.Tag := Tag3N;
        Imagen.Cursor := crHandPoint;
        Imagen.OnMouseEnter := MouseEnter;
        Imagen.OnMouseLeave := MouseLeave;
        Imagen.OnClick := Click;
        Imagen.Visible := False;

        ImgAnterior := TJvImage.Create(self);
        //ImgAnterior.AutoSize := true;
        ImgAnterior.Width := 110;
        ImgAnterior.Height := 110;
        ImgAnterior.Parent := Panel;
        ImgAnterior.Left := LA;
        ImgAnterior.Top := TA;
        ImgAnterior.Center := true;
        ImgAnterior.Tag := Tag3N;
        ImgAnterior.Cursor := crHandPoint;
        ImgAnterior.OnMouseDown := JvMouseDown;
        ImgAnterior.OnMouseEnter := MouseEnter;
        ImgAnterior.OnStartDrag := JvStartDrag;
        ImgAnterior.OnMouseLeave := MouseLeave;
        ImgAnterior.OnClick := Click;

        if Reg.FondoBoton.Pictures<>nil then
        begin
         ImgAnterior.Picture := Reg.FondoBoton.Picture;
         ImgAnterior.Pictures.PicEnter := Reg.FondoBoton.Pictures.PicEnter;
         ImgAnterior.Pictures.PicClicked2 := Reg.Icono60.Pictures.PicEnter;
         ImgAnterior.Pictures.PicClicked1 := Reg.Carpeta.Pictures.PicClicked1;
         ImgAnterior.Pictures.PicDown := Reg.Icono60.Picture;
        end;
        Reg.GrillaHijos[Col,Fila].IconoG := ImgAnterior;

        Leyenda := TLabel.Create(self);
        Leyenda.Parent := Panel;
        Leyenda.Transparent := true;
        Leyenda.AutoSize := false;
        Leyenda.WordWrap := true;
        Leyenda.Alignment := taCenter;
        Leyenda.Font.Name := 'Arial';
        Leyenda.Font.Size := 10;
        Leyenda.Font.Style := [fsBold];
        Leyenda.Top := TA+Reg.Carpeta.Height;
        Leyenda.Left := LA+Reg.Carpeta.Width-25;
        Leyenda.Width := Reg.Carpeta.Width+15;
        Leyenda.Height := 50;
        Leyenda.OnMouseEnter := LabelEnter;
        Leyenda.OnMouseLeave := LabelLeave;
        Leyenda.OnClick := Click;
        Leyenda.Cursor := crHandPoint;
        Leyenda.Tag := Tag3N;

        Iniciales := TLabel.Create(self);
        Iniciales.Parent := Panel;
        Iniciales.Transparent := true;
        Iniciales.AutoSize := false;
        Iniciales.WordWrap := true;
        Iniciales.Alignment := taCenter;
        Iniciales.Font.Name := 'HelveticaNeue-BoldCond';
        Iniciales.Font.Size := 20;
        Iniciales.Font.Style := [fsBold];
        Iniciales.Width := 66;
        Iniciales.Height := 32;
        Iniciales.Top := TA + (Imagen.Height div 2);
        Iniciales.Left := LA + (LA div 2) - (Iniciales.Height div 2);
        {Iniciales.OnMouseEnter := LabelEnter;
        Iniciales.OnMouseLeave := LabelLeave;}
        Iniciales.OnClick := Click;
        Iniciales.Cursor := crHandPoint;
        Iniciales.Tag := Tag3N;
        case Reg.Tipo of
          ttmAnimales : begin
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := PAnimales;
                          Iniciales.Font.Color := $0015243C;
                          if TipoActividad = ttaFeedlot then
                            Leyenda.Font.Color := clWhite
                          else
                            Leyenda.Font.Color := $0015243C;
                        end;
          ttmEventos : begin
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := PEventos;
                          Iniciales.Font.Color := $00444545;
                          if TipoActividad = ttaFeedlot then
                            Leyenda.Font.Color := clWhite
                          else
                            Leyenda.Font.Color := $00444545;
                        end;
          ttmServicio : begin
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PEventos;
                          Iniciales.Font.Color := $00444545;
                          if TipoActividad = ttaFeedlot then
                            Leyenda.Font.Color := clWhite
                          else
                            Leyenda.Font.Color := $00444545;
                        end;
          ttmCodigos : begin
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PConfig;
                          Iniciales.Font.Color := $002D1EBE;
                          if TipoActividad = ttaFeedlot then
                            Leyenda.Font.Color := clWhite
                          else
                            Leyenda.Font.Color := $002D1EBE;
                       end;
          ttmReportes : begin
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PReportes;
                          Iniciales.Font.Color := $00834A2A;
                          if TipoActividad = ttaFeedlot then
                            Leyenda.Font.Color := clWhite
                          else
                            Leyenda.Font.Color := $00834A2A;
                        end;
          ttmHerramientas : begin
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PHerramientas;
                          Iniciales.Font.Color := $00494949;
                          if TipoActividad = ttaFeedlot then
                            Leyenda.Font.Color := clWhite
                          else
                            Leyenda.Font.Color := $00494949;
                        end;
          ttmConfig : begin
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PConfig;
                          Iniciales.Font.Color := $002D1EBE;
                          if TipoActividad = ttaFeedlot then
                            Leyenda.Font.Color := clWhite
                          else
                            Leyenda.Font.Color := $002D1EBE;
                        end;
          {ttmMiHuella : begin
                          Imagen.Picture := JvIMiHuella3N.Picture;
                          Imagen.Pictures.PicEnter := JvIMiHuella3N.Pictures.PicEnter;
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PMiHuella;
                          Iniciales.Font.Color := $00657100;
                          if TipoActividad = ttaFeedlot then
                            Leyenda.Font.Color := clWhite
                          else
                            Leyenda.Font.Color := $00657100;
                        end;       }
        end;

        AsignarAccion(self,Reg.GrillaHijos[Col,Fila],Cantidad,Reg.TipoPadre);

        if Assigned(Reg.GrillaHijos[Col,Fila].Accion) then
        begin
          Leyenda.Caption := Reg.GrillaHijos[Col,Fila].Accion.Caption;
          Iniciales.Caption := Reg.GrillaHijos[Col,Fila].Iniciales;
        end
        else
        begin
          if (Cantidad = 1) and (Reg.TipoPadre = tpmEveServicios) then
          begin
            Leyenda.Caption := 'Servicio Natural';//Reg.GrillaHijos[Col,Fila].Leyenda.Caption;
            Iniciales.Caption := Reg.GrillaHijos[Col,Fila].Iniciales;
          end;

          if Reg.TipoPadre = tpmConfCodigos then
          begin
            if Assigned(Reg.GrillaHijos[Col,Fila].Leyenda) then
              Leyenda.Caption := Reg.GrillaHijos[Col,Fila].Leyenda.Caption;
            Iniciales.Caption := Reg.GrillaHijos[Col,Fila].Iniciales;
          end;

          if Reg.TipoPadre = tpmDocAsociaciones then
          begin
            if Assigned(Reg.GrillaHijos[Col,Fila].Leyenda) then
              Leyenda.Caption := Reg.GrillaHijos[Col,Fila].Leyenda.Caption;
            Iniciales.Caption := Reg.GrillaHijos[Col,Fila].Iniciales;
          end;

        end;
        if ((Cantidad = 1) and (Reg.TipoPadre = tpmEveServicios)) or (Reg.TipoPadre = tpmConfCodigos) or (Reg.TipoPadre = tpmDocAsociaciones) then
          AgregarAccionEjecucion(Tag3N,Fila,Col,ttaEntrar,Reg.Tipo,nil,@Reg.GrillaHijos[Col,Fila])
        else
          AgregarAccionEjecucion(Tag3N,Fila,Col,ttaEjecutar,Reg.Tipo,nil,@Reg.GrillaHijos[Col,Fila]);

        Reg.GrillaHijos[Col,Fila].LIniciales := Iniciales;
        Reg.GrillaHijos[Col,Fila].Leyenda := Leyenda;

        Reg.GrillaHijos[Col,Fila].Height := HA;
        Reg.GrillaHijos[Col,Fila].Width := WA;
        Reg.GrillaHijos[Col,Fila].Left := LA;
        Reg.GrillaHijos[Col,Fila].Top := TA;
        LA := LA + WA;
        Inc(Tag3N);
      end;
      TA := TA + HA;
    end;
  end;
  if Reg.Cant_Subnivel = 0 then
      Reg.PanelHijo := nil;
end;


procedure TFPrincipal.HabilitarPanel(Panel : TPanel; Actual : String; TP: TTipoMenu);
begin
  if Assigned(Panel) then
  begin
    Panel.Visible := true;
    Panel.BringToFront;
    AsignarImagenesInferiores(Panel,2);

    LEtiquetaPestaniaActual.Caption := Actual;
    case TP of
      ttmAnimales : LEtiquetaPestaniaAnterior.Caption := 'Animales';
      ttmEventos : LEtiquetaPestaniaAnterior.Caption := 'Eventos';
      ttmReportes : LEtiquetaPestaniaAnterior.Caption := 'Reportes';
      ttmConfig : LEtiquetaPestaniaAnterior.Caption := 'Configuraci�n';
      ttmHerramientas : LEtiquetaPestaniaAnterior.Caption := 'Herramientas';
    end;

    case TP of
      ttmAnimales : JvIVolver.Tag := 1;
      ttmEventos : JvIVolver.Tag := 2;
      ttmReportes : JvIVolver.Tag := 3;
      ttmConfig : JvIVolver.Tag := 5;
      ttmHerramientas : JvIVolver.Tag := 4;
      ttmServicio : JvIVolver.Tag := 21;
      ttmCodigos : JvIVolver.Tag := 51;
    end;

  end;
end;

procedure TFPrincipal.InicGrillas;
begin
  uLayoutPrincipal.InicGrillas(self);
  Refresh;
end;

procedure TFPrincipal.AsignarImagenesInferiores(Panel : TPanel; Nivel : Integer);
begin
  IBubble.Parent := Panel;
  IBubbleProd.Parent := Panel;

  JvIBaseContenedor.Parent := Panel;
  JvIBaseContenedor.BringToFront;

  JvIMiHuella1.Parent := Panel;
  JvIMiHuella2.Parent := Panel;
  JvIMiHuella3.Parent := Panel;
  JvIMiHuella4.Parent := Panel;
  JvIMiHuella5.Parent := Panel;
  JvIMiHuella1.BringToFront;
  JvIMiHuella2.BringToFront;
  JvIMiHuella3.BringToFront;
  JvIMiHuella4.BringToFront;
  JvIMiHuella5.BringToFront;

  JvIMapa.Parent := Panel;
  JvISimulador.Parent := Panel;
  JvIContable.Parent := Panel;
  JvIMapa.BringToFront;
  JvISimulador.BringToFront;
  JvIContable.BringToFront;

  JvIVolverPast.Parent := Panel;
  JvIVolver.Parent := Panel;
  LVolver.Parent := Panel;
  JvIVolverPast.BringToFront;
  JvIVolver.BringToFront;
  LVolver.BringToFront;

  JvIActualiza.Parent := Panel;
  JvIActualiza.BringToFront;

  LEtiquetaPestaniaAnterior.Visible := false;
  LEtiquetaPestaniaActual.Visible := false;
  LEtiquetaPestaniaActual.Parent := Panel;
  LEtiquetaPestaniaAnterior.Parent := Panel;

  if Nivel = 2 then
  begin
    LEtiquetaPestaniaAnterior.Visible := true;
    LEtiquetaPestaniaActual.Visible := true;
    LEtiquetaPestaniaActual.BringToFront;
    LEtiquetaPestaniaAnterior.BringToFront;
  end;
end;

procedure TFPrincipal.HabilitarPaneles(Panel : Integer);
begin
  PAyudaInicial.SendToBack;
  PAnimales.SendToBack;
  PEventos.SendToBack;
  PReportes.SendToBack;
  PHerramientas.SendToBack;
  PConfig.SendToBack;
  Payuda.SendToBack;
  PBusqueda.SendToBack;
  //PPanelControl.SendToBack;
  PMiHuella.SendToBack;
  PSifta.SendToBack;
  case Panel of
    1 : begin
          PAnimales.BringToFront;
          PAnimales.Align := alClient;
          IFondoAnimales.Align := alClient;
          AsignarImagenesInferiores(PAnimales,1);
          if AsistenteCargaMasiva then
            PAInicioCargaM.Visible:=true;
          if AsistenteCMasivaPlanilla then
            PAInicioCMP.Visible:= true;
          IFondoAnimales.SendToBack;
          //IFondoB.Picture := IFondoBotAnim.Picture;
        end;
    2 : begin
          PEventos.BringToFront;
          PEventos.Align := alClient;
          IFondoEventos.Align := alClient;
          AsignarImagenesInferiores(PEventos,1);
          //IFondoB.Picture := IFondoBotEve.Picture;
        end;
    3 : begin
          PReportes.BringToFront;
          PReportes.Align := alClient;
          IFondoReportes.Align := alClient;
          AsignarImagenesInferiores(PReportes,1);
          //IFondoB.Picture := IFondoBotRep.Picture;
        end;
    4 : begin
          PHerramientas.BringToFront;
          PHerramientas.Align := alClient;
          IFondoHerramientas.Align := alClient;
          AsignarImagenesInferiores(PHerramientas,1);
          //IFondoB.Picture := IFondoBotHerr.Picture;
        end;
    5 : begin
          PConfig.BringToFront;
          PConfig.Align := alClient;
          IFondoConfig.Align := alClient;
          AsignarImagenesInferiores(PConfig,1);
          //IFondoB.Picture := IFondoBotConfig.Picture;
        end;
    6 : begin
          PAyudaInicial.BringToFront;
          PAyudaInicial.Align := alClient;
          IFondoAyudaInicial.Align := alClient;
          IBubble.Parent := PAyudaInicial;
          IBubbleProd.Parent := PAyudaInicial;
          AsignarImagenesInferiores(PAyudaInicial,4);
          //IFondoB.Picture := ifon
        end;
    7 : begin
          PAyuda.BringToFront;
          PAyuda.Align := alClient;
          IFondoAyuda.Align := alClient;
          IBubble.Parent := PBusqueda;
          IBubbleProd.Parent := PBusqueda;
          AsignarImagenesInferiores(PAyuda,4);
        end;
    8 : begin
          PBusqueda.BringToFront;
          PBusqueda.Align := alClient;
          IBubble.Parent := PBusqueda;
          IBubbleProd.Parent := PBusqueda;
          JvIBaseContenedor.BringToFront;
          //IFondoB.Picture := IFondoBusqueda.Picture;
        end;
    9 : begin
          PBienvenida.BringToFront;
          PBienvenida.Align := alClient;
          IBienvenida.Align := alClient;
          //AsignarImagenesInferiores(PBienvenida,4);
        end;
    10 : begin
          {PPanelControl.BringToFront;
          PPanelControl.Align := alClient;
          IBubble.Parent := PPanelControl;
          IBubbleProd.Parent := PPanelControl;}
         end;
    11 : begin
          {$IFDEF EC}
          PEducacionContinua.BringToFront;
          PEducacionContinua.Align := alClient;
          IFondoEducacionContinua.Align := alClient;
          IBubble.Parent := PEducacionContinua;
          IBubbleProd.Parent := PEducacionContinua;
          AsignarImagenesInferiores(PEducacionContinua,4);
          {$ELSE}

          Refresh; // Refrescar los FAvoritos
          PSifta.BringToFront;
          PSifta.Align := alClient;
          IFondoSifta.Align := alClient;
          IBubble.Parent := PSifta;
          IBubbleProd.Parent := PSifta;
          AsignarImagenesInferiores(PSifta,4);
          //IFondoB.Picture := IFondoBotHuella.Picture;
       {   Refresh; // Refrescar los FAvoritos
          PMiHuella.BringToFront;
          PMiHuella.Align := alClient;
          IFondoMiHuella.Align := alClient;
          IBubble.Parent := PMiHuella;
          IBubbleProd.Parent := PMiHuella;
          AsignarImagenesInferiores(PMiHuella,4);
          //IFondoB.Picture := IFondoBotHuella.Picture; }
          {$ENDIF}
         end;
  end;
end;

procedure TFPrincipal.HabilitarPestania(Pestania : Integer);
begin
  if TipoActividad = ttaFeedlot then
  begin
    case Pestania of
      1 : begin
            JvAnimales.Picture := JvAnimales.Pictures.PicEnter;
            JvEventos.Picture := JvEventos.Pictures.PicClicked2;
            JvReportes.Picture := JvReportes.Pictures.PicClicked2;
            JvHerramientas.Picture := JvHerramientas.Pictures.PicClicked2;
            JvConfig.Picture := JvConfig.Pictures.PicClicked2;
          end;
      2 : begin
            JvAnimales.Picture := JvAnimales.Pictures.PicClicked2;
            JvEventos.Picture := JvEventos.Pictures.PicEnter;
            JvReportes.Picture := JvReportes.Pictures.PicClicked2;
            JvHerramientas.Picture := JvHerramientas.Pictures.PicClicked2;
            JvConfig.Picture := JvConfig.Pictures.PicClicked2;
          end;
      3 : begin
            JvAnimales.Picture := JvAnimales.Pictures.PicClicked2;
            JvEventos.Picture := JvEventos.Pictures.PicClicked2;
            JvReportes.Picture := JvReportes.Pictures.PicEnter;
            JvHerramientas.Picture := JvHerramientas.Pictures.PicClicked2;
            JvConfig.Picture := JvConfig.Pictures.PicClicked2;
          end;
      4 : begin
            JvAnimales.Picture := JvAnimales.Pictures.PicClicked2;
            JvEventos.Picture := JvEventos.Pictures.PicClicked2;
            JvReportes.Picture := JvReportes.Pictures.PicClicked2;
            JvHerramientas.Picture := JvHerramientas.Pictures.PicEnter;
            JvConfig.Picture := JvConfig.Pictures.PicClicked2;
          end;
      5 : begin
            JvAnimales.Picture := JvAnimales.Pictures.PicClicked2;
            JvEventos.Picture := JvEventos.Pictures.PicClicked2;
            JvReportes.Picture := JvReportes.Pictures.PicClicked2;
            JvHerramientas.Picture := JvHerramientas.Pictures.PicClicked2;
            JvConfig.Picture := JvConfig.Pictures.PicEnter;
          end;
    end;
  end
  else
  begin
    JvIAnimalesA.Visible := Pestania = 1;
    JvIEventosA.Visible := Pestania = 2;
    JvIReportesA.Visible := Pestania = 3;
    JvIHerramientasA.Visible := Pestania = 4;
    JvIConfigA.Visible := Pestania = 5;
    JvIMiHuellaA.Visible := Pestania = 11;
  end;
  FormResize(self);
end;

procedure TFPrincipal.JvImageClick(Sender: TObject);
begin
  {if ((Sender as TjvImage).Tag = 11) then
  begin
    PAAsistente1.Visible:=true;
    PAAsistente2.Visible:=true;
    PAAsistente3.Visible:=true;
  end
  else
  begin
    PAAsistente1.Visible:=false;
    PAAsistente2.Visible:=false;
    PAAsistente3.Visible:=false;
  end;}
  PAAnimales.Visible:= false;
  PAInicioMapa.Visible:= false;
  PAInicioCargaM.Visible:=false;
  PAInicioCMP.Visible:= false;
  PACargaM.Visible:= false;
  PACargaMP.Visible:= false;
//  PSifta.Visible := true;
  HabilitarPestania((Sender as TjvImage).Tag);
  HabilitarPaneles((Sender as TjvImage).Tag);
  FormResize(self);
end;


procedure TFPrincipal.JvSalirClick(Sender: TObject);
begin
  Close;
end;


procedure TFPrincipal.MouseEnter(Sender: TObject);
var
  R : TRegTagsAcciones;
begin
  inherited;
  R := BuscarAccion((Sender as TControl).Tag);
  HabilitarAyuda(R.Tag);
  if R.Tag >= 1000000 then
    JvBHint.ActivateHint(R.GrillaComp^.Carpeta,#13+R.GrillaComp^.Leyenda.Caption+#13);
end;

procedure TFPrincipal.LabelEnter(Sender: TObject);
begin
  if Assigned(Sender) then
  begin
    (Sender as TLabel).Font.Size := (Sender as TLabel).Font.Size + 1;
    (Sender as TLabel).Left := (Sender as TLabel).Left + 10;
    (Sender as TLabel).Top := (Sender as TLabel).Top + 10;
  end;
end;

procedure TFPrincipal.ImageEnter(Sender: TObject);
begin
  if Assigned(Sender) then
    (Sender as TJvImage).State := stEntered;
end;

procedure TFPrincipal.MouseLeave(Sender: TObject);
var
  R : TRegTagsAcciones;
begin
  inherited;
  R := BuscarAccion((Sender as TControl).Tag);
  HabilitarAyuda(R.Tag);
  if R.Tag >= 1000000 then
    JvBHint.CancelHint;

end;

procedure TFPrincipal.LabelLeave(Sender: TObject);
begin
  if Assigned(Sender) then
  begin
    (Sender as TLabel).Font.Size := (Sender as TLabel).Font.Size - 1;
    (Sender as TLabel).Left := (Sender as TLabel).Left - 10;
    (Sender as TLabel).Top := (Sender as TLabel).Top - 10;
  end;
end;

procedure TFPrincipal.ImageLeave(Sender: TObject);
begin
  if Assigned(Sender) then
    (Sender as TJvImage).State := stDefault;
end;

procedure TFPrincipal.HabilitarAyuda(Tag:integer);
begin
   case Tag of
     12: begin    // Click en movimientos
             PAInicioCargaM.Visible:=false;
             PAInicioCMP.Visible:=false;
             //if AsistenteCargaMasiva then
             //   PACargaM.Visible:=true;
             //if AsistenteCMasivaPlanilla then
             //  PACargaMP.Visible:=true;
           end;
     1202: begin

           // PACargaMP.Visible:=false;
           // PACargaM.Visible:=false;
           end;
   end;
end;

procedure TFPrincipal.Click(Sender: TObject);
var
  R : TRegTagsAcciones;
begin
  R := BuscarAccion((Sender as TControl).Tag);
  HabilitarAyuda(R.Tag);
  case R.Accion of
    ttaEjecutar : begin
                    if R.Tag < 100 then
                    begin
                      if Assigned(R.GrillaComp^.Accion) then
                        R.GrillaComp^.Accion.Execute;
                    end
                    else
                    begin
                      if (R.Tag < 10000) then
                      begin
                        if Assigned(R.GrillaSimple^.Accion) then
                          R.GrillaSimple^.Accion.Execute;
                      end
                      else
                      begin
                        //R.GrillaComp^.Accion.Execute;
                        if (R.Tag-10000)  < 100 then
                        begin
                          if Assigned(R.GrillaComp^.Accion) then
                            R.GrillaComp^.Accion.Execute;
                        end
                        else
                        begin
                          if R.Tag < 1000000 then
                          begin
                            if Assigned(R.GrillaSimple^.Accion) then
                              R.GrillaSimple^.Accion.Execute;
                          end
                          else
                            R.GrillaComp^.Accion.Execute;
                        end;
                      end;
                    end;
                  end;
    ttaEntrar: begin
                 if R.Tag < 100 then
                  HabilitarPanel(R.GrillaComp^.PanelHijo, R.GrillaComp^.Leyenda.Caption, R.GrillaComp^.Tipo)
                 else
                 begin
                  if R.Tag < 10000 then
                    HabilitarPanel(R.GrillaSimple^.GrillaHijos^.PanelHijo, R.GrillaSimple^.GrillaHijos^.Leyenda.Caption, R.GrillaSimple^.GrillaHijos^.Tipo)
                  else
                  begin
                    if (R.Tag-10000)  < 100 then
                      HabilitarPanel(R.GrillaComp^.PanelHijo, R.GrillaComp^.Leyenda.Caption, R.GrillaComp^.Tipo)
                    else
                      HabilitarPanel(R.GrillaSimple^.GrillaHijos^.PanelHijo, R.GrillaSimple^.GrillaHijos^.Leyenda.Caption, R.GrillaSimple^.GrillaHijos^.Tipo);
                  end;
                 end;
                 FormResize(self);
               end;
  end;
end;

procedure TFPrincipal.SeleccionarRazaPredom;
var I : integer;
begin

  I := 0;
  SetLength(RazasElegidas,0);

  RazaAngus := false;
  RazaBraford := false;
  RazaBrangus := false;
  MuestraFenotipos := false;

  if TipoActividad <> ttaFeedlot then
  begin

    IBQRazaPredEstablecimiento.Close;
    IBQRazaPredEstablecimiento.ParamByName('esta').AsInteger := EstablecimientoActual;
    IBQRazaPredEstablecimiento.Open;
    IBQRazaPredEstablecimiento.First;

    while not(IBQRazaPredEstablecimiento.Eof) do
    begin
         if (IBQRazaPredEstablecimiento.FieldValues['raza_elegida'] <> null) then
         begin
           SetLength(RazasElegidas,I+1);
           RazasElegidas[I] := IBQRazaPredEstablecimiento.FieldValues['raza_elegida'];
           Inc(I);
         end;
         IBQRazaPredEstablecimiento.Next;
    end;

    for I := 0 to Length(RazasElegidas)-1 do
    begin
      if ((RazasElegidas[I] = 10) or (RazasElegidas[I] = 11) or (RazasElegidas[I] = 12) or (RazasElegidas[I] = 28) or (RazasElegidas[I] = 30)) then
        MuestraFenotipos := true;

      if ((RazasElegidas[I] = 2) or (RazasElegidas[I] = 3) or (RazasElegidas[I] = 29)) then
        RazaAngus := true;

      if ((RazasElegidas[I] = 11)) then
        RazaBraford := true;

      if ((RazasElegidas[I] = 12) or (RazasElegidas[I] = 28) or (RazasElegidas[I] = 30)) then
        RazaBrangus := true;
    end;


  end;
  RedibujarPaneles;
end;


procedure TFPrincipal.ACargarMovilExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFMovCargarDatos.Create(Self));
  AgregarAccion(ACargarMovil.Name,'Cargar Datos desde Movil',4,nil,JvFolMovil,'');
end;

procedure TFPrincipal.ClickVolver(Sender : TObject);
begin
  if (Sender as TJvImage).Tag in [10..19] then
  begin
    HabilitarPaneles(1);
    HabilitarPestania(1);
  end;
  if (Sender as TJvImage).Tag in [20..29] then
  begin
    HabilitarPaneles(2);
    HabilitarPestania(2);
  end;
  if (Sender as TJvImage).Tag in [30..40] then
  begin
    HabilitarPaneles(3);
    HabilitarPestania(3);
  end
  else if ((Sender as TJvImage).Tag = 60) then
       begin
            HabilitarPaneles(3);
            HabilitarPestania(3);
       end;
  if (Sender as TJvImage).Tag in [41..49] then
  begin
    HabilitarPaneles(4);
    HabilitarPestania(4);
  end;
  if (Sender as TJvImage).Tag in [50..59] then
  begin
    HabilitarPaneles(5);
    HabilitarPestania(5);
  end;
  if (Sender as TJvImage).Tag > 10000 then
  begin
    HabilitarPaneles(11);
    HabilitarPestania(11);
  end;
end;

procedure TFPrincipal.JvFavoritosClick(Sender: TObject);
var
  F : TFSimuladorA;
begin
  inherited;
  iniciarSimulador;

//  F := TFSimuladorA.Create(self);
//  F.ShowModal;
//  F.Destroy;
end;

procedure TFPrincipal.JvAyudaClick(Sender: TObject);
begin
  inherited;
  {if Assigned(PDFAyuda) then
  begin
    if IAnimales.Visible then
      PDFAyuda.setCurrentPage(4);
    if IEventos.Visible then
      PDFAyuda.setCurrentPage(6);
    if IReportes.Visible then
      PDFAyuda.setCurrentPage(9);
    if IHerramientas.Visible then
      PDFAyuda.setCurrentPage(14);
    if IConfig.Visible then
      PDFAyuda.setCurrentPage(13);
  end;
  HabilitarPestania(7);
  HabilitarPaneles(7);
  FormResize(self); }
end;

procedure TFPrincipal.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  RealizarBusqueda;
  HabilitarPestania(8);
  HabilitarPaneles(8);
  FormResize(self);
end;

procedure TFprincipal.RealizarBusqueda;
var
  I, cant : Integer;
  ABuscar, RPABuscar : String;
  TA, LA : Integer;
  ID_A : Variant;
  HayBusquedas : Boolean;
begin
  HayBusquedas := false;
  EliminarBusqueda;
  SetLength(Busqueda,0);
  ABuscar := EBusqueda.Text;
  if (ABuscar <> '') and (Length(ABuscar) >= 3) then
  begin
    LA := 30;
    cant := 0;
    TA := 0;
    if (Length(ABuscar)<= 8) then
      begin
        RPABuscar := LeftStr(ABuscar,8);
        BuscarAnimales(RPABuscar);
      end
    else
      BuscarAnimalesIE(ABuscar);
    IBQBusquedaAnimal.First;
    while not IBQBusquedaAnimal.Eof do
    begin
        HayBusquedas := true;
        ID_A := IBQBusquedaAnimal.FieldValues['id_animal'];
        SetLength(Busqueda,cant+1);
        Busqueda[cant].Fondo := TImage.Create(self);
        Busqueda[cant].Fondo.Parent := SBBusqueda;
        if (cant mod 2) = 0 then
          Busqueda[cant].Fondo.Picture := IFonodB1.Picture
        else
          Busqueda[cant].Fondo.Picture := IFondoB2.Picture;
        Busqueda[cant].Fondo.Top := TA;
        Busqueda[cant].Fondo.Left := 0;
        Busqueda[cant].Fondo.Width := SBBusqueda.Width;
        Busqueda[cant].Fondo.Height := 76;
        Busqueda[cant].Fondo.Stretch := true;
        Busqueda[cant].Fondo.SendToBack;

        Busqueda[cant].Categoria := Tlabel.Create(self);
        Busqueda[cant].Categoria.Parent := SBBusqueda;
        Busqueda[cant].Categoria.Font.Size := 10;
        Busqueda[cant].Categoria.Font.Name := 'Arial';
        Busqueda[cant].Categoria.Font.Style := [fsItalic];

        Busqueda[cant].Icono := TJvImage.Create(self);
        Busqueda[cant].Icono.Parent := SBBusqueda;
        Busqueda[cant].Icono.Picture := ISelector.Picture;
        Busqueda[cant].Icono.Left := 30;
        Busqueda[cant].Icono.Top := TA + (Busqueda[cant].Fondo.Height div 2) - 28;//(Busqueda[cant].Icono.Height div 2);

        Busqueda[cant].Categoria.Left := Busqueda[cant].Icono.Left + Busqueda[cant].Icono.Width + 5;
        Busqueda[cant].Categoria.Top := TA + (Busqueda[cant].Fondo.Height div 2) - (Busqueda[cant].Categoria.Height div 2);
        Busqueda[cant].Categoria.Caption := 'Ficha del Animal';
        Busqueda[cant].Categoria.Transparent := true;

        Busqueda[cant].Leyenda := Tlabel.Create(self);
        Busqueda[cant].Leyenda.Parent := SBBusqueda;
        Busqueda[cant].Leyenda.Left := Busqueda[cant].Categoria.Left + Busqueda[cant].Categoria.Width + 20;
        Busqueda[cant].Leyenda.Top := TA + (Busqueda[cant].Fondo.Height div 2) - (Busqueda[cant].Leyenda.Height div 2);
        Busqueda[cant].Leyenda.Cursor := crHandPoint;
        Busqueda[cant].Leyenda.Font.Size := 14;
        Busqueda[cant].Leyenda.Font.Name := 'Arial';
        Busqueda[cant].Leyenda.Font.Style := [fsUnderline];
        if (Length(ABuscar) <= 8) then
          Busqueda[cant].Leyenda.Caption := 'RP del Animal: '+IBQBusquedaAnimal.FieldValues['id_rp']
        else
          Busqueda[cant].Leyenda.Caption := 'IE del Animal: '+IBQBusquedaAnimal.FieldValues['id_ie'];
        Busqueda[cant].Leyenda.OnClick := ClickFichaAnimal;
        Busqueda[cant].Leyenda.Tag := ID_A;
        Busqueda[cant].Leyenda.Transparent := true;
        Busqueda[cant].Accion := nil;
        Busqueda[cant].Top := TA;
        Busqueda[cant].Left := LA;
        TA := TA+76 ;
        Inc(cant);
        IBQBusquedaAnimal.Next;
    end;

    for I := 0 to ALUniversal.ActionCount-1 do
    begin
      if AnsiContainsStr(Lowercase(TAction(ALUniversal.Actions[I]).Caption),Lowercase(ABuscar)) then
      begin
        HayBusquedas := true;
        SetLength(Busqueda,cant+1);
        Busqueda[cant].Fondo := TImage.Create(self);
        Busqueda[cant].Fondo.Parent := SBBusqueda;
        if (cant mod 2) = 0 then
          Busqueda[cant].Fondo.Picture := IFonodB1.Picture
        else
          Busqueda[cant].Fondo.Picture := IFondoB2.Picture;
        Busqueda[cant].Fondo.Top := TA;
        Busqueda[cant].Fondo.Left := 0;
        Busqueda[cant].Fondo.Width := SBBusqueda.Width;
        Busqueda[cant].Fondo.Height := 76;
        Busqueda[cant].Fondo.Stretch := true;
        Busqueda[cant].Fondo.SendToBack;

        Busqueda[cant].Categoria := Tlabel.Create(self);
        Busqueda[cant].Categoria.Parent := SBBusqueda;
        Busqueda[cant].Categoria.Font.Size := 10;
        Busqueda[cant].Categoria.Font.Name := 'Arial';
        Busqueda[cant].Categoria.Font.Style := [fsItalic];

        Busqueda[cant].Icono := TJvImage.Create(self);
        Busqueda[cant].Icono.Parent := SBBusqueda;
        if TAction(ALUniversal.Actions[I]).Category = 'ABM' then
        begin
          Busqueda[cant].Icono.Picture := IBConfig.Picture;
          Busqueda[cant].Categoria.Caption := 'C�digos';
        end;
        if TAction(ALUniversal.Actions[I]).Category = 'DO' then
        begin
          Busqueda[cant].Icono.Picture := IBReportes.Picture;
          Busqueda[cant].Categoria.Caption := 'Resportes';
        end;
        if TAction(ALUniversal.Actions[I]).Category = 'Evento' then
        begin
          Busqueda[cant].Icono.Picture := IBEventos.Picture;
          Busqueda[cant].Categoria.Caption := 'Eventos';
        end;
        if TAction(ALUniversal.Actions[I]).Category = 'Exp' then
        begin
          Busqueda[cant].Icono.Picture := IBAnimales.Picture;
          Busqueda[cant].Categoria.Caption := 'Animales';
        end;
        if TAction(ALUniversal.Actions[I]).Category = 'Animales' then
        begin
          Busqueda[cant].Icono.Picture := IBAnimales.Picture;
          Busqueda[cant].Categoria.Caption := 'Animales';
        end;
        if TAction(ALUniversal.Actions[I]).Category = 'Config' then
        begin
          Busqueda[cant].Icono.Picture := IBConfig.Picture;
          Busqueda[cant].Categoria.Caption := 'Configuraci�n';
        end;
        if TAction(ALUniversal.Actions[I]).Category = 'Herr' then
        begin
          Busqueda[cant].Icono.Picture := IBHerramientas.Picture;
          Busqueda[cant].Categoria.Caption := 'Herramientas';
        end;
        if TAction(ALUniversal.Actions[I]).Category = 'Imp' then
        begin
          Busqueda[cant].Icono.Picture := IBAnimales.Picture;
          Busqueda[cant].Categoria.Caption := 'Animales';
        end;
        if TAction(ALUniversal.Actions[I]).Category = 'Reporte' then
        begin
          Busqueda[cant].Icono.Picture := IBReportes.Picture;
          Busqueda[cant].Categoria.Caption := 'Reportes';
        end;

        Busqueda[cant].Icono.Left := 30;
        Busqueda[cant].Icono.Top := TA + (Busqueda[cant].Fondo.Height div 2) - 28;//(Busqueda[cant].Icono.Height div 2);

        Busqueda[cant].Categoria.Left := Busqueda[cant].Icono.Left + Busqueda[cant].Icono.Width + 5;
        Busqueda[cant].Categoria.Top := TA + (Busqueda[cant].Fondo.Height div 2) - (Busqueda[cant].Categoria.Height div 2);
        Busqueda[cant].Categoria.Transparent := true;

        Busqueda[cant].Leyenda := Tlabel.Create(self);
        Busqueda[cant].Leyenda.Parent := SBBusqueda;
        Busqueda[cant].Leyenda.Left := Busqueda[cant].Categoria.Left + Busqueda[cant].Categoria.Width + 20;
        Busqueda[cant].Leyenda.Top := TA + (Busqueda[cant].Fondo.Height div 2) - (Busqueda[cant].Leyenda.Height div 2);
        Busqueda[cant].Leyenda.Cursor := crHandPoint;
        Busqueda[cant].Leyenda.Font.Size := 14;
        Busqueda[cant].Leyenda.Font.Name := 'Arial';
        Busqueda[cant].Leyenda.Font.Style := [fsUnderline];
        Busqueda[cant].Leyenda.Transparent := true;
        Busqueda[cant].Leyenda.Action := TAction(ALUniversal.Actions[I]);
        Busqueda[cant].Accion := TAction(ALUniversal.Actions[I]);
        Busqueda[cant].Top := TA;
        Busqueda[cant].Left := LA;
        if not TAction(ALUniversal.Actions[I]).Enabled then
        begin
          Busqueda[cant].Icono.Picture := IBDis.Picture;
          Busqueda[cant].Icono.Enabled := False;
          Busqueda[cant].Leyenda.Font.Color := $00707070;
          Busqueda[cant].Leyenda.Enabled := false;
        end;
        TA := TA+76 ;
        Inc(cant);
      end;
    end;
  end;
  if not HayBusquedas then
  begin
    SetLength(Busqueda,1);
    Busqueda[0].Fondo := TImage.Create(self);
    Busqueda[0].Fondo.Parent := SBBusqueda;
    Busqueda[0].Fondo.Picture := IFondoB2.Picture;
    Busqueda[0].Fondo.Top := TA;
    Busqueda[0].Fondo.Left := 0;
    Busqueda[0].Fondo.Width := SBBusqueda.Width;
    Busqueda[0].Fondo.Height := 76;
    Busqueda[0].Fondo.Stretch := true;
    Busqueda[0].Fondo.SendToBack;

    Busqueda[0].Categoria := Tlabel.Create(self);
    Busqueda[0].Categoria.Parent := SBBusqueda;
    Busqueda[0].Categoria.Font.Size := 10;
    Busqueda[0].Categoria.Font.Name := 'Arial';
    Busqueda[0].Categoria.Font.Style := [fsItalic];

    Busqueda[0].Icono := TJvImage.Create(self);
    Busqueda[0].Icono.Parent := SBBusqueda;
    Busqueda[0].Icono.Picture := INotFound.Picture;
    Busqueda[0].Icono.Left := 30;
    Busqueda[0].Icono.Top := TA + (Busqueda[0].Fondo.Height div 2) - 28;//(Busqueda[0].Icono.Height div 2);

    Busqueda[0].Categoria.Left := Busqueda[0].Icono.Left + Busqueda[0].Icono.Width + 5;
    Busqueda[0].Categoria.Top := TA + (Busqueda[0].Fondo.Height div 2) - (Busqueda[0].Categoria.Height div 2);
    Busqueda[0].Categoria.Caption := 'No hay Resultados';
    Busqueda[0].Categoria.Transparent := true;

    Busqueda[0].Leyenda := Tlabel.Create(self);
    Busqueda[0].Leyenda.Parent := SBBusqueda;
    Busqueda[0].Leyenda.Left := Busqueda[0].Categoria.Left + Busqueda[0].Categoria.Width + 20;
    Busqueda[0].Leyenda.Top := TA + (Busqueda[0].Fondo.Height div 2) - (Busqueda[0].Leyenda.Height div 2);
    Busqueda[0].Leyenda.Cursor := crHandPoint;
    Busqueda[0].Leyenda.Font.Size := 14;
    Busqueda[0].Leyenda.Font.Name := 'Arial';
    Busqueda[0].Leyenda.Transparent := true;
    Busqueda[0].Leyenda.Font.Style := [fsUnderline];
    if ABuscar = '' then
      Busqueda[0].Leyenda.Caption := 'No se ha ingresado ninguna referencia de b�squeda';
    if (Abuscar <> '') and (Length(ABuscar) < 3) then
      Busqueda[0].Leyenda.Caption := 'Debe ingresar al menos 3(tres) caracteres para realizar la b�squeda';
    if (Abuscar <> '') and (Length(ABuscar) >= 3) then
      Busqueda[0].Leyenda.Caption := 'No hay ninguna coincidencia con la b�squeda';
    Busqueda[0].Leyenda.OnClick := ClickFichaAnimal;
    Busqueda[0].Leyenda.Tag := ID_A;
    Busqueda[0].Accion := nil;
    Busqueda[0].Top := TA;
    Busqueda[0].Left := LA;
  end;
end;

procedure TFPrincipal.EliminarBusqueda;
var
  I : Integer;
begin
  for I := 0 to Length(Busqueda)-1 do
  begin
    Busqueda[I].Fondo.Destroy;
    Busqueda[I].Leyenda.Destroy;
    Busqueda[I].Icono.Destroy;
    Busqueda[I].Categoria.Destroy;
  end;
end;

procedure TFPrincipal.RedimensionarBusqueda;
var
  I : Integer;
  TA : Integer;
begin
  TA := 0;
  for I := 0 to Length(Busqueda)-1 do
  begin
    Busqueda[I].Fondo.Width := SBBusqueda.Width;
    Busqueda[I].Icono.Top := TA + (Busqueda[I].Fondo.Height div 2) - 28;
    Busqueda[I].Leyenda.Top := TA + (Busqueda[I].Fondo.Height div 2) - (Busqueda[I].Leyenda.Height div 2);
    Busqueda[I].Categoria.Top := TA + (Busqueda[I].Fondo.Height div 2) - (Busqueda[I].Categoria.Height div 2);
    TA := TA + 76;
  end;
end;

procedure TFPrincipal.BuscarAnimalesIE(IE : string);
begin
  IBQBusquedaAnimal.SQL.Clear;
  IBQBusquedaAnimal.SQL.Text := 'select id_animal, id_ie from tab_animales where establecimiento = :esta and id_ie like :ie';
  IBQBusquedaAnimal.Close;
  IBQBusquedaAnimal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQBusquedaAnimal.ParamByName('IE').AsString := '%'+IE+'%';
  IBQBusquedaAnimal.Open;
end;

procedure TFPrincipal.BuscarAnimales(RP : String);
begin
  IBQBusquedaAnimal.SQL.Clear;
  IBQBusquedaAnimal.SQL.Text := 'select id_animal, id_rp from tab_animales where establecimiento = :esta and id_rp like :rp';
  IBQBusquedaAnimal.Close;
  IBQBusquedaAnimal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQBusquedaAnimal.ParamByName('RP').AsString := '%'+RP+'%';
  IBQBusquedaAnimal.Open;
end;

procedure TFPrincipal.AccederAFicha(id_animal : Integer);
var
  F : TFREPFichaAnimal;
begin
  if id_animal > 0 then
  begin
    F := TFREPFichaAnimal.Create(self);
    F.animal := id_animal;
    F.ShowModal;
    F.Destroy;
  end;
end;

procedure TFPrincipal.ClickFichaAnimal(Sender: TObject);
begin
  AccederAFicha((Sender as TLabel).Tag);
end;

{procedure TFPrincipal.AcomodarPanel;
var
  H, W, A : Integer;
begin

  H := (PClient.Height - JvIBaseContenedor.Height) div 2;

  JvIFondoFavoritosMiHuella.Width := PClient.Width - 100;
  JvIFondoFavoritosMiHuella.Left := (PClient.Width div 2) - (JvIFondoFavoritosMiHuella.Width div 2);
  JvIFondoFavoritosMiHuella.Height := H - 50;
  JvIFondoFavoritosMiHuella.Top := H + 10;
  LFrecuentesTitulos.Left := JvIFondoFavoritosMiHuella.Left + 10;
  LFrecuentesTitulos.Top := JvIFondoFavoritosMiHuella.Top + 10;

  JvIFondoAIMiHuella.Width := Trunc((JvIFondoFavoritosMiHuella.Width * 0.40) - 10);
  JvIFondoAIMiHuella.Left := JvIFondoFavoritosMiHuella.Left;
  JvIFondoAIMiHuella.Top := 10;
  JvIFondoAIMiHuella.Height := H - 50;
  LAiTitulo.Left := JvIFondoAIMiHuella.Left + 10;
  LAiTitulo.Top := JvIFondoAIMiHuella.Top + 10;

  JvIFondoConfigMiHuella.Width := Trunc((JvIFondoFavoritosMiHuella.Width * 0.60) - 10);
  JvIFondoConfigMiHuella.Left := (JvIFondoFavoritosMiHuella.Width + JvIFondoFavoritosMiHuella.Left) - JvIFondoConfigMiHuella.Width;
  JvIFondoConfigMiHuella.Top := 10;
  JvIFondoConfigMiHuella.Height := H - 50;
  LConfigTitulo.Left := JvIFondoConfigMiHuella.Left + 10;
  LConfigTitulo.Top := JvIFondoConfigMiHuella.Top + 10;

  A := (JvIFondoAIMiHuella.Width div 3);
  JvIAIBot1.Left := JvIFondoAIMiHuella.Left + (A div 2) - (JvIAIBot1.Width div 2);
  JvIAIBot1.Top := JvIFondoAIMiHuella.Top + 60;
  LAIMapa.Left := JvIAIBot1.Left + (JvIAIBot1.Width div 2) - (LAIMapa.Width div 2);
  LAIMapa.Top := JvIAIBot1.Top + JvIAIBot1.Height - 3;
  JvIAIBot2.Left := (JvIFondoAIMiHuella.Left + A) + (A div 2) - (JvIAIBot2.Width div 2);
  JvIAIBot2.Top := JvIFondoAIMiHuella.Top + 60;
  LAICM.Left := JvIAIBot2.Left + (JvIAIBot2.Width div 2) - (LAICM.Width div 2);
  LAICM.Top := JvIAIBot2.Top + JvIAIBot2.Height - 3;
  JvIAIBot3.Left := (JvIFondoAIMiHuella.Left + (2 * A)) + (A div 2) - (JvIAIBot3.Width div 2);
  JvIAIBot3.Top := JvIFondoAIMiHuella.Top + 60;
  LAICMP.Left := JvIAIBot3.Left + (JvIAIBot3.Width div 2) - (LAICMP.Width div 2);
  LAICMP.Top := JvIAIBot3.Top + JvIAIBot3.Height - 3;

  JvIVolverAyudaInic.Left := JvIFondoAIMiHuella.Left + JvIFondoAIMiHuella.Width - JvIVolverAyudaInic.Width;
  JvIVolverAyudaInic.Top := JvIFondoAIMiHuella.Top;

  A := (JvIFondoConfigMiHuella.Width div 4);
  JvIConfigBot1.Left := JvIFondoConfigMiHuella.Left + (A div 2) - (JvIConfigBot1.Width div 2);
  JvIConfigBot1.Top := JvIFondoConfigMiHuella.Top + 60;
  LConfPropietario.Left := JvIConfigBot1.Left + (JvIConfigBot1.Width div 2) - (LConfPropietario.Width div 2);
  LConfPropietario.Top := JvIConfigBot1.Top + JvIConfigBot1.Height - 3;
  JvIConfigBot2.Left := (JvIFondoConfigMiHuella.Left + A) + (A div 2) - (JvIConfigBot2.Width div 2);
  JvIConfigBot2.Top := JvIFondoConfigMiHuella.Top + 60;
  LConfUsuarios.Left := JvIConfigBot2.Left + (JvIConfigBot2.Width div 2) - (LConfUsuarios.Width div 2);
  LConfUsuarios.Top := JvIConfigBot2.Top + JvIConfigBot2.Height - 3;
  JvIConfigBot3.Left := (JvIFondoConfigMiHuella.Left + (2 * A)) + (A div 2) - (JvIConfigBot3.Width div 2);
  JvIConfigBot3.Top := JvIFondoConfigMiHuella.Top + 60;
  LconfCambioUsr.Left := JvIConfigBot3.Left + (JvIConfigBot3.Width div 2) - (LconfCambioUsr.Width div 2);
  LconfCambioUsr.Top := JvIConfigBot3.Top + JvIConfigBot3.Height - 5;
  JvIConfigBot4.Left := (JvIFondoConfigMiHuella.Left + (3 * A)) + (A div 2) - (JvIConfigBot4.Width div 2);
  JvIConfigBot4.Top := JvIFondoConfigMiHuella.Top + 60;
  LconfCambioEsta.Left := JvIConfigBot4.Left + (JvIConfigBot4.Width div 2) - (LconfCambioEsta.Width div 2);
  LconfCambioEsta.Top := JvIConfigBot4.Top + JvIConfigBot4.Height - 3;

  A := (JvIFondoFavoritosMiHuella.Width div 6);
  JvIFavorBot1.Left := JvIFondoFavoritosMiHuella.Left + (A div 2) - (JvIFavorBot1.Width div 2);
  JvIFavorBot1.Top := JvIFondoFavoritosMiHuella.Top + 60;
  LFavorBot1C.Left := JvIFavorBot1.Left + (JvIFavorBot1.Width div 2) - (LFavorBot1C.Width div 2);
  LFavorBot1C.Top := JvIFavorBot1.Top + (JvIFavorBot1.Height div 2) - (LFavorBot1C.Height div 2);
  LFavor1.Left := JvIFavorBot1.Left + (JvIFavorBot1.Width div 2) - (LFavor1.Width div 2);
  LFavor1.Top := JvIFavorBot1.Top + JvIFavorBot1.Height - 3;
  JvIFavorBot2.Left := (JvIFondoFavoritosMiHuella.Left + A) + (A div 2) - (JvIFavorBot2.Width div 2);
  JvIFavorBot2.Top := JvIFondoFavoritosMiHuella.Top + 60;
  LFavorBot2C.Left := JvIFavorBot2.Left + (JvIFavorBot2.Width div 2) - (LFavorBot2C.Width div 2);
  LFavorBot2C.Top := JvIFavorBot2.Top + (JvIFavorBot2.Height div 2) - (LFavorBot2C.Height div 2);
  LFavor2.Left := JvIFavorBot2.Left+(JvIFavorBot2.Width div 2)-(LFavor2.Width div 2);
  LFavor2.Top := JvIFavorBot2.Top + JvIFavorBot2.Height - 3;
  JvIFavorBot3.Left := (JvIFondoFavoritosMiHuella.Left + (2 * A)) + (A div 2) - (JvIFavorBot3.Width div 2);
  JvIFavorBot3.Top := JvIFondoFavoritosMiHuella.Top + 60;
  LFavorBot3C.Left := JvIFavorBot3.Left + (JvIFavorBot3.Width div 2) - (LFavorBot3C.Width div 2);
  LFavorBot3C.Top := JvIFavorBot3.Top + (JvIFavorBot3.Height div 2) - (LFavorBot3C.Height div 2);
  LFavor3.Left := JvIFavorBot3.Left + (JvIFavorBot3.Width div 2) - (LFavor3.Width div 2);
  LFavor3.Top := JvIFavorBot3.Top + JvIFavorBot3.Height - 3;
  JvIFavorBot4.Left := (JvIFondoFavoritosMiHuella.Left + (3 * A)) + (A div 2) - (JvIFavorBot4.Width div 2);
  JvIFavorBot4.Top := JvIFondoFavoritosMiHuella.Top + 60;
  LFavorBot4C.Left := JvIFavorBot4.Left + (JvIFavorBot4.Width div 2) - (LFavorBot4C.Width div 2);
  LFavorBot4C.Top := JvIFavorBot4.Top + (JvIFavorBot4.Height div 2) - (LFavorBot4C.Height div 2);
  LFavor4.Left := JvIFavorBot4.Left+(JvIFavorBot4.Width div 2)-(LFavor4.Width div 2);
  LFavor4.Top := JvIFavorBot4.Top + JvIFavorBot4.Height - 3;
  JvIFavorBot5.Left := (JvIFondoFavoritosMiHuella.Left + (4 * A)) + (A div 2) - (JvIFavorBot5.Width div 2);
  JvIFavorBot5.Top := JvIFondoFavoritosMiHuella.Top + 60;
  LFavorBot5C.Left := JvIFavorBot5.Left + (JvIFavorBot5.Width div 2) - (LFavorBot5C.Width div 2);
  LFavorBot5C.Top := JvIFavorBot5.Top + (JvIFavorBot5.Height div 2) - (LFavorBot5C.Height div 2);
  LFavor5.Left := JvIFavorBot5.Left+(JvIFavorBot5.Width div 2)-(LFavor5.Width div 2);
  LFavor5.Top := JvIFavorBot5.Top + JvIFavorBot5.Height - 3;
  JvIFavorBot6.Left := (JvIFondoFavoritosMiHuella.Left + (5 * A)) + (A div 2) - (JvIFavorBot6.Width div 2);
  JvIFavorBot6.Top := JvIFondoFavoritosMiHuella.Top + 60;
  LFavorBot6C.Left := JvIFavorBot6.Left + (JvIFavorBot6.Width div 2) - (LFavorBot6C.Width div 2);
  LFavorBot6C.Top := JvIFavorBot6.Top + (JvIFavorBot6.Height div 2) - (LFavorBot6C.Height div 2);
  LFavor6.Left := JvIFavorBot6.Left+(JvIFavorBot6.Width div 2)-(LFavor6.Width div 2);
  LFavor6.Top := JvIFavorBot6.Top + JvIFavorBot6.Height - 3;
end;   }

procedure TFPrincipal.AcomodarPanel;
var
  H, W, A : Integer;
begin

  H := (PClient.Height - JvIBaseContenedor.Height) div 2;

  JvIReportes.Width := PClient.Width - 100;
  JvIReportes.Left := (PClient.Width div 2) - (JvIReportes.Width div 2);
  JvIReportes.Height := H - 50;
  JvIReportes.Top := H + 10;
  LReportes.Left := JvIReportes.Left + 10;
  LReportes.Top := JvIReportes.Top + 10;

  JvIMovimientos.Width := Trunc((JvIReportes.Width * 0.50) - 10);
  JvIMovimientos.Left := JvIReportes.Left;
  JvIMovimientos.Top := 20;
  JvIMovimientos.Height := H - 50;
  LMovimientos.Left := JvIMovimientos.Left + 10;
  LMovimientos.Top := JvIMovimientos.Top + 10;

  JvIHerramientas.Width := Trunc((JvIReportes.Width * 0.50) - 10);
  JvIHerramientas.Left := (JvIReportes.Width + JvIReportes.Left) - JvIHerramientas.Width;
  JvIHerramientas.Top := 20;
  JvIHerramientas.Height := H - 50;
  LHerramientas.Left := JvIHerramientas.Left + 10;
  LHerramientas.Top := JvIHerramientas.Top + 10;

  A := (JvIMovimientos.Width div 4);
  JvICargaMasiva.Left := JvIMovimientos.Left + (A div 2) - (JvICargaMasiva.Width div 2);
  JvICargaMasiva.Top := JvIMovimientos.Top + 35;
  LCargaMasiva.Left := JvICargaMasiva.Left + (JvICargaMasiva.Width div 2) - (LCargaMasiva.Width div 2);
  LCargaMasiva.Top := JvICargaMasiva.Top + JvICargaMasiva.Height - 4;
  JvICargaIndividual.Left := (JvIMovimientos.Left + A) + (A div 2) - (JvICargaIndividual.Width div 2);
  JvICargaIndividual.Top := JvIMovimientos.Top + 35;
  LCargaIndivi.Left := JvICargaIndividual.Left + (JvICargaIndividual.Width div 2) - (LCargaIndivi.Width div 2);
  LCargaIndivi.Top := JvICargaIndividual.Top + JvICargaIndividual.Height - 4;
  JvIBaja.Left := (JvIMovimientos.Left + (2 * A)) + (A div 2) - (JvIBaja.Width div 2);
  JvIBaja.Top := JvIMovimientos.Top + 35;
  LBaja.Left := JvIBaja.Left + (JvIBaja.Width div 2) - (LBaja.Width div 2);
  LBaja.Top := JvIBaja.Top + JvIBaja.Height - 4;
  JvIAltaAfip.Left := (JvIMovimientos.Left + (3 * A)) + (A div 2) - (JvIAltaAfip.Width div 2);
  JvIAltaAfip.Top := JvIMovimientos.Top + 35;
  LAltaAfip.Left := JvIAltaAfip.Left + (JvIAltaAfip.Width div 2) - (LAltaAfip.Width div 2);
  LAltaAfip.Top := JvIAltaAfip.Top + JvIAltaAfip.Height - 4;


  JvIVolverAyudaInic.Left := JvIMovimientos.Left + JvIMovimientos.Width - JvIVolverAyudaInic.Width;
  JvIVolverAyudaInic.Top := JvIMovimientos.Top;

  A := (JvIHerramientas.Width div 4);
  JvICambiarEstab.Left := JvIHerramientas.Left + (A div 2) - (JvICambiarEstab.Width div 2);
  JvICambiarEstab.Top := JvIHerramientas.Top + 35;
  LCambEstab.Left := JvICambiarEstab.Left + (JvICambiarEstab.Width div 2) - (LCambEstab.Width div 2);
  LCambEstab.Top := JvICambiarEstab.Top + JvICambiarEstab.Height - 3;
  JvIConfElectro.Left := (JvIHerramientas.Left + A) + (A div 2) - (JvIConfElectro.Width div 2);
  JvIConfElectro.Top := JvIHerramientas.Top + 35;
  LConfElectro.Left := JvIConfElectro.Left + (JvIConfElectro.Width div 2) - (LConfElectro.Width div 2);
  LConfElectro.Top := JvIConfElectro.Top + JvIConfElectro.Height - 3;
  JvICargaMovil.Left := (JvIHerramientas.Left + (2 * A)) + (A div 2) - (JvICargaMovil.Width div 2);
  JvICargaMovil.Top := JvIHerramientas.Top + 35;
  LCargaMovil.Left := JvICargaMovil.Left + (JvICargaMovil.Width div 2) - (LCargaMovil.Width div 2);
  LCargaMovil.Top := JvICargaMovil.Top + JvICargaMovil.Height - 5;
  JvIBackup.Left := (JvIHerramientas.Left + (3 * A)) + (A div 2) - (JvIBackup.Width div 2);
  JvIBackup.Top := JvIHerramientas.Top + 35;
  LBackup.Left := JvIBackup.Left + (JvIBackup.Width div 2) - (LBackup.Width div 2);
  LBackup.Top := JvIBackup.Top + JvIBackup.Height - 3;

  A := (JvIReportes.Width div 6);
  JvITRI.Left := JvIReportes.Left + (A div 2) - (JvITRI.Width div 2);
  JvITRI.Top := JvIReportes.Top + 35;
  LTRI.Left := JvITRI.Left + (JvITRI.Width div 2) - (LTRI.Width div 2);
  LTRI.Top := JvITRI.Top + JvITRI.Height - 3;
  JvIDTE.Left := (JvIReportes.Left + A) + (A div 2) - (JvIDTE.Width div 2);
  JvIDTE.Top := JvIReportes.Top + 35;
  LDTE.Left := JvIDTE.Left+(JvIDTE.Width div 2)-(LDTE.Width div 2);
  LDTE.Top := JvIDTE.Top + JvIDTE.Height - 3;
  JvISelector.Left := (JvIReportes.Left + (2 * A)) + (A div 2) - (JvISelector.Width div 2);
  JvISelector.Top := JvIReportes.Top + 35;
  LSelector.Left := JvISelector.Left + (JvISelector.Width div 2) - (LSelector.Width div 2);
  LSelector.Top := JvISelector.Top + JvISelector.Height - 3;
  JvIResMovimientos.Left := (JvIReportes.Left + (3 * A)) + (A div 2) - (JvIResMovimientos.Width div 2);
  JvIResMovimientos.Top := JvIReportes.Top + 35;
  LMoviemientos.Left := JvIResMovimientos.Left+(JvIResMovimientos.Width div 2)-(LMoviemientos.Width div 2);
  LMoviemientos.Top := JvIResMovimientos.Top + JvIResMovimientos.Height - 3;
  JvITratamientos.Left := (JvIReportes.Left + (4 * A)) + (A div 2) - (JvITratamientos.Width div 2);
  JvITratamientos.Top := JvIReportes.Top + 35;
  LResTratamientos.Left := JvITratamientos.Left+(JvITratamientos.Width div 2)-(LResTratamientos.Width div 2);
  LResTratamientos.Top := JvITratamientos.Top + JvITratamientos.Height - 3;
  JvIPersonalizados.Left := (JvIReportes.Left + (5 * A)) + (A div 2) - (JvIPersonalizados.Width div 2);
  JvIPersonalizados.Top := JvIReportes.Top + 35;
  LPersonalizados.Left := JvIPersonalizados.Left+(JvIPersonalizados.Width div 2)-(LPersonalizados.Width div 2);
  LPersonalizados.Top := JvIPersonalizados.Top + JvIPersonalizados.Height - 3;
end;

procedure TFPrincipal.AcomodarBienvenida;
begin
  ILogoMarcaAgua.Left := (PBienvenida.Width div 2) - (ILogoMarcaAgua.Width div 2);
  ILogoMarcaAgua.Top := (PBienvenida.Height div 2) - (ILogoMarcaAgua.Height div 2);
  //ILeyenda.Top := ILogoMarcaAgua.Top + ILogoMarcaAgua.Height + 5;
  //ILeyenda.Left := (PBienvenida.Width div 2) - (ILeyenda.Width div 2);
  ILogoMarcaAgua.BringToFront;
end;

procedure TFprincipal.AcomodarAyuda;
var
  wa : Integer;
begin
  wa := PClient.Width div 4;

  LTituloAyuda.Left := (PClient.Width div 2) - (LTituloAyuda.Width div 2);
  LTituloAyuda.Top := 16;

  JvIFondoSkype.Width := wa - 20;
  JvIFondoSkype.Left := 10;
  JvIFondoSkype.Height := PClient.Height - JvIBaseContenedor.Height - LTituloAyuda.Height - 100;
  JvIFondoSkype.Top := LTituloAyuda.Top + LTituloAyuda.Height + ((PClient.Height - JvIBaseContenedor.Height - LTituloAyuda.Height) div 2) - (JvIFondoSkype.Height div 2);

  JvIFondoMail.Width := wa - 20;
  JvIFondoMail.Left := wa + 10;
  JvIFondoMail.Height := PClient.Height - JvIBaseContenedor.Height - LTituloAyuda.Height - 100;
  JvIFondoMail.Top := LTituloAyuda.Top + LTituloAyuda.Height + ((PClient.Height - JvIBaseContenedor.Height - LTituloAyuda.Height) div 2) - (JvIFondoMail.Height div 2);

  JvIFondoTelefono.Width := wa - 20;
  JvIFondoTelefono.Left := (wa * 2) + 10;
  JvIFondoTelefono.Height := PClient.Height - JvIBaseContenedor.Height - LTituloAyuda.Height - 100;
  JvIFondoTelefono.Top := LTituloAyuda.Top + LTituloAyuda.Height + ((PClient.Height - JvIBaseContenedor.Height - LTituloAyuda.Height) div 2) - (JvIFondoTelefono.Height div 2);

  JvIFondoMsn.Width := wa - 20;
  JvIFondoMsn.Left := (wa * 3) + 10;
  JvIFondoMsn.Height := PClient.Height - JvIBaseContenedor.Height - LTituloAyuda.Height - 100;
  JvIFondoMsn.Top := LTituloAyuda.Top + LTituloAyuda.Height + ((PClient.Height - JvIBaseContenedor.Height - LTituloAyuda.Height) div 2) - (JvIFondoMsn.Height div 2);

  JvIAyudaSkype.Left := JvIFondoSkype.Left + (JvIFondoSkype.Width div 2) - (JvIAyudaSkype.Width div 2);
  JvIAyudaMail.Left := JvIFondoMail.Left + (JvIFondoMail.Width div 2) - (JvIAyudaMail.Width div 2);
  JvIAyudaTelefono.Left := JvIFondoTelefono.Left + (JvIFondoTelefono.Width div 2) - (JvIAyudaTelefono.Width div 2);
  JvIAyudaMsn.Left := JvIFondoMsn.Left + (JvIFondoMsn.Width div 2) - (JvIAyudaMsn.Width div 2);
  JvIAyudaSkype.Top := JvIFondoSkype.Top + 40;
  JvIAyudaMail.Top := JvIFondoMail.Top + 40;
  JvIAyudaTelefono.Top := JvIFondoTelefono.Top + 40;
  JvIAyudaMsn.Top := JvIFondoMsn.Top + 40;

  LSkype.Left := JvIFondoSkype.Left + 7;
  LSkype.Top := JvIFondoSkype.Top + 10;
  LMail.Left := JvIFondoMail.Left + 7;
  LMail.Top := JvIFondoMail.Top + 10;
  LTelefono.Left := JvIFondoTelefono.Left + 7;
  LTelefono.Top := JvIFondoTelefono.Top + 10;
  LMsn.Left := JvIFondoMsn.Left + 7;
  LMsn.Top := JvIFondoMsn.Top + 10;

  //Skype
  LSkype1.Left := JvIFondoSkype.Left + 20;
  LSkype1.Top := JvIAyudaSkype.Top + JvIAyudaSkype.Height + 5;
  LSkype11.Left := LSkype1.Left + LSkype1.Width + 3;
  LSkype11.Top := LSkype1.Top;
  LSkype2.Top := LSkype1.Top + LSkype1.Height + 3;
  LSkype2.Left := LSkype1.Left;
  LSkype3.Top := LSkype2.Top + LSkype2.Height + 3;
  LSkype3.Left := LSkype2.Left;
  LSkype4.Left := LSkype1.Left;
  LSkype4.Top := LSkype3.Top + LSkype3.Height + 3;
  LSkype5.Left := LSkype1.Left;
  LSkype5.Top := LSkype4.Top + LSkype4.Height + 3;
  LSkype6.Left := LSkype1.Left;
  LSkype6.Top := LSkype5.Top + LSkype5.Height + 3;
  LSkype7.Left := LSkype1.Left;
  LSkype7.Top := LSkype6.Top + LSkype6.Height + 3;
  //Mail
  LMail1.Left := JvIFondoMail.Left + 20;
  LMail1.Top := JvIAyudaMail.Top + JvIAyudaMail.Height + 5;
  LMail1a.Left := LMail1.Left + LMail1.Width + 3;
  LMail1a.Top := LMail1.Top;
  LMail2.Top := LMail1.Top + LMail1.Height + 3;
  LMail2.Left := LMail1.Left;
  LMail3.Top := LMail2.Top + LMail2.Height + 3;
  LMail3.Left := LMail2.Left;
  LMail4.Left := LMail1.Left;
  LMail4.Top := LMail3.Top + LMail3.Height + 3;
  LMail5.Left := LMail1.Left;
  LMail5.Top := LMail4.Top + LMail4.Height + 3;
  LMail6.Left := LMail1.Left;
  LMail6.Top := LMail5.Top + LMail5.Height + 3;
  LMail7.Left := LMail1.Left;
  LMail7.Top := LMail6.Top + LMail6.Height + 3;
  LMail8.Top := LMail7.Top + LMail7.Height + 3;
  LMail8.Left := LMail1.Left;
  LMail9.Left := LMail1.Left;
  LMail9.Top := LMail8.Top + LMail8.Height + 3;
  //Telefono
  LTel1.Left := JvIFondoTelefono.Left + 20;
  LTel1.Top := JvIAyudaTelefono.Top + JvIAyudaTelefono.Height + 5;
  LTel1a.Left := LTel1.Left + LTel1.Width + 3;
  LTel1a.Top := LTel1.Top;
  LTel2.Top := LTel1.Top + LTel1.Height + 3;
  LTel2.Left := LTel1.Left;
  LTel3.Top := LTel2.Top + LTel2.Height + 3;
  LTel3.Left := LTel2.Left;
  LTel4.Left := LTel1.Left;
  LTel4.Top := LTel3.Top + LTel3.Height + 3;
  LTel5.Left := LTel1.Left;
  LTel5.Top := LTel4.Top + LTel4.Height + 3;
  LTel6.Left := LTel1.Left;
  LTel6.Top := LTel5.Top + LTel5.Height + 3;
  LTel7.Left := LTel1.Left;
  LTel7.Top := LTel6.Top + LTel6.Height + 3;
  //Msn
  LMsn1.Left := JvIFondoMsn.Left + 20;
  LMsn1.Top := JvIAyudaMsn.Top + JvIAyudaMsn.Height + 5;
  LMsn1a.Left := LMsn1.Left + LMsn1.Width + 3;
  LMsn1a.Top := LMsn1.Top;
  LMsn2.Top := LMsn1.Top + LMsn1.Height + 3;
  LMsn2.Left := LMsn1.Left;
  LMsn3.Top := LMsn2.Top + LMsn2.Height + 3;
  LMsn3.Left := LMsn2.Left;
  LMsn4.Left := LMsn1.Left;
  LMsn4.Top := LMsn3.Top + LMsn3.Height + 3;
end;

procedure TFPrincipal.AcomodarAyudaInicial;
var
  wa : Integer;
begin
  wa := PClient.Width div 4;
  //JvIBurbujaAyudaInicial.Width := wa - 10;
  JvIFondoOpcion1.Width := wa - 20;
  JvIFondoOpcion1.Left := wa + 10;
  JvIFondoOpcion1.Height := PClient.Height - JvIBaseContenedor.Height - 50;
  JvIFondoOpcion1.Top := ((PClient.Height - JvIBaseContenedor.Height) div 2) - (JvIFondoOpcion1.Height div 2);

  JvIFondoOpcion2.Width := wa - 20;
  JvIFondoOpcion2.Left := (wa * 2) + 10;
  JvIFondoOpcion2.Height := PClient.Height - JvIBaseContenedor.Height - 50;
  JvIFondoOpcion2.Top := ((PClient.Height - JvIBaseContenedor.Height) div 2) - (JvIFondoOpcion2.Height div 2);

  JvIFondoOpcion3.Width := wa - 20;
  JvIFondoOpcion3.Left := (wa * 3) + 10;
  JvIFondoOpcion3.Height := PClient.Height - JvIBaseContenedor.Height - 50;
  JvIFondoOpcion3.Top := ((PClient.Height - JvIBaseContenedor.Height) div 2) - (JvIFondoOpcion3.Height div 2);

  JvIBurbujaAyudaInicial.Left := 5;
  JvIBurbujaAyudaInicial.Top := JvIFondoOpcion1.Top;

  LTituloOpcion1.Left := JvIFondoOpcion1.Left + 7;
  LTituloOpcion1.Top := JvIFondoOpcion1.Top + 10;
  LTituloOpcion2.Left := JvIFondoOpcion2.Left + 7;
  LTituloOpcion2.Top := JvIFondoOpcion2.Top + 10;
  LTituloOpcion3.Left := JvIFondoOpcion3.Left + 7;
  LTituloOpcion3.Top := JvIFondoOpcion3.Top + 10;

  JvIBotonOpcion1.Left := JvIFondoOpcion1.Left + (JvIFondoOpcion1.Width div 2) - (JvIBotonOpcion1.Width div 2);
  JvIBotonOpcion1.Top := JvIFondoOpcion1.Top + JvIFondoOpcion1.Height - JvIBotonOpcion1.Height - 10;
  JvIBotonOpcion2.Left := JvIFondoOpcion2.Left + (JvIFondoOpcion2.Width div 2) - (JvIBotonOpcion2.Width div 2);
  JvIBotonOpcion2.Top := JvIFondoOpcion2.Top + JvIFondoOpcion2.Height - JvIBotonOpcion2.Height - 10;
  JvIBotonOpcion3.Left := JvIFondoOpcion3.Left + (JvIFondoOpcion3.Width div 2) - (JvIBotonOpcion3.Width div 2);
  JvIBotonOpcion3.Top := JvIFondoOpcion3.Top + JvIFondoOpcion3.Height - JvIBotonOpcion3.Height - 10;


  JvIBotOpcion1.Left := JvIFondoOpcion1.Left + (JvIFondoOpcion1.Width div 2) - (JvIBotOpcion1.Width div 2);
  JvIBotOpcion2.Left := JvIFondoOpcion2.Left + (JvIFondoOpcion2.Width div 2) - (JvIBotOpcion2.Width div 2);
  JvIBotOpcion3.Left := JvIFondoOpcion3.Left + (JvIFondoOpcion3.Width div 2) - (JvIBotOpcion3.Width div 2);
  JvIBotOpcion1.Top := JvIFondoOpcion1.Top + 60;
  JvIBotOpcion2.Top := JvIFondoOpcion2.Top + 60;
  JvIBotOpcion3.Top := JvIFondoOpcion3.Top + 60;

  //Opcion 1
  L1Op1.Left := JvIFondoOpcion1.Left + 20;
  L1Op1.Top := JvIBotOpcion1.Top + JvIBotOpcion1.Height + 5;
  L2Op1.Left := L1Op1.Left;
  L2Op1.Top := L1Op1.Top + L1Op1.Height + 3;
  L3Op1.Left := L1Op1.Left;
  L3Op1.Top := L2Op1.Top + L2Op1.Height + 3;
  L4Op1.Left := L1Op1.Left;
  L4Op1.Top := L3Op1.Top + L3Op1.Height + 3;
  L41Op1.Left := L4Op1.Left + L4Op1.Width + 3;
  L41Op1.Top := L4Op1.Top;
  L5Op1.Left := L1Op1.Left;
  L5Op1.Top := L4Op1.Top + L4Op1.Height + 3;
  L6Op1.Left := L1Op1.Left;
  L6Op1.Top := L5Op1.Top + L5Op1.Height + 3;
  L7Op1.Left := L1Op1.Left;
  L7Op1.Top := L6Op1.Top + L6Op1.Height + 3;
  L8Op1.Left := L1Op1.Left;
  L8Op1.Top := L7Op1.Top + L7Op1.Height + 3;
  L9Op1.Left := L1Op1.Left;
  L9Op1.Top := L8Op1.Top + L8Op1.Height + 3;
  L10Op1.Left := L1Op1.Left;
  L10Op1.Top := L9Op1.Top + L9Op1.Height + 3;
  //Opcion 2
  L1Op2.Left := JvIFondoOpcion2.Left + 20;
  L1Op2.Top := JvIBotOpcion2.Top + JvIBotOpcion2.Height + 5;
  L2Op2.Left := L1Op2.Left;
  L2Op2.Top := L1Op2.Top + L1Op2.Height + 3;
  L3Op2.Left := L1Op2.Left;
  L3Op2.Top := L2Op2.Top + L2Op2.Height + 3;
  L31Op2.Left := L3Op2.Left + L3Op2.Width + 3;
  L31Op2.Top := L3Op2.Top;
  L4Op2.Left := L1Op2.Left;
  L4Op2.Top := L3Op2.Top + L3Op2.Height + 3;
  L41Op2.Left := L4Op2.Left + L4Op2.Width + 3;
  L41Op2.Top := L4Op2.Top;
  L42Op2.Left := L41Op2.Left + L41Op2.Width + 3;
  L42Op2.Top := L4Op2.Top;
  L5Op2.Left := L1Op2.Left;
  L5Op2.Top := L4Op2.Top + L4Op2.Height + 3;
  L6Op2.Left := L1Op2.Left;
  L6Op2.Top := L5Op2.Top + L5Op2.Height + 3;
  L7Op2.Left := L1Op2.Left;
  L7Op2.Top := L6Op2.Top + L6Op2.Height + 3;
  L8Op2.Left := L1Op2.Left;
  L8Op2.Top := L7Op2.Top + L7Op2.Height + 3;
  L9Op2.Left := L1Op2.Left;
  L9Op2.Top := L8Op2.Top + L8Op2.Height + 3;
  L10Op2.Left := L1Op2.Left;
  L10Op2.Top := L9Op2.Top + L9Op2.Height + 3;
  //Opcion 3
  L1Op3.Left := JvIFondoOpcion3.Left + 20;
  L1Op3.Top := JvIBotOpcion3.Top + JvIBotOpcion3.Height + 5;
  L2Op3.Left := L1Op3.Left;
  L2Op3.Top := L1Op3.Top + L1Op3.Height + 3;
  L3Op3.Left := L1Op3.Left;
  L3Op3.Top := L2Op3.Top + L2Op3.Height + 3;
  L4Op3.Left := L1Op3.Left;
  L4Op3.Top := L3Op3.Top + L3Op3.Height + 3;
  L5Op3.Left := L1Op3.Left;
  L5Op3.Top := L4Op3.Top + L4Op3.Height + 3;
  L51Op3.Left := L5Op3.Left + L5Op3.Width + 3;
  L51Op3.Top := L5Op3.Top;
  L6Op3.Left := L1Op3.Left;
  L6Op3.Top := L5Op3.Top + L5Op3.Height + 3;
  L61Op3.Left := L6Op3.Left + L6Op3.Width + 3;
  L61Op3.Top := L6Op3.Top;
  L7Op3.Left := L1Op3.Left;
  L7Op3.Top := L6Op3.Top + L6Op3.Height + 3;
  L8Op3.Left := L1Op3.Left;
  L8Op3.Top := L7Op3.Top + L7Op3.Height + 3;
  L9Op3.Left := L1Op3.Left;
  L9Op3.Top := L8Op3.Top + L8Op3.Height + 3;
  L10Op3.Left := L1Op3.Left;
  L10Op3.Top := L9Op3.Top + L9Op3.Height + 3;
end;

procedure TFPrincipal.EBusquedaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    JvIBotonBuscarClick(JvIBotonBuscar);
end;

procedure TFPrincipal.ACalendarioGralExecute(Sender: TObject);
begin
  inherited;
  TipoCalendario := 3;
  ACalendarioExecute(Sender);
  AgregarAccion(ACalendario.Name,'Calendario General',4,JvIHerramientas3N,JvFolCalendarios,'CGR');
end;

procedure TFPrincipal.ACalendarioSaniExecute(Sender: TObject);
begin
  inherited;
  TipoCalendario := 2;
  ACalendarioExecute(Sender);
  AgregarAccion(ACalendario.Name,'Calendario Sanitario',4,JvIHerramientas3N,JvFolCalendarios,'CSR');
end;

procedure TFPrincipal.ACalendarioReproExecute(Sender: TObject);
begin
  inherited;
  TipoCalendario := 1;
  ACalendarioExecute(Sender);
  AgregarAccion(ACalendario.Name,'Calendario Reproductivo',4,JvIHerramientas3N,JvFolCalendarios,'CRP');
end;

procedure TFPrincipal.AConfigElectronicoExecute(Sender: TObject);
begin
  inherited;
  if FuncCaravanasElectronicas then
  begin
    AbrirFormNormal(TFConfigLector.Create(self));
    AgregarAccion(AConfigElectronico.Name,'Configuraci�n del Lector Electr�nico',4,nil,JvFolCaravanaElect,'');
  end
  else
  begin
    MostrarMensaje(tmInformacion, 'No disponible en esta versi�n');
  end;

end;

procedure TFPrincipal.AGenSeleccionUsuarioExecute(Sender: TObject);
var
  F : TFLogin;
begin
  inherited;
  F := TFLogin.Create(self);
  F.SoloUsuario := true;
  F.ShowModal;
  F.Destroy;
  DesActivarAcciones();
  ActivarAcciones();

  //AgregarAccion(AGenSeleccionUsuario.Name,'Cambiar de usuario',4,nil,JvFolCambioUsuario,'');
end;

procedure TFPrincipal.AGenSincroExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFSincroBaseDatos.Create(self));
  AgregarAccion(AGenSincro.Name,'Sincronizar Base de Datos',4,JvIHerramientas3N,JvFolBackup,'SBD');
end;

procedure TFPrincipal.JvIPanelControlClick(Sender: TObject);
begin
  inherited;
{  HabilitarPestania(10);
  HabilitarPaneles(10);
  FormResize(self); }
  AMapaEstab.Execute;
end;

procedure TFPrincipal.AMapaEstabExecute(Sender: TObject);
begin
  inherited;
  if IsConnected then
    AbrirFormNormal(TFMapaGoogle.Create(self))
  else
    AbrirFormNormal(TFMapa.Create(self));
 //AgregarAccion(AMapaEstab.Name,'Mapa del Establecimiento',4,nil,JvIMapa,'');
end;

procedure TFPrincipal.IMapaClick(Sender: TObject);
begin
  inherited;
  AMapaEstab.Execute;
end;

procedure TFPrincipal.AABMDatosSiembraExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMDatosSiembra.Create(self));
  AgregarAccion(AABMDatosSiembra.Name,'Datos de Siembra',4,JvIConfig3N,nil,'');
end;

procedure TFPrincipal.IIndicesProductivosClick(Sender: TObject);
begin
  inherited;
  AIndicesProductivos.Execute;
end;

{
function TFPrincipal.existeIEAnimal(auxlectura: string): integer;
var
  resultado: integer;
  sql, reducida: string;

begin
   resultado := -1;

   IBQBusca.Close;
   IBQBusca.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
   IBQBusca.ParamByName('ie').AsString := auxlectura;
   IBQBusca.Open;
   IBQBusca.First;

   // Hay lectores que entregan un cero adelante de la id. por eso
   // si no lo encuentra, busco con 0
   if IBQBusca.eof and (auxlectura[1] = '0') then
   begin
      reducida := copy(auxlectura, 2, length(auxlectura) -1);

      IBQBusca.Close;
      IBQBusca.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
      IBQBusca.ParamByName('ie').AsString := reducida;

      IBQBusca.Open;
      IBQBusca.First;
      if IBQBusca.Eof then
      begin
          existeIEAnimal := -1;
          exit;
      end;
   end;

   resultado := IBQBusca.FieldByName('id_animal').AsInteger;

   existeIEAnimal := resultado;
end;
 }

procedure TFPrincipal.identificarAnimalPorLector;
var
    id_aux : Integer;
    auxlectura, rpaux: String;
    F : TFREPFichaAnimal;
begin
  auxlectura := FLectorElectronico.Lectura;
  // BUG - despues de retornar el control de la DLL
  self := fPrincipal;
  FLectorElectronico.Lectura := '';

//  auxlectura := 'XX100';

  if(auxlectura<>'')then
  begin
    auxlectura := FLectorElectronico.Limpiar(auxlectura);
    //LogMensaje('Mensaje:'+auxlectura);
      DMSoftvet.IBQDatosAnimal.Close;
      DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQDatosAnimal.Open;
          
    if DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal')<>null then
    begin
      DMSoftvet.IBQDatosAnimal.Close;
      DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQDatosAnimal.Open;
      id_aux := DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
      rpaux := DMSoftvet.IBQDatosAnimal.Lookup('id_animal',id_aux,'id_rp');

      id_animal := id_aux;

      TimerLector.Enabled := false;
      //cerrarLector;

      F := TFREPFichaAnimal.Create(self);
      F.animal := id_aux;
      F.ConLector := true;
      F.ShowModal;
      F.Destroy;

      //crearLector;
      fPrincipal.TimerLector.Enabled := true;
    end
    else
      begin
        fPrincipal.TimerLector.Enabled := false;
        idCargaElectronica := '';
        idCargaElectronica := auxlectura;
        FV := TFMensajeGuardarVincular.Create(self);
        FV.idCargaElectronica := auxlectura;
        FV.showmodal;
        FV.Destroy;

        // Como se puede haber agregado uno, actualizo la busqueda
        DMSoftvet.IBQDatosAnimal.Close;
        DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
        DMSoftvet.IBQDatosAnimal.Open;

        idCargaElectronica := '';
        TimerLector.Enabled := true;
      end;
  end;
  // Lo cierro arriba y lo abro abajo, para ver si se vacia
end;


procedure TFPrincipal.TimerLectorTimer(Sender: TObject);
begin
  inherited;

  // Siempre lo hace, salvo que sea UHRFID, en cuyo caso puede desactivarse
  if FLectorElectronico.procesarLecturasIndividuales then
  begin
    self.identificarAnimalPorLector;
  end;
  
  if FLectorElectronico.tieneLecturas then
  begin
      BtnUHFRFID.Glyph.LoadFromFile('imagenes\Herramientas\verde.bmp');
  end
  else
  begin
      BtnUHFRFID.Glyph.LoadFromFile('imagenes\Herramientas\rojo.bmp');
  end

end;

procedure TFPrincipal.crearLector;
begin
  if Self._DISPOSITIVO_MODEL = 'UHFRFID' then
  begin
     FLectorElectronico:= TLectorUHFrfid.Create();
     BtnUHFRFID.Visible := true;
  end
  else
  begin
    BtnUHFRFID.Visible := false;
    if Self._DISPOSITIVO_MODEL = 'Shearwell' then
    begin
      FLectorElectronico:= TLectoShearWellData.Create();//creo segun el que estamos usando
    end
    else
    begin
      FLectorElectronico:= TLectorAllFlexSerie.Create();//creo segun el que estamos usando
    end;
  end;
    FLectorElectronico.ConfigurarVaComm();
    FLectorElectronico.OpenVAComm; // abro la conexion  }

  TimerLector.Enabled := true;
end;

procedure TFPrincipal.cerrarLector;
begin
  if FLectorElectronico<>nil then
  begin
    FLectorElectronico.CloseVAComm;
    FLectorElectronico.Destroy;
    FLectorElectronico:=nil;
  end;
  TimerLector.Enabled := false;
end;

procedure TFPrincipal.ASRANacimientosTransferExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFDOSRADenunciaNacimientosPorTransfer.Create(self));
end;

procedure TFPrincipal.AControlAnimalesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFControlAnimales.Create(self));
end;

procedure TFPrincipal.JvMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if Button = mbRight then
    (Sender as TJvImage).BeginDrag(true);
    
end;

procedure TFPrincipal.JvStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;
  ImgDragged := TJvImage.Create(self);
  ImgDragged.Picture := (Sender as TJvImage).Picture;
  ImgDragged.Pictures.PicEnter := (Sender as TJvImage).Pictures.PicEnter;
  ImgDragged.Tag := (Sender as TJvImage).Tag;
  ImgDragged.Cursor := crHandPoint;
  ImgDragged.AutoSize := true;

  PILDragDrop.Clear;
  PILDragDrop.Width := ImgDragged.Width;
  PILDragDrop.Height := ImgDragged.Height;
  PILDragDrop.InsertPng(0,TPNGObject(ImgDragged.Picture.Graphic));

  DragObject := TMyDragObject.Create(self);

end;

procedure TFPrincipal.CargarMiHuella;
var
  I, K : Integer;
  IniMiHuella : TIniFile;
begin
  try
    IniMiHuella := TIniFile.Create(ExtractFilePath(Application.ExeName)+'MiHuella.ini');
    for I := 1 to 5 do
        if IniMiHuella.ValueExists('MI HUELLA','Tag'+IntToStr(I)) then
          AgregarFuncion(IniMiHuella.ReadInteger('MI HUELLA','Tag'+IntToStr(I),-1));
  finally
    IniMiHuella.Destroy;
  end;
end;

procedure TFPrincipal.AgregarFuncion(Tag : Integer);
var
  R : TRegTagsAcciones;
  G : TRegCasillaGrilla;

  function CrearLeyenda(Caption : String; Padre : TWinControl; Limites : TRect) : TLabel;
  begin
    Result := TLabel.Create(self);
    Result.Parent := Padre;
    Result.Alignment := taCenter;
    Result.AutoSize := false;
    Result.Transparent := true;
    Result.WordWrap := true;
    Result.Caption := Traducir(Caption);
    Result.Font.Size := 10;
    Result.Font.Style := [fsBold];
    Result.Font.Name := 'Arial';
    Result.Font.Color := $00657100;
    Result.Width := Limites.Right-Limites.Left;
    Result.Height := 34;
    Result.Left := Limites.Left;
    Result.Top := Limites.Top+(Limites.Bottom-Limites.Top);
    Result.OnMouseEnter := MouseEnter;
    Result.OnMouseLeave := MouseLeave;
    Result.OnClick := Click;
    Result.Cursor := crHandPoint;
  end;

begin
  if BuscarAccion(Tag + 10000).Columna = -1 then
  begin
    R := BuscarAccion(Tag);
    if R.Tag < 100 then
    begin
      if Assigned(R.GrillaComp^.Accion) then
      begin
        MiHuella[Cant_MiHuella].Carpeta.Picture := R.GrillaComp^.Icono60.Picture;
        MiHuella[Cant_MiHuella].Carpeta.Pictures.PicEnter := R.GrillaComp^.Icono60.Pictures.PicEnter;
        MiHuella[Cant_MiHuella].Carpeta.Enabled := true;
        MiHuella[Cant_MiHuella].Carpeta.Tag := 1000000 + R.Tag;
        MiHuella[Cant_MiHuella].Carpeta.Visible := true;
        MiHuella[Cant_MiHuella].Icono := R.GrillaComp^.Icono;
        MiHuella[Cant_MiHuella].Tipo := ttmMiHuella;
        MiHuella[Cant_MiHuella].Leyenda := CrearLeyenda(R.GrillaComp^.Leyenda.Caption,PClient,MiHuella[Cant_MiHuella].Carpeta.BoundsRect);
        MiHuella[Cant_MiHuella].Leyenda.Tag := 1000000 + R.GrillaComp^.Carpeta.Tag;
        MiHuella[Cant_MiHuella].Leyenda.Visible := false;
        {MiHuella[Cant_MiHuella].Leyenda.OnClick := R.GrillaComp^.Leyenda.OnClick;}
        MiHuella[Cant_MiHuella].Accion := R.GrillaComp^.Accion;
        MiHuella[Cant_MiHuella].Cant_Subnivel := R.GrillaComp^.Cant_Subnivel;
        MiHuella[Cant_MiHuella].TipoPadre := R.GrillaComp^.TipoPadre;
        AgregarAccionEjecucion(MiHuella[Cant_MiHuella].Carpeta.Tag,Cant_MiHuella,0,R.Accion,ttmMiHuella,@MiHuella[Cant_MiHuella],nil);
        if Cant_MiHuella > 5 then
          Cant_MiHuella := 1
        else
          Inc(Cant_MiHuella);
      end;
    end
    else
    begin
      if (R.Tag < 10000) then
      begin
        if Assigned(R.GrillaSimple^.Accion) then
        begin
          MiHuella[Cant_MiHuella].Carpeta.Picture := R.GrillaSimple^.IconoG.Pictures.PicDown;
          MiHuella[Cant_MiHuella].Carpeta.Pictures.PicEnter := R.GrillaSimple^.IconoG.Pictures.PicClicked2;
          MiHuella[Cant_MiHuella].Carpeta.Enabled := true;
          MiHuella[Cant_MiHuella].Carpeta.Tag := 1000000 + R.Tag;
          MiHuella[Cant_MiHuella].Carpeta.Visible := true;
          MiHuella[Cant_MiHuella].Icono := R.GrillaSimple^.Icono;
          MiHuella[Cant_MiHuella].Tipo := ttmMiHuella;
          MiHuella[Cant_MiHuella].Leyenda := CrearLeyenda(R.GrillaSimple^.Leyenda.Caption,PClient,MiHuella[Cant_MiHuella].Carpeta.BoundsRect);
          MiHuella[Cant_MiHuella].Leyenda.Tag := 1000000 + R.GrillaSimple^.IconoG.Tag;
          MiHuella[Cant_MiHuella].Leyenda.Visible := false;
          {MiHuella[Cant_MiHuella].Leyenda.OnClick := R.GrillaSimple^.Leyenda.OnClick;}
          MiHuella[Cant_MiHuella].Accion := R.GrillaSimple^.Accion;
          MiHuella[Cant_MiHuella].Cant_Subnivel := 0;//R.GrillaSimple^.Cant_Subnivel;
          //MiHuella[Cant_MiHuella].TipoPadre := R.Tipo;
          AgregarAccionEjecucion(MiHuella[Cant_MiHuella].Carpeta.Tag,Cant_MiHuella,0,R.Accion,ttmMiHuella,@MiHuella[Cant_MiHuella],nil);
          if Cant_MiHuella > 5 then
            Cant_MiHuella := 1
          else
            Inc(Cant_MiHuella);
        end;
      end;
    end;
  end;
end;

procedure TFPrincipal.GuardarMiHuella;
var
  IniMiHuella : TIniFile;
  K, I : integer;
begin
  try
    IniMiHuella := TIniFile.Create(ExtractFilePath(Application.ExeName)+'MiHuella.ini');
    if IniMiHuella.SectionExists('MI HUELLA') then
      IniMiHuella.EraseSection('MI HUELLA');
    for I := 1 to 5 do
        if MiHuella[I].Carpeta.Visible then
          IniMiHuella.WriteInteger('MI HUELLA','Tag'+IntToStr(I),MiHuella[I].Carpeta.Tag-1000000);
  finally
    IniMiHuella.Destroy;
  end;
end;

procedure TFPrincipal.ITabsDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  inherited;
  //Accept := (X > IMiHuella.Left) and (X < (IMiHuella.Left+IMiHuella.Width)) and (Y > IMiHuella.Top) and (Y < (IMiHuella.Top+IMiHuella.Height));
end;

procedure TFPrincipal.LMiHuellaDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := true;
end;

procedure TFPrincipal.JvMiHuellaDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := true;
end;

procedure TFPrincipal.ITabsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  AgregarFuncion(ImgDragged.Tag);
end;

procedure TFPrincipal.JvMiHuellaDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  AgregarFuncion(ImgDragged.Tag);
end;

procedure TFPrincipal.LMiHuellaDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  AgregarFuncion(ImgDragged.Tag);
end;

procedure TFPrincipal.SacarIconoMiHuella(Tag : Integer);
var
  R : TRegTagsAcciones;
begin
  R := BuscarAccion(Tag);
  MiHuella[R.Fila].Accion := nil;
  MiHuella[R.Fila].Icono := nil;
  MiHuella[R.Fila].Carpeta.Visible := false;
  MiHuella[R.Fila].Leyenda.Visible := false;
  ReacomodarGrillaMiHuella;
  FormResize(nil);
end;

procedure TFPrincipal.ReacomodarGrillaMiHuella;
var
  I, K, I_U, K_U, Indice, ind1, ind2 : Integer;
  G : TRegCasillaGrilla;
  AR1, AR2 : TRegTagsAcciones;
begin
  K_U := 10000;
  for K := 1 to 5 do
  begin
    if not MiHuella[K].Carpeta.Visible then
    begin
      if K_U = 10000 then
        K_U := K;
    end
    else
    begin
      if (K_U < 10000) then
      begin
        for Indice := 0 to Length(Acciones)-1 do
          if Acciones[Indice].Tag = MiHuella[K].Carpeta.Tag then
          begin
            AR1 := Acciones[indice];
            ind1 := indice;
            break;
          end;

        for Indice := 0 to Length(Acciones)-1 do
          if Acciones[Indice].Tag = MiHuella[K_U].Carpeta.Tag then
          begin
            AR2 := Acciones[indice];
            ind2 := indice;
            break;
          end;

        Acciones[ind1].Columna := 0;
        Acciones[ind1].Fila := K_U;
        Acciones[ind1].GrillaComp := @MiHuella[K_U];

        Acciones[ind2].Columna := 0;
        Acciones[ind2].Fila := K;
        Acciones[ind2].GrillaComp := @MiHuella[K];

        G := MiHuella[K];
        MiHuella[K] := MiHuella[K_U];
        MiHuella[K_U] := G;
        K_U := K;
      end;
    end;
  end;
  if K_U < 10000 then
  begin
    Cant_MiHuella := K_U;
  end;
end;

procedure TFPrincipal.JvIMiHuellaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbRight then
    (Sender as TJvImage).BeginDrag(true);
end;

procedure TFPrincipal.JvIMiHuellaStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;
  ImgDragged := TJvImage.Create(self);
  ImgDragged.Picture := (Sender as TJvImage).Picture;
  ImgDragged.Pictures.PicEnter := (Sender as TJvImage).Pictures.PicEnter;
  ImgDragged.Tag := (Sender as TJvImage).Tag;
  ImgDragged.Cursor := crHandPoint;
  ImgDragged.AutoSize := true;

  PILDragDrop.Clear;
  PILDragDrop.Width := ImgDragged.Width;
  PILDragDrop.Height := ImgDragged.Height;
  PILDragDrop.InsertPng(0,TPNGObject(ImgDragged.Picture.Graphic));

  DragObject := TMyDragObject.Create(self);
end;

procedure TFPrincipal.IEliminarDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := true;
end;

procedure TFPrincipal.IEliminarDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  SacarIconoMiHuella(ImgDragged.Tag);
end;

procedure TFPrincipal.AConfiguracionFenotiposExecute(Sender: TObject);
var F : TFConfigValoresFenotipicos;
begin
  inherited;

  F := TFConfigValoresFenotipicos.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.ACargaFenotiposExecute(Sender: TObject);
var F : TFCargaFenotipos;
begin
  inherited;

  F := TFCargaFenotipos.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.ARepDenunciaBajasExecute(Sender: TObject);
var F : TFExpBrafordBaja;
begin
  inherited;

  F := TFExpBrafordBaja.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.ARepFlushingExecute(Sender: TObject);
var F : TFExpBrafordFlushing;
begin
  inherited;

  F := TFExpBrafordFlushing.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.ARepImplantesExecute(Sender: TObject);
var F : TFExpBrafordImplantes;
begin
  inherited;

  F := TFExpBrafordImplantes.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.ARepInspeccionExecute(Sender: TObject);
var F : TFExpBrafordInspeccion;
begin
  inherited;

  F := TFExpBrafordInspeccion.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.ARepNacimientosExecute(Sender: TObject);
var F : TFExpBrafordNacimientos;
begin
  inherited;

  F := TFExpBrafordNacimientos.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.ARepServiciosExecute(Sender: TObject);
var F : TFExpBrafordServicios;
begin
  inherited;

  F := TFExpBrafordServicios.Create(self);
  F.ShowModal;
  F.Destroy;

end;

procedure TFPrincipal.ARepTransferenciaExecute(Sender: TObject);
var F : TFExpBrafordTransferencia;
begin
  inherited;

  F := TFExpBrafordTransferencia.Create(self);
  F.ShowModal;
  F.Destroy;

end;

procedure TFPrincipal.ARepVientresAEmpadronarExecute(Sender: TObject);
var F : TFExpBrafordVientresEmpadronar;
begin
  inherited;

  F := TFExpBrafordVientresEmpadronar.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.ARepListadoDeAnimalesConFenotiposExecute(
  Sender: TObject);
var F : TFRepListadoAnimalesFenotipos;
begin
  inherited;

  F := TFRepListadoAnimalesFenotipos.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.RedibujarPaneles;
var
  I, K : Integer;
  MAX_FILA, MAX_COL : Integer;
  Fil, Col : Integer;
  Cantidad : Integer;
  D: Double;
begin

  if not(MuestraFenotipos) then
  begin
  //   Pongo en visible aquellos iconos de SRA
       GReportes.Iconos[2,5].Visible := true;
       GReportes.Iconos[2,5].Leyenda.Visible := true;
       GReportes.Iconos[2,5].Carpeta.Visible := true;

  //   Pongo en no visible aquello que no corresponde a Angus
       GAnimales.Iconos[2,5].Visible := false;
       GAnimales.Iconos[2,5].Leyenda.Visible := false;
       GAnimales.Iconos[2,5].Carpeta.Visible := false;

       GReportes.Iconos[2,6].Visible := false;
       GReportes.Iconos[2,6].Leyenda.Visible := false;
       GReportes.Iconos[2,6].Carpeta.Visible := false;

       GConfig.Iconos[2,5].Visible := false;
       GConfig.Iconos[2,5].Leyenda.Visible := false;
       GConfig.Iconos[2,5].Carpeta.Visible := false;
  end;

  if (MuestraFenotipos) then
  begin
  //   Pongo en visible lo de Braford - Brangus
       GAnimales.Iconos[2,5].Visible := true;
       GAnimales.Iconos[2,5].Leyenda.Visible := true;
       GAnimales.Iconos[2,5].Carpeta.Visible := true;

       GReportes.Iconos[2,6].Visible := true;
       GReportes.Iconos[2,6].Leyenda.Visible := true;
       GReportes.Iconos[2,6].Carpeta.Visible := true;


       if (RazaBraford) then
       begin
          GReportes.Iconos[2,6].GrillaHijos[1,1].Icono.Visible := true;
          GReportes.Iconos[2,6].GrillaHijos[1,1].Leyenda.Visible := true;
          GReportes.Iconos[2,6].GrillaHijos[1,1].LIniciales.Visible := true;
       end
       else
       begin
          GReportes.Iconos[2,6].GrillaHijos[1,1].Icono.Visible := false;
          GReportes.Iconos[2,6].GrillaHijos[1,1].Leyenda.Visible := false;
          GReportes.Iconos[2,6].GrillaHijos[1,1].LIniciales.Visible := false;
       end;

       if (RazaBrangus) then
       begin
          GReportes.Iconos[2,6].GrillaHijos[1,2].Icono.Visible := true;
          GReportes.Iconos[2,6].GrillaHijos[1,2].Leyenda.Visible := true;
          GReportes.Iconos[2,6].GrillaHijos[1,2].LIniciales.Visible := true;
       end
       else
       begin
          GReportes.Iconos[2,6].GrillaHijos[1,2].Icono.Visible := false;
          GReportes.Iconos[2,6].GrillaHijos[1,2].Leyenda.Visible := false;
          GReportes.Iconos[2,6].GrillaHijos[1,2].LIniciales.Visible := false;
       end;

       if (RazaAngus) then
       begin
          GReportes.Iconos[2,6].GrillaHijos[1,3].Icono.Visible := true;
          GReportes.Iconos[2,6].GrillaHijos[1,3].Leyenda.Visible := true;
          GReportes.Iconos[2,6].GrillaHijos[1,3].LIniciales.Visible := true;
       end
       else
       begin
          GReportes.Iconos[2,6].GrillaHijos[1,3].Icono.Visible := false;
          GReportes.Iconos[2,6].GrillaHijos[1,3].Leyenda.Visible := false;
          GReportes.Iconos[2,6].GrillaHijos[1,3].LIniciales.Visible := false;
       end;

       GConfig.Iconos[2,5].Visible := true;
       GConfig.Iconos[2,5].Leyenda.Visible := true;
       GConfig.Iconos[2,5].Carpeta.Visible := true;

  //   Pongo en no visible lo de SRA

       GReportes.Iconos[2,5].Visible := false;
       GReportes.Iconos[2,5].Leyenda.Visible := false;
       GReportes.Iconos[2,5].Carpeta.Visible := false;
  end;

  GAnimales.Iconos[1,4].Visible := TipoActividad <> ttaFeedlot;
  GAnimales.Iconos[1,4].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolSemen.Visible := TipoActividad <> ttaFeedlot;

  GAnimales.Iconos[2,4].Visible := FuncCaravanasElectronicas;
  GAnimales.Iconos[2,4].Leyenda.Visible := FuncCaravanasElectronicas;


  JvFolElectronico.Visible := FuncCaravanasElectronicas;

  GAnimales.Iconos[1,5].Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);
  GAnimales.Iconos[1,5].Leyenda.Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);
  JvFolEmbriones.Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);

  GAnimales.Iconos[2,1].Visible := (TipoActividad = ttaCabania) and (FuncDEPs);
  GAnimales.Iconos[2,1].Leyenda.Visible := (TipoActividad = ttaCabania) and (FuncDEPs);
  JvFolDEPS.Visible := (TipoActividad = ttaCabania) and (FuncDEPs);

  GEventos.Iconos[1,1].Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[1,1].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolECria.Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[1,4].Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[1,4].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolEGestacion.Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[1,5].Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[1,5].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolEPartos.Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[2,2].Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[2,2].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolEServicios.Visible := TipoActividad <> ttaFeedlot;
  GEventos.Iconos[2,3].Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);
  GEventos.Iconos[2,3].Leyenda.Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);
  JvFolETransferencia.Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);

  GReportes.Iconos[1,2].Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[1,2].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolRGestacion.Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[1,3].Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[1,3].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolRPartos.Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[2,1].Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[2,1].Leyenda.Visible := TipoActividad <> ttaFeedlot;
  JvFolRServicios.Visible := TipoActividad <> ttaFeedlot;
  GReportes.Iconos[2,2].Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);
  GReportes.Iconos[2,2].Leyenda.Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);
  JvFolRTransferencia.Visible := (TipoActividad = ttaCabania) and (FuncTransferencia);

  GReportes.Iconos[2,5].Visible := (TipoActividad = ttaCabania) and (not MuestraFenotipos);
  GReportes.Iconos[2,5].Leyenda.Visible := (TipoActividad = ttaCabania) and (not MuestraFenotipos);
  JvFolRSRA.Visible := (TipoActividad = ttaCabania) and (not MuestraFenotipos);
  GReportes.Iconos[2,6].Visible := (TipoActividad = ttaCabania) and (MuestraFenotipos);
  GReportes.Iconos[2,6].Leyenda.Visible := (TipoActividad = ttaCabania) and (MuestraFenotipos);
  JvFolDocAsociaciones.Visible := (TipoActividad = ttaCabania) and (MuestraFenotipos);

  GHerramientas.Iconos[1,4].Visible := FuncCaravanasElectronicas;
  GHerramientas.Iconos[1,4].Leyenda.Visible :=  FuncCaravanasElectronicas;
  JvFolCaravanaElect.Visible :=  FuncCaravanasElectronicas;

  try

  for I := 1 to 2 do
    for K := 1 to MAX_ANIMALES_ARR do
    begin
      if GAnimales.Iconos[I,K].Visible then
      begin
        if TipoActividad = ttaFeedlot then
        begin
          GAnimales.Iconos[I,K].Leyenda.Font.Color := clWhite;
          if Assigned(GAnimales.Iconos[I,K].Fondo) then
            GAnimales.Iconos[I,K].Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Feedlot\IFondo3N.jpg');
        end
        else
        begin
          GAnimales.Iconos[I,K].Leyenda.Font.Color := $0015243C;
          if Assigned(GAnimales.Iconos[I,K].Fondo) then
            GAnimales.Iconos[I,K].Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\IFondo3NAnimales.jpg');
        end;

        MAX_FILA := 5;
        if (GAnimales.Iconos[I,K].Cant_Subnivel > 0) and (GAnimales.Iconos[I,K].Cant_Subnivel <= 5) then
        begin
          MAX_FILA := GAnimales.Iconos[I,K].Cant_Subnivel;
          MAX_COL := 1;
        end;
        if (GAnimales.Iconos[I,K].Cant_Subnivel > 5) and (GAnimales.Iconos[I,K].Cant_Subnivel <= 10) then
          MAX_COL := 2;
        if (GAnimales.Iconos[I,K].Cant_Subnivel > 10) and (GAnimales.Iconos[I,K].Cant_Subnivel <= 15) then
          MAX_COL := 3;
        if (GAnimales.Iconos[I,K].Cant_Subnivel > 15) and (GAnimales.Iconos[I,K].Cant_Subnivel <= 20) then
          MAX_COL := 4;

        Cantidad := 0;

        if GAnimales.Iconos[I,K].Cant_Subnivel > 0 then
        begin
        for Col := 1 to MAX_COL do
          for Fil := 1 to MAX_FILA do
          begin
            if Cantidad >= GAnimales.Iconos[I,K].Cant_Subnivel then
              break;
            Inc(Cantidad);
            if TipoActividad = ttaFeedlot then
              GAnimales.Iconos[I,K].GrillaHijos[Col,Fil].Leyenda.Font.Color := clWhite
            else
              GAnimales.Iconos[I,K].GrillaHijos[Col,Fil].Leyenda.Font.Color := $0015243C;

            AsignarAccion(self,GAnimales.Iconos[I,K].GrillaHijos[Col,Fil],Cantidad,GAnimales.Iconos[I,K].TipoPadre);
          end;
        end;
      end;
    end;

  for I := 1 to 2 do
    for K := 1 to MAX_EVENTOS_ARR do
    begin
      if GEventos.Iconos[I,K].Visible then
      begin
        MAX_FILA := 5;
        if TipoActividad = ttaFeedlot then
        begin
          GEventos.Iconos[I,K].Leyenda.Font.Color := clWhite;
          if Assigned(GEventos.Iconos[I,K].Fondo) then
            GEventos.Iconos[I,K].Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Feedlot\IFondo3N.jpg');
        end
        else
        begin
          GEventos.Iconos[I,K].Leyenda.Font.Color := $00444545;
          if Assigned(GEventos.Iconos[I,K].Fondo) then
            GEventos.Iconos[I,K].Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\IFondo3NEventos.jpg');
        end;

        MAX_FILA := 5;
        if (GEventos.Iconos[I,K].Cant_Subnivel > 0) and (GEventos.Iconos[I,K].Cant_Subnivel <= 5) then
        begin
          MAX_FILA := GEventos.Iconos[I,K].Cant_Subnivel;
          MAX_COL := 1;
        end;
        if (GEventos.Iconos[I,K].Cant_Subnivel > 5) and (GEventos.Iconos[I,K].Cant_Subnivel <= 10) then
          MAX_COL := 2;
        if (GEventos.Iconos[I,K].Cant_Subnivel > 10) and (GEventos.Iconos[I,K].Cant_Subnivel <= 15) then
          MAX_COL := 3;
        if (GEventos.Iconos[I,K].Cant_Subnivel > 15) and (GEventos.Iconos[I,K].Cant_Subnivel <= 20) then
          MAX_COL := 4;

        Cantidad := 0;

        if GEventos.Iconos[I,K].Cant_Subnivel > 0 then
        begin
          for Col := 1 to MAX_COL do
            for Fil := 1 to MAX_FILA do
            begin
              if Cantidad >= GEventos.Iconos[I,K].Cant_Subnivel then
                break;
              Inc(Cantidad);
              if TipoActividad = ttaFeedlot then
                GEventos.Iconos[I,K].GrillaHijos[Col,Fil].Leyenda.Font.Color := clWhite
              else
                GEventos.Iconos[I,K].GrillaHijos[Col,Fil].Leyenda.Font.Color := $00444545;
              AsignarAccion(self,GEventos.Iconos[I,K].GrillaHijos[Col,Fil],Cantidad,GEventos.Iconos[I,K].TipoPadre);
            end;
        end;
      end;
    end;

  for I := 1 to 2 do
    for K := 1 to MAX_REPORTES_ARR do
    begin
      if GReportes.Iconos[I,K].Visible then
      begin

        if TipoActividad = ttaFeedlot then
        begin
          GReportes.Iconos[I,K].Leyenda.Font.Color := clWhite;
          if Assigned(GReportes.Iconos[I,K].Fondo) then
            GReportes.Iconos[I,K].Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Feedlot\IFondo3N.jpg');
        end
        else
        begin
          GReportes.Iconos[I,K].Leyenda.Font.Color := $00834A2A;
          if Assigned(GReportes.Iconos[I,K].Fondo) then
            GReportes.Iconos[I,K].Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\IFondo3NReportes.jpg');
        end;
        
        MAX_FILA := 5;
        if (GReportes.Iconos[I,K].Cant_Subnivel > 0) and (GReportes.Iconos[I,K].Cant_Subnivel <= 5) then
        begin
          MAX_FILA := GReportes.Iconos[I,K].Cant_Subnivel;
          MAX_COL := 1;
        end;
        if (GReportes.Iconos[I,K].Cant_Subnivel > 5) and (GReportes.Iconos[I,K].Cant_Subnivel <= 10) then
          MAX_COL := 2;
        if (GReportes.Iconos[I,K].Cant_Subnivel > 10) and (GReportes.Iconos[I,K].Cant_Subnivel <= 15) then
          MAX_COL := 3;
        if (GReportes.Iconos[I,K].Cant_Subnivel > 15) and (GReportes.Iconos[I,K].Cant_Subnivel <= 20) then
          MAX_COL := 4;

        Cantidad := 0;

        if GReportes.Iconos[I,K].Cant_Subnivel > 0 then
        begin
          for Col := 1 to MAX_COL do
            for Fil := 1 to MAX_FILA do
            begin

                if Cantidad >= GReportes.Iconos[I,K].Cant_Subnivel then
                  break;
                Inc(Cantidad);
                if TipoActividad = ttaFeedlot then
                  GReportes.Iconos[I,K].GrillaHijos[Col,Fil].Leyenda.Font.Color := clWhite
                else
                  GReportes.Iconos[I,K].GrillaHijos[Col,Fil].Leyenda.Font.Color := $00834A2A;
                AsignarAccion(self,GReportes.Iconos[I,K].GrillaHijos[Col,Fil],Cantidad,GReportes.Iconos[I,K].TipoPadre);

            end;
        end;
      end;
    end;

  for I := 1 to 2 do
    for K := 1 to MAX_HERRAMIENTAS do
    begin
      if GHerramientas.Iconos[I,K].Visible then
      begin
        if TipoActividad = ttaFeedlot then
        begin
          GHerramientas.Iconos[I,K].Leyenda.Font.Color := clWhite;
          if Assigned(GHerramientas.Iconos[I,K].Fondo) then
            GHerramientas.Iconos[I,K].Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Feedlot\IFondo3N.jpg');
        end
        else
        begin
          GHerramientas.Iconos[I,K].Leyenda.Font.Color := $00494949;
          if Assigned(GHerramientas.Iconos[I,K].Fondo) then
            GHerramientas.Iconos[I,K].Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\IFondo3NHerramientas.jpg');
        end;

        MAX_FILA := 5;
        if (GHerramientas.Iconos[I,K].Cant_Subnivel > 0) and (GHerramientas.Iconos[I,K].Cant_Subnivel <= 5) then
        begin
          MAX_FILA := GHerramientas.Iconos[I,K].Cant_Subnivel;
          MAX_COL := 1;
        end;
        if (GHerramientas.Iconos[I,K].Cant_Subnivel > 5) and (GHerramientas.Iconos[I,K].Cant_Subnivel <= 10) then
          MAX_COL := 2;
        if (GHerramientas.Iconos[I,K].Cant_Subnivel > 10) and (GHerramientas.Iconos[I,K].Cant_Subnivel <= 15) then
          MAX_COL := 3;
        if (GHerramientas.Iconos[I,K].Cant_Subnivel > 15) and (GHerramientas.Iconos[I,K].Cant_Subnivel <= 20) then
          MAX_COL := 4;

        Cantidad := 0;

        if GHerramientas.Iconos[I,K].Cant_Subnivel > 0 then
        begin
          for Col := 1 to MAX_COL do
            for Fil := 1 to MAX_FILA do
            begin
              if Cantidad >= GHerramientas.Iconos[I,K].Cant_Subnivel then
                break;
              Inc(Cantidad);
              if TipoActividad = ttaFeedlot then
                GHerramientas.Iconos[I,K].GrillaHijos[Col,Fil].Leyenda.Font.Color := clWhite
              else
                GHerramientas.Iconos[I,K].GrillaHijos[Col,Fil].Leyenda.Font.Color := $00494949;
              AsignarAccion(self,GHerramientas.Iconos[I,K].GrillaHijos[Col,Fil],Cantidad,GHerramientas.Iconos[I,K].TipoPadre);
            end;
        end;
      end;
    end;

  for I := 1 to 2 do
    for K := 1 to MAX_CONGIF do
    begin
      if GConfig.Iconos[I,K].Visible then
      begin
        if TipoActividad = ttaFeedlot then
        begin
          GConfig.Iconos[I,K].Leyenda.Font.Color := clWhite;
          if Assigned(GConfig.Iconos[I,K].Fondo) then
            GConfig.Iconos[I,K].Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Feedlot\IFondo3N.jpg');
        end
        else
        begin
          GConfig.Iconos[I,K].Leyenda.Font.Color := $002D1EBE;
          if Assigned(GConfig.Iconos[I,K].Fondo) then
            GConfig.Iconos[I,K].Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\IFondo3NConfiguracion.jpg');
        end;

        MAX_FILA := 5;
        if (GConfig.Iconos[I,K].Cant_Subnivel > 0) and (GConfig.Iconos[I,K].Cant_Subnivel <= 5) then
        begin
          MAX_FILA := GConfig.Iconos[I,K].Cant_Subnivel;
          MAX_COL := 1;
        end;
        if (GConfig.Iconos[I,K].Cant_Subnivel > 5) and (GConfig.Iconos[I,K].Cant_Subnivel <= 10) then
          MAX_COL := 2;
        if (GConfig.Iconos[I,K].Cant_Subnivel > 10) and (GConfig.Iconos[I,K].Cant_Subnivel <= 15) then
          MAX_COL := 3;
        if (GConfig.Iconos[I,K].Cant_Subnivel > 15) and (GConfig.Iconos[I,K].Cant_Subnivel <= 20) then
          MAX_COL := 4;

        Cantidad := 0;

        if GConfig.Iconos[I,K].Cant_Subnivel > 0 then
        begin
          for Col := 1 to MAX_COL do
            for Fil := 1 to MAX_FILA do
            begin
              if Cantidad >= GConfig.Iconos[I,K].Cant_Subnivel then
                break;
              Inc(Cantidad);
              if TipoActividad = ttaFeedlot then
                GConfig.Iconos[I,K].GrillaHijos[Col,Fil].Leyenda.Font.Color := clWhite
              else
                GConfig.Iconos[I,K].GrillaHijos[Col,Fil].Leyenda.Font.Color := $002D1EBE;
              AsignarAccion(self,GConfig.Iconos[I,K].GrillaHijos[Col,Fil],Cantidad,GConfig.Iconos[I,K].TipoPadre);
            end;
        end;
      end;
    end;
  except
  end;

  HabilitarPestania(9);
  HabilitarPaneles(9);

  FormResize(self);

end;

procedure TFPrincipal.AREPResumenMovimientoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFResumenMovimientos.Create(self));
  AgregarAccion(AREPResumenMovimiento.Name,'Resumen de Movimientos',3,JvIReportes3N,JvFolRGral,'RDM');
end;

procedure TFPrincipal.ARepMovimientoSemenExecute(Sender: TObject);
begin
  inherited;

  if FuncTransferencia then
  begin
    AbrirFormNormal(TFRepMovimientosSemen.Create(self));
    AgregarAccion(ARepMovimientoSemen.Name,'Movimientos de Semen',3,JvIReportes3N,JvFolSemen,'MDS');
  end
  else
  begin
     MostrarMensaje(tmInformacion, 'No disponible en esta versi�n');
  end
end;

procedure TFPrincipal.APartidasSemenAprobarExecute(Sender: TObject);
begin
  inherited;

  if FuncTransferencia then
  begin
    AbrirFormNormal(TFPartidasSemenAprobar.Create(self));
    AgregarAccion(APartidasSemenAprobar.Name,'Partidas por Aprobar',1,JvAnimales3N,JvFolSemen,'PPA');
  end
  else
  begin
     MostrarMensaje(tmInformacion, 'No disponible en esta versi�n');
  end;

end;

procedure TFPrincipal.ARepListadoExtraccionesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFRepListadoExtracciones.Create(self));
  AgregarAccion(ARepListadoExtracciones.Name,'Listado de Extracciones',1,JvAnimales3N,JvFolSemen,'LDE');
end;

procedure TFPrincipal.AHuellaVetExecute(Sender: TObject);
begin
  inherited;
  IBubble.Top := IBubble.Parent.Height - IBubble.Height;

  IBubble.Visible := true;
  IBubble.BringToFront;
end;

procedure TFPrincipal.IBubbleClick(Sender: TObject);
begin
  inherited;
  IBubble.Visible := false;
end;

procedure TFPrincipal.JvHuellaProdClick(Sender: TObject);
var ruta : string;
begin
  inherited;

  ruta := ExtractFilePath(Application.ExeName)+'CRM.exe';

  if (FileExists(PChar(ruta))) then
    WinExec(PChar(ruta),sw_shownormal)
  else
  begin
    IBubbleProd.Top := IBubbleProd.Parent.Height - IBubbleProd.Height;
    IBubbleProd.Visible := true;
    IBubbleProd.BringToFront;
  end;
end;

procedure TFPrincipal.IBubbleProdClick(Sender: TObject);
begin
  inherited;
  IBubbleProd.Visible := false;
end;

procedure TFPrincipal.ISeleccionarRazaPredomClick(Sender: TObject);
var F : TFSelectorRazasPredom;
begin
  inherited;

  F := TFSelectorRazasPredom.Create(self);
  F.TipoCarga := 1;
  F.ShowModal;
  F.Destroy;

  SeleccionarRazaPredom;

end;

procedure TFPrincipal.ACesionEmbrionesTercerosBrangusExecute(Sender: TObject);
var F : TFExpBrangusImplantes;
begin
  inherited;

  F := TFExpBrangusImplantes.Create(self);
  F.ShowModal;
  F.Destroy;

end;

procedure TFPrincipal.ATransferenciaBrangusExecute(Sender: TObject);
var F : TFExpBrangusTransferencia;
begin
  inherited;

  F := TFExpBrangusTransferencia.Create(self);
  F.ShowModal;
  F.Destroy;

end;

procedure TFPrincipal.AInspeccionBrangusExecute(Sender: TObject);
var F : TFExpBrangusInspeccion;
begin
  inherited;

  F := TFExpBrangusInspeccion.Create(self);
  F.ShowModal;
  F.Destroy;

end;

procedure TFPrincipal.ANacimientosBrangusExecute(Sender: TObject);
var F : TFExpBrangusNacimientos;
begin
  inherited;

  F := TFExpBrangusNacimientos.Create(self);
  F.ShowModal;
  F.Destroy;


end;

procedure TFPrincipal.AServiciosBrangusExecute(Sender: TObject);
var F : TFExpBrangusServicios;
begin
  inherited;

  F := TFExpBrangusServicios.Create(Self);
  F.ShowModal;
  F.Destroy;

end;

procedure TFPrincipal.LCerrarAsistenteClick(Sender: TObject);
begin
  inherited;

  if (MostrarMensaje(tmConsulta,'�Desea cerrar el asistente realmente?') = mrYes) then
  begin
    HabilitarPestania(9);
    HabilitarPaneles(9);
    FormResize(self);
  end;

end;

procedure TFPrincipal.Button3Click(Sender: TObject);
var
  F : TFSimuladorA;
begin
  inherited;
  iniciarSimulador;

//  F := TFSimuladorA.Create(self);
//  F.ShowModal;
//  F.Destroy;

end;

procedure TFPrincipal.Mensaje(var Message : TMessage);
var
  F : TFREPFichaAnimal;
begin
  with Message do
  begin
    F := TFREPFichaAnimal.Create(self);
    F.animal := WParam;
    Application.BringToFront;
    F.ShowModal;
    F.Destroy;
    SendMessage(FindWindow(nil, 'Sistema de Administraci�n de Clientes, Stock y Ventas'), WM_USER + 2, 1, 1);
  end;
end;


procedure TFPrincipal.ARazaPredomExecute(Sender: TObject);
var F : TFSelectorRazasPredom;
begin
  inherited;

  F := TFSelectorRazasPredom.Create(self);
  F.TipoCarga := 1;
  F.ShowModal;
  F.Destroy;

  SeleccionarRazaPredom;

end;

procedure TFPrincipal.IBQListaAnimalesCalcFields(DataSet: TDataSet);
var
  valRP : Integer;
begin
  inherited;
  if TryStrToInt(DataSet.FieldValues['rp'],valRP) then
    IBQListaAnimalesRP_AUX.Value := UFunctions.CompletarDigitosSenasa(DataSet.FieldValues['rp'])
  else
    IBQListaAnimalesRP_AUX.Value := DataSet.FieldValues['rp'];
end;

procedure TFPrincipal.ARepCierreLoteExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPCierreLote.Create(self));
end;

procedure TFPrincipal.AABMTipoCategoriaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFABMTiposCategorias.Create(self));
end;

procedure TFPrincipal.AEveCambioCategoriaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveCambioCategoria.Create(self));
end;

procedure TFPrincipal.ILogoMarcaAguaClick(Sender: TObject);
begin
  inherited;
  if Cant_Ejecuciones < 5 then
  begin
    HabilitarPaneles(6);
    HabilitarPestania(-1);
  end
  else
  begin
    HabilitarPaneles(11);
    HabilitarPestania(11);
  end;
end;

procedure TFPrincipal.JvIVolverAyudaInicClick(Sender: TObject);
begin
  inherited;
  HabilitarPaneles(6);
  HabilitarPestania(-1);
end;

procedure TFPrincipal.JvIBotAyudaClick(Sender: TObject);
begin
  inherited;
  HabilitarPaneles(7);
  HabilitarPestania(-1);
end;

procedure TFPrincipal.JvIBotonOpcion1Click(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCargaMasiva:= false;
  AsistenteCMasivaPlanilla:= false;
  PAAnimales.Visible:=false;
  AsistenteMapa:=true;
  PAInicioMapa.Visible:=true;
  PAInicioMapa.BringToFront;
end;

procedure TFPrincipal.JvIBotonOpcion2Click(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  PAAnimales.Visible:=true;
  PAAnimales.BringToFront;
end;

procedure TFPrincipal.JvIBotonOpcion3Click(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCargaMasiva:= false;
  AsistenteMapa:= false;
  AsistenteCMasivaPlanilla:= true;
  PAInicioMapa.Visible:= false;
  PAAnimales.Visible:=true;
  PAAnimales.BringToFront;
end;

procedure TFPrincipal.CargarTopImgHints(Itop: String);
begin
   PAAnimales.AsignarTop(Itop);
   PACargaM.AsignarTop(Itop);
   PACargaMP.AsignarTop(Itop);
   PAInicioCMP.AsignarTop(Itop);
   PAInicioCargaM.AsignarTop(Itop);
   PAInicioMapa.AsignarTop(Itop);
end;


procedure TFPrincipal.CargarCenterImgHints(ICenter: String);
begin
   PAAnimales.AsignarCenter(ICenter);
   PACargaM.AsignarCenter(ICenter);
   PACargaMP.AsignarCenter(ICenter);
   PAInicioCMP.AsignarCenter(ICenter);
   PAInicioCargaM.AsignarCenter(ICenter);
   PAInicioMapa.AsignarCenter(ICenter);
end;


procedure TFPrincipal.CargarBottomImgHints(IBottom: String);
begin
   PAAnimales.AsignarBottom(IBottom);
   PACargaM.AsignarBottom(IBottom);
   PACargaMP.AsignarBottom(IBottom);
   PAInicioCMP.AsignarBottom(IBottom);
   PAInicioCargaM.AsignarBottom(IBottom);
   PAInicioMapa.AsignarBottom(IBottom);
end;

procedure TFPrincipal.JvImage8Click(Sender: TObject);
begin
  inherited;
  AMapaEstab.Execute;
end;

procedure TFPrincipal.JvIFavorBotClick(Sender: TObject);
begin
  inherited;
  (FindComponent(Favoritos[(Sender as TControl).Tag].Name) as TBasicAction).Execute;
end;


procedure TFPrincipal.JvImage16Click(Sender: TObject);
begin
  inherited;
  PACargaM.Visible := false;
end;

procedure TFPrincipal.JvImage14Click(Sender: TObject);
begin
  inherited;
  PACargaMP.Visible := false;
end;

procedure TFPrincipal.JvImage7Click(Sender: TObject);
begin
  inherited;
  PAInicioMapa.Visible := false;
end;

procedure TFPrincipal.JvImage17Click(Sender: TObject);
begin
  inherited;
  PAAnimales.Visible := false;
end;

procedure TFPrincipal.JvImage10Click(Sender: TObject);
begin
  inherited;
  PAInicioCMP.Visible := false;
end;

procedure TFPrincipal.JvImage12Click(Sender: TObject);
begin
  inherited;
  PAInicioCargaM.Visible := false;
end;

procedure TFPrincipal.IniciarSimulador;
begin
  if FuncPanel then
  begin
    AbrirFormNormal(TFSimuladorA.Create(self));
    AgregarAccion(ASimulInv.Name,ASimulInv.Caption,1,nil,JvISimulador,'');
  end
  else
  begin
     MostrarMensaje(tmInformacion, 'No disponible en esta versi�n');
  end

end;

procedure TFPrincipal.ASimulInvExecute(Sender: TObject);
begin
  inherited;
  IniciarSimulador;
end;

procedure TFPrincipal.JvIMapaMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvIMapa,#13+'Mapa del Establecimiento'+#13);
end;

procedure TFPrincipal.JvIMapaMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFPrincipal.JvISimuladorMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvISimulador,#13+'Simulador de Inversi�n'+#13);
end;

procedure TFPrincipal.JvISimuladorMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFPrincipal.JvIContableMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvIContable,#13+'Sistema de Administraci�n de Clientes, Facturaci�n y Stock'+#13);
end;

procedure TFPrincipal.JvIContableMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFPrincipal.JvIActualizaMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvIActualiza,'Hay actualizaciones disponibles'+#13+'haga click para actualizar HUELLA');
end;

procedure TFPrincipal.JvIActualizaMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFPrincipal.IFondoAnimalesDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  SacarIconoMiHuella(ImgDragged.Tag);
end;

procedure TFPrincipal.JvIVolverClick(Sender: TObject);
var
  R : TRegTagsAcciones;
begin
   if JvIVolver.Tag < 100 then
    HabilitarPaneles(JvIVolver.Tag)
   else
   begin
    R := BuscarAccion(JvIVolver.Tag);
    HabilitarAyuda(R.Tag);
    if R.Tag < 10000 then
      HabilitarPanel(R.GrillaSimple^.GrillaHijos^.PanelHijo, R.GrillaSimple^.GrillaHijos^.Leyenda.Caption, R.GrillaSimple^.GrillaHijos^.Tipo)
    else
    begin
      if (R.Tag-10000)  < 100 then
        HabilitarPanel(R.GrillaComp^.PanelHijo, R.GrillaComp^.Leyenda.Caption, R.GrillaComp^.Tipo)
      else
        HabilitarPanel(R.GrillaSimple^.GrillaHijos^.PanelHijo, R.GrillaSimple^.GrillaHijos^.Leyenda.Caption, R.GrillaSimple^.GrillaHijos^.Tipo);
    end;
   end;
   FormResize(self);

end;

procedure TFPrincipal.ARepListadosPersonalizadosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFREPListadosPersonalizados.Create(self));
  AgregarAccion(ARepListadosPersonalizados.Name,'Listados Personalizados',3,JvIReportes3N,JvFolRGral,'LPE');
end;

procedure TFPrincipal.TimagenActualizadorTimer(Sender: TObject);
begin
  inherited;
  if TimagenActualizador.Tag = 10000 then
  begin
    TimagenActualizador.Enabled := false;
    TimagenActualizador.Tag := 0;
  end
  else
  begin
    JvIActualiza.Pictures.PicClicked1 := JvIActualiza.Pictures.PicEnter;
    JvIActualiza.Pictures.PicEnter := JvIActualiza.Picture;
    JvIActualiza.Picture := JvIActualiza.Pictures.PicClicked1;
    JvIActualiza.Pictures.PicClicked1 := nil;
  end;
  TimagenActualizador.Tag := TimagenActualizador.Tag + 1000;
end;

procedure TFPrincipal.JvIAIBot1Click(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCargaMasiva:= false;
  AsistenteCMasivaPlanilla:= false;
  PAAnimales.Visible:=false;
  AsistenteMapa:=true;
  if IsConnected then
    AbrirFormNormal(TFMapaGoogle.Create(self))
  else
    AbrirFormNormal(TFMapa.Create(self));
end;

procedure TFPrincipal.JvIAIBot2Click(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  AEveAltaMasiva.Execute;
end;

procedure TFPrincipal.JvIAIBot3Click(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCargaMasiva:= false;
  AsistenteMapa:= false;
  AsistenteCMasivaPlanilla:= true;
  PAInicioMapa.Visible:= false;
  AEveDeclaracionAFIP.Execute;
end;

procedure TFPrincipal.AEveAltaAlimentacionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFEveMovimientosAlimentacion.Create(self,1));
end;

procedure TFPrincipal.AEveBajaAlimentacionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFEveMovimientosAlimentacion.Create(self,2));
end;

procedure TFPrincipal.AEveStockAlimentacionExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFEveMovimientosAlimentacion.Create(self,3));
end;

procedure TFPrincipal.ARepMovimientosAlimentosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFRepMovimientosAlimentos.Create(self));
end;

procedure TFPrincipal.ARepHojaDeCampoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFRepHojaDeCampo.Create(self));
end;

procedure TFPrincipal.JvIDiagnosticoClick(Sender: TObject);
var
  F : TFEducacionContinua;
begin
  inherited;
  F := TFEducacionContinua.Create(Self,1);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.JvIDiagnosticoRepClick(Sender: TObject);
var
  F : TFEducacionContinua;
begin
  inherited;
  F := TFEducacionContinua.Create(self,2);
  F.ShowModal;
  F.Destroy;
end;

procedure TFPrincipal.AcomodarEC;
var
  w, h : Integer;
begin
  w := PEducacionContinua.Width div 3;
  h := PEducacionContinua.Height;
  JvIDiagnostico.Left := w - (w div 2) - (JvIDiagnostico.Width div 2);
  JvIDiagnostico.Top := (h div 2) - (JvIDiagnostico.Height div 2) - JvIBaseContenedor.Height;
  LDGEC.Left := w - (w div 2) - (LDGEC.Width div 2);
  LDGEC.Top := JvIDiagnostico.Top + JvIDiagnostico.Height + 5;

  JvIDiagnosticoRep.Left := (w * 2) - (w div 2) - (JvIDiagnosticoRep.Width div 2);
  JvIDiagnosticoRep.Top := (h div 2) - (JvIDiagnosticoRep.Height div 2) - JvIBaseContenedor.Height;
  LDGREC.Left := (w * 2) - (w div 2) - (LDGREC.Width div 2);
  LDGREC.Top := JvIDiagnosticoRep.Top + JvIDiagnosticoRep.Height + 5;

  JvIHojaMangaEC.Left := (w * 3) - (w div 2) - (JvIHojaMangaEC.Width div 2);
  JvIHojaMangaEC.Top := (h div 2) - (JvIHojaMangaEC.Height div 2) - JvIBaseContenedor.Height;
  LHojaMangaEC.Left := (w * 3) - (w div 2) - (LHojaMangaEC.Width div 2);
  LHojaMangaEC.Top := JvIHojaMangaEC.Top + JvIHojaMangaEC.Height + 5;


end;

procedure TFPrincipal.JvIHojaMangaECClick(Sender: TObject);
begin
  inherited;
  AbrirFormNormal(TFPlanillasManga.Create(self,self));
end;

procedure TFPrincipal.AEveEvalClinicaTorosExecute(Sender: TObject);
begin
  inherited;
  AbrirEventoConManga(TFEveEvalClinicaToros.Create(self));
end;

function TFPrincipal.consultarDeseaBackup(texto: String):boolean;
begin
  if MostrarMensaje(tmConsulta, texto) = mrYes then
  begin
    AGenBackupExecute(self);
    consultarDeseaBackup := true;
  end
  else
  begin
    consultarDeseaBackup := false;
  end;
end;


procedure TFPrincipal.JvICargaIndividualClick(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  AEveAltaDirecta.Execute;
end;

procedure TFPrincipal.JvIBajaClick(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  AEveBaja.Execute;
end;

procedure TFPrincipal.JvIConfElectroClick(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  AConfigElectronico.Execute;
end;

procedure TFPrincipal.JvIBackupClick(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  AGenBackup.Execute;
end;

procedure TFPrincipal.JvICargaMovilClick(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  ACargarMovil.Execute;
end;

procedure TFPrincipal.JvITRIClick(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  ADOTri.Execute;
end;

procedure TFPrincipal.JvISelectorClick(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  AGenFichaAnimal.Execute;
end;

procedure TFPrincipal.JvITratamientosClick(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  AREPResumenTratamiento.Execute;
end;

procedure TFPrincipal.JvIPersonalizadosClick(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  ARepListadosPersonalizados.Execute;
end;

procedure TFPrincipal.JvIResMovimientosClick(Sender: TObject);
begin
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  ADOResumenMovimientos.Execute;

end;

procedure TFPrincipal.JvIDTEClick(Sender: TObject);
begin
{ DAIANA - 19.12.2014 - Incidencia 413 - Inicio
  Documentacion transito electronico }
  inherited;
  JvIBurbujaAyudaInicial.Visible := false;
  AsistenteCMasivaPlanilla:= false;
  AsistenteMapa:= false;
  AsistenteCargaMasiva:=true;
  PAInicioMapa.Visible:= false;
  ADODocTransitoElectronico.Execute;    
{ DAIANA - 19.12.2014 - Incidencia 413 - Fin }
end;

procedure TFPrincipal.BtnUHFRFIDClick(Sender: TObject);
var
  F: TFVisorCaravanasUHRfid;
begin
  inherited;

  F := TFVisorCaravanasUHRfid.Create(self);
  F.setLector(FLectorElectronico as TLectorUHFrfid);
  F.ShowModal;
  F.Destroy;

end;

end.

