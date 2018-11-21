unit UREPDGInformeNoTactadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, Grids, DBGrids, UBDBGrid, IBStoredProc,
  DataExport, DataToXLS, WinXP, DBCtrls, UDBLookupComboBoxAuto, UMensajeImpresora,
  EditAuto, PngImage, jpeg, JvGIF, JvExControls, JvLabel, ImgList,
  PngImageList, JvExExtCtrls, JvImage;

type
  TFREPDGInformeNoTactadas = class(TFUniversal)
    ASalir: TAction;
    AImprimir: TAction;
    GBAnimales: TGroupBox;
    DSNoTactadas: TDataSource;
    IBQNoTactadas: TIBQuery;
    BitDBGrid1: TBitDBGrid;
    GBFiltros: TGroupBox;
    RBTodos: TRadioButton;
    RBCategoria: TRadioButton;
    RBRodeo: TRadioButton;
    DBLCBARodeo: TDBLookupComboBoxAuto;
    DBLCBACategoria: TDBLookupComboBoxAuto;
    IBQCategorias: TIBQuery;
    DSCategorias: TDataSource;
    RGServida: TRadioGroup;
    IBQNoTactadasID_ANIMAL: TIntegerField;
    IBQNoTactadasRP_ANIMAL: TIBStringField;
    IBQNoTactadasCON_SERVICIO: TIBStringField;
    IBQNoTactadasRODEO: TIntegerField;
    IBQNoTactadasCATEGORIA: TIntegerField;
    IBQNoTactadasSERVICIO1: TIBStringField;
    IBQNoTactadasSERVICIO2: TIBStringField;
    IBQNoTactadasSERVICIO3: TIBStringField;
    IBQNoTactadasFECHA1: TDateField;
    IBQNoTactadasFECHA2: TDateField;
    IBQNoTactadasFECHA3: TDateField;
    IBQNoTactadasCANT_DIAS: TIntegerField;
    Label1: TLabel;
    EADesde: TEditAuto;
    EAHasta: TEditAuto;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
    IBQNoTactadasTIPO_REG: TIBStringField;
    IBQNoTactadasHBA: TIBStringField;
    IBQNoTactadasESTADO: TIBStringField;
    IBQNoTactadasDIAS1: TIntegerField;
    IBQNoTactadasDIAS2: TIntegerField;
    IBQNoTactadasDIAS3: TIntegerField;
    GroupBox1: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    procedure ASalirExecute(Sender: TObject);
    procedure AImprimirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBQNoTactadasAfterOpen(DataSet: TDataSet);
    procedure BitDBGrid1DblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure RBCategoriaClick(Sender: TObject);
    procedure RBRodeoClick(Sender: TObject);
    procedure IBQCategoriasAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure RBTodosClick(Sender: TObject);
    procedure DBLCBACategoriaCloseUp(Sender: TObject);
    procedure DBLCBARodeoCloseUp(Sender: TObject);
    procedure RGServidaClick(Sender: TObject);
    procedure DBLCBACategoriaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBARodeoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure IBQNoTactadasFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure EADesdeChange(Sender: TObject);
    procedure EAHastaChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    finSQL, SQLGenerico, ConServicio, Titulo, Tipo, Serv : String;
    parametro : integer;
    rodeo, categoria : Variant;
    Desde, Hasta : Integer;
    procedure ActualizarConsulta();
  public
    { Public declarations }
  end;

var
  FREPDGInformeNoTactadas: TFREPDGInformeNoTactadas;

implementation

uses UPrincipal,uTiposGlobales, UREPDGInformeNoTactadasPreview, UREPFichaAnimal, UCartel, UDMSoftvet, UTraduccion;

{$R *.dfm}

procedure TFREPDGInformeNoTactadas.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

