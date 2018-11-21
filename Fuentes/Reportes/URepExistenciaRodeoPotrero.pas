unit URepExistenciaRodeoPotrero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, UBDBGrid, DBCtrls, UDBLookupComboBoxAuto, IBQuery,
  UFrameDBSeleccion, UFrameMangazo, UMensajeImpresora, PngImage, jpeg,
  QRCtrls, QuickRpt, QRExport, QRPDFFilt, ImgList, PngImageList,
  JvExControls, JvLabel, JvGIF, URepExistenciaRodeoPotreroPreview,
  JvExExtCtrls, JvImage;

type

  TFREPExistenciaRodeoPotrero = class(TFUniversal)
    PTop: TPanel;
    Splitter2: TSplitter;
    RGTipo: TRadioGroup;
    PExistenciaRodeoPotrero: TPanel;
    GBExistRodeoPotrero: TGroupBox;
    BDBGExistenciaRodeoPotrero: TBitDBGrid;
    IBQRodeosPotreros: TIBQuery;
    DSRodeosPotreros: TDataSource;
    IBQExistRodeoPotrero: TIBQuery;
    DSExistRodeoPotrero: TDataSource;
    ASalir: TAction;
    AImprimirReporte: TAction;
    PSeleccion: TPanel;
    FrameRodeoPotrero: TFrameSeleccion;
    IBQGenIDPotrerosRodeosDisp: TIBQuery;
    IBDSPotrerosRodeos: TIBDataSet;
    IBDSPotrerosRodeosID_AUX: TIntegerField;
    IBDSPotrerosRodeosID_ANIMAL: TIntegerField;
    IBDSPotrerosRodeosNOMBRE: TIBStringField;
    IBDSPotrerosRodeosRAZA: TIntegerField;
    IBQLimpiarAuxExternos: TIBQuery;
    IBQLimpiarAux: TIBQuery;
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
    IBQPasarCategorias: TIBQuery;
    IBQAux: TIBQuery;
    IBQGrupos: TIBQuery;
    IBQCantporGrupo: TIBQuery;
    IBQTotalPorRodeo: TIBQuery;
    IBQTotalPorCat: TIBQuery;
    procedure RGTipoClick(Sender: TObject);
    procedure SeleccionarUnPotrero(Sender : TObject);    
    procedure IBQExistRodeoPotreroAfterOpen(DataSet: TDataSet);
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FrameRodeoPotreroIBQDisponiblesBeforeOpen(DataSet: TDataSet);
    procedure IBQRodeosPotrerosAfterOpen(DataSet: TDataSet);
    procedure IBDSPotrerosRodeosAfterOpen(DataSet: TDataSet);
    procedure FrameRodeoPotreroIBQSeleccionadosBeforeOpen(
      DataSet: TDataSet);
    procedure FrameRodeoPotreroBBAgregarTodosClick(Sender: TObject);
    procedure FrameRodeoPotreroBBAgregarUnoClick(Sender: TObject);
    procedure FrameRodeoPotreroBBEliminarUnoClick(Sender: TObject);
    procedure FrameRodeoPotreroBBEliminarTodosClick(Sender: TObject);
    procedure FrameRodeoPotreroIBQDisponiblesAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FIDAuxDisp : Integer;

    CantColumnas : Integer;
    Total : INteger;

    procedure CargarCategorias;
    procedure ArmarTablas(var F : TFRepExistenciaRodeoPotreroPreview);

    procedure actualizarFiltro;
    procedure actualizarBotones;
    procedure ActualizarCantidad();
    procedure FiltrarPotreroRodeo();
    procedure LimpiarAux();
    procedure LlenarRodeosPotreros;
  public
    { Public declarations }
  end;

var
  FREPExistenciaRodeoPotrero: TFREPExistenciaRodeoPotrero;
  SQLGenerico : String;

implementation

uses UPrincipal, uTiposGlobales, UCartel, UDMSoftvet, UTraduccion;

{$R *.dfm}

