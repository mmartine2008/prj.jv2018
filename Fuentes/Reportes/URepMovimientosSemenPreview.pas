unit URepMovimientosSemenPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QRCtrls, QuickRpt, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  StdCtrls, ExtCtrls, jpeg, QRExport, QRPDFFilt, QRPrntr, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, UTraduccion, pngimage,
  JvExExtCtrls, JvImage;

type
  TFRepMovimientosSemenPreview = class(TFUniversal)
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
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
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
    QRBand2: TQRBand;
    QRDBTRp: TQRDBText;
    QRDBTHba: TQRDBText;
    QRDBTNombre: TQRDBText;
    QRDBTApodo: TQRDBText;
    QRDBTRaza: TQRDBText;
    QRDBTTipo: TQRDBText;
    QRDBTFecha: TQRDBText;
    QRDBTDosis: TQRDBText;
    QRDBTPrecio: TQRDBText;
    QRDBTComprobante: TQRDBText;
    QRDBTPartida: TQRDBText;
    QRDBTNombreCli: TQRDBText;
    QRDBTApellidoCli: TQRDBText;
    QRDBTRazonSocialCli: TQRDBText;
    QRMovimientosSemen: TQuickRep;
    QRLabel19: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRBand6: TQRBand;
    QRShape22: TQRShape;
    QRLabel20: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel21: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario;
  public
    { Public declarations }
  end;

var
  FRepMovimientosSemenPreview: TFRepMovimientosSemenPreview;

implementation

uses URepMovimientosSemen, URepGeneral, UPrincipal,UTiposGlobales;

{$R *.dfm}

procedure TFRepMovimientosSemenPreview.cargarDatosPropietario;
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


procedure TFRepMovimientosSemenPreview.FormShow(Sender: TObject);
var H : HWND;
begin
  inherited;

  QRMovimientosSemen.PrevInitialZoom:= qrZoomOther;
  QRMovimientosSemen.PrevInitialZoom:= qrZoomToWidth;
  QRMovimientosSemen.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);

end;

procedure TFRepMovimientosSemenPreview.FormCreate(Sender: TObject);
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
