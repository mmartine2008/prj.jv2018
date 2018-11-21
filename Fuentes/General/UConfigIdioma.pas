unit UConfigIdioma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, Buttons, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, UPrincipal,
  ExtCtrls, DBCtrls, Grids, DBGrids, IBUpdateSQL, ImgList, PngImageList,
  pngimage, JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFConfigIdioma = class(TFUniversal)
    Panel1: TPanel;
    Panel2: TPanel;
    BBAceptar: TBitBtn;
    BBCancelar: TBitBtn;
    Panel3: TPanel;
    IBQIdiomas: TIBQuery;
    DSIdiomas: TDataSource;
    DBGIdiomas: TDBGrid;
    IBUpdateIdioma: TIBUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure DBGIdiomasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGIdiomasCellClick(Column: TColumn);
    procedure BBAceptarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
  private
    procedure CambiarValorColumna(Column: TColumn);
  public
    { Public declarations }
  end;

var
  FConfigIdioma: TFConfigIdioma;

implementation

uses
  UMensajeHuella;

{$R *.dfm}

procedure TFConfigIdioma.FormCreate(Sender: TObject);
begin
  inherited;
  IBQIdiomas.Close;
  IBQIdiomas.Open;
end;

procedure TFConfigIdioma.DBGIdiomasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  CheckBoxRectangle : TRect;
Const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  inherited;
  if (Column.FieldName = 'ACTIVO') and (Column.Field.Value <> null)then
   begin
     DBGIdiomas.Canvas.FillRect(Rect);
     CheckBoxRectangle.Left := Rect.Left + 2;
     CheckBoxRectangle.Right := Rect.Right - 2;
     CheckBoxRectangle.Top := Rect.Top + 2;
     CheckBoxRectangle.Bottom := Rect.Bottom - 2;
     if(Column.Field.AsInteger = 0)then
        DrawFrameControl(DBGIdiomas.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false])
     else
         DrawFrameControl(DBGIdiomas.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true])
    end;
end;

procedure TFConfigIdioma.DBGIdiomasCellClick(Column: TColumn);
begin
  inherited;
  if(Column.FieldName = 'ACTIVO')then
    CambiarValorColumna(Column);
end;

procedure TFConfigIdioma.CambiarValorColumna(Column: TColumn);
begin
  Column.Field.DataSet.Edit;
  if(Column.Field.AsInteger = 0)then
    Column.Field.AsInteger := 1
  else
    Column.Field.AsInteger := 0;
  Column.Field.DataSet.Post;
end;

procedure TFConfigIdioma.BBAceptarClick(Sender: TObject);
begin
  inherited;
  try
    FPrincipal.IBDPrincipal.ApplyUpdates([IBQIdiomas]);
    FPrincipal.IBTPrincipal.CommitRetaining;
    MostrarMensaje(tmInformacion,'Debe reiniciar Huella para que los cambios tengan efecto');
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  Close();
end;

procedure TFConfigIdioma.BBCancelarClick(Sender: TObject);
begin
  inherited;
  IBQIdiomas.CancelUpdates;
  Close;
end;

end.
