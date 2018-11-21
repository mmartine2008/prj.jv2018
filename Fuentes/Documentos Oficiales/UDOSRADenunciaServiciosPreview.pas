unit UDOSRADenunciaServiciosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QRCtrls, QuickRpt, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  StdCtrls, ExtCtrls, QRExport, QRPDFFilt, QRPrntr, ImgList, PngImageList,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFUniversal1 = class(TFUniversal)
    QR: TQuickRep;
    QRBand2: TQRBand;
    QRLRPAnimal: TQRLabel;
    QRLTipoServicio: TQRLabel;
    QRLFechaInicio: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBEncabezadoPlanilla: TQRBand;
    QRLEstablecimientos: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRSEncabezadoPlanilla: TQRShape;
    QRLRenglon2: TQRLabel;
    QRBand5: TQRBand;
    QRLabel1: TQRLabel;
    QRLPagRPs: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
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
    LObservaciones: TQRLabel;
    QRShape2: TQRShape;
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
    QRShape5: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape4: TQRShape;
    QRShape16: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRDBText11: TQRDBText;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRDBText12: TQRDBText;
    QRLabel24: TQRLabel;
    QRShape26: TQRShape;
    QRExprMemo1: TQRExprMemo;
   // QRRTFFilter1: TQRRTFFilter;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel28: TQRLabel;
    QRDBText13: TQRDBText;
    IBQUpdateFolioLinea: TIBQuery;
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
    procedure QREndPage(Sender: TCustomQuickRep);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    nro_folio : Integer;
  end;

var
  FUniversal1: TFUniversal1;

implementation

uses DateUtils, URepDenunciaServicio, UPrincipal;

{$R *.dfm}

procedure TFUniversal1.QRDBText3Print(sender: TObject; var Value: String);
begin
  inherited;
//  if (FREPDenunciaServicio.IBQDenunciaServicio.FieldByName('tipo').AsInteger <> 1) then
    Value:= IntToStr(DayOf(StrToDate(Value)))
//   else
//      Value:= '';
end;

procedure TFUniversal1.QRDBText7Print(sender: TObject; var Value: String);
begin
  inherited;
//  if (FREPDenunciaServicio.IBQDenunciaServicio.FieldByName('tipo').AsInteger <> 1) then
    Value:= IntToStr(MonthOf(StrToDate(Value)))
//   else
//      Value:= '';
end;

procedure TFUniversal1.QRDBText8Print(sender: TObject; var Value: String);
begin
  inherited;
//  if (FREPDenunciaServicio.IBQDenunciaServicio.FieldByName('tipo').AsInteger <> 1) then
    Value:= IntToStr(YearOf(StrToDate(Value)))
//   else
//      Value:= '';
end;

procedure TFUniversal1.FormShow(Sender: TObject);
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

procedure TFUniversal1.QREndPage(Sender: TCustomQuickRep);
begin
  inherited;
  if nro_folio > -1 then
  begin
    Inc(nro_folio);
    QRLabel28.Caption := IntToStr(nro_folio);
  end;
end;

procedure TFUniversal1.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  folio : String;
begin
  inherited;
  if nro_folio > -1 then
    folio := IntToStr(nro_folio)
  else
    folio := QRLabel28.Caption;
  if (folio <> '') and (QRDBText5.DataSet.FieldValues['ID_ANIMAL'] <> null) then
  begin
    try
      IBQUpdateFolioLinea.Close;
      IBQUpdateFolioLinea.ParamByName('FOLIO').AsString := folio;
      IBQUpdateFolioLinea.ParamByName('LINEA').AsInteger := QRDBText12.DataSet.FieldValues['ORDEN'];
      IBQUpdateFolioLinea.ParamByName('ID').AsInteger := QRDBText5.DataSet.FieldValues['ID_ANIMAL'];
      IBQUpdateFolioLinea.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

end.
