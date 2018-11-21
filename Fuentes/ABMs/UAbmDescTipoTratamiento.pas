unit UAbmDescTipoTratamiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, IBQuery, Menus, DB,
  ImgList, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, UDMSoftvet, UDBLookupComboBoxAuto, UPrincipal, JvExControls,
  JvLabel, PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMDescTipoTratamiento = class(TFABMSimple)
    LCodigo: TLabel;
    DBECodigo: TDBEditAuto;
    LNombre: TLabel;
    DBENombre: TDBEditAuto;
    LSinonimo: TLabel;
    DBESinonimo: TDBEditAuto;
    LTipo: TLabel;
    IBQTiposTratamientos: TIBQuery;
    DSTipoTratamientos: TDataSource;
    IBQAbmSimpleID_TRATAMIENTO: TIntegerField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    IBQAbmSimpleID_TIPO_TRATAMIENTO: TIntegerField;
    IBQAbmSimpleDESCRIPCIONTRATAMIENTO: TIBStringField;
    DBLCBATipo: TDBLookupComboBoxAuto;
    procedure AcGuardarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AcEliminarExecute(Sender: TObject);
    procedure IBQTiposTratamientosAfterOpen(DataSet: TDataSet);
    procedure DBLCBATipoCloseUp(Sender: TObject);
    procedure AcElegirExecute(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
  private
    tipo_tratamiento : integer;
    procedure CargarParametrosSimple(); override;
  public
    { Public declarations }
  end;

var
  FABMDescTipoTratamiento: TFABMDescTipoTratamiento;

implementation

uses UMensajeHuella;

{$R *.dfm}

procedure TFABMDescTipoTratamiento.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
end;

procedure TFABMDescTipoTratamiento.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := True;
  PermiteInsertar := True;
  IBQTiposTratamientos.Close;
  IBQTiposTratamientos.Open;
  tipo_tratamiento := 1;
end;

procedure TFABMDescTipoTratamiento.AcEliminarExecute(Sender: TObject);
begin
  if (IBQAbmSimple.FieldByName('id_tratamiento').AsInteger <= 120) then
      MostrarMensaje(tmError, 'Esta descripción de tratamiento no se puede borrar.')
    else
      inherited;
end;

procedure TFABMDescTipoTratamiento.IBQTiposTratamientosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  IBQTiposTratamientos.Last;
  IBQTiposTratamientos.First;
end;

procedure TFABMDescTipoTratamiento.CargarParametrosSimple();
begin
  if IBQAbmSimple.State = dsInsert then
    IBQAbmSimple.FieldByName('ID_TIPO_TRATAMIENTO').Value := tipo_tratamiento;
end;

procedure TFABMDescTipoTratamiento.DBLCBATipoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBATipo.KeyValue <> null then
    tipo_tratamiento := DBLCBATipo.KeyValue;
end;

procedure TFABMDescTipoTratamiento.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMDescTipoTratamiento.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
      desdeEvento:=IBQAbmSimple.FieldValues['ID_TRATAMIENTO'];
end;

end.
