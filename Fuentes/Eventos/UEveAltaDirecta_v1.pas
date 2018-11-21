unit UEveAltaDirecta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveIndividual, DB, IBCustomDataSet, IBStoredProc, ActnList,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, IBQuery, DBCtrls, Grids, DBGrids,
  UDBLookupComboBoxAuto, DateTimePickerAuto, EditAuto, Tabs, MemoAuto,
  Mask, QuickRpt, UDBDateTimePickerAuto, ComboBoxAuto, UFrameMangazo, QGrids, UDBEditAuto,
  UFrameDBSeleccion, IBTable, IBDatabase, ValEdit, UButtonABM,UDBControl, DataExport, DataToXLS,
  WinXP, IBUpdateSQL, JvGIF, PngImage, JvExExtCtrls, JvImage, jpeg,
  ImgList, PngImageList, JvExControls, JvLabel, JvFullColorSpaces,
  JvFullColorCtrls, UBDBGrid;

type
  TFEveAltaDirecta = class(TFEveIndividual)
    TSHEstadoGeneral: TTabSheet;
    TSHMadres: TTabSheet;
    TSHEconomia: TTabSheet;
    GBPrecio: TGroupBox;
    PrecioKg: TLabel;
    LPrecioCabeza: TLabel;
    EAPrecioB: TEditAuto;
    EAPrecioU: TEditAuto;
    LPeso: TLabel;
    GBGastos: TGroupBox;
    LPrecioNeto: TLabel;
    LPorcentaje: TLabel;
    LValor: TLabel;
    EAPorcentaje: TEditAuto;
    EAValor: TEditAuto;
    TSHUbicacion: TTabSheet;
    PCentro: TPanel;
    GBFiltro: TGroupBox;
    LPotrero: TLabel;
    LRodeo: TLabel;
    TSHPadres: TTabSheet;
    GBGrupos: TGroupBox;
    IBQGenIDAux: TIBQuery;
    IBQGenIDAuxPE: TIBQuery;
    IBQMadreB: TIBQuery;
    DSMadreBiologica: TDataSource;
    DSMadreReceptora: TDataSource;
    IBQMadreR: TIBQuery;
    EAPeso: TEditAuto;
    FrameSeleccionGrupos: TFrameSeleccion;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    DBLCBARodeo: TDBLookupComboBoxAuto;
    IBQMadresInternas: TIBQuery;
    DSMadresInternas: TDataSource;
    IBQPadresExt_Int: TIBQuery;
    DSPadresExt_Int: TDataSource;
    GBDatosEve: TGroupBox;
    PIdenficacion: TPanel;
    GBIdentificacion: TGroupBox;
    LPC: TLabel;
    LRA: TLabel;
    LOtro: TLabel;
    EAIdSenasa: TEditAuto;
    EAIdPC: TEditAuto;
    EAIdRA: TEditAuto;
    EAOtro: TEditAuto;
    GBPrincipal: TGroupBox;
    LRPAnimal: TLabel;
    LNombre: TLabel;
    Label1: TLabel;
    EAIdRP: TEditAuto;
    EANombre: TEditAuto;
    EAApodo: TEditAuto;
    GBDatosParticulares: TGroupBox;
    LSexo: TLabel;
    LFechaNac: TLabel;
    LRaza: TLabel;
    LCategoriaAnimal: TLabel;
    DTPAFechaNac: TDateTimePickerAuto;
    DBLCBASexo: TDBLookupComboBoxAuto;
    DBLCBACategoria: TDBLookupComboBoxAuto;
    DBLCBARaza: TDBLookupComboBoxAuto;
    GBestadoHembras: TGroupBox;
    LEstadoR: TLabel;
    LGDR: TLabel;
    LELactacion: TLabel;
    EAEstadoLactacion: TEditAuto;
    DBLCBAEstadoR: TDBLookupComboBoxAuto;
    DBLCBAGDR: TDBLookupComboBoxAuto;
    GBEstadoMachos: TGroupBox;
    LCEscrotal: TLabel;
    EACircunferenciaE: TEditAuto;
    GBMadreBiologica: TGroupBox;
    LNombreMadre: TLabel;
    LApodoMadre: TLabel;
    LSenesaMadre: TLabel;
    LPCMadre: TLabel;
    LHBAMadre: TLabel;
    LRAMadre: TLabel;
    LOtroMadre: TLabel;
    LRPAnimalMadre: TLabel;
    SBMadreB: TSpeedButton;
    DBLCBASenasaMadreB: TDBLookupComboBoxAuto;
    DBLCBAPCMadreB: TDBLookupComboBoxAuto;
    DBLCBAHBAMadreB: TDBLookupComboBoxAuto;
    DBLCBARAMadreB: TDBLookupComboBoxAuto;
    DBLCBAOtroMadreB: TDBLookupComboBoxAuto;
    DBLCBARPMadreB: TDBLookupComboBoxAuto;
    DBLCBAApodoMadreB: TDBLookupComboBoxAuto;
    DBLCBANombreMadreB: TDBLookupComboBoxAuto;
    PHabilitarMadreR: TPanel;
    GBMadreReceptora: TGroupBox;
    LNombreMadreR: TLabel;
    LApodoMadreR: TLabel;
    LSenasaMadreR: TLabel;
    LPCMadreR: TLabel;
    LHBAMadreR: TLabel;
    LRAMadreR: TLabel;
    LOtroMadreR: TLabel;
    LRPMadreR: TLabel;
    DBLCBARPMadreR: TDBLookupComboBoxAuto;
    DBLCBAApodoMadreR: TDBLookupComboBoxAuto;
    DBLCBANombreMadreR: TDBLookupComboBoxAuto;
    DBLCBSenasaMadreR: TDBLookupComboBoxAuto;
    DBLCBPCMadreR: TDBLookupComboBoxAuto;
    DBLCBHBAMadreR: TDBLookupComboBoxAuto;
    DBLCBRAMadreR: TDBLookupComboBoxAuto;
    DBLCBOtroMadreR: TDBLookupComboBoxAuto;
    GBPadres: TGroupBox;
    LNombrePadre: TLabel;
    LApodoPadre: TLabel;
    LSenansaPadre: TLabel;
    LPCPadre: TLabel;
    LHBAPadre: TLabel;
    LRAPadre: TLabel;
    LOtroPadre: TLabel;
    LRPPadre: TLabel;
    SBPadre: TSpeedButton;
    DBLCBARPPadre: TDBLookupComboBoxAuto;
    DBLCBAApodoPadre: TDBLookupComboBoxAuto;
    DBLCBANombrePadre: TDBLookupComboBoxAuto;
    DBLCBASenasaPadre: TDBLookupComboBoxAuto;
    DBLCBAPCPadre: TDBLookupComboBoxAuto;
    DBLCBAHBAPadre: TDBLookupComboBoxAuto;
    DBLCBARAPadre: TDBLookupComboBoxAuto;
    DBLCBAOTROPadre: TDBLookupComboBoxAuto;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    LTotalNeto: TLabel;
    UDLactacion: TUpDown;
    GroupBox1: TGroupBox;
    LCronologiaD: TLabel;
    LCCorporal: TLabel;
    DBLCBACondicionC: TDBLookupComboBoxAuto;
    DBLCBACronologiaD: TDBLookupComboBoxAuto;
    DSAuxAnimales: TDataSource;
    IBQPadresExt_IntAPODO: TIBStringField;
    IBQPadresExt_IntID: TIntegerField;
    IBQPadresExt_IntID_HBA: TIBStringField;
    IBQPadresExt_IntID_OTRO: TIBStringField;
    IBQPadresExt_IntID_PC: TIBStringField;
    IBQPadresExt_IntID_RA: TIBStringField;
    IBQPadresExt_IntID_RP: TIBStringField;
    IBQPadresExt_IntID_SENASA: TIBStringField;
    IBQPadresExt_IntNOMBRE: TIBStringField;
    IBQPadresExt_IntRAZA: TIntegerField;
    IBQPadresExt_IntEXTINT: TIBStringField;
    IBQLimpiarTablasAux: TIBQuery;
    IBDSUnSoloPadre: TIBDataSet;
    CBCondicionCorporal: TCheckBox;
    EADta: TEditAuto;
    LDta: TLabel;
    IBSPCambiarCategoria: TIBStoredProc;
    RBCUIGSenasa: TRadioButton;
    RBSenasa: TRadioButton;
    EAEncabezado: TMaskEdit;
    EAUltimoIdent: TMaskEdit;
    EVerificador: TEdit;
    IBQActCUIG: TIBQuery;
    CBCUIGPropio: TCheckBox;
    DBLCBACUIGPropio: TDBLookupComboBoxAuto;
    IBQBuscarCUIG: TIBQuery;
    SBMadreR: TBitBtn;
    IBQAuxAnimales: TIBQuery;
    IBInsAuxAnimales: TIBQuery;
    IBQDelAuxAnimales: TIBQuery;
    IBQGenIDAnimal: TIBQuery;
    LCUIGPropio: TLabel;
    DBLCBATiposPeso: TDBLookupComboBoxAuto;
    LDias: TLabel;
    IBQSPRNRESULT: TIBStringField;
    IBQSPRNMENSAJE: TIBStringField;
    Label3: TLabel;
    LEdad: TLabel;
    SBMadreIndefinida: TSpeedButton;
    LIdentificacionElectronica: TLabel;
    EAIdentificacionElectronica: TEditAuto;
    RBReidentificacionSenasa: TRadioButton;
    Lr: TLabel;
    EAEncabezadoReidentificacion: TMaskEdit;
    EAUltimoIdentReidentificacion: TMaskEdit;
    EVerificadorReidentificacion: TEdit;
    IBQPadresExt_IntSEXO: TIntegerField;
    CBCastrado: TCheckBox;
    IBSPFIXRELANIMPADRESEXTCICLICO: TIBStoredProc;
    EAPrefijo: TEditAuto;
    EARpInicial: TEditAuto;
    EASufijo: TEditAuto;
    LSubCategoria: TLabel;
    DBLCBASubCategoria: TDBLookupComboBoxAuto;
    IBQCompraAnimal: TIBQuery;
    JvIAyuda: TJvImage;
    LAyuda: TLabel;
    JvFCLMBioInt: TJvFullColorLabel;
    CBMBioInt: TCheckBox;
    JvFCLMBioExt: TJvFullColorLabel;
    CBMBioExt: TCheckBox;
    JvFCLMRecInt: TJvFullColorLabel;
    JvFCLMRecExt: TJvFullColorLabel;
    CBMRecExt: TCheckBox;
    CBMRecInt: TCheckBox;
    EBiologica: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EReceptora: TEdit;
    Button1: TButton;
    Button2: TButton;
    IBQMBiologica: TIBQuery;
    IBQMReceptora: TIBQuery;
    DSMBiologica: TDataSource;
    DSMReceptora: TDataSource;
    ChkBMadreReceptora: TCheckBox;
    IBuscarMBio: TImage;
    LBuscarMBiolo: TLabel;
    LBuscarMRec: TLabel;
    IBuscarMRec: TImage;
    LMSeleccionadaB: TLabel;
    LHBA: TLabel;
    EAIdHBA: TEditAuto;
    EAADN: TEditAuto;
    CBADN: TCheckBox;
    DBLCBAOrigen: TDBLookupComboBoxAuto;
    LOrigen: TLabel;
    DTPAFechaEve: TDateTimePickerAuto;
    LFechaEvento: TLabel;
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LCriador: TLabel;
    DBLCBACriador: TDBLookupComboBoxAuto;
    CBSanguinea: TCheckBox;
    EASanguinea: TEditAuto;
    LActividad: TLabel;
    DBLCBAActividad: TDBLookupComboBoxAuto;
    LPropietario: TLabel;
    SBPropietarios: TSpeedButton;
    DBLCBAPropietario: TDBLookupComboBoxAuto;
    LTipoAlta: TLabel;
    DBLCBATipoAlta: TDBLookupComboBoxAuto;
    LCodigoManejo: TLabel;
    DBLCBACodigoManejo: TDBLookupComboBoxAuto;
    LMocho: TLabel;
    DBLCBAMocho: TDBLookupComboBoxAuto;
    LInspeccion: TLabel;
    DBLCBAInspeccion: TDBLookupComboBoxAuto;
    LDestino: TLabel;
    DBLCBADestCabania: TDBLookupComboBoxAuto;
    Shape1: TShape;
    LColor: TLabel;
    DBLCBAColor: TDBLookupComboBoxAuto;
    IBQColor: TIBQuery;
    DSColor: TDataSource;
    LMSeleccionadaR: TLabel;
    JvFullColorLabel1: TJvFullColorLabel;
    JvFullColorLabel2: TJvFullColorLabel;
    CBPInt: TCheckBox;
    CBPExt: TCheckBox;
    LSeleccionP: TLabel;
    Label7: TLabel;
    ERPPadre: TEdit;
    Button3: TButton;
    IBuscarP: TImage;
    LBuscarP: TLabel;
    Image5: TImage;
    Label6: TLabel;
    Image7: TImage;
    Label8: TLabel;
    Image8: TImage;
    Label9: TLabel;
    procedure CambioGUIG(Sender : TObject);
    procedure CambioReidentificacion(Sender : TObject);
    procedure FormCreate(Sender: TObject);
    procedure CargarParametrosRN;override;
    procedure CargarParametrosSP;override;
    procedure ChkBMadreReceptoraClick(Sender: TObject);
    procedure SBMadreBClick(Sender: TObject);
    procedure SBMadreRClick(Sender: TObject);
    procedure SBPadreClick(Sender: TObject);
    procedure FrameSeleccionGruposBBAgregarTodosClick(Sender: TObject);
    procedure FrameSeleccionGruposIBQSeleccionadosBeforeOpen(
      DataSet: TDataSet);
    procedure FrameSeleccionGruposIBQDisponiblesBeforeOpen(
      DataSet: TDataSet);
    procedure ATerminarExecute(Sender: TObject);
    procedure ChkBPadresMultiplesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FrameSeleccionGruposBBAgregarUnoClick(Sender: TObject);
    procedure FrameSeleccionGruposBDBGSelecciondosCellClick(
      Column: TColumn);
    procedure TSHObservacionShow(Sender: TObject);
    procedure DBLCBOtroMadreRExit(Sender: TObject);
    procedure DBLCBASexoClick(Sender: TObject);
    procedure FrameSeleccionGruposBBEliminarUnoClick(Sender: TObject);
    procedure FrameSeleccionGruposBBEliminarTodosClick(Sender: TObject);
    procedure EAIdRPKeyPress(Sender: TObject; var Key: Char);
    procedure EANombreChange(Sender: TObject);
    procedure DTPAFechaNacCloseUp(Sender: TObject);
    procedure DBLCBATipoAltaCloseUp(Sender: TObject);
    procedure DBLCBACategoriaCloseUp(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure Salida(Sender: TObject);
    procedure Numeros(Sender: TObject; var Key: Char);
    procedure Change(Sender: TObject);
    procedure DTPAFechaNacChange(Sender: TObject);
    procedure DTPAFechaEveChange(Sender: TObject);
    procedure EACircunferenciaEKeyPress(Sender: TObject; var Key: Char);
    procedure EACircunferenciaEExit(Sender: TObject);
    procedure FrameSeleccionPadresIBQSeleccionadosAfterOpen(
      DataSet: TDataSet);
    procedure IBQPadresExt_IntAfterOpen(DataSet: TDataSet);
    procedure DBLCBARPPadreCloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBQMadreBAfterOpen(DataSet: TDataSet);
    procedure IBQMadresInternasAfterOpen(DataSet: TDataSet);
    procedure DBLCBARPPadreClick(Sender: TObject);
    procedure EAIdRPChange(Sender: TObject);
    procedure CBCondicionCorporalClick(Sender: TObject);
    procedure CBCondicionCorporalKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EAIdSenasaKeyPress(Sender: TObject; var Key: Char);
    procedure RBCUIGSenasaClick(Sender: TObject);
    procedure RBSenasaClick(Sender: TObject);
    procedure CBCUIGPropioClick(Sender: TObject);
    procedure DBLCBACUIGPropioCloseUp(Sender: TObject);
    procedure EANombreKeyPress(Sender: TObject; var Key: Char);
    procedure EAApodoKeyPress(Sender: TObject; var Key: Char);
    procedure EAEncabezadoKeyPress(Sender: TObject; var Key: Char);
    procedure EAUltimoIdentKeyPress(Sender: TObject; var Key: Char);
    procedure EVerificadorKeyPress(Sender: TObject; var Key: Char);
    procedure EAIdPCKeyPress(Sender: TObject; var Key: Char);
    procedure EAIdHBAKeyPress(Sender: TObject; var Key: Char);
    procedure EAIdRAKeyPress(Sender: TObject; var Key: Char);
    procedure EAOtroKeyPress(Sender: TObject; var Key: Char);
    procedure EADtaKeyPress(Sender: TObject; var Key: Char);
    procedure DTPAFechaNacKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBACategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBASexoKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARazaKeyPress(Sender: TObject; var Key: Char);
    procedure DTPAFechaEveKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBATipoAltaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARPMadreBKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAPCMadreBKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBASenasaMadreBKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAHBAMadreBKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAApodoMadreBKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARAMadreBKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBANombreMadreBKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAOtroMadreBKeyPress(Sender: TObject; var Key: Char);
    procedure ChkBMadreReceptoraKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARPMadreRKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBPCMadreRKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBSenasaMadreRKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBHBAMadreRKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAApodoMadreRKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBRAMadreRKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBANombreMadreRKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARPPadreKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAPCPadreKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBASenasaPadreKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAHBAPadreKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAApodoPadreKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARAPadreKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBANombrePadreKeyPress(Sender: TObject; var Key: Char);
    procedure EAEstadoLactacionKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAEstadoRKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBACondicionCKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAPotreroKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBACronologiaDKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAGDRKeyPress(Sender: TObject; var Key: Char);
    procedure ACancelarExecute(Sender: TObject);
    procedure DBLCBACategoriaClick(Sender: TObject);
    procedure IBQAuxAnimalesAfterOpen(DataSet: TDataSet);
    procedure LCUIGPropioClick(Sender: TObject);
    procedure LCUIGPropioMouseEnter(Sender: TObject);
    procedure LCUIGPropioMouseLeave(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure LPotreroClick(Sender: TObject);
    procedure LPotreroMouseEnter(Sender: TObject);
    procedure LPotreroMouseLeave(Sender: TObject);
    procedure LRodeoClick(Sender: TObject);
    procedure LRodeoMouseEnter(Sender: TObject);
    procedure LRodeoMouseLeave(Sender: TObject);
    procedure DBLCBATiposPesoCloseUp(Sender: TObject);
    procedure EAIdRPExit(Sender: TObject);
    procedure SBMadreIndefinidaClick(Sender: TObject);
    procedure LActividadClick(Sender: TObject);
    procedure LActividadMouseEnter(Sender: TObject);
    procedure LActividadMouseLeave(Sender: TObject);
    procedure LOrigenClick(Sender: TObject);
    procedure LCriadorClick(Sender: TObject);
    procedure LPropietarioClick(Sender: TObject);
    procedure CBADNClick(Sender: TObject);
    procedure CBSanguineaClick(Sender: TObject);
    procedure LOrigenMouseEnter(Sender: TObject);
    procedure LOrigenMouseLeave(Sender: TObject);
    procedure LCriadorMouseEnter(Sender: TObject);
    procedure LCriadorMouseLeave(Sender: TObject);
    procedure LPropietarioMouseEnter(Sender: TObject);
    procedure LPropietarioMouseLeave(Sender: TObject);
    procedure RBReidentificacionSenasaClick(Sender: TObject);
    procedure EAPrefijoChange(Sender: TObject);
    procedure EARpInicialChange(Sender: TObject);
    procedure EASufijoChange(Sender: TObject);
    procedure EAPrefijoKeyPress(Sender: TObject; var Key: Char);
    procedure EARpInicialKeyPress(Sender: TObject; var Key: Char);
    procedure EASufijoKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARazaCloseUp(Sender: TObject);
    procedure LCodigoManejoClick(Sender: TObject);
    procedure LCodigoManejoMouseEnter(Sender: TObject);
    procedure LCodigoManejoMouseLeave(Sender: TObject);
    procedure DBLCBAActividadCloseUp(Sender: TObject);
    procedure SBPropietariosClick(Sender: TObject);
    procedure DTPAFechaEveEnter(Sender: TObject);
    procedure DTPAFechaEveExit(Sender: TObject);
    procedure LSubCategoriaMouseEnter(Sender: TObject);
    procedure LSubCategoriaMouseLeave(Sender: TObject);
    procedure LSubCategoriaClick(Sender: TObject);
    procedure DBLCBARPMadreBCloseUp(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EBiologicaChange(Sender: TObject);
    procedure EBiologicaKeyPress(Sender: TObject; var Key: Char);
    procedure EReceptoraChange(Sender: TObject);
    procedure EReceptoraKeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure AAnteriorExecute(Sender: TObject);
  private
    RpyNombre: Boolean;
    RpySenasa: Boolean;
    RPMadreBio, RPMadreRec : String;
    procedure InicioCreate();
    procedure InicioShow;
    procedure ClearComponentes;
    procedure ActualizarInternos();
    procedure ActualizarPadres();
    procedure CargarSubCategoriasporRaza();
    procedure AcomodarPanelPorRaza();
  protected
    DiasPeso: String;
    IDRp : String;
    id_madreR, id_madreB, id_padre : Integer;
    TipoMadreR, TipoMadreB, TipoPadre : String;
    procedure ControlEventoOnExit(Sender: TObject); override;
    procedure ActualizarCUIG(CUIG : String);
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
    procedure ConfigurarPorRaza;
    function AgregarAnimalExterno(Sexo : Integer) : Integer;
    function AgregarAnimalInterno(Sexo : Integer) : Integer;
  public
    FIdAnimExterno : Integer; //solo se usa para la compra de animales externos
    FIdAux : Integer;
    FIdAuxPE : Integer;
    CargaOtro: Boolean;
    ID_Animal : integer;
    procedure SeleccionarUnGrupo(Sender: TObject);
    procedure SeleccionarUnPadre(Sender: TObject);
    procedure HandlerOnExitSenasa(Sender: TObject);
    procedure HandlerOnExitRP(Sender: TObject);
    procedure ActivarQueriesPropios;
    procedure BorrarTablasAuxiliares;
    procedure CategoriaSegunSexo;
    procedure SetNullCombos(Sender: TObject);
    procedure HabilitarSegunSexo;
    procedure MostrarRA;
    procedure LlenarAuxAnimales;
    procedure BorrarAuxPadres;
    procedure AsignarUnSoloPadre(Sender : TObject);
    procedure controlCondicionCorporal;
    procedure ActualizarDatosPadres(rp:String);
    procedure CargarOtro();
end;
var
  FEveAltaDirecta: TFEveAltaDirecta;
  FTipoCArga:Integer;
  FTipoAlta: Integer;//0 alta , 1 modificación
  hi:THintWindow;  

implementation

{$R *.dfm}

uses UPrincipal,UDMSoftvet,{USeleccionEstablecimiento,}UAbmPadresExternos,IBDButtonABM, UAbmSimple,
  DateUtils, UMensajeHuella, UFunctions, UABMModificarCUIG, UABMEmpleados,
  UABMPotreros, UABMRodeos, UABMActividad, UABMCriador, UABMPropietarioAnimal,
  UCartel, UABMOrigen,UEveSimple, UABMCodigosManejo, UCoopropiedad, UABMSubCategorias, UTraduccion,
  UPosiblesMadres, USelAnimalesSemenExtraccion, UEveModifDatosAnimal;


procedure TFEveAltaDirecta.InicioCreate;
begin

//  BBTerminar.Enabled := False;
  //IBDSAuxAnimales.Open;
  IBQAuxAnimales.Open;
{  IBDSUnSoloPadre.Close;
  IBDSUnSoloPadre.ParamByName('ID_AUX').Value := FIdAux;
  IBDSUnSoloPadre.Open;}
//  BorrarAuxPadres;
  RpyNombre := false;
  PCBasico.ActivePageIndex:=0;
  EAIdSenasa.SetOnExit(HandlerOnExitSenasa);
  //EAIdRP.SetOnExit(HandlerOnExitRP);
  EAPrefijo.SetOnExit(HandlerOnExitRP);
  EASufijo.SetOnExit(HandlerOnExitRP);
  EARpInicial.SetOnExit(HandlerOnExitRP);
  ControlEventoOnExit(self);

 // PegarOnCloseUpEnComboBox(GBMadreBiologica);
 // PegarOnCloseUpEnComboBox(GBMadreReceptora);
 // PegarOnCloseUpEnComboBox(GBPadres);
  ActivarQueriesPropios;
  FIdAux := IBQGenIDAux.FieldValues['IDAUX'];
  FIdAuxPE :=IBQGenIDAuxPE.FieldValues['IDAUXPE'];
  IBQGenIDAux.Close;
  IBQGenIDAuxPE.Close;
  FrameSeleccionGrupos.IBQDisponibles.ParamByName('establecimiento').AsInteger :=FPrincipal.EstablecimientoActual;
  FrameSeleccionGrupos.ActualizarLosQuery;
  FrameSeleccionGrupos.ControlarBotones;
 { FrameSeleccionPadres.DesActivarQuery;
  FrameSeleccionPadres.ControlarBotones;}
  DMSoftvet.IBQRaza.Close;
  DMSoftvet.IBQRaza.Open;
  DMSoftvet.IBQActividad.Close;
  DMSoftvet.IBQActividad.Open;  
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value :=FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('ESTABLECIMIENTO').Value :=FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('ESTA').Value :=FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  DMSoftvet.IBQCUIGActual.Close;
  DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQCUIGActual.Open;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value := 'DP';
  DMSoftvet.IBQCodigosGenericos.Open;
  DiasPeso := 'G'; //Predeterminado como peso general
  DMSoftvet.IBQCategorias.Close;
  DMSoftvet.IBQCategorias.Open;
  IBQColor.Close;
  IBQColor.Open;
  IBQColor.Last;
  IBQColor.First;
  DMSoftvet.IBQTipoAlta.Open;
  BorrarTablasAuxiliares;
  (*seteo inicial de fechas*)
  DTPAFechaNac.Date := now;
  DTPAFechaEve.Date := now;

 {if (FTipoAlta = 0) then
  begin
   DTPAFechaEve.MaxDate:= now;
   DTPAFechaNac.MaxDate := now;
  end;  }
  if not(CargaOtro) then
  begin
    //DTPAFechaEve.Date := now;
    {DTPAFechaNac.MaxDate := now;
    if (DTPAFechaEve.MinDate >= DTPAFechaNac.Date) then
     DTPAFechaEve.MinDate := dateOf(DTPAFechaNac.Date);}
  end;
  (*Mensaje Inicial del la Barra de Estado*)
  self.PublicarMensaje('La Fecha de Ingreso del Animal debe ser Menor a la Fecha de Nacimietno del mismo');
  ClearComponentes();

  /////////////////// Antes en InicioShow

  InicioShow;

end;

procedure TFEveAltaDirecta.FormCreate(Sender: TObject);
begin
  inherited;
  InicioCreate();
end;

procedure TFEveAltaDirecta.BorrarTablasAuxiliares;
begin
  BorrarAuxPadres;
  IBQLimpiarTablasAux.Close;
  IBQLimpiarTablasAux.Open;
  FPrincipal.IBTPrincipal.CommitRetaining;
end;


procedure TFEveAltaDirecta.SetNullCombos(Sender: TObject);
var ind:integer;
begin
 for ind := 0 to TGroupBox(Sender).ControlCount - 1 do
  begin
    if (TGroupBox(Sender).Controls[ind] is TDBLookupComboBox) then
      TDBLookupComboBox(TGroupBox(Sender).Controls[ind]).KeyValue := Null
    else
      if (TGroupBox(Sender).Controls[ind] is TDBLookupComboBoxAuto) then
        TDBLookupComboBoxAuto(TGroupBox(Sender).Controls[ind]).KeyValue := Null;
  end;
end;

procedure TFEveAltaDirecta.ActualizarPadres;
begin
  {IBQPadresExt_Int.Close;
  IBQPadresExt_Int.ParamByName('tipocarga').AsInteger :=FTipoCArga;// incluye padres internos (Union de Padres Internos y Externos)
  IBQPadresExt_Int.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPadresExt_Int.ParamByName('fecha').AsDate := IncMonth(DTPAFechaNac.Date,-9);
  IBQPadresExt_Int.Open;}
end;

procedure TFEveAltaDirecta.AcomodarPanelPorRaza;
var
  I : Integer;
begin
  I := DBLCBARaza.KeyValue;
  GBDatosEve.Height := 139;
  if I in [12,28,11,10,5] then
  begin
    GBDatosEve.Height := 174;
    if I <> 5 then
    begin
      LInspeccion.Visible := true;
      LDestino.Visible := true;
      DBLCBAInspeccion.Visible := true;
      DBLCBADestCabania.Visible := true;
    end
    else
    begin
      LInspeccion.Visible := false;
      LDestino.Visible := false;
      DBLCBAInspeccion.Visible := false;
      DBLCBADestCabania.Visible := false;
    end;
    LMocho.Visible := true;
    DBLCBAMocho.Visible := true;
  end;
end;

procedure TFEveAltaDirecta.ConfigurarPorRaza;
begin
  EAIdRA.Visible := false;
  LRA.Visible := false;
  EAIdPC.Top := 96;
  LPC.Top := 96;
  case DBLCBARaza.KeyValue of
    2,3: begin       //Angus
          LPC.Visible := true;
          EAIdPC.Visible := true;
          LPC.Caption := Traducir('PC:');
         end;
    12,28: begin    //Brangus
            LPC.Visible := true;
            EAIdPC.Visible := true;
            LPC.Caption := Traducir('AAB:');
           end;
    11: begin       //Braford
          LPC.Visible := true;
          EAIdPC.Visible := true;
          LPC.Caption := Traducir('ABA:');
          LRA.Visible := true;
          EAIdRA.Visible := true;
          LPC.Top := 64;
          EAIdPC.Top := 64;
          LRA.Caption := Traducir('UBB:');
        end;
    10: begin     //Brahman
          LPC.Visible := true;
          EAIdPC.Visible := true;
          LPC.Caption := Traducir('RGB:');
        end;
    else
    begin
      LPC.Visible := false;
      EAIdPC.Visible := false;
      LRA.Visible := false;
      EAIdRA.Visible := false;
    end;
  end;
  AcomodarPanelPorRaza
end;

procedure TFEveAltaDirecta.InicioShow;
begin
  FTipoAlta:= 0;
  ComponentesVisiblesPorPais(FPrincipal.Pais);
  //HabilitarPanel(PHabilitarMadreR,false);
 // HabilitarPanel(FrameSeleccionPadres.PBotones,false);
  AsignarValoresDefecto(GBDatosParticulares);
  AsignarValoresDefecto(GBDatosEve);
  AsignarValoresDefecto(GBestadoHembras);
  DBLCBAGDR.AsignarValorDefecto;
  //CategoriaSegunSexo;
  //SetNullCombos(GBMadreReceptora);
  //SetNullCombos(GBMadreBiologica);
  //SetNullCombos(GBPadres);
  HabilitarSegunSexo;
  //MostrarRA;
  FTipoCArga := DBLCBATipoAlta.GetDato;
  DBLCBATipoAltaCloseUp(nil);
  //FrameSeleccionPadres.IBQSeleccionados.Open;
  DBLCBACronologiaD.AsignarValorDefecto;
  DMSoftvet.IBQPotrerosSinServicio.Close;
  DMSoftvet.IBQPotrerosSinServicio.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrerosSinServicio.Open;
  if not (DMSoftvet.IBQPotrerosSinServicio.IsEmpty)then
     DBLCBAPotrero.AsignarValorDefecto;
  DBLCBARodeo.AsignarValorDefecto;
  {IBQPadresExt_Int.Close;
  IBQPadresExt_Int.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQPadresExt_Int.ParamByName('tipocarga').AsInteger := FTipoCArga;
  IBQPadresExt_Int.Open;} //esto esta repetido en DBLCBATipoAltaCloseUp(nil); y entonces se repiten las rp de animales externos
  controlCondicionCorporal;
  {DBLCBASexo.KeyValue:= 2;
  DBLCBASexoClick(nil);}
  CargaOtro:= false;

  IBQAuxAnimales.Close;
  IBQAuxAnimales.Open;

  DMSoftvet.IBQCodCriador.Close;
  DMSoftvet.IBQCodCriador.Open;
  DMSoftvet.IBQCodDestino.Close;
  DMSoftvet.IBQCodDestino.Open;
  DMSoftvet.IBQCodPropietario.Close;
  DMSoftvet.IBQCodPropietario.Open;

  {IBDSAuxAnimales.Close;
  IBDSAuxAnimales.Open;}

  DBLCBACategoriaCloseUp(nil);
  Lr.Visible:= false;
  EAEncabezadoReidentificacion.Visible:= false;
  EAUltimoIdentReidentificacion.Visible:= false;
  EVerificadorReidentificacion.Visible:= false;

  //ChkBPadresMultiples.Checked := false;
  //ChkBPadresMultiplesClick(nil);
  CargarSubCategoriasporRaza();
  DMSoftvet.IBQCodigosManejo.Close;
  DMSoftvet.IBQCodigosManejo.Open;
  LFechaEvento.Hint:= DTPAFechaEve.Hint;

 { if not (Owner is TFABMPadresExternos) then
    ClearComponentes;}
  ConfigurarPorRaza;
  DBLCBARaza.KeyValue := 29;
  DBLCBARazaCloseUp(nil);
end;

procedure TFEveAltaDirecta.FormShow(Sender: TObject);
begin
  inherited;
 // InicioShow();
  //DTPAFechaNacChange(nil);
  RPMadreBio := '%';
  RPMadreRec := '%';
  //DecimalSeparator:='.';
  TSHMadres.TabVisible := FPrincipal.FuncGenealogia;
  TSHPadres.TabVisible := FPrincipal.FuncGenealogia;
  LSubCategoria.Visible := FPrincipal.FuncActividad;
  DBLCBASubCategoria.Visible := FPrincipal.FuncActividad;
  LActividad.Visible := FPrincipal.FuncActividad;
  DBLCBAActividad.Visible := FPrincipal.FuncActividad;
  LOrigen.Visible := FPrincipal.FuncActividad;
  DBLCBAOrigen.Visible := FPrincipal.FuncActividad;
  LCriador.Visible := FPrincipal.FuncActividad;
  DBLCBACriador.Visible := FPrincipal.FuncActividad;
  LPropietario.Visible := FPrincipal.FuncActividad;
  DBLCBAPropietario.Visible := FPrincipal.FuncActividad;
  SBPropietarios.Visible := FPrincipal.FuncActividad;
  LCodigoManejo.Visible := FPrincipal.FuncActividad;
  DBLCBACodigoManejo.Visible := FPrincipal.FuncActividad;
  LInspeccion.Visible := FPrincipal.FuncActividad;
  DBLCBAInspeccion.Visible := FPrincipal.FuncActividad;
  LMocho.Visible := FPrincipal.FuncActividad;
  DBLCBAMocho.Visible := FPrincipal.FuncActividad;
  LDestino.Visible := FPrincipal.FuncActividad;
  DBLCBADestCabania.Visible := FPrincipal.FuncActividad;
  CBADN.Visible := FPrincipal.FuncActividad;
  EAADN.Visible := FPrincipal.FuncActividad;
  CBSanguinea.Visible := FPrincipal.FuncActividad;
  EASanguinea.Visible := FPrincipal.FuncActividad;
  LIdentificacionElectronica.Visible := FPrincipal.FuncCaravanasElectronicas;
  EAIdentificacionElectronica.Visible := FPrincipal.FuncCaravanasElectronicas; 
end;


procedure TFEveAltaDirecta.MostrarRA;
begin
  DMSoftvet.IBQParamEstablecimiento.Close;
  DMSoftvet.IBQParamEstablecimiento.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQParamEstablecimiento.Open;
  if(DMSoftvet.IBQParamEstablecimiento.Locate('PARAMETRO',1,[]))then
    if(DMSoftvet.IBQParamEstablecimiento.FieldValues['valor'] = 'N')then
    begin
        EAIdRA.Visible := False;
        LRA.Visible := False;
        EAIdPC.Top := 96;
        LPC.Top := 96;
    end;
end;



(*
  Activa los Queries propios del formulario
*)
procedure TFEveAltaDirecta.ActivarQueriesPropios;
begin
  IBQGenIDAuxPE.Close;
  IBQGenIDAuxPE.Open;
  IBQGenIDAux.Close;
  IBQGenIDAux.Open;
 { IBQMadreB.Close;
  IBQMadreB.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQMadreB.Open;
  IBQMadreR.Close;
  IBQMadreR.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQMadreR.Open;
  IBQMadresInternas.Close;
  IBQMadresInternas.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
//  IBQMadresInternas.ParamByName('fecha').AsDate := DTPAFechaNac.Date;
  IBQMadresInternas.Open;  }
  
end;

(*
  Metodos para carga de parametros de reglas del negocio y SP Carga del Evento
*)
procedure TFEveAltaDirecta.CargarParametrosRN;
begin
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;

  if(trim({EAIdRP.Text}IDRp) = '')then IBQSPRN.ParamByName('RP').Value := null
  else  IBQSPRN.ParamByName('RP').Value := trim({EAIdRP.Text}IDRp);

  if(trim(EAIdSenasa.Text) = '')then IBQSPRN.ParamByName('SENASA').Value := null
  else  IBQSPRN.ParamByName('SENASA').AsString := CompletarDigitosSenasa(EAIdSenasa.Text);

  if(trim(EAIdPC.Text) = '')then IBQSPRN.ParamByName('PC').Value := null
  else IBQSPRN.ParamByName('PC').AsString := trim(EAIdPC.Text);

  if(trim(EAIdHBA.Text) = '')then IBQSPRN.ParamByName('HBA').Value := null
  else IBQSPRN.ParamByName('HBA').AsString:= trim(EAIdHBA.Text);

  if(trim(EAIdRA.Text) = '')then IBQSPRN.ParamByName('RA').Value := null
  else IBQSPRN.ParamByName('RA').AsString := trim(EAIdRA.Text);

  if(trim(EAOtro.Text) = '')then IBQSPRN.ParamByName('OTRO').Value := null
  else  IBQSPRN.ParamByName('OTRO').AsString := trim(EAOtro.Text);

  if(trim(EAIdentificacionElectronica.Text) = '')then IBQSPRN.ParamByName('IE').Value := null
  else  IBQSPRN.ParamByName('IE').AsString := trim(EAIdentificacionElectronica.Text);

  IBQSPRN.ParamByName('EDAD').Value := MonthsBetween(DTPAFechaEve.Date,DTPAFechaNac.Date);

  if (trim(EAPeso.Text) = '' ) then IBQSPRN.ParamByName('PESO').Value := null
  else IBQSPRN.ParamByName('PESO').Value := StrToFloat(trim(EAPeso.Text));

 { if (DBLCBASexo.Text = 'MACHO') then IBQSPRN.ParamByName('CANT_PARTOS').Value := null
  else IBQSPRN.ParamByName('CANT_PARTOS').Value := StrToInt(EAEstadoLactacion.Text);}

  if (DMSoftvet.IBQSexo.FieldByName('sexo').AsInteger = 1) then
    IBQSPRN.ParamByName('CANT_PARTOS').Value := null
  else
    IBQSPRN.ParamByName('CANT_PARTOS').Value := StrToInt(EAEstadoLactacion.Text);

  IBQSPRN.ParamByName('CATEGORIA').Value := DBLCBACategoria.KeyValue;
  IBQSPRN.ParamByName('SEXO').Value := DBLCBASexo.KeyValue;
  IBQSPRN.ParamByName('ESTADO_REP').Value := DBLCBAEstadoR.KeyValue;
  IBQSPRN.ParamByName('FECHA_NAC').AsDate := DTPAFechaNac.Date;
  IBQSPRN.ParamByName('DIASPESO').Value := DiasPeso;
  IBQSPRN.ParamByName('FECHA_EVE').AsDate := DTPAFechaEve.Date;

  IBQSPRN.ParamByName('ACTIVIDAD').Value := DBLCBAActividad.KeyValue;

  IBQSPRN.ParamByName('SUBCATEGORIA').Value := DBLCBASubCategoria.KeyValue;

  IBQSPRN.ParamByName('RAZA').Value := DBLCBARaza.KeyValue;

  if (DBLCBAActividad.KeyValue = 3) then
     IBQSPRN.ParamByName('CODIGOMANEJO').AsInteger := DBLCBACodigoManejo.GetDato
   else
      IBQSPRN.ParamByName('CODIGOMANEJO').AsInteger := 0;

  if (trim(EACircunferenciaE.Text) = '') then
    IBQSPRN.ParamByName('CIRCUNFERENCIA').Value := null
   else
     IBQSPRN.ParamByName('CIRCUNFERENCIA').Value := StrToFloat(Trim(EACircunferenciaE.Text));
end;

procedure TFEveAltaDirecta.CargarParametrosSP;
var
  senasa : String;
  val_D : Double;
  I : Integer;
begin
  IBQGenIDAnimal.Close;
  IBQGenIDAnimal.Open;


  if (Trim({EAIdRP.Text}IDRp) <> '') then
     IBQSPEventoInd.ParamByName('ID_RP').Value := IDRp//EAIdRP.GetDato
   else
       IBQSPEventoInd.ParamByName('ID_RP').Value := null;

  IBQSPEventoInd.ParamByName('IDNUEVOANIMAL').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];

  Senasa := ' ';
  if (RBCUIGSenasa.Checked) then
    senasa := EAEncabezado.Text+EAUltimoIdent.Text
  else
    if (RBSenasa.Checked) and (trim(EAIdSenasa.Text)<>'') then
      senasa := CompletarDigitosSenasa(EAIdSenasa.GetDato)
     else
       if (RBReidentificacionSenasa.Checked) then
         senasa:= 'R' + EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text;

  IBQSPEventoInd.ParamByName('ID_SENASA').Value := senasa;

  if (RBCUIGSenasa.Checked) then
    ActualizarCUIG(EAEncabezado.Text);

  IBQSPEventoInd.ParamByName('FECHA_NACIMIENTO').Value := DTPAFechaNac.GetDato;

  IBQSPEventoInd.ParamByName('PESO').Value := EAPeso.GetDato;
 { if(FTipoCArga <> 3)then
  begin

    if(FrameSeleccionPadres.DSSeleccionados.DataSet.RecordCount = 1)then
    begin
      self.ChkBPadresMultiples.Checked := false;
      self.ChkBPadresMultiplesClick(self);
    end;

    if not(ChkBPadresMultiples.Checked)and (DBLCBARPPadre.KeyValue <> null)then
      IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := null//DSAuxAnimales.DataSet.FieldValues['id_animal']
    else
       if (DBLCBARPPadre.KeyValue = null) then
          IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := null;

  end
  else
  begin

     if(DSAuxAnimales.DataSet.FieldValues['V1'] = 'N')and not(ChkBPadresMultiples.Checked)and (DBLCBARPPadre.KeyValue <> null)then
        IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := null//DSAuxAnimales.DataSet.FieldValues['id_animal']//DBLCBARPPadre.GetDato
     else
        if(DSAuxAnimales.DataSet.FieldValues['V1'] = 'S')and not(ChkBPadresMultiples.Checked)and (DBLCBARPPadre.KeyValue <> null)then
          IBQSPEventoInd.ParamByName('PADRE_INTERNO').Value := null;//DSAuxAnimales.DataSet.FieldValues['id_animal'];//DBLCBARPPadre.GetDato;

     if (DBLCBARPPadre.KeyValue = null) then
       begin
        IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := null;
        IBQSPEventoInd.ParamByName('PADRE_INTERNO').Value := null;
       end;

  end; }

  IBQSPEventoInd.ParamByName('PADRE_INTERNO').Value := null;
  if ((id_padre <> -1) and (TipoPadre = 'INTERNO')) then
    IBQSPEventoInd.ParamByName('PADRE_INTERNO').Value := id_padre
  else
    IBQSPEventoInd.ParamByName('PADRE_INTERNO').Value := null;

  IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := null;
  if ((id_padre <> -1) and (TipoPadre = 'EXTERNO')) then
    IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := id_padre
  else
    IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := null;

  {Carga de Madres Internas}
  IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := null;
  if ((id_madreB <> -1) and (TipoMadreB = 'INTERNA')) then
    IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := id_madreB
  else
    IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := null;

  IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_INTERNA').Value := null;
  if ((id_madreR <> -1) and (TipoMadreR = 'INTERNA')) then
      IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_INTERNA').Value := id_madreR
  else
      IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_INTERNA').Value := null;

  {Carga de Madres Externas}
  IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := null;
  if ((id_madreB <> -1) and (TipoMadreB = 'EXTERNA')) then
    IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := id_madreB
  else
    IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := null;

  IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := null;
  if ((id_madreR <> -1) and (TipoMadreR = 'EXTERNA')) then
    IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := id_madreR
  else
    IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := null;


  if DBLCBASexo.GetDato = 2 then
  begin
    if (Trim(EAEstadoLactacion.Text) <> '') then
      IBQSPEventoInd.ParamByName('ESTADO_LACTACION').Value := EAEstadoLactacion.GetDato
    else
      IBQSPEventoInd.ParamByName('ESTADO_LACTACION').Value:= 0;
  end
  else
    IBQSPEventoInd.ParamByName('ESTADO_LACTACION').Value:= null;

  IBQSPEventoInd.ParamByName('RODEO').Value := DBLCBARodeo.GetDato;
  IBQSPEventoInd.ParamByName('RAZA').Value := DBLCBARaza.GetDato;

  if (Trim(EADta.Text) <> '') then
    IBQSPEventoInd.ParamByName('DTA').Value := trim(EADta.Text)
   else
     IBQSPEventoInd.ParamByName('DTA').Value := null;

  IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBAPotrero.GetDato;
  IBQSPEventoInd.ParamByName('CATEGORIA').Clear;
  IBQSPEventoInd.ParamByName('CATEGORIA').Value := DBLCBACategoria.GetDato;
  IBQSPEventoInd.ParamByName('CRONOLOGIA_DENTARIA').Value := DBLCBACronologiaD.GetDato;
  IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := DBLCBACondicionC.GetDato;
  IBQSPEventoInd.ParamByName('GDR').Value :=DBLCBAGDR.GetDato;
  if (DBLCBACategoria.GetDato = 1) or (DBLCBACategoria.GetDato = 3) then // solo toro o ternero
  begin
    if TryStrToFloat(EACircunferenciaE.Text,val_d) then
      IBQSPEventoInd.ParamByName('CIRCUNFERENCIA_ESCROTAL').Value := val_d//EACircunferenciaE.GetDato;
    else
      IBQSPEventoInd.ParamByName('CIRCUNFERENCIA_ESCROTAL').Value := null;
  end;
  IBQSPEventoInd.ParamByName('ESTADO_REPRODUCTIVO').Value := DBLCBAEstadoR.GetDato;

  if (Trim(EAIdPC.Text) <> '') then
    IBQSPEventoInd.ParamByName('ID_PC').Value  := EAIdPC.GetDato
   else
     IBQSPEventoInd.ParamByName('ID_PC').Value  := null;

  if (Trim(EAIdHBA.Text) <> '') then
    IBQSPEventoInd.ParamByName('ID_HBA').Value := EAIdHBA.GetDato
   else
     IBQSPEventoInd.ParamByName('ID_HBA').Value := null;

  if (Trim(EAIdRA.Text) <> '') then
    IBQSPEventoInd.ParamByName('ID_RA').Value  := EAIdRA.GetDato
   else
      IBQSPEventoInd.ParamByName('ID_RA').Value  := null;

  if (Trim(EAOtro.Text) <> '') then
    IBQSPEventoInd.ParamByName('ID_OTRO').Value:= EAOtro.GetDato
   else
     IBQSPEventoInd.ParamByName('ID_OTRO').Value:= null;

  if (Trim(EAIdentificacionElectronica.Text) <> '') then
    IBQSPEventoInd.ParamByName('ID_IE').Value:= EAIdentificacionElectronica.GetDato
   else
      IBQSPEventoInd.ParamByName('ID_IE').Value:= null;

  if (Trim(EANombre.Text) <> '') then
    IBQSPEventoInd.ParamByName('NOMBRE').Value := EANombre.GetDato
   else
     IBQSPEventoInd.ParamByName('NOMBRE').Value := null;

  if (Trim(EAApodo.Text) <> '') then
    IBQSPEventoInd.ParamByName('APODO').Value := EAApodo.Text
   else
      IBQSPEventoInd.ParamByName('APODO').Value := null;

  IBQSPEventoInd.ParamByName('SEXO').Value := DBLCBASexo.GetDato;
  IBQSPEventoInd.ParamByName('FECHA_EVENTO').Value := DTPAFechaEve.GetDato;
  IBQSPEventoInd.ParamByName('TIPO_ALTA').Value := DBLCBATipoAlta.GetDato;


  if ((DBLCBACategoria.KeyValue = 1) and (CBCastrado.Checked)) then
    IBQSPEventoInd.ParamByName('CASTRADO').Value := 1;

  if (Trim(EAPrecioB.Text) <> '') then
    IBQSPEventoInd.ParamByName('PRECIO_BRUTO').AsFloat := StrToFloat(EAPrecioB.Text)
  else
      IBQSPEventoInd.ParamByName('PRECIO_BRUTO').AsFloat := 0;

  if (Trim(EAPrecioU.Text) <> '') then
    IBQSPEventoInd.ParamByName('PRECIO_UNITARIO').asFloat := StrToFloat(EAPrecioU.Text)
  else
      IBQSPEventoInd.ParamByName('PRECIO_UNITARIO').asFloat := 0;

  IBQSPEventoInd.ParamByName('OBSERVACION').Value  := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value  := DBLCBAResponsable.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value  := 1;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  IBQSPEventoInd.ParamByName('ID_AUX').Value := FIdAux;
  IBQSPEventoInd.ParamByName('ID_AUXPE').Value := FIdAuxPE;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := NULL;
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := NULL;

  if ((DBLCBAActividad.KeyValue <> 0) and (DBLCBAActividad.KeyValue <> null)) then
  begin
    IBQSPEventoInd.ParamByName('ACTIVIDAD').Value := DBLCBAActividad.KeyValue;
    IBQSPEventoInd.ParamByName('SUBCATEGORIA').Value := DBLCBASubCategoria.KeyValue;
  end
  else
  begin
    IBQSPEventoInd.ParamByName('ACTIVIDAD').Value := null;
    IBQSPEventoInd.ParamByName('SUBCATEGORIA').Value := null;
  end;

  if (DBLCBAActividad.KeyValue = 3) then
    IBQSPEventoInd.ParamByName('CODIGOMANEJO').Value := DBLCBACodigoManejo.KeyValue
   else
     IBQSPEventoInd.ParamByName('CODIGOMANEJO').Value := 0;

  if (Trim(EAValor.Text) <> '') then IBQSPEventoInd.ParamByName('GASTOS').AsFloat := StrToFloat(EAValor.Text)
  else IBQSPEventoInd.ParamByName('GASTOS').AsFloat := 0;
  IBQSPEventoInd.ParamByName('DIASPESO').Value := DiasPeso;

  if Trim(EAADN.Text)<>'' then IBQSPEventoInd.ParamByName('ADN').AsString := Trim(EAADN.Text) else IBQSPEventoInd.ParamByName('ADN').Value := null;
  if Trim(EASanguinea.Text)<>'' then IBQSPEventoInd.ParamByName('TipificacionSanguinea').AsString := Trim(EASanguinea.Text) else IBQSPEventoInd.ParamByName('TipificacionSanguinea').Value:=null;
  IBQSPEventoInd.ParamByName('Propietario').Value := 0;//DBLCBAPropietario.KeyValue;
  IBQSPEventoInd.ParamByName('Criador').Value := DBLCBACriador.KeyValue;
  IBQSPEventoInd.ParamByName('Origen').Value := DBLCBAOrigen.KeyValue;
  if DBLCBAColor.Visible then
    IBQSPEventoInd.ParamByName('Color').Value := DBLCBAColor.KeyValue
  else
    IBQSPEventoInd.ParamByName('Color').Value := 0;


  ///estos campos se cargan solo por raza, si no pertenecen a alguna de las razas se cargan como null
  I := DBLCBARaza.KeyValue;
  if I in [12,28,11,10,5] then
  begin
    IBQSPEventoInd.ParamByName('inspeccion').AsInteger := DBLCBAInspeccion.KeyValue;
    IBQSPEventoInd.ParamByName('destino').AsInteger := DBLCBADestCabania.KeyValue;
    IBQSPEventoInd.ParamByName('mocho').AsInteger := DBLCBAMocho.KeyValue;
  end
  else
  begin
    IBQSPEventoInd.ParamByName('inspeccion').Value:= null;
    IBQSPEventoInd.ParamByName('destino').Value := null;
    IBQSPEventoInd.ParamByName('mocho').Value := null;
  end;

end;

(*
  Metodos que son pegados en el evento ONEXIT de aquellos complenetes que necesita realizar un calculo
*)
procedure TFEveAltaDirecta.HandlerOnExitRP;
begin
   if({EAIdRP.Text}IDRP = 'N/N') and ({EAIdRP.Enabled}EARpInicial.Enabled = true)then
   begin
      MostrarMensaje(tmError,'El RP N/N esta reservado por HUELLA.');
      {EAIdRP.Text := '';
      EAIdRP.SetFocus;}
      EAPrefijo.Text := '';
      EASufijo.Text := '';
      EARpInicial.Text := '';
   end;

   if Length(IDRp) > 10 then
   begin
    MostrarMensaje(tmError,'El identificador RP no puede superar los 10 caracteres');
    EAPrefijo.Text := '';
    EASufijo.Text := '';
   end;

  if(({EAIdRP.GetDato}IDRp <> '')and(EANombre.GetDato = ''))or(RpyNombre)then
  begin
    EANombre.Text := {EAIdRP.GetDato}IDRp;
    RpyNombre := true;
  end;

  ControlEventoOnExit(self);
end;

procedure TFEveAltaDirecta.HandlerOnExitSenasa;
begin
  if((EAIdSenasa.GetDato<> '') and ({EAIdRP.GetDato}IDRp = ''))or (({EAIdRP.GetDato}IDRp <> '')and(RpySenasa)) then
  begin
    EAIdSenasa.Text := CompletarDigitosSenasa(EAIdSenasa.GetDato);
    {EAIdRP.Text := EAIdSenasa.GetDato;} EARpInicial.Text := EAIdSenasa.Text;
    RpySenasa := true;
    //EAIdRP.OnExit(self);
 end;
 if(EANombre.GetDato = '')then
  begin
    EANombre.Text := IDRp;//EAIdRP.GetDato;
    RpyNombre := true;
  end;
  ControlEventoOnExit(self);
end;


procedure TFEveAltaDirecta.ChkBMadreReceptoraClick(Sender: TObject);
begin
  inherited;
  if(ChkBMadreReceptora.Checked)then
  begin
    if(DBLCBATipoAlta.KeyValue = 3)then
    begin
      IBQMadresInternas.Close;
      IBQMadresInternas.ParamByName('establecimiento').AsInteger :=FPrincipal.EstablecimientoActual;
//      IBQMadresInternas.ParamByName('fecha').AsDate := DTPAFechaNac.Date;//IncMonth(DTPAFechaNac.Date,-20);
      IBQMadresInternas.Open;
      ClearListSource(GBMadreReceptora,DSMadresInternas);
      HabilitarPanel(PHabilitarMadreR,true);
      SBMadreR.Enabled := false;
     end
     else
     begin
       ClearListSource(GBMadreReceptora, DSMadreReceptora);
       HabilitarPanel(PHabilitarMadreR,true);
       SBMadreR.Enabled := true;       
       SBMadreR.Font.Size:= 8;
       SBMadreR.Font.Style := [];
     end;
     PegarOnCloseUpEnComboBox(GBMadreReceptora);
   end
   else
   begin
    HabilitarPanel(PHabilitarMadreR,false);
    ClearListSource(GBMadreReceptora, nil);
   end;
  ControlEventoOnExit(self);
end;

(*
  llama al metodo habilitar del padre (PARA PODER CARGAR VARIOS PADRES)
*)

procedure TFEveAltaDirecta.ChkBPadresMultiplesClick(Sender: TObject);
begin
inherited;
end;

(*
  Llama al ABM Padres Externos para adicionar un nuevo animal
*)
procedure TFEveAltaDirecta.SBMadreBClick(Sender: TObject);
var Iabm:IButtonABM;
begin
  inherited;

end;

procedure TFEveAltaDirecta.SBMadreRClick(Sender: TObject);
var Iabm: IButtonABM;
begin
  inherited;

end;

procedure TFEveAltaDirecta.SBPadreClick(Sender: TObject);
var Iabm: IButtonABM;
    form:TFABMPadresExternos;
    rpAux: String;
begin
  inherited;
  try
    form :=TFABMPadresExternos.Create(self);
    Iabm := IButtonABM(form);
    Iabm.IFitrate(1,FPrincipal.EstablecimientoActual);
    Iabm.ISetCampoRetorno('KeyValue');
    Iabm.IAbrir(faElegir); (*tambien llama al ShowModal*)
    BorrarAuxPadres;
    // rehacemos la tabla aux_animales que es la uniion de los posibles padres int y ext
    BorrarTablasAuxiliares();
    ActualizarPadres();


    if nroID>-1 then
    begin
        ///rpAux := IBQPadresExt_Int.Lookup('ID',nroID,'ID_RP');
        IBQPadresExt_Int.Locate('ID',nroID,[]);
        rpAux := IBQPadresExt_Int.FieldValues['ID_RP'];
        nroID:=-1;
    end;

    //rpAux := VarToStr(Iabm.IValorRetorno);

    if (Length(rpAux) > 0) then
      begin
        rpAux := rpAux+'N';
        ActualizarDatosPadres(rpAux);
        DBLCBARPPadreClick(DBLCBARPPadre);
      end;
    //IBDSAuxAnimales.close;
    //IBDSAuxAnimales.Open;
//    ControlEventOnCloseUp(DBLCBARPPadre);//>>>>>>>
  except
    MostrarMensaje(tmError, 'No se pudo abrir el formulario de animales externos');
  end;
//   BorrarTablasAuxiliares();
end;

(*
  Uso del frame Seleccion para asignar Grupos y Padres
*)
procedure TFEveAltaDirecta.SeleccionarUnGrupo;
begin
  FrameSeleccionGrupos.IBQSeleccionados.insert;
  FrameSeleccionGrupos.IBQSeleccionados.FieldByName('ID_AUX').Value := FIdAux;
  FrameSeleccionGrupos.IBQSeleccionados.FieldByName('GRUPO').Value  := FrameSeleccionGrupos.IBQDisponibles.FieldByName('ID_GRUPO').Value;
  FrameSeleccionGrupos.IBQSeleccionados.FieldByName('NOMBRE').Value := FrameSeleccionGrupos.IBQDisponibles.FieldByName('NOMBRE').Value;
end;

procedure TFEveAltaDirecta.SeleccionarUnPadre;
begin

 end;


procedure TFEveAltaDirecta.FrameSeleccionGruposBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccionGrupos.OnSelectItem := SeleccionarUnGrupo;
  FrameSeleccionGrupos.BBAgregarUnoClick(Sender);
end;

procedure TFEveAltaDirecta.FrameSeleccionGruposBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccionGrupos.OnSelectItem := SeleccionarUnGrupo;
  FrameSeleccionGrupos.BBAgregarTodosClick(Sender);
end;

procedure TFEveAltaDirecta.FrameSeleccionGruposIBQSeleccionadosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameSeleccionGrupos.IBQSeleccionados.ParamByName('idaux').Value := FIdAux;
end;

procedure TFEveAltaDirecta.FrameSeleccionGruposIBQDisponiblesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameSeleccionGrupos.IBQDisponibles.ParamByName('idaux').Value := FIdAux;
end;

procedure TFEveAltaDirecta.ATerminarExecute(Sender: TObject);
var meses, dias, diasMes : integer;
begin
   diasMes:= 30;

   if (FTipoAlta = 0) then
     dias := DaysBetween(DTPAFechaEve.Date, DTPAFechaNac.Date)
    else
      if (FTipoAlta = 1) then
        dias := DaysBetween(Now(), DTPAFechaNac.Date); // esto se hace porque cuando se modifica un animal verifica la edad con la categoria y tiene que tener la edad actual

   meses := dias div diasMes;

   if (DBLCBACategoria.KeyValue = 6) and ((EAEstadoLactacion.Text = '') or (EAEstadoLactacion.Text = '0')) then
   begin
    if MostrarMensaje(tmConsulta,'Recuerda la cantidad de Partos?') = mrYes then
    begin
      PCBasico.ActivePage := TSHEstadoGeneral;
      EAEstadoLactacion.SetFocus;
      Exit;
    end
    else
      EAEstadoLactacion.Text := '1';
   end;
   
  if DTPAFechaNac.Date < DTPAFechaEve.Date then
  begin
  if ((EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____')) then
    if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
      if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
      begin
              CargaOtro:= True;
              inherited;
              if PuedeTerminar and (Owner is TFAbmPadresExternos) then
              begin
                CargaOtro := False;
                IBQCompraAnimal.Close;
                IBQCompraAnimal.ParamByName('id_externo').AsInteger := FIdAnimExterno;
                IBQCompraAnimal.ParamByName('id_interno').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];
                IBQCompraAnimal.ParamByName('sexo').AsInteger := DBLCBASexo.KeyValue;
                IBQCompraAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
                IBQCompraAnimal.Open;
              end;
              FPrincipal.IBTPrincipal.CommitRetaining;{hago commit de la transaccion principal}
              IBSPFIXRELANIMPADRESEXTCICLICO.ExecProc;
              IBSPCambiarCAtegoria.ExecProc;
      end
      else
      begin
          MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante.');
          EAUltimoIdent.SetFocus;
      end
    else
    begin
        MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante');
        EAEncabezado.SetFocus;
    end
  else
    if ((EAEncabezado.EditText = '_____') and (EAUltimoIdent.EditText = '____')) then
    begin
            CargaOtro:= True;
            inherited;
            if PuedeTerminar and (Owner is TFAbmPadresExternos) then
            begin
              IBQCompraAnimal.Close;
              IBQCompraAnimal.ParamByName('id_externo').AsInteger := FIdAnimExterno;
              IBQCompraAnimal.ParamByName('id_interno').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];
              IBQCompraAnimal.ParamByName('sexo').AsInteger := DBLCBASexo.KeyValue;
              IBQCompraAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
              IBQCompraAnimal.Open;
            end;
            FPrincipal.IBTPrincipal.CommitRetaining;{hago commit de la transaccion principal}
            IBSPFIXRELANIMPADRESEXTCICLICO.ExecProc;
            IBSPCambiarCAtegoria.ExecProc;
    end
    else
      if (EAEncabezado.EditText = '_____') then
      begin
          MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante');
          EAUltimoIdent.SetFocus;
      end
      else
      begin
            MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante.');
            EAEncabezado.SetFocus;
      end
  end
  else
    MostrarMensaje(tmError,'La fecha de Nacimiento no puede ser mayor a la fecha de Ingreso');

  if not(self is TFEveModifDatosAnimal) then
  begin
    if (IBQGenIDAnimal.FieldValues['IDANIMAL'] <> null) then
      ID_Animal := IBQGenIDAnimal.FieldValues['IDANIMAL']
    else
      ID_Animal := -1;
  end;

end;

procedure TFEveAltaDirecta.FrameSeleccionGruposBDBGSelecciondosCellClick(
  Column: TColumn);
begin
  inherited;
  FrameSeleccionGrupos.BDBGSeleccionadosCellClick(Column);
end;

procedure TFEveAltaDirecta.TSHObservacionShow(Sender: TObject);
begin
  inherited;
  MAObservacion.SetFocus;
end;


procedure TFEveAltaDirecta.DBLCBOtroMadreRExit(Sender: TObject);
begin
  inherited;
end;

(*
  Segun el sexo del Animal habilita o deshabilita los datos del Estado General segun corresponda
*)procedure TFEveAltaDirecta.HabilitarSegunSexo;
begin
  if(DMSoftvet.IBQSexo.FieldByName('sexo').Value = 1)then
  begin
    HabilitarGrupBox(GBEstadoMachos,true);
    HabilitarGrupBox(GBestadoHembras,false);
  end
   else
   begin
    HabilitarGrupBox(GBEstadoMachos,false);
    HabilitarGrupBox(GBestadoHembras,true);
   end;
end;


(*
  Llama a los metodos que tienen que actualizan valores segun las modificaciones de sexo
*)
procedure TFEveAltaDirecta.DBLCBASexoClick(Sender: TObject);
begin
  inherited;
   HabilitarSegunSexo;
   CategoriaSegunSexo;
end;

(*
  Filtra en las Posibles Categorias del Animal segun el Sexo del mismo
*)
procedure TFEveAltaDirecta.CategoriaSegunSexo;
begin
  {DMSoftvet.IBQCategAnimal.Close;
  DMSoftvet.IBQCategAnimal.ParamByName('sexo').Value := DMSoftvet.DSSexo.DataSet.FieldValues['sexo'];
  DMSoftvet.IBQCategAnimal.Open;
  DMSoftvet.IBQCategAnimal.First;  }

  {DMSoftvet.IBQCategorias.Close;
  DMSoftvet.IBQCategorias.Open;

  DBLCBACategoria.KeyValue := DMSoftvet.IBQCategAnimal.FieldValues['ID_CATEGORIA'];}
end;

(*
  Avanza al Proximo TABSHEET
*)
procedure TFEveAltaDirecta.FrameSeleccionGruposBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccionGrupos.BBEliminarUnoClick(Sender);

end;

procedure TFEveAltaDirecta.FrameSeleccionGruposBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccionGrupos.BBEliminarTodosClick(Sender);
end;

procedure TFEveAltaDirecta.EAIdRPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  RpySenasa := false;
  if (Key = #13) then
   if (EANombre.Enabled) then
     begin
       EANombre.SetFocus;
       EANombre.SelectAll;
       key:= #0;
     end;
end;

procedure TFEveAltaDirecta.EANombreChange(Sender: TObject);
begin
  inherited;
  RpyNombre := false;
end;

procedure TFEveAltaDirecta.DTPAFechaNacCloseUp(Sender: TObject);
begin
  inherited;
  //DTPAFechaEve.MinDate := DateOf(DTPAFechaNac.DateTime);
end;



procedure TFEveAltaDirecta.DBLCBATipoAltaCloseUp(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  inherited;
  {FTipoCArga := 3;

  cartel:= TCartel.getInstance();
  msje:= 'Cargando parámetros del animal ...';
  cartel.abrircartel(msje);
  //BorrarAuxPadres;


//  if (DBLCBATipoAlta.KeyValue = 3) then // Si el tipo de alta es 3 => las madres son internas
  if (FTipoCarga = 3) then
  begin
    IBQMadresInternas.Close;
    IBQMadresInternas.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
//    IBQMadresInternas.ParamByName('fecha').AsDate := DTPAFechaNac.Date;//IncMonth(DTPAFechaNac.Date,-20);
    IBQMadresInternas.Open;
    ClearListSource(GBMadreBiologica,DSMadresInternas);
    ControlEventOnCloseUp(DBLCBARPMadreB);
    FTipoCArga := 3;
    ClearListSource(GBPadres,nil);
  end
  else
     begin
        ClearListSource(GBMadreBiologica,DSMadreBiologica);
        SBMadreB.Enabled := true;
        FTipoCArga := 1;
        ClearListSource(GBPadres,nil);
     end;

  // Query con union para obtener tabla con posibles padres
  ActualizarPadres();
  ClearListSource(GBPadres,DSAuxAnimales);

  ChkBMadreReceptora.Checked := false;
  PegarOnCloseUpEnComboBox(GBPadres);
  PegarOnCloseUpEnComboBox(GBMadreBiologica);

  DBLCBARPPadre.KeyValue := null;
  DBLCBARPMadreR.KeyValue:= null;
  DBLCBARPMadreB.KeyValue:= null;

  ChkBPadresMultiples.Checked := false;
  ChkBPadresMultiplesClick(nil);

  cartel.cerrarcartel();
  cartel.FreeInstance();
  }
end;

procedure TFEveAltaDirecta.DBLCBACategoriaCloseUp(Sender: TObject);
begin
  inherited;
  case DBLCBACategoria.KeyValue of
    1,2,3 : DBLCBASexo.KeyValue := 1;
    4,5,6 : DBLCBASexo.KeyValue := 2;
  end;

  DBLCBASexoClick(nil);

  if(DMSoftvet.DSSexo.DataSet.FieldByName('sexo').Value = 2)and(DBLCBACategoria.KeyValue <> 6)then
  begin
   EAEstadoLactacion.Text := IntToStr(0);
   EAEstadoLactacion.Enabled := false;
  end
  else
  if(DMSoftvet.DSSexo.DataSet.FieldByName('sexo').Value = 2) then
    begin
      EAEstadoLactacion.Text := '0';
      EAEstadoLactacion.Enabled := true;
    end
   else
    begin
      EAEstadoLactacion.Text := '';
      EAEstadoLactacion.Enabled := false;
    end;
  if(DBLCBACategoria.KeyValue = 4)then
   begin
    DBLCBAEstadoR.KeyValue := 0;
    DBLCBAEstadoR.Enabled := false;
   end
  else
    begin
      DBLCBAEstadoR.KeyValue := 0;
      DBLCBAEstadoR.Enabled := true;
    end;  
  // dehabilito la circunferencia escrotal cuando es novillo
  if(DBLCBACategoria.KeyValue = 2)then
    begin
      EACircunferenciaE.Clear;
      EACircunferenciaE.Enabled := false;
    end
  else
    EACircunferenciaE.Enabled := true;

  // dehabilito la castración cuando es ternero
  if(DBLCBACategoria.KeyValue <> 1)then
    CBCastrado.Enabled := false
   else
     CBCastrado.Enabled := true;
end;

procedure TFEveAltaDirecta.PCBasicoChange(Sender: TObject);
begin
  inherited;
  TSHDatos.ImageIndex := 7;
  TSHMadres.ImageIndex := 8;
  TSHPadres.ImageIndex := 9;
  TSHEstadoGeneral.ImageIndex := 10;
  TSHUbicacion.ImageIndex := 11;
  TSHEconomia.ImageIndex := 12;
  TSHObservacion.ImageIndex := 13;

  if(PCBasico.ActivePage = TSHDatos)then
    TSHDatos.ImageIndex := 0;
  if(PCBasico.ActivePage = TSHMadres)then
    TSHMadres.ImageIndex := 1;
  if(PCBasico.ActivePage = TSHPadres)then
    TSHPadres.ImageIndex := 2;
  if(PCBasico.ActivePage = TSHEstadoGeneral)then
    TSHEstadoGeneral.ImageIndex := 3;
  if(PCBasico.ActivePage = TSHUbicacion)then
    TSHUbicacion.ImageIndex := 4;
  if(PCBasico.ActivePage = TSHEconomia)then
    TSHEconomia.ImageIndex := 5;
  if(PCBasico.ActivePage = TSHObservacion)then
    TSHObservacion.ImageIndex := 6;

  if(PCBasico.ActivePage = TSHDatos) then (*Mensajes de la Barra de Estado*)
       self.PublicarMensaje('La Fecha de Ingreso del Animal debe ser Menor a la Fecha de Nacimietno del mismo')
  else if(PCBasico.ActivePage = TSHMadres) then
  begin
    if(self.DBLCBATipoAlta.KeyValue = 3 )then
      PublicarMensaje('Por Seleccionar Carga inicial, Se Visualizaran solo Madres Internas')
    else PublicarMensaje('Se Visualizaran solo Madres Externas');
    DMSoftvet.IBQAfterOpen(DSMadreBiologica.DataSet); //despliega los combos de queries que no estan en el Modulo de Datos
    DMSoftvet.IBQAfterOpen(DSMadreReceptora.DataSet); //despliega los combos
  end
  else
  if(PCBasico.ActivePage = TSHPadres) then
  begin
    if(self.DBLCBATipoAlta.KeyValue = 3 )then
      PublicarMensaje('Por Seleccionar Carga inicial, Se Visualizaran Padres Internos y Externos')
    else
      PublicarMensaje('Se Visualizaran solo Padres Externos');
  end
  else
      PublicarMensaje('');
end;

procedure TFEveAltaDirecta.Salida(Sender: TObject);
var
  precio, porcentaje,valor: double;
  peso: double;
begin
    inherited;
    if not TryStrToFloat(EAPrecioB.Text,precio) then  precio := 0;
    if not TryStrToFloat(EAPeso.Text,peso) then  peso := 0;
    if not TryStrToFloat(EAPorcentaje.Text,porcentaje) then  porcentaje:=0;
    if not TryStrToFloat(EAValor.Text,valor) then  valor:=0;

    if ((precio <> 0) and (peso <> 0)) then
    begin
      EAPrecioU.Text:=FormatFloat('###0.00',(precio* peso));
      //EAPeso.Text:=FormatFloat('###0.00',StrToFloat(EAPeso.Text));
    end;

    if(precio<>0) then
      EAPrecioB.Text:=FormatFloat('###0.00',StrToFloat(EAPrecioB.Text));

    if(valor<>0) then
      EAValor.Text:=FormatFloat('###0.00',StrToFloat(EAValor.Text));

    if(porcentaje<>0) then
      EAPorcentaje.Text:=FormatFloat('###0.00',StrToFloat(EAPorcentaje.Text));
end;

procedure TFEveAltaDirecta.Numeros(Sender: TObject; var Key: Char);
var Separador : Char;
begin
  inherited;
   // if ((Key = #13)and (TEditAuto(Sender).Tag <> 61)) or ((Key = #13)and (TEditAuto(Sender).Tag = 61)and(TEditAuto(Sender).Text <> '0')) then
   //   Change(Sender);

  if (Key = #13) then
   if (EAPeso.Focused) then
    begin
      if (EAPrecioB.Enabled) then
        begin
           EAPrecioB.SetFocus;
           EAPrecioB.SelectAll;
           key:= #0;
        end;
    end
   else
     if (EAPrecioB.Focused) then
      begin
        if (EAPrecioU.Enabled) then
          begin
             EAPrecioU.SetFocus;
             EAPrecioU.SelectAll;
             key:= #0;
          end;
      end
     else
       if (EAPrecioU.Focused) then
        begin
          if (EAValor.Enabled) then
            begin
               EAValor.SetFocus;
               EAValor.SelectAll;
               key:= #0;
            end;
        end
       else
         if (EAValor.Focused) then
          begin
            if (EAPorcentaje.Enabled) then
              begin
                 EAPorcentaje.SetFocus;
                 EAPorcentaje.SelectAll;
                 key:= #0;
              end;
          end;

  case (TEditAuto(Sender).Tag) of
    61: begin  // entero no controlo el tema de los puntos
          //if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 5)) and (key <> #8)) then
          //  key:=#0

          //  DecimalSeparator:='.';
            Separador := SysUtils.DecimalSeparator;

            if ((Key = '.') or ( Key = ',')) then
              Key := Separador;

            if (pos(Separador,TEditAuto(Sender).Text)=0) then
              begin
                if not (key in ['0'..'9',Separador,#8]) then
                  key:=#0;
              end
            else
              if not (key in ['0'..'9',#8]) then
                key:=#0;
        end;
    62, 63, 64, 65: begin // flotantes controlo puntos y comas
                  if (Key = '.') then
                    Key := ',';

                  if (pos(',',TEditAuto(Sender).Text)=0) then
                    begin
                      if not (key in ['0'..'9',',',#8]) then key:=#0;
                    end
                  else if not (key in ['0'..'9',#8]) then key:=#0;
                end;
 {  VER SI ES NECESARIO TENER QUE CONTROLAR LOS DOS DIGITOS EN EL PORCENTAJE
    65: begin   // flotante idem anterior + solo dos digitos

        end;}
  end;

end;

(*
  Habilita el Boton Terminar segun se pueda o no guardar los datos ingresados
*)
procedure TFEveAltaDirecta.ControlEventoOnExit(Sender: TObject);
begin
// Para generar una demo se deshabilita la posibilidad de grabar alta de animales
{$IFDEF DEMO}
  //DEMO EDUCACION CONTINUA
  //BBTerminar.Enabled := Puedegrabar and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
  JvTerminar.Visible := Puedegrabar and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
  LBBTerminar.Visible := Puedegrabar and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
  //DEMO COMERCIAL
  //BBTerminar.Enabled := False;
{$ELSE}
  if Fprincipal.TipoVersionLicencia = 'Basico' then
    if FPrincipal.TipoBase = 1 then
    begin
      JvTerminar.Visible := PuedeGrabar and VerificarCantAnimalesBase(1);
      LBBTerminar.Visible := PuedeGrabar and VerificarCantAnimalesBase(1);
      //BBTerminar.Enabled := PuedeGrabar and VerificarCantAnimalesBase(1)
    end
    else
      inherited
  else
    inherited;
{$ENDIF}
end;

procedure TFEveAltaDirecta.Change(Sender: TObject);
var
  precioB, precioU, porcentaje,valor: double;
  peso:double;
begin
    inherited;
    if not TryStrToFloat(EAPrecioB.Text,precioB) then  precioB := 0;
    if not TryStrToFloat(EAPrecioU.Text,precioU) then  precioU := 0;
    if not TryStrToFloat(EAPeso.Text,peso) then  peso := 0;
    if not TryStrToFloat(EAPorcentaje.Text,porcentaje) then  porcentaje:=0;
    if not TryStrToFloat(EAValor.Text,valor) then  valor:=0;

    case TEditAuto(Sender).Tag of
    61 : begin    // EAPESO
           if(peso <> 0) and (precioU <> 0)then
             begin
               if (FormatFloat('###0.00',precioU/peso) <> 'NAN') then
                 EAPrecioB.Text := FormatFloat('###0.00',precioU/peso)
               else
                 EAPrecioB.Text := '0';
             end
           else
           begin
             EAPrecioB.Text := '0';
             EAPrecioU.Text := '0';
           end;

           if peso <> 0 then
           begin
            LDias.Visible := true;
            DBLCBATiposPeso.Visible := true;
            DBLCBATiposPeso.KeyValue := 'G';
            DBLCBATiposPeso.Enabled := FPrincipal.FuncActividad;
           end
           else
           begin
            LDias.Visible := false;
            DBLCBATiposPeso.Visible := false;
           end;

           ControlEventoOnExit(self);
         end;
    62 : begin    // EAPRECIOB
           if(peso <> 0) and (precioB <> 0) then
           begin
            if(not(EAPrecioU.Focused))then
             EAPrecioU.Text :=  FormatFloat('###0.00',precioB * peso)
           end
           else
            begin
             EAPrecioB.Text :='0';
             EAValor.Clear;
             EAPorcentaje.Clear;
            end;
         end;
    63 : begin    // EAPRECOU
           if(precioU <> 0) and (peso <> 0) then
            begin
              if( not EAPrecioB.Focused) then
               if (FormatFloat('###0.00',precioU/peso) <> 'NAN') then
                 EAPrecioB.Text := FormatFloat('###0.00',precioU/peso)
               else
                 EAPrecioB.Text := '0';
               if(valor <> 0) then
                 begin
                   LTotalNeto.Caption:= FormatFloat('###0.00',precioU+ valor);
                   EAValor.Text := FormatFloat('###0.00',(precioU * porcentaje)/100);
                 end
               else
                  LTotalNeto.Caption:= FormatFloat('###0.00',precioU);
            end
           else
            begin
             EAPrecioB.Text := '0';
             LTotalNeto.Caption:= FormatFloat('###0.00',StrToFloat('0'));
             EAValor.Clear;
             EAPorcentaje.Clear;
            end;
         end;
    64 : begin    // EAVALOR
           if((precioU <>0) and (valor <> 0))then
           begin
             // if(EAValor.Focused)then
                if (FormatFloat('###0.00',valor * 100 /precioU) <> 'NAN') then
                    EAPorcentaje.Text := FormatFloat('###0.00',(valor * 100 /precioU))
                else
                  EAPorcentaje.Text := '0';
              LTotalNeto.Caption := FormatFloat('###0.00',precioU + valor);
           end
           else
            begin
             EAPorcentaje.Text := '';
             if(EAPrecioU.Text<>'') then
               LTotalNeto.Caption := FormatFloat('###0.00',precioU);
            end
         end;
    65 : begin    // EAPORCENTAJE
           if((precioU <> 0) and (porcentaje <> 0))then
             begin
               if(not EAValor.Focused)then
               begin
                  EAValor.Text := FormatFloat('###0.00',(precioU * porcentaje)/100);
                  if not TryStrToFloat(EAValor.Text,valor) then  valor:=0;
                  LTotalNeto.Caption := FormatFloat('###0.00',precioU + valor);
               end
             end
           else
            begin
             EAValor.Text := '';
             if(precioU <> 0) then
               LTotalNeto.Caption := FormatFloat('###0.00',precioU);
            end
        end;
  end;




   { case TEditAuto(Sender).Tag of
    61 : begin    // EAPESO
           if(EAPeso.Text <> '') and (EAPrecioU.Text <> '')then
             begin
               if (FormatFloat('###0.00',(StrToFloat(EAPrecioU.Text)/StrToFloat(EAPeso.Text))) <> 'NAN') then
                 EAPrecioB.Text := FormatFloat('###0.00',(StrToFloat(EAPrecioU.Text)/StrToFloat(EAPeso.Text)))
               else
                 EAPrecioB.Text := '0';
             end
           else
           begin
             EAPrecioB.Text := '0';
             EAPrecioU.Text := '0';
           end;
           ControlEventoOnExit(self);
         end;
    62 : begin    // EAPRECIOB
           if(EAPeso.Text <> '') and (EAPrecioB.Text <> '') then
           begin
            if(not(EAPrecioU.Focused))then
             EAPrecioU.Text :=  FormatFloat('###0.00',(StrToFloat(EAPrecioB.Text)* StrToFloat(EAPeso.Text)))
           end
           else
            begin
             EAPrecioB.Text :='0';
             EAValor.Clear;
             EAPorcentaje.Clear;
            end;
         end;
    63 : begin    // EAPRECOU
           if(EAPrecioU.Text <>'') and (EAPeso.Text <> '') then
            begin
              if( not EAPrecioB.Focused) then
               if (FormatFloat('###0.00',(StrToFloat(EAPrecioU.Text)/StrToFloat(EAPeso.Text))) <> 'NAN') then
                 EAPrecioB.Text := FormatFloat('###0.00',(StrToFloat(EAPrecioU.Text)/StrToFloat(EAPeso.Text)))
               else
                 EAPrecioB.Text := '0';
               if(EAValor.Text <> '') then
                 begin
                   LTotalNeto.Caption:= FormatFloat('###0.00',StrToFloat(EAPrecioU.Text)+ StrToFloat(EAValor.Text));
                   EAValor.Text := FormatFloat('###0.00',(StrToFloat(EAPrecioU.Text)* StrToFloat(EAPorcentaje.Text))/100);
                 end
               else
                  LTotalNeto.Caption:= FormatFloat('###0.00',StrToFloat(EAPrecioU.Text));
            end
           else
            begin
             EAPrecioB.Text := '0';
             LTotalNeto.Caption:= FormatFloat('###0.00',StrToFloat('0'));
             EAValor.Clear;
             EAPorcentaje.Clear;
            end;
         end;
    64 : begin    // EAVALOR
           if((EAPrecioU.Text <>'') and (EAValor.Text <> ''))then
           begin
              if(EAValor.Focused)then
                if (FormatFloat('###0.00',(StrToFloat(EAValor.Text) * 100 /StrToFloat(EAPrecioU.Text))) <> 'NAN') then
                    EAPorcentaje.Text := FormatFloat('###0.00',(StrToFloat(EAValor.Text) * 100 /StrToFloat(EAPrecioU.Text)))
                else
                  EAPorcentaje.Text := '0';
              LTotalNeto.Caption := FormatFloat('###0.00',(StrToFloat(EAPrecioU.Text)+ StrToFloat(EAValor.Text)));
           end
           else
            begin
             EAPorcentaje.Text := '';
             if(EAPrecioU.Text<>'') then
               LTotalNeto.Caption := FormatFloat('###0.00',StrToFloat(EAPrecioU.Text));
            end
         end;
    65 : begin    // EAPORCENTAJE
           if((EAPrecioU.Text <>'') and (EAPorcentaje.Text <> ''))then
             begin
               if(not EAValor.Focused)then
               begin
                  EAValor.Text := FormatFloat('###0.00',(StrToFloat(EAPrecioU.Text)* StrToFloat(EAPorcentaje.Text))/100);
                  LTotalNeto.Caption := FormatFloat('###0.00',(StrToFloat(EAPrecioU.Text)+ StrToFloat(EAValor.Text)));
               end
             end
           else
            begin
             EAValor.Text := '';
             if(EAPrecioU.Text<>'') then
               LTotalNeto.Caption := FormatFloat('###0.00',StrToFloat(EAPrecioU.Text));
            end
        end;
  end;   }
end;

procedure TFEveAltaDirecta.DTPAFechaNacChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  //DTPAFechaEve.MinDate := dateOf(DTPAFechaNac.DateTime);
  if(Sender <> nil) then
  begin
    fecha := Sender as TDateTimePickerAuto;
    if(fecha.Date > now) then
      fecha.Date:=now;
    ActualizarInternos();
  end;
  if DTPAFechaEve.Date >= DTPAFechaNac.Date then
    if MonthsBetween(DTPAFechaEve.Date,DTPAFechaNac.Date) > 24 then
      LEdad.Caption := IntToStr(YearsBetween(DTPAFechaEve.Date,DTPAFechaNac.Date))+Traducir(' años')
    else
      LEdad.Caption := IntToStr(MonthsBetween(DTPAFechaEve.Date,DTPAFechaNac.Date))+Traducir(' meses')
  else
    LEdad.Caption:='0 '+Traducir('meses');
end;

procedure TFEveAltaDirecta.ActualizarInternos();
begin
 { try
    IBQMadresInternas.Close;
    IBQMadresInternas.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
//    IBQMadresInternas.ParamByName('fecha').AsDate := DTPAFechaNac.Date;//IncMonth(DTPAFechaNac.Date,-20);
    IBQMadresInternas.Open;
    ActualizarPadres();

    if(ChkBPadresMultiples.Checked) then
    begin
      FrameSeleccionPadres.IBQDisponibles.Close;
      FrameSeleccionPadres.IBQDisponibles.ParamByName('IDAUXPE').AsInteger := FIdAuxPe;
      FrameSeleccionPadres.IBQDisponibles.Open;
    end;

    IBQLimpiarTablasAux.Close;
    IBQLimpiarTablasAux.Open;
    if(ChkBPadresMultiples.Checked) then
    begin
      FrameSeleccionPadres.IBQSeleccionados.Close;
      FrameSeleccionPadres.IBQSeleccionados.ParamByName('IDAUXPE').AsInteger := FIdAuxPe;
      FrameSeleccionPadres.IBQSeleccionados.Open;
    end;

  except
  end;      }
end;

procedure TFEveAltaDirecta.DTPAFechaEveChange(Sender: TObject);
begin
  inherited;
  //DTPAFechaNac.MaxDate := DTPAFechaEve.DateTime;
  DTPAFechaNacChange(Sender);
end;

procedure TFEveAltaDirecta.EACircunferenciaEKeyPress(Sender: TObject;  var Key: Char);
var Separador : Char;
begin
  inherited;
  if (Key = #13) then
   begin
    if (DBLCBACondicionC.Enabled) then
      begin
         DBLCBACondicionC.SetFocus;
         key:= #0;
      end
     else 
      if (DBLCBACronologiaD.Enabled) then
        begin
           DBLCBACronologiaD.SetFocus;
           key:= #0;
        end
     else

   end;
      
//  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 4)) and (key <> #8)) then key:=#0;
  //DecimalSeparator:='.';
  Separador := SysUtils.DecimalSeparator;

  if ((Key = '.') or ( Key = ',')) then
    Key := Separador;

  if (pos(Separador,TEditAuto(Sender).Text)=0) then
    begin
      if not (key in ['0'..'9',Separador,#8]) then
        key:=#0;
    end
  else
    if not (key in ['0'..'9',#8]) then
      key:=#0;
end;

// control para los valores de la circunderencia escrotal
procedure TFEveAltaDirecta.EACircunferenciaEExit(Sender: TObject);
begin
  inherited;
  if (EACircunferenciaE.Text <> '') then
    if ((StrToFloat(EACircunferenciaE.Text)<0) or (StrToFloat(EACircunferenciaE.Text)>60) ) then
      begin
        MostrarMensaje(tmError, 'La circunferencia escrotal debe estar entre 0 y 60');
        EACircunferenciaE.SetFocus;
      end
end;

procedure TFEveAltaDirecta.FrameSeleccionPadresIBQSeleccionadosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

procedure TFEveAltaDirecta.LlenarAuxAnimales;
var
  ind : integer;
begin
  try
     IBQDelAuxAnimales.Close;
     IBQDelAuxAnimales.Open;
     ind := 0;
     while not IBQPadresExt_Int.Eof do
     begin
      IBInsAuxAnimales.Close;
      IBInsAuxAnimales.ParamByName('ID_AUX').Value := FIdAuxPE;
      IBInsAuxAnimales.ParamByName('ID_ANIMAL').Value := IBQPadresExt_Int.FieldByName('ID').AsInteger;
      IBInsAuxAnimales.ParamByName('NOMBRE').Value := IBQPadresExt_Int.FieldByName('NOMBRE').AsString;
      IBInsAuxAnimales.ParamByName('APODO').Value := IBQPadresExt_Int.FieldByName('APODO').AsString;
      IBInsAuxAnimales.ParamByName('ID_OTRO').Value := IBQPadresExt_Int.FieldByName('ID_OTRO').AsString;
      IBInsAuxAnimales.ParamByName('ID_PC').Value := IBQPadresExt_Int.FieldByName('ID_PC').AsString;
      IBInsAuxAnimales.ParamByName('ID_HBA').Value := IBQPadresExt_Int.FieldByName('ID_HBA').AsString;
      IBInsAuxAnimales.ParamByName('ID_RA').Value := IBQPadresExt_Int.FieldByName('ID_RA').AsString;
      IBInsAuxAnimales.ParamByName('ID_RP').Value := IBQPadresExt_Int.FieldByName('ID_RP').AsString;
      IBInsAuxAnimales.ParamByName('ID_SENASA').Value := IBQPadresExt_Int.FieldByName('ID_SENASA').AsString;
      IBInsAuxAnimales.ParamByName('RAZA').Value := IBQPadresExt_Int.FieldByName('RAZA').AsInteger;
      IBInsAuxAnimales.ParamByName('SEXO').Value := IBQPadresExt_Int.FieldByName('SEXO').AsInteger;
      IBInsAuxAnimales.ParamByName('V1').Value := IBQPadresExt_Int.FieldByName('ExtInt').AsString;
      IBInsAuxAnimales.ParamByName('V2').Value := IBQPadresExt_Int.FieldByName('ID_RP').AsString + IBQPadresExt_Int.FieldByName('ExtInt').AsString;
      IBInsAuxAnimales.Open;
      IBQPadresExt_Int.Next;
      Inc(ind);
     end;
     Fprincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
 IBQAuxAnimales.Close;
 IBQAuxAnimales.Open;
end;

procedure TFEveAltaDirecta.IBQPadresExt_IntAfterOpen(DataSet: TDataSet);
begin
  inherited;
  LlenarAuxAnimales;
end;

procedure TFEveAltaDirecta.DBLCBARPPadreCloseUp(Sender: TObject);
begin
  inherited;
//  BorrarAuxPadres;
end;

procedure TFEveAltaDirecta.BorrarAuxPadres;
begin
  if not (IBQAuxAnimales.IsEmpty)then
  begin
     IBQDelAuxAnimales.Close;
     IBQDelAuxAnimales.Open;
     FPrincipal.IBTPrincipal.CommitRetaining;
  end;
end;

procedure TFEveAltaDirecta.Button1Click(Sender: TObject);
var
  SQLInt : String;
  SQLExt : String;
  F : TFPosiblesMadres;
begin
  inherited;
  //FrameSeleccionPadres.IBQDisponibles.Close;
  SQLInt := 'select id_animal as id, id_rp, id_hba, nombre, apodo, ''INTERNA'' as Tipo from tab_animales where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (categoria = 6 or categoria = 5) and Activo = ''S'' and (establecimiento = :esta)';
  SQLExt := 'select id_animal_externo as id, id_rp, id_hba, nombre, apodo, ''EXTERNA'' as Tipo from tab_animales_externos where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (sexo = 2) and (establecimiento = :esta)';
  F := TFPosiblesMadres.Create(self);
  F.PTitulo.Caption := 'Seleccionar Madre';
  F.LTitulo.Caption := 'Seleccionar Madre';
  F.IBQMBiologica.Close;
  F.IBQMBiologica.SQL.Clear;
  if CBMBioInt.Checked  and CBMBioExt.Checked then
  begin
    F.IBQMBiologica.SQL.Add(SQLInt+' union '+SQLExt);
  end
  else
  begin
    if (CBMBioInt.Checked) and not(CBMBioExt.Checked) then
      F.IBQMBiologica.SQL.Add(SQLInt)
    else
      if not (CBMBioInt.Checked) and (CBMBioExt.Checked) then
        F.IBQMBiologica.SQL.Add(SQLExt);
  end;
  if Length(RPMadreBio) > 10 then
    F.IBQMBiologica.ParamByName('rp').Value := null
  else
    F.IBQMBiologica.ParamByName('rp').AsString := Uppercase(RPMadreBio);
  F.IBQMBiologica.ParamByName('nom').AsString := Uppercase(RPMadreBio);
  F.IBQMBiologica.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  F.IBQMBiologica.Open;
  F.IBQMBiologica.Last;
  F.IBQMBiologica.First;
  if not F.IBQMBiologica.IsEmpty then
  begin
    if F.IBQMBiologica.RecordCount > 1 then
    begin
      F.LSeleccion.Caption := 'Seleccione la madre';
      F.LBuscarMBiolo.Caption := 'Buscar Madre';
      F.ShowModal;
      LMSeleccionadaB.Caption := 'Madre Biológica Seleccionada - RP: '+F.RP+' HBA: '+F.HBA+' Nombre: '+F.Nombre;
      LMSeleccionadaB.Visible := true;
      TipoMadreB := F.TipoM;
      id_madreB := F.id_madre;
      if id_madreB = -1 then
        LMSeleccionadaB.Caption := 'No se selecciono ningúna Madre Biológica';
    end
    else
    begin
      LMSeleccionadaB.Caption := 'Madre Biológica Seleccionada - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
      if F.IBQMBiologica.FieldValues['id_hba'] <> null then
        LMSeleccionadaB.Caption := LMSeleccionadaB.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
      if F.IBQMBiologica.FieldValues['nombre'] <> null then
        LMSeleccionadaB.Caption := LMSeleccionadaB.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
      LMSeleccionadaB.Visible := true;
      TipoMadreB := F.TipoM;
      id_madreB := F.id_madre;
    end;
  end
  else
  begin
    if MostrarMensaje(tmConsulta,'No se encontraron Animales. Desea Cargar la Madre Biológica?')= mrYes then
    begin
      if CBMBioExt.Checked then
      begin
        id_madreB := AgregarAnimalExterno(2);
        if id_madreB <> -1 then
        begin
          TipoMadreB := 'EXTERNA';
          F.IBQMBiologica.Close;
          F.IBQMBiologica.SQL.Clear;
          F.IBQMBiologica.SQL.Add(SQLExt);
          F.IBQMBiologica.ParamByName('rp').AsString := '%';
          F.IBQMBiologica.ParamByName('nom').AsString := '%';
          F.IBQMBiologica.Open;
          F.IBQMBiologica.Locate('id',id_madreB,[]);
          LMSeleccionadaB.Caption := 'Madre Biológica Seleccionada - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
          if F.IBQMBiologica.FieldValues['id_hba'] <> null then
            LMSeleccionadaB.Caption := LMSeleccionadaB.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
          if F.IBQMBiologica.FieldValues['nombre'] <> null then
            LMSeleccionadaB.Caption := LMSeleccionadaB.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
          LMSeleccionadaB.Visible := true;
        end;
      end
      else
        id_madreB := AgregarAnimalInterno(2);
    end;
  end;
end;

procedure TFEveAltaDirecta.Button2Click(Sender: TObject);
var
  SQLInt : String;
  SQLExt : String;
  F : TFPosiblesMadres;
begin
  inherited;
  //FrameSeleccionPadres.IBQDisponibles.Close;
  SQLInt := 'select id_animal as id, id_rp, id_hba, nombre, apodo, ''INTERNA'' as Tipo from tab_animales where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (categoria = 6 or categoria = 5) and Activo = ''S'' and (establecimiento = :esta)';
  SQLExt := 'select id_animal_externo as id, id_rp, id_hba, nombre, apodo, ''EXTERNA'' as Tipo from tab_animales_externos where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (sexo = 2) and (establecimiento = :esta)';
  F := TFPosiblesMadres.Create(self);
  F.PTitulo.Caption := 'Seleccionar Madre';
  F.LTitulo.Caption := 'Seleccionar Madre';
  F.IBQMBiologica.Close;
  F.IBQMBiologica.SQL.Clear;
  if CBMRecInt.Checked  and CBMRecExt.Checked then
  begin
    F.IBQMBiologica.SQL.Add(SQLInt+' union '+SQLExt);
  end
  else
  begin
    if (CBMRecInt.Checked) and not(CBMRecExt.Checked) then
      F.IBQMBiologica.SQL.Add(SQLInt)
    else
      if not (CBMRecInt.Checked) and (CBMRecExt.Checked) then
        F.IBQMBiologica.SQL.Add(SQLExt);
  end;
  if Length(RPMadreRec) > 10 then
    F.IBQMBiologica.ParamByName('rp').Value := null
  else
    F.IBQMBiologica.ParamByName('rp').AsString := Uppercase(RPMadreRec);
  F.IBQMBiologica.ParamByName('nom').AsString := Uppercase(RPMadreRec);
  F.IBQMBiologica.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  F.IBQMBiologica.Open;
  F.IBQMBiologica.Last;
  F.IBQMBiologica.First;
  if not F.IBQMBiologica.IsEmpty then
  begin
    if F.IBQMBiologica.RecordCount > 1 then
    begin
      F.LSeleccion.Caption := 'Seleccione la madre';
      F.LBuscarMBiolo.Caption := 'Buscar Madre';
      F.ShowModal;
      LMSeleccionadaR.Caption := 'Madre Receptora Seleccionada - RP: '+F.RP+' HBA: '+F.HBA+' Nombre: '+F.Nombre;
      LMSeleccionadaR.Visible := true;
      TipoMadreR := F.TipoM;
      id_madreR := F.id_madre;
      F.Destroy;
      if id_madreR = -1 then
        LMSeleccionadaR.Caption := 'No se selecciono ningúna Madre Receptora';
    end
    else
    begin
      LMSeleccionadaR.Caption := 'Madre Receptora Seleccionada - RP: '+F.IBQMBiologica.FieldValues['id_rp']+' HBA: '+F.IBQMBiologica.FieldValues['id_hba']+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
      LMSeleccionadaR.Visible := true;
      TipoMadreR := F.TipoM;
      id_madreR := F.id_madre;
      F.Destroy;
    end;
  end
  else
  begin
    if MostrarMensaje(tmConsulta,'No se encontraron Animales. Desea Cargar la Madre Receptora?')= mrYes then
    begin
      if CBMRecExt.Checked then
      begin
        id_madreR := AgregarAnimalExterno(2);
        if id_madreR <> -1 then
        begin
          TipoMadreR := 'EXTERNA';
          F.IBQMBiologica.Close;
          F.IBQMBiologica.SQL.Clear;
          F.IBQMBiologica.SQL.Add(SQLExt);
          F.IBQMBiologica.ParamByName('rp').AsString := '%';
          F.IBQMBiologica.ParamByName('nom').AsString := '%';
          F.IBQMBiologica.Open;
          F.IBQMBiologica.Locate('id',id_madreR,[]);
          LMSeleccionadaR.Caption := 'Madre Receptora Seleccionada - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
          if F.IBQMBiologica.FieldValues['id_hba'] <> null then
            LMSeleccionadaR.Caption := LMSeleccionadaR.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
          if F.IBQMBiologica.FieldValues['nombre'] <> null then
            LMSeleccionadaR.Caption := LMSeleccionadaR.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
          LMSeleccionadaR.Visible := true;
        end;
      end
      else
        id_madreR := AgregarAnimalInterno(2);
    end;
  end;
end;

procedure TFEveAltaDirecta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  BorrarTablasAuxiliares;
end;

procedure TFEveAltaDirecta.IBQMadreBAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFEveAltaDirecta.IBQMadresInternasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFEveAltaDirecta.DBLCBARPPadreClick(Sender: TObject);
begin
  inherited;
  IBQLimpiarTablasAux.Close;
  IBQLimpiarTablasAux.Open;
  AsignarUnSoloPadre(Sender);
end;

procedure TFEveAltaDirecta.AsignarUnSoloPadre(Sender : TObject);
var
  S : String;
begin

end;

procedure TFEveAltaDirecta.EAIdRPChange(Sender: TObject);
begin
  inherited;
  // Para generar una demo se deshabilita la posibilidad de grabar alta de animales
end;

procedure TFEveAltaDirecta.CBCondicionCorporalClick(Sender: TObject);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveAltaDirecta.CBCondicionCorporalKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  controlCondicionCorporal
end;

procedure TFEveAltaDirecta.controlCondicionCorporal;
begin
  DBLCBACondicionC.Enabled := CBCondicionCorporal.Checked;
  if (not DBLCBACondicionC.Enabled) then
    DBLCBACondicionC.KeyValue := null;
end;

procedure TFEveAltaDirecta.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

  if not (Owner is TFSelAnimalesSemenExtraccion) then
  begin
    if (FTipoAlta = 0) then //cargo otro si es una alta y no una modificación
      if (CargaOtro) then
      begin
          If (MostrarMensaje(tmConsulta, 'Desea cargar otro animal?') = mrYes) then
          begin
             CanClose:= False;
             CargarOtro();
          end
          else
            CanClose:= True;
      end;
  end;
end;

procedure TFEveAltaDirecta.ClearComponentes;
begin
  EAPrefijo.Clear;
  EARPInicial.Clear;
  EASufijo.Clear;
  IDRp := '';
  EANombre.Clear;
  EAApodo.Clear;
  EAIdSenasa.Clear;
  EAIdHBA.Clear;
  EAOtro.Clear;
  EAIdentificacionElectronica.Clear;
  EAIdPC.Clear;
  EAIdRA.Clear;
  EADta.Clear;
  CBCondicionCorporal.Checked:= false;
  if EACircunferenciaE.Visible then
    EACircunferenciaE.Clear;
  EAEstadoLactacion.Text:= '0';
  EAPeso.Clear;
  EAPrecioB.Clear;
  EAPrecioU.Clear;
  EAValor.Clear;
  EAPorcentaje.Clear;
  MAObservacion.Clear;
end;

procedure TFEveAltaDirecta.EAIdSenasaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAIdPC.Enabled) then
      begin
         EAIdPC.SetFocus;
         key:= #0;
      end;

  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;

  if (key = #32) then
   key:= #0;
end;

procedure TFEveAltaDirecta.RBCUIGSenasaClick(Sender: TObject);
begin
  inherited;
  if (CBCUIGPropio.Checked) then
    DBLCBACUIGPropio.Visible := true
   else
     DBLCBACUIGPropio.Visible := false;

  CBCUIGPropio.Visible := true;
  LCUIGPropio.Visible := true;
  EAEncabezado.Visible := true;
  EAUltimoIdent.Visible := true;
  EVerificador.Visible := true;
  EAidSenasa.Visible := false;
  ComponentesVisiblesPorPais(FPrincipal.Pais);
  //EAEncabezado.Text := FPrincipal.CUIG;
  //EAUltimoIdent.Text := FPrincipal.UltimoIdentificador;
  Lr.Visible:= false;
  EAEncabezadoReidentificacion.Visible := false;
  EAUltimoIdentReidentificacion.Visible := false;
  EVerificadorReidentificacion.Visible := false;
end;

procedure TFEveAltaDirecta.RBSenasaClick(Sender: TObject);
begin
  inherited;
  DBLCBACUIGPropio.Visible := false;
  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;  
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EVerificador.Visible := false;
  EAidSenasa.Visible := true;
  EAidSenasa.Enabled := true;
  EAidSenasa.Text := '';
  if not (Owner is TFAbmPadresExternos) then
  begin
    EAidSenasa.SetFocus;
    EAidSenasa.SelectAll;
  end;
  Lr.Visible:= false;
  EAEncabezadoReidentificacion.Visible := false;
  EAUltimoIdentReidentificacion.Visible := false;
  EVerificadorReidentificacion.Visible := false;  
end;

procedure TFEveAltaDirecta.CambioGUIG(Sender : TObject);
begin
  if (EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____') then
    if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
      if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
        begin
          EVerificador.Text := IntToStr(UFunctions.DigitoVerificadorCaravana(EAEncabezado.Text+EAUltimoIdent.Text));
          EAidSenasa.Text := EAEncabezado.Text+EAUltimoIdent.Text;
          HandlerOnExitSenasa(self);
        end
       else
        begin
          MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
          EAUltimoIdent.SetFocus;
        end
    else
      begin
        MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
        EAEncabezado.SetFocus;
      end;

end;

procedure TFEveAltaDirecta.ActualizarCUIG(CUIG : String);
var
  nuevo_identificador, ultimo : String;
begin
  //Solamente Incremento el Identificador si el CUIG es el de este establecimiento
  if (CBCUIGPropio.Checked and (DBLCBACUIGPropio.Text<>'')) then
  begin
    IBQBuscarCUIG.Close;
    IBQBuscarCUIG.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQBuscarCUIG.ParamByName('id').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQBuscarCUIG.Open;
    ultimo := IBQBuscarCUIG.fieldByName('ultimo_identificador').AsString;
    nuevo_identificador := UFunctions.IncrementarIdentificadorCUIG(ultimo);
    IBQActCUIG.Close;
    IBQActCUIG.ParamByName('cuig').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQActCUIG.ParamByName('UI').AsString := nuevo_identificador;
    IBQActCUIG.Open;
  end;
end;

procedure TFEveAltaDirecta.CBCUIGPropioClick(Sender: TObject);
begin
  inherited;
  if (CBCUIGPropio.Checked) then
    DBLCBACUIGPropio.Visible := true
  else
  begin
    DBLCBACUIGPropio.Visible := false;
    EAEncabezado.Text := '';
    EAUltimoIdent.Text := '';
  end;
end;

procedure TFEveAltaDirecta.DBLCBACUIGPropioCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBACUIGPropio.KeyValue <> null) then
  begin
    IBQBuscarCUIG.Close;
    IBQBuscarCUIG.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQBuscarCUIG.ParamByName('id').AsInteger := DBLCBACUIGPropio.KeyValue;
    IBQBuscarCUIG.Open;
    EAEncabezado.Text := DBLCBACUIGPropio.Text;
    EAUltimoIdent.Text := IBQBuscarCUIG.fieldByName('ultimo_identificador').AsString;
    CambioGUIG(self);
  end;
end;

procedure TFEveAltaDirecta.ActualizarDatosPadres(rp: String);
begin
  if (rp <> '') then
  begin
     //IBQAuxAnimales.Locate('V2',rp,[]);
     DBLCBARPPadre.KeyValue := rp;
     DBLCBASenasaPadre.KeyValue := rp;
     DBLCBAApodoPadre.KeyValue := rp;
     DBLCBANombrePadre.KeyValue := rp;
     DBLCBAPCPadre.KeyValue := rp;
     DBLCBAHBAPadre.KeyValue := rp;
     DBLCBARAPadre.KeyValue := rp;
     DBLCBAOTROPadre.KeyValue := rp;
  end
  else
  begin
     DBLCBARPPadre.KeyValue := null;
     DBLCBASenasaPadre.KeyValue := null;
     DBLCBAApodoPadre.KeyValue := null;
     DBLCBANombrePadre.KeyValue := null;
     DBLCBAPCPadre.KeyValue := null;
     DBLCBAHBAPadre.KeyValue := null;
     DBLCBARAPadre.KeyValue := null;
     DBLCBAOTROPadre.KeyValue := null;
  end;
  DBLCBARPPadreCloseUp(DBLCBARPPadre);
end;

procedure TFEveAltaDirecta.EANombreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   if (EAApodo.Enabled) then
    begin
      EAApodo.SetFocus;
      EAApodo.SelectAll;
      key:= #0;
    end;
end;

procedure TFEveAltaDirecta.EAApodoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
    if (RBCUIGSenasa.Checked) then
     begin
       if (EAEncabezado.Enabled) then
        begin
           EAEncabezado.SetFocus;
           EAEncabezado.SelectAll;
           key:= #0;
        end;
      end
    else
      if (RBSenasa.Checked) then
       if (EAIdSenasa.Enabled) then
        begin
           EAIdSenasa.SetFocus;
           EAIdSenasa.SelectAll;
           key:= #0;
        end;
   end;
end;

procedure TFEveAltaDirecta.EAEncabezadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAUltimoIdent.Enabled) then
      begin
         EAUltimoIdent.SetFocus;
         EAUltimoIdent.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.EAUltimoIdentKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EVerificador.Enabled) then
      begin
         EVerificador.SetFocus;
         EVerificador.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.EVerificadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAIdPC.Enabled) then
      begin
         EAIdPC.SetFocus;
         EAIdPC.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.EAIdPCKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAIdHBA.Enabled) then
      begin
         EAIdHBA.SetFocus;
         EAIdHBA.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.EAIdHBAKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
      begin
       if (EAIdRA.Visible) then
        begin
         EAIdRA.SetFocus;
         EAIdRA.SelectAll;
         key:= #0;
        end
       else
         if (EAOtro.Visible) then
          begin
           EAOtro.SetFocus;
           EAOtro.SelectAll;
           key:= #0;
          end;
      end;
end;

procedure TFEveAltaDirecta.EAIdRAKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAOtro.Enabled) then
      begin
         EAOtro.SetFocus;
         EAOtro.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.EAOtroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EADta.Enabled) then
      begin
         EADta.SetFocus;
         EADta.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.EADtaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DTPAFechaNac.Enabled) then
      begin
         DTPAFechaNac.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DTPAFechaNacKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBACategoria.Enabled) then
      begin
         DBLCBACategoria.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBACategoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBASexo.Enabled) then
      begin
         DBLCBASexo.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBASexoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBARaza.Enabled) then
      begin
         DBLCBARaza.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBARazaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DTPAFechaEve.Enabled) then
      begin
         DTPAFechaEve.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DTPAFechaEveKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBATipoAlta.Enabled) then
      begin
         DBLCBATipoAlta.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBATipoAltaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAResponsable.Enabled) then
      begin
         DBLCBAResponsable.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBARPMadreBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAPCMadreB.Enabled) then
      begin
         DBLCBAPCMadreB.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBAPCMadreBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBASenasaMadreB.Enabled) then
      begin
         DBLCBASenasaMadreB.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBASenasaMadreBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAHBAMadreB.Enabled) then
      begin
         DBLCBAHBAMadreB.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBAHBAMadreBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAApodoMadreB.Enabled) then
      begin
         DBLCBAApodoMadreB.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBAApodoMadreBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBARAMadreB.Enabled) then
      begin
         DBLCBARAMadreB.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBARAMadreBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBANombreMadreB.Enabled) then
      begin
         DBLCBANombreMadreB.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBANombreMadreBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAOtroMadreB.Enabled) then
      begin
         DBLCBAOtroMadreB.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBAOtroMadreBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (ChkBMadreReceptora.Enabled) then
      begin
         ChkBMadreReceptora.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.ChkBMadreReceptoraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBARPMadreR.Enabled) then
      begin
         DBLCBARPMadreR.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBARPMadreRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBPCMadreR.Enabled) then
      begin
         DBLCBPCMadreR.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBPCMadreRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBSenasaMadreR.Enabled) then
      begin
         DBLCBSenasaMadreR.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBSenasaMadreRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBHBAMadreR.Enabled) then
      begin
         DBLCBHBAMadreR.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBHBAMadreRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAApodoMadreR.Enabled) then
      begin
         DBLCBAApodoMadreR.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBAApodoMadreRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBRAMadreR.Enabled) then
      begin
         DBLCBRAMadreR.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBRAMadreRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBANombreMadreR.Enabled) then
      begin
         DBLCBANombreMadreR.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBANombreMadreRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBOtroMadreR.Enabled) then
      begin
         DBLCBOtroMadreR.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBARPPadreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAPCPadre.Enabled) then
      begin
         DBLCBAPCPadre.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBAPCPadreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBASenasaPadre.Enabled) then
      begin
         DBLCBASenasaPadre.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBASenasaPadreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAHBAPadre.Enabled) then
      begin
         DBLCBAHBAPadre.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBAHBAPadreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAApodoPadre.Enabled) then
      begin
         DBLCBAApodoPadre.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBAApodoPadreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBARAPadre.Enabled) then
      begin
         DBLCBARAPadre.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBARAPadreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBANombrePadre.Enabled) then
      begin
         DBLCBANombrePadre.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBANombrePadreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAOTROPadre.Enabled) then
      begin
         DBLCBAOTROPadre.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.EAEstadoLactacionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAEstadoR.Enabled) then
      begin
         DBLCBAEstadoR.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBAEstadoRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAGDR.Enabled) then
      begin
         DBLCBAGDR.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBACondicionCKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBACronologiaD.Enabled) then
      begin
         DBLCBACronologiaD.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBAPotreroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBARodeo.Enabled) then
      begin
         DBLCBARodeo.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaDirecta.DBLCBACronologiaDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
    if (EAEstadoLactacion.Enabled) then
      begin
         EAEstadoLactacion.SetFocus;
         key:= #0;
      end
     else
      if (DBLCBAEstadoR.Enabled and GBestadoHembras.Visible) then
        begin
           DBLCBAEstadoR.SetFocus;
           key:= #0;
        end
       else
        if (DBLCBAGDR.Enabled) then
          begin
             DBLCBAGDR.SetFocus;
             key:= #0;
          end;
   end;
