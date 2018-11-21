unit UABMDestCabania;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMDestCabania = class(TFABMSimple)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEANombre: TDBEditAuto;
    DBEACodigo: TDBEditAuto;
    DBEASinonimo: TDBEditAuto;
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMDestCabania: TFABMDestCabania;

implementation

{$R *.dfm}

procedure TFABMDestCabania.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_DEST_CABANIA'];
end;

procedure TFABMDestCabania.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMDestCabania.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteInsertar := true;
  PermiteCambio := true;
end;

end.
