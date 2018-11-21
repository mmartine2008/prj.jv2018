unit UCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet, shellapi,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, UPrincipal, DateUtils,
  PlannerWaitList, PlannerCal, Planner, DBPlanner, IBQuery, Buttons, UEditTareas,
  PlannerMonthView, DBPlannerMonthView, Types, UMensajeHuella, UTareasPendientes,
  ImgList, JvGIF, JvExControls, JvLabel, PngImageList, pngimage,
  JvExExtCtrls, JvImage;

type
  TFCalendario = class(TFUniversal)
    PDetalle: TPanel;
    PSeleccion: TPanel;
    DBDSPorDia: TDBDaySource;
    IBDSTareasPorFecha: TIBDataSet;
    DSTareasPorFecha: TDataSource;
    IBDSTareasPorFechaID_TAREA: TIntegerField;
    IBDSTareasPorFechaTIPO_TAREA: TIntegerField;
    IBDSTareasPorFechaNOTA: TIBStringField;
    IBDSTareasPorFechaHORA_INICIO: TTimeField;
    IBDSTareasPorFechaHORA_FIN: TTimeField;
    IBDSTareasPorFechaFECHA_INICIO: TDateField;
    IBDSTareasPorFechaFECHA_FIN: TDateField;
    DSAlarma: TDataSource;
    IBDSAlarma: TIBDataSet;
    IBDSAlarmaID_ALARMA: TIntegerField;
    IBDSAlarmaMENSAJE: TIBStringField;
    IBDSAlarmaHORA: TTimeField;
    IBDSAlarmaFECHA: TDateField;
    IBDSAlarmaITERATIVA: TIBStringField;
    IBDSAlarmaID_TAREA: TIntegerField;
    Panel2: TPanel;
    Label1: TLabel;
    LLink: TLabel;
    DBPDetalle: TDBPlanner;
    GBFecha: TGroupBox;
    PCCalendario: TPlannerCalendar;
    Label2: TLabel;
    Label3: TLabel;
    GBTareas: TGroupBox;
    BBInsertar: TBitBtn;
    BModificar: TBitBtn;
    BBEliminar: TBitBtn;
    DBMMSPorMes: TDBMultiMonthSource;
    BBCalendarioGral: TBitBtn;
    BBDiario: TBitBtn;
    BBMes: TBitBtn;
    DBPPorMes: TDBPlannerMonthView;
    Label4: TLabel;
    IBQComit: TIBQuery;
    IBQGenTarea: TIBQuery;
    IBQGenAlarma: TIBQuery;
    IBDSTareasPorFechaTITULO: TIBStringField;
    BBImprimir: TBitBtn;
    BBTareas: TBitBtn;
    IBQVerSiTieneAlarma: TIBQuery;
    ImageList1: TImageList;
    IBDSAlarmaITERACION: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BBInsertarClick(Sender: TObject);
    procedure BModificarClick(Sender: TObject);
    procedure BEliminarClick(Sender: TObject);
    procedure Cambio(Sender : TObject; origDate,newDate: TDateTime);
    procedure LLinkClick(Sender: TObject);
    procedure BBImprimirClick(Sender: TObject);
    procedure BBDiarioClick(Sender: TObject);
    procedure BBMesClick(Sender: TObject);
    procedure BBCalendarioGralClick(Sender: TObject);
    procedure DBPPorMesDaySelect(Sender: TObject; SelDate: TDateTime);
    procedure DBPPorMesItemDblClick(Sender: TObject; Item: TPlannerItem);
    procedure DBDSPorDiaFieldsToItem(Sender: TObject; Fields: TFields;
      Item: TPlannerItem);
    procedure Button1Click(Sender: TObject);
    procedure DBPPorMesItemSelect(Sender: TObject; Item: TPlannerItem);
    procedure DBPPorMesDayChange(Sender: TObject; origDate,
      newDate: TDateTime);
    procedure DBPDetalleItemExit(Sender: TObject; Item: TPlannerItem);
    procedure DBPDetallePlannerSelChange(Sender: TObject; Position,
      FromSel, FromSelPrecise, ToSel, ToSelPrecise: Integer);
    procedure BBTareasClick(Sender: TObject);
    procedure PCCalendarioDaySelect(Sender: TObject; SelDate: TDateTime);
    procedure DBPPorMesDateChange(Sender: TObject; origDate,
      newDate: TDateTime);
    procedure DBPDetallePlannerSelectCell(Sender: TObject; Index,
      Pos: Integer; var CanSelect: Boolean);
    procedure DBPPorMesFieldsToItem(Sender: TObject; Fields: TFields;
      Item: TPlannerItem);
    procedure DBMMSPorMesFieldsToItem(Sender: TObject; Fields: TFields;
      Item: TPlannerItem);
    procedure DBPPorMesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    porDia, porMes, porTrimestre: Boolean;
    SQL, tipo_consulta : String;
    Fecha : TDate;
    Hora_ini, Hora_fin : String;
    function ObtenerDias(Nro : Word) : String;
    function ObtenerMes(Nro : Word) : String;
    procedure ActualizarPlaner(fecha : TDate);
  public

  end;