end;

procedure TFEveAltaDirecta.DBLCBAGDRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (DBLCBACondicionC.Enabled) then
    begin
       DBLCBACondicionC.SetFocus;
       key:= #0;
    end
  else
   if (DBLCBACronologiaD.Enabled) then
     begin
        DBLCBACronologiaD.SetFocus;
        key:= #0;
     end
end;

procedure TFEveAltaDirecta.CargarOtro;
begin
//solapa identificación
  //EAIdRP.Clear;
  EAPrefijo.Clear;
  EASufijo.Clear;
  EARpInicial.Clear;
  IDRp := '';
  EANombre.Clear;
  EAApodo.Clear;
  EAIdSenasa.Clear;
  EAEncabezado.Clear;
  EAUltimoIdent.Clear;
  EVerificador.Clear;
  EAIdPC.Clear;
  EAIdHBA.Clear;
  EAIdRA.Clear;
  EAOtro.Clear;
  EAIdentificacionElectronica.Clear;
  EADta.Clear;
  EAADN.Clear;
  CBADN.Checked:= false;
  EASanguinea.Clear;
  CBSanguinea.Checked:= false;

  if ((CBCUIGPropio.Checked) and (CBCUIGPropio.Visible)) then
   DBLCBACUIGPropioCloseUp(nil)
   else
    if (CBCUIGPropio.Checked) then
     begin
       CBCUIGPropio.Checked:= false;
       DBLCBACUIGPropio.KeyValue:= null;
     end;


