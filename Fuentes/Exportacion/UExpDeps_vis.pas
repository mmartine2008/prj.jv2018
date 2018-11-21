
unit UExpDeps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBTable, Grids, DBGrids, StdCtrls, QRCtrls, QuickRpt, IBQuery, DBCtrls,
  Buttons, Mask, UREPFichaAnimal, EditAuto, UDBLookupComboBoxAuto, UBDBGrid,
  ImgList, IBStoredProc, DataExport, DataToXLS, WinXP, UEveSimple, UMensajeImpresora,
  JvExExtCtrls, JvExtComponent, JvRollOut, DateTimePickerAuto, DateUtils,
  JvExControls, JvLabel, JvGIF, PngImage, jpeg, Menus, PngImageList;

type
  TObjeto = record
    combo : TDBLookupComboBoxAuto;
    sentencia : ansistring;
  end;
  TRegistroParametros = record
    nombre : string;
    valor : variant;
  end;

  TFExpDeps = class(TFUniversal)
    GBSeleccionAnimal: TGroupBox;
    DSAnimales: TDataSource;
    IBQAnimales: TIBQuery;
    IBQAux: TIBQuery;
    PBotones: TPanel;
    BitBtn3: TBitBtn;
    ACSalir: TAction;
    ACReportPrint: TAction;
    ACReportPreview: TAction;
    Ptop: TPanel;
    Pizq: TPanel;
    RGTipoPlanilla: TRadioGroup;
    EARP: TEditAuto;
    BDBGAnimales: TBitDBGrid;
    IBQParametros: TIBQuery;
    AVerFicha: TAction;
    AImprimirListado: TAction;
    ImageList1: TImageList;
    AEliminarAnimal: TAction;
    RGBusqueda: TRadioGroup;
    GBFechas: TGroupBox;
    JvComplejos: TJvRollOut;
    GBComplejos: TGroupBox;
    LDesde1: TLabel;
    LDesde2: TLabel;
    LDesde3: TLabel;
    Lhasta1: TLabel;
    Lhasta2: TLabel;
    Lhasta3: TLabel;
    CBSexo: TCheckBox;
    CBRaza: TCheckBox;
    CBCategoria: TCheckBox;
    CBCondCorp: TCheckBox;
    CBCronoDentaria: TCheckBox;
    CBEstadoRepro: TCheckBox;
    CBGdr: TCheckBox;
    CBRodeo: TCheckBox;
    CBPotrero: TCheckBox;
    DBLCBASexo: TDBLookupComboBoxAuto;
    DBLCBARaza: TDBLookupComboBoxAuto;
    DBLCBACategoria: TDBLookupComboBoxAuto;
    DBLCBACondCorporal: TDBLookupComboBoxAuto;
    DBLCBACronoDentaria: TDBLookupComboBoxAuto;
    DBLCBAEstadoRepro: TDBLookupComboBoxAuto;
    DBLCBAGdr: TDBLookupComboBoxAuto;
    DBLCBARodeo: TDBLookupComboBoxAuto;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    CBAnios: TCheckBox;
    CBPeso: TCheckBox;
    CBFrame: TCheckBox;
    EAAniosDesde: TEditAuto;
    EAPesoDesde: TEditAuto;
    EAFrameDesde: TEditAuto;
    EAAniosHasta: TEditAuto;
    EAPesoHasta: TEditAuto;
    EAFrameHasta: TEditAuto;
    CBEstadoParicion: TCheckBox;
    DBLCBAEstadoParicion: TDBLookupComboBoxAuto;
    Label2: TLabel;
    Label3: TLabel;
    DTPAHasta: TDateTimePickerAuto;
    DTPADesde: TDateTimePickerAuto;
    PMedio: TPanel;
    CBAnimalesActivos: TCheckBox;
    CBRechazados: TCheckBox;
    DataToXLS1: TDataToXLS;
    GBRaza: TGroupBox;
    RGRaza: TRadioGroup;
    Image5: TImage;
    BBAyuda: TBitBtn;
    BBFichaAnimal: TBitBtn;
    BBImprimirListado: TBitBtn;
    BBSalir: TBitBtn;
    BBXls: TBitBtn;
    ISalir: TImage;
    IExcel: TImage;
    LExcel: TLabel;
    LSalir: TLabel;
    IImprimir: TImage;
    LImprimir: TLabel;
    IVerFicha: TImage;
    LVerFicha: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    IBQRecuperarAnimales: TIBQuery;
    IBQAuxiliar: TIBQuery;
    IBQCantAnimales: TIBQuery;
    IBQInsertAuxAnimales: TIBQuery;
    IBQBorrarAuxDatosDeps: TIBQuery;
    BBVerAnimales: TButton;
    IVerAnimales: TImage;
    Label88: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure RGBusquedaClick(Sender: TObject);
    procedure EARPChange(Sender: TObject);
    procedure BDBGAnimalesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckClick(Sender: TObject);
    procedure ComboKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboKeyPress(Sender: TObject; var Key: Char);
    procedure ComboCloseUp(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure AVerFichaExecute(Sender: TObject);
    procedure Change(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char); reintroduce;
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure IBQAnimalesAfterClose(DataSet: TDataSet);
    procedure IBQAnimalesBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BDBGAnimalesKeyPress(Sender: TObject; var Key: Char);
    procedure EAAniosDesdeChange(Sender: TObject);
    procedure EAPesoDesdeChange(Sender: TObject);
    procedure EAFrameDesdeChange(Sender: TObject);
    procedure EARPKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RGTipoPlanillaClick(Sender: TObject);
    procedure closeUpFechas(Sender: TObject);
    procedure DTPAFechasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGRazaClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure IExcelClick(Sender: TObject);
    procedure IImprimirClick(Sender: TObject);
    procedure IVerFichaClick(Sender: TObject);
    procedure BBVerAnimalesClick(Sender: TObject);
  private
    FREPFichaAnimal : TFREPFichaAnimal;
    listaObjetos : array[1..16] of TObjeto;
    parametros : array of TRegistroParametros;
    Desde, Hasta : TDate;
    procedure CargarLista;
    procedure checkSolos(check : TCheckBox);
    procedure checkCombos(check : TCheckBox);
    procedure checkEdits(check : TCheckBox);
    procedure AgregarAconsulta(sentencia : Ansistring);
    procedure SacarDeConsulta(sentencia : Ansistring);
    procedure ComboChange(Combo:TDBLookupComboBoxAuto; Poner : boolean);
    procedure GuardarParametros;
    procedure CargarParametros;
    function existeEnParams(nombre:string):boolean;
    function existeEnParametros(nombre:string; Var aca: integer):boolean;
    procedure BorrarDeParametros(tag : integer);
    procedure limpiarChecks;
    procedure habilitarLabel(cond:boolean);
    procedure AbrirEventoIndividual(Eve: TFEveSimple);
    procedure ArmarExcel();
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield,title:String; save: Boolean);    
    procedure ConfigurarPorRaza;
    procedure RecuperarDatosDeAnimalesPostDest(desde: TDateTime; hasta: TDateTime; razaElegida : integer);
    procedure RecuperarDatosDeAnimalesNacDest(desde: TDateTime; hasta: TDateTime; razaElegida : integer);
    procedure RecuperarDatosDeAnimalesCalidadCarne(desde: TDateTime; hasta: TDateTime; razaElegida : integer);
    procedure BorrarAuxiliares;
    procedure RecuperarPesoMinMax;
    procedure RecuperarFrameMinMax;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExpDeps: TFExpDeps;
  consulta : AnsiString; // consulta generica
  animal : integer;
  val1Edad : integer;
  val2Edad : integer;
  val1Peso : integer;
  val2peso : integer;
  val1frame : integer;
  val2frame : integer;
  cantidadAnimales : integer;
  primerIngreso : boolean;


implementation

uses
  UPrincipal, UREPHistorialAnimalPreview, UDMSoftvet, UMensajeHuella, UCartel,
  UEveEliminarAnimal, UThreadEspera, UTraduccion;

{$R *.dfm}

// ACCION PARA SALIR
procedure TFExpDeps.RecuperarDatosDeAnimalesPostDest(desde : TDateTime; hasta : TDateTime; razaElegida: integer);
var i, ind, val, Edad, NEdad, cantidad : integer;
    cartel : TCartel;
    EdadCaption, consulta, consultaSQL, sql1, sql2, sql3, sql4, sql5: string;
    fecha : TDateTime;
