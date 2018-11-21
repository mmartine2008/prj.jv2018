unit UAbmServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, DBCtrls, Mask, UDBEditAuto, UDBDateTimePickerAuto;

type
  TFABMServicios = class(TFABMSimple)
    DBLCBTipos: TDBLookupComboBox;
    IBQTipos: TIBQuery;
    IBDSTipos: TDataSource;
    DBEANombre: TDBEditAuto;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBDateTimePicker1: TDBDateTimePicker;
    DBDateTimePicker2: TDBDateTimePicker;
    DBDateTimePicker3: TDBDateTimePicker;
    IBQTiposID_TIPO_SERVICIO: TIntegerField;
    IBQTiposNOMBRE: TIBStringField;
    procedure BBAgregarMasClick(Sender: TObject);
    procedure DBLCBTiposEnter(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure DBLCBTiposExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMServicios: TFABMServicios;

implementation

uses UAbmTipoServicio, UPrincipal;

{$R *.dfm}

procedure TFABMServicios.BBAgregarMasClick(Sender: TObject);
var
  abm : TFABMTipoServicio;
begin
  inherited;
  abm := TFABMTipoServicio.Create(self);
  abm.Abrir(faAbm);
end;



procedure TFABMServicios.DBLCBTiposEnter(Sender: TObject);
begin
  inherited;
  IBQTipos.Close;
  IBQTipos.Open;
end;

procedure TFABMServicios.AcEditarExecute(Sender: TObject);
begin
  inherited;
  DBLCBTipos.KeyValue := BDBGAbm.Columns[5].Field.Value;
end;

procedure TFABMServicios.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  DSAbmSimple.Edit;
  DSAbmSimple.DataSet.FieldByName('Tipo').AsInteger := StrToInt(DBLCBTipos.KeyValue);
end;

procedure TFABMServicios.DBLCBTiposExit(Sender: TObject);
begin
  inherited;
  DSAbmSimple.Edit;
  DSAbmSimple.DataSet.FieldByName('TIPO').AsInteger := StrToInt(DBLCBTipos.KeyValue);

end;

procedure TFABMServicios.FormCreate(Sender: TObject);
begin
  inherited;
  IBQTipos.Close;
  IBQTipos.Open;
  PermiteCambio := False;
  IBQAbmSimple.Close;
  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
  IBQAbmSimple.Open;
end;

end.
