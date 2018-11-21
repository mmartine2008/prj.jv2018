unit UExpBrangusInspeccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, Buttons, PngImage,
  jpeg, Grids, DBGrids, UBDBGrid, JvExExtCtrls, JvImage;

type
  TFExpBrangusInspeccion = class(TFUniversal)
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
    Panel1: TPanel;
    GBFiltros: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPHasta: TDateTimePicker;
    DTPDesde: TDateTimePicker;
    IBQPotrero: TIBQuery;
    IBQRodeo: TIBQuery;
    CBPotrero: TComboBox;
    CBRodeo: TComboBox;
    ImgVerAnimales: TImage;
    LVerAnimales: TLabel;
    DSDatosInspeccion: TDataSource;
    IBQDatosInspenccion: TIBQuery;
    CBTipoRegistro: TComboBox;
    IBQTipoRegistro: TIBQuery;
    procedure CBPotreroChange(Sender: TObject);
    procedure CBRodeoChange(Sender: TObject);
    procedure CBPotreroCloseUp(Sender: TObject);
    procedure CBRodeoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImgVerAnimalesClick(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPDesdeCloseUp(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure DTPHastaCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBTipoRegistroChange(Sender: TObject);
    procedure CBTipoRegistroCloseUp(Sender: TObject);
  private
    { Private declarations }
    procedure Exportar;
    function ArmarFecha : string;
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);    
  public
    { Public declarations }
  end;

var
  FExpBrangusInspeccion: TFExpBrangusInspeccion;
  id_rodeo, id_potrero, id_tipo_reg : integer;
  ruta : string;
  fechadesde, fechahasta : TDate;
  DelPotrero, DelRodeo, DelTipoReg : boolean;

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, UCartel, UMensajeHuella, UGuardarEstiloHuella, DateUtils;

procedure TFExpBrangusInspeccion.CBPotreroChange(Sender: TObject);
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

procedure TFExpBrangusInspeccion.CBRodeoChange(Sender: TObject);
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

procedure TFExpBrangusInspeccion.CBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPotrero) then
  begin
       CBPotrero.Items.Delete(0);
       DelPotrero := true;
  end;

end;

procedure TFExpBrangusInspeccion.CBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRodeo) then
  begin
       CBRodeo.Items.Delete(0);
       DelRodeo := true; 
  end;

end;

procedure TFExpBrangusInspeccion.FormCreate(Sender: TObject);
begin
  inherited;

  id_rodeo := -1;
  id_potrero := -1;
  id_tipo_reg := -1;

  DelPotrero := false;
  DelRodeo := false;
  DelTipoReg := false;

  DTPDesde.Date := IncYear(Now,-1);
  DTPHasta.Date := Now();

end;

procedure TFExpBrangusInspeccion.ImgVerAnimalesClick(Sender: TObject);
var cartel : TCartel;
begin
  cartel := TCartel.getInstance();
  cartel.abrircartel('Recuperando datos de inspección...');

  IBQDatosInspenccion.Close;
  IBQDatosInspenccion.SQL.Clear;
  IBQDatosInspenccion.SQL.Add('select * from rep_listado_inspeccion_brangus(:estable, :potrero, :rodeo, :desde, :hasta, :raza)');
  IBQDatosInspenccion.ParamByName('desde').AsDate := fechaDesde;
  IBQDatosInspenccion.ParamByName('hasta').AsDate := fechaHasta;
  IBQDatosInspenccion.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;

  if (id_potrero <> -1) then
    IBQDatosInspenccion.ParamByName('potrero').AsInteger := id_potrero
  else
    IBQDatosInspenccion.ParamByName('potrero').Value := Null;

  if (id_rodeo <> -1) then
    IBQDatosInspenccion.ParamByName('rodeo').AsInteger := id_rodeo
  else
    IBQDatosInspenccion.ParamByName('rodeo').Value := Null;

  if (id_tipo_reg <> -1) then
  begin
    IBQDatosInspenccion.SQL.Add(' where tiporeg = :tiporeg');
    IBQDatosInspenccion.ParamByName('tiporeg').AsInteger := id_tipo_reg;
  end;
  IBQDatosInspenccion.ParamByName('raza').AsInteger := 30;

  IBQDatosInspenccion.SQL.Add(' order by rp_animal');

  IBQDatosInspenccion.Open;
  IBQDatosInspenccion.Last;
  IBQDatosInspenccion.First;

  cartel.cerrarcartel();
  cartel.FreeInstance;

end;

procedure TFExpBrangusInspeccion.IExcelClick(Sender: TObject);
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
        DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Pre-Inspección - '+fecha+'.xls');
        MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
      except on e: exception do
          MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
      end;
  end;

end;

procedure TFExpBrangusInspeccion.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFExpBrangusInspeccion.Exportar;
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosInspenccion;
  DTXLS.Title.Text:= 'DECLARACION DE PRE-INSPECCION.';

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_animal','Rp',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'registro_animal','Registro',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'sexo_animal','Sexo',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'color_animal','Color',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_nac_animal','Fecha Nac.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'aab_animal','AAB',True);  

end;

procedure TFExpBrangusInspeccion.AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
begin
    column:= TxlColumn.Create(nil);
    column:= DTXLS.Columns.Add;
    column.Alignment:= alig;
    column.ColWidth:= coldwidth;
    column.DataField:= datafield;
    column.Save:= save;
    column.Title:= title;
end;


function TFExpBrangusInspeccion.ArmarFecha : string;
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

procedure TFExpBrangusInspeccion.DTPDesdeChange(Sender: TObject);
begin
  inherited;
  fechadesde := DTPDesde.Date;
end;

procedure TFExpBrangusInspeccion.DTPDesdeCloseUp(Sender: TObject);
begin
  inherited;
  fechadesde := DTPDesde.Date;
end;

procedure TFExpBrangusInspeccion.DTPHastaChange(Sender: TObject);
begin
  inherited;
  fechahasta := DTPHasta.Date;
end;

procedure TFExpBrangusInspeccion.DTPHastaCloseUp(Sender: TObject);
begin
  inherited;
  fechahasta := DTPHasta.Date;
end;

procedure TFExpBrangusInspeccion.FormShow(Sender: TObject);
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

procedure TFExpBrangusInspeccion.CBTipoRegistroChange(Sender: TObject);
begin
  inherited;

  if ((CBTipoRegistro.Text <> 'TIPO DE REGISTRO') and (CBTipoRegistro.Text <> '(TODOS)')) then
      id_tipo_reg := IBQTipoRegistro.Lookup('sinonimo',CBTipoRegistro.Text,'id_subcategoria')
  else
  begin
      id_tipo_reg := -1;
      CBTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
      CBTipoRegistro.ItemIndex := 0;
      DelTipoReg := false;
  end;

end;

procedure TFExpBrangusInspeccion.CBTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTipoReg) then
  begin
       CBTipoRegistro.Items.Delete(0);
       DelTipoReg := true;
  end;

end;

end.
