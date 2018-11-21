unit USincroBaseDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, AbBase, AbBrowse, AbZBrows, AbUnzper,                                           
  IBDatabase, ShlObj, IBExtract, IBDatabaseInfo, IBTable, PngImage, jpeg,
  ImgList, PngImageList, JvSpecialProgress, JvExExtCtrls, JvImage;

type

  TTipoConsulta = (tcUpdate,tcInsert,tcSelect);
  TTipoCargaEvento = (tceSimple, tceComplejo);

  TDatosEvento = record
    Tabla : String;
    Proc : String;
    Tipo : TTipoCargaEvento;
  end;
  TTabla = record
    Tabla : String;
    Generador : String;
    Clave : String;
    Campos : TStringList;
  end;
  TProcedures = record
    Nombre : String;
    ParametrosIN : TStringList;
    ParametrosOUT : TStringList;
  end;
  TClavesExtranjeras = record
    Campo : String;
    Valor : Variant;
  end;


  TArrTablas = Array of TTabla;
  TArrProcedures = Array of TProcedures;
  TArrClavesExtranjeras = Array of TClavesExtranjeras;

  TFSincroBaseDatos = class(TFUniversal)
    Button1: TButton;
    ODBaseDestino: TOpenDialog;
    unzipper: TAbUnZipper;
    IBDBaseNueva: TIBDatabase;
    IBTBaseNueva: TIBTransaction;
    IBQCodigosOriginal: TIBQuery;
    IBQCodigosNuevos: TIBQuery;
    IBQEstabNuevos: TIBQuery;
    IBQEstabViejo: TIBQuery;
    IBSPBase: TIBStoredProc;
    IBQSPBase: TIBQuery;
    IBQConsultaBaseNueva: TIBQuery;
    IBQConsultaBaseVieja: TIBQuery;
    IBQGeneradores: TIBQuery;
    IBQConsulta: TIBQuery;
    IBQAnimalesViejo: TIBQuery;
    IBQAnimalesNuevo: TIBQuery;
    IBQEventosNuevos: TIBQuery;
    IBQEventosViejos: TIBQuery;
    IBQCodigoNuevo: TIBQuery;
    IBQCodigoAux: TIBQuery;
    IBQCodigoAux1: TIBQuery;
    IBQConsultaBaseNuevaAux: TIBQuery;
    IBTTabla: TIBTable;
    IBQTablaClaveExtranjera: TIBQuery;
    IBQTablaClaveExtranjeraTabla: TIBQuery;
    IBTTablaAux: TIBTable;
    IBQGetIndices: TIBQuery;
    IBQInsertEveGeneral: TIBQuery;
    IBQInsertEveParticular: TIBQuery;
    IBQGetAnimalesSemen: TIBQuery;
    IBQAnimalesExtNueva: TIBQuery;
    IBQAnimalesExtVieja: TIBQuery;
    IBQConsultaBaseViejaAux: TIBQuery;
    IBQConsultaBaseNuevaAux1: TIBQuery;
    IBQConsultaBaseViejaAux1: TIBQuery;
    IBQConsultaBaseViejaAux2: TIBQuery;
    IBQConsultaBaseNuevaAux2: TIBQuery;
    IBQEventosHijos: TIBQuery;
    IBQBajaAnimal: TIBQuery;
    IBQMBI: TIBQuery;
    IBQMRI: TIBQuery;
    IBQMBE: TIBQuery;
    IBQMRE: TIBQuery;
    IBQUpdateMadre: TIBQuery;
    IBase: TImage;
    LSeleccionBD: TLabel;
    LEstado: TLabel;
    PBotton: TPanel;
    Image1: TImage;
    LCancelar: TLabel;
    ICancelar: TImage;
    IBQAuxEveCU: TIBQuery;
    IBQCambioUbicEstable: TIBQuery;
    IBQConsultaEveGeneralNueva: TIBQuery;
    IBQConsultaEveGeneralVieja: TIBQuery;
    IBQConsultaEveParticularNueva: TIBQuery;
    IBQConsultaEveParticularVieja: TIBQuery;
    IBQAuxEveViejos: TIBQuery;
    IBQAuxEveNuevos: TIBQuery;
    IBQAuxAnimViejos: TIBQuery;
    IBQFechaAltaBDVieja: TIBQuery;
    IBQFechaAltaBDNueva: TIBQuery;
    IBQAuxSS: TIBQuery;
    IBQAuxSSAux: TIBQuery;
    SPProgres: TJvSpecialProgress;
    procedure Button1Click(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
  private
    Tablas : TArrTablas;
    Procedures : TArrProcedures;
    ClavesExtranjeras : TArrClavesExtranjeras;
    AnimalSincronizado : array of integer;
    procedure AbrirDesomprimir;
    procedure Sincronizar;
    procedure CargaDeCodigos;
    procedure CargarDatosTablas;
    function ObtenerIndiceTabla(Tabla : String) : String;
    procedure CargarDatosSPs;
    procedure SincroEstablecimientos;
    procedure SincroEventos(EstablecimientoPrincipal, EstablecimientoNuevo, AnimalPrincipal, AnimalNuevo : Integer);
    procedure SincroAnimales(EstablecimientoPrincipal, EstablecimientoNuevo : Integer);
    procedure AgregarGeneradores;
    procedure ArmarSP(Nombre : String);
    procedure ArmarConsultaEvento(Tabla1, Tabla2 : String; Tipo : TTipoConsulta; Base : TIBDatabase; Query : TIBQuery);
    procedure ArmarConsultaTabla(Tabla : String; Tipo : TTipoConsulta; Base : TIBDatabase; Query : TIBQuery);
    function BuscarSPInd(Nombre : String) : Integer;
    function BuscarTablaInd(Nombre : String) : Integer;
    function BuscarSP(Nombre : String) : TProcedures;
    function BuscarTabla(Nombre : String) : TTabla;
    function CrearEstablecimiento(id_nuevo : Integer) : Integer;
    procedure ActualizarDatosEstablecimiento(EstablecimientoNuevo, EstablecimientoViejo : Integer);
    function getClavePrimaria(Tabla : String) : Integer;
    function CrearAnimal(Animal, EstaViejo, EstaNuevo : Integer) : Integer;
    function CargarNacimiento(Animal, EstaViejo, EstaNuevo : Integer) : Integer;
    function CargarAlta(Animal, EstaViejo, EstaNuevo : Integer) : Integer;
    function CargarCodigo(Tabla, Clave : String; Id, Esta : Integer) : Integer;
    procedure CargarClavesExternas(Tabla, ID : String; EstabNuevo, Valor : Integer);
    function GetTablaCodigo(Campo : String) : String;
    function GetDatosEvento(TipoEve : Integer) : TDatosEvento;
    procedure CargarEventoSimple(Evento, Establecimiento, Animal : Integer; Tipo : TDatosEvento);
    procedure CargarEventoComplejo(Evento, EstablecimientoPrincipal, EstablecimientoNuevo, Animal : Integer; Tipo : TDatosEvento);
    procedure ActualizarDatosSemen(EstablecimientoPrincipal, EstablecimientoNuevo : Integer);
    procedure BuscarAnimalSemen(Semen, EstablecimientoPrincipal, EstablecimientoNuevo : Integer; var Id : Integer; var Tipo : String);
    procedure CargarGrupos(EstablecimientoPrincipal, EstablecimientoNuevo : Integer);
    procedure CargarServicios(EstablecimientoPrincipal, EstablecimientoNuevo : Integer);
    function BuscarGrupo(Grupo, EstablecimientoPrincipal, EstablecimientoNuevo : Integer) : Integer;
    function BuscarServicio(Servicio, EstablecimientoPrincipal, EstablecimientoNuevo : Integer) : Integer;
    function BuscarSemen(Semen, EstablecimientoPrincipal, EstablecimientoNuevo : Integer) : Integer;
    procedure CargarEventoHijo(Evento, Padre, Establecimiento, Animal : Integer; Tipo : TDatosEvento);
    procedure CargarEventosDisparados(Evento, Padre, Establecimiento, Animal : Integer);
    function BuscarAnimal(Animal, EstablecimientoPrincipal, EstablecimientoNuevo : Integer; Tipo : String) : Integer;
    procedure CargarGenealogia(Animal, EstablecimientoPrincipal, EstablecimientoNuevo : Integer);
    procedure ActualizarEstado(Mensaje : String);
    function VerificarEventoNuevo(AnimalN, AnimalV, Tipo, Establecimiento : Integer; fecha : TDate; TipoEve : TDatosEvento) : boolean;
    function AnimalYaSincronizado(Animal : integer) : boolean;

    procedure SincronizarTabTermo(IdS : integer);
  public
    { Public declarations }
  end;

var
  FSincroBaseDatos: TFSincroBaseDatos;

implementation

uses UPrincipal, UMensajeHuella, UBackup, UCartel, StrUtils;

{$R *.dfm}

procedure TFSincroBaseDatos.AbrirDesomprimir;
var
  nombre_archivo_origen, archivo : String;
  pathAplicacion, driveAplicacion : String;
  cartel: TCartel;
  msje : String;
  fecha : TDate;
  i : integer;
  puede_cambiar : Boolean;
  back : TFBackup;
begin
  inherited;
  puede_cambiar := true;

  //////////////////////////////////////
  ///BACKUP de la BASE DE DATOS ACTUAL
  back := TFBackup.Create(self);
  MostrarMensaje(tmInformacion, 'Se Realizará un Backup de su Base de Datos Actual');
  (back as TFBackup).guardarBD(2);
  back.Destroy;
  //////////////////////////////////////

  FPrincipal.IBTPrincipal.CommitRetaining;

  ////////////////////////////////////////////
  /////////Desomprimir la base de datos nueva
  pathAplicacion := ExtractFilePath(Application.ExeName);
  driveAplicacion := ExtractFileDrive(Application.ExeName);
  nombre_archivo_origen := ODBaseDestino.FileName;
  if ansilowercase(ExtractFileExt(nombre_archivo_origen))='.zip' then
  begin
    unzipper.FileName := nombre_archivo_origen;
    unzipper.BaseDirectory := driveAplicacion;
    for i := 0 to unzipper.Count-1 do
       if (Lowercase(ExtractFileExt(unzipper.Items[i].FileName))='.fdb') or (Lowercase(ExtractFileExt(unzipper.Items[i].FileName))='.bkp') then
          archivo := unzipper.Items[i].FileName;
    if archivo <> '' then
    begin
      if FileExists(nombre_archivo_origen+'\'+archivo) then
        DeleteFile(nombre_archivo_origen+'\'+archivo);
      unzipper.ExtractFiles(archivo);
      nombre_archivo_origen := driveAplicacion+'\'+archivo;
    end
    else
    begin
      MostrarMensaje(tmInformacion, 'No se encontro ninguna Base de Datos en el archivo');
      exit;
    end;
  end;

  if FileExists(pathAplicacion+'huella_temp.fdb') then
    DeleteFile(pathAplicacion+'huella_temp.fdb');

  MoveFile(PAnsiChar(nombre_archivo_origen),PAnsiChar(pathAplicacion+'huella_temp.fdb'));
  IBDBaseNueva.Connected := false;
  IBDBaseNueva.DatabaseName := pathAplicacion+'huella_temp.fdb';
  IBDBaseNueva.Connected := true;

  /////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////
  if puede_cambiar then
  begin
    Sincronizar;
    MostrarMensaje(tmInformacion, 'Sincronización Exitosa. Vuelva a Iniciar Huella');
    Application.Terminate;
  end
  else
    MostrarMensaje(tmError,'No se puede restaurar la base de datos de un Modulo Full o Estandar en un Modulo Base');
end;

procedure TFSincroBaseDatos.Sincronizar;
begin
  ActualizarEstado('Cargando Estructuras de la Base de Datos...');
  CargarDatosTablas;
  CargarDatosSPs;
  SincroEstablecimientos;
end;

procedure TFSincroBaseDatos.Button1Click(Sender: TObject);
var
  desktopFolder : array[0..MAX_PATH] of Char;
  PIDL : PItemIDList;
  Escritorio : String;
begin
  inherited;
  SHGetSpecialFolderLocation(0, CSIDL_PERSONAL, PIDL) ;
  SHGetPathFromIDList(PIDL, desktopFolder);
  Escritorio := desktopFolder+'\Backups Huella\';
  if DirectoryExists(Escritorio) then
    ODBaseDestino.InitialDir := Escritorio;
  if ODBaseDestino.Execute then
  begin
    if ODBaseDestino.FileName <> '' then
    begin
      if FileExists(ODBaseDestino.FileName) then
      begin
        IBase.Enabled := false;
        LSeleccionBD.Enabled := false;
        ICancelar.Enabled := false;
        LCancelar.Enabled := false;
        AbrirDesomprimir;
        IBase.Enabled := true;
        LSeleccionBD.Enabled := true;
        ICancelar.Enabled := true;
        LCancelar.Enabled := true;
      end
      else
      begin
        MostrarMensaje(tmError,'El archivo no existe');
        Close;
      end;
    end
    else
      Close();
  end
  else
    Close();
end;

procedure TFSincroBaseDatos.CargarDatosTablas;
var
  Tabs : TStringList;
  I, H : Integer;
begin
  Tabs := TStringList.Create;
  IBDBaseNueva.GetTableNames(Tabs,false);
  SetLength(Tablas,Tabs.Count);
  for I := 0 to Tabs.Count-1 do
  begin
    IBTTablaAux.Active := false;
    IBTTablaAux.TableName := Tabs.Strings[I];
    IBTTablaAux.Active := true;
    Tablas[I].Clave := ObtenerIndiceTabla(Tabs.Strings[I]);
    Tablas[I].Tabla := Tabs.Strings[I];
    Tablas[I].Campos := TStringList.Create;
    IBDBaseNueva.GetFieldNames(Tablas[I].Tabla,Tablas[I].Campos);
  end;
  AgregarGeneradores;
end;

function TFSincroBaseDatos.ObtenerIndiceTabla(Tabla : String) : String;
begin
  Result := '';
  IBQGetIndices.Close;
  IBQGetIndices.ParamByName('Nombre').AsString := Tabla;
  IBQGetIndices.Open;

  if not IBQGetIndices.IsEmpty then
  begin
    IBQGetIndices.First;
    if ((AnsiPos('ESTABLECIMIENTO',IBQGetIndices.FieldValues['RDB$FIELD_NAME']) <> 0) and (Tabla <> 'TAB_ESTABLECIMIENTO')) then
      IBQGetIndices.Next;
    if IBQGetIndices.FieldByName('RDB$FIELD_NAME').Value <> null then
      Result := Trim(IBQGetIndices.FieldByName('RDB$FIELD_NAME').AsString);
  end;
end;

procedure TFSincroBaseDatos.AgregarGeneradores;
var
  Archivo : TextFile;
  Linea : String;
  Tab, Gen : String;
  I : Integer;
  procedure CortarLinea(Linea : String; var L1,L2 : String);
  var
    A1, A2 : String;
    Delimitador : Integer;
  begin
    Delimitador := Pos(';',Linea);
    A1 := LeftStr(Linea,Delimitador-1);
    A2 := RightStr(Linea,Length(Linea)-Delimitador);
    L1 := Trim(A1);
    L2 := Trim(A2);
  end;
begin
  try
    AssignFile(Archivo,ExtractFilePath(Application.ExeName)+'Tablas.csv');
    Reset(Archivo);
    while not Eof(Archivo) do
    begin
      Readln(Archivo,Linea);
      CortarLinea(Linea,Tab,Gen);
      I := BuscarTablaInd(Tab);
      Tablas[I].Generador := Gen;
    end;
  except
  end;
end;

procedure TFSincroBaseDatos.CargarDatosSPs;
var
  I, K : Integer;
  Procs : TStringList;
begin
  Procs := TStringList.Create;
  Procs.AddStrings(IBSPBase.StoredProcedureNames);
  SetLength(Procedures,Procs.Count);
  for I := 0 to Procs.Count-1 do
  begin
    Procedures[I].Nombre := Procs.Strings[I];
    IBSPBase.StoredProcName := Procs.Strings[I];
    IBSPBase.Prepare;
    Procedures[I].ParametrosIN := TStringList.Create;
    Procedures[I].ParametrosOUT := TStringList.Create;
    for K := 0 to IBSPBase.Params.Count-1 do
    begin
      if IBSPBase.Params[K].ParamType = ptOutput then
        Procedures[I].ParametrosOUT.Add(IBSPBase.Params[K].Name);
      if IBSPBase.Params[K].ParamType = ptInput then
        Procedures[I].ParametrosIN.Add(IBSPBase.Params[K].Name);
    end;
  end;
end;

function TFSincroBaseDatos.BuscarSPInd(Nombre : String) : Integer;
var
  I : Integer;
begin
  Result := -1;
  for I := 0 to Length(Procedures)-1 do
    if Procedures[I].Nombre = UpperCase(Nombre) then
    begin
      Result := I;
      break;
    end;
end;

function TFSincroBaseDatos.BuscarTablaInd(Nombre : String) : Integer;
var
  I : Integer;
begin
  Result := -1;
  for I := 0 to Length(Tablas)-1 do
    if Tablas[I].Tabla = UpperCase(Nombre) then
    begin
      Result := I;
      break;
    end;
end;

function TFSincroBaseDatos.BuscarSP(Nombre : String) : TProcedures;
var
  I : Integer;
begin
  for I := 0 to Length(Procedures)-1 do
    if Procedures[I].Nombre = UpperCase(Nombre) then
    begin
      Result := Procedures[I];
      break;
    end;
end;

function TFSincroBaseDatos.BuscarTabla(Nombre : String) : TTabla;
var
  I : Integer;
begin
  for I := 0 to Length(Tablas)-1 do
    if Tablas[I].Tabla = UpperCase(Nombre) then
    begin
      Result := Tablas[I];
      break;
    end;
end;

procedure TFSincroBaseDatos.ArmarSP(Nombre : String);
var
  SQLString : String;
  I, J : Integer;
  Proc : TProcedures;
begin
  IBQSPBase.Close;
  IBQSPBase.SQL.Clear;
  Proc := BuscarSP(Nombre);
  if Proc.ParametrosOUT.Count = 0 then
    SQLString := 'EXECUTE PROCEDURE '+Proc.Nombre+'('
  else
  begin
    SQLString := 'SELECT ';
    for J := 0 to Proc.ParametrosOUT.Count-1 do
      SQLString := SQLString + Proc.ParametrosOUT.Strings[J] + ',';
    SQLString := SQLString + ' FROM '+Proc.Nombre+'(';
  end;
  for I := 0 to Proc.ParametrosIN.Count-1 do
    SQLString := SQLString+' :'+Proc.ParametrosIN.Strings[I]+',';
  SQLString := SQLString+')';
  SQLString := StringReplace(SQLString,', FROM',' FROM',[rfReplaceAll]);
  SQLString := StringReplace(SQLString,',)',')',[rfReplaceAll]);
  IBQSPBase.SQL.Add(SQLString);
end;

procedure TFSincroBaseDatos.ArmarConsultaEvento(Tabla1, Tabla2 : String; Tipo : TTipoConsulta; Base : TIBDatabase; Query : TIBQuery);
var
  SQLString : String;
  Tab1, Tab2 : TTabla;
  I : Integer;
begin
  Tab1 := BuscarTabla(Tabla1);
  Tab2 := BuscarTabla(Tabla2);
  Query.Close;
  Query.Database := Base;
  Query.Transaction := Base.DefaultTransaction;
  case Tipo of
    tcInsert : begin
                  {SQLString := 'INSERT INTO '+Tab.Tabla+' (';
                  for I := 0 to Tab.Campos.Count-1 do
                    SQLString := SQLString + Tab.Campos.Strings[I] + ',';
                  SQLString := SQLString + ')';
                  SQLString := SQLString + ' VALUES (';
                  for I := 0 to Tab.Campos.Count-1 do
                    SQLString := SQLString + ':' +Tab.Campos.Strings[I] + ',';
                  SQLString := SQLString + ')';
                  SQLString := StringReplace(SQLString,',)',')',[rfReplaceAll]);}
               end;
    tcSelect : begin
                  SQLString := 'SELECT ';
                  for I := 0 to Tab1.Campos.Count-1 do
                    SQLString := SQLString + 'T1.' + Tab1.Campos.Strings[I] + ',';
                  for I := 0 to Tab2.Campos.Count-1 do
                    SQLString := SQLString + 'T2.' + Tab2.Campos.Strings[I] + ',';
                  SQLString := SQLString + ' FROM ';
                  SQLString := StringReplace(SQLString,', FROM ',' FROM ',[rfReplaceAll]);
                  if tab2.Tabla = 'EVE_EXTRACCION_SEMEN' then
                    SQLString := SQLString + Tab1.Tabla + ' T1 JOIN ' + Tab2.Tabla + ' T2 ON T1.ID_EVENTO = T2.ID_EVENTO_EXTRACCION'
                  else
                    SQLString := SQLString + Tab1.Tabla + ' T1 JOIN ' + Tab2.Tabla + ' T2 ON T1.ID_EVENTO = T2.ID_EVENTO';
               end;
    tcUpdate : begin

               end;
  end;
  Query.SQL.Clear;
  Query.SQL.Add(SQLString);
end;

procedure TFSincroBaseDatos.ArmarConsultaTabla(Tabla : String; Tipo : TTipoConsulta; Base : TIBDatabase; Query : TIBQuery);
var
  SQLString : String;
  Tab : TTabla;
  I : Integer;
begin
  Tab := BuscarTabla(Tabla);
  Query.Close;
  Query.Database := Base;
  Query.Transaction := Base.DefaultTransaction;
  case Tipo of
    tcInsert : begin
                  SQLString := 'INSERT INTO '+Tab.Tabla+' (';
                  for I := 0 to Tab.Campos.Count-1 do
                    SQLString := SQLString + Tab.Campos.Strings[I] + ',';
                  SQLString := SQLString + ')';
                  SQLString := SQLString + ' VALUES (';
                  for I := 0 to Tab.Campos.Count-1 do
                    SQLString := SQLString + ':' +Tab.Campos.Strings[I] + ',';
                  SQLString := SQLString + ')';
                  SQLString := StringReplace(SQLString,',)',')',[rfReplaceAll]);
               end;
    tcSelect : begin
                  SQLString := 'SELECT ';
                  for I := 0 to Tab.Campos.Count-1 do
                    SQLString := SQLString + Tab.Campos.Strings[I] + ',';
                  SQLString := SQLString + ' FROM ' + Tab.Tabla;
                  SQLString := StringReplace(SQLString,', FROM',' FROM',[rfReplaceAll]);
               end;
    tcUpdate : begin

               end;
  end;
  Query.SQL.Clear;
  Query.SQL.Add(SQLString);
end;

function TFSincroBaseDatos.getClavePrimaria(Tabla : String) : Integer;
begin
  if BuscarTabla(Tabla).Generador <> '' then
  begin
    IBQGeneradores.Close;
    IBQGeneradores.SQL.Clear;
    IBQGeneradores.SQL.Add('SELECT GEN_ID('+BuscarTabla(Tabla).Generador+', 1)  AS ID FROM RDB$DATABASE');
    IBQGeneradores.Open;
    Result := IBQGeneradores.FieldValues['ID'];
  end
  else
    Result := -1;
end;

procedure TFSincroBaseDatos.CargaDeCodigos;
var
  I : Integer;
begin

end;

function TFSincroBaseDatos.CrearEstablecimiento(id_nuevo : Integer) : Integer;
var
  I, K : Integer;
  Estab : Integer;
begin
  //Agrego el establecimiento
  try
    ArmarConsultaTabla('tab_establecimientos',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
    ArmarSP('sp_creacion_establecimiento');
    I := BuscarSPInd('sp_creacion_establecimiento');
    IBQConsultaBaseNueva.Open;
    IBQConsultaBaseNueva.Locate('id_establecimiento',id_nuevo,[]);
    //IBQSPBase.Prepare;
    for K := 0 to Procedures[I].ParametrosIN.Count-1 do
      //if IBQSPBase.Params[I].ParamType = ptInput then
      IBQSPBase.ParamByName(Procedures[I].ParametrosIN.Strings[K]).Value := IBQConsultaBaseNueva.FieldValues[Procedures[I].ParametrosIN.Strings[K]];
    IBQSPBase.Open;
    Estab := IBQSPBase.FieldValues[Procedures[I].ParametrosOUT.Strings[0]];
    FPrincipal.IBTPrincipal.CommitRetaining;
    Result := Estab;
  except
    raise Exception.Create('No se puede crear el establecimiento');
    FPrincipal.IBTPrincipal.RollbackRetaining;
    ActualizarEstado('Se generó un inconveniente. No se puede crear el establecimiento.');
  end;
end;

function TFSincroBaseDatos.CargarCodigo(Tabla, Clave : String; Id, Esta : Integer) : Integer;
var
  I, CE : Integer;
  res : Integer;
  Existe, ConEsta : Boolean;
begin
  Existe := false;
  ConEsta := false;
  ArmarConsultaTabla(Tabla,tcSelect,IBDBaseNueva,IBQCodigoAux);
  ArmarConsultaTabla(Tabla,tcInsert,FPrincipal.IBDPrincipal,IBQCodigoNuevo);
  ArmarConsultaTabla(Tabla,tcSelect,FPrincipal.IBDPrincipal,IBQCodigoAux1);
  IBQCodigoAux.Open;
  IBQCodigoAux1.Open;
  if IBQCodigoAux.Locate(Clave,id,[]) then
  begin
    if Tabla = 'TAB_SEMEN' then
    begin
      Result := 0;
      Exit;
    end;
    if Tabla = 'COD_CONDICIONES_CORPORALES' then
    begin
      if IBQCodigoAux1.Locate('VALOR_ESCALA_10',IBQCodigoAux.FieldValues['VALOR_ESCALA_10'],[]) then
      begin
        Result := IBQCodigoAux1.FieldValues[Clave];
        Existe := true;
      end
      else
      begin
        if IBQCodigoAux1.Locate('VALOR_ESCALA_5',IBQCodigoAux.FieldValues['VALOR_ESCALA_5'],[]) then
        begin
          Result := IBQCodigoAux1.FieldValues[Clave];
          Existe := true;
        end
        else
          Existe := false;
      end
    end
    else
    begin
      if Tabla = 'COD_TIPOS_VIGOR' then
      begin
        if IBQCodigoAux1.Locate('VALOR_TIPO_VIGOR',IBQCodigoAux.FieldValues['VALOR_TIPO_VIGOR'],[]) then
        begin
          Result := IBQCodigoAux1.FieldValues[Clave];
          Existe := true;
        end
        else
            Existe := false;
      end
      else
      begin
        if Tabla = 'COD_COLORES_SEMEN' then
        begin
          if IBQCodigoAux1.Locate('NOMBRE_COLOR_SEMEN',IBQCodigoAux.FieldValues['NOMBRE_COLOR_SEMEN'],[]) then
          begin
            Result := IBQCodigoAux1.FieldValues[Clave];
            Existe := true;
          end
          else
              Existe := false;
        end
        else
        begin
          if Tabla = 'COD_RESULTADO_CALIDAD_SEMEN' then
          begin
            if IBQCodigoAux1.Locate('NOMBRE_RESULTADO_CALIDAD_SEMEN',IBQCodigoAux.FieldValues['NOMBRE_RESULTADO_CALIDAD_SEMEN'],[]) then
            begin
              Result := IBQCodigoAux1.FieldValues[Clave];
              Existe := true;
            end
            else
                Existe := false;
          end
          else
          begin
            if Tabla = 'COD_TIPOS_BAJA_SEMEN' then
            begin
              if IBQCodigoAux1.Locate('NOMBRE_TIPO_BAJA_SEMEN',IBQCodigoAux.FieldValues['NOMBRE_TIPO_BAJA_SEMEN'],[]) then
              begin
                Result := IBQCodigoAux1.FieldValues[Clave];
                Existe := true;
              end
              else
                  Existe := false;
            end
            else
            begin
              if Tabla = 'TAB_CLIENTES_COMPRA_SEMEN' then
              begin
                if IBQCodigoAux1.Locate('NOMBRE_CLIENTE',IBQCodigoAux.FieldValues['NOMBRE_CLIENTE'],[]) then
                begin
                  Result := IBQCodigoAux1.FieldValues[Clave];
                  Existe := true;
                end
                else
                    Existe := false;
              end
              else
              begin
                ConEsta := IBQCodigoAux1.Fields.FindField('ESTABLECIMIENTO') <> nil;

                if ConEsta then
                begin
                  {if (Tabla = 'TAB_SERVICIOS') then
                    CE := IBQCodigoAux.FieldValues['establecimiento']
                  else}
                    CE := Esta;

                  if IBQCodigoAux1.Locate('nombre;establecimiento',VarArrayOf([IBQCodigoAux.FieldValues['nombre'],CE]),[]) then
                  begin
                    Result := IBQCodigoAux1.FieldValues[Clave];
                    Existe := true;
                  end
                  else
                    Existe := false;
                end
                else
                begin
                  try
                    if IBQCodigoAux1.Locate('nombre',IBQCodigoAux.FieldValues['nombre'],[]) then
                    begin
                      Result := IBQCodigoAux1.FieldValues[Clave];
                      Existe := true;
                    end
                    else
                      Existe := false;
                  except
                    Existe := false;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;

    if not Existe then
    begin
      try
        IBQCodigoNuevo.Close;
        for I := 0 to IBQCodigoNuevo.Params.Count-1 do
          IBQCodigoNuevo.Params[I].Value := IBQCodigoAux.FieldValues[IBQCodigoNuevo.Params[I].Name];

        res := getClavePrimaria(Tabla);
        IBQCodigoNuevo.ParamByName(Clave).AsInteger := res;
        IBQCodigoNuevo.Open;
        Result := res;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
  end;

end;

procedure TFSincroBaseDatos.ActualizarDatosEstablecimiento(EstablecimientoNuevo, EstablecimientoViejo : Integer);
var
  I : Integer;
  forraje : Integer;
begin
  //Agrego los potreros
  ActualizarEstado('Sincronizando Potreros...');
  try
    ArmarConsultaTabla('tab_potreros',tcSelect,FPrincipal.IBDPrincipal,IBQConsulta);
    ArmarConsultaTabla('tab_potreros',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
    ArmarConsultaTabla('tab_potreros',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
    IBQConsulta.Close;
    IBQConsulta.Open;
    IBQConsultaBaseNueva.Open;
    IBQConsultaBaseNueva.First;
    IBQConsultaBaseVieja.Prepare;
    while IBQConsultaBaseNueva.LocateNext('establecimiento',EstablecimientoNuevo,[]) do
    begin
      if not IBQConsulta.Locate('establecimiento;nombre',VarArrayOf([EstablecimientoViejo,IBQConsultaBaseNueva.FieldValues['nombre']]),[]) then
      begin
        forraje := CargarCodigo('cod_recursos_forrajeros','id_recurso_forrajero',IBQConsultaBaseNueva.FieldValues['recurso_forrajero'],EstablecimientoViejo);
        IBQConsultaBaseVieja.Close;
        for I := 0 to IBQConsultaBaseVieja.Params.Count-1 do
          IBQConsultaBaseVieja.Params[I].Value := IBQConsultaBaseNueva.FieldValues[IBQConsultaBaseVieja.Params[I].Name];
        IBQConsultaBaseVieja.ParamByName('ID_POTRERO').AsInteger := getClavePrimaria('tab_potreros');
        IBQConsultaBaseVieja.ParamByName('RECURSO_FORRAJERO').AsInteger := forraje;
        IBQConsultaBaseVieja.ParamByName('ESTABLECIMIENTO').AsInteger := EstablecimientoViejo;
        IBQConsultaBaseVieja.Open;
      end;
    end;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    raise Exception.Create('No se pueden cargar los potreros.');
    FPrincipal.IBTPrincipal.RollbackRetaining;
    ActualizarEstado('Se generó un inconveniente. No se pueden cargar los potreros.');
  end;

  //Agrego los rodeos
  ActualizarEstado('Sincronizando Rodeos...');
  try
    ArmarConsultaTabla('tab_rodeos',tcSelect,FPrincipal.IBDPrincipal,IBQConsulta);
    ArmarConsultaTabla('tab_rodeos',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
    ArmarConsultaTabla('tab_rodeos',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
    IBQConsulta.Close;
    IBQConsulta.Open;
    IBQConsultaBaseNueva.Open;
    IBQConsultaBaseVieja.Prepare;
    IBQConsultaBaseNueva.First;
    while IBQConsultaBaseNueva.LocateNext('establecimiento',EstablecimientoNuevo,[]) do
    begin
      if not IBQConsulta.Locate('establecimiento;nombre',VarArrayOf([EstablecimientoViejo,IBQConsultaBaseNueva.FieldValues['nombre']]),[]) then
      begin
        IBQConsultaBaseVieja.Close;
        for I := 0 to IBQConsultaBaseVieja.Params.Count-1 do
          IBQConsultaBaseVieja.Params[I].Value := IBQConsultaBaseNueva.FieldValues[IBQConsultaBaseVieja.Params[I].Name];
        IBQConsultaBaseVieja.ParamByName('ID_RODEO').AsInteger := getClavePrimaria('tab_rodeos');
        IBQConsultaBaseVieja.ParamByName('ESTABLECIMIENTO').AsInteger := EstablecimientoViejo;
        IBQConsultaBaseVieja.Open;
      end;
    end;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    raise Exception.Create('No se pueden cargar los rodeos.');
    FPrincipal.IBTPrincipal.RollbackRetaining;
    ActualizarEstado('Se generó un inconveniente. No se pueden cargar los rodeos.');
  end;

  //Agrego los empleados
  ActualizarEstado('Sincronizando Empleados...');
  try
    ArmarConsultaTabla('tab_empleados',tcSelect,FPrincipal.IBDPrincipal,IBQConsulta);
    ArmarConsultaTabla('tab_empleados',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
    ArmarConsultaTabla('tab_empleados',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
    IBQConsulta.Close;
    IBQConsulta.Open;
    IBQConsultaBaseNueva.Open;
    IBQConsultaBaseVieja.Prepare;
    IBQConsultaBaseNueva.First;
    while IBQConsultaBaseNueva.LocateNext('establecimiento',EstablecimientoNuevo,[]) do
    begin
      if not IBQConsulta.Locate('nombre;apellido;establecimiento',VarArrayOf([IBQConsultaBaseNueva.FieldValues['nombre'],IBQConsultaBaseNueva.FieldValues['apellido'],EstablecimientoViejo]),[]) then
      IBQConsultaBaseVieja.Close;
      for I := 0 to IBQConsultaBaseVieja.Params.Count-1 do
        IBQConsultaBaseVieja.Params[I].Value := IBQConsultaBaseNueva.FieldValues[IBQConsultaBaseVieja.Params[I].Name];
      IBQConsultaBaseVieja.ParamByName('ID_EMPLEADO').AsInteger := getClavePrimaria('tab_empleados');
      IBQConsultaBaseVieja.ParamByName('ESTABLECIMIENTO').AsInteger := EstablecimientoViejo;
      IBQConsultaBaseVieja.Open;
    end;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    raise Exception.Create('No se pueden cargar los empleados.');
    FPrincipal.IBTPrincipal.RollbackRetaining;
    ActualizarEstado('Se generó un inconveniente. No se pueden cargar los empleados.');
  end;
end;

procedure TFSincroBaseDatos.SincroEstablecimientos;
var NuevoEstablecimiento : Integer;
begin
  IBQEstabNuevos.Close;
  IBQEstabNuevos.Open;
  IBQEstabViejo.Close;
  IBQEstabViejo.Open;
  IBQEstabNuevos.First;

  while not IBQEstabNuevos.Eof do
  begin
      if not IBQEstabViejo.Locate('nombre',IBQEstabNuevos.FieldValues['nombre'],[]) then //no existe el establecimiento
        NuevoEstablecimiento := CrearEstablecimiento(IBQEstabNuevos.FieldValues['id_establecimiento'])
      else  //existe el establecimiento
        NuevoEstablecimiento := IBQEstabViejo.FieldValues['id_establecimiento'];

      ActualizarEstado('Sincronizando Establecimiento...');
      ActualizarDatosEstablecimiento(IBQEstabNuevos.FieldValues['id_establecimiento'],NuevoEstablecimiento);


    IBQEstabNuevos.Next;
  end;

  IBQEstabNuevos.Close;
  IBQEstabNuevos.Open;
  
  IBQEstabViejo.Close;
  IBQEstabViejo.Open;
  
  IBQEstabNuevos.First;   

  while not IBQEstabNuevos.Eof do
  begin

    if not IBQEstabViejo.Locate('nombre',IBQEstabNuevos.FieldValues['nombre'],[]) then //no existe el establecimiento
      NuevoEstablecimiento := CrearEstablecimiento(IBQEstabNuevos.FieldValues['id_establecimiento'])
    else  //existe el establecimiento
      NuevoEstablecimiento := IBQEstabViejo.FieldValues['id_establecimiento'];

    ActualizarEstado('Sincronizando Grupos...');
    CargarGrupos(NuevoEstablecimiento,IBQEstabNuevos.FieldValues['id_establecimiento']);

    ActualizarEstado('Sincronizando Datos de Servicios...');
    CargarServicios(NuevoEstablecimiento,IBQEstabNuevos.FieldValues['id_establecimiento']);

    ActualizarEstado('Sincronizando Datos de Semen...');
    ActualizarDatosSemen(NuevoEstablecimiento,IBQEstabNuevos.FieldValues['id_establecimiento']);

    ActualizarEstado('Sincronizando Animales...');
    SincroAnimales(NuevoEstablecimiento,IBQEstabNuevos.FieldValues['id_establecimiento']);

    ActualizarEstado('Sincronizando Genealogía...');
    CargarGenealogia(0,NuevoEstablecimiento,IBQEstabNuevos.FieldValues['id_establecimiento']);

    IBQEstabNuevos.Next;
  end;
end;

function TFSincroBaseDatos.CargarNacimiento(Animal, EstaViejo, EstaNuevo : Integer) : Integer;
begin

end;

function TFSincroBaseDatos.GetTablaCodigo(Campo : String) : String;
begin
  IBQTablaClaveExtranjera.Close;
  IBQTablaClaveExtranjera.ParamByName('Nombre').AsString := Campo;
  IBQTablaClaveExtranjera.Open;
  Result := Trim(IBQTablaClaveExtranjera.FieldByName('RDB$RELATION_NAME').AsString);
end;

procedure TFSincroBaseDatos.CargarClavesExternas(Tabla, ID : String; EstabNuevo, Valor : Integer);
var
  I, IC, IT : Integer;
  TablaExt, ValorExt : String;
  Field, Field1 : String;
begin
  SetLength(ClavesExtranjeras,0);
  IBTTabla.Active := false;
  IBTTabla.Database := IBDBaseNueva;
  IBTTabla.Transaction := IBTBaseNueva;
  IBTTabla.TableName := UpperCase(Tabla);
  IBTTabla.Active := true;
  IC := 0;
  for I := 0 to IBTTabla.IndexDefs.Count - 1 do
  begin
    if not (AnsiContainsStr(UpperCase(IBTTabla.IndexDefs[I].Name),'PK') or AnsiContainsStr(UpperCase(IBTTabla.IndexDefs[I].Name),'IDX')) then
    begin
      IT := BuscarTablaInd(GetTablaCodigo(IBTTabla.IndexDefs[I].Name));
      if IT <> -1 then
      begin
        Field := IBTTabla.IndexDefs[I].Fields;
        Field1 := '';
        if AnsiContainsStr(Field,';') then
        begin
             if (AnsiPos('ESTABLECIMIENTO',Field) <> 0) then
             begin
                  Field := StringReplace(Field,';ESTABLECIMIENTO','',[]);
                  Field := StringReplace(Field,'ESTABLECIMIENTO;','',[]);
                  Field1 := 'ESTABLECIMIENTO';
             end;
        end;

        if (Tablas[IT].Tabla <> UpperCase(Tabla)) and (Tablas[IT].Tabla <> 'EVE_EVENTOS') then
        begin
          if IBTTabla.Lookup(ID,Valor,Field) <> null then
          begin
            SetLength(ClavesExtranjeras,IC+1);
            if Tablas[IT].Tabla <> 'TAB_ANIMALES' then
              ClavesExtranjeras[IC].Valor := CargarCodigo(Tablas[IT].Tabla,Tablas[IT].Clave,IBTTabla.Lookup(ID,Valor,Field),EstabNuevo);
            ClavesExtranjeras[IC].Campo := Field;
            Inc(IC);

            if (Field1 <> '') then
            begin
                SetLength(ClavesExtranjeras,IC+1);
                if Tablas[IT].Tabla <> 'TAB_ANIMALES' then
                  ClavesExtranjeras[IC].Valor := CargarCodigo('TAB_ESTABLECIMIENTOS','ID_ESTABLECIMIENTO',IBTTabla.Lookup(ID,Valor,Field1),EstabNuevo);
                ClavesExtranjeras[IC].Campo := Field1;
                Inc(IC);
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TFSincroBaseDatos.CargarAlta(Animal, EstaViejo, EstaNuevo : Integer) : Integer;
var
  I, K, CE : Integer;
  Anim : Integer;
begin
  //Agrego el animal
  try
    ArmarConsultaTabla('tab_animales',tcSelect,IBDBaseNueva,IBQConsultaBaseNuevaAux);
    ArmarConsultaEvento('eve_eventos','eve_alta_directa',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
    ArmarSP('sp_alta_directa_animal');
    I := BuscarSPInd('sp_alta_directa_animal');
    Anim := getClavePrimaria('tab_animales');
    IBQConsultaBaseNueva.Open;
    IBQConsultaBaseNueva.Locate('animal;tipo',VarArrayOf([Animal,2]),[]);
    IBQConsultaBaseNuevaAux.Open;
    IBQConsultaBaseNuevaAux.Locate('id_animal',Animal,[]);
    IBQSPBase.Prepare;
    for K := 0 to Procedures[I].ParametrosIN.Count-1 do
    begin
      if IBQConsultaBaseNueva.FindField(Procedures[I].ParametrosIN.Strings[K]) <> nil then
        IBQSPBase.ParamByName(Procedures[I].ParametrosIN.Strings[K]).Value := IBQConsultaBaseNueva.FieldValues[Procedures[I].ParametrosIN.Strings[K]]
      else
        if IBQConsultaBaseNuevaAux.FindField(Procedures[I].ParametrosIN.Strings[K]) <> nil then
          IBQSPBase.ParamByName(Procedures[I].ParametrosIN.Strings[K]).Value := IBQConsultaBaseNuevaAux.FieldValues[Procedures[I].ParametrosIN.Strings[K]]
    end;
    CargarClavesExternas('tab_animales','id_animal',EstaViejo,Animal);
    for CE := 0 to Length(ClavesExtranjeras)-1 do
      if ClavesExtranjeras[CE].Campo = 'DESTINO_CABANIA' then
        IBQSPBase.ParamByName('DESTINO').Value := ClavesExtranjeras[CE].Valor
      else
        IBQSPBase.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
    CargarClavesExternas('eve_eventos','id_evento',EstaViejo,IBQConsultaBaseNueva.FieldValues['id_evento']);
    for CE := 0 to Length(ClavesExtranjeras)-1 do
      if ClavesExtranjeras[CE].Campo = 'ANIMAL' then
        IBQSPBase.ParamByName('IDNUEVOANIMAL').Value := Anim
      else
      begin
        if ClavesExtranjeras[CE].Campo = 'TIPO' then
          IBQSPBase.ParamByName('TIPO_ALTA').Value := ClavesExtranjeras[CE].Valor
        else
        begin
          if ClavesExtranjeras[CE].Campo = 'ESTABLECIMIENTO' then
          begin
            if ClavesExtranjeras[CE].Valor <> EstaNuevo then
            begin
              IBQSPBase.ParamByName('RODEO').Value := 0;
              IBQSPBase.ParamByName('POTRERO').Value := 0;
            end;
          end;
          IBQSPBase.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
        end;
      end;
    CargarClavesExternas('eve_alta_directa','id_evento',EstaViejo,IBQConsultaBaseNueva.FieldValues['id_evento']);
    for CE := 0 to Length(ClavesExtranjeras)-1 do
    begin
      if ClavesExtranjeras[CE].Campo = 'TIPO' then
        IBQSPBase.ParamByName('TIPO_ALTA').Value := ClavesExtranjeras[CE].Valor
      else
        IBQSPBase.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
    end;
    IBQSPBase.ParamByName('FECHA_EVENTO').AsDate := IBQConsultaBaseNueva.FieldValues['FECHA'];
    //No paso la genealogia
    IBQSPBase.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := null;
    IBQSPBase.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := null;
    IBQSPBase.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := null;
    IBQSPBase.ParamByName('MADRE_RECEPTORA_INTERNA').Value := null;
    IBQSPBase.ParamByName('PADRE_INTERNO').Value := null;
    IBQSPBase.ParamByName('PADRE_EXTERNO').Value := null;
    //
    IBQSPBase.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
    Result := Anim;
  except
    raise Exception.Create('No se puede crear el animal');
    FPrincipal.IBTPrincipal.RollbackRetaining;
    ActualizarEstado('Se generó un inconveniente. No se puede dar de alta el animal '+IntToStr(Animal));
  end;
end;

function TFSincroBaseDatos.CrearAnimal(Animal, EstaViejo, EstaNuevo : Integer) : Integer;
begin
  IBQEventosNuevos.Close;
//  IBQEventosNuevos.ParamByName('esta').AsInteger := EstaNuevo;
  IBQEventosNuevos.ParamByName('animal').AsInteger := Animal;
  IBQEventosNuevos.Open;
  IBQEventosNuevos.First;
  Result := CargarAlta(Animal, EstaViejo, EstaNuevo);
end;

procedure TFSincroBaseDatos.SincroAnimales(EstablecimientoPrincipal, EstablecimientoNuevo : Integer);
var AnimalNuevo, AnimalPrincipal, cant : Integer;
    cargado : boolean;
begin
  cant := 0;

  IBQAnimalesNuevo.Close;
  IBQAnimalesNuevo.SQL.Clear;
  IBQAnimalesNuevo.SQL.Add('select * from tab_animales where establecimiento = :esta order by fecha_nacimiento asc');
  IBQAnimalesNuevo.ParamByName('esta').AsInteger := EstablecimientoNuevo;
  IBQAnimalesNuevo.Open;
  IBQAnimalesNuevo.Last;
  IBQAnimalesNuevo.First;

  SPProgres.Visible := true;
  SPProgres.Maximum := IBQAnimalesNuevo.RecordCount;
  SPProgres.Position := 0;

  while not IBQAnimalesNuevo.Eof do
  begin
    ActualizarEstado('Sincronizando Animal '+IBQAnimalesNuevo.FieldValues['id_rp']+'...');
    IBQAnimalesViejo.Close;
    IBQAnimalesViejo.Open;

    AnimalNuevo := IBQAnimalesNuevo.FieldValues['id_animal'];

    IBQAuxAnimViejos.Close;
    IBQAuxAnimViejos.ParamByName('rp').AsString := IBQAnimalesNuevo.FieldValues['id_rp'];
    IBQAuxAnimViejos.ParamByName('fecha').AsDate := IBQAnimalesNuevo.FieldValues['fecha_nacimiento'];
    IBQAuxAnimViejos.ParamByName('sexo').AsInteger := IBQAnimalesNuevo.FieldValues['sexo'];
    IBQAuxAnimViejos.Open;

    IBQFechaAltaBDNueva.Close;
    IBQFechaAltaBDNueva.ParamByName('animal').AsInteger := AnimalNuevo;
    IBQFechaAltaBDNueva.Open;

    cargado := false;
    if (IBQAuxAnimViejos.IsEmpty) then
    begin
      AnimalPrincipal := CrearAnimal(AnimalNuevo,EstablecimientoPrincipal,EstablecimientoNuevo);
      SincroEventos(EstablecimientoPrincipal,EstablecimientoNuevo,AnimalPrincipal,AnimalNuevo);
    end
    else
    begin
      IBQAuxAnimViejos.First;
      while (not(IBQAuxAnimViejos.Eof) and not(cargado)) do
      begin
           AnimalPrincipal := IBQAuxAnimViejos.FieldValues['id_animal'];
           IBQFechaAltaBDVieja.Close;
           IBQFechaAltaBDVieja.ParamByName('animal').AsInteger := AnimalPrincipal;
           IBQFechaAltaBDVieja.Open;

           if ((IBQFechaAltaBDNueva.FieldValues['fecha'] = IBQFechaAltaBDVieja.FieldValues['fecha'])) then
           begin
              if not(AnimalYaSincronizado(AnimalPrincipal)) then
              begin
                  SincroEventos(EstablecimientoPrincipal,EstablecimientoNuevo,AnimalPrincipal,AnimalNuevo);
                  cargado := true;

                  Inc(cant);
                  SetLength(AnimalSincronizado,cant);
                  AnimalSincronizado[cant-1] := AnimalPrincipal;
              end;
           end;

           IBQAuxAnimViejos.Next;
      end;

      if not(cargado) then
      begin
           AnimalPrincipal := CrearAnimal(AnimalNuevo,EstablecimientoPrincipal,EstablecimientoNuevo);
           SincroEventos(EstablecimientoPrincipal,EstablecimientoNuevo,AnimalPrincipal,AnimalNuevo);
      end;
    end;
    IBQAnimalesNuevo.Next;

    SPProgres.Position :=  SPProgres.Position + 1;
    SPProgres.Update;

  end;
end;

function TFSincroBaseDatos.GetDatosEvento(TipoEve : Integer) : TDatosEvento;
var
  A : String;
  function Carga(Tabla, SP : String; Tipo : TTipoCargaEvento) : TDatosEvento;
  begin
    Result.Proc := SP;
    Result.Tabla := Tabla;
    Result.Tipo := Tipo;
  end;
begin
  case TipoEve of
    1 : Result := Carga('eve_aborto','sp_aborto',tceSimple);
    2 : Result := Carga('eve_alta_directa','sp_alta_directa',tceSimple);
    3 : Result := Carga('eve_baja','sp_baja',tceComplejo);
    4 : Result := Carga('eve_calidad_seminal','sp_calidad_seminal',tceSimple);
    5 : Result := Carga('eve_cambio_ubicacion','sp_cambio_ubicacion',tceSimple);
    6 : Result := Carga('eve_capacidad_servicio','sp_capacidad_servicio',tceSimple);
    7 : Result := Carga('eve_castracion','sp_castracion',tceSimple);
    8 : Result := Carga('eve_circunferencia_escrotal','sp_circunferencia_escrotal',tceSimple);
    9 : Result := Carga('eve_condicion_corporal','sp_condicion_corporal',tceSimple);
    10 : Result := Carga('eve_destete','sp_destete',tceSimple);
    11 : Result := Carga('eve_deteccion_celo','sp_deteccion_celo',tceSimple);
    12 : Result := Carga('eve_diagnostico_enfermedad','sp_diagnostico_enfermedad',tceSimple);
    13 : Result := Carga('eve_diagnostico_gestacion','sp_dignostico_gestacion',tceSimple);
    14 : Result := Carga('eve_distocia','-',tceSimple);
    15 : Result := Carga('eve_egreso_servicio','egreso',tceComplejo);
    16 : Result := Carga('eve_egreso_toro','egreso',tceComplejo);
    17 : Result := Carga('eve_evaluacion_preservicio','sp_eve_preservicio',tceSimple);
    18 : Result := Carga('eve_fertilidad_macho','sp_fertilidad_macho',tceSimple);
    19 : Result := Carga('eve_identificacion','sp_identificacion',tceSimple);
    20 : Result := Carga('eve_ingreso_servicio','ingreso',tceComplejo);
    21 : Result := Carga('eve_ingreso_toro','ingreso',tceComplejo);
    22 : Result := Carga('eve_medicion_frame','sp_medicion_frame',tceSimple);
    23 : Result := Carga('eve_nacimiento','-',tceSimple);
    24 : Result := Carga('eve_parto','sp_parto_principal',tceComplejo);
    25 : Result := Carga('eve_peso','sp_peso',tceSimple);
    26 : Result := Carga('eve_sincronizacion_celo','sp_deteccion_celo',tceSimple);
    27 : Result := Carga('eve_tratamiento','sp_tratamiento',tceSimple);
    28 : Result := Carga('eve_inseminacion_artificial','sp_eve_inseminacion',tceComplejo);
    30 : Result := Carga('eve_sangrado_brucelosis','sp_sangrado_brucelosis',tceSimple);
    31 : Result := Carga('eve_tuberculinizacion','sp_tuberculinizacion',tceSimple);
    32 : Result := Carga('eve_raspado_toro','sp_raspado_toro',tceSimple);
    36 : Result := Carga('eve_identificacion','sp_reidentificacion',tceSimple);
    39 : Result := Carga('eve_parto_masivo','-',tceComplejo);
    41 : Result := Carga('eve_calidad_carne','sp_calidad_carne',tceSimple);
    44 : Result := Carga('eve_actividad','sp_actividad',tceSimple);
    45 : Result := Carga('eve_suplementacion','sp_suplementacion',tceSimple);
    47 : Result := Carga('eve_flushing','-',tceComplejo);
    48 : Result := Carga('eve_transferencia','-',tceSimple);
    52 : Result := Carga('eve_extraccion_semen','sp_extraccion_semen',tceSimple);
  end;
end;

procedure TFSincroBaseDatos.CargarEventoComplejo(Evento, EstablecimientoPrincipal, EstablecimientoNuevo, Animal : Integer; Tipo : TDatosEvento);
var
  K, I, CE, EveHijo : Integer;
  eve, Semen, Servicio, Hijo, HijoN : Integer;
begin
  ArmarConsultaEvento('eve_eventos',Tipo.Tabla,tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
  ArmarConsultaTabla('eve_eventos',tcInsert,FPrincipal.IBDPrincipal,IBQInsertEveGeneral);
  ArmarConsultaTabla(Tipo.Tabla,tcInsert,FPrincipal.IBDPrincipal,IBQInsertEveParticular);

  IBQConsultaBaseNueva.Close;
  IBQConsultaBaseNueva.Open;
  IBQConsultaBaseNueva.Locate('id_evento',Evento,[]);

  eve := getClavePrimaria('eve_eventos');
  try
    for K := 0 to IBQInsertEveGeneral.Params.Count-1 do
      IBQInsertEveGeneral.ParamByName(IBQInsertEveGeneral.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQInsertEveGeneral.Params[K].Name).Value;
    CargarClavesExternas('eve_eventos','id_evento',EstablecimientoPrincipal,Evento);
    for CE := 0 to Length(ClavesExtranjeras)-1 do
      IBQInsertEveGeneral.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
    IBQInsertEveGeneral.ParamByName('id_evento').AsInteger := eve;
    IBQInsertEveGeneral.ParamByName('animal').AsInteger := Animal;
    IBQInsertEveGeneral.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    raise Exception.Create('No se puede cargar el evento');
    FPrincipal.IBTPrincipal.RollbackRetaining;
    ActualizarEstado('Se generó un inconveniente. No se puede cargar el evento.');
  end;
  if Tipo.Tabla = 'eve_inseminacion_artificial' then
  begin
    try
      for K := 0 to IBQInsertEveParticular.Params.Count-1 do
        IBQInsertEveParticular.ParamByName(IBQInsertEveParticular.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQInsertEveParticular.Params[K].Name).Value;
      CargarClavesExternas(Tipo.Tabla,'id_evento',EstablecimientoPrincipal,Evento);
      for CE := 0 to Length(ClavesExtranjeras)-1 do
        IBQInsertEveParticular.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
      IBQInsertEveParticular.ParamByName('id_evento').AsInteger := eve;
      //IBQInsertEveParticular.ParamByName('servicio').Value := BuscarServicio(IBQConsultaBaseNueva.FieldValues['servicio'],EstablecimientoPrincipal,EstablecimientoNuevo);
      IBQInsertEveParticular.ParamByName('semen').Value := BuscarSemen(IBQConsultaBaseNueva.FieldValues['semen'],EstablecimientoPrincipal,EstablecimientoNuevo);
      IBQInsertEveParticular.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      raise Exception.Create('No se puede cargar el evento');
      FPrincipal.IBTPrincipal.RollbackRetaining;
      ActualizarEstado('Se generó un inconveniente. No se puede cargar el evento.');
    end;
  end;
  if (Tipo.Tabla = 'eve_ingreso_servicio') or (Tipo.Tabla = 'eve_ingreso_toro') or
     (Tipo.Tabla = 'eve_egreso_servicio') or (Tipo.Tabla = 'eve_egreso_toro') then
  begin
    try
      for K := 0 to IBQInsertEveParticular.Params.Count-1 do
        IBQInsertEveParticular.ParamByName(IBQInsertEveParticular.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQInsertEveParticular.Params[K].Name).Value;
      CargarClavesExternas(Tipo.Tabla,'id_evento',EstablecimientoPrincipal,Evento);
      for CE := 0 to Length(ClavesExtranjeras)-1 do
        IBQInsertEveParticular.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
      IBQInsertEveParticular.ParamByName('id_evento').AsInteger := eve;
      //IBQInsertEveParticular.ParamByName('servicio').Value := BuscarServicio(IBQConsultaBaseNueva.FieldValues['servicio'],EstablecimientoPrincipal,EstablecimientoNuevo);
      IBQInsertEveParticular.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      raise Exception.Create('No se puede cargar el evento');
      FPrincipal.IBTPrincipal.RollbackRetaining;
      ActualizarEstado('Se generó un inconveniente. No se puede cargar el evento.');
    end;
  end;
  if (Tipo.Tabla = 'eve_parto') then
  begin
    //Cargo el parto
    try
      for K := 0 to IBQInsertEveParticular.Params.Count-1 do
        IBQInsertEveParticular.ParamByName(IBQInsertEveParticular.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQInsertEveParticular.Params[K].Name).Value;
      CargarClavesExternas(Tipo.Tabla,'id_evento',EstablecimientoPrincipal,Evento);
      for CE := 0 to Length(ClavesExtranjeras)-1 do
        IBQInsertEveParticular.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
      IBQInsertEveParticular.ParamByName('id_evento').AsInteger := eve;
      IBQInsertEveParticular.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      raise Exception.Create('No se puede cargar el evento');
      FPrincipal.IBTPrincipal.RollbackRetaining;
      ActualizarEstado('Se generó un inconveniente. No se puede cargar el evento.');
    end;
    //Busco los datos del Nacimiento
    ArmarConsultaTabla('eve_eventos',tcSelect,IBDBaseNueva,IBQConsultaBaseNuevaAux);
    IBQConsultaBaseNuevaAux.Open;
    IBQConsultaBaseNuevaAux.Locate('disparador;tipo',VarArrayOf([Evento,23]),[]);
    EveHijo := IBQConsultaBaseNuevaAux.FieldValues['id_evento'];
    Hijo := IBQConsultaBaseNuevaAux.FieldValues['animal'];
    ArmarConsultaTabla('tab_animales',tcSelect,IBDBaseNueva,IBQConsultaBaseNuevaAux1);
    ArmarConsultaTabla('tab_animales',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux1);
    IBQConsultaBaseNuevaAux1.Open;
    IBQConsultaBaseNuevaAux1.Locate('id_animal',Hijo,[]);
    HijoN := getClavePrimaria('tab_animales');
    try
      for K := 0 to IBQConsultaBaseViejaAux1.Params.Count -1 do
        IBQConsultaBaseViejaAux1.ParamByName(IBQConsultaBaseViejaAux1.Params[K].Name).Value := IBQConsultaBaseNuevaAux1.FindField(IBQConsultaBaseViejaAux1.Params[K].Name).Value;
      CargarClavesExternas('tab_animales','id_animal',EstablecimientoPrincipal,Hijo);
      for CE := 0 to Length(ClavesExtranjeras) -1 do
        IBQConsultaBaseViejaAux1.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
      IBQConsultaBaseViejaAux1.ParamByName('id_animal').Value := HijoN;
      IBQConsultaBaseViejaAux1.ParamByName('MADRE_BIOLOGICA_EXTERNA').Value := null;
      IBQConsultaBaseViejaAux1.ParamByName('MADRE_BIOLOGICA_INTERNA').Value := null;
      IBQConsultaBaseViejaAux1.ParamByName('MADRE_RECEPTORA_EXTERNA').Value := null;
      IBQConsultaBaseViejaAux1.ParamByName('MADRE_RECEPTORA_INTERNA').Value := null;
      IBQConsultaBaseViejaAux1.ParamByName('PADRE_INTERNO').Value := null;
      IBQConsultaBaseViejaAux1.ParamByName('PADRE_EXTERNO').Value := null;
      IBQConsultaBaseViejaAux1.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
      ActualizarEstado('Se generó un inconveniente. No se puede cargar datos del nacimiento.');
    end;
    CargarEventoHijo(EveHijo,eve,EstablecimientoPrincipal,HijoN,GetDatosEvento(23));
  end;
  if Tipo.Tabla = 'eve_baja' then
  begin
    try
      for K := 0 to IBQInsertEveParticular.Params.Count-1 do
        IBQInsertEveParticular.ParamByName(IBQInsertEveParticular.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQInsertEveParticular.Params[K].Name).Value;
      CargarClavesExternas(Tipo.Tabla,'id_evento',EstablecimientoPrincipal,Evento);
      for CE := 0 to Length(ClavesExtranjeras)-1 do
        IBQInsertEveParticular.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
      IBQInsertEveParticular.ParamByName('id_evento').AsInteger := eve;
      IBQInsertEveParticular.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      raise Exception.Create('No se puede cargar el evento');
      FPrincipal.IBTPrincipal.RollbackRetaining;
      ActualizarEstado('Se generó un inconveniente. No se puede datos de la baja.');
    end;

    try
      IBQBajaAnimal.Close;
      IBQBajaAnimal.ParamByName('estado').Value := 'N';
      IBQBajaAnimal.ParamByName('id').Value := Animal;
      IBQBajaAnimal.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
      ActualizarEstado('Se generó un inconveniente. Animal '+IntToStr(Animal)+', generó inconsistencia.');
    end;
  end;

  CargarEventosDisparados(Evento,eve,EstablecimientoPrincipal,Animal);
end;

procedure TFSincroBaseDatos.CargarEventosDisparados(Evento, Padre, Establecimiento, Animal : Integer);
begin
  IBQEventosHijos.Close;
  IBQEventosHijos.ParamByName('eve').Value := Evento;
  IBQEventosHijos.Open;
  IBQEventosHijos.First;
  while not IBQEventosHijos.Eof do
  begin
    if IBQEventosHijos.FieldValues['tipo'] <> 23 then
      CargarEventoHijo(IBQEventosHijos.FieldValues['id_evento'],Padre,Establecimiento,Animal,GetDatosEvento(IBQEventosHijos.FieldValues['tipo']));
    IBQEventosHijos.Next;
  end;
end;

procedure TFSincroBaseDatos.CargarEventoHijo(Evento, Padre, Establecimiento, Animal : Integer; Tipo : TDatosEvento);
var
  K, I, CE : Integer;
  eve : Integer;
begin

    ArmarConsultaEvento('eve_eventos',Tipo.Tabla,tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
    ArmarConsultaTabla('eve_eventos',tcInsert,FPrincipal.IBDPrincipal,IBQInsertEveGeneral);
    ArmarConsultaTabla(Tipo.Tabla,tcInsert,FPrincipal.IBDPrincipal,IBQInsertEveParticular);

    IBQConsultaBaseNueva.Close;
    IBQConsultaBaseNueva.Open;
    IBQConsultaBaseNueva.Locate('id_evento',Evento,[]);
    eve := getClavePrimaria('eve_eventos');
    try
      for K := 0 to IBQInsertEveGeneral.Params.Count-1 do
        IBQInsertEveGeneral.ParamByName(IBQInsertEveGeneral.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQInsertEveGeneral.Params[K].Name).Value;
      CargarClavesExternas('eve_eventos','id_evento',Establecimiento,Evento);
      for CE := 0 to Length(ClavesExtranjeras)-1 do
        IBQInsertEveGeneral.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
      IBQInsertEveGeneral.ParamByName('id_evento').AsInteger := eve;
      IBQInsertEveGeneral.ParamByName('animal').AsInteger := Animal;
      IBQInsertEveGeneral.ParamByName('disparador').Value := Padre;
      IBQInsertEveGeneral.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      raise Exception.Create('No se puede cargar el evento');
      FPrincipal.IBTPrincipal.RollbackRetaining;
      ActualizarEstado('Se generó un inconveniente. No se puede cargar el evento dependiente.');
    end;
    try
      for K := 0 to IBQInsertEveParticular.Params.Count-1 do
        IBQInsertEveParticular.ParamByName(IBQInsertEveParticular.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQInsertEveParticular.Params[K].Name).Value;
      CargarClavesExternas(Tipo.Tabla,'id_evento',Establecimiento,Evento);
      for CE := 0 to Length(ClavesExtranjeras)-1 do
        IBQInsertEveParticular.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
      IBQInsertEveParticular.ParamByName('id_evento').AsInteger := eve;
      IBQInsertEveParticular.Open;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      raise Exception.Create('No se puede cargar el evento');
      FPrincipal.IBTPrincipal.RollbackRetaining;
      ActualizarEstado('Se generó un inconveniente. No se puede cargar el evento dependiente.');
    end;

    if Tipo.Tabla = 'eve_nacimiento' then
      CargarEventosDisparados(Evento,eve,Establecimiento,Animal);
end;

procedure TFSincroBaseDatos.CargarEventoSimple(Evento, Establecimiento, Animal : Integer; Tipo : TDatosEvento);
var
  K, I, CE : Integer;
  eve : Integer;
begin
  ArmarConsultaEvento('eve_eventos',Tipo.Tabla,tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
  ArmarConsultaTabla('eve_eventos',tcInsert,FPrincipal.IBDPrincipal,IBQInsertEveGeneral);

  ArmarConsultaTabla(Tipo.Tabla,tcInsert,FPrincipal.IBDPrincipal,IBQInsertEveParticular);
  IBQConsultaBaseNueva.Close;
  IBQConsultaBaseNueva.Open;
  IBQConsultaBaseNueva.Locate('id_evento',Evento,[]);
  eve := getClavePrimaria('eve_eventos');
  try
    for K := 0 to IBQInsertEveGeneral.Params.Count-1 do
      IBQInsertEveGeneral.ParamByName(IBQInsertEveGeneral.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQInsertEveGeneral.Params[K].Name).Value;
    CargarClavesExternas('eve_eventos','id_evento',Establecimiento,Evento);
    for CE := 0 to Length(ClavesExtranjeras)-1 do
      IBQInsertEveGeneral.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
    IBQInsertEveGeneral.ParamByName('id_evento').AsInteger := eve;
    IBQInsertEveGeneral.ParamByName('animal').AsInteger := Animal;
    IBQInsertEveGeneral.ParamByName('disparador').Value := null;
    IBQInsertEveGeneral.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    raise Exception.Create('No se puede cargar el evento');
    FPrincipal.IBTPrincipal.RollbackRetaining;
    ActualizarEstado('Se generó un inconveniente. No se puede cargar el evento simple '+IntToStr(Evento)+'...');
  end;

  try
    for K := 0 to IBQInsertEveParticular.Params.Count-1 do
      IBQInsertEveParticular.ParamByName(IBQInsertEveParticular.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQInsertEveParticular.Params[K].Name).Value;
    if Tipo.Tabla = 'eve_extraccion_semen' then
      CargarClavesExternas(Tipo.Tabla,'id_evento_extraccion',Establecimiento,Evento)
    else
      CargarClavesExternas(Tipo.Tabla,'id_evento',Establecimiento,Evento);
    for CE := 0 to Length(ClavesExtranjeras)-1 do
      IBQInsertEveParticular.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
    if Tipo.Tabla = 'eve_extraccion_semen' then
    begin
      IBQInsertEveParticular.ParamByName('id_evento_extraccion').AsInteger := eve;
      IBQInsertEveParticular.ParamByName('id_animal').AsInteger := Animal;
    end
    else
      IBQInsertEveParticular.ParamByName('id_evento').AsInteger := eve;
    IBQInsertEveParticular.Open;

    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    raise Exception.Create('No se puede cargar el evento');
    FPrincipal.IBTPrincipal.RollbackRetaining;
    ActualizarEstado('Se generó un inconveniente. No se puede cargar el evento.');
  end;
  CargarEventosDisparados(Evento,eve,Establecimiento,Animal);

end;

function TFSincroBaseDatos.VerificarEventoNuevo(AnimalN, AnimalV, Tipo, Establecimiento : Integer; fecha : TDate; TipoEve : TDatosEvento) : boolean;
var EsNuevo, MismoEvento, estaAnimal : boolean;
    CE, K : integer;
begin

    IBQAuxEveNuevos.Close;
    IBQAuxEveNuevos.ParamByName('animal').AsInteger := AnimalN;
    IBQAuxEveNuevos.ParamByName('tipo').AsInteger := Tipo;
    IBQAuxEveNuevos.ParamByName('fecha').AsDate := fecha;
    IBQAuxEveNuevos.Open;
    IBQAuxEveNuevos.Last;
    IBQAuxEveNuevos.First;

    IBQAuxEveViejos.Close;
    IBQAuxEveViejos.ParamByName('animal').AsInteger := AnimalV;
    IBQAuxEveViejos.ParamByName('tipo').AsInteger := Tipo;
    IBQAuxEveViejos.ParamByName('fecha').AsDate := fecha;
    IBQAuxEveViejos.Open;
    IBQAuxEveViejos.Last;
    IBQAuxEveViejos.First;

    EsNuevo := false;
    estaAnimal := false;
    MismoEvento := true;

    if ((IBQAuxEveNuevos.RecordCount > IBQAuxEveViejos.RecordCount)) then
    begin
      while (not(IBQAuxEveNuevos.Eof) and (MismoEvento)) do
      begin
           ArmarConsultaEvento('eve_eventos',TipoEve.Tabla,tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
           ArmarConsultaEvento('eve_eventos',TipoEve.Tabla,tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);

           IBQConsultaBaseNueva.Close;
           IBQConsultaBaseNueva.Open;
           IBQConsultaBaseNueva.Locate('id_evento',VarArrayOf([IBQAuxEveNuevos.FieldByName('id_evento').AsInteger]),[]);


           IBQConsultaBaseVieja.Close;
           IBQConsultaBaseVieja.Open;
           IBQConsultaBaseVieja.First;

           CargarClavesExternas('eve_eventos','id_evento',Establecimiento,IBQAuxEveNuevos.FieldByName('id_evento').AsInteger);
           estaAnimal := false;
           while not(IBQConsultaBaseVieja.Eof) do
           begin
              if (IBQConsultaBaseVieja.FieldValues['animal'] = animalV) then
              begin
                  estaAnimal := true;
                  K := 0;
                  while ((MismoEvento) and (K <= IBQConsultaBaseVieja.Fields.Count-1)) do
                  begin
                      CE := 0;
                      while ((MismoEvento) and (CE <= Length(ClavesExtranjeras)-1)) do
                      begin
                        if ((AnsiPos('ID_',IBQConsultaBaseVieja.Fields[K].FieldName) = 0) and (IBQConsultaBaseVieja.Fields[K].FieldName <> '')) then
                          if (IBQConsultaBaseVieja.Fields[K].FieldName = ClavesExtranjeras[CE].Campo) then
                            MismoEvento := IBQConsultaBaseVieja.FieldValues[IBQConsultaBaseNueva.Fields[K].FieldName] = ClavesExtranjeras[CE].Valor
                          else
                            MismoEvento := IBQConsultaBaseNueva.FieldValues[IBQConsultaBaseNueva.Fields[K].FieldName] = IBQConsultaBaseVieja.FieldValues[IBQConsultaBaseNueva.Fields[K].FieldName];
                        Inc(CE);
                      end;
                      Inc(K);
                  end;
              end;
              IBQConsultaBaseVieja.Next;
           end;

           IBQAuxEveNuevos.Next;
      end;
    end
    else
    begin
        estaAnimal := true;
        MismoEvento := true;
        EsNuevo := false;
    end;

    if (estaAnimal) then
    begin
      if not(MismoEvento) then
      begin
        EsNuevo := true;
      end;
    end
    else
        EsNuevo := true;

    Result := EsNuevo;
end;

procedure TFSincroBaseDatos.SincroEventos(EstablecimientoPrincipal, EstablecimientoNuevo, AnimalPrincipal, AnimalNuevo : Integer);
var nroEvento : integer;
    Tipo : TDatosEvento;
begin
  IBQEventosNuevos.Close;
  IBQEventosNuevos.ParamByName('animal').AsInteger := AnimalNuevo;
  IBQEventosNuevos.Open;

  IBQEventosViejos.Close;
  IBQEventosViejos.ParamByName('animal').AsInteger := AnimalPrincipal;
  IBQEventosViejos.Open;

  IBQEventosNuevos.First;
  ActualizarEstado('Sincronizando Eventos del Animal...');
  nroEvento := 0;

  while not IBQEventosNuevos.Eof do
  begin
    Inc(nroEvento);
    ActualizarEstado('Sincronizando Evento Nro '+IntToStr(nroEvento)+' del Animal... Animal Entra: '+IntToStr(AnimalNuevo)+' - Animal Esta: '+IntToStr(AnimalPrincipal));
    Tipo := GetDatosEvento(IBQEventosNuevos.FieldValues['tipo']);
    if VerificarEventoNuevo(AnimalNuevo,AnimalPrincipal,IBQEventosNuevos.FieldValues['tipo'],EstablecimientoNuevo,IBQEventosNuevos.FieldValues['fecha'],Tipo) then
    begin
      if Tipo.Proc <> '-' then
        case Tipo.Tipo of
          tceComplejo : CargarEventoComplejo(IBQEventosNuevos.FieldValues['id_evento'],EstablecimientoPrincipal,EstablecimientoNuevo,AnimalPrincipal,Tipo);
          tceSimple : CargarEventoSimple(IBQEventosNuevos.FieldValues['id_evento'],EstablecimientoPrincipal,AnimalPrincipal,Tipo);
        end;

      if (Tipo.Tabla = 'eve_cambio_ubicacion') then
      begin
          try
           IBQCambioUbicEstable.Close;
           IBQCambioUbicEstable.ParamByName('animal').AsInteger := AnimalPrincipal;
           IBQCambioUbicEstable.Open;

           if not(IBQCambioUbicEstable.IsEmpty) then
           begin
                IBQAuxEveCU.Close;
                IBQAuxEveCU.ParamByName('esta').AsInteger := IBQCambioUbicEstable.FieldValues['establecimiento'];
                IBQAuxEveCU.ParamByName('potrero').AsInteger := IBQCambioUbicEstable.FieldValues['potrero'];
                IBQAuxEveCU.ParamByName('rodeo').AsInteger := IBQCambioUbicEstable.FieldValues['rodeo'];
                IBQAuxEveCU.ParamByName('animal').AsInteger := AnimalPrincipal;
                IBQAuxEveCU.Open;
           end;

            FPrincipal.IBTPrincipal.CommitRetaining;
          except
            FPrincipal.IBTPrincipal.RollbackRetaining;
            ActualizarEstado('Se generó un inconveniente. No se puede cargar el evento CU.');
          end;
      end;
    end;
    IBQEventosNuevos.Next;
  end;
end;

procedure TFSincroBaseDatos.BuscarAnimalSemen(Semen, EstablecimientoPrincipal, EstablecimientoNuevo : Integer; var Id : Integer; var Tipo : String);
var
  Animal : Integer;
begin
  IBQGetAnimalesSemen.Close;
  IBQGetAnimalesSemen.ParamByName('id').AsInteger := Semen;
  IBQGetAnimalesSemen.Open;
  if IBQGetAnimalesSemen.FieldValues['animal'] <> null then
  begin
    Animal := IBQGetAnimalesSemen.FieldValues['animal'];
    IBQAnimalesNuevo.Close;
    IBQAnimalesNuevo.Open;
    IBQAnimalesNuevo.Locate('id_animal',Animal,[]);
    IBQAnimalesViejo.Close;
    IBQAnimalesViejo.Open;
    if not IBQAnimalesViejo.Locate('id_rp;fecha_nacimiento;sexo',VarArrayOf([IBQAnimalesNuevo.FieldValues['id_rp'],IBQAnimalesNuevo.FieldValues['fecha_nacimiento'],IBQAnimalesNuevo.FieldValues['sexo']]),[]) then
      Id := CrearAnimal(Animal,EstablecimientoPrincipal,EstablecimientoNuevo)
    else
      Id := IBQAnimalesViejo.FieldValues['id_animal'];
    Tipo := 'I';
  end;
  if IBQGetAnimalesSemen.FieldValues['animal_externo'] <> null then
  begin
    Animal := IBQGetAnimalesSemen.FieldValues['animal_externo'];
    IBQAnimalesExtNueva.Close;
    IBQAnimalesExtNueva.Open;
    IBQAnimalesExtNueva.Locate('id_animal_externo',Animal,[]);

    IBQAnimalesExtVieja.Close;
    IBQAnimalesExtVieja.Open;
    IBQAnimalesExtVieja.Locate('id_rp;fecha_nacimiento;sexo',
      VarArrayOf([IBQAnimalesExtNueva.FieldValues['id_rp'],IBQAnimalesExtNueva.FieldValues['fecha_nacimiento'],IBQAnimalesExtNueva.FieldValues['sexo']]),[]);

    Id := IBQAnimalesExtVieja.FieldValues['id_animal_externo'];
    Tipo := 'E';
  end;
end;

procedure TFSincroBaseDatos.ActualizarDatosSemen(EstablecimientoPrincipal, EstablecimientoNuevo : Integer);
var
  CE, K, Animal : Integer;
  IdS, IdE : Integer;
  Tipo : String;
begin
  //Carga de animales externos
  ArmarConsultaTabla('tab_animales_externos',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
  ArmarConsultaTabla('tab_animales_externos',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
  ArmarConsultaTabla('tab_animales_externos',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseNuevaAux);
  IBQConsultaBaseNueva.Open;
  IBQConsultaBaseNuevaAux.Open;
  IBQConsultaBaseNueva.First;
  while not IBQConsultaBaseNueva.Eof do
  begin
    if IBQConsultaBaseNueva.FieldValues['establecimiento'] = EstablecimientoNuevo then
    begin
      if not IBQConsultaBaseNuevaAux.Locate('id_rp;fecha_nacimiento;sexo',
        VarArrayOf([IBQConsultaBaseNueva.FieldValues['id_rp'],IBQConsultaBaseNueva.FieldValues['fecha_nacimiento'],IBQConsultaBaseNueva.FieldValues['sexo']]),[]) then
      begin
        IBQConsultaBaseVieja.Close;
        Animal := getClavePrimaria('tab_animales_externos');
        try
          for K := 0 to IBQConsultaBaseVieja.Params.Count-1 do
            IBQConsultaBaseVieja.ParamByName(IBQConsultaBaseVieja.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQConsultaBaseVieja.Params[K].Name).Value;
          CargarClavesExternas('tab_animales_externos','id_animal_externo',EstablecimientoPrincipal,IBQConsultaBaseNueva.FieldValues['id_animal_externo']);
          for CE := 0 to Length(ClavesExtranjeras)-1 do
            IBQConsultaBaseVieja.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
          IBQConsultaBaseVieja.ParamByName('id_animal_externo').Value := Animal;
          IBQConsultaBaseVieja.ParamByName('establecimiento').Value := EstablecimientoPrincipal;
          IBQConsultaBaseVieja.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
          ActualizarEstado('Se generó un inconveniente. No se puede actualizar datos de semen.');
        end;
      end;
    end;
    IBQConsultaBaseNueva.Next;
  end;
  ///////////////////////////////
  //Cargar Semen
  ArmarConsultaTabla('tab_semen',tcSelect,IBDBaseNueva,IBQAuxSS);
  ArmarConsultaTabla('tab_semen',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
  ArmarConsultaTabla('tab_semen',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux1);
  ArmarConsultaTabla('eve_movimiento_semen',tcSelect,IBDBaseNueva,IBQAuxSSAux);
  ArmarConsultaTabla('eve_movimiento_semen',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux2);
  ArmarConsultaTabla('eve_movimiento_semen',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux);
  IBQConsultaBaseViejaAux1.Open;
  IBQAuxSS.Open;
  IBQAuxSSAux.Open;
  IBQConsultaBaseViejaAux2.Open;
  IBQAuxSS.First;
  while not IBQAuxSS.Eof do
  begin
    if IBQAuxSS.FieldValues['establecimiento'] = EstablecimientoNuevo then
    begin
      BuscarAnimalSemen(IBQAuxSS.FieldValues['id_semen'],EstablecimientoPrincipal,EstablecimientoNuevo,Animal,Tipo);
      if Tipo = 'I' then
      begin
        if not IBQConsultaBaseViejaAux1.Locate('animal',Animal,[]) then
        begin
          try
            IBQConsultaBaseVieja.Close;
            IdS := getClavePrimaria('tab_semen');
            for K := 0 to IBQConsultaBaseVieja.Params.Count-1 do
            begin
              try
                IBQConsultaBaseVieja.ParamByName(IBQConsultaBaseVieja.Params[K].Name).Value := IBQAuxSS.FieldValues[IBQConsultaBaseVieja.Params[K].Name];
              except
              end;
            end;
            IBQConsultaBaseVieja.ParamByName('id_semen').Value := IdS;
            IBQConsultaBaseVieja.ParamByName('animal').Value := Animal;
            IBQConsultaBaseVieja.ParamByName('establecimiento').Value := EstablecimientoPrincipal;
            IBQConsultaBaseVieja.Open;
            FPrincipal.IBTPrincipal.CommitRetaining;
          except
            FPrincipal.IBTPrincipal.RollbackRetaining;
            ActualizarEstado('Se generó un inconveniente. No se puede cargar datos de semen interno.');
          end;
        end
        else
          //buscar semen animal
          IdS := IBQConsultaBaseViejaAux1.FieldValues['id_semen'];

        IBQAuxSSAux.First;

        //sincro movimientos
        while not IBQAuxSSAux.Eof do
        begin
          if IBQAuxSSAux.FieldValues['semen'] = IBQAuxSS.FieldValues['id_semen'] then
          begin
            IBQConsultaBaseViejaAux.Close;
            if not IBQConsultaBaseViejaAux2.Locate('cantidad;fecha;tipo',
              VarArrayOf([IBQAuxSSAux.FieldValues['cantidad'],IBQAuxSSAux.FieldValues['fecha'],IBQAuxSSAux.FieldValues['tipo']]),[]) then
            begin
              try
                IdE := getClavePrimaria('eve_movimiento_semen');
                for K := 0 to IBQConsultaBaseViejaAux.Params.Count-1 do
                  IBQConsultaBaseViejaAux.ParamByName(IBQConsultaBaseViejaAux.Params[K].Name).Value := IBQAuxSSAux.FindField(IBQConsultaBaseViejaAux.Params[K].Name).Value;
                CargarClavesExternas('eve_movimiento_semen','id_evento',EstablecimientoPrincipal,IdS);
                for CE := 0 to Length(ClavesExtranjeras)-1 do
                  IBQConsultaBaseViejaAux.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
                IBQConsultaBaseViejaAux.ParamByName('id_evento').Value := IdE;
                IBQConsultaBaseViejaAux.ParamByName('semen').Value := IdS;
                IBQConsultaBaseViejaAux.Open;
                Fprincipal.IBTPrincipal.CommitRetaining;
              except
                FPrincipal.IBTPrincipal.RollbackRetaining;
                ActualizarEstado('Se generó un inconveniente. No se puede cargar datos de semen interno.');
              end;
            end;
          end;
          IBQAuxSSAux.Next;
        end;

        //sincro termo
       // SincronizarTabTermo(IdS);
      end;
      if Tipo = 'E' then
        if not IBQConsultaBaseViejaAux1.Locate('animal_externo',Animal,[]) then
        begin
          try
            IBQConsultaBaseVieja.Close;
            IdS := getClavePrimaria('tab_semen');
            for K := 0 to IBQConsultaBaseVieja.Params.Count-1 do
              IBQConsultaBaseVieja.ParamByName(IBQConsultaBaseVieja.Params[K].Name).Value := IBQAuxSS.FindField(IBQConsultaBaseVieja.Params[K].Name).Value;
            IBQConsultaBaseVieja.ParamByName('id_semen').Value := IdS;
            IBQConsultaBaseVieja.ParamByName('animal_externo').Value := Animal;
            IBQConsultaBaseVieja.ParamByName('establecimiento').Value := EstablecimientoPrincipal;
            IBQConsultaBaseVieja.Open;
            FPrincipal.IBTPrincipal.CommitRetaining;
            IBQConsultaBaseViejaAux.Close;
            IdE := getClavePrimaria('eve_movimiento_semen');
            for K := 0 to IBQConsultaBaseViejaAux.Params.Count-1 do
              IBQConsultaBaseViejaAux.ParamByName(IBQConsultaBaseViejaAux.Params[K].Name).Value := IBQAuxSSAux.FindField(IBQConsultaBaseViejaAux.Params[K].Name).Value;
            CargarClavesExternas('eve_movimiento_semen','id_evento',EstablecimientoPrincipal,IBQAuxSSAux.FieldValues['id_evento']);
            for CE := 0 to Length(ClavesExtranjeras)-1 do
              IBQConsultaBaseViejaAux.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
            IBQConsultaBaseViejaAux.ParamByName('id_evento').Value := IdE;
            IBQConsultaBaseViejaAux.ParamByName('semen').Value := IdS;
            IBQConsultaBaseViejaAux.Open;
            FPrincipal.IBTPrincipal.CommitRetaining;
          except
            FPrincipal.IBTPrincipal.RollbackRetaining;
            ActualizarEstado('Se generó un inconveniente. No se puede cargar datos de semen externo.');
          end;
        end;
    end;
    IBQAuxSS.Next;
  end;
end;

procedure TFSincroBaseDatos.SincronizarTabTermo(IdS : integer);
var K : integer;
begin
  ArmarConsultaTabla('tab_stock_semen_termo',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux);
  ArmarConsultaTabla('tab_stock_semen_termo',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
  ArmarConsultaTabla('tab_stock_semen_termo',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
  IBQConsultaBaseViejaAux.Open;
  IBQConsultaBaseNueva.Open;
  IBQConsultaBaseNueva.First;

  while not IBQConsultaBaseNueva.Eof do
  begin
       if (IBQConsultaBaseNueva.FieldValues['id_eve_extraccion_semen'] = IdS) then
       begin
            if (IBQConsultaBaseNueva.FieldValues['partida'] <> 'No Definida') then
            begin
                 if not(IBQConsultaBaseViejaAux.Locate('partida',IBQConsultaBaseNueva.FieldValues['partida'],[])) then
                 begin
                   try
                      IBQConsultaBaseVieja.Close;
                      for K := 0 to IBQConsultaBaseVieja.Params.Count-1 do
                        IBQConsultaBaseVieja.ParamByName(IBQConsultaBaseVieja.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQConsultaBaseVieja.Params[K].Name).Value;
                      IBQConsultaBaseVieja.ParamByName('id_eve_extraccion_semen').Value := IdS;
                      IBQConsultaBaseVieja.Open;

                      FPrincipal.IBTPrincipal.CommitRetaining;
                   except
                      FPrincipal.IBTPrincipal.RollbackRetaining;
                   end;
                 end;
            end
            else
            begin
                   try
                      IBQConsultaBaseVieja.Close;
                      for K := 0 to IBQConsultaBaseVieja.Params.Count-1 do
                        IBQConsultaBaseVieja.ParamByName(IBQConsultaBaseVieja.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQConsultaBaseVieja.Params[K].Name).Value;
                      IBQConsultaBaseVieja.ParamByName('id_eve_extraccion_semen').Value := IdS;
                      IBQConsultaBaseVieja.Open;

                      FPrincipal.IBTPrincipal.CommitRetaining;
                   except
                      FPrincipal.IBTPrincipal.RollbackRetaining;
                   end;
            end;
       end;
       IBQConsultaBaseNueva.Next;
  end;
end;

procedure TFSincroBaseDatos.CargarGrupos(EstablecimientoPrincipal, EstablecimientoNuevo : Integer);
var
  grupo, K : Integer;
begin
  ArmarConsultaTabla('tab_grupos',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
  ArmarConsultaTabla('tab_grupos',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
  ArmarConsultaTabla('tab_grupos',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux);
  IBQConsultaBaseNueva.Open;
  IBQConsultaBaseViejaAux.Open;
  IBQConsultaBaseNueva.First;
  while not IBQConsultaBaseNueva.Eof do
  begin
    if IBQConsultaBaseNueva.FieldValues['establecimiento'] = EstablecimientoNuevo then
    begin
      IBQConsultaBaseViejaAux.Close;
      IBQConsultaBaseViejaAux.Open;
      if not IBQConsultaBaseViejaAux.Locate('nombre;descripcion;establecimiento',
        VarArrayOf([IBQConsultaBaseNueva.FieldValues['nombre'],IBQConsultaBaseNueva.FieldValues['descripcion'],EstablecimientoPrincipal]),[]) then
      begin
        try
          grupo := getClavePrimaria('tab_grupos');
          IBQConsultaBaseVieja.Close;
          for K := 0 to IBQConsultaBaseVieja.Params.Count-1 do
            IBQConsultaBaseVieja.ParamByName(IBQConsultaBaseVieja.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQConsultaBaseVieja.Params[K].Name).Value;
          IBQConsultaBaseVieja.ParamByName('establecimiento').AsInteger := EstablecimientoPrincipal;
          IBQConsultaBaseVieja.ParamByName('id_grupo').AsInteger := grupo;
          IBQConsultaBaseVieja.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
          ActualizarEstado('Se generó un inconveniente. No se puede cargar datos de grupo.');
        end;
      end;
    end;
    IBQConsultaBaseNueva.Next;
  end;
end;

function TFSincroBaseDatos.BuscarGrupo(Grupo, EstablecimientoPrincipal, EstablecimientoNuevo : Integer) : Integer;
begin
  ArmarConsultaTabla('tab_grupos',tcSelect,IBDBaseNueva,IBQConsultaBaseNuevaAux1);
  ArmarConsultaTabla('tab_grupos',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux1);
  IBQConsultaBaseNuevaAux1.Open;
  IBQConsultaBaseViejaAux1.Open;
  IBQConsultaBaseNuevaAux1.Locate('id_grupo;establecimiento',VarArrayOf([Grupo,EstablecimientoNuevo]),[]);
  Result := IBQConsultaBaseViejaAux1.Lookup('establecimiento;nombre;descripcion',
    VarArrayOf([EstablecimientoPrincipal,IBQConsultaBaseNuevaAux1.FieldValues['nombre'],IBQConsultaBaseNuevaAux1.FieldValues['descripcion']]),'id_grupo');
end;

procedure TFSincroBaseDatos.CargarServicios(EstablecimientoPrincipal, EstablecimientoNuevo : Integer);
var
  servicio, K, CE : Integer;
begin
  ArmarConsultaTabla('tab_servicios',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
  ArmarConsultaTabla('tab_servicios',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
  ArmarConsultaTabla('tab_servicios',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux);
  IBQConsultaBaseNueva.Open;
  IBQConsultaBaseViejaAux.Open;
  IBQConsultaBaseNueva.First;
  while not IBQConsultaBaseNueva.Eof do
  begin
    if IBQConsultaBaseNueva.FieldValues['establecimiento'] = EstablecimientoNuevo then
    begin
      IBQConsultaBaseViejaAux.Close;
      IBQConsultaBaseViejaAux.Open;
      if not IBQConsultaBaseViejaAux.Locate('nombre;fecha_inicio;fecha_fin;establecimiento',
        VarArrayOf([IBQConsultaBaseNueva.FieldValues['nombre'],IBQConsultaBaseNueva.FieldValues['fecha_inicio'],IBQConsultaBaseNueva.FieldValues['fecha_fin'],EstablecimientoPrincipal]),[]) then
      begin
        try
          servicio := getClavePrimaria('tab_servicios');
          IBQConsultaBaseVieja.Close;
          for K := 0 to IBQConsultaBaseVieja.Params.Count-1 do
            IBQConsultaBaseVieja.ParamByName(IBQConsultaBaseVieja.Params[K].Name).Value := IBQConsultaBaseNueva.FindField(IBQConsultaBaseVieja.Params[K].Name).Value;
          CargarClavesExternas('tab_servicios','id_servicio',EstablecimientoPrincipal,IBQConsultaBaseNueva.FieldValues['id_servicio']);
          for CE := 0 to Length(ClavesExtranjeras)-1 do
            IBQConsultaBaseVieja.ParamByName(ClavesExtranjeras[CE].Campo).Value := ClavesExtranjeras[CE].Valor;
          IBQConsultaBaseVieja.ParamByName('establecimiento').AsInteger := EstablecimientoPrincipal;
          IBQConsultaBaseVieja.ParamByName('grupo').Value := BuscarGrupo(IBQConsultaBaseNueva.FieldValues['grupo'],EstablecimientoPrincipal,EstablecimientoNuevo);
          IBQConsultaBaseVieja.ParamByName('id_servicio').AsInteger := servicio;
          IBQConsultaBaseVieja.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
          ActualizarEstado('Se generó un inconveniente. No se puede cargar datos de servicio.');
        end;
      end;
    end;
    IBQConsultaBaseNueva.Next;
  end;
end;

function TFSincroBaseDatos.BuscarSemen(Semen, EstablecimientoPrincipal, EstablecimientoNuevo : Integer) : Integer;
var
  Animal : Integer;
  Tipo : String;
begin
  ArmarConsultaTabla('tab_semen',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux1);
  BuscarAnimalSemen(Semen,EstablecimientoPrincipal,EstablecimientoNuevo,Animal,Tipo);
  IBQConsultaBaseViejaAux1.Open;
  if Tipo = 'E' then
    Result := IBQConsultaBaseViejaAux1.Lookup('animal_externo',VarArrayOf([Animal]),'id_semen');
  if Tipo = 'I' then
    Result := IBQConsultaBaseViejaAux1.Lookup('animal',VarArrayOf([Animal]),'id_semen');
end;

function TFSincroBaseDatos.BuscarServicio(Servicio, EstablecimientoPrincipal, EstablecimientoNuevo : Integer) : Integer;
begin
  ArmarConsultaTabla('tab_servicios',tcSelect,IBDBaseNueva,IBQConsultaBaseNuevaAux1);
  ArmarConsultaTabla('tab_servicios',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux1);
  IBQConsultaBaseNuevaAux1.Open;
  IBQConsultaBaseViejaAux1.Open;
  IBQConsultaBaseNuevaAux1.Locate('id_servicio',Servicio,[]);
  Result := IBQConsultaBaseViejaAux1.Lookup('establecimiento;nombre;fecha_inicio;fecha_fin',
    VarArrayOf([IBQConsultaBaseNuevaAux1.FieldValues['establecimiento'],IBQConsultaBaseNuevaAux1.FieldValues['nombre'],IBQConsultaBaseNuevaAux1.FieldValues['fecha_inicio'],
                IBQConsultaBaseNuevaAux1.FieldValues['fecha_fin']]),'id_servicio');
end;

function TFSincroBaseDatos.BuscarAnimal(Animal, EstablecimientoPrincipal, EstablecimientoNuevo : Integer; Tipo : String) : Integer;
var
  Res : Variant;
begin
  if Tipo = 'I' then
  begin
    IBQAnimalesNuevo.Close;
    IBQAnimalesNuevo.Open;

    IBQAnimalesViejo.Close;
    IBQAnimalesViejo.Open;

    if IBQAnimalesNuevo.Locate('id_animal',Animal,[]) then
      Res := IBQAnimalesViejo.Lookup('id_rp;sexo;fecha_nacimiento',
                VarArrayOf([IBQAnimalesNuevo.FieldValues['id_rp'],IBQAnimalesNuevo.FieldValues['sexo'],IBQAnimalesNuevo['fecha_nacimiento']]),'id_animal');
    if Res <> null then
      Result := Res
    else
      Result := -1;
  end;
  if Tipo = 'E' then
  begin
    IBQAnimalesExtNueva.Close;
    IBQAnimalesExtNueva.Open;

    IBQAnimalesExtVieja.Close;
    IBQAnimalesExtVieja.Open;

    if IBQAnimalesExtNueva.Locate('id_animal_externo',Animal,[]) then
      Res := IBQAnimalesExtVieja.Lookup('id_rp;sexo;fecha_nacimiento;nombre',
                VarArrayOf([IBQAnimalesExtNueva.FieldValues['id_rp'],IBQAnimalesExtNueva.FieldValues['sexo'],IBQAnimalesExtNueva.FieldValues['fecha_nacimiento'],IBQAnimalesExtNueva['nombre']]),
                'id_animal_externo');
    if Res <> null then
      Result := Res
    else
      Result := -1;
  end;
end;

procedure TFSincroBaseDatos.CargarGenealogia(Animal, EstablecimientoPrincipal, EstablecimientoNuevo : Integer);
var AnimalP, Padre : Integer;
    AnimalMB, MadreB : integer;
    CE, nroPadresMadres : integer;
begin
  //Animales Externos
  //Madres
  nroPadresMadres := 0;
  ActualizarEstado('Sincronizando Madres Externas de Animales...');

  ArmarConsultaTabla('rel_animales_madres_ext',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
  ArmarConsultaTabla('rel_animales_madres_ext',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
  ArmarConsultaTabla('rel_animales_madres_ext',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux2);
  IBQConsultaBaseNueva.Open;
  IBQConsultaBaseViejaAux2.Open;
  while not IBQConsultaBaseNueva.Eof do
  begin
    Inc(nroPadresMadres);
    ActualizarEstado('Sincronizando Madre Externa Nro '+IntToStr(nroPadresMadres)+' ...');
    AnimalP := BuscarAnimal(IBQConsultaBaseNueva.FieldValues['id_hijo'],EstablecimientoPrincipal,EstablecimientoNuevo,'E');
    Padre := BuscarAnimal(IBQConsultaBaseNueva.FieldValues['id_madre'],EstablecimientoPrincipal,EstablecimientoNuevo,'E');
    if ((Padre <> 0) and (AnimalP <> 0)) then
    begin
        if not IBQConsultaBaseViejaAux2.Locate('id_hijo;id_madre;establecimiento',VarArrayOf([AnimalP,Padre,EstablecimientoPrincipal]),[]) then
        begin
          if IBQConsultaBaseNueva.FieldValues['establecimiento'] = EstablecimientoNuevo then
          begin
            try
              IBQConsultaBaseVieja.Close;

              IBQConsultaBaseVieja.ParamByName('id_madre').Value := Padre;
              IBQConsultaBaseVieja.ParamByName('id_hijo').Value := AnimalP;
              IBQConsultaBaseVieja.ParamByName('establecimiento').Value := EstablecimientoPrincipal;
              IBQConsultaBaseVieja.Open;
              Fprincipal.IBTPrincipal.CommitRetaining;

              ArmarConsultaTabla('rel_animales_madres_ext',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux2);
              IBQConsultaBaseViejaAux2.Open;
            except
              FPrincipal.IBTPrincipal.RollbackRetaining;
              ActualizarEstado('Se generó un inconveniente. No se puede carga madre externa '+IntToStr(nroPadresMadres)+' ...');
            end;
          end;
        end;
    end;
    IBQConsultaBaseNueva.Next;
  end;
  //Padres
  nroPadresMadres := 0;
  ActualizarEstado('Sincronizando Padres Externos de Animales...');

  ArmarConsultaTabla('rel_animales_padres_ext',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
  ArmarConsultaTabla('rel_animales_padres_ext',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
  ArmarConsultaTabla('rel_animales_padres_ext',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux2);
  IBQConsultaBaseNueva.Open;
  IBQConsultaBaseViejaAux2.Open;
  while not IBQConsultaBaseNueva.Eof do
  begin
    Inc(nroPadresMadres);
    ActualizarEstado('Sincronizando Padre Externo Nro '+IntToStr(nroPadresMadres)+' ...');

    AnimalP := BuscarAnimal(IBQConsultaBaseNueva.FieldValues['id_hijo'],EstablecimientoPrincipal,EstablecimientoNuevo,'E');
    Padre := BuscarAnimal(IBQConsultaBaseNueva.FieldValues['id_padre'],EstablecimientoPrincipal,EstablecimientoNuevo,'E');
    if ((Padre <> 0) and (AnimalP <> 0)) then
    begin
        if not IBQConsultaBaseViejaAux2.Locate('id_hijo;id_padre;establecimiento',VarArrayOf([AnimalP,Padre,EstablecimientoPrincipal]),[]) then
        begin
          if IBQConsultaBaseNueva.FieldValues['establecimiento'] = EstablecimientoNuevo then
          begin
            try
              IBQConsultaBaseVieja.Close;

              IBQConsultaBaseVieja.ParamByName('id_padre').Value := Padre;
              IBQConsultaBaseVieja.ParamByName('id_hijo').Value := AnimalP;
              IBQConsultaBaseVieja.ParamByName('establecimiento').Value := EstablecimientoPrincipal;
              IBQConsultaBaseVieja.Open;
              Fprincipal.IBTPrincipal.CommitRetaining;

              ArmarConsultaTabla('rel_animales_padres_ext',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux2);
              IBQConsultaBaseViejaAux2.Open;
            except
              FPrincipal.IBTPrincipal.RollbackRetaining;
              ActualizarEstado('Se generó un inconveniente. No se puede carga padre externo '+IntToStr(nroPadresMadres)+' ...');
            end;
          end;
        end;
    end;
    IBQConsultaBaseNueva.Next;
  end;
  //Cargar Padres Internos
  nroPadresMadres := 0;
  ActualizarEstado('Sincronizando Padres Internos de Animales...');

  ArmarConsultaTabla('rel_padres_internos',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
  ArmarConsultaTabla('rel_padres_internos',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
  ArmarConsultaTabla('rel_padres_internos',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux2);
  IBQConsultaBaseNueva.Open;
  IBQConsultaBaseViejaAux2.Open;
  while not IBQConsultaBaseNueva.Eof do
  begin
    Inc(nroPadresMadres);
    ActualizarEstado('Sincronizando Padre Interno Nro '+IntToStr(nroPadresMadres)+' ...');

    AnimalP := BuscarAnimal(IBQConsultaBaseNueva.FieldValues['animal'],EstablecimientoPrincipal,EstablecimientoNuevo,'I');
    Padre := BuscarAnimal(IBQConsultaBaseNueva.FieldValues['padre_interno'],EstablecimientoPrincipal,EstablecimientoNuevo,'I');
    if ((Padre <> 0) and (AnimalP <> 0)) then
    begin
        if not IBQConsultaBaseViejaAux2.Locate('animal;padre_interno;establecimiento',VarArrayOf([AnimalP,Padre,EstablecimientoPrincipal]),[]) then
        begin
          if IBQConsultaBaseNueva.FieldValues['establecimiento'] = EstablecimientoNuevo then
          begin
            try
              IBQConsultaBaseVieja.Close;
              IBQConsultaBaseVieja.ParamByName('padre_interno').Value := Padre;
              IBQConsultaBaseVieja.ParamByName('animal').Value := AnimalP;
              IBQConsultaBaseVieja.ParamByName('establecimiento').Value := EstablecimientoPrincipal;
              IBQConsultaBaseVieja.Open;
              Fprincipal.IBTPrincipal.CommitRetaining;

              ArmarConsultaTabla('rel_padres_internos',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux2);
              IBQConsultaBaseViejaAux2.Open;
            except
              FPrincipal.IBTPrincipal.RollbackRetaining;
              ActualizarEstado('Se generó un inconveniente. No se puede carga padre interno '+IntToStr(nroPadresMadres)+' ...');
            end;
          end;
        end;
    end;
    IBQConsultaBaseNueva.Next;
  end;         
  //Cargar Padres Externos
  nroPadresMadres := 0;
  ActualizarEstado('Sincronizando Padres de Animales...');

  ArmarConsultaTabla('rel_padres_externos',tcSelect,IBDBaseNueva,IBQConsultaBaseNueva);
  ArmarConsultaTabla('rel_padres_externos',tcInsert,FPrincipal.IBDPrincipal,IBQConsultaBaseVieja);
  ArmarConsultaTabla('rel_padres_externos',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux2);
  IBQConsultaBaseNueva.Open;
  IBQConsultaBaseViejaAux2.Open;
  while not IBQConsultaBaseNueva.Eof do
  begin
    Inc(nroPadresMadres);
    ActualizarEstado('Sincronizando Padre Nro '+IntToStr(nroPadresMadres)+' ...');

    AnimalP := BuscarAnimal(IBQConsultaBaseNueva.FieldValues['animal'],EstablecimientoPrincipal,EstablecimientoNuevo,'I');
    Padre := BuscarAnimal(IBQConsultaBaseNueva.FieldValues['padre_externo'],EstablecimientoPrincipal,EstablecimientoNuevo,'E');
    if ((Padre <> 0) and (AnimalP <> 0)) then
    begin
        CargarClavesExternas('rel_padres_externos','animal',EstablecimientoPrincipal,IBQConsultaBaseNueva.FieldValues['animal']);
        for CE := 0 to Length(ClavesExtranjeras)-1 do
        begin
             if (ClavesExtranjeras[CE].Campo = 'PADRE_EXTERNO') then
                Padre := ClavesExtranjeras[CE].Valor;
        end;

        if not IBQConsultaBaseViejaAux2.Locate('animal;padre_externo;establecimiento',VarArrayOf([AnimalP,Padre,EstablecimientoPrincipal]),[]) then
        begin
          if IBQConsultaBaseNueva.FieldValues['establecimiento'] = EstablecimientoNuevo then
          begin
            try
              IBQConsultaBaseVieja.Close;

              IBQConsultaBaseVieja.ParamByName('padre_externo').Value := Padre;
              IBQConsultaBaseVieja.ParamByName('animal').Value := AnimalP;
              IBQConsultaBaseVieja.ParamByName('establecimiento').Value := EstablecimientoPrincipal;
              IBQConsultaBaseVieja.Open;
              Fprincipal.IBTPrincipal.CommitRetaining;

              ArmarConsultaTabla('rel_padres_externos',tcSelect,FPrincipal.IBDPrincipal,IBQConsultaBaseViejaAux2);
              IBQConsultaBaseViejaAux2.Open;
            except
              FPrincipal.IBTPrincipal.RollbackRetaining;
              ActualizarEstado('Se generó un inconveniente. No se puede carga padre externo'+IntToStr(nroPadresMadres)+' ...');
            end;
          end;
        end;
    end;
    IBQConsultaBaseNueva.Next;
  end;
  //Cargar Madres
  //Madre Biologica Interna

  nroPadresMadres := 0;
  ActualizarEstado('Sincronizando Madres Biológicas Internas de Animales...');

  IBQMBI.Close;
  IBQMBI.ParamByName('esta').Value := EstablecimientoNuevo;
  IBQMBI.Open;
  IBQMBI.First;
  IBQUpdateMadre.Close;
  IBQUpdateMadre.SQL.Clear;
  IBQUpdateMadre.SQL.Add('update tab_animales set madre_biologica_interna = :madre where id_animal = :animal');
  while not IBQMBI.Eof do
  begin
    Inc(nroPadresMadres);
    ActualizarEstado('Sincronizando Madre Biológica Interna Nro '+IntToStr(nroPadresMadres)+' ...');

    AnimalMB := BuscarAnimal(IBQMBI.FieldValues['id_animal'],EstablecimientoPrincipal,EstablecimientoNuevo,'I');
    MadreB := BuscarAnimal(IBQMBI.FieldValues['madre_biologica_interna'],EstablecimientoPrincipal,EstablecimientoNuevo,'I');
    if ((MadreB <> 0) and (AnimalMB <> 0)) then
    begin
        try
          IBQUpdateMadre.Close;
          IBQUpdateMadre.ParamByName('madre').Value := MadreB;
          IBQUpdateMadre.ParamByName('animal').Value := AnimalMB;
          IBQUpdateMadre.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
          ActualizarEstado('Se generó un inconveniente. No se puede carga MBI '+IntToStr(nroPadresMadres)+' ...');
        end;
    end;
    IBQMBI.Next;
  end;
  //Madre Biologica Externa
  nroPadresMadres := 0;
  ActualizarEstado('Sincronizando Madres Biológicas Externas de Animales...');

  IBQMBE.Close;
  IBQMBE.ParamByName('esta').Value := EstablecimientoNuevo;
  IBQMBE.Open;
  IBQMBE.First;
  IBQUpdateMadre.Close;
  IBQUpdateMadre.SQL.Clear;
  IBQUpdateMadre.SQL.Add('update tab_animales set madre_biologica_externa = :madre where id_animal = :animal');
  while not IBQMBE.Eof do
  begin
    Inc(nroPadresMadres);
    ActualizarEstado('Sincronizando Madre Biológica Externa Nro '+IntToStr(nroPadresMadres)+' ...');

    AnimalMB := BuscarAnimal(IBQMBE.FieldValues['id_animal'],EstablecimientoPrincipal,EstablecimientoNuevo,'I');                                                              
    MadreB := BuscarAnimal(IBQMBE.FieldValues['madre_biologica_externa'],EstablecimientoPrincipal,EstablecimientoNuevo,'E');
    if ((AnimalMB <> 0) and (MadreB <> 0)) then
    begin
        try
          IBQUpdateMadre.Close;
          IBQUpdateMadre.ParamByName('madre').Value := MadreB;
          IBQUpdateMadre.ParamByName('animal').Value := AnimalMB;
          IBQUpdateMadre.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
          ActualizarEstado('Se generó un inconveniente. No se puede carga MBE '+IntToStr(nroPadresMadres)+' ...');
        end;
    end;
    IBQMBE.Next;
  end;
  //Madre Receptora Interna
  nroPadresMadres := 0;
  ActualizarEstado('Sincronizando Madres Receptora Internas de Animales...');
  
  IBQMRI.Close;
  IBQMRI.ParamByName('esta').Value := EstablecimientoNuevo;
  IBQMRI.Open;
  IBQMRI.First;
  IBQUpdateMadre.Close;
  IBQUpdateMadre.SQL.Clear;
  IBQUpdateMadre.SQL.Add('update tab_animales set madre_receptora_interna = :madre where id_animal = :animal');
  while not IBQMRI.Eof do
  begin
    Inc(nroPadresMadres);
    ActualizarEstado('Sincronizando Madre Receptora Interna Nro '+IntToStr(nroPadresMadres)+' ...');
  
    AnimalMB := BuscarAnimal(IBQMRI.FieldValues['id_animal'],EstablecimientoPrincipal,EstablecimientoNuevo,'I');
    MadreB := BuscarAnimal(IBQMRI.FieldValues['madre_receptora_interna'],EstablecimientoPrincipal,EstablecimientoNuevo,'I');
    if ((MadreB <> 0) and (AnimalMB <> 0)) then
    begin
        try
          IBQUpdateMadre.Close;
          IBQUpdateMadre.ParamByName('madre').Value := MadreB;
          IBQUpdateMadre.ParamByName('animal').Value := AnimalMB;
          IBQUpdateMadre.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
          ActualizarEstado('Se generó un inconveniente. No se puede carga MRI '+IntToStr(nroPadresMadres)+' ...');
        end;
    end;
    IBQMRI.Next;
  end;
  //Madre Receptora Externa
  nroPadresMadres := 0;
  ActualizarEstado('Sincronizando Madres Receptora Externa de Animales...');
  
  IBQMRE.Close;
  IBQMRE.ParamByName('esta').Value := EstablecimientoNuevo;
  IBQMRE.Open;
  IBQMRE.First;
  IBQUpdateMadre.Close;
  IBQUpdateMadre.SQL.Clear;
  IBQUpdateMadre.SQL.Add('update tab_animales set madre_receptora_externa = :madre where id_animal = :animal');
  while not IBQMRE.Eof do
  begin
    Inc(nroPadresMadres);
    ActualizarEstado('Sincronizando Madre Receptora Externa Nro '+IntToStr(nroPadresMadres)+' ...');

    AnimalMB := BuscarAnimal(IBQMRE.FieldValues['id_animal'],EstablecimientoPrincipal,EstablecimientoNuevo,'I');
    MadreB := BuscarAnimal(IBQMRE.FieldValues['madre_receptora_externa'],EstablecimientoPrincipal,EstablecimientoNuevo,'E');
    if ((AnimalMB <> 0) and (MadreB <> 0)) then
    begin
        try
          IBQUpdateMadre.Close;
          IBQUpdateMadre.ParamByName('madre').Value := MadreB;
          IBQUpdateMadre.ParamByName('animal').Value := AnimalMB;
          IBQUpdateMadre.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
          ActualizarEstado('Se generó un inconveniente. No se puede carga MRE '+IntToStr(nroPadresMadres)+' ...');
        end;
    end;
    IBQMRE.Next;
  end;
end;

procedure TFSincroBaseDatos.ActualizarEstado(Mensaje : String);
begin
  LEstado.Caption := Mensaje;
  Application.ProcessMessages;
end;


procedure TFSincroBaseDatos.ICancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

function TFSincroBaseDatos.AnimalYaSincronizado(Animal : integer) : boolean;
var esta : boolean;
    i : integer;
begin
     i := 0;
     esta := false;
     
     while ((i < Length(AnimalSincronizado)) and not(esta)) do
     begin
          if (AnimalSincronizado[i] = Animal) then
              esta := true;

          Inc(i);
     end;

     Result := esta;
end;



end.
