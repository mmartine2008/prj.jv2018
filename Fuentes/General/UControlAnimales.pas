unit UControlAnimales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, Buttons, PngImage, jpeg, Grids, DBGrids,
  UBDBGrid, UPrincipal, JvFullColorSpaces, JvFullColorCtrls, EditAuto,
  ImgList, Menus, UEveSimple, UEveEliminarAnimal, JvExExtCtrls, JvImage,
  Mask, PngImageList, ULectorElectronico,ULectorAllFlexSerie, Spin,
  AdvPicture, DBCtrls, UDBLookupComboBoxAuto, DateUtils, ThumbnailList,
  JvExtComponent, JvCaptionPanel, UMensajeGuardarVincular;

type
  TArrayPointer = ^TArrayStoreProcedure;

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

  TFControlAnimales = class(TFUniversal)
    PCentral: TPanel;
    PSuperior: TPanel;
    PIzq: TPanel;
    GBListadoAnimales: TGroupBox;
    BDBGListado: TBitDBGrid;
    DSListadoAnimales: TDataSource;
    ISubirIzq: TImage;
    IBajarIzq: TImage;
    PDer: TPanel;
    IBQRodeo: TIBQuery;
    IBQPotrero: TIBQuery;
    IBQOrigen: TIBQuery;
    IBQCategoria: TIBQuery;
    IBQRazas: TIBQuery;
    PMListadoAnimales: TPopupMenu;
    ListadodeAnimales1: TMenuItem;
    ListadodeAnimalesCab1: TMenuItem;
    ImageList1: TImageList;
    IBQParametros: TIBQuery;
    ActionList1: TActionList;
    Action1: TAction;
    ACSalir: TAction;
    ACReportPrint: TAction;
    ACReportPreview: TAction;
    AVerFicha: TAction;
    AImprimirListado: TAction;
    AEliminarAnimal: TAction;
    IBQAux: TIBQuery;
    IBStoredProc1: TIBStoredProc;
    PopupMenu1: TPopupMenu;
    IBQTipoRegistro: TIBQuery;
    IBQColor: TIBQuery;
    IBQEstadoRepro: TIBQuery;
    IBQCondCorporal: TIBQuery;
    IBQEstadoParicion: TIBQuery;
    ISubirDer: TImage;
    IBajarDer: TImage;
    PBotones: TPanel;
    IFondoB: TImage;
    IAyuda: TImage;
    LAyuda: TLabel;
    IPreview: TImage;
    LPreliminar: TLabel;
    IExcel: TImage;
    LExcel: TLabel;
    ISalir: TImage;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    BBAyuda: TBitBtn;
    BitBtn1: TBitBtn;
    BBXls: TBitBtn;
    BBSalir: TBitBtn;
    BBImprimirListado: TBitBtn;
    BBFichaAnimal: TBitBtn;
    BBEliminarAnimal: TBitBtn;
    TPanel: TTimer;
    PSuperiorFiltros: TPanel;
    PFiltros: TPanel;
    GBFiltros: TGroupBox;
    CBRodeo: TComboBox;
    CBPotrero: TComboBox;
    CBOrigen: TComboBox;
    CBCategoria: TComboBox;
    CBEstadoRepro: TComboBox;
    CBCantPartos: TComboBox;
    CBRaza: TComboBox;
    CBTipoRegistro: TComboBox;
    CBColor: TComboBox;
    CBCondCorporal: TComboBox;
    GBPeso: TGroupBox;
    LPesoHasta: TLabel;
    LPesoDesde: TLabel;
    LPeso: TLabel;
    EAPesoHasta: TEditAuto;
    EAPesoDesde: TEditAuto;
    GBFrame: TGroupBox;
    LFrameHasta: TLabel;
    LFrameDesde: TLabel;
    LFrame: TLabel;
    EAFrameHasta: TEditAuto;
    EAFrameDesde: TEditAuto;
    GBNacidos: TGroupBox;
    LY: TLabel;
    LNacidosEntre: TLabel;
    DTPHasta: TDateTimePicker;
    DTPDesde: TDateTimePicker;
    EAHastaDia: TEdit;
    EAHastaMes: TEdit;
    EAHastaAnio: TEdit;
    Label2: TLabel;
    GBFechaDesde: TGroupBox;
    EADesdeMes: TEdit;
    Label1: TLabel;
    EADesdeAnio: TEdit;
    EADesdeDia: TEdit;
    GBFechaHasta: TGroupBox;
    TimerLector: TTimer;
    IBDSAnimales: TIBDataSet;
    IBQBuscarAnimal: TIBQuery;
    IBQAnimales: TIBQuery;
    IBQAlta: TIBQuery;
    IBQObservacion: TIBQuery;
    IBQPropietarios: TIBQuery;
    IBQArbolAux: TIBQuery;
    IBQFechaBaja: TIBQuery;
    IBQAltaNacimientos: TIBQuery;
    IBQuery1: TIBQuery;
    IBQImagen: TIBQuery;
    IBQRegDep: TIBQuery;
    IBQPadres: TIBQuery;
    IBQAnioParaDeps: TIBQuery;
    IBQDEPS: TIBQuery;
    IBQDEPsAnimal: TIBQuery;
    IBQRazaAnimal: TIBQuery;
    IBQFuenteDeps: TIBQuery;
    DSFuentesDeps: TDataSource;
    ImSexo: TImageList;
    JvSeleccionImagen: TJvCaptionPanel;
    THLAnimales: TThumbnailList;
    PngImageList1: TPngImageList;
    PFicha: TPanel;
    PCFichaAnimal: TPageControl;
    TSBasicos: TTabSheet;
    LabelNacimiento: TLabel;
    LabelSexo: TLabel;
    LabelPeso: TLabel;
    LabelCategoria: TLabel;
    LabelRaza: TLabel;
    LabelEstado: TLabel;
    LabelFechaAlta: TLabel;
    LabelTipoAlta: TLabel;
    LabelEdad: TLabel;
    LabelPrecioCompra: TLabel;
    LabelRazaValue: TLabel;
    LabelNacimientoValue: TLabel;
    LabelEdadValue: TLabel;
    LabelPesoValue: TLabel;
    LabelSexoValue: TLabel;
    LabelCategoriaValue: TLabel;
    LabelEstadoActual: TLabel;
    LabelFechaAltaValue: TLabel;
    LabelTipoAltaValue: TLabel;
    LabelPrecioCompraValue: TLabel;
    Label3: TLabel;
    LabelPotreroValue: TLabel;
    Label4: TLabel;
    LabelRodeoValue: TLabel;
    Label5: TLabel;
    LabelCronoValue: TLabel;
    LabelEstadoL: TLabel;
    LabelEstadoLactacion: TLabel;
    LDtaIngreso: TLabel;
    LDtaValueIngreso: TLabel;
    LDtaEgreso: TLabel;
    LDtaValueEgreso: TLabel;
    LabelPropietario: TLabel;
    LPropietario1: TLabel;
    LabelSubcategoria: TLabel;
    LabelSubcategoriaValue: TLabel;
    Label79: TLabel;
    LabelCodigoManejoValue: TLabel;
    LNroFolioValue: TLabel;
    LNroFolio: TLabel;
    LLinea: TLabel;
    LLineaValue: TLabel;
    LPropietario2: TLabel;
    LPropietario3: TLabel;
    LPropietario4: TLabel;
    LPropietario5: TLabel;
    LMocho: TLabel;
    LMochoValue: TLabel;
    LInspeccion: TLabel;
    LInspeccionValue: TLabel;
    LDestino: TLabel;
    LDestinoValue: TLabel;
    LabelNombreAnimal: TLabel;
    LabelNombreAnimalValue: TLabel;
    LColor: TLabel;
    LColorValue: TLabel;
    TSIdenficadores: TTabSheet;
    LabelIDSenasa: TLabel;
    LabelIDPC: TLabel;
    LabelIDHBA: TLabel;
    LabelIDRA: TLabel;
    LabelIDOtro: TLabel;
    LabelIDSenasaValue: TLabel;
    LabelIDPCValue: TLabel;
    LabelIDHBAValue: TLabel;
    LabelIDRAValue: TLabel;
    LabelIDOtroValue: TLabel;
    LDigVerif: TLabel;
    Ldigito: TLabel;
    LabelIE: TLabel;
    LabelIDIEValue: TLabel;
    LTipSang: TLabel;
    LTipSangValue: TLabel;
    TSTV: TTabSheet;
    TVArbolGenea: TTreeView;
    GBDatosAnimalSeleccionado: TGroupBox;
    LabelGeneaRP: TLabel;
    LabelGeneaPC: TLabel;
    LabelGeneaHBA: TLabel;
    LabelGeneaRA: TLabel;
    LabelGeneaOtro: TLabel;
    LabelGeneaRaza: TLabel;
    LabelGeneaRPValue: TLabel;
    LabelGeneaPCValue: TLabel;
    LabelGeneaHBAValue: TLabel;
    LabelGeneaRAValue: TLabel;
    LabelGeneaOtroValue: TLabel;
    LabelGeneaRazaValue: TLabel;
    LColorGenea: TLabel;
    LColorGeneaValue: TLabel;
    BGenealogiaCompleta: TButton;
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
    Shape67: TShape;
    Shape68: TShape;
    Shape69: TShape;
    Shape70: TShape;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    IModificar: TImage;
    IImprimirHistorico: TImage;
    IGuardar: TImage;
    ICancelDeps: TImage;
    LModifValores: TLabel;
    LImprimir: TLabel;
    LGuardar: TLabel;
    LCancelar: TLabel;
    BBModificarDep: TBitBtn;
    BBImprimirDeps: TBitBtn;
    BBGuardar: TBitBtn;
    BBCancelar: TBitBtn;
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
    Panel5: TPanel;
    LFuente: TLabel;
    DBLCBAFuenteDeps: TDBLookupComboBoxAuto;
    TabSheet1: TTabSheet;
    APPreview: TAdvPicture;
    Panel1: TPanel;
    Label6: TLabel;
    IAgregaFoto: TImage;
    IELiminaFOto: TImage;
    ISelFoto: TImage;
    LAgregaFoto: TLabel;
    LEliminaFoto: TLabel;
    LSelFoto: TLabel;
    CBMostrarDescripcion: TCheckBox;
    SpinEdit1: TSpinEdit;
    CBMultiColumnas: TCheckBox;
    BBAgregarFoto: TBitBtn;
    BBEliminarFoto: TBitBtn;
    BBSeleccionFoto: TBitBtn;
    TSObservacion: TTabSheet;
    MObservacion: TMemo;
    PRP: TPanel;
    LRPAnimal: TLabel;
    IBQActCaravana: TIBQuery;
    IBQIe: TIBQuery;
    IBQYaFiltrado: TIBQuery;
    procedure BDBGListadoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IBajarIzqClick(Sender: TObject);
    procedure ISubirIzqClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBTodosClick(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
    procedure CBPotreroChange(Sender: TObject);
    procedure CBOrigenChange(Sender: TObject);
    procedure IFichaClick(Sender: TObject);
    procedure CBRazaChange(Sender: TObject);
    procedure CBColorChange(Sender: TObject);
    procedure CBTipoRegistroChange(Sender: TObject);
    procedure CBCategoriaChange(Sender: TObject);
    procedure CBEstadoReproChange(Sender: TObject);
    procedure CBCondCorporalChange(Sender: TObject);
    procedure CBCantPartosChange(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure EAPesoDesdeChange(Sender: TObject);
    procedure EAPesoHastaChange(Sender: TObject);
    procedure EAFrameDesdeChange(Sender: TObject);
    procedure EAFrameHastaChange(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure IPreviewClick(Sender: TObject);
    procedure LRepIndividualClick(Sender: TObject);
    procedure TPanelTimer(Sender: TObject);
    procedure IEliminarAnimClick(Sender: TObject);
    procedure EARPKeyPress(Sender: TObject; var Key: Char);
    procedure EAPesoDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure EAPesoHastaKeyPress(Sender: TObject; var Key: Char);
    procedure EAFrameDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure EAFrameHastaKeyPress(Sender: TObject; var Key: Char);
    procedure CBAnimalesInactivosClick(Sender: TObject);
    procedure EADesdeDiaKeyPress(Sender: TObject; var Key: Char);
    procedure EADesdeMesKeyPress(Sender: TObject; var Key: Char);
    procedure EADesdeAnioKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaDiaKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaMesKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaMesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAHastaDiaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADesdeAnioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADesdeMesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EADesdeDiaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAHastaAnioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAHastaAnioKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaAnioChange(Sender: TObject);
    procedure EAHastaMesChange(Sender: TObject);
    procedure EAHastaDiaChange(Sender: TObject);
    procedure EADesdeAnioChange(Sender: TObject);
    procedure EADesdeMesChange(Sender: TObject);
    procedure EADesdeDiaChange(Sender: TObject);
    procedure CBRazaCloseUp(Sender: TObject);
    procedure CBCategoriaCloseUp(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure CBColorCloseUp(Sender: TObject);
    procedure CBEstadoReproCloseUp(Sender: TObject);
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure CBTipoRegistroCloseUp(Sender: TObject);
    procedure CBCondCorporalCloseUp(Sender: TObject);
    procedure CBOrigenCloseUp(Sender: TObject);
    procedure CBCantPartosCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerLectorTimer(Sender: TObject);
    procedure BGenealogiaCompletaClick(Sender: TObject);
    procedure PCFichaAnimalChange(Sender: TObject);
    procedure BDBGListadoCellClick(Column: TColumn);
  private
    { Private declarations }

    nodoPrincipal, nodoSeleccionado : TTreeNode;
    arreglo11 : array of TArrayPointer;
    NivelGenealogia : Integer;
    id_dep : Integer;
    Filtrar : Boolean;

    function ExisteAnimal(animal, padre_de : Integer; Nodos : Array of TRegDatosArbol) : Boolean;
    procedure AgregarColumnaExcel(var column: TxlColumn;
  alig: TAlignment; coldwidth: Integer; datafield, title: String;
  save: Boolean);
    function AplicarFiltros : Boolean;

    procedure CargarGenea5(animal : integer);
    procedure retornarAlternativo(id: integer; externo: boolean; var identif, value: string);
    function calcularEdad: string;
    procedure Exportar;    

    function BuscarArchivo(const directorio, mascara, NomArch: string; atributos: Integer) : String;
    procedure ActualizarDatosAnimal(id_animal : Integer);
    procedure CargarImagenesAnimal();

    procedure CargarDeps();
    procedure ClearDeps;
    procedure HabilitarFuentesDEPs;
    
    procedure AutoAjustarColumnas;
    procedure AbrirSqlFiltros;
    procedure CargarCombos;
    procedure InicializarIDS;
    procedure InicializarCombos;
    procedure LimpiarFiltros;

    procedure crearLector;
    procedure cerrarLector;
    procedure CargarDatosGeneralesDeps();

    procedure ListadoDeAnimales(Sender : Tobject);
    procedure AbrirEventoIndividual(Eve : TFEveSimple);
    procedure HabilitarDeshabilitarOpcionesDeFiltrado(val : boolean);
    procedure CargarTiposRegistro(id_raza : integer);
    function ArmarFecha(id : integer) : string;
    procedure ChequearPrimeraFecha;
    procedure ChequearSegundaFecha;
    procedure AgregarAnimal(id, tipo : integer; IE : String);
    procedure ArmarArbol2( animal : Integer; nodoPadre : TTreeNode; EXT : String);
    function partirString(nom:string;pos:integer):string;
    procedure ActualizarCaravana(caravana : String);
  public
    { Public declarations }
  end;

var
  FControlAnimales: TFControlAnimales;
  vActivos, consulta, queryOrig, queryAgr, valId, queryUnion : string;
  filtrado : boolean;
  id_rodeo, id_potrero, id_origen, id_raza, id_color, id_tipo_reg, id_categoria,
  id_estado_repro, id_cond_corpo, id_cant_partos, cantAnimalesPrinc, id_fecha_desde, id_fecha_hasta, id_peso_desde, id_peso_hasta, id_frame_desde, id_frame_hasta : integer;
  txtNoAplicaFiltro : string = 'NO USAR FILTRO';
  fecha_D_Ok : boolean = false;
  fecha_H_Ok : boolean = false;
  DelRaza : boolean = false;
  DelCategoria : boolean = false;
  DelTR : boolean = false;
  DelCC : boolean = false;
  DelCP : boolean = false;
  DelColor : boolean = false;
  DelPotrero : boolean = false;
  DelRodeo : boolean = false;
  DelOrigen : boolean = false;
  DelEstado : boolean = false;
  cantDD, cantMD, cantAD, cantDH, cantMH, cantAH : integer;
  //FLectorElectronico:TLectorElectronico;
  CantidadAnimales : integer;

implementation

uses UREPFichaAnimal, UCartel, UREPHistorialAnimalPreview, UMensajeHuella, UTraduccion, UMensajeImpresora,
  UDMSoftvet, UFunctions, UEveAltaDirecta, UPosiblesMadres;

{$R *.dfm}

function TFControlAnimales.ArmarFecha(id : integer) : string;
var fecha : string;
    diaOk, mesOk, anioOk : boolean;
begin

     diaOk := false;
     mesOk := false;
     anioOk := false;

     if (id = 0) then //fecha desde
     begin
          if ((Length(EADesdeDia.Text) = 1) and (EADesdeDia.Text <> '0')) then
          begin
              fecha := '0'+EADesdeDia.Text;
              diaOk := true;
          end
          else
              if (EADesdeDia.Text >= '01') and (EADesdeDia.Text <= '31') then
              begin
                fecha := EADesdeDia.Text;
                diaOk := true;
              end
              else
              begin
                diaOk := false;
                MostrarMensaje(tmError,'Valor de día ingresado no valido.');
                EADesdeDia.SetFocus;
              end;

          if (Length(EADesdeMes.Text) = 1) then
          begin
              mesOk := true;
              fecha := fecha+'/0'+EADesdeMes.Text;
          end
          else
              if (EADesdeMes.Text >= '01') and (EADesdeMes.Text <= '12') then
              begin
                fecha := fecha+'/'+EADesdeMes.Text;
                mesOk := true;
              end
              else
              begin
                mesOk := false;
                MostrarMensaje(tmError,'Valor de mes ingresado no valido.');
                EADesdeMes.SetFocus;
              end;

          if (Length(EADesdeAnio.Text) = 2) then
          begin
              fecha := fecha+'/20'+EADesdeAnio.Text;
              if ((diaOk) and (mesOk)) then
                fecha_D_Ok := true;
          end
          else
          begin
//              if (Length(EADesdeAnio.Text) > 3) then
//              begin
                fecha := fecha+'/'+EADesdeAnio.Text;
                if ((diaOk) and (mesOk)) then
                  fecha_D_Ok := true;
//              end
//              else
//              begin
//                anioOk := false;
//                MostrarMensaje(tmError,'Valor de año ingresado no valido.');
//                EADesdeAnio.SetFocus;
//              end;
          end;
     end
     else
     begin
          if ((Length(EAHastaDia.Text) = 1) and (EAHastaDia.Text <> '0')) then
          begin
              diaOk := true;
              fecha := '0'+EAHastaDia.Text;
          end
          else
              if (EAHastaDia.Text >= '01') and (EAHastaDia.Text <= '31') then
              begin
                fecha := EAHastaDia.Text;
                diaOk := true;
              end
              else
              begin
                diaOk := false;
                MostrarMensaje(tmError,'Valor de día ingresado no valido.');
                EAHastaDia.SetFocus;
              end;

          if (Length(EAHastaMes.Text) = 1) then
          begin
              mesOk := true;
              fecha := fecha+'/0'+EAHastaMes.Text;
          end
          else
              if (EAHastaMes.Text >= '01') and (EAHastaMes.Text <= '12') then
              begin
                fecha := fecha+'/'+EAHastaMes.Text;
                mesOk := true;
              end
              else
              begin
                mesOk := false;
                MostrarMensaje(tmError,'Valor de mes ingresado no valido.');
                EAHastaMes.SetFocus;
              end;

          if (Length(EAHastaAnio.Text) = 2) then
          begin
              fecha := fecha+'/20'+EAHastaAnio.Text;
              if ((diaOk) and (mesOk)) then
                fecha_H_Ok := true;
          end
          else
          begin
//              if (Length(EAHastaAnio.Text) > 3) then
  //            begin
                fecha := fecha+'/'+EAHastaAnio.Text;
                if ((diaOk) and (mesOk)) then
                  fecha_H_Ok := true;
//              end
//              else
//              begin
//                anioOk := false;
//                MostrarMensaje(tmError,'Valor de año ingresado no valido.');
//                EAHastaAnio.SetFocus;
//              end;
          end;
     end;

     Result := fecha;
end;

procedure TFControlAnimales.BDBGListadoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Num: Integer;
  R: TRect;
begin

    if (BDBGListado.DataSource.DataSet.FieldByName('activo').AsString = 'N') then
    begin
      if (gdSelected in State) then
      begin
        //BDBGListado.Canvas.Brush.Color := RGB(0, 149, 130);
        BDBGListado.Canvas.Brush.Color := RGB(139, 181, 107);
        BDBGListado.Canvas.Font.Style := [fsBold];
        BDBGListado.Canvas.Font.Color := clBlack;
      end
      else
      begin
        BDBGListado.Canvas.Brush.Color := clWhite;
        BDBGListado.Canvas.Font.Color := clGray;
      end;
    end
    else
    begin
      if IBDSAnimales.FieldByName('id_aux').Value = 0 then
      begin
        BDBGListado.Canvas.Brush.Color := RGB(31, 154, 49);
        BDBGListado.Canvas.Font.Color := clWhite;
      end;
      if IBDSAnimales.FieldByName('id_aux').Value = 1 then
      begin
        BDBGListado.Canvas.Brush.Color := RGB(230, 216, 40);
        BDBGListado.Canvas.Font.Color := clBlack;
      end;
      if IBDSAnimales.FieldByName('id_aux').Value = 2 then
      begin
        BDBGListado.Canvas.Brush.Color := RGB(232, 48, 38);
        BDBGListado.Canvas.Font.Color := clWhite;
      end;
      if (gdSelected in State) then
        BDBGListado.Canvas.Font.Style := [fsBold];

    end;

    BDBGListado.DefaultDrawColumnCell(rect,DataCol,Column,State);

end;

procedure TFControlAnimales.IBajarIzqClick(Sender: TObject);
begin

  BDBGListado.SelectedRows.CurrentRowSelected := false;
  BDBGListado.DataSource.DataSet.Next;
  BDBGListado.SetFocus;

end;

procedure TFControlAnimales.ISubirIzqClick(Sender: TObject);
begin

  BDBGListado.SelectedRows.CurrentRowSelected := false;
  BDBGListado.DataSource.DataSet.Prior;
  BDBGListado.SetFocus;

end;

procedure TFControlAnimales.FormShow(Sender: TObject);
begin
  inherited;
  CantidadAnimales := 0;

  NivelGenealogia := 3;

  BDBGListado.DataSource.DataSet.Last;
  BDBGListado.DataSource.DataSet.First;

  GBListadoAnimales.Caption := ' Listado Animales. Cantidad: '+ IntToStr(BDBGListado.DataSource.DataSet.RecordCount) +' ';

{  CBTodos.Checked := false;
  CBInactivos.Checked := false;
  CBActivos.Checked := true;
}
  if FPrincipal._USO_DISP then
  begin
    DMSoftvet.IBQDatosAnimal.Close;
    DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQDatosAnimal.Open;
    //crearLector;
    TimerLector.Enabled:=true;
  end;

  if not FPrincipal.FuncDEPs then
  begin


    BDBGListado.Columns[1].Visible := false;
    BDBGListado.Columns[2].Visible := false;
    BDBGListado.Columns[3].Visible := false;

    CBCantPartos.Left := CBTipoRegistro.Left;
    CBTipoRegistro.Visible := false;

  end;

  Filtrar := true;

  PSuperior.Align := alTop;
  PSuperior.BringToFront;
  PCentral.Align := alClient;
  PFicha.SendToBack;

end;

procedure TFControlAnimales.AutoAjustarColumnas;
var ind_col : integer;
begin

       for ind_col := 0 to BDBGListado.Columns.Count - 1 do
       begin
           BDBGListado.Columns[ind_col].Title.Alignment := taCenter;
           BDBGListado.Columns[ind_col].Title.Font.Size := 9;
           BDBGListado.Columns[ind_col].Title.Font.Style := BDBGListado.Columns[ind_col].Title.Font.Style + [fsBold];
       end;

       if FPrincipal.FuncDEPs then
       begin
         BDBGListado.Columns[0].Width := 70;
         BDBGListado.Columns[1].Width := 70;
         BDBGListado.Columns[2].Width := 300;
         BDBGListado.Columns[3].Width := 40;
         BDBGListado.Columns[4].Width := 90;
         BDBGListado.Columns[5].Width := 90;
         BDBGListado.Columns[6].Width := 40;
         BDBGListado.Columns[7].Width := 85;
         BDBGListado.Columns[8].Width := 75;
       end
       else
       begin
          BDBGListado.Columns[0].Width := 170;
          BDBGListado.Columns[4].Width := 144;
          BDBGListado.Columns[5].Width := 133;
          BDBGListado.Columns[6].Width := 169;
          BDBGListado.Columns[7].Width := 153;
          BDBGListado.Columns[8].Width := 100;
       end;

end;

procedure TFControlAnimales.ISalirClick(Sender: TObject);
begin

  Close();

end;

procedure TFControlAnimales.FormCreate(Sender: TObject);
begin
  inherited;

  IBDSAnimales.Close;
  IBDSAnimales.Open;

  filtrado := false;

  queryAgr := '';
  id_dep := -1;

  InicializarIDS;
  InicializarCombos;


  AutoAjustarColumnas;

  AbrirSqlFiltros;

  CargarCombos;

end;

procedure TFControlAnimales.CBTodosClick(Sender: TObject);
begin

  consulta := queryOrig;

  queryAgr := StringReplace(queryAgr,' and ta.activo = ''N''','',[rfReplaceAll]);
  queryAgr := StringReplace(queryAgr,' and ta.activo = ''S''','',[rfReplaceAll]);

end;

procedure TFControlAnimales.AbrirSqlFiltros;
begin

  IBQOrigen.Close;
  IBQOrigen.Open;
  IBQOrigen.First;

  IBQPotrero.Close;
  IBQPotrero.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotrero.Open;
  IBQPotrero.First;

  IBQRodeo.Close;
  IBQRodeo.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRodeo.Open;
  IBQRodeo.First;

  IBQRazas.Close;
  IBQRazas.Open;
  IBQRazas.First;

  IBQColor.Close;
  IBQColor.Open;
  IBQColor.First;

  IBQCategoria.Close;
  IBQCategoria.Open;
  IBQCategoria.First;

  IBQEstadoRepro.Close;
  IBQEstadoRepro.Open;
  IBQEstadoRepro.First;

  IBQCondCorporal.Close;
  IBQCondCorporal.Open;
  IBQCondCorporal.First;

  IBQEstadoParicion.Close;
  IBQEstadoParicion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEstadoParicion.Open;
  IBQEstadoParicion.First;

  CargarTiposRegistro(-1);

end;

procedure TFControlAnimales.CargarCombos;
begin

   InicializarCombos;

   CBRaza.AddItem('(TODAS)',nil);
   while not(IBQRazas.Eof) do
   begin
        CBRaza.AddItem(IBQRazas.FieldValues['nombre'],nil);
        IBQRazas.Next;
   end;

   CBColor.AddItem('(TODOS)',nil);
   while not(IBQColor.Eof) do
   begin
        CBColor.AddItem(IBQColor.FieldValues['nombre'],nil);
        IBQColor.Next;
   end;

   CBTipoRegistro.AddItem('(TODOS)',nil);
   while not(IBQTipoRegistro.Eof) do
   begin
        CBTipoRegistro.AddItem(IBQTipoRegistro.FieldValues['sinonimo'],nil);
        IBQTipoRegistro.Next;
   end;

   CBCategoria.AddItem('(TODAS)',nil);
   while not(IBQCategoria.Eof) do
   begin
        CBCategoria.AddItem(IBQCategoria.FieldValues['sinonimo'],nil);
        IBQCategoria.Next;
   end;

   CBEstadoRepro.AddItem('(TODOS)',nil);
   while not(IBQEstadoRepro.Eof) do
   begin
        CBEstadoRepro.AddItem(IBQEstadoRepro.FieldValues['nombre'],nil);
        IBQEstadoRepro.Next;
   end;

   CBCondCorporal.AddItem('(TODAS)',nil);

   IBQParametros.Close;
   IBQParametros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
   IBQParametros.ParamByName('param').AsInteger := 3; //Codigo de la condicion corporal
   IBQParametros.Open;

   while not(IBQCondCorporal.Eof) do
   begin
        if (IBQParametros.FieldValues['valor'] = 10) then
          CBCondCorporal.AddItem(IBQCondCorporal.FieldValues['valor_escala_10'], nil)
        else
          CBCondCorporal.AddItem(IBQCondCorporal.FieldValues['valor_escala_5'], nil);

        IBQCondCorporal.Next;
   end;

   CBCantPartos.AddItem('(TODOS)',nil);
   while not(IBQEstadoParicion.Eof) do
   begin
        CBCantPartos.AddItem(IBQEstadoParicion.FieldValues['estado_lactacion'],nil);
        IBQEstadoParicion.Next;
   end;

   CBOrigen.AddItem('(TODOS)',nil);
   while not(IBQOrigen.Eof) do
   begin
        CBOrigen.AddItem(IBQOrigen.FieldValues['sinonimo'],nil);
        IBQOrigen.Next;
   end;

   CBPotrero.AddItem('(TODOS)',nil);
   while not(IBQPotrero.Eof) do
   begin
        CBPotrero.AddItem(IBQPotrero.FieldValues['nombre'],nil);
        IBQPotrero.Next;
   end;

   CBRodeo.AddItem('(TODOS)',nil);
   while not(IBQRodeo.Eof) do
   begin
        CBRodeo.AddItem(IBQRodeo.FieldValues['nombre'],nil);
        IBQRodeo.Next;
   end;

end;

procedure TFControlAnimales.CBRodeoChange(Sender: TObject);
var txt : string;
begin

    txt := CBRodeo.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_rodeo := -1;
      queryAgr := StringReplace(queryAgr,' and ta.rodeo = :rodeo','',[rfReplaceAll]);
      CBRodeo.Items.Insert(0,'RODEO');
      CBRodeo.ItemIndex := 0;
      DelRodeo := false;
    end
    else
    begin
      id_rodeo := IBQRodeo.Lookup('NOMBRE',txt,'ID_RODEO');
      queryAgr := queryAgr + ' and ta.rodeo = :rodeo';
    end;

    filtrado := true;
    //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.CBPotreroChange(Sender: TObject);
var txt : string;
begin

    txt := CBPotrero.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_potrero := -1;
      queryAgr := StringReplace(queryAgr,' and ta.potrero = :potrero','',[rfReplaceAll]);
      CBPotrero.Items.Insert(0,'POTRERO');
      CBPotrero.ItemIndex := 0;
      DelPotrero := false;
    end
    else
    begin
      id_potrero := IBQPotrero.Lookup('NOMBRE',txt,'ID_POTRERO');
      queryAgr := queryAgr + ' and ta.potrero = :potrero';
    end;
    
    filtrado := true;
    //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.CBOrigenChange(Sender: TObject);
var txt : string;
begin

    txt := CBOrigen.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_origen := -1;
      queryAgr := StringReplace(queryAgr,' and ta.origen_animal = :origen','',[rfReplaceAll]);
      CBOrigen.Items.Insert(0,'ORIGEN');
      CBOrigen.ItemIndex := 0;
      DelOrigen := false;
    end
    else
    begin
      id_origen := IBQOrigen.Lookup('SINONIMO',txt,'ID_ORIGEN');
      queryAgr := queryAgr + ' and ta.origen_animal = :origen';
    end;
    filtrado := true;
    //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.IFichaClick(Sender: TObject);
var
  cartel : TCartel;
  F : TFREPFichaAnimal;
begin
  inherited;

  F := TFREPFichaAnimal.Create(self);
  F.animal := BDBGListado.DataSource.DataSet.FieldValues['id_animal'];
  F.ShowModal;
  F.Destroy;

  //LVerAnimalesClick(sender);

end;

procedure TFControlAnimales.CBRazaChange(Sender: TObject);
var txt : string;
begin

    txt := CBRaza.Text;

    if ((txt = 'RAZA') or (txt = '(TODAS)') or (txt = ''))then
    begin
      id_raza := -1;
      queryAgr := StringReplace(queryAgr,' and ta.raza = :raza','',[rfReplaceAll]);
      CBColor.Enabled := false;
      CBRaza.Items.Insert(0,'RAZA');
      CBRaza.ItemIndex := 0;
      DelRaza := false;
    end
    else
    begin
      if (id_raza = -1) then
        queryAgr := queryAgr + ' and ta.raza = :raza';

      id_raza := IBQRazas.Lookup('NOMBRE',txt,'ID_RAZA');

      if (id_raza = 29) then
        CBColor.Enabled := true
      else
        CBColor.Enabled := false;
    end;

    CargarTiposRegistro(id_raza);
    filtrado := true;
    //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.CBColorChange(Sender: TObject);
var txt : string;
begin

    txt := CBColor.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_color := -1;
      queryAgr := StringReplace(queryAgr,' and ta.color = :color','',[rfReplaceAll]);
      CBColor.Items.Insert(0,'COLOR');
      CBColor.ItemIndex := 0;
      DelColor := false;
    end
    else
    begin
      if (id_color = -1) then
        queryAgr := queryAgr + ' and ta.color = :color';
      id_color := IBQColor.Lookup('NOMBRE',txt,'ID_COLOR');
    end;

    filtrado := true;
    //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.CBTipoRegistroChange(Sender: TObject);
var txt : string;
begin

    txt := CBTipoRegistro.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)')) then
    begin
      id_tipo_reg := -1;
      queryAgr := StringReplace(queryAgr,' and ta.subcategoria = :tipo_reg','',[rfReplaceAll]);
      CBTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
      CBTipoRegistro.ItemIndex := 0;
      DelTR := false;
    end
    else
    begin
      if (id_tipo_reg = -1) then
        queryAgr := queryAgr + ' and ta.subcategoria = :tipo_reg';
      id_tipo_reg := IBQTipoRegistro.Lookup('NOMBRE',txt,'ID_SUBCATEGORIA');
    end;

    filtrado := true;
    //LVerAnimalesClick(sender);

end;

procedure TFControlAnimales.CBCategoriaChange(Sender: TObject);
var txt : string;
begin

    txt := CBCategoria.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODAS)'))then
    begin
      id_categoria := -1;
      queryAgr := StringReplace(queryAgr,' and ta.categoria = :categoria','',[rfReplaceAll]);
      CBCategoria.Items.Insert(0,'CATEGORIA');
      CBCategoria.ItemIndex := 0;
      DelCategoria := false;
    end
    else
    begin
      if (id_categoria = -1) then
        queryAgr := queryAgr + ' and ta.categoria = :categoria';
      id_categoria := IBQCategoria.Lookup('SINONIMO',txt,'ID_CATEGORIA');
    end;

    filtrado := true;
    //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.CBEstadoReproChange(Sender: TObject);
var txt : string;
begin

    txt := CBEstadoRepro.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)')) then
    begin
      id_estado_repro := -1;
      queryAgr := StringReplace(queryAgr,' and ta.estado_reproductivo = :estado_repro','',[rfReplaceAll]);
      CBEstadoRepro.Items.Insert(0,'ESTADO REPRODUCTIVO');
      CBEstadoRepro.ItemIndex := 0;
      DelEstado := false;
    end
    else
    begin
      if (id_estado_repro = -1) then
        queryAgr := queryAgr + ' and ta.estado_reproductivo = :estado_repro';
      id_estado_repro := IBQEstadoRepro.Lookup('NOMBRE',txt,'ID_ESTADO_REPRODUCTIVO');
    end;

    filtrado := true;
    //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.CBCondCorporalChange(Sender: TObject);
var txt : string;
begin

    txt := CBCondCorporal.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODAS)'))then
    begin
      id_cond_corpo := -1;
      queryAgr := StringReplace(queryAgr,' and ta.condicion_corporal = :cond_corpo','',[rfReplaceAll]);
      CBCondCorporal.Items.Insert(0,'CONDICION CORPORAL');
      CBCondCorporal.ItemIndex := 0;
      DelCC := false;
    end
    else
    begin
      if (id_cond_corpo = -1) then
        queryAgr := queryAgr + ' and ta.condicion_corporal = :cond_corpo';

      IBQParametros.Close;
      IBQParametros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQParametros.ParamByName('param').AsInteger := 3; //Codigo de la condicion corporal
      IBQParametros.Open;

      if (IBQParametros.FieldValues['valor'] = 10) then
        id_cond_corpo := IBQCondCorporal.Lookup('valor_escala_10',txt,'ID_CONDICION_CORPORAL')
      else
        id_cond_corpo := IBQCondCorporal.Lookup('valor_escala_5',txt,'ID_CONDICION_CORPORAL')
    end;

    filtrado := true;
    //LVerAnimalesClick(sender);
    
