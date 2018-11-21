unit UREPHistoriaAnimal;

interface
                                                                                                   
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBTable, Grids, DBGrids, StdCtrls, QRCtrls, QuickRpt, IBQuery, DBCtrls,
  Buttons, Mask, UREPFichaAnimal, EditAuto, UDBLookupComboBoxAuto, UBDBGrid,
  ImgList, IBStoredProc, DataExport, DataToXLS, WinXP, UEveSimple, UMensajeImpresora,
  Menus, JvExExtCtrls, JvImage, jpeg, PngImage, JvGIF, JvExControls, JvCaptionPanel,
  JvLabel, UCartel, PngImageList;

type
  TObjeto = record
    combo : TDBLookupComboBoxAuto;
    sentencia : ansistring;
  end;
  TRegistroParametros = record
    nombre : string;
    valor : variant;
  end;

  TFREPHistoriaAnimal = class(TFUniversal)
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
    GBComplejos: TGroupBox;
    Pizq: TPanel;
    RGBusqueda: TRadioGroup;
    GBChecks: TGroupBox;
    CBAnimalesActivos: TCheckBox;
    CBRechazados: TCheckBox;
    CBUltimoEvento: TCheckBox;
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
    LDesde1: TLabel;
    LDesde2: TLabel;
    LDesde3: TLabel;
    EAAniosDesde: TEditAuto;
    EAPesoDesde: TEditAuto;
    EAFrameDesde: TEditAuto;
    Lhasta1: TLabel;
    Lhasta2: TLabel;
    Lhasta3: TLabel;
    EAAniosHasta: TEditAuto;
    EAPesoHasta: TEditAuto;
    EAFrameHasta: TEditAuto;
    BDBGAnimales: TBitDBGrid;
    IBQParametros: TIBQuery;
    AVerFicha: TAction;
    AImprimirListado: TAction;
    IBQAnimalesANIMAL: TIntegerField;
    IBQAnimalesRP: TIBStringField;
    IBQAnimalesSEXO: TIntegerField;
    IBQAnimalesRAZA: TIntegerField;
    IBQAnimalesRAZA_NOMBRE: TIBStringField;
    IBQAnimalesRODEO: TIntegerField;
    IBQAnimalesCATEGORIA: TIntegerField;
    IBQAnimalesCATEGORIA_NOMBRE: TIBStringField;
    IBQAnimalesCRONO_DENT: TIntegerField;
    IBQAnimalesESTADO_REPRO: TIntegerField;
    IBQAnimalesNACIMIENTO: TDateField;
    IBQAnimalesEDAD: TIntegerField;
    IBQAnimalesPOTRERO: TIntegerField;
    IBQAnimalesACTIVO: TIBStringField;
    IBQAnimalesCOND_CORP: TIntegerField;
    IBQAnimalesGDR: TIntegerField;
    IBQAnimalesRECHAZADO: TIBStringField;
    IBQAnimalesFRAME: TFloatField;
    IBQAnimalesESTADO_ACTUAL: TIBStringField;
    IBQAnimalesULTIMO_EVENTO: TIBStringField;
    IBQAnimalesEDADCAPTION: TIBStringField;
    ImageList1: TImageList;
    CBEstadoParicion: TCheckBox;
    DBLCBAEstadoParicion: TDBLookupComboBoxAuto;
    BBAyuda: TBitBtn;
    BBFichaAnimal: TBitBtn;
    BBImprimirListado: TBitBtn;
    BBXls: TBitBtn;
    BBSalir: TBitBtn;
    BBEliminarAnimal: TBitBtn;
    AEliminarAnimal: TAction;
    BitBtn1: TBitBtn;
    CBOrigen: TCheckBox;
    DBLCBAOrigen: TDBLookupComboBoxAuto;
    GBRP: TGroupBox;
    EARP: TEditAuto;
    IBQAnimalesESTADO_LACTACION: TIntegerField;
    IBQAnimalesORIGEN_ANIMAL: TIntegerField;
    IBQAnimalesADN: TIBStringField;
    IBQAnimalesTIPIFICACION_SANGUINEA: TIBStringField;
    PMListadoAnimales: TPopupMenu;
    ListadodeAnimales1: TMenuItem;
    ListadodeAnimalesCab1: TMenuItem;
    IBQAnimalesHBA: TIBStringField;
    IBQAnimalesNOMBRE: TIBStringField;
    IBQAnimalesCODIGORAZA: TIBStringField;
    DBLCBASubcategoria: TDBLookupComboBoxAuto;
    CBSubcategoria: TCheckBox;
    EARemito: TEditAuto;
    CBRemito: TCheckBox;
    IBQAnimalesPESO: TFloatField;
    IFondoB: TImage;
    IAyuda: TImage;
    LAyuda: TLabel;
    IFicha: TImage;
    LFicha: TLabel;
    IPreview: TImage;
    LPreliminar: TLabel;
    IExcel: TImage;
    LExcel: TLabel;
    IEliminarAnim: TImage;
    LEliminarAnimal: TLabel;
    ISalir: TImage;
    LSalir: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    PopupMenu1: TPopupMenu;
    PListados: TPanel;
    IListadoAnimales: TImage;
    LRepPedigree: TJvLabel;
    LRepIndividual: TJvLabel;
    IRepIndividual: TImage;
    IRepPedigree: TImage;
    TPanel: TTimer;

    procedure ACSalirExecute(Sender: TObject);
    procedure ACReportPrintExecute(Sender: TObject);
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
    procedure AImprimirListadoExecute(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure IBQAnimalesAfterClose(DataSet: TDataSet);
    procedure IBQAnimalesBeforeOpen(DataSet: TDataSet);
    procedure BBXlsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BDBGAnimalesKeyPress(Sender: TObject; var Key: Char);
    procedure EAAniosDesdeChange(Sender: TObject);
    procedure EAPesoDesdeChange(Sender: TObject);
    procedure EAFrameDesdeChange(Sender: TObject);
    procedure EARPKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AEliminarAnimalExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BDBGAnimalesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BDBGAnimalesTitleClick(Column: TColumn);
    procedure ListadodeAnimales1Click(Sender: TObject);
    procedure ListadodeAnimalesCab1Click(Sender: TObject);
    procedure CBRazaClick(Sender: TObject);
    procedure DBLCBARazaCloseUp(Sender: TObject);
    procedure EARemitoChange(Sender: TObject);
    procedure DBLCBAMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClick(Sender: TObject);

    procedure TPanelTimer(Sender: TObject);


  private
    FREPFichaAnimal : TFREPFichaAnimal;
    listaObjetos : array[1..19] of TObjeto;
    parametros : array of TRegistroParametros;

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
    procedure HabilitarComponentesVersionBasica; override;

//-----------------AGREGADOS----------------------------------------------------

    procedure CalcularPesoMaxYMin;
    procedure CalcularFrameMaxYMin;
    procedure RealizarConsultaDeAcuerdoAlCheck(tipodecheck : integer);
    procedure AutoAjustarColumnas;



    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREPHistoriaAnimal: TFREPHistoriaAnimal;
  consulta : AnsiString; // consulta generica
  animal : integer;
  val1Edad : integer;
  val2Edad : integer;
  val1Peso : double;
  val2peso : double;
  val1frame : integer;
  val2frame : integer;

  cartelCarga : TCartel;

implementation

uses
  UPrincipal, UREPHistorialAnimalPreview, UDMSoftvet, UMensajeHuella,
  UEveEliminarAnimal,  UTraduccion;

{$R *.dfm}

// ACCION PARA SALIR
procedure TFREPHistoriaAnimal.ACSalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close;
end;

// SOLO CONCATENA EL APELLIDO Y EL NOMBRE QUE LE RETORNA LA CONSULTA DE EVENTOS
procedure TFREPHistoriaAnimal.ACReportPrintExecute(Sender: TObject);
begin
  inherited;
end;

// en el create configuro todo el formulario
procedure TFREPHistoriaAnimal.FormCreate(Sender: TObject);
//var Rect: TRect;
var cartel: TCartel;
    msje: String;
    Msg: TMsg;
begin
  inherited;

//  cartel:= TCartel.getInstance();
//  msje:= '           Recuperando animales de la base de datos....';
//  cartel.abrircartel(msje);
  cartelCarga:= TCartel.getInstance();
  cartelCarga.abrirCartelProgressBar('Recuperando animales de la base de datos...');

  Application.ProcessMessages;


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

  consulta := 'select * from gen_animales(:establecimiento, ''today'', :con_evento)';
  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add('select * from gen_animales(:establecimiento, ''today'', :con_evento)');
  IBQAnimales.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;


  if (CBUltimoEvento.Checked) then
    IBQAnimales.ParamByName('con_evento').AsString := 'S' // por ahora luego va a ser desde el check para esto
  else
    IBQAnimales.ParamByName('con_evento').AsString := 'N'; // por ahora luego va a ser desde el check para esto

  cartelCarga.setCartelProgressBar('Datos recuperados. Armando listado de animales.',20);

  IBQAnimales.Prepare;

  IBQAnimales.Open;

//  cartel.cerrarcartel();
//  cartel.FreeInstance();

  Application.ProcessMessages;

  CargarLista;

  EAAniosDesde.OnChange:= EAAniosDesdeChange;
  EAAniosHasta.OnChange:= EAAniosDesdeChange;

  EAPesoDesde.OnChange:= EAPesoDesdeChange;
  EAPesoHasta.OnChange:= EAPesoDesdeChange;

  EAFrameDesde.OnChange:= EAFrameDesdeChange;
  EAFrameHasta.OnChange:= EAFrameDesdeChange;

  HabilitarComponentesVersionBasica();//para versión basico

  cartelCarga.setCartelProgressBar('Preparando filtros',20);

  Application.ProcessMessages;

end;

// dependiento el tipo de busqueda que desee, reconfiguro la consulta y controlo
// el acceso a los componentes correspondientes al tipo de busqueda
procedure TFREPHistoriaAnimal.RGBusquedaClick(Sender: TObject);
var cartel: TCartel;
    msje: String;
    Rect: TRect;
begin
//  cartel:= TCartel.getInstance();
//  msje:= 'Recuperando Animales ...';
//  cartel.abrircartel(msje);
  {Rect := BoundsRect;
  BusyStatus('Sistema ocupado, por favor espere...', @Rect);
  _Busy.Continue;}

  inherited;
  case RGBusqueda.ItemIndex of
    0 : begin
          EARP.Enabled := false;
          GBChecks.Enabled := false;
          GBComplejos.Enabled := false;
          limpiarChecks;
          habilitarLabel(false);
          IBQAnimales.Close;
          IBQAnimales.SQL.Clear;
          IBQAnimales.SQL.Add(consulta);
          IBQAnimales.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

          if (CBUltimoEvento.Checked) then
            IBQAnimales.ParamByName('con_evento').AsString := 'S' // por ahora luego va a ser desde el check para esto
          else
              IBQAnimales.ParamByName('con_evento').AsString := 'N'; // por ahora luego va a ser desde el check para esto

          IBQAnimales.Open;
          //showmessage(Inttostr(IBQAnimales.BlockReadSize));
          // IBQAnimales.UnPrepare;
        end;
{    1 : begin
          EARP.Enabled := true;
          GBChecks.Enabled := false;
          GBComplejos.Enabled := false;
          limpiarChecks;
          habilitarLabel(false);
          IBQAnimales.Close;
          IBQAnimales.SQL.Clear;
          IBQAnimales.SQL.Add(consulta+' where rp like :in || ''%''');
          IBQAnimales.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

          if (CBUltimoEvento.Checked) then
            IBQAnimales.ParamByName('con_evento').AsString := 'S' // por ahora luego va a ser desde el check para esto
          else
              IBQAnimales.ParamByName('con_evento').AsString := 'N'; // por ahora luego va a ser desde el check para esto

          IBQAnimales.ParamByName('in').AsString := '';

          IBQAnimales.Open;
          EARP.SetFocus;
        end;    }
    1 : begin
          //EARP.Enabled := false; saque esto
          EARP.Enabled := true;
          GBChecks.Enabled := true;
          GBComplejos.Enabled := true;
          habilitarLabel(true);
          IBQAnimales.Close;
          IBQAnimales.SQL.Clear;
          IBQAnimales.SQL.Add(consulta+' where rp like :in || ''%''');  //cambie esto
          IBQAnimales.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

          if (CBUltimoEvento.Checked) then
            IBQAnimales.ParamByName('con_evento').AsString := 'S' // por ahora luego va a ser desde el check para esto
          else
              IBQAnimales.ParamByName('con_evento').AsString := 'N'; // por ahora luego va a ser desde el check para esto

          //IBQAnimales.Open;
          IBQAnimales.ParamByName('in').AsString := '';//agregue esto
          GuardarParametros;
          AgregarAconsulta(listaObjetos[1].sentencia);

          CargarParametros;
          EARP.SetFocus;

        end;
  end;
//  cartel.cerrarcartel();
//  cartel.FreeInstance();

  //_Busy.Terminar;
end;

// actualizo la busqueda por rp cuando es busqueda individual
procedure TFREPHistoriaAnimal.EARPChange(Sender: TObject);
begin
   inherited;

   with ibqanimales do
   begin
     if not Locate('rp',EARP.Text,[loPartialKey]) then Beep;
     if(EARP.Text = '') then First;
   end;

end;

//pinto de gris lo animales inhactivos
procedure TFREPHistoriaAnimal.BDBGAnimalesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (IBQAnimales.FieldByName('activo').AsString = 'N') then
    begin
      BDBGAnimales.Canvas.Font.Color := clgray;
      BDBGAnimales.Canvas.TextOut( Rect.Left+2, Rect.Top+2, Column.Field.Text);
    end;
end;

//inicializo una estructura que es utilizada para guardar la sentencia que
//hay que agregar en el sql para activar el correspondiente filtro
procedure TFREPHistoriaAnimal.CargarLista;
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

// 17 -- Filtro por Origen de Animal
  listaObjetos[17].combo := DBLCBAOrigen;
  listaObjetos[17].sentencia := '(origen_animal = :origen)';

// 18 --Filtro para la Subcategoria del animal
  listaObjetos[18].combo := DBLCBASubcategoria;
  listaObjetos[18].sentencia := '(subcategoria = :subcategoria)';

// 19 --Filtro por remito
  listaObjetos[19].combo := nil;
  listaObjetos[19].sentencia := '(remito like :remito || ''%'')';

end;

// metodo generico para reconfigurar la consulta
procedure TFREPHistoriaAnimal.CheckClick(Sender: TObject);
var cartel: TCartel;
    msje: String;
    Rect: TRect;
begin
  inherited;

  cartel:= TCartel.getInstance();
  msje:= 'Recuperando animales. Este proceso puede tardar algunos segundos...';
  cartel.abrircartel(msje);
 // Rect := BoundsRect;
//  BusyStatus('Sistema ocupado, por favor espere...', @Rect);
//  _Busy.Continue;

  case TCheckBox(Sender).Tag of
    1, 2, 3 :
    begin
      // para los check que son solos
      checkSolos(TCheckBox(Sender));
    end;
    4, 5, 6, 7, 8, 9, 10, 11, 12,16,17,18 :
    begin
      // para los check que trabajan con combos (TERMINADO SUJETO A MODIFICACIONES)
      RealizarConsultaDeAcuerdoAlCheck(TCheckBox(Sender).Tag);
      checkCombos(TCheckBox(Sender));
    end;
    13, 14, 15, 19 :
    begin
      // para los check que habilitan los edits
      checkEdits(TCheckBox(Sender));
    end;
  end;

  cartel.cerrarcartel();
  cartel.FreeInstance();

  if (TCheckBox(Sender).Checked = true) then
    if (TCheckBox(Sender).Tag = 13) then
       EAAniosDesde.SetFocus
     else
      if (TCheckBox(Sender).Tag = 14) then
        EAPesoDesde.SetFocus
       else
        if (TCheckBox(Sender).Tag = 15) then
           EAFrameDesde.SetFocus
         else
           if (TCheckBox(Sender).Tag = 19) then
              EARemito.SetFocus;

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
       
end;

// manejos los checks con combo asociados
procedure TFREPHistoriaAnimal.checkCombos(check: TCheckBox);
begin
  if not(listaObjetos[check.Tag].combo.ListSource.DataSet.IsEmpty) then
    begin
      //listaObjetos[check.Tag].combo.Enabled := check.Checked;
      listaObjetos[check.Tag].combo.KeyValue := 1;
      if not check.Checked then
        listaObjetos[check.Tag].combo.OnMouseDown := DBLCBAMouseDown;
      // guardo el valor de los parametros porque cuando cambio la consulta lo pierdo
      GuardarParametros;
      if (check.Checked) then
        begin
          listaObjetos[check.Tag].combo.Enabled := true;
          AgregarAconsulta(listaObjetos[check.Tag].sentencia);
          ComboChange(listaObjetos[check.Tag].combo, true);
        end
      else
        begin
          SacarDeConsulta(listaObjetos[check.Tag].sentencia);
          ComboChange(listaObjetos[check.Tag].combo, false);
          listaObjetos[check.Tag].combo.KeyValue := -1;
          listaObjetos[check.Tag].combo.Enabled := false;
        end;
      CargarParametros;
    end
  else
    check.Checked := false;

//  ShowMessage(IBQAnimales.SQL.GetText); //si quiero ver como se va armando el sql HABILITO ESTA LINEA
end;

// manejos los checks con edit asociados
procedure TFREPHistoriaAnimal.checkEdits(check: TCheckBox);
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
                //ACA DEBO CALCULAR EL PESO
                CalcularPesoMaxYMin;
                EditChange(EAPesoDesde);
              end;
        15 :  begin // frame
                //ACA CALCULAR EL FRAME
                CalcularFrameMaxYMin;
                EditChange(EAFrameHasta);
              end;
        19 :  begin // remito
                EditChange(EARemito);
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
    19 :  begin // remito
            EARemito.Enabled := check.Checked;
          end;
  end;

//  CargarParametros;
end;

// manejos los checks que no tienen nada asociado
procedure TFREPHistoriaAnimal.checkSolos(check: TCheckBox);
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
procedure TFREPHistoriaAnimal.AgregarAconsulta(sentencia: AnsiString);
Var aux : ansiString;
begin
  if (AnsiPos(sentencia,IBQAnimales.SQL.GetText) = 0) then // no esta
    begin
      IBQAnimales.Close;
      if (AnsiPos('where',IBQAnimales.SQL.GetText) = 0) then // no tiene where
        begin
          aux := StringReplace(IBQAnimales.SQL.GetText,#$D#$A, '',[rfReplaceAll])+ ' where '+ sentencia;
          IBQAnimales.SQL.Clear;
          IBQAnimales.SQL.Add(aux);
        end
      else
        begin
          aux := StringReplace(IBQAnimales.SQL.GetText,#$D#$A, '',[rfReplaceAll])+' and '+sentencia;
          IBQAnimales.SQL.Clear;
          IBQAnimales.SQL.Add(aux);
        end;
      IBQAnimales.Open;
    end;
end;

// saca la sentencia que viene como parametro de la consulta de los animales
procedure TFREPHistoriaAnimal.SacarDeConsulta(sentencia: Ansistring);
begin
  if (AnsiPos(' and '+sentencia,IBQAnimales.SQL.GetText) = 0) then  // no esta con and
    begin
      if (AnsiPos(' where '+sentencia+' and ',IBQAnimales.SQL.GetText) <> 0) then // si esta con where /// PROBLEMA
        begin
          IBQAnimales.Close;
          IBQAnimales.SQL.Text:= StringReplace(IBQAnimales.SQL.GetText,sentencia+' and ', '',[rfReplaceAll]);
        end
      else
        if (AnsiPos(' where '+sentencia,IBQAnimales.SQL.GetText) <> 0) then // si esta con where
          begin
            IBQAnimales.Close;
            IBQAnimales.SQL.Text:= StringReplace(IBQAnimales.SQL.GetText,' where '+sentencia, '',[rfReplaceAll]);
          end
    end
  else
    begin  // saco stringreplace
      IBQAnimales.Close;
      IBQAnimales.SQL.Text:= StringReplace(IBQAnimales.SQL.GetText,' and '+sentencia, '',[rfReplaceAll]);
    end;
  IBQAnimales.Open;
end;

// evento que produce cambios en un combo
procedure TFREPHistoriaAnimal.ComboKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
//var cartel: TCartel;
//    msje: String;
begin
{  cartel:= TCartel.getInstance();
  msje:= 'Recuperando Animales ...';
  cartel.abrircartel(msje);
  inherited;
  ComboChange(TDBLookupComboBoxAuto(Sender), true);
  CargarParametros;
  cartel.cerrarcartel();
  cartel.FreeInstance();  }
  if not(TDBLookupComboBoxAuto(Sender).ListVisible) then
    ComboCloseUp(Sender);
end;

// lleno los parametros de la consulta que corresponden a combos
procedure TFREPHistoriaAnimal.ComboChange(Combo: TDBLookupComboBoxAuto; Poner : boolean);
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
      41 : begin
            if not(existeEnParametros('origen',aca)) then
               begin
                 pos := Length(parametros);
                 SetLength(parametros, pos +1);
               end
             else
               pos := aca;
             parametros[pos].nombre :='origen';
             if (poner) then
               parametros[pos].valor:= combo.KeyValue
             else
               parametros[pos].valor:= '-1';
           end;
      42 : begin
            if not (existeEnparametros('subcategoria',aca)) then
            begin
              pos := Length(parametros);
              SetLength(parametros,pos+1);
            end
            else
              pos := aca;
            parametros[pos].nombre := 'subcategoria';
            if (poner) then
              parametros[pos].valor := combo.KeyValue
            else
              parametros[pos].valor := '-1';
          end;
    end;
end;

// anulo la posibilidad de accionar una tecla dentro de un combo
procedure TFREPHistoriaAnimal.ComboKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key:=#0;
end;

// evento de cambio de un combo
procedure TFREPHistoriaAnimal.ComboCloseUp(Sender: TObject);
var cartel: TCartel;
    msje: String;
    Rect: TRect;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Recuperando animales. Este proceso puede tardar algunos segundos...';
  cartel.abrircartel(msje);
  {Rect := BoundsRect;
  BusyStatus('Sistema ocupado, por favor espere...', @Rect);
  _Busy.Continue;}

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
procedure TFREPHistoriaAnimal.GuardarParametros;
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
procedure TFREPHistoriaAnimal.CargarParametros;
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
  IBQAnimales.Open;
end;

// me fijo si existe el parametro al cual le asigno el valor
function TFREPHistoriaAnimal.existeEnParams(nombre: string): boolean;
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
function TFREPHistoriaAnimal.existeEnParametros(nombre: string; var aca: integer): boolean;
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
procedure TFREPHistoriaAnimal.EditChange(Sender: TObject);
var aca : integer;
    pos : integer;
    valor : integer;
    valor1: double;
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
              if not(existeEnParametros('valpeso1',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valpeso1';
              if (TryStrToFloat(EAPesoDesde.Text, valor1)) then
                parametros[pos].valor:= valor1
              else
                begin
                  MostrarMensaje(tmError, 'El peso "desde" no es válido');
                  EAPesoDesde.Text := FloatToStr(val1peso);
                end;

              if not(existeEnParametros('valpeso2',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='valpeso2';
              if (TryStrToFloat(EAPesoHasta.Text, valor1)) then
                parametros[pos].valor:= valor1
              else
                begin
                  MostrarMensaje(tmError, 'El peso "hasta" no es válido');
                  EAPesoHasta.Text := FloatToStr(val2peso);
                end;
            end;
    29, 30: begin  // los dos de frame
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
        31: begin  // remito
              if not(existeEnParametros('remito',aca)) then
                begin
                  pos := Length(parametros);
                  SetLength(parametros, pos +1);
                end
              else
                pos := aca;
              parametros[pos].nombre :='remito';
              parametros[pos].valor:= EARemito.Text;
            end;
  end;
  CargarParametros;
//  Change(Sender);
end;

procedure TFREPHistoriaAnimal.BorrarDeParametros(tag: integer);
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
procedure TFREPHistoriaAnimal.limpiarChecks;
begin
  CBAnimalesActivos.Checked := true;
  CBRechazados.Checked := false;
  //CBUltimoEvento.Checked := true;
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
  CBRemito.Checked := false;
end;

procedure TFREPHistoriaAnimal.habilitarLabel(cond: boolean);
begin
  CBAnimalesActivos.Enabled := cond;
  CBRechazados.Enabled := cond;
  CBUltimoEvento.Enabled := cond;
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
  CBOrigen.Enabled := cond;
  CBRemito.Enabled := cond;
  LDesde1.Enabled := cond;
  LDesde2.Enabled := cond;
  LDesde3.Enabled := cond;
  Lhasta1.Enabled := cond;
  Lhasta2.Enabled := cond;
  Lhasta3.Enabled := cond;
end;


procedure TFREPHistoriaAnimal.AVerFichaExecute(Sender: TObject);
var rpaux: String;
    cartel: TCartel;
    msje: String;

begin
  inherited;

  rpaux:= IBQAnimales.fieldByName('rp').AsString;

  FREPFichaAnimal := TFREPFichaAnimal.Create(self);
  FREPFichaAnimal.animal := IBQAnimales.fieldByName('animal').AsInteger;
  FREPFichaAnimal.IBQListadoAnimales := IBQAnimales;
  FREPFichaAnimal.ShowModal;
  FREPFichaAnimal.Destroy;

  rpaux:= IBQAnimales.fieldByName('rp').AsString;

  cartel := TCartel.getInstance;
//  cartel.abrircartel('           Cargando listado de animales...');
  cartel.abrircartel('    Actualizando listado de animales. Aguarde unos segundos.');    

  IBQAnimales.Close;
  IBQAnimales.Open;

  IBQAnimales.Locate('rp',rpaux,[loPartialKey]);

  cartel.cerrarcartel;
  cartel.FreeInstance;

//  self.Show;

end;

procedure TFREPHistoriaAnimal.Change(Sender: TObject);
var aux : integer;
    aux2: double;
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
           if (TryStrToFloat(TeditAuto(Sender).Text, aux2)) then
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
               TeditAuto(Sender).Text := FloatToStr(val1Peso);
               TeditAuto(Sender).SetFocus;
             end;
         end;
    28 : begin
           if (TryStrToFloat(TeditAuto(Sender).Text, aux2)) then
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
               TeditAuto(Sender).Text := FloatToStr(val2Peso);
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

procedure TFREPHistoriaAnimal.KeyPress(Sender: TObject; var Key: Char);
begin

  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;    
end;

procedure TFREPHistoriaAnimal.AImprimirListadoExecute(Sender: TObject);
begin
  showmessage('prueba');
  TPanel.Enabled := true;
  PListados.Visible := true;
  IRepIndividual.Enabled := FPrincipal.FuncActividad;
  LRepIndividual.Enabled := FPrincipal.FuncActividad;
  PListados.Top := 0;//(PBotones.Top + (PBotones.Height div 2)) - PListados.Height;

end;


procedure TFREPHistoriaAnimal.IBQAnimalesAfterOpen(DataSet: TDataSet);

begin
  inherited;
  BDBGAnimales.DataSource:= nil;
  IBQAnimales.Last;
  IBQAnimales.First;  
  // saque el thread porque daba error en un cliente y puse lo siguiente y comente terminarThread
  BDBGAnimales.DataSource:= DSAnimales;
  //LCantAnimales.Caption := IntToStr(IBQAnimales.RecordCount);
  GBSeleccionAnimal.Caption := Traducir(' Animales Seleccionados [')+IntToStr(IBQAnimales.RecordCount)+']';
  ACReportPrint.Enabled := not(IBQAnimales.IsEmpty);
  AVerFicha.Enabled := not(IBQAnimales.IsEmpty);
  AImprimirListado.Enabled := not(IBQAnimales.IsEmpty);
  AEliminarAnimal.Enabled := not(IBQAnimales.IsEmpty) and (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0);
  BBXls.Enabled:= not(IBQAnimales.IsEmpty);
end;

procedure TFREPHistoriaAnimal.BDBGAnimalesDblClick(Sender: TObject);
begin
  inherited;
  if(not (IBQAnimales.IsEmpty) )then
    AVerFichaExecute(Sender);
end;

procedure TFREPHistoriaAnimal.IBQAnimalesAfterClose(DataSet: TDataSet);
begin
  inherited;
  // le saco el order by
  IBQAnimales.SQL.Text:= StringReplace(IBQAnimales.SQL.GetText,' order by rp','',[rfReplaceAll]);
end;

procedure TFREPHistoriaAnimal.IBQAnimalesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // agrego el order by
  IBQAnimales.SQL.Add(' order by rp');
end;

procedure TFREPHistoriaAnimal.BBXlsClick(Sender: TObject);
var
  cartel : TCartel;
begin
  inherited;
  if SDXLS.Execute then
  begin
    cartel := TCartel.getInstance;
    cartel.abrircartel('Exportando datos a Excel...');
    DTXLS.SaveToFile(SDXLS.FileName);
    cartel.cerrarcartel;
    cartel.FreeInstance;
  end;
end;

procedure TFREPHistoriaAnimal.FormShow(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
   inherited;


//   cartel:= TCartel.getInstance();
//   msje:= '                      Armando listado de animales...';
//   cartel.abrircartel(msje);

   habilitarLabel(false);

   CBEstadoParicion.Enabled:= false;

   DMSoftvet.IBQRaza.Close;
   DMSoftvet.IBQRaza.Open;

//---------DESHABILITAR COMBO-------

    DBLCBASexo.Enabled := false;
    DBLCBARaza.Enabled := false;
    DBLCBACategoria.Enabled := false;
    DBLCBACondCorporal.Enabled := false;
    DBLCBACronoDentaria.Enabled := false;
    DBLCBAEstadoRepro.Enabled := false;
    DBLCBAGdr.Enabled := false;
    DBLCBARodeo.Enabled := false;
    DBLCBAPotrero.Enabled := false;
    DBLCBAEstadoParicion.Enabled := false;
    DBLCBAOrigen.Enabled := false;
    DBLCBASubcategoria.Enabled := false;

//----------------------------------

   DBLCBARaza.Refresh;

   cartelCarga.setCartelProgressBar('Datos requeridos disponibles para mostrar',20);

   RGBusqueda.ItemIndex := 1;

   Application.ProcessMessages;

   //RGBusquedaClick(RGBusqueda);

//   autoajustarcolumnas; Por performance no estaria bueno, pero si se soluciona lo de la consulta estaria.

//   cartel.cerrarcartel();
//   cartel.FreeInstance();

  cartelCarga.cerrarCartelProgressBar();
  cartelCarga.FreeInstance();

end;

procedure TFREPHistoriaAnimal.BDBGAnimalesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   BDBGAnimalesDblClick(Sender);
end;

procedure TFREPHistoriaAnimal.EAAniosDesdeChange(Sender: TObject);
begin
  inherited;
   if (EAAniosDesde.Text <> '') and (EAAniosHasta.Text <> '') then
     begin
       EditChange(Sender);
       Change(Sender);
     end;
end;

procedure TFREPHistoriaAnimal.EAPesoDesdeChange(Sender: TObject);
begin
  inherited;
   if (EAPesoDesde.Text <> '') and (EAPesoHasta.Text <> '') then
     begin
       EditChange(Sender);
       Change(Sender);
     end;
end;

procedure TFREPHistoriaAnimal.EAFrameDesdeChange(Sender: TObject);
begin
  inherited;
   if (EAFrameDesde.Text <> '') and (EAFrameHasta.Text <> '') then
     begin
       EditChange(Sender);
       Change(Sender);
     end;
end;

procedure TFREPHistoriaAnimal.EARPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key =#13) then
    begin
      EARPChange(nil);
      Key:= #0;      
    end;
end;

procedure TFREPHistoriaAnimal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IBQAnimales.Close;
  IBQAnimales.UnPrepare;
end;

procedure TFREPHistoriaAnimal.AEliminarAnimalExecute(Sender: TObject);
begin
  inherited;
  if (MostrarMensaje(tmConsulta, Traducir('Está seguro de eliminar el animal ')+ IBQAnimales.fieldbyname('RP').AsString+ '?') = mrYes)then
   begin
     AbrirEventoIndividual(TFEveEliminarAnimal.Create(self));
     IBQAnimales.Close;
     IBQAnimales.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

     if (CBUltimoEvento.Checked) then
       IBQAnimales.ParamByName('con_evento').AsString := 'S' // por ahora luego va a ser desde el check para esto
     else
         IBQAnimales.ParamByName('con_evento').AsString := 'N'; // por ahora luego va a ser desde el check para esto

     IBQAnimales.Open;
     FPrincipal.IBTPrincipal.CommitRetaining;
   end;

{  IBQSPRN.Close;
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPRN.ParamByName('animal').AsInteger := IBQAnimales.fieldbyname('ANIMAL').AsInteger;
  IBQSPRN.ParamByName('FECHA').AsDate := now();
  IBQSPRN.Open;
  if (IBQSPRN.FieldValues['Result'] = 'E') then
      MostrarMensaje(tmError, IBQSPRN.fieldbyname('MENSAJE').AsString)
   else
     begin
      if (MostrarMensaje(tmConsulta, 'Está seguro de eliminar el animal '+ IBQAnimales.fieldbyname('RP').AsString+ '?') = mrYes)then
       begin
        try
         IBSPEliminarAnimal.ParamByName('id_animal').AsInteger:= IBQAnimales.fieldbyname('ANIMAL').AsInteger;
         IBSPEliminarAnimal.ExecProc;
         IBQAnimales.Close;
         //IBQAnimales.SQL.Clear;
         //IBQAnimales.SQL.Add(consulta);
         IBQAnimales.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

         if (CBUltimoEvento.Checked) then
           IBQAnimales.ParamByName('con_evento').AsString := 'S' // por ahora luego va a ser desde el check para esto
         else
             IBQAnimales.ParamByName('con_evento').AsString := 'N'; // por ahora luego va a ser desde el check para esto

         IBQAnimales.Open;
         FPrincipal.IBTPrincipal.CommitRetaining;
        except
          MostrarMensaje(tmError, 'No se pudo eliminar el Animal '+ IBQAnimales.fieldbyname('RP').AsString+ '. Existen datos relacionados al Animal.')
       end;
      end;
     end;  }
end;

procedure TFREPHistoriaAnimal.AbrirEventoIndividual(Eve: TFEveSimple);
begin
  Eve.IDAnimal := IBQAnimales.fieldbyname('ANIMAL').AsInteger;
  Eve.IDRP := IBQAnimales.fieldbyname('RP').AsString;
  Eve.ConManga := false;
  Eve.ModoEve := meIndividual;
  Eve.ShowModal;
  Eve.Destroy;
end;

procedure TFREPHistoriaAnimal.BitBtn1Click(Sender: TObject);
var eve : TFEveEliminarAnimal;
begin
  inherited;
  eve:=TFEveEliminarAnimal.Create(self);

  Eve.Hide;
  Eve.ConManga := True;
  Eve.ModoEve  := meMasivo;
  Eve.ShowModal;
  Eve.Destroy;
end;

procedure TFREPHistoriaAnimal.BDBGAnimalesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
//var
//  pt: TGridcoord;
begin
  inherited;
{  pt:= BDBGAnimales.MouseCoord(x, y);

  if pt.y=0 then
    BDBGAnimales.Cursor:=crHandPoint
  else
    BDBGAnimales.Cursor:=crDefault;}
end;

procedure TFREPHistoriaAnimal.BDBGAnimalesTitleClick(Column: TColumn);
//{$J+}
// const PreviousColumnIndex : integer = -1;
//{$J-}
begin    //BDBGAnimales.SortFieldName:= Column.Field.FieldName + ' DESC';
{  if BDBGAnimales.DataSource.DataSet is TDataSet then
  with TDataSet(BDBGAnimales.DataSource.DataSet) do
  begin
    try
      BDBGAnimales.Columns[PreviousColumnIndex].title.Font.Style :=
      BDBGAnimales.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Filtered:= true;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];
    PreviousColumnIndex := Column.Index;

    if (Pos(Column.Field.FieldName, Filter) = 1)
    and (Pos(' DESC', Filter)= 0) then
      Filter := Column.Field.FieldName + ' DESC'
    else
      Filter := Column.Field.FieldName + ' ASC';

    Close;
    Open;
  end; }
end;

procedure TFREPHistoriaAnimal.ListadodeAnimales1Click(Sender: TObject);
var cont : integer;
    cartel: TCartel;
    msje: String;
    Rect: TRect;
    F : TFREPHistorialAnimalPreview;
begin
showmessage('prueba')      ;
  MostrarMensajeImpresion();
  cartel:= TCartel.getInstance();
  HabilitarDesabilitarControles();
  msje:= 'Generando vista previa del listado de animales ...';
  cartel.abrircartel(msje);
  {Rect := BoundsRect;
  BusyStatus('Sistema ocupado, por favor espere...', @Rect);
  _Busy.Continue;}

  inherited;

  self.Tag := 0;

//Application.CreateForm(TFREPHistorialAnimalPreview, FREPHistorialAnimalPreview);
//  F := TFREPHistorialAnimalPreview.Create(TMenuItem(Sender));
  if (Sender is TJvLabel) then
  begin
    if ((Sender as TJvLabel).Caption = 'Listado de animales') then
      self.Tag := 1
    else
      self.Tag := 2;
  end
  else
  begin
    if ((Sender as TImage).Name = 'IRepPedigree') then
      self.Tag := 1
    else
      self.Tag := 2;
  end;
                                           {//prueba decia self ahora 2 para ver solo  tere}
  F := TFREPHistorialAnimalPreview.Create(self);

  {if (( (Sender as TJvLabel).Caption = 'Listado de animales') or ( (Sender as TImage).Name = 'IRepPedigree' )) then
      F := TFREPHistorialAnimalPreview.Create(1)
  else
      if (( (Sender as TJvLabel).Caption = 'Listado de animales de Cabaña') or ( (Sender as TImage).Name = 'IRepIndividual' )) then
          F := TFREPHistorialAnimalPreview.Create(2);}

          

  F.IBQListadoAnimal.Close;
  F.IBQListadoAnimal.SQL.Clear;
  F.IBQListadoAnimal.SQL.Add(IBQAnimales.SQL.GetText);
  cont := 0;
  while (cont < IBQAnimales.Params.Count) do
    begin
      F.IBQListadoAnimal.ParamByName(IBQAnimales.Params.Items[cont].Name).Value := IBQAnimales.Params.Items[cont].Value;
      inc(cont);
    end;
  F.IBQListadoAnimal.Open;
  F.IBQListadoAnimal.Last;
  F.IBQListadoAnimal.First;

  cartel.cerrarcartel();
  cartel.FreeInstance();

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();
end;

procedure TFREPHistoriaAnimal.ListadodeAnimalesCab1Click(Sender: TObject);
begin
showmessage('prueba2');
  inherited;
  ListadodeAnimales1Click(Sender);
end;

procedure TFREPHistoriaAnimal.HabilitarComponentesVersionBasica;

begin
  inherited;    
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
  begin
    ListadodeAnimalesCab1.Enabled:= false;
  end;
end;

procedure TFREPHistoriaAnimal.CBRazaClick(Sender: TObject);
begin
  inherited;
  CheckClick(CBRaza);

  if not CBRaza.Checked then
  begin
    CBSubcategoria.Checked := false;
    CBSubcategoria.Enabled := false;
    DBLCBASubcategoria.Enabled := false;
    DBLCBARaza.Enabled := false;
  end;
//  DMSoftvet.IBQRaza.Close;
//  DMSoftvet.IBQRaza.Open;
end;

procedure TFREPHistoriaAnimal.DBLCBARazaCloseUp(Sender: TObject);
begin
  inherited;
// DE ACUERDO AL TESTEO SE NECESITA EL TIPO DE REGISTRO
//  if (DBLCBARaza.KeyValue <> null) and FPrincipal.FuncActividad then
  if ( DBLCBARaza.KeyValue <> null ) then
  begin
    DMSoftvet.IBQSubCategoriaRaza.Close;
    DMSoftvet.IBQSubCategoriaRaza.ParamByName('raza').AsInteger := DBLCBARaza.KeyValue;
    DMSoftvet.IBQSubCategoriaRaza.Open;

    if not(DMSoftvet.IBQSubCategoriaRaza.IsEmpty) then //agregado
    begin
      CBSubcategoria.Enabled := true;
      DBLCBASubcategoria.Enabled := true;
    end;

  end;

  ComboCloseUp(DBLCBARaza);
end;

procedure TFREPHistoriaAnimal.EARemitoChange(Sender: TObject);
begin
  inherited;
//   if (EARemito.Text <> '') then
//     begin
       EditChange(Sender);
     //  Change(Sender);
//     end;
end;

procedure TFREPHistoriaAnimal.DBLCBAMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  C : ^TCheckBox;
begin
  inherited;
  case (Sender as TDBLookupComboBoxAuto).Tag of
    16: C := @CBSexo;
    17: C := @CBRaza;
    42: C := @CBSubcategoria;
    18: C := @CBCategoria;
    21: C := @CBEstadoRepro;
    20: C := @CBCronoDentaria;
    19: C := @CBCondCorp;
    40: C := @CBEstadoParicion;
    22: C := @CBGdr;
    23: C := @CBRodeo;
    24: C := @CBPotrero;
    41: C := @CBOrigen;
   // 31: C := @CBCexo;
  end;
  if C^.Enabled then
  begin
    C^.Checked := true;
    //CheckClick(C^);
    (Sender as TDBLookupComboBoxAuto).OnCloseUp := ComboCloseUp;
    (Sender as TDBLookupComboBoxAuto).OnMouseDown := nil;
  end;
end;

procedure TFREPHistoriaAnimal.CalcularPesoMaxYMin;
begin
  // recupero el minimo peso de un animal
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''BGPESANI1'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  val1peso := IBQAux.fieldbyname('valor').AsFloat;
  EAPesoDesde.Text := FloatToStr(val1peso);

  // recupero el maximo peso de un animal
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''BGPESANI4'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  val2peso := IBQAux.fieldbyname('valor').AsFloat;
  EAPesoHasta.Text := FloatToStr(val2peso);

end;

procedure TFREPHistoriaAnimal.CalcularFrameMaxYMin;
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

procedure TFREPHistoriaAnimal.RealizarConsultaDeAcuerdoAlCheck(tipodecheck : integer);
begin

  case tipodecheck of
    1://Buscar animales activos
    begin
    end;
    2://Buscar animales rechazados
    begin
    end;
    3://Ultimo evento animal
    begin
    end;
    4://Sexo
    begin
    end;
    5://Raza
    begin
    end;
    6://Categoria
    begin
    end;
    7://Condicion corporal
    begin
    end;
    8://Cronologia dentaria
    begin
    end;
    9://Estado reproductivo
    begin
    end;
    10://GDR
    begin
    end;
    11://Rodeo
    begin
        DMSoftvet.IBQRodeo.Close;
        DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        DMSoftvet.IBQRodeo.Open;
    end;
    12://Potrero
    begin
        DMSoftvet.IBQPotrero.Close;
        DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
        DMSoftvet.IBQPotrero.Open;
    end;
    13://Años
    begin
    end;
    14://Peso
    begin
    end;
    15://Frame
    begin
    end;
    16://Cantidad de partos
    begin
        DMSoftvet.IBQEstadoParicion.Close;
        DMSoftvet.IBQEstadoParicion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        DMSoftvet.IBQEstadoParicion.Open;
    end;
    17://Origen
    begin
        DMSoftvet.IBQCodOrigen.Close;
        DMSoftvet.IBQCodOrigen.Open;
    end;
    18://Tipo de registro
    begin
    end;
  end;

end;



procedure TFREPHistoriaAnimal.TPanelTimer(Sender: TObject);
begin
  inherited;
  TPanel.Enabled := false;
//  JvCPHint.Visible := false;
  PListados.Visible := false;

end;


procedure TFREPHistoriaAnimal.FormClick(Sender: TObject);
begin
  inherited;
  PListados.Visible := false;
end;

procedure TFREPHistoriaAnimal.AutoAjustarColumnas;
var
   ind_col, LONG_MAX, LONG_COL, LONG_TITLE: integer;
begin

       for ind_col := 0 to BDBGAnimales.Columns.Count - 1 do
       begin
           LONG_MAX := 0;
           BDBGAnimales.DataSource.DataSet.First;
           while not BDBGAnimales.DataSource.DataSet.Eof do
           begin
                 LONG_COL := length(BDBGAnimales.Columns[ind_col].Field.AsString);

                 if (LONG_COL > LONG_MAX) then
                      LONG_MAX := LONG_COL;

                 BDBGAnimales.DataSource.DataSet.Next;
           end;

           LONG_TITLE := length(BDBGAnimales.Columns[ind_col].Title.Caption);

           if (LONG_MAX >= LONG_TITLE) then
               BDBGAnimales.Columns[ind_col].Width := (7*LONG_MAX)+5
           else
               BDBGAnimales.Columns[ind_col].Width := (8*LONG_TITLE)+6;

       end;
end;


end.



