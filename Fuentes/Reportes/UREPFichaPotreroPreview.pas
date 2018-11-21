unit UREPFichaPotreroPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QuickRpt, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QRCtrls, jpeg, QRExport, QRPDFFilt, ImgList, PngImageList, pngimage,
  JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFREPFichaPotreroPreview = class(TFUniversal)
    QRFichaPotrero: TQuickRep;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLPotrero: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLSupTotal: TQRLabel;
    QRLSupGana: TQRLabel;
    QRLSupAgric: TQRLabel;
    QRLRecFor: TQRLabel;
    QRLCabsTotal: TQRLabel;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLCat1A: TQRLabel;
    QRLCat2A: TQRLabel;
    QRLCat3A: TQRLabel;
    QRLCat3B: TQRLabel;
    QRLCat2B: TQRLabel;
    QRLCat1B: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    CantCat1A: TQRLabel;
    CantCat2A: TQRLabel;
    CantCat3A: TQRLabel;
    CabCat1A: TQRLabel;
    CabCat2A: TQRLabel;
    CabCat3A: TQRLabel;
    CantCat1B: TQRLabel;
    CantCat2B: TQRLabel;
    CantCat3B: TQRLabel;
    CabCat3B: TQRLabel;
    CabCat2B: TQRLabel;
    CabCat1B: TQRLabel;
    QRBand3: TQRBand;
    QRLabel23: TQRLabel;
    QRShape14: TQRShape;
    QRBand4: TQRBand;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRLCat4A: TQRLabel;
    CantCat4A: TQRLabel;
    CabCat4A: TQRLabel;
    QRLCat4B: TQRLabel;
    CantCat4B: TQRLabel;
    CabCat4B: TQRLabel;
    procedure FormShow(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLSupTotalPrint(sender: TObject; var Value: String);
  private
    procedure cargarDatosPropietario;
  public
    { Public declarations }
  end;

var
  FREPFichaPotreroPreview: TFREPFichaPotreroPreview;

implementation

uses URepGeneral, UPrincipal, UEveRecursoForrajero,UTiposGlobales;

{$R *.dfm}

procedure TFREPFichaPotreroPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRFichaPotrero.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPFichaPotreroPreview.QRBand1BeforePrint(
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

procedure TFREPFichaPotreroPreview.cargarDatosPropietario;
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

procedure TFREPFichaPotreroPreview.QRLSupTotalPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' ha';
end;

end.
