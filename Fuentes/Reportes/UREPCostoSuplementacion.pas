unit UREPCostoSuplementacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  Buttons, DateTimePickerAuto, UFrameDBSeleccion, DateUtils, JvGIF,
  PngImage, jpeg, JvExControls, JvLabel, JvExExtCtrls, JvImage, ImgList,
  PngImageList;

type
  TFREPCostoSuplementacion = class(TFUniversal)
    PFiltros: TPanel;
    PDatos: TPanel;
    GBFechas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    RGSeleccion: TRadioGroup;
    FSeleccion: TFrameSeleccion;
    IBQREPSuplementacion: TIBQuery;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    LExpExcel: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    procedure BBSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGSeleccionClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure DTPADesdeChange(Sender: TObject);
    procedure DTPAHastaChange(Sender: TObject);
    procedure IBQREPSuplementacionCalcFields(DataSet: TDataSet);
    procedure FSeleccionIBQDisponiblesAfterOpen(DataSet: TDataSet);
    procedure FSeleccionIBQSeleccionadosAfterOpen(DataSet: TDataSet);
    procedure FSeleccionBBAgregarTodosClick(Sender: TObject);
    procedure FSeleccionBBAgregarUnoClick(Sender: TObject);
    procedure FSeleccionBBEliminarUnoClick(Sender: TObject);
    procedure FSeleccionBBEliminarTodosClick(Sender: TObject);
    procedure FSeleccionBBETodosClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    Fecha_ini, Fecha_Fin : TDate;
    SQLResto : String;
    procedure ActualizarConsulta();
    procedure BorrarAuxiliares();
    procedure Seleccionar(Sender : TObject);
    procedure ConsultaReporte();
  public
    { Public declarations }
  end;

var
  FREPCostoSuplementacion: TFREPCostoSuplementacion;

implementation

uses
  UPrincipal, UREPCostoSuplementacionPreview, UMensajeHuella, UCartel;

{$R *.dfm}

procedure TFREPCostoSuplementacion.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFREPCostoSuplementacion.BorrarAuxiliares();
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFREPCostoSuplementacion.Seleccionar(Sender : TObject);
begin
  FSeleccion.IBQSeleccionados.Insert;
  FSeleccion.IBQSeleccionados.FieldByName('ID_ANIMAL').Value := FSeleccion.IBQDisponibles.FieldValues['ID'];
  FSeleccion.IBQSeleccionados.FieldByName('NOMBRE').Value := FSeleccion.IBQDisponibles.FieldValues['NOMBRE'];
  FSeleccion.IBQSeleccionados.FieldByName('ID_AUX').Value := 1;
end;

procedure TFREPCostoSuplementacion.ActualizarConsulta();
begin
  FSeleccion.IBQDisponibles.Close;
  FSeleccion.IBQDisponibles.SQL.Clear;
  if RGSeleccion.ItemIndex = 0 then
    FSeleccion.IBQDisponibles.SQL.Add('SELECT ID_POTRERO AS ID, NOMBRE FROM TAB_POTREROS WHERE ESTABLECIMIENTO = :ESTA and (visible = 1) AND ID_POTRERO NOT IN '+SQLResto)
  else
    FSeleccion.IBQDisponibles.SQL.Add('SELECT ID_RODEO AS ID, NOMBRE FROM TAB_RODEOS WHERE ESTABLECIMIENTO = :ESTA and (visible = 1) AND ID_RODEO NOT IN '+SQLResto);
  FSeleccion.IBQDisponibles.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  FSeleccion.IBQDisponibles.Open;
  BorrarAuxiliares();
  FSeleccion.IBQSeleccionados.Close;
  FSeleccion.IBQSeleccionados.Open;
end;

