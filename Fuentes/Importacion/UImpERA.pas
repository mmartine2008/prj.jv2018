unit UImpERA;

interface
                                                                                            
{
  Modulo de Importacion Evaluaciones Geneticas

  Desarrollador Original  : Gabriel Dominguez

  Modificaciones :
  Oct 2013 (J.DAmato):
    - Se añaden columnas con datos para importacion
    - Correcciones cuando las fechas se encuentra con mal formato
    - Importacion de DEPs (habia un error en la conversion a punto flotante)
    - Se añade la columna Establecimiento. El sistema luego de cargarlos, mueve los animales a los distintos establecimientos

  Ene 2014 (J.DAmato)
    - Se modifica el metodo "BuscarAnimales". Solo consideraba los RP para las busquedas
    - Se eliminan los AnimalesExternos y Semen repetidos (se busca a ver si existen antes de insertarlos)
    - Se unifican las formas que se consideran los animales de acuerdo al tipo de servicio
    - Se añade la Raza en la carga de Datos
    - Correcion del DEP Frame . Estaba tomando la altura

}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, DB, IBDatabase, Grids, DBGrids, StdCtrls, ComCtrls,
  IBQuery, WinXP, DataExport, DataToXLS, IBCustomDataSet, IBStoredProc,
  ActnList, ExtCtrls, DateUtils, ADODB, Dbf, VKDBFDataSet, DBTables,
  UBDBGrid, Types, EditAuto, StrUtils, JvExControls, JvLabel, JvGIF,
  PngImage, jpeg, ImgList, PngImageList, JvExExtCtrls, JvImage, ComObj,
  JvGradient;

  const
     FECHA_NACIMIENTO_DEFECTO = '01/01/1990';

  type
  TRecDatos = record
    Raza : String;
    RP : Variant;
    TR : Variant;
    Asoc : Variant;
    nombre_Cria : variant;
    hba_cria : Variant;
    fnac_cria : Variant;
    sexo_cria : Variant;
    color_cria : Variant;
    dlg, plg : Variant;
    peso_nac : Variant;
    dn, pn : Variant;
    dm, pm : Variant;
    fecha_dest, peso_dest : Variant;
    dd, pd : Variant;
    crias : Variant;
    fecha_anio, peso_anio : Variant;
    fecha_18, peso_18 : Variant;
    df, pf : Variant;        
    fecha_ce, ce : Variant;
    dc, pc : Variant;
    fecha_alzada, alzada, frame : Variant;
    dal, pal : Variant;
    peso_ecog, fecha_ecog, aob : Variant;
    daob, paob : Variant;
    espesor_gr, dgd, pgd : Variant;
    grasa_intr, dgi, pgi : Variant;
    grasa_cade, dgc, pgc : Variant;
    pcma, dpcm, ppcm : Variant;
    pelado : Variant;
    tipo_serv, fserv : Variant;
    tip_sang : Variant;
    rp_md, hba_md, raza_md, color_md, fnac_md ,apodo_md: Variant;
    rp_pd, apodo_pd, hba_pd, raza_pd, color_pd, anac_pd : Variant;
    rp_rec, fnac_rec, raza_rec : Variant;

    otro_cria, otro_md, otro_pd : Variant;
    // Codigo de Manejo
    m0, m1, m2, m3, m4 : Variant;
    establecimiento : integer;
    // ID de Animal
    ID_ANIMAL : integer;
    nombre_md: Variant;
  end;

  TArrAnimales = Array of TRecDatos;

  TFImpERA = class(TFUniversal)
    PTop: TPanel;
    PClient: TPanel;
    DBGAngus: TDBGrid;
    Panel1: TPanel;
    IBQExisteAnimal: TIBQuery;
    IBQPeso: TIBQuery;
    IBQCE: TIBQuery;
    IBQFrame: TIBQuery;
    IBQCalidadCarne: TIBQuery;
    IBQDEPs: TIBQuery;
    IBQAltaDirecta: TIBQuery;
    IBQGenId: TIBQuery;
    ODAngus: TOpenDialog;
    DSTabla: TDataSource;
    PCDatos: TPageControl;
    TSERA: TTabSheet;
    TSInconsistencia: TTabSheet;
    DBGERA: TDBGrid;
    BDBGInconsistencia: TBitDBGrid;
    IBQVerificacion: TIBQuery;
    IBQActAux: TIBQuery;
    IBQInsertAux: TIBQuery;
    IBQAnimalesNuevos: TIBQuery;
    IBDSErrores: TIBDataSet;
    IBDSErroresID_ANIMAL: TIntegerField;
    IBDSErroresRP: TIBStringField;
    IBDSErroresACT_RP: TIntegerField;
    IBDSErroresHBA: TIBStringField;
    IBDSErroresATC_HBA: TIntegerField;
    IBDSErroresFECHA_NAC: TDateField;
    IBDSErroresACT_FECHA_NAC: TIntegerField;
    IBDSErroresPESO_N: TFloatField;
    IBDSErroresACT_PESO_N: TIntegerField;
    IBDSErroresFECHA_PESO_N: TDateField;
    IBDSErroresACT_FECHA_PESO_N: TIntegerField;
    IBDSErroresPESO_D: TFloatField;
    IBDSErroresACT_PESO_D: TIntegerField;
    IBDSErroresFECHA_PESO_D: TDateField;
    IBDSErroresACT_FECHA_PESO_D: TIntegerField;
    IBDSErroresPESO_A: TFloatField;                                                     
    IBDSErroresACT_PESO_A: TIntegerField;
    IBDSErroresFECHA_PESO_A: TDateField;
    IBDSErroresACT_FECHA_PESO_A: TIntegerField;
    IBDSErroresPESO_18: TFloatField;
    IBDSErroresACT_PESO_18: TIntegerField;
    IBDSErroresFECHA_PESO_18: TDateField;
    IBDSErroresACT_FECHA_PESO_18: TIntegerField;
    IBDSErroresCE: TFloatField;
    IBDSErroresACT_CE: TIntegerField;
    IBDSErroresFECHA_CE: TDateField;
    IBDSErroresACT_FECHA_CE: TIntegerField;
    IBDSErroresFRAME: TFloatField;
    IBDSErroresACT_FRAME: TIntegerField;
    IBDSErroresALTURA: TFloatField;
    IBDSErroresACT_ALTURA: TIntegerField;
    IBDSErroresFECHA_ALTURA: TDateField;
    IBDSErroresACT_FECHA_ALTURA: TIntegerField;
    IBDSErroresGESTDEP: TIBBCDField;
    IBDSErroresACT_GESTDEP: TIntegerField;
    IBDSErroresNACERDEP: TIBBCDField;
    IBDSErroresACT_NACERDEP: TIntegerField;
    IBDSErroresDESTDEP: TIBBCDField;
    IBDSErroresACT_DESTDEP: TIntegerField;
    IBDSErroresLECHEDEP: TIBBCDField;
    IBDSErroresACT_LECHEDEP: TIntegerField;
    IBDSErroresFINALDEP: TIBBCDField;
    IBDSErroresACT_FINALDEP: TIntegerField;
    IBDSErroresCEDEP: TIBBCDField;
    IBDSErroresACT_CEDEP: TIntegerField;
    IBDSErroresALTURADEP: TIBBCDField;
    IBDSErroresACT_ALTURADEP: TIntegerField;
    IBDSErroresEGDDEP: TIBBCDField;
    IBDSErroresACT_EGDDEP: TIntegerField;
    IBDSErroresEGCDEP: TIBBCDField;
    IBDSErroresACT_EGCDEP: TIntegerField;
    IBDSErroresAOBDEP: TIBBCDField;
    IBDSErroresACT_AOBDEP: TIntegerField;
    IBDSErroresPORGIDEP: TIBBCDField;
    IBDSErroresACT_PORGIDEP: TIntegerField;
    IBDSErroresPORCMDEP: TIBBCDField;
    IBDSErroresACT_PORCMDEP: TIntegerField;
    IBDSErroresGESTPREC: TIBBCDField;
    IBDSErroresACT_GESTPREC: TIntegerField;
    IBDSErroresNACERPREC: TIBBCDField;
    IBDSErroresACT_NACERPREC: TIntegerField;
    IBDSErroresDESTPREC: TIBBCDField;
    IBDSErroresACT_DESTPREC: TIntegerField;
    IBDSErroresLECHEPREC: TIBBCDField;
    IBDSErroresACT_LECHEPREC: TIntegerField;
    IBDSErroresFINALPREC: TIBBCDField;
    IBDSErroresACT_FINALPREC: TIntegerField;
    IBDSErroresCEPREC: TIBBCDField;
    IBDSErroresACT_CEPREC: TIntegerField;
    IBDSErroresALTURAPREC: TIBBCDField;
    IBDSErroresACT_ALTURAPREC: TIntegerField;
    IBDSErroresEGDPREC: TIBBCDField;
    IBDSErroresACT_EGDPREC: TIntegerField;
    IBDSErroresEGCPREC: TIBBCDField;
    IBDSErroresACT_EGCPREC: TIntegerField;
    IBDSErroresAOBPREC: TIBBCDField;
    IBDSErroresACT_AOBPREC: TIntegerField;
    IBDSErroresPORGIPREC: TIBBCDField;
    IBDSErroresACT_PORGIPREC: TIntegerField;
    IBDSErroresPORCMPREC: TIBBCDField;
    IBDSErroresACT_PORCMPREC: TIntegerField;
    IBDSErroresCRIAS: TIntegerField;
    IBDSErroresACT_CRIAS: TIntegerField;
    DSErrores: TDataSource;
    IBQActPeso: TIBQuery;
    IBQActCE: TIBQuery;
    IBQActFrame: TIBQuery;
    IBDSErroresFECHA_PESO_ECOG: TDateField;
    IBDSErroresPESO_ECOG: TFloatField;
    IBDSErroresAOB: TIBBCDField;
    IBDSErroresEG: TIBBCDField;
    IBDSErroresGI: TIBBCDField;
    IBDSErroresGC: TIBBCDField;
    IBDSErroresPCMA: TIBBCDField;
    IBDSErroresPELADO: TIBStringField;
    IBQActCalidadCarne: TIBQuery;
    IBQActDEPs: TIBQuery;
    IBDSErroresCOLOR: TIBStringField;
    Label6: TLabel;
    Label7: TLabel;
    IBQActTipificSanguinea: TIBQuery;
    IBSPServicioNatural: TIBStoredProc;
    IBSPIngresoServicio: TIBStoredProc;
    IBDSErroresTIPIFIC_SANGUINEA: TIBStringField;
    IBQActADN: TIBQuery;
    IBDSErroresFECHA_SERVICIO: TDateField;
    IBDSErroresTIPO_SERVICIO: TIBStringField;
    IBSPTransferenciaEmbrionaria: TIBStoredProc;
    IBSPAltaDirectaAnimal: TIBStoredProc;
    IBDSErroresRP_PADRE: TIBStringField;
    IBDSErroresRP_MADRE: TIBStringField;
    IBDSErroresFENAC_MADRE: TDateField;
    IBDSErroresCOLOR_PADRE: TIBStringField;
    IBDSErroresHBA_PADRE: TIBStringField;
    IBDSErroresANIO_NAC_PADRE: TIBStringField;
    IBDSErroresRP_RECEP: TIBStringField;
    IBDSErroresFENAC_RECEP: TDateField;
    IBDSErroresRAZA_RECEP: TIBStringField;
    IBDSErroresRAZA_PADRE: TIBStringField;
    IBQInsertAnimalesExternos: TIBQuery;
    IBQBuscarCodigoRaza: TIBQuery;
    IBQGenExterno: TIBQuery;
    IBQInsertEmbrion: TIBQuery;
    IBQGenIdEmbrion: TIBQuery;
    IBQGenIdAnimal: TIBQuery;
    IBQCalcularSubCatego: TIBQuery;
    IBDSErroresHBA_MADRE: TIBStringField;
    IBDSErroresCOLOR_MADRE: TIBStringField;
    IBDSErroresRAZA_MADRE: TIBStringField;
    IBSPInseminacion: TIBStoredProc;
    IBSPMovimientoDeSemen: TIBStoredProc;
    IBSPTabSemen: TIBStoredProc;
    IBQGenIdSemen: TIBQuery;
    IBQTabSemen: TIBQuery;
    IBQServicioNatural: TIBQuery;
    IBQGenIdServicio: TIBQuery;
    IBSPCreacionEvento: TIBStoredProc;
    IBQExisteAnimalExterno: TIBQuery;
    PBotones: TPanel;
    ISalir: TImage;
    LSalir: TLabel;
    IEra1: TImage;
    LEra1: TLabel;
    IEra2: TImage;
    LEra2: TLabel;
    GBBaseERA: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LAbrirERA: TLabel;
    LCant: TLabel;
    LCantNuevos: TLabel;
    IEra: TImage;
    BAbrirERA: TButton;
    GBDatosImp: TGroupBox;
    LEstado: TLabel;
    LCalidadCarne: TLabel;
    LCantPesoN: TLabel;
    LPesoDest: TLabel;
    LPesoAnio: TLabel;
    LPesoAdulto: TLabel;
    LMedicionF: TLabel;
    LDEPs: TLabel;
    LCE: TLabel;
    LTipificSang: TLabel;
    LServicios: TLabel;
    Label5: TLabel;
    IImportar: TImage;
    LImportar: TLabel;
    CBPesoT: TCheckBox;
    CBPesoA: TCheckBox;
    CBPesoD: TCheckBox;
    CBPesoN: TCheckBox;
    CBCE: TCheckBox;
    CBMedicionF: TCheckBox;
    CBCalidadCarne: TCheckBox;
    BImportar: TButton;
    BCargar: TButton;
    CBDEPs: TCheckBox;
    EAAnio: TEditAuto;
    PBAvance: TProgressBar;
    BSalir: TButton;
    CBTipificSanguinea: TCheckBox;
    CBServicios: TCheckBox;
    CBADN: TCheckBox;
    PFinal: TPanel;
    LFinal: TLabel;
    IBQActRPSRA: TIBQuery;
    IBQBuscarAnimalInt: TIBQuery;
    IBSPActPadres: TIBStoredProc;
    Label2: TLabel;
    Label8: TLabel;
    IBQBuscarAnimalExt: TIBQuery;
    lbProgreso: TLabel;
    IBQActualizarNombres: TIBQuery;
    IBQActTRs: TIBQuery;
    IBQCalcularCategorias: TIBQuery;
    IBActualizarDatosAnimalesExternos: TIBQuery;
    IBQActualizarUbicacion: TIBQuery;
    IBQActualizarInstalaciones: TIBQuery;
    IBQAltaNacimientos: TIBQuery;
    cbActualizarEstablecimiento: TCheckBox;
    cbDatosAnimal: TCheckBox;
    JvGradient1: TJvGradient;
    IBQCrearGrupo: TIBQuery;
    IBQActualizarReceptora: TIBQuery;
    IBQCheckExt: TIBQuery;
    IBQExiste: TIBQuery;
    IBSPFlushing: TIBStoredProc;
    procedure BAbrirERAClick(Sender: TObject);
    procedure BImportarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EAAnioExit(Sender: TObject);
    procedure BDBGInconsistenciaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BDBGInconsistenciaCellClick(Column: TColumn);
    procedure BCargarClick(Sender: TObject);
    procedure CBDEPsClick(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure VKDBFFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure EAAnioChange(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure LSalirClick(Sender: TObject);
    procedure IEra2Click(Sender: TObject);
  protected
    Animales : TArrAnimales;
    Abrio : Boolean;
    RPGral : String;
    Coneccion : String;
    CantFila : Integer;
    PesoN, PesoD, PesoA, PesoT, CE, MF, CC, DEPs, CantNuevos, Anio, Tipificacion, Servicios : Integer;
    function Sirve(Valor : Variant) : Boolean;
    function SirveDEP(Valor : Variant) : Boolean;
    function BuscarAnimal(RP, HBA, FechaN, Sexo, Color,Raza: Variant) : Integer;   //Devuelve el id del animal
    function ExisteAnimal(RP, HBA, FechaN, Sexo, Color,Raza : Variant) : Boolean;

    function buscarSemen(idAnimal : integer; tipoA : string):integer;
//----------------------------------------------------------------------------------------------------------------------

    procedure CargarTipificacionSanguinea(IdAnimal : Integer; Valor : Variant);

    procedure CargarADN(IdAnimal : Integer; Valor : string);

    procedure CargarServicioNatural(fechaServ : string; id_padre, id_madre, grupoSN : integer);

    function CargarServicioParaInseminacion(fecha : string) : integer; //Devuelve el ID_servicio

    function CargarSemen(fecha : string; idAnimal : integer; tipo_p : string): integer; //Devuleve el ID de semen

    procedure CargarInseminacionArtificial(fechaServ: string; id_animal, id_servicio, id_semen, grupoIA  : integer);

    procedure CargarServicioTranferenciaEmbrionaria(fecha : string; IDmadre, IDpadre, IDreceptora, grupoTE : integer; tipo_m: string);

    procedure CargarParametrosSP(fecha : string; id, animal, grupoTE : integer);

    function CargarMadreExterna(rpMadre, razaMadre, fenacMadre, colorMadre, hbamadre,nombre_md,apodo_md : string): integer;

    function CargarReceptora(fecha, rpMadreRecep, razaRecep, fecNacRecep : string): integer;

    function CalcularFechaNacMadreReceptora(fecha : string): string;

    function CargarPadreExterno(rpPadre, hbaPadre, razaPadre, anioNacPadre, colorPadre, nombrePadre : string) : integer;

    function CargarAnimalInterno(rpAnimal, razaAnimal, fecNacAnimal, hbaAnimal, colorAnimal, TR,nombre,apodoMD ,sexo: string): integer;

    procedure ActualizarPadres(madre, padre, animal : Variant; tipo_p, tipo_m : String; id_recep: Variant);

    function BuscarPadre(rp_padre , hba_padre,fnac,tipoServ: String; var Tipo : String) : Integer;
    function BuscarMadre(rp_madre , hba_madre,fnac,tipoServ: String; var Tipo : String) : Integer;
    function BuscarAnimalIE(rp , hba,fnac, sexo,tipoServ,ancestro: String; var Tipo : String) : Integer;

    procedure actualizarNombres();
    procedure actualizarTR();
    procedure actualizarCategorias();
    procedure actualizarUbicacionAnimales();
    procedure generarEventosNacimiento();

    function isValidDate( s : string ) :boolean;  overload;
    function isValidDate( v : variant ) :boolean; overload;

    function getEstablecimiento( rp : string) : integer;

//----------------------------------------------------------------------------------------------------------------------

    procedure CargarPesos(IdAnimal : Integer; Nuevo, ModifFecha, ModifPeso : Integer; Fecha, Valor : Variant; Dias : String);
    procedure CargarCE(IdAnimal : Integer; Nuevo, ModifFecha, ModifValor: Integer; Fecha, Valor : Variant);
    procedure CargarFrame(IdAnimal : Integer; Nuevo, ModifFecha, ModifAltura, ModifFrame : Integer; FechaNac, Fecha, Altura, Frame : Variant);
    procedure CargarCalidadCarne(IdAnimal : Integer; Fecha, Peso, AOB, EG, GI, GC, PCMA, Pelado : Variant);
    procedure CargarDEPs(Anio, IdAnimal : Integer; GESTDEP,NACERDEP,DESTDEP,LECHEDEP,FINALDEP,CEDEP,ALTURADEP,EGDDEP,EGCDEP,AOBDEP,PORGIDEP,PORCMDEP,
              GESTPREC,NACERPREC,DESTPREC,LECHEPREC,FINALPREC,CEPREC,ALTURAPREC,EGDPREC,EGCPREC,AOBPREC,PORGIPREC,PORCMPREC,Crias,Color : Variant);


    procedure GuardarInfoArchivo();
    function FormatoDEP(Valor : String; var inf : String) : Variant;
    function VerificarPeso(RP : String; IdAnimal : Integer; FechaN, Fecha, Valor : Variant; Dias : String) : Integer;
    function VerificarCE(RP : String; IdAnimal : Integer; FechaN, Fecha, Valor : Variant) : Integer;
    function VerificarFrame(RP : String; IdAnimal : Integer; FechaN, Fecha, FechaNac, Altura, Frame : Variant) : Integer;
    function VerificarCalidadCarne(RP : String; IdAnimal : Integer; FechaN, Fecha, Peso, AOB, EG, GI, GC, PCMA, Pelado : Variant) : Integer;
    function VerificarDEP(Anio, ID : Integer; DEP : String; Valor : Variant) : Integer;
    function VerificarDEPs(RP : String; Anio, IdAnimal : Integer; GESTDEP,NACERDEP,DESTDEP,LECHEDEP,FINALDEP,CEDEP,ALTURADEP,EGDDEP,EGCDEP,AOBDEP,PORGIDEP,PORCMDEP,
              GESTPREC,NACERPREC,DESTPREC,LECHEPREC,FINALPREC,CEPREC,ALTURAPREC,EGDPREC,EGCPREC,AOBPREC,PORGIPREC,PORCMPREC,Crias : Variant) : Integer;

    function VerificarNuevosDEPs(RP : String; Anio, IdAnimal : Integer; GESTDEP,NACERDEP,DESTDEP,LECHEDEP,FINALDEP,CEDEP,ALTURADEP,EGDDEP,EGCDEP,AOBDEP,PORGIDEP,PORCMDEP,
              GESTPREC,NACERPREC,DESTPREC,LECHEPREC,FINALPREC,CEPREC,ALTURAPREC,EGDPREC,EGCPREC,AOBPREC,PORGIPREC,PORCMPREC,Crias : Variant) : Integer;

    procedure AgregarAnimal(IdAnimal, I : Integer);
    procedure CambiarValorColumna(Column: TColumn);
    function VerificarDatos() : Boolean;
    procedure CargarDatos();
    procedure HabilitarCarga;
    function CargarAnimales(p : OleVariant) : boolean;
  public
    { Public declarations }
  end;

var
  FImpERA: TFImpERA;
  cant_m, cant_p : Integer;
  pag: OleVariant;

implementation

{$R *.dfm}

uses
  UPrincipal, UMensajeNuevosERA, UMensajeHuella, UCartel, UTraduccion, UImpEra1, Math;

procedure TFImpERA.BAbrirERAClick(Sender: TObject);
var
  xls,xlw: OleVariant;
begin
  Abrio := false;
 // SBUniversal.Panels[0].Text := '';
{ DEPRECATED
  VKDBF.Active := false;
}
  if ODAngus.Execute then
  begin
    {try
      VKDBF.DBFFileName := ODAngus.FileName;
      VKDBF.Active := true;
      //SBUniversal.Panels[0].Text := 'Base de datos de ERA: '+ODAngus.FileName;
      Abrio := true;
      IEra1.Visible := false;
      LEra1.Visible := false;
      IEra2.Visible := false;
      LEra2.Visible := false;
      GBBaseERA.Visible := true;
      GBDatosImp.Visible := true;
      Label1.Visible := true;
      Label3.Visible := true;
      Label4.Visible := true;
      LCant.Visible := true;
      LCantNuevos.Visible := true;

    except
      ShowMessage('No es una base de datos de ERA compatible');
    end;  }
    try
      xls := CreateOleObject('Excel.Application');
      lbProgreso.visible := true;
      lbProgreso.Caption := 'Abriendo archivo XLS ';

      xlw := xls.WorkBooks.Open(FileName := ODAngus.FileName);
      pag:=xlw.Sheets[1];

      lbProgreso.Caption := 'Cargando animales ';
      if ( CargarAnimales(pag) ) then
      begin
        Abrio := true;
        IEra1.Visible := false;
        LEra1.Visible := false;
        IEra2.Visible := false;
        LEra2.Visible := false;
        GBBaseERA.Visible := true;
        GBDatosImp.Visible := true;
        Label1.Visible := true;
        Label3.Visible := true;
        Label4.Visible := true;
        LCant.Visible := true;
        LCantNuevos.Visible := true;

        HabilitarCarga;
      end;

    finally
      xls.WorkBooks.Close;
      xlw := UnAssigned;
      if not VarIsEmpty(xls) then
      begin
        OleVariant(xls).DisplayAlerts := False;
        OleVariant(xls).Quit;
      end;
        OleVariant(xls) := UnAssigned;
    end;
  end;
end;

procedure tryStrToFloatTwice(s : string ; var f : Double)  ;
var   decsep ,s2 : string;
begin
  f := 0;
  // Si esta vacio, retorna 0
  if (s = '') or (s = '0') then exit;
  decsep := DecimalSeparator;
  TryStrToFloat(s, f);
  // Si no esta vacio, retorna ese contenido
  if ( f <>0) then exit;
  s2 := AnsiReplaceStr(  s, ',', '.');
  // Pruebo cambiando las comas por puntos
  TryStrToFloat(s2, f);
  if ( f <>0) then exit;
  // Pruebo cambiando los puntos por comas
  s2 := AnsiReplaceStr(  s, '.', ',');
  TryStrToFloat(s2, f);
end;

function TFImpERA.CargarAnimales(p : OleVariant) : boolean;
var
  I, Ind, counter,columns : Integer;
  int : Integer;
  dou : Double;
  dat : TDateTime;
  s : string;
  stList : TStringList;
  errorCounter : integer;

begin
  I := 3;
  Ind := 0;
  CantFila := 0;
  result := true;
  lbProgreso.Visible := true;
  counter := 0;
  stList := TStringList.create();
  stList.Add('RP;ERROR CODE; RP_MADRE; FSERV' );
  errorCounter := 0;

  // Cuento cuantas filas hay ocupadas. Alguna de las 3 primeras columnas tiene q tener datos
  while (p.cells[I,1].Text <> '') or (p.cells[I,2].Text <> '') or (p.cells[I,3].Text <> '')do
  begin
   inc(counter);
   inc(I);
  end;


  SetLength(Animales,counter);
  I := 3;

  while (p.cells[I,1].Text <> '') or (p.cells[I,2].Text <> '') or (p.cells[I,3].Text <> '')do
  begin
    lbProgreso.Caption := 'Cargando '+intToStr(I-3)+ ' de '+ intToStr(counter);

    Animales[Ind].Raza := p.cells[I,1].Text;

    s := Copy(uppercase( p.cells[I,2].Text ) ,1, 10);
    Animales[Ind].RP := s;    inc(columns);
    Animales[Ind].TR := p.cells[I,3].Text;
//    Animales[Ind].Asoc := p.cells[I,3].Text;
    Animales[Ind].nombre_Cria := p.cells[I,4].Text;

    s := Copy(uppercase( p.cells[I,5].Text ) ,1, 10);
    Animales[Ind].hba_cria := s ;
    dat := 0;
    s :=  p.cells[I,6].Text;
    TryStrToDate(s,dat);
    if (dat = 0) then
      TryStrToDate(FECHA_NACIMIENTO_DEFECTO,dat);
    Animales[Ind].fnac_cria := dat;
    int := 0;
    TryStrToInt(p.cells[I,7].Text,int);
    // Si es vacio, por defecto toma 1
    if (int = 0) then
       Animales[Ind].sexo_cria := 1
    else
      Animales[Ind].sexo_cria := int;
    Animales[Ind].color_cria := uppercase( p.cells[I,8].Text);
    dou := 0;
    tryStrToFloatTwice(p.cells[I,9].Text,dou);
    Animales[Ind].dlg := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,10].Text,dou);
    Animales[Ind].plg := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,11].Text,dou);
    Animales[Ind].peso_nac := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,12].Text,dou);
    Animales[Ind].dn := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,13].Text,dou);
    Animales[Ind].pn := dou;
    dou := 0;
    dat := 0;
    TryStrToDate(p.cells[I,14].Text,dat);
    if (dat = 0) then
      TryStrToDate(FECHA_NACIMIENTO_DEFECTO,dat);

    Animales[Ind].fecha_dest := dat;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,15].Text,dou);
    Animales[Ind].peso_dest := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,16].Text,dou);
    Animales[Ind].dd := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,17].Text,dou);
    Animales[Ind].pd := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,18].Text,dou);
    Animales[Ind].dm := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,19].Text,dou);
    Animales[Ind].pm := dou;
    int := 0;
    TryStrToInt(p.cells[I,20].Text,int);
    Animales[Ind].crias := int;
    dat := 0;
    TryStrToDate(p.cells[I,21].Text,dat);
    if (dat = 0) then
      TryStrToDate(FECHA_NACIMIENTO_DEFECTO,dat);

    Animales[Ind].fecha_anio := dat;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,22].Text,dou);
    Animales[Ind].peso_anio := dou;
    dat := 0;
    TryStrToDate(p.cells[I,23].Text,dat);
    if (dat = 0) then
      TryStrToDate(FECHA_NACIMIENTO_DEFECTO,dat);

    Animales[Ind].fecha_18 := dat;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,24].Text,dou);
    Animales[Ind].peso_18 := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,25].Text,dou);
    Animales[Ind].df := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,26].Text,dou);
    Animales[Ind].pf := dou;
    dou := 0;
    dat := 0;
    TryStrToDate(p.cells[I,27].Text,dat);
    if (dat = 0) then
      TryStrToDate(FECHA_NACIMIENTO_DEFECTO,dat);

    Animales[Ind].fecha_ce := dat;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,28].Text,dou);
    Animales[Ind].CE := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,29].Text,dou);
    Animales[Ind].dc := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,30].Text,dou);
    Animales[Ind].pc := dou;
    dat := 0;
    TryStrToDate(p.cells[I,31].Text,dat);
    if (dat = 0) then
      TryStrToDate(FECHA_NACIMIENTO_DEFECTO,dat);

    Animales[Ind].fecha_alzada := dat;
    dat := 0;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,32].Text,dou);
    Animales[Ind].alzada := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,33].Text,dou);
    Animales[Ind].frame := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,34].Text,dou);
    Animales[Ind].dal := dou;
    dou := 0;
    tryStrToFloatTwice(p.cells[I,35].Text,dou);
    Animales[Ind].pal := dou;
    dou := 0;
    dat := 0;
    int := 0;
    TryStrToDate(p.cells[I,37].Text,dat);
    if (dat = 0) then
      TryStrToDate(FECHA_NACIMIENTO_DEFECTO,dat);

    Animales[Ind].fecha_ecog := dat;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,36].Text,dou);
    Animales[Ind].peso_ecog := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,38].Text,dou);
    Animales[Ind].aob := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,39].Text,dou);
    Animales[Ind].daob := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,40].Text,dou);
    Animales[Ind].paob := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,41].Text,dou);
    Animales[Ind].espesor_gr := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,42].Text,dou);
    Animales[Ind].dgd := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,43].Text,dou);
    Animales[Ind].pgd := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,44].Text,dou);
    Animales[Ind].grasa_intr := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,45].Text,dou);
    Animales[Ind].dgi := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,46].Text,dou);
    Animales[Ind].pgi := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,47].Text,dou);
    Animales[Ind].grasa_cade := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,48].Text,dou);
    Animales[Ind].dgc := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,49].Text,dou);
    Animales[Ind].pgc := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,50].Text,dou);
    Animales[Ind].pcma := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,51].Text,dou);
    Animales[Ind].dpcm := dou;
    dou := 0;
    dat := 0;
    int := 0;
    tryStrToFloatTwice(p.cells[I,52].Text,dou);
    Animales[Ind].ppcm := dou;
    dou := 0;
    dat := 0;
    int := 0;
    Animales[Ind].pelado := p.cells[I,53].Text;
    Animales[Ind].tipo_serv := p.cells[I,54].Text;
    Animales[Ind].tip_sang := p.cells[I,55].Text;

    dou := 0;
    dat := 0;
    int := 0;
    TryStrToDate(p.cells[I,56].Text,dat);
    if (dat = 0) then
      TryStrToDate(FECHA_NACIMIENTO_DEFECTO,dat);

    Animales[Ind].fserv := dat;
    Animales[Ind].rp_md := p.cells[I,57].Text;
    Animales[Ind].hba_md := p.cells[I,58].Text;
    Animales[Ind].apodo_md := p.cells[I,59].Text;
    Animales[Ind].nombre_md := p.cells[I,53].Text;

    Animales[Ind].raza_md := p.cells[I,60].Text;
    Animales[Ind].color_md := p.cells[I,61].Text;
    dou := 0;
    dat := 0;
    int := 0;
    TryStrToDate(p.cells[I,62].Text,dat);
    if (dat = 0) then
      TryStrToDate(FECHA_NACIMIENTO_DEFECTO,dat);

    Animales[Ind].fnac_md := dat;
    Animales[Ind].rp_pd := p.cells[I,63].Text;
    Animales[Ind].apodo_pd := p.cells[I,64].Text;
    Animales[Ind].hba_pd := p.cells[I,65].Text;
    Animales[Ind].raza_pd := p.cells[I,66].Text;
    Animales[Ind].color_pd := p.cells[I,67].Text;
    dou := 0;
    dat := 0;
    int := 0;
    TryStrToInt(p.cells[I,68].Text,int);
    Animales[Ind].anac_pd := int;
    Animales[Ind].rp_rec := p.cells[I,69].Text;
    Animales[Ind].raza_rec := p.cells[I,71].Text;
    dou := 0;
    dat := 0;
    int := 0;
    TryStrToDate(p.cells[I,70].Text,dat);
    if (dat = 0) then
      TryStrToDate(FECHA_NACIMIENTO_DEFECTO,dat);

    Animales[Ind].fnac_rec := dat;
    dou := 0;
    dat := 0;
    int := 0;
    TryStrToInt(p.cells[I,72].Text,int);
    if (int >4) then int:=0;
    Animales[Ind].m0 := int;
    dou := 0;
    dat := 0;
    int := 0;
    TryStrToInt(p.cells[I,73].Text,int);
    if (int >4) then int:=0;
    Animales[Ind].m1 := int;
    dou := 0;
    dat := 0;
    int := 0;
    TryStrToInt(p.cells[I,74].Text,int);
    if (int >4) then int:=0;
    Animales[Ind].m2 := int;
    dou := 0;
    dat := 0;
    int := 0;
    TryStrToInt(p.cells[I,75].Text,int);
    if (int >4) then int:=0;
    Animales[Ind].m3 := int;
    dou := 0;
    dat := 0;
    int := 0;
    TryStrToInt(p.cells[I,76].Text,int);
    if (int >4) then int:=0;
    Animales[Ind].m4 := int;
    dou := 0;
    dat := 0;
    int := 0;
    // La ultima columna es para establecimiento
    TryStrToInt(p.cells[I,77].Text,int);
    if (int = 0) then
       Animales[Ind].establecimiento := FPrincipal.EstablecimientoActual
    else
       Animales[Ind].establecimiento := int;

    Animales[Ind].otro_cria := p.cells[I,78].Text;
    Animales[Ind].otro_md := p.cells[I,79].Text;
    Animales[Ind].otro_pd := p.cells[I,80].Text;

    //-----------------------------------------
    //--- Columna para indicar errores!
    // Caso 1  : Madre con datos y fecha servicios 0
    if (animales[ind].rp_md <> '') and (not isValidDate( p.cells[I,56].Text) ) then
    begin
       stList.Add(animales[ind].RP+ ';'+'1 : Datos incompletos servicio;' + p.cells[I,57].Text+';'+p.cells[I,56].Text )    ;
       animales[ind].fserv := '';
       inc(errorCounter);
    end;

