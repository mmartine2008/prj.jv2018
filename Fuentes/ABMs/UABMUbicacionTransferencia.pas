unit UABMUbicacionTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF;

type
  TFABMUbicacionTransferencia = class(TFABMSimple)
    DBEANombre: TDBEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    DBEditAuto1: TDBEditAuto;
    DBEditAuto2: TDBEditAuto;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMUbicacionTransferencia: TFABMUbicacionTransferencia;

implementation

{$R *.dfm}

procedure TFABMUbicacionTransferencia.FormCreate(Sender: TObject);
begin
  inherited;
// PermiteCambio := true;
//  PermiteInsertar := true;
end;

end.
