unit UDOSRADenunciaBajaNuevosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QRCtrls, QuickRpt, jpeg, QRPrntr, ImgList, PngImageList, pngimage,
  JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFDOSRADenunciaBajaNuevosPreview = class(TFUniversal)
    QR: TQuickRep;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape8: TQRShape;
    QRShape4: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
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
    QRLRenglon1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRBand5: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel29: TQRLabel;
    QRImage1: TQRImage;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRLabel13: TQRLabel;
    IBQUpdateFolioLinea: TIBQuery;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    procedure FormShow(Sender: TObject);
    procedure QREndPage(Sender: TCustomQuickRep);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    nro_folio : Integer;
  end;

var
  FDOSRADenunciaBajaNuevosPreview: TFDOSRADenunciaBajaNuevosPreview;

implementation

uses URepDenunciaBaja, UPrincipal;

{$R *.dfm}

procedure TFDOSRADenunciaBajaNuevosPreview.FormShow(Sender: TObject);
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

procedure TFDOSRADenunciaBajaNuevosPreview.QREndPage(
  Sender: TCustomQuickRep);
begin
  inherited;
  if nro_folio > -1 then
  begin
    Inc(nro_folio);
    QRLabel28.Caption := IntToStr(nro_folio);
  end;
end;

procedure TFDOSRADenunciaBajaNuevosPreview.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  folio : String;
begin
  inherited;
  if nro_folio > -1 then
    folio := IntToStr(nro_folio)
  else
    folio := QRLabel28.Caption;
{  if (folio <> '') and (QRDBText5.DataSet.FieldValues['ID_ANIMAL'] <> null) then
  begin
    try
      IBQUpdateFolioLinea.Close;
      IBQUpdateFolioLinea.ParamByName('FOLIO').AsString := folio;
      IBQUpdateFolioLinea.ParamByName('LINEA').AsInteger := QRDBText5.DataSet.FieldValues['ORDEN'];
      IBQUpdateFolioLinea.ParamByName('ID').AsInteger := QRDBText5.DataSet.FieldValues['ID_ANIMAL'];
      IBQUpdateFolioLinea.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;   }
end;

end.
