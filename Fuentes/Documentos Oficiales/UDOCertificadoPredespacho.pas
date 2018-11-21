unit UDOCertificadoPredespacho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveUniversal, DB, IBQuery, WinXP, DataExport, DataToXLS,
  IBCustomDataSet, IBStoredProc, ActnList, StdCtrls, MemoAuto, ComCtrls,
  ExtCtrls, Buttons, DateTimePickerAuto, Mask, EditAuto, UFrameMangazo,
  QRCtrls, QuickRpt, QRExport, QRPDFFilt, dateutils, PngImage,
  JvExExtCtrls, JvImage, jpeg, JvGIF, JvExControls, JvLabel,
  JvComponentBase, JvBalloonHint, ImgList, PngImageList;

type
  TFEveCertificadoPredespacho = class(TFEveUniversal)
    TSManga: TTabSheet;
    TSDatos: TTabSheet;
    TabSheet1: TTabSheet;
    MSimple: TMangazo;
    GroupBox1: TGroupBox;
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    GBVeterinario: TGroupBox;
    GBEstablecimiento: TGroupBox;
    LRenspaOri: TLabel;
    EARenspa: TMaskEdit;
    LCiudad: TLabel;
    EACiudad: TEditAuto;
    LPartido: TLabel;
    EAPartido: TEditAuto;
    EADTA: TEditAuto;
    LDTA: TLabel;
    LProvincia: TLabel;
    EAProvincia: TEditAuto;
    LCantAnimales: TLabel;
    EACantAnimales: TEditAuto;
    LFechaVet: TLabel;
    DTPAFechaVet: TDateTimePickerAuto;
    LRegistro: TLabel;
    EARegistro: TEditAuto;
    QRCertificadoPredespacho: TQuickRep;
    QRBand1: TQRBand;
    QRRichText1: TQRRichText;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    TitleBand1: TQRBand;
    QRRichText11: TQRRichText;
    QRRichText3: TQRRichText;
    QRRichText6: TQRRichText;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRImage1: TQRImage;
    QRLDTA: TQRLabel;
    QRShape2: TQRShape;
    QRShape22: TQRShape;
    QRShape8: TQRShape;
    QRShape13: TQRShape;
    QRShape18: TQRShape;
    QRShape21: TQRShape;
    LPrecinto: TLabel;
    QRLDia: TQRLabel;
    QRLMes: TQRLabel;
    QRLAnio: TQRLabel;
    QRLEstablecimiento: TQRLabel;
    QRLRENSPA: TQRLabel;
    QRLCiudad: TQRLabel;
    QRLPartido: TQRLabel;
    QRLProvincia: TQRLabel;
    QRLCantAnimales: TQRLabel;
    QRRichText2: TQRRichText;
    QRShape7: TQRShape;
    QRRichText4: TQRRichText;
    QRRichText5: TQRRichText;
    QRLFechaVet: TQRLabel;
    QRLRegistro: TQRLabel;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRRichText7: TQRRichText;
    QRRichText8: TQRRichText;
    procedure FormShow(Sender: TObject);
    procedure EARegistroKeyPress(Sender: TObject; var Key: Char);
    procedure EACantAnimalesKeyPress(Sender: TObject; var Key: Char);
    procedure ATerminarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ClearEdit();
  public
    { Public declarations }
  end;

var
  FEveCertificadoPredespacho: TFEveCertificadoPredespacho;

implementation

uses UPrincipal,uTiposGlobales, MaskUtils, UTraduccion;

{$R *.dfm}

procedure TFEveCertificadoPredespacho.FormShow(Sender: TObject);
begin
  inherited;
  ClearEdit();
  EADTA.SetFocus;
  IBQSPEventoInd.Close;
  IBQSPEventoInd.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.Open;
  EARenspa.Text := IBQSPEventoInd.fieldbyname('RENSPA').AsString
end;

procedure TFEveCertificadoPredespacho.EARegistroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFEveCertificadoPredespacho.EACantAnimalesKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFEveCertificadoPredespacho.ClearEdit;
begin
  DTPAFecha.Date:= Now();
  DTPAFechaVet.Date:= Now();
  EADTA.Text:='';
  EARenspa.Text:='';
  EACiudad.Text:= '';
  EAPartido.Text:= '';
  EAProvincia.Text:= '';
  EACantAnimales.Text:='';
  EARegistro.Text:= '';
end;

procedure TFEveCertificadoPredespacho.ATerminarExecute(Sender: TObject);
var mes :Integer;
begin
  inherited;
  QRLDTA.Caption:= EADTA.Text;


  QRLDia.Caption:= IntToStr(DayOf(DTPAFecha.Date));

  mes:= MonthOf(DTPAFecha.Date);
  case mes of
    1 : QRLMes.Caption:= Traducir('Enero');
    2 : QRLMes.Caption:= Traducir('Febrero');
    3 : QRLMes.Caption:= Traducir('Marzo');
    4 : QRLMes.Caption:= Traducir('Abril');
    5 : QRLMes.Caption:= Traducir('Mayo');
    6 : QRLMes.Caption:= Traducir('Junio');
    7 : QRLMes.Caption:= Traducir('Julio');
    8 : QRLMes.Caption:= Traducir('Agosto');
    9 : QRLMes.Caption:= Traducir('Septiembre');
    10 : QRLMes.Caption:= Traducir('Octubre');
    11 : QRLMes.Caption:= Traducir('Noviembre');
    12 : QRLMes.Caption:= Traducir('Diciembre');
  end;
  QRLAnio.Caption:= IntToStr(YearOf(DTPAFecha.Date));

  IBQSPEventoInd.Close;
  IBQSPEventoInd.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.Open;

  QRLEstablecimiento.Caption := IBQSPEventoInd.fieldbyname('Nombre').AsString;
  QRLRENSPA.Caption := FormatMaskText('CC.CCC.C.CCCCC.CC;0;_',EARenspa.Text);
  QRLCiudad.Caption := EACiudad.Text;
  QRLPartido.Caption := EAPartido.Text;
  QRLProvincia.Caption := EAProvincia.Text;
  QRLCantAnimales.Caption:= EACantAnimales.Text;
  QRLFechaVet.Caption := DateToStr(DTPAFechaVet.Date);
  QRLRegistro.Caption := EARegistro.Text;
  QRCertificadoPredespacho.Preview;
end;

procedure TFEveCertificadoPredespacho.FormCreate(Sender: TObject);
begin
  inherited;
  TabSheet1.TabVisible := false;
  TSManga.TabVisible := false;
end;

procedure TFEveCertificadoPredespacho.ACancelarExecute(Sender: TObject);
begin
  inherited;
  Close();
end;

end.
