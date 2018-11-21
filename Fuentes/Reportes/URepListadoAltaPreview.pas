 unit URepListadoAltaPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, ExtCtrls, jpeg,
  QRPDFFilt, QRWebFilt, QRExport;

type
  TFREPListadoAltaPreview = class(TForm)
    QR: TQuickRep;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    v: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand3: TQRBand;
    QRLCantidadHembras: TQRLabel;
    QRLCantidadToros: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabelTituloEstadoActual: TQRLabel;
    QRShape3: TQRShape;
    QRLFechaNacimiento: TQRLabel;
    QRLRPAnimal: TQRLabel;
    QRLPeso: TQRLabel;
    QRLEstadoReproductivo: TQRLabel;
    QRLCronoDentaria: TQRLabel;
    QRLGDR: TQRLabel;
    QRLCondCorporal: TQRLabel;
    QRLEstadoLactacion: TQRLabel;
    QRShape4: TQRShape;
    QRBand4: TQRBand;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRLDta: TQRLabel;
    QRDBDta: TQRDBText;
    QRHTMLFilter1: TQRHTMLFilter;
    QRBand1: TQRBand;
    QRLD: TQRLabel;
    QRLDesde: TQRLabel;
    QRLH: TQRLabel;
    QRLHasta: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    procedure vPrint(sender: TObject; var Value: String);
    procedure QRLNombreEstablecimientoPrint(sender: TObject;
      var Value: String);
    procedure QRLNombreVetePrint(sender: TObject; var Value: String);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();    
  public
    { Public declarations }
    procedure Configurar(desde, hasta: TDateTime);
  end;

var
  FREPListadoAltaPreview: TFREPListadoAltaPreview;

implementation

uses UPrincipal,uTiposGlobales, UCartel, URepListadoAlta, URepGeneral, UTraduccion;

{$R *.dfm}

{ TFREPListadoAltaPreview }

procedure TFREPListadoAltaPreview.Configurar(desde, hasta: TDateTime );
begin

  QRLCantidadHembras.Caption:= Traducir('Cantidad de hembras: ')+ IntToStr(FREPListadoAlta.getCantHembras);

  QRLCantidadToros.Caption := Traducir('Cantidad de machos: ')+ IntToStr(FREPListadoAlta.getCantMachos);

  QRLDesde.Caption := DateToStr(desde);
  QRLHasta.Caption := DateToStr(hasta);

end;


// solo para mostrar la unidad de peso
procedure TFREPListadoAltaPreview.vPrint(sender: TObject;
  var Value: String);
begin
  Value := Value + ' KGs';
end;

procedure TFREPListadoAltaPreview.QRLNombreEstablecimientoPrint(
  sender: TObject; var Value: String);
begin
  Value := FPrincipal.NombreEstablecimiento;
end;

procedure TFREPListadoAltaPreview.QRLNombreVetePrint(sender: TObject;
  var Value: String);
begin
  Value := FPrincipal.NombreVeterinario;
end;

procedure TFREPListadoAltaPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var path: String;
begin
  path:= ExtractFilePath(Application.ExeName);
  QRImage2.Picture.LoadFromFile(path+'imagenes\logo_80x50.jpg');
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

procedure TFREPListadoAltaPreview.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if Value <> '0' then
    Value := '$ '+Value
  else
    Value := ' ';
end;

procedure TFREPListadoAltaPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  QR.Preview;;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPListadoAltaPreview.cargarDatosPropietario;
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
