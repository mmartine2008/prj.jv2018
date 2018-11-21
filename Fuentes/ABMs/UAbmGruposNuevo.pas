unit UAbmGruposNuevo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, UFrameMangazo,
  Mask, DBCtrls, UDBEditAuto, UPrincipal, UDMSoftvet, UDBLookupComboBoxAuto,
  JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList, JvExExtCtrls,
  JvImage;

type
  TFABMGruposNuevo = class(TFABMSimple)
    PManga: TPanel;
    Mangazo: TMangazo;
    IBQAbmSimpleESTABLECIMIENTO: TIntegerField;
    IBQAbmSimpleID_GRUPO: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleDESCRIPCION: TIBStringField;
    IBQAbmSimpleTIPO: TIBStringField;
    IBQAbmSimpleTIPO_EVENTO: TIntegerField;
    IBQAbmSimpleVISIBLE: TIntegerField;
    Panel1: TPanel;
    DBEADescripcion: TDBEditAuto;
    Label2: TLabel;
    DBEANombre: TDBEditAuto;
    Label1: TLabel;
    IBSPSeleccionados: TIBStoredProc;
    IBSPAgregarAnimales: TIBStoredProc;
    CBSexo: TCheckBox;
    DBLCBASexo: TDBLookupComboBoxAuto;
    IBQEliminarRelacion: TIBQuery;
    BBImprimirReporte: TBitBtn;
    IPreliminar: TImage;
    LPreliminar: TLabel;
    procedure AcEditarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure DBEANombreChange(Sender: TObject);
    procedure MangazoBBAgregarTodosClick(Sender: TObject);
    procedure MangazoBBAgregarUnoClick(Sender: TObject);
    procedure MangazoBBEliminarUnoClick(Sender: TObject);
    procedure MangazoBBEliminarTodosClick(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure CBSexoClick(Sender: TObject);
    procedure DBLCBASexoCloseUp(Sender: TObject);
    procedure AcEliminarExecute(Sender: TObject);
    procedure MangazoBDBGSeleccionadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure MangazoBDBGDisponiblesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure MangazoIBQDisponiblesBeforeOpen(DataSet: TDataSet);
    procedure MangazoIBQDisponiblesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure MangazoIBQSeleccionadosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure IBQAbmSimpleBeforeOpen(DataSet: TDataSet);
    procedure MangazoDBLCBGrupoCloseUp(Sender: TObject);
    procedure MangazoIBQSeleccionadosAfterOpen(DataSet: TDataSet);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Grupo : Integer;
    Sexo : Integer;
    CantActivosD, CantInactivosD ,CantActivosS , CantInactivosS : Integer;
    procedure CargarParametrosSimple; override;
    procedure AnchoAltoEstatico; override;
    function OpcionesParaGrabar : Boolean; override;
    procedure BorrarTabsAuxiliares;
    procedure PasarAnimalesAGrupo;
  public
    { Public declarations }
  end;

var
  FABMGruposNuevo: TFABMGruposNuevo;

implementation

uses UREPListadoAnimalesGrupo;

{$R *.dfm}

procedure TFABMGruposNuevo.AcEditarExecute(Sender: TObject);
begin
  try
    IBSPSeleccionados.Close;
    IBSPSeleccionados.ParamByName('grupo').AsInteger := Grupo;
    IBSPSeleccionados.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBSPSeleccionados.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  Mangazo.IBQSeleccionados.Close;    //lo agrego aca porque en FrameMangazo se desactivo para arreglar las mangas en creacion servicio natural y corral
  Mangazo.IBQSeleccionados.Open;

  Mangazo.EjecutarSQL;
  ControlEventoChange(nil);
  LPreliminar.Visible := true;
  IPreliminar.Visible := true;
  inherited;

  Self.Height := 740;
  Self.Width := 1010;
  Self.Top := 1;
  Self.Left := 6;
  
end;

procedure TFABMGruposNuevo.FormCreate(Sender: TObject);
begin
  Grupo := 0;
  Sexo := 1;
  Mangazo.SQLBasico := 'select A.ID_ANIMAL, A.ID_RP, A.NOMBRE, A.ID_SENASA, A.id_pc, A.id_hba, A.id_otro, A.ACTIVO from VIS_ANIMALES A where A.id_animal not in(select animal from rel_pertenece_grupo where grupo = :grupo)';
  Mangazo.AgregarParametros(['sexo']);
  Mangazo.PasarParametros(0,0);
  Mangazo.Vista:= 'VIS_ANIMALES';

  Mangazo.IBQSeleccionados.Close;    //lo agrego aca porque en FrameMangazo se desactivo para arreglar las mangas en creacion servicio natural y corral
  Mangazo.IBQSeleccionados.Open;

  Mangazo.RBTodas.Checked := true;
  inherited;
  PermiteCambio := true;
  DMSoftvet.IBQTipoSexo.Close;
  DMSoftvet.IBQTipoSexo.Open;
end;

procedure TFABMGruposNuevo.CargarParametrosSimple;
begin
  if (IBQABMSimple.State in [dsInsert,dsEdit]) then
  begin
    IBQABMSimple.FieldByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQABMSimple.FieldByName('tipo').AsString := 'U';
    IBQABMSimple.FieldByName('visible').AsInteger := 1;
  end;
end;

procedure TFABMGruposNuevo.AnchoAltoEstatico;
begin
  Width := 800;
  Height := 600;
end;

procedure TFABMGruposNuevo.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  Grupo := 0;
  if IBQABMSimple.FieldValues['ID_GRUPO'] <> null then
    Grupo := IBQABMSimple.FieldValues['ID_GRUPO'];
  Mangazo.AgregarValorParametro('grupo',Grupo);
end;

function TFABMGruposNuevo.OpcionesParaGrabar : Boolean;
begin
  Result := (DBEANombre.Text <> '') AND (not Mangazo.IBQSeleccionados.IsEmpty);
end;

procedure TFABMGruposNuevo.DBEANombreChange(Sender: TObject);
begin
  inherited;
  ControlEventoChange(nil);
end;

procedure TFABMGruposNuevo.MangazoBBAgregarTodosClick(Sender: TObject);
begin
  inherited;
  Mangazo.BBAgregarTodosClick(Sender);
  ControlEventoChange(nil);
end;

procedure TFABMGruposNuevo.MangazoBBAgregarUnoClick(Sender: TObject);
begin
  inherited;
  Mangazo.BBAgregarUnoClick(Sender);
  ControlEventoChange(nil);
end;

procedure TFABMGruposNuevo.MangazoBBEliminarUnoClick(Sender: TObject);
begin
  inherited;
  Mangazo.BBEliminarUnoClick(Sender);
  ControlEventoChange(nil);
end;

procedure TFABMGruposNuevo.MangazoBBEliminarTodosClick(Sender: TObject);
begin
  inherited;
  Mangazo.BBEliminarTodosClick(Sender);
  ControlEventoChange(nil);
end;

procedure TFABMGruposNuevo.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  DBEANombre.Clear;
  DBEADescripcion.Clear;
  Grupo := 0;

  Mangazo.IBQSeleccionados.Close;    //lo agrego aca porque en FrameMangazo se desactivo para arreglar las mangas en creacion servicio natural y corral
  Mangazo.IBQSeleccionados.Open;

  Mangazo.EjecutarSQL;

  LPreliminar.Visible := true;
  IPreliminar.Visible := true;

  Width := 1010;
  Height := 740;
  Top := -3;
  Left := 12;

end;

procedure TFABMGruposNuevo.PasarAnimalesAGrupo;
begin
  try
    IBSPAgregarAnimales.Close;
    IBSPAgregarAnimales.ParamByName('grupo').AsInteger := IBQABMSimple.FieldValues['ID_GRUPO'];
    IBSPAgregarAnimales.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBSPAgregarAnimales.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFABMGruposNuevo.BorrarTabsAuxiliares;
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFABMGruposNuevo.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  PasarAnimalesAGrupo;
  BorrarTabsAuxiliares;
  LPreliminar.Visible := false;
  IPreliminar.Visible := false;

  Width := 800;
  Height := 600;
  Top := 100;
  Left := 127;

end;

procedure TFABMGruposNuevo.AcCancelarExecute(Sender: TObject);
begin
  inherited;
  BorrarTabsAuxiliares;
  LPreliminar.Visible := false;
  IPreliminar.Visible := false;

  Width := 800;
  Height := 600;
  Top := 100;
  Left := 127;

end;


///Estos 2 metodos son para filtrar por sexo ya que no se
///encuentra como filtro por defecto en el frame mangazo

procedure TFABMGruposNuevo.CBSexoClick(Sender: TObject);
begin
  inherited;
  if CBSexo.Checked then
  begin
    DBLCBASexo.Enabled := true;
    DMSoftvet.IBQSexo.First;
    Mangazo.SQLBasico := 'select ID_ANIMAL, ID_RP, ID_SENASA, id_pc, id_hba, id_otro, ACTIVO from VIS_ANIMALES where id_animal not in(select animal from rel_pertenece_grupo where grupo = :grupo) and sexo = :sexo';
    Mangazo.AgregarParametros(['sexo']);
  end
  else
  begin
    DBLCBASexo.Enabled := false;
    Mangazo.SQLBasico := 'select ID_ANIMAL, ID_RP, ID_SENASA, id_pc, id_hba, id_otro, ACTIVO from VIS_ANIMALES where id_animal not in(select animal from rel_pertenece_grupo where grupo = :grupo)';
    Mangazo.EliminarParametros(['sexo']);
  end;
  Mangazo.EjecutarSQL
end;

procedure TFABMGruposNuevo.DBLCBASexoCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBASexo.KeyValue <> null) then
    Mangazo.AgregarValorParametro('sexo',DBLCBASexo.KeyValue);
  Mangazo.EjecutarSQL;
