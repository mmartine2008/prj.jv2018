unit UEveCambioUbicacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, WinXP, DataExport, DataToXLS, EditAuto, Types,
  ImgList, PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls,
  JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom, XMLIntf,
  msxmldom, XMLDoc, Menus;

type

  TFEveCambioUbicacion = class(TFEveSimple)
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimplePOTRERO: TIBStringField;
    IBDSSimpleIDPOTRERO: TIntegerField;
    IBDSSimpleRODEO: TIBStringField;
    IBDSSimpleIDRODEO: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    IBQRodeo: TIBQuery;
    DSRodeo: TDataSource;
    GBPotRod: TGroupBox;
    Label1: TLabel;
    DBLCBARodeo: TDBLookupComboBoxAuto;
    CkBRodeo: TCheckBox;
    GroupBox3: TGroupBox;
    IBQEstablecimiento: TIBQuery;
    DSEstablecimiento: TDataSource;
    CKBEstablecimiento: TCheckBox;
    IBSPCambioHijos: TIBStoredProc;
    IBQUbicacionVieja: TIBQuery;
    TSCambioEstablecimiento: TTabSheet;
    GroupBox4: TGroupBox;
    GBBaja: TGroupBox;
    LDestino: TLabel;
    DBLCBADestino: TDBLookupComboBoxAuto;
    LDTA: TLabel;
    EADtaBaja: TEditAuto;
    Label3: TLabel;
    DBLCBATipo: TDBLookupComboBoxAuto;
    LPeso: TLabel;
    EAPeso: TEditAuto;
    LPesoDestino: TLabel;
    EAPesoDestino: TEditAuto;
    LPrecio: TLabel;
    EAPrecio: TEditAuto;
    GBDatosAlta: TGroupBox;
    DBLCBAActividad: TDBLookupComboBoxAuto;
    LActividad: TLabel;
    LOrigen: TLabel;
    DBLCBAOrigen: TDBLookupComboBoxAuto;
    LCriador: TLabel;
    DBLCBACriador: TDBLookupComboBoxAuto;
    LPropietario: TLabel;
    DBLCBAPropietario: TDBLookupComboBoxAuto;
    DTPAFechaIngreso: TDateTimePickerAuto;
    Label4: TLabel;
    EADTAAlta: TEditAuto;
    Label7: TLabel;
    GroupBox7: TGroupBox;
    LEstablecimiento: TLabel;
    DBLCBAEstablecimiento: TDBLookupComboBoxAuto;
    Label6: TLabel;
    DBLCBARodeoEsta: TDBLookupComboBoxAuto;
    Label5: TLabel;
    DBLCBAPotreroEsta: TDBLookupComboBoxAuto;
    EAValor: TEditAuto;
    LValor: TLabel;
    EAPrecioB: TEditAuto;
    PrecioKg: TLabel;
    LPrecioCabeza: TLabel;
    EAPrecioU: TEditAuto;
    GroupBox5: TGroupBox;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    LObservador: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    LFecha: TLabel;
    CkBPotrero: TCheckBox;
    Label2: TLabel;
    DBLCBAPotrero: TDBLookupComboBoxAuto;
    IBDSSimpleIDESTA: TIntegerField;
    IBDSSimpleESTA: TIBStringField;
    IBDSSimpleIDACTIVIDAD: TIntegerField;
    IBDSSimpleACTIVIDAD: TIBStringField;
    IBDSSimpleIDCRIADOR: TIntegerField;
    IBDSSimpleCRIADOR: TIBStringField;
    IBDSSimpleIDORIGEN: TIntegerField;
    IBDSSimpleORIGEN: TIBStringField;
    IBDSSimpleIDPROPIETARIO: TIntegerField;
    IBDSSimplePROPIETARIO: TIBStringField;
    IBDSSimpleIDDESTINO: TIntegerField;
    IBDSSimpleDESTINO: TIBStringField;
    IBDSSimpleDTA_ALTA: TIBStringField;
    IBDSSimpleDTA_BAJA: TIBStringField;
    IBDSSimpleFECHAINGRESO: TDateField;
    IBQTipoBajas: TIBQuery;
    DSTiposBaja: TDataSource;
    IBQBuscarFotos: TIBQuery;
    DBLCBAEmpleadoAlta: TDBLookupComboBoxAuto;
    Label8: TLabel;
    IBQEmpleadoAlta: TIBQuery;
    DSEmpleadoAlta: TDataSource;
    IBDSSimpleIDRESPALTA: TIntegerField;
    IBDSSimpleRESPALTA: TIBStringField;
    IBQInserEveCambioUbic: TIBQuery;
    IBQUltimoPotrero: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDSSimpleFECHASetText(Sender: TField; const Text: String);
    procedure IBQRodeoAfterOpen(DataSet: TDataSet);
    procedure CkBPotreroClick(Sender: TObject);
    procedure TF(Sender: TObject);
    procedure CkBRodeoClick(Sender: TObject);
    procedure DBLCBAEstablecimientoCloseUp(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure IBQTipoBajasAfterOpen(DataSet: TDataSet);
    procedure DBLCBATipoCloseUp(Sender: TObject);
    procedure PrecioChange(Sender: TObject);
    procedure IBQSPEventoIndAfterOpen(DataSet: TDataSet);
    procedure TSCambioEstablecimientoShow(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LDestinoClick(Sender: TObject);
    procedure LActividadClick(Sender: TObject);
    procedure LPropietarioClick(Sender: TObject);
    procedure LOrigenClick(Sender: TObject);
    procedure LCriadorClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure IBQEmpleadoAltaAfterOpen(DataSet: TDataSet);
    procedure EAPesoKeyPress(Sender: TObject; var Key: Char);
    procedure PCBasicoChange(Sender: TObject);
  private
    CambioEstablecimiento : Boolean;
    potrero_origen : integer;
    procedure ActualizarConsultas(Establecimiento : Variant);
    procedure MoverHijos();
    procedure UbicacionVieja(id_Animal : integer; var rodeo, potrero : Variant);
    procedure PrepararCambioEstablecimiento();
    procedure ParametrosMasivosCambioEsta();
    procedure ParametrosMasivosCambioUbic();
    procedure CargarDatosGrillaCambioUbic();
    procedure CargarDatosGrillaCambioEsta();
    procedure CargarParametrosRNCambioEsta();
    procedure CargarParametrosRNCambioUbic();
    procedure ParametrosSPCambioEsta();
    procedure ParametrosSPCambioUbic();
    procedure ActivarRequeridos(Activo : Boolean);
    procedure CambiarFotos(animal : integer);
    procedure HabilitarComponentesVersionBasica; override;     
  protected
    Procedure CargarParametrosSP;override;
    Procedure CargarParametrosRN;override;
    procedure CargarDatosGrilla;override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
    procedure ManejarDatosDeSP; override;
    procedure insertEveCambioUbicacion();override;
  public
  end;

var
  FEveCambioUbicacion: TFEveCambioUbicacion;

implementation

uses UPrincipal,uTiposGlobales,UClassType, DateUtils, UDMSoftvet, Uabmpotreros, UABMRodeos,
     UAbmEmpleados, UABMSimple, UImportacion, UMensajeHuella,
     UABMDestino, UABMActividad, UABMOrigen, UABMPropietarioAnimal, UABMCriador, UTraduccion,
  UEveUniversal;

{$R *.dfm}



{ TFEveCambioUbicacion }

procedure TFEveCambioUbicacion.CargarDatosGrillaCambioUbic();
begin
    IDAnimal := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_RP').Value:= MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value:= MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.DateTime]);
    RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[DBLCBAResponsable.Text,DBLCBAResponsable.GetDato]);
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    IBDSSimple.FieldByName('ID_ANIMAL').Value := IDAnimal;
    if(CkBPotrero.Checked)then
    begin
      RealizarCambio(CkBPotrero,[IBDSSimple.FieldByName('IDPOTRERO'),IBDSSimple.FieldByName('POTRERO')],[null,'']);
      RealizarCambio(DBLCBAPotrero,[IBDSSimple.FieldByName('IDPOTRERO'),IBDSSimple.FieldByName('POTRERO')],[DBLCBAPotrero.KeyValue,DBLCBAPotrero.Text]);
    end
    else
    begin
      RealizarCambio(CkBPotrero,[IBDSSimple.FieldByName('IDPOTRERO'),IBDSSimple.FieldByName('POTRERO')],[null,'']);
      RealizarCambio(DBLCBAPotrero,[IBDSSimple.FieldByName('IDPOTRERO'),IBDSSimple.FieldByName('POTRERO')],[DBLCBAPotrero.KeyValue,'']);
    end;
    if(CkBRodeo.Checked)then
    begin
      RealizarCambio(CkBRodeo,[IBDSSimple.FieldByName('IDRODEO'),IBDSSimple.FieldByName('RODEO')],[null,'']);
      RealizarCambio(DBLCBARodeo,[IBDSSimple.FieldByName('IDRODEO'),IBDSSimple.FieldByName('RODEO')],[DBLCBARodeo.KeyValue,DBLCBARodeo.text]);
    end
    else
    begin
      RealizarCambio(CkBRodeo,[IBDSSimple.FieldByName('IDRODEO'),IBDSSimple.FieldByName('RODEO')],[null,'']);
      RealizarCambio(CkBRodeo,[IBDSSimple.FieldByName('IDRODEO'),IBDSSimple.FieldByName('RODEO')],[DBLCBARodeo.KeyValue,'']);
    end;
end;

procedure TFEveCambioUbicacion.CargarDatosGrillaCambioEsta();
begin
    IDAnimal := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    IBDSSimple.FieldByName('ID_RP').Value:= MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    IBDSSimple.FieldByName('ID_SENASA').Value:= MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.DateTime]);
    RealizarCambio(DTPAFechaIngreso,[IBDSSimple.FieldByName('FECHAINGRESO')],[DTPAFechaIngreso.DateTime]);
    RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('RESP'),IBDSSimple.FieldByName('RESPONSABLE')],[DBLCBAResponsable.Text,DBLCBAResponsable.GetDato]);
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    IBDSSimple.FieldByName('ID_ANIMAL').Value := IDAnimal;
    RealizarCambio(DBLCBAEstablecimiento,[IBDSSimple.FieldByName('ESTA'),IBDSSimple.FieldByName('IDESTA')],[DBLCBAEstablecimiento.Text,DBLCBAEstablecimiento.GetDato]);
    RealizarCambio(DBLCBAPotreroEsta,[IBDSSimple.FieldByName('IDPOTRERO'),IBDSSimple.FieldByName('POTRERO')],[DBLCBAPotreroEsta.KeyValue,DBLCBAPotreroEsta.Text]);
    RealizarCambio(DBLCBARodeoEsta,[IBDSSimple.FieldByName('IDRODEO'),IBDSSimple.FieldByName('RODEO')],[DBLCBARodeoEsta.KeyValue,DBLCBARodeoEsta.text]);
    RealizarCambio(DBLCBAActividad,[IBDSSimple.FieldByName('IDACTIVIDAD'),IBDSSimple.FieldByName('ACTIVIDAD')],[DBLCBAActividad.KeyValue,DBLCBAActividad.text]);
    RealizarCambio(DBLCBACriador,[IBDSSimple.FieldByName('IDCRIADOR'),IBDSSimple.FieldByName('CRIADOR')],[DBLCBACriador.KeyValue,DBLCBACriador.text]);
    RealizarCambio(DBLCBAOrigen,[IBDSSimple.FieldByName('IDORIGEN'),IBDSSimple.FieldByName('ORIGEN')],[DBLCBAOrigen.KeyValue,DBLCBAOrigen.text]);
    RealizarCambio(DBLCBAPropietario,[IBDSSimple.FieldByName('IDPROPIETARIO'),IBDSSimple.FieldByName('PROPIETARIO')],[DBLCBAPropietario.KeyValue,DBLCBAPropietario.text]);
    RealizarCambio(DBLCBADestino,[IBDSSimple.FieldByName('IDDESTINO'),IBDSSimple.FieldByName('DESTINO')],[DBLCBADestino.KeyValue,DBLCBADestino.text]);
    RealizarCambio(EADTAAlta,[IBDSSimple.FieldByName('DTA_ALTA')],[EADTAAlta.Text]);
    RealizarCambio(EADtaBaja,[IBDSSimple.FieldByName('DTA_BAJA')],[EADtaBaja.Text]);
    RealizarCambio(DBLCBAEmpleadoAlta,[IBDSSimple.FieldByName('IDRESPALTA'),IBDSSimple.FieldByName('RESPALTA')],[DBLCBAEmpleadoAlta.KeyValue,DBLCBAEmpleadoAlta.Text]);