var
  FCalendario: TFCalendario;

implementation

uses
  UTraduccion;

{$R *.dfm}



procedure TFCalendario.FormCreate(Sender: TObject);
var
  Dia, Mes, Anio, Semana : Word;
begin
  case FPrincipal.TipoCalendario of
    3 : begin
          LTitulo.Caption := Traducir('Calendario General');
          PTitulo.Caption := Traducir('Calendario General');
          tipo_consulta := ' ';
        end;
    1 : begin
          LTitulo.Caption := Traducir('Calendario Reproductivo');
          PTitulo.Caption := Traducir('Calendario Reproductivo');
          tipo_consulta := ' where tipo_tarea=:tipo';
        end;
    2 : begin
          LTitulo.Caption := Traducir('Calendario Sanitario');
          PTitulo.Caption := Traducir('Calendario Sanitario');
          tipo_consulta := ' where tipo_tarea=:tipo';
        end;
  end;
  //inherited;

  if (FPrincipal.RolUsuarioActual <> 'ADMINISTRADOR') then
  begin
    BBInsertar.Visible := false;
    BModificar.Visible := false;
    BBEliminar.Visible := false;
  end;

  try
    DBPPorMes.Background.LoadFromFile(extractFilePath(application.exename)+'imagenes\BackgroundCalendario.bmp');
    DBPDetalle.Background.Bitmap.LoadFromFile(extractFilePath(application.exename)+'imagenes\BackgroundCalendario.bmp');
  except
  end;

  SQL := 'select * from tab_calendario';
  IBDSTareasPorFecha.Close;
  IBDSTareasPorFecha.SelectSQL.Clear;
  IBDSTareasPorFecha.SelectSQL.Add(SQL+tipo_consulta);
  ActualizarPlaner(Date());
  Hora_ini := FormatDateTime('hh:mm',Now());
  Hora_fin := FormatDateTime('hh:mm',Now());
  PCCalendario.Date := Date();
  DecodeDayOfWeekInMonth(Date(),Anio,Mes,Semana,Dia);
  DBPPorMes.Date := Date();
  DBMMSPorMes.StartMonth := Mes;
  porMes := true;
  porDia := false;
  porTrimestre := false;
  DBPDetalle.Caption.Title := Traducir(' Detalle de Actividades para el Día ')+ObtenerDias(DayOfTheWeek(Date()))+{+ObtenerDias(Dia mod 7)+}' '+IntToStr(DayOf(Date()))+Traducir(' de ')+ObtenerMes(Mes)+Traducir(' de ')+IntToStr(Anio);
  Cambio(nil,PCCalendario.Date,PCCalendario.Date);
  BBCalendarioGral.Enabled := false;
end;

procedure TFCalendario.ActualizarPlaner(fecha : TDate);
var
  Anio, Dia, Semana, Mes : Word;
begin
  IBDSTareasPorFecha.Close;
  if (porDia) then
    IBDSTareasPorFecha.ParamByName('fecha').AsDate := fecha;
  if (Fprincipal.TipoCalendario <> 3) then
    IBDSTareasPorFecha.ParamByName('tipo').AsInteger := FPrincipal.TipoCalendario;
  IBDSTareasPorFecha.Open;
  DBPDetalle.Refresh;
  DBPPorMes.Refresh;
end;

function TFCalendario.ObtenerDias(Nro : Word) : String;
begin
  case Nro of
    1 : Result := 'Lunes';
    2 : Result := 'Martes';
    3 : Result := 'Miércoles';
    4 : Result := 'Jueves';
    5 : Result := 'Viernes';
    6 : Result := 'Sabado';
    7 : Result := 'Domingo';
  end;
end;

