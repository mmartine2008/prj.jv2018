unit UABMDificultadTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMDificultadTransferencia = class(TFABMSimple)
    Label1: TLabel;
    DBEANombre: TDBEditAuto;
    Label2: TLabel;
    DBEditAuto1: TDBEditAuto;
    Label3: TLabel;
    DBEditAuto2: TDBEditAuto;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMDificultadTransferencia: TFABMDificultadTransferencia;

implementation

{$R *.dfm}

procedure TFABMDificultadTransferencia.FormCreate(Sender: TObject);
begin
  inherited;
//  PermiteCambio := true;
//  PermiteInsertar := true;
end;

end.
