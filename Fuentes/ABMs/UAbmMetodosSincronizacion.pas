unit UAbmMetodosSincronizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, ComboBoxAuto, UDBLookupComboBoxAuto,
  IBStoredProc, WinXP, DataExport, DataToXLS, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMMetodosSincronizacion = class(TFABMSimple)
    LNombre: TLabel;
    DBECodigo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    LCodigo: TLabel;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
    LHorasAviso: TLabel;
    DBEHorasAviso: TDBEditAuto;
    IBQAbmSimpleID_METODO: TIntegerField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    IBQAbmSimpleHORAS_DE_AVISO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
  public
  end;

var
  FABMMetodosSincronizacion: TFABMMetodosSincronizacion;

implementation

{$R *.dfm}

procedure TFABMMetodosSincronizacion.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := true;
  PermiteInsertar := true;
end;

procedure TFABMMetodosSincronizacion.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if IBQAbmSimple.FieldByName('id_metodo').AsInteger in [0..2] then
  begin
    BBEditar.Enabled := false;
    BBEliminar.Enabled := false;
  end
  else
  begin
    BBEditar.Enabled := true;
    BBEliminar.Enabled := true;
  end;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_METODO'];
end;

procedure TFABMMetodosSincronizacion.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
