//*********************************************************************//
// ABMCompuesto hereda de ABMSimple.                                   //
// Se utiliza para todos aquellos formularios que requieran generar    //
// relaciones N-N con otros items.                                     //
// Usa UFrameDBSeleccion - Frame de intercambio de Items -             //
//                                                            26/12/05 //
//*********************************************************************//

unit UAbmCompuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,
  ExtCtrls, UFrameDBSeleccion, Mask, DBCtrls, UDBEditAuto, IBStoredProc,
  WinXP, DataExport, DataToXLS, JvExControls, JvLabel, PngImage, jpeg,
  JvGIF, PngImageList, JvExExtCtrls, JvImage;

type
  TFABMCompuesto = class(TFABMSimple)
    AAgregarTodos: TAction;
    AAgregarUno: TAction;
    AEliminarUno: TAction;
    GBDisponibles: TGroupBox;
    BDBGDisponibles: TBitDBGrid;
    GBSeleccionados: TGroupBox;
    BDBGSelecciondos: TBitDBGrid;
    PanelNN: TPanel;
    Panel1: TPanel;
    BBAgregarTodos: TBitBtn;
    BBEliminarUno: TBitBtn;
    BBEliminarTodos: TBitBtn;
    BBAgregarUno: TBitBtn;
    IBQDisponibles: TIBQuery;
    DSDisponibles: TDataSource;
    IBUSQLIntercambiar: TIBUpdateSQL;
    IBQSeleccionados: TIBQuery;
    DSSeleccionados: TDataSource;
    IBUSQLIntercambiarDer: TIBUpdateSQL;
    procedure BBAgregarTodosClick(Sender: TObject);
    procedure BBAgregarUnoClick(Sender: TObject);
    procedure BBEliminarUnoClick(Sender: TObject);
    procedure BBEliminarTodosClick(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOnSelectItem:TNotifyEvent;
  public
    procedure ControlarBotones;
    procedure ComponentesVisiblesPorPais(pais: Integer);override;       
  protected
    FCantidadSeleccionados:integer;  
    procedure ActualizarCantidadAnimales;    
  published
    property OnSelectItem: TNotifyEvent read FOnSelectItem write FOnSelectItem;
  end;

var
  FABMCompuesto: TFABMCompuesto;

implementation

uses UPrincipal,uTiposGlobales,UAvanceTerminar, UTraduccion;

{$R *.dfm}

(*
  Se mueven todos los elementos de la grilla disponibles
  a la grilla seleccionados
*)
procedure TFABMCompuesto.BBAgregarTodosClick(Sender: TObject);
var i:integer;
    usar_barra:boolean;
begin
  IBQDisponibles.Last;
  IBQDisponibles.First;
  usar_barra := BDBGDisponibles.DataSource.DataSet.RecordCount > 30;
  if BDBGDisponibles.DataSource.DataSet.RecordCount -1 >= 0 then
  begin
    //*/*/*/
          if usar_barra then
          begin
            FAvanceTerminar.Max := BDBGDisponibles.DataSource.DataSet.RecordCount-1;
            FAvanceTerminar.Modo := maManga;
            FAvanceTerminar.Update;
            FAvanceTerminar.Pos := 1;
          end;
     //*/*/
    for i:= BDBGDisponibles.DataSource.DataSet.RecordCount -1 downto 0 do
    begin
        BDBGDisponibles.DataSource.DataSet.First;
      if Assigned(FOnSelectItem) then
        FOnSelectItem(Self);
        IBQSeleccionados.Post;
        IBQDisponibles.Delete;
        BDBGDisponibles.DataSource.DataSet.Next;
      //*/*/*/
            if usar_barra then
            begin
              FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
              FAvanceTerminar.Update;
            end;
       //*/*/*/*
    end;
    //*/*/*/*/*
    if usar_barra then
      FAvanceTerminar.Close;
    //*/*/*
    ControlarBotones;
  end;
end;

(*
  Se mueven los elementos marcados en la grilla disponibles
  a la grilla de seleccionados
*)
procedure TFABMCompuesto.BBAgregarUnoClick(Sender: TObject);
var i:integer;
    usar_barra:boolean;
begin
  usar_barra := BDBGDisponibles.SelectedRows.Count > 30;
  if BDBGDisponibles.SelectedRows.Count > 0 then
  begin
    //*/*/*/
          if usar_barra then
          begin
            FAvanceTerminar.Max := BDBGDisponibles.SelectedRows.Count-1;
            FAvanceTerminar.Modo := maManga;
            FAvanceTerminar.Update;
            FAvanceTerminar.Pos := 1;
          end;
     //*/*/
    with BDBGDisponibles.DataSource.DataSet do
    for i:=0 to BDBGDisponibles.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(BDBGDisponibles.SelectedRows.Items[i]));
        if Assigned(FOnSelectItem) then
          FOnSelectItem(Self);
        IBQDisponibles.Delete;
         //*/*/*/
            if usar_barra then
            begin
              FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
              FAvanceTerminar.Update;
            end;
         //*/*/*/*
      end;
    IBQSeleccionados.Post;
    BDBGDisponibles.SelectedRows.Clear;
    //*/*/*/*/*
    if usar_barra then
      FAvanceTerminar.Close;
    //*/*/*
    ControlarBotones;
  end;
end;

(*
  Se mueven los elementos marcados en la grilla seleccionados
  a la grilla de disponibles
*)
procedure TFABMCompuesto.BBEliminarUnoClick(Sender: TObject);
var i:integer;
    usar_barra:boolean;
