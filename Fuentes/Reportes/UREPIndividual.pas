unit UREPIndividual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, QRCtrls, jpeg,
  QuickRpt, IBQuery, UPrincipal, QRExport, QRPDFFilt, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  JvGIF;

type
  TFREPIndividual = class(TFUniversal)
    QRDatosEspecificos: TQuickRep;
    QRBand8: TQRBand;
    QRImage1: TQRImage;
    QRLabel6: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape9: TQRShape;
    QRGenealogia: TQuickRep;
    QRBand4: TQRBand;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRCRIndividual: TQRCompositeReport;
    IBQDatos: TIBQuery;
    IBQArbolGenea: TIBQuery;
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
    IBQAux: TIBQuery;
    QRImage3: TQRImage;
    QRLabel9: TQRLabel;
    IBQArbolGeneaRELACION: TIBStringField;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabelTituloEstadoActual: TQRLabel;
    LabelPesoNacer: TQRLabel;
    LabelPesoDestete: TQRLabel;
    LabelCircunfEscrotal: TQRLabel;
    LabelCapacidadServicio: TQRLabel;
    QRShape10: TQRShape;
    LabelCantMachos: TQRLabel;
    LabelCantHembras: TQRLabel;
    LabelTotalDistocias: TQRLabel;
    LabelFechaNacimiento: TQRLabel;
    LabelEstadoLactacion: TQRLabel;
    LabelFechaAlPrimerParto: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    LF: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBTRp: TQRDBText;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRBand2: TQRBand;
    QRShape7: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape8: TQRShape;
    Succ1: TQRShape;
    P1ucc: TQRMemo;
    P1: TQRLabel;
    Succ2: TQRShape;
    P2ucc: TQRMemo;
    P2: TQRLabel;
    Succ3: TQRShape;
    P3ucc: TQRMemo;
    P3: TQRLabel;
    Succ4: TQRShape;
    P4ucc: TQRMemo;
    P4: TQRLabel;
    P5: TQRLabel;
    P5ucc: TQRMemo;
    Succ5: TQRShape;
    P6ucc: TQRMemo;
    P6: TQRLabel;
    Succ6: TQRShape;
    SuccM: TQRShape;
    Mucc: TQRMemo;
    Ma: TQRLabel;
    Aucc: TQRMemo;
    LVert: TQRShape;
    LHor: TQRShape;
    QRShape20: TQRShape;
    QRLNom: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRGenealogiaCompleta: TQuickRep;
    QRBand5: TQRBand;
    LabelLinea1: TQRDBText;
    LabelCategoriaPadre: TQRLabel;
    labelLinea2: TQRDBText;
    labelLinea3: TQRDBText;
    QRSPadres: TQRShape;
    QRSAbuelos: TQRShape;
    QRSBisAbuelos: TQRShape;
    QRSHorizontal: TQRShape;
    QRBand3: TQRBand;
    QRShape3: TQRShape;
    QRLabel26: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel27: TQRLabel;
    QRBand9: TQRBand;
    QRSysData4: TQRSysData;
    QRLRenglon3: TQRLabel;
    QRLEstablecimiento1: TQRLabel;
    QRImage2: TQRImage;
    QRShape27: TQRShape;
    QRImage4: TQRImage;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    IBQArbolGenea3: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IntegerField2: TIntegerField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IBStringField11: TIBStringField;
    QRLabel11: TQRLabel;
    QRDep: TQuickRep;
    QRBand6: TQRBand;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel14: TQRLabel;
    QRBand7: TQRBand;
    QRShape13: TQRShape;
    QRLabel15: TQRLabel;
    QRShape17: TQRShape;
    QRShape5: TQRShape;
    QRShape11: TQRShape;
    QRShape22: TQRShape;
    QRShape12: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape14: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape19: TQRShape;
    QRShape18: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape33: TQRShape;
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
    QRShape34: TQRShape;
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
    QRShape35: TQRShape;
    QRDBText21: TQRDBText;
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
    QRBand10: TQRBand;
    QRShape15: TQRShape;
    QRLabel23: TQRLabel;
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
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRShape66: TQRShape;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRDBText72: TQRDBText;
    QRLabel89: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel90: TQRLabel;
    banda: TQRBand;
    QRShape108: TQRShape;
    Linea3: TQRLabel;
    LabelGenealogia: TQRLabel;
    QRShape16: TQRShape;
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
    IP: TQRImage;
    IM: TQRImage;
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
    ImSexo: TImageList;
    IBQDatosNOMBRE: TIBStringField;
    IBQDatosRP: TIBStringField;
    IBQDatosTIPO_RP: TIBStringField;
    IBQDatosFECHA_NACIMIENTO: TDateField;
    IBQDatosEDAD_MADRE: TIntegerField;
    IBQDatosPESO_NAC: TIBBCDField;
    IBQDatosPESO_DEST: TIBBCDField;
    IBQDatosPESO_ANIO: TIBBCDField;
    IBQDatosPESO_ADULTO: TIBBCDField;
    IBQDatosPESO_ACTUAL: TIBBCDField;
    IBQDatosFECHA_PESO: TDateField;
    IBQDatosCIRC_ESC: TIBBCDField;
    IBQDatosFECHA_MED_CIR_ESC: TDateField;
    IBQDatosCAP_SERV: TIBStringField;
    IBQDatosFECHA_MED_CAP_SERV: TDateField;
    IBQDatosEDAD_MED: TIntegerField;
    IBQDatosALZADA: TIBBCDField;
    IBQDatosFECHA_MED_ALZADA: TDateField;
    IBQDatosFRAME: TIBBCDField;
    IBQDatosFECHA_MED_FRAME: TDateField;
    IBQDatosGDPV_DESTETE: TIBBCDField;
    IBQDatosGDPV_ANIO: TIBBCDField;
    IBQDatosGDPV_ADULTO: TIBBCDField;
    IBQDatosGDPV_ULTIMA: TIBBCDField;
    QRLabel91: TQRLabel;
    QRLInspeccion: TQRLabel;
    QRLDestino: TQRLabel;
    QRLInspeccionV: TQRLabel;
    QRLDestinoV: TQRLabel;
    QRLRegistro: TQRLabel;
    IBQDatosRAZA: TIntegerField;
    IBQDatosINSPECCION: TIBStringField;
    IBQDatosDESTINO: TIBStringField;
    IBQDatosREGISTRO: TIBStringField;
    procedure QRCRIndividualAddReports(Sender: TObject);
    procedure LabelLinea1Print(sender: TObject;  var Value: String);
    procedure labelLinea2Print(sender: TObject; var Value: String);
    procedure labelLinea3Print(sender: TObject; var Value: String);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PonerMeses(sender: TObject; var Value: String);
    procedure PonerPesos(sender: TObject; var Value: String);
    procedure PonerCentimetros(sender: TObject; var Value: String);
    procedure PonerFecha(sender: TObject; var Value: String);
    procedure QRDBText20Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
  private
    function retornarCategoriaPadre: string;
    procedure retornarAlternativo(id: integer; externo: boolean; var identif, value: string);
    procedure generarLabel(x: integer; texto: string; flag:integer);
    function retornarRaza(raza: integer): string;
    //procedure armarArbol(animal : integer);
    procedure armarArbolUCC(animal : integer);

    procedure PrimerNodo(id_animal : integer);
  public
    ID_Animal : integer;
    Externo : Boolean;
    tiene_deps: Boolean;
    procedure armarArbol();
    procedure prepararReporte(id_animal: integer; establecimiento : integer);
    procedure SetDataSet(DS : TIBQuery);
  end;

