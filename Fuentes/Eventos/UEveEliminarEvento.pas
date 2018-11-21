unit UEveEliminarEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, ExtCtrls, IBQuery, DB, IBCustomDataSet, WinXP,
  DataExport, DataToXLS, IBStoredProc, ActnList, ComCtrls, StdCtrls, Grids,
  DBGrids, UBDBGrid, MemoAuto, EditAuto, UFrameMangazo, Buttons, DBCtrls,
  UDBLookupComboBoxAuto, UCartel, UFrameDBSeleccion, ImgList, PngImageList,
  JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF,
  JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TArrParametros = Array of Variant;

  TRegParametrosAnimal = record
    Animal : Integer;
    Evento : Integer;
    Nombre : String;
    Fecha : TDate;
    Parametros : TArrParametros;
  end;

  TArrDatosEvento = Array of TRegParametrosAnimal;
  
  TFEveEliminarEvento = class(TFEveSimple)
    PFiltros: TPanel;
    Label1: TLabel;
    DBLCBAEventos: TDBLookupComboBoxAuto;
    IBQEventos: TIBQuery;
    DSEventos: TDataSource;
    IBQFiltrarAnimales: TIBQuery;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBQSPDatosEvento: TIBQuery;
    TSNacimientosNoRelac: TTabSheet;
    GBNacimientos: TGroupBox;
    PSeleccion: TPanel;
    FSeleccion: TFrameSeleccion;
    Label2: TLabel;
    LGrupoParto: TLabel;
    IBQChekEstadoMadres: TIBQuery;
    LCantHijosNoRelac: TLabel;
    IBQSPAsociarNoRelac: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure DBLCBAEventosCloseUp(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure IBQEventosAfterOpen(DataSet: TDataSet);
    procedure ATerminarExecute(Sender: TObject);
    procedure MSimpleIBQDisponiblesBeforeOpen(DataSet: TDataSet);
    procedure MSimpleIBQDisponiblesAfterOpen(DataSet: TDataSet);
    procedure TSNacimientosNoRelacShow(Sender: TObject);
    procedure MSimpleDBLCBGrupoCloseUp(Sender: TObject);
    procedure IBDSSimpleAfterPost(DataSet: TDataSet);
    procedure IBDSSimpleBeforePost(DataSet: TDataSet);
    procedure FSeleccionBBAgregarTodosClick(Sender: TObject);
    procedure FSeleccionBBEliminarTodosClick(Sender: TObject);
    procedure FSeleccionBBAgregarUnoClick(Sender: TObject);
    procedure FSeleccionBBEliminarUnoClick(Sender: TObject);
  private
    GrupoParto : Integer;
    CartelManga : TCartel;
    DatosEvento : TArrDatosEvento;
    CantHijosNoAsoc, TotalNoRelacionados : Integer;
    procedure BorrarAuxiliares;
    procedure ActualizarManga;
    function BuscarEvento(Animal : Integer) : TRegParametrosAnimal;
    procedure CargarDatosEvento(Tipo : Integer);
    procedure SeleccionarEvento;
    procedure AbrirEvento(Evento : TFEveSimple);
    procedure SeleccionarHijos(Sender : TObject);
    procedure HabilitarTerminar;
  public
    procedure CargarDatosGrilla; override;
    procedure CargarParametrosRN; override;
    procedure CargarParametrosMasivo; override;
    procedure CargarParametrosSP; override;
  end;

var
  FEveEliminarEvento: TFEveEliminarEvento;

implementation

uses
  UPrincipal, UDMSoftvet, UMensajeHuella,
  UEveCambioUbicacion, UEveCastracion, UEveDeteccionCelo, UEveServicioNatural,
  UEveCondicionCorporal, UEveMedicionFrame, UEvePeso, UEveMovimientoSemenBaja,
  UEveCalidadSeminal, UEveCapacidadServicio, UEveCircunferenciaEscrotal, UEveDiagnosticoGestacion,
  UEveAborto, UEveDestete, UEveDiagnosticoEnfermedad, UEveTratamiento, UEveEnfermedadesMasivas,
  UEveIdentificacion, UEveEvaluacionPreservicio, UEveBaja, UEveSincronizacionCelo, UEveFertilidadMacho,
  UEveRecursoForrajero, UEveCargaResultados, UEveCalidadCarne, UEveActividad, UEveSuplementacion, UEveFlushing,
  UEveTransferenciaEmbrionaria,UTraduccion;

{$R *.dfm}

procedure TFEveEliminarEvento.FormCreate(Sender: TObject);
begin
  inherited;
  IBQEventos.Close;
  IBQEventos.Open;
  DBLCBAEventos.KeyValue := -1;
  MSimple.SQLBasico := 'select ID_ANIMAL, ID_RP, ID_SENASA, id_pc, id_hba, id_otro, id_ie, ACTIVO from VIS_ANIMALES_ELIMINAR ';
  MSimple.PasarParametros(0,0);
  CrearGrupo := False;
  GuardarGrillaTemporal.Enabled := false;
  FSeleccion.OnSelectItem := SeleccionarHijos;
  CantHijosNoAsoc := 0;
  MSimple.Evento := 1;
  TotalNoRelacionados := 0;
end;

procedure TFEveEliminarEvento.SeleccionarHijos(Sender : TObject);
begin
  FSeleccion.IBQSeleccionados.Insert;
  FSeleccion.IBQSeleccionados.FieldByName('ID_ANIMAL').Value := FSeleccion.IBQDisponibles.FieldValues['ID_ANIMAL'];
  FSeleccion.IBQSeleccionados.FieldByName('ID_RP').Value := FSeleccion.IBQDisponibles.FieldValues['ID_RP'];
  FSeleccion.IBQSeleccionados.FieldByName('ID_AUX').Value := 1;
  FSeleccion.IBQSeleccionados.FieldByName('ESTABLECIMIENTO').Value := -1;
end;

procedure TFEveEliminarEvento.DBLCBAEventosCloseUp(Sender: TObject);
var
  Cartel : TCartel;
begin
  inherited;
  if not MSimple.Enabled then
    MSimple.Enabled := true;
  MSimple.Evento := DBLCBAEventos.KeyValue;
  TSNacimientosNoRelac.TabVisible := DBLCBAEventos.KeyValue = 39;

  Msimple.CBGrupo.Checked := DBLCBAEventos.KeyValue = 39;
  MSimple.DBLCBGrupo.EsRequerido := DBLCBAEventos.KeyValue = 39;

{  if DBLCBAEventos.KeyValue = 39 then
    MSimple.CBGrupo.Visible := false
  else
    MSimple.CBGrupo.Visible := true;
}
  Msimple.CBGrupo.Visible := false;
  if DBLCBAEventos.KeyValue = 39 then
    MSimple.CBClick(MSimple.CBGrupo);
  BorrarAuxiliares;
  MSimple.EjecutarSQL;
  ActualizarManga;
  SetLength(DatosEvento,0);
end;

procedure TFEveEliminarEvento.BorrarAuxiliares;
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFEveEliminarEvento.ActualizarManga;
begin
  MSimple.IBQDisponibles.Close;
  MSimple.IBQDisponibles.Open;
  MSimple.IBQSeleccionados.Close;
  MSimple.IBQSeleccionados.Open;
end;

function TFEveEliminarEvento.BuscarEvento(Animal : Integer) : TRegParametrosAnimal;
var
  I : Integer;
begin
  for I := 0 to Length(DatosEvento)-1 do
    if DatosEvento[I].Animal = Animal then
    begin
      Result := DatosEvento[I];
      Break;
    end;
end;

procedure TFEveEliminarEvento.CargarDatosGrilla;
var
  Reg : TRegParametrosAnimal;
begin
  IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
  IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
  Reg := BuscarEvento(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL']);
  IBDSSimple.FieldByName('FECHA').Value := Reg.Fecha;
  IBDSSimple.FieldByName('OBSERVACION').Value := Reg.Nombre;
  IBDSSimple.FieldByName('I1').Value := Reg.Evento;
end;

procedure TFEveEliminarEvento.CargarParametrosRN;
begin
  if ModoEve = meIndividual then
  begin
    IBQSPRN.ParamByName('ANIMAL').AsInteger := DatosEvento[0].Animal;
    IBQSPRN.ParamByName('EVENTO').AsInteger := DatosEvento[0].Evento;
  end
  else
  begin
    IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
    IBQSPRN.ParamByName('EVENTO').AsInteger := IBDSSimple.FieldValues['I1'];
  end;
end;

procedure TFEveEliminarEvento.CargarParametrosMasivo;
begin
  IBQSPEventoInd.ParamByName('EVENTO').AsInteger := IBDSSimple.FieldValues['I1'];
end;

procedure TFEveEliminarEvento.CargarParametrosSP;
begin
  IBQSPEventoInd.ParamByName('EVENTO').AsInteger := DatosEvento[0].Evento;
end;

procedure TFEveEliminarEvento.PCBasicoChange(Sender: TObject);
var
  CantErrores : Integer;
begin
  if PCBasico.ActivePage = TSDatos then
  begin
    CantHijosNoAsoc := 0;
    CargarDatosEvento(DBLCBAEventos.KeyValue);
    if DBLCBAEventos.KeyValue = 39 then
    begin
      LGrupoParto.Caption := MSimple.DBLCBGrupo.Text;
      IBQChekEstadoMadres.Close;
      IBQChekEstadoMadres.ParamByName('grupo').AsInteger := GrupoParto;
      IBQChekEstadoMadres.Open;
      IBQChekEstadoMadres.First;
      while not IBQChekEstadoMadres.Eof do
      begin
        if IBQChekEstadoMadres.FieldByName('ESTADO').AsString = 'N' then
          Inc(CantHijosNoAsoc);
        IBQChekEstadoMadres.Next;
      end;
    end;
    TotalNoRelacionados := CantHijosNoAsoc;
    TSNacimientosNoRelac.TabVisible := CantHijosNoAsoc >= 1;
  end;
  if PCBasico.ActivePage = TSNacimientosNoRelac then
  begin
    if CantHijosNoAsoc > 0 then
      LCantHijosNoRelac.Caption := Traducir('Se deben seleccionar ')+IntToStr(CantHijosNoAsoc)+Traducir(' hijos no relacionados del grupo de parto')
    else
      TSNacimientosNoRelac.TabVisible := false;
  end;
  if PCBasico.ActivePage = TSGrilla then
  begin
    CantErrores := 0;
    IBQSPAsociarNoRelac.Close;
    IBQSPAsociarNoRelac.ParamByName('grupo').AsInteger := GrupoParto;
    IBQSPAsociarNoRelac.Open;
    IBQSPAsociarNoRelac.First;
    while not IBQSPAsociarNoRelac.Eof do
    begin
      if IBQSPAsociarNoRelac.FieldByName('Estado').AsString = 'N' then
        Inc(CantErrores);
      IBQSPAsociarNoRelac.Next;
    end;
    if CantErrores > 0 then
    begin
      MostrarMensaje(tmError,'Faltaron asociar hijos del parto');
      PCBasico.ActivePage := TSNacimientosNoRelac;
    end;
  end;
  inherited;
  HabilitarTerminar;
end;

procedure TFEveEliminarEvento.HabilitarTerminar;
begin
  if DBLCBAEventos.KeyValue = 39 then
    BBTerminar.Enabled := BBTerminar.Enabled and (FSeleccion.BDBGSeleccionados.HasRecord or (CantHijosNoAsoc < 1));
end;

procedure TFEveEliminarEvento.CargarDatosEvento(Tipo : Integer);
var
  Ind : Integer;
begin
  SetLength(DatosEvento,0);
  IBQSPDatosEvento.Close;
  IBQSPDatosEvento.ParamByName('TIPO').Value := Tipo;
  IBQSPDatosEvento.Open;
  IBQSPDatosEvento.First;
  Ind := Length(DatosEvento);
  while not IBQSPDatosEvento.Eof do
  begin
    SetLength(DatosEvento,Ind+1);
    DatosEvento[Ind].Animal := IBQSPDatosEvento.FieldValues['animal'];
    DatosEvento[Ind].Evento := IBQSPDatosEvento.FieldValues['evento'];
    DatosEvento[Ind].Fecha := IBQSPDatosEvento.FieldValues['fecha'];
    DatosEvento[Ind].Nombre := IBQSPDatosEvento.FieldValues['nombre_evento'];
    Inc(Ind);
    IBQSPDatosEvento.Next;
  end;
end;

procedure TFEveEliminarEvento.IBQEventosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFEveEliminarEvento.SeleccionarEvento;
var
  F : TFEveSimple;
  TipoEve : Integer;
begin
  TipoEve := IBQEventos.FieldByName('ID_TIPO_EVENTO').AsInteger;
  case TipoEve of
    1 : F := TFEveAborto.Create(self);
    3 : F := TFEveBaja.Create(self);
    4 : F := TFEveCalidadSeminal.Create(self);
    5 : F := TFEveCambioUbicacion.Create(self);
    6 : F := TFEveCapacidadServicio.Create(self);
    7 : F := TFEveCastracion.Create(self);
    8 : F := TFEveCircunferenciaEscrotal.Create(self);
    9 : F := TFEveCondicionCorporal.Create(self);
    10 : F := TFEveDestete.Create(self);
    11 : F := TFEveDeteccionCelo.Create(self);
    12 : F := TFEveDiagnosticoEnfermedad.Create(self);
    13 : F := TFEveDiagnosticoGestacion.Create(self);
    17 : F := TFEveEvaluacionPreservicio.Create(self);
    18 : F := TFEveFertilidadMacho.Create(self);
    19 : F := TFEveIdentificacion.Create(self,true);
    22 : F := TFEveMedicionFrame.Create(self);
    25 : F := TFEvePeso.Create(self);
    26 : F := TFEveSincronizacionCelo.Create(self);
    27 : F := TFEveTratamiento.Create(self);
    30 : F := TFEveEnfermedadesMasivas.Create(self, memSangradoBrucelosis);
    31 : F := TFEveEnfermedadesMasivas.Create(self, memTuberculinizacion);
    32 : F := TFEveEnfermedadesMasivas.Create(self, memRaspadoToro);
    33 : F := TFEveCargaResultados.Create(self, memSangradoBrucelosis);
    34 : F := TFEveCargaResultados.Create(self, memTuberculinizacion);
    35 : F := TFEveCargaResultados.Create(self, memRaspadoToro);
    36 : F := TFEveIdentificacion.Create(self,false);
    41 : F := TFEveCalidadCarne.Create(self);
    44 : F := TFEveActividad.Create(self);
    45 : F := TFEveSuplementacion.Create(self);
    47 : F := TFEveFlushing.Create(self);
    48 : F := TFEveTransferenciaEmbrionaria.Create(self);
  end;
  if TipoEve <> 24 then
    AbrirEvento(F);
end;

procedure TFEveEliminarEvento.AbrirEvento(Evento : TFEveSimple);
begin
  Evento.Hide;
  Evento.ConManga := True;
  Evento.ModoEve  := meMasivo;
  Evento.ShowModal;
  Evento.Destroy;
end;

procedure TFEveEliminarEvento.ATerminarExecute(Sender: TObject);
begin
  {if IBQEventos.FieldByName('ID_TIPO_EVENTO').AsInteger <> 24 then
    if MostrarMensaje(tmConsulta,'Desea Cargar el Evento?') = mrYes then
      SeleccionarEvento;}
  inherited;
end;

procedure TFEveEliminarEvento.MSimpleIBQDisponiblesBeforeOpen(
  DataSet: TDataSet);
begin
  CartelManga := TCartel.getInstance;
  CartelManga.abrircartel('Obteniendo animales disponibles para el evento');
  inherited;
end;

procedure TFEveEliminarEvento.MSimpleIBQDisponiblesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  CartelManga.cerrarcartel;
  CartelManga.FreeInstance;
end;

procedure TFEveEliminarEvento.TSNacimientosNoRelacShow(Sender: TObject);
begin
  inherited;
  FSeleccion.IBQDisponibles.Close;
  FSeleccion.IBQDisponibles.ParamByName('grupo').AsInteger := GrupoParto;
  FSeleccion.IBQDisponibles.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  FSeleccion.IBQDisponibles.Open;
  FSeleccion.IBQSeleccionados.Close;
  FSeleccion.IBQSeleccionados.Open;
end;

procedure TFEveEliminarEvento.MSimpleDBLCBGrupoCloseUp(Sender: TObject);
begin
  inherited;
  if MSimple.DBLCBGrupo.KeyValue <> null then
    GrupoParto := MSimple.DBLCBGrupo.KeyValue;
  Msimple.DBLCBACloseUp(MSimple.DBLCBGrupo);
end;

procedure TFEveEliminarEvento.IBDSSimpleAfterPost(DataSet: TDataSet);
begin
  //inherited;
end;

procedure TFEveEliminarEvento.IBDSSimpleBeforePost(DataSet: TDataSet);
begin
  //inherited;
end;

procedure TFEveEliminarEvento.FSeleccionBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := SeleccionarHijos;
  FSeleccion.BBAgregarTodosClick(Sender);
  CantHijosNoAsoc := 0;
  HabilitarTerminar;
end;

procedure TFEveEliminarEvento.FSeleccionBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := SeleccionarHijos;
  FSeleccion.BBEliminarTodosClick(Sender);
  CantHijosNoAsoc := TotalNoRelacionados;
  HabilitarTerminar;
end;

procedure TFEveEliminarEvento.FSeleccionBBAgregarUnoClick(Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := SeleccionarHijos;
  FSeleccion.BBAgregarUnoClick(Sender);
  Dec(CantHijosNoAsoc);
  HabilitarTerminar;
end;

procedure TFEveEliminarEvento.FSeleccionBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := SeleccionarHijos;
  FSeleccion.BBEliminarUnoClick(Sender);
  Inc(CantHijosNoAsoc);
  HabilitarTerminar;
end;

end.