//    *.*.* CODIGO IVAN
    if (not isValidDate( p.cells[I,56].Text)) then
      animales[ind].fserv := '';
//    *.*.* FIN CODIGO IVAN

    Animales[ind].ID_ANIMAL := -1;

    if (i mod 15 = 0) then begin label1.Caption :=' Cargando '+intToStr(i); application.ProcessMessages(); end;
    inc(Ind);
    Inc(I);
  end;

  application.ProcessMessages();
  try
    if (errorCounter>0) then
    begin
      //showMessage('Se encontraron algunos errores en el archivo. Ver  '' ImportERAError.csv''' );
      stList.SaveToFile(extractFilePath(application.exename) + 'ImportERAError.csv');
    end;
  except
  end;
  stList.free();
  CantFila := Length(Animales);
  lbProgreso.Visible := false;
end;

function TFImpERA.Sirve(Valor : Variant) : Boolean;
begin
  {if Valor <> null then
  begin
    if VarType(Valor) = varString then
      Result := Trim(Valor) <> '';
    if (VarType(Valor) = varInteger) or (VarType(Valor) = varDouble) or (VarType(Valor) = varSmallint) or (VarType(Valor) = varSingle) or
       (VarType(Valor) = varCurrency) or (VarType(Valor) = varByte) or (VarType(Valor) = varWord) or (VarType(Valor) = varLongWord) or (VarType(Valor) = varInt64) then
      Result := Valor <> 0;
    if VarType(Valor) = varDate then
      Result := true;
  end
  else
    Result := false;  }
  Result := true;
end;

function TFImpERA.ExisteAnimal(RP, HBA, FechaN, Sexo, Color,Raza : Variant) : Boolean;
var
  Animal, I, ActHBA : Integer;
  res, SexoVal, Aux, AuxHBA : String;
  NoExiste, Agrego : Boolean;
  tempDt : TDateTime;
begin
  Agrego := false;
  Result := false;
  ActHBA := 0;
  NoExiste := false;
  if Sirve(RP) then
  begin
    Aux := Trim(RP);

    if AnsiContainsStr(Aux,'- T') then
    begin
      Aux := Trim(StringReplace(Aux,'- T','',[]));
      Agrego := true;
    end;

    //RP := Aux;
    res := '';
    IBQExisteAnimal.DisableControls();
    IBQInsertAux.DisableControls();
    IBQExisteAnimal.Close;
    IBQExisteAnimal.ParamByName('RP').Value := Aux; //Trim(RP.Value);
    IBQExisteAnimal.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
    IBQExisteAnimal.Open;
    Animal := -1;
    if not IBQExisteAnimal.IsEmpty then    //Existe el RP
    begin
      if Agrego then
        Aux := Aux+' - T';

      if Sirve(FechaN) and Sirve(Sexo) then
      begin
        case Sexo of
          1 : SexoVal := 'Macho';
          2 : SexoVal := 'Hembra';
        end;
        IBQExisteAnimal.First;
        if Sirve(HBA) then
        begin
          AuxHBA := Trim(HBA);

          if ((AuxHBA = '') or (AuxHBA = '0') or (HBA = 0)) then
          begin
            if IBQExisteAnimal.Locate('FECHA_NACIMIENTO;SEXO',VarArrayOf([FechaN,Sexo]),[]) then
            begin
              Animal := IBQExisteAnimal.FieldValues['id_animal'];

              if Agrego then
              begin
                IBQActRPSRA.Close;
                IBQActRPSRA.ParamByName('rp').AsString := Aux;
                IBQActRPSRA.ParamByName('id').AsInteger := Animal;
                IBQActRPSRA.Open;
              end;

              RPGral := Aux; //RP.Value;
              Result := true;
            end
            else
              NoExiste := true;
          end
          else
          begin
            if IBQExisteAnimal.Locate('ID_HBA;FECHA_NACIMIENTO;SEXO',VarArrayOf([AuxHBA,FechaN,Sexo]),[]) then
            begin
              Animal := IBQExisteAnimal.FieldValues['id_animal'];

              if Agrego then
              begin
                IBQActRPSRA.Close;
                IBQActRPSRA.ParamByName('rp').AsString := Aux;
                IBQActRPSRA.ParamByName('id').AsInteger := Animal;
                IBQActRPSRA.Open;
              end;

              RPGral := Aux; //RP.Value;
              Result := true;
            end
            else
              NoExiste := true;
          end;
          if NoExiste then
          begin
            res := ' - Se repite el RP del animal';

            if IBQExisteAnimal.FieldByName('ID_HBA').Value = null then
            begin
              res := res + ' - No tiene HBA cargado en Huella';
              ActHBA := 1;
            end
            else
              if IBQExisteAnimal.FieldByName('ID_HBA').Value <> AuxHBA{HBA.Value} then
              begin
                res := res+' - Tienen diferente HBA';
                ActHBA := 1;
              end;

            if IBQExisteAnimal.FieldByName('FECHA_NACIMIENTO').Value <> FechaN then
            begin
              res := res+' - Tienen diferentes Fechas de Nacimiento';
              ActHBA := 0;
            end;

            if IBQExisteAnimal.FieldByName('Sexo').Value <> Sexo then
            begin
              res := res+' - Tienen diferentes Sexos';
              ActHBA := 0;
            end;

            if ActHBA = 1 then
              res := 'Se actualizará el HBA';

            try
              IBQInsertAux.Close;
              if ActHBA = 1 then
              begin
                IBQInsertAux.ParamByName('v1').AsString := 'Actualizar';
                IBQInsertAux.ParamByName('aux').AsInteger := -2;
                IBQInsertAux.ParamByName('animal').AsInteger := IBQExisteAnimal.FieldValues['id_animal'];
              end
              else
              begin
                IBQInsertAux.ParamByName('aux').AsInteger := -3;
                IBQInsertAux.ParamByName('animal').AsInteger := -1;
                IBQInsertAux.ParamByName('v1').AsString := 'Dar de Alta';
              end;

              IBQInsertAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
              IBQInsertAux.ParamByName('rp').AsString := Aux;//RP;
              IBQInsertAux.ParamByName('rp_huella').AsString := Aux;//RP;
              if Sirve(HBA) then
              begin
                if HBA = 0 then
                  IBQInsertAux.ParamByName('hba').Value := null
                else
                  IBQInsertAux.ParamByName('hba').Value := AuxHBA;//HBA;
              end;
              IBQInsertAux.ParamByName('hba_huella').Value := IBQExisteAnimal.FieldValues['ID_HBA'];

              tempDt :=   VarToDateTime(FechaN);
              IBQInsertAux.ParamByName('f_nac').AsDate := tempDt;
              IBQInsertAux.ParamByName('f_nac_huella').AsDate := IBQExisteAnimal.FieldValues['FECHA_NACIMIENTO'];

              if Sexo = 1 then
                IBQInsertAux.ParamByName('V16').AsString := 'Macho'
              else
                IBQInsertAux.ParamByName('V16').AsString := 'Hembra';

              if IBQExisteAnimal.FieldValues['SEXO'] = 1 then
                IBQInsertAux.ParamByName('V17').AsString := 'Macho'
              else
                IBQInsertAux.ParamByName('V17').AsString := 'Hembra';

              IBQInsertAux.ParamByName('sexo').AsInteger := Sexo;
              IBQInsertAux.ParamByName('sexo_huella').AsInteger := IBQExisteAnimal.FieldValues['SEXO'];
              if Trim(Color) = 'N' then
                IBQInsertAux.ParamByName('raza').AsInteger := 2
              else
              begin
                if Trim(Color) = 'C' then
                  IBQInsertAux.ParamByName('raza').AsInteger := 3
                else
                  IBQInsertAux.ParamByName('raza').AsInteger := 0;
              end;
              if Sexo = 1 then
                IBQInsertAux.ParamByName('categ').AsInteger := 1
              else
                IBQInsertAux.ParamByName('categ').AsInteger := 4;
              IBQInsertAux.ParamByName('obs').AsString := res;
              IBQInsertAux.Open;
              Fprincipal.IBTPrincipal.CommitRetaining;
              Inc(CantNuevos);
              LCantNuevos.Caption := IntToStr(CantNuevos)+Traducir(' animales nuevos');
            except
              FPrincipal.IBTPrincipal.RollbackRetaining;
            end;
          end;
          //end;
        end
        else
        begin
          if IBQExisteAnimal.Locate('FECHA_NACIMIENTO;SEXO',VarArrayOf([FechaN,Sexo]),[]) then
          begin
            Animal := IBQExisteAnimal.FieldValues['id_animal'];

            if Agrego then
            begin
              IBQActRPSRA.Close;
              IBQActRPSRA.ParamByName('rp').AsString := Aux;
              IBQActRPSRA.ParamByName('id').AsInteger := Animal;
              IBQActRPSRA.Open;
            end;
            RPGral := Aux;//RP;
            Result := true;
          end
          else
          begin
            res := ' - Se repite el RP del animal';
            if IBQExisteAnimal.FieldByName('ID_HBA').Value = null then
              begin
                res := res + ' - No tiene HBA cargado en Huella';
                ActHBA := 1;
              end
              else
                if IBQExisteAnimal.FieldByName('ID_HBA').Value <> AuxHBA{HBA} then
                begin
                  res := res+' - Tienen diferente HBA';
                  ActHBA := 1;
                end;

              if IBQExisteAnimal.FieldByName('FECHA_NACIMIENTO').Value <> FechaN then
              begin
                res := res+' - Tienen diferentes Fechas de Nacimiento';
                ActHBA := 0;
              end;

              if IBQExisteAnimal.FieldByName('Sexo').Value <> Sexo then
              begin
                res := res+' - Tienen diferentes Sexos';
                ActHBA := 0;
              end;

            if ActHBA = 1 then
              res := 'Se actualizará el HBA';

            try
              IBQInsertAux.Close;

              if ActHBA = 1 then
              begin
                IBQInsertAux.ParamByName('v1').AsString := 'Actualizar';
                IBQInsertAux.ParamByName('aux').AsInteger := -2;
                IBQInsertAux.ParamByName('animal').AsInteger := IBQExisteAnimal.FieldValues['id_animal'];
              end
              else
              begin
                IBQInsertAux.ParamByName('aux').AsInteger := -3;
                IBQInsertAux.ParamByName('animal').AsInteger := -1;
                IBQInsertAux.ParamByName('v1').AsString := 'Dar de Alta';
              end;

              IBQInsertAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
              IBQInsertAux.ParamByName('rp').AsString := Aux;//RP;
              IBQInsertAux.ParamByName('rp_huella').AsString := Aux;//RP;
              if Sirve(HBA) then
              begin
                AuxHBA := Trim(HBA);
                if {HBA}AuxHBA = '0' then
                  IBQInsertAux.ParamByName('hba').Value := null
                else
                  IBQInsertAux.ParamByName('hba').Value := AuxHBA;//HBA;
              end;
              IBQInsertAux.ParamByName('hba_huella').Value := IBQExisteAnimal.FieldValues['ID_HBA'];
              IBQInsertAux.ParamByName('f_nac').AsDate := FechaN.AsDateTime;
              IBQInsertAux.ParamByName('f_nac_huella').AsDate := IBQExisteAnimal.FieldValues['FECHA_NACIMIENTO'];

              if Sexo = 1 then
                IBQInsertAux.ParamByName('V16').AsString := 'Macho'
              else
                IBQInsertAux.ParamByName('V16').AsString := 'Hembra';

              if IBQExisteAnimal.FieldValues['SEXO'] = 1 then
                IBQInsertAux.ParamByName('V17').AsString := 'Macho'
              else
                IBQInsertAux.ParamByName('V17').AsString := 'Hembra';

              IBQInsertAux.ParamByName('sexo').AsInteger := Sexo;
              IBQInsertAux.ParamByName('sexo_huella').AsInteger := IBQExisteAnimal.FieldValues['SEXO'];
              if Trim(Color) = 'N' then
                IBQInsertAux.ParamByName('raza').AsInteger := 2
              else
              begin
                if Trim(Color) = 'C' then
                  IBQInsertAux.ParamByName('raza').AsInteger := 3
                else
                  IBQInsertAux.ParamByName('raza').AsInteger := 0;
              end;
              if Sexo = 1 then
                IBQInsertAux.ParamByName('categ').AsInteger := 1
              else
                IBQInsertAux.ParamByName('categ').AsInteger := 4;
              IBQInsertAux.ParamByName('obs').AsString := res;
              IBQInsertAux.Open;
              Fprincipal.IBTPrincipal.CommitRetaining;
              Inc(CantNuevos);
              LCantNuevos.Caption := IntToStr(CantNuevos)+Traducir(' animales nuevos');
            except
              FPrincipal.IBTPrincipal.RollbackRetaining;
            end;
          end;
        end;
      end;
    end
    else   //el RP no existe
    begin
      try
        if Agrego then
          Aux := Aux+' - T';


        IBQInsertAux.Close;
        IBQInsertAux.ParamByName('aux').AsInteger := -1;
        IBQInsertAux.ParamByName('v1').AsString := 'Dar de Alta';
        IBQInsertAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQInsertAux.ParamByName('animal').AsInteger := -1;
        IBQInsertAux.ParamByName('rp').AsString := Aux;
        IBQInsertAux.ParamByName('rp_huella').Value := null;
        if Sirve(HBA) then
        begin
          AuxHBA := Trim(HBA);
          if {HBA}AuxHBA = '0' then
            IBQInsertAux.ParamByName('hba').Value := null
          else
            IBQInsertAux.ParamByName('hba').Value := AuxHBA;//HBA;
        end;
        IBQInsertAux.ParamByName('hba_huella').Value := null;
        IBQInsertAux.ParamByName('f_nac').AsDate := FechaN;
        IBQInsertAux.ParamByName('f_nac_huella').Value := null;

        if Sexo = 1 then
          IBQInsertAux.ParamByName('V16').AsString := 'Macho'
        else
          IBQInsertAux.ParamByName('V16').AsString := 'Hembra';

        IBQInsertAux.ParamByName('V17').Value := null;

        IBQInsertAux.ParamByName('sexo').AsInteger := Sexo;
        IBQInsertAux.ParamByName('sexo_huella').Value := null;
        if Trim(Color) = 'N' then
          IBQInsertAux.ParamByName('raza').AsInteger := 2
        else
        begin
          if Trim(Color) = 'C' then
            IBQInsertAux.ParamByName('raza').AsInteger := 3
          else
            IBQInsertAux.ParamByName('raza').AsInteger := 0;
        end;
        if Sexo = 1 then
          IBQInsertAux.ParamByName('categ').AsInteger := 1
        else
          IBQInsertAux.ParamByName('categ').AsInteger := 4;
        IBQInsertAux.ParamByName('obs').AsString := 'No Existe';
        IBQInsertAux.Open;
        Fprincipal.IBTPrincipal.CommitRetaining;
        Inc(CantNuevos);
        LCantNuevos.Caption := IntToStr(CantNuevos)+Traducir(' animales nuevos');
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
  end;
end;

function TFImpERA.buscarSemen(idAnimal : integer; tipoA : string):integer;
begin
 IBQActAux.sql.clear();
 if tipoA = 'I' then
    IBQActAux.sql.add('select * from tab_semen where tab_semen.ANIMAL = :ID_ANIMAL ')
 else
   IBQActAux.sql.add('select * from tab_semen where tab_semen.ANIMAL_EXTERNO = :ID_ANIMAL ');
 IBQActAux.ParamByName('ID_ANIMAL').Value := idAnimal;//RP;
 IBQActAux.Open();
 if not IBQActAux.IsEmpty then    //Existe el RP
           result := IBQActAux.FieldValues['ID_SEMEN']
 else
    result := -1;

end;

function TFImpERA.BuscarAnimal(RP, HBA, FechaN, Sexo, Color,Raza : Variant) : integer;
var
  Animal : Integer;
  SexoVal, Aux : String;
  _HBA : Variant;
