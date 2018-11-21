unit UMensajeCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, Buttons, PngImage, jpeg, ImgList,
  PngImageList, IBQuery, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel, ExtCtrls, JvGIF,
  DBCtrls, JvExExtCtrls, JvImage;

type
  TFMensajeCategoria = class(TFUniversal)
    PBotones: TPanel;
    IFondoBottom: TImage;
    IAceptar: TImage;
    LAceptar: TLabel;
    BBAceptar: TBitBtn;
    BBSiaTodo: TBitBtn;
    BBSi: TBitBtn;
    BBNo: TBitBtn;
    BBCancelar: TBitBtn;
    IBQCategorias: TIBQuery;
    PCli: TPanel;
    DSCategorias: TDataSource;
    Label1: TLabel;
    DBLCBCategorias: TDBLookupComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBLCBCategoriasCloseUp(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    Categoria : String;
  end;

var
  FMensajeCategoria: TFMensajeCategoria;

implementation

{$R *.dfm}

procedure TFMensajeCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  IBQCategorias.Close;
  IBQCategorias.Open;
  IBQCategorias.Last;
  IBQCategorias.First;
  Categoria := '';
end;

procedure TFMensajeCategoria.DBLCBCategoriasCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBCategorias.KeyValue <> null then
  begin
    Categoria := DBLCBCategorias.Text;
    IAceptar.Visible := true;
    LAceptar.Visible := true;
  end;
end;

procedure TFMensajeCategoria.IAceptarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
