unit UREPPedigreePreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, QuickRpt, QRCtrls, DB,
  IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, jpeg, IBStoredProc,
  DataExport, DataToXLS, Menus, WinXP, QRPDFFilt, QRWebFilt, QRExport,
  ImgList, PngImageList, JvExControls, JvLabel, JvGIF, pngimage,
  JvExExtCtrls, JvImage;

type

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

  TRegDestinos = record
    cant : Integer;
    dest : Integer;
  end;

  TFREPPedigreePreview = class(TFUniversal)
    QRCRPedigree: TQRCompositeReport;
    QRDatosEspecificos: TQuickRep;
    QRBand1: TQRBand;
    QRLRPAnimal: TQRLabel;
    QRShape1: TQRShape;
    QRLabelTituloEstadoActual: TQRLabel;
    LabelPesoNacer: TQRLabel;
    LabelPesoDestete: TQRLabel;
    QRLPesoNacer: TQRLabel;
    QRLPesoDestete: TQRLabel;
    QRLCircunfEscrotal: TQRLabel;
    LabelCircunfEscrotal: TQRLabel;
    LabelCapacidadServicio: TQRLabel;
    QRLCapacidadServicio: TQRLabel;
    IBQAux: TIBQuery;
    QRSummary: TQuickRep;
    QRProduccion: TQuickRep;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    LabelProduccion: TQRLabel;
    DSHijos: TDataSource;
    IBQHijos: TIBQuery;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGenealogia: TQuickRep;
    IBQArbolGenea: TIBQuery;
    DSArbolGenea: TDataSource;
    QRBand5: TQRBand;
    LabelLinea1: TQRDBText;
    LabelCategoriaPadre: TQRLabel;
    IBQArbolGeneaID_ANIMAL: TIntegerField;
    IBQArbolGeneaNOMBRE: TIBStringField;
    IBQArbolGeneaAPODO: TIBStringField;
    IBQArbolGeneaRAZA: TIntegerField;
    IBQArbolGeneaEXTERNO: TIBStringField;
    IBQArbolGeneaMADRE: TIBStringField;
    IBQArbolGeneaID_RP: TIBStringField;
    IBQArbolGeneaID_SENASA: TIBStringField;
    IBQArbolGeneaID_PC: TIBStringField;
    IBQArbolGeneaID_HBA: TIBStringField;
    IBQArbolGeneaID_RA: TIBStringField;
    IBQArbolGeneaID_OTRO: TIBStringField;
    IBQArbolGeneaPADRES_DE: TIntegerField;
    IBQArbolGeneaNIVEL_ARBOL: TIntegerField;
    labelLinea2: TQRDBText;
    labelLinea3: TQRDBText;
    QRSPadres: TQRShape;
    QRSAbuelos: TQRShape;
    QRSBisAbuelos: TQRShape;
    QRSHorizontal: TQRShape;
    QRGroup1: TQRGroup;
    LabelRPProduccion: TQRLabel;
    LabelfechaNacProduccion: TQRLabel;
    LabelSexoProduccion: TQRLabel;
    LabelPadreProduccion: TQRLabel;
    LabelCondDsitociaProduccion: TQRLabel;
    LabelPesoNacerProduccion: TQRLabel;
    LabelPesoDesteteProduccion: TQRLabel;
    LabelPesoAnioProduccion: TQRLabel;
    QRShape2: TQRShape;
    QRBFProduccion: TQRBand;
    QRBand6: TQRBand;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRBand4: TQRBand;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRBand7: TQRBand;
    QRShape7: TQRShape;
    QRLabel4: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRBand8: TQRBand;
    QRImage1: TQRImage;
    QRLabel6: TQRLabel;
    IBQHijosRP_ANIMAL: TIBStringField;
    IBQHijosFECHANAC: TDateField;
    IBQHijosSEXO: TIBStringField;
    IBQHijosPADRE: TIBStringField;
    IBQHijosCONDDISTOCIA: TIBStringField;
    //IBQHijosPESOANIO: TIntegerField;
    QRLabel7: TQRLabel;
    QRShape10: TQRShape;
    LabelCantMachos: TQRLabel;
    LabelCantHembras: TQRLabel;
    LabelPromPesoalNacer: TQRLabel;
    LabelPromPesoalDestete: TQRLabel;
    LabelPromPesoalAnio: TQRLabel;
    QRLCantMachos: TQRLabel;
    QRLPromPesoNacer: TQRLabel;
    QRLPromPesoDestete: TQRLabel;
    QRLPromPesoAnio: TQRLabel;
    QRLCantHembras: TQRLabel;
    LabelTotalDistocias: TQRLabel;
    QRLTotalDistocias: TQRLabel;
    LabelFechaNacimiento: TQRLabel;
    QRLFechaNacimiento: TQRLabel;
    LabelEstadoLactacion: TQRLabel;
    QRLEstadoLactacion: TQRLabel;
    QRDBText5: TQRDBText;
    QRTotal: TQRLabel;
    QRLTotal: TQRLabel;
    QRHTMLFilter1: TQRHTMLFilter;
    LabelFechaAlPrimerParto: TQRLabel;
    QRLFechaAlPrimerParto: TQRLabel;
    LabelEdadalPrimerParto: TQRLabel;
    QRLEdadAlPrimerParto: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRBand9: TQRBand;
    QRImage2: TQRImage;
    QRLabel8: TQRLabel;
    QRBand10: TQRBand;
    QRImage3: TQRImage;
    QRLabel9: TQRLabel;
    IBQArbolGeneaRELACION: TIBStringField;
    QRShape34: TQRShape;
    banda: TQRBand;
    LabelGenealogia: TQRLabel;
    QRShape5: TQRShape;
    InfPPP: TQRMemo;
    LVPPP: TQRShape;
    LHPPP: TQRShape;
    InfPP: TQRMemo;
    LVPP: TQRShape;
    LHPP: TQRShape;
    InfP: TQRMemo;
    LVPPM: TQRShape;
    LHPPM: TQRShape;
    InfPPM: TQRMemo;
    InfPMP: TQRMemo;
    LVPMP: TQRShape;
    LHPMP: TQRShape;
    InfPM: TQRMemo;
    LVPM: TQRShape;
    LHPM: TQRShape;
    LHPMM: TQRShape;
    LVPMM: TQRShape;
    InfPMM: TQRMemo;
    Linea1: TQRLabel;
    Linea2: TQRLabel;
    Linea3: TQRLabel;
    LHP: TQRShape;
    LVP: TQRShape;
    InfMPP: TQRMemo;
    LVMPP: TQRShape;
    LHMPP: TQRShape;
    InfMP: TQRMemo;
    LHMPM: TQRShape;
    LVMPM: TQRShape;
    InfMPM: TQRMemo;
    InfMMP: TQRMemo;
    LVMMP: TQRShape;
    LHMMP: TQRShape;
    InfM: TQRMemo;
    LHMP: TQRShape;
    LVMP: TQRShape;
    LHM: TQRShape;
    LVM: TQRShape;
    LHMM: TQRShape;
    LVMM: TQRShape;
    InfMM: TQRMemo;
    LHMMM: TQRShape;
    LVMMM: TQRShape;
    InfMMM: TQRMemo;
    QRShape9: TQRShape;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    FechaMedCirc: TQRLabel;
    FechaMedCap: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLPesoAnio: TQRLabel;
    QRLPesoAdulto: TQRLabel;
    QRBand11: TQRBand;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape51: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape52: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape53: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel16: TQRLabel;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText54: TQRDBText;
    QRShape66: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape8: TQRShape;
    QRSysData11: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRShape32: TQRShape;
    QRSysData3: TQRSysData;
    QRLEmpresa13: TQRLabel;
    QRLNombrePropietario13: TQRLabel;
    QRLRenglon23: TQRLabel;
    QRLRenglon13: TQRLabel;
    QRLEstablecimientos3: TQRLabel;
    QRImagenEmpresa13: TQRImage;
    QRShape30: TQRShape;
    QRSysData4: TQRSysData;
    QRLEmpresa12: TQRLabel;
    QRLNombrePropietario12: TQRLabel;
    QRLRenglon22: TQRLabel;
    QRLRenglon12: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRImagenEmpresa12: TQRImage;
    QRLDatosAbajo12: TQRLabel;
    QRLDatosAbajo22: TQRLabel;
    QRLDatosAbajo14: TQRLabel;
    QRLDatosAbajo24: TQRLabel;
    IBQAjustePeso: TIBQuery;
    IBQPartosTransf: TIBQuery;
    IBQHijosRECEPTORA: TIBStringField;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRLabel73: TQRLabel;
    QRDBText58: TQRDBText;
    InfMMMM: TQRMemo;
    InfMMMP: TQRMemo;
    InfMMPM: TQRMemo;
    InfMMPP: TQRMemo;
    InfMPMM: TQRMemo;
    InfMPMP: TQRMemo;
    InfMPPM: TQRMemo;
    InfMPPP: TQRMemo;
    InfPMMM: TQRMemo;
    InfPMMP: TQRMemo;
    InfPMPM: TQRMemo;
    InfPMPP: TQRMemo;
    InfPPMM: TQRMemo;
    InfPPMP: TQRMemo;
    InfPPPM: TQRMemo;
    InfPPPP: TQRMemo;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    IP: TQRImage;
    IM: TQRImage;
    ImSexo: TImageList;
    IPP: TQRImage;
    IPM: TQRImage;
    IPPP: TQRImage;
    IPPM: TQRImage;
    IPMP: TQRImage;
    IPMM: TQRImage;
    IMP: TQRImage;
    IMM: TQRImage;
    IMPP: TQRImage;
    IMPM: TQRImage;
    IMMP: TQRImage;
    IMMM: TQRImage;
    IPPPP: TQRImage;
    IPPMP: TQRImage;
    IPMPP: TQRImage;
    IPMMP: TQRImage;
    IPPPM: TQRImage;
    IPPMM: TQRImage;
    IPMPM: TQRImage;
    IPMMM: TQRImage;
    IMPPP: TQRImage;
    IMPPM: TQRImage;
    IMPMP: TQRImage;
    IMPMM: TQRImage;
    IMMPP: TQRImage;
    IMMPM: TQRImage;
    IMMMP: TQRImage;
    IMMMM: TQRImage;
    IAnimal: TQRImage;
    QRLabel80: TQRLabel;
    QRLPromDistocia: TQRLabel;
    QRLabel83: TQRLabel;
    QRLTotalRechazos: TQRLabel;
    QRLabel85: TQRLabel;
    QRLPromRechazos: TQRLabel;
    QRLabel84: TQRLabel;
    QRDBText59: TQRDBText;
    //IBQHijosPESO18: TIntegerField;
    IBQHijosFECHAPESO18: TDateField;
    IBQHijosRECHAZO: TIBStringField;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRLabel86: TQRLabel;
    QRDBText60: TQRDBText;
    LabelRegistro: TQRLabel;
    QRLTipoRegistro: TQRLabel;
    QRShape113: TQRShape;
    IBQHijosINSPECCION: TIntegerField;
    IBQHijosDESTINO: TIntegerField;
    QRLabel87: TQRLabel;
    QRLCantAp: TQRLabel;
    QRLPorAp: TQRLabel;
    QRLPorRe: TQRLabel;
    QRLCantRe: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLCantReins: TQRLabel;
    QRLPorReins: TQRLabel;
    QRLabel90: TQRLabel;
    QRLDestino1: TQRLabel;
    QRLD1: TQRLabel;
    QRLD2: TQRLabel;
    QRLDestino2: TQRLabel;
    QRLDestino3: TQRLabel;
    QRLD3: TQRLabel;
    QRLDestino5: TQRLabel;
    QRLD5: TQRLabel;
    QRLD4: TQRLabel;
    QRLDestino4: TQRLabel;
    QRShape114: TQRShape;
    QRLabel91: TQRLabel;
    QRShape115: TQRShape;
    QRProduccionBr: TQuickRep;
    QRBand12: TQRBand;
    QRShape116: TQRShape;
    QRLabel92: TQRLabel;
    QRBand13: TQRBand;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape127: TQRShape;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRShape128: TQRShape;
    QRShape129: TQRShape;
    QRDBText71: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRShape130: TQRShape;
    QRShape131: TQRShape;
    QRShape132: TQRShape;
    QRShape133: TQRShape;
    QRShape134: TQRShape;
    QRShape135: TQRShape;
    QRShape136: TQRShape;
    QRShape137: TQRShape;
    QRShape138: TQRShape;
    QRShape139: TQRShape;
    QRShape140: TQRShape;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRShape141: TQRShape;
    QRShape142: TQRShape;
    QRLabel103: TQRLabel;
    QRBand14: TQRBand;
    QRBand15: TQRBand;
    QRShape143: TQRShape;
    QRLabel104: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRBand16: TQRBand;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRImage4: TQRImage;
    QRLabel110: TQRLabel;
    QRShape144: TQRShape;
    QRShape145: TQRShape;
    QRSysData6: TQRSysData;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRImage5: TQRImage;
    IBQHijosNOMINSPECCION: TStringField;
    IBQHijosNOMDEST: TStringField;
    IBQHijosSUBCATEGORIA: TIntegerField;
    IBQHijosNOMSUBCAT: TStringField;
    QRLabel114: TQRLabel;
    QRLOrigen: TQRLabel;
    QRShape146: TQRShape;
    IBQHijosPESONAC: TIBBCDField;
    IBQHijosPESODESTETE: TIBBCDField;
    IBQHijosPESOANIO: TIBBCDField;
    IBQHijosPESO18: TIBBCDField;
    QRShape147: TQRShape;
    QRShape148: TQRShape;
    QRLabel115: TQRLabel;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRShape151: TQRShape;
    QRShape152: TQRShape;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    QRShape155: TQRShape;
    QRLDPor5: TQRLabel;
    QRLDPor4: TQRLabel;
    QRLDPor3: TQRLabel;
    QRLDPor2: TQRLabel;
    QRLDPor1: TQRLabel;
    QRIGrafico: TQRImage;
    QRIDeps: TQRImage;
    QRLabel79: TQRLabel;
    QRLabel116: TQRLabel;
    QRLAnio: TQRLabel;
    QRLFuente: TQRLabel;
    procedure prepararReportes(id_animal : integer; establecimiento : integer);
    procedure recuperarRP(id_animal:integer);
    procedure recuperarCircunfEscrotal(id_animal:integer);
    procedure recuperarPesoNacer(id_animal:integer);
    procedure recuperarPesoDestete(id_animal:integer);
    procedure recuperarPesoAnio(id_animal:integer);
    procedure recuperarPesoAdulto(id_animal:integer);
    procedure recuperarCapacidadServicio(id_animal:integer);
    procedure recuperarFechaNacimiento(id_animal:Integer);
    procedure recuperarEstadoLactacion(id_animal:Integer);
    procedure recuperarFechaAlPrimerParto(id_animal:Integer);
    procedure recuperarOrigen(id_animal : integer);

    procedure recuperarDatos (param:integer; sql :string; labelCaption:TQRLabel);


    procedure EstadisticaProduccion(id_animal:integer);
    function CantidadMachos(id_animal:integer): Integer;
    function CantidadHembras(id_animal:integer): Integer;
    function PromedioPesoNacimiento(id_animal:Integer):Integer;
    function PromedioPesoDestete(id_animal:Integer):Integer;
    function PromedioPesoAnio(id_animal:Integer):Integer;
    function CondDistocia(id_animal:Integer):Integer;    
    function Total(id_animal : Integer) : Integer;
    function CantRechazos(id_animal : Integer) : Integer;
    function PromDistocias(id_animal : integer) : string;
    function PromRechazos(id_animal : integer) : string;


    procedure QRCRPedigreeAddReports(Sender: TObject);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);

    procedure retornarAlternativo(id : integer; externo : boolean; var identif: string; var value:string);
    procedure generarLabel(x:integer; texto:string; flag:integer);
    function retornarRaza(raza:integer):string;
    function retornarCategoriaPadre():string;
    procedure LabelLinea1Print(sender: TObject; var Value: String);
    procedure labelLinea2Print(sender: TObject; var Value: String);
    procedure labelLinea3Print(sender: TObject; var Value: String);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

    procedure identificarSexo;
    procedure QRLPesoNacerPrint(sender: TObject; var Value: String);
    procedure QRLPesoDestetePrint(sender: TObject; var Value: String);
    procedure QRLCircunfEscrotalPrint(sender: TObject; var Value: String);
    procedure bandaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);

  private
    Ajuste : String;
    RazaAnimal : Integer;
    procedure armarArbol(animal : integer);
    procedure cargarDatosPropietario();
    procedure recuperarInspeccion(id_animal:Integer);
    procedure recuperarDestino(id_animal : Integer);
    procedure recuperarRegistro(id_animal : Integer);
    procedure recuperarInspeccionyDestino(id_animal : integer);
  public
    { Public declarations }
    procedure MostrarCompPais();
    procedure SetDataSet(DS : TIBQuery);
  protected
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
  end;