//solapa madres

  DBLCBARPMadreB.KeyValue:= null;
  DBLCBAPCMadreB.KeyValue:= null;
  DBLCBASenasaMadreB.KeyValue:= null;
  DBLCBAHBAMadreB.KeyValue:= null;
  DBLCBAApodoMadreB.KeyValue:= null;
  DBLCBARAMadreB.KeyValue:= null;
  DBLCBANombreMadreB.KeyValue:= null;
  DBLCBAOtroMadreB.KeyValue:= null;

  DBLCBARPMadreR.KeyValue:= null;
  DBLCBPCMadreR.KeyValue:= null;
  DBLCBSenasaMadreR.KeyValue:= null;
  DBLCBHBAMadreR.KeyValue:= null;
  DBLCBAApodoMadreR.KeyValue:= null;
  DBLCBRAMadreR.KeyValue:= null;
  DBLCBANombreMadreR.KeyValue:= null;
  DBLCBOtroMadreR.KeyValue:= null;

//solapa padres

  DBLCBARPPadre.KeyValue:= null;
  DBLCBAPCPadre.KeyValue:= null;
  DBLCBASenasaPadre.KeyValue:= null;
  DBLCBAHBAPadre.KeyValue:= null;
  DBLCBAApodoPadre.KeyValue:= null;
  DBLCBARAPadre.KeyValue:= null;
  DBLCBANombrePadre.KeyValue:= null;
  DBLCBAOTROPadre.KeyValue:= null;
   //falta padres multiples

