unit URepMovimientosExistencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, jpeg, QRCtrls, QuickRpt, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  StdCtrls, ExtCtrls, UFrameDBSeleccion, Buttons, DateTimePickerAuto,
  IBQuery, UMensajeImpresora, PngImage, JvGIF, JvExControls, JvLabel,
  ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFRepMovimientosExistencia = class(TFUniversal)
    PTop: TPanel;
    Splitter2: TSplitter;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPAHasta: TDateTimePickerAuto;
    DTPADesde: TDateTimePickerAuto;
    PSeleccion: TPanel;
    FrameMovimientosExistencia: TFrameSeleccion;
    ASalir: TAction;
    AImprimirReporte: TAction;
    IBQLimpiarAuxEvento: TIBQuery;
    IBQLimpiarAux: TIBQuery;
    IBQLimpiarAuxExternos: TIBQuery;
    IBQGenIDRodeosDisp: TIBQuery;
    IBDSRodeos: TIBDataSet;
    IBDSRodeosID_AUX: TIntegerField;
    IBDSRodeosID_ANIMAL: TIntegerField;
    IBDSRodeosNOMBRE: TIBStringField;
    IBDSRodeosRAZA: TIntegerField;
    IBQRodeos: TIBQuery;
    DSRodeos: TDataSource;
    IBQMovimientosExistencia: TIBQuery;
    DSMovimientosExistencia: TDataSource;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    Label3: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure FrameMovimientosExistenciaIBQDisponiblesBeforeOpen(
      DataSet: TDataSet);
    procedure IBQRodeosAfterOpen(DataSet: TDataSet);
    procedure IBDSRodeosAfterOpen(DataSet: TDataSet);
    procedure FrameMovimientosExistenciaBBAgregarTodosClick(
      Sender: TObject);
    procedure FrameMovimientosExistenciaBBAgregarUnoClick(Sender: TObject);
    procedure FrameMovimientosExistenciaBBEliminarUnoClick(
      Sender: TObject);
    procedure FrameMovimientosExistenciaBBEliminarTodosClick(
      Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SeleccionarUnPotrero(Sender : TObject);
    procedure FrameMovimientosExistenciaIBQSeleccionadosBeforeOpen(
      DataSet: TDataSet);
    procedure FrameMovimientosExistenciaIBQDisponiblesAfterOpen(
      DataSet: TDataSet);

  private
    { Private declarations }
    FIDAuxDisp : Integer;
    procedure actualizarBotones;
    procedure ActualizarCantidad();
    procedure FiltrarRodeo();   
    procedure LimpiarAux();
    procedure LlenarRodeos;       
  public
    { Public declarations }
  end;

var
  FRepMovimientosExistencia: TFRepMovimientosExistencia;

implementation

Uses UPrincipal, UDMSoftvet, URepMovimientosExistenciaPreview, DateUtils, UCartel,
     UMensajeHuella, UTraduccion;

{$R *.dfm}

procedure TFRepMovimientosExistencia.FormShow(Sender: TObject);
begin
  inherited;
  DTPADesde.DateTime := now;
  DTPAHasta.DateTime := IncYear(now,1);
  //LimpiarAux();
  IBQLimpiarAuxEvento.Active:= true;
  IBQLimpiarAuxEvento.Active:= false;
  actualizarBotones();
end;

procedure TFRepMovimientosExistencia.actualizarBotones;
begin
  //AImprimirReporte.Enabled := not(FrameMovimientosExistencia.IBQSeleccionados.IsEmpty);
  //BBXls.Enabled := not(IBQMovimientosExistencia.IsEmpty);
  LPreview.Enabled := not(FrameMovimientosExistencia.IBQSeleccionados.IsEmpty);
  IPreview.Enabled := not(FrameMovimientosExistencia.IBQSeleccionados.IsEmpty);
end;

procedure TFRepMovimientosExistencia.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFRepMovimientosExistencia.AImprimirReporteExecute(Sender: TObject);
var query:string;
    cartel: TCartel;
    msje: String;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  IBQLimpiarAuxEvento.Active:= true;
  IBQLimpiarAuxEvento.Active:= false;
 
  FPrincipal.IBTPrincipal.CommitRetaining;

  cartel:= TCartel.getInstance();
  msje:= 'Calculando Movimientos y Existencias ...';
  cartel.abrircartel(msje);

  IBQMovimientosExistencia.Close;
  IBQMovimientosExistencia.SQL.Clear;
  query:= 'select * from rep_movimientos_existencias(:esta,:desde,:hasta)';
  //IBQResumenTratamiento.SQL.Add('select * from REP_RESUMEN_TRATAMIENTO (:esta,:desde,:hasta) order by  fecha desc');
  IBQMovimientosExistencia.SQL.Add(query);
  IBQMovimientosExistencia.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQMovimientosExistencia.ParamByName('desde').AsString := DateToStr(DTPADesde.Date);
  IBQMovimientosExistencia.ParamByName('hasta').AsString := DateToStr(DTPAHasta.Date);

  IBQMovimientosExistencia.Open;

  if not (IBQMovimientosExistencia.IsEmpty) then
    begin
      Application.CreateForm(TFRepMovimientoExistenciaPreview, FRepMovimientoExistenciaPreview);
      FRepMovimientoExistenciaPreview.QRLDesdeValue.Caption:= DateToStr(DTPADesde.Date);
      FRepMovimientoExistenciaPreview.QRLHastaValue.Caption:= DateToStr(DTPAHasta.Date);
    end;
  cartel.cerrarcartel();
  cartel.FreeInstance();

  if not (IBQMovimientosExistencia.IsEmpty) then
    FRepMovimientoExistenciaPreview.ShowModal
  else
    MostrarMensaje(tmError,Traducir( 'No se han realizado movimientos entre ') + DateToStr(DTPADesde.Date) + Traducir(' y ') + DateToStr(DTPAHasta.Date));

  HabilitarDesabilitarControles();    
end;

procedure TFRepMovimientosExistencia.FrameMovimientosExistenciaIBQDisponiblesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameMovimientosExistencia.IBQDisponibles.ParamByName('IDAUXPE').AsInteger := FIDAuxDisp;
end;

procedure TFRepMovimientosExistencia.ActualizarCantidad;
begin
  FrameMovimientosExistencia.IBQDisponibles.First;
  FrameMovimientosExistencia.IBQDisponibles.Last;
  FrameMovimientosExistencia.GBDisponibles.Caption := Traducir(' Disponibles [')+IntToStr(FrameMovimientosExistencia.IBQDisponibles.RecordCount)+'] ';
  FrameMovimientosExistencia.IBQSeleccionados.First;
  FrameMovimientosExistencia.IBQSeleccionados.Last;
  FrameMovimientosExistencia.GBSeleccionados.Caption := Traducir(' Seleccionados [')+IntToStr(FrameMovimientosExistencia.IBQSeleccionados.RecordCount)+'] ';
  FrameMovimientosExistencia.IBQDisponibles.First;
  FrameMovimientosExistencia.IBQSeleccionados.First;
end;

procedure TFRepMovimientosExistencia.FiltrarRodeo;
begin
  IBQGenIDRodeosDisp.Close;
  IBQGenIDRodeosDisp.Open;

  IBDSRodeos.Open;

  FIDAuxDisp := IBQGenIDRodeosDisp.FieldValues['IDAUX'];


  IBQRodeos.Active := false;

  IBQRodeos.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRodeos.Active := true;

  FrameMovimientosExistencia.ActualizarLosQuery;
  FrameMovimientosExistencia.ControlarBotones;
  FrameMovimientosExistencia.BDBGDisponibles.SelectedRows.Clear;
  FrameMovimientosExistencia.ControlarBotones;
end;

procedure TFRepMovimientosExistencia.LimpiarAux;
begin
  IBQLimpiarAux.Active := true;
  IBQLimpiarAux.Active := false;
  IBQLimpiarAuxExternos.Active := true;
  IBQLimpiarAuxExternos.Active := false;
  IBQLimpiarAuxEvento.Active := true;
  IBQLimpiarAuxEvento.Active := false;
end;

procedure TFRepMovimientosExistencia.LlenarRodeos;
begin
  IBDSRodeos.Open;
  IBQRodeos.First;
  while (not IBQRodeos.Eof) do
  begin
    IBDSRodeos.Insert;
    IBDSRodeos.FieldByName('ID_AUX').Value := FIDAuxDisp;
    IBDSRodeos.FieldByName('ID_ANIMAL').Value := IBQRodeos.fieldByName('ID_RODEO').AsInteger;
    IBDSRodeos.FieldByName('NOMBRE').Value := IBQRodeos.fieldByName('NOMBRE').AsString;
    IBDSRodeos.FieldByName('RAZA').Value := IBQRodeos.fieldByName('ESTABLECIMIENTO').AsInteger;

    IBQRodeos.Next;
  end;
  IBDSRodeos.Database.ApplyUpdates([IBDSRodeos]);
end;

procedure TFRepMovimientosExistencia.IBQRodeosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  LlenarRodeos(); 
end;

procedure TFRepMovimientosExistencia.IBDSRodeosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFRepMovimientosExistencia.FrameMovimientosExistenciaBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameMovimientosExistencia.OnSelectItem := SeleccionarUnPotrero;
  FrameMovimientosExistencia.BBAgregarTodosClick(Sender);
  actualizarBotones();
  ActualizarCantidad();
end;

procedure TFRepMovimientosExistencia.FrameMovimientosExistenciaBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameMovimientosExistencia.OnSelectItem := SeleccionarUnPotrero;
  FrameMovimientosExistencia.BBAgregarUnoClick(Sender);
  actualizarBotones;
  ActualizarCantidad();
end;

procedure TFRepMovimientosExistencia.FrameMovimientosExistenciaBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameMovimientosExistencia.BBEliminarUnoClick(Sender);
  if (FrameMovimientosExistencia.DSSeleccionados.DataSet.IsEmpty) then
  begin
    actualizarBotones;
  end;
  ActualizarCantidad();
end;

procedure TFRepMovimientosExistencia.FrameMovimientosExistenciaBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameMovimientosExistencia.BBEliminarTodosClick(Sender);
  actualizarBotones; 
  ActualizarCantidad();
end;

procedure TFRepMovimientosExistencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LimpiarAux();
end;

procedure TFRepMovimientosExistencia.FormCreate(Sender: TObject);
begin
  inherited;
  FiltrarRodeo();
end;

procedure TFRepMovimientosExistencia.SeleccionarUnPotrero(Sender: TObject);
begin
  FrameMovimientosExistencia.IBQSeleccionados.Insert;
  FrameMovimientosExistencia.IBQSeleccionados.FieldByName('ID_AUX').Value := FIDAuxDisp;
  FrameMovimientosExistencia.IBQSeleccionados.FieldByName('ID_ANIMAL_EXTERNO').Value := FrameMovimientosExistencia.IBQDisponibles.FieldByName('ID').AsInteger;
  FrameMovimientosExistencia.IBQSeleccionados.FieldByName('NOMBRE').Value := FrameMovimientosExistencia.IBQDisponibles.FieldByName('NOMBRE').AsString;
  FrameMovimientosExistencia.IBQSeleccionados.FieldByName('RAZA').Value := FrameMovimientosExistencia.IBQDisponibles.FieldByName('RAZA').AsString;
end;

procedure TFRepMovimientosExistencia.FrameMovimientosExistenciaIBQSeleccionadosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameMovimientosExistencia.IBQSeleccionados.ParamByName('ID_AUX').Value := FIDAuxDisp;
end;

procedure TFRepMovimientosExistencia.FrameMovimientosExistenciaIBQDisponiblesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  ActualizarCantidad();
end;

end.