var
    FREPPedigreePreview: TFREPPedigreePreview;
  hembra: boolean;
  idSexo: integer;

implementation

uses DateUtils, UPrincipal, URepFichaAnimal, URepGeneral, UDMSoftvet, UTraduccion, uTiposGlobales;

{$R *.dfm}

{ TFREPPedigreePreview }

procedure TFREPPedigreePreview.SetDataSet(DS : TIBQuery);
begin
  QRDBText10.DataSet := DS;
  QRDBText11.DataSet := DS;
  QRDBText12.DataSet := DS;
  QRDBText13.DataSet := DS;
  QRDBText14.DataSet := DS;
  QRDBText15.DataSet := DS;
  QRDBText16.DataSet := DS;
  QRDBText17.DataSet := DS;
  QRDBText18.DataSet := DS;
  QRDBText19.DataSet := DS;
  QRDBText20.DataSet := DS;
  QRDBText21.DataSet := DS;
  QRDBText22.DataSet := DS;
  QRDBText23.DataSet := DS;
  QRDBText24.DataSet := DS;
  QRDBText25.DataSet := DS;
  QRDBText26.DataSet := DS;
  QRDBText27.DataSet := DS;
  QRDBText28.DataSet := DS;
  QRDBText29.DataSet := DS;
  QRDBText30.DataSet := DS;
  QRDBText31.DataSet := DS;
  QRDBText32.DataSet := DS;
  QRDBText33.DataSet := DS;
  QRDBText34.DataSet := DS;
  QRDBText35.DataSet := DS;
  QRDBText36.DataSet := DS;
  QRDBText37.DataSet := DS;
  QRDBText38.DataSet := DS;
  QRDBText39.DataSet := DS;
  QRDBText40.DataSet := DS;
  QRDBText41.DataSet := DS;
  QRDBText42.DataSet := DS;
  QRDBText43.DataSet := DS;
  QRDBText44.DataSet := DS;
  QRDBText45.DataSet := DS;
  QRDBText46.DataSet := DS;
  QRDBText47.DataSet := DS;
  QRDBText48.DataSet := DS;
  QRDBText49.DataSet := DS;
  QRDBText50.DataSet := DS;
  QRDBText51.DataSet := DS;
  QRDBText52.DataSet := DS;
  QRDBText53.DataSet := DS;
  QRDBText54.DataSet := DS;
  QRDBText55.DataSet := DS;
  QRDBText56.DataSet := DS;
