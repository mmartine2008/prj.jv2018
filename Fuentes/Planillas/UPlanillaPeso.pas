unit UPlanillaPeso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPlanillaUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, QRCtrls, jpeg, QuickRpt,
  ComCtrls, StdCtrls, ExtCtrls, UPrincipal, QRExport, QRPDFFilt, ImgList,
  PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  JvGIF;

type
  TFPlanillaPeso = class(TFPlanillaUniversal)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBTRP: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape27: TQRShape;
    QRShape11: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel3: TQRLabel;
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
    QRBand3: TQRBand;
    QRLabel27: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel14: TQRLabel;
  private
    procedure PasarAnimales;
  public
    procedure ConfigurarReporte; override;
  end;

var
  FPlanillaPeso: TFPlanillaPeso;

implementation

{$R *.dfm}

procedure TFPlanillaPeso.PasarAnimales;
begin
end;

procedure TFPlanillaPeso.ConfigurarReporte;
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
    IBQAnimales.SQL.Add('select * from REP_INFO_PESADAS(:ESTA,:DESDE,:HASTA,''N'')');
    IBQAnimales.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
    IBQAnimales.ParamByName('Desde').Value := null;
    IBQAnimales.ParamByName('hasta').Value := null;
    IBQAnimales.Open;
    QRDBTRP.DataField := 'RP';
  end;
end;

end.
