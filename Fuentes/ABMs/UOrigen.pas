unit UOrigen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls;

type
  TFABMSimple1 = class(TFABMSimple)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMSimple1: TFABMSimple1;

implementation

{$R *.dfm}

end.