end;

procedure TFEveCambioUbicacion.CargarDatosGrilla;
begin
  inherited;
  if CambioEstablecimiento then
    CargarDatosGrillaCambioEsta()
  else
    CargarDatosGrillaCambioUbic();
end;

procedure TFEveCambioUbicacion.CargarParametrosMasivo;
begin
  if CambioEstablecimiento then
    ParametrosMasivosCambioEsta
  else
    ParametrosMasivosCambioUbic;
end;

procedure TFEveCambioUbicacion.CargarParametrosRN;
begin
  inherited;
  if CambioEstablecimiento then
    CargarParametrosRNCambioEsta()
  else
    CargarParametrosRNCambioUbic();
end;

procedure TFEveCambioUbicacion.CargarParametrosRNCambioEsta();
begin
  IBQSPRN.ParamByName('ESTA_ACTUAL').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPRN.ParamByName('ESTA_DESTINO').AsInteger := DBLCBAEstablecimiento.KeyValue;

  if modoEve = meMasivo then
  begin
    IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
    IBQSPRN.ParamByName('FECHA_BAJA').AsDateTime := IBDSSimple.fieldbyname('FECHA').AsDateTime;
    IBQSPRN.ParamByName('FECHA_ALTA').AsDateTime := IBDSSimple.fieldbyname('FECHAINGRESO').AsDateTime;
  end
  else
  begin
    IBQSPRN.ParamByName('ANIMAL').AsInteger := IDAnimal;
    IBQSPRN.ParamByName('FECHA_BAJA').AsDateTime := DTPAFecha.DateTime;
    IBQSPRN.ParamByName('FECHA_ALTA').AsDateTime := DTPAFechaIngreso.DateTime;
  end;
end;

