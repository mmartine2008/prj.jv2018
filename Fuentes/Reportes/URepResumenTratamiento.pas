unit URepResumenTratamiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ComCtrls, DateTimePickerAuto, StdCtrls, Buttons,
  UFrameDBSeleccion, ExtCtrls, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, IBQuery, UMensajeImpresora,
  PngImage, jpeg, JvGIF, JvExControls, JvLabel, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFRepResumenTratamiento = class(TFUniversal)
    PTop: TPanel;
    Splitter2: TSplitter;
    PSeleccion: TPanel;
    FrameResumenTratamiento: TFrameSeleccion;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPAHasta: TDateTimePickerAuto;
    DTPADesde: TDateTimePickerAuto;
    IBQResumenTratamiento: TIBQuery;
    DSResumenTratamiento: TDataSource;
    ASalir: TAction;
    AImprimirReporte: TAction;
    IBQRodeos: TIBQuery;
    DSRodeos: TDataSource;
    IBDSRodeos: TIBDataSet;
    IBDSRodeosID_AUX: TIntegerField;
    IBDSRodeosID_ANIMAL: TIntegerField;
    IBDSRodeosNOMBRE: TIBStringField;
    IBDSRodeosRAZA: TIntegerField;
    IBQLimpiarAux: TIBQuery;
    IBQLimpiarAuxExternos: TIBQuery;
    IBQGenIDRodeosDisp: TIBQuery;
    IBQLimpiarAuxEvento: TIBQuery;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    Label45: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure FrameResumenTratamientoIBQDisponiblesBeforeOpen(
      DataSet: TDataSet);
    procedure IBQRodeosAfterOpen(DataSet: TDataSet);
    procedure IBDSRodeosAfterOpen(DataSet: TDataSet);
    procedure SeleccionarUnPotrero(Sender : TObject);  
    procedure FrameResumenTratamientoIBQSeleccionadosBeforeOpen(
      DataSet: TDataSet);
    procedure FrameResumenTratamientoBBAgregarTodosClick(Sender: TObject);
    procedure FrameResumenTratamientoBBAgregarUnoClick(Sender: TObject);
    procedure FrameResumenTratamientoBBEliminarUnoClick(Sender: TObject);
    procedure FrameResumenTratamientoBBEliminarTodosClick(Sender: TObject);
    procedure FrameResumenTratamientoIBQDisponiblesAfterOpen(
      DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
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
  FRepResumenTratamiento: TFRepResumenTratamiento;

implementation

uses URepResumenTratamientoPreview, UPrincipal, DateUtils, UCartel, UDMSoftvet,
     UMensajeHuella, UTraduccion;
{$R *.dfm}

procedure TFRepResumenTratamiento.FormShow(Sender: TObject);
begin
  inherited;
  DTPADesde.DateTime := IncYear(now,-1);
  DTPAHasta.DateTime := now;
  //LimpiarAux();
  IBQLimpiarAuxEvento.Active:= true;
  IBQLimpiarAuxEvento.Active:= false;  
  actualizarBotones();
end;

procedure TFRepResumenTratamiento.actualizarBotones;
begin
  //AImprimirReporte.Enabled := not(FrameResumenTratamiento.IBQSeleccionados.IsEmpty);
  //BBXls.Enabled := not(IBQResumenTratamiento.IsEmpty);
  IPreview.Enabled := not(FrameResumenTratamiento.IBQSeleccionados.IsEmpty);
  LPreview.Enabled := not(FrameResumenTratamiento.IBQSeleccionados.IsEmpty);
end;

procedure TFRepResumenTratamiento.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFRepResumenTratamiento.AImprimirReporteExecute(Sender: TObject);
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
  msje:= 'Calculando Resumen Tratamiento ...';
  cartel.abrircartel(msje);

  IBQResumenTratamiento.Close;
  IBQResumenTratamiento.SQL.Clear;
  query:= 'select fecha,idrodeo,rodeo,idpotrero, potrero, idtratamiento, tratamiento, ' +
                'idtipotratamiento, tipotratamiento, '+
                'sum(cantterneros) as Terneros, sum(cantnovillos) as Novillos,' +
                'sum(canttoros) as Toros, sum(cantterneras) as Terneras,' +
                'sum(cantvaquillonas) as Vaquillonas, sum(cantvacas) as Vacas ' +
          'from rep_resumen_tratamiento(:esta,:desde,:hasta) ' +
          'group by fecha,idrodeo,rodeo,idpotrero, potrero, idtratamiento, tratamiento,idtipotratamiento, tipotratamiento';

  //IBQResumenTratamiento.SQL.Add('select * from REP_RESUMEN_TRATAMIENTO (:esta,:desde,:hasta) order by  fecha desc');
  IBQResumenTratamiento.SQL.Add(query);
  IBQResumenTratamiento.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQResumenTratamiento.ParamByName('desde').AsString := DateToStr(DTPADesde.Date);
  IBQResumenTratamiento.ParamByName('hasta').AsString := DateToStr(DTPAHasta.Date);

  IBQResumenTratamiento.Open;

  if not (IBQResumenTratamiento.IsEmpty) then
    begin
      Application.CreateForm(TFRepResumenTratamientoPreview, FRepResumenTratamientoPreview);
      FRepResumenTratamientoPreview.QRLDesdeValue.Caption:= DateToStr(DTPADesde.Date);
      FRepResumenTratamientoPreview.QRLHastaValue.Caption:= DateToStr(DTPAHasta.Date);
    end;
  cartel.cerrarcartel();
  cartel.FreeInstance();

  if not (IBQResumenTratamiento.IsEmpty) then
  begin
    FRepResumenTratamientoPreview.QRResumenTratamiento.DataSet := IBQResumenTratamiento;
    FRepResumenTratamientoPreview.ShowModal
  end
  else
     MostrarMensaje(tmError, 'No se han realizado tratamiento entre ' + DateToStr(DTPADesde.Date) + ' y ' + DateToStr(DTPAHasta.Date));

  HabilitarDesabilitarControles();     
end;

procedure TFRepResumenTratamiento.FrameResumenTratamientoIBQDisponiblesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameResumenTratamiento.IBQDisponibles.ParamByName('IDAUXPE').AsInteger := FIDAuxDisp;
end;

procedure TFRepResumenTratamiento.LlenarRodeos();
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

procedure TFRepResumenTratamiento.IBQRodeosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  LlenarRodeos(); 
end;

procedure TFRepResumenTratamiento.IBDSRodeosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFRepResumenTratamiento.SeleccionarUnPotrero(Sender : TObject);
begin
  FrameResumenTratamiento.IBQSeleccionados.Insert;
  FrameResumenTratamiento.IBQSeleccionados.FieldByName('ID_AUX').Value := FIDAuxDisp;
  FrameResumenTratamiento.IBQSeleccionados.FieldByName('ID_ANIMAL_EXTERNO').Value := FrameResumenTratamiento.IBQDisponibles.FieldByName('ID').AsInteger;
  FrameResumenTratamiento.IBQSeleccionados.FieldByName('NOMBRE').Value := FrameResumenTratamiento.IBQDisponibles.FieldByName('NOMBRE').AsString;
  FrameResumenTratamiento.IBQSeleccionados.FieldByName('RAZA').Value := FrameResumenTratamiento.IBQDisponibles.FieldByName('RAZA').AsString;
end;

procedure TFRepResumenTratamiento.FrameResumenTratamientoIBQSeleccionadosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameResumenTratamiento.IBQSeleccionados.ParamByName('ID_AUX').Value := FIDAuxDisp;
end;

procedure TFRepResumenTratamiento.FrameResumenTratamientoBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameResumenTratamiento.OnSelectItem := SeleccionarUnPotrero;
  FrameResumenTratamiento.BBAgregarTodosClick(Sender);
  actualizarBotones();
  ActualizarCantidad();
end;

procedure TFRepResumenTratamiento.ActualizarCantidad();
begin
  FrameResumenTratamiento.IBQDisponibles.First;
  FrameResumenTratamiento.IBQDisponibles.Last;
  FrameResumenTratamiento.GBDisponibles.Caption := Traducir(' Disponibles [')+IntToStr(FrameResumenTratamiento.IBQDisponibles.RecordCount)+'] ';
  FrameResumenTratamiento.IBQSeleccionados.First;
  FrameResumenTratamiento.IBQSeleccionados.Last;
  FrameResumenTratamiento.GBSeleccionados.Caption := Traducir(' Seleccionados [')+IntToStr(FrameResumenTratamiento.IBQSeleccionados.RecordCount)+'] ';
  FrameResumenTratamiento.IBQDisponibles.First;
  FrameResumenTratamiento.IBQSeleccionados.First;
end;

procedure TFRepResumenTratamiento.FrameResumenTratamientoBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameResumenTratamiento.OnSelectItem := SeleccionarUnPotrero;
  FrameResumenTratamiento.BBAgregarUnoClick(Sender);
  actualizarBotones;
  ActualizarCantidad();
end;

procedure TFRepResumenTratamiento.FrameResumenTratamientoBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameResumenTratamiento.BBEliminarUnoClick(Sender);
  if (FrameResumenTratamiento.DSSeleccionados.DataSet.IsEmpty) then
  begin
    actualizarBotones;
  end;
  ActualizarCantidad();
end;

procedure TFRepResumenTratamiento.FrameResumenTratamientoBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameResumenTratamiento.BBEliminarTodosClick(Sender);
  actualizarBotones; 
  ActualizarCantidad();
end;

procedure TFRepResumenTratamiento.FrameResumenTratamientoIBQDisponiblesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  ActualizarCantidad();
end;

procedure TFRepResumenTratamiento.LimpiarAux;
begin
  IBQLimpiarAux.Active := true;
  IBQLimpiarAux.Active := false;
  IBQLimpiarAuxExternos.Active := true;
  IBQLimpiarAuxExternos.Active := false;
  IBQLimpiarAuxEvento.Active := true;
  IBQLimpiarAuxEvento.Active := false;
end;

procedure TFRepResumenTratamiento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LimpiarAux();
end;

procedure TFRepResumenTratamiento.FiltrarRodeo;
begin
  IBQGenIDRodeosDisp.Close;
  IBQGenIDRodeosDisp.Open;

  IBDSRodeos.Open;

  FIDAuxDisp := IBQGenIDRodeosDisp.FieldValues['IDAUX'];


  IBQRodeos.Active := false;

  IBQRodeos.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRodeos.Active := true;

  FrameResumenTratamiento.ActualizarLosQuery;
  FrameResumenTratamiento.ControlarBotones;
  FrameResumenTratamiento.BDBGDisponibles.SelectedRows.Clear;
  FrameResumenTratamiento.ControlarBotones;
end;

procedure TFRepResumenTratamiento.FormCreate(Sender: TObject);
begin
  inherited;
  FiltrarRodeo();
end;

end.
