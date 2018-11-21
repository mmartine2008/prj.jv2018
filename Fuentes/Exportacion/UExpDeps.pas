unit UExpDeps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBTable, Grids, DBGrids, StdCtrls, QRCtrls, QuickRpt, IBQuery, DBCtrls,
  Buttons, Mask, UREPFichaAnimal, EditAuto, UDBLookupComboBoxAuto, UBDBGrid,
  ImgList, IBStoredProc, DataExport, DataToXLS, WinXP, UEveSimple, UMensajeImpresora,
  JvExExtCtrls, JvExtComponent, JvRollOut, DateTimePickerAuto, DateUtils,
  JvExControls, JvLabel, JvGIF, PngImage, jpeg, Menus, PngImageList, StrUtils,
  JvImage;

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
    IBQRazaPredom: TIBQuery;
    IBQExisteRazaEst: TIBQuery;
    Label1: TLabel;
    CBxTipoRegistro: TComboBox;
    CBxRodeo: TComboBox;
    CBxRaza: TComboBox;
    CBxPotrero: TComboBox;
    CBxColor: TComboBox;
    CBxCategoria: TComboBox;
    CBxEstadoParicion: TComboBox;
    CBxCondicionCorporal: TComboBox;
    CBxCronologiaDentaria: TComboBox;
    CBxEstadoReproductivo: TComboBox;
    GBFrame: TGroupBox;
    LDesdeFrame: TLabel;
    LHastaFrame: TLabel;
    EHastaFrame: TEdit;
    EDesdeFrame: TEdit;
    GBPeso: TGroupBox;
    LDesdePeso: TLabel;
    LHastaPeso: TLabel;
    EHastaPeso: TEdit;
    EDesdePeso: TEdit;
    GBNacidosEntre: TGroupBox;
    LDesdeAnios: TLabel;
    LHastaAnios: TLabel;
    GBSeparadorHasta: TGroupBox;
    LSeparadorHasta: TLabel;
    GBSeparadorDesde: TGroupBox;
    LSeparadorDesde: TLabel;
    EHastaAnios: TEdit;
    EDesdeAnios: TEdit;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    EADesdeDia: TEdit;
    EADesdeMes: TEdit;
    EADesdeAnio: TEdit;
    EAHastaDia: TEdit;
    EAHastaMes: TEdit;
    EAHastaAnio: TEdit;
    IBQColor: TIBQuery;
    CBxSexo: TComboBox;
    DBLCBATipoRegistro: TDBLookupComboBoxAuto;
    CBTipoRegistro: TCheckBox;
    CBColor: TCheckBox;
    DBLCBAColor: TDBLookupComboBoxAuto;
    DSColor: TDataSource;
    IBQTiposRegistros: TIBQuery;
    DSTiposRegistros: TDataSource;
    CBxGDR: TComboBox;
    IAniosActivo: TImage;
    Label4: TLabel;
    Label5: TLabel;
    IPesoActivo: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    IAniosInactivo: TImage;
    IPesoInactivo: TImage;
    IFrameActivos: TImage;
    IFrameInactivos: TImage;
    IVerInactivosOn: TImage;
    Label10: TLabel;
    IVerInactivosOff: TImage;
    GroupBox1: TGroupBox;
    RBAngus: TRadioButton;
    RBBrangus: TRadioButton;
    RBBraford: TRadioButton;
    RBHereford: TRadioButton;
    ICambiarRazaPredom: TImage;
    LCambiarRazaPredom: TLabel;
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
    procedure Label1Click(Sender: TObject);
    procedure CBxRazaChange(Sender: TObject);
    procedure CBxRazaCloseUp(Sender: TObject);
    procedure CBxCategoriaChange(Sender: TObject);
    procedure CBxCategoriaCloseUp(Sender: TObject);
    procedure CBxRodeoChange(Sender: TObject);
    procedure CBxRodeoCloseUp(Sender: TObject);
    procedure CBxColorChange(Sender: TObject);
    procedure CBxColorCloseUp(Sender: TObject);
    procedure CBxTipoRegistroChange(Sender: TObject);
    procedure CBxTipoRegistroCloseUp(Sender: TObject);
    procedure CBxPotreroChange(Sender: TObject);
    procedure CBxPotreroCloseUp(Sender: TObject);
    procedure CBxCronologiaDentariaCloseUp(Sender: TObject);
    procedure CBxCronologiaDentariaChange(Sender: TObject);
    procedure CBxCondicionCorporalCloseUp(Sender: TObject);
    procedure CBxCondicionCorporalChange(Sender: TObject);
    procedure CBxEstadoReproductivoChange(Sender: TObject);
    procedure CBxEstadoReproductivoCloseUp(Sender: TObject);
    procedure CBxEstadoParicionCloseUp(Sender: TObject);
    procedure CBxEstadoParicionChange(Sender: TObject);
    procedure CBxSexoChange(Sender: TObject);
    procedure CBxSexoCloseUp(Sender: TObject);
    procedure CBxGDRChange(Sender: TObject);
    procedure CBxGDRCloseUp(Sender: TObject);
    procedure IAniosActivoClick(Sender: TObject);
    procedure IPesoActivoClick(Sender: TObject);
    procedure IFrameActivosClick(Sender: TObject);
    procedure IAniosInactivoClick(Sender: TObject);
    procedure IPesoInactivoClick(Sender: TObject);
    procedure IFrameInactivosClick(Sender: TObject);
    procedure IVerInactivosOnClick(Sender: TObject);
    procedure IVerInactivosOffClick(Sender: TObject);
    procedure JvComplejosClick(Sender: TObject);
    procedure RBAngusClick(Sender: TObject);
    procedure RBBrangusClick(Sender: TObject);
    procedure RBBrafordClick(Sender: TObject);
    procedure RBHerefordClick(Sender: TObject);
    procedure ICambiarRazaPredomClick(Sender: TObject);
  private
    listaObjetos : array[1..18] of TObjeto;
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

    procedure OrganizarVisualizacionGrilla(IndexRaza, IndexPlanilla : integer);
    procedure ConfiguracionRaza;

    procedure CargarCombos(ibq : TIBQuery; text : string; combo : TComboBox; param : string);
    procedure InicializarCombos;

//    procedure ChequearPrimeraFecha;
//    procedure ChequearSegundaFecha;


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
  primerIngreso, conWhere : boolean;
  DelGDR, DelSexo, DelEstPar, DelRaza, DelColor, DelCategoria, DelGrupo, DelPotrero, DelRodeo, DelTR, DelArPel, DelCalSem, DelCanPar, DelCapSer, DelConCor, DelCroDen, DelEstRep, DelExaCli, DelPre : boolean;
  fecha_D_OK, fecha_H_OK : boolean;
  cantDD, cantMD, cantAD, cantDH, cantMH, cantAH : integer;
  id_raza, id_categoria, id_rodeo, id_color, id_tiporegistro, id_potrero, id_cronodentaria, id_condcorp, id_estadorepro, id_capacidadservicio, id_tipo_registro : integer;


implementation

uses UPrincipal,uTiposGlobales, UREPHistorialAnimalPreview, UDMSoftvet, UMensajeHuella, UCartel,
     UEveEliminarAnimal, UTraduccion, UAbmEstablecimientos, USelectorRazasPredom;

{$R *.dfm}

// ACCION PARA SALIR
procedure TFExpDeps.RecuperarDatosDeAnimalesPostDest(desde : TDateTime; hasta : TDateTime; razaElegida: integer);
var i, ind, val, Edad, NEdad, cantidad : integer;
    cartel : TCartel;
    EdadCaption, consulta, consultaSQL, sql1, sql2, sql3, sql4, sql5, subcat: string;
    fecha : TDateTime;
begin

  i := 0;
  ind := 1;
  val := 0;

  consultaSQL := 'select ee.animal as animal, ta.id_rp as rp, ta.id_hba, cs.tipo as sexo, cts.id_tipo_sexo as nomtiposexo, cs.id_sexo as nomsexo, ta.raza as raza, cr.nombre as raza_nombre, ta.rodeo as rodeo, ta.categoria as categoria, ta.color, '+
           'cc.nombre as categoria_nombre, ta.cronologia_dentaria as crono_dent, ta.estado_reproductivo as est_repro, ta.fecha_nacimiento as fe_nac, ta.potrero as potrero, ta.activo as activo, ta.condicion_corporal as cond_corp, ta.gdr as gdr, '+
           'ta.rechazado as rechazado, ta.estado_lactacion as est_lact, ta.estado_actual as estado_actual, ta.madre_receptora_interna, cr.codigo, TA.SUBCATEGORIA as subcat, TA.ID_PC, TA.ID_RA from eve_eventos ee join '+
            'tab_animales ta on ee.animal = ta.id_animal join cod_sexos cs on (ta.sexo = cs.id_sexo) join cod_tipos_sexo cts on (cs.tipo = cts.id_tipo_sexo) JOIN cod_categorias cc on (ta.categoria = cc.id_categoria)'+
            'join cod_razas cr on (ta.raza = cr.id_raza) '+
            ' where ( ee.tipo = 2 ) and ee.fecha between :desde and :hasta '+
            ' and ee.establecimiento = ta.establecimiento and ta.establecimiento = :esta and activo = ''S''';

 // consultaSQL := sql1+sql2+sql3+sql4+sql5;
  IBQRecuperarAnimales.Close;
  IBQRecuperarAnimales.SQL.Clear;
  IBQRecuperarAnimales.SQL.Add(consultaSQL);

  IBQRecuperarAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRecuperarAnimales.ParamByName('hasta').AsDate := hasta;
  IBQRecuperarAnimales.ParamByName('desde').AsDate := desde;

