unit UAbmCondicionCorporal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, IBStoredProc, WinXP, DataExport,
  DataToXLS, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMCondicionCorporal = class(TFABMSimple)
    DBEAEscala5: TDBEditAuto;
    DBEAEscala10: TDBEditAuto;
    LEscala5: TLabel;
    LEscala10: TLabel;
  private
  public
  end;

var
  FABMCondicionCorporal: TFABMCondicionCorporal;

implementation

{$R *.dfm}

end.
