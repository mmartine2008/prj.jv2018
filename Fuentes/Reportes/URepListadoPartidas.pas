unit URepListadoPartidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, QuickRpt, QRCtrls,
  pngimage, JvExExtCtrls, JvImage;

type
  TFRepListadoPartidas = class(TFUniversal)
    QRListadoPartidas: TQuickRep;
    QRBTitulo: TQRBand;
    QRBDetalle: TQRBand;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    IBQListadoPartidas: TIBQuery;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
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
    QRLCantPartidas: TQRLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepListadoPartidas: TFRepListadoPartidas;

implementation

uses uTiposGlobales, UPrincipal;

{$R *.dfm}

procedure TFRepListadoPartidas.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRListadoPartidas.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

end.
