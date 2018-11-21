unit UAbmPadresExternos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, DBCtrls, UDBLookupComboBoxAuto, EditAuto, Mask, UDBEditAuto, IBDButtonABM,
  IBStoredProc, DataExport, DataToXLS, WinXP, UFunctions, UMensajeHuella,
  MemoAuto, UDBDateTimePickerAuto, DateTimePickerAuto, DateUtils, UDBControl,
  JvExControls, JvLabel, PngImage, jpeg, JvGIF, JvExExtCtrls, JvImage,
  PngImageList, UEveAltaDirecta, UCartel,  EditAutoMinuscula, DBEditMinuscula ;

type
  TRegAuxiliar = record
    nombre_comp : String;
    id_comp : integer;
  end;

  TRegGen = record
    id_animal : integer;
    nivel : string;
    sexo : integer;
  end;


  TArrAuxiliar = Array of TRegAuxiliar;

  TFABMPadresExternos = class(TFABMSimple,IButtonABM)      
    PError: TPageControl;
    TSHError: TTabSheet;
    MAErrors: TMemoAuto;
    IBQRNIdentificacion: TIBQuery;
    IBQGenId: TIBQuery;
    AArbolGeneaExternos: TAction;
    IBSPArbol: TIBStoredProc;
    IBQDelAuxExt: TIBQuery;
    PCFichaAnimalExterno: TPageControl;
    TSDeps: TTabSheet;
    LPCMadre: TLabel;
    LRAMadre: TLabel;
    DBEAPCExternos: TDBEditAuto;
    DBEARAExternos: TDBEditAuto;
    BArbol: TButton;
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
    Panel3: TPanel;
    BBModificarDep: TBitBtn;
    BBImprimirDeps: TBitBtn;
    IBQRegDep: TIBQuery;
    DSRegDep: TDataSource;
    DSDeps: TDataSource;
    IBQDEPS: TIBQuery;
    IBQSPImportarDeps: TIBQuery;
    BBGuardarDep: TBitBtn;
    BBCancelarDep: TBitBtn;
    BDeps: TButton;
    ADeps: TAction;
    BBVolverFicha: TBitBtn;
    IBQPadres: TIBQuery;
    DSQPadres: TDataSource;
    CBADN: TCheckBox;
    CBSanguinea: TCheckBox;
    IBSPFIXRELANIMPADRESEXTCICLICO: TIBStoredProc;
    IBQDEPsAnimal: TIBQuery;
    IBQEliminarFuenteDEP: TIBQuery;
    DSFuentesDeps: TDataSource;
    IBQFuenteDeps: TIBQuery;
    IBQRazaAnimal: TIBQuery;
    IBQInsertarFuenteDeps: TIBQuery;
    GBFiltros: TGroupBox;
    CBRP: TCheckBox;
    CBHBA: TCheckBox;
    CBRaza: TCheckBox;
    EARP: TEditAuto;
    EAHBA: TEditAuto;
    DBLCBARaza: TDBLookupComboBoxAuto;
    CBNombre: TCheckBox;
    CBApodo: TCheckBox;
    CBSexo: TCheckBox;
    EANombre: TEditAuto;
    EAApodo: TEditAuto;
    DBLCBASexoFiltro: TDBLookupComboBoxAuto;
    BBImprimirReporte: TBitBtn;
    CBPropietario: TCheckBox;
    DBLCBAPropietarioFiltro: TDBLookupComboBoxAuto;
    CBCriador: TCheckBox;
    EACriadorFiltro: TEditAuto;
    BBXls: TBitBtn;
    PFuenteDeps: TPanel;
    DBLCBAFuenteDeps: TDBLookupComboBoxAuto;
    LFuente: TLabel;
    IBQEliminarCoopropiedadExterna: TIBQuery;
    IBQAuxCoopropiedad: TIBQuery;
    DsAuxCoopropiedad: TDataSource;
    IBQInsertCoopropiedadExterna: TIBQuery;
    IBQDeleteAuxPropiedad: TIBQuery;
    IBQInsertCoopropiedad: TIBQuery;
    DSCoopropiedad: TDataSource;
    IBQCoopropiedad: TIBQuery;
    BCompra: TButton;
    IBQAuxPadres: TIBQuery;
    IBQInsertPadre: TIBQuery;
    IBQProduccionMadre: TIBQuery;
    IPreliminar: TImage;
    LPreliminar: TLabel;
    JvIExpExcel: TJvImage;
    LExpExcel: TLabel;
    IBQAnioParaDep: TIBQuery;
    LVerAnimales: TLabel;
    IVerAnimales: TImage;
    IVerDatosAnimal: TImage;
    LVerDatosAnimal: TLabel;
    RBUltimosDiezA: TRadioButton;
    RBTodos: TRadioButton;
    DSColor: TDataSource;
    IBQColor: TIBQuery;
    DSTipoRegistro: TDataSource;
    IBQTipoRegistro: TIBQuery;
    EBusqueda: TEdit;
    LBusqueda: TLabel;
    IBSPGuardarGeneaExt: TIBStoredProc;
    PArgentinaBraford: TPanel;
    Shape82: TShape;
    Shape105: TShape;
    Shape100: TShape;
    Shape101: TShape;
    Shape98: TShape;
    Shape97: TShape;
    Shape96: TShape;
    Shape95: TShape;
    Shape94: TShape;
    Shape93: TShape;
    Shape99: TShape;
    Shape90: TShape;
    Label139: TLabel;
    Shape86: TShape;
    Shape91: TShape;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Shape92: TShape;
    Label149: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Shape102: TShape;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    Label168: TLabel;
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
    Label150: TLabel;
    Label188: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label189: TLabel;
    LDepApodoAnimalBraford: TLabel;
    Label177: TLabel;
    LDepAbaAnimalBraford: TLabel;
    Label148: TLabel;
    Label154: TLabel;
    Label166: TLabel;
    Label155: TLabel;
    Label167: TLabel;
    Label153: TLabel;
    Label165: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label169: TLabel;
    Label158: TLabel;
    Label170: TLabel;
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
    Shape130: TShape;
    Shape131: TShape;
    Shape146: TShape;
    Shape147: TShape;
    Shape148: TShape;
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
    Label102: TLabel;
    Shape77: TShape;
    Shape78: TShape;
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
    Label106: TLabel;
    Label104: TLabel;
    Label103: TLabel;
    Label105: TLabel;
    Label100: TLabel;
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
    IBQSPImportarAuxDeps: TIBQuery;
    IBQGuardarDatosDeps: TIBQuery;
    IBQDelAuxDeps: TIBQuery;
    IBQAuxDatosPadre: TIBQuery;
    GroupBox1: TGroupBox;
    LRPAnimalMadre: TLabel;
    DBEARPExternos: TDBEditAuto;
    DBEAHBAExternos: TDBEditAuto;
    LHBAMadre: TLabel;
    LOtroMadre: TLabel;
    DBEAOtroExternos: TDBEditAuto;
    RBSenasa: TRadioButton;
    EAEncabezado: TMaskEdit;
    EAUltimoIdent: TMaskEdit;
    EVerificador: TEdit;
    RBCuigSenasa: TRadioButton;
    DBEASenasaExternos: TDBEditAuto;
    LSenesaMadre: TLabel;
    DBEAApodoExternos: TDBEditAuto;
    LApodoMadre: TLabel;
    LNombreMadre: TLabel;
    DBEANombreExternos: TDBEditAuto;
    GroupBox2: TGroupBox;
    LSexo: TLabel;
    DBLCBASexo: TDBLookupComboBoxAuto;
    LRazaMadre: TLabel;
    DBLCBRazaExternos: TDBLookupComboBoxAuto;
    Label4: TLabel;
    DBLCBTipoRegistro: TDBLookupComboBox;
    LColor: TLabel;
    DBLCBColor: TDBLookupComboBox;
    Label3: TLabel;
    DTPAFechaNacimiento: TDateTimePickerAuto;
    GroupBox3: TGroupBox;
    SBPropietarios: TSpeedButton;
    DBEANOMBRECRIADOR: TDBEditAuto;
    Label1: TLabel;
    DBLCBAPropietario: TDBLookupComboBoxAuto;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    EASanguinea: TEditAuto;
    LTipificacion: TLabel;
    EAADN: TEditAuto;
    LADN: TLabel;
    Label5: TLabel;
    EAPN: TEditAuto;
    Label6: TLabel;
    EAPD: TEditAuto;
    Label51: TLabel;
    EAPA: TEditAuto;
    Label73: TLabel;
    EAPT: TEditAuto;
    Label76: TLabel;
    EACE: TEditAuto;
    Label79: TLabel;
    EAFR: TEditAuto;
    IDEps: TImage;
    LDeps: TLabel;
    IPedigree: TImage;
    LGenea: TLabel;
    ICompraAnimal: TImage;
    LCompra: TLabel;
    IBQNombreAnimal: TIBQuery;
    IBQCodRaza: TIBQuery;
    IBQGuardo: TIBQuery;
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcElegirExecute(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EValorFiltrarChange(Sender: TObject);
    procedure CBCriterioFiltrarChange(Sender: TObject);
    procedure IBQAbmSimpleAfterOpen(DataSet: TDataSet);
    procedure IBQAbmSimpleAfterPost(DataSet: TDataSet);
    procedure DBEASenasaExternosExit(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
   // procedure DBEASenasaExternosKeyPress(Sender: TObject; var Key: Char);
    procedure AcEditarExecute(Sender: TObject);
    //procedure RBSenasaClick(Sender: TObject);
   // procedure RadioButton1Click(Sender: TObject);
   // procedure DBEASenasaExternosClick(Sender: TObject);
    procedure RBSenasaClick(Sender: TObject);
    procedure RBCuigSenasaClick(Sender: TObject);
    procedure DBEASenasaExternosKeyPress(Sender: TObject; var Key: Char);
    procedure DBEASenasaExternos1Exit(Sender: TObject);
    procedure DBEASenasaExternosClick(Sender: TObject);
    procedure AArbolGeneaExternosExecute(Sender: TObject);
    procedure HabilitarArbol(Sender : TObject);
    procedure DBEARPExternosExit(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure EACriasExit(Sender: TObject);
    procedure EACriasKeyPress(Sender: TObject; var Key: Char);
    procedure EADEPGestExit(Sender: TObject);
    procedure EADEPGestKeyPress(Sender: TObject; var Key: Char);
    procedure EAPrecGestExit(Sender: TObject);
    procedure EAPrecGestKeyPress(Sender: TObject; var Key: Char);
    procedure EANhijKeyPress(Sender: TObject; var Key: Char);
    procedure BBModificarDepClick(Sender: TObject);
    procedure BBGuardarDepClick(Sender: TObject);
    procedure BBCancelarDepClick(Sender: TObject);
    procedure EAAnioChange(Sender: TObject);
    procedure ADepsExecute(Sender: TObject);
    procedure BBVolverFichaClick(Sender: TObject);
    procedure BBImprimirDepsClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure DBEANOMBRECRIADORChange(Sender: TObject);
    procedure DBEARAExternosChange(Sender: TObject);
    procedure DBEAOtroExternosExit(Sender: TObject);
    procedure DBEAPCExternosExit(Sender: TObject);
    procedure DBEAApodoExternosChange(Sender: TObject);
    procedure DBEAHBAExternosChange(Sender: TObject);
    procedure DBEANombreExternosExit(Sender: TObject);
    procedure DBEAApodoExternosExit(Sender: TObject);
    procedure DBEANOMBRECRIADORExit(Sender: TObject);
    procedure DBEAHBAExternosExit(Sender: TObject);
    procedure DBEARAExternosExit(Sender: TObject);
    procedure CBADNClick(Sender: TObject);
    procedure CBSanguineaClick(Sender: TObject);
    procedure EAEncabezadoKeyPress(Sender: TObject; var Key: Char);
    procedure EAUltimoIdentKeyPress(Sender: TObject; var Key: Char);
    procedure EVerificadorKeyPress(Sender: TObject; var Key: Char);
    procedure CambioGUIG(Sender : TObject);
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
    procedure EADEPCEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAPrecCEKeyDown(Sender: TObject; var Key: Word;
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
    procedure EAPrecFinalKeyDown(Sender: TObject; var Key: Word;
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
    procedure EADEPP18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure CBRPClick(Sender: TObject);
    procedure EARPChange(Sender: TObject);
    procedure CBHBAClick(Sender: TObject);
    procedure EAHBAChange(Sender: TObject);
    procedure CBNombreClick(Sender: TObject);
    procedure EANombreChange(Sender: TObject);
    procedure CBApodoClick(Sender: TObject);
    procedure EAApodoChange(Sender: TObject);
    procedure CBRazaClick(Sender: TObject);
    procedure DBLCBARazaCloseUp(Sender: TObject);
    procedure CBSexoClick(Sender: TObject);
    procedure DBLCBASexoFiltroCloseUp(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure CBPropietarioClick(Sender: TObject);
    procedure DBLCBAPropietarioFiltroCloseUp(Sender: TObject);
    procedure CBCriadorClick(Sender: TObject);
    procedure EACriadorFiltroChange(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure LFuenteClick(Sender: TObject);
    procedure LFuenteMouseEnter(Sender: TObject);
    procedure LFuenteMouseLeave(Sender: TObject);
    procedure SBPropietariosClick(Sender: TObject);
    procedure BCompraClick(Sender: TObject);
    procedure LVerAnimalesClick(Sender: TObject);
    procedure BDBGAbmDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AcEliminarExecute(Sender: TObject);
    procedure DBLCBRazaExternosCloseUp(Sender: TObject);
    procedure ControlEventoChange(Sender: TObject);
    function PuedeGrabar: Boolean;
    procedure EBusquedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    
  private
    id_senasa, id_rp, id_hba, id_otro, id_pc, id_ra : String;
    insertar : Integer;
    id_dep : integer;
    rp_filtro, hba_filtro, nombre_filtro, apodo_filtro, criador_filtro : String;
    sexo_filtro, raza_filtro, propietario_filtro : Integer;
    SQLOriginal, SQLTodos : String;
    function Validar() : Boolean;
    function  ICreate(AOwner: TComponent): TFABMSimple;
    function  IValorRetorno: Variant;
    procedure IShow;
    procedure IFitrate(sexo:integer;establecimiento:integer);
    procedure IAbrir(forma:TFormaAbm);
    procedure ISetCampoRetorno(campo:String);
    function  IModalResult: Integer;
    procedure PasarAEditar; override;//reintroduce;
    procedure cargarNuevos;
    procedure CargarDatosGeneralesDeps();
    procedure ClearDeps();
    procedure CargarDeps();
    procedure HabilitarCompDeps(estado:boolean);
    function PasarDepAFloat(DEP:String): Double;    
    function PasarFloatADep(valor:Double): String;
    function CheckFormatoDep(var Valor : String) : Boolean;
    function CheckFormatoPrec(var Valor : String) : Boolean;
    procedure HabilitarBotones(valor: boolean);
    procedure InsertarModificarDeps();
    procedure HabilitarComponentesVersionBasica; override;
    procedure AbrirFuentesDEPs;
    procedure InsertarFuentesDEPs;
    procedure HabilitarFuentesDEPs;
    procedure ActualizarConsultaFiltros();
    function Convertido(Control: TControl; var IControl: IDBControl): boolean;
    procedure AjustarColumnas;
    procedure OcultarBotones;
    procedure MostrarBotones;
    function OpcionesParaGrabar : Boolean;override;

    procedure GuardarGenealog;
    procedure GuardarTemporalmenteDeps;

    procedure ExpandirGroups(F : TFEveAltaDirecta);
    
  protected
    procedure ComponentesVisiblesPorPais(pais: Integer);override;

    procedure AnchoAltoEstatico();override;

  public
    ID_Animal : integer;
    sexoAbm : integer;
    Genealogia : TArrAuxiliar;
    EstabAux : integer;
    id_animal_ex : integer;

    altaDesdeXml : boolean;
    xmlCaravana,xmlRaza,xmlCategoria,xmlApodo: string;
    procedure CargarSexoPorSexo();


  end;

var
  FABMPadresExternos: TFABMPadresExternos;
  vPrimerIngreso: boolean;
  vDatosCompletos: boolean;
  vCancelaEve : boolean;
  Guardado : boolean;
  arrGenealogia : array of TRegGen;
  RazaAnimal : integer;


procedure Register;

implementation

{$R *.dfm}

uses UDMsoftvet, UPrincipal, UArbolGeneaExterno, UImportacion, UmensajeNuevos,
     URepRegHistoricoDEPSPreview,UImpDeps, UABMPropietarioAnimal, URepFichaAnimal,UREpStockSemen ,UEveParto,
     StrUtils, URepStockEmbriones, URepListadoReceptoras, URepListadoImplantes, URepInfoDonantes,
     URepEmbrionesTransferidos, UREPListadoAnimalesExternosPreview, UABMFuentesDeps,
     UCoopropiedad, UTraduccion, UEveMovimientoSemenCompra, USelAnimalesEmbriones, UImpXml;

(*
  ... y esto ???
*)

procedure TFABMPadresExternos.AnchoAltoEstatico;
begin
  Height := 600;
  Width  := 1040;
end;


procedure Register;
begin
  RegisterClass(TFABMPadresExternos);
end;

(*
  Creamos una instancia a traves de la interface
*)
function TFABMPadresExternos.ICreate(AOwner: TComponent):TFABMSimple;
begin
  Result := TFABMPadresExternos.Create(AOwner);
end;

(*
  Filtramos el form en base al establecimiento y el sexo
*)
procedure TFABMPadresExternos.IFitrate(sexo:integer; establecimiento:integer);
var query: String;
begin
  sexoAbm := sexo;
  DBLCBASexoFiltro.Visible := sexoabm = -1;
  CBSexo.Visible := sexoabm = -1;

  query:= 'select A.APODO, A.ID_ANIMAL_EXTERNO, A.ID_HBA, A.sexo, C.NOMBRE as nomsex,'+
          ' A.ID_OTRO, A.ID_PC, A.ID_RA, A.ID_RP, A.ID_SENASA,A.NOMBRE as NOMBRE, A.NOMBRE as nombre_animal,'+
          ' A.raza, r.codigo as nomraz, A.ESTABLECIMIENTO, cast (A.ID_RP as varchar(12)) || ''E'' as KeyValue,'+
          ' A.CRIADOR, CP.NOMBRE as Nom_Prop, A.PROPIETARIO, A.FECHA_NACIMIENTO, A.ADN, A.TIPIFICACION_SANGUINEA, A.color as color, A.tipo_registro as tiporeg, A.Visible, a.PN, a.PD, a.PA, a.PT, a.CE, a.FR' +
          ' from TAB_ANIMALES_EXTERNOS A,  COD_SEXOS C, COD_RAZAS R, COD_PROPIETARIO CP where (C.tipo = :tiposexo)' +
          ' and ( A.sexo = C.id_sexo) and (R.ID_RAZA = A.RAZA)'+
          ' and A.Establecimiento = :ESTABLECIMIENTO'+
          ' AND (CP.ID_PROPIETARIO =  A.PROPIETARIO)';

  if (sexoabm = -1) then
   query:= 'select A.APODO, A.ID_ANIMAL_EXTERNO, A.ID_HBA, A.sexo, C.NOMBRE as nomsex,'+
           ' A.ID_OTRO, A.ID_PC, A.ID_RA, A.ID_RP, A.ID_SENASA,A.NOMBRE as NOMBRE, A.NOMBRE as nombre_animal,'+
           ' A.raza, r.codigo as nomraz, A.ESTABLECIMIENTO, cast (A.ID_RP as varchar(12)) || ''E'' as KeyValue,'+
           ' A.CRIADOR, CP.NOMBRE as Nom_Prop, A.PROPIETARIO, A.FECHA_NACIMIENTO, A.ADN, A.TIPIFICACION_SANGUINEA, A.color as color, A.tipo_registro as tiporeg, A.Visible,  a.PN, a.PD, a.PA, a.PT, a.CE, a.FR' +
           ' from TAB_ANIMALES_EXTERNOS A,  COD_SEXOS C, COD_RAZAS R, COD_PROPIETARIO CP where ' +
           ' (A.sexo = C.id_sexo) and (R.ID_RAZA = A.RAZA)'+
           ' and A.Establecimiento = :ESTABLECIMIENTO'+
           ' AND (CP.ID_PROPIETARIO =  A.PROPIETARIO)';

  SQLOriginal := query;
  IBQAbmSimple.SQL.Clear;
  IBQAbmSimple.SQL.Add(query);
  IBQAbmSimple.Close;
//  IBQAbmSimple.ParamByName('establecimiento').Value := establecimiento;
  if (sexoabm <> -1) and (IBQAbmSimple.Params.FindParam('tiposexo') <>nil) then
    IBQAbmSimple.ParamByName('tiposexo').Value := sexo;
  IBQAbmSimple.Open;
end;

(*
  Nos mostramos, a traves de la interfaz, como modal
*)
procedure TFABMPadresExternos.IShow;
begin
  ShowModal;
  vCancelaEve := false;
end;

(*
  Devolvemos, a traves de la interfaz, el valor seleccionado por el usuario
*)
function TFABMPadresExternos.IValorRetorno: Variant;
begin
//  if (Owner is TFMovimientosdeSemenCompra) then
//    Result := ID_Animal
//  else
    Result := ValorRetorno;
end;

(*
  Abrimos, a traves de la interfaz
*)
procedure TFABMPadresExternos.IAbrir(forma:TFormaAbm);
begin
    Abrir(forma);
end;

(*
  Establecemos, a traves de la interfaz, el campo a devolver
*)
procedure TFABMPadresExternos.ISetCampoRetorno(campo: String);
begin
  CampoRetorno := Campo
end;

(*
  Mandamos los datos al query antes de aplicarlos en la base
*)

function TFABMPadresExternos.Validar() : Boolean;
var
  resultado : boolean;
begin
  IBQRNIdentificacion.Close;
  IBQRNIdentificacion.ParamByName('animal').AsInteger := ID_Animal;
 // IBQRNIdentificacion.ParamByName('esta').AsInteger := FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['ID_ANIMAL_EXTERNO']); //FPrincipal.EstablecimientoActual;
  if ((Trim(DBEARPExternos.Text) <> '') and (Trim(DBEARPExternos.Text) <> id_rp)) then
    IBQRNIdentificacion.ParamByName('rp').Value := Trim(DBEARPExternos.Text)
  else
    IBQRNIdentificacion.ParamByName('rp').Value := null;

  if ((Trim(DBEASenasaExternos.Text) <> '') and (Trim(DBEASenasaExternos.Text) <> id_senasa)) then
    IBQRNIdentificacion.ParamByName('senasa').Value := Trim(DBEASenasaExternos.Text)
  else
    IBQRNIdentificacion.ParamByName('senasa').Value := null;

  if ((Trim(DBEAPCExternos.Text) <> '') and (Trim(DBEAPCExternos.Text) <> id_pc)) then
    IBQRNIdentificacion.ParamByName('pc').Value := Trim(DBEAPCExternos.Text)
  else
    IBQRNIdentificacion.ParamByName('pc').Value := null;

  if ((Trim(DBEAHBAExternos.Text) <> '') and (Trim(DBEAHBAExternos.Text) <> id_hba)) then
    IBQRNIdentificacion.ParamByName('hba').Value := Trim(DBEAHBAExternos.Text)
  else
    IBQRNIdentificacion.ParamByName('hba').Value := null;

  if ((Trim(DBEARAExternos.Text) <> '') and (Trim(DBEARAExternos.Text) <> id_ra)) then
    IBQRNIdentificacion.ParamByName('ra').Value := Trim(DBEARAExternos.Text)
  else
    IBQRNIdentificacion.ParamByName('ra').Value := null;

  if ((Trim(DBEAOtroExternos.Text) <> '') and (Trim(DBEAOtroExternos.Text) <> id_otro)) then
    IBQRNIdentificacion.ParamByName('otro').Value := Trim(DBEAOtroExternos.Text)
  else
    IBQRNIdentificacion.ParamByName('otro').Value := null;
  IBQRNIdentificacion.Open;

  IBQRNIdentificacion.First;
  resultado := IBQRNIdentificacion.FieldByName('result').AsString = 'A';
  if not resultado then
  begin
    PError.Visible := true;
    MAErrors.Clear;
    while not IBQRNIdentificacion.Eof do
    begin
      MAErrors.Lines.Add(IBQRNIdentificacion.FieldValues['result']+': '+DBEARPExternos.Text+': '+IBQRNIdentificacion.FieldValues['mensaje']);
      IBQRNIdentificacion.Next;
    end;
  end
  else
    PError.Visible := false;
  Result := resultado;
end;

procedure TFABMPadresExternos.AcGuardarExecute(Sender: TObject);
var
  d : double;
  asemen : TFMovimientosdeSemenCompra;
begin

  if Validar then
  begin

    try
        DSAbmSimple.DataSet.FieldByName('adn').AsString := EAADN.Text;

        DSAbmSimple.DataSet.FieldByName('color').Value := DBLCBColor.KeyValue;

        DSAbmSimple.DataSet.FieldByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['ID_ANIMAL_EXTERNO']);

        DSAbmSimple.DataSet.FieldByName('FECHA_NACIMIENTO').AsDateTime := DTPAFechaNacimiento.Date;

        DSAbmSimple.DataSet.FieldByName('id_animal_externo').AsInteger := ID_Animal;

        if (Trim(DBEANombreExternos.Text) = '') then
          DSAbmSimple.DataSet.FieldByName('NOMBRE').AsString := DSAbmSimple.DataSet.FieldByName('id_rp').AsString
        else            
          DSAbmSimple.DataSet.FieldByName('NOMBRE').AsString := DBEANombreExternos.Text;

        DSAbmSimple.DataSet.FieldByName('propietario').AsInteger:= 0;

        DSAbmSimple.DataSet.FieldByName('Raza').AsInteger := DBLCBRazaExternos.KeyValue;

        DSAbmSimple.DataSet.FieldByName('Sexo').AsInteger := DBLCBASexo.KeyValue;

        DSAbmSimple.DataSet.FieldByName('tipificacion_sanguinea').AsString :=  EASanguinea.Text;

        DSAbmSimple.DataSet.FieldByName('tiporeg').Value :=  DBLCBTipoRegistro.KeyValue;

        DSAbmSimple.DataSet.FieldByName('visible').AsString :=  'S';

        DSAbmSimple.DataSet.FieldByName('NOMRAZ').AsString := DBLCBRazaExternos.Text;

        DSAbmSimple.DataSet.FieldByName('NOMSEX').AsString := DBLCBASexo.Text;

        DSAbmSimple.DataSet.FieldByName('KeyValue').AsString := DSAbmSimple.DataSet.FieldByName('id_rp').AsString + 'E';// FIJARSE ESTO PORQUE HAY VECES QUE APARECEN COMO 'N'

        try
          if TryStrToFloat(EAPN.Text,d) then
            DSAbmSimple.DataSet.FieldByName('PN').Value := d
          else
            DSAbmSimple.DataSet.FieldByName('PN').Value := null;

          if TryStrToFloat(EAPD.Text,d) then
             DSAbmSimple.DataSet.FieldByName('PD').Value := d
          else
            DSAbmSimple.DataSet.FieldByName('PD').Value := null;
        except

        end;

        if TryStrToFloat(EAPA.Text,d) then
          DSAbmSimple.DataSet.FieldByName('PA').Value := d
        else
          DSAbmSimple.DataSet.FieldByName('PA').Value := null;

        if TryStrToFloat(EAPT.Text,d) then
          DSAbmSimple.DataSet.FieldByName('PT').Value := d
        else
          DSAbmSimple.DataSet.FieldByName('PT').Value := null;

        if TryStrToFloat(EACE.Text,d) then
          DSAbmSimple.DataSet.FieldByName('CE').Value := d
        else
          DSAbmSimple.DataSet.FieldByName('CE').Value := null;

        if TryStrToFloat(EAFR.Text,d) then
          DSAbmSimple.DataSet.FieldByName('FR').Value := d
        else
          DSAbmSimple.DataSet.FieldByName('FR').Value := null;

        IBQAbmSimple.Post;
        try
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;

    except
       GuardarGenealog;
    end;


    inherited;
{    try
      IBSPArbol.Close;
      IBSPArbol.ParamByName('ID_ANIMAL').Value := ID_Animal;
      IBSPArbol.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      IBSPArbol.ParamByName('NIVEL').Value := '1';
      IBSPArbol.ExecProc;

      IBSPFIXRELANIMPADRESEXTCICLICO.ExecProc;


      FPrincipal.IBTPrincipal.CommitRetaining;

    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;  }

    GuardarGenealog;

        try
          if (Trim(DBEANombreExternos.Text) = '') then
           IBQNombreAnimal.ParamByName('NOMBRE').value:= DSAbmSimple.DataSet.FieldByName('id_rp').AsString
          else
            IBQNombreAnimal.ParamByName('NOMBRE').value:= DBEANombreExternos.Text;

           IBQNombreAnimal.ParamByName('ID').value :=  ID_Animal;
           IBQNombreAnimal.execSQL();
        except
        end;


    try
      IBQEliminarCoopropiedadExterna.Close;
      IBQEliminarCoopropiedadExterna.ParamByName('id_animal').AsInteger:= ID_Animal ;
      IBQEliminarCoopropiedadExterna.Open;

      IBQAuxCoopropiedad.Close;
      IBQAuxCoopropiedad.Open;
      IBQAuxCoopropiedad.First;

      if not(IBQAuxCoopropiedad.Eof) then
      begin
          while not IBQAuxCoopropiedad.Eof do
          begin
            IBQInsertCoopropiedadExterna.Close;
            IBQInsertCoopropiedadExterna.ParamByName('id_animal_externo').AsInteger:= id_animal;
            IBQInsertCoopropiedadExterna.ParamByName('propietario').AsInteger:= IBQAuxCoopropiedad.fieldbyname('id_propietario').AsInteger;
            IBQInsertCoopropiedadExterna.ParamByName('porcentaje').AsFloat:= IBQAuxCoopropiedad.fieldbyname('porcentaje').AsFloat;
            IBQInsertCoopropiedadExterna.Open;

            IBQAuxCoopropiedad.Next;
          end;
      end
      else
      begin
            IBQInsertCoopropiedadExterna.Close;
            IBQInsertCoopropiedadExterna.ParamByName('id_animal_externo').AsInteger:= id_animal;
            IBQInsertCoopropiedadExterna.ParamByName('propietario').AsInteger:= 0;
            IBQInsertCoopropiedadExterna.ParamByName('porcentaje').AsFloat:= 100;
            IBQInsertCoopropiedadExterna.Open;
      end;
      IBQDeleteAuxPropiedad.Close;
      IBQDeleteAuxPropiedad.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;

    IBQAbmSimple.Close;
//    IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
    IBQAbmSimple.Open;
    IBQAbmSimple.Last;
    IBQAbmSimple.First;

    PError.Visible := false;
    PEditar.Visible:= false;
    PCFichaAnimalExterno.Visible:= False;

    OcultarBotones;
    MostrarBotones;

    if not(Guardado) then
    begin
        try
           // IBQGuardarDatosDeps.Close;
           // IBQGuardarDatosDeps.Open;
            FPrincipal.IBTPrincipal.CommitRetaining;
        except
            FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
    end;

    if self.Owner is TFArbolGeneaExterno then
    begin;
      Close;
    end;

    DMSoftvet.IBQRaza.Close;
    DMSoftvet.IBQRaza.SQL.Clear;
    DMSoftvet.IBQRaza.SQL.Add('select ID_RAZA, SINONIMO, NOMBRE, DIAS_GESTACION, CODIGO from COD_RAZAS where visible = 1 order by nombre asc');
    DMSoftvet.IBQRaza.Open;

    AnchoAltoEstatico;

    if ((Owner is TFMovimientosdeSemenCompra) or (Owner is TFEveAltaDirecta) or (Owner is TFEveParto) or (Owner is TFSelAnimalesEmbriones))then
    begin
        desdeEvento := ID_Animal;
        AcElegirExecute(sender);
    end;

  end;


  IBQGuardo.Close;
  IBQGuardo.ParamByName('car').AsString := UpperCase(xmlCaravana);
  IBQGuardo.ParamByName('est').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGuardo.Open;
  if (IBQGuardo.RecordCount=1) then
    begin
      if (Owner is TFImpxml) then
        begin
          MostrarMensaje(tmInformacion,'Debe dar de alta stock de semen de '+xmlApodo+' para poder continuar con el evento.');
          asemen:= TFMovimientosdeSemenCompra.Create(self);
          asemen.desdeXml := true;
          asemen.caravanaXml := xmlCaravana;
          asemen.idXml := IBQGuardo.FieldValues['ID_ANIMAL_EXTERNO'];
          asemen.showmodal();
          asemen.Destroy;
        end;
    end;
end;

(*
  Devolvemos, a traves de la interfaz, el modal result
*)
function TFABMPadresExternos.IModalResult: Integer;
begin
  inherited;

  {if (Owner is TFMovimientosdeSemenCompra) then
    if not(vCancelaEve) then
      Result := mrOk;}

  Result := ModalResult;
end;

(*
  Cuando el usuario elige un animal, el resultado es OK
*)
procedure TFABMPadresExternos.AcElegirExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

(*
  Nos mostramos, a traves de la interfaz, como modal
*)
procedure TFABMPadresExternos.AcSalirExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  vCancelaEve := true;
end;

(*
  Reabrimos querys filtrados, y fijamos la primer raza
*)
procedure TFABMPadresExternos.FormShow(Sender: TObject);
var i:integer;
  e : integer;
begin
  inherited;

  ClearDeps;
  
  {try
    IBQDelAuxDeps.Close;
    IBQDelAuxDeps.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;   }

  Guardado := false;

  SetLength(arrGenealogia,14);

  DMSoftvet.IBQRaza.Close;
  DMSoftvet.IBQRaza.SQL.Clear;
  DMSoftvet.IBQRaza.SQL.Add('select ID_RAZA, SINONIMO, NOMBRE, DIAS_GESTACION, CODIGO from COD_RAZAS where visible = 1 order by nombre asc');
  DMSoftvet.IBQRaza.Open;

  CargarSexoPorSexo();

  IBQFuenteDeps.Close;
  IBQFuenteDeps.Open;
  IBQFuenteDeps.Last;
  IBQFuenteDeps.First;

  IBQTipoRegistro.Close;
  IBQTipoRegistro.Open;
  IBQTipoRegistro.Last;
  IBQTipoRegistro.First;

  IBQColor.Close;
  IBQColor.Open;
  IBQColor.Last;
  IBQColor.First;

  DMSoftvet.IBQCodPropietario.Close;
  DMSoftvet.IBQCodPropietario.Open;

  CBADN.Visible := false;
  CBSanguinea.Visible := false;

  LADN.Enabled := FPrincipal.FuncActividad;
  LTipificacion.Enabled := FPrincipal.FuncActividad;
  EAADN.Enabled := FPrincipal.FuncActividad;
  EASanguinea.Enabled := FPrincipal.FuncActividad;

//  if (Owner is TFMovimientosdeSemenCompra) then
//  begin
      AcInsertarExecute(sender);
//  end
//  else
//  begin

    rp_filtro := '%';
    hba_filtro := '%';
    nombre_filtro := '%';
    apodo_filtro := '%';
    criador_filtro := '%';
    sexo_filtro := -1;
    raza_filtro := -1;
    propietario_filtro := -1;

    //RBUltimosDiezA.Checked := true;
    RBTodos.Checked := true;

    if (self.Owner is TFRepFichaAnimal) or (self.Owner is TFREpStockSemen)then
      e := EstabAux
    else
      e := FPrincipal.EstablecimientoActual;

    IBQAbmSimple.Close;
    if sexoAbm = -1 then
    begin
      IBQAbmSimple.SQL.Clear;
      IBQAbmSimple.SQL.Add(SQLOriginal);
    end;

  // IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := e;
    IBQAbmSimple.Open;

    DBLCBRazaExternos.KeyValue := 0;

    ComponentesVisiblesPorPais(FPrincipal.Pais);

    AcSalir.Visible := True;
    BBSalir.Left:=BBElegir.Left+150;
    RBCuigSenasa.Checked:=false;
    RBSenasa.Checked:=false;
    DBEASenasaExternos.Enabled:=false;

    insertar := -1;//insertar o modificar
    HabilitarCompDeps(true);
    PCFichaAnimalExterno.ActivePage:= TSDeps;
    PCFichaAnimalExterno.Visible:= False;

    if self.Owner is TFMensajeNuevos then
    begin;
      cargarNuevos;
      FPrincipal.IBDPrincipal.ApplyUpdates([IBQAbmSimple]);
    end;

    PasarANavegar;

    if (self.Owner is TFRepFichaAnimal) or (self.Owner is TFImpDeps) or
       (self.Owner is TFRepStockEmbriones) or (self.Owner is TFRepListadoReceptoras) or
       (self.Owner is TFREPInfoDonantes) or (self.Owner is TFRepListadoImplantes)
       or (self.Owner is TFRepEmbrionesTransferidos) or (self.Owner is TFREpStockSemen) then
    begin
        IBQAbmSimple.Locate('ID_ANIMAL_EXTERNO',strtoint(nom),[]);
        acEditarExecute(self);
        BBCancelar.Caption:=Traducir('Salir');
        BBGuardar.Visible:=false;
        ADeps.Enabled:= (FPrincipal.EstablecimientoActual = EstabAux) and FPrincipal.FuncDEPs;
        AArbolGeneaExternos.Enabled := (FPrincipal.EstablecimientoActual = EstabAux) and FPrincipal.FuncGenealogia;
    end;

 {   if self.Owner is TFArbolGeneaExterno then
    begin;
      AcInsertarExecute(self);
    end;}

    if IBQAbmSimple.Locate('id_animal_externo',TFImpDeps(self.Owner).id,[]) then
      AcEditarExecute(self);

    if (Owner is TFMovimientosdeSemenCompra) then
    begin
      AcInsertarExecute(sender);
    end;

    BDBGAbmCellClick(nil);

    AjustarColumnas;

    BDBGAbm.Columns[12].Visible := FPrincipal.FuncActividad;
    BDBGAbm.Columns[13].Visible := FPrincipal.FuncActividad;

    OcultarBotones;
    if not(self.Owner is TFRepFichaAnimal) then
        MostrarBotones;
//  end;
    if ((Owner is TFMovimientosdeSemenCompra) or (Owner is TFEveAltaDirecta) or (self.Owner is TFArbolGeneaExterno) or (self.Owner is TFEveParto) or (self.Owner is TFSelAnimalesEmbriones)) then
    begin
      AcInsertarExecute(sender);
    end;

    if altaDesdeXml then
      begin
        AcInsertarExecute(sender);
        DBEARPExternos.Text := xmlCaravana;
        DBEAApodoExternos.Text := xmlApodo;
        if (xmlRaza = 'Angus negro') or (xmlRaza = 'Angus colorado') then
          DBLCBRazaExternos.KeyValue := 29
        else
          begin
            IBQCodRaza.Close;
            IBQCodRaza.ParamByName('n').AsString := xmlRaza;
            IBQCodRaza.Open;
            DBLCBRazaExternos.KeyValue:= IBQCodRaza.Lookup('NOMBRE',xmlRaza,'ID_RAZA');
          end;

    end;
    ActualizarConsultaFiltros;
end;

(*
  Los Animales Externos son modificables por el usuario
*)
function TFABMPadresExternos.PuedeGrabar: Boolean;
var
  ind : Integer;
  res : Boolean;
  aux : IDBControl;
begin
  res := True;
  for ind := 0 to PEditar.ControlCount - 1 do
    if Convertido(PEditar.Controls[ind], aux) then
      res := res and aux.PuedeGrabar;
  Result := res AND OpcionesParaGrabar;
  if (self is TFABMPadresExternos) then
    Result := OpcionesParaGrabar;
end;

function TFABMPadresExternos.Convertido(Control: TControl;
  var IControl: IDBControl): boolean;
begin
  Convertido := True;
  IControl   := nil;
  if Control is TDBEditAuto then
    IControl := IDBControl(TDBEditAuto(Control))
  else
    if Control is TDBLookUpComboBoxAuto then
      IControl := IDBControl(TDBLookUpComboBoxAuto(Control))
    else
      if Control is TEditAuto then
        IControl := IDBControl(TEditAuto(Control))
      else
        if Control is TEditAutoMinuscula then
          IControl := IDBControl(TEditAutoMinuscula(Control))
        else
          if Control is TDBEditMinuscula then
            IControl := IDBControl(TDBEditMinuscula(Control))
          else
            if Control is TEditAutoMinuscula then
              IControl := IDBControl(TEditAutoMinuscula(Control))
            else
                Convertido := False;
end;

procedure TFABMPadresExternos.ControlEventoChange(Sender: TObject);
begin
  LTerminar.Visible := PuedeGrabar;
  ITerminar.Visible := PuedeGrabar;
  FormResize(self);
end;


procedure TFABMPadresExternos.FormCreate(Sender: TObject);
var
  ind : integer;
  aux : IDBControl;
begin
  inherited;
  PermiteCambio := True;
  vDatosCompletos:= false;
  sexoAbm := -1;
  altaDesdeXml := false;

  for ind := 0 to self.ComponentCount - 1 do
  begin
    if (components[ind] is TControl) then
    begin
      if Convertido(TControl(Components[ind]),aux) then
        begin
        aux.SetOnSaveChange(ControlEventoChange);
       end;
    end;
  end;

  SQLOriginal := 'select A.APODO, A.ID_ANIMAL_EXTERNO, A.ID_HBA, A.sexo, C.NOMBRE as nomsex,'+
          ' A.ID_OTRO, A.ID_PC, A.ID_RA, A.ID_RP, A.ID_SENASA,A.Nombre as Nombre, A.NOMBRE as nombre_animal,'+
          ' A.raza, r.codigo as nomraz, A.ESTABLECIMIENTO, cast (A.ID_RP as varchar(12)) || ''E'' as KeyValue,'+
          ' A.CRIADOR, CP.NOMBRE as Nom_Prop, A.PROPIETARIO, A.FECHA_NACIMIENTO, A.ADN, A.TIPIFICACION_SANGUINEA, A.color as color, A.tipo_registro as tiporeg, A.Visible,' +
          ' a.PN, a.PD, a.PA, a.PT, a.CE, a.FR'+
          ' from (TAB_ANIMALES_EXTERNOS A join COD_SEXOS C on A.sexo = C.id_sexo) join COD_RAZAS R on A.raza = R.id_raza join COD_PROPIETARIO CP on A.propietario = CP.id_propietario where' +
          ' ( A.sexo = C.id_sexo) and (R.ID_RAZA = A.RAZA) and A.Establecimiento = :ESTABLECIMIENTO'+
          ' AND (CP.ID_PROPIETARIO =  A.PROPIETARIO) and (A.visible = ''S'')';
  if sexoAbm <> -1 then
  begin
    SQLOriginal := 'select A.APODO, A.ID_ANIMAL_EXTERNO, A.ID_HBA, A.sexo, C.NOMBRE as nomsex,'+
          ' A.ID_OTRO, A.ID_PC, A.ID_RA, A.ID_RP, A.ID_SENASA,A.Nombre as Nombre, A.NOMBRE as nombre_animal,'+
          ' A.raza, r.codigo as nomraz, A.ESTABLECIMIENTO, cast (A.ID_RP as varchar(12)) || ''E'' as KeyValue,'+
          ' A.CRIADOR, CP.NOMBRE as Nom_Prop, A.PROPIETARIO, A.FECHA_NACIMIENTO, A.ADN, A.TIPIFICACION_SANGUINEA, A.color as color, A.tipo_registro as tiporeg, A.Visible,' +
          ' a.PN, a.PD, a.PA, a.PT, a.CE, a.FR'+
          ' from (TAB_ANIMALES_EXTERNOS A join COD_SEXOS C on A.sexo = C.id_sexo) join COD_RAZAS R on A.raza = R.id_raza join COD_PROPIETARIO CP on A.propietario = CP.id_propietario where' +
          ' ( A.sexo = C.id_sexo) and (R.ID_RAZA = A.RAZA) and A.Establecimiento = :ESTABLECIMIENTO and (a.sexo = :tiposexo)'+
          ' AND (CP.ID_PROPIETARIO =  A.PROPIETARIO) and (A.visible = ''S'')';
  end;

 SQLTodos := 'select A.APODO, A.ID_ANIMAL_EXTERNO, A.ID_HBA, A.sexo, C.NOMBRE as nomsex,'+
          ' A.ID_OTRO, A.ID_PC, A.ID_RA, A.ID_RP, A.ID_SENASA,A.Nombre as Nombre, A.NOMBRE as nombre_animal,'+
          ' A.raza, r.codigo as nomraz, A.ESTABLECIMIENTO, cast (A.ID_RP as varchar(12)) || ''E'' as KeyValue,'+
          ' A.CRIADOR, CP.NOMBRE as Nom_Prop, A.PROPIETARIO, A.FECHA_NACIMIENTO, A.ADN, A.TIPIFICACION_SANGUINEA, A.color as color, A.tipo_registro as tiporeg, A.Visible,' +
          ' a.PN, a.PD, a.PA, a.PT, a.CE, a.FR'+
          ' from (TAB_ANIMALES_EXTERNOS A join COD_SEXOS C on A.sexo = C.id_sexo) join COD_RAZAS R on A.raza = R.id_raza join COD_PROPIETARIO CP on A.propietario = CP.id_propietario where' +
          ' ( A.sexo = C.id_sexo) and (R.ID_RAZA = A.RAZA)'+
          // 18Set 2013 : Juan
          // ' and A.Establecimiento = :ESTABLECIMIENTO'+
          ' AND (CP.ID_PROPIETARIO =  A.PROPIETARIO)';

  if sexoAbm <> -1 then
  begin
    SQLTodos := 'select A.APODO, A.ID_ANIMAL_EXTERNO, A.ID_HBA, A.sexo, C.NOMBRE as nomsex,'+
          ' A.ID_OTRO, A.ID_PC, A.ID_RA, A.ID_RP, A.ID_SENASA,A.Nombre as Nombre, A.NOMBRE as nombre_animal,'+
          ' A.raza, r.codigo as nomraz, A.ESTABLECIMIENTO, cast (A.ID_RP as varchar(12)) || ''E'' as KeyValue,'+
          ' A.CRIADOR, CP.NOMBRE as Nom_Prop, A.PROPIETARIO, A.FECHA_NACIMIENTO, A.ADN, A.TIPIFICACION_SANGUINEA, A.color as color, A.tipo_registro as tiporeg, A.Visible,' +
          ' a.PN, a.PD, a.PA, a.PT, a.CE, a.FR'+
          ' from (TAB_ANIMALES_EXTERNOS A join COD_SEXOS C on A.sexo = C.id_sexo) join COD_RAZAS R on A.raza = R.id_raza join COD_PROPIETARIO CP on A.propietario = CP.id_propietario where' +
          ' ( A.sexo = C.id_sexo) and (R.ID_RAZA = A.RAZA)'+
          ' and A.Establecimiento = :ESTABLECIMIENTO and (a.sexo = :tiposexo)'+
          ' AND (CP.ID_PROPIETARIO =  A.PROPIETARIO)';
  end;
end;

procedure TFABMPadresExternos.EValorFiltrarChange(Sender: TObject);
begin
  inherited;
//  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
  if (sexoabm <> -1)and (IBQAbmSimple.Params.FindParam('tiposexo') <>nil) then
    IBQAbmSimple.ParamByName('tiposexo').Value := sexoabm;
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
end;

procedure TFABMPadresExternos.SBFiltrarClick(Sender: TObject);
begin
  inherited;
//  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
  if (sexoabm <> -1)and (IBQAbmSimple.Params.FindParam('tiposexo') <>nil) then
    IBQAbmSimple.ParamByName('tiposexo').Value := sexoabm;
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
end;

procedure TFABMPadresExternos.CBCriterioFiltrarChange(Sender: TObject);
begin
  inherited;
//  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
  if (sexoabm <> -1)and (IBQAbmSimple.Params.FindParam('tiposexo') <>nil) then
    IBQAbmSimple.ParamByName('tiposexo').Value := sexoabm;
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
end;

procedure TFABMPadresExternos.IBQAbmSimpleAfterOpen(DataSet: TDataSet);
begin
  inherited;
  BBElegir.Enabled := not(DataSet.IsEmpty);
  GBCantidad.Caption := Traducir('Animales [')+IntToStr(DataSet.RecordCount)+']';
  SBBuscar.Visible := false;
  SBFiltrar.Visible := false;
  //BBImprimirReporte.Enabled := not DataSet.IsEmpty;
  LPreliminar.Enabled := not DataSet.IsEmpty;
  IPreliminar.Enabled := not DataSet.IsEmpty;
  //BBXls.Enabled := not DataSet.IsEmpty;
  JvIExpExcel.Enabled := not DataSet.IsEmpty;
  LExpExcel.Enabled := not DataSet.IsEmpty;
end;

procedure TFABMPadresExternos.IBQAbmSimpleAfterPost(DataSet: TDataSet);
begin
  inherited;
  BBElegir.Enabled := not(IBQAbmSimple.IsEmpty);
end;

procedure TFABMPadresExternos.DBEASenasaExternosExit(Sender: TObject);
var
  valor : integer;
begin
  inherited;
  if RBSenasa.Checked then
  begin
   if (DBEASenasaExternos.Text <> '') then
    begin
      if TryStrToInt(DBEASenasaExternos.Text,valor) then
        DBEASenasaExternos.Text := UFunctions.CompletarDigitosSenasa(DBEASenasaExternos.Text)
      else
      begin
        MostrarMensaje(tmError,'El formato de '+FPrincipal.PaisNombreCaravana+' no es válido. Solo se permiten digitos');
        DBEASenasaExternos.Text := '';
      end;
    end;
  end
  else if not UFunctions.CheckFormatoCUIG(DBEASenasaExternos.Text) then
       begin
        MostrarMensaje(tmError,'El formato del CUIG-SENASA no es Válido "AA000AAA0"');
        DBEASenasaExternos.Text := '';
       end;
end;

procedure TFABMPadresExternos.AcInsertarExecute(Sender: TObject);
var i : integer;
begin
  inherited;
  SetLength(Genealogia,0);

  for i := 0 to 14-1 do
  begin
      arrGenealogia[i].id_animal := 0;
      arrGenealogia[i].sexo := 0;
      arrGenealogia[i].nivel := '';
  end;
  
  id_rp := '-1';
  id_senasa := '-1';
  id_pc := '-1';
  id_ra := '-1';
  id_otro := '-1';
  id_hba := '-1';
  IBQGenId.Close;
  IBQGenId.Open;
  ID_Animal := IBQGenId.FieldValues['IDEXT'];
  EAEncabezado.Text:='';
  EAUltimoIdent.Text:='';
  EVerificador.Text:='';
  DBEASenasaExternos.Text:='';
  RBSenasa.Checked:=false;
  RBCuigSenasa.Checked:=false;
  DBEASenasaExternos.Enabled:=false;
  TSDeps.TabVisible:= false;
  ADeps.Enabled:= False;

  JvIExpExcel.Visible := false;
  LExpExcel.Visible := false;
  IPreliminar.Visible := false;
  LPreliminar.Visible := false;

  LGenea.Visible := false;
  IPedigree.Visible := false;

  LDeps.Visible := false;
  IDEps.Visible := false;

  LCompra.Visible := false;
  ICompraAnimal.Visible := false;

  OcultarBotones;
  //MostrarBotones;
end;

procedure TFABMPadresExternos.AcCancelarExecute(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQRaza.Close;
  DMSoftvet.IBQRaza.SQL.Clear;
  DMSoftvet.IBQRaza.SQL.Add('select ID_RAZA, SINONIMO, NOMBRE, DIAS_GESTACION, CODIGO from COD_RAZAS where visible = 1 order by nombre asc');
  DMSoftvet.IBQRaza.Open;

  OcultarBotones;
  MostrarBotones;
  
  PError.Visible := false;
  PEditar.Visible:= false;
  PCFichaAnimalExterno.Visible:= False;
  
  if IBQAbmSimple.Modified then
    PEditar.Visible:= true;

  if (self.Owner is TFRepFichaAnimal) or (self.Owner is TFImpDeps) or
     (self.Owner is TFRepStockEmbriones) or (self.Owner is TFRepListadoReceptoras) or
     (self.Owner is TFREPInfoDonantes) or (self.Owner is TFRepListadoImplantes)
     or (self.Owner is TFRepEmbrionesTransferidos) or (self.Owner is TFREpStockSemen) then
    self.Close
  else
    if (self.Owner is TFEveAltaDirecta) then
    begin
          ID_Animal := 0;
          self.Close;
    end;

  if (Owner is TFArbolGeneaExterno) then
  begin
    ID_Animal:=0;
    Close;
  end;

  AnchoAltoEstatico;

end;

procedure TFABMPadresExternos.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  RBSenasa.Caption:= FPrincipal.PaisNombreCaravana;
  BDBGAbm.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;
  BDBGAbm.ColumnByField('id_hba').Title.Caption:= FPrincipal.PaisHerdBook;
  LHBAMadre.Caption:= FPrincipal.PaisHerdBook+': ';
  if (pais = 1) then //Argentina
   begin
    RBCuigSenasa.Visible:= True;
    RBSenasa.Width:= 89;
   end
  else
    if (pais = 2) then //Uruguay
     begin
      RBCuigSenasa.Visible:= False;
      RBSenasa.Checked:= True;
      RBSenasa.Width:= 130;
     end
    else
       begin
        RBCuigSenasa.Visible:= False;
        RBSenasa.Checked:= True;
        RBSenasa.Width:= 130;
       end;
end;


procedure TFABMPadresExternos.AcEditarExecute(Sender: TObject);
var
  letra:char;
  query : string;
begin
  AcEditar.Enabled := true;
  Guardado := true;
  inherited;
  Guardado := true;
  if (Owner is TFMovimientosdeSemenCompra) then
    AcElegirExecute(sender)
  else
  begin
     if (IBQAbmSimple.FieldByName('ID_ANIMAL_EXTERNO').AsInteger = 0) then
     begin
         query := 'select A.APODO, A.ID_ANIMAL_EXTERNO, A.ID_HBA, A.sexo, C.NOMBRE as nomsex,'+
           ' A.ID_OTRO, A.ID_PC, A.ID_RA, A.ID_RP, A.ID_SENASA,A.NOMBRE as NOMBRE, A.NOMBRE as nombre_animal,'+
           ' A.raza, r.codigo as nomraz, A.ESTABLECIMIENTO, cast (A.ID_RP as varchar(12)) || ''E'' as KeyValue,'+
           ' A.CRIADOR, CP.NOMBRE as Nom_Prop, A.PROPIETARIO, A.FECHA_NACIMIENTO, A.ADN, A.TIPIFICACION_SANGUINEA, A.color as color, A.tipo_registro as tiporeg, A.Visible,  a.PN, a.PD, a.PA, a.PT, a.CE, a.FR' +
           ' from TAB_ANIMALES_EXTERNOS A,  COD_SEXOS C, COD_RAZAS R, COD_PROPIETARIO CP where ' +
           ' (A.sexo = C.id_sexo) and (R.ID_RAZA = A.RAZA)'+
           {' and A.Establecimiento = :ESTABLECIMIENTO }
           ' and A.id_animal_externo = :id_externo'+
           ' AND (CP.ID_PROPIETARIO =  A.PROPIETARIO)';
         IBQAbmSimple.SQL.Clear;
         IBQAbmSimple.SQL.Add(query);
         IBQAbmSimple.Close;
         //IBQAbmSimple.ParamByName('establecimiento').Value := FPrincipal.EstablecimientoActual;
         IBQAbmSimple.ParamByName('id_externo').Value := id_animal_ex;
         IBQAbmSimple.Open;

     end;


      JvIExpExcel.Visible := false;
      LExpExcel.Visible := false;
      IPreliminar.Visible := false;
      LPreliminar.Visible := false;
      IVerDatosAnimal.Visible := false;
      LVerDatosAnimal.Visible := false;

      IPedigree.Visible := true;
      LGenea.Visible := true;
      IDEps.Visible := true;
      LDeps.Visible := true;
      ICompraAnimal.Visible := true;
      LCompra.Visible := true;

      DMSoftvet.IBQRaza.Close;
      DMSoftvet.IBQRaza.SQL.Clear;
      DMSoftvet.IBQRaza.SQL.Add('select ID_RAZA, SINONIMO, NOMBRE, DIAS_GESTACION, CODIGO from COD_RAZAS order by nombre asc');
      DMSoftvet.IBQRaza.Open;

      SetLength(Genealogia,0);
      id_rp := DBEARPExternos.Text;
      id_pc := DBEAPCExternos.Text;
      id_ra := DBEARAExternos.Text;
      id_otro := DBEAOtroExternos.Text;
      id_hba := DBEAHBAExternos.Text;
      ID_Animal := BDBGAbm.DataSource.DataSet.FieldByName('ID_ANIMAL_EXTERNO').AsInteger;
      RazaAnimal := BDBGAbm.DataSource.DataSet.FieldByName('RAZA').AsInteger;
      id_senasa := DBEASenasaExternos.Text;

      if ((RazaAnimal = 29) or (RazaAnimal = 30)) then
      begin
        DBLCBColor.KeyValue := BDBGAbm.DataSource.DataSet.FieldByName('COLOR').AsInteger;
      end
      else
        DBLCBColor.KeyValue := -1;

      if BDBGAbm.DataSource.DataSet.FieldByName('tiporeg').Value <> null then
      begin
        DBLCBTipoRegistro.KeyValue := BDBGAbm.DataSource.DataSet.FieldByName('tiporeg').Value;
      end
      else
        DBLCBTipoRegistro.KeyValue := -1;

      if(StrLen(Pchar(id_senasa)) >= 1) then
      begin
          letra := id_senasa[1];
          if( (letra in ['A'..'Z'])) then
          begin
              RBCuigSenasa.Checked:=true;
              RBCuigSenasaClick(self);
              DBEASenasaExternos.Text:='';
              EAEncabezado.Text:=LeftStr(id_senasa,5);
              EAUltimoIdent.Text:=id_senasa[6]+id_senasa[7]+id_senasa[8]+id_senasa[9];
              EVerificador.Text:=RightStr(id_senasa,1);
          end
          else
          begin
           //   RBSenasaClick(self);
              RBSenasa.Checked:=true;
              DBEASenasaExternos.Enabled:=true;
              DBEASenasaExternos.Text:=id_senasa;
          end;
      end
      else
      begin
        if(StrLen(Pchar(id_senasa)) = 0) then
        begin
            RBCuigSenasa.Checked:=false;
            RBSenasa.Checked:=false;
            DBEASenasaExternos.Enabled:=false;
        end;
      end;
      TSDeps.TabVisible:= FPrincipal.FuncDEPs; //true;
      ADeps.Enabled:= FPrincipal.FuncDEPs; //True;
      //ADeps.Enabled:= False;//en testing

      vPrimerIngreso:= true;

      if (Guardado) then
      begin
        CargarDatosGeneralesDeps();
        CargarDeps();
      end;
      
      DTPAFechaNacimiento.Date:= DSAbmSimple.DataSet.FieldByName('FECHA_NACIMIENTO').AsDateTime;
      if DSAbmSimple.DataSet.FieldByName('ADN').Value<>null then
      begin
//          CBADN.Checked:=true;
          LADN.Enabled := true;
          EAADN.Text:=DSAbmSimple.DataSet.FieldByName('ADN').AsString;
      end
      else
      begin
//          CBADN.Checked:=false;
          //LADN.Enabled := false;
          EAADN.Text:='';
      end;

      if DSAbmSimple.DataSet.FieldByName('TIPIFICACION_SANGUINEA').Value<>null then
      begin
//          CBSanguinea.Checked:=true;
          LTipificacion.Enabled := true;
          EASanguinea.Text:=DSAbmSimple.DataSet.FieldByName('TIPIFICACION_SANGUINEA').AsString;
      end
      else
      begin
//          CBSanguinea.Checked:=false;
          //LTipificacion.Enabled := false;
          EASanguinea.Text:='';
      end;

      try
      if DSAbmSimple.DataSet.FieldByName('PN').Value<>null then
        EAPN.Text := FormatFloat('#0.##',DSAbmSimple.DataSet.FieldByName('PN').AsFloat)
      else
        EAPN.Text := '';

      if DSAbmSimple.DataSet.FieldByName('PD').Value<>null then
        EAPD.Text := FormatFloat('#0.##',DSAbmSimple.DataSet.FieldByName('PD').AsFloat)
      else
        EAPD.Text := '';
       except
       end;  

      if DSAbmSimple.DataSet.FieldByName('PT').Value<>null then
        EAPT.Text := FormatFloat('#0.##',DSAbmSimple.DataSet.FieldByName('PT').AsFloat)
      else
        EAPT.Text := '';

      if DSAbmSimple.DataSet.FieldByName('PA').Value<>null then
        EAPA.Text := FormatFloat('#0.##',DSAbmSimple.DataSet.FieldByName('PA').AsFloat)
      else
        EAPA.Text := '';

      if DSAbmSimple.DataSet.FieldByName('CE').Value<>null then
        EACE.Text := FormatFloat('#0.##',DSAbmSimple.DataSet.FieldByName('CE').AsFloat)
      else
        EACE.Text := '';

      if DSAbmSimple.DataSet.FieldByName('FR').Value<>null then
        EAFR.Text := FormatFloat('#0.##',DSAbmSimple.DataSet.FieldByName('FR').AsFloat)
      else
        EAFR.Text := '';


    try
        IBSPBorrarTablasAuxiliares.Close;
        IBSPBorrarTablasAuxiliares.ExecProc;
        FPrincipal.IBTPrincipal.CommitRetaining;
    except
        FPrincipal.IBTPrincipal.RollbackRetaining;
    end;

    try
        IBQCoopropiedad.Close;
        IBQCoopropiedad.ParamByName('id_animal').AsInteger:= id_animal;
        IBQCoopropiedad.Open;
        IBQCoopropiedad.First;
        while not IBQCoopropiedad.Eof do
        begin
            IBQInsertCoopropiedad.Close;
            IBQInsertCoopropiedad.ParamByName('idanimal').AsInteger:= id_animal;
            IBQInsertCoopropiedad.ParamByName('propietario').AsInteger:= IBQCoopropiedad.fieldbyname('id_propietario').AsInteger;
            IBQInsertCoopropiedad.ParamByName('nombre').AsString:= IBQCoopropiedad.fieldbyname('nombre').AsString;
            IBQInsertCoopropiedad.ParamByName('porcentaje').AsFloat:= IBQCoopropiedad.fieldbyname('porcentaje').AsFloat;
            IBQInsertCoopropiedad.Open;

            IBQCoopropiedad.Next;
        end;
        FPrincipal.IBTPrincipal.CommitRetaining;
    except
        FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;

  PCFichaAnimalExterno.Visible:= False;
  PEditar.Visible:= True;
  PEditar.Align:= alClient;

  
end;


procedure TFABMPadresExternos.RBSenasaClick(Sender: TObject);
begin
  inherited;
  DBEASenasaExternos.Visible:=true;
  EAEncabezado.Text:='';
  EAUltimoIdent.Text:='';
  EVerificador.Text:='';
  EAEncabezado.Visible:=false;
  EAUltimoIdent.Visible:=false;
  EVerificador.Visible:=false;
  DBEASenasaExternos.Enabled:=True;
//  DBEASenasaExternos.SetFocus;
  //DBEASenasaExternos.Text:='';
end;

procedure TFABMPadresExternos.RBCuigSenasaClick(Sender: TObject);
begin
  inherited;
  DBEASenasaExternos.Text:='';
  DBEASenasaExternos.Visible:=false;
  EAEncabezado.Visible:=true;
  EAUltimoIdent.Visible:=true;
  EVerificador.Visible:=true;

end;

procedure TFABMPadresExternos.DBEASenasaExternosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if(RBSenasa.Checked) then
  begin
    if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;

    if (key = #32) then
      key:= #0;
  end
  else
  begin
      //poner una mascara para el cuig
  end;
end;


procedure TFABMPadresExternos.DBEASenasaExternos1Exit(Sender: TObject);
var
  valor : integer;
begin
  inherited;
   if RBSenasa.Checked then
  begin
   if (DBEASenasaExternos.Text <> '') then
    begin
      if TryStrToInt(DBEASenasaExternos.Text,valor) then
      begin
        DBEASenasaExternos.Text := UFunctions.CompletarDigitosSenasa(DBEASenasaExternos.Text);
        if Trim(DBEARPExternos.Text) = '' then
          DBEARPExternos.Text := Trim(DBEASenasaExternos.Text);
        if Trim(DBEANombreExternos.Text) = '' then
          DBEANombreExternos.Text := Trim(DBEASenasaExternos.Text);
      end
      else
      begin
        MostrarMensaje(tmError,'El formato de '+FPrincipal.PaisNombreCaravana+' no es válido. Solo se permiten dígitos');
        DBEASenasaExternos.Text := '';
      end;
    end;
  end
  else if not UFunctions.CheckFormatoCUIG(DBEASenasaExternos.Text) then
       begin
        MostrarMensaje(tmError,'El formato del CUIG-SENASA no es Válido "AA000AAA0"');
        DBEASenasaExternos.Text := '';
       end;
end;

procedure TFABMPadresExternos.DBEASenasaExternosClick(Sender: TObject);
begin
  inherited;
    id_senasa := DBEASenasaExternos.Text;
    //DBEASenasaExternos.Text:='';
end;

procedure TFABMPadresExternos.AArbolGeneaExternosExecute(Sender: TObject);
var i : integer;
    F : TFArbolGeneaExterno;
begin
  inherited;
  try
    IBQDelAuxExt.Close;
    IBQDelAuxExt.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;

    DBEANombreExternos.OnChange(self);

    F := TFArbolGeneaExterno.Create(self,taExterno,Genealogia);
    F.RP := Trim(DBEARPExternos.Text);
    F.Nombre := Trim(DBEANombreExternos.Text);
    F.Animal := ID_Animal;
    F.HBA := Trim(DBEAHBAExternos.Text);
    F.ShowModal;

    for i := 0 to 14-1 do
    begin
      arrGenealogia[i].id_animal := 0;
      arrGenealogia[i].sexo := 0;
      arrGenealogia[i].nivel := '';
    end;

    for i := 0 to 14-1 do
    begin
      arrGenealogia[i].id_animal := F.arrGenealogia[i].id_animal;
      arrGenealogia[i].sexo := F.arrGenealogia[i].sexo;
      arrGenealogia[i].nivel := F.arrGenealogia[i].nivel;
    end;

    F.Destroy;
    {DMSoftvet.IBQSexoPorSexo.Close;
    DMSoftvet.IBQSexoPorSexo.ParamByName('sexo').AsInteger := sexoAbm;
    DMSoftvet.IBQSexoPorSexo.Open;}

    CargarSexoPorSexo();
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  
end;

procedure TFABMPadresExternos.HabilitarArbol(Sender : TObject);
begin
  //BArbol.Enabled := false;

  LGenea.Visible := false;
  IPedigree.Visible := false;

  {ITerminar.Visible := false;
  LTerminar.Visible := false;}

  if Trim(DBEARPExternos.Text) <> '' then
    if Trim(DBEAApodoExternos.Text) <> '' then
    begin

      LGenea.Visible := true and FPrincipal.FuncGenealogia;
      IPedigree.Visible := true and FPrincipal.FuncGenealogia;

      LDeps.Visible := true and FPrincipal.FuncDEPs;
      IDEps.Visible := true and FPrincipal.FuncDEPs;

     { ITerminar.Visible := true;
      LTerminar.Visible := true;
      ITerminar.Enabled := true;
      LTerminar.Enabled := true;}
    end;
end;

procedure TFABMPadresExternos.DBEARPExternosExit(Sender: TObject);
begin
  inherited;
  DBEARPExternos.Text := trim(DBEARPExternos.Text);
  if Trim(DBEANombreExternos.Text) = '' then
    DBEANombreExternos.Text := Trim(DBEARPExternos.Text);
end;

procedure TFABMPadresExternos.PasarAEditar;
begin
  inherited;

end;

procedure TFABMPadresExternos.cargarNuevos;
var i:integer;
begin
    for i:=0 to Length(anim)-1 do
      if anim[i].id=-1 then
      begin
      IBQAbmSimple.Insert;
      IBQGenId.Close;
      IBQGenId.Open;
      ID_Animal := IBQGenId.FieldValues['IDEXT'];
      IBQAbmSimple.FieldByName('id_animal_externo').AsInteger:=ID_Animal;
      {IBQAbmSimple.FieldByName('id_rp').AsString:=anim[i].rp;
      IBQAbmSimple.FieldByName('id_hba').AsString:=anim[i].hba;
      IBQAbmSimple.FieldByName('establecimiento').AsInteger:=fprincipal.EstablecimientoActual;
      IBQAbmSimple.FieldByName('nombre_animal').AsString:=anim[i].nombre;
      IBQAbmSimple.FieldByName('nomsex').AsString:=anim[i].sexo;
      IBQAbmSimple.FieldByName('nomraz').AsString:=dmsoftvet.IBQRaza.lookup('codigo',anim[i].ra,'sinonimo');
      IBQAbmSimple.FieldByName('keyvalue').AsString:=anim[i].rp+'E';
      IBQAbmSimple.FieldByName('sexo').AsInteger:=dmsoftvet.IBQSexo.lookup('nombre',anim[i].sexo,'id_sexo');
      IBQAbmSimple.FieldByName('raza').AsInteger:=dmsoftvet.IBQRaza.lookup('codigo',anim[i].ra,'id_raza');}
      IBQAbmSimple.Post;
      end;
end;

procedure TFABMPadresExternos.CargarDatosGeneralesDeps;
begin
  EAAnio.Text:= IntToStr(YearOf(Now()));
  UDAnio.Max:= YearOf(Now());
  IBQRegDep.Close;
  IBQRegDep.SQL.Clear;
  IBQRegDep.SQL.Add('select * from REP_REGISTRO_DEPS(:esta,:animal,:tipo_animal)');
  IBQRegDep.ParamByName('esta').AsInteger:= FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['id_animal_externo']);
  IBQRegDep.ParamByName('animal').AsInteger:= ID_Animal;
  IBQRegDep.ParamByName('tipo_animal').AsString:= 'E';
  IBQRegDep.Open;

  if (FPrincipal.Pais = 1) then // Argentina
    begin
      IBQPadres.Close;
      IBQPadres.SQL.Clear;
      IBQPadres.SQL.Add('select * from REP_PADRES(:esta,:animal,:tipo_animal)');
      IBQPadres.ParamByName('esta').AsInteger:= FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['id_animal_externo']);
      IBQPadres.ParamByName('animal').AsInteger:= id_animal;
      IBQPadres.ParamByName('tipo_animal').AsString:= 'E';
      IBQPadres.Open;

      LNombrePadreDep.Caption:= IBQPadres.fieldbyname('padre').AsString;
      LDepNombrePadreBraford.Caption:= IBQPadres.fieldbyname('padre').AsString;
      LDepNombrePadreBrangus.Caption:= IBQPadres.fieldbyname('padre').AsString;
      LDepNombrePadreHereford.Caption:= IBQPadres.fieldbyname('padre').AsString;
      LDepPadreAnimalShorthorn.Caption:= IBQPadres.fieldbyname('padre').AsString;

      LNombreMadreDep.Caption:= IBQPadres.fieldbyname('madre').AsString;
      LDepNombreMadreBraford.Caption:= IBQPadres.fieldbyname('madre').AsString;
      LDepNombreMadreBrangus.Caption:= IBQPadres.fieldbyname('madre').AsString;
      LDepMadreAnimalShorthorn.Caption:= IBQPadres.fieldbyname('madre').AsString;
      

//      PArgentina.Visible:= true;
//      PArgentina.Align:= alClient;
      PUruguay.Visible:= false;
      LNombreAnimalDEP.Caption:= '';
      LHBADEP.Caption:= '';
      LAnioNacDEP.Caption:= '';

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

      LNombreAnimalDEP.Caption:= DBEANombreExternos.Text;
      LHBADEP.Caption:= DBEAHBAExternos.Text;
      LAnioNacDEP.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));

      LNombreAnimalDEP.Caption:= DBEANombreExternos.Text;
      LDepNombreAnimalBraford.Caption := DBEANombreExternos.Text;
      LDepNombreAnimalBrangus.Caption := DBEANombreExternos.Text;
      LDEPNombreAnimalHereford.Caption := DBEANombreExternos.Text;
      LDepNombreAnimalBrahman.Caption := DBEANombreExternos.Text;
      LDepNombreAnimalShorthorn.Caption := DBEANombreExternos.Text;

      LHBADEP.Caption:= DBEAHBAExternos.Text;
      LDepHbaAnimalBraford.Caption := DBEAHBAExternos.Text;
      LDepHbaAnimalBrangus.Caption := DBEAHBAExternos.Text;
      LDEPHbaAnimalHereford.Caption := DBEAHBAExternos.Text;
      LDepHbaAnimalBrahman.Caption := DBEAHBAExternos.Text;
      LDepHbaAnimalShorthorn.Caption := DBEAHBAExternos.Text;

      if (IBQABMSimple.fieldByName('fecha_nacimiento').Value <> null) then
      begin
            LAnioNacDEP.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
            LDepNacAnimalBraford.Caption := IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
            LDepNacAnimalBrangus.Caption := IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
            LDEPFechaNacAnimalHereford.Caption := DateTimeToStr(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime);
            LDepNacAnimalBrahman.Caption := IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
            LDepAnioNacAnimalShorthorn.Caption := IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
      end;

      if (RazaAnimal = 11) then
      begin
           LDepApodoAnimalBraford.Caption := DBEAApodoExternos.Text;
           LDepAbaAnimalBraford.Caption := DBEAPCExternos.Text;
      end;


      if ((RazaAnimal = 29) or (RazaAnimal = 2) or (RazaAnimal = 3)) then
      begin
          PArgentina.Visible := true;
          //PArgentina.Align := alRight;
          PArgentina.Top := 1;
          PArgentina.Left := 56;
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
          //PFuenteDeps.Align := alBottom;
          PFuenteDeps.Top := 150;
          PFuenteDeps.Left := 59;
          PFuenteDeps.Visible := true;
      end
      else
        if ((RazaAnimal = 28) or (RazaAnimal = 12)) then
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
            //PArgentinaBrangus.Align := alRight;
            PArgentinaBrangus.Top := 1;
            PArgentinaBrangus.Left := 56;
            PArgentinaShorthorn.Visible := false;
            PArgentinaShorthorn.SendToBack;
            PUruguay.Visible:= false;
            PUruguay.SendToBack;
            //PFuenteDeps.Align := alBottom;
            PFuenteDeps.Visible := true;
            PFuenteDeps.Top := 150;
            PFuenteDeps.Left := 59;
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
              //PArgentinaBraford.Align := alRight;
              PArgentinaBraford.Top := 1;
              PArgentinaBraford.Left := 56;
              PArgentinaShorthorn.Visible := false;
              PArgentinaShorthorn.SendToBack;
              PUruguay.Visible:= false;
              PUruguay.SendToBack;
              PFuenteDeps.Visible := true;
              PFuenteDeps.Top := 150;
              PFuenteDeps.Left := 59;
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
                //PArgentinaHereford.Align := alRight;
                PArgentinaHereford.Top := 1;
                PArgentinaHereford.Left := 56;
                PArgentinaShorthorn.Visible := false;
                PArgentinaShorthorn.SendToBack;
                PUruguay.Visible:= false;
                PUruguay.SendToBack;
                PFuenteDeps.Visible := true;
                PFuenteDeps.Top := 150;
                PFuenteDeps.Left := 59;
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
                  //PArgentinaBrahman.Align := alRight;
                  PArgentinaBrahman.Top := 1;
                  PArgentinaBrahman.Left := 56;
                  PArgentinaShorthorn.Visible := false;
                  PArgentinaShorthorn.SendToBack;
                  PUruguay.Visible:= false;
                  PUruguay.SendToBack;
                  PFuenteDeps.Visible := true;
                  PFuenteDeps.Top := 150;
                  PFuenteDeps.Left := 59;
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
                    //PArgentinaShorthorn.Align := alRight;
                    PArgentinaShorthorn.Top := 1;
                    PArgentinaShorthorn.Left := 56;
                    PArgentinaShorthorn.Visible := true;
                    PUruguay.Visible:= false;
                    PUruguay.SendToBack;
                    PFuenteDeps.Visible := true;
                    PFuenteDeps.Top := 150;
                    PFuenteDeps.Left := 59;
                end
                else
                begin
                    PArgentina.Visible := true;
                    //PArgentina.Align := alRight;
                    PArgentina.Top := 1;
                    PArgentina.Left := 56;
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
                    PFuenteDeps.Visible := true;
                    PFuenteDeps.Top := 150;
                    PFuenteDeps.Left := 59;
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

          LHBUDEP.Caption:= Trim(DBEAHBAExternos.Text);
          LRPUruguay.Caption:= Trim(DBEARPExternos.Text);
          LNacimientoUruguay.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
          LNombreDepUruguay.Caption:= Trim(DBEANombreExternos.Text);
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

            LHBUDEP.Caption:= Trim(DBEAHBAExternos.Text);
            LRPUruguay.Caption:= Trim(DBEARPExternos.Text);
            LNacimientoUruguay.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
            LNombreDepUruguay.Caption:= Trim(DBEANombreExternos.Text);
         end
end;

procedure TFABMPadresExternos.CargarDeps;
begin

  ClearDeps();

  IBQAnioParaDep.Close;

  IBQAnioParaDep.ParamByName('id_animal').AsInteger := id_animal;
  IBQAnioParaDep.ParamByName('establecimiento').AsInteger := FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['ID_ANIMAL_EXTERNO']);//FPrincipal.EstablecimientoActual;

  IBQAnioParaDep.Open;

  if ((IBQAnioParaDep.FieldByName('ultimoanio').AsInteger <> 0) and (vPrimerIngreso)) then
  begin
    EAAnio.Text := IntToStr(IBQAnioParaDep.FieldByName('ultimoanio').AsInteger);
    vPrimerIngreso := false;
  end;

  LAnio.Caption := EAAnio.Text;
  LAnioUruguay.Caption := EAAnio.Text;
  IBQDEPS.Close;
  IBQDEPS.ParamByName('anio').AsInteger:= StrToInt(EAAnio.Text);
  IBQDEPS.ParamByName('animal').AsInteger:= id_animal;
  IBQDEPS.ParamByName('establecimiento').AsInteger:= FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['ID_ANIMAL_EXTERNO']);//FPrincipal.EstablecimientoActual;
  IBQDEPS.Open;

  if not(IBQDEPS.Eof) then
    begin
      BBModificarDep.Caption:= Traducir('Modificar Valores');
      //HabilitarCompDeps(true);
      insertar:= 0;
      id_dep := IBQDEPS.FieldValues['id_dep'];
      if (FPrincipal.Pais = 1) then  //argentina
        begin
{          if IBQDEPS.fieldByName('gestdep').Value<>null then EADEPGest.Text:= formatfloat('+0.0;-0.0',IBQDEPS.fieldByName('gestdep').AsFloat);//PasarFloatADep(IBQDEPS.fieldByName('gestdep').AsFloat);
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

          if IBQDEPS.fieldByName('gestprec').Value<>null then EAPrecGest.Text:= formatfloat('0.00',IBQDEPS.fieldByName('gestprec').AsFloat);
          if IBQDEPS.fieldByName('nacerprec').Value<>null then EAPrecNacer.Text:= formatfloat('0.00',IBQDEPS.fieldByName('nacerprec').AsFloat);
          if IBQDEPS.fieldByName('destprec').Value<>null then EAPrecDest.Text:= formatfloat('0.00',IBQDEPS.fieldByName('destprec').AsFloat);
          if IBQDEPS.fieldByName('lecheprec').Value<>null then EAPrecLeche.Text:= formatfloat('0.00',IBQDEPS.fieldByName('lecheprec').AsFloat);
          if IBQDEPS.fieldByName('finalprec').Value<>null then EAPrecFinal.Text:= formatfloat('0.00',IBQDEPS.fieldByName('finalprec').AsFloat);
          if IBQDEPS.fieldByName('ceprec').Value<>null then EAPrecCE.Text:= formatfloat('0.00',IBQDEPS.fieldByName('ceprec').AsFloat);
          if IBQDEPS.fieldByName('alturaprec').Value<>null then EAPrecAltura.Text:= formatfloat('0.00',IBQDEPS.fieldByName('alturaprec').AsFloat);
          if IBQDEPS.fieldByName('egdprec').Value<>null then EAPrecEGD.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egdprec').AsFloat);
          if IBQDEPS.fieldByName('egcprec').Value<>null then EAPrecEGC.Text:= formatfloat('0.00',IBQDEPS.fieldByName('egcprec').AsFloat);
          if IBQDEPS.fieldByName('aobprec').Value<>null then EAPrecAOB.Text:= formatfloat('0.00',IBQDEPS.fieldByName('aobprec').AsFloat);
          if IBQDEPS.fieldByName('porgiprec').Value<>null then EAPrecPorcGI.Text:= formatfloat('0.00',IBQDEPS.fieldByName('porgiprec').AsFloat);
          if IBQDEPS.fieldByName('porcmprec').Value<>null then EAPrecPorcCM.Text:= formatfloat('0.00',IBQDEPS.fieldByName('porcmprec').AsFloat);

          EACrias.Text:= IBQDEPS.fieldByName('crias').AsString;
          EARodeo.Text:= IBQDEPS.fieldByName('rodeo').AsString;
        end   }
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
            if IBQDEPS.fieldByName('nacerdep').Value<>null then EADEPPN.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('nacerdep').AsFloat);
            if IBQDEPS.fieldByName('destdep').Value<>null then EADEPPD.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('destdep').AsFloat);
            if IBQDEPS.fieldByName('lechedep').Value<>null then EADEPHL.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('lechedep').AsFloat);
            if IBQDEPS.fieldByName('p18dep').Value<>null then EADEPP18.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('p18dep').AsFloat);
            if IBQDEPS.fieldByName('cedep').Value<>null then EADEPCEUru.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('cedep').AsFloat);
            if IBQDEPS.fieldByName('egcdep').Value<>null then EADEPEGCUru.Text:= formatfloat('0.000;-0.00',IBQDEPS.fieldByName('egcdep').AsFloat);
            if IBQDEPS.fieldByName('aobdep').Value<>null then EADEPAOBUru.Text:= formatfloat('0.000;-0.00',IBQDEPS.fieldByName('aobdep').AsFloat);

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
              if IBQDEPS.fieldByName('nacerdep').Value<>null then EADEPPN.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('nacerdep').AsFloat);
              if IBQDEPS.fieldByName('destdep').Value<>null then EADEPPD.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('destdep').AsFloat);
              if IBQDEPS.fieldByName('lechedep').Value<>null then EADEPHL.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('lechedep').AsFloat);
              if IBQDEPS.fieldByName('p18dep').Value<>null then EADEPP18.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('p18dep').AsFloat);
              if IBQDEPS.fieldByName('cedep').Value<>null then EADEPCEUru.Text:= formatfloat('0.00;-0.00',IBQDEPS.fieldByName('cedep').AsFloat);
              if IBQDEPS.fieldByName('egcdep').Value<>null then EADEPEGCUru.Text:= formatfloat('0.000;-0.00',IBQDEPS.fieldByName('egcdep').AsFloat);
              if IBQDEPS.fieldByName('aobdep').Value<>null then EADEPAOBUru.Text:= formatfloat('0.000;-0.00',IBQDEPS.fieldByName('aobdep').AsFloat);

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
         //HabilitarCompDeps(false);
         insertar:= 1;
         BBModificarDep.Caption:= Traducir('Insertar Valores');
         id_dep := -1
      end;
  HabilitarFuentesDEPs();
