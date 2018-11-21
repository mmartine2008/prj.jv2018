unit UDOCertificadoRecupEmbriones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, DBCtrls, UDBLookupComboBoxAuto, StdCtrls, ComCtrls,
  IBQuery, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet, IBStoredProc,
  ActnList, ExtCtrls, UFrameDBSeleccion, Grids, DBGrids, UBDBGrid, EditAuto,
  Buttons, UDOCertificadoRecupEmbrionesPreview, JvGIF, PngImage, jpeg,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFDOCertificadoRecupEmbriones = class(TFUniversal)
    PCDatos: TPageControl;
    TSDatos: TTabSheet;
    TSCertificado: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LRaza: TLabel;
    LTipSang: TLabel;
    DBLCBADonante: TDBLookupComboBoxAuto;
    GroupBox2: TGroupBox;
    BDBGColecta: TBitDBGrid;
    GroupBox3: TGroupBox;
    FSeleccion: TFrameSeleccion;
    IBQDonantes: TIBQuery;
    IBQDonantesID_ANIMAL: TIntegerField;
    IBQDonantesID_RP: TIBStringField;
    IBQDonantesNOMBRE: TIBStringField;
    IBQDonantesID_HBA: TIBStringField;
    IBQDonantesRAZA: TIntegerField;
    IBQDonantesTIPIFICACION_SANGUINEA: TIBStringField;
    IBQDonantesNOMBRE_COM: TIBStringField;
    IBQDonantesNOM_RAZA: TStringField;
    DSDonante: TDataSource;
    IBQDatosColecta: TIBQuery;
    IBQDatosColectaNOMBRE_P1: TIBStringField;
    IBQDatosColectaNOMBRE_P2: TIBStringField;
    IBQDatosColectaRP_P1: TIBStringField;
    IBQDatosColectaRP_P2: TIBStringField;
    IBQDatosColectaHBA_P1: TIBStringField;
    IBQDatosColectaHBA_P2: TIBStringField;
    IBQDatosColectaTIPO_SANG_P1: TIBStringField;
    IBQDatosColectaTIPO_SANG_P2: TIBStringField;
    IBQDatosColectaNOM_SERVICIO: TIBStringField;
    IBQDatosColectaFECHA_SERVICIO: TDateField;
    IBQDatosColectaFECHA_COLECTA: TDateField;
    IBQDatosColectaCANT_EMBRIONES_TE: TIntegerField;
    IBQDatosColectaCANT_EMBRIONES_NF: TIntegerField;
    IBQDatosColectaCANT_EMBRIONES_DEG: TIntegerField;
    IBQDatosColectaCANT_EMBRIONES_TR: TIntegerField;
    DSDatosColecta: TDataSource;
    IBQDatosColectaID_P1: TIntegerField;
    IBQDatosColectaID_P2: TIntegerField;
    EARP: TEditAuto;
    Label8: TLabel;
    EANombre: TEditAuto;
    Label9: TLabel;
    Label10: TLabel;
    EAHBA: TEditAuto;
    Label11: TLabel;
    LCant: TLabel;
    ScrollBox1: TScrollBox;
    Shape5: TShape;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LRazaDonante: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Shape2: TShape;
    Shape1: TShape;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Shape4: TShape;
    Shape3: TShape;
    Label20: TLabel;
    Label21: TLabel;
    LNombreDonante: TLabel;
    Shape6: TShape;
    Label22: TLabel;
    LTSDonante: TLabel;
    Label24: TLabel;
    LHBADonante: TLabel;
    LRPDonante: TLabel;
    Label26: TLabel;
    Shape7: TShape;
    Label25: TLabel;
    Label27: TLabel;
    LNombrePadre1: TLabel;
    LTSPadre1: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    LHBAPadre1: TLabel;
    Shape8: TShape;
    Label33: TLabel;
    LRPPadre1: TLabel;
    Shape9: TShape;
    Shape10: TShape;
    Label28: TLabel;
    Label29: TLabel;
    LTSPadre2: TLabel;
    Label34: TLabel;
    LNombrePadre2: TLabel;
    LHBAPadre2: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    LRPPadre2: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Label32: TLabel;
    Shape16: TShape;
    Label35: TLabel;
    Label36: TLabel;
    LFechaServicio: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Shape17: TShape;
    Shape18: TShape;
    Label42: TLabel;
    Shape19: TShape;
    Label43: TLabel;
    LFechaColecta: TLabel;
    Label44: TLabel;
    LDiasGestacion: TLabel;
    Label45: TLabel;
    LEmbrionesDeg: TLabel;
    LEmbrionesSinF: TLabel;
    Label47: TLabel;
    Label46: TLabel;
    LEmbrionesTransferibles: TLabel;
    LEmbrionesTransferidos: TLabel;
    Label49: TLabel;
    Label48: TLabel;
    BDBGReceptoras: TBitDBGrid;
    IBDSReceptoras: TIBDataSet;
    IBDSReceptorasID_ANIMAL: TIntegerField;
    IBDSReceptorasID_RP: TIBStringField;
    IBDSReceptorasNOMBRE: TIBStringField;
    IBDSReceptorasPOTRERO: TIntegerField;
    IBDSReceptorasLOTE: TIntegerField;
    IBDSReceptorasRODEO: TIntegerField;
    IBDSReceptorasCATEGORIA: TIntegerField;
    IBDSReceptorasADN: TIBStringField;
    DSReceptoras: TDataSource;
    Label51: TLabel;
    IBDSReceptorasRAZA: TIntegerField;
    IBDSReceptorasCOD_RAZA: TStringField;
    IBQCalidad: TIBQuery;
    IBQEstadio: TIBQuery;
    IBDSReceptorasNCALIDAD: TIntegerField;
    IBDSReceptorasNESTADIO: TIntegerField;
    IBDSEmbriones: TIBDataSet;
    IBQEmbriones: TIBQuery;
    DSEmbriones: TDataSource;
    IBDSEmbrionesID_EMBRION: TIntegerField;
    IBDSEmbrionesESTABLECIMIENTO: TIntegerField;
    IBDSEmbrionesFECHA_COLECCION: TDateField;
    IBDSEmbrionesID_DESTINO: TIntegerField;
    IBDSEmbrionesDESTINO: TIBStringField;
    IBDSEmbrionesID_DESCRIPCION: TIntegerField;
    IBDSEmbrionesDESCRIPCION: TIBStringField;
    IBDSEmbrionesSERIE: TIBStringField;
    IBDSEmbrionesNRO_ENVASE: TIBStringField;
    IBDSEmbrionesID_ESTADIO: TIntegerField;
    IBDSEmbrionesESTADIO: TIBStringField;
    IBDSEmbrionesID_CALIDAD: TIntegerField;
    IBDSEmbrionesCALIDAD: TIBStringField;
    IBDSEmbrionesID_RESP: TIntegerField;
    IBDSEmbrionesRESPONSABLE: TIBStringField;
    IBDSEmbrionesOBSERVACION: TIBStringField;
    IBDSEmbrionesMADRE: TIntegerField;
    IBDSEmbrionesPADRE_1: TIntegerField;
    IBDSEmbrionesPADRE_2: TIntegerField;
    IBDSEmbrionesPADRE_EXTERNO_1: TIBStringField;
    IBDSEmbrionesPADRE_EXTERNO_2: TIBStringField;
    IBDSEmbrionesMADRE_INTERNA: TIBStringField;
    IBDSEmbrionesUSADO: TIBStringField;
    IBDSEmbrionesCANT_LAVAJES: TIntegerField;
    IBDSEmbrionesPRECIO: TFloatField;
    IBDSEmbrionesCENTRO_TRANSPLANTE: TIntegerField;
    IBDSEmbrionesDIAS_GESTACION: TIntegerField;
    IBDSEmbrionesNRO_ORDEN: TIBStringField;
    IBDSEmbrionesNOMEST: TIntegerField;
    IBDSEmbrionesNOMCALIDAD: TIntegerField;
    IBQDescDestinos: TIBQuery;
    DSDescDestinos: TDataSource;
    IBDSReceptorasFECHA_NACIMIENTO: TDateField;
    IBQDatosColectaCENTRO_TRANSPLANTE: TIntegerField;
    IBQCentrosTransplante: TIBQuery;
    IBQDatosColectaNOM_CENTRO: TStringField;
    IBQDatosColectaHAB_CENTRO: TStringField;
    IBQDatosColectaNRO_INSC: TStringField;
    IBQCriador: TIBQuery;
    IBQDonantesCRIADOR: TIntegerField;
    IBQDonantesNOM_CRIADOR: TStringField;
    EAFolio: TEdit;
    EACriador: TEdit;
    EANroExp: TEdit;
    EACriadorServicio: TEdit;
    EAFolioServicio: TEdit;
    EALineaServicio: TEdit;
    EATitularServicio: TEdit;
    ECentro: TEdit;
    EHabilitacion: TEdit;
    EInscripcion: TEdit;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    Label19: TLabel;
    ISig: TImage;
    Iant: TImage;
    Lant: TLabel;
    LSig: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PanelCongelados: TPanel;
    Label52: TLabel;
    MObservacionCong: TMemo;
    Label53: TLabel;
    Label54: TLabel;
    EATipoEnvase: TEdit;
    BDBGEmbriones: TBitDBGrid;
    Label55: TLabel;
    EATiempoRecuperacion: TEdit;
    Label56: TLabel;
    DBLCBADescDestinos: TDBLookupComboBoxAuto;
    Label57: TLabel;
    EAEquilibracion: TEdit;
    Label58: TLabel;
    EACongelacion: TEdit;
    Label59: TLabel;
    EADescongelacion: TEdit;
    Label60: TLabel;
    EATransferenciaDirecta: TEdit;
    Shape20: TShape;
    Label23: TLabel;
    Label50: TLabel;
    Label70: TLabel;
    LtotalCong: TLabel;
    LtotalEmbriones: TLabel;
    LtotalFrescos: TLabel;
    IBQDatosColectaCONGELADOS: TIntegerField;
    IBQDatosColectaFRESCOS: TIntegerField;
    procedure DBLCBADonanteCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IBQDonantesCalcFields(DataSet: TDataSet);
    procedure IBQDonantesAfterOpen(DataSet: TDataSet);
    procedure IBQDatosColectaAfterOpen(DataSet: TDataSet);
    procedure BDBGColectaCellClick(Column: TColumn);
    procedure EARPChange(Sender: TObject);
    procedure EANombreChange(Sender: TObject);
    procedure EAHBAChange(Sender: TObject);
    procedure PCDatosChange(Sender: TObject);
    procedure IBQEmbrionesAfterOpen(DataSet: TDataSet);
    procedure BBSalirClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure BBSiguienteClick(Sender: TObject);
    procedure BBAnteriorClick(Sender: TObject);
    procedure IBQDescDestinosAfterOpen(DataSet: TDataSet);
    procedure FSeleccionBBAgregarTodosClick(Sender: TObject);
    procedure FSeleccionBBAgregarUnoClick(Sender: TObject);
    procedure FSeleccionBBEliminarUnoClick(Sender: TObject);
    procedure FSeleccionBBEliminarTodosClick(Sender: TObject);
   private
    rp_donante, nombre_donante, hba_donante : Variant;
    id_donante : integer;
    destino_embriones: integer;
    mostrar_congelado: boolean;
    
    procedure BorrarAuxiliares;
    procedure Seleccionar(Sender : TObject);
    procedure ObtenerReceptoras();
    procedure ObtenerDonantes();
    procedure CargarDatos();
    procedure ArmarPreview(F : TFDOCertificadoRecupEmbrionesPreview);
  public

  end;

