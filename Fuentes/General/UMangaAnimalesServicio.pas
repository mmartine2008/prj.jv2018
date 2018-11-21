unit UMangaAnimalesServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, UFrameDBSeleccion,
  Buttons, IBQuery, UMensajeHuella, PngImage, JvExExtCtrls, JvImage, jpeg,
  JvExControls, JvLabel, JvGIF, ImgList, PngImageList;

type
  TFAnimalesServicio = class(TFUniversal)
    PBotones: TPanel;
    BBAceptar: TBitBtn;
    PSeleccion: TPanel;
    FrameSeleccion: TFrameSeleccion;
    PEncabezado: TPanel;
    Label1: TLabel;
    LServicio: TLabel;
    IBQNomServicio: TIBQuery;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LInic: TLabel;
    LFin: TLabel;
    LFinEstimada: TLabel;
    BBCancelar: TBitBtn;
    IBSPEliminarAnimales: TIBStoredProc;
    IBQEliminarServicio: TIBQuery;
    IFondoB: TImage;
    LAyuda: TLabel;
    JvIAyuda: TJvImage;
    LSalir: TLabel;
    JvSalir: TJvImage;
    JvAceptar: TJvImage;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SeleccionarUnPadre(Sender : TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure FrameSeleccionIBQDisponiblesAfterOpen(DataSet: TDataSet);
    procedure FrameSeleccionIBQSeleccionadosAfterOpen(DataSet: TDataSet);
    procedure FrameSeleccionBBAgregarTodosClick(Sender: TObject);
    procedure FrameSeleccionBBAgregarUnoClick(Sender: TObject);
    procedure FrameSeleccionBBEliminarUnoClick(Sender: TObject);
    procedure FrameSeleccionBBEliminarTodosClick(Sender: TObject);
  private
    IdServicio : Integer;
    procedure BorrarAuxiliares();
  public
    { Public declarations }
  published
    constructor Create(Owner : TComponent; Servicio : Integer); reintroduce;
  end;

var
  FAnimalesServicio: TFAnimalesServicio;

implementation

uses UPrincipal,uTiposGlobales, UTraduccion;

{$R *.dfm}

constructor TFAnimalesServicio.Create(Owner : TComponent; Servicio : Integer);
begin
  inherited Create(Owner);
  IdServicio := Servicio;
end;

procedure TFAnimalesServicio.FormShow(Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := SeleccionarUnPadre;
  FrameSeleccion.IBQDisponibles.Close;
  FrameSeleccion.IBQDisponibles.ParamByName('SERVICIO').AsInteger := IdServicio;
  FrameSeleccion.IBQDisponibles.Open;
  FrameSeleccion.IBQSeleccionados.Close;
  FrameSeleccion.IBQSeleccionados.Open;
  IBQNomServicio.Close;
  IBQNomServicio.ParamByName('SERVICIO').AsInteger := IdServicio;
  IBQNomServicio.Open;

  LServicio.Caption := IBQNomServicio.FieldValues['NOMBRE'];
  LInic.Caption := IBQNomServicio.FieldValues['FECHA_INICIO'];
  LFin.Caption := IBQNomServicio.FieldValues['FECHA_FIN'];
  LFinEstimada.Caption := IBQNomServicio.FieldValues['FECHA_FIN_ESTIMADA'];
end;

procedure TFAnimalesServicio.SeleccionarUnPadre(Sender : TObject);
begin
  if not FrameSeleccion.IBQSeleccionados.Active then
    FrameSeleccion.IBQSeleccionados.Open;
  FrameSeleccion.IBQSeleccionados.Insert;
  FrameSeleccion.IBQSeleccionados.FieldByName('ID_ANIMAL').Value := FrameSeleccion.IBQDisponibles.FieldValues['ID_ANIMAL'];
  FrameSeleccion.IBQSeleccionados.FieldByName('ID_AUX').Value := 1;
  FrameSeleccion.IBQSeleccionados.FieldByName('ID_RP').Value := FrameSeleccion.IBQDisponibles.FieldValues['ID_RP'];
  FrameSeleccion.IBQSeleccionados.FieldByName('NOMBRE').Value := FrameSeleccion.IBQDisponibles.FieldValues['NOMBRE'];
end;

procedure TFAnimalesServicio.BBAceptarClick(Sender: TObject);
begin
  inherited;
  if FrameSeleccion.IBQDisponibles.RecordCount > 0 then
  begin
      try
        IBSPEliminarAnimales.Close;
        IBSPEliminarAnimales.ParamByName('ID_SERVICIO').AsInteger := IdServicio;
        IBSPELiminarAnimales.ExecProc;
        FPrincipal.IBTPrincipal.CommitRetaining;
        MostrarMensaje(tmInformacion,'El servicio ha sido eliminado de los animales seleccionados');
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
  end
  else
  begin
    try
      IBSPEliminarAnimales.Close;
      IBSPEliminarAnimales.ParamByName('ID_SERVICIO').AsInteger := IdServicio;
      IBSPELiminarAnimales.ExecProc;
      IBQEliminarServicio.Close;
      IBQEliminarServicio.ParamByName('ID').AsInteger := IdServicio;
      IBQEliminarServicio.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
      IBQEliminarServicio.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
      MostrarMensaje(tmInformacion,'El servicio ha sido eliminado');
    except
      begin
        FPrincipal.IBTPrincipal.RollbackRetaining;
        MostrarMensaje(tmError,'El servicio no puede eliminarce porque tiene datos relacionados');
      end;
    end;
  end;
  BorrarAuxiliares();
  Close();
end;

procedure TFAnimalesServicio.BorrarAuxiliares();
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFAnimalesServicio.BBCancelarClick(Sender: TObject);
begin
  inherited;
  BorrarAuxiliares();
  Close();
end;

procedure TFAnimalesServicio.FrameSeleccionIBQDisponiblesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameSeleccion.IBQDisponibles.Last;
  FrameSeleccion.IBQDisponibles.First;
  FrameSeleccion.GBDisponibles.Caption := Traducir(' Disponibles [')+IntToStr(FrameSeleccion.IBQDisponibles.RecordCount)+'] ';
end;

procedure TFAnimalesServicio.FrameSeleccionIBQSeleccionadosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameSeleccion.IBQSeleccionados.Last;
  FrameSeleccion.IBQSeleccionados.First;
  FrameSeleccion.GBSeleccionados.Caption := Traducir(' Seleccionados [')+IntToStr(FrameSeleccion.IBQSeleccionados.RecordCount)+'] ';
end;

procedure TFAnimalesServicio.FrameSeleccionBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := SeleccionarUnPadre;
  FrameSeleccion.BBAgregarTodosClick(Sender);
end;

procedure TFAnimalesServicio.FrameSeleccionBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := SeleccionarUnPadre;
  FrameSeleccion.BBAgregarUnoClick(Sender);
end;

procedure TFAnimalesServicio.FrameSeleccionBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := SeleccionarUnPadre;
  FrameSeleccion.BBEliminarUnoClick(Sender);
end;

procedure TFAnimalesServicio.FrameSeleccionBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccion.OnSelectItem := SeleccionarUnPadre;
  FrameSeleccion.BBEliminarTodosClick(Sender);
end;

end.