//  IBQRecuperarAnimales.SQL.SaveToFile('c:\temp\QueryExpDep.sql');

  if (razaElegida = 0) then
      consulta := ' AND (TA.RAZA = 2 OR TA.RAZA = 3 OR TA.RAZA = 29)';

  if (razaElegida = 1) then
      consulta := ' AND (TA.RAZA = 12 OR TA.RAZA = 28 OR TA.RAZA = 30)';

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

      if (IBQAuxiliar.FieldValues['COLOR'] = 'N') then
          IBQInsertAuxAnimales.ParamByName('ID_COLOR').Value := 1
      else
          if (IBQAuxiliar.FieldValues['COLOR'] = 'C') then
              IBQInsertAuxAnimales.ParamByName('ID_COLOR').Value := 2
          else
              IBQInsertAuxAnimales.ParamByName('ID_COLOR').Value := 0;

      IBQInsertAuxAnimales.ParamByName('ID_SUBCAT').Value := IBQRecuperarAnimales.FieldValues['subcat'];

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
  sql5 := 'cod_categorias cc on (ta.categoria = cc.id_categoria) join cod_razas cr on (ta.raza = cr.id_raza) where ee.fecha between :desde and :hasta and ta.establecimiento = :esta and ECC.AOB IS NOT NULL AND EE.TIPO = 41';

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

      if (IBQAuxiliar.FieldValues['COLOR'] = 'N') then
          IBQInsertAuxAnimales.ParamByName('ID_COLOR').Value := 1
      else
          if (IBQAuxiliar.FieldValues['COLOR'] = 'C') then
              IBQInsertAuxAnimales.ParamByName('ID_COLOR').Value := 2
          else
              IBQInsertAuxAnimales.ParamByName('ID_COLOR').Value := 0;

      IBQInsertAuxAnimales.ParamByName('ID_SUBCAT').Value := IBQRecuperarAnimales.FieldValues['subcat'];

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
    EdadCaption, consulta, consultaSQL, sql1, sql2, sql3, sql4, sql5, subcat: string;
    fecha : TDateTime;
    cod_mell : integer;
begin

  i := 0;
  ind := 1;
  val := 0;
 // Condicion . Cuando es carga directa(2), el disparad es NULL en otro caso es un nacimiento (23)
  consultaSQL := 'select ee.animal as animal,ee.tipo, (case  when en.vivo is NULL then '+ '''S'''+'else en.vivo end) as vivo,'+
                'ta.id_rp as rp, ta.id_hba, cs.tipo as sexo, cts.id_tipo_sexo as nomtiposexo, '+
                 ' cs.id_sexo as nomsexo, ta.raza as raza, cr.nombre as raza_nombre, ta.rodeo as rodeo, '+
                 ' ta.categoria as categoria, '+
                 ' cc.nombre as categoria_nombre, ta.cronologia_dentaria as crono_dent, ta.estado_reproductivo as est_repro, ta.fecha_nacimiento as fe_nac, ta.potrero as potrero, ta.activo as activo, ta.condicion_corporal as cond_corp, ta.gdr as gdr, ta.color, '+
                 ' ta.rechazado as rechazado, ta.estado_lactacion as est_lact, ta.estado_actual as estado_actual, ta.madre_receptora_interna, cr.codigo, TA.SUBCATEGORIA as subcat, TA.ID_PC, TA.ID_RA '+
                 ' from eve_eventos ee '+
                 ' left join eve_nacimiento en on ee.id_evento = en.id_evento '+
                 ' join tab_animales ta on ee.animal = ta.id_animal join cod_sexos cs on (ta.sexo = cs.id_sexo) join cod_tipos_sexo cts on (cs.tipo = cts.id_tipo_sexo) JOIN cod_categorias cc on (ta.categoria = cc.id_categoria) '+
                 ' join cod_razas cr on (ta.raza = cr.id_raza) '+

                 ' where ( (ee.tipo = 2 and ee.disparador is NULL) or ee.tipo = 23) '+
                  ' and ee.fecha between :desde and :hasta ' +
                  ' and ta.establecimiento = :esta ';

//  consultaSQL := sql1+sql2+sql3+sql4+sql5;

  IBQRecuperarAnimales.Close;
  IBQRecuperarAnimales.SQL.Clear;
//  IBQRecuperarAnimales.SQL.Add(consultaSQL);



  consulta := '';

  if (razaElegida = 0) then
      consulta := ' AND (TA.RAZA = 2 OR TA.RAZA = 3 OR TA.RAZA = 29)';

  if (razaElegida = 1) then
      consulta := ' AND (TA.RAZA = 12 OR TA.RAZA = 28 OR TA.RAZA = 30)';

  if (razaElegida = 2) then
      consulta := ' AND (TA.RAZA = 11)';

  consultaSQL := consultaSQL + consulta;

  IBQRecuperarAnimales.SQL.Add(consultaSQL);

  IBQRecuperarAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRecuperarAnimales.ParamByName('hasta').AsDate := hasta;
  IBQRecuperarAnimales.ParamByName('desde').AsDate := desde;

  IBQRecuperarAnimales.Open;
  IBQRecuperarAnimales.Last;
  IBQRecuperarAnimales.First;


//  IBQRecuperarAnimales.sql.SaveToFile('c:\temp\expDep.sql');

  cantidadAnimales := IBQRecuperarAnimales.RecordCount;

  cartel:= TCartel.getInstance();
  cartel.abrirCartelProgressBar('Comienza la carga de animales.');

  val := (cantidadAnimales div 10);

  IBQAuxiliar.Close;
  IBQAuxiliar.DisableControls();
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
    IBQAuxiliar.ParamByName('int_color').value := IBQRecuperarAnimales.FieldValues['color'];

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

      if (IBQAuxiliar.FieldValues['COLOR'] = 'N') then
          IBQInsertAuxAnimales.ParamByName('ID_COLOR').Value := 1
      else
          if (IBQAuxiliar.FieldValues['COLOR'] = 'C') then
              IBQInsertAuxAnimales.ParamByName('ID_COLOR').Value := 2
          else
              IBQInsertAuxAnimales.ParamByName('ID_COLOR').Value := 0;

      IBQInsertAuxAnimales.ParamByName('ID_SUBCAT').Value := IBQRecuperarAnimales.FieldValues['subcat'];

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
  IBQAuxiliar.EnableControls();
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

  GBSeleccionAnimal.Caption := '  Presione Ver Animales para observar los datos  ';

  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;

  //JvComplejos.Collapsed := RGBusqueda.ItemIndex <> 2;
  inherited;
  case RGBusqueda.ItemIndex of
    0 : begin
          EARP.Enabled := false;
          GBComplejos.Enabled := false;
          limpiarChecks;
          habilitarLabel(false);
          JvComplejos.Collapsed := true;
        end;
    1 : begin
          EARP.Enabled := true;
          GBComplejos.Enabled := false;
          limpiarChecks;
          habilitarLabel(false);
          EARP.Clear;
          EARP.SetFocus;
          JvComplejos.Collapsed := true;
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
var sql : string;
begin
  inherited;

  if (not(IBQAnimales.IsEmpty) and (IBQAnimales.RecordCount > 0)) then
  begin
        sql := IBQAnimales.SQL.GetText;

        if (EARP.Text <> '') then
        begin
            IBQAnimales.Close;

            if not(conWhere) then
            begin
              IBQAnimales.SQL.Add(' where rp like :cadena');
              conWhere := true;
            end;
            IBQAnimales.ParamByName('cadena').AsString := '%'+EARP.Text+'%';

      {      if ( RGTipoPlanilla.ItemIndex <> 0 ) then
            begin
              //IBQAnimales.Close;
              IBQAnimales.ParamByName('establecimiento').AsInteger := Fprincipal.EstablecimientoActual;
              IBQAnimales.ParamByName('desde').AsDate := DTPADesde.Date;
              IBQAnimales.ParamByName('hasta').AsDate := DTPAHasta.Date;
              IBQAnimales.ParamByName('raza').AsInteger := RGRaza.ItemIndex;
            end;              }
            IBQAnimales.Open;
        end
        else
        begin
            IBQAnimales.Close;

            if (conWhere) then
            begin
              IBQAnimales.SQL.Text:= StringReplace(IBQAnimales.SQL.GetText,' where rp like :cadena', '',[rfReplaceAll]);
              conWhere := false;
            end;

       {     if ( RGTipoPlanilla.ItemIndex <> 0 ) then
            begin
              //IBQAnimales.Close;
              IBQAnimales.ParamByName('establecimiento').AsInteger := Fprincipal.EstablecimientoActual;
              IBQAnimales.ParamByName('desde').AsDate := DTPADesde.Date;
              IBQAnimales.ParamByName('hasta').AsDate := DTPAHasta.Date;
              IBQAnimales.ParamByName('raza').AsInteger := RGRaza.ItemIndex;
            end;                }
            IBQAnimales.Open;
        end;
  end;
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
//17 -- Filtro por Tipo de Registro
  listaObjetos[17].combo := DBLCBATipoRegistro;
  listaObjetos[17].sentencia := '(id_subcat = :subcategoria)';
