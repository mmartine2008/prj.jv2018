unit UABMActividad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, Mask, DBCtrls, UDBEditAuto, IBCustomDataSet,
  IBUpdateSQL, Menus, DB, ImgList, IBQuery, WinXP, DataExport, DataToXLS,
  IBStoredProc, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid,
  ComCtrls, ExtCtrls, JvExControls, JvLabel, PngImage, jpeg, JvGIF,
  PngImageList, JvExExtCtrls, JvImage;

type
  TFABMActividad = class(TFABMSimple)
    LCodigo: TLabel;
    DBECodigo: TDBEditAuto;
    LNombre: TLabel;
    DBENombre: TDBEditAuto;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMActividad: TFABMActividad;

implementation

{$R *.dfm}

uses UEveSimple;

procedure TFABMActividad.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_ACTIVIDAD'];
end;

procedure TFABMActividad.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
