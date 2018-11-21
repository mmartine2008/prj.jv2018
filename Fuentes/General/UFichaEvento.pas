unit UFichaEvento;

interface
                   
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  MemoAuto, DB, IBCustomDataSet, IBQuery, IBStoredProc, DataExport,
  DataToXLS, WinXP, Grids, DBGrids, UBDBGrid, JvGIF, frmshape, ImgList,
  PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls, JvImage;

type
  TFFichaEvento = class(TFUniversal)
    PBotones: TPanel;
    BBSalir: TBitBtn;
    ASalir: TAction;
    PDatos: TPanel;
    GBDatosEvento: TGroupBox;
    LRPAnimal: TLabel;
    LRPAnimalValue: TLabel;
    LFecha: TLabel;
    LFechaValue: TLabel;
    LResponsable: TLabel;
    LResponsableValue: TLabel;
    LEvento: TLabel;
    LEventoValue: TLabel;
    LCategoriaValue: TLabel;
    LCategoria: TLabel;
    LDescripcion: TLabel;
    LDescripcionValue: TLabel;
    IBQDatosEvento: TIBQuery;
    IBQProcedureDescripcion: TIBQuery;
    GroupBox1: TGroupBox;
    MAObservacion: TMemoAuto;
    BBAyuda: TBitBtn;
    IBQEmbriones: TIBQuery;
    DSEmbriones: TDataSource;
    BDBGEmbriones: TBitDBGrid;
    IBQEstadio: TIBQuery;
    IBQCalidad: TIBQuery;
    IBQDestinos: TIBQuery;
    IBQEmbrionesID_EMBRION: TIntegerField;
    IBQEmbrionesESTABLECIMIENTO: TIntegerField;
    IBQEmbrionesFECHA_COLECCION: TDateField;
    IBQEmbrionesDESTINO: TIntegerField;
    IBQEmbrionesDESCRIPCION: TIntegerField;
    IBQEmbrionesSERIE: TIBStringField;
    IBQEmbrionesNRO_ENVASE: TIBStringField;
    IBQEmbrionesESTADIO: TIntegerField;
    IBQEmbrionesCALIDAD: TIntegerField;
    IBQEmbrionesRESPONSABLE: TIntegerField;
    IBQEmbrionesOBSERVACION: TIBStringField;
    IBQEmbrionesMADRE: TIntegerField;
    IBQEmbrionesPADRE_1: TIntegerField;
    IBQEmbrionesPADRE_EXTERNO_1: TIBStringField;
    IBQEmbrionesPADRE_2: TIntegerField;
    IBQEmbrionesPADRE_EXTERNO_2: TIBStringField;
    IBQEmbrionesMADRE_INTERNA: TIBStringField;
    IBQEmbrionesUSADO: TIBStringField;
    IBQEmbrionesCANT_LAVAJES: TIntegerField;
    IBQEmbrionesID_EVE_TRANS: TIntegerField;
    IBQEmbrionesPRECIO: TFloatField;
    IBQEmbrionesCENTRO_TRANSPLANTE: TIntegerField;
    IBQCentros: TIBQuery;
    IBQEmbrionesVAL_DEST: TStringField;
    IBQEmbrionesVAL_ESTADIO: TStringField;
    IBQEmbrionesVAL_CALIDAD: TStringField;
    IBQEmbrionesVAL_CENTROS: TStringField;
    IBQEmbrionesDIAS_GESTACION: TIntegerField;
    IBQEmbrionesNRO_ORDEN: TIBStringField;
    Label1: TLabel;
    LEstaValue: TLabel;
    IBQGetEstablecimiento: TIBQuery;
    GBDatosExtraccion: TGroupBox;
    GBCongelacion: TGroupBox;
    LFechaCongelacion: TLabel;
    LHora: TLabel;
    LNroDs: TLabel;
    GBDescongelacion: TGroupBox;
    LDescongelCeroPorcViv: TLabel;
    LDescongelCeroVig: TLabel;
    LDescongelDosPorcViv: TLabel;
    LDescongelDosVig: TLabel;
    GBExtraccion: TGroupBox;
    LMillones: TLabel;
    LCCTotal: TLabel;
    LNroEyaculacion: TLabel;
    LVolumen: TLabel;
    LColor: TLabel;
    LVigor: TLabel;
    LNroEyaculacionValue: TLabel;
    LVolumenValue: TLabel;
    LColorValue: TLabel;
    LMillonesValue: TLabel;
    LDilucionValue: TLabel;
    LVigorValue: TLabel;
    LFechaCongelacionValue: TLabel;
    LHoraValue: TLabel;
    LNroDsValue: TLabel;
    LDescongelCeroPorcVivValue: TLabel;
    LDescongelCeroVigValue: TLabel;
    LDescongelDosPorcVivValue: TLabel;
    LDescongelDosVigValue: TLabel;
    IBQDatosDeSemen: TIBQuery;
    ISalir: TImage;
    IBQDatosCentros: TIBQuery;
    Label2: TLabel;
    GBDatosUbicacion: TGroupBox;
    LTermo: TLabel;
    LTermoValue: TLabel;
    LCanister: TLabel;
    LCanisterValue: TLabel;
    LPosicion: TLabel;
    LPosicionValue: TLabel;
    Label3: TLabel;
    LEspermasPajuela: TLabel;
    PSuperior: TPanel;
    LPartidaValue: TLabel;
    LCongelo: TLabel;
    LCongeloValue: TLabel;
    BDBGDieta: TBitDBGrid;
    IBQDieta: TIBQuery;
    IBQDietaALIMENTO: TIBStringField;
    IBQDietaKG_MS_AUX: TIBBCDField;
    IBQDietaKG_TC_AUX: TIBBCDField;
    IBQDietaPRECIO_AUX: TIBBCDField;
    IBQDietaPORC_RACION: TIBBCDField;
    IBQDietaPORC_MS: TIBBCDField;
    DSDieta: TDataSource;
    procedure ASalirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    evento : integer;
    procedure setEvento(const Value: integer);
    procedure cargarValores;
    procedure cargarProcedure(tipo:Integer);
    procedure CargarValoresExtraccionSemen;
    { Private declarations }
  public
    { Public declarations }
  published
    property IDEvento : integer read Evento write setEvento ;
  end;