var
  FREPIndividual: TFREPIndividual;

implementation

Uses URepFichaAnimal, UTraduccion,uTiposGlobales;

{$R *.dfm}

procedure TFREPIndividual.SetDataSet(DS : TIBQuery);
begin
  QRDep.DataSet := DS;
  //DEPs Argentina
  QRDBText21.DataSet := DS;
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
  QRDBText72.DataSet := DS;
  //DEPs Uruguay
  QRDBText51.DataSet := DS;
  QRDBText52.DataSet := DS;
  QRDBText53.DataSet := DS;
  QRDBText54.DataSet := DS;
  QRDBText55.DataSet := DS;
  QRDBText56.DataSet := DS;
  QRDBText57.DataSet := DS;
  QRDBText58.DataSet := DS;
  QRDBText59.DataSet := DS;
  QRDBText60.DataSet := DS;
  QRDBText61.DataSet := DS;
  QRDBText62.DataSet := DS;
  QRDBText63.DataSet := DS;
  QRDBText64.DataSet := DS;
  QRDBText65.DataSet := DS;
  QRDBText66.DataSet := DS;
  QRDBText67.DataSet := DS;
  QRDBText68.DataSet := DS;
  QRDBText69.DataSet := DS;
  QRDBText70.DataSet := DS;
  QRDBText71.DataSet := DS;
  QRDBText73.DataSet := DS;
