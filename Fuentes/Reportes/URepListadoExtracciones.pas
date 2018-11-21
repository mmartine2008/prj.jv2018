unit URepListadoExtracciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, PngImage, Grids,
  DBGrids, UBDBGrid, jpeg, JvExExtCtrls, JvImage;

type
  TFRepListadoExtracciones = class(TFUniversal)
    PFiltros: TPanel;
    GBFiltros: TGroupBox;
    LBuscar: TLabel;
    LDesde: TLabel;
    LHasta: TLabel;
    IBuscarPartida: TImage;
    Label1: TLabel;
    Image1: TImage;
    EBuscar: TEdit;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    EBuscarPartida: TEdit;
    PCliente: TPanel;
    GBDetalle: TGroupBox;
    BDBGDetalle: TBitDBGrid;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IPreview: TImage;
    LPreview: TLabel;
    DSListadoExtracciones: TDataSource;
    IBQListadoExtracciones: TIBQuery;
    IBQChequearEvento: TIBQuery;
    CBTipoAlta: TComboBox;
    IBQTipoAlta: TIBQuery;
    IBQParametroDeTerceros: TIBQuery;
    IExcel: TImage;
    LExcel: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DTPDesdeCloseUp(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure DTPHastaCloseUp(Sender: TObject);
    procedure EBuscarChange(Sender: TObject);
    procedure EBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure IPreviewClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IBuscarPartidaClick(Sender: TObject);
    procedure BDBGDetalleDblClick(Sender: TObject);
    procedure BDBGDetalleTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure CBTipoAltaChange(Sender: TObject);
    procedure CBTipoAltaCloseUp(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
  private
    orden_consulta, columna_anterior : String;
    id_tipo_alta : Integer;
    DelTipoAlta : Boolean;
    procedure ActualizarConsulta;
    procedure CargarCombos;
  public
    { Public declarations }
  end;

var
  FRepListadoExtracciones: TFRepListadoExtracciones;
  busqueda : boolean;

implementation

{$R *.dfm}

uses UPrincipal,uTiposGlobales, URepListadoExtraccionesPreview, UEveExtraccionSemen, UMensajeHuella,
  StdConvs;

procedure TFRepListadoExtracciones.FormShow(Sender: TObject);
begin
  inherited;

  busqueda := false;

  id_tipo_alta := -1;
  DelTipoAlta := false;

  DTPDesde.Date := Now() - 365;
  DTPHasta.Date := Now();

  ActualizarConsulta;

  orden_consulta := ' order by fecha_movimiento';
  columna_anterior := '';

  CargarCombos;
end;

procedure TFRepListadoExtracciones.CargarCombos;
var
  i : Integer;
begin
  IBQTipoAlta.Close;
  IBQTipoAlta.Open;
  IBQTipoAlta.First;
  CBTipoAlta.Items.Clear;
  CBTipoAlta.Items.Insert(0,'TIPO DE ALTA');
  CBTipoAlta.Items.Insert(1,'(TODOS)');
  i := 2;
  while not IBQTipoAlta.Eof do
  begin
    CBTipoAlta.Items.Insert(i,IBQTipoAlta.FieldValues['NOMBRE']);
    Inc(i);
    IBQTipoAlta.Next;
  end;
  CBTipoAlta.ItemIndex := 0;
  CBTipoAlta.DropDownCount := i;
end;

procedure TFRepListadoExtracciones.ActualizarConsulta;
var cadena, sql : string;
begin

  sql := 'select * from rep_listado_extracciones(:desde,:hasta,:esta) where ((venta = ''N'') or (venta is null))';

  IBQListadoExtracciones.Close;
  IBQListadoExtracciones.SQL.Clear;

  cadena := '';
  if (busqueda) then
  begin
    if (AnsiPos('where',sql) <> 0) then
      cadena := ' and ((rp_toro like ''%'+EBuscar.Text+'%'') or (hba_toro like ''%'+EBuscar.Text+'%'') or (nombre_toro like ''%'+EBuscar.Text+'%'') or (apodo_toro like ''%'+EBuscar.Text+'%''))'
    else
      cadena := ' where ((rp_toro like ''%'+EBuscar.Text+'%'') or (hba_toro like ''%'+EBuscar.Text+'%'') or (nombre_toro like ''%'+EBuscar.Text+'%'')  or (apodo_toro like ''%'+EBuscar.Text+'%''))'
  end;
  sql := sql + cadena;
  cadena := '';

  if id_tipo_alta <> -1 then
  begin
    if AnsiPos('where',sql) <> 0 then
      cadena := ' and id_animal in (select ee.animal from eve_eventos ee join eve_alta_directa ead on ee.id_evento = ead.id_evento where ead.tipo = '+IntToStr(id_tipo_alta)+')'
    else
      cadena := ' where id_animal in (select ee.animal from eve_eventos ee join eve_alta_directa ead on ee.id_evento = ead.id_evento where ead.tipo = '+IntToStr(id_tipo_alta)+')';
  end;

  sql := sql + cadena + orden_consulta;
  cadena := '';

  IBQListadoExtracciones.SQL.Add(sql);
  IBQListadoExtracciones.ParamByName('desde').AsDate := DTPDesde.Date;
  IBQListadoExtracciones.ParamByName('hasta').AsDate := DTPHasta.Date;
  IBQListadoExtracciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQListadoExtracciones.Open;
  IBQListadoExtracciones.Last;
  IBQListadoExtracciones.First;

  GBDetalle.Caption := '  Extracciones realizadas (' + IntToStr(IBQListadoExtracciones.RecordCount) + ')  ';
  
end;

procedure TFRepListadoExtracciones.DTPDesdeCloseUp(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFRepListadoExtracciones.DTPDesdeChange(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFRepListadoExtracciones.DTPHastaChange(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFRepListadoExtracciones.DTPHastaCloseUp(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFRepListadoExtracciones.EBuscarChange(Sender: TObject);
begin
  inherited;
  if (EBuscar.Text <> '') then
    busqueda := true
  else
    busqueda := false;

  ActualizarConsulta;
end;

procedure TFRepListadoExtracciones.EBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
  begin
    if (EBuscarPartida.Text <> '') then
      busqueda := true
    else
      busqueda := false;

    ActualizarConsulta;
  end;
end;

procedure TFRepListadoExtracciones.IPreviewClick(Sender: TObject);
var F : TFRepListadoExtraccionesPreview;
begin
  inherited;

  F := TFRepListadoExtraccionesPreview.Create(self);
  F.ShowModal;
  F.QRMovimientosSemen.DataSet := IBQListadoExtracciones;
  F.Destroy;

  IBQListadoExtracciones.First;

end;

procedure TFRepListadoExtracciones.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFRepListadoExtracciones.IBuscarPartidaClick(Sender: TObject);
begin
  inherited;

  ActualizarConsulta;
end;

procedure TFRepListadoExtracciones.BDBGDetalleDblClick(Sender: TObject);
var F : TFEveExtraccionSemen;
begin
  inherited;

  if (IBQListadoExtracciones.FieldValues['id_evento_ext'] <> null) then
  begin

       IBQChequearEvento.Close;
       IBQChequearEvento.ParamByName('evento').AsInteger := IBQListadoExtracciones.FieldValues['id_evento_ext'];
       IBQChequearEvento.Open;

       if (IBQChequearEvento.FieldValues['congelo'] <> null) then
        if (IBQChequearEvento.FieldValues['congelo'] = 'S') then
        begin
             F := TFEveExtraccionSemen.Create(self);
             F.evento := IBQListadoExtracciones.FieldValues['id_evento_ext'];
             F.IDAnimal := IBQListadoExtracciones.FieldValues['id_animal'];

             F.ShowModal;
             F.Destroy;

             ActualizarConsulta;
        end
        else
            MostrarMensaje(tmInformacion,'Este semen no congeló. Ya sea porque fue vendido, o no fue considerado bueno.');
  end;

end;

procedure TFRepListadoExtracciones.BDBGDetalleTitleClick(Column: TColumn);
var
  i : Integer;
begin
  inherited;

  for i := 0 to BDBGDetalle.Columns.Count-1 do
    BDBGDetalle.Columns[i].Title.Color := clBtnFace;

  if Column.FieldName = columna_anterior then
  begin
    orden_consulta := ' order by '+Column.FieldName+' asc';
    Column.Title.Color := clMoneyGreen;
    columna_anterior := '';
  end
  else
  begin
    orden_consulta := ' order by '+Column.FieldName+' desc';
    columna_anterior := Column.FieldName;
    Column.Title.Color := clMoneyGreen;
  end;
  ActualizarConsulta;
end;

procedure TFRepListadoExtracciones.FormCreate(Sender: TObject);
begin
  inherited;
  IBQParametroDeTerceros.Close;
  IBQParametroDeTerceros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQParametroDeTerceros.Open;
  CBTipoAlta.Visible := false;
  if IBQParametroDeTerceros.FieldValues['valor'] <> null then
    CBTipoAlta.Visible := IBQParametroDeTerceros.FieldByName('valor').AsString = 'S';
end;

procedure TFRepListadoExtracciones.CBTipoAltaChange(Sender: TObject);
begin
  inherited;
  if ((CBTipoAlta.Text <> '(TODOS)') and (CBTipoAlta.Text <> '') and (CBTipoAlta.Text <> 'TIPO DE ALTA')) then
  begin
       id_tipo_alta := IBQTipoAlta.Lookup('nombre',CBTipoAlta.Text,'id_tipo_alta');
  end
  else
  begin
       id_tipo_alta := -1;
       DelTipoAlta := false;
       CBTipoAlta.Items.Insert(0,'TIPO DE ALTA');
       CBTipoAlta.ItemIndex := 0;
  end;

  ActualizarConsulta;
end;

procedure TFRepListadoExtracciones.CBTipoAltaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoAlta) then
  begin
       CBTipoAlta.Items.Delete(0);
       DelTipoAlta := true;
  end;
end;

procedure TFRepListadoExtracciones.IExcelClick(Sender: TObject);
begin
  inherited;
  if SDXLS.Execute then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

end.