function TFCalendario.ObtenerMes(Nro : Word) : String;
begin
  case Nro of
    1 : Result := 'Enero';
    2 : Result := 'Febrero';
    3 : Result := 'Marzo';
    4 : Result := 'Abril';
    5 : Result := 'Mayo';
    6 : Result := 'Junio';
    7 : Result := 'Julio';
    8 : Result := 'Agosto';
    9 : Result := 'Septiembre';
    10 : Result := 'Octubre';
    11 : Result := 'Noviembre';
    12 : Result := 'Diciembre';
  end;
end;

procedure TFCalendario.BBInsertarClick(Sender: TObject);
var
  Formulario : TFUniversal;
  id_tar, id_alarm : Integer;
begin
  inherited;
  try
    IBDSTareasPorFecha.Open;
    IBDSTareasPorFecha.Insert;
    IBDSAlarma.Open;
    IBDSAlarma.Insert;
    Formulario := TFEditTareas.Create(self);
    (Formulario as TFEditTareas).DTPFechaIni.Date := PCCalendario.Date;
    (Formulario as TFEditTareas).DTPFechaFin.Date := PCCalendario.Date;
    (Formulario as TFEditTareas).DTPFechaAlarma.Date := PCCalendario.Date;
    if (porDia) then
    begin
      (Formulario as TFEditTareas).MEHoraIni.Time := StrToTime(Hora_ini);
      (Formulario as TFEditTareas).MEHoraFin.Time := StrToTime(Hora_fin);
      (Formulario as TFEditTareas).MEHoraAlarma.Time := StrToTime(Hora_ini)-EncodeTime(0,10,0,0);
    end;
    Formulario.ShowModal;
    if ((Formulario as TFEditTareas).termina) then
    begin
      IBQGenTarea.Close;
      IBQGenTarea.Open;
      id_tar := IBQGenTarea.FieldValues['ID'];
      IBQGenTarea.Close;
      IBDSTareasPorFecha.FieldByName('ID_TAREA').Value := id_tar;
      IBDSTareasPorFecha.FieldByName('tipo_tarea').Value := (Formulario as TFEditTareas).DBLCBATipoTarea.KeyValue;
      IBDSTareasPorFecha.FieldByName('fecha_inicio').Value := (Formulario as TFEditTareas).DTPFechaIni.Date;
      IBDSTareasPorFecha.FieldByName('fecha_fin').Value := (Formulario as TFEditTareas).DTPFechaFin.Date;
      IBDSTareasPorFecha.FieldByName('hora_inicio').Value := (Formulario as TFEditTareas).MEHoraIni.Time;
      IBDSTareasPorFecha.FieldByName('hora_fin').Value := (Formulario as TFEditTareas).MEHoraFin.Time;
      IBDSTareasPorFecha.ApplyUpdates;
      Fprincipal.IBTPrincipal.CommitRetaining;
      if ((Formulario as TFEditTareas).CBAlarma.Checked) then
      begin
        IBQGenAlarma.Close;
        IBQGenAlarma.Open;
        id_alarm := IBQGenAlarma.FieldValues['ID'];
        IBQGenAlarma.Close;
        IBDSAlarma.FieldByName('id_alarma').Value := id_alarm;
        IBDSAlarma.FieldByName('hora').Value := (Formulario as TFEditTareas).MEHoraAlarma.Time;
        IBDSAlarma.FieldByName('fecha').Value := (Formulario as TFEditTareas).DTPFechaAlarma.Date;
        if ((Formulario as TFEditTareas).CBIteracion.Checked) then
        begin
          IBDSAlarma.FieldByName('iterativa').Value := 'S';
          case (Formulario as TFEditTareas).RGIteracion.ItemIndex of
            0 : IBDSAlarma.FieldByName('iteracion').Value := 15;
            1 : IBDSAlarma.FieldByName('iteracion').Value := 30;
            2 : IBDSAlarma.FieldByName('iteracion').Value := 60;
            3 : IBDSAlarma.FieldByName('iteracion').Value := 120;
            4 : IBDSAlarma.FieldByName('iteracion').Value := 300;
            5 : IBDSAlarma.FieldByName('iteracion').Value := 1460;
          end;
        end
        else
          IBDSAlarma.FieldByName('iterativa').Value := 'N';
        IBDSAlarma.FieldByName('id_tarea').Value := id_tar;
        IBDSAlarma.ApplyUpdates;
        Fprincipal.IBTPrincipal.CommitRetaining;
      end;
      IBQComit.Close;
      IBQComit.Open;
      ActualizarPlaner(PCCalendario.Date);
    end;
    Formulario.Destroy;
  except
    FPRincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFCalendario.BModificarClick(Sender: TObject);