begin
  usar_barra := BDBGSelecciondos.SelectedRows.Count > 30;
  if BDBGSelecciondos.SelectedRows.Count > 0 then
  begin
    //*/*/*/
          if usar_barra then
          begin
            FAvanceTerminar.Max := BDBGSelecciondos.SelectedRows.Count-1;
            FAvanceTerminar.Modo := maManga;
            FAvanceTerminar.Update;
            FAvanceTerminar.Pos := 1;
          end;
     //*/*/
    with BDBGSelecciondos.DataSource.DataSet do
    for i:=0 to BDBGSelecciondos.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(BDBGSelecciondos.SelectedRows.Items[i]));
        if Assigned(FOnSelectItem) then
          FOnSelectItem(Self);
        IBQSeleccionados.Delete;
         //*/*/*/
            if usar_barra then
            begin
              FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
              FAvanceTerminar.Update;
            end;
         //*/*/*/*
      end;
//    IBQDisponibles.Post;
//    BDBGSelecciondos.SelectedRows.Clear;
    //*/*/*/*/*
    if usar_barra then
      FAvanceTerminar.Close;
    //*/*/*
    ControlarBotones;
  end;

end;

(*
  Se mueven todos los elementos de la grilla seleccionados
  a la grilla disponibles
*)
procedure TFABMCompuesto.BBEliminarTodosClick(Sender: TObject);
var i:integer;
    usar_barra:boolean;
begin
  IBQSeleccionados.Last;
  IBQSeleccionados.First;
  usar_barra := BDBGSelecciondos.DataSource.DataSet.RecordCount > 30;
  if BDBGSelecciondos.DataSource.DataSet.RecordCount -1 >= 0 then
  begin
     //*/*/*/
          if usar_barra then
          begin
            FAvanceTerminar.Max := BDBGSelecciondos.DataSource.DataSet.RecordCount-1;
            FAvanceTerminar.Modo := maManga;
            FAvanceTerminar.Update;
            FAvanceTerminar.Pos := 1;
          end;
     //*/*/
    BDBGSelecciondos.DataSource.DataSet.First;
    for i:= BDBGSelecciondos.DataSource.DataSet.RecordCount -1 downto 0 do
    begin
      if Assigned(FOnSelectItem) then
        FOnSelectItem(Self);
        //IBQDisponibles.Post;
        IBQSeleccionados.Delete;
        BDBGSelecciondos.DataSource.DataSet.Next;
    //*/*/*/
            if usar_barra then
            begin
              FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
              FAvanceTerminar.Update;
            end;
    //*/*/*/*
    end;
    //*/*/*/*/*
    if usar_barra then
      FAvanceTerminar.Close;
    //*/*/*
    ControlarBotones;
  end;
end;

(*
  Deshabilitamos los botones segun los elementos que haya en las
  grillas disponibles y seleccionados
*)
procedure TFABMCompuesto.ControlarBotones;
begin
  BBEliminarUno.Enabled   := (IBQSeleccionados.RecordCount > 0) and (BDBGSelecciondos.SelectedRows.Count >0);
  BBEliminarTodos.Enabled := (IBQSeleccionados.RecordCount > 0){and (BDBGSelecciondos.SelectedRows.Count = 0)};
  BBAgregarTodos.Enabled  := (IBQDisponibles.RecordCount > 0){and (BDBGDisponibles.SelectedRows.Count = 0)};
  BBAgregarUno.Enabled    := (IBQDisponibles.RecordCount > 0) and (BDBGDisponibles.SelectedRows.Count >0) ;
end;

(*
  Se pasa a modo Edit los seleccionados
*)
procedure TFABMCompuesto.AcEditarExecute(Sender: TObject);
begin
  inherited;
  IBQSeleccionados.Edit;
end;

procedure TFABMCompuesto.ActualizarCantidadAnimales;// esto no tendria que estar aca dado que antes habria que haber usado el frame UFrameMangazo
begin
  {Recorre el query para obtener la cant de registros que contiene
   sino, muestra por defecto la cantidad que se ve en la grilla. Luego se publica la cantidad de
   Animales que se encuntran Disponibles y Seleccionados}
   DSDisponibles.DataSet.First;
   DSDisponibles.DataSet.Last;
   DSSeleccionados.DataSet.First;
   DSSeleccionados.DataSet.Last;
   FCantidadSeleccionados := DSSeleccionados.DataSet.RecordCount;
   GBDisponibles.Caption := Traducir(' Disponibles [') + IntToStr(DSDisponibles.DataSet.RecordCount)+ ']';
   GBSeleccionados.Caption := Traducir(' Seleccionados [')+IntToStr(FCantidadSeleccionados)+ ']';
   DSDisponibles.DataSet.First;  {Pongo el Cursor al principio de la grilla}
   DSSeleccionados.DataSet.First;
end;

procedure TFABMCompuesto.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  if (BDBGDisponibles.Columns.Count >= 2) then
    BDBGDisponibles.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;

  if (BDBGSelecciondos.Columns.Count >= 2) then
    BDBGSelecciondos.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;
end;

procedure TFABMCompuesto.FormShow(Sender: TObject);
begin
  inherited;
  ComponentesVisiblesPorPais(-1);  
end;

procedure TFABMCompuesto.FormCreate(Sender: TObject);
begin
  inherited;
  FAvanceTerminar := TFAvanceTerminar.Create(self);
end;

end.
