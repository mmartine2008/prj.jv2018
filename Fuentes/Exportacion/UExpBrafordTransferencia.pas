unit UExpBrafordTransferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, Buttons, PngImage, jpeg, Grids, DBGrids,
  UBDBGrid, DBCtrls, UDBLookupComboBoxAuto, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFExpBrafordTransferencia = class(TFUniversal)
    PFiltro: TPanel;
    PBotones: TPanel;
    Image5: TImage;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    BitBtn3: TBitBtn;
    PGrilla: TPanel;
    IBQDatosEmbriones: TIBQuery;
    DSDatosEmbriones: TDataSource;
    DSDatosMadres: TDataSource;
    IBQDatosMadres: TIBQuery;
    DBLCBADonantes: TDBLookupComboBoxAuto;
    DSDonantes: TDataSource;
    IBQDonantes: TIBQuery;
    IBQDatosColecta: TIBQuery;
    DSColecta: TDataSource;
    Label1: TLabel;
    IBQRegistroRecep: TIBQuery;
    IBQRegistroRecepNOMBRE: TIBStringField;
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
    IBQDatosMadresExtension: TIBQuery;
    IBQDatosMadresExtensionRegistro: TStringField;
    IBQNombreRaza: TIBQuery;
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
    GBDatos: TGroupBox;
    BDBGDatosColecta: TBitDBGrid;
    GroupBox1: TGroupBox;
    GBSelector: TGroupBox;
    BDBGGrillaEmbriones: TBitDBGrid;
    GBSelectorVientres: TGroupBox;
    BDBGGrillaMadres: TDBGrid;
    procedure ISalirClick(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure DBLCBADonantesCloseUp(Sender: TObject);
    procedure LimpiarGrillas;
    procedure BDBGDatosColectaCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure IBQDatosMadresCalcFields(DataSet: TDataSet);
    procedure IBQDatosMadresExtensionFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure IBQDatosMadresExtensionCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure ArmarExcelTransferencia;
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield, title: String; save: Boolean);
    procedure AjustarGrilla;
    function ArmarFecha : string;
    function PertenceAnimal(id : integer) : boolean;
  public
    { Public declarations }
  end;

var
  FExpBrafordTransferencia: TFExpBrafordTransferencia;
  ruta : string;
  arrSeleccionados : array of integer;
  cantidadSeleccionados : integer;

implementation

uses
  UPrincipal, UCartel, UMensajeHuella, UGuardarEstiloHuella;

{$R *.dfm}

procedure TFExpBrafordTransferencia.LimpiarGrillas;
begin

    DSDatosEmbriones.DataSet.Close;
    DSDatosMadres.DataSet.Close;

end;

function TFExpBrafordTransferencia.ArmarFecha : string;
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


procedure TFExpBrafordTransferencia.ISalirClick(Sender: TObject);
begin
    Close();
end;

procedure TFExpBrafordTransferencia.ArmarExcelTransferencia;
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

  IBQDatosMadresExtension.Close;
  IBQDatosMadresExtension.ParamByName('madre').AsInteger := DBLCBADonantes.KeyValue;
  IBQDatosMadresExtension.ParamByName('fecha').AsDate := IBQDatosColecta.FieldValues['FECHA_COLECTA'];
  IBQDatosMadresExtension.ParamByName('p1').AsInteger := IBQDatosColecta.FieldValues['ID_P1'];
  IBQDatosMadresExtension.ParamByName('p2').AsInteger := IBQDatosColecta.FieldValues['ID_P2'];
  IBQDatosMadresExtension.Open;

  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDatosMadresExtension;
  DTXLS.Title.Text:= 'DECLARACION DE IMPLANTE EMBRIONARIO.';

  AgregarColumnaExcel(column,taLeftJustify,6000,'rp','Caravana.',True);
  AgregarColumnaExcel(column,taLeftJustify,6000,'rp','Rp Receptora.',True);
  AgregarColumnaExcel(column,taLeftJustify,6000,'registro','Reg. Receptora.',True);
  AgregarColumnaExcel(column,taLeftJustify,6000,'nombreraza','Raza Receptora.',True);

end;