//18 -- Filtro por Color
  listaObjetos[18].combo := DBLCBAColor;
  listaObjetos[18].sentencia := '(id_color = :color)';
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

  GBSeleccionAnimal.Caption := '  Presione Ver Animales para observar los datos  ';

  case TCheckBox(Sender).Tag of
    1, 2, 3 :
    begin
      // para los check que son solos
      checkSolos(TCheckBox(Sender));
    end;
    4, 5, 6, 7, 8, 9, 10, 11, 12,16, 17, 18 :
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
procedure TFExpDeps.checkSolos(check : TCheckBox);
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
      41 : begin  // tipo registro
             if not(existeEnParametros('subcategoria',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='subcategoria';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      42 : begin  // color
             if not(existeEnParametros('color',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='color';
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
  OrganizarVisualizacionGrilla(RGRaza.ItemIndex, RGTipoPlanilla.ItemIndex);  
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
  CBColor.Checked := false;
  CBTipoRegistro.Checked := false;
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
var
  rpaux: String;
  F : TFREPFichaAnimal;
begin
  inherited;
  rpaux:= IBQAnimales.fieldByName('rp').AsString;

  F := TFREPFichaAnimal.Create(self);
  F.animal := IBQRecuperarAnimales.Lookup('rp',rpaux,'animal');
  F.ShowModal;
  F.Destroy;

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
  GBSeleccionAnimal.Caption := Traducir('  Selección de animal [')+IntToStr(IBQAnimales.RecordCount)+']  ';
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
  conWhere := false;

  IAniosActivo.Visible := false;
  IAniosInactivo.Visible := true;

  IPesoActivo.Visible := false;
  IPesoInactivo.Visible := true;

  IFrameActivos.Visible := false;
  IFrameInactivos.Visible := true;

  IVerInactivosOn.Visible := false;
  IVerInactivosOff.Visible := true;

  IBQColor.Close;
  IBQColor.Open;

  ConfiguracionRaza;

  IBQTiposRegistros.Close;
  IBQTiposRegistros.ParamByName('raza').AsInteger := 29;
  IBQTiposRegistros.Open;
  
  CargarCombos(DMSoftvet.IBQCondicionCorporal,'(TODAS)',CBxCondicionCorporal,'escala');
  CargarCombos(DMSoftvet.IBQCronologiaDentaria,'(TODAS)',CBxCronologiaDentaria,'sinonimo');
  CargarCombos(DMSoftvet.IBQRaza,'(TODAS)',CBxRaza,'sinonimo');
  CargarCombos(DMSoftvet.IBQEstadoReproductivo,'(TODOS)',CBxEstadoReproductivo,'nombre');
  CargarCombos(DMSoftvet.IBQEstadoParicion,'(TODOS)',CBxEstadoParicion,'estado_lactacion');
  CargarCombos(DMSoftvet.IBQRodeo,'(TODOS)',CBxRodeo,'nombre');
  CargarCombos(DMSoftvet.IBQPotrero,'(TODOS)',CBxPotrero,'nombre');
  CargarCombos(IBQColor,'(TODOS)',CBxColor,'nombre');
  CargarCombos(DMSoftvet.IBQCategorias,'(TODAS)',CBxCategoria,'sinonimo');
  CargarCombos(IBQTiposRegistros,'(TODOS)',CBxTipoRegistro,'nombre');
  CargarCombos(DMSoftvet.IBQGDR,'(TODOS)',CBxGDR,'sinonimo');

  InicializarCombos;
  
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

  FPrincipal.SeleccionarRazaPredom;
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

  GBSeleccionAnimal.Caption := '  Presione Ver Animales para observar los datos  ';

  RGBusqueda.ItemIndex := 0;
  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;

  JvComplejos.Collapsed := true;
  RGBusqueda.ItemIndex := 0;
  consulta := 'select * from aux_datos_deps';
  GuardarParametros;
  CargarParametros;
  OrganizarVisualizacionGrilla(RGRaza.ItemIndex, RGTipoPlanilla.ItemIndex);
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
  if not(BDBGAnimales.DataSource.DataSet.IsEmpty) then
  begin
        if SDXLS.Execute then
        begin
          cartel := TCartel.getInstance;
          cartel.abrircartel('Exportando datos a Excel...');
          ArmarExcel();
          DTXLS.SaveToFile(SDXLS.FileName);
          cartel.cerrarcartel;
          cartel.FreeInstance;
        end;
  end
  else
      MostrarMensaje(tmInformacion,'No hay datos a exportar');
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

  inherited;
  FREPHistorialAnimalPreview := TFREPHistorialAnimalPreview.Create(self);

  Self.Tag := 0;
  FREPHistorialAnimalPreview.QRListadaAnimales.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText5.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText6.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  //FREPHistorialAnimalPreview.QRDBText7.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText8.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText9.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;
  FREPHistorialAnimalPreview.QRDBText10.DataSet := FREPHistorialAnimalPreview.IBQAuxDeps;

  FREPHistorialAnimalPreview.IBQAuxDeps.Close;
  FREPHistorialAnimalPreview.IBQAuxDeps.Open;

  FREPHistorialAnimalPreview.QRLTotal.Caption := IntToStr(FREPHistorialAnimalPreview.IBQAuxDeps.RecordCount);

  cartel.cerrarcartel();
  cartel.FreeInstance();

  FREPHistorialAnimalPreview.ShowModal;
  FREPHistorialAnimalPreview.Destroy;
end;

procedure TFExpDeps.IVerFichaClick(Sender: TObject);
var
  rpaux: String;
  F : TFREPFichaAnimal;
begin
  inherited;

  if (not(IBQAnimales.IsEmpty)) then
  begin
    rpaux:= IBQAnimales.fieldByName('rp').AsString;

    F := TFREPFichaAnimal.Create(self);
    F.animal := IBQRecuperarAnimales.Lookup('rp',rpaux,'animal');
    F.ShowModal;
    F.Destroy;

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

procedure TFExpDeps.BorrarAuxiliares;
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
  OrganizarVisualizacionGrilla(RGRaza.ItemIndex, RGTipoPlanilla.ItemIndex);


  case RGRaza.ItemIndex of
    0 : begin
          case RGTipoPlanilla.ItemIndex of
            0 : RecuperarDatosDeAnimalesNacDest(desde,hasta,RGRaza.ItemIndex);
            1 : RecuperarDatosDeAnimalesPostDest(desde,hasta,RGRaza.ItemIndex);
            2 : RecuperarDatosDeAnimalesCalidadCarne(desde,hasta,RGRaza.ItemIndex);
          end;
        end;
    1,2,3 : begin
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

procedure TFExpDeps.OrganizarVisualizacionGrilla(IndexRaza, IndexPlanilla : integer);
var i : integer;
begin

  for i := 0 to 41 do
  begin
    BDBGAnimales.Columns[i].Visible := true;
    BDBGAnimales.Columns[i].Alignment := taCenter;
  end;

  case IndexRaza of
    0 : begin
          case IndexPlanilla of
            0 : begin
                  BDBGAnimales.Columns[0].Title.Caption := 'Rp cria';
                  BDBGAnimales.Columns[0].FieldName := 'RP';
                  BDBGAnimales.Columns[0].Width := 90;
                  BDBGAnimales.Columns[1].Title.Caption := 'Sexo';
                  BDBGAnimales.Columns[1].FieldName := 'NOMTIPOSEXO';
                  BDBGAnimales.Columns[1].Width := 50;
                  BDBGAnimales.Columns[2].Title.Caption := 'Mell';
                  BDBGAnimales.Columns[2].FieldName := 'NOMSEXO';
                  BDBGAnimales.Columns[2].Width := 50;
                  BDBGAnimales.Columns[3].Title.Caption := 'F. nac.';
                  BDBGAnimales.Columns[3].FieldName := 'FECHA_NACIMIENTO';
                  BDBGAnimales.Columns[3].Width := 80;
                  BDBGAnimales.Columns[4].Title.Caption := 'Cat.';
                  BDBGAnimales.Columns[4].FieldName := 'SUBCAT';
                  BDBGAnimales.Columns[4].Width := 70;
                  BDBGAnimales.Columns[5].Title.Caption := 'C';
                  BDBGAnimales.Columns[5].FieldName := 'COLOR';
                  BDBGAnimales.Columns[5].Width := 40;
                  BDBGAnimales.Columns[6].Title.Caption := 'CM';
                  BDBGAnimales.Columns[6].FieldName := 'CODIGO_MUERTO';
                  BDBGAnimales.Columns[6].Width := 40;
                  BDBGAnimales.Columns[7].Title.Caption := 'PN';
                  BDBGAnimales.Columns[7].FieldName := 'PESO_NAC';
                  BDBGAnimales.Columns[7].Width := 40;
                  BDBGAnimales.Columns[8].Title.Caption := 'M0';
                  BDBGAnimales.Columns[8].FieldName := 'CODIGO_MANEJO_0';
                  BDBGAnimales.Columns[8].Width := 40;
                  BDBGAnimales.Columns[9].Title.Caption := 'Rp madre';
                  BDBGAnimales.Columns[9].FieldName := 'RP_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[9].Width := 100;
                  BDBGAnimales.Columns[10].Title.Caption := 'HBA madre';
                  BDBGAnimales.Columns[10].FieldName := 'HBA_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[10].Width := 90;
                  BDBGAnimales.Columns[11].Title.Caption := 'Cat';
                  BDBGAnimales.Columns[11].FieldName := 'SUBCAT_MBI';
                  BDBGAnimales.Columns[11].Width := 50;
                  BDBGAnimales.Columns[12].Title.Caption := 'C madre';
                  BDBGAnimales.Columns[12].FieldName := 'COLOR_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[12].Width := 50;
                  BDBGAnimales.Columns[13].Title.Caption := 'Fecha de nac.';
                  BDBGAnimales.Columns[13].FieldName := 'NACIMIENTO_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[13].Width := 90;
                  BDBGAnimales.Columns[14].Title.Caption := 'TS';
                  BDBGAnimales.Columns[14].FieldName := 'TIPO_SERVICIO';
                  BDBGAnimales.Columns[14].Width := 50;
                  BDBGAnimales.Columns[15].Title.Caption := 'TP';
                  BDBGAnimales.Columns[15].FieldName := 'TIPO_PARTO';
                  BDBGAnimales.Columns[15].Width := 70;
                  BDBGAnimales.Columns[16].Title.Caption := 'Rp padre';
                  BDBGAnimales.Columns[16].FieldName := 'RP_PADRE';
                  BDBGAnimales.Columns[16].Width := 90;
                  BDBGAnimales.Columns[17].Title.Caption := 'HBA padre';
                  BDBGAnimales.Columns[17].FieldName := 'HBA_PADRE';
                  BDBGAnimales.Columns[17].Width := 90;
                  BDBGAnimales.Columns[18].Title.Caption := 'Cat';
                  BDBGAnimales.Columns[18].FieldName := 'SUBCAT_P';
                  BDBGAnimales.Columns[18].Width := 50;
                  BDBGAnimales.Columns[19].Title.Caption := 'C padre';
                  BDBGAnimales.Columns[19].FieldName := 'COLOR_PADRE';
                  BDBGAnimales.Columns[19].Width := 50;
                  BDBGAnimales.Columns[20].Title.Caption := 'Año nac.';
                  BDBGAnimales.Columns[20].FieldName := 'NACIMIENTO_PADRE';
                  BDBGAnimales.Columns[20].Width := 80;
                  BDBGAnimales.Columns[21].Title.Caption := 'Rp receptora';
                  BDBGAnimales.Columns[21].FieldName := 'RP_MADRE_RECEPTORA';
                  BDBGAnimales.Columns[21].Width := 100;
                  BDBGAnimales.Columns[22].Title.Caption := 'Raza receptora';
                  BDBGAnimales.Columns[22].FieldName := 'RAZAMADRENOMBRERECEPTORA';
                  BDBGAnimales.Columns[22].Width := 100;
                  BDBGAnimales.Columns[23].Title.Caption := 'Fecha de nac.';
                  BDBGAnimales.Columns[23].FieldName := 'NACIMIENTO_MADRE_RECEPTORA';
                  BDBGAnimales.Columns[23].Width := 75;
                  BDBGAnimales.Columns[24].Title.Caption := 'Fecha de dest.';
                  BDBGAnimales.Columns[24].FieldName := 'FECHA_PESO_DEST';
                  BDBGAnimales.Columns[24].Width := 80;
                  BDBGAnimales.Columns[25].Title.Caption := 'Peso destete';
                  BDBGAnimales.Columns[25].FieldName := 'PESO_DEST';
                  BDBGAnimales.Columns[25].Width := 60;
                  BDBGAnimales.Columns[26].Title.Caption := 'M1';
                  BDBGAnimales.Columns[26].FieldName := 'CODIGO_MANEJO_1';
                  BDBGAnimales.Columns[26].Width := 50;
                  BDBGAnimales.Columns[27].Title.Caption := 'Observaciones';
                  BDBGAnimales.Columns[27].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[27].Width := 100;
                  BDBGAnimales.Columns[28].FieldName := 'ACTIVO';

                  for i := 28 to 41 do
                  begin
                     BDBGAnimales.Columns[i].Visible := false;
                  end;
                end;
            2 : begin
                  BDBGAnimales.Columns[0].Title.Caption := 'Rp';
                  BDBGAnimales.Columns[0].FieldName := 'RP';
                  BDBGAnimales.Columns[0].Width := 90;
                  BDBGAnimales.Columns[1].Title.Caption := 'F. de nac.';
                  BDBGAnimales.Columns[1].FieldName := 'FECHA_NACIMIENTO';
                  BDBGAnimales.Columns[1].Width := 80;
                  BDBGAnimales.Columns[2].Title.Caption := 'Cabaña/Estab. nacimiento';
                  BDBGAnimales.Columns[2].FieldName := 'ESTAB_NAC';
                  BDBGAnimales.Columns[2].Width := 150;
                  BDBGAnimales.Columns[3].Title.Caption := 'Sexo';
                  BDBGAnimales.Columns[3].FieldName := 'NOMSEXO';
                  BDBGAnimales.Columns[3].Width := 80;
                  BDBGAnimales.Columns[4].Title.Caption := 'Rp padre';
                  BDBGAnimales.Columns[4].FieldName := 'RP_PADRE';
                  BDBGAnimales.Columns[4].Width := 90;
                  BDBGAnimales.Columns[5].Title.Caption := 'HBA padre';
                  BDBGAnimales.Columns[5].FieldName := 'HBA_PADRE';
                  BDBGAnimales.Columns[5].Width := 90;
                  BDBGAnimales.Columns[6].Title.Caption := 'Cat';
                  BDBGAnimales.Columns[6].FieldName := 'SUBCAT_P';
                  BDBGAnimales.Columns[6].Width := 70;
                  BDBGAnimales.Columns[7].Title.Caption := 'Rp madre';
                  BDBGAnimales.Columns[7].FieldName := 'RP_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[7].Width := 90; 
                  BDBGAnimales.Columns[8].Title.Caption := 'HBA madre';
                  BDBGAnimales.Columns[8].FieldName := 'HBA_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[8].Width := 90;
                  BDBGAnimales.Columns[9].Title.Caption := 'Cat';
                  BDBGAnimales.Columns[9].FieldName := 'SUBCAT_MBI';
                  BDBGAnimales.Columns[9].Width := 50;
                  BDBGAnimales.Columns[10].Title.Caption := 'Cabaña/Establ. de terminac.';
                  BDBGAnimales.Columns[10].FieldName := 'ESTAB_ACT';
                  BDBGAnimales.Columns[10].Width := 150;
                  BDBGAnimales.Columns[11].Title.caption := 'Cod. de manejo';
                  BDBGAnimales.Columns[11].FieldName := 'CODIGO_MANEJO_0';
                  BDBGAnimales.Columns[11].Width := 75;
                  BDBGAnimales.Columns[12].Title.Caption := 'FECHA';
                  BDBGAnimales.Columns[12].FieldName := 'FECHA_PESO_NAC';
                  BDBGAnimales.Columns[12].Width := 90;
                  BDBGAnimales.Columns[13].Title.Caption := 'Peso (kg.)';
                  BDBGAnimales.Columns[13].FieldName := 'PESO_NAC';
                  BDBGAnimales.Columns[13].Width := 80;
                  BDBGAnimales.Columns[14].Title.Caption := 'Altura (cm.)';
                  BDBGAnimales.Columns[14].FieldName := 'ALZADA';
                  BDBGAnimales.Columns[14].Width := 90;
                  BDBGAnimales.Columns[15].Title.Caption := 'C.E. (cm.)';
                  BDBGAnimales.Columns[15].FieldName := 'CIRC_ESC';
                  BDBGAnimales.Columns[15].Width := 80;
                  BDBGAnimales.Columns[16].Title.Caption := 'Fecha de medición';
                  BDBGAnimales.Columns[16].FieldName := 'FECHA_PESO_NAC';
                  BDBGAnimales.Columns[16].Width := 100;
                  BDBGAnimales.Columns[17].Title.Caption := 'Area de ojo de bife (cm.)';
                  BDBGAnimales.Columns[17].FieldName := 'AOB';
                  BDBGAnimales.Columns[17].Width := 150;
                  BDBGAnimales.Columns[18].Title.Caption := 'Grasa intramusc.(%)';
                  BDBGAnimales.Columns[18].FieldName := 'GI';
                  BDBGAnimales.Columns[18].Width := 100;
                  BDBGAnimales.Columns[19].Title.Caption := 'Grasa dorsal (mm.)';
                  BDBGAnimales.Columns[19].FieldName := 'GD';
                  BDBGAnimales.Columns[19].Width := 100;
                  BDBGAnimales.Columns[20].Title.Caption := 'Grasa cadera (mm.)';
                  BDBGAnimales.Columns[20].FieldName := 'GC';
                  BDBGAnimales.Columns[20].Width := 100;
                  BDBGAnimales.Columns[21].FieldName := 'ACTIVO';

                  for i := 21 to 41 do
                  begin
                    BDBGAnimales.Columns[i].Visible := false;
                  end;

                end;
            1 : begin
                  BDBGAnimales.Columns[0].Title.Caption := 'Rp';
                  BDBGAnimales.Columns[0].FieldName := 'RP';
                  BDBGAnimales.Columns[0].Width := 90;
                  BDBGAnimales.Columns[1].Title.Caption := 'SEXO';
                  BDBGAnimales.Columns[1].FieldName := 'NOMSEXO';
                  BDBGAnimales.Columns[1].Width := 70;
                  BDBGAnimales.Columns[2].Title.Caption := 'F. de nac.';
                  BDBGAnimales.Columns[2].FieldName := 'FECHA_NACIMIENTO';
                  BDBGAnimales.Columns[2].Width := 90;
                  BDBGAnimales.Columns[3].Title.Caption := 'Cat.';
                  BDBGAnimales.Columns[3].FieldName := 'SUBCAT';
                  BDBGAnimales.Columns[3].Width := 70;
                  BDBGAnimales.Columns[4].Title.Caption := 'HBA';
                  BDBGAnimales.Columns[4].FieldName := 'HBA';
                  BDBGAnimales.Columns[4].Width := 90;
                  BDBGAnimales.Columns[5].Title.Caption := 'Fecha peso año';
                  BDBGAnimales.Columns[5].FieldName := 'FECHA_PESO_ANIO';
                  BDBGAnimales.Columns[5].Width := 90;
                  BDBGAnimales.Columns[6].Title.Caption := 'Peso año';
                  BDBGAnimales.Columns[6].FieldName := 'PESO_ANIO';
                  BDBGAnimales.Columns[6].Width := 70;
                  BDBGAnimales.Columns[7].Title.Caption := 'M2';
                  BDBGAnimales.Columns[7].FieldName := 'CODIGO_MANEJO_2';
                  BDBGAnimales.Columns[7].Width := 50;
                  BDBGAnimales.Columns[8].Title.Caption := 'Fecha peso 18 meses';
                  BDBGAnimales.Columns[8].FieldName := 'FECHA_PESO_ADULTO';
                  BDBGAnimales.Columns[8].Width := 100;
                  BDBGAnimales.Columns[9].Title.Caption := 'Peso 18 meses';
                  BDBGAnimales.Columns[9].FieldName := 'PESO_ADULTO';
                  BDBGAnimales.Columns[9].Width := 90;
                  BDBGAnimales.Columns[10].Title.Caption := 'M3';
                  BDBGAnimales.Columns[10].FieldName := 'CODIGO_MANEJO_3';
                  BDBGAnimales.Columns[10].Width := 50;
                  BDBGAnimales.Columns[11].Title.Caption := 'Fecha medida circ. escrotal';
                  BDBGAnimales.Columns[11].FieldName := 'FECHA_MED_CIRC';
                  BDBGAnimales.Columns[11].Width := 100;
                  BDBGAnimales.Columns[12].Title.Caption := 'C.E.';
                  BDBGAnimales.Columns[12].FieldName := 'CIRC_ESC';
                  BDBGAnimales.Columns[12].Width := 60;
                  BDBGAnimales.Columns[13].Title.Caption := 'Fecha medida altura';
                  BDBGAnimales.Columns[13].FieldName := 'FECHA_MED_ALZADA';
                  BDBGAnimales.Columns[13].Width := 120;
                  BDBGAnimales.Columns[14].Title.Caption := 'Alt.';
                  BDBGAnimales.Columns[14].FieldName := 'ALZADA';
                  BDBGAnimales.Columns[14].Width := 80;
                  BDBGAnimales.Columns[15].Title.Caption := 'Observaciones';
                  BDBGAnimales.Columns[15].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[15].Width := 150;
                  BDBGAnimales.Columns[16].FieldName := 'ACTIVO';

                  for i := 16 to 41 do
                  begin
                    BDBGAnimales.Columns[i].Visible := false;
                  end;
                    
                end;
          end;
        end;
    1 : begin
          case RGTipoPlanilla.ItemIndex of
            0 : begin
                  BDBGAnimales.Columns[0].Title.Caption := 'Rp cria';
                  BDBGAnimales.Columns[0].FieldName := 'RP';
                  BDBGAnimales.Columns[0].Width := 90;
                  BDBGAnimales.Columns[1].Title.Caption := 'Fecha nac.';
                  BDBGAnimales.Columns[1].FieldName := 'FECHA_NACIMIENTO';
                  BDBGAnimales.Columns[1].Width := 90;
                  BDBGAnimales.Columns[2].Title.Caption := 'Sexo';
                  BDBGAnimales.Columns[2].FieldName := 'NOMTIPOSEXO';
                  BDBGAnimales.Columns[2].Width := 90;
                  BDBGAnimales.Columns[3].Title.Caption := 'Registro';
                  BDBGAnimales.Columns[3].FieldName := 'SUBCAT';
                  BDBGAnimales.Columns[3].Width := 90;
                  BDBGAnimales.Columns[4].Title.Caption := 'Color';
                  BDBGAnimales.Columns[4].FieldName := 'COLOR';
                  BDBGAnimales.Columns[4].Width := 90;
                  BDBGAnimales.Columns[5].Title.Caption := 'Nombre';
                  BDBGAnimales.Columns[5].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[5].Width := 150;
                  BDBGAnimales.Columns[6].Title.Caption := 'Rp madre';
                  BDBGAnimales.Columns[6].FieldName := 'RP_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[6].Width := 90;
                  BDBGAnimales.Columns[7].Title.Caption := 'Nro. criador madre';
                  BDBGAnimales.Columns[7].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[7].Width := 80;
                  BDBGAnimales.Columns[8].Title.Caption := 'Registro madre';
                  BDBGAnimales.Columns[8].FieldName := 'SUBCAT_MBI';
                  BDBGAnimales.Columns[8].Width := 100;
                  BDBGAnimales.Columns[9].Title.Caption := 'AAB madre';
                  BDBGAnimales.Columns[9].FieldName := 'PC_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[9].Width := 90;
                  BDBGAnimales.Columns[10].Title.Caption := 'HBA madre';
                  BDBGAnimales.Columns[10].FieldName := 'HBA_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[10].Width := 90;
                  BDBGAnimales.Columns[11].Title.Caption := 'Rp padre';
                  BDBGAnimales.Columns[11].FieldName := 'RP_PADRE';
                  BDBGAnimales.Columns[11].Width := 90;
                  BDBGAnimales.Columns[12].Title.caption := 'Nro. criador padre';
                  BDBGAnimales.Columns[12].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[12].Width := 120;
                  BDBGAnimales.Columns[13].Title.Caption := 'Apodo padre';
                  BDBGAnimales.Columns[13].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[13].Width := 150;
                  BDBGAnimales.Columns[14].Title.Caption := 'AAB padre';
                  BDBGAnimales.Columns[14].FieldName := 'PC_PADRE';
                  BDBGAnimales.Columns[14].Width := 90;
                  BDBGAnimales.Columns[15].Title.Caption := 'HBA padre';
                  BDBGAnimales.Columns[15].FieldName := 'HBA_PADRE';
                  BDBGAnimales.Columns[15].Width := 90;
                  BDBGAnimales.Columns[16].Title.Caption := 'Observaciones';
                  BDBGAnimales.Columns[16].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[16].Width := 150;
                  BDBGAnimales.Columns[17].FieldName := 'ACTIVO';

                  for i := 17 to 41 do
                  begin
                    BDBGAnimales.Columns[i].Visible := false;
                  end;

                end;
            1 : begin
                  BDBGAnimales.Columns[0].Title.Caption := 'Rp cria';
                  BDBGAnimales.Columns[0].FieldName := 'RP';
                  BDBGAnimales.Columns[0].Width := 90;
                  BDBGAnimales.Columns[1].Title.Caption := 'Fecha nac.';
                  BDBGAnimales.Columns[1].FieldName := 'FECHA_NACIMIENTO';
                  BDBGAnimales.Columns[1].Width := 90;
                  BDBGAnimales.Columns[2].Title.Caption := 'Sexo';
                  BDBGAnimales.Columns[2].FieldName := 'NOMTIPOSEXO';
                  BDBGAnimales.Columns[2].Width := 80;
                  BDBGAnimales.Columns[3].Title.Caption := 'Registro';
                  BDBGAnimales.Columns[3].FieldName := 'SUBCAT';
                  BDBGAnimales.Columns[3].Width := 90;
                  BDBGAnimales.Columns[4].Title.Caption := 'Color';
                  BDBGAnimales.Columns[4].FieldName := 'COLOR';
                  BDBGAnimales.Columns[4].Width := 80;
                  BDBGAnimales.Columns[5].Title.Caption := 'Peso destete';
                  BDBGAnimales.Columns[5].FieldName := 'PESO_DEST';
                  BDBGAnimales.Columns[5].Width := 90;
                  BDBGAnimales.Columns[6].Title.Caption := 'Fecha de dest.';
                  BDBGAnimales.Columns[6].FieldName := 'FECHA_PESO_DEST';
                  BDBGAnimales.Columns[6].Width := 90;
                  BDBGAnimales.Columns[7].Title.Caption := 'M';
                  BDBGAnimales.Columns[7].FieldName := 'CODIGO_MANEJO_1';
                  BDBGAnimales.Columns[7].Width := 80;
                  BDBGAnimales.Columns[8].Title.Caption := 'Observaciones';
                  BDBGAnimales.Columns[8].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[8].Width := 150;
                  BDBGAnimales.Columns[9].FieldName := 'ACTIVO';

                  for i := 9 to 41 do
                  begin
                    BDBGAnimales.Columns[i].Visible := false;
                  end;

                end;
            2 : begin
                  BDBGAnimales.Columns[0].Title.Caption := 'Rp cria';
                  BDBGAnimales.Columns[0].FieldName := 'RP';
                  BDBGAnimales.Columns[0].Width := 90;
                  BDBGAnimales.Columns[1].Title.Caption := 'Fecha nac.';
                  BDBGAnimales.Columns[1].FieldName := 'FECHA_NACIMIENTO';
                  BDBGAnimales.Columns[1].Width := 90;
                  BDBGAnimales.Columns[2].Title.Caption := 'Sexo';
                  BDBGAnimales.Columns[2].FieldName := 'NOMSEXO';
                  BDBGAnimales.Columns[2].Width := 80;
                  BDBGAnimales.Columns[3].Title.Caption := 'Registro';
                  BDBGAnimales.Columns[3].FieldName := 'SUBCAT';
                  BDBGAnimales.Columns[3].Width := 90;
                  BDBGAnimales.Columns[4].Title.Caption := 'Color';
                  BDBGAnimales.Columns[4].FieldName := 'COLOR';
                  BDBGAnimales.Columns[4].Width := 90;
                  BDBGAnimales.Columns[5].Title.Caption := 'Fecha peso 18 meses';
                  BDBGAnimales.Columns[5].FieldName := 'FECHA_PESO_ADULTO';
                  BDBGAnimales.Columns[5].Width := 100;
                  BDBGAnimales.Columns[6].Title.Caption := 'Peso 18 meses';
                  BDBGAnimales.Columns[6].FieldName := 'PESO_ADULTO';
                  BDBGAnimales.Columns[6].Width := 95;
                  BDBGAnimales.Columns[7].Title.Caption := 'M';
                  BDBGAnimales.Columns[7].FieldName := 'CODIGO_MANEJO_3';
                  BDBGAnimales.Columns[7].Width := 80;
                  BDBGAnimales.Columns[8].Title.Caption := 'Fecha medida circ. escrotal';
                  BDBGAnimales.Columns[8].FieldName := 'FECHA_MED_CIRC';
                  BDBGAnimales.Columns[8].Width := 150;
                  BDBGAnimales.Columns[9].Title.Caption := 'C.E.';
                  BDBGAnimales.Columns[9].FieldName := 'CIRC_ESC';
                  BDBGAnimales.Columns[9].Width := 80;
                  BDBGAnimales.Columns[10].Title.Caption := 'Observaciones';
                  BDBGAnimales.Columns[10].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[10].Width := 150;
                  BDBGAnimales.Columns[10].FieldName := 'ACTIVO';

                  for i := 11 to 41 do
                  begin
                    BDBGAnimales.Columns[i].Visible := false;
                  end;

                end;
          end;
        end;
    2 : begin
          case RGTipoPlanilla.ItemIndex of
            0 : begin
                  BDBGAnimales.Columns[0].Title.Caption := 'Rp cria';
                  BDBGAnimales.Columns[0].FieldName := 'RP';
                  BDBGAnimales.Columns[0].Width := 90;
                  BDBGAnimales.Columns[1].Title.Caption := 'Fecha';
                  BDBGAnimales.Columns[1].FieldName := 'FECHA_NACIMIENTO';
                  BDBGAnimales.Columns[1].Width := 90;
                  BDBGAnimales.Columns[2].Title.Caption := 'Sexo';
                  BDBGAnimales.Columns[2].FieldName := 'NOMTIPOSEXO';
                  BDBGAnimales.Columns[2].Width := 90;
                  BDBGAnimales.Columns[3].Title.Caption := 'TS';
                  BDBGAnimales.Columns[3].FieldName := 'TIPO_SERVICIO';
                  BDBGAnimales.Columns[3].Width := 90;
                  BDBGAnimales.Columns[4].Title.Caption := 'TP.';
                  BDBGAnimales.Columns[4].FieldName := 'TIPO_PARTO';
                  BDBGAnimales.Columns[4].Width := 90;
                  BDBGAnimales.Columns[5].Title.Caption := 'CM';
                  BDBGAnimales.Columns[5].FieldName := 'CODIGO_MUERTO';
                  BDBGAnimales.Columns[5].Width := 90;
                  BDBGAnimales.Columns[6].Title.Caption := 'Peso';
                  BDBGAnimales.Columns[6].FieldName := 'PESO_NAC';
                  BDBGAnimales.Columns[6].Width := 90;
                  BDBGAnimales.Columns[7].Title.Caption := 'Rp madre';
                  BDBGAnimales.Columns[7].FieldName := 'RP_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[7].Width := 90;
                  BDBGAnimales.Columns[8].Title.Caption := 'Nro criador';
                  BDBGAnimales.Columns[8].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[8].Width := 100;
                  BDBGAnimales.Columns[9].Title.Caption := 'HBA madre';
                  BDBGAnimales.Columns[9].FieldName := 'HBA_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[9].Width := 90;
                  BDBGAnimales.Columns[10].Title.Caption := 'ABA madre';
                  BDBGAnimales.Columns[10].FieldName := 'PC_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[10].Width := 90;
                  BDBGAnimales.Columns[11].Title.Caption := 'UBB madre';
                  BDBGAnimales.Columns[11].FieldName := 'RA_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[11].Width := 90;
                  BDBGAnimales.Columns[12].Title.Caption := 'Raza madre';
                  BDBGAnimales.Columns[12].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[12].Width := 100;
                  BDBGAnimales.Columns[13].Title.Caption := 'Registro madre';
                  BDBGAnimales.Columns[13].FieldName := 'SUBCAT_MBI';
                  BDBGAnimales.Columns[13].Width := 120;
                  BDBGAnimales.Columns[14].Title.Caption := 'Tipo madre';
                  BDBGAnimales.Columns[14].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[14].Width := 110;
                  BDBGAnimales.Columns[15].Title.Caption := 'Edad madre';
                  BDBGAnimales.Columns[15].FieldName := 'NACIMIENTO_MADRE_BIOLOGICA';
                  BDBGAnimales.Columns[15].Width := 90;
                  BDBGAnimales.Columns[16].Title.Caption := 'Rp receptora';
                  BDBGAnimales.Columns[16].FieldName := 'RP_MADRE_RECEPTORA';
                  BDBGAnimales.Columns[16].Width := 110;
                  BDBGAnimales.Columns[17].Title.Caption := 'Raza receptora';
                  BDBGAnimales.Columns[17].FieldName := 'RAZAMADRENOMBRERECEPTORA';
                  BDBGAnimales.Columns[17].Width := 110;
                  BDBGAnimales.Columns[18].Title.Caption := 'Tipo madre receptora';
                  BDBGAnimales.Columns[18].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[18].Width := 150;
                  BDBGAnimales.Columns[19].Title.Caption := 'Fecha de nac.';
                  BDBGAnimales.Columns[19].FieldName := 'NACIMIENTO_MADRE_RECEPTORA';
                  BDBGAnimales.Columns[19].Width := 95;
                  BDBGAnimales.Columns[20].Title.Caption := 'Rp padre';
                  BDBGAnimales.Columns[20].FieldName := 'RP_PADRE';
                  BDBGAnimales.Columns[20].Width := 90;
                  BDBGAnimales.Columns[21].Title.Caption := 'Nro criador';
                  BDBGAnimales.Columns[21].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[21].Width := 90;
                  BDBGAnimales.Columns[22].Title.Caption := 'Apodo padre';
                  BDBGAnimales.Columns[22].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[22].Width := 90;
                  BDBGAnimales.Columns[23].Title.Caption := 'Nombre padre';
                  BDBGAnimales.Columns[23].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[23].Width := 90;
                  BDBGAnimales.Columns[24].Title.Caption := 'HBA padre';
                  BDBGAnimales.Columns[24].FieldName := 'HBA_PADRE';
                  BDBGAnimales.Columns[24].Width := 90;
                  BDBGAnimales.Columns[25].Title.Caption := 'ABA padre';
                  BDBGAnimales.Columns[25].FieldName := 'PC_PADRE';
                  BDBGAnimales.Columns[25].Width := 90;  
                  BDBGAnimales.Columns[26].Title.Caption := 'UBB padre';
                  BDBGAnimales.Columns[26].FieldName := 'RA_PADRE';
                  BDBGAnimales.Columns[26].Width := 90;
                  BDBGAnimales.Columns[27].Title.Caption := 'Raza padre';
                  BDBGAnimales.Columns[27].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[27].Width := 90;
                  BDBGAnimales.Columns[28].Title.Caption := 'Nombre padre';
                  BDBGAnimales.Columns[28].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[28].Width := 100;
                  BDBGAnimales.Columns[29].Title.Caption := 'Registro padre';
                  BDBGAnimales.Columns[29].FieldName := 'SUBCAT_P';
                  BDBGAnimales.Columns[29].Width := 100;
                  BDBGAnimales.Columns[30].Title.Caption := 'Tipo padre';
                  BDBGAnimales.Columns[30].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[30].Width := 90;
                  BDBGAnimales.Columns[31].Title.Caption := 'Año nac.';
                  BDBGAnimales.Columns[31].FieldName := 'NACIMIENTO_PADRE';
                  BDBGAnimales.Columns[31].Width := 80;
                  BDBGAnimales.Columns[32].Title.Caption := 'Observaciones';
                  BDBGAnimales.Columns[32].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[32].Width := 150;
                  BDBGAnimales.Columns[32].FieldName := 'ACTIVO';

                  for i := 33 to 41 do
                  begin
                    BDBGAnimales.Columns[i].Visible := false;
                  end;

                end;
            1 : begin
                  BDBGAnimales.Columns[0].Title.Caption := 'Rp cria';
                  BDBGAnimales.Columns[0].FieldName := 'RP';
                  BDBGAnimales.Columns[0].Width := 90;
                  BDBGAnimales.Columns[1].Title.Caption := 'Fecha nac.';
                  BDBGAnimales.Columns[1].FieldName := 'FECHA_NACIMIENTO';
                  BDBGAnimales.Columns[1].Width := 90;
                  BDBGAnimales.Columns[2].Title.Caption := 'Sexo';
                  BDBGAnimales.Columns[2].FieldName := 'NOMTIPOSEXO';
                  BDBGAnimales.Columns[2].Width := 80;
                  BDBGAnimales.Columns[3].Title.Caption := 'Fecha de dest.';
                  BDBGAnimales.Columns[3].FieldName := 'FECHA_PESO_DEST';
                  BDBGAnimales.Columns[3].Width := 95;
                  BDBGAnimales.Columns[4].Title.Caption := 'Peso destete';
                  BDBGAnimales.Columns[4].FieldName := 'PESO_DEST';
                  BDBGAnimales.Columns[4].Width := 110;
                  BDBGAnimales.Columns[5].Title.Caption := 'M';
                  BDBGAnimales.Columns[5].FieldName := 'CODIGO_MANEJO_1';
                  BDBGAnimales.Columns[5].Width := 80;
                  BDBGAnimales.Columns[6].Title.Caption := 'Observaciones';
                  BDBGAnimales.Columns[6].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[6].Width := 150;
                  BDBGAnimales.Columns[6].FieldName := 'ACTIVO';                  

                  for i := 7 to 41 do
                    BDBGAnimales.Columns[i].Visible := false;

                end;
            2 : begin
                  BDBGAnimales.Columns[0].Title.Caption := 'Rp cria';
                  BDBGAnimales.Columns[0].FieldName := 'RP';
                  BDBGAnimales.Columns[0].Width := 90;
                  BDBGAnimales.Columns[1].Title.Caption := 'HBA cria';
                  BDBGAnimales.Columns[1].FieldName := 'HBA';
                  BDBGAnimales.Columns[1].Width := 90;
                  BDBGAnimales.Columns[2].Title.Caption := 'ABA cria';
                  BDBGAnimales.Columns[2].FieldName := 'PC';
                  BDBGAnimales.Columns[2].Width := 90;
                  BDBGAnimales.Columns[3].Title.Caption := 'Sexo';
                  BDBGAnimales.Columns[3].FieldName := 'NOMSEXO';
                  BDBGAnimales.Columns[3].Width := 80;
                  BDBGAnimales.Columns[4].Title.Caption := 'Fecha peso 18 meses';
                  BDBGAnimales.Columns[4].FieldName := 'FECHA_PESO_ADULTO';
                  BDBGAnimales.Columns[4].Width := 120;
                  BDBGAnimales.Columns[5].Title.Caption := 'Peso 18 meses';
                  BDBGAnimales.Columns[5].FieldName := 'PESO_ADULTO';
                  BDBGAnimales.Columns[5].Width := 100;
                  BDBGAnimales.Columns[6].Title.Caption := 'M';
                  BDBGAnimales.Columns[6].FieldName := 'CODIGO_MANEJO_3';
                  BDBGAnimales.Columns[6].Width := 80;
                  BDBGAnimales.Columns[7].Title.Caption := 'Fecha medida circ. escrotal';
                  BDBGAnimales.Columns[7].FieldName := 'FECHA_MED_CIRC';
                  BDBGAnimales.Columns[7].Width := 120;
                  BDBGAnimales.Columns[8].Title.Caption := 'C.E.';
                  BDBGAnimales.Columns[8].FieldName := 'CIRC_ESC';
                  BDBGAnimales.Columns[8].Width := 80;
                  BDBGAnimales.Columns[9].Title.Caption := 'Observaciones';
                  BDBGAnimales.Columns[9].FieldName := 'OBSERVACION';
                  BDBGAnimales.Columns[9].Width := 150;
                  BDBGAnimales.Columns[9].FieldName := 'ACTIVO';                  

                  for i := 10 to 41 do
                    BDBGAnimales.Columns[i].Visible := false;  
                end;
          end;
        end;
    end;


  for i := 0 to 41 do
  begin
    if (BDBGAnimales.Columns[i].Visible) then
        BDBGAnimales.Columns[i].Alignment := taCenter;
  end;

end;

procedure TFExpDeps.ConfiguracionRaza;
var raza, tope : integer;
begin
     RBAngus.Visible := false;
     RBBraford.Visible := false;
     RBBrangus.Visible := false;
     RBHereford.Visible := false;
     
     IBQExisteRazaEst.Close;
     IBQExisteRazaEst.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
     IBQExisteRazaEst.Open;

     if not(IBQExisteRazaEst.IsEmpty) then
     begin
          IBQExisteRazaEst.First;

          tope := 18;

          while not(IBQExisteRazaEst.Eof) do
          begin
              raza := IBQExisteRazaEst.FieldValues['raza_elegida'];

              if ((raza = 4) or (raza = 5)) then //Hereford
              begin
                RGRaza.ItemIndex := 3;
                RBHereford.Top := tope;
                RBHereford.Visible := true;
                RBHereford.Checked := true;
                tope := 46;
              end;

              if (raza = 11) then //Braford
              begin
                RGRaza.ItemIndex := 2;
                RBBraford.Top := tope;
                RBBraford.Visible := true;
                RBBraford.Checked := true;

                if (tope = 46) then
                  tope := 71;
                
                if (tope = 18) then
                  tope := 46;
              end;

              if (raza = 30) then //Brangus
              begin
                RGRaza.ItemIndex := 1;
                RBBrangus.Top := tope;
                RBBrangus.Visible := true;
                RBBrangus.Checked := true;

                if (tope = 71) then
                  tope := 96;
                if (tope = 46) then
                  tope := 71;
                if (tope = 18) then
                  tope := 46;
              end;

              if (raza = 29) then //Angus
              begin
                RGRaza.ItemIndex := 0;
                RBAngus.Top := tope;
                RBAngus.Visible := true;
                RBAngus.Checked := true;
              end;

              IBQExisteRazaEst.Next;
          end;
     end
     else
     begin
          //if (raza = 29) then //Angus
          //begin
            RGRaza.ItemIndex := 0;
            RBAngus.Top := 18;
            RBAngus.Visible := true;
            RBAngus.Checked := true;
          //end;
     end;
     RGRazaClick(RGRaza);

     IBQTiposRegistros.Close;
     IBQTiposRegistros.ParamByName('raza').AsInteger := raza;
     IBQTiposRegistros.Open;
end;

procedure TFExpDeps.Label1Click(Sender: TObject);
var abm : TFABMEstablecimientos;
begin
  inherited;
//  abm := TFABMEstablecimientos.Create(self);
//  abm.ShowModal;
//  abm.Destroy;
end;

procedure TFExpDeps.CargarCombos(ibq : TIBQuery; text : string; combo : TComboBox; param : string);
begin

     combo.AddItem(text,nil);
     ibq.First;
     while not(ibq.Eof) do
     begin
          combo.AddItem(ibq.FieldValues[param],nil);
          ibq.Next;
     end;
end;

procedure TFExpDeps.InicializarCombos;
begin
     CBxRaza.ItemIndex := 0;
     CBxColor.ItemIndex := 0;
     CBxCategoria.ItemIndex := 0;
     CBxTipoRegistro.ItemIndex := 0;
     CBxPotrero.ItemIndex := 0;
     CBxRodeo.ItemIndex := 0;
     CBxCronologiaDentaria.ItemIndex := 0;
     CBxCondicionCorporal.ItemIndex := 0;
     CBxEstadoParicion.ItemIndex := 0;
     CBxEstadoReproductivo.ItemIndex := 0;
     CBxSexo.ItemIndex := 0;
     CBxGDR.ItemIndex := 0;

     DelEstPar := false;
     DelRaza := false;
     DelColor:= false;
     DelCategoria:= false;
     DelGrupo:= false;
     DelPotrero:= false;
     DelRodeo:= false;
     DelArPel:= false;
     DelCalSem:= false;
     DelCanPar:= false;
     DelCapSer:= false;
     DelConCor:= false;
     DelCroDen:= false;
     DelEstRep:= false;
     DelExaCli:= false;
     DelPre:= false;
     DelTR := false;
     DelGDR := false;
end;



procedure TFExpDeps.CBxRazaChange(Sender: TObject);
begin
  inherited;

  if ((CBxRaza.Text <> 'RAZA') and (CBxRaza.Text <> '(TODAS)')) then
  begin
      CBRaza.Checked := true;
      DBLCBARaza.KeyValue := DMSoftvet.IBQRaza.Lookup('sinonimo',CBxRaza.Text,'id_raza');
  end
  else
  begin
      CBRaza.Checked := false;
      CBxRaza.Items.Insert(0,'RAZA');
      CBxRaza.ItemIndex := 0;
      DelRaza := false;
  end;
end;

procedure TFExpDeps.CBxRazaCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelRaza) then
  begin
       CBxRaza.Items.Delete(0);
       DelRaza := true; 
  end;
end;

procedure TFExpDeps.CBxCategoriaChange(Sender: TObject);
begin
  inherited;

  if ((CBxCategoria.Text <> 'CATEGORIA') and (CBxCategoria.Text <> '(TODAS)')) then
  begin
      CBCategoria.Checked := true;
      CheckClick(CBCategoria);
      DBLCBACategoria.KeyValue := DMSoftvet.IBQCategorias.Lookup('sinonimo',CBxCategoria.Text,'id_categoria');
      ComboCloseUp(DBLCBACategoria);
  end
  else
  begin
      CBCategoria.Checked := false;
      CheckClick(CBCategoria);
      CBxCategoria.Items.Insert(0,'CATEGORIA');
      CBxCategoria.ItemIndex := 0;
      DelCategoria := false;
  end;

end;

procedure TFExpDeps.CBxCategoriaCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelCategoria) then
  begin
       CBxCategoria.Items.Delete(0);
       DelCategoria := true;
  end;

end;

procedure TFExpDeps.CBxRodeoChange(Sender: TObject);
begin
  inherited;
  if ((CBxRodeo.Text <> 'RODEO') and (CBxRodeo.Text <> '(TODOS)')) then
  begin
      CBRodeo.Checked := true;
      CheckClick(CBRodeo);
      DBLCBARodeo.KeyValue := DMSoftvet.IBQRodeo.Lookup('nombre',CBxRodeo.Text,'id_rodeo');
      ComboCloseUp(DBLCBARodeo);
  end
  else
  begin
      CBRodeo.Checked := false;
      CheckClick(CBRodeo);
      CBxRodeo.Items.Insert(0,'RODEO');
      CBxRodeo.ItemIndex := 0;
      DelRodeo := false;
  end;

end;

procedure TFExpDeps.CBxRodeoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRodeo) then
  begin
       CBxRodeo.Items.Delete(0);
       DelRodeo := true;
  end;
end;

procedure TFExpDeps.CBxColorChange(Sender: TObject);
begin
  inherited;

  if ((CBxColor.Text <> 'COLOR') and (CBxColor.Text <> '(TODOS)')) then
  begin
      CBColor.Checked := true;
      CheckClick(CBColor);
      DBLCBAColor.KeyValue := IBQColor.Lookup('nombre',CBxColor.Text,'id_color');
      ComboCloseUp(DBLCBAColor);
  end
  else
  begin
      CBColor.Checked := false;
      CBxColor.Items.Insert(0,'COLOR');
      CBxColor.ItemIndex := 0;
      DelColor := false;
  end;
  
end;

procedure TFExpDeps.CBxColorCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelColor) then
  begin
       CBxColor.Items.Delete(0);
       DelColor := true;
  end;

