unit UREPDGAnimalesFiltrados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons, Types,
  DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, DB, IBCustomDataSet,
  IBQuery, Grids, DBGrids, UBDBGrid, IBStoredProc, DataExport, DataToXLS,
  WinXP, ComboBoxAuto, DateUtils, UMensajeImpresora, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPDGAnimalesFiltrados = class(TFUniversal)
    PTop: TPanel;
    Splitter2: TSplitter;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    GBGrupos: TGroupBox;
    DBLCBASeleccionGrupo: TDBLookupComboBoxAuto;
    RGTipo: TRadioGroup;
    Panel1: TPanel;
    RGFiltro: TRadioGroup;
    CBEstadoReproductivo: TComboBox;
    CBDistribucion: TComboBox;
    PAnimales: TPanel;
    GBAnimales: TGroupBox;
    BitDBGrid1: TBitDBGrid;
    IBQGrupos: TIBQuery;
    DSGrupos: TDataSource;
    IBQAnimales: TIBQuery;
    DSAnimales: TDataSource;
    ASalir: TAction;
    AImprimirReporte: TAction;
    RGFiltros: TRadioGroup;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    CBACategoria: TComboBoxAuto;
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
    procedure RGFiltroClick(Sender: TObject);
    procedure DBLCBASeleccionGrupoCloseUp(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure IBQGruposBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BitDBGrid1DblClick(Sender: TObject);
    procedure CBEstadoReproductivoKeyPress(Sender: TObject; var Key: Char);
    procedure CBDistribucionKeyPress(Sender: TObject; var Key: Char);
    procedure BBXlsClick(Sender: TObject);
    procedure RGFiltrosClick(Sender: TObject);
    procedure DBLCBARodeosCloseUp(Sender: TObject);
    procedure CBACategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARodeosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBACategoriaChange(Sender: TObject);
    procedure BitDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DTPACloseUpFechas(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
    procedure DBLCBASeleccionGrupoKeyPress(Sender: TObject; var Key: Char);
  private
    SQLBasico, SQLConsulta, RestoSQL, FiltroSQL : String;
    valor : Integer;
    procedure actualizarFiltro;
    procedure actualizarBotones;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREPDGAnimalesFiltrados: TFREPDGAnimalesFiltrados;

implementation

uses UPrincipal, uTiposGlobales, UREPDGAnimalesFiltradosPreview, UDMSoftvet, UREPFichaAnimal,
     UCartel, UTraduccion;

{$R *.dfm}

// tengo que actualizar el sql filtrando estos valores
procedure TFREPDGAnimalesFiltrados.actualizarFiltro;
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando Animales Tactados ...';
  cartel.abrircartel(msje);  

  IBQAnimales.Active := false;
  IBQAnimales.Params.Clear;
  IBQAnimales.SQL.Clear;
  if (RGFiltro.ItemIndex = 0) then // por estado reproductivo
    begin
      if (RGTipo.ItemIndex = 0) then  // selecciono un grupo
        begin
          SQLConsulta := SQLBasico+FiltroSQL+RestoSQL;
          IBQAnimales.SQL.Add(SQLConsulta);
          //IBQAnimales.SQL.Add('select * from GET_Distribucion_PRENEZ (:esta, null, null, :grupo, ''Today'') where (repro = :repro) order by orden, rp_animal');
          IBQAnimales.ParamByName('hasta').Value := null;
          IBQAnimales.ParamByName('desde').Value := null;
          IBQAnimales.ParamByName('esta').Value := fprincipal.establecimientoactual;
          IBQAnimales.ParamByName('grupo').Value := DBLCBASeleccionGrupo.KeyValue;
          if (CBEstadoReproductivo.ItemIndex = 0) then
            IBQAnimales.ParamByName('repro').Value := 'V'
          else
            IBQAnimales.ParamByName('repro').Value := 'P';
        end
      else                            // selecciono fechas
        begin
          SQLConsulta := SQLBasico+FiltroSQL+RestoSQL;
          IBQAnimales.SQL.Add(SQLConsulta);
          //IBQAnimales.SQL.Add('select * from GET_Distribucion_PRENEZ (:esta, :desde, :hasta, null, ''Today'') where (repro = :repro) order by orden, rp_animal');
          IBQAnimales.ParamByName('esta').Value := fprincipal.establecimientoactual;
          IBQAnimales.ParamByName('desde').Value := DTPADesde.DateTime;
          IBQAnimales.ParamByName('hasta').Value := DTPAHasta.DateTime;
          IBQAnimales.ParamByName('grupo').Value := null;
          if (CBEstadoReproductivo.ItemIndex = 0) then
            IBQAnimales.ParamByName('repro').Value := 'V'
          else
            IBQAnimales.ParamByName('repro').Value := 'P';
        end;
    end
  else                          // por distribucion de preñez
    begin
      if (RGTipo.ItemIndex = 0) then  // selecciono un grupo
        begin
          SQLConsulta := SQLBasico+' and (id_codigo_prenez=:codigo) '+FiltroSQL+RestoSQL;
          IBQAnimales.SQL.Add(SQLConsulta);
          //IBQAnimales.SQL.Add('select * from GET_Distribucion_PRENEZ (:esta, null, null, :grupo, ''Today'') where (repro = ''P'') and (id_codigo_prenez=:codigo) order by orden, rp_animal');
          IBQAnimales.ParamByName('hasta').Value := null;
          IBQAnimales.ParamByName('desde').Value := null;
          IBQAnimales.ParamByName('esta').Value := fprincipal.establecimientoactual;
          IBQAnimales.ParamByName('grupo').Value := DBLCBASeleccionGrupo.KeyValue;
          IBQAnimales.ParamByName('repro').Value := 'P';
          case CBDistribucion.ItemIndex of
            0: begin
                 IBQAnimales.ParamByName('codigo').Value := 'A';
               end;
            1: begin
                 IBQAnimales.ParamByName('codigo').Value := 'U';
               end;
            2: begin
                 IBQAnimales.ParamByName('codigo').Value := 'O';
               end;
            3: begin
                 IBQAnimales.ParamByName('codigo').Value := 'N';
               end;
          end;
        end
      else                            // selecciono fechas
        begin
          SQLConsulta := SQLBasico+' and (id_codigo_prenez=:codigo) '+FiltroSQL+RestoSQL;
          IBQAnimales.SQL.Add(SQLConsulta);
          //IBQAnimales.SQL.Add('select * from GET_Distribucion_PRENEZ (:esta, :desde, :hasta, null, ''Today'') where (repro = ''P'') and (id_codigo_prenez = :codigo) order by orden, rp_animal');
          IBQAnimales.ParamByName('esta').Value := fprincipal.establecimientoactual;
          IBQAnimales.ParamByName('desde').Value := DTPADesde.DateTime;
          IBQAnimales.ParamByName('hasta').Value := DTPAHasta.DateTime;
          IBQAnimales.ParamByName('grupo').Value := null;
          IBQAnimales.ParamByName('repro').Value := 'P';
          case CBDistribucion.ItemIndex of
            0: begin
                 IBQAnimales.ParamByName('codigo').Value := 'A';
               end;
            1: begin
                 IBQAnimales.ParamByName('codigo').Value := 'U';
               end;
            2: begin
                 IBQAnimales.ParamByName('codigo').Value := 'O';
               end;
            3: begin
                 IBQAnimales.ParamByName('codigo').Value := 'N';
               end;
          end;
        end;
    end;
  if (FiltroSQL <> ' ') then
    IBQAnimales.ParamByName('var').Value := valor;
  IBQAnimales.Active := true;
  actualizarBotones;
  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFREPDGAnimalesFiltrados.RGFiltroClick(Sender: TObject);
begin
  inherited;
  if (RGFiltro.ItemIndex = 0) then
    begin
      CBEstadoReproductivo.Enabled := true;
      CBDistribucion.Enabled := false;
    end
  else
    begin
      CBEstadoReproductivo.Enabled := false;
      CBDistribucion.Enabled := true;
    end;
end;
// selecciono un grupo cambio el sql
procedure TFREPDGAnimalesFiltrados.DBLCBASeleccionGrupoCloseUp(
  Sender: TObject);
begin
end;

// toco una fecha actualizo
procedure TFREPDGAnimalesFiltrados.RGTipoClick(Sender: TObject);
begin
  inherited;
    if (TRadioGroup(Sender).ItemIndex = 0) then
    begin
      GBGrupos.Enabled := true;
      GBSeleccionFechas.Enabled := false;
      DBLCBASeleccionGrupo.Enabled := true;
      LDesde.Enabled:= false;
      LHasta.Enabled:= false;
      DTPADesde.Enabled:= false;
      DTPAHasta.Enabled:= false;
    end
  else
    begin
      DBLCBASeleccionGrupo.Enabled := false;
      GBGrupos.Enabled := false;
      GBSeleccionFechas.Enabled := true;
      LDesde.Enabled:= true;
      LHasta.Enabled:= true;
      DTPADesde.Enabled:= true;
      DTPAHasta.Enabled:= true;
    end;
end;

procedure TFREPDGAnimalesFiltrados.FormShow(Sender: TObject);
begin
  inherited;
  IBQGrupos.First;
  if (DBLCBASeleccionGrupo.KeyValue = NULL) then
    DBLCBASeleccionGrupo.KeyValue := IBQGrupos.FieldValues['ID_GRUPO'];
  DTPADesde.DateTime := IncYear(now,-1);
  DTPAHasta.DateTime := now;
  LDesde.Enabled:= false;
  LHasta.Enabled:= false;
  DTPADesde.Enabled:= false;
  DTPAHasta.Enabled:= false;
end;

procedure TFREPDGAnimalesFiltrados.actualizarBotones;
begin
  //AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  IPreview.Enabled := not(IBQAnimales.IsEmpty);
  LPreview.Enabled := not(IBQAnimales.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimales.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimales.IsEmpty);
end;

procedure TFREPDGAnimalesFiltrados.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFREPDGAnimalesFiltrados.AImprimirReporteExecute(
  Sender: TObject);
var cartel: TCartel;
    msje: String;  
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando Reporte de Animales Tactados ...';
  cartel.abrircartel(msje);

  Application.CreateForm(TFREPDGAnimalesFiltradosPreview, FREPDGAnimalesFiltradosPreview);
  if (RGTipo.ItemIndex = 0) then
  begin
    FREPDGAnimalesFiltradosPreview.QRLD.Enabled := false;
    FREPDGAnimalesFiltradosPreview.QRLDesde.Enabled := false;
    FREPDGAnimalesFiltradosPreview.QRLG.Enabled := true;
    FREPDGAnimalesFiltradosPreview.QRLGrupo.Enabled := true;
    FREPDGAnimalesFiltradosPreview.QRLGrupo.Caption := DBLCBASeleccionGrupo.Text;
    FREPDGAnimalesFiltradosPreview.QRLH.Enabled := false;
    FREPDGAnimalesFiltradosPreview.QRLHasta.Enabled := false;
    FREPDGAnimalesFiltradosPreview.QRLPeriodo.Enabled := false;
  end
  else
  begin
    FREPDGAnimalesFiltradosPreview.QRLD.Enabled := true;
    FREPDGAnimalesFiltradosPreview.QRLDesde.Enabled := true;
    FREPDGAnimalesFiltradosPreview.QRLG.Enabled := false;
    FREPDGAnimalesFiltradosPreview.QRLGrupo.Enabled := false;
    FREPDGAnimalesFiltradosPreview.QRLDesde.Caption := DateToStr(DTPADesde.Date);
    FREPDGAnimalesFiltradosPreview.QRLHasta.Caption := DateToStr(DTPAHasta.Date);
    FREPDGAnimalesFiltradosPreview.QRLH.Enabled := true;
    FREPDGAnimalesFiltradosPreview.QRLHasta.Enabled := true;
    FREPDGAnimalesFiltradosPreview.QRLPeriodo.Enabled := true;
  end;
  FREPDGAnimalesFiltradosPreview.QRContenido.DataSet := IBQAnimales;
  FREPDGAnimalesFiltradosPreview.QRDBTRPAnimal.DataSet := IBQAnimales;
  FREPDGAnimalesFiltradosPreview.QRDBDiasActuales.DataSet := IBQAnimales;
  FREPDGAnimalesFiltradosPreview.QRDBDiasTacto.DataSet := IBQAnimales;
  FREPDGAnimalesFiltradosPreview.QRDBDistribucion.DataSet := IBQAnimales;

  cartel.cerrarcartel();
  cartel.FreeInstance();

  FREPDGAnimalesFiltradosPreview.ShowModal;
  HabilitarDesabilitarControles();  
end;

{procedure TFREPDGAnimalesFiltrados.IBQAnimalesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQAnimales.Last;
  IBQAnimales.First;
  GBAnimales.Caption := ' Animales ['+IntToStr(IBQAnimales.RecordCount)+']';
  AImprimirReporte.Enabled := not(DataSet.IsEmpty);
  BBXls.Enabled := not(DataSet.IsEmpty);
end; }

procedure TFREPDGAnimalesFiltrados.IBQAnimalesAfterOpen(DataSet: TDataSet);

begin
  inherited;
  IBQAnimales.Last;
  IBQAnimales.First;  
  BitDBGrid1.DataSource := DSAnimales;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQAnimales.RecordCount)+']';
  AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);