procedure TFEveCambioUbicacion.CargarParametrosRNCambioUbic();
begin
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  if(self.ModoEve = meIndividual)then
  begin
    IBQSPRN.ParamByName('animal').AsInteger := IDAnimal;
    IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
  end
  else
  begin
    IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
    IBQSPRN.ParamByName('fecha').AsDateTime := IBDSSimple.fieldbyname('fecha').AsDateTime;
  end;
end;

procedure TFEveCambioUbicacion.ParametrosSPCambioEsta();
var
  d : double;
  i : double;
begin
  IBQSPEventoInd.ParamByName('FECHA_BAJA').AsDate := DTPAFecha.Date;
  IBQSPEventoInd.ParamByName('FECHA_ALTA').AsDate := DTPAFechaIngreso.Date;
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.Text;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO_ACTUAL').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO_DESTINO').Value := DBLCBAEstablecimiento.KeyValue;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.KeyValue;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDate := NOW;
  IBQSPEventoInd.ParamByName('POTRERO').Value := DBLCBAPotreroEsta.KeyValue;
  IBQSPEventoInd.ParamByName('RODEO').Value := DBLCBARodeoEsta.KeyValue;
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := Null;
  IBQSPEventoInd.ParamByName('ACTIVIDAD').Value := DBLCBAActividad.KeyValue;
  IBQSPEventoInd.ParamByName('PROPIETARIO').Value := 0;//DBLCBAPropietario.KeyValue;
  IBQSPEventoInd.ParamByName('ORIGEN').Value := DBLCBAOrigen.KeyValue;
  IBQSPEventoInd.ParamByName('CRIADOR').Value := DBLCBACriador.KeyValue;
  IBQSPEventoInd.ParamByName('DESTINO').Value := DBLCBADestino.KeyValue;
  IBQSPEventoInd.ParamByName('DTA_ALTA').Value := EADtaBaja.GetDato;
  IBQSPEventoInd.ParamByName('DTA_BAJA').Value := EADTAAlta.GetDato;
  IBQSPEventoInd.ParamByName('TIPO').Value := DBLCBATipo.KeyValue;
  IBQSPEventoInd.ParamByName('RESP_ALTA').Value := DBLCBAEmpleadoAlta.KeyValue;
  IBQSPEventoInd.ParamByName('SUBCATEGORIA').Value := 0;
  IBQSPEventoInd.ParamByName('CODIGO_MANEJO').Value := 0;

  if DBLCBATipo.KeyValue = 2 then
  begin
   { IBQSPEventoInd.ParamByName('PRECIO_VENTA').Value := NULL;
    IBQSPEventoInd.ParamByName('PESODESTINO').Value := NULL;  EAPeso }
     IBQSPEventoInd.ParamByName('PRECIO_VENTA').Value := NULL;
    i := 0;
    TryStrToFloat(EAPeso.Text,i);
    if i = 0 then
      IBQSPEventoInd.ParamByName('PESODESTINO').Value := null
    else
      IBQSPEventoInd.ParamByName('PESODESTINO').Value := i;

  end
  else
  begin
    d := 0;
    TryStrToFloat(EAPrecio.Text,d);
    IBQSPEventoInd.ParamByName('PRECIO_VENTA').Value := d;
    i := 0;
    TryStrToFloat(EAPesoDestino.Text,i);
    if i = 0 then
      IBQSPEventoInd.ParamByName('PESODESTINO').Value := null
    else
      IBQSPEventoInd.ParamByName('PESODESTINO').Value := i;
  end;
  i := 0;
  TryStrToFloat(EAPeso.Text,i);
  if i = 0 then
    IBQSPEventoInd.ParamByName('PESO').Value := null
  else
    IBQSPEventoInd.ParamByName('PESO').Value := i;
  d := 0;
  TryStrToFloat(EAPrecioU.Text,d);
  IBQSPEventoInd.ParamByName('PRECIO_UNITARIO').Value := d;
  d := 0;
  TryStrToFloat(EAPrecioB.Text,d);
  IBQSPEventoInd.ParamByName('PRECIO_BRUTO').Value := d;
  d := 0;
  TryStrToFloat(EAValor.Text,d);
  IBQSPEventoInd.ParamByName('GASTOS').Value := d;
end;

procedure TFEveCambioUbicacion.ParametrosSPCambioUbic;
begin
  IBQUltimoPotrero.Close;
  IBQUltimoPotrero.ParamByName('fecha').AsDate := DTPAFecha.DateTime;
  IBQUltimoPotrero.ParamByName('id_animal').AsInteger := IDAnimal;
  IBQUltimoPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQUltimoPotrero.Open;

  if(IBQUltimoPotrero.FieldValues['potrero'] <> null)then
    potrero_origen := IBQUltimoPotrero.FieldValues['potrero']
  else
    potrero_origen := 0;


  IBQSPEventoInd.ParamByName('FECHA').AsDateTime  := DTPAFecha.DateTime;
  IBQSPEventoInd.ParamByName('ANIMAL').AsInteger := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.KeyValue;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger :=  FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDateTime := now;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := Null;
  if(CkBPotrero.Checked)then
    IBQSPEventoInd.ParamByName('ID_POTRERO').Value := DBLCBAPotrero.KeyValue;
  if(CkBRodeo.Checked)then
    IBQSPEventoInd.ParamByName('ID_RODEO').Value := DBLCBARodeo.KeyValue;
end;



procedure TFEveCambioUbicacion.CargarParametrosSP;
begin
  inherited;
  if CambioEstablecimiento then
    ParametrosSPCambioEsta
  else
    ParametrosSPCambioUbic;
end;

procedure TFEveCambioUbicacion.ParametrosMasivosCambioEsta();
var
  d : double;
  i : double;
