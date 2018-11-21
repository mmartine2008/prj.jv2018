unit USeleccionEmbrion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  EditAuto, Grids, DBGrids, UBDBGrid, Buttons, DBCtrls,
  UDBLookupComboBoxAuto, PngImage, jpeg, JvExControls, JvLabel, JvGIF,
  ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFSeleccionEmbrion = class(TFUniversal)
    PBusqueda: TPanel;
    PMadres: TPanel;
    PBotones: TPanel;
    GroupBox1: TGroupBox;
    GBDonantes: TGroupBox;
    GBEmbriones: TGroupBox;
    BDBGMadres: TBitDBGrid;
    BDBGEmbriones: TBitDBGrid;
    BBAceptar: TBitBtn;
    BBCancelar: TBitBtn;
    IBQMadres: TIBQuery;
    DSMadres: TDataSource;
    IBQEmbriones: TIBQuery;
    DSEmbriones: TDataSource;
    IBQDestinos: TIBQuery;
    IBQDestinosID_DESTINO_EMBRION: TIntegerField;
    IBQDestinosNOMBRE: TIBStringField;
    IBQDestinosCODIGO: TIBStringField;
    IBQDestinosSINONIMO: TIBStringField;
    IBQEmbrionesID_EMBRION: TIntegerField;
    IBQEmbrionesESTABLECIMIENTO: TIntegerField;
    IBQEmbrionesFECHA_COLECCION: TDateField;
    IBQEmbrionesDESTINO: TIntegerField;
    IBQEmbrionesDESCRIPCION: TIntegerField;
    IBQEmbrionesSERIE: TIBStringField;
    IBQEmbrionesNRO_ENVASE: TIBStringField;
    IBQEmbrionesESTADIO: TIntegerField;
    IBQEmbrionesCALIDAD: TIntegerField;
    IBQEmbrionesRESPONSABLE: TIntegerField;
    IBQEmbrionesOBSERVACION: TIBStringField;
    IBQEmbrionesMADRE: TIntegerField;
    IBQEmbrionesPADRE_1: TIntegerField;
    IBQEmbrionesPADRE_EXTERNO_1: TIBStringField;
    IBQEmbrionesPADRE_2: TIntegerField;
    IBQEmbrionesPADRE_EXTERNO_2: TIBStringField;
    IBQEmbrionesMADRE_INTERNA: TIBStringField;
    IBQEmbrionesUSADO: TIBStringField;
    IBQEmbrionesCANT_LAVAJES: TIntegerField;
    IBQEmbrionesID_EVE_TRANS: TIntegerField;
    IBQEmbrionesPRECIO: TFloatField;
    IBQEmbrionesCENTRO_TRANSPLANTE: TIntegerField;
    IBQEmbrionesVAL_DEST: TStringField;
    IBQCentrosTrans: TIBQuery;
    IBQEmbrionesVAL_CENTROS: TStringField;
    IBQCalidad: TIBQuery;
    IBQCalidadID_CALIDAD: TIntegerField;
    IBQCalidadNOMBRE: TIBStringField;
    IBQCalidadCODIGO: TIBStringField;
    IBQCalidadSINONIMO: TIBStringField;
    IBQCalidadVALOR: TIntegerField;
    IBQEstadios: TIBQuery;
    IBQEstadiosID_ESTADIO: TIntegerField;
    IBQEstadiosNOMBRE: TIBStringField;
    IBQEstadiosCODIGO: TIBStringField;
    IBQEstadiosSINONIMO: TIBStringField;
    IBQEstadiosVALOR: TIntegerField;
    IBQEmbrionesVAL_CALIDAD: TIntegerField;
    IBQEmbrionesVAL_ESTADIO: TIntegerField;
    LFlushing: TLabel;
    LCompraEmbriones: TLabel;
    IBQEmbrionesDIAS_GESTACION: TIntegerField;
    IBQEmbrionesNRO_ORDEN2: TIBStringField;
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EARPPadre: TEditAuto;
    EANombrePadre: TEditAuto;
    EAHBAPadre: TEditAuto;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    EARPMadre: TEditAuto;
    EANombreMadre: TEditAuto;
    EAHBAMadre: TEditAuto;
    GBFiltrosEmbrion: TGroupBox;
    Label7: TLabel;
    EASerie: TEditAuto;
    Label8: TLabel;
    EAEnvase: TEditAuto;
    CBEstadio: TCheckBox;
    CBCalidad: TCheckBox;
    DBLCBAEstadio: TDBLookupComboBoxAuto;
    DBLCBACalidad: TDBLookupComboBoxAuto;
    DSCalidad: TDataSource;
    DSCentrosTrans: TDataSource;
    DSDestinos: TDataSource;
    DSEstadios: TDataSource;
    CBDestino: TCheckBox;
    DBLCBADestino: TDBLookupComboBoxAuto;
    CBCentros: TCheckBox;
    DBLCBACentrosTrans: TDBLookupComboBoxAuto;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Shape1: TShape;
    Shape2: TShape;
    Label9: TLabel;
    Label10: TLabel;
    IBQMadresID_MADRE: TIntegerField;
    IBQMadresMADRE_INT: TIBStringField;
    IBQMadresRP_MADRE: TIBStringField;
    IBQMadresN_MADRE: TIBStringField;
    IBQMadresHBA_MADRE: TIBStringField;
    IBQMadresID_PADRE1: TIntegerField;
    IBQMadresEXT_1: TIBStringField;
    IBQMadresRP_PADRE1: TIBStringField;
    IBQMadresN_PADRE1: TIBStringField;
    IBQMadresHBA_PADRE1: TIBStringField;
    IBQMadresID_PADRE2: TIntegerField;
    IBQMadresEXT_2: TIBStringField;
    IBQMadresRP_PADRE2: TIBStringField;
    IBQMadresN_PADRE2: TIBStringField;
    IBQMadresHBA_PADRE2: TIBStringField;
    IBQMadresFECHA_COLECCION: TDateField;
    IBQMadresCANT_EMBRIONES: TIntegerField;
    IFondoB: TImage;
    ITerminar: TImage;
    LTerminar: TLabel;
    ICancelar: TImage;
    LCancelar: TLabel;
    procedure BDBGMadresCellClick(Column: TColumn);
    procedure EARPMadreChange(Sender: TObject);
    procedure EANombreMadreChange(Sender: TObject);
    procedure EAHBAMadreChange(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure IBQMadresAfterOpen(DataSet: TDataSet);
    procedure IBQEmbrionesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure LMouseEnter(Sender: TObject);
    procedure LMouseLeave(Sender: TObject);
    procedure LFlushingClick(Sender: TObject);
    procedure LCompraEmbrionesClick(Sender: TObject);
    procedure EARPPadreChange(Sender: TObject);
    procedure EANombrePadreChange(Sender: TObject);
    procedure EAHBAPadreChange(Sender: TObject);
    procedure EASerieChange(Sender: TObject);
    procedure EAEnvaseChange(Sender: TObject);
    procedure CBEstadioClick(Sender: TObject);
    procedure CBCalidadClick(Sender: TObject);
    procedure CBDestinoClick(Sender: TObject);
    procedure CBCentrosClick(Sender: TObject);
    procedure DBLCBAEstadioCloseUp(Sender: TObject);
    procedure DBLCBACalidadCloseUp(Sender: TObject);
    procedure DBLCBADestinoCloseUp(Sender: TObject);
    procedure DBLCBACentrosTransCloseUp(Sender: TObject);
    procedure IBQEmbrionesAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    NombreM, HBAM, RPM : String;
    NombreP, HBAP, RPP : String;
    Envase, Serie : String;
    Calidad, Estadio, Destino, Centro : Variant;
    IBDS : TIBDataSet;
    procedure ActMadres();
    procedure ActEmbriones();
    procedure AjustarColumnas();
  public
    Embrion : ^Integer;
    Madre, Padre, Info_Embrion : ^String;
  published
    constructor Create(Owner : TComponent; DataSet : TIBDataSet); reintroduce;
  end;

var
  FSeleccionEmbrion: TFSeleccionEmbrion;

implementation

uses
  UPrincipal, UMensajeHuella, UEveFlushing, UEveCompraEmbriones, UTraduccion;

{$R *.dfm}

constructor TFSeleccionEmbrion.Create(Owner : TComponent; DataSet : TIBDataSet);
begin
  inherited Create(Owner);
  NombreM := '%';
  HBAM := '%';
  RPM := '%';
  NombreP := '%';
  HBAP := '%';
  RPP := '%';
  Serie := '%';
  Envase := '%';
  Calidad := null;
  Estadio := null;
  Centro := null;
  Destino := null;
  IBDS := DataSet;
end;

procedure TFSeleccionEmbrion.ActEmbriones;
var
  SQL : String;
begin

  SQL := 'select * from tab_embriones where madre = :id and fecha_coleccion = :fecha and usado = ''N'' and (serie like :serie and nro_envase like :envase)';

  if (CBEstadio.Checked) then
    SQL := SQL + ' and (estadio = :estadio)';
  if (CBCalidad.Checked) then
    SQL := SQL + ' and (calidad = :calidad)';
  if (CBDestino.Checked) then
    SQL := SQL + ' and (destino = :destino)';
  if (CBCentros.Checked) then
    SQL := SQL + ' and (centro_transplante = :centro)';

  IBQEmbriones.Close;
  IBQEmbriones.SQL.Clear;
  IBQEmbriones.SQL.Add(SQL);
  IBQEmbriones.ParamByName('id').AsInteger := IBQMadres.FieldValues['id_madre'];
  IBQEmbriones.ParamByName('fecha').AsDate := IBQMadres.FieldValues['fecha_coleccion'];
  IBQEmbriones.ParamByName('serie').AsString := Serie;
  IBQEmbriones.ParamByName('envase').AsString := Envase;
  if (CBEstadio.Checked) then
    IBQEmbriones.ParamByName('estadio').Value := Estadio;
  if (CBCalidad.Checked) then
    IBQEmbriones.ParamByName('calidad').Value := Calidad;
  if (CBDestino.Checked) then
    IBQEmbriones.ParamByName('destino').Value := Destino;
  if (CBCentros.Checked) then
    IBQEmbriones.ParamByName('centro').Value := Centro;
  IBQEmbriones.Open;
  GBFiltrosEmbrion.Visible := not IBQEmbriones.IsEmpty;
  AjustarColumnas();
end;

procedure TFSeleccionEmbrion.ActMadres;
begin
  IBQMadres.Close;
  IBQMadres.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQMadres.ParamByName('nombreM').AsString := NombreM;
  IBQMadres.ParamByName('hbaM').AsString := HBAM;
  IBQMadres.ParamByName('rpM').AsString := RPM;
  IBQMadres.ParamByName('nombreP').AsString := NombreP;
  IBQMadres.ParamByName('hbaP').AsString := HBAP;
  IBQMadres.ParamByName('rpP').AsString := RPP;
  IBQMadres.Open;
  AjustarColumnas();
end;

procedure TFSeleccionEmbrion.BDBGMadresCellClick(Column: TColumn);
begin
  inherited;
  if not IBQMadres.IsEmpty then
    ActEmbriones()
  else
    mostrarMensaje(tmError,'No hay Embriones en el Stock. Debe realizar una Recolección o Compra de Embriones');
end;

procedure TFSeleccionEmbrion.EARPMadreChange(Sender: TObject);
begin
  inherited;
  RPM := EARPMadre.Text+'%';
  ActMadres();
end;

procedure TFSeleccionEmbrion.EANombreMadreChange(Sender: TObject);
begin
  inherited;
  NombreM := EANombreMadre.Text+'%';
  ActMadres();
end;

procedure TFSeleccionEmbrion.EAHBAMadreChange(Sender: TObject);
begin
  inherited;
  HBAM := EAHBAMadre.Text+'%';
  ActMadres();
end;

procedure TFSeleccionEmbrion.EARPPadreChange(Sender: TObject);
begin
  inherited;
  RPP := EARPPadre.Text+'%';
  ActMadres();
end;

procedure TFSeleccionEmbrion.EANombrePadreChange(Sender: TObject);
begin
  inherited;
  NombreP := EANombrePadre.Text+'%';
  ActMadres();
end;

procedure TFSeleccionEmbrion.EAHBAPadreChange(Sender: TObject);
begin
  inherited;
  HBAP := EAHBAPadre.Text+'%';
  ActMadres();
end;

procedure TFSeleccionEmbrion.AjustarColumnas();
begin
  BDBGMadres.Columns[0].Width := 57;
  BDBGMadres.Columns[1].Width := 48;
  BDBGMadres.Columns[2].Width := 130;
  BDBGMadres.Columns[3].Width := 47;
  BDBGMadres.Columns[4].Width := 50;
  BDBGMadres.Columns[5].Width := 130;
  BDBGMadres.Columns[6].Width := 49;
  BDBGMadres.Columns[7].Width := 50;
  BDBGMadres.Columns[8].Width := 108;
  BDBGMadres.Columns[9].Width := 49;

  BDBGEmbriones.Columns[0].Width := 40;
  BDBGEmbriones.Columns[1].Width := 50;
  BDBGEmbriones.Columns[2].Width := 43;
  BDBGEmbriones.Columns[3].Width := 41;
  BDBGEmbriones.Columns[4].Width := 76;
  BDBGEmbriones.Columns[5].Width := 137;
end;

procedure TFSeleccionEmbrion.BBAceptarClick(Sender: TObject);
begin
  inherited;
  Embrion^ := IBQEmbriones.FieldByName('ID_EMBRION').AsInteger;
  Madre^ := IBQMadres.FieldByName('RP_MADRE').AsString;
  Padre^ := IBQMadres.FieldByName('RP_PADRE1').AsString;
  if IBQMadres.FieldValues['RP_PADRE2'] <> null then
    Padre^ := Padre^+' - '+IBQMadres.FieldByName('RP_PADRE2').AsString;
  Info_Embrion^ := 'Serie: '+IBQEmbriones.FieldByName('SERIE').AsString+' - Calidad: '+IBQEmbriones.FieldByName('VAL_ESTADIO').AsString
                   +':'+IBQEmbriones.FieldByName('VAL_CALIDAD').AsString;
  Close();
end;

procedure TFSeleccionEmbrion.BBCancelarClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFSeleccionEmbrion.IBQMadresAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.First;
  while not DataSet.Eof do
  begin
    if DataSet.FieldValues['ID_PADRE2'] > 0 then
    begin
      BDBGMadres.Columns[7].Visible := true;
      BDBGMadres.Columns[8].Visible := true;
      BDBGMadres.Columns[9].Visible := true;
      break;
    end;
    DataSet.Next;
  end;
  GBDonantes.Caption := Traducir('Donantes [')+IntToStr(BDBGMadres.RowCount)+']';
  AjustarColumnas();
end;

procedure TFSeleccionEmbrion.IBQEmbrionesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  b : boolean;
begin
  inherited;
  if IBDS <> nil then
    b := IBDS.Lookup('I8',DataSet.FieldValues['id_embrion'],'I8') = null
  else
    b := true;
  Accept := b;
end;

procedure TFSeleccionEmbrion.LMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= $00606C02;
    (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFSeleccionEmbrion.LMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= clWindowText;
    (Sender as TLabel).Font.Style:= [fsUnderline];
  end;
end;

procedure TFSeleccionEmbrion.LFlushingClick(Sender: TObject);
begin
  inherited;
 { FPrincipal.AbrirEventoConManga(TFEveFlushing.Create(nil));
  ActMadres();}
end;

procedure TFSeleccionEmbrion.LCompraEmbrionesClick(Sender: TObject);
var
  F: TFEveCompraEmbriones;
begin
  inherited;
  F := TFEveCompraEmbriones.Create(self);
  F.TipoStock := tsCompra;
  F.ShowModal;
  F.Destroy;
  ActMadres();
end;

procedure TFSeleccionEmbrion.EASerieChange(Sender: TObject);
begin
  inherited;
  Serie := EASerie.Text+'%';
  ActEmbriones();
end;

procedure TFSeleccionEmbrion.EAEnvaseChange(Sender: TObject);
begin
  inherited;
  Envase := EAEnvase.Text+'%';
  ActEmbriones();
end;

procedure TFSeleccionEmbrion.CBEstadioClick(Sender: TObject);
begin
  inherited;
  DBLCBAEstadio.Enabled := CBEstadio.Checked;
  if CBEstadio.Checked then
  begin
    DBLCBAEstadio.KeyValue := 1;
    Estadio := 1;
  end
  else
    Estadio := null;
  ActEmbriones();
end;

procedure TFSeleccionEmbrion.CBCalidadClick(Sender: TObject);
begin
  inherited;
  DBLCBACalidad.Enabled := CBCalidad.Checked;
  if CBCalidad.Checked then
  begin
    DBLCBACalidad.KeyValue := 1;
    Calidad := 1;
  end
  else
    Calidad := null;
  ActEmbriones();
end;

procedure TFSeleccionEmbrion.CBDestinoClick(Sender: TObject);
begin
  inherited;
  DBLCBADestino.Enabled := CBDestino.Checked;
  if CBDestino.Checked then
  begin
    DBLCBADestino.KeyValue := 1;
    Destino := 1;
  end
  else
    Destino := null;
  ActEmbriones();
end;

procedure TFSeleccionEmbrion.CBCentrosClick(Sender: TObject);
begin
  inherited;
  DBLCBACentrosTrans.Enabled := CBCentros.Checked;
  if CBCentros.Checked then
  begin
    DBLCBACentrosTrans.KeyValue := 1;
    Centro := 1;
  end
  else
    Centro := null;
  ActEmbriones();
end;

procedure TFSeleccionEmbrion.DBLCBAEstadioCloseUp(Sender: TObject);
begin
  inherited;
  Estadio := DBLCBAEstadio.KeyValue;
  ActEmbriones();
end;

procedure TFSeleccionEmbrion.DBLCBACalidadCloseUp(Sender: TObject);
begin
  inherited;
  Calidad := DBLCBACalidad.KeyValue;
  ActEmbriones();
end;

procedure TFSeleccionEmbrion.DBLCBADestinoCloseUp(Sender: TObject);
begin
  inherited;
  Destino := DBLCBADestino.KeyValue;
  ActEmbriones();
end;

procedure TFSeleccionEmbrion.DBLCBACentrosTransCloseUp(Sender: TObject);
begin
  inherited;
  Centro := DBLCBACentrosTrans.KeyValue;
  ActEmbriones();
end;

procedure TFSeleccionEmbrion.IBQEmbrionesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQEmbriones.Last;
  IBQEmbriones.First;
  GBEmbriones.Caption := Traducir('Embriones [')+IntToStr(IBQEmbriones.RecordCount)+']';
end;

procedure TFSeleccionEmbrion.FormShow(Sender: TObject);
begin
  inherited;
  ActMadres();
end;

end.
