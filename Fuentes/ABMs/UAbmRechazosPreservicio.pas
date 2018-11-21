unit UAbmRechazosPreservicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, Mask, DBCtrls, UDBEditAuto, ComboBoxAuto, UDBLookupComboBoxAuto,
  IBStoredProc, WinXP, DataExport, DataToXLS, JvExControls, JvLabel,
  PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMRechazosPreservicio = class(TFABMSimple)
    LNombre: TLabel;
    DBECodigo: TDBEditAuto;
    DBENombre: TDBEditAuto;
    LCodigo: TLabel;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FABMRechazosPreservicio: TFABMRechazosPreservicio;

implementation

{$R *.dfm}

uses UImportacion,UDMSoftvet;

procedure TFABMRechazosPreservicio.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if IBQAbmSimple.FieldByName('id_rechazo').AsInteger in [0..3] then
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
    desdeEvento:=IBQAbmSimple.FieldValues['ID_RECHAZO'];
end;

procedure TFABMRechazosPreservicio.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMRechazosPreservicio.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
  begin;
    AcInsertar.Visible:=true;
    AcInsertar.Enabled:=true;
    AcInsertarExecute(Sender);
  end;
end;

procedure TFABMRechazosPreservicio.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
  begin
    DBENombre.Text:=nom;
    DBESinonimo.Text:=nom;
    DBECodigo.Text:=nom[1]+nom[2];
  end;
end;

procedure TFABMRechazosPreservicio.AcSalirExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1] := 'NO RECHAZADA';
end;

procedure TFABMRechazosPreservicio.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
      TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1] := DBENombre.Text;
end;

procedure TFABMRechazosPreservicio.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := true;
  PermiteInsertar := true;
end;

end.