procedure TFREPCostoSuplementacion.FormCreate(Sender: TObject);
begin
  inherited;
  Fecha_Ini := IncYear(Date(),-1);
  Fecha_Fin := Date();
  DTPADesde.Date := IncYear(Date(),-1);
  DTPAHasta.Date := Date();
  SQLResto := '(SELECT ID_ANIMAL FROM AUX_ANIMALES)';
  FSeleccion.OnSelectItem := Seleccionar;
  ActualizarConsulta();
end;

procedure TFREPCostoSuplementacion.RGSeleccionClick(Sender: TObject);
begin
  inherited;
  ActualizarConsulta();
end;

procedure TFREPCostoSuplementacion.BBImprimirReporteClick(Sender: TObject);
var
  Cartel : TCartel;
  F : TFREPCostoSuplementacionPreview;
begin
  inherited;
  HabilitarDesabilitarControles();
  Cartel := TCartel.getInstance;
  Cartel.abrircartel('Generando Reporte de Costos de Alimentación');

  ConsultaReporte();

  if not IBQREPSuplementacion.IsEmpty then
  begin
    F := TFREPCostoSuplementacionPreview.Create(nil);
    F.QRLHastaValue.Caption := DateToStr(Fecha_Fin);
    F.QRLDesdeValue.Caption := DateToStr(Fecha_Ini);
    Cartel.cerrarcartel;
    Cartel.Destroy;

    F.ShowModal;
    F.Destroy;
  end
  else
  begin
    Cartel.cerrarcartel;
    Cartel.Destroy;
    MostrarMensaje(tmInformacion,'No se han registrado Alimentaciones');
  end;
  HabilitarDesabilitarControles();
 
  
end;

procedure TFREPCostoSuplementacion.ConsultaReporte();
begin
  IBQREPSuplementacion.Close;
  IBQREPSuplementacion.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQREPSuplementacion.ParamByName('FECHA_INI').AsDate := Fecha_Ini;
  IBQREPSuplementacion.ParamByName('FECHA_FIN').AsDate := Fecha_Fin;
  IBQREPSuplementacion.ParamByName('TIPO').value := null;
  IBQREPSuplementacion.Open;
end;

procedure TFREPCostoSuplementacion.DTPADesdeChange(Sender: TObject);
begin
  inherited;
  Fecha_Ini := DTPADesde.Date;
end;

procedure TFREPCostoSuplementacion.DTPAHastaChange(Sender: TObject);
begin
  inherited;
  Fecha_Fin := DTPAHasta.Date;
end;

procedure TFREPCostoSuplementacion.IBQREPSuplementacionCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('TOTAL').AsFloat := DataSet.FieldValues['ANIMALES']*DataSet.FieldValues['COSTO_TOTAL'];
end;

procedure TFREPCostoSuplementacion.FSeleccionIBQDisponiblesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
  FSeleccion.GBDisponibles.Caption := 'Potreros Disponibles['+IntToStr(DataSet.RecordCount)+']';
end;

procedure TFREPCostoSuplementacion.FSeleccionIBQSeleccionadosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
  FSeleccion.GBSeleccionados.Caption := 'Potreros Seleccionados['+IntToStr(DataSet.RecordCount)+']';
end;

procedure TFREPCostoSuplementacion.FSeleccionBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := Seleccionar;
  FSeleccion.BBAgregarTodosClick(Sender);
end;

procedure TFREPCostoSuplementacion.FSeleccionBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := Seleccionar;
  FSeleccion.BBAgregarUnoClick(Sender);
end;

procedure TFREPCostoSuplementacion.FSeleccionBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := Seleccionar;
  FSeleccion.BBEliminarUnoClick(Sender);
end;

procedure TFREPCostoSuplementacion.FSeleccionBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := Seleccionar;
  FSeleccion.BBEliminarTodosClick(Sender);
end;

procedure TFREPCostoSuplementacion.FSeleccionBBETodosClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := Seleccionar;
  FSeleccion.BBEliminarTodosClick(Sender);
end;

procedure TFREPCostoSuplementacion.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  ConsultaReporte();
end;

end.
