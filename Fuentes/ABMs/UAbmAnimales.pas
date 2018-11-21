unit UAbmAnimales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, DB, IBQuery, Menus,
  ImgList, ActnList, StdCtrls, Buttons, Grids, DBGrids, UBDBGrid, ComCtrls,IBDButtonABM,
  ExtCtrls, IBStoredProc, DataExport, DataToXLS, WinXP, JvExControls,
  JvLabel, PngImage, jpeg, JvGIF, PngImageList, EditAuto, JvExExtCtrls,
  JvImage;

type
  TFABMAnimales = class(TFABMSimple, IButtonABM)
    PFiltros: TPanel;
    CBApodo: TCheckBox;
    EAApodo: TEditAuto;
    EANombre: TEditAuto;
    CBNombre: TCheckBox;
    EARP: TEditAuto;
    CBRP: TCheckBox;
    CBHBA: TCheckBox;
    EAHBA: TEditAuto;
    LVerAnimales: TLabel;
    IVerAnimales: TImage;
    procedure AcSalirExecute(Sender: TObject);
    procedure AcElegirExecute(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure EValorFiltrarChange(Sender: TObject);
    procedure CBCriterioFiltrarChange(Sender: TObject);
    procedure IBQAbmSimpleAfterOpen(DataSet: TDataSet);
    procedure IVerAnimalesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBRPClick(Sender: TObject);
    procedure CBHBAClick(Sender: TObject);
    procedure CBNombreClick(Sender: TObject);
    procedure CBApodoClick(Sender: TObject);
    procedure IBQAbmSimpleFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure IBQAbmSimpleBeforeOpen(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    SQLOriginal : String;
    function  ICreate(AOwner: TComponent): TFABMSimple;
    function  IValorRetorno: Variant;
    procedure IShow;
    procedure IFitrate(sexo:integer;establecimiento: integer);
    procedure IAbrir(forma:TFormaAbm);
    procedure ISetCampoRetorno(campo:String);
    function  IModalResult: Integer;
  public
  end;

var
  FABMAnimales: TFABMAnimales;

implementation

uses uTiposGlobales,UPrincipal;

{$R *.dfm}

(*
  Ocultamos los botones antes de abrir
*)
procedure TFABMAnimales.IAbrir(forma: TFormaAbm);
begin
   BBInsertar.Visible := false;
   BBEditar.Visible   := false;
   BBEliminar.Visible := false;
   BBGuardar.Visible  := false;
   Abrir(forma);
end;

(*
  Hacemos una creacion normal
*)
function TFABMAnimales.ICreate(AOwner: TComponent): TFABMSimple;
begin
  Result := TFABMAnimales.Create(AOwner);
end;

(*
  Se filtra el query principal con el sexo y el establecimiento
*)
procedure TFABMAnimales.IFitrate(sexo: integer;establecimiento:integer);
begin
  IBQAbmSimple.Close;
  IBQAbmSimple.ParamByName('sexo').Value := sexo;
  IBQAbmSimple.ParamByName('establecimiento').Value := establecimiento;
  IBQAbmSimple.Open;
end;

(*
  Se hace un showmodal
*)
procedure TFABMAnimales.IShow;
begin
  self.ShowModal;
end;

(*
  Devolvemos el valor seleccionado por el usuario
*)
function TFABMAnimales.IValorRetorno: Variant;
begin
  Result := ValorRetorno;
end;

(*
  Establecemos el campo a devolver
*)
procedure TFABMAnimales.ISetCampoRetorno(campo: String);
begin
  CampoRetorno := campo;
end;

(*
  Devolvemos el ModalResult estandar
*)
function TFABMAnimales.IModalResult: Integer;
begin
  Result := ModalResult;
end;

(*
  Salimos en modo Cancel
*)
procedure TFABMAnimales.AcSalirExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

(*
  Salimos en modo Ok
*)
procedure TFABMAnimales.AcElegirExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TFABMAnimales.AcEditarExecute(Sender: TObject);
begin
//  inherited;

end;

procedure TFABMAnimales.EValorFiltrarChange(Sender: TObject);
begin
  inherited;
  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
  IBQAbmSimple.ParamByName('sexo').Value := 1;
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
end;

procedure TFABMAnimales.CBCriterioFiltrarChange(Sender: TObject);
begin
  inherited;
  IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
  IBQAbmSimple.ParamByName('sexo').Value := 1;
  IBQAbmSimple.Close;
  IBQAbmSimple.Open;
end;

procedure TFABMAnimales.IBQAbmSimpleAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if (AcElegir.Visible) then
    AcElegir.Enabled:= not(DataSet.IsEmpty);
end;

procedure TFABMAnimales.IVerAnimalesClick(Sender: TObject);
var
  SQLStr : String;
begin
  inherited;
  SQLStr := '';

  if CBRP.Checked then
    //if (SQLStr <> '') then
      SQLStr := SQLStr + ' and (a.id_rp like ''%' +EARP.Text+ '%'')';
    //else
    //  SQLStr := ' (id_rp like ''%' +EARP.Text+ '%'')';

  if CBHBA.Checked then
    //if (SQLStr <> '') then
      SQLStr := SQLStr + ' and (a.id_hba like ''%' +EAHBA.Text+ '%'')';
    //else
    //  SQLStr := ' (id_hba like ''%' +EAHBA.Text+ '%'')';

  if CBNombre.Checked then
    //if (SQLStr <> '') then
      SQLStr := SQLStr + ' and (a.nombre like ''%' +EANombre.Text+ '%'')';
    //else
    //  SQLStr := ' (nombre like ''%' +EANombre.Text+ '%'')';

  if CBApodo.Checked then
    //if (SQLStr <> '') then
      SQLStr := SQLStr + ' and (a.apodo like ''%' +EAApodo.Text+ '%'')' ;
    //else
    //  SQLStr := ' (apodo like ''%' +EAApodo.Text+ '%'')';

  IBQAbmSimple.Close;
  IBQAbmSimple.SQL.Clear;
  IBQAbmSimple.SQL.Add(SQLOriginal);

  if (SQLStr <> '') then
    IBQAbmSimple.SQL.Append(SQLStr);

  IBQAbmSimple.Open;
  IBQAbmSimple.Last;
  IBQAbmSimple.First;

  BDBGAbm.SetFocus;
end;

procedure TFABMAnimales.FormCreate(Sender: TObject);
begin
  inherited;
  SQLOriginal := 'select A.APODO, A.ID_ANIMAL, A.ID_HBA, A.ID_OTRO, A.ID_PC, A.ID_RA, A.ID_RP, A.ID_SENASA, A.NOMBRE as nomani, CR.nombre as nombreraza from TAB_ANIMALES A,';
  SQLOriginal := SQLOriginal+'  COD_SEXOS C, COD_RAZAS CR where (C.tipo = :sexo) and (A.sexo = C.id_sexo) and (a.raza=cr.id_raza) and ( ID_ANIMAL not in  (select  ANIMAL from tab_semen))';
  SQLOriginal := SQLOriginal + ' and (establecimiento = :establecimiento)  and (A.activo = ''S'' ) and';
  SQLOriginal := SQLOriginal + ' ( ID_ANIMAL not in  (select  ee.ANIMAL from eve_eventos ee join eve_castracion ec on ee.id_evento = ec.id_evento))';
end;

procedure TFABMAnimales.CBRPClick(Sender: TObject);
begin
  inherited;
  EARP.Enabled := CBRP.Checked;
  EARP.Clear;
end;

procedure TFABMAnimales.CBHBAClick(Sender: TObject);
begin
  inherited;
  EAHBA.Enabled := CBHBA.Checked;
  EAHBA.Clear;
end;

procedure TFABMAnimales.CBNombreClick(Sender: TObject);
begin
  inherited;
  EANombre.Enabled := CBNombre.Enabled;
  EANombre.Clear;
end;

procedure TFABMAnimales.CBApodoClick(Sender: TObject);
begin
  inherited;
  EAApodo.Enabled := CBApodo.Checked;
  EAApodo.Clear;
end;

procedure TFABMAnimales.IBQAbmSimpleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 // inherited;

end;

procedure TFABMAnimales.IBQAbmSimpleBeforeOpen(DataSet: TDataSet);
begin
 // inherited;
 IBQAbmSimple.ParamByName('ESTABLECIMIENTO').AsInteger := fprincipal.EstablecimientoActual;
 IBQAbmSimple.ParamByName('sexo').Value := 1;
end;

procedure TFABMAnimales.FormResize(Sender: TObject);
begin
//  inherited;

end;

procedure TFABMAnimales.FormShow(Sender: TObject);
begin
  inherited;
  IInsertar.Visible := false;
  LInsertar.Visible := false;
  IEliminar.Visible := false;
  LEliminar.Visible := false;
  IFiltro.Visible := false;
  LFiltro.Visible := false;
  LBuscar.Visible := false;
  IBuscar.Visible := false;
end;

end.
