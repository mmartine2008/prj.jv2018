unit UREPParteMensual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, DB, IBQuery, WinXP, DataExport, DataToXLS,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, Buttons, Grids,
  DBGrids, UBDBGrid, UMensajeImpresora, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPParteMensual = class(TFUniversal)
    IBQParteMensual: TIBQuery;
    IBQGrupos: TIBQuery;
    DSGrupos: TDataSource;
    PAnimales: TPanel;
    GBParteMensual: TGroupBox;
    BitDBGrid1: TBitDBGrid;
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
    ASalir: TAction;
    AImprimirReporte: TAction;
    DSParteMensual: TDataSource;
    IBQParteMensualFECHA: TDateField;
    IBQParteMensualNOMBREGRUPO: TIBStringField;
    IBQParteMensualRESPONSABLE: TIBStringField;
    IBQParteMensualCANTANIMALES: TIntegerField;
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
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure DBLCBASeleccionGrupoCloseUp(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQParteMensualAfterOpen(DataSet: TDataSet);
    procedure DTPACloseUpFechas(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    { Private declarations }
    procedure actualizarFiltro;
    procedure actualizarBotones;
    procedure controlarFechas;
  public
    { Public declarations }
  end;

var
  FREPParteMensual: TFREPParteMensual;

implementation

uses UPrincipal, uTiposGlobales,UDMSoftvet, UREPParteMensualPreview, UCartel, UTraduccion;

{$R *.dfm}

procedure TFREPParteMensual.FormShow(Sender: TObject);
begin
  inherited;
  IBQGrupos.First;
  if (DBLCBASeleccionGrupo.KeyValue = NULL) then
    DBLCBASeleccionGrupo.KeyValue := IBQGrupos.FieldValues['ID_GRUPO'];

  DTPAHasta.DateTime := now;
  DTPADesde.DateTime := DTPAHasta.DateTime - 365;
  RGTipoClick(self);
  //actualizarFiltro;
  LDesde.Enabled:= false;
  LHasta.Enabled:= false;
  DTPADesde.Enabled:= false;
  DTPAHasta.Enabled:= false;  
end;

procedure TFREPParteMensual.controlarFechas;
begin
  if(DTPAHasta.Date > now) then
    DTPAHasta.Date:=now;
  if(DTPADesde.Date >= DTPAHasta.Date) then
    DTPADesde.Date:= DTPAHasta.Date;
end;

procedure TFREPParteMensual.FormCreate(Sender: TObject);
begin
  inherited;
  IBQGrupos.ParamByName('esta').Value := fprincipal.establecimientoactual;
  IBQGrupos.Open;
  DMSoftvet.IBQAfterOpen(IBQGrupos);
end;

procedure TFREPParteMensual.RGTipoClick(Sender: TObject);
begin
  inherited;
   if (TRadioGroup(Sender).ItemIndex = 0) then
    begin
      GBGrupos.Enabled := false;
      GBSeleccionFechas.Enabled := false;
      DBLCBASeleccionGrupo.Enabled := false;
      LDesde.Enabled:= false;
      LHasta.Enabled:= false;
      DTPADesde.Enabled:= false;
      DTPAHasta.Enabled:= false;
    end
   else
     if (TRadioGroup(Sender).ItemIndex = 1) then
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

  //actualizarFiltro;
end;

procedure TFREPParteMensual.actualizarFiltro;
var query:string;
    cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Procesando datos Parte Mensual ...';
  cartel.abrircartel(msje);

  IBQParteMensual.close;
  IBQParteMensual.Params.Clear;
  IBQParteMensual.SQL.Clear;
  query:= 'SELECT * FROM rep_parte_mensual(:ESTA,:GRUPO,:DESDE,:HASTA) order by fecha asc';
  IBQParteMensual.SQL.Add(query);
  if (RGTipo.ItemIndex = 0) then  // todos
    begin
     { query:='select ee.fecha as Fecha, cast (cte.nombre as varchar(50))as nombre, (te.nombre || ' + '''' + com + '''' + ' || te.apellido) as resp, '+
             '1 as Cantidad '+
             'from eve_eventos ee, cod_tipos_evento cte, tab_empleados te '+
             'where ee.tipo=cte.id_tipo_evento and ee.responsable=te.id_empleado and '+
             'ee.establecimiento=:esta and not Exists (select rge.grupo from rel_grupos_evento rge where (rge.evento = ee.id_evento)) '+
             'UNION '+
             'select ee.fecha as Fecha, cast (tg.nombre as varchar(50)) as nombre, (te.nombre || ' + '''' + com + '''' + ' || te.apellido) as resp, '+
             '(select count(*) from rel_grupos_evento rge where (rge.grupo=tg.id_grupo)) as Cantidad '+
             'from eve_eventos ee, tab_grupos tg, tab_empleados te, rel_grupos_evento rge '+
             'where ee.responsable=te.id_empleado '+
             'and ee.establecimiento=:esta and '+
             'tg.establecimiento=rge.establecimiento and '+
             'tg.id_grupo=rge.grupo and rge.evento=ee.id_evento';  }


      IBQParteMensual.ParamByName('esta').Value := fprincipal.establecimientoactual;
      //IBQAnimales.ParamByName('grupo').Value := DBLCBASeleccionGrupo.KeyValue;
    end
   else 
    if (RGTipo.ItemIndex = 1) then  // selecciono un grupo
      begin
        {query:='select ee.fecha as Fecha, cast (tg.nombre as varchar(50))as nombre, (te.nombre || ' + '''' + com + '''' + ' || te.apellido) as resp, '+
               '1 as Cantidad '+
               'from eve_eventos ee , tab_grupos tg, tab_empleados te, rel_grupos_evento rge '+
               'where ee.responsable=te.id_empleado '+
               'and ee.establecimiento=:esta and tg.establecimiento=rge.establecimiento and tg.id_grupo=:grupo and '+
               'tg.id_grupo=rge.grupo and rge.evento=ee.id_evento';

        IBQParteMensual.SQL.Add(query);}
        IBQParteMensual.ParamByName('esta').Value := fprincipal.establecimientoactual;
        if (DBLCBASeleccionGrupo.KeyValue <> null) then
          IBQParteMensual.ParamByName('grupo').Value := DBLCBASeleccionGrupo.KeyValue
         else
           IBQParteMensual.ParamByName('grupo').AsInteger := -1;
      end
    else                            // selecciono fechas
      begin
        {query:='select ee.fecha as Fecha, cast(cte.nombre as varchar(50))as nombre, (te.nombre || ' + '''' + com + '''' + ' || te.apellido) as resp, '+
               '1 as Cantidad '+
               'from eve_eventos ee, cod_tipos_evento cte, tab_animales ta, tab_empleados te '+
               'where ee.tipo=cte.id_tipo_evento and ee.responsable=te.id_empleado and '+
               'ee.establecimiento=:esta and (ee.fecha <= :hasta) and (ee.fecha >= :desde) and '+
               'not Exists (select rge.grupo from rel_grupos_evento rge where (rge.evento = ee.id_evento)) '+
               'UNION '+
               'select ee.fecha as Fecha, cast(tg.nombre as varchar(50)) as nombre, (te.nombre || ' + '''' + com + '''' + ' || te.apellido) as resp, '+
               '(select count(*) from rel_grupos_evento rge where (rge.grupo=tg.id_grupo)) as Cantidad '+
               'from eve_eventos ee, tab_grupos tg, tab_empleados te, rel_grupos_evento rge '+
               'where ee.responsable=te.id_empleado '+
               'and ee.establecimiento=:esta and '+
               'tg.establecimiento=rge.establecimiento and '+
               'tg.id_grupo=rge.grupo and rge.evento=ee.id_evento and '+
               '(ee.fecha <= :hasta) and (ee.fecha >= :desde)';
        IBQParteMensual.SQL.Add(query); }
        IBQParteMensual.ParamByName('esta').Value := fprincipal.establecimientoactual;
        IBQParteMensual.ParamByName('desde').Value := DTPADesde.DateTime;
        IBQParteMensual.ParamByName('hasta').Value := DTPAHasta.DateTime;
      end;

  IBQParteMensual.Open;
  actualizarBotones;
  cartel.cerrarcartel();
  cartel.FreeInstance(); 
