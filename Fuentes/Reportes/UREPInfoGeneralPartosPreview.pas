unit UREPInfoGeneralPartosPreview;

interface

uses          
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, QRCtrls, jpeg,
  QuickRpt, QRPDFFilt, QRWebFilt, QRExport, IBQuery, QRPrntr, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls,
  JvImage;

type
  TFREPInfoGeneralPartosPreview = class(TFUniversal)
    QREncabezado: TQuickRep;
    QRCRResumenParto: TQRCompositeReport;
    QRHTMLFilter1: TQRHTMLFilter;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRBand2: TQRBand;
    QRBand6: TQRBand;
    QRShape22: TQRShape;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLDesde: TQRLabel;
    QRLPotrero: TQRLabel;
    QRLPotreroSel: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRINacimientos: TQRImage;
    QRContenido: TQuickRep;
    QRBand3: TQRBand;
    QRImage5: TQRImage;
    QRLabel37: TQRLabel;
    QRShape41: TQRShape;
    QRBand12: TQRBand;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRDBText21: TQRDBText;
    QRShape78: TQRShape;
    QRDBText22: TQRDBText;
    QRShape79: TQRShape;
    QRDBText23: TQRDBText;
    QRShape80: TQRShape;
    QRDBText24: TQRDBText;
    QRShape81: TQRShape;
    QRDBText25: TQRDBText;
    QRShape82: TQRShape;
    QRDBText26: TQRDBText;
    QRShape83: TQRShape;
    QRDBText27: TQRDBText;
    QRShape84: TQRShape;
    QRDBText28: TQRDBText;
    QRBand14: TQRBand;
    QRShape85: TQRShape;
    QRLabel66: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel67: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel57: TQRLabel;
    QRShape63: TQRShape;
    QRLabel51: TQRLabel;
    QRShape58: TQRShape;
    QRLabel52: TQRLabel;
    QRShape59: TQRShape;
    QRLabel53: TQRLabel;
    QRShape60: TQRShape;
    QRLabel54: TQRLabel;
    QRShape61: TQRShape;
    QRLabel55: TQRLabel;
    QRShape62: TQRShape;
    QRLabel56: TQRLabel;
    QRShape64: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRLabel60: TQRLabel;
    QRShape67: TQRShape;
    QRLabel61: TQRLabel;
    QRShape68: TQRShape;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRLabel64: TQRLabel;
    QRShape71: TQRShape;
    QRLabel65: TQRLabel;
    QRShape3: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape24: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    tpmes1: TQRLabel;
    tpmes2: TQRLabel;
    tpmes3: TQRLabel;
    tpmes4: TQRLabel;
    tpmes5: TQRLabel;
    tpmes6: TQRLabel;
    tpmes7: TQRLabel;
    tpmes8: TQRLabel;
    tpmes9: TQRLabel;
    tpmes10: TQRLabel;
    tpmes11: TQRLabel;
    tpmes12: TQRLabel;
    tpdmes1: TQRLabel;
    tpdmes2: TQRLabel;
    tpdmes3: TQRLabel;
    tpdmes4: TQRLabel;
    tpdmes5: TQRLabel;
    tpdmes6: TQRLabel;
    tpdmes7: TQRLabel;
    tpdmes8: TQRLabel;
    tpdmes9: TQRLabel;
    tpdmes10: TQRLabel;
    tpdmes11: TQRLabel;
    tpdmes12: TQRLabel;
    QRShape38: TQRShape;
    totalpartos: TQRLabel;
    totalpartosdistocicos: TQRLabel;
    QRShape39: TQRShape;
    QRLabel70: TQRLabel;
    porcentajePartoDistocicos: TQRLabel;
    QRShape42: TQRShape;
    QRLabel8: TQRLabel;
    QRLmes1: TQRLabel;
    QRLmes2: TQRLabel;
    QRLmes3: TQRLabel;
    QRLmes4: TQRLabel;
    QRLmes5: TQRLabel;
    QRLmes6: TQRLabel;
    QRLmes7: TQRLabel;
    QRLmes8: TQRLabel;
    QRLmes9: TQRLabel;
    QRLmes10: TQRLabel;
    QRLmes11: TQRLabel;
    QRLmes12: TQRLabel;
    QRLmesTotal: TQRLabel;
    QrContenidoDistocia1: TQuickRep;
    QRBand4: TQRBand;
    QRImage4: TQRImage;
    QRLabel15: TQRLabel;
    QRShape46: TQRShape;
    QrContenidoDistocia2: TQuickRep;
    QRBand5: TQRBand;
    QRImage8: TQRImage;
    QRLabel20: TQRLabel;
    QRShape49: TQRShape;
    QRContenidoDistocia3: TQuickRep;
    QRBand7: TQRBand;
    QRImage11: TQRImage;
    QRLabel19: TQRLabel;
    QRShape50: TQRShape;
    QRContenidoDistocia4: TQuickRep;
    QRBand9: TQRBand;
    QRImage14: TQRImage;
    QRLabel41: TQRLabel;
    QRShape52: TQRShape;
    QRBand10: TQRBand;
    QRIDistRaza: TQRImage;
    QRIDistCC: TQRImage;
    QRBand11: TQRBand;
    QRIDistFrame: TQRImage;
    QRIDistAreaP: TQRImage;
    QRBand13: TQRBand;
    QRIDistMuerte: TQRImage;
    QRBand15: TQRBand;
    QRIDistRodeo: TQRImage;
    QRBand16: TQRBand;
    QRShape53: TQRShape;
    QRLabel45: TQRLabel;
    QRSysData7: TQRSysData;
    QRLabel46: TQRLabel;
    QRBand17: TQRBand;
    QRShape55: TQRShape;
    QRLabel47: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel48: TQRLabel;
    QRBand18: TQRBand;
    QRShape56: TQRShape;
    QRLabel49: TQRLabel;
    QRSysData9: TQRSysData;
    QRLabel50: TQRLabel;
    QRBand19: TQRBand;
    QRShape57: TQRShape;
    QRLabel68: TQRLabel;
    QRSysData10: TQRSysData;
    QRLabel69: TQRLabel;
    QRIDistGrado: TQRImage;
    QRIDistPadres: TQRImage;
    QRShape112: TQRShape;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape107: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape123: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape127: TQRShape;
    QRShape128: TQRShape;
    QRShape129: TQRShape;
    QRShape130: TQRShape;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
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
    QRLabel80: TQRLabel;
    QRShape142: TQRShape;
    QRLabel82: TQRLabel;
    QRShape141: TQRShape;
    QRShape143: TQRShape;
    QRShape144: TQRShape;
    QRShape145: TQRShape;
    QRShape146: TQRShape;
    QRShape147: TQRShape;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRShape148: TQRShape;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRShape151: TQRShape;
    QRShape152: TQRShape;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    QRShape157: TQRShape;
    QRLabel89: TQRLabel;
    QRShape158: TQRShape;
    QRShape159: TQRShape;
    QRShape160: TQRShape;
    QRShape161: TQRShape;
    QRShape162: TQRShape;
    QRShape163: TQRShape;
    QRShape164: TQRShape;
    QRShape165: TQRShape;
    QRShape166: TQRShape;
    QRShape167: TQRShape;
    QRLabel79: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    QRShape171: TQRShape;
    QRShape172: TQRShape;
    QRShape173: TQRShape;
    QRShape174: TQRShape;
    QRShape175: TQRShape;
    QRShape176: TQRShape;
    QRShape177: TQRShape;
    QRShape179: TQRShape;
    QRShape180: TQRShape;
    QRShape181: TQRShape;
    QRShape182: TQRShape;
    QRShape183: TQRShape;
    QRShape185: TQRShape;
    QRShape186: TQRShape;
    QRShape187: TQRShape;
    QRShape188: TQRShape;
    QRShape168: TQRShape;
    QRShape178: TQRShape;
    QRShape184: TQRShape;
    QRShape189: TQRShape;
    QRShape190: TQRShape;
    QRShape191: TQRShape;
    QRLabel101: TQRLabel;
    QRShape192: TQRShape;
    QRShape193: TQRShape;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRShape194: TQRShape;
    QRShape195: TQRShape;
    QRShape196: TQRShape;
    QRShape198: TQRShape;
    QRShape199: TQRShape;
    QRShape200: TQRShape;
    QRShape202: TQRShape;
    QRShape203: TQRShape;
    QRLabel16: TQRLabel;
    QRShape86: TQRShape;
    QRLabel17: TQRLabel;
    QRShape40: TQRShape;
    QRLabel18: TQRLabel;
    porcAcumMes1: TQRLabel;
    porcAcumMes2: TQRLabel;
    porcAcumMes3: TQRLabel;
    porcAcumMes4: TQRLabel;
    porcAcumMes5: TQRLabel;
    porcAcumMes6: TQRLabel;
    porcAcumMes7: TQRLabel;
    porcAcumMes8: TQRLabel;
    porcAcumMes9: TQRLabel;
    porcAcumMes10: TQRLabel;
    porcAcumMes11: TQRLabel;
    porcAcumMes12: TQRLabel;
    porcAcumTotal: TQRLabel;
    QRContenido2: TQuickRep;
    SummaryBand1: TQRBand;
    QRIDistPeso: TQRImage;
    QRShape4: TQRShape;
    QRLMachosVivos: TQRLabel;
    QRLHembrasVivas: TQRLabel;
    QRShape5: TQRShape;
    QRLPromVivos: TQRLabel;
    QRLTotalVivos: TQRLabel;
    QRLDistVivos: TQRLabel;
    QRLMachosMuertos: TQRLabel;
    QRLTotalMachos: TQRLabel;
    QRLHembrasMuertas: TQRLabel;
    QRLTotalHembras: TQRLabel;
    QRLTotalMuertos: TQRLabel;
    QRLTotalTotal: TQRLabel;
    QRLDistMuertos: TQRLabel;
    QRLTotalDistocia: TQRLabel;
    QRLPromMuertos: TQRLabel;
    QRLTotalPromedio: TQRLabel;
    QRLPorcVivos: TQRLabel;
    QRLPorcMuertos: TQRLabel;
    QRLTotalPorc: TQRLabel;
    QRLPorcMachos: TQRLabel;
    QRLPorcHembras: TQRLabel;
    QRLPorcPorc: TQRLabel;
    QRLPorcDistocia: TQRLabel;
    QRPromMachosVivos: TQRLabel;
    QRPromMachosMuertos: TQRLabel;
    QRLTotalPromedioMacho: TQRLabel;
    QRPromHembrasVivos: TQRLabel;
    QRPromHembrasMuertas: TQRLabel;
    QRLTotalPromedioHembra: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape54: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape87: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLLabel: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape25: TQRShape;
    QRShape23: TQRShape;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel14: TQRLabel;
    QRShape44: TQRShape;
    QRShape2: TQRShape;
    QRSysData11: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRShape43: TQRShape;
    QRSysData12: TQRSysData;
    QRLEmpresa13: TQRLabel;
    QRLNombrePropietario13: TQRLabel;
    QRLRenglon23: TQRLabel;
    QRLRenglon13: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRImagenEmpresa13: TQRImage;
    QRShape45: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa14: TQRLabel;
    QRLNombrePropietario14: TQRLabel;
    QRLRenglon2_17: TQRLabel;
    QRLRenglon1_17: TQRLabel;
    QRLEstablecimientos16: TQRLabel;
    QRImagenEmpresa14: TQRImage;
    QRShape48: TQRShape;
    QRSysData3: TQRSysData;
    QRLEmpresa15: TQRLabel;
    QRLNombrePropietario15: TQRLabel;
    QRLRenglon2_35: TQRLabel;
    QRLRenglon1_35: TQRLabel;
    QRLEstablecimientos29: TQRLabel;
    QRImagenEmpresa15: TQRImage;
    QRShape47: TQRShape;
    QRSysData5: TQRSysData;
    QRLEmpresa16: TQRLabel;
    QRLNombrePropietario16: TQRLabel;
    QRLRenglon2_39: TQRLabel;
    QRLRenglon1_39: TQRLabel;
    QRLEstablecimientos38: TQRLabel;
    QRImagenEmpresa16: TQRImage;
    QRShape51: TQRShape;
    QRSysData6: TQRSysData;
    QRLEmpresa17: TQRLabel;
    QRLNombrePropietario17: TQRLabel;
    QRLRenglon2_43: TQRLabel;
    QRLRenglon1_43: TQRLabel;
    QRLEstablecimientos42: TQRLabel;
    QRImagenEmpresa17: TQRImage;
    QRShape1: TQRShape;
    QRSysData13: TQRSysData;
    QRLEmpresa18: TQRLabel;
    QRLNombrePropietario18: TQRLabel;
    QRLRenglon22: TQRLabel;
    QRLRenglon11: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRImagenEmpresa18: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRLDatosAbajo12: TQRLabel;
    QRLDatosAbajo22: TQRLabel;
    QRLDatosAbajo13: TQRLabel;
    QRLDatosAbajo23: TQRLabel;
    QRLDatosAbajo14: TQRLabel;
    QRLDatosAbajo24: TQRLabel;
    QRLDatosAbajo15: TQRLabel;
    QRLDatosAbajo25: TQRLabel;
    QRLDatosAbajo16: TQRLabel;
    QRLDatosAbajo26: TQRLabel;
    procedure QRCRResumenPartoAddReports(Sender: TObject);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure tpdmes1Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
    procedure QRCRResumenPartoFinished(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FREPInfoGeneralPartosPreview: TFREPInfoGeneralPartosPreview;

implementation

{$R *.dfm}

uses UPrincipal, uTiposGlobales, UREPResumenParto, URepGeneral;

procedure TFREPInfoGeneralPartosPreview.QRCRResumenPartoAddReports(Sender: TObject);
begin
  inherited;
  QRCRResumenParto.Reports.Clear;
  QRCRResumenParto.Reports.Add(QREncabezado);
  QRCRResumenParto.Reports.Add(QRContenido2);
  QRCRResumenParto.Reports.Add(QrContenidoDistocia1);
  QRCRResumenParto.Reports.Add(QrContenidoDistocia2);
  QRCRResumenParto.Reports.Add(QrContenidoDistocia3);
  QRCRResumenParto.Reports.Add(QrContenidoDistocia4);
  QRCRResumenParto.Reports.Add(QRContenido);
end;

procedure TFREPInfoGeneralPartosPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

{  QRLEstablecimientos.Top:= 3;
  QRLRenglon1.Top:= 24;
  QRLRenglon2.Top:= 42;
  QRSEncabezadoPlanilla.Top:= 60;
  QRSysDPlanilla.Top:= 62;
  QRLabel33.Enabled:= false;
  QRLabel34.Enabled:= false;
  QRBEncabezadoPlanilla.Height:= 82;
  QRLTituloPlanilla.Top:= 56;
  QRLTituloPlanilla.Left:= 101;
  QRImage3.Enabled:= false;
  QRShape35.Top:= 80; }

//  {$IFDEF UCC}
{    QRImage3.Enabled:= true;
    QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
    QRLEstablecimientos.Top:= 91;
    QRLRenglon1.Top:= 112;
    QRLRenglon2.Top:= 130;
    QRSEncabezadoPlanilla.Top:= 148;
    QRSysDPlanilla.Top:= 150;
    QRLabel33.Enabled:= true;
    QRLabel34.Enabled:= true;

    QRBEncabezadoPlanilla.Height:= 179;
    QRLTituloPlanilla.Top:= 152;
    QRLTituloPlanilla.Left:= 229;
    QRShape35.Top:= 176;    }
//  {$ENDIF}

  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;
  ////////////////DISTOCIA/////////////////////////////////////////
  QRLEstablecimientos16.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos42.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos38.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos29.Caption := FPrincipal.NombreEstablecimiento;
  /////////////////////////////////////////////////////////////////
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon11.Enabled := true;
      QRLRenglon22.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon11.Caption := FPrincipal.Renspa;

      QRLRenglon13.Enabled := true;
      QRLRenglon23.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon13.Caption := FPrincipal.Renspa;

      //////////////////////////DISTOCIA/////////////////////////
      QRLRenglon1_17.Enabled := true;
      QRLRenglon2_17.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon1_17.Caption := FPrincipal.Renspa;
      QRLRenglon1_43.Enabled := true;
      QRLRenglon2_43.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon1_43.Caption := FPrincipal.Renspa;
      QRLRenglon1_39.Enabled := true;
      QRLRenglon2_39.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon1_39.Caption := FPrincipal.Renspa;
      QRLRenglon1_35.Enabled := true;
      QRLRenglon2_35.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon1_35.Caption := FPrincipal.Renspa;
      ////////////////////////////////////////////////////////////
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon11.Enabled := true;
      QRLRenglon22.Caption := FPrincipal.NombrePropietario;
      QRLRenglon11.Caption := FPrincipal.Renspa;

      QRLRenglon13.Enabled := true;
      QRLRenglon23.Caption := FPrincipal.NombrePropietario;
      QRLRenglon13.Caption := FPrincipal.Renspa;

      //////////////////////////DISTOCIA/////////////////////////
      QRLRenglon1_17.Enabled := true;
      QRLRenglon2_17.Caption := FPrincipal.NombrePropietario;
      QRLRenglon1_17.Caption := FPrincipal.Renspa;
      QRLRenglon1_43.Enabled := true;
      QRLRenglon2_43.Caption := FPrincipal.NombrePropietario;
      QRLRenglon1_43.Caption := FPrincipal.Renspa;
      QRLRenglon1_39.Enabled := true;
      QRLRenglon2_39.Caption := FPrincipal.NombrePropietario;
      QRLRenglon1_39.Caption := FPrincipal.Renspa;
      QRLRenglon1_35.Enabled := true;
      QRLRenglon2_35.Caption := FPrincipal.NombrePropietario;
      QRLRenglon1_35.Caption := FPrincipal.Renspa;
      ////////////////////////////////////////////////////////////
    end;

  cargarDatosPropietario();
end;

procedure TFREPInfoGeneralPartosPreview.tpdmes1Print(sender: TObject;
  var Value: String);
begin
  inherited;

  if (sender is TQRLabel) then
    if (value = '0') then
      begin
        TQRLabel(sender).Font.Color:= clBlack;
        TQRLabel(sender).Font.Style:=[];
      end
     else
       begin
         TQRLabel(sender).Font.Color:= clRed;
         TQRLabel(sender).Font.Style:=[fsBold];
       end;
end;

procedure TFREPInfoGeneralPartosPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCRResumenParto.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPInfoGeneralPartosPreview.QRCRResumenPartoFinished(
  Sender: TObject);
var
  I : Integer;
begin
  inherited;
  if Sender is TQuickRep then
  begin
    TQuickRep(Sender).PrevInitialZoom := qrZoomToWidth;
    TQuickRep(Sender).Zoom := 100;
  end;
end;

procedure TFREPInfoGeneralPartosPreview.cargarDatosPropietario;
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

      QRLRenglon2_35.Enabled:= false;
      QRLNombrePropietario15.Enabled:= true;
      QRLRenglon23.Enabled:= false;
      QRLNombrePropietario13.Enabled:= true;
      QRLRenglon2_17.Enabled:= false;
      QRLNombrePropietario13.Enabled:= true;
      QRLRenglon2_39.Enabled:= false;
      QRLNombrePropietario16.Enabled:= true;
      QRLRenglon2_43.Enabled:= false;
      QRLNombrePropietario17.Enabled:= true;
      QRLRenglon22.Enabled:= false;
      QRLNombrePropietario18.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;
       QRLRenglon2_35.Enabled:= true;
       QRLNombrePropietario15.Enabled:= false;
       QRLRenglon23.Enabled:= true;
       QRLNombrePropietario13.Enabled:= false;
       QRLRenglon2_17.Enabled:= true;
       QRLNombrePropietario13.Enabled:= false;
       QRLRenglon2_39.Enabled:= true;
       QRLNombrePropietario16.Enabled:= false;
       QRLRenglon2_43.Enabled:= true;
       QRLNombrePropietario17.Enabled:= false;
       QRLRenglon22.Enabled:= true;
       QRLNombrePropietario18.Enabled:= false;
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
      // QRLImagenEmpresa12.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa13.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa14.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa15.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa16.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa17.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa18.Picture.LoadFromFile(repGeneral.getPathImage);
    end;


  QRLNombrePropietario15.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa15.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo12.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo22.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario13.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa13.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo13.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo23.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario14.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa14.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo14.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo24.Caption:= QRLDatosAbajo2.Caption;

  QRLDatosAbajo15.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo25.Caption:= QRLDatosAbajo2.Caption;

  QRLDatosAbajo16.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo26.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario16.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa16.Caption:= QRLEmpresa.Caption;

  QRLNombrePropietario17.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa17.Caption:= QRLEmpresa.Caption;

  QRLNombrePropietario18.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa18.Caption:= QRLEmpresa.Caption;

  repGeneral.Destroy;
end;

end.
