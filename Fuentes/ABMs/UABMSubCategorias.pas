unit UABMSubCategorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, UPrincipal, UFrameDBSeleccion, UMensajeHuella, UABMRaza,
  JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls,
  JvImage;

type
  TFABMSubCategorias = class(TFABMSimple)
    DBEANombre: TDBEditAuto;
    DBECodigo: TDBEditAuto;
    DBEASinonimo: TDBEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GBRaza: TGroupBox;
    FrameSeleccion: TFrameSeleccion;
    IBQSelectRazas: TIBQuery;
    IBQInsertSubcat: TIBQuery;
    IBQDelAux: TIBQuery;
    IBQInsertRelacion: TIBQuery;
    IBQEliminarRelacion: TIBQuery;
    IBQAbmSimpleID_SUBCATEGORIA: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    IBQAbmSimpleRAZAS: TStringField;
    IBQRazasSubCat: TIBQuery;
    IBSPFix_Generador_Maximo: TIBStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcEliminarExecute(Sender: TObject);
    procedure AcElegirExecute(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FrameSeleccionBDBGDisponiblesDblClick(Sender: TObject);
    procedure FrameSeleccionBDBGSeleccionadosDblClick(Sender: TObject);
    procedure IBQAbmSimpleCalcFields(DataSet: TDataSet);
    procedure FrameSeleccionBBAgregarTodosClick(Sender: TObject);
    procedure FrameSeleccionBBAgregarUnoClick(Sender: TObject);
    procedure FrameSeleccionBBEliminarUnoClick(Sender: TObject);
    procedure FrameSeleccionBBEliminarTodosClick(Sender: TObject);
  private
    procedure Seleccion(Sender : TObject);
    procedure PasarAnimales;
    procedure BorrarAux;
  protected
    procedure AnchoAltoEstatico();override;
  public
    procedure ActualizarRazas;
  end;

var
  FABMSubCategorias: TFABMSubCategorias;

implementation

{$R *.dfm}

procedure TFABMSubCategorias.Seleccion(Sender : TObject);
begin
  if not FrameSeleccion.IBQSeleccionados.Active then
    FrameSeleccion.IBQSeleccionados.Open;
  FrameSeleccion.IBQSeleccionados.Insert;
  FrameSeleccion.IBQSeleccionados.FieldByName('id_raza').Value := FrameSeleccion.IBQDisponibles.FieldValues['id_raza'];
  FrameSeleccion.IBQSeleccionados.FieldByName('raza').Value := FrameSeleccion.IBQDisponibles.FieldValues['sinonimo'];
  FrameSeleccion.IBQSeleccionados.FieldByName('id_subcategoria').Value := IBQAbmSimple.FieldValues['id_subcategoria'];
  FrameSeleccion.IBQSeleccionados.FieldByName('subcategoria').Value := IBQAbmSimple.FieldValues['nombre'];
end;

procedure TFABMSubCategorias.ActualizarRazas;
begin
  FrameSeleccion.IBQSeleccionados.Close;
  FrameSeleccion.IBQSeleccionados.Open;
  FrameSeleccion.IBQDisponibles.Close;
  FrameSeleccion.IBQDisponibles.Open;
end;

procedure TFABMSubCategorias.BorrarAux;
begin
  try
    IBQDelAux.Close;
    IBQDelAux.Open;
    Fprincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFABMSubCategorias.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteInsertar := true;
  PermiteCambio := true;
  FrameSeleccion.OnSelectItem := Seleccion;
  ActualizarRazas;                    //********************************INCIDENCIA: 401*********************************//
  //IBSPFix_SubCategorias.ExecProc;     // Se fija cual es el ID Maximo en SubCategorias y setea el generador a ese valor //
  IBSPFix_Generador_Maximo.ParamByName('COLUMNA').AsString := 'ID_SUBCATEGORIA';
  IBSPFix_Generador_Maximo.ParamByName('TABLA').AsString := 'COD_SUBCATEGORIAS';
  IBSPFix_Generador_Maximo.ParamByName('GENERADOR').AsString := 'GEN_IDSUBCATEGORIA';
  IBSPFix_Generador_Maximo.ExecProc;
  IBSPFix_Generador_Maximo.Close;
  IBSPFix_Generador_Maximo.Destroy;

  end;                                  //******************************** José Solana **********************************//


procedure TFABMSubCategorias.PasarAnimales;
begin
  IBQSelectRazas.Close;
  IBQSelectRazas.ParamByName('subcat').AsInteger := IBQAbmSimple.FieldValues['id_subcategoria'];
  IBQSelectRazas.Open;
  while not IBQSelectRazas.Eof do
  begin
    try
      IBQInsertSubcat.Close;
      IBQinsertSubcat.ParamByName('id_raza').AsInteger := IBQSelectRazas.FieldValues['id_raza'];
      IBQinsertSubcat.ParamByName('id_subcategoria').AsInteger := IBQSelectRazas.FieldValues['id_subcategoria'];
      IBQinsertSubcat.ParamByName('raza').AsString := IBQSelectRazas.FieldValues['raza'];
      IBQinsertSubcat.ParamByName('subcategoria').AsString := IBQSelectRazas.FieldValues['subcategoria'];
      IBQInsertSubcat.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
    IBQSelectRazas.Next;
  end;
end;

procedure TFABMSubCategorias.AcEditarExecute(Sender: TObject);
begin
  inherited;
  PasarAnimales;
  ActualizarRazas;
end;

procedure TFABMSubCategorias.AcCancelarExecute(Sender: TObject);
begin
  inherited;
  BorrarAux;
end;

procedure TFABMSubCategorias.AcGuardarExecute(Sender: TObject);
begin
  if FrameSeleccion.IBQSeleccionados.IsEmpty then
    MostrarMensaje(tmError,'Debe seleccionar al menos una raza para el tipo de registro')
  else
  begin
    inherited;
    try
      IBQInsertRelacion.Close;
      IBQInsertRelacion.ParamByName('subcat').AsInteger := IBQAbmSimple.FieldValues['id_subcategoria'];
      IBQInsertRelacion.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
      //if MostrarMensaje(tmConsulta,'Desea cargar otro tipo de registro?') = mrYes then
      //  AcInsertarExecute(nil)
      //else
      BorrarAux;
      MostrarMensaje(tmInformacion,'Tipo de Registro agregado correctamente');
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

procedure TFABMSubCategorias.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  BBEliminar.Enabled := not (IBQAbmSimple.FieldByName('id_subcategoria').AsInteger in [0..1]);
  if desdeEvento>-1 then
      desdeEvento:=IBQAbmSimple.FieldValues['id_subcategoria'];
end;

procedure TFABMSubCategorias.AcEliminarExecute(Sender: TObject);
begin
  try
    IBQEliminarRelacion.Close;
    IBQEliminarRelacion.ParamByName('subcat').AsInteger := IBQAbmSimple.FieldValues['id_subcategoria'];
    IBQEliminarRelacion.Open;
    inherited;
  except
  end;
end;

procedure TFABMSubCategorias.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMSubCategorias.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  ActualizarRazas;
end;

procedure TFABMSubCategorias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  BorrarAux;
end;

procedure TFABMSubCategorias.FrameSeleccionBDBGDisponiblesDblClick(
  Sender: TObject);
var
  F : TFABMRaza;
begin
  inherited;
  if not (Owner is TFABMRaza) then
  begin
    F := TFABMRaza.Create(self);
    F.IBQAbmSimple.Close;
    F.IBQAbmSimple.Open;
    F.IBQAbmSimple.Locate('id_raza',FrameSeleccion.IBQDisponibles.FieldValues['id_raza'],[]);
    //F.Estado := eaEditar;
    F.AcEditarExecute(nil);
    F.BBGuardar.Visible := true;
    F.ShowModal();
    F.Destroy;
  end;
end;

procedure TFABMSubCategorias.FrameSeleccionBDBGSeleccionadosDblClick(
  Sender: TObject);
var
  F : TFABMRaza;
begin
  inherited;
  if not (Owner is TFABMRaza) then
  begin
    F := TFABMRaza.Create(self);
    F.IBQAbmSimple.Close;
    F.IBQAbmSimple.Open;
    F.IBQAbmSimple.Locate('id_raza',FrameSeleccion.IBQSeleccionados.FieldValues['id_raza'],[]);
    //F.Estado := eaEditar;
    F.AcEditarExecute(nil);
    F.BBGuardar.Visible := true;
    F.ShowModal();
    F.Destroy;
  end;
end;

procedure TFABMSubCategorias.IBQAbmSimpleCalcFields(DataSet: TDataSet);
var
  S : String;
begin
  inherited;
  S := '';
  if IBQAbmSimpleID_SUBCATEGORIA.Value in [0..1] then
    S := 'Todas las Razas'
  else
  begin
    IBQRazasSubCat.Close;
    IBQRazasSubCat.ParamByName('subcat').AsInteger := IBQAbmSimpleID_SUBCATEGORIA.Value;
    IBQRazasSubCat.Open;
    IBQRazasSubCat.First;
    while not IBQRazasSubCat.Eof do
    begin
      S := S+IBQRazasSubCat.FieldValues['raza']+' - ';
      IBQRazasSubCat.Next;
    end;
  end;
  IBQAbmSimpleRAZAS.Value := S;
end;

procedure TFABMSubCategorias.AnchoAltoEstatico;
begin
  Height := 550;
end;

procedure TFABMSubCategorias.FrameSeleccionBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := Seleccion;
  FrameSeleccion.BBAgregarTodosClick(Sender);
end;

procedure TFABMSubCategorias.FrameSeleccionBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := Seleccion;
  FrameSeleccion.BBAgregarUnoClick(Sender);
end;

procedure TFABMSubCategorias.FrameSeleccionBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := Seleccion;
  FrameSeleccion.BBEliminarUnoClick(Sender);
end;

procedure TFABMSubCategorias.FrameSeleccionBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := Seleccion;
  FrameSeleccion.BBEliminarTodosClick(Sender);
end;

end.