end;

procedure TFExpDeps.CBxTipoRegistroChange(Sender: TObject);
begin
  inherited;

  if ((CBxTipoRegistro.Text <> 'TIPO DE REGISTRO') and (CBxTipoRegistro.Text <> '(TODOS)')) then
  begin
      CBTipoRegistro.Checked := true;
      CheckClick(CBTipoRegistro);
      DBLCBATipoRegistro.KeyValue := IBQTiposRegistros.Lookup('nombre',CBxTipoRegistro.Text,'id_subcategoria');
      ComboCloseUp(DBLCBATipoRegistro);
  end
  else
  begin
      CBTipoRegistro.Checked := false;
      CheckClick(CBTipoRegistro);
      CBxTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
      CBxTipoRegistro.ItemIndex := 0;
      DelTR := false;
  end;
end;

procedure TFExpDeps.CBxTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTR) then
  begin
       CBxTipoRegistro.Items.Delete(0);
       DelTR := true;
  end;
end;

procedure TFExpDeps.CBxPotreroChange(Sender: TObject);
begin
  inherited;
  if ((CBxPotrero.Text <> 'POTRERO') and (CBxPotrero.Text <> '(TODOS)')) then
  begin
      CBPotrero.Checked := true;
      CheckClick(CBPotrero);
      DBLCBAPotrero.KeyValue := DMSoftvet.IBQPotrero.Lookup('nombre',CBxPotrero.Text,'id_potrero');
      ComboCloseUp(DBLCBAPotrero);
  end
  else
  begin
      CBPotrero.Checked := false;
      CheckClick(CBPotrero);
      CBxPotrero.Items.Insert(0,'POTRERO');
      CBxPotrero.ItemIndex := 0;
      DelPotrero := false;
  end; 