//solapa estado queda igual que el anterior
//solapa ubicación queda igual que el anterior
//solapa economía queda igual que el anterior
//solapa observación queda igual que el anterior
  PCBasico.ActivePage:= TSHDatos;
  ControlBounds;
  //EAIdRP.SetFocus;
  EARpInicial.SetFocus;

//  DBLCBATipoAlta.KeyValue := 1;
//  DBLCBATipoAlta.OnCloseUp(self);

end;

procedure TFEveAltaDirecta.ACancelarExecute(Sender: TObject);
begin
  inherited;
  CargaOtro:= false;
end;

procedure TFEveAltaDirecta.DBLCBACategoriaClick(Sender: TObject);
begin
  inherited;
  DBLCBACategoriaCloseUp(nil);
end;

procedure TFEveAltaDirecta.IBQAuxAnimalesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;



procedure TFEveAltaDirecta.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  RBSenasa.Caption:= FPrincipal.PaisNombreCaravana;
  LSenasaMadreR.Caption:= FPrincipal.PaisNombreCaravana+':';
  LSenesaMadre .Caption:= FPrincipal.PaisNombreCaravana+':';
  LSenansaPadre .Caption:= FPrincipal.PaisNombreCaravana+':';
  LHBA.Caption:= FPrincipal.PaisHerdBook+':';
  LHBAMadre.Caption:= FPrincipal.PaisHerdBook+':';
  LHBAMadreR.Caption:= FPrincipal.PaisHerdBook+':';
  LHBAPadre.Caption:= FPrincipal.PaisHerdBook+':';

  if (pais = 1) then //Argentina
   begin
    CBCUIGPropio.Visible:= True;
    LCUIGPropio.Visible := true;
    if (CBCUIGPropio.Checked) then
      DBLCBACUIGPropio.Visible:= True;
    RBCUIGSenasa.Visible:= True;
    EAEncabezado.Visible:= True;
    EAUltimoIdent.Visible:= True;
    EVerificador.Visible:= True;

    RBReidentificacionSenasa.Visible:= True;
    Lr.Visible:= True;
    EAEncabezadoReidentificacion.Visible:= True;
    EAUltimoIdentReidentificacion.Visible:= True;
    EVerificadorReidentificacion.Visible:= True;

    //RBSenasa.Left:= 112;
    //RBSenasa.Width:= 73;

    LSenasaMadreR.Left:= 95;
    LSenasaMadreR.Width:= 55;
    LSenesaMadre.Left:= 95;
    LSenesaMadre.Width:= 55;
    LSenansaPadre.Left:= 129;
    LSenansaPadre.Width:= 55;
   end
  else
    if (pais = 2) then //Uruguay
     begin
      CBCUIGPropio.Visible:= False;
      LCUIGPropio.Visible := false;      
      DBLCBACUIGPropio.Visible:= False;
      RBCUIGSenasa.Visible:= False;
      EAEncabezado.Visible:= False;      
      EAUltimoIdent.Visible:= False;
      EVerificador.Visible:= False;
      //RBSenasa.Left:= 16;
      //RBSenasa.Width:= 120;
      LSenasaMadreR.Left:= 43;
      LSenasaMadreR.Width:= 110;
      LSenesaMadre.Left:= 43;
      LSenesaMadre.Width:= 110;
      LSenansaPadre.Left:= 77;
      LSenansaPadre.Width:= 110;

      RBReidentificacionSenasa.Visible:= false;      
      Lr.Visible:= false;
      EAEncabezadoReidentificacion.Visible:= false;
      EAUltimoIdentReidentificacion.Visible:= false;
      EVerificadorReidentificacion.Visible:= false;

     end
   else
       begin
        CBCUIGPropio.Visible:= False;
        LCUIGPropio.Visible := false;
        DBLCBACUIGPropio.Visible:= False;
        RBCUIGSenasa.Visible:= False;
        EAEncabezado.Visible:= False;
        EAUltimoIdent.Visible:= False;
        EVerificador.Visible:= False;
        //RBSenasa.Left:= 16;
        //RBSenasa.Width:= 120;
        LSenasaMadreR.Left:= 43;
        LSenasaMadreR.Width:= 110;
        LSenesaMadre.Left:= 43;
        LSenesaMadre.Width:= 110;
        LSenansaPadre.Left:= 77;
        LSenansaPadre.Width:= 110;

        RBReidentificacionSenasa.Visible:= false;
        Lr.Visible:= false;
        EAEncabezadoReidentificacion.Visible:= false;
        EAUltimoIdentReidentificacion.Visible:= false;
        EVerificadorReidentificacion.Visible:= false;

       end;
