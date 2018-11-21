unit UREPResumenParto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids, Buttons,
  DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, IBQuery, DBGrids,
  UBDBGrid, TeEngine, Series, TeeProcs, Chart, DbChart, UMensajeImpresora,
  JvExControls, JvLabel, JvGIF, ImgList, PngImageList, pngimage,
  JvExExtCtrls, JvImage;

type
  TFREPResumenParto = class(TFUniversal)
    PTop: TPanel;
    Splitter2: TSplitter;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    GBPotreros: TGroupBox;
    DBLCBASeleccionPotrero: TDBLookupComboBoxAuto;
    RGTipo: TRadioGroup;
    PResumenParto: TPanel;
    GBResumenParto: TGroupBox;
    PBotones: TPanel;
    IBQResumenParto: TIBQuery;
    ASalir: TAction;
    AImprimirReporte: TAction;
    BitDBGrid1: TBitDBGrid;
    DSNacimientos: TDataSource;
    IBQNacimientos: TIBQuery;
    IBQPotreros: TIBQuery;
    DSPotreros: TDataSource;
    PGraficos: TPanel;
    PServidas: TPanel;
    GBServidas: TGroupBox;
    DBCNacimientos: TDBChart;
    IBQCantNacimientos: TIBQuery;
    DSCantNacimientos: TDataSource;
    DSResumenParto: TDataSource;
    GroupBox1: TGroupBox;
    BBAyuda: TBitBtn;
    BBImprimirReporte: TBitBtn;
    BBXls: TBitBtn;
    BBSalir: TBitBtn;
    GroupBox2: TGroupBox;
    CBListado: TCheckBox;
    PieSeries1: TBarSeries;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure DBLCBASeleccionPotreroCloseUp(Sender: TObject);
    procedure DTPADesdeChange(Sender: TObject);
    procedure DTPAHastaChange(Sender: TObject);
    procedure BitDBGrid1DblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQNacimientosAfterOpen(DataSet: TDataSet);
    procedure DBLCBASeleccionPotreroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure actualizarFiltro();
    procedure actualizarBotones();
    procedure controlarFechas;   
  public
    { Public declarations }
  end;

var
  FREPResumenParto: TFREPResumenParto;

implementation

{$R *.dfm}

uses UDMSoftvet, UPrincipal, UREPFichaAnimal, UREPResumenPartoPreview, Math,
     UCartel, UTraduccion;

procedure TFREPResumenParto.FormShow(Sender: TObject);
begin
  inherited;
  {SGResumenParto.Rows[0].Strings[0]:= 'Sexo';
  SGResumenParto.Rows[1].Strings[0]:= 'Vivos';
  SGResumenParto.Rows[2].Strings[0]:= 'Muertos';
  SGResumenParto.Rows[0].Strings[1]:= 'Machos';
  SGResumenParto.Rows[0].Strings[2]:= 'Hembras';
  SGResumenParto.Rows[0].Strings[3]:= 'Total';
  SGResumenParto.Rows[0].Strings[4]:= 'Partos con distocia';
  SGResumenParto.Rows[0].Strings[5]:= 'Prom. Peso al nacer';
   }
  IBQPotreros.First;
  //IBQNacimientos.Close;
  //IBQNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;
  //IBQNacimientos.Open;  
  DTPAHasta.DateTime := now;
  DTPADesde.DateTime := DTPAHasta.DateTime - 365;
  RGTipoClick(self);  
  //actualizarFiltro;
  LDesde.Enabled:= false;
  LHasta.Enabled:= false;
  DTPADesde.Enabled:= false;
  DTPAHasta.Enabled:= false;    
end;


procedure TFREPResumenParto.controlarFechas;
begin
  if(DTPAHasta.Date > now) then
    DTPAHasta.Date:=now;
    
  if(DTPADesde.Date >= DTPAHasta.Date) then
    DTPADesde.Date:= DTPAHasta.Date;
end;

procedure TFREPResumenParto.FormCreate(Sender: TObject);
begin
  inherited;
  IBQPotreros.ParamByName('esta').Value := fprincipal.establecimientoactual;
  IBQPotreros.Open;
  DMSoftvet.IBQAfterOpen(IBQPotreros);
end;

