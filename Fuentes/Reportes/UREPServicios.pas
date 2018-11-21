unit UREPServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBTable, DBCtrls, UDBLookupComboBoxAuto, StdCtrls, Grids, DBGrids,
  QuickRpt, QRCtrls, IBQuery, Buttons, jpeg, IBStoredProc, DataExport,
  DataToXLS, WinXP, QRPDFFilt, QRWebFilt, QRExport, UMensajeImpresora,
  PngImage, JvGIF, JvExControls, JvLabel, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFREPServicio = class(TFUniversal)
    IBQServicio: TIBQuery;
    IBQconsultaAnimal: TIBQuery;
    DSConsultaAnimal: TDataSource;
    DSConsultaEventosToros: TDataSource;
    IBQConsultaEventosToros: TIBQuery;
    IBQConsultaTiposServicios: TIBQuery;
    DSConsultaTiposServicios: TDataSource;
    DSAux: TDataSource;
    IBQAux: TIBQuery;
    ACSalir: TAction;
    ACPreview: TAction;
    IBQConsultaEventosHembras: TIBQuery;
    DSConsultaEventosHembras: TDataSource;
    IBQAuxCondicion: TIBQuery;
    Panel2: TPanel;
    GBServicios: TGroupBox;
    DBGServicios: TDBGrid;
    Panel1: TPanel;
    GBFiltroDeServicio: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    RBfechas: TRadioButton;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    RBtipo: TRadioButton;
    DBLCBTipo: TDBLookupComboBox;
    RBEstado: TRadioButton;
    CBEstado: TComboBox;
    GBDinamicas: TGroupBox;
    CBDinamicaToros: TCheckBox;
    CBDinamicaHembras: TCheckBox;
    DSDatosInseminacion: TDataSource;
    DSServicio: TDataSource;
    RBTodos: TRadioButton;
    IBQToros: TIBQuery;
    IBQDatosInseminacion: TIBQuery;
    IBQDatosInseminacionDOSIS: TIntegerField;
    IBQDatosInseminacionRESPONSABLE: TIBStringField;
    IBQDatosInseminacionCONDICION_CORPORAL: TIntegerField;
    IBQDatosInseminacionFECHA: TDateField;
    IBQAuxCond: TIBQuery;
    IBQTorosN: TIBStringField;
    IBQTorosA: TIBStringField;
    IBQTorosR: TIBStringField;
    IBQTorosNOMBRE: TStringField;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    LExpExcel: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    GConsulta: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    procedure FormShow(Sender: TObject);
    procedure actualizarQuery (Sender: TObject; caso : integer);
    procedure RBfechasClick(Sender: TObject);
    procedure RBtipoClick(Sender: TObject);
    procedure RBEstadoClick(Sender: TObject);
    procedure DTPCloseUp(Sender: TObject);
    procedure DBLCBTipoClick(Sender: TObject);
    procedure CBEstadoChange(Sender: TObject);
    procedure ACSalirExecute(Sender: TObject);
    procedure ACPreviewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQServicioAfterOpen(DataSet: TDataSet);
    procedure RBTodosClick(Sender: TObject);
    procedure DTPHastaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IBQTorosCalcFields(DataSet: TDataSet);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    { Private declarations }
    servicio : integer;
    procedure activarBotoner();
    function retornarCondicion(evento:integer) : string;
  public
    { Public declarations }
  end;

var
  FREPServicio: TFREPServicio;
  establecimiento : integer;

implementation

uses UPrincipal,uTiposGlobales, UDMSoftvet, UMensajeHuella, UCartel, UREPServiciosPreview, UTraduccion;

{$R *.dfm}

// METODO PARA CAMBIAR LA CONSULTA QUE ESTOY MOSTRANDO EN EL COMBO DE SERVICIOS
procedure TFREPServicio.actualizarQuery(Sender: TObject; caso : integer);
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando de Estado de Servicio ...';
  cartel.abrircartel(msje); 

  IBQServicio.Active := false;
  IBQServicio.SQL.Clear;
  case caso of
    1 : begin
          IBQServicio.SQL.Add('select *  from TAB_SERVICIOS where (FECHA_INICIO >= :inic) and (FECHA_INICIO <= :fin) and (establecimiento = '+intToStr(establecimiento)+')');
          IBQServicio.ParamByName('inic').AsDateTime := DTPDesde.DateTime;
          IBQServicio.ParamByName('fin').AsDateTime := DTPHasta.DateTime;
        end;
    2 : begin
          IBQServicio.SQL.Add('select *  from TAB_SERVICIOS where (tipo = :n) and (establecimiento = '+intToStr(establecimiento)+')');
          IBQServicio.ParamByName('n').AsInteger := DBLCBTipo.KeyValue;
        end;
    3 : begin
          IBQServicio.SQL.Add('select *  from TAB_SERVICIOS where (activo = :n) and (establecimiento = '+intToStr(establecimiento)+')');
          if (CBEstado.ItemIndex = 0) then
            IBQServicio.ParamByName('n').AsString := 'S'
          else
            IBQServicio.ParamByName('n').AsString := 'N';
        end;
    4 : begin
          IBQServicio.SQL.Add('select * from TAB_SERVICIOS where (establecimiento = :esta)');
          IBQServicio.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        end;
  end;
  IBQServicio.Active := true;
  activarBotoner();

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