var
  Formulario : TFUniversal;
  id_tarea, id_alarma : integer;
  tiene_alarma : Boolean;
begin
  inherited;
  try
    IBDSTareasPorFecha.Open;
    IBDSTareasPorFecha.Edit;
    Formulario := TFEditTareas.Create(self);
    id_tarea := IBDSTareasPorFecha.fieldByName('id_tarea').AsInteger;
    IBDSAlarma.Close;
    IBDSAlarma.ParamByName('id_tarea').AsInteger := id_tarea;
    IBDSAlarma.Open;
    id_alarma := IBDSAlarma.fieldByName('id_alarma').AsInteger;
    tiene_alarma := not IBDSAlarma.IsEmpty;
    IBDSAlarma.Edit;
    (Formulario as TFEditTareas).DTPFechaFin.Date := IBDSTareasPorFecha.fieldByName('fecha_fin').AsDateTime;
    (Formulario as TFEditTareas).DTPFechaIni.Date := IBDSTareasPorFecha.fieldByName('fecha_inicio').AsDateTime;
    (Formulario as TFEditTareas).MEHoraFin.Time := IBDSTareasPorFecha.fieldByName('hora_fin').AsDateTime;
    (Formulario as TFEditTareas).MEHoraIni.Time := IBDSTareasPorFecha.fieldByName('hora_inicio').AsDateTime;
    (Formulario as TFEditTareas).DBLCBATipoTarea.KeyValue := IBDSTareasPorFecha.fieldByName('tipo_tarea').AsInteger;
    if (not tiene_alarma) then
    begin
      (Formulario as TFEditTareas).CBAlarma.Checked := false;
      (Formulario as TFEditTareas).DTPFechaAlarma.Date:=(Formulario as TFEditTareas).DTPFechaIni.Date;
    end
    else
    begin
      (Formulario as TFEditTareas).CBAlarma.Checked := true;
      (Formulario as TFEditTareas).MEHoraAlarma.Time := IBDSAlarma.FieldByName('hora').AsDateTime;
      (Formulario as TFEditTareas).DTPFechaAlarma.Date := IBDSAlarma.FieldByName('fecha').AsDateTime;
      if (IBDSAlarma.FieldByName('iterativa').Value = 'S') then
      begin
        (Formulario as TFEditTareas).CBIteracion.Checked := true;
        case IBDSAlarma.FieldByName('iteracion').AsInteger of
          15 : (Formulario as TFEditTareas).RGIteracion.ItemIndex := 0;
          30 : (Formulario as TFEditTareas).RGIteracion.ItemIndex := 1;
          60 : (Formulario as TFEditTareas).RGIteracion.ItemIndex := 2;
          120 : (Formulario as TFEditTareas).RGIteracion.ItemIndex := 3;
          300 : (Formulario as TFEditTareas).RGIteracion.ItemIndex := 4;
          1460 : (Formulario as TFEditTareas).RGIteracion.ItemIndex := 5;
        end;
      end
      else
        (Formulario as TFEditTareas).CBIteracion.Checked := false;
    end;
    Formulario.ShowModal;
    if ((Formulario as TFEditTareas).termina) then
    begin
      IBDSTareasPorFecha.FieldByName('fecha_fin').Value := (Formulario as TFEditTareas).DTPFechaFin.Date;
      IBDSTareasPorFecha.FieldByName('fecha_inicio').Value := (Formulario as TFEditTareas).DTPFechaIni.Date;
      IBDSTareasPorFecha.fieldByName('hora_fin').Value := (Formulario as TFEditTareas).MEHoraFin.Time;
      IBDSTareasPorFecha.fieldByName('hora_inicio').Value := (Formulario as TFEditTareas).MEHoraIni.Time;
      IBDSTareasPorFecha.FieldByName('tipo_tarea').Value := (Formulario as TFEditTareas).DBLCBATipoTarea.KeyValue;
      IBDSTareasPorFecha.ApplyUpdates;
      FPrincipal.IBTPrincipal.CommitRetaining;
      if ((Formulario as TFEditTareas).CBAlarma.Checked) then
      begin
        if (not tiene_alarma) then
        begin
          IBQGenAlarma.Close;
          IBQGenAlarma.Open;
          id_alarma := IBQGenAlarma.FieldValues['ID'];
          IBQGenAlarma.Close;
          IBDSAlarma.Insert;
        end;
        IBDSAlarma.FieldByName('id_alarma').Value := id_alarma;
        IBDSAlarma.FieldByName('id_tarea').Value := id_tarea;
        IBDSAlarma.FieldByName('hora').Value := (Formulario as TFEditTareas).MEHoraAlarma.Time;
        IBDSAlarma.FieldByName('fecha').Value := (Formulario as TFEditTareas).DTPFechaAlarma.Date;
        if ((Formulario as TFEditTareas).CBIteracion.Checked) then
        begin
          IBDSAlarma.FieldByName('iterativa').Value := 'S';
          case (Formulario as TFEditTareas).RGIteracion.ItemIndex of
            0 : IBDSAlarma.FieldByName('iteracion').Value := 15;
            1 : IBDSAlarma.FieldByName('iteracion').Value := 30;
            2 : IBDSAlarma.FieldByName('iteracion').Value := 60;
            3 : IBDSAlarma.FieldByName('iteracion').Value := 120;
            4 : IBDSAlarma.FieldByName('iteracion').Value := 300;
            5 : IBDSAlarma.FieldByName('iteracion').Value := 1460;
          end;
        end
        else
          IBDSAlarma.FieldByName('iterativa').Value := 'N';
        IBDSAlarma.ApplyUpdates;
        FPrincipal.IBTPrincipal.CommitRetaining;
      end
      else
        if (tiene_alarma) then
        begin
          IBDSAlarma.FieldByName('id_alarma').Value := id_alarma;
          IBDSAlarma.Delete;
          Fprincipal.IBTPrincipal.CommitRetaining;
        end;
        IBQComit.Close;
        IBQComit.Open;
        ActualizarPlaner(PCCalendario.Date);
    end;
    Formulario.Destroy;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFCalendario.BEliminarClick(Sender: TObject);