end;

procedure TFABMPadresExternos.ClearDeps;
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

procedure TFABMPadresExternos.EACriasExit(Sender: TObject);
var auxvalor : Integer;
begin
  inherited;
  if (trim((TEditAuto(Sender).Text)) <> '') then
    if not(TryStrToInt(TEditAuto(Sender).Text,auxvalor)) then
      begin
       MostrarMensaje(tmError, 'Valor Inválido.');
       TEditAuto(Sender).SetFocus;
       TEditAuto(Sender).SelectAll;
      end
end;

procedure TFABMPadresExternos.EACriasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 4)) and (key <> #8)) then key:=#0;
end;

procedure TFABMPadresExternos.EADEPGestExit(Sender: TObject);
var valor:String;
begin
  inherited;
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

procedure TFABMPadresExternos.EADEPGestKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9','+','-',',',' ','.'])) or (Length(TEditAuto(Sender).Text) >= 6)) and (key <> #8)) then key:=#0;

  if (key = '.') then
    key:= ',';  
end;

procedure TFABMPadresExternos.EAPrecGestExit(Sender: TObject);
var valor : String;
begin
  inherited;
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
     end
end;

procedure TFABMPadresExternos.EAPrecGestKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9',',','.'])) or (Length(TEditAuto(Sender).Text) >= 4)) and (key <> #8)) then key:=#0;

  if (key = '.') then
    key:= ',';  
end;
              
procedure TFABMPadresExternos.EANhijKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 6)) and (key <> #8)) then key:=#0;
end;

procedure TFABMPadresExternos.HabilitarCompDeps(estado: boolean);
begin
      //BBModificarDep.Enabled:= estado;
      if (FPrincipal.Pais = 1) then // Argentina
        begin
{          EADEPGest.Enabled:= estado;
          EADEPNacer.Enabled:= estado;
          EADEPNacer.Enabled:= estado;
          EADEPDest.Enabled:= estado;
          EADEPLeche.Enabled:= estado;
          EADEPFinal.Enabled:= estado;
          EADEPCE.Enabled:= estado;
          EADEPAltura.Enabled:= estado;
          EADEPEGD.Enabled:= estado;
          EADEPEGC.Enabled:= estado;
          EADEPAOB.Enabled:= estado;
          EADEPPorcGI.Enabled:= estado;
          EADEPPorcCM.Enabled:= estado;
          EAPrecGest.Enabled:= estado;
          EAPrecNacer.Enabled:= estado;
          EAPrecDest.Enabled:= estado;
          EAPrecLeche.Enabled:= estado;
          EAPrecFinal.Enabled:= estado;
          EAPrecCE.Enabled:= estado;
          EAPrecAltura.Enabled:= estado;
          EAPrecEGD.Enabled:= estado;
          EAPrecEGC.Enabled:= estado;
          EAPrecAOB.Enabled:= estado;
          EAPrecPorcGI.Enabled:= estado;
          EAPrecPorcCM.Enabled:= estado;
          EACrias.Enabled:= estado;
          EARodeo.Enabled:= estado;
          if (estado) then
            begin
              EACrias.SetFocus;
              EACrias.SelectAll;
            end;
         end  }
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

              if ((RazaAnimal = 12) or (RazaAnimal = 28)) then
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
            EADEPPN.Enabled:= estado;
            EADEPPD.Enabled:= estado;
            EADEPHL.Enabled:= estado;
            EADEPP18.Enabled:= estado;
            EADEPCEUru.Enabled:= estado;
            EADEPEGCUru.Enabled:= estado;
            EADEPAOBUru.Enabled:= estado;

            EAPrecPN.Enabled:= estado;
            EAPrecPD.Enabled:= estado;
            EAPrecHL.Enabled:= estado;
            EAPrecP18.Enabled:= estado;
            EAPrecCEUru.Enabled:= estado;
            EAPrecEGCUru.Enabled:= estado;
            EAPrecAOBUru.Enabled:= estado;

            EACriador.Enabled:= estado;
            EACodigoProp.Enabled:= estado;
            EANhij.Enabled:= estado;
            EANhijM.Enabled:= estado;
            EANhijU.Enabled:= estado;
            {if (estado) then
              begin
                EACriador.SetFocus;
                EACriador.SelectAll;
              end; }
         end
        else
            begin
              EADEPPN.Enabled:= estado;
              EADEPPD.Enabled:= estado;
              EADEPHL.Enabled:= estado;
              EADEPP18.Enabled:= estado;
              EADEPCEUru.Enabled:= estado;
              EADEPEGCUru.Enabled:= estado;
              EADEPAOBUru.Enabled:= estado;

              EAPrecPN.Enabled:= estado;
              EAPrecPD.Enabled:= estado;
              EAPrecHL.Enabled:= estado;
              EAPrecP18.Enabled:= estado;
              EAPrecCEUru.Enabled:= estado;
              EAPrecEGCUru.Enabled:= estado;
              EAPrecAOBUru.Enabled:= estado;

              EACriador.Enabled:= estado;
              EACodigoProp.Enabled:= estado;
              EANhij.Enabled:= estado;
              EANhijM.Enabled:= estado;
              EANhijU.Enabled:= estado;
              {if (estado) then
                begin
                  EACriador.SetFocus;
                  EACriador.SelectAll;
                end;}
           end;
end;

function TFABMPadresExternos.PasarFloatADep(valor: Double): String;
var aux, decimales: String;
    i: Integer;
begin
  aux:= '';
  if (valor >= 0) then
    aux:= '+';

//  if (valor = 0) then
//    result:= ''
//   else
     decimales:= '';
     if (IsInteger(FloatToStr(valor))) then
       decimales:= ',0';
     result:= aux + FloatToStr(valor) + decimales;
end;

function TFABMPadresExternos.CheckFormatoDep(var Valor: String): Boolean;
var auxvalor: double;
    i: Integer;
    campo, decimales: String;

begin
  result:= false;

  if (Valor <> '') then
    begin
      if (((Valor[1] = '+') or (Valor[1] = '-'))) {and (Valor[2] = ' '))} then
        begin
          campo:= '';
          for i:= 2 to  Length(Valor) do
             campo:= campo + Valor[i];

          if (TryStrToFloat(campo,auxvalor)) then
            begin
              result:= true;
              decimales:= '';
              if (IsInteger(FloatToStr(auxvalor))) then
                decimales:= ',0';
              Valor:= Valor[1] {+ Valor[2]} + FloatToStr(auxvalor) + decimales;
            end;
        end
    end
   else
     result:= true;
