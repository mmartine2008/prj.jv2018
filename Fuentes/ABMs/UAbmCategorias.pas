unit UAbmCategorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, ComboBoxAuto, UDBLookupComboBoxAuto,
  IBStoredProc, WinXP, DataExport, DataToXLS, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMCategorias = class(TFABMSimple)
    LNombre: TLabel;
    DBECodigo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    LCodigo: TLabel;
    LSinonimo: TLabel;
    LSexo: TLabel;
    DBESinonimo: TDBEditAuto;
    DBLCBASexo: TDBLookupComboBoxAuto;
    RGCateg: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
  private
    procedure CargarParametrosSimple; override;
  public
  end;

var
  FABMCategorias: TFABMCategorias;

implementation

{$R *.dfm}

procedure TFABMCategorias.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
  PermiteInsertar := True;
end;

procedure TFABMCategorias.CargarParametrosSimple;
begin
  if (IBQAbmSimple.State = dsInsert) or (IBQAbmSimple.State = dsEdit) then
  begin
      IBQAbmSimple.FieldByName('ref_categ').Value := RGCateg.ItemIndex+1;
      case RGCateg.ItemIndex of
        0,1,2 : IBQAbmSimple.FieldByName('tipo_sexo').Value := 1;
        3,4,5 : IBQAbmSimple.FieldByName('tipo_sexo').Value := 2;
      end;
  end;
end;

procedure TFABMCategorias.AcEditarExecute(Sender: TObject);
begin
  if not (IBQAbmSimple.FieldByName('id_categoria').AsInteger in [1..6]) then
  begin
    inherited;
    if IBQAbmSimple.FieldByName('ref_categ').Value <> null then
      case IBQAbmSimple.FieldByName('ref_categ').Value of
        1 : RGCateg.ItemIndex := 0;
        2 : RGCateg.ItemIndex := 1;
        3 : RGCateg.ItemIndex := 2;
        4 : RGCateg.ItemIndex := 3;
        5 : RGCateg.ItemIndex := 4;
        6 : RGCateg.ItemIndex := 5;
      end;
    DBENombre.Enabled := true;
    DBECodigo.Enabled := true;
  end;
end;

end.
