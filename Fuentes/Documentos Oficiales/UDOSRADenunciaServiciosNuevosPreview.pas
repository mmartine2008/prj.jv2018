unit UDOSRADenunciaServiciosNuevosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QRCtrls, QuickRpt, jpeg, QRPrntr, ImgList, PngImageList, JvExControls,
  JvLabel, JvGIF, pngimage, JvExExtCtrls, JvImage;

type
  TFDOSRADenunciaServiciosNuevosPreview = class(TFUniversal)
    QR: TQuickRep;
    QRBand2: TQRBand;
    QRLRPAnimal: TQRLabel;
    QRLTipoServicio: TQRLabel;
    QRLFechaInicio: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape4: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape26: TQRShape;
    QRShape16: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
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
    QRLabel10: TQRLabel;
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
    QRPrincipal: TQuickRep;
    QRBand1: TQRBand;
    QRLSubTitulo: TQRLabel;
    QRSLine01: TQRShape;
    QRSLine02: TQRShape;
    QRSLine03: TQRShape;
    QRSLine04: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLDatosCriador: TQRLabel;
    QRLDatosRaza: TQRLabel;
    QRShape15: TQRShape;
    QRLNumeroCriador: TQRLabel;
    QRLNombreCriador: TQRLabel;
    QRShape17: TQRShape;
    QRLCodigoRaza: TQRLabel;
    QRLNombreRaza: TQRLabel;
    QRBand4: TQRBand;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLServicio: TQRLabel;
    QRLToro: TQRLabel;
    QRLVaca: TQRLabel;
    QRLObservaciones: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLEntrada: TQRLabel;
    QRLSalida: TQRLabel;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLTipo: TQRLabel;
    QRLDiaEntrada: TQRLabel;
    QRLMesEntrada: TQRLabel;
    QRLAnioEntrada: TQRLabel;
    QRLDiaSalida: TQRLabel;
    QRLMesSalida: TQRLabel;
    QRLAnioSalida: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLNumeroRegAsociado: TQRLabel;
    QRLHbaToro: TQRLabel;
    QRLRpToro: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLNumeroRegistroAsocVaca: TQRLabel;
    QRRpVaca: TQRLabel;
    QRLHbaVaca: TQRLabel;
    QRBand6: TQRBand;
    QRShape47H: TQRShape;
    QRShape48H: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRDBTHbaToro: TQRDBText;
    QRDBTRpToro: TQRDBText;
    QRDBTRpVaca: TQRDBText;
    QRDBTHbaVaca: TQRDBText;
    QRShape47: TQRShape;
    QRBand7: TQRBand;
    QRLNombreRazaValor: TQRLabel;
    QRLNumeroCriadorValor: TQRLabel;
    QRLNombreCriadorValor: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel23: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLCodigoRazaValor: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
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
  FDOSRADenunciaServiciosNuevosPreview: TFDOSRADenunciaServiciosNuevosPreview;

implementation

uses URepDenunciaServicio, UPrincipal;

{$R *.dfm}

procedure TFDOSRADenunciaServiciosNuevosPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
{  QR.PrevInitialZoom:= qrZoomOther;
  QR.PrevInitialZoom:= qrZoomToWidth;
  QR.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);}
  QR.Visible := false;

  QRPrincipal.PrevInitialZoom:= qrZoomOther;
  QRPrincipal.PrevInitialZoom:= qrZoomToWidth;
  QRPrincipal.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);

end;

procedure TFDOSRADenunciaServiciosNuevosPreview.QREndPage(
  Sender: TCustomQuickRep);
begin
  inherited;
  if nro_folio > -1 then
  begin
    Inc(nro_folio);
    QRLabel28.Caption := IntToStr(nro_folio);
  end;
end;

procedure TFDOSRADenunciaServiciosNuevosPreview.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
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
      IBQUpdateFolioLinea.ParamByName('LINEA').AsInteger := QRDBText5.DataSet.FieldValues['ORDEN'];
      IBQUpdateFolioLinea.ParamByName('ID').AsInteger := QRDBText5.DataSet.FieldValues['ID_ANIMAL'];
      IBQUpdateFolioLinea.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;

end;



end.