var
  id_alarma, id_tarea : integer;
begin
  inherited;
  try
      IBDSTareasPorFecha.Open;
      IBDSAlarma.Close;
      IBDSAlarma.ParamByName('id_tarea').AsInteger := IBDSTareasPorFecha.fieldByName('id_tarea').AsInteger;
      IBDSAlarma.Open;
      if not(IBDSAlarma.IsEmpty) then
      begin
        IBDSAlarma.Delete;
        IBDSAlarma.ApplyUpdates;
        Fprincipal.IBTPrincipal.CommitRetaining;
      end;
      IBDSTareasPorFecha.Delete;
      IBDSTareasPorFecha.ApplyUpdates;
      Fprincipal.IBTPrincipal.CommitRetaining;
      ActualizarPlaner(PCCalendario.Date);
    IBQComit.Close;
    IBQComit.Open;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFCalendario.Cambio(Sender : TObject; origDate,
  newDate: TDateTime);
var
  dia, mes, anio, semana : Word;
begin
  DBPPorMes.Date := newDate;
  ActualizarPlaner(newDate);
  Fecha := newDate;
  DecodeDate(Fecha,anio,mes,dia);
  DBPDetalle.Caption.Title := Traducir(' Detalle de Actividades para el Dia ')+ObtenerDias(DayOfTheWeek(fecha))+{+ObtenerDias(Dia mod 7)+}' '+IntToStr(DayOf(Fecha))+Traducir(' de ')+ObtenerMes(Mes)+Traducir(' de ')+IntToStr(Anio);
  BModificar.Enabled := false;
  BBEliminar.Enabled := false;
end;

procedure TFCalendario.LLinkClick(Sender: TObject);
begin
  inherited;
  ShellExecute(Application.MainForm.Handle , 'open',PChar(LLink.Caption), nil, nil, SW_MAXIMIZE);
end;

procedure TFCalendario.BBImprimirClick(Sender: TObject);
begin
  inherited;
  if (MostrarMensaje(tmConsulta,'Desea Realizar una Impresión del Calendario?')= mrYes) then
    DBPDetalle.Print;
end;

procedure TFCalendario.BBDiarioClick(Sender: TObject);
var
  where : String;