//  QRDBText57.DataSet := DS;
  QRDBText9.DataSet := DS;
  QRDatosEspecificos.DataSet := DS;
end;

procedure TFREPPedigreePreview.armarArbol(animal : integer);
var alter:string;
    valor:string;
    externo:boolean;
begin
  IBQArbolGenea.Active := false;
  IBQArbolGenea.ParamByName('n').AsInteger := animal;
  IBQArbolGenea.ParamByName('EXT').AsString := 'N';
  IBQArbolGenea.Active := true;

  IBQArbolGenea.First;
  while not IBQArbolGenea.Eof do
  begin
    externo := IBQArbolGenea.FieldByName('externo').AsString = 'S';

    if IBQArbolGenea.FieldByName('relacion').AsString = 'P' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'M' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfM.Lines.Append('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PPP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PPM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PMP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PMM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MPP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MPM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MMP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MMM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;


    ///////////////

    if IBQArbolGenea.FieldByName('relacion').AsString = 'PPPP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPPP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PPPM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPPM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PPMP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPMP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PPMM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPMM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PMPP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMPP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PMPM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMPM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PMMP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMMP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PMMM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMMM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MPPP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPPP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MPPM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPPM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MPMP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPMP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MPMM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPMM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MMPP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMPP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MMPM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMPM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MMMP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMMP.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MMMM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMMM.Lines[0] := '  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+' - '+IBQArbolGenea.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));}
    end;

    //////////////
    IBQArbolGenea.Next;
  end;

end;

// metodo para configurar las bandas
procedure TFREPPedigreePreview.prepararReportes(id_animal: integer; establecimiento : integer);
var alter:string;
    valor:string;
begin
  IBQAjustePeso.Close;
  IBQAjustePeso.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAjustePeso.Open;
  Ajuste := IBQAjustePeso.FieldValues['valor'];


  //************** PARA LOS DATOS ESPECIFICOS ***********************
  IBQAux.Close;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select raza from tab_animales where id_animal = :n');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Open;
  RazaAnimal := IBQAux.FieldValues['raza'];

  DMSoftvet.IBQInspeccion.Close;
  DMSoftvet.IBQInspeccion.Open;
  DMSoftvet.IBQCodDestCabania.Close;
  DMSoftvet.IBQCodDestCabania.Open;
  DMSoftvet.IBQSubCategoriaRaza.Close;
  DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := RazaAnimal;
  DMSoftvet.IBQSubCategoriaRaza.Open;

 { QRLInspeccion.Enabled := (RazaAnimal = 10) or (RazaAnimal = 11) or (RazaAnimal = 12) or (RazaAnimal = 28);
  QRLInspeccionV.Enabled := (RazaAnimal = 10) or (RazaAnimal = 11) or (RazaAnimal = 12) or (RazaAnimal = 28);
  QRLDestino.Enabled := (RazaAnimal = 10) or (RazaAnimal = 11) or (RazaAnimal = 12) or (RazaAnimal = 28);
  QRLDestinoV.Enabled := (RazaAnimal = 10) or (RazaAnimal = 11) or (RazaAnimal = 12) or (RazaAnimal = 28);  }

  recuperarRP(id_animal);
  identificarSexo; // nuevo
  recuperarCircunfEscrotal(id_animal);
  recuperarPesoNacer(id_animal);
  recuperarPesoDestete(id_animal);
  recuperarPesoAnio(id_animal);
  recuperarPesoAdulto(id_animal);
  recuperarCapacidadServicio(id_animal);
  recuperarFechaNacimiento(id_animal);
  recuperarEstadoLactacion(id_animal);
  recuperarRegistro(id_animal);
  recuperarOrigen(id_animal);

  if RazaAnimal in [10,11,12,28] then
  begin
    QRLabel10.Enabled := false;
    QRLPesoAnio.Enabled := false;
    LabelPromPesoalAnio.Enabled := false;
    QRLPromPesoAnio.Enabled := false;
  end;
 // recuperarInspeccion(id_animal);
 // recuperarDestino(id_animal);
  recuperarFechaAlPrimerParto(id_animal);
  EstadisticaProduccion(id_animal);
  recuperarInspeccionyDestino(id_animal);


  if ((QRLFechaAlPrimerParto.Caption <> '') and (QRLFechaNacimiento.Caption <> '')) then
    QRLEdadAlPrimerParto.Caption:= IntToStr(DaysBetween(StrToDate(QRLFechaAlPrimerParto.Caption), StrToDate(QRLFechaNacimiento.Caption)) div 30) + Traducir(' meses')
   else
     QRLEdadAlPrimerParto.Caption:= '';
  //************** PARA EL ARBOL GENEALOGICO *************

  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.Add('select A.*, CS.tipo from tab_animales A join cod_sexos CS on A.sexo = CS.id_Sexo where id_animal = :n');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;
  if IBQAux.FieldByName('sexo').AsInteger = 1 then
  begin
    QRLabel96.Caption := Traducir('Madre');
    LabelPadreProduccion.Caption := Traducir('Madre');
  end
  else
  begin
    QRLabel96.Caption := Traducir('Padre');
    LabelPadreProduccion.Caption := Traducir('Padre');
  end;

  if IBQAux.FieldByName('tipo').AsInteger = 1 then
    ImSexo.GetBitmap(0,IAnimal.Picture.Bitmap)
  else
    ImSexo.GetBitmap(1,IAnimal.Picture.Bitmap);

  {IBQArbolGenea.Active := false;
  IBQArbolGenea.ParamByName('n').AsInteger := id_animal;
  IBQArbolGenea.Active := true;}
  armarArbol(id_animal);

  // Imprimo el primer nodo
  retornarAlternativo(id_animal,false, alter, valor);
  if (IBQAux.fieldByName('nombre').AsString = IBQAux.fieldByName('id_rp').AsString) then
    linea1.Caption := Traducir('  RP: ')+IBQAux.fieldByName('id_rp').AsString
  else
    linea1.Caption := Traducir('  RP: ')+IBQAux.fieldByName('id_rp').AsString+' - '+IBQAux.fieldByName('nombre').AsString;
  linea1.Caption := linea1.Caption+' - '+alter+' '+valor;
  {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
    linea3.Caption := '  Raza: '+retornarRaza(IBQAux.fieldbyName('raza').AsInteger)
   else
     linea3.Caption := '';  }

  //************** PARA LOS HIJOS  ***********************
  IBQHijos.Active := false;
  IBQHijos.ParamByName('n').AsInteger := id_animal;
  IBQHijos.Active := true;

  if hembra then
    LabelPadreProduccion.Caption := Traducir('Padre')
  else
    LabelPadreProduccion.Caption := Traducir('Madre');

  if (IBQHijos.IsEmpty) then
    begin
      QRShape11.Enabled:= false;
      QRShape13.Enabled:= false;
      QRShape15.Enabled:= false;
      QRShape16.Enabled:= false;
      QRShape20.Enabled:= false;
      QRShape21.Enabled:= false;
      QRShape22.Enabled:= false;
      QRShape23.Enabled:= false;
      QRShape24.Enabled:= false;
      QRShape25.Enabled:= false;
    end
   else
    begin
      QRShape11.Enabled:= true;
      QRShape13.Enabled:= true;
      QRShape15.Enabled:= true;
      QRShape16.Enabled:= true;
      QRShape20.Enabled:= true;
      QRShape21.Enabled:= true;
      QRShape22.Enabled:= true;
      QRShape23.Enabled:= true;
      QRShape24.Enabled:= true;
      QRShape25.Enabled:= true;
    end;
end;

