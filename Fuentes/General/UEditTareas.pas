unit UEditTareas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, UPrincipal,
  IBQuery, DBCtrls, UDBLookupComboBoxAuto, Mask, UDBEditAuto, DateUtils,
  UDBDateTimePickerAuto, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxTimeEdit, JvExControls, JvLabel, JvGIF,
  ImgList, PngImageList, pngimage, JvExExtCtrls, JvImage;

type
  TFEditTareas = class(TFUniversal)
    GBTarea: TGroupBox;
    GBAlarma: TGroupBox;
    PBotones: TPanel;
    BBAceptar: TBitBtn;
    BBCancelar: TBitBtn;
    DBLCBATipoTarea: TDBLookupComboBoxAuto;
    IBQTipoTareas: TIBQuery;
    DSTipoTarea: TDataSource;
    LTipoEvento: TLabel;
    DBETitulo: TDBEdit;
    Label2: TLabel;
    DBMNota: TDBMemo;
    Label3: TLabel;
    CBAlarma: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    DTPFechaIni: TDateTimePicker;
    DTPFechaFin: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    DBMensajeAlarma: TDBMemo;
    Label9: TLabel;
    Label10: TLabel;
    DTPFechaAlarma: TDateTimePicker;
    CBIteracion: TCheckBox;
    MEHoraIni: TcxTimeEdit;
    MEHoraFin: TcxTimeEdit;
    MEHoraAlarma: TcxTimeEdit;
    ISinA: TImage;
    IConA: TImage;
    RGIteracion: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure IBQTipoTareasAfterOpen(DataSet: TDataSet);
    procedure BBAceptarClick(Sender: TObject);
    procedure CBAlarmaClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure MEHoraIniExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPFechaAlarmaChange(Sender: TObject);
    procedure CBIteracionClick(Sender: TObject);

  private
    procedure HabilitarComponentesVersionBasica; override;   
  public
    termina : boolean;
    function verificarFechas():boolean;
    procedure habilitar(si:Boolean);
  end;

var
  FEditTareas: TFEditTareas;

implementation

uses UCalendario, UMensajeHuella;
{$R *.dfm}

procedure TFEditTareas.habilitar(si:Boolean);
begin
  GBAlarma.Enabled := si;
  Label10.Enabled := si;
  Label9.Enabled := si;
  DTPFechaAlarma.Enabled := si;
  MEHoraAlarma.Enabled := si;
  CBIteracion.Enabled := si;
end;

procedure TFEditTareas.FormCreate(Sender: TObject);
begin
  inherited;
  IBQTipoTareas.Close;
  IBQTipoTareas.Open;
  SysUtils.TimeSeparator := ':';
  SysUtils.ShortTimeFormat := 'hh:mm';
  MEHoraIni.Time := Now();
  MEHoraFin.Time := Now();
{  DTPFechaIni.Date := FCalendario.PCCalendario.Date;
  DTPFechaFin.Date := FCalendario.PCCalendario.Date;
  DTPFechaAlarma.Date := FCalendario.PCCalendario.Date; }
  MEHoraAlarma.Time := Now()-EncodeTime(0,10,0,0);
  DBLCBATipoTarea.KeyValue := FPrincipal.TipoCalendario;
  if (FPrincipal.TipoCalendario <> 3) then
  begin
    DBLCBATipoTarea.Enabled := false;
    LTipoEvento.Enabled := false;
  end
  else
  begin
    DBLCBATipoTarea.Enabled := true;
    LTipoEvento.Enabled := true;
  end;

  if (FPrincipal.RolUsuarioActual <> 'ADMINISTRADOR') then
    BBAceptar.Enabled := false;
end;

procedure TFEditTareas.IBQTipoTareasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQTipoTareas.Last;
  IBQTipoTareas.First;
end;

procedure TFEditTareas.BBAceptarClick(Sender: TObject);
begin
  inherited;
  if verificarFechas() then
    begin
      termina := true;
      Close();
    end;  
end;

procedure TFEditTareas.CBAlarmaClick(Sender: TObject);
begin
  inherited;
  if(CBAlarma.Checked) then
  begin
    GBAlarma.Enabled := true;
    IConA.Visible := true;
    ISinA.Visible := false;
  end
  else
  begin
    GBAlarma.Enabled := false;
    IConA.Visible := false;
    ISinA.Visible := true;
  end;

  habilitar(CBAlarma.Checked);
end;

procedure TFEditTareas.BBCancelarClick(Sender: TObject);
begin
  inherited;
  termina := false;
end;

procedure TFEditTareas.MEHoraIniExit(Sender: TObject);
begin
  inherited;
  MEHoraAlarma.Time := MEHoraIni.Time-EncodeTime(0,10,0,0);
end;

function TFEditTareas.verificarFechas: boolean;
begin
  result:= false;
  if (DBETitulo.Text <> '') then
   begin
    if (DTPFechaIni.Date < DTPFechaFin.Date) then
      result:= true
     else
      if (DTPFechaIni.Date = DTPFechaFin.Date) then
        begin
         if (MEHoraIni.Time <= MEHoraFin.Time) then
            result:= true
           else
             begin
               MostrarMensaje(tmError, 'Si las fecha de inicio y fin son iguales, la hora de inicio debe ser menor igual que la hora de fin.');
               MEHoraIni.SetFocus;
              end;
        end
       else
         begin
           MostrarMensaje(tmError, 'La fecha de inicio debe ser menor o igual que la fecha de fin.');
           DTPFechaIni.SetFocus;
         end;
    end
   else
     MostrarMensaje(tmError, 'Debe ingresar un Título/Tema.');
end;

procedure TFEditTareas.FormShow(Sender: TObject);
begin
  inherited;
  CBAlarmaClick(Sender);
end;

procedure TFEditTareas.DTPFechaAlarmaChange(Sender: TObject);
var
  fecha:TDateTimePicker;
begin
  inherited;
  fecha := Sender as TDateTimePicker;
  if(fecha.Date < now) then
    fecha.Date:=now
end;

procedure TFEditTareas.CBIteracionClick(Sender: TObject);
begin
  inherited;
  if CBIteracion.Checked then RGIteracion.Enabled := true
  else RGIteracion.Enabled := false;
end;

procedure TFEditTareas.HabilitarComponentesVersionBasica;
begin
  inherited;
//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
    begin
      DBLCBATipoTarea.Enabled:= false;
    end
   else
     begin
       //
     end;
//  {$ELSE}
    //
//  {$ENDIF}
end;

end.
