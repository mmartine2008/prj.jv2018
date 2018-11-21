unit URacionDatosAd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, PngImage, StdCtrls, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, ExtCtrls, JvGIF, jpeg, JvExExtCtrls, JvImage,
  ImgList, PngImageList;

type
  TFRacionDatosAd = class(TFUniversal)
    Label3: TLabel;
    EPorc: TEdit;
    EPrecio: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PBotones: TPanel;
    IFondoB: TImage;
    LAceptDatos: TLabel;
    IAceptDatos: TImage;
    lbTotalRacion: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure IAceptDatosClick(Sender: TObject);
    procedure EPrecioChange(Sender: TObject);
    procedure EPorcChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    precio, porc ,origPorc, totalRacion : Double;
  end;

var
  FRacionDatosAd: TFRacionDatosAd;

implementation

{$R *.dfm}

procedure TFRacionDatosAd.EPrecioChange(Sender: TObject);
var
  valor_D : double;
begin
  inherited;
  if TryStrToFloat((Sender as TEdit).Text,valor_d) then
    precio := valor_d
  else
    (Sender as TEdit).Text := '0';
end;

procedure TFRacionDatosAd.EPorcChange(Sender: TObject);
var
  valor_D : double;
begin
  inherited;
  if TryStrToFloat((Sender as TEdit).Text,valor_d) then
    porc := valor_d
  else
    (Sender as TEdit).Text := '0';

  if ( totalRacion - origPorc  +porc > 100.001) then
        lbTotalRacion.font.Color := clRed
  else
        lbTotalRacion.font.Color := clBlack;
  lbTotalRacion.Caption := '% Total :' + FormatFloat('#0.00',  totalRacion - origPorc  +porc);
end;

procedure TFRacionDatosAd.FormCreate(Sender: TObject);
begin
  inherited;
  porc := 0;
  precio := 0;
end;

procedure TFRacionDatosAd.IAceptDatosClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFRacionDatosAd.FormShow(Sender: TObject);
begin
  inherited;
  EPorc.SetFocus;
end;

end.
