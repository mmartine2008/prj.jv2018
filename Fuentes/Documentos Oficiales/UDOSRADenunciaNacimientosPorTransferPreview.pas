unit UDOSRADenunciaNacimientosPorTransferPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QRCtrls, QuickRpt, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  StdCtrls, ExtCtrls, jpeg, QRExport, QRPDFFilt, QRPrntr, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls,
  JvImage;
type
  TFDOSRADenunciaNacimientosPorTransferPreview = class(TFUniversal)
    QRPrincipal: TQuickRep;
    QRBand1: TQRBand;
    QRSLine04: TQRShape;
    QRSLine03: TQRShape;
    QRSLine02: TQRShape;
    QRSLine01: TQRShape;
    QRShape40: TQRShape;
    QRShape39: TQRShape;
    QRShape38: TQRShape;
    QRShape37: TQRShape;
    QRShape36: TQRShape;
    QRLSubTitulo: TQRLabel;
    QRLNumeroCriadorValor: TQRLabel;
    QRLNumeroCriador: TQRLabel;
    QRLNombreRazaValor: TQRLabel;
    QRLNombreRaza: TQRLabel;
    QRLNombreCriadorValor: TQRLabel;
    QRLNombreCriador: TQRLabel;
    QRLDatosRaza: TQRLabel;
    QRLDatosCriador: TQRLabel;
    QRLCodigoRazaValor: TQRLabel;
    QRLCodigoRaza: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
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
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    QRRTFFilter1: TQRRTFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRLFolioValor: TQRLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDOSRADenunciaNacimientosPorTransferPreview: TFDOSRADenunciaNacimientosPorTransferPreview;

implementation

uses UCartel, UPrincipal, DateUtils, UDOSRADenunciaNacimientosPorTransfer;
{$R *.dfm}

procedure TFDOSRADenunciaNacimientosPorTransferPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRPrincipal.PrevInitialZoom:= qrZoomOther;
  QRPrincipal.PrevInitialZoom:= qrZoomToWidth;
  QRPrincipal.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

end.