begin
  inherited;
  where := ' and :fecha between fecha_inicio and fecha_fin ';
  Fecha := PCCalendario.Date;
  IBDSTareasPorFecha.Close;
  IBDSTareasPorFecha.SelectSQL.Clear;
  if (FPrincipal.TipoCalendario = 3) then
    where := ' where :fecha between fecha_inicio and fecha_fin ';
  IBDSTareasPorFecha.SelectSQL.Add(SQL+tipo_consulta+where);
  porDia := true;
  porMes := false;
  porTrimestre := false;
  DBPPorMes.Visible := false;
  DBPDetalle.Visible := true;
  DBPDetalle.ItemSource := DBDSPorDia;
  DBPDetalle.Display.DisplayEnd := 47;
  DBPDetalle.Display.DisplayScale := 35;
  DBPDetalle.Header.Visible := false;
  DBPDetalle.MultiSelect := true;
  BBImprimir.Enabled := true;
  ActualizarPlaner(Fecha);
  BBDiario.Enabled := false;
  BBMes.Enabled := true;
  BBCalendarioGral.Enabled := true;
end;

procedure TFCalendario.BBMesClick(Sender: TObject);
var
  anio, mes, dia : word;
begin
  inherited;
  DBPPorMes.Visible := false;
  DBPDetalle.Visible := true;
  DBPDetalle.ItemSource := DBMMSPorMes;
  DBPDetalle.Display.DisplayEnd := 30;
  DBPDetalle.Display.DisplayScale := 60;
  DBPDetalle.Header.Visible := true;
  porDia := false;
  porMes := false;
  DecodeDate(PCCalendario.Date,anio,mes,dia);
  DBMMSPorMes.Year := anio;
  DBMMSPorMes.StartMonth := mes;
  porTrimestre := true;
  BBImprimir.Enabled := true;
  DBPDetalle.MultiSelect := false;
  IBDSTareasPorFecha.Close;
  IBDSTareasPorFecha.SelectSQL.Clear;
  IBDSTareasPorFecha.SelectSQL.Add(SQL+tipo_consulta);
  ActualizarPlaner(Fecha);
  DBPDetalle.Repaint;
  BBDiario.Enabled := true;
  BBMes.Enabled := false;
  BBCalendarioGral.Enabled := true;
end;

procedure TFCalendario.BBCalendarioGralClick(Sender: TObject);
begin
  inherited;
  DBPDetalle.Visible := false;
  DBPPorMes.Visible := true;
  porDia := false;
  porMes := true;
  DBPDetalle.MultiSelect := false;
  porTrimestre := false;
  BBImprimir.Enabled := false;
  IBDSTareasPorFecha.Close;
  IBDSTareasPorFecha.SelectSQL.Clear;
  IBDSTareasPorFecha.SelectSQL.Add(SQL+tipo_consulta);
  ActualizarPlaner(Fecha);
  BBDiario.Enabled := true;
  BBMes.Enabled := true;
  BBCalendarioGral.Enabled := false;
end;

procedure TFCalendario.DBPPorMesDaySelect(Sender: TObject;
  SelDate: TDateTime);
begin
  inherited;
  PCCalendario.Date := SelDate;
  //Cambio(Sender,Date(),SelDate);
end;

procedure TFCalendario.DBPPorMesItemDblClick(Sender: TObject;
  Item: TPlannerItem);
begin
  inherited;
  BModificarClick(Sender);
end;

procedure TFCalendario.DBDSPorDiaFieldsToItem(Sender: TObject;
  Fields: TFields; Item: TPlannerItem);
var
  fecha_ini, fecha_fin : TDateTime;
begin
  inherited;
  fecha_ini := Fields.fieldByName('fecha_inicio').AsDateTime;
  fecha_fin := Fields.fieldByName('fecha_fin').AsDateTime;
  if (CompareDate(fecha_ini,fecha_fin) = LessThanValue) then
  begin
    if (CompareDate(fecha_ini,PCCalendario.Date) = EqualsValue) then
    begin
      Item.ItemEndTime := fecha_fin;
      Item.ItemStartTime := Fields.fieldByName('hora_inicio').AsDateTime;
    end;
    if (CompareDate(fecha_fin,PCCalendario.Date) = EqualsValue) then
    begin
      Item.ItemEndTime := Fields.fieldByName('hora_fin').AsDateTime;
      Item.ItemStartTime := fecha_ini;
    end;
  end;
  DBPPorMesFieldsToItem(Sender,Fields,Item);
end;

