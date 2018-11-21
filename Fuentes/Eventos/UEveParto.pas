unit UEveParto;

interface
//{$DEFINE EC}
//{$DEFINE DEMO}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  Buttons, ExtCtrls, DBCtrls, UDBLookupComboBoxAuto,
  DateTimePickerAuto, EditAuto, Mask, UDBEditAuto, IBUpdateSQL,
  UFrameMangazo, UDBControl, WinXP, DataExport, DataToXLS, UFunctions,
  ImgList, PngImageList, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF,
  JvExControls, JvLabel, JvFullColorSpaces, JvFullColorCtrls,
  JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  regAuxCuig = record
    id_cuig : integer;
    ultimo_ident : String;
  end;

  Arreglo = Array of regAuxCuig;

  TFEveParto = class(TFEveSimple)
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LRPAnimal: TLabel;
    LabelRPAnimalValor: TLabel;
    LTipoParto: TLabel;
    DBLCBATipoParto: TDBLookupComboBoxAuto;
    LCantidad: TLabel;
    EACantidadNacimientos: TEditAuto;
    UDNacidos: TUpDown;
    TSDistocia: TTabSheet;
    GBObservacion: TGroupBox;
    MAObservacionDistocia: TMemoAuto;
    GroupBox1: TGroupBox;
    LCausaDistocia: TLabel;
    LGradoDistocia: TLabel;
    DBLCBACausaDistocia: TDBLookupComboBoxAuto;
    DBLCBAGradoDistocia: TDBLookupComboBoxAuto;
    TSNacimientos: TTabSheet;
    GroupBox2: TGroupBox;
    LSexo: TLabel;
    LVivo: TLabel;
    DBLCBASexo: TDBLookupComboBoxAuto;
    DBLCBAVivoSN: TDBLookupComboBoxAuto;
    GBObservacionNacimiento: TGroupBox;
    MAObservacionNacimiento: TMemoAuto;
    LPeso: TLabel;
    CBIdentificacion: TCheckBox;
    GBIdentificacion: TGroupBox;
    LabelIDPC: TLabel;
    LabelIDHBA: TLabel;
    LabelIDRA: TLabel;
    LabelIDOtro: TLabel;
    LRP: TLabel;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleESTABLECIMIENTO: TIntegerField;
    IBDSSimpleID_AUX: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_PC: TIBStringField;
    IBDSSimpleID_HBA: TIBStringField;
    IBDSSimpleID_RA: TIBStringField;
    IBDSSimpleID_OTRO: TIBStringField;
    IBDSSimpleNOMBRE: TIBStringField;
    IBDSSimpleFECHA_NACIMIENTO: TDateField;
    IBDSSimpleSEXO: TIntegerField;
    IBDSSimpleORIGEN: TIBStringField;
    IBDSSimpleESTADO_REPRODUCTIVO: TIntegerField;
    IBDSSimpleESTADO_LACTACION: TIntegerField;
    IBDSSimplePOTRERO: TIntegerField;
    IBDSSimpleRAZA: TIntegerField;
    IBDSSimpleRODEO: TIntegerField;
    IBDSSimpleCATEGORIA: TIntegerField;
    IBDSSimpleACTIVO: TIBStringField;
    IBDSSimpleCRONOLOGIA_DENTARIA: TIntegerField;
    IBDSSimpleCONDICION_CORPORAL: TIntegerField;
    IBDSSimpleMADRE_BIOLOGICA_EXTERNA: TIntegerField;
    IBDSSimpleMADRE_RECEPTORA_EXTERNA: TIntegerField;
    IBDSSimpleGDR: TIntegerField;
    IBDSSimplePADRE_EXTERNO: TIntegerField;
    IBDSSimpleMADRE_BIOLOGICA_INTERNA: TIntegerField;
    IBDSSimpleMADRE_RECEPTORA_INTERNA: TIntegerField;
    IBDSSimplePADRE_INTERNO: TIntegerField;
    IBDSSimpleAPODO: TIBStringField;
    IBQAnimal: TIBQuery;
    IBDSNacidos: TIBDataSet;
    DSNacidos: TDataSource;
    DBEAPeso: TDBEditAuto;
    DBEARP: TDBEditAuto;
    DBEASen: TDBEditAuto;
    DBEAPC: TDBEditAuto;
    DBEAOtro: TDBEditAuto;
    DBEARA: TDBEditAuto;
    DBEAHBA: TDBEditAuto;
    IBDSNacidosID_NACIMIENTO: TIntegerField;
    IBDSNacidosID_RP: TIBStringField;
    IBDSNacidosID_SENASA: TIBStringField;
    IBDSNacidosID_PC: TIBStringField;
    IBDSNacidosID_HBA: TIBStringField;
    IBDSNacidosID_RA: TIBStringField;
    IBDSNacidosID_OTRO: TIBStringField;
    IBDSNacidosIDENTIFICO: TIBStringField;
    IBDSNacidosSEXO: TIBStringField;
    IBDSNacidosVIVO: TIBStringField;
    IBDSNacidosID_SEXO: TIntegerField;
    IBDSNacidosID_VIVO: TIBStringField;
    GBPadres: TGroupBox;
    BDBGPadresAutoCalculados: TBitDBGrid;
    IBQPadresAutocalculados: TIBQuery;
    DSPadresAutoCalculados: TDataSource;
    IBQPadres: TIBQuery;
    IBQPadresID_ANIMAL_EXTERNO: TIntegerField;
    IBQPadresID_OTRO: TIBStringField;
    IBQPadresID_AUX: TIntegerField;
    IBQPadresID_PC: TIBStringField;
    IBQPadresID_HBA: TIBStringField;
    IBQPadresID_RA: TIBStringField;
    IBQPadresID_RP: TIBStringField;
    IBQPadresID_SENASA: TIBStringField;
    IBQPadresNOMBRE: TIBStringField;
    IBQPadresAPODO: TIBStringField;
    IBQPadresRAZA: TIntegerField;
    IBQPadresSEXO: TIntegerField;
    IBQPadresINTERNO: TIBStringField;
    IBQPadresAutocalculadosID_BUSQUEDA: TIntegerField;
    CBPadresAutoCalculados: TCheckBox;
    IBQTodosPadres: TIBQuery;
    LPadres: TLabel;
    DSTodosPadres: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    IBUSQLPadres: TIBUpdateSQL;
    IBQGenerador: TIBQuery;
    IBQTodosPadresKEYVALUE: TIBStringField;
    IBQTodosPadresID: TIntegerField;
    IBQTodosPadresID_RP: TIBStringField;
    IBQTodosPadresLISTFIELD: TIBStringField;
    IBQTodosPadresINTERNO: TIBStringField;
    IBQSPRNRESULT: TIBStringField;
    IBQSPRNMENSAJE: TIBStringField;
    BitDBGrid2: TBitDBGrid;
    RBCUIGSenasa: TRadioButton;
    CBCUIGPropio: TCheckBox;
    DBLCBACUIGPropio: TDBLookupComboBoxAuto;
    EAUltimoIdent: TMaskEdit;
    EAEncabezado: TMaskEdit;
    EVerificador: TEdit;
    RBSenasa: TRadioButton;
    IBQBuscarCUIG: TIBQuery;
    IBQActCUIG: TIBQuery;
    IBQCantCuigs: TIBQuery;
    LCUIGPropio: TLabel;
    DBLCBACondCorp: TDBLookupComboBoxAuto;
    CBCondCorp: TCheckBox;
    LIdentificacionElectronica: TLabel;
    DBEAIdentificacionElectronica: TDBEditAuto;
    IBDSNacidosID_IE: TIBStringField;
    GBMadreB: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    LRPMadreB: TLabel;
    LInternaMadreB: TLabel;
    IBQMadre: TIBQuery;
    EAPrefijo: TEditAuto;
    EARpInicial: TEditAuto;
    EASufijo: TEditAuto;
    IBDSSimpleCIRCUNFERENCIA_ESCROTAL2: TFloatField;
    IBDSNacidosPESO: TFloatField;
    IBDSSimplePESO: TFloatField;
    GBPadre: TGroupBox;
    LNombrePadre: TLabel;
    LApodoPadre: TLabel;
    LSenansaPadre: TLabel;
    LPCPadre: TLabel;
    LHBAPadre: TLabel;
    LRAPadre: TLabel;
    LOtroPadre: TLabel;
    LRPPadre: TLabel;
    SBPadre: TSpeedButton;
    JvFullColorLabel1: TJvFullColorLabel;
    JvFullColorLabel2: TJvFullColorLabel;
    LSeleccionP: TLabel;
    LBusqueda: TLabel;
    IBuscarP: TImage;
    LBuscarP: TLabel;
    IAgregarP: TImage;
    LAgregarP: TLabel;
    CBPInt: TCheckBox;
    CBPExt: TCheckBox;
    ERPPadre: TEdit;
    Button3: TButton;
    DBLCBAColor: TDBLookupComboBoxAuto;
    LColor: TLabel;
    IBQColor: TIBQuery;
    IBDSNacidosCOLOR: TIntegerField;
    DSColor: TDataSource;
    IBDSNacidosNOMCOLOR: TIBStringField;
    IBDSNacidosNOMBRE: TIBStringField;
    DBEANombre: TDBEditAuto;
    LabelNombre: TLabel;
    IBQCriador: TIBQuery;
    L1: TLabel;
    L2: TLabel;
    L3: TLabel;
    DBEAApodo: TDBEditAuto;
    LabelApodo: TLabel;
    IBDSNacidosAPODO: TIBStringField;
    procedure CBIdentificacionClick(Sender: TObject);
    procedure DBLCBATipoPartoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Validar10(Sender: TObject; var Key: Char);
    procedure Validar9(Sender: TObject; var Key: Char);
    procedure EACantidadNacimientosChange(Sender: TObject);
    procedure DBLCBASexoCloseUp(Sender: TObject);
    procedure DBLCBAVivoSNCloseUp(Sender: TObject);
    procedure DBEAPesoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEAPesoChange(Sender: TObject);
    procedure BDBGNacidosCellClick(Column: TColumn);
    procedure Change(Sender: TObject);
    procedure CBPadresAutoCalculadosClick(Sender: TObject);
    procedure DBLCBATodosPadresCloseUp(Sender: TObject);
    procedure DBLCBATodosPadresKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBASexoEnter(Sender: TObject);
    procedure DBLCBAVivoSNEnter(Sender: TObject);
    procedure DBEAPesoEnter(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure autocalculadoPadres();
    procedure DTPAFechaChange(Sender: TObject);
    procedure DBLCBASexoClick(Sender: TObject);
    procedure DBLCBAVivoSNClick(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure RBSenasaClick(Sender: TObject);
    procedure RBCUIGSenasaClick(Sender: TObject);
    procedure CBCUIGPropioClick(Sender: TObject);
    procedure DBLCBACUIGPropioCloseUp(Sender: TObject);
    procedure EAEncabezadoExit(Sender: TObject);
    procedure EAUltimoIdentExit(Sender: TObject);
    procedure EAEncabezadoChange(Sender: TObject);
    procedure DTPAFechaCloseUp(Sender: TObject);
    procedure DBLCBAResponsableCloseUp(Sender: TObject);
    procedure DBLCBACausaDistociaCloseUp(Sender: TObject);
    procedure DBEARPKeyPress(Sender: TObject; var Key: Char);
    procedure DBEAPCKeyPress(Sender: TObject; var Key: Char);
    procedure DBEAHBAKeyPress(Sender: TObject; var Key: Char);
    procedure DBEARAKeyPress(Sender: TObject; var Key: Char);
    procedure DBEAOtroKeyPress(Sender: TObject; var Key: Char);
    procedure EAEncabezadoKeyPress(Sender: TObject; var Key: Char);
    procedure EAUltimoIdentKeyPress(Sender: TObject; var Key: Char);
    procedure CBCUIGPropioKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAGradoDistociaCloseUp(Sender: TObject);
    procedure DBLCBAVivoSNKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBASexoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEASenKeyPress(Sender: TObject; var Key: Char);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure LCUIGPropioClick(Sender: TObject);
    procedure LCUIGPropioMouseEnter(Sender: TObject);
    procedure LCUIGPropioMouseLeave(Sender: TObject);
    procedure CBCondCorpClick(Sender: TObject);
    procedure EARPChange(Sender : TOBject);
    procedure EARPOnExit(Sender : TObject);
    procedure EARpInicialKeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure ERPPadreKeyPress(Sender: TObject; var Key: Char);
    procedure ERPPadreChange(Sender: TObject);
    procedure IAgregarPClick(Sender: TObject);
    procedure IBQColorAfterOpen(DataSet: TDataSet);
    procedure DBLCBAColorCloseUp(Sender: TObject);
  private
    Total : Integer;
    Identificadores : Arreglo;
    IDMadreB : Variant;
    id_padre : INteger;
    IDRp : String;
    RPMadreBIO : String;
    TipoPadre : String;
    PrefijoNombre : String;
    procedure generarIdAgregandoPadre();
    procedure filtrarPadres(id:integer);
    Procedure limpiarNacimiento;
    function PuedeGrabarParto:boolean;
    procedure ActualizarCUIG();
    procedure AgregarMadreB(RP, Interna : String; ID : Variant);
    function AgregarAnimalExterno(Sexo : Integer) : Integer;
    { Private declarations }
  protected
    Procedure CargarParametrosRN;override;
    Procedure CargarParametrosSP;override;
    function PuedeGrabar:boolean; override;
    procedure AsignarValoresDefecto;override;
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
  public
    { Public declarations }
    procedure HabilitarCamposIdentificacion(valor: boolean);
    procedure MostrarCamposIdentificacion(valor: boolean);
    procedure HandlerOnExitSenasa(Sender: TObject);    
  end;

var
  FEveParto: TFEveParto;
  aux_padre_auto : integer;
  aux_padre_manual : integer;
  posision : integer;
  recorriendo : boolean;

implementation

uses UDMSoftvet, UPrincipal, UEveUniversal, UMensajeHuella, UABMEmpleados,
     UABMModificarCUIG, UTraduccion, UPosiblesMadres,UAbmPadresExternos,IBDButtonABM, UAbmSimple;

{$R *.dfm}


procedure TFEveParto.CBIdentificacionClick(Sender: TObject);
var
  aux_RP : String;
begin
  inherited;
  EAEncabezado.TabOrder:=1;
  GBIdentificacion.Enabled := CBIdentificacion.Checked;
  IBDSNacidos.Edit;
  if (CBIdentificacion.Checked) then
    begin
      IBDSNacidos.FieldByName('identifico').AsString := 'S';
      IBDSNacidos.Post;
      HabilitarCamposIdentificacion(true);
      if IBDSNacidos.FieldValues['ID_RP'] <> null then
      begin
        aux_RP := IBDSNacidos.FieldValues['ID_RP'];
        EARpInicial.Text := aux_RP;
        EASufijo.Text := '';
        EAPrefijo.Text := '';
      end;
    end
  else
    begin
      IBDSNacidos.FieldByName('identifico').AsString := 'N';
      IBDSNacidos.Edit;
      //DBEARP.Text := '';
      IBDSNacidos.Edit;
      DBEASen.Text := '';
      IBDSNacidos.Edit;
      DBEAPC.Text := '';
      IBDSNacidos.Edit;
      DBEAHBA.Text := '';
      IBDSNacidos.Edit;
      DBEARA.Text := '';
      IBDSNacidos.Edit;
      DBEAOtro.Text := '';
      IBDSNacidos.Edit;
      DBEANombre.Text := '';
      IBDSNacidos.Edit;
      DBEAApodo.Text := '';
      IBDSNacidos.Edit;
      DBEAIdentificacionElectronica.Text := '';
      EAEncabezado.Clear;
      EAUltimoIdent.Clear;
      EVerificador.Clear;
      EAPrefijo.Clear;
      EASufijo.Clear;
      EARpInicial.Clear;
      //IBDSNacidos.Post;
      HabilitarCamposIdentificacion(false);
    end;
    if (CBIdentificacion.Checked) then
      begin
        //DBEARP.SetFocus;
        //DBEARP.SelectAll;
        EAPrefijo.SetFocus;
      end;
  ControlEventoOnExit(nil);
end;

procedure TFEveParto.HabilitarCamposIdentificacion(valor: boolean);
begin
  RBSenasa.Enabled:= valor;
  DBEASen.Enabled:= valor;
  CBCUIGPropio.Enabled:= valor;
  LCUIGPropio.Enabled:= valor;
  RBCUIGSenasa.Enabled:= valor;
  EAEncabezado.Enabled:= valor;
  EAUltimoIdent.Enabled:= valor;
  EVerificador.Enabled:= valor;
  DBLCBACUIGPropio.Enabled:= valor;
  //DBEARP.Enabled:= valor;
  DBEAPC.Enabled:= valor;
  DBEAHBA.Enabled:= valor;
  DBEARA.Enabled:= valor;
  DBEAOtro.Enabled:= valor;
  DBEAIdentificacionElectronica.Enabled:= valor;  
  LRP.Enabled:= valor;
  LabelIDPC.Enabled:= valor;
  LabelIDHBA.Enabled:= valor;
  LabelIDRA.Enabled:= valor;
  LabelIDOtro.Enabled:= valor;
  LIdentificacionElectronica.Enabled:= valor;
  GBIdentificacion.Enabled:= valor;
  EAPrefijo.Enabled := valor;
  EASufijo.Enabled := valor;
  EARPInicial.Enabled := valor;
  EARPInicial.EsRequerido := valor;
  LabelNombre.Enabled := valor;
  DBEANombre.Enabled := valor;
  LabelApodo.Enabled:= valor;
  DBEAApodo.Enabled := valor;
end;

procedure TFEveParto.DBLCBATipoPartoCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBATipoParto.KeyValue = 2) then
    begin
      TSDistocia.TabVisible := true;
      DBLCBACausaDistocia.EsRequerido := true;
      DBLCBAGradoDistocia.EsRequerido := true;
    end
  else
    begin
      TSDistocia.TabVisible := false;
      DBLCBACausaDistocia.EsRequerido := false;
      DBLCBAGradoDistocia.EsRequerido := false;
    end;
  EACantidadNacimientos.SetFocus;
  EACantidadNacimientos.SelectAll;
end;

procedure TFEveParto.FormCreate(Sender: TObject);
var
  IParto, IDistocia, INacimientos, IPartoA, IDistociaA, INacimientosA : TBitmap;
begin
  recorriendo := false;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;

  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').AsString := 'SN';
  DMSoftvet.IBQCodigosGenericos.Open;

  IBQCriador.Close;
  IBQCriador.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCriador.Open;

  if IBQCriador.IsEmpty then
    PrefijoNombre := ''
  else
  begin
    if IBQCriador.FieldByName('prefijo').Value <> null then
      PrefijoNombre := IBQCriador.FieldValues['prefijo']
    else
      PrefijoNombre := '';
  end;

  DMSoftvet.DSTiposParto.DataSet.Open;
  DMSoftvet.DSCausaDistocia.DataSet.Open;
  DMSoftvet.DSGradoAsistencia.DataSet.Open;
  DMSoftvet.DSTipoSexo.DataSet.Open;
  TSDistocia.TabVisible := false;
  DSNacidos.DataSet.Open;
  DTPAFecha.DateTime := now;
//  DTPAFecha.MaxDate:= now;

  DMSoftvet.IBQCUIGActual.Close;
  DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQCUIGActual.Open;

  IBQCantCuigs.Close;
  IBQCantCuigs.Open;
  SetLength(Identificadores,IBQCantCuigs.fieldByName('cantidad').AsInteger);
  Total := 0;
  DBEASen.SetOnExit(HandlerOnExitSenasa);

  IDMadreB := null;
  RPMadreBIO := '%';
  aux_padre_auto := -1;
  aux_padre_manual := -1;
  inherited;
  try
    ILVets.Clear;
    IParto := TBitmap.Create;
    IDistocia := TBitmap.Create;
    INacimientos := TBitmap.Create;
    IPartoA := TBitmap.Create;
    IDistociaA := TBitmap.Create;
    INacimientosA := TBitmap.Create;
    IParto.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Parto.bmp');
    IDistocia.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Distocia.bmp');
    INacimientos.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Nacimientos.bmp');
    IPartoA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\PartoA.bmp');
    IDistociaA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\DistociaA.bmp');
    INacimientosA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\NacimientosA.bmp');
    ILVets.Add(IManga,nil);
    ILVets.Add(IParto,nil);
    ILVets.Add(IDistocia,nil);
    ILVets.Add(INacimientos,nil);
    ILVets.Add(IGrilla,nil);
    ILVets.Add(IMangaA,nil);
    ILVets.Add(IPartoA,nil);
    ILVets.Add(IDistociaA,nil);
    ILVets.Add(INacimientosA,nil);
    ILVets.Add(IGrillaA,nil);

    TSDatos.ImageIndex := 1;
    TSDistocia.ImageIndex := 2;
    TSNacimientos.ImageIndex := 3;

  except
  end;

end;

procedure TFEveParto.FormShow(Sender: TObject);
begin
  inherited;
  // busco datos de la madre necesitados por el evento
  IBQAnimal.Close;
  IBQAnimal.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQAnimal.ParamByName('animal').Value := IDAnimal;
  IBQAnimal.Open;

  DBLCBAColor.Visible := (IBQAnimal.FieldByName('raza').AsInteger = 2) or (IBQAnimal.FieldByName('raza').AsInteger = 3) or (IBQAnimal.FieldByName('raza').AsInteger = 29) or (IBQAnimal.FieldByName('raza').AsInteger = 30);
  DBLCBAColor.EsRequerido := (IBQAnimal.FieldByName('raza').AsInteger = 2) or (IBQAnimal.FieldByName('raza').AsInteger = 3) or (IBQAnimal.FieldByName('raza').AsInteger = 29) or (IBQAnimal.FieldByName('raza').AsInteger = 30);
  DBLCBAColor.EsClave := (IBQAnimal.FieldByName('raza').AsInteger = 2) or (IBQAnimal.FieldByName('raza').AsInteger = 3) or (IBQAnimal.FieldByName('raza').AsInteger = 29) or (IBQAnimal.FieldByName('raza').AsInteger = 30);
  LColor.Visible := (IBQAnimal.FieldByName('raza').AsInteger = 2) or (IBQAnimal.FieldByName('raza').AsInteger = 3) or (IBQAnimal.FieldByName('raza').AsInteger = 29) or (IBQAnimal.FieldByName('raza').AsInteger = 30);
  
  autocalculadoPadres;
  
  // para seleccion de padres manualmente
  IBQTodosPadres.Close;
  IBQTodosPadres.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQTodosPadres.Open;

  MSimple.PasarParametros(2,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo

  DBLCBACausaDistocia.EsRequerido := false;
  DBLCBAGradoDistocia.EsRequerido := false;

  //// aca agregue codigo para que el lookupcombobox DBLCBATodosPadres
  IBQTodosPadres.Last;
  IBQTodosPadres.First;
  ////
  CBIdentificacion.Checked:= false;
  HabilitarCamposIdentificacion(false);
  ComponentesVisiblesPorPais(FPrincipal.Pais);
end;


// implemento el metodo para verificar las reglas del negocio
procedure TFEveParto.CargarParametrosRN;
var cont : integer;
begin
  inherited;
  IBQSPRN.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
  IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
  cont := 1;
  IBDSNacidos.First;
  while not(IBDSNacidos.Eof) do
    begin
      case cont of
        1 : begin
              if (IBDSNacidos.FieldByName('peso').AsInteger <>  0) then
                IBQSPRN.ParamByName('p').AsInteger   := IBDSNacidos.FieldByName('peso').AsInteger;
              if (IBDSNacidos.FieldByName('identifico').AsString = 'S') then
                begin
                  IBQSPRN.ParamByName('rp').Value   := IBDSNacidos.FieldValues['id_rp'];
                  IBQSPRN.ParamByName('sen').Value  := IBDSNacidos.FieldValues['id_senasa'];
                  IBQSPRN.ParamByName('pc').Value   := IBDSNacidos.FieldValues['id_pc'];
                  IBQSPRN.ParamByName('hba').Value  := IBDSNacidos.FieldValues['id_hba'];
                  IBQSPRN.ParamByName('ra').Value   := IBDSNacidos.FieldValues['id_ra'];
                  IBQSPRN.ParamByName('otro').Value := IBDSNacidos.FieldValues['id_otro'];
                  IBQSPRN.ParamByName('ie').Value := IBDSNacidos.FieldValues['id_ie'];
                end;
              IBQSPRN.ParamByName('sexo').Value := IBDSNacidos.FieldValues['id_sexo'];
              IBQSPRN.ParamByName('co').Value := null;
            end;
        2 : begin
              if (IBDSNacidos.FieldByName('peso').AsInteger <>  0) then
                IBQSPRN.ParamByName('p1').AsInteger   := IBDSNacidos.FieldByName('peso').AsInteger;
              if (IBDSNacidos.FieldByName('identifico').AsString = 'S') then
                begin
                  IBQSPRN.ParamByName('rp1').Value   := IBDSNacidos.FieldValues['id_rp'];
                  IBQSPRN.ParamByName('sen1').Value  := IBDSNacidos.FieldValues['id_senasa'];
                  IBQSPRN.ParamByName('pc1').Value   := IBDSNacidos.FieldValues['id_pc'];
                  IBQSPRN.ParamByName('hba1').Value  := IBDSNacidos.FieldValues['id_hba'];
                  IBQSPRN.ParamByName('ra1').Value   := IBDSNacidos.FieldValues['id_ra'];
                  IBQSPRN.ParamByName('otro1').Value := IBDSNacidos.FieldValues['id_otro'];
                  IBQSPRN.ParamByName('ie1').Value := IBDSNacidos.FieldValues['id_ie'];
                end;
              IBQSPRN.ParamByName('sexo1').Value := IBDSNacidos.FieldValues['id_sexo'];
            end;                                                                    
        3 : begin
              if (IBDSNacidos.FieldByName('peso').AsInteger <>  0) then
                IBQSPRN.ParamByName('p2').AsInteger   := IBDSNacidos.FieldByName('peso').AsInteger;
              if (IBDSNacidos.FieldByName('identifico').AsString = 'S') then
                begin
                  IBQSPRN.ParamByName('rp2').Value   := IBDSNacidos.FieldValues['id_rp'];
                  IBQSPRN.ParamByName('sen2').Value  := IBDSNacidos.FieldValues['id_senasa'];
                  IBQSPRN.ParamByName('pc2').Value   := IBDSNacidos.FieldValues['id_pc'];
                  IBQSPRN.ParamByName('hba2').Value  := IBDSNacidos.FieldValues['id_hba'];
                  IBQSPRN.ParamByName('ra2').Value   := IBDSNacidos.FieldValues['id_ra'];
                  IBQSPRN.ParamByName('otro2').Value := IBDSNacidos.FieldValues['id_otro'];
                  IBQSPRN.ParamByName('ie2').Value := IBDSNacidos.FieldValues['id_ie'];                  
                end;
              IBQSPRN.ParamByName('sexo2').Value := IBDSNacidos.FieldValues['id_sexo'];
            end;
      end;
      inc(cont);
      IBDSNacidos.Next;
    end;
end;

// implemento el metodo para cargar el evento en la base de datos
procedure TFEveParto.CargarParametrosSP;
var cont : integer;
    ultimo, ultimoID : String;
begin
  inherited;
  ultimo := '000000000';
  ultimoID := '0000';
  IBQSPEventoInd.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
  IBQSPEventoInd.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('responsable').value := DBLCBAResponsable.KeyValue;
  IBQSPEventoInd.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('log_fecha_modificado').AsDateTime := now;
  IBQSPEventoInd.ParamByName('animal').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('madre_biologica').Value := IDMadreB;
  IBQSPEventoInd.ParamByName('potrero').AsInteger := IBQAnimal.fieldByName('potrero').AsInteger;
  IBQSPEventoInd.ParamByName('rodeo').AsInteger := IBQAnimal.fieldByName('rodeo').AsInteger;
  IBQSPEventoInd.ParamByName('observacion').AsString := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('cantidad').AsInteger := StrToInt(EACantidadNacimientos.Text);
  if DBLCBACondCorp.Enabled then
    IBQSPEventoInd.ParamByName('condicion_corporal').AsInteger := DBLCBACondCorp.KeyValue
  else
    IBQSPEventoInd.ParamByName('condicion_corporal').Value := null;
  if (TSDistocia.TabVisible) then
    begin
      IBQSPEventoInd.ParamByName('causa').AsInteger := DBLCBACausaDistocia.KeyValue;
      IBQSPEventoInd.ParamByName('grado').AsInteger := DBLCBAGradoDistocia.KeyValue;
      IBQSPEventoInd.ParamByName('observacion_distocia').AsString := MAObservacionDistocia.GetDato;
    end;

  cont := 1;
  IBDSNacidos.First;
  while not(IBDSNacidos.Eof) do
    begin
      case cont of
        1 : begin
              IBQSPEventoInd.ParamByName('sexo0').AsInteger := IBDSNacidos.FieldValues['id_sexo'];
              IBQSPEventoInd.ParamByName('vivo0').AsString := IBDSNacidos.FieldValues['id_vivo'];
              if (IBDSNacidos.FieldByName('peso').AsInteger <>  0) then
                IBQSPEventoInd.ParamByName('peso0').AsInteger := IBDSNacidos.FieldByName('peso').AsInteger
              else
                IBQSPEventoInd.ParamByName('peso0').AsInteger := 0;

              if (IBDSNacidos.FieldByName('identifico').AsString = 'S') then
                begin
                  IBQSPEventoInd.ParamByName('rp0').value   := IBDSNacidos.FieldValues['id_rp'];
                  IBQSPEventoInd.ParamByName('sen0').Value  := IBDSNacidos.FieldValues['id_senasa'];
                  IBQSPEventoInd.ParamByName('pc0').Value   := IBDSNacidos.FieldValues['id_pc'];
                  IBQSPEventoInd.ParamByName('hba0').Value  := IBDSNacidos.FieldValues['id_hba'];
                  IBQSPEventoInd.ParamByName('ra0').Value   := IBDSNacidos.FieldValues['id_ra'];
                  IBQSPEventoInd.ParamByName('otro0').Value := IBDSNacidos.FieldValues['id_otro'];
                  IBQSPEventoInd.ParamByName('ie0').Value := IBDSNacidos.FieldValues['id_ie'];
                  IBQSPEventoInd.ParamByName('nombre0').Value := IBDSNacidos.FieldValues['nombre'];
                  IBQSPEventoInd.ParamByName('apodo0').Value := IBDSNacidos.FieldValues['apodo'];
                  if (ultimo < IBDSNacidos.FieldValues['id_senasa']) then
                    ultimo := IBDSNacidos.FieldValues['id_senasa'];
                  if not DBLCBAColor.Visible then
                    IBQSPEventoInd.ParamByName('COLOR0').Value := 0
                  else
                    IBQSPEventoInd.ParamByName('COLOR0').Value := IBDSNacidos.FieldValues['COLOR'];
                end;
            end;
        2 : begin
              IBQSPEventoInd.ParamByName('sexo1').AsInteger := IBDSNacidos.FieldValues['id_sexo'];
              IBQSPEventoInd.ParamByName('vivo1').AsString := IBDSNacidos.FieldValues['id_vivo'];
              if (IBDSNacidos.FieldByName('peso').AsInteger <>  0) then
                IBQSPEventoInd.ParamByName('peso1').AsInteger   := IBDSNacidos.FieldByName('peso').AsInteger
              else
                IBQSPEventoInd.ParamByName('peso1').AsInteger := 0;

              if (IBDSNacidos.FieldByName('identifico').AsString = 'S') then
                begin
                  IBQSPEventoInd.ParamByName('rp1').value   := IBDSNacidos.FieldValues['id_rp'];
                  IBQSPEventoInd.ParamByName('sen1').Value  := IBDSNacidos.FieldValues['id_senasa'];
                  IBQSPEventoInd.ParamByName('pc1').Value   := IBDSNacidos.FieldValues['id_pc'];
                  IBQSPEventoInd.ParamByName('hba1').Value  := IBDSNacidos.FieldValues['id_hba'];
                  IBQSPEventoInd.ParamByName('ra1').Value   := IBDSNacidos.FieldValues['id_ra'];
                  IBQSPEventoInd.ParamByName('otro1').Value := IBDSNacidos.FieldValues['id_otro'];
                  IBQSPEventoInd.ParamByName('ie1').Value := IBDSNacidos.FieldValues['id_ie'];
                  IBQSPEventoInd.ParamByName('nombre1').Value := IBDSNacidos.FieldValues['nombre'];
                  IBQSPEventoInd.ParamByName('apodo1').Value := IBDSNacidos.FieldValues['apodo'];
                  if (ultimo < IBDSNacidos.FieldValues['id_senasa']) then
                    ultimo := IBDSNacidos.FieldValues['id_senasa'];
                  if not DBLCBAColor.Visible then
                    IBQSPEventoInd.ParamByName('COLOR1').Value := 0
                  else
                    IBQSPEventoInd.ParamByName('COLOR1').Value := IBDSNacidos.FieldValues['COLOR'];
                end;
            end;
        3 : begin
              IBQSPEventoInd.ParamByName('sexo2').AsInteger := IBDSNacidos.FieldValues['id_sexo'];
              IBQSPEventoInd.ParamByName('vivo2').AsString := IBDSNacidos.FieldValues['id_vivo'];
              if (IBDSNacidos.FieldByName('peso').AsInteger <>  0) then
                IBQSPEventoInd.ParamByName('peso2').AsInteger   := IBDSNacidos.FieldByName('peso').AsInteger
              else
                IBQSPEventoInd.ParamByName('peso2').AsInteger := 0;

              if (IBDSNacidos.FieldByName('identifico').AsString = 'S') then
                begin
                  IBQSPEventoInd.ParamByName('rp2').value   := IBDSNacidos.FieldValues['id_rp'];
                  IBQSPEventoInd.ParamByName('sen2').Value  := IBDSNacidos.FieldValues['id_senasa'];
                  IBQSPEventoInd.ParamByName('pc2').Value   := IBDSNacidos.FieldValues['id_pc'];
                  IBQSPEventoInd.ParamByName('hba2').Value  := IBDSNacidos.FieldValues['id_hba'];
                  IBQSPEventoInd.ParamByName('ra2').Value   := IBDSNacidos.FieldValues['id_ra'];
                  IBQSPEventoInd.ParamByName('otro2').Value := IBDSNacidos.FieldValues['id_otro'];
                  IBQSPEventoInd.ParamByName('ie2').Value := IBDSNacidos.FieldValues['id_ie'];
                  IBQSPEventoInd.ParamByName('nombre2').Value := IBDSNacidos.FieldValues['nombre'];
                  IBQSPEventoInd.ParamByName('apodo2').Value := IBDSNacidos.FieldValues['apodo'];                  
                  if (ultimo < IBDSNacidos.FieldValues['id_senasa']) then
                    ultimo := IBDSNacidos.FieldValues['id_senasa'];
                  if not DBLCBAColor.Visible then
                    IBQSPEventoInd.ParamByName('COLOR2').Value := 0
                  else
                    IBQSPEventoInd.ParamByName('COLOR2').Value := IBDSNacidos.FieldValues['COLOR'];
                end;
            end;
      end;
      inc(cont);
      IBDSNacidos.Next;
    end;
  IBQSPEventoInd.ParamByName('observacion_nacimientos').AsString := MAObservacionNacimiento.GetDato;
  
  if not(CBPadresAutoCalculados.Checked) then
    IBQSPEventoInd.ParamByName('padre').AsInteger := aux_padre_auto
  else
    IBQSPEventoInd.ParamByName('padre').AsInteger := aux_padre_manual;

  if ((RBCUIGSenasa.Checked) and (CBIdentificacion.Checked) and (CBCUIGPropio.Checked) and (DBLCBACUIGPropio.KeyValue <> null)) then
    begin
      IBQActCUIG.Active := false;
      IBQActCUIG.ParamByName('cuig').AsInteger := StrToInt(DBLCBACUIGPropio.KeyValue);
      ultimoID[1] := ultimo[6];
      ultimoID[2] := ultimo[7];
      ultimoID[3] := ultimo[8];
      ultimoID[4] := ultimo[9];
      IBQActCUIG.ParamByName('UI').AsString := ultimoID;
      IBQActCUIG.Active := true;
    end;
end;

procedure TFEveParto.Validar10(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Length(TEditAuto(Sender).Text) >= 10) then key:=#0;
end;


procedure TFEveParto.Validar9(Sender: TObject; var Key: Char);
begin
  inherited;
    if (Length(TEditAuto(Sender).Text) >= 9) then key:=#0;
end;

// agrego la cantidad de nacimientos
procedure TFEveParto.EACantidadNacimientosChange(Sender: TObject);
var cont : integer;
begin
  inherited;
  cont := 1;
  DBEANombre.OnChange := nil;
  IBDSNacidos.First;
  while not(IBDSNacidos.Eof) do
    IBDSNacidos.Delete;
  while (cont <= StrToInt(EACantidadNacimientos.Text)) do
    begin
      IBDSNacidos.Insert;
      IBDSNacidos.FieldByName('id_nacimiento').AsInteger := cont;
      IBDSNacidos.FieldByName('identifico').AsString := 'S';
      if FPrincipal.FuncDEPs then
        IBDSNacidos.FieldByName('nombre').AsString := PrefijoNombre;
      IBDSNacidos.FieldByName('peso').AsInteger := 0;
      IBDSNacidos.Post;
      inc(cont);
    end;
  IBDSNacidos.First;
  limpiarNacimiento;
  posision := 1;
  DBEANombre.OnChange := Change;
end;

// selecciono el sexo del nuevo animal
procedure TFEveParto.DBLCBASexoCloseUp(Sender: TObject);
begin
  inherited;
  IBDSNacidos.Locate('id_nacimiento',VarArrayOf([posision]), [] );
  IBDSNacidos.Edit;
  IBDSNacidos.FieldByName('sexo').AsString := DBLCBASexo.Text;
  IBDSNacidos.Post;
  DBLCBAVivoSN.SetFocus;
end;

// seteo si esta vivo o no
procedure TFEveParto.DBLCBAVivoSNCloseUp(Sender: TObject);
begin
  inherited;
  IBDSNacidos.Locate('id_nacimiento',VarArrayOf([posision]), [] );
  IBDSNacidos.Edit;
  IBDSNacidos.FieldByName('vivo').AsString := DBLCBAVivoSN.Text;
  IBDSNacidos.Post;
  DBEAPeso.SetFocus;
  DBEAPeso.SelectAll;
{  if (DBLCBAVivoSN.Text = 'SI') then
    begin
      CBIdentificacion.Enabled:= true;
    end
   else
     begin
       CBIdentificacion.Checked:= false;
       CBIdentificacionClick(nil);
       CBIdentificacion.Enabled:= false;
     end; }
//  DMSoftvet.IBQCodigosGenericos.Locate('Valor',DBLCBAVivoSN.KeyValue,[]);
end;

// solo numeros en el peso ademas de que sean de dos digitos
procedure TFEveParto.DBEAPesoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key=#13) then
    CBIdentificacion.SetFocus;

  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 2)) and (key <> #8)) then key:=#0;
end;

// seteo el peso del nacido
procedure TFEveParto.DBEAPesoChange(Sender: TObject);
begin
  inherited;
  if (IBDSNacidos.State = dsEdit) then
    IBDSNacidos.Post;
end;

// cambio de nacido por lo tanto borro todos los combos
procedure TFEveParto.BDBGNacidosCellClick(Column: TColumn);
begin
  inherited;
  posision := IBDSNacidos.FieldByName('id_nacimiento').AsInteger;
  if (IBDSNacidos.FieldByName('identifico').AsString = 'S') then
    CBIdentificacion.Checked := true
  else
    CBIdentificacion.Checked := false;
  CBIdentificacionClick(CBIdentificacion);
end;

// actualizo la grilla a medida que colocan el rp
procedure TFEveParto.Change(Sender: TObject);
begin
  inherited;
  if ((IBDSNacidos.State = dsInsert) or (IBDSNacidos.State = dsEdit)) then
    IBDSNacidos.Post;
end;

// limpio todos los componentes del nacimiento
procedure TFEveParto.limpiarNacimiento;
begin
  DBLCBASexo.KeyValue := null;
  DBLCBAVivoSN.KeyValue := null;
  IBDSNacidos.Edit;
  DBEAPeso.Text := '0';
  CBIdentificacion.Checked := false;
  //DBEARP.Text := '';
  DBEASen.Text := '';
  DBEAPC.Text := '';
  DBEAHBA.Text := '';
  DBEARA.Text := '';
  DBEAOtro.Text := '';
  DBEANombre.Text := ''; 
  DBEAApodo.Text := '';
  DBEAIdentificacionElectronica.Text := '';
  EAPrefijo.Text := '';
  EASufijo.Text := '';
  EARPInicial.Text := '';
end;

procedure TFEveParto.AgregarMadreB(RP, Interna : String; ID : Variant);
begin
  LRPMadreB.Caption := RP;
  LInternaMadreB.Caption := Interna;
  IDMadreB := ID;
end;

// seleccion de padres autocalculados o manual
procedure TFEveParto.CBPadresAutoCalculadosClick(Sender: TObject);
begin
  inherited;
  {if not(CBPadresAutoCalculados.Checked) then
    begin
      //DBLCBATodosPadres.Enabled := false;
      filtrarPadres(aux_padre_auto);
    end
  else
    begin
      LRPMadreB.Caption := '';
      LInternaMadreB.Caption := '';
      //DBLCBATodosPadres.Enabled := true;
      //DBLCBATodosPadres.KeyValue := null;
      IBQPadres.Close;
    end;}
  LBusqueda.Visible := CBPadresAutoCalculados.Checked;
  ERPPadre.Visible := CBPadresAutoCalculados.Checked;
  IBuscarP.Visible := CBPadresAutoCalculados.Checked;
  LBuscarP.Visible := CBPadresAutoCalculados.Checked;
  IAgregarP.Visible := CBPadresAutoCalculados.Checked;
  LAgregarP.Visible := CBPadresAutoCalculados.Checked;
  GBPadre.Visible := CBPadresAutoCalculados.Checked;
  L1.Visible := false;
  L2.Visible := false;
  L3.Visible := false;
  

  if CBPadresAutoCalculados.Checked then
  begin
    LSeleccionP.Top := 128;
    LSeleccionP.Visible := false;
  end
  else
  begin
    LSeleccionP.Top := 80;
    autocalculadoPadres;
  end;
end;

// muestro los padres de la tabla aux que cumplen con el id
procedure TFEveParto.filtrarPadres(id: integer);
var
  T, Cant : Integer;
  Hn, I : Integer;
begin

  //Madre

  IBQMadre.Close;
  IBQMadre.ParamByName('id').AsInteger := id;
  IBQMadre.Open;
  if not IBQMadre.IsEmpty then
  begin
    LabelRPAnimalValor.Caption := IBQAnimal.fieldByName('id_rp').AsString+Traducir(' (Receptora)');
    GBMadreB.Visible := true;
    AgregarMadreB(IBQMadre.FieldValues['ID_RP'],IBQMadre.FieldValues['INTERNO'],IBQMadre.FieldValues['ID_ANIMAL_EXTERNO']);
  end
  else
  begin
    LabelRPAnimalValor.Caption := IBQAnimal.fieldByName('id_rp').AsString;
    GBMadreB.Visible := false;
  end;

  //Padre

  if not GBMadreB.Visible then
    GBPadre.Height := 252
  else
    GBPadre.Height := 169;

  IBQPadres.Close;
  IBQPadres.ParamByName('id').AsInteger := id;
  IBQPadres.Open;
  IBQPadres.Last;
  IBQPadres.First;
  Cant := IBQPadres.RecordCount;
  LSeleccionP.Caption := '';
  L1.Caption := '';
  L2.Caption := '';
  L3.Caption := '';

  if Cant >= 1 then
  begin
    IBQPadres.First;
    if IBQPadres.FieldValues['id_rp'] <> null then
      LSeleccionP.Caption := 'Padre: '+IBQPadres.FieldValues['id_rp'];
    if IBQPadres.FieldValues['id_hba'] <> null then
      LSeleccionP.Caption := LSeleccionP.Caption + ' - HBA: '+IBQPadres.FieldValues['id_hba'];
    if IBQPadres.FieldValues['nombre'] <> null then
      LSeleccionP.Caption := LSeleccionP.Caption + ' - Nombre: '+IBQPadres.FieldValues['nombre'];
    LSeleccionP.Visible := true;
    GBPadre.Visible := true;
   // LSeleccionP.Top := 80;
  end;
  IBQPadres.Next;
  if Cant >= 2 then
  begin
    L1.Visible := true;
    L1.Font.Size := LSeleccionP.Font.Size;
    L1.Font.Name := LSeleccionP.Font.Name;
    L1.Font.Style := LSeleccionP.Font.Style;
    L1.Left := LSeleccionP.Left;
    //L1.Top := LSeleccionP.Top + LSeleccionP.Height + 5;
    L1.Caption := 'Padre: '+IBQPadres.FieldValues['id_rp'];
    if IBQPadres.FieldValues['id_hba'] <> null then
      L1.Caption := L1.Caption + ' - HBA: '+IBQPadres.FieldValues['id_hba'];
    if IBQPadres.FieldValues['nombre'] <> null then
      L1.Caption := L1.Caption + ' - Nombre: '+IBQPadres.FieldValues['nombre'];
  end;
  IBQPadres.Next;
  if Cant >= 3 then
  begin
    L2.Visible := true;
    L2.Font.Size := LSeleccionP.Font.Size;
    L2.Font.Name := LSeleccionP.Font.Name;
    L2.Font.Style := LSeleccionP.Font.Style;
    L2.Left := LSeleccionP.Left;
    //L2.Top := LSeleccionP.Top + LSeleccionP.Height + 5;
    L2.Caption := 'Padre: '+IBQPadres.FieldValues['id_rp'];
    if IBQPadres.FieldValues['id_hba'] <> null then
      L2.Caption := L2.Caption + ' - HBA: '+IBQPadres.FieldValues['id_hba'];
    if IBQPadres.FieldValues['nombre'] <> null then
      L2.Caption := L2.Caption + ' - Nombre: '+IBQPadres.FieldValues['nombre'];
  end;
  IBQPadres.Next;
  if Cant >= 4 then
  begin
    L3.Visible := true;
    L3.Font.Size := LSeleccionP.Font.Size;
    L3.Font.Name := LSeleccionP.Font.Name;
    L3.Font.Style := LSeleccionP.Font.Style;
    L3.Left := LSeleccionP.Left;
    //L3.Top := LSeleccionP.Top + LSeleccionP.Height + 5;
    L3.Caption := 'Padre: '+IBQPadres.FieldValues['id_rp'];
    if IBQPadres.FieldValues['id_hba'] <> null then
      L3.Caption := L3.Caption + ' - HBA: '+IBQPadres.FieldValues['id_hba'];
    if IBQPadres.FieldValues['nombre'] <> null then
      L3.Caption := L3.Caption + ' - Nombre: '+IBQPadres.FieldValues['nombre'];
  end;

  if CBPadresAutoCalculados.Checked then
  begin
    I := LBuscarP.Top + LBuscarP.Height + 10;
    Hn := GBPadre.Height - I;
  end
  else
  begin
    I := 0;
    Hn := GBPadre.Height;
  end;

  if Cant > 0 then
  begin
    if Cant > 4 then
      Cant := 4;
    case Cant of
      1 : LSeleccionP.Top := I +(Hn div 2) - (LSeleccionP.Height div 2);
      2 : begin
            LSeleccionP.Top := I + (Hn div 3) - (LSeleccionP.Height div 2);
            L1.Top := I + ((Hn div 3)*2) - (LSeleccionP.Height div 2);
          end;
      3 : begin
            LSeleccionP.Top := I + (Hn div 4) - (LSeleccionP.Height div 2);
            L1.Top := I + ((Hn div 4)*2) - (LSeleccionP.Height div 2);
            L2.Top := I + ((Hn div 4)*3) - (LSeleccionP.Height div 2);
          end;
      4 : begin
            LSeleccionP.Top := (Hn div 5) - (LSeleccionP.Height div 2);
            L1.Top := I + ((Hn div 5)*2) - (LSeleccionP.Height div 2);
            L2.Top := I + ((Hn div 5)*3) - (LSeleccionP.Height div 2);
            L3.Top := I + ((Hn div 5)*4) - (LSeleccionP.Height div 2);
          end;
    end;
  end;
end;

// selecciono un padre manualmente
procedure TFEveParto.DBLCBATodosPadresCloseUp(Sender: TObject);
begin
  inherited;
  generarIdAgregandoPadre();
end;
procedure TFEveParto.DBLCBATodosPadresKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  generarIdAgregandoPadre();
end;
// fin seleccion padre manualmente

// generar id y agregar el animal seleccionada y luego filtrar la grilla
procedure TFEveParto.generarIdAgregandoPadre;
begin
  IBQGenerador.Open;
  aux_padre_manual := IBQGenerador.fieldByName('idauxpe').AsInteger;
  IBQGenerador.Close;
  if (IBQTodosPadres.FieldByName('id').AsInteger <> 0) then
    begin
      try
        IBQPadres.Open;
        IBQPadres.Insert;
        IBQPadres.FieldByName('id_animal_externo').AsInteger := IBQTodosPadres.fieldbyname('id').AsInteger;
        IBQPadres.FieldByName('id_aux').AsInteger := aux_padre_manual;
        IBQPadres.FieldByName('id_rp').AsString := IBQTodosPadres.fieldbyname('id_rp').AsString;
        IBQPadres.FieldByName('interno').AsString := IBQTodosPadres.fieldbyname('interno').AsString;
        IBQPadres.FieldByName('sexo').AsInteger := 1;
        IBQPadres.Post;
        FPrincipal.IBDPrincipal.ApplyUpdates([IBQPadres]);
      except
        IBQPadres.CancelUpdates;
      end;
    end;
  filtrarPadres(aux_padre_manual);
end;

// tengo que controlar otras cosas
function TFEveParto.PuedeGrabar: boolean;

begin
  result := {(PuedeGrabarParto and} (inherited PuedeGrabar)//)
end;

// me fijo los datos en el nacimiento
function TFEveParto.PuedeGrabarParto: boolean;
var retorno :boolean;
begin

// codigo
  retorno := true;
  if (IBDSNacidos.State <> dsinsert) and (IBDSNacidos.State <> dsedit) then
    begin
      IBDSNacidos.First;
      while (not(IBDSNacidos.Eof) and (retorno))do
        begin
          if ((IBDSNacidos.FieldValues['id_sexo'] = null) or (IBDSNacidos.FieldValues['id_vivo'] = null))then
            retorno := false;
          IBDSNacidos.Next;
        end;
      IBDSNacidos.Locate('id_nacimiento',VarArrayOf([posision]), [] );
    end
  else
    retorno := false;
  result := retorno;
end;

procedure TFEveParto.DBLCBASexoEnter(Sender: TObject);
begin
  inherited;
  IBDSNacidos.Locate('id_nacimiento',VarArrayOf([posision]), [] );
end;

procedure TFEveParto.DBLCBAVivoSNEnter(Sender: TObject);
begin
  inherited;
  IBDSNacidos.Locate('id_nacimiento',VarArrayOf([posision]), [] );
end;

procedure TFEveParto.DBEAPesoEnter(Sender: TObject);
begin
  inherited;
  IBDSNacidos.Locate('id_nacimiento',VarArrayOf([posision]), [] );
end;

procedure TFEveParto.PCBasicoChange(Sender: TObject);
begin
  inherited;
  if (PCBasico.ActivePage = TSNacimientos) then
  begin
    IBDSNacidos.Locate('id_nacimiento',VarArrayOf([posision]), [] );
    BDBGNacidosCellClick(nil); 
  end;

  TSDatos.ImageIndex := 1;
  if(PCBasico.ActivePage = TSDatos)then
    TSDatos.ImageIndex := 6;

  TSDistocia.ImageIndex := 2;
  if(PCBasico.ActivePage = TSDistocia)then
    TSDistocia.ImageIndex := 7;

  TSNacimientos.ImageIndex := 3;
  if(PCBasico.ActivePage = TSNacimientos)then
    TSNacimientos.ImageIndex := 8;

end;

procedure TFEveParto.FormActivate(Sender: TObject);
begin
//  inherited;

end;

procedure TFEveParto.autocalculadoPadres;
begin
  // autocalculo los padres por medio de un sp_calcular_padres
  IBQPadresAutocalculados.Close;
  IBQPadresAutocalculados.ParamByName('raza').AsInteger := IBQAnimal.fieldByName('raza').AsInteger;
  IBQPadresAutocalculados.ParamByName('animal').AsInteger := IDAnimal;
  //IBQPadresAutocalculados.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPadresAutocalculados.ParamByName('hoy').AsDateTime := DTPAFecha.DateTime;
  IBQPadresAutocalculados.Open;
  aux_padre_auto := IBQPadresAutocalculados.fieldByName('ID_BUSQUEDA').AsInteger;

  // para ver los padres autocalculados
  filtrarPadres(aux_padre_auto);
end;

procedure TFEveParto.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
    fecha.Date:=now
  else
    autocalculadoPadres;
end;

procedure TFEveParto.DBLCBASexoClick(Sender: TObject);
begin
  ControlEventoOnExit(Sender);

  inherited;

  {$IFDEF DEMO}
    {$IFDEF EC}
      JvTerminar.Visible := true;
      LBBTerminar.Visible := true;
    {$ELSE}
       IBQGetCantAnimales.Close;
       IBQGetCantAnimales.Open;
       if (PuedeGrabar and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones)) then
       begin
         JvTerminar.Visible := true;
         LBBTerminar.Visible := true;
       end
       else
       begin
        MostrarMensaje(tmInformacion,'Para cargar más animales debe comprar Huella. Ingrese a http://www.softhuella.com.ar');
        JvTerminar.Visible := false;
        LBBTerminar.Visible := false;
       end;
    {$ENDIF}
  {$ELSE}
    JvTerminar.Visible := VerificarCantAnimalesBase(1);
    LBBTerminar.Visible := VerificarCantAnimalesBase(1);
  {$ENDIF}
end;

procedure TFEveParto.DBLCBAVivoSNClick(Sender: TObject);
begin
  ControlEventoOnExit(Sender);
  inherited;
  {$IFDEF DEMO}
    {$IFDEF EC}
      JvTerminar.Visible := true;
      LBBTerminar.Visible := true;
    {$ELSE}
     IBQGetCantAnimales.Close;
     IBQGetCantAnimales.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
     IBQGetCantAnimales.Open;
     if (PuedeGrabar and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones)) then
     begin
       JvTerminar.Visible := true;
       LBBTerminar.Visible := true;
     end
     else
     begin
      MostrarMensaje(tmInformacion,'Para cargar más animales debe comprar Huella. Ingrese a http://www.softhuella.com.ar');
      JvTerminar.Visible := false;
      LBBTerminar.Visible := false;
     end;
    {$ENDIF}
  {$ELSE}
    JvTerminar.Visible := VerificarCantAnimalesBase(1);
    LBBTerminar.Visible := VerificarCantAnimalesBase(1);
  {$ENDIF}
