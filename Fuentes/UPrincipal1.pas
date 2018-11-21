unit UPrincipal1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, JvExExtCtrls, JvImage, jpeg, IBQuery, WinXP,
  DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList,
  StdCtrls, PngImage, ExtCtrls, ComCtrls, JvGIF,
  UABMSimple, UEveUniversal, UEveSimple,
  Buttons, UButtonABM, UModificacionParametros, ToolWin,
  ActnMan, ActnCtrls, ImgList, DateUtils, Types,
  StdStyleActnCtrls, ActnMenus, HtmlHlp, IniFiles,
  Rockey4ND, ToolPanels, dxNavBarCollns, dxNavBarStyles, dxNavBarBase, dxNavBar, dxDockControl,
  dxDockPanel, dxsbar, dxBar, cxLookAndFeels, AdvFontCombo, IBTable,
  MPlayer, AppEvnts, JvExControls, JvButton, JvTransparentButton,
  IBDatabaseInfo, IBExtract, IBEvents, IBSQLMonitor, UThreadBckBase, URepRankinsDeps,
  VaClasses, VaComm, dxBarExtItems, JvBaseDlg, JvDesktopAlert, IBServices,
  xmldom, XMLIntf, msxmldom, XMLDoc, JvNavigationPane, JvLabel, JvXPCore,
  JvXPButtons, dximctrl, Shlobj, ActiveX, ComObj, ULectorElectronico, ULectorAllFlexSerie,
  IBDatabase;

const
  MAX_ANIMALES = 4;
  MAX_EVENTOS = 5;
  MAX_REPORTES = 5;
  MAX_HERRAMIENTAS = 3;
  MAX_CONGIF = 4;

  OFFSET_TABS = 26;
  OFFSET_ICONO = 15;
  OFFSET_ICONO_SOLAPA = 25;
  OFFSET_TEXTO_SOLAPA = 90;

  INCATIVE_TABS_WIDTH = 936;
  ACTIVE_TAB_WIDTH = 208;


