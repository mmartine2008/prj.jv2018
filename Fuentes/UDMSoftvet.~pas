unit UDMSoftvet;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IBStoredProc, Dialogs,UDBLookupComboBoxAuto,
  ImgList, Controls, PngImageList;

type
  TDMSoftvet = class(TDataModule)
    IBQCatEve: TIBQuery;
    DSCatEve: TDataSource;
    IBQSexo: TIBQuery;
    DSSexo: TDataSource;
    IBQTipoAlta: TIBQuery;
    IBQTipoAltaNOMBRE: TIBStringField;
    IBQTipoAltaID_TIPO_ALTA: TIntegerField;
    DSTipoAlta: TDataSource;
    DSCategAnimal: TDataSource;
    IBQCategAnimal: TIBQuery;
    IBQResponsable: TIBQuery;
    DSResponsable: TDataSource;
    IBQEstablecimiento: TIBQuery;
    DSEstablecimiento: TDataSource;
    IBQRodeo: TIBQuery;
    DSRodeo: TDataSource;
    IBQRaza: TIBQuery;
    DSRaza: TDataSource;
    IBQPotrero: TIBQuery;
    DSPotrero: TDataSource;
    IBQGrupos: TIBQuery;
    DSGrupos: TDataSource;
    IBQPotrerosAll: TIBQuery;
    DSPotrerosAll: TDataSource;
    IBQCondicionCorporal: TIBQuery;
    DSCondicionCorporal: TDataSource;
    IBQUsuario: TIBQuery;
    DSUsuario: TDataSource;
    IBSPGrupoServicio: TIBStoredProc;
    IBQGDR: TIBQuery;
    DSGDR: TDataSource;
    IBQCronologiaDentaria: TIBQuery;
    DSCronologiaDentaria: TDataSource;
    DSEstadoReproductivo: TDataSource;
    IBQEstadoReproductivo: TIBQuery;
    IBSP_IngresoServicio: TIBStoredProc;
    IBSP_IngresoToro: TIBStoredProc;
    IBQServicios: TIBQuery;
    DSServicios: TDataSource;
    IBQCodigosGenericos: TIBQuery;
    DSCodigosGenericos: TDataSource;
    IBQMetodo: TIBQuery;
    DSMetodo: TDataSource;
    IBQValorCapacidad: TIBQuery;
    DSValorCapacidad: TDataSource;
    IBQSeguridad: TIBQuery;
    DSMetodoDiagnostico: TDataSource;
    IBQMetodoDiagnostico: TIBQuery;
    IBQEstadoReproTacto: TIBQuery;
    DSEstadoReproTacto: TDataSource;
    IBQMetodoToma: TIBQuery;
    DSMetodoToma: TDataSource;
    IBQTipoSexo: TIBQuery;
    DSTipoSexo: TDataSource;
    IBQTipoEnfermedad: TIBQuery;
    DSTipoEnfermedad: TDataSource;
    IBQSiNo: TIBQuery;
    DSSiNo: TDataSource;
    IBQEntraServicio: TIBQuery;
    DSEntraServicio: TDataSource;
    IBQParamEstablecimiento: TIBQuery;
    DSParamEstablecimiento: TDataSource;
    DSTiposParto: TDataSource;
    IBQTiposParto: TIBQuery;
    IBQCausaDistocia: TIBQuery;
    DSCausaDistocia: TDataSource;
    DSGradoAsistencia: TDataSource;
    IBQGradoAsistencia: TIBQuery;
    IBQMetodoCastracion: TIBQuery;
    DSMetodoCastracion: TDataSource;
    IBQCentrosInsem: TIBQuery;
    DSCentrosInsem: TDataSource;
    DSEscalaCondCorp: TDataSource;
    IBQEscalaCondCorp: TIBQuery;
    IBQEscalaCondCorpVALOR: TIBStringField;
    IBQEnfermedades: TIBQuery;
    DSEnfermedades: TDataSource;
    DSTecnicasTratamientos: TDataSource;
    IBQTecnicasTratamientos: TIBQuery;
    DSTipoTratamientos: TDataSource;
    IBQTiposTratamientos: TIBQuery;
    IBQTipoAborto: TIBQuery;
    DSTipoAborto: TDataSource;
    IBQTipoDestete: TIBQuery;
    DSTipoDestete: TDataSource;
    DSDiagnosticadores: TDataSource;
    IBQDiagnosticadores: TIBQuery;
    IBQTiposBaja: TIBQuery;
    DSTiposBaja: TDataSource;
    IBQTiposBajaID_TIPO_BAJA: TIntegerField;
    IBQTiposBajaSINONIMO: TIBStringField;
    IBQmetodosSincronizacion: TIBQuery;
    DSmetodosSincronizacion: TDataSource;
    IBQEventosPlanillas: TIBQuery;
    DSEventosPlanillas: TDataSource;
    IBQCategorias: TIBQuery;
    DSCategorias: TDataSource;
    IBQExamenClinico: TIBQuery;
    IBQExamenSanitario: TIBQuery;
    DSExamenClinico: TDataSource;
    DSExamenSanitario: TDataSource;
    IBQFormularios: TIBQuery;
    IBQSemen: TIBQuery;
    DSSemen: TDataSource;
    DSEventos: TDataSource;
    IBQEventos: TIBQuery;
    DSEventosListado: TDataSource;
    IBQEventosListado: TIBQuery;
    IBQIngEgrServicio: TIBQuery;
    DSIngEgrServicio: TDataSource;
    DSSexoPorSexo: TDataSource;
    IBQSexoPorSexo: TIBQuery;
    IBQPotrerosVacios: TIBQuery;
    DSPotrerosVacios: TDataSource;
    IBQPotrerosSinServicio: TIBQuery;
    DSPotrerosSinServicio: TDataSource;
    IBQServiciosBorrables: TIBQuery;
    IBQEstadoParicion: TIBQuery;
    DSEstadoParicion: TDataSource;
    IBQGeneral: TIBQuery;
    DSGeneral: TDataSource;
    IBQCUIG: TIBQuery;
    DSCUIG: TDataSource;
    IBQCUIGActual: TIBQuery;
    DSCUIGActual: TDataSource;
    IBQPotParaGrilla: TIBQuery;
    IBQRodParaGrilla: TIBQuery;
    DSPotParaGrilla: TDataSource;
    DSRodParaGrilla: TDataSource;
    DSTratamiento: TDataSource;
    IBQTratamiento: TIBQuery;
    IBQDistCACUCO: TIBQuery;
    DSDistCACUCO: TDataSource;
    IBQHayNacimientos: TIBQuery;
    DSHayNacimientos: TDataSource;
    IBQPais: TIBQuery;
    DSPais: TDataSource;
    IBQServiciosBorrablesID_SERVICIO: TIntegerField;
    IBQServiciosBorrablesNOMBRE_SERVICIO: TIBStringField;
    IBQServiciosBorrablesGRUPO: TIntegerField;
    IBQServiciosBorrablesFECHA_INICIO: TDateField;
    IBQServiciosBorrablesFECHA_FIN: TDateField;
    IBQServiciosBorrablesFECHA_FIN_ESTIMADA: TDateField;
    IBQServiciosBorrablesPOTRERO: TIntegerField;
    IBQServiciosBorrablesTIPO_SERVICIO: TIBStringField;
    IBQServiciosBorrablesRP_INT: TIBStringField;
    IBQServiciosBorrablesNOM_TORO: TIBStringField;
    IBQmetodosSincronizacionNOMBRE: TIBStringField;
    IBQmetodosSincronizacionHORAS_DE_AVISO: TIntegerField;
    IBQmetodosSincronizacionCODIGO: TIBStringField;
    IBQmetodosSincronizacionID_METODO: TIntegerField;
    IBQmetodosSincronizacionSINONIMO: TIBStringField;
    IBQCondicionCorporalID_CONDICION_CORPORAL: TIntegerField;
    IBQCondicionCorporalESCALA: TFloatField;
    IBQCC: TIBQuery;
    IBQDatosAnimal: TIBQuery;
    IBQActividad: TIBQuery;
    DSActividad: TDataSource;
    IBQActividadID_ACTIVIDAD: TIntegerField;
    IBQActividadSINONIMO: TIBStringField;
    IBQAnimExt: TIBQuery;
    IBQTipoSuplementacion: TIBQuery;
    DSTipoSuplementacion: TDataSource;
    IBQCodPropietario: TIBQuery;
    IBQCodCriador: TIBQuery;
    IBQCodOrigen: TIBQuery;
    IBQCodDestino: TIBQuery;
    DSCodPropietario: TDataSource;
    DSCodCriador: TDataSource;
    DSCodOrigen: TDataSource;
    DSCodDestino: TDataSource;
    IBQActividadNOMBRE: TIBStringField;
    DSCentrosTransplante: TDataSource;
    IBQCentrosTransplante: TIBQuery;
    IBQFuentesDeps: TIBQuery;
    DSFuentesDeps: TDataSource;
    IBQDescMetodoSinc: TIBQuery;
    DSDescMetodoSinc: TDataSource;
    IBQRechazo: TIBQuery;
    DSRechazo: TDataSource;
    IBQSubCategoriaRaza: TIBQuery;
    DSSubCategoriaRaza: TDataSource;
    IBQCodigosManejo: TIBQuery;
    DSCodigosManejo: TDataSource;
    IBQRpRepetidos: TIBQuery;
    IBQInspeccion: TIBQuery;
    DSInspeccion: TDataSource;
    IBQCodDestCabania: TIBQuery;
    DSCodDestCabania: TDataSource;
    IBQMocho: TIBQuery;
    DSMocho: TDataSource;
    IBQCantEstablecimientos: TIBQuery;
    IBQCantAnimalesActivos: TIBQuery;
    p: TIBQuery;
    IBQDatosAnimalID_ANIMAL: TIntegerField;
    IBQDatosAnimalID_RP: TIBStringField;
    IBQDatosAnimalID_SENASA: TIBStringField;
    IBQDatosAnimalID_HBA: TIBStringField;
    IBQDatosAnimalNOMBRE: TIBStringField;
    IBQDatosAnimalSEXO: TIntegerField;
    IBQDatosAnimalFECHA_NACIMIENTO: TDateField;
    IBQDatosAnimalID_IE: TIBStringField;
    IBQTratTodos: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure IBQGruposAfterOpen(DataSet: TDataSet);
    procedure IBQCondicionCorporalAfterOpen(DataSet: TDataSet);
    procedure IBQRechazoAfterOpen(DataSet: TDataSet);
  public
    procedure IBQAfterOpen(DataSet: TDataSet);

  end;

