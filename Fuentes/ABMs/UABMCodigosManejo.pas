unit UABMCodigosManejo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, UImportacion, JvExControls, JvLabel, PngImage, jpeg, JvGIF,
  PngImageList, JvExExtCtrls, JvImage;

type
  TFABMCodigosManejo = class(TFABMSimple)
    DBEANombre: TDBEditAuto;
    DBEACodigo: TDBEditAuto;
    DBEASinonimo: TDBEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEANroCodigo: TDBEditAuto;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcElegirExecute(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  FABMCodigosManejo: TFABMCodigosManejo;

implementation

{$R *.dfm}

procedure TFABMCodigosManejo.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteInsertar := true;
  PermiteCambio := true;
end;

procedure TFABMCodigosManejo.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  BBEliminar.Enabled := not (IBQABMSimple.FieldByName('id_codigo_manejo').AsInteger = 0);
  if desdeEvento > -1 then
    desdeEvento := IBQAbmSimple.FieldValues['id_codigo_manejo'];
end;

procedure TFABMCodigosManejo.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
  begin;
    AcInsertar.Visible := true;
    AcInsertar.Enabled := true;
    AcInsertarExecute(Sender);
  end;
end;

procedure TFABMCodigosManejo.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1] := DBEANombre.Text;
end;

procedure TFABMCodigosManejo.AcSalirExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1] := 'NO DEFINIDO';
end;

procedure TFABMCodigosManejo.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
  begin
    DBEANombre.Text := nom;
    DBEASinonimo.Text := nom;
    DBEACodigo.Text := nom[1] + nom[2];
  end;
end;

procedure TFABMCodigosManejo.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
