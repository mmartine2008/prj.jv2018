unit UAbmLotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, DBCtrls, UDBLookupComboBoxAuto, Mask, UDBEditAuto;

type
  TFABMLotes = class(TFABMSimple)
    DBENombre: TDBEditAuto;
    DBEDescripcion: TDBEditAuto;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BBAgregarMas: TBitBtn;
    IBQEstablecimientos: TIBQuery;
    IBDSEstablecimientos: TDataSource;
    IBQEstablecimientosDIRECCION: TIBStringField;
    IBQEstablecimientosEMAIL: TIBStringField;
    IBQEstablecimientosID_ESTABLECIMIENTO: TIntegerField;
    IBQEstablecimientosNOMBRE: TIBStringField;
    IBQEstablecimientosPROPIETARIO: TIBStringField;
    IBQEstablecimientosTELEFONO: TIBStringField;
    DBLCBEstablecimientos: TDBLookupComboBox;
    procedure AcEditarExecute(Sender: TObject);
    procedure DBLCBEstablecimientosExit(Sender: TObject);
    procedure BBAgregarMasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMLotes: TFABMLotes;

implementation
uses UAbmEstablecimientos;

{$R *.dfm}

procedure TFABMLotes.AcEditarExecute(Sender: TObject);
begin
  inherited;
  DBLCBEstablecimientos.KeyValue := BDBGAbm.Columns[1].Field.Value;
end;

procedure TFABMLotes.DBLCBEstablecimientosExit(Sender: TObject);
begin
  inherited;
  DSAbmSimple.Edit;
  DSAbmSimple.DataSet.FieldByName('ESTABLECIMIENTO').AsInteger := StrToInt(DBLCBEstablecimientos.KeyValue);

end;

procedure TFABMLotes.BBAgregarMasClick(Sender: TObject);
var
  abm : TFABMEstablecimientos;
begin
  inherited;
  abm := TFABMEstablecimientos.Create(self);
  abm.Abrir(faAbm);
  IBQEstablecimientos.Close;
  IBQEstablecimientos.Open;
end;

procedure TFABMLotes.FormShow(Sender: TObject);
begin
  inherited;
  IBQEstablecimientos.Open;
end;

end.
