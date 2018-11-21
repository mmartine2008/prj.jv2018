unit UABMFuentesDeps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, UDBLookupComboBoxAuto, JvExControls, JvLabel, PngImage,
  jpeg, JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMFuentesDeps = class(TFABMSimple)
    IBQAbmSimpleID_FUENTE_DEPS: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleRAZA: TIntegerField;
    Label1: TLabel;
    DBEANombreFuente: TDBEditAuto;
    IBQRazas: TIBQuery;
    IBQRazasDIAS_GESTACION: TIntegerField;
    IBQRazasID_RAZA: TIntegerField;
    IBQRazasCODIGO: TIBStringField;
    IBQRazasNOMBRE: TIBStringField;
    IBQRazasSINONIMO: TIBStringField;
    DBLCBARaza: TDBLookupComboBoxAuto;
    DSRaza: TDataSource;
    IBQAbmSimpleNOM_RAZA: TStringField;
    Label2: TLabel;
    procedure IBQAbmSimpleBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
    procedure IBQRazasAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    Raza : Integer;
    Fuente : Integer;
    inserta_nuevo : Boolean;
  end;

var
  FABMFuentesDeps: TFABMFuentesDeps;

implementation

uses
  UImportacion, UMensajeHuella;

{$R *.dfm}

procedure TFABMFuentesDeps.IBQAbmSimpleBeforePost(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldValues['RAZA'] := DBLCBARaza.KeyValue;
end;

procedure TFABMFuentesDeps.FormCreate(Sender: TObject);
begin
  inherited;
  IBQRazas.Close;
  IBQRazas.Open;
  PermiteCambio := true;
  Raza := -1;
  inserta_nuevo := false;
end;

procedure TFABMFuentesDeps.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
  begin
    desdeEvento:=IBQAbmSimple.FieldValues['ID_FUENTE_DEPS'];
    Fuente := desdeEvento;
  end;
end;

procedure TFABMFuentesDeps.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMFuentesDeps.IBQRazasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQRazas.Last;
  IBQRazas.First;
end;

procedure TFABMFuentesDeps.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
  begin;
    AcInsertar.Visible:=true;
    AcInsertar.Enabled:=true;
    AcInsertarExecute(Sender);
  end;
  if Raza > 0 then
  begin
    IBQAbmSimple.Close;
    IBQAbmSimple.SQL.Append(' where raza = :raza ');
    IBQAbmSimple.ParamByName('raza').AsInteger := Raza;
    IBQAbmSimple.Open;
    if (inserta_nuevo) then
      BBInsertar.Click;
  end;
end;

procedure TFABMFuentesDeps.AcInsertarExecute(Sender: TObject);
begin

    inherited;
    if cargaDeMovil then
      DBEANombreFuente.Text:=nom;
end;

procedure TFABMFuentesDeps.AcGuardarExecute(Sender: TObject);
begin

  if (Raza = -1) then // Si carga desde códigos
  begin
    inherited;
    if cargaDeMovil then
      TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:=DBEANombreFuente.Text;
  end
  else // Si carga desde ficha animal
    begin
      if (Raza <> DBLCBARaza.KeyValue) then  // Si no corresponde a la raza del animal actual
        begin
          MostrarMensaje(tmInformacion, 'La raza seleccionada debe corresponder con la del animal seleccionado.');
        end
        else
          begin
            inherited;
            if cargaDeMovil then
              TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:=DBEANombreFuente.Text;
          end;
    end;
end;    

end.
