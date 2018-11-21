unit URepInfoMortandad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, IBQuery, Buttons,
  DateTimePickerAuto, ComboBoxAuto, DBCtrls, UDBLookupComboBoxAuto, Grids,
  DBGrids, UBDBGrid, TeEngine, Series, TeeProcs, Chart, DbChart, UMensajeImpresora,
  PngImage, jpeg, JvGIF, JvExControls, JvLabel, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFRepInfoMortandad = class(TFUniversal)
    Panel4: TPanel;
    GBAnimales: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    MObservaciones: TMemo;
    Panel2: TPanel;
    RGFiltros: TRadioGroup;
    GroupBox2: TGroupBox;
    CBListado: TCheckBox;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    CBACategoria: TComboBoxAuto;
    Panel1: TPanel;
    RGTipo: TRadioGroup;
    GBGrupos: TGroupBox;
    DBLCBASeleccionGrupo: TDBLookupComboBoxAuto;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    IBQDistMuerteEnfermedad: TIBQuery;
    IBQDistMuerteCategoria: TIBQuery;
    IBQInfoMortandad: TIBQuery;
    DSInfoMortandad: TDataSource;
    IBQGrupos: TIBQuery;
    DSGrupos: TDataSource;
    IBQInfoMortandadFECHA: TDateField;
    IBQInfoMortandadRP: TIBStringField;
    IBQInfoMortandadFECHANACIMIENTO: TDateField;
    IBQInfoMortandadCATEGORIA: TIBStringField;
    IBQInfoMortandadPOTRERO: TIBStringField;
    IBQInfoMortandadRODEO: TIBStringField;
    IBQInfoMortandadRESPONSABLE: TIBStringField;
    IBQInfoMortandadENFERMEDAD: TIBStringField;
    IBQInfoMortandadOBSERVACIONES: TIBStringField;
    IBQInfoMortandadTOTALMUERTOS: TIntegerField;
    DBCDistMuerteEnfermedad: TDBChart;
    PieSeries2: TPieSeries;
    IBQDistMuerteEnfermedadENFERMEDAD: TIBStringField;
    IBQDistMuerteEnfermedadCANTIDAD: TIntegerField;
    IBQInfoMortandadID_ANIMAL: TIntegerField;
    IBQDistMuerteCategoriaCATEGORIA: TIBStringField;
    IBQDistMuerteCategoriaCANTIDAD: TIntegerField;
    DBCDistMuerteCategoria: TDBChart;
    PieSeries1: TBarSeries;
    IBQExistenciaPromedioTotal: TIBQuery;
    IBQExistenciaPromedioTotalPROMEDIOEXISTENCIA: TIBBCDField;
    IBQDistMuertesMensual: TIBQuery;
    DBCDisMuertesMensual: TDBChart;
    BarSeries1: TBarSeries;
    IBQDistMuertesMensualMES: TSmallintField;
    IBQDistMuertesMensualANIO: TSmallintField;
    IBQDistMuertesMensualCANTIDAD: TIntegerField;
    IBQInfoMortandadEDADCAPTION: TIBStringField;
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
    GConsulta: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    procedure BBSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBQInfoMortandadAfterOpen(DataSet: TDataSet);
    procedure DBLCBASeleccionGrupoCloseUp(Sender: TObject);
    procedure DBLCBASeleccionGrupoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGTipoClick(Sender: TObject);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure IBQDistMuerteCategoriaAfterOpen(DataSet: TDataSet);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQDistMuertesMensualAfterOpen(DataSet: TDataSet);
    procedure FechaCloseUp(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    { Private declarations }
    Desde, Hasta : TDate;    
    TotalMuertos : Integer;
    Grupo, Rodeo, Categoria, Indice : integer;
    PorGrupo, PorCategoria, PorRodeo : Boolean;
    NomGrupo, NomCateg, NomRodeo : String;
    colores: array[1..6] of TColor;
    procedure ActualizarDistMuerteEnfermedad();
    procedure ActualizarDistMuerteCategoria();
    procedure ActualizarListado();
    procedure ActualizarConsultas();
    procedure ActualizarExistenciaPromedioTotal;
    procedure ActualizarDistMensualMuertes;    
    function GetMeses(mes : integer) : String;       
  public
    { Public declarations }
  end;

var
  FRepInfoMortandad: TFRepInfoMortandad;

implementation

uses UPrincipal,uTiposGlobales, UDMSoftvet, DateUtils, Types, UCartel, URepFichaAnimal,
     UREPInfoMortandadPreview, UTraduccion;

{$R *.dfm}

procedure TFRepInfoMortandad.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFRepInfoMortandad.FormCreate(Sender: TObject);
begin
  inherited;
  //CartelOpen := TFCartelOpenQuery.Create(self);

  IBQGrupos.Close;
  IBQGrupos.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQGrupos.Open;
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;

  DTPAHasta.DateTime := now;
  DTPADesde.DateTime := IncYear(now,-1);
  colores[1]:= clred;
  colores[2]:= clBlue;
  colores[3]:= clGreen;
  colores[4]:= clBlack;
  colores[5]:= clTeal;
  colores[6]:= clPurple;

{  colores[7]:= $009D09A2;
  colores[8]:= $00387249;
  colores[9]:= $004883E3;
  colores[10]:= $00F9DB33;
  colores[11]:= $0012CDC4;
  colores[12]:= $00807D60;}


{  CantDist := 'select count(*) as cantidad, nombre from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :grupo, :actual)';
  CantDistCond := 'select count(*) as cantidad, condicion, valorcondicion, repro, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :grupo, :actual)';
  CantDistCron := 'select count(*) as cantidad, cronologia, valorcronologia, repro, id_codigo_prenez from GET_DISTRIBUCION_PRENEZ (:esta, :desde, :hasta, :grupo, :actual)';
  Porcentaje := 'select count(*) as cantidad, nombre, servida from GET_PORCENTAJES_PRENEZ (:esta, :desde, :hasta, :grupo) ';
  Listado := 'select * from get_info_gral_gestacion(:esta,:desde,:hasta,:grupo,:actual)';

  Condicion := '';

  RCantDist := ' group by nombre';
  RCantDistCond := ' group by condicion, valorcondicion, repro, id_codigo_prenez';
  RCantDistCron := ' group by cronologia, valorcronologia, repro, id_codigo_prenez';
  RPorcentaje := ' group by repro, nombre, servida';
  RListado := ' order by rp_animal asc';
}
//  CrearSeries();
//  PorGrupo := false;
//  PorCategoria := false;
//  PorRodeo := false;
//  ArmarTablas();
//  RGTipoClick(nil);
end;

procedure TFRepInfoMortandad.ActualizarListado;
begin
{  TotalBrucN := 0;
  TotalBrucP := 0;
  TotalBrucND := 0;
  TotalBrucS := 0;}
  IBQInfoMortandad.Close;
//  IBQInfoMortandad.SQL.Clear;
//  IBQInfoMortandad.SQL.Add(Listado+Condicion+RListado);
  if (PorGrupo) then
  begin
    IBQInfoMortandad.ParamByName('grupo').AsInteger := Grupo;
    IBQInfoMortandad.ParamByName('desde').Value := null;
    IBQInfoMortandad.ParamByName('hasta').Value := null;
    IBQInfoMortandad.ParamByName('hueactual').AsDate := Date();
  end
  else
  begin
    IBQInfoMortandad.ParamByName('desde').AsDate := Desde;
    IBQInfoMortandad.ParamByName('hasta').AsDate := Hasta;
    IBQInfoMortandad.ParamByName('grupo').Value := null;
    IBQInfoMortandad.ParamByName('actual').AsDate := Date();
  end;
  IBQInfoMortandad.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
//  IBQInfoMortandad.ParamByName('actual').AsDate := Date();
  IBQInfoMortandad.Open;
end;

procedure TFRepInfoMortandad.ActualizarConsultas;
var
  cartel : TCartel;
  msje : String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando Datos de las Muertes ...';
  cartel.abrircartel(msje);

//  ActualizarPorcentajes();
//  ActualizarDistPreniez();
  ActualizarDistMuerteEnfermedad();
  ActualizarListado();
  ActualizarDistMuerteCategoria();
  ActualizarExistenciaPromedioTotal();
  ActualizarDistMensualMuertes();  
//  CargarValorDatosPorCond();
//  CargarValorDatosPorCron();
//  ArmarSeries();


  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFRepInfoMortandad.FormShow(Sender: TObject);
begin
  inherited;
  //ActualizarConsultas;
  RGTipo.ItemIndex:= 1;
  RGTipo.Visible:= false;
  GBGrupos.Visible:= false;
  RGFiltros.Visible:= false;
  DBLCBARodeos.Visible:= false;
  CBACategoria.Visible:= false;
end;

procedure TFRepInfoMortandad.ActualizarDistMuerteEnfermedad;
begin
  IBQDistMuerteEnfermedad.Close;
{  IBQDistMuerteEnfermedad.SQL.Clear;
  if Condicion = '' then
    IBQDistMuerteEnfermedad.SQL.Add(CantDist+' where nombre <> ''Vacia'' '+Condicion+RCantDist)
  else
    IBQDistMuerteEnfermedad.SQL.Add(CantDist+Condicion+' and nombre <> ''Vacia'' '+RCantDist);
}
  if (PorGrupo) then
  begin
    IBQDistMuerteEnfermedad.ParamByName('desde').Value := null;
    IBQDistMuerteEnfermedad.ParamByName('hasta').Value := null;
    IBQDistMuerteEnfermedad.ParamByName('grupo').AsInteger := Grupo;
    IBQDistMuerteEnfermedad.ParamByName('actual').AsDate := Date();
  end
  else
  begin
    IBQDistMuerteEnfermedad.ParamByName('desde').AsDate := Desde;
    IBQDistMuerteEnfermedad.ParamByName('hasta').AsDate := Hasta;
    IBQDistMuerteEnfermedad.ParamByName('grupo').Value := null;
    IBQDistMuerteEnfermedad.ParamByName('actual').AsDate := Date();
  end;
  IBQDistMuerteEnfermedad.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDistMuerteEnfermedad.Open;
end;

procedure TFRepInfoMortandad.ActualizarDistMuerteCategoria;
begin
  IBQDistMuerteCategoria.Close;
{  IBQDistMuerteCategoria.SQL.Clear;
  if Condicion = '' then
    IBQDistMuerteCategoria.SQL.Add(CantDist+' where nombre <> ''Vacia'' '+Condicion+RCantDist)
  else
    IBQDistMuerteCategoria.SQL.Add(CantDist+Condicion+' and nombre <> ''Vacia'' '+RCantDist);
}
  if (PorGrupo) then
  begin
    IBQDistMuerteCategoria.ParamByName('desde').Value := null;
    IBQDistMuerteCategoria.ParamByName('hasta').Value := null;
    IBQDistMuerteCategoria.ParamByName('grupo').AsInteger := Grupo;
    IBQDistMuerteCategoria.ParamByName('actual').AsDate := Date();
  end
  else
  begin
    IBQDistMuerteCategoria.ParamByName('desde').AsDate := Desde;
    IBQDistMuerteCategoria.ParamByName('hasta').AsDate := Hasta;
    IBQDistMuerteCategoria.ParamByName('grupo').Value := null;
    IBQDistMuerteCategoria.ParamByName('actual').AsDate := Date();
  end;
  IBQDistMuerteCategoria.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDistMuerteCategoria.Open;
end;

procedure TFRepInfoMortandad.ActualizarExistenciaPromedioTotal;
begin
  IBQExistenciaPromedioTotal.Close;
  IBQExistenciaPromedioTotal.ParamByName('desde').AsDate := Desde;
  IBQExistenciaPromedioTotal.ParamByName('hasta').AsDate := Hasta;
  IBQExistenciaPromedioTotal.ParamByName('ACTIVIDAD').Value := null;
  IBQExistenciaPromedioTotal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQExistenciaPromedioTotal.Open;
  IBQExistenciaPromedioTotal.First;
end;

procedure TFRepInfoMortandad.ActualizarDistMensualMuertes;
begin
  IBQDistMuertesMensual.Close;
  IBQDistMuertesMensual.ParamByName('desde').AsDate := Desde;
  IBQDistMuertesMensual.ParamByName('hasta').AsDate := Hasta;
  IBQDistMuertesMensual.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDistMuertesMensual.ParamByName('actual').AsDate := Date();
  IBQDistMuertesMensual.Open;
end;

procedure TFRepInfoMortandad.IBQInfoMortandadAfterOpen(DataSet: TDataSet);
begin
  inherited;
  BDBGAnimales.DataSource := DSInfoMortandad;
  {BBImprimirReporte.Enabled := not IBQInfoMortandad.IsEmpty;
  BBXls.Enabled := not IBQInfoMortandad.IsEmpty;}
  IPreview.Enabled := not IBQInfoMortandad.IsEmpty;
  LPreview.Enabled := not IBQInfoMortandad.IsEmpty;
  LExpExcel.Enabled := not IBQInfoMortandad.IsEmpty;
  IExpExcel.Enabled := not IBQInfoMortandad.IsEmpty;

  IBQInfoMortandad.First;
{  while not IBQInfoMortandad.Eof do
  begin
    if IBQInfoMortandad.FieldByName('RESULT_BRUC').Value <> null then
    begin
      if IBQInfoMortandad.FieldByName('RESULT_BRUC').AsString = 'NEGATIVO' then TotalBrucN := TotalBrucN+1;
      if IBQInfoMortandad.FieldByName('RESULT_BRUC').AsString = 'NO DEFINIDO' then TotalBrucND := TotalBrucND+1;
      if IBQInfoMortandad.FieldByName('RESULT_BRUC').AsString = 'POSITIVO' then TotalBrucP := TotalBrucP+1;
      if IBQInfoMortandad.FieldByName('RESULT_BRUC').AsString = 'SOSPECHOSO' then TotalBrucS := TotalBrucS+1;
    end;
    IBQInfoMortandad.Next;
  end;  }
  IBQInfoMortandad.Last;
  IBQInfoMortandad.First;
  GBAnimales.Caption := Traducir(' Animales [')+IntToStr(IBQInfoMortandad.RecordCount)+'] ';
  TotalMuertos := IBQInfoMortandad.RecordCount;
end;

procedure TFRepInfoMortandad.DBLCBASeleccionGrupoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBASeleccionGrupo.KeyValue <> null then
  begin
    Grupo := DBLCBASeleccionGrupo.KeyValue;
    NomGrupo := DBLCBASeleccionGrupo.Text;
  end;
end;

procedure TFRepInfoMortandad.DBLCBASeleccionGrupoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBASeleccionGrupo.ListVisible) then
   begin
      DBLCBASeleccionGrupoCloseUp(nil);
   end;