end;

procedure TFControlAnimales.CBCantPartosChange(Sender: TObject);
var txt : string;
begin

    txt := CBCantPartos.Text;

    if ((txt = txtNoAplicaFiltro) or (txt = '(TODOS)'))then
    begin
      id_cant_partos := -1;
      queryAgr := StringReplace(queryAgr,' and ta.estado_lactacion = :cant_partos','',[rfReplaceAll]);
      CBCantPartos.Items.Insert(0,'CANTIDAD DE PARTOS');
      CBCantPartos.ItemIndex := 0;
      DelCP := false;
    end
    else
    begin
      if (id_cant_partos = -1) then
        queryAgr := queryAgr + ' and ta.estado_lactacion = :cant_partos';
      id_cant_partos := StrToInt(CBCantPartos.Text);
    end;

    filtrado := true;
    //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.DTPDesdeChange(Sender: TObject);
var  aNo, Mes, Dia :word;
begin
     DecodeDate(DTPDesde.Date, aNo, Mes, Dia);
     EADesdeDia.Text := IntToStr(Dia);
     EADesdeMes.Text := IntToStr(Mes);
     EADesdeAnio.Text := IntToStr(aNo);

     if (id_fecha_desde = -1) then
     begin
       id_fecha_desde := 1;

       queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';
     end;

    filtrado := true;
    //LVerAnimalesClick(sender);