end;

function TFABMPadresExternos.CheckFormatoPrec(var Valor: String): Boolean;
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

procedure TFABMPadresExternos.HabilitarBotones(valor: boolean);
var ind: Integer;
begin
    DBLCBAFuenteDeps.Enabled := not valor;
    DBLCBAFuenteDeps.KeyValue:= IBQFuenteDeps.FieldByName('id_fuente_deps').AsInteger;

    BBGuardarDep.Visible:= not valor;
    BBCancelarDep.Visible:= not valor;
    EAAnio.Enabled:= valor;
    UDAnio.Enabled:= valor;
    for ind := 0 to ComponentCount -1 do
      if (Components[ind] is TBitBtn) then
         if ((TBitBtn(Components[ind]).Name <> 'BBGuardarDep') and
             (TBitBtn(Components[ind]).Name <> 'BBCancelarDep')) then
            TBitBtn(Components[ind]).Enabled := valor;
    LFuente.Enabled := not valor;
end;

procedure TFABMPadresExternos.BBModificarDepClick(Sender: TObject);
begin
  inherited;
  HabilitarBotones(false);
  HabilitarCompDeps(false);
end;

procedure TFABMPadresExternos.InsertarModificarDeps;
begin
{     try
      if (FPrincipal.Pais = 1) then // Argentina
        begin
            IBQSPImportarDeps.ParamByName('ANIO').AsInteger:= StrToInt(EAAnio.Text);
            IBQSPImportarDeps.ParamByName('ANIMAL').AsInteger:= id_animal;
            IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstablecimientoActual;

            if (Trim(EACrias.Text) <> '') then
              IBQSPImportarDeps.ParamByName('CRIAS').AsInteger:= EACrias.GetDato
             else
               IBQSPImportarDeps.ParamByName('CRIAS').Value:= null;

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
        end  }
     try
      if (FPrincipal.Pais = 1) then // Argentina
      begin
        IBQSPImportarDeps.ParamByName('ANIO').AsInteger:= StrToInt(EAAnio.Text);
        IBQSPImportarDeps.ParamByName('ANIMAL').AsInteger:= id_animal;
        IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['id_animal_externo']);

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
            if ((RazaAnimal = 12) or (RazaAnimal = 28)) then //Para Brangus
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
              IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['id_animal_externo']);

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
                IBQSPImportarDeps.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['id_animal_externo']);

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

       IBQSPImportarDeps.ParamByName('TIPO_ANIMAL').AsString:= 'E';
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

