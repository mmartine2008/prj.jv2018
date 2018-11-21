unit URepInseminacionesPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QRCtrls, jpeg, QuickRpt, QRExport, QRPDFFilt,QRPrntr, JvExControls,
  JvLabel, PngImage, ImgList, PngImageList, JvGIF, JvExExtCtrls, JvImage;

type
  TFRepInseminacionesPreview = class(TFUniversal)
    QRInseminaciones1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel21: TQRLabel;
    QRShape19: TQRShape;
    QRBand3: TQRBand;
    QRITotales: TQRImage;
    QRLabel31: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRICC: TQRImage;
    QRIGDR: TQRImage;
    QRBand4: TQRBand;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRInseminaciones2: TQuickRep;
    QRBand5: TQRBand;
    QRImage2: TQRImage;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRBand6: TQRBand;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel8: TQRLabel;
    QRBand7: TQRBand;
    QRLabel9: TQRLabel;
    QRShape5: TQRShape;
    QRIInseminador: TQRImage;
    QRIMetodo: TQRImage;
    QRObservacviones: TQRMemo;
    QRLabel25: TQRLabel;
    QRShape23: TQRShape;
    QRShape26: TQRShape;
    QRInseminaciones3: TQuickRep;
    QRBand8: TQRBand;
    QRImage3: TQRImage;
    QRLabel10: TQRLabel;
    QRShape7: TQRShape;
    QRBand9: TQRBand;
    QRShape9: TQRShape;
    QRLabel14: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel15: TQRLabel;
    QRBand11: TQRBand;
    QRLabel16: TQRLabel;
    QRShape10: TQRShape;
    QRLabel17: TQRLabel;
    QRShape11: TQRShape;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    QRLabel19: TQRLabel;
    QRShape14: TQRShape;
    QRLabel20: TQRLabel;
    QRShape15: TQRShape;
    QRLabel27: TQRLabel;
    QRShape16: TQRShape;
    QRLabel28: TQRLabel;
    QRShape27: TQRShape;
    QRLabel32: TQRLabel;
    QRShape17: TQRShape;
    QRLabel33: TQRLabel;
    QRShape29: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape18: TQRShape;
    QRBand12: TQRBand;
    QRDBTRP: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape39: TQRShape;
    QRCRInseminaciones: TQRCompositeReport;
    QRLabel22: TQRLabel;
    QRBand2: TQRBand;
    QRShape36: TQRShape;
    QRShape35: TQRShape;
    QRShape34: TQRShape;
    QRShape33: TQRShape;
    QRShape12: TQRShape;
    QRShape32: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLServicio: TQRLabel;
    QRLTipo: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    CC1: TQRLabel;
    CC2: TQRLabel;
    CC3: TQRLabel;
    CC4: TQRLabel;
    CC5: TQRLabel;
    CC6: TQRLabel;
    CC7: TQRLabel;
    CC8: TQRLabel;
    GDR1: TQRLabel;
    CC9: TQRLabel;
    GDR2: TQRLabel;
    GDR3: TQRLabel;
    GDR4: TQRLabel;
    GDR5: TQRLabel;
    Ins1: TQRLabel;
    Ins2: TQRLabel;
    Ins3: TQRLabel;
    Ins4: TQRLabel;
    Ins5: TQRLabel;
    Metodo1: TQRLabel;
    Metodo2: TQRLabel;
    Metodo3: TQRLabel;
    Metodo4: TQRLabel;
    Metodo5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape3: TQRShape;
    QRSysData11: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLabel13: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRShape2: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa3: TQRLabel;
    QRLNombrePropietario3: TQRLabel;
    QRLRenglon4: TQRLabel;
    QRLRenglon3: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRImagenEmpresa3: TQRImage;
    QRLabel43: TQRLabel;
    QRLDatosAbajo13: TQRLabel;
    QRLDatosAbajo23: TQRLabel;
    QRShape8: TQRShape;
    QRSysData3: TQRSysData;
    QRLEmpresa5: TQRLabel;
    QRLNombrePropietario5: TQRLabel;
    QRLRenglon6: TQRLabel;
    QRLRenglon5: TQRLabel;
    QRLEstablecimientos3: TQRLabel;
    QRImagenEmpresa5: TQRImage;
    QRLabel44: TQRLabel;
    QRLDatosAbajo15: TQRLabel;
    QRLDatosAbajo25: TQRLabel;
    QRToros: TQuickRep;
    QRBand10: TQRBand;
    QRLRenglon8: TQRLabel;
    QRImage4: TQRImage;
    QRLabel39: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRSysData5: TQRSysData;
    QRLEmpresa6: TQRLabel;
    QRLNombrePropietario6: TQRLabel;
    QRLRenglon7: TQRLabel;
    QRLEstablecimiento6: TQRLabel;
    QRImage5: TQRImage;
    QRLabel46: TQRLabel;
    QRBand13: TQRBand;
    QRShape57: TQRShape;
    QRLabel47: TQRLabel;
    QRSysData7: TQRSysData;
    QRLabel48: TQRLabel;
    QRLDatosAbajo16: TQRLabel;
    QRLDatosAbajo26: TQRLabel;
    QRBand14: TQRBand;
    QRIToro: TQRImage;
    QRLabel51: TQRLabel;
    QRShape74: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel52: TQRLabel;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape54: TQRShape;
    Toro5: TQRLabel;
    QRShape53: TQRShape;
    Toro4: TQRLabel;
    Toro3: TQRLabel;
    QRShape51: TQRShape;
    Toro2: TQRLabel;
    Toro1: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape73: TQRShape;
    QRShape78: TQRShape;
    QRShape80: TQRShape;
    QRShape82: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    Toro6: TQRLabel;
    Toro7: TQRLabel;
    Toro8: TQRLabel;
    Toro9: TQRLabel;
    Toro10: TQRLabel;
    QRShape90: TQRShape;
    procedure FormShow(Sender: TObject);
    procedure QRCRInseminacionesAddReports(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    Listado : Boolean;
  end;

var
  FRepInseminacionesPreview: TFRepInseminacionesPreview;

implementation

uses
  UPrincipal, URepInseminaciones, URepGeneral,UTiposGlobales;

{$R *.dfm}

procedure TFRepInseminacionesPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  QRCRInseminaciones.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFRepInseminacionesPreview.QRCRInseminacionesAddReports(
  Sender: TObject);
begin
  inherited;
  QRCRInseminaciones.Reports.Clear;
  QRCRInseminaciones.Reports.Add(QRInseminaciones1);
  QRCRInseminaciones.Reports.Add(QRToros);
  QRCRInseminaciones.Reports.Add(QRInseminaciones2);
  if Listado then
    QRCRInseminaciones.Reports.Add(QRInseminaciones3); 
end;

procedure TFRepInseminacionesPreview.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;

  QRImage2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;

  QRImage3.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos3.Caption := FPrincipal.NombreEstablecimiento;

  QRImage4.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\logo_80x50.jpg');
  QRLEstablecimiento6.Caption := FPrincipal.NombreEstablecimiento;

  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon3.Enabled := true;
      QRLRenglon4.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon3.Caption := FPrincipal.Renspa;

      QRLRenglon5.Enabled := true;
      QRLRenglon6.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon5.Caption := FPrincipal.Renspa;

      QRLRenglon7.Enabled := true;
      QRLRenglon8.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon7.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon3.Enabled := true;
      QRLRenglon4.Caption := FPrincipal.NombrePropietario;
      QRLRenglon3.Caption := FPrincipal.Renspa;

      QRLRenglon5.Enabled := true;
      QRLRenglon6.Caption := FPrincipal.NombrePropietario;
      QRLRenglon5.Caption := FPrincipal.Renspa;

      QRLRenglon7.Enabled := true;
      QRLRenglon8.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon7.Caption := FPrincipal.Renspa;
    end;

  cargarDatosPropietario();
end;

procedure TFRepInseminacionesPreview.cargarDatosPropietario;
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

      QRLRenglon4.Enabled:= false;
      QRLNombrePropietario3.Enabled:= true;

      QRLRenglon6.Enabled:= false;
      QRLNombrePropietario5.Enabled:= true;

      QRLRenglon7.Enabled:= false;
      QRLNombrePropietario6.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;

       QRLRenglon4.Enabled:= true;
       QRLNombrePropietario3.Enabled:= false;
       
       QRLRenglon6.Enabled:= true;
       QRLNombrePropietario5.Enabled:= false;

       QRLRenglon7.Enabled:= true;
       QRLNombrePropietario6.Enabled:= false;
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
       QRImagenEmpresa3.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa5.Picture.LoadFromFile(repGeneral.getPathImage);
    end;


  QRLNombrePropietario3.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa3.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo13.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo23.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario5.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa5.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo15.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo25.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario6.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa6.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo16.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo26.Caption:= QRLDatosAbajo2.Caption;

  repGeneral.Destroy;
end;

end.
