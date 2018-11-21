unit UExpBrafordVientresEmpadronar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, ComboBoxAuto, Buttons, PngImage, jpeg, Grids,
  DBGrids, UBDBGrid, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFExpBrafordVientresEmpadronar = class(TFUniversal)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    BMostrarDatos: TButton;
    PGrilla: TPanel;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    GBGrilla: TGroupBox;
    Label3: TLabel;
    LCantidad: TLabel;
    BDBGGrillaDatos: TBitDBGrid;
    DSDatosGrilla: TDataSource;
    IBQGetVientres: TIBQuery;
    IBQCategorias: TIBQuery;
    CBCategoria: TComboBox;
    CBInspeccion: TComboBox;
    IBQRegistroNombre: TIBQuery;
    IBQGetVientresRP: TIBStringField;
    IBQGetVientresFECHA_NAC: TDateField;
    IBQGetVientresFECHA_EVE: TDateField;
    IBQGetVientresRegistro: TStringField;
    IBQGetVientresSUBCATEGORIA: TIntegerField;
    IBQTiposInspeccion: TIBQuery;
    IVerAnimales: TImage;
    Label4: TLabel;
    CBTipoRegistro: TComboBox;
    IBQTipoRegistro: TIBQuery;
    procedure BMostrarDatosClick(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBQGetVientresCalcFields(DataSet: TDataSet);
    procedure ISalirClick(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure CBInspeccionChange(Sender: TObject);
    procedure CBCategoriaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBTipoRegistroChange(Sender: TObject);
    procedure CBCategoriaCloseUp(Sender: TObject);
    procedure CBInspeccionCloseUp(Sender: TObject);
    procedure CBTipoRegistroCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure Exportar();
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
    function ArmarFecha : string;

  public
    { Public declarations }
  end;

var
  FExpBrafordVientresEmpadronar: TFExpBrafordVientresEmpadronar;
  id_categoria, id_inspeccion, id_tipo_reg : integer;
  DelInspeccion, DelCategoria, DelTipoRegistro : boolean;
  vfechaDesde, vfechaHasta : TDate;
  ruta, consultaGral : string;
  
implementation

uses
  UPrincipal, UCartel, UMensajeHuella, UGuardarEstiloHuella, DateUtils;


{$R *.dfm}

procedure TFExpBrafordVientresEmpadronar.BMostrarDatosClick(Sender: TObject);
var cartel : TCartel;
begin

   cartel := TCartel.getInstance();
   cartel.abrircartel('Recuperando datos de bajas...');

   IBQGetVientres.Close;
   IBQGetVientres.SQL.Clear;
   IBQGetVientres.SQL.Add(consultaGral);

   if (id_categoria <> -1) then
   begin
      IBQGetVientres.SQL.Add(' and (ta.categoria = :catego)');
      IBQGetVientres.ParamByName('catego').AsInteger := id_categoria;
   end;

   if (id_inspeccion <> -1) then
   begin
      IBQGetVientres.SQL.Add(' and (ta.inspeccion = :inspec)');
      IBQGetVientres.ParamByName('inspec').AsInteger := id_inspeccion;
   end;

   if (id_tipo_reg <> -1) then
   begin
      IBQGetVientres.SQL.Add(' and (ta.subcategoria = :tiporeg)');
      IBQGetVientres.ParamByName('tiporeg').AsInteger := id_tipo_reg;
   end;

   IBQGetVientres.ParamByName('desde').AsDate := DTPDesde.Date;
   IBQGetVientres.ParamByName('hasta').AsDate := DTPHasta.Date;
   IBQGetVientres.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;

   IBQGetVientres.Open;
   IBQGetVientres.Last;
   IBQGetVientres.First;

   LCantidad.Caption := '  Animales: ' + IntToStr(IBQGetVientres.RecordCount);

   cartel.cerrarcartel();
   cartel.FreeInstance;

end;

procedure TFExpBrafordVientresEmpadronar.DTPDesdeChange(Sender: TObject);
begin
  vfechaDesde := DTPDesde.Date;
end;
 
procedure TFExpBrafordVientresEmpadronar.DTPHastaChange(Sender: TObject);
begin
  vfechaHasta := DTPHasta.Date;
end;

procedure TFExpBrafordVientresEmpadronar.FormShow(Sender: TObject);
var cons1, cons2, cons3, cons4, cons5 : string;
begin

  DelCategoria := false;
  DelInspeccion := false;
  DelTipoRegistro := false;

  id_categoria := -1;
  id_inspeccion := -1;
  id_tipo_reg := -1;

  DTPDesde.Date := IncYear(Now,-1);
  DTPHasta.Date := Now();

//  cons1 := 'select distinct ta.id_rp as rp, ta.fecha_nacimiento as fecha_nac, ee.fecha as fecha_eve, ta.subcategoria as subcategoria ';
//  cons2 := 'from eve_eventos ee join tab_animales ta on (ee.animal = ta.id_animal) where (ee.fecha >= :desde) and (ee.fecha <= :hasta) and (ee.tipo = 44) ';
//  cons3 := 'and (ta.establecimiento = :esta) and (ta.inspeccion is not null)';

  cons1 := 'select distinct ta.id_rp as rp, ta.fecha_nacimiento as fecha_nac, ee.fecha as fecha_eve, ta.subcategoria as subcategoria, ta.raza ';
  cons2 := 'from eve_eventos ee join tab_animales ta on (ee.animal = ta.id_animal) ';
  cons3 := 'where (ee.fecha >= :desde) and (ee.fecha <= :hasta) and (ee.tipo = 44) and (ta.raza = 11) ';
  cons4 := 'and (ta.establecimiento = :esta) and (ta.inspeccion is not null) ';
  cons5 := 'and ((ta.categoria = 4) or (ta.categoria = 5) or (ta.categoria = 6))';

  consultaGral := cons1+cons2+cons3+cons4+cons5;

  IBQCategorias.Close;
  IBQCategorias.Open;
  IBQCategorias.First;

  CBCategoria.AddItem('CATEGORIA',nil);
  CBCategoria.AddItem('(TODAS)',nil);
  while not(IBQCategorias.Eof) do
  begin
      CBCategoria.AddItem(IBQCategorias.FieldValues['nombre'],nil);
      IBQCategorias.Next;
  end;
  CBCategoria.ItemIndex := 0;

  IBQTiposInspeccion.Close;
  IBQTiposInspeccion.Open;
  IBQTiposInspeccion.First;

  CBInspeccion.AddItem('TIPO DE INSPECCION',nil);
  CBInspeccion.AddItem('(TODOS)',nil);
  while not(IBQTiposInspeccion.Eof) do
  begin
      CBInspeccion.AddItem(IBQTiposInspeccion.FieldValues['nombre'],nil);
      IBQTiposInspeccion.Next;
  end;
  CBInspeccion.ItemIndex := 0;

  IBQTipoRegistro.Close;
  IBQTipoRegistro.ParamByName('raza').AsInteger := 11;
  IBQTipoRegistro.Open;
  IBQTipoRegistro.First;

  CBTipoRegistro.AddItem('TIPO DE REGISTRO',nil);
  CBTipoRegistro.AddItem('(TODOS)',nil);
  while not(IBQTipoRegistro.Eof) do
  begin
      CBTipoRegistro.AddItem(IBQTipoRegistro.FieldValues['sinonimo'],nil);
      IBQTipoRegistro.Next;
  end;
  CBTipoRegistro.ItemIndex := 0;

  BMostrarDatosClick(Sender);

end;

procedure TFExpBrafordVientresEmpadronar.IBQGetVientresCalcFields(DataSet: TDataSet);
begin

  IBQRegistroNombre.Close;
  IBQRegistroNombre.ParamByName('id_subcate').AsInteger := DataSet.FieldValues['subcategoria'];
  IBQRegistroNombre.Open;

  IBQGetVientresRegistro.Value := IBQRegistroNombre.FieldValues['nombre'];

end;

procedure TFExpBrafordVientresEmpadronar.ISalirClick(Sender: TObject);
begin
    Close();
end;

procedure TFExpBrafordVientresEmpadronar.Exportar;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQGetVientres;
  DTXLS.Title.Text:= 'VIENTRES A EMPADRONAR.';

  AgregarColumnaExcel(column,taLeftJustify,0,'rp','Rp animal.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'registro','Registro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_nac','Fecha Nacimiento.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_eve','Fecha Inspección.',True);

end;


procedure TFExpBrafordVientresEmpadronar.AgregarColumnaExcel(var column: TxlColumn;
  alig: TAlignment; coldwidth: Integer; datafield, title: String;
  save: Boolean);
begin
    column:= TxlColumn.Create(nil);
    column:= DTXLS.Columns.Add;
    column.Alignment:= alig;
    column.ColWidth:= coldwidth;
    column.DataField:= datafield;
    column.Save:= save;
    column.Title:= title;
end;

function TFExpBrafordVientresEmpadronar.ArmarFecha : string;
var dia, mes, anio : Word;
    d, m : string;
begin

  DecodeDate(now(), anio, mes, dia);

  if (length(IntToStr(dia)) = 1) then
      d := '0'+IntToStr(dia)
  else
      d := IntToStr(dia);

  if (length(IntToStr(mes)) = 1) then
      m := '0'+IntToStr(mes)
  else
      m := IntToStr(mes);

  Result := d+'-'+m+'-'+IntToStr(anio);

end;


procedure TFExpBrafordVientresEmpadronar.IExcelClick(Sender: TObject);
var F : TFGuardarEstiloHuella;
    fecha : string;
begin

  if (IBQGetVientres.IsEmpty) then
    MostrarMensaje(tmInformacion,'No existen animales que cumplan con las preferencias seleccionadas.')
  else
  begin
      F := TFGuardarEstiloHuella.Create(self);
      F.ShowModal;
      ruta := F.ruta;
      F.Destroy;

      if (ruta <> '') then
      try
        Exportar();
        fecha := ArmarFecha;
        DTXLS.SaveToFile(ruta+'\Planilla Vientres a empadronar - '+fecha+'.xls');
        MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
      except on e: exception do
          MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
      end;
  end;
end;

procedure TFExpBrafordVientresEmpadronar.CBInspeccionChange(Sender: TObject);
begin

  if ((CBInspeccion.Text <> 'TIPO DE INSPECCION') and (CBInspeccion.Text <> '(TODOS)')) then
      id_inspeccion := IBQTiposInspeccion.Lookup('nombre',CBInspeccion.Text,'id_inspeccion')
  else
  begin
      id_inspeccion := -1;
      CBInspeccion.Items.Insert(0,'TIPO DE INSPECCION');
      CBInspeccion.ItemIndex := 0;
      DelInspeccion := false;
  end;
  
end;

procedure TFExpBrafordVientresEmpadronar.CBCategoriaChange(Sender: TObject);
begin

  if ((CBCategoria.Text <> 'CATEGORIA') and (CBCategoria.Text <> '(TODAS)')) then
      id_categoria := IBQCategorias.Lookup('nombre',CBCategoria.Text,'id_categoria')
  else
  begin
      id_categoria := -1;
      CBCategoria.Items.Insert(0,'CATEGORIA');
      CBCategoria.ItemIndex := 0;
      DelCategoria := false;
  end;

end;

procedure TFExpBrafordVientresEmpadronar.FormCreate(Sender: TObject);
begin
  LTitulo.Caption := 'Vientres Adultos a Empadronar';

  DTPDesde.Date := IncYear(Now,-1);
  DTPHasta.Date := Now();

end;

procedure TFExpBrafordVientresEmpadronar.CBTipoRegistroChange(Sender: TObject);
begin
  inherited;

  if ((CBTipoRegistro.Text <> 'TIPO DE REGISTRO') and (CBTipoRegistro.Text <> '(TODOS)')) then
      id_tipo_reg := IBQTipoRegistro.Lookup('sinonimo',CBTipoRegistro.Text,'id_subcategoria')
  else
  begin
      id_tipo_reg := -1;
      CBTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
      CBTipoRegistro.ItemIndex := 0;
      DelTipoRegistro := false;
  end;

end;

procedure TFExpBrafordVientresEmpadronar.CBCategoriaCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelCategoria) then
  begin
       CBCategoria.Items.Delete(0);
       DelCategoria := true;
  end;

end;

procedure TFExpBrafordVientresEmpadronar.CBInspeccionCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelInspeccion) then
  begin
       CBInspeccion.Items.Delete(0);
       DelInspeccion := true;
  end;

end;

procedure TFExpBrafordVientresEmpadronar.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTipoRegistro) then
  begin
       CBTipoRegistro.Items.Delete(0);
       DelTipoRegistro := true;
  end;

end;

end.
