unit UDOSRATipiSangADNPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QRCtrls, QuickRpt, jpeg, QRPrntr, JvExControls, JvLabel, JvGIF, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage;

type
  TFDOSRATipiSangADNPreview = class(TFUniversal)
    QR: TQuickRep;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape4: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape26: TQRShape;
    QRShape16: TQRShape;
    QRShape23: TQRShape;
    QRShape30: TQRShape;
    QRBEncabezadoPlanilla: TQRBand;
    QRBand5: TQRBand;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    IBQUpdateFolioLinea: TIBQuery;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape18: TQRShape;
    QRLabel24: TQRLabel;
    QRShape19: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape20: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape21: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape22: TQRShape;
    QRLabel12: TQRLabel;
    QRShape24: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape25: TQRShape;
    QRShape29: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText8: TQRDBText;
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
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
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
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText14: TQRDBText;
    QRLSolicitante: TQRLabel;
    QRLDireccion: TQRLabel;
    QRLTEEstab: TQRLabel;
    QRLTEAdmin: TQRLabel;
    QRLCriador: TQRLabel;
    QRLCC: TQRLabel;
    QRLSocio: TQRLabel;
    QRLCheckTipi: TQRLabel;
    QRLCheckADN: TQRLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    nro_folio : Integer;
  end;

var
  FDOSRATipiSangADNPreview: TFDOSRATipiSangADNPreview;

implementation

uses UDOSRATipiSangADN, UPrincipal;

{$R *.dfm}

procedure TFDOSRATipiSangADNPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QR.PrevInitialZoom:= qrZoomOther;
  QR.PrevInitialZoom:= qrZoomToWidth;
  QR.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

end.
