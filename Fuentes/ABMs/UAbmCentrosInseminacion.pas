unit UAbmCentrosInseminacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, ComboBoxAuto, UDBLookupComboBoxAuto,
  IBStoredProc, WinXP, DataExport, DataToXLS, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMCentrosInseminacion = class(TFABMSimple)
    LNombre: TLabel;
    DBECodigo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    LCodigo: TLabel;
    IBQAbmSimpleID_CENTRO: TIntegerField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
  public
  end;

var
  FABMCentrosInseminacion: TFABMCentrosInseminacion;

implementation

{$R *.dfm}

(*
  Los Centros de Inseminacion son modificables por el usurio
*)
procedure TFABMCentrosInseminacion.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
end;

procedure TFABMCentrosInseminacion.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_CENTRO'];
end;

procedure TFABMCentrosInseminacion.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;


end.