procedure TFREPResumenParto.RGTipoClick(Sender: TObject);
begin
  inherited;
   if (TRadioGroup(Sender).ItemIndex = 0) then
    begin
      GBPotreros.Enabled := false;
      GBSeleccionFechas.Enabled := false;
      DBLCBASeleccionPotrero.Enabled := false;
      LDesde.Enabled:= false;
      LHasta.Enabled:= false;
      DTPADesde.Enabled:= false;
      DTPAHasta.Enabled:= false;
    end
   else
     if (TRadioGroup(Sender).ItemIndex = 1) then
      begin
        GBPotreros.Enabled := true;
        GBSeleccionFechas.Enabled := false;
        DBLCBASeleccionPotrero.Enabled := true;
        LDesde.Enabled:= false;
        LHasta.Enabled:= false;
        DTPADesde.Enabled:= false;
        DTPAHasta.Enabled:= false;
      end
    else
      begin
        DBLCBASeleccionPotrero.Enabled := false;
        GBPotreros.Enabled := false;
        GBSeleccionFechas.Enabled := true;
        LDesde.Enabled:= true;
        LHasta.Enabled:= true;
        DTPADesde.Enabled:= true;
        DTPAHasta.Enabled:= true;
      end;

  actualizarFiltro;
end;

procedure TFREPResumenParto.actualizarFiltro;
var query, com, com2:string;
    cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando Nacimientos ...';
  cartel.abrircartel(msje);

  IBQNacimientos.Active := false;
  IBQNacimientos.Params.Clear;
  IBQNacimientos.SQL.Clear;

  IBQCantNacimientos.Active := false;
  IBQCantNacimientos.Params.Clear;
  IBQCantNacimientos.SQL.Clear;

  IBQResumenParto.Active := false;
  IBQResumenParto.Params.Clear;
  IBQResumenParto.SQL.Clear;

  com:= ' ';
  com2:='';

  if (RGTipo.ItemIndex = 0) then  // todos
    begin
      query:='select distinct ta.fecha_nacimiento, ta.id_rp, ta.id_animal, en.vivo, (te.nombre || ' + '''' + com + '''' + ' || te.apellido) as resp, tp.nombre, cts.nombre as sexo  '+
      'from eve_eventos ee, eve_nacimiento en, tab_animales ta, cod_sexos cs, cod_tipos_sexo cts, tab_empleados te, tab_potreros tp '+
      'where ee.establecimiento = :esta and te.id_empleado=ee.responsable and te.establecimiento = ee.establecimiento and ta.potrero = tp.id_potrero and ta.establecimiento = tp.establecimiento and '+
             'ee.id_evento = en.id_evento and ta.id_animal = ee.animal and '+
             'ta.sexo = cs.id_sexo and cs.tipo = cts.id_tipo_sexo '+
             'order by ta.fecha_nacimiento';

      IBQNacimientos.SQL.Add(query);
      IBQNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;

      query:='select ta.fecha_nacimiento, count(*) '+
      'from eve_eventos ee, eve_nacimiento en, tab_animales ta, cod_sexos cs, cod_tipos_sexo cts '+
      'where ee.establecimiento = :esta and '+
             'ee.id_evento = en.id_evento and ta.id_animal = ee.animal and '+
             'ta.sexo = cs.id_sexo and cs.tipo = cts.id_tipo_sexo '+
             'group by ta.fecha_nacimiento '+
             'order by ta.fecha_nacimiento';

      IBQCantNacimientos.SQL.Add(query);
      IBQCantNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;

      query:='select * from rep_resumen_parto(:esta,NULL,NULL,NULL)';

      IBQResumenParto.SQL.Add(query);
      IBQResumenParto.ParamByName('esta').Value := fprincipal.establecimientoactual;
    end
   else 
    if (RGTipo.ItemIndex = 1) then  // selecciono un ootrero
      begin
        query:='select distinct ta.fecha_nacimiento, ta.id_rp, ta.id_animal, en.vivo, (te.nombre || ' + '''' + com + '''' + ' || te.apellido) as resp, tp.nombre, cts.nombre as sexo  '+
        'from eve_eventos ee, eve_nacimiento en, tab_animales ta, cod_sexos cs, cod_tipos_sexo cts, tab_empleados te, tab_potreros tp '+
        'where ee.establecimiento = :esta and te.id_empleado=ee.responsable and te.establecimiento = ee.establecimiento and '+
               'ee.id_evento = en.id_evento and ta.id_animal = ee.animal and ta.potrero = tp.id_potrero and ta.establecimiento = tp.establecimiento and '+
               'ta.sexo = cs.id_sexo and cs.tipo = cts.id_tipo_sexo and '+
               'ta.potrero = :pot ' +
               'order by ta.fecha_nacimiento';

        IBQNacimientos.SQL.Add(query);
        IBQNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;
        IBQNacimientos.ParamByName('pot').Value := DBLCBASeleccionPotrero.KeyValue;

        query:='select ta.fecha_nacimiento, count(*) '+
        'from eve_eventos ee, eve_nacimiento en, tab_animales ta, cod_sexos cs, cod_tipos_sexo cts, tab_empleados te, tab_potreros tp '+
        'where ee.establecimiento = :esta and te.id_empleado=ee.responsable and  te.establecimiento = ee.establecimiento and '+
               'ee.id_evento = en.id_evento and ta.id_animal = ee.animal and ta.potrero = tp.id_potrero and ta.establecimiento = tp.establecimiento and '+
               'ta.sexo = cs.id_sexo and cs.tipo = cts.id_tipo_sexo and '+
               'ta.potrero = :pot ' +
               'group by ta.fecha_nacimiento '+
               'order by ta.fecha_nacimiento';

        IBQCantNacimientos.SQL.Add(query);
        IBQCantNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;
        IBQCantNacimientos.ParamByName('pot').Value := DBLCBASeleccionPotrero.KeyValue;

        query:='select * from rep_resumen_parto(:esta,NULL,NULL,:potrero)';

        IBQResumenParto.SQL.Add(query);
        IBQResumenParto.ParamByName('esta').Value := fprincipal.establecimientoactual;
        IBQResumenParto.ParamByName('potrero').Value := DBLCBASeleccionPotrero.KeyValue;
      end
    else                            // selecciono fechas
      begin
        query:='select distinct ta.fecha_nacimiento, ta.id_rp, ta.id_animal, en.vivo, (te.nombre || ' + '''' + com + '''' + ' || te.apellido) as resp, tp.nombre, cts.nombre as sexo   '+
        'from eve_eventos ee, eve_nacimiento en, tab_animales ta, cod_sexos cs, cod_tipos_sexo cts, tab_empleados te, tab_potreros tp '+
        'where ee.establecimiento = :esta and te.id_empleado=ee.responsable and te.establecimiento = ee.establecimiento and '+
               'ee.id_evento = en.id_evento and ta.id_animal = ee.animal and '+
               'ta.potrero = tp.id_potrero and ta.establecimiento = tp.establecimiento and '+
               'ta.sexo = cs.id_sexo and cs.tipo = cts.id_tipo_sexo and '+
               '(ta.fecha_nacimiento <= :hasta) and (ta.fecha_nacimiento >= :desde) '+
               'order by ta.fecha_nacimiento';

        IBQNacimientos.SQL.Add(query);
        IBQNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;
        IBQNacimientos.ParamByName('desde').Value := DTPADesde.DateTime;
        IBQNacimientos.ParamByName('hasta').Value := DTPAHasta.DateTime;

        query:='select ta.fecha_nacimiento, count(*) '+
        'from eve_eventos ee, eve_nacimiento en, tab_animales ta, cod_sexos cs, cod_tipos_sexo cts '+
        'where ee.establecimiento = :esta and  '+
               'ee.id_evento = en.id_evento and ta.id_animal = ee.animal and '+
               'ta.sexo = cs.id_sexo and cs.tipo = cts.id_tipo_sexo and '+
               '(ta.fecha_nacimiento <= :hasta) and (ta.fecha_nacimiento >= :desde) '+
               'group by ta.fecha_nacimiento '+                
               'order by ta.fecha_nacimiento';

        IBQCantNacimientos.SQL.Add(query);
        IBQCantNacimientos.ParamByName('esta').Value := fprincipal.establecimientoactual;
        IBQCantNacimientos.ParamByName('desde').Value := DTPADesde.DateTime;
        IBQCantNacimientos.ParamByName('hasta').Value := DTPAHasta.DateTime;

        query:='select * from rep_resumen_parto(:esta,:desde,:hasta,NULL)';

        IBQResumenParto.SQL.Add(query);
        IBQResumenParto.ParamByName('esta').Value := fprincipal.establecimientoactual;
        IBQResumenParto.ParamByName('desde').Value := DTPADesde.DateTime;
        IBQResumenParto.ParamByName('hasta').Value := DTPAHasta.DateTime;
      end;

  IBQNacimientos.Active := true;
  IBQCantNacimientos.Active := true;
  actualizarBotones;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFREPResumenParto.actualizarBotones;
