unit UREPInformePesadas;

interface
                                   
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, UFrameMangazo,
  UFrameDBSeleccion, Buttons, UPrincipal, IBQuery, DateTimePickerAuto, UDMSoftvet,
  DBCtrls, UDBLookupComboBoxAuto, UREPInformePesadasPreview, AppEvnts, UMensajeImpresora,
  DateUtils, PngImage, jpeg, JvGIF, JvExControls, JvLabel, ImgList, UMensajeHuella,
  PngImageList, JvExExtCtrls, JvImage;

type
  TFREPInformePesadas = class(TFUniversal)
    FrameAnimales: TFrameSeleccion;
    GBBusqueda: TGroupBox;
    IBQGenIDAnimalesDisp: TIBQuery;
    IBQLimpiarAux: TIBQuery;
    RGTipoSeleccion: TRadioGroup;
    GBGrupo: TGroupBox;
    DBLCBAGrupos: TDBLookupComboBoxAuto;
    GBFecha: TGroupBox;
    DTPAHasta: TDateTimePickerAuto;
    Label4: TLabel;
    DTPADesde: TDateTimePickerAuto;
    Label3: TLabel;
    GBFiltros: TGroupBox;
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
    GroupBox1: TGroupBox;
    DBLCBAPotreros: TDBLookupComboBoxAuto;
    CBPotreros: TCheckBox;
    GroupBox2: TGroupBox;
    DBLCBACategorias: TDBLookupComboBoxAuto;
    CBCategoria: TCheckBox;
    GroupBox3: TGroupBox;
    EHasta: TEdit;
    Label2: TLabel;
    EDesde: TEdit;
    Label1: TLabel;
    CBEdad: TCheckBox;
    GroupBox4: TGroupBox;
    EPesoHasta: TEdit;
    Label6: TLabel;
    EPesoDesde: TEdit;
    Label5: TLabel;
    CBPeso: TCheckBox;
    GroupBox5: TGroupBox;
    CBUltimas2: TCheckBox;
    GroupBox6: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    PExportarSeleccion: TPanel;
    Image1: TImage;
    IRepPedigree: TImage;
    IRepIndividual: TImage;
    LRepPedigree: TJvLabel;
    LRepIndividual: TJvLabel;
    procedure FormCreate(Sender: TObject);
    procedure SeleccionarUnAnimal(Sender : TObject);
    procedure FrameAnimalesBBAgregarTodosClick(Sender: TObject);
    procedure FrameAnimalesBBAgregarUnoClick(Sender: TObject);
    procedure FrameAnimalesBBEliminarUnoClick(Sender: TObject);
    procedure FrameAnimalesBBEliminarTodosClick(Sender: TObject);
    procedure FrameAnimalesIBQDisponiblesBeforeOpen(DataSet: TDataSet);
    procedure FrameAnimalesIBQSeleccionadosBeforeOpen(DataSet: TDataSet);
    procedure CBPotrerosClick(Sender: TObject);
    procedure DBLCBAPotrerosCloseUp(Sender: TObject);
    procedure CBCategoriaClick(Sender: TObject);
    procedure DBLCBACategoriasCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBSalirClick(Sender: TObject);
    procedure CBEdadClick(Sender: TObject);
    procedure DBLCBAGruposCloseUp(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure FrameAnimalesIBQSeleccionadosAfterOpen(DataSet: TDataSet);
    procedure FrameAnimalesIBQDisponiblesAfterOpen(DataSet: TDataSet);
    procedure FrameAnimalesBDBGDisponiblesDblClick(Sender: TObject);
    procedure FrameAnimalesBDBGSeleccionadosDblClick(Sender: TObject);
    procedure EDesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EHastaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FrameAnimalesBDBGDisponiblesKeyPress(Sender: TObject;
      var Key: Char);
    procedure FrameAnimalesBDBGSeleccionadosKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBPesoClick(Sender: TObject);
    procedure EPesoDesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPesoHastaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FrameAnimalesIBQDisponiblesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure RGTipoSeleccionClick(Sender: TObject);
    procedure DTPADesdeCloseUp(Sender: TObject);
    procedure DTPAHastaCloseUp(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTPAHastaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
    procedure LRepPedigreeClick(Sender: TObject);
    procedure LRepIndividualClick(Sender: TObject);
    procedure CrearInformeExcel;
    procedure CargarResultados(FREPInformePesadasPreview: TFREPInformePesadasPreview );
    
  private
    FIdAnimal : Integer;
    procedure Ejecutar();
    procedure ActualizarCantidad();
    procedure setBotonesReportAndExcel(enabled: boolean);

  public
    { Public declarations }
  end;

var
  FREPInformePesadas: TFREPInformePesadas;
  SQLGenerico,SQLCabeza, SQLCuerpo, SQLCola: String;
  Parametros : Array [0..5] of boolean = (false,false,false,false,false,false); //potrero, grupo, categoria, edad, fecha, peso
  valEdad1, valEdad2, valPotrero, valGrupo, valCategoria : Integer;
  valFecha1, valFecha2 : Variant;
  valPesoD, valPesoH: Double;
  filtroPesoAct, filtroEdadAct : boolean;
implementation

uses UREPFichaAnimal, UCartel, UTraduccion;

{$R *.dfm}

procedure TFREPInformePesadas.FormCreate(Sender: TObject);
var cartel: TCartel;
    msje: String;
    i: Integer;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Cargando Informe de Pesadas ...';
  cartel.abrircartel(msje);

  DTPADesde.Date := IncYear(Date(),-1);
  DTPAHasta.Date := Date();
  valFecha1 := DTPADesde.Date;
  valFecha2 := DTPAHasta.Date;
  inherited;
  IBQGenIDAnimalesDisp.Close;
  IBQGenIDAnimalesDisp.Open;

  valEdad1 := 0;
  valEdad2 := 30;
  valPesoD := 0;
  valPesoH := 200;

  FIdAnimal := IBQGenIDAnimalesDisp.FieldValues['IDAUX'];

  DMSoftvet.IBQPotrero.Active := false;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Active := true;

  DMSoftvet.IBQGrupos.Active := false;
  DMSoftvet.IBQGrupos.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQGrupos.Active := true;
  DMSoftvet.IBQGrupos.First;
  if (DBLCBAGrupos.KeyValue = NULL) then
    DBLCBAGrupos.KeyValue := DMSoftvet.IBQGrupos.FieldValues['ID_GRUPO'];

  DMSoftvet.IBQCategorias.Active := true;

//  SQLGenerico:= 'select DISTINCT ANIMAL AS ID, IDRP AS RP, NOMBREANIMAL AS NOMBRE, CATEGORIA, POTRERO, EDAD, PESO ' +
//                ' from REP_INFO_PESADAS_MANGA(:ESTABLECIMIENTO,:IDAUXPE,:GRUPO, :FECHADESDE, :FECHAHASTA) A WHERE 1=1';

  SQLGenerico:= 'select DISTINCT ANIMAL AS ID, IDRP AS RP, NOMBREANIMAL AS NOMBRE, CATEGORIA, POTRERO, EDAD, PESO ' +
                ' from REP_INFO_PESADAS_MANGA(:ESTABLECIMIENTO,:IDAUXPE,:GRUPO, :FECHADESDE, :FECHAHASTA) ';

  FrameAnimales.IBQDisponibles.SQL.Clear;
  FrameAnimales.IBQDisponibles.SQL.Add(SQLGenerico);

  FrameAnimales.ActualizarLosQuery;
  FrameAnimales.ControlarBotones;
  FrameAnimales.BDBGDisponibles.SelectedRows.Clear;
  FrameAnimales.ControlarBotones;
  for i:= 0 to length(Parametros) do
    Parametros[i]:= false;

  setBotonesReportAndExcel(false);

  cartel.cerrarcartel();
  cartel.FreeInstance();

  RGTipoSeleccionClick(nil);

  filtroPesoAct := false;
  filtroEdadAct := false;
end;

procedure TFREPInformePesadas.SeleccionarUnAnimal(Sender : TObject);
begin
  FrameAnimales.IBQSeleccionados.Insert;
  FrameAnimales.IBQSeleccionados.FieldByName('ID_AUX').Value := FIdAnimal;
  FrameAnimales.IBQSeleccionados.FieldByName('ID_ANIMAL').Value := FrameAnimales.IBQDisponibles.fieldByName('ID').AsInteger;
  FrameAnimales.IBQSeleccionados.FieldByName('ID_RP').Value := FrameAnimales.IBQDisponibles.fieldByName('RP').AsString;
  FrameAnimales.IBQSeleccionados.FieldByName('NOMBRE').Value := FrameAnimales.IBQDisponibles.fieldByName('NOMBRE').AsString;
end;

procedure TFREPInformePesadas.FrameAnimalesBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FrameAnimales.OnSelectItem := SeleccionarUnAnimal;
  FrameAnimales.BBAgregarTodosClick(Sender);

  setBotonesReportAndExcel(true);
  ActualizarCantidad();
end;

procedure TFREPInformePesadas.FrameAnimalesBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FrameAnimales.OnSelectItem := SeleccionarUnAnimal;
  FrameAnimales.BBAgregarUnoClick(Sender);
  setBotonesReportAndExcel(true);

  ActualizarCantidad();
end;

procedure TFREPInformePesadas.FrameAnimalesBBEliminarUnoClick(
  Sender: TObject);
var
  enabled: boolean;
begin
  inherited;
  FrameAnimales.BBEliminarUnoClick(Sender);
  enabled := not FrameAnimales.DSSeleccionados.DataSet.IsEmpty;
  setBotonesReportAndExcel(enabled);

  ActualizarCantidad();
end;

procedure TFREPInformePesadas.FrameAnimalesBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  setBotonesReportAndExcel(false);

  FrameAnimales.BBEliminarTodosClick(Sender);
  ActualizarCantidad();
end;

procedure TFREPInformePesadas.FrameAnimalesIBQDisponiblesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameAnimales.IBQDisponibles.ParamByName('IDAUXPE').AsInteger := FIdAnimal;
  FrameAnimales.IBQDisponibles.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
end;

procedure TFREPInformePesadas.FrameAnimalesIBQSeleccionadosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  FrameAnimales.IBQSeleccionados.ParamByName('ID_AUX').AsInteger := FIdAnimal;
end;

procedure TFREPInformePesadas.CBPotrerosClick(Sender: TObject);
begin
  inherited;
  DBLCBAPotreros.Enabled := CBPotreros.Checked;
  if (CBPotreros.Checked) then
  begin
//    SQLGenerico := SQLGenerico+' and A.POTRERO=:potrero';
    if (AnsiPos('where',SQLGenerico) <> 0) then
        SQLGenerico := SQLGenerico+' and POTRERO = :potrero'
    else
        SQLGenerico := SQLGenerico+' where POTRERO = :potrero';

    DBLCBAPotreros.Enabled := true;
    Parametros[0] := true;
    DBLCBAPotreros.KeyValue:= 0;
    DBLCBAPotrerosCloseUp(nil);
  end
  else
  begin
//    SQLGenerico := StringReplace(SQLGenerico,' and A.POTRERO=:potrero','',[rfIgnoreCase]);
    if (AnsiPos('where',SQLGenerico) <> 0) then
      if (AnsiPos('and',SQLGenerico) <> 0) then
      begin
        SQLGenerico := StringReplace(SQLGenerico,' POTRERO = :potrero and','',[rfIgnoreCase]);
        SQLGenerico := StringReplace(SQLGenerico,' and POTRERO = :potrero','',[rfIgnoreCase]);
      end
      else
        SQLGenerico := StringReplace(SQLGenerico,' where POTRERO = :potrero','',[rfIgnoreCase])
    else
      SQLGenerico := StringReplace(SQLGenerico,' and POTRERO = :potrero','',[rfIgnoreCase]);

    DBLCBAPotreros.Enabled := false;
    Parametros[0] := false;
  //  Ejecutar();
  end;
end;

procedure TFREPInformePesadas.DBLCBAPotrerosCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBAPotreros.KeyValue <> Null) then
    begin
      valPotrero := DBLCBAPotreros.KeyValue;
     // Ejecutar();
    end;
end;

procedure TFREPInformePesadas.CBCategoriaClick(Sender: TObject);
begin
  inherited;
  DBLCBACategorias.Enabled := CBCategoria.Checked;
  if (CBCategoria.Checked) then
  begin
//    SQLGenerico := SQLGenerico+' and A.CATEGORIA=:categoria';
    if (AnsiPos('where',SQLGenerico) <> 0) then
        SQLGenerico := SQLGenerico+' and CATEGORIA = :categoria'
    else
        SQLGenerico := SQLGenerico+' where CATEGORIA = :categoria';

    DBLCBACategorias.Enabled := true;
    Parametros[2] := true;
    DBLCBACategorias.KeyValue:= 1;
    DBLCBACategoriasCloseUp(nil);
  end
  else
  begin
//    SQLGenerico := StringReplace(SQLGenerico,' and A.CATEGORIA=:categoria','',[rfIgnoreCase]);
    SQLGenerico := StringReplace(SQLGenerico,' and CATEGORIA = :categoria','',[rfIgnoreCase]);
    SQLGenerico := StringReplace(SQLGenerico,' where CATEGORIA = :categoria','',[rfIgnoreCase]);
    DBLCBACategorias.Enabled := false;
    Parametros[2] := false;
//    Ejecutar();
  end;
end;

procedure TFREPInformePesadas.DBLCBACategoriasCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBACategorias.KeyValue <> Null) then
    begin
      valCategoria := DBLCBACategorias.KeyValue;
 //     Ejecutar();
    end;
