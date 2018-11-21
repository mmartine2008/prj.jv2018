unit UREPListadoEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, Grids, DBGrids,
  UBDBGrid, DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, printers,
  IBStoredProc, DataExport, DataToXLS, WinXP, UMensajeImpresora, PngImage,
  jpeg, JvGIF, JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls,
  JvImage;

type
  TFREPListadoEvento = class(TFUniversal)
    ASalir: TAction;
    GBSelectorEventos: TGroupBox;
    DBLCBAEventos: TDBLookupComboBoxAuto;
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
    PGrilla: TPanel;
    GBEventos: TGroupBox;
    BDBGEventos: TBitDBGrid;
    DSGrupos: TDataSource;
    IBQGrupos: TIBQuery;
    IBQColumnas: TIBQuery;
    DSGrilla: TDataSource;
    IBQGrilla: TIBQuery;
    AImprimirListado: TAction;
    IBQGeneral: TIBQuery;
    DSGeneral: TDataSource;
    GBPromedios: TGroupBox;
    CBColumnas: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    LPromedio: TLabel;
    IBQPromedios: TIBQuery;
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
    JvIBotonBuscar: TJvImage;
    Button1: TButton;
    procedure ASalirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLCBASeleccionGrupoCloseUp(Sender: TObject);
    procedure ComboKeyPress(Sender: TObject; var Key: Char);
    procedure RGTipoClick(Sender: TObject);
    procedure DBLCBAEventosCloseUp(Sender: TObject);
    procedure DBLCBAEventosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure closeUpFechas(Sender: TObject);
    procedure DBLCBASeleccionGrupoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AImprimirListadoExecute(Sender: TObject);
    procedure IBQGrillaAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BDBGEventosDblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure CBColumnasCloseUp(Sender: TObject);
    procedure CBColumnasKeyPress(Sender: TObject; var Key: Char);
    procedure IBQGrillaAfterClose(DataSet: TDataSet);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvIBotonBuscarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure ConfigurarFormulario;
    procedure habilitarColumnas(enabled:Boolean);
    procedure ActualizarGrupos;
    procedure CrearColumnas;
    function RetornarSP(evento : integer): String;
    procedure ActualizarQuery;
    procedure CargarParametros;
    procedure ConfiguroReporteImpreso;
    procedure AgregarColumnasEncabezado;
    procedure controlarFechas;
    procedure HabilitarComponentesVersionBasica; override;    
    { Private declarations }
  protected
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
  public
    { Public declarations }
  end;

var
  FREPListadoEvento: TFREPListadoEvento;
  SQLBasico : string;

implementation

uses UDMSoftvet, UPrincipal, UREPListadoEventoPreview, UREPFichaAnimal, UCartel, UTraduccion;
{$R *.dfm}

procedure TFREPListadoEvento.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close;
end;

procedure TFREPListadoEvento.controlarFechas;
begin
  if(DTPAHasta.Date > now) then
    DTPAHasta.Date:=now;
    
  if(DTPADesde.Date >= DTPAHasta.Date) then
    DTPADesde.Date:= DTPAHasta.Date;
end;

procedure TFREPListadoEvento.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQEventosListado.Open;
  DMSoftvet.IBQEventosListado.First;
  if (DBLCBAEventos.KeyValue = NULL) then
    DBLCBAEventos.KeyValue := DMSoftvet.IBQEventosListado.FieldValues['ID_TIPO_EVENTO'];

  SQLBasico := 'select * from <<nombre_sp>>(:establecimiento, :grupo, :inicio, :fin)';
  DTPAHasta.DateTime := now;
  DTPADesde.DateTime := DTPAHasta.DateTime - 365;
  DMSoftvet.IBQAfterOpen(IBQGrupos);
end;

// selecciono un grupo
procedure TFREPListadoEvento.DBLCBASeleccionGrupoCloseUp(Sender: TObject);
begin
  inherited;
  //CargarParametros;
  LPromedio.Caption := '0';
  CBColumnasCloseUp(nil);
  if((CBColumnas.Items.Count > 0) and (DBLCBASeleccionGrupo.Text <> '') ) then
    habilitarColumnas(true);
