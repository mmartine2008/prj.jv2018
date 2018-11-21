unit UABMDescMetodoSinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, EditAuto, Mask,
  DBCtrls, UDBEditAuto, UDBLookupComboBoxAuto, UDMSoftvet, JvExControls,
  JvLabel, PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMDescMetodoSinc = class(TFABMSimple)
    DBENombre: TDBEditAuto;
    DBECodigo: TDBEditAuto;
    DBESinonimo: TDBEditAuto;
    DBLCBAMetodosSinc: TDBLookupComboBoxAuto;
    IBQMetodosSinc: TIBQuery;
    DSMetodosSinc: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    IBQAbmSimpleID_DESCRIPCION: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    IBQAbmSimpleMETODO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure IBQAbmSimpleBeforePost(DataSet: TDataSet);
    procedure AcElegirExecute(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    Metodo : Integer;
  end;

var
  FABMDescMetodoSinc: TFABMDescMetodoSinc;

implementation

uses
  UPrincipal,UImportacion;

{$R *.dfm}

procedure TFABMDescMetodoSinc.FormCreate(Sender: TObject);
begin
  inherited;
  IBQMetodosSinc.Close;
  IBQMetodosSinc.Open;
  IBQMetodosSinc.Last;
  IBQMetodosSinc.First;
  
  PermiteCambio := true;
  PermiteInsertar := true;
  Metodo := -1;
end;

procedure TFABMDescMetodoSinc.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if IBQAbmSimple.FieldByName('id_descripcion').AsInteger in [0..1] then
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
    desdeEvento:=IBQAbmSimple.FieldValues['ID_DESCRIPCION'];
end;

procedure TFABMDescMetodoSinc.IBQAbmSimpleBeforePost(DataSet: TDataSet);
begin
  inherited;
  IBQAbmSimple.FieldValues['METODO'] := DBLCBAMetodosSinc.KeyValue;
end;

procedure TFABMDescMetodoSinc.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMDescMetodoSinc.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
  begin
     DBENombre.Text := nom;
     DBESinonimo.Text := nom;
     DBECodigo.Text := nom[1]+nom[2];
  end;
end;

procedure TFABMDescMetodoSinc.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
  begin;
    AcInsertar.Visible:=true;
    AcInsertar.Enabled:=true;
    AcInsertarExecute(Sender);
    if Metodo <> -1 then
      DBLCBAMetodosSinc.KeyValue := Metodo;
  end;
end;

procedure TFABMDescMetodoSinc.AcSalirExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:='NO DEFINIDO';
end;

procedure TFABMDescMetodoSinc.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
      TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:=DBENombre.Text;
end;

end.