var
  DMSoftvet: TDMSoftvet;
  n,a:string;
  nroID:integer;

implementation
{$R *.dfm}

uses UMensajeHuella, UImportacion;

(*
  Se abren todos los query,
  asignándoles el evento para forzar lectura de registros
*)
procedure TDMSoftvet.DataModuleCreate(Sender: TObject);
var
  i   : integer;
  que : TIBQuery;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TIBQuery) then begin
      que := TIBQuery(components[i]);
      que.Close;
      que.AfterOpen := IBQAfterOpen;
      que.Open;
    end;
    cargaDeMovil:=false;
end;

(*
  Leemos al menos 4 registros por query para que al desplegar los combos
  estos muestren por lo menos 4 filas
*)
procedure TDMSoftvet.IBQAfterOpen(DataSet: TDataSet);
var
  con : integer;
begin
  con := 0;
  while (not(DataSet.Eof) and (con < 21)) do begin
    DataSet.Next;
    inc(con);
  end;
end;

procedure TDMSoftvet.IBQGruposAfterOpen(DataSet: TDataSet);
begin
  DataSet.Last;
  DataSet.First;
end;

procedure TDMSoftvet.IBQCondicionCorporalAfterOpen(DataSet: TDataSet);
var
  con : integer;
begin
  con := 0;
  while (not(DataSet.Eof) and (con < 10)) do
  begin
    DataSet.Next;
    inc(con);
  end;
end;

procedure TDMSoftvet.IBQRechazoAfterOpen(DataSet: TDataSet);
begin
  IBQAfterOpen(DataSet);
end;

end.
