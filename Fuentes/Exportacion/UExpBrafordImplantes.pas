unit UExpBrafordImplantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, Grids, DBGrids, UBDBGrid, Buttons, PngImage,
  jpeg, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFExpBrafordImplantes = class(TFUniversal)
    GBFiltro: TGroupBox;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DSImplantes: TDataSource;
    IBQImplantes: TIBQuery;
    BMostrarImplantes: TButton;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    IBQImplantesID_RECEPTORA: TIntegerField;
    IBQImplantesRP_RECEPTORA: TIBStringField;
    IBQImplantesCATEGORIA_RECEPTORA: TIBStringField;
    IBQImplantesRAZA_RECEPTORA: TIBStringField;
    IBQImplantesFECHA_IMPLANTE: TDateField;
    IBQImplantesFECHA_COLECTA: TDateField;
    IBQImplantesCENTRO_TRANSPLANTE: TIBStringField;
    IBQImplantesID_DONANTE: TIntegerField;
    IBQImplantesMINT: TIBStringField;
    IBQImplantesRP_DONANTE: TIBStringField;
    IBQImplantesHBA_DONANTE: TIBStringField;
    IBQImplantesNOMBRE_DONANTE: TIBStringField;
    IBQImplantesID_PADRE_1: TIntegerField;
    IBQImplantesEXT1: TIBStringField;
    IBQImplantesRP_PADRE_1: TIBStringField;
    IBQImplantesHBA_PADRE_1: TIBStringField;
    IBQImplantesNOMBRE_PADRE_1: TIBStringField;
    IBQImplantesID_PADRE_2: TIntegerField;
    IBQImplantesEXT2: TIBStringField;
    IBQImplantesRP_PADRE_2: TIBStringField;
    IBQImplantesHBA_PADRE_2: TIBStringField;
    IBQImplantesNOMBRE_PADRE_2: TIBStringField;
    IBQImplantesFECHA_TACTO: TDateField;
    IBQImplantesDIAG_GESTACION: TIBStringField;
    IBQImplantesDIAS_GESTACION_TACTO: TIntegerField;
    IBQImplantesDIAS_GESTACION_ACTUAL: TIntegerField;
    IBQImplantesEST_REP: TIntegerField;
    IBQImplantesFECHA_PARTO: TDateField;
    IBQImplantesFECHA_PROB_PARTO: TDateField;
    IBQImplantesID_CRIA_1: TIntegerField;
    IBQImplantesRP_CRIA_1: TIBStringField;
    IBQImplantesHBA_CRIA_1: TIBStringField;
    IBQImplantesNOMBRE_CRIA_1: TIBStringField;
    IBQImplantesSEXO_1: TIBStringField;
    IBQImplantesID_CRIA_2: TIntegerField;
    IBQImplantesRP_CRIA_2: TIBStringField;
    IBQImplantesHBA_CRIA_2: TIBStringField;
    IBQImplantesNOMBRE_CRIA_2: TIBStringField;
    IBQImplantesSEXO_2: TIBStringField;
    IBQImplantesID_CRIA_3: TIntegerField;
    IBQImplantesRP_CRIA_3: TIBStringField;
    IBQImplantesHBA_CRIA_3: TIBStringField;
    IBQImplantesNOMBRE_CRIA_3: TIBStringField;
    IBQImplantesSEXO_3: TIBStringField;
    IBQImplantesREGISTRO_RECEP: TStringField;
    IBQNombresRegistros: TIBQuery;
    CBPotrero: TComboBox;
    CBRodeo: TComboBox;
    IBQRodeo: TIBQuery;
    IBQPotrero: TIBQuery;
    Panel1: TPanel;
    GBGrilla: TGroupBox;
    BDBGListado: TBitDBGrid;
    Label3: TLabel;
    IVerAnimales: TImage;
    IBQTiposRegistros: TIBQuery;
    CBTipoRegistro: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure BMostrarImplantesClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure IBQImplantesCalcFields(DataSet: TDataSet);
    procedure CBPotreroChange(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure CBTipoRegistroChange(Sender: TObject);
    procedure CBTipoRegistroCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AjustarGrilla();
    procedure ArmarExcelImplantes();
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
    function ArmarFecha() : string;
    procedure ActualizarConsulta;
  public
    { Public declarations }
  end;

var
  FExpBrafordImplantes: TFExpBrafordImplantes;
  fechaDesde, fechaHasta : TDate;
  id_rodeo, id_potrero, id_tipo_reg : integer;
  DelPotrero, DelRodeo, DelTipoRegistro : boolean;
  ruta : string;

implementation

uses
  UPrincipal, UCartel, UMensajeHuella, UGuardarEstiloHuella, DateUtils;

{$R *.dfm}

function TFExpBrafordImplantes.ArmarFecha : string;
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

procedure TFExpBrafordImplantes.FormCreate(Sender: TObject);
begin
  LTitulo.Caption := 'Exportar Datos de Implantes';

  id_rodeo := -1;
  id_potrero := -1;
  id_tipo_reg := -1;

  DelPotrero := false;
  DelRodeo := false;
  DelTipoRegistro := false;

  DTPDesde.Date := IncYear(Now,-1);
  DTPHasta.Date := Now();

  IBQPotrero.Close;
  IBQPotrero.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotrero.Open;
  IBQPotrero.First;

  CBPotrero.AddItem('POTREROS',nil);
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
  while not(IBQRodeo.Eof)do
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

  AjustarGrilla;

end;



procedure TFExpBrafordImplantes.DTPDesdeChange(Sender: TObject);
begin

  fechaDesde := DTPDesde.Date;

end;

procedure TFExpBrafordImplantes.DTPHastaChange(Sender: TObject);
begin

  fechaHasta := DTPHasta.Date;

end;

procedure TFExpBrafordImplantes.ActualizarConsulta;
var cartel : TCartel;
begin

  cartel := TCartel.getInstance();
  cartel.abrircartel('Recuperando datos de implantes...');

  IBQImplantes.Close;
  IBQImplantes.ParamByName('fecha_ini').AsDate := DTPDesde.Date;
  IBQImplantes.ParamByName('fecha_fin').AsDate := DTPHasta.Date;
  IBQImplantes.ParamByName('grupo').Value := null;

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

procedure TFExpBrafordImplantes.BMostrarImplantesClick(Sender: TObject);
begin
  ActualizarConsulta;

  GBGrilla.Caption := ' Animales['+IntToStr(IBQImplantes.RecordCount)+'] ';
end;

procedure TFExpBrafordImplantes.ISalirClick(Sender: TObject);
begin

  Close();

end;

procedure TFExpBrafordImplantes.IExcelClick(Sender: TObject);
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
      DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Implante Embrionario - '+fecha+'.xls');
      MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
    except on e: exception do
         MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
    end;
  end
  else
      MostrarMensaje(tmInformacion,'No existen animales que cumplan con las preferencias seleccionadas.');
end;

procedure TFExpBrafordImplantes.ArmarExcelImplantes;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQImplantes;
  DTXLS.Title.Text:= 'DECLARACION DE IMPLANTE EMBRIONARIO.';

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_receptora','Caravana.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_receptora','Rp Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'registro_recep','Reg.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'raza_receptora','Raza.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'categoria_receptora','VC/VQ.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'diag_gestacion','Diag. Preñez.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_implante','Fecha de Implante.',True);

end;

procedure TFExpBrafordImplantes.AgregarColumnaExcel(var column: TxlColumn;
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

procedure TFExpBrafordImplantes.IBQImplantesCalcFields(DataSet: TDataSet);
begin

  IBQNombresRegistros.Close;
  IBQNombresRegistros.ParamByName('id_animal').AsInteger := IBQImplantes.FieldValues['id_receptora'];
  IBQNombresRegistros.Open;
  IBQImplantesREGISTRO_RECEP.Value := IBQNombresRegistros.FieldValues['nombre'];

end;

procedure TFExpBrafordImplantes.CBPotreroChange(Sender: TObject);
begin

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

procedure TFExpBrafordImplantes.CBRodeoChange(Sender: TObject);
begin
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

procedure TFExpBrafordImplantes.AjustarGrilla;
begin
{
  BDBGListado.Columns[0].Width := 100;
  BDBGListado.Columns[1].Width := 100;
  BDBGListado.Columns[2].Width := 100;
  BDBGListado.Columns[3].Width := 100;
  BDBGListado.Columns[4].Width := 100;
  BDBGListado.Columns[5].Width := 100;
  BDBGListado.Columns[6].Width := 100;
  BDBGListado.Columns[7].Width := 100;
  BDBGListado.Columns[8].Width := 100;
  BDBGListado.Columns[9].Width := 100;
  BDBGListado.Columns[10].Width := 100;
  BDBGListado.Columns[11].Width := 100;
  BDBGListado.Columns[12].Width := 80;
}
end;

procedure TFExpBrafordImplantes.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPotrero) then
  begin
       CBPotrero.Items.Delete(0);
       DelPotrero := true; 
  end;

end;

procedure TFExpBrafordImplantes.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRodeo) then
  begin
       CBRodeo.Items.Delete(0);
       DelRodeo := true; 
  end;

end;

procedure TFExpBrafordImplantes.CBTipoRegistroChange(Sender: TObject);
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

procedure TFExpBrafordImplantes.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoRegistro) then
  begin
       CBTipoRegistro.Items.Delete(0);
       DelTipoRegistro := true; 
  end;

end;

procedure TFExpBrafordImplantes.FormShow(Sender: TObject);
begin
  inherited;
  
  ActualizarConsulta;
end;

end.