end;

procedure TFREPDGAnimalesFiltrados.IBQGruposBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  IBQGrupos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;

end;

procedure TFREPDGAnimalesFiltrados.FormCreate(Sender: TObject);
begin
  inherited;
  IBQGrupos.Open;
  DMSoftvet.IBQAfterOpen(IBQGrupos);
  DMSoftvet.IBQRodeo.close;
  DMSoftvet.IBQRodeo.ParamByName('esta').Value := Fprincipal.establecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  SQLBasico := 'select * from GET_Distribucion_PRENEZ (:esta, :desde, :hasta, :grupo, ''Today'') where (repro = :repro)';
  RestoSQL := ' order by orden, rp_animal';
  FiltroSQL := ' ';
  SQLConsulta := SQLBasico+FiltroSQL+RestoSQL;
end;

procedure TFREPDGAnimalesFiltrados.BitDBGrid1DblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BitDBGrid1.SelectedIndex = 0 then
    if not(IBQAnimales.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQAnimales.fieldByName('ID_ANIMAL').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPDGAnimalesFiltrados.CBEstadoReproductivoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFREPDGAnimalesFiltrados.CBDistribucionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFREPDGAnimalesFiltrados.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPDGAnimalesFiltrados.RGFiltrosClick(Sender: TObject);
begin
  inherited;
  case (RGFiltros.ItemIndex) of
    0: begin
         DBLCBARodeos.Enabled := true;
         CBACategoria.Enabled := false;
         FiltroSQL := ' and (rodeo = :var)';
         if (DBLCBARodeos.KeyValue = NULL) then
             DBLCBARodeos.KeyValue := 0;
         DBLCBARodeosCloseUp(Sender);
       end;
    1: begin
         DBLCBARodeos.Enabled := false;
         CBACategoria.Enabled := true;
         FiltroSQL := ' and (categoria = :var)';
         CBACategoriaChange(Sender);
       end;
    2: begin
         DBLCBARodeos.Enabled := false;
         CBACategoria.Enabled := false;
         FiltroSQL := ' ';
       end;
    end;
end;

procedure TFREPDGAnimalesFiltrados.DBLCBARodeosCloseUp(Sender: TObject);
begin
  inherited;
  valor := DBLCBARodeos.KeyValue;
end;

procedure TFREPDGAnimalesFiltrados.CBACategoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFREPDGAnimalesFiltrados.DBLCBARodeosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBARodeos.ListVisible) then
   begin
     valor := DBLCBARodeos.KeyValue;
   end;