end;

procedure TFControlAnimales.DTPHastaChange(Sender: TObject);
var  aNo, Mes, Dia :word;
begin
     DecodeDate(DTPHasta.Date, aNo, Mes, Dia);
     EAHastaDia.Text := IntToStr(Dia);
     EAHastaMes.Text := IntToStr(Mes);
     EAHastaAnio.Text := IntToStr(aNo);

     if (id_fecha_hasta = -1) then
     begin
      id_fecha_hasta := 1;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';
     end;

    filtrado := true;
    //LVerAnimalesClick(sender);

end;

procedure TFControlAnimales.EAPesoDesdeChange(Sender: TObject);
begin
     filtrado := true;

     if (EAPesoDesde.Text <> '') then
     begin
       if (id_peso_desde = -1) then
       begin
        id_peso_desde := 1;
        queryAgr := queryAgr + ' and (ta.peso >= :peso_desde)';
       end;
     end
     else
     begin
        id_peso_desde := -1;
        queryAgr := StringReplace(queryAgr,' and (ta.peso >= :peso_desde)','',[rfReplaceAll]);
        //LVerAnimalesClick(sender);
     end;

//     filtrado := true;
//     LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.EAPesoHastaChange(Sender: TObject);
begin
     filtrado := true;

     if (EAPesoHasta.Text <> '' ) then
     begin
       if (id_peso_hasta = -1) then
       begin
        id_peso_hasta := 1;
        queryAgr := queryAgr + ' and (ta.peso <= :peso_hasta)';
       end;
     end
     else
     begin
        id_peso_hasta := -1;
        queryAgr := StringReplace(queryAgr,' and (ta.peso <= :peso_hasta)','',[rfReplaceAll]);
        //LVerAnimalesClick(sender);
     end;

