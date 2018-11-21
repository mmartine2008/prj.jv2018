unit UExpBrafordFlushing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, DBCtrls, UDBLookupComboBoxAuto, Grids,
  DBGrids, UBDBGrid, Buttons, PngImage, jpeg, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFExpBrafordFlushing = class(TFUniversal)
    GBDatosDonante: TGroupBox;
    LRp: TLabel;
    EARP: TEdit;
    LNombre: TLabel;
    EANombre: TEdit;
    LHBA: TLabel;
    EAHBA: TEdit;
    DBLCBADonante: TDBLookupComboBoxAuto;
    LDonante: TLabel;
    DSDonante: TDataSource;
    IBQDonantes: TIBQuery;
    DSDatosColecta: TDataSource;
    IBQDatosColecta: TIBQuery;
    DSDisponibles: TDataSource;
    IBQDisponibles: TIBQuery;
    IBQRecuperarDatos: TIBQuery;
    DSDatosEmbrionesCongelados: TDataSource;
    IBQDatosEmbrionesCongelados: TIBQuery;
    DSDatosEmbrionesFrescos: TDataSource;
    IBQDatosEmbrionesFrescos: TIBQuery;
    LCant: TLabel;
    IBQDonantesID_ANIMAL: TIntegerField;
    IBQDonantesID_RP: TIBStringField;
    IBQDonantesNOMBRE: TIBStringField;
    IBQDonantesID_HBA: TIBStringField;
    IBQDonantesRAZA: TIntegerField;
    IBQDonantesTIPIFICACION_SANGUINEA: TIBStringField;
    IBQDonantesCRIADOR: TIntegerField;
    IBQDonantesNOMBRE_COM: TIBStringField;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    PCliTop: TPanel;
    Panel2: TPanel;
    GBEmbriones: TGroupBox;
    GBEmbrioCong: TGroupBox;
    BDBGEmbrionesCongelados: TBitDBGrid;
    GBEmbrioFres: TGroupBox;
    BDBGEmbrionesFrescos: TBitDBGrid;
    GBDisponibles: TGroupBox;
    BDBGDisponibles: TBitDBGrid;
    GBGrillaColecta: TGroupBox;
    BDBGColecta: TBitDBGrid;
    procedure DBLCBADonanteCloseUp(Sender: TObject);
    procedure BDBGColectaCellClick(Column: TColumn);
    procedure EARPChange(Sender: TObject);
    procedure EANombreChange(Sender: TObject);
    procedure EAHBAChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IBQDonantesAfterOpen(DataSet: TDataSet);
    procedure IBQDonantesCalcFields(DataSet: TDataSet);
    procedure ISalirClick(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
  private
    { Private declarations }
    rp_donante, nombre_donante, hba_donante : Variant;
    id_donante : integer;    
    procedure ObtenerReceptoras();
    procedure ObtenerDatosEmbrionarios();
    procedure ObtenerDonantes();
    procedure LimpiarGrillas();
    procedure ArmarExcelFlushing();
    procedure AjustarGrillaColecta();
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
    function ArmarFecha() : string;
  public
    { Public declarations }
  end;

var
  FExpBrafordFlushing: TFExpBrafordFlushing;
  ruta : string;

implementation

uses
  UPrincipal, UCartel, UMensajeHuella, UGuardarEstiloHuella;

{$R *.dfm}

function TFExpBrafordFlushing.ArmarFecha() : string;
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

procedure TFExpBrafordFlushing.LimpiarGrillas;
begin

    DSDatosEmbrionesCongelados.DataSet.Close;
    DSDatosEmbrionesFrescos.DataSet.Close;
    DSDisponibles.DataSet.Close;

end;


procedure TFExpBrafordFlushing.DBLCBADonanteCloseUp(Sender: TObject);
var cartel : TCartel;
begin
  inherited;

  cartel := TCartel.getInstance();
  cartel.abrircartel('Recuperando datos de donantes...');

  LimpiarGrillas;

  if DBLCBADonante.KeyValue <> null then
  begin
    id_donante := DBLCBADonante.KeyValue;

    IBQDatosColecta.Close;
    IBQDatosColecta.ParamByName('animal').AsInteger := id_donante;
    IBQDatosColecta.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosColecta.Open;

  end;

  GBGrillaColecta.Caption := ' Colectas['+IntToStr(IBQDatosColecta.RecordCount)+'] ';

  cartel.cerrarcartel();
  cartel.FreeInstance;
  
end;

procedure TFExpBrafordFlushing.BDBGColectaCellClick(Column: TColumn);
begin
  inherited;
  ObtenerReceptoras;
  ObtenerDatosEmbrionarios;
end;

procedure TFExpBrafordFlushing.ObtenerDatosEmbrionarios;
begin
    DSDatosEmbrionesCongelados.DataSet.Open;
    DSDatosEmbrionesFrescos.DataSet.Open;

    IBQDatosEmbrionesCongelados.Close;
    IBQDatosEmbrionesCongelados.ParamByName('fecha').AsDate := IBQDatosColecta.FieldValues['fecha_colecta'];
    IBQDatosEmbrionesCongelados.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosEmbrionesCongelados.ParamByName('id_madre').AsInteger := id_donante;
    IBQDatosEmbrionesCongelados.Open;

    IBQDatosEmbrionesFrescos.Close;
    IBQDatosEmbrionesFrescos.ParamByName('fecha').AsDate := IBQDatosColecta.FieldValues['fecha_colecta'];
    IBQDatosEmbrionesFrescos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosEmbrionesFrescos.ParamByName('id_madre').AsInteger := id_donante;
    IBQDatosEmbrionesFrescos.Open;
end;

procedure TFExpBrafordFlushing.ObtenerReceptoras;
begin

  DSDisponibles.DataSet.Open;

  IBQDisponibles.Close;
  IBQDisponibles.ParamByName('madre').AsInteger := id_donante;
  IBQDisponibles.ParamByName('fecha').AsDate := IBQDatosColecta.FieldValues['FECHA_COLECTA'];
  IBQDisponibles.ParamByName('p1').AsInteger := IBQDatosColecta.FieldValues['ID_P1'];
  IBQDisponibles.ParamByName('p2').AsInteger := IBQDatosColecta.FieldValues['ID_P2'];
  IBQDisponibles.Open;

end;

procedure TFExpBrafordFlushing.ObtenerDonantes;
var
  C : TCartel;
begin

  C := TCartel.getInstance;
  C.abrircartel('Cargando Listado de Donantes.');

  IBQDonantes.Close;
  IBQDonantes.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDonantes.ParamByName('rp').Value := rp_donante;
  IBQDonantes.ParamByName('nombre').Value := nombre_donante;
  IBQDonantes.ParamByName('hba').Value := hba_donante;

  if (rp_donante = null) and (nombre_donante = null) and (hba_donante = null) then
    IBQDonantes.ParamByName('rp').AsString := '%';

  IBQDonantes.Open;

  C.cerrarcartel;
  C.FreeInstance;

  DBLCBADonante.KeyValue := IBQDonantes.FieldValues['id_animal'];

end;

procedure TFExpBrafordFlushing.EARPChange(Sender: TObject);
begin
  inherited;
  rp_donante := EARP.Text+'%';
  if rp_donante = '%' then
    rp_donante := null;
  ObtenerDonantes();
end;

procedure TFExpBrafordFlushing.EANombreChange(Sender: TObject);
begin
  inherited;
  nombre_donante := EANombre.Text+'%';
  if nombre_donante = '%' then
    nombre_donante := null;
  ObtenerDonantes();
end;

procedure TFExpBrafordFlushing.EAHBAChange(Sender: TObject);
begin
  inherited;
  hba_donante := EAHBA.Text+'%';
  if hba_donante = '%' then
    hba_donante := null;
  ObtenerDonantes();
end;

procedure TFExpBrafordFlushing.FormCreate(Sender: TObject);
begin
  LTitulo.Caption := 'Exportar Datos de Flushing';
  nombre_donante := null;
  rp_donante := null;
  hba_donante := null;
  AjustarGrillaColecta();
  ObtenerDonantes();
end;

procedure TFExpBrafordFlushing.IBQDonantesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQDonantes.Last;
  IBQDonantes.First;
  LCant.Caption := 'Cant. Donantes: ' + IntToStr(IBQDonantes.RecordCount);
end;

procedure TFExpBrafordFlushing.IBQDonantesCalcFields(DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('nombre').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['nombre'];
  if DataSet.FieldByName('id_hba').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['id_hba'];
  IBQDonantesNOMBRE_COM.Value := nombre;
end;

procedure TFExpBrafordFlushing.ISalirClick(Sender: TObject);
begin

  Close();

end;

procedure TFExpBrafordFlushing.ArmarExcelFlushing();
var column: TxlColumn;
begin

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQRecuperarDatos;
  DTXLS.Title.Text:= 'DECLARACION DE FLUSHING.';

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_madre','Rp Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_madre','Nombre Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'apodo_madre','Apodo Madre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_madre','HBA Madre.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'rp_p1','Rp Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_p1','Nombre Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'apodo_p1','Apodo Padre.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'hba_p1','HBA Padre.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_servicio','Fecha Servicio.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_colect','Fecha Flushing.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'cant_embriones_te','Cantidad Embriones totales.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'cant_congelados','Cantidad Embriones Congelados.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'cant_frescos','Cantidad Embriones Frescos.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nro_envase','Nº Termo Congelados.',True);

  AgregarColumnaExcel(column,taLeftJustify,0,'fecha_transf','Fecha de Implante.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'rp_recep','Rp Receptora.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_registro_recep','Registro Receptora.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'raza_recep','Raza Receptora.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'nombre_categoria_recep','VA/VQ.',True);
  AgregarColumnaExcel(column,taLeftJustify,0,'estado_repro_recep','Diag. Preñez.',True);

end;

procedure TFExpBrafordFlushing.AgregarColumnaExcel(var column: TxlColumn;
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


procedure TFExpBrafordFlushing.IExcelClick(Sender: TObject);
var F : TFGuardarEstiloHuella;
    fecha : string;
begin

  if not(IBQDatosColecta.IsEmpty) then
  begin
      IBQRecuperarDatos.Close;
      IBQRecuperarDatos.ParamByName('animal').AsInteger := id_donante;
      IBQRecuperarDatos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQRecuperarDatos.ParamByName('fecha').AsDate := IBQDatosColecta.FieldValues['fecha_colecta'];
      IBQRecuperarDatos.ParamByName('id_p1').AsInteger := IBQDatosColecta.FieldValues['id_p1'];
      IBQRecuperarDatos.ParamByName('id_p2').AsInteger := IBQDatosColecta.FieldValues['id_p2'];
      IBQRecuperarDatos.ParamByName('p_nombre_p1').Value := IBQDatosColecta.FieldValues['nombre_p1'];
      IBQRecuperarDatos.ParamByName('p_nombre_p2').Value := IBQDatosColecta.FieldValues['nombre_p2'];
      IBQRecuperarDatos.ParamByName('p_rp_p1').Value := IBQDatosColecta.FieldValues['rp_p1'];
      IBQRecuperarDatos.ParamByName('p_rp_p2').Value := IBQDatosColecta.FieldValues['rp_p2'];
      IBQRecuperarDatos.ParamByName('p_hba_p1').Value := IBQDatosColecta.FieldValues['hba_p1'];
      IBQRecuperarDatos.ParamByName('p_hba_p2').Value := IBQDatosColecta.FieldValues['hba_p2'];
      IBQRecuperarDatos.ParamByName('p_tipo_sang_p1').Value := IBQDatosColecta.FieldValues['tipo_sang_p1'];
      IBQRecuperarDatos.ParamByName('p_tipo_sang_p2').Value := IBQDatosColecta.FieldValues['tipo_sang_p2'];
      IBQRecuperarDatos.ParamByName('p_nom_servicio').Value := IBQDatosColecta.FieldValues['nom_servicio'];
      IBQRecuperarDatos.ParamByName('p_fecha_servicio').Value := IBQDatosColecta.FieldValues['fecha_servicio'];
      IBQRecuperarDatos.ParamByName('p_fecha_colecta').Value := IBQDatosColecta.FieldValues['fecha_colecta'];
      IBQRecuperarDatos.ParamByName('p_cant_embriones_te').AsInteger := IBQDatosColecta.FieldValues['cant_embriones_te'];
      IBQRecuperarDatos.Open;


      if not(IBQRecuperarDatos.IsEmpty) then
      begin
          F := TFGuardarEstiloHuella.Create(self);
          F.ShowModal;
          ruta := F.ruta;
          F.Destroy;

          if (ruta <> '') then
          try
            ArmarExcelFlushing;
            fecha := ArmarFecha;
            DTXLS.SaveToFile(ruta+'\Planilla Declaracion de Flushing - '+fecha+'.xls');
            MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
          except on e: exception do
              MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
          end;
       end
       else
           MostrarMensaje(tmInformacion,'No existen animales que cumplan con las preferencias seleccionadas.');
  end
  else
      MostrarMensaje(tmError,'No ha seleccionado ninguna colecta.');

end;

procedure TFExpBrafordFlushing.AjustarGrillaColecta;
begin

    BDBGColecta.Columns[0].Width := 80;
    BDBGColecta.Columns[1].Width := 80;
    BDBGColecta.Columns[2].Width := 80;
    BDBGColecta.Columns[3].Width := 80;
    BDBGColecta.Columns[4].Width := 80;
    BDBGColecta.Columns[5].Width := 80;
    BDBGColecta.Columns[6].Width := 250;
    BDBGColecta.Columns[7].Width := 90;
    BDBGColecta.Columns[8].Width := 90;    

end;

end.
