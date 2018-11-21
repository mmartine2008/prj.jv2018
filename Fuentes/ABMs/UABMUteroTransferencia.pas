unit UABMUteroTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF;

type
  TFABMUteroTransferencia = class(TFABMSimple)
    DBEANombre: TDBEditAuto;
    Label1: TLabel;
    DBEditAuto1: TDBEditAuto;
    Label2: TLabel;
    Label3: TLabel;
    DBEditAuto2: TDBEditAuto;
    procedure FormCreate(Sender: TObject);
  private
    function OpcionesDeCambio : Boolean; override;
  public
    { Public declarations }
  end;

var
  FABMUteroTransferencia: TFABMUteroTransferencia;

implementation

{$R *.dfm}

procedure TFABMUteroTransferencia.FormCreate(Sender: TObject);
begin
  inherited;
//  PermiteCambio := true;
//  PermiteInsertar := true;
end;

function TFABMUteroTransferencia.OpcionesDeCambio : Boolean;
begin
  Result := not IBQABMSimple.FieldByName('ID_UTERO_TRANSFERENCIA').AsInteger in [0..1];
end;

end.