procedure TFREPExistenciaRodeoPotrero.actualizarBotones;
begin
  //AImprimirReporte.Enabled := not(FrameRodeoPotrero.IBQSeleccionados.IsEmpty);
  LPreview.Enabled := not(FrameRodeoPotrero.IBQSeleccionados.IsEmpty);
  IPreview.Enabled := not(FrameRodeoPotrero.IBQSeleccionados.IsEmpty);
  //BBXls.Enabled := not(IBQExistRodeoPotrero.IsEmpty);
end;

procedure TFREPExistenciaRodeoPotrero.actualizarFiltro;
var query:string;
    cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando Existencia ...';
  cartel.abrircartel(msje);

  IBQExistRodeoPotrero.Active := false;

  query :='select * from REP_EXISTENCIA_RODEO_POTRERO (:esta,:tipo)';
  IBQExistRodeoPotrero.SQL.Clear;
  IBQExistRodeoPotrero.SQL.Add(query);

  if (RGTipo.ItemIndex = 0) then  // potreros
    begin
      IBQExistRodeoPotrero.ParamByName('tipo').Value := 1;
    end
   else
    if (RGTipo.ItemIndex = 1) then  // Rodeo
      begin
       IBQExistRodeoPotrero.ParamByName('tipo').Value := 2;
      end;

  IBQExistRodeoPotrero.ParamByName('esta').Value := fprincipal.establecimientoactual;
  IBQExistRodeoPotrero.Active := true;
  actualizarBotones;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFREPExistenciaRodeoPotrero.CargarCategorias;
begin

  try
    IBQLimpiarAux.Close;
    IBQLimpiarAux.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
  try
    IBQPasarCategorias.Close;
    IBQPasarCategorias.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    if RGTipo.ItemIndex = 0 then
      IBQPasarCategorias.ParamByName('pot').AsInteger := 0
    else
      IBQPasarCategorias.ParamByName('pot').AsInteger := -1;
    IBQPasarCategorias.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  IBQAux.Close;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select distinct(apodo) from aux_animales');
  IBQAux.Open;
  IBQAux.Last;
  IBQAux.First;

  CantColumnas := IBQAux.RecordCount;

end;

procedure TFREPExistenciaRodeoPotrero.ArmarTablas(var F : TFRepExistenciaRodeoPotreroPreview);
const
  INC = 24;
  LF = 153;
var
  NextTop, NextTopS, NextLF : Integer;
  BandWidth : Integer;
  ColWidth : Integer;