begin
  AImprimirReporte.Enabled := not(IBQNacimientos.IsEmpty);
  BBXls.Enabled := not(IBQNacimientos.IsEmpty);
end;

procedure TFREPResumenParto.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFREPResumenParto.AImprimirReporteExecute(Sender: TObject);
var cartel: TCartel;
    msje: String;
    aux1, aux2: Extended;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  //Application.CreateForm(TFREPParteMensualPreview, FREPParteMensualPreview);
  //FREPParteMensualPreview.QRParteMensual.PreviewModal;
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del Reporte de Resumen de Parto ...';
  cartel.abrircartel(msje);

  Application.CreateForm(TFREPResumenPartoPreview, FREPResumenPartoPreview);
  DBCNacimientos.SaveToMetafile(ExtractFilePath(Application.ExeName)+'grafico.wmf');
  FREPResumenPartoPreview.QRINacimientos.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'grafico.wmf');

  IBQResumenParto.Close;
  IBQResumenParto.ParamByName('esta').Value := fprincipal.establecimientoactual;
  IBQResumenParto.Open;

  if (RGTipo.ItemIndex = 1) then
    begin
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLabel27.Enabled:= false;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLabel28.Enabled:= false;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLabel29.Enabled:= false;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLDesde.Enabled:= false;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHasta.Enabled:= false;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPotrero.Enabled:= true;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPotreroSel.Enabled:= true;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPotreroSel.Caption:= DBLCBASeleccionPotrero.Text;
    end
   else
    if (RGTipo.ItemIndex = 2) then
      begin
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLabel27.Enabled:= true;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLabel28.Enabled:= true;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLabel29.Enabled:= true;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLDesde.Enabled:= true;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHasta.Enabled:= true;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPotrero.Enabled:= false;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPotreroSel.Enabled:= false;
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLDesde.Caption:= DateToStr(DTPADesde.Date);
       UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHasta.Caption:= DateToStr(DTPAHasta.Date);
      end;

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLMachosVivos.Caption:= IBQResumenParto.FieldByName('CANTMACHOSVIVOS').AsString;
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLMachosMuertos.Caption:= IBQResumenParto.FieldByName('CANTMACHOSMUERTOS').AsString;
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHembrasVivas.Caption:= IBQResumenParto.FieldByName('CANTHEMBRASVIVAS').AsString;
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHembrasMuertas.Caption:= IBQResumenParto.FieldByName('CANTHEMBRASMUERTAS').AsString;
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLDistVivos.Caption:= IBQResumenParto.FieldByName('CANTPARTOSDISTOCIAVIVOS').AsString;
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLDistMuertos.Caption:= IBQResumenParto.FieldByName('CANTPARTOSDISTOCIAMUERTOS').AsString;
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPromVivos.Caption:= FormatFloat('0.00',StrToFloat(IBQResumenParto.FieldByName('PROMNACIMIENTOVIVO').AsString));
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPromMuertos.Caption:= FormatFloat('0.00',StrToFloat(IBQResumenParto.FieldByName('PROMNACIMIENTOMUERTO').AsString));

