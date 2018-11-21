unit UEveSimple;

interface

uses
  Windows, UEveUniversal, Grids, DBGrids, UBDBGrid, StdCtrls, Forms, StrUtils,
   DB, IBCustomDataSet, IBQuery, Classes, ActnList, MemoAuto, Registry,
  ComCtrls, Buttons, Controls, ExtCtrls, Messages, SysUtils, Variants,DateUtils,
  Graphics, Dialogs, DBClient, DBLocal, DBLocalI, IBDatabase, IBStoredProc,UDBControl, UFrameMangazo,
  EditAuto, EditAutoMinuscula, DBEditMinuscula, DataExport, DataToXLS,
  WinXP, IBEvents, UDMSoftvet,ULectorElectronico,ULectorAllFlexSerie,
  JvExExtCtrls, JvImage, jpeg, PngImage, JvGIF, ImgList, PngImageList,
  JvExControls, JvLabel, JvComponentBase, JvBalloonHint,
  Menus, xmldom, XMLIntf, msxmldom, XMLDoc;
//
type
  TColumnWidthHelper = record   //autofit columns
   Index : integer;
   MaxWidth, MinWidth : integer;
  end;
//
type
  TModoEvento = (meIndividual, meMasivo);
  TModoEnfermedadMasiva = (memSangradoBrucelosis, memTuberculinizacion, memRaspadoToro);

  TEventComponent = Array of TComponent;

  TRegDatoAnimal = record
    Animal : integer;
    Fecha : TDate;
  end;

  regDato = record
    nomCampo:string;
    valorCampo:variant;
 end;

 arrGral = Array of regDato;

 TRegImportacion = record
  id_importacion : string;
  fecha_importacion : TDateTime;
  tipo_evento : integer;
  establecimiento : integer;
  end;

