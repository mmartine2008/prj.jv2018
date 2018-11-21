unit UAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  Grids, DBGrids, DB, IBCustomDataSet, IBQuery, UBDBGrid, WinXP,
  DataExport, DataToXLS, IBStoredProc, ImgList, PngImageList, pngimage,
  JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFAgenda = class(TFUniversal)
    PBotones: TPanel;
    BBSalir: TBitBtn;
    ASalir: TAction;
    PGeneral: TPanel;
    DSAvisos: TDataSource;
    IBQAvisos: TIBQuery;
    AVerAlarma: TAction;
    BBVerAlarma: TBitBtn;
    DBGAvisos: TBitDBGrid;
    CBVerTodos: TCheckBox;
    IBQAvisosID_AGENDA: TIntegerField;
    IBQAvisosFECHA_AVISO: TDateField;
    IBQAvisosCATEGORIA: TIBStringField;
    IBQAvisosTIPO: TIBStringField;
    IBQAvisosDESCRIPCION: TIBStringField;
    IBQAvisosNIVEL_CRITICIDAD: TIntegerField;
    IBQAvisosESTADO: TIBStringField;
    procedure ASalirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGAvisosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AVerAlarmaExecute(Sender: TObject);
    procedure CBVerTodosClick(Sender: TObject);
    procedure DBGAvisosTitleClick(Column: TColumn);
    procedure Sort;
  private
    SortField : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgenda: TFAgenda;

implementation

uses UPrincipal, uTiposGlobales,UVerAlarma;

{$R *.dfm}

procedure TFAgenda.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close();
end;

// para mostrar el formulario
procedure TFAgenda.FormShow(Sender: TObject);
begin
  inherited;
  if (SortField = '') then
    SortField := 'fecha_aviso';
  IBQAvisos.Active := false;
  IBQAvisos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAvisos.Active := true;
end;

// metodo que se ejecuta cuando se dibuja la grilla
procedure TFAgenda.DBGAvisosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var critico : integer;
begin
  inherited;
  if not(IBQAvisos.IsEmpty) then
    begin
      if (dataCol = 4) then
        begin
          critico := StrToInt(IBQAvisosNIVEL_CRITICIDAD.Text);
          case critico of
            1: DBGAvisos.Canvas.Brush.Color := RGB(255, 200, 200);
            2: DBGAvisos.Canvas.Brush.Color := RGB(255, 150, 150);
            3: DBGAvisos.Canvas.Brush.Color := RGB(255, 100, 100);
            4: DBGAvisos.Canvas.Brush.Color := RGB(255, 50, 50);
            5: DBGAvisos.Canvas.Brush.Color := RGB(255, 0, 0);
          end;
          DBGAvisos.Canvas.FillRect(Rect);
          DBGAvisos.Canvas.Font.Color := clBlack;
          DBGAvisos.Canvas.TextOut( Rect.Left+2, Rect.Top+2, Column.Field.Text);
        end;
        if (CBVerTodos.Checked) then
          if ((IBQAvisosESTADO.Text = 'C')or(IBQAvisosESTADO.Text = 'D')) then
            begin
              DBGAvisos.Canvas.Font.Color := clGray;
              DBGAvisos.Canvas.TextOut( Rect.Left+2, Rect.Top+2, Column.Field.Text);
            end;
    end

end;

// metodo de la accion de la alarma
procedure TFAgenda.AVerAlarmaExecute(Sender: TObject);
begin
  inherited;
  // codigo para mostrar la alarma
  if not(IBQAvisos.IsEmpty) then
    begin
      Application.CreateForm(TFVerAlarma, FVerAlarma);
      FVerAlarma.SetIdAgenda(IBQAvisos.fieldByName('id_agenda').AsInteger);
      FVerAlarma.ShowModal;
      FormShow(Sender);
    end;
end;

// metodo para ver todos las alarmas (no se si sera necesario)
procedure TFAgenda.CBVerTodosClick(Sender: TObject);
begin
  inherited;
  IBQAvisos.Active := false;
  IBQAvisos.SQL.Clear;
  if (CBVerTodos.Checked) then
    begin
      IBQAvisos.SQL.Add('select sag.id_agenda, sag.fecha_aviso, sca.nombre as categoria, sta.nombre as tipo, sav.descripcion, sav.nivel_criticidad, sag.estado');
      IBQAvisos.SQL.Add('from sys_agenda sag, sys_avisos sav, sys_categorias_aviso sca, sys_tipos_aviso sta');
      IBQAvisos.SQL.Add('where (sag.aviso = sav.id_aviso) and (sav.categoria = sca.id_categoria_aviso) and (sav.tipo = sta.id_tipo_aviso) and (establecimiento = :esta)');
      sort;
    end
  else
    begin
      IBQAvisos.SQL.Add('select sag.id_agenda, sag.fecha_aviso, sca.nombre as categoria, sta.nombre as tipo, sav.descripcion, sav.nivel_criticidad, sag.estado');
      IBQAvisos.SQL.Add('from sys_agenda sag, sys_avisos sav, sys_categorias_aviso sca, sys_tipos_aviso sta');
      IBQAvisos.SQL.Add('where (sag.aviso = sav.id_aviso) and (sav.categoria = sca.id_categoria_aviso) and (sav.tipo = sta.id_tipo_aviso) and (establecimiento = :esta) and (sag.estado = ''A'') and (''TODAY'' >= sag.fecha_aviso)');
      sort;
    end;
  IBQAvisos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAvisos.Active := true;
  FormShow(Sender);
end;

procedure TFAgenda.DBGAvisosTitleClick(Column: TColumn);
begin
  inherited;
  SortField := Column.DisplayName;
  CBVerTodosClick(Self);
end;

// para ordenar
procedure TFAgenda.Sort;
begin
  IBQAvisos.SQL.Add('order by '+ SortField);
  if (SortField = 'NIVEL_CRITICIDAD') then
    IBQAvisos.SQL.Add('desc');
end;

end.
