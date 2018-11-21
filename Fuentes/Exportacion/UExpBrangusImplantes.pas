unit UExpBrangusImplantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, Grids, DBGrids, UBDBGrid, Buttons, PngImage, jpeg,
  StdCtrls, ComCtrls, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, JvExControls,
  JvLabel, ExtCtrls, JvGIF, JvExExtCtrls, JvImage;

type
  TFExpBrangusImplantes = class(TFUniversal)
    GBFiltro: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    CBPotrero: TComboBox;
    CBRodeo: TComboBox;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    GBGrilla: TGroupBox;
    BDBGListado: TBitDBGrid;
    ImgVerAnimales: TImage;
    LVerAnimales: TLabel;
    IBQImplantes: TIBQuery;
    DSImplantes: TDataSource;
    IBQNombresRegistros: TIBQuery;
    IBQRodeo: TIBQuery;
    IBQPotrero: TIBQuery;
    CBTipoRegistro: TComboBox;
    IBQTipoRegistro: TIBQuery;
    procedure ISalirClick(Sender: TObject);
    procedure ImgVerAnimalesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBPotreroChange(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure DTPDesdeCloseUp(Sender: TObject);
    procedure DTPHastaCloseUp(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBTipoRegistroChange(Sender: TObject);
    procedure CBTipoRegistroCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure ActualizarConsulta;
    function ArmarFecha : string;
    procedure ArmarExcelImplantes();
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
  public
    { Public declarations }
  end;

var
  FExpBrangusImplantes: TFExpBrangusImplantes;
  fechaDesde, fechaHasta : TDate;
  id_rodeo, id_potrero, id_tipo_reg : integer;
  DelPotrero, DelRodeo, DelTipoRegistro : boolean;
  ruta : string;

implementation

uses
  UPrincipal, UCartel, UMensajeHuella, UGuardarEstiloHuella, DateUtils;


{$R *.dfm}

function TFExpBrangusImplantes.ArmarFecha : string;
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


procedure TFExpBrangusImplantes.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFExpBrangusImplantes.ImgVerAnimalesClick(Sender: TObject);
begin
  ActualizarConsulta;
  GBGrilla.Caption := '  Animales : '+IntToStr(IBQImplantes.RecordCount)+'  ';
end;


procedure TFExpBrangusImplantes.ActualizarConsulta;
var cartel : TCartel;
begin
  cartel := TCartel.getInstance();
  cartel.abrircartel('Cargando datos de animales...');

  IBQImplantes.Close;
  IBQImplantes.ParamByName('fecha_ini').AsDate := DTPDesde.Date;
  IBQImplantes.ParamByName('fecha_fin').AsDate := DTPHasta.Date;

  if (id_rodeo <> -1) then
    IBQImplantes.ParamByName('rodeo').AsInteger := id_rodeo
  else
    IBQImplantes.ParamByName('rodeo').Value := null;

  if (id_potrero <> -1) then
    IBQImplantes.ParamByName('potrero').AsInteger := id_potrero
  else
    IBQImplantes.ParamByName('potrero').Value := null;

  if (id_tipo_reg <> -1) then
    IBQImplantes.ParamByName('tiporeg').AsInteger := id_tipo_reg
  else
    IBQImplantes.ParamByName('tiporeg').Value := null;

  IBQImplantes.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQImplantes.Open;
  IBQImplantes.Last;
  IBQImplantes.First;

  cartel.cerrarcartel();
  cartel.FreeInstance;
  
end;


procedure TFExpBrangusImplantes.FormCreate(Sender: TObject);
begin
  inherited;

  DelPotrero := false;
  DelRodeo := false;
  DelTipoRegistro := false;

  id_potrero := -1;
  id_rodeo := -1;
  id_tipo_reg := -1;

  DTPDesde.Date := IncYear(Now,-1);
  DTPHasta.Date := Now();

end;

procedure TFExpBrangusImplantes.CBPotreroChange(Sender: TObject);
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

procedure TFExpBrangusImplantes.CBRodeoChange(Sender: TObject);
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

procedure TFExpBrangusImplantes.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRodeo) then
  begin
       CBRodeo.Items.Delete(0);
       DelRodeo := true;
  end;
end;

procedure TFExpBrangusImplantes.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPotrero) then
  begin
       CBPotrero.Items.Delete(0);
       DelPotrero := true;
  end;
end;

procedure TFExpBrangusImplantes.IExcelClick(Sender: TObject);
var F : TFGuardarEstiloHuella;
    fecha : string;
begin

  if not(IBQImplantes.IsEmpty) then
  begin
    F := TFGuardarEstiloHuella.Create(self);
    F.ShowModal;
    ruta := F.ruta;
    F.Destroy;

    if (ruta <> '') then
    try
      ArmarExcelImplantes;
      fecha := ArmarFecha;
      DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Transferencia Embrionaria - '+fecha+'.xls');
      MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
    except on e: exception do
        MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
    end;
  end
  else
      MostrarMensaje(tmInformacion,'No existen animales que cumplan con las preferencias seleccionadas.');

end;

procedure TFExpBrangusImplantes.ArmarExcelImplantes;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQImplantes;
  DTXLS.Title.Text:= 'DECLARACION DE TRANSFERENCIA EMBRIONARIA.';

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_donante','Rp Donante',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'criador_donante','Nº Criador Donante',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'ident_donante','HBA o AAB Donante',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_padre_1','Rp Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'criador_padre_1','Nº Criador Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'apodo_padre_1','Apodo Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'ident_padre_1','HBA o AAB Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_receptora','Rp Receptora',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'raza_receptora','Raza Receptora',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_implante','Fecha Implante',True);

end;

procedure TFExpBrangusImplantes.AgregarColumnaExcel(var column: TxlColumn;
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


procedure TFExpBrangusImplantes.DTPDesdeCloseUp(Sender: TObject);
begin
  inherited;

  fechadesde := DTPDesde.Date;
end;

procedure TFExpBrangusImplantes.DTPHastaCloseUp(Sender: TObject);
begin
  inherited;

  fechaHasta := DTPHasta.Date;
end;

procedure TFExpBrangusImplantes.DTPHastaChange(Sender: TObject);
begin
  inherited;

  fechaHasta := DTPHasta.Date;
end;

procedure TFExpBrangusImplantes.DTPDesdeChange(Sender: TObject);
begin
  inherited;

  fechadesde := DTPDesde.Date;
end;

procedure TFExpBrangusImplantes.FormShow(Sender: TObject);
begin
  inherited;

  IBQPotrero.Close;
  IBQPotrero.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotrero.Open;
  IBQPotrero.First;

  CBPotrero.Items.Insert(0,'POTRERO');
  CBPotrero.Items.Insert(1,'(TODOS)');
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

  CBRodeo.Items.Insert(0,'RODEO');
  CBRodeo.Items.Insert(1,'(TODOS)');
  while not(IBQRodeo.Eof)do
  begin
    CBRodeo.AddItem(IBQRodeo.FieldValues['nombre'],nil);
    IBQRodeo.Next;
  end;
  CBRodeo.ItemIndex := 0;

  IBQTipoRegistro.Close;
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

  ImgVerAnimalesClick(sender);
end;

procedure TFExpBrangusImplantes.CBTipoRegistroChange(Sender: TObject);
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

procedure TFExpBrangusImplantes.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoRegistro) then
  begin
       CBTipoRegistro.Items.Delete(0);
       DelTipoRegistro := true;
  end;

end;

end.