end;

procedure TFEveAltaDirecta.LCUIGPropioClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMModificarCUIG.Create(Self));
      DMSoftvet.IBQCUIGActual.Close;
      DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQCUIGActual.Open;
      if nroID>-1 then
      begin
        DBLCBACUIGPropio.KeyValue:=nroID;
        nroID:=-1;
      end;
    end;
end;

procedure TFEveAltaDirecta.LCUIGPropioMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCUIGPropio.Font.Color:= $00606C02;
      LCUIGPropio.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LCUIGPropioMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCUIGPropio.Font.Color:= clWindowText;
      LCUIGPropio.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveAltaDirecta.LResponsableClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //desdeEvento:=0;
      FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
      DMSoftvet.IBQResponsable.Close;
      DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQResponsable.Open;
      if nroID>-1 then
        begin
        DBLCBAResponsable.KeyValue:=nroID;
        nroID:=-1;
        end;
    end;
end;

procedure TFEveAltaDirecta.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LPotreroClick(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      nroID:=0;
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQPotrerosSinServicio.Close;
      DMSoftvet.IBQPotrerosSinServicio.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQPotrerosSinServicio.Open;
      if nroID>-1 then
        begin
        DBLCBAPotrero.KeyValue:=nroID;
        nroID:=-1;
        end;
    end;
end;

procedure TFEveAltaDirecta.LPotreroMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPotrero.Font.Color:= $00606C02;
      LPotrero.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LPotreroMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPotrero.Font.Color:= clWindowText;
      LPotrero.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LRodeoClick(Sender: TObject);
var
  abm : TFABMRodeos;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      abm := TFABMRodeos.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQRodeo.Close;
      DMSoftvet.IBQRodeo.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQRodeo.Open;
      if nroID>-1 then
        begin
        DBLCBARodeo.KeyValue:=nroID;
        nroID:=-1;
        end;
    end;
end;

procedure TFEveAltaDirecta.LRodeoMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LRodeo.Font.Color:= $00606C02;
      LRodeo.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LRodeoMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LRodeo.Font.Color:= clWindowText;
      LRodeo.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveAltaDirecta.DBLCBATiposPesoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBATiposPeso.KeyValue <> null then
    DiasPeso := DBLCBATiposPeso.KeyValue
  else
    DiasPeso := 'G';
end;

procedure TFEveAltaDirecta.EAIdRPExit(Sender: TObject);
begin
  inherited;
  if(EAIdRP.Text = 'N/N') and (FTipoAlta = 0) then
    MostrarMensaje(tmError,'El RP N/N esta reservado por HUELLA.');
end;

procedure TFEveAltaDirecta.SBMadreIndefinidaClick(Sender: TObject);
begin
  inherited;
//  ClearListSource(GBMadreBiologica,DSMadreBiologica);

    if (FTipoCArga = 3) then
      ClearListSource(GBMadreBiologica,DSMadresInternas)
     else
       ClearListSource(GBMadreBiologica,DSMadreBiologica);
end;

procedure TFEveAltaDirecta.LActividadClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMActividad.Create(Self));
      DMSoftvet.IBQActividad.Close;
      DMSoftvet.IBQActividad.Open;
    end;