// METODO SHOW DEL FORMULARIO
procedure TFREPServicio.FormShow(Sender: TObject);
begin
  inherited;
  establecimiento := FPrincipal.EstablecimientoActual;
  DTPHasta.DateTime := Now;
  DTPDesde.DateTime := DTPHasta.DateTime - 365;
  //IBQServicio.Active := true;
  //actualizarQuery(Sender, 4);
  IBQconsultaAnimal.Active := true;
  IBQConsultaEventosToros.Active := true;
  IBQConsultaEventosHembras.Active := true;
  IBQConsultaTiposServicios.Active := true;
  IBQAux.Active := true;
  activarBotoner();
end;
//**************************************************************
// METODOS DE LOS RADIO BUTTONS
procedure TFREPServicio.RBfechasClick(Sender: TObject);
begin
  inherited;
  DBLCBTipo.Enabled := false;
  CBEstado.Enabled := false;
  DTPDesde.Enabled := true;
  DTPHasta.Enabled := true;
end;
procedure TFREPServicio.RBtipoClick(Sender: TObject);
begin
  inherited;
  DBLCBTipo.Enabled := true;
  CBEstado.Enabled := false;
  DTPDesde.Enabled := false;
  DTPHasta.Enabled := false;
  DMSoftvet.IBQAfterOpen(IBQConsultaTiposServicios);
  IBQConsultaTiposServicios.First;
  if (DBLCBTipo.KeyValue = NULL) then
    DBLCBTipo.KeyValue := IBQConsultaTiposServicios.FieldValues['ID_TIPO_SERVICIO'];
  //if (DBLCBTipo.KeyValue <> Null) then
    //actualizarQuery(Sender, 2);
end;
procedure TFREPServicio.RBEstadoClick(Sender: TObject);
begin
  inherited;
  DBLCBTipo.Enabled := false;
  CBEstado.Enabled := true;
  DTPDesde.Enabled := false;
  DTPHasta.Enabled := false;
  if (CBEstado.ItemIndex = NULL) then
    CBEstado.ItemIndex := 0;
  //if (CBEstado.ItemIndex <> -1) then
    //actualizarQuery(Sender, 3);
end;
procedure TFREPServicio.RBTodosClick(Sender: TObject);
begin
  inherited;
  DBLCBTipo.Enabled := false;
  CBEstado.Enabled := false;
  DTPHasta.Enabled := false;
  DTPDesde.Enabled := false;
  //actualizarQuery(Sender,4);
end;
//**************************************************************


// CAMBIO LA CONSULTA CUANDO UNA FECHA CAMBIA
procedure TFREPServicio.DTPCloseUp(Sender: TObject);
begin
  inherited;
  if(DTPHasta.Date > now) then
      DTPHasta.Date:=now;
  if(DTPDesde.Date >= DTPHasta.Date) then
     DTPDesde.Date:= DTPHasta.Date;
end;

// CAMBIO LA CONSULTA CUANDO EL COMBO DE TIPO CAMBIO
procedure TFREPServicio.DBLCBTipoClick(Sender: TObject);
begin
  inherited;
  //actualizarQuery(Sender, 2);
end;

// CAMBIO LA CONSULTA CUANDO EL COMBO DE ESTADO CAMBIA
procedure TFREPServicio.CBEstadoChange(Sender: TObject);
begin
    inherited;
    //actualizarQuery(Sender, 3);
end;



// ACA SETEO EL VALOR FECHA_ENTRADA Y CONDICION_CORPORAL_ENTRADA PARA EL REPORTE


// ACA SETEO EL VALOR FECHA_SALIDA Y CONDICION_CORPORAL_SALIDA PARA EL REPORTE


// ACCION PARA SALIR
procedure TFREPServicio.ACSalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close;
end;

// ACCION PARA HACER EL PREVIEW DEL REPORTE
procedure TFREPServicio.ACPreviewExecute(Sender: TObject);
var

  cartel: TCartel;
  msje: String;
  F : TFREPServiciosPreview;

