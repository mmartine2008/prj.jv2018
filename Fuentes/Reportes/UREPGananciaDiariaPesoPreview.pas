unit UREPGananciaDiariaPesoPreview;

interface
//{$DEFINE EC}
//{$DEFINE DEMO}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, QRCtrls, QuickRpt, DB,
  IBCustomDataSet, IBQuery, jpeg, StdCtrls, IBStoredProc, DataExport,
  DataToXLS, WinXP, QRPDFFilt, QRWebFilt, QRExport, ImgList, PngImageList,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFREPGananciaDiariaPesoPreview = class(TFUniversal)
    QRGanaciaDiaria: TQuickRep;
    QRBColumnHeaderPlanilla: TQRGroup;
    QRLRPAnimal: TQRLabel;
    QRSColumnHeaderPlanilla: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRBDetailPlanilla: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBGFgrilla: TQRBand;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRHTMLFilter1: TQRHTMLFilter;
    QRBand3: TQRBand;
    QRLD: TQRLabel;
    QRLDesde: TQRLabel;
    QRLH: TQRLabel;
    QRLHasta: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLG: TQRLabel;
    QRLGrupo: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLUltimaGanancia: TQRLabel;
    QRLGananciaDestete: TQRLabel;
    QRLGananciaAnio: TQRLabel;
    QRLGananciaAdulto: TQRLabel;
    QRLG2: TQRLabel;
    QRLGrupo2: TQRLabel;
    QRLG1: TQRLabel;
    QRLGrupo1: TQRLabel;
    QRLG3: TQRLabel;
    QRLGrupo3: TQRLabel;
    QRShape3: TQRShape;
    QRLGrupo4: TQRLabel;
    QRLA: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
  private
    procedure cargarDatosPropietario();
  public
  end;

var
  FREPGananciaDiariaPesoPreview: TFREPGananciaDiariaPesoPreview;

implementation

uses UPrincipal, uTiposGlobales,UREPGananciaDiariaPeso, URepGeneral;

{$R *.dfm}

procedure TFREPGananciaDiariaPesoPreview.QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
{  QRLEstablecimientos.Top:= 3;
  QRLRenglon1.Top:= 24;
  QRLRenglon2.Top:= 42;
  QRShape1.Top:= 60;
  QRSysData1.Top:= 62;
  QRLabel24.Enabled:= false;
  QRLabel25.Enabled:= false;
  //QRLabel61.Top:= 48;
  QRShape2.Top:= 80;
  QRBand1.Height:= 83;
  QRLabel4.Top:= 58;
  QRLabel4.Left:= 99;
  QRShape3.Enabled:= false;
  QRShape3.Top:= 80;
  QRImage3.Enabled:= false;  }

{  {$IFDEF UCC}
 {   QRImage3.Enabled:= true;
    QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
    QRLEstablecimientos.Top:= 91;
    QRLRenglon1.Top:= 112;
    QRLRenglon2.Top:= 130;
    QRShape1.Top:= 148;
    QRSysData1.Top:= 150;
    QRLabel24.Enabled:= true;
    QRLabel25.Enabled:= true;

    QRBand1.Height:= 179;
    QRLabel4.Top:= 146;
    QRLabel4.Left:= 241;
    QRShape3.Enabled:= true;
    QRShape3.Top:= 174; }
//  {$ENDIF}

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



procedure TFREPGananciaDiariaPesoPreview.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (Value = '0') then
    Value := '';
end;

procedure TFREPGananciaDiariaPesoPreview.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (Value = '0') then
    Value := '';
end;

procedure TFREPGananciaDiariaPesoPreview.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (Value = '0') then
    Value := '';
end;

procedure TFREPGananciaDiariaPesoPreview.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (Value = '0') then
    Value := '';
end;

procedure TFREPGananciaDiariaPesoPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRGanaciaDiaria.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPGananciaDiariaPesoPreview.cargarDatosPropietario;
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
