unit UAbmTecnicasTratamiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, ComboBoxAuto, UDBLookupComboBoxAuto,
  IBStoredProc, WinXP, DataExport, DataToXLS, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMTecnicasTratamiento = class(TFABMSimple)
    LNombre: TLabel;
    DBECodigo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    LCodigo: TLabel;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
  private
  public
  end;

var
  FABMTecnicasTratamiento: TFABMTecnicasTratamiento;

implementation

{$R *.dfm}

end.