//     filtrado := true;
//     LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.EAFrameDesdeChange(Sender: TObject);
begin

     filtrado := true;

     if (EAFrameDesde.Text <> '') then
     begin
       if (id_frame_desde = -1) then
       begin
        id_frame_desde := 1;
        queryAgr := queryAgr + ' and (ta.frame >= :frame_desde)';
       end;
     end
     else
     begin
        id_frame_desde := -1;
        queryAgr := StringReplace(queryAgr,' and (ta.frame >= :frame_desde)','',[rfReplaceAll]);
        //LVerAnimalesClick(sender);
     end;


//     LVerAnimalesClick(sender);

end;

procedure TFControlAnimales.EAFrameHastaChange(Sender: TObject);
begin
     filtrado := true;

     if (EAFrameHasta.Text <> '') then
     begin
       if (id_frame_hasta = -1) then
       begin
        id_frame_hasta := 1;
        queryAgr := queryAgr + ' and (ta.frame <= :frame_hasta)';
       end;
     end
     else
     begin
        id_frame_hasta := -1;
        queryAgr := StringReplace(queryAgr,' and (ta.frame <= :frame_hasta)','',[rfReplaceAll]);
        //LVerAnimalesClick(sender);
     end;

//     filtrado := true;
//     LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.InicializarIDS;
begin
  id_rodeo := -1;
  id_potrero := -1;
  id_origen := -1;
  id_raza := -1;
  id_color := -1;
  id_tipo_reg := -1;
  id_categoria := -1;
  id_estado_repro := -1;
  id_cond_corpo := -1;
  id_cant_partos := -1;
  id_fecha_desde := -1;
  id_fecha_hasta := -1;
  id_peso_desde := -1;
  id_peso_hasta := -1;
  id_frame_desde := -1;
  id_frame_hasta := -1;
end;

procedure TFControlAnimales.InicializarCombos;
begin
   CBOrigen.ItemIndex := 0;       //.Text := 'ORIGEN';
   CBPotrero.ItemIndex := 0;      //.Text := 'POTRERO';
   CBRodeo.ItemIndex := 0;        //.Text := 'RODEO';
   CBRaza.ItemIndex := 0;         //Text := 'RAZA';
   CBColor.ItemIndex := 0;        //Text := 'COLOR';
   CBColor.Enabled := false;
   CBTipoRegistro.ItemIndex := 0; //Text := 'TIPO DE REGISTRO';
   CBCategoria.ItemIndex := 0;    //Text := 'CATEGORIA';
   CBEstadoRepro.ItemIndex := 0;  //Text := 'ESTADO REPRODUCTIVO';
   CBCondCorporal.ItemIndex := 0; //Text := 'CONDICION CORPORAL';
   CBCantPartos.ItemIndex := 0;   //Text := 'CANTIDAD DE PARTOS';

   DelRaza := false;
   DelCategoria := false;
   DelTR := false;
   DelCC := false;
   DelCP := false;
   DelColor := false;
   DelPotrero := false;
   DelRodeo := false;
   DelOrigen := false;
   DelEstado := false;

end;

procedure TFControlAnimales.LimpiarFiltros;
begin
     id_fecha_desde := -1;
     id_fecha_hasta := -1;
     id_frame_desde := -1;
     id_frame_hasta := -1;
     id_peso_desde := -1;
     id_peso_hasta := -1;
     EAPesoDesde.Text := '';
     EAPesoHasta.Text := '';
     EAFrameDesde.Text := '';
     EAFrameHasta.Text := '';
     DTPDesde.Date := NOw();
     DTPHasta.Date := Now();
end;

procedure TFControlAnimales.IExcelClick(Sender: TObject);
var
  cartel : TCartel;
begin
  inherited;
  if SDXLS.Execute then
  begin
    cartel := TCartel.getInstance;
    cartel.abrircartel('Exportando datos a Excel...');
    //DTXLS.DataSet := BDBGListado.DataSource.DataSet;
    try
      Exportar;
      DTXLS.SaveToFile(SDXLS.FileName);
    except
    end;
    cartel.cerrarcartel;
    cartel.FreeInstance;
  end;
end;

procedure TFControlAnimales.Exportar;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= BDBGListado.DataSource.DataSet;
  DTXLS.Title.Text:= 'LISTADO DE ANIMALES.';

  AgregarColumnaExcel(column,taLeftJustify,2800,'rp','RP ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'hba','HBA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'senasa','SENASA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'nombre','NOMBRE ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'fecha_nac','FECHA NACIMIENTO',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'categoria','CATEGORIA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'raza','RAZA ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'nomsubcat','T.R. ANIMAL',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'estadoAct','ESTADO ACTUAL',True); 
  
end;

procedure TFControlAnimales.AgregarColumnaExcel(var column: TxlColumn;
  alig: TAlignment; coldwidth: Integer; datafield, title: String;
  save: Boolean);
begin
    column:= TxlColumn.Create(nil);
    column:= DTXLS.Columns.Add;
    column.Alignment:= alig;
    column.ColWidth:= coldwidth;
    column.DataField:= datafield;
    column.Save:= save;
    column.Title:= title;
end;

procedure TFControlAnimales.IPreviewClick(Sender: TObject);
begin
  TPanel.Enabled := true;
  //IRepIndividual.Enabled := FPrincipal.FuncActividad;
  //LRepIndividual.Enabled := FPrincipal.FuncActividad;
  //PListados.Top := 0;
end;

procedure TFControlAnimales.LRepIndividualClick(Sender: TObject);
begin
  ListadoDeAnimales(Sender);
end;

procedure TFControlAnimales.ListadoDeAnimales(Sender : Tobject);
var cont : integer;
    cartel: TCartel;
    msje: String;
    Rect: TRect;
    F : TFREPHistorialAnimalPreview;