// concatena los reportes
procedure TFREPPedigreePreview.QRCRPedigreeAddReports(Sender: TObject);
begin
  inherited;
  QRCRPedigree.Reports.Clear;
  QRCRPedigree.Reports.Add(QRDatosEspecificos);
  if not(IBQHijos.IsEmpty) then
    if RazaAnimal in [10,11,12,28] then
      QRCRPedigree.Reports.Add(QRProduccionBr)
    else
      QRCRPedigree.Reports.Add(QRProduccion);
  QRCRPedigree.Reports.Add(QRGenealogia);
  QRCRPedigree.Reports.Add(QRSummary);
end;

procedure TFREPPedigreePreview.recuperarInspeccionyDestino(id_animal : Integer);
var
  total_ia, total_ir, total_ire, total_ins, ind, k, total_destino : integer;
  nLen: integer;
  destinos : Array of TRegDestinos;
  cant : TRegDestinos;
begin
  IBQAux.Close;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select inspeccion, destino from get_hijos(:id,'''')');
  IBQAux.ParamByName('id').AsInteger := id_animal;
  IBQAux.Open;
  IBQAux.First;
  total_ia := 0;
  total_ir := 0;
  total_ire := 0;
  total_ins := 0;
  while not IBQAux.Eof do
  begin
    if IBQAux.FieldByName('destino').Value <> null then
    begin
      ind := 0;
      while ind <= Length(destinos)-1 do
      begin
        if destinos[ind].dest = IBQAux.FieldByName('destino').AsInteger then
          break;
        Inc(ind);
      end;
      if ind >= length(destinos) then
      begin
        SetLength(destinos,ind+1);
        destinos[ind].cant := 1;
        destinos[ind].dest := IBQAux.FieldValues['destino'];
      end
      else
        Inc(destinos[ind].cant);
    end;
    if IBQAux.FieldByName('inspeccion').Value <> null then
    begin
      case IBQAux.FieldByName('inspeccion').AsInteger of
        1 : Inc(total_ia);
        2 : Inc(total_ir);
        3 : Inc(total_ire);
      end;
      Inc(total_ins);
    end;
    IBQAux.Next;
  end;
  QRLCantAp.Caption := IntToStr(total_ia);
  QRLCantRe.Caption := IntToStr(total_ir);
  QRLCantReins.Caption := IntToStr(total_ire);
  if total_ins > 0 then
  begin
    QRLPorAp.Caption := FormatFloat('###0.00',(total_ia/total_ins)*100)+'%';
    QRLPorRe.Caption := FormatFloat('###0.00',(total_ir/total_ins)*100)+'%';
    QRLPorReins.Caption := FormatFloat('###0.00',(total_ire/total_ins)*100)+'%';
  end
  else
  begin
    QRLPorAp.Caption := '0';
    QRLPorRe.Caption := '0';
    QRLPorReins.Caption := '0';
  end;
  for ind := 0 to Length(destinos)-1 do
    for k := ind+1 to Length(destinos)-1 do
      if destinos[ind].cant < destinos[k].cant then
      begin
        cant := destinos[ind];
        destinos[ind] := destinos[k];
        destinos[k] := cant;
      end;
  DMSoftvet.IBQCodDestCabania.Close;
  DMSoftvet.IBQCodDestCabania.Open;
  total_destino := 0;
  k := 0;
  nLen := Length(destinos) -1;

  for ind := 0 to nLen do
  begin
    if (k < 5) and (destinos[ind].dest <> 0) then
      total_destino := total_destino + destinos[ind].cant
  end;

  k := 0;
  for ind := 0 to nLen do
  begin
    if (k < 5) and (destinos[ind].dest <> 0) then
    begin
      case ind of
        0 : begin
              QRLDestino1.Enabled := true;
              QRLD1.Enabled := true;
              QRLDPor1.Enabled := true;
              QRLDestino1.Caption := DMSoftvet.IBQCodDestCabania.Lookup('id_dest_cabania',destinos[ind].dest,'nombre');
              QRLD1.Caption := IntToStr(destinos[ind].cant);
              if total_destino > 0 then
                QRLDPor1.Caption := FormatFloat('###0.00',(destinos[ind].cant/total_destino)*100)+'%'
              else
                QRLDPor1.Caption := '0';
            end;
        1 : begin
              QRLDestino2.Enabled := true;
              QRLD2.Enabled := true;
              QRLDPor2.Enabled := true;
              QRLDestino2.Caption := DMSoftvet.IBQCodDestCabania.Lookup('id_dest_cabania',destinos[ind].dest,'nombre');
              QRLD2.Caption := IntToStr(destinos[ind].cant);
              if total_destino > 0 then
                QRLDPor2.Caption := FormatFloat('###0.00',(destinos[ind].cant/total_destino)*100)+'%'
              else
                QRLDPor2.Caption := '0';
            end;
        2 : begin
              QRLDestino3.Enabled := true;
              QRLD3.Enabled := true;
              QRLDPor3.Enabled := true;
              QRLDestino3.Caption := DMSoftvet.IBQCodDestCabania.Lookup('id_dest_cabania',destinos[ind].dest,'nombre');
              QRLD3.Caption := IntToStr(destinos[ind].cant);
              if total_destino > 0 then
                QRLDPor3.Caption := FormatFloat('###0.00',(destinos[ind].cant/total_destino)*100)+'%'
              else
                QRLDPor3.Caption := '0';
            end;
        3 : begin
              QRLDestino4.Enabled := true;
              QRLD4.Enabled := true;
              QRLDPor4.Enabled := true;
              QRLDestino4.Caption := DMSoftvet.IBQCodDestCabania.Lookup('id_dest_cabania',destinos[ind].dest,'nombre');
              QRLD4.Caption := IntToStr(destinos[ind].cant);
              if total_destino > 0 then
                QRLDPor4.Caption := FormatFloat('###0.00',(destinos[ind].cant/total_destino)*100)+'%'
              else
                QRLDPor4.Caption := '0';
            end;
        4 : begin
              QRLDestino5.Enabled := true;
              QRLD5.Enabled := true;
              QRLDPor5.Enabled := true;
              QRLDestino5.Caption := DMSoftvet.IBQCodDestCabania.Lookup('id_dest_cabania',destinos[ind].dest,'nombre');
              QRLD5.Caption := IntToStr(destinos[ind].cant);
              if total_destino > 0 then
                QRLDPor5.Caption := FormatFloat('###0.00',(destinos[ind].cant/total_destino)*100)+'%'
              else
                QRLDPor5.Caption := '0';
            end;
      end;
      Inc(k);
    end
  //  else
  //    break;
  end;
end;

// recupera e imprime la circunferencia escrotal del animal
procedure TFREPPedigreePreview.recuperarCircunfEscrotal(id_animal:integer);
var sql : string;
begin
  sql := 'select first 1 ece.valor as valor, ee.fecha from eve_eventos ee, eve_circunferencia_escrotal ece where (ee.id_evento = ece.id_evento) and (animal = :n) order by fecha desc';
  recuperarDatos(id_animal, sql, QRLCircunfEscrotal);
end;

procedure TFREPPedigreePreview.recuperarOrigen(id_animal : Integer);
var
  sql : String;
begin
  sql := 'select co.sinonimo as valor from cod_origen co join tab_animales ta on co.id_origen = ta.origen_animal where ta.id_animal = :n';
  recuperarDatos(id_animal,sql,QRLOrigen);
end;

// recupera e imprime el peso al destete del animal
procedure TFREPPedigreePreview.recuperarPesoDestete(id_animal: integer);
var sql : string;
begin
  if Ajuste = 'S' then
    sql := 'select ta.peso205 as valor from tab_animales ta where (ta.id_animal = :n)'
  else
    sql := 'select first 1 ep.peso as valor from eve_peso ep join eve_eventos ee on ee.id_evento = ep.id_evento where (ee.animal = :n) and (ep.dias = ''D'') order by ee.fecha desc, ee.id_evento desc';
  recuperarDatos(id_animal, sql, QRLPesoDestete);
end;

procedure TFREPPedigreePreview.recuperarRegistro(id_animal : Integer);
var
  sql : String;
begin
  sql := 'select cs.nombre as valor from tab_animales ta join cod_subcategorias cs on ta.subcategoria = cs.id_subcategoria where ta.id_animal = :n';
  recuperarDatos(id_animal, sql, QRLTipoRegistro);
end;

procedure TFREPPedigreePreview.recuperarDestino(id_animal : Integer);
var
  sql : String;
begin
  sql := 'select cdc.nombre as valor from tab_animales ta join cod_dest_cabania cdc on ta.destino_cabania = cdc.id_dest_cabania where ta.id_animal = :n';
  //recuperarDatos(id_animal, sql, QRLDestinoV);
end;

procedure TFREPPedigreePreview.recuperarInspeccion(id_animal : Integer);
var
  sql : String;
begin
  sql := 'select ci.nombre as valor from tab_animales ta join cod_inspeccion ci on ta.inspeccion = ci.id_inspeccion where ta.id_animal = :n';
  //recuperarDatos(id_animal, sql, QRLInspeccionV);
end;

procedure TFREPPedigreePreview.recuperarPesoAnio(id_animal:integer);
var sql : string;
begin
  if Ajuste = 'S' then
    sql := 'select ta.peso365 as valor from tab_animales ta where (ta.id_animal = :n)'
  else
    sql := 'select first 1 ep.peso as valor from eve_peso ep join eve_eventos ee on ee.id_evento = ep.id_evento where (ee.animal = :n) and (ep.dias = ''A'') order by ee.fecha desc, ee.id_evento desc';
  recuperarDatos(id_animal, sql, QRLPesoAnio);
end;

procedure TFREPPedigreePreview.recuperarPesoAdulto(id_animal:integer);
var sql : string;
begin
  if Ajuste = 'S' then
    sql := 'select ta.peso550 as valor from tab_animales ta where (ta.id_animal = :n)'
  else
    sql := 'select first 1 ep.peso as valor from eve_peso ep join eve_eventos ee on ee.id_evento = ep.id_evento where (ee.animal = :n) and (ep.dias = ''T'') order by ee.fecha desc, ee.id_evento desc';
  recuperarDatos(id_animal, sql, QRLPesoAdulto);
end;


// recupera e imprime el peso al nacer del animal
procedure TFREPPedigreePreview.recuperarPesoNacer(id_animal: integer);
var sql : string;
begin
  if Ajuste = 'S' then
    sql := 'select pesonacer as valor from tab_animales where (id_animal = :n)'
  else
    sql := 'select first 1 ep.peso as valor from eve_peso ep join eve_eventos ee on ee.id_evento = ep.id_evento where (ee.animal = :n) and (ep.dias = ''N'') order by ee.fecha desc, ee.id_evento desc';
  recuperarDatos(id_animal, sql, QRLPesoNacer);
end;

// Recupera e imprime el rp del animal
procedure TFREPPedigreePreview.recuperarRP(id_animal:integer);
var
  s1, ident, valIdent : String;
begin
  s1 := '';
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.Add('select * from tab_animales where id_animal = :n');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;
  QRLRPAnimal.Caption := 'RP:'+IBQAux.fieldbyName('id_rp').AsString;
  if IBQAux.FieldByName('nombre').Value <> null then
    if IBQAux.FieldByName('nombre').AsString <> '' then
      s1 := 'Nombre: '+IBQAux.FieldValues['nombre'];
  retornarAlternativo(id_animal,false,ident,valIdent);
  if s1 <> '' then
    QRLRPAnimal.Caption := QRLRPAnimal.Caption+' - '+s1;
  QRLRPAnimal.Caption := QRLRPAnimal.Caption+' - '+ident+valIdent;
  idSexo := IBQAux.fieldbyName('sexo').AsInteger;
end;

// Recupera e imprime la capacidad de servicio del animal
procedure TFREPPedigreePreview.recuperarCapacidadServicio(id_animal: integer);
var sql : string;
begin
  sql := 'select first 1 cvc.nombre as valor, ee.fecha from eve_eventos ee, eve_capacidad_servicio ecs, cod_valores_capacidad cvc '+
         'where (ee.id_evento = ecs.id_evento) and (ecs.valor=cvc.id_valor_capacidad) and (animal = :n) '+
         'order by ee.fecha desc';
  recuperarDatos(id_animal, sql, QRLCapacidadServicio);
end;

// metodo generico para tomar los datos de los eventos y mostrarlos en el label que viene como parametro
procedure TFREPPedigreePreview.recuperarDatos(param: integer; sql: string; labelCaption: TQRLabel);
var
  tag : integer;
  aux : double;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.Add(sql);
  IBQAux.ParamByName('n').AsInteger := param;
  IBQAux.Active := true;
  tag := labelCaption.Tag;
  if ((tag = 20) or (tag = 30)) then
    begin
      labelCaption.Enabled := not hembra;
      LabelCapacidadServicio.Enabled := not hembra;
      LabelCircunfEscrotal.Enabled := not hembra;
      if (tag=20) then
      begin
        FechaMedCirc.Enabled := not hembra;
        if IBQAux.IsEmpty then
          FechaMEdCirc.Caption := ''
        else
          FechaMEdCirc.Caption := 'Fecha: '+DateToStr(IBQAux.fieldByName('fecha').AsDateTime);
      end;
      if (tag=30) then
      begin
        FechaMedCap.Enabled := not hembra;
        if (IBQAux.IsEmpty) then
          FechaMEdCap.Caption := ''
        else
          FechaMEdCap.Caption := 'Fecha: '+DateToStr(IBQAux.fieldByName('fecha').AsDateTime);
      end;
    end
   else
    if (tag = 40) then
      begin
        labelCaption.Enabled:= hembra;
        LabelEstadoLactacion.Enabled:= hembra;
        LabelFechaAlPrimerParto.Enabled:= hembra;
        LabelEdadalPrimerParto.Enabled:= hembra;
      end;
  if tag = 50 then //Para los pesos
  begin
    if (IBQAux.fieldbyName('valor').AsString <> '') then
    begin
      aux := StrToFloat(IBQAux.FieldValues['valor']);
      labelCaption.Caption := FormatFloat('####.##',aux);
    end
    else
      labelCaption.Caption := '';
  end
  else
  begin
    if (IBQAux.fieldbyName('valor').AsString <> '') then
      labelCaption.Caption := IBQAux.fieldbyName('valor').AsString
    else
      labelCaption.Caption := '';
  end;
end;

// solo para poner las unidades de los pesos ****************************
procedure TFREPPedigreePreview.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (Value <> '')then
     Value := Value + ' KGs';
end;
procedure TFREPPedigreePreview.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (Value <> '')then
     Value := Value + ' KGs';
end;
procedure TFREPPedigreePreview.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (Value <> '')then
     Value := Value + ' KGs';
end;
//*************************************************************************

// metodo que retorna un identificador alternativo de un animal con las prioridades planteadas(no se si va)
procedure TFREPPedigreePreview.retornarAlternativo(id: integer;
  externo: boolean; var identif, value: string);
var
  rz : Integer;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  if (externo) then
    IBQAux.sql.add('select * from tab_animales_externos where (id_animal_externo = :n)')
  else
    IBQAux.sql.add('select * from tab_animales where (id_animal = :n)');
  IBQAux.ParamByName('n').AsInteger := id;
  IBQAux.Active := true;
  if IBQAux.FieldValues['raza'] <> null then
    rz := IBQAux.FieldValues['raza']
  else
    rz := 0;
  if ((IBQAux.fieldbyname('id_hba').AsString <> '') and (IBQAux.fieldbyname('id_hba').Value <> null))then
    begin
      identif := FPrincipal.PaisHerdBook+': ';
      value := IBQAux.fieldbyname('id_hba').AsString;
    end
  else
    if ((IBQAux.fieldbyname('id_pc').AsString <> '') and (IBQAux.fieldbyname('id_pc').Value <> null)) then
      begin
        case rz of
          2,3 : identif := 'PC: ';
          10 : identif := 'RGB: ';
          11 : identif := 'ABA: ';
          12,28 : identif := 'AAB: ';
        end;
        value := IBQAux.fieldbyname('id_pc').AsString;
      end
    else
      if ((IBQAux.fieldbyname('id_ra').AsString <> '') and (IBQAux.fieldbyname('id_ra').Value <> null)) then
        begin
          case rz of
            11 : identif := 'UBB: ';
          end;
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

// genera un label en la banda con el texto  (SOLO PARA EL PRIMERO)
procedure TFREPPedigreePreview.generarLabel(x: integer; texto: string; flag:integer);
begin
  banda.Height := banda.Height + 13;
  with  (TQRLabel (banda.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      Left := x;
      Font.Size := 8;
      Font.Name := 'Arial';
      Top := banda.Height - 12;
      Height := 13;
      Caption := '  '+texto;
      case flag of
        1 : Frame.DrawTop := true;
        2 : Frame.DrawBottom := true;
      end;
      Width := 300;
      Frame.DrawLeft := true;
      Frame.DrawRight := true;
    end;
end;

// retorna el nombre de una raza dada
function TFREPPedigreePreview.retornarRaza(raza: integer): string;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.add('select nombre from cod_razas where (id_raza = :n)');
  IBQAux.ParamByName('n').AsInteger := raza;
  IBQAux.Active := true;
  result := IBQAux.fieldByName('nombre').AsString;
end;

// Configuro toda la caja
procedure TFREPPedigreePreview.LabelLinea1Print(sender: TObject;  var Value: String);
begin
  inherited;
  LabelCategoriaPadre.Caption := retornarCategoriaPadre;
  Value := '  RP: '+Value +  ' : '+IBQArbolGenea.fieldByname('nombre').AsString;
end;

// RETORNA MADRE O PADRE O ABUELA O ABUELO O BISABUELA O BISABUELO
function TFREPPedigreePreview.retornarCategoriaPadre: string;
begin
  case IBQArbolGenea.fieldByname('nivel_arbol').AsInteger of
    1 : begin
          if (IBQArbolGenea.fieldByname('madre').AsString = 'S') then
            result := 'Madre'
          else
            result := 'Padre';
        end;
    2 : begin
          if (IBQArbolGenea.fieldByname('madre').AsString = 'S') then
            result := 'Abuela'
          else
            result := 'Abuelo';
        end;
    3 : begin
          if (IBQArbolGenea.fieldByname('madre').AsString = 'S') then
            result := 'Bisabuela'
          else
            result := 'Bisabuelo';
        end;
  end;
end;

// vamos a ver si anda
procedure TFREPPedigreePreview.labelLinea2Print(sender: TObject; var Value: String);
var alter : string;
    valor : string;
begin
  inherited;
  if (IBQArbolGenea.fieldByname('EXTERNO').AsString = 'S') then
    retornarAlternativo(IBQArbolGenea.fieldByname('id_animal').AsInteger,true, alter, valor)
  else
    retornarAlternativo(IBQArbolGenea.fieldByname('id_animal').AsInteger,false, alter, valor);
  Value := '  '+alter+' '+valor;
end;

// vamos a ver si anda
procedure TFREPPedigreePreview.labelLinea3Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := '  Raza: '+retornarRaza(StrToInt(Value));
end;

// metodo que se ejecuta antes de imprimir la banda
procedure TFREPPedigreePreview.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if not(IBQArbolGenea.IsEmpty) then
    begin
      case IBQArbolGenea.fieldByname('nivel_arbol').AsInteger of
        1 : begin
              LabelCategoriaPadre.Left := 100;
              labelLinea1.Left := 100;
              labelLinea2.Left := 100;
              labelLinea3.Left := 100;

              QRSHorizontal.Left := 55;
              QRSAbuelos.Left := 5;
              QRSBisAbuelos.Left := 5;
              QRSAbuelos.Pen.Color := clWhite;
              QRSBisAbuelos.Pen.Color := clWhite;
              if IBQArbolGenea.fieldByname('madre').AsString = 'S' then
                QRSPadres.Height := 40
              else
                QRSPadres.Height := 79;
            end;
        2 : begin
              labelLinea1.Left := 200;
              labelLinea2.Left := 200;
              labelLinea3.Left := 200;
              LabelCategoriaPadre.Left := 200;

              QRSHorizontal.Left := 155;
              QRSAbuelos.Left := 150;
              QRSBisAbuelos.Left := 5;
              QRSAbuelos.Pen.Color := clGray;
              QRSBisAbuelos.Pen.Color := clWhite;
              if IBQArbolGenea.fieldByname('madre').AsString = 'S' then
                QRSAbuelos.Height := 40
              else
                QRSAbuelos.Height := 79;

            end;
        3 : begin
              labelLinea1.Left := 300;
              labelLinea2.Left := 300;
              labelLinea3.Left := 300;
              LabelCategoriaPadre.Left := 300;
              QRSBisAbuelos.Left := 250;
              QRSHorizontal.Left := 255;
              QRSBisAbuelos.Pen.Color := clGray;
              if IBQArbolGenea.fieldByname('madre').AsString = 'S' then
                QRSBisAbuelos.Height := 40
              else
                QRSBisAbuelos.Height := 79;
            end;
      end;
    end
  else
    PrintBand := false;
end;

procedure TFREPPedigreePreview.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos3.Caption := FPrincipal.NombreEstablecimiento;  
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon22.Enabled := true;
      QRLRenglon12.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon22.Caption := FPrincipal.Renspa;

      QRLRenglon23.Enabled := true;
      QRLRenglon13.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon23.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon22.Enabled := true;
      QRLRenglon12.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon22.Caption := FPrincipal.Renspa;

      QRLRenglon23.Enabled := true;
      QRLRenglon13.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon23.Caption := FPrincipal.Renspa;      
    end;

    MostrarCompPais();

    cargarDatosPropietario();
end;

procedure TFREPPedigreePreview.identificarSexo;
begin
  hembra := false;
  if ((idSexo = 2) or (idSexo = 5) or (idSexo = 6) or (idSexo = 9) or (idSexo = 10) ) then
    hembra := true;
end;

procedure TFREPPedigreePreview.EstadisticaProduccion(id_animal:integer);
begin
  // Cantidad de Machos
  QRLTotal.Caption := IntToStr(Total(id_animal));
  QRLCantMachos.Caption:= IntToStr(CantidadMachos(id_animal));
  QRLCantHembras.Caption:= IntToStr(CantidadHembras(id_animal));
  QRLPromPesoNacer.Caption:= IntToStr(PromedioPesoNacimiento(id_animal)) + ' KGs.';
  QRLPromPesoDestete.Caption:= IntToStr(PromedioPesoDestete(id_animal)) + ' KGs.';
  QRLPromPesoAnio.Caption:= IntToStr(PromedioPesoAnio(id_animal)) + ' KGs.';
  QRLTotalDistocias.Caption:= IntToStr(CondDistocia(id_animal));
  QRLTotalRechazos.Caption := IntToStr(CantRechazos(id_animal));
  QRLPromDistocia.Caption := PromDistocias(id_animal);
  QRLPromRechazos.Caption := PromRechazos(id_animal);
end;

function TFREPPedigreePreview.CantRechazos(id_animal : integer) : integer;
begin
  IBQAux.Close;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select count(*) from get_hijos(:n,'''') where rechazo = ''S''');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Open;
  Result := IBQAux.FieldValues['count'];