end;

procedure TFABMGruposNuevo.AcEliminarExecute(Sender: TObject);
begin
  try
    IBQEliminarRelacion.Close;
    IBQEliminarRelacion.ParamByName('grupo').AsInteger := IBQABMSimple.FieldValues['ID_GRUPO'];
    IBQEliminarRelacion.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
    inherited;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFABMGruposNuevo.MangazoBDBGSeleccionadosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
{  if Mangazo.IBQSeleccionados.FieldValues['activo'] = 'N' then
    Mangazo.BDBGSeleccionados.Canvas.Font.Color := clSilver
  else
    Mangazo.BDBGSeleccionados.Canvas.Font.Color := clBlack;

  Mangazo.BDBGSeleccionados.Canvas.FillRect(Rect);
  Mangazo.BDBGSeleccionados.Canvas.TextOut( Rect.Left+2, Rect.Top+2, Column.Field.Text); }
end;

procedure TFABMGruposNuevo.MangazoBDBGDisponiblesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 { if Mangazo.IBQDisponibles.FieldValues['activo'] = 'N' then
    Mangazo.BDBGDisponibles.Canvas.Font.Color := clSilver
  else
    Mangazo.BDBGDisponibles.Canvas.Font.Color := clBlack;

  Mangazo.BDBGDisponibles.Canvas.FillRect(Rect);
  Mangazo.BDBGDisponibles.Canvas.TextOut( Rect.Left+2, Rect.Top+2, Column.Field.Text); }
