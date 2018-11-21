unit UREPInfoMortandadPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, QRCtrls, jpeg,
  QuickRpt, UPrincipal, QRExport, QRPDFFilt, IBQuery, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls,
  JvImage;

type
  TFREPInfoMortandadPreview = class(TFUniversal)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRIDistMuerteEnfermedad: TQRImage;
    QRIDistMuerteCategoria: TQRImage;
    QRShape2: TQRShape;
    QRLTipo: TQRLabel;
    QRBand4: TQRBand;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRCCRRep: TQRCompositeReport;
    QuickRep3: TQuickRep;
    QRBand7: TQRBand;
    QRImage3: TQRImage;
    QRLabel61: TQRLabel;
    QRBand8: TQRBand;
    QRShape7: TQRShape;
    QRLabel65: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel66: TQRLabel;
    Grupo: TQRLabel;
    QRBTabList: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLTitulo: TQRLabel;
    QRLFecha: TQRLabel;
    Fecha: TQRLabel;
    QRLFiltro: TQRLabel;
    TipoF: TQRLabel;
    Filtro: TQRLabel;
    QRLabel1: TQRLabel;
    QRLTotal: TQRLabel;
    QRShape10: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape8: TQRShape;
    QRLabel84: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape22: TQRShape;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRShape23: TQRShape;
    QRLCantMuertos: TQRLabel;
    QRLExistencia: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape4: TQRShape;
    QRLPromedioMortandad: TQRLabel;
    QuickRep2: TQuickRep;
    QRBand3: TQRBand;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    QRBand5: TQRBand;
    QRIDistMuertesMensual: TQRImage;
    QRBand6: TQRBand;
    QRShape17: TQRShape;
    QRLabel30: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel31: TQRLabel;
    ChildBand1: TQRChildBand;
    QRMemo: TQRMemo;
    QRLabel81: TQRLabel;
    QRShape21: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRShape1: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa2: TQRLabel;
    QRLNombrePropietario2: TQRLabel;
    QRLRenglon9: TQRLabel;
    QRLRenglon8: TQRLabel;
    QRLEstablecimientos3: TQRLabel;
    QRImagenEmpresa2: TQRImage;
    QRShape5: TQRShape;
    QRSysData4: TQRSysData;
    QRLEmpresa3: TQRLabel;
    QRLNombrePropietario3: TQRLabel;
    QRLRenglon6: TQRLabel;
    QRLRenglon5: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRImagenEmpresa3: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRLDatosAbajo12: TQRLabel;
    QRLDatosAbajo22: TQRLabel;
    QRLDatosAbajo13: TQRLabel;
    QRLDatosAbajo23: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRCCRRepAddReports(Sender: TObject);
    procedure QRLabePrint(sender: TObject; var Value: String);
    procedure QRLPromedioMortandadPrint(sender: TObject;
      var Value: String);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();    
  public
    { Public declarations }
  end;

var
  FREPInfoMortandadPreview: TFREPInfoMortandadPreview;

implementation

uses UREPInfoMortandad, URepGeneral,UTiposGlobales;

{$R *.dfm}

procedure TFREPInfoMortandadPreview.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  Dir : String;
begin
  inherited;
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos3.Caption := FPrincipal.NombreEstablecimiento;

   if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon1.Enabled := true;
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
      QRLRenglon6.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon5.Caption := FPrincipal.Renspa;
      QRLRenglon9.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon8.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon1.Enabled := true;
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
      QRLRenglon6.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon5.Caption := FPrincipal.Renspa;
      QRLRenglon9.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon8.Caption := FPrincipal.Renspa;
    end;
  Dir := ExtractFilePath(Application.ExeName);
  QRIDistMuerteEnfermedad.Picture.LoadFromFile(Dir+'DistMuerEnfer.wmf');
  QRIDistMuerteCategoria.Picture.LoadFromFile(Dir+'DistMuerCateg.wmf');
  QRIDistMuertesMensual.Picture.LoadFromFile(Dir+'DistMuerMensual.wmf');

  cargarDatosPropietario();
end;

procedure TFREPInfoMortandadPreview.QRCCRRepAddReports(Sender: TObject);
begin
  inherited;
  QRCCRRep.Reports.Clear;
  QRCCRRep.Reports.Add(QuickRep1);
  QRCCRRep.Reports.Add(QuickRep2);  
  QRCCRRep.Reports.Add(QuickRep3);
end;

procedure TFREPInfoMortandadPreview.QRLabePrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+'%';
end;

procedure TFREPInfoMortandadPreview.QRLPromedioMortandadPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  Value:= Value + ' %';
end;

procedure TFREPInfoMortandadPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCCRRep.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPInfoMortandadPreview.cargarDatosPropietario;
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

      QRLRenglon9.Enabled:= false;
      QRLNombrePropietario2.Enabled:= true;
      QRLRenglon6.Enabled:= false;
      QRLNombrePropietario3.Enabled:= true;

    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;
       QRLRenglon9.Enabled:= true;
       QRLNombrePropietario2.Enabled:= false;
       QRLRenglon6.Enabled:= true;
       QRLNombrePropietario3.Enabled:= false;

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
       QRImagenEmpresa2.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa3.Picture.LoadFromFile(repGeneral.getPathImage);
    end;

  QRLDatosAbajo12.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo22.Caption:= QRLDatosAbajo2.Caption;

  QRLDatosAbajo13.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo23.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario2.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa2.Caption:= QRLEmpresa.Caption;

  QRLNombrePropietario3.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa3.Caption:= QRLEmpresa.Caption;

  repGeneral.Destroy;
end;

end.
