unit UVerAlarma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  DBCtrls, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, IBTable,
  IBUpdateSQL, UDBLookupComboBoxAuto, UDBDateTimePickerAuto, IBStoredProc,
  WinXP, DataExport, DataToXLS, ImgList, PngImageList, pngimage,
  JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFVerAlarma = class(TFUniversal)
    PBotones: TPanel;
    BBSalir: TBitBtn;
    ASalir: TAction;
    PEventosAlarma: TPanel;
    PDatosAlarma: TPanel;
    GBDatosAlarma: TGroupBox;
    LFechaRegistracion: TLabel;
    LFechaAviso: TLabel;
    LDisparador: TLabel;
    LRegistDatos: TLabel;
    LAvisoDatos: TLabel;
    LDisparadorValue: TLabel;
    LEstado: TLabel;
    LNivelCritico: TLabel;
    BBAplicarCambios: TBitBtn;
    BBCancelarCambios: TBitBtn;
    AAplicar: TAction;
    ACancelar: TAction;
    Label5: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    IBQConsulta: TIBQuery;
    DSConsulta: TDataSource;
    IBUSQLConsulta: TIBUpdateSQL;
    LNivelCriticoValue: TLabel;
    LCategoriaValue: TLabel;
    LTipoValue: TLabel;
    IBQEventos: TIBQuery;
    DSEventos: TDataSource;
    LDescripcion: TLabel;
    LDescripDatos: TLabel;
    IBQConsultaParaGuardar: TIBQuery;
    DSConsultaParaGuardar: TDataSource;
    IBQConsultaParaGuardarID_AGENDA: TIntegerField;
    IBQConsultaParaGuardarAVISO: TIntegerField;
    IBQConsultaParaGuardarID_AGENDA_DIFERIDO: TIntegerField;
    IBQConsultaParaGuardarFECHA_REGISTRACION: TDateField;
    IBQConsultaParaGuardarFECHA_AVISO: TDateField;
    IBQConsultaParaGuardarESTABLECIMIENTO: TIntegerField;
    IBQConsultaParaGuardarEVENTO_DISPARADOR: TIntegerField;
    IBQConsultaParaGuardarGRUPO: TIntegerField;
    IBQConsultaParaGuardarESTADO: TIBStringField;
    Panel1: TPanel;
    LEventoDisparador: TLabel;
    LEventoDisparadorValue: TLabel;
    AAtenderAlarma: TAction;
    ADiferirAlarma: TAction;
    GBModificarAlarma: TGroupBox;
    BBAtender: TBitBtn;
    BBDiferir: TBitBtn;
    DTPNuevaFecha: TDateTimePicker;
    LNuevoAviso: TLabel;
    LEstadoValue: TLabel;
    IBQGenericos: TIBQuery;
    IBQGenericosID_CODIGO: TIBStringField;
    IBQGenericosTIPO: TIBStringField;
    IBQGenericosVALOR: TIBStringField;
    BitBtn1: TBitBtn;
    AVerFichaEvento: TAction;
    procedure ASalirExecute(Sender: TObject);
    procedure AAplicarExecute(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mostrarEstado;
    procedure mostrarDisparador;
    procedure ActualizarGrilla(opcion : integer);
    procedure DBDTPFechaChange(Sender: TObject);
    procedure mostrarNuevaFecha(mostrar : boolean);
    procedure insertarNuevoRegistro;
    procedure AAtenderAlarmaExecute(Sender: TObject);
    procedure ADiferirAlarmaExecute(Sender: TObject);
    procedure AVerFichaEventoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetIdAgenda(id :integer);
    { Public declarations }
  end;

var
  FVerAlarma: TFVerAlarma;
  id_agenda : integer;
  cambios : boolean;

implementation

uses UPrincipal, uTiposGlobales,UFichaEvento, UMensajeHuella, UTraduccion;

{$R *.dfm}

procedure TFVerAlarma.ASalirExecute(Sender: TObject);
begin
  inherited;
  if (cambios) then
    begin
      if (MostrarMensaje(tmConsulta, 'Se perderán los cambios registrados. Desea salir?') = mrYes) then
        begin
          BBSalir.SetFocus;
          close;
        end
    end
  else
    begin
      BBSalir.SetFocus;
      close;
    end;
end;

// Guardo los cambios en la base de datos
procedure TFVerAlarma.AAplicarExecute(Sender: TObject);
begin
  inherited;
  if (cambios) then
    if (MostrarMensaje(tmConsulta, 'Aplicar cambios?') = mrYes) then
      begin
        if (IBQConsultaParaGuardar.FieldByName('estado').AsString = 'D') then
          insertarNuevoRegistro;
        IBQConsultaParaGuardar.Database.ApplyUpdates([IBQConsultaParaGuardar]);
        mostrarNuevaFecha(false);
        cambios := false;
        close();
      end;
end;

// restauro los valores que habia antes
procedure TFVerAlarma.ACancelarExecute(Sender: TObject);
begin
  inherited;
  if (cambios) then
    if (MostrarMensaje(tmConsulta, 'Desea deshacer los cambios?') = mrYes)then
      begin
        IBQConsultaParaGuardar.CancelUpdates;
        cambios := false;
        mostrarNuevaFecha(false);
        FormShow(Sender);
      end
    else
      close;
end;

// metodo onShow
procedure TFVerAlarma.FormShow(Sender: TObject);
begin
  inherited;
  cambios := false;
  AAplicar.Enabled := false;
  ACancelar.Enabled := false;

  with IBQConsultaParaGuardar do
    begin
      Active := false;
      ParamByName('id').AsInteger := id_agenda;
      active := true;
    end;

  with IBQConsulta do
    begin
      Active := false;
      ParamByName('id').AsInteger := id_agenda;
      active := true;
    end;
  IBQConsulta.First;
  if not(IBQConsulta.Eof) then
    begin
      mostrarEstado;
      LDescripDatos.Caption := IBQConsulta.fieldbyname('descripcion').AsString;
      LNivelCriticoValue.Caption := IBQConsulta.fieldbyname('nivel_criticidad').AsString;
      LCategoriaValue.Caption := IBQConsulta.fieldbyname('categoria').AsString;
      LTipoValue.Caption := IBQConsulta.fieldbyname('tipo').AsString;
      LRegistDatos.Caption := IBQConsulta.fieldbyname('fecha_registracion').AsString;
      LAvisoDatos.Caption := IBQConsulta.fieldbyname('fecha_aviso').AsString;
      mostrarDisparador;
    end
  else
    Close();
end;

// metodo para mostrar solamente el estado de la alarma
procedure TFVerAlarma.mostrarEstado;
begin
  IBQGenericos.Active := false;
  IBQGenericos.ParamByName('tipo').AsString := 'AC';
  IBQGenericos.ParamByName('codigo').AsString := IBQConsulta.FieldByName('estado').AsString;
  IBQGenericos.Active := true;

  LEstadoValue.Caption := IBQGenericos.fieldbyname('valor').AsString;

  if ((IBQConsulta.FieldByName('estado').AsString = 'C') or (IBQConsulta.FieldByName('estado').AsString = 'D')) then
    begin
      AAtenderAlarma.Enabled := false;
      ADiferirAlarma.Enabled := false;
      GBModificarAlarma.Visible := false;
      PDatosAlarma.Height := PDatosAlarma.Height - GBModificarAlarma.Height; 
    end; 
end;

// metodo para setear el id_agenda a ser mostrado en este formulario
procedure TFVerAlarma.SetIdAgenda(id: integer);
begin
  id_agenda := id;
end;

// seleccion si el disparador fue un evento masivo o un evento individual
procedure TFVerAlarma.mostrarDisparador;
begin
  if (IBQConsulta.FieldByName('grupo').IsNull) and (not IBQConsulta.FieldByName('evento_disparador').IsNull) then
    begin
      LDisparador.Caption := Traducir('Evento disparador: ');
      LDisparadorValue.Caption := IBQConsulta.FieldByName('evento_disparador').AsString;
      ActualizarGrilla(1);
    end;
  if (not IBQConsulta.FieldByName('grupo').IsNull) and (IBQConsulta.FieldByName('evento_disparador').IsNull) then
    begin
      LDisparador.Caption := Traducir('Grupo disparador: ');
      LDisparadorValue.Caption := IBQConsulta.FieldByName('grupo').AsString;
      ActualizarGrilla(2);
    end;
end;

// metodo para mostrar los eventos del grupo o el evento en particular
procedure TFVerAlarma.ActualizarGrilla(opcion: integer);
begin
  with IBQEventos do
    begin
      Active := false;
      if (opcion = 1) then
        ParamByName('eve').asInteger := IBQConsulta.FieldByName('evento_disparador').AsInteger
      else
        begin
          ParamByName('grupo').asInteger := IBQConsulta.FieldByName('grupo').AsInteger;
          ParamByName('esta').asInteger := FPrincipal.EstablecimientoActual;
        end;
      Active := true;
      LEventoDisparadorValue.Caption := fieldByName('nombreTipoEvento').AsString;
    end;
end;

// para asegurar los cambios de la fecha
procedure TFVerAlarma.DBDTPFechaChange(Sender: TObject);
begin
  inherited;
  cambios := true;
end;

// solo para actuarlizar la vista de la nueva fecha de aviso
procedure TFVerAlarma.mostrarNuevaFecha(mostrar : boolean);
begin
  LNuevoAviso.Visible := false;
  DTPNuevaFecha.Visible := false;
  if (mostrar) then
    begin
      LNuevoAviso.Visible := true;
      DTPNuevaFecha.Visible := true;
    end
end;

// metodo que genera el nuevo registro cuando se difiere una alarma
procedure TFVerAlarma.insertarNuevoRegistro;
var id_old : integer;
    aviso : integer;
    evento_disparador : Variant;
    grupo : Variant;
begin
  aviso := IBQConsultaParaGuardar.FieldByName('aviso').AsInteger;
  id_old := IBQConsultaParaGuardar.FieldByName('id_agenda').AsInteger;
  evento_disparador := IBQConsultaParaGuardar.FieldByName('evento_disparador').Value;
  grupo := IBQConsultaParaGuardar.FieldByName('grupo').Value;

  IBQConsultaParaGuardar.Insert;
  IBQConsultaParaGuardar.FieldByName('aviso').AsInteger := aviso;
  IBQConsultaParaGuardar.FieldByName('id_agenda_diferido').AsInteger := id_old;
  IBQConsultaParaGuardar.FieldByName('evento_disparador').Value := evento_disparador;
  IBQConsultaParaGuardar.FieldByName('grupo').Value := grupo;
  IBQConsultaParaGuardar.FieldByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQConsultaParaGuardar.FieldByName('Estado').AsString := 'A';
  IBQConsultaParaGuardar.FieldByName('fecha_registracion').AsDateTime := now;
  IBQConsultaParaGuardar.FieldByName('fecha_aviso').AsDateTime := DTPNuevaFecha.DateTime;
  IBQConsultaParaGuardar.Post;
end;

// metodo para atenter la alarma
procedure TFVerAlarma.AAtenderAlarmaExecute(Sender: TObject);
begin
  inherited;
  mostrarNuevaFecha(false);
  Cambios := true;
  IBQConsultaParaGuardar.Edit;
  IBQConsultaParaGuardar.FieldByName('estado').AsString := 'C';
  IBQGenericos.Active := false;
  IBQGenericos.ParamByName('tipo').AsString := 'AC';
  IBQGenericos.ParamByName('codigo').AsString := 'C';
  IBQGenericos.Active := true;
  LEstadoValue.Caption := IBQGenericos.fieldbyname('valor').AsString;
  AAplicar.Enabled := true;
  ACancelar.Enabled := true;
  IBQConsultaParaGuardar.Post;
end;

// metodo para diferir la alarma
procedure TFVerAlarma.ADiferirAlarmaExecute(Sender: TObject);
begin
  inherited;
  mostrarNuevaFecha(true);
  cambios := true;
  IBQConsultaParaGuardar.Edit;
  IBQConsultaParaGuardar.FieldByName('estado').AsString := 'D';
  IBQGenericos.Active := false;
  IBQGenericos.ParamByName('tipo').AsString := 'AC';
  IBQGenericos.ParamByName('codigo').AsString := 'D';
  IBQGenericos.Active := true;
  LEstadoValue.Caption := IBQGenericos.fieldbyname('valor').AsString;
  LEstadoValue.Caption := Traducir('Diferido');
  AAplicar.Enabled := true;
  ACancelar.Enabled := true;
  IBQConsultaParaGuardar.Post;
end;

// muestro la ficha del evento
procedure TFVerAlarma.AVerFichaEventoExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFFichaEvento, FFichaEvento);
  FFichaEvento.IDEvento := IBQEventos.fieldbyname('evento').AsInteger;
  FFichaEvento.ShowModal;
end;

end.
