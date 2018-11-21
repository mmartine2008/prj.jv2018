unit UREPCostoSuplementacionPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  jpeg, QRCtrls, QuickRpt, UREPCostoSuplementacion, QRExport, QRPDFFilt,
  JvExControls, JvLabel, JvGIF, PngImage, JvExExtCtrls, JvImage, ImgList,
  PngImageList;

type
  TFREPCostoSuplementacionPreview = class(TFUniversal)
    QRSuplementacion: TQuickRep;
    QRBDetailPlanilla: TQRBand;
    QRBGFgrilla: TQRBand;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRBand3: TQRBand;
    QRLDesde: TQRLabel;
    QRLDesdeValue: TQRLabel;
    QRLHasta: TQRLabel;
    QRLHastaValue: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRDBTRacionTalCual: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText33: TQRDBText;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape5: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
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
    QRLabel10: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape14: TQRShape;
    QRLabel20: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    procedure FormShow(Sender: TObject);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRLTotalAnimalesPrint(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRLPromRacionPrint(sender: TObject; var Value: String);
    procedure QRLTotalRacionPrint(sender: TObject; var Value: String);
    procedure QRLPromCostoUPrint(sender: TObject; var Value: String);
    procedure QRLTotalCostoUPrint(sender: TObject; var Value: String);
    procedure QRLPromCostoTPrint(sender: TObject; var Value: String);
    procedure QRLTotalCostoTPrint(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRLPromCostoPAPrint(sender: TObject; var Value: String);
    procedure QRLTotalPaPrint(sender: TObject; var Value: String);
    procedure QRLPromAnimalesPrint(sender: TObject; var Value: String);
    procedure QRLPromRacionTCPrint(sender: TObject; var Value: String);
    procedure QRLTotalRacionTCPrint(sender: TObject; var Value: String);
    procedure QRDBTRacionTalCualPrint(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText34Print(sender: TObject; var Value: String);
  private
    TotalRacion, TotalRacionTC, TotalCostoU, TotalCostoT, TotalCostoPA : Double;
    PromCostoT, PromCostoU, PromRacion, PromRacionTC, TotalAnimales, PromCostoPA, PromAnimales : Integer;
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FREPCostoSuplementacionPreview: TFREPCostoSuplementacionPreview;

implementation

uses
  UPrincipal, URepGeneral,UTiposGlobales;

{$R *.dfm}

procedure TFREPCostoSuplementacionPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRSuplementacion.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPCostoSuplementacionPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PromRacion := 0;
  TotalRacion := 0;
  PromCostoU := 0;
  TotalCostoU := 0;
  PromCostoT := 0;
  TotalCostoT := 0;
  TotalAnimales := 0;
  PromCostoPA := 0;
  TotalCostoPA := 0;
  PromAnimales := 0;
  PromRacionTC := 0;
  TotalRacionTC := 0;

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

procedure TFREPCostoSuplementacionPreview.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  inherited;
 { TotalCostoT := TotalCostoT + StrToFloat(Value);
  if StrToFloat(Value) > 0 then
    Inc(PromCostoT);}
  Value := Value+' Kgs.';
end;

procedure TFREPCostoSuplementacionPreview.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  inherited;
 { TotalAnimales := TotalAnimales + StrToInt(Value);
  Inc(PromAnimales);}
end;

procedure TFREPCostoSuplementacionPreview.QRLTotalAnimalesPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  Value := IntToStr(TotalAnimales);
end;

procedure TFREPCostoSuplementacionPreview.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  inherited;
  {TotalRacion := TotalRacion + StrToFloat(Value);
  if StrToFloat(Value) > 0 then
    Inc(PromRacion);}
 // Value := Value+' kg MS/cab';
end;

procedure TFREPCostoSuplementacionPreview.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  inherited;
 { TotalCostoU := TotalCostoU + StrToFloat(Value);
  if StrToFloat(Value) > 0 then
    Inc(PromCostoU);}
  Value := '$ '+Value;
end;

procedure TFREPCostoSuplementacionPreview.QRLPromRacionPrint(
  sender: TObject; var Value: String);
begin
  inherited;
 {if PromRacion > 0 then
    Value := FormatFloat('##.##',TotalRacion/PromRacion)
  else                                                  }
    Value := '0';
end;

procedure TFREPCostoSuplementacionPreview.QRLTotalRacionPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  Value := FormatFloat('##.##',TotalRacion);
end;

procedure TFREPCostoSuplementacionPreview.QRLPromCostoUPrint(
  sender: TObject; var Value: String);
begin
  inherited;
{  if PromCostoU > 0 then
    Value := '$ '+FormatFloat('#0.##',TotalCostoU/PromCostoU)
  else}
    Value := '$ 0';
end;

procedure TFREPCostoSuplementacionPreview.QRLTotalCostoUPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  Value := '$ '+FormatFloat('##.##',TotalCostoU);
end;

procedure TFREPCostoSuplementacionPreview.QRLPromCostoTPrint(
  sender: TObject; var Value: String);
begin
  inherited;
{ if PromCostoT > 0 then
    Value := '$ '+FormatFloat('##.##',TotalCostoT/PromCostoT)
  else}
    Value := '$ 0';
end;

procedure TFREPCostoSuplementacionPreview.QRLTotalCostoTPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  Value := '$ '+FormatFloat('##.##',TotalCostoT);
end;

procedure TFREPCostoSuplementacionPreview.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  inherited;
 { TotalCostoPA := TotalCostoPA + StrToFloat(Value);
  if StrToFloat(Value) > 0 then
    Inc(PromCostoPA);}
  Value := '$ '+Value;
end;

procedure TFREPCostoSuplementacionPreview.QRLPromCostoPAPrint(
  sender: TObject; var Value: String);
begin
  inherited;
 { if PromCostoPA > 0 then
    Value := '$ '+FormatFloat('##.##',TotalCostoPA/PromCostoPA)
  else}
    Value := '$ 0';
end;

procedure TFREPCostoSuplementacionPreview.QRLTotalPaPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := '$ '+FormatFloat('##.##',TotalCostoPA);
end;

procedure TFREPCostoSuplementacionPreview.QRLPromAnimalesPrint(
  sender: TObject; var Value: String);
begin
  inherited;
 { if PromAnimales > 0 then
    Value := FormatFloat('##.##',TotalAnimales/PromAnimales)
  else }
    Value := '0';
end;

procedure TFREPCostoSuplementacionPreview.cargarDatosPropietario;
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

procedure TFREPCostoSuplementacionPreview.QRLPromRacionTCPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  {if PromRacionTC > 0 then
    Value := FormatFloat('##.##',TotalRacionTC/PromRacionTC)
  else}
    Value := '0';
end;

procedure TFREPCostoSuplementacionPreview.QRLTotalRacionTCPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  Value := FormatFloat('##.##',TotalRacionTC);
end;

procedure TFREPCostoSuplementacionPreview.QRDBTRacionTalCualPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  {TotalRacionTC := TotalRacionTC + StrToFloat(Value);
  if StrToFloat(Value) > 0 then
    Inc(PromRacionTC);}
end;

procedure TFREPCostoSuplementacionPreview.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+'%';
end;

procedure TFREPCostoSuplementacionPreview.QRDBText34Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := '$'+Value;
end;

end.
