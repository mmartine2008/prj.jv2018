unit UREPInfoDonantesPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QRCtrls, jpeg, QuickRpt, QRExport, QRPDFFilt, ImgList, PngImageList,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFREPInfoDonantesPreview = class(TFUniversal)
    QRInfoDonantes: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
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
    QRLFiltros: TQRLabel;
    QRLGrupo: TQRLabel;
    QRLGrupoValue: TQRLabel;
    QRBand4: TQRBand;
    QRShape20: TQRShape;
    QRShape28: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel22: TQRLabel;
    QRShape11: TQRShape;
    QRLabel3: TQRLabel;
    QRShape12: TQRShape;
    QRLabel5: TQRLabel;
    QRShape13: TQRShape;
    QRLabel6: TQRLabel;
    QRShape14: TQRShape;
    QRLabel7: TQRLabel;
    QRBand1: TQRBand;
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
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape19: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel9: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLTotalHuevos: TQRLabel;
    QRLTotalDeg: TQRLabel;
    QRLTotalSinF: TQRLabel;
    QRLTotalTransf: TQRLabel;
    QRLTotalTransfer: TQRLabel;
    QRLPorcDeg: TQRLabel;
    QRLPorcSinF: TQRLabel;
    QRLPorcTransf: TQRLabel;
    QRLPorcTransfer: TQRLabel;
    QRLPromPorc: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLPromTransfer: TQRLabel;
    QRLPromTransf: TQRLabel;
    QRLPromSinF: TQRLabel;
    QRLPromDeg: TQRLabel;
    u: TQRShape;
    QRShape45: TQRShape;
    QRLabel24: TQRLabel;
    QRLPromHuevos: TQRLabel;
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
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    procedure FormShow(Sender: TObject);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRLTotalHuevosPrint(sender: TObject; var Value: String);
    procedure QRLTotalDegPrint(sender: TObject; var Value: String);
    procedure QRLTotalSinFPrint(sender: TObject; var Value: String);
    procedure QRLTotalTransfPrint(sender: TObject; var Value: String);
    procedure QRLTotalTransferPrint(sender: TObject; var Value: String);
    procedure QRLPorcDegPrint(sender: TObject; var Value: String);
    procedure QRLPorcSinFPrint(sender: TObject; var Value: String);
    procedure QRLPorcTransfPrint(sender: TObject; var Value: String);
    procedure QRLPorcTransferPrint(sender: TObject; var Value: String);
    procedure QRLPromPorcPrint(sender: TObject; var Value: String);
    procedure QRLPromDegPrint(sender: TObject; var Value: String);
    procedure QRLPromSinFPrint(sender: TObject; var Value: String);
    procedure QRLPromTransfPrint(sender: TObject; var Value: String);
    procedure QRLPromTransferPrint(sender: TObject; var Value: String);
    procedure QRLPromHuevosPrint(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRInfoDonantesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    CantHuevos, CantTrans, CantDeg, CantSinF, Transf : Integer;
    Trans, Deg, SinF, Transferidos, TotalPorc, TotalHuevos : Integer;
    SumaPorc : Double;

    procedure cargarDatosPropietario();    
  public
    { Public declarations }
  end;

var
  FREPInfoDonantesPreview: TFREPInfoDonantesPreview;

implementation

uses
  UREPInfoDonantes, UPrincipal, URepGeneral,uTiposGlobales;

{$R *.dfm}

procedure TFREPInfoDonantesPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  CantHuevos := 0;
  CantTrans := 0;
  CantDeg := 0;
  CantSinF := 0;
  Transf := 0;
  Trans := 0;
  Deg := 0;
  SinF := 0;
  Transferidos := 0;
  TotalPorc := 0;
  SumaPorc := 0;
  TotalHuevos := 0;
  QRInfoDonantes.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPInfoDonantesPreview.QRBEncabezadoPlanillaBeforePrint(
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

procedure TFREPInfoDonantesPreview.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Inc(TotalHuevos);
  CantHuevos := CantHuevos + StrToInt(Value);  //Huevos
end;

procedure TFREPInfoDonantesPreview.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if StrToFloat(Value) > 0 then
    Inc(TotalPorc);
  SumaPorc := SumaPorc + StrToFloat(Value);
  Value := Value + '%';
end;

procedure TFREPInfoDonantesPreview.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if StrToInt(Value) > 0 then
    Inc(Deg);
  CantDeg := CantDeg + StrToInt(Value);    //Degenerados
end;

procedure TFREPInfoDonantesPreview.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if StrToInt(Value) > 0 then
    Inc(SinF);
  CantSinF := CantSinF + StrToInt(Value);   //Sin Fertilizar
end;

procedure TFREPInfoDonantesPreview.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if StrToInt(Value) > 0 then
    Inc(Trans);
  CantTrans := CantTrans + StrToInt(Value); //Transferibles
end;

procedure TFREPInfoDonantesPreview.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if StrToInt(Value) > 0 then
    Inc(Transferidos);
  Transf := Transf + StrToInt(Value); //Transferidos
end;

procedure TFREPInfoDonantesPreview.QRLTotalHuevosPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := IntToStr(CantHuevos);
end;

procedure TFREPInfoDonantesPreview.QRLTotalDegPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := IntToStr(CantDeg);
end;

procedure TFREPInfoDonantesPreview.QRLTotalSinFPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := IntToStr(CantSinF);
end;

procedure TFREPInfoDonantesPreview.QRLTotalTransfPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := IntToStr(CantTrans);
end;

procedure TFREPInfoDonantesPreview.QRLTotalTransferPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := IntToStr(Transf);
end;

procedure TFREPInfoDonantesPreview.QRLPorcDegPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if (CantHuevos > 0) and (CantDeg > 0) then
    Value := FormatFloat('##,##',(CantDeg/CantHuevos)*100)+'%'
  else
    Value := '0';
end;

procedure TFREPInfoDonantesPreview.QRLPorcSinFPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if (CantHuevos > 0) and (CantSinF > 0) then
    Value := FormatFloat('##,##',(CantSinF/CantHuevos)*100)+'%'
  else
    Value := '0';
end;

procedure TFREPInfoDonantesPreview.QRLPorcTransfPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if (CantHuevos > 0) and (CantTrans > 0) then
    Value := FormatFloat('##,##',(CantTrans/CantHuevos)*100)+'%'
  else
    Value := '0';
end;

procedure TFREPInfoDonantesPreview.QRLPorcTransferPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if (CantHuevos > 0) and (Transf > 0) then
    Value := FormatFloat('##,##',(Transf/CantHuevos)*100)+'%'
  else
    Value := '0';
end;

procedure TFREPInfoDonantesPreview.QRLPromPorcPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if (TotalPorc > 0) and (SumaPorc > 0) then
    Value := FormatFloat('##,##',SumaPorc/TotalPorc)+'%'
  else
    Value := '0';
end;

procedure TFREPInfoDonantesPreview.QRLPromDegPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if Deg > 0 then
    Value := FormatFloat('##,##',CantDeg/Deg);
end;

procedure TFREPInfoDonantesPreview.QRLPromSinFPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if SinF > 0 then
    Value := FormatFloat('##,##',CantDeg/SinF);
end;

procedure TFREPInfoDonantesPreview.QRLPromTransfPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if Trans > 0 then
    Value := FormatFloat('##,##',CantTrans/Trans);
end;

procedure TFREPInfoDonantesPreview.QRLPromTransferPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if Transferidos > 0 then
    Value := FormatFloat('##,##',Transf/Transferidos);
end;

procedure TFREPInfoDonantesPreview.QRLPromHuevosPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if TotalHuevos > 0 then
    Value := FormatFloat('##,##',CantHuevos/TotalHuevos);
end;

procedure TFREPInfoDonantesPreview.cargarDatosPropietario;
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

procedure TFREPInfoDonantesPreview.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if QRDBText21.DataSet.FieldValues['CANT_HUEVOS'] = 0 then
    QRShape19.Brush.Color := clRed
  else
    QRShape19.Brush.Color := clMoneyGreen;
end;

procedure TFREPInfoDonantesPreview.QRInfoDonantesBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  CantHuevos := 0;
  CantTrans := 0;
  CantDeg := 0;
  CantSinF := 0;
  Transf := 0;
  Trans := 0;
  Deg := 0;
  SinF := 0;
  Transferidos := 0;
  TotalPorc := 0;
  SumaPorc := 0;
  TotalHuevos := 0;
end;

end.