end;

procedure TFREPListadoEvento.ComboKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 // Key := #13;
end;

// selecciono el grupo
procedure TFREPListadoEvento.RGTipoClick(Sender: TObject);
begin
  inherited;
  if (DMSoftvet.IBQEventosListado.FieldByName('agrupa').AsString = 'S') then
    begin
      if (RGTipo.ItemIndex = 0) then
        begin
          GBGrupos.Enabled := true;
          DBLCBASeleccionGrupo.Enabled := true;
          LDesde.Enabled:= false;
          LHasta.Enabled:= false;
          DTPADesde.Enabled:= false;
          DTPAHasta.Enabled:= false;
          if(CBColumnas.Items.Count > 0) then
            habilitarColumnas(false);
         end
      else
        begin
          DBLCBASeleccionGrupo.Enabled := false;
          GBGrupos.Enabled := false;
          LDesde.Enabled:= true;
          LHasta.Enabled:= true;
          DTPADesde.Enabled:= true;
          DTPAHasta.Enabled:= true;
          DBLCBASeleccionGrupo.KeyValue := null;

          if(CBColumnas.Items.Count > 0) then
            habilitarColumnas(true);
        end;

      GBSeleccionFechas.Enabled := not(GBGrupos.Enabled);
      if (RGTipo.ItemIndex = 1) then
        //CargarParametros
       else
        if (IBQGrilla.Active) then
          //CargarParametros;
    end
  else
    begin
      RGTipo.ItemIndex := 1;
      DBLCBASeleccionGrupo.KeyValue := null;
      GBGrupos.Enabled := false;
      LDesde.Enabled:= true;
      LHasta.Enabled:= true;
      DTPADesde.Enabled:= true;
      DTPAHasta.Enabled:= true;
      GBSeleccionFechas.Enabled := not(GBGrupos.Enabled);
      if (IBQGrilla.Active) then
        //CargarParametros;
    end;
      CBColumnasCloseUp(nil);
end;

procedure  TFREPListadoEvento.habilitarColumnas(enabled:Boolean);
begin
  Label1.Enabled:=enabled;
  CBColumnas.Enabled:=enabled;
  Label2.Enabled:=enabled;
  Lpromedio.Enabled:=enabled;
end;

// selecciono un evento disparo
procedure TFREPListadoEvento.DBLCBAEventosCloseUp(Sender: TObject);
begin
  inherited;
  ConfigurarFormulario;
  LPromedio.Caption := '0';
  //if(CBColumnas.Items.Count=0) then
  habilitarColumnas(CBColumnas.Items.Count > 0);
  //CBColumnas.Enabled := true;  modifique
  ComponentesVisiblesPorPais(FPrincipal.Pais);
end;

// actualizo si tengo que mostrar los grupos o no
procedure TFREPListadoEvento.ActualizarGrupos;
begin
  if (DMSoftvet.IBQEventosListado.FieldByName('agrupa').AsString = 'S') then
    begin
      RGTipo.ItemIndex := 0;
      DBLCBASeleccionGrupo.KeyValue := null;
      //RGTipoClick(self);
      IBQGrupos.Close;
      IBQGrupos.ParamByName('eve').AsInteger := DMSoftvet.IBQEventosListado.FieldByName('id_tipo_evento').AsInteger;
      IBQGrupos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQGrupos.Open;
      DMSoftvet.IBQAfterOpen(IBQGrupos);
      DMSoftvet.IBQGrupos.First;
        if (DBLCBASeleccionGrupo.KeyValue = NULL) then
          DBLCBASeleccionGrupo.KeyValue := DMSoftvet.IBQGrupos.FieldValues['ID_GRUPO'];
    end
  else
    begin
      RGTipo.ItemIndex := 1;
      //RGTipoClick(self);
    end;
end;

// genero las columnas de acuerdo al tipo de evento
procedure TFREPListadoEvento.CrearColumnas;

Var Aux_Columna : TColumn;

