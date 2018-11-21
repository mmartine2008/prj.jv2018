unit UAbmEstadoReproductivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, UDBLookupComboBoxAuto, IBStoredProc,
  WinXP, DataExport, DataToXLS, JvExControls, JvLabel, PngImage, jpeg,
  JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMEstadoReproductivo = class(TFABMSimple)
    LCodigo: TLabel;
    DBECodigo: TDBEditAuto;
    LNombre: TLabel;
    DBEditANombre: TDBEditAuto;
    LMensaje: TLabel;
    DBEMensaje: TDBEditAuto;
    LEntraTacto: TLabel;
    DBLCBAEntraTacto: TDBLookupComboBoxAuto;
    LEntraServicio: TLabel;
    DBLCBAEntraServicio: TDBLookupComboBoxAuto;
  private
  public
  end;

var
  FABMEstadoReproductivo: TFABMEstadoReproductivo;

implementation

{$R *.dfm}

end.
