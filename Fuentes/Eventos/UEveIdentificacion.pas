unit UEveIdentificacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBStoredProc, IBCustomDataSet, IBQuery,
  ActnList, ComCtrls, Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto,
  UFrameMangazo, Buttons, ExtCtrls, EditAuto, DBCtrls,
  UDBLookupComboBoxAuto, DateTimePickerAuto, UFunctions, DataExport,
  DataToXLS, WinXP, Mask, ImgList, PngImageList, JvExControls, JvLabel,
  PngImage, JvExExtCtrls, JvImage, jpeg, JvGIF, UImportacion,
  JvComponentBase, JvBalloonHint, xmldom, XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveIdentificacion = class(TFEveSimple)
    GBPrincipal: TGroupBox;
    LRPAnimal: TLabel;
    LNombre: TLabel;
    EAIdRP: TEditAuto;
    EANombre: TEditAuto;
    Label1: TLabel;
    EAApodo: TEditAuto;
    GBIdentificacion: TGroupBox;
    LPC: TLabel;
    LHBA: TLabel;
    LRA: TLabel;
    LOtro: TLabel;
    EAIdSenasa: TEditAuto;
    EAIdPC: TEditAuto;
    EAIdHBA: TEditAuto;
    EAIdRA: TEditAuto;
    EAOtro: TEditAuto;
    IBQDeleteAuxEventos: TIBQuery;
    GBResponsable: TGroupBox;
    LFecha: TLabel;
    LObservador: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    CBAObservador: TDBLookupComboBoxAuto;
    IBDSSimpleID_RP: TIBStringField;
    IBDSSimpleID_SENASA: TIBStringField;
    IBDSSimpleID_ANIMAL: TIntegerField;
    IBDSSimpleID_HBA: TIBStringField;
    IBDSSimpleID_OTRO: TIBStringField;
    IBDSSimpleID_PC: TIBStringField;
    IBDSSimpleID_RA: TIBStringField;
    IBDSSimpleAPODO: TIBStringField;
    IBDSSimpleNOMBRE: TIBStringField;
    IBDSSimpleFECHA: TDateField;
    IBDSSimpleOBSERVACION: TIBStringField;
    IBDSSimpleRESP: TIBStringField;
    IBDSSimpleRESPONSABLE: TIntegerField;
    IBDSSimpleEW: TIBStringField;
    RBSenasa: TRadioButton;
    RBCUIGSenasa: TRadioButton;
    EAEncabezado: TMaskEdit;
    EAUltimoIdent: TMaskEdit;
    EVerificador: TEdit;
    CBCUIGPropio: TCheckBox;
    DBLCBACUIGPropio: TDBLookupComboBoxAuto;
    IBQActCUIG: TIBQuery;
    IBQBuscarCUIG: TIBQuery;
    LCUIGPropio: TLabel;
    IBDSSimpleV2: TIBStringField;
    LIdentificacionElectronica: TLabel;
    EAIdentificacionElectronica: TEditAuto;
    IBDSSimpleID_IE: TIBStringField;
    RBReidentificacionSenasa: TRadioButton;
    EAUltimoIdentReidentificacion: TMaskEdit;
    EAEncabezadoReidentificacion: TMaskEdit;
    EVerificadorReidentificacion: TEdit;
    Lr: TLabel;
    EAPrefijo: TEditAuto;
    EARpInicial: TEditAuto;
    EASufijo: TEditAuto;
    IBQObtenerSexo: TIBQuery;
    IBDSSimpleI1: TIntegerField;
    IBQDatosAnimal: TIBQuery;
    IBQDatosAnimalID_ANIMAL: TIntegerField;
    IBQDatosAnimalESTABLECIMIENTO: TIntegerField;
    IBQDatosAnimalID_RP: TIBStringField;
    IBQDatosAnimalID_SENASA: TIBStringField;
    IBQDatosAnimalID_PC: TIBStringField;
    IBQDatosAnimalID_HBA: TIBStringField;
    IBQDatosAnimalID_RA: TIBStringField;
    IBQDatosAnimalID_OTRO: TIBStringField;
    IBQDatosAnimalNOMBRE: TIBStringField;
    IBQDatosAnimalFECHA_NACIMIENTO: TDateField;
    IBQDatosAnimalSEXO: TIntegerField;
    IBQDatosAnimalORIGEN: TIBStringField;
    IBQDatosAnimalCIRCUNFERENCIA_ESCROTAL: TFloatField;
    IBQDatosAnimalESTADO_LACTACION: TIntegerField;
    IBQDatosAnimalPOTRERO: TIntegerField;
    IBQDatosAnimalRAZA: TIntegerField;
    IBQDatosAnimalRODEO: TIntegerField;
    IBQDatosAnimalCATEGORIA: TIntegerField;
    IBQDatosAnimalACTIVO: TIBStringField;
    IBQDatosAnimalCRONOLOGIA_DENTARIA: TIntegerField;
    IBQDatosAnimalCONDICION_CORPORAL: TIntegerField;
    IBQDatosAnimalMADRE_BIOLOGICA_EXTERNA: TIntegerField;
    IBQDatosAnimalMADRE_RECEPTORA_EXTERNA: TIntegerField;
    IBQDatosAnimalGDR: TIntegerField;
    IBQDatosAnimalESTADO_REPRODUCTIVO: TIntegerField;
    IBQDatosAnimalPADRE_EXTERNO: TIntegerField;
    IBQDatosAnimalAPODO: TIBStringField;
    IBQDatosAnimalPESO: TFloatField;
    IBQDatosAnimalPESONACER: TFloatField;
    IBQDatosAnimalPESO205: TFloatField;
    IBQDatosAnimalPESO365: TFloatField;
    IBQDatosAnimalPESO550: TFloatField;
    IBQDatosAnimalRECHAZADO: TIBStringField;
    IBQDatosAnimalMADRE_BIOLOGICA_INTERNA: TIntegerField;
    IBQDatosAnimalMADRE_RECEPTORA_INTERNA: TIntegerField;
    IBQDatosAnimalPADRE_INTERNO: TIntegerField;
    IBQDatosAnimalFRAME: TFloatField;
    IBQDatosAnimalDTA: TIBStringField;
    IBQDatosAnimalDTA_BAJA: TIBStringField;
    IBQDatosAnimalESTADO_ACTUAL: TIBStringField;
    IBQDatosAnimalULTIMO_EVENTO: TIntegerField;
    IBQDatosAnimalULTIMO_PESO: TFloatField;
    IBQDatosAnimalACTIVIDAD: TIntegerField;
    IBQDatosAnimalID_IE: TIBStringField;
    IBQDatosAnimalPROPIETARIO: TIntegerField;
    IBQDatosAnimalCRIADOR: TIntegerField;
    IBQDatosAnimalORIGEN_ANIMAL: TIntegerField;
    IBQDatosAnimalADN: TIBStringField;
    IBQDatosAnimalTIPIFICACION_SANGUINEA: TIBStringField;
    IBQDatosAnimalSUBCATEGORIA: TIntegerField;
    IBQDatosAnimalCODIGO_MANEJO: TIntegerField;
    IBQDatosAnimalFOLIO_DENUNCIA: TIBStringField;
    IBQDatosAnimalLINEA_DENUNCIA: TIntegerField;
    IBQDatosAnimalMOCHO: TIntegerField;
    IBQDatosAnimalINSPECCION: TIntegerField;
    IBQDatosAnimalDESTINO_CABANIA: TIntegerField;
    IBQDatosAnimalCOLOR: TIntegerField;
    IBQDatosAnimalINFORMADO_AFIP: TIBStringField;
    RBRPAnimal: TRadioButton;
    EARpInicialMasivo: TEditAuto;
    EAPrefijoMasivo: TEditAuto;
    EASufijoMasivo: TEditAuto;
    IBQDatosAnimalCARAVANA_OFICIAL: TIBStringField;
    EAPrefijoCO: TEditAuto;
    IBDSSimpleCARAVANA_OFICIAL: TIBStringField;
    constructor Create(AOwner: TComponent; ConMadre:boolean); reintroduce;
    procedure FormCreate(Sender: TObject);
    procedure IBDSSimpleRESPSetText(Sender: TField; const Text: String);
    procedure IBDSSimpleID_RPSetText(Sender: TField; const Text: String);
    procedure ATerminarExecute(Sender: TObject);
    procedure IBDSSimpleFECHASetText(Sender: TField; const Text: String);
    procedure FormShow(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ACancelarExecute(Sender: TObject);
    procedure EAIdSenasaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAIdSenasaExit(Sender: TObject);
    procedure EAIdSenasaKeyPress(Sender: TObject; var Key: Char);
    procedure RBSenasaClick(Sender: TObject);
    procedure RBCUIGSenasaClick(Sender: TObject);
    procedure DBLCBACUIGPropioCloseUp(Sender: TObject);
    procedure CBCUIGPropioClick(Sender: TObject);
    procedure EAUltimoIdentExit(Sender: TObject);
    procedure MSimpleBDBGDisponiblesDblClick(Sender: TObject);
    procedure EAIdRPKeyPress(Sender: TObject; var Key: Char);
    procedure EANombreKeyPress(Sender: TObject; var Key: Char);
    procedure EAApodoKeyPress(Sender: TObject; var Key: Char);
    procedure EAIdHBAKeyPress(Sender: TObject; var Key: Char);
    procedure EAIdPCKeyPress(Sender: TObject; var Key: Char);
    procedure EAIdRAKeyPress(Sender: TObject; var Key: Char);
    procedure EAOtroKeyPress(Sender: TObject; var Key: Char);
    procedure DTPAFechaKeyPress(Sender: TObject; var Key: Char);
    procedure EAEncabezadoKeyPress(Sender: TObject; var Key: Char);
    procedure EAUltimoIdentKeyPress(Sender: TObject; var Key: Char);
    procedure EVerificadorKeyPress(Sender: TObject; var Key: Char);
    procedure CBAObservadorKeyPress(Sender: TObject; var Key: Char);
    procedure AAnteriorExecute(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
    procedure EAIdSenasaChange(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure LObservadorMouseEnter(Sender: TObject);
    procedure LObservadorMouseLeave(Sender: TObject);
    procedure LCUIGPropioClick(Sender: TObject);
    procedure LCUIGPropioMouseEnter(Sender: TObject);
    procedure LCUIGPropioMouseLeave(Sender: TObject);
    procedure ASacarAnimalExecute(Sender: TObject);
    procedure ASiguienteExecute(Sender: TObject);
    procedure RBReidentificacionSenasaClick(Sender: TObject);
    procedure EAEncabezadoReidentificacionExit(Sender: TObject);
    procedure EARPOnExit(Sender : TObject);
    procedure EARPOnChange(Sender : TObject);
    procedure EARpInicialKeyPress(Sender: TObject; var Key: Char);
    procedure MSimpleBDBGSeleccionadosDblClick(Sender: TObject);
    procedure RBRPAnimalClick(Sender: TObject);
    procedure EARpInicialMasivoExit(Sender: TObject);
    procedure EAPrefijoMasivoChange(Sender: TObject);
    procedure ActualizarRp(RpUltimo : String);
    procedure ActualizarCOficial(COUltimo : String);
    procedure EAPrefijoCOKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    tipoevento : String;
    SQLRepetidos: String;
    UltimoCUIG : String;
    UltimoReidentificacion: String;
    Senasa : Integer;
    senasaValido : Boolean;
    IDRp : String;
    RpSenasa : Boolean;
    IDRpMasivo : String;
    COficial : String;
    //    function CantidadRepetidos(Campo: string; Valor: string): integer;
    function NullAVacio(campo:Variant):string;
    procedure ChequearCampoEnGrilla(Campo: string; Valor: string; ValAnterior:string);
    procedure MostrarPageControlRepetidos(value: boolean);
    procedure VerificarRepetidos;
    procedure cargarDatosAnimal;
//    procedure MarcarError(ew:string);
    procedure SetConMadre(const Value: boolean);
    procedure CargarDatosActuales;
    procedure CargarSenasa(ID_SENASA : String);
    procedure ActualizarCUIG(CUIG : String);
    procedure reparteRP(rp : String);
    procedure SeleccionaBotonCUIGSenasa;
  protected
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    procedure CargarDatosGrilla; override;
    Procedure CargarParametrosMasivo;override;
    procedure LoadSQLStringList;override;
    procedure cargarDatos(i:integer);override;
    procedure ComponentesVisiblesPorPais(pais: Integer);override;
    function controlarCuig(IdentCUIG : String):Boolean;
//    procedure completarCampos;
  public
    FConMadre: boolean;
     { Public declarations }
  published
      property ConMadre : boolean read FConMadre write SetConMadre;
  end;

var
  FEveIdentificacion: TFEveIdentificacion;

implementation

{$R *.dfm}
uses UDMSoftvet, UPrincipal, UEveUniversal, DateUtils,UClassType,
     UUniversal, StrUtils, UMensajeHuella, UREPFichaAnimal, UABMEmpleados,
     UABMModificarCUIG, UTraduccion;

{ TFEveIdentificacion }

constructor TFEveIdentificacion.create (AOwner: TComponent; ConMadre:boolean);
begin
   inherited Create(AOwner);
   FConMadre:= ConMadre;
   if(FConMadre)then
   begin
    MSimple.SQLBasico := 'select MADRE_BIOLOGICA_INTERNA as V1,ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otro,ID_MBI, ID_IE, SEXO, nombre, apodo, caravana_oficial From VIS_IDENTIFICACION';
    FTipoEvento := 19;
    tipoevento := 'I';
    BDBGSimple.ColumnByField('V2').Visible := true;
   end
   else
   begin
    MSimple.SQLBasico := 'select MADRE_BIOLOGICA_INTERNA as V1,ID_RP, ID_SENASA,id_animal,ID_PC, ID_HBA, ID_RA, ID_OTRO, NOMBRE,APODO, ID_IE, SEXO, caravana_oficial From VIS_REIDENTIFICACION';
    PTitulo.Caption := Traducir('Reidentificación del Animal');
    tipoevento := 'R';
    BDBGSimple.ColumnByField('V2').Visible := false;
    FTipoEvento := 36;
   end;
	if (UPrincipal.gv_eveIdentificacion = true) then
      JvIImpExcel.Visible := False;
end;

procedure TFEveIdentificacion.FormCreate(Sender: TObject);
begin
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('IDESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  inherited;
  SQLRepetidos := 'select count(*) as cantidad from AUX_EVENTOS ';
  IBQRepetidos.Close;
  IBQRepetidos.SQL.Text := SQLRepetidos;
  IBQRepetidos.Open;
  if(IBQRepetidos.FieldValues['cantidad']>0)then
  begin
     IBQDeleteAuxEventos.Close;
     IBQDeleteAuxEventos.Open;
  end;
  FPrincipal.IBTPrincipal.CommitRetaining;
  IBDSSimple.Close;
  IBDSSimple.Open;
  DMSoftvet.IBQCUIGActual.Close;
  DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQCUIGActual.Open;
	if (UPrincipal.gv_eveIdentificacion = true) then
    JvIImpExcel.Visible := False;
end;

procedure TFEveIdentificacion.CargarDatosGrilla;
var
  ID_SENASA : Variant;
  Id_RpMasivo : String;
begin
  inherited;
  {if(NoExiste(MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'],DSSimple))then
  begin                         }
    if (RBSenasa.Checked) then
      if (FPrincipal.Pais = 1) then //Argentina
        ID_SENASA := UFunctions.CompletarDigitosSenasa(IntToStr(Senasa))
      else
        begin
          ID_SENASA := UFunctions.generaCaravanaOficial
              (EAPrefijoCO.Text, EAIdSenasa.Text, BDBGSimple.RowCount -2);
          //ActualizarCOficial(COficial);
        end
    else
      if (RBCUIGSenasa.Checked) then
        ID_SENASA := EAEncabezado.Text+UltimoCUIG
       else
         if (RBReidentificacionSenasa.Checked) then
           ID_SENASA := 'R'+EAEncabezadoReidentificacion.Text+UltimoReidentificacion
         else
            if (RBRPAnimal.checked) then
              begin
                ID_RPMasivo := IDRPMasivo;
                ActualizarRp(IDRpMasivo);
              end;

    if ((ID_SENASA = '') or (ID_SENASA='000000000')) then
      if (FPrincipal.Pais = 1) then
        ID_SENASA := MSimple.IBQSeleccionados.FieldValues['ID_SENASA']
      else
        ID_SENASA := MSimple.IBQSeleccionados.FieldValues['CARAVANA_OFICIAL'];
    //IBDSSimple.Insert;
    IDAnimal := MSimple.IBQSeleccionados.FieldValues['ID_ANIMAL'];
    if ((tipoevento = 'I') and (ModoEve = meMasivo)) then
    begin
      if ID_SENASA <> null then
        IBDSSimple.FieldByName('ID_RP').Value := ID_SENASA//MSimple.IBQSeleccionados.FieldValues['ID_RP'];
      else
        if (ID_RPMasivo <> null) then
          IBDSSimple.FieldByName('ID_RP').Value := ID_RPMasivo
        else
          IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];
    end
    else
      if (RBRPAnimal.checked) then
        IBDSSimple.FieldByName('ID_RP').Value :=  ID_RPMasivo
      else
        IBDSSimple.FieldByName('ID_RP').Value := MSimple.IBQSeleccionados.FieldValues['ID_RP'];


    if (tipoevento = 'I') then
      IBDSSimple.FieldByName('V2').Value := MSimple.IBQSeleccionados.FieldValues['V1'];

    if (FPrincipal.Pais = 1) then
      IBDSSimple.FieldByName('ID_SENASA').Value:= ID_SENASA
      //MSimple.IBQSeleccionados.FieldValues['ID_SENASA'];
    else
      if (ID_SENASA <> null) and (ID_SENASA <> '') then
        IBDSSimple.FieldByName('CARAVANA_OFICIAL').Value := ID_SENASA;

    IBDSSimple.FieldByName('ID_RA').Value  := MSimple.IBQSeleccionados.FieldValues['ID_RA'];
    IBDSSimple.FieldByName('ID_PC').Value  := MSimple.IBQSeleccionados.FieldValues['ID_PC'];
    IBDSSimple.FieldByName('ID_HBA').Value := MSimple.IBQSeleccionados.FieldValues['ID_HBA'];
    IBDSSimple.FieldByName('ID_OTRO').Value:= MSimple.IBQSeleccionados.FieldValues['ID_OTRO'];
    IBDSSimple.FieldByName('ID_IE').Value  := MSimple.IBQSeleccionados.FieldValues['ID_IE'];
    IBDSSimple.FieldByName('NOMBRE').Value := MSimple.IBQSeleccionados.FieldValues['NOMBRE'];
    IBDSSimple.FieldByName('APODO').Value  := MSimple.IBQSeleccionados.FieldValues['APODO'];
    IBDSSimple.FieldByName('I1').Value := MSimple.IBQSeleccionados.FieldValues['SEXO'];

    RealizarCambio(DTPAFecha,[IBDSSimple.FieldByName('FECHA')],[DTPAFecha.GetDato]);
    //IBDSSimple.FieldByName('FECHA').Value:= DTPAFecha.GetDato;
    RealizarCambio(CBAObservador,[IBDSSimple.FieldByName('RESPONSABLE'),IBDSSimple.FieldByName('RESP')],[CBAObservador.GetDato,CBAObservador.Text]);
    //IBDSSimple.FieldByName('RESPONSABLE').Value:= CBAObservador.GetDato;
    //IBDSSimple.FieldByName('RESP').Value:= CBAObservador.Text;
    RealizarCambio(MAObservacion,[IBDSSimple.FieldByName('OBSERVACION')],[MAObservacion.GetDato]);
    //IBDSSimple.FieldByName('OBSERVACION').Value:= MAObservacion.GetDato;

    IBDSSimple.FieldByName('ID_ANIMAL').Value := IDAnimal;
    //IBDSSimple.Post;
    if ((ID_SENASA <> null) and (ModoEve = meMasivo))then
    begin
      if (RBSenasa.Checked) then
          Inc(Senasa)
      else
       if (RBCUIGSenasa.Checked) then
         UltimoCUIG := UFunctions.IncrementarIdentificadorCUIG(UltimoCUIG)
        else
          if (RBReidentificacionSenasa.Checked) then
           begin
             UltimoReidentificacion := UFunctions.IncrementarIdentificadorCUIG(UltimoReidentificacion);
             //UltimoReidentificacion := UltimoReidentificacion[2] + UltimoReidentificacion[3] + UltimoReidentificacion[4];
           end
          //else
            //if (RBRPAnimal.checked) then

    end;
  //end;
  //FPrincipal.IBTPrincipal.CommitRetaining;
end;

procedure TFEveIdentificacion.CargarParametrosMasivo;
begin
  inherited;
  if (CrearGrupo) then
    IBQSPEventoInd.ParamByName('ID_GRUPO').Value := IBSPCrearGrupo.ParamByName('idnuevogrupo').AsInteger;
  IBQSPEventoInd.ParamByName('FECHA').AsDate := DateOf(IBDSSimpleFECHA.AsDateTime);
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IBDSSimpleID_ANIMAL.AsInteger;
 if (IBDSSimpleOBSERVACION.AsString <> null) and (IBDSSimpleOBSERVACION.AsString <> '') then
    IBQSPEventoInd.ParamByName('OBSERVACION').Value := IBDSSimpleOBSERVACION.AsString;

  if (IBDSSimpleRESPONSABLE.AsString <> null) and (IBDSSimpleRESPONSABLE.AsString <> '') then
    IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := IBDSSimpleRESPONSABLE.AsInteger;

  IBQSPEventoInd.ParamByName('LOG_USUARIO').AsInteger := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').AsDate :=NOW;

  if (IBDSSimpleID_PC.AsString <> null) and (IBDSSimpleID_PC.AsString <> '') then
    IBQSPEventoInd.ParamByName('PC').AsString   := IBDSSimpleID_PC.AsString;

  if (IBDSSimpleID_HBA.AsString <> null) and (IBDSSimpleID_HBA.AsString <> '') then
    IBQSPEventoInd.ParamByName('HBA').AsString  := IBDSSimpleID_HBA.AsString;

  if (IBDSSimpleID_RA.AsString <> null) and (IBDSSimpleID_RA.AsString <> '') then
  IBQSPEventoInd.ParamByName('RA').AsString   := IBDSSimpleID_RA.AsString;

  if (IBDSSimpleID_OTRO.AsString <> null) and (IBDSSimpleID_OTRO.AsString <> '') then
  IBQSPEventoInd.ParamByName('OTRO').AsString := IBDSSimpleID_OTRO.AsString;

  if (IBDSSimpleNOMBRE.AsString <> null) and (IBDSSimpleNOMBRE.AsString <> '') then
    IBQSPEventoInd.ParamByName('NOMBRE').AsString := IBDSSimpleNOMBRE.AsString;

  if (IBDSSimpleAPODO.AsString <> null) and (IBDSSimpleAPODO.AsString <> '') then
    IBQSPEventoInd.ParamByName('APODO').AsString := IBDSSimpleAPODO.AsString;

  if (IBDSSimpleID_RP.AsString <> null) and (IBDSSimpleID_RP.AsString <> '') then
    IBQSPEventoInd.ParamByName('RP').AsString   := IBDSSimpleID_RP.AsString;
  IBQSPEventoInd.ParamByName('TIPOEVENTO').AsString  := tipoevento;

  if (IBDSSimpleID_IE.AsString <> null) and (IBDSSimpleID_IE.AsString <> '') then
  IBQSPEventoInd.ParamByName('ID_IE').AsString := IBDSSimpleID_IE.AsString;

  if ((IBDSSimpleID_SENASA.AsString <> null) and (IBDSSimpleID_SENASA.AsString <> '')) then
    if (FPrincipal.Pais = 1) then
      IBQSPEventoInd.ParamByName('SEN').AsString  := IBDSSimpleID_SENASA.AsString;
  if ((IBDSSimpleCARAVANA_OFICIAL.AsString <> null) and (IBDSSimpleCARAVANA_OFICIAL.AsString <> '')) then
    if (FPrincipal.Pais <> 1) then
      IBQSPEventoInd.ParamByName('CO').AsString := IBDSSimpleCARAVANA_OFICIAL.AsString;
end;

procedure TFEveIdentificacion.cargarDatos(i:integer);
var
  str : String;
begin
inherited;
  str := getDato('senasa',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('ID_SENASA').AsString := str
  else
    IBDSSimple.FieldByName('ID_SENASA').Value := null;

  IBDSSimple.FieldByName('FECHA').AsString := getDato('fecha',anim[i]);
  if CBAObservador.ListSource.DataSet.Locate('nombre',getDato('Responsable',anim[i]),[]) then
    IBDSSimple.FieldByName('RESP').AsString:=getDato('Responsable',anim[i])
  else
    IBDSSimple.FieldByName('RESP').AsString:='INDEFINIDO';
  IBDSSimple.FieldByName('RESPONSABLE').Value:= CBAObservador.ListSource.DataSet.Lookup('nombre',IBDSSimple.FieldByName('RESP').Value,'ID_EMPLEADO');
  str := getDato('hba',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('ID_HBA').AsString := str
  else
    IBDSSimple.FieldByName('ID_HBA').Value := null;

  str := getDato('otro',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('ID_OTRO').AsString := str
  else
    IBDSSimple.FieldByName('ID_OTRO').Value := null;
  str := getDato('ie',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('ID_IE').AsString := str
  else
    IBDSSimple.FieldByName('ID_IE').Value := null;
	str := getDato('RP Nuevo',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('ID_RP').AsString := str;

  str := getDato('Nombre',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('NOMBRE').AsString := str;

  str := getDato('Apodo',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('APODO').AsString := str;

  str := getDato('Observacion',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('OBSERVACION').AsString := str;

  str := getDato('CO',anim[i]);
  if str <> '' then
    IBDSSimple.FieldByName('CARAVANA_OFICIAL').AsString := str;
end;

procedure TFEveIdentificacion.CargarParametrosRN;
begin
  inherited;
  IBQSPRN.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  if(self.ModoEve = meIndividual)then
  begin
    IBQObtenerSexo.Close;
    IBQObtenerSexo.ParamByName('id').AsInteger := IDAnimal;
    IBQObtenerSexo.ParamByName('esta').AsInteger := Fprincipal.EstablecimientoActual;
    IBQObtenerSexo.Open;

    IBQSPRN.ParamByName('animal').Value :=IDAnimal;
    IBQSPRN.ParamByName('sexo').Value := IBQObtenerSexo.FieldValues['sexo'];
    if(Trim({EAIdRP.Text}IDRp) = '')then   IBQSPRN.ParamByName('RP').Value := Null
      else IBQSPRN.ParamByName('RP').Value := Trim({EAIdRP.Text}IDRp);


    if (RBSenasa.Checked) then
     begin
      if (FPrincipal.Pais = 1) then //Es Argentina
        begin
          if(Trim(EAIdSenasa.Text) = '')then
          begin
            IBQSPRN.ParamByName('SENASA').Value := Null;
            IBQSPRN.ParamByName('CO').Value := Null;
            end
          else
          begin
            IBQSPRN.ParamByName('SENASA').Value := Trim(EAIdSenasa.Text);
            IBQSPRN.ParamByName('CO').Value := Null;
          end;
        end
      else
        begin
          if(Trim(EAIdSenasa.Text) = '')then
          begin
            IBQSPRN.ParamByName('CO').Value := Null;
            IBQSPRN.ParamByName('SENASA').Value := Null;
          end
          else
          begin
            IBQSPRN.ParamByName('CO').Value := Trim(EAIdSenasa.Text);
            IBQSPRN.ParamByName('SENASA').Value := Null;
          end;
        end;
     end
    else
      if (RBCUIGSenasa.Checked) then
        begin
          if(Trim(EAEncabezado.Text + EAUltimoIdent.Text) = '')then
            IBQSPRN.ParamByName('SENASA').Value := Null
           else
             IBQSPRN.ParamByName('SENASA').Value := Trim(EAEncabezado.Text + EAUltimoIdent.Text);
        end
       else
        if (RBReidentificacionSenasa.Checked) then
          begin
            if(Trim(EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text) = '')then
              IBQSPRN.ParamByName('SENASA').Value := Null
             else
               IBQSPRN.ParamByName('SENASA').Value := 'R' + Trim(EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text);
          end;


    if(Trim(EAIdPC.Text) = '')then   IBQSPRN.ParamByName('PC').Value := Null
      else IBQSPRN.ParamByName('PC').Value :=  Trim(EAIdPC.Text);
    if(Trim(EAIdHBA.Text) = '')then  IBQSPRN.ParamByName('HBA').Value := Null
      else IBQSPRN.ParamByName('HBA').Value := Trim(EAIdHBA.Text);
    if(Trim(EAIdRA.Text) = '')then IBQSPRN.ParamByName('RA').Value := Null
      else IBQSPRN.ParamByName('RA').Value :=  Trim(EAIdRA.Text);
    if(Trim(EAOtro.Text) = '')then IBQSPRN.ParamByName('OTRO').Value := Null
      else IBQSPRN.ParamByName('OTRO').Value := Trim(EAOtro.Text);
    if(Trim(EAIdentificacionElectronica.Text) = '')then IBQSPRN.ParamByName('IE').Value := Null
      else IBQSPRN.ParamByName('IE').Value := Trim(EAIdentificacionElectronica.Text);
    IBQSPRN.ParamByName('fecha').AsDateTime := DTPAFecha.DateTime;
  end
  else
  begin
       IBQSPRN.ParamByName('animal').Value :=IBDSSimple.fieldbyname('id_animal').Value;
       IBQSPRN.ParamByName('RP').Value := IBDSSimple.fieldbyname('ID_RP').Value;
       IBQSPRN.ParamByName('SENASA').Value := IBDSSimple.fieldbyname('ID_SENASA').Value;
       IBQSPRN.ParamByName('PC').Value := IBDSSimple.fieldbyname('ID_PC').Value;
       IBQSPRN.ParamByName('HBA').Value := IBDSSimple.fieldbyname('ID_HBA').Value;
       IBQSPRN.ParamByName('RA').Value :=  IBDSSimple.fieldbyname('ID_RA').Value;
       IBQSPRN.ParamByName('OTRO').Value := IBDSSimple.fieldbyname('ID_OTRO').Value;
       IBQSPRN.ParamByName('fecha').AsDateTime := IBDSSimple.fieldbyname('fecha').AsDateTime;
       IBQSPRN.ParamByName('IE').Value := IBDSSimple.fieldbyname('ID_IE').Value;
       IBQSPRN.ParamByName('SEXO').Value := IBDSSimple.FieldValues['I1'];
       IBQSPRN.ParamByName('CO').Value := IBDSSimple.fieldbyname('CARAVANA_OFICIAL').Value;
  end;
end;

procedure TFEveIdentificacion.CargarParametrosSP;
begin
  inherited;
  IBQSPEventoInd.ParamByName('FECHA').AsDate := DTPAFecha.DateTime;
  IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').Value := FPrincipal.EstablecimientoActual;
  IBQSPEventoInd.ParamByName('ANIMAL').Value := IDAnimal;
  IBQSPEventoInd.ParamByName('OBSERVACION').Value := MAObservacion.GetDato;
  IBQSPEventoInd.ParamByName('RESPONSABLE').Value := CBAObservador.GetDato;
  IBQSPEventoInd.ParamByName('LOG_USUARIO').Value := FPrincipal.UsuarioActual;
  IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value :=NOW;
  IBQSPEventoInd.ParamByName('ID_GRUPO').Value := null;
  IBQSPEventoInd.ParamByName('DISPARADOR').Value := Null;
  IBQSPEventoInd.ParamByName('PC').Value  := Trim(EAIdPC.GetDato);
  IBQSPEventoInd.ParamByName('HBA').Value := EAIdHBA.GetDato;
  IBQSPEventoInd.ParamByName('RA').Value  := EAIdRA.GetDato;
  IBQSPEventoInd.ParamByName('OTRO').Value:= EAOtro.GetDato;
  IBQSPEventoInd.ParamByName('NOMBRE').Value := EANombre.GetDato;
  IBQSPEventoInd.ParamByName('APODO').Value := EAApodo.Text;
  IBQSPEventoInd.ParamByName('RP').Value := IDRp;//EAIdRP.GetDato;
  IBQSPEventoInd.ParamByName('TIPOEVENTO').AsString  := tipoevento;
  IBQSPEventoInd.ParamByName('ID_IE').Value:= EAIdentificacionElectronica.GetDato;

  if (RBCUIGSenasa.Checked) then
  begin
    IBQSPEventoInd.ParamByName('SEN').Value := EAEncabezado.Text+EAUltimoIdent.Text;
    ActualizarCUIG(EAEncabezado.Text);
  end
  else
    if (RBSenasa.Checked) then
      if (FPrincipal.Pais = 1) then //Es Argentina
        IBQSPEventoInd.ParamByName('SEN').Value := EAIdSenasa.GetDato
      else
        IBQSPEventoInd.ParamByName('CO').Value := EAPrefijoCO.Text + EAIdSenasa.GetDato
    else
       if (RBReidentificacionSenasa.Checked) then
         IBQSPEventoInd.ParamByName('SEN').Value := 'R' + EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text
       else
        if (RBRPAnimal.Checked) then
          IBQSPEventoInd.ParamByName('RP').Value := 'R' + EAPrefijoMasivo.Text + EARpInicialMasivo.Text + EASufijoMasivo.Text;
end;

procedure TFEveIdentificacion.LoadSQLStringList;
begin
  inherited;
  SQLStringList.AddObject('RESP',TObject(DMSoftvet.DSResponsable));
end;


procedure TFEveIdentificacion.IBDSSimpleRESPSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
    SetText(Sender,Text);
end;

// a esto le agregamos el query en los parametros
{function TFEveIdentificacion.CantidadRepetidos(Campo: string; Valor: string): integer;
begin
  SQLRepetidos := 'select count(*) as cantidad from AUX_EVENTOS ';
  IBQRepetidos.Close;
  IBQRepetidos.SQL.Text := SQLRepetidos;
  IBQRepetidos.SQL.Add('where ( '+Campo+'= '''+valor+''')');
  IBQRepetidos.Open;
  result := IBQRepetidos.FieldValues['cantidad'];
end;}

procedure TFEveIdentificacion.ChequearCampoEnGrilla(Campo: string; Valor: string; ValAnterior:string );
begin
  MAErrors.Clear;

  if (Campo = 'ID_SENASA') and (ValAnterior <> Valor) then
  begin
    senasaValido:= false;
    if ((Ord(Valor[1])<=48) or (Ord(Valor[1])>=57) or (Valor[1]='R')) then
      begin
        if ((Valor[1]='R') and (Length(Valor) = 9) and not(FConMadre)) then
          senasaValido:= UFunctions.CheckFormatoReidentificacion(Valor)
         else
           if ((Length(Valor) = 9) and ((Ord(Valor[2])<=48) or (Ord(Valor[2])>=57))) then
             senasaValido:= UFunctions.CheckFormatoCUIG(Valor)
            else
              senasaValido:= false;
        if not (senasaValido) then
        begin
           MAErrors.Lines.Add(Traducir('El Formato del Senasa no es Válido: ')+ Campo +' = '+Valor);
           MarcarError('E', IBDSSimple);{Si hay repetidos, marco en EW un error y lo captura cuando regenera la grilla en el drawcolumncell}
           MostrarPageControlRepetidos(true);
        end
        else
          MarcarError('', IBDSSimple);{Si no hay repetidos, marco en EW ''}
      end
    else
      if ((Ord(Valor[1])>=48) and (Ord(Valor[1])<=57)) then
        begin
          senasaValido:= UFunctions.CheckSENASAViejo(Valor);
          if not (senasaValido) then
          begin
             MAErrors.Lines.Add(Traducir('El Formato del Senasa no es Válido: ')+ Campo +' = '+Valor);
             MarcarError('E', IBDSSimple);{Si hay repetidos, marco en EW un error y lo captura cuando regenera la grilla en el drawcolumncell}
             MostrarPageControlRepetidos(true);
          end
          else
            MarcarError('', IBDSSimple);{Si no hay repetidos, marco en EW ''}
        end;
  end;

  if(ValAnterior <> Valor)then
  begin
  {CantidadRepetidos = 0 No hay elementos Repetidos, CantidadRepetidos > 0 Hay Repetidos}
    if (CantidadRepetidos(campo,Valor,IBQRepetidos, 'select count(*) as cantidad from AUX_EVENTOS ')>0) then
    begin
         MAErrors.Lines.Add(Traducir('Ya existe el Identificador asignado: ')+ Campo +' = '+Valor);
         MarcarError('E', IBDSSimple);{Si hay repetidos, marco en EW un error y lo captura cuando regenera la grilla en el drawcolumncell}
         MostrarPageControlRepetidos(true);
    end
    else
       MarcarError('', IBDSSimple);{Si no hay repetidos, marco en EW ''}
  end;
end;

procedure TFEveIdentificacion.IBDSSimpleID_RPSetText(Sender: TField;
  const Text: String);
var aux:string;
begin
 if(IBDSSimple.State <> dsInsert)then
 begin
   aux :=UpperCase(text);
   ChequearCampoEnGrilla(sender.FieldName,aux,sender.AsString);
   if (sender.AsString = IBDSSimple.FieldByName('nombre').AsString) then
     IBDSSimple.FieldByName('nombre').AsString := aux;

   if (Sender.FieldName <> 'ID_SENASA') then
     Sender.AsString := aux
    else
      if (senasaValido) then
        if ((Ord(aux[1])>=48) and (Ord(aux[1])<=57)) then
          Sender.AsString:= CompletarDigitosSenasa(aux)
         else
           begin
             Sender.AsString:= aux;
            // showmessage(IntToStr(DigitoVerificadorCaravana(aux)));
           end;
    (*if ((FPrincipal.Pais <> 1) and (Sender.FieldName = 'ID_SENASA')) then
      begin
        Sender.Size := 20;
        Sender.DisplayWidth := 20;
      end;*)
 end;
end;

procedure TFEveIdentificacion.MostrarPageControlRepetidos(value: boolean);
begin
   PError.ActivePage := TSHError;
   PError.ActivePage.Visible := value;
   PError.Visible := value;
end;

(* Setea el parametro de entrada en el campo EW de la Grilla en la fila correspondiente*)
{procedure TFEveIdentificacion.MarcarError(ew:string);
begin
   IBDSSimple.Edit;
   IBDSSimpleEW.Value := ew;
end;}

// pasar metodo a uFunction para generalizar y poderlo usar desde alta masiva
procedure TFEveIdentificacion.VerificarRepetidos;
var i:integer;
    columna:string;
begin
  MAErrors.Clear;
  for i := 2 to BDBGSimple.Columns.Count-4 do
    begin
      columna := BDBGSimple.Columns[i].FieldName;
      BuscarRepetidosEnColumna(Columna,DSSimple, BDBGSimple, IBQRepetidos, MAErrors, DSSimple, 'select count(*) as cantidad from AUX_EVENTOS ');
    end;
end;

procedure TFEveIdentificacion.ATerminarExecute(Sender: TObject);
begin
  if (FPrincipal.Pais = 1) then
    begin
      if ((EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____')) then
        if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
          if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
            begin
              VerificarRepetidos;
              if(MAErrors.Lines.Text <> '')then
                  MostrarPageControlRepetidos(true)
              else
              begin
                inherited;
                IBQDeleteAuxEventos.close;
                IBQDeleteAuxEventos.Open;
                if ((ModoEve = meMAsivo) and (RBCUIGSenasa.Checked)) then
                begin
                  IBQActCUIG.Close;
                  IBQActCUIG.ParamByName('cuig').AsInteger := DMSoftvet.IBQCUIGActual.FieldValues['id_cuig'];
                  IBQActCUIG.ParamByName('UI').AsString := UltimoCUIG;
                  IBQActCUIG.Open;
                  FPrincipal.IBTPrincipal.CommitRetaining;
                end;
              end;
            end
           else
            begin
              MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante.');
              EAUltimoIdent.SetFocus;
            end
        else
          begin
            MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante');
            EAEncabezado.SetFocus;
          end
      else
        if ((EAEncabezado.EditText = '_____') and (EAUltimoIdent.EditText = '____')) then
          begin
            inherited;
            IBQDeleteAuxEventos.close;
            IBQDeleteAuxEventos.Open;
          end
         else
          if (EAEncabezado.EditText = '_____') then
            begin
              MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante');
              EAUltimoIdent.SetFocus;
            end
           else
              begin
                MostrarMensaje(tmError, 'Identificador CUIG-SENASA Incompleto. Ingréselo nuevamente o ingréselo más adelante.');
                EAEncabezado.SetFocus;
              end
    end
   else
      begin
        inherited;
        IBQDeleteAuxEventos.close;
        IBQDeleteAuxEventos.Open;
      end;
end;

procedure TFEveIdentificacion.IBDSSimpleFECHASetText(Sender: TField;
  const Text: String);
begin
  inherited;
  if(IBDSSimple.State <> dsInsert)then
  begin
    SetText(Sender,text);
    if ((IBDSSimple.FieldValues['EW'] = 'E') or (IBDSSimple.FieldValues['EW'] = 'W')) then
            IBDSSimple.FieldValues['EW'] := 'M';
  end;
end;

procedure TFEveIdentificacion.SetConMadre(const Value: boolean);
begin
  FConMadre := Value;
end;

procedure TFEveIdentificacion.reparteRP(rp : String);
var prefijo : boolean;
    i : integer;
begin
   prefijo := true;
   for i:= 1 to Length(rp) do
      if (rp[i] in ['A'..'Z']) and prefijo then
          EAPrefijo.Text := EAPrefijo.Text + rp[i]
      else
          if (rp[i] in ['0'..'9']) then
          begin
              EARpInicial.Text := EARpInicial.Text + rp[i];
              prefijo := false;
          end
          else
              EASufijo.Text := EASufijo.Text + rp[i];
end;

procedure TFEveIdentificacion.cargarDatosAnimal;
var idSen, primerChar : String;
  iValue, iCode, i : Integer;
  valorCO : String;
  encontrado : boolean;
  key : String;
begin
    IBQDatosAnimal.close;
    IBQDatosAnimal.ParamByName('animal').Value := IDAnimal;
    IBQDatosAnimal.Open;
    reparteRP(IBQDatosAnimal.FieldValues['id_rp']);
    if ((IBQDatosAnimal.FieldValues['nombre'] <> null) and (IBQDatosAnimal.FieldValues['nombre'] <> '')) then
      EANombre.Text := IBQDatosAnimal.FieldValues['nombre'];
    if ((IBQDatosAnimal.FieldValues['apodo'] <> null) and (IBQDatosAnimal.FieldValues['apodo'] <> '')) then
      EAApodo.Text := IBQDatosAnimal.FieldValues['apodo'];
    if ((IBQDatosAnimal.FieldValues['id_hba'] <> null) and (IBQDatosAnimal.FieldValues['id_hba'] <> '')) then
      EAIdHBA.Text := IBQDatosAnimal.FieldValues['id_hba'];
    if ((IBQDatosAnimal.FieldValues['id_pc']<> null) and (IBQDatosAnimal.FieldValues['id_pc']<> '')) then
      EAIdPC.Text := IBQDatosAnimal.FieldValues['id_pc'];
    if ((IBQDatosAnimal.FieldValues['id_ra'] <> null) and (IBQDatosAnimal.FieldValues['id_ra'] <> '')) then
      EAIdRA.Text := IBQDatosAnimal.FieldValues['id_ra'];
    if ((IBQDatosAnimal.FieldValues['id_ie'] <> null) and (IBQDatosAnimal.FieldValues['id_ie'] <> '')) then
      EAIdentificacionElectronica.Text := IBQDatosAnimal.FieldValues['id_ie'];
    if ((IBQDatosAnimal.FieldValues['id_otro'] <> null) and (IBQDatosAnimal.FieldValues['id_otro'] <> '')) then
      EAOtro.Text := IBQDatosAnimal.FieldValues['id_otro'];
    if ((IBQDatosAnimal.FieldValues['id_senasa'] <> null) and (IBQDatosAnimal.FieldValues['id_senasa'] <> '')) then
    begin
      idSen := IBQDatosAnimal.FieldValues['id_senasa'];
      if (IBQDatosAnimal.FieldValues['id_rp'] = idSen) then
        RpSenasa := true
      else
        RpSenasa := false;
      val(idSen, iValue, iCode);
      //SI SON DÍGITOS, ES SENASA.
      if (iCode = 0) then
      begin
        EAIdSenasa.Text := IBQDatosAnimal.FieldValues['id_senasa'];
        RBSenasa.Checked := true;
        RBCUIGSenasa.Checked := false;
        RBReidentificacionSenasa.Checked := false;
        RBRPAnimal.Checked := false;
        RBSenasaClick(self);
      end
      else
      begin
        //SI TIENE EL FORMATO 'R'+8 DÍGITOS, ES REIDENTIFICACIÓN.
        primerChar := Copy(idSen, 1, 1);
        if (primerChar = 'R') then
        begin
          EAEncabezadoReidentificacion.Text := Copy(idSen, 2, 4);
          EAUltimoIdentReidentificacion.Text := Copy(idSen, 6, 4);
          EAEncabezadoReidentificacionExit(self);
          RBSenasa.Checked := false;
          RBCUIGSenasa.Checked := false;
          RBReidentificacionSenasa.Checked := true;
          RBRPAnimal.Checked := false;
          RBReidentificacionSenasaClick(self);
        end
        //SINO, ES CUIG-SENASA.
        else
        begin
          EAEncabezado.Text := Copy(idSen, 1, 5);
          EAUltimoIdent.Text := Copy(idSen, 6, 4);
          RBSenasa.Checked := false;
          RBCUIGSenasa.Checked := true;
          RBReidentificacionSenasa.Checked := false;
          RBRPAnimal.Checked := false;
          EAUltimoIdentExit(self);
          RBCUIGSenasaClick(self);
        end;
      end;
    end
    else
      if (FPrincipal.Pais = 1) then //Argentina
        RBCUIGSenasaClick(self)
      else
        //SI TIENE CARAVANA OFICIAL.
        if (IBQDatosAnimal.FieldValues['caravana_oficial'] <> '') then
           begin
            valorCO := IBQDatosAnimal.FieldValues['caravana_oficial'];
            i := 0;
            encontrado := false;
            while not encontrado do
              begin
                i := i + 1;
                //key := Copy(valorCO, i, 1);
                if (valorCO[i] in (['0'..'9'])) then
                  encontrado := true;
              end;
            if (i = Length(valorCO)) then
              begin
                EAPrefijoCO.Text := valorCO;
                EAIdSenasa.Text := '';
              end
            else if (i = 1) then
                    begin
                      EAPrefijoCO.Text := '';
                      EAIdSenasa.Text := valorCO;
                    end
                 else
                    begin
                      EAPrefijoCO.Text := Copy(valorCO, 1, i-1);
                      EAIdSenasa.Text := Copy(valorCO, i, Length(valorCO)-i+1);
                    end;
           end;
end;

procedure TFEveIdentificacion.FormShow(Sender: TObject);
begin
  inherited;
  DTPAFecha.Date := Now;
//  DTPAFecha.MaxDate:= now;
  MSimple.BDBGDisponibles.ColumnByField('V1').Visible:= FConMadre;
  MSimple.BDBGSeleccionados.ColumnByField('V1').Visible:= FConMadre;
  if (FPrincipal.Pais <> 1) then
    begin
      MSimple.BDBGSeleccionados.ColumnByField('ID_SENASA').Visible := false;
      MSimple.BDBGSeleccionados.ColumnByField('CARAVANA_OFICIAL').Visible := true;
      MSimple.BDBGDisponibles.ColumnByField('ID_SENASA').Visible := false;
      MSimple.BDBGDisponibles.ColumnByField('CARAVANA_OFICIAL').Visible := true;
      BDBGSimple.ColumnByField('ID_SENASA').Visible := false;
      BDBGSimple.ColumnByField('CARAVANA_OFICIAL').Visible := true;
    end;




  MSimple.PasarParametros(0,0);{Para filtrar las categorias para el Combo de la Manga}//cambie codigo
  CBAObservador.AsignarValorDefecto;
  //DBLCBACUIGPropio.Visible := CBCUIGPropio.Checked;
  ComponentesVisiblesPorPais(FPrincipal.Pais);
  MAErrors.Lines.Clear;
  senasaValido:= true;
  if IDAnimal <> 0 then
     cargarDatosAnimal;

  SeleccionaBotonCUIGSenasa;
end;

procedure TFEveIdentificacion.PCBasicoChange(Sender: TObject);
begin
  if (FPrincipal.Pais <> 1) then
    begin
      BDBGSimple.Columns[3].FieldName := 'CARAVANA_OFICIAL';
      BDBGSimple.Columns[3].Title.Caption := 'Caravana Oficial';
    end;

  if(((RBCUIGSenasa.Checked)and(EAIdSenasa.Text<>'')) and (not controlarCuig(EAUltimoIdent.Text)) or (((RBCUIGSenasa.Checked)and(EAIdSenasa.Text<>'')) and((StrToInt(EAIdSenasa.Text) + MSimple.IBQSeleccionados.RecordCount-1) > 999999999)))then
      begin
      PCBasico.ActivePageIndex := 1;
      MostrarMensaje(tmAdvertencia, 'Los identificadores superan el límite permitido');
      end;
  inherited;
  if(ModoEve = meMasivo)then
    begin
     //GBDatos.Visible := false;//es Reidentificacion Masiva
     GBPrincipal.Visible := false;
     if (FPrincipal.Pais <> 1) then //No es Argentina
      begin
        RBRPAnimal.Visible := False;
        CBCUIGPropio.Visible:= False;
        LCUIGPropio.Visible := False;
        DBLCBACUIGPropio.Visible:= False;
        EAIdSenasa.Visible := True;
      end;
     RBRPAnimal.Visible := true;
     EAPrefijoMasivo.Visible := false;
     EARpInicialMasivo.Visible := false;
     EASufijoMasivo.Visible := false;
     Lr.Visible := false;
     EAEncabezadoReidentificacion.Visible := false;
     EAUltimoIdentReidentificacion.Visible := false;
     EVerificadorReidentificacion.Visible := false;

     LRA.Visible := false;
     EAIdRA.Visible := false;
     LHBA.Visible := false;
     EAIdHBA.Visible := false;
     LOtro.Visible := false;
     EAOtro.Visible := false;
     LPC.Visible := false;
     EAIdPC.Visible := false;
     LIdentificacionElectronica.Visible := false;
     EAIdentificacionElectronica.Visible := false;
     //EAIdRP.EsRequerido:= false;
     EARpInicial.EsRequerido := false;
     if(PCBasico.ActivePage = TSDatos)then
      begin
       { IBQDeleteAuxEventos.Close;
        IBQDeleteAuxEventos.Open;
        FPrincipal.IBTPrincipal.CommitRetaining;
        IBDSSimple.Close;
        IBDSSimple.Open;
        FPrincipal.IBTPrincipal.CommitRetaining; }
        EAIdSenasaExit(nil);
        UltimoCUIG := EAUltimoIdent.Text;
      end;
    end
  else
   begin
    //EAIdRP.EsRequerido:= true;
    EARpInicial.EsRequerido := true;
    RBRPAnimal.Visible := false;
    EAPrefijoMasivo.Visible := false;
    EARpInicialMasivo.Visible := false;
    EASufijoMasivo.Visible := false;
    if(PCBasico.ActivePage = TSDatos)then
    begin
      GBPrincipal.Visible := true;
      GBDatos.Visible := true;
      LRA.Visible := true;
      EAIdRA.Visible := true;
      LHBA.Visible := true;
      EAIdHBA.Visible := true;
      LOtro.Visible := true;
      EAOtro.Visible := true;
      LPC.Visible := true;
      EAIdPC.Visible := true;
      LIdentificacionElectronica.Visible := true;
      EAIdentificacionElectronica.Visible := true;
      CargarDatosActuales;
     { EAIdRP.SetFocus;
      EAIdRP.SelectAll;}
      //EARpInicial.SetFocus;
      EARpInicial.SelectAll;
    end;
   end;
 //  UltimoCUIG := EAUltimoIdent.Text;
end;

procedure TFEveIdentificacion.CargarDatosActuales;
begin
    //EAIdRP.Text     := NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_RP']);
    EARpInicial.Text := NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_RP']);
    //EAIdSenasa.Text := NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_SENASA']);
    CargarSenasa(NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_SENASA']));
    EAIdRA.Text     := NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_RA']);
    EAIdPC.Text     := NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_PC']);
    EAIdHBA.Text    := NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_HBA']);
    EAOtro.Text     := NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_OTRO']);
    EAIdentificacionElectronica.Text     := NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_ie']);
    EANombre.Text   := NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['NOMBRE']);
    EAApodo.Text    := NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['APODO']);
    IDAnimal        := StrToInt(NullAVacio(MSimple.BDBGSeleccionados.DataSource.DataSet.FieldValues['ID_ANIMAL']));
end;



function TFEveIdentificacion.NullAVacio(campo: Variant): string;
var i:integer;
begin
  if(campo = Null)then
    if(TryStrToInt(VarToStr(campo),i))then
      campo := 0
    else campo := '';
  Result := campo;


end;

procedure TFEveIdentificacion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  IBQDeleteAuxEventos.close;
  IBQDeleteAuxEventos.Open;

end;

procedure TFEveIdentificacion.ACancelarExecute(Sender: TObject);
begin
  inherited;
    IBQDeleteAuxEventos.close;
    IBQDeleteAuxEventos.Open;
end;

procedure TFEveIdentificacion.EAIdSenasaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Length(trim(EAIdSenasa.Text)) <> 0) and (Length(trim({EAIdRP.Text}IDRp)) = 0)) then
    {EAIdRP.Text} EARpInicial.Text := EAIdSenasa.GetDato;
end;

procedure TFEveIdentificacion.EAIdSenasaExit(Sender: TObject);
begin
  inherited;
  if (ModoEve = meMasivo) then
  begin
    if ((EAIdSenasa.Text <> '') and (FPrincipal.Pais = 1)) then
      Senasa := StrToInt(EAIdSenasa.Text)
    else
      COficial := EAPrefijoCO.Text + EAIdSenasa.Text;
  end
  else
  begin
    if ((Length(trim(EAIdSenasa.Text)) <> 0) and (FPrincipal.Pais = 1)) then
        EAIdSenasa.Text:= CompletarDigitosSenasa(EAIdSenasa.Text)
    else
      COficial := trim(EAPrefijoCO.Text) + EAIdSenasa.Text;
    //EAIdRP.Text:= CompletarDigitosSenasa(EAIdRP.Text);
  end;

end;

procedure TFEveIdentificacion.EAIdSenasaKeyPress(Sender: TObject;
  var Key: Char);
begin
 { inherited;
  if (ModoEve = meIndividual) then
  begin
    if (EAIdHBA.Enabled) then
      begin
         EAIdHBA.SetFocus;
         EAIdHBA.SelectAll;
         key:= #0;
      end;
  end;     }

  //Si es SENASA.
  if (not (key in (['0'..'9']))  and (key <> #8)) then
    key:=#0;
end;

procedure TFEveIdentificacion.RBSenasaClick(Sender: TObject);
begin
  inherited;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EVerificador.Visible := false;
  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;
  DBLCBACUIGPropio.Visible := false;
  if (FPrincipal.Pais = 1) then //Argentina
    begin
      EAIdSenasa.MaxLength := 9;
      EAIdSenasa.Visible := true;
      EAIdSenasa.Left := 210;
      EAIdSenasa.Width := 130;
    end
  else
    begin
      EAIdSenasa.MaxLength := 7;
      EAIdSenasa.Left := 300;
      EAIdSenasa.Width := 90;
      EAPrefijoCO.Visible := true;
    end;
    
  //EAIdSenasa.SetFocus;
  //EAIdSenasa.SelectAll;
  Lr.Visible:= false;
  EAEncabezadoReidentificacion.Visible:= false;
  EAUltimoIdentReidentificacion.Visible:= false;
  EVerificadorReidentificacion.Visible:= false;
  EAPrefijoMasivo.Visible := false;
  EARpInicialMasivo.Visible := false;
  EASufijoMasivo.Visible := false;
end;

procedure TFEveIdentificacion.SeleccionaBotonCUIGSenasa;
begin
  EAEncabezado.Visible := true;
  EAUltimoIdent.Visible := true;
  EVerificador.Visible := true;
  CBCUIGPropio.Visible := true;
  LCUIGPropio.Visible := true;
  if(CBCUIGPropio.Checked) then
    DBLCBACUIGPropio.Visible := true;
  EAIdSenasa.Visible := false;
  EAPrefijoCO.Visible := false;

  Lr.Visible:= false;
  EAEncabezadoReidentificacion.Visible:= false;
  EAUltimoIdentReidentificacion.Visible:= false;
  EVerificadorReidentificacion.Visible:= false;
  EAPrefijoMasivo.Visible := false;
  EARpInicialMasivo.Visible := false;
  EASufijoMasivo.Visible := false;
end;

procedure TFEveIdentificacion.RBCUIGSenasaClick(Sender: TObject);
begin
  inherited;
  SeleccionaBotonCUIGSenasa;
end;

procedure TFEveIdentificacion.DBLCBACUIGPropioCloseUp(Sender: TObject);
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
    EVerificador.Text := IntToStr(UFunctions.DigitoVerificadorCaravana(EAEncabezado.Text+EAUltimoIdent.Text));
    EAUltimoIdentExit(Sender);
  end;
end;

procedure TFEveIdentificacion.CBCUIGPropioClick(Sender: TObject);
begin
  inherited;
  if (CBCUIGPropio.Checked) then
  begin
    DBLCBACUIGPropio.Visible := true;
    EAEncabezado.ReadOnly := true;
  end
  else
  begin
    EAEncabezado.ReadOnly := false;
    DBLCBACUIGPropio.Visible := false;
    EAEncabezado.Text := '';
    EAUltimoIdent.Text := '';
  end;
end;

procedure TFEveIdentificacion.CargarSenasa(ID_SENASA : String);
var
  primerLetra, segundaLetra : Char;
begin
  if ((ModoEve = meIndividual) and (ID_SENASA<>'')) then
  begin
    primerLetra := ID_SENASA[1];
    if ((Ord(primerLetra)>=48) and (Ord(primerLetra)<=57))then  //Valores del 0..9 en codigo ASCII
    begin
      RBSenasa.Checked := true;
      EAIdSenasa.Text := ID_SENASA;
    end
    else
    begin
      segundaLetra := ID_SENASA[2];
      if (Ord(segundaLetra)>=48) and (Ord(segundaLetra)<=57) then
        begin
          RBReidentificacionSenasa.Checked := true;
          EAEncabezadoReidentificacion.Text := Copy(ID_SENASA,2,4);
          EAUltimoIdentReidentificacion.Text := Copy(ID_SENASA,6,4);
          if (EAEncabezadoReidentificacion.EditText <> '_____') and (EAUltimoIdentReidentificacion.EditText <> '____') then
            if (CheckFormatoReidentificacionEncabezado('R'+EAEncabezadoReidentificacion.Text)) then
              if (CheckFormatoReidentificacionUltimoIdent(EAUltimoIdentReidentificacion.Text)) then
                EVerificadorReidentificacion.Text := IntToStr(UFunctions.DigitoVerificadorCaravana('00'+ID_SENASA));
        end
       else
         begin
            RBCUIGSenasa.Checked := true;
            EAEncabezado.Text := Copy(ID_SENASA,1,5);
            EAUltimoIdent.Text := Copy(ID_SENASA,6,4);
            if (EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____') then
              if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
                if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
                  EVerificador.Text := IntToStr(UFunctions.DigitoVerificadorCaravana(ID_SENASA));
         end;
    end;
  end;
end;

procedure TFEveIdentificacion.ActualizarCUIG(CUIG : String);
var
  nuevo_identificador, ultimo : String;
begin
  //Solamente Incremento el Identificador si el CUIG es el de este establecimiento
  if (CBCUIGPropio.Checked and (DBLCBACUIGPropio.Text <> '')) then
  begin
    IBQBuscarCUIG.Close;
    IBQBuscarCUIG.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQBuscarCUIG.ParamByName('id').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQBuscarCUIG.Open;
    ultimo := IBQBuscarCUIG.fieldByName('ultimo_identificador').AsString;
    nuevo_identificador := UFunctions.IncrementarIdentificadorCUIG(ultimo);
    IBQActCUIG.Close;
    IBQActCUIG.ParamByName('cuig').AsInteger := DBLCBACUIGPropio.GetDato;
    IBQActCUIG.ParamByName('UI').AsString := nuevo_identificador;
    IBQActCUIG.Open;
  end;
end;

procedure TFEveIdentificacion.EAUltimoIdentExit(Sender: TObject);
begin
  inherited;
  UltimoCUIG := EAUltimoIdent.Text;

      if (EAEncabezado.EditText <> '_____') and (EAUltimoIdent.EditText <> '____') then
          if ((Length(EAEncabezado.Text) = EAEncabezado.MaxLength) and (Length(EAUltimoIdent.Text) = EAUltimoIdent.MaxLength)) then
            if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
              if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text)) then
                begin
                  EVerificador.Text := IntToStr(UFunctions.DigitoVerificadorCaravana(EAEncabezado.Text+EAUltimoIdent.Text));
                  //EAIdRP.Text := EAEncabezado.Text+EAUltimoIdent.Text;
                  if (RpSenasa) then
                  begin
                    EARpInicial.Text := EAEncabezado.Text+EAUltimoIdent.Text;
                    EAPrefijo.Text := '';
                    EASufijo.Text := '';
                  end;
                end
              else
                begin
                  MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
                  EAUltimoIdent.SetFocus;
                end
            else
              begin
                MostrarMensaje(tmError, 'Identificador Incompleto. Ingréselo nuevamente.');
                EAEncabezado.SetFocus;
              end;
end;

procedure TFEveIdentificacion.MSimpleBDBGDisponiblesDblClick(
  Sender: TObject);
var
  F : TFREPFichaAnimal;
  indexColumnaSelecc, indexColumnaRpMadre : integer;
begin
  if (FConMadre) then
  begin
    MSimple.BDBGDisponibles.Options := [dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
    indexColumnaSelecc := MSimple.BDBGDisponibles.SelectedIndex;
    indexColumnaRpMadre := MSimple.BDBGDisponibles.ColumnByField('V1').Index;
    if (indexColumnaSelecc = indexColumnaRpMadre) then
      begin
        if not(MSimple.IBQDisponibles.eof) and MSimple.IBQDisponibles.fieldByName('ID_MBI').Value <> null then
        begin
          F := TFREPFichaAnimal.Create(self);
          F.animal := MSimple.IBQDisponibles.fieldByName('ID_MBI').AsInteger;
          F.ShowModal;
          F.Destroy;
        end;
        inherited RefrescarMangaDisp();
      end
    else
      inherited;
  end
  else
  begin
    MSimple.BDBGDisponibles.Options := [dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
    inherited;
  end;
end;

procedure TFEveIdentificacion.EAIdRPKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EANombre.Enabled) then
      begin
         EANombre.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveIdentificacion.EANombreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAApodo.Enabled) then
      begin
         EAApodo.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveIdentificacion.EAApodoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   if (RBSenasa.Checked) then
     begin
      if (EAIdSenasa.Enabled) then
        begin
           EAIdSenasa.SetFocus;
           EAIdSenasa.SelectAll;
           key:= #0;
        end;
     end
    else
      if (EAEncabezado.Enabled) then
        begin
           EAEncabezado.SetFocus;
           EAEncabezado.SelectAll;           
           key:= #0;
        end;
end;

procedure TFEveIdentificacion.EAIdHBAKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAIdPC.Enabled) then
      begin
         EAIdPC.SetFocus;
         EAIdPC.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveIdentificacion.EAIdPCKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAIdRA.Enabled) then
      begin
         EAIdRA.SetFocus;
         EAIdRA.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveIdentificacion.EAIdRAKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAOtro.Enabled) then
      begin
         EAOtro.SetFocus;
         EAOtro.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveIdentificacion.EAOtroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (DTPAFecha.Enabled) then
      begin
         DTPAFecha.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveIdentificacion.DTPAFechaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then  
    if (CBAObservador.Enabled) then
      begin
         CBAObservador.SetFocus;
         key:= #0;
      end;
end;

procedure TFEveIdentificacion.EAEncabezadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (EAUltimoIdent.Enabled) then
      begin
         EAUltimoIdent.SetFocus;
         EAUltimoIdent.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveIdentificacion.EAUltimoIdentKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
   begin
    if (EVerificador.Enabled) then
      begin
         EVerificador.SetFocus;
         EVerificador.SelectAll;
         key:= #0;
      end;
   end;{
  else
    if (CheckFormatoCUIGEncabezado(EAEncabezado.Text)) then
      if (CheckFormatoCUIGUltimoIdent(EAUltimoIdent.Text+Key)) then
       begin
         EVerificador.SetFocus;
         EVerificador.SelectAll;
         key:= #0;
      end;  }
end;

procedure TFEveIdentificacion.EVerificadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (ModoEve = meIndividual) then
    if (Key = #13) then
      if (EAIdHBA.Enabled) then
        begin
           EAIdHBA.SetFocus;
           EAIdHBA.SelectAll;
           key:= #0;
        end;
end;

procedure TFEveIdentificacion.CBAObservadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
    if (MAObservacion.Enabled) then
      begin
         MAObservacion.SetFocus;
         MAObservacion.SelectAll;
         key:= #0;
      end;
end;

procedure TFEveIdentificacion.AAnteriorExecute(Sender: TObject);
begin
  inherited;
  {IBQDeleteAuxEventos.Close;
  IBQDeleteAuxEventos.Open;
  FPrincipal.IBTPrincipal.CommitRetaining;
//  IBDSSimple.Refresh;
  IBDSSimple.Close;
  IBDSSimple.Open;
  FPrincipal.IBTPrincipal.CommitRetaining; }
  EAIdSenasaExit(nil);
  UltimoCUIG := EAUltimoIdent.Text;
end;

procedure TFEveIdentificacion.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;

end;

procedure TFEveIdentificacion.EAIdSenasaChange(Sender: TObject);
begin
  inherited;
  //if (not (key in (['0'..'9']))  and (key <> #8)) then
   // key:=#0;
end;

procedure TFEveIdentificacion.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  RBSenasa.Caption:= FPrincipal.PaisNombreCaravana;
  LHBA.Caption:= FPrincipal.PaisHerdBook+':';
  if (FPrincipal.Pais = 1) then //Argentina
   begin
    EAIdSenasa.MaxLength := 9;
    EAIdSenasa.Visible := False;
    EAIdSenasa.Left := 210;
    EAIdSenasa.Width := 130;
    EAPrefijoCO.Visible := false;
    RBSenasa.Checked := False;
    RBRPAnimal.Visible := false;
    {
    RBCUIGSenasa.Checked := True;
    RBCUIGSenasa.Visible:= True;
    EAEncabezado.Visible:= True;
    EAUltimoIdent.Visible:= True;
    CBCUIGPropio.Visible:= True;
    LCUIGPropio.Visible := True;
    EVerificador.Visible:= True;
    }
    if CBCUIGPropio.Checked then
      DBLCBACUIGPropio.Visible:= True
    else
      DBLCBACUIGPropio.Visible:= False;

    if(FConMadre)then
      RBReidentificacionSenasa.Visible:= false
     else
       RBReidentificacionSenasa.Visible:= true;
   end

  else
    begin
      EAIdSenasa.MaxLength := 7;
      EAIdSenasa.Left := 300;
      EAIdSenasa.Width := 90;
      EAPrefijoCO.Visible := true;
      RBCUIGSenasa.Checked := False;
      RBRPAnimal.Visible := False;
      EAPrefijoMasivo.Visible := false;
      EARpInicialMasivo.Visible := false;
      EASufijoMasivo.Visible := false;
      EAEncabezadoReidentificacion.Visible := false;
      EAUltimoIdentReidentificacion.Visible := false;
      EVerificadorReidentificacion.Visible := false;
      EAEncabezado.Visible := False;
      EAUltimoIdent.Visible := False;
      EVerificador.Visible := False;
      RBCUIGSenasa.Visible:= False;
      EAEncabezado.Visible:= False;
      EAUltimoIdent.Visible:= False;
      CBCUIGPropio.Visible:= false;
      LCUIGPropio.Visible := false;
      DBLCBACUIGPropio.Visible := false;
      EVerificador.Visible:= False;
      RBReidentificacionSenasa.Visible:= False;
      EAIdSenasa.Visible := True;
      RBSenasa.Checked := True;
    end;
end;

procedure TFEveIdentificacion.LResponsableClick(Sender: TObject);
begin
  inherited;
  cambiarCB(CBAObservador,nroID);
end;

procedure TFEveIdentificacion.LObservadorMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= $00606C02;
      LObservador.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveIdentificacion.LObservadorMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LObservador.Font.Color:= clWindowText;
      LObservador.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveIdentificacion.LCUIGPropioClick(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      FPrincipal.AbrirFormNormal(TFABMModificarCUIG.Create(Self));
      DMSoftvet.IBQCUIGActual.Close;
      DMSoftvet.IBQCUIGActual.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQCUIGActual.Open;
    end;
end;

procedure TFEveIdentificacion.LCUIGPropioMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCUIGPropio.Font.Color:= $00606C02;
      LCUIGPropio.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveIdentificacion.LCUIGPropioMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCUIGPropio.Font.Color:= clWindowText;
      LCUIGPropio.Font.Style:= [fsUnderline];
    end;  
end;

procedure TFEveIdentificacion.ASacarAnimalExecute(Sender: TObject);
begin
  inherited;
  if(MSimple.IBQSeleccionados.RecordCount = 1) then
  begin
    PCBasico.ActivePage := TSManga;
    ControlEventoOnExit(nil);
    ATerminar.Enabled := false;
  end;
end;

procedure TFEveIdentificacion.ASiguienteExecute(Sender: TObject);
begin
  if(((RBCUIGSenasa.Checked)and(EAIdSenasa.Text<>'')) and (not controlarCuig(EAUltimoIdent.Text)) or (((RBCUIGSenasa.Checked)and(EAIdSenasa.Text<>'')) and((StrToInt(EAIdSenasa.Text) + MSimple.IBQSeleccionados.RecordCount-1) > 999999999)))then
  begin
    PCBasico.ActivePageIndex := 1;
    MostrarMensaje(tmAdvertencia, 'Los identificadores superan el límite permitido');
  end
  else inherited;
end;

function TFEveIdentificacion.controlarCuig(IdentCUIG : String):Boolean;
var
  numero:String;
  num : Integer;
  letra : Char;
begin
    Result:=true;
    if IdentCUIG <> '' then
    begin
      letra := IdentCUIG[1];
      numero := IdentCUIG[2]+IdentCUIG[3]+IdentCUIG[4];
      num := StrToInt(numero);

      if (letra = 'Z') and (num + MSimple.IBQSeleccionados.RecordCount-1 > 999  ) then
        Result:=false;
    end;
end;

{procedure TFEveIdentificacion.completarCampos;
begin
    DMSoftvet.IBQDatosAnimal.Close;
    DMSoftvet.IBQDatosAnimal.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQDatosAnimal.Open;
    IDAnimal:= DMSoftVet.IBQDatosAnimal.Lookup('ID_RP',IBDSSimple.FieldByName('ID_RP').Value,'ID_ANIMAL');
    if (tipoevento = 'I') then
      IBDSSimple.FieldByName('V2').Value := DMSoftVet.IBQDatosAnimal.Lookup('ID_RP',IBDSSimple.FieldByName('ID_RP').Value,'MADRE_BIOLOGICA_EXTERNA');
    IBDSSimple.FieldByName('RESPONSABLE').Value  := CBAObservador.GetDato;
    IBDSSimple.FieldByName('ID_ANIMAL').Value    := IDAnimal;
    IBDSSimple.Post;
end;}

procedure TFEveIdentificacion.RBReidentificacionSenasaClick(
  Sender: TObject);
begin
  inherited;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EVerificador.Visible := false;
  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;
  DBLCBACUIGPropio.Visible := false;
  EAIdSenasa.Visible := false;
  EAPrefijoCO.Visible := false;
  
  Lr.Visible:= true;
  EAEncabezadoReidentificacion.Visible:= true;
  EAUltimoIdentReidentificacion.Visible:= true;
  EVerificadorReidentificacion.Visible:= true;

  Lr.Top:= EAEncabezado.Top + 3;
  EAEncabezadoReidentificacion.Top:= EAEncabezado.Top;
  EAUltimoIdentReidentificacion.Top:= EAUltimoIdent.Top;
  EVerificadorReidentificacion.Top:= EVerificador.Top;
  EAPrefijoMasivo.Visible := false;
  EARpInicialMasivo.Visible := false;
  EASufijoMasivo.Visible := false;
end;

procedure TFEveIdentificacion.EAEncabezadoReidentificacionExit(
  Sender: TObject);
begin
  inherited;
  UltimoReidentificacion := EAUltimoIdentReidentificacion.Text;
      if (EAEncabezadoReidentificacion.EditText <> '_____') and (EAUltimoIdentReidentificacion.EditText <> '____') then
          if ((Length(EAEncabezadoReidentificacion.Text) = EAEncabezadoReidentificacion.MaxLength) and (Length(EAUltimoIdentReidentificacion.Text) = EAUltimoIdentReidentificacion.MaxLength)) then
            if (CheckFormatoReidentificacionEncabezado('R'+EAEncabezadoReidentificacion.Text)) then
              if (CheckFormatoReidentificacionUltimoIdent(EAUltimoIdentReidentificacion.Text)) then
                begin
                  EVerificadorReidentificacion.Text := IntToStr(UFunctions.DigitoVerificadorCaravana('00R' + EAEncabezadoReidentificacion.Text + EAUltimoIdentReidentificacion.Text));
                  //EAIdRP.Text := 'R' + EAEncabezadoReidentificacion.Text+EAUltimoIdentReidentificacion.Text;
                  if (RpSenasa) then
                    begin
                      EARpInicial.Text := 'R' + EAEncabezadoReidentificacion.Text+EAUltimoIdentReidentificacion.Text;
                      EAPrefijo.Text := '';
                      EASufijo.Text := '';
                    end;
                end
              else
                begin
                  MostrarMensaje(tmError, 'ReIdentificador Incompleto. Ingréselo nuevamente.');
                  EAUltimoIdentReidentificacion.SetFocus;
                end
            else
              begin
                MostrarMensaje(tmError, 'ReIdentificador Incompleto. Ingréselo nuevamente.');
                EAEncabezadoReidentificacion.SetFocus;
              end;
end;

procedure TFEveIdentificacion.EARPOnChange(Sender : TObject);
begin
  inherited;
  IDRp := Trim(EAPrefijo.Text+EARPInicial.Text+EASufijo.Text);
end;

procedure TFEveIdentificacion.EARPOnExit(Sender : TObject);
begin
  inherited;
  if Length(IDRP) > 10 then
  begin
    MostrarMensaje(tmError,'El Identificador RP no puede tener mas de 10 caracteres');
    EAPrefijo.Text := '';
    EASufijo.Text := '';
  end;
end;

procedure TFEveIdentificacion.EARpInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not (key in (['0'..'9']))  and (key <> #8)) then key:=#0;
end;

procedure TFEveIdentificacion.MSimpleBDBGSeleccionadosDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
  indexColumnaSelecc, indexColumnaRpMadre : integer;
begin
  if (FConMadre) then
  begin
    MSimple.BDBGSeleccionados.Options := [dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
    indexColumnaSelecc := MSimple.BDBGSeleccionados.SelectedIndex;
    indexColumnaRpMadre := MSimple.BDBGSeleccionados.ColumnByField('V1').Index;
    if (indexColumnaSelecc = indexColumnaRpMadre) then
      begin
        if not(MSimple.IBQSeleccionados.eof) and MSimple.IBQSeleccionados.fieldByName('ID_MBI').Value <> null then
        begin
          F := TFREPFichaAnimal.Create(self);
          F.animal := MSimple.IBQSeleccionados.fieldByName('ID_MBI').AsInteger;
          F.ShowModal;
          F.Destroy;
        end;
        inherited RefrescarMangaDisp();
      end
    else
      inherited;
  end
  else
  begin
    MSimple.BDBGSeleccionados.Options := [dgTitles,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
    inherited;
  end;
end;

procedure TFEveIdentificacion.RBRPAnimalClick(Sender: TObject);
begin
  inherited;
  EAPrefijoMasivo.Visible := true;
  EARpInicialMasivo.Visible := true;
  EASufijoMasivo.Visible := true;
  EAEncabezado.Visible := false;
  EAUltimoIdent.Visible := false;
  EVerificador.Visible := false;
  CBCUIGPropio.Visible := false;
  LCUIGPropio.Visible := false;
  DBLCBACUIGPropio.Visible := false;
  EAIdSenasa.Visible := false;
  EAPrefijoCO.Visible := false;

  Lr.Visible:= false;
  EAEncabezadoReidentificacion.Visible:= false;
  EAUltimoIdentReidentificacion.Visible:= false;
  EVerificadorReidentificacion.Visible:= false;

  EAPrefijoMasivo.Top:= EAEncabezado.Top;
  EARpInicialMasivo.Top:= EAEncabezado.Top;
  EASufijoMasivo.Top:= EAEncabezado.Top;
end;

procedure TFEveIdentificacion.EARpInicialMasivoExit(Sender: TObject);
begin
  inherited;
  if Length(IDRpMasivo) > 10 then
  begin
    MostrarMensaje(tmError,'El Identificador RP no puede tener mas de 10 caracteres');
    EAPrefijoMasivo.Text := '';
    EASufijoMasivo.Text := '';
  end;
end;

procedure TFEveIdentificacion.EAPrefijoMasivoChange(Sender: TObject);
begin
  inherited;
  IDRpMasivo := Trim(EAPrefijoMasivo.Text+EARpInicialMasivo.Text+EASufijoMasivo.Text);
end;

procedure TFEveIdentificacion.ActualizarRp(RpUltimo : String);
var valor : Variant;
    resultado, result, val : string;
    i, longTotal, max, longValor : Integer;
begin
  inherited;
  if (Length(EAPrefijoMasivo.Text) = 2) then
    if (Length(EASufijoMasivo.Text) = 2) then
        //CASO AA123456AA
        valor := Copy(RpUltimo, 3, Length(RpUltimo) - 4)
    else if (Length(EASufijoMasivo.Text) = 1) then
            //CASO AA123456A
            valor := Copy(RpUltimo, 3, Length(RpUltimo) - 3)
         else
            //CASO AA123456
            valor := Copy(RpUltimo, 3, Length(RpUltimo) - 2)

  else if (Length(EAPrefijoMasivo.Text) = 1) then
    if (Length(EASufijoMasivo.Text) = 2) then
      //CASO A123456AA
      valor := Copy(RpUltimo, 2, Length(RpUltimo) - 3)
    else if (Length(EASufijoMasivo.Text) = 1) then
            //CASO A123456A
            valor := Copy(RpUltimo, 2, Length(RpUltimo) - 2)
         else
            //CASO A123456
            valor := Copy(RpUltimo, 2, Length(RpUltimo) - 1)
  else
    if (Length(EASufijoMasivo.Text) = 2) then
      //CASO 123456AA
      valor := Copy(RpUltimo, 1, Length(RpUltimo) - 2)
    else if (Length(EASufijoMasivo.Text) = 1) then
            //CASO 123456A
            valor := Copy(RpUltimo, 1, Length(RpUltimo) - 1)
         else
            //CASO 123456
            valor := Copy(RpUltimo, 1, Length(RpUltimo));

  //IDRpMasivo := Trim(EAPrefijoMasivo.Text+EARpInicialMasivo.Text+EASufijoMasivo.Text);

  longTotal := length(valor);
  valor := valor + 1;
  val := IntToStr(valor);
  longValor := length(val);
  max := longTotal-longValor;
  SetLength(resultado,max);

  for i := 1 to max do
    resultado[i] := '0';

  result := resultado+val;


  IDRpMasivo := Trim(EAPrefijoMasivo.Text + result + EASufijoMasivo.Text);
end;

procedure TFEveIdentificacion.ActualizarCOficial(COUltimo : String);
var i : integer;
    encontrado : boolean;
    prefijoCOUltimo : String;
    numeroCOUltimo : integer;
begin
  //Separo encabezado de número.
  i := 0;
  encontrado := false;
  while not encontrado do
    begin
      i := i + 1;
      if (COUltimo[i] in (['0'..'9'])) then
        encontrado := true;
    end;
  if (i = Length(COUltimo)) then
    begin
      prefijoCOUltimo := COUltimo;
      //numeroCOUltimo := null;
    end
  else if (i = 1) then
          begin
            prefijoCOUltimo := '';
            numeroCOUltimo := StrToInt(COUltimo);
          end
       else
          begin
            prefijoCOUltimo := Copy(COUltimo, 1, i-1);
            numeroCOUltimo := StrToInt(Copy(COUltimo, i, Length(COUltimo)-i+1));
          end;

  //Incremento la parte numérica de la CO.
  if (numeroCOUltimo > 9999999) then
    numeroCOUltimo := 0
  else
    numeroCOUltimo := numeroCOUltimo +1;

  COficial := Trim(prefijoCOUltimo + IntToStr(numeroCOUltimo));
end;

procedure TFEveIdentificacion.EAPrefijoCOKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not (key in (['a'..'z','A'..'Z']))  and (key <> #8)) then
    key:=#0;
end;

end.