// metodo para imprimir
procedure TFREPDGInformeNoTactadas.AImprimirExecute(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  MostrarMensajeImpresion();
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del Reporte de Animales no Tactados ...';
  cartel.abrircartel(msje);
  inherited;
  Application.CreateForm(TFREPDGInformeNoTactadasPreview, FREPDGInformeNoTactadasPreview);
  FREPDGInformeNoTactadasPreview.QRLTitulo.Caption := Titulo;
  FREPDGInformeNoTactadasPreview.QRLDesc.Caption := Tipo;
  FREPDGInformeNoTactadasPreview.QRLServ.Caption := Serv;
//  FREPDGInformeNoTactadasPreview.QRCRNoTactados.Preview;
  cartel.cerrarcartel();
  cartel.FreeInstance();
  FREPDGInformeNoTactadasPreview.ShowModal;
  HabilitarDesabilitarControles();
end;

procedure TFREPDGInformeNoTactadas.FormShow(Sender: TObject);
var  cartel: TCartel;
     msje: String;
begin
  {cartel:= TCartel.getInstance();
  msje:= 'Calculando hembras no tactadas ...';
  cartel.abrircartel(msje); }
  inherited;
 { IBQNoTactadas.Close;
  IBQNoTactadas.ParamByName('esta').Value := fprincipal.establecimientoactual;
  IBQNoTactadas.Open;}

 { cartel.cerrarcartel();
  cartel.FreeInstance(); }
  
  IBQCategorias.Close;
  IBQCategorias.Open;

  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;

end;

procedure TFREPDGInformeNoTactadas.IBQNoTactadasAfterOpen(DataSet: TDataSet);

begin
  inherited;


  IBQNoTactadas.Last;
  IBQNoTactadas.First;
  BitDBGrid1.DataSource := DSNoTactadas;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQNoTactadas.RecordCount)+']';
  {BBImprimirReporte.Enabled := not(IBQNoTactadas.IsEmpty);
  BBXls.Enabled := not(IBQNoTactadas.IsEmpty);}
  IPreview.Enabled := not(IBQNoTactadas.IsEmpty);
  LPreview.Enabled := not(IBQNoTactadas.IsEmpty);
  LExpExcel.Enabled := not(IBQNoTactadas.IsEmpty);
  IExpExcel.Enabled := not(IBQNoTactadas.IsEmpty);
end;