begin
  BDBGEventos.Columns.Clear;

  Aux_Columna := BDBGEventos.Columns.Add;
  Aux_Columna.Title.Caption := Traducir('RP Animal');

  IBQColumnas.Close;
  IBQColumnas.ParamByName('eve').AsInteger := DMSoftvet.IBQEventosListado.fieldbyname('id_tipo_evento').AsInteger;
  IBQColumnas.Open;

  //Limpio las columnas disponibles para los promedios
  CBColumnas.Items.Clear;
  CBColumnas.Text := '';

  IBQColumnas.First;
  while not(IBQColumnas.Eof) do
    begin
      Aux_Columna := BDBGEventos.Columns.Add;
      Aux_Columna.Title.Caption := IBQColumnas.fieldbyname('titulo').AsString;
      Aux_Columna.Width := 80;
      //Agrego las columnas que son de tipo entero, solo las q se pueden promediar
      if (IBQColumnas.fieldbyname('tipo').AsString = 'INT') then
        CBColumnas.Items.Add(IBQColumnas.fieldbyname('titulo').AsString);
      IBQColumnas.Next;
    end;
end;

// metodo que se ejecuta cuando se selecciona un evento
procedure TFREPListadoEvento.ConfigurarFormulario;
begin
    // configuro todo el form

  // primero configuro las columnas de la grilla de eventos
  CrearColumnas;

  // segundo me fijo si tiene o no grupo
  ActualizarGrupos;

  // tercero actualizo el query a ejecutar y seteo el fieldName a las columnas de la grilla
  //ActualizarQuery;

  // cuarto y ultimo cargo los parametros
  //CargarParametros;
end;

// retorno el nombre del sp correspondiente al evento para luego insertarlo en la sentencia
function TFREPListadoEvento.RetornarSP(evento : integer): String;
begin
  // faltan los de servicio y los de resultados que son de mas 
  case evento of
    1  : Result := 'sp_listar_aborto';
    2  : Result := 'sp_listar_alta_directa';
    3  : Result := 'sp_listar_Baja';
    4  : Result := 'sp_listar_Calidad_seminal';
    5  : Result := 'sp_listar_cambio_ubicacion';
    6  : Result := 'sp_listar_capacidad_servicio';
    7  : Result := 'sp_listar_castracion';
    8  : Result := 'sp_listar_circunf_escrotal';
    9  : Result := 'sp_listar_condicion_corporal';
    10 : Result := 'sp_listar_destete';
    11 : Result := 'sp_listar_deteccion_celo';
    12 : Result := 'sp_listar_diag_enfermedad';
    13 : Result := 'sp_listar_diag_gestacion';
    14 : Result := 'sp_listar_distocia';
    17 : Result := 'sp_listar_eval_preservicio';
    18 : Result := 'sp_listar_fertilidad_macho';
    19 : Result := 'sp_listar_identificacion';
    22 : Result := 'sp_listar_medicion_frame';
    23 : Result := 'sp_listar_nacimiento';
    24 : Result := 'sp_listar_parto';
    25 : Result := 'sp_listar_peso';
    26 : Result := 'SP_LISTAR_Sincronizacion_Celo';
    27 : Result := 'sp_listar_tratamiento';
    30 : Result := 'sp_listar_brucelosis';
    31 : Result := 'sp_listar_tuberculinizacion';
    32 : Result := 'sp_listar_raspado_toro';
    36 : Result := 'sp_listar_reidentificacion';
    39 : Result := 'sp_listar_parto_masivo';
    41 : Result := 'sp_listar_calidad_carne';
    44 : Result := 'sp_listar_actividad';
    45 : Result := 'sp_listar_suplementacion';
    47 : Result := 'sp_listar_flushing';
    48 : Result := 'sp_listar_transferencias';
    53 : Result := 'sp_listar_cambio_categoria';
  end;

end;