end;

procedure TFREPIndividual.armarArbolUCC(animal : integer);
var
  cantP : integer;
  alter, valor : string;
  externo : boolean;
begin
  IBQArbolGenea.Active := false;
  IBQArbolGenea.ParamByName('n').AsInteger := animal;
  IBQArbolGenea.ParamByName('EXT').AsString := 'N';
  IBQArbolGenea.Active := true;
  CantP := 1;
  IBQArbolGenea.First;

  if IBQArbolGenea.FieldByName('relacion').AsString= 'M' then CantP := 0;

  while (not IBQArbolGenea.Eof) and (IBQArbolGenea.FieldByName('relacion').AsString = 'P')do
  begin
    externo := IBQArbolGenea.FieldByName('externo').AsString = 'S';
    case CantP of
      1 : begin
            P1.Enabled := true;
            P1ucc.Enabled := true;
            Succ1.Enabled := true;
            retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
            P1ucc.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
            P1ucc.Lines.Add('  '+alter+' '+valor);
            P1ucc.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
          end;
      2 : begin
            P2.Enabled := true;
            P2ucc.Enabled := true;
            Succ2.Enabled := true;
            retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
            P2ucc.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
            P2ucc.Lines.Add('  '+alter+' '+valor);
            P2ucc.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
          end;
      3 : begin
            P3.Enabled := true;
            P3ucc.Enabled := true;
            Succ3.Enabled := true;
            retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
            P3ucc.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
            P3ucc.Lines.Add('  '+alter+' '+valor);
            P3ucc.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
          end;
      4 : begin
            P4.Enabled := true;
            P4ucc.Enabled := true;
            Succ4.Enabled := true;
            retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
            P4ucc.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
            P4ucc.Lines.Add('  '+alter+' '+valor);
            P4ucc.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
          end;
      5 : begin
            P5.Enabled := true;
            P5ucc.Enabled := true;
            Succ5.Enabled := true;
            retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
            P5ucc.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
            P5ucc.Lines.Add('  '+alter+' '+valor);
            P5ucc.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
          end;
      6 : begin
            P6.Enabled := true;
            P6ucc.Enabled := true;
            Succ6.Enabled := true;
            retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
            P6ucc.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
            P6ucc.Lines.Add('  '+alter+' '+valor);
            P6ucc.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
          end;
    end;
    Inc(CantP);
    alter := '';
    valor := '';
    IBQArbolGenea.Next;
  end;
  if CantP=0 then
  begin
    P1.Enabled := true;
    P1ucc.Enabled := true;
    Succ1.Enabled := true;
    retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
    P1ucc.Lines.Add('  RP: DESCONOCIDO');
    P1ucc.Lines.Add(' ');
    P1ucc.Lines.Add(' Raza: ');
  end;
  
  CantP := CantP-1;
  if (CantP > 4) then
      begin
        SuccM.Top := 333;
        Mucc.Top := 340;
        Ma.Top := 321;
        LVert.Height := 259;
        LHor.Top := 357;
      end
      else if (CantP > 2) then
           begin
              SuccM.Top := 261;
              Mucc.Top := 268;
              Ma.Top := 248;
              LVert.Height := 186;
              LHor.Top := 284;
           end
           else
           begin
              SuccM.Top := 189;
              Mucc.Top := 196;
              Ma.Top := 176;
              LVert.Height := 114;
              LHor.Top := 212;
           end;

  if IBQArbolGenea.Eof then
  begin
    Ma.Enabled := true;
    Mucc.Enabled := true;
    SuccM.Enabled := true;
    Mucc.Lines.Add('  RP: DESCONOCIDO');
    Mucc.Lines.Add('  ');
    Mucc.Lines.Add('  Raza: ');
  end;
  while not IBQArbolGenea.Eof do
  begin
    if IBQArbolGenea.FieldByName('relacion').AsString = 'M' then
    begin
      Ma.Enabled := true;
      Mucc.Enabled := true;
      SuccM.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      Mucc.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      Mucc.Lines.Add('  '+alter+' '+valor);
      Mucc.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
    end;
  alter := '';
  valor := '';
  IBQArbolGenea.Next;
  end;
