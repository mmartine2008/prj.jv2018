unit UEveAltaMasiva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveIndividual, DB, IBCustomDataSet, IBQuery, ActnList, Tabs,
  ComCtrls, StdCtrls, MemoAuto, Buttons, ExtCtrls, UDBDateTimePickerAuto,
  Grids, DBGrids, UBDBGrid, EditAuto, DBCtrls, UDBLookupComboBoxAuto, DateUtils,
  DateTimePickerAuto, IBUpdateSQL, DBClient, DBLocal, DBLocalI, Menus,
  IBStoredProc, UFunctions, WinXP, DataExport, DataToXLS, Mask, cxControls,
  cxSSheet, UEveDiagnosticoGestacion, UEveSimple, UAvanceTerminar,
  JvExExtCtrls, JvExtComponent, JvRollOut, UDMSoftvet, Registry, StrUtils,
  JvGIF, PngImage, JvImage, jpeg, ImgList, PngImageList, JvExControls,
  JvLabel;

type
  arrSimple = array of String;

  TRegEquivalencias = record
    IE : String;
    RP : String;
  end;

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
    LFechadeAlta: TLabel;
    LCantidad: TLabel;
    LEdad: TLabel;
    LRaza: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LDta: TLabel;
    EACantidad: TEditAuto;
    EAEdad: TEditAuto;
    DTPAFechaAlta: TDateTimePickerAuto;
    DBLCBARaza: TDBLookupComboBoxAuto;
    CBSexo: TComboBox;
    DBLCBAtipoAlta: TDBLookupComboBoxAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    EADta: TEditAuto;
    JVDatosParticulares: TJvRollOut;
    GBMachos: TGroupBox;
    Lcircunferencia: TLabel;
    LUnidades: TLabel;
    EACircunferenciaEscrotal: TEditAuto;
    GBHembras: TGroupBox;
    Label2: TLabel;
    LEstadoR: TLabel;
    DBLCBAGdr: TDBLookupComboBoxAuto;
    DBLCBAEstadoR: TDBLookupComboBoxAuto;
    JvDatosComunes: TJvRollOut;
    GBDatosComunes: TGroupBox;
    LCondCorporal: TLabel;
    LCronologiaD: TLabel;
    DBLCBACondicionC: TDBLookupComboBoxAuto;
    DBLCBACronologiaD: TDBLookupComboBoxAuto;
    CBCondicionCorporal: TCheckBox;
    JvDatosEconomicos: TJvRollOut;
    GBDatosEconomicos: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    LValorTotal: TLabel;
    Label4: TLabel;
    EAValortotal: TEditAuto;
    EAValorNeto: TEditAuto;
    EAPorcentaje: TEditAuto;
    EAPeso: TEditAuto;
    Lpeso: TLabel;
    Label6: TLabel;
    LDias: TLabel;
    DBLCBATiposPeso: TDBLookupComboBoxAuto;
    LCatMachos: TLabel;
    DBLCBACategoria: TDBLookupComboBoxAuto;
    GBIdentificacion: TGroupBox;
    RBRp: TRadioButton;
    RBCUIGSenasa: TRadioButton;
    RBSenasa: TRadioButton;
    LRpInicial: TLabel;
    EAPrefijo: TEditAuto;
    EARpInicial: TEditAuto;
    EASufijo: TEditAuto;
    EAUltimoIdent: TMaskEdit;
    EAEncabezado: TMaskEdit;
    CBCUIGPropio: TCheckBox;
    LCUIGPropio: TLabel;
    DBLCBACUIGPropio: TDBLookupComboBoxAuto;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    LPotrero: TLabel;
    LRodeo: TLabel;
    DBLCBARodeo: TDBLookupComboBoxAuto;
    EAEstadoLactacion: TEditAuto;
    LEstadoLactacion: TLabel;
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
    DBLCBAActividad: TDBLookupComboBoxAuto;
    LActividad: TLabel;
    CDSGrillaMachosV10: TIBStringField;
    CDSGrillaMachosACTIVIDAD: TIntegerField;
    CDSGrillaMachosID_IE: TIBStringField;
    Label5: TLabel;
    DBLCBAOrigen: TDBLookupComboBoxAuto;
    RBReidentificacionSenasa: TRadioButton;
    Lr: TLabel;
    EAEncabezadoReidentificacion: TMaskEdit;
    EAUltimoIdentReidentificacion: TMaskEdit;
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
    DBLCBACriador: TDBLookupComboBoxAuto;
    Label9: TLabel;
    Label10: TLabel;
    DBLCBAPropietario: TDBLookupComboBoxAuto;
    CBCastrado: TCheckBox;
    CDSGrillaMachosVUNO2: TIBStringField;
    CDSAnimalesVUNO2: TIBStringField;
    CDSGrillaMachosCIRCUNFERENCIA_ESCROTAL: TFloatField;
    CDSAnimalesCIRCUNFERENCIA_ESCROTAL: TFloatField;
    LSubcategoria: TLabel;
    DBLCBASubCategoria: TDBLookupComboBoxAuto;
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
    LMocho: TLabel;
    DBLCBAMocho: TDBLookupComboBoxAuto;
    LInspeccion: TLabel;
    DBLCBAInspeccion: TDBLookupComboBoxAuto;
    LDestCab: TLabel;
    DBLCBADestCabania: TDBLookupComboBoxAuto;
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
    Label11: TLabel;
    DBLCBAColor: TDBLookupComboBoxAuto;
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
    RBEquivalencias: TRadioButton;
    JvIEquivalencias: TJvImage;
    IBQExisteEQ: TIBQuery;
    JvIDispElect: TJvImage;
    LDispElect: TLabel;
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
    procedure BDBGGrillaHembrasExit(Sender: TObject);
    procedure CDSGrillaHembrasID_SENASAChange(Sender: TField);
    procedure CDSGrillaMachosID_SENASAChange(Sender: TField);
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
    procedure Label5MouseEnter(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
    procedure RBReidentificacionSenasaClick(Sender: TObject);
    procedure EAEncabezadoReidentificacionChange(Sender: TObject);
    procedure EAUltimoIdentReidentificacionChange(Sender: TObject);
    procedure DTPAFechaAltaExit(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label9MouseEnter(Sender: TObject);
    procedure Label9MouseLeave(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10MouseEnter(Sender: TObject);
    procedure Label10MouseLeave(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure DBLCBACatMachosCloseUp(Sender: TObject);
    procedure CBSexoCloseUp(Sender: TObject);
    procedure CDSGrillaMachosVUNO2Change(Sender: TField);
    procedure CDSGrillaHembrasOBSERVACIONSetText(Sender: TField;
      const Text: String);
    procedure CBSexoClick(Sender: TObject);
    procedure DBLCBARazaCloseUp(Sender: TObject);
    procedure DTPAFechaAltaEnter(Sender: TObject);
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
    Equivalencias : TArrEquivalencias;
    cargaEQ : Boolean;
    procedure RealizarDiagnostico();
    function ControlarRP:Boolean;
    procedure GeneraGrilla;
    procedure cambiarGrilla;
    procedure CargarPickListEnGrilla;
    procedure PaintRequired;
    procedure FillPickList(const campo: string; const Qry: TDataSet);
    procedure CambioCategoriaHembras;
    procedure ChequearCampoEnGrilla(Campo: string; Valor: string; ValAnterior:string );
    procedure VerificarRepetidos;
    procedure controlCondicionCorporal;
    procedure ActualizarCUIG(var Identificador : String);
    function CompletarRP (Valor : Integer) : String;
    function completarEdadCD(cronodentaria:Integer):Integer;//Integer;devuelve los meses a partir de la cronología dentaria
    function controlarCuig(IdentCUIG : String):Boolean;
    function controlarReidentificacion(IdentReidentificacion : String):Boolean;
    procedure BorrarSeleccion(dataSet:TIBDataSet; grilla:TBitDBGrid);
    procedure RealizarCambio(Component : TComponent;CamposBD : array of TField;
      ValoresCamposBD : array of Variant);
    function RegistroCambio(Component : TComponent) : Boolean;
    function ExistComponent(Component : TComponent) : Boolean;
    //function pertenece(valor:string;arreglo:arrSimple):boolean;
    procedure actualizarRP(id:integer;rp:string);
    function diagnostico:boolean;
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
  protected
    RpGenerados : Boolean;
    SQLStringList: TStringList;
    FNombreGrupo: String;
    FTipoEvento: integer;
    PuedeEliminar: Boolean;
    permitir:boolean;
    Errores, Warnings : Integer;
    procedure LoadSQLStringList;
    procedure ControlEventoOnExit(Sender: TObject); override;
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
    procedure cargarNuevos(i:integer);
    procedure importar;
  public
    edadVaca,edadVaquillona,edadTernera,edadTernero,edadNovillo,edadToro:integer;  
    { Public declarations }
  end;

var
  FEveAltaMasiva: TFEveAltaMasiva;
  arrNuevos:arrSimple;
  hi:THintWindow;   

implementation

uses UPrincipal,UClassType, UNombreGrupo, UMensajeHuella, UABMModificarCUIG,
     UABMEmpleados, UABMPotreros, UABMSimple, UABMRodeos, ComObj,UMovCargarDatos,
     UImportacion, UMensajeNuevos, UMensajeEdades, UABMActividad, UABMOrigen,
     UAbmPadresExternos, UABMCriador, UABMPropietarioAnimal, UABMSubcategorias, UTraduccion;

{$R *.dfm}

procedure TFEveAltaMasiva.AcomodarPanelPorRaza;
var
  I : Integer;
begin
  DBLCBAMocho.KeyValue := null;
  DBLCBAInspeccion.KeyValue := null;
  DBLCBADestCabania.KeyValue := null;
  I := DBLCBARaza.KeyValue;
  JvDatosGenerales.Height := 289;
  if (I in [12,28,11,10,5]) and FPrincipal.FuncActividad then
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
end;

procedure TFEveAltaMasiva.FormShow(Sender: TObject);
var cantidad:integer;
    accion:TCloseAction;
begin
  inherited;
  {Width:=800;
  Height:=600;}
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
  DBLCBAtipoAlta.SetFocus;
  SBSelTodos.Visible:=false;

  ISelTodos.Visible := false;
  LSelTodos.Visible := false;

  SBSelTodos.Left:=BBCancelar.Left-SBSelTodos.Width-5;
  GBHembras.Visible := true;
  GBMachos.Visible := false;
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
  EAPeso.Text := '0';
  EAPorcentaje.Text := '0';
  EAValorNeto.Text := '0';
  EAValortotal.Text := '0';
  EAEdad.Text := '0';
  DBLCBARodeo.KeyValue := 0;
  if not (DMSoftvet.IBQRodeo.IsEmpty)then
    DBLCBARodeo.AsignarValorDefecto;
  DBLCBARaza.KeyValue := 0;
  DBLCBAtipoAlta.KeyValue := 1;
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

  if not FPrincipal.FuncActividad then
  begin
    Label11.Top := Label5.Top;
    DBLCBAColor.Top := DBLCBAOrigen.Top;
  end;
  LSubCategoria.Visible := FPrincipal.FuncActividad;
  DBLCBASubCategoria.Visible := FPrincipal.FuncActividad;
  LActividad.Visible := FPrincipal.FuncActividad;
  DBLCBAActividad.Visible := FPrincipal.FuncActividad;
  Label5.Visible := FPrincipal.FuncActividad;
  DBLCBAOrigen.Visible := FPrincipal.FuncActividad;
  Label9.Visible := FPrincipal.FuncActividad;
  DBLCBACriador.Visible := FPrincipal.FuncActividad;
  Label10.Visible := FPrincipal.FuncActividad;
  DBLCBAPropietario.Visible := FPrincipal.FuncActividad;
  LInspeccion.Visible := FPrincipal.FuncActividad;
  DBLCBAInspeccion.Visible := FPrincipal.FuncActividad;
  LMocho.Visible := FPrincipal.FuncActividad;
  DBLCBAMocho.Visible := FPrincipal.FuncActividad;
  LDestCab.Visible := FPrincipal.FuncActividad;
  DBLCBADestCabania.Visible := FPrincipal.FuncActividad;
  RBEquivalencias.Visible := FPrincipal.FuncCaravanasElectronicas;

  if FPrincipal.RazaPredom = 1 then DBLCBARaza.KeyValue := 29;
  if FPrincipal.RazaPredom = 2 then DBLCBARaza.KeyValue := 11;
  if FPrincipal.RazaPredom = 3 then DBLCBARaza.KeyValue := 4;

  DBLCBACategoriaCloseUp(nil);

  cargaEQ := false;
end;


procedure TFEveAltaMasiva.CBSexoChange(Sender: TObject);
begin
  inherited;
  if (CBSexo.ItemIndex = 0) then
    begin
      sexo:=1;
      GBMachos.Visible := true;
      GBHembras.Visible := false;
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
      GBMachos.Visible := false;
      GBHembras.Visible := true;
      BDBGGrillaHembras.visible:= true;
      BDBGGrillaHembras.BringToFront;
      DMSoftvet.IBQCategAnimal.close;
      DMSoftvet.IBQCategAnimal.ParamByName('SEXO').Value:= 2;
      DMSoftvet.IBQCategAnimal.open;
    end;

end;

procedure TFEveAltaMasiva.CargarParametrosSP;
var
  I : Integer;
begin
         begin
         IBQSPEventoInd.ParamByName('IDNUEVOANIMAL').AsInteger := CDSAnimales.FieldValues['ID_ANIMAL'];
         IBQSPEventoInd.ParamByName('ID_RP').AsString := CDSAnimales.FieldValues['ID_RP'];
         IBQSPEventoInd.ParamByName('ESTADO_LACTACION').Value := CDSAnimales.fieldbyname('ESTADO_LACTACION').Value;//FieldValues['ESTADO_LACTACION'];
         IBQSPEventoInd.ParamByName('RAZA').AsInteger := CDSAnimales.FieldValues['RAZA'];
         IBQSPEventoInd.ParamByName('CRONOLOGIA_DENTARIA').AsInteger := CDSAnimales.FieldValues['CRONOLOGIA_DENTARIA'];
         IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := CDSAnimales.FieldValues['CONDICION_CORPORAL'];
         if CDSAnimales.FieldValues['gdr']<>null then IBQSPEventoInd.ParamByName('GDR').Value := CDSAnimales.FieldValues['gdr']
         else IBQSPEventoInd.ParamByName('GDR').Value := 0;
         IBQSPEventoInd.ParamByName('ESTADO_REPRODUCTIVO').Value := CDSAnimales.FieldValues['ESTADO_REPRODUCTIVO'];
         IBQSPEventoInd.ParamByName('SEXO').AsString := CDSAnimales.FieldValues['SEXO'];//'2';
         IBQSPEventoInd.ParamByName('CATEGORIA').AsInteger := CDSAnimales.FieldValues['categoria'];
         IBQSPEventoInd.ParamByName('ID_HBA').Value := CDSAnimales.fieldByName('ID_HBA').Value;

         if (CDSAnimales.FieldValues['ID_IE'] <> null) then
            IBQSPEventoInd.ParamByName('ID_IE').AsString := CDSAnimales.FieldValues['ID_IE']
          else
             IBQSPEventoInd.ParamByName('ID_IE').Value := null;
         IBQSPEventoInd.ParamByName('FECHA_NACIMIENTO').AsDate := CDSAnimales.FieldValues['FECHA_NACIMIENTO'];
         if(CDSAnimales.FieldValues['PESO'] = 0)THEN
            IBQSPEventoInd.ParamByName('PESO').Value := null
         else
           IBQSPEventoInd.ParamByName('PESO').Value := CDSAnimales.FieldValues['PESO'];
         if CDSAnimales.FieldValues['NOMBRE']<>'' then
           IBQSPEventoInd.ParamByName('NOMBRE').Value := CDSAnimales.FieldValues['NOMBRE']
         else
           IBQSPEventoInd.ParamByName('NOMBRE').Value := CDSAnimales.FieldValues['ID_RP'];
         IBQSPEventoInd.ParamByName('ID_SENASA').AsString := CDSAnimales.fieldByName('ID_SENASA').AsString;
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


      IBQSPEventoInd.ParamByName('SUBCATEGORIA').Value :=CDSAnimales.FieldValues['SUBCATEGORIA'];      
      IBQSPEventoInd.ParamByName('CODIGOMANEJO').AsInteger :=0;
      //actualiza el rp del animal en el arbol
      if (self.Owner is TFMensajeNuevos){(self.Owner is TFMovCargarDatos) or (self.Owner is TFEveSimple)} then
        //habria que hacer un actualizarID para la importacion de deps
        actualizarRP(IBQSPEventoInd.ParamByName('IDNUEVOANIMAL').AsInteger,IBQSPEventoInd.ParamByName('ID_RP').AsString);

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

procedure TFEveAltaMasiva.ATerminarExecute(Sender: TObject);
var v: TFNombredelGrupo;
    termina : boolean;
    i:integer;
    //diagnostico : boolean;
begin
  // codigo nuevo para el tema de la verificacion de rps y senasa en la grilla
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
        IBSPCrearGrupo.ExecProc;
        //ciclo de Hembras.
        ActualizarCUIG(IdentCUIG);

        altaExternos;

        CDSAnimales.Close;
        CDSAnimales.Open;
        CDSAnimales.Last;
        if CDSAnimales.RecordCount>0 then
          begin
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
                //Se borra para que no queden datos en la tabla aux_animales
                //if not CBDiagnostico.Checked then
                if ((CDSAnimales.FieldByName('CATEGORIA').AsInteger in [5..6])) and (CDSAnimales.FieldByName('V5').Value<>null) then
                  CDSAnimales.Next
                else
                  begin
                  CDSAnimales.Delete;
                  if (i=FAvanceTerminar.Max-1) then CDSAnimales.Next; //para que no tire error xq si elimina la ultima siendo ternera, vuelve a la anterior y no llega al eof
                  end;
                IBQSPEventoInd.Active:=false;
                i:=i+1;
              end;
          end;
          FAvanceTerminar.Modo := maListo;
          FAvanceTerminar.Destroy;
          MostrarMensaje(tmInformacion, 'Los animales han sido dados de alta');
          FPrincipal.IBTPrincipal.CommitRetaining;
          //if (CBDiagnostico.Visible and CBDiagnostico.Checked) then
          if diagnostico and not(self.Owner is TFMensajeNuevos){not(self.Owner is TFMovCargarDatos) and not(self.Owner is TFEveSimple)} then
          begin
            if MostrarMensaje(tmConsulta,'Desea realizar un diagnóstico de gestación a estos animales? (Los animales respetarán el mismo orden que el asignado en el Alta Masiva) ') = mrYes then
              RealizarDiagnostico()
            else
            begin
              CDSAnimales.First;
              while not CDSAnimales.Eof do
                CDSAnimales.Delete;
            end;
          end;
        ATerminar.Enabled := true;
        //if Assigned(FAvanceTerminar) then FAvanceTerminar.Destroy;
        close;
      end;
  if CDSGrillaMachos.RecordCount>0 then
    BDBGGrillaMachos.Show;
  if CDSGrillaHembras.RecordCount>0 then
    BDBGGrillaHembras.Show;
  IBSPCambiarCAtegoria.ExecProc;
end;

procedure TFEveAltaMasiva.CambioCategoriaHembras;
var
  esVaca, esTernera, esVaq:boolean;
begin
  esVaca:= DBLCBACategoria.KeyValue = 6;
  esTernera:=DBLCBACategoria.KeyValue = 4;
  esVaq:=((esVaca) or (DBLCBACategoria.KeyValue = 5));

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
begin
  inherited;
  case DBLCBACategoria.KeyValue of
    4,5,6 : CambioCategoriaHembras;
    1,2,3 : begin
              EACircunferenciaEscrotal.Enabled := DBLCBACategoria.KeyValue = 3;
              BDBGGrillaMachos.Columns[15].ReadOnly := not (DBLCBACategoria.KeyValue = 3);
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
      if ((RBRp.Checked)And((StrToInt(EARpInicial.Text) + StrToInt(EACantidad.Text)) > 999999)) Or
         ((RBSenasa.Checked)And((StrToInt(EARpInicial.Text) + StrToInt(EACantidad.Text)) > 999999999)) then
     begin
        MostrarMensaje(tmAdvertencia, 'Los identificadores superan el límite permitido');
        Result := False;
     end;

    cantidad := StrToInt(EACantidad.Text);

    if ((RBCUIGSenasa.Checked) or (RBReidentificacionSenasa.Checked)) then
    begin
      min := 0;
      max := cantidad;
    end
    else
    begin
      rpInicial := StrToInt(EARpInicial.Text);
      min := rpInicial;
      max := rpInicial+cantidad;
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
                       if RBRp.Checked then
                         begin
                           ParamByName('RP').AsString := rpActual;
                           ParamByName('SENASA').Value := null;
                         end;
                       if RBSenasa.Checked then
                         begin
                           ParamByName('RP').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text;
                           ParamByName('SENASA').Value := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text;
                         end;
                       if RBCUIGSenasa.Checked then
                       begin
                           ParamByName('RP').AsString := EAEncabezado.Text + IdentCUIG;
                           ParamByName('SENASA').Value := EAEncabezado.Text + IdentCUIG;
                           ActualizarCUIG(IdentCUIG);
                       end;
                       if RBReidentificacionSenasa.Checked then
                       begin
                           ParamByName('RP').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
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
//  if RpGenerados and (StrToInt(EARpInicial.Text) <> 0)then

  TSHDatos.ImageIndex := 16;
  TSHObservacion.ImageIndex := 17;
  if(PCBasico.ActivePage = TSHDatos)then
    TSHObservacion.ImageIndex := 14;
  if(PCBasico.ActivePage = TSHObservacion)then
    TSHObservacion.ImageIndex := 15;

TSHembras.TabVisible:=false;
TSMachos.TabVisible:=false;
  if (RBRP.Checked) or (RBCUIGSenasa.Checked) or (RBSenasa.Checked) or (RBReidentificacionSenasa.Checked) or (RBEquivalencias.Checked) then
    if (RBReidentificacionSenasa.Checked and (not controlarReidentificacion(EAUltimoIdentReidentificacion.Text))) or (RBCUIGSenasa.Checked and (not controlarCuig(EAUltimoIdent.Text)) or ((RBSenasa.Checked) and((StrToInt(EARpInicial.Text) + StrToInt(EACantidad.Text)-1) > 999999999)))then
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
            if (EARpInicial.Text <>'') or (RBCUIGSenasa.Checked) or (RBReidentificacionSenasa.Checked) or (RBEquivalencias.Checked) then
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
var
  longTotal, longValor, max, i : integer;
  val, resultado : String;
begin
  longTotal := length(EARPInicial.Text);
  val := IntToStr(Valor);
  longValor := length(val);
  max := longTotal-longValor;
  SetLength(resultado,max);

  for i := 1 to max do
    resultado[i] := '0';
    
  Result := resultado+val;
end;

procedure TFEveAltaMasiva.GeneraGrilla;
var i,rpInicial, cantidad, R:integer;
    edad :integer;
    fecha: TDate;
    min, max : Integer;
    cantidadEQ : Integer;
begin
  inherited;
  //PaintRequired;

  cantidad :=  StrToInt(EACantidad.Text);
  cantidadEQ := 0;

  if ((RBCUIGSenasa.Checked) or (RBReidentificacionSenasa.Checked)) then
  begin
    min := 1;
    max := cantidad;
  end
  else
  begin
    if not cargaEQ then
    begin
      rpInicial := StrToInt(EARpInicial.Text);
      min := rpInicial;
      max := rpInicial + cantidad - 1;
    end
    else
    begin
      min := 0;
      max := Length(Equivalencias)-1;
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

  //*/*/

  if ((CBSexo.ItemIndex = 0){and(CDSGrillaMachos.RecordCount = 0)})  then
    begin  //ciclo de machos.
      //CBDiagnostico.Visible := false;
      for i := min to max do
      begin
          IBQGenIDAnimal.Close;
          IBQGenIDAnimal.Open;
          CDSGrillaMachos.Insert;
          if RBRp.Checked then
            begin
              CDSGrillaMachos.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarRP(i) + EASufijo.Text;
              CDSGrillaMachos.FieldByName('id_senasa').AsString := '';
            end;
          if RBSenasa.Checked then
            begin
              CDSGrillaMachos.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text;
              CDSGrillaMachos.FieldByName('id_senasa').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text;
            end;
          if RBCUIGSenasa.Checked then
            begin
              CDSGrillaMachos.FieldByName('id_rp').AsString := EAEncabezado.Text + EAUltimoIdent.Text;
              CDSGrillaMachos.FieldByName('id_senasa').AsString := EAEncabezado.Text + IdentCUIG;
              IdentCUIG := UFunctions.IncrementarIdentificadorCUIG(IdentCUIG);
              //ActualizarCUIG(IdentCUIG);
            end;
          if RBEquivalencias.Checked then
            begin
              CDSGrillaMachos.FieldByName('id_rp').AsString := Equivalencias[i].RP;
              CDSGrillaMachos.FieldByName('id_ie').AsString := Equivalencias[i].IE;
              CDSGrillaMachos.FieldByName('id_senasa').AsString := '';
            end;

          if RBReidentificacionSenasa.Checked then
            begin
              CDSGrillaMachos.FieldByName('id_rp').AsString := 'R' + EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text;
              CDSGrillaMachos.FieldByName('id_senasa').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
              IdentReidentificacion := UFunctions.IncrementarIdentificadorCUIG(IdentReidentificacion);
            end;

          CDSGrillaMachos.FieldByName('TIPO_ALTA').AsInteger := DBLCBAtipoAlta.ListSource.DataSet.Lookup('NOMBRE',DBLCBAtipoAlta.Text,'ID_TIPO_ALTA');
          CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime := DTPAFechaAlta.DateTime;
          CDSGrillaMachos.FieldByName('id_animal').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];
          CDSGrillaMachos.FieldByName('id_aux').AsInteger := i;

          //ChequearCampoEnGrilla('id_rp',CDSGrillaMachos.FieldByName('id_rp').AsString,'');
//          setText(CDSGrillaMachos.FieldByName('id_rp'),CDSGrillaMachos.FieldByName('id_rp').AsString);

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
          CDSGrillaMachos.FieldByName('nombre').AsString:= '';
          CDSGrillaMachos.FieldByName('raza').AsInteger := DBLCBARaza.KeyValue;
          CDSGrillaMachos.FieldByName('V6').AsString := DBLCBARaza.Text;
          if (CantidadRepetidos('id_rp',CDSGrillaMachos.FieldByName('id_rp').AsString,IBQRepetidos, 'select count(*) as cantidad from AUX_animales ')>0) then
              begin
              CDSGrillaMachos.FieldByName('ew').AsString := 'E';
              MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'RP' ) +' = '+CDSGrillaMachos.FieldByName('id_rp').AsString);
              end
          else
              CDSGrillaMachos.FieldByName('ew').AsString := ' ';

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

          if((DBLCBACategoria.KeyValue = 1) and (CBSexo.ItemIndex = 0))then
            if (CBCastrado.Checked) then
              CDSGrillaMachos.FieldByName('VUNO2').Value:=1
             else
               CDSGrillaMachos.FieldByName('VUNO2').Value:=0;


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
      //CBDiagnostico.Visible := true;
      for i := min to max do
      begin
          IBQGenIDAnimal.Close;
          IBQGenIDAnimal.Open;
          CDSGrillaHembras.Insert;
          if RBRp.Checked then
            begin
              CDSGrillaHembras.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarRP(i) + EASufijo.Text;
              CDSGrillaHembras.FieldByName('id_senasa').AsString := '';
            end;
          if RBSenasa.Checked then
            begin
              CDSGrillaHembras.FieldByName('id_rp').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text;
              CDSGrillaHembras.FieldByName('id_senasa').AsString := EAPrefijo.Text + CompletarDigitosSenasa(IntToStr(i)) + EASufijo.Text;
            end;
           if RBCUIGSenasa.Checked then
            begin
              CDSGrillaHembras.FieldByName('id_rp').AsString := EAEncabezado.Text + IdentCUIG;
              CDSGrillaHembras.FieldByName('id_senasa').AsString := EAEncabezado.Text + IdentCUIG;
              IdentCUIG := UFunctions.IncrementarIdentificadorCUIG(IdentCUIG);
              //ActualizarCUIG(IdentCUIG);
            end;

           if RBEquivalencias.Checked then
            begin
              CDSGrillaHembras.FieldByName('id_rp').AsString := Equivalencias[i].RP;
              CDSGrillaHembras.FieldByName('id_ie').AsString := Equivalencias[i].IE;
              CDSGrillaHembras.FieldByName('id_senasa').AsString := '';
            end;

           if RBReidentificacionSenasa.Checked then
            begin
              CDSGrillaHembras.FieldByName('id_rp').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
              CDSGrillaHembras.FieldByName('id_senasa').AsString := 'R' + EAEncabezadoReidentificacion.Text + IdentReidentificacion;
              IdentReidentificacion := UFunctions.IncrementarIdentificadorCUIG(IdentReidentificacion);
            end;

          //ChequearCampoEnGrilla('id_rp',CDSGrillaHembras.FieldByName('id_rp').AsString,'');
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
          if (CantidadRepetidos('id_rp',CDSGrillaHembras.FieldByName('id_rp').AsString,IBQRepetidos, 'select count(*) as cantidad from AUX_animales ')>0) then
              begin
              CDSGrillaHembras.FieldByName('ew').AsString := 'E';
              MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'RP'  )+' = '+CDSGrillaHembras.FieldByName('id_rp').AsString);
              end
          else
              CDSGrillaHembras.FieldByName('ew').AsString := ' ';
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
var categoria: Integer;
begin
 if agregar then
 begin
  if (CBSexo.ItemIndex = 0) then
     categoria:= DBLCBACategoria.KeyValue
   else
      categoria:= DBLCBACategoria.KeyValue;

   If (CBSexo.ItemIndex=1) and (DBLCBACategoria.KeyValue=6) and (EAEstadoLactacion.Text<'1') then
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
    if (RBReidentificacionSenasa.Checked and (not controlarReidentificacion(EAUltimoIdentReidentificacion.Text))) or (RBCUIGSenasa.Checked and (not controlarCuig(EAUltimoIdent.Text)) or ((RBSenasa.Checked) and((StrToInt(EARpInicial.Text) + StrToInt(EACantidad.Text)-1) > 999999999)))then
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
end;

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

  CargarPickListEnGrilla;
