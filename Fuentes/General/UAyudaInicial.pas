unit UAyudaInicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, PngImage, ImgList, PngImageList, IBQuery,
  WinXP, DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc,
  ActnList, ComCtrls, JvExControls, JvLabel, ExtCtrls, JvGIF, JvExExtCtrls,
  JvImage;

type
  TFAyudaInicial = class(TFUniversal)
    PInicioDespNuevoEstable: TPanel;
    Image11: TImage;
    Image12: TImage;
    Image17: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Image18: TImage;
    Button3: TButton;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAyudaInicial: TFAyudaInicial;

implementation

uses UMapa, UEveAltaMasiva, UMapaGoogle, UPrincipal, ShellApi;

{$R *.dfm}

procedure TFAyudaInicial.Image11Click(Sender: TObject);
var F : TFMapa;
    ConnectedState: Integer;
begin
  inherited;

  F := TFMapa.Create(self);
  F.ShowModal;
  F.Destroy;

  Close();
end;

procedure TFAyudaInicial.Image12Click(Sender: TObject);
var F : TFEveAltaMasiva;
begin
  inherited;

  F := TFEveAltaMasiva.Create(self);
  F.ShowModal;
  F.Destroy;
  Close();
end;

procedure TFAyudaInicial.Image17Click(Sender: TObject);
var p : String;
begin
  inherited;

  p := ExtractFilePath(Application.ExeName)+'Planillas\Movimientos\';

  ShellExecute(0, 'open', nil, nil, PChar(p), SW_SHOW);

end;

end.
