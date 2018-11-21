unit UAbmformulariosAcciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimpleCompuesto, IBCustomDataSet, IBUpdateSQL, DB, IBQuery,
  Menus, ImgList, ActnList, Buttons, StdCtrls, Grids, DBGrids, UBDBGrid,
  ComCtrls, ExtCtrls, Mask, DBCtrls, UDBEditAuto, IBStoredProc;

type
  TFABMFormulariosAcciones = class(TFABMSimpCompuesto)
    DBENombre: TDBEditAuto;
    Label6: TLabel;
  private
  public
  end;

var
  FABMFormulariosAcciones: TFABMFormulariosAcciones;

implementation

{$R *.dfm}

end.