end;

procedure TFEveAltaMasiva.FormCreate(Sender: TObject);
begin
    SQLStringList:= TStringList.Create;
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
  EARPInicial.Text:='';
  EAPrefijo.Enabled := False;
  EAPrefijo.Visible := False;
  EASufijo.Enabled := False;
  EASufijo.Visible := False;
  EARPInicial.Visible := true;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EARpInicial.MaxLength := 9;
  EARpInicial.Left := 182;
  EARpInicial.Width := 63;
  EARpInicial.SetFocus;
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
  EAEncabezadoReidentificacion.Visible:= false;
  EAUltimoIdentReidentificacion.Visible:= false;

  JvIEquivalencias.Visible := false;
end;

procedure TFEveAltaMasiva.RBRpClick(Sender: TObject);
begin
  inherited;
  EARPInicial.Visible := true;
  EARPInicial.Text:='';
  EAPrefijo.Enabled := True;
  EAPrefijo.Visible := True;
  EASufijo.Enabled := True;
  EASufijo.Visible := True;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EARpInicial.MaxLength := 6;
  EARpInicial.Left := 208;
  EARpInicial.Width := 46;
  EARPinicial.EsRequerido := true;
  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;
  DBLCBACUIGPropio.Visible := false;
  ControlEventoOnExit(Sender);
  LRpInicial.Visible:= True;
  ComponentesVisiblesPorPais(FPrincipal.Pais);
  EAPrefijo.SetFocus;

  Lr.Visible:= false;  
  EAEncabezadoReidentificacion.Visible:= false;
  EAUltimoIdentReidentificacion.Visible:= false;

  JvIEquivalencias.Visible := false;
