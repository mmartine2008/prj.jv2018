unit UREPExistenciaPorLotesGralPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, IBQuery, QuickRpt,
  QRCtrls, jpeg, QRPDFFilt, QRWebFilt, QRExport, ImgList, PngImageList,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFREPExistenciaPorLotesGralPreview = class(TFUniversal)
    IBQInfoLotes: TIBQuery;
    QRExistenciaPorLotesGral: TQuickRep;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand3: TQRBand;
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
    QRBand4: TQRBand;
    QREHa: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRETotal: TQRExpr;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel15: TQRLabel;
    QRBand5: TQRBand;
    QRShape23: TQRShape;
    QRLabel16: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRExpr1: TQRExpr;
    QRHTMLFilter1: TQRHTMLFilter;
    IBQInfoLotesHECTAREAS: TIntegerField;
    IBQInfoLotesRECURSO_FORRAJERO: TIBStringField;
    IBQInfoLotesFECHA_RECURSO: TDateField;
    IBQInfoLotesCANT_NOVILLOS: TIntegerField;
    IBQInfoLotesCANT_TERNEROS: TIntegerField;
    IBQInfoLotesCANT_TERNERAS: TIntegerField;
    IBQInfoLotesCANT_TOROS: TIntegerField;
    IBQInfoLotesCANT_VACAS: TIntegerField;
    IBQInfoLotesCANT_VAQUILLONAS: TIntegerField;
    IBQInfoLotesTOTAL: TIntegerField;
    IBQInfoLotesNOMBRE: TIBStringField;
    IBQInfoLotesCAB_NOVILLOS: TIBBCDField;
    IBQInfoLotesCAB_TERNEROS: TIBBCDField;
    IBQInfoLotesCAB_TERNERAS: TIBBCDField;
    IBQInfoLotesCAB_TOROS: TIBBCDField;
    IBQInfoLotesCAB_VACAS: TIBBCDField;
    IBQInfoLotesCAB_VAQUILLONAS: TIBBCDField;
    IBQInfoLotesEQ_NOVILLOS: TIBBCDField;
    IBQInfoLotesEQ_TERNEROS: TIBBCDField;
    IBQInfoLotesEQ_TERNERAS: TIBBCDField;
    IBQInfoLotesEQ_TOROS: TIBBCDField;
    IBQInfoLotesEQ_VACAS: TIBBCDField;
    IBQInfoLotesEQ_VAQUILLONAS: TIBBCDField;
    IBQInfoLotesTOTAL_CABEZAS: TIBBCDField;
    IBQInfoLotesTOTAL_EQ: TIBBCDField;
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
    procedure QRExistenciaPorLotesGralBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FREPExistenciaPorLotesGralPreview: TFREPExistenciaPorLotesGralPreview;

implementation

uses UPrincipal,uTiposGlobales, URepGeneral;

{$R *.dfm}

procedure TFREPExistenciaPorLotesGralPreview.QRExistenciaPorLotesGralBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
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
  IBQInfoLotes.Active := false;
  IBQInfoLotes.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQInfoLotes.Active := true;

  cargarDatosPropietario();
end;

procedure TFREPExistenciaPorLotesGralPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRExistenciaPorLotesGral.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPExistenciaPorLotesGralPreview.cargarDatosPropietario;
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
