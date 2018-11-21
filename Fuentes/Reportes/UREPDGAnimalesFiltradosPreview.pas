unit UREPDGAnimalesFiltradosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QuickRpt, DB, IBCustomDataSet, IBQuery, ActnList,
  QRCtrls, ComCtrls, ExtCtrls, StdCtrls, jpeg, IBStoredProc, DataExport,
  DataToXLS, WinXP, QRExport, QRWebFilt, QRPDFFilt, ImgList, PngImageList,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFREPDGAnimalesFiltradosPreview = class(TFUniversal)
    QRContenido: TQuickRep;
    QRBand1: TQRBand;
    LabelAnimales: TQRLabel;
    QRBand2: TQRBand;
    QRDBTRPAnimal: TQRDBText;
    QRDBDiasActuales: TQRDBText;
    QRDBDistribucion: TQRDBText;
    QRDBDiasTacto: TQRDBText;
    QRCReporte: TQRCompositeReport;
    QRBand5: TQRBand;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRGroup1: TQRGroup;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRHTMLFilter1: TQRHTMLFilter;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRShape4: TQRShape;
    QRLD: TQRLabel;
    QRLDesde: TQRLabel;
    QRLH: TQRLabel;
    QRLHasta: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLG: TQRLabel;
    QRLGrupo: TQRLabel;
    QRShape6: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRLabel9: TQRLabel;
    procedure QRCReporteAddReports(Sender: TObject);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRContenidoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FREPDGAnimalesFiltradosPreview: TFREPDGAnimalesFiltradosPreview;
  TotalAnimales : integer;

implementation

uses UPrincipal,uTiposGlobales, URepGeneral;

{$R *.dfm}

procedure TFREPDGAnimalesFiltradosPreview.QRCReporteAddReports(
  Sender: TObject);
begin
 // QRCReporte.Reports.Add(QREncabezado);
 // QRCReporte.Reports.Add(QRContenido);
end;

procedure TFREPDGAnimalesFiltradosPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
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

  cargarDatosPropietario();
end;

procedure TFREPDGAnimalesFiltradosPreview.QRContenidoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  TotalAnimales := 0;
end;

procedure TFREPDGAnimalesFiltradosPreview.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  inc(TotalAnimales);
end;

procedure TFREPDGAnimalesFiltradosPreview.QRLabel7Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := IntToStr(TotalAnimales);
end;

procedure TFREPDGAnimalesFiltradosPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRContenido.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;


procedure TFREPDGAnimalesFiltradosPreview.cargarDatosPropietario;
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