type arrSimple = array of String;

  TFEveSimple = class(TFEveUniversal)
    TSManga: TTabSheet;
    TSDatos: TTabSheet;
    TSGrilla: TTabSheet;
    GBDatos: TGroupBox;
    GBObservaciones: TGroupBox;
    MAObservacion: TMemoAuto;
    DSSimple: TDataSource;
    MSimple: TMangazo;
    IBDSSimple: TIBDataSet;
    BDBGSimple: TBitDBGrid;
    IBSPCrearGrupo: TIBStoredProc;
    IBSPCrearGrupoIDNUEVOGRUPO: TIntegerField;
    ASacarAnimal: TAction;
    AIngresoSecuenciado: TAction;
    IBQValidaciones: TIBQuery;
    IBQEvento: TIBQuery;
    BIngresoSecuenciado: TBitBtn;
    BSacarAnimal: TBitBtn;
    BBXls: TBitBtn;
    EABusqueda: TEditAuto;
    IBSPActEventos: TIBStoredProc;
    BBXlsImport: TBitBtn;
    OpenDlg: TOpenDialog;
    IBQDelEventosAux: TIBQuery;
    SBSelTodos: TSpeedButton;
    IBQRepetidos: TIBQuery;
    TimerLector: TTimer;
    GuardarGrillaTemporal: TTimer;
    IBQImportacion: TIBQuery;
    IBQIE: TIBQuery;
    BBImpGesReader: TBitBtn;
    ODArchivoGes: TOpenDialog;
    Image5: TImage;
    LSelTodos: TLabel;
    LSacarAnimal: TLabel;
    JvIExpExcel: TJvImage;
    LExpExcel: TLabel;
    LImpExcel: TLabel;
    JvIImpExcel: TJvImage;
    JvIDispElect: TJvImage;
    LDispElect: TLabel;
    ODVesta: TOpenDialog;
    PanelIzq: TPanel;
    TimerBarra: TTimer;
    PanelDer: TPanel;
    ISubirIzq: TImage;
    IBajarIzq: TImage;
    IBarraVertIzq: TImage;
    IBarraHorIzq: TImage;
    SBBarrita: TScrollBar;
    ISubirDer: TImage;
    IBajarDer: TImage;
    IBarraVertDer: TImage;
    IBarraHorDer: TImage;
    LVista: TLabel;
    LSeleccionarVarios: TLabel;
    ILVets: TImageList;
    ISacarAnimal: TJvImage;
    ISelTodos: TJvImage;
    ISeleccionarVarios: TJvImage;
    IBQCarElect: TIBQuery;
    IBQExisteEQ: TIBQuery;
    IBQTipoEvento: TIBQuery;
    PMMarcasLector: TPopupMenu;
    Allflex1: TMenuItem;
    Datamars1: TMenuItem;
    Baqueano1: TMenuItem;
    XMLDoc: TXMLDocument;
    procedure ATerminarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure MSimpleBBEliminarTodosClick(Sender: TObject);
    procedure BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ASacarAnimalExecute(Sender: TObject);
    procedure AIngresoSecuenciadoExecute(Sender: TObject);
    procedure MSimpleBBEliminarUnoClick(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    procedure BDBGSimpleColEnter(Sender: TObject);
    procedure MSimpleRBTodasClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MSimpleBBAgregarTodosClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure BDBGSimpleDblClick(Sender: TObject);
    procedure MSimpleBBAgregarUnoClick(Sender: TObject);
    procedure MSimpleBDBGDisponiblesDblClick(Sender: TObject);
    procedure MSimpleBDBGDisponiblesKeyPress(Sender: TObject;
      var Key: Char);
    procedure MSimpleIBQDisponiblesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);                                                                                     
    procedure BDBGSimpleCellClick(Column: TColumn);
    procedure IBQSPRNAfterOpen(DataSet: TDataSet);
    procedure IBQSPEventoIndAfterOpen(DataSet: TDataSet);
    procedure BBXlsImportClick(Sender: TObject);
    procedure GetEvent(Sender : TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBSelTodosClick(Sender: TObject);
    procedure BDBGSimpleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGSimpleKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PcBasicoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure actualizarCantAnimales;
    procedure TimerLectorTimer(Sender: TObject);
    procedure GuardarGrillaTemporalTimer(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure BBImpGesReaderClick(Sender: TObject);
    procedure ISelTodosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ISelTodosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LSelTodosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LSelTodosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImpDisVesta(Sender : TObject);

//------------------------------------------------------------------------------

    procedure AutoAjustarColumnas;

    procedure AjustarPanelesLaterales;
    procedure ISubirIzqClick(Sender: TObject);
    procedure IBajarIzqClick(Sender: TObject);
    procedure SBBarritaScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);

    procedure TimerBarraTimer(Sender: TObject);
    procedure IBarraVertIzqMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IBarraVertIzqMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure CalcularIncremento(valor : integer);
    procedure IBarraHorIzqMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IBarraHorIzqMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure IBarraHorIzqMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ISeleccionarVariosClick(Sender: TObject);
    procedure AAnteriorExecute(Sender: TObject);
    procedure JvIExpExcelMouseEnter(Sender: TObject);
    procedure JvIExpExcelMouseLeave(Sender: TObject);
    procedure JvIImpExcelMouseEnter(Sender: TObject);
    procedure JvIImpExcelMouseLeave(Sender: TObject);
    procedure JvIDispElectMouseEnter(Sender: TObject);
    procedure JvIDispElectMouseLeave(Sender: TObject);
    procedure ISacarAnimalMouseEnter(Sender: TObject);
    procedure ISacarAnimalMouseLeave(Sender: TObject);
    procedure ISelTodosMouseEnter(Sender: TObject);
    procedure ISelTodosMouseLeave(Sender: TObject);
    procedure ISeleccionarVariosMouseEnter(Sender: TObject);
    procedure ISeleccionarVariosMouseLeave(Sender: TObject);
    procedure MSimpleBDBGSeleccionadosDblClick(Sender: TObject);
    procedure MSimpleBDBGSeleccionadosKeyPress(Sender: TObject;
      var Key: Char);
    procedure ASiguienteExecute(Sender: TObject);
    procedure Allflex1Click(Sender: TObject);
    procedure Datamars1Click(Sender: TObject);
    procedure Baqueano1Click(Sender: TObject);
//------------------------------------------------------------------------------

  private
    FModoEvento: TModoEvento;
    FIDAnimal: integer;
    FHacerCommit: boolean;
    FEventoGenerado: integer;
    FEventoDisparador: integer;
    FIDRP: String;
    Animales : Array of TRegDatoAnimal;
    CantAnimales, Indice : Integer;
    archivo:TFileName;
    pag:OleVariant;
    CantComps : Integer;
    ArrComponents : TEventComponent;
    Nuevo : Boolean;
    preguntar:boolean;
    apretado:boolean;
    ind:integer;
    permitir,desdeFmov:boolean;
    LeyoCaravana : Boolean;

    IniP, IniPos : TPoint;
    Pressed : Boolean;
    leidosNuevos: array of String;
    leidosExistentes: array of String;

    //regImportacion:TRegImportacion;
    arrImportaciones:array of TRegImportacion;
    procedure SetConManga(const Value: boolean);
    procedure SetModoEvento(const Value: TModoEvento);

    procedure TerminarMasivo;
    procedure CargarGrillaDetalle;
    procedure SetIDAnimal(const Value: integer);
    procedure SetIDRP(const Value: String);

    procedure PaintRequired;
    procedure SetColumnWidth (MinLength:Integer; MaxLength: Integer);
    procedure SetCrearGrupo(const Value: boolean);
    procedure FillPickList(const campo: string; const Qry: TDataSet);
    procedure SetCommit(const Value: boolean);
    procedure setEventoDisparador(const Value: integer);
    procedure setEventoGenerado(const Value: integer);
    procedure CargarColumnas(Animal : Integer);

    function RegistroCambio(Component : TComponent) : Boolean;
    function ExistComponent(Component : TComponent) : Boolean;
    function getPosicion(str:string;arr:arrGral):integer;
    procedure marcarRepetidos(rp:string);
    procedure crearLector;
    procedure cerrarLector;
    procedure guardarImportacion(i:integer);
    procedure HabilitarComponentesVersionBasica; override;

    procedure AgregarDatosVesta(Archivo : String);

    function GetPosicionPanel(reg : integer) : integer;
    function GetPosicionGrilla(top : integer) : integer;
    function GetNavegacion(valor : integer) : integer;
  protected
    FConManga: boolean;
    FTipoEvento: integer;
    FCrearGrupo: boolean;
    CantidadErrores  : integer;
    CantidadWarnings : integer;
    SQLStringList: TStringList;
    FNombreGrupo: String;
    PuedeTerminar : Boolean;
    cargaXLS:boolean;
    mostrar:boolean;
    tipoCC:string;
    PasoGrilla : Boolean;
    IManga, IDatos, IGrilla, IMangaA, IDatosA, IGrillaA : TBitmap;
    procedure ClearErrores;
    procedure GetErrors; override;
    procedure CargarDatosGrilla; virtual;
    procedure CargarParametrosRN; virtual;
    procedure CargarParametrosSP; virtual;
    procedure TerminarIndividual; virtual;
    procedure AntesDeEjecutarSP; virtual;
    procedure AntesDeTerminar; virtual;
    Procedure DespuesDeTerminar; virtual;
    procedure EliminarDeSeleccionados;
    procedure ControlEventoOnExit(Sender: TObject); override;
    procedure LoadSQLStringList;virtual;
(* cargan los parametros para cargar c/u de los eventos de la grilla detalle*)
    procedure CargarParametrosMasivo;virtual;
    function NoExiste (Id: string; DS: TDataSource):boolean;
    procedure AsignarValoresDefecto; virtual;
    procedure ManejarDatosDeSP; virtual;
    function Convertido(Control: TControl; var IControl: IDBControl): boolean;
    procedure ejecucionTerminar;
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
    procedure borrarUno(idAnimal: Integer);
    procedure RealizarCambio(Component : TComponent; CamposBD : array of TField;
      ValoresCamposBD : array of Variant);

    procedure BorrarEventosAuxiliares();
    procedure importarDeMovil;virtual;
    procedure creacionGrupo;
    procedure setDefault(campo:string);virtual;
    procedure IBDSSimpleID_RPSetText(Sender: TField;const Text: String);virtual;
   procedure cargarAnimales;
   procedure cargarDatos(i:integer);virtual;
   //function datoRequerido(i:integer):string;
   procedure cargarArchivo(archivo:String);
   procedure continuarGrilla;virtual;
   procedure configurarColumnasAGuardar;virtual;
   procedure configurarColumnasACargar;virtual;
   procedure acomodarGrilla;virtual;
   procedure insertEveCambioUbicacion();virtual;
   procedure cambiarCB(combo:TComponent;nro:integer);
   procedure SacarRequeridos;
   procedure crearServicio();virtual; //Lo implementa solo la clase UEveInseminacionArtificial porque estaba mal, necesitaba el grupo antes de ejecutar el metodo ejecucionTerminar y ese metodo se ejecutaba dentro del mismo
   procedure CargarEquivalencias(DireccionArch : String);
   procedure CargarIdentVesta(DireccionArch : String);
   procedure cargarDesdeExcel(DireccionArch : String);
   procedure CargarDesdeXML(arch:TFileName);
  public
    NomPotreroMapa : String;
    IdPotreroMapa : Integer;
    {#1 INICIO 28/11/2014 Matias Rizzi}
    archivo_Importacion : String;
    {#1 FIN 28/11/2014 Matias Rizzi}
    procedure CargarPickListEnGrilla;
    procedure AutoFitColumns();
    procedure LabelComponenteMouseEnter(Sender: TObject);
    procedure LabelComponenteMouseLeave(Sender: TObject);
    procedure acomodarGrid(const DBGrid: TBitDBGrid);
    function ObtenerFilaPrimerDato(DireccionArch : String): Integer;

  published
    property ConManga : boolean read FConManga write SetConManga;
    property ModoEve  : TModoEvento read FModoEvento write SetModoEvento;
    property IDAnimal : integer read FIDAnimal write SetIDAnimal;
    property HacerCommit : boolean read FHacerCommit write SetCommit;
    property EventoDisparador : integer read FEventoDisparador write setEventoDisparador;
    property EventoGenerado : integer read FEventoGenerado write setEventoGenerado;
    property TipoEvento : integer read FTipoEvento;
    property IDRP : String read FIDRP write SetIDRP;

   (* mediante esta propiedad decidimos al momento de crear un formulario de evento si se genera o no
    un grupo que identifique el conjunto de eventos que se generan *)
    property CrearGrupo : boolean read FCrearGrupo write SetCrearGrupo;

    procedure SetText(Sender: TField; const Text: String);

    procedure RefrescarMangaDisp();
    procedure completarCampos; virtual;
  end;

var
  FEveSimple: TFEveSimple;
  ColumnWidthHelper : TColumnWidthHelper;
  BotonPulsado : boolean;
  arrNuevos:arrSimple;
  str:string;
  //FLectorElectronico:TLectorElectronico;
  Increment, Posicion, UltimaPos, PosAnt, PosAct, aux : integer;
  TodosSel, EnTope, SelVariosOff : boolean;
  regActual, regSig, regAnt, posXT, posYT, IniBHoriz, FinBHoriz, selec: integer;
  arrSeleccionados : array of integer;



implementation

{$R *.dfm}
uses UPrincipal,uTiposGlobales, UMensajeHuella, UClassType,UNombreGrupo, UAvanceTerminar,
     UDBEditAuto, UDBLookUpComboBoxAuto, UColumnEditor,DateTimePickerAuto, Math,
     UREPFichaAnimal, UCartel, ComObj, UUniversal, UFunctions, UEveAltaMasiva,
     UMovCargarDatos,UEveServicioBasico, UABMPotreros,UABMRodeos,UABMEmpleados,
     UImportacion,UMensajeNuevos, UEveNacimientos, UEvePeso, UTraduccion, UEveDiagnosticoGestacion,
     TypInfo, UImpExpExcel, UImpControles, UMensajeGuardarVincular;

procedure TFEveSimple.crearServicio;
begin
end;

(*
  Armamos un handler para el OnChange de los controles
*)
procedure TFEveSimple.ControlEventoOnExit(Sender: TObject);
begin
//  if MSimple.IBQSeleccionados.IsEmpty then ClearErrores;
  if(ModoEve = meIndividual)then
    if(ConManga)then
       ATerminar.Enabled := PuedeGrabar and MSimple.PuedeGrabar     // si es individual x seleccionar solo un elemento en la manga
     else
       ATerminar.Enabled := PuedeGrabar
  else
  begin
    //BBXlsImport.Enabled:= (MSimple.IBQSeleccionados.RecordCount=IBDSSimple.RecordCount);
    TSGrilla.TabVisible := PuedeGrabar and (MSimple.IBQSeleccionados.RecordCount >1); (*oculta la grilla hasta que todos los requeridos esten llenos*)
    ATerminar.Enabled := (PuedeGrabar and MSimple.PuedeGrabar and (PCBasico.ActivePage = TSGrilla));
  end;
  JvTerminar.Visible := ATerminar.Enabled;
  LBBTerminar.Visible := ATerminar.Enabled;

  ControlBounds;
end;

(*
  Llamamos a los SP y cargamos los errores en caso de haberlos
*)
procedure TFEveSimple.TerminarIndividual;
var
  ejecutar : boolean;
  i:integer;
begin
  inherited;
  {TODO 1 -omartin: Meter esto en un try catch cuando veamos el teme errores con Cartu}
  ejecutar := False;

  //if not Assigned(FAvanceTerminar) then
  FAvanceTerminar := TFAvanceTerminar.Create(nil);
  FAvanceTerminar.Pos := 1;
  FAvanceTerminar.Max := 2;
  FAvanceTerminar.Modo := maVerificando;

  IBQSPRN.Close;
  CargarParametrosRN;
  FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
  IBQSPRN.Open;

  FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
  FAvanceTerminar.Close;

  ClearErrores;
  GetErrors;
  if (CantidadErrores > 0) then
      MostrarMensaje(tmError, 'Se produjeron errores en la operación, compruebe los valores e intente nuevamente')
  else if (CantidadWarnings > 0) then begin
    ejecutar := (MostrarMensaje(tmConsulta, 'El animal no respeta alguno de los parametros biológicos, desea Continuar?') = mrYes);
  end else begin
    ejecutar := True;
  end;

  PuedeTerminar := ejecutar;
  if ejecutar then
  try
    FAvanceTerminar.Pos := 1;
    FAvanceTerminar.Max := 2;

    FAvanceTerminar.Modo := maGuardando;
    IBQSPEventoInd.Close;
    CargarParametrosSP;
    FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
    IBQSPEventoInd.Open;
    ManejarDatosDeSP;
    FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
    insertEveCambioUbicacion;
    if Length(arrImportaciones)>0 then
    for i:=0 to Length(arrImportaciones)-1 do
      guardarImportacion(i);
    FAvanceTerminar.Modo := maListo;
    Close;
  except on e:Exception do
    begin
      FAvanceTerminar.MDetalles.Text := e.Message;
      FAvanceTerminar.Modo := maError;
    end;
  end;

  self.SetFocus;
  self.BringToFront;

  FAvanceTerminar.Destroy;
end;

(*
  Recorremos la grilla y se llama al SP por cada animal seleccionado
*)
procedure TFEveSimple.TerminarMasivo;    // agregar chequeos de RN y pintado de grilla
begin


    inherited;

   FAvanceTerminar := TFAvanceTerminar.Create(nil);
   FAvanceTerminar.Pos := 1;
   FAvanceTerminar.Max := IBDSSimple.RecordCount; //MSimple.ComponentCount;
   FAvanceTerminar.Modo := maVerificando;
   FAvanceTerminar.Update;
   FAvanceTerminar.Pos := 1;

  //**/*/*/*/*/*
   BDBGSimple.DataSource := nil;
   ClearErrores;
   IBDSSimple.First;
   while not(IBDSSimple.Eof)do begin
      IBQSPRN.Close;
      CargarParametrosRN;
      IBQSPRN.Open;
      GetErrors;
      IBDSSimple.Next;
      //nuevo codigo
      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
      FAvanceTerminar.Update;
      //***/*/*/*/*/*/*
    end;
   //FAvanceTerminar.Close;
   FAvanceTerminar.Destroy;

   BDBGSimple.DataSource := DSSimple;
   PuedeTerminar := false;


   if (CantidadErrores > 0) then
      MostrarMensaje(tmAdvertencia, 'Se produjeron errores en la operación, compruebe los valores e intente nuevamente')
   else
     if (CantidadWarnings > 0) then
       begin
         if(MostrarMensaje(tmConsulta, 'Algunos animales no respetan parametros biológicos, desea Continuar?') = mrYes)then
         begin
           PuedeTerminar := true;
           ejecucionTerminar;
         end;
       end
     else
      begin
        PuedeTerminar := true;
        ejecucionTerminar;
      end;

   self.SetFocus;
   self.BringToFront;

end;

(*
  Llamamos al método correspondiente según el modo (individual o masivo)
  en que se encuentra el evento en ese momento
*)
procedure TFEveSimple.ATerminarExecute(Sender: TObject);
begin
  inherited;
  //BDBGSimple.Hide;
  ATerminar.Enabled := false;
  CantAnimales := 0;
  Indice := 0;
  GuardarGrillaTemporal.enabled:=false;

//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
    begin
      //
    end
   else
//  {$ELSE}
      if FileExists(ExtractFilePath(Application.ExeName)+'\temp-'+inttostr(FPrincipal.EstablecimientoActual)+'-'+self.LTitulo.Caption+'.xls') then
        DeleteFile(ExtractFilePath(Application.ExeName)+'\temp-'+inttostr(FPrincipal.EstablecimientoActual)+'-'+self.LTitulo.Caption+'.xls');
//  {$ENDIF}
  if (ModoEve = meIndividual) then
      begin
      TerminarIndividual;
      end
  else
    TerminarMasivo;

    if (FHacerCommit) then
      FPrincipal.IBTPrincipal.CommitRetaining;{hago commit de la transaccion principal}

  //BDBGSimple.Show;
  //cerrarLector;
  ATerminar.Enabled := true;
end;

(*
  Recuperamos los errores que obtiene el Store Procedure de las Reglas de Negocio
  asociadas al evento, si existen Errores o Warnings los agrega al Memo de errores
*)
procedure TFEveSimple.GetErrors;
begin
  inherited;
  while not(IBQSPRN.Eof) do begin
    if (IBQSPRN.FieldValues['Result'] <> 'A') then
      if (ModoEve = meMasivo) then
        MAErrors.Lines.Add(IBQSPRN.FieldValues['Result'] + ':  '+IBDSSimple.FieldByName('id_rp').AsString+': '+ IBQSPRN.FieldValues['mensaje'])
      else
      begin
        MAErrors.Lines.Add(IBQSPRN.FieldValues['Result'] + ': '+ IBQSPRN.FieldValues['mensaje']);
        inc(CantidadWarnings);
      end;

    if (IBQSPRN.FieldValues['Result'] = 'E') then
      begin
        if (ModoEve = meMasivo) then
          begin
            IBDSSimple.Edit;
            IBDSSimple.FieldByName('EW').AsString := 'E';
            IBDSSimple.Post;
          end;
        inc(CantidadErrores)
      end
    else
        if (IBQSPRN.FieldValues['Result'] = 'W') then
          begin
            if (ModoEve = meMasivo) then
              begin
                IBDSSimple.Edit;
                IBDSSimple.FieldByName('EW').AsString := 'W';
                IBDSSimple.Post;
              end;
            inc(CantidadWarnings);
          end
        else
          if (IBQSPRN.FieldValues['Result'] = 'A') then
            begin
              if (ModoEve = meMasivo) then
                begin
                  IBDSSimple.Edit;
                  IBDSSimple.FieldByName('EW').AsString := 'A';
                  IBDSSimple.Post;
                end;
            end;

    IBQSPRN.Next;
  end;
  PError.ActivePageIndex := 0;
  PError.Visible := CantidadErrores + CantidadWarnings > 0;
end;

(*
  Establecemos si se usa la manga (esto es porque aun no estan definidos los animales),
  o si no se usa (esto es cuando los animales fueron elegidos previos al evento).
*)
procedure TFEveSimple.SetConManga(const Value: boolean);
begin
  {DONE 2 -omartin: Mostrar/Ocultar el TSMAnga}
  FConManga := Value;
  TSManga.TabVisible := FConManga;
  {if (FConManga) then
   begin
     MSimpleRBTodasClick(self);
   end;}
end;

(*
  Establecemos el modo de uso del evento: Si es individual solo se permite seleccionar
  un animal y se muestran todos los controles para carga de datos.
                                          Si es masivo se permite seleccionar varios
  animales, se muestran sólo los componentes comunes a los animales y se muestra la
  grilla previamente a "terminar" la carga.
*)
procedure TFEveSimple.SetModoEvento(const Value: TModoEvento);
begin
  {TODO 2 -omartin: Ver la forma de mostrar solo controles comunes}
  {DONE 2 -omartin: Mostrar/Ocultar la grilla según el modo}
  FModoEvento := Value;
//  TSGrilla.TabVisible := FModoEvento = meMasivo;
end;

(*
  Por defecto nos creamos sin manga, en modo individual y sin crear un grupo
*)
procedure TFEveSimple.FormCreate(Sender: TObject);
var
  w : Integer;
begin
  inherited;
  IManga := TBitmap.Create;
  Imanga.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Manga2.bmp');
  IDatos := TBitmap.Create;
  IDatos.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Datos2.bmp');
  IGrilla := TBitmap.Create;
  IGrilla.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\Grilla2.bmp');
  IMangaA := TBitmap.Create;
  ImangaA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\MangaA2.bmp');
  IDatosA := TBitmap.Create;
  IDatosA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\DatosA2.bmp');
  IGrillaA := TBitmap.Create;
  IGrillaA.LoadFromFile(ExtractFilePath(Application.ExeName)+'Imagenes\GrillaA2.bmp');
  ILVets.Add(IManga,nil);
  ILVets.Add(IDatos,nil);
  ILVets.Add(IGrilla,nil);
  ILVets.Add(IMangaA,nil);
  ILVets.Add(IDatosA,nil);
  ILVets.Add(IGrillaA,nil);

  PBotones.Height := JvTerminar.Height;
  w := (MSimple.PSeleccion.Height div 4);
  MSimple.BBAgregarTodos.Top := (w div 2) - (MSimple.BBAgregarTodos.Height div 2);
  MSimple.BBAgregarUno.Top := w + (w div 2) - (MSimple.BBAgregarUno.Height div 2);
  MSimple.BBEliminarUno.Top := (w * 2) + (w div 2) - (MSimple.BBEliminarUno.Height div 2);
  MSimple.BBEliminarTodos.Top := (w * 3) + (w div 2) - (MSimple.BBEliminarTodos.Height div 2);

  //{$IFDEF PRODUCTORES}
  //  PCBasico.Images := ILProds;
  //{$ELSE}
    //PCBasico.Images := ILVets;
  //{$ENDIF}
  NomPotreroMapa := '';
  IdPotreroMapa := -1;

  preguntar:=true;
  PasoGrilla := false;
  nroID := -1;
  //FAvanceTerminar := TFAvanceTerminar.Create(self);
  //FAvanceTerminar.Hide;
  IBQEvento.Close;
  IBQEvento.ParamByName('form').AsString := Self.Name;
  IBQEvento.Open;
  DMSoftvet.IBQPotrero.close;
  DMSoftvet.IBQPotrero.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.open;
  DMSoftvet.IBQRodeo.close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  MSimple.IBQDisponibles.Close;
  MSimple.IBQDisponibles.Open;
  Msimple.IBQSeleccionados.Close;
  Msimple.IBQSeleccionados.Open;
  FTipoEvento := IBQEvento.fieldByName('tipo_evento').AsInteger;
  FHacerCommit := true;
  FEventoDisparador := 0;
  FEventoGenerado := 0;
  ConManga := False;
  ModoEve  := meIndividual;
  cargaXLS:=false;
  cargaTemp:=false;

  CrearGrupo := True;
  IBDSSimple.Close;
  IBDSSimple.Open;
  DMSoftVet.IBQDatosAnimal.Close;
  DMSoftVet.IBQDatosAnimal.ParamByName('establecimiento').Value:=FPrincipal.EstablecimientoActual;
  DMSoftVet.IBQDatosAnimal.Open;
  SQLStringList:= TStringList.Create;
  AsignarValoresDefecto;

  setLength(arrImportaciones,0);
  CantAnimales := 0;
  TSGrilla.TabVisible := false;

  if FPrincipal._USO_DISP then
  begin
    JvIDispElect.Visible := true;
    if FPrincipal._DISPOSITIVO_EL = 'GES' then
    begin
      JvIDispElect.OnClick := BBImpGesReaderClick;
    end;
    if FPrincipal._DISPOSITIVO_EL = 'VSA' then
    begin
      JvIDispElect.OnClick := ImpDisVesta;
    end;
    // Codigo Ivan Alta Masiva con Baston Allflex en eventos
    //if (FPrincipal.MarcaLector = 'Allflex') then
    JvIDispElect.OnClick := ImpDisVesta;


  end;

end;


(*
  Reabrimos los querys
*)
procedure TFEveSimple.FormShow(Sender: TObject);
var
  i     : integer;
  found : boolean;
  anc   : integer;
begin
  inherited;

  SetLength(arrSeleccionados,0);

  LeyoCaravana := false;

  EnTope := true;
  SelVariosOff := true;

  EABusqueda.Text:= '';
  EABusqueda.Visible:= false;
  ASacarAnimal.Visible := False;
  ISacarAnimal.Visible := false;
  //LSacarAnimal.Visible := false;

  SBSelTodos.Visible:=false;
  ISelTodos.Visible := false;
  //LSelTodos.Visible := false;
  ISeleccionarVarios.Visible := false;
  //LSeleccionarVarios.Visible := false;

  SetColumnWidth(120, 200);
  found := false;
  for i:= 0 to (PCBasico.PageCount-1) do begin
    if(PCBasico.Pages[i].TabVisible = true)and not(found) then begin
       PCBasico.ActivePageIndex := i;
       found := true;
    end;
  end;
  anc := (MSimple.GBDisponibles.Width + MSimple.GBSeleccionados.Width) div 2;
  MSimple.GBDisponibles.Width := anc;
  ControlEventoOnExit(self);
  BBXls.Visible:= false;
  JvIExpExcel.Visible := false;
  //LExpExcel.Visible := false;

  ComponentesVisiblesPorPais(-1);
  SBSelTodos.Left:=JvCancelar.Left-SBSelTodos.Width-5;
  ControlBounds;
  if self.Owner is TFMovCargarDatos then
    desdeFmov:=true;
  if self.Owner is TFEvePeso then
    PCBasico.ActivePage := TSDatos;

  if (FPrincipal._LECTOR_ONLINE) then
  begin
    //crearLector;
    FEveSimple := self; // Guardo la referencia del formulario
    TimerLector.Enabled:=true;
    PCBasico.ActivePage := TSDatos;   //nuevo requerimiento
    JvSiguiente.Visible := false;
    LBBSiguiente.visible:= false;
  end;
  
  aux := 1;
  TodosSel := false;
  UltimaPos := 1;

  if IdPotreroMapa <> -1 then
  begin
    
  end;

end;

(*
  Setea el tamaño (ancho) de columna segun el tipo, se pasan 2 valores para poder decidir los tamaños
*)
procedure TFEveSimple.SetColumnWidth (MinLength:Integer; MaxLength: Integer);
//var Ind: integer;
begin

//  autoajustarcolumnas;  

{
  for Ind := 0 to BDBGSimple.Columns.Count-1 do
  begin
    if(BDBGSimple.Columns[Ind].Field.DataType = ftInteger)then
        BDBGSimple.Columns[Ind].Width := MinLength
    else
      if(BDBGSimple.Columns[Ind].Field.DataType = ftString)then
       BDBGSimple.Columns[Ind].Width := MaxLength
      else
        if(BDBGSimple.Columns[Ind].Field.DataType = ftDateTime )then
           BDBGSimple.Columns[Ind].Width := 40;
  end;
}
end;
(*
  Cambiamos el modo del evento segun la cantidad de animales seleccionados en la manga
  Hacemos la carga de datos si entramos en la grilla y una vez cargada la grilla se habilita el boton Terminar
*)
procedure TFEveSimple.PCBasicoChange(Sender: TObject);
begin
  //ind:= 0;
  SBSelTodos.Visible:=false;
  ISeleccionarVarios.Visible := false;
  //LSeleccionarVarios.Visible := false;
  ISelTodos.Visible := false;
  //LSelTodos.Visible := false;
  ASacarAnimal.Visible := False;
  ISacarAnimal.Visible := false;
  //LSacarAnimal.Visible := false;

  JvIDispElect.Visible := (PCBasico.ActivePage = TSManga) and FPrincipal._USO_DISP;
  //LDispElect.Visible := (PCBasico.ActivePage = TSManga)and FPrincipal._USO_DISP;

  BBXls.Visible:= false;
  JvIExpExcel.Visible := false;
  //LExpExcel.Visible := false;
  //AIngresoSecuenciado.Visible := false;{No sera usado en esta versión}
  //si estamos en el tab datos y tiene un solo elem. seleccionado se conviente en evento individual, sino masivo
  TSManga.ImageIndex := 0;
  TSDatos.ImageIndex := 1;
  TSGrilla.ImageIndex := 2;
  if(PCBasico.ActivePage = TSManga)then
    TSManga.ImageIndex := 3;
  if(PCBasico.ActivePage = TSDatos)then
    TSDatos.ImageIndex := 4;
  if(PCBasico.ActivePage = TSGrilla)then
    TSGrilla.ImageIndex := 5;

  if(PCBasico.ActivePage = TSDatos)then
  begin
    if not(MSimple.BDBGSeleccionados.DataSource.DataSet.IsEmpty)then
    begin
        //Estas 2 lineas deben ir comentadas, porque son las que reinician el IBDSSimple
        //cada ves que se vuelve a la hoja de datos
        {IBDSSimple.Close;
        IBDSSimple.Open; }
        ////
        ////
        MSimple.BDBGSeleccionados.DataSource.DataSet.First;
        if(MSimple.BDBGSeleccionados.DataSource.DataSet.RecordCount<2) then
        begin
          ModoEve := meIndividual;
          TSGrilla.TabVisible := false;
          IDAnimal := MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['id_animal'];
          GBDatos.Caption:= Traducir('Datos del animal RP: ') + MSimple.BDBGSeleccionados.DataSource.DataSet.fieldbyname('id_rp').AsString;
        end
        else
        begin
          GBDatos.Caption:= Traducir('Datos:');
          ModoEve := meMasivo;
          self.ConManga := true;
          inherited;
        end;
       end;
    end;
  //else
  //si estamos en el tab grilla, es decir el evento es masivo => carga la grilla detalle
  if(PCBasico.ActivePage = TSGrilla) then
  begin

      GuardarGrillaTemporal.Enabled:=true;
      BDBGSimple.Hide;

      if cargaDeMovil then
        importarDeMovil
      else
      begin
        CargarGrillaDetalle;
      end;

      EliminarDeSeleccionados;

      if mostrar then
      begin
        PError.Show;
        if DSSimple.DataSet.IsEmpty then
        begin
          PCBasico.ActivePage:=TSManga;
          TSGrilla.TabVisible := false;
          TSGrilla.Enabled:=false;
          pasoGrilla:=false;
        end;
        mostrar:=false;
      end;

      aux := UltimaPos;
      CantComps := 0;
      SetLength(ArrComponents,CantComps);
      SBSelTodos.Visible:=true;
      ISeleccionarVarios.Visible := true;
      //LSeleccionarVarios.Visible := true;

      //LSelTodos.Visible := true;
      ISelTodos.Visible := true;
      SBSelTodos.Down:=false;
      ASacarAnimal.Visible := true;
      ISacarAnimal.Visible := true;
      //LSacarAnimal.Visible := true;
      LoadSQLStringList;
      PaintRequired;
      BDBGSimple.SelectedRows.Clear;
      BDBGSimpleCellClick(nil);
      PasoGrilla := true;
      BBXls.Visible:= true;
      JvIExpExcel.Visible := true;
      //LExpExcel.Visible := true;
      apretado := false;

      actualizarCantAnimales;

      if(MSimple.IBQSeleccionados.RecordCount = 1) then
      begin
        PCBasico.ActivePage := TSDatos;
        PCBasicoChange(nil);
      end
      else if(MSimple.IBQSeleccionados.RecordCount = 0) then
      begin
        PCBasico.ActivePage := TSManga;
        PCBasicoChange(nil);
      end;

      AutoAjustarColumnas;
      BDBGSimple.Show;

      BDBGSimple.DataSource.DataSet.Last;
      BDBGSimple.DataSource.DataSet.First;
      if BDBGSimple.DataSource.DataSet.RecordCount > 0 then
        SBBarrita.Max := BDBGSimple.DataSource.DataSet.RecordCount
      else
        SBBarrita.Max := 1;
      SBBarrita.Min := 1;

      CalcularIncremento(SBBarrita.Max);
      AjustarPanelesLaterales;

      BDBGSimple.DataSource.DataSet.RecNo := aux+1;
      if (TodosSel) then
      begin
        //LSelTodos.Caption := Traducir('Seleccionar Todos');
      end;

      Posicion := aux;
      TodosSel := false;

      regActual := aux;

      BotonPulsado := false;
      BDBGSimple.Options := [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
      BDBGSimple.SetFocus;
  end;

  ControlEventoOnExit(self); //para manejar si el boton terminar debe o no estar habilitado
  actualizarCantAnimales;
  // Codigo Ivan Boton siguiente usando bastón
  if ((PCBasico.ActivePage = TSDatos) and
  (MSimple.BDBGSeleccionados.DataSource.DataSet.RecordCount=1) and
  (FPrincipal._LECTOR_ONLINE)) then
    begin
      JvSiguiente.Visible := true;
      ModoEve := meMasivo;
    end;

  //if (PCBasico.ActivePage = TSGrilla) then
  //  acomodarGrid (BDBGSimple);
  // Fin Codigo Ivan Boton siguiente usando bastón
end;


(*
  Armamos la lista de eventos a ejecutar en baso a los animales seleccionados en la manga
  y los datos comunes del panel de datos
*)
procedure TFEveSimple.CargarDatosGrilla;
begin
  {Cada hijo debe cargar los datos de la grilla, ya que el conoce los campos involucrados}
end;


procedure TFEveSimple.CargarParametrosRN;
begin
  // Deben implementarlo los hijos
end;

procedure TFEveSimple.CargarParametrosSP;
begin
  // Deben implementarlo los hijos
end;

procedure TFEveSimple.ManejarDatosDeSP;
begin
  //Deben Implementarlo los hijos
end;

(*
  Carga los datos en la grilla Detalle, primero carga los animales seleccionados
  y luego los datos elegidos para el evento en praticular
*)
procedure TFEveSimple.CargarGrillaDetalle;
begin

  // esta linea carga los string list en las columnas de la grilla
  LoadSQLStringList;
  CargarPickListEnGrilla;

    MSimple.BDBGSeleccionados.DataSource.DataSet.First;
    //*/*/*/
    //if FAvanceTerminar=nil then
    //if not Assigned(FAvanceTerminar) then


    if not(self is TFEveNacimientos) then
      begin
        FAvanceTerminar:=TFAvanceTerminar.Create(self);
        FAvanceTerminar.Max := MSimple.BDBGSeleccionados.DataSource.DataSet.RecordCount;
        FAvanceTerminar.Modo := maDetalle;
        FAvanceTerminar.Update;
        FAvanceTerminar.Pos := 1;
      end;
    //*/*/
    while not (MSimple.BDBGSeleccionados.DataSource.DataSet.Eof) do
      begin
      if (({(FTipoEvento=40) or} (FTipoEvento=19)) or (not BDBGSimple.DataSource.DataSet.Locate('ID_ANIMAL',MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_ANIMAL'],[])) or (BDBGSimple.DataSource.DataSet.Locate('ID_ANIMAL',MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_ANIMAL'],[]) and BDBGSimple.SelectedRows.CurrentRowSelected)) then
        CargarColumnas(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_ANIMAL']);
      MSimple.BDBGSeleccionados.DataSource.DataSet.Next;
      //*/*/*/
      if not(self is TFEveNacimientos) then
        begin
          FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
          FAvanceTerminar.Update;
          Application.ProcessMessages;
        end;
      //*/*/*/*
      end;
    //*/*/*/*/*
   // if FAvanceTerminar<>nil then
   //FAvanceTerminar.Close;

    if not(self is TFEveNacimientos) then
      begin
        FAvanceTerminar.Destroy;
      end;
    //*/*/*

  if (IBDSSimple.State <> dsBrowse) then
    IBDSSimple.Post;
  PaintRequired;

end;

procedure TFEveSimple.CargarParametrosMasivo;
begin
// los hijos deben cargar los parametros del SPIndividual
end;

(*
 Verifica que un RP no exista un determinado DataSource , ambos deben pasarse por parametros
*)
function TFEveSimple.NoExiste (Id: string; DS: TDataSource):boolean;
begin
    Result := not(DS.DataSet.Locate('ID_ANIMAL',Id,[loCaseInsensitive]));
end;

(*
 Elimina los RP de un DataSource que no existan en otro (simcriniza los datos de 2 grillas)
*)
procedure TFEveSimple.EliminarDeSeleccionados;
var
  idAnimal: String;
begin
  if not(IBDSSimple.IsEmpty)then
  begin
    IBDSSimple.First;
    while not (IBDSSimple.Eof)do
    begin
      idAnimal := IBDSSimple.FieldValues['id_animal'];

      if ((idAnimal <> '') AND
        NoExiste(idAnimal, MSimple.DSSeleccionados)) then
      begin
        IBDSSimple.Delete
      end
      else
      begin
        IBDSSimple.Next;
      end
    end;
  end;
end;

procedure TFEveSimple.AntesDeTerminar;
begin
     {Implementado por los hijos}
end;

procedure TFEveSimple.DespuesDeTerminar;
begin
     {Implementado por los hijos}
end;

procedure TFEveSimple.AntesDeEjecutarSP;
begin
  {Implementado por los hijos}
end;

procedure TFEveSimple.SetIDAnimal(const Value: integer);
begin
  FIDAnimal := Value;
end;

(*
  Carga Los PickList en la Grilla Detalle, de acuerdo a los campos que se enceuntrar agregados en el
  TStringList "SQLStringList"
*)
procedure TFEveSimple.CargarPickListEnGrilla;
var i: integer;
begin
  for i := 0 to SQLStringList.Count -1 do
   if not((TDataSource(SQLStringList.Objects[i]).DataSet).IsEmpty)then
     FillPickList(SQLStringList.Strings[i], TDataSource(SQLStringList.Objects[i]).DataSet);
end;

(*
  Llena cada uno de los PickList de la Grilla Detalle
*)
procedure TFEveSimple.FillPickList(const campo: string; const Qry: TDataSet);
var slPickList: TStringList;
    i:integer;
    aux:integer;
begin
  slPickList:= TStringList.Create;
  try
   Qry.First;
    while not (Qry.Eof) do
    begin
     if (TryStrToInt(Qry.Fields[0].AsString,aux)) then
        slPickList.AddObject(Qry.Fields[1].AsString, TClassType.CreateClassTypeInteger(Qry.Fields[0].AsInteger))
     else
        slPickList.AddObject(Qry.Fields[1].AsString, TClassType.CreateClassTypeString(Qry.Fields[0].AsString));
      Qry.Next;
    end;
    for i:= 0 to BDBGSimple.Columns.Count - 1 do
      if(BDBGSimple.Columns[i].FieldName = campo)then
      begin
         BDBGSimple.Columns[i].PickList := slPickList;
         break;
      end;
  finally
    slPickList.Free;
  end;
end;

(*
  Llama al procedimiento que para cada columna llena el PickList Correspondiente
*)
procedure TFEveSimple.LoadSQLStringList;
begin

end;

procedure TFEveSimple.PaintRequired;
var i : integer;
begin
  for i:= 0 to BDBGSimple.Columns.Count - 1 do
     if (BDBGSimple.Columns[i].ReadOnly)then
        BDBGSimple.Columns[i].Color := $00FAEDE2;

  AutoFitColumns; //auto fit columns
end;


procedure TFEveSimple.MSimpleBBEliminarTodosClick(Sender: TObject);
begin
  inherited;
  MSimple.BBEliminarTodosClick(Sender);
  actualizarCantAnimales;
  JvIImpExcel.Visible := true;
  //LImpExcel.Visible := true;
  JvIDispElect.Visible := true;
  //LDispElect.Visible := true;
end;

(*
  Limpio todos los errores
*)
procedure TFEveSimple.ClearErrores;
begin
  MAErrors.Clear;
  CantidadErrores  := 0;
  CantidadWarnings := 0;
end;

(*
  Segun las RN identifica los tipos de errores
*)
procedure TFEveSimple.BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;  State: TGridDrawState);
var i,j : integer;
begin
  inherited;

  if (IBDSSimple.FieldValues['EW'] = 'E') then
      BDBGSimple.Canvas.Brush.Color := RGB(255, 110, 110);    // rojo

  if (IBDSSimple.FieldValues['EW'] = 'W') then
      BDBGSimple.Canvas.Brush.Color := RGB(255, 255, 210);    // amarillo

  if (IBDSSimple.FieldValues['EW'] = 'M') then
      BDBGSimple.Canvas.Brush.Color := RGB(210, 210, 255);    // azul

  if (IBDSSimple.FieldValues['EW'] = 'A') then
  begin
      if (column.ReadOnly) then
        BDBGSimple.Canvas.Brush.Color := $00FAEDE2
      else
        BDBGSimple.Canvas.Brush.Color := RGB(255, 255, 255);
  end;

  if (gdSelected in State) then
  begin
        BDBGSimple.Canvas.Brush.Color := RGB(139, 181, 107);
        BDBGSimple.Canvas.Font.Style := [fsBold];
        BDBGSimple.Canvas.Font.Size := BDBGSimple.Canvas.Font.Size + 1;
        BDBGSimple.Canvas.Font.Color := clWhite;
  end
  else
  begin
        if (TodosSel) then
          BDBGSimple.Canvas.Brush.Color := RGB(139, 181, 107)
        else
        begin
          BDBGSimple.Canvas.Brush.Color := clWhite;
          BDBGSimple.Canvas.Font.Color := clBlack;
        end;
  end;

  if (BDBGSimple.SelectedRows.Count > 0) then
  begin

        if BDBGSimple.SelectedRows.Find(BDBGSimple.DataSource.DataSet.Bookmark,i) then
        begin
          if apretado then
          begin
            BDBGSimple.Canvas.Brush.Color := RGB(139, 181, 107);
            BDBGSimple.Canvas.Font.Style := [fsBold];
            BDBGSimple.Canvas.Font.Size := BDBGSimple.Canvas.Font.Size + 1;
            BDBGSimple.Canvas.Font.Color := clWhite;
          end
          else
          begin
            if (gdSelected in State) then
            begin
                  BDBGSimple.Canvas.Brush.Color := RGB(139, 181, 107);
                  BDBGSimple.Canvas.Font.Style := [fsBold];
                  BDBGSimple.Canvas.Font.Size := BDBGSimple.Canvas.Font.Size + 1;
                  BDBGSimple.Canvas.Font.Color := clWhite;
            end
            else
            begin
                  if (TodosSel) then
                    BDBGSimple.Canvas.Brush.Color := RGB(139, 181, 107)
                  else
                  begin
                    BDBGSimple.Canvas.Brush.Color := clWhite;
                    BDBGSimple.Canvas.Font.Color := clBlack;
                  end;
            end;
          end;
        end;

  end;

  BDBGSimple.DefaultDrawColumnCell(rect,DataCol,Column,State);

end;

procedure TFEveSimple.borrarUno(idAnimal: Integer);
begin
    try
    begin
      IBDSSimple.Delete;
      if BDBGSimple.DataSource.DataSet.Lookup('ID_ANIMAL',idAnimal,'ID_ANIMAL')=Null then
        MSimple.sacarAnimalDeSeleccionados(idAnimal);
    end;
    except on e:Exception do
    end;
end;

// elimino de la grilla solo si es error
procedure TFEveSimple.ASacarAnimalExecute(Sender: TObject);
var
  i : integer;
  pregunto : Boolean;
  retorno : TModalResult;
  a : boolean; //esta variable esta para el FAvanceTerminar, porq tira error al crearce en otro lado
begin
    inherited;
    a := false;
    pregunto:=true;
    i:=0;
    if BDBGSimple.SelectedRows.Count > 0 then
    begin
       // if( BDBGSimple.SelectedRows.Count = 1) then
//          deshabitilar si a todo y cancelar
        with BDBGSimple.DataSource.DataSet do
          begin
          //  for i := 0 to BDBGSimple.SelectedRows.Count -1 do
          while(i < BDBGSimple.SelectedRows.Count) do
            begin
              GotoBookmark(pointer(BDBGSimple.SelectedRows.Items[i]));
              if (IBDSSimple.FieldValues['ID_RP'] <> null)  then
              begin
                if(pregunto) then
                begin
                  retorno := MostrarMensaje(tmTodos, 'Usted intenta sacar el animal '+ IBDSSimple.FieldByName('id_rp').AsString +', desea Continuar ?');
                  if ( retorno = mrYes)then
                    borrarUno(IBDSSimple.fieldByname('id_animal').AsInteger)
                  else
                    if(retorno = mrAll) then
                    begin
                      a := true;
                      BDBGSimple.Hide;
                      FAvanceTerminar:=TFAvanceTerminar.Create(self);
                      FAvanceTerminar.Max := MSimple.BDBGSeleccionados.DataSource.DataSet.RecordCount;
                      FAvanceTerminar.Modo := maDetalle;
                      FAvanceTerminar.Update;
                      FAvanceTerminar.Pos := 1;
                      pregunto := false;
                      borrarUno(IBDSSimple.fieldByname('id_animal').AsInteger);
                      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
                      FAvanceTerminar.Update;
                    end
                    else
                      if(retorno = mrCancel) then
                        i:= BDBGSimple.SelectedRows.Count + 1;
                end
                else
                  begin
                     borrarUno(IBDSSimple.fieldByname('id_animal').AsInteger);
                     FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
                     FAvanceTerminar.Update;
                  end;   
              end;
              i:=i+1;
            end;
          end;
      end;


  if (FAvanceTerminar <> nil) and a then
    FAvanceTerminar.Destroy;

  if not(BDBGSimple.Visible) then
    BDBGSimple.Show;

  BDBGSimple.SelectedRows.Clear;
  ASacarAnimal.Enabled := false;
  LSacarAnimal.Enabled := false;
  ISacarAnimal.Enabled := false;

  BSacarAnimal.Caption:= Traducir('Sacar Animal');
  ControlEventoOnExit(self);    {>>>>>>>ver<<<<<<<<}
  actualizarCantAnimales;
  if(MSimple.IBQSeleccionados.RecordCount = 1) then
  begin
    PCBasico.ActivePage := TSDatos;
    PCBasicoChange(nil);
  end
  else if(MSimple.IBQSeleccionados.RecordCount = 0) then
  begin
    PCBasico.ActivePage := TSManga;
    PCBasicoChange(nil);
  end;
end;

(*
  Asigna valores por defecto a los combos(No definidos o el primer valor)
*)
procedure TFEveSimple.AsignarValoresDefecto;
var
  ind : Integer;
  aux : IDBControl;
begin
  for ind := 0 to GBDatos.ControlCount - 1 do
    if Convertido(GBDatos.Controls[ind], aux) then
      aux.AsignarValorDefecto;
end;

(*
  Verifica si el componente es Auto
*)
function TFEveSimple.Convertido(Control: TControl;
  var IControl: IDBControl): boolean;
begin
  Convertido := True;
  IControl   := nil;
  if Control is TDBEditAuto then
    IControl := IDBControl(TDBEditAuto(Control))
  else
    if Control is TDBLookUpComboBoxAuto then
      IControl := IDBControl(TDBLookUpComboBoxAuto(Control))
    else
      if Control is TEditAuto then
        IControl := IDBControl(TEditAuto(Control))
      else
        if Control is TEditAutoMinuscula then
          IControl := IDBControl(TEditAutoMinuscula(Control))
        else
          if Control is TDBEditMinuscula then
            IControl := IDBControl(TDBEditMinuscula(Control))
          else
            if Control is TEditAutoMinuscula then
              IControl := IDBControl(TEditAutoMinuscula(Control))
            else
              Convertido := False;
end;


// CON ESTE METODO CONFIGURO EL FORMULARIO DE INGRESO SECUENCIADO - No sera usado en esta versión
procedure TFEveSimple.AIngresoSecuenciadoExecute(Sender: TObject);
var indice : integer;
    secuenciado : TFColumnEditor;
    search : integer;

begin
  inherited;
  // crear el formulario para el ingreso secuenciado
  SQLStringList.Sort;
  secuenciado := TFColumnEditor.Create(self, DSSimple);
  for indice := 0 to BDBGSimple.Columns.Count -1 do begin
    begin
      if not(BDBGSimple.Columns[indice].ReadOnly) then
        begin
          if (SQLStringList.Find(BDBGSimple.Columns[indice].fieldname, search))  then
            secuenciado.addCombo(BDBGSimple.Columns[indice].Title.Caption, BDBGSimple.Columns[indice].fieldname, TDataSource(SQLStringList.Objects[search]),TDataSource(SQLStringList.Objects[search]).DataSet.FieldList.Fields[1].DisplayName)
          else
            if ((BDBGSimple.Columns[indice].Field.DataType = ftString) or (BDBGSimple.Columns[indice].Field.DataType = ftInteger)) then
              secuenciado.addEdit(BDBGSimple.Columns[indice].Title.Caption, BDBGSimple.Columns[indice].fieldname)
            else
              if (BDBGSimple.Columns[indice].Field.DataType = ftDate) then
                secuenciado.addDate(BDBGSimple.Columns[indice].Title.Caption, BDBGSimple.Columns[indice].fieldname)
        end
    end;
  end;
  secuenciado.ShowModal;
end;

procedure TFEveSimple.SetCrearGrupo(const Value: boolean);
begin
  FCrearGrupo := Value;
end;


(* Validaciones y Chequeos para la Grilla Detalle, en caso de ingresar algun tipo de dato por teclado*)

// valido el texto que entra si es un parecido lo asigno
procedure TFEveSimple.SetText(Sender: TField; const Text: String);
var f:TDateTime;
PickPos:INTEGER;
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
  begin
    IBQValidaciones.Close;
    IBQValidaciones.SQL.Clear;
    if (Sender.FieldName = 'RESP') then
    begin      // RESPONSABLE
        IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
        IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        BEGIN
            Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
            PickPos := BDBGSimple.ColumnByField('RESP').PickList.IndexOf(BDBGSimple.ColumnByField('RESP').Field.AsString);
            IBDSSimple.FieldByName('RESPONSABLE').Value :=  TClassType(BDBGSimple.ColumnByField('RESP').PickList.Objects[PickPos]).getValue;
        END;
    end
    else
    if(Sender.FieldName = 'FECHA')then
    begin
      if (TryStrToDate(Text,f)) then
           Sender.AsVariant := StrToDate(text);
    end;
    if(Sender.FieldName = 'OBSERVACION')then
    begin
         Sender.AsVariant := text;
    end;
  end;
end;

procedure TFEveSimple.MSimpleBBEliminarUnoClick(Sender: TObject);
begin
  inherited;
  MSimple.BBEliminarUnoClick(Sender);
  actualizarCantAnimales;
  if msimple.IBQSeleccionados.RecordCount=1 then
    ModoEve:=meIndividual
  else
    modoEve:=meMasivo;
  if msimple.IBQSeleccionados.RecordCount=0 then
  begin
    JvIImpExcel.Visible := true;
    //LImpExcel.Visible := true;
    JvIDispElect.Visible := true;
    //LDispElect.Visible := true;
  end;
end;

procedure TFEveSimple.SetCommit(const Value: boolean);
begin
  FHacerCommit := Value;
end;

procedure TFEveSimple.setEventoDisparador(const Value: integer);
begin
  FEventoDisparador := Value;
end;

procedure TFEveSimple.setEventoGenerado(const Value: integer);
begin
  FEventoGenerado := Value;
end;

procedure TFEveSimple.ACancelarExecute(Sender: TObject);
begin
  inherited;
  FPrincipal.IBTPrincipal.RollbackRetaining;
  Close();
end;

procedure TFEveSimple.BDBGSimpleColEnter(Sender: TObject);
begin
  inherited;
  CargarPickListEnGrilla;
  regActual := BDBGSimple.DataSource.DataSet.RecNo;
end;

procedure TFEveSimple.MSimpleRBTodasClick(Sender: TObject);
begin
  inherited;
  MSimple.RBTodasClick(Sender);
  if IdPotreroMapa <> -1 then
  begin
    MSimple.CBxPotreroCloseUp(MSimple.CBxPotrero);
   // showmessage(MSimple.CBxPotrero.text);
    MSimple.CBxPotrero.ItemIndex := MSimple.CBxPotrero.Items.IndexOf(NomPotreroMapa);
    MSimple.CBxPotreroChange(MSimple.CBxPotrero);
  end;
end;

procedure TFEveSimple.FormActivate(Sender: TObject);
var arvhivo:TFileName;
begin
  inherited;
  (*Si el evento es masivo, abre por defecto la manga con todos los animales
  a los cuales puede efectuarse el evento*)
  if(ModoEve = meMasivo)then
    MSimple.RBTodas.Checked := true;

//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
    begin
      //
    end
   else
//  {$ELSE}
{    if FileExists(ExtractFilePath(Application.ExeName)+'\temp-'+inttostr(FPrincipal.EstablecimientoActual)+'-'+self.LTitulo.Caption+'.xls')
    and preguntar and not(cargaDeMovil or cargaXLS) and (self.LTitulo.Caption<>Traducir('Nacimientos')) and (self.LTitulo.Caption<>Traducir('Eliminar Evento'))
    and not(self.Owner is TFEveAltaMasiva) and not(self.Owner is TFMovCargarDatos) and (ModoEve <> meIndividual)
    and not(self.ClassParent = TFEVeServicioBasico)then
      begin
      if MostrarMensaje(tmConsulta,'Tiene una planilla sin terminar. Desea cargarla ahora?')=mrYes then
        continuarGrilla;
      DeleteFile(ExtractFilePath(Application.ExeName)+'\temp-'+inttostr(FPrincipal.EstablecimientoActual)+'-'+self.LTitulo.Caption+'.xls');
      end;  }
//  {$ENDIF}
  preguntar:=false;
  if desdeFmov and cargaDeMovil then
    begin
    desdeFmov:=false;
    with Owner as TFMovCargarDatos do
      begin
      archivo:=dirBase+nombreArch;
      cargarArchivo(archivo);
      end;
    DMSoftVet.IBQDatosAnimal.Close;
    DMSoftVet.IBQDatosAnimal.ParamByName('establecimiento').Value:=FPrincipal.EstablecimientoActual;
    DMSoftVet.IBQDatosAnimal.Open;
    MSimple.IBQDisponibles.Close;
    MSimple.IBQDisponibles.Open;

    MSimple.IBQDisponibles.Last;
    MSimple.IBQDisponibles.First;
    if PCBasico.ActivePage<>TSGrilla then
      begin
      PCBasico.ActivePage:=TSGrilla;
      end;
    PCBasicoChange(self);  
    acomodarGrilla;
    end;
end;

procedure TFEveSimple.insertEveCambioUbicacion();
begin
 //Implementa la clase UEveCambioUbicacion porque no anda el strore y se hace desde aca
end;

// la parte del terminar masivo que registra en la base ahora se hace aca
procedure TFEveSimple.ejecucionTerminar;
var i, evento,potrero:integer;
begin
  try
  if(CrearGrupo)then
   creacionGrupo;
  //if not Assigned(FAvanceTerminar) then
  FAvanceTerminar := TFAvanceTerminar.Create(nil);
  FAvanceTerminar.Pos := 1;
  FAvanceTerminar.Max := IBDSSimple.RecordCount; //MSimple.FCantidadSeleccionados;
  FAvanceTerminar.Modo := maGuardando;
  FAvanceTerminar.Update;
  FAvanceTerminar.Pos := 1;
  BDBGSimple.DataSource := nil;
  IBDSSimple.First;
  while not(IBDSSimple.Eof)do
    begin
      AntesDeEjecutarSP;
      IBQSPEventoInd.Close;
      CargarParametrosMasivo;
      IBQSPEventoInd.Open;
      ManejarDatosDeSP;
      IBDSSimple.Next;
      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
      FAvanceTerminar.Update;
      insertEveCambioUbicacion();
    end;
  BDBGSimple.DataSource := DSSimple;

  if Length(arrImportaciones)>0 then
    for i:=0 to Length(arrImportaciones)-1 do
      guardarImportacion(i);

  FAvanceTerminar.Modo := maListo;
  BorrarEventosAuxiliares();
  self.ModalResult := 1;
//  Close;
  except on e:Exception do
    begin
      BDBGSimple.DataSource := DSSimple;
      FAvanceTerminar.MDetalles.Text := e.Message;
      FAvanceTerminar.Modo := maError;
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end
  end;
  FAvanceTerminar.Destroy;
end;

procedure TFEveSimple.MSimpleBBAgregarTodosClick(Sender: TObject);
begin
  inherited;
  MSimple.BBAgregarTodosClick(Sender);
  actualizarCantAnimales;
  ModoEve:=meMasivo;

  JvIImpExcel.Visible := false;
  //LImpExcel.Visible := false;
  JvIDispElect.Visible := false;
  //LDispElect.Visible := false;
end;

procedure TFEveSimple.AutoFitColumns;
begin

  autoajustarcolumnas;

end;

procedure TFEveSimple.BBXlsClick(Sender: TObject);
begin
  inherited;
  if SDXLS.Execute then
    try
      DTXLS.SaveToFile(SDXLS.FileName);
    except
      MostrarMensaje(tmError,'El archivo está en uso. Por favor, ciérrelo y vuelva a intentar');
    end;
end;

procedure TFEveSimple.BDBGSimpleDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (BDBGSimple.SelectedIndex = BDBGSimple.ColumnByField('id_rp').Index) then
    if not(IBDSSimple.eof) and DMSoftVet.IBQDatosAnimal.Locate('ID_Animal',IBDSSimple.fieldByName('id_animal').AsInteger,[]) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBDSSimple.fieldByName('id_animal').AsInteger;
      F.BAgregarEvento.Visible:=false;
      F.BEliminar.Visible:=false;
      F.modificar := false;
      F.ShowModal;
      F.Destroy;
     DMSoftVet.IBQDatosAnimal.Close;
     DMSoftVet.IBQDatosAnimal.ParamByName('establecimiento').Value:=FPrincipal.EstablecimientoActual;
     DMSoftVet.IBQDatosAnimal.Open;
     IBDSSimple.Edit;
     IBDSSimple.FieldByName('ID_RP').AsString:=DMSoftVet.IBQDatosAnimal.Lookup('ID_ANIMAL',IBDSSimple.fieldbyname('id_animal').AsInteger,'ID_RP');
     IBDSSimple.Post;
     end;
end;

procedure TFEveSimple.MSimpleBBAgregarUnoClick(Sender: TObject);
begin
  inherited;
 MSimple.BBAgregarUnoClick(Sender);
  actualizarCantAnimales;
  if msimple.IBQSeleccionados.RecordCount=1 then
    ModoEve:=meIndividual
  else
    ModoEve:=meMasivo;
  JvIImpExcel.Visible := false;
  //LImpExcel.Visible := false;
  JvIDispElect.Visible := false;
  //LDispElect.Visible := false;
end;

procedure TFEveSimple.MSimpleBDBGDisponiblesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MSimple.BDBGDisponibles.SelectedIndex = MSimple.BDBGDisponibles.ColumnByField('id_rp').Index) then
  begin
    if not(MSimple.BDBGDisponibles.DataSource.DataSet.IsEmpty) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MSimple.BDBGDisponibles.DataSource.DataSet.fieldByName('id_animal').AsInteger;
      F.modificar := false;
      F.BAgregarEvento.Visible:=true;
      F.BEliminar.Visible:=true;
      F.ShowModal;
      F.Destroy;
     end;
    RefrescarMangaDisp();
  end;
end;

procedure TFEveSimple.RefrescarMangaDisp();
begin
  MSimple.IBQDisponibles.Close;
  Msimple.IBQDisponibles.Open;
  Msimple.IBQDisponibles.First;
  msimple.BDBGDisponibles.Hide;
  while not Msimple.IBQDisponibles.Eof do
    begin
    if Msimple.IBQSeleccionados.Locate('ID_ANIMAL',Msimple.IBQDisponibles.FieldValues['ID_ANIMAL'],[]) then
      Msimple.IBQDisponibles.Delete
    else
      Msimple.IBQDisponibles.Next;
    end;
  Msimple.IBQDisponibles.First;
  msimple.BDBGDisponibles.Show;
end;

procedure TFEveSimple.MSimpleBDBGDisponiblesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    MSimpleBDBGDisponiblesDblClick(nil);
end;

procedure TFEveSimple.SetIDRP(const Value: String);
begin
  FIDRP := Value;
end;

procedure TFEveSimple.MSimpleIBQDisponiblesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := MSimple.IBQSeleccionados.Lookup('id_animal', DataSet.FieldValues['id_animal'],'id_animal') = null;
end;

procedure TFEveSimple.ComponentesVisiblesPorPais(pais: Integer);
var i:Integer;
begin
  inherited;
//  if MSimple.BDBGDisponibles.Columns[1].
 // MSimple.BDBGDisponibles.Columns[1].Title.Caption:= FPrincipal.PaisNombreCaravana;
 // MSimple.BDBGSeleccionados.Columns[1].Title.Caption:= FPrincipal.PaisNombreCaravana;

  if (MSimple.BDBGDisponibles.Columns.Count >= 2) then
    if MSimple.BDBGDisponibles.ColumnByField('id_senasa') <> nil then
      MSimple.BDBGDisponibles.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;

  if (MSimple.BDBGSeleccionados.Columns.Count >= 2) then
    if MSimple.BDBGSeleccionados.ColumnByField('id_senasa') <> nil then
      MSimple.BDBGSeleccionados.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;

 // if (MSimple.BDBGSeleccionados.Columns.Count >= 2) then

  i:= 0;
  while (i < BDBGSimple.Columns.Count) do
    begin
      if (BDBGSimple.Columns[i].FieldName = 'ID_SENASA') then
        begin
          BDBGSimple.ColumnByField('id_senasa').Title.Caption:= FPrincipal.PaisNombreCaravana;
          //i:= BDBGSimple.Columns.Count;
        end;

      if (BDBGSimple.Columns[i].FieldName = 'ID_HBA') then
        begin
          BDBGSimple.ColumnByField('id_hba').Title.Caption:= FPrincipal.PaisHerdBook;
          //i:= BDBGSimple.Columns.Count;
        end;

      inc(i);
    end;

end;

procedure TFEveSimple.BDBGSimpleCellClick(Column: TColumn);
var i, j :integer;
begin
  inherited;

  selec := 0;
  if apretado then
  begin
    BDBGSimple.Options := [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
    BDBGSimple.SelectedRows.CurrentRowSelected := true;
  end
  else
      BDBGSimple.Options := [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

  SBSelTodos.Down:=false;
  if(BDBGSimple.SelectedRows.Count = 1) then
     LSacarAnimal.Caption := Traducir('Sacar Animal')
  else
    if(BDBGSimple.SelectedRows.Count > 1) then
      LSacarAnimal.Caption := Traducir('Sacar Animales');

  ASacarAnimal.Enabled := BDBGSimple.SelectedRows.Count > 0;
  LSacarAnimal.Enabled := BDBGSimple.SelectedRows.Count > 0;
  ISacarAnimal.Enabled := BDBGSimple.SelectedRows.Count > 0;

  UltimaPos := BDBGSimple.DataSource.DataSet.RecNo - 1;
  SBBarrita.Position := BDBGSimple.DataSource.DataSet.RecNo - 1;
  regActual := BDBGSimple.DataSource.DataSet.RecNo;
  IBarraHorDer.Top := GetPosicionPanel(BDBGSimple.DataSource.DataSet.RecNo);
  IBarraHorIzq.Top := IBarraHorDer.Top;
  Posicion := UltimaPos+1;

end;


procedure TFEveSimple.IBQSPRNAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if IBQSPRN.Params.FindParam('ANIMAL') <> nil then
    if IBQSPRN.Params.FindParam('FECHA') <> nil then
    begin
      Inc(CantAnimales);
      SetLength(Animales,CantAnimales);
      Animales[CantAnimales-1].Animal := VarAsType(IBQSPRN.Params.ParamValues['ANIMAL'],VarInteger);
      Animales[CantAnimales-1].Fecha := VarAsType(IBQSPRN.Params.ParamValues['FECHA'],VarDate);
    end;
end;

procedure TFEveSimple.IBQSPEventoIndAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if Length(Animales) > 0 then
  begin
    try
      IBSPActEventos.Close;
      IBSPActEventos.ParamByName('ANIMAL').Value := Animales[Indice].Animal;
      IBSPActEventos.ParamByName('FECHA').Value := Animales[Indice].Fecha;
      IBSPActEventos.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      IBSPActEventos.ExecProc;
      Inc(Indice);
    except
    end;
  end;
end;

procedure TFEveSimple.cargarAnimales;
var i:integer;
    rp:string;
    error:boolean;
begin
inherited;
error:=false;
configurarColumnasACargar;

for i:=0 to Length(anim)-1 do
 if anim[i].id<>-1000 then
  begin
    if TipoEvento = 49 then
      rp := getDato('rp (madre evento)',anim[i])
    else
      rp:=getDato('rp',anim[i]);
   if DMSoftVet.IBQDatosAnimal.Locate('ID_ANIMAL',anim[i].id,[loCaseInsensitive]) then
      if MSimple.IBQDisponibles.Locate('ID_ANIMAL',anim[i].id,[loCaseInsensitive])
      or MSimple.IBQSeleccionados.Locate('ID_ANIMAL',anim[i].id,[loCaseInsensitive]) then
          begin
          try
          IBDSSimple.Insert;
          marcarRepetidos(rp);
          if not(MSimple.IBQSeleccionados.Locate('ID_ANIMAL',anim[i].id,[loCaseInsensitive])) then
            MSimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
          cargarDatos(i);
          IBDSSimple.Post;
          except
            MAErrors.Lines.Add(Traducir('Ocurrio un error al importar el animal ')+rp+Traducir('. Verifique los datos'));
            error:=true;
            //mostrarMensaje(tmerror,'Ocurrio un error durante la importación. Por favor verifique el animal '+getDato('RP',anim[i]));
            end;
          end
      else
          begin
          MAErrors.Lines.Add(Traducir('No se puede realizar un/a ')+LTitulo.Caption+Traducir(' sobre el animal ')+rp);
          mostrar:=true;
          end
    else
      begin
      MAErrors.Lines.Add(Traducir('El animal ')+rp+Traducir(' no existe en el sistema'));
      mostrar:=true;
      end;
    //*/*/*/
    FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
    FAvanceTerminar.Update;
    //*/*/*/*
  end;
if error then MostrarMensaje(tmError, 'Se detectaron errores en la importación. Por favor verifíque los datos');
end;

procedure TFEveSimple.cargarDatos(i:integer);
begin
inherited;

    IBDSSimple.FieldByName('ID_RP').AsString := getDato('rp',anim[i]);
    IBDSSimple.FieldByName('ID_ANIMAL').AsInteger := anim[i].id;
    if getDato('senasa',anim[i])<>'' then
      IBDSSimple.FieldByName('ID_SENASA').Value := getDato('senasa',anim[i]);
    if getDato('fecha',anim[i])<>'' then
      IBDSSimple.FieldByName('FECHA').AsDateTime:= StrToDateTime(getDato('fecha',anim[i]));
    if getDato('observación',anim[i])<>'' then
      IBDSSimple.FieldByName('OBSERVACION').AsString :=getDato('observación',anim[i]);
    {if getDato('observador',anim[i])<>'' then
      IBDSSimple.FieldByName('OBSERVADOR').AsString :=getDato('observador',anim[i]);
    if getDato('responsable',anim[i])<>'' then
      IBDSSimple.FieldByName('RESP').AsString :=getDato('responsable',anim[i]);}
    //se especializa en los hijos
end;
                                            
procedure TFEveSimple.BBXlsImportClick(Sender: TObject);
var
  Reg : TRegistry;
  valor : String;
  val : Integer;
  F : TFImpExpExcel;
begin
  inherited;
{
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  if Reg.OpenKey('Excel.Application', false) then
  begin
    /////me fijo la version de Excel q esta instalada
    if Reg.OpenKey('CurVer', false) then
    begin
      valor := RightStr(Reg.ReadString(''),2);
      if TryStrToInt(valor,val) then
      begin
        if val <= 11 then
          OpenDlg.Filter := 'Archivos Excel (*.xls)|*.xls|Archivos XML (*.xml)|*.xml'
        else
          OpenDlg.Filter := 'Archivos Excel (*.xls; *.xlsx)|*.xls; *.xlsx|Archivos XML (*.xml)|*.xml';
      end
      else
      begin
        MostrarMensaje(tmAdvertencia,'No se pudo determinar la version instalada de Microsoft® Excel');
        OpenDlg.Filter := 'Archivos Excel (*.xls; *.xlsx)|*.xls; *.xlsx|Archivos XML (*.xml)|*.xml';
      end;
    end;
    ////////////////////////
    try
      if OpenDlg.Execute then
      begin
        archivo := OpenDlg.FileName;
        cargarArchivo(archivo);
      end;
    except
      cargaDeMovil := false;
    end;
  end
  else
  begin
    MostrarMensaje(tmError,'Para trabajar con planillas debe tener Microsoft® Excel instalado');
    BBXlsImport.Enabled := false;
    JvIImpExcel.Enabled := false;
    LImpExcel.Enabled := false;
  end;

       }
  F := TFImpExpExcel.Create(self);
  F.Evento := FTipoEvento;
  F.ODExcel.Filter := 'Archivos Excel (*.xls)|*.xls|Archivos XML (*.xml)|*.xml';

  //Reg := TRegistry.Create;
  //Reg.RootKey := HKEY_CLASSES_ROOT;
 // if Reg.OpenKey('Excel.Application', false) then
 // begin
    /////me fijo la version de Excel q esta instalada
    {if Reg.OpenKey('CurVer', false) then
    begin
      valor := RightStr(Reg.ReadString(''),2);
      if TryStrToInt(valor,val) then
      begin
        if val <= 11 then
          F.ODExcel.Filter := 'Archivos Excel (*.xls)|*.xls|Archivos XML (*.xml)|*.xml'
        else
          F.ODExcel.Filter := 'Archivos Excel (*.xls; *.xlsx)|*.xls; *.xlsx|Archivos XML (*.xml)|*.xml';
      end
      else
      begin
        MostrarMensaje(tmAdvertencia,'No se pudo determinar la version instalada de Microsoft® Excel');
        F.ODExcel.Filter := 'Archivos Excel (*.xls; *.xlsx)|*.xls; *.xlsx|Archivos XML (*.xml)|*.xml';
      end;
    end;    }
    ////////////////////////
    if DirectoryExists(ExtractFilePath(Application.ExeName)+'Planillas Excel') then
      F.ODExcel.InitialDir := ExtractFilePath(Application.ExeName)+'Planillas Excel';

    try
      F.ShowModal;
      if F.Salida = 1 then
      begin
        archivo := F.archivo_Importacion;
        cargarArchivo(archivo);
      end;
    except
      cargaDeMovil := false;
    end;
  //end
  //else
  //begin
    //MostrarMensaje(tmError,'Para trabajar con planillas debe tener Microsoft® Excel instalado');
    //BBXlsImport.Enabled := false;
    //JvIImpExcel.Enabled := false;
    //LImpExcel.Enabled := false;
  //end;

 F.Destroy;  

end;

function TFEveSimple.ExistComponent(Component : TComponent) : Boolean;
var
  resultado : boolean;
  I : integer;
begin
  resultado := false;
  for I := 0 to Length(ArrComponents)-1 do
    if Component.Name = ArrComponents[I].Name then
    begin
      resultado := true;
      break;
    end;
  Result := resultado;
end;

procedure TFEveSimple.GetEvent(Sender : TObject);
begin
  if not ExistComponent(Sender as TComponent) and PasoGrilla then
  begin
    Inc(CantComps);
    SetLength(ArrComponents,CantComps);
    ArrComponents[CantComps-1] := Sender as TComponent;
  end;
end;

function TFEveSimple.RegistroCambio(Component : TComponent) : Boolean;
var
  Indice : Integer;
  Resultado : Boolean;
begin
  Resultado := false;
  if (PasoGrilla and (Component <> nil) and not Nuevo) then
  begin
    for Indice := 0 to Length(ArrComponents)-1 do
      if Component.Name = ArrComponents[Indice].Name then
      begin
        Resultado := true;
        break;
      end;
  end
  else
    Resultado := true;
  Result := Resultado;
end;

procedure TFEveSimple.CargarColumnas(Animal : Integer);
begin
  try
    Nuevo := not IBDSSimple.Locate('ID_ANIMAL',Animal,[]);
    if Nuevo or not PasoGrilla then
      IBDSSimple.Insert
    else
      IBDSSimple.Edit;
    CargarDatosGrilla;
  except
  end;
end;

procedure TFEveSimple.RealizarCambio(Component : TComponent; CamposBD : array of TField;
  ValoresCamposBD : array of Variant);
var
  I : Integer;
begin
  if Length(ValoresCamposBD) = Length(CamposBD) then
  begin
    if RegistroCambio(Component) then
      for I := 0 to Length(CamposBD)-1 do
      begin
          try
            CamposBD[I].Value := ValoresCamposBD[I];
          except
          end;
      end;
  end
  else
    raise Exception.Create('La cantidad de elementos de CamposBD debe ser igual a la de ValoresCamposBD');
end;

procedure TFEveSimple.BorrarEventosAuxiliares;
begin
  try
    PasoGrilla := false;
    IBQDelEventosAux.Close;
    IBQDelEventosAux.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
    IBDSSimple.Close;
    IBDSSimple.Open;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFEveSimple.FormClose(Sender: TObject; var Action: TCloseAction);
begin
inherited;
  if (not BDBGSimple.DataSource.DataSet.IsEmpty) and (self.LTitulo.Caption<>Traducir('Nacimientos')) and (self.LTitulo.Caption<>Traducir('Eliminar Evento'))
  and (ansipos(Traducir('identificación'),lowercase(self.LTitulo.Caption))=0) and (self.LTitulo.Caption<>Traducir('Eliminar Animales')) then
  //agregar al if los ingresos y egresos
  begin
    try
      configurarColumnasAGuardar;

//      {$IFDEF BASICO}
      if (FPrincipal.TipoVersionLicencia = 'Basico') then
        begin
          //
        end
       else
          DTXLS.SaveToFile(ExtractFilePath(Application.ExeName)+'\temp-'+inttostr(FPrincipal.EstablecimientoActual)+'-'+self.LTitulo.Caption+'.xls');

    except
    end;
  end;
  //if FPrincipal._LECTOR_ONLINE then
    //cerrarLector;
  keybd_event(VK_CONTROL,0,2,0);
end;

procedure TFEveSimple.importarDeMovil;
var long:integer;
begin
    //BDBGSimple.Hide;
    long:=0;
    //*/*/*/
    //if FAvanceTerminar=nil then
    //if not Assigned(FAvanceTerminar) then
    FAvanceTerminar:=TFAvanceTerminar.Create(nil);
    FAvanceTerminar.Modo := maDetalle;
    FAvanceTerminar.Show;
    FAvanceTerminar.Max := Length(anim);
    FAvanceTerminar.Pos := 1;
    FAvanceTerminar.Update;
    //*/*/
    MSimple.BDBGDisponibles.SelectedRows.Clear;
    ModoEve:=meMasivo;
    DMSoftvet.IBQResponsable.Close;
    DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQResponsable.Open;
    DMSoftvet.IBQRodeo.Close;
    DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQRodeo.Open;
    cargarAnimales;
    LoadSQLStringList;
    CargarPickListEnGrilla;
    cargaDeMovil:=false;
    msimple.BDBGDisponibles.SelectedRows.Count;
    FAvanceTerminar.Destroy;  //agregue está linea para resolver el conflicto
    MSimpleBBAgregarUnoClick(self);    //este crea un avanceterminar y lo destruye entonces puse un destroy arriba
    //MSimple.BBAgregarUnoClick(self);
    PaintRequired;
    PasoGrilla:=true;
    //*/*/*/*/*
    //FAvanceTerminar.Destroy;   //aca era el problema
    //*/*/*
    //BDBGSimple.Show;
end;

procedure TFEveSimple.SBSelTodosClick(Sender: TObject);
begin
  inherited;
  //if SBSelTodos.Down then
  if not(TodosSel) then
  begin
    TodosSel := true;
    BDBGSimple.Hide;
    BDBGSimple.DataSource.DataSet.First;
    while not BDBGSimple.DataSource.DataSet.Eof do
    begin
      BDBGSimple.SelectedRows.CurrentRowSelected := true;
      BDBGSimple.DataSource.DataSet.Next;
    end;
    SBSelTodos.Hint := Traducir('Deseleccionar Todos');
    //LSelTodos.Caption := Traducir('Deseleccionar Todos');
    BDBGSimple.DataSource.DataSet.First;
    BDBGSimple.Show;
  end
  else
  begin
    TodosSel := false;
    BDBGSimple.SelectedRows.Clear;
    SBSelTodos.Hint := Traducir('Seleccionar Todos');
    //LSelTodos.Caption := Traducir('Seleccionar Todos');
    BDBGSimple.DataSource.DataSet.First;
  end;

  if(BDBGSimple.SelectedRows.Count = 1) then
    //LSacarAnimal.Caption := Traducir('Sacar Animal')
  else
    if(BDBGSimple.SelectedRows.Count > 1) then
      //LSacarAnimal.Caption := Traducir('Sacar Animales');

  ASacarAnimal.Enabled := BDBGSimple.SelectedRows.Count > 0;
  //LSacarAnimal.Enabled := BDBGSimple.SelectedRows.Count > 0;
  ISacarAnimal.Enabled := BDBGSimple.SelectedRows.Count > 0;
  
end;

procedure TFEveSimple.BDBGSimpleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

   case Key of
    VK_UP    : begin
                  if (regActual > 1) then
                  begin
                      regAnt := BDBGSimple.DataSource.DataSet.RecNo;
                      regActual := BDBGSimple.DataSource.DataSet.RecNo - 1;

                      IBarraHorIzq.Top := GetPosicionPanel(regActual);
                      IBarraHorDer.Top := GetPosicionPanel(regActual);
                  end;
               end;

    VK_LEFT  : begin
                    if ((regActual <> BDBGSimple.DataSource.DataSet.RecNo)) then
                    begin
                      regAnt := BDBGSimple.DataSource.DataSet.RecNo;
                      regActual := BDBGSimple.DataSource.DataSet.RecNo - 1;

                      IBarraHorIzq.Top := GetPosicionPanel(regActual);
                      IBarraHorDer.Top := GetPosicionPanel(regActual);
                    end;
               end;

    VK_RIGHT : begin
                    if ((regActual <> BDBGSimple.DataSource.DataSet.RecNo)) then
                    begin
                      regAnt := BDBGSimple.DataSource.DataSet.RecNo;
                      regActual := BDBGSimple.DataSource.DataSet.RecNo + 1;

                      IBarraHorIzq.Top := GetPosicionPanel(regActual);
                      IBarraHorDer.Top := GetPosicionPanel(regActual);
                    end;
               end;
               
    VK_DOWN  : begin
                    if (regActual < SBBarrita.Max) then
                    begin
                      regAnt := BDBGSimple.DataSource.DataSet.RecNo;
                      regActual := BDBGSimple.DataSource.DataSet.RecNo + 1;

                      IBarraHorIzq.Top := GetPosicionPanel(regActual);
                      IBarraHorDer.Top := GetPosicionPanel(regActual);
                    end;
               end;
  end;

  apretado:=false;
  if Key in [VK_SHIFT] then
  begin
    ind:= BDBGSimple.DataSource.DataSet.RecNo;
    apretado:=true;
  end;
end;

procedure TFEveSimple.BDBGSimpleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key in [VK_SHIFT] then
  begin
    ind:=0;
    apretado:=false;
  end;
end;

procedure TFEveSimple.PcBasicoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if PCBasico.ActivePage=TSGrilla then
      begin
      if (BDBGSimple.SelectedRows.Count=0) and (ansipos(Traducir('identificación'),lowercase(self.LTitulo.Caption))=0) then
        MostrarMensaje(tmAdvertencia,Traducir('No ha seleccionado animales')+#13+
        Traducir('1. Para seleccionar todos haga click en el botón TODOS')+#13+
        Traducir('2. Para seleccionar algunos mantenga presionada la tecla CTRL y haga click sobre los animales elegidos'));
      end;
end;

procedure TFEveSimple.actualizarCantAnimales;
begin
  inherited;
  if TSGrilla.TabVisible then
    TSGrilla.Caption:= Traducir('Detalle (')+inttostr(BDBGSimple.DataSource.DataSet.RecordCount{MSimple.BDBGSeleccionados.RowCount-1})+')';
  PCBasico.Repaint;
end;

procedure TFEveSimple.creacionGrupo;
var v : TFNombredelGrupo;
    fecha:string;
begin
  try
  fecha:=datetostr(now);
  if (IBDSSimple.FindField('FECHA')<>nil) then //try
    if (BDBGSimple.ColumnByField('FECHA').Visible = true) then
      fecha:=datetostr(IBDSSimple.FieldValues['FECHA']); //se puede hacer un procedimiento que busque en todos los componentes de GBDatos y que si encuentra uno del tipo de TDateTimePicker, que agarre la fecha de ahi
   except
     fecha:=datetostr(now);
   end;
   v := TFNombredelGrupo.Create(self);
   v.ENombreGrupo.Text := PTitulo.Caption + ' ' + fecha;
   v.ShowModal;
   FNombreGrupo := v.ENombreGrupo.Text;
   IBSPCrearGrupo.ParamByName('ESTABLECIMIENTO').Value :=FPrincipal.EstablecimientoActual;
   IBSPCrearGrupo.ParamByName('NOMBREGRUPO').Value := FNombreGrupo;
   IBSPCrearGrupo.ParamByName('DESCRIPCIONGRUPO').Value := 'Creación del evento '+ FNombreGrupo;
   IBSPCrearGrupo.ParamByName('TIPO').Value :='S';
   IBSPCrearGrupo.ParamByName('TIPO_EVENTO').Value := FtipoEvento;
   IBSPCrearGrupo.ParamByName('NRO_DTE').Value := null;
   IBSPCrearGrupo.ParamByName('PATH_DTE').Value := null;
   IBSPCrearGrupo.ExecProc;
   crearServicio;
end;


function TFEveSimple.getPosicion(str:string;arr:arrGral):integer;
var i:integer;
begin
  getPosicion:=-1;
  for i:=0 to length(arr)-1 do
    if arr[i].nomCampo=str then
      begin
      getPosicion:=i;
      break;
      end;
end;

procedure TFEveSimple.IBDSSimpleID_RPSetText(Sender: TField;const Text: String);
var rp:string;
begin
  inherited;
  str:=IBDSSimple.fieldByName('id_rp').AsString;
  rp:=uppercase(text);
  if MSimple.IBQDisponibles.Locate('ID_RP',rp,[]) and not MSimple.IBQSeleccionados.Locate('ID_RP',text,[]) then
        begin
        MSimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
        IBDSSimple.Edit;
        IBDSSimple.fieldByName('id_rp').AsString:=rp;
        IBDSSimple.FieldByName('ID_ANIMAL').AsInteger:=MSimple.IBQDisponibles.Lookup('ID_RP',rp,'ID_ANIMAL');
        IBDSSimple.FieldByName('EW').AsString:= 'M';
        MSimpleBBAgregarUnoClick(self);
        end;
  if BDBGSimple.DataSource.DataSet.Lookup('ID_RP',str,'ID_RP')=Null then
        begin
        Msimple.IBQSeleccionados.Locate('ID_RP',str,[]);
        Msimple.BDBGSeleccionados.SelectedRows.CurrentRowSelected:=true;
        MSimpleBBEliminarUnoClick(self);
        end;
  actualizarCantAnimales;
  PaintRequired;
end;

procedure TFEveSimple.marcarRepetidos(rp:string);
begin
if MSimple.BDBGDisponibles.SelectedRows.CurrentRowSelected or MSimple.BDBGSeleccionados.DataSource.DataSet.Locate('ID_RP',rp,[]) then
  begin
  IBDSSimple.FieldByName('EW').AsString := 'E';
  MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+ Traducir('RP')  +' = '+rp);
  BDBGSimple.ColumnByField('ID_RP').ReadOnly:=false;
  mostrar:=true;
  end;
end;

procedure TFEveSimple.continuarGrilla;
begin
        archivo:=ExtractFilePath(Application.ExeName)+'temp-'+inttostr(FPrincipal.EstablecimientoActual)+'-'+self.LTitulo.Caption+'.xls';
        preguntar:=false;
        cargatemp:=true;
        cargarArchivo(archivo);
        cargatemp:=false;
end;

procedure TFEveSimple.setDefault(campo:string); begin end;
procedure TFEveSimple.completarCampos; begin end;

procedure TFEveSimple.LabelComponenteMouseEnter(Sender: TObject);
begin
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      TLabel(Sender).Font.Color:= $00606C02;
      TLabel(Sender).Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveSimple.LabelComponenteMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      TLabel(Sender).Font.Color:= clWindowText;
      TLabel(Sender).Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveSimple.cargarArchivo(archivo:String);
var i:integer;
begin
        cargaDeMovil:=true;
        tipoEv:=self.LTitulo.Caption;
        DMSoftvet.IBQRpRepetidos.Close;
        DMSoftvet.IBQRpRepetidos.SQL.Clear;
        if AnsiContainsStr(MSimple.SQLBasico,'where') then
          DMSoftvet.IBQRpRepetidos.SQL.Add(MSimple.SQLBasico+' and id_rp like :rp and establecimiento = :esta')
        else
          DMSoftvet.IBQRpRepetidos.SQL.Add(MSimple.SQLBasico+' where id_rp like :rp and establecimiento = :esta');

        try
          abrirArchivo(self,archivo);
        except
          //MostrarMensaje(tmerror,'Error en la importacion EVESIMPLE');
          end;
        if not cargaDeMovil then abort;

        //for (i:=0 to campos.count-1) do


        if not cargaTemp then       //esto es para el tema de la comprobacion del archivo, para ver si ya se habia importado antes
        begin
          setLength(arrImportaciones,Length(arrImportaciones)+1);
          arrImportaciones[Length(arrImportaciones)-1].fecha_importacion:=now;
          arrImportaciones[Length(arrImportaciones)-1].tipo_evento:=FTipoEvento;
          arrImportaciones[Length(arrImportaciones)-1].id_importacion:=getDato('id importacion',anim[0]);
          arrImportaciones[Length(arrImportaciones)-1].establecimiento:=FPrincipal.EstablecimientoActual;
        end;

          DMSoftVet.IBQDatosAnimal.Close;
          DMSoftVet.IBQDatosAnimal.ParamByName('establecimiento').Value:=FPrincipal.EstablecimientoActual;
          DMSoftVet.IBQDatosAnimal.Open;
          MSimple.IBQDisponibles.Close;
          MSimple.IBQDisponibles.Open;
          if PCBasico.ActivePage<>TSGrilla then
            begin
            PCBasico.ActivePage:=TSGrilla;
            end;
          PCBasicoChange(nil);
        cargaDeMovil:=false;
        SetLength(anim,0); //elimino el arreglo de animales
end;

procedure TFEveSimple.SacarRequeridos;
var
  i : Integer;
begin
  for i := 0 to ComponentCount-1 do
    if IsPublishedProp(Components[i],'EsRequerido') then
      SetPropValue(Components[i],'EsRequerido',false);
end;

procedure TFEveSimple.TimerLectorTimer(Sender: TObject);
var rec:TRecordData;
    info:trecinfo;
    auxlectura,rpaux, auxie: String;
    id_aux,i : Integer;
    arrBack : array of integer;

begin
  inherited;
  auxlectura := FLectorElectronico.Lectura;
  FLectorElectronico.Lectura := '';
  self :=   FEveSimple; // En caso que se perdio la referencia
  
  if(auxlectura<>'')then
  begin
//   if (FLectorElectronico.esUltraRFIG or
//   PuedeGrabar) then  //comienza if grande, si completo los datos obligatorios
   if PuedeGrabar then  //comienza if grande, si completo los datos obligatorios
   begin
    auxlectura := StringReplace(auxlectura, #9, '', [rfReplaceAll]);
    auxlectura := StringReplace(auxlectura, #32, '', [rfReplaceAll]);

    if not LeyoCaravana then
    begin
      PCBasico.ActivePage := TSDatos;
      PCBasicoChange(nil);
      JvSiguiente.OnClick(self);
      PCBasico.ActivePage := TSGrilla;
      PCBasicoChange(nil);
      PCBasico.ActivePage := TSGrilla;
      SBSelTodos.Visible:=true;
      ISelTodos.Visible := true;
      ISeleccionarVarios.Visible := true;
      ASacarAnimal.Visible := true;
      ISacarAnimal.Visible := true;
      JvIExpExcel.Visible := true;
      JvIImpExcel.Visible := true;
      //TSGrilla.TabVisible := true;
      //SacarRequeridos;
      //LeyoCaravana := true;
    end;

    if DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal')<>null then
      begin
          DMSoftvet.IBQDatosAnimal.Close;
          DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
          DMSoftvet.IBQDatosAnimal.Open;
          rpaux:= DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_rp');
          id_aux:= DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
          if msimple.IBQDisponibles.Locate('ID_ANIMAL',id_aux,[loCaseInsensitive]) then
          begin
            msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
            MSimpleBBAgregarUnoClick(self);
            msimple.IBQSeleccionados.Locate('ID_RP',rpaux,[loCaseInsensitive]);
            cargarColumnas(msimple.IBQSeleccionados.Lookup('ID_RP',rpaux,'ID_ANIMAL'));
            IBDSSimple.Refresh;
            BDBGSimple.SelectedRows.Clear;
            BDBGSimple.SelectedRows.CurrentRowSelected:=true;
          end
        else
            if IBDSSimple.Locate('ID_RP',rpaux,[loCaseInsensitive])then
            MostrarMensaje(tmError,Traducir('El animal ')+rpaux+Traducir(' ya está en la grilla'))
            else
            MostrarMensaje(tmError,Traducir('No se puede realizar el evento ')+self.LTitulo.Caption+Traducir(' sobre el animal ')+rpaux);
        end
      else
        begin
         TimerLector.Enabled := false;
         FPrincipal.idCargaElectronica := '';
         FPrincipal.idCargaElectronica := auxlectura;
         FV := TFMensajeGuardarVincular.Create(self);
         FV.idCargaElectronica := auxlectura;


         //backapeo los animales de la tabla aux_animales, porque el alta la borra
         msimple.IBQSeleccionados.First;

         while not(msimple.IBQSeleccionados.Eof) do
          begin
            SetLength(arrback, length (arrback)+1);
            arrBack[length(arrback)-1] := msimple.IBQSeleccionados.FieldValues['id_animal'];
            msimple.IBQSeleccionados.Next;
          end;

         FV.showmodal;

         if (fv.agregoOvinculo(auxlectura)) then
            begin
            DMSoftvet.IBQDatosAnimal.Close;
            DMSoftvet.IBQDatosAnimal.Open;
            msimple.IBQDisponibles.Close;
            msimple.IBQDisponibles.SQL.Clear;
            msimple.IBQDisponibles.SQL.Add('select * from tab_animales where id_ie = :i and establecimiento = :e');
            msimple.IBQDisponibles.ParamByName('i').AsString := auxlectura;
            msimple.IBQDisponibles.Parambyname('e').Asinteger := Fprincipal.EstablecimientoActual;
            msimple.IBQDisponibles.Open;
            rpaux:= DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_rp');
            id_aux:= DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
            msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
            MSimpleBBAgregarUnoClick(self);
            msimple.IBuscarAnimalClick(self); //Muestro toda la lista de disponibles
            msimple.IBQSeleccionados.Close;
            msimple.IBQSeleccionados.Open;
            msimple.IBQSeleccionados.Locate('ID_RP',rpaux,[loCaseInsensitive]);
            cargarColumnas(msimple.IBQSeleccionados.Lookup('ID_RP',rpaux,'ID_ANIMAL'));
            IBDSSimple.Refresh;
            BDBGSimple.SelectedRows.Clear;
            BDBGSimple.SelectedRows.CurrentRowSelected:=true;

            // Vuelvo a cargar los animales a la tabla aux animaes, previamente backapeados
            for i:= 0 to length(arrback)-1 do
            begin
              msimple.IBQDisponibles.Close;
              msimple.IBQDisponibles.SQL.Clear;
              msimple.IBQDisponibles.SQL.Add('select * from tab_animales where id_animal = :i and establecimiento = :e');
              msimple.IBQDisponibles.ParamByName('i').AsInteger := arrback[i];
              msimple.IBQDisponibles.Parambyname('e').Asinteger := Fprincipal.EstablecimientoActual;
              msimple.IBQDisponibles.Open;
              msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
              MSimpleBBAgregarUnoClick(self);
              msimple.IBuscarAnimalClick(self);
            end;
          end
            else // Si toco cancelar en la ventana de guardar/vincular
            begin
              if (MSimple.IBQSeleccionados.RecordCount > 0) then
                PCBasico.ActivePage := TSGrilla
              else
                PCBasico.ActivePage := TSDatos;
            end;

         FV.Destroy;

         FPrincipal.idCargaElectronica := '';
         TimerLector.Enabled := true;
      end;
      TSGrilla.TabVisible := true;
  end   // fin if grande si puede grabar
    else
      begin
      MostrarMensaje(tmError,'Debe completar los datos generales antes de continuar.');
      PCBasico.ActivePage := TSDatos;
      end;
  end;
end;

procedure TFEveSimple.crearLector;
begin
  //if if FLectorElectronico=nil then
  FLectorElectronico:= TLectorAllFlexSerie.Create();//creo segun el que estamos usando
  //FLectorElectronico.VAComm:= VaComm1;  //seteo el componente
  FLectorElectronico.ConfigurarVaComm();
  FLectorElectronico.OpenVAComm; // abro la conexion  }
end;

procedure TFEveSimple.cerrarLector;
begin
if FLectorElectronico<>nil then
    begin
    FLectorElectronico.CloseVAComm;
    FLectorElectronico.Destroy;
    FLectorElectronico:=nil;
    end;
end;

procedure TFEveSimple.GuardarGrillaTemporalTimer(Sender: TObject);
begin
  inherited;
//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
    begin
     //
    end
   else
//  {$ELSE}
      if (not IBDSSimple.IsEmpty) and (self.LTitulo.Caption<>Traducir('Nacimientos')) and (self.LTitulo.Caption<>Traducir('Eliminar Evento'))
      and (ansipos(Traducir('identificación'),lowercase(self.LTitulo.Caption))=0) then
        DTXLS.SaveToFile(ExtractFilePath(Application.ExeName)+'\temp-'+inttostr(FPrincipal.EstablecimientoActual)+'-'+self.LTitulo.Caption+'.xls');
//  {$ENDIF}
end;

procedure TFEveSimple.guardarImportacion(i:integer);
begin
  FImportacion.IBQImportacion.Close;
  FImportacion.IBQImportacion.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
  FImportacion.IBQImportacion.Open;
  if FImportacion.IBQImportacion.Locate('ID_IMPORTACION',arrImportaciones[i].id_importacion,[loCaseInsensitive]) then
    begin
    IBQImportacion.SQL.Clear;
    IBQImportacion.SQL.Add('UPDATE TAB_IMPORTACIONES SET'
                            +' ID_IMPORTACION=:ID_IMPORTACION,'
                            +' FECHA_IMPORTACION=:FECHA_IMPORTACION,'
                            +' TIPO_EVENTO=:TIPO_EVENTO,'
                            +' ESTABLECIMIENTO=:ESTABLECIMIENTO'
                            +' WHERE ID_IMPORTACION=:ID_IMPORTACION');
    end
  else
    begin
    IBQImportacion.SQL.Clear;
    IBQImportacion.SQL.Add('INSERT INTO TAB_IMPORTACIONES (ID_IMPORTACION,FECHA_IMPORTACION,TIPO_EVENTO,ESTABLECIMIENTO)'
                            +' VALUES  (:ID_IMPORTACION,:FECHA_IMPORTACION,:TIPO_EVENTO,:ESTABLECIMIENTO)');
    end;
  try
   IBQImportacion.Close;
   IBQImportacion.ParamByName('ID_IMPORTACION').AsString:=arrImportaciones[i].id_importacion;
   if arrImportaciones[i].id_importacion = '' then
    begin
      IBQTipoEvento.Close;
      IBQTipoEvento.ParamByName('t').AsInteger := arrImportaciones[i].tipo_evento;
      IBQTipoEvento.Open;
      IBQImportacion.ParamByName('ID_IMPORTACION').AsString:= IBQTipoEvento.FieldValues['NOMBRE'] + '-' +  DateToStr(arrImportaciones[i].fecha_importacion) +  FormatDateTime('hh-mm-ss', Now());
   end;
   
   IBQImportacion.ParamByName('TIPO_EVENTO').AsInteger:= arrImportaciones[i].tipo_evento;
   IBQImportacion.ParamByName('FECHA_IMPORTACION').AsDateTime:=arrImportaciones[i].fecha_importacion;
   IBQImportacion.ParamByName('ESTABLECIMIENTO').AsInteger:=arrImportaciones[i].establecimiento;
   IBQImportacion.Open;
   IBQImportacion.Transaction.CommitRetaining;
  except
   IBQImportacion.Transaction.RollbackRetaining;
   end;
end;

procedure TFEveSimple.configurarColumnasAGuardar;
var i:integer;
begin
for i:=0 to DTXLS.Columns.Count-1 do
  if (BDBGSimple.ColumnByField(DTXLS.Columns[i].DataField)<>nil) and (BDBGSimple.ColumnByField(DTXLS.Columns[i].DataField).Visible) then
    dtxls.Columns[i].Save:=true
  else if (BDBGSimple.ColumnByField(DTXLS.Columns[i].DataField)<>nil) and not(BDBGSimple.ColumnByField(DTXLS.Columns[i].DataField).Visible) then
    dtxls.Columns[i].Save:=false;
end;

procedure TFEveSimple.configurarColumnasACargar;
begin
end;

procedure TFEveSimple.acomodarGrilla;
begin
inherited;
end;

procedure TFEveSimple.LResponsableClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
      DMSoftvet.IBQResponsable.Close;
      DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQResponsable.Open;
    end;
end;

procedure TFEveSimple.cambiarCB(combo:TComponent;nro:integer);
begin
  if nro > -1 then
  begin
    TDBLookupComboBoxAuto(combo).KeyValue := nro;
    nro := -1;
  end;
  GetEvent(combo);
end;

procedure TFEveSimple.HabilitarComponentesVersionBasica;
begin
  inherited;
  MSimple.HabilitarComponentesVersionBasica();
end;

procedure TFEveSimple.BBImpGesReaderClick(Sender: TObject);
{var
  F : TFImpControles;}
begin
  inherited;
    try
    if ODArchivoGes.Execute then
    begin
      archivo:=ODArchivoGes.FileName;
      cargarArchivo(archivo);
      JvTerminar.Visible := true;
      LBBTerminar.Visible := true;
    end;
  except
    cargaDeMovil:=false;
  end;
 { F := TFImpControles.Create(self);
  F.ShowModal;
  F.Destroy;}
end;

procedure TFEveSimple.ISelTodosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  SBSelTodos.Down := true;
end;

procedure TFEveSimple.ISelTodosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  SBSelTodos.Down := false;
end;

procedure TFEveSimple.LSelTodosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  SBSelTodos.Down := true;
end;

procedure TFEveSimple.LSelTodosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  SBSelTodos.Down := false;
end;

procedure TFEveSimple.AgregarDatosVesta(Archivo : String);
begin

end;

function TFEveSimple.ObtenerFilaPrimerDato(DireccionArch : String): Integer;
var
  ext, linea: String;
  numLinea,cantFilas, columna: integer;
  _Arch, Caravanas : TStringList;
  Excel, planilla: OLEVariant;
begin

  ext := ExtractFileExt(DireccionArch);

  if (UpperCase(ext) = '.CSV') then
    begin
        _Arch := TStringList.Create;
        _Arch.Delimiter := ',';
        _Arch.LoadFromFile(DireccionArch);
        for numLinea := 0 to _Arch.Count-1 do
          begin
          Caravanas := TStringList.Create;
          Caravanas.Delimiter := ';';
          Caravanas.DelimitedText := _Arch.Strings[numLinea];
          linea := Caravanas[0];
          if (linea = 'EID') or (linea = 'Tag') or (linea ='GES3S') then
              Result := numLinea +2;  // +2 porque el indice del stringList empieze en 0, y el archivo empieza en la fila 1.
        end;
   end;


  columna := 1;
  if (FPrincipal.MarcaLector = 'Baqueano') then
    columna := 2;

  if (UpperCase(ext) = '.XLS') then
  begin
    Excel := CreateOleObject('Excel.Application');
    Excel.Workbooks.Open(DireccionArch);
    planilla := Excel.Worksheets[1];

    cantFilas := planilla.UsedRange.Rows.Count;

     for numLinea := 1 to (cantFilas) do
      begin
        linea := planilla.Cells[numLinea,columna];
        if (linea = 'EID') or (linea = 'Tag') or (linea = 'GES3S')
            or (linea = 'GES3S EIC DATA')
            or (linea = 'Id') then
              Result := numLinea +2;
      end;

     Excel.Quit;
     Excel := Unassigned;
     planilla := Unassigned;
  end;

end;


//*.*.*.* IMPORTACION

procedure TFEveSimple.CargarEquivalencias(DireccionArch : String);
var Archivo : TextFile;
    Indice,i , indiceNuevos, indiceExistentes: Integer;
    Linea : String;
    Caravanas : TStringList;
    FAV : TFEveAltaMasiva;
begin
  Indice := 0;
  indiceNuevos:=0;
  indiceExistentes:=0;
  SetLength(leidosNuevos,0);
  SetLength(leidosExistentes,0);
  AssignFile(Archivo,DireccionArch);
  Reset(Archivo);
  while not Eof(Archivo) do
  begin
    Caravanas := TStringList.Create;
    Readln(Archivo,Linea);
    Linea := StringReplace(Linea,'[','',[rfReplaceAll]);
    Linea := StringReplace(Linea,']','',[rfReplaceAll]);
    Caravanas.Delimiter := '|';
    Caravanas.DelimitedText := Linea;
    IBQExisteEQ.Close;
    IBQExisteEQ.ParamByName('ie').AsString := Caravanas[0];
    IBQExisteEQ.ParamByName('e').AsInteger := FPrincipal.EstablecimientoActual;
    IBQExisteEQ.Open;
    if IBQExisteEQ.IsEmpty then
    begin
      SetLength(leidosNuevos,indice+1);
      leidosNuevos[indice]:= Caravanas[0];
      Inc(Indice);
    end
    else
    begin
        SetLength(leidosExistentes,indiceExistentes+1);
        leidosExistentes[indiceExistentes] := Caravanas[0];
        Inc(indiceExistentes);
    end;
  end;

  if Length(leidosNuevos) > 0 then
  begin
    If (MostrarMensaje(tmConsulta, 'Se han encontrado '+ inttostr(Length(leidosNuevos)) +' animales no existentes en el sistema. ¿Desea realizar el alta masiva?') = mrYes) then
     begin
        FAV := TFEveAltaMasiva.Create(self);
        FAV.JvECantidad.Text := inttostr(Length(leidosNuevos));
        FAV.altaDesdeEvento := true;
        for i:= 0 to Length(leidosNuevos)-1  do
          begin
            SetLength (FAV.Equivalencias,i+1);
            FAV.Equivalencias[i].RP := RightStr(leidosNuevos[i],10);
            FAV.Equivalencias[i].IE := leidosNuevos[i];
        end;
        FAV.identElectronica := true;
        FAV.showmodal;
        FAV.Destroy;
     end;
   end;

     DMSoftvet.IBQDatosAnimal.Close;
     DMSoftvet.IBQDatosAnimal.Open;


     for i:= 0 to Length(leidosExistentes)-1  do
       begin
        msimple.IBQDisponibles.Close;
        msimple.IBQDisponibles.SQL.Clear;
        msimple.IBQDisponibles.SQL.Add('select * from tab_animales where id_ie = :i and establecimiento = :e');
        msimple.IBQDisponibles.ParamByName('i').AsString := leidosExistentes[i];
        msimple.IBQDisponibles.Parambyname('e').Asinteger := Fprincipal.EstablecimientoActual;
        msimple.IBQDisponibles.Open;
        if (msimple.IBQDisponibles.RecordCount = 1) then
          begin
            Msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
            MSimpleBBAgregarUnoClick(self);
        end;
     end;

     for i:= 0 to Length(leidosNuevos)-1  do
       begin
        msimple.IBQDisponibles.Close;
        msimple.IBQDisponibles.SQL.Clear;
        msimple.IBQDisponibles.SQL.Add('select * from tab_animales where id_ie = :i and establecimiento = :e');
        msimple.IBQDisponibles.ParamByName('i').AsString := leidosNuevos[i];
        msimple.IBQDisponibles.Parambyname('e').Asinteger := Fprincipal.EstablecimientoActual;
        msimple.IBQDisponibles.Open;
        if (msimple.IBQDisponibles.RecordCount = 1) then
          begin
            //rpaux:= DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_rp');
            //id_aux:= DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
            msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
            MSimpleBBAgregarUnoClick(self);
        end;
      end;

      msimple.IBuscarAnimalClick(self); //Muestro toda la lista de disponibles
      msimple.IBQSeleccionados.Close;
      msimple.IBQSeleccionados.Open;
      //msimple.IBQSeleccionados.Locate('ID_RP',rpaux,[loCaseInsensitive]);
      //cargarColumnas(msimple.IBQSeleccionados.Lookup('ID_RP',rpaux,'ID_ANIMAL'));
      IBDSSimple.Refresh;
      BDBGSimple.SelectedRows.Clear;
      BDBGSimple.SelectedRows.CurrentRowSelected:=true;


end;



procedure TFEveSimple.CargarIdentVesta(DireccionArch : String);
var indiceNuevos, indiceExistentes, IArch : Integer;
    aux_ie : String;
    _Arch : TStringList;
    Caravanas : TStringList;
    FAV : TFEveAltaMasiva;
    i: integer;



begin
  indiceNuevos := 0;
  indiceExistentes := 0;
  _Arch := TStringList.Create;
  _Arch.Delimiter := ',';
  _Arch.LoadFromFile(DireccionArch);

  for IArch := ObtenerFilaPrimerDato(ODVesta.FileName)-1 to _Arch.Count-1 do
  begin
{    Caravanas := TStringList.Create;
    Caravanas.Delimiter := ';';
    Caravanas.DelimitedText := _Arch.Strings[IArch];
    aux_ie := Caravanas[0];               }

    aux_ie := recuperarIE(_Arch.Strings[IArch], ';');

    IBQExisteEQ.Close;
    IBQExisteEQ.ParamByName('ie').AsString :=     aux_ie;

    IBQExisteEQ.ParamByName('e').AsInteger := FPrincipal.EstablecimientoActual;
    IBQExisteEQ.Open;
    if IBQExisteEQ.IsEmpty then
    begin
      SetLength(leidosNuevos,indiceNuevos+1);
      leidosNuevos[indiceNuevos] := aux_ie;
      Inc(indiceNuevos);
    end
    else
    begin
        SetLength(leidosExistentes,indiceExistentes+1);
        leidosExistentes[indiceExistentes] := aux_ie;
        Inc(indiceExistentes);
    end;
  end;

 if Length(leidosNuevos) > 0 then
  begin
    If (MostrarMensaje(tmConsulta, 'Se han encontrado '+ inttostr(Length(leidosNuevos)) +' animales no existentes en el sistema. ¿Desea realizar el alta masiva?') = mrYes) then
     begin
        FAV := TFEveAltaMasiva.Create(self);
        FAV.JvECantidad.Text := inttostr(Length(leidosNuevos));
        FAV.altaDesdeEvento := true;
        for i:= 0 to Length(leidosNuevos)-1  do
          begin
            SetLength (FAV.Equivalencias,i+1);
            FAV.Equivalencias[i].RP := RightStr(leidosNuevos[i],10);
            FAV.Equivalencias[i].IE := leidosNuevos[i];
        end;
        FAV.identElectronica := true;
        FAV.showmodal;
        FAV.Destroy;
     end;
   end;

     DMSoftvet.IBQDatosAnimal.Close;
     DMSoftvet.IBQDatosAnimal.Open;


     for i:= 0 to Length(leidosExistentes)-1  do
       begin
        msimple.IBQDisponibles.Close;
        msimple.IBQDisponibles.SQL.Clear;
        msimple.IBQDisponibles.SQL.Add('select * from tab_animales where id_ie = :i and establecimiento = :e');
        msimple.IBQDisponibles.ParamByName('i').AsString := leidosExistentes[i];
        msimple.IBQDisponibles.Parambyname('e').Asinteger := Fprincipal.EstablecimientoActual;
        msimple.IBQDisponibles.Open;
        if (msimple.IBQDisponibles.RecordCount = 1) then
          begin
            Msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
            MSimpleBBAgregarUnoClick(self);
        end;
     end;

     for i:= 0 to Length(leidosNuevos)-1  do
       begin
        msimple.IBQDisponibles.Close;
        msimple.IBQDisponibles.SQL.Clear;
        msimple.IBQDisponibles.SQL.Add('select * from tab_animales where id_ie = :i and establecimiento = :e');
        msimple.IBQDisponibles.ParamByName('i').AsString := leidosNuevos[i];
        msimple.IBQDisponibles.Parambyname('e').Asinteger := Fprincipal.EstablecimientoActual;
        msimple.IBQDisponibles.Open;
        if (msimple.IBQDisponibles.RecordCount = 1) then
          begin
            //rpaux:= DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_rp');
            //id_aux:= DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
            msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
            MSimpleBBAgregarUnoClick(self);
        end;
      end;

      msimple.IBuscarAnimalClick(self); //Muestro toda la lista de disponibles
      msimple.IBQSeleccionados.Close;
      msimple.IBQSeleccionados.Open;
      //msimple.IBQSeleccionados.Locate('ID_RP',rpaux,[loCaseInsensitive]);
      //cargarColumnas(msimple.IBQSeleccionados.Lookup('ID_RP',rpaux,'ID_ANIMAL'));
      IBDSSimple.Refresh;
      BDBGSimple.SelectedRows.Clear;
      BDBGSimple.SelectedRows.CurrentRowSelected:=true;




      //FPrincipal.JvICargaMasivaClick();
    (*cargaEQ := true;
    EACantidad.Text := IntToStr(Length(Equivalencias)-1);
    JvECantidad.Text := IntToStr(Length(Equivalencias)-1);
    BDBGGrillaHembras.Columns[3].Visible := true;
    BDBGGrillaHembras.Columns[3].Width := 145;
    BDBGGrillaMachos.Columns[3].Visible := true;
    BDBGGrillaMachos.Columns[3].Width := 145;
    BDBGGrillaHembras.Columns[1].Visible := true;
    BDBGGrillaHembras.Columns[1].Width := 145;
    BDBGGrillaMachos.Columns[1].Visible := true;
    BDBGGrillaMachos.Columns[1].Width := 145;
    //BDBGGrillaMachos.Columns[2].Visible := false;
    //BDBGGrillaHembras.Columns[2].visible := false;*)

  //end;
end;

procedure TFEveSimple.cargarDesdeExcel(DireccionArch : String);
var
  Excel, planilla: OLEVariant;
  cantFilas, CantColumnas, i, j, indiceNuevos,indiceExistentes,columna : Integer;
  ieActual : String;
  FAV : TFEveAltaMasiva;

  begin

  Excel := CreateOleObject('Excel.Application');
  Excel.Workbooks.Open(DireccionArch);
  planilla := Excel.Worksheets[1];

  cantFilas := planilla.UsedRange.Rows.Count;
  cantColumnas := planilla.UsedRange.Columns.Count;

  indiceNuevos := 0;
  indiceExistentes := 0;

  SetLength(leidosNuevos,0);
  SetLength(leidosExistentes,0);

  columna := 1;
  if (FPrincipal.MarcaLector = 'Baqueano') then
    columna :=2;

  for i := ObtenerFilaPrimerDato(ODVesta.FileName)-1 to (cantFilas) do
    begin
      ieActual := planilla.Cells[i,columna];
      ieActual := trim(planilla.Cells[i,columna]);
      ieActual := StringReplace(ieActual, ' ', '', [rfReplaceAll]);
      IBQExisteEQ.Close;
      IBQExisteEQ.ParamByName('ie').AsString := ieActual;
      IBQExisteEQ.ParamByName('e').AsInteger := FPrincipal.EstablecimientoActual;
      IBQExisteEQ.Open;

      if IBQExisteEQ.IsEmpty then
      begin
        SetLength(leidosNuevos,indiceNuevos+1);
        leidosNuevos[indiceNuevos] := ieActual;
        Inc(indiceNuevos);
      end
      else
        begin
          SetLength(leidosExistentes,indiceExistentes+1);
          leidosExistentes[indiceExistentes] := ieActual;
          Inc(indiceExistentes);
      end;
    end;


    if Length(leidosNuevos) > 0 then
      begin
        If (MostrarMensaje(tmConsulta, 'Se han encontrado '+ inttostr(Length(leidosNuevos)) +' animales no existentes en el sistema. ¿Desea realizar el alta masiva?') = mrYes) then
          begin
            FAV := TFEveAltaMasiva.Create(self);
            FAV.JvECantidad.Text := inttostr(Length(leidosNuevos));
            FAV.altaDesdeEvento := true;
            for i:= 0 to Length(leidosNuevos)-1  do
              begin
                SetLength (FAV.Equivalencias,i+1);
                FAV.Equivalencias[i].RP := RightStr(leidosNuevos[i],10);
                FAV.Equivalencias[i].IE := leidosNuevos[i];
            end;
            FAV.identElectronica := true;
            FAV.showmodal;
            FAV.Destroy;
          end;
      end;

     DMSoftvet.IBQDatosAnimal.Close;
     DMSoftvet.IBQDatosAnimal.Open;


     for i:= 0 to Length(leidosExistentes)-1  do
       begin
        msimple.IBQDisponibles.Close;
        msimple.IBQDisponibles.SQL.Clear;
        msimple.IBQDisponibles.SQL.Add('select * from tab_animales where id_ie = :i and establecimiento = :e');
        msimple.IBQDisponibles.ParamByName('i').AsString := leidosExistentes[i];
        msimple.IBQDisponibles.Parambyname('e').Asinteger := Fprincipal.EstablecimientoActual;
        msimple.IBQDisponibles.Open;
        if (msimple.IBQDisponibles.RecordCount = 1) then
          begin
            Msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
            MSimpleBBAgregarUnoClick(self);
        end;
     end;

     for i:= 0 to Length(leidosNuevos)-1  do
       begin
        msimple.IBQDisponibles.Close;
        msimple.IBQDisponibles.SQL.Clear;
        msimple.IBQDisponibles.SQL.Add('select * from tab_animales where id_ie = :i and establecimiento = :e');
        msimple.IBQDisponibles.ParamByName('i').AsString := leidosNuevos[i];
        msimple.IBQDisponibles.Parambyname('e').Asinteger := Fprincipal.EstablecimientoActual;
        msimple.IBQDisponibles.Open;
        if (msimple.IBQDisponibles.RecordCount = 1) then
          begin
            Msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
            MSimpleBBAgregarUnoClick(self);
        end;
      end;

      msimple.IBuscarAnimalClick(self); //Muestro toda la lista de disponibles
      msimple.IBQSeleccionados.Close;
      msimple.IBQSeleccionados.Open;
      IBDSSimple.Refresh;
      BDBGSimple.SelectedRows.Clear;
      BDBGSimple.SelectedRows.CurrentRowSelected:=true;

     Excel.Quit;
     Excel := Unassigned;
     planilla := Unassigned;


end;

//*.*.*.* FIN IMPORTACION

procedure TFEveSimple.CargarDesdeXML(arch:TFileName);
var
  gral, atrib, hijo, animal:IXMLNode;
  atributo, ieActual: string;
  cant,i: integer;
  indiceNuevos, indiceExistentes: integer;
  FAV : TFEveAltaMasiva;
begin
  //cant:=0;
  //SetLength(Equivalencias,0);
  XMLDoc.LoadFromFile(arch);
  XMLDoc.Active := True;
  gral := XMLDoc.DocumentElement.ChildNodes.First;//este seria el nodo donde estan los datos generales
  animal := XMLDoc.DocumentElement.ChildNodes.Get(1);// Aca esta el primer animal.
  SetLength(leidosNuevos,0);
  SetLength(leidosExistentes,0);
  indiceNuevos:=0;
  indiceExistentes:=0;
  while animal<>nil do
    begin
    atrib:=animal.ChildNodes.First;
    //SetLength(Equivalencias,cant+1);
    ieActual := atrib.NodeValue;
    IBQExisteEQ.Close;
    IBQExisteEQ.ParamByName('ie').AsString := ieActual;
    IBQExisteEQ.ParamByName('e').AsInteger := FPrincipal.EstablecimientoActual;
    IBQExisteEQ.Open;
    if IBQExisteEQ.IsEmpty then
      begin
        SetLength(leidosNuevos,indiceNuevos+1);
        leidosNuevos[indiceNuevos] := ieActual;
        Inc(indiceNuevos);
       end
      else
        begin
          SetLength(leidosExistentes,indiceExistentes+1);
          leidosExistentes[indiceExistentes] := ieActual;
          Inc(indiceExistentes);
      end;

    animal:= animal.NextSibling;
  end;

  if Length(leidosNuevos) > 0 then
  begin
    If (MostrarMensaje(tmConsulta, 'Se han encontrado '+ inttostr(Length(leidosNuevos)) +' animales no existentes en el sistema. ¿Desea realizar el alta masiva?') = mrYes) then
     begin
        FAV := TFEveAltaMasiva.Create(self);
        FAV.JvECantidad.Text := inttostr(Length(leidosNuevos));
        FAV.altaDesdeEvento := true;
        for i:= 0 to Length(leidosNuevos)-1  do
          begin
            SetLength (FAV.Equivalencias,i+1);
            FAV.Equivalencias[i].RP := RightStr(leidosNuevos[i],10);
            FAV.Equivalencias[i].IE := leidosNuevos[i];
        end;
        FAV.identElectronica := true;
        FAV.showmodal;
        FAV.Destroy;
     end;
   end;

     DMSoftvet.IBQDatosAnimal.Close;
     DMSoftvet.IBQDatosAnimal.Open;


     for i:= 0 to Length(leidosExistentes)-1  do
       begin
        msimple.IBQDisponibles.Close;
        msimple.IBQDisponibles.SQL.Clear;
        msimple.IBQDisponibles.SQL.Add('select * from tab_animales where id_ie = :i and establecimiento = :e');
        msimple.IBQDisponibles.ParamByName('i').AsString := leidosExistentes[i];
        msimple.IBQDisponibles.Parambyname('e').Asinteger := Fprincipal.EstablecimientoActual;
        msimple.IBQDisponibles.Open;
        if (msimple.IBQDisponibles.RecordCount = 1) then
          begin
            Msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
            MSimpleBBAgregarUnoClick(self);
        end;
     end;

     for i:= 0 to Length(leidosNuevos)-1  do
       begin
        msimple.IBQDisponibles.Close;
        msimple.IBQDisponibles.SQL.Clear;
        msimple.IBQDisponibles.SQL.Add('select * from tab_animales where id_ie = :i and establecimiento = :e');
        msimple.IBQDisponibles.ParamByName('i').AsString := leidosNuevos[i];
        msimple.IBQDisponibles.Parambyname('e').Asinteger := Fprincipal.EstablecimientoActual;
        msimple.IBQDisponibles.Open;
        if (msimple.IBQDisponibles.RecordCount = 1) then
          begin
            //rpaux:= DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_rp');
            //id_aux:= DMSoftvet.IBQDatosAnimal.Lookup('id_ie',auxlectura,'id_animal');
            msimple.BDBGDisponibles.SelectedRows.CurrentRowSelected:=true;
            MSimpleBBAgregarUnoClick(self);
        end;
      end;

      msimple.IBuscarAnimalClick(self); //Muestro toda la lista de disponibles
      msimple.IBQSeleccionados.Close;
      msimple.IBQSeleccionados.Open;
      //msimple.IBQSeleccionados.Locate('ID_RP',rpaux,[loCaseInsensitive]);
      //cargarColumnas(msimple.IBQSeleccionados.Lookup('ID_RP',rpaux,'ID_ANIMAL'));
      IBDSSimple.Refresh;
      BDBGSimple.SelectedRows.Clear;
      BDBGSimple.SelectedRows.CurrentRowSelected:=true;



end;

procedure TFEveSimple.ImpDisVesta(Sender : TObject);
var
  ext : String;
  PosClick : TPoint;
begin
  GetCursorPos(PosClick);
  PMMarcasLector.Popup(PosClick.X,PosClick.Y);
  //if(FPrincipal.MarcaLector = 'Allflex') or (FPrincipal.MarcaLector = 'Datamars')then
  //  begin
        if ODVesta.Execute then
          begin
            ext := ExtractFileExt(ODVesta.FileName);
            if UpperCase(ext) = '.TXT' then
              CargarEquivalencias(ODVesta.FileName);
            if (UpperCase(ext) = '.CSV') then
              CargarIdentVesta(ODVesta.FileName);
            if (UpperCase(ext) = '.XLS') then
              CargarDesdeExcel(ODVEsta.FileName);
            if (UpperCase(ext) = '.XML') then
              CargarDesdeXML(ODVEsta.FileName);
          end;
    //end
  //else
  //try
  //  if ODVesta.Execute then
  //  begin
  //    archivo:=ODVesta.FileName;
  //    cargarArchivo(archivo);
  //  end;
  //except
  //  cargaDeMovil:=false;
  //end;
end;


procedure TFEveSimple.AutoAjustarColumnas;
var
   ind_col, LONG_MAX, LONG_COL, LONG_TITLE: integer;
begin

       for ind_col := 0 to BDBGSimple.Columns.Count - 1 do
       begin

           BDBGSimple.Columns[ind_col].Title.Font.Name := 'Arial';
           BDBGSimple.Columns[ind_col].Title.Font.Style := [fsBold];
           BDBGSimple.Columns[ind_col].Title.Font.Size := 10;
           BDBGSimple.Columns[ind_col].Title.Alignment := taCenter;
           BDBGSimple.Columns[ind_col].Alignment := taCenter; 

           LONG_MAX := 0;
           BDBGSimple.DataSource.DataSet.First;
           while not BDBGSimple.DataSource.DataSet.Eof do
           begin
             if BDBGSimple.Columns[ind_col].FieldName <> '' then
              LONG_COL := length(BDBGSimple.Columns[ind_col].Field.AsString)
             else
              LONG_COL := length('-');
             if (LONG_COL > LONG_MAX) then
                  LONG_MAX := LONG_COL;
             BDBGSimple.DataSource.DataSet.Next;
           end;

           LONG_TITLE := length(BDBGSimple.Columns[ind_col].Title.Caption);

           if (LONG_MAX > LONG_TITLE) then
               BDBGSimple.Columns[ind_col].Width := (7*LONG_MAX)+25
           else
               BDBGSimple.Columns[ind_col].Width := (7*LONG_TITLE)+25;

       end;
end;



procedure TFEveSimple.ISubirIzqClick(Sender: TObject);
begin
  inherited;

   if (IBarraHorDer.Top > IBarraVertDer.Top) then
   begin
      EnTope := false;

      Dec(Posicion);
         
      BDBGSimple.Options := [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

      BDBGSimple.SelectedRows.CurrentRowSelected := false;
      BDBGSimple.DataSource.DataSet.Prior;
      BDBGSimple.SetFocus;

      regActual := BDBGSimple.DataSource.DataSet.RecNo;

      IBarraHorIzq.Top := GetPosicionPanel(BDBGSimple.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(posicion-1));
      IBarraHorDer.Top := GetPosicionPanel(BDBGSimple.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(posicion-1));
   end
   else
       EnTope := true; 
end;

procedure TFEveSimple.IBajarIzqClick(Sender: TObject);
var aux : integer;
begin
  inherited;

  EnTope := false;

  aux := IBarraVertDer.Top + IBarraVertDer.Height - IBarraHorDer.Height;

  if (IBarraHorDer.Top < aux) then
  begin
    Inc(Posicion);

    BDBGSimple.Options := [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

    BDBGSimple.SelectedRows.CurrentRowSelected := false;
    BDBGSimple.DataSource.DataSet.Next;
    BDBGSimple.SetFocus;

    regActual := BDBGSimple.DataSource.DataSet.RecNo;

    IBarraHorIzq.Top := GetPosicionPanel(BDBGSimple.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*posicion);
    IBarraHorDer.Top := GetPosicionPanel(BDBGSimple.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*posicion);

  end;
end;

procedure TFEveSimple.SBBarritaScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
var mitad : integer;
begin
  inherited;

  mitad := SBBarrita.Max div 2;

  if (ScrollCode = scTrack) then
  begin
       if (ScrollPos > mitad) then
       begin
          BDBGSimple.SelectedRows.CurrentRowSelected := false;
          BDBGSimple.DataSource.DataSet.Next;
          BDBGSimple.SetFocus;
          Inc(Posicion);
       end
       else
       begin
          BDBGSimple.SelectedRows.CurrentRowSelected := false;
          BDBGSimple.DataSource.DataSet.Prior;
          BDBGSimple.SetFocus;
          Dec(Posicion);
       end;
  end;

  if (ScrollPos = SBBarrita.Min) then
  begin
      BDBGSimple.SelectedRows.CurrentRowSelected := false;
      BDBGSimple.DataSource.DataSet.First;
      BDBGSimple.SetFocus;
  end;

  if (ScrollPos = SBBarrita.Max) then
  begin
      BDBGSimple.SelectedRows.CurrentRowSelected := false;
      BDBGSimple.DataSource.DataSet.Last;
      BDBGSimple.SetFocus;
  end;

  if ((ScrollCode = scLineUp) or (ScrollCode = scPageUp)) then
  begin
      BDBGSimple.SelectedRows.CurrentRowSelected := false;
      BDBGSimple.DataSource.DataSet.Prior;
      BDBGSimple.SetFocus;
  end;

  if ((ScrollCode = scLineDown) or (ScrollCode = scPageDown)) then
  begin
      BDBGSimple.SelectedRows.CurrentRowSelected := false;
      BDBGSimple.DataSource.DataSet.Next;
      BDBGSimple.SetFocus;
  end;
end;

procedure TFEveSimple.TimerBarraTimer(Sender: TObject);
var
  vtop : integer;
begin
  inherited;
      
      vtop := GetNavegacion(posYT);

      LVista.Caption := ' CoorY: ' + IntToStr(posYT) + ' vtop: ' + IntToStr(vtop);

      if ((EnTope) or ((IBarraHorIzq.Top >= IniBHoriz) and ((IBarraHorIzq.Top + 9) <= FinBHoriz))) then
      begin
        if (vtop >= IBarraHorIzq.Top) then
        begin
            if (regActual <= SBBarrita.Max) then
            begin
                Inc(Posicion);

                BDBGSimple.Options := [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
                BDBGSimple.SelectedRows.CurrentRowSelected := false;
                BDBGSimple.DataSource.DataSet.Next;
                regActual := BDBGSimple.DataSource.DataSet.RecNo;

                IBarraHorIzq.Top := GetPosicionPanel(BDBGSimple.DataSource.DataSet.RecNo);
                IBarraHorDer.Top := GetPosicionPanel(BDBGSimple.DataSource.DataSet.RecNo);

                BDBGSimple.SetFocus;
            end;
        end
        else
        begin
            if (regActual >= SBBarrita.Min) then
            begin
                Dec(Posicion);

                BDBGSimple.Options := [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
                BDBGSimple.SelectedRows.CurrentRowSelected := false;
                BDBGSimple.DataSource.DataSet.Prior;

                regActual := BDBGSimple.DataSource.DataSet.RecNo;
                IBarraHorIzq.Top := GetPosicionPanel(BDBGSimple.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(Posicion-1));
                IBarraHorDer.Top := GetPosicionPanel(BDBGSimple.DataSource.DataSet.RecNo); //IBarraVertDer.Top + (Increment*(Posicion-1));

                BDBGSimple.SetFocus;
            end;
        end;
      end;
end;

procedure TFEveSimple.IBarraVertIzqMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;


  BotonPulsado := not (BotonPulsado);

  while BotonPulsado do
  begin
      posXT := X;
      posYT := Y; 

      TimerBarra.Enabled := true;
      Application.ProcessMessages;
  end;
end;

procedure TFEveSimple.IBarraVertIzqMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  BotonPulsado := false;
  TimerBarra.Enabled := false;
end;

procedure TFEveSimple.CalcularIncremento(valor : integer);
begin
     if (valor < IBarraVertDer.Height) then
       Increment := IBarraVertDer.Height div valor
     else
       Increment := valor div IBarraVertDer.Height;

     if (Increment = 0) then Increment := 1;
end;

procedure TFEveSimple.IBarraHorIzqMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  with TImage(Sender) do
  begin

        IniP := ClientToScreen (Point(X, Y));
        IniPos := Point (Left, Top);
        PosAnt := IniPos.Y;

        Pressed := true;
  end;
end;

procedure TFEveSimple.IBarraHorIzqMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var P : TPoint;
    aux : integer;
begin

  if Pressed then
  begin
      with TShape(Sender) do
      begin
          P := ClientToScreen (Point(X, Y));
          Top := IniPos.Y + P.Y - IniP.Y;

          if ((Sender as TImage).Name = 'IBarraHorDer') then
              IBarraHorIzq.Top := Top;

          if ((Sender as TImage).Name = 'IBarraHorIzq') then
              IBarraHorDer.Top := Top;

          aux := (IBarraVertDer.Top + IBarraVertDer.Height) - IBarraHorDer.Height - 1;

          if ((top >= IBarraVertIzq.Top) and (top <= aux)) then
          begin
              BDBGSimple.DataSource.DataSet.RecNo := GetPosicionGrilla(top);
              regActual := BDBGSimple.DataSource.DataSet.RecNo;
          end
          else
          begin
              pressed := false;
              if (top >= IBarraVertIzq.Top) then
              begin
                  IBarraHorIzq.Top := IniBHoriz;
                  IBarraHorDer.Top := IniBHoriz;
              end
              else
              begin
                  IBarraHorIzq.Top := FinBHoriz-9;
                  IBarraHorDer.Top := FinBHoriz-9;
              end;
          end;

          EnTope := (top = IBarraVertIzq.Top);
      end;
  end;
end;

procedure TFEveSimple.IBarraHorIzqMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Pressed := FALSE;
end;

procedure TFEveSimple.AjustarPanelesLaterales;
var mitad : integer;
begin

     mitad := PanelIzq.Height div 2;

     IBarraHorIzq.Top := mitad - 4 - 138;
     IBarraHorDer.Top := mitad - 4 - 138;

     IBarraVertIzq.Top := mitad - 4 - 138;
     IBarraVertDer.Top := mitad - 4 - 138;

     ISubirIzq.Top := mitad - 4 - 192;
     ISubirDer.Top := mitad - 4 - 192;

     IBajarIzq.Top := mitad + 4 + 147;
     IBajarDer.Top := mitad + 4 + 147;

     IniBHoriz := IBarraVertIzq.Top;
     FinBHoriz := IBarraVertIzq.Top + IBarraVertIzq.Height;

end;

function TFEveSimple.GetPosicionPanel(reg : integer) : integer;
var x1, x0, x11, x00, xp, xpp : integer;
    aux1, aux2, aux3, aux4 : double;
begin

     x0 := IBarraVertDer.Top;
     x1 := IBarraVertDer.Top + IBarraVertDer.Height;

     x00 := 1;
     x11 := SBBarrita.Max;
     xpp := reg;

     aux1 := (x11 - xpp);
     aux2 := (x11 - x00);
     aux3 := (x1 - x0);
     if (aux2 <> 0) then
      aux4 := (aux1 / aux2)
     else
      aux4 := aux1;

     if (reg = 1) then aux4 := 1;
     if (reg = SBBarrita.Max) then aux4 := 0;

     xp := x1 - Trunc(aux4*aux3);

     if (reg = SBBarrita.Max) then xp := xp - IBarraHorDer.Height;

     Result := xp;

end;

function TFEveSimple.GetPosicionGrilla(top : integer) : integer;
var x1, x0, x11, x00, xp, xpp : integer;
    aux1, aux2, aux3, aux4 : double;
begin

     x0 := IBarraVertDer.Top;
     x1 := IBarraVertDer.Top + IBarraVertDer.Height;

     x00 := 1;
     x11 := SBBarrita.Max;

     xp := top;

     aux1 := (x1 - xp);
     aux2 := (x1 - x0);
     aux3 := (x11 - x00);
     aux4 := (aux1 / aux2);

     xpp := x11 - Trunc(aux4*aux3);

     Result := xpp;

end;

function TFEveSimple.GetNavegacion(valor : integer) : integer;
var x1, x0, x11, x00, xp, xpp : integer;
    aux1, aux2, aux3, aux4 : double;
begin

     x0 := 1;
     x1 := 287;

     x00 := IniBHoriz;
     x11 := FinBHoriz;

     xp := valor;

     aux1 := (x1 - xp);
     aux2 := (x1 - x0);
     aux3 := (x11 - x00);
     aux4 := (aux1 / aux2);

     xpp := x11 - Trunc(aux4*aux3);

     Result := xpp;

end;

procedure TFEveSimple.ISeleccionarVariosClick(Sender: TObject);
begin
  inherited;

  SelVariosOff := not(SelVariosOff);

  apretado := false;
  if not(SelVariosOff) then
  begin
    ind:= BDBGSimple.DataSource.DataSet.RecNo;
    apretado := true;
    keybd_event(VK_CONTROL,0,0,0);
    MostrarMensaje(tmInformacion,'Haga clic sobre los animales que desea seleccionar.');
  end
  else
    keybd_event(VK_CONTROL,0,2,0);
        
end;


procedure TFEveSimple.AAnteriorExecute(Sender: TObject);
begin
  inherited;
  keybd_event(VK_CONTROL,0,2,0);
end;

procedure TFEveSimple.JvIExpExcelMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvIExpExcel,#13+'Guardar el detalle de los animales en Excel'+#13);
end;

procedure TFEveSimple.JvIExpExcelMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFEveSimple.JvIImpExcelMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvIImpExcel,#13+'Cargar el evento desde una planilla de Excel'+#13);
end;

procedure TFEveSimple.JvIImpExcelMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFEveSimple.JvIDispElectMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvIDispElect,#13+'Cargar el evento desde el archivo'+#13+'emitido por el lector electrónico'+#13);
end;

procedure TFEveSimple.JvIDispElectMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFEveSimple.ISacarAnimalMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(ISacarAnimal,#13+'Sacar el animal seleccionado'+#13+'del detalle'+#13);
end;

procedure TFEveSimple.ISacarAnimalMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFEveSimple.ISelTodosMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(ISelTodos,#13+'Seleccione todos los animales'+#13+'del detalle, para modificarle'+#13+'uno o mas datos'+#13);
end;

procedure TFEveSimple.ISelTodosMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFEveSimple.ISeleccionarVariosMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(ISeleccionarVarios,#13+'Seleccione varios animales'+#13+'del detalle, haciendo'+#13+'click sobre cada uno de ellos'+#13);
end;

procedure TFEveSimple.ISeleccionarVariosMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFEveSimple.MSimpleBDBGSeleccionadosDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (MSimple.BDBGSeleccionados.SelectedIndex = MSimple.BDBGSeleccionados.ColumnByField('id_rp').Index) then
  begin
    if not(MSimple.BDBGSeleccionados.DataSource.DataSet.IsEmpty) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := MSimple.BDBGSeleccionados.DataSource.DataSet.fieldByName('id_animal').AsInteger;
      F.modificar := false;
      F.BAgregarEvento.Visible:=true;
      F.BEliminar.Visible:=true;
      F.ShowModal;
      F.Destroy;
     end;
    RefrescarMangaDisp();
  end;
end;

procedure TFEveSimple.MSimpleBDBGSeleccionadosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    MSimpleBDBGSeleccionadosDblClick(nil);
end;

procedure TFEveSimple.ASiguienteExecute(Sender: TObject);
begin
  inherited;
  // Codigo Ivan Boton siguiente usando bastón
  if ((PCBasico.ActivePage = TSManga) and (MSimple.BDBGSeleccionados.DataSource.DataSet.RecordCount=1) and (FPrincipal._LECTOR_ONLINE)) then
    begin
      PCBasico.ActivePage := TSGrilla;
      JvSiguiente.Visible := false;
      JvAnteriror.Visible := true;
      JvTerminar.Visible := true;
      TSGrilla.ImageIndex := 2;
      TSGrilla.TabVisible := true;
      JvIExpExcel.Visible := true;
      JvIImpExcel.Visible := true;
      ISacarAnimal.Visible := true;
      ISelTodos.Visible := true;
      ISeleccionarVarios.visible := true;
      JvCancelar.Visible := true;
    end;
  // Fin Codigo Ivan Boton siguiente usando bastón
end;


procedure TFEveSimple.acomodarGrid(const DBGrid: TBitDBGrid);
var
  i : integer;
  TotWidth : integer;
  VarWidth : integer;
  ResizableColumnCount : integer;
  AColumn : TColumn;
begin
  //total width of all columns before resize
  TotWidth := 0;
  //how to divide any extra space in the grid
  VarWidth := 0;
  //how many columns need to be auto-resized
  ResizableColumnCount := 0;

  for i := 0 to -1 + DBGrid.Columns.Count do
  begin
    TotWidth := TotWidth + DBGrid.Columns[i].Width;
    if DBGrid.Columns[i].Field.Tag = 0 then
      Inc(ResizableColumnCount);
  end;

  //add 1px for the column separator line
  if dgColLines in DBGrid.Options then
    TotWidth := TotWidth + DBGrid.Columns.Count;

  //add indicator column width
  if dgIndicator in DBGrid.Options then
    TotWidth := TotWidth + IndicatorWidth;

  //width vale "left"
  VarWidth :=  DBGrid.ClientWidth - TotWidth;

  //Equally distribute VarWidth
  //to all auto-resizable columns
  if ResizableColumnCount > 0 then
    VarWidth := varWidth div ResizableColumnCount;

  for i := 0 to -1 + DBGrid.Columns.Count do
  begin
    AColumn := DBGrid.Columns[i];
    if AColumn.Field.Tag = 0 then
    begin
      AColumn.Width := AColumn.Width + VarWidth;
      if (AColumn.Width) = 0  then
        AColumn.Width := AColumn.Field.Tag;
    end;
  end;
end;


procedure TFEveSimple.Allflex1Click(Sender: TObject);
begin
  inherited;
  FPrincipal.MarcaLector := 'Allflex';
end;

procedure TFEveSimple.Datamars1Click(Sender: TObject);
begin
  inherited;
    FPrincipal.MarcaLector := 'Datamars';
end;

procedure TFEveSimple.Baqueano1Click(Sender: TObject);
begin
  inherited;
  FPrincipal.MarcaLector := 'Baqueano';
end;




end.

