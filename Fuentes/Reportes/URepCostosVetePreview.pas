unit URepCostosVetePreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QuickRpt, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QRCtrls, jpeg, UPrincipal, IBQuery, QRExport, QRPDFFilt, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  JvGIF;

type
  TFRepCostosVetePreview = class(TFUniversal)
    QRCostosVete: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel11: TQRLabel;
    QRShape5: TQRShape;
    QRBand7: TQRBand;
    QRShape6: TQRShape;
    QRLabel15: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel16: TQRLabel;
    QRBand2: TQRBand;
    v: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    IBQCostos: TIBQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    IBQCostosV7: TIBStringField;
    IBQCostosV10: TIBStringField;
    IBQCostosV6: TIBStringField;
    IBQCostosV5: TIBStringField;
    IBQCostosID_SENASA: TIBStringField;
    IBQCostosV9: TIBStringField;
    IBQCostosV8: TIBStringField;
    IBQCostosV11: TIBStringField;
    IBQCostosID_RP: TIBStringField;
    IBQCostosFECHA: TDateField;
    IBQCostosOBSERVACION: TIBStringField;
    IBQCostosRESPONSABLE: TIntegerField;
    IBQCostosV1: TIBStringField;
    IBQCostosV2: TIBStringField;
    IBQCostosNOMBRE: TIBStringField;
    IBQCostosV3: TIBStringField;
    IBQCostosV4: TIBStringField;
    IBQCostosI1: TIntegerField;
    IBQCostosI2: TIntegerField;
    IBQCostosI3: TIntegerField;
    IBQCostosD1: TDateField;
    IBQCostosD2: TDateField;
    IBQCostosD3: TDateField;
    IBQCostosID_ANIMAL: TIntegerField;
    IBQCostosID_AUX_EVENTO: TIntegerField;
    IBQCostosI4: TIntegerField;
    IBQCostosI5: TIntegerField;
    IBQCostosI6: TIntegerField;
    IBQCostosI7: TIntegerField;
    IBQCostosI8: TIntegerField;
    IBQCostosI9: TIntegerField;
    IBQCostosVUNO1: TIBStringField;
    IBQCostosVUNO2: TIBStringField;
    IBQCostosVUNO3: TIBStringField;
    IBQCostosVUNO4: TIBStringField;
    IBQCostosVUNO5: TIBStringField;
    IBQCostosVUNO6: TIBStringField;
    IBQCostosEW: TIBStringField;
    IBQCostosH1: TTimeField;
    IBQCostosV12: TIBStringField;
    IBQCostosF1: TFloatField;
    IBQCostosF2: TFloatField;
    IBQCostosF3: TFloatField;
    IBQCostosF4: TFloatField;
    IBQCostosF5: TFloatField;
    IBQCostosID_PC: TIBStringField;
    IBQCostosID_HBA: TIBStringField;
    IBQCostosID_RA: TIBStringField;
    IBQCostosID_OTRO: TIBStringField;
    IBQCostosAPODO: TIBStringField;
    IBQCostosDTA_BAJA: TIBStringField;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel17: TQRLabel;
    QRLDesde: TQRLabel;
    QRLabel18: TQRLabel;
    QRLHasta: TQRLabel;
    QRShape16: TQRShape;
    QRBand3: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel22: TQRLabel;
    C_TH: TQRLabel;
    C_VQ: TQRLabel;
    C_VA: TQRLabel;
    C_TM: TQRLabel;
    C_NO: TQRLabel;
    C_TO: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel26: TQRLabel;
    QRShape28: TQRShape;
    QRLabel25: TQRLabel;
    QRShape29: TQRShape;
    QRLabel27: TQRLabel;
    C_Prom: TQRLabel;
    QRShape30: TQRShape;
    QRLabel28: TQRLabel;
    CA_TH: TQRLabel;
    CA_VQ: TQRLabel;
    CA_VA: TQRLabel;
    CA_TM: TQRLabel;
    CA_NO: TQRLabel;
    CA_TO: TQRLabel;
    CA_Prom: TQRLabel;
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
    procedure QRCostosVeteBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormShow(Sender: TObject);
  private
    costo_tm, costo_no, costo_to, costo_th, costo_vq, costo_va : double;
    cab_tm, cab_no, cab_to, cab_th, cab_vq, cab_va : double;
    procedure CargarPromedios();
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FRepCostosVetePreview: TFRepCostosVetePreview;

implementation

{$R *.dfm}

uses
  URepCostosVete, URepGeneral, uTiposGlobales;

procedure TFRepCostosVetePreview.QRCostosVeteBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
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
  CargarPromedios();
  cargarDatosPropietario();