end;

procedure TFExpDeps.CBxPotreroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelPotrero) then
  begin
       CBxPotrero.Items.Delete(0);
       DelPotrero := true;
  end;
end;

procedure TFExpDeps.CBxCronologiaDentariaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelCroDen) then
  begin
       CBxCronologiaDentaria.Items.Delete(0);
       DelCroDen := true;
  end;

end;

procedure TFExpDeps.CBxCronologiaDentariaChange(Sender: TObject);
begin
  inherited;

  if ((CBxCronologiaDentaria.Text <> 'CRONOLOGIA DENTARIA') and (CBxCronologiaDentaria.Text <> '(TODAS)')) then
  begin
      CBCronoDentaria.Checked := true;
      CheckClick(CBCronoDentaria);
      DBLCBACronoDentaria.KeyValue := DMSoftvet.IBQCronologiaDentaria.Lookup('sinonimo',CBxCronologiaDentaria.Text,'id_cronologia_dentaria');
      ComboCloseUp(DBLCBACronoDentaria);
  end
  else
  begin
      CBCronoDentaria.Checked := false;
      CheckClick(CBCronoDentaria);
      CBxCronologiaDentaria.Items.Insert(0,'CRONOLOGIA DENTARIA');
      CBxCronologiaDentaria.ItemIndex := 0;
      DelCroDen := false;
  end;

