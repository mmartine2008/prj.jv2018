unit UREPProduccionExternosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, QuickRpt, QRCtrls,
  jpeg, UPrincipal, IBQuery, QRExport, QRPDFFilt, QRPrntr, ImgList,
  JvExControls, JvLabel, JvGIF, PngImageList, pngimage, JvExExtCtrls,
  JvImage, Grids, DBGrids;

type
  TRegDestinos = record
    cant : Integer;
    dest : Integer;
  end;
  TFREPProduccionExternosPreview = class(TFUniversal)
    QuickRep1: TQuickRep;
    QRBand7: TQRBand;
    QRImage1: TQRImage;
    QRLabel61: TQRLabel;
    QRBand8: TQRBand;
    QRShape7: TQRShape;
    QRLabel65: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel66: TQRLabel;
    t: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    IBQREPProdAnimalExterno: TIBQuery;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLTotal: TQRLabel;
    QRLTotalM: TQRLabel;
    QRLTotalH: TQRLabel;
    QRLTotalD: TQRLabel;
    QRLPNac: TQRLabel;
    QRLPDes: TQRLabel;
    QRLPAnio: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText14: TQRDBText;
    QRGenealogia: TQuickRep;
    QRBand5: TQRBand;
    LabelLinea1: TQRDBText;
    LabelCategoriaPadre: TQRLabel;
    labelLinea2: TQRDBText;
    labelLinea3: TQRDBText;
    QRSPadres: TQRShape;
    QRSAbuelos: TQRShape;
    QRSBisAbuelos: TQRShape;
    QRSHorizontal: TQRShape;
    QRBand2: TQRBand;
    QRShape23: TQRShape;
    QRLabel26: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel27: TQRLabel;
    QRBand9: TQRBand;
    QRLabel28: TQRLabel;
    QRImage4: TQRImage;
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
    IBQArbolGeneaRELACION: TIBStringField;
    IBQAux: TIBQuery;
    QRCRProduccion: TQRCompositeReport;
    QRDep: TQuickRep;
    QRBand6: TQRBand;
    QRShape24: TQRShape;
    QRLabel29: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel30: TQRLabel;
    QRBand10: TQRBand;
    QRShape25: TQRShape;
    QRLabel31: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape44: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape45: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape46: TQRShape;
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
    QRBand11: TQRBand;
    QRShape47: TQRShape;
    QRLabel75: TQRLabel;
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
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
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
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
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
    QRProduccionExternos: TQuickRep;
    QRBand12: TQRBand;
    QRImage5: TQRImage;
    QRLabel105: TQRLabel;
    QRBand13: TQRBand;
    QRShape50: TQRShape;
    QRLabel111: TQRLabel;
    QRSysData7: TQRSysData;
    QRLabel112: TQRLabel;
    QRBand15: TQRBand;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRShape54: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRDBText76: TQRDBText;
    QRShape4: TQRShape;
    QRSysData11: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa6: TQRLabel;
    QRLNombrePropietario6: TQRLabel;
    QRLRenglon6: TQRLabel;
    QRLRenglon5: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRImagenEmpresa6: TQRImage;
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape6: TQRShape;
    QRSysData3: TQRSysData;
    QRLEmpresa4: TQRLabel;
    QRLNombrePropietario4: TQRLabel;
    QRLRenglon4: TQRLabel;
    QRLRenglon3: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRImagenEmpresa4: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRLDatosAbajo145: TQRLabel;
    QRLDatosAbajo255: TQRLabel;
    QRLDatosAbajo16: TQRLabel;
    QRLDatosAbajo26: TQRLabel;
    QRLDatosAbajo14: TQRLabel;
    QRLDatosAbajo24: TQRLabel;
    banda: TQRBand;
    QRShape108: TQRShape;
    Linea3: TQRLabel;
    LabelGenealogia: TQRLabel;
    QRShape8: TQRShape;
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
    QRShape9: TQRShape;
    QRShape10: TQRShape;
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
    QRLabel6: TQRLabel;
    QRShape22: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape26: TQRShape;
    QRLCantAp: TQRLabel;
    QRLCantRe: TQRLabel;
    QRLCantReins: TQRLabel;
    QRLPorAp: TQRLabel;
    QRLPorRe: TQRLabel;
    QRLPorReins: TQRLabel;
    QRLDestino1: TQRLabel;
    QRLD1: TQRLabel;
    QRLDestino2: TQRLabel;
    QRLD2: TQRLabel;
    QRLDestino4: TQRLabel;
    QRLD4: TQRLabel;
    QRLDestino5: TQRLabel;
    QRLD5: TQRLabel;
    QRLDestino3: TQRLabel;
    QRLD3: TQRLabel;
    QRLabel9: TQRLabel;
    IBQREPProdAnimalExternoRP_HIJO: TIBStringField;
    IBQREPProdAnimalExternoFECHA_NACIMIENTO: TDateField;
    IBQREPProdAnimalExternoSEXO: TIBStringField;
    IBQREPProdAnimalExternoRP_MADRE: TIBStringField;
    IBQREPProdAnimalExternoCOND_DISTOCIA: TIBStringField;
    IBQREPProdAnimalExternoPESO_NAC: TIBBCDField;
    IBQREPProdAnimalExternoPESO_DEST: TIBBCDField;
    IBQREPProdAnimalExternoPESO_ANIO: TIBBCDField;
    IBQREPProdAnimalExternoID_SEXO: TIntegerField;
    IBQREPProdAnimalExternoTIPO_PARTO: TIntegerField;
    IBQREPProdAnimalExternoEDAD_MADRE: TIntegerField;
    IBQREPProdAnimalExternoINSPECCION: TIntegerField;
    IBQREPProdAnimalExternoDESTINO: TIntegerField;
    QRBand14: TQRBand;
    QRLabel116: TQRLabel;
    QRShape51: TQRShape;
    QRBand16: TQRBand;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRLabel142: TQRLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure IBQREPProdAnimalExternoAfterOpen(DataSet: TDataSet);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRCRProduccionAddReports(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QRBand15BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure retornarAlternativo(id: integer; externo: boolean; var identif, value: string);
    function retornarRaza(raza: integer): string;
    procedure PrimerNodo(id_animal : integer);
    procedure cargarDatosPropietario();
  protected
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
  public
    ID_Animal : integer;
    _Externo : Boolean;
    tiene_deps: Boolean;    
    procedure armarArbol();
  end;

var
  FREPProduccionExternosPreview: TFREPProduccionExternosPreview;

implementation

uses UREPProduccionExternos, URepGeneral, UDMSoftvet, UTraduccion,UTiposGlobales;

{$R *.dfm}

procedure TFREPProduccionExternosPreview.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
{  QRLEstablecimiento.Top:= 8;
  QRLRenglon1.Top:= 26;
  QRLRenglon2.Top:= 44;
  QRSysData1.Top:= 62;
  QRLabel24.Enabled:= false;
  QRLabel25.Enabled:= false;
  QRLabel61.Top:= 48;
  QRBand7.Height:= 91;    }

  QRImage4.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
{  QRLEstablecimiento1.Top:= 8;
  QRLRenglon3.Top:= 26;
  QRLRenglon4.Top:= 44;
  QRSysData3.Top:= 62;
  QRLabel32.Enabled:= false;
  QRLabel33.Enabled:= false;
  QRLabel28.Top:= 48;
  QRBand9.Height:= 91;  }


  QRImage5.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
{  QRLEstablecimiento2.Top:= 8;
  QRLRenglon5.Top:= 26;
  QRLRenglon6.Top:= 44;
  QRSysData3.Top:= 62;
  QRLabel108.Enabled:= false;
  QRLabel109.Enabled:= false;
  QRLabel105.Top:= 48;
  QRBand12.Height:= 91; }

//  {$IFDEF UCC}
//    QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
{    QRLEstablecimiento.Top:= 89;
    QRLRenglon1.Top:= 107;
    QRLRenglon2.Top:= 125;
    QRSysData1.Top:= 143;
    QRLabel24.Enabled:= true;
    QRLabel25.Enabled:= true;
    QRLabel61.Top:= 126;
    QRBand7.Height:= 169;  }

//    QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
{    QRLEstablecimiento1.Top:= 89;
    QRLRenglon3.Top:= 107;
    QRLRenglon4.Top:= 125;
    QRSysData3.Top:= 143;
    QRLabel32.Enabled:= true;
    QRLabel33.Enabled:= true;
    QRLabel28.Top:= 126;
    QRBand9.Height:= 169; }

//    QRImage6.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
{    QRLEstablecimiento2.Top:= 89;
    QRLRenglon5.Top:= 107;
    QRLRenglon6.Top:= 125;
    QRSysData6.Top:= 143;
    QRLabel108.Enabled:= true;
    QRLabel109.Enabled:= true;
    QRLabel105.Top:= 126;
    QRBand12.Height:= 169;  }

    //QRImage4.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
//  {$ENDIF}

//  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
//  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;
//  QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;

    QRLRenglon2.Enabled := true;
    QRLRenglon4.Enabled := true;
    QRLRenglon6.Enabled := true;

  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon3.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon5.Caption := FPrincipal.NombreVeterinario;
    end
  else
    begin
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon3.Caption := FPrincipal.NombrePropietario;
      QRLRenglon5.Caption := FPrincipal.NombreVeterinario;
    end;

  cargarDatosPropietario();
end;

procedure TFREPProduccionExternosPreview.IBQREPProdAnimalExternoAfterOpen(
  DataSet: TDataSet);
var
  total_p_nac, total_p_des, total_p_anio, ind, k : integer;
  total, totalm, totalh, totald, total_ia, total_ir, total_ire, total_ins : integer;
  prom_nac, prom_des, prom_anio : real;
  destinos : Array of TRegDestinos;
  cant : TRegDestinos;
begin
  inherited;
  total := 0;
  totalm := 0;
  totalh := 0;
  totald := 0;
  prom_nac := 0;
  prom_des := 0;
  prom_anio := 0;
  total_p_nac := 0;
  total_p_des := 0;
  total_p_anio := 0;
  total_ia := 0;
  total_ir := 0;
  total_ire := 0;
  total_ins := 0;
  DataSet.First;
  while not DataSet.Eof do
  begin
    Inc(total);
    if DataSet.FieldByName('sexo').AsString = 'MACHO' then
      Inc(totalm)
    else
      Inc(totalh);

    if DataSet.FieldByName('tipo_parto').AsInteger = 2 then
      Inc(totald);

    if DataSet.FieldByName('peso_nac').Value <> null then
    begin
      Inc(total_p_nac);
      prom_nac := prom_nac+DataSet.FieldByName('peso_nac').AsFloat;
    end;
    if DataSet.FieldByName('peso_dest').Value <> null then
    begin
      Inc(total_p_des);
      prom_des := prom_des+DataSet.FieldByName('peso_dest').AsFloat;
    end;
    if DataSet.FieldByName('peso_anio').Value <> null then
    begin
      Inc(total_p_anio);
      prom_anio := prom_anio+DataSet.FieldByName('peso_anio').AsFloat;
    end;

    if DataSet.FieldByName('destino').Value <> null then
    begin
      ind := 0;
      while ind <= Length(destinos)-1 do
      begin
        if destinos[ind].dest = DataSet.FieldByName('destino').AsInteger then
          break;
        Inc(ind);
      end;
      if ind >= length(destinos) then
      begin
        SetLength(destinos,ind+1);
        destinos[ind].cant := 1;
        destinos[ind].dest := DataSet.FieldValues['destino'];
      end
      else
        Inc(destinos[ind].cant);
    end;

    if DataSet.FieldByName('inspeccion').Value <> null then
    begin
      case DataSet.FieldByName('inspeccion').AsInteger of
        1 : Inc(total_ia);
        2 : Inc(total_ir);
        3 : Inc(total_ire);
      end;
      Inc(total_ins);
    end;
    DataSet.Next;
  end;
  QRLCantAp.Caption := IntToStr(total_ia);
  QRLCantRe.Caption := IntToStr(total_ir);
  QRLCantReins.Caption := IntToStr(total_ire);
  if total_ins > 0 then
  begin
    QRLPorAp.Caption := FormatFloat('###0.00',(total_ia/total_ins))+'%';
    QRLPorRe.Caption := FormatFloat('###0.00',(total_ir/total_ins))+'%';
    QRLPorReins.Caption := FormatFloat('###0.00',(total_ire/total_ins))+'%';
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

  k := 0;
  for ind := 0 to Length(destinos)-1 do
    if (k < 5) and (destinos[ind].dest <> 0) then
    begin
      case ind of
        0 : begin
              QRLDestino1.Enabled := true;
              QRLD1.Enabled := true;
              QRLDestino1.Caption := DMSoftvet.IBQCodDestCabania.Lookup('id_dest_cabania',destinos[ind].dest,'nombre');
              QRLD1.Caption := IntToStr(destinos[ind].cant);
            end;
        1 : begin
              QRLDestino2.Enabled := true;
              QRLD2.Enabled := true;
              QRLDestino2.Caption := DMSoftvet.IBQCodDestCabania.Lookup('id_dest_cabania',destinos[ind].dest,'nombre');
              QRLD2.Caption := IntToStr(destinos[ind].cant);
            end;
        2 : begin
              QRLDestino3.Enabled := true;
              QRLD3.Enabled := true;
              QRLDestino3.Caption := DMSoftvet.IBQCodDestCabania.Lookup('id_dest_cabania',destinos[ind].dest,'nombre');
              QRLD3.Caption := IntToStr(destinos[ind].cant);
            end;
        3 : begin
              QRLDestino4.Enabled := true;
              QRLD4.Enabled := true;
              QRLDestino4.Caption := DMSoftvet.IBQCodDestCabania.Lookup('id_dest_cabania',destinos[ind].dest,'nombre');
              QRLD4.Caption := IntToStr(destinos[ind].cant);
            end;
        4 : begin
              QRLDestino5.Enabled := true;
              QRLD5.Enabled := true;
              QRLDestino5.Caption := DMSoftvet.IBQCodDestCabania.Lookup('id_dest_cabania',destinos[ind].dest,'nombre');
              QRLD5.Caption := IntToStr(destinos[ind].cant);
            end;
      end;
      Inc(k);
    end
    else
      break;

  QRLTotal.Caption := IntToStr(total);
  QRLTotalM.Caption := IntToStr(totalm);
  QRLTotalH.Caption := IntToStr(totalh);
  QRLTotalD.Caption := IntToStr(totald);
  if prom_nac = 0 then
    QRLPNac.Caption := ' '
  else 
    QRLPNac.Caption := FormatFloat('###0.00',(prom_nac/total_p_nac))+' Kgs.';
  if prom_des = 0 then
    QRLPDes.Caption := ' '
  else
    QRLPDes.Caption := FormatFloat('###0.00',(prom_des/total_p_des))+' Kgs.';
  if prom_anio = 0 then
    QRLPAnio.Caption := ' '
  else
    QRLPAnio.Caption := FormatFloat('###0.00',(prom_anio/total_p_anio))+' Kgs.';

  ComponentesVisiblesPorPais(FPrincipal.Pais);    
end;

procedure TFREPProduccionExternosPreview.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' Kgs.';
end;

procedure TFREPProduccionExternosPreview.QRDBText12Print(sender: TObject;
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

// retorna el nombre de una raza dada
function TFREPProduccionExternosPreview.retornarRaza(raza: integer): string;
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.add('select nombre from cod_razas where (id_raza = :n)');
  IBQAux.ParamByName('n').AsInteger := raza;
  IBQAux.Active := true;
  result := IBQAux.fieldByName('nombre').AsString;
end;

// metodo que retorna un identificador alternativo de un animal con las prioridades planteadas(no se si va)
procedure TFREPProduccionExternosPreview.retornarAlternativo(id: integer;
  externo: boolean; var identif, value: string);
begin
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  if (externo) then
    IBQAux.sql.add('select * from tab_animales_externos where (id_animal_externo = :n)')
  else
    IBQAux.sql.add('select * from tab_animales where (id_animal = :n)');
  IBQAux.ParamByName('n').AsInteger := id;
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

procedure TFREPProduccionExternosPreview.PrimerNodo(id_animal : integer);
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

  retornarAlternativo(id_animal, _Externo, alter, valor);
  if (IBQAux.fieldByName('nombre').AsString = IBQAux.fieldByName('id_rp').AsString) then
    linea1.Caption := Traducir('  RP: ')+IBQAux.fieldByName('id_rp').AsString
  else
    linea1.Caption := Traducir('  RP: ')+IBQAux.fieldByName('id_rp').AsString+' - '+IBQAux.fieldByName('nombre').AsString;
  linea1.Caption := linea1.caption+' - '+alter+' '+valor;
 { if (FPrincipal.Pais <> 2) then //si el pais no es uruguay
    linea3.Caption := '  Raza: '+retornarRaza(IBQAux.fieldbyName('raza').AsInteger)
   else
     linea3.Caption := '';  }
end;

procedure TFREPProduccionExternosPreview.ComponentesVisiblesPorPais(
  pais: Integer);
begin
  inherited;
  QRLabel2.Caption:= FPrincipal.PaisHerdBook+': ';
end;

procedure TFREPProduccionExternosPreview.armarArbol();
var alter:string;
    valor:string;
    externo:boolean;
begin
  PrimerNodo(ID_Animal);

  IBQArbolGenea.Active := false;
  IBQArbolGenea.ParamByName('n').AsInteger := ID_Animal;
  if _Externo then
    IBQArbolGenea.ParamByName('EXT').AsString := 'S'
  else
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

procedure TFREPProduccionExternosPreview.QRCRProduccionAddReports(
  Sender: TObject);
begin
  inherited;
  QRCRProduccion.Reports.Clear;

  QRCRProduccion.Reports.Add(QuickRep1);

  if (tiene_deps) then
    QRCRProduccion.Reports.Add(QRDep);

  QRCRProduccion.Reports.Add(QRProduccionExternos);
  QRCRProduccion.Reports.Add(QRGenealogia);

end;

procedure TFREPProduccionExternosPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;

  QRCRProduccion.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPProduccionExternosPreview.cargarDatosPropietario;
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

      QRLRenglon5.Enabled:= false;
      QRLNombrePropietario6.Enabled:= true;
      
      QRLRenglon3.Enabled:= false;
      QRLNombrePropietario4.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;

       QRLRenglon5.Enabled:= true;
       QRLNombrePropietario6.Enabled:= false;

       QRLRenglon3.Enabled:= true;
       QRLNombrePropietario4.Enabled:= false;
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
       QRImagenEmpresa6.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa4.Picture.LoadFromFile(repGeneral.getPathImage);       
    end;

  QRLDatosAbajo145.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo255.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario6.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa6.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo16.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo26.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario4.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa4.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo14.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo24.Caption:= QRLDatosAbajo2.Caption;

  repGeneral.Destroy;
end;

procedure TFREPProduccionExternosPreview.QRBand15BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  if (IBQREPProdAnimalExterno.FindField('OESTAB') <>nil) and
     (IBQREPProdAnimalExterno.FieldByName('OESTAB').Value>0) and
     (IBQREPProdAnimalExterno.FieldByName('OESTAB').Value <> FPrincipal.EstablecimientoActual) then
    sender.Font.color := clRed
  else
    sender.Font.color := clBlack;

end;

end.