begin
  NextTop := 55;
  NextTopS := 48;
  Total := 0;
  BandWidth := F.QRBDetailPlanilla.Width - 153;
  ColWidth := BandWidth div (CantColumnas+1); // le agrego la columna para el total

  IBQTotalPorCat.Close;
  IBQTotalPorCat.Open;
  IBQTotalPorRodeo.Close;
  IBQTotalPorRodeo.Open;


  with (TQRLabel(F.QRBDetailPlanilla.AddPrintable(TQRLabel))) do
  begin
    AutoSize := false;
    Alignment := taCenter;
    WordWrap := true;
    Top := 11;
    Left := 8;
    Width := 137;
    Transparent := true;
    Height := 17;
    Font.Size := 10;
    Font.Name := 'Arial';
    Font.Style := [fsBold];
    if RGTipo.ItemIndex = 0 then
      Caption := 'Potrero / Categoria'
    else
      Caption := 'Rodeo / Categoria';
  end;


  NextLF := LF;
  IBQAux.First;
  while not IBQAux.Eof do
  begin
    with (TQRLabel(F.QRBDetailPlanilla.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      Alignment := taCenter;
      WordWrap := true;
      Top := 14;
      Left := NextLF;
      Width := ColWidth;
      Transparent := true;
      Height := 34;
      Font.Size := 07;
      Font.Name := 'Arial';
      Font.Style := [fsBold];
      Frame.DrawBottom := true;
      Frame.DrawLeft := true;
      Frame.DrawRight := true;
      Frame.DrawTop := true;
      Caption := IBQAux.FieldValues['apodo'];
    end;
    NextLF := NextLF + ColWidth;
    IBQAux.Next;
  end;

  with (TQRLabel(F.QRBDetailPlanilla.AddPrintable(TQRLabel))) do
  begin
    AutoSize := false;
    Alignment := taCenter;
    WordWrap := true;
    Top := 14;
    Left := NextLF;
    Width := ColWidth;
    Transparent := true;
    Height := 34;
    Font.Size := 10;
    Font.Name := 'Arial';
    Font.Style := [fsBold];
    Caption := 'Total';
  end;

  IBQGrupos.Close;
  IBQGrupos.Open;
  while not IBQGrupos.Eof do
  begin
    with (TQRShape(F.QRBDetailPlanilla.AddPrintable(TQRShape))) do
    begin
      Shape := qrsHorLine;
      Width := F.QRBDetailPlanilla.Width;
      Left := 0;
      Top := NextTopS;
      Height := 7;
    end;

    with (TQRLabel(F.QRBDetailPlanilla.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      WordWrap := false;
      Top := NextTop;
      Transparent := true;
      Left := 8;
      Width := 137;
      Height := 17;
      Font.Size := 09;
      Font.Name := 'Arial';
      //Font.Style := [fsBold];
      Caption := IBQGrupos.FieldValues['nombre'];
    end;

    IBQCantporGrupo.Close;
    IBQCantporGrupo.ParamByName('n').AsString := IBQGrupos.FieldValues['nombre'];
    IBQCantporGrupo.Open;

    IBQAux.First;
    NextLF := LF;
    while not IBQAux.Eof do
    begin

      with (TQRLabel(F.QRBDetailPlanilla.AddPrintable(TQRLabel))) do
      begin
        AutoSize := false;
        Alignment := taCenter;
        WordWrap := false;
        Top := NextTop;
        Left := NextLF;
        Width := ColWidth;
        Transparent := true;
        Height := 17;
        Font.Name := 'Arial';
        Frame.DrawLeft := true;
        Frame.DrawRight := true;
        if IBQCantporGrupo.Locate('apodo',IBQAux.FieldValues['apodo'],[]) then
        begin
          Caption := IntToStr(IBQCantporGrupo.FieldValues['establecimiento']);
          Total := Total + IBQCantporGrupo.FieldValues['establecimiento'];
          //Font.Style := [fsBold];
        end
        else
          Caption := '';
      end;

      NextLF := NextLF + ColWidth;
      IBQAux.Next;
    end;

    with (TQRLabel(F.QRBDetailPlanilla.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      WordWrap := false;
      Alignment := taCenter;
      Top := NextTop;
      Transparent := true;
      Left := NextLF;
      Width := ColWidth;
      Height := 17;
      Font.Size := 09;
      Font.Name := 'Arial';
      Font.Style := [fsBold];
      if IBQTotalPorRodeo.Locate('nombre',IBQGrupos.FieldValues['nombre'],[]) then
        Caption := IBQTotalPorRodeo.FieldValues['suma']
      else
        Caption := '-';
    end;

    NextTop := NextTop + INC;
    NextTopS := NextTopS + INC;
    IBQGrupos.Next;
  end;

  with (TQRShape(F.QRBDetailPlanilla.AddPrintable(TQRShape))) do
  begin
    Shape := qrsHorLine;
    Width := F.QRBDetailPlanilla.Width;
    Left := 0;
    Top := NextTopS;
    Height := 7;
  end;

  NextTopS := NextTopS + INC;

  with (TQRLabel(F.QRBDetailPlanilla.AddPrintable(TQRLabel))) do
  begin
    AutoSize := false;
    WordWrap := false;
    Top := NextTop;
    Transparent := true;
    Left := 8;
    Width := 137;
    Height := 17;
    Font.Size := 10;
    Font.Name := 'Arial';
    Font.Style := [fsBold];
    Caption := 'Total';
  end;

  NextLF := LF;
  IBQAux.First;
  while not IBQAux.Eof do
  begin
    with (TQRLabel(F.QRBDetailPlanilla.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      Alignment := taCenter;
      WordWrap := false;
      Top := NextTop;
      Left := NextLF;
      Width := ColWidth;
      Transparent := true;
      Height := 17;
      Font.Name := 'Arial';
      Font.Style := [fsBold];
      Frame.DrawLeft := true;
      Frame.DrawRight := true;
      if IBQTotalPorCat.Locate('apodo',IBQAux.FieldValues['apodo'],[]) then
        Caption := IntToStr(IBQTotalPorCat.FieldValues['suma'])
      else
        Caption := '';
    end;
    NextLF := NextLF + ColWidth;
    IBQAux.Next;
  end;

  with (TQRLabel(F.QRBDetailPlanilla.AddPrintable(TQRLabel))) do
  begin
    AutoSize := false;
    Alignment := taCenter;
    WordWrap := false;
    Top := NextTop;
    Left := NextLF;
    Width := ColWidth;
    Transparent := true;
    Height := 17;
    Font.Name := 'Arial';
    Font.Style := [fsBold];
    Frame.DrawLeft := true;
    Caption := IntToStr(Total);
  end;

  with (TQRShape(F.QRBDetailPlanilla.AddPrintable(TQRShape))) do
  begin
    Shape := qrsHorLine;
    Width := F.QRBDetailPlanilla.Width;
    Left := 0;
    Top := NextTopS;
    Height := 7;
  end;

end;

procedure TFREPExistenciaRodeoPotrero.RGTipoClick(Sender: TObject);
begin
  inherited;
   LimpiarAux();
   //FrameRodeoPotreroBBEliminarTodosClick(nil);
   //AImprimirReporte.Enabled:= false;
   LPreview.Enabled := false;
   IPreview.Enabled := false; 
   if (TRadioGroup(Sender).ItemIndex = 0) then  //potreros
    begin
//      BDBGExistenciaRodeoPotrero.Columns[0].Title.Caption:= 'Potrero';
//      DTXLS.Columns[0].Title:= 'Potrero';
//      DTXLS.Title.Text:= 'Existencia Potrero';
        CargarCategorias;
        FiltrarPotreroRodeo;
    end
   else
     if (TRadioGroup(Sender).ItemIndex = 1) then //rodeos
      begin
//        BDBGExistenciaRodeoPotrero.Columns[0].Title.Caption:= 'Rodeo';
//        DTXLS.Columns[0].Title:= 'Rodeo';
//        DTXLS.Title.Text:= 'Existencia Rodeo';
          CargarCategorias;
          FiltrarPotreroRodeo;
      end;
//  actualizarFiltro;
end;

procedure TFREPExistenciaRodeoPotrero.IBQExistRodeoPotreroAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  IBQExistRodeoPotrero.Last;
  IBQExistRodeoPotrero.First;
  if (RgTipo.ItemIndex = 0) then  //potreros
    GBExistRodeoPotrero.Caption := Traducir('Potreros [')+IntToStr(IBQExistRodeoPotrero.RecordCount)+']'
   else
     if (RgTipo.ItemIndex = 1) then  //rodeos
      GBExistRodeoPotrero.Caption := Traducir('Rodeos [')+IntToStr(IBQExistRodeoPotrero.RecordCount)+']';
end;

procedure TFREPExistenciaRodeoPotrero.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFREPExistenciaRodeoPotrero.AImprimirReporteExecute(
  Sender: TObject);
var cont : integer;
    paramName : string;
    cartel: TCartel;
    msje: String;
    F : TFRepExistenciaRodeoPotreroPreview;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando Reporte de Existencia ...';
  cartel.abrircartel(msje);
  inherited;
  F := TFRepExistenciaRodeoPotreroPreview.Create(self);
  
  //actualizarFiltro;
  CargarCategorias;
  ArmarTablas(F);

  if (RGTipo.ItemIndex = 0) then
    begin
      //F.QRLTipo.Caption := Traducir('Potrero: ');
      //F.QRLRodeoPotrero.Caption := Traducir('Potrero');
      F.QRLabel4.Caption := Traducir('Existencia Potrero');
    end
   else
    if (RGTipo.ItemIndex = 1) then //rodeos
      begin
        //F.QRLTipo.Caption := Traducir('Rodeo: ');
        //F.QRLRodeoPotrero.Caption := Traducir('Rodeo');
        F.QRLabel4.Caption := Traducir('Existencia Rodeo');
      end;

  cartel.cerrarcartel();
  cartel.FreeInstance();
  F.ShowModal;
  HabilitarDesabilitarControles();
end;

procedure TFREPExistenciaRodeoPotrero.FormShow(Sender: TObject);
begin
  inherited;
  RGTipo.ItemIndex:= 1;
  RGTipoClick(self);
  actualizarBotones;
end;

procedure TFREPExistenciaRodeoPotrero.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPExistenciaRodeoPotrero.FormCreate(Sender: TObject);
begin
  inherited;
  CargarCategorias;
  FiltrarPotreroRodeo();
end;

procedure TFREPExistenciaRodeoPotrero.FrameRodeoPotreroIBQDisponiblesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameRodeoPotrero.IBQDisponibles.ParamByName('IDAUXPE').AsInteger := FIDAuxDisp;
end;

procedure TFREPExistenciaRodeoPotrero.LlenarRodeosPotreros();
begin
  IBDSPotrerosRodeos.Open;
  IBQRodeosPotreros.First;
  while (not IBQRodeosPotreros.Eof) do
  begin
    IBDSPotrerosRodeos.Insert;
    IBDSPotrerosRodeos.FieldByName('ID_AUX').Value := FIDAuxDisp;
    if (RGTipo.ItemIndex = 0) then  //potreros
     begin
       IBDSPotrerosRodeos.FieldByName('ID_ANIMAL').Value := IBQRodeosPotreros.fieldByName('ID_POTRERO').AsInteger;
       IBDSPotrerosRodeos.FieldByName('NOMBRE').Value := IBQRodeosPotreros.fieldByName('NOMBRE').AsString;
       IBDSPotrerosRodeos.FieldByName('RAZA').Value := IBQRodeosPotreros.fieldByName('HECTAREAS').AsInteger;
     end
    else
      if (RGTipo.ItemIndex = 1) then //rodeos
       begin
         IBDSPotrerosRodeos.FieldByName('ID_ANIMAL').Value := IBQRodeosPotreros.fieldByName('ID_RODEO').AsInteger;
         IBDSPotrerosRodeos.FieldByName('NOMBRE').Value := IBQRodeosPotreros.fieldByName('NOMBRE').AsString;
         IBDSPotrerosRodeos.FieldByName('RAZA').Value := IBQRodeosPotreros.fieldByName('ESTABLECIMIENTO').AsInteger;
       end;
    IBQRodeosPotreros.Next;
  end;
  IBDSPotrerosRodeos.Database.ApplyUpdates([IBDSPotrerosRodeos]);
end;

procedure TFREPExistenciaRodeoPotrero.IBQRodeosPotrerosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  LlenarRodeosPotreros(); 
end;

procedure TFREPExistenciaRodeoPotrero.IBDSPotrerosRodeosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFREPExistenciaRodeoPotrero.SeleccionarUnPotrero(Sender : TObject);
begin
  FrameRodeoPotrero.IBQSeleccionados.Insert;
  if (RGTipo.ItemIndex = 0) then  //potreros
   begin
      FrameRodeoPotrero.IBQSeleccionados.FieldByName('ID_AUX').Value := FIDAuxDisp;
      FrameRodeoPotrero.IBQSeleccionados.FieldByName('ID_ANIMAL_EXTERNO').Value := FrameRodeoPotrero.IBQDisponibles.FieldByName('ID').AsInteger;
      FrameRodeoPotrero.IBQSeleccionados.FieldByName('NOMBRE').Value := FrameRodeoPotrero.IBQDisponibles.FieldByName('NOMBRE').AsString;
      FrameRodeoPotrero.IBQSeleccionados.FieldByName('RAZA').Value := FrameRodeoPotrero.IBQDisponibles.FieldByName('RAZA').AsString;
   end
  else
    if (RGTipo.ItemIndex = 1) then //rodeos
     begin
        FrameRodeoPotrero.IBQSeleccionados.FieldByName('ID_AUX').Value := FIDAuxDisp;
        FrameRodeoPotrero.IBQSeleccionados.FieldByName('ID_ANIMAL_EXTERNO').Value := FrameRodeoPotrero.IBQDisponibles.FieldByName('ID').AsInteger;
        FrameRodeoPotrero.IBQSeleccionados.FieldByName('NOMBRE').Value := FrameRodeoPotrero.IBQDisponibles.FieldByName('NOMBRE').AsString;
        FrameRodeoPotrero.IBQSeleccionados.FieldByName('RAZA').Value := FrameRodeoPotrero.IBQDisponibles.FieldByName('RAZA').AsString;
     end;
end;

procedure TFREPExistenciaRodeoPotrero.FrameRodeoPotreroIBQSeleccionadosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameRodeoPotrero.IBQSeleccionados.ParamByName('ID_AUX').Value := FIDAuxDisp;
end;

procedure TFREPExistenciaRodeoPotrero.FrameRodeoPotreroBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameRodeoPotrero.OnSelectItem := SeleccionarUnPotrero;
  FrameRodeoPotrero.BBAgregarTodosClick(Sender);
  actualizarBotones();
  ActualizarCantidad();
end;

procedure TFREPExistenciaRodeoPotrero.ActualizarCantidad();
begin
  FrameRodeoPotrero.IBQDisponibles.Last;
  FrameRodeoPotrero.IBQDisponibles.First;
  FrameRodeoPotrero.GBDisponibles.Caption := Traducir(' Disponibles [')+IntToStr(FrameRodeoPotrero.IBQDisponibles.RecordCount)+'] ';
  FrameRodeoPotrero.IBQSeleccionados.Last;
  FrameRodeoPotrero.IBQSeleccionados.First;
  FrameRodeoPotrero.GBSeleccionados.Caption := Traducir(' Seleccionados [')+IntToStr(FrameRodeoPotrero.IBQSeleccionados.RecordCount)+'] ';
end;

procedure TFREPExistenciaRodeoPotrero.FrameRodeoPotreroBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameRodeoPotrero.OnSelectItem := SeleccionarUnPotrero;
  FrameRodeoPotrero.BBAgregarUnoClick(Sender);
  actualizarBotones;
  ActualizarCantidad();
end;

procedure TFREPExistenciaRodeoPotrero.FrameRodeoPotreroBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameRodeoPotrero.BBEliminarUnoClick(Sender);
  if (FrameRodeoPotrero.DSSeleccionados.DataSet.IsEmpty) then
  begin
    actualizarBotones;
  end;
  ActualizarCantidad();
end;

procedure TFREPExistenciaRodeoPotrero.FrameRodeoPotreroBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameRodeoPotrero.BBEliminarTodosClick(Sender);
  actualizarBotones; 
  ActualizarCantidad();
end;

procedure TFREPExistenciaRodeoPotrero.FrameRodeoPotreroIBQDisponiblesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  ActualizarCantidad();
end;

procedure TFREPExistenciaRodeoPotrero.FiltrarPotreroRodeo;
begin
  IBQGenIDPotrerosRodeosDisp.Close;
  IBQGenIDPotrerosRodeosDisp.Open;

  IBDSPotrerosRodeos.Open;

  FIDAuxDisp := IBQGenIDPotrerosRodeosDisp.FieldValues['IDAUX'];


  IBQRodeosPotreros.Active := false;
  IBQRodeosPotreros.SQL.Clear;

   if (RGTipo.ItemIndex = 0) then  //potreros
    begin
      IBQRodeosPotreros.SQL.Add('select id_potrero,nombre,hectareas from tab_potreros where (establecimiento = :esta)');
      IBQRodeosPotreros.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
      IBQRodeosPotreros.Active := true;
    end
   else
     if (RGTipo.ItemIndex = 1) then //rodeos
      begin
        IBQRodeosPotreros.SQL.Add('select * from tab_rodeos where (establecimiento = :esta)');
        IBQRodeosPotreros.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
        IBQRodeosPotreros.Active := true;
      end;

  FrameRodeoPotrero.ActualizarLosQuery;
  FrameRodeoPotrero.ControlarBotones;
  //FrameRodeoPotrero.BDBGDisponibles.SelectedRows.Clear;
  FrameRodeoPotrero.ControlarBotones;
end;

procedure TFREPExistenciaRodeoPotrero.LimpiarAux;
begin
  IBQLimpiarAux.Active := true;
  IBQLimpiarAux.Active := false;
  IBQLimpiarAuxExternos.Active := true;
  IBQLimpiarAuxExternos.Active := false;
end;

procedure TFREPExistenciaRodeoPotrero.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LimpiarAux();
end;

end.