var
  FDOCertificadoRecupEmbriones: TFDOCertificadoRecupEmbriones;

implementation

uses
  UPrincipal, UDMSoftvet, UCartel;

{$R *.dfm}

procedure TFDOCertificadoRecupEmbriones.DBLCBADonanteCloseUp(
  Sender: TObject);
begin
  inherited;
  if DBLCBADonante.KeyValue <> null then
  begin
    id_donante := DBLCBADonante.KeyValue;
    LRaza.Caption := IBQDonantes.FieldValues['NOM_RAZA'];
    if IBQDonantes.FieldValues['TIPIFICACION_SANGUINEA'] <> null then
      LTipSang.Caption := IBQDonantes.FieldValues['TIPIFICACION_SANGUINEA']
    else
      LTipSang.Caption := '';
    IBQDatosColecta.Close;
    IBQDatosColecta.ParamByName('animal').AsInteger := id_donante;
    IBQDatosColecta.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDatosColecta.Open;

    BDBGColecta.SetFocus;
    end;
  
end;

procedure TFDOCertificadoRecupEmbriones.ObtenerDonantes;
var
  C : TCartel;
begin
  C := TCartel.getInstance;
  C.abrircartel('Cargando Donantes para Certificado de Recuperación de Embriones');
  IBQDonantes.Close;
  IBQDonantes.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDonantes.ParamByName('rp').Value := rp_donante;
  IBQDonantes.ParamByName('nombre').Value := nombre_donante;
  IBQDonantes.ParamByName('hba').Value := hba_donante;
  if (rp_donante = null) and (nombre_donante = null) and (hba_donante = null) then
    IBQDonantes.ParamByName('rp').AsString := '%';
  IBQDonantes.Open;
  C.cerrarcartel;
  C.FreeInstance;