begin
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('FECHA_BAJA').AsDate := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('FECHA_ALTA').AsDate := IBDSSimple.FieldValues['FECHAINGRESO'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO_ACTUAL').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO_DESTINO').Value := IBDSSimple.FieldValues['IDESTA'];
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimple.FieldValues['RESPONSABLE'];
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDate := NOW;
  IBQSPEventoInd.ParamByName('POTRERO').Value := IBDSSimple.FieldValues['IDPOTRERO'];
  IBQSPEventoInd.ParamByName('RODEO').Value := IBDSSimple.FieldValues['IDRODEO'];
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := Null;
  IBQSPEventoInd.ParamByName('ACTIVIDAD').Value := IBDSSimple.FieldValues['IDACTIVIDAD'];
  IBQSPEventoInd.ParamByName('PROPIETARIO').Value := 0;//IBDSSimple.FieldValues['IDPROPIETARIO'];
  IBQSPEventoInd.ParamByName('ORIGEN').Value := IBDSSimple.FieldValues['IDORIGEN'];
  IBQSPEventoInd.ParamByName('CRIADOR').Value := IBDSSimple.FieldValues['IDCRIADOR'];
  IBQSPEventoInd.ParamByName('DESTINO').Value := IBDSSimple.FieldValues['IDDESTINO'];
  IBQSPEventoInd.ParamByName('DTA_ALTA').Value := IBDSSimple.FieldValues['DTA_ALTA'];
  IBQSPEventoInd.ParamByName('DTA_BAJA').Value := IBDSSimple.FieldValues['DTA_BAJA'];
  IBQSPEventoInd.ParamByName('RESP_ALTA').Value := IBDSSimple.FieldValues['IDRESPALTA'];
  IBQSPEventoInd.ParamByName('SUBCATEGORIA').Value := 0;
  IBQSPEventoInd.ParamByName('CODIGO_MANEJO').Value := 0;
  IBQSPEventoInd.ParamByName('TIPO').Value := DBLCBATipo.KeyValue;
  IBQSPEventoInd.ParamByName('CODIGO_MANEJO').Value := null;


  if DBLCBATipo.KeyValue = 2 then
  begin
    {IBQSPEventoInd.ParamByName('PRECIO_VENTA').Value := NULL;
    IBQSPEventoInd.ParamByName('PESODESTINO').Value := NULL;  }
    IBQSPEventoInd.ParamByName('PRECIO_VENTA').Value := NULL;
    i := 0;
    TryStrToFloat(EAPeso.Text,i);
    if i = 0 then
      IBQSPEventoInd.ParamByName('PESODESTINO').Value := null
    else
      IBQSPEventoInd.ParamByName('PESODESTINO').Value := i;

  end
  else
  begin
    d := 0;
    TryStrToFloat(EAPrecio.Text,d);
    IBQSPEventoInd.ParamByName('PRECIO_VENTA').Value := d;
    i := 0;
    TryStrToFloat(EAPesoDestino.Text,i);
    if i = 0 then
      IBQSPEventoInd.ParamByName('PESODESTINO').Value := null
    else
      IBQSPEventoInd.ParamByName('PESODESTINO').Value := i;
  end;
  i := 0;
  TryStrToFloat(EAPeso.Text,i);
  if i = 0 then
    IBQSPEventoInd.ParamByName('PESO').Value := null
  else
    IBQSPEventoInd.ParamByName('PESO').Value := i;
  d := 0;
  TryStrToFloat(EAPrecioU.Text,d);
  IBQSPEventoInd.ParamByName('PRECIO_UNITARIO').Value := d;
  d := 0;
  TryStrToFloat(EAPrecioB.Text,d);
  IBQSPEventoInd.ParamByName('PRECIO_BRUTO').Value := d;
  d := 0;
  TryStrToFloat(EAValor.Text,d);
  IBQSPEventoInd.ParamByName('GASTOS').Value := d;
end;

procedure TFEveCambioUbicacion.ParametrosMasivosCambioUbic();
begin

  IBQUltimoPotrero.Close;
  IBQUltimoPotrero.ParamByName('fecha').AsDate := IBDSSimple.FieldValues['FECHA'];
  IBQUltimoPotrero.ParamByName('id_animal').AsInteger := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQUltimoPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQUltimoPotrero.Open;

  if(IBQUltimoPotrero.FieldValues['potrero'] <> null)then
    potrero_origen := IBQUltimoPotrero.FieldValues['potrero']
  else
    potrero_origen := 0;
    
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;

  IBQSPEventoInd.ParamByName('FECHA').AsDateTime := IBDSSimple.FieldValues['FECHA'];
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimple.FieldValues['OBSERVACION'];
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := NOW;
  if(CkBPotrero.Checked)then
    IBQSPEventoInd.ParamByName('ID_POTRERO').Value := IBDSSimple.FieldValues['IDPOTRERO'];
  if(CkBRodeo.Checked)then
    IBQSPEventoInd.ParamByName('ID_RODEO').Value := IBDSSimple.FieldValues['IDRODEO'];
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := Null;
end;

procedure TFEveCambioUbicacion.insertEveCambioUbicacion();
var evento : integer;
begin
  evento := IBQSPEventoInd.FieldValues['IDNUEVOEVENTO'];
  if not CambioEstablecimiento then
    begin
      IBQInserEveCambioUbic.Close;
      IBQInserEveCambioUbic.ParamByName('eve').AsInteger := evento;
      IBQInserEveCambioUbic.ParamByName('POT').Value := potrero_origen;
      IBQInserEveCambioUbic.Open;
    end;
    FPrincipal.IBTPrincipal.CommitRetaining;
end;

procedure TFEveCambioUbicacion.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;


  DMSoftvet.IBQActividad.Close;
  DMSoftvet.IBQActividad.Open;
  IBQTipoBajas.Close;
  IBQTipoBajas.Open;
  DMSoftvet.IBQCodDestino.Close;
  DMSoftvet.IBQCodDestino.Open;
  DMSoftvet.IBQCodPropietario.Close;
  DMSoftvet.IBQCodPropietario.Open;
  DMSoftvet.IBQCodOrigen.Close;
  DMSoftvet.IBQCodOrigen.Open;
  DMSoftvet.IBQCodCriador.Close;
  DMSoftvet.IBQCodCriador.Open;

  IBQRodeo.Close;
  IBQRodeo.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQRodeo.Open;

  IBQEstablecimiento.Close;
  IBQEstablecimiento.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQEstablecimiento.Open;

  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, nombre, apodo from VIS_CAMBIO_UBICACION ';

end;

procedure TFEveCambioUbicacion.FormShow(Sender: TObject);
begin
  inherited;
  //CkBPotrero.Checked := true;
  DTPAFecha.DateTime := Date();
  DTPAFechaIngreso.Date := DTPAFecha.Date;
  //DTPAFecha.MaxDate:= now;
  DMSoftvet.IBQPotrerosSinServicio.Close;
  DMSoftvet.IBQPotrerosSinServicio.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrerosSinServicio.Open;

