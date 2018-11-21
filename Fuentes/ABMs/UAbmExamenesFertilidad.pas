unit UAbmExamenesFertilidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, ComboBoxAuto, UDBLookupComboBoxAuto,
  IBStoredProc, WinXP, DataExport, DataToXLS, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMExamenesFertilidad = class(TFABMSimple)
    LNombre: TLabel;
    DBECodigo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    LCodigo: TLabel;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
    IBQAbmSimpleID_EXAMEN_CLINICO: TIntegerField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure AcEliminarExecute(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
  public
  end;

var
  FABMExamenesFertilidad: TFABMExamenesFertilidad;

implementation

uses
  UMensajeHuella;

{$R *.dfm}

procedure TFABMExamenesFertilidad.FormCreate(Sender: TObject);
begin
  inherited;
//  PermiteCambio := True;
//  PermiteInsertar := True;
end;

procedure TFABMExamenesFertilidad.AcEliminarExecute(Sender: TObject);
begin
  if (IBQAbmSimple.FieldByName('id_examen_clinico').AsInteger <= 9) then
      MostrarMensaje(tmError, 'Esta causa de examen clínico no se puede borrar.')
  else
    inherited;
end;

procedure TFABMExamenesFertilidad.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_EXAMEN_CLINICO'];
end;

procedure TFABMExamenesFertilidad.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
