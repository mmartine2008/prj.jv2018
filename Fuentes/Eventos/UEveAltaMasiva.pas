unit UEveAltaMasiva;

interface
//{$DEFINE EC}


//{$DEFINE DEMO}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveIndividual, DB, IBCustomDataSet, IBQuery, ActnList, Tabs,
  ComCtrls, StdCtrls, MemoAuto, Buttons, ExtCtrls, UDBDateTimePickerAuto,
  Grids, DBGrids, UBDBGrid, EditAuto, DBCtrls, UDBLookupComboBoxAuto, DateUtils,
  DateTimePickerAuto, IBUpdateSQL, DBClient, DBLocal, DBLocalI, Menus,
  IBStoredProc, UFunctions, WinXP, DataExport, DataToXLS, Mask, cxControls,
  cxSSheet, UEveDiagnosticoGestacion, UEveSimple, UAvanceTerminar,
  JvExExtCtrls, JvExtComponent, JvRollOut, UDMSoftvet, Registry, StrUtils,
  JvGIF, PngImage, JvImage, jpeg, ImgList, PngImageList, JvExControls, Shlobj,
  JvLabel, JvExStdCtrls, JvEdit, JvSwitch, JvEnterTab, Ayuda3, UCartel,
  xmldom, XMLIntf, msxmldom, XMLDoc;

type
  arrSimple = array of String;

  TRegEquivalencias = record
    IE : String;
    RP : String;
  end;

  TRecProductos = record
    id_prod : Integer;
    tipo_t : Integer;
    dosis : double;
    serie : String;
    Vencimiento : TDate;
    grupo : Integer;
  end;

  TArrProductos = Array of TRecProductos;

  TArrEquivalencias = Array of TRegEquivalencias;

type
  TFEveAltaMasiva = class(TFEveIndividual)
    DSGrillaMachos: TDataSource;
    DSGrillaHembras: TDataSource;
    IBSPExistenciaRP: TIBStoredProc;
    Panel1: TPanel;
    Label3: TLabel;
    IBSPCrearGrupo: TIBStoredProc;
    IBSPCrearGrupoIDNUEVOGRUPO: TIntegerField;
    IBQValidaciones: TIBQuery;
    IBQRepetidos: TIBQuery;
    CDSGrillaMachos: TIBDataSet;
    CDSGrillaHembras: TIBDataSet;
    CDSGrillaMachosID_ANIMAL: TIntegerField;
    CDSGrillaMachosID_RP: TIBStringField;
    CDSGrillaMachosFECHA_NACIMIENTO: TDateField;
    CDSGrillaMachosCATEGORIA: TIntegerField;
    CDSGrillaMachosNOMBRE: TIBStringField;
    CDSGrillaMachosV5: TIBStringField;
    CDSGrillaMachosV6: TIBStringField;
    CDSGrillaMachosID_SENASA: TIBStringField;
    CDSGrillaMachosEW: TIBStringField;
    CDSGrillaMachosID_AUX: TIntegerField;
    IBQDeleteAuxAnimales: TIBQuery;
    CDSGrillaMachosDTA: TIBStringField;
    IBSPCambiarCategoria: TIBStoredProc;
    IBQActCUIG: TIBQuery;
    IBQBuscarCUIG: TIBQuery;
    BSacarAnimal: TBitBtn;
    CDSGrillaMachosCRONOLOGIA_DENTARIA: TIntegerField;
    CDSGrillaMachosV3: TIBStringField;
    CDSGrillaMachosCONDICION_CORPORAL: TIntegerField;
    CDSGrillaMachosV2: TIBStringField;
    IBQSPRNRESULT: TIBStringField;
    IBQSPRNMENSAJE: TIBStringField;
    CDSGrillaMachosRODEO: TIntegerField;
    CDSGrillaMachosPOTRERO: TIntegerField;
    CDSGrillaMachosV8: TIBStringField;
    CDSGrillaMachosV7: TIBStringField;
    IBQGenIDAnimal: TIBQuery;
    CDSGrillaMachosVUNO1: TIBStringField;
    CDSGrillaMachosV9: TIBStringField;
    ASacarAnimal: TAction;
    JvDatosGenerales: TJvRollOut;
    GBDatosBiograficos: TGroupBox;
    Label1: TLabel;
    Label8: TLabel;
    CBSexo: TComboBox;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    JVDatosParticulares: TJvRollOut;
    JvDatosComunes: TJvRollOut;
    GBDatosComunes: TGroupBox;
    JvDatosEconomicos: TJvRollOut;
    GBDatosEconomicos: TGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    OpenDlg: TOpenDialog;
    PCGrillas: TPageControl;
    TSHembras: TTabSheet;
    BDBGGrillaHembras: TBitDBGrid;
    TSMachos: TTabSheet;
    BDBGGrillaMachos: TBitDBGrid;
    CDSGrillaMachosTIPO_ALTA: TIBStringField;
    CDSGrillaMachosFECHA_ALTA: TDateField;
    CDSGrillaMachosOBSERVACION: TIBStringField;
    CDSGrillaMachosRESPONSABLE: TIBStringField;
    CDSGrillaMachosPRECIO_UNITARIO: TFloatField;
    CDSGrillaMachosPRECIO_BRUTO: TFloatField;
    CDSGrillaMachosGASTOS: TFloatField;
    CDSGrillaMachosSEXO: TIntegerField;
    BBXlsImport: TBitBtn;
    BAgregarAnimal: TBitBtn;
    SBSelTodos: TSpeedButton;
    CDSGrillaMachosV10: TIBStringField;
    CDSGrillaMachosACTIVIDAD: TIntegerField;
    CDSGrillaMachosID_IE: TIBStringField;
    CDSGrillaMachosID_HBA: TIBStringField;
    CDSGrillaMachosADN: TIBStringField;
    CDSGrillaMachosTIPIFICACION_SANGUINEA: TIBStringField;
    CDSGrillaMachosORIGEN_ANIMAL: TIntegerField;
    CDSGrillaMachosCRIADOR: TIntegerField;
    CDSGrillaMachosPROPIETARIO: TIntegerField;
    CDSGrillaMachosAPODO: TIBStringField;
    CDSGrillaMachosID_PC: TIBStringField;
    CDSGrillaMachosID_RA: TIBStringField;
    CDSGrillaMachosID_OTRO: TIBStringField;
    CDSGrillaMachosV11: TIBStringField;
    CDSGrillaMachosV12: TIBStringField;
    CDSGrillaMachosV13: TIBStringField;
    IBQAgregarExterno: TIBQuery;
    IBQGenIdExterno: TIBQuery;
    CDSGrillaMachosMADRE_BIOLOGICA_INTERNA: TIntegerField;
    CDSGrillaMachosMADRE_BIOLOGICA_EXTERNA: TIntegerField;
    CDSGrillaMachosMADRE_RECEPTORA_INTERNA: TIntegerField;
    CDSGrillaMachosMADRE_RECEPTORA_EXTERNA: TIntegerField;
    CDSGrillaMachosPADRE_INTERNO: TIntegerField;
    CDSGrillaMachosPADRE_EXTERNO: TIntegerField;
    IBQAgregarInterno: TIBQuery;
    CDSAnimales: TIBDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    DateField1: TDateField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IBStringField1: TIBStringField;
    IntegerField8: TIntegerField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IntegerField10: TIntegerField;
    IBStringField10: TIBStringField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    DateField2: TDateField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    IntegerField13: TIntegerField;
    IBStringField18: TIBStringField;
    IntegerField14: TIntegerField;
    IBStringField19: TIBStringField;
    IBStringField20: TIBStringField;
    IBStringField21: TIBStringField;
    IBStringField22: TIBStringField;
    IBStringField23: TIBStringField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IBStringField24: TIBStringField;
    IBStringField25: TIBStringField;
    IBStringField26: TIBStringField;
    IBStringField27: TIBStringField;
    IBStringField28: TIBStringField;
    IBStringField29: TIBStringField;
    IBStringField30: TIBStringField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    DSAnimales: TDataSource;
    CDSGrillaMachosVUNO2: TIBStringField;
    CDSAnimalesVUNO2: TIBStringField;
    CDSGrillaMachosCIRCUNFERENCIA_ESCROTAL: TFloatField;
    CDSAnimalesCIRCUNFERENCIA_ESCROTAL: TFloatField;
    CDSGrillaMachosSUBCATEGORIA: TIntegerField;
    CDSGrillaMachosV14: TIBStringField;
    CDSAnimalesSUBCATEGORIA: TIntegerField;
    CDSAnimalesV14: TIBStringField;
    CDSAnimalesPESO: TFloatField;
    CDSGrillaMachosPESO: TFloatField;
    CDSGrillaHembrasID_AUX: TIntegerField;
    CDSGrillaHembrasCONDICION_CORPORAL: TIntegerField;
    CDSGrillaHembrasCRONOLOGIA_DENTARIA: TIntegerField;
    CDSGrillaHembrasESTADO_LACTACION: TIntegerField;
    CDSGrillaHembrasESTADO_REPRODUCTIVO: TIntegerField;
    CDSGrillaHembrasFECHA_NACIMIENTO: TDateField;
    CDSGrillaHembrasGDR: TIntegerField;
    CDSGrillaHembrasID_ANIMAL: TIntegerField;
    CDSGrillaHembrasID_RP: TIBStringField;
    CDSGrillaHembrasPESO: TFloatField;
    CDSGrillaHembrasVUNO1: TIBStringField;
    CDSGrillaHembrasV9: TIBStringField;
    CDSGrillaHembrasCATEGORIA: TIntegerField;
    CDSGrillaHembrasV1: TIBStringField;
    CDSGrillaHembrasV2: TIBStringField;
    CDSGrillaHembrasV3: TIBStringField;
    CDSGrillaHembrasV4: TIBStringField;
    CDSGrillaHembrasV5: TIBStringField;
    CDSGrillaHembrasV6: TIBStringField;
    CDSGrillaHembrasID_SENASA: TIBStringField;
    CDSGrillaHembrasEW: TIBStringField;
    CDSGrillaHembrasDTA: TIBStringField;
    CDSGrillaHembrasRODEO: TIntegerField;
    CDSGrillaHembrasV8: TIBStringField;
    CDSGrillaHembrasPOTRERO: TIntegerField;
    CDSGrillaHembrasV7: TIBStringField;
    CDSGrillaHembrasTIPO_ALTA: TIBStringField;
    CDSGrillaHembrasFECHA_ALTA: TDateField;
    CDSGrillaHembrasOBSERVACION: TIBStringField;
    CDSGrillaHembrasRESPONSABLE: TIBStringField;
    CDSGrillaHembrasPRECIO_UNITARIO: TFloatField;
    CDSGrillaHembrasPRECIO_BRUTO: TFloatField;
    CDSGrillaHembrasGASTOS: TFloatField;
    CDSGrillaHembrasSEXO: TIntegerField;
    CDSGrillaHembrasV10: TIBStringField;
    CDSGrillaHembrasACTIVIDAD: TIntegerField;
    CDSGrillaHembrasID_IE: TIBStringField;
    CDSGrillaHembrasID_HBA: TIBStringField;
    CDSGrillaHembrasNOMBRE: TIBStringField;
    CDSGrillaHembrasADN: TIBStringField;
    CDSGrillaHembrasTIPIFICACION_SANGUINEA: TIBStringField;
    CDSGrillaHembrasORIGEN_ANIMAL: TIntegerField;
    CDSGrillaHembrasCRIADOR: TIntegerField;
    CDSGrillaHembrasPROPIETARIO: TIntegerField;
    CDSGrillaHembrasAPODO: TIBStringField;
    CDSGrillaHembrasID_PC: TIBStringField;
    CDSGrillaHembrasID_RA: TIBStringField;
    CDSGrillaHembrasID_OTRO: TIBStringField;
    CDSGrillaHembrasV11: TIBStringField;
    CDSGrillaHembrasV12: TIBStringField;
    CDSGrillaHembrasV13: TIBStringField;
    CDSGrillaHembrasMADRE_BIOLOGICA_INTERNA: TIntegerField;
    CDSGrillaHembrasMADRE_BIOLOGICA_EXTERNA: TIntegerField;
    CDSGrillaHembrasMADRE_RECEPTORA_INTERNA: TIntegerField;
    CDSGrillaHembrasMADRE_RECEPTORA_EXTERNA: TIntegerField;
    CDSGrillaHembrasPADRE_INTERNO: TIntegerField;
    CDSGrillaHembrasPADRE_EXTERNO: TIntegerField;
    CDSGrillaHembrasSUBCATEGORIA: TIntegerField;
    CDSGrillaHembrasV14: TIBStringField;
    CDSGrillaMachosINSPECCION: TIntegerField;
    CDSGrillaMachosV15: TIBStringField;
    CDSGrillaMachosDESTINO_CAB: TIntegerField;
    CDSGrillaMachosV16: TIBStringField;
    CDSGrillaMachosMOCHO: TIntegerField;
    CDSGrillaMachosV17: TIBStringField;
    CDSGrillaHembrasINSPECCION: TIntegerField;
    CDSGrillaHembrasV15: TIBStringField;
    CDSGrillaHembrasDESTINO_CAB: TIntegerField;
    CDSGrillaHembrasV16: TIBStringField;
    CDSGrillaHembrasMOCHO: TIntegerField;
    CDSGrillaHembrasV17: TIBStringField;
    CDSAnimalesINSPECCION: TIntegerField;
    CDSAnimalesV15: TIBStringField;
    CDSAnimalesDESTINO_CAB: TIntegerField;
    CDSAnimalesV16: TIBStringField;
    CDSAnimalesMOCHO: TIntegerField;
    CDSAnimalesV17: TIBStringField;
    JvIImpExcel: TJvImage;
    LImpExcel: TLabel;
    ISacarAnimal: TImage;
    LSacarAnimal: TLabel;
    JvIAyuda: TJvImage;
    LAyuda: TLabel;
    IAgregarAnimal: TImage;
    LAgregarAnimal: TLabel;
    CDSAnimalesRAZA: TIntegerField;
    CDSGrillaHembrasRAZA: TIntegerField;
    CDSGrillaMachosRAZA: TIntegerField;
    IBQCategorias: TIBQuery;
    DSCategorias: TDataSource;
    IBQColor: TIBQuery;
    DSColores: TDataSource;
    CDSAnimalesCOLOR: TIntegerField;
    CDSAnimalesNOMCOLOR: TIBStringField;
    CDSGrillaHembrasCOLOR: TIntegerField;
    CDSGrillaHembrasNOMCOLOR: TIBStringField;
    CDSGrillaMachosCOLOR: TIntegerField;
    CDSGrillaMachosNOMCOLOR: TIBStringField;
    LSelTodos: TLabel;
    ISelTodos: TImage;
    IBQActivarRaza: TIBQuery;
    ODElectronico: TOpenDialog;
    IBQExisteEQ: TIBQuery;
    JvIDispElect: TJvImage;
    LDispElect: TLabel;
    GBDatosAlta: TGroupBox;
    LCantidad: TLabel;
    EACantidad: TEditAuto;
    LEdad: TLabel;
    EAEdad: TEditAuto;
    LMeses: TLabel;
    LFechadeAlta: TLabel;
    DTPAFechaAlta: TDateTimePickerAuto;
    LCatMachos: TLabel;
    DBLCBACategoria: TDBLookupComboBoxAuto;
    LTipoAlta: TLabel;
    DBLCBAtipoAlta: TDBLookupComboBoxAuto;
    JvEEdad: TJvEdit;
    JvECantidad: TJvEdit;
    IAceptarDatosAlta: TImage;
    GBDecidirIdentificacion: TGroupBox;
    LNoIdentificar: TLabel;
    LIdentificar: TLabel;
    IConCaravanas: TImage;
    ISinCaravanas: TImage;
    GBIdentificar: TGroupBox;
    GBIdentificacion: TGroupBox;
    RBSenasa: TRadioButton;
    IAceptarIdentificacion: TImage;
    GBDatosRaza: TGroupBox;
    LRaza: TLabel;
    DBLCBARaza: TDBLookupComboBoxAuto;
    LSubcategoria: TLabel;
    DBLCBASubCategoria: TDBLookupComboBoxAuto;
    LColor: TLabel;
    DBLCBAColor: TDBLookupComboBoxAuto;
    LMocho: TLabel;
    DBLCBAMocho: TDBLookupComboBoxAuto;
    IAceptarDatosRaza: TImage;
    RBRp: TRadioButton;
    RBCUIGSenasa: TRadioButton;
    RBReidentificacionSenasa: TRadioButton;
    RBEquivalencias: TRadioButton;
    GBDatosUbicacion: TGroupBox;
    LPotrero: TLabel;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    LRodeo: TLabel;
    DBLCBARodeo: TDBLookupComboBoxAuto;
    LActividad: TLabel;
    DBLCBAActividad: TDBLookupComboBoxAuto;
    IAceptarUbicacion: TImage;
    GBDatosGenerales: TGroupBox;
    LPropietario: TLabel;
    LCriador: TLabel;
    DBLCBACriador: TDBLookupComboBoxAuto;
    DBLCBAPropietario: TDBLookupComboBoxAuto;
    LOrigen: TLabel;
    DBLCBAOrigen: TDBLookupComboBoxAuto;
    IAceptarDatosGenerales: TImage;
    JvEnterAsTab1: TJvEnterAsTab;
    GBDatosExtra: TGroupBox;
    LInspeccion: TLabel;
    DBLCBAInspeccion: TDBLookupComboBoxAuto;
    LDestCab: TLabel;
    DBLCBADestCabania: TDBLookupComboBoxAuto;
    IAceptarDatosExtra: TImage;
    GBDatosParticulares: TGroupBox;
    LGdr: TLabel;
    DBLCBAGdr: TDBLookupComboBoxAuto;
    LEstadoR: TLabel;
    DBLCBAEstadoR: TDBLookupComboBoxAuto;
    Lcircunferencia: TLabel;
    EACircunferenciaEscrotal: TEditAuto;
    LUnidades: TLabel;
    CBCastrado: TCheckBox;
    CBCastracion: TComboBox;
    LCastrado: TLabel;
    IAceptarDatosParticulares: TImage;
    GBDatosVarios: TGroupBox;
    LCondCorporal: TLabel;
    DBLCBACondicionC: TDBLookupComboBoxAuto;
    LCronologiaD: TLabel;
    CBCondicionCorporal: TCheckBox;
    DBLCBACronologiaD: TDBLookupComboBoxAuto;
    Lpeso: TLabel;
    EAPeso: TEditAuto;
    LKgrs: TLabel;
    LDias: TLabel;
    DBLCBATiposPeso: TDBLookupComboBoxAuto;
    IAceptarDatosVarios: TImage;
    GBDatosEcono: TGroupBox;
    LValorTotal: TLabel;
    LValorCompra: TLabel;
    EAValorNeto: TEditAuto;
    LGastos: TLabel;
    LSimboloPorcentaje: TLabel;
    EAPorcentaje: TEditAuto;
    LPorcentaje: TLabel;
    EAValortotal: TEditAuto;
    LValorT: TLabel;
    LValorT2: TLabel;
    IAceptarDatosEconomicos: TImage;
    JEAValortotal: TJvEdit;
    JEAPorcentaje: TJvEdit;
    JEAValorNeto: TJvEdit;
    JEAPeso: TJvEdit;
    JEACircunferenciaEscrotal: TJvEdit;
    GBIdentificarElectronica: TPanel;
    JvIEquivalencias: TJvImage;
    GBReIdentificarSenasa: TPanel;
    EAUltimoIdentReidentificacion: TMaskEdit;
    EAEncabezadoReidentificacion: TMaskEdit;
    Lr: TLabel;
    GBIdentificarSenasa: TPanel;
    EAEncabezado: TMaskEdit;
    EAUltimoIdent: TMaskEdit;
    LCUIGPropio: TLabel;
    CBCUIGPropio: TCheckBox;
    DBLCBACUIGPropio: TDBLookupComboBoxAuto;
    GBIdentificarRP: TPanel;
    LRpInicial: TLabel;
    EAPrefijo: TEditAuto;
    EARpInicial: TEditAuto;
    EASufijo: TEditAuto;
    LLeyenda: TLabel;
    LRpAnimal: TLabel;
    LCuigSenasa: TLabel;
    LReidentificacionSenasa: TLabel;
    LCaravanasElectronicas: TLabel;
    IBQGetUltimoRodeo: TIBQuery;
    IBQGetUltimoPotrero: TIBQuery;
    IBQVisibleRod: TIBQuery;
    IBQVisiblePot: TIBQuery;
    PanelIzq: TPanel;
    ISubirIzq: TImage;
    IBajarIzq: TImage;
    IBarraVertIzq: TImage;
    IBarraHorIzq: TImage;
    SBBarrita: TScrollBar;
    PanelDer: TPanel;
    ISubirDer: TImage;
    IBajarDer: TImage;
    IBarraVertDer: TImage;
    IBarraHorDer: TImage;
    TimerBarra: TTimer;
    LEstadoLactacion: TLabel;
    EAEstadoLactacion: TEditAuto;
    LDta: TLabel;
    EADta: TEditAuto;
    JvEAEstadoLactacion: TJvEdit;
    IAceptarRpNoPres: TImage;
    ICaravanasElecNoPres: TImage;
    IReIDNoPres: TImage;
    ICuigNoPres: TImage;
    IAceptarRpSiPres: TImage;
    ICaravanasElecSiPres: TImage;
    IReIDSiPres: TImage;
    ICuigSiPres: TImage;
    JvEADta: TJvEdit;
    LCuigCargados: TLabel;
    EAVerificador: TEdit;
    ICarOficialSiPres: TImage;
    ICarOficialNoPres: TImage;
    EACarOficial: TEditAuto;
    IBQParametroDeTerceros: TIBQuery;
    PAVacaVaquillona: TPanelAyudaHuella3;
    JvImage21: TJvImage;
    JvImage22: TJvImage;
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
    Label171: TLabel;
    Label172: TLabel;
    CheckBox10: TCheckBox;
    PATernera: TPanelAyudaHuella3;
    JvImage23: TJvImage;
    JvImage24: TJvImage;
    Label173: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    Label176: TLabel;
    Label177: TLabel;
    Label178: TLabel;
    Label179: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    CheckBox11: TCheckBox;
    PAPlanillaAM: TPanelAyudaHuella3;
    JvImage29: TJvImage;
    Label212: TLabel;
    JvImage30: TJvImage;
    Label213: TLabel;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    JvImage60: TJvImage;
    Label242: TLabel;
    CheckBox14: TCheckBox;
    PAParticularToro: TPanelAyudaHuella3;
    JvImage19: TJvImage;
    JvImage20: TJvImage;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    CheckBox9: TCheckBox;
    PAParticularTerNov: TPanelAyudaHuella3;
    JvImage17: TJvImage;
    JvImage18: TJvImage;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    CheckBox8: TCheckBox;
    PANombreGrupo: TPanelAyudaHuella3;
    JvImage31: TJvImage;
    JvImage32: TJvImage;
    Label222: TLabel;
    Label223: TLabel;
    Label224: TLabel;
    Label225: TLabel;
    Label226: TLabel;
    Label227: TLabel;
    JvImage33: TJvImage;
    Label228: TLabel;
    Label229: TLabel;
    CheckBox15: TCheckBox;
    PANoIdentificar: TPanelAyudaHuella3;
    JvImage6: TJvImage;
    JvImage7: TJvImage;
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
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    CheckBox2: TCheckBox;
    PAIdentificar: TPanelAyudaHuella3;
    JvImage11: TJvImage;
    JvImage12: TJvImage;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label82: TLabel;
    CheckBox4: TCheckBox;
    PAIdentificacion: TPanelAyudaHuella3;
    JvImage1: TJvImage;
    JvImage2: TJvImage;
    JvImage3: TJvImage;
    JvImage4: TJvImage;
    Label23: TLabel;
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
    CheckBox1: TCheckBox;
    PAFinGuardar: TPanelAyudaHuella3;
    JvImage39: TJvImage;
    JvImage40: TJvImage;
    Label240: TLabel;
    Label241: TLabel;
    CheckBox18: TCheckBox;
    PAFinalizarCM: TPanelAyudaHuella3;
    JvImage34: TJvImage;
    La: TLabel;
    Label232: TLabel;
    Label233: TLabel;
    Label234: TLabel;
    Label235: TLabel;
    JvImage36: TJvImage;
    Label236: TLabel;
    Label237: TLabel;
    JvImage37: TJvImage;
    CheckBox16: TCheckBox;
    PADatosUbicacion: TPanelAyudaHuella3;
    JvImage9: TJvImage;
    JvImage10: TJvImage;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label81: TLabel;
    CheckBox3: TCheckBox;
    PADatosIndent: TPanelAyudaHuella3;
    JvImage13: TJvImage;
    Label103: TLabel;
    Label104: TLabel;
    JvImage14: TJvImage;
    Label105: TLabel;
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
    Label106: TLabel;
    CheckBox5: TCheckBox;
    PADatosGral: TPanelAyudaHuella3;
    JvImage15: TJvImage;
    Label84: TLabel;
    JvImage16: TJvImage;
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
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    CheckBox7: TCheckBox;
    PADatosEcon: TPanelAyudaHuella3;
    JvImage27: TJvImage;
    Label194: TLabel;
    JvImage28: TJvImage;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    Label201: TLabel;
    Label202: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    Label205: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    JvImage44: TJvImage;
    CheckBox13: TCheckBox;
    PADatosCom: TPanelAyudaHuella3;
    JvImage25: TJvImage;
    Label170: TLabel;
    Label182: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    JvImage26: TJvImage;
    Label186: TLabel;
    Label187: TLabel;
    Label188: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label193: TLabel;
    CheckBox12: TCheckBox;
    PADatosAlta: TPanelAyudaHuella3;
    JvImage58: TJvImage;
    JvImage59: TJvImage;
    Label80: TLabel;
    Label83: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    CheckBox6: TCheckBox;
    PAAMExcel: TPanelAyudaHuella3;
    JvImage35: TJvImage;
    JvImage38: TJvImage;
    Label230: TLabel;
    Label231: TLabel;
    Label238: TLabel;
    Label239: TLabel;
    CheckBox17: TCheckBox;
    ILVets: TImageList;
    IBQSysProtocoloInicial: TIBQuery;
    IBQInsertarDatos: TIBQuery;
    IBQSPTratamientos: TIBQuery;
//******************************************************//
//	INCIDENCIA: 401									                    //
//	INICIO Declaración nuevos elementos en formulario.  //
//	       Declaración nuevos elementos en grillas.     //
//	Carla Gareis							              28/11/2014  //
//******************************************************//
    LInformadoAfip: TLabel;
    CBInformadoAfip: TComboBox;
    CDSAnimalesINFORMADO_AFIP: TIBStringField;
    CDSGrillaMachosINFORMADO_AFIP: TIBStringField;
    CDSGrillaHembrasINFORMADO_AFIP: TIBStringField;
    SDEquivalencias: TSaveDialog;

//******************************************************//
//	INCIDENCIA: 401									                    //
//	FIN Declaración nuevos elementos en el formulario.  //
//	    Declaración nuevos elementos en grillas.        //
//	Carla Gareis							              28/11/2014  //
//******************************************************//


    {#1 INICIO 02/12/2014 Matias Rizzi}
    ODExcel: TOpenDialog;
    MAuxCaravanas: TMemoAuto;
    EADTE: TEditAuto;
    LDTE: TLabel;
    BExaminarDTE: TButton;
    ODExaminarDTE: TOpenDialog;
    IBQActualizarDte: TIBQuery;
    IBQActualizarDteDTE: TIntegerField;
    IBQActualizarDtePATH: TIBStringField;
    EditAuto1: TEditAuto;
    CDSGrillaMachosCARAVANA_OFICIAL: TIBStringField;
    CDSGrillaHembrascaravana_oficial: TStringField;
    UBQExisteEQ: TIBQuery;
    PMMarcasLector: TPopupMenu;
    Allflex1: TMenuItem;
    Datamars1: TMenuItem;
    Baqueano1: TMenuItem;
    XMLDoc: TXMLDocument;
    CDSAnimalesCARAVANA_OFICIAL: TIBStringField;
    {#1 FIN 02/12/2014 Matias Rizzi}

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Change(Sender: TField);
    procedure CBSexoChange(Sender: TObject);
    procedure CargarParametrosSP;override;
    procedure ATerminarExecute(Sender: TObject);
    procedure DBLCBACategoriaClick(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure ASiguienteExecute(Sender: TObject);
    procedure EACantidadExit(Sender: TObject);
    procedure EARpInicialExit(Sender: TObject);
    procedure RBSenasaClick(Sender: TObject);
    procedure RBRpClick(Sender: TObject);
    procedure EARpInicialKeyPress(Sender: TObject; var Key: Char);
    procedure EACantidadKeyPress(Sender: TObject; var Key: Char);
    procedure EAPesoKeyPress(Sender: TObject; var Key: Char);
    procedure EAEdadKeyPress(Sender: TObject; var Key: Char);
    procedure EAEstadoLactacionKeyPress(Sender: TObject; var Key: Char);
    procedure EACircunferenciaEscrotalKeyPress(Sender: TObject;
      var Key: Char);
    procedure CDSGrillaHembrasV1SetText(Sender: TField;
      const Text: String);
    procedure CDSGrillaMachosV5SetText(Sender: TField; const Text: String);
    procedure EAEdadExit(Sender: TObject);
    procedure ControlReales(Sender: TObject; var Key: Char);
    procedure ActualizarValor(Sender: TObject);
    procedure AAnteriorExecute(Sender: TObject);
    procedure EARpInicialChange(Sender: TObject);
    procedure EACantidadChange(Sender: TObject);
    procedure DBLCBACatMachosClick(Sender: TObject);
    procedure SetText(Sender: TField; const Text: String);
    procedure Pintar(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function ChequearRN(grilla: TBitDBGrid;var Data: TDataSource): boolean;
    procedure EACircunferenciaEscrotalExit(Sender: TObject);
    procedure CBCondicionCorporalClick(Sender: TObject);
    procedure CBCondicionCorporalKeyPress(Sender: TObject; var Key: Char);
    procedure EAPesoExit(Sender: TObject);
    procedure RBCUIGSenasaClick(Sender: TObject);
    procedure CBCUIGPropioClick(Sender: TObject);
    procedure DBLCBACUIGPropioCloseUp(Sender: TObject);
    procedure EAEncabezadoChange(Sender: TObject);
    procedure EAUltimoIdentChange(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    procedure BDBGGrillaHembrasCellClick(Column: TColumn);
    procedure DBLCBAtipoAltaKeyPress(Sender: TObject; var Key: Char);
    procedure DTPAFechaAltaKeyPress(Sender: TObject; var Key: Char);
    procedure EAPrefijoKeyPress(Sender: TObject; var Key: Char);
    procedure EASufijoKeyPress(Sender: TObject; var Key: Char);
    procedure CBSexoKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAPotreroKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARodeoKeyPress(Sender: TObject; var Key: Char);
    procedure EADtaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAResponsableKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBACatMachosKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBACategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAEstadoRKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAGdrKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBACondicionCKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBACronologiaDKeyPress(Sender: TObject; var Key: Char);
    procedure EAEncabezadoKeyPress(Sender: TObject; var Key: Char);
    procedure EAUltimoIdentKeyPress(Sender: TObject; var Key: Char);
    procedure CDSGrillaMachosFECHA_NACIMIENTOSetText(Sender: TField;
      const Text: String);
    procedure CDSGrillaHembrasFECHA_NACIMIENTOSetText(Sender: TField;
      const Text: String);
    procedure DBLCBACronologiaDCloseUp(Sender: TObject);
    procedure DBLCBAtipoAltaCloseUp(Sender: TObject);
    procedure DTPAFechaAltaChange(Sender: TObject);
    procedure LCUIGPropioClick(Sender: TObject);
    procedure LCUIGPropioMouseEnter(Sender: TObject);
    procedure LCUIGPropioMouseLeave(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label8MouseEnter(Sender: TObject);
    procedure Label8MouseLeave(Sender: TObject);
    procedure LPotreroClick(Sender: TObject);
    procedure LPotreroMouseEnter(Sender: TObject);
    procedure LPotreroMouseLeave(Sender: TObject);
    procedure LRodeoClick(Sender: TObject);
    procedure LRodeoMouseEnter(Sender: TObject);
    procedure LRodeoMouseLeave(Sender: TObject);
    procedure DBLCBATiposPesoCloseUp(Sender: TObject);
    procedure EAPesoChange(Sender: TObject);
    procedure CDSGrillaMachosPESOSetText(Sender: TField;
      const Text: String);
    procedure EAValorNetoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGGrillaMachosCellClick(Column: TColumn);
    procedure ASacarAnimalExecute(Sender: TObject);
    procedure DBLCBACategoriaCloseUp(Sender: TObject);
    procedure EAEstadoLactacionExit(Sender: TObject);
    procedure EAEstadoLactacionChange(Sender: TObject);
    procedure BBXlsImportClick(Sender: TObject);
    procedure PCGrillasChange(Sender: TObject);
    procedure BAgregarAnimalClick(Sender: TObject);
    procedure BDBGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBSelTodosClick(Sender: TObject);
    procedure GetEvent(Sender : TObject);
    procedure PCBasicoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure DBLCBAEstadoRExit(Sender: TObject);
    procedure CDSGrillaHembrasPESOSetText(Sender: TField;
      const Text: String);
    procedure LActividadClick(Sender: TObject);
    procedure LActividadMouseEnter(Sender: TObject);
    procedure LActividadMouseLeave(Sender: TObject);
    procedure LOrigenMouseEnter(Sender: TObject);
    procedure LOrigenMouseLeave(Sender: TObject);
    procedure RBReidentificacionSenasaClick(Sender: TObject);
    procedure EAEncabezadoReidentificacionChange(Sender: TObject);
    procedure EAUltimoIdentReidentificacionChange(Sender: TObject);
    procedure DTPAFechaAltaExit(Sender: TObject);
    procedure LOrigenClick(Sender: TObject);
    procedure LCriadorMouseEnter(Sender: TObject);
    procedure LCriadorMouseLeave(Sender: TObject);
    procedure LCriadorClick(Sender: TObject);
    procedure LPropietarioMouseEnter(Sender: TObject);
    procedure LPropietarioMouseLeave(Sender: TObject);
    procedure LPropietarioClick(Sender: TObject);
    procedure DBLCBACatMachosCloseUp(Sender: TObject);
    procedure CBSexoCloseUp(Sender: TObject);
    procedure CDSGrillaMachosVUNO2Change(Sender: TField);
    procedure CDSGrillaHembrasOBSERVACIONSetText(Sender: TField;
      const Text: String);
    procedure CBSexoClick(Sender: TObject);
    procedure DBLCBARazaCloseUp(Sender: TObject);
    procedure LSubcategoriaMouseLeave(Sender: TObject);
    procedure LSubcategoriaMouseEnter(Sender: TObject);
    procedure LSubcategoriaClick(Sender: TObject);
    procedure CDSGrillaMachosPESOChange(Sender: TField);
    procedure BDBGGrillaMachosKeyPress(Sender: TObject; var Key: Char);
    procedure BDBGGrillaHembrasKeyPress(Sender: TObject; var Key: Char);
    procedure BDBGGrillaHembrasColEnter(Sender: TObject);
    procedure BDBGGrillaMachosColEnter(Sender: TObject);
    procedure RBEquivalenciasClick(Sender: TObject);
    procedure JvIEquivalenciasClick(Sender: TObject);
    procedure JvIDispElectClick(Sender: TObject);
    procedure JvECantidadChange(Sender: TObject);
    procedure JvEEdadChange(Sender: TObject);
    procedure IAceptarDatosAltaClick(Sender: TObject);
    procedure IConCaravanasClick(Sender: TObject);
    procedure LRpAnimalClick(Sender: TObject);
    procedure LCuigSenasaClick(Sender: TObject);
    procedure LReidentificacionSenasaClick(Sender: TObject);
    procedure LCaravanasElectronicasClick(Sender: TObject);
    procedure IAceptarIdentificacionClick(Sender: TObject);
    procedure IAceptarDatosRazaClick(Sender: TObject);
    procedure IAceptarUbicacionClick(Sender: TObject);
    procedure IAceptarDatosGeneralesClick(Sender: TObject);
    procedure IAceptarDatosExtraClick(Sender: TObject);
    procedure IAceptarDatosParticularesClick(Sender: TObject);
    procedure IAceptarDatosVariosClick(Sender: TObject);
    procedure IAceptarDatosEconomicosClick(Sender: TObject);
    procedure JEAValorNetoChange(Sender: TObject);
    procedure JEAPorcentajeChange(Sender: TObject);
    procedure JEAValortotalChange(Sender: TObject);
    procedure JEAPesoChange(Sender: TObject);
    procedure JEACircunferenciaEscrotalChange(Sender: TObject);
    procedure CBCastracionChange(Sender: TObject);
    procedure LInspeccionClick(Sender: TObject);
    procedure LInspeccionMouseEnter(Sender: TObject);
    procedure LInspeccionMouseLeave(Sender: TObject);
    procedure LDestCabClick(Sender: TObject);
    procedure LDestCabMouseEnter(Sender: TObject);
    procedure LDestCabMouseLeave(Sender: TObject);
    procedure ISubirIzqClick(Sender: TObject);
    procedure IBajarIzqClick(Sender: TObject);
    procedure ISubirDerClick(Sender: TObject);
    procedure IBajarDerClick(Sender: TObject);
    procedure IBarraHorDerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure IBarraHorDerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
//    procedure IBarraHorDerMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure IBarraVertDerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//    procedure IBarraVertDerMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure IBarraVertIzqMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IBarraVertIzqMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IBarraHorIzqMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IBarraHorIzqMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure IBarraHorIzqMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ISinCaravanasClick(Sender: TObject);
    procedure JvEAEstadoLactacionChange(Sender: TObject);
    procedure TimerBarraTimer(Sender: TObject);
    procedure IAceptarRpNoPresClick(Sender: TObject);
    procedure IAceptarRpSiPresClick(Sender: TObject);
    procedure ICuigNoPresClick(Sender: TObject);
    procedure ICuigSiPresClick(Sender: TObject);
    procedure ICaravanasElecSiPresClick(Sender: TObject);
    procedure ICaravanasElecNoPresClick(Sender: TObject);
    procedure IReIDNoPresClick(Sender: TObject);
    procedure IReIDSiPresClick(Sender: TObject);
    procedure JvEADtaChange(Sender: TObject);
    procedure EAVerificadorChange(Sender: TObject);
    procedure CDSGrillaMachosID_RPChange(Sender: TField);
    procedure CDSGrillaHembrasID_RPChange(Sender: TField);
    procedure EAUltimoIdentExit(Sender: TObject);
    procedure ICarOficialSiPresClick(Sender: TObject);
    procedure ICarOficialNoPresClick(Sender: TObject);

    procedure JvImage58Click(Sender: TObject);
    procedure JvImage2Click(Sender: TObject);
    procedure JvImage6Click(Sender: TObject);
    procedure JvImage9Click(Sender: TObject);
    procedure JvImage13Click(Sender: TObject);
    procedure JvImage11Click(Sender: TObject);
    procedure JvImage15Click(Sender: TObject);
    procedure JvImage21Click(Sender: TObject);
    procedure JvImage23Click(Sender: TObject);
    procedure JvImage17Click(Sender: TObject);
    procedure JvImage19Click(Sender: TObject);
    procedure JvImage26Click(Sender: TObject);
    procedure JvImage27Click(Sender: TObject);
    procedure JvImage30Click(Sender: TObject);
    procedure JvImage31Click(Sender: TObject);
    procedure PAFinalizarCMClick(Sender: TObject);
    procedure JvImage35Click(Sender: TObject);
    procedure JvImage39Click(Sender: TObject);
    procedure JvImage34Click(Sender: TObject);
    procedure BExaminarDTEClick(Sender: TObject);
    procedure EACarOficialChange(Sender: TObject);
    procedure Allflex1Click(Sender: TObject);
    procedure Datamars1Click(Sender: TObject);
    procedure Baqueano1Click(Sender: TObject);
  private
    UltimoIdentUsado, PrimerIdentificador : String;
    IdentCUIG : String;
    IdentReidentificacion : String;
    DiasPeso : String;
    cargaXLS:boolean;
    sexo,ind:integer;
    pag:Variant;
    obs:String;
    punitario:String;
    pbruto:String;
    agregar,apretado:boolean;
    CantComps : Integer;
    ArrComponents : TEventComponent;
    listaCats:TStringList;
    senasaValido: Boolean;

    cargaEQ : Boolean;
    Productos : TArrProductos;
    IniP, IniPos : TPoint;
    Pressed : Boolean;
    PesoProm : Double;
    CantPesoProm : Integer;


    informar: integer;
    cant: integer;
    {#1 INICIO 02/12/2014 Matias Rizzi}
    archivo_Importacion:string;
    {#1 FIN 02/12/2014 Matias Rizzi}

    procedure RealizarDiagnostico();
    procedure RealizarRevisacion();
    function ControlarRP:Boolean;
    procedure GeneraGrilla;
    procedure cambiarGrilla;
    procedure CargarPickListEnGrilla;
    procedure PaintRequired;
    procedure FillPickList(const campo: string; const Qry: TDataSet);
    procedure CambioCategoriaHembras;
    procedure ChequearCampoEnGrilla(Campo: string; Valor: string; ValAnterior:string );
    procedure VerificarRepetidos;
    procedure VerificarRepetidosEnExcel;
    procedure controlCondicionCorporal;
    procedure ActualizarCUIG(var Identificador : String; cant : integer);
    function CompletarRP (Valor : Integer) : String;
    function completarEdadCD(cronodentaria:Integer):Integer;//Integer;devuelve los meses a partir de la cronología dentaria
//    function controlarCuig(IdentCUIG : String):Boolean;
    function controlarReidentificacion(IdentReidentificacion : String):Boolean;
    procedure BorrarSeleccion(dataSet:TIBDataSet; grilla:TBitDBGrid);
    procedure RealizarCambio(Component : TComponent;CamposBD : array of TField; ValoresCamposBD : array of Variant);
    function RegistroCambio(Component : TComponent) : Boolean;
    function ExistComponent(Component : TComponent) : Boolean;
    //function pertenece(valor:string;arreglo:arrSimple):boolean;
    procedure actualizarRP(id:integer;rp:string);
    function diagnostico:boolean;
    function revisacionToros : boolean;
    function informarAfip: boolean;
    procedure actualizarEdades;
    function BuscarRepetidos(ident:string;campo:string):integer;
    function agregarExterno(tipo:string;sexo:integer;i:integer):integer;
    function agregarInterno(tipo:string;sexo:integer;i:integer):integer;
    procedure cargarPadres(DS:TIBDataSet;i:integer);
    procedure altaExternos;
    procedure AsignarMetodo();
    procedure CambiarValorColumna(Column: TColumn);
    procedure CargarSubCategoriasporRaza();
    procedure AcomodarPanelPorRaza;
    procedure CargarEquivalencias(DireccionArch : String);
    procedure CargarIdentVesta(DireccionArch : String);
    procedure CargarDesdeExcel(DireccionArch : String);

    procedure RetornarTopLeft(H,W,hy,wy : integer; var tope:integer; var izq:integer);
    procedure DisminuirGroup(gb : TGroupBox);
    procedure DisminuirPanel(gb : TPanel);
    procedure RedibujarPanelDatosAlta;
    procedure RedibujarPanelDatosIdentificacion;
    procedure RedibujarPanelDatosRaza;
    procedure RedibujarPanelDatosUbicacion;
    procedure RedibujarPanelDatosGenerales;
    procedure RedibujarPanelDatosExtra;
    procedure RedibujarPanelDatosParticulares;
    procedure RedibujarPanelDatosVarios;
    procedure RedibujarPanelDatosEco;

    procedure RedibujarAuxiliar;
    procedure ResetearComponentes(gb : TGroupBox);

    procedure RedibujarPanelesIdentificacion;

    function GetPosicionPanel(reg : integer) : integer;
    function GetPosicionGrilla(top : integer) : integer;
    function GetNavegacion(valor : integer) : integer;

    procedure CalcularIncremento(valor : integer);
    procedure AjustarPanelesLaterales;
    procedure LimpiarGroups;

    procedure CargarTopImgHints(Itop: String);
    procedure CargarCenterImgHints(ICenter: String);
    procedure CargarBottomImgHints(IBottom: String);

    //******************************************************//
    //	INCIDENCIA: 401									                    //
    //	INICIO Declaración de nuevos métodos.               //
    //	Carla Gareis							              23/12/2014  //
    //******************************************************//
    procedure actualizarDatosDTE();
    procedure CrearCopiaArchivo();

   
    //******************************************************//
    //	INCIDENCIA: 401									                    //
    //	FIN Declaración de nuevos métodos.                  //
    //	Carla Gareis							              23/12/2014  //
    //******************************************************//

  protected
    prueba : integer;
    RpGenerados : Boolean;
    SQLStringList: TStringList;
    FNombreGrupo: String;
    FTipoEvento: integer;
    PuedeEliminar: Boolean;
    permitir:boolean;
    Errores, Warnings : Integer;
    IDatos, IDatosA, IGrilla, IGrillaA : TBitmap;
    procedure CargarTratamientos;
    procedure LoadSQLStringList;
    procedure ControlEventoOnExit(Sender: TObject); override;
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
    procedure cargarNuevos(i:integer);

    function validarDatosAnimales(i:integer):string;
    function ObtenerFilaPrimerDato(DireccionArch : String): Integer;
    procedure importar;
    procedure mostrarCaravanas;
    procedure CargarDesdeXML(arch:TFileName);
    procedure habilitarSiguiente(estado:boolean);

    procedure cargarMachosNuevos(i:integer; var CDSGrilla: TIBDataSet);
    procedure cargarHembrasNuevas(i:integer; var CDSGrilla: TIBDataSet);
    procedure cargarAnimalesGeneral(i, sexo:integer;
                                    aux_rp, categoriaAnimal: string;
                                    var CDSGrilla: TIBDataSet; var BDBGGrilla: TBitDBGrid);
		procedure cargarAnimalesGeneralPeso(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralCategoria(i, sexo:integer; categoriaAnimal: string; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralColor(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralRaza(i:integer; var CDSGrilla: TIBDataSet; var BDBGGrilla: TBitDBGrid);
		procedure cargarAnimalesGeneralIdentificadores(aux_rp: string; i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralNombre(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralCondicion(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralPotrero(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralDTA(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralFechaNac(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralSexo(i, sexo:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralRodeo(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralActividad(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralTipoAlta(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralResponsable(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralPrecio(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralVarios(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralOrigen(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralCriador(i:integer; var CDSGrilla: TIBDataSet);
		procedure cargarAnimalesGeneralPropietario(i:integer; var CDSGrilla: TIBDataSet);

  public
    edadVaca,edadVaquillona,edadTernera,edadTernero,edadNovillo,edadToro:integer;
    altaDesdeEvento : Boolean;
    Equivalencias : TArrEquivalencias;
    identElectronica : Boolean;
    { Public declarations }

  end;

var
  FEveAltaMasiva: TFEveAltaMasiva;
  arrNuevos:arrSimple;

  AlturaAcum, AlturaTotal, cod_verificador : integer;
  alineado, identRp, identSenasa, identReidentSenasa, ident_apretado, identCUIGSenasa, identCarOficial, mostrarEspecificos, identifica : boolean;
  primeraCL, segundaCL, terceraCL, cuartaCL : integer;
  primeraCC, segundaCC, terceraCC, cuartaCC : integer;
  cOficial : integer;

  //******************************************************//
  //	INCIDENCIA: 401									                    //
  //	INICIO Declaración de variables.                    //
  //	Carla Gareis							              23/12/2014  //
  //******************************************************//
  nomDestino : String;
  archivo : String;
  nro_grupo : Integer;
  pathOrigen : String;
  arcEquivalenciasTxt : TextFile;
  arcEquivalenciasXls : TextFile;
  LineaauxTxt : String;
  LineaauxXls : String;
  CantAnim : Integer;
  //******************************************************//
  //	INCIDENCIA: 401									                    //
  //	FIN Declaración de variables.                       //
  //	Carla Gareis							              23/12/2014  //
  //******************************************************//

implementation

uses UPrincipal,UClassType, UNombreGrupo, UMensajeHuella, UABMModificarCUIG,UMensajesNacimientos,
     UABMEmpleados, UABMPotreros, UABMSimple, UABMRodeos, ComObj,UMovCargarDatos,
     UImportacion, UMensajeNuevos, UMensajeEdades, UABMActividad, UABMOrigen,
     UAbmPadresExternos, UABMCriador, UABMPropietarioAnimal, UABMSubcategorias, UTraduccion,
     UABMInspeccion, UABMDestCabania, UImpExpExcel, UCargaTratsInic, UConfigProInic, UPanelCaravanas,
     UEveEvalClinicaToros, uTiposGlobales;

{$R *.dfm}

procedure TFEveAltaMasiva.AcomodarPanelPorRaza;
var I : Integer;
begin

  LMocho.Visible := false;
  DBLCBAMocho.Visible := false;
{
  LInspeccion.Visible := false;
  LDestCab.Visible := false;
  DBLCBAInspeccion.Visible := false;
  DBLCBADestCabania.Visible := false;
}

  mostrarEspecificos := false;

  DBLCBAMocho.KeyValue := null;
  DBLCBAInspeccion.KeyValue := null;
  DBLCBADestCabania.KeyValue := null;
  I := DBLCBARaza.KeyValue;
  JvDatosGenerales.Height := 289;

  if (I in [2,3,29,12,28,30,10]) then
  begin
       LColor.Enabled := true;
       DBLCBAColor.Enabled := true;
       IBQColor.Close;
       IBQColor.ParamByName('r').AsInteger := I;
       IBQColor.Open;
       IBQColor.Last;
       IBQColor.First;
  end
  else
  begin
       LColor.Enabled := false;
       DBLCBAColor.Enabled := false;
  end;

  if (I in [2,3,12,28,29,11,10,5,30]) and FPrincipal.FuncActividad then
  begin
    JvDatosGenerales.Height := 289;
    BDBGGrillaMachos.Columns[6].Visible := true;
    BDBGGrillaHembras.Columns[6].Visible := true;
    DBLCBAMocho.KeyValue := 0;
    if I <> 5 then
    begin
      LInspeccion.Visible := true;
      LDestCab.Visible := true;
      DBLCBAInspeccion.Visible := true;
      DBLCBADestCabania.Visible := true;
      BDBGGrillaMachos.Columns[7].Visible := true;
      BDBGGrillaMachos.Columns[8].Visible := true;
      BDBGGrillaHembras.Columns[7].Visible := true;
      BDBGGrillaHembras.Columns[8].Visible := true;
      DBLCBAInspeccion.KeyValue := 0;
      DBLCBADestCabania.KeyValue := 0;

      mostrarEspecificos := true;
      if (LRaza.Font.Size = 9) then
      begin
           LMocho.Font.Size := 9;
           DBLCBAMocho.Font.Size := 9;
      end;
    end
    else
    begin
      LInspeccion.Visible := false;
      LDestCab.Visible := false;
      DBLCBAInspeccion.Visible := false;
      DBLCBADestCabania.Visible := false;
      BDBGGrillaMachos.Columns[7].Visible := false;
      BDBGGrillaMachos.Columns[8].Visible := false;
      BDBGGrillaHembras.Columns[7].Visible := false;
      BDBGGrillaHembras.Columns[8].Visible := false;
      DBLCBAInspeccion.KeyValue := null;
      DBLCBADestCabania.KeyValue := null;
    end;
    LMocho.Visible := true;
    DBLCBAMocho.Visible := true;
  end;
  DMSoftvet.IBQMocho.Close;
  DMSoftvet.IBQMocho.ParamByName('raza').AsInteger := I;
  DMSoftvet.IBQMocho.Open;

  if (GBDatosExtra.Visible) then
    if not(mostrarEspecificos) then
      GBDatosExtra.Visible := false
    else
      GBDatosExtra.Visible := true
  else
      if (GBDatosParticulares.Visible) then
        if (mostrarEspecificos) then
        begin
          GBDatosExtra.Visible := true;
          DisminuirGroup(GBDatosExtra);
          GBDatosExtra.Align := altop;
        end;


  // *.*.* Prueba Alta Mavisa desde Evento Ivan
  if (altaDesdeEvento) then
    begin
      BDBGGrillaMachos.Columns[3].Visible := true;
      BDBGGrillaHembras.Columns[3].Visible := true;
  end;


end;

procedure TFEveAltaMasiva.FormShow(Sender: TObject);
var cantidad:integer;
    accion:TCloseAction;
    tope, izq : integer;
    dirAux : String;
begin
  inherited;
  {Width:=800;
  Height:=600;}

  ident_apretado := false;

//  FEveAltaMasiva.Top := 1;
//  FEveAltaMasiva.WindowState := wsMaximized;

  primeraCL := 4;
  segundaCL := 280;
  terceraCL := 520;
  cuartaCL := 782;

  primeraCC := 70;
  segundaCC := 344;
  terceraCC := 580;
  cuartaCC := 844;

  alineado := false;
  identRp := true;    // 16Set2016 : Por defecto tiene que estar en true, sino falla en carga masiva
  identSenasa := false;
  identCUIGSenasa := false;
  identReidentSenasa := false;


  AlturaTotal := 510;
  AlturaAcum := 0;

  RetornarTopLeft(AlturaTotal,TSHDatos.Width,GBDatosAlta.Height,GBDatosAlta.Width,tope,izq);

  GBDatosAlta.Top := tope;
  GBDatosAlta.Left := izq;
  JvECantidad.SetFocus;

  GBDecidirIdentificacion.Visible := false;
  GBIdentificar.Visible := false;
  GBDatosRaza.Visible := false;
  GBDatosUbicacion.Visible := false;
  GBDatosGenerales.Visible := false;
  GBDatosExtra.Visible := false;
  GBDatosParticulares.Visible := false;
  GBDatosVarios.Visible := false;
  GBDatosEcono.Visible := false;

  JvDatosGenerales.Visible := false;
  JVDatosParticulares.Visible := false;
  JvDatosComunes.Visible := false;
  JvDatosEconomicos.Visible := false;

  ComponentesVisiblesPorPais(FPrincipal.Pais);
  DMSoftvet.IBQCategAnimal.Open;
  DMSoftvet.IBQRaza.Close;
  DMSoftvet.IBQRaza.Open;
  DMSoftvet.IBQPotrerosSinServicio.Close;
  DMSoftvet.IBQPotrerosSinServicio.ParamByName('establecimiento').Value:= FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrerosSinServicio.Open;

  DMSoftvet.IBQCodOrigen.Close;
  DMSoftvet.IBQCodOrigen.Open;

  DMSoftvet.IBQCodDestCabania.Close;
  DMSoftvet.IBQCodDestCabania.Open;
  DMSoftvet.IBQInspeccion.Close;
  DMSoftvet.IBQInspeccion.Open;

  DMSoftvet.IBQGrupos.Open;
  CDSGrillaMachos.Open;
  CDSGrillaHembras.Open;
//  DBLCBAtipoAlta.SetFocus;
  SBSelTodos.Visible:=false;

  ISelTodos.Visible := false;
  LSelTodos.Visible := false;

  SBSelTodos.Left:=BBCancelar.Left-SBSelTodos.Width-5;
  //GBHembras.Visible := true;
  //GBMachos.Visible := false;
  CBSexo.ItemIndex := 1;
  DMSoftvet.IBQGrupos.Active:=false;
  DMSoftvet.IBQGrupos.ParamByName('idestablecimiento').Value:= FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQGrupos.Active:=true;
  DMSoftvet.IBQRodeo.Active:=false;
  DMSoftvet.IBQRodeo.ParamByName('esta').Value:= FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Active:=true;
  DMSoftvet.IBQCategAnimal.Active:=false;
  DMSoftvet.IBQCategAnimal.ParamByName('SEXO').Value:= 2;
  DMSoftvet.IBQCategAnimal.Active:=true;
  DMSoftvet.IBQCUIGActual.Close;
  DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQCUIGActual.Open;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value := 'DP';
  DMSoftvet.IBQCodigosGenericos.Open;
  DMSoftvet.IBQCodCriador.Close;
  DMSoftvet.IBQCodCriador.Open;
  DMSoftvet.IBQCodPropietario.Close;
  DMSoftvet.IBQCodPropietario.Open;
  DiasPeso := 'G';

  DTPAFechaAlta.Date := now;
  DBLCBACategoria.KeyValue := 0;
  DBLCBARodeo.KeyValue := 0;
  EAEstadoLactacion.Text := '1';
  EACircunferenciaEscrotal.Text := '0';
  JEACircunferenciaEscrotal.Text := '0';
  EAPeso.Text := '0';
  EAPorcentaje.Text := '0';
  EAValorNeto.Text := '0';
  EAValortotal.Text := '0';
  EAEdad.Text := '0';
  DBLCBARodeo.KeyValue := 0;
  if not (DMSoftvet.IBQRodeo.IsEmpty)then
    DBLCBARodeo.AsignarValorDefecto;
  DBLCBARaza.KeyValue := 0;
  DBLCBAtipoAlta.KeyValue := 3;
  DBLCBACondicionC.KeyValue := NULL;
  DBLCBAGdr.KeyValue := 0;
  DBLCBACategoria.KeyValue := 1;
  DBLCBACronologiaD.KeyValue := 0;
  DBLCBAEstadoR.KeyValue := 0;
  DBLCBAOrigen.KeyValue := 0;
  DBLCBACriador.KeyValue := 0;
  DBLCBAPropietario.KeyValue := 0;
  BBSiguiente.Enabled := False;
  BBAnterior.Enabled := False;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DBLCBAResponsable.AsignarValorDefecto;
  DMSoftvet.IBQActividad.Close;
  DMSoftvet.IBQActividad.Open;

  IBQCategorias.Close;
  IBQCategorias.Open;
  IBQCategorias.Last;
  IBQCategorias.First;

  IBQColor.Close;
  IBQColor.Open;
  IBQColor.Last;
  IBQColor.First;
  DBLCBAColor.KeyValue := 0;

  DBLCBAActividad.AsignarValorDefecto;
  MAErrors.Clear;
  controlCondicionCorporal;

  // Nos aseguramos que las restricciones del form esten bien
  CambioCategoriaHembras;
  PuedeEliminar:= false;
  senasaValido:= true;
  CBSexoChange(self);
  //CBDiagnostico.Checked:= false;
  CargarSubCategoriasporRaza();
  LCUIGPropio.Visible:= false;
  LFechadeAlta.Hint:= DTPAFechaAlta.Hint;
  LEdad.Hint:= EAEdad.Hint;
  AcomodarPanelPorRaza;
  if (self.Owner is TFMensajeNuevos){(self.Owner is TFMovCargarDatos) or (self.Owner is TFEveSimple)} then
    importar;
  if (self.Owner is TFMovCargarDatos) then
  begin
    dirAux := (self.Owner as TFMovCargarDatos).dirBase+(self.Owner as TFMovCargarDatos).nombreArch;
    abrirArchivo(self,dirAux);
    importar;
  end;


  if not FPrincipal.FuncActividad then
  begin
//    LColor.Top := LOrigen.Top;
//    DBLCBAColor.Top := DBLCBAOrigen.Top;
  end;
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
  LInspeccion.Visible := FPrincipal.FuncActividad;
  DBLCBAInspeccion.Visible := FPrincipal.FuncActividad;
  LMocho.Visible := FPrincipal.FuncActividad;
  DBLCBAMocho.Visible := FPrincipal.FuncActividad;
  LDestCab.Visible := FPrincipal.FuncActividad;
  DBLCBADestCabania.Visible := FPrincipal.FuncActividad;

//  if FPrincipal.RazaPredom = 1 then DBLCBARaza.KeyValue := 29;
//  if FPrincipal.RazaPredom = 2 then DBLCBARaza.KeyValue := 11;
//  if FPrincipal.RazaPredom = 3 then DBLCBARaza.KeyValue := 4;

  DBLCBACategoriaCloseUp(nil);

  //JvIDispElect.Visible := FPrincipal._USO_DISP;
  //LDispElect.Visible := FPrincipal._USO_DISP;
  JvIDispElect.Visible := False;
  LDispElect.Visible := False;
  ICaravanasElecNoPres.Visible := FPrincipal._USO_DISP;
  ICaravanasElecSiPres.Visible := FPrincipal._USO_DISP;
  EACarOficial.EsRequerido := False;  

  cargaEQ := false;

  JvIImpExcel.Visible := true;
  LImpExcel.Visible := true;

  if FPrincipal.AsistenteCMasivaPlanilla then
    BBXlsImportClick(nil);

  if (Fprincipal.importaMovil) then
    JvECantidad.Text := inttostr(cant);

  FPrincipal.importaMovil := false;  

  prueba := 1;
end;


procedure TFEveAltaMasiva.CBSexoChange(Sender: TObject);
begin
  inherited;
  if (CBSexo.ItemIndex = 0) then
    begin
      sexo:=1;
      //GBMachos.Visible := true;
      //GBHembras.Visible := false;
      BDBGGrillaMachos.Visible:= true;
      BDBGGrillaMachos.BringToFront;
      DMSoftvet.IBQCategAnimal.close;
      DMSoftvet.IBQCategAnimal.ParamByName('SEXO').Value:= 1;
      DMSoftvet.IBQCategAnimal.open;
      EAEstadoLactacion.Visible := false;
      EAEstadoLactacion.EsRequerido := false;
      EAEstadoLactacion.Text:='0';
      LEstadoLactacion.Visible:=false;
    end
   else
    begin
      sexo:=2;
      //GBMachos.Visible := false;
      //GBHembras.Visible := true;
      BDBGGrillaHembras.visible:= true;
      BDBGGrillaHembras.BringToFront;
      DMSoftvet.IBQCategAnimal.close;
      DMSoftvet.IBQCategAnimal.ParamByName('SEXO').Value:= 2;
      DMSoftvet.IBQCategAnimal.open;
    end;

end;

procedure TFEveAltaMasiva.CargarParametrosSP;
var I : Integer;
    rp, senasa, ia : string;
begin
         begin
         IBQSPEventoInd.ParamByName('IDNUEVOANIMAL').AsInteger := CDSAnimales.FieldValues['ID_ANIMAL'];


         if not (identRp) then
         begin
          if(FPrincipal.Pais = 1)then
            begin
              rp := CDSAnimales.fieldByName('ID_SENASA').AsString
            end
          else
            begin
              // Si el RP ya se construye bien, no se porque aplicar otra
              // lògica. Mariano M.               2016.06.09
              rp := CDSAnimales.fieldByName('ID_RP').AsString
            end
         end
         else
         begin
            rp := CDSAnimales.FieldValues['ID_RP'];
         end;

         { Esto no se porque està, fuerza que valga 9 la longitud, y eso hace
           que se llene de basura. No tiene sentido. Mariano M. 06/2016
         SetLength(rp,9);
          }
        senasa := CDSAnimales.fieldByName('ID_SENASA').AsString;

         if (rp = senasa) then
         begin
            IBQSPEventoInd.ParamByName('ID_SENASA').AsString := senasa;
            IBQSPEventoInd.ParamByName('ID_RP').AsString := rp;
         end
         else
         begin
            if(FPrincipal.Pais = 1)then
              begin
                IBQSPEventoInd.ParamByName('ID_SENASA').AsString := CDSAnimales.fieldByName('ID_SENASA').AsString;
                IBQSPEventoInd.ParamByName('ID_RP').AsString := CDSAnimales.FieldValues['ID_RP'];
              end
            else
              begin
                IBQSPEventoInd.ParamByName('ID_SENASA').AsString := CDSAnimales.fieldByName('ID_SENASA').AsString;
                IBQSPEventoInd.ParamByName('ID_RP').AsString := rp;
              end

         end;

         IBQSPEventoInd.ParamByName('ESTADO_LACTACION').Value := CDSAnimales.fieldbyname('ESTADO_LACTACION').Value;//FieldValues['ESTADO_LACTACION'];
         IBQSPEventoInd.ParamByName('RAZA').AsInteger := CDSAnimales.FieldValues['RAZA'];
         IBQSPEventoInd.ParamByName('CRONOLOGIA_DENTARIA').AsInteger := CDSAnimales.FieldValues['CRONOLOGIA_DENTARIA'];
         IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := CDSAnimales.FieldValues['CONDICION_CORPORAL'];

         if CDSAnimales.FieldValues['gdr'] <> null then
            IBQSPEventoInd.ParamByName('GDR').Value := CDSAnimales.FieldValues['gdr']
         else
            IBQSPEventoInd.ParamByName('GDR').Value := 0;

         IBQSPEventoInd.ParamByName('ESTADO_REPRODUCTIVO').Value := CDSAnimales.FieldValues['ESTADO_REPRODUCTIVO'];
         IBQSPEventoInd.ParamByName('SEXO').AsString := CDSAnimales.FieldValues['SEXO'];//'2';
         IBQSPEventoInd.ParamByName('CATEGORIA').AsInteger := CDSAnimales.FieldValues['categoria'];
         IBQSPEventoInd.ParamByName('ID_HBA').Value := CDSAnimales.fieldByName('ID_HBA').Value;

         if (CDSAnimales.FieldValues['ID_IE'] <> null) then
            IBQSPEventoInd.ParamByName('ID_IE').AsString := CDSAnimales.FieldValues['ID_IE']
         else
             IBQSPEventoInd.ParamByName('ID_IE').Value := null;

         IBQSPEventoInd.ParamByName('FECHA_NACIMIENTO').AsDate := CDSAnimales.FieldValues['FECHA_NACIMIENTO'];
         if((CDSAnimales.FieldValues['PESO'] = 0) or (CDSAnimales.FieldValues['PESO'] = null))THEN
            IBQSPEventoInd.ParamByName('PESO').Value := null
         else
         begin
           IBQSPEventoInd.ParamByName('PESO').Value := CDSAnimales.FieldValues['PESO'];
           PesoProm := PesoProm + CDSAnimales.FieldValues['PESO'];
           CantPesoProm := CantPesoProm + 1;
         end;
         if CDSAnimales.FieldValues['NOMBRE']<>'' then
         begin
          if ((CDSAnimales.FieldValues['NOMBRE'] = 'SI') or (CDSAnimales.FieldValues['NOMBRE'] = 'NO')) then
            IBQSPEventoInd.ParamByName('NOMBRE').Value := Null
          else
            IBQSPEventoInd.ParamByName('NOMBRE').Value := CDSAnimales.FieldValues['NOMBRE'];
         end
         else
          IBQSPEventoInd.ParamByName('NOMBRE').Value := CDSAnimales.FieldValues['ID_RP'];

         if (CDSAnimales.FieldValues['DTA'] <> null) then
           IBQSPEventoInd.ParamByName('DTA').AsString := CDSAnimales.FieldValues['DTA']
         else
           IBQSPEventoInd.ParamByName('DTA').AsString := '';
         IBQSPEventoInd.ParamByName('RODEO').AsInteger := CDSAnimales.FieldValues['RODEO'];
         IBQSPEventoInd.ParamByName('POTRERO').AsInteger := CDSAnimales.FieldValues['POTRERO'];
         IBQSPEventoInd.ParamByName('DIASPESO').AsString := CDSAnimales.FieldValues['VUno1'];

          IBQSPEventoInd.ParamByName('FECHA_EVENTO').AsDate := CDSAnimales.FieldByName('FECHA_ALTA').Value;

          if CDSAnimales.FieldByName('OBSERVACION').AsString <> '' then
            IBQSPEventoInd.ParamByName('OBSERVACION').AsString := CDSAnimales.FieldByName('OBSERVACION').AsString
          else
            IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.Text;


          IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := CDSAnimales.FieldByName('RESPONSABLE').AsInteger;
          IBQSPEventoInd.ParamByName('TIPO_ALTA').AsInteger := CDSAnimales.FieldByName('TIPO_ALTA').AsInteger;
          IBQSPEventoInd.ParamByName('PRECIO_UNITARIO').asFloat := CDSAnimales.FieldByName('PRECIO_UNITARIO').AsFloat;
          IBQSPEventoInd.ParamByName('PRECIO_BRUTO').asFloat := CDSAnimales.FieldByName('PRECIO_BRUTO').AsFloat;
          IBQSPEventoInd.ParamByName('GASTOS').asFloat := CDSAnimales.FieldByName('GASTOS').AsFloat;

          if ((CDSAnimales.FieldValues['ACTIVIDAD'] <> 0) and (CDSAnimales.FieldValues['ACTIVIDAD'] <> null)) then
            IBQSPEventoInd.ParamByName('ACTIVIDAD').Value := CDSAnimales.FieldValues['ACTIVIDAD']
          else
            IBQSPEventoInd.ParamByName('ACTIVIDAD').Value := null;

          if CDSAnimales.FieldValues['ADN']<>null then IBQSPEventoInd.ParamByName('ADN').Value := trim(CDSAnimales.FieldValues['ADN'])
          else IBQSPEventoInd.ParamByName('ADN').Value := null;
          if CDSAnimales.FieldValues['TIPIFICACION_SANGUINEA']<>null then IBQSPEventoInd.ParamByName('TipificacionSanguinea').Value := (CDSAnimales.FieldValues['TIPIFICACION_SANGUINEA'])
          else IBQSPEventoInd.ParamByName('TipificacionSanguinea').Value := null;
          IBQSPEventoInd.ParamByName('Propietario').Value := CDSAnimales.FieldValues['PROPIETARIO'];
          IBQSPEventoInd.ParamByName('Criador').Value := CDSAnimales.FieldValues['CRIADOR'];
          IBQSPEventoInd.ParamByName('Origen').Value := CDSAnimales.FieldValues['ORIGEN_ANIMAL'];//DBLCBAOrigen.KeyValue;

          IBQSPEventoInd.ParamByName('APODO').Value := CDSAnimales.FieldValues['APODO'];
          IBQSPEventoInd.ParamByName('ID_PC').Value := CDSAnimales.FieldValues['ID_PC'];
          IBQSPEventoInd.ParamByName('ID_RA').Value := CDSAnimales.FieldValues['ID_RA'];
          IBQSPEventoInd.ParamByName('ID_OTRO').Value := CDSAnimales.FieldValues['ID_OTRO'];

          IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := CDSAnimales.FieldValues['MADRE_BIOLOGICA_INTERNA'];
          IBQSPEventoInd.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := CDSAnimales.FieldValues['MADRE_BIOLOGICA_EXTERNA'];
          IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_INTERNA').Value := CDSAnimales.FieldValues['MADRE_RECEPTORA_INTERNA'];
          IBQSPEventoInd.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := CDSAnimales.FieldValues['MADRE_RECEPTORA_EXTERNA'];
          IBQSPEventoInd.ParamByName('PADRE_INTERNO').Value := CDSAnimales.FieldValues['PADRE_INTERNO'];
          IBQSPEventoInd.ParamByName('PADRE_EXTERNO').Value := CDSAnimales.FieldValues['PADRE_EXTERNO'];
          IBQSPEventoInd.ParamByName('COLOR').Value := CDSAnimales.FieldValues['COLOR'];

          IBQSPEventoInd.ParamByName('ID_AUXPE').Value := CDSAnimales.FieldValues['PADRE_EXTERNO']; //fijarse
        end;

         if (CDSAnimales.FieldValues['categoria'] = 3) then // solo toro
          IBQSPEventoInd.ParamByName('CIRCUNFERENCIA_ESCROTAL').Value := CDSAnimales.FieldValues['CIRCUNFERENCIA_ESCROTAL']
         else
           IBQSPEventoInd.ParamByName('CIRCUNFERENCIA_ESCROTAL').Value:= null;

         if (CDSAnimales.FieldValues['VUNO2'] = 1) then
          IBQSPEventoInd.ParamByName('CASTRADO').Value := CDSAnimales.FieldValues['VUNO2']
         else
            IBQSPEventoInd.ParamByName('CASTRADO').Value := null;

      IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
      IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=FPrincipal.UsuarioActual;
      IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDate := now;
      IBQSPEventoInd.ParamByName('DISPARADOR').Value := null;
      IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;

      I := CDSAnimales.FieldValues['RAZA'];
      if I in [12,28,11,10,5] then
      begin
        IBQSPEventoInd.ParamByName('MOCHO').Value := CDSAnimales.FieldValues['MOCHO'];
        if I <> 5 then
        begin
          IBQSPEventoInd.ParamByName('INSPECCION').Value := CDSAnimales.FieldValues['INSPECCION'];
          IBQSPEventoInd.ParamByName('DESTINO_CAB').Value := CDSAnimales.FieldValues['DESTINO_CAB'];
        end
        else
        begin
          IBQSPEventoInd.ParamByName('INSPECCION').Value := null;
          IBQSPEventoInd.ParamByName('DESTINO_CAB').Value := null;
        end;
      end
      else
      begin
        IBQSPEventoInd.ParamByName('MOCHO').Value := null;
        IBQSPEventoInd.ParamByName('INSPECCION').Value := null;
        IBQSPEventoInd.ParamByName('DESTINO_CAB').Value := null;
      end;

      //******************************************************//
      //	INCIDENCIA: 401									                    //
      //	INICIO Asignación valor parámetro para SP.          //
      //	Carla Gareis							              02/12/2014  //
      //******************************************************//
      if (CDSAnimales.FieldByName('INFORMADO_AFIP').asString = 'S')then
         IBQSPEventoInd.ParamByName('INFORMADO_AFIP').Value := 'S'
      else
         IBQSPEventoInd.ParamByName('INFORMADO_AFIP').Value := 'N';

     // if(EACarOficial.GetDato <> null)then
      //  if(EditAuto1.GetDato <> null)then
        if(CDSAnimales.FieldValues['caravana_oficial'] <> null)then
          IBQSPEventoInd.ParamByName('CAR_OFICIAL').Value := CDSAnimales.FieldValues['caravana_oficial'];
       // else
         // IBQSPEventoInd.ParamByName('CAR_OFICIAL').Value := IntToStr(cOficial);

      cOficial := cOficial + 1;

      MAuxCaravanas.Lines.Add(IBQSPEventoInd.ParamByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBQSPEventoInd.ParamByName('ID_SENASA').asString)));
      CantAnim := CantAnim + 1;

      if (IBQSPEventoInd.ParamByName('ID_IE').Value <> '') then
      begin
        LineaauxTxt := '['+IBQSPEventoInd.ParamByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBQSPEventoInd.ParamByName('ID_SENASA').asString))+'|'+IBQSPEventoInd.ParamByName('ID_IE').asString+']';
        LineaauxXls := IBQSPEventoInd.ParamByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBQSPEventoInd.ParamByName('ID_SENASA').asString))+'|'+IBQSPEventoInd.ParamByName('ID_IE').asString;

      end
      else
      begin
        LineaauxTxt := '['+IBQSPEventoInd.ParamByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBQSPEventoInd.ParamByName('ID_SENASA').asString))+'| - ]';
        LineaauxXls := IBQSPEventoInd.ParamByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBQSPEventoInd.ParamByName('ID_SENASA').asString))+'|';
      end;
      //Se van cargando los registros de equivalencias correspondientes (TXT).

      try

        Append(arcEquivalenciasTxt);
        Writeln(arcEquivalenciasTxt, LineaauxTxt);
        Append(arcEquivalenciasXls);
        Writeln(arcEquivalenciasXls, LineaauxXls);
      except
      end;
      //******************************************************//
      //	INCIDENCIA: 401									                    //
      // 	FIN Asignación valor parametro para SP.             //
      //	Carla Gareis							              02/12/2014  //
      //******************************************************//

      IBQSPEventoInd.ParamByName('SUBCATEGORIA').Value :=CDSAnimales.FieldValues['SUBCATEGORIA'];
      IBQSPEventoInd.ParamByName('CODIGOMANEJO').AsInteger :=0;
      //actualiza el rp del animal en el arbol
      //if (self.Owner is TFMensajeNuevos){(self.Owner is TFMovCargarDatos) or (self.Owner is TFEveSimple)} then
        //habria que hacer un actualizarID para la importacion de deps
      //  actualizarRP(IBQSPEventoInd.ParamByName('IDNUEVOANIMAL').AsInteger,IBQSPEventoInd.ParamByName('ID_RP').AsString);

end;

procedure TFEveAltaMasiva.RealizarDiagnostico();
var
  F : TFEveDiagnosticoGestacion;
begin
  F := TFEveDiagnosticoGestacion.Create(self);
  F.ConManga := true;
  F.ModoEve := meMasivo;
  F.DTPAFecha.Date:=DTPAFechaAlta.Date;
  F.ShowModal();
  F.Destroy();
  IBSPBorrarTablasAuxiliares.Close;
  IBSPBorrarTablasAuxiliares.ExecProc;
  FPrincipal.IBTPrincipal.CommitRetaining;
end;

procedure TFEveAltaMasiva.RealizarRevisacion();
var
  F : TFEveEvalClinicaToros;
begin
  F := TFEveEvalClinicaToros.Create(self);
  F.ConManga := true;
  F.ModoEve := meMasivo;
  F.DTPFechaEval.Date:=DTPAFechaAlta.Date;
  F.ShowModal();
  F.Destroy();
  IBSPBorrarTablasAuxiliares.Close;
  IBSPBorrarTablasAuxiliares.ExecProc;
  FPrincipal.IBTPrincipal.CommitRetaining;
end;

procedure TFEveAltaMasiva.mostrarCaravanas;
var F : TFPanelCaravanas;
begin

  F := TFPanelCaravanas.Create(self);
  F.MACaravanas.Lines.Text := MAuxCaravanas.Lines.Text;
  F.TipoMov := 'Carga_Masiva';
  F.LAnimales.Caption := 'Animales('+ inttostr(CantAnim)+')';
  F.ShowModal;


end;

procedure TFEveAltaMasiva.CrearCopiaArchivo();
begin
  //Nombre del archivo de destino (copia).
  nomDestino := 'SIFTA\DTE'+IntToStr(FPrincipal.EstablecimientoActual)+'_Grupo'+IntToStr(nro_grupo)+'.pdf';
  //Path final de la copia del archivo DTE.pdf.
  if not (DirectoryExists(ExtractFilePath(Application.ExeName)+'SIFTA')) then
    CreateDir(ExtractFilePath(Application.ExeName)+'SIFTA');
  archivo := ExtractFilePath(Application.ExeName)+nomdestino;
  //Realización de copia de archivo.
  CopyFile(pchar(pathOrigen),pchar(archivo),true);
  SetFileAttributes(Pchar(archivo),FILE_ATTRIBUTE_READONLY);
end;

procedure TFEveAltaMasiva.actualizarDatosDTE();
begin
  inherited;
  if (pathOrigen <> '') then
    CrearCopiaArchivo();
  IBQActualizarDte.ParamByName('id_grupo').Value := IBQSPEventoInd.ParamByName('id_grupo').Value;
  IBQActualizarDte.ParamByName('estable').Value := FPrincipal.EstablecimientoActual;
  if (EADTE.Text <> '') then
      IBQActualizarDte.ParamByName('DTE').Value := Strtoint(EADTE.Text)
  else
    IBQActualizarDte.ParamByName('DTE').Value := Null;
  if (nomDestino <> '') then
    IBQActualizarDte.ParamByName('PDTE').Value := nomDestino
  else
    IBQActualizarDte.ParamByName('PDTE').Value := '';
  IBQActualizarDte.ExecSQL;
  FPrincipal.IBTPrincipal.CommitRetaining;
end;

procedure TFEveAltaMasiva.ATerminarExecute(Sender: TObject);
var v: TFNombredelGrupo;
    termina : boolean;
    i:integer;
    Animales : integer;

    //******************************************************//
    //	INCIDENCIA: 401									                    //
    //	INICIO Declaración variable.                        //
    //	Carla Gareis							              03/12/2014  //
    //******************************************************//
    informado: integer;
    //******************************************************//
    //	INCIDENCIA: 401									                    //
    //	FIN Declaración variable.                           //
    //	Carla Gareis							              03/12/2014  //
    //******************************************************//

    //diagnostico : boolean;
begin
  // codigo nuevo para el tema de la verificacion de rps y senasa en la grilla
  informado := 0;
  BDBGGrillaHembras.Hide;
  BDBGGrillaMachos.Hide;
  Paso:= true;
  termina := true;
  VerificarRepetidos;


  if (MAErrors.Lines.Text <> '') then
  begin
    MostrarMensaje(tmError, 'Se han producido errores, compruebe los datos e intente nuevamente');
    termina := false;
    PError.Visible := true;
    PError.BringToFront;
    PaintRequired;
  end
  else
    if ((not BDBGGrillaHembras.DataSource.DataSet.IsEmpty) and ChequearRN(BDBGGrillaHembras, DSGrillaHembras)) or
       ((not BDBGGrillaMachos.DataSource.DataSet.IsEmpty) and ChequearRN(BDBGGrillaMachos, DSGrillaMachos)) then
      if (Errores > 0) then
      begin
        MostrarMensaje(tmError, 'Se han producido errores, compruebe los datos e intente nuevamente');
        termina := false;
        PaintRequired;
      end
      else if (Warnings > 0) then
           begin
           termina := (MostrarMensaje(tmConsulta, 'El animal no respeta alguno de los parametros biológicos, desea Continuar?') = mrYes);
           PaintRequired;
           end;
  animales := CDSGrillaHembras.RecordCount + CDSGrillaMachos.RecordCount;
  if (termina) then
      begin
        ATerminar.Enabled := false;
        v := TFNombredelGrupo.Create(self);
        v.ENombreGrupo.Text := PTitulo.Caption + ' ' + DateToStr(DTPAFechaAlta.date);  //DateToStr(now);
        v.ShowModal;
        FNombreGrupo := v.ENombreGrupo.Text;
        IBSPCrearGrupo.ParamByName('ESTABLECIMIENTO').Value :=FPrincipal.EstablecimientoActual;
        IBSPCrearGrupo.ParamByName('NOMBREGRUPO').Value := FNombreGrupo;
        IBSPCrearGrupo.ParamByName('DESCRIPCIONGRUPO').Value := 'Creación del evento '+ FNombreGrupo;
        IBSPCrearGrupo.ParamByName('TIPO').Value :='S';
        IBSPCrearGrupo.ParamByName('TIPO_EVENTO').Value := 2;

        //******************************************************//
        //	INICIO Agregado.                                    //
        //	Carla Gareis							              22/12/2014  //
        //******************************************************//
        IBSPCrearGrupo.ParamByName('DTE').Value := Null;
        IBSPCrearGrupo.ParamByName('PATH_DTE').Value := '';
        //******************************************************//
        //	INICIO Agregado.                                    //
        //	Carla Gareis							              22/12/2014  //
        //******************************************************//

        IBSPCrearGrupo.ExecProc;
        //ciclo de Hembras.
        ActualizarCUIG(IdentCUIG,animales);

        altaExternos;

        CDSAnimales.Close;
        CDSAnimales.Open;
        CDSAnimales.Last;

        if CDSAnimales.RecordCount>0 then
          begin
            PesoProm := 0;
            CantPesoProm := 0;
            CDSAnimales.First;
            FAvanceTerminar := TFAvanceTerminar.Create(self);
            FAvanceTerminar.Pos := 1;
            FAvanceTerminar.Modo := maGuardando;
            FAvanceTerminar.Update;
            FAvanceTerminar.Max := CDSAnimales.RecordCount;
            i:=0;
            while (i<FAvanceTerminar.Max) do
              begin
                CargarParametrosSP;
                FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
                FAvanceTerminar.Update;
                Application.ProcessMessages;
                IBQSPEventoInd.Active:=true;
                if ((CDSAnimales.FieldByName('CATEGORIA').AsInteger in [3,5,6]) and (CDSAnimales.FieldByName('V5').Value<>null)) or (FPrincipal.TipoActividad = ttaFeedlot) then
                  CDSAnimales.Next
                else
                begin
                  CDSAnimales.Delete;
                  if (i=FAvanceTerminar.Max-1) then
                    CDSAnimales.Next;
                end;
                IBQSPEventoInd.Active:=false;
                i:=i+1;

                //******************************************************//
                //	INCIDENCIA: 401									                    //
                //	INICIO Búsqueda de algún registro                   //
                //         con 'SI' en informado_afip.                  //
                //	Carla Gareis							              03/12/2014  //
                //******************************************************//
                if (CDSAnimales.FieldValues['INFORMADO_AFIP'] = 'S') and ((CDSAnimales.fieldByName('ID_SENASA').AsString <> '') or (CDSAnimales.fieldByName('ID_IE').AsString <> '')) then
                  informado := 1;
                //******************************************************//
                //	INCIDENCIA: 401									                    //
                //	FIN Búsqueda de algún registro                      //
                //      con 'SI' en informado_afip.                     //
                //	Carla Gareis							              03/12/2014  //
                //******************************************************//

              end;

          end;
          FAvanceTerminar.Modo := maListo;
          FAvanceTerminar.Destroy;
          FPrincipal.IBTPrincipal.CommitRetaining;
         { if FPrincipal.TipoActividad = ttaFeedlot then
            CargarTratamientos; }
          if diagnostico and not(self.Owner is TFMensajeNuevos) and not(FPrincipal.TipoActividad = ttaFeedlot) then
          begin
            if MostrarMensaje(tmConsulta,'Desea realizar un DIAGNOSTICO DE GESTACION a estos animales? (Los animales respetarán el mismo orden que el asignado en la Carga Masiva) ') = mrYes then
              RealizarDiagnostico()
            else
            begin
              CDSAnimales.First;
              while not CDSAnimales.Eof do
                CDSAnimales.Delete;
            end;
          end;

          if revisacionToros and not(self.Owner is TFMensajeNuevos) and not(FPrincipal.TipoActividad = ttaFeedlot) then
          begin
            if MostrarMensaje(tmConsulta,'Desea realizar una REVISACIÓN CLÍNICA y SANITARIA a estos animales? (Los animales respetarán el mismo orden que el asignado en la Carga Masiva) ') = mrYes then
              RealizarRevisacion()
            else
            begin
              CDSAnimales.First;
              while not CDSAnimales.Eof do
                CDSAnimales.Delete;
            end;
          end;

          //******************************************************//
          //	INCIDENCIA: 401									                    //
          //	INICIO Creación de archivos de equivalencias.       //
          //	Carla Gareis							              23/12/2014  //
          //******************************************************//
           ActualizarDatosDTE();

          if (informado = 1) then
          begin
            if MostrarMensaje(tmConsulta,'Desea ver las caravanas de los animales?') = mrYes then
            begin
               LineaauxTxt := '';
               Append(arcEquivalenciasTxt);
               Writeln(arcEquivalenciasTxt, LineaauxTxt);
               Append(arcEquivalenciasXls);
               Writeln(arcEquivalenciasXls, LineaauxTxt);
               mostrarCaravanas;
            end;
            //Llamar a evento de declaracion afip.
            //Creación del txt para realizar la exportación de las caravanas.
        //    GenerarTxt();
            //Creación del xls a partir de Txt.
        //    GenerarXls();
      
          end;
          //Eliminación de archivos temporales creados.
          try
            CloseFile(arcEquivalenciasTxt);
            DeleteFile(ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempTxt.txt');
            CloseFile(arcEquivalenciasXls);
            DeleteFile(ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempXls.txt');
          except
          end;
        //******************************************************//
        //	INCIDENCIA: 401									                    //
        //	FIN Creación de archivos de equivalencias.          //
        //	Carla Gareis							              23/12/2014  //
        //******************************************************//

        ATerminar.Enabled := true;
        close;
      end;
  if CDSGrillaMachos.RecordCount>0 then
    BDBGGrillaMachos.Show;
  if CDSGrillaHembras.RecordCount>0 then
    BDBGGrillaHembras.Show;
  IBSPCambiarCAtegoria.ExecProc;
end;

procedure TFEveAltaMasiva.CargarTratamientos;
var
  I, K : Integer;
  F : TFCargaTratsInic;
  F2 : TFConfigProInic;
  Trats : Boolean;
  d : Double;
begin
  Trats := false;
  IBQSysProtocoloInicial.Close;
  IBQSysProtocoloInicial.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSysProtocoloInicial.Open;
  if IBQSysProtocoloInicial.IsEmpty then
  begin
    if MostrarMensaje(tmConsulta, 'No hay tratamientos sanitario seleccionados para el ingreso de los animales al Feedlot, desea cargarlos ahora?') = mrYes then
    begin
      F2 := TFConfigProInic.Create(self);
      F2.ShowModal;
      F2.Destroy;
      Trats := true;
    end
    else
      Trats := false;
  end
  else
    Trats := true;

  IBQSysProtocoloInicial.Close;
  IBQSysProtocoloInicial.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSysProtocoloInicial.Open;
  Trats := not IBQSysProtocoloInicial.IsEmpty;

  if Trats then
  begin
    F := TFCargaTratsInic.Create(self);

    F.Peso := 0;
    if PesoProm > 0 then
      if CantPesoProm > 0 then
        F.Peso := PesoProm / CantPesoProm;

    F.ShowModal;
    if F.Resultado > 0 then
    begin
      SetLength(Productos,Length(F.Productos));
      for I := 0 to Length(F.Productos)-1 do
      begin
        Productos[I].dosis := F.Productos[I].dosis;
        Productos[I].id_prod := F.Productos[I].id_prod;
        Productos[I].serie := F.Productos[I].serie;
        Productos[I].tipo_t := F.Productos[I].tipo_t;
        Productos[I].Vencimiento := F.Productos[I].Vencimiento;

        IBSPCrearGrupo.Close;
        IBSPCrearGrupo.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
        IBSPCrearGrupo.ParamByName('NOMBREGRUPO').Value := 'Tratamiento '+FNombreGrupo;
        IBSPCrearGrupo.ParamByName('DESCRIPCIONGRUPO').Value := 'Creación del evento '+'Tratamiento '+FNombreGrupo;
        IBSPCrearGrupo.ParamByName('TIPO').Value :='S';
        IBSPCrearGrupo.ParamByName('TIPO_EVENTO').Value := 27;

        //******************************************************//
        //	INICIO Agregado.                                    //
        //	Carla Gareis							              22/12/2014  //
        //******************************************************//
        IBSPCrearGrupo.ParamByName('DTE').Value := Null;
        IBSPCrearGrupo.ParamByName('PATH_DTE').Value := '';
        //******************************************************//
        //	INICIO Agregado.                                    //
        //	Carla Gareis							              22/12/2014  //
        //******************************************************//

        IBSPCrearGrupo.ExecProc;

        Productos[I].grupo := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').AsInteger;

      end;

      FAvanceTerminar := TFAvanceTerminar.Create(self);
      FAvanceTerminar.Pos := 1;
      FAvanceTerminar.Modo := maGuardando;
      FAvanceTerminar.Update;
      FAvanceTerminar.Max := CDSAnimales.RecordCount * (Length(Productos));

      CDSAnimales.First;
      i:=0;
      while not CDSAnimales.Eof do
        begin
          for K := 0 to Length(Productos)-1 do
          begin
            IBQSPTratamientos.Close;
            IBQSPTratamientos.ParamByName('TIPO').AsInteger := Productos[K].tipo_t;
            IBQSPTratamientos.ParamByName('tecnica').AsInteger := 0;
            IBQSPTratamientos.ParamByName('fecha').AsDate := CDSAnimales.FieldByName('FECHA_ALTA').Value;
            IBQSPTratamientos.ParamByName('animal').AsInteger := CDSAnimales.FieldValues['ID_ANIMAL'];
            IBQSPTratamientos.ParamByName('observacion').AsString := 'Tratamiento cargado en el Alta';
            IBQSPTratamientos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
            IBQSPTratamientos.ParamByName('responsable').AsInteger := CDSAnimales.FieldByName('RESPONSABLE').AsInteger;
            IBQSPTratamientos.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
            IBQSPTratamientos.ParamByName('log_fecha_modificado').AsDate := Now;
            IBQSPTratamientos.ParamByName('disparador').Value := null;
            IBQSPTratamientos.ParamByName('grupo').AsInteger := Productos[K].grupo;
            IBQSPTratamientos.ParamByName('id_tratamiento').AsInteger := Productos[K].id_prod;
            IBQSPTratamientos.ParamByName('hora').AsTime := Time;
            IBQSPTratamientos.ParamByName('temperatura').AsInteger := 0;
            IBQSPTratamientos.ParamByName('peso').Value := null;
            IBQSPTratamientos.ParamByName('dosis').Value := Productos[K].dosis;
            IBQSPTratamientos.Open;

            FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
            FAvanceTerminar.Update;
            //IBQSPEventoInd.Open;
          end;
          CDSAnimales.Next;
          i:=i+1;
        end;


      for k := 0 to Length(Productos)-1 do
      begin
        try
          IBQInsertarDatos.Close;
          IBQInsertarDatos.ParamByName('GRUPO').Value := Productos[K].grupo;
          IBQInsertarDatos.ParamByName('ESTABLECIMIENTO').Value := Fprincipal.EstablecimientoActual;
          IBQInsertarDatos.ParamByName('ANIMAL').Value := null;
          IBQInsertarDatos.ParamByName('DOSIS').Value := Productos[K].dosis;
          IBQInsertarDatos.ParamByName('PRECIO').Value := 0;
          IBQInsertarDatos.ParamByName('NRO_SERIE').AsString := Productos[K].serie;
          IBQInsertarDatos.ParamByName('LABORATORIO').Value := null;
          IBQInsertarDatos.ParamByName('FECHA_VENCIMIENTO').AsDate := Productos[K].Vencimiento;
          IBQInsertarDatos.ParamByName('EVENTO').Value := null;
          IBQInsertarDatos.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;

        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
      end;

      FAvanceTerminar.Modo := maListo;
      FAvanceTerminar.Destroy;
    end;
  end;
end;

procedure TFEveAltaMasiva.CambioCategoriaHembras;
var
  esVaca, esTernera, esVaq:boolean;
begin
  esVaca:= DBLCBACategoria.KeyValue = 6;
  if IBQCategorias.FieldByName('ref_categ').Value <> null then
    esVaca := IBQCategorias.FieldByName('ref_categ').Value = 6;

  esTernera:=DBLCBACategoria.KeyValue = 4;
  if IBQCategorias.FieldByName('ref_categ').Value <> null then
    esTernera := IBQCategorias.FieldByName('ref_categ').Value = 4;

  esVaq:=((esVaca) or (DBLCBACategoria.KeyValue = 5));
  if IBQCategorias.FieldByName('ref_categ').Value <> null then
    esVaq := (IBQCategorias.FieldByName('ref_categ').Value = 5) or (esVaca);

  EAEstadoLactacion.Enabled := esVaca;
  LEstadoLactacion.Enabled  := esVaca;

  DBLCBAEstadoR.Enabled:= esVaq;
  LEstadoR.Enabled:=esVaq;

  if((esTernera) or (esVaq)) then
    EAEstadoLactacion.Text:='1';

  if(esTernera) then
    DBLCBAEstadoR.KeyValue:=0;



end;

procedure TFEveAltaMasiva.DBLCBACategoriaClick(Sender: TObject);
var
  cod : Integer;
begin
  inherited;
  cod := DBLCBACategoria.KeyValue;
  if IBQCategorias.FieldByName('ref_categ').Value <> null then
    cod := IBQCategorias.FieldByName('ref_categ').Value;
  case cod of
    4,5,6 : CambioCategoriaHembras;
    1,2,3 : begin
              EACircunferenciaEscrotal.Enabled := cod = 3;
              JEACircunferenciaEscrotal.Enabled := cod = 3;
              BDBGGrillaMachos.Columns[15].ReadOnly := not (cod = 3);
            end;
  end;
end;


function TFEveAltaMasiva.ControlarRP: Boolean;
var i, rpInicial, cantidad: integer;
    rpActual, Existe  : String;
    min, max : integer;
    IdentCUIG : String;
    IdentReidentificacion : String;
begin
    Existe := 'A';
    Result := True;
      if ((identRp)And((StrToInt(EARpInicial.Text) + StrToInt(EACantidad.Text)) > 999999)) Or
         ((identSenasa)And((StrToInt(EARpInicial.Text) + StrToInt(EACantidad.Text)) > 999999999)) then
     begin
        MostrarMensaje(tmAdvertencia, 'Los identificadores superan el límite permitido');
        Result := False;
     end;

    cantidad := StrToInt(EACantidad.Text);

    if ((identCUIGSenasa) or (identSenasa) or (identReidentSenasa)) then
    begin
      min := 0;
      max := cantidad;
    end
    else
    begin
      if (EARpInicial.Text <> 'N/N') then
      begin
          rpInicial := StrToInt(EARpInicial.Text);
          min := rpInicial;
          max := rpInicial+cantidad;
      end;
    end;

    IdentCUIG := EAUltimoIdent.Text;
    PrimerIdentificador := IdentCUIG;
    IdentReidentificacion := EAUltimoIdentReidentificacion.Text;
    for i := min to max-1 do
    begin
            try
            rpActual :=  EAPrefijo.Text + CompletarRP(i) + EASufijo.Text;
            with IBSPExistenciaRP do
                    Begin
                       ParamByName('ANIMAL').Value := 0;
                       if identRp then
                         begin
                           ParamByName('RP').AsString := rpActual;
                           //ParamByName('SENASA').Value := null;
                         end;
                       if identSenasa then
                         begin
                           //ParamByName('RP').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text;
                           ParamByName('SENASA').Value := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text;
                         end;
                       if identCUIGSenasa then
                       begin
                           //ParamByName('RP').AsString := EAEncabezado.Text + IdentCUIG;
                           ParamByName('SENASA').Value := EAEncabezado.Text + IdentCUIG;
                           ActualizarCUIG(IdentCUIG,0);
                       end;
                       if identReidentSenasa then
                       begin
                           //ParamByName('RP').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
                           ParamByName('SENASA').Value:= 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
                          // ActualizarCUIG(IdentReidentificacion);
                       end;
                       ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
                       ParamByName('PC').Value := null;
                       ParamByName('HBA').Value := null;
                       ParamByName('RA').Value := null;
                       ParamByName('OTRO').Value := null;
                       ExecProc;
                       Existe := ParamByName('RESULT').AsString;
                       close;
                     end;
           except //del try
                // LResult:= True;
           end;

            if Existe = 'E' then
            begin
             Result := Result And false;
             PError.Visible := True;
             MAErrors.Lines.Add(rpActual+Traducir(' Ya existe este Identificador') );
            end
            else
             Result := Result And true;
    end;
    ControlarRP := Result;
end;

procedure TFEveAltaMasiva.PCBasicoChange(Sender: TObject);
var i:integer;
begin
      inherited;
//-----------------------------------------------------------------------------


  TSHDatos.ImageIndex := 0;
  TSHObservacion.ImageIndex := 1;

  if(PCBasico.ActivePage = TSHDatos)then
    TSHObservacion.ImageIndex := 2;

  if(PCBasico.ActivePage = TSHObservacion)then
    TSHObservacion.ImageIndex := 3;

  TSHembras.TabVisible:=false;
  TSMachos.TabVisible:=false;
  if (identRp) or (identSenasa) or (identCUIGSenasa) or (identReidentSenasa) or (identElectronica) then
    if (identReidentSenasa and (not controlarReidentificacion(EAUltimoIdentReidentificacion.Text))) or (identCUIGSenasa and
    (not CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) or ((identSenasa) and((StrToInt(EARpInicial.Text) + StrToInt(EACantidad.Text)-1) > 999999999)))then
    begin
        if BDBGGrillaHembras.DataSource.DataSet.IsEmpty and BDBGGrillaHembras.DataSource.DataSet.IsEmpty then
          begin
          PCBasico.ActivePageIndex := 0;
          MostrarMensaje(tmAdvertencia, 'Los identificadores superan el límite permitido');
          end;
    end
    else
    begin
        if(PCBasico.ActivePage = TSHObservacion) then
        begin
          BDBGGrillaHembras.Hide;         //1   2
          BDBGGrillaMachos.Hide;
          ASacarAnimal.Enabled:=false;
          if agregar then
          begin
            if (EARpInicial.Text <>'') or (identSenasa) or (identCUIGSenasa) or (identReidentSenasa) or (identElectronica) then
            begin
              GeneraGrilla;               //2
              agregar:=false;
            end
            else
            begin
              MostrarMensaje(tmAdvertencia, 'Faltan datos para Generar los Animales');
              PCBasico.ActivePageIndex := 0;
            end;
          end
          else
          begin
            EARpInicial.EsRequerido:=false;      //1
            cambiarGrilla;
          end;
          BDBGGrillaHembras.SelectedRows.Clear;
          BDBGGrillaMachos.SelectedRows.Clear;

          if CDSGrillaMachos.RecordCount>0 then BDBGGrillaMachos.Show;
          if CDSGrillaHembras.RecordCount>0 then BDBGGrillaHembras.Show;

          BDBGGrillaHembras.DataSource.DataSet.Last;
          BDBGGrillaHembras.DataSource.DataSet.First;

          BDBGGrillaMachos.DataSource.DataSet.Last;
          BDBGGrillaMachos.DataSource.DataSet.First;

          if (PCGrillas.ActivePage = TSHembras) then
            if BDBGGrillaHembras.DataSource.DataSet.RecordCount > 0 then
              SBBarrita.Max := BDBGGrillaHembras.DataSource.DataSet.RecordCount
            else
              SBBarrita.Max := 1;

          if (PCGrillas.ActivePage = TSMachos) then
            if BDBGGrillaMachos.DataSource.DataSet.RecordCount > 0 then
              SBBarrita.Max := BDBGGrillaMachos.DataSource.DataSet.RecordCount
            else
              SBBarrita.Max := 1;

          SBBarrita.Min := 1;

          CalcularIncremento(SBBarrita.Max);
          AjustarPanelesLaterales;

          BDBGGrillaHembras.DataSource.DataSet.RecNo := aux+1;
          BDBGGrillaMachos.DataSource.DataSet.RecNo := aux+1;

          Posicion := aux;
          regActual := aux;

          BotonPulsado := false;
          BDBGGrillaHembras.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
          BDBGGrillaMachos.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

//-----------------------------------------------------------------------------


      end;
    end
   else
    begin
      if agregar and BDBGGrillaHembras.DataSource.DataSet.IsEmpty and BDBGGrillaMachos.DataSource.DataSet.IsEmpty then
        begin
         MostrarMensaje(tmAdvertencia, 'Faltan datos para Generar los Animales');
         PCBasico.ActivePageIndex := 0;
        end;
    end;
  if(PCBasico.ActivePage=TSHObservacion) then
    begin

    PADatosEcon.Visible:= false;
    PADatosIndent.Visible:= false;
    PAIdentificar.Visible:= false;
    PANoIdentificar.Visible:= false;
    PADatosUbicacion.Visible:= false;
    PAVacaVaquillona.Visible:= false;
    PADatosGral.Visible:= false;
    PAParticularToro.Visible:= false;
    PAParticularTerNov.Visible:= false;
    PADatosCom.Visible:= false;
    if FPrincipal.AsistenteCargaMasiva then
      PAPlanillaAM.Visible:= true;

    LoadSQLStringList;    //1      2
    TSHembras.Caption:=Traducir('Hembras(')+inttostr(CDSGrillaHembras.RecordCount)+')';
    TSMachos.Caption:=Traducir('Machos(')+inttostr(CDSGrillaMachos.RecordCount)+')';
    SBSelTodos.Visible:=true;
    ISelTodos.Visible := true;
    LSelTodos.Visible := true;

    //BAgregarAnimal.Visible:=true;
    LAgregarAnimal.Visible := true;
    IAgregarAnimal.Visible := true;
    if (MAErrors.Lines.Count>0) then
      PError.Visible:=true;  //1
    if not BDBGGrillaMachos.DataSource.DataSet.IsEmpty then
      begin
      TSMachos.TabVisible:=true;
      BDBGGrillaMachos.Repaint;
      end;
    if not BDBGGrillaHembras.DataSource.DataSet.IsEmpty then
      begin
      TSHembras.TabVisible:=true;   //1      2
      BDBGGrillaHembras.Repaint;
      end;
    PCGrillasChange(self);
    end
  else
    begin
    if agregar then
      begin
      EACantidad.EsRequerido:=true;
      RBRp.Checked:=true;
      RBRpClick(self);
      end;
    CantComps := 0;                       //1
    SetLength(ArrComponents,CantComps);
    //BAgregarAnimal.Visible:=false;
    IAgregarAnimal.Visible := false;
    LAgregarAnimal.Visible := false;
    //BSacarAnimal.Visible:=false;
    ISacarAnimal.Visible := false;
    LSacarAnimal.Visible := false;
    SBSelTodos.Visible:=false;
    PAPlanillaAM.Visible:= false;  
    end;

  if(PCBasico.ActivePage = TSHDatos)then
    begin
    CantComps := 0;
    SetLength(ArrComponents,CantComps);
    CBSexoChange(self);
    if not agregar then
      begin
      EACantidad.Enabled:=false;            //1
      eaCantidad.EsRequerido:=false;
      //DBLCBAActividad.EsRequerido:=false;
      //DBLCBAActividad.Enabled:=false;
      if (CBSexo.ItemIndex=0) then
        if (BDBGGrillaMachos.SelectedRows.Count>=1) then
          EACantidad.Text:=IntToStr(BDBGGrillaMachos.SelectedRows.Count);
        //else
          //EACantidad.Text:=IntToStr(BDBGGrillaMachos.DataSource.DataSet.RecordCount);
      if (CBSexo.ItemIndex=1) then
        if (BDBGGrillaHembras.SelectedRows.Count>=1) then
          EACantidad.Text:=IntToStr(BDBGGrillaHembras.SelectedRows.Count);
        //else
          //EACantidad.Text:=IntToStr(BDBGGrillaHembras.DataSource.DataSet.RecordCount);
      //EACantidad.Text:=//inttostr(BDBGGrillaHembras.DataSource.DataSet.RecordCount+BDBGGrillaMachos.DataSource.DataSet.RecordCount);
      CBSexo.Enabled:=false;
      for i:=0 to GBIdentificacion.ControlCount-1 do
        GBIdentificacion.Controls[i].Enabled:=false;
      end
    else
      begin
      EACantidad.Enabled:=true;
      EACantidad.Text:='';
      CBSexo.Enabled:=true;
      for i:=0 to GBIdentificacion.ControlCount-1 do
        GBIdentificacion.Controls[i].Enabled:=true;
      end;
    end;
  ControlEventoOnExit(Self);
end;


function TFEveAltaMasiva.CompletarRP (Valor : Integer) : String;
var longTotal, longValor, max, i : integer;
    val, resultado : String;
begin

  if (EARPInicial.Text <> 'N/N') then
  begin
      longTotal := length(EARPInicial.Text);
      val := IntToStr(Valor);
      longValor := length(val);
      max := longTotal-longValor;
      SetLength(resultado,max);

      for i := 1 to max do
        resultado[i] := '0';

      Result := resultado+val;
  end
  else
      Result := 'N/N';
      if (altaDesdeEvento) then
        Result := Equivalencias[Valor].RP;
end;

procedure TFEveAltaMasiva.GeneraGrilla;
var i,rpInicial, cantidad, R, carOficial:integer;
    edad :integer;
    fecha: TDate;
    min, max, cod : Integer;
    cantidadEQ, iEquiv : Integer;
    cadenaSenasa : string;
begin
  inherited;
  //PaintRequired;

  cantidad :=  StrToInt(EACantidad.Text);
  cantidadEQ := 0;

  if ((identCUIGSenasa) or (identReidentSenasa)) then
  begin
    if identRp and TryStrToInt(EARpInicial.Text, rpInicial) then
    begin
      rpInicial := StrToInt(EARpInicial.Text);
      min := rpInicial;
      max := rpInicial + cantidad - 1;
    end
    else
    begin
      min := 1;
      max := cantidad;
    end;
  end
  else
  begin
    if not cargaEQ then
    begin
      if (EARpInicial.Text <> 'N/N') then
      begin
          rpInicial := StrToInt(EARpInicial.Text);
          min := rpInicial;
          max := rpInicial + cantidad - 1;
      end
      else
      begin
           min := 0;
           max := StrToInt(EACantidad.Text)-1;
      end;
      if identSenasa then
      begin
        carOficial := StrToInt(EACarOficial.Text);
        min := carOficial;
        max := carOficial + cantidad - 1;
      end;
    end
    else
    begin
      {***************Nico 30-07-2015*************************}
      if identRp and TryStrToInt(EARpInicial.Text, rpInicial) then
        begin
          rpInicial := StrToInt(EARpInicial.Text);
          min := rpInicial;
          max := rpInicial + cantidad - 1;
        end
      else
        if (FPrincipal.Pais <> 1) and (identSenasa) and (TryStrToInt(EACarOficial.Text, rpInicial)) then
          begin
            rpInicial := StrToInt(EACarOficial.Text);
            min := rpInicial;
            max := rpInicial + cantidad - 1;
          end
        else
          begin
            min := 0;
            max := Length(Equivalencias)-1;
          end;
      {**************************************}
    end;
  end;

  IdentCUIG := EAUltimoIdent.Text;
  PrimerIdentificador := IdentCUIG;
  //*/*/*/
  IdentReidentificacion:= EAUltimoIdentReidentificacion.Text;
  FAvanceTerminar := TFAvanceTerminar.Create(self);
  FAvanceTerminar.Pos := 1;
  FAvanceTerminar.Max := StrToInt(EACantidad.Text);
  FAvanceTerminar.Modo := maDetalle;

  FAvanceTerminar.Update;
  FAvanceTerminar.Pos := 1;
  iEquiv := 0;

  cod := DBLCBACategoria.KeyValue;
  if IBQCategorias.FieldByName('ref_categ').Value <> null then
    cod := IBQCategorias.FieldByName('ref_categ').Value;

  //*/*/

  if ((CBSexo.ItemIndex = 0){and(CDSGrillaMachos.RecordCount = 0)})  then
    begin  //ciclo de machos.
      //CBDiagnostico.Visible := false;
      for i := min to max do
      begin
          IBQGenIDAnimal.Close;
          IBQGenIDAnimal.Open;
          CDSGrillaMachos.Insert;

          if identRp then
          begin
              CDSGrillaMachos.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarRP(i) + EASufijo.Text;
              //CDSGrillaMachos.FieldByName('id_senasa').AsString := '';
              if identSenasa then
              begin
                CDSGrillaMachos.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarRP(rpInicial) + EASufijo.Text;
                Inc(rpInicial);
              end;
          end;

          if identSenasa then
          begin
              //CDSGrillaMachos.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text;
              if(FPrincipal.Pais = 1)then
                CDSGrillaMachos.FieldByName('id_senasa').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text
              else
                if(FPrincipal.Pais <> 1)then
                  if(EditAuto1.GetDato <> null)then
                  begin
                  // ------------------------------------
                  {Incidencia 639. Mariano Martinez}
                    // CDSGrillaMachos.FieldByName('caravana_oficial').AsString := EditAuto1.Text + IntToStr(i) ;
                    CDSGrillaMachos.FieldByName('caravana_oficial').AsString :=
                            generaCaravanaOficial(EditAuto1.Text, EARpInicial.Text, CDSGrillaMachos.RecordCount);

                  // ------------------------------------
                  end
                  else
                    CDSGrillaMachos.FieldByName('caravana_oficial').AsString := EACarOficial.Text;

              if not identRp then
                if(FPrincipal.Pais = 1)then
                  CDSGrillaMachos.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text
                else
                  CDSGrillaMachos.FieldByName('id_rp').AsString := IntToStr(i);
          end;

          if identCUIGSenasa then
          begin
              //no se necesita el verificador cuando generamos el rp en base al cuig
              //verificador := UFunctions.DigitoVerificadorCaravana(EAEncabezado.Text+IdentCUIG);

              cadenaSenasa := EAEncabezado.Text + IdentCUIG; //+ IntToStr(verificador);

              //CDSGrillaMachos.FieldByName('id_rp').AsString := cadenaSenasa;//EAEncabezado.Text + EAUltimoIdent.Text + IntToStr(verificador);
              CDSGrillaMachos.FieldByName('id_senasa').AsString := cadenaSenasa;
              if not identRp then
                CDSGrillaMachos.FieldByName('id_rp').AsString := cadenaSenasa;//EAEncabezado.Text + EAUltimoIdent.Text + IntToStr(verificador);
              IdentCUIG := UFunctions.IncrementarIdentificadorCUIG(IdentCUIG);
          end;
          
          if identElectronica then
          begin
            if((not identRp) and (not identSenasa) and (not identReidentSenasa) and (not identCUIGSenasa))then
              if(Length(Equivalencias) > 0)then
                CDSGrillaMachos.FieldByName('id_rp').AsString := Equivalencias[iEquiv].RP;
            if(Length(Equivalencias) > 0)then
              CDSGrillaMachos.FieldByName('id_ie').AsString := Equivalencias[iEquiv].IE;
              //CDSGrillaMachos.FieldByName('id_senasa').AsString := '';
          end;

          if identReidentSenasa then
          begin
              //CDSGrillaMachos.FieldByName('id_rp').AsString := 'R' + EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text;
              CDSGrillaMachos.FieldByName('id_senasa').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
              if not identRp then
                CDSGrillaMachos.FieldByName('id_rp').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
              IdentReidentificacion := UFunctions.IncrementarIdentificadorCUIG(IdentReidentificacion);
          end;

          CDSGrillaMachos.FieldByName('TIPO_ALTA').AsInteger := DBLCBAtipoAlta.ListSource.DataSet.Lookup('NOMBRE',DBLCBAtipoAlta.Text,'ID_TIPO_ALTA');
          CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime := DTPAFechaAlta.DateTime;
          CDSGrillaMachos.FieldByName('id_animal').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];
          CDSGrillaMachos.FieldByName('id_aux').AsInteger := i;

          //ChequearCampoEnGrilla('id_rp',CDSGrillaMachos.FieldByName('id_rp').AsString,'');
//          setText(CDSGrillaMachos.FieldByName('id_rp'),CDSGrillaMachos.FieldByName('id_rp').AsString);
          CDSGrillaMachos.FieldByName('nombre').AsString:= '';
          CDSGrillaMachos.FieldByName('peso').Value := StrToFloat(EAPeso.Text);
          if EAPeso.Text<>'' then
            CDSGrillaMachosPESOSetText(CDSGrillaMachos.FieldByName('peso'),EAPeso.Text);
          CDSGrillaMachos.FieldByName('condicion_corporal').Value:= DBLCBACondicionC.KeyValue;
          CDSGrillaMachos.FieldByName('V2').AsString:= DBLCBACondicionC.Text;
          CDSGrillaMachos.FieldByName('categoria').AsInteger:= DBLCBACategoria.KeyValue;
          CDSGrillaMachos.FieldByName('V5').AsString:= DBLCBACategoria.Text;
          CDSGrillaMachos.FieldByName('DTA').AsString := EADta.Text;
          CDSGrillaMachos.FieldByName('cronologia_dentaria').AsInteger:= DBLCBACronologiaD.KeyValue;
          CDSGrillaMachos.FieldByName('V3').AsString:= DBLCBACronologiaD.Text;
          edad := StrToInt(EAEdad.text);
          fecha := incMonth(CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime,-edad);
          CDSGrillaMachos.FieldByName('fecha_nacimiento').AsDateTime:= fecha;
          CDSGrillaMachos.FieldByName('circunferencia_escrotal').AsFloat:= StrToFloat(EACircunferenciaEscrotal.Text);
          CDSGrillaMachos.FieldByName('raza').AsInteger := DBLCBARaza.KeyValue;
          CDSGrillaMachos.FieldByName('V6').AsString := DBLCBARaza.Text;

          if (CDSGrillaMachos.FieldByName('id_rp').AsString <> 'N/N') then
          begin
            if (CantidadRepetidos('id_rp',CDSGrillaMachos.FieldByName('id_rp').AsString,IBQRepetidos, 'select count(*) as cantidad from AUX_animales ')>0) then
            begin
                 CDSGrillaMachos.FieldByName('ew').AsString := 'E';
                 MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'RP' ) +' = '+CDSGrillaMachos.FieldByName('id_rp').AsString);
            end
            else
                CDSGrillaMachos.FieldByName('ew').AsString := ' ';
          end;

          CDSGrillaMachos.FieldByName('RODEO').AsInteger := DBLCBARodeo.KeyValue;
          CDSGrillaMachos.FieldByName('V8').AsString := DBLCBARodeo.Text;
          if not BDBGGrillaMachos.ColumnByField('V9').ReadOnly and (DBLCBATiposPeso.Text<>'') then
          begin
            CDSGrillaMachos.FieldByName('VUno1').AsString := DBLCBATiposPeso.KeyValue;
            CDSGrillaMachos.FieldByName('V9').AsString := DBLCBATiposPeso.Text;
          end
          else
          begin
            CDSGrillaMachos.FieldByName('VUno1').AsString := 'G';
            CDSGrillaMachos.FieldByName('V9').AsString := 'GENERAL';
          end;
          CDSGrillaMachos.FieldByName('POTRERO').AsInteger := DBLCBAPotrero.KeyValue;
          CDSGrillaMachos.FieldByName('V7').AsString := DBLCBAPotrero.Text;

          if MAObservacion.Text<>'' then
            CDSGrillaMachos.FieldByName('OBSERVACION').AsString := MAObservacion.Text
          else
            CDSGrillaMachos.FieldByName('OBSERVACION').AsString := '';
          CDSGrillaMachos.FieldByName('RESPONSABLE').AsString := DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',DBLCBAResponsable.Text,'ID_EMPLEADO');
          CDSGrillaMachos.FieldByName('SEXO').AsInteger := 1;

          if (EAValortotal.Text <> '')and(EACantidad.text<>'') then
           CDSGrillaMachos.FieldByName('PRECIO_UNITARIO').AsFloat := StrToFloat(EAValortotal.Text)/StrToInt(EACantidad.text)
          else
            CDSGrillaMachos.FieldByName('PRECIO_UNITARIO').AsFloat := 0;

          if(CDSGrillaMachos.FieldByName('peso').Value <> null) and (CDSGrillaMachos.FieldByName('peso').Value<>0) then
            CDSGrillaMachos.FieldByName('PRECIO_BRUTO').AsFloat := (CDSGrillaMachos.FieldByName('PRECIO_UNITARIO').AsFloat)/CDSGrillaMachos.FieldByName('peso').Value
          else
            CDSGrillaMachos.FieldByName('PRECIO_BRUTO').AsFloat := 0;

          if (EAValorNeto.Text <> '')and(EACantidad.text<>'') then CDSGrillaMachos.FieldByName('GASTOS').AsFloat := StrToFloat(EAValorNeto.Text)/StrToInt(EACantidad.text)
          else CDSGrillaMachos.FieldByName('GASTOS').AsFloat := 0;

          CDSGrillaMachos.FieldByName('ACTIVIDAD').AsInteger:= DBLCBAActividad.KeyValue;
          CDSGrillaMachos.FieldByName('V10').AsString:= DBLCBAActividad.Text;

          CDSGrillaMachos.FieldByName('ORIGEN_ANIMAL').AsInteger:=DBLCBAOrigen.KeyValue;
          CDSGrillaMachos.FieldByName('V11').AsString:=DBLCBAOrigen.Text;
          CDSGrillaMachos.FieldByName('CRIADOR').AsInteger:=DBLCBACriador.KeyValue;
          CDSGrillaMachos.FieldByName('V12').AsString:=DBLCBACriador.Text;
          CDSGrillaMachos.FieldByName('PROPIETARIO').AsInteger:=DBLCBAPropietario.KeyValue;
          CDSGrillaMachos.FieldByName('V13').AsString:=DBLCBAPropietario.Text;
          CDSGrillaMachos.FieldByName('COLOR').AsInteger := DBLCBAColor.KeyValue;
          CDSGrillaMachos.FieldByName('NOMCOLOR').AsString := DBLCBAColor.Text;

          //******************************************************//
          //	INCIDENCIA: 401									                    //
          //	INICIO Asignación de valor a nueva columna.         //
          //	Carla Gareis							              28/11/2014  //
          //******************************************************//
          CDSGrillaMachos.FieldByName('INFORMADO_AFIP').AsString := CBInformadoAfip.Text;
          //******************************************************//
          //	INCIDENCIA: 401									                    //
          //	FIN Asignación de valor a nueva columna.            //
          //	Carla Gareis							              28/11/2014  //
          //******************************************************//

          CDSGrillaMachos.FieldByName('SUBCATEGORIA').AsInteger:= DBLCBASubCategoria.KeyValue;
          CDSGrillaMachos.FieldByName('V14').AsString:= DBLCBASubCategoria.Text;

          R := DBLCBARaza.KeyValue;
          if R in [12,28,11,10,5] then
          begin
            CDSGrillaMachos.FieldByName('MOCHO').Value := DBLCBAMocho.KeyValue;
            CDSGrillaMachos.FieldByName('V17').AsString := DBLCBAMocho.Text;
            if R <> 5 then
            begin
              CDSGrillaMachos.FieldByName('INSPECCION').Value := DBLCBAInspeccion.KeyValue;
              CDSGrillaMachos.FieldByName('V15').AsString := DBLCBAInspeccion.Text;
              CDSGrillaMachos.FieldByName('DESTINO_CAB').Value := DBLCBADestCabania.KeyValue;
              CDSGrillaMachos.FieldByName('V16').AsString := DBLCBADestCabania.Text;
            end
          end;

          if((cod = 1) and (CBSexo.ItemIndex = 0))then
            if (CBCastrado.Checked) then
              CDSGrillaMachos.FieldByName('VUNO2').Value:=1
             else
               CDSGrillaMachos.FieldByName('VUNO2').Value:=0;

          iEquiv := iEquiv + 1;
          CDSGrillaMachos.Post;
          CDSGrillaMachos.Transaction.CommitRetaining;
          //FPrincipal.IBTPrincipal.CommitRetaining;

          //*/*/*/

          FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
          FAvanceTerminar.Update;
          Application.ProcessMessages;
          //*/*/*/*
      end;
     end
  else
    {if (CDSGrillaHembras.RecordCount = 0) then}
     begin //ciclo de Hembras
      iEquiv := 0;
      //CBDiagnostico.Visible := true;
      for i := min to max do
      begin
           IBQGenIDAnimal.Close;
           IBQGenIDAnimal.Open;
           CDSGrillaHembras.Insert;

           if identRp then
           begin
              CDSGrillaHembras.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarRP(i) + EASufijo.Text;
              //CDSGrillaHembras.FieldByName('id_senasa').AsString := '';
              if identSenasa then
              begin
                CDSGrillaHembras.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarRP(rpInicial) + EASufijo.Text;
                Inc(rpInicial);
              end;
           end;

           if identSenasa then
           begin
              //CDSGrillaHembras.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text;
              if(FPrincipal.Pais = 1)then
                CDSGrillaHembras.FieldByName('id_senasa').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text
              else
                if(FPrincipal.Pais <> 1)then
                  if(EditAuto1.GetDato <> null)then
                    CDSGrillaHembras.FieldByName('caravana_oficial').AsString := EditAuto1.Text + IntToStr(i)
                  else
                    CDSGrillaHembras.FieldByName('caravana_oficial').AsString := EACarOficial.Text;

              if not identRp then
                if(FPrincipal.Pais = 1)then
                  CDSGrillaHembras.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text
                else
                  CDSGrillaHembras.FieldByName('id_rp').AsString := IntToStr(i);
           end;

           if identCUIGSenasa then
           begin
              //verificador := UFunctions.DigitoVerificadorCaravana(EAEncabezado.Text+IdentCUIG);

              cadenaSenasa := EAEncabezado.Text + IdentCUIG; //+ IntToStr(verificador);

              //CDSGrillaHembras.FieldByName('id_rp').AsString := cadenaSenasa;//EAEncabezado.Text + EAUltimoIdent.Text + IntToStr(verificador);
              CDSGrillaHembras.FieldByName('id_senasa').AsString := cadenaSenasa;
              if not identRp then
                CDSGrillaHembras.FieldByName('id_rp').AsString := cadenaSenasa;//EAEncabezado.Text + EAUltimoIdent.Text + IntToStr(verificador);
              IdentCUIG := UFunctions.IncrementarIdentificadorCUIG(IdentCUIG);
           end;

           if identElectronica then
           begin
            if((not identRp) and (not identSenasa) and (not identReidentSenasa) and (not identCUIGSenasa))then
              if(Length(Equivalencias) > 0)then
                CDSGrillaHembras.FieldByName('id_rp').AsString := Equivalencias[iEquiv].RP;
              if(Length(Equivalencias) > 0)then
                CDSGrillaHembras.FieldByName('id_ie').AsString := Equivalencias[iEquiv].IE;
              //CDSGrillaHembras.FieldByName('id_rp').AsString := Equivalencias[i].RP;
              //CDSGrillaHembras.FieldByName('id_ie').AsString := Equivalencias[i].IE;
              //CDSGrillaHembras.FieldByName('id_senasa').AsString := '';
           end;

           if identReidentSenasa then
           begin
              //CDSGrillaHembras.FieldByName('id_rp').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
              CDSGrillaHembras.FieldByName('id_senasa').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
              if not identRp then
                CDSGrillaHembras.FieldByName('id_rp').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
              IdentReidentificacion := UFunctions.IncrementarIdentificadorCUIG(IdentReidentificacion);
           end;

          CDSGrillaHembras.FieldByName('TIPO_ALTA').AsInteger := DBLCBAtipoAlta.ListSource.DataSet.Lookup('NOMBRE',DBLCBAtipoAlta.Text,'ID_TIPO_ALTA');
          CDSGrillaHembras.FieldByName('FECHA_ALTA').AsDateTime := DTPAFechaAlta.DateTime;
          CDSGrillaHembras.FieldByName('id_animal').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];
          CDSGrillaHembras.FieldByName('id_aux').AsInteger := i;
 //**/
          CDSGrillaHembras.FieldByName('nombre').AsString:= '';
          CDSGrillaHembras.FieldByName('peso').Value:= StrToFloat(EAPeso.Text);
          if EAPeso.Text<>'' then
            CDSGrillaHembrasPESOSetText(CDSGrillaHembras.FieldByName('peso'),EAPeso.Text);
          CDSGrillaHembras.FieldByName('GDR').AsInteger:= DBLCBAGdr.KeyValue;

          CDSGrillaHembras.FieldByName('V1').AsString:= DBLCBAGdr.Text;
          CDSGrillaHembras.FieldByName('DTA').AsString := EADta.Text;
          CDSGrillaHembras.FieldByName('cronologia_dentaria').AsInteger:= DBLCBACronologiaD.KeyValue;
          CDSGrillaHembras.FieldByName('V3').AsString:= DBLCBACronologiaD.Text;
          if  EAEstadoLactacion.Enabled then
             CDSGrillaHembras.FieldByName('estado_lactacion').AsInteger:= StrToInt(EAEstadoLactacion.Text)
            else
             CDSGrillaHembras.FieldByName('estado_lactacion').AsInteger:= 0;
          CDSGrillaHembras.FieldByName('estado_reproductivo').AsInteger:= DBLCBAEstadoR.KeyValue;
          CDSGrillaHembras.FieldByName('V4').AsString:= DBLCBAEstadoR.Text;

          if (not BDBGGrillaHembras.ColumnByField('V9').ReadOnly) and (DBLCBATiposPeso.Text<>'') then
          begin
            CDSGrillaHembras.FieldByName('VUno1').AsString := DBLCBATiposPeso.KeyValue;
            CDSGrillaHembras.FieldByName('V9').AsString := DBLCBATiposPeso.Text;
          end
          else
          begin
            CDSGrillaHembras.FieldByName('VUno1').AsString := 'G';
            CDSGrillaHembras.FieldByName('V9').AsString := 'GENERAL';
          end;

          CDSGrillaHembras.FieldByName('condicion_corporal').Value:= DBLCBACondicionC.KeyValue;
          CDSGrillaHembras.FieldByName('V2').AsString:= DBLCBACondicionC.Text;
          CDSGrillaHembras.FieldByName('CATEGORIA').AsInteger:= DBLCBACategoria.KeyValue;
          CDSGrillaHembras.FieldByName('V5').AsString:= DBLCBACategoria.Text;
          edad := StrToInt(EAEdad.text);
          fecha := incMonth(CDSGrillaHembras.FieldByName('fecha_alta').AsDateTime,-edad);
          CDSGrillaHembras.FieldByName('fecha_nacimiento').AsDateTime:= fecha;
          CDSGrillaHembras.FieldByName('raza').AsInteger:= DBLCBARaza.KeyValue;
          CDSGrillaHembras.FieldByName('V6').AsString:= DBLCBARaza.Text;

          if (CDSGrillaHembras.FieldByName('id_rp').AsString <> 'N/N') then
          begin
              if (CantidadRepetidos('id_rp',CDSGrillaHembras.FieldByName('id_rp').AsString,IBQRepetidos, 'select count(*) as cantidad from AUX_animales ')>0) then
                  begin
                  CDSGrillaHembras.FieldByName('ew').AsString := 'E';
                  MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'RP'  )+' = '+CDSGrillaHembras.FieldByName('id_rp').AsString);
                  end
              else
                  CDSGrillaHembras.FieldByName('ew').AsString := ' ';
          end;

          CDSGrillaHembras.FieldByName('RODEO').AsInteger := DBLCBARodeo.KeyValue;
          CDSGrillaHembras.FieldByName('V8').AsString := DBLCBARodeo.Text;
          CDSGrillaHembras.FieldByName('POTRERO').AsInteger := DBLCBAPotrero.KeyValue;
          CDSGrillaHembras.FieldByName('V7').AsString := DBLCBAPotrero.Text;

          if MAObservacion.Text<>'' then
            CDSGrillaHembras.FieldByName('OBSERVACION').AsString := MAObservacion.Text
          else
            CDSGrillaHembras.FieldByName('OBSERVACION').AsString := '';

          CDSGrillaHembras.FieldByName('RESPONSABLE').AsInteger := DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',DBLCBAResponsable.Text,'ID_EMPLEADO');
          CDSGrillaHembras.FieldByName('SEXO').AsInteger := 2;


          if (EAValortotal.Text <> '')and(EACantidad.text<>'') then
           CDSGrillaHembras.FieldByName('PRECIO_UNITARIO').AsFloat := StrToFloat(EAValortotal.Text)/StrToInt(EACantidad.text)
          else
            CDSGrillaHembras.FieldByName('PRECIO_UNITARIO').AsFloat := 0;

          if(CDSGrillaHembras.FieldByName('peso').Value <> null) and (CDSGrillaHembras.FieldByName('peso').Value<>0) then
            CDSGrillaHembras.FieldByName('PRECIO_BRUTO').AsFloat := (CDSGrillaHembras.FieldByName('PRECIO_UNITARIO').AsFloat)/CDSGrillaHembras.FieldByName('peso').Value
          else
            CDSGrillaHembras.FieldByName('PRECIO_BRUTO').AsFloat := 0;

          if (EAValorNeto.Text <> '')and(EACantidad.text<>'') then CDSGrillaHembras.FieldByName('GASTOS').AsFloat := StrToFloat(EAValorNeto.Text)/StrToInt(EACantidad.text)
          else CDSGrillaHembras.FieldByName('GASTOS').AsFloat := 0;

          CDSGrillaHembras.FieldByName('ACTIVIDAD').AsInteger:= DBLCBAActividad.KeyValue;
          CDSGrillaHembras.FieldByName('V10').AsString:= DBLCBAActividad.Text;

          CDSGrillaHembras.FieldByName('ORIGEN_ANIMAL').AsInteger:=DBLCBAOrigen.KeyValue;
          CDSGrillaHembras.FieldByName('V11').AsString:=DBLCBAOrigen.Text;
          CDSGrillaHembras.FieldByName('CRIADOR').AsInteger:=DBLCBACriador.KeyValue;
          CDSGrillaHembras.FieldByName('V12').AsString:=DBLCBACriador.Text;
          CDSGrillaHembras.FieldByName('PROPIETARIO').AsInteger:=DBLCBAPropietario.KeyValue;
          CDSGrillaHembras.FieldByName('V13').AsString:=DBLCBAPropietario.Text;

          CDSGrillaHembras.FieldByName('COLOR').AsInteger := DBLCBAColor.KeyValue;
          CDSGrillaHembras.FieldByName('NOMCOLOR').AsString := DBLCBAColor.Text;

          //******************************************************//
          //	INCIDENCIA: 401									                    //
          //	INICIO Asignación de valor a nueva columna.         //
          //	Carla Gareis							              28/11/2014  //
          //******************************************************//
          CDSGrillaHembras.FieldByName('INFORMADO_AFIP').AsString := CBInformadoAfip.Text;
          //******************************************************//
          //	INCIDENCIA: 401									                    //
          //	FIN Asignación de valor a nueva columna.            //
          //	Carla Gareis							              28/11/2014  //
          //******************************************************//

          CDSGrillaHembras.FieldByName('SUBCATEGORIA').AsInteger:= DBLCBASubCategoria.KeyValue;
          CDSGrillaHembras.FieldByName('V14').AsString:= DBLCBASubCategoria.Text;

          R := DBLCBARaza.KeyValue;
          if R in [12,28,11,10,5] then
          begin
            CDSGrillaHembras.FieldByName('MOCHO').Value := DBLCBAMocho.KeyValue;
            CDSGrillaHembras.FieldByName('V17').AsString := DBLCBAMocho.Text;
            if R <> 5 then
            begin
              CDSGrillaHembras.FieldByName('INSPECCION').Value := DBLCBAInspeccion.KeyValue;
              CDSGrillaHembras.FieldByName('V15').AsString := DBLCBAInspeccion.Text;
              CDSGrillaHembras.FieldByName('DESTINO_CAB').Value := DBLCBADestCabania.KeyValue;
              CDSGrillaHembras.FieldByName('V16').AsString := DBLCBADestCabania.Text;
            end
          end;

          iEquiv := iEquiv + 1;
          CDSGrillaHembras.Post;
          //Fprincipal.IBTPrincipal.CommitRetaining;
          CDSGrillaHembras.Transaction.CommitRetaining;
          //*/*/*/
          FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
          FAvanceTerminar.Update;
          Application.ProcessMessages;
          //*/*/*/*

      end;
    end;
    //*/*/*/*/*
  //FAvanceTerminar.Close;
  FAvanceTerminar.Destroy;
    //*/*/*
  LoadSQLStringList;
  PaintRequired;
end;


procedure TFEveAltaMasiva.ASiguienteExecute(Sender: TObject);
var
  categoria: Integer;
begin
 if agregar then
 begin
   {if (CBSexo.ItemIndex = 0) then
    categoria:= DBLCBACategoria.KeyValue
   else}
   categoria:= DBLCBACategoria.KeyValue;
   if IBQCategorias.FieldByName('ref_categ').Value <> null then
    categoria := IBQCategorias.FieldByName('ref_categ').Value;

   If (CBSexo.ItemIndex=1) and (categoria=6) and (EAEstadoLactacion.Text<'1') then
     begin
     MostrarMensaje(tmAdvertencia,'La cantidad de partos de una vaca debe ser mayor que 0');
     abort;
     end;
   if (controlNacimientoCategoria(StrToInt(EAEdad.Text),categoria)) then
   begin
    if(PCBasico.ActivePage=TSHDatos) and ((EACantidad.Text='')or(EACantidad.Text='0')) then
    begin
      MostrarMensaje(tmAdvertencia, 'Debe ingresar una cantidad de animales a dar de alta');
      abort;
    end;
    if (identReidentSenasa and (not controlarReidentificacion(EAUltimoIdentReidentificacion.Text))) or
    (identCUIGSenasa and (not CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) or ((identSenasa) and((StrToInt(EARpInicial.Text) + StrToInt(EACantidad.Text)-1) > 999999999)))then
    begin
      PCBasico.ActivePageIndex := 0;
      MostrarMensaje(tmAdvertencia, 'Los identificadores superan el límite permitido');
    end
    else
    begin
      inherited;
      if RpGenerados and (StrToInt(EARpInicial.Text) <> 0)then
      begin
        CDSGrillaHembras.Active := false;
        CDSGrillaHembras.Active := true;
        CDSGrillaMachos.Active := false;
        CDSGrillaMachos.Active := true;
        GeneraGrilla;
      end;
      ControlEventoOnExit(Self);
    end;
   end;
 end
 else
  begin
  PCBasicoChanging(self,permitir);
  inherited;
  PCBasicoChange(self);
  end;

  if not (identRp)  then
  begin
    if(not identElectronica)then
      begin
        BDBGGrillaHembras.Columns[1].Visible := false;
        BDBGGrillaMachos.Columns[1].Visible := false;
      end
    else
      begin
        BDBGGrillaHembras.Columns[1].Visible := true;
        BDBGGrillaMachos.Columns[1].Visible := true;
      end
  end;

  if((identSenasa) and (FPrincipal.Pais <> 1))then
    begin
      BDBGGrillaMachos.Columns[2].FieldName := 'caravana_oficial';
      BDBGGrillaMachos.Columns[2].Title.Caption := 'Caravana Oficial';
      BDBGGrillaMachos.Columns[2].Width := 150;
      BDBGGrillaMachos.Columns[2].Visible := true;
      BDBGGrillaHembras.Columns[2].FieldName := 'caravana_oficial';
      BDBGGrillaHembras.Columns[2].Title.Caption := 'Caravana Oficial';
      BDBGGrillaHembras.Columns[2].Width := 150;
      BDBGGrillaHembras.Columns[2].Visible := true;
    end;

  //BDBGGrillaHembras.Columns[13].Title.Caption := 'Caravana';
  //BDBGGrillaMachos.Columns[13].Title.Caption := 'Caravana';

  if (BDBGGrillaHembras.Visible) then
    if (PCGrillas.ActivePage = TSHembras) then
      BDBGGrillaHembras.SetFocus;

  if (BDBGGrillaMachos.Visible) then
    if (PCGrillas.ActivePage = TSMachos) then
      BDBGGrillaMachos.SetFocus;

end;

{
function TFEveAltaMasiva.controlarCuig(IdentCUIG : String):Boolean;
var
  numero:String;
  num : Integer;
  letra : Char;
begin
    Result:=true;
    letra := IdentCUIG[1];
    numero := IdentCUIG[2]+IdentCUIG[3]+IdentCUIG[4];
    num := StrToInt(numero);

    if (letra = 'Z') and (num + StrToInt(EACantidad.Text)-1 > 999  ) then
      Result:=false;
end;
 }
 
function TFEveAltaMasiva.controlarReidentificacion(IdentReidentificacion : String):Boolean;
var
  num : Integer;
begin
    Result:=true;
    num := StrToInt(IdentReidentificacion);

    if (num + StrToInt(EACantidad.Text)-1 > 9999  ) then
      Result:=false;
end;

procedure TFEveAltaMasiva.EACantidadExit(Sender: TObject);
begin
  inherited;
  //MAErrors.Lines.Clear;
  GetEvent(sender);
  ControlEventoOnExit(sender);
end;

procedure TFEveAltaMasiva.CargarPickListEnGrilla;
var i: integer;
begin

  for i := 0 to SQLStringList.Count -1 do
   if not((TDataSource(SQLStringList.Objects[i]).DataSet).IsEmpty)then
     FillPickList(SQLStringList.Strings[i], TDataSource(SQLStringList.Objects[i]).DataSet);

end;

procedure TFEveAltaMasiva.PaintRequired;
var i,j : integer;
begin
    for i:= 0 to BDBGGrillaHembras.Columns.Count - 1 do
       if (BDBGGrillaHembras.Columns[i].ReadOnly)then
          BDBGGrillaHembras.Columns[i].Color := $00FAEDE2;
    for j:= 0 to BDBGGrillaMachos.Columns.Count - 1 do
       if (BDBGGrillaMachos.Columns[j].ReadOnly)then
          BDBGGrillaMachos.Columns[j].Color := $00FAEDE2;
end;

procedure TFEveAltaMasiva.FillPickList(const campo: string;
  const Qry: TDataSet);
var slPickList: TStringList;
    i,j:integer;
    aux:integer;
begin
  slPickList:= TStringList.Create;
  try
   Qry.First;
    while not (Qry.Eof) do
    begin
     if (TryStrToInt(Qry.Fields[0].AsString,aux)) then
        slPickList.AddObject(Qry.Fields[1].AsString, TClassType.CreateClassTypeInteger(Qry.Fields[0].AsInteger))
     else
        slPickList.AddObject(Qry.Fields[1].AsString, TClassType.CreateClassTypeString(Qry.Fields[0].AsString));
      Qry.Next;
    end;
//   if sexo=2{(CBSexo.Text = 'Hembras')} then
//     begin
      for i:= 0 to BDBGGrillaHembras.Columns.Count - 1 do
        if(BDBGGrillaHembras.Columns[i].FieldName = campo)then
        begin
           BDBGGrillaHembras.Columns[i].PickList := slPickList;
           break;
        end;
//      end
//     else
//      begin
       for j:= 0 to BDBGGrillaMachos.Columns.Count - 1 do
        if(BDBGGrillaMachos.Columns[j].FieldName = campo)then
        begin
           BDBGGrillaMachos.Columns[j].PickList := slPickList;
           break;
        end;
//      end
  finally
    slPickList.Free;
  end;
end;

procedure TFEveAltaMasiva.LoadSQLStringList;
begin
  SQLStringList.AddObject('V1',DMSoftvet.DSGDR);
  SQLStringList.AddObject('V2',DMSoftvet.DSCondicionCorporal);
  SQLStringList.AddObject('V3',DMSoftvet.DSCronologiaDentaria);
  SQLStringList.AddObject('V4',DMSoftvet.DSEstadoReproductivo);

  DMSoftvet.IBQCategAnimal.Active:=false;
  if PCGrillas.ActivePage=TSMachos then
     DMSoftvet.IBQCategAnimal.ParamByName('sexo').AsInteger := 1
  else
     DMSoftvet.IBQCategAnimal.ParamByName('sexo').AsInteger := 2;
  DMSoftvet.IBQCategAnimal.Active:=true;
  SQLStringList.AddObject('V5',DMSoftvet.DSCategAnimal);
  SQLStringList.AddObject('V6',DMSoftvet.DSRaza);

  SQLStringList.AddObject('V7',DMSoftvet.DSPotrerosSinServicio);
  SQLStringList.AddObject('V8',DMSoftvet.DSRodeo);

  SQLStringList.AddObject('V9',DMSoftvet.DSCodigosGenericos);
  SQLStringList.AddObject('V10',DMSoftvet.DSActividad);

  SQLStringList.AddObject('V11',DMSoftvet.DSCodOrigen);
  SQLStringList.AddObject('V12',DMSoftvet.DSCodCriador);
  SQLStringList.AddObject('V13',DMSoftvet.DSCodPropietario);

  SQLStringList.AddObject('V14',DMSoftvet.DSSubCategoriaRaza);

  SQLStringList.AddObject('V15',DMSoftvet.DSInspeccion);
  SQLStringList.AddObject('V16',DMSoftvet.DSCodDestCabania);
  SQLStringList.AddObject('V17',DMSoftvet.DSMocho);

  SQLStringList.AddObject('NOMCOLOR',DSColores);

  //ShowMessage(SQLStringList.GetText);
  //ShowMessage(SQLStringList.Text);
  CargarPickListEnGrilla;
end;

procedure TFEveAltaMasiva.FormCreate(Sender: TObject);
var
  SQLStr : String;
begin
    try
      CargarBottomImgHints(ExtractFilePath(Application.ExeName)+'Imagenes\BottomHint.png');
      CargarCenterImgHints(ExtractFilePath(Application.ExeName)+'Imagenes\CenterHint.png');
      CargarTopImgHints(ExtractFilePath(Application.ExeName)+'Imagenes\TopHint.png');

      IDatos := TBitmap.Create;
      IDatos.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Datos2.bmp');
      IGrilla := TBitmap.Create;
      IGrilla.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Grilla2.bmp');
      IDatosA := TBitmap.Create;
      IDatosA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\DatosA2.bmp');
      IGrillaA := TBitmap.Create;
      IGrillaA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\GrillaA2.bmp');
      ILVets.Add(IDatos,nil);
      ILVets.Add(IGrilla,nil);
      ILVets.Add(IDatosA,nil);
      ILVets.Add(IGrillaA,nil);
      TSHDatos.ImageIndex := 2;
      TSHObservacion.ImageIndex := 1;
    except
    end;

    //******************************************************//
    //	INCIDENCIA: 414									                    //
    //	INICIO Seteo de elementos agregados.			          //
    //	Carla Gareis							              23/12/2014  //
    //******************************************************//
    try
      LineaauxTxt := '';
      LineaauxXls := '';
      AssignFile(arcEquivalenciasTxt, ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempTxt.txt');
      Rewrite(arcEquivalenciasTxt);
      AssignFile(arcEquivalenciasXls, ExtractFilePath(Application.ExeName)+'Exportacion\EquivalenciasTempXls.txt');
      Rewrite(arcEquivalenciasXls);
      Append(arcEquivalenciasXls);
      Writeln(arcEquivalenciasXls, 'RP | Identificación electrónica');
    except
    end;
    //******************************************************//
    //	INCIDENCIA: 414									                    //
    //	FIN Seteo de elementos agregados.				            //
    //	Carla Gareis							              23/12/2014  //
    //******************************************************//
    inherited;
    if Owner is TFPrincipal then
    begin
      (Owner as TFPrincipal).PACargaMP.Visible:=false;
      (Owner as TFPrincipal).PACargaM.Visible:=false;
    end;
    if (FPrincipal.AsistenteCargaMasiva) or (FPrincipal.AsistenteMapa) then
      PADatosAlta.Visible:=true;
    if FPrincipal.AsistenteCMasivaPlanilla then
      PAAMExcel.Visible:= true;

    SQLStringList:= TStringList.Create;
    SQLStringList.Clear;
    listaCats:=TStringList.Create;
    RpGenerados := False;
    agregar:=true;
    ControlEventoOnExit(self);
    IBQDeleteAuxAnimales.Close;
    IBQDeleteAuxAnimales.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
    nroID:=-1;
    AsignarMetodo();
    //DecimalSeparator:='.';
    DMSoftvet.IBQPotrerosSinServicio.Close;
    DMSoftvet.IBQPotrerosSinServicio.ParamByName('establecimiento').Value:= FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQPotrerosSinServicio.Open;
    if not (DMSoftvet.IBQPotrerosSinServicio.IsEmpty)then
      DBLCBAPotrero.AsignarValorDefecto;

    IBQParametroDeTerceros.Close;
    IBQParametroDeTerceros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQParametroDeTerceros.Open;
    if IBQParametroDeTerceros.FieldValues['valor'] <> null then
    begin
      if IBQParametroDeTerceros.FieldByName('valor').AsString = 'S' then
        SQLStr := 'select * from COD_TIPOS_ALTA where (ID_TIPO_ALTA = 1) or (ID_TIPO_ALTA = 2) or (ID_TIPO_ALTA = 3) or (ID_TIPO_ALTA = 4)'
      else
        SQLStr := 'select * from COD_TIPOS_ALTA where (ID_TIPO_ALTA = 1) or (ID_TIPO_ALTA = 2) or (ID_TIPO_ALTA = 3)';
      DMSoftvet.IBQTipoAlta.Close;
      DMSoftvet.IBQTipoAlta.SQL.Clear;
      DMSoftvet.IBQTipoAlta.SQL.Add(SQLStr);
      DMSoftvet.IBQTipoAlta.Open;
    end
    else
      DMSoftvet.IBQTipoAlta.Open;

    altaDesdeEvento := false;
    identElectronica := false;
    cant:=0;

    if (Owner is TFMovCargarDatos) then
      Fprincipal.importaMovil := true;

end;

procedure TFEveAltaMasiva.Change(Sender: TField);
var pickpos : integer;
    edad :integer;
    fecha: TDate;
    str:string;
begin
  inherited;
if (PCGrillas.ActivePage=TSHembras) and (CDSGrillaHembras.State = dsEdit) then
begin
    if CDSGrillaHembras.FieldValues['categoria']<>Null then
      str:=CDSGrillaHembras.FieldValues['categoria']
    else
      str:='';
    case (Sender.Index) of
       14: begin // GDR
           if CDSGrillaHembras.FieldValues['GDR'] <> null then
              CDSGrillaHembras.FieldValues['GDR'] :=  BDBGGrillaHembras.ColumnByField('V1').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V1').Field.AsString);
           end;

       15: begin // Condicion Corporal
           if CDSGrillaHembras.FieldValues['V2'] <> null then
              CDSGrillaHembras.FieldValues['CONDICION_CORPORAL'] :=  BDBGGrillaHembras.ColumnByField('V2').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V2').Field.AsString);
          end;

       16: begin // CCRONOLOGIA DENTARIA
           if CDSGrillaHembras.FieldValues['CRONOLOGIA_DENTARIA'] <> null then
            begin
              CDSGrillaHembras.FieldValues['CRONOLOGIA_DENTARIA'] :=  BDBGGrillaHembras.ColumnByField('V3').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V3').Field.AsString);
              edad := completarEdadCD(CDSGrillaHembras.FieldValues['CRONOLOGIA_DENTARIA']);
              fecha := DTPAFechaAlta.DateTime - (edad*dias_mes);
              CDSGrillaHembras.FieldByName('fecha_nacimiento').AsDateTime:= fecha;
            end;
           end;
       17: begin // ESTADO REPRODUCTIVO
           if CDSGrillaHembras.FieldValues['ESTADO_REPRODUCTIVO'] <> null then
              CDSGrillaHembras.FieldValues['ESTADO_REPRODUCTIVO'] :=  BDBGGrillaHembras.ColumnByField('V4').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V4').Field.AsString);
           end;
       18: begin // CATEGORIA
           if CDSGrillaHembras.FieldValues['CATEGORIA'] <> null then
            begin
              PickPos := BDBGGrillaHembras.ColumnByField('V5').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V5').Field.AsString);
              CDSGrillaHembras.FieldValues['CATEGORIA'] := TClassType(BDBGGrillaHembras.ColumnByField('V5').PickList.Objects[PickPos]).getValue;
            end;
           end;
       19: begin // RAZA
           if CDSGrillaHembras.FieldValues['RAZA'] <> null then
              CDSGrillaHembras.FieldValues['RAZA'] :=  BDBGGrillaHembras.ColumnByField('V6').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V6').Field.AsString);
           end;
       26: begin // Potrero
          if CDSGrillaHembras.FieldValues['POTRERO'] <> null then
              CDSGrillaHembras.FieldValues['POTRERO'] := DMSoftvet.IBQPotrerosSinServicio.Lookup('NOMBRE',BDBGGrillaHembras.ColumnByField('V7').Field.AsString,'ID_POTRERO'); //BDBGGrillaHembras.ColumnByField('V7').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V7').Field.AsString);
           end;
       24: begin // RODEO
           if CDSGrillaHembras.FieldValues['RODEO'] <> null then
              CDSGrillaHembras.FieldValues['RODEO'] :=  DMSoftvet.IBQRodeo.Lookup('NOMBRE',BDBGGrillaHembras.ColumnByField('V8').Field.AsString,'ID_RODEO'); //BDBGGrillaHembras.ColumnByField('V8').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V8').Field.AsString);
           end;
       10: begin
           if CDSGrillaHembras.FieldValues['VUno1'] <> null then
              CDSGrillaHembras.FieldValues['VUno1'] := BDBGGrillaHembras.ColumnByField('V9').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V9').Field.AsString);
           end;
       35: begin //ACTIVIDAD
           if CDSGrillaHembras.FieldValues['ACTIVIDAD'] <> null then
              CDSGrillaHembras.FieldValues['ACTIVIDAD'] :=  BDBGGrillaHembras.ColumnByField('V10').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V10').Field.AsString);
           end;
       59: begin //SUBCATEGORIA
           if CDSGrillaHembras.FieldValues['SUBCATEGORIA'] <> null then
              CDSGrillaHembras.FieldValues['SUBCATEGORIA'] :=  BDBGGrillaHembras.ColumnByField('V14').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V14').Field.AsString);
           end;
       65: begin //MOCHO
           if CDSGrillaHembras.FieldValues['MOCHO'] <> null then
              CDSGrillaHembras.FieldValues['MOCHO'] :=  BDBGGrillaHembras.ColumnByField('V17').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V17').Field.AsString);
           end;
       61: begin //INSPECCION
           if CDSGrillaHembras.FieldValues['INSPECCION'] <> null then
              CDSGrillaHembras.FieldValues['INSPECCION'] :=  BDBGGrillaHembras.ColumnByField('V15').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V15').Field.AsString);
           end;
       63: begin //DESTINO CANIA
           if CDSGrillaHembras.FieldValues['DESTINO_CAB'] <> null then
              CDSGrillaHembras.FieldValues['DESTINO_CAB'] :=  BDBGGrillaHembras.ColumnByField('V16').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V16').Field.AsString);
           end;

    end //del CASE.
end
else
if (PCGrillas.ActivePage=TSMachos) and (CDSGrillaMachos.State = dsEdit)then
    case (Sender.Index) of
       8: begin // CONDICION CORPORAL
          if CDSGrillaMachos.FieldValues['V2'] <> null then
              CDSGrillaMachos.FieldValues['CONDICION_CORPORAL'] :=  BDBGGrillaMachos.ColumnByField('V2').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V2').Field.AsString);
           end;
       9: begin // CRONOLOGIA DENTARIA
          if CDSGrillaMachos.FieldValues['CRONOLOGIA_DENTARIA'] <> null then
             begin
               CDSGrillaMachos.FieldValues['CRONOLOGIA_DENTARIA'] :=  BDBGGrillaMachos.ColumnByField('V3').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V3').Field.AsString);

               edad := completarEdadCD(CDSGrillaMachos.FieldValues['CRONOLOGIA_DENTARIA']);
               fecha := DTPAFechaAlta.DateTime - (edad*dias_mes);
               CDSGrillaMachos.FieldByName('fecha_nacimiento').AsDateTime:= fecha;
             end;
           end;
       10: begin // CATEGORIA
          if CDSGrillaMachos.FieldValues['CATEGORIA'] <> null then
            begin
            //str:=inttostr(BDBGGrillaMachos.ColumnByField('V5').PickList.IndexOf(CDSGrillaMachosV5.AsString{BDBGGrillaMachos.Fields['V5']..AsString}));
            //CDSGrillaMachos.FieldValues['CATEGORIA'] :=strtoint(str)+1;
            PickPos := BDBGGrillaMachos.ColumnByField('V5').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V5').Field.AsString);
            CDSGrillaMachos.FieldValues['CATEGORIA'] := TClassType(BDBGGrillaMachos.ColumnByField('V5').PickList.Objects[PickPos]).getValue;
            end;
           end;
       11: begin // RAZA
          if CDSGrillaMachos.FieldValues['RAZA'] <> null then
              CDSGrillaMachos.FieldValues['RAZA'] :=  BDBGGrillaMachos.ColumnByField('V6').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V6').Field.AsString);
           end;
       20: begin // Potrero
          if CDSGrillaMachos.FieldValues['POTRERO'] <> null then
              CDSGrillaMachos.FieldValues['POTRERO'] :=  BDBGGrillaMachos.ColumnByField('V7').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V7').Field.AsString);
           end;
       19: begin // RODEO
          if CDSGrillaMachos.FieldValues['RODEO'] <> null then
              CDSGrillaMachos.FieldValues['RODEO'] :=  BDBGGrillaMachos.ColumnByField('V8').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V8').Field.AsString);
           end;
       21: begin
           if CDSGrillaMachos.FieldValues['VUno1'] <> null then
              CDSGrillaMachos.FieldValues['VUno1'] :=  BDBGGrillaMachos.ColumnByField('V9').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V9').Field.AsString);
           end; //ACTIVIDAD
       31: begin
           if CDSGrillaMachos.FieldValues['ACTIVIDAD'] <> null then
              CDSGrillaMachos.FieldValues['ACTIVIDAD'] :=  BDBGGrillaMachos.ColumnByField('V10').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V10').Field.AsString);
           end;
       55: begin //SUBCATEGORIA
           if CDSGrillaMachos.FieldValues['SUBCATEGORIA'] <> null then
              CDSGrillaMachos.FieldValues['SUBCATEGORIA'] :=  BDBGGrillaMachos.ColumnByField('V14').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V14').Field.AsString);
           end;
       62: begin //MOCHO
           if CDSGrillaMachos.FieldValues['MOCHO'] <> null then
              CDSGrillaMachos.FieldValues['MOCHO'] :=  BDBGGrillaMachos.ColumnByField('V17').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V17').Field.AsString);
           end;
       58: begin //INSPECCION
           if CDSGrillaMachos.FieldValues['INSPECCION'] <> null then
              CDSGrillaMachos.FieldValues['INSPECCION'] :=  BDBGGrillaMachos.ColumnByField('V15').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V15').Field.AsString);
           end;
       60: begin //DESTINO CABANIA
           if CDSGrillaMachos.FieldValues['DESTINO_CAB'] <> null then
              CDSGrillaMachos.FieldValues['DESTINO_CAB'] :=  BDBGGrillaMachos.ColumnByField('V16').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V16').Field.AsString);
           end;
    end; //del CASE.

end;

procedure TFEveAltaMasiva.EARpInicialExit(Sender: TObject);
begin
  inherited;
  ControlEventoOnExit(sender);
end;

procedure TFEveAltaMasiva.RBSenasaClick(Sender: TObject);
begin
  inherited;
  LRpInicial.Visible:=true;
  if not identRp then
    EARPInicial.Text:='';
  EAPrefijo.Enabled := False;
  EAPrefijo.Visible := False;
  EASufijo.Enabled := False;
  EASufijo.Visible := False;
  EARPInicial.Visible := true;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EARpInicial.MaxLength := 9;
//  EARpInicial.Left := 91;
//  EARpInicial.Width := 63;
//  EARpInicial.SetFocus;
  EAPrefijo.Text := '';
  EASufijo.Text := '';
  EARPinicial.EsRequerido := true;
  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;
  DBLCBACUIGPropio.Visible := false;
  LRpInicial.Visible:= False;  
  ControlEventoOnExit(Sender);
  ComponentesVisiblesPorPais(FPrincipal.Pais);

  Lr.Visible:= false;  
//  EAEncabezadoReidentificacion.Visible:= false;
//  EAUltimoIdentReidentificacion.Visible:= false;

  JvIEquivalencias.Visible := false;
end;

procedure TFEveAltaMasiva.RBRpClick(Sender: TObject);
begin
  inherited;
  EARPInicial.Visible := true;
  EARPInicial.Text:='';
  EAPrefijo.Enabled := True;
  EAPrefijo.Text := '';
  EAPrefijo.Visible := True;
  EASufijo.Enabled := True;
  EASufijo.Visible := True;
  EASufijo.Text := '';
  EARpInicial.MaxLength := 6;
  EARPinicial.EsRequerido := true;

  ControlEventoOnExit(Sender);
  LRpInicial.Visible:= True;
  ComponentesVisiblesPorPais(FPrincipal.Pais);

end;

procedure TFEveAltaMasiva.RBCUIGSenasaClick(Sender: TObject);
begin
  inherited;
  EAEncabezado.Visible := true;
  EAUltimoIdent.Visible := true;
  if(CBCUIGPropio.Checked) then
      DBLCBACUIGPropio.Visible:= true;
  ControlEventoOnExit(Sender);

end;

procedure TFEveAltaMasiva.EARpInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
    if (EASufijo.Enabled) then
      begin
         EASufijo.SetFocus;
         EASufijo.SelectAll;
         key:= #0;
      end
     else
      if (EACantidad.Enabled) then
        begin
           EACantidad.SetFocus;
           EACantidad.SelectAll;
           key:= #0;
        end
   end;

  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFEveAltaMasiva.EACantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBARaza.Enabled) then
      begin
         DBLCBARaza.SetFocus;
         key:= #0;
      end;
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFEveAltaMasiva.EAPesoKeyPress(Sender: TObject; var Key: Char);
var Separador : Char;
begin
  inherited;
  if (Key = #13) then
  begin
     {if (GBMachos.Visible) then
       begin
          DBLCBACategoria.SetFocus;
          key:= #0;
       end;
    if (GBHembras.Visible) then
      begin
         DBLCBACategoria.SetFocus;
         key:= #0;
      end;}
  end;
//  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;

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

procedure TFEveAltaMasiva.EAEdadKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  if (Key = #13) then
    {if (EADta.Enabled) then
      begin
         EADta.SetFocus;
         EADta.SelectAll;
         key:= #0;
      end;}
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;

  LEdad.Font.Color:= clBlack;
  LEdad.Font.Style:= [];
end;

procedure TFEveAltaMasiva.EAEstadoLactacionKeyPress(Sender: TObject;
  var Key: Char);
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
           end;
    end;

  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFEveAltaMasiva.EACircunferenciaEscrotalKeyPress(Sender: TObject; var Key: Char);
var Separador: Char;
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
           end;
    end;

  //if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;

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

procedure TFEveAltaMasiva.CDSGrillaHembrasV1SetText(Sender: TField;
  const Text: String);
var S: String;
    PickPos, aux3: integer;
    aux2: String;
    aux: double;
begin
  inherited;
  if ((DSGrillaHembras.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
  begin
    IBQValidaciones.Active := false;
    IBQValidaciones.SQL.Clear;
    if (Sender.FieldName = 'V1') then
    begin      // GDR
        IBQValidaciones.SQL.Add('select Sinonimo from COD_GDR where Sinonimo like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
            Sender.AsString := IBQValidaciones.FieldByName('Sinonimo').AsString;
    end
    else
    if (Sender.FieldName = 'V3') then
     begin      // Cronologia dentaria
        IBQValidaciones.SQL.Add('select Sinonimo from Cod_cronologias_dentarias where sinonimo like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
          begin
            Sender.AsString := IBQValidaciones.FieldByName('Sinonimo').AsString;
            PickPos := BDBGGrillaHembras.ColumnByField('V3').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V3').Field.AsString);
            CDSGrillaHembrasCRONOLOGIA_DENTARIA.AsInteger := TClassType(BDBGGrillaHembras.ColumnByField('V3').PickList.Objects[PickPos]).getValue;
          end;
     end
    else
    if (Sender.FieldName = 'V4') then
    begin      // Estado Reproductivo
        IBQValidaciones.SQL.Add('select NOMBRE from Cod_estados_reproductivos where nombre like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
            Sender.AsString := IBQValidaciones.FieldByName('Nombre').AsString;
    end
    else
    if (Sender.FieldName = 'V5') then
     begin      // Categoria
        IBQValidaciones.SQL.Add('select SINONIMO from Cod_categorias where sinonimo like '''+UpperCase(Text)+'%''' + 'and tipo_sexo = 2');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        begin
            Sender.AsString := IBQValidaciones.FieldByName('Sinonimo').AsString;
            PickPos := BDBGGrillaHembras.ColumnByField('V5').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V5').Field.AsString);
            CDSGrillaHembrasCATEGORIA.AsInteger := TClassType(BDBGGrillaHembras.ColumnByField('V5').PickList.Objects[PickPos]).getValue;
        end;
     end
    else
    if (Sender.FieldName = 'V6') then
     begin      // Raza
        IBQValidaciones.SQL.Add('select SINONIMO from Cod_razas where sinonimo like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        begin
            Sender.AsString := IBQValidaciones.FieldByName('Sinonimo').AsString;
            PickPos := BDBGGrillaHembras.ColumnByField('V6').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V6').Field.AsString);
            CDSGrillaHembrasRAZA.AsInteger := TClassType(BDBGGrillaHembras.ColumnByField('V6').PickList.Objects[PickPos]).getValue;
        end;
     end;


    if (Sender.FieldName = 'V9') then
    begin
        IBQValidaciones.SQL.Add('select Valor from Cod_Genericos where Tipo = ''DP'' and Valor like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        begin
            Sender.AsString := IBQValidaciones.FieldByName('Valor').AsString;
            PickPos := BDBGGrillaHembras.ColumnByField('V9').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V9').Field.AsString);
            CDSGrillaHembrasVUno1.AsString := TClassType(BDBGGrillaHembras.ColumnByField('V9').PickList.Objects[PickPos]).getValue;
        end;
    end;
    if (Sender.FieldName = 'V10') then
     begin      // ACTIVIDAD
        IBQValidaciones.SQL.Add('select SINONIMO from COD_ACTIVIDAD where sinonimo like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        begin
            Sender.AsString := IBQValidaciones.FieldByName('Sinonimo').AsString;
            PickPos := BDBGGrillaHembras.ColumnByField('V10').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V10').Field.AsString);
            CDSGrillaHembrasACTIVIDAD.AsInteger := TClassType(BDBGGrillaHembras.ColumnByField('V10').PickList.Objects[PickPos]).getValue;
        end;
     end;

    if (Sender.FieldName = 'V7') then
    begin      // POTRERO
      s:='select NOMBRE as valor from TAB_POTREROS where ((establecimiento = :esta) and (NOMBRE like '''+UpperCase(Text)+'''||''%''))';
      IBQValidaciones.SQL.Text :=S;
      IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
         //PickPos := BDBGGrillaHembras.ColumnByField('V7').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V7').Field.AsString);
        // CDSGrillaHembrasPOTRERO.AsInteger:= TClassType(BDBGGrillaHembras.ColumnByField('V7').PickList.Objects[PickPos]).getValue;
      end;
    end
    else
      if (Sender.FieldName = 'V8') then
       begin      // RODEO
        IBQValidaciones.SQL.text := 'select NOMBRE as valor from TAB_RODEOS where ((establecimiento = :esta) and (NOMBRE like '''+UpperCase(Text)+'''||''%''))';
        IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
         // PickPos := BDBGGrillaHembras.ColumnByField('V8').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V8').Field.AsString);
          //CDSGrillaHembrasRODEO.AsInteger := TClassType(BDBGGrillaHembras.ColumnByField('V8').PickList.Objects[PickPos]).getValue;
        end;
       end
      else
        if (Sender.FieldName = 'V14') then
        begin      // SUBCATEGORIA
          IBQValidaciones.SQL.text := 'select SINONIMO AS valor from COD_SUBCATEGORIAS where (SINONIMO like '''+UpperCase(Text)+'''||''%'')';
          IBQValidaciones.Open;
          if not(IBQValidaciones.IsEmpty) then
          begin
            Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
            PickPos := BDBGGrillaHembras.ColumnByField('V14').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V14').Field.AsString);
            CDSGrillaHembrasSUBCATEGORIA.AsInteger := TClassType(BDBGGrillaHembras.ColumnByField('V14').PickList.Objects[PickPos]).getValue;
          end;
        end;

      if (Sender.FieldName = 'ESTADO_LACTACION') then
      begin      // ESTADO LACTACION
        if (TryStrToInt(text,aux3)) then
          begin
            if (StrToInt(Text)<= 20) then
              begin
                Sender.AsString := Text;
              end;
          end;
      end;
      if (Sender.FieldName = 'DTA') then
      begin      // DTA
                Sender.AsString := Text;
      end;

      if (Sender.FieldName = 'V2') then
      begin      // CONDICION CORPORAL
        if (TryStrTofloat(text,aux)) then
          begin
            aux2 := StringReplace(FormatFloat('0.0',aux), ',', '.',[]);
            IBQValidaciones.Params.Clear;
            IBQValidaciones.SQL.Clear;
            IBQValidaciones.SQL.Add('select count(*)as cantidad from cod_condiciones_corporales where ('+fprincipal.StringEscalaCC+' = '+aux2+')');
            IBQValidaciones.Active := true;

            if (IBQValidaciones.FieldByName('cantidad').AsInteger <> 0) then
              begin
                IBQValidaciones.Active := false;
                IBQValidaciones.SQL.Clear;
                IBQValidaciones.SQL.Add('select '+FPrincipal.StringEscalaCC+' from cod_condiciones_corporales where ('+FPrincipal.StringEscalaCC+' = '+aux2+')');
                IBQValidaciones.Active := true;
                Sender.Value := IBQValidaciones.FieldByName(FPrincipal.StringEscalaCC).Value;

                PickPos := BDBGGrillaHembras.ColumnByField('V2').PickList.IndexOf(BDBGGrillaHembras.ColumnByField('V2').Field.AsString);
                CDSGrillaHembrasCONDICION_CORPORAL.AsInteger := TClassType(BDBGGrillaHembras.ColumnByField('V2').PickList.Objects[PickPos]).getValue;
                CDSGrillaHembras.FieldByName('CONDICION_CORPORAL').Value :=  TClassType(BDBGGrillaHembras.ColumnByField('V2').PickList.Objects[PickPos]).getValue;
              end;
         end;
       end;

      if (Sender.FieldName = 'V11') then
        begin      // ORIGEN
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_ORIGEN from COD_ORIGEN where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
          begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaHembras.FieldByName('ORIGEN_ANIMAL').AsInteger:=IBQValidaciones.FieldByName('ID_ORIGEN').AsInteger;
          end;
        end;

      if (Sender.FieldName = 'V12') then
        begin      // CRIADOR
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_CRIADOR from COD_CRIADOR where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
          begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaHembras.FieldByName('CRIADOR').AsInteger:=IBQValidaciones.FieldByName('ID_CRIADOR').AsInteger;
          end;
        end;

      if (Sender.FieldName = 'V13') then
        begin      // PROPIETARIO
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_PROPIETARIO from COD_PROPIETARIO where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
          begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaHembras.FieldByName('PROPIETARIO').AsInteger:=IBQValidaciones.FieldByName('ID_PROPIETARIO').AsInteger;
          end;
        end;

      if (Sender.FieldName = 'V17') then
      begin      // MOCHO
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_MOCHO from COD_MOCHO where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaHembras.FieldByName('MOCHO').AsInteger := IBQValidaciones.FieldByName('ID_MOCHO').AsInteger;
        end;
      end;

      if (Sender.FieldName = 'V15') then
      begin      // INSPECCION
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_INSPECCION from COD_INSPECCION where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaHembras.FieldByName('INSPECCION').AsInteger := IBQValidaciones.FieldByName('ID_INSPECCION').AsInteger;
        end;
      end;

      if (Sender.FieldName = 'V16') then
      begin      // DESTINO CABANIA
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_DEST_CABANIA from COD_DEST_CABANIA where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaHembras.FieldByName('DESTINO_CAB').AsInteger := IBQValidaciones.FieldByName('ID_DEST_CABANIA').AsInteger;
        end;
      end;

      if (Sender.FieldName = 'NOMCOLOR') then
      begin      // DESTINO CABANIA
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_COLOR from COD_COLORES where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaHembras.FieldByName('COLOR').AsInteger := IBQValidaciones.FieldByName('ID_COLOR').AsInteger;
        end;
      end;

      //******************************************************//
      //	INCIDENCIA: 401									                    //
      //	INICIO Carga de campos válidos para celda           //
      //         Informado_AFIP de la grilla hembras.         //
      //	Carla Gareis							              03/12/2014  //
      //******************************************************//
      if (Sender.FieldName = 'INFORMADO_AFIP') then
      begin
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select distinct informado_afip from tab_animales';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaHembras.FieldByName('INFORMADO_AFIP').AsInteger := IBQValidaciones.FieldByName('INFORMADO_AFIP').AsInteger;
        end;
      end;
      //******************************************************//
      //	INCIDENCIA: 401									                    //
      //	FIN Carga de campos válidos para celda              //
      //      Informado_AFIP de la grilla hembras.            //
      //	Carla Gareis							              03/12/2014  //
      //******************************************************//

  end;
end;

procedure TFEveAltaMasiva.CDSGrillaMachosV5SetText(Sender: TField;
  const Text: String);
var  PickPos:integer;
     S: String;
     aux,aux3: double;
     aux2: String;
begin
  inherited;
  if ((DSGrillaMachos.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
  begin
    IBQValidaciones.Active := false;
    IBQValidaciones.SQL.Clear;
    if (Sender.FieldName = 'V5') then
    begin      // Categoria
        IBQValidaciones.SQL.Add('select SINONIMO from Cod_categorias where sinonimo like '''+UpperCase(Text)+'%''' + 'and tipo_sexo = 1');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        begin
            Sender.AsString := IBQValidaciones.FieldByName('Sinonimo').AsString;
            PickPos := BDBGGrillaMachos.ColumnByField('V5').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V5').Field.AsString);
            CDSGrillaMachosCATEGORIA.AsInteger := TClassType(BDBGGrillaMachos.ColumnByField('V5').PickList.Objects[PickPos]).getValue;

           { if (CDSGrillaMachosCATEGORIA.AsInteger <> 1) then
              begin
                CDSGrillaMachos.FieldByName('VUNO2').AsString:= '';


              end; }
       { if (CDSAnimales.FieldValues['VUNO2'] = 1) then
          IBQSPEventoInd.ParamByName('CASTRADO').Value := CDSAnimales.FieldValues['VUNO2']
         else
            IBQSPEventoInd.ParamByName('CASTRADO').Value := null;   }
        end;
    end
    else
    if (Sender.FieldName = 'V6') then
    begin      // Raza
        IBQValidaciones.SQL.Add('select SINONIMO from Cod_razas where sinonimo like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        begin
            Sender.AsString := IBQValidaciones.FieldByName('Sinonimo').AsString;
            PickPos := BDBGGrillaMachos.ColumnByField('V6').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V6').Field.AsString);
            CDSGrillaMachosRAZA.AsInteger := TClassType(BDBGGrillaMachos.ColumnByField('V6').PickList.Objects[PickPos]).getValue;
        end;
    end
    else
    if (Sender.FieldName = 'V3') then
    begin      // Cronologia dentaria
        IBQValidaciones.SQL.Add('select Sinonimo from Cod_cronologias_dentarias where sinonimo like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
          begin
            Sender.AsString := IBQValidaciones.FieldByName('Sinonimo').AsString;
            PickPos := BDBGGrillaMachos.ColumnByField('V3').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V3').Field.AsString);
            CDSGrillaMachosCRONOLOGIA_DENTARIA.AsInteger := TClassType(BDBGGrillaMachos.ColumnByField('V3').PickList.Objects[PickPos]).getValue;
          end;
    end;

    if (Sender.FieldName = 'V9') then
    begin
        IBQValidaciones.SQL.Add('select Valor from Cod_Genericos where Tipo = ''DP'' and Valor like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        begin
            Sender.AsString := IBQValidaciones.FieldByName('Valor').AsString;
            PickPos := BDBGGrillaMachos.ColumnByField('V9').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V9').Field.AsString);
            CDSGrillaMachosVUno1.AsString := TClassType(BDBGGrillaMachos.ColumnByField('V9').PickList.Objects[PickPos]).getValue;
        end;
    end;

    if (Sender.FieldName = 'V7') then
    begin      // POTRERO
      s:='select NOMBRE as valor from TAB_POTREROS where ((establecimiento = :esta) and (NOMBRE like '''+UpperCase(Text)+'''||''%''))';
      IBQValidaciones.SQL.Text :=S;
      IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
         Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
       //  PickPos := BDBGGrillaMachos.ColumnByField('V7').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V7').Field.AsString);
       //  CDSGrillaMachosPOTRERO.AsInteger:= TClassType(BDBGGrillaMachos.ColumnByField('V7').PickList.Objects[PickPos]).getValue;
      end;
    end
    else
      if (Sender.FieldName = 'V8') then
      begin      // RODEO
        IBQValidaciones.SQL.text := 'select NOMBRE as valor from TAB_RODEOS where ((establecimiento = :esta) and (NOMBRE like '''+UpperCase(Text)+'''||''%''))';
        IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
         // PickPos := BDBGGrillaMachos.ColumnByField('V8').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V8').Field.AsString);
         // CDSGrillaMachosRODEO.AsInteger := TClassType(BDBGGrillaMachos.ColumnByField('V8').PickList.Objects[PickPos]).getValue;
        end;
      end;

    if (Sender.FieldName = 'V10') then
     begin      // ACTIVIDAD
        IBQValidaciones.SQL.Add('select SINONIMO from COD_ACTIVIDAD where sinonimo like '''+UpperCase(Text)+'%''');
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        begin
            Sender.AsString := IBQValidaciones.FieldByName('Sinonimo').AsString;
            PickPos := BDBGGrillaMachos.ColumnByField('V10').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V10').Field.AsString);
            CDSGrillaMachosACTIVIDAD.AsInteger := TClassType(BDBGGrillaMachos.ColumnByField('V10').PickList.Objects[PickPos]).getValue;
        end;
     end
    else
      if (Sender.FieldName = 'V14') then
      begin      // SUBCATEGORIA
        IBQValidaciones.SQL.text := 'select SINONIMO AS valor from COD_SUBCATEGORIAS where (SINONIMO like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
          PickPos := BDBGGrillaMachos.ColumnByField('V14').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V14').Field.AsString);
          CDSGrillaMachosSUBCATEGORIA.AsInteger := TClassType(BDBGGrillaMachos.ColumnByField('V14').PickList.Objects[PickPos]).getValue;
        end;
      end;

      if (Sender.FieldName = 'CIRCUNFERENCIA_ESCROTAL') then
      begin      // circunferencia escrotal
        if (TryStrToFloat(text,aux3)) then
          begin
            if (StrToFloat(Text)<= 99) then
              begin
                Sender.AsString := Text;
              end;
          end;
      end;

      if (Sender.FieldName = 'DTA') then
      begin      // DTA
                 Sender.AsString := Text;
      end;

      if (Sender.FieldName = 'V2') then
      begin      // CONDICION CORPORAL
        if (TryStrTofloat(text,aux)) then
          begin
            aux2 := StringReplace(FormatFloat('0.0',aux), ',', '.',[]);
            IBQValidaciones.Params.Clear;
            IBQValidaciones.SQL.Clear;
            IBQValidaciones.SQL.Add('select count(*)as cantidad from cod_condiciones_corporales where ('+fprincipal.StringEscalaCC+' = '+aux2+')');
            IBQValidaciones.Active := true;

            if (IBQValidaciones.FieldByName('cantidad').AsInteger <> 0) then
              begin
                IBQValidaciones.Active := false;
                IBQValidaciones.SQL.Clear;
                IBQValidaciones.SQL.Add('select '+FPrincipal.StringEscalaCC+' from cod_condiciones_corporales where ('+FPrincipal.StringEscalaCC+' = '+aux2+')');
                IBQValidaciones.Active := true;
                Sender.Value := IBQValidaciones.FieldByName(FPrincipal.StringEscalaCC).Value;

                PickPos := BDBGGrillaMachos.ColumnByField('V2').PickList.IndexOf(BDBGGrillaMachos.ColumnByField('V2').Field.AsString);
                CDSGrillaMachosCONDICION_CORPORAL.AsInteger := TClassType(BDBGGrillaMachos.ColumnByField('V2').PickList.Objects[PickPos]).getValue;
                CDSGrillaMachos.FieldByName('CONDICION_CORPORAL').Value :=  TClassType(BDBGGrillaMachos.ColumnByField('V2').PickList.Objects[PickPos]).getValue;
              end;
         end;
       end;

      if (Sender.FieldName = 'V11') then
        begin      // ORIGEN
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_ORIGEN from COD_ORIGEN where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
          begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaMachos.FieldByName('ORIGEN_ANIMAL').AsInteger:=IBQValidaciones.FieldByName('ID_ORIGEN').AsInteger;
          end;
        end;

      if (Sender.FieldName = 'V12') then
        begin      // CRIADOR
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_CRIADOR from COD_CRIADOR where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
          begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaMachos.FieldByName('CRIADOR').AsInteger:=IBQValidaciones.FieldByName('ID_CRIADOR').AsInteger;
          end;
        end;

      if (Sender.FieldName = 'V13') then
        begin      // PROPIETARIO
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_PROPIETARIO from COD_PROPIETARIO where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
          begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaMachos.FieldByName('PROPIETARIO').AsInteger:=IBQValidaciones.FieldByName('ID_PROPIETARIO').AsInteger;
          end;
        end;

      if (Sender.FieldName = 'V17') then
      begin      // MOCHO
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_MOCHO from COD_MOCHO where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaMachos.FieldByName('MOCHO').AsInteger := IBQValidaciones.FieldByName('ID_MOCHO').AsInteger;
        end;
      end;

      if (Sender.FieldName = 'V15') then
      begin      // INSPECCION
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_INSPECCION from COD_INSPECCION where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaMachos.FieldByName('INSPECCION').AsInteger := IBQValidaciones.FieldByName('ID_INSPECCION').AsInteger;
        end;
      end;

      if (Sender.FieldName = 'V16') then
      begin      // DESTINO CABANIA
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_DEST_CABANIA from COD_DEST_CABANIA where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaMachos.FieldByName('DESTINO_CAB').AsInteger := IBQValidaciones.FieldByName('ID_DEST_CABANIA').AsInteger;
        end;
      end;

      if (Sender.FieldName = 'NOMCOLOR') then
      begin      // DESTINO CABANIA
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select NOMBRE,ID_COLOR from COD_COLORES where (NOMBRE like '''+UpperCase(Text)+'''||''%'')';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaMachos.FieldByName('COLOR').AsInteger := IBQValidaciones.FieldByName('ID_COLOR').AsInteger;
        end;
      end;

      //******************************************************//
      //	INCIDENCIA: 401									                    //
      //	INICIO Carga de campos válidos para celda           //
      //         Informado_AFIP de la grilla machos.          //
      //	Carla Gareis							              03/12/2014  //
      //******************************************************//
      if (Sender.FieldName = 'INFORMADO_AFIP') then
      begin
        IBQValidaciones.Close;
        IBQValidaciones.SQL.text := 'select distinct informado_afip from tab_animales';
        IBQValidaciones.Open;
        if not(IBQValidaciones.IsEmpty) then
        begin
          Sender.AsString := IBQValidaciones.FieldByName('NOMBRE').AsString;
          CDSGrillaMachos.FieldByName('INFORMADO_AFIP').AsInteger := IBQValidaciones.FieldByName('INFORMADO_AFIP').AsInteger;
        end;
      end;
      //******************************************************//
      //	INCIDENCIA: 401									                    //
      //	FIN Carga de campos válidos para celda              //
      //      Informado_AFIP de la grilla machos.             //
      //	Carla Gareis							              03/12/2014  //
      //******************************************************//

   end;
end;

procedure TFEveAltaMasiva.EAEdadExit(Sender: TObject);
begin
  inherited;
  if (EAEdad.Text = '') then
    EAEdad.Text := '0';
  GetEvent(sender);
end;

procedure TFEveAltaMasiva.ControlReales(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAValortotal.Focused) then
      begin
       if (EAPorcentaje.Enabled) then
         begin
            EAPorcentaje.SetFocus;
            EAPorcentaje.SelectAll;
            key:= #0;
         end;
      end
    else
      if (EAPorcentaje.Focused) then
        begin
         if (EAValorNeto.Enabled) then
           begin
              EAValorNeto.SetFocus;
              EAValorNeto.SelectAll;
              key:= #0;
           end;
        end;

  if (Key = '.') then
    Key := ',';

  if (pos(',',TEditAuto(Sender).Text)=0) then
    begin
      if not (key in ['0'..'9',',',#8]) then key:=#0;
    end
  else if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFEveAltaMasiva.ActualizarValor(Sender: TObject);
var ValorTotal, ValorNeto, ValorPorcentual: double;
begin

  inherited;

  //if (TEdit(Sender).Focused) then
  if (true) then
  begin
      if not(TryStrToFloat(EAValortotal.Text, ValorTotal)) then
        ValorTotal := 0;
      if not(TryStrToFloat(EAValorNeto.Text, ValorNeto)) then
        ValorNeto := 0;
      if not(TryStrToFloat(EAPorcentaje.Text, ValorPorcentual)) then
        ValorPorcentual := 0;


      if (TEdit(Sender).Text <> '') then
        case TEdit(Sender).Tag of
           1 : begin
                 LValorTotal.Caption := FormatFloat('###0.00',ValorTotal+ValorNeto);
                 EAValorNeto.Text:=floatToStr((valorTotal*ValorPorcentual)/100);
               end;
           2 : begin
                 LValorTotal.Caption := FormatFloat('###0.00',ValorTotal+ValorNeto);
                 if (ValorTotal <> 0) then
                   if(ValorTotal-ValorNeto >= 0) then
                     EAPorcentaje.Text := FormatFloat('###0.00', (ValorNeto*100)/ValorTotal)
                   else
                   begin
                     EAValorNeto.Text:=EAValorTotal.Text;
                     MostrarMensaje(tmAdvertencia, 'Los gastos no pueden superar el total.');
                   end;
               end;
           3 : begin
                 ValorNeto := (ValorTotal*ValorPorcentual)/100;
                 EAValorNeto.Text := FormatFloat('###0.00',ValorNeto);
                 LValorTotal.Caption := FormatFloat('###0.00',ValorTotal+ValorNeto);
               end;
        end;
  end;
end;

(*
  Controla botones y visibilidad de los tabs
*)
procedure TFEveAltaMasiva.ControlEventoOnExit(Sender: TObject);
var
  graba      : Boolean;
  esGrilla   : Boolean;
  hayCUIG    : Boolean;
  hayHembras : Boolean;
  hayMachos  : Boolean;
  hayReidentificacion : Boolean;
  cantAnimalesNuevos : Integer;
begin
  inherited;
  cantAnimalesNuevos := 0;
  hayCUIG := true;
  hayReidentificacion:= true;
  if (RBCUIGSenasa.Checked) then
    begin
     hayCUIG := ((EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____'));
     hayCUIG := hayCUIG and CheckFormatoCUIGEncabezado(EAEncabezado.Text) and CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text);
    end
   else
     if (RBReidentificacionSenasa.Checked) then
       begin
        hayReidentificacion := ((EAEncabezadoReidentificacion.EditText <> '_____') and (EAUltimoIdentReidentificacion.EditText <> '____'));
        hayReidentificacion := hayReidentificacion and CheckFormatoReidentificacionEncabezado('R'+EAEncabezadoReidentificacion.Text) and CheckFormatoReidentificacionUltimoIdent(EAUltimoIdentReidentificacion.Text);
       end;


  graba      := (PuedeGrabar and hayCUIG and hayReidentificacion) or cargaDeMovil;
  esGrilla   := PCBasico.ActivePage = TSHObservacion;
  hayHembras := not BDBGGrillaHembras.DataSource.DataSet.IsEmpty;
  hayMachos  := not BDBGGrillaMachos.DataSource.DataSet.IsEmpty;
  // Oculta la grilla hasta que todos los requeridos esten llenos
  TSHObservacion.TabVisible := graba or hayHembras or hayMachos;
  // Vemos de tener todo con datos antes de dejar terminar
  // Para generar una demo se deshabilita la posibilidad de grabar alta de animales

  ASacarAnimal.Visible:= TSHObservacion.Visible and (PuedeGrabar or ((BDBGGrillaHembras.SelectedRows.Count>0)or(BDBGGrillaMachos.SelectedRows.Count>0)));
  
{$IFDEF DEMO}
  {$IFDEF EC}
     JvTerminar.Visible := graba and esGrilla and (hayHembras or hayMachos);
     LBBTerminar.Visible := graba and esGrilla and (hayHembras or hayMachos);
  {$ELSE}
      //DEMO EDUCACION CONTINUA
     //BBTerminar.Enabled := graba and esGrilla and (hayHembras or hayMachos) and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
     JvTerminar.Visible := graba and esGrilla and (hayHembras or hayMachos) and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
     LBBTerminar.Visible := graba and esGrilla and (hayHembras or hayMachos) and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
     //DEMO COMERCIAL
     //BBTerminar.Enabled := false;//graba and esGrilla and (hayHembras or hayMachos) and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
  {$ENDIF}
{$ELSE}
  cantAnimalesNuevos := CantAnimalesNuevos + BDBGGrillaHembras.DataSource.DataSet.RecordCount;
  cantAnimalesNuevos := CantAnimalesNuevos + BDBGGrillaMachos.DataSource.DataSet.RecordCount;
  JvTerminar.Visible := VerificarCantAnimalesBase(cantAnimalesNuevos) and graba and esGrilla and (hayHembras or hayMachos);
  LBBTerminar.Visible := VerificarCantAnimalesBase(cantAnimalesNuevos) and graba and esGrilla and (hayHembras or hayMachos);
{$ENDIF}
  JvIImpExcel.Visible := not graba;
  LImpExcel.Visible := not graba;                                            
  //JvIDispElect.Visible := (not graba) and FPrincipal._USO_DISP;
  //LDispElect.Visible := (not graba) and FPrincipal._USO_DISP;

  ControlBounds;
end;

procedure TFEveAltaMasiva.AAnteriorExecute(Sender: TObject);
begin
  PCBasicoChanging(self,permitir);
  inherited;
  PCBasicoChange(self);
  ControlEventoOnExit(Self);
end;

procedure TFEveAltaMasiva.EARpInicialChange(Sender: TObject);
begin
  inherited;
  ControlEventoOnExit(self);
end;

procedure TFEveAltaMasiva.EACantidadChange(Sender: TObject);
begin
  inherited;
  ControlEventoOnExit(self);
end;

procedure TFEveAltaMasiva.DBLCBACatMachosClick(Sender: TObject);
var
  cod : Integer;
begin
  inherited;
  //Circunferencia escrotal solo disponble para toros
  cod := DBLCBACategoria.KeyValue;
  if IBQCategorias.FieldByName('ref_categ').Value <> null then
    cod := IBQCategorias.FieldByName('ref_categ').Value;

  EACircunferenciaEscrotal.Enabled := cod = 3;
  JEACircunferenciaEscrotal.Enabled := cod = 3;
  BDBGGrillaMachos.Columns[15].ReadOnly := not (cod = 3);
end;

procedure TFEveAltaMasiva.ChequearCampoEnGrilla(Campo, Valor, ValAnterior: string);
begin
  //MAErrors.Clear;
  //if(ValAnterior <> Valor)then
  //begin
  {CantidadRepetidos = 0 No hay elementos Repetidos, CantidadRepetidos > 0 Hay Repetidos}

  //************************************************************//
  //	INCIDENCIA: 401									                          //
  //	INICIO Chequeo que no sea la columna Informado_AFIP       //
  //         para evitar que tire errores por valores repetidos.//
  //	Carla Gareis							              03/12/2014        //
  //************************************************************//
  if not (campo = 'INFORMADO_AFIP') then
  begin
    if (CantidadRepetidos(campo,Valor,IBQRepetidos, 'select count(*) as cantidad from AUX_animales ')>0) then
      begin
       PError.Visible := true;
       if (PCGrillas.ActivePage=TSMachos){CBSexo.Text='Machos'} then
         begin
           MarcarError('W', TIBDataSet(DSGrillaMachos.DataSet));          {Si hay repetidos, marco en EW un error y lo captura cuando regenera la grilla en el drawcolumncell}
           MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+ BDBGGrillaMachos.ColumnByField(Campo).Title.Caption  +' = '+Valor)
           end
       else
         begin
           MarcarError('W', TIBDataSet(DSGrillaHembras.DataSet));
           MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+ BDBGGrillaHembras.ColumnByField(Campo).Title.Caption +' = '+Valor);
         end;
      end
    else
      begin
      if (PCGrillas.ActivePage=TSMachos) then
        begin
          if (TIBDataSet(DSGrillaMachos.DataSet).FieldByName('ew').AsString = 'W') then
            MarcarError('M', TIBDataSet(DSGrillaMachos.DataSet))          {Si hay repetidos, marco en EW un error y lo captura cuando regenera la grilla en el drawcolumncell}
          else
            MarcarError('', TIBDataSet(DSGrillaMachos.DataSet));
        end
      else
        if (TIBDataSet(DSGrillaHembras.DataSet).FieldByName('ew').AsString = 'W') then
          MarcarError('M', TIBDataSet(DSGrillaHembras.DataSet))
        else
          MarcarError('', TIBDataSet(DSGrillaHembras.DataSet));
      end;
  end;
  //*********************************************************//
  //	INCIDENCIA: 401									                       //
  //	FIN Chequeo que no sea la columna Informado_AFIP       //
  //      para evitar que tire errores por valores repetidos.//
  //	Carla Gareis							              03/12/2014     //
  //*********************************************************//
  
//end;

end;

procedure TFEveAltaMasiva.SetText(Sender: TField; const Text: String);
var aux:string;
begin


 if (DSGrillaHembras.State <> dsInsert)and(DSGrillaMachos.State <> dsInsert) then
 begin
    if ((((Sender.FieldName = 'ID_RP') and (Text <> ''))or (Sender.FieldName <> 'ID_RP')) and (Sender.FieldName <> 'ID_SENASA'))then
      if (UpperCase(Sender.AsString) <> UpperCase(Text)) then
      begin
        aux :=UpperCase(text);
        if (aux <> 'N/N') then
          begin
            if (Sender.FieldName <> 'VUNO2') then
              ChequearCampoEnGrilla(sender.FieldName,aux,sender.AsString);
            Sender.AsString := aux;
            if TField(Sender).DataSet = BDBGGrillaMachos.DataSource.DataSet then
              TField(Sender).DataSet.FieldByName('NOMBRE').AsString:=aux; //si cambio el rp, el nombre tambien se cambia
            TField(Sender).DataSet.Post;
          end;
      end;


    if ((Sender.FieldName = 'ID_SENASA') and (UpperCase(Sender.AsString) <> UpperCase(Text))) then
    begin
      aux :=UpperCase(text);
      senasaValido:= false;
      if ((Ord(aux[1])<48) or (Ord(aux[1])>57) or (aux[1]='R')) then
      begin
          if ((aux[1]='R') and (Length(aux) = 9)) then
              senasaValido:= UFunctions.CheckFormatoReidentificacion(aux)
          else
             if ((Length(aux) = 9) and ((Ord(aux[2])<48) or (Ord(aux[2])>57))) then
                 senasaValido:= UFunctions.CheckFormatoCUIG(aux)
             else
                 senasaValido:= false;
          if not (senasaValido) then
          begin
               MAErrors.Lines.Add(Traducir('El Formato del Senasa no es Válido: ')+ Sender.FieldName +' = '+aux);

               MarcarError('E', TIBDataSet(sender.DataSet));{Si hay repetidos, marco en EW un error y lo captura cuando regenera la grilla en el drawcolumncell}
               MostrarPageControlRepetidos(true);
          end
          else
               MarcarError('', TIBDataSet(sender.DataSet));{Si no hay repetidos, marco en EW ''}
      end
      else
          if ((Ord(aux[1])>=48) and (Ord(aux[1])<=57)) then
          begin
              senasaValido:= UFunctions.CheckSENASAViejo(aux);
              if not (senasaValido) then
              begin
                 MAErrors.Lines.Add(Traducir('El Formato del Senasa no es Válido: ')+ Sender.FieldName +' = '+aux);
                 MarcarError('E', TIBDataSet(sender.DataSet));{Si hay repetidos, marco en EW un error y lo captura cuando regenera la grilla en el drawcolumncell}
                 MostrarPageControlRepetidos(true);
              end
              else
                 MarcarError('', TIBDataSet(sender.DataSet));{Si no hay repetidos, marco en EW ''}
          end;
          

      if (senasaValido) then
        if ((Ord(aux[1]) >= 48) and (Ord(aux[1]) <= 57)) then
            Sender.AsString := CompletarDigitosSenasa(aux)
        else
        begin
             Sender.AsString := aux;
        end;
    end;
 end;

end;

procedure TFEveAltaMasiva.Pintar(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var CheckBoxRectangle : TRect;
Const
 CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  inherited;

  if (TBitDBGrid(Sender).DataSource.DataSet.FieldValues['EW'] = 'M') then
      TBitDBGrid(Sender).Canvas.Brush.Color := RGB(210, 210, 255);    // azul

  if (TBitDBGrid(Sender).DataSource.DataSet.FieldValues['EW'] = 'W') then
      TBitDBGrid(Sender).Canvas.Brush.Color := RGB(255, 255, 210);    // amarillo

  if (TBitDBGrid(Sender).DataSource.DataSet.FieldValues['EW'] = 'E') then
      TBitDBGrid(Sender).Canvas.Brush.Color := RGB(255, 110, 110);    // rojo

  if (TBitDBGrid(Sender).DataSource.DataSet.FieldValues['EW'] = 'A') then
  begin
      if (column.ReadOnly) then
        TBitDBGrid(Sender).Canvas.Brush.Color := $00FAEDE2
      else
        TBitDBGrid(Sender).Canvas.Brush.Color := RGB(255, 255, 255);
  end;

  if (gdSelected in State) then
  begin
        TBitDBGrid(Sender).Canvas.Brush.Color := RGB(139, 181, 107);
        TBitDBGrid(Sender).Canvas.Font.Style := [fsBold];
        TBitDBGrid(Sender).Canvas.Font.Size := TBitDBGrid(Sender).Canvas.Font.Size + 1;
        TBitDBGrid(Sender).Canvas.Font.Color := clWhite;
  end
  else
  begin
      if (SBSelTodos.Down) then
        TBitDBGrid(Sender).Canvas.Brush.Color := RGB(139, 181, 107)
      else
      begin
        TBitDBGrid(Sender).Canvas.Brush.Color := clWhite;
        TBitDBGrid(Sender).Canvas.Font.Color := clBlack;
      end;
  end;

  TBitDBGrid(Sender).Canvas.FillRect(Rect);
//  TBitDBGrid(Sender).Canvas.Font.Color := clBlack;
  TBitDBGrid(Sender).Canvas.TextOut( Rect.Left+2, Rect.Top+2, Column.Field.Text);


  // Para el check de castración.
  if Column.FieldName = 'VUNO2' then
  begin
      Self.BDBGGrillaMachos.Canvas.FillRect(Rect);
      CheckBoxRectangle.Left := Rect.Left + 40;
      CheckBoxRectangle.Right := Rect.Right - 2;
      CheckBoxRectangle.Top := Rect.Top + 2;
      CheckBoxRectangle.Bottom := Rect.Bottom - 2;
      if(Column.Field.Value <> null )then
        if(Column.Field.AsInteger = 0) {and (IBDSSimpleVUNO2.AsString = 'P')} then
        begin
            BDBGGrillaMachos.Canvas.TextOut( Rect.Left+2, Rect.Top+2, 'Castrar');
            DrawFrameControl(Self.BDBGGrillaMachos.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false]);
        end;
      if(Column.Field.Value <> null )then
        if(Column.Field.AsInteger = 1) {and (IBDSSimpleVUNO2.AsString = 'P')} then
        begin
            BDBGGrillaMachos.Canvas.TextOut( Rect.Left+2, Rect.Top+2, 'Castrar');
            DrawFrameControl(Self.BDBGGrillaMachos.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true]);
        end;
   end;
   //fin del check

  if (Column.FieldName = 'V14') or (Column.FieldName = 'V17') or (Column.FieldName = 'V15') or (Column.FieldName = 'V16') or (Column.FieldName = 'V9')
    or (Column.FieldName = 'V10') or (Column.FieldName = 'V11') or (Column.FieldName = 'V12') or (Column.FieldName = 'V13') or (Column.FieldName = 'ADN')
    or (Column.FieldName = 'TIPIFICACION_SANGUINEA') then
    Column.Visible := FPrincipal.FuncActividad;


end;

// borro la tabla auxiliar animales
procedure TFEveAltaMasiva.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IBQDeleteAuxAnimales.Close;
  IBQDeleteAuxAnimales.Open;
  if (self.Owner is TFMensajeNuevos) then cargaDeMovil:=true;
end;

// me fijo si quedaron repetidos en la grilla
procedure TFEveAltaMasiva.VerificarRepetidos;
begin
  MAErrors.Clear;
  if not(BDBGGrillaHembras.DataSource.DataSet.IsEmpty) then
    begin
      BuscarRepetidosEnColumna('ID_RP',DSGrillaHembras, BDBGGrillaHembras, IBQRepetidos, MAErrors, DSGrillaHembras, 'select count(*) as cantidad from AUX_Animales ');
      BuscarRepetidosEnColumna('ID_SENASA',DSGrillaHembras, BDBGGrillaHembras, IBQRepetidos, MAErrors, DSGrillaHembras, 'select count(*) as cantidad from AUX_Animales ');
      BuscarRepetidosEnColumna('ID_IE',DSGrillaHembras, BDBGGrillaHembras, IBQRepetidos, MAErrors, DSGrillaHembras, 'select count(*) as cantidad from AUX_Animales ');
    end;
  if not (BDBGGrillaMachos.DataSource.DataSet.IsEmpty) then
    begin
      BuscarRepetidosEnColumna('ID_RP',DSGrillaMachos, BDBGGrillaMachos, IBQRepetidos, MAErrors, DSGrillaMachos, 'select count(*) as cantidad from AUX_Animales ');
      BuscarRepetidosEnColumna('ID_SENASA',DSGrillaMachos, BDBGGrillaMachos, IBQRepetidos, MAErrors, DSGrillaMachos, 'select count(*) as cantidad from AUX_Animales ');
      BuscarRepetidosEnColumna('ID_IE',DSGrillaMachos, BDBGGrillaMachos, IBQRepetidos, MAErrors, DSGrillaMachos, 'select count(*) as cantidad from AUX_Animales ');
    end
end;

// chequeo rn en la identificacion
function TFEveAltaMasiva.ChequearRN(grilla: TBitDBGrid;var Data: TDataSource): boolean;
var
  retorno : boolean;
  macho : Integer;
begin
   retorno := false;
   grilla.DataSource := nil;
   MAErrors.Clear;
   Data.DataSet.First;
   Errores := 0;
   Warnings := 0;
   macho := 1;

   FAvanceTerminar := TFAvanceTerminar.Create(self);
   FAvanceTerminar.Pos := 1;
   FAvanceTerminar.Max := Data.DataSet.RecordCount;
   FAvanceTerminar.Modo := maVerificando;
   FAvanceTerminar.Update;
   FAvanceTerminar.Pos := 1;


   while not(Data.DataSet.Eof)do 
   begin
      IBQSPRN.Close;
      IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;

      if (Data.DataSet.fieldByName('id_rp').AsString = '') then
        IBQSPRN.ParamByName('RP').Value := null
      else
        IBQSPRN.ParamByName('RP').Value:= Data.DataSet.fieldByName('id_rp').AsString;

      if (Data.DataSet.fieldByName('id_senasa').AsString = '') then
        IBQSPRN.ParamByName('SENASA').Value := null
      else
        IBQSPRN.ParamByName('SENASA').Value := Data.DataSet.fieldByName('id_senasa').AsString;

      if (Data.DataSet.fieldByName('id_hba').AsString = '') then
        IBQSPRN.ParamByName('HBA').Value := null
      else
        IBQSPRN.ParamByName('HBA').Value := Data.DataSet.fieldByName('id_hba').AsString;

      IBQSPRN.ParamByName('PC').Value := null;
      IBQSPRN.ParamByName('RA').Value := null;
      IBQSPRN.ParamByName('OTRO').Value := null;

      if (Data.DataSet.fieldByName('ID_IE').AsString = '') then
        IBQSPRN.ParamByName('IE').Value := null
      else
        IBQSPRN.ParamByName('IE').Value:= Data.DataSet.fieldByName('ID_IE').AsString;

      //if cargaXLS then
        //IBQSPRN.ParamByName('EDAD').Value := MonthsBetween(now,Data.DataSet.fieldByName('FECHA_NACIMIENTO').AsDateTime)
      //else
        IBQSPRN.ParamByName('EDAD').Value := MonthsBetween(Data.DataSet.fieldByName('FECHA_ALTA').AsDateTime,Data.DataSet.fieldByName('FECHA_NACIMIENTO').AsDateTime);

      if (Data.DataSet.fieldByName('PESO').AsString = '' ) then
        IBQSPRN.ParamByName('PESO').Value := null
      else
        IBQSPRN.ParamByName('PESO').Value := StrToFloat(Data.DataSet.fieldByName('PESO').AsString);

      if Data.DataSet.fieldByName('SEXO').AsInteger=1  then
      begin
        macho := 1;
        IBQSPRN.ParamByName('SEXO').Value := 1;
        IBQSPRN.ParamByName('CANT_PARTOS').Value := null;
        IBQSPRN.ParamByName('ESTADO_REP').Value := null;
        IBQSPRN.ParamByName('CIRCUNFERENCIA').Value := Data.DataSet.fieldByName('CIRCUNFERENCIA_ESCROTAL').AsFloat;
      end
      else
      if Data.DataSet.fieldByName('SEXO').AsInteger=2 then
      begin
        macho := 0;
        IBQSPRN.ParamByName('SEXO').Value := 2;
        IBQSPRN.ParamByName('CANT_PARTOS').Value := Data.DataSet.fieldByName('ESTADO_LACTACION').AsInteger;
        IBQSPRN.ParamByName('ESTADO_REP').Value := Data.DataSet.fieldByName('ESTADO_REPRODUCTIVO').AsInteger;
        IBQSPRN.ParamByName('CIRCUNFERENCIA').Value := null;
      end;

      IBQSPRN.ParamByName('CATEGORIA').Value :=  Data.DataSet.fieldByName('CATEGORIA').AsInteger;
      IBQSPRN.ParamByName('FECHA_NAC').AsDate := Data.DataSet.fieldByName('FECHA_NACIMIENTO').AsDateTime;
      IBQSPRN.ParamByName('DIASPESO').Value := Data.DataSet.fieldByName('VUno1').AsString;;
      IBQSPRN.ParamByName('FECHA_EVE').AsDate := Data.DataSet.fieldByName('FECHA_ALTA').AsDateTime;

      IBQSPRN.ParamByName('CATEGORIA').Value := Data.DataSet.fieldByName('CATEGORIA').AsInteger;
      IBQSPRN.ParamByName('SUBCATEGORIA').Value := Data.DataSet.fieldByName('SUBCATEGORIA').AsInteger;
      IBQSPRN.ParamByName('CODIGOMANEJO').Value := 0;

      IBQSPRN.ParamByName('RAZA').Value := Data.DataSet.fieldByName('RAZA').AsInteger;

      IBQSPRN.Open;

      IBQSPRN.First;
      while not (IBQSPRN.Eof) do
      begin
        if (IBQSPRN.FieldValues['Result'] = 'E') or (IBQSPRN.FieldValues['Result'] = 'W') then
          begin
            Data.DataSet.Edit;
            if (IBQSPRN.FieldValues['Result'] = 'E') then Inc(Errores);
              if (IBQSPRN.FieldValues['Result'] = 'W') then Inc(Warnings);
                Data.DataSet.FieldByName('EW').AsString := IBQSPRN.FieldValues['Result'];
              Data.DataSet.Post;
              MAErrors.Lines.Add(IBQSPRN.FieldValues['Result'] + ':  '+Data.DataSet.FieldByName('id_rp').AsString+': '+ IBQSPRN.FieldValues['mensaje']);
              retorno := true;
              PError.Visible := true;
          end;
        IBQSPRN.Next;
      end;
      Data.DataSet.Next;
      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
      FAvanceTerminar.Update;
      Application.ProcessMessages;
    end;
    grilla.DataSource := Data;
    Result := retorno;
    //FAvanceTerminar.Close;
    FAvanceTerminar.Destroy;
end;

procedure TFEveAltaMasiva.EACircunferenciaEscrotalExit(Sender: TObject);
begin
  inherited;
  if EACircunferenciaEscrotal.Text = '' then
    EACircunferenciaEscrotal.Text := '0';
  GetEvent(sender);
end;

procedure TFEveAltaMasiva.CBCondicionCorporalClick(Sender: TObject);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveAltaMasiva.CBCondicionCorporalKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  controlCondicionCorporal
end;

procedure TFEveAltaMasiva.controlCondicionCorporal;
begin
  DBLCBACondicionC.Enabled := CBCondicionCorporal.Checked;
  if (not DBLCBACondicionC.Enabled) then
    DBLCBACondicionC.KeyValue := null;
end;

procedure TFEveAltaMasiva.EAPesoExit(Sender: TObject);
begin
  inherited;
  if (EAPeso.Text = '') then
    EAPeso.Text := '0';
  GetEvent(sender);
  ControlEventoOnExit(nil);
end;

procedure TFEveAltaMasiva.ActualizarCUIG(var Identificador : String; cant : integer);
var
  ultimo, nuevo_idenficador : String;
begin
  if (CBCUIGPropio.Checked) then
  begin
    IBQBuscarCUIG.Close;
    IBQBuscarCUIG.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQBuscarCUIG.ParamByName('id').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQBuscarCUIG.Open;
    ultimo := IBQBuscarCUIG.fieldByName('ultimo_identificador').AsString;
    nuevo_idenficador  := UFunctions.IncrementarIdentificadorCUIGX(ultimo,cant);
    IBQActCUIG.Close;
    IBQActCUIG.ParamByName('cuig').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQActCUIG.ParamByName('UI').AsString := nuevo_idenficador;
    IBQActCUIG.Open;
  end;
end;

procedure TFEveAltaMasiva.CBCUIGPropioClick(Sender: TObject);
begin
  inherited;
  if (CBCUIGPropio.Checked) then
    begin
     DBLCBACUIGPropio.Visible := true;
     EAEncabezado.Text := '';
     EAUltimoIdent.Text := '';
    end
  else
  begin
    DBLCBACUIGPropio.KeyValue:=-1;
    DBLCBACUIGPropio.Visible := false;
    EAEncabezado.Text := '';
    EAUltimoIdent.Text := '';
  end;
end;

procedure TFEveAltaMasiva.DBLCBACUIGPropioCloseUp(Sender: TObject);
begin
  inherited;
  
  if (DBLCBACUIGPropio.KeyValue <> null) then
  begin
    IBQBuscarCUIG.Close;
    IBQBuscarCUIG.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQBuscarCUIG.ParamByName('id').AsInteger := DBLCBACUIGPropio.KeyValue;
    IBQBuscarCUIG.Open;
//    EACantidad.SetFocus;
//    EACantidad.SelectAll;
    EAEncabezado.Text := DBLCBACUIGPropio.Text;
    EAUltimoIdent.Text := IBQBuscarCUIG.fieldByName('ultimo_identificador').AsString;
    EAEncabezadoChange(EAEncabezado);
    EAUltimoIdentChange(EAUltimoIdent);
  end;
end;

procedure TFEveAltaMasiva.EAEncabezadoChange(Sender: TObject);
begin
  inherited;
  //Agregada la validacion para que cargue el Edit del RP cuando no esta visible
  if ((EAEncabezado.Text <> '') and (EAUltimoIdent.Text <> '')) and (GBIdentificarRP.Visible = FALSE) then
    EARpInicial.Text := EAEncabezado.Text + EAUltimoIdent.Text;

  ControlEventoOnExit(Sender);
end;

procedure TFEveAltaMasiva.EAUltimoIdentChange(Sender: TObject);
begin
  inherited;
  //Agregada la validacion para que cargue el Edit del RP cuando no esta visible
  if ((EAEncabezado.Text <> '') and (EAUltimoIdent.Text <> '')) and (GBIdentificarRP.Visible = FALSE) then
    EARpInicial.Text := EAEncabezado.Text + EAUltimoIdent.Text;

  ControlEventoOnExit(Sender);
end;

procedure TFEveAltaMasiva.ACancelarExecute(Sender: TObject);
//var
  //valor : Boolean;
begin
  {valor := (EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____');
  if (RBCUIGSenasa.Checked and valor and CBCUIGPropio.Checked) then
  begin
    IBQActCUIG.Close;
    IBQActCUIG.ParamByName('cuig').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQActCUIG.ParamByName('UI').AsString := PrimerIdentificador;
    IBQActCUIG.Open;
  end; }

  //******************************************************//
  //	INCIDENCIA: 401									                    //
  //	INICIO Borrado de temporales creados.               //
  //	Carla Gareis							              23/12/2014  //
  //******************************************************//
  //Eliminación de archivos temporales creados.
  try
  CloseFile(arcEquivalenciasTxt);
  Erase(arcEquivalenciasTxt);
  CloseFile(arcEquivalenciasXls);
  Erase(arcEquivalenciasXls);
  except
  end;
  //******************************************************//
  //	INCIDENCIA: 401									                    //
  //	FIN Borrado de temporales creados.                  //
  //	Carla Gareis							              23/12/2014  //
  //******************************************************//
  inherited;
end;


procedure TFEveAltaMasiva.ASacarAnimalExecute(Sender: TObject);
begin
  inherited;
  if PCGrillas.ActivePage=TSHembras then //sexo=2{(CBSexo.ItemIndex = 1)} then
    begin
    BorrarSeleccion(CDSGrillaHembras, BDBGGrillaHembras);
    TSHembras.Caption:=Traducir('Hembras(')+inttostr(CDSGrillaHembras.RecordCount)+')';
    TSHembras.TabVisible:=CDSGrillaHembras.RecordCount>0;
    end
   else
    begin
    BorrarSeleccion(CDSGrillaMachos, BDBGGrillaMachos);
    TSMachos.Caption:=Traducir('Machos(')+inttostr(CDSGrillaMachos.RecordCount)+')';
    TSMachos.TabVisible:=CDSGrillaMachos.RecordCount>0;
    end;
  TSHObservacion.TabVisible:=((CDSGrillaHembras.RecordCount>0) or (CDSGrillaMachos.RecordCount>0));
  if ((CDSGrillaHembras.RecordCount=0) and (CDSGrillaMachos.RecordCount=0)) then
    agregar:=true;
  PCBasicoChange(self);
end;


procedure TFEveAltaMasiva.BorrarSeleccion(dataSet:TIBDataSet; grilla:TBitDBGrid);
var
  i : integer;
  pregunto : Boolean;
  retorno : TModalResult;
begin

    pregunto:=true;
    i:=0;
    if grilla.SelectedRows.Count > 0 then
    begin
       // if( BDBGSimple.SelectedRows.Count = 1) then
//          deshabitilar si a todo y cancelar
        with grilla.DataSource.DataSet do
          begin
          while(i < grilla.SelectedRows.Count) do
            begin
              GotoBookmark(pointer(grilla.SelectedRows.Items[i]));
              if (dataSet.FieldValues['ID_RP'] <> null)  then
              begin
                if(pregunto) then
                begin
                  retorno := MostrarMensaje(tmTodos, Traducir('Usted intenta sacar el animal ')+ dataset.FieldByName('id_rp').AsString +Traducir(', desea Continuar ?'));
                  if ( retorno = mrYes)then
                    dataSet.Delete
                  else
                    if(retorno = mrAll) then
                    begin
                      pregunto := false;
                      dataSet.Delete;
                    end
                    else
                      if(retorno = mrCancel) then
                        i:= grilla.SelectedRows.Count + 1;
                end
                else
                  dataSet.Delete;
              end;
              i:=i+1;
            end;
          end;
      end;
  grilla.SelectedRows.Clear;
  //BSacarAnimal.Visible:=true;
  ISacarAnimal.Visible := true;
  LSacarAnimal.Visible := true;
  ASacarAnimal.Enabled := false;
  ASacarAnimal.Caption:= Traducir('Sacar Animal');
  if(BDBGGrillaHembras.DataSource.DataSet.IsEmpty) and (BDBGGrillaMachos.DataSource.DataSet.IsEmpty){not(cargaDeMovil or cargaXLS)}then
    PCBasico.ActivePageIndex:=0;

  ControlEventoOnExit(self);
  ControlBounds;

end;



procedure TFEveAltaMasiva.BDBGGrillaHembrasCellClick(Column: TColumn);
var i:integer;
begin
  inherited;
  PuedeEliminar:= True;
  if apretado then
    begin
    BDBGGrillaHembras.SelectedRows.CurrentRowSelected:=true;
    for i:=0 to Abs(ind-BDBGGrillaHembras.DataSource.DataSet.RecNo) do
       begin
       BDBGGrillaHembras.SelectedRows.CurrentRowSelected:=true;
       if BDBGGrillaHembras.DataSource.DataSet.RecNo<ind then
          BDBGGrillaHembras.DataSource.DataSet.Next;
       if BDBGGrillaHembras.DataSource.DataSet.RecNo>ind then
          BDBGGrillaHembras.DataSource.DataSet.Prior;
       end;
    end;
  SBSelTodos.Down:=false;
  if(BDBGGrillaHembras.SelectedRows.Count = 1) then
    ASacarAnimal.Caption:= Traducir('Sacar Animal')
  else
  if(BDBGGrillaHembras.SelectedRows.Count > 1) then
    ASacarAnimal.Caption:= Traducir('Sacar Animales');

  //BSacarAnimal.Visible:=true;
  ISacarAnimal.Visible := true;
  LSacarAnimal.Visible := true;
  ASacarAnimal.Enabled := BDBGGrillaHembras.SelectedRows.Count > 0;
  BDBGGrillaHembrasColEnter(nil);

  UltimaPos := BDBGGrillaHembras.DataSource.DataSet.RecNo - 1;
  SBBarrita.Position := BDBGGrillaHembras.DataSource.DataSet.RecNo - 1;
  regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo;
  IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo);
  IBarraHorIzq.Top := IBarraHorDer.Top;
  Posicion := UltimaPos+1;

end;

procedure TFEveAltaMasiva.DBLCBAtipoAltaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DTPAFechaAlta.Enabled) then
      begin
         DTPAFechaAlta.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaMasiva.DTPAFechaAltaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   if (RBRp.Checked) then
    begin
      if (EAPrefijo.Enabled) then
        begin
           EAPrefijo.SetFocus;
           EAPrefijo.SelectAll;
           key:= #0;
        end;
     end
    else
     if (RBSenasa.Checked) then
      begin
        if (EARpInicial.Enabled) then
          begin
             EARpInicial.SetFocus;
             EARpInicial.SelectAll;
             key:= #0;
          end;
       end
      else
       if (RBCUIGSenasa.Checked) then
        begin
          if (EAEncabezado.Enabled) then
            begin
               EAEncabezado.SetFocus;
               EAEncabezado.SelectAll;
               key:= #0;
            end;
         end
end;

procedure TFEveAltaMasiva.EAPrefijoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EARpInicial.Enabled) then
      begin
         EARpInicial.SetFocus;
         EARpInicial.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaMasiva.EASufijoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EACantidad.Enabled) then
      begin
         EACantidad.SetFocus;
         EACantidad.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaMasiva.CBSexoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAPotrero.Enabled) then
      begin
         DBLCBAPotrero.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaMasiva.DBLCBAPotreroKeyPress(Sender: TObject;
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

procedure TFEveAltaMasiva.DBLCBARodeoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAEdad.Enabled) then
      begin
         EAEdad.SetFocus;
         EAEdad.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaMasiva.EADtaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DBLCBAResponsable.Enabled) then
      begin
         DBLCBAResponsable.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveAltaMasiva.DBLCBAResponsableKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAPeso.Enabled) then
      begin
         EAPeso.SetFocus;
         EAPeso.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaMasiva.DBLCBACatMachosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
     if (EACircunferenciaEscrotal.Enabled) then
       begin
          EACircunferenciaEscrotal.SetFocus;
          EACircunferenciaEscrotal.SelectAll;          
          key:= #0;
       end;
end;

procedure TFEveAltaMasiva.DBLCBACategoriaKeyPress(Sender: TObject;
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

procedure TFEveAltaMasiva.DBLCBAEstadoRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
     if (DBLCBAGdr.Enabled) then
       begin
          DBLCBAGdr.SetFocus;
          key:= #0;
       end;
end;

procedure TFEveAltaMasiva.DBLCBAGdrKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
     if (EAEstadoLactacion.Enabled) then
       begin
          EAEstadoLactacion.SetFocus;
          EAEstadoLactacion.SelectAll;
          key:= #0;
       end
      else
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

procedure TFEveAltaMasiva.DBLCBACondicionCKeyPress(Sender: TObject;
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

procedure TFEveAltaMasiva.DBLCBACronologiaDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
     if (EAValortotal.Enabled) then
       begin
          EAValortotal.SetFocus;
          EAValortotal.SelectAll;
          key:= #0;
       end;
end;

procedure TFEveAltaMasiva.EAEncabezadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ((key in (['0'..'9'])) or (key in (['A'..'Z'])) or (key in (['a'..'z']))) then
  begin
      CBCUIGPropio.Checked:= false;
      LCuigCargados.Visible := false;
  end;

  if (Key = #13) then
    if (EAUltimoIdent.Enabled) then
    begin
         EAUltimoIdent.SetFocus;
         EAUltimoIdent.SelectAll;
         key:= #0;
    end;
end;

procedure TFEveAltaMasiva.EAUltimoIdentKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EACantidad.Enabled) then
      begin
         EACantidad.SetFocus;
         EACantidad.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveAltaMasiva.CDSGrillaMachosFECHA_NACIMIENTOSetText(
  Sender: TField; const Text: String);
var
  Fecha : TDateTime;
begin
  inherited;
  if(CDSGrillaMachos.State <> dsInsert)then
  begin
    if (TryStrToDate(Text,Fecha)) then
      begin
        try
          Sender.AsDateTime := Fecha;
        except
          MostrarMensaje(tmError, 'El Valor ingresado no corresponde a una Fecha válida');
        end;
      end
    else
      MostrarMensaje(tmError, 'El Valor ingresado no corresponde a una Fecha válida');
  end;
end;

procedure TFEveAltaMasiva.CDSGrillaHembrasFECHA_NACIMIENTOSetText(
  Sender: TField; const Text: String);
var
  Fecha : TDateTime;
begin
  inherited;
  if(CDSGrillaHembras.State <> dsInsert)then
  begin
    if (TryStrToDate(Text,Fecha)) then
      begin
        try
          Sender.AsDateTime := Fecha;
        except
          MostrarMensaje(tmError,'El Valor ingresado no corresponde a una Fecha válida');
        end;
      end
    else
      MostrarMensaje(tmError,'El Valor ingresado no corresponde a una Fecha válida');
  end;
end;

function TFEveAltaMasiva.completarEdadCD(cronodentaria: Integer): Integer;
begin
    result:= 0;
    case cronodentaria of
      0 : begin  //no definida
            result:= 0;
          end;
      1: begin   // diente de leche
            result:= 10;
         end;
      2: begin   // dos dientes
            result:= 28;
         end;
      3: begin   // cuatro dientes
            result:= 33;
         end;
      4: begin   // seis dientes
            result:= 38;
         end;
      5: begin   // boca llena
            result:= 48;
         end;
      6: begin   // tres cuartos diente
            result:= 72;
         end;
      7: begin   // medio diente
            result:= 96;
         end;
      8: begin   // cuarto diente
            result:= 120;
         end;
      9: begin   // sin diente
            result:= 144;
         end;
    end;
end;

procedure TFEveAltaMasiva.DBLCBACronologiaDCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBACronologiaD.KeyValue > 0 then
  begin
    EAEdad.Text:= IntToStr(completarEdadCD(DBLCBACronologiaD.KeyValue));
    LEdad.Font.Color:= clBlue;
    LEdad.Font.Style:= [fsBold];
  end;
end;

procedure TFEveAltaMasiva.DBLCBAtipoAltaCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBAtipoAlta.KeyValue = 3 ) then
  begin
       EADta.Text :='';
       JvEADta.Text := '';
       LDta.Enabled := false;
       EADta.Enabled := false;
       JvEADta.Enabled := false;
       BDBGGrillaHembras.ColumnByField('DTA').Visible:= false;
       CDSGrillaHembrasDTA.Visible:= false;
       CDSGrillaMachosDTA.Visible:= false;
       BDBGGrillaMachos.ColumnByField('DTA').Visible:= false;
       LDTE.Enabled := false;
       EADTE.Enabled := false;
       BExaminarDTE.Enabled := false;
  end
  else
  begin
       EADta.Text := '';
       JvEADta.Text := '';
       LDta.Enabled := true;
       EADta.Enabled := true;
       JvEADta.Enabled := true;
       CDSGrillaHembrasDTA.Visible:= true;
       BDBGGrillaHembras.ColumnByField('DTA').Visible:= true;
       CDSGrillaMachosDTA.Visible:= true;
       BDBGGrillaMachos.ColumnByField('DTA').Visible:= true;
       LDTE.Enabled := true;
       EADTE.Enabled := true;
       BExaminarDTE.Enabled := true;
  end;
  GetEvent(DBLCBAtipoAlta);
end;

procedure TFEveAltaMasiva.DTPAFechaAltaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;

end;

procedure TFEveAltaMasiva.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  RBSenasa.Caption:= FPrincipal.PaisNombreCaravana;

  BDBGGrillaMachos.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;
  BDBGGrillaHembras.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;

  if (pais = 1) then //Argentina
   begin
    BDBGGrillaHembras.ColumnByField('ID_HBA').Title.Caption:=Traducir('HBA');
    BDBGGrillaMachos.ColumnByField('ID_HBA').Title.Caption:=Traducir('HBA');
    RBCUIGSenasa.Visible:= True;
    if (RBCUIGSenasa.Checked) then
     begin
      EAEncabezado.Visible:= True;
      EAUltimoIdent.Visible:= True;
      CBCUIGPropio.Visible:= True;
      LCUIGPropio.Visible := true;
      EAVerificador.Visible := true;
      LCuigCargados.Visible := true;
      if (CBCUIGPropio.Checked) then
        DBLCBACUIGPropio.Visible:= True;
     end;

    if (RBReidentificacionSenasa.Checked) then
     begin
      Lr.Visible:= True;
      EAEncabezadoReidentificacion.Visible:= True;
      EAUltimoIdentReidentificacion.Visible:= True;
     end;
   end
  else
    if (pais = 2) then //Uruguay
     begin
      RBSenasa.Width:= 120;

      RBCUIGSenasa.Visible:= False;
      EAEncabezado.Visible:= False;
      EAUltimoIdent.Visible:= False;
      CBCUIGPropio.Visible:= False;
      LCUIGPropio.Visible := false;
      DBLCBACUIGPropio.Visible:= False;
      EAVerificador.Visible := false;
      LCuigCargados.Visible := false;

      BDBGGrillaHembras.ColumnByField('ID_HBA').Title.Caption:=Traducir('HBU');
      BDBGGrillaMachos.ColumnByField('ID_HBA').Title.Caption:=Traducir('HBU');

      Lr.Visible:= false;
      EAEncabezadoReidentificacion.Visible:= false;
      EAUltimoIdentReidentificacion.Visible:= false;
      RBReidentificacionSenasa.Visible:= false;

      ICarOficialNoPres.Visible := true;
      ICuigNoPres.Visible := false;
      IReIDNoPres.Visible := false;
     end
   else
       begin
        RBSenasa.Width:= 130;

        RBCUIGSenasa.Visible:= False;
        EAEncabezado.Visible:= False;
        EAUltimoIdent.Visible:= False;
        CBCUIGPropio.Visible:= False;
        LCUIGPropio.Visible := false;
        DBLCBACUIGPropio.Visible:= False;
        EAVerificador.Visible := false;
        LCuigCargados.Visible := false;

        BDBGGrillaHembras.ColumnByField('ID_HBA').Title.Caption:=Traducir('Heard Book');
        BDBGGrillaMachos.ColumnByField('ID_HBA').Title.Caption:=Traducir('Heard Book');

        Lr.Visible:= false;
        EAEncabezadoReidentificacion.Visible:= false;
        EAUltimoIdentReidentificacion.Visible:= false;
        RBReidentificacionSenasa.Visible:= false;

        RBEquivalencias.Top := 100;

        ICarOficialNoPres.Visible := true;
        ICuigNoPres.Visible := false;
        IReIDNoPres.Visible := false;
       end;
end;

procedure TFEveAltaMasiva.LCUIGPropioClick(Sender: TObject);
var F : TFABMModificarCUIG; 
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      //FPrincipal.AbrirFormNormal(TFABMModificarCUIG.Create(Self));
      F := TFABMModificarCUIG.Create(self);
      //F.CampoARetornar := 'ID_CUIG';
      F.ShowModal;

      //nroID := F.ValorARetornar;
      DMSoftvet.IBQCUIGActual.Close;
      DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQCUIGActual.Open;

      if nroID>-1 then
      begin
        DBLCBACUIGPropio.KeyValue := nroID;
        nroID := -1;
        GetEvent(DBLCBACUIGPropio);
        DBLCBACUIGPropioCloseUp(DBLCBACUIGPropio);
      end;

      F.Destroy;
  end;
end;

procedure TFEveAltaMasiva.LCUIGPropioMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCUIGPropio.Font.Color:= $00606C02;
      LCUIGPropio.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LCUIGPropioMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCUIGPropio.Font.Color:= clWindowText;
      LCUIGPropio.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.Label8Click(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
      DMSoftvet.IBQResponsable.Close;
      DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQResponsable.Open;
      if nroID>-1 then
        begin
        DBLCBAResponsable.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBAResponsable);
        end;
    end;
end;

procedure TFEveAltaMasiva.Label8MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label8.Font.Color:= $00606C02;
      Label8.Font.Style:= [fsBold,fsUnderline];
    end;      
end;

procedure TFEveAltaMasiva.Label8MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label8.Font.Color:= clWindowText;
      Label8.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LPotreroClick(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      //nroID:=0;
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);

      try
          IBQGetUltimoPotrero.Close;
          IBQGetUltimoPotrero.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          IBQGetUltimoPotrero.Open;

          nroID := IBQGetUltimoPotrero.FieldValues['id_potrero'];

          IBQVisiblePot.Close;
          IBQVisiblePot.ParamByName('pot').AsInteger := nroID;
          IBQVisiblePot.Open;

          FPrincipal.IBTPrincipal.CommitRetaining;
      except
          FPrincipal.IBTPrincipal.RollbackRetaining;
      end;

      DMSoftvet.IBQPotrerosSinServicio.Close;
      DMSoftvet.IBQPotrerosSinServicio.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQPotrerosSinServicio.Open;

      if nroID>-1 then
      begin
        DBLCBAPotrero.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBAPotrero);
      end;
  end;
end;

procedure TFEveAltaMasiva.LPotreroMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPotrero.Font.Color:= $00606C02;
      LPotrero.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LPotreroMouseLeave(Sender: TObject);
begin
  inherited;
  LPotrero.Font.Color:= clWindowText;
  LPotrero.Font.Style:= [fsUnderline];
end;

procedure TFEveAltaMasiva.LRodeoClick(Sender: TObject);
var
  abm : TFABMRodeos;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      abm := TFABMRodeos.Create(self);
      abm.Abrir(faAbm);

      try
          IBQGetUltimoRodeo.Close;
          IBQGetUltimoRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          IBQGetUltimoRodeo.Open;

          nroID := IBQGetUltimoRodeo.FieldValues['id_rodeo'];

          IBQVisibleRod.Close;
          IBQVisibleRod.ParamByName('rod').AsInteger := nroID;
          IBQVisibleRod.Open;

          FPrincipal.IBTPrincipal.CommitRetaining;
      except
          FPrincipal.IBTPrincipal.RollbackRetaining;
      end;

      DMSoftvet.IBQRodeo.Close;
      DMSoftvet.IBQRodeo.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQRodeo.Open;
      
      if nroID>-1 then
        begin
        DBLCBARodeo.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBARodeo);
        end;
    end;
end;

procedure TFEveAltaMasiva.LRodeoMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LRodeo.Font.Color:= $00606C02;
      LRodeo.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LRodeoMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LRodeo.Font.Color:= clWindowText;
      LRodeo.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.DBLCBATiposPesoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBATiposPeso.KeyValue <> null then
    DiasPeso := DBLCBATiposPeso.KeyValue
  else
    DiasPeso := 'G';
end;

procedure TFEveAltaMasiva.EAPesoChange(Sender: TObject);
begin
  inherited;
  if ((EAPeso.Text <> '') and (EAPeso.Text <> '0')) then
  begin
    if (Lpeso.Font.Size = 9) then
    begin
         LDias.Font.Size := 9;
         DBLCBATiposPeso.Font.Size := 9;
    end
    else
    begin
         LDias.Font.Size := 11;
         DBLCBATiposPeso.Font.Size := 11;
    end;
    DBLCBATiposPeso.Visible := true;
    LDias.Visible := true;
    DBLCBATiposPeso.KeyValue := 'G';
    BDBGGrillaHembras.ColumnByField('V9').ReadOnly := false;
    BDBGGrillaMachos.ColumnByField('V9').ReadOnly := false;
    DBLCBATiposPeso.Enabled := FPrincipal.FuncActividad;
  end
  else
  begin
    DBLCBATiposPeso.Visible := false;
    LDias.Visible := false;
    BDBGGrillaHembras.ColumnByField('V9').ReadOnly := true;
    BDBGGrillaMachos.ColumnByField('V9').ReadOnly := true;
  end;
end;

procedure TFEveAltaMasiva.CDSGrillaMachosPESOSetText(Sender: TField;
  const Text: String);
var
  valor : double;
  punt, com: integer;
  Separador: Char;
  po: integer;
  auxText: String;
begin
  inherited;
  if ((((DSGrillaMachos.State <> dsInsert)and(PCGrillas.ActivePage=TSMachos))or((DSGrillaHembras.State <> dsInsert)and(PCGrillas.ActivePage=TSHembras)))and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
  begin
    auxText := Text;
   { SysUtils.DecimalSeparator := '.';
    po := pos(',',auxText);
    if (po>0) then
      auxText[po]:='.'; }
    auxText := FixDecimal(auxText);
    if TryStrToFloat(auxText,valor) then
      if Length(Text) > 7 then
         MostrarMensaje(tmError, 'El valor de peso ingresado no es válido')
      else
      begin
        if valor > 0 then
        begin
          BDBGGrillaMachos.ColumnByField('V9').ReadOnly := false;
          BDBGGrillaMachos.ColumnByField('V9').Color := clWindow;
        end;
        Sender.AsFloat := valor;
      end
    else
      MostrarMensaje(tmError, 'El valor de peso ingresado no es válido');
  end;
end;

procedure TFEveAltaMasiva.CDSGrillaHembrasPESOSetText(Sender: TField;
  const Text: String);
var
  valor : double;
  punt, com: integer;
  Separador: Char;
  po: integer;
  auxText: String;
begin
  inherited;
  if ((((DSGrillaMachos.State <> dsInsert)and(PCGrillas.ActivePage=TSMachos))or((DSGrillaHembras.State <> dsInsert)and(PCGrillas.ActivePage=TSHembras)))and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
  begin
    auxText := Text;
    {SysUtils.DecimalSeparator := '.';
    po := pos(',',auxText);
    if (po>0) then
      auxText[po]:='.';}
    auxText := FixDecimal(auxText);
    if TryStrToFloat(auxText,valor) then
      if Length(Text) > 7 then
         MostrarMensaje(tmError, 'El valor de peso ingresado no es válido')
      else
      begin
        if valor > 0 then
        begin
          BDBGGrillaHembras.ColumnByField('V9').ReadOnly := false;
          BDBGGrillaHembras.ColumnByField('V9').Color := clWindow;
        end;
        Sender.AsFloat := valor;
      end
    else
      MostrarMensaje(tmError, 'El valor de peso ingresado no es válido');
  end;
end;

procedure TFEveAltaMasiva.EAValorNetoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if(Length(EAValorNeto.Text) = 0) then
    EAValorNeto.Text := '0';
end;

procedure TFEveAltaMasiva.BDBGGrillaMachosCellClick(Column: TColumn);
var i:integer;
begin
  inherited;
  PuedeEliminar:= True;
  if apretado then
    begin
    BDBGGrillaMachos.SelectedRows.CurrentRowSelected:=true;
    for i:=0 to Abs(ind-BDBGGrillaMachos.DataSource.DataSet.RecNo) do
       begin
       BDBGGrillaMachos.SelectedRows.CurrentRowSelected:=true;
       if BDBGGrillaMachos.DataSource.DataSet.RecNo<ind then
          BDBGGrillaMachos.DataSource.DataSet.Next;
       if BDBGGrillaMachos.DataSource.DataSet.RecNo>ind then
          BDBGGrillaMachos.DataSource.DataSet.Prior;
       end;
    end
  else
      BDBGGrillaMachos.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

  SBSelTodos.Down:=false;
  if(BDBGGrillaMachos.SelectedRows.Count = 1) then
    ASacarAnimal.Caption:= Traducir('Sacar Animal')
  else
  if(BDBGGrillaMachos.SelectedRows.Count > 1) then
    ASacarAnimal.Caption:= Traducir('Sacar Animales');
  //BSacarAnimal.Visible:=true;
  LSacarAnimal.Visible := true;
  ISacarAnimal.Visible := true;
  ASacarAnimal.Enabled := BDBGGrillaMachos.SelectedRows.Count > 0;
  BDBGGrillaMachosColEnter(nil);

  if(Column.FieldName = 'VUNO2') then
    if (CDSGrillaMachos.FieldByName('categoria').AsInteger = 1) then
      CambiarValorColumna(Column);
  BDBGGrillaMachosColEnter(nil);

  UltimaPos := BDBGGrillaMachos.DataSource.DataSet.RecNo - 1;
  SBBarrita.Position := BDBGGrillaMachos.DataSource.DataSet.RecNo - 1;
  regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo;
  IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo);
  IBarraHorIzq.Top := IBarraHorDer.Top;
  Posicion := UltimaPos+1;
  
end;

procedure TFEveAltaMasiva.CambiarValorColumna(Column: TColumn);
begin
  Column.Field.DataSet.Edit;
  if(Column.Field.AsInteger = 0)then
    Column.Field.AsInteger := 1
  else
    Column.Field.AsInteger := 0;
  Column.Field.DataSet.Post;
end;

procedure TFEveAltaMasiva.DBLCBACategoriaCloseUp(Sender: TObject);
var
  cod : Integer;
begin
  inherited;
  cod := DBLCBACategoria.KeyValue;
  if IBQCategorias.FieldByName('ref_categ').Value <> null then
    cod := IBQCategorias.FieldByName('ref_categ').Value;
  case cod of
    1,2,3 : CBSexo.ItemIndex := 0;
    4,5,6 : CBSexo.ItemIndex := 1;
  end;
  CBSexoClick(nil);
  CBSexoCloseUp(nil);
  CBSexoChange(nil);

//-----------------------------------------------------------------------------

  if (cod = 6) then
  begin
      LEstadoLactacion.Visible := true;
      JvEAEstadoLactacion.Visible := true;
      EAEstadoLactacion.Visible := false;
  end
  else
  begin
      LEstadoLactacion.Visible := false;
      JvEAEstadoLactacion.Visible := false;
      EAEstadoLactacion.Visible := false;
  end;

  Lcircunferencia.Visible := false;
  EACircunferenciaEscrotal.Visible := false;
  JEACircunferenciaEscrotal.Visible := false;
  LUnidades.Visible := false;
  LCastrado.Visible := false;
  CBCastracion.Visible := false;
  LEstadoR.Visible := false;
  DBLCBAEstadoR.Visible := false;
  LGdr.Visible := false;
  DBLCBAGdr.Visible := false;

  if (CBSexo.ItemIndex = 0) then
  begin
       Lcircunferencia.Visible := true;
       JEACircunferenciaEscrotal.Visible := true;
       LUnidades.Visible := true;
       LCastrado.Visible := true;
       CBCastracion.Visible := true;
       if (GBDatosParticulares.Font.Size = 10) then
           DisminuirGroup(GBDatosParticulares);
  end;

  if (CBSexo.ItemIndex = 1) then
  begin
       LEstadoR.Visible := true;
       DBLCBAEstadoR.Visible := true;
       LGdr.Visible := true;
       DBLCBAGdr.Visible := true;
       if (GBDatosParticulares.Font.Size = 10) then
           DisminuirGroup(GBDatosParticulares);
  end;

//-----------------------------------------------------------------------------

  if (DBLCBACategoria.KeyValue <> null) then
  begin
    if cod = 6 then
    begin
      LEstadoLactacion.Visible := true;
      //EAEstadoLactacion.Visible := true;
      JvEAEstadoLactacion.Visible := true;
      EAEstadoLactacion.EsRequerido := true;
      ControlEventoOnExit(nil);
    end
    else
    begin
      LEstadoLactacion.Visible := false;
      EAEstadoLactacion.Visible := false;
      JvEAEstadoLactacion.Visible := false;
      EAEstadoLactacion.EsRequerido := false;
      ControlEventoOnExit(nil);
    end;
    if(cod <> 1)then
      CBCastrado.Enabled := false
    else
      CBCastrado.Enabled := true;
  end;
end;

procedure TFEveAltaMasiva.EAEstadoLactacionExit(Sender: TObject);
var
  val : Integer;
begin
  inherited;
  if TryStrToInt(EAEstadoLactacion.Text,val) then
  begin
    if (val < 20) and (val > 0) then
    begin
      getEvent(sender);
      ControlEventoOnExit(sender);
    end
    else
      mostrarMensaje(tmError,'La cantidad de partos debe estar entre 0 y 20');
  end
  else
    mostrarMensaje(tmError,'El valor de la cantidad de partos debe ser un numero entero');
end;

procedure TFEveAltaMasiva.EAEstadoLactacionChange(Sender: TObject);
begin
  inherited;
  ControlEventoOnExit(sender);
end;

function TFEveAltaMasiva.validarDatosAnimales(i:integer):string;
var
 itest : integer;
 categOrig, codigoCategoria : string;
 rpAnimal: String;
begin
 try
  // Leo la categoria del animal

  categOrig := UpperCase(getDato('categoría',anim[i]));

 // El dato puede venir con otro nombre
  if DBLCBACategoria.ListSource.DataSet.Lookup('CODIGO',categOrig,'NOMBRE')<>null then
  begin
      codigoCategoria:=DBLCBACategoria.ListSource.DataSet.Lookup('CODIGO',categOrig,'NOMBRE');
  end else
  begin
    codigoCategoria := categOrig;
  end;
  // El codigo no existe en el listado
 { if  codigoCategoria = '' then
  begin
    result := 'Categoria animal inexistente';
    exit;
  end;}

  for itest :=0 to high(anim) do
    if itest <>i then
    begin
      rpAnimal := getDato('rp',anim[itest]);
      if getDato('rp',anim[itest]) = getDato('rp',anim[i]) then
      begin
        result := 'RP '+rpAnimal+'animal repetido';
        exit;
       end;
    end;
 except
 end;
 result := '';
end;

procedure TFEveAltaMasiva.cargarMachosNuevos(i:integer; var CDSGrilla: TIBDataSet);
var
  aux_circ: string;
begin

  aux_circ := getDato('circunferencia escrotal',anim[i]);
  if aux_circ <> '' then
  begin
    CDSGrilla.FieldByName('circunferencia_escrotal').AsFloat := StrToFloat(aux_circ);
  end
  else
  begin
    CDSGrilla.FieldByName('circunferencia_escrotal').Value := null;
  end

end;

procedure TFEveAltaMasiva.cargarHembrasNuevas(i:integer; var CDSGrilla: TIBDataSet);
begin
          str:=getDato('gdr',anim[i]);
          if DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE')<>null then
            str:= DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE');
          if str<>'' then
            begin
            if DBLCBAGdr.ListSource.DataSet.Lookup('ID_GDR',str,'SINONIMO')<>null then
              begin
              CDSGrilla.FieldByName('GDR').AsInteger:= strtoint(str);
              CDSGrilla.FieldByName('V1').AsString := DBLCBAGdr.ListSource.DataSet.Lookup('ID_GDR',CDSGrilla.FieldByName('GDR').AsInteger,'SINONIMO');
              end
            else
              begin
              CDSGrilla.FieldByName('V1').AsString:= str;
              if DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',CDSGrilla.FieldByName('V1').AsString,'SINONIMO')<>null then
                CDSGrilla.FieldByName('V1').AsString := DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',CDSGrilla.FieldByName('V1').AsString,'SINONIMO');
              CDSGrilla.FieldByName('GDR').AsInteger := DBLCBAGdr.ListSource.DataSet.Lookup('SINONIMO',CDSGrilla.FieldByName('V1').AsString,'ID_GDR');
              end;
            end
          else
          begin
            CDSGrilla.FieldByName('GDR').AsInteger:= 0;
            CDSGrilla.FieldByName('V1').AsString:= 'NO DEFINIDO';
          end;

          str:=getDato('cantidad partos',anim[i]);
          if str='' then
            if CDSGrilla.FieldByName('V5').AsString='VACA' then
              CDSGrilla.FieldByName('estado_lactacion').AsInteger:= 1
            else
              CDSGrilla.FieldByName('estado_lactacion').AsInteger:= 0
          else
            CDSGrilla.FieldByName('estado_lactacion').AsInteger:=strtoint(str);
          // BUG . Todos los estados deben estar en Mayusculas
          str:=uppercase(getDato('estado reproductivo',anim[i]));
          if (str = 'PRENIADA') then
            str := 'PREÑADA';
          if (str='CABEZA') or (str='CUERPO') or (str='COLA') or (str='PREÑADA') then
            str:='PREÑADA';
          if (str='Vacia') then str := 'VACIA';
          if (CDSGrilla.FieldByName('V5').Value<>'TERNERA') and (str<>'') then
            CDSGrilla.FieldByName('V4').AsString:= str
          else
            CDSGrilla.FieldByName('V4').AsString:= 'NO DEFINIDO';
          try
          CDSGrilla.FieldByName('estado_reproductivo').AsInteger:=DBLCBAEstadoR.ListSource.DataSet.Lookup('NOMBRE',CDSGrilla.FieldByName('V4').AsString,'ID_ESTADO_REPRODUCTIVO');
          except
            raise exception.create('Estado Reproductivo invalido ' +  getDato('nombre',anim[i]));
          end;

end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralPeso(i:integer; var CDSGrilla: TIBDataSet);
var
  peso: String;
begin
	peso := getDato('peso',anim[i]);
	if (peso <> '') then
	begin
		if (peso > '0') then
		begin
			CDSGrilla.FieldByName('peso').Value := getDato('peso',anim[i])
		end
		else
		begin
			CDSGrilla.FieldByName('peso').Value := '0';
		end
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralCategoria(i, sexo:integer; categoriaAnimal: string; var CDSGrilla: TIBDataSet);
begin
  DMSoftvet.IBQCategAnimal.Active:=false;
  DMSoftvet.IBQCategAnimal.ParamByName('SEXO').AsInteger := sexo;
  DMSoftvet.IBQCategAnimal.Active:=true;

	str := categoriaAnimal;
  CDSGrilla.FieldByName('V5').Value:=str;
  
	if (DBLCBACategoria.ListSource.DataSet.Lookup('NOMBRE',CDSGrilla.FieldByName('V5').Value,'ID_CATEGORIA') <> null) then
	begin
		CDSGrilla.FieldByName('CATEGORIA').AsInteger:= DBLCBACategoria.ListSource.DataSet.Lookup('NOMBRE',CDSGrilla.FieldByName('V5').Value,'ID_CATEGORIA')
	end
	else
	begin
		CDSGrilla.FieldByName('CATEGORIA').AsInteger:= 0;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralColor(i:integer; var CDSGrilla: TIBDataSet);
var
	strA: string;
begin
	strA := getDato('color',anim[i]);
	if strA = '' then
	begin
		strA := getDato('tipo',anim[i]);
		if strA <> '' then
		begin
			if strA = 'ASTADO' then
				str := 'HEREFORD ASTADO'
			else
				str := 'HEREFORD POLLED';
		end
	end
	else
	begin
		if strA = 'COLORADO' then
		begin
			CDSGrilla.FieldByName('COLOR').Value := 2;
			CDSGrilla.FieldByName('NOMCOLOR').Text := 'COLORADO';
		end
		else
		begin
			CDSGrilla.FieldByName('COLOR').Value := 1;
			CDSGrilla.FieldByName('NOMCOLOR').Text := 'NEGRO';
		end;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralRaza(i:integer; var CDSGrilla: TIBDataSet; var BDBGGrilla: TBitDBGrid);
var
	str: string;
  indexRaza: integer;
begin
	if (str='ABERDEEN ANGUS') or (str='HEREFORD') or (str='BRANGUS') then
	begin
		cargarAnimalesGeneralColor(i, CDSGrilla);
	end;

	if str = 'CRUZA' then
	begin
		str := 'CRUZA CEBUINO';
	end;

	if str='' then
	begin
		str:='NN';
	end;

	str := getDato('raza',anim[i]);
	str := Uppercase(str);
	CDSGrilla.FieldByName('V6').Value:=str;

	if DBLCBARaza.ListSource.DataSet.Lookup('SINONIMO',str,'CODIGO')<>null then
	begin
		CDSGrilla.FieldByName('RAZA').AsInteger := DBLCBARaza.ListSource.DataSet.Lookup('SINONIMO',str,'ID_RAZA');
	end
	else
	begin
		if VarIsNull(DBLCBARaza.ListSource.DataSet.Lookup('CODIGO',str,'ID_RAZA')) then
		begin
			CDSGrilla.FieldByName('RAZA').AsInteger :=  0;
		end
		else
		begin
			indexRaza := DBLCBARaza.ListSource.DataSet.Lookup('CODIGO',str,'ID_RAZA');
			CDSGrilla.FieldByName('RAZA').AsInteger :=  indexRaza;
		end;
	end;
	
	CDSGrilla.FieldByName('V6').Value :=
					  DBLCBARaza.ListSource.DataSet.Lookup('ID_RAZA',
						  CDSGrilla.FieldByName('RAZA').AsInteger,'SINONIMO');

	CDSGrilla.FieldByName('SUBCATEGORIA').Value := 0;
	CDSGrilla.FieldByName('V14').AsString := 'NO DEFINIDO';
	CDSGrilla.FieldByName('INSPECCION').Value := null;
	CDSGrilla.FieldByName('V15').AsString := '';
	CDSGrilla.FieldByName('DESTINO_CAB').Value := null;
	CDSGrilla.FieldByName('V16').AsString := '';
	CDSGrilla.FieldByName('MOCHO').Value := null;
	CDSGrilla.FieldByName('V17').AsString := '';
	if CDSGrilla.FieldByName('RAZA').AsInteger in [2,3,5,10,11,12,25,28,29,30] then
	begin
		DMSoftvet.IBQSubCategoriaRaza.Close;
		DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := CDSGrilla.FieldByName('RAZA').AsInteger;
		DMSoftvet.IBQSubCategoriaRaza.Open;
		BDBGGrilla.Columns[5].Visible := true;
		if not (CDSGrilla.FieldByName('RAZA').AsInteger in [2,3,29]) then
		begin
			DMSoftvet.IBQMocho.Close;
			DMSoftvet.IBQMocho.ParamByName('raza').AsInteger := CDSGrilla.FieldByName('RAZA').AsInteger;
			DMSoftvet.IBQMocho.Open;
			BDBGGrilla.Columns[6].Visible := true;

			str := (getDato('mocho/astado',anim[i]));
			if str = '' then
				str := 'ND';
			
			if DMSoftvet.IBQMocho.Lookup('CODIGO',str,'NOMBRE') <> null then
				str := DMSoftvet.IBQMocho.Lookup('CODIGO',str,'NOMBRE');
			
			CDSGrilla.FieldByName('MOCHO').Value := DMSoftvet.IBQMocho.Lookup('nombre',str,'id_mocho');
			CDSGrilla.FieldByName('V17').AsString := str;
				  
			if CDSGrilla.FieldByName('RAZA').AsInteger <> 5 then
			begin
				BDBGGrilla.Columns[7].Visible := true;
				BDBGGrilla.Columns[8].Visible := true;

				str:=(getDato('inspección',anim[i]));
				if str = '' then
					str := 'ND';
				if DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE')<>null then
					str := DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE');
					
				CDSGrilla.FieldByName('INSPECCION').Value := DMSoftvet.IBQInspeccion.Lookup('nombre',str,'id_inspeccion');
				CDSGrilla.FieldByName('V15').AsString := str;

				str:=(getDato('destino',anim[i]));
				if str = '' then
					str := 'ND';
				
				if DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE')<>null then
					str := DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE');
				
				CDSGrilla.FieldByName('DESTINO_CAB').Value := DMSoftvet.IBQCodDestCabania.Lookup('nombre',str,'id_dest_cabania');
				CDSGrilla.FieldByName('V16').AsString := str;
			end;
		end;
		
		str:=(getDato('tipo de registro',anim[i]));
		if str = '' then
			str := 'ND';
			
			if DMSoftvet.IBQSubCategoriaRaza.Lookup('CODIGO',str,'NOMBRE')<>null then
				str := DMSoftvet.IBQSubCategoriaRaza.Lookup('CODIGO',str,'NOMBRE');
				
		CDSGrilla.FieldByName('SUBCATEGORIA').Value := DMSoftvet.IBQSubCategoriaRaza.Lookup('nombre',str,'id_subcategoria');
		CDSGrilla.FieldByName('V14').AsString := str;
	end;

	case CDSGrilla.FieldByName('RAZA').AsInteger of
	11 : 
		begin
			BDBGGrilla.Columns[16].Title.Caption := Traducir('ABA');
			BDBGGrilla.Columns[17].Title.Caption := Traducir('UBB');
			BDBGGrilla.Columns[16].Visible := true;
			BDBGGrilla.Columns[17].Visible := true;
			CDSGrilla.FieldByName('id_pc').AsString := getDato('aba',anim[i]);
			CDSGrilla.FieldByName('id_ra').AsString := getDato('ubb',anim[i]);
		end;
	2,3,29 : 
		begin
			BDBGGrilla.Columns[16].Title.Caption := Traducir('PC');
			BDBGGrilla.Columns[17].Title.Caption := Traducir('RA');
			BDBGGrilla.Columns[16].Visible := true;
			BDBGGrilla.Columns[17].Visible := false;
			CDSGrilla.FieldByName('id_pc').AsString := getDato('pc',anim[i]);
			CDSGrilla.FieldByName('id_ra').AsString := '';
		end;
	10: begin
			BDBGGrilla.Columns[16].Title.Caption := Traducir('RGB');
			BDBGGrilla.Columns[17].Title.Caption := Traducir('RA');
			BDBGGrilla.Columns[16].Visible := true;
			BDBGGrilla.Columns[17].Visible := false;
			CDSGrilla.FieldByName('id_pc').AsString := getDato('rgb',anim[i]);
			CDSGrilla.FieldByName('id_ra').AsString := '';
		end;
	12,28,30 : 
		begin
			BDBGGrilla.Columns[16].Title.Caption := Traducir('AAB');
			BDBGGrilla.Columns[17].Title.Caption := Traducir('RA');
			BDBGGrilla.Columns[16].Visible := true;
			BDBGGrilla.Columns[17].Visible := false;
			CDSGrilla.FieldByName('id_pc').AsString := getDato('aab',anim[i]);
			CDSGrilla.FieldByName('id_ra').AsString := '';
		end;
	else
		begin
			BDBGGrilla.Columns[16].Visible := false;
			BDBGGrilla.Columns[17].Visible := false;
			CDSGrilla.FieldByName('id_ra').AsString := '';
			CDSGrilla.FieldByName('id_pc').AsString := '';
		end;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralIdentificadores(aux_rp: string; i:integer; var CDSGrilla: TIBDataSet);
begin
	CDSGrilla.FieldByName('id_rp').AsString := getDato(aux_rp, anim[i]);
	CDSGrilla.FieldByName('id_ie').AsString := getDato('ie', anim[i]);
	CDSGrilla.FieldByName('id_senasa').AsString := getDato('senasa', anim[i]);
	CDSGrilla.FieldByName('id_hba').AsString := getDato('hba', anim[i]);
	CDSGrilla.FieldByName('id_animal').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];
	CDSGrilla.FieldByName('id_aux').AsInteger := CDSGrilla.FieldByName('id_animal').AsInteger;
	anim[i].id := CDSGrilla.FieldByName('id_animal').AsInteger;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralNombre(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=getDato('nombre',anim[i]);
	if str<>'' then
	begin
		CDSGrilla.FieldByName('nombre').AsString:=str;
	end	
	else
	begin
		CDSGrilla.FieldByName('nombre').AsString:=CDSGrilla.FieldByName('id_rp').AsString;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralCondicion(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=getDato('condición',anim[i]);
	if str<>'' then
	begin
		CDSGrilla.FieldByName('V2').Value:= str;
		CDSGrilla.FieldByName('condicion_corporal').Value:= DBLCBACondicionC.ListSource.DataSet.Lookup('escala',CDSGrilla.FieldByName('V2').Value,'ID_CONDICION_CORPORAL');
	end
	else
	begin
		CDSGrilla.FieldByName('condicion_corporal').Value:= null;
		CDSGrilla.FieldByName('V2').AsString:= '';
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralPotrero(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	DBLCBAPotrero.ListSource.DataSet.Close;
	DBLCBAPotrero.ListSource.DataSet.Open;
	str:=Uppercase(getDato('potrero',anim[i]));
	if (str='') or (DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',str,'ID_POTRERO')=null) then
	begin
		CDSGrilla.FieldByName('POTRERO').AsInteger := 0;
		CDSGrilla.FieldByName('V7').AsString := 'INDEFINIDO';
	end
	else
	begin
		CDSGrilla.FieldByName('POTRERO').AsInteger := DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',str,'ID_POTRERO');
		CDSGrilla.FieldByName('V7').AsString := str;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralDTA(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	CDSGrilla.FieldByName('DTA').AsString := (getDato('dta', anim[i]));;
	str:=getDato('cronología', anim[i]);
	
	if str='' then str:='NN';
	if DBLCBACronologiaD.ListSource.DataSet.Lookup('SINONIMO', str, 'CODIGO')<>null then
		str:=DBLCBACronologiaD.ListSource.DataSet.Lookup('SINONIMO', str, 'CODIGO');
		
	CDSGrilla.FieldByName('cronologia_dentaria').AsInteger:= DBLCBACronologiaD.ListSource.DataSet.Lookup('CODIGO',str,'ID_CRONOLOGIA_DENTARIA');
	CDSGrilla.FieldByName('V3').AsString:= DBLCBACronologiaD.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE');
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralFechaNac(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
  edad: integer;
  fecha: TDate;
begin
	str:=getDato('fecha n',anim[i]);
	
	if str<>'' then
	begin
		CDSGrilla.FieldByName('fecha_nacimiento').AsDateTime:= StrToDateTime(str)
	end
	else
	begin
		edad := completarEdadCD(CDSGrilla.FieldByName('cronologia_dentaria').AsInteger);
		fecha := incMonth(strtodatetime(getDato('fecha',anim[i])),-edad);
		if edad<>0 then
			begin
				CDSGrilla.FieldByName('fecha_nacimiento').AsDateTime:= fecha;
			end	
		else
		begin
			//si no existe, cargar la categoria en un stringlist que luego se pasa como parametro al
			//cartel de las edades por defecto
			CDSGrilla.FieldByName('fecha_nacimiento').AsString:='';
			if listaCats.IndexOf(CDSGrilla.FieldByName('V5').AsString)=-1 then
			begin
				listaCats.Add(CDSGrilla.FieldByName('V5').AsString);
			end
		end;
	end;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralSexo(i, sexo:integer; var CDSGrilla: TIBDataSet);
begin
	
	DMSoftvet.IBQCategAnimal.Active:=false;
	DMSoftvet.IBQCategAnimal.ParamByName('SEXO').AsInteger := sexo;
	DMSoftvet.IBQCategAnimal.Active:=true;
	
	CDSGrilla.FieldByName('SEXO').Value :=sexo;	
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralRodeo(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=UpperCase(getDato('rodeo',anim[i]));
	
	if DBLCBARodeo.ListSource.DataSet.Lookup('NOMBRE',str,'ID_RODEO')<>null then
	begin
		CDSGrilla.FieldByName('V8').AsString := str;
	end
	else
	begin
		CDSGrilla.FieldByName('V8').AsString := 'INDEFINIDO';
	end;
	
	CDSGrilla.FieldByName('RODEO').AsInteger := DBLCBARodeo.ListSource.DataSet.Lookup('NOMBRE',CDSGrilla.FieldByName('V8').AsString,'ID_RODEO');

	CDSGrilla.FieldByName('VUno1').AsString := 'G';
	CDSGrilla.FieldByName('V9').AsString := 'GENERAL';
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralActividad(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str := getDato('actividad',anim[i]);
	if str='' then 
	begin
		str:='NO DEFINIDA';
	end;
	
	CDSGrilla.FieldByName('V10').AsString := str;
	CDSGrilla.FieldByName('ACTIVIDAD').Value := DBLCBAActividad.ListSource.DataSet.Lookup('SINONIMO',CDSGrilla.FieldByName('V10').AsString,'ID_ACTIVIDAD');
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralTipoAlta(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=getDato('tipo alta',anim[i]);
	if str='' then 
	begin
		str:='CESIÓN DE ALTA';
	end;
	
	CDSGrilla.FieldByName('TIPO_ALTA').AsInteger := DBLCBAtipoAlta.ListSource.DataSet.Lookup('nombre',str,'id_tipo_alta');
	CDSGrilla.FieldByName('FECHA_ALTA').AsDateTime := strtodatetime(getDato('fecha',anim[i]));
	CDSGrilla.FieldByName('OBSERVACION').AsString := getDato('observación',anim[i]);
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralResponsable(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin
	str:=uppercase(getDato('responsable',anim[i]));

	if DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',str,'ID_EMPLEADO')<>null then
	begin
		CDSGrilla.FieldByName('RESPONSABLE').Value := DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',str,'ID_EMPLEADO')
	end
	else
	begin
		CDSGrilla.FieldByName('RESPONSABLE').Value := 0;
	end
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralPrecio(i:integer; var CDSGrilla: TIBDataSet);
var
	f: double;
begin
	trystrtofloat(getDato('precio u',anim[i]),f);
	
	CDSGrilla.FieldByName('PRECIO_UNITARIO').asFloat := f;
	trystrtofloat(getDato('precio b',anim[i]), f);
	CDSGrilla.FieldByName('PRECIO_BRUTO').asFloat := f;
	trystrtofloat(getDato('gastos', anim[i]),f);
	CDSGrilla.FieldByName('GASTOS').asFloat := f;
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralVarios(i:integer; var CDSGrilla: TIBDataSet);
begin
	CDSGrilla.FieldByName('APODO').AsString:=getDato('apodo',anim[i]);
	CDSGrilla.FieldByName('ID_OTRO').AsString:=getDato('otro',anim[i]);
	CDSGrilla.FieldByName('ADN').AsString:=getDato('adn',anim[i]);
	CDSGrilla.FieldByName('TIPIFICACION_SANGUINEA').AsString:=getDato('tipificación sanguínea',anim[i]);
end;

procedure TFEveAltaMasiva.cargarAnimalesGeneralOrigen(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin			  
	str:=getDato('orígen',anim[i]);
	if DMSoftvet.IBQCodOrigen.Lookup('SINONIMO',str,'ID_ORIGEN')<>null then
	begin 
		CDSGrilla.FieldByName('V11').Value:=str
	end
	else
	begin
		CDSGrilla.FieldByName('V11').Value:='NO DEFINIDO';
	end;
	CDSGrilla.FieldByName('ORIGEN_ANIMAL').Value:=DMSoftvet.IBQCodOrigen.Lookup('SINONIMO',CDSGrilla.FieldByName('V11').Value,'ID_ORIGEN');
end;
			  
procedure TFEveAltaMasiva.cargarAnimalesGeneralCriador(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin			  
	str:=getDato('criador',anim[i]);
	if DMSoftvet.IBQCodCriador.Lookup('SINONIMO',str,'ID_CRIADOR')<>null then
	begin
		CDSGrilla.FieldByName('V12').Value:=str
	end
	else
	begin
		CDSGrilla.FieldByName('V12').Value:='NO DEFINIDO';
	end;
	CDSGrilla.FieldByName('CRIADOR').Value:=DMSoftvet.IBQCodCriador.Lookup('SINONIMO',CDSGrilla.FieldByName('V12').Value,'ID_CRIADOR');
end;
			  
procedure TFEveAltaMasiva.cargarAnimalesGeneralPropietario(i:integer; var CDSGrilla: TIBDataSet);
var
	str: string;
begin			  
	str:=getDato('propietario',anim[i]);
	if DMSoftvet.IBQCodPropietario.Lookup('SINONIMO',str,'ID_PROPIETARIO')<>null then
	begin
		CDSGrilla.FieldByName('V13').Value:=str;
	end
	else
	begin
		CDSGrilla.FieldByName('V13').Value:='NO DEFINIDO';
	end;
	CDSGrilla.FieldByName('PROPIETARIO').Value:=DMSoftvet.IBQCodPropietario.Lookup('SINONIMO',CDSGrilla.FieldByName('V13').Value,'ID_PROPIETARIO');
end;

{
Esta parte carga los datos generales, que no tienen que ver con el sexo
del animal
 }
procedure TFEveAltaMasiva.cargarAnimalesGeneral(i, sexo:integer; aux_rp, categoriaAnimal: string; var CDSGrilla: TIBDataSet; var BDBGGrilla: TBitDBGrid);
var
  strA: String;
  edad, nroRepe: integer;
  fecha: TDate;
begin

	IBQGenIDAnimal.Close;
	IBQGenIDAnimal.Open;

	CDSGrilla.Insert;

	cargarAnimalesGeneralIdentificadores(aux_rp, i, CDSGrilla);
	cargarAnimalesGeneralSexo(i, sexo, CDSGrilla);
	cargarAnimalesGeneralPeso(i, CDSGrilla);
	cargarAnimalesGeneralCategoria(i, sexo, categoriaAnimal, CDSGrilla);
	cargarAnimalesGeneralRaza(i, CDSGrilla, BDBGGrilla);
	cargarAnimalesGeneralNombre(i, CDSGrilla);
	cargarAnimalesGeneralCondicion(i, CDSGrilla);
	cargarAnimalesGeneralPotrero(i, CDSGrilla);
	cargarAnimalesGeneralDTA(i, CDSGrilla);
	cargarAnimalesGeneralFechaNac(i, CDSGrilla);
	cargarAnimalesGeneralRodeo(i, CDSGrilla);
	cargarAnimalesGeneralActividad(i, CDSGrilla);
	cargarAnimalesGeneralTipoAlta(i, CDSGrilla);
	cargarAnimalesGeneralResponsable(i, CDSGrilla);
	cargarAnimalesGeneralPrecio(i, CDSGrilla);
	cargarAnimalesGeneralVarios(i, CDSGrilla);

	cargarAnimalesGeneralOrigen(i, CDSGrilla);
	cargarAnimalesGeneralCriador(i, CDSGrilla);
	cargarAnimalesGeneralPropietario(i, CDSGrilla);

	cargarPadres(CDSGrilla,i);

	str := CDSGrilla.FieldByName('id_rp').AsString;
	nroRepe := buscarRepetidos(str,'id_rp');
	if (nroRepe>=1) then
	begin
		CDSGrilla.FieldByName('ew').AsString := 'W';
		MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'RP' ) +' = '+str);
	end
	else
	begin
		CDSGrilla.FieldByName('ew').AsString := ' ';
	end;

	str := CDSGrilla.FieldByName('id_ie').AsString;
	if str<>'' then
	begin
		nroRepe := buscarRepetidos(str,'ID_IE');
		if (nroRepe>=1) then
		begin
			CDSGrilla.FieldByName('ew').AsString := 'E';
			MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'IE' ) +' = '+str+Traducir('. Por favor verifique el error'));
		end
		else
		begin
			CDSGrilla.FieldByName('ew').AsString := ' ';
		end;
	end;
end;

procedure TFEveAltaMasiva.cargarNuevos(i:integer);
var edad :integer;
    fecha: TDate;
    str, strA, rp, aux_circ, col, categoriaAnimal :string;
    f:double;
    nroRepe:integer;
    bool1,bool2,bool3:boolean;
    abm:TFABMPadresExternos;
    intAux:integer;
    aux_rp: String;
    indexRaza,j,cant: integer;
    strFecha: String;
begin
	inherited;
  if (Owner is TFMensajeNuevos) then
    if (Owner as TFMensajeNuevos).evento = 49 then
      begin
      aux_rp := 'rp (madre evento)';
      if (getDato(aux_rp,anim[i])='') then
        aux_rp:= 'caravana';
      end
    else
      aux_rp := 'rp'
  else
    aux_rp := 'rp';

  FAvanceTerminar.Pos:=FAvanceTerminar.Pos+1;
  Application.ProcessMessages();
  if (anim[i].id=-1) or ((anim[i].id<>-1000)and(FImportacion.Owner is TFEveAltamasiva)) then
  begin
	  dtpafechaalta.DateTime:=strtodatetime(getDato('fecha',anim[i]));
	  // Leo la categoria del animal
	  categoriaAnimal := UpperCase(getDato('categoría',anim[i]));
	 // El dato puede venir con otro nombre
	  if DBLCBACategoria.ListSource.DataSet.Lookup('CODIGO',categoriaAnimal,'NOMBRE')<>null then
    begin
		  categoriaAnimal:=DBLCBACategoria.ListSource.DataSet.Lookup('CODIGO',categoriaAnimal,'NOMBRE');
    end;

	  // Visibiliza las razas a medida que se usan (super lento !!)
	  try
		  IBQActivarRaza.Close;
		  IBQActivarRaza.ParamByName('raza').AsString := str;
		  IBQActivarRaza.Open;
		  FPrincipal.IBTPrincipal.CommitRetaining;
		  DBLCBARaza.ListSource.DataSet.Close;
		  DBLCBARaza.ListSource.DataSet.Open;
	  except
		  FPrincipal.IBTPrincipal.RollbackRetaining;
	  end;

	  DMSoftvet.IBQRodeo.Close;
	  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual; //obtiene los rodeos del establecimiento
	  DMSoftvet.IBQRodeo.Open;

	  DBLCBARodeo.ListSource.DataSet.Close;
	  DBLCBARodeo.ListSource.DataSet.Open;

	  // Verifico si es Macho
	  if (categoriaAnimal='TERNERO') or
		 (categoriaAnimal='NOVILLO') or
		 (categoriaAnimal='TORO') then
	  begin  //ciclo de machos
		 cargarAnimalesGeneral(i, 1, aux_rp, categoriaAnimal,
							  CDSGrillaMachos, BDBGGrillaMachos);
		 cargarMachosNuevos(i, CDSGrillaMachos);
	  end
	  else
	  begin //ciclo de Hembras
		 cargarAnimalesGeneral(i, 2, aux_rp, categoriaAnimal,
							  CDSGrillaHembras, BDBGGrillaHembras);
		  cargarHembrasNuevas(i, CDSGrillaHembras);
	  end ;
  end;
end;

{#1 INICIO 02/12/2014 Matias Rizzi}
procedure TFEveAltaMasiva.BBXlsImportClick(Sender: TObject);
  var archivo_Importacion_orig: string;
    i,ww: integer;
begin
   inherited;
   try
      begin
      identRp := True;
      if ODExcel.Execute then
        begin
          archivo_Importacion_orig := ODExcel.FileName;
          archivo_Importacion := StringReplace(archivo_Importacion_orig,ExtractFileExt(archivo_Importacion_orig),'',[rfReplaceAll]);
          archivo_Importacion := archivo_Importacion+'_imp_.xls';
          CopyFile(PChar(archivo_Importacion_orig), PChar(archivo_Importacion), false);
        end;
        //
        tipoEv := self.LTitulo.Caption;
        abrirArchivo(self,archivo_Importacion);
         //    for ww:=0  to length(anim) - 1 do
      //ShowMessage('hijo:'+getDato('rp',anim[ww]) +  ' madre:' +getDato('rp madre biológica',anim[ww]));
        JvECantidad.Text := IntToStr(length(anim));
        importar;
        FPrincipal.IBTPrincipal.CommitRetaining;
        //
      end;
      //
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
      abort;
      {PCBasico.ActivePage:=TSHDatos;}
    end;

end;
{#1 FIN 02/12/2014 Matias Rizzi}

procedure TFEveAltaMasiva.PCGrillasChange(Sender: TObject);
begin
  inherited;

  if PCGrillas.ActivePage=TSHembras then
  begin
      {CDSAnimales.Close;
      CDSAnimales.Filter:='SEXO = 2';
      CDSAnimales.FilterOptions:=[foNoPartialCompare,foCaseInsensitive];
      CDSAnimales.Filtered:=true;
      CDSAnimales.Open; }
      SBSelTodos.Down := ((BDBGGrillaHembras.SelectedRows.Count=BDBGGrillaHembras.DataSource.DataSet.RecordCount) {and (BDBGGrillaHembras.DataSource.DataSet.RecordCount>0)});
      if(BDBGGrillaHembras.SelectedRows.Count = 1) then
        ASacarAnimal.Caption := Traducir('Sacar Animal')
      else
        if(BDBGGrillaHembras.SelectedRows.Count > 1) then
          ASacarAnimal.Caption := Traducir('Sacar Animales');

      ASacarAnimal.Enabled := BDBGGrillaHembras.SelectedRows.Count > 0;
      SBSelTodos.Down := BDBGGrillaHembras.SelectedRows.Count=BDBGGrillaHembras.RowCount;
  end
  else
  begin
      {CDSAnimales.Close;
      CDSAnimales.Filter:='SEXO = 1';
      CDSAnimales.FilterOptions:=[foNoPartialCompare,foCaseInsensitive];
      CDSAnimales.Filtered:=true;
      CDSAnimales.Open;}
      SBSelTodos.Down := (BDBGGrillaMachos.SelectedRows.Count=BDBGGrillaMachos.DataSource.DataSet.RecordCount) {and (BDBGGrillaMachos.DataSource.DataSet.RecordCount>0))};
      if(BDBGGrillaMachos.SelectedRows.Count = 1) then
        ASacarAnimal.Caption := Traducir('Sacar Animal')
      else
        if(BDBGGrillaMachos.SelectedRows.Count > 1) then
          ASacarAnimal.Caption := Traducir('Sacar Animales');
        
      ASacarAnimal.Enabled := BDBGGrillaMachos.SelectedRows.Count > 0;
      SBSelTodos.Down := BDBGGrillaMachos.SelectedRows.Count=BDBGGrillaMachos.RowCount;
  end;

  //NICO LoadSQLStringList;
end;

function TFEveAltaMasiva.diagnostico:boolean;  //devuelve true si existen vaquillonas o vacas
begin
  diagnostico:=false;
  if not CDSAnimales.IsEmpty then
     if (CDSAnimales.Lookup('categoria',5,'categoria')<>null) or (CDSAnimales.Lookup('categoria',6,'categoria')<>null) then
        diagnostico:=true;
end;

function TFEveAltaMasiva.revisacionToros : boolean;
begin
  result := false;
  if not CDSAnimales.IsEmpty then
     if CDSAnimales.Lookup('categoria',3,'categoria')<>null then
        result:=true;
end;

//********************************************************//
//	INCIDENCIA: 401									                      //
//	INICIO Función para determinar si se declara en AFIP. //
//	Carla Gareis							              28/11/2014    //
//********************************************************//
function TFEveAltaMasiva.informarAfip : boolean;
begin
  result := false;
    if (CBInformadoAfip.Text = 'SI') then
      result := true
    else result := false;
end;
//********************************************************//
//	INCIDENCIA: 401									                      //
//	FIN Función para determinar si se declara en AFIP.    //
//	Carla Gareis							              28/11/2014    //
//********************************************************//

procedure TFEveAltaMasiva.BAgregarAnimalClick(Sender: TObject);
begin
  inherited;
  EACantidad.EsRequerido := true;
  agregar := true;

  JvECantidad.Text := '';
  EACantidad.Text := '';

  PCBasico.ActivePage:=TSHDatos;
  PCBasicoChange(self);

  if (identifica) then
  begin
      RedibujarAuxiliar;
      //ResetearComponentes(GBDatosAlta);
      ResetearComponentes(GBIdentificar);
      //ResetearComponentes(GBDatosRaza);
      //ResetearComponentes(GBDatosUbicacion);
      //ResetearComponentes(GBDatosGenerales);
      //ResetearComponentes(GBDatosExtra);
      //ResetearComponentes(GBDatosParticulares);
      ResetearComponentes(GBDatosVarios);
      ResetearComponentes(GBDatosEcono);
  end
  else
  begin
      RBRp.Checked := true;
      EARpInicial.Text := 'N/N';
      EARpInicialChange(EARpInicial);
  end;

end;

procedure TFEveAltaMasiva.BDBGKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;

   case Key of
    VK_UP    : begin
                  if (regActual > 1) then
                  begin
                      if (PCGrillas.ActivePage = TSHembras) then
                      begin
                          regAnt := BDBGGrillaHembras.DataSource.DataSet.RecNo;
                          regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo - 1;
                      end
                      else
                      begin
                          regAnt := BDBGGrillaMachos.DataSource.DataSet.RecNo;
                          regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo - 1;
                      end;

                      IBarraHorIzq.Top := GetPosicionPanel(regActual);
                      IBarraHorDer.Top := GetPosicionPanel(regActual);
                  end;
               end;

    VK_LEFT  : begin
                    if (PCGrillas.ActivePage = TSHembras) then
                    begin
                        if ((regActual <> BDBGGrillaHembras.DataSource.DataSet.RecNo)) then
                        begin
                          regAnt := BDBGGrillaHembras.DataSource.DataSet.RecNo;
                          regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo - 1;

                          IBarraHorIzq.Top := GetPosicionPanel(regActual);
                          IBarraHorDer.Top := GetPosicionPanel(regActual);
                        end;
                    end
                    else
                    begin
                        if ((regActual <> BDBGGrillaMachos.DataSource.DataSet.RecNo)) then
                        begin
                          regAnt := BDBGGrillaMachos.DataSource.DataSet.RecNo;
                          regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo - 1;

                          IBarraHorIzq.Top := GetPosicionPanel(regActual);
                          IBarraHorDer.Top := GetPosicionPanel(regActual);
                        end;
                    end;
               end;

    VK_RIGHT : begin
                    if (PCGrillas.ActivePage = TSHembras) then
                    begin
                        if ((regActual <> BDBGGrillaHembras.DataSource.DataSet.RecNo)) then
                        begin
                          regAnt := BDBGGrillaHembras.DataSource.DataSet.RecNo;
                          regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo + 1;

                          IBarraHorIzq.Top := GetPosicionPanel(regActual);
                          IBarraHorDer.Top := GetPosicionPanel(regActual);
                        end;
                    end
                    else
                    begin
                        if ((regActual <> BDBGGrillaMachos.DataSource.DataSet.RecNo)) then
                        begin
                          regAnt := BDBGGrillaMachos.DataSource.DataSet.RecNo;
                          regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo + 1;

                          IBarraHorIzq.Top := GetPosicionPanel(regActual);
                          IBarraHorDer.Top := GetPosicionPanel(regActual);
                        end;
                    end;
               end;

    VK_DOWN  : begin
                    if (regActual < SBBarrita.Max) then
                    begin
                      if (PCGrillas.ActivePage = TSHembras) then
                      begin
                          regAnt := BDBGGrillaHembras.DataSource.DataSet.RecNo;
                          regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo + 1;
                      end
                      else
                      begin
                          regAnt := BDBGGrillaMachos.DataSource.DataSet.RecNo;
                          regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo + 1;
                      end;

                      IBarraHorIzq.Top := GetPosicionPanel(regActual);
                      IBarraHorDer.Top := GetPosicionPanel(regActual);
                    end;
               end;
  end;

  apretado:=false;
  if Key in [VK_SHIFT] then
  begin
    if PCGrillas.ActivePage=TSHembras then
      ind:= BDBGGrillaHembras.DataSource.DataSet.RecNo
    else
      ind:= BDBGGrillaMachos.DataSource.DataSet.RecNo;

    apretado:=true;
  end;
end;

procedure TFEveAltaMasiva.BDBGKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key in [VK_SHIFT] then
    begin
    ind:=0;
    apretado:=false;
    end;
end;

procedure TFEveAltaMasiva.SBSelTodosClick(Sender: TObject);
begin
 inherited;
 SBSelTodos.Down := not SBSelTodos.Down;
 if PCGrillas.ActivePage=TSHembras then
  begin
  if SBSelTodos.Down then
    begin
    BDBGGrillaHembras.Hide;
    BDBGGrillaHembras.DataSource.DataSet.First;
    while not BDBGGrillaHembras.DataSource.DataSet.Eof do
      begin
      BDBGGrillaHembras.SelectedRows.CurrentRowSelected:=true;
      BDBGGrillaHembras.DataSource.DataSet.Next;
      end;
    SBSelTodos.Hint:= Traducir('Deseleccionar Todos');
    BDBGGrillaHembras.Show;
    end
  else
    begin
    BDBGGrillaHembras.SelectedRows.Clear;
    SBSelTodos.Hint:= Traducir('Seleccionar Todos');
    end;
  if(BDBGGrillaHembras.SelectedRows.Count = 1) then
    ASacarAnimal.Caption:= Traducir('Sacar Animal')
  else
    if(BDBGGrillaHembras.SelectedRows.Count > 1) then
      ASacarAnimal.Caption:= Traducir('Sacar Animales');

  ASacarAnimal.Enabled := BDBGGrillaHembras.SelectedRows.Count > 0;
  end
 else
  begin
  if SBSelTodos.Down then
    begin
    BDBGGrillaMachos.Hide;
    BDBGGrillaMachos.DataSource.DataSet.First;
    while not BDBGGrillaMachos.DataSource.DataSet.Eof do
      begin
      BDBGGrillaMachos.SelectedRows.CurrentRowSelected:=true;
      BDBGGrillaMachos.DataSource.DataSet.Next;
      end;
    SBSelTodos.Hint:= Traducir('Deseleccionar Todos');
    BDBGGrillaMachos.Show;
    end
  else
    begin
    BDBGGrillaMachos.SelectedRows.Clear;
    SBSelTodos.Hint:=Traducir('Seleccionar Todos');
    end;
  if(BDBGGrillaMachos.SelectedRows.Count = 1) then
    ASacarAnimal.Caption:= Traducir('Sacar Animal')
  else
    if(BDBGGrillaMachos.SelectedRows.Count > 1) then
      ASacarAnimal.Caption:= Traducir('Sacar Animales');

  ASacarAnimal.Enabled := BDBGGrillaMachos.SelectedRows.Count > 0;
 end;
end;

procedure TFEveAltaMasiva.GetEvent(Sender : TObject);
begin
  if not ExistComponent(Sender as TComponent) and ((CDSGrillaHembras.RecordCount>0) or (CDSGrillaMachos.RecordCount>0)){and PasoGrilla} then
  begin
    Inc(CantComps);
    SetLength(ArrComponents,CantComps);
    ArrComponents[CantComps-1] := Sender as TComponent;
  end;
end;

procedure TFEveAltaMasiva.RealizarCambio(Component : TComponent;CamposBD : array of TField;
  ValoresCamposBD : array of Variant);
var
  I : Integer;
  s:string;
begin
  if Length(ValoresCamposBD) = Length(CamposBD) then
  begin
    if RegistroCambio(Component) then
      for I := 0 to Length(CamposBD)-1 do
      begin
          try
            begin


            CamposBD[I].Value := ValoresCamposBD[I];



            end;
          except
          end;
      end;
  end
  else
    raise Exception.Create('La cantidad de elementos de CamposBD debe ser igual a la de ValoresCamposBD');
end;

function TFEveAltaMasiva.RegistroCambio(Component : TComponent) : Boolean;
var
  Indice : Integer;
  Resultado : Boolean;
begin
  Resultado := false;
  if (((CDSGrillaHembras.RecordCount>0) or (CDSGrillaMachos.RecordCount>0)) and (Component <> nil)) then
  begin
    for Indice := 0 to Length(ArrComponents)-1 do
      if Component.Name = ArrComponents[Indice].Name then
      begin
        Resultado := true;
        break;
      end;
  end
  else
    Resultado := true;
  Result := Resultado;
end;

function TFEveAltaMasiva.ExistComponent(Component : TComponent) : Boolean;
var
  resultado : boolean;
  I : integer;
begin
  resultado := false;
  for I := 0 to Length(ArrComponents)-1 do
    if Component.Name = ArrComponents[I].Name then
    begin
      resultado := true;
      break;
    end;
  Result := resultado;
end;

procedure TFEveAltaMasiva.PCBasicoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if PCBasico.ActivePage=TSHObservacion then
    if PCGrillas.ActivePage=TSMachos then
      begin
      CBSexo.ItemIndex:=0;
      {if BDBGGrillaMachos.SelectedRows.Count<=1 then  //si tengo un solo animal seleccionado o ninguno me selecciona todos y me cambia todos en el cambiarGrilla
        begin
        SBSelTodos.Down:=true;
        SBSelTodosClick(self);
        end;}
      end
    else
      begin
      CBSexo.ItemIndex:=1;
      {if BDBGGrillaHembras.SelectedRows.Count<=1 then
        begin
        SBSelTodos.Down:=true;
        SBSelTodosClick(self);
        end;}
      end;

  if PCBasico.ActivePage=TSHDatos then
    begin
    if (CBSexo.ItemIndex=0) and (not CDSGrillaMachos.IsEmpty) then
      PCGrillas.ActivePage:=TSMachos
    else if (CBSexo.ItemIndex=1) and (not CDSGrillaHembras.IsEmpty) then
      PCGrillas.ActivePage:=TSHembras;
    end;
end;

procedure TFEveAltaMasiva.cambiarGrilla;
var edad,i:integer;
    fecha:TDate;
begin
  //*/*/*/

   FAvanceTerminar := TFAvanceTerminar.Create(self);
   FAvanceTerminar.Pos := 1;
   FAvanceTerminar.Max := CDSGrillaHembras.RecordCount+CDSGrillaMachos.RecordCount;
   FAvanceTerminar.Modo := maDetalle;
   FAvanceTerminar.Update;

  //*/*/

  if (not CDSGrillaMachos.IsEmpty) and (PCGrillas.ActivePage=TSMachos) then
    begin

      CDSGrillaMachos.First;
      //SETEO IDENT
        if ((EARpInicial.text <> '') and (EARpInicial.Text <> 'N/N') and (identRp)) then
          i := strtoint(EARpInicial.text);
        IdentCUIG := EAUltimoIdent.Text;
        IdentReidentificacion:= EAUltimoIdentReidentificacion.Text;
      //FIN SETEO

      while not CDSGrillaMachos.Eof do
        begin
          if BDBGGrillaMachos.SelectedRows.CurrentRowSelected then
            begin
              CDSGrillaMachos.Edit;
              //inicio IDENTIFICADORES
                if identRp then
                  begin
                    CDSGrillaMachos.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarRP(i) + EASufijo.Text;
                      if ( (not identCUIGSenasa) or (not identReidentSenasa) ) then
                        CDSGrillaMachos.FieldByName('id_senasa').asString := '';
                      if not identElectronica then
                        CDSGrillaMachos.FieldByName('id_ie').asString := '';
                  end;
                if identCUIGSenasa then
                  begin
                    CDSGrillaMachos.FieldByName('id_senasa').AsString := EAEncabezado.Text + IdentCUIG;;
                    if not identRp then
                      CDSGrillaMachos.FieldByName('id_rp').AsString := EAEncabezado.Text + IdentCUIG;;
                    IdentCUIG := UFunctions.IncrementarIdentificadorCUIG(IdentCUIG);
                  end;
                if identElectronica then
                  begin
                    CDSGrillaMachos.FieldByName('id_rp').AsString := Equivalencias[i].RP;
                    CDSGrillaMachos.FieldByName('id_ie').AsString := Equivalencias[i].IE;
                  end;
                if identReidentSenasa then
                  begin
                    CDSGrillaMachos.FieldByName('id_senasa').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
                    if not identRp then
                      CDSGrillaMachos.FieldByName('id_rp').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
                    IdentReidentificacion := UFunctions.IncrementarIdentificadorCUIG(IdentReidentificacion);
                  end;
              //fin IDENTIFICADORES
              i := i + 1;
              CDSGrillaMachos.FieldByName('PESO').Value := FormatFloat('00.00',EAPeso.GetDato);
              RealizarCambio(DBLCBACondicionC,[CDSGrillaMachos.FieldByName('condicion_corporal'),CDSGrillaMachos.FieldByName('V2')],[DBLCBACondicionC.KeyValue,DBLCBACondicionC.Text]);
              RealizarCambio(DBLCBACategoria,[CDSGrillaMachos.FieldByName('categoria'),CDSGrillaMachos.FieldByName('V5')],[DBLCBACategoria.KeyValue,DBLCBACategoria.Text]);
              CDSGrillaMachos.FieldByName('DTA').Value := EADta.Text;
              RealizarCambio(DBLCBACronologiaD,[CDSGrillaMachos.FieldByName('cronologia_dentaria'),CDSGrillaMachos.FieldByName('V3')],[DBLCBACronologiaD.KeyValue,DBLCBACronologiaD.Text]);
              //cuando cambia la fecha de alta se calcula la edad con esto
              edad := monthsbetween(CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime,CDSGrillaMachos.FieldByName('fecha_nacimiento').AsDateTime);
              RealizarCambio(DTPAFechaAlta,[CDSGrillaMachos.FieldByName('FECHA_ALTA')],[DTPAFechaAlta.DateTime]);
              fecha := incMonth(CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime,-edad);
              CDSGrillaMachos.FieldByName('fecha_nacimiento').AsDateTime:= fecha;
              //cuando cambia la edad, se calcula con esto
              edad := StrToInt(JvEEdad.text);
              fecha := incMonth(CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime,-edad);
              RealizarCambio(JvEEdad,[CDSGrillaMachos.FieldByName('fecha_nacimiento')],[fecha]);
              if (EACircunferenciaEscrotal.Text <> '') then
                CDSGrillaMachos.FieldByName('circunferencia_escrotal').Value := StrToFloat(EACircunferenciaEscrotal.Text);
              RealizarCambio(DBLCBARaza,[CDSGrillaMachos.FieldByName('raza'),CDSGrillaMachos.FieldByName('V6')],[DBLCBARaza.KeyValue,DBLCBARaza.Text]);
              RealizarCambio(DBLCBARodeo,[CDSGrillaMachos.FieldByName('RODEO'),CDSGrillaMachos.FieldByName('V8')],[DBLCBARodeo.KeyValue,DBLCBARodeo.Text]);
              RealizarCambio(DBLCBATiposPeso,[CDSGrillaMachos.FieldByName('VUno1'),CDSGrillaMachos.FieldByName('V9')],[DBLCBATiposPeso.KeyValue,DBLCBATiposPeso.Text]);
              RealizarCambio(DBLCBAPotrero,[CDSGrillaMachos.FieldByName('POTRERO'),CDSGrillaMachos.FieldByName('V7')],[DBLCBAPotrero.KeyValue,DBLCBAPotrero.Text]);
              RealizarCambio(DBLCBAtipoAlta,[CDSGrillaMachos.FieldByName('TIPO_ALTA')],[DBLCBAtipoAlta.ListSource.DataSet.Lookup('NOMBRE',DBLCBAtipoAlta.Text,'ID_TIPO_ALTA')]);
              RealizarCambio(MAObservacion,[CDSGrillaMachos.FieldByName('OBSERVACION')],[MAObservacion.Text]);
              RealizarCambio(DBLCBAResponsable,[CDSGrillaMachos.FieldByName('RESPONSABLE')],[DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',DBLCBAResponsable.Text,'ID_EMPLEADO')]);
              RealizarCambio(DBLCBAActividad,[CDSGrillaMachos.FieldByName('ACTIVIDAD'),CDSGrillaMachos.FieldByName('V10')],[DBLCBAActividad.KeyValue,DBLCBAActividad.Text]);
              RealizarCambio(DBLCBAColor,[CDSGrillaMachos.FieldByName('COLOR'),CDSGrillaMachos.FieldByName('NOMCOLOR')],[DBLCBAColor.KeyValue,DBLCBAColor.Text]);
              RealizarCambio(DBLCBASubCategoria,[CDSGrillaMachos.FieldByName('SUBCATEGORIA'),CDSGrillaMachos.FieldByName('V14')],[DBLCBASubCategoria.KeyValue,DBLCBASubCategoria.Text]);
              if (CBCastrado.Checked) then
                CDSGrillaMachos.FieldByName('VUNO2').Value:=1
              else
                CDSGrillaMachos.FieldByName('VUNO2').Value:=0;
              if (EAValortotal.Text <> '')and(EACantidad.text<>'') then
                RealizarCambio(EAValortotal,[CDSGrillaMachos.FieldByName('PRECIO_UNITARIO')],[StrToFloat(EAValortotal.Text)/StrToInt(EACantidad.text)])
              else
                RealizarCambio(EAValortotal,[CDSGrillaMachos.FieldByName('PRECIO_UNITARIO')],[0]);
              if(CDSGrillaMachos.FieldByName('peso').Value <> null) and (CDSGrillaMachos.FieldByName('peso').Value<>0) then
                CDSGrillaMachos.FieldByName('PRECIO_BRUTO').AsFloat := (CDSGrillaMachos.FieldByName('PRECIO_UNITARIO').AsFloat)/CDSGrillaMachos.FieldByName('peso').Value
              else
                CDSGrillaMachos.FieldByName('PRECIO_BRUTO').AsFloat := 0;
              if (EAValorNeto.Text <> '')and(EACantidad.text<>'') then
                RealizarCambio(EAValorNeto,[CDSGrillaMachos.FieldByName('GASTOS')],[StrToFloat(EAValorNeto.Text)/StrToInt(EACantidad.text)])
              else
                RealizarCambio(EAValorNeto,[CDSGrillaMachos.FieldByName('GASTOS')],[0]);
              RealizarCambio(DBLCBAOrigen,[CDSGrillaMachos.FieldByName('ORIGEN_ANIMAL'),CDSGrillaMachos.FieldByName('V11')],[DBLCBAOrigen.KeyValue,DBLCBAOrigen.Text]);
              RealizarCambio(DBLCBACriador,[CDSGrillaMachos.FieldByName('CRIADOR'),CDSGrillaMachos.FieldByName('V12')],[DBLCBACriador.KeyValue,DBLCBACriador.Text]);
              RealizarCambio(DBLCBAPropietario,[CDSGrillaMachos.FieldByName('PROPIETARIO'),CDSGrillaMachos.FieldByName('V13')],[DBLCBAPropietario.KeyValue,DBLCBAPropietario.Text]);
              RealizarCambio(DBLCBASubCategoria,[CDSGrillaMachos.FieldByName('SUBCATEGORIA'),CDSGrillaMachos.FieldByName('V14')],[DBLCBASubCategoria.KeyValue,DBLCBASubCategoria.Text]);
              RealizarCambio(DBLCBAInspeccion,[CDSGrillaMachos.FieldByName('INSPECCION'),CDSGrillaMachos.FieldByName('V15')],[DBLCBAInspeccion.KeyValue,DBLCBAInspeccion.Text]);
              RealizarCambio(DBLCBADestCabania,[CDSGrillaMachos.FieldByName('DESTINO_CAB'),CDSGrillaMachos.FieldByName('V16')],[DBLCBADestCabania.KeyValue,DBLCBADestCabania.Text]);
              RealizarCambio(DBLCBAMocho,[CDSGrillaMachos.FieldByName('MOCHO'),CDSGrillaMachos.FieldByName('V17')],[DBLCBAMocho.KeyValue,DBLCBAMocho.Text]);

              CDSGrillaMachos.Post;
              CDSGrillaMachos.Transaction.CommitRetaining;
            end;
          //*/*/*/
          FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
          FAvanceTerminar.Update;
          Application.ProcessMessages;
          //*/*/*/*
          CDSGrillaMachos.Next;
        end;
    end;

  if (not CDSGrillaHembras.IsEmpty) and (PCGrillas.ActivePage=TSHembras) then
    begin
      CDSGrillaHembras.First;
      //SETEO IDENT
        if ((EARpInicial.text <> '') and (EARpInicial.Text <> 'N/N') and (identRp)) then
          i := strtoint(EARpInicial.text);
        IdentCUIG := EAUltimoIdent.Text;
        IdentReidentificacion:= EAUltimoIdentReidentificacion.Text;
      //FIN SETEO
      while not CDSGrillaHembras.Eof do
        begin
          if BDBGGrillaHembras.SelectedRows.CurrentRowSelected then
           begin
            CDSGrillaHembras.Edit;
            //inicio IDENTIFICADORES
              if identRp then
                begin
                  CDSGrillaHembras.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarRP(i) + EASufijo.Text;
                  if ( (not identCUIGSenasa) or (not identReidentSenasa) ) then
                    CDSGrillaHembras.FieldByName('id_senasa').asString := '';
                  if not identElectronica then
                    CDSGrillaHembras.FieldByName('id_ie').asString := '';
                end;
              if identCUIGSenasa then
                begin
                  CDSGrillaHembras.FieldByName('id_senasa').AsString := EAEncabezado.Text + IdentCUIG;;
                  if not identRp then
                    CDSGrillaHembras.FieldByName('id_rp').AsString := EAEncabezado.Text + IdentCUIG;;
                  IdentCUIG := UFunctions.IncrementarIdentificadorCUIG(IdentCUIG);
                end;
              if identElectronica then
                begin
                  CDSGrillaHembras.FieldByName('id_rp').AsString := Equivalencias[i].RP;
                  CDSGrillaHembras.FieldByName('id_ie').AsString := Equivalencias[i].IE;
                end;
              if identReidentSenasa then
                begin
                  CDSGrillaHembras.FieldByName('id_senasa').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
                  if not identRp then
                    CDSGrillaHembras.FieldByName('id_rp').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
                  IdentReidentificacion := UFunctions.IncrementarIdentificadorCUIG(IdentReidentificacion);
                end;
            //fin IDENTIFICADORES
            i := i + 1;
            CDSGrillaHembras.FieldByName('PESO').Value := FormatFloat('00.00',EAPeso.GetDato);
            RealizarCambio(DBLCBAGdr,[CDSGrillaHembras.FieldByName('GDR'),CDSGrillaHembras.FieldByName('V1')],[DBLCBAGdr.KeyValue,DBLCBAGdr.Text]);
            CDSGrillaHembras.FieldByName('DTA').Value := EADta.Text;
            RealizarCambio(DBLCBACronologiaD,[CDSGrillaHembras.FieldByName('cronologia_dentaria'),CDSGrillaHembras.FieldByName('V3')],[DBLCBACronologiaD.KeyValue,DBLCBACronologiaD.Text]);
            RealizarCambio(EAEstadoLactacion,[CDSGrillaHembras.FieldByName('estado_lactacion')],[StrToInt(EAEstadoLactacion.Text)]);
            RealizarCambio(DBLCBATiposPeso,[CDSGrillaHembras.FieldByName('VUno1'),CDSGrillaHembras.FieldByName('V9')],[DBLCBATiposPeso.KeyValue,DBLCBATiposPeso.Text]);
            RealizarCambio(DBLCBACondicionC,[CDSGrillaHembras.FieldByName('condicion_corporal'),CDSGrillaHembras.FieldByName('V2')],[DBLCBACondicionC.KeyValue,DBLCBACondicionC.Text]);
            RealizarCambio(DBLCBACategoria,[CDSGrillaHembras.FieldByName('categoria'),CDSGrillaHembras.FieldByName('V5')],[DBLCBACategoria.KeyValue,DBLCBACategoria.Text]);
            //cuando cambia la fecha de alta se calcula la edad con esto
            edad := monthsbetween(CDSGrillaHembras.FieldByName('FECHA_ALTA').AsDateTime,CDSGrillaHembras.FieldByName('fecha_nacimiento').AsDateTime);
            RealizarCambio(DTPAFechaAlta,[CDSGrillaHembras.FieldByName('FECHA_ALTA')],[DTPAFechaAlta.DateTime]);
            fecha := incMonth(CDSGrillaHembras.FieldByName('FECHA_ALTA').AsDateTime,-edad);
            CDSGrillaHembras.FieldByName('fecha_nacimiento').AsDateTime:= fecha;
            //cuando cambia la edad, se calcula con esto
            edad := StrToInt(JvEEdad.text);
            fecha := incMonth(CDSGrillaHembras.FieldByName('FECHA_ALTA').AsDateTime,-edad);
            RealizarCambio(JvEEdad,[CDSGrillaHembras.FieldByName('fecha_nacimiento')],[fecha]);
            RealizarCambio(DBLCBARaza,[CDSGrillaHembras.FieldByName('raza'),CDSGrillaHembras.FieldByName('V6')],[DBLCBARaza.KeyValue,DBLCBARaza.Text]);
            RealizarCambio(DBLCBARodeo,[CDSGrillaHembras.FieldByName('RODEO'),CDSGrillaHembras.FieldByName('V8')],[DBLCBARodeo.KeyValue,DBLCBARodeo.Text]);
            RealizarCambio(DBLCBAPotrero,[CDSGrillaHembras.FieldByName('POTRERO'),CDSGrillaHembras.FieldByName('V7')],[DBLCBAPotrero.KeyValue,DBLCBAPotrero.Text]);
            RealizarCambio(DBLCBAtipoAlta,[CDSGrillaHembras.FieldByName('TIPO_ALTA')],[DBLCBAtipoAlta.ListSource.DataSet.Lookup('NOMBRE',DBLCBAtipoAlta.Text,'ID_TIPO_ALTA')]);
            RealizarCambio(MAObservacion,[CDSGrillaHembras.FieldByName('OBSERVACION')],[MAObservacion.Text]);
            RealizarCambio(DBLCBAActividad,[CDSGrillaHembras.FieldByName('ACTIVIDAD'),CDSGrillaHembras.FieldByName('V10')],[DBLCBAActividad.KeyValue,DBLCBAActividad.Text]);
            RealizarCambio(DBLCBAResponsable,[CDSGrillaHembras.FieldByName('RESPONSABLE')],[DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',DBLCBAResponsable.Text,'ID_EMPLEADO')]);
            RealizarCambio(DBLCBAEstadoR,[CDSGrillaHembras.FieldByName('ESTADO_REPRODUCTIVO'),CDSGrillaHembras.FieldByName('V4')],[DBLCBAEstadoR.KeyValue,DBLCBAEstadoR.Text]);
            if (EAValortotal.Text <> '')and(EACantidad.text<>'') then
               RealizarCambio(EAValortotal,[CDSGrillaHembras.FieldByName('PRECIO_UNITARIO')],[StrToFloat(EAValortotal.Text)/StrToInt(EACantidad.text)])
            else
               RealizarCambio(EAValortotal,[CDSGrillaHembras.FieldByName('PRECIO_UNITARIO')],[0]);
            if(CDSGrillaHembras.FieldByName('peso').Value <> null) and (CDSGrillaHembras.FieldByName('peso').Value<>0) then
               CDSGrillaHembras.FieldByName('PRECIO_BRUTO').AsFloat := (CDSGrillaHembras.FieldByName('PRECIO_UNITARIO').AsFloat)/CDSGrillaHembras.FieldByName('peso').Value
            else
               CDSGrillaHembras.FieldByName('PRECIO_BRUTO').AsFloat := 0;
            if (EAValorNeto.Text <> '')and(EACantidad.text<>'') then
              RealizarCambio(EAValorNeto,[CDSGrillaHembras.FieldByName('GASTOS')],[StrToFloat(EAValorNeto.Text)/StrToInt(EACantidad.text)])
            else
              RealizarCambio(EAValorNeto,[CDSGrillaHembras.FieldByName('GASTOS')],[0]);
            RealizarCambio(DBLCBAOrigen,[CDSGrillaHembras.FieldByName('ORIGEN_ANIMAL'),CDSGrillaHembras.FieldByName('V11')],[DBLCBAOrigen.KeyValue,DBLCBAOrigen.Text]);
            RealizarCambio(DBLCBACriador,[CDSGrillaHembras.FieldByName('CRIADOR'),CDSGrillaHembras.FieldByName('V12')],[DBLCBACriador.KeyValue,DBLCBACriador.Text]);
            RealizarCambio(DBLCBAPropietario,[CDSGrillaHembras.FieldByName('PROPIETARIO'),CDSGrillaHembras.FieldByName('V13')],[DBLCBAPropietario.KeyValue,DBLCBAPropietario.Text]);
            RealizarCambio(DBLCBASubCategoria,[CDSGrillaHembras.FieldByName('SUBCATEGORIA'),CDSGrillaHembras.FieldByName('V14')],[DBLCBASubCategoria.KeyValue,DBLCBASubCategoria.Text]);
            RealizarCambio(DBLCBAInspeccion,[CDSGrillaHembras.FieldByName('INSPECCION'),CDSGrillaHembras.FieldByName('V15')],[DBLCBAInspeccion.KeyValue,DBLCBAInspeccion.Text]);
            RealizarCambio(DBLCBADestCabania,[CDSGrillaHembras.FieldByName('DESTINO_CAB'),CDSGrillaHembras.FieldByName('V16')],[DBLCBADestCabania.KeyValue,DBLCBADestCabania.Text]);
            RealizarCambio(DBLCBAMocho,[CDSGrillaHembras.FieldByName('MOCHO'),CDSGrillaHembras.FieldByName('V17')],[DBLCBAMocho.KeyValue,DBLCBAMocho.Text]);
            RealizarCambio(DBLCBAColor,[CDSGrillaHembras.FieldByName('COLOR'),CDSGrillaHembras.FieldByName('NOMCOLOR')],[DBLCBAColor.KeyValue,DBLCBAColor.Text]);
            RealizarCambio(DBLCBASubCategoria,[CDSGrillaHembras.FieldByName('SUBCATEGORIA'),CDSGrillaHembras.FieldByName('V14')],[DBLCBASubCategoria.KeyValue,DBLCBASubCategoria.Text]);

            CDSGrillaHembras.Post;
            CDSGrillaHembras.Transaction.CommitRetaining;
           end;
          //*/*/*/
          FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
          FAvanceTerminar.Update;
          Application.ProcessMessages;
          //*/*/*/*
          CDSGrillaHembras.Next;
        end;
    end;
  //*/*/*/*/*
  FAvanceTerminar.Destroy;
  //*/*/*
 //NICO LoadSQLStringList;
  PaintRequired;
end;

procedure TFEveAltaMasiva.DBLCBAEstadoRExit(Sender: TObject);
begin
  inherited;
  getEvent(sender);
end;

{function TFEveAltaMasiva.pertenece(valor:string;arreglo:arrSimple):boolean;
var i:integer;
begin
  pertenece:=false;
  for i:=0 to Length(arreglo)-1 do
    if valor=arreglo[i] then
      begin
      pertenece:=true;
      break;
      end;
end;}

procedure TFEveAltaMasiva.actualizarRP(id:integer;rp:string);
var
  i:integer;
  aux_rp : String;
begin
  if (Owner is TFMensajeNuevos) then
    if (Owner as TFMensajeNuevos).evento = 49 then
      aux_rp := 'rp (madre evento)'
    else
      aux_rp := 'rp'
  else
    aux_rp := 'rp';
  for i:=0 to Length(anim)-1 do
    if anim[i].id=id then
      begin
      setDato(aux_rp,rp,anim[i]);
      //break;
      end;
end;

procedure TFEveAltaMasiva.actualizarEdades;
begin
if not CDSGrillaHembras.IsEmpty then
begin
BDBGGrillaHembras.Hide;
CDSGrillaHembras.First;
while not CDSGrillaHembras.Eof do
  begin
  if CDSGrillaHembras.FieldByName('FECHA_NACIMIENTO').AsString='' then
    begin
    CDSGrillaHembras.Edit;
    if CDSGrillaHembras.FieldByName('V5').AsString='TERNERA' then CDSGrillaHembras.FieldByName('FECHA_NACIMIENTO').AsDateTime:=incmonth(CDSGrillaHembras.FieldByName('FECHA_ALTA').AsDateTime,-edadTernera);
    if CDSGrillaHembras.FieldByName('V5').AsString='VAQUILLONA' then CDSGrillaHembras.FieldByName('FECHA_NACIMIENTO').AsDateTime:=incmonth(CDSGrillaHembras.FieldByName('FECHA_ALTA').AsDateTime,-edadVaquillona);
    if CDSGrillaHembras.FieldByName('V5').AsString='VACA' then CDSGrillaHembras.FieldByName('FECHA_NACIMIENTO').AsDateTime:=incmonth(CDSGrillaHembras.FieldByName('FECHA_ALTA').AsDateTime,-edadVaca);
    setDato('fecha n',CDSGrillaHembras.FieldByName('FECHA_NACIMIENTO').AsString,anim[FImportacion.getPosicion(CDSGrillaHembras.FieldByName('ID_RP').AsString,anim,0)]);
    end;
  CDSGrillaHembras.Next;
  end;
BDBGGrillaHembras.Show;
end;
if not CDSGrillaMachos.IsEmpty then
begin
BDBGGrillaMachos.Hide;
CDSGrillaMachos.First;
while not CDSGrillaMachos.Eof do
  begin
  if CDSGrillaMachos.FieldByName('FECHA_NACIMIENTO').AsString='' then
    begin
    CDSGrillaMachos.Edit;
    if CDSGrillaMachos.FieldByName('V5').AsString='TERNERO' then CDSGrillaMachos.FieldByName('FECHA_NACIMIENTO').AsDateTime:=incmonth(CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime,-edadTernero);
    if CDSGrillaMachos.FieldByName('V5').AsString='NOVILLO' then CDSGrillaMachos.FieldByName('FECHA_NACIMIENTO').AsDateTime:=incmonth(CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime,-(edadNovillo+1));  //el +1 es por una cuestion que en el SP
    if CDSGrillaMachos.FieldByName('V5').AsString='TORO' then CDSGrillaMachos.FieldByName('FECHA_NACIMIENTO').AsDateTime:=incmonth(CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime,-(edadToro+1));        //RN_ALTA_DIRECTA el chequeo es <= y deberia ser <
    setDato('fecha n',CDSGrillaMachos.FieldByName('FECHA_NACIMIENTO').AsString,anim[FImportacion.getPosicion(CDSGrillaMachos.FieldByName('ID_RP').AsString,anim,0)]);
    end;
  CDSGrillaMachos.Next;
  end;
BDBGGrillaMachos.Show;
end;
end;

procedure TFEveAltaMasiva.LActividadClick(Sender: TObject);
var abm:TFABMActividad;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm:=TFABMActividad.Create(Self);
      abm.abrir(faAbm);
      //FPrincipal.AbrirFormNormal(TFABMActividad.Create(Self));
      DMSoftvet.IBQActividad.Close;
      DMSoftvet.IBQActividad.Open;
      if nroID>-1 then
        begin
        DBLCBAActividad.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBAActividad);
        end;
    end;
end;

procedure TFEveAltaMasiva.LActividadMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LActividad.Font.Color:= $00606C02;
      LActividad.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LActividadMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LActividad.Font.Color:= clWindowText;
      LActividad.Font.Style:= [fsUnderline];
    end;
end;

function TFEveAltaMasiva.BuscarRepetidos(ident:string;campo:string):integer;
var nroRepe:integer;
begin
nroRepe:=0;
if (dmsoftvet.IBQDatosAnimal.Locate(campo,ident,[]))or(CantidadRepetidos(campo,ident,IBQRepetidos, 'select count(*) as cantidad from AUX_animales ')>0) then
            begin
            nroRepe:=nroRepe+1;  //solo cuando se cargan animales en el alta masiva. no pasa cuando se agrega desde los eventos
            while(dmsoftvet.IBQDatosAnimal.Locate(campo,ident+'R'+inttostr(nroRepe),[]))do
                nroRepe:=nroRepe+1;
            while (CantidadRepetidos(campo,ident+'R'+inttostr(nroRepe),IBQRepetidos, 'select count(*) as cantidad from AUX_animales ')>0)do
                nroRepe:=nroRepe+1;
            end;
BuscarRepetidos:=nroRepe;
end;

procedure TFEveAltaMasiva.LOrigenMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LOrigen.Font.Color:= $00606C02;
      LOrigen.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LOrigenMouseLeave(Sender: TObject);
begin
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LOrigen.Font.Color:= clWindowText;
      LOrigen.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.RBReidentificacionSenasaClick(Sender: TObject);
begin
  inherited;
//  EAEncabezado.Visible := false;
//  EAUltimoIdent.Visible := false;
//  EAPrefijo.Visible := false;
//  EARPInicial.Visible := false;
//  EASufijo.Visible := false;
//  EARPinicial.EsRequerido := false;
//  CBCUIGPropio.Visible := false;
//  LCUIGPropio.Visible := false;
//  LRpInicial.Visible:=false;
//  DBLCBACUIGPropio.Visible:= false;

  Lr.Visible:= true;
  EAEncabezadoReidentificacion.Visible:= true;
  EAUltimoIdentReidentificacion.Visible:= true;

//  Lr.Top:= RBReidentificacionSenasa.Top + 3;
//  EAEncabezadoReidentificacion.Top:= RBReidentificacionSenasa.Top;
//  EAUltimoIdentReidentificacion.Top:= RBReidentificacionSenasa.Top;

//  JvIEquivalencias.Visible := false;
end;

procedure TFEveAltaMasiva.EAEncabezadoReidentificacionChange(Sender: TObject);
begin
  inherited;
  //Agregada la validacion para que cargue el Edit del RP cuando no esta visible
  if ((EAEncabezadoReidentificacion.Text <> '') and (EAUltimoIdentReidentificacion.Text <> '')) and (GBIdentificarRP.Visible = FALSE) then
    EARpInicial.Text := 'R' + EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text;

  ControlEventoOnExit(Sender);
end;

procedure TFEveAltaMasiva.EAUltimoIdentReidentificacionChange(Sender: TObject);
begin
  inherited;
  //Agregada la validacion para que cargue el Edit del RP cuando no esta visible
  if ((EAEncabezadoReidentificacion.Text <> '') and (EAUltimoIdentReidentificacion.Text <> '')) and (GBIdentificarRP.Visible = FALSE) then
    EARpInicial.Text := 'R' + EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text;

  ControlEventoOnExit(Sender);
end;

procedure TFEveAltaMasiva.DTPAFechaAltaExit(Sender: TObject);
begin
  inherited;
  GetEvent(sender);
  //EAEdadExit(EAEdad);
end;

procedure TFEveAltaMasiva.importar;
var
 cantidad,i:integer;
 listaErrores : TStringList;
 mensajeError : string;
begin
   try
      EARpInicial.Text:='0';
      EARpInicial.EsRequerido:=false;
      EACantidad.EsRequerido:=false;
      agregar:=false;
      BDBGGrillaHembras.Hide;
      BDBGGrillaMachos.Hide;
      cantidad:=0;

      listaErrores := TStringList.create();



      FAvanceTerminar:=TFAvanceTerminar.Create(self);
      FAvanceTerminar.Max:=Length(anim);
      FAvanceTerminar.Pos:=1;
      cant :=0;
      for i:=0 to Length(anim)-1 do
      begin
        mensajeError := validarDatosAnimales(i);
        if mensajeError='' then
          begin
            if (anim[i].id = -1) then
              cant:=cant+1;
            cargarNuevos(i);

          end
        else
        begin
         // hacer algo con el error detectado
         listaErrores.Add('Error linea '+intToStr(i+2)+':'+mensajeError);
        end;
      end;
      // Si se encontraron errores, los lista.. Se utilizan el Formulario MensajesNacimientos

      if (listaErrores.count>0) then
      begin
        MostrarMensajeNacimientos(tmError,'Error en el archivo importado', listaErrores);
        listaErrores.destroy();
        FAvanceTerminar.Modo := maListo;
        FAvanceTerminar.Destroy;
        exit;
      end
      else
      begin
        if (Fprincipal.importaMovil) then
           JvECantidad.Text := inttostr(cant)
        else
          cargaDeMovil:=false;
        //FAvanceTerminar.close;//Destroy;
        FAvanceTerminar.Modo := maListo;
        FAvanceTerminar.Destroy;

        TSHObservacion.TabVisible:=true;
        PCBasico.ActivePage:=TSHObservacion;
        ASacarAnimal.Enabled:=false;
        //BSacarAnimal.Visible:=true;
        ISacarAnimal.Visible := true;
        LSacarAnimal.Visible := true;
        TSHembras.Caption:=Traducir('Hembras(')+inttostr(CDSGrillaHembras.RecordCount)+')';
        TSMachos.Caption:=Traducir('Machos(')+inttostr(CDSGrillaMachos.RecordCount)+')';
        PCBasicoChange(self);
        if CDSGrillaHembras.RecordCount>0 then
          begin
          PCGrillas.ActivePage:=TSHembras;
          BDBGGrillaHembras.Show;
          end
        else if CDSGrillaMachos.RecordCount>0 then
          begin
          PCGrillas.ActivePage:=TSMachos;
          BDBGGrillaMachos.Show;
          end;
        if (Fprincipal.importaMovil) then
          begin
          JvTerminar.Visible := true;
          end;

        if listaCats.Count>0 then
          MostrarMensajeEdades(self,tmAdvertencia,'No se pudo determinar la edad da algunos animales. Por favor especifíque una edad promedio(en meses) para las siguientes categorías:',listaCats);
        actualizarEdades;
        ControlEventoOnExit(self);
    end;
  except
      MostrarMensaje(tmError,'Ocurrió un error en la importación. Por favor verifique el archivo e intente nuevamente');
      cargaDeMovil:=false;
    end;



end;

function TFEveAltaMasiva.agregarExterno(tipo:string;sexo:integer;i:integer):integer;
var str:string;
begin
if (CantidadRepetidos('id_rp',getDato('rp '+tipo,anim[i]),IBQRepetidos, 'select count(*) as cantidad from AUX_animales_externos ')=0) then
  begin
  IBQGenIdExterno.Close;
  IBQGenIdExterno.Open;
  IBQAgregarExterno.Close;
  IBQAgregarExterno.ParamByName('ID_ANIMAL_EXTERNO').AsInteger:=IBQGenIdExterno.FieldValues['IDEXT'];
  IBQAgregarExterno.ParamByName('ID_AUX').AsInteger:=IBQGenIdExterno.FieldValues['IDEXT'];
  IBQAgregarExterno.ParamByName('APODO').AsString:=getDato('apodo '+tipo,anim[i]);
  IBQAgregarExterno.ParamByName('ID_RP').AsString:=getDato('rp '+tipo,anim[i]);
  IBQAgregarExterno.ParamByName('ID_SENASA').AsString:='';getDato('senasa '+tipo,anim[i]);
  IBQAgregarExterno.ParamByName('ID_PC').AsString:='';//getDato('pc',anim[i]);
  IBQAgregarExterno.ParamByName('ID_HBA').AsString:=getDato('hba '+tipo,anim[i]);
  IBQAgregarExterno.ParamByName('ID_RA').AsString:='';//getDato('id_ra',anim[i]);
  IBQAgregarExterno.ParamByName('ID_OTRO').AsString:='';//getDato('otro',anim[i]);
  IBQAgregarExterno.ParamByName('NOMBRE_ANIMAL').AsString:=getDato('nombre '+tipo,anim[i]);
  str:=getDato('raza '+tipo,anim[i]);
  if str<>'' then
    IBQAgregarExterno.ParamByName('RAZA').AsInteger:=DMSoftvet.IBQRaza.Lookup('NOMBRE',str,'ID_RAZA')
  else
    IBQAgregarExterno.ParamByName('RAZA').AsInteger:=0;
  IBQAgregarExterno.ParamByName('SEXO').AsInteger:=sexo;
  str:=getDato('criador '+tipo,anim[i]);
  IBQAgregarExterno.ParamByName('CRIADOR').Value:=str;
  {if (str<>'') and (dmsoftvet.IBQCodCriador.Lookup('SINONIMO',str,'ID_CRIADOR')<>null) then
    IBQAgregarExterno.ParamByName('CRIADOR').Value:=dmsoftvet.IBQCodCriador.Lookup('SINONIMO',str,'ID_CRIADOR')
  else
    IBQAgregarExterno.ParamByName('CRIADOR').AsInteger:=0;}
  str:=AnsiUpperCase(getDato('propietario '+tipo,anim[i]));
  if (str<>'') and (dmsoftvet.IBQCodPropietario.Lookup('SINONIMO',str,'ID_PROPIETARIO')<>null) then
    IBQAgregarExterno.ParamByName('PROPIETARIO').AsInteger:=dmsoftvet.IBQCodPropietario.Lookup('SINONIMO',str,'ID_PROPIETARIO')
  else
    IBQAgregarExterno.ParamByName('PROPIETARIO').AsInteger:=0;
  str:=getDato('fecha nacimiento '+tipo,anim[i]);
  if str<>'' then
    IBQAgregarExterno.ParamByName('FECHA').AsDateTime:=strtodatetime(str)
  else
    IBQAgregarExterno.ParamByName('FECHA').AsDateTime:=StrToDateTime('01/01/1900');
  IBQAgregarExterno.Open;
  dmsoftvet.IBQAnimExt.Close;
  dmsoftvet.IBQAnimExt.Open;
  agregarExterno:=IBQAgregarExterno.ParamByName('ID_ANIMAL_EXTERNO').AsInteger;
  end
else
  begin
  IBQRepetidos.Close;
  IBQRepetidos.SQL.Clear;
  IBQRepetidos.SQL.Add('select ID_ANIMAL_EXTERNO from AUX_ANIMALES_EXTERNOS where ID_RP='''+getDato('rp '+tipo,anim[i])+'''');
  IBQRepetidos.Open;
  agregarExterno:=IBQRepetidos.FieldValues['ID_ANIMAL_EXTERNO'];
  end;

end;

function TFEveAltaMasiva.agregarInterno(tipo:string;sexo:integer;i:integer):integer;
var str:string;
begin

if (CantidadRepetidos('id_rp',getDato('rp '+tipo,anim[i]),IBQRepetidos, 'select count(*) as cantidad from AUX_animales ')=0) then
  begin
  IBQGenIDAnimal.Close;
  IBQGenIDAnimal.Open;
  IBQAgregarInterno.Close;
  IBQAgregarInterno.ParamByName('ID_ANIMAL').AsInteger:=IBQGenIDAnimal.FieldValues['IDANIMAL'];
  IBQAgregarInterno.ParamByName('ID_AUX').AsInteger:=IBQGenIDAnimal.FieldValues['IDANIMAL'];
  IBQAgregarInterno.ParamByName('TIPO_ALTA').AsInteger:=DBLCBAtipoAlta.ListSource.DataSet.Lookup('nombre',AnsiUpperCase(getDato('tipo alta',anim[i])),'id_tipo_alta');
  IBQAgregarInterno.ParamByName('FECHA_ALTA').AsDateTime:=strtodatetime(getDato('fecha',anim[i]));

  IBQAgregarInterno.ParamByName('ID_RP').AsString:=getDato('rp '+tipo,anim[i]);
  IBQAgregarInterno.ParamByName('SEXO').AsInteger:=sexo;
  str:=getDato('fecha nacimiento '+tipo,anim[i]);
  if str<>'' then
    IBQAgregarInterno.ParamByName('FECHA_NACIMIENTO').AsDateTime:=strtodatetime(str)
  else
    //en realidad aca hay que definir que fecha se quiere poner
    IBQAgregarInterno.ParamByName('FECHA_NACIMIENTO').AsDateTime:=IncMonth(strtodatetime(getDato('fecha',anim[i])),-25);
  IBQAgregarInterno.ParamByName('POTRERO').AsInteger:=0;
  IBQAgregarInterno.ParamByName('RODEO').AsInteger:=0;
  str:=getDato('raza '+tipo,anim[i]);
  if str<>'' then
    IBQAgregarInterno.ParamByName('RAZA').AsInteger:=DMSoftvet.IBQRaza.Lookup('NOMBRE',str,'ID_RAZA')
  else
    IBQAgregarInterno.ParamByName('RAZA').AsInteger:=0;
  IBQAgregarInterno.ParamByName('RESPONSABLE').AsInteger:=0;//getdato('responsable',anim[i]);
  if sexo=1 then
    begin
    IBQAgregarInterno.ParamByName('CATEGORIA').AsInteger:=3;
    IBQAgregarInterno.ParamByName('ESTADO_LACTACION').value := null;
    end
  else
    begin
    IBQAgregarInterno.ParamByName('CATEGORIA').AsInteger:=6;
    IBQAgregarInterno.ParamByName('ESTADO_LACTACION').AsInteger := 1;//CDSGrillaHembras.FieldValues['ESTADO_LACTACION'];
    end;

         IBQAgregarInterno.ParamByName('CRONOLOGIA_DENTARIA').AsInteger := 0;
         IBQAgregarInterno.ParamByName('CONDICION_CORPORAL').Value := null;
         IBQAgregarInterno.ParamByName('GDR').AsInteger := 0;
         IBQAgregarInterno.ParamByName('ESTADO_REPRODUCTIVO').AsInteger := 0;

          IBQAgregarInterno.ParamByName('ACTIVIDAD').AsInteger := 0;
          IBQAgregarInterno.ParamByName('ADN').Value := null;
          IBQAgregarInterno.ParamByName('Tipificacion_Sanguinea').Value := null;
    str:=AnsiUpperCase(getDato('criador '+tipo,anim[i]));
    if (str<>'') and (dmsoftvet.IBQCodCriador.Lookup('SINONIMO',str,'ID_CRIADOR')<>null) then
      IBQAgregarInterno.ParamByName('CRIADOR').AsInteger:=dmsoftvet.IBQCodCriador.Lookup('SINONIMO',str,'ID_CRIADOR')
    else
      IBQAgregarInterno.ParamByName('CRIADOR').AsInteger:=0;
    str:=AnsiUpperCase(getDato('propietario '+tipo,anim[i]));
    if (str<>'') and (dmsoftvet.IBQCodPropietario.Lookup('SINONIMO',str,'ID_PROPIETARIO')<>null) then
      IBQAgregarInterno.ParamByName('PROPIETARIO').AsInteger:=dmsoftvet.IBQCodPropietario.Lookup('SINONIMO',str,'ID_PROPIETARIO')
    else
      IBQAgregarInterno.ParamByName('PROPIETARIO').AsInteger:=0;
    str:=AnsiUpperCase(getDato('orígen '+tipo,anim[i]));
    if (str<>'') and (dmsoftvet.IBQCodOrigen.Lookup('SINONIMO',str,'ID_ORIGEN')<>null) then
      IBQAgregarInterno.ParamByName('ORIGEN_ANIMAL').AsInteger:=dmsoftvet.IBQCodOrigen.Lookup('SINONIMO',str,'ID_ORIGEN')
    else
      IBQAgregarInterno.ParamByName('ORIGEN_ANIMAL').AsInteger:=0;

          if trim(getDato('apodo '+tipo,anim[i]))<>'' then IBQAgregarInterno.ParamByName('APODO').Value := getDato('apodo '+tipo,anim[i]) else IBQAgregarInterno.ParamByName('APODO').Value:=null;
          IBQAgregarInterno.ParamByName('ID_PC').Value := null;
          IBQAgregarInterno.ParamByName('ID_RA').Value := null;
          IBQAgregarInterno.ParamByName('ID_OTRO').Value := null;

          IBQAgregarInterno.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := null;
          IBQAgregarInterno.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := null;
          IBQAgregarInterno.ParamByName('MADRE_RECEPTORA_INTERNA').Value := null;
          IBQAgregarInterno.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := null;
          IBQAgregarInterno.ParamByName('PADRE_INTERNO').Value := null;
          IBQAgregarInterno.ParamByName('PADRE_EXTERNO').Value := null;
          if getDato('hba '+tipo,anim[i])<>'' then IBQAgregarInterno.ParamByName('ID_HBA').Value := getDato('hba '+tipo,anim[i])
          else IBQAgregarInterno.ParamByName('ID_HBA').Value:=null;
          IBQAgregarInterno.ParamByName('ID_IE').Value := null;
          IBQAgregarInterno.ParamByName('PESO').Value := null;
          if trim(getDato('nombre '+tipo,anim[i]))<>'' then IBQAgregarInterno.ParamByName('NOMBRE').Value := getDato('nombre '+tipo,anim[i])
          else IBQAgregarInterno.ParamByName('NOMBRE').Value:=null;
          if trim(getDato('senasa '+tipo,anim[i]))<>'' then IBQAgregarInterno.ParamByName('ID_SENASA').AsString := getDato('senasa '+tipo,anim[i])
          else IBQAgregarInterno.ParamByName('ID_SENASA').Value:=null;
          IBQAgregarInterno.ParamByName('DTA').Value := null;
          IBQAgregarInterno.ParamByName({'DIASPESO'}'VUno1').AsString := 'G';

  {IBQAgregarInterno.ParamByName('LOG_USUARIO').AsInteger :=FPrincipal.UsuarioActual;
  IBQAgregarInterno.ParamByName('LOG_FECHA_MODIFICADO').AsDate := now;
  IBQAgregarInterno.ParamByName('DISPARADOR').Value := null;
  IBQAgregarInterno.ParamByName('ID_GRUPO').Value := null;
  IBQAgregarInterno.ParamByName('TIPO_ALTA').AsInteger:=3;}

  IBQAgregarInterno.Open;
  IBQAgregarInterno.Transaction.CommitRetaining;
  agregarInterno:=IBQGenIDAnimal.FieldValues['IDANIMAL'];
  //IBQAgregarInterno.Active:=false;
  end
else
  begin
  IBQRepetidos.Close;
  IBQRepetidos.SQL.Clear;
  IBQRepetidos.SQL.Add('select ID_ANIMAL from AUX_ANIMALES where ID_RP='''+getDato('rp '+tipo,anim[i])+'''');
  IBQRepetidos.Open;
  agregarInterno:=IBQRepetidos.FieldValues['ID_ANIMAL'];
  end;
end;

procedure TFEveAltaMasiva.cargarPadres(DS:TIBDataSet;i:integer);
var str:string;
    ww : integer;
begin
          DMSoftvet.IBQDatosAnimal.Close;
          DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
          DMSoftvet.IBQDatosAnimal.Open;
          DMSoftvet.IBQAnimExt.Close;
          DMSoftvet.IBQAnimExt.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
          DMSoftvet.IBQAnimExt.Open;
          str:=getDato('rp madre biológica',anim[i]);
          if str<>'' then
            if getDato('tipo madre biológica',anim[i])='INTERNA' then
              if DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',str,'ID_ANIMAL')<>null then
                  DS.FieldByName('MADRE_BIOLOGICA_INTERNA').Value:=DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',str,'ID_ANIMAL')
              else
                  DS.FieldByName('MADRE_BIOLOGICA_INTERNA').Value:=agregarInterno('madre biológica',2,i)
            else
              if DMSoftvet.IBQAnimExt.Lookup('ID_RP',str,'ID_ANIMAL_EXTERNO')<>null then
              DS.FieldByName('MADRE_BIOLOGICA_EXTERNA').Value:=DMSoftvet.IBQAnimExt.Lookup('ID_RP',str,'ID_ANIMAL_EXTERNO')
            else
              DS.FieldByName('MADRE_BIOLOGICA_EXTERNA').Value:=agregarExterno('madre biológica',2,i);

          str:=getDato('rp madre receptora',anim[i]);
          if str<>'' then
            if getDato('tipo madre receptora',anim[i])='INTERNA' then
              if DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',str,'ID_ANIMAL')<>null then
                  DS.FieldByName('MADRE_RECEPTORA_INTERNA').Value:=DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',str,'ID_ANIMAL')
              else
                  DS.FieldByName('MADRE_RECEPTORA_INTERNA').Value:=agregarInterno('madre receptora',2,i)
            else
              if DMSoftvet.IBQAnimExt.Lookup('ID_RP',str,'ID_ANIMAL_EXTERNO')<>null then
              DS.FieldByName('MADRE_RECEPTORA_EXTERNA').Value:=DMSoftvet.IBQAnimExt.Lookup('ID_RP',str,'ID_ANIMAL_EXTERNO')
            else
              DS.FieldByName('MADRE_RECEPTORA_EXTERNA').Value:=agregarExterno('madre receptora',2,i);

          str:=getDato('rp padre',anim[i]);
          if str<>'' then
            if getDato('tipo padre',anim[i])='INTERNO' then
              if DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',str,'ID_ANIMAL')<>null then
                  DS.FieldByName('PADRE_INTERNO').Value:=DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',str,'ID_ANIMAL')
              else
                  DS.FieldByName('PADRE_INTERNO').Value:=agregarInterno('padre',1,i)
            else
              if DMSoftvet.IBQAnimExt.Lookup('ID_RP',str,'ID_ANIMAL_EXTERNO')<>null then
              DS.FieldByName('PADRE_EXTERNO').Value:=DMSoftvet.IBQAnimExt.Lookup('ID_RP',str,'ID_ANIMAL_EXTERNO')
            else
              DS.FieldByName('PADRE_EXTERNO').Value:=agregarExterno('padre',1,i);


end;

procedure TFEveAltaMasiva.altaExternos;
begin
IBQRepetidos.Close;
IBQRepetidos.SQL.Clear;
IBQRepetidos.SQL.Add('select * from AUX_ANIMALES_EXTERNOS');
IBQRepetidos.Open;

IBQAgregarExterno.SQL.Clear;
IBQAgregarExterno.SQL.Add('insert into TAB_ANIMALES_EXTERNOS '+
                            '(ID_ANIMAL_EXTERNO, ID_HBA, SEXO, ID_OTRO, ID_PC, ID_RA,'+
                            'ID_RP,ID_SENASA, RAZA, FECHA_NACIMIENTO, NOMBRE, APODO, ESTABLECIMIENTO,CRIADOR,PROPIETARIO) values '+
                            '(:ID_ANIMAL_EXTERNO, :ID_HBA, :SEXO, :ID_OTRO, :ID_PC, :ID_RA,'+
                            ':ID_RP, :ID_SENASA, :RAZA, :FECHA_NACIMIENTO, :NOMBRE, :APODO, :ESTABLECIMIENTO,:CRIADOR,:PROPIETARIO)');

IBQRepetidos.First;
try
while not IBQRepetidos.Eof do
  begin
  IBQAgregarExterno.Close;
  IBQAgregarExterno.ParamByName('ID_ANIMAL_EXTERNO').AsInteger:=IBQRepetidos.FieldValues['ID_ANIMAL_EXTERNO'];
  if trim(IBQRepetidos.FieldValues['APODO'])<>'' then IBQAgregarExterno.ParamByName('APODO').AsString:=IBQRepetidos.FieldValues['APODO']
  else IBQAgregarExterno.ParamByName('APODO').Value:=null;
  IBQAgregarExterno.ParamByName('ID_RP').AsString:=IBQRepetidos.FieldValues['ID_RP'];
  IBQAgregarExterno.ParamByName('ID_SENASA').Value:=null;//IBQRepetidos.FieldValues['ID_SENASA'];
  IBQAgregarExterno.ParamByName('ID_PC').Value:=null;//IBQRepetidos.FieldValues['ID_PC'];
  if trim(IBQRepetidos.FieldValues['ID_HBA'])<>'' then IBQAgregarExterno.ParamByName('ID_HBA').Value:=IBQRepetidos.FieldValues['ID_HBA']
  else IBQAgregarExterno.ParamByName('ID_HBA').Value:=null;
  IBQAgregarExterno.ParamByName('ID_RA').Value:=null;//IBQRepetidos.FieldValues['ID_RA'];
  IBQAgregarExterno.ParamByName('ID_OTRO').Value:=null;//IBQRepetidos.FieldValues['ID_OTRO'];
  if trim(IBQRepetidos.FieldValues['NOMBRE'])<>'' then IBQAgregarExterno.ParamByName('NOMBRE').Value:=IBQRepetidos.FieldValues['NOMBRE']
  else IBQAgregarExterno.ParamByName('NOMBRE').Value:=null;
  IBQAgregarExterno.ParamByName('RAZA').Value:=IBQRepetidos.FieldValues['RAZA'];
  IBQAgregarExterno.ParamByName('SEXO').Value:=IBQRepetidos.FieldValues['SEXO'];
  if trim(IBQRepetidos.FieldValues['CRIADOR'])<>'' then IBQAgregarExterno.ParamByName('CRIADOR').Value:=IBQRepetidos.FieldValues['CRIADOR']
  else IBQAgregarExterno.ParamByName('CRIADOR').Value:=null;
  IBQAgregarExterno.ParamByName('PROPIETARIO').AsInteger:=IBQRepetidos.FieldValues['PROPIETARIO'];
  IBQAgregarExterno.ParamByName('FECHA_NACIMIENTO').AsDateTime:=IBQRepetidos.FieldValues['FECHA'];
  IBQAgregarExterno.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;
  IBQAgregarExterno.Open;
  IBQRepetidos.Next;
  end;
IBQAgregarExterno.Transaction.CommitRetaining;
except
  IBQAgregarExterno.Transaction.RollbackRetaining;
  end;
end;

procedure TFEveAltaMasiva.LOrigenClick(Sender: TObject);
var abm:TFABMOrigen;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      abm := TFABMOrigen.Create(self);
      abm.Abrir(faAbm);
      //FPrincipal.AbrirFormNormal(TFABMOrigen.Create(Self));
      DMSoftvet.IBQCodOrigen.Close;
      DMSoftvet.IBQCodOrigen.Open;
      if nroID>-1 then
      begin
        DBLCBAOrigen.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBAOrigen);
      end;
    end;
end;

procedure TFEveAltaMasiva.LCriadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCriador.Font.Color:= $00606C02;
      LCriador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LCriadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCriador.Font.Color:= clWindowText;
      LCriador.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LCriadorClick(Sender: TObject);
var
  abm:TFABMCriador;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      abm := TFABMCriador.Create(self);
      abm.Abrir(faAbm);
      //FPrincipal.AbrirFormNormal(TFABMOrigen.Create(Self));
      DMSoftvet.IBQCodCriador.Close;
      DMSoftvet.IBQCodCriador.Open;
      if nroID>-1 then
        begin
        DBLCBACriador.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBACriador);
        end;
    end;
end;

procedure TFEveAltaMasiva.LPropietarioMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPropietario.Font.Color:= $00606C02;
      LPropietario.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LPropietarioMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPropietario.Font.Color:= clWindowText;
      LPropietario.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LPropietarioClick(Sender: TObject);
var
  abm:TFABMPropietarioAnimal;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      abm := TFABMPropietarioAnimal.Create(self);
      abm.Abrir(faAbm);
      //FPrincipal.AbrirFormNormal(TFABMOrigen.Create(Self));
      DMSoftvet.IBQCodPropietario.Close;
      DMSoftvet.IBQCodPropietario.Open;
      if nroID>-1 then
        begin
        DBLCBAPropietario.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBAPropietario);
        end;
    end;
end;

procedure TFEveAltaMasiva.AsignarMetodo;
var
  I : Integer;
begin
  for I := 0 to CDSGrillaMachos.FieldCount-1 do
    if not Assigned(CDSGrillaMachos.Fields[I].OnSetText) then
      CDSGrillaMachos.Fields[I].OnSetText := SetText;
  for I := 0 to CDSGrillaHembras.FieldCount-1 do
    if not Assigned(CDSGrillaHembras.Fields[I].OnSetText) then
      CDSGrillaHembras.Fields[I].OnSetText := SetText;
end;

procedure TFEveAltaMasiva.DBLCBACatMachosCloseUp(Sender: TObject);
var
  cod : Integer;
begin
  inherited;
  // dehabilito la castración cuando es ternero
  cod := DBLCBACategoria.KeyValue;
  if IBQCategorias.FieldByName('ref_categ').Value <> null then
    cod := IBQCategorias.FieldByName('ref_categ').Value;
  if(cod <> 1)then
    CBCastrado.Enabled := false
   else
     CBCastrado.Enabled := true;
end;

procedure TFEveAltaMasiva.CBSexoCloseUp(Sender: TObject);
var
  cod : Integer;
begin
  inherited;
  // dehabilito la castración cuando es ternero
  cod := DBLCBACategoria.KeyValue;
  if IBQCategorias.FieldByName('ref_categ').Value <> null then
    cod := IBQCategorias.FieldByName('ref_categ').Value;
  if((cod <> 1) and (CBSexo.ItemIndex = 0))then
    CBCastrado.Enabled := false
   else
     CBCastrado.Enabled := true;
end;

procedure TFEveAltaMasiva.CDSGrillaMachosVUNO2Change(Sender: TField);
var valor: Integer;
begin
  inherited;
if (PCGrillas.ActivePage=TSMachos) and (CDSGrillaMachos.State = dsEdit) then
begin
      case (Sender.Index) of
       54: begin // castración
            if (CDSGrillaMachos.FieldValues['VUNO2'] <> null) then
             begin
                if (TryStrToInt(CDSGrillaMachos.FieldValues['VUNO2'],valor)) then
                  begin
                   if (CDSGrillaMachos.FieldByName('categoria').AsInteger = 1) then
                    if (CDSGrillaMachos.FieldValues['VUNO2'] = null) or (CDSGrillaMachos.FieldValues['VUNO2'] < 0) or (CDSGrillaMachos.FieldValues['VUNO2'] > 1) then
                      CDSGrillaMachos.FieldValues['VUNO2']:= 0;
                  end;
                 //else
                     // CDSGrillaMachos.FieldValues['VUNO2']:= 0;
             end;
          end;
    end;//del case      
end;

end;

procedure TFEveAltaMasiva.CDSGrillaHembrasOBSERVACIONSetText(
  Sender: TField; const Text: String);
begin
  inherited;
  Sender.AsString := Text;
end;

procedure TFEveAltaMasiva.CBSexoClick(Sender: TObject);
var
  cod : Integer;
begin
  inherited;
  cod := DBLCBACategoria.KeyValue;
  if IBQCategorias.FieldByName('ref_categ').Value <> null then
    cod := IBQCategorias.FieldByName('ref_categ').Value;
  EACircunferenciaEscrotal.Enabled := cod = 3;
end;

procedure TFEveAltaMasiva.CargarSubCategoriasporRaza;
begin
  DMSoftvet.IBQSubCategoriaRaza.Close;
  DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').Value :=DBLCBARaza.KeyValue;
  DMSoftvet.IBQSubCategoriaRaza.Open;
  DMSoftvet.IBQSubCategoriaRaza.First;
  DBLCBASubCategoria.KeyValue:= 0;

end;

procedure TFEveAltaMasiva.DBLCBARazaCloseUp(Sender: TObject);
begin
  inherited;
  CargarSubCategoriasporRaza();
  AcomodarPanelPorRaza;
end;

procedure TFEveAltaMasiva.LSubcategoriaMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LSubCategoria.Font.Color:= clWindowText;
      LSubCategoria.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LSubcategoriaMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LSubCategoria.Font.Color:= $00606C02;
      LSubCategoria.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LSubcategoriaClick(Sender: TObject);
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

procedure TFEveAltaMasiva.CDSGrillaMachosPESOChange(Sender: TField);
var
  a, b : String;
begin
 { a := Sender.Value;
  inherited;
  b := a[Length(a)-1];
  if (b = '.') or (b = ',') then}
end;

procedure TFEveAltaMasiva.BDBGGrillaMachosKeyPress(Sender: TObject;
  var Key: Char);
var
  Separador : Char;
begin
  inherited;
  Separador := SysUtils.DecimalSeparator;
  if ((Key = '.') or ( Key = ',')) then
    Key := Separador;
end;

procedure TFEveAltaMasiva.BDBGGrillaHembrasKeyPress(Sender: TObject;
  var Key: Char);
var
  Separador : Char;
begin
  inherited;
  Separador := SysUtils.DecimalSeparator;
  if ((Key = '.') or ( Key = ',')) then
    Key := Separador;
end;

procedure TFEveAltaMasiva.BDBGGrillaHembrasColEnter(Sender: TObject);
begin
  DMSoftvet.IBQSubCategoriaRaza.Close;
  DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := CDSGrillaHembrasRAZA.AsInteger;
  DMSoftvet.IBQSubCategoriaRaza.Open;
  DMSoftvet.IBQMocho.Close;
  DMSoftvet.IBQMocho.ParamByName('raza').Value := CDSGrillaHembrasRAZA.Value;
  DMSoftvet.IBQMocho.Open;
 //NICO LoadSQLStringList;
  inherited;
end;

procedure TFEveAltaMasiva.BDBGGrillaMachosColEnter(Sender: TObject);
begin
  DMSoftvet.IBQSubCategoriaRaza.Close;
  DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := CDSGrillaMachosRAZA.AsInteger;
//  DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := CDSGrillaMachos.FieldValues['RAZA'];
  DMSoftvet.IBQSubCategoriaRaza.Open;
  DMSoftvet.IBQMocho.Close;
  DMSoftvet.IBQMocho.ParamByName('raza').Value := CDSGrillaMachosRAZA.Value;
  DMSoftvet.IBQMocho.Open;
 //NICO LoadSQLStringList;
  inherited;
end;

procedure TFEveAltaMasiva.CargarEquivalencias(DireccionArch : String);
var Archivo : TextFile;
    Indice : Integer;
    Linea, caravana : String;
    Caravanas : TStringList;
begin
  showmessage (Fprincipal.MarcaLector);
  Indice := 0;
  AssignFile(Archivo,DireccionArch);
  Reset(Archivo);
  while not Eof(Archivo) do
  begin
    Caravanas := TStringList.Create;
    Readln(Archivo,Linea);
    Linea := StringReplace(Linea,'[','',[rfReplaceAll]);
    Linea := StringReplace(Linea,']','',[rfReplaceAll]);
    Caravanas.Delimiter := '|';
    Caravanas.DelimitedText := Linea;
    caravana := Caravanas[0];
    if (length(caravana)>15) then

    IBQExisteEQ.Close;
    IBQExisteEQ.ParamByName('ie').AsString := Caravanas[0];
    IBQExisteEQ.ParamByName('e').AsInteger := FPrincipal.EstablecimientoActual;
    IBQExisteEQ.Open;
    if (IBQExisteEQ.RecordCount=0) then
    begin
      SetLength(Equivalencias,indice+1);
      Equivalencias[indice].IE := Caravanas[0];
      Equivalencias[indice].RP := RightStr(Caravanas[0],10);
      Inc(Indice);
    end;
  end;

  if Length(Equivalencias) > 0 then
  begin
    cargaEQ := true;
    EACantidad.Text := IntToStr(Length(Equivalencias));
    JvECantidad.Text := IntToStr(Length(Equivalencias));
    BDBGGrillaHembras.Columns[2].Visible := true;
    BDBGGrillaHembras.Columns[2].Width := 145;
    BDBGGrillaMachos.Columns[2].Visible := true;
    BDBGGrillaMachos.Columns[2].Width := 145;
    BDBGGrillaHembras.Columns[3].Visible := true;
    BDBGGrillaHembras.Columns[3].Width := 145;
    BDBGGrillaMachos.Columns[3].Visible := true;
    BDBGGrillaMachos.Columns[3].Width := 145;
  end;

end;

 procedure TFEveAltaMasiva.CargarIdentVesta(DireccionArch : String);
var Indice, IArch : Integer;
    aux_ie : String;
    _Arch : TStringList;
    Caravanas : TStringList;
begin

  Indice := 0;
  _Arch := TStringList.Create;
  _Arch.Delimiter := ',';
  _Arch.LoadFromFile(DireccionArch);
  for IArch := ObtenerFilaPrimerDato(DireccionArch)-1 to _Arch.Count-1 do
  begin
    Caravanas := TStringList.Create;
    Caravanas.Delimiter := ';';
    Caravanas.DelimitedText := _Arch.Strings[IArch];
    aux_ie := Caravanas[0];


    //if(FPrincipal.MarcaLector = 'Datamars')then
    //if length(aux_ie) < 10 then
    //begin
    //  case FPrincipal.Pais of
    //    1 : aux_ie := 'A000000096400100'+aux_ie;          //A0000000964001002847643
    //    2 : aux_ie := 'A000000085800100'+aux_ie;          //A0000000964001002847643
    //    else
    //      aux_ie := 'A000000096400100'+aux_ie;
    //  end;
    //end
    //else
    //begin
    //  case FPrincipal.Pais of
    //    1 : aux_ie := 'A000000096400'+aux_ie;
    //    2 : aux_ie := 'A000000085800'+aux_ie;
    //    else
    //      aux_ie := 'A000000096400'+aux_ie;
    //  end;
    //end;

      SetLength(Equivalencias,indice+1);
      Equivalencias[indice].IE := aux_ie;
      Equivalencias[indice].RP := RightStr(aux_ie,10);
      Inc(Indice);
  end;

  if Length(Equivalencias) > 0 then
  begin
    cargaEQ := true;
    EACantidad.Text := IntToStr(Length(Equivalencias));
    JvECantidad.Text := IntToStr(Length(Equivalencias));
    BDBGGrillaHembras.Columns[3].Visible := true;
    BDBGGrillaHembras.Columns[3].Width := 145;
    BDBGGrillaMachos.Columns[3].Visible := true;
    BDBGGrillaMachos.Columns[3].Width := 145;
    BDBGGrillaHembras.Columns[1].Visible := true;
    BDBGGrillaHembras.Columns[1].Width := 145;
    BDBGGrillaMachos.Columns[1].Visible := true;
    BDBGGrillaMachos.Columns[1].Width := 145;
    //BDBGGrillaMachos.Columns[2].Visible := false;
    //BDBGGrillaHembras.Columns[2].visible := false;
  end;
end;


procedure TFEveAltaMasiva.RBEquivalenciasClick(Sender: TObject);
begin
  inherited;
  //EAEncabezado.Visible := false;
  //EAUltimoIdent.Visible := false;
  //EAPrefijo.Visible := false;
  //EARPInicial.Visible := false;
  //EASufijo.Visible := false;
  //EARPinicial.EsRequerido := false;
  //CBCUIGPropio.Visible := false;
  //LCUIGPropio.Visible := false;
 // LRpInicial.Visible:=false;
  //DBLCBACUIGPropio.Visible:= false;
  //Lr.Visible:= false;
  //EAEncabezadoReidentificacion.Visible:= false;
  //EAUltimoIdentReidentificacion.Visible:= false;

  JvIEquivalencias.Visible := true;
end;

function TFEveAltaMasiva.ObtenerFilaPrimerDato(DireccionArch : String): Integer;
var
  ext, linea: String;
  numLinea,cantFilas: integer;
  _Arch, Caravanas : TStringList;
  Excel, planilla: OLEVariant;
  columna: integer;
begin

  ext := ExtractFileExt(DireccionArch);


  if (UpperCase(ext) = '.CSV') then
    begin
        _Arch := TStringList.Create;
        _Arch.Delimiter := ',';
        _Arch.LoadFromFile(DireccionArch);
        for numLinea := 0 to _Arch.Count-1 do
          begin
          Caravanas := TStringList.Create;
          Caravanas.Delimiter := ';';
          Caravanas.DelimitedText := _Arch.Strings[numLinea];
          linea := Caravanas[0];
          if (linea = 'EID') or (linea = 'Tag') or (linea = 'GES3S') then
              Result := numLinea +2;  // +2 porque el indice del stringList empieze en 0, y el archivo empieza en la fila 1.
        end;
   end;



  if (UpperCase(ext) = '.XLS') then
  begin

    if (FPrincipal.MarcaLector = 'Baqueano') then
      columna := 2
    else
      columna := 1;

    Excel := CreateOleObject('Excel.Application');
    Excel.Workbooks.Open(DireccionArch);
    planilla := Excel.Worksheets[1];

    cantFilas := planilla.UsedRange.Rows.Count;

     for numLinea := 1 to (cantFilas) do
      begin
        linea := planilla.Cells[numLinea,columna];
        if (linea = 'EID') or (linea = 'Tag') or (linea = 'Id') then
              Result := numLinea +2;
      end;

     Excel.Quit;
     Excel := Unassigned;
     planilla := Unassigned;
  end;

end;

procedure TFEveAltaMasiva.CargarDesdeExcel(DireccionArch : String);
var
  Excel, planilla : OLEVariant;
  i, indiceNuevos, indiceExistentes, cantFilas, columna: integer;
  ieActual: String;
  leidosNuevos, leidosExistentes: array of String;
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.Workbooks.Open(DireccionArch);
  planilla := Excel.Worksheets[1];

  cantFilas := planilla.UsedRange.Rows.Count;

  SetLength(leidosNuevos,0);
  SetLength(leidosExistentes,0);
  SetLength(Equivalencias,0);
  indiceNuevos :=0;
  indiceExistentes :=0;

  columna := 1;

  if (FPrincipal.MarcaLector = 'Baqueano') then
    columna:= 2;


  for i := obtenerFilaPrimerDato(DireccionArch)-1 to (cantFilas) do
    begin
      ieActual := trim(planilla.Cells[i,columna]);
      ieActual := StringReplace(ieActual, ' ', '', [rfReplaceAll]);
      UBQExisteEQ.Close;
      UBQExisteEQ.ParamByName('ie').AsString := ieActual;
      UBQExisteEQ.ParamByName('e').AsInteger := FPrincipal.EstablecimientoActual;
      UBQExisteEQ.Open;

      if UBQExisteEQ.IsEmpty then
      begin
        SetLength(leidosNuevos,indiceNuevos+1);
        leidosNuevos[indiceNuevos] := ieActual;
        Inc(indiceNuevos);
      end
      else
        begin
          SetLength(leidosExistentes,indiceExistentes+1);
          leidosExistentes[indiceExistentes] := ieActual;
          Inc(indiceExistentes);
      end;
    end;

    if Length(leidosExistentes) > 0 then
      MostrarMensaje(tmInformacion, inttostr(Length(leidosExistentes)) + '/' + inttostr(Length(leidosNuevos)+Length(leidosExistentes)) +' animales procesados ya existen en el sistema, y no se cargaran.');

    if Length(leidosNuevos) > 0 then
      begin
       for i:= 0 to Length(leidosNuevos)-1 do
        begin
          SetLength(Equivalencias,i+1);
          Equivalencias[i].IE := leidosNuevos[i];
          Equivalencias[i].RP := RightStr(leidosNuevos[i],10);
        end;
    end;

    if Length(Equivalencias) > 0 then
    begin
      cargaEQ := true;
      EACantidad.Text := IntToStr(Length(Equivalencias));
      JvECantidad.Text := IntToStr(Length(Equivalencias));
      BDBGGrillaHembras.Columns[3].Visible := true;
      BDBGGrillaHembras.Columns[3].Width := 145;
      BDBGGrillaMachos.Columns[3].Visible := true;
      BDBGGrillaMachos.Columns[3].Width := 145;
      BDBGGrillaHembras.Columns[1].Visible := true;
      BDBGGrillaHembras.Columns[1].Width := 145;
      BDBGGrillaMachos.Columns[1].Visible := true;
      BDBGGrillaMachos.Columns[1].Width := 145;
      //BDBGGrillaMachos.Columns[2].Visible := false;
      //BDBGGrillaHembras.Columns[2].visible := false;
    end;

    Excel.Quit;
    Excel := Unassigned;
    planilla := Unassigned;
end;

procedure TFEveAltaMasiva.CargarDesdeXML(arch:TFileName);
var
  gral, atrib, hijo,  animal:IXMLNode;
  atributo: string;
  cant: integer;
begin
  cant:=0;
  SetLength(Equivalencias,0);
  XMLDoc.LoadFromFile(arch);
  XMLDoc.Active := True;
  gral := XMLDoc.DocumentElement.ChildNodes.First;//este seria el nodo donde estan los datos generales
  animal := XMLDoc.DocumentElement.ChildNodes.Get(1);// Aca esta el primer animal.

  while animal<>nil do
    begin
    atrib:=animal.ChildNodes.First;
    SetLength(Equivalencias,cant+1);
    Equivalencias[cant].IE := atrib.NodeValue;
    Equivalencias[cant].RP := RightStr(atrib.NodeValue,10);
    cant:=cant+1;
    animal:= animal.NextSibling;
  end;

  if Length(Equivalencias) > 0 then
    begin
      cargaEQ := true;
      EACantidad.Text := IntToStr(Length(Equivalencias));
      JvECantidad.Text := IntToStr(Length(Equivalencias));
      BDBGGrillaHembras.Columns[3].Visible := true;
      BDBGGrillaHembras.Columns[3].Width := 145;
      BDBGGrillaMachos.Columns[3].Visible := true;
      BDBGGrillaMachos.Columns[3].Width := 145;
      BDBGGrillaHembras.Columns[1].Visible := true;
      BDBGGrillaHembras.Columns[1].Width := 145;
      BDBGGrillaMachos.Columns[1].Visible := true;
      BDBGGrillaMachos.Columns[1].Width := 145;
    end;

end;


procedure TFEveAltaMasiva.JvIEquivalenciasClick(Sender: TObject);
var
  ext : String;
  PosClick: TPoint;
begin
  GetCursorPos(PosClick);
  PMMarcasLector.Popup(PosClick.X,PosClick.Y);
  ODElectronico.Filter :=   ODElectronico.Filter + ' ' + FPrincipal.MarcaLector;
  inherited;
  if ODElectronico.Execute then
  begin
    ext := ExtractFileExt(ODElectronico.FileName);
    if UpperCase(ext) = '.TXT' then
      CargarEquivalencias(ODElectronico.FileName);
    if UpperCase(ext) = '.CSV' then
      CargarIdentVesta(ODElectronico.FileName);
    if UpperCase(ext) = '.XLS' then
      CargarDesdeExcel(ODElectronico.FileName);
    if UpperCase(ext) = '.XML' then
      CargarDesdeXML(ODElectronico.FileName);
  end;
end;

procedure TFEveAltaMasiva.JvIDispElectClick(Sender: TObject);
begin
  inherited;

  if(FPrincipal.MarcaLector = 'Allflex')then
    JvIEquivalenciasClick(Self)
  else
  try
    if ODElectronico.Execute then
    begin
      tipoEv := self.LTitulo.Caption;
      abrirArchivo(self,ODElectronico.FileName);
      importar;
      BDBGGrillaHembras.Columns[2].Visible := true;
      BDBGGrillaHembras.Columns[2].Width := 145;
      BDBGGrillaMachos.Columns[2].Visible := true;
      BDBGGrillaMachos.Columns[2].Width := 145;
      FPrincipal.IBTPrincipal.CommitRetaining;
    end;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
    PCBasico.ActivePage:=TSHDatos;
  end;
end;

procedure TFEveAltaMasiva.RetornarTopLeft(H,W,hy,wy : integer; var tope:integer; var izq:integer);
var hm, wm, hym, wym : integer;
begin
     hm := 0;
     wm := 0;
     hym := 0;
     wym := 0;
     tope := 0;
     izq := 0;

     hm := Trunc(H div 2);
     wm := Trunc(W div 2);

     hym := Trunc(hy div 2);
     wym := Trunc(wy div 2);

     tope := hm - hym;
     izq := wm - wym;

end;

procedure TFEveAltaMasiva.DisminuirPanel(gb : TPanel);
var i : integer;
    C : TComponent;
begin
    gb.Font.Size := 10;

    for i:= 0 to gb.ControlCount - 1 do
    begin
      if (gb.Controls[i].Visible) then
      begin
             if (gb.Controls[i] is TLabel) then
             begin
                  (gb.Controls[i] as TLabel).Font.Size := 9;
             end;

             if (gb.Controls[i] is TEditAuto) then
             begin
                  (gb.Controls[i] as TEditAuto).Font.Size := 9;
             end;

             if (gb.Controls[i] is TDBLookupComboBoxAuto) then
             begin
                  (gb.Controls[i] as TDBLookupComboBoxAuto).Font.Size := 9;
             end;

             if (gb.Controls[i] is TDateTimePickerAuto) then
             begin
                  (gb.Controls[i] as TDateTimePickerAuto).Font.Size := 9;
             end;

             if (gb.Controls[i] is TCheckBox) then
             begin
                  (gb.Controls[i] as TCheckBox).Font.Size := 9;
             end;

             if (gb.Controls[i] is TRadioButton) then
             begin
                  (gb.Controls[i] as TRadioButton).Font.Size := 9;
             end;

             if (gb.Controls[i] is TJvEdit) then
             begin
                  (gb.Controls[i] as TJvEdit).Font.Size := 9;
             end;
        end;
    end;
end;

procedure TFEveAltaMasiva.DisminuirGroup(gb : TGroupBox);
var i : integer;
    C : TComponent;
begin
    gb.Font.Size := 10;

    for i:= 0 to gb.ControlCount - 1 do
    begin
      if (gb.Controls[i].Visible) then
      begin
             if (gb.Controls[i] is TLabel) then
                  (gb.Controls[i] as TLabel).Font.Size := 9;

             if (gb.Controls[i] is TEditAuto) then
                  (gb.Controls[i] as TEditAuto).Font.Size := 9;

             if (gb.Controls[i] is TDBLookupComboBoxAuto) then
                  (gb.Controls[i] as TDBLookupComboBoxAuto).Font.Size := 9;

             if (gb.Controls[i] is TDateTimePickerAuto) then
                  (gb.Controls[i] as TDateTimePickerAuto).Font.Size := 9;

             if (gb.Controls[i] is TCheckBox) then
                  (gb.Controls[i] as TCheckBox).Font.Size := 9;

             if (gb.Controls[i] is TRadioButton) then
                  (gb.Controls[i] as TRadioButton).Font.Size := 9;

             if (gb.Controls[i] is TJvEdit) then
                  (gb.Controls[i] as TJvEdit).Font.Size := 9;

             if (gb.Controls[i] is TComboBox) then
                  (gb.Controls[i] as TComboBox).Font.Size := 9;
      end;
    end;
    
end;


procedure TFEveAltaMasiva.JvECantidadChange(Sender: TObject);
begin
  inherited;

  EACantidad.Text := JvECantidad.Text;
end;

procedure TFEveAltaMasiva.JvEEdadChange(Sender: TObject);
begin
  inherited;

  EAEdad.Text := JvEEdad.Text;

end;

procedure TFEveAltaMasiva.IAceptarDatosAltaClick(Sender: TObject);
var tope, izq, nuevaAltura,i : integer;
begin
  inherited;

  PAAMExcel.Visible:= false;
  PADatosAlta.Visible:= false;
  if (FPrincipal.AsistenteCargaMasiva) or (FPrincipal.AsistenteMapa) then
    PAIdentificacion.Visible:=true;

  RedibujarPanelDatosAlta;

  nuevaAltura := AlturaTotal - AlturaAcum;

  tope := 0;
  izq := 0;
  RetornarTopLeft(nuevaAltura,TSHDatos.Width,GBDecidirIdentificacion.Height,GBDecidirIdentificacion.Width,tope,izq);

  GBDecidirIdentificacion.Top := tope + AlturaAcum;
  GBDecidirIdentificacion.Left := izq;
  GBDecidirIdentificacion.Visible := true;

  EACantidad.Text := JvECantidad.Text;
  EACantidadChange(EACantidad);
  EAEdad.Text := JvEEdad.Text;

  IAceptarRpSiPres.Visible := false;
  ICuigSiPres.Visible := false;
  ICaravanasElecSiPres.Visible := false;
  IReIDSiPres.Visible := false;

  if (altaDesdeEvento) then
    begin
      ISinCaravanasClick(self);
      for i := 0 to Length(Equivalencias) - 1 do
        Equivalencias[i].RP := RightStr(equivalencias[i].IE,10);
    end;


end;

procedure TFEveAltaMasiva.RedibujarPanelDatosAlta;
begin

     IAceptarDatosAlta.Visible := false;

     DisminuirGroup(GBDatosAlta);

     GBDatosAlta.Height := 60;
     GBDatosAlta.Align := alTop;

     AlturaAcum := AlturaAcum + GBDatosAlta.Height;

     LCantidad.Top := 30;
     LCantidad.Left := primeraCL;
     JvECantidad.Top := 26;
     JvECantidad.Left := primeraCC;
     JvECantidad.Width := 53;
     LEdad.Top := 18;
     LEdad.Left := segundaCL;
     LEdad.Height := 34;
     LEdad.Width := 41;
     JvEEdad.Top := 26;
     JvEEdad.Left := segundaCC;
     JvEEdad.Width := 53;
     LMeses.Top := 30;
     LMeses.Left := 411;
     LFechadeAlta.Top := 18;
     LFechadeAlta.Left := 133;
     LFechadeAlta.Height := 37;
     LFechadeAlta.Width := 51;
     DTPAFechaAlta.Top := 26;
     DTPAFechaAlta.Left := 184;
     DTPAFechaAlta.Width := 86;
     LCatMachos.Top := 30;
     LCatMachos.Left := terceraCL;
     DBLCBACategoria.Top := 26;
     DBLCBACategoria.Left := terceraCC;
     LTipoAlta.Top := 18;
     LTipoAlta.Left := cuartaCL;
     LTipoAlta.Height := 37;
     LTipoAlta.Width := 48;
     DBLCBAtipoAlta.Top := 26;
     DBLCBAtipoAlta.Left := cuartaCC;

end;

procedure TFEveAltaMasiva.RedibujarPanelDatosIdentificacion;
begin
     IAceptarIdentificacion.Visible := false;

     GBIdentificar.Height := 95;
     DisminuirGroup(GBIdentificar);
     DisminuirPanel(GBIdentificarRP);
     DisminuirPanel(GBIdentificarSenasa);
     DisminuirPanel(GBReIdentificarSenasa);
     DisminuirPanel(GBIdentificarElectronica);
     GBIdentificar.Align := alTop;

     AlturaAcum := AlturaAcum + GBIdentificar.Height;

     GBIdentificarRP.Height := 49;
     GBIdentificarSenasa.Height := 49;
     GBReIdentificarSenasa.Height := 49;
     GBIdentificarElectronica.Height := 49;

     GBIdentificarRP.Top := 50;
     GBIdentificarSenasa.Top := 50;
     GBReIdentificarSenasa.Top := 50;
     GBIdentificarElectronica.Top := 50;

     LRpInicial.Left := 6;
     LRpInicial.Top := 6;
     GBIdentificarRP.Width := 290;

     EAPrefijo.Top := 6;
     EARpInicial.Top := 6;
     EASufijo.Top := 6;
     EARpInicial.Left := EAPrefijo.Left + EAPrefijo.Width + 4;
     EASufijo.Left := EARpInicial.Left + EARpInicial.Width + 4;

     LLeyenda.Top := EAPrefijo.Top + EAPrefijo.Height + 2;
     LLeyenda.Left := EAPrefijo.Left;

     LCuigSenasa.Left := 276;
     LReidentificacionSenasa.Left := 515;
     LCaravanasElectronicas.Left := 781;

     EACarOficial.top := 6;
     EACarOficial.Left := 97;
     EditAuto1.top := 6;
     EditAuto1.Left := 4;

     GBIdentificarSenasa.Width := 358;
     EAEncabezado.Top := 6;
     EAEncabezado.Left := 4;
     EAUltimoIdent.Top := 6;
     EAUltimoIdent.Left := EAEncabezado.Left + EAEncabezado.Width + 4;
     EAVerificador.Top := 6;
     EAVerificador.Left := EAUltimoIdent.Left + EAUltimoIdent.Width + 4;
     CBCUIGPropio.Top := 200;
     CBCUIGPropio.Left := 1;
     LCUIGPropio.Top := 8;
     LCUIGPropio.Left := EAVerificador.Left + EAVerificador.Width + 4;
     DBLCBACUIGPropio.Top := 6;
     DBLCBACUIGPropio.Left := LCUIGPropio.Left + LCUIGPropio.Width + 4;
     DBLCBACUIGPropio.Width := 70;

     Lr.Top := 6;
     EAEncabezadoReidentificacion.Top := 6;
     EAUltimoIdentReidentificacion.Top := 6;

     JvIEquivalencias.Top := 6;
     JvIEquivalencias.Left := 72;
     JvIEquivalencias.Height := JvIEquivalencias.Height - 4;
     JvIEquivalencias.Width := JvIEquivalencias.Width - 4;
end;

procedure TFEveAltaMasiva.RedibujarPanelDatosRaza;
begin

     IAceptarDatosRaza.Visible := false;
     DisminuirGroup(GBDatosRaza);

     GBDatosRaza.Height := 55;
     GBDatosRaza.Align := alTop;

     AlturaAcum := AlturaAcum + GBDatosRaza.Height;

     LRaza.Top := 21;
     LRaza.Left := primeraCL;
     LColor.Top := 21;
     LColor.Left := segundaCL;
     LSubcategoria.Top := 14;
     LSubcategoria.Left := terceraCL;
     LSubcategoria.Height := 30;
     LSubcategoria.Width := 60;
     LMocho.Top := 21;
     LMocho.Left := cuartaCL;
     DBLCBARaza.Top := 18;
     DBLCBARaza.Left := primeraCC;
     DBLCBAColor.Top := 18;
     DBLCBAColor.Left := segundaCC;
     DBLCBAColor.Width := 160;
     DBLCBASubCategoria.Top := 18;
     DBLCBASubCategoria.Left := terceraCC;
     DBLCBAMocho.Top := 18;
     DBLCBAMocho.Left := cuartaCC;
     DBLCBAMocho.Width := 154;

end;

procedure TFEveAltaMasiva.RedibujarPanelDatosUbicacion;
begin

     IAceptarUbicacion.Visible := false;
     DisminuirGroup(GBDatosUbicacion);

     GBDatosUbicacion.Height := 48;
     GBDatosUbicacion.Align := alTop;

     AlturaAcum := AlturaAcum + GBDatosRaza.Height;

     LPotrero.Top := 21;
     LRodeo.Top := 21;
     LActividad.Top := 21;
     LPotrero.Left := primeraCL;
     LRodeo.Left := segundaCL;
     LActividad.Left := terceraCL;
     DBLCBAPotrero.Top := 18;
     DBLCBAPotrero.Left := primeraCC;
     DBLCBARodeo.Top := 18;
     DBLCBARodeo.Left := segundaCC;
     DBLCBARodeo.Width := 160;
     DBLCBAActividad.Top := 18;
     DBLCBAActividad.Left := terceraCC;

end;

procedure TFEveAltaMasiva.RedibujarPanelDatosGenerales;
begin

     IAceptarDatosGenerales.Visible := false;
     DisminuirGroup(GBDatosGenerales);

     GBDatosGenerales.Height := 100;
     GBDatosGenerales.Align := alTop;

     AlturaAcum := AlturaAcum + GBDatosGenerales.Height;

//******************************************************//
//	INCIDENCIA: 401									                    //
//	INICIO Redistribución de elementos en pantalla.     //
//	Carla Gareis							              28/11/2014  //
//******************************************************//
     LPropietario.Top := 26;
     LCriador.Top := 56;
     LOrigen.Top := 26;

     LPropietario.Left := primeraCL;
     LCriador.Left := segundaCL;
     LOrigen.Left := segundaCL;

     DBLCBAPropietario.Top := 22;
     DBLCBAPropietario.Left := primeraCC;
     DBLCBACriador.Top := 22;
     DBLCBACriador.Left := segundaCC;
     DBLCBACriador.Width := 160;
     DBLCBAOrigen.Top := 52;
     DBLCBAOrigen.Left := segundaCC;

     if not(FPrincipal.FuncActividad) then
     begin
           LDta.Top := 26;
           LDta.Left := primeraCL;
           EADta.Top := 22;
           JvEADta.Top := 22;
           EADta.Left := primeraCC;
           JvEADta.Left := primeraCC;
     end
     else
     begin
           LDta.Top := 26;
           LDta.Left := terceraCL;
           EADta.Top := 22;
           JvEADta.Top := 22;
           EADta.Left := terceraCC;
           JvEADta.Left := terceraCC;
           EADta.Width := 154;
           JvEADta.Width := 154;
     end;

     LInformadoAfip.Top := 56;
     LInformadoAfip.Left := PrimeraCL;
     CBInformadoAfip.Top := 52;
     CBInformadoAfip.Left := PrimeraCC;
//******************************************************//
//	INCIDENCIA: 401									                    //
//	FIN Redistribución de elementos en pantalla.        //
//	Carla Gareis							              28/11/2014  //
//******************************************************//

end;

procedure TFEveAltaMasiva.RedibujarPanelDatosExtra;
begin

     IAceptarDatosExtra.Visible := false;
     DisminuirGroup(GBDatosExtra);

     GBDatosExtra.Height := 48;
     GBDatosExtra.Align := alTop;

     AlturaAcum := AlturaAcum + GBDatosExtra.Height;

     LInspeccion.Top := 21;
     LDestCab.Top := 21;
     LInspeccion.Left := primeraCL;
     LDestCab.Left := segundaCL;
     DBLCBAInspeccion.Top := 18;
     DBLCBAInspeccion.Left := primeraCC;
     DBLCBADestCabania.Top := 18;
     DBLCBADestCabania.Left := segundaCC;
     DBLCBADestCabania.Width := 160;

end;

procedure TFEveAltaMasiva.RedibujarPanelDatosParticulares;
begin

     IAceptarDatosParticulares.Visible := false;
     DisminuirGroup(GBDatosParticulares);

     GBDatosParticulares.Height := 50;
     GBDatosParticulares.Align := alTop;

     AlturaAcum := AlturaAcum + GBDatosParticulares.Height;

     LEstadoR.Top := 14;
     Lcircunferencia.Top := 14;
     LEstadoLactacion.Top := 14;
     LCastrado.Top := 21;
     LUnidades.Top := 21;
     LGdr.Top := 21;
     LEstadoR.Left := segundaCL;
     LEstadoR.Height := 31;
     LEstadoR.Width := 74;
     Lcircunferencia.Left := primeraCL;
     Lcircunferencia.Height := 29;
     Lcircunferencia.Width := 53;
     LCastrado.Left := segundaCL;
     LGdr.Left := primeraCL;
     LEstadoLactacion.Left := terceraCL;
     LEstadoLactacion.Width := 60;
     DBLCBAEstadoR.Top := 18;
     DBLCBAEstadoR.Left := segundaCC;
     DBLCBAGdr.Top := 18;
     DBLCBAGdr.Left := primeraCC;
     JEACircunferenciaEscrotal.Top := 18;
     JEACircunferenciaEscrotal.Left := primeraCC;
     LUnidades.Left := JEACircunferenciaEscrotal.Left + JEACircunferenciaEscrotal.Width + 2;
     CBCastracion.Top := 18;
     CBCastracion.Left := segundaCC;
     CBCastracion.Width := 160;
     JvEAEstadoLactacion.Top := 18;
     JvEAEstadoLactacion.Left := terceraCC;

end;

procedure TFEveAltaMasiva.RedibujarPanelDatosVarios;
begin

     IAceptarDatosVarios.Visible := false;
     DisminuirGroup(GBDatosVarios);

     GBDatosVarios.Height := 55;
     GBDatosVarios.Align := alTop;

     AlturaAcum := AlturaAcum + GBDatosParticulares.Height;

     LCondCorporal.Top := 14;
     LCronologiaD.Top := 14;
     Lpeso.Top := 21;
     LKgrs.Top := 21;
     LDias.Top := 21;
     DBLCBACondicionC.Top := 18;
     DBLCBACronologiaD.Top := 18;
     JEAPeso.Top := 18;
     DBLCBATiposPeso.Top := 18;

     LCronologiaD.Left := primeraCL;
     DBLCBACronologiaD.Left := primeraCC;
     DBLCBACronologiaD.Width := DBLCBARaza.Width;
     LCondCorporal.Left := segundaCL;
     DBLCBACondicionC.Left := segundaCC;
     Lpeso.Left := terceraCL;
     JEAPeso.Left := terceraCC;
     LKgrs.Left := JEAPeso.Left + JEAPeso.Width + 5;
     LDias.Left := cuartaCL;
     DBLCBATiposPeso.Left := cuartaCC;

end;

procedure TFEveAltaMasiva.RedibujarPanelDatosEco;
begin

     IAceptarDatosEconomicos.Visible := false;
     DisminuirGroup(GBDatosEcono);

     GBDatosEcono.Height := 55;
     GBDatosEcono.Align := alTop;

     AlturaAcum := AlturaAcum + GBDatosEcono.Height;

     LPorcentaje.Top := 14;
     LValorT.Top := 21;
     LValorT2.Top := 21;
     LSimboloPorcentaje.Top := 21;
     LGastos.Top := 21;
     LValorCompra.Top := 14;
     LValorTotal.Top := 18;
     JEAValortotal.Top := 18;
     JEAPorcentaje.Top := 18;
     JEAValorNeto.Top := 18;

     LValorT.Left := primeraCL;
     JEAValortotal.Left := JEACircunferenciaEscrotal.Left;
     JEAValortotal.Width := JEACircunferenciaEscrotal.Width;
     LValorT2.Left := JEAValortotal.Left + JEAValortotal.Width + 5;
     LPorcentaje.Left := segundaCL;
     LPorcentaje.Width := 67;
     JEAPorcentaje.Left := segundaCC;
     LSimboloPorcentaje.Left := JEAPorcentaje.Left + JEAPorcentaje.Width + 2;
     LGastos.Left := terceraCL;
     JEAValorNeto.Left := terceraCC;
     LValorCompra.Left := cuartaCL;
     LValorTotal.Left := cuartaCC;

end;

procedure TFEveAltaMasiva.IConCaravanasClick(Sender: TObject);
var
  nuevaAltura, tope, izq : integer;
  w: Integer;
begin
  inherited;
  PAIdentificacion.Visible:= false;
  if (FPrincipal.AsistenteCargaMasiva) or (FPrincipal.AsistenteMapa) then
    PADatosIndent.Visible:=true;
    
  identifica := true;

  GBDecidirIdentificacion.Visible := false;

  nuevaAltura := AlturaTotal - AlturaAcum;

  tope := 0;
  izq := 0;
  RetornarTopLeft(nuevaAltura,TSHDatos.Width,GBIdentificar.Height,GBIdentificar.Width,tope,izq);

  GBIdentificar.Top := tope;
  GBIdentificar.Left := izq;
  GBIdentificar.Visible := true;

  GBIdentificarRP.Visible := false;
  GBIdentificarSenasa.Visible := false;
  GBReIdentificarSenasa.Visible := false;
  GBIdentificarElectronica.Visible := false;

  if FPrincipal._USO_DISP then
    w := GBIdentificar.Width div 4
  else
    w := GBIdentificar.Width div 3;

  IAceptarRpNoPres.Left := (w div 2) - (IAceptarRpNoPres.Width div 2);
  IAceptarRpSiPres.Left := (w div 2) - (IAceptarRpSiPres.Width div 2);
  ICuigSiPres.Left := ((w div 2) + w) - (ICuigSiPres.Width div 2);
  ICuigNoPres.Left := ((w div 2) + w) - (ICuigNoPres.Width div 2);
  IReIDNoPres.Left := ((w div 2) + (2 * w)) - (IReIDNoPres.Width div 2);
  IReIDSiPres.Left := ((w div 2) + (2 * w)) - (IReIDSiPres.Width div 2);
  if FPrincipal._USO_DISP then
  begin
    ICaravanasElecNoPres.Left := ((w div 2) + (3 * w)) - (ICaravanasElecNoPres.Width div 2);
    ICaravanasElecSiPres.Left := ((w div 2) + (3 * w)) - (ICaravanasElecSiPres.Width div 2);
  end;

end;

procedure TFEveAltaMasiva.RedibujarPanelesIdentificacion;
begin
     if ((identRp) and (not(identElectronica))) then
     begin
        if ((not(identCUIGSenasa or identSenasa)) and (not(identReidentSenasa))) then
        begin
             if not(alineado) then
                GBIdentificarRP.Top := 56
             else
             begin
                GBIdentificarRP.Top := 50;
                GBIdentificarRP.Height := 49;
             end;

             GBIdentificarRP.Left := 399;
             GBIdentificarRP.Visible := true;
             if(not identElectronica)then
              GBIdentificarElectronica.Visible := False;
        end
        else
        begin
             if not(alineado) then
                GBIdentificarRP.Top := 56
             else
             begin
                GBIdentificarRP.Top := 50;
                GBIdentificarRP.Height := 49;
             end;

             GBIdentificarRP.Left := 211;
             GBIdentificarRP.Visible := true;
             if(not identElectronica)then
              GBIdentificarElectronica.Visible := False;
        end;
     end
     else
     begin
      if(identElectronica) then
        begin
         //GBIdentificarRP.Visible := false;
         //IAceptarRpNoPres.Visible := true;
         //IAceptarRpSiPres.Visible := false;
         GBIdentificarElectronica.Visible := True;
         GBIdentificarElectronica.Top := 56;
         GBIdentificarElectronica.Left := 500;
        end
      else
        GBIdentificarElectronica.Visible := False;
      if(identRp)then
        begin
          GBIdentificarRP.Visible := True;
          GBIdentificarRP.Left := 211;
        end
      else
        GBIdentificarRP.Visible := False;

      if(FPrincipal.Pais <> 1) and (identElectronica) and (identRp) and (identSenasa)then
        ICarOficialSiPresClick(Self);
     end;

     if ((identCUIGSenasa or identSenasa) and (not(identElectronica))) then
     begin
        if (not(identRp)) then
        begin
             if not(alineado) then
                GBIdentificarSenasa.Top := 56
             else
             begin
                GBIdentificarSenasa.Top := 50;
                GBIdentificarSenasa.Height := 49;
             end;

             GBIdentificarSenasa.Left := 399;
             GBIdentificarSenasa.Visible := true;
             if(not identElectronica)then
                GBIdentificarElectronica.Visible := False
             else
              begin
                GBIdentificarElectronica.Visible := True;
                GBIdentificarElectronica.Top := 56;
                GBIdentificarElectronica.Left := 500;
              end;
        end
        else
        begin
             if not(alineado) then
                GBIdentificarSenasa.Top := 56
             else
             begin
                GBIdentificarSenasa.Top := 50;
                GBIdentificarSenasa.Height := 49;
             end;
                
             GBIdentificarSenasa.Left := 577;
             GBIdentificarSenasa.Visible := true;
             if(not identElectronica)then
              GBIdentificarElectronica.Visible := False;
        end;
     end
     else
     begin
         //GBIdentificarSenasa.Visible := false;
         //ICuigNoPres.Visible := true;
         //ICuigSiPres.Visible := false;
         if((identElectronica))then
          begin
            GBIdentificarElectronica.Visible := True;
            GBIdentificarElectronica.Top := 56;
            GBIdentificarSenasa.Left := 211;
            GBIdentificarElectronica.Left := 500;
          end;
         if(identCUIGSenasa or identSenasa)then
          begin
            GBIdentificarSenasa.Visible := True;
            GBIdentificarSenasa.Left := 211;
          end
         else
          GBIdentificarSenasa.Visible := False;
          
         if FPrincipal.Pais <> 1 then
         begin
          ICuigNoPres.Visible := false;
         end;
     end;

     if ((identReidentSenasa) and (not(identElectronica))) then
     begin
        if (not(identRp)) then
        begin
             if not(alineado) then
                GBReIdentificarSenasa.Top := 56
             else
             begin
                GBReIdentificarSenasa.Top := 50;
                GBReIdentificarSenasa.Height := 49;
             end;
                
             GBReIdentificarSenasa.Left := 399;
             GBReIdentificarSenasa.Visible := true;
             if(not identElectronica)then
              GBIdentificarElectronica.Visible := False;
        end
        else
        begin
             if not(alineado) then
                GBReIdentificarSenasa.Top := 56
             else
             begin
                GBReIdentificarSenasa.Top := 50;
                GBReIdentificarSenasa.Height := 49;
             end;
                
             GBReIdentificarSenasa.Left := 577;
             GBReIdentificarSenasa.Visible := true;
             if(not identElectronica)then
              GBIdentificarElectronica.Visible := False;
        end;
     end
     else
     begin
        if((identElectronica))then
          begin
            GBIdentificarElectronica.Visible := True;
            GBIdentificarElectronica.Top := 56;
            GBReIdentificarSenasa.Left := 211;
            GBIdentificarElectronica.Left := 500;
          end;
         if(identReidentSenasa)then
          begin
            if(not identRp)then
              begin
                GBReIdentificarSenasa.Visible := True;
                GBReIdentificarSenasa.Left := 211;
              end;  
          end
         else
          GBReIdentificarSenasa.Visible := False;

          if FPrincipal.Pais <> 1 then
         begin
          IReIDNoPres.Visible := false;
         end;
     end;

     if ((identElectronica) and (not(identRp)) and (not(identReidentSenasa)) and (not(identCUIGSenasa or identSenasa))) then
     begin
          if not(alineado) then
             GBIdentificarElectronica.Top := 56
          else
          begin
             GBIdentificarElectronica.Top := 50;
             GBIdentificarElectronica.Height := 49;
          end;

          GBIdentificarElectronica.Left := 399;
          GBIdentificarElectronica.Visible := true;
     end
     else
     begin
      if FPrincipal._USO_DISP then
      begin
        // GBIdentificarElectronica.Visible := false;
        // ICaravanasElecNoPres.Visible := true;
        // ICaravanasElecSiPres.Visible := false;
      end;
     end;

end;

procedure TFEveAltaMasiva.LRpAnimalClick(Sender: TObject);
begin
  inherited;

  if (GBIdentificarRP.Visible) then
  begin
       identRp := false;
       RBRp.Checked := false;
  end
  else
  begin
       identRp := true;
       //identElectronica := false;
       RBRp.Checked := true;
//       EARpInicial.SetFocus;
  end;

  RBRpClick(RBRp);

  RedibujarPanelesIdentificacion;

  LRpInicial.Visible := true;
  EAPrefijo.Visible := true;
  EARpInicial.Visible := true;
  EASufijo.Visible := true;
  LLeyenda.Visible := true;

  if (ident_apretado) then
  begin
       GBIdentificarRP.Left := 1;
       GBIdentificarSenasa.Left := GBIdentificarRP.Left + GBIdentificarRP.Width;
       GBReIdentificarSenasa.Left := 519;//GBIdentificarSenasa.Left + GBIdentificarSenasa.Width;
       GBIdentificarElectronica.Left := 797;//GBReIdentificarSenasa.Left + GBReIdentificarSenasa.Width;
  end;
end;

procedure TFEveAltaMasiva.LCuigSenasaClick(Sender: TObject);
begin
  inherited;

      if (DMSoftvet.DSCUIGActual.DataSet.IsEmpty) then
      begin
          LCUIGPropioClick(nil);
          EAEncabezado.Visible := true;
          EAUltimoIdent.Visible := true;
          CBCUIGPropio.Visible := true;
          CBCUIGPropio.Checked := true;
          LCUIGPropio.Visible := true;
          DBLCBACUIGPropio.Visible := true;
          DBLCBACUIGPropioCloseUp(DBLCBACUIGPropio);
      end
      else
      begin
          CBCUIGPropio.Checked := true;
      end;

      EAEncabezado.Visible := true;
      EAUltimoIdent.Visible := true;
      CBCUIGPropio.Visible := true;
      LCUIGPropio.Visible := true;
      DBLCBACUIGPropio.Visible := false;

      if (GBIdentificarSenasa.Visible) then
      begin
          identCUIGSenasa := false;
          RBCUIGSenasa.Checked := false;
          DBLCBACUIGPropio.KeyValue := null;
          EAEncabezado.Text := '';
          EAUltimoIdent.Text := '';
          if not identrp then
            EARpInicial.Text := '';
      end
      else
      begin
          RBCUIGSenasa.Checked := true;
          identCUIGSenasa := true;
          identReidentSenasa := false;
          //identElectronica := false;
          //EAEncabezado.SetFocus;
      end;

      RBCUIGSenasaClick(RBCUIGSenasa);

      RedibujarPanelesIdentificacion;

      if (ident_apretado) then
      begin
           GBIdentificarRP.Left := 1;
           GBIdentificarSenasa.Left := GBIdentificarRP.Left + GBIdentificarRP.Width;
           GBReIdentificarSenasa.Left := 519;//GBIdentificarSenasa.Left + GBIdentificarSenasa.Width;
           GBIdentificarElectronica.Left := 797;//GBReIdentificarSenasa.Left + GBReIdentificarSenasa.Width;
      end;

end;

procedure TFEveAltaMasiva.LReidentificacionSenasaClick(Sender: TObject);
begin
  inherited;

  Lr.Visible := true;
  EAEncabezadoReidentificacion.Visible := true;
  EAUltimoIdentReidentificacion.Visible := true;

  if (GBReIdentificarSenasa.Visible) then
  begin
      identReidentSenasa := false;
      RBReidentificacionSenasa.Checked := false;
      EAEncabezadoReidentificacion.Text := '';
      EAUltimoIdentReidentificacion.Text := '';
      if not identRp then
        EARpInicial.Text := '';
  end
  else
  begin
      RBReidentificacionSenasa.Checked := true;
      identReidentSenasa := true;
      identCUIGSenasa := false;
      //identElectronica := false;
      //EAEncabezadoReidentificacion.SetFocus;
  end;

  RBReidentificacionSenasaClick(RBReidentificacionSenasa);

  RedibujarPanelesIdentificacion;

  if (ident_apretado) then
  begin
       GBIdentificarRP.Left := 1;
       GBIdentificarSenasa.Left := GBIdentificarRP.Left + GBIdentificarRP.Width;
       GBReIdentificarSenasa.Left := 519;//GBIdentificarSenasa.Left + GBIdentificarSenasa.Width;
       GBIdentificarElectronica.Left := 797;//GBReIdentificarSenasa.Left + GBReIdentificarSenasa.Width;
  end;

end;

procedure TFEveAltaMasiva.LCaravanasElectronicasClick(Sender: TObject);
begin
  inherited;

  JvIEquivalencias.Visible := true;

  if not GBIdentificarRP.Visible then
  begin
    identRp := false;
//    identCUIGSenasa := false;
  end;

  if (GBIdentificarElectronica.Visible) then
  begin
      identElectronica := false;
      RBEquivalencias.Checked := false;
  end
  else
  begin
      if(not identRp)then
        EARpInicial.EsRequerido := False;
      //identCUIGSenasa := false;
      //identReidentSenasa := false;
      identElectronica := true;
      RBEquivalencias.Checked := true;
  end;

  RBEquivalenciasClick(RBEquivalencias);

  RedibujarPanelesIdentificacion;

  if (ident_apretado) then
  begin
       GBIdentificarRP.Left := 1;
       GBIdentificarSenasa.Left := GBIdentificarRP.Left + GBIdentificarRP.Width;
       GBReIdentificarSenasa.Left := 519;//GBIdentificarSenasa.Left + GBIdentificarSenasa.Width;
       GBIdentificarElectronica.Left := 797;//GBReIdentificarSenasa.Left + GBReIdentificarSenasa.Width;
  end;

end;

procedure TFEveAltaMasiva.IAceptarIdentificacionClick(Sender: TObject);
var nuevaAltura, tope, izq, seguir : integer;
begin
  inherited;
  seguir := 1;
  if (FPrincipal.Pais = 1) then
  begin
     if ( ((GBIdentificarRP.Visible = TRUE) and (EARpInicial.Text = '')) or
       ((GBIdentificarSenasa.Visible = TRUE) and ((EAEncabezado.Text = '') or (EAUltimoIdent.Text = ''))) or
       ((GBReIdentificarSenasa.Visible = TRUE) and ((EAEncabezadoReidentificacion.Text = '') or (EAUltimoIdentReidentificacion.Text = '')))
     ) then
     begin
          MostrarMensaje(tmError,'Por favor complete el identificador');
          seguir := 0;
     end;
  end
  else
  begin
  //control para q el usuario no cometa errores al elegir los identificadores
  if (((GBIdentificarRP.Visible = TRUE) and (EARpInicial.Text = '')) or
     ((GBIdentificarSenasa.Visible = TRUE) and (EACarOficial.Visible = TRUE) AND (EACarOficial.Text = '')))
      then
  begin
       MostrarMensaje(tmError,'Por favor complete el identificador');
       seguir := 0;
  end;
  end;

  if (seguir = 1) then
  begin
    habilitarSiguiente(true);
    PADatosIndent.Visible:= false;

    if (FPrincipal.AsistenteCargaMasiva) or (FPrincipal.AsistenteMapa) then
    begin
      PAIdentificar.Visible:= true;
    end;

    alineado := true;
    ident_apretado := true;

    RedibujarPanelDatosIdentificacion;

    nuevaAltura := AlturaTotal - AlturaAcum;

    tope := 0;
    izq := 0;
    RetornarTopLeft(nuevaAltura,TSHDatos.Width,GBDatosRaza.Height,GBDatosRaza.Width,tope,izq);

    GBDatosRaza.Top := tope + AlturaAcum;
    GBDatosRaza.Left := izq;
    GBDatosRaza.Visible := true;

  if (ident_apretado) then
  begin
       GBIdentificarRP.Left := 1;
       GBIdentificarSenasa.Left := GBIdentificarRP.Left + GBIdentificarRP.Width;
       GBReIdentificarSenasa.Left := GBIdentificarSenasa.Left + GBIdentificarSenasa.Width;
       GBIdentificarElectronica.Left := GBReIdentificarSenasa.Left + GBReIdentificarSenasa.Width;
  end;

  DBLCBAMocho.KeyValue := 0;
end;
end;

procedure TFEveAltaMasiva.IAceptarDatosRazaClick(Sender: TObject);
var nuevaAltura, tope, izq : integer;
begin
  inherited;

  PAIdentificar.Visible:= false;
  PANoIdentificar.Visible:= false;
  if (FPrincipal.AsistenteCargaMasiva) or (FPrincipal.AsistenteMapa) then
    PADatosUbicacion.Visible:=true;

  alineado := true;

  RedibujarPanelDatosRaza;

  nuevaAltura := AlturaTotal - AlturaAcum;

  tope := 0;
  izq := 0;
  RetornarTopLeft(nuevaAltura,TSHDatos.Width,GBDatosUbicacion.Height,GBDatosUbicacion.Width,tope,izq);

  GBDatosUbicacion.Top := tope + AlturaAcum;
  GBDatosUbicacion.Left := izq;
  GBDatosUbicacion.Visible := true;

  DBLCBARodeo.KeyValue := 0;

end;

procedure TFEveAltaMasiva.IAceptarUbicacionClick(Sender: TObject);
var nuevaAltura, tope, izq : integer;
begin
  inherited;

  PADatosUbicacion.Visible:= false;
  if (FPrincipal.AsistenteCargaMasiva) or (FPrincipal.AsistenteMapa) then
    PADatosGral.Visible:= true;

  alineado := true;

  RedibujarPanelDatosUbicacion;

  nuevaAltura := AlturaTotal - AlturaAcum;

  tope := 0;
  izq := 0;
  RetornarTopLeft(nuevaAltura,TSHDatos.Width,GBDatosGenerales.Height,GBDatosGenerales.Width,tope,izq);

  GBDatosGenerales.Top := tope + AlturaAcum;
  GBDatosGenerales.Left := izq;
  GBDatosGenerales.Visible := true;

  if not(FPrincipal.FuncActividad) then
  begin
        LDta.Left := 380;
        EADta.Left := LDta.Left + LDta.Width + 4;
        JvEADta.Left := LDta.Left + LDta.Width + 4;
  end;

end;

procedure TFEveAltaMasiva.IAceptarDatosGeneralesClick(Sender: TObject);
var nuevaAltura, tope, izq, cod : integer;
begin
  inherited;

  cod := DBLCBACategoria.KeyValue;

  PADatosGral.visible:= false;
  if (FPrincipal.AsistenteCargaMasiva) or (FPrincipal.AsistenteMapa) then
   begin
       case cod  of
         1,2: PAParticularTerNov.Visible:= true;
         3: PAParticularToro.Visible:= true;
         4: PATernera.Visible:= true;
         5,6: PAVacaVaquillona.Visible:= true;
       end;

   end;

  alineado := true;

  RedibujarPanelDatosGenerales;

  nuevaAltura := AlturaTotal - AlturaAcum;

  tope := 0;
  izq := 0;

  if (mostrarEspecificos) then
  begin
      RetornarTopLeft(nuevaAltura,TSHDatos.Width,GBDatosExtra.Height,GBDatosExtra.Width,tope,izq);

      GBDatosExtra.Top := tope + AlturaAcum;
      GBDatosExtra.Left := izq;
      GBDatosExtra.Visible := true;

      DBLCBAInspeccion.KeyValue := 0;
      DBLCBADestCabania.KeyValue := 0;
  end
  else
  begin
       IAceptarDatosExtraClick(Sender);
  end;

end;

procedure TFEveAltaMasiva.IAceptarDatosExtraClick(Sender: TObject);
var nuevaAltura, tope, izq : integer;
begin
  inherited;

  alineado := true;

  RedibujarPanelDatosExtra;

  nuevaAltura := AlturaTotal - AlturaAcum;

  tope := 0;
  izq := 0;
  RetornarTopLeft(nuevaAltura,TSHDatos.Width,GBDatosParticulares.Height,GBDatosParticulares.Width,tope,izq);

  GBDatosParticulares.Top := tope + AlturaAcum;
  GBDatosParticulares.Left := izq;
  GBDatosParticulares.Visible := true;

  Lcircunferencia.Visible := false;
  EACircunferenciaEscrotal.Visible := false;
  JEACircunferenciaEscrotal.Visible := false;
  LUnidades.Visible := false;
  LCastrado.Visible := false;
  CBCastracion.Visible := false;
  LEstadoR.Visible := false;
  DBLCBAEstadoR.Visible := false;
  LGdr.Visible := false;
  DBLCBAGdr.Visible := false;

  if (CBSexo.ItemIndex = 0) then
  begin
       Lcircunferencia.Visible := true;
       JEACircunferenciaEscrotal.Visible := true;
       LUnidades.Visible := true;
       LCastrado.Visible := true;
       CBCastracion.Visible := true;
       CBCastracion.ItemIndex := 0;
  end;

  if (CBSexo.ItemIndex = 1) then
  begin
       LEstadoR.Visible := true;
       DBLCBAEstadoR.Visible := true;
       LGdr.Visible := true;
       DBLCBAGdr.Visible := true;
  end;

end;

procedure TFEveAltaMasiva.IAceptarDatosParticularesClick(Sender: TObject);
var nuevaAltura, tope, izq : integer;
begin
  inherited;
  PAVacaVaquillona.Visible:= false;
  PATernera.Visible:= false;
  PAParticularToro.Visible:= false;
  PAParticularTerNov.Visible:= false;

  if (FPrincipal.AsistenteCargaMasiva) or (FPrincipal.AsistenteMapa) then
    PADatosCom.Visible:= true;
  alineado := true;

  EAEstadoLactacion.Visible := false;

  RedibujarPanelDatosParticulares;

  nuevaAltura := AlturaTotal - AlturaAcum;

  tope := 0;
  izq := 0;
  RetornarTopLeft(nuevaAltura,TSHDatos.Width,GBDatosVarios.Height,GBDatosVarios.Width,tope,izq);

  GBDatosVarios.Top := tope + AlturaAcum;
  GBDatosVarios.Left := izq;
  GBDatosVarios.Visible := true;
  CBCondicionCorporal.Checked := true;

end;

procedure TFEveAltaMasiva.IAceptarDatosVariosClick(Sender: TObject);
var nuevaAltura, tope, izq : integer;
begin
  inherited;
  PADatosCom.Visible:= false;
  if (FPrincipal.AsistenteCargaMasiva) or (FPrincipal.AsistenteMapa) then
    PADatosEcon.Visible:= true;
  alineado := true;

  RedibujarPanelDatosVarios;

  nuevaAltura := AlturaTotal - AlturaAcum;

  tope := 0;
  izq := 0;
  //RetornarTopLeft(nuevaAltura,TSHDatos.Width,GBDatosEcono.Height,GBDatosEcono.Width,tope,izq);

  //GBDatosEcono.Top := tope + AlturaAcum;
  //GBDatosEcono.Left := izq;
  //GBDatosEcono.Visible := true;

  RedibujarPanelDatosEco;
  GBDatosEcono.Align := alClient;
  GBDatosEcono.Visible := true;
  IAceptarDatosEconomicos.Visible := false;

end;

procedure TFEveAltaMasiva.IAceptarDatosEconomicosClick(Sender: TObject);
begin
  inherited;
  alineado := true;

  RedibujarPanelDatosEco;

  ASiguienteExecute(sender);
end;

procedure TFEveAltaMasiva.JEAValorNetoChange(Sender: TObject);
begin
  inherited;

  EAValorNeto.Text := JEAValorNeto.Text;
  ActualizarValor(EAValorNeto);
end;

procedure TFEveAltaMasiva.JEAPorcentajeChange(Sender: TObject);
begin
  inherited;

  EAPorcentaje.Text := JEAPorcentaje.Text;
  ActualizarValor(EAPorcentaje);
end;

procedure TFEveAltaMasiva.JEAValortotalChange(Sender: TObject);
begin
  inherited;

  EAValortotal.Text := JEAValortotal.Text;
  ActualizarValor(EAValortotal);
end;

procedure TFEveAltaMasiva.JEAPesoChange(Sender: TObject);
begin
  inherited;

  EAPeso.Text := JEAPeso.Text;
  EAPesoChange(EAPeso);
end;

procedure TFEveAltaMasiva.JEACircunferenciaEscrotalChange(Sender: TObject);
begin
  inherited;

  EACircunferenciaEscrotal.Text := JEACircunferenciaEscrotal.Text;
end;

procedure TFEveAltaMasiva.CBCastracionChange(Sender: TObject);
begin
  inherited;

  if (CBCastracion.Text = 'CASTRADO') then
    CBCastrado.Checked := true;

  if ((CBCastracion.Text = 'SIN CASTRAR') or (CBCastracion.Text = 'NO DEFINIDO')) then
    CBCastrado.Checked := false;
    
end;

procedure TFEveAltaMasiva.LInspeccionClick(Sender: TObject);
var abm:TFABMInspeccion;
begin
  inherited;
 if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      abm := TFABMInspeccion.Create(self);
      abm.Abrir(faAbm);
      //FPrincipal.AbrirFormNormal(TFABMOrigen.Create(Self));
      DMSoftvet.DSInspeccion.DataSet.Close;
      DMSoftvet.DSInspeccion.DataSet.Open;
      if nroID>-1 then
        begin
        DBLCBAInspeccion.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBAInspeccion);
        end;
    end;
end;

procedure TFEveAltaMasiva.LInspeccionMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LInspeccion.Font.Color:= $00606C02;
      LInspeccion.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LInspeccionMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LInspeccion.Font.Color:= clWindowText;
      LInspeccion.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LDestCabClick(Sender: TObject);
var abm:TFABMDestCabania;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      abm:=TFABMDestCabania.Create(Self);
      abm.abrir(faAbm);
      //FPrincipal.AbrirFormNormal(TFABMActividad.Create(Self));
      DMSoftvet.DSCodDestCabania.DataSet.Close;
      DMSoftvet.DSCodDestCabania.DataSet.Open;
      if nroID>-1 then
      begin
        DBLCBADestCabania.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBADestCabania);
      end;
  end;
end;

procedure TFEveAltaMasiva.LDestCabMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LDestCab.Font.Color:= $00606C02;
      LDestCab.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.LDestCabMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LDestCab.Font.Color:= clWindowText;
      LDestCab.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.ISubirIzqClick(Sender: TObject);
begin
  inherited;
   if (IBarraHorDer.Top > IBarraVertDer.Top) then
   begin
      EnTope := false;

      Dec(Posicion);

      if (PCGrillas.ActivePage = TSHembras) then
      begin
        BDBGGrillaHembras.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
        BDBGGrillaHembras.SelectedRows.CurrentRowSelected := false;
        BDBGGrillaHembras.DataSource.DataSet.Prior;
        BDBGGrillaHembras.SetFocus;

        regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo;

        IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(posicion-1));
        IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(posicion-1));
      end;

      if (PCGrillas.ActivePage = TSMachos) then
      begin
        BDBGGrillaMachos.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
        BDBGGrillaMachos.SelectedRows.CurrentRowSelected := false;
        BDBGGrillaMachos.DataSource.DataSet.Prior;
        BDBGGrillaMachos.SetFocus;

        regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo;

        IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(posicion-1));
        IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(posicion-1));
      end;
   end
   else
       EnTope := true;
end;

procedure TFEveAltaMasiva.IBajarIzqClick(Sender: TObject);
var aux : integer;
begin
  inherited;

  EnTope := false;

  aux := IBarraVertDer.Top + IBarraVertDer.Height - IBarraHorDer.Height;

  if (IBarraHorDer.Top < aux) then
  begin
    Inc(Posicion);

    if (PCGrillas.ActivePage = TSHembras) then
    begin
      BDBGGrillaHembras.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

      BDBGGrillaHembras.SelectedRows.CurrentRowSelected := false;
      BDBGGrillaHembras.DataSource.DataSet.Next;
      BDBGGrillaHembras.SetFocus;

      regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo;

      IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*posicion);
      IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*posicion);
    end;

    if (PCGrillas.ActivePage = TSMachos) then
    begin
      BDBGGrillaMachos.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

      BDBGGrillaMachos.SelectedRows.CurrentRowSelected := false;
      BDBGGrillaMachos.DataSource.DataSet.Next;
      BDBGGrillaMachos.SetFocus;

      regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo;

      IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*posicion);
      IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*posicion);
    end;
  end;
end;

procedure TFEveAltaMasiva.ISubirDerClick(Sender: TObject);
begin
   inherited;
   if (IBarraHorDer.Top > IBarraVertDer.Top) then
   begin
      EnTope := false;

      Dec(Posicion);

      if (PCGrillas.ActivePage = TSHembras) then
      begin
        BDBGGrillaHembras.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

        BDBGGrillaHembras.SelectedRows.CurrentRowSelected := false;
        BDBGGrillaHembras.DataSource.DataSet.Prior;
        BDBGGrillaHembras.SetFocus;

        regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo;

        IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo);
        IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo);
      end
      else
      begin
        BDBGGrillaMachos.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

        BDBGGrillaMachos.SelectedRows.CurrentRowSelected := false;
        BDBGGrillaMachos.DataSource.DataSet.Prior;
        BDBGGrillaMachos.SetFocus;

        regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo;

        IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo);
        IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo);
      end;
   end
   else
       EnTope := true;
end;

procedure TFEveAltaMasiva.IBajarDerClick(Sender: TObject);
var aux : integer;
begin
  inherited;

  EnTope := false;

  aux := IBarraVertDer.Top + IBarraVertDer.Height - IBarraHorDer.Height;

  if (IBarraHorDer.Top < aux) then
  begin
    Inc(Posicion);

    if (PCGrillas.ActivePage = TSHembras) then
    begin
        BDBGGrillaHembras.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

        BDBGGrillaHembras.SelectedRows.CurrentRowSelected := false;
        BDBGGrillaHembras.DataSource.DataSet.Next;
        BDBGGrillaHembras.SetFocus;

        regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo;

        IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo);
        IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo);
    end
    else
    begin
        BDBGGrillaMachos.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

        BDBGGrillaMachos.SelectedRows.CurrentRowSelected := false;
        BDBGGrillaMachos.DataSource.DataSet.Next;
        BDBGGrillaMachos.SetFocus;

        regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo;

        IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo);
        IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo);
    end;
  end;
end;

procedure TFEveAltaMasiva.IBarraHorDerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  with TImage(Sender) do
  begin

        IniP := ClientToScreen (Point(X, Y));
        IniPos := Point (Left, Top);
        PosAnt := IniPos.Y;

        Pressed := true;
  end;
end;

procedure TFEveAltaMasiva.IBarraHorDerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var P : TPoint;
    aux : integer;
begin

  if Pressed then
  begin
      with TShape(Sender) do
      begin
          P := ClientToScreen (Point(X, Y));
          Top := IniPos.Y + P.Y - IniP.Y;

          if ((Sender as TImage).Name = 'IBarraHorDer') then
              IBarraHorIzq.Top := Top;

          if ((Sender as TImage).Name = 'IBarraHorIzq') then
              IBarraHorDer.Top := Top;

          aux := (IBarraVertDer.Top + IBarraVertDer.Height) - IBarraHorDer.Height - 1;

          if ((top >= IBarraVertIzq.Top) and (top <= aux)) then
          begin
              if (PCGrillas.ActivePage = TSHembras) then
              begin
                BDBGGrillaHembras.DataSource.DataSet.RecNo := GetPosicionGrilla(top);
                regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo;
              end
              else
              begin
                BDBGGrillaMachos.DataSource.DataSet.RecNo := GetPosicionGrilla(top);
                regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo;
              end;

          end
          else
          begin
              pressed := false;
              if (top >= IBarraVertIzq.Top) then
              begin
                  IBarraHorIzq.Top := IniBHoriz;
                  IBarraHorDer.Top := IniBHoriz;
              end
              else
              begin
                  IBarraHorIzq.Top := FinBHoriz-9;
                  IBarraHorDer.Top := FinBHoriz-9;
              end;
          end;

          EnTope := (top = IBarraVertIzq.Top);
      end;
  end;

end;

function TFEveAltaMasiva.GetPosicionPanel(reg : integer) : integer;
var x1, x0, x11, x00, xp, xpp : integer;
    aux1, aux2, aux3, aux4 : double;
begin

     x0 := IBarraVertDer.Top;
     x1 := IBarraVertDer.Top + IBarraVertDer.Height;

     x00 := 1;
     x11 := SBBarrita.Max;
     xpp := reg;

     aux1 := (x11 - xpp);
     aux2 := (x11 - x00);
     aux3 := (x1 - x0);
     aux4 := (aux1 / aux2);

     if (reg = 1) then aux4 := 1;
     if (reg = SBBarrita.Max) then aux4 := 0;

     xp := x1 - Trunc(aux4*aux3);

     if (reg = SBBarrita.Max) then xp := xp - IBarraHorDer.Height;

     Result := xp;

end;

function TFEveAltaMasiva.GetPosicionGrilla(top : integer) : integer;
var x1, x0, x11, x00, xp, xpp : integer;
    aux1, aux2, aux3, aux4 : double;
begin

     x0 := IBarraVertDer.Top;
     x1 := IBarraVertDer.Top + IBarraVertDer.Height;

     x00 := 1;
     x11 := SBBarrita.Max;

     xp := top;

     aux1 := (x1 - xp);
     aux2 := (x1 - x0);
     aux3 := (x11 - x00);
     aux4 := (aux1 / aux2);

     xpp := x11 - Trunc(aux4*aux3);

     Result := xpp;

end;

function TFEveAltaMasiva.GetNavegacion(valor : integer) : integer;
var x1, x0, x11, x00, xp, xpp : integer;
    aux1, aux2, aux3, aux4 : double;
begin

     x0 := 1;
     x1 := 287;

     x00 := IniBHoriz;
     x11 := FinBHoriz;

     xp := valor;

     aux1 := (x1 - xp);
     aux2 := (x1 - x0);
     aux3 := (x11 - x00);
     aux4 := (aux1 / aux2);

     xpp := x11 - Trunc(aux4*aux3);

     Result := xpp;

end;


procedure TFEveAltaMasiva.IBarraVertIzqMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  BotonPulsado := not (BotonPulsado);

  while BotonPulsado do
  begin
      posXT := X;
      posYT := Y; 

      TimerBarra.Enabled := true;
      Application.ProcessMessages;
  end;

end;

procedure TFEveAltaMasiva.IBarraVertIzqMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  BotonPulsado := false;
  TimerBarra.Enabled := false;

end;

procedure TFEveAltaMasiva.IBarraHorIzqMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  with TImage(Sender) do
  begin

        IniP := ClientToScreen (Point(X, Y));
        IniPos := Point (Left, Top);
        PosAnt := IniPos.Y;

        Pressed := true;
  end;

end;

procedure TFEveAltaMasiva.IBarraHorIzqMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var P : TPoint;
    aux : integer;
begin

  if Pressed then
  begin
      with TShape(Sender) do
      begin
          P := ClientToScreen (Point(X, Y));
          Top := IniPos.Y + P.Y - IniP.Y;

          if ((Sender as TImage).Name = 'IBarraHorDer') then
              IBarraHorIzq.Top := Top;

          if ((Sender as TImage).Name = 'IBarraHorIzq') then
              IBarraHorDer.Top := Top;

          aux := (IBarraVertDer.Top + IBarraVertDer.Height) - IBarraHorDer.Height - 1;

          if ((top >= IBarraVertIzq.Top) and (top <= aux)) then
          begin
              if (PCGrillas.ActivePage = TSHembras) then
              begin
                  BDBGGrillaHembras.DataSource.DataSet.RecNo := GetPosicionGrilla(top);
                  regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo;
              end
              else
              begin
                  BDBGGrillaMachos.DataSource.DataSet.RecNo := GetPosicionGrilla(top);
                  regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo;
              end;
          end
          else
          begin
              pressed := false;
              if (top >= IBarraVertIzq.Top) then
              begin
                  IBarraHorIzq.Top := IniBHoriz;
                  IBarraHorDer.Top := IniBHoriz;
              end
              else
              begin
                  IBarraHorIzq.Top := FinBHoriz-9;
                  IBarraHorDer.Top := FinBHoriz-9;
              end;
          end;

          EnTope := (top = IBarraVertIzq.Top);
      end;
  end;

end;

procedure TFEveAltaMasiva.IBarraHorIzqMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Pressed := FALSE;
end;

procedure TFEveAltaMasiva.ISinCaravanasClick(Sender: TObject);
var nuevaAltura, tope, izq, i : integer;
begin
  inherited;
  EACarOficial.EsRequerido := false;
  PAIdentificacion.Visible:= false;
  if (FPrincipal.AsistenteCargaMasiva) or (FPrincipal.AsistenteMapa) then
    PANoIdentificar.Visible:=true;

  identifica := false;

  alineado := true;

  GBDecidirIdentificacion.Visible := false;

  nuevaAltura := AlturaTotal - AlturaAcum;

  tope := 0;
  izq := 0;
  RetornarTopLeft(nuevaAltura,TSHDatos.Width,GBDatosRaza.Height,GBDatosRaza.Width,tope,izq);

  GBDatosRaza.Top := tope + AlturaAcum;
  GBDatosRaza.Left := izq;
  GBDatosRaza.Visible := true;

  identRp := true;
  RBRp.Checked := true;
  EARpInicial.Text := 'N/N';
  //  *.*.* Prueba Ivan Alta Masiva desde evento
  if (altaDesdeEvento) then
    for i := 0 to Length(Equivalencias) - 1 do
      Equivalencias[i].RP := RightStr(equivalencias[i].IE,10);


 //   JvTerminar.Visible := true;
 //   end;
  EARpInicialChange(EARpInicial);

  DBLCBAMocho.KeyValue := 0;

end;

procedure TFEveAltaMasiva.JvEAEstadoLactacionChange(Sender: TObject);
begin
  inherited;

  EAEstadoLactacion.Text := JvEAEstadoLactacion.Text;

  EAEstadoLactacionChange(EAEstadoLactacion);
end;

procedure TFEveAltaMasiva.CalcularIncremento(valor : integer);
begin
     if (valor < IBarraVertDer.Height) then
       Increment := IBarraVertDer.Height div valor
     else
       Increment := valor div IBarraVertDer.Height;

     if (Increment = 0) then Increment := 1;
end;

procedure TFEveAltaMasiva.AjustarPanelesLaterales;
var mitad : integer;
begin

     mitad := PanelIzq.Height div 2;

     IBarraHorIzq.Top := mitad - 4 - 138;
     IBarraHorDer.Top := mitad - 4 - 138;

     IBarraVertIzq.Top := mitad - 4 - 138;
     IBarraVertDer.Top := mitad - 4 - 138;

     ISubirIzq.Top := mitad - 4 - 192;
     ISubirDer.Top := mitad - 4 - 192;

     IBajarIzq.Top := mitad + 4 + 147;
     IBajarDer.Top := mitad + 4 + 147;

     IniBHoriz := IBarraVertIzq.Top;
     FinBHoriz := IBarraVertIzq.Top + IBarraVertIzq.Height;

end;


procedure TFEveAltaMasiva.TimerBarraTimer(Sender: TObject);
var a, i, aux, vtop : integer;
    pt, P : TPoint;
begin
      inherited;

      vtop := GetNavegacion(posYT);

      //LVista.Caption := ' CoorY: ' + IntToStr(posYT) + ' vtop: ' + IntToStr(vtop);

      if ((EnTope) or ((IBarraHorIzq.Top >= IniBHoriz) and ((IBarraHorIzq.Top + 9) <= FinBHoriz))) then
      begin
        if (vtop >= IBarraHorIzq.Top) then
        begin
            if (regActual <= SBBarrita.Max) then
            begin
                Inc(Posicion);

                if (PCGrillas.ActivePage = TSHembras) then
                begin
                    BDBGGrillaHembras.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
                    BDBGGrillaHembras.SelectedRows.CurrentRowSelected := false;
                    BDBGGrillaHembras.DataSource.DataSet.Next;
                    regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo;

                    IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo);
                    IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo);

                    //BDBGSimple.SetFocus;
                end;

                if (PCGrillas.ActivePage = TSMachos) then
                begin
                    BDBGGrillaMachos.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
                    BDBGGrillaMachos.SelectedRows.CurrentRowSelected := false;
                    BDBGGrillaMachos.DataSource.DataSet.Next;
                    regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo;

                    IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo);
                    IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo);

                    //BDBGSimple.SetFocus;
                end;

            end;
        end
        else
        begin
            if (regActual >= SBBarrita.Min) then
            begin
                Dec(Posicion);

                if (PCGrillas.ActivePage = TSHembras) then
                begin
                    BDBGGrillaHembras.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
                    BDBGGrillaHembras.SelectedRows.CurrentRowSelected := false;
                    BDBGGrillaHembras.DataSource.DataSet.Prior;

                    regActual := BDBGGrillaHembras.DataSource.DataSet.RecNo;
                    IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(Posicion-1));
                    IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaHembras.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(Posicion-1));

                    //BDBGSimple.SetFocus;
                end;

                if (PCGrillas.ActivePage = TSMachos) then
                begin
                    BDBGGrillaMachos.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
                    BDBGGrillaMachos.SelectedRows.CurrentRowSelected := false;
                    BDBGGrillaMachos.DataSource.DataSet.Prior;

                    regActual := BDBGGrillaMachos.DataSource.DataSet.RecNo;
                    IBarraHorIzq.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(Posicion-1));
                    IBarraHorDer.Top := GetPosicionPanel(BDBGGrillaMachos.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(Posicion-1));

                    //BDBGSimple.SetFocus;
                end;

            end;
        end;
      end;

end;

procedure TFEveAltaMasiva.LimpiarGroups;
var tope, izq : integer;
begin

  alineado := false;
  identRp := false;
  identCUIGSenasa := false;
  identReidentSenasa := false;
  identElectronica := false;

  GBDecidirIdentificacion.Align := alNone;
  GBDecidirIdentificacion.Visible := false;
  GBIdentificar.Align := alNone;
  GBIdentificar.Visible := false;
  GBDatosRaza.Align := alNone;
  GBDatosRaza.Visible := false;
  GBDatosUbicacion.Align := alNone;
  GBDatosUbicacion.Visible := false;
  GBDatosGenerales.Align := alNone;
  GBDatosGenerales.Visible := false;
  GBDatosExtra.Align := alNone;
  GBDatosExtra.Visible := false;
  GBDatosParticulares.Align := alNone;
  GBDatosParticulares.Visible := false;
  GBDatosVarios.Align := alNone;
  GBDatosVarios.Visible := false;
  GBDatosEcono.Align := alNone;
  GBDatosEcono.Visible := false;

  AlturaTotal := 510;
  AlturaAcum := 0;

  GBDatosAlta.Align := alNone;
  GBDatosAlta.Visible := false;

  GBDatosAlta.Visible := true;
  GBDatosAlta.Height := 230;
  GBDatosAlta.Width := 675;
  LCantidad.Top := 50;
  LCantidad.Left := 48;
  LCantidad.Font.Size := 13;
  JvECantidad.Top := 46;
  JvECantidad.Left := 155;
  JvECantidad.Font.Size := 13;
  LEdad.Top := 100;
  LEdad.Left := 48;
  LEdad.Font.Size := 13;
  JvEEdad.Top := 96;
  JvEEdad.Left := 155;
  JvEEdad.Font.Size := 13;
  LFechadeAlta.Top := 150;
  LFechadeAlta.Left := 48;
  LFechadeAlta.Font.Size := 13;
  DTPAFechaAlta.Top := 146;
  DTPAFechaAlta.Left := 155;
  DTPAFechaAlta.Font.Size := 13;
  LMeses.Top := 100;
  LMeses.Left := 267;
  LMeses.Font.Size := 13;
  LCatMachos.Top := 100;
  LCatMachos.Left := 351;
  LCatMachos.Font.Size := 13;
  DBLCBACategoria.Top := 96;
  DBLCBACategoria.Left := 447;
  DBLCBACategoria.Font.Size := 13;
  LTipoAlta.Top := 150;
  LTipoAlta.Left := 351;
  LTipoAlta.Font.Size := 13;
  DBLCBAtipoAlta.Top := 146;
  DBLCBAtipoAlta.Left := 447;
  DBLCBAtipoAlta.Font.Size := 13;
  IAceptarDatosAlta.Top := 184;
  IAceptarDatosAlta.Left := 176;
  IAceptarDatosAlta.Visible := true;

  RetornarTopLeft(AlturaTotal,TSHDatos.Width,GBDatosAlta.Height,GBDatosAlta.Width,tope,izq);

  GBDatosAlta.Top := tope;
  GBDatosAlta.Left := izq;

end;

procedure TFEveAltaMasiva.IAceptarRpNoPresClick(Sender: TObject);
begin
  inherited;

  IAceptarRpNoPres.Visible := false;
  IAceptarRpSiPres.Visible := true;

  //if(not GBIdentificarSenasa.Visible)then
  //  EACarOficial.EsRequerido := false;
    
  EARpInicial.EsRequerido := True;
  if(EACarOficial.GetDato <> null)then
    EARpInicial.Text := EACarOficial.GetDato;

  LRpAnimalClick(Sender);

end;

procedure TFEveAltaMasiva.IAceptarRpSiPresClick(Sender: TObject);
begin
  inherited;

  IAceptarRpNoPres.Visible := true;
  IAceptarRpSiPres.Visible := false;

 // if((GBIdentificarSenasa.Visible) and (FPrincipal.Pais <> 1))then
 //   EARpInicial.EsRequerido := False;  

  
  LRpAnimalClick(Sender);

  EAEncabezadoChange(EAEncabezado);
  EAUltimoIdentChange(EAUltimoIdent);
  EAEncabezadoReidentificacionChange(EAEncabezadoReidentificacion);
  EAUltimoIdentReidentificacionChange(EAUltimoIdentReidentificacion);

  if((GBIdentificarSenasa.Visible) and (FPrincipal.Pais <> 1))then
    if(EACarOficial.GetDato <> null)then
      EARpInicial.Text := EACarOficial.GetDato;  
  
end;

procedure TFEveAltaMasiva.ICuigNoPresClick(Sender: TObject);
begin
  inherited;

  // Mariano 04/10/2016
  if not GBIdentificarRP.Visible then
  begin
    identRp := false;
    identCUIGSenasa := false;
  end;

  ICuigNoPres.Visible := false;
  ICuigSiPres.Visible := true;

  if(FPrincipal.Pais = 1)then
    EACarOficial.EsRequerido := False;  

  LCuigSenasaClick(Sender);

  EAUltimoIdent.SetFocus;
  EAEncabezado.SetFocus;
end;

procedure TFEveAltaMasiva.ICuigSiPresClick(Sender: TObject);
begin
  inherited;

  ICuigNoPres.Visible := true;
  ICuigSiPres.Visible := false;

  LCuigSenasaClick(Sender);

end;

procedure TFEveAltaMasiva.ICarOficialNoPresClick(Sender: TObject);
begin
  inherited;
  ICarOficialNoPres.Visible := false;
  ICarOficialSiPres.Visible := true;

  EACarOficial.Visible := True;
  EditAuto1.Visible := True;
  EACarOficial.EsRequerido := not EACarOficial.EsRequerido;
  EACarOficial.Text := '';

  if(not GBIdentificarRP.Visible)then
    EARpInicial.EsRequerido := False;

  if (GBIdentificarSenasa.Visible) then
  begin
      identSenasa := false;
  end
  else
  begin
      identSenasa := true;
      identReidentSenasa := false;
      //identElectronica := false;
  end;

  RedibujarPanelesIdentificacion;

  if (ident_apretado) then
  begin
       GBIdentificarRP.Left := 1;
       GBIdentificarSenasa.Left := GBIdentificarRP.Left + GBIdentificarRP.Width;
       GBReIdentificarSenasa.Left := 519;//GBIdentificarSenasa.Left + GBIdentificarSenasa.Width;
       GBIdentificarElectronica.Left := 797;//GBReIdentificarSenasa.Left + GBReIdentificarSenasa.Width;
  end;
  EACarOficial.SetFocus;
  EditAuto1.SetFocus;  
end;

procedure TFEveAltaMasiva.ICarOficialSiPresClick(Sender: TObject);
begin
  inherited;
  ICarOficialNoPres.Visible := true;
  ICarOficialSiPres.Visible := false;

  //LCuigSenasaClick(Sender);
  EACarOficial.Visible := True;
  EACarOficial.EsRequerido := not EACarOficial.EsRequerido;
  EACarOficial.Text := '';

  if(GBIdentificarRP.Visible)then
    begin
      //EACarOficial.EsRequerido := not EACarOficial.EsRequerido;
      EARpInicial.SetFocus;
      EAPrefijo.SetFocus;
    end;

  if (GBIdentificarSenasa.Visible) then
  begin
      identSenasa := false;

  end
  else
  begin

      identSenasa := true;
      identReidentSenasa := false;
      identElectronica := false;

  end;

  RedibujarPanelesIdentificacion;

  if (ident_apretado) then
  begin
       GBIdentificarRP.Left := 1;
       GBIdentificarSenasa.Left := GBIdentificarRP.Left + GBIdentificarRP.Width;
       GBReIdentificarSenasa.Left := 519;//GBIdentificarSenasa.Left + GBIdentificarSenasa.Width;
       GBIdentificarElectronica.Left := 797;//GBReIdentificarSenasa.Left + GBReIdentificarSenasa.Width;
  end;

end;

procedure TFEveAltaMasiva.ICaravanasElecSiPresClick(Sender: TObject);
begin
  inherited;

  ICaravanasElecNoPres.Visible := true;
  ICaravanasElecSiPres.Visible := false;

  LCaravanasElectronicasClick(Sender);
end;

procedure TFEveAltaMasiva.ICaravanasElecNoPresClick(Sender: TObject);
begin
  inherited;

  ICaravanasElecNoPres.Visible := false;
  ICaravanasElecSiPres.Visible := true;

  LCaravanasElectronicasClick(Sender);

  if(FPrincipal.Pais <> 1)then
    begin
      if(GBIdentificarRP.Visible)then
        begin
          EARpInicial.SetFocus;
          EAPrefijo.SetFocus;
        end;
      if(GBIdentificarSenasa.Visible)then
        begin
          EACarOficial.SetFocus;
          EditAuto1.SetFocus;
      end;
    end
  else
    begin
      if(GBIdentificarRP.Visible)then
        begin
          EARpInicial.SetFocus;
          EAPrefijo.SetFocus;
        end;
      if(GBIdentificarSenasa.Visible)then
        begin
          EAUltimoIdent.SetFocus;
          EAEncabezado.SetFocus;
      end;
    end



end;

procedure TFEveAltaMasiva.IReIDNoPresClick(Sender: TObject);
begin
  inherited;

  IReIDNoPres.Visible := false;
  IReIDSiPres.Visible := true;

  LReidentificacionSenasaClick(Sender);

  EAUltimoIdentReidentificacion.SetFocus;
  EAEncabezadoReidentificacion.SetFocus;
end;

procedure TFEveAltaMasiva.IReIDSiPresClick(Sender: TObject);
begin
  inherited;

  IReIDNoPres.Visible := true;
  IReIDSiPres.Visible := false;

  LReidentificacionSenasaClick(Sender);

end;

procedure TFEveAltaMasiva.JvEADtaChange(Sender: TObject);
begin
  inherited;

  EADta.Text := JvEADta.Text;
  
end;

procedure TFEveAltaMasiva.RedibujarAuxiliar;
begin
     GBIdentificarRP.Height := 49;
     GBIdentificarSenasa.Height := 49;
     GBReIdentificarSenasa.Height := 49;
     GBIdentificarElectronica.Height := 49;

     GBIdentificarRP.Top := 50;
     GBIdentificarSenasa.Top := 50;
     GBReIdentificarSenasa.Top := 50;
     GBIdentificarElectronica.Top := 50;

     LRpInicial.Left := 8;
     LRpInicial.Top := 8;
     LLeyenda.Top := 8;
     LLeyenda.Left := 170;
     GBIdentificarRP.Width := 290;                                              

     EAPrefijo.Top := 6;
     EARpInicial.Top := 6;
     EASufijo.Top := 6;
     EARpInicial.Left := LRpInicial.Left + LRpInicial.Width + EAPrefijo.Width + 4;
     LCuigSenasa.Left := 276;
     LReidentificacionSenasa.Left := 515;
     LCaravanasElectronicas.Left := 781;

     GBIdentificarSenasa.Width := 358;
     EAEncabezado.Top := 6;
     EAEncabezado.Left := 12;
     EAUltimoIdent.Top := 6;
     EAUltimoIdent.Left := 59;
     CBCUIGPropio.Top := 6;
     CBCUIGPropio.Left := 124;
     LCUIGPropio.Top := 8;
     LCUIGPropio.Left := 140;
     DBLCBACUIGPropio.Top := 6;
     DBLCBACUIGPropio.Left := 220;

     Lr.Top := 8;
     EAEncabezadoReidentificacion.Top := 6;
     EAUltimoIdentReidentificacion.Top := 6;

     JvIEquivalencias.Top := 6;
     JvIEquivalencias.Left := 72;

end;

procedure TFEveAltaMasiva.ResetearComponentes(gb : TGroupBox);
var i : integer;
    C : TComponent;
begin

    for i:= 0 to gb.ControlCount - 1 do
    begin
      if (gb.Controls[i].Visible) then
      begin
             if (gb.Controls[i] is TEditAuto) then
                if ((gb.Name = 'GBDatosVarios') or (gb.Name = 'GBDatosEcono')) then
                  (gb.Controls[i] as TEditAuto).Text := '0'
                else
                  (gb.Controls[i] as TEditAuto).Text := '';

             if (gb.Controls[i] is TDBLookupComboBoxAuto) then
                if (gb.Name = 'GBDatosAlta') then
                  (gb.Controls[i] as TDBLookupComboBoxAuto).KeyValue := 1
                else                                                     
                  (gb.Controls[i] as TDBLookupComboBoxAuto).KeyValue := 0;

             if (gb.Controls[i] is TDateTimePickerAuto) then
                  (gb.Controls[i] as TDateTimePickerAuto).Date := Now;

             if (gb.Controls[i] is TJvEdit) then
                if ((gb.Name = 'GBDatosVarios') or (gb.Name = 'GBDatosEcono')) then
                  (gb.Controls[i] as TJvEdit).Text := '0'
                else
                  (gb.Controls[i] as TJvEdit).Text := '';

             if (gb.Controls[i] is TComboBox) then
                  (gb.Controls[i] as TComboBox).ItemIndex := 0;
      end;
    end;

    EAPrefijo.Text := '';
    EASufijo.Text := '';
    EAEncabezado.Text := '';
    EAUltimoIdent.Text := '';
    EAEncabezadoReidentificacion.Text := '';
    EAUltimoIdentReidentificacion.Text := '';

end;

procedure TFEveAltaMasiva.EAVerificadorChange(Sender: TObject);
begin
  inherited;
  if (EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____') then
  begin
    if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
    begin
      if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
      begin
          cod_verificador := UFunctions.DigitoVerificadorCaravana(EAEncabezado.Text+EAUltimoIdent.Text);

          if (EAVerificador.Text <> IntToStr(cod_verificador)) then
          begin
            MostrarMensaje(tmError, 'Se produjo una inconsistencia en el CUIG Senasa ingresado. Verifique los datos ingresados.');
            EAEncabezado.SetFocus;

            habilitarSiguiente(false);
            TSHObservacion.TabVisible := false;
          end
          else
          begin
            habilitarSiguiente(true);
            TSHObservacion.TabVisible := true;
          end;
      end
      else
      begin
          MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
          EAUltimoIdent.SetFocus;
      end;
    end
    else
    begin
        MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
        EAEncabezado.SetFocus;
    end;
  end;

end;

procedure TFEveAltaMasiva.CDSGrillaMachosID_RPChange(Sender: TField);
var rp, auxrp, senasa, auxsenasa : string;
    verificador : integer;
begin
  inherited;

  if (RBCUIGSenasa.Checked) then
  begin
      rp := '';
      if (BDBGGrillaMachos.DataSource.DataSet.FieldValues['id_senasa'] <> null) then
        senasa := BDBGGrillaMachos.DataSource.DataSet.FieldValues['id_senasa'];
  end;
end;

procedure TFEveAltaMasiva.CDSGrillaHembrasID_RPChange(Sender: TField);
var rp, auxrp, senasa, auxsenasa : string;
    verificador : integer;
begin
  inherited;

  if (RBCUIGSenasa.Checked) then
  begin
      rp := '';
      if (BDBGGrillaHembras.DataSource.DataSet.FieldValues['id_senasa'] <> null) then
        senasa := BDBGGrillaHembras.DataSource.DataSet.FieldValues['id_senasa'];

      {if (BDBGGrillaHembras.DataSource.DataSet.FieldValues['id_rp'] <> null) then
      begin
        rp := BDBGGrillaHembras.DataSource.DataSet.FieldValues['id_rp'];

        auxrp := BDBGGrillaHembras.DataSource.DataSet.FieldValues['id_rp'];
        SetLength(auxrp,9);

        verificador := UFunctions.DigitoVerificadorCaravana(auxrp);

        auxsenasa := auxrp + IntToStr(verificador);

        if (auxsenasa = rp) then
        begin
             CDSGrillaHembras.FieldByName('id_senasa').AsString := auxrp;
        end
        else
        begin
             MostrarMensaje(tmError,'Error en la grilla de Hembras.'+#13+'Se produjo una inconsistencia en el CUIG Senasa ingresado. Verifique los datos ingresados.');
        end;
      end;}
  end;
end;

procedure TFEveAltaMasiva.EAUltimoIdentExit(Sender: TObject);
begin
  inherited;

  {Mariano.2016: Si el valor ya tiene algo, no veo
  conveniente que se cambie, en otro caso puede ser.}
  if (EARpInicial.Text = '') then
  begin
    EARpInicial.Text := EAEncabezado.Text + EAUltimoIdent.Text;
  end;
end;


procedure TFEveAltaMasiva.JvImage58Click(Sender: TObject);
begin
  inherited;
  PADatosAlta.Visible:=false;
end;

procedure TFEveAltaMasiva.JvImage2Click(Sender: TObject);
begin
  inherited;
  PAIdentificacion.Visible:=false;
end;

procedure TFEveAltaMasiva.JvImage6Click(Sender: TObject);
begin
  inherited;
  PANoIdentificar.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage9Click(Sender: TObject);
begin
  inherited;
  PADatosUbicacion.Visible:=false;                
end;

procedure TFEveAltaMasiva.JvImage13Click(Sender: TObject);
begin
  inherited;
  PADatosIndent.Visible:=false;
end;

procedure TFEveAltaMasiva.JvImage11Click(Sender: TObject);
begin
  inherited;
  PAIdentificar.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage15Click(Sender: TObject);
begin
  inherited;
  PADatosGral.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage21Click(Sender: TObject);
begin
  inherited;
  PAVacaVaquillona.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage23Click(Sender: TObject);
begin
  inherited;
  PATernera.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage17Click(Sender: TObject);
begin
  inherited;
  PAParticularTerNov.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage19Click(Sender: TObject);
begin
  inherited;
  PAParticularToro.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage26Click(Sender: TObject);
begin
  inherited;
  PADatosCom.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage27Click(Sender: TObject);
begin
  inherited;
  PADatosEcon.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage30Click(Sender: TObject);
begin
  inherited;
  PAPlanillaAM.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage31Click(Sender: TObject);
begin
  inherited;
  PANombreGrupo.Visible:= false;
end;

procedure TFEveAltaMasiva.PAFinalizarCMClick(Sender: TObject);
begin
  inherited;
  PAFinalizarCM.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage35Click(Sender: TObject);
begin
  inherited;
  PAAMExcel.Visible:= false;
end;

procedure TFEveAltaMasiva.JvImage39Click(Sender: TObject);
begin
  inherited;
  PAFinGuardar.Visible:=false; 
end;

procedure TFEveAltaMasiva.CargarTopImgHints(Itop: String);
begin
   PAAMExcel.AsignarTop(ITop);
   PADatosAlta.AsignarTop(ITop);
   PADatosCom.AsignarTop(ITop);
   PADatosEcon.AsignarTop(ITop);
   PADatosGral.AsignarTop(ITop);
   PADatosIndent.AsignarTop(ITop);
   PADatosUbicacion.AsignarTop(ITop);
   PAFinalizarCM.AsignarTop(ITop);
   PAFinGuardar.AsignarTop(ITop);
   PAIdentificacion.AsignarTop(ITop);
   PAIdentificar.AsignarTop(ITop);
   PANoIdentificar.AsignarTop(ITop);
   PANombreGrupo.AsignarTop(ITop);
   PAParticularTerNov.AsignarTop(ITop);
   PAParticularToro.AsignarTop(ITop);
   PAPlanillaAM.AsignarTop(ITop);
   PATernera.AsignarTop(ITop);
   PAVacaVaquillona.AsignarTop(ITop);
end;


procedure TFEveAltaMasiva.CargarCenterImgHints(ICenter: String);
begin
   PAAMExcel.AsignarCenter(ICenter);
   PADatosAlta.AsignarCenter(ICenter);
   PADatosCom.AsignarCenter(ICenter);
   PADatosEcon.AsignarCenter(ICenter);
   PADatosGral.AsignarCenter(ICenter);
   PADatosIndent.AsignarCenter(ICenter);
   PADatosUbicacion.AsignarCenter(ICenter);
   PAFinalizarCM.AsignarCenter(ICenter);
   PAFinGuardar.AsignarCenter(ICenter);
   PAIdentificacion.AsignarCenter(ICenter);
   PAIdentificar.AsignarCenter(ICenter);
   PANoIdentificar.AsignarCenter(ICenter);
   PANombreGrupo.AsignarCenter(ICenter);
   PAParticularTerNov.AsignarCenter(ICenter);
   PAParticularToro.AsignarCenter(ICenter);
   PAPlanillaAM.AsignarCenter(ICenter);
   PATernera.AsignarCenter(ICenter);
   PAVacaVaquillona.AsignarCenter(ICenter);
end;


procedure TFEveAltaMasiva.CargarBottomImgHints(IBottom: String);
begin
   PAAMExcel.AsignarBottom(IBottom);
   PADatosAlta.AsignarBottom(IBottom);
   PADatosCom.AsignarBottom(IBottom);
   PADatosEcon.AsignarBottom(IBottom);
   PADatosGral.AsignarBottom(IBottom);
   PADatosIndent.AsignarBottom(IBottom);
   PADatosUbicacion.AsignarBottom(IBottom);
   PAFinalizarCM.AsignarBottom(IBottom);
   PAFinGuardar.AsignarBottom(IBottom);
   PAIdentificacion.AsignarBottom(IBottom);
   PAIdentificar.AsignarBottom(IBottom);
   PANoIdentificar.AsignarBottom(IBottom);
   PANombreGrupo.AsignarBottom(IBottom);
   PAParticularTerNov.AsignarBottom(IBottom);
   PAParticularToro.AsignarBottom(IBottom);
   PAPlanillaAM.AsignarBottom(IBottom);
   PATernera.AsignarBottom(IBottom);
   PAVacaVaquillona.AsignarBottom(IBottom);
end;

procedure TFEveAltaMasiva.JvImage34Click(Sender: TObject);
begin
  inherited;
  PAFinalizarCM.Visible := false;
end;

procedure TFEveAltaMasiva.VerificarRepetidosEnExcel;
var
  indexPivot, indexOtros: integer;
  animalPivot, animalOtro: TRegAnimal;
begin
  for indexPivot := 0 to Length(anim)-1 do
  begin
    animalPivot := anim[indexPivot];
    for indexOtros := 0 to Length(anim)-1 do
    begin
      if (indexPivot <> indexOtros) then
      begin
          animalOtro := anim[indexOtros];
      end;
    end;
  end;
end;

//******************************************************//
//	INCIDENCIA: 401									                    //
//	INICIO Generación de archivos txt y xls.            //
//	Carla Gareis							              23/12/2014  //
//******************************************************//


//******************************************************//
//	INCIDENCIA: 401									                    //
//	FIN Generación de archivos txt y xls.               //
//	Carla Gareis							              23/12/2014  //
//******************************************************//

procedure TFEveAltaMasiva.BExaminarDTEClick(Sender: TObject);
begin
  if (ODExaminarDTE.Execute) then
  pathOrigen := ODExaminarDTE.FileName;
end;

procedure TFEveAltaMasiva.EACarOficialChange(Sender: TObject);
begin
  inherited;
  if(not GBIdentificarRP.visible)then
    if(EditAuto1.GetDato <> null)then
      EARpInicial.Text := EACarOficial.GetDato
    else
      EARpInicial.Text := '';
  cOficial := StrToInt(EACarOficial.Text);
end;

procedure TFEveAltaMasiva.Allflex1Click(Sender: TObject);
begin
  inherited;
  FPrincipal.MarcaLector := 'Allflex';
end;

procedure TFEveAltaMasiva.Datamars1Click(Sender: TObject);
begin
  inherited;
    FPrincipal.MarcaLector := 'Datamars';
end;

procedure TFEveAltaMasiva.Baqueano1Click(Sender: TObject);
begin
  inherited;
    FPrincipal.MarcaLector := 'Baqueano';
end;

procedure TFEveAltaMasiva.habilitarSiguiente(estado:boolean);
begin
    JvSiguiente.Visible := estado;
    LBBSiguiente.Visible := estado;
end;

end.
