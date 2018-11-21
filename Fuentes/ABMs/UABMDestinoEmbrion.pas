unit UABMDestinoEmbrion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMDestinoEmbrion = class(TFABMSimple)
    Label1: TLabel;
    DBEANombre: TDBEditAuto;
    DBEditAuto1: TDBEditAuto;
    Label2: TLabel;
    Label3: TLabel;
    DBEditAuto2: TDBEditAuto;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMDestinoEmbrion: TFABMDestinoEmbrion;

implementation

{$R *.dfm}

procedure TFABMDestinoEmbrion.FormCreate(Sender: TObject);
begin
  inherited;
//  PermiteCambio := true;
//  PermiteInsertar := true;
end;

end.