var  FFichaEvento: TFFichaEvento;

implementation

uses uTiposGlobales,UPrincipal;

{$R *.dfm}

procedure TFFichaEvento.ASalirExecute(Sender: TObject);
begin
  inherited;
  close;
end;

// metodos para el manejo de la property evento
procedure TFFichaEvento.setEvento(const Value: integer);
begin
  evento := Value;
end;
//**********************************************
procedure TFFichaEvento.FormShow(Sender: TObject);
begin
  inherited;
  GBDatosExtraccion.Visible := false;

  IBQDatosEvento.Active := false;
  IBQDatosEvento.ParamByName('eve').AsInteger := evento;
  IBQDatosEvento.Active := true;

  IBQGetEstablecimiento.Close;
  IBQGetEstablecimiento.ParamByName('eve').AsInteger := evento;
  IBQGetEstablecimiento.Open;
  LEstaValue.Caption := IBQGetEstablecimiento.FieldValues['nombre'];

  Height := 482;

  if IBQDatosEvento.FieldByName('tipo').AsInteger = 47 then    //Para poder ver la grilla con los embriones
  begin
    Height := 513;
    BDBGEmbriones.Visible := true;
    GBDatosEvento.Height := 329;
  end;

  if IBQDatosEvento.FieldByName('tipo').AsInteger = 52 then    //Para poder ver el panel de datos de extraccion de semen
  begin
       Height := 640;
       BDBGEmbriones.Visible := false;
       GBDatosExtraccion.Visible := true;
       CargarValoresExtraccionSemen;
  end;

  if IBQDatosEvento.FieldByName('tipo').AsInteger = 45 then
  begin
    Height := 635;
    BDBGDieta.Visible := true;
    GBDatosEvento.Height := 329;
  end;
  
  cargarValores
end;

// carga el store procedure nesecitado y luego muestra los valores
procedure TFFichaEvento.cargarValores;
begin
  LRPAnimalValue.Caption    := IBQDatosEvento.fieldByName('id_rp').AsString;
  LFechaValue.Caption       := IBQDatosEvento.fieldByName('fecha').AsString;

  if (Trim(IBQDatosEvento.fieldByName('apellido').AsString) <> '') then
    LResponsableValue.Caption := IBQDatosEvento.fieldByName('apellido').AsString +', '+IBQDatosEvento.fieldByName('nombre').AsString
   else
      LResponsableValue.Caption := IBQDatosEvento.fieldByName('nombre').AsString;

  LEventoValue.Caption      := IBQDatosEvento.fieldByName('evento').AsString;
  LCategoriaValue.Caption   := IBQDatosEvento.fieldByName('categoria').AsString;
  MAObservacion.Lines.Add(IBQDatosEvento.fieldByName('observacion').AsString);

  if ((IBQDatosEvento.FieldByName('tipo').AsInteger <> 19) and (IBQDatosEvento.FieldByName('tipo').AsInteger <> 52) and (IBQDatosEvento.FieldByName('tipo').AsInteger <> 58)) then
    begin
      cargarProcedure(IBQDatosEvento.FieldByName('tipo').AsInteger);
      LDescripcionValue.Caption := IBQProcedureDescripcion.fieldbyname('datos').AsString;
      LDescripcionValue.Hint:= LDescripcionValue.Caption;
    end
  else
    begin
      LDescripcionValue.Caption := '';
      LDescripcionValue.Hint:= '';
    end;

  //Solo para el evento de Flushing
  if IBQDatosEvento.FieldByName('tipo').AsInteger = 47 then
  begin
    IBQEmbriones.Close;
    IBQEmbriones.ParamByName('evento').AsInteger := Evento;
    IBQEmbriones.Open;
  end;

  if IBQDatosEvento.FieldByName('tipo').AsInteger = 45 then
  begin
    IBQDieta.Close;
    IBQDieta.ParamByName('evento').AsInteger := Evento;
    IBQDieta.Open;
  end;
  