end;

procedure TFExpDeps.CBxCondicionCorporalCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelConCor) then
  begin
       CBxCondicionCorporal.Items.Delete(0);
       DelConCor := true;
  end;

end;

procedure TFExpDeps.CBxCondicionCorporalChange(Sender: TObject);
begin
  inherited;

  if ((CBxCondicionCorporal.Text <> 'CONDICION CORPORAL') and (CBxCondicionCorporal.Text <> '(TODAS)')) then
  begin
      CBCondCorp.Checked := true;
      CheckClick(CBCondCorp);
      DBLCBACondCorporal.KeyValue := DMSoftvet.IBQCondicionCorporal.Lookup('escala',CBxCronologiaDentaria.Text,'id_condicion_corporal');
      ComboCloseUp(DBLCBACondCorporal);
  end
  else
  begin
      CBCondCorp.Checked := false;
      CheckClick(CBCondCorp);
      CBxCondicionCorporal.Items.Insert(0,'CONDICION CORPORAL');
      CBxCondicionCorporal.ItemIndex := 0;
      DelConCor := false;
  end;

end;

procedure TFExpDeps.CBxEstadoReproductivoChange(Sender: TObject);
begin
  inherited;
  if ((CBxEstadoReproductivo.Text <> 'ESTADO REPRODUCTIVO') and (CBxEstadoReproductivo.Text <> '(TODOS)')) then
  begin
      CBEstadoRepro.Checked := true;
      CheckClick(CBEstadoRepro);
      DBLCBAEstadoRepro.KeyValue := DMSoftvet.IBQEstadoReproductivo.Lookup('nombre',CBxCronologiaDentaria.Text,'id_estado_reproductivo');
      ComboCloseUp(DBLCBAEstadoRepro);
  end
  else
  begin
      CBEstadoRepro.Checked := false;
      CheckClick(CBEstadoRepro);
      CBxEstadoReproductivo.Items.Insert(0,'ESTADO REPRODUCTIVO');
      CBxEstadoReproductivo.ItemIndex := 0;
      DelEstRep := false;
  end;