begin
  Animal := -1;
  if Sirve(RP) then
  begin
    Aux := Trim(RP);

   { if AnsiContainsStr(Aux,'- T') then
      Aux := Trim(StringReplace(Aux,'- T','',[]));  }

    _HBA := Trim(HBA);
    if _HBA <> null then
    begin
      if (_HBA = '0') or (_HBA = '') then
        _HBA := null;
    end;
    //RP.AsString := Aux;
    IBQExisteAnimal.Close;
    IBQExisteAnimal.ParamByName('RP').Value := Aux;//RP;
    IBQExisteAnimal.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
    IBQExisteAnimal.Open;
    Animal := -1;
    if not IBQExisteAnimal.IsEmpty then    //Existe el RP
    begin
      if Sirve(FechaN) and Sirve(Sexo) then
      begin
        case Sexo of
          1 : SexoVal := 'Macho';
          2 : SexoVal := 'Hembra';
        end;
        IBQExisteAnimal.First;
        if IBQExisteAnimal.Locate('ID_HBA;FECHA_NACIMIENTO;SEXO',VarArrayOf([_HBA,FechaN,Sexo]),[]) then
        begin
          Animal := IBQExisteAnimal.FieldValues['id_animal'];
          RPGral := Aux;//RP;
        end
        else
//          if (Trim(HBA) = '') and (IBQExisteAnimal.Locate('FECHA_NACIMIENTO;SEXO',VarArrayOf([FechaN,Sexo]),[])) then
          if (_HBA = Null) and (IBQExisteAnimal.Locate('FECHA_NACIMIENTO;SEXO',VarArrayOf([FechaN,Sexo]),[])) then
          begin
            Animal := IBQExisteAnimal.FieldValues['id_animal'];
            RPGral := Aux; //RP;
          end
          else
            Animal := -1
      end;
    end
    else   //el RP no existe
      Animal := -1
  end;
  Result := Animal;
end;

function TFImpERA.VerificarPeso(RP : String; IdAnimal : Integer; FechaN, Fecha, Valor : Variant; Dias : String) : Integer;
var
  res : Integer;
  value : double;
begin
  if Sirve(Fecha) and Sirve(Valor) then
  begin
    tryStrToFloatTwice(valor, value);

    if (value = 0) then
      begin
        // No es un valor valido
        exit;
      end;
    res := 0;
    if (CompareDate(FechaN,Fecha) = -1) or (Dias = 'N') then
    begin
      ///Verifico los datos con los que tengo cargados
      IBQVerificacion.Close;
      IBQVerificacion.SQL.Clear;
      IBQVerificacion.SQL.Add('select first 1 ee.id_evento, ep.peso, ee.fecha from eve_eventos ee join eve_peso ep on ee.id_evento = ep.id_evento where ee.animal = :id and ep.dias = :dias order by ee.fecha desc');
      IBQVerificacion.ParamByName('id').AsInteger := IdAnimal;
      IBQVerificacion.ParamByName('dias').AsString := Dias;
      IBQVerificacion.Open;
      if not IBQVerificacion.IsEmpty then
      begin
        if CompareDate(IBQVerificacion.FieldValues['fecha'],Fecha) = EqualsValue then
          if Valor = IBQVerificacion.FieldByName('peso').AsInteger then
            res := 0  //Existe Igual
          else
            res := -1 //Peso Diferente
        else
          if Valor = IBQVerificacion.FieldByName('peso').AsInteger then
            res := -2 //Fecha Diferente
          else
            res := -3; //Fecha y Peso Diferentes
      end
      else
        res := 1; //No Existe
      if (res = -1) or (res = -2) or (res = 1) or (res = -3) then
      begin
        try
          IBQActAux.Close;
          IBQActAux.SQL.Clear;
          if Dias = 'N' then
            case res of
              -1 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, peso_n = :peso, act_peso_n = 1 where id_animal = :id');
              -2 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, fecha_peso_n = :fecha, act_fecha_peso_n = 1 where id_animal = :id');
              -3 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, peso_n = :peso, act_peso_n = 1, fecha_peso_n = :fecha, act_fecha_peso_n = 1 where id_animal = :id');
              1 : IBQActAux.SQL.Add('update aux_imp_era set peso_n = :peso, act_peso_n = 1, fecha_peso_n = :fecha, act_fecha_peso_n = 1 where id_animal = :id');
            end;
          if Dias = 'D' then
            case res of
              -1 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, peso_d = :peso, act_peso_d = 1 where id_animal = :id');
              -2 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, fecha_peso_d = :fecha, act_fecha_peso_d = 1 where id_animal = :id');
              -3 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, peso_d = :peso, act_peso_d = 1, fecha_peso_d = :fecha, act_fecha_peso_d = 1 where id_animal = :id');
              1 : IBQActAux.SQL.Add('update aux_imp_era set peso_d = :peso, act_peso_d = 1, fecha_peso_d = :fecha, act_fecha_peso_d = 1 where id_animal = :id');
            end;
          if Dias = 'A' then
            case res of
              -1 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, peso_a = :peso, act_peso_a = 1 where id_animal = :id');
              -2 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, fecha_peso_a = :fecha, act_fecha_peso_a = 1 where id_animal = :id');
              -3 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, peso_a = :peso, act_peso_a = 1, fecha_peso_a = :fecha, act_fecha_peso_a = 1 where id_animal = :id');
              1 : IBQActAux.SQL.Add('update aux_imp_era set peso_a = :peso, act_peso_a = 1, fecha_peso_a = :fecha, act_fecha_peso_a = 1 where id_animal = :id');
            end;
          if Dias = 'T' then
            case res of
              -1 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, peso_18 = :peso, act_peso_18 = 1 where id_animal = :id');
              -2 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, fecha_peso_18 = :fecha, act_fecha_peso_18 = 1 where id_animal = :id');
              -3 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, peso_18 = :peso, act_peso_18 = 1, fecha_peso_18 = :fecha, act_fecha_peso_18 = 1 where id_animal = :id');
              1 : IBQActAux.SQL.Add('update aux_imp_era set peso_18 = :peso, act_peso_18 = 1, fecha_peso_18 = :fecha, act_fecha_peso_18 = 1 where id_animal = :id');
            end;
          IBQActAux.ParamByName('id').AsInteger := IdAnimal;
          if IBQActAux.Params.FindParam('peso') <> nil then
            IBQActAux.ParamByName('peso').Value := Valor;
          if IBQActAux.Params.FindParam('fecha') <> nil then
            IBQActAux.ParamByName('fecha').Value := Fecha;
          IBQActAux.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
      end;
    end;
  end;
end;

procedure TFImpERA.CargarPesos(IdAnimal : Integer; Nuevo, ModifFecha, ModifPeso : Integer; Fecha, Valor : Variant; Dias : String);
begin
  IBQVerificacion.Close;
  IBQVerificacion.SQL.Clear;
  IBQVerificacion.SQL.Add('select first 1 ee.id_evento from eve_eventos ee join eve_peso ep on ee.id_evento = ep.id_evento where ee.animal = :id and ep.dias = :dias order by ee.fecha desc');
  IBQVerificacion.ParamByName('id').AsInteger := IdAnimal;
  IBQVerificacion.ParamByName('dias').AsString := Dias;
  IBQVerificacion.Open;
  if IBQVerificacion.IsEmpty then //no tiene evento, hay que cargarlo nuevo
  begin
    try
      IBQPeso.Close;
      IBQPeso.ParamByName('Fecha').AsDate := Fecha;
      IBQPeso.ParamByName('Animal').AsInteger := IdAnimal;
      IBQPeso.ParamByName('Observacion').AsString := 'Datos importados de ERA';
      IBQPeso.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQPeso.ParamByName('Responsable').AsInteger := 0;
      IBQPeso.ParamByName('Log_Usuario').AsInteger := 1;
      IBQPeso.ParamByName('Log_Fecha_Modificado').AsDate := Today();
      IBQPeso.ParamByName('DIAS').AsString := Dias;
      IBQPeso.ParamByName('Peso').AsInteger := Valor;
      IBQPeso.ParamByName('Id_Grupo').Value := null;
      IBQPeso.ParamByName('Disparador').Value := null;
      IBQPeso.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
      if Dias = 'N' then
      begin
        Inc(PesoN);
        LCantPesoN.Caption := '('+IntToStr(PesoN)+')';
      end;
      if Dias = 'D' then
      begin
        Inc(PesoD);
        LPesoDest.Caption := '('+IntToStr(PesoD)+')';
      end;
      if Dias = 'A' then
      begin
        Inc(PesoA);
        LPesoAnio.Caption := '('+IntToStr(PesoA)+')';
      end;
      if Dias = 'T' then
      begin
        Inc(PesoT);
        LPesoAdulto.Caption := '('+IntToStr(PesoT)+')';
      end;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end
  else  //Actualizar el evento existente
  begin
    if (Fecha <> null) and (ModifFecha = 1) then
    begin
      try
        IBQActPeso.Close;
        IBQActPeso.SQL.Clear;
        IBQActPeso.SQL.Add('update eve_eventos set fecha = :fecha where id_evento = :eve');
        IBQActPeso.ParamByName('fecha').AsDate := Fecha;
        IBQActPeso.ParamByName('eve').AsInteger := IBQVerificacion.FieldValues['id_evento'];
        IBQActPeso.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
    if (Valor <> null) and (ModifPeso = 1)then
    begin
      try
        IBQActPeso.Close;
        IBQActPeso.SQL.Clear;
        IBQActPeso.SQL.Add('update eve_peso set peso = :peso where id_evento = :eve');
        IBQActPeso.ParamByName('peso').Value := Valor;
        IBQActPeso.ParamByName('eve').Value := IBQVerificacion.FieldValues['id_evento'];
        IBQActPeso.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
    if Dias = 'N' then
    begin
      Inc(PesoN);
      LCantPesoN.Caption := '('+IntToStr(PesoN)+')';
    end;
    if Dias = 'D' then
    begin
      Inc(PesoD);
      LPesoDest.Caption := '('+IntToStr(PesoD)+')';
    end;
    if Dias = 'A' then
    begin
      Inc(PesoA);
      LPesoAnio.Caption := '('+IntToStr(PesoA)+')';
    end;
    if Dias = 'T' then
    begin
      Inc(PesoT);
      LPesoAdulto.Caption := '('+IntToStr(PesoT)+')';
    end;
  end;
end;

function TFImpERA.VerificarCE(RP : String; IdAnimal : Integer; FechaN, Fecha, Valor : Variant) : Integer;
var
  res : Integer;
begin
  if Sirve(Fecha) and Sirve(Valor) then
  begin
    if CompareDate(FechaN,Fecha) = -1 then
    begin
      IBQVerificacion.Close;
      IBQVerificacion.SQL.Clear;
      IBQVerificacion.SQL.Add('select first 1 ee.id_evento, ece.valor, ee.fecha from eve_eventos ee join eve_circunferencia_escrotal ece on ee.id_evento = ece.id_evento where ee.animal = :id order by ee.fecha desc');
      IBQVerificacion.ParamByName('id').AsInteger := IdAnimal;
      IBQVerificacion.Open;
      if not IBQVerificacion.IsEmpty then
      begin
        if CompareDate(IBQVerificacion.FieldValues['fecha'],Fecha) = EqualsValue then
          if Valor = IBQVerificacion.FieldByName('valor').AsFloat then
            res := 0  //Existe Igual
          else
            res := -1 //Peso Diferente
        else
          if Valor = IBQVerificacion.FieldByName('valor').AsFloat then
            res := -2 //Fecha Diferente
          else
            res := -3; //Fecha y Peso Diferentes
      end
      else
        res := 1; //No Existe
      if (res = -1) or (res = -2) or (res = 1) or (res = -3) then
      begin
        try
          IBQActAux.Close;
          IBQActAux.SQL.Clear;
          case res of
            -1 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, ce = :valor, act_peso_n = 1 where id_animal = :id');
            -2 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, fecha_ce = :fecha, act_fecha_ce = 1 where id_animal = :id');
            -3 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, ce = :valor, act_ce = 1, fecha_ce = :fecha, act_fecha_ce = 1 where id_animal = :id');
            1 : IBQActAux.SQL.Add('update aux_imp_era set ce = :valor, act_ce = 1, fecha_ce = :fecha, act_fecha_ce = 1 where id_animal = :id');
          end;
          IBQActAux.ParamByName('id').AsInteger := IdAnimal;
          if IBQActAux.Params.FindParam('valor') <> nil then
            IBQActAux.ParamByName('valor').Value := Valor;
          if IBQActAux.Params.FindParam('fecha') <> nil then
            IBQActAux.ParamByName('fecha').Value := Fecha;
          IBQActAux.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
      end;
    end;
  end;
end;

procedure TFImpERA.CargarCE(IdAnimal : Integer; Nuevo, ModifFecha, ModifValor : Integer; Fecha, Valor : Variant);
begin
  IBQVerificacion.Close;
  IBQVerificacion.SQL.Clear;
  IBQVerificacion.SQL.Add('select first 1 ee.id_evento from eve_eventos ee join eve_circunferencia_escrotal ece on ee.id_evento = ece.id_evento where ee.animal = :id order by ee.fecha desc');
  IBQVerificacion.ParamByName('id').AsInteger := IdAnimal;
  IBQVerificacion.Open;
  if IBQVerificacion.IsEmpty then // No tiene cargado ningun evento de ce, hay q agregarlo
  begin
    try
      IBQCE.Close;
      IBQCE.ParamByName('Fecha').AsDate := Fecha;
      IBQCE.ParamByName('Animal').AsInteger := IdAnimal;
      IBQCE.ParamByName('Observacion').AsString := '';
      IBQCE.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQCE.ParamByName('Responsable').AsInteger := 0;
      IBQCE.ParamByName('Log_Usuario').AsInteger := 1;
      IBQCE.ParamByName('Log_Fecha_Modificado').AsDate := Today();
      IBQCE.ParamByName('Valor').AsInteger := Valor;
      IBQCE.ParamByName('Alos18Meses').AsString := 'N';
      IBQCE.ParamByName('Id_Grupo').Value := null;
      IBQCE.ParamByName('Disparador').Value := null;
      IBQCE.Open;
      Fprincipal.IBTPrincipal.CommitRetaining;
      Inc(CE);
      LCE.Caption := '('+IntToStr(CE)+')';
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end
  else    //el evento esta cargado, solo hay q actualizar los valores
  begin
    if (Fecha <> null) and (ModifFecha = 1) then
    begin
      try
        IBQActCE.Close;
        IBQActCE.SQL.Clear;
        IBQActCE.SQL.Add('update eve_eventos set fecha = :fecha where id_evento = :eve');
        IBQActCE.ParamByName('fecha').AsDate := Fecha;
        IBQActCE.ParamByName('eve').AsInteger := IBQVerificacion.FieldValues['id_evento'];
        IBQActCE.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
    if (Valor <> null) and (ModifValor = 1) then
    begin
      try
        IBQActCE.Close;
        IBQActCE.SQL.Clear;
        IBQActCE.SQL.Add('update eve_circunferencia_escrotal set valor = :val where id_evento = :eve');
        IBQActCE.ParamByName('val').Value := Valor;
        IBQActCE.ParamByName('eve').AsInteger := IBQVerificacion.FieldValues['id_evento'];
        IBQActCE.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
    Inc(CE);
    LCE.Caption := '('+IntToStr(CE)+')';
  end;
end;

function TFImpERA.VerificarFrame(RP : String; IdAnimal : Integer; FechaN, Fecha, FechaNac, Altura, Frame : Variant) : Integer;
var
  res : Integer;
begin
  if Sirve(Fecha) and Sirve(Altura) and Sirve(Frame) then
  begin
    if CompareDate(FechaN,Fecha) = -1 then
    begin
      IBQVerificacion.Close;
      IBQVerificacion.SQL.Clear;
      IBQVerificacion.SQL.Add('select first 1 ee.id_evento, emf.valor as frame, emf.altura, ee.fecha from eve_eventos ee join eve_medicion_frame emf on ee.id_evento = emf.id_evento where ee.animal = :id order by ee.fecha desc');
      IBQVerificacion.ParamByName('id').AsInteger := IdAnimal;
      IBQVerificacion.Open;
      if not IBQVerificacion.IsEmpty then
      begin
        if CompareDate(IBQVerificacion.FieldValues['fecha'],Fecha) = EqualsValue then
          if Altura = IBQVerificacion.FieldByName('altura').AsFloat then
            if Frame = IBQVerificacion.FieldByName('frame').AsFloat then
              res := 0  //Existe Igual
            else
              res := -1 //Frame Diferente
          else
            if Frame = IBQVerificacion.FieldByName('frame').AsFloat then
              res := -2 //Altura Diferente
            else
              res := -3 //Altura y Frame Diferentes
        else
          if Altura = IBQVerificacion.FieldByName('altura').AsFloat then
            if Frame = IBQVerificacion.FieldByName('frame').AsFloat then
              res := -4 //Fecha Diferente
            else
              res := -5 //Fecha y Frame Diferentes
          else
            if Frame = IBQVerificacion.FieldByName('frame').AsFloat then
              res := -6 //Fecha y Altura Diferentes
            else
              res := -7; //Fecha, Frame y Altura Diferentes
      end
      else
        res := 1; //No Existe
      if (res = -1) or (res = -2) or (res = 1) or (res = -3) or (res = -4) or (res = -5) then
      begin
        try
          IBQActAux.Close;
          IBQActAux.SQL.Clear;
          case res of
            -1 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, frame = :frame, act_frame = 1 where id_animal = :id');
            -2 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, altura = :altura, act_altura = 1 where id_animal = :id');
            -3 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, altura = :altura, act_altura = 1, frame = :frame, act_frame = 1 where id_animal = :id');
            -4 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, fecha_altura = :fecha, act_fecha_altura = 1 where id_animal = :id');
            -5 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, fecha_altura = :fecha, act_fecha_altura = 1, frame = :frame, act_frame = 1 where id_animal = :id');
            -6 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, fecha_altura = :fecha, act_fecha_altura = 1, altura = :altura, act_altura = 1 where id_animal = :id');
            -7 : IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, fecha_altura = :fecha, act_fecha_altura = 1, altura = :altura, act_altura = 1, frame = :frame, act_frame = 1 where id_animal = :id');
            1 : IBQActAux.SQL.Add('update aux_imp_era set fecha_altura = :fecha, act_fecha_altura = 1, altura = :altura, act_altura = 1, frame = :frame, act_frame = 1 where id_animal = :id');
          end;
          IBQActAux.ParamByName('id').AsInteger := IdAnimal;
          if IBQActAux.Params.FindParam('altura') <> nil then
            IBQActAux.ParamByName('altura').Value := Altura;
          if IBQActAux.Params.FindParam('frame') <> nil then
            IBQActAux.ParamByName('frame').Value := Frame;
          if IBQActAux.Params.FindParam('fecha') <> nil then
            IBQActAux.ParamByName('fecha').Value := Fecha;
          IBQActAux.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
      end;
    end;
  end;
end;

procedure TFImpERA.CargarFrame(IdAnimal : Integer; Nuevo, ModifFecha, ModifAltura, ModifFrame : Integer;
       FechaNac, Fecha, Altura, Frame : Variant);
var
sA , sF : string;
fAltura, fFrame : double;
begin
  if (varIsnull(altura) and varIsNull(frame)) then exit;
  if (Altura = 0) and (Frame=0) then exit;
  IBQVerificacion.Close;
  IBQVerificacion.SQL.Clear;
  IBQVerificacion.SQL.Add('select first 1 ee.id_evento from eve_eventos ee join eve_medicion_frame emf on ee.id_evento = emf.id_evento where ee.animal = :id order by ee.fecha desc');
  IBQVerificacion.ParamByName('id').AsInteger := IdAnimal;
  IBQVerificacion.Open;
  if (IBQVerificacion.IsEmpty) then //No tiene cargado el evento, hay q cargarlo de nuevo
  begin
    try
      IBQFrame.Close;
      IBQFrame.ParamByName('Fecha').AsDate := Fecha;
      IBQFrame.ParamByName('Animal').AsInteger := IdAnimal;
      IBQFrame.ParamByName('Observacion').AsString := '';
      IBQFrame.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQFrame.ParamByName('Responsable').AsInteger := 0;
      IBQFrame.ParamByName('Log_Usuario').AsInteger := 1;
      IBQFrame.ParamByName('Log_Fecha_Modificado').AsDate := Today();
      IBQFrame.ParamByName('Altura').AsInteger := Altura;
      IBQFrame.ParamByName('Edad').AsInteger := DaysBetween(Fecha,FechaNac);
      sA := altura;
      sF := frame;
      tryStrToFloatTwice( sA, fAltura);
      tryStrToFloatTwice(sF, fFrame);
      if fFrame<=0 then
      begin
       try
      // se debe cslcular el frame
        IBQActAux.SQL.clear();
        IBQActAux.SQL.add('   select frame from  sp_calcula_frame_hembra(:ALTURA,:DIAS); ');
        IBQActAux.ParamByName('Altura').AsFloat := fAltura;
        IBQActAux.ParamByName('Dias').AsFloat := DaysBetween(Fecha,FechaNac);
        IBQActAux.Open;
        IBQFrame.ParamByName('Frame').AsFloat := IBQActAux.FieldValues['frame'];
       except
        IBQFrame.ParamByName('Frame').AsFloat := 0;

       end;
      end
      else
        IBQFrame.ParamByName('Frame').AsFloat := min(fAltura,fFrame);

       IBQFrame.ParamByName('Id_Grupo').Value := null;
       IBQFrame.ParamByName('Disparador').Value := null;
      IBQFrame.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
      Inc(MF);
      LMedicionF.Caption := '('+IntToStr(MF)+')';
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end
  else
  begin
    if (Fecha <> null) and (ModifFecha = 1) then
    begin
      try
        IBQActFrame.Close;
        IBQActFrame.SQL.Clear;
        IBQActFrame.SQL.Add('update eve_eventos set fecha = :fecha where id_evento = :eve');
        IBQActFrame.ParamByName('fecha').AsDate := Fecha;
        IBQActFrame.ParamByName('eve').Value := IBQVerificacion.FieldValues['id_evento'];
        IBQActFrame.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
    if (Frame <> null) and (Altura <> null) and (ModifFrame = 1) and (ModifAltura = 1) then
    begin
      try
        IBQActFrame.Close;
        IBQActFrame.SQL.Clear;
        IBQActFrame.SQL.Add('update eve_medicion_frame set altura = :altura, valor = :valor where id_evento := :eve');
        IBQActFrame.ParamByName('altura').Value := Altura;
        IBQActFrame.ParamByName('valor').Value := Frame;
        IBQActFrame.ParamByName('eve').Value := IBQVerificacion.FieldValues['id_evento'];
        IBQActFrame.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
    Inc(MF);
    LMedicionF.Caption := '('+IntToStr(MF)+')';
  end;
end;

function TFImpERA.VerificarCalidadCarne(RP : String; IdAnimal : Integer; FechaN, Fecha, Peso, AOB, EG, GI, GC, PCMA, Pelado : Variant) : Integer;
begin
  if Sirve(Fecha) and Sirve(Peso) and Sirve(AOB) and Sirve(EG) and Sirve(GI) and Sirve(GC) and Sirve(PCMA) then
  begin
    if CompareDate(FechaN,Fecha) = -1 then
    begin
      try
        IBQActAux.Close;
        IBQActAux.SQL.Clear;
        IBQActAux.SQL.Add('update aux_imp_era set fecha_peso_ecog = :fecha, peso_ecog = :peso, aob = :aob, eg = :eg, gi = :gi, gc = :gc, pcma = :pcma, pelado = :pelado where id_animal = :id');
        IBQActAux.ParamByName('fecha').AsDate := Fecha;
        IBQActAux.ParamByName('peso').Value := Peso;
        if Sirve(AOB) then
          IBQActAux.ParamByName('AOB').AsFloat := AOB
        else
          IBQActAux.ParamByName('AOB').Value := null;
        if Sirve(EG) then
          IBQActAux.ParamByName('EG').AsFloat := EG
        else
          IBQActAux.ParamByName('EG').Value := null;
        if Sirve(GI) then
          IBQActAux.ParamByName('GI').AsFloat := GI
        else
          IBQActAux.ParamByName('GI').Value := null;
        if Sirve(GC) then
          IBQActAux.ParamByName('GC').AsFloat := GC
        else
          IBQActAux.ParamByName('GC').Value := null;
        if Sirve(PCMA) then
          IBQActAux.ParamByName('PCMA').AsFloat := PCMA
        else
          IBQActAux.ParamByName('PCMA').Value := null;
        if Sirve(Pelado) then
        begin
          if Pelado = 'False' then
            IBQActAux.ParamByName('Pelado').AsString := 'N'
          else
            IBQActAux.ParamByName('Pelado').AsString := 'S';
        end
        else
          IBQActAux.ParamByName('Pelado').AsString := 'N';
        IBQActAux.ParamByName('id').AsInteger := IdAnimal;
        IBQActAux.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TFImpERA.CargarCalidadCarne(IdAnimal : Integer; Fecha, Peso, AOB, EG, GI, GC, PCMA, Pelado : Variant);