end;

// capturo la descripcion del evento con el procedure correspondiente a cada tipo de evento
procedure TFFichaEvento.cargarProcedure(tipo: Integer);
begin
  IBQProcedureDescripcion.Active := false;
  IBQProcedureDescripcion.SQL.Clear;
  case tipo of
     1 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_ABORTO(:idNuevo)');
     2 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_ALTA_DIRECTA(:idNuevo)');
     3 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_BAJA(:idNuevo)');
     4 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_CALIDAD_SEMINAL(:idNuevo)');
     5 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_CAMBIO_UBI(:idNuevo)');
     6 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_CAPACIDAD_SERVI(:idNuevo)');
     7 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_CASTRACION(:idNuevo)');
     8 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_CIRCUNF_ESCROTAL(:idNuevo)');
     9 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_CONDICION_CORP(:idNuevo, :establecimiento)');
    10 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_DESTETE(:idNuevo)');
    11 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_DETECCION_CELO(:idNuevo)');
    12 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_DIAGNOSTICO_ENFER(:idNuevo)');
    13 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_DIAGNOSTICO_GESTA(:idNuevo)');
    14 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_DISTOCIA(:idNuevo)');
    15 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_EGRESO_SERVICIO(:idNuevo)');
    16 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_EGRESO_TORO(:idNuevo)');
    17 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_EVAL_PRESERVICIO(:idNuevo)');
    18 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_FERTILIDAD_MACHO(:idNuevo)');
    20 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_INGRESO_SERVICIO(:idNuevo)');
    21 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_INGRESO_TORO(:idNuevo)');
    22 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_MEDICION_FRAME(:idNuevo)');
    23 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_NACIMIENTO(:idNuevo)');
    24 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_PARTO(:idNuevo)');
    25 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_PESO(:idNuevo)');
    26 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_SINCRONIZA_CELO(:idNuevo)');
    27 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_TRATAMIENTO(:idNuevo)');
    28 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_INSEMINA_ARTIF(:idNuevo)');
    30 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_BRUCELOSIS(:idNuevo)');
    31 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_TUBERCULINIZACION(:idNuevo)');
    32 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_RASPADO_TORO(:idNuevo)');
    33 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_BRUCELOSIS(:idNuevo)');
    34 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_TUBERCULINIZACION(:idNuevo)');
    35 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_RASPADO_TORO(:idNuevo)');
    36 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_REIDENTIFICACION(:idNuevo)');    
    39 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_PARTO_MASIVO(:idNuevo)');
    41 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_CALIDAD_CARNE(:idNuevo)');
    44 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_ACTIVIDAD(:idNuevo)');
    45 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_SUPLEMENTACION(:idNuevo)');
    47 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_FLUSHING(:idNuevo)');
    48 : IBQProcedureDescripcion.SQL.Add('select datos from GET_DATOS_EVE_TRANSFERENCIA(:idNuevo)');
  end;

  IBQProcedureDescripcion.ParamByName('idNuevo').AsInteger := evento;
  if (tipo = 9) then
    IBQProcedureDescripcion.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;

  IBQProcedureDescripcion.Active := true;

end;

