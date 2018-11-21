unit UDOCertificadoRecupEmbrionesPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QuickRpt, QRCtrls, QRExport, QRPDFFilt, ImgList, PngImageList,
  JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls, JvImage;

type
  TFDOCertificadoRecupEmbrionesPreview = class(TFUniversal)
    QREmbrionesTransferidos1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLRazaDonante: TQRLabel;
    QRLabel5: TQRLabel;
    QRLFolio: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLCriador: TQRLabel;
    QRLabel8: TQRLabel;
    QRLEXPD: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRLCentroTransplante: TQRLabel;
    QRLabel10: TQRLabel;
    QRLHabilitacion: TQRLabel;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRLInscripcion: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape8: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel22: TQRLabel;
    QRShape11: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLNombreDonante: TQRLabel;
    QRLTipoSangDonante: TQRLabel;
    QRLHBADonante: TQRLabel;
    QRLRPDonante: TQRLabel;
    QRLNombreP1: TQRLabel;
    QRLTipoSangP1: TQRLabel;
    QRLHBAP1: TQRLabel;
    QRLRPP1: TQRLabel;
    QRLNombreP2: TQRLabel;
    QRLTipoSangP2: TQRLabel;
    QRLHBAP2: TQRLabel;
    QRLRPP2: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLNroCriador: TQRLabel;
    QRLabel29: TQRLabel;
    QRLFechaServicio: TQRLabel;
    QRLabel30: TQRLabel;
    QRLFolioServicio: TQRLabel;
    QRLabel31: TQRLabel;
    QRLLineaServicio: TQRLabel;
    QRLabel32: TQRLabel;
    QRLTitularServicio: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel34: TQRLabel;
    QRLFechaColecta: TQRLabel;
    QRLabel36: TQRLabel;
    QRLDiasGestacion: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLEmbrionesSinF: TQRLabel;
    QRLabel40: TQRLabel;
    QRLEmbrionesTrans: TQRLabel;
    QRLabel41: TQRLabel;
    QRLEmbrionesTranso: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QREmbrionesTransferidos2: TQuickRep;
    QRBand4: TQRBand;
    QRLabel44: TQRLabel;
    QRMObservacionesCong: TQRMemo;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLTipoEnvase: TQRLabel;
    QRCREmbrionesTransferidos: TQRCompositeReport;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel62: TQRLabel;
    QRBand7: TQRBand;
    QRLabel61: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLTiempoRecup: TQRLabel;
    QRLCrioprotector: TQRLabel;
    QRLEquilibracion: TQRLabel;
    QRLCongelacion: TQRLabel;
    QRLDescongelacion: TQRLabel;
    QRLTransferDir: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRShape20: TQRShape;
    QRLabel37: TQRLabel;
    QRLEmbrionesDeg: TQRLabel;
    QRLTotalEmbriones: TQRLabel;
    QRLabel70: TQRLabel;
    QRLTotalCong: TQRLabel;
    QRLabel72: TQRLabel;
    QRLTotalFrescos: TQRLabel;
    procedure FormShow(Sender: TObject);
    procedure QRCREmbrionesTransferidosAddReports(Sender: TObject);
  private
    { Private declarations }
  public
    mostrar_congelado: boolean;
    { Public declarations }
  end;

var
  FDOCertificadoRecupEmbrionesPreview: TFDOCertificadoRecupEmbrionesPreview;

implementation

uses
  UPrincipal, UDMSoftvet, UDOCertificadoRecupEmbriones;

{$R *.dfm}

procedure TFDOCertificadoRecupEmbrionesPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCREmbrionesTransferidos.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFDOCertificadoRecupEmbrionesPreview.QRCREmbrionesTransferidosAddReports(
  Sender: TObject);
begin
  inherited;
  QRCREmbrionesTransferidos.Reports.Clear;
  QRCREmbrionesTransferidos.Reports.Add(QREmbrionesTransferidos1);
  if (mostrar_congelado) then
  begin
    QRCREmbrionesTransferidos.Reports.Add(QREmbrionesTransferidos2);
  end;
end;


end.