begin
  MostrarMensajeImpresion();
  cartel:= TCartel.getInstance();
  HabilitarDesabilitarControles();
  msje:= 'Generando vista previa del listado de animales ...';
  cartel.abrircartel(msje);

  inherited;

  self.Tag := 0;

  if (Sender is TJvLabel) then
  begin
    if ((Sender as TJvLabel).Caption = 'Listado de animales') then
      self.Tag := 1
    else
      self.Tag := 2;
  end
  else
  begin
    if ((Sender as TImage).Name = 'IRepPedigree') then
      self.Tag := 1
    else
      self.Tag := 2;
  end;

  F := TFREPHistorialAnimalPreview.Create(self);

  F.IBQListadoAnimal.Close;
  F.IBQListadoAnimal.SQL.Clear;

  cont := 0;

 { if (filtrado) then
  begin
    F.IBQListadoAnimal.SQL.Add(IBQListadoAux.SQL.GetText);
    while (cont < IBQListadoAux.Params.Count) do
    begin
      F.IBQListadoAnimal.ParamByName(IBQListadoAux.Params.Items[cont].Name).Value := IBQListadoAux.Params.Items[cont].Value;
      inc(cont);
    end;
  end
  else
  begin
    F.IBQListadoAnimal.SQL.Add(FPrincipal.IBQListaAnimales.SQL.GetText);
    while (cont < FPrincipal.IBQListaAnimales.Params.Count) do
    begin
      F.IBQListadoAnimal.ParamByName(FPrincipal.IBQListaAnimales.Params.Items[cont].Name).Value := FPrincipal.IBQListaAnimales.Params.Items[cont].Value;
      inc(cont);
    end;
  end;  }

  F.IBQListadoAnimal.Open;
  F.IBQListadoAnimal.Last;
  F.IBQListadoAnimal.First;

  cartel.cerrarcartel();
  cartel.FreeInstance();

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();

end;

procedure TFControlAnimales.TPanelTimer(Sender: TObject);
begin
  inherited;
  TPanel.Enabled := false;
end;

procedure TFControlAnimales.IEliminarAnimClick(Sender: TObject);
begin
  inherited;

  if (MostrarMensaje(tmConsulta, Traducir('¿Está seguro de eliminar el animal ')+ BDBGListado.DataSource.DataSet.FieldValues['rp']+ '?') = mrYes)then
  begin
         AbrirEventoIndividual(TFEveEliminarAnimal.Create(self));
         FPrincipal.IBQListaAnimales.Close;
         FPrincipal.IBQListaAnimales.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
         FPrincipal.IBQListaAnimales.Open;
         FPrincipal.IBTPrincipal.CommitRetaining;
  end;
end;

procedure TFControlAnimales.AbrirEventoIndividual(Eve : TFEveSimple);
begin
  Eve.IDAnimal := BDBGListado.DataSource.DataSet.FieldValues['id_animal'];// IBQAnimales.fieldbyname('ANIMAL').AsInteger;
  Eve.IDRP := BDBGListado.DataSource.DataSet.FieldValues['rp']; //IBQAnimales.fieldbyname('RP').AsString;
  Eve.ConManga := false;
  Eve.ModoEve := meIndividual;
  Eve.ShowModal;
  Eve.Destroy;
end;

procedure TFControlAnimales.HabilitarDeshabilitarOpcionesDeFiltrado(val : boolean);
begin
     CBRaza.Enabled := val;
     CBCategoria.Enabled := val;
     CBEstadoRepro.Enabled := val;
     CBCantPartos.Enabled := val;
     CBCondCorporal.Enabled := val;
     CBOrigen.Enabled := val;
     CBPotrero.Enabled := val;
     CBTipoRegistro.Enabled := val;
     CBRodeo.Enabled := val;
     LNacidosEntre.Enabled := val;
     LY.Enabled := val;
     DTPDesde.Enabled := val;
     DTPHasta.Enabled := val;
     LFrameDesde.Enabled := val;
     LFrameHasta.Enabled := val;
     EAFrameDesde.Enabled := val;
     EAFrameHasta.Enabled := val;
     LPesoDesde.Enabled := val;
     LPesoHasta.Enabled := val;
     EAPesoDesde.Enabled := val;
     EAPesoHasta.Enabled := val; 
end;
procedure TFControlAnimales.EARPKeyPress(Sender: TObject; var Key: Char);
begin

    if (key =#13) then
    begin
      //LVerAnimalesClick(sender);
      Key:= #0;
    end;
end;

procedure TFControlAnimales.CargarTiposRegistro(id_raza : integer);
var raza : integer;
begin

     if (id_raza <> -1) then
        raza := id_raza
     else
     begin
          if not(BDBGListado.DataSource.DataSet.IsEmpty) then
            raza := BDBGListado.DataSource.DataSet.FieldValues['id_raza']
          else
            raza := 0;
     end;

     IBQTipoRegistro.Close;
     IBQTipoRegistro.ParamByName('raza').AsInteger := raza;
     IBQTipoRegistro.Open;

     IBQTipoRegistro.First;
     CBTipoRegistro.Clear;
     CBTipoRegistro.AddItem('TIPO DE REGISTRO',nil); 
     CBTipoRegistro.AddItem('(TODOS)',nil);
     while not(IBQTipoRegistro.Eof) do
     begin
      CBTipoRegistro.AddItem(IBQTipoRegistro.FieldValues['sinonimo'],nil);
      IBQTipoRegistro.Next;
     end;

     CBTipoRegistro.ItemIndex := 0;

end;

procedure TFControlAnimales.EAPesoDesdeKeyPress(Sender: TObject;
  var Key: Char);
begin

  if (key =#13) then
  begin
      //LVerAnimalesClick(sender);
      EAPesoHasta.SetFocus;
      Key:= #0;
  end;

end;

procedure TFControlAnimales.EAPesoHastaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if (key =#13) then
  begin
      //LVerAnimalesClick(sender);
      Key:= #0;
  end;

end;

procedure TFControlAnimales.EAFrameDesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key =#13) then
  begin
      //LVerAnimalesClick(sender);
      EAFrameHasta.SetFocus;
      Key:= #0;
  end;

end;

procedure TFControlAnimales.EAFrameHastaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key =#13) then
  begin
      //LVerAnimalesClick(sender);
      Key:= #0;
  end;

end;

procedure TFControlAnimales.CBAnimalesInactivosClick(Sender: TObject);
begin
  inherited;

  filtrado := true;
  //LVerAnimalesClick(sender);

end;

procedure TFControlAnimales.EADesdeDiaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
      EADesdeMes.SetFocus;
      ChequearPrimeraFecha;
      //LVerAnimalesClick(sender);
      Key:= #0;
  end;

end;

procedure TFControlAnimales.EADesdeMesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
      EADesdeAnio.SetFocus;
      ChequearPrimeraFecha;
      //LVerAnimalesClick(sender);
      Key:= #0;
  end;
end;

procedure TFControlAnimales.EADesdeAnioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
      EAHastaDia.SetFocus;
      ChequearPrimeraFecha;
      //LVerAnimalesClick(sender);
      Key:= #0;
  end;

end;

procedure TFControlAnimales.EAHastaDiaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
      EAHastaMes.SetFocus;
      ChequearSegundaFecha;
      //LVerAnimalesClick(sender);
      Key:= #0;
  end;

end;

procedure TFControlAnimales.EAHastaMesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
      EAHastaAnio.SetFocus;
      ChequearSegundaFecha;
      //LVerAnimalesClick(sender);
      Key:= #0;
  end;
end;

procedure TFControlAnimales.EAHastaMesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  EAHastaAnio.SetFocus;
  ChequearSegundaFecha;
end;

procedure TFControlAnimales.EAHastaDiaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  EAHastaMes.SetFocus;
  ChequearSegundaFecha;
end;

procedure TFControlAnimales.EADesdeAnioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  EAHastaDia.SetFocus;
  ChequearPrimeraFecha;
end;

procedure TFControlAnimales.EADesdeMesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  EADesdeAnio.SetFocus;
  ChequearPrimeraFecha;
end;

procedure TFControlAnimales.EADesdeDiaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  EADesdeMes.SetFocus;
  ChequearPrimeraFecha;
end;

procedure TFControlAnimales.ChequearPrimeraFecha;
begin

     if ((EADesdeDia.Text <> '') and (EADesdeMes.Text <> '') and (EADesdeAnio.Text <> '')) then
        id_fecha_desde := 1
     else
        id_fecha_desde := -1;

end;

procedure TFControlAnimales.ChequearSegundaFecha;
begin

     if ((EAHastaDia.Text <> '') and (EAHastaMes.Text <> '') and (EAHastaAnio.Text <> '')) then
        id_fecha_hasta := 1
     else
        id_fecha_hasta := -1;

end;

procedure TFControlAnimales.EAHastaAnioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  ChequearSegundaFecha;
end;

procedure TFControlAnimales.EAHastaAnioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
      ChequearSegundaFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      //LVerAnimalesClick(sender);
      Key:= #0;
  end;
end;

procedure TFControlAnimales.EAHastaAnioChange(Sender: TObject);
begin
  inherited;

  cantAH := Length(EAHastaAnio.Text);

  if ((cantAH = 4)) then
  begin
      ChequearSegundaFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      //LVerAnimalesClick(sender);
  end;

  if (EAHastaAnio.Text = '') then
  begin
    id_fecha_desde := -1;
    id_fecha_hasta := -1;
    EAHastaMes.SetFocus;
  end;

  //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.EAHastaMesChange(Sender: TObject);
begin
  inherited;

  cantMH := Length(EAHastaMes.Text);

  if (cantMH = 2) then
  begin
      ChequearPrimeraFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      //LVerAnimalesClick(sender);

      EAHastaAnio.SetFocus;
  end
  else
     filtrado := false;


  if (EAHastaMes.Text = '') then
  begin
    id_fecha_desde := -1;
    id_fecha_hasta := -1;
    EAHastaDia.SetFocus;
  end;

  //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.EAHastaDiaChange(Sender: TObject);
begin
  inherited;

  cantDH := length(EAHastaDia.Text);

  if (cantDH = 2) then
  begin
      ChequearPrimeraFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      //LVerAnimalesClick(sender);
      EAHastaMes.SetFocus;
  end
  else
     filtrado := false;

  if (EAHastaDia.Text = '') then
  begin
    id_fecha_desde := -1;
    id_fecha_hasta := -1;
    EADesdeAnio.SetFocus;
  end;
  //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.EADesdeAnioChange(Sender: TObject);
begin
  inherited;

  cantAD := Length(EADesdeAnio.Text);

  if ((cantAD = 4)) then
  begin
      ChequearPrimeraFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

     // LVerAnimalesClick(sender);

      EAHastaDia.SetFocus;
  end
  else
     filtrado := false;


  if (EADesdeAnio.Text = '') then
  begin
    EADesdeMes.SetFocus;
    id_fecha_desde := -1;
    id_fecha_hasta := -1;
  end;

  //LVerAnimalesClick(sender);
    
end;

procedure TFControlAnimales.EADesdeMesChange(Sender: TObject);
begin
  inherited;

  cantMD := Length(EADesdeMes.Text);

  if (cantMD = 2) then
  begin
      ChequearPrimeraFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      //LVerAnimalesClick(sender);

      EADesdeAnio.SetFocus;
  end
  else
     filtrado := false;


  if (EADesdeMes.Text = '') then
    EADesdeDia.SetFocus;

 // LVerAnimalesClick(sender);
    
end;

procedure TFControlAnimales.EADesdeDiaChange(Sender: TObject);
begin
  inherited;

  cantDD := Length(EADesdeDia.Text);

  if (cantDD = 2) then
  begin
      ChequearPrimeraFecha;
      filtrado := true;

      queryAgr := queryAgr + ' and (ta.fecha_nacimiento >= :fecha_desde) and (ta.fecha_nacimiento <= :fecha_hasta)';

      //LVerAnimalesClick(sender);

      EADesdeMes.SetFocus;
  end
  else
     filtrado := false;

  if (EADesdeDia.Text = '') then
  begin
       DTPDesde.Date := Now();
       DTPHasta.Date := Now();
       EADesdeDia.SetFocus;
       id_fecha_desde := -1;
       id_fecha_hasta := -1;
       //LVerAnimalesClick(sender);
  end;

  //LVerAnimalesClick(sender);
end;

procedure TFControlAnimales.CBRazaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRaza) then
  begin
    CBRaza.Items.Delete(0);
    DelRaza := true;
  end;
end;

procedure TFControlAnimales.CBCategoriaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelCategoria) then
  begin
    CBCategoria.Items.Delete(0);
    DelCategoria := true;
  end;
end;

procedure TFControlAnimales.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRodeo) then
  begin
    CBRodeo.Items.Delete(0);
    DelRodeo := true;
  end;