type
  TTipoAccion = (ttaEjecutar,ttaEntrar);
  TTipoMenu = (ttmAnimales,ttmEventos,ttmReportes,ttmConfig,ttmHerramientas);
  TPadreMenu = (tpmAnimalesExt,tpmEmbriones,tpmMovimientos,tpmSemen,tpmDEPs,tpmEveCria,tpmEveEstablecimiento,tpmEveGeneral,tpmEveGestacion,tpmEvePartoNac,tpmEveSanitarios,tpmEveServicios,
                tpmEveTransferencia,tpmRepGeneral,tpmRepGestacion,tpmRepPartoNac,tpmRepProduccion,tpmRepSanitarios,tpmRepServicios,tpmRepTransferencia,tpmRepOficiales,tpmConfCodigos,
                tpmConfEstablecimiento,tpmHerrCalendarios);


  TRegCasillaSimple = record
    Top : Integer;
    Left : Integer;
    Width : Integer;
    Height : Integer;
    Icono : TJvImage;
    Padre : ^TPanel;
    Accion : TAction;
    Leyenda : TLabel;
    Iniciales : String;
    LIniciales : TLabel;
  end;

  TArrSimple = Array of Array of TRegCasillaSimple;

  TRegCasillaGrilla = record
    Top : Integer;
    Left : Integer;
    Width : Integer;
    Height : Integer;
    Carpeta : ^TJvImage;
    Icono : ^TJvImage;
    Cant_Subnivel : Integer;
    GrillaHijos : TArrSimple;
    PanelHijo : TPanel;
    Tipo : TTipoMenu;
    ColumnasHijo : Integer;
    FilasHijo : Integer;
    PanelIconosHijos : TPanel;
    TipoPadre : TPadreMenu;
    Leyenda : TLabel;
    Volver : TJvImage;
    LVolver : TLabel;
  end;

  TPuntComplejo = ^TRegCasillaGrilla;
  TPuntSimple = ^TRegCasillaSimple;

  TRegTagsAcciones = record
    Tag : Integer;
    Fila : Integer;
    Columna : Integer;
    Accion : TTipoAccion;
    Tipo : TTipoMenu;
    GrillaComp : TPuntComplejo;
    GrillaSimple : TPuntSimple;
  end;

  TArrAcciones = Array of TRegTagsAcciones;

  TRegSolapa = record
    SolapaActiva : ^TImage;
    Icono : ^TJvImage;
    Leyenda : ^TLabel;
  end;

  TArrAnimales = Array [1..MAX_ANIMALES,1..MAX_ANIMALES] of TRegCasillaGrilla;
  TArrEventos = Array [1..MAX_EVENTOS,1..MAX_EVENTOS] of TRegCasillaGrilla;
  TArrReportes = Array [1..MAX_REPORTES,1..MAX_REPORTES] of TRegCasillaGrilla;
  TArrHerramientas = Array [1..MAX_HERRAMIENTAS,1..MAX_HERRAMIENTAS] of TRegCasillaGrilla;
  TArrConfig = Array [1..MAX_CONGIF,1..MAX_CONGIF] of TRegCasillaGrilla;

  TRegGrilla = record
    Panel : ^TPanel;
    Solapa : TRegSolapa;
  end;

  TGrillaAnimales = record
    Grilla : TRegGrilla;
    Iconos : TArrAnimales;
  end;

  TGrillaEventos = record
    Grilla : TRegGrilla;
    Iconos : TArrEventos;
  end;

  TGrillaReportes = record
    Grilla : TRegGrilla;
    Iconos : TArrReportes;
  end;

  TGrillaHerramientas = record
    Grilla : TRegGrilla;
    Iconos : TArrHerramientas;
  end;

  TGrillaConfig = record
    Grilla : TRegGrilla;
    Iconos : TArrConfig;
  end;

  TTipoVersion = (tvVeterinario, tvProductor);

  TThreadActualizador = class(TThread)
    public
      procedure Execute; override;
  end;

  TFPrincipal1 = class(TFUniversal)
    PBottom: TPanel;
    IFondoB: TImage;
    JvFavoritos: TJvImage;
    JvAyuda: TJvImage;
    JvSalir: TJvImage;
    PClient: TPanel;
    JvAnimales3N: TJvImage;
    JvIEventos3N: TJvImage;
    JvIReportes3N: TJvImage;
    JvIConfig3N: TJvImage;
    JvIHerramientas3N: TJvImage;
    JvFondo3N: TJvImage;
    JvVolver: TJvImage;
    PHerramientas: TPanel;
    Image12: TImage;
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
    PReportes: TPanel;
    Image7: TImage;
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
    PEventos: TPanel;
    Image11: TImage;
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
    Image9: TImage;
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
    Image8: TImage;
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
    PTabs: TPanel;
    Image6: TImage;
    ITabs: TImage;
    IAnimales: TImage;
    IEventos: TImage;
    IReportes: TImage;
    IHerramientas: TImage;
    IConfig: TImage;
    JvAnimales: TJvImage;
    JvEventos: TJvImage;
    JvResportes: TJvImage;
    JvHerramientas: TJvImage;
    JvConfig: TJvImage;
    LAnimales: TLabel;
    LEventos: TLabel;
    LReportes: TLabel;
    LHerramientas: TLabel;
    LConfiguracion: TLabel;
    PLeft: TPanel;
    Image1: TImage;
    PRight: TPanel;
    Image5: TImage;
    Ptop: TPanel;
    Image10: TImage;
    Image13: TImage;
    JvImage81: TJvImage;
    JvImage89: TJvImage;
    Edit1: TEdit;
    font: TActionList;
    AEveAborto: TAction;
    AEveAltaDirecta: TAction;
    AEveAltaMasiva: TAction;
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
    AEveInseminacionArtificial: TAction;
    AEveMedicionFrame: TAction;
    AEvePeso: TAction;
    AEveRaspadoToros: TAction;
    Action1: TAction;
    AEveRecursoForrajero: TAction;
    AEveReidentificacion: TAction;
    AEveSangradoBrucelosis: TAction;
    AEveServicioNatural: TAction;
    AEveServicioCorral: TAction;
    AEveSincronizacionCelo: TAction;
    AEveTratamiento: TAction;
    AEveTuberculinizacion: TAction;
    AAbmCategorias: TAction;
    AAbmCausasDistocia: TAction;
    AAbmCentrosInseminacion: TAction;
    AEveAltaSemen: TAction;
    AAbmCondicionesCorporales: TAction;
    AEveBajaSemen: TAction;
    AAbmCronologiasDentarias: TAction;
    AEveExtraccionSemen: TAction;
    AAbmEnfermedades: TAction;
    AAbmEstadosReproductivos: TAction;
    AAbmExamenesFertilidad: TAction;
    AAbmGdr: TAction;
    AAbmGradosAsistencia: TAction;
    AAbmMetodosCastracion: TAction;
    AAbmMetodosDiagnostico: TAction;
    AAbmMetodosExamenSanitario: TAction;
    AAbmMetodosSincronizacion: TAction;
    AAbmMetodosTomaPrueba: TAction;
    AAbmRazas: TAction;
    AAbmRechazosPreservicio: TAction;
    AAbmSexos: TAction;
    AGenSalir: TAction;
    AAbmTecnicasTratamiento: TAction;
    AAbmTiposAborto: TAction;
    AAbmTiposAlta: TAction;
    AAbmTiposBaja: TAction;
    AAbmTiposDestete: TAction;
    AAbmTiposEnfermedad: TAction;
    AAbmTiposParto: TAction;
    AAbmTiposTratamiento: TAction;
    AAbmValoresCapacidad: TAction;
    AAbmEstablecimientos: TAction;
    AAbmPotreros: TAction;
    AAbmRodeos: TAction;
    AAbmServicios: TAction;
    AGenSeleccionEstablecimiento: TAction;
    ARepEstadoServicio: TAction;
    AGenFichaAnimal: TAction;
    ARepAltaDirecta: TAction;
    ARepStockSimple: TAction;
    ARepDenunciaServicio: TAction;
    AAbmGrupos: TAction;
    AGenParametros: TAction;
    AGenAlarmas: TAction;
    ARepPorcentajePrenez: TAction;
    ARepNoTactadas: TAction;
    ARepListaTactadas: TAction;
    ARepDistribucionPrenez: TAction;
    ARepVsPrenez: TAction;
    AGenPlanillasManga: TAction;
    AAbmUsuarios: TAction;
    AGenAsistenteEstablecimiento: TAction;
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
    ADOCertificadoPredespacho: TAction;
    AREPExistenciaPorLote: TAction;
    AREPParteMensual: TAction;
    AREPInformePesadas: TAction;
    AREPDistGananciaDiariaPeso: TAction;
    AREPResumenParto: TAction;
    AABMPadresExternos: TAction;
    AABMModificarCUIG: TAction;
    AIntro: TAction;
    AABMPropietarioHuella: TAction;
    ACalendario: TAction;
    AABMRecursosForrajeros: TAction;
    AConfigGrupos: TAction;
    AABMDescTratamiento: TAction;
    AEvePartoMasivo: TAction;
    AEveNacimientos: TAction;
    AREPExistenciaRodeoPotrero: TAction;
    AREPResumenTratamiento: TAction;
    AREPInfoGralGest: TAction;
    AREPProduccionExternos: TAction;
    AEveEliminarAnimal: TAction;
    AABMLaboratorios: TAction;
    AREPMovimientosExistencia: TAction;
    ARepCostosVete: TAction;
    AABMTiposEmpleados: TAction;
    AEveCalidadCarne: TAction;
    ARepInfoMortandad: TAction;
    AREPProcreo: TAction;
    AREPRankinsDeps: TAction;
    AREPProduccionCarne: TAction;
    AEveActividad: TAction;
    AABMActividad: TAction;
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
    AABMDescMetodoSinc: TAction;
    ARepListadoAnimalesExternos: TAction;
    ARepInseminaciones: TAction;
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
    AREPInfoDonantes: TAction;
    ADOCertificadoRecupEmbriones: TAction;
    ADOSRADenunciaNacimientos: TAction;
    AEveEliminarEvento: TAction;
    AListadoEmbriones: TAction;
    AABMFuentesDEPs: TAction;
    AEveImportarPartosNacimientos: TAction;
    AABMSubCategorias: TAction;
    AABMCodigosManejo: TAction;
    ARepDenunciaBaja: TAction;
    ADOSRATipiSangADN: TAction;
    AAccesoDirecto: TAction;
    AImpERA: TAction;
    AMasUsados: TAction;
    AABMInspeccion: TAction;
    AABMDestCabania: TAction;
    AREPMultiEsta: TAction;
    LFavoritos: TLabel;
    LAyuda: TLabel;
    LSalir: TLabel;
    IFondo3N: TImage;
    ITope3N: TImage;
    IBSPFixAnimalesTranf: TIBStoredProc;
    IBSPFixCantPartos: TIBStoredProc;
    IBSPFixCategoriasVacaEvento: TIBStoredProc;
    IBSPFixCodSubactegorias: TIBStoredProc;
    IBSPTiposSuplementaciones: TIBStoredProc;
    IBSPFixCodigoManejo: TIBStoredProc;
    IBSPFixCoopropiedad: TIBStoredProc;
    IBSPDelGruposVacios: TIBStoredProc;
    IBSPFIXCasosDiagGest: TIBStoredProc;
    IBSPFixEstadoActualAnimales: TIBStoredProc;
    IBStoredProc1: TIBStoredProc;
    IBSPFixEstadoLactacionMachos: TIBStoredProc;
    IBSPFixEstadoLactaVacas: TIBStoredProc;
    IBSPFixEstadosRepro: TIBStoredProc;
    IBSPFixEstadoReproServicios: TIBStoredProc;
    IBSFixEveAltaDirectaBaja: TIBStoredProc;
    IBSPFixEvalPreservicio: TIBStoredProc;
    IBSPFixEveEventos: TIBStoredProc;
    IBSPFixEvePartoMasivo: TIBStoredProc;
    IBSPFixEventosHijos: TIBStoredProc;
    IBSPFixFechaNacExternos: TIBStoredProc;
    IBSPFixIDTIPOSEMPLEADO: TIBStoredProc;
    IBStoredProc2: TIBStoredProc;
    IBSPFixInseminaciones: TIBStoredProc;
    IBSPFixInseminacionesArt: TIBStoredProc;
    IBSPFixMinPeso: TIBStoredProc;
    IBSPFixParametrosAjustePeso: TIBStoredProc;
    IBSPFixParametrosEstablecimiento: TIBStoredProc;
    IBSPParamEstablecimientoFecha: TIBStoredProc;
    IBSPFixParametrosFrame: TIBStoredProc;
    IBSPFixPotrerosHectareas: TIBStoredProc;
    IBSPFIXRELANIMPADRESEXTCICLICO: TIBStoredProc;
    IBSPFixRelacionPadresAnimales: TIBStoredProc;
    IBStoredFIXROLUSUARIOACCION: TIBStoredProc;
    IBSPFixSubCategoria: TIBStoredProc;
    IBSPFixSubcatBrangBraf: TIBStoredProc;
    IBSPFixTabAnimalesGDR: TIBStoredProc;
    IBSPFixTipoAjustePeso: TIBStoredProc;
    IBSPFixUltimoEstadoRepro: TIBStoredProc;
    IBSPFixUltimoEventoAnimales: TIBStoredProc;
    IBSPFixUltimoPesoAnimales: TIBStoredProc;
    IBSPFixVisiblePotreroRodeo: TIBStoredProc;
    IBStoredProc3: TIBStoredProc;
    IBQAnimales: TIBQuery;
    IBQConsultaFix: TIBQuery;
    IBQEstablecimientos: TIBQuery;
    IBQFechas: TIBQuery;
    IBQIdioma: TIBQuery;
    IBQInsertFix: TIBQuery;
    IBQSetEjecuciones: TIBQuery;
    IBQUpdateUsuario: TIBQuery;
    IBQVerAlarma: TIBQuery;
    IBSPActivarTriggers: TIBStoredProc;
    IBStoredProc4: TIBStoredProc;
    IBSPCambiarCategoria: TIBStoredProc;
    IBSPDesactivarTriggers: TIBStoredProc;
    TCheck: TTimer;
    IBDPrincipal: TIBDatabase;
    IBStoredProc5: TIBStoredProc;
    procedure JvImageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvSalirClick(Sender: TObject);
    procedure CerrarVentana(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MouseEnter(Sender: TObject);
    procedure MouseLeave(Sender: TObject);
    procedure Click(Sender: TObject);
    procedure LabelEnter(Sender: TObject);
    procedure LabelLeave(Sender: TObject);
    procedure ImageEnter(Sender: TObject);
    procedure ImageLeave(Sender: TObject);
    procedure LTabLavelEnter(Sender: TObject);
    procedure LTabLavelLeave(Sender: TObject);
    procedure LTabLavelClick(Sender: TObject);
    procedure LTabImageEnter(Sender: TObject);
    procedure LTabImageLeave(Sender: TObject);
  private
    GAnimales : TGrillaAnimales;
    GEventos : TGrillaEventos;
    GReportes : TGrillaReportes;
    GHerramientas : TGrillaHerramientas;
    GConfig : TGrillaConfig;
    Acciones : TArrAcciones;
    MonitorBckBaseDatos : TThreadBckBase;
    DirAplicacion, DirFirebird : String;
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
    procedure AcomodarBottom;
    procedure HabilitarPestania(Pestania : Integer);
    procedure HabilitarPaneles(Panel : Integer);
    procedure InicGrillas;
    procedure AcomodarImagenes;
    procedure AcomodarIcono(Icono : TRegCasillaGrilla);
    procedure RecalcularDimensiones;
    procedure AcomodarTabs;
    procedure ArmarPanelesTercerNivel(var Reg : TRegCasillaGrilla);
    procedure RedimensionarSubPaneles(var Reg : TRegCasillaGrilla; Padre : TPanel);
    procedure HabilitarPanel(Panel : TPanel);
    procedure AsignarAccion(var Reg : TRegCasillaSimple; Accion : Integer; Tipo : TPadreMenu);
    procedure AgregarAccion(Tag, Fila, Columna : Integer; Accion : TTipoAccion; Tipo : TTipoMenu; GC: TPuntComplejo; GS: TPuntSimple);
    function BuscarAccion(Tag : Integer) : TRegTagsAcciones;
    procedure InicioHuella;
    procedure InicioHuellaShow;
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
    function VerificarEntrada() : Integer;
    function VerificarSalida() : Integer;    
    procedure CompactarRepararBase();
    function EjecutarBat(Directorio:String; NombreArchivo : String):Integer;
    function ExecuteProcess(ProcessName: String): Cardinal;
    procedure GuardarTextoArchivo(texto :String; nombreArchivo: String);
    function LeerRegistro() : Boolean;
    function AppHook(var Message: TMessage): Boolean;
    procedure BorrarArchivosTemporales();
    procedure DoEvent(AMsg: string);
    procedure SetMessagePuertoSerie(const Value: String);
    function GetWindowsVersion() : string;
    function VerificarActualizaciones(Automatico : Boolean) : Boolean;
    procedure HabilitarComponentesVersionBasica; override;

//**********************************************

    procedure HideButtonsBasico(hide:boolean);
    procedure HidePanels(hide:boolean);
    procedure HidePanelsSecondLevel(hide: Boolean);
    procedure HidePanelsThirdLevel(hide: Boolean);
    procedure UbicarPaneles();
    //procedure AgregarAccion(Nombre : String; Caption : String; Categoria : Integer);

//**********************************************

  published
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
    procedure AAbmEstadosReproductivosExecute(Sender: TObject);
    procedure AAbmCondicionesCorporalesExecute(Sender: TObject);
    procedure AAbmGdrExecute(Sender: TObject);
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
  private
    FIdioma : Integer;
    FEstablecimientoActual: Integer;
    FescalaCondicionCorporal : integer;
    ori: TdxNavBarItem;
    procedure SetEstablecimientoActual(const Value: Integer);
    procedure Colores();
    procedure ActualizarBD();
    procedure EjecutarFix(SP : TIBStoredProc);
    procedure CargarMenuEscritorio();
  private
    procedure BorrarTablasAuxiliares();
    function VerificarUAC_Activado() : Boolean;
    procedure ActualizarXML(Fecha : TDate);
    function IsConnected: Boolean;
    procedure CrearAccesoActualizador();
    procedure CargarMasUsados;
    function VerificarServidorBD : Boolean;
  protected  
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
  public
    TipoCalendario : Integer;
    TipoBase : Integer;
    procedure EjecutarPresentacion();
    procedure AbrirFormNormal(Univ: TFUniversal);
    procedure AbrirEventoConManga(Eve: TFEveSimple);
    function VerIntroduccion():Boolean;
    procedure VerificarAlarmasServicio();
    function conectarBD(): Boolean;
    procedure SetLogueo(usuario:Integer;valorLog:string);
    function getNombreEstablecimiento: string;
    procedure leerDatosPais();      
  published
    property StringEscalaCC: string read getStringEscalaCC;
    property EscalaCondicionCorporal: integer read FescalaCondicionCorporal write SetEscalaCondicionCorporal;
    property EstablecimientoActual: Integer read FEstablecimientoActual write SetEstablecimientoActual;
    property UsuarioActual: Integer read FUsuarioActual write SetUsuarioActual;
    property NombreServidor: String read FNombreServidor write FNombreServidor;
    property RolUsuarioActual: String read FRolUsuarioActual;
    property NombreEstablecimiento: string read getNombreEstablecimiento;
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
  end;

var
  FPrincipal: TFPrincipal;
  VGEstablecimiento : integer;

  //llave nuevo codigo
  mBuf:array[0..100] of Byte;
  mFun,mP1,mP2,mP3,mP4,rt:Word;
  lP1,lP2:LongWord;
  mHand:array[0..16] of Word;
  mHardID:array[0..16] of LongWord;
  rc:array[0..4] of Word;
  //llave nuevo codigo

  open : Boolean = false; //se usa para saber si el menu esta desplegado
  MenuOpen : Array [1..3] of Boolean = (false,false,false);
  Resolucion : Integer;

implementation

uses
  UDMSoftvet, ULogin, UAcerca, USeleccionEstablecimiento,
  UAbmCategorias, UABMCausasDistocia, UABMCentrosInseminacion, UAbmCondicionCorporal,
  UAbmCronologiaDentaria, UAbmEnfermedades, UAbmEstadoReproductivo, UABMExamenesFertilidad,
  UAbmGdr, UAbmGradosAsistencia, UAbmMetodosCastracion, UAbmMetodosDiagnostico,
  UAbmMetodosExamenSanitario, UABMMetodosSincronizacion, UABMMetodosTomaPrueba, UAbmRaza,
  UABMRechazosPreservicio, UABMSexos, UABMTecnicasTratamiento,
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
  MaskUtils, ShellAPI, WinInet, UIngresoMasivoAlta, UCartel, UUbicacionBD, UAbmDescTipoTratamiento,
  URepExistenciaRodeoPotrero, URepResumenTratamiento, UEveEliminarAnimal, UREPInfoGralGest, UREPProduccionExternos,
  Registry, _Busy, UABMLaboratorios, URepMovimientosExistencia, UAbmTiposEmpleados,
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
  UListadoEmbriones, UMenuEscritorio, UEveImportarPartosNacimientos, UImpSRA,
  UABMSubCategorias, UABMCodigosManejo, URepDenunciaBaja, UCoopropiedad, UDOSRATipiSangADN,
  UImpERA, UMasUsados, UABMInspeccion, UABMDestCabania, UProcessViewer, UTraduccion, UREPMultiEsta,
  UConfigIdioma;
{$R *.dfm}

procedure TFPrincipal1.AgregarAccionEjecucion(Tag, Fila, Columna : Integer; Accion : TTipoAccion; Tipo : TTipoMenu; GC: TPuntComplejo; GS: TPuntSimple);
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
end;

function TFprincipal1.BuscarAccion(Tag : Integer) : TRegTagsAcciones;
var
  Indice : Integer;
begin
  for Indice := 0 to Length(Acciones)-1 do
    if Acciones[Indice].Tag = Tag then
    begin
      Result := Acciones[Indice];
      break;
    end;
end;

procedure TFPrincipal1.CerrarVentana(Sender: TObject; var Action: TCloseAction);
begin
  Sender.Destroy;
  PClient.Visible := true;
end;

procedure TFPrincipal1.AcomodarTabs;
begin
  //Solapas
  GAnimales.Grilla.Solapa.SolapaActiva^.Left := (ITabs.Width div 2) - (INCATIVE_TABS_WIDTH div 2);
  GEventos.Grilla.Solapa.SolapaActiva^.Left := GAnimales.Grilla.Solapa.SolapaActiva^.Left - OFFSET_TABS + ACTIVE_TAB_WIDTH;
  GReportes.Grilla.Solapa.SolapaActiva^.Left := GEventos.Grilla.Solapa.SolapaActiva^.Left - OFFSET_TABS + ACTIVE_TAB_WIDTH;
  GHerramientas.Grilla.Solapa.SolapaActiva^.Left := GReportes.Grilla.Solapa.SolapaActiva^.Left - OFFSET_TABS + ACTIVE_TAB_WIDTH ;
  GConfig.Grilla.Solapa.SolapaActiva^.Left := GHerramientas.Grilla.Solapa.SolapaActiva^.Left - OFFSET_TABS + ACTIVE_TAB_WIDTH;
  //Iconos
  GAnimales.Grilla.Solapa.Icono^.Left := GAnimales.Grilla.Solapa.SolapaActiva^.Left + OFFSET_ICONO_SOLAPA;
  GEventos.Grilla.Solapa.Icono^.Left := GEventos.Grilla.Solapa.SolapaActiva^.Left + OFFSET_ICONO_SOLAPA;
  GReportes.Grilla.Solapa.Icono^.Left := GReportes.Grilla.Solapa.SolapaActiva^.Left + OFFSET_ICONO_SOLAPA;
  GHerramientas.Grilla.Solapa.Icono^.Left := GHerramientas.Grilla.Solapa.SolapaActiva^.Left + OFFSET_ICONO_SOLAPA;
  GConfig.Grilla.Solapa.Icono^.Left := GConfig.Grilla.Solapa.SolapaActiva^.Left + OFFSET_ICONO_SOLAPA;
  //Textos
  GAnimales.Grilla.Solapa.Leyenda^.Left := GAnimales.Grilla.Solapa.Icono^.Left + GAnimales.Grilla.Solapa.Icono^.Width;
  GEventos.Grilla.Solapa.Leyenda^.Left := GEventos.Grilla.Solapa.Icono^.Left + GEventos.Grilla.Solapa.Icono^.Width;
  GReportes.Grilla.Solapa.Leyenda^.Left := GReportes.Grilla.Solapa.Icono^.Left + GReportes.Grilla.Solapa.Icono^.Width;
  GHerramientas.Grilla.Solapa.Leyenda^.Left := GHerramientas.Grilla.Solapa.Icono^.Left + GHerramientas.Grilla.Solapa.Icono^.Width;
  GConfig.Grilla.Solapa.Leyenda^.Left := GConfig.Grilla.Solapa.Icono^.Left + GConfig.Grilla.Solapa.Icono^.Width;
end;

procedure TFPrincipal1.AcomodarBottom;
var
  WA : Integer;
begin
  WA := PBottom.Width div 4;
  JvFavoritos.Left := WA-(JvFavoritos.Width div 2);
  LFavoritos.Left := JvFavoritos.Left+JvFavoritos.Width;
  JvAyuda.Left := (WA*2)-(JvAyuda.Width div 2);
  LAyuda.Left := JvAyuda.Left+JvAyuda.Width;
  JvSalir.Left := (WA*3)-(JvSalir.Width div 2);
  LSalir.Left := JvSalir.Left+JvSalir.Width;
end;

procedure TFPrincipal1.RedimensionarSubPaneles(var Reg : TRegCasillaGrilla; Padre : TPanel);
var
  I,K : Integer;
  TA, LA, HA, WA : Integer;
begin
  if Assigned(Reg.PanelHijo) then
  begin
    HA := Reg.PanelIconosHijos.Height div Reg.ColumnasHijo;
    WA := Reg.PanelIconosHijos.Width div Reg.FilasHijo;
    TA := 0;
    for I := 1 to Reg.ColumnasHijo do
    begin
      LA := 0;
      for K := 1 to Reg.FilasHijo do
      begin
        Reg.GrillaHijos[I,K].Left := LA;
        Reg.GrillaHijos[I,K].Top := TA;
        Reg.GrillaHijos[I,K].Width := WA;
        Reg.GrillaHijos[I,K].Height := HA;
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
end;

procedure TFPrincipal1.RecalcularDimensiones;
var
  I,K : Integer;
  TA, LA, HA, WA : Integer;
begin
  //Reacomodar Animales
  with GAnimales do
  begin
    HA := Grilla.Panel^.Height div 2;
    WA := Grilla.Panel^.Width div MAX_ANIMALES;
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_ANIMALES do
      begin
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        RedimensionarSubPaneles(Iconos[I,K],PAnimales);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  //Reacomodar Eventos
  with GEventos do
  begin
    HA := Grilla.Panel^.Height div 2;
    WA := Grilla.Panel^.Width div MAX_EVENTOS;
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_EVENTOS do
      begin
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        RedimensionarSubPaneles(Iconos[I,K],PEventos);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  //Reacomodar Reportes
  with GReportes do
  begin
    HA := Grilla.Panel^.Height div 2;
    WA := Grilla.Panel^.Width div MAX_REPORTES;
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_REPORTES do
      begin
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        RedimensionarSubPaneles(Iconos[I,K],PReportes);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  //Reacomodar Herramientas
  with GHerramientas do
  begin
    HA := Grilla.Panel^.Height div 2;
    WA := Grilla.Panel^.Width div MAX_HERRAMIENTAS;
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_HERRAMIENTAS do
      begin
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        RedimensionarSubPaneles(Iconos[I,K],PHerramientas);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  //Reacomodar Configuracion
  with GConfig do
  begin
    HA := Grilla.Panel^.Height div 2;
    WA := Grilla.Panel^.Width div MAX_CONGIF;
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_CONGIF do
      begin
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        RedimensionarSubPaneles(Iconos[I,K],PConfig);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
end;

procedure TFPrincipal1.AcomodarIcono(Icono : TRegCasillaGrilla);
var
  Fil, Col : Integer;
begin
  if Icono.Carpeta <> nil then
  begin
    Icono.Carpeta^.Left := ((Icono.Width div 2) + Icono.Left) - (Icono.Carpeta^.Width div 2);
    Icono.Carpeta^.Top := ((Icono.Height div 2) + Icono.Top) - (Icono.Carpeta^.Height div 2);
    Icono.Icono^.Left := ((Icono.Width div 2) + Icono.Left) - (Icono.Icono^.Width div 2);
    Icono.Icono^.Top := ((Icono.Height div 2) + Icono.Top) - (Icono.Icono^.Height div 2) {+ OFFSET_ICONO};
    if Assigned(Icono.Volver) and Assigned(Icono.PanelHijo) then
    begin
      Icono.Volver.Left := Icono.PanelHijo.Width-Icono.Volver.Width;
      Icono.LVolver.Left := Icono.Volver.Left-Icono.LVolver.Width;
    end;
    if Assigned(Icono.Leyenda) then
    begin
      Icono.Leyenda.Left := Icono.Carpeta^.Left;
      Icono.Leyenda.Top := Icono.Carpeta^.Top+Icono.Carpeta^.Height;
    end;
    if Assigned(Icono.PanelHijo) then
    begin
      for Col := 1 to Icono.ColumnasHijo do
        for Fil := 1 to Icono.FilasHijo do
        begin
          if Assigned(Icono.GrillaHijos[Col,Fil].Icono) then
          begin
            Icono.GrillaHijos[Col,Fil].Icono.Left := ((Icono.GrillaHijos[Col,Fil].Width div 2) + Icono.GrillaHijos[Col,Fil].Left) - (Icono.GrillaHijos[Col,Fil].Icono.Width div 2);
            Icono.GrillaHijos[Col,Fil].Icono.Top := ((Icono.GrillaHijos[Col,Fil].Height div 2) + Icono.GrillaHijos[Col,Fil].Top) - (Icono.GrillaHijos[Col,Fil].Icono.Height div 2)-5;
            Icono.GrillaHijos[Col,Fil].Leyenda.Left := Icono.GrillaHijos[Col,Fil].Icono.Left;
            Icono.GrillaHijos[Col,Fil].Leyenda.Top := Icono.GrillaHijos[Col,Fil].Icono.Top+Icono.GrillaHijos[Col,Fil].Icono.Height-10;
            Icono.GrillaHijos[Col,Fil].LIniciales.Left := Icono.GrillaHijos[Col,Fil].Icono.Left+15;
            Icono.GrillaHijos[Col,Fil].LIniciales.Top := Icono.GrillaHijos[Col,Fil].Icono.Top+(Icono.GrillaHijos[Col,Fil].Icono.Height div 2)-6;
          end;
        end;
    end;
  end;
end;

procedure TFPrincipal1.AcomodarImagenes;
var
  I, K : Integer;
begin
  for I := 1 to 2 do
    for K := 1 to MAX_ANIMALES do
      AcomodarIcono(GAnimales.Iconos[I,K]);

  for I := 1 to 2 do
    for K := 1 to MAX_EVENTOS do
      AcomodarIcono(GEventos.Iconos[I,K]);

  for I := 1 to 2 do
    for K := 1 to MAX_REPORTES do
      AcomodarIcono(GReportes.Iconos[I,K]);

  for I := 1 to 2 do
    for K := 1 to MAX_HERRAMIENTAS do
      AcomodarIcono(GHerramientas.Iconos[I,K]);

  for I := 1 to 2 do
    for K := 1 to MAX_CONGIF do
      AcomodarIcono(GConfig.Iconos[I,K]);
end;

procedure TFPrincipal1.ArmarPanelesTercerNivel(var Reg : TRegCasillaGrilla);
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
  Tag3N : Integer;
begin
  if Assigned(Reg.Icono) then
  begin
    Tag3N := (Reg.Carpeta^.Tag * 100)+1;
    Cantidad := 0;
    Panel := TPanel.Create(self);
    Panel.Parent := PClient;
    Panel.Caption := '';
    Panel.Align := alClient;
    Panel.Visible := false;
    Panel.BevelOuter := bvNone;
    Panel.BevelInner := bvNone;
    P1 := TPanel.Create(self);
    P1.Parent := Panel;
    P1.Align := alTop;
    P1.Caption := '';
    P1.Height := Reg.Icono^.Height+5;
    P1.BevelOuter := bvNone;
    P1.BevelInner := bvNone;
    F := TJvImage.Create(self);
    F.Parent := P1;
    F.Align := alClient;
    F.Picture := ITope3N.Picture;
    F.Stretch := true;
    Volver := TJvImage.Create(self);
    Volver.Parent := P1;
    Volver.Picture := JvVolver.Picture;
    Volver.AutoSize := true;
    Volver.Left := P1.Width-JvVolver.Width-10;
    Volver.Top := 15;
    Volver.Tag := Reg.Carpeta^.Tag;
    Reg.Volver := Volver;
    Reg.PanelHijo := Panel;
    ImgAnterior := TJvImage.Create(self);
    ImgAnterior.Parent := P1;
    ImgAnterior.Picture := Reg.Icono^.Picture;
    ImgAnterior.Left := 5;
    ImgAnterior.Top := 5;
    ImgAnterior.AutoSize := true;
    ImgAnterior.Tag := Reg.Carpeta^.Tag;
    Posicion := Tlabel.Create(self);
    Posicion.Parent := P1;
    Posicion.Tag := Reg.Carpeta^.Tag;
    Posicion.Caption := Reg.Leyenda.Caption;
    Posicion.AutoSize := true;
    Posicion.Left := ImgAnterior.Left+ImgAnterior.Width;
    Posicion.Top := ImgAnterior.Top+(ImgAnterior.Height div 2)-15;
    Posicion.Font.Size := 12;
    Posicion.Font.Name := 'Arial';
    Posicion.Font.Style := [fsBold];
    P2 := TPanel.Create(self);
    P2.Parent := Panel;
    P2.Caption := '';
    P2.Align := alClient;
    P2.BevelInner := bvNone;
    P2.BevelOuter := bvNone;
    P2.Tag := Reg.Carpeta^.Tag;
    Fondo := TJvImage.Create(self);
    Fondo.Parent := P2;
    Fondo.Align := alClient;
    Fondo.AutoSize := true;
    Fondo.Picture := IFondo3N.Picture;
    Fondo.Stretch := true;
    Reg.PanelIconosHijos := P2;
    Vuelta := TLabel.Create(self);
    Vuelta.Parent := P1;
    case Reg.Tipo of
      ttmAnimales : Vuelta.Caption := 'Volver a Animales';
      ttmConfig : Vuelta.Caption := 'Volver a Configuración';
      ttmEventos : Vuelta.Caption := 'Volver a Eventos';
      ttmHerramientas : Vuelta.Caption := 'Volver a Herramientas';
      ttmReportes : Vuelta.Caption := 'Volver a Reportes';
    end;
    {Vuelta.OnMouseEnter := MouseEnter;
    Vuelta.OnMouseLeave := MouseLeave;}
    Vuelta.OnClick := Click;
    Vuelta.Alignment := taCenter;
    Vuelta.AutoSize := false;
    Vuelta.Transparent := true;
    Vuelta.WordWrap := true;
    Vuelta.Font.Size := 10;
    Vuelta.Font.Name := 'Arial';
    Vuelta.Height := 34;
    Vuelta.Width := 78;
    Vuelta.Top := Volver.Top;
    Vuelta.Left := Volver.Left-Vuelta.Width;
    Reg.LVolver := Vuelta;

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
      WA := P2.ClientWidth div MAX_FILA;
    if MAX_COL > 0 then
      HA := P2.ClientHeight div MAX_COL;
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
        Imagen.Parent := P2;
        Imagen.Left := LA;
        Imagen.Top := TA;
        Imagen.Center := true;
        Imagen.Tag := Tag3N;
        Imagen.Cursor := crHandPoint;
        Imagen.OnMouseEnter := MouseEnter;
        Imagen.OnMouseLeave := MouseLeave;
        Imagen.OnClick := Click;
        Leyenda := TLabel.Create(self);
        Leyenda.Parent := P2;
        Leyenda.Transparent := true;
        Leyenda.AutoSize := false;
        Leyenda.WordWrap := true;
        Leyenda.Alignment := taCenter;
        Leyenda.Font.Name := 'Arial';
        Leyenda.Font.Size := 10;
        Leyenda.Top := TA+Imagen.Height;
        Leyenda.Left := LA+Imagen.Width-25;
        Leyenda.Width := Imagen.Width+20;
        Leyenda.Height := 50;
        Leyenda.OnMouseEnter := MouseEnter;
        Leyenda.OnMouseLeave := MouseLeave;
        Leyenda.OnClick := Click;
        Leyenda.Cursor := crHandPoint;
        Leyenda.Tag := Tag3N;
        Iniciales := TLabel.Create(self);
        Iniciales.Parent := P2;
        Iniciales.Transparent := true;
        Iniciales.AutoSize := false;
        Iniciales.WordWrap := true;
        Iniciales.Alignment := taRightJustify;
        Iniciales.Font.Name := 'HelveticaNeue-BoldCond';
        Iniciales.Font.Size := 16;
        Iniciales.Font.Color := clWhite;
        Iniciales.Font.Style := [fsBold];
        Iniciales.Width := 52;
        Iniciales.Height := 25;
        Iniciales.Top := TA+(Imagen.Height div 2);
        Iniciales.Left := LA;
        Iniciales.OnMouseEnter := MouseEnter;
        Iniciales.OnMouseLeave := MouseLeave;
        Iniciales.OnClick := Click;
        Iniciales.Cursor := crHandPoint;
        Iniciales.Tag := Tag3N;
        case Reg.Tipo of
          ttmAnimales : begin
                          Imagen.Picture := JvAnimales3N.Picture;
                          Imagen.Pictures.PicEnter := JvAnimales3N.Pictures.PicEnter;
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PAnimales;
                        end;
          ttmEventos : begin
                          Imagen.Picture := JvIEventos3N.Picture;
                          Imagen.Pictures.PicEnter := JvIEventos3N.Pictures.PicEnter;
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PEventos;
                        end;
          ttmReportes : begin
                          Imagen.Picture := JvIReportes3N.Picture;
                          Imagen.Pictures.PicEnter := JvIReportes3N.Pictures.PicEnter;
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PReportes;
                        end;
          ttmHerramientas : begin
                          Imagen.Picture := JvIHerramientas3N.Picture;
                          Imagen.Pictures.PicEnter := JvIHerramientas3N.Pictures.PicEnter;
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PHerramientas;
                        end;
          ttmConfig : begin
                          Imagen.Picture := JvIConfig3N.Picture;
                          Imagen.Pictures.PicEnter := JvIConfig3N.Pictures.PicEnter;
                          Reg.GrillaHijos[Col,Fila].Icono := Imagen;
                          Reg.GrillaHijos[Col,Fila].Padre := @PConfig;
                        end;
        end;
        AsignarAccion(Reg.GrillaHijos[Col,Fila],Cantidad,Reg.TipoPadre);
        if Assigned(Reg.GrillaHijos[Col,Fila].Accion) then
        begin
          Leyenda.Caption := Reg.GrillaHijos[Col,Fila].Accion.Caption;
          Iniciales.Caption := Reg.GrillaHijos[Col,Fila].Iniciales;
        end;
        AgregarAccionEjecucion(Tag3N,Fila,Col,ttaEjecutar,Reg.Tipo,nil,@Reg.GrillaHijos[Col,Fila]);
        Reg.GrillaHijos[Col,Fila].Leyenda := Leyenda;
        Reg.GrillaHijos[Col,Fila].LIniciales := Iniciales;
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

procedure TFPrincipal1.AsignarAccion(var Reg : TRegCasillaSimple; Accion : Integer; Tipo : TPadreMenu);
begin
  case Tipo of
    tpmEmbriones : begin
                case Accion of
                  1 : begin
                        Reg.Accion := AEveCompraEmbriones;
                        Reg.Iniciales := 'CE';
                      end;
                  2 : begin
                        Reg.Accion := AEveFlushing;
                        Reg.Iniciales := 'CO';
                      end;
                  3 : begin
                        Reg.Accion := AEveBajaEmbriones;
                        Reg.Iniciales := 'BE';
                      end;
                  4 : begin
                        Reg.Accion := AListadoEmbriones;
                        Reg.Iniciales := 'LE';
                      end;
                  5 : begin
                        Reg.Accion := AABMCentrosTransplantes;
                        Reg.Iniciales := 'CTE';
                      end;
                end;
              end;
    tpmMovimientos : begin
                          case Accion of 
                               1 : begin
                                    Reg.Accion := AEveAltaDirecta;
                                    Reg.Iniciales := 'AD';
                                   end;
                               2 : begin
                                    Reg.Accion := AEveAltaMasiva;
                                    Reg.Iniciales := 'AM';
                                   end;
                               3 : begin
                                    Reg.Accion := AEveCambioUbicacion;
                                    Reg.Iniciales := 'CU';
                                   end;
                               4 : begin
                                    Reg.Accion := AEveBaja;
                                    Reg.Iniciales := 'BA';
                                   end;
                          end;
                     end;
    tpmSemen : begin
                    case Accion of
                         1 : begin
                              Reg.Accion := AEveAltaSemen;
                              Reg.Iniciales := 'AS';
                             end;
                         2 : begin
                              Reg.Accion := AEveExtraccionSemen;
                              Reg.Iniciales := 'ES';
                             end;
                         3 : begin
                              Reg.Accion := AEveBajaSemen;
                              Reg.Iniciales := 'BS';
                             end;
                         4 : begin
                              Reg.Accion := AAbmCentrosInseminacion;
                              Reg.Iniciales := 'CI';
                             end;
                    end;
               end;
    tpmDEPs : begin
                   case Accion of
                        1 : begin
                              Reg.Accion := AImpERA;
                              Reg.Iniciales := 'ERA';
                            end;
                        2 : begin
                              Reg.Accion := AImpDeps;
                              Reg.Iniciales := 'ID';
                            end;
                        3 : begin
                              Reg.Accion := AExpDeps;
                              Reg.Iniciales := 'ED';
                            end;
                   end;
              end;
    tpmEveCria : begin
                   case Accion of
                        1 : begin
                              Reg.Accion := AEveDestete;
                              Reg.Iniciales := 'DE';
                            end;
                        2 : begin
                              Reg.Accion := AEveCastracion;
                              Reg.Iniciales := 'CA';
                            end;
                        3 : begin
                              Reg.Accion := AEveMedicionFrame;
                              Reg.Iniciales := 'MF';
                            end;
                   end;
              end;
    tpmEveEstablecimiento : begin
                                 case Accion of
                                      1 : begin
                                            Reg.Accion := AEveRecursoForrajero;
                                            Reg.Iniciales := 'POT';
                                          end;
                                 end;
                            end;
    tpmEveGeneral : begin
                         case Accion of
                              1 : begin
                                    Reg.Accion := AEveActividad;
                                    Reg.Iniciales := 'ACT';
                                  end;
                              2 : begin
                                    Reg.Accion := AEveIdentificacion;
                                    Reg.Iniciales := 'ID';
                                  end;
                              3 : begin
                                    Reg.Accion := AEvePeso;
                                    Reg.Iniciales := 'PE';
                                  end;
                              4 : begin
                                    Reg.Accion := AEveReidentificacion;
                                    Reg.Iniciales := 'RID';
                                  end;
                              5 : begin
                                    Reg.Accion := AEveFertilidadMacho;
                                    Reg.Iniciales := 'ECM';
                                  end;
                              6 : begin
                                    Reg.Accion := AEveCalidadSeminal;
                                    Reg.Iniciales := 'ECS';
                                  end;
                              7 : begin
                                    Reg.Accion := AEveCircunferenciaEscrotal;
                                    Reg.Iniciales := 'MCE';
                                  end;
                              8 : begin
                                    Reg.Accion := AEveCondicionCorporal;
                                    Reg.Iniciales := 'DCC';
                                  end;
                              9 : begin
                                    Reg.Accion := AEveSincronizacionCelo;
                                    Reg.Iniciales := 'SC';
                                  end;
                              10 : begin
                                    Reg.Accion := AEveCalidadCarne;
                                    Reg.Iniciales := 'CC';
                                   end;
                              11 : begin
                                    Reg.Accion := AEveSuplementacion;
                                    Reg.Iniciales := 'SU';
                                   end;
                         end;
                    end;
    tpmEveGestacion : begin
                           case Accion of
                                1 : begin
                                      Reg.Accion := AEveDiagnosticoGestacion;
                                      Reg.Iniciales := 'DG';
                                    end;
                           end;
                      end;
    tpmEvePartoNac : begin
                          case Accion of
                               1 : begin
                                    Reg.Accion := AEveImportarPartosNacimientos;
                                    Reg.Iniciales := 'IPN';
                                   end;
                               2 : begin
                                    Reg.Accion := AEveNacimientos;
                                    Reg.Iniciales := 'NA';
                                   end;
                               3 : begin
                                    Reg.Accion := AEvePartoMasivo;
                                    Reg.Iniciales := 'PM';
                                   end;
                          end;
                     end;
    tpmEveSanitarios : begin
                           case Accion of
                                1 : begin
                                      Reg.Accion := AEveTratamiento;
                                      Reg.Iniciales := 'AT';
                                    end;
                                2 : begin
                                      Reg.Accion := AEveDiagnosticoEnfermedad;
                                      Reg.Iniciales := 'DE';
                                    end;
                                3 : begin
                                      Reg.Accion := AEveRaspadoToros;
                                      Reg.Iniciales := 'MTV';
                                    end;
                                4 : begin
                                      Reg.Accion := AEveSangradoBrucelosis;
                                      Reg.Iniciales := 'SB';
                                    end;
                                5 : begin
                                      Reg.Accion := AEveTuberculinizacion;
                                      Reg.Iniciales := 'TB';
                                    end;
                                6 : begin
                                      Reg.Accion := AEveCargaBrucelosis;
                                      Reg.Iniciales := 'CRB';
                                    end;
                                7 : begin
                                      Reg.Accion := AEveCargaTuberculina;
                                      Reg.Iniciales := 'CRT';
                                    end;
                                8 : begin
                                      Reg.Accion := AEveCargaVenereas;
                                      Reg.Iniciales := 'CRV';
                                    end;
                           end;
                      end;
    tpmEveServicios : begin
                           case Accion of 
                                1 : begin
                                      Reg.Accion := nil; //ServicioNatural;
                                      Reg.Iniciales := '';
                                    end;
                                2 : begin
                                      Reg.Accion := AEveInseminacionArtificial;
                                      Reg.Iniciales := 'IA';
                                    end;
                                3 : begin
                                      Reg.Accion := AEveServicioCorral;
                                      Reg.Iniciales := 'SC';
                                    end;
                                4 : begin
                                      Reg.Accion := AEveDeteccionCelo;
                                      Reg.Iniciales := 'DC';
                                    end;
                                5 : begin
                                      Reg.Accion := AEveCapacidadServicio;
                                      Reg.Iniciales := 'DCS';
                                    end;
                                6 : begin
                                      Reg.Accion := AEveEvaluacionPreservicio;
                                      Reg.Iniciales := 'EP';
                                    end;
                                7 : begin
                                      Reg.Accion := AAbmServicios;
                                      Reg.Iniciales := 'ES';
                                    end;
                           end;
                      end;
    tpmEveTransferencia : begin
                               case Accion of
                                    1 : begin
                                          Reg.Accion := AEveFlushing;
                                          Reg.Iniciales := 'CO';
                                        end;
                                    2 : begin
                                          Reg.Accion := AEveTransferenciaEmbrionaria;
                                          Reg.Iniciales := 'TE';
                                        end;
                               end;
                          end;
    tpmRepGeneral : begin
                      case Accion of
                        1 : begin
                              Reg.Accion := ARepAltaDirecta;
                              Reg.Iniciales := 'AD';
                            end;
                        2 : begin
                              Reg.Accion := AREPCostoSuplementacion;
                              Reg.Iniciales := 'CS';
                            end;
                        3 : begin
                              Reg.Accion := AREPDistGananciaDiariaPeso;
                              Reg.Iniciales := 'DGP';
                            end;
                        4 : begin
                              Reg.Accion := AREPExistenciaPorLote;
                              Reg.Iniciales := 'EP';
                            end;
                        5 : begin
                              Reg.Accion := AREPExistenciaRodeoPotrero;
                              Reg.Iniciales := 'ERP';
                            end;
                        6 : begin
                              Reg.Accion := ARepGananciaDiariaPeso;
                              Reg.Iniciales := 'GDP';
                            end;
                        7 : begin
                              Reg.Accion := ARepInfoMortandad;
                              Reg.Iniciales := 'IM';
                            end;
                        8 : begin
                              Reg.Accion := AREPInformePesadas;
                              Reg.Iniciales := 'IP';
                            end;
                        9 : begin
                              Reg.Accion := AREPProcreo;
                              Reg.Iniciales := 'PR';
                            end;
                        10 : begin
                                Reg.Accion := AREPProduccionCarne;
                                Reg.Iniciales := 'IPC';
                             end;
                        11 : begin
                                Reg.Accion := AREPRankinsDeps;
                                Reg.Iniciales := 'IRD';
                             end;
                        12 : begin
                                Reg.Accion := AREPParteMensual;
                                Reg.Iniciales := 'PM';
                             end;
                        13 : begin
                                Reg.Accion := ARepStockSimple;
                                Reg.Iniciales := 'SSL';
                             end;
                        14 : begin
                                Reg.Accion := ARepStockSemen;
                                Reg.Iniciales := 'SSM';
                             end;
                      end;
                    end;
    tpmRepGestacion : begin
                        case Accion of
                          1 : begin
                                Reg.Accion := ARepNoTactadas;
                                Reg.Iniciales := 'ADG';
                              end;
                          2 : begin
                                Reg.Accion := ARepVsPrenez;
                                Reg.Iniciales := 'CP';
                              end;
                          3 : begin
                                Reg.Accion := ARepDistribucionPrenez;
                                Reg.Iniciales := 'DP';
                              end;
                          4 : begin
                                Reg.Accion := ARepSospechosasAborto;
                                Reg.Iniciales := 'HSA';
                              end;
                          5 : begin
                                Reg.Accion := AREPInfoGralGest;
                                Reg.Iniciales := 'IGG';
                              end;
                          6 : begin
                                Reg.Accion := ARepListaTactadas;
                                Reg.Iniciales := 'LT';
                              end;
                          7 : begin
                                Reg.Accion := ARepPorcentajePrenez;
                                Reg.Iniciales := 'PPZ';
                              end;
                          8 : begin
                                Reg.Accion := ARepProyeccionPartos;
                                Reg.Iniciales := 'PPS';
                              end;
                        end;
                      end;
    tpmRepPartoNac : begin
                        case Accion of
                          1 : begin
                                Reg.Accion := ADOSRADenunciaNacimientos;
                                Reg.Iniciales := 'DN';
                              end;
                          2 : begin
                                Reg.Accion := AREPResumenParto;
                                Reg.Iniciales := 'IGP';
                              end;
                        end;
                      end;
    tpmRepProduccion : begin
                          case Accion of
                            1 : begin
                                  Reg.Accion := AREPProduccionExternos;
                                  Reg.Iniciales := 'PAE';
                                end;
                            2 : begin
                                  Reg.Accion := AREPMultiEsta;
                                  Reg.Iniciales := 'IME';
                                end;
                          end;
                        end;
    tpmRepSanitarios : begin
                          case Accion of
                            1 : begin
                                  Reg.Accion := ARepCostosVete;
                                  Reg.Iniciales := 'CS';
                                end;
                            2 : begin
                                  Reg.Accion := ARepEvaluacionToros;
                                  Reg.Iniciales := 'ET';
                                end;
                            3 : begin
                                  Reg.Accion := AREPResumenTratamiento;
                                  Reg.Iniciales := 'RT';
                                end;
                          end;
                        end;
    tpmRepServicios : begin
                        case Accion of
                          1 : begin
                                Reg.Accion := ARepDenunciaServicio;
                                Reg.Iniciales := 'DS';
                              end;
                          2 : begin
                                Reg.Accion := ARepEstadoServicio;
                                Reg.Iniciales := 'ES';
                              end;
                          3 : begin
                                Reg.Accion := ARepAptasNoAptas;
                                Reg.Iniciales := 'HAS';
                              end;
                          4 : begin
                                Reg.Accion := ARepInseminaciones;
                                Reg.Iniciales := 'IIA';
                              end;
                        end;
                      end;
    tpmRepTransferencia : begin
                            case Accion of
                              1 : begin
                                    Reg.Accion := ADOCertificadoRecupEmbriones;
                                    Reg.Iniciales := 'CRE';
                                  end;
                              2 : begin
                                    Reg.Accion := ARepEmbrionesTransferidos;
                                    Reg.Iniciales := 'ET';
                                  end;
                              3 : begin
                                    Reg.Accion := AREPInfoDonantes;
                                    Reg.Iniciales := 'ID';
                                  end;
                              4 : begin
                                    Reg.Accion := ARepListadoImplantes;
                                    Reg.Iniciales := 'LI';
                                  end;
                              5 : begin
                                    Reg.Accion := ARepListadoReceptoras;
                                    Reg.Iniciales := 'LR';
                                  end;
                              6 : begin
                                    Reg.Accion := ARepStockEmbriones;
                                    Reg.Iniciales := 'SE';
                                  end;
                            end;
                          end;
    tpmRepOficiales : begin
                        case Accion of
                          1 : begin
                                Reg.Accion := ADOCertificadoPredespacho;
                                Reg.Iniciales := 'CP';
                              end;
                          2 : begin
                                Reg.Accion := ADOSRATipiSangADN;
                                Reg.Iniciales := 'CTS';
                              end;
                          3 : begin
                                Reg.Accion := ARepDenunciaBaja;
                                Reg.Iniciales := 'DB';
                              end;
                          4 : begin
                                Reg.Accion := ADOTri;
                                Reg.Iniciales := 'TRI';
                              end;
                        end;
                      end;
    tpmHerrCalendarios : begin
                            case Accion of
                              1 : begin
                                    Reg.Accion := ACalendario;
                                    Reg.Iniciales := 'CG';
                                  end;
                              2 : begin
                                    Reg.Accion := ACalendario;
                                    Reg.Iniciales := 'CS';
                                  end;
                              3 : begin
                                    Reg.Accion := ACalendario;
                                    Reg.Iniciales := 'CR';
                                  end;
                            end;
                         end;
    tpmConfEstablecimiento : begin
                                case Accion of
                                 1 : begin
                                      Reg.Accion := AGenAsistenteEstablecimiento;
                                      Reg.Iniciales := 'AC';
                                     end;
                                 2 : begin
                                      Reg.Accion := AAbmEstablecimientos;
                                      Reg.Iniciales := 'MO';
                                     end;
                                 3 : begin
                                      Reg.Accion := AABMModificarCUIG;
                                      Reg.Iniciales := 'CG';
                                     end;
                                 4 : begin
                                      Reg.Accion := AAbmEmpleados;
                                      Reg.Iniciales := 'EM';
                                     end;
                                 5 : begin
                                      Reg.Accion := AAbmPotreros;
                                      Reg.Iniciales := 'PO';
                                     end;
                                 6 : begin
                                      Reg.Accion := AAbmRodeos;
                                      reg.Iniciales := 'RO';
                                     end;
                                 7 : begin
                                      Reg.Accion := AGenParametros;
                                      Reg.Iniciales := 'PE';
                                     end;
                                end;
                             end;
  end;
end;

procedure TFPrincipal1.HabilitarPanel(Panel : TPanel);
begin
  if Assigned(Panel) then
  begin
    Panel.Visible := true;
    Panel.BringToFront;
  end;
end;

procedure TFPrincipal1.InicGrillas;
var
  I, K : Integer;
  WA, HA : Integer;
  LA, TA : Integer;
  function CrearLeyenda(Caption : String; Padre : TWinControl; Limites : TRect) : TLabel;
  begin
    Result := TLabel.Create(self);
    Result.Parent := Padre;
    Result.Alignment := taCenter;
    Result.AutoSize := false;
    Result.Transparent := true;
    Result.WordWrap := true;
    Result.Caption := Caption;
    Result.Font.Size := 11;
    Result.Font.Name := 'Arial';
    Result.Width := Limites.Right-Limites.Left;
    Result.Height := 34;//Limites.Bottom-Limites.Top;
    Result.Left := Limites.Left;
    Result.Top := Limites.Top+(Limites.Bottom-Limites.Top);
    Result.OnMouseEnter := MouseEnter;
    Result.OnMouseLeave := MouseLeave;
    Result.OnClick := Click;
    Result.Cursor := crHandPoint;
  end;

begin
  /// Iniciar Grilla de Animales;
  WA := PAnimales.Width div MAX_ANIMALES;
  HA := PAnimales.Height div 2;

  with GAnimales do
  begin
    Grilla.Panel := @PAnimales;
    Grilla.Solapa.Icono := @JvAnimales;
    Grilla.Solapa.SolapaActiva := @IAnimales;
    Grilla.Solapa.Leyenda := @LAnimales;
    // Iconos del Panel

    Iconos[1,1].Carpeta := @JvFolSelector;
    Iconos[1,1].Icono := @JvSelector;
    Iconos[1,1].Cant_Subnivel := 0;
    Iconos[1,1].Leyenda := CrearLeyenda('Selector de Animales',PAnimales,JvFolSelector.BoundsRect);
    Iconos[1,1].Leyenda.Tag := 11;
    JvFolSelector.Tag := 11;
    JvFolSelector.OnClick := Click;
    AgregarAccionEjecucion(11,1,1,ttaEjecutar,ttmAnimales,@Iconos[1,1],nil);

    Iconos[1,2].Carpeta := @JvFolMovimiento;
    Iconos[1,2].Icono := @JvMovimiento;
    Iconos[1,2].Cant_Subnivel := 4;
    Iconos[1,2].TipoPadre := tpmMovimientos;
    Iconos[1,2].Leyenda := CrearLeyenda('Movimientos',PAnimales,JvFolMovimiento.BoundsRect);
    Iconos[1,2].Leyenda.Tag := 12;
    JvFolMovimiento.OnClick := Click;
    JvFolMovimiento.Tag := 12;
    AgregarAccionEjecucion(12,1,2,ttaEntrar,ttmAnimales,@Iconos[1,2],nil);

    Iconos[1,3].Carpeta := @JvFolGrupos;
    Iconos[1,3].Icono := @JvGrupos;
    Iconos[1,3].Cant_Subnivel := 0;
    Iconos[1,3].Leyenda := CrearLeyenda('Grupos',PAnimales,JvFolGrupos.BoundsRect);
    Iconos[1,3].Leyenda.Tag := 13;
    JvFolGrupos.Tag := 13;
    JvFolGrupos.OnClick := Click;
    AgregarAccionEjecucion(13,1,3,ttaEjecutar,ttmAnimales,@Iconos[1,3],nil);

    Iconos[1,4].Carpeta := @JvFolSemen;
    Iconos[1,4].Icono := @JvSemen;
    Iconos[1,4].Cant_Subnivel := 4;
    Iconos[1,4].TipoPadre := tpmSemen;
    Iconos[1,4].Leyenda := CrearLeyenda('Semen',PAnimales,JvFolSemen.BoundsRect);
    Iconos[1,4].Leyenda.Tag := 14;
    JvFolSemen.OnClick := Click;
    JvFolSemen.Tag := 14;
    AgregarAccionEjecucion(14,1,4,ttaEntrar,ttmAnimales,@Iconos[1,4],nil);

    Iconos[2,1].Carpeta := @JvFolEmbriones;
    Iconos[2,1].Icono := @JvEmbriones;
    Iconos[2,1].Cant_Subnivel := 5;
    Iconos[2,1].TipoPadre := tpmEmbriones;
    Iconos[2,1].Leyenda := CrearLeyenda('Embriones',PAnimales,JvFolEmbriones.BoundsRect);
    Iconos[2,1].Leyenda.Tag := 15;
    JvFolEmbriones.OnClick := Click;
    JvFolEmbriones.Tag := 15;
    AgregarAccionEjecucion(15,2,1,ttaEntrar,ttmAnimales,@Iconos[2,1],nil);

    Iconos[2,2].Carpeta := @JvFolDEPS;
    Iconos[2,2].Icono := @JvDEPS;
    Iconos[2,2].Cant_Subnivel := 3;
    Iconos[2,2].TipoPadre := tpmDEPs;
    Iconos[2,2].Leyenda := CrearLeyenda('DEP',PAnimales,JvFolDEPS.BoundsRect);
    Iconos[2,2].Leyenda.Tag := 16;
    JvFolDEPS.OnClick := Click;
    JvFolDEPS.Tag := 16;
    AgregarAccionEjecucion(16,2,2,ttaEntrar,ttmAnimales,@Iconos[2,2],nil);

    Iconos[2,3].Carpeta := @JvFolExternos;
    Iconos[2,3].Icono := @JvExternos;
    Iconos[2,3].Cant_Subnivel := 0;
    Iconos[2,3].Leyenda := CrearLeyenda('Animales Externos',PAnimales,JvFolExternos.BoundsRect);
    Iconos[2,3].Leyenda.Tag := 17;
    JvFolExternos.Tag := 17;
    AgregarAccionEjecucion(17,2,3,ttaEjecutar,ttmAnimales,@Iconos[2,3],nil);

    Iconos[2,4].Carpeta := @JvFolEliminar;
    Iconos[2,4].Icono := @JvEliminar;
    Iconos[2,4].Cant_Subnivel := 0;
    Iconos[2,4].Leyenda := CrearLeyenda('Eliminar Animales',PAnimales,JvFolEliminar.BoundsRect);
    Iconos[2,4].Leyenda.Tag := 18;
    JvFolEliminar.Tag := 18;
    JvFolEliminar.OnClick := Click;
    AgregarAccionEjecucion(18,2,4,ttaEjecutar,ttmAnimales,@Iconos[2,4],nil);
    ////////////////////////////
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_ANIMALES do
      begin
        Iconos[I,K].Tipo := ttmAnimales;
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        ArmarPanelesTercerNivel(Iconos[I,K]);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  /// Iniciar Grilla de Eventos;
  WA := PEventos.Width div MAX_EVENTOS;
  HA := PEventos.Height div 2;
  with GEventos do
  begin
    Grilla.Panel := @PEventos;
    Grilla.Solapa.Icono := @JvEventos;
    Grilla.Solapa.SolapaActiva := @IEventos;
    Grilla.Solapa.Leyenda := @LEventos;
    ///Iconos del Panel
    Iconos[1,1].Carpeta := @JvFolECria;
    Iconos[1,1].Icono := @JvECria;
    Iconos[1,1].Cant_Subnivel := 3;
    Iconos[1,1].TipoPadre := tpmEveCria;
    Iconos[1,1].Leyenda := CrearLeyenda('Cría',PEventos,JvFolECria.BoundsRect);
    Iconos[1,1].Leyenda.Tag := 21;
    JvFolECria.OnClick := Click;
    JvFolECria.Tag := 21;
    AgregarAccionEjecucion(21,1,1,ttaEntrar,ttmEventos,@Iconos[1,1],nil);

    Iconos[1,2].Carpeta := @JvFolEEstab;
    Iconos[1,2].Icono := @JvEEstab;
    Iconos[1,2].Cant_Subnivel := 1;
    Iconos[1,2].TipoPadre := tpmEveEstablecimiento;
    Iconos[1,2].Leyenda := CrearLeyenda('Establecimiento',PEventos,JvFolEEstab.BoundsRect);
    Iconos[1,2].Leyenda.Tag := 22;
    JvFolEEstab.OnClick := Click;
    JvFolEEstab.Tag := 22;
    AgregarAccionEjecucion(22,1,2,ttaentrar,ttmEventos,@Iconos[1,2],nil);

    Iconos[1,3].Carpeta := @JvFolEGral;
    Iconos[1,3].Icono := @JvEGral;
    Iconos[1,3].Cant_Subnivel := 11;
    Iconos[1,3].TipoPadre := tpmEveGeneral;
    Iconos[1,3].Leyenda := CrearLeyenda('Generales',PEventos,JvFolEGral.BoundsRect);
    Iconos[1,3].Leyenda.Tag := 23;
    JvFolEGral.OnClick := Click;
    JvFolEGral.Tag := 23;
    AgregarAccionEjecucion(23,1,3,ttaentrar,ttmEventos,@Iconos[1,3],nil);

    Iconos[1,4].Carpeta := @JvFolEGestacion;
    Iconos[1,4].Icono := @JvEGestacion;
    Iconos[1,4].Cant_Subnivel := 1;
    Iconos[1,4].TipoPadre := tpmEveGestacion;
    Iconos[1,4].Leyenda := CrearLeyenda('Gestación',PEventos,JvFolEGestacion.BoundsRect);
    Iconos[1,4].Leyenda.Tag := 24;
    JvFolEGestacion.OnClick := Click;
    JvFolEGestacion.Tag := 24;
    AgregarAccionEjecucion(24,1,4,ttaentrar,ttmEventos,@Iconos[1,4],nil);

    Iconos[1,5].Carpeta := @JvFolEPartos;
    Iconos[1,5].Icono := @JvEPartos;
    Iconos[1,5].Cant_Subnivel := 3;
    Iconos[1,5].TipoPadre := tpmEvePartoNac;
    Iconos[1,5].Leyenda := CrearLeyenda('Partos - Nacimientos',PEventos,JvFolEPartos.BoundsRect);
    Iconos[1,5].Leyenda.Tag := 25;
    JvFolEPartos.OnClick := Click;
    JvFolEPartos.Tag := 25;
    AgregarAccionEjecucion(25,1,5,ttaentrar,ttmEventos,@Iconos[1,5],nil);

    Iconos[2,1].Carpeta := @JvFolESanitarios;
    Iconos[2,1].Icono := @JvESanitarios;
    Iconos[2,1].Cant_Subnivel := 8;
    Iconos[2,1].TipoPadre := tpmEveSanitarios;
    Iconos[2,1].Leyenda := CrearLeyenda('Sanitarios',PEventos,JvFolESanitarios.BoundsRect);
    Iconos[2,1].Leyenda.Tag := 26;
    JvFolESanitarios.OnClick := Click;
    JvFolESanitarios.Tag := 26;
    AgregarAccionEjecucion(26,2,1,ttaentrar,ttmEventos,@Iconos[2,1],nil);

    Iconos[2,2].Carpeta := @JvFolEServicios;
    Iconos[2,2].Icono := @JvEServicios;
    Iconos[2,2].Cant_Subnivel := 7;
    Iconos[2,2].TipoPadre := tpmEveServicios;
    Iconos[2,2].Leyenda := CrearLeyenda('Servicios',PEventos,JvFolEServicios.BoundsRect);
    Iconos[2,2].Leyenda.Tag := 27;
    JvFolEServicios.OnClick := Click;
    JvFolEServicios.Tag := 27;
    AgregarAccionEjecucion(27,2,2,ttaentrar,ttmEventos,@Iconos[2,2],nil);

    Iconos[2,3].Carpeta := @JvFolETransferencia;
    Iconos[2,3].Icono := @JvETransferencia;
    Iconos[2,3].Cant_Subnivel := 2;
    Iconos[2,3].TipoPadre := tpmEveTransferencia;
    Iconos[2,3].Leyenda := CrearLeyenda('Transferencia Embrionaria',PEventos,JvFolETransferencia.BoundsRect);
    Iconos[2,3].Leyenda.Tag := 28;
    JvFolETransferencia.OnClick := Click;
    JvFolETransferencia.Tag := 28;
    AgregarAccionEjecucion(28,2,3,ttaentrar,ttmEventos,@Iconos[2,3],nil);

    Iconos[2,4].Carpeta := @JvFolEEliminar;
    Iconos[2,4].Icono := @JvEEliminar;
    Iconos[2,4].Cant_Subnivel := 0;
    Iconos[2,4].Leyenda := CrearLeyenda('Eliminar Evento',PEventos,JvFolEEliminar.BoundsRect);
    Iconos[2,4].Leyenda.Tag := 29;
    JvFolEEliminar.Tag := 29;
    JvFolEEliminar.OnClick := Click;
    AgregarAccionEjecucion(29,2,4,ttaEjecutar,ttmEventos,@Iconos[2,4],nil);

    Iconos[2,5].Carpeta := nil;
    Iconos[2,5].Icono := nil;
    Iconos[2,5].Cant_Subnivel := 0;
    /////
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_EVENTOS do
      begin
        Iconos[I,K].Tipo := ttmEventos;
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        ArmarPanelesTercerNivel(Iconos[I,K]);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  ///Iniciar Grilla de Reportes;
  WA := PReportes.Width div MAX_REPORTES;
  HA := PReportes.Height div 2;
  with GReportes do
  begin
    Grilla.Panel := @PReportes;
    Grilla.Solapa.Icono := @JvResportes;
    Grilla.Solapa.SolapaActiva := @IReportes;
    Grilla.Solapa.Leyenda := @LReportes;
    ///Iconos del Panel
    Iconos[1,1].Carpeta := @JvFolRGral;
    Iconos[1,1].Icono := @JvRGral;
    Iconos[1,1].Cant_Subnivel := 14;
    Iconos[1,1].TipoPadre := tpmRepGeneral;
    Iconos[1,1].Leyenda := CrearLeyenda('Generales',PReportes,JvFolRGral.BoundsRect);
    Iconos[1,1].Leyenda.Tag := 31;
    JvFolRGral.OnClick := Click;
    JvFolRGral.Tag := 31;
    AgregarAccionEjecucion(31,1,1,ttaEntrar,ttmReportes,@Iconos[1,1],nil);

    Iconos[1,2].Carpeta := @JvFolRGestacion;
    Iconos[1,2].Icono := @JvRGestacion;
    Iconos[1,2].Cant_Subnivel := 8;
    Iconos[1,2].TipoPadre := tpmRepGestacion;
    Iconos[1,2].Leyenda := CrearLeyenda('Gestación',PReportes,JvFolRGestacion.BoundsRect);
    Iconos[1,2].Leyenda.Tag := 32;
    JvFolRGestacion.OnClick := Click;
    JvFolRGestacion.Tag := 32;
    AgregarAccionEjecucion(32,1,2,ttaentrar,ttmReportes,@Iconos[1,2],nil);

    Iconos[1,3].Carpeta := @JvFolRPartos;
    Iconos[1,3].Icono := @JvRPartos;
    Iconos[1,3].Cant_Subnivel := 2;
    Iconos[1,3].TipoPadre := tpmRepPartoNac;
    Iconos[1,3].Leyenda := CrearLeyenda('Partos-Nacimientos',PReportes,JvFolRPartos.BoundsRect);
    Iconos[1,3].Leyenda.Tag := 33;
    JvFolRPartos.OnClick := Click;
    JvFolRPartos.Tag := 33;
    AgregarAccionEjecucion(33,1,3,ttaentrar,ttmReportes,@Iconos[1,3],nil);

    Iconos[1,4].Carpeta := @JvFolRProduccion;
    Iconos[1,4].Icono := @JvRProduccion;
    Iconos[1,4].Cant_Subnivel := 2;
    Iconos[1,4].TipoPadre := tpmRepProduccion;
    Iconos[1,4].Leyenda := CrearLeyenda('Producción',PReportes,JvFolRProduccion.BoundsRect);
    Iconos[1,4].Leyenda.Tag := 34;
    JvFolRProduccion.OnClick := Click;
    JvFolRProduccion.Tag := 34;
    AgregarAccionEjecucion(34,1,4,ttaentrar,ttmReportes,@Iconos[1,4],nil);

    Iconos[1,5].Carpeta := @JvFolRSanitarios;
    Iconos[1,5].Icono := @JvRSanitarios;
    Iconos[1,5].Cant_Subnivel := 3;
    Iconos[1,5].TipoPadre := tpmRepSanitarios;
    Iconos[1,5].Leyenda := CrearLeyenda('Sanitarios',PReportes,JvFolRSanitarios.BoundsRect);
    Iconos[1,5].Leyenda.Tag := 35;
    JvFolRSanitarios.OnClick := Click;
    JvFolRSanitarios.Tag := 35;
    AgregarAccionEjecucion(35,1,5,ttaentrar,ttmReportes,@Iconos[1,5],nil);

    Iconos[2,1].Carpeta := @JvFolRServicios;
    Iconos[2,1].Icono := @JvRServicios;
    Iconos[2,1].Cant_Subnivel := 4;
    Iconos[2,1].TipoPadre := tpmRepServicios;
    Iconos[2,1].Leyenda := CrearLeyenda('Servicios',PReportes,JvFolRServicios.BoundsRect);
    Iconos[2,1].Leyenda.Tag := 36;
    JvFolRServicios.OnClick := Click;
    JvFolRServicios.Tag := 36;
    AgregarAccionEjecucion(36,2,1,ttaentrar,ttmReportes,@Iconos[2,1],nil);

    Iconos[2,2].Carpeta := @JvFolRTransferencia;
    Iconos[2,2].Icono := @JvRTransferencia;
    Iconos[2,2].Cant_Subnivel := 6;
    Iconos[2,2].TipoPadre := tpmRepTransferencia;
    Iconos[2,2].Leyenda := CrearLeyenda('Transferencia Embrionaria',PReportes,JvFolRTransferencia.BoundsRect);
    Iconos[2,2].Leyenda.Tag := 37;
    JvFolRTransferencia.OnClick := Click;
    JvFolRTransferencia.Tag := 37;
    AgregarAccionEjecucion(37,2,2,ttaentrar,ttmReportes,@Iconos[2,2],nil);

    Iconos[2,3].Carpeta := @JvFolRGenericos;
    Iconos[2,3].Icono := @JvRGenericos;
    Iconos[2,3].Cant_Subnivel := 0;
    Iconos[2,3].Leyenda := CrearLeyenda('Genéricos',PReportes,JvFolRGenericos.BoundsRect);
    Iconos[2,3].Leyenda.Tag := 38;
    JvFolRGenericos.Tag := 38;
    JvFolRGenericos.OnClick := Click;
    AgregarAccionEjecucion(38,2,3,ttaEjecutar,ttmReportes,@Iconos[2,3],nil);

    Iconos[2,4].Carpeta := @JvFolROficial;
    Iconos[2,4].Icono := @JvROficial;
    Iconos[2,4].Cant_Subnivel := 4;
    Iconos[2,4].TipoPadre := tpmRepOficiales;
    Iconos[2,4].Leyenda := CrearLeyenda('Documentación Oficial',PReportes,JvFolROficial.BoundsRect);
    Iconos[2,4].Leyenda.Tag := 39;
    JvFolROficial.OnClick := Click;
    JvFolROficial.Tag := 39;
    AgregarAccionEjecucion(39,2,4,ttaentrar,ttmReportes,@Iconos[2,4],nil);

    Iconos[2,5].Carpeta := nil;
    Iconos[2,5].Icono := nil;
    Iconos[2,5].Cant_Subnivel := 0;
    /////
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_REPORTES do
      begin
        Iconos[I,K].Tipo := ttmReportes;
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        ArmarPanelesTercerNivel(Iconos[I,K]);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  /// Iniciar Grilla de Herramientas;
  WA := PHerramientas.Width div MAX_HERRAMIENTAS;
  HA := PHerramientas.Height div 2;
  with GHerramientas do
  begin
    Grilla.Panel := @PHerramientas;
    Grilla.Solapa.Icono := @JvHerramientas;
    Grilla.Solapa.SolapaActiva := @IHerramientas;
    Grilla.Solapa.Leyenda := @LHerramientas;
    ///Iconos del Panel
    Iconos[1,1].Carpeta := @JvFolHojasManga;
    Iconos[1,1].Icono := @JvHojasManga;
    Iconos[1,1].Cant_Subnivel := 0;
    Iconos[1,1].Leyenda := CrearLeyenda('Hojas de Trabajo',PHerramientas,JvFolHojasManga.BoundsRect);
    Iconos[1,1].Leyenda.Tag := 41;
    JvFolHojasManga.Tag := 41;
    JvFolHojasManga.OnClick := Click;
    AgregarAccionEjecucion(41,1,1,ttaEntrar,ttmHerramientas,@Iconos[1,1],nil);

    Iconos[1,2].Carpeta := @JvFolCalendarios;
    Iconos[1,2].Icono := @JvCalendarios;
    Iconos[1,2].Cant_Subnivel := 3;
    Iconos[1,2].TipoPadre := tpmHerrCalendarios;
    Iconos[1,2].Leyenda := CrearLeyenda('Calendarios',PHerramientas,JvFolCalendarios.BoundsRect);
    Iconos[1,2].Leyenda.Tag := 42;
    JvFolCalendarios.OnClick := Click;
    JvFolCalendarios.Tag := 42;
    AgregarAccionEjecucion(42,1,2,ttaEntrar,ttmHerramientas,@Iconos[1,2],nil);

    Iconos[1,3].Carpeta := @JvFolBackup;
    Iconos[1,3].Icono := @JvBackup;
    Iconos[1,3].Cant_Subnivel := 0;
    Iconos[1,3].Leyenda := CrearLeyenda('Copiar Base de Datos',PHerramientas,JvFolBackup.BoundsRect);
    Iconos[1,3].Leyenda.Tag := 43;
    JvFolBackup.Tag := 43;
    JvFolBackup.OnClick := Click;
    AgregarAccionEjecucion(43,1,3,ttaEjecutar,ttmHerramientas,@Iconos[1,3],nil);

    Iconos[2,1].Carpeta := @JvFolRestaurar;
    Iconos[2,1].Icono := @JvRestaurar;
    Iconos[2,1].Cant_Subnivel := 0;
    Iconos[2,1].Leyenda := CrearLeyenda('Restaurar Base de Datos',PHerramientas,JvFolRestaurar.BoundsRect);
    Iconos[2,1].Leyenda.Tag := 44;
    JvFolRestaurar.Tag := 44;
    JvFolRestaurar.OnClick := Click;
    AgregarAccionEjecucion(44,2,1,ttaEjecutar,ttmHerramientas,@Iconos[2,1],nil);

    Iconos[2,2].Carpeta := @JvFolMovil;
    Iconos[2,2].Icono := @JvMovil;
    Iconos[2,2].Cant_Subnivel := 0;
    Iconos[2,2].Leyenda := CrearLeyenda('Carga desde Móvil',PHerramientas,JvFolMovil.BoundsRect);
    Iconos[2,2].Leyenda.Tag := 45;
    JvFolMovil.Tag := 45;
    JvFolMovil.OnClick := Click;
    AgregarAccionEjecucion(45,2,2,ttaEjecutar,ttmHerramientas,@Iconos[2,2],nil);

    Iconos[2,3].Carpeta := @JvFolActualizar;
    Iconos[2,3].Icono := @JvActualizar;
    Iconos[2,3].Cant_Subnivel := 0;
    Iconos[2,3].Leyenda := CrearLeyenda('Verificar Actualizaciones',PHerramientas,JvFolActualizar.BoundsRect);
    Iconos[2,3].Leyenda.Tag := 46;
    JvFolActualizar.Tag := 46;
    JvFolActualizar.OnClick := Click;
    AgregarAccionEjecucion(46,2,3,ttaEjecutar,ttmHerramientas,@Iconos[2,3],nil);
    /////
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_HERRAMIENTAS do
      begin
        Iconos[I,K].Tipo := ttmHerramientas;
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        ArmarPanelesTercerNivel(Iconos[I,K]);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
  /// Iniciar Grilla de Configuracion
  WA := PConfig.Width div MAX_CONGIF;
  HA := PConfig.Height div 2;
  with GConfig do
  begin
    Grilla.Panel := @PConfig;
    Grilla.Solapa.Icono := @JvConfig;
    Grilla.Solapa.SolapaActiva := @IConfig;
    Grilla.Solapa.Leyenda := @LConfiguracion;
    ///Iconos del Panel
    Iconos[1,1].Carpeta := @JvFolParametros;
    Iconos[1,1].Icono := @JvParametros;
    Iconos[1,1].Cant_Subnivel := 9;
    Iconos[1,1].TipoPadre := tpmConfCodigos;
    Iconos[1,1].Leyenda := CrearLeyenda('Parametros del Establecimiento',PConfig,JvFolParametros.BoundsRect);
    Iconos[1,1].Leyenda.Tag := 51;
    JvFolParametros.OnClick := Click;
    JvFolParametros.Tag := 51;
    AgregarAccionEjecucion(51,1,1,ttaEntrar,ttmConfig,@Iconos[1,1],nil);

    Iconos[1,2].Carpeta := @JvFolCEstablecimiento;
    Iconos[1,2].Icono := @JvCEstablecimiento;
    Iconos[1,2].Cant_Subnivel := 7;
    Iconos[1,2].TipoPadre := tpmConfEstablecimiento;
    Iconos[1,2].Leyenda := CrearLeyenda('Establecimiento',PConfig,JvFolCEstablecimiento.BoundsRect);
    Iconos[1,2].Leyenda.Tag := 52;
    JvFolCEstablecimiento.OnClick := Click;
    JvFolCEstablecimiento.Tag := 52;
    AgregarAccionEjecucion(52,1,2,ttaEntrar,ttmConfig,@Iconos[1,2],nil);

    Iconos[1,3].Carpeta := @JvFolGruposVisibles;
    Iconos[1,3].Icono := @JvGruposVisibles;
    Iconos[1,3].Cant_Subnivel := 0;
    Iconos[1,3].Leyenda := CrearLeyenda('Grupos Visibles',PConfig,JvFolParametros.BoundsRect);
    Iconos[1,3].Leyenda.Tag := 53;
    JvFolGruposVisibles.Tag := 53;
    JvFolGruposVisibles.OnClick := Click;
    AgregarAccionEjecucion(53,1,3,ttaEjecutar,ttmConfig,@Iconos[1,3],nil);

    Iconos[1,4].Carpeta := @JvFolPropietario;
    Iconos[1,4].Icono := @JvPropietario;
    Iconos[1,4].Cant_Subnivel := 0;
    Iconos[1,4].Leyenda := CrearLeyenda('Propietario',PConfig,JvFolPropietario.BoundsRect);
    Iconos[1,4].Leyenda.Tag := 54;
    JvFolPropietario.Tag := 54;
    JvFolPropietario.OnClick := Click;
    AgregarAccionEjecucion(54,1,4,ttaEjecutar,ttmConfig,@Iconos[1,4],nil);

    Iconos[2,1].Carpeta := @JvFolUsuarios;
    Iconos[2,1].Icono := @JvUsuarios;
    Iconos[2,1].Cant_Subnivel := 0;
    Iconos[2,1].Leyenda := CrearLeyenda('Usuarios',PConfig,JvFolUsuarios.BoundsRect);
    Iconos[2,1].Leyenda.Tag := 55;
    JvFolUsuarios.Tag := 55;
    JvFolUsuarios.OnClick := Click;
    AgregarAccionEjecucion(55,2,1,ttaEjecutar,ttmConfig,@Iconos[2,1],nil);

    Iconos[2,2].Carpeta := @JvFolCambioEsta;
    Iconos[2,2].Icono := @JvCambioEsta;
    Iconos[2,2].Cant_Subnivel := 0;
    Iconos[2,2].Leyenda := CrearLeyenda('Cambiar de Establecimiento',PConfig,JvFolCambioEsta.BoundsRect);
    Iconos[2,2].Leyenda.Tag := 56;
    JvFolCambioEsta.Tag := 56;
    JvFolCambioEsta.OnClick := Click;
    AgregarAccionEjecucion(56,2,2,ttaEjecutar,ttmConfig,@Iconos[2,2],nil);

    Iconos[2,3].Carpeta := @JvFolCambioUsuario;
    Iconos[2,3].Icono := @JvCambioUsuario;
    Iconos[2,3].Cant_Subnivel := 0;
    Iconos[2,3].Leyenda := CrearLeyenda('Cambiar de Usuario',PConfig,JvFolCambioUsuario.BoundsRect);
    Iconos[2,3].Leyenda.Tag := 57;
    JvFolCambioUsuario.Tag := 57;
    JvFolCambioUsuario.OnClick := Click;
    AgregarAccionEjecucion(57,2,3,ttaEjecutar,ttmConfig,@Iconos[2,3],nil);

    Iconos[2,4].Carpeta := nil;
    Iconos[2,4].Icono := nil;
    Iconos[2,4].Cant_Subnivel := 0;
    /////
    TA := 0;
    for I := 1 to 2 do
    begin
      LA := 0;
      for K := 1 to MAX_CONGIF do
      begin
        Iconos[I,K].Tipo := ttmConfig;
        Iconos[I,K].Left := LA;
        Iconos[I,K].Top := TA;
        Iconos[I,K].Width := WA;
        Iconos[I,K].Height := HA;
        ArmarPanelesTercerNivel(Iconos[I,K]);
        LA := LA + WA;
      end;
      TA := TA + HA;
    end;
  end;
end;

procedure TFPrincipal1.HabilitarPaneles(Panel : Integer);
begin
  case Panel of
    1 : begin
          PAnimales.BringToFront;
          PAnimales.Align := alClient;
          Image9.Align := alClient;
        end;
    2 : begin
          PEventos.BringToFront;
          PEventos.Align := alClient;
          Image11.Align := alClient;
        end;
    3 : begin
          PReportes.BringToFront;
          PReportes.Align := alClient;
          Image7.Align := alClient;
        end;
    4 : begin
          PHerramientas.BringToFront;
          PHerramientas.Align := alClient;
          Image12.Align := alClient;
        end;
    5 : begin
          PConfig.BringToFront;
          PConfig.Align := alClient;
          Image8.Align := alClient;
        end;
  end;
end;

procedure TFPrincipal1.HabilitarPestania(Pestania : Integer);
begin
  IAnimales.Visible := Pestania = 1;
  IEventos.Visible := Pestania = 2;
  IReportes.Visible := Pestania = 3;
  IHerramientas.Visible := Pestania = 4;
  IConfig.Visible := Pestania = 5;
  FormResize(self);
end;

procedure TFPrincipal1.JvImageClick(Sender: TObject);
begin
  HabilitarPestania((Sender as TjvImage).Tag);
  HabilitarPaneles((Sender as TjvImage).Tag);
  FormResize(self);
end;

procedure TFPrincipal1.FormShow(Sender: TObject);
begin
  InicioHuellaShow;
  HabilitarPestania(1);
  HabilitarPaneles(1);
  self.Width := 1024;
  self.Height := 768;
  FormResize(self);
end;

procedure TFPrincipal1.JvSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFPrincipal1.FormCreate(Sender: TObject);
begin
  InicioHuella;
  InicGrillas;
  AcomodarImagenes;
end;

procedure TFPrincipal1.FormResize(Sender: TObject);
begin
  RecalcularDimensiones;
  AcomodarImagenes;
  AcomodarTabs;
  AcomodarBottom;
end;

procedure TFPrincipal1.MouseEnter(Sender: TObject);
var
  R : TRegTagsAcciones;
begin
  inherited;
  R := BuscarAccion((Sender as TControl).Tag);
  if (R.Tag < 100) then
  begin
    if Assigned(R.GrillaComp) then
    begin
      LabelEnter(R.GrillaComp^.Leyenda);
      ImageEnter(R.GrillaComp^.Carpeta^);
    end;
  end
  else
  begin
    if Assigned(R.GrillaSimple) then
    begin
      LabelEnter(R.GrillaSimple^.Leyenda);
      LabelEnter(R.GrillaSimple^.LIniciales);
      ImageEnter(R.GrillaSimple^.Icono);
    end;
  end;
end;

procedure TFPrincipal1.LabelEnter(Sender: TObject);
begin
  if Assigned(Sender) then
  begin
    (Sender as TLabel).Font.Size := (Sender as TLabel).Font.Size + 2;
    (Sender as TLabel).Left := (Sender as TLabel).Left + 10;
    (Sender as TLabel).Top := (Sender as TLabel).Top + 10;
  end;
end;

procedure TFPrincipal1.ImageEnter(Sender: TObject);
begin
  if Assigned(Sender) then
    (Sender as TJvImage).State := stEntered;
end;

procedure TFPrincipal1.MouseLeave(Sender: TObject);
var
  R : TRegTagsAcciones;
begin
  inherited;
  R := BuscarAccion((Sender as TControl).Tag);
  if (R.Tag < 100) then
  begin
    if Assigned(R.GrillaComp) then
    begin
      LabelLeave(R.GrillaComp^.Leyenda);
      ImageLeave(R.GrillaComp^.Carpeta^);
    end;
  end
  else
  begin
    if Assigned(R.GrillaSimple) then
    begin
      LabelLeave(R.GrillaSimple^.Leyenda);
      LabelLeave(R.GrillaSimple^.LIniciales);
      ImageLeave(R.GrillaSimple^.Icono);
    end;
  end;
end;

procedure TFPrincipal1.LabelLeave(Sender: TObject);
begin
  if Assigned(Sender) then
  begin
    (Sender as TLabel).Font.Size := (Sender as TLabel).Font.Size - 2;
    (Sender as TLabel).Left := (Sender as TLabel).Left - 10;
    (Sender as TLabel).Top := (Sender as TLabel).Top - 10;
  end;
end;

procedure TFPrincipal1.ImageLeave(Sender: TObject);
begin
  if Assigned(Sender) then
    (Sender as TJvImage).State := stDefault;
end;

procedure TFprincipal1.Click(Sender: TObject);
var
  R : TRegTagsAcciones;
begin
  R := BuscarAccion((Sender as TControl).Tag);
  case R.Accion of
    ttaEjecutar : showmessage('Ejecutar Evento');
    ttaEntrar: begin
               if R.Tag < 100 then
                HabilitarPanel(R.GrillaComp^.PanelHijo);
               {else
                HabilitarPanel(R.GrillaSimple);}
               FormResize(self);
               end;
  end;
end;

procedure TFPrincipal1.LTabLavelEnter(Sender: TObject);
begin
  (Sender as TLabel).Font.Size := (Sender as TLabel).Font.Size + 2;
  case (Sender as TLabel).Tag of
    1 : JvAnimales.State := stEntered;
    2 : JvEventos.State := stEntered;
    3 : JvResportes.State := stEntered;
    4 : JvHerramientas.State := stEntered;
    5 : JvConfig.State := stEntered;
  end;
end;

procedure TFprincipal1.LTabLavelLeave(Sender: TObject);
begin
  (Sender as TLabel).Font.Size := (Sender as TLabel).Font.Size - 2;
  case (Sender as TLabel).Tag of
    1 : JvAnimales.State := stDefault;
    2 : JvEventos.State := stDefault;
    3 : JvResportes.State := stDefault;
    4 : JvHerramientas.State := stDefault;
    5 : JvConfig.State := stDefault;
  end;
end;

procedure TFprincipal1.LTabLavelClick(Sender: TObject);
begin
  case (Sender as TLabel).Tag of
    1 : JvImageClick(JvAnimales);
    2 : JvImageClick(JvEventos);
    3 : JvImageClick(JvResportes);
    4 : JvImageClick(JvHerramientas);
    5 : JvImageClick(JvConfig);
  end;
end;

procedure TFPrincipal1.LTabImageEnter(Sender: TObject);
begin
  case (Sender as TJvImage).Tag of
    1 : LAnimales.Font.Size := LAnimales.Font.Size + 2;
    2 : LEventos.Font.Size := LEventos.Font.Size + 2;
    3 : LReportes.Font.Size := LReportes.Font.Size + 2;
    4 : LHerramientas.Font.Size := LHerramientas.Font.Size + 2;
    5 : LConfiguracion.Font.Size := LConfiguracion.Font.Size + 2;
  end;
end;

procedure TFprincipal1.LTabImageLeave(Sender: TObject);
begin
  case (Sender as TJvImage).Tag of
    1 : LAnimales.Font.Size := LAnimales.Font.Size - 2;
    2 : LEventos.Font.Size := LEventos.Font.Size - 2;
    3 : LReportes.Font.Size := LReportes.Font.Size - 2;
    4 : LHerramientas.Font.Size := LHerramientas.Font.Size - 2;
    5 : LConfiguracion.Font.Size := LConfiguracion.Font.Size - 2;
  end;
end;

procedure TFPrincipal1.InicioHuella;
var
  Ini : TiniFile;
begin
  //Verificacion de Idioma
  {$IFDEF PEN}
  Idioma := 1;
  {$ELSE}
  IBQIdioma.Close;
  IBQIdioma.Open;
  Idioma := IBQIdioma.FieldValues['id_idioma'];
  {$ENDIF}
  FTraduccion := TFTraduccion.Create(self);

  /////////////////////////
  {$IFDEF PRODUCTORES}
    //MMPrincipal.IniFileName := ExtractFilePath(Application.ExeName)+'BarMenuProd.ini';
    MMPrincipal.LoadFromIniFile(ExtractFilePath(Application.ExeName)+'BarMenuProd.ini');
  {$ELSE}
    //MMPrincipal.IniFileName := ExtractFilePath(Application.ExeName)+'BarMenuVet.ini';
    MMPrincipal.LoadFromIniFile(ExtractFilePath(Application.ExeName)+'BarMenuVet.ini');
  {$ENDIF}
  //Esto es para cuando se actualiza el actualizador
  if FileExists(ExtractFilePath(Application.ExeName)+'Actualizador.exe') then
  begin
    DeleteFile(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe');
    MoveFile(PAnsiChar(ExtractFilePath(Application.ExeName)+'Actualizador.exe'),PAnsiChar(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe'));
  end;
  ///////////////////////////////////////////////////

  //Esto es para verificar el control de usuario en Windows Vista
  if VerificarUAC_Activado then
  begin
    if MostrarMensaje(tmConsulta,'El Control de Usuario (UAC) se encuentra activado.Para usar Huella debe desactivarlo.Desea hacerlo ahora?') = mrYes then
      winexec(PChar('CONTROL USERPASSWORDS'),SW_HIDE);
    Application.Terminate;
  end;
  ////////////////////////////////////////////////////

  ///Esto es para saber si el sistema fue actualizado con errores
  if FileExists(ExtractFilePath(Application.ExeName)+'Error_Act.huella') then
  begin
    if MostrarMensaje(tmConsulta,'Huella ha sido actualizado con errores. Para poder utilizarlo debe actualizar nuevamente.Desea actualizar ahora?') = mrYes then
       winexec(PChar(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe'),0);
    Application.Terminate;
  end;
  /////////////////////////////////////////////////////


  //VaComm1.Open;

 { FLectorElectronico:= TLectorAllFlexSerie.Create();//creo segun el que estamos usando
  FLectorElectronico.ConfigurarVaComm();
  FLectorElectronico.OpenVAComm; // abro la conexion}
{$IFDEF DEMO}
{$ELSE}
  try
    //Application.HookMainWindow(AppHook);
    Application.CreateForm(TFUbicacionBD, FUbicacionBD);
    NombreServidor:= '';

    if (VerificarEntrada() = 0) then
     begin
     // LO COMENTO PORQUE QUIERO TESTEARLO BIEN TODO.
     // MostrarMensaje(tmAdvertencia,'La última vez que se utilizó HUELLA no cerró correctamente.');
     // CompactarRepararBase();
     end;
  except
  end;
{$ENDIF}
  try
  {  MonitorBckBaseDatos := TThreadBckBase.Create;
    MonitorBckBaseDatos.Resume; }

    {$IFDEF PEN}
    {$ELSE}
    if not VerificarServidorBD then
      Application.Terminate;
    {$ENDIF}

    conectarBD();
    if (FUbicacionBD <> nil) then
      begin
        FUbicacionBD.Destroy;
      end;
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
    if (Ini.ReadString('Sistema', 'TipoVersion', '') = '') then
      begin
        {$IFDEF PRODUCTORES}
            Ini.WriteString('Sistema','TipoVersion','Productores');
        {$ELSE}
             Ini.WriteString('Sistema','TipoVersion','Veterinarios');
        {$ENDIF}
      end;
    WindowState := wsMaximized;
    Position:= poScreenCenter;
  except
  end;
end;

procedure TFPrincipal1.AAbmCategoriasRazasExecute(Sender: TObject);
begin
  inherited;
end;

procedure TFPrincipal1.AAbmEstablecimientosExecute(Sender: TObject);
var
  abm : TFABMEstablecimientos;
begin
  inherited;
  abm := TFABMEstablecimientos.Create(self);
  abm.Abrir(faAbm);
  leerDatosPais();
end;

//llave nuevo codigo
function TFPrincipal1.verificarLlave: boolean;
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
    TargetName_1 := ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe';
    IObject_1 := CreateComObject(CLSID_ShellLink) ;
    ISLink_1 := IObject_1 as IShellLink;
    IPFile_1 := IObject_1 as IPersistFile;
    with ISLink_1 do
    begin
      SetPath(pChar(TargetName_1)) ;  // Path y nombre archivo c:\prueba\pepe.exe
      SetWorkingDirectory(pChar(ExtractFilePath(TargetName_1))) ; //directorio de trabajo solo path
      SetIconLocation(PChar(ExtractFilePath(Application.ExeName)+'Huella Update 1.5\Actualizador.exe'), 0);  // Icono del exe
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

procedure TFPrincipal1.InicioHuellaShow;
var f: TFLogin;
    abm : TFABMPropietario;
begin
  inherited;


  {$IFDEF PEN}
        //
  {$ELSE}
    {$IFDEF DEMO}
      //
    {$ELSE}
      CrearAccesoActualizador;
    {$ENDIF}
  {$ENDIF}

  HideButtonsBasico(false);
  TimerLlave.Enabled:= false;
  if (verificarLlave()) then   //llave nuevo codigo
  begin //
    TimerLlave.Enabled:= true;
    if (Screen.Width > 810) then
    begin
      Resolucion := 1024;
      IFondo.Picture.LoadFromFile(pathDirExe+'imagenes\principal_1024.jpg');
      LTipoVersionLicenciaImagenesPrincip.Left:=779;
      LTipoVersionLicenciaImagenesPrincip.Top:=52;
    end
    else
    begin
      Resolucion := 800;
      IFondo.Picture.LoadFromFile(pathDirExe+'imagenes\principal_800.jpg');
      LTipoVersionLicenciaImagenesPrincip.Left:=555;
      LTipoVersionLicenciaImagenesPrincip.Top:=54;      
    end;
    Caption := Traducir('Gestión de Bovinos de Carne');
    PTitulo.Caption := Caption;
    PTitulo.Visible := False;
    Application.Title := Caption;
    Application.CreateForm(TFPresentacion, FPresentacion);
    BorrarArchivosTemporales();
    FPresentacion.ShowModal;
    FPresentacion.Destroy;

    if (TipoVersionLicencia = 'Basico') then
      begin
        //esto va para la licencia entra en la version 2.0
        HideButtonsBasico(true);
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
      if (TipoVersionLicencia = 'Estandar') then
        begin
          //esto va para la licencia entra en la version 2.0
          Application.CreateForm(TFRegistroLicencia, FRegistroLicencia);
          if not FRegistroLicencia.verificacopia then
           begin
          {$IFDEF PEN}
          if FRegistroLicencia.EstadoLicencia = '3' then
          begin
              MostrarMensaje(tmAdvertencia, 'El Producto no se encuentra registrado. Por favor comuníquese con el soporte técnico de HUELLA - sac@softhuella.com.ar.');
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
        end;
    try
      if (DMSoftvet.IBQEstablecimiento.IsEmpty) then
         begin
          DMSoftvet.IBQUsuario.First;
          SetUsuarioActual(1);
          DMSoftvet.IBQSeguridad.Close;
          DMSoftvet.IBQSeguridad.ParamByName('Usuario').AsInteger := 1;
          DMSoftvet.IBQSeguridad.Open;
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
    ComponentesVisiblesPorPais(Pais);
    FTipoVersion := tvVeterinario;
    Colores();
    DesActivarAcciones;
    ActivarAcciones;

    Application.HelpFile := copy(Application.ExeName, 0, length(Application.ExeName) -4) + '.chm';
    SBUniversal.Panels[2].Width:= 0;
    SBUniversal.Panels[2].Text := '';
    {$IFDEF RED}
      SBUniversal.Panels[2].Width:= Length(' Servidor ' + NombreServidor + ' ')*6;
      SBUniversal.Panels[2].Text := ' Servidor ' + NombreServidor;
    {$ENDIF}

    {$IFDEF DEMO}
         BBCambioUsuario.Enabled:= false;
         AGenBackup.Enabled:= true;
    {$ELSE}
      //Verifico si hay actualizaciones solo para las versiones comerciales
      if IsConnected then
        TimerActualizador.Enabled := true; 
      {$IFDEF PRODUCTORES}
         //
      {$ELSE}
      {$ENDIF}    
    {$ENDIF}
  end//
  else
   begin
    MostrarMensaje(tmError, 'La llave de seguridad de Huella no se encuentra - Si desea adquirir Huella visite nuestra página www.softhuella.com.ar');
    FPrincipal.Close;
    Application.Terminate;
   end;

   HabilitarComponentesVersionBasica();
   AREPMovimientosExistencia.Enabled:= true;

   HidePanels(true);
   UbicarPaneles();

   LTipoVersionLicenciaImagenesPrincip.Caption:= '';
  {$IFDEF PEN}
      LTipoVersionLicenciaImagenesPrincip.Caption:= Traducir('MODULO PENDRIVE');
  {$ELSE}
   if (FPrincipal <> nil) then
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
           end;
  {$ENDIF}

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
end;

procedure TFPrincipal1.VerificarAlarmasServicio();
begin
  HayServicios := false;
  IBQVerAlarma.Close;
  IBQVerAlarma.Open;
  HayServicios := (IBQVerAlarma.FieldByName('cant').AsInteger > 0);
  TCheck.Enabled := true;
  if (HayServicios) then
    AbrirFormNormal(TFALAServicioNatural.Create(self));
end;



end.
