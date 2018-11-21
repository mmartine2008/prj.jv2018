unit UAbmEnfermedades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, ComboBoxAuto, UDBLookupComboBoxAuto,
  IBStoredProc, WinXP, DataExport, DataToXLS, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMEnfermedades = class(TFABMSimple)
    LNombre: TLabel;
    DBECodigo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    LCodigo: TLabel;
    LTipo: TLabel;
    DBLCBATipo: TDBLookupComboBoxAuto;
    procedure FormCreate(Sender: TObject);
    procedure DBLCBATipoCloseUp(Sender: TObject);
    procedure AcElegirExecute(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
  private
    tipo_enfermedad : integer;
    procedure CargarParametrosSimple(); override;
  public
  end;

var
  FABMEnfermedades: TFABMEnfermedades;

implementation

{$R *.dfm}

(*
  Las Enfermedades son modificables por el usurio
*)
procedure TFABMEnfermedades.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
  tipo_enfermedad := 0;
end;

procedure TFABMEnfermedades.CargarParametrosSimple();
begin
  if IBQAbmSimple.State = dsInsert then
    IBQAbmSimple.FieldByName('TIPO').Value := tipo_enfermedad;
end;


procedure TFABMEnfermedades.DBLCBATipoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBATipo.KeyValue <> null then
    tipo_enfermedad := DBLCBATipo.KeyValue;
end;

procedure TFABMEnfermedades.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMEnfermedades.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
      desdeEvento:=IBQAbmSimple.FieldValues['ID_ENFERMEDAD'];
end;

end.