end;

procedure TFREPInformePesadas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IBQLimpiarAux.Active := true;
  IBQLimpiarAux.Active := false;
end;

procedure TFREPInformePesadas.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFREPInformePesadas.CBEdadClick(Sender: TObject);
begin
  inherited;
  Label1.Enabled := CBEdad.Checked;
  Label2.Enabled := CBEdad.Checked;
  EDesde.Enabled := CBEdad.Checked;
  EHasta.Enabled := CBEdad.Checked;
  if (CBEdad.Checked) then
  begin
    filtroEdadAct := true;
    EDesde.Enabled := true;
    EHasta.Enabled := true;
    Parametros[3] := true;
    EDesde.SetFocus;
//    Ejecutar();
  end
  else
  begin
    filtroEdadAct := false;
    EDesde.Enabled := false;
    EHasta.Enabled := false;
    Parametros[3] := false;
 //   Ejecutar();
  end;
end;

procedure TFREPInformePesadas.Ejecutar();
var cartel: TCartel;
    msje, aux: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Cargando Informe de Pesadas ...';
  cartel.abrircartel(msje);

//  FrameAnimales.IBQDisponibles.Active := false;

  FrameAnimales.IBQDisponibles.Close;
  FrameAnimales.IBQDisponibles.SQL.Clear;
  FrameAnimales.IBQDisponibles.Params.Clear;
  FrameAnimales.IBQDisponibles.SQL.Add(SQLGenerico);

  if (filtroPesoAct) then
  begin
    if (AnsiPos('where',SQLGenerico) <> 0) then
    begin
         aux := ' and ((peso >= :pesoDesde) and (peso <= :pesoHasta))';
         FrameAnimales.IBQDisponibles.SQL.Add(aux);
         FrameAnimales.IBQDisponibles.ParamByName('pesoDesde').AsFloat := valPesoD;
         FrameAnimales.IBQDisponibles.ParamByName('pesoHasta').AsFloat := valPesoH;
    end
    else
    begin
         aux := ' where ((peso >= :pesoDesde) and (peso <= :pesoHasta))';
         FrameAnimales.IBQDisponibles.SQL.Add(aux);
         FrameAnimales.IBQDisponibles.ParamByName('pesoDesde').AsFloat := valPesoD;
         FrameAnimales.IBQDisponibles.ParamByName('pesoHasta').AsFloat := valPesoH;
    end;
  end;

  if (filtroEdadAct) then
  begin
    if (AnsiPos('where',SQLGenerico) <> 0) then
    begin
         aux := ' and ((edad >= :edadDesde) and (edad <= :edadHasta))';
         FrameAnimales.IBQDisponibles.SQL.Add(aux);
         FrameAnimales.IBQDisponibles.ParamByName('edadDesde').AsInteger := valEdad1;
         FrameAnimales.IBQDisponibles.ParamByName('edadHasta').AsInteger := valEdad2;
    end
    else
    begin
         aux := ' where ((edad >= :edadDesde) and (edad <= :edadHasta))';
         FrameAnimales.IBQDisponibles.SQL.Add(aux);
         FrameAnimales.IBQDisponibles.ParamByName('edadDesde').AsInteger := valEdad1;
         FrameAnimales.IBQDisponibles.ParamByName('edadHasta').AsInteger := valEdad2;
    end;
  end;

  if (Parametros[0]) then
    FrameAnimales.IBQDisponibles.ParamByName('potrero').AsInteger := valPotrero;

  if (Parametros[1]) then
    FrameAnimales.IBQDisponibles.ParamByName('grupo').AsInteger := valGrupo
  else
    FrameAnimales.IBQDisponibles.ParamByName('grupo').Value := null;

  if (Parametros[2]) then
    FrameAnimales.IBQDisponibles.ParamByName('categoria').AsInteger := valCategoria;

  if (Parametros[4]) then
  begin
    FrameAnimales.IBQDisponibles.ParamByName('FechaDesde').AsDate := valFecha1;
    FrameAnimales.IBQDisponibles.ParamByName('FechaHasta').AsDate := valFecha2;
  end
  else
  begin
    FrameAnimales.IBQDisponibles.ParamByName('FechaDesde').Value := null;
    FrameAnimales.IBQDisponibles.ParamByName('FechaHasta').Value := null;
  end;
  
  FrameAnimales.ControlarBotones;
  FrameAnimales.BDBGDisponibles.SelectedRows.Clear;
  FrameAnimales.ControlarBotones;
  FrameAnimales.IBQDisponibles.Open;