end;

procedure TFEveAltaMasiva.RBCUIGSenasaClick(Sender: TObject);
begin
  inherited;
  EAEncabezado.Visible := true;
  EAUltimoIdent.Visible := true;
  EAPrefijo.Visible := false;
  EARPInicial.Visible := false;
  EASufijo.Visible := false;
  EARPinicial.EsRequerido := false;
  CBCUIGPropio.Visible := true;
  LCUIGPropio.Visible := true;
  LRpInicial.Visible:=false;
  if(CBCUIGPropio.Checked) then
      DBLCBACUIGPropio.Visible:= true;
  ControlEventoOnExit(Sender);

  Lr.Visible:= false;  
  EAEncabezadoReidentificacion.Visible:= false;
  EAUltimoIdentReidentificacion.Visible:= false;

  JvIEquivalencias.Visible := false;
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
     if (GBMachos.Visible) then
       begin
          DBLCBACategoria.SetFocus;
          key:= #0;
       end;
    if (GBHembras.Visible) then
      begin
         DBLCBACategoria.SetFocus;
         key:= #0;
      end;
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

procedure TFEveAltaMasiva.EACircunferenciaEscrotalKeyPress(Sender: TObject;
  var Key: Char);
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
var
  ValorTotal, ValorNeto, ValorPorcentual: double;


begin
  inherited;
  if (TEdit(Sender).Focused) then
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
    //DEMO EDUCACION CONTINUA
   //BBTerminar.Enabled := graba and esGrilla and (hayHembras or hayMachos) and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
   JvTerminar.Visible := graba and esGrilla and (hayHembras or hayMachos) and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
   LBBTerminar.Visible := graba and esGrilla and (hayHembras or hayMachos) and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
   //DEMO COMERCIAL
   //BBTerminar.Enabled := false;//graba and esGrilla and (hayHembras or hayMachos) and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones);// antes esto estaba en false directamente no dejando cargar nunca animales cuando era demo
{$ELSE}
  if FPrincipal.TipoVersionLicencia = 'Basico' then
    if FPrincipal.TipoBase = 1 then
    begin
      cantAnimalesNuevos := CantAnimalesNuevos + BDBGGrillaHembras.DataSource.DataSet.RecordCount;
      cantAnimalesNuevos := CantAnimalesNuevos + BDBGGrillaMachos.DataSource.DataSet.RecordCount;
      //BBTerminar.Enabled := VerificarCantAnimalesBase(cantAnimalesNuevos) and graba and esGrilla and (hayHembras or hayMachos);
      JvTerminar.Visible := VerificarCantAnimalesBase(cantAnimalesNuevos) and graba and esGrilla and (hayHembras or hayMachos);
      LBBTerminar.Visible := VerificarCantAnimalesBase(cantAnimalesNuevos) and graba and esGrilla and (hayHembras or hayMachos);
    end
    else
    begin
      //BBTerminar.Enabled := graba and esGrilla and (hayHembras or hayMachos)
      JvTerminar.Visible := graba and esGrilla and (hayHembras or hayMachos);
      LBBTerminar.Visible := graba and esGrilla and (hayHembras or hayMachos);
    end
  else
  begin
    JvTerminar.Visible := graba and esGrilla and (hayHembras or hayMachos);
    LBBTerminar.Visible := graba and esGrilla and (hayHembras or hayMachos);
    ///BBTerminar.Enabled := graba and esGrilla and (hayHembras or hayMachos);
  end;
{$ENDIF}


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
begin
  inherited;
  //Circunferencia escrotal solo disponble para toros
  EACircunferenciaEscrotal.Enabled := DBLCBACategoria.KeyValue = 3;
  BDBGGrillaMachos.Columns[15].ReadOnly := not (DBLCBACategoria.KeyValue = 3);
end;

procedure TFEveAltaMasiva.ChequearCampoEnGrilla(Campo, Valor, ValAnterior: string);
begin
  //MAErrors.Clear;
  //if(ValAnterior <> Valor)then
  //begin
  {CantidadRepetidos = 0 No hay elementos Repetidos, CantidadRepetidos > 0 Hay Repetidos}

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


  //
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
        if ((Ord(aux[1])>=48) and (Ord(aux[1])<=57)) then
          Sender.AsString:= CompletarDigitosSenasa(aux)
         else
           begin
             Sender.AsString:= aux;
            // showmessage(IntToStr(DigitoVerificadorCaravana(aux)));
           end;
    end;
  //

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
  TBitDBGrid(Sender).Canvas.FillRect(Rect);
  TBitDBGrid(Sender).Canvas.Font.Color := clBlack;
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
 { BDBGGrillaHembras.Columns[6].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaHembras.Columns[7].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaHembras.Columns[8].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaHembras.Columns[18].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaHembras.Columns[25].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaHembras.Columns[34].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaHembras.Columns[35].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaHembras.Columns[41].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaHembras.Columns[42].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaHembras.Columns[43].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[5].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[6].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[7].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[8].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[18].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[23].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[32].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[33].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[39].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[40].Visible := not FPrincipal.FuncActividad;
  BDBGGrillaMachos.Columns[41].Visible := not FPrincipal.FuncActividad; }

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

procedure TFEveAltaMasiva.ActualizarCUIG(var Identificador : String);
var
  ultimo : String;
begin
  {UltimoIdentUsado := Identificador;
  Identificador := UFunctions.IncrementarIdentificadorCUIG(UltimoIdentUsado); }
  if (CBCUIGPropio.Checked) then
  begin
    IBQBuscarCUIG.Close;
    IBQBuscarCUIG.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQBuscarCUIG.ParamByName('id').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQBuscarCUIG.Open;
    ultimo := IBQBuscarCUIG.fieldByName('ultimo_identificador').AsString;
    IBQActCUIG.Close;
    IBQActCUIG.ParamByName('cuig').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQActCUIG.ParamByName('UI').AsString := Identificador;
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
    EACantidad.SetFocus;
    EACantidad.SelectAll;
    EAEncabezado.Text := DBLCBACUIGPropio.Text;
    EAUltimoIdent.Text := IBQBuscarCUIG.fieldByName('ultimo_identificador').AsString;

  end;
end;

procedure TFEveAltaMasiva.EAEncabezadoChange(Sender: TObject);
begin
  inherited;
  ControlEventoOnExit(Sender);
end;

procedure TFEveAltaMasiva.EAUltimoIdentChange(Sender: TObject);
begin
  inherited;
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
end;

procedure TFEveAltaMasiva.BDBGGrillaHembrasExit(Sender: TObject);
begin
  inherited;
  //PuedeEliminar:= BSacarAnimal.Focused;
end;

procedure TFEveAltaMasiva.CDSGrillaHembrasID_SENASAChange(Sender: TField);
begin
  inherited;
   if ((RBSenasa.Checked) OR (RBCUIGSenasa.Checked) or (RBReidentificacionSenasa.Checked)) then
    if CDSGrillaHembras.state in dsEditModes then
      if CDSGrillaHembras.FieldValues['Id_Senasa'] <> null then
         CDSGrillaHembras.FieldValues['ID_RP'] := CDSGrillaHembras.FieldValues['ID_SENASA'];
end;

