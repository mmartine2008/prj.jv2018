unit UAbmRecursosForrajeros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, IBQuery, Menus, DB,
  ImgList, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMRecursosForrajeros = class(TFABMSimple)
    LNombre: TLabel;
    LCodigo: TLabel;
    LSinonimo: TLabel;
    DBECodigo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    DBESinonimo: TDBEditAuto;
    IBQAbmSimpleID_RECURSO_FORRAJERO: TIntegerField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure InsertarRegistro; override;
    procedure CargarParametrosSimple; override;
  end;

var
  FABMRecursosForrajeros: TFABMRecursosForrajeros;

implementation

uses uTiposGlobales,UPrincipal;

{$R *.dfm}


procedure TFABMRecursosForrajeros.CargarParametrosSimple;
begin
  inherited;
  //IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
end;

procedure TFABMRecursosForrajeros.FormShow(Sender: TObject);
begin
  inherited;
  //BBInsertar.Enabled:= true;
  //BBEliminar.Enabled:= true;
end;

procedure TFABMRecursosForrajeros.InsertarRegistro;
begin
  inherited;
  //IBQAbmSimple.FieldByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
end;

procedure TFABMRecursosForrajeros.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
end;

procedure TFABMRecursosForrajeros.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_RECURSO_FORRAJERO'];
end;

procedure TFABMRecursosForrajeros.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
