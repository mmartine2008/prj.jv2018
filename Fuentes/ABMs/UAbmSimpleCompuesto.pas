unit UAbmSimpleCompuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, IBStoredProc;

type
  TFABMSimpCompuesto = class(TFABMSimple)
    PNN: TPanel;
    Panel1: TPanel;
    Label5: TLabel;
    LBdelosDisponibles: TListBox;
    Panel3: TPanel;
    BBAgregarTodos: TBitBtn;
    BBAgregarUno: TBitBtn;
    BBEliminarUno: TBitBtn;
    BBEliminarTodos: TBitBtn;
    Panel2: TPanel;
    LBSeleccionados: TListBox;
    Panel4: TPanel;
    BBGenerar: TBitBtn;
    BBRelacionar: TBitBtn;
    AAgregarTodos: TAction;
    AAgregarUno: TAction;
    AEliminarUno: TAction;
    IBQSeleccionados: TIBQuery;
    DSSeleccionados: TDataSource;
    DBGrid1: TDBGrid;
    IBQdelosDisponibles: TIBQuery;
    Button1: TButton;
    procedure AcInsertarExecute(Sender: TObject);
    procedure BBRelacionarClick(Sender: TObject);
    procedure AAgregarTodosExecute(Sender: TObject);
    procedure AAgregarUnoExecute(Sender: TObject);
    procedure AEliminarUnoExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  public
  end;

var
  FABMSimpCompuesto: TFABMSimpCompuesto;

implementation

{$R *.dfm}

{ TFABMSimpCompuesto }
                             
procedure TFABMSimpCompuesto.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  PNN.Visible := false;
end;

procedure TFABMSimpCompuesto.BBRelacionarClick(Sender: TObject);
begin
  inherited;
  PNN.Visible := true;
end;

procedure TFABMSimpCompuesto.AAgregarTodosExecute(Sender: TObject);
var i:integer;
    info: string;
begin
  inherited;
   for i:= LBdelosDisponibles.Count -1 downto 0 do
     begin
            info:= LBdelosDisponibles.Items.Strings[i];
            LBSeleccionados.Items.Add(info);
            LBdelosDisponibles.Items.Delete(i);
     end;
end;

procedure TFABMSimpCompuesto.AAgregarUnoExecute(Sender: TObject);
var i:integer;
    info: string;
begin
  inherited;
  for i:= LBdelosDisponibles.Count -1 downto 0 do
     begin
        if LBdelosDisponibles.Selected[i] then
          begin
            info:= LBdelosDisponibles.Items.Strings[i];
            LBSeleccionados.Items.Add(info);
            LBdelosDisponibles.Items.Delete(i);
          end;
     end;
end;

procedure TFABMSimpCompuesto.AEliminarUnoExecute(Sender: TObject);
var i:integer;
    info: string;
begin
  inherited;
  for i:= LBSeleccionados.Count -1 downto 0 do
     begin
        if LBSeleccionados.Selected[i] then
          begin
            info:= LBSeleccionados.Items.Strings[i];
            LBdelosDisponibles.Items.Add(info);
            LBSeleccionados.Items.Delete(i);
          end;
     end;
end;

procedure TFABMSimpCompuesto.Button1Click(Sender: TObject);
begin
  inherited;
  IBQSeleccionados.ParamByName('ID_FORMULARIO').Value := DSAbmSimple.DataSet.FieldValues['ID_FORMULARIO'];
end;

end.