end;

procedure TFControlAnimales.CBColorCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelColor) then
  begin
    CBColor.Items.Delete(0);
    DelColor := true;
  end;
end;

procedure TFControlAnimales.CBEstadoReproCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelEstado) then
  begin
    CBEstadoRepro.Items.Delete(0);
    DelEstado := true;
  end;
end;

procedure TFControlAnimales.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPotrero) then
  begin
    CBPotrero.Items.Delete(0);
    DelPotrero := true;
  end;
end;

procedure TFControlAnimales.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTR) then
  begin
    CBTipoRegistro.Items.Delete(0);
    DelTR := true;
  end;
end;

procedure TFControlAnimales.CBCondCorporalCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelCC) then
  begin
    CBCondCorporal.Items.Delete(0);
    DelCC := true;
  end;
end;

procedure TFControlAnimales.CBOrigenCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelOrigen) then
  begin
    CBOrigen.Items.Delete(0);
    DelOrigen := true;
  end;
end;

procedure TFControlAnimales.CBCantPartosCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelCP) then
  begin
    CBCantPartos.Items.Delete(0);
    DelCP := true;
  end;
end;


procedure TFControlAnimales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //if FPrincipal._USO_DISP then
    //cerrarLector;
end;

procedure TFControlAnimales.crearLector;
begin
  FLectorElectronico:= TLectorAllFlexSerie.Create();//creo segun el que estamos usando
  FLectorElectronico.ConfigurarVaComm();
  FLectorElectronico.OpenVAComm; // abro la conexion  }
end;

procedure TFControlAnimales.cerrarLector;
begin
  if FLectorElectronico<>nil then
  begin
    FLectorElectronico.CloseVAComm;
    FLectorElectronico.Destroy;
    FLectorElectronico:=nil;
  end;
end;

function TFControlAnimales.AplicarFiltros : Boolean;
var
  Resultado : Boolean;
begin
  Resultado := true;
  if id_raza <> -1 then
    Resultado := Resultado and (IBQBuscarAnimal.FieldByName('raza').AsInteger = id_raza);
  if id_color <> -1 then
    Resultado := Resultado and (IBQBuscarAnimal.FieldByName('color').AsInteger = id_color);
  if id_tipo_reg <> -1 then
    Resultado := Resultado and (IBQBuscarAnimal.FieldByName('subcategoria').AsInteger = id_tipo_reg);
  if id_categoria <> -1 then
    Resultado := Resultado and (IBQBuscarAnimal.FieldByName('categoria').AsInteger = id_categoria);
  if id_estado_repro <> -1 then
    Resultado := Resultado and (IBQBuscarAnimal.FieldByName('estado_reproductivo').AsInteger = id_estado_repro);
  if id_cond_corpo <> -1 then
    Resultado := Resultado and (IBQBuscarAnimal.FieldByName('condicion_corporal').AsInteger = id_cond_corpo);
  if id_rodeo <> -1 then
    Resultado := Resultado and (IBQBuscarAnimal.FieldByName('rodeo').AsInteger = id_rodeo);
  if id_potrero <> -1 then
    Resultado := Resultado and (IBQBuscarAnimal.FieldByName('potrero').AsInteger = id_potrero);
  if id_origen <> -1 then
    Resultado := Resultado and (IBQBuscarAnimal.FieldByName('origen').AsInteger = id_origen);
  Result := Resultado;
end;

procedure TFControlAnimales.TimerLectorTimer(Sender: TObject);
var rec:TRecordData;
    //info:trecinfo;
    id_aux, id_nuevo : Integer;
    auxlectura,rpaux, rp_nuevo, auxie: String;
    F : TFEveAltaDirecta;