procedure TFCalendario.Button1Click(Sender: TObject);
begin
  inherited;
  //PDImprimir.Execute;
  //DBPPorMes.
end;

procedure TFCalendario.DBPPorMesItemSelect(Sender: TObject;
  Item: TPlannerItem);
begin
  inherited;
  BBEliminar.Enabled := true;
  BModificar.Enabled := true;
end;

procedure TFCalendario.DBPPorMesDayChange(Sender: TObject; origDate,
  newDate: TDateTime);
begin
  inherited;
  BBEliminar.Enabled := false;
  BModificar.Enabled := false;
  PCCalendario.Date := newDate;
  Cambio(Sender,Date(),newDate);
end;

procedure TFCalendario.DBPDetalleItemExit(Sender: TObject;
  Item: TPlannerItem);
begin
  inherited;
  BBEliminar.Enabled := false;
  BModificar.Enabled := false;
end;

procedure TFCalendario.DBPDetallePlannerSelChange(Sender: TObject;
  Position, FromSel, FromSelPrecise, ToSel, ToSelPrecise: Integer);
var
  hora_i, hora_f : String;
begin
  inherited;
   //showmessage(IntToStr(FromSel));
   if ((FromSel mod 2) = 0) then
   begin
    if (FromSel < 20) then
      hora_i := '0'+IntToStr(FromSel div 2)+':00'
    else
      hora_i := IntToStr(FromSel div 2)+':00';
   end
   else
   begin
    if (FromSel < 20) then
      hora_i := '0'+IntToStr(FromSel div 2)+':30'
    else
      hora_i := IntToStr(FromSel div 2)+':30';
   end;


   if ((ToSel mod 2) = 0) then
   begin
    if (ToSel < 20) then
      hora_f := '0'+IntToStr(ToSel div 2)+':00'
    else
      hora_f := IntToStr(ToSel div 2)+':00';
   end
   else
   begin
    if (ToSel < 20) then
      hora_f := '0'+IntToStr(ToSel div 2)+':30'
    else
      hora_f := IntToStr(ToSel div 2)+':30';
   end;

   Hora_ini := hora_i;
   Hora_fin := hora_f;
 // showmessage(hora_ini+' '+hora_fin);
end;

procedure TFCalendario.BBTareasClick(Sender: TObject);
var
  F : TFTareasPendientes;
begin
  inherited;
  F := TFTareasPendientes.Create(self);
  if (F.ChekTareas(0,0,1)) then
  begin
    F.ShowModal;
    DBPDetalle.Refresh;
    DBPPorMes.Refresh;
  end
  else
    MostrarMensaje(tmInformacion,' No hay Tareas Pendientes ');
  F.Destroy;
end;

procedure TFCalendario.PCCalendarioDaySelect(Sender: TObject;
  SelDate: TDateTime);
begin
  inherited;
  DBPPorMes.Date := SelDate;
end;

procedure TFCalendario.DBPPorMesDateChange(Sender: TObject; origDate,
  newDate: TDateTime);
begin
  inherited;
  PCCalendario.Date := newDate;
end;

procedure TFCalendario.DBPDetallePlannerSelectCell(Sender: TObject; Index,
  Pos: Integer; var CanSelect: Boolean);
begin
  inherited;
  {mont DBDSPorDia.Day
  PCCalendario.Month := ;}
  {if (porTrimestre) then
     PCCalendario.Month := MonthOf(DBPDetalle.Day);}
   //DBPDetalle.
{  porDia := false;
  porMes := false;
  porTrimestre := true;}
end;

procedure TFCalendario.DBPPorMesFieldsToItem(Sender: TObject;
  Fields: TFields; Item: TPlannerItem);
begin
  inherited;
  IBQVerSiTieneAlarma.Close;
  IBQVerSiTieneAlarma.ParamByName('id').AsInteger :=  Fields.FieldByName('id_tarea').AsInteger;
  IBQVerSiTieneAlarma.Open;
  if (IBQVerSiTieneAlarma.IsEmpty) then
    Item.ImageID := 1
  else
    Item.ImageID := 0;
end;

procedure TFCalendario.DBMMSPorMesFieldsToItem(Sender: TObject;
  Fields: TFields; Item: TPlannerItem);
begin
  inherited;
  DBPPorMesFieldsToItem(Sender,Fields,Item);
end;



procedure TFCalendario.DBPPorMesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if((key = VK_INSERT) or (key = VK_DELETE))then
    key:=Word(#0);
end;

end.