//  FrameAnimales.IBQDisponibles.Active := true;

  ActualizarCantidad;

  cartel.cerrarcartel();
  cartel.FreeInstance();   
end;

procedure TFREPInformePesadas.DBLCBAGruposCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBAGrupos.KeyValue <> Null) then
    begin
      valGrupo := DBLCBAGrupos.KeyValue;
 //     Ejecutar();
    end;
end;

procedure TFREPInformePesadas.BBImprimirReporteClick(Sender: TObject);
var
  cartel : TCartel;
begin
  MostrarMensajeImpresion();
  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando Informe de Pesadas...');
  inherited;
  HabilitarDesabilitarControles();
  Application.CreateForm(TFREPInformePesadasPreview,FREPInformePesadasPreview);
  FREPinformePesadasPreview.ultimas_2 := CBUltimas2.Checked;
  if RGTipoSeleccion.ItemIndex = 0 then
  begin
    FREPInformePesadasPreview.Desde := valFecha1;
    FREPInformePesadasPreview.Hasta := valFecha2;
  end
  else
  begin
    FREPInformePesadasPreview.Desde := null;
    FREPInformePesadasPreview.Hasta := null;
  end;
  cartel.cerrarcartel;
  cartel.FreeInstance;

  FREPInformePesadasPreview.iniciarCalculos;
  FREPInformePesadasPreview.ShowModal;
  FREPInformePesadasPreview.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFREPInformePesadas.BBXlsClick(Sender: TObject);
