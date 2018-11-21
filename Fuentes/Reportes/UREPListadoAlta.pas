unit UREPListadoAlta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  Menus, DB, Grids, DBGrids, IBCustomDataSet, IBQuery, IBStoredProc, WinXP,
  DataExport, DataToXLS, DBClient, DBLocal, DBLocalI, JvThread,
  JvComponentBase, JvThreadDialog, UMensajeImpresora,
  PngImage, jpeg, JvGIF, JvExControls, JvLabel, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type

  TFREPListadoAlta = class(TFUniversal)
    ACSalir: TAction;
    PopupMenu1: TPopupMenu;
    Salir1: TMenuItem;
    PBotones: TPanel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    DataSource1: TDataSource;
    IBQConsultaAltas: TIBQuery;
    PTop: TPanel;
    GBSeleccionFechas: TGroupBox;
    FLALabelHasta: TLabel;
    FLALabelDesde: TLabel;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    GBDatos: TGroupBox;
    FLALabelCantidadMachos: TLabel;
    FLALabelCantidadHembras: TLabel;
    IBQaux: TIBQuery;
    ACPreviewReporte: TAction;
    BBAyuda: TBitBtn;
    IBQConsultaAltasFECHA_NACIMIENTO: TDateField;
    IBQConsultaAltasRP: TIBStringField;
    IBQConsultaAltasESTADO_REPRODUCTIVO: TIBStringField;
    IBQConsultaAltasCRONOLOGIA_DENTARIA: TIBStringField;
    IBQConsultaAltasGDR: TIBStringField;
    IBQConsultaAltasVALORCONDICION: TIBStringField;
    IBQConsultaAltasESTADO_LACTACION: TIntegerField;
    IBQConsultaAltasFECHA_ALTA: TDateField;
    IBQConsultaAltasID_ANIMAL: TIntegerField;
    IBQConsultaAltasDTA: TIBStringField;
    BBXls: TBitBtn;
    GBAnimales: TGroupBox;
    DBGrid1: TDBGrid;
    IBQConsultaAltasPRECIO_BRUTO: TIBBCDField;
    IBQConsultaAltasORIGEN: TIBStringField;
    IBQConsultaAltasPESO: TFloatField;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    LExpExcel: TLabel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    procedure actualizarQuery;
    procedure cuantosMachosYHembras;
    procedure FormShow(Sender: TObject);
    procedure ACSalirExecute(Sender: TObject);
    procedure ACPreviewReporteExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure IBQConsultaAltasAfterOpen(DataSet: TDataSet);
    procedure IBQConsultaAltasESTADO_LACTACIONSetText(Sender: TField;
      const Text: String);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    { Private declarations }
    procedure cargarIBQ(sexo:Integer; var cantidad:Integer);
    procedure controlarFechas;

  public
    { Public declarations }
    function getCantHembras():Integer;
    function getCantMachos():Integer;
  end;

var
  FREPListadoAlta: TFREPListadoAlta;
  CantMachos, CantHembras: Integer;
implementation

uses UPrincipal,uTiposGlobales, URepListadoAltaPreview, UREPHistorialAnimalPreview, UREPFichaAnimal,
     UCartel, UTraduccion;
{$R *.dfm}

// configuro el formulario
procedure TFREPListadoAlta.FormShow(Sender: TObject);
begin
  inherited;
  self.Caption := Traducir('Huella - Listado de Alta');
  PTitulo.Caption := Traducir('Listado de Alta');
  DTPHasta.DateTime := Now;
  DTPDesde.DateTime := DTPHasta.DateTime - 365;
  CantMachos:= 0;
  CantHembras := 0;
end;

// metodo de la accion salir
procedure TFREPListadoAlta.ACSalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close;
end;

// metodo que actualiza el query cuando se selecciona una fecha nueva
procedure TFREPListadoAlta.controlarFechas;
begin
  if(DTPHasta.Date > now) then
    DTPHasta.Date:=now;
  if(DTPDesde.Date >= DTPHasta.Date) then
    DTPDesde.Date:= DTPHasta.Date;
