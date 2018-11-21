unit UPlanillaNoTactadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPlanillaUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, PngImage, ExtCtrls, QRCtrls, jpeg, QuickRpt, ImgList,
  PngImageList, JvGIF, JvExExtCtrls, JvImage;

type
  TFPlanillaNoTactadas = class(TFPlanillaUniversal)
    QRBand2: TQRBand;
    QRDBTRP: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape9: TQRShape;
    QRShape16: TQRShape;
    QRShape12: TQRShape;
    QRShape17: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape4: TQRShape;
    QRLabel15: TQRLabel;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRLabel16: TQRLabel;
    QRShape14: TQRShape;
    QRDBText9: TQRDBText;
  private
    procedure PasarAnimales;
  public
    procedure ConfigurarReporte; override;
  end;

var
  FPlanillaNoTactadas: TFPlanillaNoTactadas;

implementation

uses
  UPrincipal;

{$R *.dfm}

procedure TFPlanillaNoTactadas.PasarAnimales;
begin
end;

procedure TFPlanillaNoTactadas.ConfigurarReporte;
begin
  if not ConAnimales then
  begin
    IBQAnimales.Close;
    IBQAnimales.SQL.Clear;
    IBQAnimales.SQL.Add('select * from aux_planillas');
    IBQAnimales.Open;
    QRDBTRP.DataField := 'RP';
  end
  else
  begin
    IBQAnimales.Close;
    IBQAnimales.SQL.Clear;
    IBQAnimales.SQL.Add('select * from INFO_ANIMALES_NO_TACTADOS(:ESTA,:ACTUAL,:CONSERV,:ROD,:CAT)');
    IBQAnimales.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
    IBQAnimales.ParamByName('ACTUAL').AsDate := Date();
    IBQAnimales.ParamByName('CONSERV').Value := 'S';
    IBQAnimales.ParamByName('ROD').Value := null;
    IBQAnimales.ParamByName('CAT').Value := null;
    IBQAnimales.Open;
    QRDBTRP.DataField := 'RP_ANIMAL';
  end;
end;

end.