end;

procedure TFExpDeps.CBxEstadoReproductivoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelEstRep) then
  begin
       CBxEstadoReproductivo.Items.Delete(0);
       DelEstRep := true;
  end;

end;

procedure TFExpDeps.CBxEstadoParicionCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelEstPar) then
  begin
       CBxEstadoParicion.Items.Delete(0);
       DelEstPar := true;
  end;

end;

procedure TFExpDeps.CBxEstadoParicionChange(Sender: TObject);
begin
  inherited;
  if ((CBxEstadoParicion.Text <> 'ESTADO PARICION') and (CBxEstadoParicion.Text <> '(TODOS)') and (CBxEstadoParicion.Text <> '')) then
  begin
      try
        CBEstadoParicion.Checked := true;
        CheckClick(CBEstadoParicion);
        DBLCBAEstadoParicion.KeyValue := DMSoftvet.IBQEstadoParicion.Lookup('estado_lactacion',CBxEstadoParicion.Text,'estado_lactacion');
        ComboCloseUp(DBLCBAEstadoParicion);
      except
        DBLCBAEstadoParicion.KeyValue := DMSoftvet.IBQEstadoParicion.Lookup('estado_lactacion',CBxEstadoParicion.Text,'estado_lactacion');
        ComboCloseUp(DBLCBAEstadoParicion);
      end;
  end
  else
  begin
      try
        CBEstadoParicion.Checked := false;
        CheckClick(CBEstadoParicion);
        CBxEstadoParicion.Items.Insert(0,'ESTADO PARICION');
        CBxEstadoParicion.ItemIndex := 0;
        DelEstPar := false;
      except
        CBEstadoParicion.Checked := false;
        CheckClick(CBEstadoParicion);
        CBxEstadoParicion.Items.Insert(0,'ESTADO PARICION');
        CBxEstadoParicion.ItemIndex := 0;
        DelEstPar := false;
      end;
  end;