begin

  i := 0;
  ind := 1;
  val := 0;

  sql1 := 'select ee.animal as animal, ta.id_rp as rp, ta.id_hba, cs.tipo as sexo, cts.id_tipo_sexo as nomtiposexo, cs.id_sexo as nomsexo, ta.raza as raza, cr.nombre as raza_nombre, ta.rodeo as rodeo, ta.categoria as categoria, ta.color, ';
  sql2 := 'cc.nombre as categoria_nombre, ta.cronologia_dentaria as crono_dent, ta.estado_reproductivo as est_repro, ta.fecha_nacimiento as fe_nac, ta.potrero as potrero, ta.activo as activo, ta.condicion_corporal as cond_corp, ta.gdr as gdr, ';
  sql3 := 'ta.rechazado as rechazado, ta.estado_lactacion as est_lact, ta.estado_actual as estado_actual, ta.madre_receptora_interna, cr.codigo, TA.SUBCATEGORIA as subcat, TA.ID_PC, TA.ID_RA from eve_eventos ee join ';
  sql4 := 'tab_animales ta on ee.animal = ta.id_animal join cod_sexos cs on (ta.sexo = cs.id_sexo) join cod_tipos_sexo cts on (cs.tipo = cts.id_tipo_sexo) JOIN cod_categorias cc on (ta.categoria = cc.id_categoria)';
  sql5 := 'join cod_razas cr on (ta.raza = cr.id_raza) where ((ee.tipo = 23) or (ee.tipo = 2)) and ee.fecha between :desde and :hasta and ee.establecimiento = :esta and activo = ''S''';

  consultaSQL := sql1+sql2+sql3+sql4+sql5;

  IBQRecuperarAnimales.Close;
  IBQRecuperarAnimales.SQL.Clear;
  IBQRecuperarAnimales.SQL.Add(consultaSQL);

  IBQRecuperarAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRecuperarAnimales.ParamByName('hasta').AsDate := hasta;
  IBQRecuperarAnimales.ParamByName('desde').AsDate := desde;

  if (razaElegida = 0) then
      consulta := ' AND (TA.RAZA = 2 OR TA.RAZA = 3 OR TA.RAZA = 29)';

  if (razaElegida = 1) then
      consulta := ' AND (TA.RAZA = 12 OR TA.RAZA = 28)';

  if (razaElegida = 2) then
      consulta := ' AND (TA.RAZA = 11)';

  IBQRecuperarAnimales.SQL.Add(consulta);
  IBQRecuperarAnimales.Open;
  IBQRecuperarAnimales.Last;
  IBQRecuperarAnimales.First;

  cantidadAnimales := IBQRecuperarAnimales.RecordCount;

  cartel:= TCartel.getInstance();
  cartel.abrirCartelProgressBar('Comienza la carga de animales.');

  val := (cantidadAnimales div 10);

  IBQAuxiliar.Close;
  IBQAuxiliar.SQL.Clear;
  IBQAuxiliar.SQL.Add('select * from REP_EXPORT_DEPS_POST_DESTETE(:establecimiento, :desde, :hasta, :raza, :animal, :aux_raza, :rp, :id_subcat, :fec_nac, :auxcodraza, :int_color)');

  while not(IBQRecuperarAnimales.Eof) do
  begin
    IBQAuxiliar.Close;
    IBQAuxiliar.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQAuxiliar.ParamByName('hasta').AsDate := hasta;
    IBQAuxiliar.ParamByName('desde').AsDate := desde;
    IBQAuxiliar.ParamByName('raza').AsInteger := razaElegida;
    IBQAuxiliar.ParamByName('animal').AsInteger := IBQRecuperarAnimales.FieldValues['animal'];
    IBQAuxiliar.ParamByName('aux_raza').AsInteger := IBQRecuperarAnimales.FieldValues['raza'];
    IBQAuxiliar.ParamByName('rp').AsString := IBQRecuperarAnimales.FieldValues['rp'];
    IBQAuxiliar.ParamByName('id_subcat').Value := IBQRecuperarAnimales.FieldValues['subcat'];
    IBQAuxiliar.ParamByName('fec_nac').AsDate := IBQRecuperarAnimales.FieldValues['fe_nac'];
    IBQAuxiliar.ParamByName('AUXCODRAZA').AsString := IBQRecuperarAnimales.FieldValues['codigo'];
    IBQAuxiliar.ParamByName('int_color').AsString := IBQRecuperarAnimales.FieldValues['color'];
    IBQAuxiliar.Open;

    if not(IBQAuxiliar.Eof) then
    begin
      IBQInsertAuxAnimales.Close;
      IBQInsertAuxAnimales.ParamByName('RP').Value := IBQRecuperarAnimales.FieldValues['rp'];
      IBQInsertAuxAnimales.ParamByName('PC').Value := i;
      IBQInsertAuxAnimales.ParamByName('RODEO').Value := IBQRecuperarAnimales.FieldValues['rodeo'];
      IBQInsertAuxAnimales.ParamByName('POTRERO').Value := IBQRecuperarAnimales.FieldValues['potrero'];
      IBQInsertAuxAnimales.ParamByName('RECHAZADO').Value := IBQRecuperarAnimales.FieldValues['rechazado'];
      IBQInsertAuxAnimales.ParamByName('GDR').Value := IBQRecuperarAnimales.FieldValues['gdr'];
      IBQInsertAuxAnimales.ParamByName('ESTADO_LACTACION').Value := IBQRecuperarAnimales.FieldValues['est_lact'];
      IBQInsertAuxAnimales.ParamByName('COND_CORP').Value := IBQRecuperarAnimales.FieldValues['cond_corp'];
      IBQInsertAuxAnimales.ParamByName('RAZA').Value := IBQRecuperarAnimales.FieldValues['raza'];
      IBQInsertAuxAnimales.ParamByName('CRONO_DENT').Value := IBQRecuperarAnimales.FieldValues['crono_dent'];
      IBQInsertAuxAnimales.ParamByName('ESTADO_REPRO').Value := IBQRecuperarAnimales.FieldValues['est_repro'];
      IBQInsertAuxAnimales.ParamByName('RAZA_NOMBRE').Value := IBQRecuperarAnimales.FieldValues['RAZA_NOMBRE'];
      IBQInsertAuxAnimales.ParamByName('CATEGORIA').Value := IBQRecuperarAnimales.FieldValues['categoria']; //IBQAuxiliar.FieldValues['CATEGORIA'];
      IBQInsertAuxAnimales.ParamByName('CATEGORIA_NOMBRE').Value := IBQRecuperarAnimales.FieldValues['CATEGORIA_NOMBRE'];
      IBQInsertAuxAnimales.ParamByName('ACTIVO').Value := IBQRecuperarAnimales.FieldValues['activo']; //IBQAuxiliar.FieldValues['ACTIVO'];
      IBQInsertAuxAnimales.ParamByName('ESTADO_ACTUAL').Value := IBQRecuperarAnimales.FieldValues['ESTADO_ACTUAL'];
      IBQInsertAuxAnimales.ParamByName('SEXO').Value := IBQRecuperarAnimales.FieldValues['sexo'];//IBQAuxiliar.FieldValues['SEXO'];
      IBQInsertAuxAnimales.ParamByName('TIPO_RP').Value := IBQAuxiliar.FieldValues['TIPO_RP'];
      IBQInsertAuxAnimales.ParamByName('COLOR').Value := IBQAuxiliar.FieldValues['COLOR'];
      IBQInsertAuxAnimales.ParamByName('HBA').Value := IBQAuxiliar.FieldValues['HBA'];
      IBQInsertAuxAnimales.ParamByName('RA').Value := IBQAuxiliar.FieldValues['RA'];
      IBQInsertAuxAnimales.ParamByName('NOMSEXO').Value := IBQAuxiliar.FieldValues['NOMSEXO'];
      IBQInsertAuxAnimales.ParamByName('FECHA_NACIMIENTO').Value := IBQRecuperarAnimales.FieldValues['fe_nac']; //IBQAuxiliar.FieldValues['FECHA_NACIMIENTO'];

      fecha := IBQRecuperarAnimales.FieldValues['fe_nac'];

      Edad := (Trunc(Date() - fecha) div 365);

      if (Edad < 2) then
      begin
         NEdad := (Trunc(Date() - fecha) div 30);
         EdadCaption := IntToStr(NEdad)+' meses';
      end
      else
         EdadCaption := IntToStr(Edad)+' años';

      IBQInsertAuxAnimales.ParamByName('FECHA_PESO_ACTUAL').Value := IBQAuxiliar.FieldValues['FECHA_PESO_ACTUAL'];
      IBQInsertAuxAnimales.ParamByName('PESO').Value := IBQAuxiliar.FieldValues['PESO'];
      IBQInsertAuxAnimales.ParamByName('FECHA_PESO_NAC').Value := IBQAuxiliar.FieldValues['FECHA_PESO_NAC'];
      IBQInsertAuxAnimales.ParamByName('PESO_NAC').Value := IBQAuxiliar.FieldValues['PESO_NAC'];
      IBQInsertAuxAnimales.ParamByName('EDAD').Value := Edad;
      IBQInsertAuxAnimales.ParamByName('PESO_DEST').Value := IBQAuxiliar.FieldValues['PESO_NAC'];
      IBQInsertAuxAnimales.ParamByName('FECHA_PESO_DEST').Value := IBQAuxiliar.FieldValues['FECHA_PESO_DEST'];
      IBQInsertAuxAnimales.ParamByName('PESO_ANIO').Value := IBQAuxiliar.FieldValues['PESO_ANIO'];
      IBQInsertAuxAnimales.ParamByName('FECHA_PESO_ANIO').Value := IBQAuxiliar.FieldValues['FECHA_PESO_ANIO'];
      IBQInsertAuxAnimales.ParamByName('PESO_ADULTO').Value := IBQAuxiliar.FieldValues['PESO_ADULTO'];
      IBQInsertAuxAnimales.ParamByName('FECHA_PESO_ADULTO').Value := IBQAuxiliar.FieldValues['FECHA_PESO_ADULTO'];
      IBQInsertAuxAnimales.ParamByName('FRAME').Value := IBQAuxiliar.FieldValues['FRAME'];
      IBQInsertAuxAnimales.ParamByName('ALZADA').Value := IBQAuxiliar.FieldValues['ALZADA'];
      IBQInsertAuxAnimales.ParamByName('FECHA_MED_FRAME').Value := IBQAuxiliar.FieldValues['FECHA_MED_FRAME'];
      IBQInsertAuxAnimales.ParamByName('FECHA_MED_ALZADA').Value := IBQAuxiliar.FieldValues['FECHA_MED_ALZADA'];
      IBQInsertAuxAnimales.ParamByName('CODIGO_MANEJO_2').Value := IBQAuxiliar.FieldValues['CODIGO_MANEJO_2'];
      IBQInsertAuxAnimales.ParamByName('CODIGO_MANEJO_3').Value := IBQAuxiliar.FieldValues['CODIGO_MANEJO_3'];
      IBQInsertAuxAnimales.ParamByName('CIRC_ESC').Value := IBQAuxiliar.FieldValues['CIRC_ESC'];
      IBQInsertAuxAnimales.ParamByName('FECHA_MED_CIRC').Value := IBQAuxiliar.FieldValues['FECHA_MED_CIR_ESC'];
      IBQInsertAuxAnimales.ParamByName('EDAD_MED').Value := IBQAuxiliar.FieldValues['EDAD_MED'];
      IBQInsertAuxAnimales.ParamByName('EDADCAPTION').Value := EdadCaption;
      IBQInsertAuxAnimales.ParamByName('OBSERVACION').Value := IBQAuxiliar.FieldValues['OBSERVACION'];
      IBQInsertAuxAnimales.ParamByName('SUBCAT').Value := IBQAuxiliar.FieldValues['SUBCATEGORIA'];
      IBQInsertAuxAnimales.ParamByName('NOMSEXO').Value := IBQRecuperarAnimales.FieldValues['nomsexo'];
      IBQInsertAuxAnimales.ParamByName('NOMTIPOSEXO').Value := IBQRecuperarAnimales.FieldValues['nomtiposexo'];
      IBQInsertAuxAnimales.Open;

      FPrincipal.IBTPrincipal.CommitRetaining;

    end;

    IBQRecuperarAnimales.Next;

    inc(i);

    if (i = (val*ind)) then
    begin
      cartel.setCartelProgressBar('   Progreso de carga: '+inttostr(ind*10)+'%',2);
      inc(ind);
    end;

  end;

  cartel.cerrarCartelProgressBar;
  cartel.FreeInstance;

end;

procedure TFExpDeps.RecuperarDatosDeAnimalesCalidadCarne(desde : TDateTime; hasta : TDateTime; razaElegida: integer);
var i, ind, val, Edad, NEdad, cantidad : integer;
    cartel : TCartel;
    EdadCaption, consulta, consultaSQL, sql1, sql2, sql3, sql4, sql5: string;
    fecha : TDateTime;
