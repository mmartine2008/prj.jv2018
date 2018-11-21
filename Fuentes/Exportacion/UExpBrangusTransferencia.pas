unit UExpBrangusTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, Buttons, PngImage, jpeg, DBCtrls,
  UDBLookupComboBoxAuto, Grids, DBGrids, UBDBGrid, ImgList, PngImageList,
  IBQuery, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc,
  ActnList, ComCtrls, JvExControls, JvLabel, ExtCtrls, JvGIF, JvExExtCtrls,
  JvImage;

type
  TFExpBrangusTransferencia = class(TFUniversal)
    PGrilla: TPanel;
    GBDatos: TGroupBox;
    BDBGDatosColecta: TBitDBGrid;
    GroupBox1: TGroupBox;
    GBSelector: TGroupBox;
    BDBGGrillaEmbriones: TBitDBGrid;
    GBSelectorVientres: TGroupBox;
    BDBGGrillaMadres: TDBGrid;
    PFiltro: TPanel;
    Label1: TLabel;
    DBLCBADonantes: TDBLookupComboBoxAuto;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    DSDonantes: TDataSource;
    IBQDonantes: TIBQuery;
    IBQDatosColecta: TIBQuery;
    DSColecta: TDataSource;
    DSDatosEmbriones: TDataSource;
    IBQDatosEmbriones: TIBQuery;
    DSDatosMadres: TDataSource;
    IBQDatosMadres: TIBQuery;
    IBQDatosMadresID_ANIMAL: TIntegerField;
    IBQDatosMadresID_RP: TIBStringField;
    IBQDatosMadresID_SENASA: TIBStringField;
    IBQDatosMadresRAZA: TIntegerField;
    IBQDatosMadresNOMBRE: TIBStringField;
    IBQDatosMadresSUBCATEGORIA: TIntegerField;
    IBQDatosMadresDIAS_GESTACION: TIntegerField;
    IBQDatosMadresESTADIO: TIntegerField;
    IBQDatosMadresCALIDAD: TIntegerField;
    IBQDatosMadresFECHA: TDateField;
    IBQDatosMadresREGISTRO: TStringField;
    SELECCIONADO: TStringField;
    IBQRegistroRecep: TIBQuery;
    IBQRegistroRecepNOMBRE: TIBStringField;
    IBQNombreRaza: TIBQuery;
    IBQDatosMadresExtension: TIBQuery;
    IBQDatosMadresExtensionRegistro: TStringField;
    IBQDatosMadresExtensionNombreRaza: TStringField;
    IBQDatosMadresExtensionANIMAL: TIntegerField;
    IBQDatosMadresExtensionRP: TIBStringField;
    IBQDatosMadresExtensionID_SENASA: TIBStringField;
    IBQDatosMadresExtensionRAZA: TIntegerField;
    IBQDatosMadresExtensionNOMBRE: TIBStringField;
    IBQDatosMadresExtensionSUB: TIntegerField;
    IBQDatosMadresExtensionDIAS_GESTACION: TIntegerField;
    IBQDatosMadresExtensionESTADIO: TIntegerField;
    IBQDatosMadresExtensionCALIDAD: TIntegerField;
    IBQDatosMadresExtensionFECHA: TDateField;
    IBQDatosMadresRAZANOMBRE: TStringField;
    IBQExportDatos: TIBQuery;
    procedure BDBGDatosColectaCellClick(Column: TColumn);
    procedure ISalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IBQDatosMadresCalcFields(DataSet: TDataSet);
    procedure IBQDatosMadresExtensionFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure IBQDatosMadresExtensionCalcFields(DataSet: TDataSet);
    procedure DBLCBADonantesCloseUp(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBQExportDatosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
    procedure LimpiarGrillas;
    function PertenceAnimal(id : integer) : boolean;
    procedure ArmarExcelTransferencia;
    function ArmarFecha : string;
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
  public
    { Public declarations }
  end;

var
  FExpBrangusTransferencia: TFExpBrangusTransferencia;
  cantidadSeleccionados : integer;
  arrSeleccionados : array of integer;
  ruta : string;

implementation

uses UPrincipal,uTiposGlobales, UCartel, UMensajeHuella, UGuardarEstiloHuella;

{$R *.dfm}

procedure TFExpBrangusTransferencia.LimpiarGrillas;
begin
     DSDatosEmbriones.DataSet.Close;
     DSDatosMadres.DataSet.Close;
end;

procedure TFExpBrangusTransferencia.BDBGDatosColectaCellClick(Column: TColumn);
begin
    inherited;

    DSDatosEmbriones.DataSet.Open;
    DSDatosMadres.DataSet.Open;

    IBQDatosEmbriones.Close;
    IBQDatosEmbriones.ParamByName('id').AsInteger := DBLCBADonantes.KeyValue;
    IBQDatosEmbriones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosEmbriones.ParamByName('fecha').AsDate := IBQDatosColecta.FieldValues['fecha_colecta'];
    IBQDatosEmbriones.Open;
    IBQDatosEmbriones.Last;
    IBQDatosEmbriones.First;

    GBSelector.Caption := '  Cantidad de embriones: ' +IntToStr(IBQDatosEmbriones.RecordCount)+ '  ';

    IBQDatosMadres.Close;
    IBQDatosMadres.ParamByName('madre').AsInteger := DBLCBADonantes.KeyValue;
    IBQDatosMadres.ParamByName('fecha').AsDate := IBQDatosColecta.FieldValues['FECHA_COLECTA'];
    IBQDatosMadres.ParamByName('p1').AsInteger := IBQDatosColecta.FieldValues['ID_P1'];
    IBQDatosMadres.ParamByName('p2').AsInteger := IBQDatosColecta.FieldValues['ID_P2'];
    IBQDatosMadres.Open;

end;

procedure TFExpBrangusTransferencia.ISalirClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFExpBrangusTransferencia.FormCreate(Sender: TObject);
begin
    inherited;

    IBQDonantes.Close;
    IBQDonantes.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDonantes.Open;
    IBQDonantes.Last;
    IBQDonantes.First;

    DBLCBADonantes.KeyValue := IBQDonantes.FieldValues['id_animal'];
    
end;

procedure TFExpBrangusTransferencia.IBQDatosMadresCalcFields(DataSet: TDataSet);
begin
    inherited;
    
    IBQRegistroRecep.Close;
    IBQRegistroRecep.ParamByName('id_animal').AsInteger := IBQDatosMadres.FieldValues['id_animal'];
    IBQRegistroRecep.Open;

    IBQNombreRaza.Close;
    IBQNombreRaza.ParamByName('id').AsInteger := IBQDatosMadres.FieldValues['raza'];
    IBQNombreRaza.Open;

    IBQDatosMadresRAZANOMBRE.Value := IBQNombreRaza.FieldValues['sinonimo'];
    IBQDatosMadresREGISTRO.Value := IBQRegistroRecep.FieldValues['nombre'];

end;

procedure TFExpBrangusTransferencia.IBQDatosMadresExtensionFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;

  accept := PertenceAnimal(dataset.FieldValues['animal']);
end;

procedure TFExpBrangusTransferencia.IBQDatosMadresExtensionCalcFields(DataSet: TDataSet);
begin
    inherited;

    IBQRegistroRecep.Close;
    IBQRegistroRecep.ParamByName('id_animal').AsInteger := IBQDatosMadresExtension.FieldValues['animal'];
    IBQRegistroRecep.Open;

    IBQNombreRaza.Close;
    IBQNombreRaza.ParamByName('id').AsInteger := IBQDatosMadresExtension.FieldValues['raza'];
    IBQNombreRaza.Open;


    IBQDatosMadresExtensionRegistro.Value := IBQRegistroRecep.FieldValues['nombre'];
    IBQDatosMadresExtensionNombreRaza.Value := IBQNombreRaza.FieldValues['nombre'];

end;

function TFExpBrangusTransferencia.PertenceAnimal(id: integer) : boolean;
var i : integer;
    encontrado : boolean;
begin

  encontrado := false;
  i := 0;
  
  while ((i < cantidadSeleccionados) and not(encontrado)) do
  begin
    if (arrSeleccionados[i] = id) then
      encontrado := true;

    inc(i);
  end;

  Result := encontrado;

end;

procedure TFExpBrangusTransferencia.DBLCBADonantesCloseUp(Sender: TObject);
begin
  inherited;
  LimpiarGrillas;

  if DBLCBADonantes.KeyValue <> null then
  begin
       IBQDatosColecta.Close;
       IBQDatosColecta.ParamByName('animal').AsInteger := DBLCBADonantes.KeyValue;
       IBQDatosColecta.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
       IBQDatosColecta.Open;
  end;
end;

procedure TFExpBrangusTransferencia.IExcelClick(Sender: TObject);
var F : TFGuardarEstiloHuella;
    fecha : string;
begin

  if not(IBQDatosMadres.IsEmpty) then
  begin
    F := TFGuardarEstiloHuella.Create(self);
    F.ShowModal;
    ruta := F.ruta;
    F.Destroy;

    if (ruta <> '') then
    try
      ArmarExcelTransferencia;
      if not(IBQExportDatos.IsEmpty) then
      begin
          fecha := ArmarFecha;
          DTXLS.SaveToFile(ruta+'\Planilla Cesión de Embriones a Terceros - '+fecha+'.xls');
          MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
      end
      else
          MostrarMensaje(tmInformacion,'No selecciono ningun vientre.');
    except on e: exception do
         MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
    end;
  end
  else
      MostrarMensaje(tmInformacion,'No existen animales que cumplan con las preferencias seleccionadas.');
                      
end;

procedure TFExpBrangusTransferencia.ArmarExcelTransferencia;
var column: TxlColumn;
    b : TxlHeader;
    i : integer;
begin
  cantidadSeleccionados := 0;

  with BDBGGrillaMadres.DataSource.DataSet do
  begin
      for i:=0 to BDBGGrillaMadres.SelectedRows.Count-1 do
      begin
         SetLength(arrSeleccionados,cantidadSeleccionados+1);
         GotoBookmark(pointer(BDBGGrillaMadres.SelectedRows.Items[i]));
         arrSeleccionados[cantidadSeleccionados] := FieldValues['id_animal'];
         Inc(cantidadSeleccionados);
      end;
  end;


  IBQExportDatos.Close;
  IBQExportDatos.ParamByName('donante').AsInteger := DBLCBADonantes.KeyValue;
  IBQExportDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQExportDatos.ParamByName('fecha_colecta').AsDate := IBQDatosColecta.FieldValues['FECHA_COLECTA'];
  IBQExportDatos.ParamByName('id_padre').AsInteger := IBQDatosColecta.FieldValues['ID_P1'];
  IBQExportDatos.ParamByName('id_madre').AsInteger := DBLCBADonantes.KeyValue;
  IBQExportDatos.Open;

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQExportDatos;
  DTXLS.Title.Text:= 'CESIÓN DE EMBRIONES A TERCEROS.';

  AgregarColumnaExcel(column,taLeftJustify,6000,'nombre_padre','Nombre Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,6000,'apodo_padre','Apodo Padre',True);
  AgregarColumnaExcel(column,taLeftJustify,6000,'tip_sang_padre','Nº Tip. San. Padre',True);

  AgregarColumnaExcel(column,taLeftJustify,6000,'rp_donante','Rp Donante',True);
  AgregarColumnaExcel(column,taLeftJustify,6000,'nombre_donante','Nombre Donante',True);
  AgregarColumnaExcel(column,taLeftJustify,6000,'ident_donante','AAB/HBA Donante',True);
  AgregarColumnaExcel(column,taLeftJustify,6000,'tip_sang_donante','Nº Tip. San. Donante',True);

  AgregarColumnaExcel(column,taLeftJustify,6000,'id_rp_receptora','Rp Receptora',True);
  AgregarColumnaExcel(column,taLeftJustify,6000,'id_senasa_receptora','Caravana Receptora',True);
  AgregarColumnaExcel(column,taLeftJustify,6000,'fecha_receptora','Fecha Implante',True);

end;

procedure TFExpBrangusTransferencia.AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
begin
    column:= TxlColumn.Create(nil);
    column:= DTXLS.Columns.Add;
    column.Alignment:= alig;
    column.ColWidth:= coldwidth;
    column.DataField:= datafield;
    column.Save:= save;
    column.Title:= title;
end;


function TFExpBrangusTransferencia.ArmarFecha : string;
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



procedure TFExpBrangusTransferencia.FormShow(Sender: TObject);
begin
  inherited;

  DBLCBADonantesCloseUp(sender);
end;

procedure TFExpBrangusTransferencia.IBQExportDatosFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var id_embrion, indice : integer;
    esta : boolean;
begin
  inherited;

  id_embrion := IBQDatosEmbriones.FieldValues['id_embrion'];

  indice := 0;
  esta := false;
  while ((indice < cantidadSeleccionados) and not(esta)) do
  begin
       if (arrSeleccionados[indice] = DataSet.FieldValues['id_animal_receptora']) then
          esta := true;

       Inc(indice);
  end;

  accept := esta and (id_embrion = DataSet.FieldValues['id_embrion']);
end;

end.