// configuro la consulta y el fieldname a las columnas
procedure TFREPListadoEvento.ActualizarQuery;
var cont : integer;
begin
  // codigo
  IBQGrilla.AfterOpen := nil;
  IBQGrilla.Close;
  IBQGrilla.SQL.Clear;
  IBQGrilla.SQL.Add(StringReplace(SQLBasico,'<<nombre_sp>>',RetornarSP(DMSoftvet.IBQEventosListado.fieldbyname('id_tipo_evento').AsInteger),[rfIgnoreCase]));
  //IBQGrilla.SQL.Add(' order by RP ASC'); // se agrego dentro de cada SP por que desde aca tardaba 3 veces mas.
  IBQGrilla.Open;
  cont := 0;
  while ((cont < IBQGrilla.fields.Count) and (cont < BDBGEventos.Columns.Count)) do
    begin
      BDBGEventos.Columns.Items[cont].FieldName := IBQGrilla.fields.Fields[cont].DisplayName;
      inc(cont);
    end;
  IBQGrilla.AfterOpen := IBQGrillaAfterOpen;
end;

procedure TFREPListadoEvento.DBLCBAEventosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBAEventos.ListVisible) then
    DBLCBAEventosCloseUp(nil);
    ConfigurarFormulario;
end;

procedure TFREPListadoEvento.CargarParametros;
var cartel: TCartel;
    msje: String;
begin
  if (DBLCBAEventos.KeyValue <> Null) then
    begin
      IBQGrilla.Close;
      IBQGrilla.ParamByName('establecimiento').AsInteger := fprincipal.EstablecimientoActual;
      if (RGTipo.ItemIndex = 0) then  // por grupos
        begin
          if (DBLCBASeleccionGrupo.KeyValue <> null) then
            begin
              IBQGrilla.ParamByName('grupo').AsInteger := DBLCBASeleccionGrupo.KeyValue;
              //IBQGrilla.ParamByName('inicio').Value := Unassigned;
              //IBQGrilla.ParamByName('fin').Value := Unassigned;
              cartel:= TCartel.getInstance();
              msje:= 'Generando Genérico ...';
              cartel.abrircartel(msje);
              IBQGrilla.Open;
              cartel.cerrarcartel();
              cartel.FreeInstance();
            end
          else
            begin
              IBQGrilla.ParamByName('grupo').Value := Unassigned;
              IBQGrilla.ParamByName('inicio').Value := Unassigned;
              IBQGrilla.ParamByName('fin').Value := Unassigned;
            end;
        end
      else
        begin
          IBQGrilla.ParamByName('grupo').Value := Unassigned;
          IBQGrilla.ParamByName('inicio').AsDateTime := DTPADesde.DateTime;
          IBQGrilla.ParamByName('fin').AsDateTime := DTPAHasta.DateTime;
          cartel:= TCartel.getInstance();
          msje:= 'Generando Genérico ...';


          cartel.abrircartel(msje);
          IBQGrilla.Open;
          cartel.cerrarcartel();
          cartel.FreeInstance();
        end;
      //if ((IBQGrilla.ParamByName('grupo').Value <> null) or (IBQGrilla.ParamByName('inicio').Value <> null)) then
      //  IBQGrilla.Open;
      AImprimirListado.Enabled := not(IBQGrilla.IsEmpty);
    end;

end;

// actualizo los parametros
procedure TFREPListadoEvento.closeUpFechas(Sender: TObject);
var prueba: boolean;
begin
  inherited;
  controlarFechas;
  //CargarParametros;
  CBColumnasCloseUp(nil);
end;

procedure TFREPListadoEvento.DBLCBASeleccionGrupoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBASeleccionGrupo.ListVisible) then
    DBLCBASeleccionGrupoCloseUp(nil);
    //CargarParametros;
end;

