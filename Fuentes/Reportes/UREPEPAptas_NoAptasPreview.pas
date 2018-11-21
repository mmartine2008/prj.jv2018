unit UREPEPAptas_NoAptasPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QRCtrls, QuickRpt, DB, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, ExtCtrls, StdCtrls, jpeg, UREPSimple, IBStoredProc,
  Buttons, DataExport, DataToXLS, QRPDFFilt, QRWebFilt, QRExport, WinXP,
  ImgList, PngImageList, JvExControls, JvLabel, JvGIF;

type
  TFREPDEPAptas_NoAptasPreview = class(TFUniversal)
    QREncabezado: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    LabelTitulo: TQRLabel;
    QRShape6: TQRShape;
    QRCReporte: TQRCompositeReport;
    QRRTFFilter1: TQRRTFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRBand4: TQRBand;
    QRLPeriodo: TQRLabel;
    QRLG: TQRLabel;
    QRLGrupo: TQRLabel;
    QRLDesde: TQRLabel;
    QRLD: TQRLabel;
    QRLH: TQRLabel;
    QRLHasta: TQRLabel;
    LabelGraficos: TQRLabel;
    QRShape5: TQRShape;
    QRShape3: TQRShape;
    QRIAptasNoAptas: TQRImage;
    QRDetalle1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRBand7: TQRBand;
    QRShape11: TQRShape;
    QRLabel16: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QRShape7: TQRShape;
    QRLabel7: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRIAreaPTotal: TQRImage;
    QRIAreaPAptas: TQRImage;
    QRDetalle2: TQuickRep;
    QRBand5: TQRBand;
    QRImage3: TQRImage;
    QRLabel40: TQRLabel;
    QRShape44: TQRShape;
    QRBand6: TQRBand;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape37: TQRShape;
    QRShape33: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape38: TQRShape;
    QRLabel36: TQRLabel;
    QRShape39: TQRShape;
    QRLabel35: TQRLabel;
    QRShape40: TQRShape;
    QRShape42: TQRShape;
    QRShape41: TQRShape;
    QRShape45: TQRShape;
    QRIFrameTotal: TQRImage;
    QRIFrameAptas: TQRImage;
    QRShape46: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape47: TQRShape;
    QRLRaza1: TQRLabel;
    QRLRaza2: TQRLabel;
    QRLRaza3: TQRLabel;
    QRLRaza4: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape48: TQRShape;
    QRLabel53: TQRLabel;
    QRShape49: TQRShape;
    QRLabel54: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRDetalle3: TQuickRep;
    QRBand9: TQRBand;
    QRImage4: TQRImage;
    QRLabel47: TQRLabel;
    QRShape60: TQRShape;
    QRBand11: TQRBand;
    QRIFrameAreaP: TQRImage;
    Cant1Aptas: TQRLabel;
    Por1Aptas: TQRLabel;
    Cant1NoAptas: TQRLabel;
    Por1NoAptas: TQRLabel;
    Cant1Total: TQRLabel;
    Por1Total: TQRLabel;
    Cant2Aptas: TQRLabel;
    Por2Aptas: TQRLabel;
    Cant2NoAptas: TQRLabel;
    Por2NoAptas: TQRLabel;
    Cant2Total: TQRLabel;
    Por2Total: TQRLabel;
    Por3Total: TQRLabel;
    Cant3Total: TQRLabel;
    Por3NoAptas: TQRLabel;
    Cant3NoAptas: TQRLabel;
    Por3Aptas: TQRLabel;
    Cant3Aptas: TQRLabel;
    Cant4Aptas: TQRLabel;
    Por4Aptas: TQRLabel;
    Cant4NoAptas: TQRLabel;
    Por4NoAptas: TQRLabel;
    Cant4Total: TQRLabel;
    Por4Total: TQRLabel;
    CantAptas: TQRLabel;
    PorAptas: TQRLabel;
    CantNoAptas: TQRLabel;
    PorNoAptas: TQRLabel;
    CantTotal: TQRLabel;
    PorTotal: TQRLabel;
    AnchoAptas: TQRLabel;
    AnchoNoAptas: TQRLabel;
    AnchoTotal: TQRLabel;
    AltoAptas: TQRLabel;
    AltoNoAptas: TQRLabel;
    AltoTotal: TQRLabel;
    APAptas: TQRLabel;
    APNoAptas: TQRLabel;
    APTotal: TQRLabel;
    APMinAptas: TQRLabel;
    APMinNoAptas: TQRLabel;
    APMinTotal: TQRLabel;
    APMaxAptas: TQRLabel;
    APMaxNoAptas: TQRLabel;
    APMaxTotal: TQRLabel;
    PesoAptas: TQRLabel;
    PesoNoAptas: TQRLabel;
    PesoTotal: TQRLabel;
    PesoMinAptas: TQRLabel;
    PesoMinNoAptas: TQRLabel;
    PesoMinTotal: TQRLabel;
    PesoMaxAptas: TQRLabel;
    PesoMaxNoAptas: TQRLabel;
    PesoMaxTotal: TQRLabel;
    FrameAptas: TQRLabel;
    FrameNoAptas: TQRLabel;
    FrameTotal: TQRLabel;
    CantR1Aptas: TQRLabel;
    PorR1Aptas: TQRLabel;
    CantR1NoAptas: TQRLabel;
    PorR1NoAptas: TQRLabel;
    CantR1Total: TQRLabel;
    PorR1Total: TQRLabel;
    CantR2Aptas: TQRLabel;
    PorR2Aptas: TQRLabel;
    CantR2NoAptas: TQRLabel;
    PorR2NoAptas: TQRLabel;
    CantR2Total: TQRLabel;
    PorR2Total: TQRLabel;
    CantR3Aptas: TQRLabel;
    PorR3Aptas: TQRLabel;
    CantR3NoAptas: TQRLabel;
    PorR3NoAptas: TQRLabel;
    CantR3Total: TQRLabel;
    PorR3Total: TQRLabel;
    CantR4Aptas: TQRLabel;
    PorR4Aptas: TQRLabel;
    CantR4NoAptas: TQRLabel;
    PorR4NoAptas: TQRLabel;
    CantR4Total: TQRLabel;
    PorR4Total: TQRLabel;
    CantRAptas: TQRLabel;
    PorRAptas: TQRLabel;
    CantRNoAptas: TQRLabel;
    PorRNoAptas: TQRLabel;
    CantRTotal: TQRLabel;
    PorRTotal: TQRLabel;
    QRListado: TQuickRep;
    QRBand12: TQRBand;
    QRImage5: TQRImage;
    QRLabel2: TQRLabel;
    QRShape62: TQRShape;
    QRBand2: TQRBand;
    QRShape63: TQRShape;
    QRLabel3: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRBand3: TQRBand;
    QRShape64: TQRShape;
    QRLabel4: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel41: TQRLabel;
    QRBand10: TQRBand;
    QRShape65: TQRShape;
    QRLabel43: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel44: TQRLabel;
    QRBand8: TQRBand;
    QRShape66: TQRShape;
    QRLabel48: TQRLabel;
    QRSysData7: TQRSysData;
    QRLabel49: TQRLabel;
    QRBand13: TQRBand;
    QRShape67: TQRShape;
    QRLabel50: TQRLabel;
    QRSysData8: TQRSysData;
    QRLabel55: TQRLabel;
    QRBand14: TQRBand;
    QRLabel56: TQRLabel;
    QRBand15: TQRBand;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRBand16: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape80: TQRShape;
    QRShape82: TQRShape;
    QRLabel39: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape78: TQRShape;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRShape79: TQRShape;
    QRLabel67: TQRLabel;
    QRShape81: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRLabel63: TQRLabel;
    QRLPorNoAptas: TQRLabel;
    QRShape85: TQRShape;
    QRSysData11: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLabel68: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa11: TQRLabel;
    QRLNombrePropietario11: TQRLabel;
    QRLRenglon21: TQRLabel;
    QRLRenglon11: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRImagenEmpresa11: TQRImage;
    QRLabel74: TQRLabel;
    QRLDatosAbajo11: TQRLabel;
    QRLDatosAbajo21: TQRLabel;
    QRShape43: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa12: TQRLabel;
    QRLNombrePropietario12: TQRLabel;
    QRLRenglon22: TQRLabel;
    QRLRenglon12: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRImagenEmpresa12: TQRImage;
    QRLabel75: TQRLabel;
    QRLDatosAbajo12: TQRLabel;
    QRLDatosAbajo22: TQRLabel;
    QRShape59: TQRShape;
    QRSysData3: TQRSysData;
    QRLEmpresa13: TQRLabel;
    QRLNombrePropietario13: TQRLabel;
    QRLRenglon23: TQRLabel;
    QRLRenglon13: TQRLabel;
    QRLEstablecimientos3: TQRLabel;
    QRImagenEmpresa13: TQRImage;
    QRLabel76: TQRLabel;
    QRLDatosAbajo13: TQRLabel;
    QRLDatosAbajo23: TQRLabel;
    QRLDatosAbajo14: TQRLabel;
    QRLDatosAbajo24: TQRLabel;
    QRShape61: TQRShape;
    QRSysData4: TQRSysData;
    QRLEmpresa14: TQRLabel;
    QRLNombrePropietario14: TQRLabel;
    QRLRenglon24: TQRLabel;
    QRLRenglon14: TQRLabel;
    QRLEstablecimientos4: TQRLabel;
    QRImagenEmpresa14: TQRImage;
    QRLabel77: TQRLabel;
    procedure QRCReporteAddReports(Sender: TObject);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private
    { Private declarations }
    procedure cargarDatosPropietario();       
  public
    NroPagina: integer;{ Public declarations }
    Detalle, Listado : Boolean;
  end;