end;

{procedure TFREPIndividual.armarArbol(animal : integer);
var alter:string;
    valor:string;
    externo:boolean;
begin
  IBQArbolGenea.Active := false;
  IBQArbolGenea.ParamByName('n').AsInteger := animal;
  IBQArbolGenea.Active := true;

  IBQArbolGenea.First;
  while not IBQArbolGenea.Eof do
  begin
    externo := IBQArbolGenea.FieldByName('externo').AsString = 'S';

    if IBQArbolGenea.FieldByName('relacion').AsString = 'P' then
    begin
      P.Enabled := true;
      NomP.Enabled := true;
      InfP.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfP.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfP.Lines.Add('  '+alter+' '+valor);
      InfP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVP.Enabled := true;
      LHP.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'M' then
    begin
      M.Enabled := true;
      NomM.Enabled := true;
      InfM.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfM.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfM.Lines.Add('  '+alter+' '+valor);
      InfM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVM.Enabled := true;
      LHM.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PP' then
    begin
      PP.Enabled := true;
      NomPP.Enabled := true;
      InfPP.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPP.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfPP.Lines.Add('  '+alter+' '+valor);
      InfPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVPP.Enabled := true;
      LHPP.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PM' then
    begin
      PM.Enabled := true;
      NomPM.Enabled := true;
      InfPM.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPM.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfPM.Lines.Add('  '+alter+' '+valor);
      InfPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVPM.Enabled := true;
      LHPM.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MP' then
    begin
      MP.Enabled := true;
      NomMP.Enabled := true;
      InfMP.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMP.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfMP.Lines.Add('  '+alter+' '+valor);
      InfMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVMP.Enabled := true;
      LHMP.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MM' then
    begin
      MM.Enabled := true;
      NomMM.Enabled := true;
      InfMM.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMM.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfMM.Lines.Add('  '+alter+' '+valor);
      InfMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVMM.Enabled := true;
      LHMM.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PPP' then
    begin
      PPP.Enabled := true;
      NomPPP.Enabled := true;
      InfPPP.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPP.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfPPP.Lines.Add('  '+alter+' '+valor);
      InfPPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVPPP.Enabled := true;
      LHPPP.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PPM' then
    begin
      PPM.Enabled := true;
      NomPPM.Enabled := true;
      InfPPM.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPM.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfPPM.Lines.Add('  '+alter+' '+valor);
      InfPPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVPPM.Enabled := true;
      LHPPM.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PMP' then
    begin
      PMP.Enabled := true;
      NomPMP.Enabled := true;
      InfPMP.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMP.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfPMP.Lines.Add('  '+alter+' '+valor);
      InfPMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVPMP.Enabled := true;
      LHPMP.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PMM' then
    begin
      PMM.Enabled := true;
      NomPMM.Enabled := true;
      InfPMM.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMM.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfPMM.Lines.Add('  '+alter+' '+valor);
      InfPMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVPMM.Enabled := true;
      LHPMM.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MPP' then
    begin
      MPP.Enabled := true;
      NomMPP.Enabled := true;
      InfMPP.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPP.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfMPP.Lines.Add('  '+alter+' '+valor);
      InfMPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVMPP.Enabled := true;
      LHMPP.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MPM' then
    begin
      MPM.Enabled := true;
      NomMPM.Enabled := true;
      InfMPM.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPM.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfMPM.Lines.Add('  '+alter+' '+valor);
      InfMPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVMPM.Enabled := true;
      LHMPM.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MMP' then
    begin
      MMP.Enabled := true;
      NomMMP.Enabled := true;
      InfMMP.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMP.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfMMP.Lines.Add('  '+alter+' '+valor);
      InfMMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVMMP.Enabled := true;
      LHMMP.Enabled := true;
    end;
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MMM' then
    begin
      MMM.Enabled := true;
      NomMMM.Enabled := true;
      InfMMM.Enabled := true;
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMM.Lines.Add('  RP: '+IBQArbolGenea.fieldByName('id_rp').AsString+ '  '+IBQArbolGenea.fieldByName('nombre').AsString);
      InfMMM.Lines.Add('  '+alter+' '+valor);
      InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea.fieldbyName('raza').AsInteger));
      LVMMM.Enabled := true;
      LHMMM.Enabled := true;
    end;
    alter := '';
    valor := '';
    IBQArbolGenea.Next;
  end;

