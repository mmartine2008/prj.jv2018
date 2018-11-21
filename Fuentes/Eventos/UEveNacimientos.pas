unit UEveNacimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, IBQuery, DB, IBCustomDataSet, WinXP, DataExport,
  DataToXLS, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Grids,
  DBGrids, UBDBGrid, MemoAuto, EditAuto, UClassType, Buttons, UPrincipal, UDMSoftvet,
  Mask, DBCtrls, UDBLookupComboBoxAuto, UDBEditAuto, DateTimePickerAuto,
  UFrameMangazo, UFunctions, UMensajesNacimientos, UMensajeHuella, ImgList,
  PngImageList, PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF, JvExControls,
  JvLabel, JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom,
  XMLDoc, Menus;

type
  TFEveNacimientos = class(TFEveSimple)
    TSPartos: TTabSheet;
    GroupBox1: TGroupBox;
    BDBGPartos: TBitDBGrid;
    DSPartos: TDataSource;
    IBQPartos: TIBQuery;
    CheckBox2: TCheckBox;
    LPeso: TLabel;
    LSexo: TLabel;
    IBQBuscarCUIG: TIBQuery;
    IBQActCUIG: TIBQuery;
    IBQCantCuigs: TIBQuery;
    GroupBox2: TGroupBox;
    DBLCBAPotreros: TDBLookupComboBoxAuto;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    Label8: TLabel;
    Label9: TLabel;
    DSMadres: TDataSource;
    IBQMadres: TIBQuery;
    IBQDatosParto: TIBQuery;
    IBQGenAnimales: TIBQuery;
    IBQGenIDAnimal: TIBQuery;
    IBQSelMadres: TIBQuery;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    DBLCBASexo: TDBLookupComboBoxAuto;
    Label6: TLabel;
    LVivo: TLabel;
    DBLCBAVivoSN: TDBLookupComboBoxAuto;
    EAPESO: TEditAuto;
    Label7: TLabel;
    Label1: TLabel;
    DBLCBARaza: TDBLookupComboBoxAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    Label11: TLabel;
    CBIdentificacion: TCheckBox;
    GBIdentificacion: TGroupBox;
    RBRp: TRadioButton;
    RBSenasa: TRadioButton;
    LRpInicial: TLabel;
    EAPrefijo: TEditAuto;
    EARpInicial: TEditAuto;
    EASufijo: TEditAuto;
    RBCUIGSenasa: TRadioButton;
    EAEncabezado: TMaskEdit;
    EAUltimoIdent: TMaskEdit;
    CBCUIGPropio: TCheckBox;
    DBLCBACUIGPropio: TDBLookupComboBoxAuto;
    IBQGrupoParto: TIBQuery;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleNOMBRE: TIBStringField;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleV1: TIBStringField;
    IBDSSimpleI2: TIntegerField;
    IBDSSimpleV2: TIBStringField;
    IBDSSimpleVUNO3: TIBStringField;
    IBDSSimpleV3: TIBStringField;
    IBDSSimpleI4: TIntegerField;
    IBDSSimpleV4: TIBStringField;
    IBDSSimpleI5: TIntegerField;
    IBDSSimpleV5: TIBStringField;
    IBDSSimpleV6: TIBStringField;
    IBDSSimpleV7: TIBStringField;
    IBDSSimpleV8: TIBStringField;
    IBDSSimpleV9: TIBStringField;
    IBDSSimpleI9: TIntegerField;
    IBDSSimpleV10: TIBStringField;
    IBDSSimpleI1: TIntegerField;
    IBDSSimpleI3: TIntegerField;
    IBDSSimpleV11: TIBStringField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleEW: TIBStringField;
    IBQDistosicos: TIBQuery;
    IBQDistosicosID_RP: TIBStringField;
    IBQRodeoMadre: TIBQuery;
    IBQRodeos: TIBQuery;
    IBQLimpiarAux: TIBQuery;
    LCUIGPropio: TLabel;
    IBQFechaParto: TIBQuery;
    LMadre: TLabel;
    Madre: TLabel;
    IBDSSimpleID_IE: TIBStringField;
    DBLCBAColor: TDBLookupComboBoxAuto;
    LColor: TLabel;
    IBQColor: TIBQuery;
    DSColor: TDataSource;
    IBDSSimpleI6: TIntegerField;
    IBDSSimpleV12: TIBStringField;
    DataSourceSelPotreroEvento: TDataSource;
    IBQuerySelPotreroEvento: TIBQuery;
    procedure SetTextExtendido(Sender: TField; const Text: String);
    procedure FormCreate(Sender: TObject);
    procedure BDBGPartosCellClick(Column: TColumn);
    procedure CBIdentificacionClick(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure EAPESOExit(Sender: TObject);
    procedure BDBGSimpleDblClick(Sender: TObject);
    procedure RBRpClick(Sender: TObject);
    procedure RBSenasaClick(Sender: TObject);
    procedure RBCUIGSenasaClick(Sender: TObject);
    procedure CBCUIGPropioClick(Sender: TObject);
    procedure DBLCBACUIGPropioCloseUp(Sender: TObject);
    procedure ControlEventoOnExit(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure EARpInicialExit(Sender: TObject);
    procedure EAUltimoIdentExit(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure EARpInicialKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EAEncabezadoChange(Sender: TObject);
    procedure EAUltimoIdentChange(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label11MouseEnter(Sender: TObject);
    procedure Label11MouseLeave(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label8MouseEnter(Sender: TObject);
    procedure Label8MouseLeave(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label9MouseEnter(Sender: TObject);
    procedure Label9MouseLeave(Sender: TObject);
    procedure LCUIGPropioClick(Sender: TObject);
    procedure LCUIGPropioMouseEnter(Sender: TObject);
    procedure LCUIGPropioMouseLeave(Sender: TObject);
    procedure GetEventIdent(Sender : TObject);
    procedure EARpInicialChange(Sender: TObject);
    procedure DBLCBARazaCloseUp(Sender: TObject);
  private
    id_grupo, peso, animal, pasa_n : Integer;
    cant_nacimientos, rp_inicial : Integer;
    identCUIG : String;
    CUIG: Boolean;
    RPs : TStringList;
    nro_rodeo, nro_potrero : integer;
    fecha_parto : TDate;
    procedure GenerarNacimientos;
    function VerificarRepetidas(Seleccion : TField; Columna, Valor : String): Boolean;
    function CompletarRP (Valor : Integer) : String;
    procedure ActualizarCUIG(var CUIG : String);
    procedure CargarParametrosSP;override;
    procedure CargarParametrosRN;override;
    procedure CargarParametrosMasivo;override;
    procedure CargarDatosGrilla;override;
    procedure LoadSQLStringList;override;
    procedure setEnableGBIdentificacion(b: boolean);
    procedure Limpiar();
    function controlarCuig(IdentCUIG : String):Boolean;
    procedure obtenerDatosMadre(id_madre:integer);
  protected
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
    procedure completarCampos;override;
  public
    { Public declarations }
    id_potreroaux: Integer;
  end;

var
  FEveNacimientos: TFEveNacimientos;

implementation

uses UEveUniversal, UABMEmpleados, UABMPotreros, UABMSimple, UABMRodeos, UABMModificarCUIG;

{$R *.dfm}

procedure TFEveNacimientos.CargarParametrosSP;
var
  rp, senasa : Variant;
begin
  IBQSPEventoInd.ParamByName('animal').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];//IDanimal;
  IBQSPEventoInd.ParamByName('fecha').AsDate := DTPAFecha.Date;
  IBQSPEventoInd.ParamByName('observacion').AsString := MAObservacion.Text;
  IBQSPEventoInd.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('responsable').AsInteger := DBLCBAResponsable.KeyValue;
  IBQSPEventoInd.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('log_fecha_modif').AsDate := Date();
  IBQSPEventoInd.ParamByName('potrero').AsInteger := DBLCBAPotreros.KeyValue;
  IBQSPEventoInd.ParamByName('rodeo').AsInteger := DBLCBARodeos.KeyValue;
  IBQSPEventoInd.ParamByName('sexo').AsInteger := DBLCBASexo.KeyValue;
  IBQSPEventoInd.ParamByName('madre').AsInteger := DSMadres.DataSet.FieldValues['ID_ANIMAL_EXTERNO'];
  IBQSPEventoInd.ParamByName('peso').AsInteger := peso;
  IBQSPEventoInd.ParamByName('raza').AsInteger := DBLCBARaza.KeyValue;
  IBQSPEventoInd.ParamByName('vivo').Value := DBLCBAVivoSN.KeyValue;
  if DBLCBAColor.KeyValue <> null then
  begin
    if DBLCBAColor.KeyValue = 29 then
      IBQSPEventoInd.ParamByName('color').Value := DBLCBAVivoSN.KeyValue
    else
      IBQSPEventoInd.ParamByName('color').Value := 0;
  end
  else
    IBQSPEventoInd.ParamByName('color').Value := 0;
    
  if (CBIdentificacion.Checked) then
  begin
    if (RBRP.Checked) then
    begin
      rp := EAPrefijo.Text+CompletarRP(rp_inicial)+EASufijo.Text;
      senasa := '';
    end;
    if (RBSenasa.Checked) then
    begin
      rp := EAPrefijo.Text+CompletarDigitosSenasa(IntToStr(rp_inicial))+EASufijo.Text;
      senasa := EAPrefijo.Text+CompletarDigitosSenasa(IntToStr(rp_inicial))+EASufijo.Text;
    end;
    if (RBCUIGSenasa.Checked) then
    begin
      rp := EAEncabezado.Text+EAUltimoIdent.Text;
      senasa := EAEncabezado.Text+IdentCUIG;
      IdentCUIG := UFunctions.IncrementarIdentificadorCUIG(IdentCUIG);
      //ActualizarCUIG(IdentCUIG);
    end;
  end
  else
  begin
    rp := 'N/N';
    senasa := null;
  end;
  IBQSPEventoInd.ParamByName('nombre').AsString := rp;
  IBQSPEventoInd.ParamByName('rp').AsString := rp;
  IBQSPEventoInd.ParamByName('sen').Value := senasa;
  IBQSPEventoInd.ParamByName('id_grupo').Value := null;
  IBQSPEventoInd.ParamByName('grupo_parto').Value := null;
end;


procedure TFEveNacimientos.Limpiar();
begin
  IBQlimpiarAux.Open;
  IBQLimpiarAux.Close;
  FPrincipal.IBTPrincipal.CommitRetaining;
end;



function TFEveNacimientos.CompletarRP (Valor : Integer) : String;
var
  longTotal, longValor, max, i : integer;
  val, resultado, rpInicial : String;
begin
  longTotal := length(EARPInicial.Text);

  rpInicial := EARPInicial.Text;

  val := IntToStr(Valor);
  longValor := length(val);
  max := longTotal-longValor;
  SetLength(resultado,max);

  for i := 1 to max do
    resultado[i] := rpInicial[i];//resultado[i] := '0';

  Result := resultado+val;
end;

procedure TFEveNacimientos.CargarParametrosRN;
begin
  IBQSPRN.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPRN.ParamByName('GRUPO_PARTO').AsInteger := id_grupo;
  if(self.ModoEve = meIndividual)then
  begin
    IBQSPRN.ParamByName('ANIMAL').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];//IDAnimal;
    IBQSPRN.ParamByName('FECHA').AsDateTime := DTPAFecha.DateTime;
    IBQSPRN.ParamByName('SEXO').Value := DBLCBASexo.KeyValue;
    if CBIdentificacion.Checked then
    begin
      if RBSenasa.Checked then
      begin
        IBQSPRN.ParamByName('rp').AsString := EARPInicial.Text;
        IBQSPRN.ParamByName('senasa').AsString := EARPInicial.Text;
      end;
      if RBRp.Checked then
      begin
        IBQSPRN.ParamByName('rp').AsString := EAPrefijo.Text+EARPInicial.Text+EASufijo.Text;
        IBQSPRN.ParamByName('senasa').Value := null;
      end;
      if RBCUIGSenasa.Checked then
      begin
        IBQSPRN.ParamByName('rp').AsString := EAEncabezado.Text+EAUltimoIdent.Text;
        IBQSPRN.ParamByName('senasa').AsString := EAEncabezado.Text+EAUltimoIdent.Text;
      end;
      //IBQSPRN.ParamByName('ie').AsString := EAIdentificacionElectronica.Text;
    end
    else
      begin
      IBQSPRN.ParamByName('rp').AsString := 'N/N';
      IBQSPRN.ParamByName('senasa').Value := null;
      end;
    if (EAPeso.Text <> '') then
      IBQSPRN.ParamByName('PESO').AsInteger := StrToInt(EAPeso.Text)
    else
      IBQSPRN.ParamByName('PESO').AsInteger := 0;
    IBQSPRN.ParamByName('MADRE').AsInteger := DSMadres.DataSet.FieldValues['ID_ANIMAL_EXTERNO'];
    IBQSPRN.ParamByName('RODEO').AsInteger := DBLCBARodeos.KeyValue;
    IBQSPRN.ParamByName('CO').Value := null;
  end
  else
  begin
    IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldByName('id_animal').AsInteger;
    IBQSPRN.ParamByName('FECHA').AsDateTime := IBDSSimple.fieldByName('fecha').AsDateTime;
    IBQSPRN.ParamByName('RP').AsString := IBDSSimple.fieldByName('id_rp').AsString;
    IBQSPRN.ParamByName('SEXO').AsInteger := IBDSSimple.fieldByName('I2').AsInteger;
    if (CBIdentificacion.Checked) then
    begin
      if ( IBDSSimple.fieldByName('id_senasa').AsString = '') then
        IBQSPRN.ParamByName('SENASA').Value := null
      else
        IBQSPRN.ParamByName('SENASA').AsString := IBDSSimple.fieldByName('id_senasa').AsString;
      if (IBDSSimple.fieldByName('V7').AsString = '') then
        IBQSPRN.ParamByName('HBA').Value := null
      else
        IBQSPRN.ParamByName('HBA').AsString := IBDSSimple.fieldByName('V7').AsString;
      if (IBDSSimple.fieldByName('V6').AsString = '') then
        IBQSPRN.ParamByName('PC').Value := null
      else
        IBQSPRN.ParamByName('PC').AsString := IBDSSimple.fieldByName('V6').AsString;
      if (IBDSSimple.fieldByName('V8').AsString = '') then
        IBQSPRN.ParamByName('RA').Value := null
      else
        IBQSPRN.ParamByName('RA').AsString := IBDSSimple.fieldByName('V8').AsString;
      if (IBDSSimple.fieldByName('V9').AsString = '') then
        IBQSPRN.ParamByName('OTRO').Value := null
      else
        IBQSPRN.ParamByName('OTRO').AsString := IBDSSimple.fieldByName('V9').AsString;

      if (IBDSSimple.fieldByName('ID_IE').AsString = '') then
        IBQSPRN.ParamByName('IE').Value := null
      else
        IBQSPRN.ParamByName('IE').AsString := IBDSSimple.fieldByName('ID_IE').AsString;
    end;
    IBQSPRN.ParamByName('MADRE').AsInteger := IBDSSimple.fieldByName('I9').AsInteger;
    IBQSPRN.ParamByName('PESO').AsInteger := IBDSSimple.fieldByName('I1').AsInteger;
    IBQSPRN.ParamByName('RODEO').AsInteger := IBDSSimple.fieldByName('I5').AsInteger;
    IBQSPRN.ParamByName('CO').Value := null;
  end;
end;

procedure TFEveNacimientos.CargarParametrosMasivo;
begin
  if(CrearGrupo)then
    IBQSPEventoInd.ParamByName('id_grupo').Value := IBSPCrearGrupo.ParamByName('IDNUEVOGRUPO').Value;
  IBQSPEventoInd.ParamByName('animal').Value := IBDSSimple.FieldValues['id_animal'];
  IBQSPEventoInd.ParamByName('fecha').Value := IBDSSimple.FieldValues['fecha'];
  IBQSPEventoInd.ParamByName('observacion').Value := IBDSSimple.FieldValues['observacion'];
  IBQSPEventoInd.ParamByName('esta').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('responsable').Value := IBDSSimple.FieldValues['responsable'];
  IBQSPEventoInd.ParamByName('log_usuario').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('log_fecha_modif').Value := Date();
  IBQSPEventoInd.ParamByName('potrero').Value := IBDSSimple.FieldValues['I4'];
  IBQSPEventoInd.ParamByName('rodeo').Value := IBDSSimple.FieldValues['I5'];
  IBQSPEventoInd.ParamByName('sexo').Value := IBDSSimple.FieldValues['I2'];
  if IBDSSimple.FieldValues['I9']=-1 then
    IBQSPEventoInd.ParamByName('madre').Value:=null
  else
    IBQSPEventoInd.ParamByName('madre').Value := IBDSSimple.FieldValues['I9'];
  IBQSPEventoInd.ParamByName('peso').Value := IBDSSimple.FieldValues['I1'];
  IBQSPEventoInd.ParamByName('raza').Value := IBDSSimple.FieldValues['I3'];
  IBQSPEventoInd.ParamByName('vivo').Value := IBDSSimple.FieldValues['VUNO3'];
  IBQSPEventoInd.ParamByName('nombre').Value := IBDSSimple.FieldValues['nombre'];
  IBQSPEventoInd.ParamByName('rp').Value := IBDSSimple.FieldValues['id_rp'];
  IBQSPEventoInd.ParamByName('sen').Value := IBDSSimple.FieldValues['id_senasa'];
  IBQSPEventoInd.ParamByName('pc').Value := IBDSSimple.FieldValues['V6'];
  IBQSPEventoInd.ParamByName('hba').Value := IBDSSimple.FieldValues['V7'];
  IBQSPEventoInd.ParamByName('ra').Value := IBDSSimple.FieldValues['V8'];
  IBQSPEventoInd.ParamByName('otro').Value := IBDSSimple.FieldValues['V9'];
  IBQSPEventoInd.ParamByName('id_ie').Value := IBDSSimple.FieldValues['id_ie'];
  if BDBGSimple.Columns[14].Visible then
    IBQSPEventoInd.ParamByName('color').AsInteger := IBDSSimple.FieldValues['I6']
  else
    IBQSPEventoInd.ParamByName('color').AsInteger := 0;
  IBQSPEventoInd.ParamByName('grupo_parto').Value := id_grupo;
end;

procedure TFEveNacimientos.CargarDatosGrilla;
var
  rp, senasa : Variant;
begin
  {if NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple) then
  begin
      IBDSSimple.Insert;}
      IBDSSimple.FieldByName('ID_ANIMAL').Value := MSimple.IBQSeleccionados.fieldByName('ID_ANIMAL').AsInteger;
      if not (CBIdentificacion.Checked) then
        rp := 'N/N'
      else
      begin
          if (RBRP.Checked) then
          begin
            rp := EAPrefijo.Text+CompletarRP(rp_inicial)+EASufijo.Text;
            senasa := '';
            Inc(rp_inicial);
          end;
          if (RBSenasa.Checked) then
          begin
            rp := EAPrefijo.Text+CompletarDigitosSenasa(IntToStr(rp_inicial))+EASufijo.Text;
            senasa := EAPrefijo.Text+CompletarDigitosSenasa(IntToStr(rp_inicial))+EASufijo.Text;
            Inc(rp_inicial);
          end;
          if (RBCUIGSenasa.Checked) then
          begin
            rp := EAEncabezado.Text+IdentCUIG;
            senasa := EAEncabezado.Text+IdentCUIG;
            IdentCUIG := UFunctions.IncrementarIdentificadorCUIG(IdentCUIG);
            //ActualizarCUIG(IdentCUIG);
          end;
          //IBDSSimple.FieldByName('id_senasa').Value := senasa;
          RealizarCambio(EARpInicial,[IBDSSimple.FieldByName('id_senasa')],[senasa]);
      end;
      //IBDSSimple.FieldByName('id_rp').Value := rp;
      //IBDSSimple.FieldByName('nombre').Value := IBDSSimple.FieldByName('id_rp').AsString;

      RealizarCambio(EAPrefijo,[IBDSSimple.FieldByName('id_rp')],[rp]);
      RealizarCambio(EAPrefijo,[IBDSSimple.FieldByName('nombre')],[rp]);

      RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('fecha')],[DTPAFecha.Date]);
      //IBDSSimple.FieldByName('fecha').Value := DTPAFecha.Date;
      RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('responsable'),IBDSSimple.FieldByName('V1')],[DBLCBAResponsable.KeyValue,DBLCBAResponsable.Text]);
      //IBDSSimple.FieldByName('responsable').Value := DBLCBAResponsable.KeyValue;
      //IBDSSimple.FieldByName('V1').Value := DBLCBAResponsable.Text;
      RealizarCambio(DBLCBASexo,[IBDSSimple.FieldByName('I2'),IBDSSimple.FieldByName('V2')],[DBLCBASexo.KeyValue,DBLCBASexo.Text]);
      //IBDSSimple.FieldByName('I2').Value := DBLCBASexo.KeyValue;
      //IBDSSimple.FieldByName('V2').Value := DBLCBASexo.Text;
      RealizarCambio(DBLCBAVivoSN,[IBDSSimple.FieldByName('VUNO3'),IBDSSimple.FieldByName('V3')],[DBLCBAVivoSN.KeyValue,DBLCBAVivoSN.Text]);
      //IBDSSimple.FieldByName('VUNO3').Value := DBLCBAVivoSN.KeyValue;
      //IBDSSimple.FieldByName('V3').Value := DBLCBAVivoSN.Text;
      RealizarCambio(DBLCBAPotreros,[IBDSSimple.FieldByName('I4'),IBDSSimple.FieldByName('V4')],[DBLCBAPotreros.KeyValue,DBLCBAPotreros.Text]);
      //IBDSSimple.FieldByName('I4').Value := DBLCBAPotreros.KeyValue;
      //IBDSSimple.FieldByName('V4').Value := DBLCBAPotreros.Text;
      RealizarCambio(DBLCBARodeos,[IBDSSimple.FieldByName('I5'),IBDSSimple.FieldByName('V5')],[DBLCBARodeos.KeyValue,DBLCBARodeos.Text]);
      //IBDSSimple.FieldByName('I5').Value := DBLCBARodeos.KeyValue;
      //IBDSSimple.FieldByName('V5').Value := DBLCBARodeos.Text;
      RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('observacion')],[MAObservacion.Text]);
      //IBDSSimple.FieldByName('observacion').Value := MAObservacion.Text;
      RealizarCambio(EAPeso,[IBDSSimple.FieldByName('I1')],[peso]);
      //IBDSSimple.FieldByName('I1').Value := peso;
      RealizarCambio(DBLCBARaza,[IBDSSimple.FieldByName('I3'),IBDSSimple.FieldByName('V11')],[DBLCBARaza.KeyValue,DBLCBARaza.Text]);
      //IBDSSimple.FieldByName('I3').Value := DBLCBARaza.KeyValue;
      //IBDSSimple.FieldByName('V11').Value := DBLCBARaza.Text;
      if BDBGSimple.Columns[14].Visible then
        RealizarCambio(DBLCBAColor,[IBDSSimple.FieldByName('I6'),IBDSSimple.FieldByName('V12')],[DBLCBAColor.KeyValue,DBLCBAColor.Text]);

  //end;
