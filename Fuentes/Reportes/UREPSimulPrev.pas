unit UREPSimulPrev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls,
  jpeg, PngImage, ExtCtrls, StdCtrls, JvGIF, QRCtrls, QuickRpt, ImgList,
  PngImageList, JvExControls, JvLabel;

type
  TFREPSimulPrev = class(TFUniversal)
    QRCRSimulador: TQRCompositeReport;
    QRCierreLote: TQuickRep;
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
    QRShape35: TQRShape;
    QRShape67: TQRShape;
    QRShape66: TQRShape;
    QRShape65: TQRShape;
    QRShape64: TQRShape;
    QRShape63: TQRShape;
    QRShape62: TQRShape;
    QRShape61: TQRShape;
    QRShape60: TQRShape;
    QRShape6: TQRShape;
    QRShape59: TQRShape;
    QRShape50: TQRShape;
    QRShape49: TQRShape;
    QRShape48: TQRShape;
    QRShape47: TQRShape;
    QRShape46: TQRShape;
    QRShape45: TQRShape;
    QRShape44: TQRShape;
    QRShape43: TQRShape;
    QRShape42: TQRShape;
    QRShape41: TQRShape;
    QRShape40: TQRShape;
    QRShape39: TQRShape;
    QRShape38: TQRShape;
    QRShape37: TQRShape;
    QRShape34: TQRShape;
    QRShape33: TQRShape;
    QRShape32: TQRShape;
    QRShape2: TQRShape;
    QRLPromKgConv: TQRLabel;
    QRLPromIng: TQRLabel;
    QRLPrecioAlimMT: TQRLabel;
    QRLPorcConsumo: TQRLabel;
    QRLKGSalidos: TQRLabel;
    QRLKGPromSalidos: TQRLabel;
    QRLKgAumentado: TQRLabel;
    QRLIngreso1: TQRLabel;
    QRLIngreso: TQRLabel;
    QRLIngresado: TQRLabel;
    QRLDiasProm: TQRLabel;
    QRLCostoTotaAni: TQRLabel;
    QRLCostoSaniAni: TQRLabel;
    QRLCostoHotelAni: TQRLabel;
    QRLCostoAliAnimal: TQRLabel;
    QRLConversion: TQRLabel;
    QRLConsumoTotalTC: TQRLabel;
    QRLConsumoTotalMS: TQRLabel;
    QRLConsumoDiarioCabTC: TQRLabel;
    QRLConsumoDiarioCabMS: TQRLabel;
    QRLConsumoDiario: TQRLabel;
    QRLAumentoPromedio: TQRLabel;
    QRLAumentoDiario: TQRLabel;
    QRLAnimalesSalidos: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape99: TQRShape;
    QRShape36: TQRShape;
    QRShape108: TQRShape;
    QRShape106: TQRShape;
    QRLValorHoteleria: TQRLabel;
    QRLTotalHotel: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel110: TQRLabel;
    QRAlimentacion: TQuickRep;
    QRBand3: TQRBand;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRImage3: TQRImage;
    QRBand4: TQRBand;
    QRShape8: TQRShape;
    QRLabel10: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRBand6: TQRBand;
    QRLabel14: TQRLabel;
    QRShape9: TQRShape;
    QRLabel15: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape16: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape17: TQRShape;
    QRLabel30: TQRLabel;
    QRLPrecioCabCompra: TQRLabel;
    QRLComisionCabCompra: TQRLabel;
    QRLFleteCabCompra: TQRLabel;
    QRLGuiaCabCompra: TQRLabel;
    QRLTotalCabCompra: TQRLabel;
    QRLprecioCabVenta: TQRLabel;
    QRLComisionCabVenta: TQRLabel;
    QRLFleteCabVenta: TQRLabel;
    QRLGuiaCabVenta: TQRLabel;
    QRLTotalCabVenta: TQRLabel;
    QRShape18: TQRShape;
    QRLabel31: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLCabingHotel: TQRLabel;
    QRLabel38: TQRLabel;
    QRLDiasHotel: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel32: TQRLabel;
    QRLUtilidadCab: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape23: TQRShape;
    QRLabel41: TQRLabel;
    QRLUtilidadLote: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure QRCRSimuladorAddReports(Sender: TObject);
  private
    procedure cargarDatosPropietario;
  public
    { Public declarations }
  end;

var
  FREPSimulPrev: TFREPSimulPrev;

implementation

{$R *.dfm}

uses URepGeneral, UPrincipal,UTiposGlobales;

procedure TFREPSimulPrev.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  {QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;}
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      {QRLRenglon4.Enabled := true;
      QRLRenglon3.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon4.Caption := FPrincipal.Renspa;}
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      {QRLRenglon4.Enabled := true;
      QRLRenglon3.Caption := FPrincipal.NombrePropietario;
      QRLRenglon4.Caption := FPrincipal.Renspa;}
    end;
  cargarDatosPropietario();
end;

procedure TFREPSimulPrev.cargarDatosPropietario;
var
  repGeneral : TFRepGeneral;
begin
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();
  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';

  {QRLNombrePropietario1.Caption:= '';
  QRLEmpresa1.Caption:= '';
  QRLDatosAbajo3.Caption:= '';
  QRLDatosAbajo4.Caption:= '';}

  QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;
  {QRLNombrePropietario1.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa1.Caption:= repGeneral.getEmpresaPropietario;}

  if (Trim(repGeneral.getNombrePropietario) <> '') then
    begin
      QRLRenglon1.Enabled:= false;
      QRLNombrePropietario.Enabled:= true;

     { QRLRenglon3.Enabled:= false;
      QRLNombrePropietario1.Enabled:= true;}
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;

       {QRLRenglon3.Enabled:= true;
       QRLNombrePropietario1.Enabled:= false;}
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

  {QRLDatosAbajo3.Caption := QRLDatosAbajo.Caption;
  QRLDatosAbajo4.Caption := QRLDatosAbajo2.Caption;}

  if (FileExists(repGeneral.getPathImage)) then
    begin
      QRImagenEmpresa.Picture.LoadFromFile(repGeneral.getPathImage);
      //QRImagenEmpresa1.Picture.LoadFromFile(repGeneral.getPathImage);
    end;
  repGeneral.Destroy;
end;

procedure TFREPSimulPrev.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCierreLote.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPSimulPrev.QRCRSimuladorAddReports(Sender: TObject);
begin
  inherited;
  {QRCRSimulador.Reports.Clear;
  QRCRSimulador.Reports.Add(QRCierreLote);
  QRCRSimulador.Reports.Add(QRAlimentacion);}
end;

end.
