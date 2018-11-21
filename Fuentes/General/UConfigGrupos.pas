unit UConfigGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids,
  UBDBGrid, UDMSoftvet, UPrincipal, IBQuery, UClassType, Buttons,
  JvExControls, JvLabel, JvGIF, jpeg, PngImage, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFConfigGrupos = class(TFUniversal)
    DSGrupos: TDataSource;
    IBDSGrupos: TIBDataSet;
    IBDSGruposESTABLECIMIENTO: TIntegerField;
    IBDSGruposID_GRUPO: TIntegerField;
    IBDSGruposNOMBRE: TIBStringField;
    IBDSGruposDESCRIPCION: TIBStringField;
    IBDSGruposTIPO: TIBStringField;
    IBDSGruposTIPO_EVENTO: TIntegerField;
    IBDSGruposVISIBLE: TIntegerField;
    PLeyenda: TPanel;
    PBoton: TPanel;
    PGrilla: TPanel;
    GroupBox2: TGroupBox;
    CBTodos: TCheckBox;
    CBNinguno: TCheckBox;
    DBGGrupos: TBitDBGrid;
    BBAgregarGrupo: TBitBtn;
    BBAceptar: TBitBtn;
    BBCancelar: TBitBtn;
    IFondoB: TImage;
    IAceptar: TImage;
    LAceptar: TLabel;
    ICancel: TImage;
    LCancel: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBGGruposDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGGruposCellClick(Column: TColumn);
    procedure CBTodosClick(Sender: TObject);
    procedure CBNingunoClick(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure BBAgregarGrupoClick(Sender: TObject);
  private
    SQLStringList: TStringList;
    procedure Actualizar();
    procedure CambiarValorColumna(Column: TColumn);
    procedure MarcarTodos;
    procedure BorrarTodos;
  public
    { Public declarations }
  end;

var
  FConfigGrupos: TFConfigGrupos;

implementation

{$R *.dfm}

procedure TFConfigGrupos.FormCreate(Sender: TObject);
begin
  inherited;
  Actualizar();
end;

procedure TFConfigGrupos.Actualizar();
begin
  try
    IBDSGrupos.Close;
    IBDSGrupos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBDSGrupos.Open;
  except on e:Exception do
    begin
    end;
  end;
end;

procedure TFConfigGrupos.DBGGruposDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  CheckBoxRectangle : TRect;
Const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  inherited;
  if (Column.FieldName = 'VISIBLE') and (Column.Field.Value <> null)then
   begin
     Self.DBGGrupos.Canvas.FillRect(Rect);
     CheckBoxRectangle.Left := Rect.Left + 2;
     CheckBoxRectangle.Right := Rect.Right - 2;
     CheckBoxRectangle.Top := Rect.Top + 2;
     CheckBoxRectangle.Bottom := Rect.Bottom - 2;
     if(Column.Field.AsInteger = 0)then
        DrawFrameControl(Self.DBGGrupos.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false])
     else
         DrawFrameControl(Self.DBGGrupos.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true])
    end;
end;

procedure TFConfigGrupos.DBGGruposCellClick(Column: TColumn);
begin
  inherited;
  CBTodos.Checked := false;
  CBNinguno.Checked := false;
  if(Column.FieldName = 'VISIBLE')then
    CambiarValorColumna(Column);
end;

procedure TFConfigGrupos.CambiarValorColumna(Column: TColumn);
begin
  Column.Field.DataSet.Edit;
  if(Column.Field.AsInteger = 0)then
    Column.Field.AsInteger := 1
  else
    Column.Field.AsInteger := 0;
  Column.Field.DataSet.Post;
end;

procedure TFConfigGrupos.CBTodosClick(Sender: TObject);
begin
  inherited;
  if (CBTodos.Checked) then
  begin
    CBNinguno.Checked := false;
    MarcarTodos;
  end;
end;

procedure TFConfigGrupos.MarcarTodos;
begin
  DBGGrupos.DataSource.DataSet.First;
  while not (DBGGrupos.DataSource.DataSet.Eof) do
  begin
    DBGGrupos.ColumnByField('VISIBLE').Field.DataSet.Edit;
    DBGGrupos.ColumnByField('VISIBLE').Field.AsInteger := 1;
    DBGGrupos.ColumnByField('VISIBLE').Field.DataSet.Post;
    DBGGrupos.DataSource.DataSet.Next;
  end;
  DBGGrupos.DataSource.DataSet.First;
end;

procedure TFConfigGrupos.BorrarTodos;
begin
  DBGGrupos.DataSource.DataSet.First;
  while not (DBGGrupos.DataSource.DataSet.Eof) do
  begin
    DBGGrupos.ColumnByField('VISIBLE').Field.DataSet.Edit;
    DBGGrupos.ColumnByField('VISIBLE').Field.AsInteger := 0;
    DBGGrupos.ColumnByField('VISIBLE').Field.DataSet.Post;
    DBGGrupos.DataSource.DataSet.Next;
  end;
  DBGGrupos.DataSource.DataSet.First;
end;

procedure TFConfigGrupos.CBNingunoClick(Sender: TObject);
begin
  inherited;
  if (CBNinguno.Checked) then
  begin
    CBTodos.Checked := false;
    BorrarTodos;
  end;
end;

procedure TFConfigGrupos.BBAceptarClick(Sender: TObject);
begin
  inherited;
  try
    IBDSGrupos.ApplyUpdates;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  Close();
end;

procedure TFConfigGrupos.BBCancelarClick(Sender: TObject);
begin
  inherited;
  FPrincipal.IBTPrincipal.RollbackRetaining;
  Close();
end;

procedure TFConfigGrupos.BBAgregarGrupoClick(Sender: TObject);
begin
  inherited;
  FPrincipal.AAbmGrupos.Execute;
  Actualizar;
end;

end.