end;

function TFREPPedigreePreview.PromDistocias(id_animal : integer) : string;
var
  Total, Dis : Integer;
begin
  Total := StrToInt(QRLTotal.Caption);
  Dis := StrToInt(QRLTotalDistocias.Caption);
  if Total > 0 then
    Result := FormatFloat('##,##',(Dis/Total)*100)+'%'
  else
  begin
    QRLPromDistocia.Font.Color := clBlack;
    Result := '0%';
  end;
end;

function TFREPPedigreePreview.PromRechazos(id_animal : integer) : string;
var
  Total, Rec : Integer;
begin
  Total := StrToInt(QRLTotal.Caption);
  Rec := StrToInt(QRLTotalRechazos.Caption);
  if Total > 0 then
    Result := FormatFloat('##,##',(Rec/Total)*100)+'%'
  else
    Result := '0%';
end;

function TFREPPedigreePreview.Total(id_animal : Integer) : Integer;
begin
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select count(*) from get_hijos(:n,'''')');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;
  result := IBQAux.fieldByName('count').AsInteger;
end;

function TFREPPedigreePreview.CantidadMachos(id_animal: integer): Integer;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.add('select Count(SEXO) from get_hijos(:n,''M'')');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;
  result := IBQAux.fieldByName('count').AsInteger;
end;

function TFREPPedigreePreview.CantidadHembras(id_animal: integer): Integer;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.add('select Count(SEXO) from get_hijos(:n,''H'')');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;
  result := IBQAux.fieldByName('count').AsInteger;
end;

function TFREPPedigreePreview.PromedioPesoNacimiento(
  id_animal: Integer): Integer;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.add('select avg(pesonac) from get_hijos(:n,'''')');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;
  result := IBQAux.fieldByName('avg').AsInteger;
