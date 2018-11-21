unit UREPProduccionCarnePreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QRCtrls, jpeg, QuickRpt, UPrincipal, QRExport, QRPDFFilt, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls,
  JvImage;

type
  TFREPProduccionCarnePreview = class(TFUniversal)
    QRProduccionCarne1: TQuickRep;
    QRBand7: TQRBand;
    QRImage1: TQRImage;
    QRLabel61: TQRLabel;
    QRBand8: TQRBand;
    QRLabel65: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel66: TQRLabel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRLFDesde: TQRLabel;
    QRLFHasta: TQRLabel;
    QRLActividad: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape40: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape41: TQRShape;
    QRLabel30: TQRLabel;
    QRShape42: TQRShape;
    QRShape44: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLExistPromDiaria: TQRLabel;
    QRLSupGanadera: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel38: TQRLabel;
    QRShape15: TQRShape;
    QRLabel39: TQRLabel;
    QRCRProduccionCarne: TQRCompositeReport;
    QRProduccionCarne21: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    ColumnHeaderBand1: TQRBand;
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
    QRLabel41: TQRLabel;
    QRShape20: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRBand3: TQRBand;
    QRImage3: TQRImage;
    QRLabel43: TQRLabel;
    QRProduccionCarne22: TQuickRep;
    DetailBand2: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    ColumnHeaderBand2: TQRBand;
    QRLabel42: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRShape21: TQRShape;
    QRProduccionCarne23: TQuickRep;
    QRBand2: TQRBand;
    QRLabel40: TQRLabel;
    QRShape16: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRBand6: TQRBand;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRProduccionCarne24: TQuickRep;
    QRBand10: TQRBand;
    QRLabel55: TQRLabel;
    QRShape18: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRBand12: TQRBand;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRBand4: TQRBand;
    QRShape19: TQRShape;
    QRLabel87: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel88: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape57: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
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
    QRBand5: TQRBand;
    QRShape95: TQRShape;
    QRLabel89: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel90: TQRLabel;
    QRBand9: TQRBand;
    QRImage2: TQRImage;
    QRLabel91: TQRLabel;
    QRBand11: TQRBand;
    QRImage4: TQRImage;
    QRLabel95: TQRLabel;
    QRBand13: TQRBand;
    QRShape98: TQRShape;
    QRLabel99: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel100: TQRLabel;
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
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRBand14: TQRBand;
    QRImage5: TQRImage;
    QRLabel101: TQRLabel;
    QRBand15: TQRBand;
    QRShape127: TQRShape;
    QRLabel105: TQRLabel;
    QRSysData10: TQRSysData;
    QRLabel106: TQRLabel;
    QRShape128: TQRShape;
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
    QRShape141: TQRShape;
    QRShape142: TQRShape;
    QRShape143: TQRShape;
    QRShape144: TQRShape;
    QRShape145: TQRShape;
    QRShape146: TQRShape;
    QRShape147: TQRShape;
    QRShape148: TQRShape;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRShape151: TQRShape;
    QRBand16: TQRBand;
    QRShape152: TQRShape;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    QRShape157: TQRShape;
    QRShape158: TQRShape;
    QRShape159: TQRShape;
    QRShape160: TQRShape;
    QRShape161: TQRShape;
    QRLabel44: TQRLabel;
    QRBand17: TQRBand;
    QRShape162: TQRShape;
    QRShape163: TQRShape;
    QRShape164: TQRShape;
    QRShape165: TQRShape;
    QRShape166: TQRShape;
    QRShape167: TQRShape;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    QRShape171: TQRShape;
    QRLabel45: TQRLabel;
    QRShape168: TQRShape;
    QRShape172: TQRShape;
    QRBand18: TQRBand;
    QRShape173: TQRShape;
    QRShape174: TQRShape;
    QRShape175: TQRShape;
    QRShape176: TQRShape;
    QRShape177: TQRShape;
    QRShape178: TQRShape;
    QRShape179: TQRShape;
    QRShape180: TQRShape;
    QRShape181: TQRShape;
    QRShape182: TQRShape;
    QRLabel46: TQRLabel;
    QRBand19: TQRBand;
    QRShape183: TQRShape;
    QRShape184: TQRShape;
    QRShape185: TQRShape;
    QRShape186: TQRShape;
    QRShape187: TQRShape;
    QRShape188: TQRShape;
    QRShape189: TQRShape;
    QRShape190: TQRShape;
    QRShape191: TQRShape;
    QRShape192: TQRShape;
    QRLabel92: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRDBText24: TQRDBText;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel93: TQRLabel;
    QRShape193: TQRShape;
    QRShape194: TQRShape;
    QRLKGDifInventario2: TQRLabel;
    QRLabel96: TQRLabel;
    QRShape195: TQRShape;
    QRShape196: TQRShape;
    QRLPesosDifInventario2: TQRLabel;
    QRLabel98: TQRLabel;
    QRLFDesde21: TQRLabel;
    QRLFHasta21: TQRLabel;
    QRLabel104: TQRLabel;
    QRLActividad21: TQRLabel;
    QRLabel102: TQRLabel;
    QRLFDesdeEI: TQRLabel;
    QRLabel103: TQRLabel;
    QRLFHastaEI: TQRLabel;
    QRLCabSalidas: TQRLabel;
    QRDBText25: TQRDBText;
    QRLKgTotalDestino: TQRLabel;
    QRLValorVenta: TQRLabel;
    QRLCabEntradas: TQRLabel;
    QRLKgTotalCampo: TQRLabel;
    QRLValorCompra: TQRLabel;
    QRLCabExistFinal: TQRLabel;
    QRLKGExistFinal: TQRLabel;
    QRLNetoExistFinal: TQRLabel;
    QRLCabExistInicial: TQRLabel;
    QRLKGExistInicial: TQRLabel;
    QRLNetoExistInicial: TQRLabel;
    QRLKGDifInventario: TQRLabel;
    QRLPesosDifInventario: TQRLabel;
    QRLKGProduccionCarne: TQRLabel;
    QRLIngresoNeto: TQRLabel;
    QRLKgProduccionCarneHa: TQRLabel;
    QRLIngresoNetoHa: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLKGExistHacienda: TQRLabel;
    QRLCabExistHacienda: TQRLabel;
    QRLEVExistHacienda: TQRLabel;
    QRLEficienciaStock: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLProdHa: TQRLabel;
    QRLIngresoHa: TQRLabel;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape197: TQRShape;
    QRShape198: TQRShape;
    QRLSumaPromPesoCampoSalidas: TQRLabel;
    QRLSumaPromPesoDestinoSalidas: TQRLabel;
    QRShape129: TQRShape;
    QRShape199: TQRShape;
    QRDBText28: TQRDBText;
    QRDBText36: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRShape6: TQRShape;
    QRSysData11: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRShape17: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa11: TQRLabel;
    QRLNombrePropietario11: TQRLabel;
    QRLRenglon21: TQRLabel;
    QRLRenglon11: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRImagenEmpresa11: TQRImage;
    QRLDatosAbajo11: TQRLabel;
    QRLDatosAbajo21: TQRLabel;
    QRShape96: TQRShape;
    QRSysData3: TQRSysData;
    QRLEmpresa12: TQRLabel;
    QRLNombrePropietario12: TQRLabel;
    QRLRenglon22: TQRLabel;
    QRLRenglon12: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRImagenEmpresa12: TQRImage;
    QRLDatosAbajo12: TQRLabel;
    QRLDatosAbajo22: TQRLabel;
    QRShape7: TQRShape;
    QRShape126: TQRShape;
    QRSysData6: TQRSysData;
    QRLEmpresa14: TQRLabel;
    QRLNombrePropietario14: TQRLabel;
    QRLRenglon24: TQRLabel;
    QRLRenglon14: TQRLabel;
    QRLEstablecimientos4: TQRLabel;
    QRImagenEmpresa14: TQRImage;
    QRLDatosAbajo14: TQRLabel;
    QRLDatosAbajo24: TQRLabel;
    QRShape97: TQRShape;
    QRSysData7: TQRSysData;
    QRLEmpresa13: TQRLabel;
    QRLNombrePropietario13: TQRLabel;
    QRLRenglon23: TQRLabel;
    QRLRenglon13: TQRLabel;
    QRLEstablecimientos3: TQRLabel;
    QRImagenEmpresa13: TQRImage;
    QRLDatosAbajo13: TQRLabel;
    QRLDatosAbajo23: TQRLabel;
    QRShape200: TQRShape;
    QRShape201: TQRShape;
    QRShape26: TQRShape;
    QRShape31: TQRShape;
    QRShape35: TQRShape;
    procedure FormShow(Sender: TObject);
    procedure QRCRProduccionCarneAddReports(Sender: TObject);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRLSumaPromPesoCampoSalidasPrint(sender: TObject;
      var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRLSumaPromPesoDestinoSalidasPrint(sender: TObject;
      var Value: String);
    procedure QRExpr16Print(sender: TObject; var Value: String);
    procedure QRExpr15Print(sender: TObject; var Value: String);
    procedure QRLPesosDifInventario2Print(sender: TObject;
      var Value: String);
  private
    { Private declarations }
    SumaPromPesoCampoSalidas, SumaPromPesoDestinoSalidas: extended;
    procedure cargarDatosPropietario();
  public
    Detalle : Boolean;
  end;

var
  FREPProduccionCarnePreview: TFREPProduccionCarnePreview;

implementation

{$R *.dfm}

Uses UREPProduccionCarne, URepGeneral,UTiposGlobales;

procedure TFREPProduccionCarnePreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCRProduccionCarne.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);

  SumaPromPesoCampoSalidas:= 0;
  SumaPromPesoDestinoSalidas:= 0;  