end;

procedure TFREPDGAnimalesFiltrados.CBACategoriaChange(Sender: TObject);
begin
  inherited;
  if (CBACategoria.ItemIndex = 0) then
    valor := 6
  else
    valor := 5;
end;

procedure TFREPDGAnimalesFiltrados.BitDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BitDBGrid1DblClick(nil);
end;

procedure TFREPDGAnimalesFiltrados.DTPACloseUpFechas(Sender: TObject);
var
  Fecha : TDateTimePickerAuto;
begin
  inherited;
  Fecha := Sender as TDateTimePickerAuto;
  if (Fecha.Name = 'DTPADesde') then
    if DaysBetween(DTPAHasta.Date,Fecha.Date)>365 then
      DTPAHasta.Date := IncYear(Fecha.Date,1)
    else if CompareDate(DTPAHasta.Date,Fecha.Date)=LessThanValue then
          DTPADesde.Date := DTPAHasta.Date;

  if (Fecha.Name = 'DTPAHasta') then
    if DaysBetween(DTPADesde.Date,Fecha.Date)>365 then
      DTPADesde.Date := IncYear(Fecha.Date,-1)
    else if CompareDate(DTPADesde.Date,Fecha.Date)=GreaterThanValue then
          DTPAHasta.Date := DTPADesde.Date;
end;

procedure TFREPDGAnimalesFiltrados.DTPADesdeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUpFechas(Sender);
end;

procedure TFREPDGAnimalesFiltrados.BConsultaClick(Sender: TObject);
begin
  inherited;
  actualizarFiltro;
end;

procedure TFREPDGAnimalesFiltrados.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

procedure TFREPDGAnimalesFiltrados.DBLCBASeleccionGrupoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  //Key := #0;
end;

end.
