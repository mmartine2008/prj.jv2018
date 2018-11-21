unit UABMInspeccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, Mask, DBCtrls, UDBEditAuto, IBCustomDataSet,
  IBUpdateSQL, Menus, DB, ImgList, IBQuery, WinXP, DataExport, DataToXLS,
  IBStoredProc, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid,
  ComCtrls, ExtCtrls, JvExControls, JvLabel, PngImage, jpeg, JvGIF,
  PngImageList, JvExExtCtrls, JvImage;

type
  TFABMInspeccion = class(TFABMSimple)
    DBEANombre: TDBEditAuto;
    LNombre: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DBEACodigo: TDBEditAuto;
    DBEASinonimo: TDBEditAuto;
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMInspeccion: TFABMInspeccion;

implementation

{$R *.dfm}

procedure TFABMInspeccion.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_INSPECCION'];
end;

procedure TFABMInspeccion.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMInspeccion.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteInsertar := true;
  PermiteCambio := true;
end;

end.
