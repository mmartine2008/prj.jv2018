unit UAbmCronologiaDentaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, IBStoredProc, WinXP, DataExport,
  DataToXLS, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMCronologiaDentaria = class(TFABMSimple)
    LCodigo: TLabel;
    DBECodigo: TDBEditAuto;
    LNombre: TLabel;
    DBENombre: TDBEditAuto;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
  private
  public
  end;

var
  FABMCronologiaDentaria: TFABMCronologiaDentaria;

implementation

{$R *.dfm}

end.
