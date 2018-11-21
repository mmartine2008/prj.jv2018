unit URepListadoExtraccionesPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QRCtrls, QuickRpt, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  StdCtrls, ExtCtrls, jpeg, QRExport, QRPDFFilt, QRPrntr, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, UTraduccion, pngimage,
  JvExExtCtrls, JvImage;

type
  TFRepListadoExtraccionesPreview = class(TFUniversal)
    QRMovimientosSemen: TQuickRep;
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
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRDBTRp: TQRDBText;
    QRDBTRazonSocialCli: TQRDBText;
    QRDBTRaza: TQRDBText;
    QRDBTPrecio: TQRDBText;
    QRDBTPartida: TQRDBText;
    QRDBTNombreCli: TQRDBText;
    QRDBTNombre: TQRDBText;
    QRDBTHba: TQRDBText;
    QRDBTFecha: TQRDBText;
    QRDBTDosis: TQRDBText;
    QRDBTComprobante: TQRDBText;
    QRDBTApellidoCli: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape9: TQRShape;
    QRBand6: TQRBand;
    QRShape22: TQRShape;
    QRLabel20: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel21: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRShape18: TQRShape;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape23: TQRShape;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario;
  public
    { Public declarations }
  end;

var
  FRepListadoExtraccionesPreview: TFRepListadoExtraccionesPreview;

implementation

{$R *.dfm}

uses URepListadoExtracciones, UPrincipal, URepGeneral, uTiposGlobales;

procedure TFRepListadoExtraccionesPreview.cargarDatosPropietario;
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

procedure TFRepListadoExtraccionesPreview.FormCreate(Sender: TObject);
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

procedure TFRepListadoExtraccionesPreview.FormShow(Sender: TObject);
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

end.
