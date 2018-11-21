{ DAIANA - 12.12.2014 - Incidencia 412 - Inicio
  Reporte de Movimientos (Previsualizacion) }

unit URepMovimientosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls,
  jpeg, pngimage, ExtCtrls, StdCtrls, JvGIF, QRCtrls, QuickRpt, ImgList,
  PngImageList, JvExControls, JvLabel;

type
  TFRepMovimientosPreview = class(TFUniversal)
    QRMovimientos: TQuickRep;
    //Encabezado
    QRBEncabezadoPlanilla: TQRBand;
    QRImage1: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLEstablecimientos: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRShape15: TQRShape; 
    QRSysData3: TQRSysData;
    QRShape11: TQRShape;
    QRLNombrePropietario: TQRLabel;
    //Tablas Alta y Baja 
    QRBandTablas: TQRBand;
    QRLPeriodo: TQRLabel;
    QRShape001: TQRShape;
    QRShape002: TQRShape;
    QRShape003: TQRShape;
    QRShape004: TQRShape;
    QRShape005: TQRShape;
    QRShape006: TQRShape;
    QRShape007: TQRShape;
    QRShape008: TQRShape;
    QRShape009: TQRShape;
    QRShape010: TQRShape;
    QRShape011: TQRShape;
    QRShape012: TQRShape;
    QRShape013: TQRShape; 
    QRLabelAlta001: TQRLabel;
    QRLabelAlta002: TQRLabel;
    QRLabelAlta003: TQRLabel;
    QRLabelAlta004: TQRLabel;
    QRLabelAlta005: TQRLabel;
    QRLabelAlta006: TQRLabel;
    QRLAltaCompra: TQRLabel;
    QRLAltaCesion: TQRLabel;
    QRLAltaCarga: TQRLabel;
    QRLAltaNacimientos: TQRLabel;
    QRLabelBaja001: TQRLabel;
    QRLabelBaja002: TQRLabel;
    QRLabelBaja003: TQRLabel;
    QRLabelBaja004: TQRLabel; 
    QRLabelBaja005: TQRLabel;
    QRLBajaVenta: TQRLabel;
    QRLBajaCesion: TQRLabel;
    QRLBajaMuerte: TQRLabel;    
    //Tabla Principal
    QRBandTE: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRBandTC: TQRBand; 
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    //Pie de pagina
    QRBand6: TQRBand;
    QRLabel20: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel21: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRShape22: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
  private
    procedure cargarDatosPropietario;
  public
    { Public declarations }
  end;

var
  FRepMovimientosPreview: TFRepMovimientosPreview;

implementation

{$R *.dfm}

uses
  URepGeneral, URepMovimientos, UPrincipal, UTiposGlobales;

procedure TFRepMovimientosPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
    end;
  cargarDatosPropietario;
end;

procedure TFRepMovimientosPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRMovimientos.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFRepMovimientosPreview.cargarDatosPropietario;
var
  repGeneral : TFRepGeneral;
begin
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();
  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';

  QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;

  if (Trim(repGeneral.getNombrePropietario) <> '') then
    begin
      QRLRenglon1.Enabled:= false;
      QRLNombrePropietario.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;
     end;

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
    begin
       QRImagenEmpresa.Picture.LoadFromFile(repGeneral.getPathImage);
    end;

  repGeneral.Destroy;
end;

end.

{ DAIANA - 12.12.2014 - Incidencia 412 - Fin }
