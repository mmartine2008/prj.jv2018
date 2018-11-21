unit UPlanillaAsignacionServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPlanillaUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, PngImage, ExtCtrls, QRCtrls, jpeg, QuickRpt, ImgList,
  PngImageList, JvGIF, JvExExtCtrls, JvImage;

type
  TFPlanillaAsignacionServicio = class(TFPlanillaUniversal)
    QRBandEncabezado: TQRBand;
    QRBandData: TQRBand;
    QRLRp: TQRLabel;
    QRLTr: TQRLabel;
    QRLPadre: TQRLabel;
    QRLMadre: TQRLabel;
    QRLServ: TQRLabel;
    QRLTacto: TQRLabel;
    QRDBTRp: TQRDBText;
    QRDBTTipoReg: TQRDBText;
    QRDBTPadre: TQRDBText;
    QRDBTMadre: TQRDBText;
    QRShape1: TQRShape;
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
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
  private
    procedure PasarAnimales;
  public
    procedure ConfigurarReporte; override;
  end;

var
  FPlanillaAsignacionServicio: TFPlanillaAsignacionServicio;

implementation

{$R *.dfm}


procedure TFPlanillaAsignacionServicio.PasarAnimales;
begin
end;

procedure TFPlanillaAsignacionServicio.ConfigurarReporte;
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
    IBQAnimales.SQL.Add('select * from REP_INFO_ASIGNACION_SERV');
    IBQAnimales.Open;
    QRDBTRP.DataField := 'RP';
  end;

end;



end.