procedure TFREPDGInformeNoTactadas.BitDBGrid1DblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BitDBGrid1.SelectedIndex = 0 then
    if not(IBQNoTactadas.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQNoTactadas.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPDGInformeNoTactadas.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPDGInformeNoTactadas.RBCategoriaClick(Sender: TObject);
begin
  inherited;
  DBLCBACategoria.Enabled := true;
  DBLCBARodeo.Enabled := false;
  //SQLGenerico := 'select * from Get_Animales_No_Tactados (:esta,''today'') where categoria=:param and con_servicio=:s';
  //SQLGenerico := SQLGenerico+finSQL;

  if (DBLCBACategoria.KeyValue = Null) then
   DBLCBACategoria.KeyValue:= 5;

  DBLCBACategoriaCloseUp(nil);
end;

procedure TFREPDGInformeNoTactadas.RBRodeoClick(Sender: TObject);
begin
  inherited;
  DBLCBARodeo.Enabled := true;
  DBLCBACategoria.Enabled := false;
//  SQLGenerico := 'select * from Get_Animales_No_Tactados (:esta,''today'') where rodeo=:param and con_servicio=:s';
//  SQLGenerico := SQLGenerico+finSQL;

  if (DBLCBARodeo.KeyValue = Null) then
   DBLCBARodeo.KeyValue:= 0;

  DBLCBARodeoCloseUp(nil);
end;

procedure TFREPDGInformeNoTactadas.IBQCategoriasAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  IBQCategorias.Last;
  IBQCategorias.First;
end;

procedure TFREPDGInformeNoTactadas.FormCreate(Sender: TObject);
begin
  inherited;
  //finSQL := ' order by rp_animal';
  //SQLGenerico := 'select * from Get_Animales_No_Tactados (:esta,''today'') where con_servicio=:s';
  //SQLGenerico := SQLGenerico+finSQL;
  ConServicio := 'S';
  parametro := -1;
  Titulo := Traducir('Todos');
  Tipo := ' ';
  Serv := 'Si';
  rodeo := null;
  categoria := null;
  RGServidaClick(nil);
  Desde := 0;
  Hasta := 300;
  //ActualizarConsulta();
  RBTodosClick(nil);
end;

procedure TFREPDGInformeNoTactadas.RBTodosClick(Sender: TObject);
begin
  inherited;
  //SQLGenerico := 'select * from Get_Animales_No_Tactados (:esta,''today'') where con_servicio=:s';
  //SQLGenerico := SQLGenerico+finSQL;
  rodeo := null;
  categoria := null;
  parametro := -1;
  DBLCBACategoria.Enabled := false;
  DBLCBARodeo.Enabled := false;
end;

procedure TFREPDGInformeNoTactadas.ActualizarConsulta();
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Generando Informe de Hembras no Tactadas ...';
  cartel.abrircartel(msje);

  IBQNoTactadas.Close;
  {IBQNoTactadas.SQL.Clear;
  IBQNoTactadas.SQL.Add(SQLGenerico);
  if (parametro <> -1) then
    IBQNoTactadas.ParamByName('param').AsInteger := parametro;}
  IBQNoTactadas.ParamByName('rod').Value := rodeo;//ConServicio;
  IBQNoTactadas.ParamByName('cat').Value := categoria;//ConServicio;
  IBQNoTactadas.ParamByName('con_serv').Value := ConServicio;
  IBQNoTactadas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQNoTactadas.Open;

  cartel.cerrarcartel();
  cartel.FreeInstance(); 
end;

procedure TFREPDGInformeNoTactadas.DBLCBACategoriaCloseUp(Sender: TObject);
begin
  inherited;
  //SQLGenerico := 'select * from Get_Animales_No_Tactados (:esta,''today'') where categoria=:param and con_servicio=:s';
  //SQLGenerico := SQLGenerico+finSQL;

  {if (DBLCBACategoria.KeyValue = null) then
    parametro := -1
  else
    parametro := DBLCBACategoria.KeyValue;}

  rodeo := null;
  categoria := DBLCBACategoria.KeyValue;
  Titulo := Traducir('Categoría: ');
  Tipo := DBLCBACategoria.Text;
end;

procedure TFREPDGInformeNoTactadas.DBLCBARodeoCloseUp(Sender: TObject);
begin
  inherited;
  {SQLGenerico := 'select * from Get_Animales_No_Tactados (:esta,''today'') where rodeo=:param and con_servicio=:s';
  SQLGenerico := SQLGenerico+finSQL;

  if (DBLCBARodeo.KeyValue = null) then
    parametro := -1
  else
    parametro := DBLCBARodeo.KeyValue; }
  rodeo := DBLCBARodeo.KeyValue;
  categoria := null;
  Titulo := Traducir('Rodeo: ');
  Tipo := DBLCBARodeo.Text;
end;

procedure TFREPDGInformeNoTactadas.RGServidaClick(Sender: TObject);
begin
  inherited;
  if (RGServida.ItemIndex = 0) then
  begin
    //ConServicio := 'S';
    Serv := 'Si';
    IBQNoTactadas.ParamByName('ConServicio').AsString:='S';
  end
  else
  begin
    Serv := 'No';
    //ConServicio := 'N';
    IBQNoTactadas.ParamByName('ConServicio').AsString:='N';
  end;
end;

procedure TFREPDGInformeNoTactadas.DBLCBACategoriaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBACategoria.ListVisible) then
    DBLCBACategoriaCloseUp(nil);

end;

procedure TFREPDGInformeNoTactadas.DBLCBARodeoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBARodeo.ListVisible) then
    DBLCBARodeoCloseUp(nil);
end;

procedure TFREPDGInformeNoTactadas.BitDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BitDBGrid1DblClick(nil);
end;

procedure TFREPDGInformeNoTactadas.IBQNoTactadasFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if DataSet.FieldValues['CANT_DIAS'] <> null then
    Accept := (DataSet.FieldByName('CANT_DIAS').AsInteger >= Desde) and
              (DataSet.FieldByName('CANT_DIAS').AsInteger <= Hasta);
end;

procedure TFREPDGInformeNoTactadas.EADesdeChange(Sender: TObject);
begin
  inherited;
  if not TryStrToInt(EADesde.Text, Desde) then
  begin
    Desde := 0;
    EADesde.Text := '0';
  end;
end;

procedure TFREPDGInformeNoTactadas.EAHastaChange(Sender: TObject);
begin
  inherited;
  if not TryStrToInt(EAHasta.Text, Hasta) then
  begin
    Hasta := 0;
    EAHasta.Text := '0';
  end;
end;

procedure TFREPDGInformeNoTactadas.Button1Click(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFREPDGInformeNoTactadas.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

end.