end;

procedure TFABMGruposNuevo.MangazoIBQDisponiblesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  CantActivosD := 0;
  CantInactivosD := 0;
  CantActivosS := 0;
  CantInactivosS := 0;
end;

procedure TFABMGruposNuevo.MangazoIBQDisponiblesFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if DataSet.FieldByName('activo').AsString = 'N' then
    Inc(CantActivosD)
  else
    Inc(CantInactivosD);
end;

procedure TFABMGruposNuevo.MangazoIBQSeleccionadosFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if DataSet.FieldByName('activo').AsString = 'N' then
    Inc(CantActivosS)
  else
    Inc(CantInactivosS);
end;

procedure TFABMGruposNuevo.IBQAbmSimpleBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  IBQABMSimple.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
end;

procedure TFABMGruposNuevo.MangazoDBLCBGrupoCloseUp(Sender: TObject);
begin
  inherited;

  Grupo := Mangazo.DBLCBGrupo.KeyValue;
  Mangazo.AgregarValorParametro('grupo',Grupo);
  Mangazo.DBLCBACloseUp(Sender);

end;

procedure TFABMGruposNuevo.MangazoIBQSeleccionadosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  //BBImprimirReporte.Enabled := not Mangazo.IBQSeleccionados.IsEmpty;
  LPreliminar.Enabled := not Mangazo.IBQSeleccionados.IsEmpty;
  IPreliminar.Enabled := not Mangazo.IBQSeleccionados.IsEmpty;
end;

procedure TFABMGruposNuevo.BBImprimirReporteClick(Sender: TObject);
var
  F : TFREPListadoAnimalesGrupo;
begin
  inherited;
  F := TFREPListadoAnimalesGrupo.Create(nil);
  F.HacerConsulta;
  F.QRLGrupo.Caption := DBEANombre.Text;
  F.ShowModal;
  F.Destroy;
end;

procedure TFABMGruposNuevo.FormShow(Sender: TObject);
begin
  inherited;

  CBSexo.Visible := false;
  DBLCBASexo.Visible := false;

  Top := 100;
  Left := 127;
end;

end.