function TFABMPadresExternos.PasarDepAFloat(DEP: String): Double;
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

procedure TFABMPadresExternos.BBGuardarDepClick(Sender: TObject);
begin
  inherited;

  if (Guardado) then
  begin
      InsertarModificarDeps();
      InsertarFuentesDEPs();
      HabilitarBotones(true);
      CargarDeps();
      HabilitarCompDeps(true);
      CargarDatosGeneralesDeps();
  end
  else
  begin
       HabilitarBotones(true);
       GuardarTemporalmenteDeps;
       HabilitarCompDeps(true); 
  end;

end;

procedure TFABMPadresExternos.BBCancelarDepClick(Sender: TObject);
begin
  inherited;
  
  HabilitarBotones(true);
  CargarDeps();
  HabilitarCompDeps(true);

end;

procedure TFABMPadresExternos.EAAnioChange(Sender: TObject);
begin
  inherited;
  CargarDeps();
end;

procedure TFABMPadresExternos.ADepsExecute(Sender: TObject);
begin
  inherited;
  PCFichaAnimalExterno.Visible:= True;
  PEditar.Visible:= false;
  PNavegar.Visible := false;
  PCFichaAnimalExterno.Align:= alClient;

  HabilitarCompDeps(true);

  LAnio.Caption := EAAnio.Text;

 // if not(Guardado) then
