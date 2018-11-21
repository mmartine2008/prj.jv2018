unit UPlanillaCapServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPlanillaUniversal, ImgList, PngImageList, IBQuery, WinXP,
  DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList,
  ComCtrls, pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, QRCtrls, jpeg, QuickRpt, JvGIF;

type
  TFPlanillaCapServicio = class(TFPlanillaUniversal)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape17: TQRShape;
    QRLabel15: TQRLabel;
    QRShape19: TQRShape;
    QRLabel16: TQRLabel;
    QRShape20: TQRShape;
    QRLabel17: TQRLabel;
    QRShape21: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape22: TQRShape;
    QRBand2: TQRBand;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRDBTRP: TQRDBText;
    QRLabel14: TQRLabel;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRDBText1: TQRDBText;
  private
    procedure PasarAnimales;
  public
    procedure ConfigurarReporte;override;
  end;

var
  FPlanillaCapServicio: TFPlanillaCapServicio;

implementation

{$R *.dfm}

procedure TFPlanillaCapServicio.PasarAnimales;
begin
end;

procedure TFPlanillaCapServicio.ConfigurarReporte;
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
    IBQAnimales.SQL.Add('select * from REP_PLANILLA_CAPACIDAD');
    IBQAnimales.Open;
    QRDBTRP.DataField := 'RP';
  end;
end;

end.