end;

procedure TFEveNacimientos.LoadSQLStringList;
begin
  SQLStringList.AddObject('V1',DMSoftvet.DSResponsable);
  SQLStringList.AddObject('V2',DMSoftvet.DSTipoSexo);
  SQLStringList.AddObject('V3',DMSoftvet.DSCodigosGenericos);
  SQLStringList.AddObject('V4',DMSoftvet.DSPotrero);
  SQLStringList.AddObject('V5',DMSoftvet.DSRodeo);
  SQLStringList.AddObject('V10',DSMadres);
  SQLStringList.AddObject('V11',DMSoftvet.DSRaza);
  SQLStringList.AddObject('V12',DSColor);
end;

procedure TFEveNacimientos.ActualizarCUIG(var CUIG : String);
var
  nuevo_identificador, ultimo : String;
begin
  //Solamente Incremento el Identificador si el CUIG es el de este establecimiento
  if (CBCUIGPropio.Checked) then
  begin
    IBQBuscarCUIG.Close;
    IBQBuscarCUIG.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQBuscarCUIG.ParamByName('id').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQBuscarCUIG.Open;
    //ultimo := IBQBuscarCUIG.fieldByName('ultimo_identificador').AsString;
    //nuevo_identificador := UFunctions.IncrementarIdentificadorCUIG(ultimo);
    IBQActCUIG.Close;
    IBQActCUIG.ParamByName('cuig').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQActCUIG.ParamByName('UI').AsString := CUIG;
    IBQActCUIG.Open;
    CUIG := nuevo_identificador;
  end;
