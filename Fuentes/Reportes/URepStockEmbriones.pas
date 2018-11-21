unit URepStockEmbriones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  Grids, DBGrids, UBDBGrid, Buttons, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, DateUtils, EditAuto, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFRepStockEmbriones = class(TFUniversal)
    POpciones: TPanel;
    RGTipo: TRadioGroup;
    GBGrupos: TGroupBox;
    Label1: TLabel;
    DBLCBAGrupos: TDBLookupComboBoxAuto;
    GBFechas: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    Panel1: TPanel;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    DBLCBAPotreros: TDBLookupComboBoxAuto;
    PDatos: TPanel;
    GBAnimales: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    IBQRepStockEmbriones: TIBQuery;
    DSRepStockEmbriones: TDataSource;
    DBLCBAToro: TDBLookupComboBoxAuto;
    DBLCBADestino: TDBLookupComboBoxAuto;
    DBLCBADonante: TDBLookupComboBoxAuto;
    IBQMadres: TIBQuery;
    IBQPadres: TIBQuery;
    IBQDestinos: TIBQuery;
    DSMadres: TDataSource;
    DSPadres: TDataSource;
    DSDestinos: TDataSource;
    IBQGrupos: TIBQuery;
    IBQGruposID_GRUPO: TIntegerField;
    IBQGruposNOMBRE: TIBStringField;
    DSGrupos: TDataSource;
    GBFiltros: TGroupBox;
    GBTiposFiltros: TGroupBox;
    CBDestino: TCheckBox;
    CBDonante: TCheckBox;
    CBPadre: TCheckBox;
    CBPotrero: TCheckBox;
    CBRodeo: TCheckBox;
    IBQMadresID: TIntegerField;
    IBQMadresID_RP: TIBStringField;
    IBQMadresNOMBRE: TIBStringField;
    IBQMadresID_HBA: TIBStringField;
    IBQMadresINTERNA: TIBStringField;
    IBQPadresID: TIntegerField;
    IBQPadresID_RP: TIBStringField;
    IBQPadresNOMBRE: TIBStringField;
    IBQPadresID_HBA: TIBStringField;
    IBQPadresEXTERNO: TIBStringField;
    IBQMadresNOM: TStringField;
    IBQPadresNOM: TStringField;
    IBQEstabAnimalExt: TIBQuery;
    IBQRepStockEmbrionesRP_DONANTE: TIBStringField;
    IBQRepStockEmbrionesHBA_DONANTE: TIBStringField;
    IBQRepStockEmbrionesNOMBRE_DONANTE: TIBStringField;
    IBQRepStockEmbrionesRP_PADRE_1: TIBStringField;
    IBQRepStockEmbrionesHBA_PADRE_1: TIBStringField;
    IBQRepStockEmbrionesNOMBRE_PADRE_1: TIBStringField;
    IBQRepStockEmbrionesRP_PADRE_2: TIBStringField;
    IBQRepStockEmbrionesHBA_PADRE_2: TIBStringField;
    IBQRepStockEmbrionesNOMBRE_PADRE_2: TIBStringField;
    IBQRepStockEmbrionesFECHA_COLECTA: TDateField;
    IBQRepStockEmbrionesESTADIO_E: TIntegerField;
    IBQRepStockEmbrionesCALIDAD_E: TIntegerField;
    IBQRepStockEmbrionesDESTINO_E: TIBStringField;
    IBQRepStockEmbrionesMEDIO_E: TIBStringField;
    IBQRepStockEmbrionesCANT_EMBRIONES: TIntegerField;
    IBQRepStockEmbrionesID_DONANTE: TIntegerField;
    IBQRepStockEmbrionesMINT: TIBStringField;
    IBQRepStockEmbrionesID_PADRE_1: TIntegerField;
    IBQRepStockEmbrionesEXT1: TIBStringField;
    IBQRepStockEmbrionesID_PADRE_2: TIntegerField;
    IBQRepStockEmbrionesEXT2: TIBStringField;
    RGOrden: TRadioGroup;
    IBQRepStockEmbrionesID_RAZA_DONANTE: TIntegerField;
    IBQRepStockEmbrionesRAZA_DONANTE: TIBStringField;
    IBQRepStockEmbrionesSERIE: TIBStringField;
    CBSerie: TCheckBox;
    EASerie: TEditAuto;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    LExpExcel: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    LBuscarDonante: TLabel;
    EBuscarDonante: TEdit;
    LBuscarPadre: TLabel;
    EBuscarPadre: TEdit;
    IBuscarDonante: TImage;
    LDonante: TLabel;
    IBuscarPadre: TImage;
    LPadre: TLabel;
    CBFiltroDestino: TComboBox;
    CBFiltroGrupos: TComboBox;
    GConsulta: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    procedure FormCreate(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure RGFiltrosClick(Sender: TObject);
    procedure DBLCBAGruposCloseUp(Sender: TObject);
    procedure DBLCBARodeosCloseUp(Sender: TObject);
    procedure DBLCBAPotrerosCloseUp(Sender: TObject);
    procedure DBLCBADonanteCloseUp(Sender: TObject);
    procedure DBLCBAToroCloseUp(Sender: TObject);
    procedure DBLCBADestinoCloseUp(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure IBQRepStockEmbrionesAfterOpen(DataSet: TDataSet);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQGruposAfterOpen(DataSet: TDataSet);
    procedure CBDestinoClick(Sender: TObject);
    procedure CBDonanteClick(Sender: TObject);
    procedure CBPadreClick(Sender: TObject);
    procedure CBPotreroClick(Sender: TObject);
    procedure CBRodeoClick(Sender: TObject);
    procedure IBQMadresCalcFields(DataSet: TDataSet);
    procedure IBQPadresCalcFields(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure CBSerieClick(Sender: TObject);
    procedure EASerieChange(Sender: TObject);
    procedure IBuscarDonanteClick(Sender: TObject);
    procedure IBuscarPadreClick(Sender: TObject);
    procedure CBFiltroDestinoChange(Sender: TObject);
    procedure CBFiltroDestinoCloseUp(Sender: TObject);
    procedure CBFiltroGruposChange(Sender: TObject);
    procedure CBFiltroGruposCloseUp(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    potrero, rodeo, grupo, toro, donante, destino, donante_int, toro_ext, serie : Variant;
    por_fecha : Boolean;
    procedure ActConsulta();
    procedure AccederFichaPadres(ID : Integer; Externo : String);

    procedure CargarCombos;
  public
    { Public declarations }
  end;

var
  FRepStockEmbriones: TFRepStockEmbriones;
  SQLDestinos : string;
  DelDest, DelGrupo : boolean;

implementation

uses
  UPrincipal, UDMSoftvet, URepStockEmbrionesPreview, UCartel, UABMPadresExternos, UREPFichaAnimal,
  IBDButtonABM, UABMSimple, UTraduccion;

{$R *.dfm}

procedure TFRepStockEmbriones.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  IBQGrupos.Close;
  IBQGrupos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGrupos.Open;
  IBQMadres.Close;
  IBQMadres.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQMadres.Open;
  IBQPadres.Close;
  IBQPadres.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPadres.Open;
  IBQDestinos.Close;
  IBQDestinos.Open;
  DMSoftvet.IBQAfterOpen(IBQMadres);
  DMSoftvet.IBQAfterOpen(IBQPadres);
  DMSoftvet.IBQAfterOpen(IBQDestinos);
  DTPADesde.Date := IncYear(Date(),-1);
  DTPAHasta.Date := Date();
  por_fecha := true;
  rodeo := null;
  potrero := null;
  grupo := 0;
  toro := null;
  donante := null;
  destino := null;
  donante_int := null;
  toro_ext := null;
  serie := null;

  DelDest := false;
  CargarCombos;
end;

procedure TFRepStockEmbriones.ActConsulta();
var
  Cartel : TCartel;
  SQL : String;
begin
  Cartel := TCartel.getInstance;
  Cartel.abrircartel('Generando Informe de Stock de Embriones');

  SQL := 'select * from rep_stock_embriones(:establecimiento,:fecha_ini,:fecha_fin,:grupo,:potrero,:rodeo,:donante,:donante_int,:toro,:toro_ext,:destino,:nro_serie)';

  if (EBuscarDonante.Text <> '') then
    SQL := SQL + ' where ((RP_DONANTE LIKE ''%' +EBuscarDonante.Text+ '%'') OR (NOMBRE_DONANTE LIKE ''%' +EBuscarDonante.Text+ '%'') OR (APODO_DONANTE LIKE ''%' +EBuscarDonante.Text+ '%'') OR (HBA_DONANTE LIKE ''%' +EBuscarDonante.Text+ '%''))';

  if (EBuscarPadre.Text <> '') then
    SQL := SQL + ' where ((RP_PADRE_1 LIKE ''%' +EBuscarPadre.Text+ '%'') OR (NOMBRE_PADRE_1 LIKE ''%' +EBuscarPadre.Text+ '%'') OR (APODO_PADRE_1 LIKE ''%' +EBuscarPadre.Text+ '%'') OR (HBA_PADRE_1 LIKE ''%' +EBuscarPadre.Text+ '%'') OR (RP_PADRE_2 LIKE ''%' +EBuscarPadre.Text+ '%'') OR (NOMBRE_PADRE_2 LIKE ''%' +EBuscarPadre.Text+ '%'') OR (APODO_PADRE_2 LIKE ''%' +EBuscarPadre.Text+ '%'') OR (HBA_PADRE_2 LIKE ''%' +EBuscarPadre.Text+ '%''))';

  case RGOrden.ItemIndex of
    0 : SQl := SQL + ' order by fecha_colecta asc';
    1 : SQl := SQL + ' order by rp_donante asc';
    2 : SQl := SQL + ' order by rp_padre_1 asc';
    3 : SQl := SQL + ' order by raza_donante asc';
  end;

  IBQRepStockEmbriones.Close;
  IBQRepStockEmbriones.SQL.Clear;
  IBQRepStockEmbriones.SQL.Add(SQL);
  if por_fecha then
  begin
    IBQRepStockEmbriones.ParamByName('fecha_ini').AsDate := DTPADesde.Date;
    IBQRepStockEmbriones.ParamByName('fecha_fin').AsDate := DTPAHasta.Date;
    IBQRepStockEmbriones.ParamByName('grupo').Value := null;
  end
  else
  begin
    IBQRepStockEmbriones.ParamByName('fecha_ini').Value := null;
    IBQRepStockEmbriones.ParamByName('fecha_fin').Value := null;
    IBQRepStockEmbriones.ParamByName('grupo').Value := grupo;
  end;
  IBQRepStockEmbriones.ParamByName('rodeo').Value := rodeo;
  IBQRepStockEmbriones.ParamByName('potrero').Value := potrero;
  IBQRepStockEmbriones.ParamByName('donante').Value := donante;
  IBQRepStockEmbriones.ParamByName('donante_int').Value := donante_int;
  IBQRepStockEmbriones.ParamByName('toro').Value := toro;
  IBQRepStockEmbriones.ParamByName('toro_ext').Value := toro_ext;
  IBQRepStockEmbriones.ParamByName('destino').Value := destino;
  IBQRepStockEmbriones.ParamByName('nro_serie').Value := serie;
  IBQRepStockEmbriones.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRepStockEmbriones.Open;

  Cartel.cerrarcartel;
  Cartel.FreeInstance;
end;

procedure TFRepStockEmbriones.RGTipoClick(Sender: TObject);
begin
  inherited;
  if RGTipo.ItemIndex = 0 then
  begin
    GBFechas.Enabled := true;
    label2.Enabled := true;
    label3.Enabled := true;
    DTPADesde.Enabled := true;
    DTPAHasta.Enabled := true;
    CBFiltroGrupos.Enabled := false;
    CBFiltroGrupos.ItemIndex := 0;
    CBFiltroGruposChange(sender);
    por_fecha := true;
    grupo := 0;
  end;
  if RGTipo.ItemIndex = 1 then
  begin
    GBFechas.Enabled := false;
    label2.Enabled := false;
    label3.Enabled := false;
    DTPADesde.Enabled := false;
    DTPAHasta.Enabled := false;
    CBFiltroGrupos.Enabled := true;
    por_fecha := false;
    grupo := 0;
  end;
end;

procedure TFRepStockEmbriones.RGFiltrosClick(Sender: TObject);
begin
  inherited;
{  if RGFiltros.ItemIndex = 0 then
  begin
    CBDestino.Enabled := false;
    CBDonante.Enabled := false;
    CBPadre.Enabled := false;
    CBPotrero.Enabled := false;
    CBRodeo.Enabled := false;
    CBSerie.Enabled := false;
    DBLCBADonante.Enabled := false;
    DBLCBAPotreros.Enabled := false;
    DBLCBAToro.Enabled := false;
    DBLCBADestino.Enabled := false;
    DBLCBARodeos.Enabled := false;
    EASerie.Enabled := false;
    rodeo := null;
    potrero := null;
    toro := null;
    toro_ext := null;
    donante := null;
    donante_int := null;
    destino := null;
    serie := null;
    GBTiposFiltros.Enabled := false;
  end;
  if RGFiltros.ItemIndex = 1 then
  begin
    CBDestino.Enabled := true;
    CBDonante.Enabled := true;
    CBPadre.Enabled := true;
    CBPotrero.Enabled := true;
    CBRodeo.Enabled := true;
    GBTiposFiltros.Enabled := true;
    CBSerie.Enabled := true;
  end;
  ActConsulta();}
end;

procedure TFRepStockEmbriones.DBLCBAGruposCloseUp(Sender: TObject);
begin
  inherited;
  grupo := 0;
  if (DBLCBAGrupos.KeyValue <> null)then
    grupo := DBLCBAGrupos.KeyValue;
end;

procedure TFRepStockEmbriones.DBLCBARodeosCloseUp(Sender: TObject);
begin
  inherited;
  rodeo := DBLCBARodeos.KeyValue;
end;

procedure TFRepStockEmbriones.DBLCBAPotrerosCloseUp(Sender: TObject);
begin
  inherited;
  potrero := DBLCBAPotreros.KeyValue;
end;

procedure TFRepStockEmbriones.DBLCBADonanteCloseUp(Sender: TObject);
begin
  inherited;
  donante := DBLCBADonante.KeyValue;
  donante_int := IBQMadres.FieldValues['INTERNA'];
end;

procedure TFRepStockEmbriones.DBLCBAToroCloseUp(Sender: TObject);
begin
  inherited;
  toro := DBLCBAToro.KeyValue;
  toro_ext := IBQPadres.FieldValues['EXTERNO'];
end;

procedure TFRepStockEmbriones.DBLCBADestinoCloseUp(Sender: TObject);
begin
  inherited;
  destino := DBLCBADestino.KeyValue;
end;

procedure TFRepStockEmbriones.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFRepStockEmbriones.BBImprimirReporteClick(Sender: TObject);
var
  F : TFRepStockEmbrionesPreview;
  Cartel : TCartel;
begin
  inherited;
  HabilitarDesabilitarControles();
  Cartel := TCartel.getInstance;
  Cartel.abrircartel('Generando Reporte de Stock de Embriones');

  F := TFRepStockEmbrionesPreview.Create(nil);
  if por_fecha then
  begin
    F.QRLDesde.Enabled := true;
    F.QRLHasta.Enabled := true;
    F.QRLDesdeValue.Enabled := true;
    F.QRLHastaValue.Enabled := true;
    F.QRLDesdeValue.Caption := DateToStr(DTPADesde.Date);
    F.QRLHastaValue.Caption := DateToStr(DTPAHasta.Date);
    F.QRLGrupo.Enabled := false;
    F.QRLGrupoValue.Enabled := false;
  end
  else
  begin
    F.QRLDesde.Enabled := false;
    F.QRLHasta.Enabled := false;
    F.QRLDesdeValue.Enabled := false;
    F.QRLHastaValue.Enabled := false;
    F.QRLGrupo.Enabled := true;
    F.QRLGrupoValue.Enabled := true;
    F.QRLGrupoValue.Caption := DBLCBAGrupos.Text;
  end;

  F.QRLFiltros.Caption := '';

{  if RGFiltros.ItemIndex = 0 then
    F.QRLFiltros.Caption := Traducir('Todos')
  else
  begin
    F.QRLFiltros.Caption := ' - ';
    if CBDestino.Checked then
      F.QRLFiltros.Caption := F.QRLFiltros.Caption+Traducir(' Destino: ')+DBLCBADestino.Text+' - ';
    if CBDonante.Checked then
      F.QRLFiltros.Caption := F.QRLFiltros.Caption+Traducir(' Donante: ')+DBLCBADonante.Text+' - ';
    if CBPadre.Checked then
      F.QRLFiltros.Caption := F.QRLFiltros.Caption+Traducir(' Toro: ')+DBLCBAToro.Text+' - ';
    if CBRodeo.Checked then
      F.QRLFiltros.Caption := F.QRLFiltros.Caption+Traducir(' Rodeo: ')+DBLCBARodeos.Text+' - ';
    if CBPotrero.Checked then
      F.QRLFiltros.Caption := F.QRLFiltros.Caption+Traducir(' Potrero: ')+DBLCBAPotreros.Text+' - ';
  end; }

  Cartel.cerrarcartel;
  Cartel.FreeInstance;

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFRepStockEmbriones.IBQRepStockEmbrionesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  {BBImprimirReporte.Enabled := not DataSet.IsEmpty;
  BBXls.Enabled := not DataSet.IsEmpty;}
  IPreview.Enabled := not DataSet.IsEmpty;
  LPreview.Enabled := not DataSet.IsEmpty;
  LExpExcel.Enabled := not DataSet.IsEmpty;
  IExpExcel.Enabled := not DataSet.IsEmpty;
  DataSet.Last;
  DataSet.First;
  GBAnimales.Caption := 'Animales [ '+IntToStr(DataSet.RecordCount)+' ]'; 
end;

procedure TFRepStockEmbriones.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXlS.SaveToFile(SDXLS.FileName);
end;

procedure TFRepStockEmbriones.IBQGruposAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFRepStockEmbriones.CBDestinoClick(Sender: TObject);
begin
  inherited;
  if CBDestino.Checked then
  begin
    DBLCBADestino.Enabled := true;
    destino := 0;
  end
  else
  begin
    DBLCBADestino.Enabled := false;
    destino := null;
  end;
end;

procedure TFRepStockEmbriones.CBDonanteClick(Sender: TObject);
begin
  inherited;
  if CBDonante.Checked then
  begin
    DBLCBADonante.Enabled := true;
    donante := 0;
    donante_int := 'S';
  end
  else
  begin
    DBLCBADonante.Enabled := false;
    donante := null;
    donante_int := null;
  end;
end;

procedure TFRepStockEmbriones.CBPadreClick(Sender: TObject);
begin
  inherited;
  if CBPadre.Checked then
  begin
    DBLCBAToro.Enabled := true;
    toro := 0;
    toro_ext := 'N';
  end
  else
  begin
    DBLCBAToro.Enabled := false;
    toro := null;
    toro_ext := null;
  end;
end;

procedure TFRepStockEmbriones.CBPotreroClick(Sender: TObject);
begin
  inherited;
  if CBPotrero.Checked then
  begin
    DBLCBAPotreros.Enabled := true;
    potrero := 0;
  end
  else
  begin
    DBLCBAPotreros.Enabled := false;
    potrero := null;
  end;
end;

procedure TFRepStockEmbriones.CBRodeoClick( Sender: TObject);
begin
  inherited;
  if CBRodeo.Checked then
  begin
    DBLCBARodeos.Enabled := true;
    rodeo := 0;
  end
  else
  begin
    DBLCBARodeos.Enabled := false;
    rodeo := null;
  end;
end;

procedure TFRepStockEmbriones.IBQMadresCalcFields(DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('nombre').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['nombre'];
  if DataSet.FieldByName('id_hba').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['id_hba'];
  IBQMadresNOM.Value := nombre;
end;

procedure TFRepStockEmbriones.IBQPadresCalcFields(DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('nombre').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['nombre'];
  if DataSet.FieldByName('id_hba').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['id_hba'];
  IBQPadresNOM.Value := nombre;
end;

procedure TFRepStockEmbriones.AccederFichaPadres(ID : Integer; Externo : String);
var
  F : TFREPFichaAnimal;
  E : TFAbmPadresExternos;
  Iabm : IButtonABM;
begin
  if (Externo = 'N') then
  begin
    F := TFREPFichaAnimal.Create(self);
    F.animal := ID;
    F.ShowModal;
    F.Destroy;
  end
  else
    if (Iabm = nil) then
    begin
      IBQEstabAnimalExt.Close;
      IBQEstabAnimalExt.ParamByName('animal').AsInteger := ID;
      IBQEstabAnimalExt.Open;
      E := TFABMPadresExternos.Create(self);
      E.EstabAux := IBQEstabAnimalExt.FieldValues['establecimiento'];
      E.nom := inttostr(ID);
      E.id_animal_ex := ID;
      Iabm := IButtonABM(E);
      Iabm.ISetCampoRetorno('id_animal_externo');
      Iabm.IFitrate(-1,IBQEstabAnimalExt.FieldValues['establecimiento']);
      Iabm.IAbrir(faabm);
    end;
end;

procedure TFRepStockEmbriones.BDBGAnimalesDblClick(Sender: TObject);
var
  M_INT : String;
begin
  inherited;
  case BDBGAnimales.SelectedIndex of
    0,1,2 : begin
              if IBQRepStockEmbriones.FieldValues['MINT'] = 'S' then
                M_INT := 'N'
              else
                M_INT := 'S';
              AccederFichaPadres(IBQRepStockEmbriones.FieldValues['ID_DONANTE'],M_INT);
            end;
    4,5,6 : AccederFichaPadres(IBQRepStockEmbriones.FieldValues['ID_PADRE_1'],IBQRepStockEmbriones.FieldValues['EXT1']);
  end;
end;

procedure TFRepStockEmbriones.CBSerieClick(Sender: TObject);
begin
  inherited;
  if CBSerie.Checked then
  begin
    EASerie.Enabled := true;
    serie := '%';
  end
  else
  begin
    EASerie.Enabled := false;
    serie := null;
  end;
end;

procedure TFRepStockEmbriones.EASerieChange(Sender: TObject);
begin
  inherited;
  serie := EASerie.Text+'%';
end;

procedure TFRepStockEmbriones.IBuscarDonanteClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFRepStockEmbriones.IBuscarPadreClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFRepStockEmbriones.CargarCombos;
begin

     IBQGrupos.First;
     CBFiltroGrupos.AddItem('(TODOS)',nil);
     while not(IBQGrupos.Eof) do
     begin
          CBFiltroGrupos.AddItem(IBQGrupos.FieldValues['nombre'],nil);
          IBQGrupos.Next;
     end;

     IBQDestinos.First;
     CBFiltroDestino.AddItem('(TODOS)',nil);
     while not(IBQDestinos.Eof) do
     begin
          CBFiltroDestino.AddItem(IBQDestinos.FieldValues['nombre'],nil);
          IBQDestinos.Next;
     end;

     CBFiltroDestino.ItemIndex := 0;
     CBFiltroGrupos.ItemIndex := 0;
     CBFiltroGrupos.Enabled := false;
end;

procedure TFRepStockEmbriones.CBFiltroDestinoChange(Sender: TObject);
var txt : string;
begin
  inherited;

    txt := CBFiltroDestino.Text;

    if (txt = '(TODOS)')then
    begin
      destino := null;
      CBFiltroDestino.Items.Insert(0,'DESTINOS');
      CBFiltroDestino.ItemIndex := 0;
      DelDest := false;
    end
    else
    begin
      destino := IBQDestinos.Lookup('nombre',txt,'id_destino_embrion');
    end;
end;

procedure TFRepStockEmbriones.CBFiltroDestinoCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelDest) then
  begin
       CBFiltroDestino.Items.Delete(0);
       DelDest := true;
  end;
end;

procedure TFRepStockEmbriones.CBFiltroGruposChange(Sender: TObject);
var txt : string;
begin
  inherited;

    txt := CBFiltroGrupos.Text;

    if (txt = '(TODOS)')then
    begin
      grupo := 0;
      CBFiltroGrupos.Items.Insert(0,'GRUPOS');
      CBFiltroGrupos.ItemIndex := 0;
      DelGrupo := false;
    end
    else
    begin
      grupo := IBQGrupos.Lookup('nombre',txt,'id_grupo');
    end;
end;

procedure TFRepStockEmbriones.CBFiltroGruposCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelGrupo) then
  begin
       CBFiltroGrupos.Items.Delete(0);
       DelGrupo := true;
  end;
end;

procedure TFRepStockEmbriones.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFRepStockEmbriones.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
