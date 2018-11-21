unit UABMLaboratorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, IBQuery, Menus, DB,
  ImgList, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMLaboratorios = class(TFABMSimple)
    Label1: TLabel;
    DBEANombre: TDBEditAuto;
    IBQAbmSimpleID_LABORATORIO: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMLaboratorios: TFABMLaboratorios;

implementation

{$R *.dfm}

procedure TFABMLaboratorios.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := true;
end;

procedure TFABMLaboratorios.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_LABORATORIO'];
end;

procedure TFABMLaboratorios.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
