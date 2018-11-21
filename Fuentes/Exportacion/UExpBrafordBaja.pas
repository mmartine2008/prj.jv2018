unit UExpBrafordBaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, Buttons, PngImage, jpeg, Grids, DBGrids,
  UBDBGrid, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFExpBrafordBaja = class(TFUniversal)
    PBusqueda: TPanel;
    LDesde: TLabel;
    LHasta: TLabel;
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
    GroupBox1: TGroupBox;
    BDBGGrilla: TBitDBGrid;
    DSDatosBaja: TDataSource;
    IBQDatosBaja: TIBQuery;
    IBQCantVenta: TIBQuery;
    IBQCantMuerte: TIBQuery;
    Label1: TLabel;
    LCantidades: TLabel;
    IVerAnimales: TImage;
    Label2: TLabel;
    CBPotrero: TComboBox;
    CBRodeo: TComboBox;
    CBTipoRegistro: TComboBox;
    IBQPotreros: TIBQuery;
    IBQRodeo: TIBQuery;
    IBQTiposRegistro: TIBQuery;
    procedure BMostrarDatosClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBPotreroChange(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
    procedure CBTipoRegistroChange(Sender: TObject);
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure CBTipoRegistroCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure Exportar();
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
    function ArmarFecha : string;
    procedure AlinearGrilla;

  public
    { Public declarations }
  end;

var
  FExpBrafordBaja: TFExpBrafordBaja;
  vfechaDesde, vfechaHasta : TDate;
  ruta : string;
  DelPotrero, DelRodeo, DelTipoRegistro : boolean;
  id_rodeo, id_potrero, id_tipo_reg : integer;

implementation

uses
  UPrincipal, UCartel, UMensajeHuella, UGuardarEstiloHuella, DateUtils;

{$R *.dfm}

procedure TFExpBrafordBaja.AlinearGrilla;
begin

    BDBGGrilla.Columns[0].Width := 210;
    BDBGGrilla.Columns[1].Width := 210;
    BDBGGrilla.Columns[2].Width := 210;
    BDBGGrilla.Columns[3].Width := 210;    

end;

procedure TFExpBrafordBaja.BMostrarDatosClick(Sender: TObject);
var cartel : TCartel;
begin
  inherited;

  cartel := TCartel.getInstance();
  cartel.abrircartel('Recuperando datos de bajas...');

  IBQDatosBaja.Close;
  IBQDatosBaja.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosBaja.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQDatosBaja.ParamByName('hasta').AsDate := DTPHasta.Date;

  if (id_potrero > -1) then
    IBQDatosBaja.ParamByName('potrero').AsInteger := id_potrero
  else
    IBQDatosBaja.ParamByName('potrero').Value := null;

  if (id_rodeo > -1) then
    IBQDatosBaja.ParamByName('rodeo').AsInteger := id_rodeo
  else
    IBQDatosBaja.ParamByName('rodeo').Value := null;

  if (id_tipo_reg > -1) then
    IBQDatosBaja.ParamByName('tiporeg').AsInteger := id_tipo_reg
  else
    IBQDatosBaja.ParamByName('tiporeg').Value := null;
    
  IBQDatosBaja.Open;
  IBQDatosBaja.Last;
  IBQDatosBaja.First;
{
  IBQCantVenta.Close;
  IBQCantVenta.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCantVenta.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQCantVenta.ParamByName('hasta').AsDate := DTPHasta.Date;
  IBQCantVenta.Open;

  IBQCantMuerte.Close;
  IBQCantMuerte.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCantMuerte.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQCantMuerte.ParamByName('hasta').AsDate := DTPHasta.Date;
  IBQCantMuerte.Open;
}
  LCantidades.Caption := 'Cantidad de bajas: ' + IntToStr(IBQDatosBaja.RecordCount);//'Cantidad animales vendidos: '+IntToStr(IBQCantVenta.FieldValues['cant'])+'. Cantidad de animales muertos: '+IntToStr(IBQCantMuerte.FieldValues['cant'])+'.';

  AlinearGrilla;

  cartel.cerrarcartel();
  cartel.FreeInstance;
  
end;

procedure TFExpBrafordBaja.ISalirClick(Sender: TObject);
begin
  CLose();
end;

procedure TFExpBrafordBaja.Exportar;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosBaja;
  DTXLS.Title.Text:= 'DECLARACION DE BAJAS. '+LCantidades.Caption;

  AgregarColumnaExcel(column,taLeftJustify,1800,'rp_animal','Rp Animal.',True);
  AgregarColumnaExcel(column,taLeftJustify,1800,'aba_animal','A.B.A.',True);
  AgregarColumnaExcel(column,taLeftJustify,2800,'tipo_baja','Motivo.',True);
  
end;

procedure TFExpBrafordBaja.AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
begin
    column:= TxlColumn.Create(nil);
    column:= DTXLS.Columns.Add;
    column.Alignment:= alig;
    column.ColWidth:= coldwidth;
    column.DataField:= datafield;
    column.Save:= save;
    column.Title:= title;
end;

function TFExpBrafordBaja.ArmarFecha : string;
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


procedure TFExpBrafordBaja.IExcelClick(Sender: TObject);
var F : TFGuardarEstiloHuella;
    fecha : string;
begin

  if (IBQDatosBaja.IsEmpty) then
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
          DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Bajas - '+fecha+'.xls');
          MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
      except on e: exception do
          MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
      end;
  end;
end;

procedure TFExpBrafordBaja.FormShow(Sender: TObject);
begin
  inherited;
  LTitulo.Caption := 'Declaración de bajas';

  DTPDesde.Date := IncYear(Now,-1);
  DTPHasta.Date := Now();

  DelRodeo := false;
  DelPotrero := false;
  DelTipoRegistro := false;

  id_rodeo := -1;
  id_potrero := -1;
  id_tipo_reg := -1;

  IBQPotreros.Close;
  IBQPotreros.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotreros.Open;
  IBQPotreros.First;

  CBPotrero.AddItem('POTRERO',nil);
  CBPotrero.AddItem('(TODOS)',nil);
  while not(IBQPotreros.Eof) do
  begin
       CBPotrero.AddItem(IBQPotreros.FieldValues['nombre'],nil);
       IBQPotreros.Next;
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

  IBQTiposRegistro.Close;
  IBQTiposRegistro.ParamByName('raza').AsInteger := 11;
  IBQTiposRegistro.Open;
  IBQTiposRegistro.First;

  CBTipoRegistro.AddItem('TIPO DE REGISTRO',nil);
  CBTipoRegistro.AddItem('(TODOS)',nil);
  while not(IBQTiposRegistro.Eof) do
  begin
       CBTipoRegistro.AddItem(IBQTiposRegistro.FieldValues['sinonimo'],nil);
       IBQTiposRegistro.Next;
  end;
  CBTipoRegistro.ItemIndex := 0;

  BMostrarDatosClick(Sender);

end;

procedure TFExpBrafordBaja.CBPotreroChange(Sender: TObject);
begin
  inherited;
  if ((CBPotrero.Text <> 'POTRERO') and (CBPotrero.Text <> '(TODOS)')) then
      id_potrero := IBQPotreros.Lookup('nombre',CBPotrero.Text,'id_potrero')
  else
  begin
      id_potrero := -1;
      CBPotrero.Items.Insert(0,'POTRERO');
      CBPotrero.ItemIndex := 0;
      DelPotrero := false;
  end;

end;

procedure TFExpBrafordBaja.CBRodeoChange(Sender: TObject);
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

procedure TFExpBrafordBaja.CBTipoRegistroChange(Sender: TObject);
begin
  inherited;
  if ((CBTipoRegistro.Text <> 'TIPO DE REGISTRO') and (CBTipoRegistro.Text <> '(TODOS)')) then
      id_tipo_reg := IBQTiposRegistro.Lookup('sinonimo',CBTipoRegistro.Text,'id_subcategoria')
  else
  begin
      id_tipo_reg := -1;
      CBTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
      CBTipoRegistro.ItemIndex := 0;
      DelTipoRegistro := false;
  end;

end;

procedure TFExpBrafordBaja.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPotrero) then
  begin
       CBPotrero.Items.Delete(0);
       DelPotrero := true; 
  end;

end;

procedure TFExpBrafordBaja.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRodeo) then
  begin
       CBRodeo.Items.Delete(0);
       DelRodeo := true; 
  end;

end;

procedure TFExpBrafordBaja.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoRegistro) then
  begin
       CBTipoRegistro.Items.Delete(0);
       DelTipoRegistro := true; 
  end;

end;

end.
