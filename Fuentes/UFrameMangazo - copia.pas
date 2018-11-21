unit UFrameMangazo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Grids, DBGrids,
  UBDBGrid, DB, IBCustomDataSet, IBQuery, UDBLookupComboBoxAuto, Mask,
  UDBEditAuto, ActnList, CheckLst, IBUpdateSQL, UDBControl, UDMSoftvet,
  DBClient, DBLocal, DBLocalI, EditAuto, JvExExtCtrls, JvExtComponent,
  JvRollOut, StrUtils, ComboBoxAuto, TypInfo, jpeg, JvImage, PngImage;

type
  TRegParametrosPersonalizados = record
    Campo : String;
    Valor : Variant;
  end;

  TRegParametros = Record
    query : string;
    en_uso : boolean;
    valor1 : String;
    valor2 : String;
  end;

  TRegFiltros = Record
    Componentes : Array of TControl;
    Unico : boolean;
  end;

  TFiltros = Array of TRegFiltros;

  TParametros = Array of TRegParametros;

  TMangazo = class(TFrame)
    IBQAnimales: TIBQuery;
    IBQPotrero: TIBQuery;
    IBQGrupo: TIBQuery;
    IBQRodeo: TIBQuery;
    DSAnimales: TDataSource;
    DSPotrero: TDataSource;
    DSGrupo: TDataSource;
    DSRodeo: TDataSource;
    GBFiltro: TGroupBox;
    RBPotrero: TRadioButton;
    RBAnimales: TRadioButton;
    RBGrupo: TRadioButton;
    RBRodeo: TRadioButton;
    DBEAnimal: TEdit;
    DBLCBGrupo: TDBLookupComboBoxAuto;
    DBLCBRodeo: TDBLookupComboBoxAuto;
    PSeleccion: TPanel;
    GBDisponibles: TGroupBox;
    GBSeleccionados: TGroupBox;
    PTransferencia: TPanel;
    BBAgregarTodos: TBitBtn;
    BBAgregarUno: TBitBtn;
    BBEliminarUno: TBitBtn;
    BBEliminarTodos: TBitBtn;
    DSDisponibles: TDataSource;                   
    DSSeleccionados: TDataSource;
    IBQDisponibles: TIBQuery;
    IBQSeleccionados: TIBQuery;
    IBUSQLIntercambiarIzq: TIBUpdateSQL;
    BDBGDisponibles: TBitDBGrid;
    BDBGSeleccionados: TBitDBGrid;
    IBUSQLIntercambiarDer: TIBUpdateSQL;
    IBQDisponiblesGrupos: TIBQuery;
    RBTodas: TRadioButton;
    DBLCBCategoria: TDBLookupComboBoxAuto;
    LCategoria: TLabel;
    IBQCatAnimales: TIBQuery;
    DSCatAnimales: TDataSource;
    DBLCBPotrero: TDBLookupComboBoxAuto;
    JvROBusquedaAvanzada: TJvRollOut;
    GBFiltros: TGroupBox;
    CBCircEsc: TCheckBox;
    CBCantPartos: TCheckBox;
    CBAnios: TCheckBox;
    EHastaAnios: TEdit;
    CBPeso: TCheckBox;
    CBFrame: TCheckBox;
    ComboAreaPelvica: TComboBox;
    CBAreaPelvica: TCheckBox;
    DBLCBACondCorp: TDBLookupComboBoxAuto;
    CBCondCorp: TCheckBox;
    DBLCBAGDR: TDBLookupComboBoxAuto;
    CBGDR: TCheckBox;
    DBLCBACronoDent: TDBLookupComboBoxAuto;
    CBCronoDent: TCheckBox;
    CBRaza: TCheckBox;
    DBLCBARaza: TDBLookupComboBoxAuto;
    CBEstadoReproductivo: TCheckBox;
    DBLCBAEstadoRepro: TDBLookupComboBoxAuto;
    CBPreniesRobo: TCheckBox;
    DBLCBARechazo: TDBLookupComboBoxAuto;
    CBEdad: TCheckBox;
    ECantPartos: TEdit;
    CBCapServ: TCheckBox;
    CBExamenClinico: TCheckBox;
    DBLCBAExamenClinico: TDBLookupComboBoxAuto;
    CBCalidadSemen: TCheckBox;
    DBLCBACalidadSemen: TDBLookupComboBoxAuto;
    DBLCBACapServ: TDBLookupComboBoxAuto;
    IBQRechazo: TIBQuery;
    DSRechazo: TDataSource;
    IBQExamenClinico: TIBQuery;
    DSExamenClinico: TDataSource;
    IBQCalidadSEminal: TIBQuery;
    DSCalidadSeminal: TDataSource;
    CBPotrero: TCheckBox;
    CBRodeo: TCheckBox;
    CBGrupo: TCheckBox;
    CBCategoria: TCheckBox;
    CBAnimal: TCheckBox;
    IBQCondCorp: TIBQuery;
    DSCondCorp: TDataSource;
    CBRechazo: TCheckBox;
    CBPreservicio: TCheckBox;
    CBAptas: TComboBox;
    CBDiasParto: TCheckBox;
    CBDiasCelo: TCheckBox;
    RGOrden: TRadioGroup;
    CBATipoIdentificador: TComboBoxAuto;
    CBSubcategoria: TCheckBox;
    DBLCBASubcategoria: TDBLookupComboBoxAuto;
    IFondo: TImage;
    IFondoSel: TImage;
    IFondoDis: TImage;
    CBxRaza: TComboBox;
    CBxColor: TComboBox;
    CBxTipoRegistro: TComboBox;
    CBxPotrero: TComboBox;
    CBxRodeo: TComboBox;
    CBxGrupo: TComboBox;
    CBxCategoria: TComboBox;
    EBuscarAnimal: TEdit;
    LBuscarAnimales: TLabel;
    CBxCondicionCorporal: TComboBox;
    CBxCalidadSeminal: TComboBox;
    CBxCapacidadServicio: TComboBox;
    CBxEstadoReproductivo: TComboBox;
    CBxCronologiaDentaria: TComboBox;
    CBxExamenClinico: TComboBox;
    CBxPreservicio: TComboBox;
    CBxAreaPelvica: TComboBox;
    GBPeso: TGroupBox;
    GBFrame: TGroupBox;
    GBNacidosEntre: TGroupBox;
    EDesdeAnios: TEdit;
    CBxCantidadPartos: TComboBox;
    GBDiasAlParto: TGroupBox;
    GBDiasAlCelo: TGroupBox;
    GBCircunferenciaEscrotal: TGroupBox;
    LDesdePeso: TLabel;
    EDesdePeso: TEdit;
    EHastaPeso: TEdit;
    LDesdeFrame: TLabel;
    EDesdeFrame: TEdit;
    LHastaFrame: TLabel;
    EHastaFrame: TEdit;
    LHastaCircEsc: TLabel;
    LDiasCeloDesde: TLabel;
    EHastaCircEsc: TEdit;
    EDiasCeloHasta: TEdit;
    LDesdeCircEsc: TLabel;
    EDesdePartos: TEdit;
    LDiasCeloHasta: TLabel;
    EHastaPartos: TEdit;
    LDesdePartos: TLabel;
    EDesdeCircEsc: TEdit;
    LHastaPartos: TLabel;
    EDiasCeloDesde: TEdit;
    LHastaPeso: TLabel;
    IBQColor: TIBQuery;
    IBQParametros: TIBQuery;
    LDesdeAnios: TLabel;
    LHastaAnios: TLabel;
    EEdadDesde: TEdit;
    EEdadHasta: TEdit;
    IBQCantidadPartos: TIBQuery;
    IBuscarAnimal: TImage;
    JvIBotonBuscar: TJvImage;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    EADesdeDia: TEdit;
    EADesdeMes: TEdit;
    EADesdeAnio: TEdit;
    EAHastaDia: TEdit;
    EAHastaMes: TEdit;
    EAHastaAnio: TEdit;
    GBSeparadorDesde: TGroupBox;
    LSeparadorDesde: TLabel;
    GBSeparadorHasta: TGroupBox;
    LSeparadorHasta: TLabel;
    Panel1: TPanel;
    procedure RBAnimalesClick(Sender: TObject);
    procedure RBGrupoClick(Sender: TObject);
    procedure BBAgregarTodosClick(Sender: TObject);
    procedure BBAgregarUnoClick(Sender: TObject);
    procedure BBEliminarUnoClick(Sender: TObject);
    procedure BBEliminarTodosClick(Sender: TObject);
    procedure FiltroCategoriaClick(Sender: TObject);
    procedure FiltroGruposClick(Sender: TObject);
    procedure BDBGDisponiblesCellClick(Column: TColumn);
    procedure BDBGSeleccionadosCellClick(Column: TColumn);
    procedure RBTodasClick(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure DBLCBGrupoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure IBQSeleccionadosAfterPost(DataSet: TDataSet);
    procedure BDBGDisponiblesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGDisponiblesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGSeleccionadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGSeleccionadosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBClick(Sender: TObject);
    procedure DBLCBACloseUp(Sender: TObject);
    procedure EChange(Sender: TObject);
    procedure IBQRechazoAfterOpen(DataSet: TDataSet);
    procedure DBLCBKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGOrdenClick(Sender: TObject);
    procedure CBATipoIdentificadorChange(Sender: TObject);
    procedure DBLCBARazaCloseUp(Sender: TObject);
    procedure CBRazaClick(Sender: TObject);
    procedure CBxRazaCloseUp(Sender: TObject);
    procedure CBxRazaChange(Sender: TObject);
    procedure CBxColorChange(Sender: TObject);
    procedure CBxColorCloseUp(Sender: TObject);
    procedure CBxTipoRegistroChange(Sender: TObject);
    procedure CBxTipoRegistroCloseUp(Sender: TObject);
    procedure CBxPotreroCloseUp(Sender: TObject);
    procedure CBxPotreroChange(Sender: TObject);
    procedure CBxRodeoChange(Sender: TObject);
    procedure CBxRodeoCloseUp(Sender: TObject);
    procedure CBxGrupoChange(Sender: TObject);
    procedure CBxCronologiaDentariaChange(Sender: TObject);
    procedure CBxCronologiaDentariaCloseUp(Sender: TObject);
    procedure CBxCondicionCorporalChange(Sender: TObject);
    procedure CBxCondicionCorporalCloseUp(Sender: TObject);
    procedure CBxEstadoReproductivoChange(Sender: TObject);
    procedure CBxEstadoReproductivoCloseUp(Sender: TObject);
    procedure CBxGrupoCloseUp(Sender: TObject);
    procedure CBxCategoriaCloseUp(Sender: TObject);
    procedure CBxCategoriaChange(Sender: TObject);
    procedure CBxPreservicioChange(Sender: TObject);
    procedure CBxPreservicioCloseUp(Sender: TObject);
    procedure CBxCantidadPartosChange(Sender: TObject);
    procedure CBxCantidadPartosCloseUp(Sender: TObject);
    procedure CBxCalidadSeminalChange(Sender: TObject);
    procedure CBxCalidadSeminalCloseUp(Sender: TObject);
    procedure CBxExamenClinicoChange(Sender: TObject);
    procedure CBxExamenClinicoCloseUp(Sender: TObject);
    procedure CBxCapacidadServicioChange(Sender: TObject);
    procedure CBxCapacidadServicioCloseUp(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
    procedure CBxAreaPelvicaChange(Sender: TObject);
    procedure CBxAreaPelvicaCloseUp(Sender: TObject);
    procedure IBuscarAnimalClick(Sender: TObject);
    procedure EDesdePesoChange(Sender: TObject);
    procedure EHastaPesoChange(Sender: TObject);
    procedure EDesdeFrameChange(Sender: TObject);
    procedure EHastaFrameChange(Sender: TObject);
    procedure EDiasCeloDesdeChange(Sender: TObject);
    procedure EDiasCeloHastaChange(Sender: TObject);
    procedure EDesdePartosChange(Sender: TObject);
    procedure EHastaPartosChange(Sender: TObject);
    procedure EDesdeCircEscChange(Sender: TObject);
    procedure EHastaCircEscChange(Sender: TObject);
    procedure DTPDesdeCloseUp(Sender: TObject);
    procedure DTPHastaCloseUp(Sender: TObject);
    procedure EADesdeDiaChange(Sender: TObject);
    procedure EADesdeMesChange(Sender: TObject);
    procedure EADesdeAnioChange(Sender: TObject);
    procedure EAHastaDiaChange(Sender: TObject);
    procedure EAHastaMesChange(Sender: TObject);
    procedure EAHastaAnioChange(Sender: TObject);
    procedure EADesdeDiaKeyPress(Sender: TObject; var Key: Char);
    procedure EADesdeMesKeyPress(Sender: TObject; var Key: Char);
    procedure EADesdeAnioKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaDiaKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaMesKeyPress(Sender: TObject; var Key: Char);
    procedure EAHastaAnioKeyPress(Sender: TObject; var Key: Char);
    procedure EBuscarAnimalKeyPress(Sender: TObject; var Key: Char);
  private
    ArrParametrosPersonalizados : Array of TRegParametrosPersonalizados;
    FEvento : Integer;
    FOnSelectItem :TNotifyEvent;
    FSQLBasico : string;
    StringSQL : String;
    FEsSimple : Boolean;
    ConWhere  : Boolean;
    staticSexo : integer;
    ind:integer;
    apretado:boolean;
    FOnSaveChange : TNotifyEvent;
    EjecutarOnClick : procedure(Sender : TObject);
    Parametros : TParametros;
    Filtros : TFiltros;
    ActivarAdicionales : Boolean;

    procedure Inic_Parametros();

    procedure ArmarSQL();

    function ArmarFecha(id : integer) : string;

    procedure VisualizarComponentes;
    
    procedure ActivarFiltrosAdicionales(Categoria: Integer);

    function GetEsSimple: boolean;
    procedure SetEsSimple(Value: boolean);
    procedure SeleccionarCampos;
    procedure DeSeleccionarCampos;
    procedure EliminarYaSeleccionados;
    procedure EliminarYaSeleccionadosGrupos;
    procedure OrdenarGrillaSeleccionados;
    procedure ActualizarCantidadAnimales;
    procedure OrdenarGrillaDisponibles;
    procedure EjecutarEventoSave;
    function BuscarComponente() : integer;
    procedure ParametrosPersonalizados();
    procedure ReiniciarFiltros();
    procedure AcomodarColumnas();
    procedure InicTiposIdentificadores();


    procedure CargarCombos(ibq : TIBQuery; text : string; combo : TComboBox; param : string);
    procedure InicializarCombos;
    procedure DistribuirComponentes;
    function RetornarValor(Sender : TObject) : integer;

    procedure ChequearPrimeraFecha;
    procedure ChequearSegundaFecha;

    procedure ReSetearFiltros;

  public
    Vista : String;
    ConJoin : boolean;
    FCantidadSeleccionados:integer;
    FilCargados : boolean;
    procedure PasarParametros(sexo, filtro : integer);//cambie codigo
    procedure ActivarRequerido;
    procedure ControlarBotones;
    procedure ActivarQuery;
    procedure DesActivarQuery;
    procedure ActualizarLosQuery;
    function hay_animales():boolean;
    procedure sacarAnimalDeSeleccionados(id_animal:integer);
    function PuedeGrabar: boolean;
    procedure SetOnSaveChange(Value: TNotifyEvent);
    procedure ActualizarCategoria(categoria : Integer);//agregue codigo
    procedure AgregarParametros(Valores : Array of String);
    procedure EliminarParametros(Valores : Array of String);
    procedure AgregarValorParametro(Parametro : String; Valor : Variant);
    procedure EjecutarSQL();
    procedure HabilitarComponentesVersionBasica;
    procedure Inic_Filtros(); 

  published
    property OnSelectItem: TNotifyEvent read FOnSelectItem write FOnSelectItem;
    property EsSimple: Boolean read GetEsSimple write SetEsSimple;
    property SQLBasico: string read FSQLBasico write FSQLBasico;
    property Evento: Integer read FEvento write FEvento;
  end;

implementation

uses UPrincipal, UCartel, UAvanceTerminar, UMensajeHuella, UTraduccion, UEveIdentificacion, UEveImportarPartosNacimientos, UAbmGruposNuevo;

var DelRaza, DelColor, DelCategoria, DelGrupo, DelPotrero, DelRodeo, DelTR, DelArPel, DelCalSem, DelCanPar, DelCapSer, DelConCor, DelCroDen, DelEstRep, DelExaCli, DelPre : boolean;
    fecha_D_OK, fecha_H_OK : boolean;
    cantDD, cantMD, cantAD, cantDH, cantMH, cantAH : integer;


{$R *.dfm}

procedure TMangazo.Inic_Parametros();
var
  i : integer;
begin

  ActivarAdicionales := false;
  for i := 1 to 27 do //Son 26 parametros en total
  begin
    SetLength(Parametros,i+1);
    SetLength(Filtros,i+1);
    Parametros[i].en_uso := false;
    case i of
      27 : begin
              if (ConJoin) then
                Parametros[i].query := ' AND (TA.Color = :Color) '
              else
                Parametros[i].query := ' AND (Color = :Color) ';
              Parametros[i].valor1 := 'Color';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxColor; //DBLCBPotrero;
           end;
      16 : begin
              if (ConJoin) then
                Parametros[i].query := ' AND (TA.Potrero = :Potrero) '
              else
                Parametros[i].query := ' AND (Potrero = :Potrero) ';
              Parametros[i].valor1 := 'Potrero';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxPotrero; //DBLCBPotrero;
           end;
      17 : begin
              if (ConJoin) then
                Parametros[i].query := ' AND (TA.Rodeo = :Rodeo) '
              else
                Parametros[i].query := ' AND (Rodeo = :Rodeo) ';
              Parametros[i].valor1 := 'Rodeo';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxRodeo; //DBLCBRodeo;
           end;
      18 : begin
              if (ConJoin) then
                Parametros[i].query := ' AND (TA.Categoria = :Categoria) '
              else
                Parametros[i].query := ' AND (Categoria = :Categoria) ';
              Parametros[i].valor1 := 'Categoria';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxCategoria; //DBLCBCategoria;
           end;
      4 : begin
              if (ConJoin) then
                Parametros[i].query := ' AND (TA.Estado_Lactacion = :CantidadPartos) '
              else
                Parametros[i].query := ' AND (Estado_Lactacion = :CantidadPartos) ';
              Parametros[i].valor1 := 'CantidadPartos';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := ECantPartos;
          end;
      3 : begin
              if (ConJoin) then
                Parametros[i].query := ' AND ((CURRENT_DATE - TA.Fecha_nacimiento)/30 Between :EdadMesesDesde and :EdadMesesHasta) '
              else
                Parametros[i].query := ' AND ((CURRENT_DATE - Fecha_nacimiento)/30 Between :EdadMesesDesde and :EdadMesesHasta) ';
              Parametros[i].valor1 := 'EdadMesesDesde';
              Parametros[i].valor2 := 'EdadMesesHasta';
              Filtros[i].Unico := false;
              SetLength(Filtros[i].Componentes,4);
              Filtros[i].Componentes[0] := EEdadDesde;
              Filtros[i].Componentes[1] := EEdadHasta;
              Filtros[i].Componentes[2] := LDesdeAnios;
              Filtros[i].Componentes[3] := LHastaAnios;
          end;
      20 : begin
              if (ConJoin) then
                Parametros[i].query := ' AND ((Ta.Fecha_nacimiento >= :AniosIni) and (TA.Fecha_nacimiento <= :AniosFin))'
              else
                Parametros[i].query := ' AND ((Fecha_nacimiento >= :AniosIni) and (Fecha_nacimiento <= :AniosFin))';
              Parametros[i].valor1 := 'AniosIni';
              Parametros[i].valor2 := 'AniosFin';
              Filtros[i].Unico := false;
              SetLength(Filtros[i].Componentes,4);
              Filtros[i].Componentes[0] := EDesdeAnios;
              Filtros[i].Componentes[1] := EHastaAnios;
              Filtros[i].Componentes[2] := LDesdeAnios;
              Filtros[i].Componentes[3] := LHastaAnios;
           end;
      1 : begin
            if (ConJoin) then
              Parametros[i].query := ' AND (Ta.Peso Between :PesoIni and :PesoFin) '
            else
              Parametros[i].query := ' AND (Peso Between :PesoIni and :PesoFin) ';
            Parametros[i].valor1 := 'PesoIni';
            Parametros[i].valor2 := 'PesoFin';
            Filtros[i].Unico := false;
            SetLength(Filtros[i].Componentes,4);
            Filtros[i].Componentes[0] := EDesdePeso;
            Filtros[i].Componentes[1] := EHastaPeso;
            Filtros[i].Componentes[2] := LDesdePeso;
            Filtros[i].Componentes[3] := LHastaPeso;
          end;
      2 : begin
            if (ConJoin) then
              Parametros[i].query := ' AND (Ta.Frame Between :FrameIni and :FrameFin) '
            else
              Parametros[i].query := ' AND (Frame Between :FrameIni and :FrameFin) ';
            Parametros[i].valor1 := 'FrameIni';
            Parametros[i].valor2 := 'FrameFin';
            Filtros[i].Unico := false;
            SetLength(Filtros[i].Componentes,4);
            Filtros[i].Componentes[0] := EDesdeFrame;
            Filtros[i].Componentes[1] := EHastaFrame;
            Filtros[i].Componentes[2] := LDesdeFrame;
            Filtros[i].Componentes[3] := LHastaFrame;
          end;
      5 : begin
            if (ConJoin) then
              Parametros[i].query := ' AND (Ta.Circunferencia_Escrotal Between :CircIni and :CircFin) '
            else
              Parametros[i].query := ' AND (Circunferencia_Escrotal Between :CircIni and :CircFin) ';
            Parametros[i].valor1 := 'CircIni';
            Parametros[i].valor2 := 'CircFin';
            Filtros[i].Unico := false;
            SetLength(Filtros[i].Componentes,4);
            Filtros[i].Componentes[0] := EDesdeCircEsc;
            Filtros[i].Componentes[1] := EHastaCircEsc;
            Filtros[i].Componentes[2] := LDesdeCircEsc;
            Filtros[i].Componentes[3] := LHastaCircEsc;
          end;
      6 : begin
            if (ConJoin) then
              Parametros[i].query := ' AND (Ta.Condicion_Corporal = :CondicionCorporal) '
            else
              Parametros[i].query := ' AND (Condicion_Corporal = :CondicionCorporal) ';
            Parametros[i].valor1 := 'CondicionCorporal';
            Filtros[i].Unico := true;
            SetLength(Filtros[i].Componentes,1);
            Filtros[i].Componentes[0] := CBxCondicionCorporal;
          end;
      7 : begin
            if (ConJoin) then
              Parametros[i].query := ' AND (Ta.Cronologia_dentaria = :CronologiaDentaria) '
            else
              Parametros[i].query := ' AND (Cronologia_dentaria = :CronologiaDentaria) ';
            Parametros[i].valor1 := 'CronologiaDentaria';
            Filtros[i].Unico := true;
            SetLength(Filtros[i].Componentes,1);
            Filtros[i].Componentes[0] := CBxCronologiaDentaria;
          end;
      8 : begin
            if (ConJoin) then
              Parametros[i].query := ' AND (Ta.Raza = :Raza) '
            else
              Parametros[i].query := ' AND (Raza = :Raza) ';
            Parametros[i].valor1 := 'Raza';
            Filtros[i].Unico := true;
            SetLength(Filtros[i].Componentes,1);
            Filtros[i].Componentes[0] := CBxRaza;
          end;
      14 : begin
              if (ConJoin) then
                Parametros[i].query := ' AND (Ta.GDR = :GDR) '
              else
                Parametros[i].query := ' AND (GDR = :GDR) ';
              Parametros[i].valor1 := 'GDR';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := DBLCBAGDR;
           end;
      15 : begin
              if (ConJoin) then
                Parametros[i].query := ' AND (Ta.Estado_Reproductivo = :EstadoReproductivo) '
              else
                Parametros[i].query := ' AND (Estado_Reproductivo = :EstadoReproductivo) ';
              Parametros[i].valor1 := 'EstadoReproductivo';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxEstadoReproductivo;
           end;
      21 : begin
              if (ConJoin) then
                Parametros[i].query := ' AND ((TA.ID_RP like :RP_HASTA10) OR (TA.ID_HBA like :RP_HASTA10) OR (Ta.ID_SENASA like :RP_HASTA10) OR (TA.NOMBRE like :RP) OR (TA.APODO like :RP))'
              else
                Parametros[i].query := ' AND ((ID_RP like :RP_HASTA10) OR (ID_HBA like :RP_HASTA10) OR (ID_SENASA like :RP_HASTA10) OR (NOMBRE like :RP) OR (APODO like :RP))';
              Parametros[i].valor1 := 'RP';
              Parametros[i].valor2 := 'RP_HASTA10';
              Filtros[i].Unico := false;
              SetLength(Filtros[i].Componentes,2);
              Filtros[i].Componentes[0] := EBuscarAnimal;
              Filtros[i].Componentes[1] := EBuscarAnimal;
           end;
      9 : begin
              Parametros[i].query := ' AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''CS'',:CapServ,NULL) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'CapServ';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxCapacidadServicio;
          end;
      10 : begin
              Parametros[i].query := ' AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''EC'',:ExamenClinico,NULL) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'ExamenClinico';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxExamenClinico;
          end;
      11 : begin
              Parametros[i].query := ' AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''SM'',:CalidadSeminal,NULL) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'CalidadSeminal';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxCalidadSeminal;
           end;
      13 : begin
              Parametros[i].query := ' AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''AP'',:AreaPelvica,NULL) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'AreaPelvica';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxAreaPelvica;
          end;
      22 : begin
              Parametros[i].query := ' AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''RR'',:Rechazo,NULL) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'Rechazo';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := DBLCBARechazo;
          end;
      12 : begin
              Parametros[i].query := ' AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''PR'',:PrenesRobo,NULL) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'PrenesRobo';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBPreniesRobo;
          end;
      19 : begin
              Parametros[i].query := ' AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''GR'',:Grupo,NULL) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'Grupo';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxGrupo;
          end;
      23 : begin
              Parametros[i].query := ' AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''AS'',:Preserv,NULL) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'Preserv';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBAptas;
          end;
      24 : begin
              Parametros[i].query := ' AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''DP'',:DesdeP,:HastaP) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'DesdeP';
              Parametros[i].valor2 := 'HastaP';
              Filtros[i].Unico := false;
              SetLength(Filtros[i].Componentes,4);
              Filtros[i].Componentes[0] := EDesdePartos;
              Filtros[i].Componentes[1] := EHastaPartos;
              Filtros[i].Componentes[2] := LDesdePartos;
              Filtros[i].Componentes[3] := LHastaPartos;
          end;
      25 : begin
              Parametros[i].query := ' AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''DC'',:DiasCeloDesde,:DiasCeloHasta) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'DiasCeloDesde';
              Parametros[i].valor2 := 'DiasCeloHasta';
              Filtros[i].Unico := false;
              SetLength(Filtros[i].Componentes,4);
              Filtros[i].Componentes[0] := EDiasCeloDesde;
              Filtros[i].Componentes[1] := EDiasCeloHasta;
              Filtros[i].Componentes[2] := LDiasCeloDesde;
              Filtros[i].Componentes[3] := LDiasCeloHasta;
          end;
      26 : begin
              Parametros[i].query := 'AND EXISTS(SELECT Resultado FROM SP_FILTROS_MANGAZO(:Establecimiento,'+Vista+'.id_animal,''SC'',:SubCategoria,NULL) WHERE Resultado = ''S'')';
              Parametros[i].valor1 := 'SubCategoria';
              Filtros[i].Unico := true;
              SetLength(Filtros[i].Componentes,1);
              Filtros[i].Componentes[0] := CBxTipoRegistro;
          end;
    end;
  end;
end;

procedure TMAngazo.Inic_Filtros;
var
  Comp : TComponent;
  indComp, I, IG : Integer;
  d : Double;
begin
  try

    IBQRodeo.Close;
    IBQRodeo.ParamByName('id_establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQRodeo.Open;

    IBQPotrero.Close;
    IBQPotrero.ParamByName('id_establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQPotrero.Open;

    IBQCondCorp.Close;
    IBQCondCorp.SQL.Clear;
    IBQCondCorp.SQL.Add('Select ID_CONDICION_CORPORAL, '+FPrincipal.StringEscalaCC+' as escala from COD_CONDICIONES_CORPORALES');
    IBQCondCorp.Open;

    DMSoftvet.IBQCronologiaDentaria.Close;
    DMSoftvet.IBQCronologiaDentaria.Open;

    DMSoftvet.IBQRaza.Close;
    DMSoftvet.IBQRaza.Open;

    DMSoftvet.IBQEstadoReproductivo.Close;
    DMSoftvet.IBQEstadoReproductivo.Open;

    DMSoftvet.IBQValorCapacidad.Close;
    DMSoftvet.IBQValorCapacidad.Open;

    IBQExamenClinico.Close;
    IBQExamenClinico.Open;

    IBQCalidadSeminal.Close;
    IBQCalidadSeminal.Open;

    IBQGrupo.Close;
    IBQGrupo.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
    IBQGrupo.Open;

    IBQColor.Close;
    IBQColor.Open;

    IBQCantidadPartos.Close;
    IBQCantidadPartos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQCantidadPartos.Open;

    if not(FilCargados) then
    begin
      CargarCombos(IBQRodeo,'(TODOS)',CBxRodeo,'nombre');
      CargarCombos(IBQPotrero,'(TODOS)',CBxPotrero,'nombre');
    end;

    IBQParametros.Close;
    IBQParametros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQParametros.ParamByName('param').AsInteger := 3; //Codigo de la condicion corporal
    IBQParametros.Open;

    if not(FilCargados) then
    begin
      CargarCombos(IBQCondCorp,'(TODAS)',CBxCondicionCorporal,'escala');

      CargarCombos(DMSoftvet.IBQCronologiaDentaria,'(TODAS)',CBxCronologiaDentaria,'sinonimo');
      CargarCombos(DMSoftvet.IBQRaza,'(TODAS)',CBxRaza,'sinonimo');
      CargarCombos(DMSoftvet.IBQEstadoReproductivo,'(TODOS)',CBxEstadoReproductivo,'nombre');
      CargarCombos(DMSoftvet.IBQValorCapacidad,'(TODOS)',CBxCapacidadServicio,'sinonimo');
      CargarCombos(IBQExamenClinico,'(TODOS)',CBxExamenClinico,'valor');
      CargarCombos(IBQCalidadSEminal,'(TODAS)',CBxCalidadSeminal,'valor');
      CargarCombos(IBQGrupo,'(TODOS)',CBxGrupo,'nombre');
      CargarCombos(IBQColor,'(TODOS)',CBxColor,'nombre');

      CargarCombos(IBQCatAnimales,'(TODAS)',CBxCategoria,'sinonimo');

      CargarCombos(IBQCantidadPartos,'(TODOS)',CBxCantidadPartos,'estado_lactacion');
    end;

    Inic_Parametros;
    ReiniciarFiltros;
    InicializarCombos;
    CBxColor.Enabled := false;
    JvROBusquedaAvanzada.Collapse;
    VisualizarComponentes;
    AcomodarColumnas;

    if FPrincipal.FuncDEPs then
    begin
      LBuscarAnimales.Caption := 'Rp / SENASA / HBA / Nombre / Apodo';
      BDBGDisponibles.Columns[1].Visible := true;
      BDBGDisponibles.Columns[2].Visible := true;
      BDBGSeleccionados.Columns[1].Visible := true;
      BDBGSeleccionados.Columns[2].Visible := true;
    end
    else
    begin
      LBuscarAnimales.Caption := 'Rp / SENASA';
      BDBGDisponibles.Columns[1].Visible := false;
      BDBGDisponibles.Columns[2].Visible := false;
      BDBGSeleccionados.Columns[1].Visible := false;
      BDBGSeleccionados.Columns[2].Visible := false;
    end;

    fecha_D_OK := false;
    fecha_H_OK := false;
  except

  end;
end;

procedure TMangazo.ArmarSQL();
var
  Indice : Integer;
begin
  StringSQL := FSQLBasico;
  if not ConWhere then
    StringSQL := StringSQL+' WHERE (Establecimiento = :Establecimiento) and id_animal not in (select id_animal from aux_animales where id_animal > 0) '
  else
    StringSQL := StringSQL+ ' AND (Establecimiento = :Establecimiento) and id_animal not in (select id_animal from aux_animales where id_animal > 0) ';
  for Indice := 1 to Length(Parametros)-1 do
    if Parametros[Indice].en_uso then
      StringSQL := StringSQL+Parametros[Indice].query;
  if FEvento > -1 then
    StringSQL := StringSQL + 'AND (Exists(select first 1 id_evento from eve_eventos where animal = '+Vista+'.id_animal and tipo = '+IntToStr(FEvento)+' and establecimiento = :establecimiento and disparador is null)) ';
  if RGOrden.ItemIndex = 0 then
    StringSQL := StringSQL+' ORDER BY ID_RP ASC'
  else
    StringSQL := StringSQL+' ORDER BY (SELECT NUMERO FROM OBTENER_ENTERO('+Vista+'.ID_RP)) ASC';
end;

procedure TMangazo.EjecutarSQL();
var
  Indice, aux, max, valor_aux : Integer;
  Valor1, Valor2 : Variant;
  Valor_I : Integer;
  Valor_S : String;
  cartel: TCartel;
  msje: String;
begin

  if not FPrincipal.FuncDEPs then
  begin
    BDBGDisponibles.Columns[1].Visible := false;
    BDBGDisponibles.Columns[2].Visible := false;
    BDBGSeleccionados.Columns[1].Visible := false;
    BDBGSeleccionados.Columns[2].Visible := false;

    CBxTipoRegistro.Visible := false;
  end;

  try
    FrameEnter(nil);
    ArmarSQL();
    IBQDisponibles.Close;
    IBQDisponibles.SQL.Clear;
    IBQDisponibles.SQL.Add(StringSQL);
    IBQDisponibles.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    for Indice := 1 to Length(Parametros)-1 do
      if Parametros[Indice].en_uso then
      begin
        if Filtros[Indice].Unico then
        begin
          if (Filtros[Indice].Componentes[0] is TComboBox) then
          begin
            valor_aux := RetornarValor(Filtros[Indice].Componentes[0]);
            
            if (valor_aux = -2) then
              valor1 := 1
            else
              if (valor_aux = -3) then
                valor1 := 2
              else
                valor1 := valor_aux;
                
            if Valor1 = -1 then Valor1 := 0;
          end;

          if (Filtros[Indice].Componentes[0] is TCheckBox) then
            if (Filtros[Indice].Componentes[0] as TCheckBox).Checked then
              Valor1 := 1
            else
              Valor1 := 0;
          if (Filtros[Indice].Componentes[0] is TEdit) then
          begin
              if TryStrToInt((Filtros[Indice].Componentes[0] as TEdit).Text,aux) then
                Valor1 := aux
              else
                Valor1 := null;
          end;
          if (Filtros[Indice].Componentes[0] is TDBLookUpComboBoxAuto) then
          begin
            VarClear(Valor1);
            Valor_S := '';
            Valor_I := -1;
            if VarType((Filtros[Indice].Componentes[0] as TDBLookupComboBoxAuto).KeyValue) = varString then
              Valor_S := (Filtros[Indice].Componentes[0] as TDBLookupComboBoxAuto).KeyValue
            else if VarType((Filtros[Indice].Componentes[0] as TDBLookupComboBoxAuto).KeyValue) = varInteger then
                    Valor_I := (Filtros[Indice].Componentes[0] as TDBLookupComboBoxAuto).KeyValue
                 else
                  Valor1 := (Filtros[Indice].Componentes[0] as TDBLookupComboBoxAuto).KeyValue;
            if Valor_S <> '' then
            begin
              if Valor_S = 'A' then Valor1 := 1;
              if Valor_S = 'R' then Valor1 := 2;
            end;
            if Valor_I <> -1 then Valor1 := Valor_I;
          end;
          IBQDisponibles.ParamByName(Parametros[Indice].valor1).Value := Valor1;
        end
        else
        begin
          if (((Filtros[Indice].Componentes[0] as TEdit).Name = 'EDesdeAnios') and ((Filtros[Indice].Componentes[1] as TEdit).Name = 'EHastaAnios')) then
          begin
              Valor1 := StrToDate((Filtros[Indice].Componentes[0] as TEdit).Text);
              Valor2 := StrToDate((Filtros[Indice].Componentes[1] as TEdit).Text);
          end
          else
          begin
            if Indice = 21 then
            begin
              Valor1 := '%'+(Filtros[Indice].Componentes[0] as TEdit).Text+'%';
              Valor2 := '%'+(Filtros[Indice].Componentes[1] as TEdit).Text+'%';
            end
            else
            begin
              if TryStrToInt((Filtros[Indice].Componentes[0] as TEdit).Text,aux) then
                Valor1 := aux
              else
                Valor1 := null;

              if TryStrToInt((Filtros[Indice].Componentes[1] as TEdit).Text,aux) then
                Valor2 := aux
              else
                Valor2 := null;
            end;
          end;
          if Indice = 21 then
          begin
            if FPrincipal.FuncDEPs then
            begin
              if Length(Valor1) >= 10 then
              begin
                IBQDisponibles.ParamByName(Parametros[Indice].valor1).Value := Valor1;
                IBQDisponibles.ParamByName(Parametros[Indice].valor2).Value := null;
              end
              else
              begin
                IBQDisponibles.ParamByName(Parametros[Indice].valor1).Value := Valor1;
                IBQDisponibles.ParamByName(Parametros[Indice].valor2).Value := Valor2;
              end;
            end
            else
            begin
              IBQDisponibles.ParamByName(Parametros[Indice].valor1).Value := Valor1;
              IBQDisponibles.ParamByName(Parametros[Indice].valor2).Value := null;
            end;
          end
          else
          begin
            IBQDisponibles.ParamByName(Parametros[Indice].valor1).Value := Valor1;
            IBQDisponibles.ParamByName(Parametros[Indice].valor2).Value := Valor2;
          end;
        end;
      end;
    ParametrosPersonalizados;

    IBQDisponibles.Open;
    EliminarYaSeleccionados;
    ControlarBotones;
    ActualizarCantidadAnimales;
  except
    on E : Exception do
      MostrarMensaje(tmError,E.Message);
  end;

end;

procedure TMangazo.ParametrosPersonalizados();
var
  I : Integer;
begin
  for I := 0 to Length(ArrParametrosPersonalizados)-1 do
    if IBQDisponibles.Params.FindParam(ArrParametrosPersonalizados[I].Campo) <> nil then
      IBQDisponibles.ParamByName(ArrParametrosPersonalizados[i].Campo).Value := ArrParametrosPersonalizados[I].Valor;
end;

procedure TMangazo.AgregarParametros(Valores : Array of String);
var
  I, K : Integer;
  function ExisteParametro(Valor : String) : Boolean;
  var
    S : Integer;
  begin
    Result := false;
    for S := 0 to Length(ArrParametrosPersonalizados)-1 do
      if UpperCase(ArrParametrosPersonalizados[S].Campo) = UpperCase(Valor) then
      begin
        Result := true;
        break;
      end;
  end;
begin
  I :=  Length(ArrParametrosPersonalizados);
  for K := 0 to Length(Valores)-1 do
    if not ExisteParametro(Valores[K]) then
    begin
      SetLength(ArrParametrosPersonalizados,I+K+1);
      ArrParametrosPersonalizados[I+K].Campo := Valores[K];
      ArrParametrosPersonalizados[I+K].Valor := null;
    end;
end;

procedure TMangazo.AgregarValorParametro(Parametro : String; Valor : Variant);
var
  I : Integer;
begin
  for I := 0 to Length(ArrParametrosPersonalizados)-1 do
    if UpperCase(ArrParametrosPersonalizados[I].Campo) = UpperCase(Parametro) then
    begin
      ArrParametrosPersonalizados[I].Valor := Valor;
      break;
    end;
end;

procedure TMangazo.EliminarParametros(Valores : Array of String);
var
  I, K : Integer;
begin
  for I := 0 to Length(Valores)-1 do
    for K := 0 to Length(ArrParametrosPersonalizados)-1 do
      if (UpperCase(ArrParametrosPersonalizados[K].Campo) = UpperCase(Valores[I])) then
      begin
        ArrParametrosPersonalizados[K].Campo := '-';
        ArrParametrosPersonalizados[K].Valor := null;
        break;
      end;
end;



(*
  Activamos y ponemos como requerido el control seleccionado
*)
Procedure TMangazo.ActivarRequerido;
begin

end;

(*
  Trasladamos los filtros implicitos al frame de intercambio
*)
procedure TMangazo.PasarParametros(sexo,filtro : integer); //cambie codigo puse filtro
begin
  staticSexo := sexo;
  IBQDisponibles.Close;
  IBQDisponiblesGrupos.Close;
  if (filtro < 4) then
   begin
    if ((sexo = 1) Or (sexo = 2)) Then  //uno o el otro
       begin
          IBQCatAnimales.Close;
          IBQCatAnimales.SQL.Clear;
          IBQCatAnimales.SQL.Add('select *  from COD_CATEGORIAS WHERE(TIPO_SEXO = :SEXO)');
          IBQCatAnimales.ParamByName('sexo').AsInteger := sexo;
          IBQCatAnimales.Open;
       end
     else
     if (sexo = 0) then   //todos  hembras y machos
       begin
          IBQCatAnimales.Close;
          IBQCatAnimales.SQL.Clear;
          IBQCatAnimales.SQL.Add('select *  from COD_CATEGORIAS');
          IBQCatAnimales.Open;
       end;
   end
  else //a partir de aca cambie codigo en este metodo
     if (filtro = 4) then //Castracion - Ternero y toro
        begin
          staticSexo := 1;
          IBQCatAnimales.Close;
          IBQCatAnimales.SQL.Clear;
          IBQCatAnimales.SQL.Add('select *  from COD_CATEGORIAS WHERE(TIPO_SEXO = :SEXO) and nombre <> ''NOVILLO''');
          IBQCatAnimales.ParamByName('sexo').AsInteger := 1;
          IBQCatAnimales.Open;
        end
       else
         if (filtro = 5) then // hembras vaquillona y vaca
            begin
              staticSexo := 2;
              IBQCatAnimales.Close;
              IBQCatAnimales.SQL.Clear;
              IBQCatAnimales.SQL.Add('select *  from COD_CATEGORIAS WHERE(TIPO_SEXO = :SEXO) and nombre <> ''TERNERA''');
              IBQCatAnimales.ParamByName('sexo').AsInteger := 2;
              IBQCatAnimales.Open;
            end
          else
           if (filtro = 6) then //  creacion de servicio natural - machos toros
            begin
              staticSexo := 1;
              IBQCatAnimales.Close;
              IBQCatAnimales.SQL.Clear;
              IBQCatAnimales.SQL.Add('select *  from COD_CATEGORIAS WHERE(TIPO_SEXO = :SEXO) and nombre <> ''NOVILLO'' AND nombre <> ''TERNERO''');
              IBQCatAnimales.ParamByName('sexo').AsInteger := 1;
              IBQCatAnimales.Open;
            end
          else
           if (filtro = 7) then //  creacion de servicio natural - machos toros  //AGREGUE CODIGO
            begin
              staticSexo := 1;         //agregue codigo
              IBQCatAnimales.Close;
              IBQCatAnimales.SQL.Clear;
              IBQCatAnimales.SQL.Add('select *  from COD_CATEGORIAS WHERE nombre = ''TERNERO'' OR nombre = ''TERNERA''');
              IBQCatAnimales.Open;
            end
           else
             if (filtro = 8) then // hembras vaquillona
                begin
                  staticSexo := 2;
                  IBQCatAnimales.Close;
                  IBQCatAnimales.SQL.Clear;
                  IBQCatAnimales.SQL.Add('select *  from COD_CATEGORIAS WHERE(TIPO_SEXO = :SEXO) and id_categoria = 5');
                  IBQCatAnimales.ParamByName('sexo').AsInteger := 2;
                  IBQCatAnimales.Open;
                end
               else
                 if (filtro = 9) then // todos menos ternero
                    begin
                      staticSexo := 2;
                      IBQCatAnimales.Close;
                      IBQCatAnimales.SQL.Clear;
                      IBQCatAnimales.SQL.Add('select *  from COD_CATEGORIAS WHERE id_categoria <> 1');
                      IBQCatAnimales.Open;
                    end;
end;

procedure TMangazo.RBAnimalesClick(Sender: TObject);
begin

  ActivarRequerido;
  DBEAnimal.SetFocus;
end;

procedure TMangazo.RBGrupoClick(Sender: TObject);
begin
end;

(*
  Agega todos los items a la grilla de seleccionados.
*)
procedure TMangazo.BBAgregarTodosClick(Sender: TObject);
var i:integer;
    cartel: TCartel;
    msje: String;
    usar_barra : boolean;
begin
  BDBGDisponibles.Hide;
  BDBGSeleccionados.Hide;
  //*/*/*/
  usar_barra := BDBGDisponibles.DataSource.DataSet.RecordCount > 30;
  if usar_barra then
  begin
    FAvanceTerminar:=TFAvanceTerminar.Create(nil);
    FAvanceTerminar.Max := BDBGDisponibles.DataSource.DataSet.RecordCount * 2;
    FAvanceTerminar.Modo := maManga;
    FAvanceTerminar.Update;
    FAvanceTerminar.Pos := 1;
  end;
  //*/*/

  OrdenarGrillaDisponibles;

    BDBGSeleccionados.DataSource:= nil;
    with BDBGDisponibles.DataSource.DataSet do
      begin
      First;
      //for i := RecordCount - 1 downto 0 do begin
      while not Eof do
      begin
        IBQSeleccionados.Insert;
        SeleccionarCampos;
        IBQSeleccionados.Post;
        Delete;
        //*/*/*/
        if usar_barra then
        begin
          FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
          FAvanceTerminar.Update;
          Application.ProcessMessages;
        end;
        //*/*/*/*
      end;

      ControlarBotones;
      IBQDisponibles.First;{Pongo el Cursor al principio de la grilla}
      IBQSeleccionados.First;
      end;

    ControlarBotones;
    IBQDisponibles.Last;
    IBQDisponibles.First;  {Pongo el Cursor al principio de la grilla}
    IBQDisponibles.Last;
    IBQSeleccionados.First;
    BDBGSeleccionados.DataSource := DSSeleccionados;

  ActualizarCantidadAnimales;{Actualizo las Cantidades de Elementos de cada Grilla}
  EjecutarEventoSave;

  //*/*/*/*/*
  if usar_barra then
    FAvanceTerminar.Destroy;

  //*/*/*
  BDBGDisponibles.Show;
  BDBGSeleccionados.Show;
end;

(*
  Agrega un item a la grilla de seleccionados.
*)

function TMangazo.BuscarComponente() : integer;
var
  i : integer;
begin
  i := -1;
  for i := 1 to GBFiltro.ControlCount do
  begin
    if (GBFiltro.Controls[i] is TRadioButton) then
      if (((GBFiltro.Controls[i]) as TRadioButton).Checked) then
      begin
        Result := i;
        break;
      end;
  end;
end;

procedure TMangazo.BBAgregarUnoClick(Sender: TObject);
var
  i, i1  : integer;
  A : TBasicAction;
  bm : TBookmark;
  cartel: TCartel;
  msje : String;
  usar_barra : boolean;
begin

  usar_barra := BDBGDisponibles.SelectedRows.Count > 30;

  if BDBGDisponibles.SelectedRows.Count > 0 then begin
    with BDBGDisponibles.DataSource.DataSet do
      if not(EsSimple) then
        begin
          //*/*/*/
          if usar_barra then
          begin

            FAvanceTerminar:=TFAvanceTerminar.Create(nil);
            FAvanceTerminar.Max := BDBGDisponibles.SelectedRows.Count;
            FAvanceTerminar.Modo := maManga;
            FAvanceTerminar.Update;
            FAvanceTerminar.Pos := 1;
          end;
          //*/*/
          for i := 0 to BDBGDisponibles.SelectedRows.Count -1 do begin
            GotoBookmark(pointer(BDBGDisponibles.SelectedRows.Items[i]));
            IBQSeleccionados.Insert;
            SeleccionarCampos;
            IBQSeleccionados.Post;
            Delete;
            //*/*/*/
            if usar_barra then
            begin
              FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
              FAvanceTerminar.Update;
              Application.ProcessMessages;
            end;
            //*/*/*/*
          end;
        end
      else
        begin
          GotoBookmark(pointer(BDBGDisponibles.SelectedRows.Items[BDBGDisponibles.SelectedRows.Count -1]));
          IBQSeleccionados.Insert;
          SeleccionarCampos;
          IBQSeleccionados.Post;
          Delete;
        end;

  end;

  BDBGDisponibles.SelectedRows.Clear;
  BDBGSeleccionados.SelectedRows.Clear;
  OrdenarGrillaSeleccionados;
  ControlarBotones;
  ActualizarCantidadAnimales;{Actualizo las Cantidades de Elementos de cada Grilla}
  EjecutarEventoSave;{Ejecuta el evento que chequea si se habilita o no el boton terminar.O sea si se permite o no guardar}

  //*/*/*/*/*
  if usar_barra then
    FAvanceTerminar.Destroy;

end;

(*
  Elimina un los item de la grilla de seleccionados.
*)
procedure TMangazo.BBEliminarUnoClick(Sender: TObject);
var
  i : integer;
  cartel: TCartel;
  msje: String;
  usar_barra : boolean;
begin

  usar_barra := BDBGSeleccionados.SelectedRows.Count > 30;
  //*/*/*/
  if usar_barra then
  begin
    FAvanceTerminar := TFAvanceTerminar.Create(nil);
    FAvanceTerminar.Pos := 1;
    FAvanceTerminar.Max := BDBGSeleccionados.SelectedRows.Count;
    FAvanceTerminar.Modo := maManga;
    FAvanceTerminar.Update;
    FAvanceTerminar.Pos := 1;
  end;
  //*/*/

  if (BDBGSeleccionados.SelectedRows.Count > 0) then begin
    with BDBGSeleccionados.DataSource.DataSet do
      for i:=0 to BDBGSeleccionados.SelectedRows.Count-1 do begin
        GotoBookmark(pointer(BDBGSeleccionados.SelectedRows.Items[i]));
        if RBGrupo.Checked then
          IBQDisponiblesGrupos.Insert
         else
          IBQDisponibles.Insert;
        DeSeleccionarCampos;
        IBQSeleccionados.Delete;
        //IBQSeleccionados.Post;
        //*/*/*/
        if usar_barra then
        begin
          FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
          FAvanceTerminar.Update;
          Application.ProcessMessages;
        end;
        //*/*/*/*
      end;
    BDBGDisponibles.SelectedRows.Clear;
    BDBGSeleccionados.SelectedRows.Clear;
    ControlarBotones;

  end;
  OrdenarGrillaDisponibles;
  ControlarBotones;
  ActualizarCantidadAnimales;{Actualizo las Cantidades de Elementos de cada Grilla}
  EjecutarEventoSave;

  //*/*/*/*/*
  if usar_barra then
    FAvanceTerminar.Destroy;
end;

(*
  Elimina todos los items de la grilla de seleccionados.
*)
procedure TMangazo.BBEliminarTodosClick(Sender: TObject);
var
  i:integer;
  cartel: TCartel;
  msje: String;
  usar_barra : boolean;
begin
  BDBGDisponibles.Hide;
  BDBGSeleccionados.Hide;
  usar_barra := BDBGSeleccionados.DataSource.DataSet.RecordCount > 30;
  //*/*/*/
  if usar_barra then
  begin
    FAvanceTerminar := TFAvanceTerminar.Create(nil);
    FAvanceTerminar.Pos := 1;
    FAvanceTerminar.Max := BDBGSeleccionados.DataSource.DataSet.RecordCount * 2;
    FAvanceTerminar.Modo := maManga;

    FAvanceTerminar.Update;
    FAvanceTerminar.Pos := 1;
  end;
  //*/*/

  IBQSeleccionados.Last;
  IBQSeleccionados.First;
  if BDBGSeleccionados.DataSource.DataSet.RecordCount -1 >= 0 then begin
    BDBGSeleccionados.DataSource.DataSet.First;

    while not BDBGSeleccionados.DataSource.DataSet.Eof do begin
      BDBGDisponibles.DataSource.DataSet.Insert;
      DeSeleccionarCampos;
      BDBGSeleccionados.DataSource.DataSet.Delete;
      //*/*/*/
      if usar_barra then
      begin
        FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
        Application.ProcessMessages;
      end;
      //*/*/*/*
    end;

    OrdenarGrillaDisponibles;
    ControlarBotones;
  end;
  ActualizarCantidadAnimales;{Actualizo las Cantidades de Elementos de cada Grilla}
  EjecutarEventoSave;

  //*/*/*/*/*
  if usar_barra then
    FAvanceTerminar.Destroy;

  //*/*/*
  BDBGDisponibles.Show;
  BDBGSeleccionados.Show;
end;

(*
  Control de Botones, para el intercambio.
*)
procedure TMangazo.ControlarBotones;
begin

  BBAgregarTodos.Visible  := not EsSimple;
  BBEliminarTodos.Visible := not EsSimple;
  BBAgregarTodos.Enabled  := false;
  BBAgregarUno.Enabled    := false;
  BBEliminarUno.Enabled   := false;
  BBEliminarTodos.Enabled := false;
  if (IBQSeleccionados.Active) and (BDBGDisponibles.DataSource.DataSet.Active) then begin
    BBAgregarUno.Enabled   := (BDBGDisponibles.DataSource.DataSet.RecordCount > 0) and (BDBGDisponibles.SelectedRows.Count > 0);
    BBEliminarUno.Enabled  := (IBQSeleccionados.RecordCount > 0) and (BDBGSeleccionados.SelectedRows.Count > 0);
    BBAgregarTodos.Enabled  := BDBGDisponibles.DataSource.DataSet.RecordCount > 0;
    BBEliminarTodos.Enabled := IBQSeleccionados.RecordCount > 0;
  end;

end;

procedure TMangazo.ActualizarCantidadAnimales;
begin
  {Recorre el query para obtener la cant de registros que contiene
   sino, muestra por defecto la cantidad que se ve en la grilla. Luego se publica la cantidad de
   Animales que se encuntran Disponibles y Seleccionados}
   Application.ProcessMessages;
   DSDisponibles.DataSet.First;
   DSDisponibles.DataSet.Last;
   Application.ProcessMessages;
   DSSeleccionados.DataSet.First;
   DSSeleccionados.DataSet.Last;
   FCantidadSeleccionados := DSSeleccionados.DataSet.RecordCount;
   GBDisponibles.Caption := Traducir(' Disponibles [') + IntToStr(DSDisponibles.DataSet.RecordCount)+ ']';
   GBSeleccionados.Caption := Traducir(' Seleccionados [')+IntToStr(FCantidadSeleccionados)+ ']';
   DSDisponibles.DataSet.First;  {Pongo el Cursor al principio de la grilla}
   DSSeleccionados.DataSet.First;
end;


procedure TMangazo.ActivarQuery;
begin
  IBQSeleccionados.Active := true;
  IBQDisponibles.Active := true;
  IBQDisponiblesGrupos.Active := true;
end;

procedure TMangazo.ActualizarLosQuery;
begin
  DesActivarQuery;
  ActivarQuery;
end;

procedure TMangazo.DesActivarQuery;
begin
  IBQSeleccionados.Active := false;
  IBQDisponibles.Active := false;
  IBQDisponiblesGrupos.Active := false;
end;

function TMangazo.GetEsSimple: boolean;
begin
    Result := FEsSimple;
end;

procedure TMangazo.SetEsSimple(Value: boolean);
begin
    FEsSimple := Value;
end;

procedure TMangazo.SeleccionarCampos;
var i:integer;
begin
  with BDBGDisponibles.DataSource.DataSet do
    for i:= 0 to Fields.Count -1 do
        if (Fields[i].Value <> null) and (IBQSeleccionados.Fields.FindField(Fields[i].FieldName) <> nil) then
          IBQSeleccionados.FieldByName(Fields[i].FieldName).Value := Fields[i].Value;
  if IBQSeleccionados.FindField('ID_AUX') <> nil then
    IBQSeleccionados.FieldByName('ID_AUX').Value := 1;
end;

procedure TMangazo.DeSeleccionarCampos;
var i:integer;
begin
  for i:= 0 to IBQSeleccionados.Fields.Count -1 do
    if (IBQSeleccionados.Fields[i].Value <> null) and (BDBGDisponibles.DataSource.DataSet.Fields.FindField(IBQSeleccionados.Fields[i].FieldName) <> nil) then
      BDBGDisponibles.DataSource.DataSet.FieldByName(IBQSeleccionados.Fields[i].FieldName).Value := IBQSeleccionados.Fields[i].Value;
end;

procedure TMangazo.BDBGDisponiblesCellClick(Column: TColumn);
var i:integer;
begin
  if apretado then
  begin
    BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
    for i:=0 to Abs(ind-BDBGDisponibles.DataSource.DataSet.RecNo) do
       begin
       BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
       if BDBGDisponibles.DataSource.DataSet.RecNo<ind then
          BDBGDisponibles.DataSource.DataSet.Next;
       if BDBGDisponibles.DataSource.DataSet.RecNo>ind then
          BDBGDisponibles.DataSource.DataSet.Prior;
       end;
    end;
  BDBGSeleccionados.SelectedRows.Clear;
  ControlarBotones;
end;

procedure TMangazo.BDBGSeleccionadosCellClick(Column: TColumn);
var i:integer;
begin
  if apretado then
    begin
    BDBGSeleccionados.SelectedRows.CurrentRowSelected:=true;
    for i:=0 to Abs(ind-BDBGDisponibles.DataSource.DataSet.RecNo) do
       begin
       BDBGSeleccionados.SelectedRows.CurrentRowSelected:=true;
       if BDBGSeleccionados.DataSource.DataSet.RecNo<ind then
          BDBGSeleccionados.DataSource.DataSet.Next;
       if BDBGSeleccionados.DataSource.DataSet.RecNo>ind then
          BDBGSeleccionados.DataSource.DataSet.Prior;
       end;
    end;
  BDBGDisponibles.SelectedRows.Clear;
  ControlarBotones;
end;

function TMangazo.hay_animales: boolean;
var cant : integer;
begin
    hay_animales := false;
    cant := 0;
    IBQSeleccionados.First;
    while not(IBQSeleccionados.Eof) do
      begin
        Inc(cant);
        IBQSeleccionados.Next;
      end;
    if cant > 0 then hay_animales := true;
end;

procedure TMangazo.FiltroGruposClick(Sender: TObject);
Var aux : ansiString;
    vista : string;
    SearchUpper : string;
    valor : integer;
begin

    if (CBxGrupo.Text <> 'GRUPO') then
    begin
      // lo paso a mayuscula para asegurar la busqueda
      SearchUpper := UpperCase(FSQLBasico);
      vista := StrPos(PChar(SearchUpper), PChar('FROM'));

      with IBQDisponiblesGrupos do begin
        Close;
        if (AnsiPos('where',IBQDisponiblesGrupos.SQL.GetText) = 0) then // no tiene where
          begin
            aux := StringReplace(IBQDisponiblesGrupos.SQL.GetText,#$D#$A, '',[rfReplaceAll])+ ' where id_animal in (select id_animal '+vista+')';
            SQL.Clear;
            SQL.Add(aux);
          end;

        if (staticSexo = 0) then
          begin
            SQL.Text:= StringReplace(IBQDisponiblesGrupos.SQL.GetText,' and (sexo = :sexo)', '',[rfReplaceAll]);
          end
        else
          begin
            if (AnsiPos(' and (sexo = :sexo)',IBQDisponiblesGrupos.SQL.GetText) = 0) then // no tiene  and (sexo = :sexo)
              begin
                aux := StringReplace(IBQDisponiblesGrupos.SQL.GetText,#$D#$A, '',[rfReplaceAll])+ ' and (sexo = :sexo)';
                SQL.Clear;
                SQL.Add(aux);
              end;
            Params.ParamByName('sexo').AsInteger := staticSexo;
          end;
        valor := RetornarValor(CBxGrupo);
        if (valor <> -1) then
          Params.ParamByName('ID_GRUPO').AsInteger := valor //DBLCBGrupo.KeyValue;
        else
          Params.ParamByName('ID_GRUPO').AsInteger := 0;
        UpdateObject := IBUSQLIntercambiarDer;
        DSDisponibles.DataSet := IBQDisponiblesGrupos;
        Open;
      end;
      EliminarYaSeleccionadosGrupos;
      ActualizarCantidadAnimales;
  end;
end;

procedure TMangazo.EliminarYaSeleccionados;
var i:integer;
begin
  IBQSeleccionados.Last;
  IBQSeleccionados.First;

  BDBGSeleccionados.DataSource:= nil;

  if (DSSeleccionados.DataSet.RecordCount -1 >= 0) and (DSDisponibles.DataSet.RecordCount - 1 >= 0) then
  begin
    DSSeleccionados.DataSet.First;
    for i := 0 to DSSeleccionados.DataSet.RecordCount -1 do
    begin
      if (IBQDisponibles.Locate('id_animal', DSSeleccionados.DataSet.FieldValues['id_animal'],[])) then
        begin
         IBQDisponibles.Delete;
        end;
      DSSeleccionados.DataSet.Next;
    end;
    ControlarBotones;
  end;

  BDBGSeleccionados.DataSource:= DSSeleccionados;
end;

procedure TMangazo.InicTiposIdentificadores;
begin
  CBATipoIdentificador.Items.Clear;
  CBATipoIdentificador.Items.Add(Traducir('RP'));
  CBATipoIdentificador.Items.Add(FPrincipal.PaisNombreCaravana);
  CBATipoIdentificador.Items.Add(FPrincipal.PaisHerdBook);
  CBATipoIdentificador.Items.Add('PC/AAB/ABA/RGB');
  CBATipoIdentificador.Items.Add(Traducir('OTRO'));
end;

procedure TMangazo.RBTodasClick(Sender: TObject);
var
  pos : integer;
  Buf : String;
begin
    FEvento := -1;
    Vista := SearchBuf(PAnsiChar(FSQLBasico),Length(FSQLBasico),0,0,'VIS_',[soDown]);
    pos := PosEx(' ',Vista);
    if pos > 0 then
    begin
      SetLength(Buf,pos);
      StrLCopy(PAnsiChar(Buf),PAnsiChar(Vista),pos);
      Vista := Buf;
    end;
    Inic_Parametros();
    InicTiposIdentificadores;
    Inic_Filtros();
    EjecutarSQL();
end;

procedure TMangazo.EliminarYaSeleccionadosGrupos;
var i:integer;
begin
  IBQSeleccionados.Last;
  IBQSeleccionados.First;

  if BDBGSeleccionados.DataSource.DataSet.RecordCount -1 >= 0 then
  begin
    BDBGSeleccionados.DataSource.DataSet.First;
    for i := 0 to BDBGSeleccionados.DataSource.DataSet.RecordCount -1 do
    begin
      if (IBQDisponiblesGrupos.Locate('id_animal', BDBGSeleccionados.DataSource.DataSet.FieldValues['id_animal'],[])) then
      IBQDisponiblesGrupos.Delete;
      BDBGSeleccionados.DataSource.DataSet.Next;
    end;
    ControlarBotones;
  end;
end;

procedure TMangazo.FiltroCategoriaClick(Sender: TObject);
begin
    CBClick(CBxCategoria);
end;

procedure TMangazo.OrdenarGrillaSeleccionados;
begin
     IBQSeleccionados.Last;
     IBQSeleccionados.First;
end;

procedure TMangazo.OrdenarGrillaDisponibles;
begin
   if RBGrupo.Checked then
    begin
      IBQDisponiblesGrupos.Last;
      IBQDisponiblesGrupos.First;
    end
    else
    begin
      IBQDisponibles.Last;
      IBQDisponibles.First;
    end;
end;

procedure TMangazo.FrameEnter(Sender: TObject);
begin
  if StrPos(PChar(FSQLBasico), PChar('where')) <> nil then
    ConWhere := True
  else
    ConWhere := False;
end;

// Saca el id_animal de seleccionados y lo agrega en disponibles
procedure TMangazo.sacarAnimalDeSeleccionados(id_animal: integer);
var pointer : TBookmark;
begin
if IBQSeleccionados.Locate('id_animal',id_animal,[]) then
  begin
  BDBGSeleccionados.SelectedRows.Clear;
  IBQSeleccionados.Locate('id_animal', VarArrayOf([id_animal]),[]);
  pointer := IBQSeleccionados.GetBookmark;
  IBQSeleccionados.GotoBookmark(pointer);
  BDBGDisponibles.DataSource.DataSet.Insert;
  DeSeleccionarCampos;
  IBQSeleccionados.Delete;
  BDBGSeleccionados.Refresh;
  IBQSeleccionados.First;
  BDBGDisponibles.SelectedRows.Clear;
  OrdenarGrillaSeleccionados;
  ControlarBotones;
  ActualizarCantidadAnimales;{Actualizo las Cantidades de Elementos de cada Grilla}
  Application.ProcessMessages;
  end;
end;

function TMangazo.PuedeGrabar: boolean;
begin
  Result := BDBGSeleccionados.HasRecord;
end;

procedure TMangazo.SetOnSaveChange(Value: TNotifyEvent);
begin
  FOnSaveChange := Value;
end;

procedure TMangazo.EjecutarEventoSave;
begin
    if Assigned(FOnSaveChange) then
    FOnSaveChange(Self);
end;

procedure TMangazo.DBLCBGrupoMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Hint := DBLCBGrupo.Text;
  ShowHint:= true;
end;

procedure TMangazo.ActualizarCategoria(categoria : Integer); //agregue codigo
begin
  CBxCategoria.ItemIndex := categoria;
end;


procedure TMangazo.DBEAnimalKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) then
      begin
       BBAgregarTodosClick(nil);
       DBEAnimal.SelectAll;
       key:=#0;
      end;

      if(Length(DBEAnimal.Text) = DBEAnimal.MaxLength) and (key <> #8) then
        key:=#0;
end;

procedure TMangazo.IBQSeleccionadosAfterPost(DataSet: TDataSet);
begin
  FPrincipal.IBDPrincipal.ApplyUpdates([IBQSeleccionados]);
end;

procedure TMangazo.BDBGDisponiblesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  apretado:=false;
  if Key in [VK_SHIFT] then
    begin
    ind:= BDBGDisponibles.DataSource.DataSet.RecNo;
    apretado:=true;
    end;
end;

procedure TMangazo.BDBGDisponiblesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_SHIFT] then
    begin
    ind:=0;
    apretado:=false;
    end;
end;

procedure TMangazo.BDBGSeleccionadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  apretado:=false;
  if Key in [VK_SHIFT] then
    begin
    ind:= BDBGSeleccionados.DataSource.DataSet.RecNo;
    apretado:=true;
    end;
end;

procedure TMangazo.BDBGSeleccionadosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_SHIFT] then
    begin
    ind:=0;
    apretado:=false;
    end;
end;

procedure TMangazo.CBClick(Sender: TObject);
var
  I, Indice : Integer;
  Check : Boolean;
begin

  if (Sender is TCheckBox) then
  begin
    if (Sender as TCheckBox).Name = 'CBCategoria' then
      JvROBusquedaAvanzada.Expand;
    Indice := (Sender as TCheckBox).Tag;
    Check := (Sender as TCheckBox).Checked;
    for I := 0 to Length(Filtros[Indice].Componentes)-1 do
      if not (Filtros[Indice].Componentes[I] is TCheckBox) then
        Filtros[Indice].Componentes[I].Enabled := true;
    Parametros[Indice].en_uso := Check;
    ActivarAdicionales := Check AND (Indice = 18);
    if ((Indice = 18) and not Check) then
      ActivarFiltrosAdicionales(-1);
    if ActivarAdicionales then
      DBLCBACloseUp(Filtros[Indice].Componentes[0])
    else
      EjecutarSQL();

    if ((Sender as TCheckBox).Name = 'CBAnimal') then
     begin
       CBATipoIdentificador.Enabled := ((Sender as TCheckBox).Checked);
     end;
  end;

  if (Sender is TComboBox) then
  begin
    if (Sender as TComboBox).Name = 'CBxCategoria' then
    begin
      VisualizarComponentes;
      DistribuirComponentes;
      JvROBusquedaAvanzada.Expand;
    end;

    Indice := (Sender as TComboBox).Tag;
    Check := true;

    for I := 0 to Length(Filtros[Indice].Componentes)-1 do
      if not (Filtros[Indice].Componentes[I] is TComboBox) then
        Filtros[Indice].Componentes[I].Enabled := Check;

    Parametros[Indice].en_uso := Check;
    ActivarAdicionales := Check AND (Indice = 18);
    if ((Indice = 18) and not Check) then
      ActivarFiltrosAdicionales(-1);

    if ActivarAdicionales then
      DBLCBACloseUp(Filtros[Indice].Componentes[0])
    else
      EjecutarSQL();

  end;
end;

procedure TMangazo.DBLCBACloseUp(Sender: TObject);
var valor : integer;
begin

  if Sender is TComboBox then
    if (Sender as TComboBox).Text <> '' then
    begin
      if (ActivarAdicionales or ((Sender as TComboBox).Tag = 18)) then //solo se hace para cuando se cambia de categoria
      begin
        if ((Sender as TComboBox).Text <> 'CATEGORIA') then
        begin
          valor := RetornarValor(Sender);
          if (valor <> -1) then
          begin
            ActivarFiltrosAdicionales(valor);
            ReiniciarFiltros;
          end;
        end;
      end;
      EjecutarSQL();
    end;

  if Sender is TComboBox then
    EjecutarSQL();

end;

procedure TMangazo.ReiniciarFiltros;
var
  i : integer;
begin
  for i := 0 to ComponentCount-1 do
    if Components[I].GetParentComponent = GBFiltros then
      if ((Components[I] is TComboBox)) then
        (Components[I] as TComboBox).ItemIndex := 0;
end;

procedure TMangazo.EChange(Sender: TObject);
begin
  if Sender is TEdit then
    if (Sender as TEdit).Text <> '' then
      EjecutarSQL();
end;

procedure TMangazo.ActivarFiltrosAdicionales(Categoria : Integer);
begin
  CBFrame.Visible := false;
  CBPeso.Visible := false;
  CBRaza.Visible := false;
  DBLCBARaza.Visible := false;
  CBSubcategoria.Visible := false;
  DBLCBASubcategoria.Visible := false;
  CBEdad.Visible := false;
  GBNacidosEntre.Visible := (Categoria = 1) OR (Categoria = 4) OR (Categoria = 2) OR (Categoria = 5);
  EEdadDesde.Visible := false;
  EEdadHasta.Visible := false;
  CBAnios.Visible := false;
  EDesdeAnios.Visible := (Categoria = 3) OR (Categoria = 6);
  EHastaAnios.Visible := (Categoria = 3) OR (Categoria = 6);
  LHastaAnios.Visible := (Categoria = 3) OR (Categoria = 6) OR (Categoria = 1) OR (Categoria = 4) OR (Categoria = 2) OR (Categoria = 5);
  LDesdeAnios.Visible := (Categoria = 3) OR (Categoria = 6) OR (Categoria = 1) OR (Categoria = 4) OR (Categoria = 2) OR (Categoria = 5);
  CBCantPartos.Visible := false;
  CBxCantidadPartos.Visible := Categoria = 6;
  ECantPartos.Visible := false;
  CBCircEsc.Visible := false;
  GBCircunferenciaEscrotal.Visible := Categoria = 3;
  EDesdeCircEsc.Visible := Categoria = 3;
  EHastaCircEsc.Visible := Categoria = 3;
  LDesdeCircEsc.Visible := Categoria = 3;
  LHastaCircEsc.Visible := Categoria = 3;
  CBCondCorp.Visible := false;
  CBxCondicionCorporal.Visible := (Categoria = 3) OR (Categoria = 5) OR (Categoria = 6);
  DBLCBACondCorp.Visible := false;
  CBCronoDent.Visible := false;
  DBLCBACronoDent.Visible := false;
  CBxCronologiaDentaria.Visible := (Categoria = 3) OR (Categoria = 5) OR (Categoria = 6);
  CBCapServ.Visible := false;
  DBLCBACapServ.Visible := false;
  CBxCapacidadServicio.Visible := Categoria = 3;
  CBExamenClinico.Visible := false;
  DBLCBAExamenClinico.Visible := false;
  CBxExamenClinico.Visible := Categoria = 3;
  CBCalidadSemen.Visible := false;
  DBLCBACalidadSemen.Visible := false;
  CBxCalidadSeminal.Visible := Categoria = 3;
  CBAreaPelvica.Visible := false;
  ComboAreaPelvica.Visible := false;
  CBxAreaPelvica.Visible := Categoria = 5;
  CBGDR.Visible := false;
  DBLCBAGDR.Visible := false;
  CBEstadoReproductivo.Visible := false;
  DBLCBAEstadoRepro.Visible := false;
  CBxEstadoReproductivo.Visible := (Categoria = 5) OR (Categoria = 6);
  CBPreniesRobo.Visible := Categoria = 5;
  DBLCBARechazo.Visible := false;
  CBRechazo.Visible := false;
  CBPreservicio.Visible := false;
  CBxPreservicio.Visible := Categoria = 5;
  CBAptas.Visible := false;
  CBDiasParto.Visible := false;
  EDesdePartos.Visible := Categoria = 6;
  EHastaPartos.Visible := Categoria = 6;
  LDesdePartos.Visible := Categoria = 6;
  LHastaPartos.Visible := Categoria = 6;
  GBDiasAlParto.Visible := Categoria = 6;
  CBDiasCelo.Visible := false;
  EDiasCeloDesde.Visible := (Categoria = 5) or (Categoria = 6);
  EDiasCeloHasta.Visible := (Categoria = 5) or (Categoria = 6);
  LDiasCeloDesde.Visible := (Categoria = 5) or (Categoria = 6);
  LDiasCeloHasta.Visible := (Categoria = 5) or (Categoria = 6);
  GBDiasAlCelo.Visible := (Categoria = 5) or (Categoria = 6);

  DistribuirComponentes;
end;

procedure TMangazo.IBQRechazoAfterOpen(DataSet: TDataSet);
var
  con : integer;
begin
  con := 0;
  while (not(DataSet.Eof) and (con < 21)) do begin
    DataSet.Next;
    inc(con);
  end;
end;

procedure TMangazo.DBLCBKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (Sender as TDBLookupComboBoxAuto).ListVisible then
    DBLCBACloseUp(Sender);
end;

procedure TMangazo.HabilitarComponentesVersionBasica;
begin

  if (FPrincipal.TipoVersionLicencia = 'Basico') then
    JvROBusquedaAvanzada.Visible:= false;
end;

procedure TMangazo.RGOrdenClick(Sender: TObject);
begin
  EjecutarSQL;
end;

procedure TMangazo.CBATipoIdentificadorChange(Sender: TObject);
var
  s : String;
begin
  if CBATipoIdentificador.Text <> '' then
  begin
    DBEAnimal.Text := '';
    s := CBATipoIdentificador.Text;
    if s = 'PC/AAB/ABA/RGB' then
      s := 'PC';
    if CBATipoIdentificador.Text = 'ID' then
      s := 'RP';
    Parametros[21].query := ' AND (ID_'+s+' like :RP)';
    EChange(DBEAnimal);
    AcomodarColumnas;
    if CBATipoIdentificador.Text = 'SENASA' then
      DBEAnimal.MaxLength := 9
    else
      DBEAnimal.MaxLength := 9;
  end;
end;

procedure TMangazo.AcomodarColumnas;
begin

     if (owner is TFEveIdentificacion) then
     begin
      if ((owner as TFEveIdentificacion).ConMadre) then
      begin
         BDBGDisponibles.Columns[0].Visible := true;
         BDBGDisponibles.Columns[0].FieldName := 'V1';
         BDBGDisponibles.Columns[0].Title.Caption := 'Rp Madre';
         BDBGDisponibles.Columns[0].Width := 70;

         BDBGSeleccionados.Columns[0].Visible := true;
         BDBGSeleccionados.Columns[0].FieldName := 'V1';
         BDBGSeleccionados.Columns[0].Title.Caption := 'Rp Madre';
         BDBGSeleccionados.Columns[0].Width := 70;


         BDBGDisponibles.Columns[1].Visible := true;
         BDBGDisponibles.Columns[1].FieldName := 'ID_RP';
         BDBGDisponibles.Columns[1].Title.Caption := 'RP';
         BDBGDisponibles.Columns[1].Width := 70;

         BDBGSeleccionados.Columns[1].Visible := true;
         BDBGSeleccionados.Columns[1].FieldName := 'ID_RP';
         BDBGSeleccionados.Columns[1].Title.Caption := 'RP';
         BDBGSeleccionados.Columns[1].Width := 70;

         BDBGDisponibles.Columns[2].Visible := true;
         BDBGDisponibles.Columns[2].FieldName := 'NOMBRE';
         BDBGDisponibles.Columns[2].Title.Caption := 'Nombre';
         BDBGDisponibles.Columns[2].Width := 250;

         BDBGSeleccionados.Columns[2].Visible := true;
         BDBGSeleccionados.Columns[2].FieldName := 'NOMBRE';
         BDBGSeleccionados.Columns[2].Title.Caption := 'Nombre';
         BDBGSeleccionados.Columns[2].Width := 250;

         BDBGDisponibles.Columns[3].Visible := true;
         BDBGDisponibles.Columns[3].FieldName := 'ID_HBA';
         BDBGDisponibles.Columns[3].Title.Caption := 'HBA';
         BDBGDisponibles.Columns[3].Width := 70;

         BDBGSeleccionados.Columns[3].Visible := true;
         BDBGSeleccionados.Columns[3].FieldName := 'ID_HBA';
         BDBGSeleccionados.Columns[3].Title.Caption := 'HBA';
         BDBGSeleccionados.Columns[3].Width := 70;
      end
      else
      begin
         BDBGDisponibles.Columns[0].Visible := true;
         BDBGDisponibles.Columns[0].FieldName := 'ID_RP';
         BDBGDisponibles.Columns[0].Title.Caption := 'RP';
         BDBGDisponibles.Columns[0].Width := 70;

         BDBGSeleccionados.Columns[0].Visible := true;
         BDBGSeleccionados.Columns[0].FieldName := 'ID_RP';
         BDBGSeleccionados.Columns[0].Title.Caption := 'RP';
         BDBGSeleccionados.Columns[0].Width := 70;

         BDBGDisponibles.Columns[1].Visible := true;
         BDBGDisponibles.Columns[1].FieldName := 'NOMBRE';
         BDBGDisponibles.Columns[1].Title.Caption := 'Nombre';
         BDBGDisponibles.Columns[1].Width := 250;

         BDBGSeleccionados.Columns[1].Visible := true;
         BDBGSeleccionados.Columns[1].FieldName := 'NOMBRE';
         BDBGSeleccionados.Columns[1].Title.Caption := 'Nombre';
         BDBGSeleccionados.Columns[1].Width := 250;

         BDBGDisponibles.Columns[2].Visible := true;
         BDBGDisponibles.Columns[2].FieldName := 'ID_HBA';
         BDBGDisponibles.Columns[2].Title.Caption := 'HBA';
         BDBGDisponibles.Columns[2].Width := 70;

         BDBGSeleccionados.Columns[2].Visible := true;
         BDBGSeleccionados.Columns[2].FieldName := 'ID_HBA';
         BDBGSeleccionados.Columns[2].Title.Caption := 'HBA';
         BDBGSeleccionados.Columns[2].Width := 70;
      end;
     end
     else
     begin
         BDBGDisponibles.Columns[0].Visible := true;
         BDBGDisponibles.Columns[0].FieldName := 'ID_RP';
         BDBGDisponibles.Columns[0].Title.Caption := 'RP';
         BDBGDisponibles.Columns[0].Width := 70;

         BDBGSeleccionados.Columns[0].Visible := true;
         BDBGSeleccionados.Columns[0].FieldName := 'ID_RP';
         BDBGSeleccionados.Columns[0].Title.Caption := 'RP';
         BDBGSeleccionados.Columns[0].Width := 70;

         BDBGDisponibles.Columns[1].Visible := true;
         BDBGDisponibles.Columns[1].FieldName := 'NOMBRE';
         BDBGDisponibles.Columns[1].Title.Caption := 'Nombre';
         BDBGDisponibles.Columns[1].Width := 250;

         BDBGSeleccionados.Columns[1].Visible := true;
         BDBGSeleccionados.Columns[1].FieldName := 'NOMBRE';
         BDBGSeleccionados.Columns[1].Title.Caption := 'Nombre';
         BDBGSeleccionados.Columns[1].Width := 250;

         BDBGDisponibles.Columns[2].Visible := true;
         BDBGDisponibles.Columns[2].FieldName := 'ID_HBA';
         BDBGDisponibles.Columns[2].Title.Caption := 'HBA';
         BDBGDisponibles.Columns[2].Width := 70;

         BDBGSeleccionados.Columns[2].Visible := true;
         BDBGSeleccionados.Columns[2].FieldName := 'ID_HBA';
         BDBGSeleccionados.Columns[2].Title.Caption := 'HBA';
         BDBGSeleccionados.Columns[2].Width := 70;
     end;

end;

procedure TMangazo.DBLCBARazaCloseUp(Sender: TObject);
begin
  DBLCBACloseUp(DBLCBARaza);
  if DBLCBARaza.KeyValue <> null then
  begin
    DMSoftvet.IBQSubCategoriaRaza.Close;
    DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := DBLCBARaza.KeyValue;
    DMSoftvet.IBQSubCategoriaRaza.Open;
  end;
end;

procedure TMangazo.CBRazaClick(Sender: TObject);
begin
  CBClick(CBRaza);
  if not CBRaza.Checked then
  begin
    CBSubcategoria.Checked := false;
    CBSubcategoria.Enabled := false;
    DBLCBASubcategoria.Enabled := false;
  end;
end;

procedure TMangazo.CargarCombos(ibq : TIBQuery; text : string; combo : TComboBox; param : string);
begin

     combo.AddItem(text,nil);
     ibq.First;
     while not(ibq.Eof) do
     begin
          combo.AddItem(ibq.FieldValues[param],nil);
          ibq.Next;
     end;
end;

procedure TMangazo.CBxRazaCloseUp(Sender: TObject);
begin
     DBLCBACloseUp(CBxRaza); 
     if not(DelRaza) then
     begin
          CBxRaza.Items.Delete(0);
          DelRaza := true;
     end;
end;

procedure TMangazo.InicializarCombos;
begin
     CBxRaza.ItemIndex := 0;
     CBxColor.ItemIndex := 0;
     CBxCategoria.ItemIndex := 0;
     CBxTipoRegistro.ItemIndex := 0;
     CBxPotrero.ItemIndex := 0;
     CBxRodeo.ItemIndex := 0;
     CBxGrupo.ItemIndex := 0;

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
end;

function TMangazo.RetornarValor(Sender : TObject) : integer;
var valor : integer;
    aux : string;
begin

     valor := -1;
     aux := '';

     if ((Sender is TComboBox)) then
     begin
       if ((Sender as TComboBox).Text <> null) then
       begin
          if ((Sender as TComboBox).Name = 'CBxCategoria') then
            if ((Sender as TComboBox).Text <> 'CATEGORIA') and ((Sender as TComboBox).Text <> '(TODAS)') then
              if (IBQCatAnimales.Lookup('sinonimo',(Sender as TComboBox).Text,'id_categoria') <> null) then
                valor := IBQCatAnimales.Lookup('sinonimo',(Sender as TComboBox).Text,'id_categoria');

          if ((Sender as TComboBox).Name = 'CBxColor') then
            if ((Sender as TComboBox).Text <> 'COLOR') and ((Sender as TComboBox).Text <> '(TODOS)') then
              if (IBQColor.Lookup('nombre',(Sender as TComboBox).Text,'id_color') <> null) then
                valor := IBQColor.Lookup('nombre',(Sender as TComboBox).Text,'id_color');

          if ((Sender as TComboBox).Name = 'CBxGrupo') then
            if ((Sender as TComboBox).Text <> 'GRUPO') and ((Sender as TComboBox).Text <> '(TODOS)') then
              if (IBQGrupo.Lookup('nombre',(Sender as TComboBox).Text,'id_grupo') <> null) then
                valor := IBQGrupo.Lookup('nombre',(Sender as TComboBox).Text,'id_grupo');

          if ((Sender as TComboBox).Name = 'CBxPotrero') then
            if ((Sender as TComboBox).Text <> 'POTRERO') and ((Sender as TComboBox).Text <> '(TODOS)') then
              if (IBQPotrero.Lookup('nombre',(Sender as TComboBox).Text,'id_potrero') <> null) then
                valor := IBQPotrero.Lookup('nombre',(Sender as TComboBox).Text,'id_potrero');

          if ((Sender as TComboBox).Name = 'CBxRaza') then
            if ((Sender as TComboBox).Text <> 'RAZA') and ((Sender as TComboBox).Text <> '(TODAS)') then
              if (DMSoftvet.IBQRaza.Lookup('sinonimo',(Sender as TComboBox).Text,'id_raza') <> null) then
                valor := DMSoftvet.IBQRaza.Lookup('sinonimo',(Sender as TComboBox).Text,'id_raza');

          if ((Sender as TComboBox).Name = 'CBxRodeo') then
            if ((Sender as TComboBox).Text <> 'RODEO') and ((Sender as TComboBox).Text <> '(TODOS)') then
              if (IBQRodeo.Lookup('nombre',(Sender as TComboBox).Text,'id_rodeo') <> null) then
                valor := IBQRodeo.Lookup('nombre',(Sender as TComboBox).Text,'id_rodeo');

          if ((Sender as TComboBox).Name = 'CBxTipoRegistro') then
            if ((Sender as TComboBox).Text <> 'TIPO DE REGISTRO') and ((Sender as TComboBox).Text <> '(TODOS)') then
              if (DMSoftvet.IBQSubCategoriaRaza.Lookup('sinonimo',(Sender as TComboBox).Text,'id_subcategoria') <> null) then
                valor := DMSoftvet.IBQSubCategoriaRaza.Lookup('sinonimo',(Sender as TComboBox).Text,'id_subcategoria');

          if ((Sender as TComboBox).Name = 'CBxAreaPelvica') then
            if ((Sender as TComboBox).Text <> 'AREA PELVICA') and ((Sender as TComboBox).Text <> '(TODAS)') then
              if ((Sender as TComboBox).Text = '< 120 cm²') then
                valor := 0;

              if ((Sender as TComboBox).Text = '120-130 cm²') then
                valor := 1;

              if ((Sender as TComboBox).Text = '130-140 cm²') then
                valor := 2;

              if ((Sender as TComboBox).Text = '140-150 cm²') then
                valor := 3;

              if ((Sender as TComboBox).Text = '150-160 cm²') then
                valor := 4;

              if ((Sender as TComboBox).Text = '160-170 cm²') then
                valor := 5;

              if ((Sender as TComboBox).Text = '170-180 cm²') then
                valor := 6;

              if ((Sender as TComboBox).Text = '180-190 cm²') then
                valor := 7;

              if ((Sender as TComboBox).Text = '190-200 cm²') then
                valor := 8;

              if ((Sender as TComboBox).Text = '> 200 cm²') then
                valor := 9;

          if ((Sender as TComboBox).Name = 'CBxCalidadSeminal') then
            if ((Sender as TComboBox).Text <> 'CALIDAD SEMINAL') and ((Sender as TComboBox).Text <> '(TODAS)') then
              if (IBQCalidadSEminal.Lookup('valor',(Sender as TComboBox).Text,'id_codigo') <> null) then
                aux := IBQCalidadSEminal.Lookup('valor',(Sender as TComboBox).Text,'id_codigo');

          if ((Sender as TComboBox).Name = 'CBxCantidadPartos') then
            if ((Sender as TComboBox).Text <> 'CANTIDAD DE PARTOS') and ((Sender as TComboBox).Text <> '(TODOS)') then
//              valor :=

          if ((Sender as TComboBox).Name = 'CBxCapacidadServicio') then
            if ((Sender as TComboBox).Text <> 'CAPACIDAD DE SERVICIO') and ((Sender as TComboBox).Text <> '(TODOS)') then
              if (DMSoftvet.IBQValorCapacidad.Lookup('sinonimo',(Sender as TComboBox).Text,'id_valor') <> null) then
                valor := DMSoftvet.IBQValorCapacidad.Lookup('sinonimo',(Sender as TComboBox).Text,'id_valor');

          if ((Sender as TComboBox).Name = 'CBxCondicionCorporal') then
          begin
            if ((Sender as TComboBox).Text <> 'CONDICION CORPORAL') and ((Sender as TComboBox).Text <> '(TODAS)') then
            begin
                IBQParametros.Close;
                IBQParametros.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
                IBQParametros.ParamByName('param').AsInteger := 3; //Codigo de la condicion corporal
                IBQParametros.Open;

                if (IBQParametros.FieldValues['valor'] = 10) then
                begin
                  if (IBQCondCorp.Lookup('escala',(Sender as TComboBox).Text,'id_condicion_corporal') <> null) then
                    valor := IBQCondCorp.Lookup('escala',(Sender as TComboBox).Text,'id_condicion_corporal')
                end
                else
                  if (IBQCondCorp.Lookup('escala',(Sender as TComboBox).Text,'id_condicion_corporal') <> null) then
                    valor := IBQCondCorp.Lookup('escala',(Sender as TComboBox).Text,'id_condicion_corporal');
             end;
          end;

          if ((Sender as TComboBox).Name = 'CBxCronologiaDentaria') then
            if ((Sender as TComboBox).Text <> 'CRONOLOGIA DENTARIA')and((Sender as TComboBox).Text <> '(TODAS)') then
              if (DMSoftvet.IBQCronologiaDentaria.Lookup('sinonimo',(Sender as TComboBox).Text,'id_cronologia_dentaria') <> null) then
                valor := DMSoftvet.IBQCronologiaDentaria.Lookup('sinonimo',(Sender as TComboBox).Text,'id_cronologia_dentaria');

          if ((Sender as TComboBox).Name = 'CBxEstadoReproductivo') then
            if ((Sender as TComboBox).Text <> 'ESTADO REPRODUCTIVO')and((Sender as TComboBox).Text <> '(TODOS)') then
              if (DMSoftvet.IBQEstadoReproductivo.Lookup('nombre',(Sender as TComboBox).Text,'id_estado_reproductivo') <> null) then
                valor := DMSoftvet.IBQEstadoReproductivo.Lookup('nombre',(Sender as TComboBox).Text,'id_estado_reproductivo');

          if ((Sender as TComboBox).Name = 'CBxExamenClinico') then
            if ((Sender as TComboBox).Text <> 'EXAMEN CLINICO') and ((Sender as TComboBox).Text <> '(TODOS)') then
              if (IBQExamenClinico.Lookup('valor',(Sender as TComboBox).Text,'id_codigo') <> null) then
                aux := IBQExamenClinico.Lookup('valor',(Sender as TComboBox).Text,'id_codigo');

          if ((Sender as TComboBox).Name = 'CBxPreservicio') then
            if ((Sender as TComboBox).Text <> 'PRESERVICIO') and ((Sender as TComboBox).Text <> '(TODOS)') then
            begin
              if ((Sender as TComboBox).Text = 'APTAS') then
                valor := 0;

              if ((Sender as TComboBox).Text = 'NO APTAS') then
                valor := 1;
            end;
       end
       else
       begin
            ReiniciarFiltros;
       end;
     end;

     if (aux <> '') then
      if (aux = 'A') then valor := -2
      else valor := -3;

     Result := valor;
end;

procedure TMangazo.DistribuirComponentes;
var i, leftCombo, leftGroup : integer;
    E : TComponent;
begin

  leftCombo := 10;
  leftGroup := 10;

  for i := 0 to ComponentCount-1 do
    if Components[I].GetParentComponent = GBFiltros then
    begin
      if ((Components[I] is TComboBox)) then
        if ((Components[I] as TComboBox).Visible) then
        begin
            (Components[I] as TComboBox).Left := leftCombo;
            (Components[I] as TComboBox).Top := 18;

            leftCombo := leftCombo + (Components[I] as TComboBox).Width + 20;
        end;

      if ((Components[I] is TGroupBox)) then
        if ((Components[I] as TGroupBox).Visible) then
        begin
            (Components[I] as TGroupBox).Left := leftGroup;
            (Components[I] as TGroupBox).Top := 56;

            leftGroup := leftGroup + (Components[I] as TGroupBox).Width + 20;
        end;
    end;

  E := FindComponent('CBPreniesRobo');

  if ((E as TCheckBox).Visible) then
  begin
       (E as TCheckBox).Top := 18;
       (E as TCheckBox).Left := leftCombo + 10;
  end;


  GBSeparadorDesde.Left := 37;
  GBSeparadorDesde.Top  := 18;

  GBSeparadorHasta.Left := 167;
  GBSeparadorHasta.Top  := 18;

  EDesdeCircEsc.Left := 46;
  EDesdeFrame.Left := 46;
  EDesdePartos.Left := 46;
  EDesdePeso.Left := 46;
  EDiasCeloDesde.Left := 46;

  EDesdeAnios.Top := 20;
  EDesdeCircEsc.Top := 20;
  EDesdeFrame.Top := 20;
  EDesdePartos.Top := 20;
  EDesdePeso.Top := 20;
  EDiasCeloDesde.Top := 20;

  LDesdeAnios.Left := 4;
  LDesdeCircEsc.Left := 4;
  LDesdeFrame.Left := 4;
  LDesdePartos.Left := 4;
  LDesdePeso.Left := 4;
  LDiasCeloDesde.Left := 4;

  LDesdeAnios.Top := 23;
  LDesdeCircEsc.Top := 23;
  LDesdeFrame.Top := 23;
  LDesdePartos.Top := 23;
  LDesdePeso.Top := 23;
  LDiasCeloDesde.Top := 23;

  EHastaAnios.Left := 137;
  EHastaCircEsc.Left := 137;
  EHastaFrame.Left := 137;
  EHastaPartos.Left := 137;
  EHastaPeso.Left := 137;
  EDiasCeloHasta.Left := 137;

  EHastaAnios.Top := 20;
  EHastaCircEsc.Top := 20;
  EHastaFrame.Top := 20;
  EHastaPartos.Top := 20;
  EHastaPeso.Top := 20;
  EDiasCeloHasta.Top := 20;

////////////////////////////////////////

  LHastaAnios.Left := 98;
  LHastaCircEsc.Left := 98;
  LHastaFrame.Left := 98;
  LHastaPartos.Left := 98;
  LHastaPeso.Left := 98;
  LDiasCeloHasta.Left := 98;

  LHastaAnios.Top := 23;
  LHastaCircEsc.Top := 23;
  LHastaFrame.Top := 23;
  LHastaPartos.Top := 23;
  LHastaPeso.Top := 23;
  LDiasCeloHasta.Top := 23;

  LSeparadorDesde.Left := 11;
  LSeparadorDesde.Top := 2;
  LSeparadorHasta.Left := 1;
  LSeparadorHasta.Top := 2;

  EADesdeDia.Left := 44;
  EADesdeDia.Top := 20;
  EAHastaDia.Left := 176;
  EAHastaDia.Top := 20;

  EADesdeMes.Left := 71;
  EADesdeMes.Top := 20;
  EAHastaMes.Left := 203;
  EAHastaMes.Top := 20;

  EADesdeAnio.Left := 97;
  EADesdeAnio.Top := 20;
  EAHastaAnio.Left := 228;
  EAHastaAnio.Top := 20;

  DTPDesde.Left := 132;
  DTPDesde.Top := 19;
  DTPHasta.Left := 263;
  DTPHasta.Top := 19;

  EDesdeFrame.Left := 46;
  EDesdeFrame.Top := 20;
  LDesdeFrame.Left := 4;
  LDesdeFrame.Top := 23;
  EHastaFrame.Left := 137;
  EHastaFrame.Top := 20;
  LHastaFrame.Left := 98;
  LHastaFrame.Top := 23;

  EDesdePeso.Left := 46;
  EDesdePeso.Top := 20;
  LDesdePeso.Left := 4;
  LDesdePeso.Top := 23;
  EHastaPeso.Left := 137;
  EHastaPeso.Top := 20;
  LHastaPeso.Left := 98;
  LHastaPeso.Top := 23;

  LDesdeAnios.Left := 4;
  LDesdeAnios.Top := 23;
  LHastaAnios.Left := 151;
  LHastaAnios.Top := 23;

  LSeparadorDesde.Left := 11;
  LSeparadorDesde.Top := 2;
  LSeparadorHasta.Left := 1;
  LSeparadorHasta.Top := 2;

  EADesdeDia.Left := 42;
  EADesdeDia.Top := 20;
  EAHastaDia.Left := 173;
  EAHastaDia.Top := 20;

  EADesdeMes.Left := 69;
  EADesdeMes.Top := 20;
  EAHastaMes.Left := 201;
  EAHastaMes.Top := 20;

  EADesdeAnio.Left := 96;
  EADesdeAnio.Top := 20;
  EAHastaAnio.Left := 227;
  EAHastaAnio.Top := 20;

  DTPDesde.Left := 132;
  DTPDesde.Top := 19;
  DTPHasta.Left := 263;
  DTPHasta.Top := 19;


end;

procedure TMangazo.VisualizarComponentes;
var i, leftGroup : integer;
begin

    for i := 0 to ComponentCount-1 do
    begin
      if Components[i].GetParentComponent = GBFiltros then
      begin
           if (Components[i] is TComboBox) then
              (Components[i] as TComboBox).Visible := false;
           if (Components[i] is TCheckBox) then
              (Components[i] as TCheckBox).Visible := false;
           if (Components[i] is TLabel) then
              (Components[i] as TLabel).Visible := false;
           if (Components[i] is TGroupBox) then
              (Components[i] as TGroupBox).Visible := false;
           if (Components[i] is TEdit) then
              (Components[i] as TEdit).Visible := false;
           if (Components[i] is TDBLookupComboBoxAuto) then
              (Components[i] as TDBLookupComboBoxAuto).Visible := false;
      end;
    end;

    GBPeso.Visible := true;
    GBFrame.Visible := true;
    GBNacidosEntre.Visible := true;

    leftGroup := 10;

    for i := 0 to ComponentCount-1 do
    begin
      if Components[i].GetParentComponent = GBFiltros then
      begin
        if ((Components[I] is TGroupBox)) then
          if ((Components[I] as TGroupBox).Visible) then
          begin
            (Components[I] as TGroupBox).Left := leftGroup;
            (Components[I] as TGroupBox).Top := 56;

            leftGroup := leftGroup + (Components[I] as TGroupBox).Width + 20;
          end;
      end;
    end;

  GBSeparadorDesde.Left := 37;
  GBSeparadorDesde.Top  := 18;

  GBSeparadorHasta.Left := 167;
  GBSeparadorHasta.Top  := 18;

  EDesdeFrame.Left := 46;
  EDesdeFrame.Top := 20;
  LDesdeFrame.Left := 4;
  LDesdeFrame.Top := 23;
  EHastaFrame.Left := 137;
  EHastaFrame.Top := 20;
  LHastaFrame.Left := 98;
  LHastaFrame.Top := 23;

  EDesdePeso.Left := 46;
  EDesdePeso.Top := 20;
  LDesdePeso.Left := 4;
  LDesdePeso.Top := 23;
  EHastaPeso.Left := 137;
  EHastaPeso.Top := 20;
  LHastaPeso.Left := 98;
  LHastaPeso.Top := 23;

  LDesdeAnios.Left := 4;
  LDesdeAnios.Top := 23;
  LHastaAnios.Left := 151;
  LHastaAnios.Top := 23;

  LSeparadorDesde.Left := 10;
  LSeparadorDesde.Top := 2;
  LSeparadorHasta.Left := 1;
  LSeparadorHasta.Top := 2;

  EADesdeDia.Left := 44;
  EADesdeDia.Top := 20;
  EAHastaDia.Left := 176;
  EAHastaDia.Top := 20;

  EADesdeMes.Left := 71;
  EADesdeMes.Top := 20;
  EAHastaMes.Left := 203;
  EAHastaMes.Top := 20;

  EADesdeAnio.Left := 97;
  EADesdeAnio.Top := 20;
  EAHastaAnio.Left := 228;
  EAHastaAnio.Top := 20;

  DTPDesde.Left := 132;
  DTPDesde.Top := 19;
  DTPHasta.Left := 263;
  DTPHasta.Top := 19;

end;

procedure TMangazo.CBxRazaChange(Sender: TObject);
var aux : string;
begin

  if ((CBxRaza.Text <> 'RAZA') and (CBxRaza.Text <> '(TODAS)') and (CBxRaza.Text <> ''))then
  begin
    DMSoftvet.IBQSubCategoriaRaza.Close;
    DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := DMSoftvet.IBQRaza.Lookup('sinonimo',CBxRaza.Text,'id_raza'); //DBLCBARaza.KeyValue;
    DMSoftvet.IBQSubCategoriaRaza.Open;
    DMSoftvet.IBQSubCategoriaRaza.First;

    CBxTipoRegistro.Clear;
    CBxTipoRegistro.AddItem('TIPO DE REGISTRO',nil);
    CBxTipoRegistro.ItemIndex := 0;
    CargarCombos(DMSoftvet.IBQSubCategoriaRaza,'(TODOS)',CBxTipoRegistro,'sinonimo');

    if ((DMSoftvet.IBQRaza.Lookup('sinonimo',CBxRaza.Text,'id_raza') = 29) or (DMSoftvet.IBQRaza.Lookup('sinonimo',CBxRaza.Text,'id_raza') = 30)) then
      CBxColor.Enabled := true
    else
      CBxColor.Enabled := false;

    Parametros[CBxRaza.Tag].en_uso := true;

  end
  else
  begin
       CBxRaza.Items.Insert(0,'RAZA');
       CBxRaza.ItemIndex := 0;
       DelRaza := false;

       Parametros[CBxRaza.Tag].en_uso := false;
  end;

  EjecutarSQL;

end;

procedure TMangazo.CBxColorChange(Sender: TObject);
var aux : string;
begin

     if ((CBxColor.Text <> 'COLOR') and (CBxColor.Text <> '(TODOS)')) then
     begin
        Parametros[CBxColor.Tag].en_uso := true;
     end
     else
     begin
          CBxColor.Items.Insert(0,'COLOR');
          CBxColor.ItemIndex := 0;
          DelColor := false;
          Parametros[CBxColor.Tag].en_uso := false;
     end;

     EjecutarSQL;
end;

procedure TMangazo.CBxColorCloseUp(Sender: TObject);
begin
  if not(DelColor) then
  begin
    CBxColor.Items.Delete(0);
    DelColor := true;
  end;
end;

procedure TMangazo.CBxTipoRegistroChange(Sender: TObject);
var aux : string;
begin

     if ((CBxTipoRegistro.Text <> 'TIPO DE REGISTRO') and (CBxTipoRegistro.Text <> '(TODOS)')) then
     begin
        Parametros[CBxTipoRegistro.Tag].en_uso := true
     end
     else
     begin
          CBxTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
          CBxTipoRegistro.ItemIndex := 0;
          DelTR := false;
          Parametros[CBxTipoRegistro.Tag].en_uso := false;
     end;

     EjecutarSQL;
end;

procedure TMangazo.CBxTipoRegistroCloseUp(Sender: TObject);
begin
  if not(DelTR) then
  begin
    CBxTipoRegistro.Items.Delete(0);
    DelTR := true;
  end;
end;

procedure TMangazo.CBxPotreroCloseUp(Sender: TObject);
begin
  if not(DelPotrero) then
  begin
    CBxPotrero.Items.Delete(0);
    DelPotrero := true;
  end;

end;

procedure TMangazo.CBxPotreroChange(Sender: TObject);
var aux : string;
begin

     if ((CBxPotrero.Text <> 'POTRERO') and (CBxPotrero.Text <> '(TODOS)')) then
     begin
        Parametros[CBxPotrero.Tag].en_uso := true;
     end
     else
     begin
          CBxPotrero.Items.Insert(0,'POTRERO');
          CBxPotrero.ItemIndex := 0;
          DelPotrero := false;
          Parametros[CBxPotrero.Tag].en_uso := false;
     end;
     EjecutarSQL;
end;

procedure TMangazo.CBxRodeoChange(Sender: TObject);
var aux : string;
begin

     if ((CBxRodeo.Text <> 'RODEO') and (CBxRodeo.Text <> '(TODOS)')) then
     begin
        Parametros[CBxRodeo.Tag].en_uso := true
     end
     else
     begin
          CBxRodeo.Items.Insert(0,'RODEO');
          CBxRodeo.ItemIndex := 0;
          DelRodeo := false;
          Parametros[CBxRodeo.Tag].en_uso := false;
     end;

     EjecutarSQL;
end;

procedure TMangazo.CBxRodeoCloseUp(Sender: TObject);
begin

     if not(DelRodeo) then
     begin
          CBxRodeo.Items.Delete(0);
          DelRodeo := true;
     end;
end;

procedure TMangazo.CBxGrupoChange(Sender: TObject);
var aux : string;
begin

     if ((CBxGrupo.Text <> 'GRUPO') and (CBxGrupo.Text <> '(TODOS)')) then
     begin
        //FiltroGruposClick(CBxGrupo);
        Parametros[CBxGrupo.Tag].en_uso := true;
     end
     else
     begin
          CBxGrupo.Items.Insert(0,'GRUPO');
          CBxGrupo.ItemIndex := 0;
          DelGrupo := false;
          Parametros[CBxGrupo.Tag].en_uso := false;
     end;
     EjecutarSQL;
end;

procedure TMangazo.CBxCronologiaDentariaChange(Sender: TObject);
var aux : string;
begin

     if ((CBxCronologiaDentaria.Text <> 'CRONOLOGIA DENTARIA') and (CBxCronologiaDentaria.Text <> '(TODAS)')) then
     begin
        Parametros[CBxCronologiaDentaria.Tag].en_uso := true;
     end
     else
     begin
          CBxCronologiaDentaria.Items.Insert(0,'CRONOLOGIA DENTARIA');
          CBxCronologiaDentaria.ItemIndex := 0;
          DelCroDen := false;
          Parametros[CBxCronologiaDentaria.Tag].en_uso := false;
     end;

     EjecutarSQL;
end;

procedure TMangazo.CBxCronologiaDentariaCloseUp(Sender: TObject);
begin
      if not(DelCroDen) then
      begin
           CBxCronologiaDentaria.Items.Delete(0);
           DelCroDen := true;
      end;
end;

procedure TMangazo.CBxCondicionCorporalChange(Sender: TObject);
var aux : string;
begin

     if ((CBxCondicionCorporal.Text <> 'CONDICION CORPORAL') and (CBxCondicionCorporal.Text <> '(TODAS)')) then
     begin
        Parametros[CBxCondicionCorporal.Tag].en_uso := true;
     end
     else
     begin
          CBxCondicionCorporal.Items.Insert(0,'CONDICION CORPORAL');
          CBxCondicionCorporal.ItemIndex := 0;
          DelConCor := false;
          Parametros[CBxCondicionCorporal.Tag].en_uso := false;
     end;

     EjecutarSQL;

end;

procedure TMangazo.CBxCondicionCorporalCloseUp(Sender: TObject);
begin
      if not(DelConCor) then
      begin
           CBxCondicionCorporal.Items.Delete(0);
           DelConCor := true;
      end;
end;

procedure TMangazo.CBxEstadoReproductivoChange(Sender: TObject);
var aux : string;
begin

     if ((CBxEstadoReproductivo.Text <> 'ESTADO REPRODUCTIVO') and (CBxEstadoReproductivo.Text <> '(TODOS)')) then
     begin
        Parametros[CBxEstadoReproductivo.Tag].en_uso := true;
     end
     else
     begin
          CBxEstadoReproductivo.Items.Insert(0,'ESTADO REPRODUCTIVO');
          CBxEstadoReproductivo.ItemIndex := 0;
          DelEstRep := false;
          Parametros[CBxEstadoReproductivo.Tag].en_uso := false;
     end;

     EjecutarSQL;

end;

procedure TMangazo.CBxEstadoReproductivoCloseUp(Sender: TObject);
begin
     if not(DelEstRep) then
     begin
          CBxEstadoReproductivo.Items.Delete(0);
          DelEstRep := true;
     end;
end;

procedure TMangazo.CBxGrupoCloseUp(Sender: TObject);
begin
     if not(DelGrupo) then
     begin
          CBxGrupo.Items.Delete(0);
          DelGrupo := true;
     end
end;

procedure TMangazo.CBxCategoriaCloseUp(Sender: TObject);
begin

  if (CBxCategoria.Text = '') then
  begin
      if (DelCategoria) then
         CBxCategoria.Items.Insert(0,'CATEGORIA');

      CBxCategoria.ItemIndex := 0;
  end
  else
  begin
     if not(DelCategoria) then
     begin
          CBxCategoria.Items.Delete(0);
          DelCategoria := true;
     end
  end

end;

procedure TMangazo.CBxCategoriaChange(Sender: TObject);
begin

     if ((CBxCategoria.Text <> 'CATEGORIA') and (CBxCategoria.Text <> '(TODAS)') and (CBxCategoria.Text <> '')) then
     begin
          CBClick(CBxCategoria);
          Parametros[CBxCategoria.Tag].en_uso := true;
     end
     else
     begin
          CBxCategoria.Items.Insert(0,'CATEGORIA');
          CBxCategoria.ItemIndex := 0;
          DelCategoria := false;
          JvROBusquedaAvanzada.Collapse;
          Parametros[CBxCategoria.Tag].en_uso := false;
          VisualizarComponentes;
          EjecutarSQL;
     end;
end;

procedure TMangazo.CBxPreservicioChange(Sender: TObject);
begin

     if ((CBxPreservicio.Text <> 'PRESERVICIO') and (CBxPreservicio.Text <> '(TODOS)')) then
       Parametros[CBxPreservicio.Tag].en_uso := true
     else
     begin
          CBxPreservicio.Items.Insert(0,'PRESERVICIO');
          CBxPreservicio.ItemIndex := 0;
          DelPre := false;
          Parametros[CBxPreservicio.Tag].en_uso := false;
     end;

     EjecutarSQL;
end;

procedure TMangazo.CBxPreservicioCloseUp(Sender: TObject);
begin
      if not(DelPre) then
      begin
           CBxPreservicio.Items.Delete(0);
           DelPre := true;
      end;
end;

procedure TMangazo.CBxCantidadPartosChange(Sender: TObject);
begin
     ECantPartos.Text := '';

     if ((CBxCantidadPartos.Text <> 'CANTIDAD DE PARTOS') and (CBxCantidadPartos.Text <> '(TODOS)')) then
     begin
       ECantPartos.Text := CBxCantidadPartos.Text;
       Parametros[CBxCantidadPartos.Tag].en_uso := true;
     end
     else
     begin
          CBxCantidadPartos.Items.Insert(0,'CANTIDAD DE PARTOS');
          CBxCantidadPartos.ItemIndex := 0;
          DelCanPar := false;
          Parametros[CBxCantidadPartos.Tag].en_uso := false;
     end;

     EjecutarSQL;
end;

procedure TMangazo.CBxCantidadPartosCloseUp(Sender: TObject);
begin

    if not(DelCanPar) then
    begin
         CBxCantidadPartos.Items.Delete(0);
         DelCanPar := true;
    end;
end;

procedure TMangazo.CBxCalidadSeminalChange(Sender: TObject);
begin

     if ((CBxCalidadSeminal.Text <> 'CALIDAD SEMINAL') and (CBxCalidadSeminal.Text <> '(TODAS)')) then
          Parametros[CBxCalidadSeminal.Tag].en_uso := true
     else
     begin
          CBxCalidadSeminal.Items.Insert(0,'CALIDAD SEMINAL');
          CBxCalidadSeminal.ItemIndex := 0;
          DelCalSem := false;
          Parametros[CBxCalidadSeminal.Tag].en_uso := false;
     end;

     EjecutarSQL;
end;

procedure TMangazo.CBxCalidadSeminalCloseUp(Sender: TObject);
begin

     if not(DelCalSem) then
     begin
          CBxCalidadSeminal.Items.Delete(0);
          DelCalSem := true;
     end;
end;

procedure TMangazo.CBxExamenClinicoChange(Sender: TObject);
begin

     if ((CBxExamenClinico.Text <> 'EXAMEN CLINICO') and (CBxExamenClinico.Text <> '(TODOS)')) then
          Parametros[CBxExamenClinico.Tag].en_uso := true
     else
     begin
          CBxExamenClinico.Items.Insert(0,'EXAMEN CLINICO');
          CBxExamenClinico.ItemIndex := 0;
          DelExaCli := false;
          Parametros[CBxExamenClinico.Tag].en_uso := false;
     end;

     EjecutarSQL;
end;

procedure TMangazo.CBxExamenClinicoCloseUp(Sender: TObject);
begin

     if not(DelExaCli) then
     begin
          CBxExamenClinico.Items.Delete(0);
          DelExaCli := true;
     end;
end;

procedure TMangazo.CBxCapacidadServicioChange(Sender: TObject);
begin

     if ((CBxCapacidadServicio.Text <> 'CAPACIDAD DE SERVICIO') and (CBxCapacidadServicio.Text <> '(TODOS)')) then
          Parametros[CBxCapacidadServicio.Tag].en_uso := true
     else
     begin
          CBxCapacidadServicio.Items.Insert(0,'CAPACIDAD DE SERVICIO');
          CBxCapacidadServicio.ItemIndex := 0;
          DelCapSer := false;
          Parametros[CBxCapacidadServicio.Tag].en_uso := false;
     end;

     EjecutarSQL;
end;

procedure TMangazo.CBxCapacidadServicioCloseUp(Sender: TObject);
begin

     if not(DelCapSer) then
     begin
          CBxCapacidadServicio.Items.Delete(0);
          DelCapSer := true;
     end;
end;

procedure TMangazo.JvIBotonBuscarClick(Sender: TObject);
begin
     EChange(EBuscarAnimal);
end;

procedure TMangazo.CBxAreaPelvicaChange(Sender: TObject);
begin
     if ((CBxAreaPelvica.Text <> 'AREA PELVICA') and (CBxAreaPelvica.Text <> '(TODAS)')) then
        Parametros[CBxAreaPelvica.Tag].en_uso := true
     else
     begin
          CBxAreaPelvica.Items.Insert(0,'AREA PELVICA');
          CBxAreaPelvica.ItemIndex := 0;
          DelArPel := false;
          Parametros[CBxAreaPelvica.Tag].en_uso := false;
     end;

     EjecutarSQL;
end;

procedure TMangazo.CBxAreaPelvicaCloseUp(Sender: TObject);
begin

     if not(DelArPel) then
     begin
          CBxAreaPelvica.Items.Delete(0);
          DelArPel := true;
     end;
end;

procedure TMangazo.IBuscarAnimalClick(Sender: TObject);
begin
     if (EBuscarAnimal.Text <> '') then
     begin
       CBAnimal.Checked := true;
       CBClick(EBuscarAnimal);
       EChange(EBuscarAnimal);
     end
     else
     begin
       CBAnimal.Checked := false;
       CBClick(EBuscarAnimal);
       EChange(EBuscarAnimal);
     end;
end;

procedure TMangazo.EDesdePesoChange(Sender: TObject);
begin

     if (EDesdePeso.Text <> '') then
     begin
          CBPeso.Checked := true;
          CBClick(CBPeso);
          EChange(EDesdePeso);
     end
     else
     begin
          CBPeso.Checked := false;
          CBClick(CBPeso);
          EChange(EDesdePeso);
     end;

end;

procedure TMangazo.EHastaPesoChange(Sender: TObject);
begin
     if (EHastaPeso.Text <> '') then
     begin
          CBPeso.Checked := true;
          CBClick(CBPeso);
          EChange(EHastaPeso);
     end
     else
     begin
          CBPeso.Checked := true;
          CBClick(CBPeso);
          EChange(EDesdePeso);
     end;
end;

procedure TMangazo.EDesdeFrameChange(Sender: TObject);
begin
     if (EDesdeFrame.Text <> '') then
     begin
          CBFrame.Checked := true;
          CBClick(CBFrame);
          EChange(EDesdeFrame);
     end
     else
     begin
          CBFrame.Checked := false;
          CBClick(CBFrame);
          EChange(EDesdeFrame);
     end;
end;

procedure TMangazo.EHastaFrameChange(Sender: TObject);
begin
     if (EHastaFrame.Text <> '') then
     begin
          CBFrame.Checked := true;
          CBClick(CBFrame);
          EChange(EHastaFrame);
     end
     else
     begin
          CBFrame.Checked := false;
          CBClick(CBFrame);
          EChange(EDesdeFrame);
     end;
end;

procedure TMangazo.EDiasCeloDesdeChange(Sender: TObject);
begin

     if (EDiasCeloDesde.Text <> '') then
     begin
          CBDiasCelo.Checked := true;
          CBClick(CBDiasCelo);
          EChange(EDiasCeloDesde);
     end
     else
     begin
          CBDiasCelo.Checked := false;
          CBClick(CBDiasCelo);
          EChange(EDiasCeloDesde);
     end;
end;

procedure TMangazo.EDiasCeloHastaChange(Sender: TObject);
begin
     if (EDiasCeloHasta.Text <> '') then
     begin
          CBDiasCelo.Checked := true;
          CBClick(CBDiasCelo);
          EChange(EDiasCeloHasta);
     end
     else
     begin
          CBDiasCelo.Checked := false;
          CBClick(CBDiasCelo);
          EChange(EDiasCeloDesde);
     end;
end;

procedure TMangazo.EDesdePartosChange(Sender: TObject);
begin
     if (EDesdePartos.Text <> '') then
     begin
          CBDiasParto.Checked := true;
          CBClick(CBDiasParto);
          EChange(EDesdePartos);
     end
     else
     begin
          CBDiasParto.Checked := false;
          CBClick(CBDiasParto);
          EChange(EDesdePartos);
     end;
end;

procedure TMangazo.EHastaPartosChange(Sender: TObject);
begin
     if (EHastaPartos.Text <> '') then
     begin
          CBDiasParto.Checked := true;
          CBClick(CBDiasParto);
          EChange(EHastaPartos);
     end
     else
     begin
          CBDiasParto.Checked := false;
          CBClick(CBDiasParto);
          EChange(EDesdePartos);
     end;
end;

procedure TMangazo.EDesdeCircEscChange(Sender: TObject);
begin
     if (EDesdeCircEsc.Text <> '') then
     begin
          CBCircEsc.Checked := true;
          CBClick(CBCircEsc);
          EChange(EDesdeCircEsc);
     end
     else
     begin
          CBCircEsc.Checked := false;
          CBClick(CBCircEsc);
          EChange(EDesdeCircEsc);
     end;
end;

procedure TMangazo.EHastaCircEscChange(Sender: TObject);
begin
     if (EHastaCircEsc.Text <> '') then
     begin
          CBCircEsc.Checked := true;
          CBClick(CBCircEsc);
          EChange(EHastaCircEsc);
     end
     else
     begin
          CBCircEsc.Checked := false;
          CBClick(CBCircEsc);
          EChange(EHastaCircEsc);
     end;
end;

procedure TMangazo.DTPDesdeCloseUp(Sender: TObject);
var  aNo, Mes, Dia :word;
begin

     DecodeDate(DTPDesde.Date, aNo, Mes, Dia);
     EADesdeDia.Text := IntToStr(Dia);
     EADesdeMes.Text := IntToStr(Mes);
     EADesdeAnio.Text := IntToStr(aNo);

     EADesdeAnioChange(sender);

end;

procedure TMangazo.DTPHastaCloseUp(Sender: TObject);
var  aNo, Mes, Dia :word;
begin
     DecodeDate(DTPHasta.Date, aNo, Mes, Dia);
     EAHastaDia.Text := IntToStr(Dia);
     EAHastaMes.Text := IntToStr(Mes);
     EAHastaAnio.Text := IntToStr(aNo);
     EAHastaAnioChange(sender);
end;


function TMangazo.ArmarFecha(id : integer) : string;
var fecha : string;
    diaOk, mesOk, anioOk : boolean;
begin

     diaOk := false;
     mesOk := false;
     anioOk := false;

     if (id = 0) then //fecha desde
     begin
          if ((Length(EADesdeDia.Text) = 1) and (EADesdeDia.Text <> '0')) then
          begin
              fecha := '0'+EADesdeDia.Text;
              diaOk := true;
          end
          else
              if (EADesdeDia.Text >= '01') and (EADesdeDia.Text <= '31') then
              begin
                fecha := EADesdeDia.Text;
                diaOk := true;
              end
              else
              begin
                diaOk := false;
                MostrarMensaje(tmError,'Valor de día ingresado no valido.');
                EADesdeDia.SetFocus;
              end;

          if (Length(EADesdeMes.Text) = 1) then
          begin
              mesOk := true;
              fecha := fecha+'/0'+EADesdeMes.Text;
          end
          else
              if (EADesdeMes.Text >= '01') and (EADesdeMes.Text <= '12') then
              begin
                fecha := fecha+'/'+EADesdeMes.Text;
                mesOk := true;
              end
              else
              begin
                mesOk := false;
                MostrarMensaje(tmError,'Valor de mes ingresado no valido.');
                EADesdeMes.SetFocus;
              end;

          if (Length(EADesdeAnio.Text) = 2) then
          begin
              fecha := fecha+'/20'+EADesdeAnio.Text;
              if ((diaOk) and (mesOk)) then
                fecha_D_Ok := true;
          end
          else
          begin
                fecha := fecha+'/'+EADesdeAnio.Text;
                if ((diaOk) and (mesOk)) then
                  fecha_D_Ok := true;
          end;
     end
     else
     begin
          if ((Length(EAHastaDia.Text) = 1) and (EAHastaDia.Text <> '0')) then
          begin
              diaOk := true;
              fecha := '0'+EAHastaDia.Text;
          end
          else
              if (EAHastaDia.Text >= '01') and (EAHastaDia.Text <= '31') then
              begin
                fecha := EAHastaDia.Text;
                diaOk := true;
              end
              else
              begin
                diaOk := false;
                MostrarMensaje(tmError,'Valor de día ingresado no valido.');
                EAHastaDia.SetFocus;
              end;

          if (Length(EAHastaMes.Text) = 1) then
          begin
              mesOk := true;
              fecha := fecha+'/0'+EAHastaMes.Text;
          end
          else
              if (EAHastaMes.Text >= '01') and (EAHastaMes.Text <= '12') then
              begin
                fecha := fecha+'/'+EAHastaMes.Text;
                mesOk := true;
              end
              else
              begin
                mesOk := false;
                MostrarMensaje(tmError,'Valor de mes ingresado no valido.');
                EAHastaMes.SetFocus;
              end;

          if (Length(EAHastaAnio.Text) = 2) then
          begin
              fecha := fecha+'/20'+EAHastaAnio.Text;
              if ((diaOk) and (mesOk)) then
                fecha_H_Ok := true;
          end
          else
          begin
                fecha := fecha+'/'+EAHastaAnio.Text;
                if ((diaOk) and (mesOk)) then
                  fecha_H_Ok := true;
          end;
     end;

     Result := fecha;
end;


procedure TMangazo.EADesdeDiaChange(Sender: TObject);
begin
  cantDD := Length(EADesdeDia.Text);

  if (cantDD = 2) then
  begin
      ChequearPrimeraFecha;
      EADesdeMes.SetFocus;
  end;

  if (EADesdeDia.Text = '') then
  begin
       CBAnios.Checked := false;
  end;

end;

procedure TMangazo.EADesdeMesChange(Sender: TObject);
begin
  cantMD := Length(EADesdeMes.Text);

  if (cantMD = 2) then
  begin
      ChequearPrimeraFecha;
      EADesdeAnio.SetFocus;
  end;

  if (EADesdeMes.Text = '') then
  begin
    EADesdeDia.SetFocus;
    CBAnios.Checked := false;
  end;


end;

procedure TMangazo.EADesdeAnioChange(Sender: TObject);
begin
  cantAD := Length(EADesdeAnio.Text);

  if ((cantAD >= 2) and (cantAD <=4)) then
  begin
      ChequearPrimeraFecha;
      EDesdeAnios.Text := ArmarFecha(0);

      if not(fecha_D_OK) then
         EDesdeAnios.Text := ''
      else
        EAHastaDia.SetFocus;
  end;

  if (EADesdeAnio.Text = '') then
  begin
    EADesdeMes.SetFocus;
    CBAnios.Checked := false;
  end;

end;

procedure TMangazo.EAHastaDiaChange(Sender: TObject);
begin
  cantDH := length(EAHastaDia.Text);

  if (cantDH = 2) then
  begin
      ChequearPrimeraFecha;
      EAHastaMes.SetFocus;
  end;

  if (EAHastaDia.Text = '') then
  begin
    EADesdeAnio.SetFocus;
    CBAnios.Checked := false;
  end;

end;

procedure TMangazo.EAHastaMesChange(Sender: TObject);
begin
  cantMH := Length(EAHastaMes.Text);

  if (cantMH = 2) then
  begin
      ChequearPrimeraFecha;
      EAHastaAnio.SetFocus;
  end;

  if (EAHastaMes.Text = '') then
  begin
    EAHastaDia.SetFocus;
    CBAnios.Checked := false;
  end;
end;

procedure TMangazo.EAHastaAnioChange(Sender: TObject);
begin
  cantAH := Length(EAHastaAnio.Text);

  if ((cantAH = 2) or (cantAH = 4)) then
  begin
      ChequearSegundaFecha;
      EHastaAnios.Text := ArmarFecha(1);

      if ((fecha_D_OK) and (fecha_H_OK)) then
      begin
        CBAnios.Checked := true;
        CBClick(CBAnios);
        EChange(EHastaAnios);
      end;
  end;

  if (EAHastaAnio.Text = '') then
  begin
    EAHastaMes.SetFocus;
    CBAnios.Checked := false;
  end;

end;

procedure TMangazo.ChequearPrimeraFecha;
begin
end;

procedure TMangazo.ChequearSegundaFecha;
begin

end;

procedure TMangazo.EADesdeDiaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
      EADesdeMes.SetFocus;
      ChequearPrimeraFecha;
      Key:= #0;
  end;
end;

procedure TMangazo.EADesdeMesKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
      EADesdeAnio.SetFocus;
      ChequearPrimeraFecha;
      Key:= #0;
  end;
end;

procedure TMangazo.EADesdeAnioKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
      EDesdeAnios.Text := ArmarFecha(0);
      if (fecha_D_OK) then
      begin
        EAHastaDia.SetFocus;
        ChequearPrimeraFecha;
        CBAnios.Checked := true;
        CBClick(CBAnios);
        EChange(EDesdeAnios);
      end;
      Key:= #0;
  end;
end;

procedure TMangazo.EAHastaDiaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
      EAHastaMes.SetFocus;
      ChequearSegundaFecha;
      Key:= #0;
  end;
end;

procedure TMangazo.EAHastaMesKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
      EAHastaAnio.SetFocus;
      ChequearSegundaFecha;
      Key:= #0;
  end;
end;

procedure TMangazo.EAHastaAnioKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
      ChequearSegundaFecha;

      if ((fecha_D_OK) and (fecha_H_OK)) then
      begin
        CBAnios.Checked := true;
        CBClick(CBAnios);
        EChange(EHastaAnios);
      end;

      Key:= #0;
  end;
end;

procedure TMangazo.EBuscarAnimalKeyPress(Sender: TObject; var Key: Char);
begin

  if (key = #13) then
  begin
      IBuscarAnimalClick(Sender);
      Key:= #0;
  end;

end;

procedure TMangazo.ReSetearFiltros;
var i : integer;
begin
  for i := 0 to ComponentCount-1 do
    if (Components[I].GetParentComponent = GBFiltros) then
      if ((Components[I] is TComboBox)) then
        (Components[I] as TComboBox).Clear;

  Inic_Filtros;

end;


end.
