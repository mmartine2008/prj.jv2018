unit UREPResumenPartoPreview;

interface
//{$DEFINE EC}
//{$DEFINE DEMO}


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, QRCtrls, jpeg,
  QuickRpt, QRPDFFilt, QRWebFilt, QRExport, IBQuery, ImgList, PngImageList,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFREPResumenPartoPreview = class(TFUniversal)
    QREncabezado: TQuickRep;
    QRCRResumenParto: TQRCompositeReport;
    QRHTMLFilter1: TQRHTMLFilter;
    QRContenido: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRSEncabezadoPlanilla: TQRShape;
    QRSysDPlanilla: TQRSysData;
    QRShape2: TQRShape;
    QRLRenglon2: TQRLabel;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRLRenglon11: TQRLabel;
    QRShape1: TQRShape;
    QRSysPlanilla2: TQRSysData;
    QRShape3: TQRShape;
    QRLRenglon22: TQRLabel;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRLMachosVivos: TQRLabel;
    QRLHembrasVivas: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLLabel: TQRLabel;
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
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRINacimientos: TQRImage;
    QRShape10: TQRShape;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRBand7: TQRBand;
    QRShape21: TQRShape;
    QRLabel2: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRBand6: TQRBand;
    QRShape22: TQRShape;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape24: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel21: TQRLabel;
    QRLPorcVivos: TQRLabel;
    QRLPorcMuertos: TQRLabel;
    QRLTotalPorc: TQRLabel;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRLabel25: TQRLabel;
    QRLPorcMachos: TQRLabel;
    QRLPorcHembras: TQRLabel;
    QRLPorcPorc: TQRLabel;
    QRLPorcDistocia: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRPromMachosVivos: TQRLabel;
    QRPromMachosMuertos: TQRLabel;
    QRLTotalPromedioMacho: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRPromHembrasVivos: TQRLabel;
    QRPromHembrasMuertas: TQRLabel;
    QRLTotalPromedioHembra: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLDesde: TQRLabel;
    QRLabel29: TQRLabel;
    QRLHasta: TQRLabel;
    QRLPotrero: TQRLabel;
    QRLPotreroSel: TQRLabel;
    QRShape34: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRImage3: TQRImage;
    QRShape35: TQRShape;
    procedure QRCRResumenPartoAddReports(Sender: TObject);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREPResumenPartoPreview: TFREPResumenPartoPreview;

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, UREPResumenParto;

procedure TFREPResumenPartoPreview.QRCRResumenPartoAddReports(Sender: TObject);
begin
  inherited;
  QRCRResumenParto.Reports.Clear;
  QRCRResumenParto.Reports.Add(QREncabezado);
  QRCRResumenParto.Reports.Add(QRContenido);
end;

procedure TFREPResumenPartoPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  QRLEstablecimientos.Top:= 3;
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
  QRShape35.Top:= 80;  

  {$IFDEF UCC}
    QRImage3.Enabled:= true;
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
    QRShape35.Top:= 176;
  {$ENDIF}

  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon22.Enabled := true;
      QRLRenglon11.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon22.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon22.Enabled := true;
      QRLRenglon11.Caption := FPrincipal.NombrePropietario;
      QRLRenglon22.Caption := FPrincipal.Renspa;
    end;
end;

procedure TFREPResumenPartoPreview.FormShow(Sender: TObject);
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

end.