procedure TFEveAltaMasiva.CDSGrillaMachosID_SENASAChange(Sender: TField);
begin
  inherited;
   if ((RBSenasa.Checked) OR (RBCUIGSenasa.Checked) or (RBReidentificacionSenasa.Checked)) then
    if CDSGrillaMachos.state in dsEditModes then
      if CDSGrillaMachos.FieldValues['Id_Senasa'] <> null then
         CDSGrillaMachos.FieldValues['ID_RP'] := CDSGrillaMachos.FieldValues['ID_SENASA'];
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
      {DBLCBACUIGPropio.KeyValue:=-1;
      DBLCBACUIGPropio.Visible := false;}
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
    EAEdad.Text:= IntToStr(completarEdadCD(DBLCBACronologiaD.KeyValue));
    LEdad.Font.Color:= clBlue;
    LEdad.Font.Style:= [fsBold];
end;

procedure TFEveAltaMasiva.DBLCBAtipoAltaCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBAtipoAlta.KeyValue = 3 ) then
    begin
     EADta.Text:='';
     LDta.Visible:= false;
     EADta.Visible:= false;
     BDBGGrillaHembras.ColumnByField('DTA').Visible:= false;
     CDSGrillaHembrasDTA.Visible:= false;
     CDSGrillaMachosDTA.Visible:= false;
     BDBGGrillaMachos.ColumnByField('DTA').Visible:= false;
    end
   else
     begin
       LDta.Visible:= true;
       EADta.Visible:= true;
       CDSGrillaHembrasDTA.Visible:= true;
       BDBGGrillaHembras.ColumnByField('DTA').Visible:= true;
       CDSGrillaMachosDTA.Visible:= true;
       BDBGGrillaMachos.ColumnByField('DTA').Visible:= true;
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
    LRpInicial.Top := 15;
    EAPrefijo.Top := 15;
    EASufijo.Top:= 15;
    EARpInicial.Top:= 15;
    BDBGGrillaHembras.ColumnByField('ID_HBA').Title.Caption:=Traducir('HBA');
    BDBGGrillaMachos.ColumnByField('ID_HBA').Title.Caption:=Traducir('HBA');
    RBCUIGSenasa.Visible:= True;
    if (RBCUIGSenasa.Checked) then
     begin
      EAEncabezado.Visible:= True;
      EAUltimoIdent.Visible:= True;
      CBCUIGPropio.Visible:= True;
      LCUIGPropio.Visible := true;
      if (CBCUIGPropio.Checked) then
        DBLCBACUIGPropio.Visible:= True;
     end;

    if (RBReidentificacionSenasa.Checked) then
     begin
      Lr.Visible:= True;
      EAEncabezadoReidentificacion.Visible:= True;
      EAUltimoIdentReidentificacion.Visible:= True;
     end;
    {LCantidad.Left:= 689;
    LCantidad.Top:= 23;
    EACantidad.Left:= 739;
    EACantidad.Top:= 23;
    LRpInicial.Left:= 533;
    EAPrefijo.Left:= 572;
    EARpInicial.Left:= 600;
    EASufijo.Left:= 652;  }
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

      BDBGGrillaHembras.ColumnByField('ID_HBA').Title.Caption:=Traducir('HBU');
      BDBGGrillaMachos.ColumnByField('ID_HBA').Title.Caption:=Traducir('HBU');

      Lr.Visible:= false;
      EAEncabezadoReidentificacion.Visible:= false;
      EAUltimoIdentReidentificacion.Visible:= false;
      RBReidentificacionSenasa.Visible:= false;

      //RBSenasa.Width:= 73;
      //LRpInicial.Left := 540;
      LRpInicial.Top := 42;
      EAPrefijo.Top := 42;
      EASufijo.Top:= 42;
      EARpInicial.Top:= 42;

      {LRpInicial.Left:= 588;
      EAPrefijo.Left:= 627;
      EARpInicial.Left:= 655;
      EASufijo.Left:= 707;
      EACantidad.Left:= 572;
      EACantidad.Top:= 59;
      LCantidad.Left:= 524;
      LCantidad.Top:= 62;}
      if RBSenasa.Checked then
        begin
         // EARpInicial.Left := 620;

          //LRpInicial.Left := 590;
        end;
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

        BDBGGrillaHembras.ColumnByField('ID_HBA').Title.Caption:=Traducir('HBU');
        BDBGGrillaMachos.ColumnByField('ID_HBA').Title.Caption:=Traducir('HBU');

        Lr.Visible:= false;
        EAEncabezadoReidentificacion.Visible:= false;
        EAUltimoIdentReidentificacion.Visible:= false;
        RBReidentificacionSenasa.Visible:= false;

        //RBSenasa.Width:= 73;
        //LRpInicial.Left := 540;
        LRpInicial.Top := 42;
        EAPrefijo.Top := 42;
        EASufijo.Top:= 42;
        EARpInicial.Top:= 42;

        RBEquivalencias.Top := 100;
        JvIEquivalencias.Top := 85;
        {LRpInicial.Left:= 588;
        EAPrefijo.Left:= 627;
        EARpInicial.Left:= 655;
        EASufijo.Left:= 707;
        EACantidad.Left:= 572;
        EACantidad.Top:= 59;
        LCantidad.Left:= 524;
        LCantidad.Top:= 62;}
        if RBSenasa.Checked then
          begin
           // EARpInicial.Left := 620;

            //LRpInicial.Left := 590;
          end;
       end;
end;

procedure TFEveAltaMasiva.LCUIGPropioClick(Sender: TObject);
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
        GetEvent(DBLCBACUIGPropio);
      end;
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
    end;
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

  if(Column.FieldName = 'VUNO2') then
    if (CDSGrillaMachos.FieldByName('categoria').AsInteger = 1) then
      CambiarValorColumna(Column);
  BDBGGrillaMachosColEnter(nil);
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
begin
  inherited;
  case DBLCBACategoria.KeyValue of
    1,2,3 : CBSexo.ItemIndex := 0;
    4,5,6 : CBSexo.ItemIndex := 1;
  end;
  CBSexoClick(nil);
  CBSexoCloseUp(nil);
  CBSexoChange(nil);


  if (DBLCBACategoria.KeyValue <> null) then
  begin
    if DBLCBACategoria.KeyValue = 6 then
    begin
      LEstadoLactacion.Visible := true;
      EAEstadoLactacion.Visible := true;
      EAEstadoLactacion.EsRequerido := true;
      ControlEventoOnExit(nil);
    end
    else
    begin
      LEstadoLactacion.Visible := false;
      EAEstadoLactacion.Visible := false;
      EAEstadoLactacion.EsRequerido := false;
      ControlEventoOnExit(nil);
    end;
    if(DBLCBACategoria.KeyValue <> 1)then
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

procedure TFEveAltaMasiva.cargarNuevos(i:integer);
var edad :integer;
    fecha: TDate;
    str, strA, rp, aux_circ, col :string;
    f:double;
    nroRepe:integer;
    bool1,bool2,bool3:boolean;
    abm:TFABMPadresExternos;
    intAux:integer;
    aux_rp : String;