end;

function TFREPPedigreePreview.PromedioPesoDestete(
  id_animal: Integer): Integer;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.add('select avg(pesodestete) from get_hijos(:n,'''')');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;
  result := IBQAux.fieldByName('avg').AsInteger;
end;

function TFREPPedigreePreview.PromedioPesoAnio(
  id_animal: Integer): Integer;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.add('select avg(pesoanio) from get_hijos(:n,'''')');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;
  result := IBQAux.fieldByName('avg').AsInteger;
end;

function TFREPPedigreePreview.CondDistocia(id_animal: Integer): Integer;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.add('select count(CONDDISTOCIA) from get_hijos(:n,'''') where conddistocia<>'' ''');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;
  result := IBQAux.fieldByName('COUNT').AsInteger;
  if IBQAux.fieldByName('COUNT').AsInteger = 0 then
    QRLTotalDistocias.Font.Color := clBlack;
end;

procedure TFREPPedigreePreview.recuperarFechaNacimiento(
  id_animal: Integer);
var sql : string;
begin
  sql := 'select Fecha_Nacimiento as valor from TAB_ANIMALES where id_animal = :n';
  recuperarDatos(id_animal, sql, QRLFechaNacimiento);
end;

procedure TFREPPedigreePreview.recuperarEstadoLactacion(
  id_animal: Integer);
var sql : string;
    cant : Integer;
begin
  sql := 'select Estado_Lactacion as valor from TAB_ANIMALES where id_animal = :n';
  recuperarDatos(id_animal, sql, QRLEstadoLactacion);
  //Esto es para contar los partos por transferencia
  IBQPartosTransf.Close;
  IBQPartosTransf.ParamByName('animal').AsInteger := id_animal;
  IBQPartosTransf.Open;
  cant := IBQPartosTransf.FieldValues['cantidad'];
  if cant > 0 then
    QRLEstadoLactacion.Caption := QRLEstadoLactacion.Caption+' ('+IntToStr(cant)+Traducir(' Partos por Transferencia)');
  ///////
end;

procedure TFREPPedigreePreview.recuperarFechaAlPrimerParto(
  id_animal: Integer);
var sql : string;
    fechaparto, fechapartomasivo: String;
