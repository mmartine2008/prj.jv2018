unit UTareasPendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids,
  Buttons, UPrincipal, IBQuery, MPlayer, UDMSoftvet, DBCtrls, DateUtils, Types,
  ImgList, UMensajeHuella, PngImageList, pngimage, JvExExtCtrls, JvImage,
  JvExControls, JvLabel, JvGIF;

type
  TFTareasPendientes = class(TFUniversal)
    PDatos: TPanel;
    PTareas: TPanel;
    GBTareas: TGroupBox;
    PBotones: TPanel;
    IBQChekAlarmas: TIBQuery;
    DSCheckAlarmas: TDataSource;
    DBGTareas: TDBGrid;
    IBQBorrarUnaAlarma: TIBQuery;
    IBQEliminarTodasAlarma: TIBQuery;
    IBQChekAlarmasTITULO: TIBStringField;
    IBQChekAlarmasNOTA: TIBStringField;
    IBQChekAlarmasFECHA: TDateField;
    IBQChekAlarmasHORA_INICIO: TTimeField;
    IBQChekAlarmasID_TAR: TIntegerField;
    IBQChekAlarmasID_ALARM: TIntegerField;
    GroupBox1: TGroupBox;
    BBSalir: TBitBtn;
    BBDescartar: TBitBtn;
    BBDescartarTodas: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DBTTitulo: TDBText;
    Label4: TLabel;
    DBMNota: TDBMemo;
    DBTHora: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    DBTFecha: TDBText;
    Label5: TLabel;
    Image1: TImage;
    ImageList: TImageList;
    IBQChekAlarmasITERADA: TIBStringField;
    IBQChekAlarmasITERACION: TIntegerField;
    IBQUpdateAlarm: TIBQuery;
    IBQChekAlarmasFECHA_ALARMA: TDateField;
    IBQChekAlarmasHORA_ALARM: TTimeField;
    procedure BBDescartarTodasClick(Sender: TObject);
    procedure BBDescartarClick(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGTareasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    hora_aux, min_aux, tipo_aux : Integer;
    pasa : boolean;     
  public
    function ChekTareas(hora, min, tipo : Integer) : boolean;
  end;

var
  FTareasPendientes: TFTareasPendientes;

implementation

{$R *.dfm}
function TFTareasPendientes.ChekTareas(hora, min, tipo : Integer) : boolean;
var
  iteracion : integer;
  fecha, fecha_n : TDate;
  hora_al, hora_n : TTime;
  id_alarma : integer;
begin
  hora_aux := hora;
  min_aux := min;
  tipo_aux := tipo;
  IBQChekAlarmas.Close;
  IBQChekAlarmas.ParamByName('hora').AsInteger := hora;
  IBQChekAlarmas.ParamByName('min').AsInteger := min;
  IBQChekAlarmas.ParamByName('Tipo').AsInteger := tipo;
  IBQChekAlarmas.Open;
  Result := not IBQChekAlarmas.IsEmpty;
  if not (IBQChekAlarmas.IsEmpty) then
  begin
      IBQChekAlarmas.First;
      if (tipo = 0) then
      begin
        if IBQChekAlarmas.FieldValues['ITERADA'] = 'S' then
        begin
          id_alarma := IBQChekAlarmas.FieldValues['ID_ALARM'];
          fecha := IBQChekAlarmas.FieldValues['FECHA_ALARMA'];
          hora_al := IBQChekAlarmas.FieldValues['HORA_ALARM'];
          iteracion := IBQChekAlarmas.FieldValues['ITERACION'];
          fecha_n := IncMinute(fecha, iteracion);
          if iteracion < 1460 then
            hora_n := IncMinute(hora_al,iteracion)
          else
            hora_n := hora_al;

          try
            IBQUpdateAlarm.Close;
            IBQUpdateAlarm.ParamByName('hora_n').AsTime := hora_n;
            IBQUpdateAlarm.ParamByName('fecha_n').AsDate := fecha_n;
            IBQUpdateAlarm.ParamByName('id').AsInteger := id_alarma;
            IBQUpdateAlarm.Open;
            FPrincipal.IBTPrincipal.CommitRetaining;
          except
            FPrincipal.IBTPrincipal.RollbackRetaining;
          end;

        end;

        {BBDescartar.Enabled := false;
        BBDescartarTodas.Enabled := false;}
      end
      else
        //MPAnimal.Play;
  end;
end;

procedure TFTareasPendientes.BBDescartarTodasClick(Sender: TObject);
begin
  inherited;
  IBQEliminarTodasAlarma.Close;
  IBQEliminarTodasAlarma.Open;
  Fprincipal.IBTPrincipal.CommitRetaining;
  ChekTareas(hora_aux,min_aux,tipo_aux);
  Close();
end;

procedure TFTareasPendientes.BBDescartarClick(Sender: TObject);
begin
  inherited;
  if IBQChekAlarmas.FieldByName('id_alarm').Value <> null then
  begin
    IBQBorrarUnaAlarma.Close;
    IBQBorrarUnaAlarma.ParamByName('id').AsInteger := DBGTareas.DataSource.DataSet.fieldByName('id_alarm').AsInteger;
    IBQBorrarUnaALarma.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
    ChekTareas(hora_aux,min_aux,tipo_aux);
  end
  else
    MostrarMensaje(tmInformacion,'La tarea seleccionada no posee una alarma activa');
end;

procedure TFTareasPendientes.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;


procedure TFTareasPendientes.FormCreate(Sender: TObject);
begin
  inherited;
  if (FPrincipal.RolUsuarioActual <> 'ADMINISTRADOR') then
  begin
    BBDescartarTodas.Enabled := false;
    BBDescartar.Enabled := false;  
  end;
end;

procedure TFTareasPendientes.DBGTareasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  B : TBitMap;
begin
  inherited;
  if (Column.FieldName = 'ID_ALARM') then
  begin
    if IBQChekAlarmas.FieldByName('ID_ALARM').Value = null then
    begin
      B := TBitMap.Create;
      ImageList.GetBitmap(1,B);
      DBGTareas.Canvas.StretchDraw(Rect,B);
    end
    else
    begin
      B := TBitMap.Create;
      ImageList.GetBitmap(0,B);
      DBGTareas.Canvas.StretchDraw(Rect,B);
    end
  end;
end;

end.