end;

procedure TFREPParteMensual.actualizarBotones;
begin
{  AImprimirReporte.Enabled := not(IBQParteMensual.IsEmpty);
  BBXls.Enabled := not(IBQParteMensual.IsEmpty); }
end;

procedure TFREPParteMensual.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFREPParteMensual.AImprimirReporteExecute(Sender: TObject);
var
  cartel : TCartel;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando Reporte de Parte Mensual...');

  Application.CreateForm(TFREPParteMensualPreview, FREPParteMensualPreview);
  if (RGTipo.ItemIndex = 0) then
  begin
    FREPParteMensualPreview.QRLD.Enabled := false;
    FREPParteMensualPreview.QRLDesde.Enabled := false;
    FREPParteMensualPreview.QRLG.Enabled := true;
    FREPParteMensualPreview.QRLG.Caption := Traducir('TODOS');
    FREPParteMensualPreview.QRLGrupo.Enabled := false;
    FREPParteMensualPreview.QRLH.Enabled := false;
    FREPParteMensualPreview.QRLHasta.Enabled := false;
    FREPParteMensualPreview.QRLPeriodo.Enabled := false;
  end;
  if (RGTipo.ItemIndex = 1) then
  begin
    FREPParteMensualPreview.QRLD.Enabled := false;
    FREPParteMensualPreview.QRLDesde.Enabled := false;
    FREPParteMensualPreview.QRLG.Enabled := true;
    FREPParteMensualPreview.QRLG.Caption := Traducir('Grupo:');
    FREPParteMensualPreview.QRLGrupo.Enabled := true;
    FREPParteMensualPreview.QRLGrupo.Caption := DBLCBASeleccionGrupo.Text;
    FREPParteMensualPreview.QRLH.Enabled := false;
    FREPParteMensualPreview.QRLHasta.Enabled := false;
    FREPParteMensualPreview.QRLPeriodo.Enabled := false;
  end;
  if (RGTipo.ItemIndex = 2) then
  begin
    FREPParteMensualPreview.QRLD.Enabled := true;
    FREPParteMensualPreview.QRLDesde.Enabled := true;
    FREPParteMensualPreview.QRLG.Enabled := false;
    FREPParteMensualPreview.QRLGrupo.Enabled := false;
    FREPParteMensualPreview.QRLDesde.Caption := DateToStr(DTPADesde.Date);
    FREPParteMensualPreview.QRLHasta.Caption := DateToStr(DTPAHasta.Date);
    FREPParteMensualPreview.QRLH.Enabled := true;
    FREPParteMensualPreview.QRLHasta.Enabled := true;
    FREPParteMensualPreview.QRLPeriodo.Enabled := true;
  end;
  cartel.cerrarcartel;
  cartel.FreeInstance;

  FREPParteMensualPreview.ShowModal;
  FREPParteMensualPreview.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFREPParteMensual.DBLCBASeleccionGrupoCloseUp(Sender: TObject);