begin
  fechaparto:= '';
  fechapartomasivo:= '';  

  sql := 'select first 1 ee.fecha as valor from eve_eventos ee, eve_parto ep where ee.animal = :n  and ee.id_evento= ep.id_evento order by ee.fecha asc';
  recuperarDatos(id_animal, sql, QRLFechaAlPrimerParto);
  if (QRLFechaAlPrimerParto.Caption <> '') then
    fechaparto:= QRLFechaAlPrimerParto.Caption;

  sql := 'select first 1 ee.fecha as valor from eve_eventos ee, eve_parto_masivo epm where ee.animal = :n  and ee.id_evento= epm.id_evento order by ee.fecha asc';
  recuperarDatos(id_animal, sql, QRLFechaAlPrimerParto);
  if (QRLFechaAlPrimerParto.Caption <> '') then
    fechapartomasivo:= QRLFechaAlPrimerParto.Caption;

  if ((fechaparto<>'')and(fechapartomasivo<>'')) then
    begin
     if (StrtoDate(fechaparto) < StrToDate(fechapartomasivo)) then
       QRLFechaAlPrimerParto.Caption:= fechaparto
      else
         QRLFechaAlPrimerParto.Caption:= fechapartomasivo;
    end
   else
     if ((fechaparto='')and(fechapartomasivo<>'')) then
         QRLFechaAlPrimerParto.Caption:= fechapartomasivo
       else
         if ((fechaparto<>'')and(fechapartomasivo='')) then
           QRLFechaAlPrimerParto.Caption:= fechaparto         
end;

procedure TFREPPedigreePreview.QRLPesoNacerPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' KGs.';
end;

procedure TFREPPedigreePreview.QRLPesoDestetePrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' KGs.';
end;

procedure TFREPPedigreePreview.QRLCircunfEscrotalPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' Cms.';
end;

procedure TFREPPedigreePreview.ComponentesVisiblesPorPais(pais: Integer);
var raza: String;
begin
  inherited;
  if (Pais = 2) then //si el pais es uruguay
    begin
      //
    end
   else
     begin
      raza:= 'Raza: ';
      InfP.Lines.Add('');
      InfP.Lines.Add(raza);

      InfM.Lines.Add('');
      InfM.Lines.Add(raza);

      InfPP.Lines.Add('');
      InfPP.Lines.Add(raza);

      InfPM.Lines.Add('');
      InfPM.Lines.Add(raza);

      InfMP.Lines.Add('');
      InfMP.Lines.Add(raza);

      InfMM.Lines.Add('');
      InfMM.Lines.Add(raza);

      InfPPP.Lines.Add('');
      InfPPP.Lines.Add(raza);

      InfPPM.Lines.Add('');
      InfPPM.Lines.Add(raza);

      InfPMP.Lines.Add('');
      InfPMP.Lines.Add(raza);

      InfPMM.Lines.Add('');
      InfPMM.Lines.Add(raza);

      InfMPP.Lines.Add('');
      InfMPP.Lines.Add(raza);

      InfMPM.Lines.Add('');
      InfMPM.Lines.Add(raza);

      InfMMP.Lines.Add('');
      InfMMP.Lines.Add(raza);

      InfMMM.Lines.Add('');
      InfMMM.Lines.Add(raza);
    end;
end;

procedure TFREPPedigreePreview.bandaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  ComponentesVisiblesPorPais(FPrincipal.Pais);
end;

