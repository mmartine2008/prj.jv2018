unit UREPListadoEventoPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, StdCtrls, ExtCtrls, QRCtrls,
  QuickRpt, jpeg, DB, IBCustomDataSet, IBQuery, IBStoredProc, DataExport,
  DataToXLS, WinXP, QRPDFFilt, QRWebFilt, QRExport, ImgList, PngImageList,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFREPListadoEventoPreview = class(TFUniversal)
    QRListado: TQuickRep;
    QRBColumnHeaderPlanilla: TQRGroup;
    Separador2: TQRShape;
    QRBDetailPlanilla: TQRBand;
    Separador3: TQRShape;
    QRBGFgrilla: TQRBand;
    QRBand4: TQRBand;
    Separador4: TQRShape;
    QRLabel4: TQRLabel;
    QRSDPagePlanilla: TQRSysData;
    QRLPagPlanilla: TQRLabel;
    IBQEventos: TIBQuery;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLTitulo: TQRLabel;
    SummaryBand1: TQRBand;
    QRLTotales: TQRLabel;
    QRLCAntidad: TQRLabel;
    QRHTMLFilter1: TQRHTMLFilter;
    QRBand1: TQRBand;
    QRLPeriodo: TQRLabel;
    QRLD: TQRLabel;
    QRLDesde: TQRLabel;
    QRLH: TQRLabel;
    QRLHasta: TQRLabel;
    QRLG: TQRLabel;
    QRLGrupo: TQRLabel;
    QRLProm: TQRLabel;
    QRLPromedio: TQRLabel;
    QRShape35: TQRShape;
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
    QRLabel1: TQRLabel;
    procedure QRLEstablecimientosPlanillaPrint(sender: TObject;
      var Value: String);
    procedure QRLVeterinarioPlanillaPrint(sender: TObject;
      var Value: String);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
  end;

var
  FREPListadoEventoPreview: TFREPListadoEventoPreview;

implementation

uses UPrincipal, URepGeneral, uTiposGlobales;

{$R *.dfm}

procedure TFREPListadoEventoPreview.QRLEstablecimientosPlanillaPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  Value := fprincipal.NombreEstablecimiento;
end;

procedure TFREPListadoEventoPreview.QRLVeterinarioPlanillaPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  Value := FPrincipal.NombreVeterinario;
end;

procedure TFREPListadoEventoPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var aux: String;
    i: Integer;
begin
  inherited;

{  QRLNombreEstablecimiento.Top:= 3;
  QRLRenglon1.Top:= 24;
  QRLRenglon2.Top:= 42;
  QRSEncabezadoPlanilla.Top:= 60;
  QRSD.Top:= 62;
  QRLabel33.Enabled:= false;
  QRLabel34.Enabled:= false;
  QRBEncabezadoPlanilla.Height:= 82;
  QRLTitulo.Top:= 56;
  QRLTitulo.Left:= 94;
  QRImage3.Enabled:= false;
  QRShape35.Top:= 80;   }

//  {$IFDEF UCC}
{    QRImage3.Enabled:= true;
    QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
    QRLNombreEstablecimiento.Top:= 91;
    QRLRenglon1.Top:= 112;
    QRLRenglon2.Top:= 130;
    QRSEncabezadoPlanilla.Top:= 148;
    QRSD.Top:= 150;
    QRLabel33.Enabled:= true;
    QRLabel34.Enabled:= true;
    QRBEncabezadoPlanilla.Height:= 179;
    QRLTitulo.Top:= 147;
    QRLTitulo.Left:= 14;
    QRShape35.Top:= 176; }
//  {$ENDIF}

  QRLabel1.Caption:= '';
  if (Length(QRLTitulo.Caption) > 20) then
    begin
      QRLabel1.Enabled:= true;
      aux:= '';
      i:= 10;
      while (i <= Length(QRLTitulo.Caption)) do
        begin
           if (QRLTitulo.Caption[i] = ' ') then
             begin
               QRLabel1.Caption:= Trim(Copy(QRLTitulo.Caption,i,Length(QRLTitulo.Caption) - i + 1));
               QRLTitulo.Caption:= Trim(Copy(QRLTitulo.Caption,1,i));
               i:= Length(QRLTitulo.Caption);
             end;
            inc(i);
        end;

      //QRLabel1.Caption:= aux;
    end
   else
     begin
        QRLabel1.Enabled:= false;
     end;

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


procedure TFREPListadoEventoPreview.SummaryBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLCantidad.Caption := IntToStr(QRListado.DataSet.RecordCount);
end;

procedure TFREPListadoEventoPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRListado.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPListadoEventoPreview.cargarDatosPropietario;
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