begin
  inherited;
 // actualizarFiltro;
end;

procedure TFREPParteMensual.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXlS.SaveToFile(SDXLS.FileName);
end;


procedure TFREPParteMensual.IBQParteMensualAfterOpen(DataSet: TDataSet);

begin
  inherited;


  IBQParteMensual.Last;
  IBQParteMensual.First;
  BitDBGrid1.DataSource := DSParteMensual;
  GBParteMensual.Caption := Traducir('Parte Mensual [')+IntToStr(IBQParteMensual.RecordCount)+']';
  {BBImprimirReporte.Enabled := not(IBQParteMensual.IsEmpty);
  BBXls.Enabled := not(IBQParteMensual.IsEmpty);}
  IPreview.Enabled := not(IBQParteMensual.IsEmpty);
  LPreview.Enabled := not(IBQParteMensual.IsEmpty);
  LExpExcel.Enabled := not(IBQParteMensual.IsEmpty);
  IExpExcel.Enabled := not(IBQParteMensual.IsEmpty);
end;

procedure TFREPParteMensual.DTPACloseUpFechas(Sender: TObject);
begin
  inherited;
  controlarFechas;
  //actualizarFiltro;
end;

procedure TFREPParteMensual.DTPADesdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUpFechas(Sender);
end;

procedure TFREPParteMensual.Button1Click(Sender: TObject);
begin
  inherited;
  actualizarFiltro;
end;

procedure TFREPParteMensual.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

end.