// begin
    if (FPrincipal.Pais = 1) then // Argentina
    begin

      PUruguay.Visible:= false;
      LNombreAnimalDEP.Caption:= '';
      LHBADEP.Caption:= '';
      LAnioNacDEP.Caption:= '';

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

      LNombreAnimalDEP.Caption:= DBEANombreExternos.Text;
      LHBADEP.Caption:= DBEAHBAExternos.Text;
      LAnioNacDEP.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));

      LNombreAnimalDEP.Caption:= DBEANombreExternos.Text;
      LDepNombreAnimalBraford.Caption := DBEANombreExternos.Text;
      LDepNombreAnimalBrangus.Caption := DBEANombreExternos.Text;
      LDEPNombreAnimalHereford.Caption := DBEANombreExternos.Text;
      LDepNombreAnimalBrahman.Caption := DBEANombreExternos.Text;
      LDepNombreAnimalShorthorn.Caption := DBEANombreExternos.Text;

      LHBADEP.Caption:= DBEAHBAExternos.Text;
      LDepHbaAnimalBraford.Caption := DBEAHBAExternos.Text;
      LDepHbaAnimalBrangus.Caption := DBEAHBAExternos.Text;
      LDEPHbaAnimalHereford.Caption := DBEAHBAExternos.Text;
      LDepHbaAnimalBrahman.Caption := DBEAHBAExternos.Text;
      LDepHbaAnimalShorthorn.Caption := DBEAHBAExternos.Text;

      if (IBQABMSimple.fieldByName('fecha_nacimiento').Value <> null) then
      begin
            LAnioNacDEP.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
            LDepNacAnimalBraford.Caption := IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
            LDepNacAnimalBrangus.Caption := IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
            LDEPFechaNacAnimalHereford.Caption := DateTimeToStr(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime);
            LDepNacAnimalBrahman.Caption := IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
            LDepAnioNacAnimalShorthorn.Caption := IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
      end;

      if (RazaAnimal = 11) then
      begin
           LDepApodoAnimalBraford.Caption := DBEAApodoExternos.Text;
           LDepAbaAnimalBraford.Caption := DBEAPCExternos.Text;
      end;


      if ((RazaAnimal = 29) or (RazaAnimal = 2) or (RazaAnimal = 3)) then
      begin
          PArgentina.Visible := true;
          //PArgentina.Align := alRight;
          PArgentina.Top := 1;
          PArgentina.Left := 56;
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
          //PFuenteDeps.Align := alBottom;
          PFuenteDeps.Top := 150;
          PFuenteDeps.Left := 59;
          PFuenteDeps.Visible := true;
      end
      else
        if ((RazaAnimal = 28) or (RazaAnimal = 12)) then
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
            //PArgentinaBrangus.Align := alRight;
            PArgentinaBrangus.Top := 1;
            PArgentinaBrangus.Left := 56;
            PArgentinaShorthorn.Visible := false;
            PArgentinaShorthorn.SendToBack;
            PUruguay.Visible:= false;
            PUruguay.SendToBack;
            //PFuenteDeps.Align := alBottom;
            PFuenteDeps.Visible := true;
            PFuenteDeps.Top := 150;
            PFuenteDeps.Left := 59;
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
              //PArgentinaBraford.Align := alRight;
              PArgentinaBraford.Top := 1;
              PArgentinaBraford.Left := 56;
              PArgentinaShorthorn.Visible := false;
              PArgentinaShorthorn.SendToBack;
              PUruguay.Visible:= false;
              PUruguay.SendToBack;
              PFuenteDeps.Visible := true;
              PFuenteDeps.Top := 150;
              PFuenteDeps.Left := 59;
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
                //PArgentinaHereford.Align := alRight;
                PArgentinaHereford.Top := 1;
                PArgentinaHereford.Left := 56;
                PArgentinaShorthorn.Visible := false;
                PArgentinaShorthorn.SendToBack;
                PUruguay.Visible:= false;
                PUruguay.SendToBack;
                PFuenteDeps.Visible := true;
                PFuenteDeps.Top := 150;
                PFuenteDeps.Left := 59;
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
                  //PArgentinaBrahman.Align := alRight;
                  PArgentinaBrahman.Top := 1;
                  PArgentinaBrahman.Left := 56;
                  PArgentinaShorthorn.Visible := false;
                  PArgentinaShorthorn.SendToBack;
                  PUruguay.Visible:= false;
                  PUruguay.SendToBack;
                  PFuenteDeps.Visible := true;
                  PFuenteDeps.Top := 150;
                  PFuenteDeps.Left := 59;
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
                    //PArgentinaShorthorn.Align := alRight;
                    PArgentinaShorthorn.Top := 1;
                    PArgentinaShorthorn.Left := 56;
                    PArgentinaShorthorn.Visible := true;
                    PUruguay.Visible:= false;
                    PUruguay.SendToBack;
                    PFuenteDeps.Visible := true;
                    PFuenteDeps.Top := 150;
                    PFuenteDeps.Left := 59;
                end
                else
                begin
                    PArgentina.Visible := true;
                    //PArgentina.Align := alRight;
                    PArgentina.Top := 1;
                    PArgentina.Left := 56;
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
                    PFuenteDeps.Visible := true;
                    PFuenteDeps.Top := 150;
                    PFuenteDeps.Left := 59;
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

          LHBUDEP.Caption:= Trim(DBEAHBAExternos.Text);
          LRPUruguay.Caption:= Trim(DBEARPExternos.Text);
          LNacimientoUruguay.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
          LNombreDepUruguay.Caption:= Trim(DBEANombreExternos.Text);
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

            LHBUDEP.Caption:= Trim(DBEAHBAExternos.Text);
            LRPUruguay.Caption:= Trim(DBEARPExternos.Text);
            LNacimientoUruguay.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
            LNombreDepUruguay.Caption:= Trim(DBEANombreExternos.Text);
      end;


 // end;
end;

procedure TFABMPadresExternos.BBVolverFichaClick(Sender: TObject);
begin
  inherited;
  PCFichaAnimalExterno.Visible:= False;
  PEditar.Visible:= True;
  PEditar.Align:= alClient;
  //PCFichaAnimalExterno.Align:= alBottom;
end;

procedure TFABMPadresExternos.BBImprimirDepsClick(Sender: TObject);
begin
  inherited;
  IBQRegDep.Close;
  IBQRegDep.SQL.Clear;
  IBQRegDep.SQL.Add('select first 3 * from REP_REGISTRO_DEPS(:esta,:animal,:tipo_animal)');
  IBQRegDep.ParamByName('esta').AsInteger:= FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['id_animal_externo']);
  IBQRegDep.ParamByName('animal').AsInteger:= id_animal;
  IBQRegDep.ParamByName('tipo_animal').AsString:= 'E';
  IBQRegDep.Open;

  if not(IBQRegDep.IsEmpty) then
    begin
      Application.CreateForm(TFRepRegHistoricoDEPSPreview, FRepRegHistoricoDEPSPreview);
      FRepRegHistoricoDEPSPreview.SetearDataSet(IBQRegDep);
      if (FPrincipal.Pais = 1) then // Argentina
        begin
          FRepRegHistoricoDEPSPreview.QRLNombre.Caption:= DBEANombreExternos.Text;
          FRepRegHistoricoDEPSPreview.QRLHBA.Caption:= DBEAHBAExternos.Text;
          FRepRegHistoricoDEPSPreview.QRLAnio.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime));
        end
      else
        if (FPrincipal.Pais = 2) then // Uruguay
          begin
            FRepRegHistoricoDEPSPreview.QRLRPUru.Caption:= Trim(DBEARPExternos.Text);
            FRepRegHistoricoDEPSPreview.QRLNombreUru.Caption:= Trim(DBEANombreExternos.Text);
            FRepRegHistoricoDEPSPreview.QRLHBU.Caption:= Trim(DBEAHBAExternos.Text);
            FRepRegHistoricoDEPSPreview.QRLNacUru.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime))
          end
        else
            begin
              FRepRegHistoricoDEPSPreview.QRLRPUru.Caption:= Trim(DBEARPExternos.Text);
              FRepRegHistoricoDEPSPreview.QRLNombreUru.Caption:= Trim(DBEANombreExternos.Text);
              FRepRegHistoricoDEPSPreview.QRLHBU.Caption:= Trim(DBEAHBAExternos.Text);
              FRepRegHistoricoDEPSPreview.QRLNacUru.Caption:= IntToStr(YearOf(IBQABMSimple.fieldByName('fecha_nacimiento').AsDateTime))
            end;


      FRepRegHistoricoDEPSPreview.QRRegHistoDeps.PreviewModal;
    end
   else
      MostrarMensaje(tmAdvertencia, 'Este animal no tiene cargado DEPs.');
end;

procedure TFABMPadresExternos.CargarSexoPorSexo;
var query: String;
begin
  if Owner is TFRepFichaAnimal then
    sexoabm:=-1;

  query:= ' select TIPO AS SEXO, ID_SEXO, NOMBRE, SINONIMO from  COD_SEXOS where tipo = :sexo';

  if (sexoabm = -1) then
    query:= ' select TIPO AS SEXO, ID_SEXO, NOMBRE, SINONIMO from  COD_SEXOS';

  DMSoftvet.IBQSexoPorSexo.SQL.Clear;
  DMSoftvet.IBQSexoPorSexo.SQL.Add(query);
  DMSoftvet.IBQSexoPorSexo.Close;
  if (sexoabm <> -1) then
    DMSoftvet.IBQSexoPorSexo.ParamByName('sexo').Value := sexoabm;
  DMSoftvet.IBQSexoPorSexo.Open;
  DMSoftvet.IBQSexoPorSexo.First;
end;