end;

procedure TFRepCostosVetePreview.CargarPromedios();
var
  total_costo, total_cab : integer;
begin
  total_costo := 0;
  total_cab := 0;
  cab_tm := 0;
  cab_no := 0;
  cab_to := 0;
  cab_th := 0;
  cab_vq := 0;
  cab_va := 0;
  costo_tm := 0;
  costo_no := 0;
  costo_to := 0;
  costo_th := 0;
  costo_vq := 0;
  costo_va := 0;
  IBQCostos.First;
  while not IBQCostos.Eof do
  begin
    case IBQCostos.FieldByName('I2').AsInteger of
      1 : begin
            cab_tm := cab_tm+IBQCostos.FieldValues['I1'];
            costo_tm := costo_tm+IBQCostos.FieldByName('F3').AsFloat;
          end;
      2 : begin
            cab_no := cab_no+IBQCostos.FieldValues['I1'];
            costo_no := costo_no+IBQCostos.FieldByName('F3').AsFloat;
          end;
      3 : begin
            cab_to := cab_to+IBQCostos.FieldValues['I1'];
            costo_to := costo_to+IBQCostos.FieldByName('F3').AsFloat;
          end;
      4 : begin
            cab_th := cab_th+IBQCostos.FieldValues['I1'];
            costo_th := costo_th+IBQCostos.FieldByName('F3').AsFloat;
          end;
      5 : begin
            cab_vq := cab_vq+IBQCostos.FieldValues['I1'];
            costo_vq:= costo_vq+IBQCostos.FieldByName('F3').AsFloat;
          end;
      6 : begin
            cab_va := cab_va+IBQCostos.FieldValues['I1'];
            costo_va := costo_va+IBQCostos.FieldByName('F3').AsFloat;
          end;
    end;
    IBQCostos.Next;
  end;
  C_TH.Caption := '$'+FormatFloat('0.00',costo_th);
  C_VQ.Caption := '$'+FormatFloat('0.00',costo_vq);
  C_VA.Caption := '$'+FormatFloat('0.00',costo_va);
  C_TM.Caption := '$'+FormatFloat('0.00',costo_tm);
  C_NO.Caption := '$'+FormatFloat('0.00',costo_no);
  C_TO.Caption := '$'+FormatFloat('0.00',costo_to);

  if cab_tm > 0 then  cab_tm := costo_tm/cab_tm;
  if cab_vq > 0 then  cab_vq := costo_vq/cab_vq;
  if cab_va > 0 then  cab_va := costo_va/cab_va;
  if cab_th > 0 then  cab_th := costo_th/cab_th;
  if cab_no > 0 then  cab_no := costo_no/cab_no;
  if cab_to > 0 then  cab_to := costo_to/cab_to;

  CA_TH.Caption := '$'+FormatFloat('0.00',cab_th);
  CA_VQ.Caption := '$'+FormatFloat('0.00',cab_vq);
  CA_VA.Caption := '$'+FormatFloat('0.00',cab_va);
  CA_TM.Caption := '$'+FormatFloat('0.00',cab_tm);
  CA_NO.Caption := '$'+FormatFloat('0.00',cab_no);
  CA_TO.Caption := '$'+FormatFloat('0.00',cab_to);

  if costo_tm > 0 then  total_costo := total_costo+1;
  if costo_vq > 0 then  total_costo := total_costo+1;
  if costo_va > 0 then  total_costo := total_costo+1;
  if costo_th > 0 then  total_costo := total_costo+1;
  if costo_no > 0 then  total_costo := total_costo+1;
  if costo_to > 0 then  total_costo := total_costo+1;
  if total_costo = 0 then total_costo := 1;

  if costo_tm > 0 then  total_cab := total_cab+1;
  if costo_vq > 0 then  total_cab := total_cab+1;
  if costo_va > 0 then  total_cab := total_cab+1;
  if costo_th > 0 then  total_cab := total_cab+1;
  if costo_no > 0 then  total_cab := total_cab+1;
  if costo_to > 0 then  total_cab := total_cab+1;
  if total_cab = 0 then total_cab := 1;

  C_Prom.Caption := '$'+FormatFloat('0.00',(costo_th+costo_vq+costo_va+costo_tm+costo_no+costo_to)/total_costo);
  CA_Prom.Caption := '$'+FormatFloat('0.00',(cab_th+cab_vq+cab_va+cab_tm+cab_no+cab_to)/total_cab);
end;

procedure TFRepCostosVetePreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCostosVete.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;


procedure TFRepCostosVetePreview.cargarDatosPropietario;
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