begin
  IBQVerificacion.Close;
  IBQVerificacion.SQL.Clear;
  IBQVerificacion.SQL.Add('select first 1 ee.id_evento from eve_eventos ee join eve_calidad_carne ecc on ee.id_evento = ecc.id_evento where ee.animal = :id');
  IBQVerificacion.ParamByName('id').AsInteger := IdAnimal;
  IBQVerificacion.Open;
  if IBQVerificacion.IsEmpty then
  begin
    try
      IBQCalidadCarne.Close;
      IBQCalidadCarne.ParamByName('Fecha').AsDate := Fecha;
      IBQCalidadCarne.ParamByName('Animal').AsInteger := IdAnimal;
      IBQCalidadCarne.ParamByName('Observacion').AsString := '';
      IBQCalidadCarne.ParamByName('Establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQCalidadCarne.ParamByName('Responsable').AsInteger := 0;
      IBQCalidadCarne.ParamByName('Log_Usuario').AsInteger := 1;
      IBQCalidadCarne.ParamByName('Log_Fecha_Modificado').AsDate := Today();
      {if Sirve(Peso) then
        IBQCalidadCarne.ParamByName('Peso').AsInteger := Peso
      else}
      IBQCalidadCarne.ParamByName('Peso').AsInteger := 0;
      IBQCalidadCarne.ParamByName('aob').Value := aob;
      IBQCalidadCarne.ParamByName('gc').Value := gc;
      IBQCalidadCarne.ParamByName('gi').Value := gi;
      IBQCalidadCarne.ParamByName('eg').Value := eg;
      IBQCalidadCarne.ParamByName('pcma').Value := pcma;
      if Sirve(Pelado) then
      begin
        if Pelado = 'False' then
          IBQCalidadCarne.ParamByName('Pelado').Value := 'N'
        else
          IBQCalidadCarne.ParamByName('Pelado').Value := 'S';
      end
      else
        IBQCalidadCarne.ParamByName('Pelado').Value := null;
      IBQCalidadCarne.ParamByName('Id_Grupo').Value := null;
      IBQCalidadCarne.ParamByName('Disparador').Value := null;
      IBQCalidadCarne.Open;
     // IBTHuella.CommitRetaining;
      Inc(CC);
      LCalidadCarne.Caption := '('+IntToStr(CC)+')';
    // end
    //   else
      //  MInformacion.Lines.Add('*** No se pudo agregar la Calidad de Carne del animal: '+RP+' por ser anterior a la fecha de nacimiento');
    //end;
    except
    //IBTHuella.RollbackRetaining;
    //  MInformacion.Lines.Add('*** No se pudo agregar la Calidad de Carne del animal '+RP);
    end;
  end
  else
  begin
    try
      IBQActCalidadCarne.Close;
      IBQActCalidadCarne.SQL.Clear;
      IBQActCalidadCarne.SQL.Add('update eve_eventos set fecha = :fecha where id_evento = :id');
      IBQActCalidadCarne.ParamByName('id').AsInteger := IBQVerificacion.FieldValues['id_evento'];
      IBQActCalidadCarne.ParamByName('fecha').AsDate := Fecha;
      IBQActCalidadCarne.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
    try
      IBQActCalidadCarne.Close;
      IBQActCalidadCarne.SQL.Clear;
      IBQActCalidadCarne.SQL.Add('update eve_calidad_carne set aob = :aob, gi = :gi, gc = :gc, eg = :eg, pcma = :pcma, pelado = :pelado where id_evento = :id');
      IBQActCalidadCarne.ParamByName('aob').Value := aob;
      IBQActCalidadCarne.ParamByName('gc').Value := gc;
      IBQActCalidadCarne.ParamByName('gi').Value := gi;
      IBQActCalidadCarne.ParamByName('eg').Value := eg;
      IBQActCalidadCarne.ParamByName('pcma').Value := pcma;
      IBQActCalidadCarne.ParamByName('id').Value := IBQVerificacion.FieldValues['id_evento'];
      IBQActCalidadCarne.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
    Inc(CC);
    LCalidadCarne.Caption := '('+IntToStr(CC)+')';
  end;
end;

function TFImpERA.VerificarDEP(Anio, ID : Integer; DEP : String; Valor : Variant) : Integer;
var
  res : Integer;
  fvalue : double;
begin
  IBQVerificacion.Close;
  IBQVerificacion.SQL.Clear;
  IBQVerificacion.SQL.Add('select '+DEP+' as DEP from tab_dep where animal = :id and anio = :anio');
  IBQVerificacion.ParamByName('id').AsInteger := ID;
  IBQVerificacion.ParamByName('anio').AsInteger := anio;
  IBQVerificacion.Open;

  try
    fvalue := VarAsType(Valor, varDouble)   ;
  except
    fvalue := 0;
  end;
  //SysUtils.DecimalSeparator := ',';
  if not IBQVerificacion.IsEmpty then
    if IBQVerificacion.FieldByName('DEP').AsFloat = fvalue then
      res := 0 //Son Iguales
    else
      res := -1//Son Diferentes
  else
    res := 1; //No Existe
  if (res = -1) or (res = 1) then
  begin
    try
      IBQActAux.Close;
      IBQActAux.SQL.Clear;
      if res = -1 then
        IBQActAux.SQL.Add('update aux_imp_era set act_rp = 1, '+DEP+'= :valor, act_'+DEP+'=1 where id_animal = :id')
      else
        IBQActAux.SQL.Add('update aux_imp_era set '+DEP+'= :valor, act_'+DEP+'=1 where id_animal = :id');
      IBQActAux.ParamByName('valor').Value := Valor;
      IBQActAux.ParamByName('id').Value := ID;
      IBQActAux.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

function TFImpERA.SirveDEP(Valor : Variant) : Boolean;
begin
  if Valor <> null then
  begin
    if VarType(Valor) = varString then
      Result := Trim(Valor) <> '';
    if (VarType(Valor) = varInteger) or (VarType(Valor) = varDouble) or (VarType(Valor) = varSmallint) or (VarType(Valor) = varSingle) or
       (VarType(Valor) = varCurrency) or (VarType(Valor) = varByte) or (VarType(Valor) = varWord) or (VarType(Valor) = varLongWord) or (VarType(Valor) = varInt64) then
      Result := true;
    if VarType(Valor) = varDate then
      Result := true;
  end
  else
    Result := false;
end;

function TFImpERA.VerificarNuevosDEPs(RP : String; Anio, IdAnimal : Integer; GESTDEP,NACERDEP,DESTDEP,LECHEDEP,FINALDEP,CEDEP,ALTURADEP,EGDDEP,EGCDEP,AOBDEP,PORGIDEP,PORCMDEP,
              GESTPREC,NACERPREC,DESTPREC,LECHEPREC,FINALPREC,CEPREC,ALTURAPREC,EGDPREC,EGCPREC,AOBPREC,PORGIPREC,PORCMPREC,Crias : Variant) : Integer;
var
  query : string;
  st : TStringList;
begin
if not SirveDEP(GESTDEP) and not SirveDEP(GESTDEP) and not SirveDEP(NACERDEP) and not SirveDEP(NACERPREC) and not SirveDEP(DESTDEP)
      and not SirveDEP(DESTPREC) and not SirveDEP(LECHEDEP) and not Sirve(LECHEPREC) and not SirveDEP(FINALDEP) and not Sirve(FINALPREC)
      and not SirveDEP(CEDEP) and not Sirve(CEPREC) and not  SirveDEP(ALTURADEP) and not  Sirve(ALTURAPREC) and not SirveDEP(EGDDEP)
      and not Sirve(EGDPREC) and not SirveDEP(EGCDEP) and not Sirve(EGCPREC) and not SirveDEP(AOBDEP) and not Sirve(AOBPREC)
      and not SirveDEP(PORGIDEP) and not Sirve(PORGIPREC) and not SirveDEP(PORCMDEP) and not Sirve(PORCMPREC) then
      Exit;
   IBQActAux.Close;
   IBQActAux.SQL.Clear;

 // GESTDEP , GESTPREC,  NACERDEP, NACERPREC,DESTDEP,DESTPREC,LECHEDEP,LECHEPREC,FINALDEP,FINALPREC;
 // CEDEP, CEPREC, ALTURADEP,ALTURAPREC,EGDDEP,EGDPREC,EGCDEP,EGCPREC,AOBDEP,AOBPREC,
 //PORGIDEP , PORGIPREC, PORCMDEP, PORCMPREC

   query := 'update aux_imp_era set '+
                ' GESTDEP=' + floatToStr(GESTDEP) + ', act_GESTDEP=1,'+
                ' GESTPREC=' + floatToStr(GESTPREC) + ', act_GESTPREC=1,'+
                ' NACERDEP=' + floatToStr(NACERDEP) + ', act_NACERDEP=1,'+
                ' NACERPREC=' + floatToStr(NACERPREC) + ', act_NACERPREC=1,'+
                ' DESTDEP=' + floatToStr(DESTDEP) + ', act_DESTDEP=1,'+
                ' DESTPREC=' + floatToStr(DESTPREC) + ', act_DESTPREC=1,'+
                ' LECHEDEP=' + floatToStr(LECHEDEP) + ', act_LECHEDEP=1,'+
                ' LECHEPREC=' + floatToStr(LECHEPREC) + ', act_LECHEPREC=1,'+
                ' FINALDEP=' + floatToStr(FINALDEP) + ', act_FINALDEP=1,'+
                ' FINALPREC=' + floatToStr(FINALPREC) + ', act_FINALPREC=1,'+
                ' CEDEP=' + floatToStr(CEDEP) + ', act_CEDEP=1,'+
                ' CEPREC=' + floatToStr(CEPREC) + ', act_CEPREC=1,'+
                ' ALTURADEP=' + floatToStr(ALTURADEP) + ', act_ALTURADEP=1,'+
                ' ALTURAPREC=' + floatToStr(ALTURAPREC) + ', act_ALTURAPREC=1,'+
                ' EGDDEP=' + floatToStr(EGDDEP) + ', act_EGDDEP=1,'+
                ' EGDPREC=' + floatToStr(EGDPREC) + ', act_EGDPREC=1,'+
                ' EGCDEP=' + floatToStr(EGCDEP) + ', act_EGCDEP=1,'+
               ' AOBDEP=' + floatToStr(AOBDEP) + ', act_AOBDEP=1,'+
               ' AOBPREC=' + floatToStr(AOBPREC) + ', act_AOBPREC=1,'+
               ' PORGIDEP=' + floatToStr(PORGIDEP) + ', act_PORGIDEP=1,'+
               ' PORCMDEP=' + floatToStr(PORCMDEP) + ', act_PORCMDEP=1,'+
               ' PORCMPREC=' + floatToStr(PORCMPREC) + ', act_PORCMPREC=1'+
             ' where id_animal = ' + intToStr(idAnimal);
  IBQActAux.SQL.Add(query);
   try
     IBQActAux.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining();
   end;
end;

function TFImpERA.VerificarDEPs(RP : String; Anio, IdAnimal : Integer; GESTDEP,NACERDEP,DESTDEP,LECHEDEP,FINALDEP,CEDEP,ALTURADEP,EGDDEP,EGCDEP,AOBDEP,PORGIDEP,PORCMDEP,
              GESTPREC,NACERPREC,DESTPREC,LECHEPREC,FINALPREC,CEPREC,ALTURAPREC,EGDPREC,EGCPREC,AOBPREC,PORGIPREC,PORCMPREC,Crias : Variant) : Integer;
begin
  if not SirveDEP(GESTDEP) and not SirveDEP(GESTDEP) and not SirveDEP(NACERDEP) and not SirveDEP(NACERPREC) and not SirveDEP(DESTDEP)
      and not SirveDEP(DESTPREC) and not SirveDEP(LECHEDEP) and not Sirve(LECHEPREC) and not SirveDEP(FINALDEP) and not Sirve(FINALPREC)
      and not SirveDEP(CEDEP) and not Sirve(CEPREC) and not  SirveDEP(ALTURADEP) and not  Sirve(ALTURAPREC) and not SirveDEP(EGDDEP)
      and not Sirve(EGDPREC) and not SirveDEP(EGCDEP) and not Sirve(EGCPREC) and not SirveDEP(AOBDEP) and not Sirve(AOBPREC)
      and not SirveDEP(PORGIDEP) and not Sirve(PORGIPREC) and not SirveDEP(PORCMDEP) and not Sirve(PORCMPREC) then
      Exit;

 { if SirveDEP(Crias) then
    VerificarDEP(Anio,IdAnimal,'Crias',Crias);}
  if SirveDEP(GESTDEP) then
    VerificarDEP(Anio,IdAnimal,'GESTDEP',GESTDEP);
  if Sirve(GESTPREC) then
    VerificarDEP(Anio,IdAnimal,'GESTPREC',GESTPREC);
  if SirveDEP(NACERDEP) then
    VerificarDEP(Anio,IdAnimal,'NACERDEP',NACERDEP);
  if Sirve(NACERPREC) then
    VerificarDEP(Anio,IdAnimal,'NACERPREC',NACERPREC);
  if SirveDEP(DESTDEP) then
    VerificarDEP(Anio,IdAnimal,'DESTDEP',DESTDEP);
  if Sirve(DESTPREC) then
    VerificarDEP(Anio,IdAnimal,'DESTPREC',DESTPREC);
  if SirveDEP(LECHEDEP) then
    VerificarDEP(Anio,IdAnimal,'LECHEDEP',LECHEDEP);
  if Sirve(LECHEPREC) then
    VerificarDEP(Anio,IdAnimal,'LECHEPREC',LECHEPREC);
  if SirveDEP(FINALDEP) then
    VerificarDEP(Anio,IdAnimal,'FINALDEP',FINALDEP);
  if Sirve(FINALPREC) then
    VerificarDEP(Anio,IdAnimal,'FINALPREC',FINALPREC);
  if SirveDEP(CEDEP) then
    VerificarDEP(Anio,IdAnimal,'CEDEP',CEDEP);
  if Sirve(CEPREC) then
    VerificarDEP(Anio,IdAnimal,'CEPREC',CEPREC);
  if SirveDEP(ALTURADEP) then
    VerificarDEP(Anio,IdAnimal,'ALTURADEP',ALTURADEP);
  if Sirve(ALTURAPREC) then
    VerificarDEP(Anio,IdAnimal,'ALTURAPREC',ALTURAPREC);
  if SirveDEP(EGDDEP) then
    VerificarDEP(Anio,IdAnimal,'EGDDEP',EGDDEP);
  if Sirve(EGDPREC) then
    VerificarDEP(Anio,IdAnimal,'EGDPREC',EGDPREC);
  if SirveDEP(EGCDEP) then
    VerificarDEP(Anio,IdAnimal,'EGCDEP',EGCDEP);
  if Sirve(EGCPREC) then
    VerificarDEP(Anio,IdAnimal,'EGCPREC',EGCPREC);
  if SirveDEP(AOBDEP) then
    VerificarDEP(Anio,IdAnimal,'AOBDEP',AOBDEP);
  if Sirve(AOBPREC) then
    VerificarDEP(Anio,IdAnimal,'AOBPREC',AOBPREC);
  if SirveDEP(PORGIDEP) then
    VerificarDEP(Anio,IdAnimal,'PORGIDEP',PORGIDEP);
  if Sirve(PORGIPREC) then
    VerificarDEP(Anio,IdAnimal,'PORGIPREC',PORGIPREC);
  if SirveDEP(PORCMDEP) then
    VerificarDEP(Anio,IdAnimal,'PORCMDEP',PORCMDEP);
  if Sirve(PORCMPREC) then
    VerificarDEP(Anio,IdAnimal,'PORCMPREC',PORCMPREC);

end;

procedure TFImpERA.CargarDEPs(Anio, IdAnimal : Integer; GESTDEP,NACERDEP,DESTDEP,LECHEDEP,FINALDEP,CEDEP,ALTURADEP,EGDDEP,EGCDEP,AOBDEP,PORGIDEP,PORCMDEP,
              GESTPREC,NACERPREC,DESTPREC,LECHEPREC,FINALPREC,CEPREC,ALTURAPREC,EGDPREC,EGCPREC,AOBPREC,PORGIPREC,PORCMPREC,Crias,Color : Variant);
var
  SQLStr, Inf, Aux : String;
begin
    IBQVerificacion.Close;
    IBQVerificacion.SQL.Clear;
    IBQVerificacion.SQL.Add('select * from tab_dep where anio = :anio and animal = :id');
    IBQVerificacion.ParamByName('anio').AsInteger := Anio;
    IBQVerificacion.ParamByName('id').AsInteger := IdAnimal;
    IBQVerificacion.Open;
    if IBQVerificacion.IsEmpty then
    begin
      try
        IBQDEPs.Close;
        IBQDEPs.ParamByName('Anio').AsInteger := Anio;
        IBQDEPs.ParamByName('Animal').AsInteger := IdAnimal;
        IBQDEPs.ParamByName('Tipo_Animal').AsString := 'I';
        IBQDEPs.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
        if Sirve(Color) then
        begin
          if Color = 'N' then
            IBQDEPs.ParamByName('FUENTE').Value := 2
          else
          begin
            if Color = 'C' then
              IBQDEPs.ParamByName('FUENTE').Value := 3
            else
              IBQDEPs.ParamByName('FUENTE').Value := null;
          end;
        end
        else
          IBQDEPs.ParamByName('FUENTE').Value := null;
        if SirveDEP(Crias) then
          IBQDEPs.ParamByName('CRIAS').Value := Crias
        else
          IBQDEPs.ParamByName('CRIAS').Value := null;
        IBQDEPs.ParamByName('RODEO').Value := 0;
        if SirveDEP(GESTDEP) then
          IBQDEPs.ParamByName('GESTDEP').Value := FormatoDEP(GESTDEP,Inf)
        else
          IBQDEPs.ParamByName('GESTDEP').Value := null;
        if Sirve(GESTPREC) then
          IBQDEPs.ParamByName('GESTPREC').Value := GESTPREC
        else
          IBQDEPs.ParamByName('GESTPREC').Value := null;
        if SirveDEP(NACERDEP) then
          IBQDEPs.ParamByName('NACERDEP').Value := FormatoDEP(NACERDEP,inf)
        else
          IBQDEPs.ParamByName('NACERDEP').Value := null;
        if Sirve(NACERPREC) then
          IBQDEPs.ParamByName('NACERPREC').Value := NACERPREC
        else
          IBQDEPs.ParamByName('NACERPREC').Value := null;
        if SirveDEP(DESTDEP) then
          IBQDEPs.ParamByName('DESTDEP').Value := FormatoDEP(DESTDEP,Inf)
        else
          IBQDEPs.ParamByName('DESTDEP').Value := null;
        if Sirve(DESTPREC) then
          IBQDEPs.ParamByName('DESTPREC').Value := DESTPREC
        else
          IBQDEPs.ParamByName('DESTPREC').Value := null;
        if SirveDEP(LECHEDEP) then
          IBQDEPs.ParamByName('LECHEDEP').Value := FormatoDEP(LECHEDEP,Inf)
        else
          IBQDEPs.ParamByName('LECHEDEP').Value := null;
        if Sirve(LECHEPREC) then
          IBQDEPs.ParamByName('LECHEPREC').Value := LECHEPREC
        else
          IBQDEPs.ParamByName('LECHEPREC').Value := null;
        if SirveDEP(FINALDEP) then
          IBQDEPs.ParamByName('FINALDEP').Value := FormatoDEP(FINALDEP,Inf)
        else
          IBQDEPs.ParamByName('FINALDEP').Value := null;
        if Sirve(FINALPREC) then
          IBQDEPs.ParamByName('FINALPREC').Value := FINALPREC
        else
          IBQDEPs.ParamByName('FINALPREC').Value := null;
        if SirveDEP(CEDEP) then
          IBQDEPs.ParamByName('CEDEP').Value := FormatoDEP(CEDEP,Inf)
        else
          IBQDEPs.ParamByName('CEDEP').Value := null;
        if Sirve(CEPREC) then
          IBQDEPs.ParamByName('CEPREC').Value := CEPREC
        else
          IBQDEPs.ParamByName('CEPREC').Value := null;
        if SirveDEP(ALTURADEP) then
          IBQDEPs.ParamByName('ALTURADEP').Value := FormatoDEP(ALTURADEP,Inf)
        else
          IBQDEPs.ParamByName('ALTURADEP').Value := null;
        if Sirve(ALTURAPREC) then
          IBQDEPs.ParamByName('ALTURAPREC').Value := ALTURAPREC
        else
          IBQDEPs.ParamByName('ALTURAPREC').Value := null;
        if SirveDEP(EGDDEP) then
          IBQDEPs.ParamByName('EGDDEP').Value := FormatoDEP(EGDDEP,Inf)
        else
          IBQDEPs.ParamByName('EGDDEP').Value := null;
        if Sirve(EGDPREC) then
          IBQDEPs.ParamByName('EGDPREC').Value := EGDPREC
        else
          IBQDEPs.ParamByName('EGDPREC').Value := null;
        if SirveDEP(EGCDEP) then
          IBQDEPs.ParamByName('EGCDEP').Value := FormatoDEP(EGCDEP,Inf)
        else
          IBQDEPs.ParamByName('EGCDEP').Value := null;
        if Sirve(EGCPREC) then
          IBQDEPs.ParamByName('EGCPREC').Value := EGCPREC
        else
          IBQDEPs.ParamByName('EGCPREC').Value := null;
        if SirveDEP(AOBDEP) then
          IBQDEPs.ParamByName('AOBDEP').Value := FormatoDEP(AOBDEP,Inf)
        else
          IBQDEPs.ParamByName('AOBDEP').Value := null;
        if Sirve(AOBPREC) then
          IBQDEPs.ParamByName('AOBPREC').Value := AOBPREC
        else
          IBQDEPs.ParamByName('AOBPREC').Value := null;
        if SirveDEP(PORGIDEP) then
          IBQDEPs.ParamByName('PORGIDEP').Value := FormatoDEP(PORGIDEP,Inf)
        else
          IBQDEPs.ParamByName('PORGIDEP').Value := null;
        if Sirve(PORGIPREC) then
          IBQDEPs.ParamByName('PORGIPREC').Value := PORGIPREC
        else
          IBQDEPs.ParamByName('PORGIPREC').Value := null;
        if SirveDEP(PORCMDEP) then
          IBQDEPs.ParamByName('PORCMDEP').Value := FormatoDEP(PORCMDEP,Inf)
        else
          IBQDEPs.ParamByName('PORCMDEP').Value := null;
        if Sirve(PORCMPREC) then
          IBQDEPs.ParamByName('PORCMPREC').Value := PORCMPREC
        else
          IBQDEPs.ParamByName('PORCMPREC').Value := null;
        IBQDEPs.Open;
        Inc(Deps);
        LDEPs.Caption := '('+IntToStr(Deps)+')';
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end
    else
    begin
      SQLStr := 'update tab_dep set ';
      if IBDSErrores.FieldByName('act_gestdep').AsInteger = 1 then
        SQLStr := SQLStr + ' gestdep = :gestdep, ';
      if IBDSErrores.FieldByName('act_nacerdep').AsInteger = 1 then
        SQLStr := SQLStr + ' nacerdep = :nacerdep, ';
      if IBDSErrores.FieldByName('act_destdep').AsInteger = 1 then
        SQLStr := SQLStr + ' destdep = :destdep, ';
      if IBDSErrores.FieldByName('act_lechedep').AsInteger = 1 then
        SQLStr := SQLStr + ' lechedep = :lechedep, ';
      if IBDSErrores.FieldByName('act_finaldep').AsInteger = 1 then
        SQLStr := SQLStr + ' finaldep = :finaldep, ';
      if IBDSErrores.FieldByName('act_cedep').AsInteger = 1 then
        SQLStr := SQLStr + ' cedep = :cedep, ';
      if IBDSErrores.FieldByName('act_alturadep').AsInteger = 1 then
        SQLStr := SQLStr + ' alturadep = :alturadep, ';
      if IBDSErrores.FieldByName('act_egddep').AsInteger = 1 then
        SQLStr := SQLStr + ' egddep = :egddep, ';
      if IBDSErrores.FieldByName('act_egcdep').AsInteger = 1 then
        SQLStr := SQLStr + ' egcdep = :egcdep, ';
      if IBDSErrores.FieldByName('act_aobdep').AsInteger = 1 then
        SQLStr := SQLStr + ' aobdep = :aobdep, ';
      if IBDSErrores.FieldByName('act_porgidep').AsInteger = 1 then
        SQLStr := SQLStr + ' porgidep = :porgidep, ';
      if IBDSErrores.FieldByName('act_porcmdep').AsInteger = 1 then
        SQLStr := SQLStr + ' porcmdep = :porcmdep, ';
      if IBDSErrores.FieldByName('act_gestprec').AsInteger = 1 then
        SQLStr := SQLStr + ' gestprec = :gestprec, ';
      if IBDSErrores.FieldByName('act_nacerprec').AsInteger = 1 then
        SQLStr := SQLStr + ' nacerprec = :nacerprec, ';
      if IBDSErrores.FieldByName('act_destprec').AsInteger = 1 then
        SQLStr := SQLStr + ' destprec = :destprec, ';
      if IBDSErrores.FieldByName('act_lecheprec').AsInteger = 1 then
        SQLStr := SQLStr + ' lecheprec = :lecheprec, ';
      if IBDSErrores.FieldByName('act_finalprec').AsInteger = 1 then
        SQLStr := SQLStr + ' finalprec = :finalprec, ';
      if IBDSErrores.FieldByName('act_ceprec').AsInteger = 1 then
        SQLStr := SQLStr + ' ceprec = :ceprec, ';
      if IBDSErrores.FieldByName('act_alturaprec').AsInteger = 1 then
        SQLStr := SQLStr + ' alturadep = :alturadep, ';
      if IBDSErrores.FieldByName('act_egdprec').AsInteger = 1 then
        SQLStr := SQLStr + ' egdprec = :egdprec, ';
      if IBDSErrores.FieldByName('act_egcprec').AsInteger = 1 then
        SQLStr := SQLStr + ' egcprec = :egcprec, ';
      if IBDSErrores.FieldByName('act_aobprec').AsInteger = 1 then
        SQLStr := SQLStr + ' aobprec = :aobprec, ';
      if IBDSErrores.FieldByName('act_porgiprec').AsInteger = 1 then
        SQLStr := SQLStr + ' porgiprec = :porgiprec, ';
      if IBDSErrores.FieldByName('act_porcmprec').AsInteger = 1 then
        SQLStr := SQLStr + ' porcmprec = :porcmprec, ';
      if IBDSErrores.FieldByName('act_crias').AsInteger = 1 then
        SQLStr := SQLStr + ' crias = :crias ';

      SQLStr := SQLStr+' where animal = :id and anio = :anio';
      Aux := StringReplace(SQLStr,',  where',' where',[]);
      if not AnsiContainsStr(Aux,'set  where') then
      begin
        try
          IBQActDEPs.Close;
          IBQActDEPs.SQL.Clear;
          IBQActDEPs.SQL.Add(Aux);
          if (IBQActDEPs.Params.FindParam('gestdep') <> nil) and (Sirve(GESTDEP)) then
            IBQActDEPs.ParamByName('gestdep').Value := FormatoDEP(GESTDEP,inf);
          if (IBQActDEPs.Params.FindParam('nacerdep') <> nil) and (Sirve(NACERDEP)) then
            IBQActDEPs.ParamByName('nacerdep').Value := FormatoDEP(NACERDEP,inf);
          if (IBQActDEPs.Params.FindParam('destdep') <> nil) and (Sirve(DESTDEP)) then
            IBQActDEPs.ParamByName('destdep').Value := FormatoDEP(DESTDEP,inf);
          if (IBQActDEPs.Params.FindParam('lechedep') <> nil) and (Sirve(LECHEDEP)) then
            IBQActDEPs.ParamByName('lechedep').Value := FormatoDEP(LECHEDEP,inf);
          if (IBQActDEPs.Params.FindParam('finaldep') <> nil) and (Sirve(FINALDEP)) then
            IBQActDEPs.ParamByName('finaldep').Value := FormatoDEP(FINALDEP,inf);
          if (IBQActDEPs.Params.FindParam('cedep') <> nil) and (Sirve(CEDEP)) then
            IBQActDEPs.ParamByName('cedep').Value := FormatoDEP(CEDEP,inf);
          if (IBQActDEPs.Params.FindParam('alturadep') <> nil) and (Sirve(ALTURADEP))then
            IBQActDEPs.ParamByName('alturadep').Value := FormatoDEP(ALTURADEP,inf);
          if (IBQActDEPs.Params.FindParam('egddep') <> nil) and (Sirve(EGDDEP)) then
            IBQActDEPs.ParamByName('egddep').Value := FormatoDEP(EGDDEP,inf);
          if (IBQActDEPs.Params.FindParam('egcdep') <> nil) and (Sirve(EGCDEP)) then
            IBQActDEPs.ParamByName('egcdep').Value := FormatoDEP(EGCDEP,inf);
          if (IBQActDEPs.Params.FindParam('aobdep') <> nil) and (Sirve(AOBDEP)) then
            IBQActDEPs.ParamByName('aobdep').Value := FormatoDEP(AOBDEP,inf);
          if (IBQActDEPs.Params.FindParam('porgidep') <> nil) and (Sirve(PORGIDEP)) then
            IBQActDEPs.ParamByName('porgidep').Value := FormatoDEP(PORGIDEP,inf);
          if (IBQActDEPs.Params.FindParam('porcmdep') <> nil) and (Sirve(PORCMDEP)) then
            IBQActDEPs.ParamByName('porcmdep').Value := FormatoDEP(PORCMDEP,inf);
          if (IBQActDEPs.Params.FindParam('gestprec') <> nil) and (Sirve(GESTPREC)) then
            IBQActDEPs.ParamByName('gestprec').Value := GESTPREC;
          if (IBQActDEPs.Params.FindParam('nacerprec') <> nil) and (Sirve(NACERPREC)) then
            IBQActDEPs.ParamByName('nacerprec').Value := NACERPREC;
          if (IBQActDEPs.Params.FindParam('destprec') <> nil) and (Sirve(DESTPREC)) then
            IBQActDEPs.ParamByName('destprec').Value := DESTPREC;
          if (IBQActDEPs.Params.FindParam('lecheprec') <> nil) and (Sirve(LECHEPREC)) then
            IBQActDEPs.ParamByName('lecheprec').Value := LECHEPREC;
          if (IBQActDEPs.Params.FindParam('finalprec') <> nil) and (Sirve(FINALPREC)) then
            IBQActDEPs.ParamByName('finalprec').Value := FINALPREC;
          if (IBQActDEPs.Params.FindParam('ceprec') <> nil) and (Sirve(CEPREC)) then
            IBQActDEPs.ParamByName('ceprec').Value := CEPREC;
          if (IBQActDEPs.Params.FindParam('alturaprec') <> nil) and (Sirve(ALTURAPREC)) then
            IBQActDEPs.ParamByName('alturadep').Value := ALTURAPREC;
          if (IBQActDEPs.Params.FindParam('egdprec') <> nil) and (Sirve(EGDPREC)) then
            IBQActDEPs.ParamByName('egdprec').Value := EGDPREC;
          if (IBQActDEPs.Params.FindParam('egcprec') <> nil) and (Sirve(EGCPREC)) then
            IBQActDEPs.ParamByName('egcprec').Value  := EGCPREC;
          if (IBQActDEPs.Params.FindParam('aobprec') <> nil) and (Sirve(AOBPREC)) then
            IBQActDEPs.ParamByName('aobprec').Value := AOBPREC;
          if (IBQActDEPs.Params.FindParam('porgiprec') <> nil) and (Sirve(PORGIPREC)) then
            IBQActDEPs.ParamByName('porgiprec').Value := PORGIPREC;
          if (IBQActDEPs.Params.FindParam('porcmprec') <> nil) and (Sirve(PORCMPREC)) then
            IBQActDEPs.ParamByName('porcmprec').Value := PORCMPREC;
          if (IBQActDEPs.Params.FindParam('crias') <> nil) and (Sirve(CRIAS)) then
            IBQActDEPs.ParamByName('crias').Value := CRIAS;
          IBQActDEPs.ParamByName('id').AsInteger := IdAnimal;
          IBQActDEPs.ParamByName('anio').AsInteger := Anio;
          IBQActDEPs.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
        Inc(Deps);
        LDEPs.Caption := '('+IntToStr(Deps)+')';
      end;
    end;
end;

function TFImpERA.FormatoDEP(Valor : String; var inf : String) : Variant;
var
  I, K : Integer;
  Val, ind : Integer;
  Num, NuevoNum, Valido : String;
  Vald : Double;
  Separador, Otro : String;
begin
  Separador := SysUtils.DecimalSeparator;
  if Separador = ',' then
    Otro := '.'
  else
    Otro := ',';
  inf := '';
  for I := 1 to Length(Valor) do
    if tryStrToInt(Valor[I],Val) then
    begin
      ind := I;
      break;
    end;
  if I > 2 then
    inf := ' *** Formato de DEP no valido ('+Valor+')';
  for K := ind to Length(Valor) do
    Num := Num+Valor[K];

  NuevoNum := StringReplace(Num,Otro,Separador,[]);
  Valido := StringReplace(Valor,Otro,Separador,[]);
  if tryStrToFloat(NuevoNum,Vald) then
  begin
    if StrToFloat(Valido) > 0 then
      Result := {Valor[1]+}NuevoNum
    else
      Result := Valor[1]+NuevoNum;
    if inf <> '' then
      inf := inf+' - Se modifico el valor del DEP para poder cargarlo ('+Valor[1]+NuevoNum+')';
  end
  else
  begin
    if inf <> '' then
      inf := inf+' - No se pudo modificar el valor del DEP, no se cargara el mismo';
    Result := null;
  end;
end;

function TFImpERA.VerificarDatos : Boolean;
var
  ID, Cantidad : Integer;
  I : Integer;
begin
  //VKDBF.First;
  try
    IBDSErrores.Close;
    IBDSErrores.selectSQL.Clear;
    IBDSErrores.selectSQL.Add('select * from aux_imp_era');
    IBDSErrores.Open;
  except
  end;

  BDBGInconsistencia.DataSource := nil;
  Cantidad := 0;
  //PBAvance.Max := VKDBF.RecordCount;
  PBAvance.Max := CantFila;
  PBAvance.Position := 0;
  LEstado.Caption := 'Verificando Datos';

  DBGERA.DataSource := nil;

  Result := false;

  {while not VKDBF.Eof do
  begin
    ID := BuscarAnimal(VKDBF.FieldByName('RP_CRIA'),VKDBF.FieldByName('HBA_CRIA'),VKDBF.FieldByName('F_NAC_CRIA'),
                 VKDBF.FieldByName('SEXO_CRIA'),VKDBF.FieldByName('COLOR_CRIA'));
    if ID <> -1 then
    begin
      Result := true;
      AgregarAnimal(ID);
      LEstado.Caption := 'Verificando Datos de ERA - RP: '+VKDBF.FieldByName('RP_CRIA').AsString;
      VerificarPeso(RPGral,ID,VKDBF.FieldByName('F_NAC_CRIA'),VKDBF.FieldByName('F_NAC_CRIA'),VKDBF.FieldByName('PESO_NAC'),'N');
      VerificarPeso(RPGral,ID,VKDBF.FieldByName('F_NAC_CRIA'),VKDBF.FieldByName('FECHA_DEST'),VKDBF.FieldByName('PESO_DESTE'),'D');
      VerificarPeso(RPGral,ID,VKDBF.FieldByName('F_NAC_CRIA'),VKDBF.FieldByName('FECHA_ANIO'),VKDBF.FieldByName('PESO_ANIO'),'A');
      VerificarPeso(RPGral,ID,VKDBF.FieldByName('F_NAC_CRIA'),VKDBF.FieldByName('FECHA_18'),VKDBF.FieldByName('PESO_18'),'T');
      VerificarCE(RPGral,ID,VKDBF.FieldByName('F_NAC_CRIA'),VKDBF.FieldByName('FECHA_CE'),VKDBF.FieldByName('CE'));
      VerificarFrame(RPGral,ID,VKDBF.FieldByName('F_NAC_CRIA'),VKDBF.FieldByName('FECHA_ALZA'),VKDBF.FieldByName('F_NAC_CRIA'),VKDBF.FieldByName('ALZADA'),VKDBF.FieldByName('FRAME'));
      VerificarCalidadCarne(RPGral,ID,VKDBF.FieldByName('F_NAC_CRIA'),VKDBF.FieldByName('FECHA_ECOG'),VKDBF.FieldByName('PESO_ECOGR')
                           ,VKDBF.FieldByName('AREA_OJO_B'),VKDBF.FieldByName('ESPESOR_GR'),VKDBF.FieldByName('GRASA_INTR')
                           ,VKDBF.FieldByName('GRASA_CADE'),VKDBF.FieldByName('PCMA'),VKDBF.FieldByName('PELADO'));
      VerificarDEPs(RPGral,Anio,ID,VKDBF.FieldByName('DLG'),VKDBF.FieldByName('DN'),VKDBF.FieldByName('DD'),VKDBF.FieldByName('DM'),
           VKDBF.FieldByName('DF'),VKDBF.FieldByName('DC'),VKDBF.FieldByName('DAL'),VKDBF.FieldByName('DGD'),
           VKDBF.FieldByName('DGC'),VKDBF.FieldByName('DAOB'),VKDBF.FieldByName('DGI'),VKDBF.FieldByName('DPCM'),
           VKDBF.FieldByName('PLG'),VKDBF.FieldByName('PN'),VKDBF.FieldByName('PD'),VKDBF.FieldByName('PM'),
           VKDBF.FieldByName('PF'),VKDBF.FieldByName('PC'),VKDBF.FieldByName('PAL'),VKDBF.FieldByName('PGD'),
           VKDBF.FieldByName('PGC'),VKDBF.FieldByName('PAOB'),VKDBF.FieldByName('PGI'),VKDBF.FieldByName('PPCM'),
           VKDBF.FieldByName('CRIAS'));
      Inc(Cantidad);
    end
    //else
      //showmessage(VKDBF.FieldByName('RP_CRIA').AsString);
    LCant.Caption := IntToStr(Cantidad) + ' animales';
    PBAvance.Position := PBAvance.Position + 1;
    PBAvance.Update;
    Application.ProcessMessages;
    VKDBF.Next;
  end;  }

  for I := 0 to Length(Animales)-1 do
  begin
    ID := BuscarAnimal(Animales[i].RP,Animales[I].hba_cria,Animales[i].fnac_cria,
                       Animales[i].sexo_cria,Animales[i].color_cria,Animales[i].Raza);
    if ID <> -1 then
    begin
      Result := true;
      AgregarAnimal(ID,I);
      LEstado.Caption := 'Verificando Datos - RP: '+Animales[i].RP;
      VerificarPeso(RPGral,ID,Animales[i].fnac_cria,Animales[i].fnac_cria,Animales[i].peso_nac,'N');
      VerificarPeso(RPGral,ID,Animales[i].fnac_cria,Animales[i].fecha_dest,Animales[i].peso_dest,'D');
      VerificarPeso(RPGral,ID,Animales[i].fnac_cria,Animales[i].fecha_anio,Animales[i].peso_anio,'A');
      VerificarPeso(RPGral,ID,Animales[i].fnac_cria,Animales[i].fecha_18,Animales[i].peso_18,'T');
      VerificarCE(RPGral,ID,Animales[i].fnac_cria,Animales[i].fecha_ce,Animales[i].ce);
      VerificarFrame(RPGral,ID,Animales[i].fnac_cria,Animales[i].fecha_alzada,Animales[i].fnac_cria,Animales[i].alzada,Animales[i].frame);
      VerificarCalidadCarne(RPGral,ID,Animales[i].fnac_cria,Animales[i].fecha_ecog,Animales[i].peso_ecog,Animales[i].aob,Animales[i].espesor_gr,
                            Animales[i].grasa_intr,Animales[i].grasa_cade,Animales[i].pcma,Animales[i].pelado);
      VerificarNuevosDEPs(RPGral,Anio,ID,Animales[i].dlg,Animales[i].dn,Animales[i].dd,Animales[i].dm,
           Animales[i].df,Animales[i].dc,Animales[i].dal,Animales[i].dgd,
           Animales[i].dgc,Animales[i].daob,Animales[i].dgi,Animales[i].dpcm,
           Animales[i].plg,Animales[i].pn,Animales[i].pd,Animales[i].pm,
           Animales[i].pf,Animales[i].pc,Animales[i].pal,Animales[i].pgd,
           Animales[i].pgc,Animales[i].paob,Animales[i].pgi,Animales[i].ppcm,
           Animales[i].crias);
      Inc(Cantidad);
    end;
    //else
      //showmessage(VKDBF.FieldByName('RP_CRIA').AsString);
    LCant.Caption := IntToStr(Cantidad) + ' animales';
    PBAvance.Position := PBAvance.Position + 1;
    PBAvance.Update;
    Application.ProcessMessages;
  end;
end;

procedure TFImpERA.CargarDatos;
var rpmadre, razamadre, fenacmadre, colormadre, hbamadre, rprecep, fenacrecep, razarecep,
    rppadre, hbapadre, razapadre, anionacpadre, colorpadre, tipo_p, tipo_m, tipo_rec : string;
    id_madre_ext, id_padre, id_recep, id_madre, id_semen, id_servicio : integer;
    Aux : TField;
    TR, tipoServ : string;
    i : integer;
    grupoIA, grupoSN, grupoTE: integer;
begin

  grupoIA:=0;
  grupoSN:=0;
  grupoTE:=0;

  tipoServ:= IBDSErrores.FieldValues['TIPO_SERVICIO'];

  LEstado.Caption := 'Cargando Datos';

  IImportar.Enabled := false;
  LImportar.Enabled := false;
  ISalir.Enabled := false;
  LSalir.Enabled := false;

  cant_m := 0;
  cant_p := 0;

  BDBGInconsistencia.DataSource := nil;
  IBDSErrores.Close;
  IBDSErrores.selectSQL.Clear;
  IBDSErrores.selectSQL.Add('select * from aux_imp_era');
  IBDSErrores.Open;
  IBDSErrores.Last;
  IBDSErrores.First;
  BCargar.Enabled := false;

  PBAvance.Position := 0;
  PBAvance.Max := IBDSErrores.RecordCount;
  PBAvance.Update;
  Application.ProcessMessages;

  i := 0;
  while not IBDSErrores.Eof do
  begin
   try

      //if (i=425) or (i=500) or (i=1000) or (i=1500) or (i=2000) then
      //if (i=1150) then
      //  showmessage (inttostr(i));

      fenacrecep := '';
      fenacMadre := '';
      LEstado.Caption := 'Cargando Datos - RP: '+IBDSErrores.FieldByName('rp').AsString;
      if CBPesoN.Checked then
        if (IBDSErrores.FieldByName('act_peso_n').AsInteger = 1) or (IBDSErrores.FieldByName('act_fecha_peso_n').AsInteger = 1) then
          CargarPesos(IBDSErrores.FieldValues['id_animal'],IBDSErrores.FieldByName('act_rp').AsInteger,IBDSErrores.FieldByName('act_fecha_peso_n').AsInteger,IBDSErrores.FieldByName('act_peso_n').AsInteger,IBDSErrores.FieldByName('fecha_peso_n').Value,IBDSErrores.FieldByName('peso_n').Value,'N');
      if CBPesoD.Checked then
        if (IBDSErrores.FieldByName('act_peso_d').AsInteger = 1) or (IBDSErrores.FieldByName('act_fecha_peso_d').AsInteger = 1) then
          CargarPesos(IBDSErrores.FieldValues['id_animal'],IBDSErrores.FieldByName('act_rp').AsInteger,IBDSErrores.FieldByName('act_fecha_peso_d').AsInteger,IBDSErrores.FieldByName('act_peso_d').AsInteger,IBDSErrores.FieldByName('fecha_peso_d').Value,IBDSErrores.FieldByName('peso_d').Value,'D');
      if (CBPesoA.Checked) then
        if (IBDSErrores.FieldByName('act_peso_a').AsInteger = 1) or (IBDSErrores.FieldByName('act_fecha_peso_a').AsInteger = 1) then
          CargarPesos(IBDSErrores.FieldValues['id_animal'],IBDSErrores.FieldByName('act_rp').AsInteger,IBDSErrores.FieldByName('act_fecha_peso_a').AsInteger,IBDSErrores.FieldByName('act_peso_a').AsInteger,IBDSErrores.FieldByName('fecha_peso_a').Value,IBDSErrores.FieldByName('peso_a').Value,'A');
      if (CBPesoT.Checked) then
        if (IBDSErrores.FieldByName('act_peso_18').AsInteger = 1) or (IBDSErrores.FieldByName('act_fecha_peso_18').AsInteger = 1) then
          CargarPesos(IBDSErrores.FieldValues['id_animal'],IBDSErrores.FieldByName('act_rp').AsInteger,IBDSErrores.FieldByName('act_fecha_peso_18').AsInteger,IBDSErrores.FieldByName('act_peso_18').AsInteger,IBDSErrores.FieldByName('fecha_peso_18').Value,IBDSErrores.FieldByName('peso_18').Value,'T');
      if (CBCE.Checked) then
        if (IBDSErrores.FieldByName('act_ce').AsInteger = 1) or (IBDSErrores.FieldByName('act_fecha_ce').AsInteger = 1) then
          CargarCE(IBDSErrores.FieldValues['id_animal'],IBDSErrores.FieldByName('act_rp').AsInteger,IBDSErrores.FieldByName('act_fecha_ce').AsInteger,IBDSErrores.FieldByName('act_ce').AsInteger,IBDSErrores.FieldByName('fecha_ce').Value,IBDSErrores.FieldByName('ce').Value);
      if (CBMedicionF.Checked) then
        if ((IBDSErrores.FieldByName('act_frame').AsInteger = 1) and (IBDSErrores.FieldByName('act_altura').AsInteger = 1)) or (IBDSErrores.FieldByName('act_fecha_altura').AsInteger = 1) then
          CargarFrame(IBDSErrores.FieldValues['id_animal'],IBDSErrores.FieldByName('act_rp').AsInteger,IBDSErrores.FieldByName('act_fecha_altura').AsInteger,IBDSErrores.FieldByName('altura').AsInteger,IBDSErrores.FieldByName('frame').AsInteger,IBDSErrores.FieldByName('fecha_nac').Value,IBDSErrores.FieldByName('fecha_altura').Value,IBDSErrores.FieldByName('altura').Value,IBDSErrores.FieldByName('frame').Value);
      if (CBCalidadCarne.Checked) then
        if (IBDSErrores.FieldByName('fecha_peso_ecog').Value <> null) then
          CargarCalidadCarne(IBDSErrores.FieldValues['id_animal'],IBDSErrores.FieldByName('fecha_peso_ecog').Value,IBDSErrores.FieldByName('peso_ecog').Value,IBDSErrores.FieldByName('aob').Value,IBDSErrores.FieldByName('eg').Value,IBDSErrores.FieldByName('gi').Value,IBDSErrores.FieldByName('gc').Value,IBDSErrores.FieldByName('pcma').Value,IBDSErrores.FieldByName('pelado').Value);
      if (CBDEPs.Checked) then
        CargarDEPs(Anio,IBDSErrores.FieldValues['id_animal'],IBDSErrores.FieldByName('gestdep').Value,IBDSErrores.FieldByName('nacerdep').Value,IBDSErrores.FieldByName('destdep').Value,
                   IBDSErrores.FieldByName('lechedep').Value,IBDSErrores.FieldByName('finaldep').Value,IBDSErrores.FieldByName('cedep').Value,IBDSErrores.FieldByName('alturadep').Value,IBDSErrores.FieldByName('egddep').Value,
                   IBDSErrores.FieldByName('egcdep').Value,IBDSErrores.FieldByName('aobdep').Value,IBDSErrores.FieldByName('porgidep').Value,IBDSErrores.FieldByName('porcmdep').Value,IBDSErrores.FieldByName('gestprec').Value,
                   IBDSErrores.FieldByName('nacerprec').Value,IBDSErrores.FieldByName('destprec').Value,IBDSErrores.FieldByName('lecheprec').Value,IBDSErrores.FieldByName('finalprec').Value,IBDSErrores.FieldByName('ceprec').Value,
                   IBDSErrores.FieldByName('alturaprec').Value,IBDSErrores.FieldByName('egdprec').Value,IBDSErrores.FieldByName('egcprec').Value,IBDSErrores.FieldByName('aobprec').Value,IBDSErrores.FieldByName('porgiprec').Value,
                   IBDSErrores.FieldByName('porcmprec').Value,IBDSErrores.FieldByName('crias').Value,IBDSErrores.FieldByName('color').Value);
//----------------------------------------------------------------------------------------------------------------------

      if (CBTipificSanguinea.Checked) then
          CargarTipificacionSanguinea(IBDSErrores.FieldValues['id_animal'],IBDSErrores.FieldValues['TIPIFIC_SANGUINEA']    );

{    PENDIENTE NO ENCONTRAMOS LA COLUMNA DE ADN EN LA PLANILLA
      if (CBADN.Checked) then
          CargarADN(IBDSErrores.FieldValues['id_animal'],IBDSErrores.FieldValues['ADN']);
}
      // Paso los datos a String
      //MADRE
      if (varIsnull( animales[i].rp_md)) then rpmadre := '' else rpmadre := Trim(animales[i].rp_md);
      if (varIsnull( animales[i].hba_md)) then hbamadre := '' else hbamadre := Trim(animales[i].hba_md);
      if (varIsnull( animales[i].raza)) then razamadre := '' else razamadre := Trim(animales[i].raza);
      if (varIsnull( animales[i].TR)) then TR := '' else TR := Trim(animales[i].TR);
      if (varIsnull( animales[i].color_md)) then colormadre := '' else colormadre := Trim(animales[i].color_md);
      if IBDSErrores.FieldValues['FENAC_MADRE'] <> null then  fenacmadre := Trim(IBDSErrores.FieldValues['FENAC_MADRE'])
                                                         else    fenacmadre := '';
      //PADRE
      if (varIsnull( animales[i].rp_pd)) then rppadre := '' else rppadre := Trim(animales[i].rp_pd);
      if (varIsnull( animales[i].hba_pd)) then hbapadre := '' else hbapadre := Trim(animales[i].hba_pd);
      if (varIsnull( animales[i].raza)) then razapadre := '' else razapadre := Trim(animales[i].raza);
      if (varIsnull( animales[i].color_pd)) then colorPadre := '' else colorPadre := Trim(animales[i].color_pd);
      if IBDSErrores.FieldValues['ANIO_NAC_PADRE'] <> null then anionacpadre := Trim(IBDSErrores.FieldValues['ANIO_NAC_PADRE'])
                                                           else    anionacpadre := '';
      // MADRE RECEPTORA
      if ((IBDSErrores.FieldValues['RP_RECEP'] <> Null)) then rprecep := Trim(IBDSErrores.FieldValues['RP_RECEP']);
      // Si no esta definida, toma la de la cria
      if (varIsNull(animales[i].raza_rec) ) then razarecep := trim(animales[i].Raza)
                                                          else razarecep := Trim(animales[i].raza_rec);
      if IBDSErrores.FieldValues['FENAC_RECEP'] <> null then  fenacrecep := Trim(IBDSErrores.FieldValues['FENAC_RECEP'])
                                                        else fenacrecep := '';

      // si no tiene un servicio valido
      if  ( (IBDSErrores.FieldValues['FECHA_SERVICIO'] = Null) or
              varIsNull (animales[i].tipo_serv) or  (animales[i].tipo_serv ='') )  then
      begin
        tipo_m := '';
        if ((IBDSErrores.FieldValues['RP_MADRE'] <> Null)) then
        begin
            //Busca la Madre
            id_madre := BuscarMadre(rpmadre,Animales[i].hba_md,fenacMadre,tipoServ, tipo_m);
            //si no existe, deberia ser Externa
            if (id_madre = -1) then
            begin
              id_madre := CargarMadreExterna(rpMadre, Animales[i].Raza, fenacMadre, colorMadre, hbamadre, Animales[i].nombre_md,Animales[i].apodo_md);
              tipo_m := 'E';
            end;
        end
        else
          id_madre := -1;

        tipo_p := '';
      // PADRE
      if ((IBDSErrores.FieldValues['RP_PADRE'] <> Null)) then
      begin
         id_padre := BuscarPadre(rppadre,Animales[i].hba_pd,'01/01/'+anionacpadre,tipoServ,tipo_p);
            if id_padre = -1 then
            begin
              tipo_p := 'E';
              id_padre := CargarPadreExterno(rpPadre, hbapadre, Animales[i].Raza, anionacpadre, colorpadre,Animales[i].apodo_pd );
            end;
      end
      else
          id_padre := -1;

      ActualizarPadres(id_madre,id_padre,IBDSErrores.FieldValues['id_animal'],tipo_p,tipo_m, null);

      if (rprecep<>'') then
        begin
           id_recep := BuscarMadre(rprecep,'' ,fenacrecep,tipoServ,tipo_m );
            if id_recep = -1 then
            begin
              if  (IBDSErrores.FieldValues['FECHA_SERVICIO'] <> Null) then
                id_recep :=  CargarReceptora( IBDSErrores.FieldValues['FECHA_SERVICIO'], rpRecep, razaRecep, fenacrecep)
             else
             id_recep :=  CargarReceptora('0', rpRecep, razaRecep, fenacrecep) ;

       //       CargarMadreExterna(rprecep, razarecep, fenacrecep, '', '','');
              tipo_rec := 'E';
            end;
       end;
   end
   else
     // Si tengo un servicio, uso esos datos
     if (IBDSErrores.FieldValues['FECHA_SERVICIO'] <> Null) then
     begin
          if (IBDSErrores.FieldValues['TIPO_SERVICIO'] = 'SN') then
          begin
              id_padre := BuscarPadre(rpPadre,Animales[i].hba_pd,'01/01/'+anioNacPadre ,tipoServ, tipo_p);
              if id_padre = -1 then
                 id_padre := CargarAnimalInterno(rpPadre, razaPadre, anioNacPadre, hbaPadre, colorPadre, TR,animales[i].apodo_pd,animales[i].apodo_pd,'1');

              id_madre := BuscarMadre(rpMadre,Animales[i].hba_md,feNacMadre,tipoServ,tipo_m);
              if id_madre = -1 then
                 id_madre := CargarAnimalInterno(rpMadre, razaMadre, feNacMadre, hbaMadre, colorMadre , TR,animales[i].nombre_md,animales[i].apodo_md,'2');


                 //CREO EL GRUPO, IMPORTACION DE DEPS; IVAN

              if (grupoSN=0) and (id_madre<>-1) then
                begin
                  IBQCrearGrupo.Close;
                  IBQCrearGrupo.ParamByName('ESTABLECIMIENTO').Value :=FPrincipal.EstablecimientoActual;
                  IBQCrearGrupo.ParamByName('NOMBREGRUPO').Value := 'Servicio Natural por Importación';
                  IBQCrearGrupo.ParamByName('DESCRIPCIONGRUPO').Value := 'Grupo Auto';
                  IBQCrearGrupo.ParamByName('TIPO').Value :='S';
                  IBQCrearGrupo.ParamByName('TIPO_EVENTO').Value := 20;
                  IBQCrearGrupo.ParamByName('NRO_DTE').Value := 0;
                  IBQCrearGrupo.ParamByName('PATH_DTE').Value := '';
                  IBQCrearGrupo.Open;
                  grupoSN := IBQCrearGrupo.FieldValues['IDNUEVOGRUPO'];
                  FPrincipal.IBTPrincipal.CommitRetaining;
               end;

              //FIN CREACION GRUPO
              if (id_madre<>-1) then
                CargarServicioNatural(IBDSErrores.FieldValues['FECHA_SERVICIO'], id_padre, id_madre, grupoSN);
              tipo_p := 'I';

              ActualizarPadres(id_madre,id_padre,IBDSErrores.FieldValues['id_animal'],'I', 'I',null);
          end
          else
          if ((IBDSErrores.FieldValues['TIPO_SERVICIO'] = 'TE') and (rpRecep <> ''))then
          begin

              id_padre := BuscarPadre(rpPadre,Animales[i].hba_pd,'01/01/'+anioNacPadre,tipoServ,tipo_p);
              if id_padre = -1 then
                    id_padre := CargarPadreExterno(rpPadre, hbaPadre, Animales[i].Raza, anioNacPadre, colorPadre,Animales[i].apodo_pd);

             id_recep := BuscarMadre(rpRecep,'',fenacrecep,tipoServ, tipo_m);
              if id_recep = -1 then
              begin
                if  (IBDSErrores.FieldValues['FECHA_SERVICIO'] <> Null) then
                       id_recep := CargarReceptora(IBDSErrores.FieldValues['FECHA_SERVICIO'], rpRecep, razaRecep, fenacrecep)
                else
                    id_recep := CargarReceptora('0', rpRecep, razaRecep, fenacrecep);
              end;

              id_madre_ext := BuscarMadre(rpMadre,Animales[i].hba_md,feNacMadre,tipoServ, tipo_m);
              if id_madre_ext = -1 then
                  id_madre_ext := CargarMadreExterna(rpMadre, Animales[i].Raza, fenacMadre, colorMadre, hbamadre,Animales[i].nombre_md,Animales[i].apodo_md);

               //CREO EL GRUPO, IMPORTACION DE DEPS; IVAN

              if (grupoTE=0) and (id_recep<>-1) then
                begin
                  IBQCrearGrupo.Close;
                  IBQCrearGrupo.ParamByName('ESTABLECIMIENTO').Value :=FPrincipal.EstablecimientoActual;
                  IBQCrearGrupo.ParamByName('NOMBREGRUPO').Value := 'Transferencia Embrionaria por Importación';
                  IBQCrearGrupo.ParamByName('DESCRIPCIONGRUPO').Value := 'Grupo Auto';
                  IBQCrearGrupo.ParamByName('TIPO').Value :='S';
                  IBQCrearGrupo.ParamByName('TIPO_EVENTO').Value := 48;
                  IBQCrearGrupo.ParamByName('NRO_DTE').Value := 0;
                  IBQCrearGrupo.ParamByName('PATH_DTE').Value := '';
                  IBQCrearGrupo.Open;
                  grupoTE := IBQCrearGrupo.FieldValues['IDNUEVOGRUPO'];
                  FPrincipal.IBTPrincipal.CommitRetaining;
               end;

              //FIN CREACION GRUPO
               if (id_madre_ext<>-1) and (id_recep<>-1) then
                  CargarServicioTranferenciaEmbrionaria(IBDSErrores.FieldValues['FECHA_SERVICIO'], id_madre_ext, id_padre, id_recep, grupoTE, tipo_m);

              tipo_p := 'E';

              ActualizarPadres(id_madre_ext,id_padre,IBDSErrores.FieldValues['id_animal'],'E', tipo_m,id_recep);


//              *.*.* CARGO FLUSHING Y RECOLECCION EMBRIONARIA
              IBSPFlushing.ParamByName('fecha').AsDate := IBDSErrores.FieldValues['FECHA_SERVICIO'];
              IBSPFlushing.ParamByName('animal').AsInteger := id_madre_ext;
              IBSPFlushing.ParamByName('observacion').AsString := 'Colecta Embrionaria de Importacion';
              IBSPFlushing.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
              IBSPFlushing.ParamByName('responsable').AsInteger := 0;
              IBSPFlushing.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
              IBSPFlushing.ParamByName('log_fecha_modificado').AsDate := Now();
              IBSPFlushing.ParamByName('id_grupo').AsInteger := grupoTE;
              IBSPFlushing.ParamByName('disparador').Value := null;
              IBSPFlushing.ParamByName('cant_embriones').AsInteger := 1;
              IBSPFlushing.ParamByName('precio').AsFloat := 0;
              IBSPFlushing.ParamByName('centro_transplante').AsInteger := 0;
              IBSPFlushing.ParamByName('sin_fertilizar').AsInteger := 0;
              IBSPFlushing.ParamByName('degenerados').AsInteger := 0;
              IBSPFlushing.ExecProc;


          end
          else
          if (IBDSErrores.FieldValues['TIPO_SERVICIO'] = 'IA') then
          begin

              id_padre := BuscarPadre(rpPadre,Animales[i].hba_pd,'01/01/'+anioNacPadre,tipoServ,tipo_p);
              if id_padre = -1 then
                  begin
                     id_padre := CargarPadreExterno(rpPadre, hbaPadre, razaPadre, anioNacPadre, colorPadre,Animales[i].apodo_pd);
                     tipo_p:= 'E';
                  end;

              id_semen := BuscarSemen(id_padre, tipo_p);
              if id_Semen = -1 then
                 id_semen := CargarSemen(IBDSErrores.FieldValues['FECHA_SERVICIO'], id_padre, tipo_p);

              id_madre := BuscarMadre(rpMadre,Animales[i].hba_md,feNacMadre,tipoServ,tipo_m);
              if id_madre = -1 then
                  begin
                    id_madre := CargarAnimalInterno(rpMadre, razaMadre, feNacMadre, hbaMadre, colorMadre, TR,animales[i].nombre_md,animales[i].apodo_md,'2');
                    tipo_m:='I';
              end;
              //CREO EL GRUPO, IMPORTACION DE DEPS; IVAN

              if (grupoIA=0) and (id_madre<>-1) then
                begin
                  IBQCrearGrupo.Close;
                  IBQCrearGrupo.ParamByName('ESTABLECIMIENTO').Value :=FPrincipal.EstablecimientoActual;
                  IBQCrearGrupo.ParamByName('NOMBREGRUPO').Value := 'Inseminacion Artificial por Importación';
                  IBQCrearGrupo.ParamByName('DESCRIPCIONGRUPO').Value := 'Grupo Auto';
                  IBQCrearGrupo.ParamByName('TIPO').Value :='S';
                  IBQCrearGrupo.ParamByName('TIPO_EVENTO').Value := 28;
                  IBQCrearGrupo.ParamByName('NRO_DTE').Value := 0;
                  IBQCrearGrupo.ParamByName('PATH_DTE').Value := '';
                  IBQCrearGrupo.Open;
                  grupoIA := IBQCrearGrupo.FieldValues['IDNUEVOGRUPO'];
                  FPrincipal.IBTPrincipal.CommitRetaining;
               end;

              //FIN CREACION GRUPO


              id_servicio := CargarServicioParaInseminacion(IBDSErrores.FieldValues['FECHA_SERVICIO']);

              if (id_madre<>-1) then
                CargarInseminacionArtificial(IBDSErrores.FieldValues['FECHA_SERVICIO'], id_madre, id_servicio, id_semen, grupoIA);

              //tipo_p := 'E';

              ActualizarPadres(id_madre,id_padre,IBDSErrores.FieldValues['id_animal'],tipo_p,'I',null);
          end;
    end;

//----------------------------------------------------------------------------------------------------------------------
    PBAvance.Position := PBAvance.Position + 1;
    PBAvance.Update;
    Application.ProcessMessages;

    IBDSErrores.Next;
    inc(i);
    except
      ShowMessage('Error en registro. ID_RP : ' + IBDSErrores.FieldByName('rp').AsString);

      IBDSErrores.Next;
      inc(i);
//      break;
    end;
  end;

  Label2.Caption := IntToStr(cant_m);
  Label8.Caption := IntToStr(cant_p);

  DBGERA.DataSource := DSTabla;

  BDBGInconsistencia.DataSource := DSErrores;
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    Fprincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  try
    actualizarNombres();
  except
   on e:exception do
     showMessage('Error al actualizar nombres' + e.Message);
  end;


  try
    actualizarCategorias();
  except
   on e:exception do
     showMessage('Error al actualizar categorias' + e.Message);
  end;


  try
     actualizarTR();
  except
   on e:exception do
     showMessage('Error al actualizar TR' + e.Message);
  end;

   try
    actualizarUbicacionAnimales()
  except
   on e:exception do
     showMessage('Error al actualizar Establecimiento del Animal' + e.Message);
  end;

  //BCargar.Visible := false;
  //BSalir.Visible := true;
  LEstado.Caption := 'La Carga de Datos Finalizo';
end;

function TFImpERA.BuscarAnimalIE(rp , hba, fnac,sexo,tipoServ,ancestro: String; var Tipo : String) : Integer;
begin
  if ((hba='') or  (hba='0')) and ((rp='') or  (rp='0')) then
    begin
      result := -1;
      exit;
    end;

// Si tengo HBA y es distinto a 0
 if (hba<>'') and (hba<>'0') then
  begin
    IBQBuscarAnimalInt.Close;
    IBQBuscarAnimalInt.sql.clear();
    IBQBuscarAnimalInt.sql.add(' select first 1 id_animal from tab_animales where id_hba = :hba and sexo = :sexo');
    IBQBuscarAnimalInt.ParamByName('hba').AsString := hba;
    IBQBuscarAnimalInt.ParamByName('sexo').AsString := sexo;

    IBQBuscarAnimalInt.Open;
    if not IBQBuscarAnimalInt.IsEmpty then
      begin
        Result := IBQBuscarAnimalInt.FieldValues['id_animal'];
        Tipo := 'I';
      exit;
    end;
 end
  else
    if (rp<>'') and (rp<>'0') then
    begin
      IBQBuscarAnimalInt.Close;
      IBQBuscarAnimalInt.sql.clear();
      IBQBuscarAnimalInt.sql.add(' select first 1 id_animal from tab_animales where fecha_nacimiento = :fnac and id_rp = :rp and sexo = :sexo');
      IBQBuscarAnimalInt.ParamByName('fnac').AsString := fnac;
      IBQBuscarAnimalInt.ParamByName('rp').AsString := rp;
      IBQBuscarAnimalInt.ParamByName('sexo').AsString := sexo;

       IBQBuscarAnimalInt.Open;
        if not IBQBuscarAnimalInt.IsEmpty then
          begin
             Result := IBQBuscarAnimalInt.FieldValues['id_animal'];
             Tipo := 'I';
          exit;
        end;
  end;
 // Busco como animal Externo
 if (hba<>'') and (hba<>'0') and (tipoServ<>'SN') and( (tipoServ='TE') or ((tipoServ='IA') and (ancestro='padre') ))  then
//f (hba<>'') and (hba<>'0') and( (tipoServ='TE') or ((tipoServ='IA') and (ancestro='padre') ))  then
 begin
  IBQBuscarAnimalInt.Close;
  IBQBuscarAnimalInt.sql.clear();
  IBQBuscarAnimalInt.sql.add(' select first 1 id_animal_externo from tab_animales_externos  where id_hba = :hba and sexo = :sexo');
  IBQBuscarAnimalInt.ParamByName('hba').AsString := hba;
  IBQBuscarAnimalInt.ParamByName('sexo').AsString := sexo;

  IBQBuscarAnimalInt.Open;
  if not IBQBuscarAnimalInt.IsEmpty then
   begin
      Result := IBQBuscarAnimalInt.FieldValues['id_animal_externo'];
      Tipo := 'E';
      exit;
    end;
 end;

  if (rp<>'') and (rp<>'0') and (tipoServ<>'SN') and( (tipoServ='TE') or ((tipoServ='IA') and (ancestro='padre') ))  then
  begin
    IBQBuscarAnimalInt.Close;
    IBQBuscarAnimalInt.sql.clear();
    IBQBuscarAnimalInt.sql.add(' select first 1 id_animal_externo from tab_animales_externos  where fecha_nacimiento = :fnac and id_rp = :rp and sexo = :sexo');
    IBQBuscarAnimalInt.ParamByName('rp').AsString := rp;
    IBQBuscarAnimalInt.ParamByName('fnac').AsString := fnac;
    IBQBuscarAnimalInt.ParamByName('sexo').AsString := sexo;

    IBQBuscarAnimalInt.Open;
    if not IBQBuscarAnimalInt.IsEmpty then
    begin
        Result := IBQBuscarAnimalInt.FieldValues['id_animal_externo'];
        Tipo := 'E';
        exit;
      end;
    end;
  result := -1;
end;

function TFImpERA.BuscarMadre(rp_madre , hba_madre,fnac,tipoServ: String; var Tipo: String) : Integer;
begin
 result := buscarAnimalIE(rp_madre, hba_madre,fnac, '2',tipoServ,'madre', tipo);
end;

function TFImpERA.BuscarPadre(rp_padre, hba_padre,fnac,tipoServ : String; var Tipo : String) : Integer;
begin
 result := buscarAnimalIE(rp_padre, hba_padre,fnac, '1',tipoServ,'padre', tipo);
end;

function TFImpERA.getEstablecimiento( rp : string) : integer;
var i:integer;
begin
 result := -1;
 for i:=0 to high(animales) do
   if rp = animales[i].RP then
   begin
     result := animales[i].establecimiento;
     exit;
   end;

end;

procedure TFImpERA.actualizarCategorias();
begin
 IBQCalcularCategorias.execSQL();
end;

procedure TFImpERA.actualizarNombres();
var
 i : integer;
 codigoManejo : integer;
 TR , ID_otro: string;
begin
  for i:=0 to high(animales) do
  begin
     if (      animales[i].RP <> '') then
     begin
      IBQActualizarNombres.ParamByName('NOMBRE_ANIMAL').Value :=animales[i].nombre_Cria;
      IBQActualizarNombres.ParamByName('ID_ANIMAL').Value :=animales[i].ID_ANIMAL;
      IBQActualizarNombres.ParamByName('ID_RP').AsString :=  animales[i].RP  ;

      if (uppercase(animales[i].color_cria) = 'N') or (uppercase(animales[i].color_cria) = 'NEGRO') then
        IBQActualizarNombres.ParamByName('COLOR').AsString := 'NEGRO'
      ELSE
      if (uppercase(animales[i].color_cria) = 'C') or (uppercase(animales[i].color_cria) = 'COLORADO') then
        IBQActualizarNombres.ParamByName('COLOR').AsString := 'COLORADO'
      ELSE
      if (uppercase(animales[i].color_cria) = '') then
          IBQActualizarNombres.ParamByName('COLOR').AsString := 'NO DEFINIDO'
        else
          IBQActualizarNombres.ParamByName('COLOR').AsString := uppercase(animales[i].color_cria)  ;

      if (uppercase(animales[i].Raza) = '') then
        IBQActualizarNombres.ParamByName('RAZA').AsString := 'NN'
      ELSE
        IBQActualizarNombres.ParamByName('RAZA').AsString := uppercase(animales[i].Raza) ;

      codigoManejo :=max(max( max(max( animales[i].m0, animales[i].m1) ,animales[i].m2), animales[i].m3), animales[i].m4);
      IBQActualizarNombres.ParamByName('CODIGO_MANEJO').AsString := intToStr(codigoManejo);

      TR := copy( animales[i].TR,1,2);

      IBQCalcularSubCatego.Close;
      IBQCalcularSubCatego.ParamByName('subcatego').AsString := TR;
      IBQCalcularSubCatego.Open;

      if (IBQCalcularSubCatego.IsEmpty) then
        IBQActualizarNombres.ParamByName('SUB_CATEGORIA').AsInteger := 0
      else
        IBQActualizarNombres.ParamByName('SUB_CATEGORIA').AsInteger := IBQCalcularSubCatego.FieldValues['id_subcategoria'];

// Longitud maxima 10
      ID_otro := copy( animales[i].otro_cria,1,10);
      IBQActualizarNombres.ParamByName('OTRO_CRIA').AsString := ID_otro;

      IBQActualizarNombres.ExecSQL();
      FPrincipal.IBTPrincipal.CommitRetaining;
      cbDatosAnimal.Caption := 'Actualizar datos animal ('+intToStr(i)+')';
      end;
  end;
end;


procedure TFImpERA.actualizarUbicacionAnimales();
var
 i : integer;
 rpS : string;
begin
// Para animales
  for i:=0 to high(animales) do
  begin
     if (animales[i].id_animal>0) and (  animales[i].RP <> '') then
     begin
     //Actualiza el padre
      IBQActualizarUbicacion.ParamByName('ESTABLECIMIENTO').Value :=animales[i].establecimiento;
      IBQActualizarUbicacion.ParamByName('ID_ANIMAL').value := animales[i].id_animal;
      IBQActualizarUbicacion.ExecSQL();

      IBQActualizarInstalaciones.ParamByName('ESTABLECIMIENTO').Value :=animales[i].establecimiento;
      IBQActualizarInstalaciones.ParamByName('ID_ANIMAL').value := animales[i].id_animal;
      IBQActualizarInstalaciones.ExecSQL();
      cbActualizarEstablecimiento.Caption := 'Actualizar establecimiento ('+intToStr(i)+')';
      end;
  end;
end;

procedure TFImpERA.generarEventosNacimiento();
var
 i : integer;
 rpS : string;
begin
// Para animales
  for i:=0 to high(animales) do
  begin

  end;
end;

function TFImpERA.isValidDate( s : string ) :boolean;
var date : TDateTime;
begin
 result := false;
 if (s = '')  then exit;
 if (s = '0') then exit;
 result := TryStrToDate(s, date);
end;

function TFImpERA.isValidDate( v : variant) :boolean;
var date : TDateTime;
begin
 result := true;
 if ( VarAsType(v,varString)='') then
 begin
   result := false;
   exit;
 end;

 Try
  VarAsType(v , varDate)
 except
   result:= false;
 end;
end;

procedure TFImpERA.actualizarTR();
var
 i : integer;
 sM, sP : string;
 scriptByHBA :  string;
begin

scriptByHBA := 'update TAB_ANIMALES_EXTERNOS ' +
               '  set TIPO_REGISTRO = (select id_subcategoria   from cod_subcategorias where codigo = :subcatego) '+
               'where ID_HBA = :HBA  ';
// Actualizo la MD
  for i:=0 to high(animales) do
  begin
      sP := copy( animales[i].raza_pd , 1,2);
      sM := copy( animales[i].raza_md , 1,2);

     if (      animales[i].hba_md <> '') then
     begin
     IBQActTRs.SQL.clear();
     IBQActTRs.SQL.add(scriptByHBA);

      IBQActTRs.ParamByName('HBA').AsString :=  animales[i].hba_md  ;
      IBQActTRs.ParamByName('subcatego').AsString :=  sM  ;
      IBQActTRs.ExecSQL();
      end;

     if (      animales[i].hba_pd <> '') then
     begin
     IBQActTRs.SQL.clear();
     IBQActTRs.SQL.add(scriptByHBA);

      IBQActTRs.ParamByName('HBA').AsString :=  animales[i].hba_pd  ;
      IBQActTRs.ParamByName('subcatego').AsString :=  sP ;
      IBQActTRs.ExecSQL();
      end;

  end;

end;

procedure TFImpERA.ActualizarPadres(madre, padre, animal : Variant; tipo_p, tipo_m : String; id_recep: Variant);
begin
try

  if  padre>0 then
  begin
    if tipo_p = 'E' then
    begin
        IBQExiste.Close;
        IBQExiste.sql.clear();
        IBQExiste.SQL.Add('select * from REL_PADRES_EXTERNOS WHERE establecimiento= :e and animal =:a and padre_externo= :pe');
        IBQExiste.ParamByName('e').AsInteger := FPrincipal.EstablecimientoActual;
        IBQExiste.ParamByName('a').AsString := animal;
        IBQExiste.ParamByName('pe').AsString := padre;
        IBQExiste.Open;

        if IBQExiste.RecordCount =0 then
          begin

            IBQActAux.sql.clear();
            IBQActAux.sql.Add( 'insert into REL_PADRES_EXTERNOS (establecimiento,animal,padre_externo) values (:ESTAB,:HIJO,:PD)');
            IBQActAux.ParamByName('ESTAB').AsInteger := FPrincipal.EstablecimientoActual;
            IBQActAux.ParamByName('HIJO').AsString := animal;
            IBQActAux.ParamByName('PD').AsString := padre;
            IBQActAux.execSQL();
         end;   
    end
    else
    begin
        IBQActAux.sql.clear();
         IBQActAux.sql.Add( 'insert into REL_PADRES_INTERNOS (establecimiento,animal,padre_interno) values (:ESTAB,:HIJO,:PD)');
        IBQActAux.ParamByName('ESTAB').AsInteger := FPrincipal.EstablecimientoActual;
        IBQActAux.ParamByName('HIJO').AsString := animal;
        IBQActAux.ParamByName('PD').AsString := padre;
        IBQActAux.execSQL();

    end ;
  end;


  //Lo siguiente deberia hacerse, pero al cargarle la receptora arma mal la genealogía.
  //Habria que corregirlo a futuro, para que en la tabla del animal le quede registrada
  //la madre receptora, y que al dibujar la genealogia no la tenga en cuenta.
  //if (id_recep <> null) then
  //  begin
  //     IBQActualizarReceptora.Close();
  //     IBQActualizarReceptora.ParamByName('id_receptora').AsInteger := id_recep;
  //     IBQActualizarReceptora.ParamByName('anim').AsInteger := animal;
  //     IBQActualizarReceptora.Open();
  //  end;
  FPrincipal.IBTPrincipal.CommitRetaining;

except
  // Si es un error de Foreign Key, es porque no existe el padre o la madre
    FPrincipal.IBTPrincipal.RollbackRetaining;

end;

try
if  madre>0 then
begin
  if tipo_m = 'E' then
  begin
      IBQActAux.sql.clear();
       IBQActAux.sql.Add(' update tab_animales set MADRE_BIOLOGICA_EXTERNA = :MD where id_animal = :HIJO;');
      IBQActAux.ParamByName('HIJO').AsString := animal;
      IBQActAux.ParamByName('MD').AsString := madre;
      IBQActAux.execSQL();
  end
  else
  begin
      IBQActAux.sql.clear();
      IBQActAux.sql.Add(' update tab_animales set MADRE_BIOLOGICA_INTERNA = :MD where id_animal = :HIJO;');
      IBQActAux.ParamByName('HIJO').AsString := animal;
      IBQActAux.ParamByName('MD').AsString := madre;
      IBQActAux.execSQL();

  end ;
end;
  FPrincipal.IBTPrincipal.CommitRetaining;

except
  // Si es un error de Foreign Key, es porque no existe el padre o la madre
    FPrincipal.IBTPrincipal.RollbackRetaining;

end;


end;

procedure TFImpERA.BImportarClick(Sender: TObject);
var
  ID, Cantidad, Comm, I : Integer;
  Cartel : TCartel;
  Res : Boolean;
  sq : STring;
begin
  BImportar.Enabled := false;
  //BAbrirERA.Enabled := false;
  IEra.Enabled := false;
  LAbrirERA.Enabled := false;
  LImportar.Enabled := false;
  IImportar.Enabled := false;
  ISalir.Enabled := false;
  LSalir.Enabled := false;

  LEstado.Caption := 'Verificando Existencia de Animales';

  Comm := 0;
  //VKDBF.First;

  //PBAvance.Max := VKDBF.RecordCount;
  PBAvance.Max := CantFila;

  PBAvance.Position := 0;
  PBAvance.Update;
  Application.ProcessMessages;

  Cantidad := 0;
  //DecimalSeparator := '.';
  ////Verifico los animales que no coinciden y veo q accion tomar

  Res := false;

  sq := 'select count(*) as numAnimales from tab_animales';

  IBQActAux.SQL.clear();
  IBQActAux.SQL.add(sq);
  IBQActAux.Open();

  // La base esta vacia
  if IBQActAux.FieldValues['numAnimales'] = 0  then
  begin
    lbProgreso.visible := true;
    for i := 0 to Length(Animales)-1 do
    begin
      try
        if not ExisteAnimal(Animales[i].RP,Animales[I].hba_cria,Animales[i].fnac_cria,Animales[i].sexo_cria,
                             Animales[i].color_cria,Animales[i].Raza) then
        begin
          Inc(Cantidad);
          LCant.Caption := IntToStr(Cantidad) + ' animales';
        end;
      except
      end;
      PBAvance.Position := PBAvance.Position + 1;
      lbProgreso.Caption := ' Analizando :' + intToStr(i) +' de '+ intToStr( Length(Animales));
      if (i mod 20 =0) then
      begin
        PBAvance.Update;
        Application.ProcessMessages;
      end;
    end;
         try
          Cartel := TCartel.getInstance;
          Cartel.abrircartel('Cargando/Actualizando Animales');
          IBQAnimalesNuevos.Close;
          IBQAnimalesNuevos.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
          Cartel.cerrarcartel;
          Cartel.FreeInstance;
          Res := VerificarDatos();
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
  end
  else
  begin
    lbProgreso.visible := true;
    for i := 0 to Length(Animales)-1 do
    begin
      try
        if not ExisteAnimal(Animales[i].RP,Animales[I].hba_cria,Animales[i].fnac_cria,Animales[i].sexo_cria,
                             Animales[i].color_cria,Animales[i].Raza) then
        begin
          Inc(Cantidad);
          LCant.Caption := IntToStr(Cantidad) + ' animales';
        end;
      except
      end;
      PBAvance.Position := PBAvance.Position + 1;
      lbProgreso.Caption := ' Analizando :' + intToStr(i) +' de '+ intToStr( Length(Animales));
      if (i mod 20 =0) then
      begin
        PBAvance.Update;
        Application.ProcessMessages;
      end;
    end;
    Application.ProcessMessages;
    lbProgreso.visible := false;
    if Cantidad > 0 then
    begin
      if MostrarMensajeNuevosERA(tmConsulta,'Los siguientes animales no coinciden o no se encontraron en la base de Huella') = mrYes then
      begin
        try
          Cartel := TCartel.getInstance;
          Cartel.abrircartel('Cargando/Actualizando Animales');
          IBQAnimalesNuevos.Close;
          IBQAnimalesNuevos.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
          Cartel.cerrarcartel;
          Cartel.FreeInstance;
          Res := VerificarDatos();
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
      end;
    end
    else
    begin
      Res := VerificarDatos;
    end;
  end;
  IBDSErrores.Close;
  IBDSErrores.Open;
  IBDSErrores.Last;
  IBDSErrores.First;
  if IBDSErrores.RecordCount > 0 then
  begin
    PCDatos.Visible := true;
    TSInconsistencia.TabVisible := true;
    PCDatos.ActivePage := TSInconsistencia;
    BDBGInconsistencia.DataSource := DSErrores;
    //BImportar.Visible := false;
    ISalir.Enabled := true;
    LSalir.Enabled := true;
    IImportar.Enabled := true;
    LImportar.Enabled := true;
    LImportar.Caption := 'Cargar Datos';
    LImportar.OnClick := BCargarClick;
    IImportar.OnClick := BCargarClick;

    //BCargar.Visible := true;
    //BCargar.Enabled := true;
    Top := 60;
    Height := 724;
    end
  else
  begin
    GBDatosImp.Enabled := false;
    BCargarClick(sender);
  end;
  LEstado.Caption := '';
 // GuardarInfoArchivo();

end;

procedure TFImpERA.FormShow(Sender: TObject);
var
  A, B : String;
begin
  inherited;
  LCant.Caption := '';
  LCantPesoN.Caption := '';
  LPesoDest.Caption := '';
  LPesoAnio.Caption := '';
  LPesoAdulto.Caption := '';
  LCE.Caption := '';
  LMedicionF.Caption := '';
  LCalidadCarne.Caption := '';
  LDEPs.Caption := '';
  LCantNuevos.Caption := '';
  LTipificSang.Caption := '';
  LServicios.Caption := '';
  PesoN := 0;
  PesoD := 0;
  PesoA := 0;
  PesoT := 0;
  CE := 0;
  MF := 0;
  CC := 0;
  DEPs := 0;
  CantNuevos := 0;
  Tipificacion := 0;
  Servicios := 0;
  SysUtils.DecimalSeparator := '.';
  EAAnio.Text := IntToStr(YearOf(Today()));
end;

procedure TFImpERA.GuardarInfoArchivo();
var
  Archivo : TextFile;
  Dir : String;
  i : integer;
begin
  try
    Dir := ExtractFilePath(Application.ExeName);
    AssignFile(Archivo,Dir+'Log_ERA.txt');
    Rewrite(Archivo);
    writeln(Archivo,'*** IMPORTACION DE DATOS DE ERA ***');
    writeln(Archivo,'');
    writeln(Archivo,' - Cantidad de animales importados: '+LCant.Caption);
    writeln(Archivo,' - Cantidad de animales nuevos: '+LCantNuevos.Caption);
    writeln(Archivo,' - Cantidad de Pesos al Nacer cargados: '+LCantPesoN.Caption);
    writeln(Archivo,' - Cantidad de Pesos al Destete cargados: '+LPesoDest.Caption);
    writeln(Archivo,' - Cantidad de Pesos al Año cargados: '+LPesoAnio.Caption);
    writeln(Archivo,' - Cantidad de Pesos Adulto cargados: '+LPesoAdulto.Caption);
    writeln(Archivo,' - Cantidad de Mediciónes de Circ. Escrotal cargadas: '+LCE.Caption);
    writeln(Archivo,' - Cantidad de Mediciones de Frame cargadas: '+LMedicionF.Caption);
    writeln(Archivo,' - Cantidad de eventos de Calidad de Carne cargados: '+LCalidadCarne.Caption);
    writeln(Archivo,'');
    writeln(Archivo,'-------------------------------------------------------------------------');
    writeln(Archivo,'----------------------- Detalle de la Importacion -----------------------');
    writeln(Archivo,'-------------------------------------------------------------------------');
    writeln(Archivo,'');
    writeln(Archivo,'');
    writeln(Archivo,'-------------------------------------------------------------------------');
    CloseFile(Archivo);
  except
  end;
end;

procedure TFImpERA.AgregarAnimal(IdAnimal, I : Integer);
begin
  try
    IBDSErrores.Insert;
    Animales[i].ID_ANIMAL := IdAnimal;
    IBDSErrores.FieldByName('ID_ANIMAL').Value := IdAnimal;
    IBDSErrores.FieldByName('rp').Value := Animales[i].RP;
    IBDSErrores.FieldByName('act_rp').Value := 0;
    IBDSErrores.FieldByName('hba').Value := Animales[i].hba_cria;
    IBDSErrores.FieldByName('atc_hba').Value := 0;
    IBDSErrores.FieldByName('fecha_nac').Value := Animales[i].fnac_cria;
    IBDSErrores.FieldByName('act_fecha_nac').Value := 0;
    IBDSErrores.FieldByName('peso_n').Value := null;
    IBDSErrores.FieldByName('act_peso_n').Value := 0;
    IBDSErrores.FieldByName('fecha_peso_n').Value := null;
    IBDSErrores.FieldByName('act_fecha_peso_n').Value := 0;
    IBDSErrores.FieldByName('peso_d').Value := null;
    IBDSErrores.FieldByName('act_peso_d').Value := 0;
    IBDSErrores.FieldByName('fecha_peso_d').Value := null;
    IBDSErrores.FieldByName('act_fecha_peso_d').Value := 0;
    IBDSErrores.FieldByName('peso_a').Value := null;
    IBDSErrores.FieldByName('act_peso_a').Value := 0;
    IBDSErrores.FieldByName('fecha_peso_a').Value := null;
    IBDSErrores.FieldByName('act_fecha_peso_a').Value := 0;
    IBDSErrores.FieldByName('peso_18').Value := null;
    IBDSErrores.FieldByName('act_peso_18').Value := 0;
    IBDSErrores.FieldByName('fecha_peso_18').Value := null;
    IBDSErrores.FieldByName('act_fecha_peso_18').Value := 0;
    IBDSErrores.FieldByName('ce').Value := null;
    IBDSErrores.FieldByName('act_ce').Value := 0;
    IBDSErrores.FieldByName('fecha_ce').Value := null;
    IBDSErrores.FieldByName('act_fecha_ce').Value := 0;
    IBDSErrores.FieldByName('altura').Value := null;
    IBDSErrores.FieldByName('act_altura').Value := 0;
    IBDSErrores.FieldByName('fecha_altura').Value := null;
    IBDSErrores.FieldByName('act_fecha_altura').Value := 0;
    IBDSErrores.FieldByName('gestdep').Value := null;
    IBDSErrores.FieldByName('act_gestdep').Value := 0;
    IBDSErrores.FieldByName('nacerdep').Value := null;
    IBDSErrores.FieldByName('act_nacerdep').Value := 0;
    IBDSErrores.FieldByName('destdep').Value := null;
    IBDSErrores.FieldByName('act_destdep').Value := 0;
    IBDSErrores.FieldByName('lechedep').Value := null;
    IBDSErrores.FieldByName('act_lechedep').Value := 0;
    IBDSErrores.FieldByName('finaldep').Value := null;
    IBDSErrores.FieldByName('act_finaldep').Value := 0;
    IBDSErrores.FieldByName('cedep').Value := null;
    IBDSErrores.FieldByName('act_cedep').Value := 0;
    IBDSErrores.FieldByName('alturadep').Value := null;
    IBDSErrores.FieldByName('act_alturadep').Value := 0;
    IBDSErrores.FieldByName('egddep').Value := null;
    IBDSErrores.FieldByName('act_egddep').Value := 0;
    IBDSErrores.FieldByName('egcdep').Value := null;
    IBDSErrores.FieldByName('act_egcdep').Value := 0;
    IBDSErrores.FieldByName('aobdep').Value := null;
    IBDSErrores.FieldByName('act_aobdep').Value := 0;
    IBDSErrores.FieldByName('porgidep').Value := null;
    IBDSErrores.FieldByName('act_porgidep').Value := 0;
    IBDSErrores.FieldByName('porcmdep').Value := null;
    IBDSErrores.FieldByName('act_porcmdep').Value := 0;
    IBDSErrores.FieldByName('gestprec').Value := null;
    IBDSErrores.FieldByName('act_gestprec').Value := 0;
    IBDSErrores.FieldByName('nacerprec').Value := null;
    IBDSErrores.FieldByName('act_nacerprec').Value := 0;
    IBDSErrores.FieldByName('destprec').Value := null;
    IBDSErrores.FieldByName('act_destprec').Value := 0;
    IBDSErrores.FieldByName('lecheprec').Value := null;
    IBDSErrores.FieldByName('act_lecheprec').Value := 0;
    IBDSErrores.FieldByName('finalprec').Value := null;
    IBDSErrores.FieldByName('act_finalprec').Value := 0;
    IBDSErrores.FieldByName('ceprec').Value := null;
    IBDSErrores.FieldByName('act_ceprec').Value := 0;
    IBDSErrores.FieldByName('alturaprec').Value := null;
    IBDSErrores.FieldByName('act_alturaprec').Value := 0;
    IBDSErrores.FieldByName('egdprec').Value := null;
    IBDSErrores.FieldByName('act_egdprec').Value := 0;
    IBDSErrores.FieldByName('egcprec').Value := null;
    IBDSErrores.FieldByName('act_egcprec').Value := 0;
    IBDSErrores.FieldByName('aobprec').Value := null;
    IBDSErrores.FieldByName('act_aobprec').Value := 0;
    IBDSErrores.FieldByName('porgiprec').Value := null;
    IBDSErrores.FieldByName('act_porgiprec').Value := 0;
    IBDSErrores.FieldByName('porcmprec').Value := null;
    IBDSErrores.FieldByName('act_porcmprec').Value := 0;
    IBDSErrores.FieldByName('crias').Value := null;
    IBDSErrores.FieldByName('act_crias').Value := 0;
    IBDSErrores.FieldByName('frame').Value := null;
    IBDSErrores.FieldByName('act_frame').Value := 0;
    IBDSErrores.FieldByName('fecha_peso_ecog').Value := null;
    IBDSErrores.FieldByName('peso_ecog').Value := null;
    IBDSErrores.FieldByName('aob').Value := null;
    IBDSErrores.FieldByName('eg').Value := null;
    IBDSErrores.FieldByName('gi').Value := null;
    IBDSErrores.FieldByName('gc').Value := null;
    IBDSErrores.FieldByName('pcma').Value := null;
    IBDSErrores.FieldByName('pelado').Value := null;
    IBDSErrores.FieldByName('color').Value := Animales[i].color_cria;

    IBDSErrores.FieldByName('TIPIFIC_SANGUINEA').Value := Animales[i].tip_sang;
    if ( isValidDate( Animales[i].fserv))  then
      IBDSErrores.FieldByName('FECHA_SERVICIO').Value := Animales[i].fserv;
    IBDSErrores.FieldByName('TIPO_SERVICIO').Value := Animales[i].tipo_serv;

    IBDSErrores.FieldByName('RP_MADRE').Value := Animales[i].rp_md;
    IBDSErrores.FieldByName('HBA_MADRE').Value := Animales[i].hba_md;
    IBDSErrores.FieldByName('RAZA_MADRE').Value := Animales[i].raza_md;
    IBDSErrores.FieldByName('COLOR_MADRE').Value := Animales[i].color_md;
    IBDSErrores.FieldByName('FENAC_MADRE').Value := Animales[i].fnac_md;


    IBDSErrores.FieldByName('RP_PADRE').Value := Animales[i].rp_pd;
    IBDSErrores.FieldByName('HBA_PADRE').Value := Animales[i].hba_pd;
    IBDSErrores.FieldByName('COLOR_PADRE').Value := Animales[i].color_pd;
    IBDSErrores.FieldByName('RAZA_PADRE').Value := Animales[i].raza_pd;
    IBDSErrores.FieldByName('ANIO_NAC_PADRE').Value := Animales[i].anac_pd;

    IBDSErrores.FieldByName('RP_RECEP').Value := Animales[i].rp_rec;
    IBDSErrores.FieldByName('FENAC_RECEP').Value := Animales[i].fnac_rec;
    IBDSErrores.FieldByName('RAZA_RECEP').Value := Animales[i].raza_rec;
// BUG EN LA CANTIDAD DE COLUMNAS!!! No puede leer esta columna
//    IBDSErrores.FieldByName('CAT_CRIA').Value := Animales[i].TR;
  //  IBDSErrores.FieldByName('ESTABLECIMIENTO').Value := Animales[i].establecimiento;
    if (Animales[i].crias <> Null) then
      if (Trim(Animales[i].crias) <> '') then
        IBDSErrores.FieldByName('CRIAS').Value := StrToInt(Trim(Animales[i].crias));


    IBDSErrores.Post;
    Fprincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFImpERA.EAAnioExit(Sender: TObject);
var
  valor : Integer;
begin
  inherited;
  if TryStrToInt(EAAnio.Text,valor) then
    Anio := valor
  else
  begin
    Anio := YearOf(Today);
    EAAnio.Text := IntToStr(Anio);
  end;
  HabilitarCarga;
end;

procedure TFImpERA.BDBGInconsistenciaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const
 CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
var   CheckBoxRectangle : TRect;
      val : integer;
begin
  inherited;
  if Column.Title.Caption = 'Act' then
  begin
    BDBGInconsistencia.Canvas.FillRect(Rect);
    CheckBoxRectangle.Left := Rect.Left + 2;
    CheckBoxRectangle.Right := Rect.Right - 2;
    CheckBoxRectangle.Top := Rect.Top + 2;
    CheckBoxRectangle.Bottom := Rect.Bottom - 2;
    if Column.Field.Value = 1 then
      DrawFrameControl(BDBGInconsistencia.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[true])
    else
      DrawFrameControl(BDBGInconsistencia.Canvas.Handle,CheckBoxRectangle,DFC_BUTTON,CtrlState[false]);
  end;
end;

procedure TFImpERA.CambiarValorColumna(Column: TColumn);
begin
  Column.Field.DataSet.Edit;
  if(Column.Field.AsInteger = 0)then
    Column.Field.AsInteger := 1
  else
    Column.Field.AsInteger := 0;
  Column.Field.DataSet.Post;
  try
    IBDSErrores.ApplyUpdates;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFImpERA.BDBGInconsistenciaCellClick(Column: TColumn);
begin
  inherited;
  if Column.Title.Caption = 'Act' then
    CambiarValorColumna(Column);
end;

procedure TFImpERA.BCargarClick(Sender: TObject);
begin
  inherited;
  GBDatosImp.Enabled := false;
  CargarDatos();
  //BSalir.Visible := true;
  //BCargar.Visible := false;
  GBDatosImp.Visible := false;
  PCDatos.Visible := false;
  PFinal.Visible := true;
  PFinal.Align := alClient;
  ISalir.Enabled := true;
  LSalir.Enabled := true;
end;

procedure TFImpERA.HabilitarCarga;
begin
  BImportar.Enabled := Abrio and ((CBDeps.Checked and (Anio <> 0)) or not CBDeps.Checked);
end;

procedure TFImpERA.CBDEPsClick(Sender: TObject);
begin
  inherited;
  HabilitarCarga;
end;

procedure TFImpERA.BSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFImpERA.VKDBFFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := Trim(DataSet.FieldValues['RP_CRIA']) <> '';
end;

procedure TFImpERA.EAAnioChange(Sender: TObject);
var
  valor : Integer;
begin
  inherited;
  if TryStrToInt(EAAnio.Text,valor) then
    Anio := valor;
  if Length(EAAnio.Text) = 4 then
    HabilitarCarga;
end;


//------------------------------------------------------------------------------------------------------------
//-------------------Agregados--------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------

procedure TFImpERA.CargarTipificacionSanguinea(IdAnimal : integer; Valor : Variant);
begin
  if (Valor <> '0') then
  begin
    try
      IBQActTipificSanguinea.Close;
      IBQActTipificSanguinea.ParamByName('id_animal').AsInteger := IdAnimal;
      IBQActTipificSanguinea.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
      IBQActTipificSanguinea.ParamByName('tipific_sanguinea').Value := Valor;
      IBQActTipificSanguinea.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;

      Inc(Tipificacion);
      LTipificSang.Caption :=  '('+IntToStr(Tipificacion)+')';
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

procedure TFImpERA.CargarADN(IdAnimal : integer; Valor : string );
begin

  if (Valor <> '0') then
  begin
    try
      IBQActADN.Close;
      IBQActADN.ParamByName('id_animal').AsInteger := IdAnimal;
      IBQActADN.ParamByName('estable').AsInteger := FPrincipal.EstablecimientoActual;
      IBQActADN.ParamByName('adn').Value := Valor;
      IBQActADN.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
end;

procedure TFImpERA.CargarServicioNatural(fechaServ : string; id_padre, id_madre, grupoSN : integer);
var nombreServicio, fechaServicio : string;
    ID_SERVICIO, ID_GRUPO : integer;
begin
           IBQServicioNatural.Close;
           nombreServicio := 'SERVICIO NATURAL ' + fechaServ;
           IBQServicioNatural.ParamByName('NOMBRE').AsString := nombreServicio;
           IBQServicioNatural.ParamByName('FECHA_INICIO').AsDate := StrToDateTime(fechaServ);
           IBQServicioNatural.ParamByName('FECHA_FIN_ESTIMADA').AsDate := StrToDateTime(fechaServ);
           IBQServicioNatural.ParamByName('ACTIVO').AsString := 'N';
           IBQServicioNatural.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
           IBQServicioNatural.ParamByName('TIPO').AsInteger := 2;
           IBQServicioNatural.ParamByName('POTRERO').Value := null;
           IBQServicioNatural.Open;

           ID_SERVICIO := IBQServicioNatural.FieldValues['ID_SERVICIO'];

           IBSPIngresoServicio.Close;
           IBSPIngresoServicio.ParamByName('FECHA').AsDate := StrToDate(fechaServ);
           IBSPIngresoServicio.ParamByName('ANIMAL').AsInteger := id_padre;
           IBSPIngresoServicio.ParamByName('OBSERVACION').AsString := '';
           IBSPIngresoServicio.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
           IBSPIngresoServicio.ParamByName('RESPONSABLE').Value := 0;
           IBSPIngresoServicio.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
           IBSPIngresoServicio.ParamByName('LOG_FECHA_MODIFICADO').AsDate := Now();
           IBSPIngresoServicio.ParamByName('SERVICIO').AsInteger := ID_SERVICIO;
           if grupoSN = 0 then
            IBSPIngresoServicio.ParamByName('ID_GRUPO').Value := null
           else
            IBSPIngresoServicio.ParamByName('ID_GRUPO').Value := grupoSN;
           IBSPIngresoServicio.ParamByName('CONDICION_CORPORAL').Value := Null;
           IBSPIngresoServicio.ParamByName('ID_POTRERO').Value := Null;
           IBSPIngresoServicio.ExecProc;

           IBSPIngresoServicio.Close;
           IBSPIngresoServicio.ParamByName('FECHA').AsDate := StrToDate(fechaServ);
           IBSPIngresoServicio.ParamByName('ANIMAL').AsInteger := id_madre;
           IBSPIngresoServicio.ParamByName('OBSERVACION').AsString := '';
           IBSPIngresoServicio.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
           IBSPIngresoServicio.ParamByName('RESPONSABLE').Value := 0;
           IBSPIngresoServicio.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
           IBSPIngresoServicio.ParamByName('LOG_FECHA_MODIFICADO').AsDate := Now();
           IBSPIngresoServicio.ParamByName('SERVICIO').AsInteger := ID_SERVICIO;
           //IBSPIngresoServicio.ParamByName('ID_GRUPO').Value := Null;
           IBSPIngresoServicio.ParamByName('ID_GRUPO').Value := grupoSN;
           IBSPIngresoServicio.ParamByName('CONDICION_CORPORAL').Value := Null;
           IBSPIngresoServicio.ParamByName('ID_POTRERO').Value := Null;
           IBSPIngresoServicio.ExecProc;

           Inc(Servicios);
           LServicios.Caption :=  '('+IntToStr(Servicios)+')';
end;

procedure TFImpERA.CargarServicioTranferenciaEmbrionaria(fecha : string; IDmadre, IDpadre, IDreceptora, grupoTE : integer; tipo_m: string);
begin
//---------------------------------CARGO EL EMBRION-----------------------------------------------------------------
      IBQGenIdEmbrion.Close;
      IBQGenIdEmbrion.Open;

      try
        IBQInsertEmbrion.Close;
        IBQInsertEmbrion.ParamByName('id_embrion').AsInteger := IBQGenIdEmbrion.FieldValues['id'];
        IBQInsertEmbrion.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
        IBQInsertEmbrion.ParamByName('fecha_coleccion').AsDate := IncDay(StrToDate(fecha),-10);
        IBQInsertEmbrion.ParamByName('nro_orden').Value := null;
        IBQInsertEmbrion.ParamByName('destino').AsInteger := 0;
        IBQInsertEmbrion.ParamByName('descripcion').AsInteger := 0;
        IBQInsertEmbrion.ParamByName('serie').AsString := '';
        IBQInsertEmbrion.ParamByName('nro_envase').AsString := '';
        IBQInsertEmbrion.ParamByName('calidad').AsInteger := 0;
        IBQInsertEmbrion.ParamByName('cant_lavajes').AsInteger := 0;
        IBQInsertEmbrion.ParamByName('centro_transplante').AsInteger := 0;
        IBQInsertEmbrion.ParamByName('estadio').AsInteger := 0;
        IBQInsertEmbrion.ParamByName('madre').AsInteger := IDmadre;
        if (tipo_m = 'E') then
          IBQInsertEmbrion.ParamByName('madre_interna').AsString := 'N'
        else
          IBQInsertEmbrion.ParamByName('madre_interna').AsString := 'S';
        IBQInsertEmbrion.ParamByName('observacion').AsString := '';
        IBQInsertEmbrion.ParamByName('padre_1').AsInteger := IDpadre;
        IBQInsertEmbrion.ParamByName('padre_2').Value := null;
        IBQInsertEmbrion.ParamByName('padre_externo_1').AsString := 'S';
        IBQInsertEmbrion.ParamByName('padre_externo_2').AsString := 'S';
        IBQInsertEmbrion.ParamByName('precio').AsFloat := 0.0;
        IBQInsertEmbrion.ParamByName('responsable').AsInteger := 0;
        IBQInsertEmbrion.ParamByName('usado').AsString := '';
        IBQInsertEmbrion.Open;

        FPrincipal.IBTPrincipal.CommitRetaining;


        Inc(Servicios);
        LServicios.Caption :=  '('+IntToStr(Servicios)+')';

      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
//--------------------------------------------------------------------------------------------------------------------
//---------------------------------------CARGO LA TRANSFERENCIA-------------------------------------------------------
      CargarParametrosSP(fecha, IBQGenIdEmbrion.FieldValues['id'], IDreceptora, grupoTE);

end;


function TFImpERA.CargarReceptora(fecha, rpMadreRecep, razaRecep, fecNacRecep : string):integer;
begin
   //La receptora tiene fecha nac, y la fecha de servicio es anterior a la de nacimiento

  // if ((fecNacRecep = '') or (fecha < fecNacRecep)) then
  if ((fecNacRecep = '') or (fecNacRecep = '0' )) then 
      Result := CargarAnimalInterno(rpMadreRecep, razaRecep,CalcularFechaNacMadreReceptora(fecha) , '', '','PC','','','2')
   else
      Result := CargarAnimalInterno(rpMadreRecep, razaRecep, fecNacRecep, '', '','PC','','','2');
end;

function TFImpERA.CargarMadreExterna(rpMadre, razaMadre, fenacMadre, colorMadre, hbamadre,nombre_md,apodo_md : string): integer;
var
  dt : TDateTime;
begin
    IBQGenExterno.Close;
    IBQGenExterno.Open;

    if ((rpMadre='') or (rpMadre='0')) and ((hbamadre='') or (hbamadre='0')) then
      begin
        Result :=-1;
        exit;
    end;

    //Chequeo que no exista ya en la tabla de animales externos.
    IBQCheckExt.Close;
    IBQCheckExt.ParamByName('rp').AsString := rpMadre;
    IBQCheckExt.ParamByName('hba').AsString := hbaMadre;
    IBQCheckExt.Open;
    if (IBQCheckExt.RecordCount >0) then
      begin
        Result := IBQCheckExt.FieldValues['ID_ANIMAL_EXTERNO'];
        exit;
      end;


    try
      IBQInsertAnimalesExternos.Close;
      IBQInsertAnimalesExternos.ParamByName('id_rp').AsString := rpMadre;
      IBQInsertAnimalesExternos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQInsertAnimalesExternos.ParamByName('id_animal_externo').AsInteger := IBQGenExterno.FieldValues['ID'];
      IBQInsertAnimalesExternos.ParamByName('id_senasa').Value := Null;
      IBQInsertAnimalesExternos.ParamByName('id_pc').Value := Null;
      IBQInsertAnimalesExternos.ParamByName('id_hba').AsString := hbaMadre;
      IBQInsertAnimalesExternos.ParamByName('id_ra').Value := Null;
      IBQInsertAnimalesExternos.ParamByName('id_otro').AsInteger := -1;
      IBQInsertAnimalesExternos.ParamByName('nombre_animal').AsString := nombre_md;
      IBQInsertAnimalesExternos.ParamByName('apodo').AsString := apodo_md;

      if (nombre_md = '') then
         IBQInsertAnimalesExternos.ParamByName('nombre_animal').AsString := rpMadre;

      if (apodo_md = '') then
         IBQInsertAnimalesExternos.ParamByName('apodo').AsString := rpMadre;

      IBQInsertAnimalesExternos.ParamByName('raza').AsString := razaMadre;

      IBQInsertAnimalesExternos.ParamByName('sexo').AsInteger := 2;
      IBQInsertAnimalesExternos.ParamByName('criador').AsString := '0';
      IBQInsertAnimalesExternos.ParamByName('propietario').AsString := '0';
      if (fenacMadre <> '') and (isValidDate(feNacMadre)) then
      begin
        TryStrToDate(feNacMadre, dt);
        IBQInsertAnimalesExternos.ParamByName('fecha_nacimiento').AsDate := dt ;
      end
      else
        IBQInsertAnimalesExternos.ParamByName('fecha_nacimiento').Value := FECHA_NACIMIENTO_DEFECTO;
      IBQInsertAnimalesExternos.ParamByName('adn').AsString := '';
      IBQInsertAnimalesExternos.ParamByName('tipificacion_sanguinea').AsString := '';

      IBQInsertAnimalesExternos.Open;

      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;

    Result := IBQGenExterno.FieldValues['ID'];
end;

procedure TFImpERA.CargarParametrosSP(fecha : string; id, animal, grupoTE : integer);
begin
    IBSPTransferenciaEmbrionaria.ParamByName('fecha').AsDate := StrToDate(fecha);
    IBSPTransferenciaEmbrionaria.ParamByName('animal').AsInteger := animal;
    IBSPTransferenciaEmbrionaria.ParamByName('observacion').AsString := '';
    IBSPTransferenciaEmbrionaria.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBSPTransferenciaEmbrionaria.ParamByName('responsable').AsInteger := 0;
    IBSPTransferenciaEmbrionaria.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
    IBSPTransferenciaEmbrionaria.ParamByName('log_fecha_modificado').AsDate := Now();
    if (grupoTE=0) then
      IBSPTransferenciaEmbrionaria.ParamByName('id_grupo').Value := null
    else
      IBSPTransferenciaEmbrionaria.ParamByName('id_grupo').Value := grupoTE;
    IBSPTransferenciaEmbrionaria.ParamByName('disparador').Value := null;
    IBSPTransferenciaEmbrionaria.ParamByName('fecha_celo').AsDate := StrToDate('01/01/1900');
    IBSPTransferenciaEmbrionaria.ParamByName('horas_poscelo').AsTime := StrToTime('00:00');
    IBSPTransferenciaEmbrionaria.ParamByName('cuerpo_luteo').AsFloat := 0.0;
    IBSPTransferenciaEmbrionaria.ParamByName('utero').AsInteger := 0;
    IBSPTransferenciaEmbrionaria.ParamByName('cuerno_uterino').AsString := 'NN';
    IBSPTransferenciaEmbrionaria.ParamByName('ubicacion').AsInteger := 0;
    IBSPTransferenciaEmbrionaria.ParamByName('dificultad').AsInteger := 0;
    IBSPTransferenciaEmbrionaria.ParamByName('embrion').AsInteger := id;
    IBSPTransferenciaEmbrionaria.ParamByName('centro_transplante').AsInteger := 0;
    IBSPTransferenciaEmbrionaria.ParamByName('condicion_corporal').Value := null;
    IBSPTransferenciaEmbrionaria.ParamByName('reg_celo').value := null;
    IBSPTransferenciaEmbrionaria.ParamByName('precio').AsFloat := 0.0;
    IBSPTransferenciaEmbrionaria.ExecProc;
end;

function TFImpERA.CargarAnimalInterno(rpAnimal, razaAnimal, fecNacAnimal, hbaAnimal, colorAnimal, tr ,nombre,apodoMD,sexo: string): integer;
var
  fechaNac : string;
  dt : TDateTime;
begin
 { DEPRECATED : siempre se invoca ya chequeando si el animal existe
    IBQExisteAnimal.Close;
    IBQExisteAnimal.ParamByName('RP').Value := rpAnimal;
    IBQExisteAnimal.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
    IBQExisteAnimal.Open;

    if (IBQExisteAnimal.IsEmpty) then
 }
    begin

      if ((rpAnimal='') or (rpAnimal='0')) and ((hbaAnimal='') or (hbaAnimal='0')) then
        begin
          Result := -1;
          exit;
        end;

      if (length(fecNacAnimal) = 4) then
        fechaNac := '01/08/'+fecNacAnimal
      else
        fechaNac := fecNacAnimal;

      IBQGenIdAnimal.Close;
      IBQGenIdAnimal.Open;

      IBSPAltaDirectaAnimal.Close;
      IBSPAltaDirectaAnimal.ParamByName('idnuevoanimal').AsInteger := IBQGenIdAnimal.FieldValues['id'];
      IBSPAltaDirectaAnimal.ParamByName('id_rp').AsString := rpAnimal;
      IBSPAltaDirectaAnimal.ParamByName('id_senasa').AsString := '';
      TryStrToDate(fechaNac , dt);
      if (dt = 0) then
            TryStrToDate(FECHA_NACIMIENTO_DEFECTO , dt);
      IBSPAltaDirectaAnimal.ParamByName('fecha_nacimiento').AsDate := dt;
      IBSPAltaDirectaAnimal.ParamByName('peso').Value := Null;
      IBSPAltaDirectaAnimal.ParamByName('madre_biologica_externa').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('estado_lactacion').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('rodeo').AsInteger := 0;

      if (colorAnimal <> '') then
        if (colorAnimal = 'C') then
          IBSPAltaDirectaAnimal.ParamByName('raza').AsInteger := 3
        else
          IBSPAltaDirectaAnimal.ParamByName('raza').AsInteger := 2
      else
        IBSPAltaDirectaAnimal.ParamByName('raza').AsInteger := 0;

      IBSPAltaDirectaAnimal.ParamByName('potrero').AsInteger := 0;
      IBSPAltaDirectaAnimal.ParamByName('categoria').AsInteger := 5;
      IBSPAltaDirectaAnimal.ParamByName('cronologia_dentaria').AsInteger := 0;
      IBSPAltaDirectaAnimal.ParamByName('condicion_corporal').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('gdr').AsInteger := 0;
      IBSPAltaDirectaAnimal.ParamByName('circunferencia_escrotal').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('estado_reproductivo').AsInteger := 0;
      IBSPAltaDirectaAnimal.ParamByName('id_pc').Value := Null;
      IBSPAltaDirectaAnimal.ParamByName('id_hba').Value := hbaAnimal;
      IBSPAltaDirectaAnimal.ParamByName('id_ra').Value := Null;
      IBSPAltaDirectaAnimal.ParamByName('id_otro').Value := Null;
      IBSPAltaDirectaAnimal.ParamByName('nombre').AsString := nombre;
      IBSPAltaDirectaAnimal.ParamByName('apodo').Value := apodoMD;
      IBSPAltaDirectaAnimal.ParamByName('sexo').AsString := sexo;
      IBSPAltaDirectaAnimal.ParamByName('madre_receptora_externa').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('tipo_alta').AsInteger := 3;
      TryStrToDate(fechaNac , dt);
      if (dt = 0) then
            TryStrToDate(FECHA_NACIMIENTO_DEFECTO , dt);

      IBSPAltaDirectaAnimal.ParamByName('fecha_evento').AsDate := dt;
      IBSPAltaDirectaAnimal.ParamByName('precio_bruto').AsFloat := 0.0;
      IBSPAltaDirectaAnimal.ParamByName('precio_unitario').AsFloat := 0.0;
      IBSPAltaDirectaAnimal.ParamByName('observacion').AsString := '';
      IBSPAltaDirectaAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBSPAltaDirectaAnimal.ParamByName('responsable').AsInteger := 0;
      IBSPAltaDirectaAnimal.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
      IBSPAltaDirectaAnimal.ParamByName('log_fecha_modificado').AsDate := Now();
      IBSPAltaDirectaAnimal.ParamByName('id_aux').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('id_auxpe').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('padre_externo').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('disparador').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('id_grupo').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('gastos').AsFloat := 0.0;
      IBSPAltaDirectaAnimal.ParamByName('madre_biologica_interna').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('madre_receptora_interna').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('padre_interno').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('dta').Value := Null;
      IBSPAltaDirectaAnimal.ParamByName('diaspeso').AsString := '';
      IBSPAltaDirectaAnimal.ParamByName('actividad').AsInteger := 3;
      IBSPAltaDirectaAnimal.ParamByName('id_ie').Value := Null;
      IBSPAltaDirectaAnimal.ParamByName('propietario').AsInteger := 0;
      IBSPAltaDirectaAnimal.ParamByName('criador').AsInteger := 0;
      IBSPAltaDirectaAnimal.ParamByName('origen_animal').AsInteger := 0;
      IBSPAltaDirectaAnimal.ParamByName('adn').Value := Null;
      IBSPAltaDirectaAnimal.ParamByName('tipificacion_sanguinea').Value := Null;
      IBSPAltaDirectaAnimal.ParamByName('castrado').Value := null;

      IBQCalcularSubCatego.Close;
      IBQCalcularSubCatego.ParamByName('subcatego').AsString := TR;
      IBQCalcularSubCatego.Open;

      if (IBQCalcularSubCatego.IsEmpty) then
        IBSPAltaDirectaAnimal.ParamByName('subcategoria').AsInteger := 0
      else
        IBSPAltaDirectaAnimal.ParamByName('subcategoria').AsInteger := IBQCalcularSubCatego.FieldValues['id_subcategoria'];

      IBSPAltaDirectaAnimal.ParamByName('codigo_manejo').AsInteger := 0;
      IBSPAltaDirectaAnimal.ParamByName('inspeccion').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('destino').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('mocho').Value := null;
      IBSPAltaDirectaAnimal.ParamByName('color').Value := 0;

      // Agrego los dos campos que faltan, Ivan
      IBSPAltaDirectaAnimal.ParamByName('informado_afip').AsString := 'N';
      IBSPAltaDirectaAnimal.ParamByName('car_oficial').Value := null;
      // Fin campos

      IBSPAltaDirectaAnimal.ExecProc;

      Result := IBQGenIdAnimal.FieldValues['id'];
      FPrincipal.IBTPrincipal.CommitRetaining;
    end  ;
    {
    else
      Result := IBQExisteAnimal.FieldValues['id_animal'];
    }
end;


function TFImpERA.CalcularFechaNacMadreReceptora(fecha : string) : string;
var fechaServ : TDate;
    fechaGenerada : string;
    anio : integer;
begin
{   De acuerdo a lo hablado, si la madre receptora no tiene fecha de nacimiento entonces se le dara como fecha
    de nacimiento: 01/05 de tres años antes a la fecha del servicio.
    Ej.: si la fecha de servicio fué 12/09/2010, la fecha de la receptora sera 01/05/2007.
}
     fechaServ := StrToDate(fecha);

     anio := YearOf(fechaserv);
     anio := anio - 3;

     fechaGenerada := '01/08/' + IntToStr(anio);

     Result := fechaGenerada;
end;

function TFImpERA.CargarPadreExterno(rpPadre, hbaPadre, razaPadre, anioNacPadre, colorPadre, nombrePadre : string): integer;
var
 fechaNac : string;
 dt :TDateTime;
begin
{  DEPRECATED
    IBQExisteAnimalExterno.Close;
    IBQExisteAnimalExterno.ParamByName('rp').Value := rpPadre;
    IBQExisteAnimalExterno.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
    IBQExisteAnimalExterno.Open;

    if (IBQExisteAnimalExterno.IsEmpty) then
}
    begin

      if ((rpPadre='') or (rpPadre='0')) and ((hbaPadre='') or (hbaPadre='0')) then
        begin
          Result :=-1;
          exit;
        end;

         //Chequeo que no exista ya en la tabla de animales externos.
        IBQCheckExt.Close;
        IBQCheckExt.ParamByName('rp').AsString := rpPadre;
        IBQCheckExt.ParamByName('hba').AsString := hbaPadre;
        IBQCheckExt.Open;
        if (IBQCheckExt.RecordCount >0) then
          begin
            Result := IBQCheckExt.FieldValues['ID_ANIMAL_EXTERNO'];
            exit;
        end;

        if anioNacPadre = '' then
          fechaNac := '01/08/2000'
         else
          begin
           fechaNac := '01/01/'+ anioNacPadre;
          end;
        {else
          fechaNac := '01/08/' + anioNacPadre;}

        IBQGenExterno.Close;
        IBQGenExterno.Open;

        try
          IBQInsertAnimalesExternos.Close;
          IBQInsertAnimalesExternos.ParamByName('id_rp').AsString := rpPadre;
          IBQInsertAnimalesExternos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
          IBQInsertAnimalesExternos.ParamByName('id_animal_externo').AsInteger := IBQGenExterno.FieldValues['ID'];
          IBQInsertAnimalesExternos.ParamByName('id_senasa').Value := Null;
          IBQInsertAnimalesExternos.ParamByName('id_pc').Value := Null;
          IBQInsertAnimalesExternos.ParamByName('id_hba').AsString := hbaPadre;
          IBQInsertAnimalesExternos.ParamByName('id_ra').Value := Null;
          IBQInsertAnimalesExternos.ParamByName('id_otro').AsInteger := -1;
          IBQInsertAnimalesExternos.ParamByName('nombre_animal').AsString := nombrePadre;
          IBQInsertAnimalesExternos.ParamByName('apodo').AsString := nombrePadre;

          if (nombrePadre = '') then
            begin
              IBQInsertAnimalesExternos.ParamByName('nombre_animal').AsString := rpPadre;
              IBQInsertAnimalesExternos.ParamByName('apodo').AsString := rpPadre;
          end;


          IBQInsertAnimalesExternos.ParamByName('raza').AsString := razaPadre;

          IBQInsertAnimalesExternos.ParamByName('sexo').AsInteger := 1;
          IBQInsertAnimalesExternos.ParamByName('criador').AsString := '0';
          IBQInsertAnimalesExternos.ParamByName('propietario').AsString := '0';

          if (colorPadre = 'N') or (colorPadre = 'NEGRO') then
            IBQInsertAnimalesExternos.ParamByName('Color').AsString := '1'
          else
          if (colorPadre = 'C') or (colorPadre = 'COLORADO') then
            IBQInsertAnimalesExternos.ParamByName('Color').AsString := '2'
           else
          if (colorPadre = 'B') or (colorPadre = 'BLANCO') then
            IBQInsertAnimalesExternos.ParamByName('Color').AsString := '3';

          TryStrToDate(fechaNac , dt);
          if (dt = 0) then
             TryStrToDate(FECHA_NACIMIENTO_DEFECTO , dt);

          IBQInsertAnimalesExternos.ParamByName('fecha_nacimiento').AsDate := dt;
          IBQInsertAnimalesExternos.ParamByName('adn').AsString := '0';
          IBQInsertAnimalesExternos.ParamByName('tipificacion_sanguinea').AsString := '';

          IBQInsertAnimalesExternos.Open;

          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;

        Result := IBQGenExterno.FieldValues['ID'];
    end ;
{    else
        Result := IBQExisteAnimalExterno.FieldValues['id_animal_externo'];
        }
end;

function TFImpERA.CargarSemen(fecha : string; idAnimal : integer; tipo_p : string) : integer;
var dt : TDateTime;
begin

    IBQGenIdSemen.Close;
    IBQGenIdSemen.Open;

    IBQTabSemen.Close;
    IBQTabSemen.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQTabSemen.ParamByName('id_semen').AsInteger := IBQGenIdSemen.FieldValues['id'];
    if tipo_p = 'I' then
      begin
        IBQTabSemen.ParamByName('animal').AsInteger := idAnimal;
        IBQTabSemen.ParamByName('animal_externo').Value := null;
    end
    else
      begin
        IBQTabSemen.ParamByName('animal_externo').AsInteger := idAnimal;
        IBQTabSemen.ParamByName('animal').Value := null;
    end;

    IBQTabSemen.ParamByName('cantidad').AsInteger := 0;
    IBQTabSemen.ParamByName('certificado').AsInteger := 0;
    IBQTabSemen.Open;

    IBSPMovimientoDeSemen.Close;
    IBSPMovimientoDeSemen.ParamByName('semen').AsInteger := IBQGenIdSemen.FieldValues['id'];
    IBSPMovimientoDeSemen.ParamByName('nuevacantidad').AsInteger := 1;

    TryStrToDate(fecha, dt);
    if (dt = 0) then
            TryStrToDate(FECHA_NACIMIENTO_DEFECTO , dt);

    IBSPMovimientoDeSemen.ParamByName('fecha').AsDate := dt;
    IBSPMovimientoDeSemen.ParamByName('precio').AsFloat := 0.0;
    IBSPMovimientoDeSemen.ParamByName('tipo').AsInteger := 1;
    IBSPMovimientoDeSemen.ParamByName('centro_inseminacion').Value := Null;
    IBSPMovimientoDeSemen.ParamByName('observacion').AsString := '';
    IBSPMovimientoDeSemen.ParamByName('nuevocertificado').Value := Null;
    IBSPMovimientoDeSemen.ParamByName('tipo_baja').Value := 1;
    IBSPMovimientoDeSemen.ParamByName('cliente').Value := Null;
    IBSPMovimientoDeSemen.ParamByName('congelo').Value := 'S';
    IBSPMovimientoDeSemen.ParamByName('nro_remito').Value := Null;
    IBSPMovimientoDeSemen.ExecProc;

    Result := IBQGenIdSemen.FieldValues['id'];

end;

function TFImpERA.CargarServicioParaInseminacion(fecha : string) : integer;
var nombreServicio : string;
    id_servic : integer;
begin
    try
       IBQServicioNatural.Close;
       nombreServicio := 'SERVICIO ' + fecha;
       IBQServicioNatural.ParamByName('NOMBRE').AsString := nombreServicio;
       IBQServicioNatural.ParamByName('FECHA_INICIO').AsDate := StrToDateTime(fecha);
       IBQServicioNatural.ParamByName('FECHA_FIN_ESTIMADA').AsDate := StrToDateTime(fecha);
       IBQServicioNatural.ParamByName('ACTIVO').AsString := 'N';
       IBQServicioNatural.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
       IBQServicioNatural.ParamByName('TIPO').AsInteger := 3;
       IBQServicioNatural.ParamByName('POTRERO').Value := null;
       IBQServicioNatural.Open;
       FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;

    id_servic := IBQServicioNatural.FieldValues['ID_SERVICIO'];

    Result := id_servic;
end;

procedure TFImpERA.CargarInseminacionArtificial(fechaServ: string; id_animal, id_servicio, id_semen, grupoIA : integer);
var
 dt : TDatetime;
begin
   try
    IBSPInseminacion.Close;
    TryStrToDate(fechaServ , dt);
    IBSPInseminacion.ParamByName('fecha').AsDate := dt;
    IBSPInseminacion.ParamByName('cantidad').AsInteger := 1;
    IBSPInseminacion.ParamByName('observacion').AsString := '';
    IBSPInseminacion.ParamByName('semen').AsInteger := id_semen;
    IBSPInseminacion.ParamByName('precio').AsFloat := 0.0;
    IBSPInseminacion.ParamByName('responsable').AsInteger := 0;
    IBSPInseminacion.ParamByName('tipo').Value := Null;
    IBSPInseminacion.ParamByName('animal').AsInteger := id_animal;
    if (grupoIA=0) then
      IBSPInseminacion.ParamByName('id_grupo').Value := null
    else
      IBSPInseminacion.ParamByName('id_grupo').Value := grupoIA;
    //IBSPInseminacion.ParamByName('id_grupo').Value := Null;
    IBSPInseminacion.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBSPInseminacion.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
    IBSPInseminacion.ParamByName('servicio').AsInteger := id_servicio;
    IBSPInseminacion.ParamByName('condicion_corporal').Value := Null;
    IBSPInseminacion.ParamByName('hora').AsTime := Time();
    IBSPInseminacion.ParamByName('hora_fin').AsTime := Time();
    IBSPInseminacion.ParamByName('horas_post_celo').Value := Null;
    IBSPInseminacion.ParamByName('log_fecha_modificado').AsDate := Now();
    IBSPInseminacion.ParamByName('rodeo').Value := Null;
    IBSPInseminacion.ParamByName('potrero').Value := Null;

    IBSPInseminacion.ExecProc;

    FPrincipal.IBTPrincipal.CommitRetaining;

    Inc(Servicios);
    LServicios.Caption :=  '('+IntToStr(Servicios)+')';

   except
    FPrincipal.IBTPrincipal.RollbackRetaining;
   end;

end;


procedure TFImpERA.ISalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFImpERA.LSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFImpERA.IEra2Click(Sender: TObject);
var
  F : TFImpERA1;
begin
  if ODAngus.Execute then
  begin
    Hide;
    F := TFImpERA1.Create(self,ODAngus.FileName);
    F.ShowModal;
    F.Destroy;
    Close;
  end;
end;

end.