//  IF(DBLCBAPotrero.Enabled)THEN
//     DBLCBAPotrero.AsignarValorDefecto;

  //DBLCBARodeo.AsignarValorDefecto;
  //DBLCBARodeo.Enabled:= false;
  
  MSimple.PasarParametros(0,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  DBLCBAResponsable.AsignarValorDefecto;

  DBLCBAEstablecimiento.AsignarValorDefecto;
  //DBLCBAEstablecimiento.Enabled:= false;

 // GroupBox3.Visible:= false;///
 ActivarRequeridos(false);
 CambioEstablecimiento := false;
 PrepararCambioEstablecimiento();
 //DecimalSeparator:='.';
end;

(*
  Verifica que el texto ingresado en las columnas de la grilla sea correcto y exista
*)
procedure TFEveCambioUbicacion.IBDSSimpleFECHASetText(Sender: TField;
  const Text: String);
var S: String;
 PickPos: integer;
begin
  inherited;
 if(IBDSSimple.State <> dsInsert)then
 begin

      SetText(sender,Text);
        if (Sender.FieldName = 'POTRERO') then
        begin      // POTRERO
          s:='select NOMBRE as valor from TAB_POTREROS where ((establecimiento = :esta) and (NOMBRE like '''+UpperCase(Text)+'''||''%''))';
          IBQValidaciones.SQL.Text :=S;
          if CambioEstablecimiento then
            IBQValidaciones.ParamByName('esta').AsInteger := IBDSSimpleIDESTA.Value
          else
            IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          IBQValidaciones.Open;
          if not(IBQValidaciones.IsEmpty) then
          begin
             Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
        //     BDBGSimple.ColumnByField('POTRERO').PickList :=   GenearaNuevoPickList(IBQPotrero);
             PickPos := BDBGSimple.ColumnByField('POTRERO').PickList.IndexOf(BDBGSimple.ColumnByField('POTRERO').Field.AsString);
             IBDSSimpleIDPOTRERO.AsInteger:= TClassType(BDBGSimple.ColumnByField('POTRERO').PickList.Objects[PickPos]).getValue;
          end;
        end;

        if (Sender.FieldName = 'RODEO') then
        begin      // RODEO
          s:='select NOMBRE as valor from TAB_RODEOS where ((establecimiento = :esta) and (NOMBRE like '''+UpperCase(Text)+'''||''%''))';
          IBQValidaciones.SQL.Text :=S;
          if CambioEstablecimiento then
            IBQValidaciones.ParamByName('esta').AsInteger := IBDSSimpleIDESTA.Value
          else
            IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          IBQValidaciones.Open;
          if not(IBQValidaciones.IsEmpty) then
          begin
             Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
        //     BDBGSimple.ColumnByField('POTRERO').PickList :=   GenearaNuevoPickList(IBQPotrero);
             PickPos := BDBGSimple.ColumnByField('RODEO').PickList.IndexOf(BDBGSimple.ColumnByField('RODEO').Field.AsString);
             IBDSSimpleIDRODEO.AsInteger:= TClassType(BDBGSimple.ColumnByField('RODEO').PickList.Objects[PickPos]).getValue;
          end;
        end;

        if (Sender.FieldName = 'RESPALTA') then
        begin      // RESPONSABLE
          IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
          IBQValidaciones.ParamByName('esta').AsInteger := IBDSSimpleIDESTA.Value;
          IBQValidaciones.Active := true;
          if not(IBQValidaciones.IsEmpty) then
          begin
            Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
            PickPos := BDBGSimple.ColumnByField('RESP').PickList.IndexOf(BDBGSimple.ColumnByField('RESP').Field.AsString);
            IBDSSimple.FieldByName('RESPONSABLE').Value :=  TClassType(BDBGSimple.ColumnByField('RESP').PickList.Objects[PickPos]).getValue;
          end;
        end;

        if (Sender.FieldName = 'ESTA') then
          begin      // ESTABLECIMIENTO
            IBQValidaciones.SQL.text := 'select NOMBRE as valor from TAB_ESTABLECIMIENTOS where ((id_establecimiento <> :esta) and (NOMBRE like '''+UpperCase(Text)+'''||''%''))';
            IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
            IBQValidaciones.Open;
            if not(IBQValidaciones.IsEmpty) then
            begin
              Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
              PickPos := BDBGSimple.ColumnByField('ESTA').PickList.IndexOf(BDBGSimple.ColumnByField('ESTA').Field.AsString);
              IBDSSimpleIDESTA.AsInteger := TClassType(BDBGSimple.ColumnByField('ESTA').PickList.Objects[PickPos]).getValue;
            end;
          end;
        if (Sender.FieldName = 'ACTIVIDAD') then
          begin      // ACTIVIDAD
            IBQValidaciones.SQL.text := 'select NOMBRE as valor from COD_ACTIVIDAD where ((NOMBRE like '''+UpperCase(Text)+'''||''%'') or (CODIGO like '''+UpperCase(Text)+'''||''%''))';
            IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
            IBQValidaciones.Open;
            if not(IBQValidaciones.IsEmpty) then
            begin
              Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
              PickPos := BDBGSimple.ColumnByField('ACTIVIDAD').PickList.IndexOf(BDBGSimple.ColumnByField('ACTIVIDAD').Field.AsString);
              IBDSSimpleIDACTIVIDAD.AsInteger := TClassType(BDBGSimple.ColumnByField('ACTIVIDAD').PickList.Objects[PickPos]).getValue;
            end;
          end;
        if (Sender.FieldName = 'CRIADOR') then
          begin      // CRIADOR
            IBQValidaciones.SQL.text := 'select NOMBRE as valor from COD_CRIADOR where ((NOMBRE like '''+UpperCase(Text)+'''||''%'') or (CODIGO like '''+UpperCase(Text)+'''||''%''))';
            IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
            IBQValidaciones.Open;
            if not(IBQValidaciones.IsEmpty) then
            begin
              Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
              PickPos := BDBGSimple.ColumnByField('CRIADOR').PickList.IndexOf(BDBGSimple.ColumnByField('CRIADOR').Field.AsString);
              IBDSSimpleIDCRIADOR.AsInteger := TClassType(BDBGSimple.ColumnByField('CRIADOR').PickList.Objects[PickPos]).getValue;
            end;
          end;
        if (Sender.FieldName = 'ORIGEN') then
          begin      // ORIGEN
            IBQValidaciones.SQL.text := 'select NOMBRE as valor from COD_ORIGEN where ((NOMBRE like '''+UpperCase(Text)+'''||''%'') or (CODIGO like '''+UpperCase(Text)+'''||''%''))';
            IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
            IBQValidaciones.Open;
            if not(IBQValidaciones.IsEmpty) then
            begin
              Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
              PickPos := BDBGSimple.ColumnByField('ORIGEN').PickList.IndexOf(BDBGSimple.ColumnByField('ORIGEN').Field.AsString);
              IBDSSimpleIDORIGEN.AsInteger := TClassType(BDBGSimple.ColumnByField('ORIGEN').PickList.Objects[PickPos]).getValue;
            end;
          end;
        if (Sender.FieldName = 'PROPIETARIO') then
          begin      // PROPIETARIO
            IBQValidaciones.SQL.text := 'select NOMBRE as valor from COD_PROPIETARIO where ((NOMBRE like '''+UpperCase(Text)+'''||''%'') or (CODIGO like '''+UpperCase(Text)+'''||''%''))';
            IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
            IBQValidaciones.Open;
            if not(IBQValidaciones.IsEmpty) then
            begin
              Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
              PickPos := BDBGSimple.ColumnByField('PROPIETARIO').PickList.IndexOf(BDBGSimple.ColumnByField('PROPIETARIO').Field.AsString);
              IBDSSimpleIDPROPIETARIO.AsInteger := TClassType(BDBGSimple.ColumnByField('PROPIETARIO').PickList.Objects[PickPos]).getValue;
            end;
          end;
        if (Sender.FieldName = 'DESTINO') then
          begin      // DESTINO
            IBQValidaciones.SQL.text := 'select NOMBRE as valor from COD_DESTINO where ((NOMBRE like '''+UpperCase(Text)+'''||''%'') or (CODIGO like '''+UpperCase(Text)+'''||''%''))';
            IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
            IBQValidaciones.Open;
            if not(IBQValidaciones.IsEmpty) then
            begin
              Sender.AsString := IBQValidaciones.FieldByName('valor').AsString;
              PickPos := BDBGSimple.ColumnByField('DESTINO').PickList.IndexOf(BDBGSimple.ColumnByField('DESTINO').Field.AsString);
              IBDSSimpleIDDESTINO.AsInteger := TClassType(BDBGSimple.ColumnByField('DESTINO').PickList.Objects[PickPos]).getValue;
            end;
          end;

       if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
            IBDSSimple.FieldValues['EW'] := 'M';
   end;         
 end;

(*
  Carga y Pega los Picklista para lcas celdas de la Grilla Detalle
*)
procedure TFEveCambioUbicacion.LoadSQLStringList;
begin
  SQLStringList.AddObject('ESTA',TObject(DMSoftvet.DSEstablecimiento));
  SQLStringList.AddObject('ACTIVIDAD',TObject(DMSoftvet.DSActividad));
  SQLStringList.AddObject('CRIADOR',TObject(DMSoftvet.DSCodCriador));
  SQLStringList.AddObject('ORIGEN',TObject(DMSoftvet.DSCodOrigen));
  SQLStringList.AddObject('PROPIETARIO',TObject(DMSoftvet.DSCodPropietario));
  SQLStringList.AddObject('DESTINO',TObject(DMSoftvet.DSCodDestino));
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
  SQLStringList.AddObject('RESPALTA',TObject(DSEmpleadoAlta));
  SQLStringList.AddObject('POTRERO',TObject(DMSoftvet.DSPotrerosSinServicio));
  SQLStringList.AddObject('RODEO',TObject(DSRodeo));

  inherited;
end;


(*
  Recoore Queryies para mostrardesplegados los combos
*)
procedure TFEveCambioUbicacion.IBQRodeoAfterOpen(DataSet: TDataSet);
var
  con : integer;
begin
  inherited;
  con := 0;
  while (not(DataSet.Eof) and (con < 4)) do begin
    DataSet.Next;
    inc(con);
  end;
end;

procedure TFEveCambioUbicacion.CkBPotreroClick(Sender: TObject);
begin
  inherited;
   if(CkBPotrero.Checked)then
    begin
      DBLCBAPotrero.Enabled := true;
      DBLCBAPotrero.EsRequerido := true;
      DBLCBAPotrero.AsignarValorDefecto;
      DBLCBAPotrero.KeyValue:= null;      
      Label2.Enabled:= true;
      if not(CkBRodeo.Checked) then
        DBLCBARodeo.EsRequerido := false;
    end
   else
    begin
      DBLCBAPotrero.KeyValue:= null;
      DBLCBAPotrero.Enabled := false;
      Label2.Enabled:= false;
      if not(CkBRodeo.Checked) then
        DBLCBARodeo.EsRequerido := true
       else
         DBLCBAPotrero.EsRequerido := false;
    end
end;

procedure TFEveCambioUbicacion.TF(Sender: TObject);
begin
  inherited;
  if(CKBEstablecimiento.Checked)then
  begin
      IBQEstablecimiento.Close;
      IBQEstablecimiento.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQEstablecimiento.Open;
      if (IBQEstablecimiento.IsEmpty) then
      begin
        MostrarMensaje(tmError,'No hay otros establecimientos creados');
        CKBEstablecimiento.Checked := false;
      end
      else
      begin
        CambioEstablecimiento := true;
        GBPotRod.Enabled := false;
        TSCambioEstablecimiento.TabVisible := true;
        PCBasico.ActivePage := TSCambioEstablecimiento;
        //DBLCBAEstablecimiento.Enabled := true;
        ActualizarConsultas(IBQEstablecimiento.FieldByName('id_establecimiento').Value);
        CkBRodeo.Checked := false;
        CkBPotrero.Checked := false;
        DBLCBARodeo.EsRequerido := false;
        DBLCBAPotrero.EsRequerido := false;
        ActivarRequeridos(true);
      end;
  end
  else
  begin
    CambioEstablecimiento := false;
    GBPotRod.Enabled := true;
    TSCambioEstablecimiento.TabVisible := false;
    //DBLCBAEstablecimiento.Enabled := false;
    ActualizarConsultas(FPrincipal.EstablecimientoActual);
    CkBRodeoClick(nil);
    CkBPotreroClick(nil);
    ActivarRequeridos(false);
  end;
  PrepararCambioEstablecimiento();
end;

procedure TFEveCambioUbicacion.CkBRodeoClick(Sender: TObject);
begin
  inherited;
  if(CkBRodeo.Checked)then
    begin
      DBLCBARodeo.Enabled := true;
      DBLCBARodeo.EsRequerido := true;
      DBLCBARodeo.AsignarValorDefecto;
      DBLCBARodeo.KeyValue:= null;
      Label1.Enabled:= true;
      if not(CkBPotrero.Checked) then
        DBLCBAPotrero.EsRequerido := false;
    end
   else
      begin
        DBLCBARodeo.KeyValue:= null;
        DBLCBARodeo.Enabled := false;
        Label1.Enabled:= false;
        if not(CkBPotrero.Checked) then
          DBLCBAPotrero.EsRequerido := true
         else
           DBLCBARodeo.EsRequerido := false;
      end
end;

procedure TFEveCambioUbicacion.DBLCBAEstablecimientoCloseUp(
  Sender: TObject);
begin
  inherited;
  if not(IBQEstablecimiento.IsEmpty) then
    ActualizarConsultas(DBLCBAEstablecimiento.KeyValue)
  else
    ActualizarConsultas(FPrincipal.EstablecimientoActual);
end;

procedure TFEveCambioUbicacion.ActualizarConsultas(Establecimiento: Variant);
begin
  if Establecimiento <> null then
  begin
    {DMSoftvet.IBQResponsable.Close;
    DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := Establecimiento;
    DMSoftvet.IBQResponsable.Open;}
    IBQEmpleadoAlta.Close;
    IBQEmpleadoAlta.ParamByName('idestablecimiento').Value := Establecimiento;
    IBQEmpleadoAlta.Open;
    
    DMSoftvet.IBQPotrerosSinServicio.Close;
    DMSoftvet.IBQPotrerosSinServicio.ParamByName('establecimiento').AsInteger := Establecimiento;
    DMSoftvet.IBQPotrerosSinServicio.Open;
    IBQRodeo.Close;
    IBQRodeo.ParamByName('esta').Value := Establecimiento;
    IBQRodeo.Open;
  end;
end;

procedure TFEveCambioUbicacion.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.DateTime > now) then
      fecha.DateTime:=now;
  if CompareDate(DTPAFechaIngreso.Date,DTPAFecha.Date) = LessThanValue then
  begin
    mostrarMensaje(tmError,'La fecha de ingreso en el nuevo establecmiento no puede ser menor a la de cambio de establecmiento');
    DTPAFechaIngreso.Date := DTPAFecha.Date;
  end;
end;

procedure TFEveCambioUbicacion.ATerminarExecute(Sender: TObject);
begin

  inherited;
  { if PuedeTerminar then
    MoverHijos();}
 if PuedeTerminar then

end;

procedure TFEveCambioUbicacion.MoverHijos();
var
  rodeo_viejo, potrero_viejo : Variant;
begin
 { try
    if ModoEve = meMasivo then
    begin
      IBDSSimple.First;
      while not IBDSSimple.Eof do
      begin
        UbicacionVieja(IBDSSimple.FieldValues['ID_ANIMAL'],rodeo_viejo,potrero_viejo);
        IBSPCambioHijos.Close;
        IBSPCambioHijos.ParamByName('MADRE').Value := IBDSSimple.FieldValues['ID_ANIMAL'];
        IBSPCambioHijos.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
        IBSPCambioHijos.ParamByName('POTRERO_MADRE_VIEJO').Value := potrero_viejo;
        IBSPCambioHijos.ParamByName('RODEO_MADRE_VIEJO').Value := rodeo_viejo;
        IBSPCambioHijos.ParamByName('POTRERO_MADRE_NUEVO').Value := IBDSSimple.FieldValues['IDPOTRERO'];
        IBSPCambioHijos.ParamByName('RODEO_MADRE_NUEVO').Value := IBDSSimple.FieldValues['IDRODEO'];
        IBSPCambioHijos.ParamByName('RESPONSABLE').Value := IBDSSimple.FieldValues['RESPONSABLE'];
        IBSPCambioHijos.ParamByName('FECHA_EVE').Value := IBDSSimple.FieldValues['FECHA'];
        IBSPCambioHijos.ParamByName('OBSERVACION').Value := 'Evento CU disparado por CU de la madre';
        IBSPCambioHijos.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
        IBSPCambioHijos.ParamByName('LOG_FECHA_MODIFICADO').Value := Now;
        IBSPCambioHijos.ParamByName('DISPARADOR').Value := Null;
        IBSPCambioHijos.ParamByName('FECHA_MIN').Value := IncMonth(IBDSSimple.FieldValues['FECHA'],-7);
        IBSPCambioHijos.ExecProc;
        FPrincipal.IBTPrincipal.CommitRetaining;
        IBDSSimple.Next;
      end;
    end
    else
    begin
      UbicacionVieja(IDAnimal,rodeo_viejo,potrero_viejo);
      IBSPCambioHijos.Close;
      IBSPCambioHijos.ParamByName('MADRE').Value := IDAnimal;
      IBSPCambioHijos.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      IBSPCambioHijos.ParamByName('POTRERO_MADRE_VIEJO').Value := potrero_viejo ;
      IBSPCambioHijos.ParamByName('RODEO_MADRE_VIEJO').Value := rodeo_viejo;
      IBSPCambioHijos.ParamByName('POTRERO_MADRE_NUEVO').Value := DBLCBAPotrero.KeyValue;
      IBSPCambioHijos.ParamByName('RODEO_MADRE_NUEVO').Value := DBLCBARodeo.KeyValue;
      IBSPCambioHijos.ParamByName('RESPONSABLE').Value := DBLCBAResponsable.GetDato;
      IBSPCambioHijos.ParamByName('FECHA_EVE').Value := DTPAFecha.Date;
      IBSPCambioHijos.ParamByName('OBSERVACION').Value := 'Evento CU disparado por CU de la madre';
      IBSPCambioHijos.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
      IBSPCambioHijos.ParamByName('LOG_FECHA_MODIFICADO').Value := Now;
      IBSPCambioHijos.ParamByName('DISPARADOR').Value := Null;
      IBSPCambioHijos.ParamByName('FECHA_MIN').Value := IncMonth(DTPAFecha.Date,-7);
      IBSPCambioHijos.ExecProc;
      FPrincipal.IBTPrincipal.CommitRetaining;
    end;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;   }
end;

procedure TFEveCambioUbicacion.UbicacionVieja(id_Animal : integer; var rodeo, potrero : Variant);
begin
  try
    IBQUbicacionVieja.Close;
    IBQUbicacionVieja.ParamByName('animal').AsInteger := id_Animal;
    IBQUbicacionVieja.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQUbicacionVieja.Open;
  except
  end;
  IBQUbicacionVieja.Last;
  rodeo := IBQUbicacionVieja.FieldValues['rodeo'];
  potrero := IBQUbicacionVieja.FieldValues['potrero'];
end;

procedure TFEveCambioUbicacion.Label2Click(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    abm := TFABMPotreros.Create(self);
    abm.Abrir(faAbm);
    DMSoftvet.IBQPotrerosSinServicio.Close;
    DMSoftvet.IBQPotrerosSinServicio.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQPotrerosSinServicio.Open;
    CambiarCB(DBLCBAPotrero,nroID);
  end;
end;

procedure TFEveCambioUbicacion.Label1Click(Sender: TObject);
var
  abm : TFABMRodeos;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    abm := TFABMRodeos.Create(self);
    abm.Abrir(faAbm);
    IBQRodeo.Close;
    IBQRodeo.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
    IBQRodeo.Open;
    CambiarCB(DBLCBARodeo,nroID);
  end;
end;

procedure TFEveCambioUbicacion.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveCambioUbicacion.cargarDatos(i:integer);
begin
    inherited;
    DBLCBAPotrero.KeyValue:=0;
    DBLCBARodeo.KeyValue:=0;
    IBDSSimple.FieldByName('ID_SENASA').Value:= getDato('senasa',anim[i]);

    IBDSSimple.FieldByName('RESP').Value:= getDato('responsable',anim[i]);
    IBDSSimple.FieldByName('RESPONSABLE').Value:= DBLCBAResponsable.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');

          IBDSSimple.FieldByName('POTRERO').Value:= getDato('nuevo p',anim[i]);
          IBDSSimple.FieldByName('IDPOTRERO').Value:= DBLCBAPotrero.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('POTRERO').Value,'ID_POTRERO');

          IBDSSimple.FieldByName('RODEO').Value:= getDato('nuevo r',anim[i]);
          IBDSSimple.FieldByName('IDRODEO').Value:= DBLCBARodeo.ListSource.DataSet.Lookup('NOMBRE',IBDSSimple.FieldByName('RODEO').Value,'ID_RODEO');
end;

procedure TFEveCambioUbicacion.PrepararCambioEstablecimiento();
var
  SQLEventoInd, SQLRN : String;
begin
   if CambioEstablecimiento then
   begin
      SQLRN := 'SELECT * FROM RN_CAMBIO_ESTABLECIMIENTO(:ESTA_ACTUAL,:ESTA_DESTINO,:FECHA_BAJA,:FECHA_ALTA,:ANIMAL)';
      SQLEventoInd := 'select * from SP_CAMBIO_ESTABLECIMIENTO(:FECHA_BAJA,:FECHA_ALTA,:ID_GRUPO,:OBSERVACION,:RESPONSABLE,'+
             ':LOG_USUARIO,:LOG_FECHA_MODIFICADO,:DISPARADOR,:ESTABLECIMIENTO_ACTUAL,:ESTABLECIMIENTO_DESTINO,:ANIMAL,'+
             ':POTRERO,:RODEO,:ACTIVIDAD,:PROPIETARIO,:ORIGEN,:CRIADOR,:DESTINO,:DTA_ALTA,:DTA_BAJA,:TIPO,:PESO,:PESODESTINO,'+
             ':PRECIO_VENTA,:PRECIO_BRUTO,:PRECIO_UNITARIO,:GASTOS,:RESP_ALTA,:SUBCATEGORIA,:CODIGO_MANEJO)';
      BDBGSimple.Columns[4].Visible := true;
      BDBGSimple.Columns[5].Visible := true;
      BDBGSimple.Columns[6].Visible := true;
      BDBGSimple.Columns[7].Visible := true;
      BDBGSimple.Columns[8].Visible := true;
      BDBGSimple.Columns[9].Visible := true;
      BDBGSimple.Columns[10].Visible := true;
      BDBGSimple.Columns[11].Visible := true;
      BDBGSimple.Columns[12].Visible := true;
      BDBGSimple.Columns[13].Visible := true;
      BDBGSimple.Columns[14].Visible := true;
      BDBGSimple.Columns[13].Title.Caption := Traducir('Responsable Baja');
   end
   else
   begin
      SQLRN := 'SELECT * FROM RN_CAMBIO_UBICACION(:ANIMAL,:ESTABLECIMIENTO,:FECHA)';
      SQLEventoInd := 'select * from SP_CAMBIO_UBICACION(:ID_POTRERO,:ID_RODEO,:ID_GRUPO,:FECHA,:ANIMAL,:OBSERVACION,:ESTABLECIMIENTO,'+
             ':RESPONSABLE,:LOG_USUARIO,:LOG_FECHA_MODIFICADO, :DISPARADOR)';
      BDBGSimple.Columns[4].Visible := false;
      BDBGSimple.Columns[5].Visible := false;
      BDBGSimple.Columns[6].Visible := false;
      BDBGSimple.Columns[7].Visible := false;
      BDBGSimple.Columns[8].Visible := false;
      BDBGSimple.Columns[9].Visible := false;
      BDBGSimple.Columns[10].Visible := false;
      BDBGSimple.Columns[11].Visible := false;
      BDBGSimple.Columns[12].Visible := false;
      //BDBGSimple.Columns[13].Visible := false;
      BDBGSimple.Columns[14].Visible := false;
      BDBGSimple.Columns[13].Title.Caption := Traducir('Responsable');
   end;
   IBQSPEventoInd.Close;
   IBQSPEventoInd.SQL.Clear;
   IBQSPEventoInd.SQL.Add(SQLEventoInd);
   IBQSPRN.Close;
   IBQSPRN.SQL.Clear;
   IBQSPRN.SQL.Add(SQLRN);
end;


procedure TFEveCambioUbicacion.IBQTipoBajasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

procedure TFEveCambioUbicacion.DBLCBATipoCloseUp(Sender: TObject);
begin
  inherited;
  if DBLCBATipo.KeyValue <> null then
  begin
    if DBLCBATipo.KeyValue = 2 then
    begin
      EAPesoDestino.Visible := false;
      LPesoDestino.Visible := false;
      EAPrecio.Visible := false;
      LPrecio.Visible := false;
    end
    else
    begin
      EAPesoDestino.Visible := true;
      LPesoDestino.Visible := true;
      EAPrecio.Visible := true;
      LPrecio.Visible := true;
    end;
  end;
end;

procedure TFEveCambioUbicacion.PrecioChange(Sender: TObject);
var
  val : double;
begin
  inherited;
  val := 0;
  if (Sender is TEditAuto) then
    if not TryStrToFloat((Sender as TEditAuto).Text, val) then
      (Sender as TEditAuto).Text := '0';
end;

procedure TFEveCambioUbicacion.IBQSPEventoIndAfterOpen(DataSet: TDataSet);
begin
  if not CambioEstablecimiento then
    inherited;
end;

procedure TFEveCambioUbicacion.ActivarRequeridos(Activo : Boolean);
begin
  DBLCBAEstablecimiento.EsRequerido := Activo;
  DBLCBATipo.EsRequerido := Activo;
  DBLCBADestino.EsRequerido := Activo;
  EAPeso.EsRequerido := Activo;
  DTPAFechaIngreso.EsRequerido := Activo;
  DBLCBAPotreroEsta.EsRequerido := Activo;
  DBLCBARodeoEsta.EsRequerido := Activo;
  DBLCBAEmpleadoAlta.EsRequerido := Activo;
end;

procedure TFEveCambioUbicacion.CambiarFotos(animal : integer);
var
  SearchRec: TSearchRec;
  PathOrig, PathDest : String;
  NomArch : String;
begin
  IBQBuscarFotos.Close;
  IBQBuscarFotos.ParamByName('animal').AsInteger := animal;
  IBQBuscarFotos.Open;
  IBQBuscarFotos.First;
  while not IBQBuscarFotos.Eof do
  begin
    NomArch := 'ani'+IntToStr(animal)+'id'+VarToStr(IBQBuscarFotos.FieldValues['id_imagen'])+'.jpg';
    PathOrig := ExtractFilePath(Application.ExeName)+'Fotos\'+FPrincipal.NombreEstablecimiento+'\'+NomArch;
    PathDest := ExtractFilePath(Application.ExeName)+'Fotos\'+DBLCBAEstablecimiento.Text+'\'+NomArch;
    MoveFile(PAnsiChar(PathOrig), PAnsiChar(PathDest));
    IBQBuscarFotos.Next;
  end;
end;

procedure TFEveCambioUbicacion.ManejarDatosDeSP;
var
  animal : integer;
begin
  if ModoEve = meMasivo then
    animal := IBDSSimple.FieldValues['id_animal']
  else
    animal := IDAnimal;
  CambiarFotos(animal);
end;

procedure TFEveCambioUbicacion.TSCambioEstablecimientoShow(
  Sender: TObject);
begin
  inherited;
  IBQEstablecimiento.First;
  DBLCBAEstablecimientoCloseUp(nil);
  DTPAFechaIngreso.Date := DTPAFecha.Date;
end;

procedure TFEveCambioUbicacion.LabelMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    if ((Sender as TLabel).Enabled) then
    begin
      (Sender as TLabel).Font.Color:= $00606C02;
      (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveCambioUbicacion.LabelMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= clWindowText;
    (Sender as TLabel).Font.Style:= [fsUnderline];
  end;
end;

procedure TFEveCambioUbicacion.LDestinoClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMDestinoExecute(self);
    DMSoftvet.IBQCodDestino.Close;
    DMSoftvet.IBQCodDestino.Open;
  end;
end;

procedure TFEveCambioUbicacion.LActividadClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMActividadExecute(self);
    DMSoftvet.IBQActividad.Close;
    DMSoftvet.IBQActividad.Open;
  end;
end;

procedure TFEveCambioUbicacion.LPropietarioClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMPropietarioAnimalExecute(self);
    DMSoftvet.IBQCodPropietario.Close;
    DMSoftvet.IBQCodPropietario.Open;
  end;
end;

procedure TFEveCambioUbicacion.LOrigenClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMOrigenExecute(self);
    DMSoftvet.IBQCodOrigen.Close;
    DMSoftvet.IBQCodOrigen.Open;
  end;
end;

procedure TFEveCambioUbicacion.LCriadorClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AABMCriadorExecute(self);
    DMSoftvet.IBQCodCriador.Close;
    DMSoftvet.IBQCodCriador.Open;
  end;
end;

procedure TFEveCambioUbicacion.Label3Click(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    FPrincipal.AAbmTiposBajaExecute(self);
    IBQTipoBajas.Close;
    IBQTipoBajas.Open;
  end;
end;

procedure TFEveCambioUbicacion.IBQEmpleadoAltaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DMSoftvet.IBQAfterOpen(DataSet);
end;

procedure TFEveCambioUbicacion.HabilitarComponentesVersionBasica;
begin
  inherited;
  MSimple.HabilitarComponentesVersionBasica();
//  {$IFDEF BASICO}
  if (FPrincipal.TipoVersionLicencia = 'Basico') then
    begin
      CKBEstablecimiento.Enabled:= false;
    end
   else
     begin
       //
     end;
//  {$ELSE}
    //
//  {$ENDIF}
end;

procedure TFEveCambioUbicacion.EAPesoKeyPress(Sender: TObject;
  var Key: Char);
var Separador: Char;  
begin
  inherited;
  Separador := SysUtils.DecimalSeparator;

  if ((Key = '.') or ( Key = ',')) then
    Key := Separador;

  if (pos(Separador,TEditAuto(Sender).Text)=0) then
    begin
      if not (key in ['0'..'9',Separador,#8]) then
        key:=#0;
    end
  else
    if not (key in ['0'..'9',#8]) then
      key:=#0;
end;

procedure TFEveCambioUbicacion.PCBasicoChange(Sender: TObject);
begin
  inherited;
  TSCambioEstablecimiento.ImageIndex := 4;
  if(PCBasico.ActivePage = TSCambioEstablecimiento)then
    TSCambioEstablecimiento.ImageIndex := 1;
end;

end.
