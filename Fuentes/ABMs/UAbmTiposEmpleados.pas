unit UAbmTiposEmpleados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, IBQuery, Menus, DB,
  ImgList, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF;

type
  TFABMTiposEmpleados = class(TFABMSimple)
    LCodigo: TLabel;
    DBECodigo: TDBEditAuto;
    LNombre: TLabel;
    DBENombre: TDBEditAuto;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMTiposEmpleados: TFABMTiposEmpleados;   

implementation

{$R *.dfm}

end.