begin
inherited;

  if (Owner is TFMensajeNuevos) then
    if (Owner as TFMensajeNuevos).evento = 49 then
      aux_rp := 'rp (madre evento)'
    else
      aux_rp := 'rp'
  else
    aux_rp := 'rp';
  FAvanceTerminar.Pos:=FAvanceTerminar.Pos+1;
  if (anim[i].id=-1) or ((anim[i].id<>-1000)and(FImportacion.Owner is TFEveAltamasiva)) then
  begin
  dtpafechaalta.DateTime:=strtodatetime(getDato('fecha',anim[i]));
  if (UpperCase(getDato('categoría',anim[i]))='TERNERO') or (UpperCase(getDato('categoría',anim[i]))='NOVILLO') or (UpperCase(getDato('categoría',anim[i]))='TORO') then
    begin  //ciclo de machos
      sexo:=1;
      //CBDiagnostico.Visible := false;
      begin
        //try
          IBQGenIDAnimal.Close;
          IBQGenIDAnimal.Open;
          CDSGrillaMachos.Insert;
          CDSGrillaMachos.FieldByName('id_rp').AsString := getDato(aux_rp,anim[i]);
          CDSGrillaMachos.FieldByName('id_ie').AsString :=getDato('ie',anim[i]);
          CDSGrillaMachos.FieldByName('id_senasa').AsString := getDato('senasa',anim[i]);
          CDSGrillaMachos.FieldByName('id_hba').AsString := getDato('hba',anim[i]);
          CDSGrillaMachos.FieldByName('id_animal').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];
          CDSGrillaMachos.FieldByName('id_aux').AsInteger := CDSGrillaMachos.FieldByName('id_animal').AsInteger;
          anim[i].id:=CDSGrillaMachos.FieldByName('id_animal').AsInteger;

          if self.Owner is TFMensajeNuevos then
            CDSGrillaMachos.FieldByName('peso').Value:= '0'
          else
          begin
            str := getDato('peso',anim[i]);
            if TryStrToFloat(str,f) then
              CDSGrillaMachos.FieldByName('peso').Value:= str
            else
              CDSGrillaMachos.FieldByName('peso').Value:= '0';
          end;

          str := getDato('raza',anim[i]);
          str := UpperCase(str);

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

          if (str='ABERDEEN ANGUS') or (str='HEREFORD') or (str='BRANGUS') then
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
              if str = 'ABERDEEN ANGUS' then
              begin
                if strA = 'COLORADO' then
                begin
                   CDSGrillaMachos.FieldByName('COLOR').Value := 2;
                   CDSGrillaMachos.FieldByName('NOMCOLOR').Text := 'COLORADO';
                end
                else
                begin
                    CDSGrillaMachos.FieldByName('COLOR').Value := 1;
                    CDSGrillaMachos.FieldByName('NOMCOLOR').Text := 'NEGRO';
                end;
              end
              else
              begin
                if strA = 'COLORADO' then
                begin
                   CDSGrillaMachos.FieldByName('COLOR').Value := 2;
                   CDSGrillaMachos.FieldByName('NOMCOLOR').Text := 'COLORADO';
                end
                else
                begin
                    CDSGrillaMachos.FieldByName('COLOR').Value := 1;
                    CDSGrillaMachos.FieldByName('NOMCOLOR').Text := 'NEGRO';
                end;
              end;
            end;
          end;
          if str='' then str:='NN';
          if DBLCBARaza.ListSource.DataSet.Lookup('SINONIMO',str,'CODIGO')<>null then
             CDSGrillaMachosRAZA.AsInteger:= DBLCBARaza.ListSource.DataSet.Lookup('SINONIMO',str,'ID_RAZA')
          else
             CDSGrillaMachosRAZA.AsInteger:= DBLCBARaza.ListSource.DataSet.Lookup('CODIGO',str,'ID_RAZA');
          CDSGrillaMachos.FieldByName('V6').Value := DBLCBARaza.ListSource.DataSet.Lookup('ID_RAZA',CDSGrillaMachosRAZA.AsInteger,'SINONIMO');

          CDSGrillaMachos.FieldByName('SUBCATEGORIA').Value := 0;
          CDSGrillaMachos.FieldByName('V14').AsString := 'NO DEFINIDO';
          CDSGrillaMachos.FieldByName('INSPECCION').Value := null;
          CDSGrillaMachos.FieldByName('V15').AsString := '';
          CDSGrillaMachos.FieldByName('DESTINO_CAB').Value := null;
          CDSGrillaMachos.FieldByName('V16').AsString := '';
          CDSGrillaMachos.FieldByName('MOCHO').Value := null;
          CDSGrillaMachos.FieldByName('V17').AsString := '';
          if CDSGrillaMachosRAZA.AsInteger in [2,3,5,10,11,12,28] then
          begin
            DMSoftvet.IBQSubCategoriaRaza.Close;
            DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := CDSGrillaMachosRAZA.AsInteger;
            DMSoftvet.IBQSubCategoriaRaza.Open;
            BDBGGrillaMachos.Columns[5].Visible := true;
            if not (CDSGrillaMachosRAZA.AsInteger in [2,3]) then
            begin
              DMSoftvet.IBQMocho.Close;
              DMSoftvet.IBQMocho.ParamByName('raza').AsInteger := CDSGrillaMachosRAZA.AsInteger;
              DMSoftvet.IBQMocho.Open;
              BDBGGrillaMachos.Columns[6].Visible := true;

              str:=(getDato('mocho/astado',anim[i]));
              if str = '' then
                str := 'ND';
              if DMSoftvet.IBQMocho.Lookup('CODIGO',str,'NOMBRE') <> null then
                str := DMSoftvet.IBQMocho.Lookup('CODIGO',str,'NOMBRE');
              CDSGrillaMachos.FieldByName('MOCHO').Value := DMSoftvet.IBQMocho.Lookup('nombre',str,'id_mocho');
              CDSGrillaMachos.FieldByName('V17').AsString := str;
              if CDSGrillaMachosRAZA.AsInteger <> 5 then
              begin
                BDBGGrillaMachos.Columns[7].Visible := true;
                BDBGGrillaMachos.Columns[8].Visible := true;

                str:=(getDato('inspección',anim[i]));
                if str = '' then
                  str := 'ND';
                if DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE')<>null then
                  str := DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE');
                CDSGrillaMachos.FieldByName('INSPECCION').Value := DMSoftvet.IBQInspeccion.Lookup('nombre',str,'id_inspeccion');
                CDSGrillaMachos.FieldByName('V15').AsString := str;

                str:=(getDato('destino',anim[i]));
                if str = '' then
                  str := 'ND';
                if DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE')<>null then
                  str := DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE');
                CDSGrillaMachos.FieldByName('DESTINO_CAB').Value := DMSoftvet.IBQCodDestCabania.Lookup('nombre',str,'id_dest_cabania');
                CDSGrillaMachos.FieldByName('V16').AsString := str;
              end;
            end;
            str:=(getDato('tipo de registro',anim[i]));
            if str = '' then
              str := 'ND';
            if DMSoftvet.IBQSubCategoriaRaza.Lookup('CODIGO',str,'NOMBRE')<>null then
              str := DMSoftvet.IBQSubCategoriaRaza.Lookup('CODIGO',str,'NOMBRE');
            CDSGrillaMachos.FieldByName('SUBCATEGORIA').Value := DMSoftvet.IBQSubCategoriaRaza.Lookup('nombre',str,'id_subcategoria');
            CDSGrillaMachos.FieldByName('V14').AsString := str;
          end;

          case CDSGrillaMachosRAZA.AsInteger of
            11 : begin
                  BDBGGrillaMachos.Columns[14].Title.Caption := Traducir('ABA');
                  BDBGGrillaMachos.Columns[15].Title.Caption := Traducir('UBB');
                  BDBGGrillaMachos.Columns[14].Visible := true;
                  BDBGGrillaMachos.Columns[15].Visible := true;
                  CDSGrillaMachos.FieldByName('id_pc').AsString := getDato('aba',anim[i]);
                  CDSGrillaMachos.FieldByName('id_ra').AsString := getDato('ubb',anim[i]);
                 end;
            2,3 : begin
                    BDBGGrillaMachos.Columns[14].Title.Caption := Traducir('PC');
                    BDBGGrillaMachos.Columns[15].Title.Caption := Traducir('RA');
                    BDBGGrillaMachos.Columns[14].Visible := true;
                    BDBGGrillaMachos.Columns[15].Visible := false;
                    CDSGrillaMachos.FieldByName('id_pc').AsString := getDato('pc',anim[i]);
                    CDSGrillaMachos.FieldByName('id_ra').AsString := '';
                  end;
            10 : begin
                  BDBGGrillaMachos.Columns[14].Title.Caption := Traducir('RGB');
                  BDBGGrillaMachos.Columns[15].Title.Caption := Traducir('RA');
                  BDBGGrillaMachos.Columns[14].Visible := true;
                  BDBGGrillaMachos.Columns[15].Visible := false;
                  CDSGrillaMachos.FieldByName('id_pc').AsString := getDato('rgb',anim[i]);
                  CDSGrillaMachos.FieldByName('id_ra').AsString := '';
                 end;
            12,28 : begin
                      BDBGGrillaMachos.Columns[14].Title.Caption := Traducir('AAB');
                      BDBGGrillaMachos.Columns[15].Title.Caption := Traducir('RA');
                      BDBGGrillaMachos.Columns[14].Visible := true;
                      BDBGGrillaMachos.Columns[15].Visible := false;
                      CDSGrillaMachos.FieldByName('id_pc').AsString := getDato('aab',anim[i]);
                      CDSGrillaMachos.FieldByName('id_ra').AsString := '';
                    end;
            else
            begin
              BDBGGrillaMachos.Columns[14].Visible := false;
              BDBGGrillaMachos.Columns[15].Visible := false;
              CDSGrillaMachos.FieldByName('id_ra').AsString := '';
              CDSGrillaMachos.FieldByName('id_pc').AsString := '';
            end;
          end;

          if getDato('condición corporal',anim[i])<>'' then
          begin
            CDSGrillaMachos.FieldByName('V2').Value:= getDato('condición corporal',anim[i]);
            CDSGrillaMachos.FieldByName('condicion_corporal').Value:= DBLCBACondicionC.ListSource.DataSet.Lookup('escala',CDSGrillaMachos.FieldByName('V2').Value,'ID_CONDICION_CORPORAL');
          end
          else
          begin
            CDSGrillaMachos.FieldByName('condicion_corporal').Value:= null;
            CDSGrillaMachos.FieldByName('V2').Value:= '';
          end;
          DMSoftvet.IBQCategAnimal.Active:=false;
          DMSoftvet.IBQCategAnimal.ParamByName('SEXO').AsInteger := 1;
          DMSoftvet.IBQCategAnimal.Active:=true;
          str:=(getDato('categoría',anim[i]));
          if DBLCBACategoria.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE')<>null then
            str:=DBLCBACategoria.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE');
          CDSGrillaMachos.FieldByName('V5').Value:=str;
          CDSGrillaMachos.FieldByName('CATEGORIA').AsInteger:=DBLCBACategoria.ListSource.DataSet.Lookup('NOMBRE',CDSGrillaMachos.FieldByName('V5').Value,'ID_CATEGORIA');

          CDSGrillaMachos.FieldByName('DTA').AsString := (getDato('dta',anim[i]));
          str:=getDato('cronología',anim[i]);
          if str='' then str:='NN';
          if DBLCBACronologiaD.ListSource.DataSet.Lookup('SINONIMO',str,'CODIGO')<>null then
             str:=DBLCBACronologiaD.ListSource.DataSet.Lookup('SINONIMO',str,'CODIGO');
          CDSGrillaMachos.FieldByName('cronologia_dentaria').Value:= DBLCBACronologiaD.ListSource.DataSet.Lookup('CODIGO',str,'ID_CRONOLOGIA_DENTARIA');
          CDSGrillaMachos.FieldByName('V3').AsString:= DBLCBACronologiaD.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE');

          str:=getDato('fecha N',anim[i]);
          if str<>'' then
            CDSGrillaMachos.FieldByName('fecha_nacimiento').AsDateTime:= StrToDateTime(str)
          else
          begin
            edad := completarEdadCD(CDSGrillaMachos.FieldByName('cronologia_dentaria').AsInteger);
            fecha := incMonth(strtodatetime(getDato('fecha',anim[i])),-edad);
            if edad<>0 then
              CDSGrillaMachos.FieldByName('fecha_nacimiento').AsDateTime:= fecha
            else
            begin
              //si no existe, cargar la categoria en un stringlist que luego se pasa como parametro al
              //cartel de las edades por defecto
              CDSGrillaMachos.FieldByName('fecha_nacimiento').AsString:='';
              if listaCats.IndexOf(CDSGrillaMachos.FieldByName('V5').AsString)=-1 then
                listaCats.Add(CDSGrillaMachos.FieldByName('V5').AsString);
            end;
          end;

          aux_circ := getDato('circunferencia escrotal',anim[i]);
          if aux_circ <> '' then
            CDSGrillaMachos.FieldByName('circunferencia_escrotal').AsFloat := StrToFloat(aux_circ)
          else
            CDSGrillaMachos.FieldByName('circunferencia_escrotal').Value := null;
          str:=getDato('nombre',anim[i]);
          if str<>'' then
            CDSGrillaMachos.FieldByName('nombre').AsString:=str
          else
            CDSGrillaMachos.FieldByName('nombre').AsString:=CDSGrillaMachos.FieldByName('id_rp').AsString;
          CDSGrillaMachos.FieldByName('V6').AsString:= DBLCBARaza.ListSource.DataSet.Lookup('ID_RAZA',CDSGrillaMachosRAZA.AsInteger,'NOMBRE');
          if DBLCBARodeo.ListSource.DataSet.Lookup('NOMBRE',UpperCase(getDato('rodeo',anim[i])),'ID_RODEO')<>null then
            CDSGrillaMachos.FieldByName('V8').AsString := uppercase(getDato('rodeo',anim[i]))
          else
            CDSGrillaMachos.FieldByName('V8').AsString := 'INDEFINIDO';
          CDSGrillaMachos.FieldByName('RODEO').AsInteger := DBLCBARodeo.ListSource.DataSet.Lookup('NOMBRE',CDSGrillaMachos.FieldByName('V8').AsString,'ID_RODEO');

          CDSGrillaMachos.FieldByName('VUno1').AsString := 'G';
          CDSGrillaMachos.FieldByName('V9').AsString := 'GENERAL';

          DBLCBAPotrero.ListSource.DataSet.Close;
          DBLCBAPotrero.ListSource.DataSet.Open;
          str:=getDato('potrero',anim[i]);
          if (str='') or (DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',str,'ID_POTRERO')=null) then
          begin
            CDSGrillaMachos.FieldByName('POTRERO').AsInteger := 0;//DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE','INDEFINIDO','ID_POTRERO');
            CDSGrillaMachos.FieldByName('V7').AsString := 'INDEFINIDO';
          end
          else
          begin
              CDSGrillaMachos.FieldByName('POTRERO').AsInteger := DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',str,'ID_POTRERO');
              CDSGrillaMachos.FieldByName('V7').AsString := str;
          end;

          str:=getDato('tipo alta',anim[i]);
          if str='' then str:='CESIÓN DE ALTA';
          CDSGrillaMachos.FieldByName('TIPO_ALTA').AsInteger := DBLCBAtipoAlta.ListSource.DataSet.Lookup('nombre',str,'id_tipo_alta');
          CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime := strtodatetime(getDato('fecha',anim[i]));
          CDSGrillaMachos.FieldByName('OBSERVACION').AsString := getDato('observación',anim[i]);
          str:=getDato('actividad',anim[i]);
          if str='' then str:='NO DEFINIDA';
          CDSGrillaMachos.FieldByName('V10').AsString :=str;
          CDSGRillaMachos.FieldByName('ACTIVIDAD').AsInteger := DBLCBAActividad.ListSource.DataSet.Lookup('SINONIMO',CDSGrillaMachos.FieldByName('V10').AsString,'ID_ACTIVIDAD');

          if DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',getDato('responsable',anim[i]),'ID_EMPLEADO')<>null then
            CDSGrillaMachos.FieldByName('RESPONSABLE').Value := DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',getDato('responsable',anim[i]),'ID_EMPLEADO')
          else
            CDSGrillaMachos.FieldByName('RESPONSABLE').Value := 0;
          trystrtofloat(getDato('precio u',anim[i]),f);
          CDSGrillaMachos.FieldByName('PRECIO_UNITARIO').asFloat := f;
          trystrtofloat(getDato('precio b',anim[i]),f);
          CDSGrillaMachos.FieldByName('PRECIO_BRUTO').asFloat := f;
          trystrtofloat(getDato('gastos',anim[i]),f);
          CDSGrillaMachos.FieldByName('GASTOS').asFloat := f;
          CDSGrillaMachos.FieldByName('SEXO').Value :=1;

          CDSGrillaMachos.FieldByName('APODO').AsString:=getDato('apodo',anim[i]);
          CDSGrillaMachos.FieldByName('ID_OTRO').AsString:=getDato('otro',anim[i]);
          CDSGrillaMachos.FieldByName('ADN').AsString:=getDato('adn',anim[i]);
          CDSGrillaMachos.FieldByName('TIPIFICACION_SANGUINEA').AsString:=getDato('tipificación sanguínea',anim[i]);
          str:=getDato('orígen',anim[i]);
          if DMSoftvet.IBQCodOrigen.Lookup('SINONIMO',str,'ID_ORIGEN')<>null then
            CDSGrillaMachos.FieldByName('V11').Value:=str
          else
            CDSGrillaMachos.FieldByName('V11').Value:='NO DEFINIDO';
          CDSGrillaMachos.FieldByName('ORIGEN_ANIMAL').Value:=DMSoftvet.IBQCodOrigen.Lookup('SINONIMO',CDSGrillaMachos.FieldByName('V11').Value,'ID_ORIGEN');
          str:=getDato('criador',anim[i]);
          if DMSoftvet.IBQCodCriador.Lookup('SINONIMO',str,'ID_CRIADOR')<>null then
            CDSGrillaMachos.FieldByName('V12').Value:=str
          else
            CDSGrillaMachos.FieldByName('V12').Value:='NO DEFINIDO';
          CDSGrillaMachos.FieldByName('CRIADOR').Value:=DMSoftvet.IBQCodCriador.Lookup('SINONIMO',CDSGrillaMachos.FieldByName('V12').Value,'ID_CRIADOR');
          str:=getDato('propietario',anim[i]);
          if DMSoftvet.IBQCodPropietario.Lookup('SINONIMO',str,'ID_PROPIETARIO')<>null then
            CDSGrillaMachos.FieldByName('V13').Value:=str
          else
            CDSGrillaMachos.FieldByName('V13').Value:='NO DEFINIDO';
          CDSGrillaMachos.FieldByName('PROPIETARIO').Value:=DMSoftvet.IBQCodPropietario.Lookup('SINONIMO',CDSGrillaMachos.FieldByName('V13').Value,'ID_PROPIETARIO');

          cargarPadres(CDSGrillaMachos,i);

          str:=CDSGrillaMachos.FieldByName('id_rp').AsString;
          nroRepe:=buscarRepetidos(str,'ID_RP');
          if (nroRepe>=1) then
          begin
              CDSGrillaMachos.FieldByName('ew').AsString := 'W';
              MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'RP')  +' = '+str);
          end
          else
              CDSGrillaMachos.FieldByName('ew').AsString := ' ';

          str:=CDSGrillaMachos.FieldByName('id_ie').AsString;
          if str<>'' then
          begin
            nroRepe:=buscarRepetidos(str,'ID_IE');
            if (nroRepe>=1) then
            begin
                CDSGrillaMachos.FieldByName('ew').AsString := 'E';
                MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'IE' ) +' = '+str+Traducir('. Por favor verifique el error'));
            end
            else
                CDSGrillaMachos.FieldByName('ew').AsString := ' ';
          end;

         CDSGrillaMachos.Post;
        end;

     end
  else
     begin //ciclo de Hembras
        //try
          IBQGenIDAnimal.Close;
          IBQGenIDAnimal.Open;
          CDSGrillaHembras.Insert;
          CDSGrillaHembras.FieldByName('id_rp').AsString := getDato(aux_rp,anim[i]);
          CDSGrillaHembras.FieldByName('id_ie').AsString := getDato('ie',anim[i]);
          CDSGrillaHembras.FieldByName('id_senasa').AsString := getDato('senasa',anim[i]);
          CDSGrillaHembras.FieldByName('id_hba').AsString := getDato('hba',anim[i]);

          CDSGrillaHembras.FieldByName('id_animal').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];
          CDSGrillaHembras.FieldByName('id_aux').AsInteger := CDSGrillaHembras.FieldByName('id_animal').AsInteger;

          DMSoftvet.IBQCategAnimal.Active:=false;
          DMSoftvet.IBQCategAnimal.ParamByName('SEXO').AsInteger := 2; //ver, aca se usa solo para hembras
          DMSoftvet.IBQCategAnimal.Active:=true;
          str:=(getDato('categoría',anim[i]));
          if DBLCBACategoria.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE')<>null then
            str:=DBLCBACategoria.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE');
          CDSGrillaHembras.FieldByName('V5').Value:=str;
          CDSGrillaHembras.FieldByName('CATEGORIA').AsInteger:= DBLCBACategoria.ListSource.DataSet.Lookup('NOMBRE',CDSGrillaHembras.FieldByName('V5').Value,'ID_CATEGORIA');

          str := getDato('raza',anim[i]);
          str := Uppercase(str);
          if (str='ABERDEEN ANGUS') or (str='HEREFORD') or (str='BRANGUS') then
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
              if str = 'ABERDEEN ANGUS' then
              begin
                if strA = 'COLORADO' then
                begin
                  CDSGrillaHembras.FieldByName('COLOR').Value := 2;
                  CDSGrillaHembras.FieldByName('NOMCOLOR').Text := 'COLORADO';
                end
                else
                begin
                  CDSGrillaHembras.FieldByName('NOMCOLOR').Text := 'NEGRO';
                  CDSGrillaHembras.FieldByName('COLOR').Value := 1;
                end;
              end
              else
              begin
                if strA = 'COLORADO' then
                begin
                  CDSGrillaHembras.FieldByName('COLOR').Value := 2;
                  CDSGrillaHembras.FieldByName('NOMCOLOR').Text := 'COLORADO';
                end
                else
                begin
                  CDSGrillaHembras.FieldByName('NOMCOLOR').Text := 'NEGRO';
                  CDSGrillaHembras.FieldByName('COLOR').Value := 1;
                end;
              end;
            end;
          end;
          if str = 'CRUZA' then
            str := 'CRUZA CEBUINO';

          if str='' then str:='NN';
          if DBLCBARaza.ListSource.DataSet.Lookup('SINONIMO',str,'CODIGO')<>null then
             CDSGrillaHembrasRAZA.AsInteger:= DBLCBARaza.ListSource.DataSet.Lookup('SINONIMO',str,'ID_RAZA')
          else
             CDSGrillaHembrasRAZA.AsInteger:= DBLCBARaza.ListSource.DataSet.Lookup('CODIGO',str,'ID_RAZA');
          CDSGrillaHembras.FieldByName('V6').Value := DBLCBARaza.ListSource.DataSet.Lookup('ID_RAZA',CDSGrillaHembrasRAZA.AsInteger,'SINONIMO');


          CDSGrillaHembras.FieldByName('SUBCATEGORIA').Value := 0;
          CDSGrillaHembras.FieldByName('V14').AsString := 'NO DEFINIDO';
          CDSGrillaHembras.FieldByName('INSPECCION').Value := null;
          CDSGrillaHembras.FieldByName('V15').AsString := '';
          CDSGrillaHembras.FieldByName('DESTINO_CAB').Value := null;
          CDSGrillaHembras.FieldByName('V16').AsString := '';
          CDSGrillaHembras.FieldByName('MOCHO').Value := null;
          CDSGrillaHembras.FieldByName('V17').AsString := '';
          if CDSGrillaHembrasRAZA.AsInteger in [2,3,5,10,11,12,28,25] then
          begin
            DMSoftvet.IBQSubCategoriaRaza.Close;
            DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := CDSGrillaHembrasRAZA.AsInteger;
            DMSoftvet.IBQSubCategoriaRaza.Open;
            BDBGGrillaHembras.Columns[5].Visible := true;
            if not (CDSGrillaHembrasRAZA.AsInteger in [2,3]) then
            begin
              DMSoftvet.IBQMocho.Close;
              DMSoftvet.IBQMocho.ParamByName('raza').AsInteger := CDSGrillaHembrasRAZA.AsInteger;
              DMSoftvet.IBQMocho.Open;
              BDBGGrillaHembras.Columns[6].Visible := true;

              str:=(getDato('mocho/astado',anim[i]));
              if str = '' then
                str := 'ND';
              if DMSoftvet.IBQMocho.Lookup('CODIGO',str,'NOMBRE') <> null then
                str := DMSoftvet.IBQMocho.Lookup('CODIGO',str,'NOMBRE');
              CDSGrillaHembras.FieldByName('MOCHO').Value := DMSoftvet.IBQMocho.Lookup('nombre',str,'id_mocho');
              CDSGrillaHembras.FieldByName('V17').AsString := str;
              if CDSGrillaHembrasRAZA.AsInteger <> 5 then
              begin
                BDBGGrillaHembras.Columns[7].Visible := true;
                BDBGGrillaHembras.Columns[8].Visible := true;

                str:=(getDato('inspección',anim[i]));
                if str = '' then
                  str := 'ND';
                if DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE')<>null then
                  str := DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE');
                CDSGrillaHembras.FieldByName('INSPECCION').Value := DMSoftvet.IBQInspeccion.Lookup('nombre',str,'id_inspeccion');
                CDSGrillaHembras.FieldByName('V15').AsString := str;

                str:=(getDato('destino',anim[i]));
                if str = '' then
                  str := 'ND';
                if DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE')<>null then
                  str := DMSoftvet.IBQInspeccion.Lookup('CODIGO',str,'NOMBRE');
                CDSGrillaHembras.FieldByName('DESTINO_CAB').Value := DMSoftvet.IBQCodDestCabania.Lookup('nombre',str,'id_dest_cabania');
                CDSGrillaHembras.FieldByName('V16').AsString := str;
              end;
            end;
            str:=(getDato('tipo de registro',anim[i]));
            if str = '' then
              str := 'ND';
            if DMSoftvet.IBQSubCategoriaRaza.Lookup('CODIGO',str,'NOMBRE')<>null then
              str := DMSoftvet.IBQSubCategoriaRaza.Lookup('CODIGO',str,'NOMBRE');
            CDSGrillaHembras.FieldByName('SUBCATEGORIA').Value := DMSoftvet.IBQSubCategoriaRaza.Lookup('nombre',str,'id_subcategoria');
            CDSGrillaHembras.FieldByName('V14').AsString := str;
          end;

          case CDSGrillaHembrasRAZA.AsInteger of
            11 : begin
                  BDBGGrillaHembras.Columns[14].Title.Caption := Traducir('ABA');
                  BDBGGrillaHembras.Columns[15].Title.Caption := Traducir('UBB');
                  BDBGGrillaHembras.Columns[14].Visible := true;
                  BDBGGrillaHembras.Columns[15].Visible := true;
                  CDSGrillaHembras.FieldByName('id_pc').AsString := getDato('aba',anim[i]);
                  CDSGrillaHembras.FieldByName('id_ra').AsString := getDato('ubb',anim[i]);
                 end;
            2,3 : begin
                    BDBGGrillaHembras.Columns[14].Title.Caption := Traducir('PC');
                    BDBGGrillaHembras.Columns[15].Title.Caption := Traducir('RA');
                    BDBGGrillaHembras.Columns[14].Visible := true;
                    BDBGGrillaHembras.Columns[15].Visible := false;
                    CDSGrillaHembras.FieldByName('id_pc').AsString := getDato('pc',anim[i]);
                    CDSGrillaHembras.FieldByName('id_ra').AsString := '';
                  end;
            10 : begin
                  BDBGGrillaHembras.Columns[14].Title.Caption := Traducir('RGB');
                  BDBGGrillaHembras.Columns[15].Title.Caption := Traducir('RA');
                  BDBGGrillaHembras.Columns[14].Visible := true;
                  BDBGGrillaHembras.Columns[15].Visible := false;
                  CDSGrillaHembras.FieldByName('id_pc').AsString := getDato('rgb',anim[i]);
                  CDSGrillaHembras.FieldByName('id_ra').AsString := '';
                 end;
            12,28 : begin
                      BDBGGrillaHembras.Columns[14].Title.Caption := Traducir('AAB');
                      BDBGGrillaHembras.Columns[15].Title.Caption := Traducir('RA');
                      BDBGGrillaHembras.Columns[14].Visible := true;
                      BDBGGrillaHembras.Columns[15].Visible := false;
                      CDSGrillaHembras.FieldByName('id_pc').AsString := getDato('aab',anim[i]);
                      CDSGrillaHembras.FieldByName('id_ra').AsString := '';
                    end;
            else
            begin
              BDBGGrillaHembras.Columns[14].Visible := false;
              BDBGGrillaHembras.Columns[15].Visible := false;
              CDSGrillaHembras.FieldByName('id_ra').AsString := '';
              CDSGrillaHembras.FieldByName('id_pc').AsString := '';
            end;
          end;

          str:=getDato('nombre',anim[i]);
          if str<>'' then
            CDSGrillaHembras.FieldByName('nombre').AsString:=str
          else
            CDSGrillaHembras.FieldByName('nombre').AsString:=CDSGrillaHembras.FieldByName('id_rp').AsString;
          anim[i].id:=CDSGrillaHembras.FieldByName('id_animal').AsInteger;

          if self.Owner is TFMensajeNuevos then
            CDSGrillaHembras.FieldByName('peso').Value:= '0'
          else
          begin
            str := getDato('peso',anim[i]);
            if TryStrToFloat(str,f) then
              CDSGrillaHembras.FieldByName('peso').Value:= str
            else
              CDSGrillaHembras.FieldByName('peso').Value:= '0';
          end;

          str:=getDato('gdr',anim[i]);
          if DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE')<>null then
            str:= DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE');
          if str<>'' then
            begin
            if DBLCBAGdr.ListSource.DataSet.Lookup('ID_GDR',str,'SINONIMO')<>null then
              begin
              CDSGrillaHembras.FieldByName('GDR').AsInteger:= strtoint(str);
              CDSGrillaHembras.FieldByName('V1').AsString := DBLCBAGdr.ListSource.DataSet.Lookup('ID_GDR',CDSGrillaHembras.FieldByName('GDR').AsInteger,'SINONIMO');
              end
            else
              begin
              CDSGrillaHembras.FieldByName('V1').AsString:= str;
              if DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',CDSGrillaHembras.FieldByName('V1').AsString,'SINONIMO')<>null then
                CDSGrillaHembras.FieldByName('V1').AsString := DBLCBAGdr.ListSource.DataSet.Lookup('CODIGO',CDSGrillaHembras.FieldByName('V1').AsString,'SINONIMO');
              CDSGrillaHembras.FieldByName('GDR').AsInteger := DBLCBAGdr.ListSource.DataSet.Lookup('SINONIMO',CDSGrillaHembras.FieldByName('V1').AsString,'ID_GDR');
              end;
            end
          else
            begin
            CDSGrillaHembras.FieldByName('GDR').AsInteger:= 0;
            CDSGrillaHembras.FieldByName('V1').AsString:= 'NO DEFINIDO';
            end;

          CDSGrillaHembras.FieldByName('DTA').AsString := '';
          str:=getDato('cronología',anim[i]);
          if str='' then str:='NN';
          if DBLCBACronologiaD.ListSource.DataSet.Lookup('SINONIMO',str,'CODIGO')<>null then
             str:=DBLCBACronologiaD.ListSource.DataSet.Lookup('SINONIMO',str,'CODIGO');
          CDSGrillaHembras.FieldByName('cronologia_dentaria').AsInteger:= DBLCBACronologiaD.ListSource.DataSet.Lookup('CODIGO',str,'ID_CRONOLOGIA_DENTARIA');
          CDSGrillaHembras.FieldByName('V3').AsString:= DBLCBACronologiaD.ListSource.DataSet.Lookup('CODIGO',str,'NOMBRE');

          str:=getDato('cantidad partos',anim[i]);
          if str='' then
            if CDSGrillaHembras.FieldByName('V5').AsString='VACA' then
              CDSGrillaHembras.FieldByName('estado_lactacion').AsInteger:= 1
            else
              CDSGrillaHembras.FieldByName('estado_lactacion').AsInteger:= 0
          else
            CDSGrillaHembras.FieldByName('estado_lactacion').AsInteger:=strtoint(str);
          str:=getDato('estado reproductivo',anim[i]);
          if (str='CABEZA') or (str='CUERPO') or (str='COLA') then
            str:='PREÑADA';
          if (CDSGrillaHembras.FieldByName('V5').Value<>'TERNERA') and (str<>'') then
            CDSGrillaHembras.FieldByName('V4').AsString:= str
          else
            CDSGrillaHembras.FieldByName('V4').AsString:= 'NO DEFINIDO';
          CDSGrillaHembras.FieldByName('estado_reproductivo').AsInteger:=DBLCBAEstadoR.ListSource.DataSet.Lookup('NOMBRE',CDSGrillaHembras.FieldByName('V4').AsString,'ID_ESTADO_REPRODUCTIVO');

          CDSGrillaHembras.FieldByName('VUno1').AsString := 'G';
          CDSGrillaHembras.FieldByName('V9').AsString := 'GENERAL';
          str:=getDato('condición',anim[i]);
          if str<>'' then
            begin
            CDSGrillaHembras.FieldByName('V2').Value:= str;//normalizarCC(str,getDato('Tipo Condición',anim[i]));
            CDSGrillaHembras.FieldByName('condicion_corporal').Value:= DBLCBACondicionC.ListSource.DataSet.Lookup('escala',CDSGrillaHembras.FieldByName('V2').Value,'ID_CONDICION_CORPORAL');
            end
          else
            begin
            CDSGrillaHembras.FieldByName('condicion_corporal').Value:= null;
            CDSGrillaHembras.FieldByName('V2').AsString:= '';
            end;

          str:=getDato('fecha n',anim[i]);
          if str<>'' then
            CDSGrillaHembras.FieldByName('fecha_nacimiento').AsDateTime:= StrToDateTime(str)
          else
            begin
            edad := completarEdadCD(CDSGrillaHembras.FieldByName('cronologia_dentaria').AsInteger);
            fecha := incMonth(strtodatetime(getDato('fecha',anim[i])),-edad);
            if edad<>0 then
              CDSGrillaHembras.FieldByName('fecha_nacimiento').AsDateTime:= fecha
            else
              begin
              //si no existe, cargar la categoria en un stringlist que luego se pasa como parametro al
              //cartel de las edades por defecto
              CDSGrillaHembras.FieldByName('fecha_nacimiento').AsString:='';
              if listaCats.IndexOf(CDSGrillaHembras.FieldByName('V5').AsString)=-1 then
                listaCats.Add(CDSGrillaHembras.FieldByName('V5').AsString);
              end;
            end;

          DMSoftvet.IBQRodeo.Close;
          DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual; //obtiene los rodeos del establecimiento
          DMSoftvet.IBQRodeo.Open;
          str:=UpperCase(getDato('rodeo',anim[i]));
          if DBLCBARodeo.ListSource.DataSet.Lookup('NOMBRE',str,'ID_RODEO')<>null then
            CDSGrillaHembras.FieldByName('V8').AsString := str
          else
            CDSGrillaHembras.FieldByName('V8').AsString := 'INDEFINIDO';
          CDSGrillaHembras.FieldByName('RODEO').AsInteger := DBLCBARodeo.ListSource.DataSet.Lookup('NOMBRE',CDSGrillaHembras.FieldByName('V8').AsString,'ID_RODEO');

          DBLCBAPotrero.ListSource.DataSet.Close;
          DBLCBAPotrero.ListSource.DataSet.Open;
          str:=getDato('potrero',anim[i]);
          if (str='') or (DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',str,'ID_POTRERO')=null) then
            begin
            CDSGrillaHembras.FieldByName('POTRERO').AsInteger := 0;
            CDSGrillaHembras.FieldByName('V7').AsString := 'INDEFINIDO';
            end
          else
            begin
              CDSGrillaHembras.FieldByName('POTRERO').AsInteger := DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',str,'ID_POTRERO');
              CDSGrillaHembras.FieldByName('V7').AsString := str;
            end;

          str:=getDato('actividad',anim[i]);
          if str='' then str:='NO DEFINIDA';
          CDSGrillaHembras.FieldByName('V10').AsString := str;
          CDSGrillaHembras.FieldByName('ACTIVIDAD').Value := DBLCBAActividad.ListSource.DataSet.Lookup('SINONIMO',CDSGrillaHembras.FieldByName('V10').AsString,'ID_ACTIVIDAD');


          str:=getDato('tipo alta',anim[i]);
          if str='' then str:='CESIÓN DE ALTA';
          CDSGrillaHembras.FieldByName('TIPO_ALTA').AsInteger := DBLCBAtipoAlta.ListSource.DataSet.Lookup('nombre',str,'id_tipo_alta');
          CDSGrillaHembras.FieldByName('FECHA_ALTA').AsDateTime :=strtodatetime(getDato('fecha',anim[i]));
          CDSGrillaHembras.FieldByName('OBSERVACION').AsString := getDato('observación',anim[i]);
          str:=uppercase(getDato('responsable',anim[i]));
          if DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',str,'ID_EMPLEADO')<>null then
            CDSGrillaHembras.FieldByName('RESPONSABLE').Value := DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',str,'ID_EMPLEADO')
          else
            CDSGrillaHembras.FieldByName('RESPONSABLE').Value := 0;
          trystrtofloat(getDato('precio u',anim[i]),f);
          CDSGrillaHembras.FieldByName('PRECIO_UNITARIO').asFloat := f;
          trystrtofloat(getDato('precio b',anim[i]),f);
          CDSGrillaHembras.FieldByName('PRECIO_BRUTO').asFloat := f;
          trystrtofloat(getDato('gastos',anim[i]),f);
          CDSGrillaHembras.FieldByName('GASTOS').asFloat := f;
          CDSGrillaHembras.FieldByName('SEXO').Value :=2;

          CDSGrillaHembras.FieldByName('APODO').AsString:=getDato('apodo',anim[i]);
          CDSGrillaHembras.FieldByName('ID_OTRO').AsString:=getDato('otro',anim[i]);
          CDSGrillaHembras.FieldByName('ADN').AsString:=getDato('adn',anim[i]);
          CDSGrillaHembras.FieldByName('TIPIFICACION_SANGUINEA').AsString:=getDato('tipificación sanguínea',anim[i]);
          str:=getDato('orígen',anim[i]);
          if DMSoftvet.IBQCodOrigen.Lookup('SINONIMO',str,'ID_ORIGEN')<>null then
            CDSGrillaHembras.FieldByName('V11').Value:=str
          else
            CDSGrillaHembras.FieldByName('V11').Value:='NO DEFINIDO';
          CDSGrillaHembras.FieldByName('ORIGEN_ANIMAL').Value:=DMSoftvet.IBQCodOrigen.Lookup('SINONIMO',CDSGrillaHembras.FieldByName('V11').Value,'ID_ORIGEN');
          str:=getDato('criador',anim[i]);
          if DMSoftvet.IBQCodCriador.Lookup('SINONIMO',str,'ID_CRIADOR')<>null then
            CDSGrillaHembras.FieldByName('V12').Value:=str
          else
            CDSGrillaHembras.FieldByName('V12').Value:='NO DEFINIDO';
          CDSGrillaHembras.FieldByName('CRIADOR').Value:=DMSoftvet.IBQCodCriador.Lookup('SINONIMO',CDSGrillaHembras.FieldByName('V12').Value,'ID_CRIADOR');
          str:=getDato('propietario',anim[i]);
          if DMSoftvet.IBQCodPropietario.Lookup('SINONIMO',str,'ID_PROPIETARIO')<>null then
            CDSGrillaHembras.FieldByName('V13').Value:=str
          else
            CDSGrillaHembras.FieldByName('V13').Value:='NO DEFINIDO';
          CDSGrillaHembras.FieldByName('PROPIETARIO').Value:=DMSoftvet.IBQCodPropietario.Lookup('SINONIMO',CDSGrillaHembras.FieldByName('V13').Value,'ID_PROPIETARIO');

          cargarPadres(CDSGrillaHembras,i);

          str:=CDSGrillaHembras.FieldByName('id_rp').AsString;
          nroRepe:=buscarRepetidos(str,'id_rp');
          if (nroRepe>=1) then
          begin
              CDSGrillaHembras.FieldByName('ew').AsString := 'W';
              MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'RP' ) +' = '+str);
          end
          else
              CDSGrillaHembras.FieldByName('ew').AsString := ' ';

          str:=CDSGrillaHembras.FieldByName('id_ie').AsString;
          if str<>'' then
            begin
            nroRepe:=buscarRepetidos(str,'ID_IE');
            if (nroRepe>=1) then
            begin
                CDSGrillaHembras.FieldByName('ew').AsString := 'E';
                MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+Traducir( 'IE' ) +' = '+str+Traducir('. Por favor verifique el error'));
            end
            else
                CDSGrillaHembras.FieldByName('ew').AsString := ' ';
            end;

          CDSGrillaHembras.Post;
      end;
    end ;

    LoadSQLStringList;