begin
  inherited;
  PExportarSeleccion.Visible := true;
{  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);}
end;

procedure TFREPInformePesadas.FrameAnimalesIBQSeleccionadosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  BBXLs.Enabled := not(DataSet.IsEmpty);
end;

procedure TFREPInformePesadas.ActualizarCantidad();
begin
  FrameAnimales.IBQDisponibles.First;
  FrameAnimales.IBQDisponibles.Last;
  FrameAnimales.GBDisponibles.Caption := Traducir(' Disponibles [')+IntToStr(FrameAnimales.IBQDisponibles.RecordCount)+'] ';
  FrameAnimales.IBQSeleccionados.First;
  FrameAnimales.IBQSeleccionados.Last;
  FrameAnimales.GBSeleccionados.Caption := Traducir(' Seleccionados [')+IntToStr(FrameAnimales.IBQSeleccionados.RecordCount)+'] ';
  FrameAnimales.IBQDisponibles.First;
  FrameAnimales.IBQSeleccionados.First;
end;

procedure TFREPInformePesadas.FrameAnimalesIBQDisponiblesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  ActualizarCantidad();
end;

procedure TFREPInformePesadas.FrameAnimalesBDBGDisponiblesDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if FrameAnimales.BDBGDisponibles.SelectedIndex = 0 then
    if not(FrameAnimales.IBQDisponibles.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := FrameAnimales.IBQDisponibles.fieldByName('ID').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPInformePesadas.FrameAnimalesBDBGSeleccionadosDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if FrameAnimales.BDBGSeleccionados.SelectedIndex = 0 then
    if not(FrameAnimales.IBQSeleccionados.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := FrameAnimales.IBQSeleccionados.fieldByName('ID_ANIMAL').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPInformePesadas.EDesdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
    valEdad1 := StrToInt(EDesde.Text);
  except
    begin
      valEdad1 := 0;
      EDesde.SetFocus;
    end;
  end;
//  Ejecutar();
end;

procedure TFREPInformePesadas.EHastaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    try
      valEdad2 := StrToInt(EHasta.Text);
    except
      begin
        valEdad2 := 30;
        EHasta.SetFocus;
      end;
    end;
  //  Ejecutar();
end;

procedure TFREPInformePesadas.FrameAnimalesBDBGDisponiblesKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (key=#13) then
    FrameAnimalesBDBGDisponiblesDblClick(nil);
end;

procedure TFREPInformePesadas.FrameAnimalesBDBGSeleccionadosKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (key=#13) then
    FrameAnimalesBDBGSeleccionadosDblClick(nil);
end;

procedure TFREPInformePesadas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if HiWord(GetKeyState(VK_MENU)) <> 0 then
    Key:=Word(#0);

end;

procedure TFREPInformePesadas.CBPesoClick(Sender: TObject);
begin
  inherited;
  Label5.Enabled := CBPeso.Checked;
  Label6.Enabled := CBPeso.Checked;
  EPesoDesde.Enabled := CBPeso.Checked;
  EPesoHasta.Enabled := CBPeso.Checked;
  if (CBPeso.Checked) then
  begin
    filtroPesoAct := true;
    Parametros[5] := true;
    EPesoDesde.Enabled := true;
    EPesoHasta.Enabled := true;
    EPesoDesde.SetFocus;
//    Ejecutar();
  end
  else
  begin
    filtroPesoAct := false;
    Parametros[5] := false;
    EPesoDesde.Enabled := false;
    EPesoHasta.Enabled := false;
//    Ejecutar();
  end;
end;

procedure TFREPInformePesadas.EPesoDesdeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  try
    valPesoD := StrToFloat(EPesoDesde.Text);
  except
    begin
      valPesoD := 0;
      EPesoDesde.SetFocus;
    end;
  end;
 // Ejecutar();
end;

procedure TFREPInformePesadas.EPesoHastaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  try
    valPesoH := StrToFloat(EPesoHasta.Text);
  except
    begin
      valPesoH := 0;
      EPesoHasta.SetFocus;
    end;
  end;
//  Ejecutar();
end;

procedure TFREPInformePesadas.FrameAnimalesIBQDisponiblesFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if CBEdad.Checked then
    Accept := (DataSet.FieldByName('EDAD').AsInteger >= valEdad1) and (DataSet.FieldByName('EDAD').AsInteger <= valEdad2);
  if CBPeso.Checked then
    Accept := (DataSet.FieldByName('PESO').AsFloat >= valPesoD) and (DataSet.FieldByName('PESO').AsFloat <= valPesoH);
end;

procedure TFREPInformePesadas.RGTipoSeleccionClick(Sender: TObject);
begin
  inherited;
  Label3.Enabled := RGTipoSeleccion.ItemIndex = 0;
  Label4.Enabled := RGTipoSeleccion.ItemIndex = 0;
  DTPADesde.Enabled := RGTipoSeleccion.ItemIndex = 0;
  DTPAHasta.Enabled := RGTipoSeleccion.ItemIndex = 0;
  DBLCBAGrupos.Enabled := RGTipoSeleccion.ItemIndex = 1;
  if RGTipoSeleccion.ItemIndex = 0 then
  begin
    DTPADesde.Enabled := true;
    DTPAHasta.Enabled := true;
    Parametros[4] := true;
    DTPADesdeCloseUp(nil);
    DBLCBAGrupos.Enabled := false;
    Parametros[1] := false;
  end
  else
  begin
    DTPADesde.Enabled := false;
    DTPAHasta.Enabled := false;
    Parametros[4] := false;
    DBLCBAGrupos.Enabled := true;
    Parametros[1] := true;
    DBLCBAGruposCloseUp(nil);
  end;
//  Ejecutar();
end;

procedure TFREPInformePesadas.DTPADesdeCloseUp(Sender: TObject);
begin
  inherited;
  valFecha1 := DTPADesde.Date;
//  Ejecutar();
end;

procedure TFREPInformePesadas.DTPAHastaCloseUp(Sender: TObject);
begin
  inherited;
  valFecha2 := DTPAHasta.Date;
//  Ejecutar();
end;

procedure TFREPInformePesadas.DTPADesdeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPADesdeCloseUp(Sender);
end;

procedure TFREPInformePesadas.DTPAHastaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPAHastaCloseUp(Sender);
end;

procedure TFREPInformePesadas.Button1Click(Sender: TObject);
begin
  inherited;
  Ejecutar();
end;

procedure TFREPInformePesadas.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

procedure TFREPInformePesadas.setBotonesReportAndExcel(enabled: boolean);
begin
  LPreview.Enabled := enabled;
  IPreview.Enabled := enabled;
  IExpExcel.Enabled := enabled;
  LExpExcel.Enabled := enabled;
  
  IExpExcel.Visible := enabled;
  LExpExcel.Visible := enabled;

end;

procedure TFREPInformePesadas.LRepPedigreeClick(Sender: TObject);
begin
  inherited;
  PExportarSeleccion.Visible := false;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);

end;

procedure TFREPInformePesadas.CrearInformeExcel;
var cartel: TCartel;
begin
  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando Informe de Pesadas...');
  inherited;
  HabilitarDesabilitarControles();
  Application.CreateForm(TFREPInformePesadasPreview,FREPInformePesadasPreview);
  FREPinformePesadasPreview.ultimas_2 := CBUltimas2.Checked;
  if RGTipoSeleccion.ItemIndex = 0 then
  begin
    FREPInformePesadasPreview.Desde := valFecha1;
    FREPInformePesadasPreview.Hasta := valFecha2;
  end
  else
  begin
    FREPInformePesadasPreview.Desde := null;
    FREPInformePesadasPreview.Hasta := null;
  end;
  cartel.cerrarcartel;
  cartel.FreeInstance;

  CargarResultados(FREPInformePesadasPreview);

{  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);

  FREPInformePesadasPreview.ShowModal;
  FREPInformePesadasPreview.Destroy;}
  HabilitarDesabilitarControles();
end;

procedure TFREPInformePesadas.LRepIndividualClick(Sender: TObject);
begin
  inherited;
  PExportarSeleccion.Visible := false;
  CrearInformeExcel;

end;

procedure TFREPInformePesadas.CargarResultados(FREPInformePesadasPreview: TFREPInformePesadasPreview );
var
  columna, i, animal: integer;
  pesada, j: integer;
  myFile: TextFile;
  item, fila, valor, sArchivo: string;
  saveDialog : tsavedialog;
  encabezados : array [0..23] of string;
begin
  FREPInformePesadasPreview.iniciarCalculos;
  saveDialog := TSaveDialog.Create(self);
//  saveDialog.Title := 'Save your text or word file';
  saveDialog.Filter := 'Archivo XML|*.xml';
  saveDialog.DefaultExt := 'xml';

    encabezados[0] := 'RP';
    encabezados[1] := 'CAT';
    encabezados[2] := 'F_Nac';
    encabezados[3] := 'RAZA';
    encabezados[4] := 'TIPOBAJA';

    for i := 0 to 3 do
    begin
      encabezados[i * 3 +5] := 'Fecha_'+inttostr(i);
      encabezados[i * 3 +6] := 'Peso_'+inttostr(i);
      encabezados[i * 3 +7] := 'Gdpv_'+inttostr(i);
    end;

    encabezados[17] := 'Ult_Fecha';
    encabezados[18] := 'Ult_Peso';
    encabezados[19] := 'Ult_Gdpv';

    encabezados[20] := 'Peso_inicial';
    encabezados[21] := 'Ultima_peso';
    encabezados[22] := 'Kg_Prod';
    encabezados[23] := 'Ultima_Gdpv';


  if saveDialog.Execute then
  begin
    sArchivo := saveDialog.FileName;
    AssignFile( myFile, sArchivo );
    Rewrite( myFile );

    writeln(myFile, '<?xml version="1.0" encoding="ISO-8859-1"?>');
    writeln(myFile, '<pesadas>');
    for i := 1 to FREPInformePesadasPreview.StringGrid1.RowCount do
    begin

      fila := '<pesada id="'+IntToStr(i)+'">';
      writeln(myFile, fila);

      for j := 0 to 23 do 
      begin
        item := encabezados[j];
        if (trim(item) <> '') then
        begin
          valor := FREPInformePesadasPreview.StringGrid1.Cells[j, i];
          fila := '<'+item+'>'+ valor + '</'+item+'>';
          writeln(myFile, fila);
        end;
      end;

      fila := '</pesada>';
      writeln(myFile, fila);
    end;
    writeln(myFile, '</pesadas>');

    CloseFile( myFile );
    MostrarMensaje(tmInformacion, 'Se ha generado el archivo '+sArchivo);
  end;

  saveDialog.Free;
end;

end.
