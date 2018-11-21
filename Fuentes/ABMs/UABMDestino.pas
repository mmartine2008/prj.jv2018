unit UABMDestino;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMDestino = class(TFABMSimple)
    IBQAbmSimpleID_DESTINO: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    DBEditAuto1: TDBEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    DBEditAuto2: TDBEditAuto;
    DBEditAuto3: TDBEditAuto;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMDestino: TFABMDestino;

implementation

{$R *.dfm}

procedure TFABMDestino.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := true;
  PermiteInsertar := true;
end;

procedure TFABMDestino.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_DESTINO'];
end;

procedure TFABMDestino.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
