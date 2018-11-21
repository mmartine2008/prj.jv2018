unit UPlanillaReidentificacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPlanillaUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, PngImage, ExtCtrls, QRCtrls, jpeg, QuickRpt, ImgList,
  PngImageList, JvGIF;

type
  TFPlanillaReidentificacion = class(TFPlanillaUniversal)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape8: TQRShape;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRBand2: TQRBand;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRDBTRP: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape14: TQRShape;
  private
    procedure PasarAnimales;
  public
    procedure ConfigurarReporte; override;
  end;

var
  FPlanillaReidentificacion: TFPlanillaReidentificacion;

implementation

uses
  UPrincipal;

{$R *.dfm}

procedure TFPlanillaReidentificacion.PasarAnimales;
begin
end;

procedure TFPlanillaReidentificacion.ConfigurarReporte;
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
    IBQAnimales.SQL.Add('select * FROM REP_INFO_REIDENTIFICACION');
    IBQAnimales.Open;
    QRDBTRP.DataField := 'RP';
  end;
end;

end.
