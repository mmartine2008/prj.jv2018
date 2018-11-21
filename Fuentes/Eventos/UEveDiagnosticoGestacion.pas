unit UEveDiagnosticoGestacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  Buttons, ExtCtrls, DBCtrls, UDBLookupComboBoxAuto, DateUtils,
  DateTimePickerAuto, EditAuto, Mask, UFrameMangazo, DataExport, DataToXLS,
  WinXP, UREPServicios, UREPDenunciaServicio,UDMSoftVet, Types, UModificacionParametros,
  ImgList, PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls,
  JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom, XMLIntf,
  msxmldom, XMLDoc, Menus;

type
  RegGestacion = record
    dias : integer;
    dist : integer;
  end;
  RegConf = record
    cuerpo : double;
    cabeza : double;
    cola : double;
  end;
  ArrCasosGestacion = Array [0..3] of RegGestacion;
  RegArrGestacion = record
    id_animal : integer;
    Gestacion : ArrCasosGestacion;
  end;

  TFEveDiagnosticoGestacion = class(TFEveSimple)
    LResponsable: TLabel;
    LFecha: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    DBLCBACondicionCorporal: TDBLookupComboBoxAuto;
    LCondicionCorporal: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LCronologiaDentaria: TLabel;
    DBLCBACronologiaDentaria: TDBLookupComboBoxAuto;
    LEstadoReproductivo: TLabel;
    DBLCBAEstadoReproductivo: TDBLookupComboBoxAuto;
    Label1: TLabel;
    DBLCBAMetodoDiagnostico: TDBLookupComboBoxAuto;
    CBMustreo: TCheckBox;
    GBDatosVacia: TGroupBox;
    LCondicionUtero: TLabel;
    LCondicionOvario: TLabel;
    LCondicionCervix: TLabel;
    CBRechazo: TCheckBox;
    CBMuestreoMucus: TCheckBox;
    DBLCBACondicionUtero: TDBLookupComboBoxAuto;
    DBLCBACondicionOvario: TDBLookupComboBoxAuto;
    DBLCBACondicionCervix: TDBLookupComboBoxAuto;
    TSUbicaciones: TTabSheet;
    GBUbicacionVacias: TGroupBox;
    CBUbicacionVacias: TCheckBox;
    GBUbicacionPreniadas: TGroupBox;
    CBUbicacionPreniadas: TCheckBox;
    LNuevoPotreroVacia: TLabel;
    LNuevoPotreroPreniada: TLabel;
    DBLCBANuevoPotreroVacias: TDBLookupComboBoxAuto;
    DSPotreroVacias: TDataSource;
    DSPotreroPreniadas: TDataSource;
    IBQPotreroVacias: TIBQuery;
    IBQPotreroPreniadas: TIBQuery;
    IBQPotreroVaciasID_POTRERO: TIntegerField;
    IBQPotreroVaciasNOMBRE: TIBStringField;
    DBLCBANuevoPotreroPreniadas: TDBLookupComboBoxAuto;
    IBQConsultaGenericosSN: TIBQuery;
    DSGenericosSN: TDataSource;
    IBQValidacion: TIBQuery;
    IBQAux: TIBQuery;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_AUX_EVENTO: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleID_CONDICION_CORPORAL: TIntegerField;
    IBDSSimpleCONDICION_CORPORAL: TFloatField;
    IBDSSimpleID_CRONOLOGIA_DENTARIA: TIntegerField;
    IBDSSimpleCRONOLOGIA_DENTARIA: TIBStringField;
    IBDSSimpleID_ESTADO_REPRODUCTIVO: TIntegerField;
    IBDSSimpleESTADO_REPRODUCTIVO: TIBStringField;
    IBDSSimpleID_METODO_DIAGNOSTICO: TIntegerField;
    IBDSSimpleMETODO_DIAGNOSTICO: TIBStringField;
    IBDSSimpleDIAS_GESTACION: TIntegerField;
    IBDSSimpleID_CONDICION_UTERO: TIBStringField;
    IBDSSimpleCONDICION_UTERO: TIBStringField;
    IBDSSimpleID_CONDICION_OVARIO: TIBStringField;
    IBDSSimpleCONDICION_OVARIO: TIBStringField;
    IBDSSimpleID_CONDICION_CERVIX: TIBStringField;
    IBDSSimpleCONDICION_CERVIX: TIBStringField;
    IBDSSimpleID_MUESTREO: TIBStringField;
    IBDSSimpleMUESTREO: TIBStringField;
    IBDSSimpleID_RECHAZO: TIBStringField;
    IBDSSimpleRECHAZO: TIBStringField;
    IBDSSimpleID_MUESTREOMUCUS: TIBStringField;
    IBDSSimpleMUESTREOMUCUS: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    TBDiasGestacion: TTrackBar;
    LChico: TLabel;
    LMediano: TLabel;
    LGrande: TLabel;
    LPeriodosPreniez: TLabel;
    GBPreniadas: TGroupBox;
    LDiasGestacion: TLabel;
    EADiasGestacion: TEditAuto;
    UDDiasGestacion: TUpDown;
    GroupBox2: TGroupBox;
    LFIni: TLabel;
    DTPAFechaIni: TDateTimePickerAuto;
    DTPAFechaFin: TDateTimePickerAuto;
    LFFin: TLabel;
    IBQDatosDiag: TIBQuery;
    IBQCodCACUCO: TIBQuery;
    IBDSSimpleID_DISTCACUCO: TIntegerField;
    IBDSSimpleDISTCACUCO: TIBStringField;
    DBLCBACACUCO: TDBLookupComboBoxAuto;
    LDiasDist: TLabel;
    LConfDist: TLabel;
    IBQDiasRaza: TIBQuery;
    IBQVentanaGestacion: TIBQuery;
    LLinkEstServ: TLabel;
    LLinkDenServ: TLabel;
    LServicio: TLabel;
    Label3: TLabel;
    EAPrecio: TEditAuto;
    Label2: TLabel;
    IBDSSimpleD1: TDateField;
    IBDSSimpleD2: TDateField;
    IBQAuxAnimal: TIBQuery;
    IBQDiasGestEmbrion: TIBQuery;
    LTransMasivo: TLabel;
    LTransIndividual: TLabel;
    IBQDiasGestInd: TIBQuery;
    DSDistCACUCOIA: TDataSource;
    IBQDistCACUCOIA: TIBQuery;
    IBQDistCACUCOIAID_DIST_CACUCO: TIntegerField;
    IBQDistCACUCOIANOMBRE: TIBStringField;
    IBQDistCACUCOIAFECHA_SERV: TDateField;
    IBQServiciosAdicionales: TIBQuery;
    MServicios: TMemo;
    IBQCondCorp: TIBQuery;
    IBQParametroCC: TIBQuery;
    DSCondCorp: TDataSource;
    {#1 INICIO 28/11/2014 Matias Rizzi}
    ODExcel: TOpenDialog;
    {#1 FIN 28/11/2014 Matias Rizzi}

    procedure FormCreate(Sender: TObject);
    procedure ControlReales(Sender: TObject; var Key: Char);    
    procedure DBLCBAEstadoReproductivoCloseUp(Sender: TObject);
    procedure CBUbicacionVaciasClick(Sender: TObject);
    procedure CBUbicacionPreniadasClick(Sender: TObject);
    procedure Change(Sender: TField);
    procedure BDBGSimpleCellClick(Column: TColumn);
    procedure Validate(Sender: TField);
    procedure SetText(Sender: TField; const Text: String);
    procedure BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure EADiasGestacionKeyPress(Sender: TObject; var Key: Char);
    procedure IBQPotreroVaciasAfterOpen(DataSet: TDataSet);
    procedure IBDSSimpleDIAS_GESTACIONSetText(Sender: TField;
      const Text: String);
    procedure EADiasGestacionChange(Sender: TObject);
    procedure RBDistClick(Sender : TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLCBACACUCOCloseUp(Sender: TObject);
    procedure LLinkEstServClick(Sender: TObject);
    procedure LLinkDenServClick(Sender: TObject);
    procedure PCBasicoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure LResponsableClick(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure LNuevoPotreroVaciaClick(Sender: TObject);
    procedure LNuevoPotreroVaciaMouseEnter(Sender: TObject);
    procedure LNuevoPotreroVaciaMouseLeave(Sender: TObject);
    procedure LNuevoPotreroPreniadaClick(Sender: TObject);
    procedure LNuevoPotreroPreniadaMouseEnter(Sender: TObject);
    procedure LNuevoPotreroPreniadaMouseLeave(Sender: TObject);
    procedure EAPrecioChange(Sender: TObject);
    procedure UDDiasGestacionChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure Label2Click(Sender: TObject);
    procedure CapturarEvento(Sender : TObject);
    procedure DTPAFechaExit(Sender: TObject);
    procedure DTPAFechaIniExit(Sender: TObject);
    procedure DTPAFechaFinExit(Sender: TObject);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure ATerminarExecute(Sender: TObject);
    procedure BBXlsImportClick(Sender: TObject);
    procedure BDBGSimpleColEnter(Sender: TObject);
    procedure IBQDistCACUCOIAAfterOpen(DataSet: TDataSet);
  protected
    Procedure CargarParametrosRN;override;
    Procedure CargarParametrosSP;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure importarDeMovil;override;
    procedure cargarDatos(i:integer);override;
  private
    dist, conf, Indice_Gral, indice_config, Ventana,  tipo_servicio, Condicion : integer;
    cuerpo, cabeza, cola : double;
    DatosConf : Array [0..3] of RegConf;
    Gestacion : Array of RegArrGestacion;
    directo : boolean;
    vacia, mostrar_error_1, mostrar_error_2 : boolean;
    Precio : double;
    Dias_Tacto_Servicio : Integer;
    cambio_preniez,deAlta : boolean;
    servicio : Integer;
    transferencia : Boolean;
    procedure DiasGestacionValidos(var dias : integer; ID : integer);
    function BuscarAnimal(id_animal : integer) : integer;
    procedure CalcularCasosPorDistribucion(distribucion : String; ID : Integer);
    procedure CalcularCasosPorDistribucionEspecifico(distribucion : Integer; ID : Integer);
    procedure CalcularCasosPorDiasGestacion(dias_gestacion : integer; ID : integer);
    procedure CalcularDistribucion(por_dist : boolean);
    procedure VerificarCambioEstadoReproductivo();
    procedure VerificarCambiosConEstadoReproductivo(Sender: TField);
    procedure HabilitarPreniez();
    function CalcularServicio():Boolean;
    procedure CalcularDatosGestacion();
    procedure AgregarAuxParaIndividual();
    procedure BorrarAuxiliares();
    procedure CalcularCC;
    {#1 INICIO 28/11/2014 Matias Rizzi}
    procedure ImportarArchivo;
    {#1 FIN 28/11/2014 Matias Rizzi}

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEveDiagnosticoGestacion: TFEveDiagnosticoGestacion;
  dias_minimos : integer;

implementation

uses  UPrincipal, UClassType, UEveUniversal, Math, UMensajeHuella,
      UABMEmpleados, UABMPotreros, UABMSimple, UFunctions,UImportacion,
      UEveAltaMasiva, UTraduccion, UImpXML;

{$R *.dfm}

// create
// para cargar los datos en la grilla
procedure TFEveDiagnosticoGestacion.CargarDatosGrilla;
var
  dias_gest, gest_embrion : integer;
  dg : Variant;
begin
  inherited;
     IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value := MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];

    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
    RealizarCambio(DTPAFechaIni,[IBDSSimple.FieldByName('D1')],[DTPAFechaIni.GetDato]);
    RealizarCambio(DTPAFechaFin,[IBDSSimple.FieldByName('D2')],[DTPAFechaFin.GetDato]);
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[DBLCBAResponsable.KeyValue,DBLCBAResponsable.Text]);
    if (DBLCBACondicionCorporal.KeyValue <> NULL) then
      begin
        RealizarCambio(DBLCBACondicionCorporal,[IBDSSimple.FieldByName('ID_CONDICION_CORPORAL'),IBDSSimple.FieldByName('CONDICION_CORPORAL')],[DBLCBACondicionCorporal.KeyValue,DBLCBACondicionCorporal.Text]);
      end;

    RealizarCambio(DBLCBACronologiaDentaria,[IBDSSimple.FieldByName('ID_CRONOLOGIA_DENTARIA'),IBDSSimple.FieldByName('CRONOLOGIA_DENTARIA')],[DBLCBACronologiaDentaria.KeyValue,DBLCBACronologiaDentaria.Text]);
    RealizarCambio(DBLCBAEstadoReproductivo,[IBDSSimple.FieldByName('ID_ESTADO_REPRODUCTIVO'),IBDSSimple.FieldByName('ESTADO_REPRODUCTIVO')],[DBLCBAEstadoReproductivo.KeyValue,DBLCBAEstadoReproductivo.Text]);
    RealizarCambio(DBLCBAMetodoDiagnostico,[IBDSSimple.FieldByName('ID_METODO_DIAGNOSTICO'),IBDSSimple.FieldByName('METODO_DIAGNOSTICO')],[DBLCBAMetodoDiagnostico.KeyValue,DBLCBAMetodoDiagnostico.Text]);
    if (CBMustreo.Checked) then
      begin
        RealizarCambio(CBMustreo,[IBDSSimple.FieldByName('Muestreo'),IBDSSimple.FieldByName('id_Muestreo')],['SI','S']);
      end
    else
      begin
        RealizarCambio(CBMustreo,[IBDSSimple.FieldByName('Muestreo'),IBDSSimple.FieldByName('id_Muestreo')],['NO','N']);
      end;

    if (DBLCBAEstadoReproductivo.KeyValue=2) then
    begin
      // para poner los dias de gestacion si fueron ingresados
      if (EADiasGestacion.Text <> '') then
        dias_gest := StrToInt(EADiasGestacion.Text)
      else
        dias_gest := 0;

      if transferencia then
      begin
        IBQDiasGestEmbrion.Close;
        IBQDiasGestEmbrion.ParamByName('id').AsInteger := IBDSSimpleID_Animal.AsInteger;
        IBQDiasGestEmbrion.ParamByName('grupo').AsInteger := Servicio;
        IBQDiasGestEmbrion.Open;
        dg := IBQDiasGestEmbrion.FieldValues['dias'];
        if IBQDiasGestEmbrion.IsEmpty then
        begin
          IBQDiasGestInd.Close;
          IBQDiasGestInd.ParamByName('eve').AsInteger := Servicio;
          IBQDiasGestInd.Open;
          dg := IBQDiasGestInd.FieldValues['dias_gestacion'];
        end;
        if  dg <> null then
          gest_embrion := dg
        else
          gest_embrion := 0;
        dias_gest := dias_gest + gest_embrion;
      end;

      RealizarCambio(EADiasGestacion,[IBDSSimple.FieldByName('DIAS_GESTACION')],[dias_gest]);
      RealizarCambio(DBLCBACACUCO,[IBDSSimple.FieldByName('id_distcacuco'),IBDSSimple.FieldByName('distcacuco')],[DBLCBACACUCO.KeyValue,DBLCBACACUCO.Text]);
      //estas lineas se desactivaron para evitar el error [1-313] (ver bugnet). Evaluar que cambios funcionales producen, en principio funciona todo igual...
      Gestacion[Indice_Gral].id_animal := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
      Gestacion[Indice_Gral].Gestacion := Gestacion[0].Gestacion;
      Inc(Indice_Gral);

      RealizarCambio(nil,[IBDSSimple.FieldByName('Rechazo'),IBDSSimple.FieldByName('id_Rechazo')],['NO','N']);
      RealizarCambio(nil,[IBDSSimple.FieldByName('MUESTREOMUCUS'),IBDSSimple.FieldByName('id_MUESTREOMUCUS')],['NO','N']);
      RealizarCambio(nil,[IBDSSimple.FieldByName('ID_CONDICION_UTERO'),IBDSSimple.FieldByName('CONDICION_UTERO')],['N','NORMAL']);
      RealizarCambio(nil,[IBDSSimple.FieldByName('ID_CONDICION_OVARIO'),IBDSSimple.FieldByName('CONDICION_OVARIO')],['N','NORMAL']);
      RealizarCambio(nil,[IBDSSimple.FieldByName('ID_CONDICION_CERVIX'),IBDSSimple.FieldByName('CONDICION_CERVIX')],['N','NORMAL']);
    end
    else
    begin

        //if IBDSSimple.FieldByName('DIAS_GESTACION').Value=0 then
        RealizarCambio(nil,[IBDSSimple.FieldByName('DIAS_GESTACION')],[0]);
        RealizarCambio(DBLCBACondicionUtero,[IBDSSimple.FieldByName('ID_CONDICION_UTERO'),IBDSSimple.FieldByName('CONDICION_UTERO')],[DBLCBACondicionUtero.KeyValue,DBLCBACondicionUtero.Text]);
        RealizarCambio(DBLCBACondicionOvario,[IBDSSimple.FieldByName('ID_CONDICION_OVARIO'),IBDSSimple.FieldByName('CONDICION_OVARIO')],[DBLCBACondicionOvario.KeyValue,DBLCBACondicionOvario.Text]);
        RealizarCambio(DBLCBACondicionCervix,[IBDSSimple.FieldByName('ID_CONDICION_CERVIX'),IBDSSimple.FieldByName('CONDICION_CERVIX')],[DBLCBACondicionCervix.KeyValue,DBLCBACondicionCervix.Text]);
        if (CBRechazo.Checked) then
        begin
            RealizarCambio(CBRechazo,[IBDSSimple.FieldByName('Rechazo'),IBDSSimple.FieldByName('id_Rechazo')],['SI','S']);
        end
        else
        begin
            RealizarCambio(CBRechazo,[IBDSSimple.FieldByName('Rechazo'),IBDSSimple.FieldByName('id_Rechazo')],['NO','N']);
        end;

        if (CBMuestreoMucus.Checked) then
        begin
            RealizarCambio(CBMuestreoMucus,[IBDSSimple.FieldByName('MUESTREOMUCUS'),IBDSSimple.FieldByName('id_MUESTREOMUCUS')],['SI','S']);
        end
        else
        begin
            RealizarCambio(CBMuestreoMucus,[IBDSSimple.FieldByName('MUESTREOMUCUS'),IBDSSimple.FieldByName('id_MUESTREOMUCUS')],['NO','N']);
        end;
    end;
    if deAlta then
    begin
        IBDSSimple.FieldByName('ID_CRONOLOGIA_DENTARIA').Value:= MSimple.IBQSeleccionados.Lookup('ID_ANIMAL',IBDSSimple.FieldByName('ID_ANIMAL').Value,'CRONOLOGIA_DENTARIA');
        IBDSSimple.FieldByName('ID_CONDICION_CORPORAL').Value:= MSimple.IBQSeleccionados.Lookup('ID_ANIMAL',IBDSSimple.FieldByName('ID_ANIMAL').Value,'CONDICION_CORPORAL');
        IBDSSimple.FieldByName('CRONOLOGIA_DENTARIA').Value:= DBLCBACronologiaDentaria.ListSource.DataSet.Lookup('ID_CRONOLOGIA_DENTARIA',IBDSSimple.FieldByName('ID_CRONOLOGIA_DENTARIA').Value,'SINONIMO');
        IBDSSimple.FieldByName('CONDICION_CORPORAL').Value:= DBLCBACondicionCorporal.ListSource.DataSet.Lookup('ID_CONDICION_CORPORAL',IBDSSimple.FieldByName('ID_CONDICION_CORPORAL').Value,'escala');
    end;
end;

// para cargar cuando es masivo
procedure TFEveDiagnosticoGestacion.CargarParametrosMasivo;
var compResult:Integer;//agregue codigo
    ind_animal, animal : integer;
begin
  inherited;
  // DATOS GENERICOS
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('FECHA').AsDate := IBDSSimple.FieldValues['FECHA'];
  if((IBDSSimple.FieldValues['distcacuco'] <> 'CABEZA') and (IBDSSimple.FieldValues['distcacuco'] <> 'CUERPO') and (IBDSSimple.FieldValues['distcacuco'] <> 'COLA'))then
    begin
      IBQSPEventoInd.ParamByName('FECHA_INI').AsDate := IBDSSimple.FieldValues['D1'];
      IBQSPEventoInd.ParamByName('FECHA_FIN').AsDate := IBDSSimple.FieldValues['D1'];
    end
  else
    begin
      IBQSPEventoInd.ParamByName('FECHA_INI').AsDate := IBDSSimple.FieldValues['D1'];
      IBQSPEventoInd.ParamByName('FECHA_FIN').AsDate := IBDSSimple.FieldValues['D2'];
    end;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;

  // MODIFICABLES
  IBQSPEventoInd.ParamByName('DIAS_GESTACION').Value := IBDSSimple.FieldValues['DIAS_GESTACION'];
  IBQSPEventoInd.ParamByName('CRONOLOGIA_DENTARIA').Value := IBDSSimple.FieldValues['ID_CRONOLOGIA_DENTARIA'];
  IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := IBDSSimple.FieldValues['ID_CONDICION_CORPORAL'];
  IBQSPEventoInd.ParamByName('METODO_DIAGNOSTICO').Value := IBDSSimple.FieldValues['ID_METODO_DIAGNOSTICO'];
  IBQSPEventoInd.ParamByName('ESTADO_REPRODUCTIVO').Value := IBDSSimple.FieldValues['ID_ESTADO_REPRODUCTIVO'];

  IBQSPEventoInd.ParamByName('MUESTREO').Value := IBDSSimple.FieldValues['id_MUESTREO'];
  IBQSPEventoInd.ParamByName('MUCUS').Value := IBDSSimple.FieldValues['id_MUESTREOMUCUS'];

  IBQSPEventoInd.ParamByName('CONDICION_UTERO').Value := IBDSSimple.FieldValues['ID_CONDICION_UTERO'];
  IBQSPEventoInd.ParamByName('CONDICION_OVARIO').Value := IBDSSimple.FieldValues['ID_CONDICION_OVARIO'];
  IBQSPEventoInd.ParamByName('CONDICION_CERVIX').Value := IBDSSimple.FieldValues['ID_CONDICION_CERVIX'];

  IBQSPEventoInd.ParamByName('RECHAZO').Value := IBDSSimple.FieldValues['id_RECHAZO'];

  animal := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := animal;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := IBDSSimple.FieldValues['RESPONSABLE'];
   if IBQSPEventoInd.ParamByName('ESTADO_REPRODUCTIVO').Value <> 1 then
    begin
    ind_animal := BuscarAnimal(animal);
    IBQSPEventoInd.ParamByName('DIAS_0').AsInteger := Gestacion[ind_animal].Gestacion[0].dias;
    IBQSPEventoInd.ParamByName('DISTRIBUCION_0').AsInteger := Gestacion[ind_animal].Gestacion[0].dist;
    IBQSPEventoInd.ParamByName('DIAS_1').AsInteger := Gestacion[ind_animal].Gestacion[1].dias;
    IBQSPEventoInd.ParamByName('DISTRIBUCION_1').AsInteger := Gestacion[ind_animal].Gestacion[1].dist;
    IBQSPEventoInd.ParamByName('DIAS_2').AsInteger := Gestacion[ind_animal].Gestacion[2].dias;
    IBQSPEventoInd.ParamByName('DISTRIBUCION_2').AsInteger := Gestacion[ind_animal].Gestacion[2].dist;
    IBQSPEventoInd.ParamByName('DIAS_3').AsInteger := Gestacion[ind_animal].Gestacion[3].dias;
    IBQSPEventoInd.ParamByName('DISTRIBUCION_3').AsInteger := Gestacion[ind_animal].Gestacion[3].dist;
    end;

  IBQSPEventoInd.ParamByName('PRECIO').AsFloat := Precio;
        // CAMBIO DE UBICACION PARA LOS CASOS DE SELECCION DE NUEVAS UBICACIONES
  {if ((CBUbicacionVacias.Checked) and (DBLCBAEstadoReproductivo.KeyValue=1)) then
    IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBANuevoPotreroVacias.KeyValue;
  if ((CBUbicacionPreniadas.Checked) and (DBLCBAEstadoReproductivo.KeyValue=2)) then
    IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBANuevoPotreroPreniadas.KeyValue;}


        // CAMBIO DE UBICACION PARA LOS CASOS DE SELECCION DE NUEVAS UBICACIONES

  compResult:= StrComp(PChar(IBDSSimple.FieldByName('ESTADO_REPRODUCTIVO').AsString),PChar('VACIA'));  //agregue codigo
  if ((CBUbicacionVacias.Checked) and  (compResult=0)) then //agregue codigo
    IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBANuevoPotreroVacias.KeyValue;

  compResult:= StrComp(PChar(IBDSSimple.FieldByName('ESTADO_REPRODUCTIVO').AsString),PChar('PREÑADA')); //agregue codigo
  if ((CBUbicacionPreniadas.Checked) and (compResult=0)) then
    IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBANuevoPotreroPreniadas.KeyValue;

  //showmessage(IBDSSimple.FieldByName('ESTADO_REPRODUCTIVO').AsString);

  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('grupo').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;

end;

// cargar parametros para las reglas del negocio
procedure TFEveDiagnosticoGestacion.CargarParametrosRN;
begin
  inherited;
  IBQSPRN.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  if(self.ModoEve = meIndividual)then
    begin
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
      IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
      IBQSPRN.ParamByName('Ini').AsDate := DTPAFechaIni.Date;
      IBQSPRN.ParamByName('Fin').AsDate := DTPAFechaFin.Date;
      if (GBDatosVacia.Visible) then
      begin
        IBQSPRN.ParamByName('repro').AsInteger := 0;
        IBQSPRN.ParamByName('dias').AsInteger := 0;
      end
      else
      begin
        IBQSPRN.ParamByName('repro').AsInteger := 1;
        IBQSPRN.ParamByName('dias').AsInteger := StrToInt(EADiasGestacion.Text);
      end;
    end
  else
    begin
      IBQSPRN.ParamByName('animal').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
      IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
      IBQSPRN.ParamByName('Ini').AsDate := DTPAFechaIni.Date;
      IBQSPRN.ParamByName('Fin').AsDate := DTPAFechaFin.Date;
      IBQSPRN.ParamByName('dias').AsInteger := IBDSSimple.fieldbyname('dias_gestacion').AsInteger;
      if (UpperCase(IBDSSimple.fieldbyname('ESTADO_REPRODUCTIVO').AsString) = 'VACIA') then
        IBQSPRN.ParamByName('repro').AsInteger := 0
      else
        IBQSPRN.ParamByName('repro').AsInteger := 1;
    end;
end;

// para cargar los parametros del store procedure correspondiente al evento
procedure TFEveDiagnosticoGestacion.CargarParametrosSP;
var
  ind_animal : integer;
begin
  inherited;
  IBQSPEventoInd.ParamByName('DIAS_GESTACION').AsInteger := StrToInt(EADiasGestacion.Text);
  IBQSPEventoInd.ParamByName('CRONOLOGIA_DENTARIA').Value := DBLCBACronologiaDentaria.KeyValue;
  IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := DBLCBACondicionCorporal.KeyValue;
  IBQSPEventoInd.ParamByName('METODO_DIAGNOSTICO').Value := DBLCBAMetodoDiagnostico.KeyValue;
  IBQSPEventoInd.ParamByName('ESTADO_REPRODUCTIVO').Value := DBLCBAEstadoReproductivo.KeyValue;

  if (CBMustreo.Checked) then
    IBQSPEventoInd.ParamByName('MUESTREO').AsString := 'S'
  else
    IBQSPEventoInd.ParamByName('MUESTREO').AsString := 'N';

  if (GBDatosVacia.Visible) then
    begin
      IBQSPEventoInd.ParamByName('DIAS_GESTACION').AsInteger := 0;
      // DIAGNOSTICO DE MUCUS
      if (CBMuestreoMucus.Checked) then
        IBQSPEventoInd.ParamByName('MUCUS').AsString := 'S'
      else
        IBQSPEventoInd.ParamByName('MUCUS').AsString := 'N';
      // ANIMAL RECHAZADO
      if (CBRechazo.Checked) then
        IBQSPEventoInd.ParamByName('RECHAZO').AsString := 'S'
      else
        IBQSPEventoInd.ParamByName('RECHAZO').AsString := 'N';

      IBQSPEventoInd.ParamByName('CONDICION_UTERO').Value := DBLCBACondicionUtero.KeyValue;
      IBQSPEventoInd.ParamByName('CONDICION_OVARIO').Value := DBLCBACondicionOvario.KeyValue;
      IBQSPEventoInd.ParamByName('CONDICION_CERVIX').Value := DBLCBACondicionCervix.KeyValue;
    end
  else
    begin
      IBQSPEventoInd.ParamByName('CONDICION_UTERO').Value := 'N';
      IBQSPEventoInd.ParamByName('CONDICION_OVARIO').Value := 'N';
      IBQSPEventoInd.ParamByName('CONDICION_CERVIX').Value := 'N';
      IBQSPEventoInd.ParamByName('MUCUS').AsString := 'N';
      IBQSPEventoInd.ParamByName('RECHAZO').AsString := 'N';
      ind_animal := BuscarAnimal(IDAnimal);
      IBQSPEventoInd.ParamByName('DIAS_0').AsInteger := Gestacion[ind_animal].Gestacion[0].dias;
      IBQSPEventoInd.ParamByName('DISTRIBUCION_0').AsInteger := Gestacion[ind_animal].Gestacion[0].dist;
      IBQSPEventoInd.ParamByName('DIAS_1').AsInteger := Gestacion[ind_animal].Gestacion[1].dias;
      IBQSPEventoInd.ParamByName('DISTRIBUCION_1').AsInteger := Gestacion[ind_animal].Gestacion[1].dist;
      IBQSPEventoInd.ParamByName('DIAS_2').AsInteger := Gestacion[ind_animal].Gestacion[2].dias;
      IBQSPEventoInd.ParamByName('DISTRIBUCION_2').AsInteger := Gestacion[ind_animal].Gestacion[2].dist;
      IBQSPEventoInd.ParamByName('DIAS_3').AsInteger := Gestacion[ind_animal].Gestacion[3].dias;
      IBQSPEventoInd.ParamByName('DISTRIBUCION_3').AsInteger := Gestacion[ind_animal].Gestacion[3].dist;
    end;


  // CAMBIO DE UBICACION PARA LOS CASOS DE SELECCION DE NUEVAS UBICACIONES
  if ((CBUbicacionVacias.Checked) and (DBLCBAEstadoReproductivo.KeyValue= 1)) then
    IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBANuevoPotreroVacias.KeyValue;
  if ((CBUbicacionPreniadas.Checked) and (DBLCBAEstadoReproductivo.KeyValue= 2)) then
    IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBANuevoPotreroPreniadas.KeyValue;

  if((DBLCBACACUCO.Text <> 'CABEZA') and (DBLCBACACUCO.Text <> 'CUERPO') and (DBLCBACACUCO.Text <> 'COLA')) then
    begin
      IBQSPEventoInd.ParamByName('FECHA_INI').Value := DTPAFechaIni.GetDato;
      IBQSPEventoInd.ParamByName('FECHA_FIN').Value := DTPAFechaIni.GetDato;
    end
  else
    begin
      IBQSPEventoInd.ParamByName('FECHA_INI').Value := DTPAFechaIni.GetDato;
      IBQSPEventoInd.ParamByName('FECHA_FIN').Value := DTPAFechaFin.GetDato;
    end;  
  IBQSPEventoInd.ParamByName('FECHA').Value := DTPAFecha.GetDato;
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.KeyValue;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
  IBQSPEventoInd.ParamByName('PRECIO').AsFloat := Precio;

end;

procedure TFEveDiagnosticoGestacion.CalcularCC;
begin
  IBQParametroCC.Close;
  IBQParametroCC.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQParametroCC.Open;
  IBQCondCorp.Close;
  IBQCondCorp.SQL.Clear;
  if IBQParametroCC.FieldByName('valor').Value = '5' then
  begin
    IBQCondCorp.SQL.Add('select id_condicion_corporal, valor_escala_5 as escala from cod_condiciones_corporales');
    FPrincipal.EscalaCondicionCorporal := 5;
  end
  else
  begin
    IBQCondCorp.SQL.Add('select id_condicion_corporal, valor_escala_10 as escala from cod_condiciones_corporales');
    FPrincipal.EscalaCondicionCorporal := 10;
  end;
  IBQCondCorp.Open;
end;

procedure TFEveDiagnosticoGestacion.FormCreate(Sender: TObject);
var
  indice : integer;
begin
  inherited FormCreate(Sender);
  DTPAFecha.DateTime := now;

  Precio := 0;

  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').Value := 'NA';
  DMSoftvet.IBQCodigosGenericos.Open;

  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;

  //DMSoftvet.IBQCondicionCorporal.Open;
  CalcularCC;
  DMSoftvet.IBQCronologiaDentaria.Open;
  DMSoftvet.IBQMetodoDiagnostico.Open;
  DMSoftvet.IBQEstadoReproductivo.Open;

  // para los limite inferior de los dias de gestacion
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''MEDIASGES'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  // grabar en una variable global y cada vez que se setea preñada poner esa variable
  dias_minimos := IBQAux.FieldValues['valor'];
  UDDiasGestacion.Position := 0;

  //Levanto todas las configuraciones de la distribucion CACUCO
  IBQCodCACUCO.Close;
  IBQCodCACUCO.Open;
  IBQCodCACUCO.First;
  indice := 0;
  while not IBQCodCACUCO.Eof do
  begin
    DatosConf[indice].cabeza := IBQCodCACUCO.FieldValues['CABEZA'];
    DatosConf[indice].cuerpo := IBQCodCACUCO.FieldValues['CUERPO'];
    DatosConf[indice].cola := IBQCodCACUCO.FieldValues['COLA'];
    Inc(indice);
    IBQCodCACUCO.Next;
  end;

  directo := true;

  IBQVentanaGestacion.Close;
  IBQVentanaGestacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQVentanaGestacion.Open;

  Ventana := IBQVentanaGestacion.FieldValues['valor'];

  // para el rechazo automatico de las vacias
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select rpe.valor from sys_juego_parametros sjp, rel_parametros_establecimiento rpe where (sjp.id_parametro = rpe.parametro) and (rpe.establecimiento = :esta) and (sjp.nombre = ''EGRECVAC'')');
  IBQAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAux.Active := true;
  if (UpperCase(IBQAux.FieldValues['valor']) = 'S') then
    CBRechazo.Checked := true;

  // para el tabsheet de ubicaciones
  IBQPotreroPreniadas.Close;
  IBQPotreroPreniadas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotreroPreniadas.Open;

  IBQPotreroVacias.Close;
  IBQPotreroVacias.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotreroVacias.Open;
  
  IBQConsultaGenericosSN.Open;
  DBLCBANuevoPotreroVacias.Enabled := false;
  LNuevoPotreroVacia.Enabled := false;
  DBLCBANuevoPotreroPreniadas.Enabled := false;
  LNuevoPotreroPreniada.Enabled := false;

  Msimple.SQLBasico := 'select id_aux, id_animal, id_rp, id_senasa, id_pc, id_hba, id_otro, id_ie, nombre, apodo from vis_diagnostico_gestacion';
//  MSimple.PasarParametros(2,0);//cambie codigo
  MSimple.PasarParametros(2,5);//cambie codigo

  mostrar_error_1 := false;
  mostrar_error_2 := false;

  MSimple.IBQSeleccionados.Open;
  MSimple.IBQDisponibles.Open;
  if self.Owner is TFEveAltaMasiva then
    begin
    deAlta:=true;
    DBLCBACondicionCorporal.Enabled:=false;
    DBLCBACronologiaDentaria.Enabled:=false;
    DBLCBACronologiaDentaria.EsRequerido:=false;
   {BDBGSimple.Columns[5].Visible := false;
    BDBGSimple.Columns[6].Visible := false;}
    end;
end;

// deshabilito el edit dias de gestacion si es vacia
procedure TFEveDiagnosticoGestacion.HabilitarPreniez();
begin
  transferencia := tipo_servicio = 4;
  BDBGSimple.Columns[4].ReadOnly := tipo_servicio = 4;
  LTransMasivo.Visible := (tipo_servicio = 4) and (modoEve = meMasivo);
  LTransIndividual.Visible := (tipo_servicio = 4) and (modoEve = meIndividual);
  if (Condicion = 1) then
  begin
      UDDiasGestacion.Position := 0;
      EADiasGestacion.Text := '0';
      LPeriodosPreniez.Visible:= false;
      GBDatosVacia.Visible := true;
      EADiasGestacion.Enabled:= false;
      TBDiasGestacion.Visible:= false;
      GBPreniadas.Visible := false;
      LChico.Visible:= false;
      LMediano.Visible:= false;
      LGrande.Visible:= false;
      BDBGSimple.Columns[4].Visible := true;//false;
      BDBGSimple.Columns[3].Visible := true;
  end
  else
  begin
        LDiasDist.Visible := true;
        DBLCBACACUCO.Visible := true;
        LConfDist.Visible := true;
        case tipo_servicio of
          0 : begin
                LFIni.Caption := Traducir('Fecha Inicio: ');
                DTPAFechaIni.EsRequerido := true;
                DTPAFechaIni.Visible := true;
                DTPAFechaFin.EsRequerido := true;
                DTPAFechaFin.Visible := true;
                LFFin.Visible := true;
                BDBGSimple.Columns[4].Visible := true;
                BDBGSimple.Columns[3].Visible := true;
              end;
           3,4 : begin
                    LFIni.Caption := Traducir('Fecha: ');
                    DTPAFechaFin.EsRequerido := false;
                    DTPAFechaFin.Visible := false;
                    LFFin.Visible := false;
                   // LDiasDist.Visible := false;
                   // DBLCBACACUCO.Visible := false;
                    LConfDist.Visible := false;
                   // BDBGSimple.Columns[4].Visible := false;
                 end;
           1,2 : begin
                LFIni.Caption := Traducir('Fecha Inicio: ');
                DTPAFechaIni.EsRequerido := true;
                DTPAFechaIni.Visible := true;
                DTPAFechaFin.EsRequerido := true;
                DTPAFechaFin.Visible := true;
                LFFin.Visible := true;
              //  BDBGSimple.Columns[4].Visible := true;
                BDBGSimple.Columns[3].Visible := true;
               end;
          end;
          GBDatosVacia.Visible := false;
          EADiasGestacion.Enabled:= true;
          GBPreniadas.Visible := true;
          if dist= 2 then
            DBLCBACACUCO.KeyValue := 3
          else
            begin
              DBLCBACACUCO.KeyValue := 0;
              if(DBLCBACACUCO.Text = '')then
                DBLCBACACUCO.KeyValue := 100;
            end;
          CalcularDistribucion(true);
  end;
end;

procedure TFEveDiagnosticoGestacion.DBLCBAEstadoReproductivoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBAEstadoReproductivo.KeyValue <> null then
  begin
    Condicion := DBLCBAEstadoReproductivo.KeyValue;
    Vacia := DBLCBAEstadoReproductivo.KeyValue = 1;
    if not Vacia and not cambio_preniez then
    begin
      cambio_preniez := true;
      CalcularDatosGestacion();
    end;
    HabilitarPreniez();
    LoadSQLStringList;
  end;
end;

// para agregar los combo en la grilla
procedure TFEveDiagnosticoGestacion.LoadSQLStringList;
begin
  inherited;

  SQLStringList.AddObject('ESTADO_REPRODUCTIVO',TObject(DMSoftvet.DSEstadoReproTacto));
  SQLStringList.AddObject('METODO_DIAGNOSTICO',TObject(DMSoftvet.DSMetodoDiagnostico));

  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('CRONOLOGIA_DENTARIA',TObject(DMSoftvet.DSCronologiaDentaria));
  SQLStringList.AddObject('CONDICION_CORPORAL',TObject(DSCondCorp));

  SQLStringList.AddObject('CONDICION_UTERO',TObject(DMSoftvet.DSCodigosGenericos));
  SQLStringList.AddObject('CONDICION_OVARIO',TObject(DMSoftvet.DSCodigosGenericos));
  SQLStringList.AddObject('CONDICION_CERVIX',TObject(DMSoftvet.DSCodigosGenericos));
  //SQLStringList.AddObject('DISTCACUCO',TObject(DMSoftvet.DSDistCACUCO));
  SQLStringList.AddObject('DISTCACUCO',TObject(DSDistCACUCOIA));

  SQLStringList.AddObject('MUESTREO',TObject(DSGenericosSN));
  SQLStringList.AddObject('RECHAZO',TObject(DSGenericosSN));
  SQLStringList.AddObject('MUESTREOMUCUS',TObject(DSGenericosSN));
end;

// quiere asignar una nueva ubicacion para vacias
procedure TFEveDiagnosticoGestacion.CBUbicacionVaciasClick(Sender: TObject);
begin
  inherited;
  DBLCBANuevoPotreroVacias.Enabled := CBUbicacionVacias.Checked;
  LNuevoPotreroVacia.Enabled := CBUbicacionVacias.Checked;
  DBLCBANuevoPotreroVacias.KeyValue := 0;
end;

// quiere asignar una nueva ubicacion para preniadas
procedure TFEveDiagnosticoGestacion.CBUbicacionPreniadasClick(Sender: TObject);
begin
  inherited;
  DBLCBANuevoPotreroPreniadas.Enabled := CBUbicacionPreniadas.Checked;
  LNuevoPotreroPreniada.Enabled := CBUbicacionPreniadas.Checked;
  DBLCBANuevoPotreroPreniadas.KeyValue := 0;
end;

procedure TFEveDiagnosticoGestacion.Change(Sender: TField);
var PickPos : integer;
begin
  inherited;

  if (IBDSSimple.State <> dsInsert ) and (not cargaXLS) then
    case (Sender.Index) of
      7:  begin      // RESPONSABLE
            PickPos := BDBGSimple.ColumnByField('RESP').PickList.IndexOf(BDBGSimple.ColumnByField('RESP').Field.AsString);
            IBDSSimpleRESPONSABLE.Value := TClassType(BDBGSimple.ColumnByField('RESP').PickList.Objects[PickPos]).getValue;
          end;
      9:  begin      // CONDICION CORPORAL
            PickPos := BDBGSimple.ColumnByField('CONDICION_CORPORAL').PickList.IndexOf(BDBGSimple.ColumnByField('CONDICION_CORPORAL').Field.AsString);
            IBDSSimpleID_CONDICION_CORPORAL.Value := TClassType(BDBGSimple.ColumnByField('CONDICION_CORPORAL').PickList.Objects[PickPos]).getValue;
          end;
      11: begin      // CRONOLOGIA DENTARIA
            PickPos := BDBGSimple.ColumnByField('CRONOLOGIA_DENTARIA').PickList.IndexOf(BDBGSimple.ColumnByField('CRONOLOGIA_DENTARIA').Field.AsString);
            IBDSSimpleID_CRONOLOGIA_DENTARIA.Value := TClassType(BDBGSimple.ColumnByField('CRONOLOGIA_DENTARIA').PickList.Objects[PickPos]).getValue;
          end;
      13: begin      // ESTADO REPRODUCTIVO
            PickPos := BDBGSimple.ColumnByField('ESTADO_REPRODUCTIVO').PickList.IndexOf(BDBGSimple.ColumnByField('ESTADO_REPRODUCTIVO').Field.AsString);
            Vacia := PickPos = 0;
            if (IBDSSimpleESTADO_REPRODUCTIVO.AsString = 'VACIA') then
//            if Vacia then
            begin
              SetText(IBDSSimpleDISTCACUCO, ' ');
              directo := false;
              IBDSSimpleDIAS_GESTACIONSetText(IBDSSimpleDIAS_GESTACION,'0');
              directo := true;
            end;

            IBDSSimpleID_ESTADO_REPRODUCTIVO.Value := TClassType(BDBGSimple.ColumnByField('ESTADO_REPRODUCTIVO').PickList.Objects[PickPos]).getValue;
            VerificarCambioEstadoReproductivo();
//no estaba    esto es para cuando hago preñada, luego vacia, luego preñada para q comprete la distribucion y los dias
         {   if (DBLCBAEstadoReproductivo.KeyValue=2) and (IBDSSimpleESTADO_REPRODUCTIVO.AsString <> 'VACIA' ) then
            begin
              if (EADiasGestacion.Text <> '') then
                 IBDSSimple.FieldByName('DIAS_GESTACION').Value:= StrToInt(EADiasGestacion.Text)
              else
              IBDSSimple.FieldByName('DIAS_GESTACION').Value:= 0;

              IBDSSimple.FieldByName('id_distcacuco').Value := DBLCBACACUCO.KeyValue;
              IBDSSimple.FieldByName('distcacuco').Value := DBLCBACACUCO.Text;
            end;  }
 //hasta aca

          end;
      15: begin      // METODO DIAGNOSTICO
            PickPos := BDBGSimple.ColumnByField('METODO_DIAGNOSTICO').PickList.IndexOf(BDBGSimple.ColumnByField('METODO_DIAGNOSTICO').Field.AsString);
            IBDSSimpleID_METODO_DIAGNOSTICO.Value := TClassType(BDBGSimple.ColumnByField('METODO_DIAGNOSTICO').PickList.Objects[PickPos]).getValue;
          end;
      18: begin      // CONDICION UTERO
            PickPos := BDBGSimple.ColumnByField('CONDICION_UTERO').PickList.IndexOf(BDBGSimple.ColumnByField('CONDICION_UTERO').Field.AsString);
            IBDSSimpleID_CONDICION_UTERO.Value := TClassType(BDBGSimple.ColumnByField('CONDICION_UTERO').PickList.Objects[PickPos]).getValue;
            VerificarCambiosConEstadoReproductivo(Sender);
          end;
      20: begin      // CONDICION OVARIO
            PickPos := BDBGSimple.ColumnByField('CONDICION_OVARIO').PickList.IndexOf(BDBGSimple.ColumnByField('CONDICION_OVARIO').Field.AsString);
            IBDSSimpleID_CONDICION_OVARIO.Value := TClassType(BDBGSimple.ColumnByField('CONDICION_OVARIO').PickList.Objects[PickPos]).getValue;
            VerificarCambiosConEstadoReproductivo(Sender);
          end;
      22: begin      // CONDICION CERVIX
            PickPos := BDBGSimple.ColumnByField('CONDICION_CERVIX').PickList.IndexOf(BDBGSimple.ColumnByField('CONDICION_CERVIX').Field.AsString);
            IBDSSimpleID_CONDICION_CERVIX.Value := TClassType(BDBGSimple.ColumnByField('CONDICION_CERVIX').PickList.Objects[PickPos]).getValue;
            VerificarCambiosConEstadoReproductivo(Sender);
          end;
      24: begin      // MUESTREO
            PickPos := BDBGSimple.ColumnByField('MUESTREO').PickList.IndexOf(BDBGSimple.ColumnByField('MUESTREO').Field.AsString);
            IBDSSimpleID_MUESTREO.Value := TClassType(BDBGSimple.ColumnByField('MUESTREO').PickList.Objects[PickPos]).getValue;
          end;
      26: begin      // RECHAZO
            PickPos := BDBGSimple.ColumnByField('RECHAZO').PickList.IndexOf(BDBGSimple.ColumnByField('RECHAZO').Field.AsString);
            IBDSSimpleID_RECHAZO.Value := TClassType(BDBGSimple.ColumnByField('RECHAZO').PickList.Objects[PickPos]).getValue;
            VerificarCambiosConEstadoReproductivo(Sender);
          end;
      28: begin      // MUESTREO MUCUS
            PickPos := BDBGSimple.ColumnByField('MUESTREOMUCUS').PickList.IndexOf(BDBGSimple.ColumnByField('MUESTREOMUCUS').Field.AsString);
            IBDSSimpleID_MUESTREOMUCUS.Value := TClassType(BDBGSimple.ColumnByField('MUESTREOMUCUS').PickList.Objects[PickPos]).getValue;
            VerificarCambiosConEstadoReproductivo(Sender);
          end;
      31: begin     //DITRIBUCION CACUCO
            if (IBDSSimpleESTADO_REPRODUCTIVO.AsString <> 'VACIA') then
            //if not vacia then
            begin
              PickPos := BDBGSimple.ColumnByField('DISTCACUCO').PickList.IndexOf(BDBGSimple.ColumnByField('DISTCACUCO').Field.AsString);
              IBDSSimpleID_DISTCACUCO.Value := TClassType(BDBGSimple.ColumnByField('DISTCACUCO').PickList.Objects[PickPos]).getValue;
            end;
          end;

    end;

  {if (IBDSSimple.State = dsEdit ) then
    begin
      IBDSSimple.Post;
    end;
   } 
end;

// cuando entro necesito que se ponga en edit para cambiar los id de los combos
procedure TFEveDiagnosticoGestacion.BDBGSimpleCellClick(Column: TColumn);
begin
  inherited;
  IBDSSimple.Edit;
  BDBGSimpleColEnter(nil);
end;

// metodo para modificar los campos correspondientes cuando se cambia el estado reproductivo
procedure TFEveDiagnosticoGestacion.VerificarCambioEstadoReproductivo;
begin
  if (IBDSSimpleID_ESTADO_REPRODUCTIVO.AsInteger = 2) then
  begin
    SetText(IBDSSimpleCONDICION_UTERO,'N');
    SetText(IBDSSimpleCONDICION_OVARIO,'N');
    SetText(IBDSSimpleCONDICION_CERVIX,'N');
    SetText(IBDSSimpleRECHAZO,'N');
    SetText(IBDSSimpleMUESTREOMUCUS,'N');
    SetText(IBDSSimpleDISTCACUCO, 'CABEZA');
   end
end;

// valida lo ingresado
procedure TFEveDiagnosticoGestacion.Validate(Sender: TField);
var cantidad : integer;
    aux2 : string;
begin
  inherited;
  cantidad := 0;
  if (IBDSSimple.State = dsEdit) then
    begin
      IBQValidacion.Active := false;
      IBQValidacion.SQL.Clear;
      case (Sender.Index) of
        7:  begin      // RESPONSABLE
              IBQValidacion.SQL.Add('select count(*)as cantidad from TAB_EMPLEADOS where ( (establecimiento = :esta) and ( (NOMBRE || '' '' || APELLIDO) = '''+UpperCase(Sender.AsString)+'''))');
              IBQValidacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
              IBQValidacion.Active := true;
              cantidad := IBQValidacion.FieldByName('cantidad').AsInteger;
            end;
        9:  begin      // CONDICION CORPORAL
              aux2 := StringReplace(FormatFloat('0.0',strtofloat(Sender.asString)), ',', '.',[]);
              IBQValidacion.Params.Clear;
              IBQValidacion.SQL.Add('select count(*)as cantidad from cod_condiciones_corporales where ('+FPrincipal.StringEscalaCC+' = '+aux2+')');
              IBQValidacion.Active := true;
              cantidad := IBQValidacion.FieldByName('cantidad').AsInteger;
            end;
        11: begin      // CRONOLOGIA DENTARIA
              IBQValidacion.Params.Clear;
              IBQValidacion.SQL.Add('select count(*)as cantidad from cod_cronologias_dentarias where (nombre = '''+UpperCase(Sender.AsString)+''')or (codigo = '''+UpperCase(Text)+''')');
              IBQValidacion.Active := true;
              cantidad := IBQValidacion.FieldByName('cantidad').AsInteger;
            end;
        13: begin      // ESTADO REPRODUCTIVO
              IBQValidacion.Params.Clear;
              IBQValidacion.SQL.Add('select count(*)as cantidad from cod_estados_reproductivos where (al_tacto = ''S'') and (nombre = '''+UpperCase(Sender.AsString)+''')or (codigo = '''+UpperCase(Text)+''')');
              IBQValidacion.Active := true;
              cantidad := IBQValidacion.FieldByName('cantidad').AsInteger;
            end;
        15: begin      // METODO DIAGNOSTICO
              IBQValidacion.Params.Clear;
              IBQValidacion.SQL.Add('select count(*)as cantidad from cod_metodos_diagnostico_gestaci where (nombre = '''+UpperCase(Sender.AsString)+''')or (codigo = '''+UpperCase(Text)+''')');
              IBQValidacion.Active := true;
              cantidad := IBQValidacion.FieldByName('cantidad').AsInteger;
            end;
        18, 20, 22: begin      // CONDICION UTERO // CONDICION OVARIO // CONDICION CERVIX
              IBQValidacion.Params.Clear;
              IBQValidacion.SQL.Add('select count(*)as cantidad from cod_genericos where ((tipo = ''NA'') and (valor = '''+UpperCase(Sender.AsString)+'''))');
              IBQValidacion.Active := true;
              cantidad := IBQValidacion.FieldByName('cantidad').AsInteger;
            end;
        24, 26, 28: begin   // para los muestreo y el rechazo
              if ((UpperCase(Sender.AsString)='NO') or (UpperCase(Sender.AsString)= 'SI')) then
                cantidad := 1
              else
                cantidad := 0;
            end;
        16: begin   // para los dias de gestacion
              cantidad := 1;
            end;
        31: begin   //PARA LA DISTRIBUCION DE CACUCO
              if (IBDSSimpleESTADO_REPRODUCTIVO.AsString <> 'VACIA') then
              //if not vacia then
              begin
               { IBQValidacion.Params.Clear;
                IBQValidacion.SQL.Add('select count(*)as cantidad from cod_dist_cacuco where ((grupo='+IntToStr(dist)+') and (nombre = '''+UpperCase(Sender.AsString)+'''))');
                IBQValidacion.Active := true;
                cantidad := IBQValidacion.FieldByName('cantidad').AsInteger;}
                IBQValidacion.Active := false;
                IBQValidacion.SQL.Clear;
                IBQValidacion.SQL.Add('select count(*) from get_dist_cacucoia(:animal,:fecha,:establecimiento) where nombre like '''+UpperCase(Sender.AsString)+'''||''%''');
                IBQValidacion.ParamByName('animal').AsInteger := IBDSSimpleID_ANIMAL.AsInteger;
                IBQValidacion.ParamByName('fecha').AsDate := IBDSSimpleFECHA.AsDateTime;
                IBQValidacion.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
                IBQValidacion.Active := true;
                cantidad := IBQValidacion.FieldValues['count'];
              end
              else cantidad := 1;
            end;
        end;
      if (cantidad = 0) then
        begin
          IBDSSimple.Cancel;
          MostrarMensaje(tmError, 'No se encuentra el valor ingresado');
        end
      else
        if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
          IBDSSimple.FieldValues['EW'] := 'M';
    end
end;

// valido el texto que entra si es un parecido lo asigno
procedure TFEveDiagnosticoGestacion.SetText(Sender: TField; const Text: String);
var aux: double;
    aux2 : string;
    ind, seleccion : integer;
    dias_gestacion: integer;
begin
  inherited;
  if (((IBDSSimple.State <> dsInsert)) {and (UpperCase(Sender.AsString) <> UpperCase(Text))}) or cargaDeMovil or cargaXLS then
    begin
      IBQValidacion.Active := false;
      IBQValidacion.SQL.Clear;
      Sender.DataSet.Edit;
      case (Sender.Index) of
        7:  begin      // RESPONSABLE
              {IBQValidacion.SQL.Add('select count(*)as cantidad from TAB_EMPLEADOS where (((establecimiento = :esta) and (apellido like '''+UpperCase(Text)+'%''))or ((establecimiento = :esta) and (nombre like '''+UpperCase(Text)+'%'')) or ((establecimiento = :esta) and (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%'')))');
              IBQValidacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
              IBQValidacion.Active := true;
              if (IBQValidacion.FieldByName('cantidad').AsInteger <> 0) then
                begin
                  IBQValidacion.Active := false;
                  IBQValidacion.SQL.Clear;
                  IBQValidacion.SQL.Add('select NOMBRE || '' '' || APELLIDO as nombre from TAB_EMPLEADOS where (((establecimiento = :esta) and (apellido like '''+UpperCase(Text)+'%''))or ((establecimiento = :esta) and (nombre like '''+UpperCase(Text)+'%''))or ((establecimiento = :esta) and (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%'')))');
                  IBQValidacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
                  IBQValidacion.Active := true;

                  if not(IBQValidacion.IsEmpty) then
                     Sender.AsString := IBQValidacion.FieldByName('nombre').AsString;
                end;}
            end;
        9:  begin      // CONDICION CORPORAL
              if (TryStrTofloat(text,aux)) then
                begin
                  aux2 := StringReplace(FormatFloat('0.0',aux), ',', '.',[]);
                  IBQValidacion.Params.Clear;
                  IBQValidacion.SQL.Add('select count(*)as cantidad from cod_condiciones_corporales where ('+fprincipal.StringEscalaCC+' = '+aux2+')');
                  IBQValidacion.Active := true;

                  if (IBQValidacion.FieldByName('cantidad').AsInteger <> 0) then
                    begin
                      IBQValidacion.Active := false;
                      IBQValidacion.SQL.Clear;
                      IBQValidacion.SQL.Add('select '+FPrincipal.StringEscalaCC+' from cod_condiciones_corporales where ('+FPrincipal.StringEscalaCC+' = '+aux2+')');
                      IBQValidacion.Active := true;
                      Sender.Value := IBQValidacion.FieldByName(FPrincipal.StringEscalaCC).Value;
                    end;
                end;
            end;
        11: begin      // CRONOLOGIA DENTARIA
              IBQValidacion.Params.Clear;
              IBQValidacion.SQL.Add('select count(*)as cantidad from cod_cronologias_dentarias where (nombre like '''+UpperCase(Text)+'''||''%'') or (codigo = '''+UpperCase(Text)+''')');
              IBQValidacion.Active := true;

              if (IBQValidacion.FieldByName('cantidad').AsInteger <> 0) then
                begin
                  IBQValidacion.Active := false;
                  IBQValidacion.SQL.Clear;
                  IBQValidacion.SQL.Add('select NOMBRE from cod_cronologias_dentarias where (nombre like '''+UpperCase(Text)+'''||''%'')or (codigo = '''+UpperCase(Text)+''')');
                  IBQValidacion.Active := true;
                  Sender.AsString := IBQValidacion.FieldByName('nombre').AsString;
                end;
            end;
        13: begin      // ESTADO REPRODUCTIVO
              IBQValidacion.Params.Clear;
              IBQValidacion.SQL.Add('select count(*)as cantidad from cod_estados_reproductivos where (al_tacto = ''S'') and (nombre like '''+UpperCase(Text)+'''||''%'')or (codigo = '''+UpperCase(Text)+''')');
              IBQValidacion.Active := true;

              if (IBQValidacion.FieldByName('cantidad').AsInteger <> 0) then
                begin
                  IBQValidacion.Active := false;
                  IBQValidacion.SQL.Clear;
                  IBQValidacion.SQL.Add('select NOMBRE from cod_estados_reproductivos where (al_tacto = ''S'') and  (nombre like '''+UpperCase(Text)+'''||''%'')or (codigo = '''+UpperCase(Text)+''')');
                  IBQValidacion.Active := true;
                    if Sender.AsString <> IBQValidacion.FieldByName('nombre').AsString then
                  Sender.AsString := IBQValidacion.FieldByName('nombre').AsString;
                end;
            end;
        15: begin      // METODO DIAGNOSTICO
              IBQValidacion.Params.Clear;
              IBQValidacion.SQL.Add('select count(*)as cantidad from cod_metodos_diagnostico_gestaci where (nombre like '''+UpperCase(Text)+'''||''%'')or (codigo = '''+UpperCase(Text)+''')');
              IBQValidacion.Active := true;

              if (IBQValidacion.FieldByName('cantidad').AsInteger <> 0) then
                begin
                  IBQValidacion.Active := false;
                  IBQValidacion.SQL.Clear;
                  IBQValidacion.SQL.Add('select NOMBRE from cod_metodos_diagnostico_gestaci where (nombre like '''+UpperCase(Text)+'''||''%'')or (codigo = '''+UpperCase(Text)+''')');
                  IBQValidacion.Active := true;
                  Sender.AsString := IBQValidacion.FieldByName('nombre').AsString;
                end;
            end;
        18, 20, 22 : begin  // CONDICION UTERO // CONDICION OVARIO // CONDICION CERVIX
              IBQValidacion.Params.Clear;
              IBQValidacion.SQL.Add('select count(*)as cantidad from cod_genericos where ((tipo = ''NA'') and (valor like '''+UpperCase(Text)+'''||''%''))');
              IBQValidacion.Active := true;

              if (IBQValidacion.FieldByName('cantidad').AsInteger <> 0) then
                begin
                  IBQValidacion.Active := false;
                  IBQValidacion.SQL.Clear;
                  IBQValidacion.SQL.Add('select valor as nombre from cod_genericos where ((tipo = ''NA'') and (valor like '''+UpperCase(Text)+'''||''%''))');
                  IBQValidacion.Active := true;
                  Sender.AsString := IBQValidacion.FieldByName('nombre').AsString;
                end;
            end;
        24, 26, 28 :
            begin  // MUESTREO // MUCUS // RECHAZO
              if (Sender.Index = 24) then
                IBDSSimple.Edit;
              if (UpperCase(Text)='N') then
                Sender.AsString := 'NO'
              else
                if (UpperCase(Text)='S') then
                  Sender.AsString := 'SI'
                else
                  if ((UpperCase(Text)='SI') or (UpperCase(Text)='NO')) then
                    Sender.AsString := UpperCase(Text);
            end;
         31 : begin //CACUCO
                if ((Text = 'v') or (Text = 'V')) then  // continuar este if
                  IBDSSimpleESTADO_REPRODUCTIVO.AsString:= 'VACIA';

                if (IBDSSimpleESTADO_REPRODUCTIVO.AsString <> 'VACIA') then
                //if not vacia then
                begin

                  IBQValidacion.Active := false;
                  IBQValidacion.SQL.Clear;
                  IBQValidacion.SQL.Add('select * from get_dist_cacucoia(:animal,:fecha,:establecimiento) where nombre like '''+UpperCase(Text)+'''||''%''');
                  IBQValidacion.ParamByName('animal').AsInteger := IBDSSimpleID_ANIMAL.AsInteger;
                  IBQValidacion.ParamByName('fecha').AsDate := IBDSSimpleFECHA.AsDateTime;
                  IBQValidacion.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
                  IBQValidacion.Active := true;
                  if not(IBQValidacion.IsEmpty) then
                  begin
                    if IBQValidacion.FieldValues['FECHA_SERV'] <> null then
                    begin
                      IBDSSimpleD1.AsDateTime := IBQValidacion.FieldValues['FECHA_SERV'];
                      IBDSSimpleD2.AsDateTime := IBQValidacion.FieldValues['FECHA_SERV'];
                    end
                    else
                    begin
                        // Resetear los     IBDSSimpleD1  IBDSSimpleD2
                          RealizarCambio(DTPAFechaIni,[IBDSSimple.FieldByName('D1')],[DTPAFechaIni.GetDato]);
                          RealizarCambio(DTPAFechaFin,[IBDSSimple.FieldByName('D2')],[DTPAFechaFin.GetDato]);
                    end;

                    Sender.AsString := IBQValidacion.FieldByName('NOMBRE').AsString;
                    if (directo) then
                    begin
                      directo := false;
                      seleccion := BDBGSimple.ColumnByField('DISTCACUCO').PickList.IndexOf(BDBGSimple.ColumnByField('DISTCACUCO').Field.AsString);
                      if (seleccion = 3) then // CompareDate(IBDSSimpleD1.AsDateTime,IBDSSimpleD2.AsDateTime) = EqualsValue then
                      begin
                        //CalcularCasosPorDistribucion('CABEZA',IBDSSIMPLEID_ANIMAL.AsInteger);
                        CalcularCasosPorDistribucionEspecifico(seleccion,IBDSSIMPLEID_ANIMAL.AsInteger)
                      end
                      else
                        CalcularCasosPorDistribucion(Sender.AsString,IBDSSIMPLEID_ANIMAL.AsInteger);
                      ind := BuscarAnimal(IBDSSIMPLEID_ANIMAL.AsInteger);

                      dias_gestacion := Gestacion[ind].Gestacion[indice_config].dias;

                      IBDSSimpleDIAS_GESTACIONSetText(IBDSSimpleDIAS_GESTACION,IntToStr(dias_gestacion));
                      directo := true;
                    end;
                  end;
                end
                else
                  Sender.AsString := ' ';
              end;
        end;
    end;
end;


// verifica si lo seleccionado es valido con respecto al estado reproductivo
procedure TFEveDiagnosticoGestacion.VerificarCambiosConEstadoReproductivo(Sender: TField);
begin
  if (IBDSSimple.FieldByName('id_estado_reproductivo').AsInteger = 2) then
  case (Sender.Index) of
    18, 20, 22: begin    // para las condiciones
                  if (Sender.AsString <> 'NORMAL') then
                    begin
                      IBDSSimple.Edit;
                      Sender.AsString := 'NORMAL';
                    end;
                end;
    26, 28: begin     // para el rechazo y el mucus
          if (UpperCase(Sender.AsString) <> 'NO') then
            begin
              IBDSSimple.Cancel;
              IBDSSimple.Edit;
              Sender.AsString := 'NO';
            end;
        end;
  end;
end;

// para poner gris las vacias
procedure TFEveDiagnosticoGestacion.BDBGSimpleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var i : integer;
begin
  if not DBLCBAMetodoDiagnostico.Enabled then
      BDBGSimple.Columns[4].ReadOnly := true
  else
      BDBGSimple.Columns[4].ReadOnly := false;

  inherited BDBGSimpleDrawColumnCell(Sender, rect, datacol, column, state);

  if (IBDSSimpleESTADO_REPRODUCTIVO.AsString = 'VACIA') then
  begin
      for i := 0 to BDBGSimple.Columns.Count - 1 do
      begin
        BDBGSimple.Columns[i].Color := clWhite;  
        BDBGSimple.Columns[i].Font.Color := clgray;
      end;
  end;
//  else
//      BDBGSimple.Canvas.Font.Color := clBlack;

//  BDBGSimple.Canvas.FillRect(Rect);
//  BDBGSimple.Canvas.TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
end;

procedure TFEveDiagnosticoGestacion.AgregarAuxParaIndividual;
begin
  try
    IBQAuxAnimal.Close;
    IBQAuxAnimal.ParamByName('id').AsInteger := IDAnimal;
    IBQAuxAnimal.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFEveDiagnosticoGestacion.FormShow(Sender: TObject);
begin
  inherited;
  if (ModoEve = meMasivo) then
    PCBasico.ActivePageIndex := 0
  else
  begin
      PCBasico.ActivePageIndex := 1;
      AgregarAuxParaIndividual();
  end;

  if (Fprincipal._LECTOR_ONLINE) then
    PCBasico.ActivePage := TSDatos;

  if (DBLCBAEstadoReproductivo.KeyValue = 1) then
    begin
     EADiasGestacion.Enabled:= false;
     TBDiasGestacion.Visible:= false;
     LPeriodosPreniez.Visible:= false;
     LChico.Visible:= false;
     LMediano.Visible:= false;
     LGrande.Visible:= false;
    end
   else
    if (DBLCBAEstadoReproductivo.KeyValue = 2) then
        EADiasGestacion.Enabled:= true;

  DBLCBACondicionUtero.KeyValue := 'N';
  DBLCBACondicionOvario.KeyValue := 'N';
  DBLCBACondicionCervix.KeyValue := 'N';
  DBLCBACondicionCorporal.KeyValue := NULL;
  PCBasicoChange(self);
  DBLCBAResponsable.AsignarValorDefecto;
end;

procedure TFEveDiagnosticoGestacion.PCBasicoChange(Sender: TObject);
begin

  GBDatosVacia.Visible:= (PCBasico.ActivePageIndex = 1) and (DBLCBAEstadoReproductivo.Text = 'VACIA');
  //PasoGrilla:= not IBDSSimple.IsEmpty;
  if (PCBasico.ActivePage = TSDatos) then
  begin
    if not PasoGrilla then
    begin
      CalcularDatosGestacion();
      cambio_preniez := false;
    end
    else
      begin
      Indice_Gral := 1;
      DBLCBAEstadoReproductivoCloseUp(nil);
      end;
  end;

  if(PCBasico.ActivePage = TSGrilla) then
    begin
      BDBGSimple.Columns[0].Width:= 55;
      BDBGSimple.Columns[1].Width:= 65;
      BDBGSimple.Columns[2].Width:= 65;
      BDBGSimple.Columns[3].Width:= 70;
      BDBGSimple.Columns[4].Width:= 65;
      BDBGSimple.Columns[5].Width:= 110;
      BDBGSimple.Columns[6].Width:= 60;
      BDBGSimple.Columns[7].Width:= 70;
      BDBGSimple.Columns[8].Width:= 55;
      BDBGSimple.Columns[9].Width:= 70;
      BDBGSimple.Columns[10].Width:= 75;
      BDBGSimple.Columns[11].Width:= 70;
    end;
  inherited;
  if deAlta and pasoGrilla then
    deAlta:=false;
  TSUbicaciones.ImageIndex := 7;
  if(PCBasico.ActivePage = TSUbicaciones)then
    TSUbicaciones.ImageIndex := 6;
end;

procedure TFEveDiagnosticoGestacion.EADiasGestacionKeyPress(Sender: TObject; var Key: Char);
var numero : integer;
begin
  inherited;
  if (TryStrToInt(TEditAuto(Sender).Text+key,numero)) then
    begin
    if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 3) or (numero<UDDiasGestacion.Min)
         or (numero>UDDiasGestacion.Max)) and (key <> #8)) then key:=#0;
    end
  else
    if (key<>#8) then
      key:=#0;
end;

procedure TFEveDiagnosticoGestacion.CalcularDistribucion(por_dist : boolean);
var
  cant_dias_servicio, dias_al_tacto : integer;
  dias_cabeza, dias_cuerpo, dias_cola : integer;
  dias_gestacion, gest_embrion, ind : integer;
  distribucion : String;
begin
//if PCBasico.ActivePage=TSGrilla then
    {begin
    cant_dias_servicio := DaysBetween(IBDSSimple.Lookup('ID_ANIMAL',ID,'D2'),IBDSSimple.Lookup('ID_ANIMAL',ID,'D1'));
    dias_al_tacto := DaysBetween(IBDSSimple.Lookup('ID_ANIMAL',ID,'FECHA'),IBDSSimple.Lookup('ID_ANIMAL',ID,'D2'));
    end}
  //else
  //begin
  cant_dias_servicio := DaysBetween(DTPAFechaFin.Date,DTPAFechaIni.Date);
  if(cant_dias_servicio = 0)then // Si la diferencia entre las fechas es 0 quiere decir que es Inseminacion y tiene que entrear en el siguiente if
    cant_dias_servicio := 41;
  dias_al_tacto := DaysBetween(DTPAFecha.Date,DTPAFechaFin.Date);
  //end;

  gest_embrion := 0;
  if (modoEve = meIndividual) and transferencia then
{  if {{(modoEve = meIndividual) and //transferencia then prueba         }
  begin
{   if(modoEve = meMasivo)then
      if(MSimple.IBQSeleccionados.FieldValues['id_animal'] <> null)then
        IDAnimal := MSimple.IBQSeleccionados.FieldValues['id_animal'];  }
    IBQDiasGestEmbrion.Close;
    IBQDiasGestEmbrion.ParamByName('id').AsInteger := IDAnimal;
    IBQDiasGestEmbrion.ParamByName('grupo').AsInteger := Servicio;
    IBQDiasGestEmbrion.Open;
    if IBQDiasGestEmbrion.FieldValues['dias'] <> null then
      gest_embrion := IBQDiasGestEmbrion.FieldValues['dias'];
  end;

  if cant_dias_servicio > 40 then
  begin
    //GBDistPreniez.Enabled := true;
    dias_cabeza := Trunc(cant_dias_servicio*cabeza);
    dias_cuerpo := Trunc(cant_dias_servicio*cuerpo);
    dias_cola := Trunc(cant_dias_servicio*cola);
    if por_dist then
    begin
      distribucion := DBLCBACACUCO.Text;
      EADiasGestacion.OnChange := nil;
      if ((distribucion = 'CABEZA'))  then
        dias_gestacion := Trunc((dias_cabeza*0.5)+dias_cuerpo+dias_cola)+dias_al_tacto;
      if distribucion = 'CUERPO' then
        dias_gestacion := Trunc((dias_cuerpo*0.5)+dias_cola)+dias_al_tacto;
      if distribucion = 'COLA' then
        dias_gestacion := Trunc(dias_cola*0.5)+dias_al_tacto;

      if((distribucion <>'CABEZA') and(distribucion <>'CUERPO') and(distribucion <>'COLA')) then
      begin
       IBQValidacion.Active := false;
       IBQValidacion.SQL.Clear;
       IBQValidacion.SQL.Add('select * from get_dist_cacucoia(:animal,:fecha,:establecimiento) where nombre like '''+UpperCase(distribucion)+'''||''%''');
       if (ModoEve = meMasivo) then
          IBQDistCACUCOIA.ParamByName('animal').Value := null
       else
          IBQValidacion.ParamByName('animal').AsInteger := IDAnimal;
       IBQValidacion.ParamByName('fecha').AsDate := DTPAFecha.Date;
       IBQValidacion.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
       IBQValidacion.Active := true;


        dias_gestacion :=  trunc( DTPAFecha.Date - IBQValidacion.FieldValues['FECHA_SERV']);
{       if(transferencia)then                       prueba
         dias_gestacion := dias_gestacion + gest_embrion; }
        for ind := 0 to 3 do
          Gestacion[0].Gestacion[ind].dias := dias_gestacion;
      end;

        ///ShowMessage(DBLCBACACUCO.KeyValue);

      DiasGestacionValidos(dias_gestacion,-1);
      EADiasGestacion.Text := IntToStr(dias_gestacion);
      if dias_gestacion in [1..34] then
      begin
        DBLCBAMetodoDiagnostico.Enabled := false;
        DBLCBAMetodoDiagnostico.KeyValue := 2;
      end else begin
            DBLCBAMetodoDiagnostico.Enabled := true;
            //DBLCBAMetodoDiagnostico.KeyValue := 0;
          end;
      CalcularCasosPorDistribucion(distribucion,-1);
      EADiasGestacion.OnChange := EADiasGestacionChange;
    end
    else
    begin
      DBLCBACACUCO.OnCloseUp := nil;
      dias_gestacion := StrToInt(EADiasGestacion.Text)+gest_embrion;
      DiasGestacionValidos(dias_gestacion,-1);
      case dist of
          2 : begin
              if dias_gestacion > (Trunc(dias_cabeza*0.5)+dias_al_tacto) then
                DBLCBACACUCO.KeyValue := 3
              else
               DBLCBACACUCO.KeyValue := 4;
            end;
          3 : begin
              if dias_gestacion >= Trunc(dias_cola*0.5)+dias_al_tacto then
                DBLCBACACUCO.KeyValue := 2;
              if dias_gestacion >= (Trunc((dias_cabeza*0.5)+dias_cuerpo+dias_cola)+dias_al_tacto) then
                DBLCBACACUCO.KeyValue := 0;
              if ((dias_gestacion >= (Trunc((dias_cuerpo*0.5)+dias_cola)+dias_al_tacto)) and (dias_gestacion < (Trunc((dias_cabeza*0.5)+dias_cuerpo+dias_cola)+dias_al_tacto))) then
                DBLCBACACUCO.KeyValue := 1;
            end;
      end;
      CalcularCasosPorDiasGestacion(dias_gestacion,-1);
      DBLCBACACUCO.OnCloseUp := DBLCBACACUCOCloseUp;
    end;
  end
  else
  begin
    dias_gestacion := dias_al_tacto+gest_embrion;
    DiasGestacionValidos(dias_gestacion,-1);
    EADiasGestacion.Text := IntToStr(dias_gestacion);
  end;
end;

function TFEveDiagnosticoGestacion.BuscarAnimal(id_animal : integer) : integer;
var
  indice, resultado : integer;
begin
  resultado := 0;
  for indice := 0 to Length(Gestacion)-1 do
    if Gestacion[indice].id_animal = id_animal then
    begin
      resultado := indice;
      break;
    end;
  Result := resultado;
end;

procedure TFEveDiagnosticoGestacion.CalcularCasosPorDistribucion(distribucion : String; ID : Integer);
var
  dias_al_tacto, dias_servicio , dias: integer;
  ind, ind_animal : integer;
  f,fi,fn:TDate;
begin
  ind_animal := BuscarAnimal(ID);
  if (PCBasico.ActivePage=TSGrilla) and (ID>=0) and (not cargaDeMovil) then
  begin
    dias_servicio := DaysBetween(trunc(IBDSSimpleD2.Value),trunc(IBDSSimpleD1.Value));//DaysBetween(trunc(IBDSSimple.Lookup('ID_ANIMAL',ID,'D2')),trunc(IBDSSimple.Lookup('ID_ANIMAL',ID,'D1')))-1;
    dias_al_tacto := DaysBetween(trunc(IBDSSimpleFECHA.Value),trunc(IBDSSimpleD2.Value));//DaysBetween(trunc(IBDSSimple.Lookup('ID_ANIMAL',ID,'FECHA')),trunc(IBDSSimple.Lookup('ID_ANIMAL',ID,'D2')))-1;
  end
  else
  begin
    dias_servicio := DaysBetween(trunc(DTPAFechaFin.Date),trunc(DTPAFechaIni.Date));
    dias_al_tacto := DaysBetween(trunc(DTPAFecha.Date),trunc(DTPAFechaFin.Date));
  end;
  if distribucion = 'CABEZA' then
  begin
    for ind := 0 to 3 do
    begin
      Gestacion[ind_animal].Gestacion[ind].dias := Trunc(((DatosConf[ind].cabeza*dias_servicio)*0.5)
                             +Trunc(DatosConf[ind].cuerpo*dias_servicio)
                             +Trunc(DatosConf[ind].cola*dias_servicio))
                             +dias_al_tacto;
      Gestacion[ind_animal].Gestacion[ind].dist := 1;   //Cabeza
    end;
  end;
  if distribucion = 'CUERPO' then
  begin
    for ind := 0 to 3 do
    begin
      Gestacion[ind_animal].Gestacion[ind].dias := Trunc(((DatosConf[ind].cuerpo*dias_servicio)*0.5)
                            +Trunc(DatosConf[ind].cola*dias_servicio))
                            +dias_al_tacto;
      case ind of
        0,1,2 : begin
                if (Gestacion[ind_animal].Gestacion[ind].dias > (Trunc(DatosConf[ind].cola*dias_servicio))+dias_al_tacto) then
                  Gestacion[ind_animal].Gestacion[ind].dist := 1 //Cabeza
                else
                  Gestacion[ind_animal].Gestacion[ind].dist := 3; //Cola
              end;
        3 : Gestacion[ind_animal].Gestacion[ind].dist := 2;  //Cuerpo
      end;
    end;
  end;
  if distribucion = 'COLA' then
  begin
    for ind := 0 to 3 do
    begin
      Gestacion[ind_animal].Gestacion[ind].dias := Trunc((DatosConf[ind].cola*dias_servicio)*0.5)
                             +dias_al_tacto;
      Gestacion[ind_animal].Gestacion[ind].dist := 3;  //Cola
    end;
  end;
end;

procedure TFEveDiagnosticoGestacion.CalcularCasosPorDistribucionEspecifico(distribucion : Integer; ID : Integer);
var
  dias_al_tacto, dias_servicio , dias: integer;
  ind, ind_animal : integer;
  f,fi,fn:TDate;
begin
  ind_animal := BuscarAnimal(ID);
  if (PCBasico.ActivePage=TSGrilla) and (ID>=0) and (not cargaDeMovil) then
  begin
    dias_servicio := DaysBetween(trunc(IBDSSimpleD2.Value),trunc(IBDSSimpleD1.Value));
    dias_al_tacto := DaysBetween(trunc(IBDSSimpleFECHA.Value),trunc(IBDSSimpleD2.Value));
  end
  else
  begin
    dias_servicio := DaysBetween(trunc(DTPAFechaFin.Date),trunc(DTPAFechaIni.Date));
    dias_al_tacto := DaysBetween(trunc(DTPAFecha.Date),trunc(DTPAFechaFin.Date));
  end;

  for ind := 0 to 3 do
  begin
      Gestacion[ind_animal].Gestacion[ind].dias := Trunc(((DatosConf[ind].cabeza*dias_servicio)*0.5)
                             +Trunc(DatosConf[ind].cuerpo*dias_servicio)
                             +Trunc(DatosConf[ind].cola*dias_servicio))
                             +dias_al_tacto;
      Gestacion[ind_animal].Gestacion[ind].dist := 1;   //Cabeza
  end;
end;

procedure TFEveDiagnosticoGestacion.CalcularCasosPorDiasGestacion(dias_gestacion : integer; ID : integer);
var
  dias_al_tacto, dias_servicio : integer;
  ind, ind_animal : integer;
begin
  if (PCBasico.ActivePage=TSGrilla) and (ID>=0) and (not cargaDeMovil) then
    begin
    dias_servicio := DaysBetween(trunc(IBDSSimpleD2.Value),trunc(IBDSSimpleD1.Value));//DaysBetween(trunc(IBDSSimple.Lookup('ID_ANIMAL',ID,'D2')),trunc(IBDSSimple.Lookup('ID_ANIMAL',ID,'D1')))-1;
    dias_al_tacto := DaysBetween(trunc(IBDSSimpleFECHA.Value),trunc(IBDSSimpleD2.Value));//DaysBetween(trunc(IBDSSimple.Lookup('ID_ANIMAL',ID,'FECHA')),trunc(IBDSSimple.Lookup('ID_ANIMAL',ID,'D2')))-1;
    end
  else
    begin
    dias_servicio := DaysBetween(trunc(DTPAFechaFin.DateTime),trunc(DTPAFechaIni.DateTime));
    dias_al_tacto := DaysBetween(trunc(DTPAFecha.DateTime),trunc(DTPAFechaFin.DateTime));
    end;
  ind_animal := BuscarAnimal(ID);
  for ind := 0 to 3 do
    Gestacion[ind_animal].Gestacion[ind].dias := dias_gestacion;
  //caso 1 1/2-1/2, 2 2/3-1/3, 3 1/3-2/3
  for ind := 0 to 2 do
  begin
    if (dias_gestacion > {(Trunc(DatosConf[ind].cabeza*dias_servicio)+}(Trunc(DatosConf[ind].cola*dias_servicio))+dias_al_tacto) then
      Gestacion[ind_animal].Gestacion[ind].dist := 1 //Cabeza
    else
      Gestacion[ind_animal].Gestacion[ind].dist := 3; //Cola
  end;
  //caso 4 1/3-1/3-1/3
  if (dias_gestacion < (Trunc(DatosConf[3].cola*dias_servicio)+dias_al_tacto)) then
    Gestacion[ind_animal].Gestacion[ind].dist := 3 //Cola
  else if (dias_gestacion <
       (Trunc(DatosConf[3].cuerpo*dias_servicio)+Trunc(DatosConf[3].cola*dias_servicio)+dias_al_tacto)) then
        Gestacion[ind_animal].Gestacion[ind].dist := 2 //Cuerpo
       else Gestacion[ind_animal].Gestacion[ind].dist := 1; //Cabeza
end;

procedure TFEveDiagnosticoGestacion.IBQPotreroVaciasAfterOpen(
  DataSet: TDataSet);
var
  con : integer;
begin
  con := 0;
  while (not(DataSet.Eof) and (con < 4)) do begin
    DataSet.Next;
    inc(con);
  end;
end;

procedure TFEveDiagnosticoGestacion.IBDSSimpleDIAS_GESTACIONSetText(Sender: TField; const Text: String);
var valor, ind : integer;
begin
  inherited;
  if (TryStrToInt(Text, valor)) then
   begin
    //if (StrToInt(Text)<= 300) then
    //  begin
        DiasGestacionValidos(valor,IBDSSimpleID_ANIMAL.AsInteger);
        Sender.DataSet.Edit;
        Sender.AsString := Text;
        if (directo) then
        begin
          directo := false;
          CalcularCasosPorDiasGestacion(valor,IBDSSimpleID_ANIMAL.AsInteger);
          //ahora lo puse aca x que para setear distribucion mira el estado

          if (valor = 0) then SetText(IBDSSimpleESTADO_REPRODUCTIVO,'VA')
          else SetText(IBDSSimpleESTADO_REPRODUCTIVO,'PR');
          ind := BuscarAnimal(IBDSSimpleID_ANIMAL.AsInteger);

          case Gestacion[ind].Gestacion[indice_config].dist of
            1 : SetText(IBDSSimpleDISTCACUCO,'CABEZA');
            2 : SetText(IBDSSimpleDISTCACUCO,'CUERPO');
            3 : SetText(IBDSSimpleDISTCACUCO,'COLA');
          end;
          directo := true;
        end;
     // end
    // else
   //    MostrarMensaje(tmError, 'El valor de los días de gestación tiene que estar entre 0 y 300.');
   end
  else
    MostrarMensaje(tmError, 'El valor de los días de gestación no es válido.');
end;

procedure TFEveDiagnosticoGestacion.EADiasGestacionChange(Sender: TObject);
var
  valor : integer;
begin
  inherited;
  if (Sender as TEditAuto).Text = '' then
    EADiasGestacion.Text := '0';
  CalcularDistribucion(false);
  if TryStrToInt(EADiasGestacion.Text,valor) then
  begin
    if valor in [1..34] then
    begin
      DBLCBAMetodoDiagnostico.KeyValue := 2;
      DBLCBAMetodoDiagnostico.Enabled := false;
    end
    else
    begin
      //DBLCBAMetodoDiagnostico.KeyValue := 0;
      DBLCBAMetodoDiagnostico.Enabled := true;
    end
  end;
end;

procedure TFEveDiagnosticoGestacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if(self.ModoEve = meIndividual)then
     BorrarAuxiliares();



 { IBSPBorrarTablasAuxiliares.Close;
  IBSPBorrarTablasAuxiliares.ExecProc;
  FPrincipal.IBTPrincipal.CommitRetaining; }
end;

procedure TFEveDiagnosticoGestacion.DBLCBACACUCOCloseUp(Sender: TObject);
begin
  inherited;
  CalcularDistribucion(true);
end;

procedure TFEveDiagnosticoGestacion.RBDistClick(Sender : TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;

  IBQDistCACUCOIA.Close;
  if (ModoEve = meMasivo) then
    IBQDistCACUCOIA.ParamByName('animal').Value := null
  else
    IBQDistCACUCOIA.ParamByName('animal').Value := IDAnimal;
  IBQDistCACUCOIA.ParamByName('fecha').AsDate := DTPAFecha.Date;
  IBQDistCACUCOIA.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDistCACUCOIA.Open;

 //ShowMessage(IntToStr(IBQDistCACUCOIA.RecordCount));

  if(fecha.Date > now) then
    fecha.Date:=now;

  case fecha.Tag of
   {fecha de tacto} 1 : begin
                            if CalcularServicio then
                            begin
                              DTPAFechaIni.Enabled := false;
                              DTPAFechaFin.Enabled := false;
                            end
                            else
                            begin
                              DTPAFechaIni.Enabled := true;
                              DTPAFechaFin.Enabled := true;
                              DTPAFechaIni.Date := IncMonth(DTPAFecha.Date,-5);
                              DTPAFechaFin.Date := IncMonth(DTPAFecha.Date,-2);
                            end;
                        end;
   {fecha inicio servicio} 2 : begin
                                    if DTPAFechaIni.Date>DTPAFecha.Date then DTPAFechaIni.Date:=DTPAFecha.Date;
                                    if ((CompareDate(DTPAFechaFin.Date,DTPAFechaIni.Date) = EqualsValue) or not (DTPAFechaFin.Visible)) then
                                    begin
                                        tipo_servicio := 1;
                                        DTPAFechaFin.Date := DTPAFechaIni.Date;
                                    end
                                    else if MonthsBetween(DTPAFechaFin.Date,DTPAFechaIni.Date) > 5 then
                                            DTPAFechaFin.Date := IncMonth(DTPAFechaIni.Date,5);
                               end;
   {fecha fin servicio} 3 : begin
                                if DTPAFechaFin.Date>DTPAFecha.Date then DTPAFechaFin.Date:=DTPAFecha.Date;
                                if CompareDate(DTPAFechaFin.Date,DTPAFechaIni.Date) = EqualsValue then
                                begin
                                  tipo_servicio := 1;
                                  DTPAFechaIni.Date := DTPAFechaFin.Date;
                                end
                                else if MonthsBetween(DTPAFechaFin.Date,DTPAFechaIni.Date) > 5 then
                                      DTPAFechaIni.Date := IncMonth(DTPAFechaFin.Date,-5);
                            end;
  end;

  if tipo_servicio = 1 then
    mostrar_error_2 := DaysBetween(DTPAFecha.Date,DTPAFechaIni.Date) < Dias_Tacto_Servicio
  else
    mostrar_error_2 := DaysBetween(DTPAFecha.Date,DTPAFechaFin.Date) < Dias_Tacto_Servicio;

  HabilitarPreniez();

  if(fecha.Date > now) then
    fecha.Date:=now
  else
    CalcularDistribucion(true);
  DTPAFechaExit(DTPAFecha);
end;

procedure TFEveDiagnosticoGestacion.DiasGestacionValidos(var dias : integer ; ID : integer);
var
  resultado : boolean;
  dias_G : integer;
begin
  resultado := false;
  if (ID = -1) then
    dias_G := 281
  else
  begin
    IBQDiasRaza.Close;
    IBQDiasRaza.ParamByName('ID').AsInteger := ID;
    IBQDiasRaza.Open;
    dias_G := IBQDiasRaza.FieldValues['dias_gestacion'];
  end;
  if (dias > (dias_G+Ventana)) then
  begin
    resultado := false;
    dias := dias_G+Ventana;
  end
  else
    resultado := true;
  mostrar_error_1 := not resultado;
end;

procedure TFEveDiagnosticoGestacion.LLinkEstServClick(Sender: TObject);
var
  F : TFREPServicio;
begin
  inherited;
  F := TFREPServicio.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFEveDiagnosticoGestacion.LLinkDenServClick(Sender: TObject);
var
  F : TFREPDenunciaServicio;
begin
  inherited;
  F := TFREPDenunciaServicio.Create(Self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFEveDiagnosticoGestacion.PCBasicoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if mostrar_error_1 then
    MostrarMensaje(tmError,'Los dias de gestacion ingresados superan los permitidos por la raza');
  if mostrar_error_2 then
    if MostrarMensaje(tmConsulta,Traducir('Los dias entre la fecha de tacto y la fecha de fin de servicio no respetan los parametros del establecimento. Se establecieron ')+
                      IntToStr(Dias_Tacto_Servicio)+Traducir(' dias entre el tacto y el servicio. Desea Continuar?')) = MrYes then
      mostrar_error_2 := false;
  AllowChange := (not mostrar_error_1) and (not mostrar_error_2);
end;

procedure TFEveDiagnosticoGestacion.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
  {if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
      DMSoftvet.IBQResponsable.Close;
      DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQResponsable.Open;
    end; }
end;

procedure TFEveDiagnosticoGestacion.LResponsableMouseEnter(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveDiagnosticoGestacion.LResponsableMouseLeave(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveDiagnosticoGestacion.LNuevoPotreroVaciaClick(
  Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      IBQPotreroVacias.Close;
      IBQPotreroVacias.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQPotreroVacias.Open;

      IBQPotreroPreniadas.Close;
      IBQPotreroPreniadas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQPotreroPreniadas.Open;
      if (Sender as TLabel).Name = 'LNuevoPotreroVacia' then
        cambiarCB(DBLCBANuevoPotreroVacias,nroID);
    end
end;

procedure TFEveDiagnosticoGestacion.LNuevoPotreroVaciaMouseEnter(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (LNuevoPotreroVacia.Enabled) then
        begin
          LNuevoPotreroVacia.Font.Color:= $00606C02;
          LNuevoPotreroVacia.Font.Style:= [fsBold,fsUnderline];
        end;
    end;    
end;

procedure TFEveDiagnosticoGestacion.LNuevoPotreroVaciaMouseLeave(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (LNuevoPotreroVacia.Enabled) then
        begin
          LNuevoPotreroVacia.Font.Color:= clWindowText;
          LNuevoPotreroVacia.Font.Style:= [fsUnderline];
        end;
    end;    
end;

procedure TFEveDiagnosticoGestacion.LNuevoPotreroPreniadaClick(
  Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      IBQPotreroPreniadas.Close;
      IBQPotreroPreniadas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQPotreroPreniadas.Open;

      IBQPotreroVacias.Close;
      IBQPotreroVacias.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQPotreroVacias.Open;
      if (Sender as TLabel).Name = 'LNuevoPotreroPreniada' then
        cambiarCB(DBLCBANuevoPotreroPreniadas,nroID);
    end;
end;

procedure TFEveDiagnosticoGestacion.LNuevoPotreroPreniadaMouseEnter(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (LNuevoPotreroPreniada.Enabled) then
        begin
          LNuevoPotreroPreniada.Font.Color:= $00606C02;
          LNuevoPotreroPreniada.Font.Style:= [fsBold,fsUnderline];
        end;
    end;
end;

procedure TFEveDiagnosticoGestacion.LNuevoPotreroPreniadaMouseLeave(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      if (LNuevoPotreroPreniada.Enabled) then
        begin
          LNuevoPotreroPreniada.Font.Color:= clWindowText;
          LNuevoPotreroPreniada.Font.Style:= [fsUnderline];
        end;
    end;
end;

function TFEveDiagnosticoGestacion.CalcularServicio() : Boolean;
var
  resultado : boolean;
begin
  IBQDatosDiag.Close;
  IBQDatosDiag.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosDiag.ParamByName('fecha_tacto').AsDate := DTPAFecha.Date;
  IBQDatosDiag.Open;
  MServicios.Lines.Clear;
  MServicios.Visible := false;
  tipo_servicio := IBQDatosDiag.FieldValues['TIPO_SERVICIO'];
  LServicio.Visible := false;
  resultado := false;

  if IBQDatosDiag.FieldByName('NOM_SERV').Value <> null then
  begin
    Servicio := IBQDatosDiag.FieldValues['SERVICIO'];
    {LServicio.Visible := true;
    LServicio.Caption := IBQDatosDiag.FieldValues['NOM_SERV'];}
    MServicios.Visible := true;
    MServicios.Lines.Add(IBQDatosDiag.FieldValues['NOM_SERV']);
    resultado := true;


    IBQServiciosAdicionales.Close;
    IBQServiciosAdicionales.ParamByName('fecha_1').AsDate := DTPAFecha.Date;
    IBQServiciosAdicionales.ParamByName('fecha_2').AsDate := IncDay(DTPAFecha.Date,-279);
    IBQServiciosAdicionales.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQServiciosAdicionales.Open;
    IBQServiciosAdicionales.Last;
    IBQServiciosAdicionales.First;


    if IBQServiciosAdicionales.RecordCount in [1..5] then
    begin
      LServicio.Visible := false;
      MServicios.Visible := true;
      //MServicios.Lines.Add(LServicio.Caption);
      while not IBQServiciosAdicionales.Eof do
      begin
        if(IBQServiciosAdicionales.FieldValues['NOMBRE'] <> IBQDatosDiag.FieldValues['NOM_SERV'])then
          MServicios.Lines.Add(IBQServiciosAdicionales.FieldValues['NOMBRE']);
        IBQServiciosAdicionales.Next;
      end;
    end;
    {else
        MServicios.Lines.Add(LServicio.Caption);}
  end
  else
  begin
    LServicio.Visible := false;
    LServicio.Caption := '';
  end;

  if IBQDatosDiag.FieldValues['FECHA_INI'] <> null then
    DTPAFechaIni.Date := IBQDatosDiag.FieldValues['FECHA_INI']
  else
    DTPAFechaIni.Date := IncMonth(DTPAFecha.Date,-5);

  if IBQDatosDiag.FieldValues['FECHA_FIN'] <> null then
    DTPAFechaFin.Date := IBQDatosDiag.FieldValues['FECHA_FIN']
  else
    DTPAFechaFin.Date := IncMonth(DTPAFecha.Date,-2);

  Result := resultado;
end;

procedure TFEveDiagnosticoGestacion.ControlReales(Sender: TObject;
  var Key: Char);
begin
  if (Key = '.') then
    Key := ',';

  if (pos(',',TEditAuto(Sender).Text)=0) then
    begin
      if not (key in ['0'..'9',',',#8]) then key:=#0;
    end
  else if not (key in ['0'..'9',#8]) then key:=#0;
end;

procedure TFEveDiagnosticoGestacion.EAPrecioChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EAPrecio.Text,Precio) then
  begin
    EAPrecio.Text := '';
    Precio := 0;
  end;
end;

procedure TFEveDiagnosticoGestacion.UDDiasGestacionChangingEx(
  Sender: TObject; var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  inherited;

  AllowChange := CompareDate(DTPAFecha.Date,DTPAFechaIni.Date) = GreaterThanValue;

  if ((tipo_servicio = 1) and (DTPAFechaIni.Enabled) and AllowChange) then
  begin
    case Direction of
      updDown : DTPAFechaIni.Date := IncDay(DTPAFechaIni.Date,1);
      updUp : DTPAFechaIni.Date := IncDay(DTPAFechaIni.Date,-1);
    end;
    DTPAFechaFin.Date := DTPAFechaIni.Date;
    RBDistClick(DTPAFechaIni);
  end;
end;

procedure TFEveDiagnosticoGestacion.Label2Click(Sender: TObject);
var
  F : TFModificacionParametros;
begin
  inherited;
  F := TFModificacionParametros.Create(Self);
  F.ShowModal;
  F.Destroy;
  CalcularDatosGestacion;
  CalcularCC;
  LoadSQLStringList;
  PCBasicoChange(PCBasico);
end;

procedure TFEveDiagnosticoGestacion.CapturarEvento(Sender : TObject);
begin
  GetEvent(EADiasGestacion);
  GetEvent(DBLCBACACUCO);
  GetEvent(DBLCBAEstadoReproductivo);
end;

procedure TFEveDiagnosticoGestacion.CalcularDatosGestacion();
begin
  FPrincipal.IBDPrincipal.ApplyUpdates([MSimple.IBQSeleccionados]);
  IBQDatosDiag.Close;
  IBQDatosDiag.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosDiag.ParamByName('fecha_tacto').AsDate := DTPAFecha.Date;
  IBQDatosDiag.Open;
  dist := IBQDatosDiag.FieldValues['DIST'];
  conf := IBQDatosDiag.FieldValues['CONFIG'];
  cuerpo := IBQDatosDiag.FieldValues['CUERPO'];
  cabeza := IBQDatosDiag.FieldValues['CABEZA'];
  cola := IBQDatosDiag.FieldValues['COLA'];
  tipo_servicio := IBQDatosDiag.FieldValues['TIPO_SERVICIO'];
  Dias_Tacto_Servicio := IBQDatosDiag.FieldValues['DIAS_TACTO_SERVICIO'];

  SetLength(Gestacion,0);
  SetLength(Gestacion,MSimple.IBQSeleccionados.RecordCount+10000);  //10000);    //el 10000 es un parche para evitar error de puntero

  //Indice_Gral := 1;

 { DMSoftvet.IBQDistCACUCO.Close;
  DMSoftvet.IBQDistCACUCO.ParamByName('g').AsInteger := dist;
  DMSoftvet.IBQDistCACUCO.Open; }
  IBQDistCACUCOIA.Close;
  if (ModoEve = meMasivo) then                                                                                                         
    IBQDistCACUCOIA.ParamByName('animal').Value := null
  else
    IBQDistCACUCOIA.ParamByName('animal').AsInteger := IDAnimal;
  IBQDistCACUCOIA.ParamByName('fecha').AsDate := DTPAFecha.Date;
  IBQDistCACUCOIA.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDistCACUCOIA.Open;

  Condicion := 1;
  HabilitarPreniez();

  DBLCBAEstadoReproductivo.KeyValue:= 2;
  DBLCBAEstadoReproductivoCloseUp(nil);

  if dist = 3 then
  begin
    indice_config := 3;
    LConfDist.Caption := Traducir('Configuración : 1/3 Cabeza - 1/3 Cuerpo - 1/3 Cola');
  end
  else
  begin
    //RBCuerpo.Visible := false;
    case conf of
      1 : begin
            LConfDist.Caption := Traducir('Configuración : 1/2 Cabeza - 1/2 Cola');
            indice_config := 0;
          end;
      2 : begin
            LConfDist.Caption := Traducir('Configuración : 2/3 Cabeza - 1/3 Cola');
            indice_config := 1;
          end;
      3 : begin
            LConfDist.Caption := Traducir('Configuración : 1/3 Cabeza - 2/3 Cola');
            indice_config := 2;
          end;
    end;
  end;

  CalcularServicio();
end;

procedure TFEveDiagnosticoGestacion.importarDeMovil;
var long:integer;
begin
Indice_Gral := 1;
CalcularDatosGestacion;
SetLength(Gestacion,0);
long:=Length(anim)+1;
SetLength(Gestacion,{10000}long);
inherited;
deAlta:=false;
end;

procedure TFEveDiagnosticoGestacion.DTPAFechaExit(Sender: TObject);
begin
  inherited;
  GetEvent(DTPAFecha);
  GetEvent(DTPAFechaIni);
  GetEvent(DTPAFechaFin);
  GetEvent(EADiasGestacion);
  GetEvent(DBLCBACACUCO);
end;

procedure TFEveDiagnosticoGestacion.DTPAFechaIniExit(Sender: TObject);
begin
  inherited;
  GetEvent(DTPAFechaIni);
  GetEvent(EADiasGestacion);
  GetEvent(DBLCBACACUCO);
end;

procedure TFEveDiagnosticoGestacion.DTPAFechaFinExit(Sender: TObject);
begin
  inherited;
  GetEvent(DTPAFechaFin);
  GetEvent(EADiasGestacion);
  GetEvent(DBLCBACACUCO);
  RBDistClick(Sender);
end;

procedure TFEveDiagnosticoGestacion.IBDSSimpleID_RPSetText(Sender: TField;const Text: String);
begin
  inherited;
    if BuscarAnimal(IBDSSIMPLEID_ANIMAL.AsInteger)=0 then
      begin
      Gestacion[Indice_Gral].id_animal := IBDSSimple.FieldByName('ID_ANIMAL').Value;
      Gestacion[Indice_Gral].Gestacion := Gestacion[0].Gestacion;
      Inc(Indice_Gral);
      end;
end;

procedure TFEveDiagnosticoGestacion.ATerminarExecute(Sender: TObject);
begin

 //showmessage (  IBDSSimple.FieldByName('DIAS_GESTACION'));
  {BDBGSimple.Hide;
  IBDSSimple.First;
  While not IBDSSimple.Eof do
  begin
  if(IBDSSimple.FieldByName('ESTADO_REPRODUCTIVO').Value<>'VACIA')  then
     //SetText(IBDSSimple.FieldByName('DISTCACUCO'),IBDSSimple.FieldByName('DISTCACUCO').Value)
  //else
     IBDSSimpleDIAS_GESTACIONSetText(IBDSSimple.FieldByName('DIAS_GESTACION'),IBDSSimple.FieldByName('DIAS_GESTACION').Value);
  IBDSSimple.Next;
  end;
  BDBGSimple.Show; }

  inherited;
end;

procedure TFEveDiagnosticoGestacion.cargarDatos(i:integer);
var fecha:TDateTime;
    id,estadoRep,str,nom,ap,nomyap:string;
begin
  inherited;
    IBDSSimple.FieldByName('ID_ANIMAL').AsInteger:=anim[i].id;
    DMSoftvet.IBQDatosAnimal.Close;
    DMSoftvet.IBQDatosAnimal.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQDatosAnimal.Open;
    IBDSSimple.FieldByName('ID_RP').Value:=DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_RP');
    if DMSoftVet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_SENASA')<>null then
      IBDSSimple.FieldByName('ID_SENASA').Value:=DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',anim[i].id,'ID_SENASA');

    DTPAFecha.Date:=strtodate(getDato('fecha',anim[i]));
    DTPAFechaIni.Date:=strtodate(getDato('inicio servicio',anim[i]));
    DTPAFechaFin.Date:=IncDay(strtodate(getDato('fin servicio',anim[i])),1);
    RBDistClick(DTPAFechaFin);

    IBDSSimple.FieldByName('FECHA').AsDateTime := strtodate(getDato('fecha',anim[i]));
    IBDSSimple.FieldByName('D1').AsDateTime := strtodate(getDato('inicio servicio',anim[i]));
    IBDSSimple.FieldByName('D2').AsDateTime := strtodate(getDato('fin servicio',anim[i]));

    str:=getDato('responsable',anim[i]);
    separarNombre(str,nom,ap);
    nomyap:=UpperCase(nom+' '+ap);

    if (DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',str,'ID_EMPLEADO')<>null) then
      begin
      IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',str,'ID_EMPLEADO');
      IBDSSimple.FieldByName('RESP').Value:= str;
      end
    else
      begin
      IBDSSimple.FieldByName('RESPONSABLE').Value:= 0;
      IBDSSimple.FieldByName('RESP').Value:= 'INDEFINIDO';
      end;
    str:=getDato('condición corporal',anim[i]);
    if str<>'' then
            begin
            IBDSSimple.FieldByName('condicion_corporal').Value:= str;
            IBDSSimple.FieldByName('id_condicion_corporal').Value:= DBLCBACondicionCorporal.ListSource.DataSet.Lookup('escala',str,'ID_CONDICION_CORPORAL');
            end
          else
            begin
            IBDSSimple.FieldByName('id_condicion_corporal').Value:= null;
            IBDSSimple.FieldByName('condicion_corporal').Value:= null;
            end;
    str:=getDato('cronología dentaria',anim[i]);
    if str = '' then
      str := 'NN';
    str := UpperCase(str);
    if DBLCBACronologiaDentaria.ListSource.DataSet.Lookup('CODIGO',str,'ID_CRONOLOGIA_DENTARIA')<>null then
      id:=DBLCBACronologiaDentaria.ListSource.DataSet.Lookup('CODIGO',str,'ID_CRONOLOGIA_DENTARIA');
    if DBLCBACronologiaDentaria.ListSource.DataSet.Lookup('SINONIMO',str,'ID_CRONOLOGIA_DENTARIA')<>null then
      id:=DBLCBACronologiaDentaria.ListSource.DataSet.Lookup('SINONIMO',str,'ID_CRONOLOGIA_DENTARIA');

    IBDSSimple.FieldByName('ID_CRONOLOGIA_DENTARIA').Value:= id;
    IBDSSimple.FieldByName('CRONOLOGIA_DENTARIA').Value:= DBLCBACronologiaDentaria.ListSource.DataSet.Lookup('ID_CRONOLOGIA_DENTARIA',IBDSSimple.FieldByName('ID_CRONOLOGIA_DENTARIA').Value,'SINONIMO');

    {str:=getDato('estado reproductivo',anim[i]);
    if str='' then
      if  (str<>'VACIA') or (getDato('días gestación',anim[i])<>'') or (getDato('días gestación',anim[i])<>'0') then
        setDato('estado reproductivo','PREÑADA',anim[i])//anim[i].er:='PREÑADA'
      else
        setDato('estado reproductivo','VACIA',anim[i]);//anim[i].er:='VACIA';}

    estadoRep:=StringReplace(UpperCase(getDato('estado reproductivo',anim[i])),'ñ','Ñ',[rfIgnoreCase,rfReplaceAll]);
    // Conversion de los datos
    if estadoRep = 'VA' then  estadoRep := 'VACIA'
    else  if (estadoRep='CA') then estadoRep := 'CABEZA'
    else  if (estadoRep='CU')  then estadoRep := 'CUERPO'
    else  if (estadoRep='CO')   then estadoRep := 'COLA';


    if (estadoRep<>'VACIA')  then
      begin
          IBDSSimple.FieldByName('ID_ESTADO_REPRODUCTIVO').Value:= 2;
          IBDSSimple.FieldByName('ESTADO_REPRODUCTIVO').Value:= 'PREÑADA';

          DMSoftvet.IBQParamEstablecimiento.Close;
          DMSoftvet.IBQParamEstablecimiento.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
          DMSoftvet.IBQParamEstablecimiento.Open;
          dist:=DMSoftvet.IBQParamEstablecimiento.Lookup('PARAMETRO',IntToStr(41),'VALOR'); //obtiene el valor de dist CACUCO de la configuracion

          {DMSoftvet.IBQDistCACUCO.Close;
          DMSoftvet.IBQDistCACUCO.ParamByName('g').AsInteger := dist;
          DMSoftvet.IBQDistCACUCO.Open;}
          IBQDistCACUCOIA.Close;
          IBQDistCACUCOIA.ParamByName('animal').AsInteger := anim[i].id;
          IBQDistCACUCOIA.ParamByName('fecha').AsDate := strtodate(getDato('fecha',anim[i]));
          IBQDistCACUCOIA.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
          IBQDistCACUCOIA.Open;
          //str:=getDato('distribución',anim[i]);
        //  showmessage('estadorep');
       //   showmessage(estadorep);
          if (estadoRep='CABEZA') or (estadoRep='CUERPO') or (estadoRep='COLA') then
          //if DBLCBACACUCO.ListSource.DataSet.Lookup('SINONIMO',estadoRep,'ID_DIST_CACUCO')<>null then  //cuando es "PREÑADA", id sera null
            begin
            IBDSSimple.FieldByName('distcacuco').Value := estadoRep;
            IBDSSimple.FieldByName('id_distcacuco').Value := DBLCBACACUCO.ListSource.DataSet.Lookup('NOMBRE',estadoRep,'ID_DIST_CACUCO');
            end
          else
            begin
            IBDSSimple.FieldByName('distcacuco').Value := 'CABEZA';//DBLCBACACUCO.Text;
            IBDSSimple.FieldByName('id_distcacuco').Value := 0;//DBLCBACACUCO.ListSource.DataSet.Lookup('SINONIMO',DBLCBACACUCO.Text,'ID_DIST_CACUCO');
            end;
      end
    else
      begin
          IBDSSimple.FieldByName('ESTADO_REPRODUCTIVO').Value:= estadoRep;
          IBDSSimple.FieldByName('ID_ESTADO_REPRODUCTIVO').Value:= DBLCBAEstadoReproductivo.ListSource.DataSet.Lookup('NOMBRE',estadoRep,'ID_ESTADO_REPRODUCTIVO');
      end;
    str := Uppercase(getDato('método',anim[i]));
    id:=DBLCBAMetodoDiagnostico.ListSource.DataSet.Lookup('NOMBRE',str,'ID_METODO_DIAGNOSTICO');
    IBDSSimple.FieldByName('ID_METODO_DIAGNOSTICO').Value:= id;
    IBDSSimple.FieldByName('METODO_DIAGNOSTICO').Value:= getDato('método',anim[i]);
    str:=getDato('días',anim[i]);
    if (estadoRep<>'VACIA') then
      begin
      if (str='') or (str='0') then
        SetText(IBDSSimple.FieldByName('DISTCACUCO'),IBDSSimple.FieldByName('DISTCACUCO').value)
      else
        IBDSSimpleDIAS_GESTACIONSetText(IBDSSimple.FieldByName('DIAS_GESTACION'),str);
      if BuscarAnimal(IBDSSIMPLEID_ANIMAL.AsInteger)=0 then
        begin
        Gestacion[Indice_Gral].id_animal := IBDSSimple.FieldByName('ID_ANIMAL').Value;
        Gestacion[Indice_Gral].Gestacion := Gestacion[0].Gestacion;
        Inc(Indice_Gral);
        end;
      end
    else
      IBDSSimple.FieldByName('DIAS_GESTACION').Value:= 0;

      DMSoftvet.IBQCodigosGenericos.Close;
      DMSoftvet.IBQCodigosGenericos.ParamByName('TIPO').Value:='SN';
      DMSoftvet.IBQCodigosGenericos.Open;
      str:=getDato('mucus',anim[i]);
      if str<>'' then
        begin
        IBDSSimple.FieldByName('MUESTREOMUCUS').Value:= str;
        IBDSSimple.FieldByName('id_MUESTREOMUCUS').Value:= DMSoftvet.IBQCodigosGenericos.Lookup('VALOR',IBDSSimple.FieldByName('MUESTREOMUCUS').Value,'ID_CODIGO');
        end
      else
        begin
        IBDSSimple.FieldByName('MUESTREOMUCUS').Value:= 'NO';
        IBDSSimple.FieldByName('id_MUESTREOMUCUS').Value:= 'N';
        end;
      str:=getDato('rechazo',anim[i]);
      if str<>'' then
        begin
        IBDSSimple.FieldByName('RECHAZO').Value:= str;
        IBDSSimple.FieldByName('id_RECHAZO').Value:= DMSoftvet.IBQCodigosGenericos.Lookup('VALOR',IBDSSimple.FieldByName('RECHAZO').Value,'ID_CODIGO');
        end
      else
        begin
        IBDSSimple.FieldByName('RECHAZO').Value:= 'NO';
        IBDSSimple.FieldByName('id_RECHAZO').Value:= 'N';
        end;
      //sangrado.... esto va a venir del xml tambien
      str:=getDato('sangrado',anim[i]);
      if str<>'' then
        begin
        IBDSSimple.FieldByName('MUESTREO').Value:= str;
        IBDSSimple.FieldByName('id_MUESTREO').Value:= DMSoftvet.IBQCodigosGenericos.Lookup('VALOR',IBDSSimple.FieldByName('MUESTREO').Value,'ID_CODIGO');
        end
      else
        begin
        IBDSSimple.FieldByName('MUESTREO').Value:= 'NO';
        IBDSSimple.FieldByName('id_MUESTREO').Value:= 'N';
        end;
      DMSoftvet.IBQCodigosGenericos.Close;
      DMSoftvet.IBQCodigosGenericos.ParamByName('TIPO').Value:='NA';
      DMSoftvet.IBQCodigosGenericos.Open;
      str:=getDato('utero',anim[i]);
      if str<>'' then
        begin
        IBDSSimple.FieldByName('ID_CONDICION_UTERO').Value := DMSoftvet.IBQCodigosGenericos.Lookup('VALOR',str,'ID_CODIGO');
        IBDSSimple.FieldByName('CONDICION_UTERO').Value := str;
        end
      else
        begin
        IBDSSimple.FieldByName('ID_CONDICION_UTERO').Value := 'N';
        IBDSSimple.FieldByName('CONDICION_UTERO').Value := 'NORMAL';
        end;
      str:=getDato('ovario',anim[i]);
     if str<>'' then
        begin
        IBDSSimple.FieldByName('ID_CONDICION_OVARIO').Value := DMSoftvet.IBQCodigosGenericos.Lookup('VALOR',str,'ID_CODIGO');
        IBDSSimple.FieldByName('CONDICION_OVARIO').Value := str;
        end
      else
        begin
        IBDSSimple.FieldByName('ID_CONDICION_OVARIO').Value := 'N';
        IBDSSimple.FieldByName('CONDICION_OVARIO').Value := 'NORMAL';
        end;
      str:=getDato('cervix',anim[i]);
      if str<>'' then
        begin
        IBDSSimple.FieldByName('ID_CONDICION_CERVIX').Value := DMSoftvet.IBQCodigosGenericos.Lookup('VALOR',str,'ID_CODIGO');
        IBDSSimple.FieldByName('CONDICION_CERVIX').Value := str;
        end
      else
        begin
        IBDSSimple.FieldByName('ID_CONDICION_CERVIX').Value := 'N';
        IBDSSimple.FieldByName('CONDICION_CERVIX').Value := 'NORMAL';
        end;

        str:=getDato('Observaciones', anim[i]);
        if str <> '' then
          IBDSSimple.FieldByName('OBSERVACION').Value := str;

end;

procedure TFEveDiagnosticoGestacion.BBXlsImportClick(Sender: TObject);
begin
  ImportarArchivo;
  IBDSSimpleID_RP.ReadOnly:=false;
end;

procedure TFEveDiagnosticoGestacion.BorrarAuxiliares;
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end; 

procedure TFEveDiagnosticoGestacion.BDBGSimpleColEnter(Sender: TObject);
begin
  IBQDistCACUCOIA.Close;
  IBQDistCACUCOIA.ParamByName('animal').AsInteger := IBDSSimpleID_ANIMAL.AsInteger;
  IBQDistCACUCOIA.ParamByName('fecha').AsDate := IBDSSimpleFECHA.AsDateTime;
  IBQDistCACUCOIA.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDistCACUCOIA.Open;
  LoadSQLStringList;
  inherited;
end;

procedure TFEveDiagnosticoGestacion.IBQDistCACUCOIAAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

{#1 INICIO 28/11/2014 Matias Rizzi}
procedure TFEveDiagnosticoGestacion.ImportarArchivo;
var archivo_Importacion_orig: string;
begin
  ODExcel.Filter := 'Archivos Excel (*.xls; *.xlsx)|*.xls';
  if ODExcel.Execute then
    begin
      archivo_Importacion_orig := ODExcel.FileName;
      archivo_Importacion := StringReplace(archivo_Importacion_orig,ExtractFileExt(archivo_Importacion_orig),'',[rfReplaceAll]);
      archivo_Importacion := archivo_Importacion+'_imp_.xls';
      CopyFile(PChar(archivo_Importacion_orig), PChar(archivo_Importacion), false);
      cargarArchivo(archivo_Importacion);
    end;
  //PASelArch.Visible:= false;
end;
{#1 FIN 28/11/2014 Matias Rizzi}
end.