begin
  HabilitarDesabilitarControles();


  MostrarMensajeImpresion();
  inherited;
  if (DBGServicios.DataSource.DataSet.RecordCount>0) then
    begin
      cartel:= TCartel.getInstance();
      msje:= 'Generando vista previa del Reporte de Servicio ...';
      cartel.abrircartel(msje);

      F := TFREPServiciosPreview.Create(self);      
      servicio := IBQServicio.fieldbyname('id_servicio').AsInteger;
      F.IBQconsultaAnimal.Active := false;
      F.IBQconsultaAnimal.ParamByName('n').AsInteger := servicio;
      F.IBQconsultaAnimal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      F.IBQconsultaAnimal.Active := true;

      IBQConsultaEventosToros.Active := false;
      IBQConsultaEventosToros.ParamByName('n').AsInteger := servicio;
      IBQConsultaEventosToros.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQConsultaEventosToros.Active := true;

      IBQConsultaEventosHembras.Active := false;
      IBQConsultaEventosHembras.ParamByName('n').AsInteger := servicio;
      IBQConsultaEventosHembras.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQConsultaEventosHembras.Active := true;

      F.Toros := (CBDinamicaToros.Checked) and (IBQConsultaEventosToros.RecordCount >0);
      F.Hembras := (CBDinamicaHembras.Checked) and (IBQConsultaEventosHembras.RecordCount >0);
      F.servicio := servicio;

      if (IBQServicio.FieldByName('tipo').AsInteger = 3) then //tipo = 3 inseminacion artificial
      begin
        F.tipo_servicio := 'I';
        F.LabelEntrada.Caption := Traducir('Cond. Corp.');
        F.LabelEntrada.Top := 20;
        F.LabelEntrada.Left := 300;
        F.LabelSalida.Caption := Traducir('Toro');
        F.LabelSalida.Top := 20;
        F.LabelSalida.Left := 412;
        F.LabelCondCorporalEntrada.Caption := Traducir('Dosis');
        F.LabelCondCorporalEntrada.Top := 20;
        F.LabelCondCorporalEntrada.Left := 571;
        F.LabelCondCorporalSalida.Caption := Traducir('Responsable');
        F.LabelCondCorporalSalida.Top := 20;
        F.LabelCondCorporalSalida.Left := 631;
        {LabelEntrada.Left := LabelEntrada.Left - 32;
        LabelCondCorporalEntrada.Left := LabelCondCorporalEntrada.Left + 80;}

        {QRDBTCondCorp.Enabled := true;
        QRDBTToro.Enabled := true;
        QRDBTDosis.Enabled := true;
        QRDBTResponsable.Enabled := true;
        QRLEntrada.Enabled := false;
        QRLSalida.Enabled := false;
        QRLCondCorpSalida.Enabled := false;
        QRLCondCorpEntrada.Enabled := false;}

        IBQDatosInseminacion.Close;
        IBQDatosInseminacion.ParamByName('id').AsInteger := servicio;
        IBQDatosInseminacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQDatosInseminacion.ParamByName('animal').AsInteger := F.IBQConsultaAnimal.FieldByName('id_animal').AsInteger;
        IBQDatosInseminacion.Open;

        F.QRLFechaIns.Caption := Traducir('Fecha Inseminación:');
        F.QRLFecha.Caption := IBQDatosInseminacion.fieldByName('fecha').AsString;
      end
      else
      begin
        F.tipo_servicio := 'R';
        F.LabelEntrada.Caption := Traducir('Entrada');
        F.LabelEntrada.Top := 20;
        F.LabelEntrada.Left := 324;
        F.LabelSalida.Caption := Traducir('Salida');
        F.LabelSalida.Top := 20;
        F.LabelSalida.Left := 412;
        F.LabelCondCorporalEntrada.Caption := Traducir('Cond. Corp. Entrada');
        F.LabelCondCorporalEntrada.Top := 20;
        F.LabelCondCorporalEntrada.Left := 475;
        F.LabelCondCorporalSalida.Caption := Traducir('Cond. Corp. Salida');
        F.LabelCondCorporalSalida.Top := 20;
        F.LabelCondCorporalSalida.Left := 607;
        {LabelEntrada.Left := LabelEntrada.Left + 32;
        LabelCondCorporalEntrada.Left := LabelCondCorporalEntrada.Left - 80;}
        F.QRLFechaIns.Caption := '';
        F.QRLFecha.Caption := '';

      {  QRDBTCondCorp.Enabled := false;
        QRDBTToro.Enabled := false;
        QRDBTDosis.Enabled := false;
        QRDBTResponsable.Enabled := false;
        QRLEntrada.Enabled := true;
        QRLSalida.Enabled := true;
        QRLCondCorpSalida.Enabled := true;
        QRLCondCorpEntrada.Enabled := true;}
      end;

      cartel.cerrarcartel();
      cartel.FreeInstance();

      if (F.IBQconsultaAnimal.RecordCount >0) then
        begin

          cartel:= TCartel.getInstance();
          msje:= 'Generando vista previa del Reporte de Servicio ...';
          cartel.abrircartel(msje);

          if (IBQServicio.FieldByName('ACTIVO').AsString = 'N') then
            F.LabelEstado.Caption := Traducir('Inactivo')
          else
            F.LabelEstado.Caption := Traducir('Activo');

          DBLCBTipo.KeyValue := IBQServicio.FieldByName('tipo').AsString;
          F.LabelTipo.Caption := DBLCBTipo.Text ;
          DBLCBTipo.KeyValue := 0;

          F.LabelTitulo.Caption := Traducir('Estado de Servicio');
          F.LabelNombre.Caption := IBQServicio.fieldbyname('nombre').AsString;

          F.QRCRServicios.Prepare;
          cartel.cerrarcartel();
          cartel.FreeInstance();

          if (RBFechas.Checked) then
          begin
                 F.QRLD.Enabled := true;
                 F.QRLDesde.Enabled := true;
                 F.QRLG.Enabled := false;
                 F.QRLGrupo.Enabled := false;
                 F.QRLDesde.Caption := DateToStr(DTPDesde.Date);
                 F.QRLHasta.Caption := DateToStr(DTPHasta.Date);
                 F.QRLH.Enabled := true;
                 F.QRLHasta.Enabled := true;
                 F.QRLPeriodo.Enabled := true;
          end
          else
          begin
                 F.QRLD.Enabled := false;
                 F.QRLDesde.Enabled := false;
                 F.QRLG.Enabled := false;
                 F.QRLGrupo.Enabled := false;
                 F.QRLH.Enabled := false;
                 F.QRLHasta.Enabled := false;
                 F.QRLPeriodo.Enabled := false;
          end;


          F.ShowModal;
        end
      else
        MostrarMensaje(tmAdvertencia, 'No hay datos del servicio seleccionado');

      F.Destroy;
    end;

  HabilitarDesabilitarControles();