//FALTA SUBCATEGORIA Y CODIGO MANEJO
end;

procedure TFEveAltaMasiva.BBXlsImportClick(Sender: TObject);
var
  archivo:TFileName;
  Reg : TRegistry;
  valor : String;
  val : Integer;
begin
  inherited;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  if Reg.OpenKey('Excel.Application', false) then
  begin
    /////me fijo la version de Excel q esta instalada
    if Reg.OpenKey('CurVer', false) then
    begin
      valor := RightStr(Reg.ReadString(''),2);
      if TryStrToInt(valor,val) then
      begin
        if val <= 11 then
          OpenDlg.Filter := 'Archivos Excel (*.xls)|*.xls|Archivos XML (*.xml)|*.xml'
        else
          OpenDlg.Filter := 'Archivos Excel (*.xls; *.xlsx)|*.xls; *.xlsx|Archivos XML (*.xml)|*.xml';
      end
      else
      begin
        MostrarMensaje(tmAdvertencia,'No se pudo determinar la version instalada de Microsoft® Excel');
        OpenDlg.Filter := 'Archivos Excel (*.xls; *.xlsx)|*.xls; *.xlsx|Archivos XML (*.xml)|*.xml';
      end;
    end;
    ////////////////////////
    OpenDlg.InitialDir:=ExtractFilePath(Application.ExeName)+'Exportacion';
    try
      if OpenDlg.Execute then
      begin
        archivo := OpenDlg.FileName;
        tipoEv := self.LTitulo.Caption;
        abrirArchivo(self,archivo);
        importar;
        FPrincipal.IBTPrincipal.CommitRetaining;
      end;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
      PCBasico.ActivePage:=TSHDatos;
    end;
  end
  else
  begin
    MostrarMensaje(tmError,'Para importar las planillas debe tener Microsoft® Excel instalado');
    BBXlsImport.Enabled := false;
  end;
