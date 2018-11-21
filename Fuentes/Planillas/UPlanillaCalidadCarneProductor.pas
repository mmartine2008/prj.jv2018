unit UPlanillaCalidadCarneProductor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPlanillaUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, QRCtrls, jpeg, QuickRpt,
  ComCtrls, StdCtrls, ExtCtrls, QRExport, QRPDFFilt, UPrincipal;

type
  TFPlanillaCalidadCarneProductor = class(TFPlanillaUniversal)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel28: TQRLabel;
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
    QRLabel34: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRBDetailPlanilla: TQRBand;
    QRDBTRP: TQRDBText;
    QRSDetailPlanilla: TQRShape;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
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
    QRPDFFilter1: TQRPDFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRLabel20: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
  private
    procedure PasarAnimales;
  public
    procedure ConfigurarReporte; override;
  end;

var
  FPlanillaCalidadCarneProductor: TFPlanillaCalidadCarneProductor;

implementation

{$R *.dfm}


procedure TFPlanillaCalidadCarneProductor.PasarAnimales;
begin
end;

procedure TFPlanillaCalidadCarneProductor.ConfigurarReporte;
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
    IBQAnimales.SQL.Add('SELECT * FROM PLANILLA_CALIDAD_CARNE(:ESTA)');
    IBQAnimales.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
    IBQAnimales.Open;
    QRDBTRP.DataField := 'RP_ANIMAL';
  end;
end;


end.
