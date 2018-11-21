unit UEveInseminacionArtificial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, IBCustomDataSet, DB, IBQuery, ActnList, ComCtrls,
  Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto, UFrameMangazo, Buttons,
  ExtCtrls, DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, EditAuto,
  Mask, IBDatabase, IBStoredProc, DataExport, DataToXLS, WinXP, UClassType,
  UEveMovimientoSemenExtraccion, Menus, AdvMenus, Types,
  ImgList, PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls,
  JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom, XMLIntf,
  msxmldom, XMLDoc;

type
  TorosDosis = record
    id_toro : integer;
    nombre : string;
    dosis_requeridas : integer;
    dosis_disponibles : integer;
    externo : String;
  end;

  ListaToros = Array of TorosDosis;

  TFEveInseminacionArtificial = class(TFEveSimple)
    IBQToros: TIBQuery;
    DSToros: TDataSource;
    IBSPAjusteSemen: TIBStoredProc;
    IBSPRegistrarCelo: TIBStoredProc;
    IBQAjusteSemen: TIBQuery;
    IBQEdadAnimal: TIBQuery;
    IBQEdadAnimalVALOR: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleI2: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    IBDSSimpleHORA_POST_CELO: TIntegerField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleINCOND: TIntegerField;
    IBDSSimpleCONDICION: TIBStringField;
    IBDSSimpleIDTORO: TIntegerField;
    IBDSSimpleTORO: TIBStringField;
    IBQTorosGrilla: TIBQuery;
    DSTorosParaGrilla: TDataSource;
    IBQTipoCond: TIBQuery;
    IBQCantSemen: TIBQuery;
    PMSemen: TPopupMenu;
    Compra: TMenuItem;
    Extraccion: TMenuItem;
    IBQUpdateAuxEventos: TIBQuery;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleH2: TTimeField;
    IBDSSimpleH1: TTimeField;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    LSincronizacion: TLabel;
    LTratamiento: TLabel;
    LDeteccion: TLabel;
    EANombre: TEditAuto;
    LNombre: TLabel;
    LFecha: TLabel;
    DTPAFechaInicio: TDateTimePickerAuto;
    DTPAHora: TDateTimePickerAuto;
    LHoraIni: TLabel;
    LHoraFin: TLabel;
    DTPAHoraFin: TDateTimePickerAuto;
    LResponsable: TLabel;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    CBCondicionCorporal: TCheckBox;
    LCondicionCorporal: TLabel;
    DBLCBACondicionCorporal: TDBLookupComboBoxAuto;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    LPotrero: TLabel;
    Label1: TLabel;
    DBLCBAToros: TDBLookupComboBoxAuto;
    LcantDosis: TLabel;
    EACantDosis: TEditAuto;
    CantidadDosis: TDBEdit;
    GBCelo: TGroupBox;
    LmensajeEventoCelo: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    CBRegistrarCelo: TCheckBox;
    MEHorasPostCelo: TEdit;
    IBQTorosNOM_COMPLETO: TStringField;
    IBQTorosID_RP: TIBStringField;
    IBQTorosAPODO: TIBStringField;
    IBQTorosCANTIDAD: TIntegerField;
    IBQTorosANIMAL: TIntegerField;
    IBQTorosANIMAL_EXTERNO: TIntegerField;
    IBQTorosID_SEMEN: TIntegerField;
    IBQTorosCANTIDAD1: TIntegerField;
    IBQTorosTIPO: TIBStringField;
    IBQTorosGrillaID_SEMEN: TIntegerField;
    IBQTorosGrillaID_RP: TIBStringField;
    IBQTorosGrillaAPODO: TIBStringField;
    IBQTorosGrillaCANTIDAD: TIntegerField;
    IBQTorosGrillaNOM_COMPLETO: TStringField;
    IBQValidacionGrilla: TIBQuery;
    IntegerField1: TIntegerField;
    IBQValidacionGrillaNOM_COMPLETO: TStringField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IntegerField2: TIntegerField;
    EBuscarAnimal: TEdit;
    IBuscarAnimal: TImage;
    Label3: TLabel;
    Label5: TLabel;
    IBQTorosAux: TIBQuery;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    CBPotrero: TCheckBox;
    CBRodeo: TCheckBox;
    IBQActualizarGrupo: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CBRegistrarCeloClick(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EACantDosisKeyPress(Sender: TObject; var Key: Char);
    procedure EACantDosisExit(Sender: TObject);
    procedure MEHorasPostCeloExit(Sender: TObject);
    procedure CBCondicionCorporalClick(Sender: TObject);
    procedure CBCondicionCorporalKeyPress(Sender: TObject; var Key: Char);
    procedure IBDSSimpleCONDICIONSetText(Sender: TField;
      const Text: String);
    procedure IBDSSimpleI1SetText(Sender: TField; const Text: String);
    procedure IBDSSimpleHORASetText(Sender: TField; const Text: String);
    procedure DTPAFechaInicioChange(Sender: TObject);
    procedure MEHorasPostCeloKeyPress(Sender: TObject; var Key: Char);
    procedure MEHorasPostCeloChange(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure LPotreroMouseEnter(Sender: TObject);
    procedure LPotreroMouseLeave(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LPotreroClick(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure CompraClick(Sender: TObject);
    procedure ExtraccionClick(Sender: TObject);
    procedure DBLCBATorosCloseUp(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure BBXlsImportClick(Sender: TObject);
    procedure LSincronizacionClick(Sender: TObject);
    procedure LTratamientoClick(Sender: TObject);
    procedure LDeteccionClick(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure IBQTorosCalcFields(DataSet: TDataSet);
    procedure IBQTorosGrillaCalcFields(DataSet: TDataSet);
    procedure IBQValidacionGrillaCalcFields(DataSet: TDataSet);
    procedure IBuscarAnimalClick(Sender: TObject);
    procedure EBuscarAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure ImpDisVesta(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure CBPotreroClick(Sender: TObject);
    procedure CBRodeoClick(Sender: TObject);
    procedure ASiguienteExecute(Sender: TObject);


  private
    { Private declarations }

    ID_SERVICIO:integer;
    ID_GRUPO:integer;
    cantDosisTotal:integer;
    LResult: Boolean;
    FEdadMinima:Integer;                                                           
    TorosMenorDosis : ListaToros;
    EditoFechaGrilla : Boolean;
    CargaMenu : Boolean;
    desdeExcel : Boolean;
    FechaServicio : TDate;
    CambioPotrero, CambioRodeo : Boolean;
    potrero : integer;
    rodeo : integer;

    function ajustar:boolean;
    procedure RegistrarCelo;
    procedure CargarParametrosRegCelo;
    function RestarHoras(Fecha: TDateTime; CantHoras: integer):TDateTime;
    function ExtraerHora(ValorDelControl: TDateTime): TDateTime;
    procedure controlCondicionCorporal;//agregue codigo
    function CargarMasivo : Boolean;
    function CargarIndividual : Boolean;
    procedure AntesDeCargar;
    procedure GrupoServicio;
    procedure ActualizarGrilla();
    procedure BorrarAux;
    function ModificoFecha : Boolean;

    procedure BuscarSemental(query : string);
  protected

    procedure CargarDatosGrilla; override;
    procedure CargarParametrosMasivo; override;
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    procedure AntesDeTerminar; override;
    Procedure DespuesDeTerminar; override;
    procedure LoadSQLStringList; override;
    procedure cargarDatos(i:integer); override;
    procedure continuarGrilla; override;
    procedure AntesDeEjecutarSP; override;
    procedure crearServicio;override;
  public
    procedure HabilitarMenu(Habilitado : Boolean);
  end;

var
  FEveInseminacionArtificial: TFEveInseminacionArtificial;
  vSelecciono : boolean;

implementation

uses UDMSoftvet, UPrincipal, DateUtils, UEveUniversal, UMensajeHuella, Math, UABMRodeos,
  UAvanceTerminar, UABMEmpleados, UABMPotreros, UABMSimple,UEveSincronizacionCelo, UEveTratamiento,
  UEveDeteccionCelo, UMensajeInseminacion, UImportacion, ConvUtils, UFunctions, UTraduccion, UEveMovimientoSemenCompra, USelAnimalesEmbriones, UMovCargarDatos;

{$R *.dfm}

procedure TFEveInseminacionArtificial.FormShow(Sender: TObject);
begin
  inherited;
//  MSimple.PasarParametros(2);// aca cambie codigo
  MSimple.PasarParametros(2,5);
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DBLCBAResponsable.AsignarValorDefecto;
  DBLCBACondicionCorporal.KeyValue := 0;
  DBLCBACondicionCorporal.Enabled:= false;
  DBLCBAPotrero.KeyValue := 0;    //CAMBIAR LO DEL POTRERO
  IBQToros.Last;
  IBQToros.First;
  EANombre.Text :=PTitulo.Caption+ ' ' + DateToStr(DTPAFechaInicio.Date);
  EACantDosis.Text := '1';
  EditoFechaGrilla := false;
  desdeExcel := false;
  MSimple.IBQSeleccionados.Open;
  MSimple.IBQDisponibles.Open;
  vSelecciono := false;
end;

function TFEveInseminacionArtificial.ModificoFecha : Boolean;
begin
  if ModoEve = meMasivo then
  begin
    IBDSSimple.First;
    if desdeExcel then
      FechaServicio := IBDSSimple.FieldValues['fecha']
    else
      FechaServicio := DTPAFechaInicio.Date;
    while not IBDSSimple.Eof do
    begin
      if CompareDate(FechaServicio,IBDSSimple.FieldValues['fecha']) = EqualsValue then
      begin
        EditoFechaGrilla := false;
        IBDSSimple.Next;
      end
      else
      begin
        EditoFechaGrilla := true;
        break;
      end;
    end;
    IBDSSimple.First;
  end
  else
    FechaServicio := DTPAFechaInicio.Date;
  Result := EditoFechaGrilla;
end;

procedure TFEveInseminacionArtificial.ATerminarExecute(Sender: TObject);
begin
   //FAvanceTerminar := TFAvanceTerminar.Create(nil);
   Paso := true;
   if (NOT(MSimple.hay_animales)and(ModoEve = meMasivo)) then
     MostrarMensaje(tmError, 'Faltan seleccionar animales para crear el Servicio')
   else
   begin
      ModificoFecha;
      if (ModoEve = meIndividual) then
        CargarIndividual()
      else
        CargarMasivo();
   end;
   if FileExists(ExtractFilePath(Application.ExeName)+'\temp-'+inttostr(FPrincipal.EstablecimientoActual)+'-'+self.LTitulo.Caption+'.xls') then
      DeleteFile(ExtractFilePath(Application.ExeName)+'\temp-'+inttostr(FPrincipal.EstablecimientoActual)+'-'+self.LTitulo.Caption+'.xls');

   FPrincipal.Rodeo_creado := 0;
end;

procedure TFEveInseminacionArtificial.crearServicio;
begin
    with DMSoftvet.IBSPGrupoServicio do
    begin
      if EANombre.Text <> '' then
        ParamByName('NOMBRE').AsString := EANombre.Text;
      ParamByName('FECHA_INICIO').AsDate := DTPAFechaInicio.Date;
      ParamByName('FECHA_FIN_ESTIMADA').AsDate := DTPAFechaInicio.Date;
      ParamByName('ACTIVO').AsString := 'N';
      ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
      ParamByName('TIPO').AsInteger := 3;
      ParamByName('POTRERO').AsInteger := DBLCBAPotrero.KeyValue;  //CAMBIAR LO DEL POTRERO
      ExecProc;
      FPrincipal.IBTPrincipal.CommitRetaining;
      ID_SERVICIO := ParamByName('ID_SERVICIO').asInteger;
      ID_GRUPO  :=  ParamByName('ID_GRUPO').asInteger;
    end;
end;

procedure TFEveInseminacionArtificial.AntesDeEjecutarSP;
begin
   //if (modoEve = meMasivo) and EditoFechaGrilla then
  {  with DMSoftvet.IBSPGrupoServicio do
    begin
      if EANombre.Text <> '' then
        ParamByName('NOMBRE').AsString := EANombre.Text;
      ParamByName('FECHA_INICIO').AsDate := IBDSSimple.FieldValues['FECHA'];
      ParamByName('FECHA_FIN_ESTIMADA').AsDate := IBDSSimple.FieldValues['FECHA'];
      ParamByName('ACTIVO').AsString := 'N';
      ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
      ParamByName('TIPO').AsInteger := 3;
      ParamByName('POTRERO').AsInteger := DBLCBAPotrero.KeyValue;  //CAMBIAR LO DEL POTRERO
      ExecProc;
      FPrincipal.IBTPrincipal.CommitRetaining;
      ID_SERVICIO := ParamByName('ID_SERVICIO').asInteger;
      ID_GRUPO  :=  ParamByName('ID_GRUPO').asInteger;
    end;   }
end;

procedure TFEveInseminacionArtificial.GrupoServicio;
begin
  if(ModoEve <> meMasivo)then
    begin
      IBSPCrearGrupo.ParamByName('ESTABLECIMIENTO').Value :=FPrincipal.EstablecimientoActual;
      IBSPCrearGrupo.ParamByName('NOMBREGRUPO').Value := 'Evento Inseminación Individual' + DateToStr(DTPAFechaInicio.DateTime);
      IBSPCrearGrupo.ParamByName('DESCRIPCIONGRUPO').Value := 'Evento Inseminación Individual' + DateToStr(DTPAFechaInicio.DateTime);
      IBSPCrearGrupo.ParamByName('TIPO').Value :='S';
      IBSPCrearGrupo.ParamByName('TIPO_EVENTO').Value := FtipoEvento;
      IBSPCrearGrupo.ParamByName('NRO_DTE').Value := 0;
      IBSPCrearGrupo.ParamByName('PATH_DTE').Value := '';
      IBSPCrearGrupo.ExecProc;
      crearServicio;
      IBQActualizarGrupo.Close;
      IBQActualizarGrupo.ParamByName('id').AsInteger := ID_GRUPO;
      IBQActualizarGrupo.Open;
    end
  else
    with DMSoftvet.IBSPGrupoServicio do
      Begin
        if EANombre.Text <> '' then
          ParamByName('NOMBRE').AsString := EANombre.Text;
        ParamByName('FECHA_INICIO').AsDate := FechaServicio;
        ParamByName('FECHA_FIN_ESTIMADA').AsDate := FechaServicio;
        ParamByName('ACTIVO').AsString := 'N';
        ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
        ParamByName('TIPO').AsInteger := 3;
        ParamByName('POTRERO').AsInteger := DBLCBAPotrero.KeyValue;         //CAMBIAR LO DEL POTRERO
        ExecProc;
        FPrincipal.IBTPrincipal.CommitRetaining;
        ID_SERVICIO := ParamByName('ID_SERVICIO').asInteger;
        ID_GRUPO  :=  ParamByName('ID_GRUPO').asInteger;
        LResult:= true;
        //close;
      end;
end;

procedure TFEveInseminacionArtificial.AntesDeCargar;
var
  res : TModalResult;
begin
  //ciclo para animales seleccionados en la grilla
  LResult := not(ajustar);
  res := mrYes;
  while ((Length(TorosMenorDosis)>0) and (not LResult) and (res = mrYes)) do
  begin
      res := MostrarMensajeInseminacion(tmConsulta,'Faltan dosis de semen',TorosMenorDosis);
      ActualizarGrilla();
      if res = mrYes then
        LResult := not (ajustar)
      else
        LResult := false;
  end;
  if LResult and not EditoFechaGrilla then
    GrupoServicio;
end;

procedure TFEveInseminacionArtificial.ActualizarGrilla();
var
  i : integer;
begin
  IBQToros.Close;
  IBQToros.ParamByName('idEstablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQToros.Open;

  IBQTorosGrilla.Close;
  IBQTorosGrilla.ParamByName('idEstablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQTorosGrilla.Open;

  for i := 0 to Length(TorosMenorDosis)-1 do
  begin
    IBDSSimple.First;
    while not IBDSSimple.Eof do
    begin
      if IBDSSimple.FieldByName('idtoro').AsInteger = TorosMenorDosis[i].id_toro then
      begin
        IBDSSimple.Edit;
        IBDSSimple.FieldByName('toro').AsString := TorosMenorDosis[i].nombre;
        IBDSSimple.Post;
      end;
      IBDSSimple.Next;
    end;
  end;
  SQLStringList.Clear;
  LoadSQLStringList();
  BDBGSimple.OnColEnter(nil);
end;

function TFEveInseminacionArtificial.CargarIndividual : Boolean;
var
  ejecutar : Boolean;
begin
  ejecutar := False;
  IBQSPRN.Close;
  CargarParametrosRN;
  IBQSPRN.Open;
  ClearErrores;
  GetErrors;
  if (CantidadErrores > 0) then
      MostrarMensaje(tmError, 'Se produjeron errores en la operación, compruebe los valores e intente nuevamente')
  else
       if (CantidadWarnings > 0) then
          ejecutar := (MostrarMensaje(tmConsulta, 'El animal no respeta alguno de los parametros biológicos, desea Continuar?') = mrYes)
       else
          ejecutar := True;
  if (ejecutar) then
  begin
    AntesDeCargar;
    if (LResult) then
    try
      FAvanceTerminar := TFAvanceTerminar.Create(self);
      FAvanceTerminar.Pos := 1;
      FAvanceTerminar.Max := 2;
      FAvanceTerminar.Modo := maGuardando;
      IBQSPEventoInd.Close;
      CargarParametrosSP;
      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
      IBQSPEventoInd.Open;
      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
      FAvanceTerminar.Modo := maListo;
      FAvanceTerminar.Destroy;
      FPrincipal.IBTPrincipal.CommitRetaining;
      Close;
    except on e:Exception do
      begin
        FPrincipal.IBTPrincipal.RollbackRetaining;
        FAvanceTerminar.MDetalles.Text := e.Message;
        FAvanceTerminar.Modo := maError;
      end;
    end;
  end;
end;

function TFEveInseminacionArtificial.CargarMasivo : Boolean;
var
  ejecutar : boolean;
begin

   BDBGSimple.DataSource := nil;
   ClearErrores;
   IBDSSimple.First;
   while not(IBDSSimple.Eof)do begin
      IBQSPRN.Close;
      CargarParametrosRN;
      IBQSPRN.Open;
      GetErrors;
      IBDSSimple.Next;
    end;
   BDBGSimple.DataSource := DSSimple;
   ejecutar := false;
   if (CantidadErrores > 0) then
        MostrarMensaje(tmError, 'Se produjeron errores en la operación, compruebe los valores e intente nuevamente')
   else
         if (CantidadWarnings > 0) then
            ejecutar := (MostrarMensaje(tmConsulta, 'El animal no respeta alguno de los parametros biológicos, desea Continuar?') = mrYes)
         else
            ejecutar := True;

   if (ejecutar) then
   begin
        //AntesDeCargar;
        LResult := not(ajustar);
        if (LResult) then
        begin
        //  CrearGrupo := false;
          ejecucionTerminar;
          FPrincipal.IBTPrincipal.CommitRetaining;
          close;
        end;
   end;
end;

procedure TFEveInseminacionArtificial.CargarDatosGrilla;
var
  cantDosis : integer;
begin
  inherited;
  {if NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple) then
  begin
      IBDSSimple.Insert; }
      IBDSSimple.FieldByName('ID_rp').AsString := MSimple.IBQSeleccionados.FieldValues['ID_rp'];
      IBDSSimple.FieldByName('ID_ANIMAL').AsString := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
      if (MSimple.IBQSeleccionados.FieldValues['ID_senasa'] <> null) then
      IBDSSimple.FieldByName('ID_senasa').AsString := MSimple.IBQSeleccionados.FieldValues['ID_senasa'];
      //IBDSSimple.FieldByName('V1').AsString := DMSoftvet.IBQResponsable.FieldValues['nombre'];

      RealizarCambio(DTPAFechaInicio,[IBDSSimple.FieldByName('FECHA')],[DTPAFechaInicio.GetDato]);
      //IBDSSimple.FieldByName('FECHA').Value:= DTPAFechaInicio.GetDato;
      RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('V1')],[DBLCBAResponsable.GetDato,DBLCBAResponsable.Text]);
      //IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.GetDato;
      //IBDSSimple.FieldByName('V1').Value:= DBLCBAResponsable.Text;

      if(StrToInt(EACantDosis.Text)<=0)then
        cantDosis := 1
      else
        cantDosis := StrToInt(EACantDosis.Text);
      RealizarCambio(EACantDosis,[IBDSSimple.FieldByName('I1')],[EACantDosis.Text]);

      //IBDSSimple.FieldByName('I2').AsInteger := IBQToros.FieldValues['id_semen'];
      RealizarCambio(DTPAHora,[IBDSSimple.FieldByName('H1')],[DTPAHora.DateTime]);
      RealizarCambio(DTPAHoraFin,[IBDSSimple.FieldByName('H2')],[DTPAHoraFin.DateTime]);
      //IBDSSimple.FieldByName('HORA').AsDateTime := DTPAHora.DateTime;
      RealizarCambio(MEHorasPostCelo,[IBDSSimple.FieldByName('HORA_POST_CELO')],[StrToInt(MEHorasPostCelo.Text)]);
      //IBDSSimple.FieldByName('HORA_POST_CELO').AsInteger := StrToInt(MEHorasPostCelo.Text);
      RealizarCambio(DBLCBACondicionCorporal,[IBDSSimple.FieldByName('CONDICION'),IBDSSimple.FieldByName('INCOND')],[DBLCBACondicionCorporal.Text,DBLCBACondicionCorporal.KeyValue]);
      //IBDSSimple.FieldByName('CONDICION').Value := DBLCBACondicionCorporal.Text;
      //IBDSSimple.FieldByName('INCOND').Value := DBLCBACondicionCorporal.KeyValue;
      RealizarCambio(DBLCBAToros,[IBDSSimple.FieldByName('TORO'),IBDSSimple.FieldByName('IDTORO')],[DBLCBAToros.Text,DBLCBAToros.KeyValue]);
      //IBDSSimple.FieldByName('TORO').Value := DBLCBAToros.Text;
      //IBDSSimple.FieldByName('IDTORO').Value := DBLCBAToros.KeyValue;
      RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
      //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;
  //end;

end;

procedure TFEveInseminacionArtificial.Button1Click(Sender: TObject);
var cantHembras:integer;
begin
  inherited;
  MSimple.IBQSeleccionados.Last;
  cantHembras := MSimple.IBQSeleccionados.RecordCount;
  if cantHembras > StrToInt(CantidadDosis.Text) then
    MostrarMensaje(tmAdvertencia, 'Se realizará un ajuste de stock !')
end;

procedure TFEveInseminacionArtificial.CargarParametrosMasivo;
begin
  inherited;
  if(CrearGrupo)then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;

  //cargo los parametros del SP.
  IBQSPEventoInd.ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('CANTIDAD').Value := IBDSSimple.FieldValues['I1'];
 // IBQSPEventoInd.ParamByName('OBSERVACION').Value := 'INSEMINACION ';//IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];    //cuando haya observación en la grilla sacarlo de ahi
  IBQSPEventoInd.ParamByName('SEMEN').Value := IBDSSimple.FieldValues['IDTORO'];
  IBQSPEventoInd.ParamByName('PRECIO').Value := 0;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := IBDSSimple.FieldValues['Responsable'];

  IBQSPEventoInd.ParamByName('TIPO').Value := 4;
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  //IBQSPEventoInd.ParamByName('ID_GRUPO').Value := ID_GRUPO;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('SERVICIO').Value := ID_SERVICIO;
  if ((IBDSSimple.FieldValues['INCOND'] <> null) and (IBDSSimple.FieldValues['INCOND'] <> 0)) then
    IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := IBDSSimple.FieldValues['INCOND'];

   if(IBDSSimple.FieldValues['H1']<>null) then
    IBQSPEventoInd.ParamByName('HORA').value := timeof(IBDSSimple.FieldValues['H1']);//BDBGSimple.DataSource.DataSet.FieldValues['Hora'];
  if (IBDSSimple.FieldValues['H2'] <> null) then
    IBQSPEventoInd.ParamByName('HORA_FIN').value := timeof(IBDSSimple.FieldValues['H2']);
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;

  if CambioRodeo then
    IBQSPEventoInd.ParamByName('RODEO').Value := rodeo
  else
    IBQSPEventoInd.ParamByName('RODEO').Value := null;


  if CambioPotrero then
    IBQSPEventoInd.ParamByName('POTRERO').Value := potrero
  else
    IBQSPEventoInd.ParamByName('POTRERO').Value := null;

end;

procedure TFEveInseminacionArtificial.CargarParametrosSP;
begin
  inherited;
  //para individual
   if(CrearGrupo)then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;

  IBQSPEventoInd.ParamByName('FECHA').Value := DTPAFechaInicio.DateTime;
  IBQSPEventoInd.ParamByName('CANTIDAD').Value := StrToInt(EACantDosis.Text);
//  IBQSPEventoInd.ParamByName('OBSERVACION').Value := 'INSEMINACION ';//IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value :=MAObservacion.GetDato;    //cuando haya observación en la grilla sacarlo de ahi
  IBQSPEventoInd.ParamByName('SEMEN').Value := IBQToros.FieldValues['ID_SEMEN'];
  IBQSPEventoInd.ParamByName('PRECIO').Value := 2;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.KeyValue;
  IBQSPEventoInd.ParamByName('TIPO').Value := 4;
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('SERVICIO').Value := ID_SERVICIO;
  if (DBLCBACondicionCorporal.KeyValue <> 0) then
    IBQSPEventoInd.ParamByName('CONDICION_CORPORAL').Value := DBLCBACondicionCorporal.KeyValue;

  IBQSPEventoInd.ParamByName('HORA').value := timeof(DTPAHora.DateTime);//timeof(DTPAFechaInicio.DateTime);//extraerhora(HoraNueva.DateTime);      //ExtraerHora(DTPAHora.DateTime);
  IBQSPEventoInd.ParamByName('HORA_FIN').value := timeof(DTPAHoraFin.DateTime);
  IBQSPEventoInd.ParamByName('HORA_POST_CELO').value := StrToInt(trim(MEHorasPostCelo.Text));
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := DTPAFechaInicio.DateTime;

  if CambioRodeo then
  IBQSPEventoInd.ParamByName('RODEO').Value := DBLCBARodeos.KeyValue
 else
  IBQSPEventoInd.ParamByName('RODEO').Value := null;
 if CambioPotrero then
  IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBAPotrero.KeyValue
 else
  IBQSPEventoInd.ParamByName('POTRERO').Value := null;
end;

procedure TFEveInseminacionArtificial.AntesDeTerminar;
begin
  inherited;
  //ejecuta antes de la funcionalidad de Terminar General.
  //ejecuta el sp de movimiento de semen para ajuste de stock de semen.
  with IBSPAjusteSemen do
      Begin
          ParamByName('FECHA').Value := IBDSSimple.FieldValues['FECHA'];
          ParamByName('NUEVACANTIDAD').Value := cantDosisTotal - StrToInt(CantidadDosis.Text);
          ParamByName('SEMEN').Value := IBQToros.FieldValues['ID_SEMEN'];
          ParamByName('PRECIO').Value := 1;
          ParamByName('TIPO').Value := 3;
          ParamByName('centro_inseminacion').Value := null;
          ParamByName('observacion').Value := null;
          ExecProc;
          LResult:= true;
          close;
       end;
end;

procedure TFEveInseminacionArtificial.DespuesDeTerminar;
begin
  inherited;
  //ejecuta después de la funcionalidad de Terminar General.
  CargarParametrosRegCelo;

end;

function TFEveInseminacionArtificial.ajustar: boolean;
var
  Toros : Array of Array [0..3] of Integer;
  Nombres, Externos : Array of String;
  indice, anterior, i_faltos : integer;
  (*****************************************)
  function Existe(id : integer) : boolean;
  var
    i : integer;
  begin
    Result := false;
    for i := 0 to Length(Toros)-1 do
      if (Toros[i,0] = id) then
      begin
        Result := true;
        break;
      end;
  end;
  (*****************************************)
  function GetIndice(id : integer) : integer;
  var
    i : integer;
  begin
    Result := -1;
    for i := 0 to Length(Toros)-1 do
      if (Toros[i,0] = id) then
      begin
        Result := i;
        break;
      end;
  end;
  (*****************************************)
begin
  cantDosisTotal := 0;
  if (ModoEve = meIndividual) then
  begin
    cantDosisTotal := StrToInt(EACantDosis.Text);
    if cantDosisTotal >  StrToInt(CantidadDosis.Text) then
       ajustar := True
    else
       ajustar := False;
  end
  else
  begin
    indice := 1;
    IBDSSimple.First;
    anterior := IBDSSimple.fieldByName('idtoro').AsInteger;
    SetLength(Toros,1);
    SetLength(Nombres,1);
    SetLength(Externos,1);
    Toros[0,0] := anterior;
    IBQCantSemen.Close;
    IBQCantSemen.ParamByName('id').AsInteger := anterior;
    IBQCantSemen.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQCantSemen.Open;
    Toros[0,1] := IBQCantSemen.fieldByName('cantidad').AsInteger;
    if IBQCantSemen.FieldByName('animal').Value = null then
      Externos[0] := 'S'
    else
      Externos[0] := 'N';
    Nombres[0] := IBDSSimple.FieldValues['toro'];

    IBDSSimple.Next;
    while (not IBDSSimple.Eof) do
    begin
      if ((anterior <> IBDSSimple.fieldByName('idtoro').AsInteger) and not(Existe(IBDSSimple.fieldByName('idtoro').AsInteger))) then
      begin
        Inc(indice);
        SetLength(Toros,indice);
        SetLength(Nombres,indice);
        SetLength(Externos,indice);
        Toros[indice-1,0] := IBDSSimple.fieldByName('idtoro').AsInteger;
        Nombres[indice-1] := IBDSSimple.FieldValues['toro'];
        anterior := Toros[indice-1,0];
        IBQCantSemen.Close;
        IBQCantSemen.ParamByName('id').AsInteger := anterior;
        IBQCantSemen.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQCantSemen.Open;
        if IBQCantSemen.FieldByName('animal').Value = null then
          Externos[indice-1] := 'S'
        else
          Externos[indice-1] := 'N';
        Toros[indice-1,1] := IBQCantSemen.fieldByName('cantidad').AsInteger;
      end;
      IBDSSimple.Next;
    end;
    IBDSSimple.First;
    while not(IBDSSimple.Eof) do
    begin
      indice := GetIndice(IBDSSimple.fieldByName('idtoro').AsInteger);
      Toros[indice,2] := Toros[indice,2]+IBDSSimple.fieldByName('I1').AsInteger;
      IBDSSimple.Next;
    end;
    ajustar := False;
    i_faltos := 1;
    for indice := 0 to Length(Toros)-1 do
      if (Toros[indice,1]<Toros[indice,2]) then
      begin
        ajustar := True;
        SetLength(TorosMenorDosis,i_faltos);
        TorosMenorDosis[i_faltos-1].id_toro := Toros[indice,0];
        TorosMenorDosis[i_faltos-1].dosis_disponibles := Toros[indice,1];
        TorosMenorDosis[i_faltos-1].dosis_requeridas := Toros[indice,2];
        TorosMenorDosis[i_faltos-1].nombre := Nombres[indice];
        TorosMenorDosis[i_faltos-1].externo := Externos[indice];
        Inc(i_faltos);
      end;
  end;
end;

procedure TFEveInseminacionArtificial.CargarParametrosRN;
var
  animal_id, semen_id : integer;
  fecha: TDateTime;
  toro : string;
begin
  inherited;
  IBQSPRN.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  if(self.ModoEve = meIndividual)then
    begin
      IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
      IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFechaInicio.DateTime;
      IBQSPRN.ParamByName('semen').AsInteger := DBLCBAToros.KeyValue;
      IBQSPRN.ParamByName('nombre').AsString:= DBLCBAToros.Text;
    end
  else
    begin
      animal_id := IBDSSimple.fieldbyname('id_animal').AsInteger;
      semen_id := IBDSSimple.fieldbyname('idtoro').AsInteger;
      fecha := IBDSSimple.fieldbyname('fecha').AsDateTime;
      toro := IBDSSimple.fieldbyname('toro').AsString;

      IBQSPRN.ParamByName('animal').AsInteger := animal_id;
      IBQSPRN.ParamByName('fecha').AsDateTime := fecha;
      IBQSPRN.ParamByName('semen').AsInteger := semen_id;
      IBQSPRN.ParamByName('nombre').AsString := toro;

      LogMensaje('(InsemArtif.) Procesando :'+IntToStr(animal_id) + ' ' +
                  IntToStr(semen_id) + DateToStr(fecha)+toro);
    end;
end;

procedure TFEveInseminacionArtificial.RegistrarCelo;
var aux: variant;
    auxFecha : TDateTime ;
begin
    if (trim(MEHorasPostCelo.Text) <> '') then
        begin
          CBRegistrarCelo.Caption := Traducir('Se registrará Celo.');
          DTPAFechaInicio.Time:=DTPAHora.Time;      //esto no estaba antes
          auxFecha := RestarHoras( DTPAFechaInicio.DateTime,StrToint(trim(MEHorasPostCelo.Text)));
          aux := DateTimeToStr(auxFecha) + ' Horas.';
          LmensajeEventoCelo.Caption := Traducir('Registrará celo el: ') + aux;
        end
       else
        begin
          MostrarMensaje(tmError, 'Debe ingresar la cantidad de Horas post Celo');
          MEHorasPostCelo.SetFocus;
          CBRegistrarCelo.Checked := false;
        end;

end;

procedure TFEveInseminacionArtificial.CBRegistrarCeloClick(
  Sender: TObject);
begin
  inherited;
  if(CBRegistrarCelo.Checked) then
    RegistrarCelo
  else
  begin
    LmensajeEventoCelo.Caption := '';
    CBRegistrarCelo.Caption := Traducir('Registrar Celo.');
  end;
end;

procedure TFEveInseminacionArtificial.CargarParametrosRegCelo;
var auxFecha: tDateTime;
begin
  with IBSPRegistrarCelo do
      Begin
          ParamByName('FECHA').Value := DTPAFechaInicio.DateTime;
          ParamByName('ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
          ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
          ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
          ParamByName('RESPONSABLE').Value := DBLCBAResponsable.KeyValue;
          ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
          ParamByName('LOG_FECHA_MODIFICADO').Value := now;
          auxFecha := RestarHoras( DTPAFechaInicio.DateTime,StrToint(trim(MEHorasPostCelo.Text)));
          ParamByName('HORA').Value := auxFecha;//TimeOf(DTPAHora.DateTime);
          ParamByName('ID_GRUPO').Value := ID_GRUPO;
          ExecProc;
          FPrincipal.IBTPrincipal.CommitRetaining;
          LResult:= true;
          close;
       end;
end;

procedure TFEveInseminacionArtificial.PCBasicoChange(Sender: TObject);
var indice: integer;
begin
  inherited;
  if MSimple.IBQSeleccionados.RecordCount >= 2 then
  begin
    GBCelo.Visible := false;
    LHoraFin.Visible := true;
    DTPAHoraFin.Visible := true;
    LHoraIni.Caption := Traducir('Hora Inicio:');
  end
  else
  begin
    LHoraFin.Visible := false;
    DTPAHoraFin.Visible := false;
    LHoraIni.Caption := Traducir('Hora:');
    GBCelo.Visible := true;
  end;

  if PCBasico.ActivePage = TSGrilla then
  begin
    BDBGSimple.Columns[0].Width := 90;
    BDBGSimple.Columns[1].Width := 90;
    BDBGSimple.Columns[2].Width := 90;
    BDBGSimple.Columns[3].Width := 120;
    BDBGSimple.Columns[4].Width := 120;
    BDBGSimple.Columns[5].Width := 350;
    BDBGSimple.Columns[6].Width := 150;
    BDBGSimple.Columns[7].Width := 190;
    BDBGSimple.Columns[8].Width := 190;
    BDBGSimple.Columns[9].Width := 250;
 end;
end;

function TFEveInseminacionArtificial.RestarHoras(Fecha: TDateTime;
  CantHoras: integer): TDateTime;
var fechaAux:TDateTime;
    horas :integer;
begin
     horas := CantHoras * -1 * 60;
     //fechaAux := IncMinute(now, horas);   //antes estaba así
     fechaAux := IncMinute(Fecha, horas);
     RestarHoras := fechaAux;
end;

function TFEveInseminacionArtificial.ExtraerHora(
  ValorDelControl: TDateTime): TDateTime;
begin
     ValorDelControl := EncodeDate(1899, 12, 30);
      ExtraerHora := ValorDelControl;
end;

procedure TFEveInseminacionArtificial.FormCreate(Sender: TObject);
begin
  inherited;


  {Obtengo la cantidad minima de meses que debe tener una hembra para entrar a servicio sin mostrar una advertencia}
  IBQEdadAnimal.Close;
  IBQEdadAnimal.ParamByName('nombreparametro').AsString := 'MSEDADSER1';
  IBQEdadAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEdadAnimal.Open;
  FEdadMinima := IBQEdadAnimalVALOR.AsInteger*30;
  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, id_ie, nombre, apodo from vis_inseminacion_artificial where (CURRENT_DATE - FECHA_NACIMIENTO) >'+ IntToStr(FEdadMinima);
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  IBQToros.Close;
  IBQToros.ParamByName('idEstablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQToros.Open;
  IBQTorosGrilla.Close;
  IBQTorosGrilla.ParamByName('idEstablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQTorosGrilla.Open;
  CambioRodeo := false;
  CambioPotrero := false;
//  FCrearGrupo := false; esto es para crear grupo en los eventos en este evento estaba en false
  FCrearGrupo := true;
  HabilitarMenu(True);
  DTPAFechaInicio.Date := now;
  DTPAHora.Time := now;
  DTPAHoraFin.Time := now;
  DBLCBARodeos.KeyValue := 0;
  DBLCBAPotrero.KeyValue := 0;
  CargaMenu := False;

  DBLCBAToros.EsRequerido:=true;
  if (owner is TFMovCargarDatos) then
    DBLCBAToros.KeyValue := 1;
end;

procedure TFEveInseminacionArtificial.EACantDosisKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not (key in (['1'..'9'])) and (key <> #8)) then key:=#0;
end;

procedure TFEveInseminacionArtificial.EACantDosisExit(Sender: TObject);
begin
  inherited;
  if (EACantDosis.Text = '') then
    EACantDosis.Text := '1';
  GetEvent(Sender);
end;

procedure TFEveInseminacionArtificial.MEHorasPostCeloExit(Sender: TObject);
begin
  inherited;
  if (MEHorasPostCelo.Text = '') then
    MEHorasPostCelo.Text := '0';
  GetEvent(Sender);
end;

procedure TFEveInseminacionArtificial.controlCondicionCorporal;
begin
  DBLCBACondicionCorporal.Enabled := CBCondicionCorporal.Checked;
  if (not DBLCBACondicionCorporal.Enabled) then
    DBLCBACondicionCorporal.KeyValue := null;
end;

procedure TFEveInseminacionArtificial.CBCondicionCorporalClick(
  Sender: TObject);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveInseminacionArtificial.CBCondicionCorporalKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  controlCondicionCorporal;
end;

procedure TFEveInseminacionArtificial.LoadSQLStringList;
begin
  SQLStringList.AddObject('V1',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('CONDICION',TObject(DMSoftvet.DSCondicionCorporal));
  SQLStringList.AddObject('TORO',TObject(DSTorosParaGrilla));
end;

procedure TFEveInseminacionArtificial.IBDSSimpleCONDICIONSetText(
  Sender: TField; const Text: String);
var PickPos :integer;
    condicion : String;
    val_cond : double;
begin
  inherited;
  if ((IBDSSimple.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text)))then
  begin
    IBQValidaciones.Close;
    IBQValidaciones.SQL.Clear;
    if(Sender.FieldName = 'CONDICION')then
           begin
             IBQTipoCond.Close;
             IBQTipoCond.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
             IBQTipoCond.Open;
             if (IBQTipoCond.FieldByName('valor').AsInteger = 10) then
              condicion := 'VALOR_ESCALA_10'
             else
              condicion := 'VALOR_ESCALA_5';
             IBQValidaciones.Close;
             IBQValidaciones.SQL.Clear;
             IBQValidaciones.SQL.Add('Select ID_CONDICION_CORPORAL, '+condicion+'  as escala from COD_CONDICIONES_CORPORALES where ('+condicion+' = :valor) ');
             if TryStrToFloat(Text,val_cond) then
                IBQValidaciones.ParamByName('valor').AsFloat := StrToFloat(UpperCase(Text))
             else
                IBQValidaciones.ParamByName('valor').AsFloat := -1;
             IBQValidaciones.Open;
             if not(IBQValidaciones.IsEmpty) then
             BEGIN
               Sender.AsVariant := IBQValidaciones.FieldByName('escala').AsString ;
               PickPos := BDBGSimple.ColumnByField('CONDICION').PickList.IndexOf(BDBGSimple.ColumnByField('CONDICION').Field.AsString);
               IBDSSimple.FieldByName('INCOND').Value :=  TClassType(BDBGSimple.ColumnByField('CONDICION').PickList.Objects[PickPos]).getValue;
             END;
           end;
    if(Sender.FieldName = 'TORO')then
           begin
             {IBQValidaciones.Close;
             IBQValidaciones.SQL.Clear;
             IBQValidaciones.SQL.Add('select S.id_semen, A.Apodo, A.id_rp from tab_semen S '+
                                     'JOIN Tab_animales A ON S.Animal = A.ID_ANIMAL '+
                                     'where S.establecimiento = :idEstablecimiento and (A.Apodo like :valor_apodo or A.id_rp like :valor_rp)'+
                                     'UNION '+
                                     'select S.id_semen, AE.Apodo, AE.id_rp from tab_semen S '+
                                     'JOIN Tab_animales_externos AE ON S.Animal_externo = AE.ID_ANIMAL_externo '+
                                     'where S.establecimiento = :idEstablecimiento and (AE.Apodo like :valor_apodo or AE.id_rp like :valor_rp)');
             IBQValidaciones.ParamByName('valor_apodo').Value := '%'+Text;
             IBQValidaciones.ParamByName('valor_rp').Value := '%'+Text;
             IBQValidaciones.ParamByName('idEstablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
             IBQValidaciones.Open;}
             IBQValidacionGrilla.Close;
             IBQValidacionGrilla.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
             IBQValidacionGrilla.Open;
             if (IBQValidacionGrilla.Locate('NOM_COMPLETO',Text,[loPartialKey,loCaseInsensitive])) then
             begin
               Sender.AsVariant := IBQValidacionGrilla.FieldValues['NOM_COMPLETO']; //IBQValidaciones.FieldByName('Nombre').AsString ;
               PickPos := BDBGSimple.ColumnByField('TORO').PickList.IndexOf(BDBGSimple.ColumnByField('TORO').Field.AsString);
               IBDSSimple.FieldByName('IDTORO').Value :=  TClassType(BDBGSimple.ColumnByField('TORO').PickList.Objects[PickPos]).getValue;
             end;
           end;
    if (Sender.FieldName = 'V1') then
      begin      // RESPONSABLE
          IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
          IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          IBQValidaciones.Active := true;
          if not(IBQValidaciones.IsEmpty) then
          BEGIN
              Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
              PickPos := BDBGSimple.ColumnByField('V1').PickList.IndexOf(BDBGSimple.ColumnByField('V1').Field.AsString);
              IBDSSimple.FieldByName('RESPONSABLE').Value :=  TClassType(BDBGSimple.ColumnByField('V1').PickList.Objects[PickPos]).getValue;
          END;
      end;
  end;
end;

procedure TFEveInseminacionArtificial.IBDSSimpleI1SetText(Sender: TField;
  const Text: String);
var
  cant : integer;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    if (TryStrToInt(Text,cant)) then
      begin
        if (length(Text) = 1) then
        begin
          try
            Sender.AsInteger := cant;
          except
            MostrarMensaje(tmError, 'El Valor ingresados no corresponde a una cantidad valida');
          end;
        end
        else
          MostrarMensaje(tmError, 'El Valor ingresados no corresponde a una cantidad valida');
      end
    else
      MostrarMensaje(tmError, 'El Valor ingresados no corresponde a una cantidad valida');
  end;
end;

procedure TFEveInseminacionArtificial.IBDSSimpleHORASetText(Sender: TField;
  const Text: String);
var
  Hora : TDateTime;
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    if (TryStrToTime(Text,Hora)) then
      begin
        try
          Sender.AsDateTime := Hora;
        except
          MostrarMensaje(tmError, 'El Valor ingresados no corresponde a una hora valida');
        end;
      end
    else
      MostrarMensaje(tmError, 'El Valor ingresados no corresponde a una hora valida');
  end;
end;

procedure TFEveInseminacionArtificial.DTPAFechaInicioChange(
  Sender: TObject);
var
  fecha : TDateTimePickerAuto;
  Resp : Boolean;
begin
  inherited;
  Resp := true;
  if CargaMenu then
    Resp := MostrarMensaje(tmInformacion,'Se cargaron eventos desde el menu. Si modifica la fecha, la fecha de los eventos aplicados no se modificara. Desea Continuar?') = mrYes;

  if not CargaMenu or Resp then
  begin
    fecha := Sender as TDateTimePickerAuto;
    if(fecha.Date > now) then
      fecha.Date:=now;
    MEHorasPostCeloChange(nil);
  end;
 // EANombre.Text :=PTitulo.Caption+ ' ' + DateToStr(fecha.Date);
 desdeExcel := false;
end;

procedure TFEveInseminacionArtificial.MEHorasPostCeloKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (not (key in (['0'..'9'])) and (key <> #8)) then
    key:=#0
end;

procedure TFEveInseminacionArtificial.MEHorasPostCeloChange(
  Sender: TObject);
begin
  inherited;
  if(CBRegistrarCelo.Checked) then
    RegistrarCelo;
end;

procedure TFEveInseminacionArtificial.LResponsableMouseEnter(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveInseminacionArtificial.LResponsableMouseLeave(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveInseminacionArtificial.LPotreroMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPotrero.Font.Color:= $00606C02;
      LPotrero.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveInseminacionArtificial.LPotreroMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LPotrero.Font.Color:= clWindowText;
      LPotrero.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveInseminacionArtificial.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveInseminacionArtificial.LPotreroClick(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      //nroID:=0;
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQPotrero.Close;
      DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQPotrero.Open;
      cambiarCB(DBLCBAPotrero,nroID);    //CAMBIAR LO DEL POTRERO
    end;
end;

procedure TFEveInseminacionArtificial.Label1MouseEnter(Sender: TObject);
begin
  inherited;
  Label1.Font.Color:= $00606C02;
  Label1.Font.Style:= [fsBold,fsUnderline];
end;

procedure TFEveInseminacionArtificial.Label1MouseLeave(Sender: TObject);
begin
  inherited;
  Label1.Font.Color:= clWindowText;
  Label1.Font.Style:= [fsUnderline];
end;

procedure TFEveInseminacionArtificial.CompraClick(Sender: TObject);
var
  abm : TFMovimientosdeSemenCompra;
begin
  inherited;
  abm := TFMovimientosdeSemenCompra.Create(self);
  abm.ShowModal;
  abm.Destroy;
  IBQToros.Close;
  IBQToros.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQToros.Open;
  IBQTorosGrilla.Close;
  IBQTorosGrilla.ParamByName('idEstablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQTorosGrilla.Open;
  DMSoftvet.IBQAfterOpen(IBQToros);
  DMSoftvet.IBQAfterOpen(IBQTorosGrilla);
end;

procedure TFEveInseminacionArtificial.ExtraccionClick(Sender: TObject);
var
  abm : TFMovimientosdeSemenExtraccion;
begin
  inherited;
  abm := TFMovimientosdeSemenExtraccion.Create(self);
  abm.ShowModal;
  abm.Destroy;
  IBQToros.Close;
  IBQToros.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQToros.Open;
  IBQTorosGrilla.Close;
  IBQTorosGrilla.ParamByName('idEstablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQTorosGrilla.Open;
  DMSoftvet.IBQAfterOpen(IBQToros);
  DMSoftvet.IBQAfterOpen(IBQTorosGrilla);
end;

procedure TFEveInseminacionArtificial.DBLCBATorosCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBAToros.KeyValue <> null then
  begin
    Extraccion.Enabled := IBQToros.FieldByName('tipo').AsString = 'I';
    Compra.Enabled := IBQToros.FieldByName('tipo').AsString = 'E';
  end;
end;

procedure TFEveInseminacionArtificial.Label1Click(Sender: TObject);
var
  X, Y :Integer;
begin
  inherited;
  PMSemen.Popup(Label1.Left+Left+63,Top+PTitulo.Height+PCBasico.Top+Label1.Top+Label1.Height+50);
end;

procedure TFEveInseminacionArtificial.cargarDatos(i:integer);
var str1,str2:string;
begin
  inherited;
      //IBQTorosCalcFields(IBQToros.DataSource.DataSet);
      EANombre.Text := getDato('nombre del servicio',anim[0]);
      if (MSimple.IBQSeleccionados.FieldValues['ID_senasa'] <> null) then
        IBDSSimple.FieldByName('ID_senasa').AsString := MSimple.IBQSeleccionados.FieldValues['ID_senasa'];
      IBDSSimple.FieldByName('V1').Value:= getDato('responsable',anim[i]);

      IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('NOMBRE',UpperCase(IBDSSimple.FieldByName('V1').Value),'ID_EMPLEADO');
      //if (IBDSSimple.FIelbByName)

      IBDSSimple.FieldByName('I1').Value:=getDato('cant. dosis',anim[i]);

      if (getDato('hora inicio',anim[i])<>'') then
        IBDSSimple.FieldByName('H1').AsDateTime:=strtodatetime(getDato('hora inicio',anim[i]))
      else
        IBDSSimple.FieldByName('H1').AsDateTime:=DTPAHora.Time;
      if (getDato('hora fin', anim[i])<>'') then
        IBDSSimple.FieldByName('H2').AsDateTime:=strtodatetime(getDato('hora fin',anim[i]))
      else
        IBDSSimple.FieldByName('H2').AsDateTime:=DTPAHoraFin.Time;


      IBDSSimple.FieldByName('CONDICION').Value := getDato('cond. corp',anim[i]);
      IBDSSimple.FieldByName('INCOND').Value := DBLCBACondicionCorporal.ListSource.DataSet.Lookup('escala',IBDSSimple.FieldByName('CONDICION').Value,'ID_CONDICION_CORPORAL');

      EANombre.Text := 'INSEMINACIÓN ARTIFICIAL '+getDato('fecha',anim[i]);

      IBDSSimple.FieldByName('TORO').Value:=getDato('toro',anim[i]);
      IBDSSimple.FieldByName('IDTORO').Value:=null;
      DBLCBAToros.ListSource.DataSet.Close;
      DBLCBAToros.ListSource.DataSet.Open;
      DBLCBAToros.ListSource.DataSet.First;
      while not DBLCBAToros.ListSource.DataSet.Eof do
      begin
        str1:=sinAcento(ansilowercase(getDato('toro',anim[i])));
        str2:=sinAcento(ansilowercase(DBLCBAToros.ListSource.DataSet.FieldByName('nom_completo').AsString));
        if ansipos(str1,str2)<>0 then
        begin
          EBuscarAnimal.Text := dblcbatoros.ListSource.DataSet.FieldValues['nom_completo'];
          {ControlEventoOnExit(EBuscarAnimal);
          GetEvent(DBLCBAToros);
          JvTerminar.Visible := true;
          LBBTerminar.Visible := true;}
          RealizarCambio(DBLCBAToros,[IBDSSimple.FieldByName('TORO'),IBDSSimple.FieldByName('IDTORO')],[dblcbatoros.ListSource.DataSet.FieldValues['nom_completo'],dblcbatoros.ListSource.DataSet.FieldValues['id_semen']]);
          break;
        end;
        DBLCBAToros.ListSource.DataSet.Next;
      end;
end;

procedure TFEveInseminacionArtificial.BBXlsImportClick(Sender: TObject);
begin
  inherited;
  dblcbatoros.EsRequerido:=false;
  pcbasicochange(self);
  desdeExcel := true;
  if (FPrincipal.Rodeo_creado = 0) then
      rodeo := DBLCBARodeos.KeyValue
  else
  begin
      rodeo := FPrincipal.Rodeo_creado;
      CambioRodeo := true;
      FPrincipal.Rodeo_creado := 0;
  end;
  if(IBDSSimple.FieldValues['fecha'] <> null)then
     DTPAFechaInicio.Date := IBDSSimple.FieldValues['fecha'];
  //pcbasico.ActivePage := TSManga;
end;      

procedure TFEveInseminacionArtificial.continuarGrilla;
begin
  inherited;
  dblcbatoros.EsRequerido:=false;
  pcbasicochange(self);
end;

procedure TFEveInseminacionArtificial.LSincronizacionClick(
  Sender: TObject);
var
  F : TFEveSincronizacionCelo;
begin
  inherited;
  try
    F := TFEveSincronizacionCelo.Create(nil);
    F.ConManga := modoEve = meMasivo;
    F.ModoEve := ModoEve;
    F.IDAnimal := IDAnimal;
    BorrarAux();
    F.DTPAFecha.Date := DTPAFechaInicio.Date;
    F.ShowModal;
    CargaMenu := true;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveInseminacionArtificial.BorrarAux;
begin
  IBQDelEventosAux.Close;
  IBQDelEventosAux.Open;
end;

procedure TFEveInseminacionArtificial.LTratamientoClick(Sender: TObject);
var
  F : TFEveTratamiento;
begin
  inherited;
  try
    F := TFEveTratamiento.Create(nil);
    F.ConManga := modoEve = meMasivo;
    F.ModoEve := ModoEve;
    F.DesdeFlushing := true;
    F.CBDiagnosticar.Visible := false;
    BorrarAux();
    F.DBLCBATipo.KeyValue := 6; //Solo tratamientos Hormonales
    F.DBLCBATipoCloseUp(nil); //Para que active las descripciones del tratamiento
    F.DBLCBATipo.Enabled := false;
    F.IDAnimal := IDAnimal;
    F.ShowModal;
    CargaMenu := true;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveInseminacionArtificial.LDeteccionClick(Sender: TObject);
var
  F : TFEveDeteccionCelo;
begin
  inherited;
  try
    F := TFEveDeteccionCelo.Create(nil);
    F.ConManga := modoEve = meMasivo;
    F.ModoEve := ModoEve;
    BorrarAux();
    F.DTPAFecha.Date := DTPAFechaInicio.Date;
    F.IDAnimal := IDAnimal;
    F.ShowModal;
    CargaMenu := true;
    F.Destroy;
  except
    MostrarMensaje(tmError,'No se pudo cargar el evento');
  end;
end;

procedure TFEveInseminacionArtificial.LabelMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      (Sender as TLabel).Font.Color:= $00606C02;
      (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveInseminacionArtificial.LabelMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      (Sender as TLabel).Font.Color:= clWindowText;
      (Sender as TLabel).Font.Style:= [fsUnderline];
    end;
end;

procedure TFEveInseminacionArtificial.HabilitarMenu(Habilitado : Boolean);
begin
  LSincronizacion.Enabled := Habilitado;
  LTratamiento.Enabled := Habilitado;
  LDeteccion.Enabled := Habilitado; 
end;

procedure TFEveInseminacionArtificial.IBQTorosCalcFields(
  DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('apodo').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['apodo'];
  nombre := nombre+' [ '+IntToStr(DataSet.FieldByName('cantidad').AsInteger)+' dosis ] ';
  IBQTorosNOM_COMPLETO.Value := nombre;
end;

procedure TFEveInseminacionArtificial.IBQTorosGrillaCalcFields(
  DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('apodo').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['apodo'];
  nombre := nombre+' [ '+IntToStr(DataSet.FieldByName('cantidad').AsInteger)+' dosis ] ';
  IBQTorosGrillaNOM_COMPLETO.Value := nombre;
end;

procedure TFEveInseminacionArtificial.IBQValidacionGrillaCalcFields(
  DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('apodo').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['apodo'];
  nombre := nombre+' [ '+IntToStr(DataSet.FieldByName('cantidad').AsInteger)+' dosis ] ';
  IBQValidacionGrillaNOM_COMPLETO.Value := nombre;
end;

procedure TFEveInseminacionArtificial.IBuscarAnimalClick(Sender: TObject);
var sql1, sql2, sql3 : string;
begin
  inherited;

  if (vSelecciono) then
  begin
    EBuscarAnimal.Text := '';
    vSelecciono := false;
  end;

  sql1 := 'SELECT * FROM REP_ANIMALES_IATF(:ESTA)';

  if (EBuscarAnimal.Text <> '') then
  begin
    sql2 := ' where ((ID_RP LIKE ''%' +EBuscarAnimal.Text+ '%'') OR (NOMBRE LIKE ''%' +EBuscarAnimal.Text+ '%'') OR (APODO LIKE ''%' +EBuscarAnimal.Text+ '%'') OR (ID_HBA LIKE ''%' +EBuscarAnimal.Text+ '%''))';
    sql3 := sql1 + sql2;
    BuscarSemental(sql3);
  end
  else
    BuscarSemental(sql1);
end;

procedure TFEveInseminacionArtificial.EBuscarAnimalKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
       IBuscarAnimalClick(sender);
       key := #0;
  end;
end;

procedure TFEveInseminacionArtificial.BuscarSemental(query : string);
var F : TFSelAnimalesEmbriones;
    cadena : string;
    id_semen, aux : integer;
begin

     cadena := '';

     IBQTorosAux.Close;
     IBQTorosAux.SQL.Clear;
     IBQTorosAux.SQL.Add(query);
     IBQTorosAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
     IBQTorosAux.Open;
     IBQTorosAux.Last;
     IBQTorosAux.First;

     if (IBQTorosAux.RecordCount = 1) then
     begin
          if (IBQTorosAux.FieldValues['animal'] <> null) then
          begin
            DBLCBAToros.KeyValue := IBQToros.Lookup('animal',IBQTorosAux.FieldValues['animal'],'id_semen');
            vSelecciono := true;
            EBuscarAnimal.Text := DBLCBAToros.Text;
            EBuscarAnimal.SetFocus;
          end
          else
          begin
              if (IBQTorosAux.FieldValues['animal_externo'] <> null) then
              begin
                DBLCBAToros.KeyValue := IBQToros.Lookup('animal_externo',IBQTorosAux.FieldValues['animal_externo'],'id_semen');
                vSelecciono := true;
                EBuscarAnimal.Text := DBLCBAToros.Text;
                EBuscarAnimal.SetFocus;
              end;
          end;
     end
     else
     begin
          F := TFSelAnimalesEmbriones.Create(self);
          F.SQLconsulta := query;
          F.sexo := 1;

          F.IAgregarAnimal.Visible := false;
          F.LAgregarAnimal.Visible := false;
          F.BDBGAnimales.ColumnByField('CANTIDAD').Visible := true;
          F.AjustarColumnas;
          F.ShowModal;

          DBLCBAToros.KeyValue := F.id_animal;

          vSelecciono := true;

          F.Destroy;
          EBuscarAnimal.Text := DBLCBAToros.Text;
          EBuscarAnimal.SetFocus;
     end;
end;

procedure TFEveInseminacionArtificial.ImpDisVesta(Sender: TObject);
begin
  inherited;
  dblcbatoros.EsRequerido:=false;
  pcbasicochange(self);
  desdeExcel := true;
end;

procedure TFEveInseminacionArtificial.Label7Click(Sender: TObject);
var
  abm : TFABMRodeos;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMRodeos.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQRodeo.Close;
      DMSoftvet.IBQRodeo.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQRodeo.Open;

      if nroID>-1 then
        begin
        DBLCBARodeos.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBARodeos);
        end;      
    end;
end;

procedure TFEveInseminacionArtificial.Label6Click(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      DMSoftvet.IBQPotrero.Close;
      DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQPotrero.Open;
      if nroID>-1 then
        begin
        DBLCBAPotrero.KeyValue:=nroID;
        nroID:=-1;
        GetEvent(DBLCBAPotrero);
        end;
    end;

end;

procedure TFEveInseminacionArtificial.CBPotreroClick(Sender: TObject);
begin
  inherited;
  CambioPotrero := CBPotrero.Checked;
  if CambioPotrero then
  begin
    LPotrero.Enabled := true;
    DBLCBAPotrero.Enabled := true;
  //  BDBGSimple.Columns[4].Visible := true;
  end
  else
  begin
    LPotrero.Enabled := false;
    DBLCBAPotrero.Enabled := false;
 //   BDBGSimple.Columns[4].Visible := false;
  end;
end;


procedure TFEveInseminacionArtificial.CBRodeoClick(Sender: TObject);
begin
  inherited;
  CambioRodeo := CBRodeo.Checked;
  if CambioRodeo then
  begin
    Label7.Enabled := true;
    DBLCBARodeos.Enabled := true;
 //   BDBGSimple.Columns[5].Visible := true;
  end
  else
  begin
    Label7.Enabled := false;
    DBLCBARodeos.Enabled := false;
  //  BDBGSimple.Columns[5].Visible := false;
  end;
end;


procedure TFEveInseminacionArtificial.ASiguienteExecute(Sender: TObject);
begin
  inherited;
  potrero := DBLCBAPotrero.KeyValue;
  if (FPrincipal.Rodeo_creado = 0) then
      rodeo := DBLCBARodeos.KeyValue
  else
  begin
      rodeo := FPrincipal.Rodeo_creado;
      FPrincipal.Rodeo_creado := 0;
  end;
end;

end.
