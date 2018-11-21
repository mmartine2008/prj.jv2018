unit UPlanillasITAFDiag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPlanillaUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, QRCtrls, jpeg, QuickRpt,
  ComCtrls, StdCtrls, ExtCtrls, Uprincipal, ImgList, PngImageList,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFPlanillasITAFDiag = class(TFPlanillaUniversal)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBTRP: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
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
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
  private
    conDatos : Boolean;
  public
    procedure ConfigurarReporte; override;
  published
    constructor Create(Owner : TComponent; TipoEvento : Integer; AnimalesExistentes : Boolean; ConIATF : Boolean); reintroduce;
  end;

var
  FPlanillasITAFDiag: TFPlanillasITAFDiag;

implementation

{$R *.dfm}

constructor TFPlanillasITAFDiag.Create(Owner : TComponent; TipoEvento : Integer; AnimalesExistentes : Boolean; ConIATF : Boolean);
begin
  inherited Create(Owner,TipoEvento,AnimalesExistentes);
  conDatos := ConIATF;
end;

procedure TFPlanillasITAFDiag.ConfigurarReporte;
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
    if conDatos then
    begin
      QRDBTRP.DataField := 'RP_ANIMAL';
      IBQAnimales.SQL.Clear;
      IBQAnimales.SQL.Add('SELECT * FROM PLANILLA_IATF (:ESTA)');
      IBQAnimales.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
    end;
    IBQAnimales.Open;
  end;
end;

end.
