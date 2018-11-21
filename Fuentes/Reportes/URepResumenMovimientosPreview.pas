unit URepResumenMovimientosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QuickRpt, ImgList, PngImageList, IBQuery, WinXP,
  DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList,
  ComCtrls, JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, QRCtrls, jpeg , QRExport, QRPDFFilt, QRPrntr,
  pngimage, JvExExtCtrls, JvImage;

type
  TFRepResumenMovimientosPreview = class(TFUniversal)
    QRResumenMovimientos: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage1: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRShape11: TQRShape;
    QRShape15: TQRShape;
    QRSysData3: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRBDatos: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand6: TQRBand;
    QRShape13: TQRShape;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape16: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
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
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRDBText21: TQRDBText;
    QRShape2: TQRShape;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FRepResumenMovimientosPreview: TFRepResumenMovimientosPreview;

implementation

uses URepGeneral, UPrincipal, URepResumenMovimientos,UTiposGlobales;

{$R *.dfm}

procedure TFRepResumenMovimientosPreview.cargarDatosPropietario;
var repGeneral : TFRepGeneral;
begin
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();
  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';

  QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;

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
    QRImagenEmpresa.Picture.LoadFromFile(repGeneral.getPathImage);

  repGeneral.Destroy;
end;

procedure TFRepResumenMovimientosPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;

  QRResumenMovimientos.PrevInitialZoom:= qrZoomOther;
  QRResumenMovimientos.PrevInitialZoom:= qrZoomToWidth;
  QRResumenMovimientos.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFRepResumenMovimientosPreview.FormCreate(Sender: TObject);
begin
  inherited;

  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;

  if (FPrincipal.TipoVersion = TVveterinario) then
  begin
      QRLRenglon2.Enabled := true;
      QRLRenglon2.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
  end
  else
  begin
      QRLRenglon2.Enabled := true;
      QRLRenglon2.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
  end;

  cargarDatosPropietario;
end;

end.