end;

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
    SBSelTodos.Down:=((BDBGGrillaHembras.SelectedRows.Count=BDBGGrillaHembras.DataSource.DataSet.RecordCount) {and (BDBGGrillaHembras.DataSource.DataSet.RecordCount>0)});
    if(BDBGGrillaHembras.SelectedRows.Count = 1) then
      ASacarAnimal.Caption:= Traducir('Sacar Animal')
    else
    if(BDBGGrillaHembras.SelectedRows.Count > 1) then
      ASacarAnimal.Caption:= Traducir('Sacar Animales');
    ASacarAnimal.Enabled := BDBGGrillaHembras.SelectedRows.Count > 0;
    SBSelTodos.Down:= BDBGGrillaHembras.SelectedRows.Count=BDBGGrillaHembras.RowCount;
    end
  else
    begin
    {CDSAnimales.Close;
    CDSAnimales.Filter:='SEXO = 1';
    CDSAnimales.FilterOptions:=[foNoPartialCompare,foCaseInsensitive];
    CDSAnimales.Filtered:=true;
    CDSAnimales.Open;}
    SBSelTodos.Down:=(BDBGGrillaMachos.SelectedRows.Count=BDBGGrillaMachos.DataSource.DataSet.RecordCount) {and (BDBGGrillaMachos.DataSource.DataSet.RecordCount>0))};
    if(BDBGGrillaMachos.SelectedRows.Count = 1) then
      ASacarAnimal.Caption:= Traducir('Sacar Animal')
    else
    if(BDBGGrillaMachos.SelectedRows.Count > 1) then
      ASacarAnimal.Caption:= Traducir('Sacar Animales');
    ASacarAnimal.Enabled := BDBGGrillaMachos.SelectedRows.Count > 0;
    SBSelTodos.Down:= BDBGGrillaMachos.SelectedRows.Count=BDBGGrillaMachos.RowCount;
    end;
    LoadSQLStringList;
end;

