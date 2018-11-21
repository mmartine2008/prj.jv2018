unit UAbmMetodosExamenSanitario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, ComboBoxAuto, UDBLookupComboBoxAuto,
  IBStoredProc, WinXP, DataExport, DataToXLS, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMMetodosExamenSanitario = class(TFABMSimple)
    LNombre: TLabel;
    DBECodigo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    LCodigo: TLabel;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
    procedure AcEliminarExecute(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
  public
  end;

var
  FABMMetodosExamenSanitario: TFABMMetodosExamenSanitario;

implementation

uses
  UMensajeHuella;

{$R *.dfm}

procedure TFABMMetodosExamenSanitario.AcEliminarExecute(Sender: TObject);
begin
  inherited;
  if (IBQAbmSimple.FieldByName('id_metodo_examen').AsInteger <= 4) then
      MostrarMensaje(tmError, 'Este metodo de examen clínico no se puede borrar.')
  else
    inherited;
end;

procedure TFABMMetodosExamenSanitario.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_METODO_EXAMEN'];
end;

procedure TFABMMetodosExamenSanitario.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