end;
 }
procedure TFREPIndividual.prepararReporte(id_animal: integer; establecimiento : integer);
var alter:string;
    valor,nom,rp:string;
begin
  IBQDatos.Close;
  IBQDatos.ParamByName('animal').AsInteger := id_animal;
  IBQDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatos.Open;

  QRLInspeccion.Enabled := (IBQDatos.FieldByName('raza').AsInteger = 10) or (IBQDatos.FieldByName('raza').AsInteger = 11) or
                           (IBQDatos.FieldByName('raza').AsInteger = 12) or (IBQDatos.FieldByName('raza').AsInteger = 28);
  QRLInspeccionV.Enabled := (IBQDatos.FieldByName('raza').AsInteger = 10) or (IBQDatos.FieldByName('raza').AsInteger = 11) or
                           (IBQDatos.FieldByName('raza').AsInteger = 12) or (IBQDatos.FieldByName('raza').AsInteger = 28);
  QRLDestino.Enabled := (IBQDatos.FieldByName('raza').AsInteger = 10) or (IBQDatos.FieldByName('raza').AsInteger = 11) or
                           (IBQDatos.FieldByName('raza').AsInteger = 12) or (IBQDatos.FieldByName('raza').AsInteger = 28);
  QRLDestinoV.Enabled := (IBQDatos.FieldByName('raza').AsInteger = 10) or (IBQDatos.FieldByName('raza').AsInteger = 11) or
                           (IBQDatos.FieldByName('raza').AsInteger = 12) or (IBQDatos.FieldByName('raza').AsInteger = 28);

  QRLRegistro.Caption := '';
  QRLDestinoV.Caption := '';
  QRLInspeccionV.Caption := '';
  if IBQDatos.FieldValues['INSPECCION'] <> null then
    QRLInspeccionV.Caption := IBQDatos.FieldValues['INSPECCION'];
  if IBQDatos.FieldValues['INSPECCION'] <> null then
    QRLDestinoV.Caption := IBQDatos.FieldValues['DESTINO'];
  if IBQDatos.FieldValues['REGISTRO'] <> null then
    QRLRegistro.Caption := IBQDatos.FieldValues['REGISTRO'];

  QRLNom.Enabled := IBQDatos.FieldByName('nombre').Value <> null;
  if IBQDatos.FieldByName('tipo_rp').AsString = 'RP:' then
      QRDBTRp.Left := 52
  else
    QRDBTRp.Left := 120;

  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.Add('select A.*, CS.tipo from tab_animales A join cod_sexos CS on A.sexo = CS.id_Sexo where id_animal = :n');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;

  if IBQAux.FieldByName('tipo').AsInteger = 1 then
    ImSexo.GetBitmap(0,IAnimal.Picture.Bitmap)
  else
    ImSexo.GetBitmap(1,IAnimal.Picture.Bitmap);


 { IBQArbolGenea.Active := false;
  IBQArbolGenea.ParamByName('n').AsInteger := id_animal;
  IBQArbolGenea.Active := true;   }
  
  //armarArbol(id_animal);

  // Imprimo el primer nodo
  armarArbolUCC(id_animal);
  alter := ' ';
  valor := ' ';
  retornarAlternativo(id_animal,false, alter, valor);

  rp := IBQAux.fieldByName('id_rp').AsString;
  nom := IBQAux.fieldByName('nombre').AsString;

  if (nom=rp) then nom:=' ';

  Aucc.Lines.Add(Traducir('  RP: ')+ rp+ '  '+ nom);
  Aucc.Lines.Add('  '+alter+' '+valor);
  Aucc.Lines.Add(Traducir('  Raza: ')+retornarRaza(IBQAux.fieldbyName('raza').AsInteger));


  retornarAlternativo(id_animal,false, alter, valor);
  linea1.Caption := Traducir('  RP: ')+IBQAux.fieldByName('id_rp').AsString + '  '+ IBQAux.fieldByName('nombre').AsString;
  linea2.Caption := '  '+alter+' '+valor;
  linea3.Caption := Traducir('  Raza: ')+retornarRaza(IBQAux.fieldbyName('raza').AsInteger);

  if length(nom)>21 then
    begin
    QRDBText1.Font.Size:=13;
    end;