begin
  inherited;
  auxlectura := FLectorElectronico.Lectura;
  auxlectura := StringReplace(auxlectura, #9, '', [rfReplaceAll]);
  auxlectura := StringReplace(auxlectura, #32, '', [rfReplaceAll]);

  FLectorElectronico.Lectura := '';

  if(auxlectura<>'')then
  begin
    if Filtrar then
    begin
      Filtrar := false;
      PCentral.Align := alCustom;
      PSuperior.Align := alCustom;
      PFicha.Align := alTop;
      PFicha.BringToFront;
      PCentral.Align := alClient;
      PSuperior.SendToBack;
    end;

    PCFichaAnimal.Visible := true;


    if DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal')<>null then
    begin
      DMSoftvet.IBQDatosAnimal.Close;
      DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQDatosAnimal.Open;
      id_aux := DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
      rpaux := DMSoftvet.IBQDatosAnimal.Lookup('id_animal',id_aux,'id_rp');

      IBQYaFiltrado.Close;
      IBQYaFiltrado.ParamByName('a').AsInteger := id_aux;
      IBQYaFiltrado.Open;

      if (IBQYaFiltrado.RecordCount = 0) then
      begin
        CantidadAnimales := CantidadAnimales + 1;
        GBListadoAnimales.Caption := 'Listado de Animales ['+IntToStr(CantidadAnimales)+']';
        IBQBuscarAnimal.Close;
        IBQBuscarAnimal.ParamByName('id').AsInteger := id_aux;
        IBQBuscarAnimal.Open;

        if AplicarFiltros then
        begin

          AgregarAnimal(id_aux,0,auxlectura);
          ActualizarDatosAnimal(id_aux);

        end
        else
          begin

          AgregarAnimal(id_aux,1,auxlectura);
          ActualizarDatosAnimal(id_aux);

        end;
      end;
      end
    else
    begin
      //if MostrarMensaje(tmConsulta,'El animal no existe. Desea asignarle la caravana a un animal existente?') = mrYes then
      //begin

        TimerLector.Enabled := false;
        FPrincipal.idCargaElectronica := auxlectura;
        FV := TFMensajeGuardarVincular.Create(self);
        FV.idCargaElectronica := auxlectura;
        FV.showmodal;
        FV.Destroy;

        IBQIe.Close;
        IBQIe.ParamByName('i').AsString := auxlectura;
        IBQIe.ParamByName('e').AsInteger:= FPrincipal.EstablecimientoActual;
        IBQIe.Open;


        if (IBQIe.RecordCount > 0) then
          begin

              id_aux := IBQIe.FieldByName('id_animal').AsInteger;
              rpaux := IBQIe.FieldByName('id_rp').AsString;

              IBQBuscarAnimal.Close;
              IBQBuscarAnimal.ParamByName('id').AsInteger := id_aux;
              IBQBuscarAnimal.Open;


                if AplicarFiltros then
                begin

                  AgregarAnimal(id_aux,0,auxlectura);
                  ActualizarDatosAnimal(id_aux);

                end
                else
                  begin

                  AgregarAnimal(id_aux,1,auxlectura);
                  ActualizarDatosAnimal(id_aux);

              end;

        DMSoftvet.IBQDatosAnimal.Close;
        DMSoftvet.IBQDatosAnimal.Open;

     end;






        // *.*.*.*.*.*.* INICIO CODIGO VIEJO *.*.*.*.*.*
        (*ActualizarCaravana(auxlectura);

        DMSoftvet.IBQDatosAnimal.Close;
        DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
        DMSoftvet.IBQDatosAnimal.Open;
        id_aux := DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
        rpaux := DMSoftvet.IBQDatosAnimal.Lookup('id_animal',id_aux,'id_rp');

        IBQBuscarAnimal.Close;
        IBQBuscarAnimal.ParamByName('id').AsInteger := id_aux;
        IBQBuscarAnimal.Open;

        if AplicarFiltros then
        begin

          AgregarAnimal(id_aux,0,auxlectura);
          ActualizarDatosAnimal(id_aux);

        end
        else
        begin

          AgregarAnimal(id_aux,1,auxlectura);
          ActualizarDatosAnimal(id_aux);

        end;
      end
      else
      begin
        if MostrarMensaje(tmConsulta,'El animal no existe. Desea darlo de alta?') = mrYes then
        begin
          F := TFEveAltaDirecta.Create(self);
          F.EAIdentificacionElectronica.Text := auxlectura;
          F.ShowModal;
          F.Destroy;

          DMSoftvet.IBQDatosAnimal.Close;
          DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
          DMSoftvet.IBQDatosAnimal.Open;
          id_aux := DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
          rpaux := DMSoftvet.IBQDatosAnimal.Lookup('id_animal',id_aux,'id_rp');

          IBQBuscarAnimal.Close;
          IBQBuscarAnimal.ParamByName('id').AsInteger := id_aux;
          IBQBuscarAnimal.Open;

          if AplicarFiltros then
          begin

            AgregarAnimal(id_aux,0,auxlectura);
            ActualizarDatosAnimal(id_aux);

          end
          else
          begin

            AgregarAnimal(id_aux,1,auxlectura);
            ActualizarDatosAnimal(id_aux);

          end;
        end
        else
        begin
          AgregarAnimal(id_aux,2,auxlectura);
          PCFichaAnimal.Visible := false;
        end;  *)

     // *.*.*.*.*.*.* FIN CODIGO VIEJO *.*.*.*.*.*
      //end;
    end;
  end;
  FPrincipal.idCargaElectronica := '';
  TimerLector.Enabled := true;
end;

procedure TFControlAnimales.ActualizarCaravana(caravana : String);
var
  SQLInt : String;
  SQLExt : String;
  F : TFPosiblesMadres;
  id_madreB : Integer;
begin
  inherited;
  //FrameSeleccionPadres.IBQDisponibles.Close;
  SQLInt := 'select id_animal as id, id_rp, id_hba, nombre, apodo, ''INTERNA'' as Tipo from tab_animales where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and Activo = ''S''';
  F := TFPosiblesMadres.Create(self);
  F.IBQMBiologica.Close;
  F.IBQMBiologica.SQL.Clear;
  F.IBQMBiologica.SQL.Add(SQLInt);
  F.IBQMBiologica.ParamByName('rp').AsString := '%';
  F.IBQMBiologica.ParamByName('nom').AsString := '%';
  F.IBQMBiologica.Open;
  F.IBQMBiologica.Last;
  F.IBQMBiologica.First;
  if not F.IBQMBiologica.IsEmpty then
  begin
    if F.IBQMBiologica.RecordCount > 1 then
    begin
      F.LSeleccion.Caption := 'Seleccione el animal';
      F.LBuscarMBiolo.Caption := 'Buscar Animal';
      F.LTitulo.Caption := 'Seleccione el animal';
      F.PTitulo.Caption := 'Seleccione el animal';
      F.LElegir.Caption := 'Seleccionar animal';
      F.ShowModal;
      id_madreB := F.id_madre;
      if id_madreB > -1 then
      begin
        try
          IBQActCaravana.Close;
          IBQActCaravana.ParamByName('caravana').AsString := caravana;
          IBQActCaravana.ParamByName('id').AsInteger := id_madreB;
          IBQActCaravana.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except;
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
      end;

    end;
  end;
end;

procedure TFControlAnimales.AgregarAnimal(id, tipo : integer; IE : String);
begin
  try
    IBDSAnimales.Insert;
    IBDSAnimales.FieldByName('id_aux').Value := tipo;

    if Tipo <> 2 then
    begin
      IBDSAnimales.FieldByName('id_animal').Value := id;
      IBDSAnimales.FieldByName('id_rp').Value := IBQBuscarAnimal.FieldValues['id_rp'];
      IBDSAnimales.FieldByName('id_senasa').Value := IBQBuscarAnimal.FieldValues['id_senasa'];
      IBDSAnimales.FieldByName('id_hba').Value := IBQBuscarAnimal.FieldValues['id_hba'];
      IBDSAnimales.FieldByName('raza').Value := IBQBuscarAnimal.FieldValues['raza'];
      IBDSAnimales.FieldByName('v5').Value := IBQBuscarAnimal.FieldValues['nomraza'];
      IBDSAnimales.FieldByName('fecha_nacimiento').Value := IBQBuscarAnimal.FieldValues['fecha_nacimiento'];
      IBDSAnimales.FieldByName('nombre').Value := IBQBuscarAnimal.FieldValues['nombre'];
      IBDSAnimales.FieldByName('apodo').Value := IBQBuscarAnimal.FieldValues['apodo'];
      IBDSAnimales.FieldByName('subcategoria').Value := IBQBuscarAnimal.FieldValues['subcategoria'];
      IBDSAnimales.FieldByName('v2').Value := IBQBuscarAnimal.FieldValues['nomsubcategoria'];
      IBDSAnimales.FieldByName('color').Value := IBQBuscarAnimal.FieldValues['color'];
      IBDSAnimales.FieldByName('v3').Value := IBQBuscarAnimal.FieldValues['nomcolor'];
      IBDSAnimales.FieldByName('v1').Value := IBQBuscarAnimal.FieldValues['estado_actual'];
      IBDSAnimales.FieldByName('categoria').Value := IBQBuscarAnimal.FieldValues['categoria'];
      IBDSAnimales.FieldByName('v4').Value := IBQBuscarAnimal.FieldValues['nomcategoria'];
    end
    else
    begin
      IBDSAnimales.FieldByName('id_animal').Value := tipo;
      IBDSAnimales.FieldByName('id_rp').Value := IE;
    end;


    IBDSAnimales.Post;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFControlAnimales.ActualizarDatosAnimal(id_animal : Integer);
var //nodo : TTreeNode;
    PunteroPrincipal : TArrayPointer;
    sen_valor : String;
    primerLetra, segundaLetra : Char;
    msje: String;
    i, rz : integer;
begin
  inherited;
  PCFichaAnimal.ActivePage := TSBasicos;
  PCFichaAnimalChange(nil);


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

  //* SOLAPA GENERAL *//
  new(PunteroPrincipal);

  msje:= '              Cargando datos del animal.............';

  LRPAnimal.Caption := 'RP: '+IBQAnimales.FieldValues['id_rp'];
  LRPAnimal.Left := (PRP.Width div 2) - (LRPAnimal.Width div 2);


  rz := IBQAnimales.FieldValues['raza'];
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
  case rz of
    2,3 : begin
            LabelIDPC.Visible := true;
            LabelIDPCValue.Visible := true;
            LabelIDPC.Caption := Traducir('PC:');
            LabelGeneaPC.Visible := true;
            LabelGeneaPCValue.Visible := true;
            LabelGeneaPC.Caption := Traducir('PC:');
            LabelRaza.Visible := false;
            LabelRazaValue.Visible := false;
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
    12,28 : begin
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

  sen_valor := IBQAnimales.fieldByName('ID_SENASA').AsString;
  if (sen_valor <> '') then primerLetra := sen_valor[1];
  if (sen_valor <> '') and (primerLetra <> ' ') then
  begin
    if (Ord(primerLetra)>=48) and (Ord(primerLetra)<=57) then
    begin
      LabelIDSenasa.Caption := Traducir('Senasa:');
      {LabelIDSenasa.Width := 49;
      LabelIDSenasaValue.Left := 56;}
      LDigVerif.Visible := false;
      Ldigito.Visible := false;
    end
    else
    begin
      segundaLetra := sen_valor[2];
      LabelIDSenasa.Caption := Traducir('CUIG - Senasa:');
      //LabelIDSenasa.Width := 81;
      LDigVerif.Visible := true;
      //LabelIDSenasaValue.Left := 87;
      Ldigito.Visible := true;
      if (Ord(segundaLetra)>=48) and (Ord(segundaLetra)<=57) then
        Ldigito.Caption := IntToStr(UFunctions.DigitoVerificadorCaravana('00'+sen_valor))
       else
         Ldigito.Caption := IntToStr(UFunctions.DigitoVerificadorCaravana(sen_valor))
    end;
  end;

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



 { if ( IBQAnimales.FieldByName('apodo').AsString = '' )  and (IBQAnimales.FieldByName('nombreAnimal').AsString = '' ) then
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
              end;    }



  if(IBQAnimales.fieldByName('peso').AsString = '')then
      LabelPesoValue.Caption := Traducir('NO DEFINIDO')
  else
    LabelPesoValue.Caption := IBQAnimales.fieldByName('peso').AsString+' KGs'; //esto era antes

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


  LPropietario1.Caption:= '';

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
            LPropietario1.Caption := '- '+IBQPropietarios.FieldByName('codigo').AsString+': '+FormatFloat('##.##',IBQPropietarios.FieldByName('porcentaje').AsFloat)+ '%';
            LPropietario1.Hint:= LPropietario1.Caption;
          end;
      1 : begin
            LPropietario2.Visible := true;
            LPropietario2.Caption := '- '+IBQPropietarios.FieldByName('codigo').AsString+': '+FormatFloat('##.##',IBQPropietarios.FieldByName('porcentaje').AsFloat)+ '%';
            LPropietario2.Hint:= LPropietario2.Caption;
          end;
      2 : begin
            LPropietario3.Visible := true;
            LPropietario3.Caption := '- '+IBQPropietarios.FieldByName('codigo').AsString+': '+FormatFloat('##.##',IBQPropietarios.FieldByName('porcentaje').AsFloat)+ '%';
            LPropietario3.Hint:= LPropietario3.Caption;
          end;
      3 : begin
            LPropietario4.Visible := true;
            LPropietario4.Caption := '- '+IBQPropietarios.FieldByName('codigo').AsString+': '+FormatFloat('##.##',IBQPropietarios.FieldByName('porcentaje').AsFloat)+ '%';
            LPropietario4.Hint:= LPropietario4.Caption;
          end;
      4 : begin
            LPropietario5.Visible := true;
            LPropietario5.Caption := '- '+IBQPropietarios.FieldByName('codigo').AsString+': '+FormatFloat('##.##',IBQPropietarios.FieldByName('porcentaje').AsFloat)+ '%';
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
  nodoPrincipal := TVArbolGenea.Items.AddObject(nil, IBQAnimales.fieldByName('id_rp').AsString, PunteroPrincipal);
  if (LabelSexoValue.Caption = Traducir('MACHO')) then
    nodoPrincipal.ImageIndex := 0
  else
    nodoPrincipal.ImageIndex := 1;
  nodoPrincipal.SelectedIndex := nodoPrincipal.ImageIndex;

  ArmarArbol2(id_animal,nodoPrincipal,'N');
  CargarGenea5(id_animal);


  CargarImagenesAnimal();

  EAAnio.Text:= IntToStr(YearOf(Now()));
  UDAnio.Max:= YearOf(Now());

  vPrimerIngreso:= true;

  CargarDatosGeneralesDeps();
  CargarDeps();


end;


procedure TFControlAnimales.ArmarArbol2( animal : Integer; nodoPadre : TTreeNode; EXT : String);
var
  Ind, K : Integer;
  NodosArbol : Array of TRegDatosArbol;
  StringCaptionNodo : String;
  Padre, Madre, Hijo : Integer;
  nodoAux, nodoP : TTreeNode;
  HijoExterno : String;
begin
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

procedure TFControlAnimales.BGenealogiaCompletaClick(Sender: TObject);
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
  PCFichaAnimal.ActivePage := TSTV;
  PGenea5.Visible := not PGenea5.Visible;
  TVArbolGenea.Visible := not TVArbolGenea.Visible;
end;

function TFControlAnimales.ExisteAnimal(animal, padre_de : Integer; Nodos : Array of TRegDatosArbol) : Boolean;
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


function TFControlAnimales.calcularEdad: string;
var value : variant;
    value2 : variant;
    intermedio : integer;
    sql: String;
begin
  value2 := now;

  sql:= 'select ee.fecha as fecha ' +
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
     end;




  value := IBQAnimales.fieldByname('fecha_Nacimiento').Value;
  intermedio := TRUNC( (value2 - value) /365);
  if (intermedio < 2) then
    result := intToStr(TRUNC( (value2 - value) /dias_mes))+' meses'
  else
    result := intToStr(TRUNC( (value2 - value) /365))+' años';
end;

procedure TFControlAnimales.CargarGenea5(animal : integer);
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
  LAnimal.Caption := Traducir('RP: ')+IBQAnimales.FieldValues['id_rp']+' - '+IBQAnimales.FieldValues['nombreAnimal']+' - '+alter+' '+valor;

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
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfP.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'M' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IM.Picture.Bitmap);
      InfM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfM.Lines.Append('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPP.Picture.Bitmap);
      InfPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPM.Picture.Bitmap);
      InfPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMP.Picture.Bitmap);
      InfMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMM.Picture.Bitmap);
      InfMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPP.Picture.Bitmap);
      InfPPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPM.Picture.Bitmap);
      InfPPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMP.Picture.Bitmap);
      InfPMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMM.Picture.Bitmap);
      InfPMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPP.Picture.Bitmap);
      InfMPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPM.Picture.Bitmap);
      InfMPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMP.Picture.Bitmap);
      InfMMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMM.Picture.Bitmap);
      InfMMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;


    ///////////////

    if IBQArbolAux.FieldByName('relacion').AsString = 'PPPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPPP.Picture.Bitmap);
      InfPPPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPPP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PPPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPPM.Picture.Bitmap);
      InfPPPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPPM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PPMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPMP.Picture.Bitmap);
      InfPPMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPMP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PPMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPMM.Picture.Bitmap);
      InfPPMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPPMM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMPP.Picture.Bitmap);
      InfPMPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMPP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMPM.Picture.Bitmap);
      InfPMPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMPM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMMP.Picture.Bitmap);
      InfPMMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMMP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'PMMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMMM.Picture.Bitmap);
      InfPMMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfPMMM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPPP.Picture.Bitmap);
      InfMPPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPPP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPPM.Picture.Bitmap);
      InfMPPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPPM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPMP.Picture.Bitmap);
      InfMPMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPMP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MPMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPMM.Picture.Bitmap);
      InfMPMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMPMM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMPP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMPP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMPP.Picture.Bitmap);
      InfMMPP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMPP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMPM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMPM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMPM.Picture.Bitmap);
      InfMMPM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMPM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMMP' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMMP.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMMP.Picture.Bitmap);
      InfMMMP.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMMP.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolAux.FieldByName('relacion').AsString = 'MMMM' then
    begin
      retornarAlternativo(IBQArbolAux.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMMM.Caption := Traducir('  RP: ')+IBQArbolAux.fieldByName('id_rp').AsString+' - '+IBQArbolAux.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMMM.Picture.Bitmap);
      InfMMMM.Tag := IBQArbolAux.FieldByName('id_animal').AsInteger;
      InfMMMM.Transparent := externo;
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolAux.fieldbyName('raza').AsInteger));}
    end;

    //////////////
    IBQArbolAux.Next;
  end;
end;