end;

procedure TFEveAltaDirecta.LActividadMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LActividad.Font.Color:= $00606C02;
      LActividad.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LActividadMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LActividad.Font.Color:= clWindowText;
      LActividad.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LOrigenClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      FPrincipal.AbrirFormNormal(TFABMOrigen.Create(Self));
      DMSoftvet.IBQCodOrigen.Close;
      DMSoftvet.IBQCodOrigen.Open;
      if nroID>-1 then
        begin
        DBLCBAOrigen.KeyValue:=nroID;
        nroID:=-1;
        end;
    end;
end;

procedure TFEveAltaDirecta.LCriadorClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      FPrincipal.AbrirFormNormal(TFABMCriador.Create(Self));
      DMSoftvet.IBQCodCriador.Close;
      DMSoftvet.IBQCodCriador.Open;
      if nroID>-1 then
      begin
        DBLCBACriador.KeyValue:=nroID;
        nroID:=-1;
      end;
    end;
end;

procedure TFEveAltaDirecta.LPropietarioClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      FPrincipal.AbrirFormNormal(TFABMPropietarioAnimal.Create(Self));
      DMSoftvet.IBQCodPropietario.Close;
      DMSoftvet.IBQCodPropietario.Open;
      if nroID>-1 then
        begin
        DBLCBAPropietario.KeyValue:=nroID;
        nroID:=-1;
        end;
    end;
