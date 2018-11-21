unit UABMEstadioEmbrion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMEstadioEmbrion = class(TFABMSimple)
    DBEANombre: TDBEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    DBEditAuto1: TDBEditAuto;
    DBEditAuto2: TDBEditAuto;
    Label3: TLabel;
    Label4: TLabel;
    DBEditAuto3: TDBEditAuto;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMEstadioEmbrion: TFABMEstadioEmbrion;

implementation

{$R *.dfm}

procedure TFABMEstadioEmbrion.FormCreate(Sender: TObject);
begin
  inherited;
//  PermiteCambio := true;
//  PermiteInsertar := true;
end;

end.