end;

procedure TFDOCertificadoRecupEmbriones.FormCreate(Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := Seleccionar;
  nombre_donante := null;
  rp_donante := null;
  hba_donante := null;
  ObtenerDonantes();
  IBQDescDestinos.Close;
  IBQDescDestinos.Open;
end;

procedure TFDOCertificadoRecupEmbriones.IBQDonantesCalcFields(
  DataSet: TDataSet);
var
  nombre : string;
begin
  nombre := DataSet.FieldValues['id_rp'];
  inherited;
  if DataSet.FieldByName('nombre').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['nombre'];
  if DataSet.FieldByName('id_hba').Value <> null then
    nombre := nombre+' '+DataSet.FieldValues['id_hba'];
  IBQDonantesNOMBRE_COM.Value := nombre;
end;

procedure TFDOCertificadoRecupEmbriones.IBQDonantesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  IBQDonantes.Last;
  IBQDonantes.First;
  LCant.Caption := IntToStr(IBQDonantes.RecordCount);
end;

procedure TFDOCertificadoRecupEmbriones.Seleccionar(Sender : TObject);
begin
  FSeleccion.IBQSeleccionados.Insert;
  FSeleccion.IBQSeleccionados.FieldByName('ID_ANIMAL').Value := FSeleccion.IBQDisponibles.FieldValues['ID_ANIMAL'];
  FSeleccion.IBQSeleccionados.FieldByName('ID_RP').Value := FSeleccion.IBQDisponibles.FieldValues['ID_RP'];
  FSeleccion.IBQSeleccionados.FieldByName('ID_SENASA').Value := FSeleccion.IBQDisponibles.FieldValues['ID_SENASA'];
  FSeleccion.IBQSeleccionados.FieldByName('RAZA').Value := FSeleccion.IBQDisponibles.FieldValues['RAZA'];
  FSeleccion.IBQSeleccionados.FieldByName('POTRERO').Value := FSeleccion.IBQDisponibles.FieldValues['DIAS_GESTACION'];
  FSeleccion.IBQSeleccionados.FieldByName('LOTE').Value := FSeleccion.IBQDisponibles.FieldValues['ESTADIO'];
  FSeleccion.IBQSeleccionados.FieldByName('RODEO').Value := FSeleccion.IBQDisponibles.FieldValues['CALIDAD'];
  FSeleccion.IBQSeleccionados.FieldByName('FECHA_NACIMIENTO').Value := FSeleccion.IBQDisponibles.FieldValues['FECHA'];
  FSeleccion.IBQSeleccionados.FieldByName('ID_AUX').Value := 1;
end;

procedure TFDOCertificadoRecupEmbriones.IBQDatosColectaAfterOpen(
  DataSet: TDataSet);

begin
  inherited;
  ObtenerReceptoras;
  //BBImprimirReporte.Enabled := not DataSet.IsEmpty;
  TSCertificado.TabVisible := not DataSet.IsEmpty;
  //BBSiguiente.Enabled := not DataSet.IsEmpty;
  ISig.Enabled := not DataSet.IsEmpty;
  LSig.Enabled := not DataSet.IsEmpty;


     
end;

procedure TFDOCertificadoRecupEmbriones.ObtenerReceptoras;
var
  C : TCartel;
  cant_congelados, cant_frescos: integer;
begin
  C := TCartel.getInstance;
  C.abrircartel('Cargando Receptoras para Certificado de Recuperación de Embriones');
  FSeleccion.IBQDisponibles.Close;
  FSeleccion.IBQDisponibles.ParamByName('madre').AsInteger := id_donante;
  FSeleccion.IBQDisponibles.ParamByName('fecha').AsDate := IBQDatosColecta.FieldValues['FECHA_COLECTA'];
  FSeleccion.IBQDisponibles.ParamByName('p1').AsInteger := IBQDatosColecta.FieldValues['ID_P1'];
  FSeleccion.IBQDisponibles.ParamByName('p2').AsInteger := IBQDatosColecta.FieldValues['ID_P2'];

  cant_congelados := IBQDatosColecta.FieldValues['CONGELADOS'];
  cant_frescos := IBQDatosColecta.FieldValues['FRESCOS'];

  destino_embriones := cant_congelados + cant_frescos;

  if (cant_congelados > 0) then
  begin
    mostrar_congelado := true;
  end
  else
  begin
    mostrar_congelado := false;
  end;

   
  FSeleccion.IBQDisponibles.Open;
  BorrarAuxiliares();
  FSeleccion.IBQSeleccionados.Close;
  FSeleccion.IBQSeleccionados.Open;
  C.cerrarcartel;
  C.FreeInstance;
end;

procedure TFDOCertificadoRecupEmbriones.BorrarAuxiliares;
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

{
procedure TFDOCertificadoRecupEmbriones.ObtieneCongeladoFresco;
var
  index: integer;
begin

  index := BDBGColecta.SelectedIndex;
  IBQDatosColecta.First;
  IBQDatosColecta.MoveBy(index);
  if IBQDatosColecta.FieldValues['DESTINO_EMBRION'] <> null then
  begin
   destino_embriones := IBQDatosColecta.FieldValues['DESTINO_EMBRION'];
   if destino_embriones = 1 then
     ShowMessage('Es congelado')
   else
     ShowMessage('Es fresco');
  end
  else
  begin
   destino_embriones := 0;
   ShowMessage('Es fresco');
  end;

end;
}
 
procedure TFDOCertificadoRecupEmbriones.BDBGColectaCellClick(
  Column: TColumn);
begin
  inherited;

  ObtenerReceptoras;
end;

procedure TFDOCertificadoRecupEmbriones.EARPChange(Sender: TObject);
begin
  inherited;

  rp_donante := EARP.Text+'%';
  if rp_donante = '%' then
    rp_donante := null;

  ObtenerDonantes();
end;

procedure TFDOCertificadoRecupEmbriones.EANombreChange(Sender: TObject);
begin
  inherited;
  nombre_donante := EANombre.Text+'%';
  if nombre_donante = '%' then
    nombre_donante := null;
  ObtenerDonantes();
end;

procedure TFDOCertificadoRecupEmbriones.EAHBAChange(Sender: TObject);
begin
  inherited;
  hba_donante := EAHBA.Text+'%';
  if hba_donante = '%' then
    hba_donante := null;
  ObtenerDonantes();
end;

procedure TFDOCertificadoRecupEmbriones.PCDatosChange(Sender: TObject);
begin
  inherited;
  BBImprimirReporte.Enabled := PCDatos.ActivePage = TSCertificado;
  if PCDatos.ActivePage = TSCertificado then
  begin
    IBDSReceptoras.Close;
    IBDSReceptoras.Open;
    IBQEmbriones.Close;
    IBQEmbriones.ParamByName('madre').AsInteger := id_donante;
    IBQEmbriones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQEmbriones.ParamByName('fecha_colecta').AsDate := IBQDatosColecta.FieldValues['FECHA_COLECTA'];

    {IBQEmbriones.ParamByName('p1').AsInteger := IBQDatosColecta.FieldValues['ID_P1'];
    IBQEmbriones.ParamByName('p2').AsInteger := IBQDatosColecta.FieldValues['ID_P2'];
    }
    IBQEmbriones.Open;
    CargarDatos();
  end;
end;

procedure TFDOCertificadoRecupEmbriones.IBQEmbrionesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  IBDSEmbriones.Close;
  IBDSEmbriones.Open;
  IBQEmbriones.First;

  while not IBQEmbriones.Eof do
  begin
    IBDSEmbriones.Insert;
    IBDSEmbriones.FieldByName('id_embrion').Value := IBQEmbriones.FieldValues['id_embrion'];
    IBDSEmbriones.FieldByName('serie').Value := IBQEmbriones.FieldValues['serie'];
    IBDSEmbriones.FieldByName('nro_envase').Value := IBQEmbriones.FieldValues['nro_envase'];
    IBDSEmbriones.FieldByName('cant_lavajes').Value := IBQEmbriones.FieldValues['cant_lavajes'];
    IBDSEmbriones.FieldByName('id_estadio').Value := IBQEmbriones.FieldValues['estadio'];
    IBDSEmbriones.FieldByName('id_calidad').Value := IBQEmbriones.FieldValues['calidad'];
    IBDSEmbriones.Post;
    IBQEmbriones.Next;
  end
end;

procedure TFDOCertificadoRecupEmbriones.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFDOCertificadoRecupEmbriones.CargarDatos;
begin

  if IBQDonantes.FieldValues['NOM_RAZA'] <> null then
    LRazaDonante.Caption := IBQDonantes.FieldValues['NOM_RAZA'];
  if IBQDonantes.FieldValues['NOMBRE'] <> null then
    LNombreDonante.Caption := IBQDonantes.FieldValues['NOMBRE'];
  if IBQDonantes.FieldValues['TIPIFICACION_SANGUINEA'] <> null then
    LTSDonante.Caption := IBQDonantes.FieldValues['TIPIFICACION_SANGUINEA'];
  if IBQDonantes.FieldValues['ID_HBA'] <> null then
    LHBADonante.Caption := IBQDonantes.FieldValues['ID_HBA'];
  if IBQDonantes.FieldValues['CRIADOR'] <> null then
    EACriador.Text := IBQDonantes.FieldValues['NOM_CRIADOR'];
  if IBQDonantes.FieldValues['ID_RP'] <> null then
    LRPDonante.Caption := IBQDonantes.FieldValues['ID_RP'];

  if IBQDatosColecta.FieldValues['NOM_CENTRO'] <> null then
    ECentro.Text := IBQDatosColecta.FieldValues['NOM_CENTRO'];
  if IBQDatosColecta.FieldValues['HAB_CENTRO'] <> null then
    EHabilitacion.Text := IBQDatosColecta.FieldValues['HAB_CENTRO'];
  if IBQDatosColecta.FieldValues['NRO_INSC'] <> null then
    EInscripcion.Text := IBQDatosColecta.FieldValues['NRO_INSC'];

  if IBQDatosColecta.FieldValues['NOMBRE_P1'] <> null then
    LNombrePadre1.Caption := IBQDatosColecta.FieldValues['NOMBRE_P1'];
  if IBQDatosColecta.FieldValues['TIPO_SANG_P1'] <> null then
    LTSPadre1.Caption := IBQDatosColecta.FieldValues['TIPO_SANG_P1'];
  if IBQDatosColecta.FieldValues['HBA_P1'] <> null then
    LHBAPadre1.Caption := IBQDatosColecta.FieldValues['HBA_P1'];
  if IBQDatosColecta.FieldValues['RP_P1'] <> null then
    LRPPadre1.Caption := IBQDatosColecta.FieldValues['RP_P1'];

  if IBQDatosColecta.FieldValues['NOMBRE_P2'] <> null then
    LNombrePadre2.Caption := IBQDatosColecta.FieldValues['NOMBRE_P2'];
  if IBQDatosColecta.FieldValues['TIPO_SANG_P2'] <> null then
    LTSPadre2.Caption := IBQDatosColecta.FieldValues['TIPO_SANG_P2'];
  if IBQDatosColecta.FieldValues['HBA_P2'] <> null then
    LHBAPadre2.Caption := IBQDatosColecta.FieldValues['HBA_P2'];
  if IBQDatosColecta.FieldValues['RP_P2'] <> null then
    LRPPadre2.Caption := IBQDatosColecta.FieldValues['RP_P2'];

  if IBQDatosColecta.FieldValues['FECHA_SERVICIO'] <> null then
    LFechaServicio.Caption := IBQDatosColecta.FieldValues['FECHA_SERVICIO'];
  if IBQDatosColecta.FieldValues['FECHA_COLECTA'] <> null then
    LFechaColecta.Caption := IBQDatosColecta.FieldValues['FECHA_COLECTA'];
  if IBQDatosColecta.FieldValues['CANT_EMBRIONES_DEG'] <> null then
    LEmbrionesDeg.Caption := IBQDatosColecta.FieldValues['CANT_EMBRIONES_DEG'];
  if IBQDatosColecta.FieldValues['CANT_EMBRIONES_NF'] <> null then
    LEmbrionesSinF.Caption := IBQDatosColecta.FieldValues['CANT_EMBRIONES_NF'];
  if IBQDatosColecta.FieldValues['CANT_EMBRIONES_TE'] <> null then
    LEmbrionesTransferibles.Caption := IBQDatosColecta.FieldValues['CANT_EMBRIONES_TE'];
  if IBQDatosColecta.FieldValues['CANT_EMBRIONES_TR'] <> null then
    LEmbrionesTransferidos.Caption := IBQDatosColecta.FieldValues['CANT_EMBRIONES_TR'];
  if IBQDatosColecta.FieldValues['CONGELADOS'] <> null then
    LtotalCong.Caption := IBQDatosColecta.FieldValues['CONGELADOS'];
  if IBQDatosColecta.FieldValues['FRESCOS'] <> null then
    LtotalFrescos.Caption := IBQDatosColecta.FieldValues['FRESCOS'];
  LtotalEmbriones.Caption := IBQDatosColecta.FieldValues['FRESCOS'] + IBQDatosColecta.FieldValues['CONGELADOS'];
  if IBDSReceptoras.FieldValues['POTRERO'] <> null then
    LDiasGestacion.Caption := IBDSReceptoras.FieldValues['POTRERO'];

end;

procedure TFDOCertificadoRecupEmbriones.BBImprimirReporteClick(
  Sender: TObject);
var
  F : TFDOCertificadoRecupEmbrionesPreview;
  C : TCartel;
begin
  inherited;
  C := TCartel.getInstance;
  C.abrircartel('Generando Certificado de Recuperación de Embriones');
  F := TFDOCertificadoRecupEmbrionesPreview.Create(nil);

  ArmarPreview(F);
  C.cerrarcartel;
  C.FreeInstance;
  F.ShowModal;
  F.Destroy;
end;

procedure TFDOCertificadoRecupEmbriones.ArmarPreview(F : TFDOCertificadoRecupEmbrionesPreview);
begin
  F.QRLRazaDonante.Caption := LRazaDonante.Caption;
  F.QRLFolio.Caption := EAFolio.Text;
  F.QRLCriador.Caption := EACriador.Text;
  F.QRLEXPD.Caption := EANroExp.Text;
  F.QRLCentroTransplante.Caption := ECentro.Text;
  F.QRLHabilitacion.Caption := EHabilitacion.Text;
  F.QRLInscripcion.Caption := EInscripcion.Text;
  F.QRLNombreDonante.Caption := LNombreDonante.Caption;
  F.QRLTipoSangDonante.Caption := LTSDonante.Caption;
  F.QRLHBADonante.Caption := LHBADonante.Caption;
  F.QRLRPDonante.Caption := LRPDonante.Caption;
  F.QRLNombreP1.Caption := LNombrePadre1.Caption;
  F.QRLTipoSangP1.Caption := LTSPadre1.Caption;
  F.QRLHBAP1.Caption := LHBAPadre1.Caption;
  F.QRLRPP1.Caption := LRPPadre1.Caption;
  F.QRLNombreP2.Caption := LNombrePadre2.Caption;
  F.QRLTipoSangP2.Caption := LTSPadre2.Caption;
  F.QRLHBAP2.Caption := LHBAPadre2.Caption;
  F.QRLRPP2.Caption := LRPPadre2.Caption;
  F.QRLNroCriador.Caption := EACriadorServicio.Text;
  F.QRLFechaServicio.Caption := LFechaServicio.Caption;
  F.QRLFolioServicio.Caption := EAFolioServicio.Text;
  F.QRLLineaServicio.Caption := EALineaServicio.Text;
  F.QRLTitularServicio.Caption := EATitularServicio.Text;
  F.QRLFechaColecta.Caption := LFechaColecta.Caption;
  F.QRLDiasGestacion.Caption := LDiasGestacion.Caption;
  F.QRLEmbrionesDeg.Caption := LEmbrionesDeg.Caption;
  F.QRLEmbrionesSinF.Caption := LEmbrionesSinF.Caption;
  F.QRLEmbrionesTrans.Caption := LEmbrionesTransferibles.Caption;
  F.QRLEmbrionesTranso.Caption := LEmbrionesTransferidos.Caption;
  F.QRMObservacionesCong.Lines := MObservacionCong.Lines;
  F.QRLTipoEnvase.Caption := EATipoEnvase.Text;
  F.QRLTiempoRecup.Caption := EATiempoRecuperacion.Text;
  F.QRLCrioprotector.Caption := DBLCBADescDestinos.Text;
  F.QRLEquilibracion.Caption := EAEquilibracion.Text;
  F.QRLCongelacion.Caption := EACongelacion.Text;
  F.QRLDescongelacion.Caption := EADescongelacion.Text;
  F.QRLTransferDir.Caption := EATransferenciaDirecta.Text;
  F.mostrar_congelado := mostrar_congelado;
  F.QRLTotalEmbriones.Caption := inttostr(destino_embriones);
  F.QRLTotalCong.Caption := LtotalCong.Caption;
  F.QRLTotalFrescos.Caption := LtotalFrescos.Caption;


end;

procedure TFDOCertificadoRecupEmbriones.BBSiguienteClick(Sender: TObject);
begin
  inherited;
  //BBSiguiente.Enabled := false;
  //BBAnterior.Enabled := true;
  LPreview.Visible := true;
  IPreview.Visible := true;
  LSig.Enabled := false;
  ISig.Enabled := false;
  Lant.Enabled := true;
  Iant.Enabled := true;


  if PCDatos.ActivePage = TSDatos then
  begin
    PCDatos.ActivePage := TSCertificado;
    if (Self.mostrar_congelado) then
    begin
        if not IBDSEmbriones.IsEmpty then
        begin
          IBDSEmbriones.Delete;
        end;

        PanelCongelados.Visible := true;
    end
    else
    begin
        PanelCongelados.Visible := false;
    end;
  end;
  PCDatosChange(nil);
end;

procedure TFDOCertificadoRecupEmbriones.BBAnteriorClick(Sender: TObject);
begin
  inherited;
  //BBSiguiente.Enabled := true;
  //BBAnterior.Enabled := false;
  LPreview.Visible := false;
  IPreview.Visible := false;
  LSig.Enabled := true;
  ISig.Enabled := true;
  Lant.Enabled := false;
  Iant.Enabled := false;

  if PCDatos.ActivePage = TSCertificado then
    PCDatos.ActivePage := TSDatos;
  PCDatosChange(nil);
end;

procedure TFDOCertificadoRecupEmbriones.IBQDescDestinosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFDOCertificadoRecupEmbriones.FSeleccionBBAgregarTodosClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := Seleccionar;
  FSeleccion.BBAgregarTodosClick(Sender);
end;

procedure TFDOCertificadoRecupEmbriones.FSeleccionBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := Seleccionar;
  FSeleccion.BBAgregarUnoClick(Sender);
end;

procedure TFDOCertificadoRecupEmbriones.FSeleccionBBEliminarUnoClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := Seleccionar;
  FSeleccion.BBEliminarUnoClick(Sender);
end;

procedure TFDOCertificadoRecupEmbriones.FSeleccionBBEliminarTodosClick(
  Sender: TObject);
begin
  inherited;
  FSeleccion.OnSelectItem := Seleccionar;
  FSeleccion.BBEliminarTodosClick(Sender);
end;

end.