end;

procedure TFREPProduccionCarnePreview.QRCRProduccionCarneAddReports(
  Sender: TObject);
begin
  inherited;
  QRCRProduccionCarne.Reports.Clear;
  QRCRProduccionCarne.Reports.Add(QRProduccionCarne1);
  if Detalle then
  begin
    QRCRProduccionCarne.Reports.Add(QRProduccionCarne21);
    QRCRProduccionCarne.Reports.Add(QRProduccionCarne22);
    QRCRProduccionCarne.Reports.Add(QRProduccionCarne23);
    QRCRProduccionCarne.Reports.Add(QRProduccionCarne24);
  end;
end;

procedure TFREPProduccionCarnePreview.QRBand7BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos3.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos4.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
      QRLRenglon11.Enabled := true;
      QRLRenglon21.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon11.Caption := FPrincipal.Renspa;
      QRLRenglon12.Enabled := true;
      QRLRenglon22.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon12.Caption := FPrincipal.Renspa;
      QRLRenglon23.Enabled := true;
      QRLRenglon13.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon23.Caption := FPrincipal.Renspa;
      QRLRenglon24.Enabled := true;
      QRLRenglon14.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon24.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
      QRLRenglon11.Enabled := true;
      QRLRenglon21.Caption := FPrincipal.NombrePropietario;
      QRLRenglon11.Caption := FPrincipal.Renspa;
      QRLRenglon12.Enabled := true;
      QRLRenglon22.Caption := FPrincipal.NombrePropietario;
      QRLRenglon12.Caption := FPrincipal.Renspa;
      QRLRenglon23.Enabled := true;
      QRLRenglon13.Caption := FPrincipal.NombrePropietario;
      QRLRenglon23.Caption := FPrincipal.Renspa;
      QRLRenglon24.Enabled := true;
      QRLRenglon14.Caption := FPrincipal.NombrePropietario;
      QRLRenglon24.Caption := FPrincipal.Renspa;
    end;

  cargarDatosPropietario();