//  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPromVivos.Caption:=FormatFloat('0.00',StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPromVivos.Caption));
//  FormatFloat('0,00',StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPromMuertos.Caption));

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalVivos.Caption:= IntToStr(StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLMachosVivos.Caption) + StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHembrasVivas.Caption));
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalMuertos.Caption:= IntToStr(StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLMachosMuertos.Caption) + StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHembrasMuertas.Caption));

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalMachos.Caption:= IntToStr(StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLMachosVivos.Caption) + StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLMachosMuertos.Caption));
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalHembras.Caption:= IntToStr(StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHembrasVivas.Caption) + StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHembrasMuertas.Caption));

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalTotal.Caption:= IntToStr(StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalVivos.Caption) + StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalMuertos.Caption));

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalDistocia.Caption:= IntToStr(StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLDistVivos.Caption) + StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLDistMuertos.Caption));

//  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalPromedio.Caption:= FloatToStr(StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPromVivos.Caption) + StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPromMuertos.Caption));

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPorcMachos.Caption:= FormatFloat('0.00',100 * (StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalMachos.Caption) / StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalTotal.Caption)));

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPorcHembras.Caption:= FormatFloat('0.00',100 * (StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalHembras.Caption) / StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalTotal.Caption)));

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalPorc.Caption:= '100';

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPorcPorc.Caption:= '100';

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPorcVivos.Caption:= FormatFloat('0.00',100 * (StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalVivos.Caption) / StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalTotal.Caption)));

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPorcMuertos.Caption:= FormatFloat('0.00',100 * (StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalMuertos.Caption) / StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalTotal.Caption)));

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPorcDistocia.Caption:= FormatFloat('0.00',100 * (StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalDistocia.Caption) / StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalTotal.Caption)));


  UREPResumenPartoPreview.FREPResumenPartoPreview.QRPromMachosVivos.Caption:= FormatFloat('0.00',StrToFloat(IBQResumenParto.FieldByName('PROMNACIMIENTOVIVOMACHO').AsString));
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRPromMachosMuertos.Caption:= FormatFloat('0.00',StrToFloat(IBQResumenParto.FieldByName('PROMNACIMIENTOMUERTOMACHO').AsString));
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRPromHembrasVivos.Caption:= FormatFloat('0.00',StrToFloat(IBQResumenParto.FieldByName('PROMNACIMIENTOVIVOHEMBRA').AsString));
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRPromHembrasMuertas.Caption:= FormatFloat('0.00',StrToFloat(IBQResumenParto.FieldByName('PROMNACIMIENTOMUERTOHEMBRA').AsString));


  aux1:= StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRPromHembrasVivos.Caption);
  aux1:= aux1 * StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHembrasVivas.Caption);
  aux2:= StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRPromHembrasMuertas.Caption);
  aux2:= aux2 * StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHembrasMuertas.Caption);

  if (StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalHembras.Caption) <> 0) then
    aux1:= (aux1 + aux2)/StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalHembras.Caption)
   else
     aux1:= 0;

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalPromedioHembra.Caption:= FormatFloat('0.00',aux1);

  aux1:= StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRPromMachosVivos.Caption);
  aux1:= aux1 * StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLMachosVivos.Caption);
  aux2:= StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRPromMachosMuertos.Caption);
  aux2:= aux2 * StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLMachosMuertos.Caption);

  if (StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalMachos.Caption) <> 0) then
    aux1:= (aux1 + aux2)/StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalMachos.Caption)
   else
     aux1:= 0;

  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalPromedioMacho.Caption:= FormatFloat('0.00',aux1);

  aux1:= StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPromVivos.Caption);
  aux1:= aux1 * (StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLMachosVivos.Caption) + StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHembrasVivas.Caption));
  aux2:= StrToFloat(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLPromMuertos.Caption);
  aux2:= aux2 * (StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLMachosMuertos.Caption) + StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLHembrasMuertas.Caption));

  if ((StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalMachos.Caption) + StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalHembras.Caption)) <> 0) then
    aux1:= (aux1 + aux2)/(StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalMachos.Caption) + StrToInt(UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalHembras.Caption))
   else
     aux1:= 0;
     
  UREPResumenPartoPreview.FREPResumenPartoPreview.QRLTotalPromedio.Caption:= FormatFloat('0.00',aux1);


  if not(CBListado.Checked) then
  begin
    FREPResumenPartoPreview.QRBand4.Enabled := false;
    FREPResumenPartoPreview.QRBand5.Enabled := false;
  end;

  cartel.cerrarcartel();
  cartel.FreeInstance();

  FREPResumenPartoPreview.ShowModal;
  FREPResumenPartoPreview.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFREPResumenParto.DBLCBASeleccionPotreroCloseUp(Sender: TObject);