procedure TFExpBrafordTransferencia.AgregarColumnaExcel(var column: TxlColumn;
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

procedure TFExpBrafordTransferencia.IExcelClick(Sender: TObject);
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
      if not(IBQDatosMadresExtension.IsEmpty) then
      begin
          fecha := ArmarFecha;
          DTXLS.SaveToFile(ruta+'\Planilla Transferencia a Terceros - '+fecha+'.xls');
          MostrarMensaje(tmInformacion,'Los datos se guardaron satisfactoriamente.');
      end
      else
          MostrarMensaje(tmInformacion,'No selecciono ninguno de los vientres, del listado de vientres.');
    except on e: exception do
        MostrarMensaje(tmInformacion,'La ruta seleccionada es invalida, debe seleccionar otra.');
    end;     
  end
  else
      MostrarMensaje(tmInformacion,'No existen animales que cumplan con las preferencias seleccionadas.');
                      
end;

procedure TFExpBrafordTransferencia.DBLCBADonantesCloseUp(Sender: TObject);
begin
  LimpiarGrillas;

  if DBLCBADonantes.KeyValue <> null then
  begin

    IBQDatosColecta.Close;
    IBQDatosColecta.ParamByName('animal').AsInteger := DBLCBADonantes.KeyValue;
    IBQDatosColecta.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosColecta.Open;

  end;
end;

procedure TFExpBrafordTransferencia.BDBGDatosColectaCellClick(
  Column: TColumn);
begin

    DSDatosEmbriones.DataSet.Open;
    DSDatosMadres.DataSet.Open;

    IBQDatosEmbriones.Close;
    IBQDatosEmbriones.ParamByName('id').AsInteger := DBLCBADonantes.KeyValue;
    IBQDatosEmbriones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosEmbriones.ParamByName('fecha').AsDate := IBQDatosColecta.FieldValues['fecha_colecta'];
    IBQDatosEmbriones.Open;

    IBQDatosMadres.Close;
    IBQDatosMadres.ParamByName('madre').AsInteger := DBLCBADonantes.KeyValue;
    IBQDatosMadres.ParamByName('fecha').AsDate := IBQDatosColecta.FieldValues['FECHA_COLECTA'];
    IBQDatosMadres.ParamByName('p1').AsInteger := IBQDatosColecta.FieldValues['ID_P1'];
    IBQDatosMadres.ParamByName('p2').AsInteger := IBQDatosColecta.FieldValues['ID_P2'];
    IBQDatosMadres.Open;

end;

procedure TFExpBrafordTransferencia.FormCreate(Sender: TObject);
begin

    IBQDonantes.Close;
    IBQDonantes.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDonantes.Open;

    IBQDonantes.Last;
    IBQDonantes.First;

    DBLCBADonantes.KeyValue := IBQDonantes.FieldValues['id_animal'];

    AjustarGrilla;

end;

procedure TFExpBrafordTransferencia.AjustarGrilla;
begin
{
    BDBGDatosColecta.Columns[0].Width := 90;
    BDBGDatosColecta.Columns[1].Width := 90;
    BDBGDatosColecta.Columns[2].Width := 100;
    BDBGDatosColecta.Columns[3].Width := 85;
    BDBGDatosColecta.Columns[4].Width := 85;
    BDBGDatosColecta.Columns[5].Width := 150;

    BDBGGrillaEmbriones.Columns[0].Width := 80;
    BDBGGrillaEmbriones.Columns[1].Width := 80;
    BDBGGrillaEmbriones.Columns[2].Width := 120;
    BDBGGrillaEmbriones.Columns[3].Width := 80;
    BDBGGrillaEmbriones.Columns[4].Width := 80;

    BDBGGrillaMadres.Columns[0].Width := 90;
    BDBGGrillaMadres.Columns[1].Width := 90;
    BDBGGrillaMadres.Columns[2].Width := 120;
    BDBGGrillaMadres.Columns[3].Width := 80;
    BDBGGrillaMadres.Columns[3].Width := 80;
}    
end;

procedure TFExpBrafordTransferencia.IBQDatosMadresCalcFields(
  DataSet: TDataSet);
begin

    IBQRegistroRecep.Close;
    IBQRegistroRecep.ParamByName('id_animal').AsInteger := IBQDatosMadres.FieldValues['id_animal'];
    IBQRegistroRecep.Open;

    IBQDatosMadresREGISTRO.Value := IBQRegistroRecep.FieldValues['nombre'];

end;


procedure TFExpBrafordTransferencia.IBQDatosMadresExtensionFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
    accept := PertenceAnimal(dataset.FieldValues['animal']);
end;

function TFExpBrafordTransferencia.PertenceAnimal(id: integer) : boolean;
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

procedure TFExpBrafordTransferencia.IBQDatosMadresExtensionCalcFields(
  DataSet: TDataSet);
begin

    IBQRegistroRecep.Close;
    IBQRegistroRecep.ParamByName('id_animal').AsInteger := IBQDatosMadresExtension.FieldValues['animal'];
    IBQRegistroRecep.Open;

    IBQNombreRaza.Close;
    IBQNombreRaza.ParamByName('id').AsInteger := IBQDatosMadresExtension.FieldValues['raza'];
    IBQNombreRaza.Open;


    IBQDatosMadresExtensionRegistro.Value := IBQRegistroRecep.FieldValues['nombre'];
    IBQDatosMadresExtensionNombreRaza.Value := IBQNombreRaza.FieldValues['nombre'];

end;

end.