var
  FREPDEPAptas_NoAptasPreview: TFREPDEPAptas_NoAptasPreview;

implementation

uses UPrincipal,uTiposGlobales, UFREPEPAptas_NoAptas, URepGeneral;

{$R *.dfm}

procedure TFREPDEPAptas_NoAptasPreview.QRCReporteAddReports(Sender: TObject);
begin
  QRCReporte.Reports.Clear;
  QRCReporte.Reports.Add(QREncabezado);
  if Detalle then
  begin
    QRCReporte.Reports.Add(QRDetalle1);
    QRCReporte.Reports.Add(QRDetalle2);
    QRCReporte.Reports.Add(QRDetalle3);
  end;
  if Listado then
    QRCReporte.Reports.Add(QRListado);
end;

procedure TFREPDEPAptas_NoAptasPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage4.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage5.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos3.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos4.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon11.Enabled := true;
      QRLRenglon21.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon11.Caption := FPrincipal.Renspa;
      QRLRenglon12.Enabled := true;
      QRLRenglon22.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon12.Caption := FPrincipal.Renspa;
      QRLRenglon13.Enabled := true;
      QRLRenglon23.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon13.Caption := FPrincipal.Renspa;
      QRLRenglon14.Enabled := true;
      QRLRenglon24.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon14.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon11.Enabled := true;
      QRLRenglon21.Caption := FPrincipal.NombrePropietario;
      QRLRenglon11.Caption := FPrincipal.Renspa;
      QRLRenglon12.Enabled := true;
      QRLRenglon22.Caption := FPrincipal.NombrePropietario;
      QRLRenglon12.Caption := FPrincipal.Renspa;
      QRLRenglon13.Enabled := true;
      QRLRenglon23.Caption := FPrincipal.NombrePropietario;
      QRLRenglon13.Caption := FPrincipal.Renspa;
      QRLRenglon14.Enabled := true;
      QRLRenglon24.Caption := FPrincipal.NombrePropietario;
      QRLRenglon14.Caption := FPrincipal.Renspa;
    end;

  cargarDatosPropietario();