end;


procedure TFREPIndividual.QRCRIndividualAddReports(Sender: TObject);
begin
  inherited;
  QRCRIndividual.Reports.Clear;
  QRCRIndividual.Reports.Add(QRDatosEspecificos);
  if (tiene_deps) then
    begin
      QRCRIndividual.Reports.Add(QRDep);
      QRCRIndividual.Reports.Add(QRGenealogiaCompleta);
    end
   else
    QRCRIndividual.Reports.Add(QRGenealogia);
end;

procedure TFREPIndividual.LabelLinea1Print(sender: TObject;  var Value: String);
begin
  inherited;
  LabelCategoriaPadre.Caption := retornarCategoriaPadre;
  Value := '  RP: '+Value +  ' : '+IBQArbolGenea.fieldByname('nombre').AsString;
end;

function TFREPIndividual.retornarCategoriaPadre: string;
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

procedure TFREPIndividual.retornarAlternativo(id: integer;
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
  if ((IBQAux.fieldbyname('id_hba').AsString <> '') and (IBQAux.fieldbyname('id_hba').Value <> null)) then
    begin
      identif := FPrincipal.PaisHerdBook+': ';
      //identif := 'HBA: ';
      value := IBQAux.fieldbyname('id_hba').AsString;
    end
  else
    if (IBQAux.fieldbyname('id_pc').AsString <> '') and (IBQAux.fieldbyname('id_pc').Value <> null) then
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
      if (IBQAux.fieldbyname('id_ra').AsString <> '') and (IBQAux.fieldbyname('id_ra').Value <> null) then
        begin
          case rz of
            11 : identif := 'UBB: ';
          end;
          value := IBQAux.fieldbyname('id_ra').AsString;
        end
      else
        if (IBQAux.fieldbyname('id_senasa').AsString <> '') and (IBQAux.fieldbyname('id_senasa').Value <> null) then
          begin
            identif := FPrincipal.PaisNombreCaravana+': ';
            //identif := 'Senasa: ';
            value := IBQAux.fieldbyname('id_senasa').AsString;
          end
        else
          begin
            identif := ' ';
            value := ' ';
          end;
end;

procedure TFREPIndividual.generarLabel(x: integer; texto: string; flag:integer);
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

procedure TFREPIndividual.labelLinea2Print(sender: TObject; var Value: String);
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

function TFREPIndividual.retornarRaza(raza: integer): string;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.add('select nombre from cod_razas where (id_raza = :n)');
  IBQAux.ParamByName('n').AsInteger := raza;
  IBQAux.Active := true;
  result := IBQAux.fieldByName('nombre').AsString;
end;

procedure TFREPIndividual.labelLinea3Print(sender: TObject; var Value: String);
begin
  inherited;
  Value := '  Raza: '+retornarRaza(StrToInt(Value));
end;

procedure TFREPIndividual.QRBand5BeforePrint(Sender: TQRCustomBand;
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

procedure TFREPIndividual.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage4.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  //QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Top:= 5;
  QRLEstablecimiento1.Top:= 5;
  QRLRenglon1.Top:= 25;
  QRLRenglon3.Top:= 25;
  QRSysData3.Top:= 45;
  QRSysData4.Top:= 45;
  QRLabel2.Enabled:= false;
  QRLabel9.Enabled:= false;
  QRLabel32.Enabled:= false;
  QRLabel33.Enabled:= false;
  QRLabel6.Top:= 60;
  QRLabel11.Top:= 60;
  QRBand8.Height:= 91;
  QRBand9.Height:= 91;

  {$IFDEF UCC}
    QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
    QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
    QRLEstablecimientos.Top:= 89;
    QRLEstablecimiento1.Top:= 89;
    QRLRenglon1.Top:= 109;
    QRLRenglon3.Top:= 109;
    QRSysData3.Top:= 126;
    QRSysData4.Top:= 126;
    QRLabel2.Enabled:= true;
    QRLabel9.Enabled:= true;
    QRLabel32.Enabled:= true;
    QRLabel33.Enabled:= true;
    QRLabel6.Top:= 103;
    QRLabel11.Top:= 103;
    QRBand8.Height:= 147;
    QRBand9.Height:= 147;    

    //QRImage4.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
  {$ENDIF}
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimiento1.Caption := FPrincipal.NombreEstablecimiento;
  //QRLEstablecimiento2.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      //*QRLRenglon2.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon3.Caption := FPrincipal.NombreVeterinario;
    end
  else
    begin
      //QRLRenglon2.Caption := FPrincipal.NombrePropietario;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon3.Caption := FPrincipal.NombrePropietario;
    end;
end;

procedure TFREPIndividual.PonerMeses(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := 'Edad: '+Value+' meses';
end;

procedure TFREPIndividual.PonerPesos(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' Kgs.';
end;

procedure TFREPIndividual.PonerCentimetros(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' cm.';
end;

procedure TFREPIndividual.PonerFecha(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := 'Fecha: '+Value;
end;

procedure TFREPIndividual.QRDBText20Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (StrToInt(Value)>36) then
    begin
      Value:= IntToStr(trunc(StrToInt(Value)/12));
      Value := Value+' años';
    end
  else
    Value := Value+' meses';
end;


procedure TFREPIndividual.PrimerNodo(id_animal : integer);
var
  alter, valor : string;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.Add('select A.*, CS.tipo from tab_animales A join cod_sexos CS on A.sexo = CS.id_Sexo where id_animal = :n');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;

  if IBQAux.FieldByName('tipo').AsInteger = 1 then
    ImSexo.GetBitmap(0,IAnimal.Picture.Bitmap)
  else
    ImSexo.GetBitmap(1,IAnimal.Picture.Bitmap);

  retornarAlternativo(id_animal, Externo, alter, valor);
  if (IBQAux.fieldByName('nombre').AsString = IBQAux.fieldByName('id_rp').AsString) then
    linea1.Caption := Traducir('  RP: ')+IBQAux.fieldByName('id_rp').AsString
  else
    linea1.Caption := Traducir('  RP: ')+IBQAux.fieldByName('id_rp').AsString+' - '+IBQAux.fieldByName('nombre').AsString;
  linea1.Caption := linea1.Caption+' - '+alter+' '+valor;
 { if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
    linea3.Caption := '  Raza: '+retornarRaza(IBQAux.fieldbyName('raza').AsInteger)
   else
     linea3.Caption := '';}
end;

procedure TFREPIndividual.armarArbol();
var alter:string;
    valor:string;
    externo:boolean;
begin
  PrimerNodo(id_animal);

  IBQArbolGenea3.Active := false;
  IBQArbolGenea3.ParamByName('n').AsInteger := id_animal;
  IBQArbolGenea3.ParamByName('EXT').AsString := 'N';
  IBQArbolGenea3.Active := true;

  IBQArbolGenea3.First;
  while not IBQArbolGenea3.Eof do
  begin
    externo := IBQArbolGenea3.FieldByName('externo').AsString = 'S';

    if IBQArbolGenea3.FieldByName('relacion').AsString = 'P' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'M' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfM.Lines.Append('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PPP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PPM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PMP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PMM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfPMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MPP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMPP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MPM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMPM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MMP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMP.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MMM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;


    ///////////////

    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PPPP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPPP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PPPM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPPM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PPMP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPMP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPPMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PPMM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPPMM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPPMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PMPP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMPP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PMPM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMPM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PMMP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMMP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IPMMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'PMMM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfPMMM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IPMMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MPPP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPPP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MPPM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPPM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MPMP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPMP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMPMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MPMM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMPMM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMPMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MMPP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMPP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMPP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MMPM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMPM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMPM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MMMP' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMMP.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(0,IMMMP.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;
    if IBQArbolGenea3.FieldByName('relacion').AsString = 'MMMM' then
    begin
      retornarAlternativo(IBQArbolGenea3.FieldByName('id_animal').AsInteger,externo, alter, valor);
      InfMMMM.Lines[0] := '  RP: '+IBQArbolGenea3.fieldByName('id_rp').AsString+' - '+IBQArbolGenea3.fieldByName('nombre').AsString+' - '+alter+' '+valor;
      ImSexo.GetBitmap(1,IMMMM.Picture.Bitmap)
      {if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
        InfMMM.Lines.Add('  Raza: '+retornarRaza(IBQArbolGenea3.fieldbyName('raza').AsInteger));}
    end;

    //////////////
    IBQArbolGenea3.Next;
  end;

end;


procedure TFREPIndividual.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (StrToFloat(value) > 0) then
    Value:= '+' + Value;
end;

end.