end;

procedure TFEveParto.AsignarValoresDefecto;
var
  ind : Integer;
  aux : IDBControl;
begin
  for ind := 0 to GBDatos.ControlCount - 1 do
    if (Convertido(GBDatos.Controls[ind], aux) and (GBDatos.Controls[ind].Name <> 'EACantidadNacimientos')) then
      aux.AsignarValorDefecto;
end;

procedure TFEveParto.ActualizarCUIG();
var
  pos : integer;
begin
  for pos := 0 to Total-1 do
  begin
    IBQActCUIG.Close;
    IBQActCUIG.ParamByName('cuig').AsInteger := Identificadores[pos].id_cuig;
    IBQActCUIG.ParamByName('UI').AsString := Identificadores[pos].ultimo_ident;
    IBQActCUIG.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  end
end;

procedure TFEveParto.ATerminarExecute(Sender: TObject);
begin
  // esta funcionalidad es agregada porque no puedo desenganchar los componentes de base con la grilla de nacimientos
  // por el tema de habilitar o no el boton terminar

  if ((EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____')) then
    if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
      if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
        begin
          if (PuedeGrabarParto) then
          begin
            inherited ATerminarExecute(self);
            ActualizarCUIG();
          end
          else
            MostrarMensaje(tmError, 'Los campos Sexo y Vivo en los nacimientos son obligatorios');
        end
       else
        begin
          MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante.');
          EAUltimoIdent.SetFocus;
        end
    else
      begin
        MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante');
        EAEncabezado.SetFocus;
      end
  else
    if ((EAEncabezado.EditText = '_____') and (EAUltimoIdent.EditText = '____')) then
      begin
        if (PuedeGrabarParto) then
        begin
          inherited ATerminarExecute(self);
          ActualizarCUIG();
        end
        else
          MostrarMensaje(tmError, 'Los campos Sexo y Vivo en los nacimientos son obligatorios');
            end
     else
      if (EAEncabezado.EditText = '_____') then
        begin
          MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante');
          EAUltimoIdent.SetFocus;
        end
       else
          begin
            MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante.');
            EAEncabezado.SetFocus;
          end



end;

procedure TFEveParto.RBSenasaClick(Sender: TObject);
begin
  inherited;
  MostrarCamposIdentificacion(false);
{  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EVerificador.Visible := false;
  CBCUIGPropio.Visible := false;
  DBLCBACUIGPropio.Visible := false;
  DBEASen.Visible := true; }
  DBEASen.SetFocus;
  DBEASen.SelectAll;
  ComponentesVisiblesPorPais(FPrincipal.Pais);
end;

procedure TFEveParto.RBCUIGSenasaClick(Sender: TObject);
begin
  inherited;
  MostrarCamposIdentificacion(false);
  {EAEncabezado.Visible := true;
  EAUltimoIdent.Visible := true;
  EVerificador.Visible := true;
  CBCUIGPropio.Visible := true;
  DBLCBACUIGPropio.Visible := CBCUIGPropio.Checked;
  DBEASen.Visible := false;  }
end;

procedure TFEveParto.CBCUIGPropioClick(Sender: TObject);
begin
  inherited;
  if (CBCUIGPropio.Checked) then
     begin
        DBLCBACUIGPropio.Visible := true;
        DBLCBACUIGPropio.SetFocus;
        EAUltimoIdent.Enabled := false;
        EAEncabezado.Enabled := false;
     end
   else
    begin
      EAUltimoIdent.Enabled := true;
      EAEncabezado.Enabled := true;
      DBLCBACUIGPropio.Visible := false;
      EAEncabezado.Text := '';
      EAUltimoIdent.Text := '';
      //EAEncabezado.SetFocus;
      //EAEncabezado.SelectAll;
    end;
end;

function Existe_Identificador(ID : integer; Arr : Arreglo; var pos : integer): boolean;
var
  i : integer;
begin
  result := false;
  for i := 0 to Length(Arr)-1 do
    if (Arr[i].id_cuig = ID) then
    begin
      pos := i;
      result := true;
      break;
    end;
end;

procedure TFEveParto.DBLCBACUIGPropioCloseUp(Sender: TObject);
var
  pos : integer;
  ultimo : String;
begin
  inherited;
  if (DBLCBACUIGPropio.KeyValue <> null) then
  begin
    if not (Existe_Identificador(DBLCBACUIGPropio.KeyValue,Identificadores,pos)) then
    begin
      IBQBuscarCUIG.Close;
      IBQBuscarCUIG.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQBuscarCUIG.ParamByName('id').AsInteger := DBLCBACUIGPropio.KeyValue;
      IBQBuscarCUIG.Open;
      Ultimo := IBQBuscarCUIG.fieldByName('ultimo_identificador').AsString;
      Identificadores[Total].id_cuig := DBLCBACUIGPropio.KeyValue;
      Identificadores[Total].ultimo_ident := UFunctions.IncrementarIdentificadorCUIG(Ultimo);
      Total := Total+1;
    end
    else
    begin
      Ultimo := Identificadores[pos].ultimo_ident;
      Identificadores[pos].ultimo_ident := UFunctions.IncrementarIdentificadorCUIG(Ultimo);
    end;

    EAEncabezado.Text := DBLCBACUIGPropio.Text;
    EAUltimoIdent.Text := Ultimo;
    EVerificador.Text := IntToStr(UFunctions.DigitoVerificadorCaravana(EAEncabezado.Text+EAUltimoIdent.Text));
    //EAEncabezado.SetFocus;
  end;
end;

procedure TFEveParto.EAEncabezadoExit(Sender: TObject);
begin
  inherited;
  if (EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____') then
    if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
      if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
        begin
          EVerificador.Text := IntToStr(UFunctions.DigitoVerificadorCaravana(EAEncabezado.Text+EAUltimoIdent.Text));
          DBEASen.Text :=  IDRp;//DBEARP.Text;
        end
       else
        begin
          MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
          EAUltimoIdent.SetFocus;
        end
    else
      begin
        MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
        EAEncabezado.SetFocus;
      end;

end;

procedure TFEveParto.EAUltimoIdentExit(Sender: TObject);
begin
  inherited;
  if (EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____') then
    if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
      if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
        begin
          EVerificador.Text := IntToStr(UFunctions.DigitoVerificadorCaravana(EAEncabezado.Text+EAUltimoIdent.Text));
          DBEASen.Text :=  IDRp;//DBEARP.Text;
        end
       else
        begin
          MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
          EAUltimoIdent.SetFocus;
        end
    else
      begin
        MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
        EAEncabezado.SetFocus;
      end;        
end;

procedure TFEveParto.EAEncabezadoChange(Sender: TObject);
begin
  inherited;
  IBDSNacidos.Edit;
  //DBEARP.Text := EAEncabezado.Text+EAUltimoIdent.Text;
  IDRp := EAEncabezado.Text+EAUltimoIdent.Text;
  EARpInicial.Text := EAEncabezado.Text+EAUltimoIdent.Text;
  EARpInicial.OnExit(nil);
  IBDSNacidos.Edit;
  DBEASen.Text := IDRp;//DBEARP.Text;
end;

procedure TFEveParto.DTPAFechaCloseUp(Sender: TObject);
begin
  inherited;
  DBLCBAResponsable.SetFocus;
end;

procedure TFEveParto.DBLCBAResponsableCloseUp(Sender: TObject);
begin
  inherited;
  DBLCBATipoParto.SetFocus;
end;

procedure TFEveParto.DBLCBACausaDistociaCloseUp(Sender: TObject);
begin
  inherited;
  DBLCBAGradoDistocia.SetFocus;
  {$IFDEF DEMO}
    {$IFDEF EC}
    //DEMO EDUCACION CONTINUA
      //BBTerminar.Enabled := False;
      JvTerminar.Visible := true;
      LBBTerminar.Visible := true;
    {$ELSE}
      JvTerminar.Visible := false;
      LBBTerminar.Visible := false;
    {$ENDIF}
    //DEMO COMERCIAL
     //BBTerminar.Enabled := False;
  {$ELSE}
    JvTerminar.Visible := VerificarCantAnimalesBase(1);
    LBBTerminar.Visible := VerificarCantAnimalesBase(1);
  {$ENDIF}
end;

procedure TFEveParto.DBEARPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
     DBEAPC.SetFocus;
     DBEAPC.SelectAll;
   end;
end;

procedure TFEveParto.DBEAPCKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
     DBEAHBA.SetFocus;
     DBEAHBA.SelectAll;
   end;
end;

procedure TFEveParto.DBEAHBAKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
     DBEARA.SetFocus;
     DBEARA.SelectAll;
   end;
end;

procedure TFEveParto.DBEARAKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
     DBEAOtro.SetFocus;
     DBEAOtro.SelectAll;
   end;
end;

procedure TFEveParto.DBEAOtroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (RBCUIGSenasa.Checked) then
    begin
      if (key = #13) then
         CBCUIGPropio.SetFocus;
    end
   else
     if (RBSenasa.Checked) then
        if (key = #13) then
         begin
           DBEASen.SetFocus;
           DBEASen.SelectAll;
         end;
end;

procedure TFEveParto.EAEncabezadoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if (key = #13) then
     begin
       EAUltimoIdent.SetFocus;
       EAUltimoIdent.SelectAll;
     end;
end;

procedure TFEveParto.EAUltimoIdentKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if (key = #13) then
     begin
       EVerificador.SetFocus;
       EVerificador.SelectAll;
     end;
end;

procedure TFEveParto.CBCUIGPropioKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
   begin
     EAUltimoIdent.SetFocus;
     EAUltimoIdent.SelectAll;
   end;
end;

procedure TFEveParto.HandlerOnExitSenasa(Sender: TObject);
begin
  if((DBEASen.Text<> '') and ({DBEARP.Text}IDRp = '')) then
   begin
    IBDSNacidos.Edit;
    DBEASen.Text := CompletarDigitosSenasa(DBEASen.Text);
    IBDSNacidos.Edit;
    //DBEARP.Text := DBEASen.Text;
    EARpInicial.Text := DBEASen.Text;
    EARpInicial.OnExit(nil);
   end;
  ControlEventoOnExit(self);
  {$IFDEF DEMO}
    //DEMO EDUCACION CONTINUA
      //BBTerminar.Enabled := False;
    //DEMO COMERCIAL
     //BBTerminar.Enabled := False;
     {$IFDEF EC}
      JvTerminar.Visible := true;
      LBBTerminar.Visible := true;
     {$ELSE}
      JvTerminar.Visible := false;
      LBBTerminar.Visible := false;
     {$ENDIF}
  {$ELSE}
    JvTerminar.Visible := VerificarCantAnimalesBase(1);
    LBBTerminar.Visible := VerificarCantAnimalesBase(1);
  {$ENDIF}
end;

procedure TFEveParto.DBLCBAGradoDistociaCloseUp(Sender: TObject);
begin
  inherited;
  {$IFDEF DEMO}
     {$IFDEF EC}
      JvTerminar.Visible := true;
      LBBTerminar.Visible := true;
     {$ELSE}
      JvTerminar.Visible := false;
      LBBTerminar.Visible := false;
     {$ENDIF}
  {$ELSE}
    JvTerminar.Visible := VerificarCantAnimalesBase(1);
    LBBTerminar.Visible := VerificarCantAnimalesBase(1);
  {$ENDIF}
end;

procedure TFEveParto.DBLCBAVivoSNKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  DBLCBAVivoSNCloseUp(nil);
end;

procedure TFEveParto.DBLCBASexoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  DBLCBASexoCloseUp(nil);
end;

procedure TFEveParto.DBEASenKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFEveParto.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  RBSenasa.Caption:= FPrincipal.PaisNombreCaravana;
  BitDBGrid2.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;
  BitDBGrid2.ColumnByField('id_hba').Title.Caption:= FPrincipal.PaisHerdBook;
  LabelIDHBA.Caption:= FPrincipal.PaisHerdBook+':';
  if (pais = 1) then //Argentina
   begin

    RBCUIGSenasa.Visible:= True;
    EAEncabezado.Visible:= True;
    EAUltimoIdent.Visible:= True;
    EVerificador.Visible:= True;
    CBCUIGPropio.Visible:= True;
    LCUIGPropio.Visible:= True;
    DBLCBACUIGPropio.Visible:= True;
    MostrarCamposIdentificacion(false);    
    DBEASen.Left:= 112;
    RBSenasa.Width:= 73;
   end
  else
    if (pais = 2) then //Uruguay
     begin
      MostrarCamposIdentificacion(false);
      RBCUIGSenasa.Visible:= False;
      EAEncabezado.Visible:= False;
      EAUltimoIdent.Visible:= False;
      EVerificador.Visible:= False;      
      CBCUIGPropio.Visible:= False;
      LCUIGPropio.Visible:= False;
      DBLCBACUIGPropio.Visible:= False;
      DBEASen.Left:= 164;
      RBSenasa.Width:= 120;
     end
    else
       begin
        MostrarCamposIdentificacion(false);
        RBCUIGSenasa.Visible:= False;
        EAEncabezado.Visible:= False;
        EAUltimoIdent.Visible:= False;
        EVerificador.Visible:= False;
        CBCUIGPropio.Visible:= False;
        LCUIGPropio.Visible:= False;
        DBLCBACUIGPropio.Visible:= False;
        DBEASen.Left:= 164;
        RBSenasa.Width:= 120;
       end;
end;

procedure TFEveParto.MostrarCamposIdentificacion(valor: boolean);
begin
  DBEASen.Visible:= RBSenasa.Checked;
  CBCUIGPropio.Visible:= RBCUIGSenasa.Checked;
  LCUIGPropio.Visible:= RBCUIGSenasa.Checked;
  EAEncabezado.Visible:= RBCUIGSenasa.Checked;
  EAUltimoIdent.Visible:= RBCUIGSenasa.Checked;
  EVerificador.Visible:= RBCUIGSenasa.Checked;
  DBLCBACUIGPropio.Visible:= RBCUIGSenasa.Checked and CBCUIGPropio.Checked;
end;

procedure TFEveParto.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveParto.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveParto.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveParto.LCUIGPropioClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMModificarCUIG.Create(Self));
      IBQCantCuigs.Close;
      IBQCantCuigs.Open;
      SetLength(Identificadores,IBQCantCuigs.fieldByName('cantidad').AsInteger);

      DMSoftvet.IBQCUIGActual.Close;
      DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQCUIGActual.Open;
    end;  
end;

procedure TFEveParto.LCUIGPropioMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCUIGPropio.Font.Color:= $00606C02;
      LCUIGPropio.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveParto.LCUIGPropioMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCUIGPropio.Font.Color:= clWindowText;
      LCUIGPropio.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveParto.CBCondCorpClick(Sender: TObject);
begin
  inherited;
  if CBCondCorp.Checked then
    DBLCBACondCorp.Enabled := true
  else
    DBLCBACondCorp.Enabled := false;
end;

procedure TFEveParto.EARPChange(Sender : TObject);
begin
  inherited;
  IDRp := Trim(EAPrefijo.Text+EARPInicial.Text+EASufijo.Text);
  EARPOnExit(EARpInicial);
end;

procedure TFEveParto.EARPOnExit(Sender : TObject);
begin
  inherited;
  if (Length(IDRp) <= 10) then
  begin
    IBDSNacidos.Locate('id_nacimiento',VarArrayOf([posision]), [] );
    IBDSNacidos.Edit;
    IBDSNacidos.FieldByName('id_rp').AsString := IDRp;
    IBDSNacidos.Post;
  end
  else
  begin
    MostrarMensaje(tmError,'El identificado RP no puede tener mas de 10 caracteres');
    EAPrefijo.Clear;
    EASufijo.Clear;
  end;
end;

procedure TFEveParto.EARpInicialKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFEveParto.Button3Click(Sender: TObject);
var
  SQLInt : String;
  SQLExt : String;
  F : TFPosiblesMadres;
begin
  inherited;
  //FrameSeleccionPadres.IBQDisponibles.Close;
  L1.Visible := false;
  L2.Visible := false;
  L2.Visible := false;
  SQLInt := 'select id_animal as id, id_rp, id_hba, nombre, apodo, ''INTERNO'' as Tipo from tab_animales where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (categoria = 3) and Activo = ''S''';
  SQLExt := 'select id_animal_externo as id, id_rp, id_hba, nombre, apodo, ''EXTERNO'' as Tipo from tab_animales_externos where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (sexo = 1)';
  F := TFPosiblesMadres.Create(self);
  F.IBQMBiologica.Close;
  F.IBQMBiologica.SQL.Clear;
  if CBPInt.Checked  and CBPExt.Checked then
  begin
    F.IBQMBiologica.SQL.Add(SQLInt+' union '+SQLExt);
  end
  else
  begin
    if (CBPInt.Checked) and not(CBPExt.Checked) then
      F.IBQMBiologica.SQL.Add(SQLInt)
    else
      if not (CBPInt.Checked) and (CBPExt.Checked) then
        F.IBQMBiologica.SQL.Add(SQLExt);
  end;
  if Length(RPMadreBio) > 10 then
    F.IBQMBiologica.ParamByName('rp').Value := null
  else
    F.IBQMBiologica.ParamByName('rp').AsString := Uppercase(RPMadreBio);
  F.IBQMBiologica.ParamByName('nom').AsString := Uppercase(RPMadreBio);
  F.IBQMBiologica.Open;
  F.IBQMBiologica.Last;
  F.IBQMBiologica.First;
  if not F.IBQMBiologica.IsEmpty then
  begin
    if F.IBQMBiologica.RecordCount > 1 then
    begin
      F.LSeleccion.Caption := 'Seleccione el padre';
      F.LBuscarMBiolo.Caption := 'Buscar Padre';
      F.LElegir.Caption := 'Seleccionar Padre';
      
      F.ShowModal;
      LSeleccionP.Caption := 'Padre Seleccionado - RP: '+F.RP+' HBA: '+F.HBA+' Nombre: '+F.Nombre;
      LSeleccionP.Visible := true;
      TipoPadre := F.TipoM;
      id_padre := F.id_madre;
      if id_padre = -1 then
        LSeleccionP.Caption := 'No se selecciono nungún Padre'
      else
      begin
        if aux_padre_manual = -1 then
        begin
          IBQGenerador.Open;
          aux_padre_manual := IBQGenerador.fieldByName('idauxpe').AsInteger;
          IBQGenerador.Close;
        end;
        if (id_padre > 0) then
        begin
          try
            IBQPadres.Open;
            IBQPadres.Insert;
            IBQPadres.FieldByName('id_animal_externo').AsInteger := id_padre;
            IBQPadres.FieldByName('id_aux').AsInteger := aux_padre_manual;
            IBQPadres.FieldByName('id_rp').AsString := F.RP;
            IBQPadres.FieldByName('id_hba').AsString := F.HBA;
            IBQPadres.FieldByName('nombre').AsString := F.Nombre;
            if TipoPadre = 'EXTERNO' then
              IBQPadres.FieldByName('interno').AsString := 'N'
            else
              IBQPadres.FieldByName('interno').AsString := 'S';
            IBQPadres.FieldByName('sexo').AsInteger := 1;
            IBQPadres.Post;
            FPrincipal.IBDPrincipal.ApplyUpdates([IBQPadres]);
          except
            IBQPadres.CancelUpdates;
          end;
          filtrarPadres(aux_padre_manual);
        end;
      end;
    end
    else
    begin
      LSeleccionP.Caption := 'Padre Seleccionado - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
      if F.IBQMBiologica.FieldValues['id_hba'] <> null then
        LSeleccionP.Caption := LSeleccionP.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
      if F.IBQMBiologica.FieldValues['nombre'] <> null then
        LSeleccionP.Caption := LSeleccionP.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
      LSeleccionP.Visible := true;
      TipoPadre := F.TipoM;
      id_padre := F.id_madre;
      if (id_padre > 0) then
      begin
        try
          IBQPadres.Open;
          IBQPadres.Insert;
          IBQPadres.FieldByName('id_animal_externo').AsInteger := id_padre;
          IBQPadres.FieldByName('id_aux').AsInteger := aux_padre_manual;
          IBQPadres.FieldByName('id_rp').AsString := F.IBQMBiologica.FieldValues['id_rp'];;
          IBQPadres.FieldByName('id_hba').AsString := F.IBQMBiologica.FieldValues['id_hba'];
          IBQPadres.FieldByName('nombre').AsString := F.IBQMBiologica.FieldValues['nombre'];
          if TipoPadre = 'EXTERNO' then
            IBQPadres.FieldByName('interno').AsString := 'N'
          else
            IBQPadres.FieldByName('interno').AsString := 'S';
          IBQPadres.FieldByName('sexo').AsInteger := 1;
          IBQPadres.Post;
          FPrincipal.IBDPrincipal.ApplyUpdates([IBQPadres]);
        except
          IBQPadres.CancelUpdates;
        end;
        filtrarPadres(aux_padre_manual);
      end;
    end;
  end
  else
  begin
    if MostrarMensaje(tmConsulta,'No se encontraron Animales. Desea Cargar el Padre?')= mrYes then
    begin
      if CBPExt.Checked then
      begin
        id_padre := AgregarAnimalExterno(1);
        if id_padre <> -1 then
        begin
          F.IBQMBiologica.Close;
          F.IBQMBiologica.SQL.Clear;
          F.IBQMBiologica.SQL.Add(SQLExt);
          F.IBQMBiologica.ParamByName('rp').AsString := '%';
          F.IBQMBiologica.ParamByName('nom').AsString := '%';
          F.IBQMBiologica.Open;
          F.IBQMBiologica.Locate('id',id_padre,[]);
          LSeleccionP.Caption := 'Padre Seleccionado - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
          if F.IBQMBiologica.FieldValues['id_hba'] <> null then
            LSeleccionP.Caption := LSeleccionP.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
          if F.IBQMBiologica.FieldValues['nombre'] <> null then
            LSeleccionP.Caption := LSeleccionP.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
          LSeleccionP.Visible := true;
          TipoPadre := 'EXTERNO';

          if (id_padre > 0) then
          begin
            try
              IBQPadres.Open;
              IBQPadres.Insert;
              IBQPadres.FieldByName('id_animal_externo').AsInteger := id_padre;
              IBQPadres.FieldByName('id_aux').AsInteger := aux_padre_manual;
              IBQPadres.FieldByName('id_rp').AsString := F.IBQMBiologica.FieldValues['id_rp'];;
              IBQPadres.FieldByName('id_hba').AsString := F.IBQMBiologica.FieldValues['id_hba'];
              IBQPadres.FieldByName('nombre').AsString := F.IBQMBiologica.FieldValues['nombre'];
              if TipoPadre = 'EXTERNO' then
                IBQPadres.FieldByName('interno').AsString := 'N'
              else
                IBQPadres.FieldByName('interno').AsString := 'S';
              IBQPadres.FieldByName('sexo').AsInteger := 1;
              IBQPadres.Post;
              FPrincipal.IBDPrincipal.ApplyUpdates([IBQPadres]);
            except
              IBQPadres.CancelUpdates;
            end;
            filtrarPadres(aux_padre_manual);
          end;

        end;
      end
      else
        //id_padre := AgregarAnimalInterno(2);
    end;
  end;
  LSeleccionP.Top := 128;
end;

procedure TFEveParto.ERPPadreKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
  begin
    Button3.Click;
    key:= #0;
  end;
end;

procedure TFEveParto.ERPPadreChange(Sender: TObject);
begin
  inherited;
  if ERPPadre.Text <> '' then
    RPMadreBio := '%'+ERPPadre.Text+'%'
  else
    RPMadreBio := '%';
end;

function TFEveParto.AgregarAnimalExterno(Sexo : Integer) : Integer;
var Iabm: IButtonABM;
    form:TFABMPadresExternos;
    rpAux: String;
begin
  inherited;
  try
    form := TFABMPadresExternos.Create(self);
    Iabm := IButtonABM(form);
    Iabm.IFitrate(Sexo,FPrincipal.EstablecimientoActual);
    Iabm.ISetCampoRetorno('id_animal_externo');
    Iabm.IAbrir(faAbm);
    {BorrarAuxPadres;
    BorrarTablasAuxiliares();
    ActualizarPadres();}
    if nroID>-1 then
    begin
        Result := nroID;
        nroID:=-1;
    end;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    MostrarMensaje(tmError, 'No se pudo abrir el formulario de animales externos');
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFEveParto.IAgregarPClick(Sender: TObject);
var
    F : TFPosiblesMadres;
    SQLExt : String;
begin
  inherited;
  L1.Visible := false;
  L2.Visible := false;
  L3.Visible := false;
  SQLExt := 'select id_animal_externo as id, id_rp, id_hba, nombre, apodo, ''EXTERNO'' as Tipo from tab_animales_externos where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and (sexo = 1) and Visible = ''S''';
  F := TFPosiblesMadres.Create(self);
  F.IBQMBiologica.Close;
  F.IBQMBiologica.SQL.Clear;
  id_padre := AgregarAnimalExterno(1);
        if id_padre <> -1 then
        begin
          F.IBQMBiologica.Close;
          F.IBQMBiologica.SQL.Clear;
          F.IBQMBiologica.SQL.Add(SQLExt);
          F.IBQMBiologica.ParamByName('rp').AsString := '%';
          F.IBQMBiologica.ParamByName('nom').AsString := '%';
          F.IBQMBiologica.Open;
          F.IBQMBiologica.Locate('id',id_padre,[]);
          LSeleccionP.Caption := 'Padre Seleccionado - RP: '+F.IBQMBiologica.FieldValues['id_rp'];
          if F.IBQMBiologica.FieldValues['id_hba'] <> null then
            LSeleccionP.Caption := LSeleccionP.Caption+' HBA: '+F.IBQMBiologica.FieldValues['id_hba'];
          if F.IBQMBiologica.FieldValues['nombre'] <> null then
            LSeleccionP.Caption := LSeleccionP.Caption+' Nombre: '+F.IBQMBiologica.FieldValues['nombre'];
          LSeleccionP.Visible := true;
          TipoPadre := 'EXTERNO';
          if (id_padre > 0) then
          begin
            try
              IBQGenerador.Open;
              aux_padre_manual := IBQGenerador.fieldByName('idauxpe').AsInteger;
              IBQGenerador.Close;
              IBQPadres.Open;
              IBQPadres.Insert;
              IBQPadres.FieldByName('id_animal_externo').AsInteger := id_padre;
              IBQPadres.FieldByName('id_aux').AsInteger := aux_padre_manual;
              IBQPadres.FieldByName('id_rp').AsString := F.IBQMBiologica.FieldValues['id_rp'];
              IBQPadres.FieldByName('id_hba').Value:= F.IBQMBiologica.FieldValues['id_hba'];
              IBQPadres.FieldByName('nombre').AsString := F.IBQMBiologica.FieldValues['nombre'];
              if TipoPadre = 'EXTERNO' then
                IBQPadres.FieldByName('interno').AsString := 'N'
              else
                IBQPadres.FieldByName('interno').AsString := 'S';
              IBQPadres.FieldByName('sexo').AsInteger := 1;
              IBQPadres.Post;
              FPrincipal.IBDPrincipal.ApplyUpdates([IBQPadres]);
            except
              IBQPadres.CancelUpdates;
            end;
            filtrarPadres(aux_padre_manual);
          end;



        end;

  F.Destroy;
  LSeleccionP.Top := 128;
end;

procedure TFEveParto.IBQColorAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

procedure TFEveParto.DBLCBAColorCloseUp(Sender: TObject);
begin
  inherited;
  IBDSNacidos.Locate('id_nacimiento',VarArrayOf([posision]), [] );
  IBDSNacidos.Edit;
  IBDSNacidos.FieldByName('NOMCOLOR').AsString := DBLCBAColor.Text;
  IBDSNacidos.Post;
end;

end.
