unit UREPProcreoPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  UREPProcreo, QRExport, QRPDFFilt, QuickRpt, QRCtrls, jpeg, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls,
  JvImage;

type
  TFREPProcreoPreview = class(TFUniversal)
    QRProcreo: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRShape35: TQRShape;
    QRBand6: TQRBand;
    QRShape22: TQRShape;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel11: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel12: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel13: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel14: TQRLabel;
    QRShape20: TQRShape;
    QRLabel15: TQRLabel;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRLabel16: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel17: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel18: TQRLabel;
    QRShape29: TQRShape;
    QRLabel19: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape38: TQRShape;
    QRLabel23: TQRLabel;
    QRShape39: TQRShape;
    QRLabel24: TQRLabel;
    QRShape40: TQRShape;
    QRLabel25: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel29: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel30: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape1: TQRShape;
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
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape81: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRLabel37: TQRLabel;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRLabel38: TQRLabel;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRLabel39: TQRLabel;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRLabel40: TQRLabel;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRLabel41: TQRLabel;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRLabel42: TQRLabel;
    QRShape96: TQRShape;
    QRLabel43: TQRLabel;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRLabel44: TQRLabel;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRLabel45: TQRLabel;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    Cant_servidas: TQRLabel;
    cant_muerte_serv: TQRLabel;
    cant_ventas_serv: TQRLabel;
    cant_tactos: TQRLabel;
    cant_vacias: TQRLabel;
    cant_ventas_tacto: TQRLabel;
    cant_muerte_tacto: TQRLabel;
    cant_abortos: TQRLabel;
    cant_sin_cierre_tacto: TQRLabel;
    cant_venta_parto: TQRLabel;
    cant_muerte_parto: TQRLabel;
    cant_muerte_36: TQRLabel;
    cant_muerte_dest: TQRLabel;
    cant_sin_cierre_parto: TQRLabel;
    cant_preniadas: TQRLabel;
    cant_preniadas_menos_venta: TQRLabel;
    cant_partos: TQRLabel;
    cant_partos_menos_ventas: TQRLabel;
    cant_destete: TQRLabel;
    Fecha_ini_serv: TQRLabel;
    Fecha_fin_serv: TQRLabel;
    Fecha_ini_tacto: TQRLabel;
    Fecha_fin_tacto: TQRLabel;
    Fecha_ini_parto: TQRLabel;
    Fecha_fin_parto: TQRLabel;
    Fecha_ini_dest: TQRLabel;
    Fecha_fin_dest: TQRLabel;
    por_serv: TQRLabel;
    por_muerte_serv: TQRLabel;
    por_vaja_serv: TQRLabel;
    por_tacto: TQRLabel;
    por_vacias: TQRLabel;
    por_venta_tacto: TQRLabel;
    por_quedan_tacto: TQRLabel;
    por_muerte_tacto: TQRLabel;
    por_abortos: TQRLabel;
    por_venta_parto: TQRLabel;
    por_quedan_parto: TQRLabel;
    por_muerte_m36: TQRLabel;
    por_muerte_Ma36: TQRLabel;
    por_muerte_parto: TQRLabel;
    por_preniadas: TQRLabel;
    por_paridas: TQRLabel;
    por_destete: TQRLabel;
    por_tacto_ajus: TQRLabel;
    por_parto_ajus: TQRLabel;
    por_dest_ajus: TQRLabel;
    merma_tacto_parto: TQRLabel;
    merma_tacto_dest: TQRLabel;
    merma_parto_dest: TQRLabel;
    por_tacto_trabajo: TQRLabel;
    por_parto_trabajo: TQRLabel;
    por_dest_trabajo: TQRLabel;
    QRShape30: TQRShape;
    QRLTipoServicio: TQRLabel;
    QRObservaciones: TQuickRep;
    QRBand2: TQRBand;
    QRImage1: TQRImage;
    QRLabel20: TQRLabel;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRLTipoServicio1: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRShape110: TQRShape;
    QRLabel46: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel47: TQRLabel;
    QRShape111: TQRShape;
    QRLabel48: TQRLabel;
    QRCRProcreo: TQRCompositeReport;
    QRMemo: TQRMemo;
    QRShape113: TQRShape;
    QRShape82: TQRShape;
    QRShape78: TQRShape;
    QRSysData4: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRShape79: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa2: TQRLabel;
    QRLNombrePropietario2: TQRLabel;
    QRLRenglon22: TQRLabel;
    QRLRenglon21: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRImagenEmpresa2: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRLDatosAbajo21: TQRLabel;
    QRLDatosAbajo22: TQRLabel;
    QRShape80: TQRShape;
    cant_compra_serv: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape83: TQRShape;
    cant_compra_pren: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape107: TQRShape;
    cant_compra_dest: TQRLabel;
    QRShape112: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape222: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    procedure porcentajesPrint(sender: TObject; var Value: String);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRCRProcreoAddReports(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FREPProcreoPreview: TFREPProcreoPreview;

implementation

uses UPrincipal,uTiposGlobales, URepGeneral;

{$R *.dfm}

procedure TFREPProcreoPreview.porcentajesPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if Value = '%' then
    Value := '0%';
end;

procedure TFREPProcreoPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon21.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon22.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
      QRLRenglon21.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon21.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon22.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
      QRLRenglon21.Caption := FPrincipal.Renspa;
    end;

  cargarDatosPropietario();
end;

procedure TFREPProcreoPreview.QRCRProcreoAddReports(Sender: TObject);
begin
  inherited;
  QRCRProcreo.Reports.Clear;
  QRCRProcreo.Reports.Add(QRProcreo);
  QRCRProcreo.Reports.Add(QRObservaciones);
end;

procedure TFREPProcreoPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCRProcreo.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPProcreoPreview.cargarDatosPropietario;
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

      QRLRenglon22.Enabled:= false;
      QRLNombrePropietario2.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;
       QRLRenglon22.Enabled:= true;
       QRLNombrePropietario2.Enabled:= false;
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
    end;

  QRLDatosAbajo21.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo22.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario2.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa2.Caption:= QRLEmpresa.Caption;

  repGeneral.Destroy;
end;

end.
