unit UREPExistenciaPorLotePreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QuickRpt, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QRCtrls, jpeg, IBQuery, QRPDFFilt, QRWebFilt, QRExport, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  JvGIF;

type
  TFREPExistenciaPorLotePreview = class(TFUniversal)
    QRInfoLotes: TQuickRep;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    IBQInfoLotes: TIBQuery;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRDBText11: TQRDBText;
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
    QRShape8: TQRShape;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel17: TQRLabel;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRHTMLFilter1: TQRHTMLFilter;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
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
    procedure QRInfoLotesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FREPExistenciaPorLotePreview: TFREPExistenciaPorLotePreview;

implementation

uses
  UPrincipal, URepGeneral,UTiposGlobales;

{$R *.dfm}

procedure TFREPExistenciaPorLotePreview.QRInfoLotesBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;

  //esto se saca porque todavia no se calcula pero mas adelante va \\
  QRDBText17.Enabled:= false;
  QRDBText18.Enabled:= false;
  QRDBText19.Enabled:= false;
  QRDBText20.Enabled:= false;
  QRDBText21.Enabled:= false;
  QRDBText22.Enabled:= false;
  QRDBText25.Enabled:= false;
  QRShape2.Enabled:= false;
  QRLabel16.Enabled:= false;
  QRShape9.Size.Height:= 18.2;
  QRShape5.Size.Height:= 18.2;

  QRShape10.Size.Height:= 18.2;
  QRShape11.Size.Height:= 18.2;

  QRShape12.Size.Height:= 18.2;
  QRShape13.Size.Height:= 18.2;

  QRShape14.Size.Height:= 18.2;
  QRShape8.Size.Height:= 18.2;

  //**********************************\\


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

procedure TFREPExistenciaPorLotePreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRInfoLotes.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPExistenciaPorLotePreview.cargarDatosPropietario;
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