end;

procedure TFREPDEPAptas_NoAptasPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCReporte.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPDEPAptas_NoAptasPreview.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' cm²';
end;

procedure TFREPDEPAptas_NoAptasPreview.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' Kgs';
end;

procedure TFREPDEPAptas_NoAptasPreview.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if Value = 'S' then
    Value := 'Si';
  if Value = 'N' then
    Value := 'No'
end;

procedure TFREPDEPAptas_NoAptasPreview.cargarDatosPropietario;
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

      QRLRenglon21.Enabled:= false;
      QRLNombrePropietario11.Enabled:= true;

      QRLRenglon22.Enabled:= false;
      QRLNombrePropietario12.Enabled:= true;
      QRLRenglon23.Enabled:= false;
      QRLNombrePropietario13.Enabled:= true;
      QRLRenglon24.Enabled:= false;
      QRLNombrePropietario14.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;

       QRLRenglon21.Enabled:= true;
       QRLNombrePropietario11.Enabled:= false;
       
       QRLRenglon22.Enabled:= true;
       QRLNombrePropietario12.Enabled:= false;
       QRLRenglon23.Enabled:= true;
       QRLNombrePropietario13.Enabled:= false;
       QRLRenglon24.Enabled:= true;
       QRLNombrePropietario14.Enabled:= false;
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
       QRImagenEmpresa11.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa12.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa13.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa14.Picture.LoadFromFile(repGeneral.getPathImage);
    end;


  QRLNombrePropietario11.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa11.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo11.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo21.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario12.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa12.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo12.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo22.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario13.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa13.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo13.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo23.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario14.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa14.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo14.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo24.Caption:= QRLDatosAbajo2.Caption;

  repGeneral.Destroy;
end;

end.
