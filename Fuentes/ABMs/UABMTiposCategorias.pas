unit UABMTiposCategorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  PngImageList, IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc,
  ActnList, ComCtrls, JvExControls, JvLabel, StdCtrls, Buttons, PngImage,
  jpeg, Grids, DBGrids, UBDBGrid, ExtCtrls, JvGIF, Mask, DBCtrls,
  UDBEditAuto, UDBLookupComboBoxAuto, JvExExtCtrls, JvImage;

type
  TFABMTiposCategorias = class(TFABMSimple)
    IBQAbmSimpleID_TIPOS_CATEGORIAS: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleCATEGORIA: TIntegerField;
    DBLCBATipo: TDBLookupComboBoxAuto;
    LTipo: TLabel;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    LNombre: TLabel;
    LCodigo: TLabel;
    DBECodigo: TDBEditAuto;
    IBQCategorias: TIBQuery;
    DSCategorias: TDataSource;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    IBQAbmSimpleCATEG: TStringField;
    IBQAbmSimpleESTABLECIMIENTO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure IBQCategoriasAfterOpen(DataSet: TDataSet);
    procedure AcElegirExecute(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcGuardarExecute(Sender: TObject);
    procedure DBLCBATipoCloseUp(Sender: TObject);
  private
    categoria : integer;
    procedure CargarParametrosSimple(); override;
  public
    { Public declarations }
  end;

var
  FABMTiposCategorias: TFABMTiposCategorias;

implementation

uses
  UPrincipal;

{$R *.dfm}

procedure TFABMTiposCategorias.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
  PermiteInsertar := True;
  IBQCategorias.Close;
  IBQCategorias.Open;
  categoria := 1;
end;

procedure TFABMTiposCategorias.IBQCategoriasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQCategorias.Last;
  IBQCategorias.First;
end;

procedure TFABMTiposCategorias.AcElegirExecute(Sender: TObject);
begin
  inherited;
  BDBGAbmCellClick(nil);
end;

procedure TFABMTiposCategorias.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
      desdeEvento:=IBQAbmSimple.FieldValues['ID_tipo_tratamiento'];
end;

procedure TFABMTiposCategorias.CargarParametrosSimple;
begin
  if IBQAbmSimple.State = dsInsert then
  begin
    IBQAbmSimple.FieldByName('categoria').Value := categoria;
    IBQAbmSimple.FieldByName('establecimiento').Value := FPrincipal.EstablecimientoActual;
  end;
end;

procedure TFABMTiposCategorias.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
end;

procedure TFABMTiposCategorias.DBLCBATipoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBATipo.KeyValue <> null then
    categoria := DBLCBATipo.KeyValue;
end;

end.
