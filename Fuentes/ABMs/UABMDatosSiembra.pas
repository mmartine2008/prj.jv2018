unit UABMDatosSiembra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, Buttons, PngImage, jpeg, Grids, DBGrids,
  UBDBGrid, ExtCtrls, JvGIF, Mask, DBCtrls, UDBEditAuto, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMDatosSiembra = class(TFABMSimple)
    DBESinonimo: TDBEditAuto;
    LSinonimo: TLabel;
    LCodigo: TLabel;
    DBECodigo: TDBEditAuto;
    LNombre: TLabel;
    DBENombre: TDBEditAuto;
    procedure FormCreate(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMDatosSiembra: TFABMDatosSiembra;

implementation

{$R *.dfm}

procedure TFABMDatosSiembra.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
end;

procedure TFABMDatosSiembra.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_SIEMBRA'];
end;

procedure TFABMDatosSiembra.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
