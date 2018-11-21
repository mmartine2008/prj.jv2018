unit UREPDGVersusPrenezPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QuickRpt, DB, IBCustomDataSet, IBQuery, ActnList,
  QRCtrls, ComCtrls, ExtCtrls, StdCtrls, UREPSimple, jpeg, IBStoredProc,
  DataExport, DataToXLS, WinXP, QRPDFFilt, QRWebFilt, QRExport, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  JvGIF;

type
  TFREPDGVersusPrenezPreview = class(TFUniversal)
    QRGrafico: TQuickRep;
    QRBand1: TQRBand;
    QRIVersusVacias: TQRImage;
    QRShape5: TQRShape;
    LabelGraficos: TQRLabel;
    QRAnimales: TQuickRep;
    QRBand2: TQRBand;
    QRDBTRPAnimal: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape4: TQRShape;
    QRTabla: TQuickRep;
    QRBTabla: TQRBand;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QR00: TQRLabel;
    QR01: TQRLabel;
    QR02: TQRLabel;
    QR03: TQRLabel;
    QR06: TQRLabel;
    QR04: TQRLabel;
    QR05: TQRLabel;
    QRLTituloTabla: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRIVersusPreniadas: TQRImage;
    QRLabel6: TQRLabel;
    QREncabezado: TQuickRep;
    QRBand4: TQRBand;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRBand5: TQRBand;
    LabelAnimales: TQRLabel;
    QRShape1: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRBEncabezadoPlanilla: TQRBand;
    QRHTMLFilter1: TQRHTMLFilter;
    QRLD: TQRLabel;
    QRLDesde: TQRLabel;
    QRLH: TQRLabel;
    QRLHasta: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLG: TQRLabel;
    QRLGrupo: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    LabelTitulo: TQRLabel;
    QRShape14: TQRShape;
    QRImage2: TQRImage;
    LabelTitulo2: TQRLabel;
    QRShape16: TQRShape;
    QRBand3: TQRBand;
    QRImage3: TQRImage;
    LabelTitulo3: TQRLabel;
    QRShape17: TQRShape;
    QRBand6: TQRBand;
    QRImage4: TQRImage;
    LabelTitulo4: TQRLabel;
    QRShape19: TQRShape;
    QRCR: TQRCompositeReport;
    QRShape20: TQRShape;
    QRSysData3: TQRSysData;
    QRLEmpresa12: TQRLabel;
    QRLNombrePropietario12: TQRLabel;
    QRLRenglon12: TQRLabel;
    QRLRenglon22: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRImagenEmpresa12: TQRImage;
    QRShape21: TQRShape;
    QRSysData4: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRShape15: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa13: TQRLabel;
    QRLNombrePropietario13: TQRLabel;
    QRLRenglon13: TQRLabel;
    QRLRenglon23: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRImagenEmpresa13: TQRImage;
    QRShape18: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa14: TQRLabel;
    QRLNombrePropietario14: TQRLabel;
    QRLRenglon14: TQRLabel;
    QRLRenglon24: TQRLabel;
    QRLEstablecimientos3: TQRLabel;
    QRImagenEmpresa14: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    procedure QRLNombreEstablecimientoPrint(sender: TObject;
      var Value: String);
    procedure QRLNombreVetePrint(sender: TObject; var Value: String);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure QRCRAddReports(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    Grafico, Tabla : Boolean;
  end;

var
  FREPDGVersusPrenezPreview: TFREPDGVersusPrenezPreview;

implementation

uses UREPDGVersusPrenez, UPrincipal, URepGeneral, UTiposGlobales;

{$R *.dfm}

procedure TFREPDGVersusPrenezPreview.QRLNombreEstablecimientoPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  Value := fprincipal.NombreEstablecimiento;
end;

procedure TFREPDGVersusPrenezPreview.QRLNombreVetePrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := FPrincipal.NombreVeterinario;
end;

procedure TFREPDGVersusPrenezPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var i : Integer;
begin
  inherited;

  QRLabel7.Caption:= '';
  QRLabel9.Caption:= '';
  QRLabel10.Caption:= '';
  QRLabel11.Caption:= '';
  if (Length(LabelTitulo.Caption) > 20) then
    begin
      QRLabel7.Enabled:= true;
      QRLabel9.Enabled:= true;
      QRLabel10.Enabled:= true;
      QRLabel11.Enabled:= true;
      //aux:= '';
      i:= 18;
      while (i <= Length(LabelTitulo.Caption)) do
        begin
           if (LabelTitulo.Caption[i] = ' ') then
             begin
               QRLabel7.Caption:= Trim(Copy(LabelTitulo.Caption,i,Length(LabelTitulo.Caption) - i + 1));
               LabelTitulo.Caption:= Trim(Copy(LabelTitulo.Caption,1,i));
               QRLabel9.Caption:= QRLabel7.Caption;
               LabelTitulo2.Caption:= LabelTitulo.Caption;
               QRLabel10.Caption:= QRLabel7.Caption;
               LabelTitulo3.Caption:= LabelTitulo.Caption;
               QRLabel11.Caption:= QRLabel7.Caption;
               LabelTitulo4.Caption:= LabelTitulo.Caption;

               i:= Length(LabelTitulo.Caption);
             end;
            inc(i);
        end;

      //QRLabel1.Caption:= aux;
    end
   else
     begin
        QRLabel7.Enabled:= false;
        QRLabel9.Enabled:= false;
        QRLabel10.Enabled:= false;
        QRLabel11.Enabled:= false;
     end;

  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;

  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;

  QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;

  QRImage4.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos3.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon22.Enabled := true;
      QRLRenglon12.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon22.Caption := FPrincipal.Renspa;

      QRLRenglon23.Enabled := true;
      QRLRenglon13.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon23.Caption := FPrincipal.Renspa;

      QRLRenglon24.Enabled := true;
      QRLRenglon14.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon24.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon22.Enabled := true;
      QRLRenglon12.Caption := FPrincipal.NombrePropietario;
      QRLRenglon22.Caption := FPrincipal.Renspa;

      QRLRenglon23.Enabled := true;
      QRLRenglon13.Caption := FPrincipal.NombrePropietario;
      QRLRenglon23.Caption := FPrincipal.Renspa;

      QRLRenglon24.Enabled := true;
      QRLRenglon14.Caption := FPrincipal.NombrePropietario;
      QRLRenglon24.Caption := FPrincipal.Renspa;
    end;

  cargarDatosPropietario();
end;

procedure TFREPDGVersusPrenezPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCR.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPDGVersusPrenezPreview.QRCRAddReports(Sender: TObject);
begin
  inherited;
  QRCR.Reports.Clear;
  QRCR.Reports.Add(QREncabezado);
  if (Grafico) then
    QRCR.Reports.Add(QRGrafico);
  if (Tabla) then
    QRCR.Reports.Add(QRTabla);
  QRCR.Reports.Add(QRAnimales);
end;

procedure TFREPDGVersusPrenezPreview.cargarDatosPropietario;
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

      QRLRenglon12.Enabled:= false;
      QRLNombrePropietario12.Enabled:= true;
      QRLRenglon13.Enabled:= false;
      QRLNombrePropietario13.Enabled:= true;
      QRLRenglon14.Enabled:= false;
      QRLNombrePropietario14.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;
       QRLRenglon12.Enabled:= true;
       QRLNombrePropietario12.Enabled:= false;
       QRLRenglon13.Enabled:= true;
       QRLNombrePropietario13.Enabled:= false;
       QRLRenglon14.Enabled:= true;
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
       QRImagenEmpresa12.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa13.Picture.LoadFromFile(repGeneral.getPathImage);
       QRImagenEmpresa14.Picture.LoadFromFile(repGeneral.getPathImage);
    end;


  QRLNombrePropietario12.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa12.Caption:= QRLEmpresa.Caption;

  QRLNombrePropietario13.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa13.Caption:= QRLEmpresa.Caption;

  QRLNombrePropietario14.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa14.Caption:= QRLEmpresa.Caption;

  repGeneral.Destroy;
end;

end.