end;

// parametrizo la consulta de los animales y actualizo la grilla
procedure TFREPListadoAlta.actualizarQuery;
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Cargando Listado de Altas ...';
  cartel.abrircartel(msje);

  IBQConsultaAltas.Active := false;
  IBQConsultaAltas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQConsultaAltas.ParamByName('desde').AsDateTime := DTPDesde.DateTime;
  IBQConsultaAltas.ParamByName('hasta').AsDateTime := DTPHasta.DateTime;
  IBQConsultaAltas.Active := true;
  cuantosMachosYHembras;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFREPListadoAlta.cargarIBQ(sexo:Integer; var cantidad:Integer);
begin
  IBQaux.Active := false;
  IBQaux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQaux.ParamByName('n').AsInteger := sexo;
  IBQaux.ParamByName('desde').AsDateTime := DTPDesde.DateTime;
  IBQaux.ParamByName('hasta').AsDateTime := DTPHasta.DateTime;
  IBQaux.Active := true;
  
  cantidad := IBQaux.fieldByName('cantidad').AsInteger;
end;

procedure TFREPListadoAlta.cuantosMachosYHembras;
begin
  // cuantas hembras
  cargarIBQ(2,CantHembras);
  FLALabelCantidadHembras.Caption := Traducir('Hembras: ')+ IntToStr(CantHembras);

  // cuantos Machos
  cargarIBQ(1,CantMachos);
  FLALabelCantidadMachos.Caption := Traducir('Machos: ')+ IntToStr(CantMachos);

end;

procedure TFREPListadoAlta.ACPreviewReporteExecute(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando Reporte de Listado de Altas ...';
  cartel.abrircartel(msje);

  MostrarMensajeImpresion();
  inherited;
  Application.CreateForm(TFREPListadoAltaPreview, FREPListadoAltaPreview);
  FREPListadoAltaPreview.Configurar(DTPdesde.DateTime, dtphasta.DateTime);

  cartel.cerrarcartel();
  cartel.FreeInstance();

  FREPListadoAltaPreview.ShowModal;
  FREPListadoAltaPreview.Destroy;
  HabilitarDesabilitarControles();
end;

procedure TFREPListadoAlta.DBGrid1DblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (DBGrid1.SelectedIndex = 0) then
    if not(IBQConsultaAltas.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQConsultaAltas.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
//  HabilitarDesabilitarControles();     
end;

procedure TFREPListadoAlta.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

function TFREPListadoAlta.getCantHembras: Integer;
begin
  Result:= CantHembras;
end;

function TFREPListadoAlta.getCantMachos: Integer;
begin
  Result:= CantMachos;
end;

procedure TFREPListadoAlta.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key=#13) then
    DBGrid1DblClick(nil);
end;

procedure TFREPListadoAlta.IBQConsultaAltasAfterOpen(DataSet: TDataSet);

begin
  inherited;
  IBQConsultaAltas.Last;
  IBQConsultaAltas.First;
  DBGrid1.DataSource := DataSource1;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQConsultaAltas.RecordCount)+']';
  {ACPreviewReporte.Enabled := not(IBQConsultaAltas.IsEmpty);
  BBXls.Enabled := not(IBQConsultaAltas.IsEmpty);}
  IPreview.Enabled := not(IBQConsultaAltas.IsEmpty);
  LPreview.Enabled := not(IBQConsultaAltas.IsEmpty);
  LExpExcel.Enabled := not(IBQConsultaAltas.IsEmpty);
  IExpExcel.Enabled := not(IBQConsultaAltas.IsEmpty);
end;

procedure TFREPListadoAlta.IBQConsultaAltasESTADO_LACTACIONSetText(
  Sender: TField; const Text: String);
begin
  inherited;
  if Sender.Value <> null then
    if Sender.AsInteger = -1 then
      Sender.Value := null;
end;

procedure TFREPListadoAlta.Button1Click(Sender: TObject);
begin
  inherited;
  controlarFechas;
  actualizarQuery;
end;

procedure TFREPListadoAlta.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

end.