end;

procedure TFEveNacimientos.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  DMSoftvet.IBQTipoSexo.Close;
  DMSoftvet.IBQTipoSexo.Open;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('tipo').AsString := 'SN';
  DMSoftvet.IBQCodigosGenericos.Open;
  DMSoftvet.IBQCUIGActual.Close;
  DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQCUIGActual.Open;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQRaza.Close;
  DMSoftvet.IBQRaza.Open;
  DMSoftvet.IBQCUIGActual.Close;
  DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQCUIGActual.Open;
  IBQColor.Close;
  IBQColor.Open;
  IBQColor.Last;
  IBQColor.First;
  peso := 0;
  IBQPartos.Close;
  IBQPartos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPartos.Open;

  DBLCBARaza.KeyValue := 0;
  DBLCBAVivoSN.KeyValue := 'S';
  DBLCBASexo.KeyValue := 1;
  DBLCBAPotreros.KeyValue := 0;
  DBLCBARodeos.KeyValue := 0;
  DBLCBAResponsable.KeyValue := 0;
  DBLCBAColor.KeyValue := 0;

  MSimple.SQLBasico := 'select * from tab_animales';
  MSimple.PasarParametros(0,0);

  pasa_n := 1;
  RPs := TStringList.Create();

  DTPAFecha.Date := Date();

  //BBTerminar.Enabled := false;
  //BBSiguiente.Enabled := false;
  JvTerminar.Visible := false;
  LBBTerminar.Visible := false;
  JvSiguiente.Visible := false;
  LBBSiguiente.Visible := false;
  setEnableGBIdentificacion(false);