end;

procedure TFEveAltaDirecta.CBADNClick(Sender: TObject);
begin
  inherited;
  EAADN.Clear;
  EAADN.Enabled := CBADN.Checked;
  if (CBADN.Checked) then
    EAADN.SetFocus;
end;

procedure TFEveAltaDirecta.CBSanguineaClick(Sender: TObject);
begin
  inherited;
  EASanguinea.Clear;
  EASanguinea.Enabled := CBSanguinea.Checked;
  if (CBSanguinea.Checked) then
    EASanguinea.SetFocus;
end;

procedure TFEveAltaDirecta.LOrigenMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LOrigen.Font.Color:= $00606C02;
      LOrigen.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LOrigenMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LOrigen.Font.Color:= clWindowText;
      LOrigen.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LCriadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCriador.Font.Color:= $00606C02;
      LCriador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LCriadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCriador.Font.Color:= clWindowText;
      LCriador.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LPropietarioMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPropietario.Font.Color:= $00606C02;
      LPropietario.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LPropietarioMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPropietario.Font.Color:= clWindowText;
      LPropietario.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.RBReidentificacionSenasaClick(Sender: TObject);
begin
  inherited;
  DBLCBACUIGPropio.Visible := false;

  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EVerificador.Visible := false;
  EAidSenasa.Visible := false;
  Lr.Visible:= true;
  EAEncabezadoReidentificacion.Visible := true;
  EAUltimoIdentReidentificacion.Visible := true;
  EVerificadorReidentificacion.Visible := true;
  EAEncabezadoReidentificacion.SetFocus;
  EAEncabezadoReidentificacion.SelectAll;
  Lr.Top:= EAEncabezado.Top + 3;
  EAEncabezadoReidentificacion.Top:= EAEncabezado.Top;
  EAUltimoIdentReidentificacion.Top:= EAUltimoIdent.Top;
  EVerificadorReidentificacion.Top:= EVerificador.Top;  
