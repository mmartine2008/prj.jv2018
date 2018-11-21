unit UABMSubcategorizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  PngImageList, IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc,
  ActnList, ComCtrls, JvExExtCtrls, JvImage, JvExControls, JvLabel, Grids,
  DBGrids, UBDBGrid, StdCtrls, Buttons, pngimage, jpeg, ExtCtrls, JvGIF,
  Mask, DBCtrls, UDBEditAuto, UImportacion;

type
  TFABMSubcategorizacion = class(TFABMSimple)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEASinonimo: TDBEditAuto;
    DBEACodigo: TDBEditAuto;
    DBEANombre: TDBEditAuto;
    procedure FormShow(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcElegirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMSubcategorizacion: TFABMSubcategorizacion;

implementation

{$R *.dfm}

procedure TFABMSubcategorizacion.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
  begin;
    AcInsertar.Visible := true;
    AcInsertar.Enabled := true;
    AcInsertarExecute(Sender);
  end;
end;

procedure TFABMSubcategorizacion.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  BBEliminar.Enabled := not (IBQABMSimple.FieldByName('id_subcategorizacion').AsInteger = 0);
  if desdeEvento > -1 then
    desdeEvento := IBQAbmSimple.FieldValues['id_subcategorizacion'];
end;

procedure TFABMSubcategorizacion.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteInsertar := true;
  PermiteCambio := true;
end;

procedure TFABMSubcategorizacion.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1] := DBEANombre.Text;
end;

procedure TFABMSubcategorizacion.AcSalirExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1] := 'NO DEFINIDO';
end;

procedure TFABMSubcategorizacion.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
  begin
    DBEANombre.Text := nom;
    DBEASinonimo.Text := nom;
    DBEACodigo.Text := nom[1] + nom[2];
  end;
end;

procedure TFABMSubcategorizacion.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