procedure TFControlAnimales.retornarAlternativo(id: integer;
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
      //identif := 'HBA: ';
      value := IBQAux.fieldbyname('id_hba').AsString;
    end
  else
    if ((IBQAux.fieldbyname('id_pc').AsString <> '') and (IBQAux.fieldbyname('id_pc').Value <> null)) then
      begin
        identif := 'PC: ';
        value := IBQAux.fieldbyname('id_pc').AsString;
      end
    else
      if ((IBQAux.fieldbyname('id_ra').AsString <> '') and (IBQAux.fieldbyname('id_ra').Value <> null)) then
        begin
          identif := 'RA: ';
          value := IBQAux.fieldbyname('id_ra').AsString;
        end
      else
        if ((IBQAux.fieldbyname('id_senasa').AsString <> '') and (IBQAux.fieldbyname('id_senasa').Value <> null))then
          begin
            identif := FPrincipal.PaisNombreCaravana+': ';
            //identif := 'Senasa: ';
            value := IBQAux.fieldbyname('id_senasa').AsString;
          end
        else
          begin
            identif := '';
            value := '';
          end;
end;


procedure TFControlAnimales.CargarImagenesAnimal;
var
    foto: TThumbnail;
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

      //archivo:= ExtractFilePath(Application.ExeName)+'Fotos\'+FPrincipal.NombreEstablecimiento+'\'+nomDestino;
      if (FileExists(archivo)) then
        begin
          foto:= THLAnimales.Thumbnails.Add;
          foto.Filename:= archivo;
          foto.Picture.LoadFromFile(archivo);
          foto.Tag:= IBQImagen.fieldbyname('id_imagen').AsInteger; //en el tag guardo el id de la imagen
        end;
      IBQImagen.Next;
   end;

  //BBSeleccionFoto.Visible := I > 1;
  LSelFoto.Visible := I > 1;
  ISelFoto.Visible := I > 1;

  THLAnimales.ItemIndex := 0;
  //THLAnimalesClick(nil);
 { APFoto.Visible := true;
  if THLAnimales.ItemIndex > -1 then
    APFoto.Picture := APPreview.Picture
  else
    APFoto.Visible := false;}

end;

function TFControlAnimales.BuscarArchivo(const directorio, mascara, NomArch: string; atributos: Integer) : String;
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

procedure TFControlAnimales.CargarDatosGeneralesDeps;
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
        LNombrePadreDep.Caption:= IBQPadres.fieldbyname('rppadre').AsString
      else
        LNombrePadreDep.Caption:= IBQPadres.fieldbyname('padre').AsString;

      if IBQPadres.fieldbyname('madre').AsString = '' then
        LNombreMadreDep.Caption:= IBQPadres.fieldbyname('rpmadre').AsString
      else
        LNombreMadreDep.Caption:= IBQPadres.fieldbyname('madre').AsString;

      if not IBQPadres.IsEmpty then
      begin
        if IBQPadres.FieldValues['idpadre'] <> null then
        begin
          LNombrePadreDEP.Tag := IBQPadres.FieldValues['idpadre'];
          if IBQPadres.FieldByName('tipo_animal_padre').AsString = 'E' then
            LNombrePadreDEP.Transparent := true
          else
            LNombrePadreDEP.Transparent := false;
        end;
        if IBQPadres.FieldValues['idmadre'] <> null then
        begin
          LNombreMadreDEP.Tag := IBQPadres.FieldValues['idmadre'];
          if IBQPadres.FieldByName('tipo_animal_madre').AsString = 'E' then
            LNombreMadreDEP.Transparent := true
          else
            LNombreMadreDEP.Transparent := false;
        end;
      end;

      PArgentina.Visible:= true;
      PArgentina.Align:= alClient;
      PUruguay.Visible:= false;
      LNombreAnimalDEP.Caption:= '';
      LHBADEP.Caption:= '';
      LAnioNacDEP.Caption:= '';
      LNombreAnimalDEP.Caption:= IBQAnimales.fieldByName('nombreAnimal').AsString; //partirString(IBQAnimales.fieldByName('nombreAnimal').AsString,18);
      LHBADEP.Caption:= IBQAnimales.fieldByName('id_hba').AsString;
      LAnioNacDEP.Caption:= IntToStr(YearOf(IBQAnimales.fieldByName('fecha_nacimiento').AsDateTime));
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

procedure TFControlAnimales.CargarDeps;
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
 // IBQDEPS.ParamByName('establecimiento').AsInteger:= Fprincipal.EstablecimientoActual;
  IBQDEPS.Open;

  if not(IBQDEPS.Eof) then
    begin
      id_dep := IBQDEPS.FieldValues['id_dep'];
      //HabilitarCompDeps(true);
      if (FPrincipal.Pais = 1) then  //argentina
        begin
          if IBQDEPS.fieldByName('gestdep').Value<>null then EADEPGest.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('gestdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('gestdep').AsFloat);
          if IBQDEPS.fieldByName('nacerdep').Value<>null then EADEPNacer.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('nacerdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('nacerdep').AsFloat);
          if IBQDEPS.fieldByName('destdep').Value<>null then EADEPDest.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('destdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('destdep').AsFloat);
          if IBQDEPS.fieldByName('lechedep').Value<>null then EADEPLeche.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('lechedep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('lechedep').AsFloat);
          if IBQDEPS.fieldByName('finaldep').Value<>null then EADEPFinal.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('finaldep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('finaldep').AsFloat);
          if IBQDEPS.fieldByName('cedep').Value<>null then EADEPCE.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('cedep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('cedep').AsFloat);
          if IBQDEPS.fieldByName('alturadep').Value<>null then EADEPAltura.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('alturadep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('alturadep').AsFloat);
          if IBQDEPS.fieldByName('egddep').Value<>null then EADEPEGD.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('egddep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('egddep').AsFloat);
          if IBQDEPS.fieldByName('egcdep').Value<>null then EADEPEGC.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('egcdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('egcdep').AsFloat);
          if IBQDEPS.fieldByName('aobdep').Value<>null then EADEPAOB.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('aobdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('aobdep').AsFloat);
          if IBQDEPS.fieldByName('porgidep').Value<>null then EADEPPorcGI.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('porgidep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('porgidep').AsFloat);
          if IBQDEPS.fieldByName('porcmdep').Value<>null then EADEPPorcCM.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('porcmdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('porcmdep').AsFloat);

          if IBQDEPS.fieldByName('gestprec').Value<>null then EAPrecGest.Text:=formatfloat('0.00',IBQDEPS.fieldByName('gestprec').AsFloat);
          if IBQDEPS.fieldByName('nacerprec').Value<>null then EAPrecNacer.Text:= formatfloat('0.00',IBQDEPS.fieldByName('nacerprec').AsFloat);
          if IBQDEPS.fieldByName('destprec').Value<>null then EAPrecDest.Text:= formatfloat('0.00',IBQDEPS.fieldByName('destprec').AsFloat);
          if IBQDEPS.fieldByName('lecheprec').Value<>null  then EAPrecLeche.Text:= formatfloat('0.00',IBQDEPS.fieldByName('lecheprec').AsFloat);
          if IBQDEPS.fieldByName('finalprec').Value<>null  then EAPrecFinal.Text:= formatfloat('0.00',IBQDEPS.fieldByName('finalprec').AsFloat);
          if IBQDEPS.fieldByName('ceprec').Value<>null  then EAPrecCE.Text:= formatfloat('0.00',IBQDEPS.fieldByName('ceprec').AsFloat);
          if IBQDEPS.fieldByName('alturaprec').Value<>null  then EAPrecAltura.Text:= formatfloat('0.00',IBQDEPS.fieldByName('alturaprec').AsFloat);
          if IBQDEPS.fieldByName('egdprec').Value<>null  then EAPrecEGD.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egdprec').AsFloat);
          if IBQDEPS.fieldByName('egcprec').Value<>null  then EAPrecEGC.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egcprec').AsFloat);
          if IBQDEPS.fieldByName('aobprec').Value<>null  then EAPrecAOB.Text:= formatfloat('0.00',IBQDEPS.fieldByName('aobprec').AsFloat);
          if IBQDEPS.fieldByName('porgiprec').Value<>null  then EAPrecPorcGI.Text:= formatfloat('0.00',IBQDEPS.fieldByName('porgiprec').AsFloat);
          if IBQDEPS.fieldByName('porcmprec').Value<>null  then EAPrecPorcCM.Text:= formatfloat('0.00',IBQDEPS.fieldByName('porcmprec').AsFloat);

          EACrias.Text:= IBQDEPS.fieldByName('crias').AsString;
          EARodeo.Text:= IBQDEPS.fieldByName('rodeo').AsString;
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
         id_dep := -1;
      end;
  HabilitarFuentesDEPs();
end;

procedure TFControlAnimales.ClearDeps;
begin
      if (FPrincipal.Pais = 1) then  //argentina
        begin
          EADEPGest.Text:= '';
          EADEPNacer.Text:= '';
          EADEPDest.Text:= '';
          EADEPLeche.Text:= '';
          EADEPFinal.Text:= '';
          EADEPCE.Text:= '';
          EADEPAltura.Text:= '';
          EADEPEGD.Text:= '';
          EADEPEGC.Text:= '';
          EADEPAOB.Text:= '';
          EADEPPorcGI.Text:= '';
          EADEPPorcCM.Text:= '';

          EAPrecGest.Text:= '';
          EAPrecNacer.Text:= '';
          EAPrecDest.Text:= '';
          EAPrecLeche.Text:= '';
          EAPrecFinal.Text:= '';
          EAPrecCE.Text:= '';
          EAPrecAltura.Text:= '';
          EAPrecEGD.Text:= '';
          EAPrecEGC.Text:= '';
          EAPrecAOB.Text:= '';
          EAPrecPorcGI.Text:= '';
          EAPrecPorcCM.Text:= '';

          EACrias.Text:= '';
          EARodeo.Text:= '';
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

procedure TFControlAnimales.HabilitarFuentesDEPs;
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

function TFControlAnimales.partirString(nom:string;pos:integer):string;   //parte el string en varias lineas de longitud pos, intercalandoles un salto de linea
var str:string;
    i:integer;
begin
//if length(nom)>=pos then
   //begin;
   for i:=1 to length(nom) do
     begin
     if (i mod pos)=0 then
       str:=str+nom[i]+#13
     else
       str:=str+nom[i];
     end;
   //end;
partirString:=str;
end;

procedure TFControlAnimales.PCFichaAnimalChange(Sender: TObject);
begin
  inherited;
  if PCFichaAnimal.ActivePage = TSBasicos then
  begin
    PCFichaAnimal.Height := 240;
    PFicha.Height := 240 + PRP.Height;
  end;

  if PCFichaAnimal.ActivePage = TSIdenficadores then
  begin
    PCFichaAnimal.Height := 232;
    PFicha.Height := 232 + PRP.Height;
  end;

  if PCFichaAnimal.ActivePage = TSTV then
  begin
    PCFichaAnimal.Height := 340;
    PFicha.Height := 340 + PRP.Height;
  end;

  if PCFichaAnimal.ActivePage = TabSheet2 then
  begin
    PCFichaAnimal.Height := 265;
    PFicha.Height := 265 + PRP.Height;
    EAAnio.SetFocus;
  end;

  if PCFichaAnimal.ActivePage = TabSheet1 then
  begin
    PCFichaAnimal.Height := 224;
    PFicha.Height := 224 + PRP.Height;
  end;

  if PCFichaAnimal.ActivePage = TSObservacion then
  begin
    PCFichaAnimal.Height := 216;
    PFicha.Height := 216 + PRP.Height;
    MObservacion.Text := IBQObservacion.FieldByName('observacion').AsString;
  end;

end;

procedure TFControlAnimales.BDBGListadoCellClick(Column: TColumn);
begin
  inherited;
  if IBDSAnimales.FieldByName('id_animal').Value <> IBDSAnimales.FieldByName('id_aux').Value then
    ActualizarDatosAnimal(IBDSAnimales.FieldByName('id_animal').Value);
end;

end.