procedure TFABMPadresExternos.Label2Click(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AbrirFormNormal(TFABMPropietarioAnimal.Create(self));
    DMSoftvet.IBQCodPropietario.Close;
    DMSoftvet.IBQCodPropietario.Open;
    if nroID>-1 then
    begin
      DBLCBAPropietario.KeyValue:=nroID;
      nroID:=-1;
    end;
  end;
end;

procedure TFABMPadresExternos.Label2MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= $00606C02;
    (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFABMPadresExternos.Label2MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= clWindowText;
    (Sender as TLabel).Font.Style:= [fsUnderline];
  end;
end;

procedure TFABMPadresExternos.DBEANOMBRECRIADORChange(Sender: TObject);
begin
  inherited;
  DBEANOMBRECRIADOR.Text:=trim(DBEANOMBRECRIADOR.Text);
end;

procedure TFABMPadresExternos.DBEARAExternosChange(Sender: TObject);
begin
  inherited;
  DBEARAExternos.Text:=trim(DBEARAExternos.Text);
end;

procedure TFABMPadresExternos.DBEAOtroExternosExit(Sender: TObject);
begin
  inherited;
  DBEAOtroExternos.Text:=trim(DBEAOtroExternos.Text);
end;

procedure TFABMPadresExternos.DBEAPCExternosExit(Sender: TObject);
begin
  inherited;
  DBEAPCExternos.Text:=trim(DBEAPCExternos.Text);
end;

procedure TFABMPadresExternos.DBEAApodoExternosChange(Sender: TObject);
begin
  inherited;
  DBEAApodoExternos.Text:=trim(DBEAApodoExternos.Text);
end;

procedure TFABMPadresExternos.DBEAHBAExternosChange(Sender: TObject);
begin
  inherited;
  DBEAHBAExternos.Text:=trim(DBEAHBAExternos.Text);
end;

procedure TFABMPadresExternos.DBEANombreExternosExit(Sender: TObject);
begin
  inherited;
  DBEANombreExternos.Text:=trim(DBEANombreExternos.Text);
end;

procedure TFABMPadresExternos.DBEAApodoExternosExit(Sender: TObject);
begin
  inherited;
  DBEAApodoExternos.Text:=trim(DBEAApodoExternos.Text);
end;

procedure TFABMPadresExternos.DBEANOMBRECRIADORExit(Sender: TObject);
begin
  inherited;
  DBEANOMBRECRIADOR.Text:=trim(DBEANOMBRECRIADOR.Text);
end;

procedure TFABMPadresExternos.DBEAHBAExternosExit(Sender: TObject);
begin
  inherited;
  DBEAHBAExternos.Text:=trim(DBEAHBAExternos.Text);
end;

procedure TFABMPadresExternos.DBEARAExternosExit(Sender: TObject);
begin
  inherited;
  DBEARAExternos.Text:=trim(DBEARAExternos.Text);
end;

procedure TFABMPadresExternos.CBADNClick(Sender: TObject);
begin
  inherited;
{  EAADN.Clear;
  EAADN.Enabled := CBADN.Checked;
  if (CBADN.Checked) then
    EAADN.SetFocus;}
end;

procedure TFABMPadresExternos.CBSanguineaClick(Sender: TObject);
begin
  inherited;
{  EASanguinea.Clear;
  EASanguinea.Enabled := CBSanguinea.Checked;
  if (CBSanguinea.Checked) then
    EASanguinea.SetFocus; }
end;

procedure TFABMPadresExternos.CambioGUIG(Sender : TObject);
begin
  if (EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____') then
    if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
      if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
        begin
          EVerificador.Text := IntToStr(UFunctions.DigitoVerificadorCaravana(EAEncabezado.Text+EAUltimoIdent.Text));
          DBEASenasaExternos.Text := EAEncabezado.Text+EAUltimoIdent.Text;
          //HandlerOnExitSenasa(self);
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

procedure TFABMPadresExternos.EAEncabezadoKeyPress(Sender: TObject;
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

procedure TFABMPadresExternos.EAUltimoIdentKeyPress(Sender: TObject;
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

procedure TFABMPadresExternos.EVerificadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  {if (Key = #13) then
    if (EAIdPC.Enabled) then
      begin
         EAIdPC.SetFocus;
         EAIdPC.SelectAll;
         key:= #0;
      end;}
end;

procedure TFABMPadresExternos.EACriasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EARodeo.SetFocus;
      EARodeo.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EARodeoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPGest.SetFocus;
      EADEPGest.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPGestKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecGest.SetFocus;
      EAPrecGest.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecGestKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPNacer.SetFocus;
      EADEPNacer.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPNacerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecNacer.SetFocus;
      EAPrecNacer.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecNacerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPDest.SetFocus;
      EADEPDest.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPDestKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecDest.SetFocus;
      EAPrecDest.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecDestKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPLeche.SetFocus;
      EADEPLeche.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPLecheKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecLeche.SetFocus;
      EAPrecLeche.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecLecheKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPFinal.SetFocus;
      EADEPFinal.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPFinalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecFinal.SetFocus;
      EAPrecFinal.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPCEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecCE.SetFocus;
      EAPrecCE.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecCEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPAltura.SetFocus;
      EADEPAltura.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPAlturaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecAltura.SetFocus;
      EAPrecAltura.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecAlturaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPEGD.SetFocus;
      EADEPEGD.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPEGDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecEGD.SetFocus;
      EAPrecEGD.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecEGDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPEGC.SetFocus;
      EADEPEGC.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPEGCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecEGC.SetFocus;
      EAPrecEGC.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecFinalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPCe.SetFocus;
      EADEPCe.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecEGCKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPAOB.SetFocus;
      EADEPAOB.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPAOBKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecAOB.SetFocus;
      EAPrecAOB.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecAOBKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPPorcGI.SetFocus;
      EADEPPorcGI.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPPorcGIKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecPorcGI.SetFocus;
      EAPrecPorcGI.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecPorcGIKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPPorcCM.SetFocus;
      EADEPPorcCM.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPPorcCMKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecPorcCM.SetFocus;
      EAPrecPorcCM.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EACriadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EACodigoProp.SetFocus;
      EACodigoProp.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EACodigoPropKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EANhij.SetFocus;
      EANhij.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EANhijKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EANhijM.SetFocus;
      EANhijM.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EANhijMKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EANhijU.SetFocus;
      EANhijU.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EANhijUKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPPN.SetFocus;
      EADEPPN.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPPNKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecPN.SetFocus;
      EAPrecPN.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecPNKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPPD.SetFocus;
      EADEPPD.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPPDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecPD.SetFocus;
      EAPrecPD.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecPDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPHL.SetFocus;
      EADEPHL.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPHLKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecHL.SetFocus;
      EAPrecHL.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecHLKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPP18.SetFocus;
      EADEPP18.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecP18KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPCEUru.SetFocus;
      EADEPCEUru.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPCEUruKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecCEUru.SetFocus;
      EAPrecCEUru.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecCEUruKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPAOBUru.SetFocus;
      EADEPAOBUru.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPAOBUruKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecAOBUru.SetFocus;
      EAPrecAOBUru.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EAPrecAOBUruKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EADEPEGCUru.SetFocus;
      EADEPEGCUru.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPEGCUruKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecEGCUru.SetFocus;
      EAPrecEGCUru.SelectAll;
    end;
end;

procedure TFABMPadresExternos.EADEPP18KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Char(Key) = #13) then
    begin
      EAPrecP18.SetFocus;
      EAPrecP18.SelectAll;
    end;
end;

procedure TFABMPadresExternos.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    if IBQAbmSimple.FieldValues['ID_ANIMAL_EXTERNO'] <> null then
      desdeEvento:=IBQAbmSimple.FieldValues['ID_ANIMAL_EXTERNO']
    else
      desdeEvento := 0;
end;

procedure TFABMPadresExternos.HabilitarComponentesVersionBasica;
begin
  inherited;
//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
  begin
      //BDeps.Visible:= false
      LDeps.Visible := false;
      IDEps.Visible := false;
  end
  else
//  {$ELSE}
  begin
      //BDeps.Visible:= true;
      LDeps.Visible := true;
      IDEps.Visible := true;
  end;
//  {$ENDIF}
end;

procedure TFABMPadresExternos.HabilitarFuentesDEPs;
begin
  AbrirFuentesDEPs;
end;

procedure TFABMPadresExternos.InsertarFuentesDEPs;
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

procedure TFABMPadresExternos.AbrirFuentesDEPs;
begin
  IBQDEPsAnimal.Close;
  IBQDEPsAnimal.ParamByName('dep').AsInteger := id_dep;
  IBQDEPsAnimal.Open;
  if IBQDEPsAnimal.IsEmpty then
  begin
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
    DBLCBAFuenteDeps.KeyValue := 0;
  end
  else
  begin
    DBLCBAFuenteDeps.KeyValue := IBQDEPsAnimal.FieldValues['fuente'];
  end;
end;

procedure TFABMPadresExternos.ActualizarConsultaFiltros;
var SQLStr : String;
begin

  if (RBUltimosDiezA.Checked) then
    SQLStr := SQLOriginal
  else
    SQLStr := SQLTodos;

  if (EBusqueda.Text <> '') then
    SQLStr := SQLStr + ' and ((A.id_rp like ''%' +EBusqueda.Text+ '%'') or (A.id_hba like ''%' +EBusqueda.Text+ '%'') or (A.nombre like ''%' +EBusqueda.Text+ '%'') or (A.apodo like ''%' +EBusqueda.Text+ '%''))';


{  if CBRP.Checked then
    SQLStr := SQLStr + ' and (A.id_rp like ''%' +EARP.Text+ '%'')'
  else
    SQLStr := StringReplace(SQLStr,' and (A.id_rp like ''%' +EARP.Text+ '%'')','',[rfReplaceAll]);

  if CBHBA.Checked then
    SQLStr := SQLStr + ' and (A.id_hba like ''%' +EAHBA.Text+ '%'')'
  else
    SQLStr := StringReplace(SQLStr,' and (A.id_hba like ''%' +EAHBA.Text+ '%'')','',[rfReplaceAll]);

  if CBNombre.Checked then
    SQLStr := SQLStr + ' and (A.nombre like ''%' +EANombre.Text+ '%'') and (A.nombre <> '''')'
  else
    SQLStr := StringReplace(SQLStr,' and (A.nombre like ''%' +EANombre.Text+ '%'')','',[rfReplaceAll]);

  if CBApodo.Checked then
    SQLStr := SQLStr + ' and (A.apodo like ''%' +EAApodo.Text+ '%'') and (A.apodo <> '''')'
  else
    SQLStr := StringReplace(SQLStr,' and (A.apodo like ''%' +EAApodo.Text+ '%'')','',[rfReplaceAll]);  }

{  if CBRaza.Checked then
    SQLStr := SQLStr + ' and (A.raza = :raza)'
  else
    SQLStr := StringReplace(SQLStr,' and (A.raza = :raza)','',[rfReplaceAll]);

  if CBSexo.Checked then
    SQLStr := SQLStr + ' and (A.sexo = :sexo)'
  else
    SQLStr := StringReplace(SQLStr,' and (A.sexo = :sexo)','',[rfReplaceAll]);

  if CBPropietario.Checked then
    SQLStr := SQLStr + ' and (A.propietario = :propietario)'
  else
    SQLStr := StringReplace(SQLStr,' and (A.propietario = :propietario)','',[rfReplaceAll]);

  if CBCriador.Checked then
    SQLStr := SQLStr + ' and (A.criador like ''%' +EACriador.Text+ '%'')'
  else
    SQLStr := StringReplace(SQLStr,' and (A.criador like ''%' +EACriador.Text+ '%'')','',[rfReplaceAll]); }

  IBQAbmSimple.Close;
  IBQAbmSimple.SQL.Clear;
  IBQAbmSimple.SQL.Add(SQLStr);
 // IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := Fprincipal.EstablecimientoActual;

  {if (sexoabm <> -1) then
    IBQAbmSimple.ParamByName('tiposexo').Value := sexoabm; }

{  if CBRaza.Checked then
    IBQAbmSimple.ParamByName('raza').Value := raza_filtro; }

  if sexoAbm <> -1 then
  begin
    if (IBQAbmSimple.Params.FindParam('tiposexo') <>nil) then
      IBQAbmSimple.ParamByName('tiposexo').Value := sexoAbm;

    if (sexoAbm = 1) then
       SQLStr := StringReplace(SQLStr,' id_animal_externo in (select madre from tab_embriones where fecha_coleccion >= :ultimosDiez)) or','',[rfReplaceAll])
    else
       SQLStr := StringReplace(SQLStr,' or (id_animal_externo in (select semen from eve_movimiento_semen where fecha >= :ultimosDiez)','',[rfReplaceAll]);
  end;

{  if CBPropietario.Checked then
    IBQAbmSimple.ParamByName('propietario').Value := propietario_filtro;}

  IBQAbmSimple.Open;

end;

procedure TFABMPadresExternos.CBRPClick(Sender: TObject);
begin
  inherited;
  EARP.Enabled := CBRP.Checked;
  EARP.Clear;
  rp_filtro := '%';
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.EARPChange(Sender: TObject);
begin
  inherited;
  rp_filtro := EARP.Text+'%';
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.CBHBAClick(Sender: TObject);
begin
  inherited;
  EAHBA.Enabled := CBHBA.Checked;
  EAHBA.Clear;
  hba_filtro := '%';
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.EAHBAChange(Sender: TObject);
begin
  inherited;
  hba_filtro := EAHBA.Text+'%';
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.CBNombreClick(Sender: TObject);
begin
  inherited;
  EANombre.Enabled := CBNombre.Enabled;
  EANombre.Clear;
  nombre_filtro := '%';
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.EANombreChange(Sender: TObject);
begin
  inherited;
  nombre_filtro := EANombre.Text+'%';
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.CBApodoClick(Sender: TObject);
begin
  inherited;
  EAApodo.Enabled := CBApodo.Checked;
  EAApodo.Clear;
  apodo_filtro := '%';
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.EAApodoChange(Sender: TObject);
begin
  inherited;
  apodo_filtro := EAApodo.Text + '%';
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.CBRazaClick(Sender: TObject);
begin
  inherited;
  DBLCBARaza.Enabled := CBRaza.Checked;
  DBLCBARaza.KeyValue := -1;
  raza_filtro := -1;
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.DBLCBARazaCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBARaza.KeyValue <> null then
  begin
    raza_filtro := DBLCBARaza.KeyValue;
//    ActualizarConsultaFiltros;
  end;
end;

procedure TFABMPadresExternos.CBSexoClick(Sender: TObject);
begin
  inherited;
  DBLCBASexoFiltro.Enabled := CBSexo.Checked;
  DBLCBASexoFiltro.KeyValue := -1;
  sexo_filtro := -1;
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.DBLCBASexoFiltroCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBASexoFiltro.KeyValue <> null then
  begin
    sexo_filtro := DBLCBASexoFiltro.KeyValue;
//    ActualizarConsultaFiltros;
  end;
end;

procedure TFABMPadresExternos.BBImprimirReporteClick(Sender: TObject);
var
  F : TFREPListadoAnimalesExternosPreview;
begin
  inherited;
  F := TFREPListadoAnimalesExternosPreview.Create(self);
  F.QRLCant.Caption := IntToStr(IBQAbmSimple.RecordCount);
  F.QRLSenasa.Caption := FPrincipal.PaisNombreCaravana;
  F.AsignarDataSet(IBQAbmSimple);
  F.ShowModal;
  F.Destroy;

  IBQAbmSimple.First;
end;

procedure TFABMPadresExternos.CBPropietarioClick(Sender: TObject);
begin
  inherited;
  DBLCBAPropietarioFiltro.Enabled := CBPropietario.Checked;
  DBLCBAPropietarioFiltro.KeyValue := -1;
  propietario_filtro := -1;
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.DBLCBAPropietarioFiltroCloseUp(
  Sender: TObject);
begin
  inherited;
  if DBLCBAPropietarioFiltro.KeyValue <> null then
  begin
    propietario_filtro := DBLCBAPropietarioFiltro.KeyValue;
//    ActualizarConsultaFiltros;
  end;
end;

procedure TFABMPadresExternos.CBCriadorClick(Sender: TObject);
begin
  inherited;
  EACriadorFiltro.Enabled := CBCriador.Checked;
  EACriadorFiltro.Clear;
  criador_filtro := '%';
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.EACriadorFiltroChange(Sender: TObject);
begin
  inherited;
  criador_filtro := EACriadorFiltro.Text+'%';
//  ActualizarConsultaFiltros;
end;

procedure TFABMPadresExternos.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFABMPadresExternos.LFuenteClick(Sender: TObject);
var
  F : TFABMFuentesDeps;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      //FPrincipal.AbrirFormNormal(TFABMFuentesDeps.Create(self));
      F := TFABMFuentesDeps.Create(self);
      if IBQAbmSimple.FieldValues['raza'] <> null then
        if IBQAbmSimple.FieldValues['raza'] > 0 then
          F.Raza := IBQAbmSimple.FieldValues['raza'];
      F.ShowModal;
      AbrirFuentesDeps;
      DBLCBAFuenteDeps.KeyValue := F.Fuente;
      F.Destroy;
  end;
end;

procedure TFABMPadresExternos.LFuenteMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LFuente.Font.Color:= $00606C02;
      LFuente.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFABMPadresExternos.LFuenteMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LFuente.Font.Color:= clWindowText;
      LFuente.Font.Style:= [fsUnderline];
    end; 
end;

procedure TFABMPadresExternos.SBPropietariosClick(Sender: TObject);
var F: TFCoopropiedad;
begin
  inherited;
  F:= TFCoopropiedad.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFABMPadresExternos.ExpandirGroups(F : TFEveAltaDirecta);
begin
     F.IAceptarDatosAltaClick(F.IAceptarDatosAlta);

     F.PRp.Visible := true;

     F.PCuigSenasa.Visible := true;

     F.PCaravanaElectronica.Visible := true;

     F.IAceptarRpNoPres.Enabled := false;
     F.IAceptarRpSiPres.Enabled := false;
     F.ICuigNoPres.Enabled := false;
     F.ICuigSiPres.Enabled := false;
     F.IReIDNoPres.Enabled := false;
     F.IReIDSiPres.Enabled := false;
     F.ICaravanasElecNoPres.Enabled := false;
     F.ICaravanasElecSiPres.Enabled := false;

     F.IAceptarIdentificacionClick(F.IAceptarIdentificacion);
     F.IAceptarDatosRazaClick(F.IAceptarDatosRaza);
     F.IAceptarDatosIdentificacionSecundariaClick(F.IAceptarDatosIdentificacionSecundaria);
     F.IAceptarDatosGeneralesClick(F.IAceptarDatosGenerales);
     F.IAceptarDatosEspecificosClick(F.IAceptarDatosEspecificos);
end;

procedure TFABMPadresExternos.BCompraClick(Sender: TObject);
var
  F : TFEveAltaDirecta;
  id_nuevo, id_m, id_p : integer;
  Senasa : String;
  a : Char;
  Hoy : TDate;
  Nro_Senasa : Integer;
  Meses : Integer;
begin
  inherited;
  id_m := -1;
  id_p := -1;
  F := TFEveAltaDirecta.Create(self);
  ExpandirGroups(F);
  F.DBLCBATipoAlta.Enabled := false;
  Hoy := Date();
  Meses := MonthsBetween(Hoy, IBQAbmSimple.FieldValues['fecha_nacimiento']);
  F.DTPAFechaNac.Date := IBQAbmSimple.FieldValues['fecha_nacimiento'];
  F.DTPAFechaNacChange(F.DTPAFechaNac);
  F.EARpInicial.Text := IBQAbmSimple.FieldValues['id_rp'];
  F.JvEAApodo.Text := IBQAbmSimple.FieldValues['apodo'];
  F.JvEANombre.Text := IBQAbmSimple.FieldValues['nombre_animal'];
  F.DBLCBASexo.KeyValue := IBQAbmSimple.FieldValues['sexo'];
  F.DBLCBACategoriaCloseUp(F.DBLCBASexo);
  F.HabilitarSegunSexo;
  F.CategoriaSegunSexo;
  F.DBLCBARaza.KeyValue := IBQAbmSimple.FieldValues['raza'];
  F.DBLCBARazaCloseUp(F.DBLCBARaza);
  if (IBQAbmSimple.FieldValues['id_hba'] <> null) and (IBQAbmSimple.FieldValues['id_hba'] <> '') then
    F.JvEAIdHBA.Text := IBQAbmSimple.FieldValues['id_hba'];
  if (IBQAbmSimple.FieldValues['id_ra'] <> null) and (IBQAbmSimple.FieldValues['id_ra'] <> '') then
    F.JvEAIdRA.Text := IBQAbmSimple.FieldValues['id_ra'];
  if (IBQAbmSimple.FieldValues['id_pc'] <> null) and (IBQAbmSimple.FieldValues['id_pc'] <> '') then
    F.JvEAIdPC.Text := IBQAbmSimple.FieldValues['id_pc'];
  if (IBQAbmSimple.FieldValues['id_otro'] <> null) and (IBQAbmSimple.FieldValues['id_otro'] <> '') then
    F.JvEAOtro.Text := IBQAbmSimple.FieldValues['id_otro'];
  if (IBQAbmSimple.FieldValues['id_senasa'] <> null) and (IBQAbmSimple.FieldValues['id_senasa'] <> '') then
  begin
    Senasa := IBQAbmSimple.FieldValues['id_senasa'];
    if tryStrToInt(Senasa,Nro_Senasa) then
    begin
      //F.RBSenasa.Checked := true;
      //F.RBSenasaClick(F.RBSenasa);
      //F.EAIdSenasa.Text := UFunctions.CompletarDigitosSenasa(Senasa);
    end
    else
    begin
      //F.RBCUIGSenasa.Checked := true;
      //F.RBCUIGSenasaClick(F.RBCUIGSenasa);
      F.EAEncabezado.Text := LeftStr(Senasa,5);
      F.EAUltimoIdent.Text := RightStr(Senasa,4);
      F.EAVerificador.Text := IntToStr(UFunctions.DigitoVerificadorCaravana(Senasa));
    end;
  end;
  if (IBQAbmSimple.FieldValues['tipificacion_sanguinea'] <> null) and (IBQAbmSimple.FieldValues['tipificacion_sanguinea'] <> '') then
  begin
    //F.CBSanguinea.Checked := true;
    F.JvEASanguinea.Text := IBQAbmSimple.FieldValues['tipificacion_sanguiena'];
  end;
  if (IBQAbmSimple.FieldValues['adn'] <> null) and (IBQAbmSimple.FieldValues['adn'] <> '') then
  begin
    //F.CBADN.Checked := true;
    F.JvEAADN.Text := IBQAbmSimple.FieldValues['adn'];
  end;
  if (IBQAbmSimple.FieldValues['color'] <> null) then
  begin
    //F.CBSanguinea.Checked := true;
    F.DBLCBAColor.KeyValue := IBQAbmSimple.FieldValues['color'];

  end;

  //Busco la madre
  IBQAuxPadres.Close;
  IBQAuxPadres.SQL.Clear;
  IBQAuxPadres.SQL.Add('select first 1 id_madre from rel_animales_madres_ext where id_hijo = :id');
  IBQAuxPadres.ParamByName('id').AsInteger := IBQAbmSimple.FieldValues['id_animal_externo'];
  IBQAuxPadres.Open;
  if not IBQAuxPadres.IsEmpty then
  begin
    id_m := IBQAuxPadres.FieldValues['id_madre'];
    if id_m > 0 then
    begin
      IBQAuxDatosPadre.Close;
      IBQAuxDatosPadre.ParamByName('id').AsInteger := id_m;
      IBQAuxDatosPadre.Open;

      F.LMSeleccionadaB.Caption := 'Madre Biológica Seleccionada - RP: '+IBQAuxDatosPadre.FieldValues['id_rp'];
      if IBQAuxDatosPadre.FieldValues['id_hba'] <> null then
        F.LMSeleccionadaB.Caption := F.LMSeleccionadaB.Caption+' HBA: '+IBQAuxDatosPadre.FieldValues['id_hba'];
      if IBQAuxDatosPadre.FieldValues['nombre'] <> null then
        F.LMSeleccionadaB.Caption := F.LMSeleccionadaB.Caption+' Nombre: '+IBQAuxDatosPadre.FieldValues['nombre'];
      F.LMSeleccionadaB.Visible := true;

      F.id_madreB := id_m;
      F.TipoMadreB := 'EXTERNA';
    end;
  end;
  //Busco el padre
  IBQAuxPadres.Close;
  IBQAuxPadres.SQL.Clear;
  IBQAuxPadres.SQL.Add('select first 1 rape.id_padre, tae.id_rp, tae.nombre, tae.apodo, tae.sexo from rel_animales_padres_ext rape join tab_animales_externos tae on tae.id_animal_externo = rape.id_padre where id_hijo = :id');
  IBQAuxPadres.ParamByName('id').AsInteger := IBQAbmSimple.FieldValues['id_animal_externo'];
  IBQAuxPadres.Open;
  if not IBQAuxPadres.IsEmpty then
  begin
    id_p := IBQAuxPadres.FieldValues['id_padre'];
    if id_p > 0 then
    begin
      IBQAuxDatosPadre.Close;
      IBQAuxDatosPadre.ParamByName('id').AsInteger := id_p;
      IBQAuxDatosPadre.Open;

      F.LSeleccionP.Caption := 'Padre Seleccionado - RP: '+IBQAuxDatosPadre.FieldValues['id_rp'];
      if IBQAuxDatosPadre.FieldValues['id_hba'] <> null then
        F.LSeleccionP.Caption := F.LSeleccionP.Caption+' HBA: '+IBQAuxDatosPadre.FieldValues['id_hba'];
      if IBQAuxDatosPadre.FieldValues['nombre'] <> null then
        F.LSeleccionP.Caption := F.LSeleccionP.Caption+' Nombre: '+IBQAuxDatosPadre.FieldValues['nombre'];
      F.LSeleccionP.Visible := true;

      F.id_padre := IBQAuxPadres.FieldValues['id_padre'];
      F.TipoPadre := 'EXTERNO';
    end;
  end;
  //////////////////
  F.FIdAnimExterno := IBQAbmSimple.FieldValues['id_animal_externo'];
  if (Meses < 9) then
  begin
    if IBQAbmSimple.FieldValues['sexo'] = 1 then
      F.DBLCBACategoria.KeyValue := 1
    else
      F.DBLCBACategoria.KeyValue := 4;
  end
  else
  begin
    if IBQAbmSimple.FieldValues['sexo'] = 1 then
      F.DBLCBACategoria.KeyValue := 3
    else
    begin
      IBQProduccionMadre.Close;
      IBQProduccionMadre.ParamByName('id').AsInteger := IBQAbmSimple.FieldValues['id_animal_externo'];
      IBQProduccionMadre.Open;
      if IBQProduccionMadre.FieldValues['cantidad'] > 0 then
        F.DBLCBACategoria.KeyValue := 6
      else
        F.DBLCBACategoria.KeyValue := 5;
    end;
  end;
  F.DBLCBACategoriaCloseUp(F.DBLCBACategoria);
  if F.DBLCBACategoria.KeyValue = 6 then
  begin
    F.UDLactacion.Position := IBQProduccionMadre.FieldValues['cantidad'];
    F.UDLactacion.Update;
  end;
  F.ShowModal;
  F.Destroy;
  Estado := eaNavegar;
  Close;
end;

procedure TFABMPadresExternos.AjustarColumnas;
begin
      BDBGAbm.Columns[0].Width := 90;
      BDBGAbm.Columns[1].Width := 90;
//      BDBGAbm.Columns[2].Width := 80;
      BDBGAbm.Columns[3].Width := 260;
      BDBGAbm.Columns[4].Width := 260;
      BDBGAbm.Columns[5].Width := 80;
      BDBGAbm.Columns[6].Width := 40;
      BDBGAbm.Columns[7].Width := 60;
      BDBGAbm.Columns[8].Width := 60;
      BDBGAbm.Columns[9].Width := 100;
      BDBGAbm.Columns[10].Width := 100;
      BDBGAbm.Columns[11].Width := 70;
      BDBGAbm.Columns[12].Width := 70;
      BDBGAbm.Columns[13].Width := 70;
end;

procedure TFABMPadresExternos.LVerAnimalesClick(Sender: TObject);
begin

  ActualizarConsultaFiltros;

end;

procedure TFABMPadresExternos.BDBGAbmDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var Num: Integer;
    R: TRect;
begin

  Num := TStringGrid(BDBGAbm).Row;
  R := TStringGrid(BDBGAbm).CellRect(DataCol,Num);

  if R.Top=Rect.Top then
    with BDBGAbm do
    begin
      if (gdFocused in State) then
      begin
        Canvas.Font.Color := clWhite;
      end
      else
      begin
        Canvas.Font.Color := clWhite;
      end;

      Canvas.Font.Style := [fsBold];
      
      DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end;
end;

procedure TFABMPadresExternos.OcultarBotones;
begin
      IBuscar.Visible := false;
      //ICancelar.Visible := false;
      IEditar.Visible := false;
      IElegir.Visible := false;
      IFiltro.Visible := false;
      //IInsertar.Visible := false;
      IPreliminar.Visible := false;
      IVerDatosAnimal.Visible := false;
      JvIExpExcel.Visible := false;

      LBuscar.Visible := false;
      //LCancelar.Visible := false;
      LEditar.Visible := false;
      LElegir.Visible := false;
      LFiltro.Visible := false;
      //LInsertar.Visible := false;
      LPreliminar.Visible := false;
      LVerDatosAnimal.Visible := false;
      LExpExcel.Visible := false;

     { ITerminar.Visible := false;
      LTerminar.Visible := false;}
end;

procedure TFABMPadresExternos.MostrarBotones;
var anchoFondo, margenIzq, i, j, fact, cant_iconos : integer;
begin

  //IInsertar.Visible := true;
  IEliminar.Visible := true;
  IPreliminar.Visible := true;
  IVerDatosAnimal.Visible := true;
  JvIExpExcel.Visible := true;
  //LInsertar.Visible := true;
  LEliminar.Visible := true;
  LPreliminar.Visible := true;
  LVerDatosAnimal.Visible := true;
  LExpExcel.Visible := true;

  cant_iconos := 0;

  for j:= 0 to PBotones.ControlCount - 1 do
    if (PBotones.Controls[j].Visible) then
        if (PBotones.Controls[j] is TImage) then
            Inc(cant_iconos);

  cant_iconos := cant_iconos - 1;

  anchoFondo := IFondo.Width div cant_iconos;
  margenIzq := anchoFondo div 2;
  fact := 1;

  for i:= 0 to PBotones.ControlCount - 1 do
  begin
    if (PBotones.Controls[i].Visible) then
        if (PBotones.Controls[i].Name <> 'IFondo') then
            if (PBotones.Controls[i] is TImage) and (PBotones.Controls[i].Tag <> 20) and (PBotones.Controls[i].Tag <> 19) then
            begin
                PBotones.Controls[i].Left := (((anchoFondo*fact) - margenIzq) - (PBotones.Controls[i].Width div 2));
                inc(fact);
            end
            else
                if (PBotones.Controls[i].Tag = 20) then
                    PBotones.Controls[i].Left := (((anchoFondo*(cant_iconos)) - margenIzq) - (PBotones.Controls[i].Width div 2))
                else
                    if (PBotones.Controls[i].Tag = 19) then
                        PBotones.Controls[i].Left := (((anchoFondo*(cant_iconos-1)) - margenIzq) - (PBotones.Controls[i].Width div 2));

  end; 

  fact := 1;

  for i:= 0 to PBotones.ControlCount - 1 do
  begin
    if (PBotones.Controls[i].Visible) then
        if (PBotones.Controls[i].Name <> 'IFondo') then
            if (PBotones.Controls[i] is TLabel) and (PBotones.Controls[i].Tag <> 20) and (PBotones.Controls[i].Tag <> 19) then
            begin
                PBotones.Controls[i].Left := (((anchoFondo*fact) - margenIzq) - (PBotones.Controls[i].Width div 2));
                inc(fact);
            end
            else
                if (PBotones.Controls[i].Tag = 20) then
                    PBotones.Controls[i].Left := (((anchoFondo*(cant_iconos)) - margenIzq) - (PBotones.Controls[i].Width div 2))
                else
                    if (PBotones.Controls[i].Tag = 19) then
                        PBotones.Controls[i].Left := (((anchoFondo*(cant_iconos-1)) - margenIzq) - (PBotones.Controls[i].Width div 2));


  end;

end;

procedure TFABMPadresExternos.AcEliminarExecute(Sender: TObject);
begin
  inherited;
  OcultarBotones;
  MostrarBotones;
  LVerAnimalesClick(Sender);
end;

function TFABMPadresExternos.OpcionesParaGrabar : Boolean;
begin
  Result := (DBEARPExternos.Text <> '') and (DBEANombreExternos.Text <> '') and (DBEAApodoExternos.Text <> '') and (DBLCBASexo.KeyValue <> null)
end;

procedure TFABMPadresExternos.GuardarGenealog;
var i, j, auxP, auxM, animal :integer;
begin
     auxP := 0;
     auxM := 0;

        if (arrGenealogia[0].sexo = 1) then auxP := arrGenealogia[0].id_animal;
        if (arrGenealogia[0].sexo = 2) then auxM := arrGenealogia[0].id_animal;
        if (arrGenealogia[1].sexo = 1) then auxP := arrGenealogia[1].id_animal;
        if (arrGenealogia[1].sexo = 2) then auxM := arrGenealogia[1].id_animal;

        try
           IBSPGuardarGeneaExt.Close;
           if (EstabAux <> null) and (EstabAux <> 0) then
              IBSPGuardarGeneaExt.ParamByName('establecimiento').AsInteger := EstabAux
           else
               IBSPGuardarGeneaExt.ParamByName('establecimiento').AsInteger := FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['id_animal_externo']); // .EstablecimientoActual;
           IBSPGuardarGeneaExt.ParamByName('id_animal').AsInteger := ID_Animal;
           IBSPGuardarGeneaExt.ParamByName('id_padre').AsInteger := auxP;
           IBSPGuardarGeneaExt.ParamByName('id_madre').AsInteger := auxM;
           IBSPGuardarGeneaExt.ExecProc;

           FPrincipal.IBTPrincipal.CommitRetaining;
        except
           FPrincipal.IBTPrincipal.RollbackRetaining;
        end;



     j := 2;
     for i := 0 to 5 do
     begin
       auxP := 0;
       auxM := 0;

       if (arrGenealogia[i].id_animal <> 0) then
       begin
          if (arrGenealogia[i+j].sexo = 1) then auxP := arrGenealogia[i+j].id_animal;
          if (arrGenealogia[i+j].sexo = 2) then auxM := arrGenealogia[i+j].id_animal;
          if (arrGenealogia[i+j+1].sexo = 1) then auxP := arrGenealogia[i+j+1].id_animal;
          if (arrGenealogia[i+j+1].sexo = 2) then auxM := arrGenealogia[i+j+1].id_animal;

          try
             IBSPGuardarGeneaExt.Close;
             animal := arrGenealogia[i].id_animal;
             IBSPGuardarGeneaExt.ParamByName('establecimiento').AsInteger := FPrincipal.EstabAnimalExterno(animal);
             IBSPGuardarGeneaExt.ParamByName('id_animal').AsInteger := arrGenealogia[i].id_animal;
             IBSPGuardarGeneaExt.ParamByName('id_padre').AsInteger := auxP;
             IBSPGuardarGeneaExt.ParamByName('id_madre').AsInteger := auxM;
             IBSPGuardarGeneaExt.ExecProc;

             FPrincipal.IBTPrincipal.CommitRetaining;
          except
             FPrincipal.IBTPrincipal.RollbackRetaining;
          end;

       end;
       Inc(j);
     end;
end;

procedure TFABMPadresExternos.GuardarTemporalmenteDeps;
begin

   try
      if (FPrincipal.Pais = 1) then // Argentina
      begin
        IBQSPImportarAuxDeps.ParamByName('ANIO').AsInteger:= StrToInt(EAAnio.Text);
        IBQSPImportarAuxDeps.ParamByName('ANIMAL').AsInteger:= id_animal;
        IBQSPImportarAuxDeps.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['id_animal_externo']);

          if ((RazaAnimal = 2) or (RazaAnimal = 3) or (RazaAnimal = 29)) then   //Para Angus
          begin
              if (Trim(EACrias.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('CRIAS').AsInteger := EACrias.GetDato
              else
                 IBQSPImportarAuxDeps.ParamByName('CRIAS').Value := null;

              if (Trim(EARodeo.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('RODEO').AsInteger:= EARodeo.GetDato
              else
                 IBQSPImportarAuxDeps.ParamByName('RODEO').Value:= null;

              if (Trim(EADEPGest.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPGest.Text)
              else
                 IBQSPImportarAuxDeps.ParamByName('GESTDEP').Value:= null;

              if (Trim(EAPrecGest.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('GESTPREC').AsFloat:= EAPrecGest.GetDato
              else
                 IBQSPImportarAuxDeps.ParamByName('GESTPREC').Value:= null;

              if (Trim(EADEPNacer.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPNacer.Text)
               else
                  IBQSPImportarAuxDeps.ParamByName('NACERDEP').Value:= null;

              if (Trim(EAPrecNacer.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('NACERPREC').AsFloat:= EAPrecNacer.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('NACERPREC').Value:= null;

              if (Trim(EADEPDest.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPDest.GetDato)
               else
                 IBQSPImportarAuxDeps.ParamByName('DESTDEP').Value:= null;

              if (Trim(EAPrecDest.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('DESTPREC').AsFloat:= EAPrecDest.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('DESTPREC').Value:= null;

              if (Trim(EADEPLeche.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLeche.GetDato)
               else
                 IBQSPImportarAuxDeps.ParamByName('LECHEDEP').Value:= null;

              if (Trim(EAPrecLeche.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('LECHEPREC').AsFloat:= EAPrecLeche.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('LECHEPREC').Value:= null;

              if (Trim(EADEPFinal.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPFinal.GetDato)
               else
                 IBQSPImportarAuxDeps.ParamByName('FINALDEP').Value:= null;

              if (Trim(EAPrecFinal.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('FINALPREC').AsFloat:= EAPrecFinal.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('FINALPREC').Value:= null;

              if (Trim(EADEPCE.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCE.GetDato)
               else
                 IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

              if (Trim(EAPrecCE.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('CEPREC').AsFloat:= EAPrecCE.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('CEPREC').Value:= null;

              if (Trim(EADEPAltura.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('ALTURADEP').AsFloat:= PasarDepAFloat(EADEPAltura.GetDato)
               else
                 IBQSPImportarAuxDeps.ParamByName('ALTURADEP').Value:= null;

              if (Trim(EAPrecAltura.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('ALTURAPREC').AsFloat:= EAPrecAltura.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('ALTURAPREC').Value:= null;

              if (Trim(EADEPEGD.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('EGDDEP').AsFloat:= PasarDepAFloat(EADEPEGD.GetDato)
               else
                 IBQSPImportarAuxDeps.ParamByName('EGDDEP').Value:= null;

              if (Trim(EAPrecEGD.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('EGDPREC').AsFloat:= EAPrecEGD.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('EGDPREC').Value:= null;

              if (Trim(EADEPEGC.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPEGC.GetDato)
               else
                 IBQSPImportarAuxDeps.ParamByName('EGCDEP').Value:= null;

              if (Trim(EAPrecEGC.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('EGCPREC').AsFloat:= EAPrecEGC.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('EGCPREC').Value:= null;

              if (Trim(EADEPAOB.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOB.GetDato)
               else
                 IBQSPImportarAuxDeps.ParamByName('AOBDEP').Value:= null;

              if (Trim(EAPrecAOB.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('AOBPREC').AsFloat:= EAPrecAOB.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('AOBPREC').Value:= null;

              if (Trim(EADEPPorcGI.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('PORGIDEP').AsFloat:= PasarDepAFloat(EADEPPorcGI.GetDato)
               else
                 IBQSPImportarAuxDeps.ParamByName('PORGIDEP').Value:= null;

              if (Trim(EAPrecPorcGI.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('PORGIPREC').AsFloat:= EAPrecPorcGI.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('PORGIPREC').Value:= null;

              if (Trim(EADEPPorcCM.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('PORCMDEP').AsFloat:= PasarDepAFloat(EADEPPorcCM.GetDato)
               else
                 IBQSPImportarAuxDeps.ParamByName('PORCMDEP').Value:= null;

              if (Trim(EAPrecPorcCM.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('PORCMPREC').AsFloat:= EAPrecPorcCM.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('PORCMPREC').Value:= null;
          end
          else
            if ((RazaAnimal = 12) or (RazaAnimal = 28)) then //Para Brangus
            begin
                if (Trim(EACriasBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('CRIAS').AsInteger := EACriasBran.GetDato
                else
                  IBQSPImportarAuxDeps.ParamByName('CRIAS').Value := null;

                if (Trim(EARodeoBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('RODEO').AsInteger:= EARodeoBran.GetDato
                else
                   IBQSPImportarAuxDeps.ParamByName('RODEO').Value:= null;

                if (Trim(EADEPAptitudBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPAptitudBran.Text)
                else
                   IBQSPImportarAuxDeps.ParamByName('GESTDEP').Value:= null;

                if (Trim(EAPRECAptitudBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('GESTPREC').AsFloat:= EAPRECAptitudBran.GetDato
                else
                   IBQSPImportarAuxDeps.ParamByName('GESTPREC').Value:= null;

                if (Trim(EADEPPesoNacBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPesoNacBran.Text)
                 else
                    IBQSPImportarAuxDeps.ParamByName('NACERDEP').Value:= null;

                if (Trim(EAPRECPesoNacBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('NACERPREC').AsFloat:= EAPRECPesoNacBran.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('NACERPREC').Value:= null;

                if (Trim(EADEPPesoDestBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPesoDestBran.GetDato)
                 else
                   IBQSPImportarAuxDeps.ParamByName('DESTDEP').Value:= null;

                if (Trim(EAPRECPesoDestBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('DESTPREC').AsFloat:= EAPRECPesoDestBran.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('DESTPREC').Value:= null;

                if (Trim(EADEPLecheBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLecheBran.GetDato)
                 else
                   IBQSPImportarAuxDeps.ParamByName('LECHEDEP').Value:= null;

                IBQSPImportarAuxDeps.ParamByName('LECHEPREC').Value:= null;

                if (Trim(EADEPPesoFinalBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPPesoFinalBran.GetDato)
                 else
                   IBQSPImportarAuxDeps.ParamByName('FINALDEP').Value:= null;

                if (Trim(EAPRECPesoFinalBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('FINALPREC').AsFloat:= EAPRECPesoFinalBran.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('FINALPREC').Value:= null;

                if (Trim(EADEPCEBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEBran.GetDato)
                 else
                   IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

                if (Trim(EAPRECCEBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('CEPREC').AsFloat:= EAPRECCEBran.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('CEPREC').Value:= null;

                IBQSPImportarAuxDeps.ParamByName('ALTURADEP').Value:= null;

                IBQSPImportarAuxDeps.ParamByName('ALTURAPREC').Value:= null;

                if (Trim(EADEPGDBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('EGDDEP').AsFloat:= PasarDepAFloat(EADEPGDBran.GetDato)
                 else
                   IBQSPImportarAuxDeps.ParamByName('EGDDEP').Value:= null;

                if (Trim(EAPRECGDBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('EGDPREC').AsFloat:= EAPRECGDBran.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('EGDPREC').Value:= null;

                if (Trim(EADEPGCBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPGCBran.GetDato)
                 else
                   IBQSPImportarAuxDeps.ParamByName('EGCDEP').Value:= null;

                if (Trim(EAPRECGCBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('EGCPREC').AsFloat:= EAPRECGCBran.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('EGCPREC').Value:= null;

                if (Trim(EADEPAOBBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOBBran.GetDato)
                 else
                   IBQSPImportarAuxDeps.ParamByName('AOBDEP').Value:= null;

                if (Trim(EAPRECAOBBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('AOBPREC').AsFloat:= EAPRECAOBBran.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('AOBPREC').Value:= null;

                if (Trim(EADEPGIBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('PORGIDEP').AsFloat:= PasarDepAFloat(EADEPGIBran.GetDato)
                 else
                   IBQSPImportarAuxDeps.ParamByName('PORGIDEP').Value:= null;

                if (Trim(EAPRECGIBran.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('PORGIPREC').AsFloat:= EAPRECGIBran.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('PORGIPREC').Value:= null;


                IBQSPImportarAuxDeps.ParamByName('PORCMDEP').Value:= null;

                IBQSPImportarAuxDeps.ParamByName('PORCMPREC').Value:= null;
            end
            else
                if ((RazaAnimal = 11)) then //Para Braford
                begin

                    if (Trim(EACriasBraford.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('CRIAS').AsInteger := EACriasBraford.GetDato
                    else
                       IBQSPImportarAuxDeps.ParamByName('CRIAS').Value := null;

                    if (Trim(EARodeoBraford.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('RODEO').AsInteger:= EARodeoBraford.GetDato
                    else
                       IBQSPImportarAuxDeps.ParamByName('RODEO').Value:= null;

                    if (Trim(EADEPAptitudBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPAptitudBraf.Text)
                    else
                       IBQSPImportarAuxDeps.ParamByName('GESTDEP').Value:= null;

                    if (Trim(EAPRECAptitudBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('GESTPREC').AsFloat:= EAPRECAptitudBraf.GetDato
                    else
                       IBQSPImportarAuxDeps.ParamByName('GESTPREC').Value:= null;

                    if (Trim(EADEPPesoNacBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPesoNacBraf.Text)
                     else
                        IBQSPImportarAuxDeps.ParamByName('NACERDEP').Value:= null;

                    if (Trim(EAPRECPesoNacBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('NACERPREC').AsFloat:= EAPRECPesoNacBraf.GetDato
                     else
                       IBQSPImportarAuxDeps.ParamByName('NACERPREC').Value:= null;

                    if (Trim(EADEPPesoDestBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPesoDestBraf.GetDato)
                     else
                       IBQSPImportarAuxDeps.ParamByName('DESTDEP').Value:= null;

                    if (Trim(EAPRECPesoDestBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('DESTPREC').AsFloat:= EAPRECPesoDestBraf.GetDato
                     else
                       IBQSPImportarAuxDeps.ParamByName('DESTPREC').Value:= null;

                    if (Trim(EADEPLecheBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLecheBraf.GetDato)
                     else
                       IBQSPImportarAuxDeps.ParamByName('LECHEDEP').Value:= null;

                    IBQSPImportarAuxDeps.ParamByName('LECHEPREC').Value:= null;

                    if (Trim(EADEPPesoFinalBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPPesoFinalBraf.GetDato)
                     else
                       IBQSPImportarAuxDeps.ParamByName('FINALDEP').Value:= null;

                    if (Trim(EAPRECPesoFinalBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('FINALPREC').AsFloat:= EAPRECPesoFinalBraf.GetDato
                     else
                       IBQSPImportarAuxDeps.ParamByName('FINALPREC').Value:= null;

                    if (Trim(EADEPCEBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEBraf.GetDato)
                     else
                       IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

                    if (Trim(EAPRECCEBraf.Text) <> '') then
                      IBQSPImportarAuxDeps.ParamByName('CEPREC').AsFloat:= EAPRECCEBraf.GetDato
                     else
                       IBQSPImportarAuxDeps.ParamByName('CEPREC').Value:= null;

                    IBQSPImportarAuxDeps.ParamByName('ALTURADEP').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('ALTURAPREC').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('EGDDEP').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('EGDPREC').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('EGCDEP').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('EGCPREC').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('AOBDEP').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('AOBPREC').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('PORGIDEP').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('PORGIPREC').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('PORCMDEP').Value:= null;
                    IBQSPImportarAuxDeps.ParamByName('PORCMPREC').Value:= null;
                end
                else
                    if ((RazaAnimal = 4) or (RazaAnimal = 5)) then  //Para Hereford
                    begin
                        if (Trim(EADEPHijasHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('CRIAS').AsInteger := EADEPHijasHereford.GetDato
                        else
                           IBQSPImportarAuxDeps.ParamByName('CRIAS').Value := null;

                        if (Trim(EADEPRodeosHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('RODEO').AsInteger:= EADEPRodeosHereford.GetDato
                        else
                           IBQSPImportarAuxDeps.ParamByName('RODEO').Value:= null;

                        if (Trim(EADEPLMHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPLMHereford.Text)
                        else
                           IBQSPImportarAuxDeps.ParamByName('GESTDEP').Value:= null;

                        if (Trim(EAPRECLMHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('GESTPREC').AsFloat:= EAPRECLMHereford.GetDato
                        else
                           IBQSPImportarAuxDeps.ParamByName('GESTPREC').Value:= null;

                        if (Trim(EADEPPNHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPNHereford.Text)
                         else
                            IBQSPImportarAuxDeps.ParamByName('NACERDEP').Value:= null;

                        if (Trim(EAPRECPNHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('NACERPREC').AsFloat:= EAPRECPNHereford.GetDato
                         else
                           IBQSPImportarAuxDeps.ParamByName('NACERPREC').Value:= null;

                        if (Trim(EADEPPDHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPDHereford.GetDato)
                         else
                           IBQSPImportarAuxDeps.ParamByName('DESTDEP').Value:= null;

                        if (Trim(EAPRECPDHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('DESTPREC').AsFloat:= EAPRECPDHereford.GetDato
                         else
                           IBQSPImportarAuxDeps.ParamByName('DESTPREC').Value:= null;

                        if (Trim(EADEPLecheHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLecheHereford.GetDato)
                         else
                           IBQSPImportarAuxDeps.ParamByName('LECHEDEP').Value:= null;

                        IBQSPImportarAuxDeps.ParamByName('LECHEPREC').Value:= null;

                        if (Trim(EADEPPFHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPPFHereford.GetDato)
                         else
                           IBQSPImportarAuxDeps.ParamByName('FINALDEP').Value:= null;

                        if (Trim(EAPRECPFHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('FINALPREC').AsFloat:= EAPRECPFHereford.GetDato
                         else
                           IBQSPImportarAuxDeps.ParamByName('FINALPREC').Value:= null;

                        if (Trim(EADEPCEHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEHereford.GetDato)
                         else
                           IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

                        if (Trim(EAPRECCEHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('CEPREC').AsFloat:= EAPRECCEHereford.GetDato
                         else
                           IBQSPImportarAuxDeps.ParamByName('CEPREC').Value:= null;

                        if (Trim(EADEPProgEco.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('ALTURADEP').Value:= PasarDepAFloat(EADEPProgEco.GetDato)
                        else
                          IBQSPImportarAuxDeps.ParamByName('ALTURADEP').Value:= null;

                        IBQSPImportarAuxDeps.ParamByName('ALTURAPREC').Value:= null;

                        if (Trim(EADEPGDHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('EGDDEP').AsFloat:= PasarDepAFloat(EADEPGDHereford.GetDato)
                         else
                           IBQSPImportarAuxDeps.ParamByName('EGDDEP').Value:= null;

                        if (Trim(EAPRECGDHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('EGDPREC').AsFloat:= EAPRECGDHereford.GetDato
                         else
                           IBQSPImportarAuxDeps.ParamByName('EGDPREC').Value:= null;

                        if (Trim(EADEPPAHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPPAHereford.GetDato)
                         else
                           IBQSPImportarAuxDeps.ParamByName('EGCDEP').Value:= null;

                        if (Trim(EAPRECPAHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('EGCPREC').AsFloat:= EAPRECPAHereford.GetDato
                         else
                           IBQSPImportarAuxDeps.ParamByName('EGCPREC').Value:= null;

                        if (Trim(EADEPAOBHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOBHereford.GetDato)
                         else
                           IBQSPImportarAuxDeps.ParamByName('AOBDEP').Value:= null;

                        if (Trim(EAPRECAOBHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('AOBPREC').AsFloat:= EAPRECAOBHereford.GetDato
                         else
                           IBQSPImportarAuxDeps.ParamByName('AOBPREC').Value:= null;

                        if (Trim(EADEPProgHereford.Text) <> '') then
                          IBQSPImportarAuxDeps.ParamByName('PORGIDEP').AsFloat:= PasarDepAFloat(EADEPProgHereford.GetDato)
                         else
                           IBQSPImportarAuxDeps.ParamByName('PORGIDEP').Value:= null;

                        IBQSPImportarAuxDeps.ParamByName('PORGIPREC').Value:= null;
                        IBQSPImportarAuxDeps.ParamByName('PORCMDEP').Value:= null;
                        IBQSPImportarAuxDeps.ParamByName('PORCMPREC').Value:= null;
                    end
                    else
                        if ((RazaAnimal = 10)) then //Para Brahman
                        begin
                            if (Trim(EADEPCriasBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('CRIAS').AsInteger := EADEPCriasBrahman.GetDato
                            else
                               IBQSPImportarAuxDeps.ParamByName('CRIAS').Value := null;

                            if (Trim(EADEPCabaniasBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('RODEO').AsInteger:= EADEPCabaniasBrahman.GetDato
                            else
                               IBQSPImportarAuxDeps.ParamByName('RODEO').Value:= null;

                            if (Trim(EADEPAptitudBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPAptitudBrahman.Text)
                            else
                               IBQSPImportarAuxDeps.ParamByName('GESTDEP').Value:= null;

                            if (Trim(EAPRECAptitudBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('GESTPREC').AsFloat:= EAPRECAptitudBrahman.GetDato
                            else
                               IBQSPImportarAuxDeps.ParamByName('GESTPREC').Value:= null;

                            if (Trim(EADEPPesoNacerBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPesoNacerBrahman.Text)
                             else
                                IBQSPImportarAuxDeps.ParamByName('NACERDEP').Value:= null;

                            if (Trim(EAPRECPesoNacerBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('NACERPREC').AsFloat:= EAPRECPesoNacerBrahman.GetDato
                             else
                               IBQSPImportarAuxDeps.ParamByName('NACERPREC').Value:= null;

                            if (Trim(EADEPPesoDestBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPesoDestBrahman.GetDato)
                             else
                               IBQSPImportarAuxDeps.ParamByName('DESTDEP').Value:= null;

                            if (Trim(EAPRECPesoDestBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('DESTPREC').AsFloat:= EAPRECPesoDestBrahman.GetDato
                             else
                               IBQSPImportarAuxDeps.ParamByName('DESTPREC').Value:= null;

                            if (Trim(EADEPLecheBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLecheBrahman.GetDato)
                             else
                               IBQSPImportarAuxDeps.ParamByName('LECHEDEP').Value:= null;

                            IBQSPImportarAuxDeps.ParamByName('LECHEPREC').Value:= null;

                            if (Trim(EADEPPesoFinalBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPPesoFinalBrahman.GetDato)
                             else
                               IBQSPImportarAuxDeps.ParamByName('FINALDEP').Value:= null;

                            if (Trim(EAPRECPesoFinalBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('FINALPREC').AsFloat:= EAPRECPesoFinalBrahman.GetDato
                             else
                               IBQSPImportarAuxDeps.ParamByName('FINALPREC').Value:= null;

                            if (Trim(EADEPCEBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEBrahman.GetDato)
                             else
                               IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

                            if (Trim(EAPRECCEBrahman.Text) <> '') then
                              IBQSPImportarAuxDeps.ParamByName('CEPREC').AsFloat:= EAPRECCEBrahman.GetDato
                             else
                               IBQSPImportarAuxDeps.ParamByName('CEPREC').Value:= null;

                            IBQSPImportarAuxDeps.ParamByName('ALTURADEP').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('ALTURAPREC').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('EGDDEP').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('EGDPREC').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('EGCDEP').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('EGCPREC').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('AOBDEP').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('AOBPREC').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('PORGIDEP').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('PORGIPREC').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('PORCMDEP').Value:= null;
                            IBQSPImportarAuxDeps.ParamByName('PORCMPREC').Value:= null;
                        end
                        else
                            if (RazaAnimal = 7) then //Para Shorthorn
                            begin
                                if (Trim(EADEPCriasShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('CRIAS').AsInteger := EADEPCriasShorthorn.GetDato
                                else
                                   IBQSPImportarAuxDeps.ParamByName('CRIAS').Value := null;

                                if (Trim(EADEPRodeoShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('RODEO').AsInteger:= EADEPRodeoShorthorn.GetDato
                                else
                                   IBQSPImportarAuxDeps.ParamByName('RODEO').Value:= null;

                                if (Trim(EADEPGestShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPGestShorthorn.Text)
                                else
                                   IBQSPImportarAuxDeps.ParamByName('GESTDEP').Value:= null;

                                if (Trim(EAPRECGestShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('GESTPREC').AsFloat:= EAPRECGestShorthorn.GetDato
                                else
                                   IBQSPImportarAuxDeps.ParamByName('GESTPREC').Value:= null;

                                if (Trim(EADEPNacerShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPNacerShorthorn.Text)
                                 else
                                    IBQSPImportarAuxDeps.ParamByName('NACERDEP').Value:= null;

                                if (Trim(EAPRECNacerShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('NACERPREC').AsFloat:= EAPRECNacerShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('NACERPREC').Value:= null;

                                if (Trim(EADEPDestShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPDestShorthorn.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('DESTDEP').Value:= null;

                                if (Trim(EAPRECDestShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('DESTPREC').AsFloat:= EAPRECDestShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('DESTPREC').Value:= null;

                                if (Trim(EADEPLecheShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLecheShorthorn.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('LECHEDEP').Value:= null;

                                if (Trim(EAPRECLecheShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('LECHEPREC').AsFloat:= EAPRECLecheShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('LECHEPREC').Value:= null;

                                if (Trim(EADEPFinalShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPFinalShorthorn.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('FINALDEP').Value:= null;

                                if (Trim(EAPRECFinalShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('FINALPREC').AsFloat:= EAPRECFinalShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('FINALPREC').Value:= null;

                                if (Trim(EADEPCEShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEShorthorn.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

                                if (Trim(EAPRECCEShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('CEPREC').AsFloat:= EAPRECCEShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('CEPREC').Value:= null;

                                if (Trim(EADEPAlturaShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('ALTURADEP').AsFloat:= PasarDepAFloat(EADEPAlturaShorthorn.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('ALTURADEP').Value:= null;

                                if (Trim(EAPRECAlturaShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('ALTURAPREC').AsFloat:= EAPRECAlturaShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('ALTURAPREC').Value:= null;

                                if (Trim(EADEPEGDShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('EGDDEP').AsFloat:= PasarDepAFloat(EADEPEGDShorthorn.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('EGDDEP').Value:= null;

                                if (Trim(EAPRECEGDShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('EGDPREC').AsFloat:= EAPRECEGDShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('EGDPREC').Value:= null;

                                if (Trim(EADEPEGDShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPEGDShorthorn.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('EGCDEP').Value:= null;

                                if (Trim(EAPRECEGCShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('EGCPREC').AsFloat:= EAPRECEGCShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('EGCPREC').Value:= null;

                                if (Trim(EADEPAOBShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOBShorthorn.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('AOBDEP').Value:= null;

                                if (Trim(EAPRECAOBShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('AOBPREC').AsFloat:= EAPRECAOBShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('AOBPREC').Value:= null;

                                if (Trim(EADEPPorcGIShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('PORGIDEP').AsFloat:= PasarDepAFloat(EADEPPorcGIShorthorn.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('PORGIDEP').Value:= null;

                                if (Trim(EAPRECPorcGIShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('PORGIPREC').AsFloat:= EAPRECPorcGIShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('PORGIPREC').Value:= null;

                                if (Trim(EADEPPorcCMShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('PORCMDEP').AsFloat:= PasarDepAFloat(EADEPPorcCMShorthorn.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('PORCMDEP').Value:= null;

                                if (Trim(EAPRECPorcCMShorthorn.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('PORCMPREC').AsFloat:= EAPRECPorcCMShorthorn.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('PORCMPREC').Value:= null;
                            end
                            else
                            begin
                                if (Trim(EACrias.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('CRIAS').AsInteger := EACrias.GetDato
                                else
                                   IBQSPImportarAuxDeps.ParamByName('CRIAS').Value := null;

                                if (Trim(EARodeo.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('RODEO').AsInteger:= EARodeo.GetDato
                                else
                                   IBQSPImportarAuxDeps.ParamByName('RODEO').Value:= null;

                                if (Trim(EADEPGest.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('GESTDEP').AsFloat:= PasarDepAFloat(EADEPGest.Text)
                                else
                                   IBQSPImportarAuxDeps.ParamByName('GESTDEP').Value:= null;

                                if (Trim(EAPrecGest.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('GESTPREC').AsFloat:= EAPrecGest.GetDato
                                else
                                   IBQSPImportarAuxDeps.ParamByName('GESTPREC').Value:= null;

                                if (Trim(EADEPNacer.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPNacer.Text)
                                 else
                                    IBQSPImportarAuxDeps.ParamByName('NACERDEP').Value:= null;

                                if (Trim(EAPrecNacer.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('NACERPREC').AsFloat:= EAPrecNacer.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('NACERPREC').Value:= null;

                                if (Trim(EADEPDest.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPDest.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('DESTDEP').Value:= null;

                                if (Trim(EAPrecDest.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('DESTPREC').AsFloat:= EAPrecDest.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('DESTPREC').Value:= null;

                                if (Trim(EADEPLeche.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPLeche.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('LECHEDEP').Value:= null;

                                if (Trim(EAPrecLeche.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('LECHEPREC').AsFloat:= EAPrecLeche.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('LECHEPREC').Value:= null;

                                if (Trim(EADEPFinal.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('FINALDEP').AsFloat:= PasarDepAFloat(EADEPFinal.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('FINALDEP').Value:= null;

                                if (Trim(EAPrecFinal.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('FINALPREC').AsFloat:= EAPrecFinal.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('FINALPREC').Value:= null;

                                if (Trim(EADEPCE.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCE.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

                                if (Trim(EAPrecCE.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('CEPREC').AsFloat:= EAPrecCE.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('CEPREC').Value:= null;

                                if (Trim(EADEPAltura.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('ALTURADEP').AsFloat:= PasarDepAFloat(EADEPAltura.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('ALTURADEP').Value:= null;

                                if (Trim(EAPrecAltura.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('ALTURAPREC').AsFloat:= EAPrecAltura.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('ALTURAPREC').Value:= null;

                                if (Trim(EADEPEGD.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('EGDDEP').AsFloat:= PasarDepAFloat(EADEPEGD.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('EGDDEP').Value:= null;

                                if (Trim(EAPrecEGD.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('EGDPREC').AsFloat:= EAPrecEGD.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('EGDPREC').Value:= null;

                                if (Trim(EADEPEGC.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPEGC.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('EGCDEP').Value:= null;

                                if (Trim(EAPrecEGC.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('EGCPREC').AsFloat:= EAPrecEGC.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('EGCPREC').Value:= null;

                                if (Trim(EADEPAOB.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOB.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('AOBDEP').Value:= null;

                                if (Trim(EAPrecAOB.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('AOBPREC').AsFloat:= EAPrecAOB.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('AOBPREC').Value:= null;

                                if (Trim(EADEPPorcGI.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('PORGIDEP').AsFloat:= PasarDepAFloat(EADEPPorcGI.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('PORGIDEP').Value:= null;

                                if (Trim(EAPrecPorcGI.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('PORGIPREC').AsFloat:= EAPrecPorcGI.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('PORGIPREC').Value:= null;

                                if (Trim(EADEPPorcCM.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('PORCMDEP').AsFloat:= PasarDepAFloat(EADEPPorcCM.GetDato)
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('PORCMDEP').Value:= null;

                                if (Trim(EAPrecPorcCM.Text) <> '') then
                                  IBQSPImportarAuxDeps.ParamByName('PORCMPREC').AsFloat:= EAPrecPorcCM.GetDato
                                 else
                                   IBQSPImportarAuxDeps.ParamByName('PORCMPREC').Value:= null;
                            end;
       end
       else
         if (FPrincipal.Pais = 2) then // Uruguay
           begin
              IBQSPImportarAuxDeps.ParamByName('ANIO').AsInteger:= StrToInt(EAAnio.Text);
              IBQSPImportarAuxDeps.ParamByName('ANIMAL').AsInteger:= id_animal;
              IBQSPImportarAuxDeps.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['id_animal_externo']);

              if (Trim(EADEPPN.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPN.Text)
               else
                 IBQSPImportarAuxDeps.ParamByName('NACERDEP').Value:= null;


              if (Trim(EAPrecPN.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('NACERPREC').AsFloat:= EAPrecPN.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('NACERPREC').Value:= null;

              if (Trim(EADEPPD.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPD.Text)
               else
                 IBQSPImportarAuxDeps.ParamByName('DESTDEP').Value:= null;

              if (Trim(EAPrecPD.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('DESTPREC').AsFloat:= EAPrecPD.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('DESTPREC').Value:= null;

              if (Trim(EADEPHL.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPHL.Text)
               else
                 IBQSPImportarAuxDeps.ParamByName('LECHEDEP').Value:= null;

              if (Trim(EAPrecHL.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('LECHEPREC').AsFloat:= EAPrecHL.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('LECHEPREC').Value:= null;

              if (Trim(EADEPCEUru.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEUru.Text)
               else
                 IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

              if (Trim(EAPrecCEUru.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('CEPREC').AsFloat:= EAPrecCEUru.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

              if (Trim(EADEPEGCUru.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPEGCUru.Text)
               else
                 IBQSPImportarAuxDeps.ParamByName('EGCDEP').Value:= null;

              if (Trim(EAPrecEGCUru.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('EGCPREC').AsFloat:= EAPrecEGCUru.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('EGCPREC').Value:= null;

              if (Trim(EADEPAOBUru.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOBUru.Text)
               else
                 IBQSPImportarAuxDeps.ParamByName('AOBDEP').Value:= null;

              if (Trim(EAPrecAOBUru.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('AOBPREC').AsFloat:= EAPrecAOBUru.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('AOBPREC').Value:= null;

              if (Trim(EACriador.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('CRIADOR').AsString:= EACriador.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('CRIADOR').Value:= null;

              if (Trim(EACodigoProp.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('CODIGO_PROPIETARIO').AsString:= EACodigoProp.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('CODIGO_PROPIETARIO').Value:= null;

              if (Trim(EANhij.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('NHIJ').AsInteger:= EANhij.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('NHIJ').Value:= null;

              if (Trim(EANhijM.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('NHIJM').AsInteger:= EANhijM.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('NHIJ').Value:= null;

              if (Trim(EANhijU.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('NHIJU').AsInteger:= EANhijU.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('NHIJU').Value:= null;

              IBQSPImportarAuxDeps.ParamByName('DATO_PD').AsString:= '*';

              if (Trim(EADEPP18.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('P18DEP').AsFloat:= PasarDepAFloat(EADEPP18.Text)
               else
                 IBQSPImportarAuxDeps.ParamByName('P18DEP').Value:= null;

              if (Trim(EAPrecP18.Text) <> '') then
                IBQSPImportarAuxDeps.ParamByName('P18PREC').AsFloat:= EAPrecP18.GetDato
               else
                 IBQSPImportarAuxDeps.ParamByName('P18PREC').Value:= null;
           end
         else
             begin
                IBQSPImportarAuxDeps.ParamByName('ANIO').AsInteger:= StrToInt(EAAnio.Text);
                IBQSPImportarAuxDeps.ParamByName('ANIMAL').AsInteger:= id_animal;
                IBQSPImportarAuxDeps.ParamByName('ESTABLECIMIENTO').AsInteger:= FPrincipal.EstabAnimalExterno(IBQAbmSimple.FieldValues['id_animal_externo']);

                if (Trim(EADEPPN.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('NACERDEP').AsFloat:= PasarDepAFloat(EADEPPN.Text)
                 else
                   IBQSPImportarAuxDeps.ParamByName('NACERDEP').Value:= null;


                if (Trim(EAPrecPN.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('NACERPREC').AsFloat:= EAPrecPN.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('NACERPREC').Value:= null;

                if (Trim(EADEPPD.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('DESTDEP').AsFloat:= PasarDepAFloat(EADEPPD.Text)
                 else
                   IBQSPImportarAuxDeps.ParamByName('DESTDEP').Value:= null;

                if (Trim(EAPrecPD.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('DESTPREC').AsFloat:= EAPrecPD.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('DESTPREC').Value:= null;

                if (Trim(EADEPHL.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('LECHEDEP').AsFloat:= PasarDepAFloat(EADEPHL.Text)
                 else
                   IBQSPImportarAuxDeps.ParamByName('LECHEDEP').Value:= null;

                if (Trim(EAPrecHL.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('LECHEPREC').AsFloat:= EAPrecHL.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('LECHEPREC').Value:= null;

                if (Trim(EADEPCEUru.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('CEDEP').AsFloat:= PasarDepAFloat(EADEPCEUru.Text)
                 else
                   IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

                if (Trim(EAPrecCEUru.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('CEPREC').AsFloat:= EAPrecCEUru.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('CEDEP').Value:= null;

                if (Trim(EADEPEGCUru.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('EGCDEP').AsFloat:= PasarDepAFloat(EADEPEGCUru.Text)
                 else
                   IBQSPImportarAuxDeps.ParamByName('EGCDEP').Value:= null;

                if (Trim(EAPrecEGCUru.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('EGCPREC').AsFloat:= EAPrecEGCUru.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('EGCPREC').Value:= null;

                if (Trim(EADEPAOBUru.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('AOBDEP').AsFloat:= PasarDepAFloat(EADEPAOBUru.Text)
                 else
                   IBQSPImportarAuxDeps.ParamByName('AOBDEP').Value:= null;

                if (Trim(EAPrecAOBUru.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('AOBPREC').AsFloat:= EAPrecAOBUru.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('AOBPREC').Value:= null;

                if (Trim(EACriador.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('CRIADOR').AsString:= EACriador.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('CRIADOR').Value:= null;

                if (Trim(EACodigoProp.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('CODIGO_PROPIETARIO').AsString:= EACodigoProp.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('CODIGO_PROPIETARIO').Value:= null;

                if (Trim(EANhij.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('NHIJ').AsInteger:= EANhij.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('NHIJ').Value:= null;

                if (Trim(EANhijM.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('NHIJM').AsInteger:= EANhijM.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('NHIJ').Value:= null;

                if (Trim(EANhijU.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('NHIJU').AsInteger:= EANhijU.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('NHIJU').Value:= null;

                IBQSPImportarAuxDeps.ParamByName('DATO_PD').AsString:= '*';

                if (Trim(EADEPP18.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('P18DEP').AsFloat:= PasarDepAFloat(EADEPP18.Text)
                 else
                   IBQSPImportarAuxDeps.ParamByName('P18DEP').Value:= null;

                if (Trim(EAPrecP18.Text) <> '') then
                  IBQSPImportarAuxDeps.ParamByName('P18PREC').AsFloat:= EAPrecP18.GetDato
                 else
                   IBQSPImportarAuxDeps.ParamByName('P18PREC').Value:= null;
             end;

       IBQSPImportarAuxDeps.ParamByName('TIPO_ANIMAL').AsString:= 'E';
       IBQSPImportarAuxDeps.ParamByName('FUENTE').Value := DBLCBAFuenteDeps.KeyValue;
       IBQSPImportarAuxDeps.ExecSQL;
       
       FPrincipal.IBTPrincipal.CommitRetaining;
     except
        FPrincipal.IBTPrincipal.RollbackRetaining;
     end;



end;

procedure TFABMPadresExternos.DBLCBRazaExternosCloseUp(Sender: TObject);
begin
  inherited;

  RazaAnimal := DBLCBRazaExternos.KeyValue;
end;
procedure TFABMPadresExternos.EBusquedaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
      ActualizarConsultaFiltros;
end;

end.