function TFEveAltaMasiva.diagnostico:boolean;  //devuelve true si existen vaquillonas o vacas
begin
  diagnostico:=false;
  if not CDSAnimales.IsEmpty then
     if CDSAnimales.Lookup('categoria','VAQUILLONA','categoria')<>null or CDSAnimales.Lookup('categoria','VACA','categoria')<>null then
        diagnostico:=true;
end;

procedure TFEveAltaMasiva.BAgregarAnimalClick(Sender: TObject);
begin
  inherited;
  EACantidad.EsRequerido:=true;
  agregar:=true;
  PCBasico.ActivePage:=TSHDatos;
  PCBasicoChange(self);
end;

procedure TFEveAltaMasiva.BDBGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
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

            //showmessage(IntToStr(CamposBD[i].Value)+'  '+IntToStr(I)+'  '+IntToStr(ValoresCamposBD[I]));

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
var edad:integer;
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
   while not CDSGrillaMachos.Eof do
    begin
    if BDBGGrillaMachos.SelectedRows.CurrentRowSelected then
    begin
    CDSGrillaMachos.Edit;
    RealizarCambio(EAPeso,[CDSGrillaMachos.FieldByName('PESO')],[FormatFloat('00.00',EAPeso.GetDato)]);
    RealizarCambio(DBLCBACondicionC,[CDSGrillaMachos.FieldByName('condicion_corporal'),CDSGrillaMachos.FieldByName('V2')],[DBLCBACondicionC.KeyValue,DBLCBACondicionC.Text]);
    RealizarCambio(DBLCBACategoria,[CDSGrillaMachos.FieldByName('categoria'),CDSGrillaMachos.FieldByName('V5')],[DBLCBACategoria.KeyValue,DBLCBACategoria.Text]);
    RealizarCambio(EADta,[CDSGrillaMachos.FieldByName('DTA')],[EADta.Text]);
    RealizarCambio(DBLCBACronologiaD,[CDSGrillaMachos.FieldByName('cronologia_dentaria'),CDSGrillaMachos.FieldByName('V3')],[DBLCBACronologiaD.KeyValue,DBLCBACronologiaD.Text]);
    //cuando cambia la fecha de alta se calcula la edad con esto
    edad := monthsbetween(CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime,CDSGrillaMachos.FieldByName('fecha_nacimiento').AsDateTime);
    RealizarCambio(DTPAFechaAlta,[CDSGrillaMachos.FieldByName('FECHA_ALTA')],[DTPAFechaAlta.DateTime]);
    fecha := incMonth(CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime,-edad);
    CDSGrillaMachos.FieldByName('fecha_nacimiento').AsDateTime:= fecha;
    //cuando cambia la edad, se calcula con esto
    edad := StrToInt(EAEdad.text);
    fecha := incMonth(CDSGrillaMachos.FieldByName('FECHA_ALTA').AsDateTime,-edad);
    RealizarCambio(EAEdad,[CDSGrillaMachos.FieldByName('fecha_nacimiento')],[fecha]);
    RealizarCambio(EACircunferenciaEscrotal,[CDSGrillaMachos.FieldByName('circunferencia_escrotal')],[StrToFloat(EACircunferenciaEscrotal.Text){EACircunferenciaEscrotal.Text}]);
    RealizarCambio(DBLCBARaza,[CDSGrillaMachos.FieldByName('raza'),CDSGrillaMachos.FieldByName('V6')],[DBLCBARaza.KeyValue,DBLCBARaza.Text]);

    RealizarCambio(DBLCBARodeo,[CDSGrillaMachos.FieldByName('RODEO'),CDSGrillaMachos.FieldByName('V8')],[DBLCBARodeo.KeyValue,DBLCBARodeo.Text]);
    RealizarCambio(DBLCBATiposPeso,[CDSGrillaMachos.FieldByName('VUno1'),CDSGrillaMachos.FieldByName('V9')],[DBLCBATiposPeso.KeyValue,DBLCBATiposPeso.Text]);
    RealizarCambio(DBLCBAPotrero,[CDSGrillaMachos.FieldByName('POTRERO'),CDSGrillaMachos.FieldByName('V7')],[DBLCBAPotrero.KeyValue,DBLCBAPotrero.Text]);
    RealizarCambio(DBLCBAtipoAlta,[CDSGrillaMachos.FieldByName('TIPO_ALTA')],[DBLCBAtipoAlta.ListSource.DataSet.Lookup('NOMBRE',DBLCBAtipoAlta.Text,'ID_TIPO_ALTA')]);
    RealizarCambio(MAObservacion,[CDSGrillaMachos.FieldByName('OBSERVACION')],[MAObservacion.Text]);
    RealizarCambio(DBLCBAResponsable,[CDSGrillaMachos.FieldByName('RESPONSABLE')],[DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',DBLCBAResponsable.Text,'ID_EMPLEADO')]);
    RealizarCambio(DBLCBAActividad,[CDSGrillaMachos.FieldByName('ACTIVIDAD'),CDSGrillaMachos.FieldByName('V10')],[DBLCBAActividad.KeyValue,DBLCBAActividad.Text]);

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
    //FPrincipal.IBTPrincipal.CommitRetaining;
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
   while not CDSGrillaHembras.Eof do
     begin
      if BDBGGrillaHembras.SelectedRows.CurrentRowSelected then
          begin
          CDSGrillaHembras.Edit;
          RealizarCambio(EAPeso,[CDSGrillaHembras.FieldByName('PESO')],[FormatFloat('00.00',EAPeso.GetDato)]);
          RealizarCambio(DBLCBAGdr,[CDSGrillaHembras.FieldByName('GDR'),CDSGrillaHembras.FieldByName('V1')],[DBLCBAGdr.KeyValue,DBLCBAGdr.Text]);
          RealizarCambio(EADta,[CDSGrillaHembras.FieldByName('DTA')],[EADta.Text]);
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
          edad := StrToInt(EAEdad.text);
          fecha := incMonth(CDSGrillaHembras.FieldByName('FECHA_ALTA').AsDateTime,-edad);
          RealizarCambio(EAEdad,[CDSGrillaHembras.FieldByName('fecha_nacimiento')],[fecha]);
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


          CDSGrillaHembras.Post;
          CDSGrillaHembras.Transaction.CommitRetaining;
          //FPrincipal.IBTPrincipal.CommitRetaining;
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
  //FAvanceTerminar.Close;
  FAvanceTerminar.Destroy;
    //*/*/*
  LoadSQLStringList;
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

procedure TFEveAltaMasiva.Label5MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label5.Font.Color:= $00606C02;
      Label5.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.Label5MouseLeave(Sender: TObject);
begin
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label5.Font.Color:= clWindowText;
      Label5.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.RBReidentificacionSenasaClick(Sender: TObject);
begin
  inherited;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EAPrefijo.Visible := false;
  EARPInicial.Visible := false;
  EASufijo.Visible := false;
  EARPinicial.EsRequerido := false;
  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;
  LRpInicial.Visible:=false;
  DBLCBACUIGPropio.Visible:= false;

  Lr.Visible:= true;
  EAEncabezadoReidentificacion.Visible:= true;
  EAUltimoIdentReidentificacion.Visible:= true;

  Lr.Top:= RBReidentificacionSenasa.Top + 3;
  EAEncabezadoReidentificacion.Top:= RBReidentificacionSenasa.Top;
  EAUltimoIdentReidentificacion.Top:= RBReidentificacionSenasa.Top;

  JvIEquivalencias.Visible := false;
end;

procedure TFEveAltaMasiva.EAEncabezadoReidentificacionChange(
  Sender: TObject);
begin
  inherited;
  ControlEventoOnExit(Sender);
end;

procedure TFEveAltaMasiva.EAUltimoIdentReidentificacionChange(
  Sender: TObject);
begin
  inherited;
  ControlEventoOnExit(Sender);
end;

procedure TFEveAltaMasiva.DTPAFechaAltaExit(Sender: TObject);
begin
  inherited;
  hi.Destroy;  
  GetEvent(sender);
  //EAEdadExit(EAEdad);
end;

procedure TFEveAltaMasiva.importar;
var cantidad,i:integer;
begin
   try
      EARpInicial.Text:='0';
      EARpInicial.EsRequerido:=false;
      EACantidad.EsRequerido:=false;
      agregar:=false;
      BDBGGrillaHembras.Hide;
      BDBGGrillaMachos.Hide;
      cantidad:=0;

      FAvanceTerminar:=TFAvanceTerminar.Create(self);
      FAvanceTerminar.Max:=Length(anim);
      FAvanceTerminar.Pos:=1;
      for i:=0 to Length(anim)-1 do
            cargarNuevos(i);
      cargaDeMovil:=false;
      //FAvanceTerminar.close;//Destroy;
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
      if listaCats.Count>0 then
        MostrarMensajeEdades(self,tmAdvertencia,'No se pudo determinar la edad da algunos animales. Por favor especifíque una edad promedio(en meses) para las siguientes categorías:',listaCats);
      actualizarEdades;
      ControlEventoOnExit(self);
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

procedure TFEveAltaMasiva.Label5Click(Sender: TObject);
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

procedure TFEveAltaMasiva.Label9MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label9.Font.Color:= $00606C02;
      Label9.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.Label9MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label9.Font.Color:= clWindowText;
      Label9.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.Label9Click(Sender: TObject);
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

procedure TFEveAltaMasiva.Label10MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label10.Font.Color:= $00606C02;
      Label10.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.Label10MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label10.Font.Color:= clWindowText;
      Label10.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveAltaMasiva.Label10Click(Sender: TObject);
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
begin
  inherited;
  // dehabilito la castración cuando es ternero
  if(DBLCBACategoria.KeyValue <> 1)then
    CBCastrado.Enabled := false
   else
     CBCastrado.Enabled := true;
end;

procedure TFEveAltaMasiva.CBSexoCloseUp(Sender: TObject);
begin
  inherited;
  // dehabilito la castración cuando es ternero
  if((DBLCBACategoria.KeyValue <> 1) and (CBSexo.ItemIndex = 0))then
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
begin
  inherited;
  EACircunferenciaEscrotal.Enabled := DBLCBACategoria.KeyValue = 3;
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

procedure TFEveAltaMasiva.DTPAFechaAltaEnter(Sender: TObject);
var t:TRect;
begin
  inherited;
    t.Left:=DTPAFechaAlta.Left+DTPAFechaAlta.Width - 20;
    t.Top:=GBDatosBiograficos.Top + DTPAFechaAlta.Top + 20;
    t.Right:=DTPAFechaAlta.Left + DTPAFechaAlta.Width + 110;
    t.Bottom:=GBDatosBiograficos.Top + DTPAFechaAlta.Top + 120;
    hi:= THintWindow.Create(self);
    hi.ActivateHint(t,DTPAFechaAlta.Hint);
    hi.Show;
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
  LoadSQLStringList;
  inherited;
end;

procedure TFEveAltaMasiva.BDBGGrillaMachosColEnter(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQSubCategoriaRaza.Close;
  DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := CDSGrillaMachos.FieldValues['RAZA'];
  DMSoftvet.IBQSubCategoriaRaza.Open;
  DMSoftvet.IBQMocho.Close;
  DMSoftvet.IBQMocho.ParamByName('raza').Value := CDSGrillaMachosRAZA.Value;
  DMSoftvet.IBQMocho.Open;
  LoadSQLStringList;
  inherited;
end;

procedure TFEveAltaMasiva.CargarEquivalencias(DireccionArch : String);
var
  Archivo : TextFile;
  Indice : Integer;
  Linea : String;
  Caravanas : TStringList;
begin
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
    IBQExisteEQ.Close;
    IBQExisteEQ.ParamByName('ie').AsString := Caravanas[0];
    IBQExisteEQ.Open;
    if IBQExisteEQ.IsEmpty then
    begin
      SetLength(Equivalencias,indice+1);
      Equivalencias[indice].IE := Caravanas[0];
      Equivalencias[indice].RP := Caravanas[1];
      Inc(Indice);
    end;
  end;

  if Length(Equivalencias) > 0 then
  begin
    cargaEQ := true;
    EACantidad.Text := IntToStr(Length(Equivalencias)-1);
    BDBGGrillaHembras.Columns[2].Visible := true;
    BDBGGrillaHembras.Columns[2].Width := 145;
    BDBGGrillaMachos.Columns[2].Visible := true;
    BDBGGrillaMachos.Columns[2].Width := 145;
  end;

end;

procedure TFEveAltaMasiva.RBEquivalenciasClick(Sender: TObject);
begin
  inherited;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EAPrefijo.Visible := false;
  EARPInicial.Visible := false;
  EASufijo.Visible := false;
  EARPinicial.EsRequerido := false;
  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;
  LRpInicial.Visible:=false;
  DBLCBACUIGPropio.Visible:= false;
  Lr.Visible:= false;
  EAEncabezadoReidentificacion.Visible:= false;
  EAUltimoIdentReidentificacion.Visible:= false;

  JvIEquivalencias.Visible := true;
end;

procedure TFEveAltaMasiva.JvIEquivalenciasClick(Sender: TObject);
begin
  inherited;
  if ODElectronico.Execute then
  begin
    CargarEquivalencias(ODElectronico.FileName);
  end;
end;

procedure TFEveAltaMasiva.JvIDispElectClick(Sender: TObject);
begin
  inherited;
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

end.
