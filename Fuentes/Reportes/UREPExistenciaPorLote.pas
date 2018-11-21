unit UREPExistenciaPorLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, UDMSoftvet,
  DBCtrls, UDBLookupComboBoxAuto, IBQuery, Grids, DBGrids, UBDBGrid,
  IBUpdateSQL, UFrameDBSeleccion, UPrincipal, UREPExistenciaPorLotePreview,
  UREPExistenciaPorLotesGralPreview, MaskUtils, UREPEvolucionRecForrajeroPreview,
  UMensajeImpresora, JvGIF, PngImage, jpeg, JvExControls, JvLabel, ImgList,
  PngImageList, JvExExtCtrls, JvImage;

type
  TFREPExistenciaPorLote = class(TFUniversal)
    PCDatos: TPageControl;
    TSSelector: TTabSheet;
    TSDatos: TTabSheet;
    IBDSPotreros: TIBDataSet;
    FrameSeleccionPotrero: TFrameSeleccion;
    IBQPotrero: TIBQuery;
    DSPotrero: TDataSource;
    IBQGenIDPotrerosDisp: TIBQuery;
    IBDSPotrerosID_AUX: TIntegerField;
    IBDSPotrerosID_ANIMAL: TIntegerField;
    IBDSPotrerosNOMBRE: TIBStringField;
    IBQLimpiarAuxExternos: TIBQuery;
    IBQLimpiarAux: TIBQuery;
    BDBGPotrerosSeleccionados: TBitDBGrid;
    IBQPotrerosSeleccionados: TIBQuery;
    DSPotrerosSeleccionados: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LCantVacas: TLabel;
    LCantTerneros: TLabel;
    LCantToros: TLabel;
    LHA: TLabel;
    LTotal: TLabel;
    LVacas: TLabel;
    LTerneros: TLabel;
    LToros: TLabel;
    IBDSPotrerosRAZA: TIntegerField;
    IBSPCantidades: TIBStoredProc;
    LCantNovillos: TLabel;
    LCantTerneras: TLabel;
    LCantVaquillonas: TLabel;
    LNovillos: TLabel;
    LTerneras: TLabel;
    LVaquillonas: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LRecursoForrajero: TLabel;
    LFechaRecurso: TLabel;
    CabNovHa: TLabel;
    CabTeraHa: TLabel;
    CabTeroHa: TLabel;
    CabToroHa: TLabel;
    CabVacaHa: TLabel;
    CabVaqHa: TLabel;
    LCabNovHa: TLabel;
    LCabTeraHa: TLabel;
    LCabTeroHa: TLabel;
    LCabToroHa: TLabel;
    LCabVacaHa: TLabel;
    LCabVaqHa: TLabel;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    Label6: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    RBRecForraje: TRadioButton;
    RBDetallado: TRadioButton;
    RBGral: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ISig: TImage;
    Iant: TImage;
    Lant: TLabel;
    LSig: TLabel;
    IBSPCantidadesCANT_TOROS: TIntegerField;
    IBSPCantidadesCANT_VACAS: TIntegerField;
    IBSPCantidadesCANT_TERNEROS: TIntegerField;
    IBSPCantidadesCANT_NOVILLOS: TIntegerField;
    IBSPCantidadesCANT_TERNERAS: TIntegerField;
    IBSPCantidadesCANT_VAQUILLONAS: TIntegerField;
    IBSPCantidadesRECURSO_FORRAJERO: TIBStringField;
    IBSPCantidadesFECHA_RECURSO: TDateField;
    IBSPCantidadesTOTAL: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FrameSeleccionPotreroIBQDisponiblesBeforeOpen(
      DataSet: TDataSet);
    procedure IBQPotreroAfterOpen(DataSet: TDataSet);
    procedure IBDSPotrerosAfterOpen(DataSet: TDataSet);
    procedure SeleccionarUnPotrero(Sender : TObject);
    procedure FrameSeleccionPotreroIBQSeleccionadosBeforeOpen(
      DataSet: TDataSet);
    procedure FrameSeleccionPotreroBBAgregarTodosClick(Sender: TObject);
    procedure FrameSeleccionPotreroBBAgregarUnoClick(Sender: TObject);
    procedure FrameSeleccionPotreroBBEliminarUnoClick(Sender: TObject);
    procedure FrameSeleccionPotreroBBEliminarTodosClick(Sender: TObject);
    procedure TSDatosShow(Sender: TObject);
    procedure BDBGPotrerosSeleccionadosCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBSalirClick(Sender: TObject);
    procedure BBSiguienteClick(Sender: TObject);
    procedure BBAtrasClick(Sender: TObject);
    procedure PCDatosChange(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure FrameSeleccionPotreroIBQDisponiblesAfterOpen(
      DataSet: TDataSet);
  private
    FIDAuxDisp : Integer;
    procedure LlenarPotreros();
    procedure ActualizarCantidad();
  public
    { Public declarations }
  end;

var
  FREPExistenciaPorLote: TFREPExistenciaPorLote;

implementation

uses UREPFichaAnimal;


{$R *.dfm}

procedure TFREPExistenciaPorLote.FormCreate(Sender: TObject);
begin
  inherited;
  IBQGenIDPotrerosDisp.Close;
  IBQGenIDPotrerosDisp.Open;

  IBDSPotreros.Open;

  FIDAuxDisp := IBQGenIDPotrerosDisp.FieldValues['IDAUX'];

  IBQPotrero.Active := false;
  IBQPotrero.ParamByName('EST').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotrero.Active := true;

  FrameSeleccionPotrero.ActualizarLosQuery;
  FrameSeleccionPotrero.ControlarBotones;
  FrameSeleccionPotrero.BDBGDisponibles.SelectedRows.Clear;
  FrameSeleccionPotrero.ControlarBotones;

  BDBGPotrerosSeleccionados.SelectedRows.Clear;

  TSDatos.TabVisible := false;
  {BBSiguiente.Enabled := false;
  BBAtras.Enabled := false;}
  ISig.Enabled := false;
  Lsig.Enabled := false;
  LAnt.Enabled := false;
  Iant.Enabled := false;
  //BBImprimirReporte.Enabled := false;
  LPreview.Enabled := false;
  IPreview.Enabled := false;
end;

procedure TFREPExistenciaPorLote.FrameSeleccionPotreroIBQDisponiblesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameSeleccionPotrero.IBQDisponibles.ParamByName('IDAUXPE').AsInteger := FIDAuxDisp;
end;

procedure TFREPExistenciaPorLote.LlenarPotreros();
begin
  IBDSPotreros.Open;
  IBQPotrero.First;
  while (not IBQPotrero.Eof) do
  begin
    IBDSPotreros.Insert;
    IBDSPotreros.FieldByName('ID_AUX').Value := FIDAuxDisp;
    IBDSPotreros.FieldByName('ID_ANIMAL').Value := IBQPotrero.fieldByName('ID_POTRERO').AsInteger;
    IBDSPotreros.FieldByName('NOMBRE').Value := IBQPotrero.fieldByName('NOMBRE').AsString;
    IBDSPotreros.FieldByName('RAZA').Value := IBQPotrero.fieldByName('HECTAREAS').AsInteger;
    IBQPotrero.Next;
  end;
  IBDSPotreros.Database.ApplyUpdates([IBDSPotreros]);
end;

procedure TFREPExistenciaPorLote.IBQPotreroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  LlenarPotreros();
end;

procedure TFREPExistenciaPorLote.IBDSPotrerosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFREPExistenciaPorLote.SeleccionarUnPotrero(Sender : TObject);
begin
  FrameSeleccionPotrero.IBQSeleccionados.Insert;
  FrameSeleccionPotrero.IBQSeleccionados.FieldByName('ID_AUX').Value := FIDAuxDisp;
  FrameSeleccionPotrero.IBQSeleccionados.FieldByName('ID_ANIMAL_EXTERNO').Value := FrameSeleccionPotrero.IBQDisponibles.FieldByName('ID').AsInteger;
  FrameSeleccionPotrero.IBQSeleccionados.FieldByName('NOMBRE').Value := FrameSeleccionPotrero.IBQDisponibles.FieldByName('NOMBRE').AsString;
  FrameSeleccionPotrero.IBQSeleccionados.FieldByName('RAZA').Value := FrameSeleccionPotrero.IBQDisponibles.FieldByName('RAZA').AsString;
end;

procedure TFREPExistenciaPorLote.FrameSeleccionPotreroIBQSeleccionadosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameSeleccionPotrero.IBQSeleccionados.ParamByName('ID_AUX').Value := FIDAuxDisp;
end;

procedure TFREPExistenciaPorLote.FrameSeleccionPotreroBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccionPotrero.OnSelectItem := SeleccionarUnPotrero;
  FrameSeleccionPotrero.BBAgregarTodosClick(Sender);
  TSDatos.TabVisible := true;
  //BBSiguiente.Enabled := true;
  ISig.Enabled := true;
  LSig.Enabled := true;
  //BBImprimirReporte.Enabled := true;
  LPreview.Enabled := true;
  IPreview.Enabled := true;
  ActualizarCantidad();
end;

procedure TFREPExistenciaPorLote.FrameSeleccionPotreroBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccionPotrero.OnSelectItem := SeleccionarUnPotrero;
  FrameSeleccionPotrero.BBAgregarUnoClick(Sender);
  TSDatos.TabVisible := true;
  //BBSiguiente.Enabled := true;
  ISig.Enabled := true;
  LSig.Enabled := true;
  //BBImprimirReporte.Enabled := true;
  LPreview.Enabled := true;
  IPreview.Enabled := true;
  ActualizarCantidad();
end;

procedure TFREPExistenciaPorLote.FrameSeleccionPotreroBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccionPotrero.BBEliminarUnoClick(Sender);
  if (FrameSeleccionPotrero.DSSeleccionados.DataSet.IsEmpty) then
  begin
    TSDatos.TabVisible := false;
    //BBSiguiente.Enabled := false;
    ISig.Enabled := false;
    LSig.Enabled := false;
    //BBImprimirReporte.Enabled := false;
    IPreview.Enabled := false;
    LPreview.Enabled := false;
  end;
  ActualizarCantidad();
end;

procedure TFREPExistenciaPorLote.FrameSeleccionPotreroBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameSeleccionPotrero.BBEliminarTodosClick(Sender);
  TSDatos.TabVisible := false;
  //BBSiguiente.Enabled := false;
  ISig.Enabled := false;
  LSig.Enabled := false;
  //BBImprimirReporte.Enabled := false;
  LPreview.Enabled := false;
  IPreview.Enabled := false;
  ActualizarCantidad();
end;

procedure TFREPExistenciaPorLote.TSDatosShow(Sender: TObject);
begin
  inherited;
  IBQPotrerosSeleccionados.Close;
  IBQPotrerosSeleccionados.Open;
  BDBGPotrerosSeleccionadosCellClick(nil);
end;

procedure TFREPExistenciaPorLote.BDBGPotrerosSeleccionadosCellClick(
  Column: TColumn);
begin
  inherited;
  IBQPotrero.Locate('ID_POTRERO',IBQPotrerosSeleccionados.FieldByName('ID').AsInteger{BDBGPotrerosSeleccionados.Fields[0].AsInteger},[loCaseInsensitive]);

  LHA.Caption := IntToStr(IBQPotrero.fieldByName('HECTAREAS').AsInteger);

  IBSPCantidades.ParamByName('ID_POTRERO').AsInteger := IBQPotrerosSeleccionados.FieldValues['ID'];//BDBGPotrerosSeleccionados.Fields[0].AsInteger;
  IBSPCantidades.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBSPCantidades.ExecProc;

  if (IBSPCantidades.Params.ParamValues['CANT_TOROS'] = 0) then
  begin
    LToros.Caption := '-';
    LCantToros.Enabled := false;
    LCabToroHa.Caption := '-';
    CabToroHa.Enabled := false;
  end
  else
  begin
    LCantToros.Enabled := true;
    LToros.Caption := IntToStr(IBSPCantidades.Params.ParamValues['CANT_TOROS']);
    if (LHA.Caption <> '0') then
    begin
      LCabToroHa.Caption :=  FormatMaskText('000,0000',FloatToStr(StrToInt(LToros.Caption)/StrToInt(LHA.Caption)));
      CabToroHa.Enabled := true;
    end
    else
    begin
      LCabToroHa.Caption := '-';
      CabToroHa.Enabled := false;
    end;
  end;

  if (IBSPCantidades.Params.ParamValues['CANT_VACAS'] = 0) then
  begin
    LVacas.Caption := '-';
    LCantVacas.Enabled := false;
    LCabVacaHa.Caption := '-';
    CabVacaHa.Enabled := false;
  end
  else
  begin
    LCantVacas.Enabled := true;
    LVacas.Caption := IntToStr(IBSPCantidades.Params.ParamValues['CANT_VACAS']);
    if (LHA.Caption <> '0') then
    begin
      CabVacaHa.Enabled := true;
      LCabVacaHa.Caption := FormatMaskText('000,0000',FloatToStr(StrToInt(LVacas.Caption)/StrToInt(LHA.Caption)));
    end
    else
    begin
      LCabVacaHa.Caption := '-';
      CabVacaHa.Enabled := false;
    end;
  end;

  if (IBSPCantidades.Params.ParamValues['CANT_NOVILLOS'] = 0) then
  begin
    LNovillos.Caption := '-';
    LCantNovillos.Enabled := false;
    LCabNovHa.Caption := '-';
    CabNovHa.Enabled := false;
  end
  else
  begin
    LCantNovillos.Enabled := true;
    LNovillos.Caption := IntToStr(IBSPCantidades.Params.ParamValues['CANT_NOVILLOS']);
    if (LHA.Caption <> '0') then
    begin
      LCabNovHa.Caption := FormatMaskText('000,0000',FloatToStr(StrToInt(LNovillos.Caption)/StrToInt(LHA.Caption)));
      CabNovHa.Enabled := true;
    end
    else
    begin
      LCabNovHa.Caption := '-';
      CabNovHa.Enabled := false;
    end;
  end;

  if (IBSPCantidades.Params.ParamValues['CANT_TERNERAS'] = 0) then
  begin
    LTerneras.Caption := '-';
    LCantTerneras.Enabled := false;
    LCabTeraHa.Caption := '-';
    CabTeraHa.Enabled := false;
  end
  else
  begin
    LCantTerneras.Enabled := true;
    LTerneras.Caption := IntToStr(IBSPCantidades.Params.ParamValues['CANT_TERNERAS']);
    if (LHA.Caption <> '0') then
    begin
      LCabTeraHa.Caption := FormatMaskText('000,0000',FloatToStr(StrToInt(LTerneras.Caption)/StrToInt(LHA.Caption)));
      CabTeraHa.Enabled := true;
    end
    else
    begin
      LCabTeraHa.Caption := '-';
      CabTeraHa.Enabled := false;
    end;
  end;

  if (IBSPCantidades.Params.ParamValues['CANT_TERNEROS'] = 0) then
  begin
    LTerneros.Caption := '-';
    LCantTerneros.Enabled := false;
    LCabTeroHa.Caption := '-';
    CabTeroHa.Enabled := false;
  end
  else
  begin
    LCantTerneros.Enabled := true;
    LTerneros.Caption := IntToStr(IBSPCantidades.Params.ParamValues['CANT_TERNEROS']);
    if (LHA.Caption <> '0') then
    begin
      LCabTeroHa.Caption := FormatMaskText('000,0000',FloatToStr(StrToInt(LTerneros.Caption)/StrToInt(LHA.Caption)));
      CabTeroHa.Enabled := true;
    end
    else
    begin
      LCabTeroHa.Caption := '-';
      CabTeroHa.Enabled := false;
    end;
  end;

  if (IBSPCantidades.Params.ParamValues['CANT_VAQUILLONAS'] = 0) then
  begin
    LVaquillonas.Caption := '-';
    LCantVaquillonas.Enabled := false;
    LCabVaqHa.Caption := '-';
    CabVaqHa.Enabled := false;
  end
  else
  begin
    LCantVaquillonas.Enabled := true;
    LVaquillonas.Caption := IntToStr(IBSPCantidades.Params.ParamValues['CANT_VAQUILLONAS']);
    if (LHA.Caption <> '0') then
    begin
      LCabVaqHa.Caption := FormatMaskText('000,0000',FloatToStr(StrToInt(LVaquillonas.Caption)/StrToInt(LHA.Caption)));
      CabVaqHa.Enabled := true;
    end
    else
    begin
      LCabVaqHa.Caption := '-';
      CabVaqHa.Enabled := false;
    end;
  end;

  LTotal.Caption := IntToStr(IBSPCantidades.Params.ParamValues['TOTAL']);

  LRecursoForrajero.Caption := IBSPCantidades.Params.ParamValues['RECURSO_FORRAJERO'];

  if (IBSPCantidades.Params.ParamValues['FECHA_RECURSO'] = null) then
    LFechaRecurso.Caption := '-'
  else
    LFechaRecurso.Caption := DateToStr(IBSPCantidades.Params.ParamValues['FECHA_RECURSO']);
end;

procedure TFREPExistenciaPorLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IBQLimpiarAux.Active := true;
  IBQLimpiarAux.Active := false;
  IBQLimpiarAuxExternos.Active := true;
  IBQLimpiarAuxExternos.Active := false;
end;

procedure TFREPExistenciaPorLote.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFREPExistenciaPorLote.BBSiguienteClick(Sender: TObject);
begin
  inherited;
  PCDatos.ActivePage := TSDatos;
  //BBSiguiente.Enabled := false;
  //BBAtras.Enabled := true;
  ISig.Enabled := false;
  LSig.Enabled := false;
  Iant.Enabled := true;
  Lant.Enabled := true;
end;

procedure TFREPExistenciaPorLote.BBAtrasClick(Sender: TObject);
begin
  inherited;
  PCDatos.ActivePage := TSSelector;
  //BBSiguiente.Enabled := false;
  //BBAtras.Enabled := true;
  ISig.Enabled := true;
  LSig.Enabled := true;
  Iant.Enabled := false;
  Lant.Enabled := false;
end;

procedure TFREPExistenciaPorLote.PCDatosChange(Sender: TObject);
begin
  inherited;
  if (PCDatos.ActivePage.Name = 'TSSelector') then
  begin
    {BBSiguiente.Enabled := true;
    BBAtras.Enabled := false;}
    ISig.Enabled := true;
    LSig.Enabled := true;
    Iant.Enabled := false;
    Lant.Enabled := false;
  end
  else
  begin
    {BBSiguiente.Enabled := false;
    BBAtras.Enabled := true;}
    ISig.Enabled := false;
    LSig.Enabled := false;
    Iant.Enabled := true;
    Lant.Enabled := true;
  end;
end;

procedure TFREPExistenciaPorLote.BBImprimirReporteClick(Sender: TObject);
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  if (RBGral.Checked) then
  begin
    Application.CreateForm(TFREPExistenciaPorLotesGralPreview,FREPExistenciaPorLotesGralPreview);
    FREPExistenciaPorLotesGralPreview.ShowModal;
  end;
  if (RBDetallado.Checked) then
  begin
    Application.CreateForm(TFREPExistenciaPorLotePreview,FREPExistenciaPorLotePreview);
    FREPExistenciaPorLotePreview.ShowModal;
  end;
  if (RBRecForraje.Checked) then
  begin
    Application.CreateForm(TFREPEvolucionRecForrajeroPreview,FREPEvolucionRecForrajeroPreview);
    FREPEvolucionRecForrajeroPreview.ShowModal;
  end;
  HabilitarDesabilitarControles();  
end;

procedure TFREPExistenciaPorLote.ActualizarCantidad();
begin
  FrameSeleccionPotrero.IBQDisponibles.First;
  FrameSeleccionPotrero.IBQDisponibles.Last;
  FrameSeleccionPotrero.GBDisponibles.Caption := ' Disponibles ['+IntToStr(FrameSeleccionPotrero.IBQDisponibles.RecordCount)+'] ';
  FrameSeleccionPotrero.IBQSeleccionados.First;
  FrameSeleccionPotrero.IBQSeleccionados.Last;
  FrameSeleccionPotrero.GBSeleccionados.Caption := ' Seleccionados ['+IntToStr(FrameSeleccionPotrero.IBQSeleccionados.RecordCount)+'] ';
  FrameSeleccionPotrero.IBQDisponibles.First;
  FrameSeleccionPotrero.IBQSeleccionados.First;
end;

procedure TFREPExistenciaPorLote.FrameSeleccionPotreroIBQDisponiblesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  ActualizarCantidad();
end;

end.