end;

procedure TFEveNacimientos.BDBGPartosCellClick(Column: TColumn);
begin
  inherited;
  LMadre.Visible:=false;
  Madre.Visible:=false;
  id_grupo := IBQPartos.FieldByName('id_grupo').AsInteger;
  IBQDatosParto.Close;
  IBQDatosParto.ParamByName('id_grupo').AsInteger := id_grupo;
  IBQDatosParto.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosParto.Open;

  cant_nacimientos := IBQDatosParto.fieldByName('cant').AsInteger;

  if cant_nacimientos > 0 then
  begin
    IBQRodeos.Close;
    IBQRodeos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQRodeos.ParamByName('grupo').AsInteger := id_grupo;
    IBQRodeos.Open;
    IBQRodeos.Last;
    IBQRodeos.First;
    if IBQRodeos.RecordCount = 1 then
    begin
      nro_rodeo := IBQRodeos.FieldValues['rodeo'];
      if IBQRodeos.FieldValues['potrero']<> null then
      begin
        nro_potrero := IBQRodeos.FieldValues['potrero'];
        DBLCBAPotreros.KeyValue := nro_potrero;
      end;
      fecha_parto := IBQRodeos.FieldValues['fecha_parto'];
      DTPAFecha.Date := fecha_parto;
      DBLCBARodeos.KeyValue := nro_rodeo;
    end;
      try
        IBSPBorrarTablasAuxiliares.Close;
        IBSPBorrarTablasAuxiliares.ExecProc;
        IBQMadres.Close;
        IBQMadres.ParamByName('grupo').AsInteger := id_grupo;
        IBQMadres.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQMadres.Open;
        IBQSelMadres.Close;
        IBQSelMadres.Open;
        GenerarNacimientos;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    if cant_nacimientos=1 then
      begin
      DSMadres.DataSet.First;
      Madre.Caption:=DSMadres.DataSet.FieldValues['ID_RP'];
      obtenerDatosMadre(DSMadres.DataSet.FieldValues['ID_ANIMAL_EXTERNO']);
      DBLCBARodeos.ListSource.DataSet.Locate('nombre',IBQRodeoMadre.FieldValues['nombre'],[]);
      DTPAFecha.Date:=IBQFechaParto.FieldValues['fecha'];
      LMadre.Visible:=true;
      Madre.Visible:=true;
      CBIdentificacion.Checked:=true;      // |
      CBIdentificacionClick(self);         // |--->alto parche
      CBIdentificacion.Checked:=false;     // |
      CBIdentificacionClick(self);         // |
      end;
  end;
  //BBSiguiente.Enabled := not(cant_nacimientos = 0);
  JvSiguiente.Enabled := not(cant_nacimientos = 0);
  LBBSiguiente.Enabled := not(cant_nacimientos = 0);
end;

procedure TFEveNacimientos.SetTextExtendido(Sender: TField; const Text: String);
var
  PickPos, aux, pos : Integer;
  Campo : TField;
  resultado : Boolean;