begin
  inherited;
  actualizarFiltro;
end;

procedure TFREPResumenParto.DTPADesdeChange(Sender: TObject);
begin
  inherited;
  controlarFechas;
  actualizarFiltro;
end;

procedure TFREPResumenParto.DTPAHastaChange(Sender: TObject);
begin
  inherited;
  controlarFechas;
  actualizarFiltro;
end;

procedure TFREPResumenParto.BitDBGrid1DblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BitDBGrid1.SelectedIndex = 1 then
    if not(IBQNacimientos.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQNacimientos.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPResumenParto.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;


procedure TFREPResumenParto.IBQNacimientosAfterOpen(DataSet: TDataSet);

begin
  inherited;

  IBQNacimientos.Last;
  IBQNacimientos.First;
  BitDBGrid1.DataSource := DSNacimientos;
  GBResumenParto.Caption := Traducir('Animales [')+IntToStr(IBQNacimientos.RecordCount)+']';
  BBImprimirReporte.Enabled := not(IBQNacimientos.IsEmpty);
  BBXls.Enabled := not(IBQNacimientos.IsEmpty);
end;

procedure TFREPResumenParto.DBLCBASeleccionPotreroKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBASeleccionPotrero.ListVisible) then
    actualizarFiltro;
end;

procedure TFREPResumenParto.BitDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BitDBGrid1DblClick(nil);
end;

end.