procedure TFFichaEvento.CargarValoresExtraccionSemen;
begin
     IBQDatosDeSemen.Close;
     IBQDatosDeSemen.ParamByName('evento').AsInteger := evento;
     IBQDatosDeSemen.Open;

     if (IBQDatosDeSemen.FieldValues['nro_eyaculacion'] <> null) then
        if (IBQDatosDeSemen.FieldValues['nro_eyaculacion'] <> 0) then
        begin
             if (IBQDatosDeSemen.FieldValues['nro_eyaculacion'] <> null) then
                LNroEyaculacionValue.Caption := IntToStr(IBQDatosDeSemen.FieldValues['nro_eyaculacion'])
             else
                LNroEyaculacionValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['partida'] <> null) then
                LPartidaValue.Caption := 'Partida Nº: ' + IBQDatosDeSemen.FieldValues['partida']
             else
                LPartidaValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['volumen_eyaculacion'] <> null) then
                LVolumenValue.Caption := FloatToStr(IBQDatosDeSemen.FieldValues['volumen_eyaculacion'])
             else
                LVolumenValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['nombre_color_semen'] <> null) then
                LColorValue.Caption := IBQDatosDeSemen.FieldValues['nombre_color_semen']
             else
                LColorValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['millones_esperm'] <> null) then
                LMillonesValue.Caption := IntToStr(IBQDatosDeSemen.FieldValues['millones_esperm'])
             else
                LMillonesValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['dilucion'] <> null) then
                LDilucionValue.Caption := IBQDatosDeSemen.FieldValues['dilucion']
             else
                LDilucionValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['valor_vigor_semen'] <> null) then
                LVigorValue.Caption := IBQDatosDeSemen.FieldValues['valor_vigor_semen']
             else
                LVigorValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['fecha_congelacion'] <> null) then
                LFechaCongelacionValue.Caption := IBQDatosDeSemen.FieldValues['fecha_congelacion']
             else
                LFechaCongelacionValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['hora_congelacion'] <> null) then
                LHoraValue.Caption := IBQDatosDeSemen.FieldValues['hora_congelacion']
             else
                LHoraValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['nro_ds'] <> null) then
                LNroDsValue.Caption := IntToStr(IBQDatosDeSemen.FieldValues['nro_ds'])
             else
                LNroDsValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['descongel_cero_hs_porc_viv'] <> null) then
                LDescongelCeroPorcVivValue.Caption := FloatToStr(IBQDatosDeSemen.FieldValues['descongel_cero_hs_porc_viv'])
             else
                LDescongelCeroPorcVivValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['valor_DESCONGEL_CERO_HS_VIG'] <> null) then
                LDescongelCeroVigValue.Caption := IBQDatosDeSemen.FieldValues['valor_DESCONGEL_CERO_HS_VIG']
             else
                LDescongelCeroVigValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['descongel_dos_hs_porc_viv'] <> null) then
                LDescongelDosPorcVivValue.Caption := FloatToStr(IBQDatosDeSemen.FieldValues['descongel_dos_hs_porc_viv'])
             else
                LDescongelDosPorcVivValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['valor_DESCONGEL_DOS_HS_VIG'] <> null) then
                LDescongelDosVigValue.Caption := IBQDatosDeSemen.FieldValues['valor_DESCONGEL_DOS_HS_VIG']
             else
                LDescongelDosVigValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['termo'] <> null) then
                LTermoValue.Caption := IBQDatosDeSemen.FieldValues['termo']
             else
                LTermoValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['canister'] <> null) then
             begin
                  LCanisterValue.Caption := IBQDatosDeSemen.FieldValues['canister'];
             end
             else
                  LCanisterValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['posicion_termo'] <> null) then
                LPosicionValue.Caption := IBQDatosDeSemen.FieldValues['posicion_termo']
             else
                LPosicionValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['espermas_por_pajuela'] <> null) then
                LEspermasPajuela.Caption := IBQDatosDeSemen.FieldValues['espermas_por_pajuela']
             else
                LEspermasPajuela.Caption := '';

             if (IBQDatosDeSemen.FieldValues['congelo'] <> null) then
                LCongeloValue.Caption := IBQDatosDeSemen.FieldValues['congelo']
             else
                LCongeloValue.Caption := '';

             if (IBQDatosDeSemen.FieldValues['extraccion_centro'] <> null) then
               if (IBQDatosDeSemen.FieldValues['extraccion_centro'] <> -1) then
               begin
                    IBQDatosCentros.Close;
                    IBQDatosCentros.ParamByName('centro').AsInteger := IBQDatosDeSemen.FieldValues['extraccion_centro'];
                    IBQDatosCentros.Open;

                    LDescripcionValue.Caption := 'Extracción realizada en el centro: '+IBQDatosCentros.FieldValues['nombre'];
               end;
        end
        else
        begin
                LPartidaValue.Caption := 'Partida Nº: ';
                LNroEyaculacionValue.Caption := '';
                LVolumenValue.Caption := '';
                LColorValue.Caption := '';
                LMillonesValue.Caption := '';
                LDilucionValue.Caption := '';
                LVigorValue.Caption := '';
                LFechaCongelacionValue.Caption := '';
                LHoraValue.Caption := '';
                LNroDsValue.Caption := '';
                LDescongelCeroPorcVivValue.Caption := '';
                LDescongelCeroVigValue.Caption := '';
                LDescongelDosPorcVivValue.Caption := '';
                LDescongelDosVigValue.Caption := '';
                LTermoValue.Caption := '';
                LCanisterValue.Caption := '';
                LPosicionValue.Caption := '';
                LEspermasPajuela.Caption := '';
                LCongeloValue.Caption := '';
        end;

end;

end.
