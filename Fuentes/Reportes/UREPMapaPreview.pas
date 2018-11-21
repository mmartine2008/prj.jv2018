unit UREPMapaPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, QRCtrls, jpeg, QuickRpt, PngImage, grimgctrl,
  JvExExtCtrls, JvImage, ImgList, PngImageList;

type
  TFREPMapaPreview = class(TFUniversal)
    QRMapa: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRImage2: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRShape35: TQRShape;
    QRShape30: TQRShape;
    QRShape78: TQRShape;
    QRSysData4: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRBand6: TQRBand;
    QRShape22: TQRShape;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRBand1: TQRBand;
    IBQImagenes: TIBQuery;
    QRBand2: TQRBand;
    QRDBImage1: TQRDBImage;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    IBQImagenesNOM_POT: TIBStringField;
    IBQImagenesHAS: TFloatField;
    IBQImagenesREC_FORRAJERO: TIBStringField;
    IBQImagenesIMAGEN: TBlobField;
    IBQImagenesCAB_HAS: TFloatField;
    IBQImagenesINFO_POT: TBlobField;
    IBQImagenesCANT_ANIMALES: TIntegerField;
    IBQImagenesULTIMO_EVE: TIBStringField;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRMapaGlobal: TQuickRep;
    QRBand3: TQRBand;
    QRLRenglon3: TQRLabel;
    QRLRenglon4: TQRLabel;
    QRImage1: TQRImage;
    QRLabel11: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa1: TQRLabel;
    QRLNombrePropietario1: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRImagenEmpresa1: TQRImage;
    QRBand4: TQRBand;
    QRShape11: TQRShape;
    QRLabel15: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel16: TQRLabel;
    QRLDatosAbajo3: TQRLabel;
    QRLDatosAbajo4: TQRLabel;
    QRBand7: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape13: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape16: TQRShape;
    QRIMapaGlobal: TQRImage;
    QRCRMapaGlobal: TQRCompositeReport;
    QRLNomEstab: TQRLabel;
    QRLCabTotal: TQRLabel;
    QRLSupAproxTotal: TQRLabel;
    QRLCabHasTotal: TQRLabel;
    QRLabel22: TQRLabel;
    QRLTotalPots: TQRLabel;
    QRLCategorias: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape12: TQRShape;
    procedure FormShow(Sender: TObject);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRCRMapaGlobalAddReports(Sender: TObject);
    procedure QRLSupAproxTotalPrint(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
  private
    procedure cargarDatosPropietario;
  public
    Tipo : Integer;
  end;

var
  FREPMapaPreview: TFREPMapaPreview;

implementation

{$R *.dfm}

uses
  URepGeneral, UPrincipal,UTiposGlobales;

procedure TFREPMapaPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  if Tipo = 0 then
    QRCRMapaGlobal.Preview
  else
    QRMapaGlobal.Preview;

  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPMapaPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon3.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon4.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
      QRLRenglon3.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon3.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon4.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
      QRLRenglon3.Caption := FPrincipal.Renspa;
    end;

  cargarDatosPropietario();
end;

procedure TFREPMapaPreview.cargarDatosPropietario;
var
  repGeneral : TFRepGeneral;
begin
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();
  QRLNombrePropietario.Caption:= '';
  QRLNombrePropietario1.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLEmpresa1.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';
  QRLDatosAbajo3.Caption:= '';
  QRLDatosAbajo4.Caption:= '';


  QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;

  if (Trim(repGeneral.getNombrePropietario) <> '') then
    begin
      QRLRenglon1.Enabled:= false;
      QRLNombrePropietario.Enabled:= true;

      QRLRenglon4.Enabled:= false;
      QRLNombrePropietario1.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;
       QRLRenglon4.Enabled:= true;
       QRLNombrePropietario1.Enabled:= false;
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
       QRImagenEmpresa1.Picture.LoadFromFile(repGeneral.getPathImage);
    end;

  QRLDatosAbajo3.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo4.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario1.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa1.Caption:= QRLEmpresa.Caption;

  repGeneral.Destroy;
end;

procedure TFREPMapaPreview.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' Has.';
end;

procedure TFREPMapaPreview.QRCRMapaGlobalAddReports(Sender: TObject);
begin
  inherited;
  QRCRMapaGlobal.Reports.Clear;
  QRCRMapaGlobal.Reports.Add(QRMapaGlobal);
  QRCRMapaGlobal.Reports.Add(QRMapa);
end;

procedure TFREPMapaPreview.QRLSupAproxTotalPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' Has.';
end;

procedure TFREPMapaPreview.FormCreate(Sender: TObject);
begin
  inherited;
  tipo := 0;
end;

end.