begin

  i := 0;
  ind := 1;
  val := 0;

  sql1 := 'select ee.animal as animal, ta.id_rp as rp, ta.id_hba, cs.tipo as sexo, cts.id_tipo_sexo as nomtiposexo, cs.id_sexo as nomsexo, ta.raza as raza, cr.nombre as raza_nombre, ta.rodeo as rodeo, ta.categoria as categoria, ta.color, ';
  sql2 := 'cc.nombre as categoria_nombre, ta.cronologia_dentaria as crono_dent, ta.estado_reproductivo as est_repro, ta.fecha_nacimiento as fe_nac, ta.potrero as potrero, ta.activo as activo, ta.condicion_corporal as cond_corp, ta.gdr as gdr, ';
  sql3 := 'ta.rechazado as rechazado, ta.estado_lactacion as est_lact, ta.estado_actual as estado_actual, ta.madre_receptora_interna, cr.codigo, TA.SUBCATEGORIA as subcat, TA.ID_PC, TA.ID_RA, ECC.AOB, ECC.GI, ECC.EG, ECC.GC, EE.FECHA, EE.ID_EVENTO ';
  sql4 := 'from eve_eventos ee JOIN EVE_CALIDAD_CARNE ECC ON EE.ID_EVENTO = ECC.ID_EVENTO join tab_animales ta on ee.animal = ta.id_animal join cod_sexos cs on (ta.sexo = cs.id_sexo) join cod_tipos_sexo cts on (cs.tipo = cts.id_tipo_sexo) JOIN ';
  sql5 := 'cod_categorias cc on (ta.categoria = cc.id_categoria) join cod_razas cr on (ta.raza = cr.id_raza) where ee.fecha between :desde and :hasta and ee.establecimiento = :esta and ECC.AOB IS NOT NULL AND EE.TIPO = 41';

  consultaSQL := sql1+sql2+sql3+sql4+sql5;

  IBQRecuperarAnimales.Close;
  IBQRecuperarAnimales.SQL.Clear;
  IBQRecuperarAnimales.SQL.Add(consultaSQL);

  IBQRecuperarAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRecuperarAnimales.ParamByName('hasta').AsDate := hasta;
  IBQRecuperarAnimales.ParamByName('desde').AsDate := desde;

  if (razaElegida = 0) then
      consulta := ' AND (TA.RAZA = 2 OR TA.RAZA = 3 OR TA.RAZA = 29)';

  if (razaElegida = 1) then
      consulta := ' AND (TA.RAZA = 12 OR TA.RAZA = 28)';

  if (razaElegida = 2) then
      consulta := ' AND (TA.RAZA = 11)';

  IBQRecuperarAnimales.SQL.Add(consulta);
  IBQRecuperarAnimales.Open;
  IBQRecuperarAnimales.Last;
  IBQRecuperarAnimales.First;

  cantidadAnimales := IBQRecuperarAnimales.RecordCount;

  cartel:= TCartel.getInstance();
  cartel.abrirCartelProgressBar('Comienza la carga de animales.');

  val := (cantidadAnimales div 10);

  IBQAuxiliar.Close;
  IBQAuxiliar.SQL.Clear;
  IBQAuxiliar.SQL.Add('select * from REP_EXP_CALIDAD_CARNE(:establecimiento, :desde, :hasta, :raza, :animal, :aux_raza, :rp, :id_subcat, :fec_nac, :auxcodraza, :id_cc, :int_color)');

  while not(IBQRecuperarAnimales.Eof) do
  begin
    IBQAuxiliar.Close;
    IBQAuxiliar.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQAuxiliar.ParamByName('hasta').AsDate := hasta;
    IBQAuxiliar.ParamByName('desde').AsDate := desde;
    IBQAuxiliar.ParamByName('raza').AsInteger := razaElegida;
    IBQAuxiliar.ParamByName('animal').AsInteger := IBQRecuperarAnimales.FieldValues['animal'];
    IBQAuxiliar.ParamByName('aux_raza').AsInteger := IBQRecuperarAnimales.FieldValues['raza'];
    IBQAuxiliar.ParamByName('rp').AsString := IBQRecuperarAnimales.FieldValues['rp'];
    IBQAuxiliar.ParamByName('id_subcat').Value := IBQRecuperarAnimales.FieldValues['subcat'];
    IBQAuxiliar.ParamByName('fec_nac').AsDate := IBQRecuperarAnimales.FieldValues['fe_nac'];
    IBQAuxiliar.ParamByName('AUXCODRAZA').AsString := IBQRecuperarAnimales.FieldValues['codigo'];
    IBQAuxiliar.ParamByName('id_cc').AsString := IBQRecuperarAnimales.FieldValues['id_evento'];
    IBQAuxiliar.ParamByName('int_color').AsString := IBQRecuperarAnimales.FieldValues['color'];
    IBQAuxiliar.Open;

    if not(IBQAuxiliar.Eof) then
    begin
      IBQInsertAuxAnimales.Close;
      IBQInsertAuxAnimales.ParamByName('PC').Value := i;
      IBQInsertAuxAnimales.ParamByName('RODEO').Value := IBQRecuperarAnimales.FieldValues['rodeo'];
      IBQInsertAuxAnimales.ParamByName('POTRERO').Value := IBQRecuperarAnimales.FieldValues['potrero'];
      IBQInsertAuxAnimales.ParamByName('RECHAZADO').Value := IBQRecuperarAnimales.FieldValues['rechazado'];
      IBQInsertAuxAnimales.ParamByName('GDR').Value := IBQRecuperarAnimales.FieldValues['gdr'];
      IBQInsertAuxAnimales.ParamByName('ESTADO_LACTACION').Value := IBQRecuperarAnimales.FieldValues['est_lact'];
      IBQInsertAuxAnimales.ParamByName('COND_CORP').Value := IBQRecuperarAnimales.FieldValues['cond_corp'];
      IBQInsertAuxAnimales.ParamByName('RAZA').Value := IBQRecuperarAnimales.FieldValues['raza'];
      IBQInsertAuxAnimales.ParamByName('CRONO_DENT').Value := IBQRecuperarAnimales.FieldValues['crono_dent'];
      IBQInsertAuxAnimales.ParamByName('ESTADO_REPRO').Value := IBQRecuperarAnimales.FieldValues['est_repro'];
      IBQInsertAuxAnimales.ParamByName('RAZA_NOMBRE').Value := IBQRecuperarAnimales.FieldValues['RAZA_NOMBRE'];
      IBQInsertAuxAnimales.ParamByName('CATEGORIA').Value := IBQRecuperarAnimales.FieldValues['categoria']; //IBQAuxiliar.FieldValues['CATEGORIA'];
      IBQInsertAuxAnimales.ParamByName('CATEGORIA_NOMBRE').Value := IBQRecuperarAnimales.FieldValues['CATEGORIA_NOMBRE'];
      IBQInsertAuxAnimales.ParamByName('ACTIVO').Value := IBQRecuperarAnimales.FieldValues['activo']; //IBQAuxiliar.FieldValues['ACTIVO'];
      IBQInsertAuxAnimales.ParamByName('ESTADO_ACTUAL').Value := IBQRecuperarAnimales.FieldValues['ESTADO_ACTUAL'];
      IBQInsertAuxAnimales.ParamByName('SEXO').Value := IBQRecuperarAnimales.FieldValues['sexo'];//IBQAuxiliar.FieldValues['SEXO'];
      IBQInsertAuxAnimales.ParamByName('TIPO_RP').Value := IBQAuxiliar.FieldValues['TIPO_RP'];
      IBQInsertAuxAnimales.ParamByName('COLOR').Value := IBQAuxiliar.FieldValues['COLOR'];
      IBQInsertAuxAnimales.ParamByName('COLOR_PADRE').Value := IBQAuxiliar.FieldValues['COLOR_PADRE'];
      IBQInsertAuxAnimales.ParamByName('HBA').Value := IBQAuxiliar.FieldValues['HBA'];
      IBQInsertAuxAnimales.ParamByName('NOMSEXO').Value := IBQAuxiliar.FieldValues['NOMSEXO'];
      IBQInsertAuxAnimales.ParamByName('FECHA_NACIMIENTO').Value := IBQRecuperarAnimales.FieldValues['fe_nac'];

      fecha := IBQRecuperarAnimales.FieldValues['fe_nac'];

      Edad := (Trunc(Date() - fecha) div 365);

      if (Edad < 2) then
      begin
         NEdad := (Trunc(Date() - fecha) div 30);
         EdadCaption := IntToStr(NEdad)+' meses';
      end
      else
         EdadCaption := IntToStr(Edad)+' años';

      IBQInsertAuxAnimales.ParamByName('RP').Value := IBQRecuperarAnimales.FieldValues['rp'];

      IBQInsertAuxAnimales.ParamByName('PESO').Value := IBQAuxiliar.FieldValues['PESO'];
      IBQInsertAuxAnimales.ParamByName('FECHA_PESO_ACTUAL').Value := IBQAuxiliar.FieldValues['FECHA_PESO_ACTUAL'];
      IBQInsertAuxAnimales.ParamByName('PESO_NAC').Value := IBQAuxiliar.FieldValues['PESO_MEDICION'];
      IBQInsertAuxAnimales.ParamByName('FECHA_PESO_NAC').Value := IBQRecuperarAnimales.FieldValues['FECHA'];
      IBQInsertAuxAnimales.ParamByName('EDAD').Value := Edad;
      IBQInsertAuxAnimales.ParamByName('CODIGO_MANEJO_0').Value := IBQAuxiliar.FieldValues['CODIGO_MANEJO'];
      IBQInsertAuxAnimales.ParamByName('CIRC_ESC').Value := IBQAuxiliar.FieldValues['CIRCUNFERENCIA_ESC'];
      IBQInsertAuxAnimales.ParamByName('ALZADA').Value := IBQAuxiliar.FieldValues['ALZADA'];

      IBQInsertAuxAnimales.ParamByName('ESTAB_ACT').Value := IBQAuxiliar.FieldValues['ESTAB_ACT'];
      IBQInsertAuxAnimales.ParamByName('ESTAB_NAC').Value := IBQAuxiliar.FieldValues['ESTAB_NAC'];

      IBQInsertAuxAnimales.ParamByName('AOB').Value := IBQRecuperarAnimales.FieldValues['AOB'];
      IBQInsertAuxAnimales.ParamByName('GI').Value := IBQRecuperarAnimales.FieldValues['GI'];
      IBQInsertAuxAnimales.ParamByName('GD').Value := IBQRecuperarAnimales.FieldValues['EG'];
      IBQInsertAuxAnimales.ParamByName('GC').Value := IBQRecuperarAnimales.FieldValues['GC'];

      IBQInsertAuxAnimales.ParamByName('RAZAMADREBIOLOGICA').Value := IBQAuxiliar.FieldValues['RAZAMADREBIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('RAZAPADRE').Value := IBQAuxiliar.FieldValues['RAZAPADRE'];
      IBQInsertAuxAnimales.ParamByName('MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('PADRE').Value := IBQAuxiliar.FieldValues['PADRE'];
      IBQInsertAuxAnimales.ParamByName('COLOR_MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['COLOR_MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('RP_PADRE').Value := IBQAuxiliar.FieldValues['RP_PADRE'];
      IBQInsertAuxAnimales.ParamByName('HBA_PADRE').Value := IBQAuxiliar.FieldValues['HBA_PADRE'];
      IBQInsertAuxAnimales.ParamByName('RAZAPADRENOMBRE').Value := IBQAuxiliar.FieldValues['RAZAPADRENOMBRE'];
      IBQInsertAuxAnimales.ParamByName('EDADCAPTION').Value := EdadCaption; //IBQAuxiliar.FieldValues['EDADCAPTION'];
      IBQInsertAuxAnimales.ParamByName('NACIMIENTO_PADRE').Value := IBQAuxiliar.FieldValues['NACIMIENTO_PADRE'];
      IBQInsertAuxAnimales.ParamByName('RP_MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['RP_MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('HBA_MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['HBA_MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('OBSERVACION').Value := IBQAuxiliar.FieldValues['OBSERVACION'];
      IBQInsertAuxAnimales.ParamByName('SUBCAT').Value := IBQRecuperarAnimales.FieldValues['SUBCAT'];
      IBQInsertAuxAnimales.ParamByName('RAZAMADRENOMBREBIOLOGICA').Value := IBQAuxiliar.FieldValues['RAZAMADRENOMBREBIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('NACIMIENTO_MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['NACIMIENTO_MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('SUBCAT_MBI').Value := IBQAuxiliar.FieldValues['SUBCAT_MBI'];
      IBQInsertAuxAnimales.ParamByName('SUBCAT_P').Value := IBQAuxiliar.FieldValues['SUBCAT_P'];
      IBQInsertAuxAnimales.ParamByName('NOMSEXO').Value := IBQRecuperarAnimales.FieldValues['nomsexo'];
      IBQInsertAuxAnimales.ParamByName('NOMTIPOSEXO').Value := IBQRecuperarAnimales.FieldValues['nomtiposexo'];
      IBQInsertAuxAnimales.Open;

      FPrincipal.IBTPrincipal.CommitRetaining;

    end;

    IBQRecuperarAnimales.Next;

    inc(i);

    if (i = (val*ind)) then
    begin
      cartel.setCartelProgressBar('   Progreso de carga: '+inttostr(ind*10)+'%',2);
      inc(ind);
    end;

  end;

  cartel.cerrarCartelProgressBar;
  cartel.FreeInstance;

end;

procedure TFExpDeps.RecuperarDatosDeAnimalesNacDest(desde : TDateTime; hasta : TDateTime; razaElegida: integer);
var i, ind, val, Edad, NEdad, cantidad : integer;
    cartel : TCartel;
    EdadCaption, consulta, consultaSQL, sql1, sql2, sql3, sql4, sql5: string;
    fecha : TDateTime;
    cod_mell : integer;
begin

  i := 0;
  ind := 1;
  val := 0;

  sql1 := 'select ee.animal as animal, en.vivo as vivo, ta.id_rp as rp, ta.id_hba, cs.tipo as sexo, cts.id_tipo_sexo as nomtiposexo, cs.id_sexo as nomsexo, ta.raza as raza, cr.nombre as raza_nombre, ta.rodeo as rodeo, ta.categoria as categoria, ';
  sql2 := 'cc.nombre as categoria_nombre, ta.cronologia_dentaria as crono_dent, ta.estado_reproductivo as est_repro, ta.fecha_nacimiento as fe_nac, ta.potrero as potrero, ta.activo as activo, ta.condicion_corporal as cond_corp, ta.gdr as gdr, ta.color, ';
  sql3 := 'ta.rechazado as rechazado, ta.estado_lactacion as est_lact, ta.estado_actual as estado_actual, ta.madre_receptora_interna, cr.codigo, TA.SUBCATEGORIA as subcat, TA.ID_PC, TA.ID_RA from (eve_eventos ee join eve_nacimiento en on ';
  sql4 := 'ee.id_evento = en.id_evento) join tab_animales ta on ee.animal = ta.id_animal join cod_sexos cs on (ta.sexo = cs.id_sexo) join cod_tipos_sexo cts on (cs.tipo = cts.id_tipo_sexo) JOIN cod_categorias cc on (ta.categoria = cc.id_categoria) ';
  sql5 := 'join cod_razas cr on (ta.raza = cr.id_raza) where ee.tipo = 23 and ee.fecha between :desde and :hasta and ee.establecimiento = :esta';

  consultaSQL := sql1+sql2+sql3+sql4+sql5;

  IBQRecuperarAnimales.Close;
  IBQRecuperarAnimales.SQL.Clear;
  IBQRecuperarAnimales.SQL.Add(consultaSQL);

  IBQRecuperarAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRecuperarAnimales.ParamByName('hasta').AsDate := hasta;
  IBQRecuperarAnimales.ParamByName('desde').AsDate := desde;

  if (razaElegida = 0) then
      consulta := ' AND (TA.RAZA = 2 OR TA.RAZA = 3 OR TA.RAZA = 29)';

  if (razaElegida = 1) then
      consulta := ' AND (TA.RAZA = 12 OR TA.RAZA = 28)';

  if (razaElegida = 2) then
      consulta := ' AND (TA.RAZA = 11)';

  IBQRecuperarAnimales.SQL.Add(consulta);
  IBQRecuperarAnimales.Open;
  IBQRecuperarAnimales.Last;
  IBQRecuperarAnimales.First;


  cantidadAnimales := IBQRecuperarAnimales.RecordCount;

  cartel:= TCartel.getInstance();
  cartel.abrirCartelProgressBar('Comienza la carga de animales.');

  val := (cantidadAnimales div 10);

  IBQAuxiliar.Close;
  IBQAuxiliar.SQL.Clear;
  IBQAuxiliar.SQL.Add('select * from REP_EXPORT_DEPS_NAC_DESTETE(:establecimiento, :desde, :hasta, :raza, :animal, :vivo, :aux_raza, :rp, :id_subcat, :fec_nac, :auxcodraza, :INT_COLOR)');

  while not(IBQRecuperarAnimales.Eof) do
  begin
    IBQAuxiliar.Close;
    IBQAuxiliar.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQAuxiliar.ParamByName('hasta').AsDate := hasta;
    IBQAuxiliar.ParamByName('desde').AsDate := desde;
    IBQAuxiliar.ParamByName('raza').AsInteger := razaElegida;
    IBQAuxiliar.ParamByName('animal').AsInteger := IBQRecuperarAnimales.FieldValues['animal'];
    IBQAuxiliar.ParamByName('vivo').AsString := IBQRecuperarAnimales.FieldValues['vivo'];
    IBQAuxiliar.ParamByName('aux_raza').AsInteger := IBQRecuperarAnimales.FieldValues['raza'];
    IBQAuxiliar.ParamByName('rp').AsString := IBQRecuperarAnimales.FieldValues['rp'];
    IBQAuxiliar.ParamByName('id_subcat').Value := IBQRecuperarAnimales.FieldValues['subcat'];
    IBQAuxiliar.ParamByName('fec_nac').AsDate := IBQRecuperarAnimales.FieldValues['fe_nac'];
    IBQAuxiliar.ParamByName('AUXCODRAZA').AsString := IBQRecuperarAnimales.FieldValues['codigo'];
    IBQAuxiliar.ParamByName('int_color').AsString := IBQRecuperarAnimales.FieldValues['color'];
    IBQAuxiliar.Open;

    cod_mell := IBQRecuperarAnimales.FieldByName('nomsexo').AsInteger;
    case cod_mell of
      7,8 : cod_mell := 1;
      9,10 : cod_mell := 2;
      5 : cod_mell := 6;
      6 : cod_mell := 5;
    end;

    if not(IBQAuxiliar.Eof) then
    begin
      IBQInsertAuxAnimales.Close;
      IBQInsertAuxAnimales.ParamByName('PC').Value := i;
     // IBQInsertAuxAnimales.ParamByName('ANIMAL').Value := IBQRecuperarAnimales.FieldValues['animal']; //IBQAuxiliar.FieldValues['animal_dupli'];
      IBQInsertAuxAnimales.ParamByName('RODEO').Value := IBQRecuperarAnimales.FieldValues['rodeo'];
      IBQInsertAuxAnimales.ParamByName('POTRERO').Value := IBQRecuperarAnimales.FieldValues['potrero'];
      IBQInsertAuxAnimales.ParamByName('RECHAZADO').Value := IBQRecuperarAnimales.FieldValues['rechazado'];
      IBQInsertAuxAnimales.ParamByName('GDR').Value := IBQRecuperarAnimales.FieldValues['gdr'];
      IBQInsertAuxAnimales.ParamByName('ESTADO_LACTACION').Value := IBQRecuperarAnimales.FieldValues['est_lact'];
      IBQInsertAuxAnimales.ParamByName('COND_CORP').Value := IBQRecuperarAnimales.FieldValues['cond_corp'];
      IBQInsertAuxAnimales.ParamByName('RAZA').Value := IBQRecuperarAnimales.FieldValues['raza'];
      IBQInsertAuxAnimales.ParamByName('CRONO_DENT').Value := IBQRecuperarAnimales.FieldValues['crono_dent'];
      IBQInsertAuxAnimales.ParamByName('ESTADO_REPRO').Value := IBQRecuperarAnimales.FieldValues['est_repro'];
      IBQInsertAuxAnimales.ParamByName('RAZA_NOMBRE').Value := IBQRecuperarAnimales.FieldValues['RAZA_NOMBRE'];
      IBQInsertAuxAnimales.ParamByName('CATEGORIA').Value := IBQRecuperarAnimales.FieldValues['categoria']; //IBQAuxiliar.FieldValues['CATEGORIA'];
      IBQInsertAuxAnimales.ParamByName('CATEGORIA_NOMBRE').Value := IBQRecuperarAnimales.FieldValues['CATEGORIA_NOMBRE'];
      IBQInsertAuxAnimales.ParamByName('ACTIVO').Value := IBQRecuperarAnimales.FieldValues['activo']; //IBQAuxiliar.FieldValues['ACTIVO'];
      IBQInsertAuxAnimales.ParamByName('ESTADO_ACTUAL').Value := IBQRecuperarAnimales.FieldValues['ESTADO_ACTUAL'];
      IBQInsertAuxAnimales.ParamByName('SEXO').Value := IBQRecuperarAnimales.FieldValues['sexo'];//IBQAuxiliar.FieldValues['SEXO'];
      IBQInsertAuxAnimales.ParamByName('TIPO_RP').Value := IBQAuxiliar.FieldValues['TIPO_RP'];
      IBQInsertAuxAnimales.ParamByName('COLOR').Value := IBQAuxiliar.FieldValues['COLOR'];
      IBQInsertAuxAnimales.ParamByName('COLOR_PADRE').Value := IBQAuxiliar.FieldValues['COLOR_PADRE'];
      IBQInsertAuxAnimales.ParamByName('HBA').Value := IBQAuxiliar.FieldValues['HBA'];
      IBQInsertAuxAnimales.ParamByName('RA').Value := IBQAuxiliar.FieldValues['RA'];

      IBQInsertAuxAnimales.ParamByName('TIPO_SERVICIO').Value := IBQAuxiliar.FieldValues['TIPO_SERVICIO'];
      IBQInsertAuxAnimales.ParamByName('NOMSEXO').Value := IBQAuxiliar.FieldValues['NOMSEXO'];
      IBQInsertAuxAnimales.ParamByName('FECHA_NACIMIENTO').Value := IBQRecuperarAnimales.FieldValues['fe_nac']; //IBQAuxiliar.FieldValues['FECHA_NACIMIENTO'];

      fecha := IBQRecuperarAnimales.FieldValues['fe_nac'];

      Edad := (Trunc(Date - fecha) div 365);

      if (Edad < 2) then
      begin
         NEdad := (Trunc(Date() - fecha) div 30);
         EdadCaption := IntToStr(NEdad)+' meses';
      end
      else
         EdadCaption := IntToStr(Edad)+' años';


      IBQInsertAuxAnimales.ParamByName('PESO').Value := IBQAuxiliar.FieldValues['PESO'];
      IBQInsertAuxAnimales.ParamByName('RP').Value := IBQRecuperarAnimales.FieldValues['rp'];
      IBQInsertAuxAnimales.ParamByName('PESO_NAC').Value := IBQAuxiliar.FieldValues['PESO_NAC'];
      IBQInsertAuxAnimales.ParamByName('EDAD').Value := Edad;//IBQAuxiliar.FieldValues['EDAD'];
      IBQInsertAuxAnimales.ParamByName('CODIGO_MANEJO_0').Value := IBQAuxiliar.FieldValues['CODIGO_MANEJO_0'];
      IBQInsertAuxAnimales.ParamByName('RAZAMADREBIOLOGICA').Value := IBQAuxiliar.FieldValues['RAZAMADREBIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('RAZAMADRERECEPTORA').Value := IBQAuxiliar.FieldValues['RAZAMADRERECEPTORA'];
      IBQInsertAuxAnimales.ParamByName('RAZAPADRE').Value := IBQAuxiliar.FieldValues['RAZAPADRE'];
      IBQInsertAuxAnimales.ParamByName('MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('MADRE_RECEPTORA').Value := IBQAuxiliar.FieldValues['MADRE_RECEPTORA'];
      IBQInsertAuxAnimales.ParamByName('PADRE').Value := IBQAuxiliar.FieldValues['PADRE'];
      IBQInsertAuxAnimales.ParamByName('COLOR_MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['COLOR_MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('FECHA_PESO_NAC').Value := IBQAuxiliar.FieldValues['FECHA_PESO_NAC'];
      IBQInsertAuxAnimales.ParamByName('FECHA_PESO_DEST').Value := IBQAuxiliar.FieldValues['FECHA_PESO_DEST'];
      IBQInsertAuxAnimales.ParamByName('FECHA_MED_FRAME').Value := IBQAuxiliar.FieldValues['FECHA_MED_FRAME'];
      IBQInsertAuxAnimales.ParamByName('FECHA_MED_ALZADA').Value := IBQAuxiliar.FieldValues['FECHA_MED_ALZADA'];
      IBQInsertAuxAnimales.ParamByName('FECHA_PESO_ACTUAL').Value := IBQAuxiliar.FieldValues['FECHA_PESO_ACTUAL'];
      IBQInsertAuxAnimales.ParamByName('RP_PADRE').Value := IBQAuxiliar.FieldValues['RP_PADRE'];
      IBQInsertAuxAnimales.ParamByName('CODIGO_MUERTO').Value := IBQAuxiliar.FieldValues['CODIGO_MUERTO'];
      IBQInsertAuxAnimales.ParamByName('PC_PADRE').Value := IBQAuxiliar.FieldValues['PC_PADRE'];
      IBQInsertAuxAnimales.ParamByName('RA_PADRE').Value := IBQAuxiliar.FieldValues['RA_PADRE'];
      IBQInsertAuxAnimales.ParamByName('HBA_PADRE').Value := IBQAuxiliar.FieldValues['HBA_PADRE'];
      IBQInsertAuxAnimales.ParamByName('RAZAPADRENOMBRE').Value := IBQAuxiliar.FieldValues['RAZAPADRENOMBRE'];
      IBQInsertAuxAnimales.ParamByName('CODIGO_MANEJO_1').Value := IBQAuxiliar.FieldValues['CODIGO_MANEJO_1'];
      IBQInsertAuxAnimales.ParamByName('EDADCAPTION').Value := EdadCaption; //IBQAuxiliar.FieldValues['EDADCAPTION'];
      IBQInsertAuxAnimales.ParamByName('NACIMIENTO_PADRE').Value := IBQAuxiliar.FieldValues['NACIMIENTO_PADRE'];
      IBQInsertAuxAnimales.ParamByName('RP_MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['RP_MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('PC_MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['PC_MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('FRAME').Value := IBQAuxiliar.FieldValues['FRAME'];
      IBQInsertAuxAnimales.ParamByName('PESO_DEST').Value := IBQAuxiliar.FieldValues['PESO_DEST'];
      IBQInsertAuxAnimales.ParamByName('ALZADA').Value := IBQAuxiliar.FieldValues['ALZADA'];
      IBQInsertAuxAnimales.ParamByName('RA_MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['RA_MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('HBA_MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['HBA_MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('OBSERVACION').Value := IBQAuxiliar.FieldValues['OBSERVACION'];
      IBQInsertAuxAnimales.ParamByName('SUBCAT').Value := IBQAuxiliar.FieldValues['SUBCAT'];
      IBQInsertAuxAnimales.ParamByName('RAZAMADRENOMBREBIOLOGICA').Value := IBQAuxiliar.FieldValues['RAZAMADRENOMBREBIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('NACIMIENTO_MADRE_BIOLOGICA').Value := IBQAuxiliar.FieldValues['NACIMIENTO_MADRE_BIOLOGICA'];
      IBQInsertAuxAnimales.ParamByName('RP_MADRE_RECEPTORA').Value := IBQAuxiliar.FieldValues['RP_MADRE_RECEPTORA'];
      IBQInsertAuxAnimales.ParamByName('TIPO_PARTO').Value := IBQAuxiliar.FieldValues['TIPO_PARTO'];
      IBQInsertAuxAnimales.ParamByName('RAZAMADRENOMBRERECEPTORA').Value := IBQAuxiliar.FieldValues['RAZAMADRENOMBRERECEPTORA'];
      IBQInsertAuxAnimales.ParamByName('NACIMIENTO_MADRE_RECEPTORA').Value := IBQAuxiliar.FieldValues['NACIMIENTO_MADRE_RECEPTORA'];
      IBQInsertAuxAnimales.ParamByName('SUBCAT_MBI').Value := IBQAuxiliar.FieldValues['SUBCAT_MBI'];
      IBQInsertAuxAnimales.ParamByName('SUBCAT_P').Value := IBQAuxiliar.FieldValues['SUBCAT_P'];
      IBQInsertAuxAnimales.ParamByName('NOMSEXO').Value := cod_mell;//IBQRecuperarAnimales.FieldValues['nomsexo'];
      IBQInsertAuxAnimales.ParamByName('NOMTIPOSEXO').Value := IBQRecuperarAnimales.FieldValues['nomtiposexo'];
      IBQInsertAuxAnimales.Open;

      FPrincipal.IBTPrincipal.CommitRetaining;

    end;

    IBQRecuperarAnimales.Next;

    inc(i);

    if (i = (val*ind)) then
    begin
      cartel.setCartelProgressBar('   Progreso de carga: '+inttostr(ind*10)+'%',2);
      inc(ind);
    end;

  end;

  cartel.cerrarCartelProgressBar;
  cartel.FreeInstance;

end;




// en el create configuro todo el formulario
procedure TFExpDeps.FormCreate(Sender: TObject);
var cartel: TCartel;
    msje, sqlConsulta, consSQLP1, consSQLP2, consSQLP3, consSQLP4, consSQLP5, consSQLP6, consSQLP7, consSQLF: String;
    Msg: TMsg;
    i : integer;
    E: EDatabaseError;
begin
  inherited;

  i := 0;

  DTPADesde.Date := IncYear(Today(),-1);
  DTPAHasta.Date := Today();
  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;

  EAAniosDesde.OnChange:= nil;
  EAAniosHasta.OnChange:= nil;

  EAPesoDesde.OnChange:= nil;
  EAPesoHasta.OnChange:= nil;

  EAFrameDesde.OnChange:= nil;
  EAFrameHasta.OnChange:= nil;

  val1edad := 0;
  val2edad := 30;

  EAAniosDesde.Text := intToStr(val1Edad);
  EAAniosHasta.Text := intToStr(val2Edad);

  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;

  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;

  DMSoftvet.IBQEstadoParicion.Close;
  DMSoftvet.IBQEstadoParicion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQEstadoParicion.Open;

  primerIngreso := true;

  JvComplejos.Collapsed := true;

  consulta := 'select * from aux_datos_deps';

  CargarLista;
  EAAniosDesde.OnChange:= EAAniosDesdeChange;
  EAAniosHasta.OnChange:= EAAniosDesdeChange;
  EAPesoDesde.OnChange:= EAPesoDesdeChange;
  EAPesoHasta.OnChange:= EAPesoDesdeChange;
  EAFrameDesde.OnChange:= EAFrameDesdeChange;
  EAFrameHasta.OnChange:= EAFrameDesdeChange;

end;

// dependiento el tipo de busqueda que desee, reconfiguro la consulta y controlo
// el acceso a los componentes correspondientes al tipo de busqueda
procedure TFExpDeps.RGBusquedaClick(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Recuperando Animales ...';
  cartel.abrircartel(msje);

  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;

  JvComplejos.Collapsed := RGBusqueda.ItemIndex <> 2;
  inherited;
  case RGBusqueda.ItemIndex of
    0 : begin
          EARP.Enabled := false;
          GBComplejos.Enabled := false;
          limpiarChecks;
          habilitarLabel(false);
        end;
    1 : begin
          EARP.Enabled := true;
          GBComplejos.Enabled := false;
          limpiarChecks;
          habilitarLabel(false);
          EARP.Clear;
          EARP.SetFocus;
        end;
    2 : begin
          EARP.Enabled := false;
          GBComplejos.Enabled := true;
          habilitarLabel(true);
          GuardarParametros;
          CargarParametros;
        end;
  end;
  cartel.cerrarcartel();
  cartel.FreeInstance();

end;

// actualizo la busqueda por rp cuando es busqueda individual
procedure TFExpDeps.EARPChange(Sender: TObject);
begin
  inherited;

  if ( RGTipoPlanilla.ItemIndex <> 0 ) then
  begin
    IBQAnimales.Close;
    IBQAnimales.ParamByName('establecimiento').AsInteger := Fprincipal.EstablecimientoActual;
    IBQAnimales.ParamByName('desde').AsDate := DTPADesde.Date;
    IBQAnimales.ParamByName('hasta').AsDate := DTPAHasta.Date;
    IBQAnimales.ParamByName('raza').AsInteger := RGRaza.ItemIndex;
  end;

  IBQAnimales.ParamByName('in').AsString := EARP.Text;
//  IBQAnimales.Open;
  {with ibqanimales do
   begin
     if not Locate('rp',EARP.Text,[loPartialKey]) then Beep;
     if(EARP.Text = '') then First;
   end;}
end;

//pinto de gris lo animales inhactivos
procedure TFExpDeps.BDBGAnimalesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (IBQAnimales.FieldByName('activo').AsString = 'N') then
    BDBGAnimales.Canvas.Font.Color := clgray
  else
    BDBGAnimales.Canvas.Font.Color := clblack;
  BDBGAnimales.Canvas.FillRect(Rect);
  BDBGAnimales.Canvas.TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text); 
end;

//inicializo una estructura que es utilizada para guardar la sentencia que
//hay que agregar en el sql para activar el correspondiente filtro
procedure TFExpDeps.CargarLista;
begin

// 1 -- Ver solo animales activos
  listaObjetos[1].combo := nil;
  listaObjetos[1].sentencia := '(activo = ''S'')';

// 2 -- Ver solo animales rechazados
  listaObjetos[2].combo := nil;
  listaObjetos[2].sentencia := '(rechazado = ''S'')';

// 3 -- Ver ultimo Evento
  listaObjetos[3].combo := nil;
  listaObjetos[3].sentencia := '';

// 4 -- Filtro por sexo
  listaObjetos[4].combo := DBLCBASexo;
  listaObjetos[4].sentencia := '(sexo = :sexo)';

// 5 -- Filtro por raza
  listaObjetos[5].combo := DBLCBARaza;
  listaObjetos[5].sentencia := '(raza = :raza)';

// 6 -- Filtro por categoria
  listaObjetos[6].combo := DBLCBACategoria;
  listaObjetos[6].sentencia := '(categoria = :categoria)';

// 7 -- Filtro por condicion corporal
  listaObjetos[7].combo := DBLCBACondCorporal;
  listaObjetos[7].sentencia := '(cond_corp = :condicion_corporal)';

// 8 -- Filtro por cronologia dentaria
  listaObjetos[8].combo := DBLCBACronoDentaria;
  listaObjetos[8].sentencia := '(crono_dent = :cronologia_dentaria)';

// 9 -- Filtro por estado reproductivo
  listaObjetos[9].combo := DBLCBAEstadoRepro;
  listaObjetos[9].sentencia := '(estado_repro = :estado_reproductivo)';

// 10 -- Filtro por gdr
  listaObjetos[10].combo := DBLCBAGdr;
  listaObjetos[10].sentencia := '(gdr = :gdr)';

// 11 -- Filtro por rodeo
  listaObjetos[11].combo := DBLCBARodeo;
  listaObjetos[11].sentencia := '(rodeo = :rodeo)';

// 12 -- Filtro por potrero
  listaObjetos[12].combo := DBLCBAPotrero;
  listaObjetos[12].sentencia := '(potrero = :potrero)';

// 13 -- Filtro por años
  listaObjetos[13].combo := nil;
  listaObjetos[13].sentencia := '(edad BETWEEN :valedad1 and :valedad2)';

// 14 -- Filtro por peso
  listaObjetos[14].combo := nil;
  listaObjetos[14].sentencia := '(peso BETWEEN :valpeso1 and :valpeso2)';

// 15 -- Filtro por frame
  listaObjetos[15].combo := nil;
  listaObjetos[15].sentencia := '(frame BETWEEN :valframe1 and :valframe2)';

// 16 -- Filtro por estado de parición
  listaObjetos[16].combo := DBLCBAEstadoParicion;
  listaObjetos[16].sentencia := '(estado_lactacion = :estadolactacion) and (categoria <> 4)';

end;

// metodo generico para reconfigurar la consulta
procedure TFExpDeps.CheckClick(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  inherited;
  cartel:= TCartel.getInstance();
  msje:= 'Recuperando Animales ...';
  cartel.abrircartel(msje);         

  case TCheckBox(Sender).Tag of
    1, 2, 3 :
    begin
      // para los check que son solos
      checkSolos(TCheckBox(Sender));
    end;
    4, 5, 6, 7, 8, 9, 10, 11, 12,16 :
    begin
      // para los check que trabajan con combos (TERMINADO SUJETO A MODIFICACIONES)
      checkCombos(TCheckBox(Sender));
    end;
    13, 14, 15 :
    begin
      // para los check que habilitan los edits
      checkEdits(TCheckBox(Sender));
    end;
  end;

  if (TCheckBox(Sender).Checked = true) then
    if (TCheckBox(Sender).Tag = 13) then
       EAAniosDesde.SetFocus
     else
      if (TCheckBox(Sender).Tag = 14) then
        EAPesoDesde.SetFocus
       else
        if (TCheckBox(Sender).Tag = 15) then
           EAFrameDesde.SetFocus;

  if (CBSexo.Checked) then
   begin
    if (DBLCBASexo.KeyValue = 1) then
      begin
        CBEstadoParicion.Checked:= false;
        CBEstadoParicion.Enabled:= false;
      end
     else
      if (DBLCBASexo.KeyValue = 2) then
        CBEstadoParicion.Enabled:= true;
    end
   else
       CBEstadoParicion.Enabled:= true;

  cartel.cerrarcartel();
  cartel.FreeInstance();

end;

// manejos los checks con combo asociados
procedure TFExpDeps.checkCombos(check: TCheckBox);
begin
  if not(listaObjetos[check.Tag].combo.ListSource.DataSet.IsEmpty) then
    begin
      listaObjetos[check.Tag].combo.Enabled := check.Checked;
      listaObjetos[check.Tag].combo.KeyValue := 1;
      // guardo el valor de los parametros porque cuando cambio la consulta lo pierdo
      GuardarParametros;
      if (check.Checked) then
        begin
          AgregarAconsulta(listaObjetos[check.Tag].sentencia);
          ComboChange(listaObjetos[check.Tag].combo, true);
        end
      else
        begin
          SacarDeConsulta(listaObjetos[check.Tag].sentencia);
          ComboChange(listaObjetos[check.Tag].combo, false);
          listaObjetos[check.Tag].combo.KeyValue := -1;
        end;
      CargarParametros;
    end
  else
    check.Checked := false;

end;

// manejos los checks con edit asociados
procedure TFExpDeps.checkEdits(check: TCheckBox);
begin
  GuardarParametros;
  if (check.Checked) then
    begin
      AgregarAconsulta(listaObjetos[check.Tag].sentencia);
      case check.Tag of
        13 :  begin // años
                EditChange(EAAniosDesde);
              end;
        14 :  begin // peso
                EditChange(EAPesoDesde);
              end;
        15 :  begin // frame
                EditChange(EAFrameHasta);
              end;
      end;
    end
  else
    begin
      SacarDeConsulta(listaObjetos[check.Tag].sentencia);
      BorrarDeParametros(check.Tag);
    end;
  case check.Tag of
    13 :  begin // años
            EAAniosDesde.Enabled := check.Checked;
            EAAniosHasta.Enabled := check.Checked;
          end;
    14 :  begin // peso
            EAPesoDesde.Enabled := check.Checked;
            EAPesoHasta.Enabled := check.Checked;
          end;
    15 :  begin // frame
            EAFrameDesde.Enabled := check.Checked;
            EAFrameHasta.Enabled := check.Checked;
          end;
  end;

  CargarParametros;
end;

// manejos los checks que no tienen nada asociado
procedure TFExpDeps.checkSolos(check: TCheckBox);
var pos : integer;
begin
  GuardarParametros;
  if (check.Tag = 1) then
    begin
      if (check.Checked) then
        begin
          //SacarDeConsulta('(activo = ''N'')');
          AgregarAconsulta(listaObjetos[check.Tag].sentencia)
        end
      else
        begin
          SacarDeConsulta(listaObjetos[check.Tag].sentencia);
          //AgregarAconsulta('(activo = ''N'')');
        end;
    end
  else
    if (check.Tag = 2) then
      begin
        if (check.Checked) then
          AgregarAconsulta(listaObjetos[check.Tag].sentencia)
        else
          SacarDeConsulta(listaObjetos[check.Tag].sentencia);
      end
    else
      begin
        if (existeEnParametros('con_evento',pos)) then
          if (check.Checked) then
            parametros[pos].valor:= 'S'
          else
            parametros[pos].valor:= 'N';
        BDBGAnimales.Columns.Items[6].Visible := check.Checked;
      end;
  CargarParametros;
end;

// me fijo si esta en la consulta la sentencia que tengo que agregar
procedure TFExpDeps.AgregarAconsulta(sentencia: AnsiString);
Var aux : ansiString;
begin
//  if (AnsiPos(sentencia,IBQAnimales.SQL.GetText) = 0) then // no esta
  if (AnsiPos(sentencia,consulta) = 0) then // no esta
    begin
      IBQAnimales.Close;
//      if (AnsiPos('where',IBQAnimales.SQL.GetText) = 0) then // no tiene where
      if (AnsiPos('where',consulta) = 0) then // no tiene where
        begin
          //aux := StringReplace(IBQAnimales.SQL.GetText,#$D#$A, '',[rfReplaceAll])+ ' where '+sentencia;
          consulta := StringReplace(consulta,#$D#$A, '',[rfReplaceAll])+ ' where '+sentencia;
          //IBQAnimales.SQL.Clear;
          //IBQAnimales.SQL.Add(aux);
        end
      else
        begin
          //aux := StringReplace(IBQAnimales.SQL.GetText,#$D#$A, '',[rfReplaceAll])+' and '+sentencia;
          consulta := StringReplace(consulta,#$D#$A, '',[rfReplaceAll])+ ' and '+sentencia;
          //IBQAnimales.SQL.Clear;
          //IBQAnimales.SQL.Add(aux);
        end;
//      IBQAnimales.Open;
    end;
end;

// saca la sentencia que viene como parametro de la consulta de los animales
procedure TFExpDeps.SacarDeConsulta(sentencia: Ansistring);
begin
  //if (AnsiPos(' and '+sentencia,IBQAnimales.SQL.GetText) = 0) then  // no esta con and
  if (AnsiPos(' and '+sentencia,consulta) = 0) then  // no esta con and
    begin
//      if (AnsiPos(' where '+sentencia+' and ',IBQAnimales.SQL.GetText) <> 0) then // si esta con where /// PROBLEMA
      if (AnsiPos(' where '+sentencia+' and ',consulta) <> 0) then // si esta con where /// PROBLEMA
        begin
          //IBQAnimales.Close;
          //IBQAnimales.SQL.Text:= StringReplace(IBQAnimales.SQL.GetText,sentencia+' and ', '',[rfReplaceAll]);
          consulta := StringReplace(consulta,sentencia+' and ', '',[rfReplaceAll]);
        end
      else
//        if (AnsiPos(' where '+sentencia,IBQAnimales.SQL.GetText) <> 0) then // si esta con where
        if (AnsiPos(' where '+sentencia,consulta) <> 0) then // si esta con where
          begin
            //IBQAnimales.Close;
            //IBQAnimales.SQL.Text:= StringReplace(IBQAnimales.SQL.GetText,' where '+sentencia, '',[rfReplaceAll]);
            consulta := StringReplace(consulta,' where '+sentencia, '',[rfReplaceAll]);
          end
    end
  else
    begin  // saco stringreplace
      //IBQAnimales.Close;
      //IBQAnimales.SQL.Text:= StringReplace(IBQAnimales.SQL.GetText,' and '+sentencia, '',[rfReplaceAll]);
      consulta := StringReplace(consulta,' and '+sentencia, '',[rfReplaceAll]);
    end;
//  IBQAnimales.Open;
end;

// evento que produce cambios en un combo
procedure TFExpDeps.ComboKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not(TDBLookupComboBoxAuto(Sender).ListVisible) then
    ComboCloseUp(Sender);
end;

// lleno los parametros de la consulta que corresponden a combos
procedure TFExpDeps.ComboChange(Combo: TDBLookupComboBoxAuto; Poner : boolean);
var pos : integer;
    aca : integer;
begin
  if (combo.KeyValue <> null) then
    case Combo.Tag of
      16 : begin  // sexo
             if not(existeEnParametros('sexo',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='sexo';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';

           end;
      17 : begin  // raza
             if not(existeEnParametros('raza',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='raza';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      18 : begin  // categoria
             if not(existeEnParametros('categoria',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='categoria';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      19 : begin  // condicion corporal
             if not(existeEnParametros('condicion_corporal',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='condicion_corporal';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      20 : begin  // cronologia dentaria
             if not(existeEnParametros('cronologia_dentaria',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='cronologia_dentaria';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      21 : begin  // estado reproductivo
             if not(existeEnParametros('estado_reproductivo',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='estado_reproductivo';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      22 : begin  // gdr
             if not(existeEnParametros('gdr',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='gdr';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      23 : begin  // rodeo
             if not(existeEnParametros('rodeo',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='rodeo';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      24 : begin  // potrero
             if not(existeEnParametros('potrero',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='potrero';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      40 : begin  // estadolactacion
             if not(existeEnParametros('estadolactacion',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='estadolactacion';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
    end;
end;

// anulo la posibilidad de accionar una tecla dentro de un combo
procedure TFExpDeps.ComboKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key:=#0;
end;

procedure TFExpDeps.ConfigurarPorRaza;
var
  i : Integer;
begin
  case RGRaza.ItemIndex of
    0 : begin
          RGTipoPlanilla.Items.Clear;
          RGTipoPlanilla.Items.Add('Nacimientos y Destetes');
          RGTipoPlanilla.Items.Add('PostDestete');
          RGTipoPlanilla.Items.Add('Caracteristicas Carniceras');
        end;
    1 : begin
          RGTipoPlanilla.Items.Clear;
          RGTipoPlanilla.Items.Add('Nacimientos');
          RGTipoPlanilla.Items.Add('Destete');
          RGTipoPlanilla.Items.Add('PostDestete');
        end;
    2 : begin
          RGTipoPlanilla.Items.Clear;
          RGTipoPlanilla.Items.Add('Nacimientos');
          RGTipoPlanilla.Items.Add('Destete');
          RGTipoPlanilla.Items.Add('PostDestete');
        end;
  end;
  RGTipoPlanilla.ItemIndex := 0;
end;

// evento de cambio de un combo
procedure TFExpDeps.ComboCloseUp(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Recuperando Animales ...';
  cartel.abrircartel(msje);
  inherited;
  if (DBLCBASexo.KeyValue = 1) then
    begin
      CBEstadoParicion.Checked:= false;
      CBEstadoParicion.Enabled:= false;
    end
   else
    if (DBLCBASexo.KeyValue = 2) then
      CBEstadoParicion.Enabled:= true;
  ComboChange(TDBLookupComboBoxAuto(Sender), true);
  CargarParametros;
  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

// guardo los parametros
procedure TFExpDeps.GuardarParametros;
var cont : integer;
begin
  cont := 0;
  SetLength(parametros,IBQAnimales.Params.Count);
  while (cont < IBQAnimales.Params.Count) do
    begin
{      if (IBQAnimales.Params.Items[cont].Value <> Unassigned) then
        begin}
          parametros[cont].nombre := IBQAnimales.Params.Items[cont].Name;
          parametros[cont].valor := IBQAnimales.Params.Items[cont].Value;
 //       end;
      inc(cont);
    end;
end;

// cuando seteo los parametros recupero lo que guarde antes
procedure TFExpDeps.CargarParametros;
var cont : integer;
begin
  IBQAnimales.Close;
  cont := 0;
  while (cont < Length(parametros)) do
    begin
      if (existeEnParams(parametros[cont].nombre)and (parametros[cont].valor <> '-1')) then
        IBQAnimales.ParamByName(parametros[cont].nombre).Value := parametros[cont].valor;
      inc(cont);    
    end;
    
//  IBQAnimales.Open;
end;

// me fijo si existe el parametro al cual le asigno el valor
function TFExpDeps.existeEnParams(nombre: string): boolean;
var cont : integer;
begin
  result := false;
  cont := 0;
  while ((cont < IBQAnimales.Params.Count)and not(result)) do
    begin
      if (IBQAnimales.Params.Items[cont].Name = nombre) then
          Result := true;
      inc(cont);
    end;
end;

// si existe el parametro en el arreglo dinamico 'PARAMETROS' retorno la posicion
function TFExpDeps.existeEnParametros(nombre: string; var aca: integer): boolean;
var cont : integer;
begin
  result := false;
  cont := 0;
  aca := 0;
  while ((cont < Length(parametros))and not(result)) do
    begin
      if (parametros[cont].nombre = nombre) then
        begin
          aca := cont;
          Result := true;
        end;
      inc(cont);
    end;
end;

// metodo generico para todos los edits para el agregado de los parametros 
procedure TFExpDeps.EditChange(Sender: TObject);
var aca : integer;
    pos : integer;
    valor : integer;
begin
  inherited;
             
  case TEditAuto(Sender).Tag of
    25, 26: begin  // los dos de años
              if not(existeEnParametros('valedad1',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valedad1';
              if (TryStrToInt(EAAniosDesde.Text,valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El año "desde" no es válido');
                  EAAniosDesde.Text := IntToStr(val1Edad);
                end;

              if not(existeEnParametros('valedad2',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valedad2';
              if (TryStrToInt(EAAniosHasta.Text, valor)) then
                parametros[pos].valor:= valor-1
              else
                begin
                  MostrarMensaje(tmError, 'El año "hasta" no es válido');
                  EAAniosHasta.Text := IntToStr(val2Edad);
                end;
            end;
    27, 28: begin  // los dos de peso
              RecuperarPesoMinMax;
              if not(existeEnParametros('valpeso1',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valpeso1';
              if (TryStrToInt(EAPesoDesde.Text, valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El peso "desde" no es válido');
                  EAPesoDesde.Text := IntToStr(val1peso);
                end;

              if not(existeEnParametros('valpeso2',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valpeso2';
              if (TryStrToInt(EAPesoHasta.Text, valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El peso "hasta" no es válido');
                  EAPesoHasta.Text := IntToStr(val2peso);
                end;
            end;
    29, 30: begin  // los dos de frame
              RecuperarFrameMinMax;
              if not(existeEnParametros('valframe1',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valframe1';
              if (TryStrToInt(EAFrameDesde.Text, valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El frame "desde" no es válido');
                  EAFrameDesde.Text := IntToStr(val1frame);
                end;

              if not(existeEnParametros('valframe2',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valframe2';
              if (TryStrToInt(EAFrameHasta.Text, valor)) then
                parametros[pos].valor:= valor
              else
                begin
                  MostrarMensaje(tmError, 'El frame "hasta" no es válido');
                  EAFrameHasta.Text := IntToStr(val2frame);
                end;
            end;
  end;
  CargarParametros;
//  Change(Sender);
end;

procedure TFExpDeps.BorrarDeParametros(tag: integer);
var pos:integer;
begin
  case tag of
    25, 26: begin
              if (existeEnParametros('valedad1',pos) and existeEnParametros('valedad2',pos) ) then
                begin
                  parametros[pos].valor:= '-1';
                  parametros[pos].valor:= '-1';
                end;
            end;
    27, 28: begin
              if (existeEnParametros('valpeso1',pos) and existeEnParametros('valpeso2',pos)) then
                begin
                  parametros[pos].valor:= '-1';
                  parametros[pos].valor:= '-1';
                end;
            end;
    29, 30: begin
              if (existeEnParametros('valframe1',pos) and existeEnParametros('valframe2',pos)) then
                begin
                  parametros[pos].valor:= '-1';
                  parametros[pos].valor:= '-1';
                end;
            end;
  end;
end;

// saco todos los checks
procedure TFExpDeps.limpiarChecks;
begin
  CBSexo.Checked := false;
  CBRaza.Checked := false;
  CBCategoria.Checked := false;
  CBCondCorp.Checked := false;
  CBCronoDentaria.Checked := false;
  CBEstadoRepro.Checked := false;
  CBGdr.Checked := false;
  CBRodeo.Checked := false;
  CBPotrero.Checked := false;
  CBAnios.Checked := false;
  CBPeso.Checked := false;
  CBFrame.Checked := false;
  CBEstadoParicion.Checked := false;
end;

procedure TFExpDeps.habilitarLabel(cond: boolean);
begin
  CBSexo.Enabled := cond;
  CBRaza.Enabled := cond;
  CBCategoria.Enabled := cond;
  CBCondCorp.Enabled := cond;
  CBCronoDentaria.Enabled := cond;
  CBEstadoRepro.Enabled := cond;
  CBGdr.Enabled := cond;
  CBRodeo.Enabled := cond;
  CBPotrero.Enabled := cond;
  CBAnios.Enabled := cond;
  CBPeso.Enabled := cond;
  CBFrame.Enabled := cond;
  CBEstadoParicion.Enabled := cond;
  LDesde1.Enabled := cond;
  LDesde2.Enabled := cond;
  LDesde3.Enabled := cond;
  Lhasta1.Enabled := cond;
  Lhasta2.Enabled := cond;
  Lhasta3.Enabled := cond;
  CBAnimalesActivos.Enabled:= cond;
  CBRechazados.Enabled:= cond;
end;


procedure TFExpDeps.AVerFichaExecute(Sender: TObject);
var rpaux: String;
begin
  inherited;
  rpaux:= IBQAnimales.fieldByName('rp').AsString;

  {IBQBuscarIdAnimal.Close;
  IBQBuscarIdAnimal.ParamByName('rp').AsString := IBQAnimales.fieldByName('rp').AsString;
  IBQBuscarIdAnimal.Open;}

  if (FREPFichaAnimal = nil) then
    Application.CreateForm(TFREPFichaAnimal, FREPFichaAnimal);

  FREPFichaAnimal.animal := IBQRecuperarAnimales.Lookup('rp',rpaux,'animal'); //IBQBuscarIdAnimal.FieldValues['id_animal']; //IBQAnimales.fieldByName('animal').AsInteger;
  FREPFichaAnimal.ShowModal;

  IBQAnimales.Close;
  IBQAnimales.Open;
  IBQAnimales.Locate('rp',rpaux,[loPartialKey]);
end;

procedure TFExpDeps.Change(Sender: TObject);
var aux : integer;
begin
  inherited;
  case TeditAuto(Sender).Tag of
    25 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                if (aux < val1Edad) or (aux > val2edad) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'La edad se encuentra fuera de los límite válidos');
                    TeditAuto(Sender).Text := IntToStr(val1Edad);
                    TeditAuto(Sender).SetFocus;
                  end;
              end
           else
             begin
               MostrarMensaje(tmError, 'El año "desde" no es válido');
               TeditAuto(Sender).Text := IntToStr(val1Edad);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    26 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                if (aux < val1Edad) or (aux > val2edad) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'La edad se encuentra fuera de los límites válidos');
                    TeditAuto(Sender).Text := IntToStr(val2Edad);
                    TeditAuto(Sender).SetFocus;
                  end;
              end
           else
             begin
               MostrarMensaje(tmError, 'El año "hasta" no es válido');
               TeditAuto(Sender).Text := IntToStr(val2Edad);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    27 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                {if (aux < val1Peso) or (aux > val2Peso) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'El peso se encuentra fuera de los limites válidos');
                    TeditAuto(Sender).Text := IntToStr(val1Peso);
                    TeditAuto(Sender).SetFocus;
                  end;  }
              end
           else
             begin
               MostrarMensaje(tmError, 'El peso "desde" no es válido');
               TeditAuto(Sender).Text := IntToStr(val1Peso);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    28 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                {if (aux < val1Peso) or (aux > val2Peso) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'El peso se encuentra fuera de los limites válidos');
                    TeditAuto(Sender).Text := IntToStr(val2Peso);
                    TeditAuto(Sender).SetFocus;
                  end; }
              end
           else
             begin
               MostrarMensaje(tmError, 'El peso "hasta" no es válido');
               TeditAuto(Sender).Text := IntToStr(val2Peso);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    29 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                if (aux < val1frame) or (aux > val2frame) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'El frame se encuentra fuera de los limites válidos');
                    TeditAuto(Sender).Text := IntToStr(val1Frame);
                    TeditAuto(Sender).SetFocus;
                  end;
              end
           else
             begin
               MostrarMensaje(tmError, 'El frame "desde" no es válido');
               TeditAuto(Sender).Text := IntToStr(val1Frame);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    30 : begin
           if (TryStrToInt(TeditAuto(Sender).Text, aux)) then
              begin
                if (aux < val1frame) or (aux > val2frame) then
                  begin
                    MostrarMensaje(tmAdvertencia, 'El frame se encuentra fuera de los limites válidos');
                    TeditAuto(Sender).Text := IntToStr(val2Frame);
                    TeditAuto(Sender).SetFocus;
                  end;
              end
           else
             begin
               MostrarMensaje(tmError, 'El frame "hasta" no es válido');
               TeditAuto(Sender).Text := IntToStr(val2Frame);
               TeditAuto(Sender).SetFocus;
             end;
         end;
  end;
end;

procedure TFExpDeps.KeyPress(Sender: TObject; var Key: Char);
begin
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFExpDeps.IBQAnimalesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  BDBGAnimales.DataSource:= nil;
  IBQAnimales.Last;
  IBQAnimales.First;  
  // saque el thread porque daba error en un cliente y puse lo siguiente y comente terminarThread
  BDBGAnimales.DataSource:= DSAnimales;
  //LCantAnimales.Caption := IntToStr(IBQAnimales.RecordCount);
  GBSeleccionAnimal.Caption := Traducir('Selección de animal [')+IntToStr(IBQAnimales.RecordCount)+']';
  ACReportPrint.Enabled := not(IBQAnimales.IsEmpty);
  AVerFicha.Enabled := not(IBQAnimales.IsEmpty);
  AImprimirListado.Enabled := not(IBQAnimales.IsEmpty);
  AEliminarAnimal.Enabled := not(IBQAnimales.IsEmpty) and (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0);
  BBXls.Enabled:= not(IBQAnimales.IsEmpty);
end;

procedure TFExpDeps.BDBGAnimalesDblClick(Sender: TObject);
begin
  inherited;
  if(not (IBQAnimales.IsEmpty) )then
    AVerFichaExecute(Sender);
end;

procedure TFExpDeps.IBQAnimalesAfterClose(DataSet: TDataSet);
begin
  inherited;
  // le saco el order by
  IBQAnimales.SQL.Text:= StringReplace(IBQAnimales.SQL.GetText,' order by rp','',[rfReplaceAll]);
  //consulta := StringReplace(IBQAnimales.SQL.GetText,' order by rp','',[rfReplaceAll]);
end;

procedure TFExpDeps.IBQAnimalesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // agrego el order by
  IBQAnimales.SQL.Add(' order by rp');
//  consulta := consulta + 'order by rp';
end;

procedure TFExpDeps.FormShow(Sender: TObject);
begin
  inherited;

  self.BringToFront;

  self.WindowState := wsMaximized;

  DBLCBARaza.KeyValue := 0;
  habilitarLabel(false);
  CBEstadoParicion.Enabled:= false;
end;

procedure TFExpDeps.BDBGAnimalesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   BDBGAnimalesDblClick(Sender);
end;

procedure TFExpDeps.EAAniosDesdeChange(Sender: TObject);
begin
  inherited;
   if (EAAniosDesde.Text <> '') and (EAAniosHasta.Text <> '') then
     begin
       EditChange(Sender);
       Change(Sender);
     end;
end;

procedure TFExpDeps.EAPesoDesdeChange(Sender: TObject);
begin
  inherited;
   if (EAPesoDesde.Text <> '') and (EAPesoHasta.Text <> '') then
     begin
       EditChange(Sender);
       Change(Sender);
     end;
end;

procedure TFExpDeps.EAFrameDesdeChange(Sender: TObject);
begin
  inherited;
   if (EAFrameDesde.Text <> '') and (EAFrameHasta.Text <> '') then
     begin
       EditChange(Sender);
       Change(Sender);
     end;
end;

procedure TFExpDeps.EARPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key =#13) then
    begin
      EARPChange(nil);
      Key:= #0;      
    end;
end;

procedure TFExpDeps.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  BorrarAuxiliares;
end;

procedure TFExpDeps.AbrirEventoIndividual(Eve: TFEveSimple);
begin
  Eve.IDAnimal := IBQAnimales.fieldbyname('ANIMAL').AsInteger;
  Eve.IDRP := IBQAnimales.fieldbyname('RP').AsString;
  Eve.ConManga := false;
  Eve.ModoEve := meIndividual;
  Eve.ShowModal;
  Eve.Destroy;
end;

procedure TFExpDeps.RGTipoPlanillaClick(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin

  inherited;

  RGBusqueda.ItemIndex := 0;
  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;

  JvComplejos.Collapsed := true;
  RGBusqueda.ItemIndex := 0;
  consulta := 'select * from aux_datos_deps';
  GuardarParametros;
  CargarParametros;
end;

procedure TFExpDeps.closeUpFechas(Sender: TObject);
begin
  if (TDateTimePickerAuto(Sender).Name = 'DTPADesde') then
    begin
      Desde := DTPADesde.Date;

      Hasta := DTPAHasta.Date;
      if (DTPADesde.Date > DTPAHasta.Date) then
        begin
          DTPAHasta.Date:= Desde;
          Hasta := DTPAHasta.Date;
        end;
    end
   else
    if (TDateTimePickerAuto(Sender).Name = 'DTPAHasta') then
      begin
        Hasta := DTPAHasta.Date;

        Desde := DTPADesde.Date;
        if (DTPADesde.Date > DTPAHasta.Date) then
         begin
          DTPAHasta.Date:= Desde;
          Hasta := DTPAHasta.Date;
         end;

      end;
  RGTipoPlanillaClick(nil);
end;
procedure TFExpDeps.DTPAFechasKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    closeUpFechas(Sender);
end;

procedure TFExpDeps.ArmarExcel;
var column: TxlColumn;
begin
  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQAnimales;
  case RGRaza.ItemIndex of
    0 : begin
          case RGTipoPlanilla.ItemIndex of
            0 : begin
                  DTXLS.Title.Text:= 'PLANILLA DE NACIMIENTOS Y DESTETE';
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP','RP CRIA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NOMTIPOSEXO','SEXO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NOMSEXO','MELL',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_NACIMIENTO','F. DE NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT','CAT.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'COLOR','C',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MUERTO','CM',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_NAC','PN',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MANEJO_0','M0',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP_MADRE_BIOLOGICA','RP MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'HBA_MADRE_BIOLOGICA','HBA MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT_MBI','CAT',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'COLOR_MADRE_BIOLOGICA','C MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NACIMIENTO_MADRE_BIOLOGICA','FECHA DE NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'TIPO_SERVICIO','TS',True);  //FALTA CALCULARLO EN EL SP
                  AgregarColumnaExcel(column,taLeftJustify,0,'TIPO_PARTO','TP.',True); //FALTA CALCULARLO EN EL SP
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP_PADRE','RP PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'HBA_PADRE','HBA PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT_P','CAT',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'COLOR_PADRE','C PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NACIMIENTO_PADRE','AÑO NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP_MADRE_RECEPTORA','RP RECEPTORA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RAZAMADRENOMBRERECEPTORA','RAZA RECEPTORA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NACIMIENTO_MADRE_RECEPTORA','FECHA DE NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_PESO_DEST','FECHA DE DEST.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_DEST','PESO DESTETE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MANEJO_1','M1',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','OBSERVACIONES',True);
                end;
            2 : begin
                  DTXLS.Title.Text:= 'REGISTRO DE CARACTERISTICAS CARNICERAS';
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP','RP',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_NACIMIENTO','F. DE NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'ESTAB_NAC','CABAÑA/ESTAB. NACIMIENTO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NOMSEXO','SEXO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP_PADRE','RP PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'HBA_PADRE','HBA PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT_P','CAT',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP_MADRE_BIOLOGICA','RP MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'HBA_MADRE_BIOLOGICA','HBA MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT_MBI','CAT',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'ESTAB_ACT','CABAÑA/ESTABL. DE TERMINAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MANEJO_0','COD. DE MANEJO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_PESO_NAC','FECHA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_NAC','PESO (kg.)',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'ALZADA','ALTURA (cm.)',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CIRC_ESC','C.E. (cm.)',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_PESO_NAC','FECHA DE MEDICION',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'AOB','AREA DE OJO BIFE (cm.)',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'GI','GRASA INTRAMUSCULAR (%)',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'GD','GRASA DORSAL (mm.)',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'GC','GRASA CADERA (mm.)',True);
                end;
            1 : begin
                  DTXLS.Title.Text:= 'PLANILLA POSDESTETE';
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP','RP',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NOMSEXO','SEXO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_NACIMIENTO','F. DE NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT','CAT.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'HBA','HBA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_PESO_ANIO','FECHA PESO AÑO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_ANIO','PESO AÑO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MANEJO_2','M2',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_PESO_ADULTO','FECHA PESO 18 MESES',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_ADULTO','PESO 18 MESES',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MANEJO_3','M3',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_MED_CIRC','FECHA MEDIDA CIRC. ESCROTAL',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CIRC_ESC','C.E.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_MED_ALZADA','FECHA MEDIDA ALTURA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'ALZADA','ALT.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','OBSERVACIONES',True);
                end;
          end;
        end;
    1 : begin
          case RGTipoPlanilla.ItemIndex of
            0 : begin
                  DTXLS.Title.Text:= 'PLANILLA DE NACIMIENTOS';
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP','RP CRIA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_NACIMIENTO','FECHA NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NOMTIPOSEXO','SEXO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT','REGISTRO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'COLOR','COLOR',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','NOMBRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP_MADRE_BIOLOGICA','RP MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','Nro. CRIADOR MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT_MBI','REGISTRO MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PC_MADRE_BIOLOGICA','AAB MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'HBA_MADRE_BIOLOGICA','HBA MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP_PADRE','RP PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','Nro. CRIADOR PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','APODO PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PC_PADRE','AAB PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'HBA_PADRE','HBA PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','OBSERVACIONES',True);
                end;
            1 : begin
                  DTXLS.Title.Text:= 'PLANILLA DE DESTETE';
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP','RP CRIA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_NACIMIENTO','FECHA NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NOMTIPOSEXO','SEXO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT','REGISTRO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'COLOR','COLOR',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_DEST','PESO DESTETE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_PESO_DEST','FECHA DE DEST.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MANEJO_1','M',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','OBSERVACIONES',True);
                end;
            2 : begin
                  DTXLS.Title.Text:= 'PLANILLA DE POSTDESTETE';
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP','RP CRIA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_NACIMIENTO','FECHA NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NOMSEXO','SEXO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT','REGISTRO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'COLOR','COLOR',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_PESO_ADULTO','FECHA PESO 18 MESES',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_ADULTO','PESO 18 MESES',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MANEJO_3','M',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_MED_CIRC','FECHA MEDIDA CIRC. ESCROTAL',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CIRC_ESC','C.E.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','OBSERVACIONES',True);
                end;
          end;
        end;
    2 : begin
          case RGTipoPlanilla.ItemIndex of
            0 : begin
                  DTXLS.Title.Text:= 'PLANILLA DE NACIMIENTOS';
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP','RP CRIA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_NACIMIENTO','FECHA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NOMTIPOSEXO','SEXO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'TIPO_SERVICIO','TS',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'TIPO_PARTO','TP.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MUERTO','CM',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_NAC','PESO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP_MADRE_BIOLOGICA','RP MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','Nro CRIADOR',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'HBA_MADRE_BIOLOGICA','HBA MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PC_MADRE_BIOLOGICA','ABA MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RA_MADRE_BIOLOGICA','UBB MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','RAZA MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT_MBI','REGISTRO MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','TIPO MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NACIMIENTO_MADRE_BIOLOGICA','EDAD MADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP_MADRE_RECEPTORA','RP RECEPTORA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RAZAMADRENOMBRERECEPTORA','RAZA RECEPTORA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','TIPO MADRE RECEPTORA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NACIMIENTO_MADRE_RECEPTORA','FECHA DE NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP_PADRE','RP PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','Nro CRIADOR',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','APODO PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','NOMBRE PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'HBA_PADRE','HBA PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PC_PADRE','ABA PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'RA_PADRE','UBB PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','RAZA PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','NOMBRE PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'SUBCAT_P','REGISTRO PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','TIPO PADRE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NACIMIENTO_PADRE','AÑO NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','OBSERVACIONES',True);
                end;
            1 : begin
                  DTXLS.Title.Text:= 'PLANILLA DE DESTETE';
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP','RP CRIA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_NACIMIENTO','FECHA NAC.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NOMTIPOSEXO','SEXO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_PESO_DEST','FECHA DE DEST.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_DEST','PESO DESTETE',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MANEJO_1','M',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','OBSERVACIONES',True);
                end;
            2 : begin
                  DTXLS.Title.Text:= 'PLANILLA DE POSTDESTETE';
                  AgregarColumnaExcel(column,taLeftJustify,0,'RP','RP CRIA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'HBA','HBA CRIA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PC','ABA CRIA',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'NOMSEXO','SEXO',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_PESO_ADULTO','FECHA PESO 18 MESES',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'PESO_ADULTO','PESO 18 MESES',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CODIGO_MANEJO_3','M',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'FECHA_MED_CIRC','FECHA MEDIDA CIRC. ESCROTAL',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'CIRC_ESC','C.E.',True);
                  AgregarColumnaExcel(column,taLeftJustify,0,'OBSERVACION','OBSERVACIONES',True);
                end;
          end;
        end;
    end;
end;


procedure TFExpDeps.AgregarColumnaExcel(var column: TxlColumn;
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

procedure TFExpDeps.RGRazaClick(Sender: TObject);
begin
  inherited;
  ConfigurarPorRaza;
end;

procedure TFExpDeps.ISalirClick(Sender: TObject);
begin
  inherited;

  Close;

end;

procedure TFExpDeps.IExcelClick(Sender: TObject);
var
  cartel : TCartel;
begin
  inherited;
  if SDXLS.Execute then
  begin
    cartel := TCartel.getInstance;
    cartel.abrircartel('Exportando datos a Excel...');
    ArmarExcel();
    DTXLS.SaveToFile(SDXLS.FileName);
    cartel.cerrarcartel;
    cartel.FreeInstance;
  end;
end;

procedure TFExpDeps.IImprimirClick(Sender: TObject);
var cont : integer;
    cartel: TCartel;
    msje: String;
    Rect: TRect;
    FREPHistorialAnimalPreview : TFREPHistorialAnimalPreview;
begin
  MostrarMensajeImpresion();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del listado de animales ...';
  cartel.abrircartel(msje);
  {Rect := BoundsRect;
  BusyStatus('Sistema ocupado, por favor espere...', @Rect);
  _Busy.Continue;}

  inherited;
  FREPHistorialAnimalPreview := TFREPHistorialAnimalPreview.Create(self);
  //Application.CreateForm(TFREPHistorialAnimalPreview, );
  FREPHistorialAnimalPreview.QRListadaAnimales.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText5.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText6.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText7.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText8.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText9.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText10.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  
  FREPHistorialAnimalPreview.IBQAuxDeps.Close;
  FREPHistorialAnimalPreview.IBQAuxDeps.Open;

  FREPHistorialAnimalPreview.QRLTotal.Caption := IntToStr(FREPHistorialAnimalPreview.IBQAuxDeps.RecordCount);

  {FREPHistorialAnimalPreview.IBQListadoAnimal.Close;
  FREPHistorialAnimalPreview.IBQListadoAnimal.SQL.Clear;
  FREPHistorialAnimalPreview.IBQListadoAnimal.SQL.Add(IBQAnimales.SQL.GetText);
  cont := 0;
  while (cont < IBQAnimales.Params.Count) do
    begin
      FREPHistorialAnimalPreview.IBQListadoAnimal.ParamByName(IBQAnimales.Params.Items[cont].Name).Value := IBQAnimales.Params.Items[cont].Value;
      inc(cont);
    end;
  FREPHistorialAnimalPreview.IBQListadoAnimal.Open;}


  cartel.cerrarcartel();
  cartel.FreeInstance();

  FREPHistorialAnimalPreview.ShowModal;
  FREPHistorialAnimalPreview.Destroy;
end;

procedure TFExpDeps.IVerFichaClick(Sender: TObject);
var rpaux: String;
begin
  inherited;

  if (not(IBQAnimales.IsEmpty)) then
  begin
    rpaux:= IBQAnimales.fieldByName('rp').AsString;

    {IBQBuscarIdAnimal.Close;
    IBQBuscarIdAnimal.ParamByName('rp').AsString := IBQAnimales.fieldByName('rp').AsString;
    IBQBuscarIdAnimal.Open;  }

    if (FREPFichaAnimal = nil) then
      Application.CreateForm(TFREPFichaAnimal, FREPFichaAnimal);

    FREPFichaAnimal.animal := IBQRecuperarAnimales.Lookup('rp',rpaux,'animal'); //IBQBuscarIdAnimal.FieldValues['id_animal']; //IBQRecuperarAnimales.FieldValues['animal'];  //IBQAnimales.fieldByName('animal').AsInteger;
    FREPFichaAnimal.ShowModal;

    IBQAnimales.Close;
    IBQAnimales.Open;

    IBQAnimales.Locate('rp',rpaux,[loPartialKey]);
  end
  else
    MostrarMensaje(tmError,'Usted no ha seleccionado ningun animal, o bien no existen animales en el listado.');
end;

procedure TFExpDeps.RecuperarPesoMinMax;
begin
  // recupero el minimo peso de un animal
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''BGPESANI1'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  val1peso := IBQAux.fieldbyname('valor').AsInteger;
  EAPesoDesde.Text := IntToStr(val1peso);

  // recupero el maximo peso de un animal
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''BGPESANI4'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  val2peso := IBQAux.fieldbyname('valor').AsInteger;
  EAPesoHasta.Text := IntToStr(val2peso);
end;

procedure TFExpDeps.RecuperarFrameMinMax;
begin
  // recupero el minimo frame de un animal
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''BGFRAME1'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  val1frame := IBQAux.fieldbyname('valor').AsInteger;
  EAframeDesde.Text := inttoStr(val1frame);

  // recupero el maximo frame de un animal
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''BGFRAME4'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  val2frame := IBQAux.fieldbyname('valor').AsInteger;
  EAframeHasta.Text := inttoStr(val2frame);

end;

procedure TFExpDeps.BorrarAuxiliares        ;
begin

  BDBGAnimales.Repaint;

  IBQAnimales.Close;
  IBQAnimales.UnPrepare;

  IBQBorrarAuxDatosDeps.Close;
  IBQBorrarAuxDatosDeps.Open;

  FPrincipal.IBTPrincipal.CommitRetaining;
end;

procedure TFExpDeps.BBVerAnimalesClick(Sender: TObject);
begin
  inherited;

  BorrarAuxiliares;

  case RGRaza.ItemIndex of
    0 : begin
          case RGTipoPlanilla.ItemIndex of
            0 : RecuperarDatosDeAnimalesNacDest(desde,hasta,RGRaza.ItemIndex);
            1 : RecuperarDatosDeAnimalesPostDest(desde,hasta,RGRaza.ItemIndex);
            2 : RecuperarDatosDeAnimalesCalidadCarne(desde,hasta,RGRaza.ItemIndex);
          end;
        end;
    1,2 : begin
            case RGTipoPlanilla.ItemIndex of
              0 : RecuperarDatosDeAnimalesNacDest(desde,hasta,RGRaza.ItemIndex);
              1 : RecuperarDatosDeAnimalesNacDest(desde,hasta,RGRaza.ItemIndex);
              2 : RecuperarDatosDeAnimalesPostDest(desde,hasta,RGRaza.ItemIndex);
            end;
          end;
  end;

  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add(consulta);
  CargarParametros;
  IBQAnimales.Open;
  

end;

end.
