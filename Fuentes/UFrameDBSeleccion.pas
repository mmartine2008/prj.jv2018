unit UFrameDBSeleccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, UBDBGrid, StdCtrls, Buttons, ExtCtrls,
  IBCustomDataSet, IBUpdateSQL, DB, IBQuery, jpeg, pngimage, JvExExtCtrls,
  JvImage;

type
  TFrameSeleccion = class(TFrame)
    PSeleccion: TPanel;
    GBSeleccionados: TGroupBox;
    BDBGSeleccionados: TBitDBGrid;
    GBDisponibles: TGroupBox;
    BDBGDisponibles: TBitDBGrid;
    IBQDisponibles: TIBQuery;
    DSDisponibles: TDataSource;
    IBUSQLIntercambiar: TIBUpdateSQL;
    IBQSeleccionados: TIBQuery;
    DSSeleccionados: TDataSource;
    PBotones: TPanel;
    IFondo: TImage;
    BBAgregarTodos: TJvImage;
    BBAgregarUno: TJvImage;
    BBEliminarUno: TJvImage;
    BBEliminarTodos: TJvImage;
    BBATodos: TBitBtn;
    BBAUno: TBitBtn;
    BBEUno: TBitBtn;
    BBETodos: TBitBtn;
    procedure BBAgregarTodosClick(Sender: TObject);
    procedure BBAgregarUnoClick(Sender: TObject);
    procedure BBEliminarUnoClick(Sender: TObject);
    procedure BBEliminarTodosClick(Sender: TObject);
    procedure BDBGDisponiblesCellClick(Column: TColumn);
    procedure BDBGSeleccionadosCellClick(Column: TColumn);

   private
    FOnSelectItem:TNotifyEvent;
  public
    { Public declarations }
    procedure ActivarQuery;
    procedure DesActivarQuery;
    procedure ActualizarLosQuery;
    procedure ControlarBotones;

  published
    property OnSelectItem: TNotifyEvent read FOnSelectItem write FOnSelectItem;
  end;

implementation

{$R *.dfm}
uses UPrincipal,uTiposGlobales;

procedure TFrameSeleccion.DesActivarQuery;
begin
  IBQSeleccionados.Close;
  IBQDisponibles.Close;
end;

procedure TFrameSeleccion.ActualizarLosQuery;
begin
  DesActivarQuery;
  ActivarQuery;
end;

procedure TFrameSeleccion.ActivarQuery;
begin
  IBQSeleccionados.Open;
  IBQSeleccionados.Last;
  IBQSeleccionados.First;
  IBQDisponibles.Open;
  IBQDisponibles.Last;
  IBQDisponibles.First;
end;

procedure TFrameSeleccion.ControlarBotones;
begin
  BBEliminarUno.Visible   := (IBQSeleccionados.RecordCount > 0) and (BDBGSeleccionados.SelectedRows.Count >0);
  BBEliminarTodos.Visible := (IBQSeleccionados.RecordCount > 0)and (BDBGSeleccionados.SelectedRows.Count >= 0);
  BBAgregarTodos.Visible  := (IBQDisponibles.RecordCount > 0)and (BDBGDisponibles.SelectedRows.Count >= 0);
  BBAgregarUno.Visible    := (IBQDisponibles.RecordCount > 0) and (BDBGDisponibles.SelectedRows.Count >0) ;
end;


procedure TFrameSeleccion.BBAgregarUnoClick(Sender: TObject);
var i:integer;
begin
  if BDBGDisponibles.SelectedRows.Count > 0 then
  begin
    with BDBGDisponibles.DataSource.DataSet do
    for i:=0 to BDBGDisponibles.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(BDBGDisponibles.SelectedRows.Items[i]));
        if Assigned(FOnSelectItem) then
          FOnSelectItem(Self);
        IBQSeleccionados.Database.ApplyUpdates([IBQSeleccionados]);
      end;
    BDBGDisponibles.SelectedRows.Clear;
    ActualizarLosQuery;
    ControlarBotones;
  end;
end;


procedure TFrameSeleccion.BBEliminarUnoClick(Sender: TObject);
var i:integer;
begin
  if BDBGSeleccionados.SelectedRows.Count > 0 then
  begin
    with BDBGSeleccionados.DataSource.DataSet do
    for i:=0 to BDBGSeleccionados.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(BDBGSeleccionados.SelectedRows.Items[i]));
        IBQSeleccionados.Delete;
        IBQSeleccionados.Database.ApplyUpdates([IBQSeleccionados]);
      end;
    BDBGDisponibles.SelectedRows.Clear;
    ActualizarLosQuery;
    ControlarBotones;
  end;
end;

procedure TFrameSeleccion.BBAgregarTodosClick(Sender: TObject);
var i:integer;
begin
  if BDBGDisponibles.DataSource.DataSet.RecordCount -1 >= 0 then
  begin
    BDBGDisponibles.DataSource.DataSet.First;
    for i:= BDBGDisponibles.DataSource.DataSet.RecordCount -1 downto 0 do
    begin
      if Assigned(FOnSelectItem) then
        FOnSelectItem(Self);
      IBQSeleccionados.Database.ApplyUpdates([IBQSeleccionados]);
      BDBGDisponibles.DataSource.DataSet.Next;
    end;
    DesActivarQuery;
    ActivarQuery;
    ControlarBotones;
  end;
end;

procedure TFrameSeleccion.BBEliminarTodosClick(Sender: TObject);
var i : integer;
begin
  if BDBGSeleccionados.DataSource.DataSet.RecordCount > 0 then
  begin
    BDBGSeleccionados.DataSource.DataSet.First;
    for i:= BDBGSeleccionados.DataSource.DataSet.RecordCount -1 downto 0 do
    begin
      IBQSeleccionados.Delete;
      IBQSeleccionados.Database.ApplyUpdates([IBQSeleccionados]);
      BDBGDisponibles.DataSource.DataSet.Next;
    end;

    ActualizarLosQuery;
    ControlarBotones;
  end;
end;

procedure TFrameSeleccion.BDBGDisponiblesCellClick(Column: TColumn);
begin
  BDBGSeleccionados.SelectedRows.Clear;
  ControlarBotones;
end;

procedure TFrameSeleccion.BDBGSeleccionadosCellClick(Column: TColumn);
begin
 BDBGDisponibles.SelectedRows.Clear;
 ControlarBotones;
end;

end.