end;

procedure TFRepInfoMortandad.RGTipoClick(Sender: TObject);
begin
  inherited;
  PorGrupo := RGTipo.ItemIndex = 0;
  if PorGrupo then
  begin
    DBLCBASeleccionGrupo.Enabled := true;
    GBGrupos.Enabled := true;
    DTPADesde.Enabled := false;
    DTPAHasta.Enabled := false;
    GBSeleccionFechas.Enabled := false;
    if DBLCBASeleccionGrupo.KeyValue = null then
      Grupo := 0
    else
      Grupo := DBLCBASeleccionGrupo.KeyValue;
  end
  else
  begin
    DBLCBASeleccionGrupo.Enabled := false;
    GBGrupos.Enabled := false;
    DTPADesde.Enabled := true;
    DTPAHasta.Enabled := true;
    GBSeleccionFechas.Enabled := true;
    Desde := DTPADesde.Date;
    Hasta := DTPAHasta.Date;
  end;
end;

procedure TFRepInfoMortandad.BDBGAnimalesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (BDBGAnimales.SelectedIndex = 0) then
    if not(IBQInfoMortandad.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQInfoMortandad.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFRepInfoMortandad.IBQDistMuerteCategoriaAfterOpen(
  DataSet: TDataSet);
var porc: extended;
    col: Integer;
begin
  inherited;
  PieSeries1.Clear;
  IBQDistMuerteCategoria.First;
  col:= 1;
  while not IBQDistMuerteCategoria.Eof do
   begin
      porc:= (IBQDistMuerteCategoria.FieldByName('cantidad').AsFloat / TotalMuertos)*100;
      PieSeries1.AddBar(porc,IBQDistMuerteCategoria.FieldByName('categoria').AsString,colores[col]);
      inc(col);
      IBQDistMuerteCategoria.Next;
  end;
end;

procedure TFRepInfoMortandad.BBImprimirReporteClick(Sender: TObject);
var
  F : TFREPInfoMortandadPreview;
  cartel : TCartel;
  msje, Dir : String;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del Reporte de Mortandad ...';
  cartel.abrircartel(msje);

  Dir := ExtractFilePath(Application.ExeName);
  DBCDistMuerteEnfermedad.SaveToMetafile(Dir+'DistMuerEnfer.wmf');
  DBCDistMuerteCategoria.SaveToMetafile(Dir+'DistMuerCateg.wmf');
  DBCDisMuertesMensual.SaveToMetafile(Dir+'DistMuerMensual.wmf');
  Application.CreateForm(TFREPInfoMortandadPreview,F);
{  if (TotalBrucP+TotalBrucN+TotalBrucS+TotalBrucND) = 0 then
  begin
    F.QRBand33.Enabled := false;
    F.QRBand33.Visible := false;
  end
  else
  begin
    totalBruc := TotalBrucN+TotalBrucP+TotalBrucS+TotalBrucND;
    F.QRLResBrucN.Caption := IntToStr(TotalBrucN);
    F.QRLResBrucP.Caption := IntToStr(TotalBrucP);
    F.QRLResBrucS.Caption := IntToStr(TotalBrucS);
    F.QRLResBrucND.Caption := IntToStr(TotalBrucND);
    F.QRLPorBrucN.Caption := FormatFloat('0.0',(TotalBrucN/totalBruc)*100)+'%';
    F.QRLPorBrucND.Caption := FormatFloat('0.0',(TotalBrucND/totalBruc)*100)+'%';
    F.QRLPorBrucP.Caption := FormatFloat('0.0',(TotalBrucP/totalBruc)*100)+'%';
    F.QRLPorBrucS.Caption := FormatFloat('0.0',(TotalBrucS/totalBruc)*100)+'%';
    F.QRLResTotal.Caption := IntToStr(totalBruc);
    F.QRLPorTotal.Caption := '100%';
  end; }
  if not CBListado.Checked then
  begin
    F.QRGroup1.Enabled := false;
    F.QRBTabList.Enabled := false;
    F.QRGroup1.Visible := false;
    F.QRBTabList.Visible := false;
  end;
  F.QRLCantMuertos.Caption:= IntToStr(TotalMuertos);
  F.QRLExistencia.Caption:= FloatToStr(IBQExistenciaPromedioTotal.fieldbyname('promedioexistencia').AsFloat);
  F.QRLPromedioMortandad.Caption:= FormatFloat('0.00',((TotalMuertos/IBQExistenciaPromedioTotal.fieldbyname('promedioexistencia').AsFloat)*100));
  case RGTipo.ItemIndex of
    1 : begin
          F.QRLTitulo.Caption := Traducir('Periodo Seleccionado');
          F.QRLFecha.Enabled := true;
          F.QRLTipo.Enabled := false;
          F.Grupo.Enabled := false;
          F.Fecha.Caption := DateToStr(Desde)+'  Hasta: '+DateToStr(Hasta);
        end;
    0 : begin
          F.QRLTitulo.Caption := Traducir('Grupo Seleccionado');
          F.QRLFecha.Enabled := false;
          F.QRLTipo.Enabled := true;
          F.Grupo.Caption := NomGrupo;
          F.Fecha.Enabled := false;
        end;
  end;
  case RGFiltros.ItemIndex of
    0 : begin
          F.TipoF.Caption := Traducir('Rodeo:');
          F.Filtro.Caption := NomRodeo;
        end;
    1 : begin
          F.TipoF.Caption := Traducir('Categoria:');
          F.Filtro.Caption := NomCateg;
        end;
    2 : begin
          F.TipoF.Caption := Traducir('Todos');
          F.Filtro.Caption := '';
        end;
  end;
  F.QRLTotal.Caption := IntToStr(TotalMuertos);
  F.QRMemo.Lines.AddStrings(MObservaciones.Lines);

  cartel.cerrarcartel();
  cartel.FreeInstance();

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFRepInfoMortandad.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

function TFRepInfoMortandad.GetMeses(mes : integer) : String;
begin
  case mes of
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

procedure TFRepInfoMortandad.IBQDistMuertesMensualAfterOpen(
  DataSet: TDataSet);
var cant: integer;
    col: Integer;
    nombreMes: String;
begin
  inherited;
  BarSeries1.Clear;
  IBQDistMuertesMensual.First;
  Randomize;
  col:= 1;
  while not IBQDistMuertesMensual.Eof do
   begin
      cant:= IBQDistMuertesMensual.FieldByName('cantidad').AsInteger;
      nombreMes:= GetMeses(IBQDistMuertesMensual.FieldByName('mes').AsInteger);
      nombreMes:= nombreMes + ' de ' + IBQDistMuertesMensual.FieldByName('anio').AsString;
      BarSeries1.AddBar(cant,nombreMes,Random(16777216){colores[col]});
      inc(col);
      IBQDistMuertesMensual.Next;
  end;
end;

procedure TFRepInfoMortandad.FechaCloseUp(Sender: TObject);
var
  Fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;


  Fecha := Sender as TDateTimePickerAuto;
  if (Fecha.Name = 'DTPADesde') then
  begin
    if DaysBetween(DTPAHasta.Date,Fecha.Date)>365 then
      DTPAHasta.Date := IncYear(Fecha.Date,1)
    else if CompareDate(DTPAHasta.Date,Fecha.Date)=LessThanValue then
          DTPADesde.Date := DTPAHasta.Date;
    Desde := DTPADesde.Date;
    Hasta := DTPAHasta.Date;    
  end;

  if (Fecha.Name = 'DTPAHasta') then
  begin
    if DaysBetween(DTPADesde.Date,Fecha.Date)>365 then
      DTPADesde.Date := IncYear(Fecha.Date,-1)
    else if CompareDate(DTPADesde.Date,Fecha.Date)=GreaterThanValue then
          DTPAHasta.Date := DTPADesde.Date;
    Hasta := DTPAHasta.Date;
    Desde := DTPADesde.Date;
  end;
end;

procedure TFRepInfoMortandad.DTPADesdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    FechaCloseUp(Sender);
end;

procedure TFRepInfoMortandad.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActualizarConsultas;
end;

procedure TFRepInfoMortandad.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
