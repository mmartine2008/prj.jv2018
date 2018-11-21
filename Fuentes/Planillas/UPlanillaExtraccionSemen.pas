unit UPlanillaExtraccionSemen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPlanillaUniversal, ImgList, PngImageList, IBQuery, WinXP,
  DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList,
  ComCtrls, JvExControls, JvLabel, StdCtrls, ExtCtrls, QRCtrls, jpeg,
  QuickRpt, JvGIF;

type
  TFPlanillaExtraccionSemen = class(TFPlanillaUniversal)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape27: TQRShape;
    QRShape11: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
    QRShape12: TQRShape;
    QRBand2: TQRBand;
    QRDBTRP: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel14: TQRLabel;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape28: TQRShape;
    QRLabel9: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
  private
    procedure PasarAnimales;
  public
    procedure ConfigurarReporte; override;
  end;

var
  FPlanillaExtraccionSemen: TFPlanillaExtraccionSemen;

implementation

{$R *.dfm}

procedure TFPlanillaExtraccionSemen.PasarAnimales;
begin
end;

procedure TFPlanillaExtraccionSemen.ConfigurarReporte;
begin
  if not ConAnimales then
  begin
    IBQAnimales.Close;
    IBQAnimales.SQL.Clear;
    IBQAnimales.SQL.Add('select * from aux_planillas');
    IBQAnimales.Open;
    QRDBTRP.DataField := 'RP_ANIMAL';
  end
  else
  begin
    IBQAnimales.Close;
    IBQAnimales.SQL.Clear;
    IBQAnimales.SQL.Add('select * from REP_PLANILLA_EXTRAC_SEM');
    IBQAnimales.Open;
    QRDBTRP.DataField := 'RP_ANIMAL';
  end;
end;

end.