end;

procedure TFEveAltaDirecta.CambioReidentificacion(Sender: TObject);
begin
  if (EAEncabezadoReidentificacion.EditText <> '_____') and (EAUltimoIdentReidentificacion.EditText <> '____') then
    if (CheckFormatoReidentificacionEncabezado('R'+EAEncabezadoReidentificacion.Text)) then
      if (CheckFormatoReidentificacionUltimoIdent(EAUltimoIdentReidentificacion.Text)) then
        begin
          EVerificadorReidentificacion.Text := IntToStr(UFunctions.DigitoVerificadorCaravana('00R' + EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text));
          EAidSenasa.Text := 'R' + EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text;
          HandlerOnExitSenasa(self);
        end
       else
        begin
          MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
          EAUltimoIdentReidentificacion.SetFocus;
        end
    else
      begin
        MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
        EAEncabezadoReidentificacion.SetFocus;
      end;
end;

procedure TFEveAltaDirecta.EAPrefijoChange(Sender: TObject);
begin
  inherited;
  IDRp := Trim(EAPrefijo.Text+EARPInicial.Text+EASufijo.Text);
end;

procedure TFEveAltaDirecta.EARpInicialChange(Sender: TObject);
begin
  inherited;
  IDRp := Trim(EAPrefijo.Text+EARPInicial.Text+EASufijo.Text);
end;

procedure TFEveAltaDirecta.EASufijoChange(Sender: TObject);
begin
  inherited;
  IDRp := Trim(EAPrefijo.Text+EARPInicial.Text+EASufijo.Text);
end;

procedure TFEveAltaDirecta.EAPrefijoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  RPySenasa := false;
end;

procedure TFEveAltaDirecta.EARpInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  RPySenasa := false;
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFEveAltaDirecta.EASufijoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  RPySenasa := false;
end;

procedure TFEveAltaDirecta.CargarSubCategoriasporRaza;
begin
  DMSoftvet.IBQSubCategoriaRaza.Close;
  DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').Value :=DBLCBARaza.KeyValue;
  DMSoftvet.IBQSubCategoriaRaza.Open;
  DMSoftvet.IBQSubCategoriaRaza.First;
  DBLCBASubCategoria.KeyValue:= 0;
  DMSoftvet.IBQMocho.Close;
  DMSoftvet.IBQMocho.ParamByName('raza').Value := DBLCBARaza.KeyValue;
  DMSoftvet.IBQMocho.Open;
  DMSoftvet.IBQMocho.First;
  DBLCBAMocho.KeyValue := 0;
end;

procedure TFEveAltaDirecta.DBLCBARazaCloseUp(Sender: TObject);
var raza : integer;
begin
  inherited;
  CargarSubCategoriasporRaza;
  //Cambiar los identificadores para la raza
  ConfigurarPorRaza;

  raza := DBLCBARaza.KeyValue;
  if ((raza = 29) or (raza = 30)) then
  begin
      LColor.Visible := true;
      DBLCBAColor.Visible := true;
  end
  else
  begin
      LColor.Visible := false;
      DBLCBAColor.Visible := false;
  end;
end;

procedure TFEveAltaDirecta.LCodigoManejoClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    //nroID:=0;
    FPrincipal.AbrirFormNormal(TFABMCodigosManejo.Create(self));
    DMSoftvet.IBQCodigosManejo.Close;
    DMSoftvet.IBQCodigosManejo.Open;
    if nroID>-1 then
      begin
      DBLCBACodigoManejo.KeyValue:=nroID;
      nroID:=-1;
      end;
  end;
end;

procedure TFEveAltaDirecta.LCodigoManejoMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      (Sender as TLabel).Font.Color:= $00606C02;
      (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFEveAltaDirecta.LCodigoManejoMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= clWindowText;
    (Sender as TLabel).Font.Style:= [fsUnderline];
  end;
end;

procedure TFEveAltaDirecta.DBLCBAActividadCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBAActividad.KeyValue = 3) then
    begin
      LCodigoManejo.Visible:= true;
      DBLCBACodigoManejo.Visible:= true;
    end
   else
     begin    
        LCodigoManejo.Visible:= false;
        DBLCBACodigoManejo.Visible:= false;
     end; 
end;

procedure TFEveAltaDirecta.SBPropietariosClick(Sender: TObject);
var F: TFCoopropiedad;
begin
  inherited;
 // IBQREPProduccionEntradas.First;
  F:= TFCoopropiedad.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFEveAltaDirecta.DTPAFechaEveEnter(Sender: TObject);
var t:TRect;
begin
  inherited;
    t.Left:=DTPAFechaEve.Left+DTPAFechaEve.Width - 20;
    t.Top:=GBDatosEve.Top + DTPAFechaEve.Top + 20;
    t.Right:=DTPAFechaEve.Left + DTPAFechaEve.Width + 110;
    t.Bottom:=GBDatosEve.Top + DTPAFechaEve.Top + 120;
    hi:= THintWindow.Create(self);
    hi.ActivateHint(t,DTPAFechaEve.Hint);
    hi.Show;
end;

procedure TFEveAltaDirecta.DTPAFechaEveExit(Sender: TObject);
begin
  inherited;
  hi.Destroy;
end;

procedure TFEveAltaDirecta.LSubCategoriaMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LSubCategoria.Font.Color:= $00606C02;
      LSubCategoria.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LSubCategoriaMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LSubCategoria.Font.Color:= clWindowText;
      LSubCategoria.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaDirecta.LSubCategoriaClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      FPrincipal.AbrirFormNormal(TFABMSubCategorias.Create(Self));
      DMSoftvet.IBQSubCategoriaRaza.Close;
      DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').Value :=DBLCBARaza.KeyValue;
      DMSoftvet.IBQSubCategoriaRaza.Open;
      if nroID>-1 then
        begin
        DBLCBASubCategoria.KeyValue:=nroID;
        nroID:=-1;
        end;
    end;
end;

procedure TFEveAltaDirecta.DBLCBARPMadreBCloseUp(Sender: TObject);
begin
  inherited;
  //showmessage('');
end;

procedure TFEveAltaDirecta.FormActivate(Sender: TObject);
begin
  inherited;

  ControlEventoOnExit(self);
end;

procedure TFEveAltaDirecta.EBiologicaChange(Sender: TObject);
begin
  inherited;
  if EBiologica.Text <> '' then
    RPMadreBio := '%'+EBiologica.Text+'%'
  else
    RPMadreBio := '%';
end;

procedure TFEveAltaDirecta.EBiologicaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
  begin
    Button1.Click;
    key:= #0;
  end;
end;

procedure TFEveAltaDirecta.EReceptoraChange(Sender: TObject);
begin
  inherited;
  if EReceptora.Text <> '' then
    RPMadreRec := '%'+EReceptora.Text+'%'
  else
    RPMadreRec := '%';
end;

procedure TFEveAltaDirecta.EReceptoraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
  begin
    Button2.Click;
    key:= #0;
  end;
end;

function TFEveAltaDirecta.AgregarAnimalExterno(Sexo : Integer) : Integer;
var Iabm: IButtonABM;
    form:TFABMPadresExternos;
    rpAux: String;
begin
  inherited;
  try
    form := TFABMPadresExternos.Create(self);
    Iabm := IButtonABM(form);
    Iabm.IFitrate(Sexo,FPrincipal.EstablecimientoActual);
    Iabm.ISetCampoRetorno('id_animal_externo');
    Iabm.IAbrir(faAbm);

    if ((nroID <> -1) and (nroID <> 0)) then
    begin
        Result := nroID;
        nroID := -1;
    end
    else
    begin
        Result := -1;
    end;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    MostrarMensaje(tmError, 'No se pudo abrir el formulario de animales externos');
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

function TFEveAltaDirecta.AgregarAnimalInterno(Sexo : Integer) : Integer;
begin
end;

procedure TFEveAltaDirecta.Button3Click(Sender: TObject);
var
  SQLInt : String;
  SQLExt : String;
  F : TFPosiblesMadres;
begin
  inherited;
  //FrameSeleccionPadres.IBQDisponibles.Close;
  SQLInt := 'select id_animal as id, id_rp, id_hba, nombre, apodo, ''INTERNO'' as Tipo from tab_animales where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (categoria = 3) and Activo = ''S'' and (establecimiento = :esta)';
  SQLExt := 'select id_animal_externo as id, id_rp, id_hba, nombre, apodo, ''EXTERNO'' as Tipo from tab_animales_externos where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (sexo = 1) and (establecimiento = :esta)';
  F := TFPosiblesMadres.Create(self);
  F.PTitulo.Caption := 'Seleccionar Padre';
  F.LTitulo.Caption := 'Seleccionar Padre';
  F.IBQMBiologica.Close;
  F.IBQMBiologica.SQL.Clear;
  if CBPInt.Checked  and CBPExt.Checked then
  begin
    F.IBQMBiologica.SQL.Add(SQLInt+' union '+SQLExt);
  end
  else
  begin
    if (CBPInt.Checked) and not(CBPExt.Checked) then
      F.IBQMBiologica.SQL.Add(SQLInt)
    else
      if not (CBPInt.Checked) and (CBPExt.Checked) then
        F.IBQMBiologica.SQL.Add(SQLExt);
  end;
  if Length(RPMadreBio) > 10 then
    F.IBQMBiologica.ParamByName('rp').Value := null
  else
    F.IBQMBiologica.ParamByName('rp').AsString := Uppercase(RPMadreBio);
  F.IBQMBiologica.ParamByName('nom').AsString := Uppercase(RPMadreBio);
  F.IBQMBiologica.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  F.IBQMBiologica.Open;
  F.IBQMBiologica.Last;
  F.IBQMBiologica.First;
  if not F.IBQMBiologica.IsEmpty then
  begin
    if F.IBQMBiologica.RecordCount > 1 then
    begin
      F.LSeleccion.Caption := 'Seleccione el padre';
      F.LBuscarMBiolo.Caption := 'Buscar Padre';
      F.ShowModal;
      LSeleccionP.Caption := 'Padre Seleccionado - RP: '+F.RP+' HBA: '+F.HBA+' Nombre: '+F.Nombre;
      LSeleccionP.Visible := true;
      TipoPadre := F.TipoM;
      id_padre := F.id_madre;
      if id_padre = -1 then
        LSeleccionP.Caption := 'No se selecciono ningún Padre';
    end
    else
    begin
      LSeleccionP.Caption := 'Padre Seleccionado - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
      if F.IBQMBiologica.FieldValues['id_hba'] <> null then
        LSeleccionP.Caption := LSeleccionP.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
      if F.IBQMBiologica.FieldValues['nombre'] <> null then
        LSeleccionP.Caption := LSeleccionP.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
      LSeleccionP.Visible := true;
      TipoPadre := F.TipoM;
      id_padre := F.id_madre;
    end;
  end
  else
  begin
    if MostrarMensaje(tmConsulta,'No se encontraron Animales. Desea Cargar el Padre?')= mrYes then
    begin
      if CBPExt.Checked then
      begin
        id_padre := AgregarAnimalExterno(1);
        if id_padre <> -1 then
        begin
          F.IBQMBiologica.Close;
          F.IBQMBiologica.SQL.Clear;
          F.IBQMBiologica.SQL.Add(SQLExt);
          F.IBQMBiologica.ParamByName('rp').AsString := '%';
          F.IBQMBiologica.ParamByName('nom').AsString := '%';
          F.IBQMBiologica.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          F.IBQMBiologica.Open;
          F.IBQMBiologica.Locate('id',id_padre,[]);
          LSeleccionP.Caption := 'Padre Seleccionado - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
          if F.IBQMBiologica.FieldValues['id_hba'] <> null then
            LSeleccionP.Caption := LSeleccionP.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
          if F.IBQMBiologica.FieldValues['nombre'] <> null then
            LSeleccionP.Caption := LSeleccionP.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
          LSeleccionP.Visible := true;
          TipoPadre := 'EXTERNO';
        end;
      end
      else
        id_madreB := AgregarAnimalInterno(2);
    end;
  end;
end;

procedure TFEveAltaDirecta.Image5Click(Sender: TObject);
var
    F : TFPosiblesMadres;
    SQLExt : String;
begin
  inherited;
  SQLExt := 'select id_animal_externo as id, id_rp, id_hba, nombre, apodo, ''EXTERNA'' as Tipo from tab_animales_externos where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (sexo = 2) and (establecimiento = :esta)';
  F := TFPosiblesMadres.Create(self);
  F.IBQMBiologica.Close;
  F.IBQMBiologica.SQL.Clear;
  id_madreB := AgregarAnimalExterno(2);
        if id_madreB <> -1 then
        begin
          TipoMadreB := 'EXTERNA';
          F.IBQMBiologica.Close;
          F.IBQMBiologica.SQL.Clear;
          F.IBQMBiologica.SQL.Add(SQLExt);
          F.IBQMBiologica.ParamByName('rp').AsString := '%';
          F.IBQMBiologica.ParamByName('nom').AsString := '%';
          F.IBQMBiologica.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          F.IBQMBiologica.Open;
          F.IBQMBiologica.Locate('id',id_madreB,[]);
          LMSeleccionadaB.Caption := 'Madre Biológica Seleccionada - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
          if F.IBQMBiologica.FieldValues['id_hba'] <> null then
            LMSeleccionadaB.Caption := LMSeleccionadaB.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
          if F.IBQMBiologica.FieldValues['nombre'] <> null then
            LMSeleccionadaB.Caption := LMSeleccionadaB.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
          LMSeleccionadaB.Visible := true;
        end;

end;

procedure TFEveAltaDirecta.Image7Click(Sender: TObject);
var
    F : TFPosiblesMadres;
    SQLExt : String;
begin
  inherited;
  SQLExt := 'select id_animal_externo as id, id_rp, id_hba, nombre, apodo, ''EXTERNA'' as Tipo from tab_animales_externos where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (sexo = 2) and (establecimiento = :esta)';
  F := TFPosiblesMadres.Create(self);
  F.IBQMBiologica.Close;
  F.IBQMBiologica.SQL.Clear;
  id_madreR := AgregarAnimalExterno(2);
        if id_madreR <> -1 then
        begin
          TipoMadreR := 'EXTERNA';
          F.IBQMBiologica.Close;
          F.IBQMBiologica.SQL.Clear;
          F.IBQMBiologica.SQL.Add(SQLExt);
          F.IBQMBiologica.ParamByName('rp').AsString := '%';
          F.IBQMBiologica.ParamByName('nom').AsString := '%';
          F.IBQMBiologica.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          F.IBQMBiologica.Open;
          F.IBQMBiologica.Locate('id',id_madreR,[]);
          LMSeleccionadaR.Caption := 'Madre Receptora Seleccionada - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
          if F.IBQMBiologica.FieldValues['id_hba'] <> null then
            LMSeleccionadaR.Caption := LMSeleccionadaR.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
          if F.IBQMBiologica.FieldValues['nombre'] <> null then
            LMSeleccionadaR.Caption := LMSeleccionadaR.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
          LMSeleccionadaR.Visible := true;
        end;
        F.Destroy;
end;

procedure TFEveAltaDirecta.Image8Click(Sender: TObject);
var
    F : TFPosiblesMadres;
    SQLExt : String;
begin
  inherited;
  SQLExt := 'select id_animal_externo as id, id_rp, id_hba, nombre, apodo, ''EXTERNO'' as Tipo from tab_animales_externos where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (sexo = 1) and (establecimiento = :esta)';
  F := TFPosiblesMadres.Create(self);
  F.IBQMBiologica.Close;
  F.IBQMBiologica.SQL.Clear;
  id_padre := AgregarAnimalExterno(1);
        if id_padre <> -1 then
        begin
          F.IBQMBiologica.Close;
          F.IBQMBiologica.SQL.Clear;
          F.IBQMBiologica.SQL.Add(SQLExt);
          F.IBQMBiologica.ParamByName('rp').AsString := '%';
          F.IBQMBiologica.ParamByName('nom').AsString := '%';
          F.IBQMBiologica.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          F.IBQMBiologica.Open;
          F.IBQMBiologica.Locate('id',id_padre,[]);
          LSeleccionP.Caption := 'Padre Seleccionado - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
          if F.IBQMBiologica.FieldValues['id_hba'] <> null then
            LSeleccionP.Caption := LSeleccionP.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
          if F.IBQMBiologica.FieldValues['nombre'] <> null then
            LSeleccionP.Caption := LSeleccionP.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
          LSeleccionP.Visible := true;
          TipoPadre := 'EXTERNO';
        end;

  F.Destroy
end;

procedure TFEveAltaDirecta.AAnteriorExecute(Sender: TObject);
begin
  inherited;
  PCBasicoChange(nil);
end;

end.





