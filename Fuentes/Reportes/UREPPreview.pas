unit UREPPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, QRCtrls, QuickRpt, ExtCtrls, IBDatabase, IBTable,
  IBCustomDataSet, IBQuery;

type
  TFREPPreview = class(TForm)
    DS1: TDataSource;
    QRCompositeReport1: TQRCompositeReport;
    IBQMaster: TIBQuery;
    DB: TIBDatabase;
    IBTransaction1: TIBTransaction;
    QR1: TQuickRep;
    QRBand2: TQRBand;
    LabelTitle: TQRLabel;
    QRLabel2: TQRLabel;
    BANDEncabezado: TQRBand;
    IBQDetail: TIBQuery;
    BANDMaster: TQRBand;
    BANDDetail: TQRSubDetail;
    BANDTitleSubDetail: TQRChildBand;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREPPreview: TFREPPreview;

implementation

{$R *.dfm}

procedure TFREPPreview.FormShow(Sender: TObject);
begin
  QR1.Preview;
end;

end.
