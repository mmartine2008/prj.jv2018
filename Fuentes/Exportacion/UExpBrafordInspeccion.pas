unit UExpBrafordInspeccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, Grids, DBGrids, UBDBGrid, Buttons, PngImage,
  jpeg, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFExpBrafordInspeccion = class(TFUniversal)
    Panel1: TPanel;
    BMostrarDatos: TButton;
    PDatosInspeccion: TPanel;
    GBDatosInspeccion: TGroupBox;
    BDBGGrilla: TBitDBGrid;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    DSDatosInspeccion: TDataSource;
    IBQDatosInspenccion: TIBQuery;
    IBQGetDatosAnimal: TIBQuery;
    IBQGetNombreSexo: TIBQuery;
    IBQGetTipoRegistro: TIBQuery;
    IBQPotrero: TIBQuery;
    IBQRodeo: TIBQuery;
    GroupBox1: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    CBPotrero: TComboBox;
    CBRodeo: TComboBox;
    IVerAnimales: TImage;
    Label2: TLabel;
    CBTipoRegistro: TComboBox;
    IBQTiposRegistros: TIBQuery;
    LCantAnimales: TLabel;
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure BMostrarDatosClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBPotreroChange(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure CBTipoRegistroChange(Sender: TObject);
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
  FExpBrafordInspeccion: TFExpBrafordInspeccion;
  vfechaDesde, vfechaHasta : TDate;
  ruta : string;
  hembras, machos : integer;
  DelRodeo, DelPotrero, DelTipoRegistro : boolean;
  id_rodeo, id_potrero, id_tipo_reg : integer;

implementation

uses
  UPrincipal, UCartel, UMensajeHuella, UGuardarEstiloHuella, DateUtils;

{$R *.dfm}

procedure TFExpBrafordInspeccion.DTPDesdeChange(Sender: TObject);
begin
  inherited;

  vfechaDesde := DTPDesde.Date;

end;

procedure TFExpBrafordInspeccion.DTPHastaChange(Sender: TObject);
begin
  inherited;

  vfechaHasta := DTPHasta.Date;

end;

procedure TFExpBrafordInspeccion.BMostrarDatosClick(Sender: TObject);
var cartel : TCartel;
begin
  inherited;

  cartel := TCartel.getInstance();
  cartel.abrircartel('Recuperando datos de inspección...');

  IBQDatosInspenccion.Close;
  IBQDatosInspenccion.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQDatosInspenccion.ParamByName('hasta').AsDate := DTPHasta.Date;
  IBQDatosInspenccion.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

  if (id_potrero > -1) then
    IBQDatosInspenccion.ParamByName('potrero').AsInteger := id_potrero
  else
    IBQDatosInspenccion.ParamByName('potrero').Value := null;

  if (id_rodeo > -1) then
    IBQDatosInspenccion.ParamByName('rodeo').AsInteger := id_rodeo
  else
    IBQDatosInspenccion.ParamByName('rodeo').Value := null;

  if (id_tipo_reg > -1) then
    IBQDatosInspenccion.ParamByName('tiporeg').AsInteger := id_tipo_reg
  else
    IBQDatosInspenccion.ParamByName('tiporeg').Value := null;

  IBQDatosInspenccion.Open;
  IBQDatosInspenccion.Last;
  IBQDatosInspenccion.First;

  LCantAnimales.Caption := 'Cantidad de animales: ' + IntToStr(IBQDatosInspenccion.RecordCount);

  cartel.cerrarcartel();
  cartel.FreeInstance;

end;


procedure TFExpBrafordInspeccion.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFExpBrafordInspeccion.IExcelClick(Sender: TObject);
var F : TFGuardarEstiloHuella;
    fecha : string;
begin

  if (IBQDatosInspenccion.IsEmpty) then
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
        DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Inspeccion - '+fecha+'.xls');
        MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
      except on e: exception do
         MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
      end;
  end;
end;

procedure TFExpBrafordInspeccion.Exportar;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosInspenccion;
  DTXLS.Title.Text:= 'DECLARACION DE INSPECCION.';

  AgregarColumnaExcel(column,taLeftJustify,0,'sexo_nombre','Sexo.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'tipo_reg_animal','Registro.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_animal','Rp.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_nac','Fecha Nacimiento.',True);

end;


procedure TFExpBrafordInspeccion.AgregarColumnaExcel(var column: TxlColumn;
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

function TFExpBrafordInspeccion.ArmarFecha : string;
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



procedure TFExpBrafordInspeccion.FormCreate(Sender: TObject);
begin
  LTitulo.Caption := 'Inspección de productos';


end;

procedure TFExpBrafordInspeccion.FormShow(Sender: TObject);
begin
  inherited;

  DelRodeo := false;
  DelPotrero := false;
  DelTipoRegistro := false;

  id_rodeo := -1;
  id_potrero := -1;
  id_tipo_reg := -1;

  DTPDesde.Date := IncYear(Now,-1);
  DTPHasta.Date := Now();

  hembras := 0;
  machos := 0;

  IBQPotrero.Close;
  IBQPotrero.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotrero.Open;
  IBQPotrero.First;

  CBPotrero.AddItem('POTRERO',nil);
  CBPotrero.AddItem('(TODOS)',nil);
  while not(IBQPotrero.Eof) do
  begin
       CBPotrero.AddItem(IBQPotrero.FieldValues['nombre'],nil);
       IBQPotrero.Next;
  end;
  CBPotrero.ItemIndex := 0;

  IBQRodeo.Close;
  IBQRodeo.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRodeo.Open;
  IBQRodeo.First;

  CBRodeo.AddItem('RODEO',nil);
  CBRodeo.AddItem('(TODOS)',nil);
  while not(IBQRodeo.Eof) do
  begin
       CBRodeo.AddItem(IBQRodeo.FieldValues['nombre'],nil);
       IBQRodeo.Next;
  end;
  CBRodeo.ItemIndex := 0;

  IBQTiposRegistros.Close;
  IBQTiposRegistros.ParamByName('raza').AsInteger := 11;
  IBQTiposRegistros.Open;
  IBQTiposRegistros.First;

  CBTipoRegistro.AddItem('TIPO DE REGISTRO',nil);
  CBTipoRegistro.AddItem('(TODOS)',nil);
  while not(IBQTiposRegistros.Eof) do
  begin
       CBTipoRegistro.AddItem(IBQTiposRegistros.FieldValues['sinonimo'],nil);
       IBQTiposRegistros.Next;
  end;
  CBTipoRegistro.ItemIndex := 0;

  BMostrarDatosClick(Sender);

end;

procedure TFExpBrafordInspeccion.CBPotreroChange(Sender: TObject);
begin
  inherited;

  if ((CBPotrero.Text <> 'POTRERO') and (CBPotrero.Text <> '(TODOS)')) then
      id_potrero := IBQPotrero.Lookup('nombre',CBPotrero.Text,'id_potrero')
  else
  begin
      id_potrero := -1;
      CBPotrero.Items.Insert(0,'POTRERO');
      CBPotrero.ItemIndex := 0;
      DelPotrero := false;
  end;

end;

procedure TFExpBrafordInspeccion.CBRodeoChange(Sender: TObject);
begin
  inherited;

  if ((CBRodeo.Text <> 'RODEO') and (CBRodeo.Text <> '(TODOS)')) then
      id_rodeo := IBQRodeo.Lookup('nombre',CBRodeo.Text,'id_rodeo')
  else
  begin
      id_rodeo := -1;
      CBRodeo.Items.Insert(0,'RODEO');
      CBRodeo.ItemIndex := 0;
      DelRodeo := false;
  end;

end;

procedure TFExpBrafordInspeccion.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  
  if not(DelPotrero) then
  begin
       CBPotrero.Items.Delete(0);
       DelPotrero := true; 
  end;

end;

procedure TFExpBrafordInspeccion.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelRodeo) then
  begin
       CBRodeo.Items.Delete(0);
       DelRodeo := true;
  end;

end;

procedure TFExpBrafordInspeccion.CBTipoRegistroChange(Sender: TObject);
begin
  inherited;

  if ((CBTipoRegistro.Text <> 'TIPO DE REGISTRO') and (CBTipoRegistro.Text <> '(TODOS)')) then
      id_tipo_reg := IBQTiposRegistros.Lookup('sinonimo',CBTipoRegistro.Text,'id_subcategoria')
  else
  begin
      id_tipo_reg := -1;
      CBTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
      CBTipoRegistro.ItemIndex := 0;
      DelTipoRegistro := false;
  end;

end;

procedure TFExpBrafordInspeccion.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTipoRegistro) then
  begin
       CBTipoRegistro.Items.Delete(0);
       DelTipoRegistro := true;
  end;

end;

end.
