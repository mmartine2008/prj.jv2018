unit UREPDGPorcentajePrenezPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, QuickRpt, QRCtrls, DB,
  IBCustomDataSet, IBQuery, StdCtrls, jpeg, IBStoredProc, DataExport,
  DataToXLS, WinXP, QRPDFFilt, QRWebFilt, QRExport, ImgList, PngImageList,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFREPDGPorcentajePrenezPreview = class(TFUniversal)
    QRContenido: TQuickRep;
    QRBand1: TQRBand;
    QRITratadas: TQRImage;
    QRBand2: TQRBand;
    QRDBTRPAnimal: TQRDBText;
    QRIServidas: TQRImage;
    QRShape5: TQRShape;
    LabelGraficos: TQRLabel;
    QRBand3: TQRBand;
    LabelAnimales: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRCRPrenez: TQRCompositeReport;
    IBQAux: TIBQuery;
    QRBand5: TQRBand;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRGroup1: TQRGroup;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRHTMLFilter1: TQRHTMLFilter;
    QRShape7: TQRShape;
    QRLD: TQRLabel;
    QRLDesde: TQRLabel;
    QRLH: TQRLabel;
    QRLHasta: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLG: TQRLabel;
    QRLGrupo: TQRLabel;
    QRLRC: TQRLabel;
    QRLRodeoCategoria: TQRLabel;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRShape4: TQRShape;
    QRShape8: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLabel5: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    procedure QRCRPrenezAddReports(Sender: TObject);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FREPDGPorcentajePrenezPreview: TFREPDGPorcentajePrenezPreview;

implementation

uses UPrincipal,uTiposGlobales, URepGeneral;

{$R *.dfm}

procedure TFREPDGPorcentajePrenezPreview.QRCRPrenezAddReports(
  Sender: TObject);
begin
  inherited;
//  QRCRPrenez.Reports.Clear;
  //QRCRPrenez.Reports.Add(QREncabezado);
//  QRCRPrenez.Reports.Add(QRContenido);
end;

procedure TFREPDGPorcentajePrenezPreview.QRBEncabezadoPlanillaBeforePrint(
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

procedure TFREPDGPorcentajePrenezPreview.FormShow(Sender: TObject);
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

procedure TFREPDGPorcentajePrenezPreview.cargarDatosPropietario;
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
