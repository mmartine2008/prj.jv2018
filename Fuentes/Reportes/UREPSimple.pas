unit UREPSimple;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QRCtrls, QuickRpt, ActnList, ComCtrls, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, StdCtrls, IBStoredProc, WinXP, DataExport,
  DataToXLS, JvExControls, JvLabel, JvGIF, ImgList, PngImageList, pngimage,
  JvExExtCtrls, JvImage;

type
  TFREPSimple = class(TFUniversal)
    QREncabezado: TQuickRep;
    QRBand4: TQRBand;
    LabelTitulo: TQRLabel;
    LogoSoftvet: TQRImage;
    QRLFecha: TQRLabel;
    QRSysData2: TQRSysData;
    QRLEstablecimiento: TQRLabel;
    QRLPropietarioRespa: TQRLabel;
    QRLDireccion: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRSummary: TQuickRep;
    QRBand14: TQRBand;
    QRLabel14: TQRLabel;
    IBQAux: TIBQuery;
    QRCReporte: TQRCompositeReport;
    procedure QRCReporteAddReports(Sender: TObject); Virtual;
    procedure PrepararReporte();
  private                       
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREPSimple: TFREPSimple;

implementation

uses uTiposGlobales, UPrincipal;

{$R *.dfm}

{ TFUniversal1 }

procedure TFREPSimple.PrepararReporte;
begin
  //************* PARA EL SELLO DEL CLIENTE **********************
  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.Add('select * from tab_establecimientos where id_establecimiento = :n');
  IBQAux.ParamByName('n').AsInteger := Fprincipal.establecimientoActual;
  IBQAux.Active := true;

  QRLEstablecimiento.Caption := IBQAux.fieldByName('nombre').AsString;
  QRLPropietarioRespa.Caption := IBQAux.fieldByName('propietario').AsString;
  if (IBQAux.fieldByName('renspa').AsString <> '') then
    QRLPropietarioRespa.Caption := QRLPropietarioRespa.Caption + ' - '+IBQAux.fieldByName('renspa').AsString;
  QRLDireccion.Caption := IBQAux.fieldByName('direccion').AsString;
end;

procedure TFREPSimple.QRCReporteAddReports(Sender: TObject);
begin
  inherited;
  QRCReporte.Reports.Add(QREncabezado);
  QRCReporte.Reports.Add(QRSummary);
end;

end.