end;

procedure TFREPProduccionCarnePreview.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= Value + ' %';
end;

procedure TFREPProduccionCarnePreview.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= '$ ' + Value;
end;

procedure TFREPProduccionCarnePreview.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  value := value + 'kg';
end;

procedure TFREPProduccionCarnePreview.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  inherited;
  SumaPromPesoCampoSalidas:= SumaPromPesoCampoSalidas + StrToFloat(Value);
end;

procedure TFREPProduccionCarnePreview.QRLSumaPromPesoCampoSalidasPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  value:= FloatToStr(SumaPromPesoCampoSalidas);
end;

procedure TFREPProduccionCarnePreview.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  inherited;
  SumaPromPesoDestinoSalidas:= SumaPromPesoDestinoSalidas + StrToFloat(Value);
end;

procedure TFREPProduccionCarnePreview.QRLSumaPromPesoDestinoSalidasPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  value:= FloatToStr(SumaPromPesoDestinoSalidas);
end;

procedure TFREPProduccionCarnePreview.QRExpr16Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= '$ ' + Value;
end;

procedure TFREPProduccionCarnePreview.QRExpr15Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value:= '$ ' + Value;
end;

procedure TFREPProduccionCarnePreview.QRLPesosDifInventario2Print(
  sender: TObject; var Value: String);
begin
  inherited;
  Value:= '$ ' + Value;
end;

procedure TFREPProduccionCarnePreview.cargarDatosPropietario;
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

      QRLRenglon21.Enabled:= false;
      QRLNombrePropietario11.Enabled:= true;

      QRLRenglon22.Enabled:= false;
      QRLNombrePropietario12.Enabled:= true;

      QRLRenglon23.Enabled:= false;
      QRLNombrePropietario13.Enabled:= true;

      QRLRenglon24.Enabled:= false;
      QRLNombrePropietario14.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;

       QRLRenglon21.Enabled:= true;
       QRLNombrePropietario11.Enabled:= false;

       QRLRenglon22.Enabled:= true;
       QRLNombrePropietario12.Enabled:= false;

       QRLRenglon23.Enabled:= true;
       QRLNombrePropietario13.Enabled:= false;

       QRLRenglon24.Enabled:= true;
       QRLNombrePropietario14.Enabled:= false;
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
       QRImagenEmpresa11.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa12.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa13.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa14.Picture.LoadFromFile(repGeneral.getPathImage);
    end;


  QRLNombrePropietario11.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa11.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo11.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo21.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario12.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa12.Caption:= QRLEmpresa.Caption;
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

  repGeneral.Destroy;
end;

end.
