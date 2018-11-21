unit UABMSuplementacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, JvExExtCtrls,
  JvImage, StrUtils, PngImageList;

type
  TFABMSuplementacion = class(TFABMSimple)
    IBQAbmSimpleID_TIPO_SUPLEMENTACION: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    DBENombre: TDBEditAuto;
    DBECodigo: TDBEditAuto;
    DBESinonimo: TDBEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEAPorcMS: TDBEditAuto;
    IBQAbmSimplePORC_MS: TFloatField;
    IBQAbmSimpleCANTIDAD: TFloatField;
    DBEACantidad: TDBEditAuto;
    Label5: TLabel;
    IBQAbmSimplePRECIO: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
    procedure DBENombreChange(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMSuplementacion: TFABMSuplementacion;

implementation

{$R *.dfm}

procedure TFABMSuplementacion.FormShow(Sender: TObject);
begin
  inherited;
  PermiteCambio := true;
  PermiteInsertar := true;
  if desdeEvento > -1 then
    AcInsertar.Execute;
end;

procedure TFABMSuplementacion.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_TIPO_SUPLEMENTACION'];
end;

procedure TFABMSuplementacion.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMSuplementacion.DBENombreChange(Sender: TObject);
begin
  inherited;
  if Length(DBENombre.Text) > 1 then
    DBECodigo.Text := LeftStr(DBENombre.Text,2)
  else
    DBECodigo.Text := LeftStr(DBENombre.Text,1);
  DBESinonimo.Text := DBENombre.Text;
end;

procedure TFABMSuplementacion.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  if desdeEvento > -1 then
    AcElegirExecute(self);
end;

end.