procedure TFREPPedigreePreview.MostrarCompPais;
begin
  if (FPrincipal.Pais = 1) then // Argentina
    begin
       QRShape55.Enabled:= false;
       QRShape64.Enabled:= false;
       QRShape65.Enabled:= false;
       QRShape56.Enabled:= false;
       QRShape57.Enabled:= false;
       QRShape70.Enabled:= false;
       QRShape69.Enabled:= false;
       QRShape68.Enabled:= false;
       QRShape67.Enabled:= false;
       QRShape66.Enabled:= false;
       QRShape58.Enabled:= false;
       QRShape59.Enabled:= false;
       QRShape60.Enabled:= false;
       QRShape61.Enabled:= false;
       QRShape62.Enabled:= false;
       QRShape63.Enabled:= false;
       QRShape72.Enabled:= false;
       QRShape71.Enabled:= false;
       QRShape73.Enabled:= false;

       QRLabel71.Enabled:= false;
       QRLabel68.Enabled:= false;
       QRLabel72.Enabled:= false;
       QRLabel67.Enabled:= false;
       QRLabel27.Enabled:= false;
       QRLabel26.Enabled:= false;
       QRLabel24.Enabled:= false;
       QRLabel25.Enabled:= false;
       QRLabel17.Enabled:= false;
       QRLabel18.Enabled:= false;
       QRLabel19.Enabled:= false;
       QRLabel20.Enabled:= false;
       QRLabel21.Enabled:= false;
       QRLabel23.Enabled:= false;
       QRLabel22.Enabled:= false;
       QRLabel28.Enabled:= false;
       QRLabel63.Enabled:= false;
       QRLabel64.Enabled:= false;
       QRLabel65.Enabled:= false;
       QRLabel66.Enabled:= false;
       QRLabel70.Enabled:= false;
       QRLabel69.Enabled:= false;
       QRLabel74.Enabled:= false;
       QRLabel75.Enabled:= false;
       QRLabel76.Enabled:= false;
       QRLabel77.Enabled:= false;
       QRLabel78.Enabled:= false;
       QRLabel82.Enabled:= false;
       QRLabel81.Enabled:= false;

       QRDBText36.Enabled:= false;
       QRDBText54.Enabled:= false;
       QRDBText51.Enabled:= false;
       QRDBText52.Enabled:= false;
       QRDBText53.Enabled:= false;
       QRDBText55.Enabled:= false;
       QRDBText56.Enabled:= false;
       QRDBText38.Enabled:= false;
       QRDBText37.Enabled:= false;
       QRDBText39.Enabled:= false;
       QRDBText40.Enabled:= false;
       QRDBText41.Enabled:= false;
       QRDBText43.Enabled:= false;
       QRDBText42.Enabled:= false;
       QRDBText44.Enabled:= false;
       QRDBText45.Enabled:= false;
       QRDBText46.Enabled:= false;
       QRDBText47.Enabled:= false;
       QRDBText48.Enabled:= false;
       QRDBText50.Enabled:= false;
       QRDBText49.Enabled:= false;

       QRBand11.Height:=162;

    end
   else
    if (FPrincipal.Pais = 2) then // Uruguay
      begin
         QRShape35.Enabled:= false;
         QRShape49.Enabled:= false;
         QRShape50.Enabled:= false;
         QRShape36.Enabled:= false;
         QRShape37.Enabled:= false;
         QRShape38.Enabled:= false;
         QRShape39.Enabled:= false;
         QRShape40.Enabled:= false;
         QRShape41.Enabled:= false;
         QRShape42.Enabled:= false;
         QRShape43.Enabled:= false;
         QRShape44.Enabled:= false;
         QRShape45.Enabled:= false;
         QRShape46.Enabled:= false;
         QRShape47.Enabled:= false;
         QRShape48.Enabled:= false;
         QRShape51.Enabled:= false;
         QRShape52.Enabled:= false;
         QRShape53.Enabled:= false;

         QRLabel15.Enabled:= false;
         QRLabel14.Enabled:= false;
         QRLabel12.Enabled:= false;
         QRLabel13.Enabled:= false;
         QRLabel29.Enabled:= false;
         QRLabel30.Enabled:= false;
         QRLabel31.Enabled:= false;
         QRLabel32.Enabled:= false;
         QRLabel33.Enabled:= false;
         QRLabel34.Enabled:= false;
         QRLabel35.Enabled:= false;
         QRLabel36.Enabled:= false;
         QRLabel37.Enabled:= false;
         QRLabel38.Enabled:= false;
         QRLabel39.Enabled:= false;
         QRLabel40.Enabled:= false;
         QRLabel41.Enabled:= false;
         QRLabel42.Enabled:= false;
         QRLabel43.Enabled:= false;
         QRLabel44.Enabled:= false;
         QRLabel45.Enabled:= false;
         QRLabel46.Enabled:= false;
         QRLabel47.Enabled:= false;
         QRLabel48.Enabled:= false;
         QRLabel49.Enabled:= false;
         QRLabel50.Enabled:= false;
         QRLabel51.Enabled:= false;
         QRLabel52.Enabled:= false;
         QRLabel53.Enabled:= false;
         QRLabel54.Enabled:= false;
         QRLabel55.Enabled:= false;
         QRLabel56.Enabled:= false;
         QRLabel57.Enabled:= false;
         QRLabel58.Enabled:= false;
         QRLabel59.Enabled:= false;
         QRLabel60.Enabled:= false;
         QRLabel61.Enabled:= false;
         QRLabel62.Enabled:= false;

         QRDBText10.Enabled:= false;
         QRDBText34.Enabled:= false;
         QRDBText35.Enabled:= false;
         QRDBText9.Enabled:= false;
         QRDBText12.Enabled:= false;
         QRDBText11.Enabled:= false;
         QRDBText13.Enabled:= false;
         QRDBText14.Enabled:= false;
         QRDBText15.Enabled:= false;
         QRDBText16.Enabled:= false;
         QRDBText17.Enabled:= false;
         QRDBText18.Enabled:= false;
         QRDBText19.Enabled:= false;
         QRDBText20.Enabled:= false;
         QRDBText21.Enabled:= false;
         QRDBText22.Enabled:= false;
         QRDBText23.Enabled:= false;
         QRDBText24.Enabled:= false;
         QRDBText25.Enabled:= false;
         QRDBText26.Enabled:= false;
         QRDBText27.Enabled:= false;
         QRDBText28.Enabled:= false;
         QRDBText29.Enabled:= false;
         QRDBText30.Enabled:= false;
         QRDBText31.Enabled:= false;
         QRDBText32.Enabled:= false;
         QRDBText33.Enabled:= false;


         QRShape55.Top:= 12;
         QRShape64.Top:= 12;
         QRShape65.Top:= 12;
         QRShape56.Top:= 13;
         QRShape57.Top:= 52;
         QRShape70.Top:= 52;
         QRShape69.Top:= 52;
         QRShape68.Top:= 52;
         QRShape67.Top:= 52;
         QRShape66.Top:= 52;
         QRShape58.Top:= 13;
         QRShape59.Top:= 13;
         QRShape60.Top:= 13;
         QRShape61.Top:= 13;
         QRShape62.Top:= 13;
         QRShape63.Top:= 13;
         QRShape72.Top:= 53;
         QRShape71.Top:= 73;
         QRShape73.Top:= 101;

         QRLabel71.Top:= 15;
         QRLabel68.Top:= 15;
         QRLabel72.Top:= 33;
         QRLabel67.Top:= 15;
         QRLabel27.Top:= 15;
         QRLabel26.Top:= 15;
         QRLabel24.Top:= 15;
         QRLabel25.Top:= 33;
         QRLabel17.Top:= 15;
         QRLabel18.Top:= 15;
         QRLabel19.Top:= 15;
         QRLabel20.Top:= 15;
         QRLabel21.Top:= 15;
         QRLabel23.Top:= 15;
         QRLabel22.Top:= 15;
         QRLabel28.Top:= 39;
         QRLabel63.Top:= 39;
         QRLabel64.Top:= 39;
         QRLabel65.Top:= 39;
         QRLabel66.Top:= 39;
         QRLabel70.Top:= 39;
         QRLabel69.Top:= 39;
         QRLabel74.Top:= 60;
         QRLabel75.Top:= 60;
         QRLabel76.Top:= 60;
         QRLabel77.Top:= 60;
         QRLabel78.Top:= 60;
         QRLabel82.Top:= 60;
         QRLabel81.Top:= 60;

         QRDBText36.Top:= 67;
         QRDBText54.Top:= 85;
         QRDBText51.Top:= 85;
         QRDBText52.Top:= 85;
         QRDBText53.Top:= 85;
         QRDBText55.Top:= 85;
         QRDBText56.Top:= 85;
         QRDBText38.Top:= 85;
         QRDBText37.Top:= 85;
         QRDBText39.Top:= 85;
         QRDBText40.Top:= 85;
         QRDBText41.Top:= 85;
         QRDBText43.Top:= 85;
         QRDBText42.Top:= 85;
         QRDBText44.Top:= 111;
         QRDBText45.Top:= 111;
         QRDBText46.Top:= 111;
         QRDBText47.Top:= 111;
         QRDBText48.Top:= 111;
         QRDBText50.Top:= 111;
         QRDBText49.Top:= 111;

         QRBand11.Height:=162;
      end
     else
        begin//lo hice igual que argentina
           QRShape55.Enabled:= false;
           QRShape64.Enabled:= false;
           QRShape65.Enabled:= false;
           QRShape56.Enabled:= false;
           QRShape57.Enabled:= false;
           QRShape70.Enabled:= false;
           QRShape69.Enabled:= false;
           QRShape68.Enabled:= false;
           QRShape67.Enabled:= false;
           QRShape66.Enabled:= false;
           QRShape58.Enabled:= false;
           QRShape59.Enabled:= false;
           QRShape60.Enabled:= false;
           QRShape61.Enabled:= false;
           QRShape62.Enabled:= false;
           QRShape63.Enabled:= false;
           QRShape72.Enabled:= false;
           QRShape71.Enabled:= false;
           QRShape73.Enabled:= false;

           QRLabel71.Enabled:= false;
           QRLabel68.Enabled:= false;
           QRLabel72.Enabled:= false;
           QRLabel67.Enabled:= false;
           QRLabel27.Enabled:= false;
           QRLabel26.Enabled:= false;
           QRLabel24.Enabled:= false;
           QRLabel25.Enabled:= false;
           QRLabel17.Enabled:= false;
           QRLabel18.Enabled:= false;
           QRLabel19.Enabled:= false;
           QRLabel20.Enabled:= false;
           QRLabel21.Enabled:= false;
           QRLabel23.Enabled:= false;
           QRLabel22.Enabled:= false;
           QRLabel28.Enabled:= false;
           QRLabel63.Enabled:= false;
           QRLabel64.Enabled:= false;
           QRLabel65.Enabled:= false;
           QRLabel66.Enabled:= false;
           QRLabel70.Enabled:= false;
           QRLabel69.Enabled:= false;
           QRLabel74.Enabled:= false;
           QRLabel75.Enabled:= false;
           QRLabel76.Enabled:= false;
           QRLabel77.Enabled:= false;
           QRLabel78.Enabled:= false;
           QRLabel82.Enabled:= false;
           QRLabel81.Enabled:= false;

           QRDBText36.Enabled:= false;
           QRDBText54.Enabled:= false;
           QRDBText51.Enabled:= false;
           QRDBText52.Enabled:= false;
           QRDBText53.Enabled:= false;
           QRDBText55.Enabled:= false;
           QRDBText56.Enabled:= false;
           QRDBText38.Enabled:= false;
           QRDBText37.Enabled:= false;
           QRDBText39.Enabled:= false;
           QRDBText40.Enabled:= false;
           QRDBText41.Enabled:= false;
           QRDBText43.Enabled:= false;
           QRDBText42.Enabled:= false;
           QRDBText44.Enabled:= false;
           QRDBText45.Enabled:= false;
           QRDBText46.Enabled:= false;
           QRDBText47.Enabled:= false;
           QRDBText48.Enabled:= false;
           QRDBText50.Enabled:= false;
           QRDBText49.Enabled:= false;

           QRBand11.Height:=162;

        end
end;

procedure TFREPPedigreePreview.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (StrToFloat(value) > 0) then
    Value:= '+' + Value;
end;

procedure TFREPPedigreePreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCRPedigree.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPPedigreePreview.cargarDatosPropietario;
var
  repGeneral : TFRepGeneral;
begin
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();
  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';

  QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;

  if (Trim(repGeneral.getNombrePropietario) <> '') then
    begin
      QRLRenglon1.Enabled:= false;
      QRLNombrePropietario.Enabled:= true;

      QRLRenglon13.Enabled:= false;
      QRLNombrePropietario13.Enabled:= true;

      QRLRenglon12.Enabled:= false;
      QRLNombrePropietario12.Enabled:= true;
    end
   else
     begin
       QRLRenglon2.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;

       QRLRenglon13.Enabled:= true;
       QRLNombrePropietario13.Enabled:= false;

       QRLRenglon12.Enabled:= true;
       QRLNombrePropietario12.Enabled:= false;
     end;

  if (Trim(repGeneral.getDireccionPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getDireccionPropietario + ' - ';

  if (Trim(repGeneral.getTelefonoPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getTelefonoPropietario + ' - ';

  if (Trim(repGeneral.getCelularPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getCelularPropietario + ' - ';

  if (Trim(repGeneral.getEmailPropietario) <> '') then
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getEmailPropietario + ' - ';

  if (Trim(repGeneral.getUrlPropietario) <> '') then
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getUrlPropietario + ' - ';

  if (FileExists(repGeneral.getPathImage)) then
    begin
       QRImagenEmpresa.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa13.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa12.Picture.LoadFromFile(repGeneral.getPathImage);
    end;

  QRLNombrePropietario13.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa13.Caption:= QRLEmpresa.Caption;

  QRLNombrePropietario12.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa12.Caption:= QRLEmpresa.Caption;

  QRLDatosAbajo12.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo22.Caption:= QRLDatosAbajo2.Caption;

  QRLDatosAbajo14.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo24.Caption:= QRLDatosAbajo2.Caption;

  QRLDatosAbajo12.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo22.Caption:= QRLDatosAbajo2.Caption;

  repGeneral.Destroy;
end;

procedure TFREPPedigreePreview.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if IBQHijos.FieldValues['conddistocia'] <> ' ' then
    QRDBText1.Font.Color := clRed
  else
    QRDBText1.Font.Color := clBlack;
  Application.ProcessMessages;
end;

procedure TFREPPedigreePreview.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if Value = ' ' then
    QRDBText5.Font.Color := clBlack
  else
    QRDBText5.Font.Color := clRed;
  Application.ProcessMessages;
end;

end.