begin
  if(IBDSSimple.State <> dsInsert)then
  begin
    SetText(Sender,Text);
    if (Sender.FieldName = 'V1') then   //Responsable
    begin
        IBQValidaciones.SQL.Add('select NOMBRE || '' '' || APELLIDO as NombreyApellido from TAB_EMPLEADOS where (establecimiento = :esta) and ((apellido like '''+UpperCase(Text)+'%'') or(nombre like '''+UpperCase(Text)+'%'')or (NOMBRE || '' '' || APELLIDO like '''+UpperCase(Text)+'%''))');
        IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQValidaciones.Active := true;
        if not(IBQValidaciones.IsEmpty) then
        BEGIN
            Sender.AsString := IBQValidaciones.FieldByName('NombreyApellido').AsString;
            PickPos := BDBGSimple.ColumnByField('V1').PickList.IndexOf(BDBGSimple.ColumnByField('V1').Field.AsString);
            IBDSSimpleRESPONSABLE.Value :=  TClassType(BDBGSimple.ColumnByField('V1').PickList.Objects[PickPos]).getValue;
        END;
    end;
    if(Sender.FieldName = 'V5') then  //Rodeos
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from tab_rodeos where ((establecimiento = :esta) and (nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString;
        PickPos := BDBGSimple.ColumnByField('V5').PickList.IndexOf(BDBGSimple.ColumnByField('V5').Field.AsString);
        IBDSSimpleI5.Value := TClassType(BDBGSimple.ColumnByField('V5').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if(Sender.FieldName = 'V4') then  //Potreros
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from tab_potreros where ((establecimiento = :esta) and (nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;      
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString ;
        PickPos := BDBGSimple.ColumnByField('V4').PickList.IndexOf(BDBGSimple.ColumnByField('V4').Field.AsString);
        IBDSSimpleI4.Value := TClassType(BDBGSimple.ColumnByField('V4').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if(Sender.FieldName = 'V2') then  //Sexo
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_tipos_sexo where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString ;
        PickPos := BDBGSimple.ColumnByField('V2').PickList.IndexOf(BDBGSimple.ColumnByField('V2').Field.AsString);
        IBDSSimpleI2.Value := TClassType(BDBGSimple.ColumnByField('V2').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if(Sender.FieldName = 'V3') then  //Sino  (Vivo/Muerto)
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select valor from cod_genericos where ((valor like '''+UpperCase(Text)+'''||''%'') and tipo=''SN'')');
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('valor').AsString ;
        PickPos := BDBGSimple.ColumnByField('V3').PickList.IndexOf(BDBGSimple.ColumnByField('V3').Field.AsString);
        IBDSSimpleVUNO3.Value := TClassType(BDBGSimple.ColumnByField('V3').PickList.Objects[PickPos]).getValue;
      end;
    end;
    if(Sender.FieldName = 'V10') then  //Madres
    begin
      if (Text = '') then
      begin
        Sender.AsVariant := '';
        IBDSSimpleI9.Value := -1;
      end
      else
      begin
        IBQValidaciones.Close;
        IBQValidaciones.SQL.Clear;
        IBQValidaciones.SQL.Add('select id_rp from aux_animales_externos where ((id_rp like '''+UpperCase(Text)+'''||''%''))');
        IBQValidaciones.Open;
        if ((not(IBQValidaciones.IsEmpty)) and (not VerificarRepetidas(Sender,'V10',UpperCase(Text)))) then
        begin
          Sender.AsVariant := IBQValidaciones.FieldByName('id_rp').AsString ;
          pos := RPs.IndexOf(Sender.AsVariant);
          if (pos <> -1) then
            RPs.Delete(pos);
          PickPos := BDBGSimple.ColumnByField('V10').PickList.IndexOf(BDBGSimple.ColumnByField('V10').Field.AsString);
          IBDSSimpleI9.Value := TClassType(BDBGSimple.ColumnByField('V10').PickList.Objects[PickPos]).getValue;
          obtenerDatosMadre(IBDSSimpleI9.Value);
          SetText(IBDSSimpleFecha,IBQFechaParto.FieldValues['fecha']);
          SetTextExtendido(IBDSSimpleV5,IBQRodeoMadre.FieldValues['nombre']);
        end;
      end;
    end;
    if (Sender.FieldName = 'I1') then  //Peso
    begin
      if Length(Text) <= 4 then
        if not (TryStrToInt(Text,peso)) then
        begin
          peso := 0;
          Sender.AsVariant := '0';
        end
        else
          Sender.AsVariant := Text;
    end;
    if(Sender.FieldName = 'V11') then  //Raza
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_razas where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString ;
        PickPos := BDBGSimple.ColumnByField('V11').PickList.IndexOf(BDBGSimple.ColumnByField('V11').Field.AsString);
        IBDSSimpleI3.Value := TClassType(BDBGSimple.ColumnByField('V11').PickList.Objects[PickPos]).getValue;
      end
      else
      begin
        Sender.AsVariant := 'NO DEFINIDA';
        IBDSSimpleI3.Value := 0;
      end;
    end;
    if(Sender.FieldName = 'V12') then  //Color
    begin
      IBQValidaciones.Close;
      IBQValidaciones.SQL.Clear;
      IBQValidaciones.SQL.Add('select nombre from cod_colores where ((nombre like '''+UpperCase(Text)+'''||''%''))');
      IBQValidaciones.Open;
      if not(IBQValidaciones.IsEmpty) then
      begin
        Sender.AsVariant := IBQValidaciones.FieldByName('nombre').AsString ;
        PickPos := BDBGSimple.ColumnByField('V12').PickList.IndexOf(BDBGSimple.ColumnByField('V12').Field.AsString);
        IBDSSimpleI6.Value := TClassType(BDBGSimple.ColumnByField('V12').PickList.Objects[PickPos]).getValue;
      end
      else
      begin
        Sender.AsVariant := 'NO DEFINIDA';
        IBDSSimpleI3.Value := 0;
      end;
    end;
    if (Sender.FieldName = 'ID_RP') then  //Verificar RP
    begin
      if (Length(Text)<=9) then
      begin
        if (not VerificarRepetidas(Sender,'ID_RP',UpperCase(Text)))then
          Sender.AsVariant := UpperCase(Text)
        else
          ShowMessage('El RP que esta intentando ingresar esta repetido');
      end
      else
        ShowMessage('La longitud del RP no puede superar los 9 caracteres');
    end;
    if (Sender.FieldName = 'ID_SENASA') then     //SENASA
    begin
      if (CUIG) then    // Chequeo si es el CUIG SENASA
      begin
        if (Length(Text)<=9) then
        begin
          if (CheckFormatoCUIG(UpperCase(Text))) then
            begin
              if not VerificarRepetidas(Sender,'ID_SENASA',UpperCase(Text)) then
                Sender.AsVariant := UpperCase(Text)
              else
                ShowMessage('El CUIG que esta intentando ingresar esta repetido');
            end
          else
            ShowMessage('El formato del CUIG no es valido');
        end
        else
          ShowMessage('La longitud del CUIG no puede superar los 9 caracteres')
      end
      else    //Chequeo si es el SENASA viejo
      begin
        if (Length(Text)<=9) then
        begin
          if TryStrToInt(Text,aux) then
          begin
            if not VerificarRepetidas(Sender,'ID_SENASA',Text)then
              Sender.AsVariant := CompletarDigitosSenasa(Text)
            else
              ShowMessage('El SENASA que esta intentando ingresar esta repetido');
          end
          else
            ShowMessage('El formato del SENASA solo permite ingresar numeros');
        end
        else
          ShowMessage('La longitud del SENASA no puede superar los 9 caracteres');
      end;
    end;
  end;
end;

function TFEveNacimientos.VerificarRepetidas(Seleccion : TField; Columna, Valor : String): Boolean;
var
  Campo : TField;
  ValorAux : String;
begin
  ValorAux := Valor;
  Campo := TField.Create(nil);
  Campo := Seleccion;
  Result := IBDSSimple.Locate(Columna,ValorAux,[]);
  BDBGSimple.SelectedField := Campo;
  IBDSSimple.Edit;
end;

procedure TFEveNacimientos.setEnableGBIdentificacion(b: boolean);
begin
  RBSenasa.Enabled:=b;
  RBRp.Enabled:=b;
  EAPrefijo.Enabled:=b;
  EARpInicial.Enabled:=b;
  EASufijo.Enabled:=b;
  RBCUIGSenasa.Enabled:=b;
  EAEncabezado.Enabled:=b;
  EAUltimoIdent.Enabled:=b;
  CBCUIGPropio.Enabled:=b;
  CBCUIGPropio.Enabled:=b;
  DBLCBACUIGPropio.Enabled:=b;
  LRpInicial.Enabled:=b;
  if(not b) then
  begin
    EARpInicial.Text:='';
    EAPrefijo.Text:='';
    EASufijo.Text:='';
    EAEncabezado.Text:='';
    EAUltimoIdent.Text:='';
    CBCUIGPropio.Checked:=false;
    CBCUIGPropioClick(nil);
  end;
end;

procedure TFEveNacimientos.CBIdentificacionClick(Sender: TObject);
begin
  inherited;
  if CBIdentificacion.Checked then
  begin
    BDBGSimple.Columns[3].Visible := true;
    BDBGSimple.Columns[4].Visible := true;
    BDBGSimple.Columns[5].Visible := true;
    BDBGSimple.Columns[6].Visible := true;
    BDBGSimple.Columns[7].Visible := true;
    BDBGSimple.Columns[8].Visible := true;

    BDBGSimple.Columns[0].ReadOnly := false;
    BDBGSimple.Columns[1].ReadOnly := false;
    GBIdentificacion.Enabled := true;
    setEnableGBIdentificacion(true);
    EARpInicial.EsRequerido := true;
    RBRP.Checked := true;
  end
  else
  begin
    BDBGSimple.Columns[3].Visible := false;
    BDBGSimple.Columns[4].Visible := false;
    BDBGSimple.Columns[5].Visible := false;
    BDBGSimple.Columns[6].Visible := false;
    BDBGSimple.Columns[7].Visible := false;
    BDBGSimple.Columns[8].Visible := false;
    BDBGSimple.Columns[0].ReadOnly := true;
    BDBGSimple.Columns[1].ReadOnly := true;
    GBIdentificacion.Enabled := false;
    setEnableGBIdentificacion(false);
    EARpInicial.EsRequerido := false;
  end;
  ControlEventoOnExit(nil);
end;

procedure TFEveNacimientos.GenerarNacimientos();
var
  i : integer;
begin
    for i:=1 to cant_nacimientos do
    begin
      try
        IBQGenIDAnimal.Close;
        IBQGenIDAnimal.Open;
        
        IBQGenAnimales.Close;
        IBQGenAnimales.ParamByName('id_aux').AsInteger := i;
        IBQGenAnimales.ParamByName('id_animal').AsInteger := IBQGenIDAnimal.FieldValues['IDANIMAL'];
        IBQGenAnimales.ParamByName('rp').AsString := 'N/N';
        IBQGenAnimales.Open;
        //FPrincipal.IBTPrincipal.CommitRetaining;
      except
        //FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
end;

procedure TFEveNacimientos.PCBasicoChange(Sender: TObject);
begin
  if((rp_inicial + cant_nacimientos - 1 > 999999999) or (not controlarCuig(identCUIG))) then
  begin
      TSGrilla.TabVisible:=false;
      PCBasico.ActivePage := TsDatos;
      EAEncabezado.Text:='';
      EAUltimoIdent.Text:='';
      CBCUIGPropio.Checked:=false;
      CBCUIGPropioClick(nil);
  end
  else
  begin
    //if (PCBasico.ActivePage = TSPartos) then
      //PasoGrilla := false; //Esto es para q cuando vaya a la seleccion de servicios se reinicie la grilla;
    if (PCBasico.ActivePage = TSDatos) then
    begin
      try
        IBQDistosicos.Close;
        IBQDistosicos.ParamByName('grupo').AsInteger := id_grupo;
        IBQDistosicos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQDistosicos.Open;
        RPs.Clear;
        if (not IBQDistosicos.IsEmpty)then
        begin
          IBQDistosicos.First;
          while not IBQDistosicos.Eof do
          begin
            RPs.Add(IBQDistosicos.fieldByName('id_rp').AsString);
            IBQDistosicos.Next;
          end;
        end;
        if CBIdentificacion.Checked then
        begin
          if RBCUIGSenasa.Checked then
            identCUIG := EAUltimoIdent.Text
          else
            rp_inicial := StrToInt(EARPInicial.Text);
        end;
      except
      end;
      MSimple.IBQSeleccionados.Close;
      MSimple.IBQSeleccionados.Open;
      FPrincipal.IBDPrincipal.ApplyUpdates([MSimple.IBQSeleccionados]);
    end;
    inherited;
    if (PCBasico.ActivePage = TSGrilla) then
    begin
      if (CBIdentificacion.Checked) then
        CUIG := RBCUIGSenasa.Checked;

      LBBTerminar.Visible := true;
      JvTerminar.Visible := true;
      //ControlEventoOnExit(nil);
      //ControlBounds;
    end;
    TSManga.TabVisible := false;
  end;
  ControlBounds;
  ControlEventoOnExit(self);
end;

procedure TFEveNacimientos.EAPESOExit(Sender: TObject);
begin
  inherited;
  if not TryStrToInt(EAPeso.Text,peso) then EAPeso.Text := '0';
  GetEvent(Sender);
end;

procedure TFEveNacimientos.BDBGSimpleDblClick(Sender: TObject);
begin
  //inherited;    Esto debe ir comentado porque no se puede ingresar a la ficha del animal
  //              ya que este todavia no ha sido dado de alta
end;

procedure TFEveNacimientos.RBRpClick(Sender: TObject);
begin
  inherited;
  LRpInicial.Visible:=true;
  EARPInicial.Visible := true;
  EARpInicial.Text:='';
  EAPrefijo.Enabled := True;
  EAPrefijo.Visible := True;
  EAPrefijo.SetFocus;
  EASufijo.Enabled := True;
  EASufijo.Visible := True;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EARpInicial.MaxLength := 6;
  EARpInicial.Left := 211;
  EARpInicial.Width := 46;
  EARpInicial.Text:= '';
  EARPinicial.EsRequerido := true;
  //BBSiguiente.Enabled:=false;
  JvSiguiente.Enabled := false;
  LBBSiguiente.Enabled := false;
  TSGrilla.TabVisible:=false;
  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;
  DBLCBACUIGPropio.Visible := false;
  ComponentesVisiblesPorPais(FPrincipal.Pais);
end;

procedure TFEveNacimientos.RBSenasaClick(Sender: TObject);
begin
  inherited;
  LRpInicial.Visible:=true;
  EAPrefijo.Enabled := False;
  EAPrefijo.Visible := False;
  EASufijo.Enabled := False;
  EASufijo.Visible := False;
  EARPInicial.Visible := true;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EARpInicial.MaxLength := 9;
  EARpInicial.Left := 185;
  EARpInicial.Width := 63;
  EARpInicial.Text:='';
  EARpInicial.SetFocus;
  EAPrefijo.Text := '';
  EASufijo.Text := '';
  EARpInicial.Text:= '';
  //BBSiguiente.Enabled:=false;
  LBBSiguiente.Enabled := false;
  JvSiguiente.Enabled := false;
  TSGrilla.TabVisible:=false;
  EARPinicial.EsRequerido := true;
  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;
  DBLCBACUIGPropio.Visible := false;
  ComponentesVisiblesPorPais(FPrincipal.Pais);  
end;

procedure TFEveNacimientos.RBCUIGSenasaClick(Sender: TObject);
begin
  inherited;
  LRpInicial.Visible:=false;
  EAEncabezado.Visible := true;
  EAUltimoIdent.Visible := true;
  EAEncabezado.Text:='';
  EAUltimoIdent.Text:='';
  EAPrefijo.Visible := false;
  EARPInicial.Visible := false;
  EASufijo.Visible := false;
  EARPinicial.EsRequerido := false;
  CBCUIGPropio.Visible := true;
  LCUIGPropio.Visible := true;  
  //BBSiguiente.Enabled:=false;
  LBBSiguiente.Enabled := false;
  JvSiguiente.Enabled := false;
  TSGrilla.TabVisible:=false;
  CBCUIGPropio.Checked:=false;
  CBCUIGPropioClick(nil);
end;

procedure TFEveNacimientos.CBCUIGPropioClick(Sender: TObject);
begin
  inherited;
  if (CBCUIGPropio.Checked) then
    DBLCBACUIGPropio.Visible := true
  else
    DBLCBACUIGPropio.Visible := false;
end;

procedure TFEveNacimientos.DBLCBACUIGPropioCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBACUIGPropio.KeyValue <> null) then
  begin
    IBQBuscarCUIG.Close;
    IBQBuscarCUIG.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQBuscarCUIG.ParamByName('id').AsInteger := DBLCBACUIGPropio.KeyValue;
    IBQBuscarCUIG.Open;
    EAEncabezado.Text := DBLCBACUIGPropio.Text;
    EAUltimoIdent.Text := IBQBuscarCUIG.fieldByName('ultimo_identificador').AsString;
    identCUIG := EAUltimoIdent.Text;
    GetEventIdent(EAEncabezado);
  end;
end;

procedure TFEveNacimientos.ControlEventoOnExit(Sender: TObject);
var
  graba      : Boolean;
  hayCUIG    : Boolean;
begin
  inherited;
  hayCUIG := true;
  if (RBCUIGSenasa.Checked) then
  begin
    hayCUIG := ((EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____'));
    hayCUIG := hayCUIG and CheckFormatoCUIGEncabezado(EAEncabezado.Text) and CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text);
  end;
  graba := PuedeGrabar and hayCUIG;
  BSacarAnimal.Visible:= false; //no se pueden eliminar animales
  
{$IFDEF DEMO}
  {$IFDEF EC}
    JvTerminar.Visible := true;
    LBBTerminar.Visible := true;
  {$ELSE}
   IBQGetCantAnimales.Close;
   IBQGetCantAnimales.ParamByName('establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
   IBQGetCantAnimales.Open;
   if (PuedeGrabar and (IBQGetCantAnimales.FieldByName('cantidad').AsInteger <= CantAnimalesEjecuciones)) then
   begin
     JvTerminar.Visible := true;
     LBBTerminar.Visible := true;
   end
   else
   begin
    MostrarMensaje(tmInformacion,'Para cargar más animales debe comprar Huella. Ingrese a http://www.softhuella.com.ar');
    JvTerminar.Visible := false;
    LBBTerminar.Visible := false;
   end;
  {$ENDIF}
{$ELSE}
if (PCBasico.ActivePage = TSGrilla) then
    begin
      JvTerminar.Visible := VerificarCantAnimalesBase(BDBGSimple.DataSource.DataSet.RecordCount) and graba;
      LBBTerminar.Visible := VerificarCantAnimalesBase(BDBGSimple.DataSource.DataSet.RecordCount) and graba;
    end;
{$ENDIF}
 ControlBounds;

end;

procedure TFEveNacimientos.ATerminarExecute(Sender: TObject);
var
  pasa : Boolean;
begin

  pasa := true;

  if (RPs.Count > 0) and (cant_nacimientos>1) then
    pasa := MostrarMensajeNacimientos(tmConsulta,'Los siguientes vientre fueron cargados con partos distocicos.Se recomienda asociarles un nacimiento. Hacerlo ahora?',RPs) = mrNo;

  if (pasa) then
  begin
    inherited;
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    if (CrearGrupo and PuedeTerminar) then
    begin
      try
        IBQGrupoParto.Close;
        IBQGrupoParto.ParamByName('grupo').AsInteger := id_grupo;
        IBQGrupoParto.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQGrupoParto.Open;
        ActualizarCUIG(IdentCUIG);
        FPrincipal.IBSPCambiarCategoria.Close;
        FPrincipal.IBSPCambiarCategoria.ExecProc;
        FPrincipal.IBTPrincipal.CommitRetaining;
      except
        FPrincipal.IBTPrincipal.RollbackRetaining;
      end;
    end;
  end;

end;

procedure TFEveNacimientos.EARpInicialExit(Sender: TObject);
var
  val : integer;
begin
  inherited;
  if TryStrToInt(EARPInicial.Text,val) then
  begin
    rp_inicial := val;
    if(val + cant_nacimientos - 1 > 999999999) then
    begin
      EARPInicial.Text:='';
      MostrarMensaje(tmAdvertencia, 'Los identificadores superan el límite permitido');
      //ASiguiente.Enabled:= false;
      //BBSiguiente.Enabled:= false;
      JvSiguiente.Enabled := false;
      LBBSiguiente.Enabled := false;
      PCBasico.ActivePage := TsDatos;
      TSGrilla.TabVisible:= false;
    end;
  end;
end;

function TFEveNacimientos.controlarCuig(IdentCUIG : String):Boolean;
var
  numero:String;
  num : Integer;
  letra : Char;
begin
    Result:=true;
    if(StrLen(PChar(IdentCuig))=4) then
    begin
      letra := IdentCUIG[1];
      numero := IdentCUIG[2]+IdentCUIG[3]+IdentCUIG[4];
      num := StrToInt(numero);

      if (letra = 'Z') and (num + cant_nacimientos - 1 > 999  ) then
        Result:=false;
    end;
end;

procedure TFEveNacimientos.EAUltimoIdentExit(Sender: TObject);
begin
  inherited;
  identCUIG := EAUltimoIdent.Text;
  if( not controlarCuig(EAUltimoIdent.Text))then
  begin
    EAEncabezado.Text:='';
    EAUltimoIdent.Text:='';
    CBCUIGPropio.Checked:=false;
    CBCUIGPropioClick(nil);
    //BBSiguiente.Enabled:= false;
    JvSiguiente.Enabled := false;
    LBBSiguiente.Enabled := false;
    MostrarMensaje(tmAdvertencia, 'Los identificadores superan el límite permitido.');
    TSGrilla.TabVisible:= false;
    PCBasico.ActivePage := TsDatos;
  end;
end;

procedure TFEveNacimientos.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
    fecha.Date:=now;
  GetEvent(DTPAFecha);
end;

procedure TFEveNacimientos.EARpInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not (key in (['0'..'9']))  and (key <> #8)) then
    key:=#0;
end;

procedure TFEveNacimientos.FormShow(Sender: TObject);
begin
  inherited;
   IBQuerySelPotreroEvento.Close;
    if (id_potreroaux <> 0) then
    begin
      IBQuerySelPotreroEvento.SQL.clear;
      IBQuerySelPotreroEvento.SQL.Add('select * from TAB_POTREROS where establecimiento = :ESTABLECIMIENTO and visible = 1 and id_potrero = :id_potreroaux');
      IBQuerySelPotreroEvento.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQuerySelPotreroEvento.ParamByName('id_potreroaux').AsInteger := id_potreroaux;
    end
    else
    begin
      IBQuerySelPotreroEvento.SQL.clear;
      IBQuerySelPotreroEvento.SQL.Add('select * from TAB_POTREROS where establecimiento = :ESTABLECIMIENTO and visible = 1');
      IBQuerySelPotreroEvento.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    end;

    IBQuerySelPotreroEvento.Open;
    IBQuerySelPotreroEvento.Last;
    IBQuerySelPotreroEvento.First;

  DBLCBAPotreros.AsignarValorDefecto;
  ComponentesVisiblesPorPais(FPrincipal.Pais);
  BDBGPartos.DataSource.DataSet.First;
  if(TSPartos.TabVisible)then
  begin
     BDBGPartos.SetFocus;
     LBBTerminar.Visible := false;
     JvTerminar.Visible := false;
  end;
  BDBGPartosCellClick(BDBGPartos.Columns.Items[0]);
  LCUIGPropio.Visible:= false;

end;

procedure TFEveNacimientos.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  RBSenasa.Caption:= FPrincipal.PaisNombreCaravana;
  if (pais = 1) then //Argentina
   begin
    RBCUIGSenasa.Visible:= True;
    if (RBCUIGSenasa.Checked) then
      begin
        EAEncabezado.Visible:= True;
        EAUltimoIdent.Visible:= True;
        CBCUIGPropio.Visible:= True;
        LCUIGPropio.Visible := True;
        if (CBCUIGPropio.Checked) then
          DBLCBACUIGPropio.Visible:= True;
      end;    
    RBRp.Left:= 87;
    LRpInicial.Left:= 134;
    EAPrefijo.Left:= 185;
    EARpInicial.Left:= 211;
    EASufijo.Left:= 260;
    EARpInicial.Width:= 44;
    RBSenasa.Width:= 62;
    if (RBSenasa.Checked) then
      EARpInicial.Width:= 73;
   end
  else
    if (pais = 2) then //Uruguay
     begin
      RBCUIGSenasa.Visible:= False;
      EAEncabezado.Visible:= False;
      EAUltimoIdent.Visible:= False;
      CBCUIGPropio.Visible:= False;
      LCUIGPropio.Visible := False;      
      DBLCBACUIGPropio.Visible:= False;
      RBRp.Left:= 147;
      LRpInicial.Left:= 194;
      EAPrefijo.Left:= 245;
      EARpInicial.Left:= 271;
      EASufijo.Left:= 320;
      EARpInicial.Width:= 44;
      RBSenasa.Width:= 120;      
      if (RBSenasa.Checked) then
        EARpInicial.Width:= 120;
     end
    else
       begin
        RBCUIGSenasa.Visible:= False;
        EAEncabezado.Visible:= False;
        EAUltimoIdent.Visible:= False;
        CBCUIGPropio.Visible:= False;
        LCUIGPropio.Visible := False;
        DBLCBACUIGPropio.Visible:= False;
        RBRp.Left:= 147;
        LRpInicial.Left:= 194;
        EAPrefijo.Left:= 245;
        EARpInicial.Left:= 271;
        EASufijo.Left:= 320;
        EARpInicial.Width:= 44;
        RBSenasa.Width:= 120;
        if (RBSenasa.Checked) then
          EARpInicial.Width:= 120;
       end;
end;

procedure TFEveNacimientos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
Limpiar();
end;

procedure TFEveNacimientos.EAEncabezadoChange(Sender: TObject);
begin
  inherited;
  if(UFunctions.CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
  begin
    //BBSiguiente.Enabled:=true;
    JvSiguiente.Enabled := true;
    LBBSiguiente.Enabled := true;
    TSGrilla.TabVisible:= true;
  end
  else
  begin
   //BBSiguiente.Enabled:=false;
   JvSiguiente.Enabled := false;
   LBBSiguiente.Enabled := false;
   TSGrilla.TabVisible:= false;
  end;
end;

procedure TFEveNacimientos.EAUltimoIdentChange(Sender: TObject);
begin
  inherited;
  if(UFunctions.CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
  begin
    //BBSiguiente.Enabled:=true;
    JvSiguiente.Enabled := true;
    LBBSiguiente.Enabled := true;
    TSGrilla.TabVisible:= true;
  end
  else
  begin
   //BBSiguiente.Enabled:=false;
   JvSiguiente.Enabled := false;
   LBBSiguiente.Enabled := false;
   TSGrilla.TabVisible:= false;
  end;
end;

procedure TFEveNacimientos.Label11Click(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMEmpleados.Create(self));
      DMSoftvet.IBQResponsable.Close;
      DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQResponsable.Open;
    end;
  cambiarCB(DBLCBAResponsable,nroID);
end;

procedure TFEveNacimientos.Label11MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label11.Font.Color:= $00606C02;
      Label11.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveNacimientos.Label11MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label11.Font.Color:= clWindowText;
      Label11.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveNacimientos.Label8Click(Sender: TObject);
var
  abm : TFABMPotreros;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm := TFABMPotreros.Create(self);
      abm.Abrir(faAbm);
      IBQuerySelPotreroEvento.Close;
      IBQuerySelPotreroEvento.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
      IBQuerySelPotreroEvento.Open;
    end;
    cambiarCB(DBLCBAPotreros,nroID);
end;

procedure TFEveNacimientos.Label8MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label8.Font.Color:= $00606C02;
      Label8.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveNacimientos.Label8MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label8.Font.Color:= clWindowText;
      Label8.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveNacimientos.Label9Click(Sender: TObject);
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
    end;
    cambiarCB(DBLCBARodeos,nroID);
end;

procedure TFEveNacimientos.Label9MouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label9.Font.Color:= $00606C02;
      Label9.Font.Style:= [fsBold,fsUnderline];
    end;  
end;

procedure TFEveNacimientos.Label9MouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      Label9.Font.Color:= clWindowText;
      Label9.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveNacimientos.LCUIGPropioClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMModificarCUIG.Create(Self));
      DMSoftvet.IBQCUIGActual.Close;
      DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQCUIGActual.Open;
    end;
    cambiarCB(DBLCBACUIGPropio,nroID);
end;

procedure TFEveNacimientos.LCUIGPropioMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCUIGPropio.Font.Color:= $00606C02;
      LCUIGPropio.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveNacimientos.LCUIGPropioMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCUIGPropio.Font.Color:= clWindowText;
      LCUIGPropio.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveNacimientos.completarCampos;
begin
      inherited;
      RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('fecha')],[DTPAFecha.Date]);
      //IBDSSimple.FieldByName('fecha').Value := DTPAFecha.Date;
      RealizarCambio(DBLCBAResponsable,[IBDSSimple.FieldByName('responsable'),IBDSSimple.FieldByName('V1')],[DBLCBAResponsable.KeyValue,DBLCBAResponsable.Text]);
      //IBDSSimple.FieldByName('responsable').Value := DBLCBAResponsable.KeyValue;
      //IBDSSimple.FieldByName('V1').Value := DBLCBAResponsable.Text;
      RealizarCambio(DBLCBASexo,[IBDSSimple.FieldByName('I2'),IBDSSimple.FieldByName('V2')],[DBLCBASexo.KeyValue,DBLCBASexo.Text]);
      //IBDSSimple.FieldByName('I2').Value := DBLCBASexo.KeyValue;
      //IBDSSimple.FieldByName('V2').Value := DBLCBASexo.Text;
      RealizarCambio(DBLCBAVivoSN,[IBDSSimple.FieldByName('VUNO3'),IBDSSimple.FieldByName('V3')],[DBLCBAVivoSN.KeyValue,DBLCBAVivoSN.Text]);
      //IBDSSimple.FieldByName('VUNO3').Value := DBLCBAVivoSN.KeyValue;
      //IBDSSimple.FieldByName('V3').Value := DBLCBAVivoSN.Text;
      RealizarCambio(DBLCBAPotreros,[IBDSSimple.FieldByName('I4'),IBDSSimple.FieldByName('V4')],[DBLCBAPotreros.KeyValue,DBLCBAPotreros.Text]);
      //IBDSSimple.FieldByName('I4').Value := DBLCBAPotreros.KeyValue;
      //IBDSSimple.FieldByName('V4').Value := DBLCBAPotreros.Text;
      RealizarCambio(DBLCBARodeos,[IBDSSimple.FieldByName('I5'),IBDSSimple.FieldByName('V5')],[DBLCBARodeos.KeyValue,DBLCBARodeos.Text]);
      //IBDSSimple.FieldByName('I5').Value := DBLCBARodeos.KeyValue;
      //IBDSSimple.FieldByName('V5').Value := DBLCBARodeos.Text;
      RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('observacion')],[MAObservacion.Text]);
      //IBDSSimple.FieldByName('observacion').Value := MAObservacion.Text;
      RealizarCambio(EAPeso,[IBDSSimple.FieldByName('I1')],[peso]);
      //IBDSSimple.FieldByName('I1').Value := peso;
      RealizarCambio(DBLCBARaza,[IBDSSimple.FieldByName('I3'),IBDSSimple.FieldByName('V11')],[DBLCBARaza.KeyValue,DBLCBARaza.Text]);
      //IBDSSimple.FieldByName('I3').Value := DBLCBARaza.KeyValue;
      //IBDSSimple.FieldByName('V11').Value := DBLCBARaza.Text;
end;

procedure TFEveNacimientos.obtenerDatosMadre(id_madre:integer);
begin
  IBQRodeoMadre.Close;
  IBQRodeoMadre.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRodeoMadre.ParamByName('animal').AsInteger := id_madre;
  IBQRodeoMadre.Open;
  IBQFechaParto.Close;
  IBQFechaParto.ParamByName('madre').AsInteger := id_madre;
  IBQFechaParto.Open;
end;

procedure TFEveNacimientos.GetEventIdent(Sender : TObject);
begin
  if CBIdentificacion.Checked then
    if RBRP.Checked then
      if (Sender is TEditAuto) then
        if (((Sender as TEditAuto).Name = 'EAPrefijo') or ((Sender as TEditAuto).Name = 'EARpInicial') or
            ((Sender as TEditAuto).Name = 'EASufijo')) then
          GetEvent(EAPrefijo);
    if RBSenasa.Checked then
      if (Sender is TEditAuto) then
        if (Sender as TEditAuto).Name = 'EARpInicial' then
          GetEvent(EARpInicial);
    if RBCUIGSenasa.Checked then
      if (Sender is TMaskEdit) then
        if (((Sender as TMaskEdit).Name = 'EAEncabezado') or ((Sender as TMaskEdit).Name = 'EAUltimoIdent')) then
          GetEvent(EARPInicial);
end;

procedure TFEveNacimientos.EARpInicialChange(Sender: TObject);
begin
  inherited;

  rp_inicial := StrToInt(EARpInicial.Text);
                                         
end;


procedure TFEveNacimientos.DBLCBARazaCloseUp(Sender: TObject);
var raza : integer;
begin
  inherited;
  if DBLCBARaza.KeyValue <> null then
  begin
       raza := DBLCBARaza.KeyValue;

       if ((raza = 29) or (raza = 30)) then
       begin
            LColor.Visible := true;
            DBLCBAColor.Visible := true;
            BDBGSimple.Columns[14].Visible := true;

       end
       else
       begin
            LColor.Visible := false;
            DBLCBAColor.Visible := false;
            BDBGSimple.Columns[14].Visible := false;
       end;
  end;
end;

end.

