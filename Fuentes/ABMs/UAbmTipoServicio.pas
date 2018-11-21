unit UAbmTipoServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, IBStoredProc;

type
  TFABMTipoServicio = class(TFABMSimple)
    DBENombre: TDBEditAuto;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMTipoServicio: TFABMTipoServicio;

implementation

{$R *.dfm}

end.