procedure TFREPListadoEvento.AImprimirListadoExecute(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando Reporte Generico ...';
  cartel.abrircartel(msje);

  MostrarMensajeImpresion();
  inherited;
  // codigo
  Application.CreateForm(TFREPListadoEventoPreview, FREPListadoEventoPreview);
  ConfiguroReporteImpreso;

  cartel.cerrarcartel();
  cartel.FreeInstance();
  FREPListadoEventoPreview.ShowModal;
  FREPListadoEventoPreview.Destroy;
  HabilitarDesabilitarControles();  
end;
                                                  
// con este procedure configuro el reporte impreso
procedure TFREPListadoEvento.ConfiguroReporteImpreso;
begin
// codigo
  FREPListadoEventoPreview.QRLTitulo.Caption := DBLCBAEventos.Text;
  if (RGTipo.ItemIndex = 0) then
  begin
    FREPListadoEventoPreview.QRLD.Enabled := false;
    FREPListadoEventoPreview.QRLDesde.Enabled := false;
    FREPListadoEventoPreview.QRLG.Enabled := true;
    FREPListadoEventoPreview.QRLGrupo.Enabled := true;
    FREPListadoEventoPreview.QRLGrupo.Caption := DBLCBASeleccionGrupo.Text;
    FREPListadoEventoPreview.QRLH.Enabled := false;
    FREPListadoEventoPreview.QRLHasta.Enabled := false;
    FREPListadoEventoPreview.QRLPeriodo.Enabled := false;
  end
  else
  begin
    FREPListadoEventoPreview.QRLD.Enabled := true;
    FREPListadoEventoPreview.QRLDesde.Enabled := true;
    FREPListadoEventoPreview.QRLG.Enabled := false;
    FREPListadoEventoPreview.QRLGrupo.Enabled := false;
    FREPListadoEventoPreview.QRLDesde.Caption := DateToStr(DTPADesde.Date);
    FREPListadoEventoPreview.QRLHasta.Caption := DateToStr(DTPAHasta.Date);
    FREPListadoEventoPreview.QRLH.Enabled := true;
    FREPListadoEventoPreview.QRLHasta.Enabled := true;
    FREPListadoEventoPreview.QRLPeriodo.Enabled := true;
  end;
  AgregarColumnasEncabezado;
end;

// agrego las columnas del encabezado
procedure TFREPListadoEvento.AgregarColumnasEncabezado;
var cont : integer;
    posX : integer;
    AnchoUnidad : integer;
begin
  cont := 0;
  posX := 1;

{  if ((BDBGEventos.Columns.Count > 7) or (DBLCBAEventos.KeyValue = 27) or (DBLCBAEventos.KeyValue = 18)) then
    begin
      FREPListadoEventoPreview.QRListado.Page.Orientation := poLandScape;
      FREPListadoEventoPreview.QRLEstablecimientos.Left := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width - FREPListadoEventoPreview.QRLNombreEstablecimiento.Width - 5;
      FREPListadoEventoPreview.QRSEncabezadoPlanilla.Left := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width - FREPListadoEventoPreview.QRSEncabezadoPlanilla.Width - 5;
      FREPListadoEventoPreview.QRLRenglon1.Left := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width - FREPListadoEventoPreview.QRLRenglon1.Width - 5;
      FREPListadoEventoPreview.QRLRenglon2.Left := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width - FREPListadoEventoPreview.QRLRenglon2.Width - 5;
      FREPListadoEventoPreview.QRSD.Left := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width - FREPListadoEventoPreview.QRSD.Width - 5;
      FREPListadoEventoPreview.QRSDPagePlanilla.Left := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width - FREPListadoEventoPreview.QRSDPagePlanilla.Width - 5;
      FREPListadoEventoPreview.QRLPagPlanilla.Left := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width - FREPListadoEventoPreview.QRSDPagePlanilla.Width - FREPListadoEventoPreview.QRLPagPlanilla.Width - 10;
      FREPListadoEventoPreview.Separador1.Width := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width;
      FREPListadoEventoPreview.Separador2.Width := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width;
      FREPListadoEventoPreview.Separador3.Width := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width;
      FREPListadoEventoPreview.Separador4.Width := FREPListadoEventoPreview.QRBEncabezadoPlanilla.Width;
    end;     }

  FREPListadoEventoPreview.QRListado.DataSet := IBQGrilla;

  if (CBColumnas.ItemIndex <> -1) then
  begin
    FREPListadoEventoPreview.QRLPromedio.Caption := CBColumnas.Items.Strings[CBColumnas.ItemIndex]+':  '+LPromedio.Caption;
    FREPListadoEventoPreview.QRLPromedio.Enabled := true;
    FREPListadoEventoPreview.QRLProm.Enabled := true;
  end
  else
  begin
    FREPListadoEventoPreview.QRLPromedio.Enabled := false;
    FREPListadoEventoPreview.QRLProm.Enabled := false;
  end;

  AnchoUnidad := FREPListadoEventoPreview.QRBColumnHeaderPlanilla.Width div BDBGEventos.Columns.Count ;

  while (cont < BDBGEventos.Columns.Count) do
    begin
      with  (TQRLabel (FREPListadoEventoPreview.QRBColumnHeaderPlanilla.AddPrintable(TQRLabel))) do
        begin
          Left := posX;
          Top := 0;
          Height := 15;
          autoSize := false;
          Width := AnchoUnidad;
          Caption := BDBGEventos.Columns.Items[cont].Title.Caption;
          alignment := taCenter;
        end;
      with  (TQRDBText(FREPListadoEventoPreview.QRBDetailPlanilla.AddPrintable(TQRDBText))) do
        begin
          Font.Size := 6;
          Left := posX;
          Top := 0;
          Height := 15;
          autoSize := false;
          Width := AnchoUnidad;
          DataSet := IBQGrilla;
          DataField := BDBGEventos.Columns.Items[cont].FieldName;
          alignment := taCenter;
        end;
      posX := posX + anchoUnidad;
      inc(cont);
    end ;
end;

procedure TFREPListadoEvento.IBQGrillaAfterOpen(DataSet: TDataSet);

begin
  inherited;

  IBQGrilla.Last;
  IBQGrilla.First;
  BDBGEventos.DataSource := DSGrilla;
  GBEventos.Caption := Traducir('Animales [')+IntToStr(IBQGrilla.RecordCount)+']';
  IPreview.Enabled := not(IBQGrilla.IsEmpty);
  LPreview.Enabled := not(IBQGrilla.IsEmpty);
  LExpExcel.Enabled := not(IBQGrilla.IsEmpty);
  IExpExcel.Enabled := not(IBQGrilla.IsEmpty);
  ComponentesVisiblesPorPais(FPrincipal.Pais)
end;

procedure TFREPListadoEvento.FormShow(Sender: TObject);
begin
  inherited;
  LDesde.Enabled:= false;
  LHasta.Enabled:= false;
  DTPADesde.Enabled:= false;
  DTPAHasta.Enabled:= false;
end;

procedure TFREPListadoEvento.BDBGEventosDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (BDBGEventos.SelectedIndex = 0) then
    if not(IBQGrilla.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
   {   IBQGeneral.Close; // //IBQGrilla.Fields[0].Value;
      IBQGeneral.ParamByName('rp').AsString := IBQGrilla.Fields[0].AsString;
      //IBQGeneral.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQGeneral.Open;  }
      F.animal := IBQGrilla.FieldByName('ID_ANIMAL').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPListadoEvento.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPListadoEvento.CBColumnasCloseUp(Sender: TObject);
var
  columna : String;
begin
  inherited;
  if (CBColumnas.ItemIndex <> -1) then
  begin
    IBQPromedios.Close;
    IBQPromedios.SQL.Clear;
    columna := CBColumnas.Items.Strings[CBColumnas.itemIndex];
    if (columna = 'Área Pélvica') then columna := 'area_pelvica';
    if (columna = 'Edad [dias]') then columna := 'edad';
    if (columna = 'Cant. Embriones') then columna := 'cant_embriones';
    if (columna = 'Circunf. Esc.') then columna := 'CIRCUNFESC';
    if (columna = 'A.O.B.E.G.D.') then columna := 'AOBEGD';
    if (columna = 'E.G.C.') then columna := 'EGC';
    if (columna = 'G.I.') then columna := 'GI';
    if (columna = 'Emb. Transf.') then columna := 'CANT_EMBRIONES';
    if (columna = 'Cant. Deg.') then columna := 'CANT_DEG';
    if (columna = 'Cant. UFO') then columna := 'CANT_SINF';
    if (columna = 'Condición') then columna := 'CONDICION';
    if (columna = 'Cant. Dias') then columna := 'CANT_DIAS';
    if (columna = 'Cant. Ración') then columna := 'RACION';


    IBQPromedios.SQL.Add('select avg('+columna+') as prom from '+RetornarSP(DMSoftvet.IBQEventosListado.fieldbyname('id_tipo_evento').AsInteger)+'(:esta,:grupo,:inicio,:fin)');
    if (DBLCBAEventos.KeyValue <> Null) then
      begin
        IBQPromedios.Close;
        IBQPromedios.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
        if (RGTipo.ItemIndex = 0) then  // por grupos
          begin
            if (DBLCBASeleccionGrupo.KeyValue <> null) then
              begin
                IBQPromedios.ParamByName('grupo').AsInteger := DBLCBASeleccionGrupo.KeyValue;
                //IBQPromedios.ParamByName('inicio').Value := Unassigned;
                //IBQPromedios.ParamByName('fin').Value := Unassigned;
              end
            else
              begin
                IBQPromedios.ParamByName('grupo').Value := Unassigned;
                IBQPromedios.ParamByName('inicio').Value := Unassigned;
                IBQPromedios.ParamByName('fin').Value := Unassigned;
              end;
          end
        else
          begin
            IBQPromedios.ParamByName('grupo').Value := Unassigned;
            IBQPromedios.ParamByName('inicio').AsDateTime := DTPADesde.DateTime;
            IBQPromedios.ParamByName('fin').AsDateTime := DTPAHasta.DateTime;
          end;
        IBQPromedios.Open;
      end;
    LPromedio.Caption := IntToStr(IBQPromedios.fieldByName('prom').AsInteger);
  end
  else
    LPromedio.Caption := '0';
end;

procedure TFREPListadoEvento.CBColumnasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key:= #0;
end;

procedure TFREPListadoEvento.IBQGrillaAfterClose(DataSet: TDataSet);
begin
  inherited;
  GBEventos.Caption := Traducir(' Animales  [0]');
end;

procedure TFREPListadoEvento.ComponentesVisiblesPorPais(pais: Integer);
var i: Integer;
begin
  inherited;
  if (pais = 1) then //Argentina
   begin
    //
   end
  else
    if (pais = 2) then //Uruguay
     begin
      //
     end;

  i:= 0;
  while (i < BDBGEventos.Columns.Count) do
    begin
      if (BDBGEventos.Columns[i].Title.Caption = Traducir('Senasa')) then
        begin
          BDBGEventos.Columns[i].Title.Caption:= FPrincipal.PaisNombreCaravana;
          //i:= BDBGSimple.Columns.Count;
        end;

      if (BDBGEventos.Columns[i].Title.Caption = Traducir('Hba')) then
        begin
          BDBGEventos.Columns[i].Title.Caption:= FPrincipal.PaisHerdBook;
          //i:= BDBGSimple.Columns.Count;
        end;

      inc(i);
    end;
end;

procedure TFREPListadoEvento.DTPADesdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    closeUpFechas(Sender);
end;

procedure TFREPListadoEvento.HabilitarComponentesVersionBasica;
begin
  inherited;
//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
    begin
      DMSoftvet.IBQEventosListado.Close;
      DMSoftvet.IBQEventosListado.SQL.Clear;
      DMSoftvet.IBQEventosListado.SQL.Add('select * from cod_tipos_evento where (rep_generico = '+'''S'''+') and id_tipo_evento <> 41 and id_tipo_evento <> 47 and id_tipo_evento <> 48 order by nombre asc');
      DMSoftvet.IBQEventosListado.Open;
    end
   else
     begin
       //
     end;
//  {$ELSE}
    //
//  {$ENDIF}
end;

procedure TFREPListadoEvento.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

procedure TFREPListadoEvento.Button1Click(Sender: TObject);
begin
  inherited;
  ActualizarQuery;
  CargarParametros;
end;

end.

