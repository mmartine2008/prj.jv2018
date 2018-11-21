unit UREPListadoAnimalesExternosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QuickRpt, QRCtrls, jpeg, QRExport, QRPDFFilt, ImgList, PngImageList,
  JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls, JvImage;

type
  TFREPListadoAnimalesExternosPreview = class(TFUniversal)
    QRAnimalesExternos: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
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
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLSenasa: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    QRLCant: TQRLabel;
    QRShape13: TQRShape;
    QRLabel10: TQRLabel;
    QRShape14: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
  private
    procedure cargarDatosPropietario;
  public
    procedure AsignarDataSet(DS : TIBQuery);
  end;

var
  FREPListadoAnimalesExternosPreview: TFREPListadoAnimalesExternosPreview;

implementation

uses
  UREPGeneral, UPrincipal, UAbmPadresExternos,uTiposGlobales;

{$R *.dfm}

procedure TFREPListadoAnimalesExternosPreview.QRBEncabezadoPlanillaBeforePrint(
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

procedure TFREPListadoAnimalesExternosPreview.cargarDatosPropietario;
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

procedure TFREPListadoAnimalesExternosPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRAnimalesExternos.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPListadoAnimalesExternosPreview.AsignarDataSet(DS : TIBQuery);
begin
  QRAnimalesExternos.DataSet := DS;
  QRDBText1.DataSet := DS;
  QRDBText2.DataSet := DS;
  QRDBText3.DataSet := DS;
  QRDBText4.DataSet := DS;
  QRDBText5.DataSet := DS;
  QRDBText6.DataSet := DS;
  QRDBText8.DataSet := DS;
  QRDBText9.DataSet := DS;
  QRDBText11.DataSet := DS;
end;

end.