end;

procedure TFExpDeps.CBxSexoChange(Sender: TObject);
begin
  inherited;
  if ((CBxSexo.Text <> 'SEXO') and (CBxSexo.Text <> '(TODOS)')) then
  begin
      CBSexo.Checked := true;
      CheckClick(CBSexo);
      DBLCBASexo.KeyValue := DMSoftvet.IBQTipoSexo.Lookup('nombre',CBxSexo.Text,'id_tipo_sexo');
      ComboCloseUp(DBLCBASexo);
  end
  else
  begin
      CBSexo.Checked := false;
      CheckClick(CBSexo);
      CBxSexo.Items.Insert(0,'SEXO');
      CBxSexo.ItemIndex := 0;
      DelSexo := false;
  end;

end;

procedure TFExpDeps.CBxSexoCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelSexo) then
  begin
       CBxSexo.Items.Delete(0);
       DelSexo := true;
  end;
end;

procedure TFExpDeps.CBxGDRChange(Sender: TObject);
begin
  inherited;
  if ((CBxGDR.Text <> 'GDR') and (CBxGDR.Text <> '(TODOS)')) then
  begin
      CBGdr.Checked := true;
      CheckClick(CBGdr);
      DBLCBAGdr.KeyValue := DMSoftvet.IBQGDR.Lookup('sinonimo',CBxSexo.Text,'id_gdr');
      ComboCloseUp(DBLCBAGdr);
  end
  else
  begin
      CBGdr.Checked := false;
      CheckClick(CBGdr);
      CBxGDR.Items.Insert(0,'GDR');
      CBxGDR.ItemIndex := 0;
      DelGDR := false;
  end;

end;

procedure TFExpDeps.CBxGDRCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelGDR) then
  begin
       CBxGDR.Items.Delete(0);
       DelGDR := true;
  end;

end;

procedure TFExpDeps.IAniosActivoClick(Sender: TObject);
begin
  inherited;

  if (IAniosActivo.Visible) then
  begin
        CBAnios.Checked := false;
        CheckClick(CBAnios);
        IAniosInactivo.Visible := true;
  end
  else
  begin
        CBAnios.Checked := true;
        CheckClick(CBAnios);
        IAniosInactivo.Visible := false;
  end;
end;

procedure TFExpDeps.IPesoActivoClick(Sender: TObject);
begin
  inherited;
  if (IPesoActivo.Visible) then
  begin
        CBPeso.Checked := false;
        CheckClick(CBPeso);
        IPesoInactivo.Visible := true;
  end
  else
  begin
        CBPeso.Checked := true;
        CheckClick(CBPeso);
        IPesoInactivo.Visible := false;
  end;

end;

procedure TFExpDeps.IFrameActivosClick(Sender: TObject);
begin
  inherited;
  if (IFrameActivos.Visible) then
  begin
        CBFrame.Checked := false;
        CheckClick(CBFrame);
        IFrameInactivos.Visible := true;
  end
  else
  begin
        CBFrame.Checked := true;
        CheckClick(CBFrame);
        IFrameInactivos.Visible := false;
  end;

end;

procedure TFExpDeps.IAniosInactivoClick(Sender: TObject);
begin
  inherited;
  if (IAniosInactivo.Visible) then
  begin
        CBAnios.Checked := true;
        CheckClick(CBAnios);
        IAniosActivo.Visible := true;
        IAniosInactivo.Visible := false;
  end
  else
  begin
        CBAnios.Checked := false;
        CheckClick(CBAnios);
        IAniosInactivo.Visible := true;
        IAniosActivo.Visible := false;
  end;

end;

procedure TFExpDeps.IPesoInactivoClick(Sender: TObject);
begin
  inherited;
  if not(IPesoActivo.Visible) then
  begin
        CBPeso.Checked := false;
        CheckClick(CBPeso);
        IPesoInactivo.Visible := true;
  end
  else
  begin
        CBPeso.Checked := true;
        CheckClick(CBPeso);
        IPesoInactivo.Visible := false;
  end;

end;

procedure TFExpDeps.IFrameInactivosClick(Sender: TObject);
begin
  inherited;
  if not(IFrameActivos.Visible) then
  begin
        CBFrame.Checked := false;
        CheckClick(CBFrame);
        IFrameInactivos.Visible := true;
  end
  else
  begin
        CBFrame.Checked := true;
        CheckClick(CBFrame);
        IFrameInactivos.Visible := false;
  end;

end;

procedure TFExpDeps.IVerInactivosOnClick(Sender: TObject);
begin
  inherited;

  IVerInactivosOn.Visible := not(IVerInactivosOn.Visible);
  IVerInactivosOff.Visible := not(IVerInactivosOff.Visible);

  CBAnimalesActivos.Checked := false;
  CheckClick(CBAnimalesActivos);

end;

procedure TFExpDeps.IVerInactivosOffClick(Sender: TObject);
begin
  inherited;

  IVerInactivosOn.Visible := not(IVerInactivosOn.Visible);
  IVerInactivosOff.Visible := not(IVerInactivosOff.Visible);

  CBAnimalesActivos.Checked := true;
  CheckClick(CBAnimalesActivos);

end;

procedure TFExpDeps.JvComplejosClick(Sender: TObject);
begin
  inherited;

  if (RGBusqueda.ItemIndex <> 2) then
    JvComplejos.Collapsed := true
  else
    JvComplejos.Collapsed := false;
end;

procedure TFExpDeps.RBAngusClick(Sender: TObject);
begin
  inherited;

  RGRaza.ItemIndex := 0;
  RGRazaClick(RGRaza);
end;

procedure TFExpDeps.RBBrangusClick(Sender: TObject);
begin
  inherited;

  RGRaza.ItemIndex := 1;
  RGRazaClick(RGRaza);
end;

procedure TFExpDeps.RBBrafordClick(Sender: TObject);
begin
  inherited;

  RGRaza.ItemIndex := 2;
  RGRazaClick(RGRaza);
end;

procedure TFExpDeps.RBHerefordClick(Sender: TObject);
begin
  inherited;

  RGRaza.ItemIndex := 3;
  RGRazaClick(RGRaza);
end;

procedure TFExpDeps.ICambiarRazaPredomClick(Sender: TObject);
var F : TFSelectorRazasPredom;
begin

  F := TFSelectorRazasPredom.Create(self);
  F.ShowModal;
  F.Destroy;

  ConfiguracionRaza;

//  SeleccionarRazaPredom;

end;

end.