end;


// para ver si hay servicios seleccionados
procedure TFREPServicio.activarBotoner;
begin
  LPreview.Enabled := not IBQServicio.IsEmpty;
  IPreview.Enabled := not IBQServicio.IsEmpty;
{  if (IBQServicio.RecordCount = 0) then
    begin
      ACPreview.Enabled := false;
    end
  else
    begin
      ACPreview.Enabled := true;
    end;}
end;

// retorno el caption de la condicion corporal para un evento disparador
function TFREPServicio.retornarCondicion(evento: integer): string;
begin
// codigo
  IBQAuxCondicion.Close;
  IBQAuxCondicion.sql.Clear;
  IBQAuxCondicion.SQL.Add('select ccc.'+FPrincipal.StringEscalaCC+' as condicion from eve_eventos ee, eve_condicion_corporal ecc, cod_condiciones_corporales ccc ');
  IBQAuxCondicion.SQL.Add('where (ee.disparador = :id) and (ee.id_evento = ecc.id_evento) and (ecc.condicion_corporal = ccc.id_condicion_corporal)');
  IBQAuxCondicion.ParamByName('id').AsInteger := evento;
  IBQAuxCondicion.Open;
  result := IBQAuxCondicion.fieldByName('condicion').AsString;
end;

procedure TFREPServicio.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(IBQConsultaTiposServicios);
end;

procedure TFREPServicio.CBEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key:= #0;
end;

procedure TFREPServicio.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPServicio.IBQServicioAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQServicio.Last;
  IBQServicio.First;
  GBServicios.Caption := Traducir(' Selección de servicio  [')+IntToStr(IBQServicio.RecordCount)+']';
  BBXls.Enabled := not(IBQServicio.IsEmpty);
end;

procedure TFREPServicio.DTPHastaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePicker(Sender).DroppedDown) then
    DTPCloseUp(Sender);
end;

procedure TFREPServicio.IBQTorosCalcFields(DataSet: TDataSet);
var
  Nombre : String;
begin
  inherited;
  if DataSet.FieldByName('A').Value <> null then
    Nombre := DataSet.FieldValues['A']
  else if DataSet.FieldByName('N').Value <> null then
        Nombre := DataSet.FieldValues['N']
       else
        Nombre := DataSet.FieldValues['R'];
  IBQTorosNOMBRE.Value := Nombre;
end;
procedure TFREPServicio.BConsultaClick(Sender: TObject);
begin
  inherited;
  if (RBtipo.Checked) and (DBLCBTipo.KeyValue <> Null) then
    actualizarQuery(Sender,2)
  else if (RBEstado.Checked) and (CBEstado.ItemIndex <> -1) then
      actualizarQuery(Sender,3)
    else if (RBfechas.Checked) then
        actualizarQuery(Sender,1)
      else
        actualizarQuery(Sender,4);        
end;

procedure TFREPServicio.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
