unit UEveExtraccionSemen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, ExtCtrls, ImgList, PngImageList, WinXP, IBQuery, DB,
  IBCustomDataSet, DataExport, DataToXLS, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, Buttons, JvExExtCtrls, JvImage,
  PngImage, Grids, DBGrids, UBDBGrid, MemoAuto, EditAuto, UFrameMangazo,
  jpeg, JvGIF, DBCtrls, UDBLookupComboBoxAuto, JvExStdCtrls, JvEdit,
  JvValidateEdit, JvEnterTab, JvComponentBase, JvBalloonHint, xmldom,
  XMLIntf, msxmldom, XMLDoc, Menus;

type
  TFEveExtraccionSemen = class(TFEveSimple)
    DSDisponibles: TDataSource;
    IBQDisponibles: TIBQuery;
    IBQEdadAnimal: TIBQuery;
    IBQEdadAnimalVALOR: TIBStringField;
    DTPFechaExtraccion: TDateTimePicker;
    LFechaEyaculacion: TLabel;
    LNroEyaculacion: TLabel;
    ENroEyaculacion: TEdit;
    EVolumenEyaculacion: TEdit;
    LVolumenEyaculacion: TLabel;
    LHoraEyaculacion: TLabel;
    EMillonesEyaculacion: TEdit;
    LMillonesEyaculacion: TLabel;
    GBDatosExtraccion: TGroupBox;
    GBLugarExtraccion: TGroupBox;
    CBxEstablecimiento: TComboBox;
    CBxCentroExtraccion: TComboBox;
    Label1: TLabel;
    LCentroExtraccion: TLabel;
    LResponsable: TLabel;
    CBxResponsable: TComboBox;
    GBDatosCongelacionDescongelacion: TGroupBox;
    LFechaCongelacion: TLabel;
    DTPFechaCongelacion: TDateTimePicker;
    LHoraCongelacion: TLabel;
    LNroDosis: TLabel;
    ENroDS: TEdit;
    GBDescongelacionCeroHs: TGroupBox;
    LDescongelCeroPorcViv: TLabel;
    EDescongelCeroPorcViv: TEdit;
    GBDescongelacionDosHs: TGroupBox;
    LDescongelDosPorcViv: TLabel;
    EDescongelDosPorcViv: TEdit;
    GBCalidadSeminal: TGroupBox;
    DBLCBAResultado: TDBLookupComboBoxAuto;
    LResultado: TLabel;
    EPartida: TEdit;
    LPrecio: TLabel;
    EPrecio: TEdit;
    PDatosAnimal: TPanel;
    LDatosDelAnimal: TLabel;
    LCertificado: TLabel;
    ECertificado: TEdit;
    IBQDatosAnimal: TIBQuery;
    IBQDatosEstablecimiento: TIBQuery;
    IBQResponsable: TIBQuery;
    DTPHoraEyaculacion: TDateTimePicker;
    DTPHoraCongelacion: TDateTimePicker;
    JvEnterAsTab1: TJvEnterAsTab;
    LMetodoToma: TLabel;
    DBLCBAMetodoToma: TDBLookupComboBoxAuto;
    EDilusion: TEdit;
    LDilusion: TLabel;
    EDiluyenteNecesario: TEdit;
    LDiluyenteNec: TLabel;
    EEspermasXPajuela: TEdit;
    LEspermasXPajuela: TLabel;
    Label2: TLabel;
    EEspermasPotencialesXPajuela: TEdit;
    IBQColorSemen: TIBQuery;
    IBQTiposVigor: TIBQuery;
    IBQResultadoCalidadSeminal: TIBQuery;
    DSResultadoCalidadSeminal: TDataSource;
    DSTiposVigorDescDos: TDataSource;
    DSTiposVigorDescCero: TDataSource;
    IBQTiposVigorDescDos: TIBQuery;
    IBQTiposVigorDescCero: TIBQuery;
    IDiluyeOn: TImage;
    IDiluyeOff: TImage;
    INoDiluyeOn: TImage;
    INoDiluyeOff: TImage;
    LDiluye: TLabel;
    LNoDiluye: TLabel;
    LResponsableExtraccion: TLabel;
    CBxResponsableExtraccion: TComboBox;
    IBQResponsableExtraccion: TIBQuery;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CBxColor: TComboBox;
    CBxVigor: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    CBxVigorDescCero: TComboBox;
    CBxVigorDescDos: TComboBox;
    GBDatosUbicacion: TGroupBox;
    LTermo: TLabel;
    LCanister: TLabel;
    LPosicion: TLabel;
    ENombreTermo: TEdit;
    CBxNroCanister: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    JvENroEyaculacion: TJvEdit;
    JvEVolumenEyaculacion: TJvEdit;
    JvEMillonesEyaculacion: TJvEdit;
    JvEEspermasPotencialesXPajuela: TJvEdit;
    JvEEspermasXPajuela: TJvEdit;
    JvEDilusion: TJvEdit;
    JvEPrecio: TJvEdit;
    JvECertificado: TJvEdit;
    JvENroDS: TJvEdit;
    JvEDescongelCeroPorcViv: TJvEdit;
    JvEDescongelDosPorcViv: TJvEdit;
    JvENombreTermo: TJvEdit;
    CBxPosicion: TComboBox;
    GroupBox1: TGroupBox;
    LDiluyenteNecesario: TLabel;
    IBQDatosDeSemen: TIBQuery;
    IBSPAprobarPartida: TIBStoredProc;
    CBxResponsableAprob: TComboBox;
    LResponsableAprob: TLabel;
    IBQResponsableAprobacion: TIBQuery;
    LSemenCongela: TLabel;
    LSemenNoCongela: TLabel;
    ISemenNoCongelaOff: TImage;
    ISemenNoCongelaOn: TImage;
    ISemenCongelaOff: TImage;
    ISemenCongelaOn: TImage;
    LCliente: TLabel;
    CBxCliente: TComboBox;
    LPrecioCompra: TLabel;
    DTPFechaCompra: TDateTimePicker;
    LFechaCompra: TLabel;
    LPartidaCompra: TLabel;
    IBQDatosCliente: TIBQuery;
    JvEPrecioCompra: TJvEdit;
    GBDatosVenta: TGroupBox;
    IBSPDatosSemen: TIBStoredProc;
    JvEDosisCompra: TJvEdit;
    LDosisCompra: TLabel;
    JvEPartidaCompra: TJvEdit;
    IBQGetSemen: TIBQuery;
    IBQInsertAuxiliar: TIBQuery;
    IBQLimpiarAuxiliar: TIBQuery;
    IBQModificarDatosExtraccion: TIBQuery;
    IBQGetIdSemen: TIBQuery;
    IBQRNModificarExtraccion: TIBQuery;
    GBObservacionLugarExtraccion: TGroupBox;
    MAObservacionLugarExtraccion: TMemoAuto;
    GBObservacionDatos: TGroupBox;
    MAObservacionDatos: TMemoAuto;
    GBUbicacionProvisoria: TGroupBox;
    Label16: TLabel;
    JvENombreTermoProv: TJvEdit;
    Label19: TLabel;
    CBxNroCanisterProv: TComboBox;
    Label18: TLabel;
    CBxPosicionProv: TComboBox;
    Label17: TLabel;
    LPartida: TLabel;
    JvEPartida: TJvEdit;
    IPreview: TImage;
    LPreview: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LCentroExtraccionMouseLeave(Sender: TObject);
    procedure LCentroExtraccionMouseEnter(Sender: TObject);
    procedure LResponsableMouseEnter(Sender: TObject);
    procedure LResponsableMouseLeave(Sender: TObject);
    procedure CBxEstablecimientoChange(Sender: TObject);
    procedure CBxCentroExtraccionChange(Sender: TObject);
    procedure CBxCentroExtraccionCloseUp(Sender: TObject);
    procedure CBxResponsableChange(Sender: TObject);
    procedure CBxResponsableCloseUp(Sender: TObject);
    procedure ENroEyaculacionKeyPress(Sender: TObject; var Key: Char);
    procedure EVolumenEyaculacionKeyPress(Sender: TObject; var Key: Char);
    procedure EColorEyaculacionKeyPress(Sender: TObject; var Key: Char);
    procedure EVigorEyaculacionKeyPress(Sender: TObject; var Key: Char);
    procedure EMillonesEyaculacionKeyPress(Sender: TObject; var Key: Char);
    procedure ECCTotalEyaculacionKeyPress(Sender: TObject; var Key: Char);
    procedure EPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure ECertificadoKeyPress(Sender: TObject; var Key: Char);
    procedure ENroDSKeyPress(Sender: TObject; var Key: Char);
    procedure EDescongelCeroPorcVivKeyPress(Sender: TObject;
      var Key: Char);
    procedure EDescongelDosPorcVivKeyPress(Sender: TObject; var Key: Char);
    procedure LCentroExtraccionClick(Sender: TObject);
    procedure LResponsableClick(Sender: TObject);
    procedure IDiluyeOnClick(Sender: TObject);
    procedure IDiluyeOffClick(Sender: TObject);
    procedure CBxResponsableExtraccionChange(Sender: TObject);
    procedure CBxResponsableExtraccionCloseUp(Sender: TObject);
    procedure CBxColorChange(Sender: TObject);
    procedure CBxColorCloseUp(Sender: TObject);
    procedure CBxVigorChange(Sender: TObject);
    procedure CBxVigorCloseUp(Sender: TObject);
    procedure CBxVigorDescCeroChange(Sender: TObject);
    procedure CBxVigorDescCeroCloseUp(Sender: TObject);
    procedure CBxVigorDescDosChange(Sender: TObject);
    procedure CBxVigorDescDosCloseUp(Sender: TObject);
    procedure EDilusionChange(Sender: TObject);
    procedure EDescongelCeroPorcVivChange(Sender: TObject);
    procedure EDescongelDosPorcVivChange(Sender: TObject);
    procedure EPosicionTermoChange(Sender: TObject);
    procedure CBxNroCanisterChange(Sender: TObject);
    procedure CBxPosicionChange(Sender: TObject);
    procedure JvEEspermasXPajuelaKeyPress(Sender: TObject; var Key: Char);
    procedure JvEEspermasPotencialesXPajuelaKeyPress(Sender: TObject;
      var Key: Char);
    procedure JvEDilusionKeyPress(Sender: TObject; var Key: Char);
    procedure JvENroEyaculacionChange(Sender: TObject);
    procedure JvEVolumenEyaculacionChange(Sender: TObject);
    procedure JvEMillonesEyaculacionChange(Sender: TObject);
    procedure JvEEspermasPotencialesXPajuelaChange(Sender: TObject);
    procedure JvEEspermasXPajuelaChange(Sender: TObject);
    procedure JvENroDSChange(Sender: TObject);
    procedure JvEPartidaChange(Sender: TObject);
    procedure CBxResponsableAprobChange(Sender: TObject);
    procedure CBxResponsableAprobCloseUp(Sender: TObject);
    procedure JvENombreTermoChange(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure LResponsableExtraccionClick(Sender: TObject);
    procedure ISemenNoCongelaOffClick(Sender: TObject);
    procedure ISemenNoCongelaOnClick(Sender: TObject);
    procedure ISemenCongelaOffClick(Sender: TObject);
    procedure ISemenCongelaOnClick(Sender: TObject);
    procedure LClienteClick(Sender: TObject);
    procedure LClienteMouseEnter(Sender: TObject);
    procedure LClienteMouseLeave(Sender: TObject);
    procedure LSemenNoCongelaClick(Sender: TObject);
    procedure LSemenCongelaClick(Sender: TObject);
    procedure CBxClienteChange(Sender: TObject);
    procedure CBxClienteCloseUp(Sender: TObject);
    procedure DBLCBAMetodoTomaCloseUp(Sender: TObject);
    procedure DTPFechaCongelacionExit(Sender: TObject);
    procedure DTPFechaCompraExit(Sender: TObject);
    procedure INoDiluyeOnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CBxNroCanisterProvChange(Sender: TObject);
    procedure CBxPosicionProvChange(Sender: TObject);
    procedure IPreviewClick(Sender: TObject);
    procedure JvEDosisCompraChange(Sender: TObject);
  private
    { Private declarations }
    CargarOtro : Boolean;
    FEdadMinima : integer;
    procedure CargarParametrosRN; override;
    procedure CargarParametrosSP; override;
    procedure CargarDatosGrilla; override;
    procedure CargarParametrosMasivo; override;
    procedure LoadSQLStringList; override;
    procedure RedibujarPanel(valor : boolean);

    procedure CargarCombos(v : integer);
    procedure LimpiarCombos(v : integer);
    function PasarAFloat(dato :string) : double;
    procedure PuedeTerminar;
    procedure CargarDatosCliente;

    procedure ActivarParaAprobar;
    procedure BloquearNoEditables;
    procedure BloquearColumnas;
    procedure CargarResultadoPartida;
    procedure CalcularDilucionTotal;
    
    procedure GuardarDatosVenta;
    procedure GenerarCertificadoPartida;

    procedure AplicarModificacion;

    procedure OcultarElementosNoEditables;

    procedure LimpiarCampos;

  public
    { Public declarations }
    evento : integer;
    esMasivo : Boolean;
  end;

var
  FEveExtraccionSemen: TFEveExtraccionSemen;
  canister, posicion, canister_prov, posicion_prov : string;
  modifica, editable, propaga, PartidaCambio : boolean;
  cliente, estable_extrac, centro_extrac, responsable, responsableAprob, responsable_extraccion, color_semen, vigor_semen, vigor_desc_cero, vigor_desc_dos : integer;
  NoCongela, hayCambioTermo, DelCliente, DelResponsableAprob, DelColorSemen, DelVigor, DelVigorDescCero, DelVigorDescDos, DelCentro, DelResponsable, DelResponsableExtraccion, Diluye : boolean;

implementation

uses UPrincipal,uTiposGlobales, UDMSoftvet, UMensajeHuella, UAbmCentrosInseminacion, UEveUniversal, UPartidasSemenAprobar, UDatosClienteComprador,
     UUniversal, UCertificadoPartida, URepListadoExtracciones, UCertificadoCalidadOrig;

{$R *.dfm}

procedure TFEveExtraccionSemen.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQCodigosGenericos.Close;
  DMSoftvet.IBQCodigosGenericos.ParamByName('TIPO').Value := 'AR';
  DMSoftvet.IBQCodigosGenericos.Open;

  IBQEdadAnimal.Close;
  IBQEdadAnimal.ParamByName('nombreparametro').AsString := 'MSEDADSER1';
  IBQEdadAnimal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEdadAnimal.Open;

  FEdadMinima := IBQEdadAnimalVALOR.AsInteger * 30;

  MSimple.SQLBasico := 'select id_rp, id_senasa, id_animal, id_pc, id_hba, id_otro, nombre, apodo from VIS_INGRESO_TORO where (CURRENT_DATE - FECHA_NACIMIENTO) >'+ IntToStr(FEdadMinima);
  IBQResponsable.Close;
  IBQResponsable.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQResponsable.Open;

  IBQResponsableExtraccion.Close;
  IBQResponsableExtraccion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQResponsableExtraccion.Open;

  estable_extrac := -1;
  centro_extrac := -1;
  responsable := -1;
  responsableAprob := -1;
  responsable_extraccion := -1;
  color_semen := -1;
  vigor_desc_cero := -1;
  vigor_desc_dos := -1;
  vigor_semen := -1;
  cliente := -1;
  evento := -1;
  DelCliente := false;
  DelCentro := false;
  DelResponsableAprob := false;
  DelResponsable := false;
  DelResponsableExtraccion := false;
  DelColorSemen := false;
  DelVigor := false;
  DelVigorDescCero := false;
  DelVigorDescDos := false;
  PartidaCambio := false;

  canister := '';
  canister_prov := '';
  posicion := '';
  posicion_prov := '';

  JvIImpExcel.Visible := false;
  LImpExcel.Visible := false;

  JvTerminar.Visible := false;
  LBBTerminar.Visible := false;

  PuedeTerminar;

  LResponsableAprob.Visible := false;
  CBxResponsableAprob.Visible := false;

  GBCalidadSeminal.Height := 75;

  hayCambioTermo := false;

  esMasivo := false;

  DTPFechaExtraccion.Date := Now;
  DTPFechaCongelacion.Date := Now;
  DTPFechaCompra.Date := Now;

  DTPHoraCongelacion.Time := Time;
  DTPHoraEyaculacion.Time := Time;
  
end;

Procedure TFEveExtraccionSemen.CargarParametrosRN;
begin

 IBQSPRN.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
 if(self.ModoEve = meIndividual)then
   IBQSPRN.ParamByName('ANIMAL').AsInteger := IDAnimal
 else
   IBQSPRN.ParamByName('ANIMAL').AsInteger := IBDSSimple.fieldbyname('id_animal').AsInteger;
 IBQSPRN.ParamByName('fecha').AsDate := DTPFechaExtraccion.Date;
end;

(*
  carga los parametros de la grilla detalle para el SP de insercion correspondiente
*)
Procedure TFEveExtraccionSemen.CargarParametrosSP;
begin

        IBQSPEventoInd.ParamByName('FECHA_EXTRACCION').AsDate  := DTPFechaExtraccion.Date;
        IBQSPEventoInd.ParamByName('ESTABLECIMIENTO').AsInteger  := FPrincipal.EstablecimientoActual;
        IBQSPEventoInd.ParamByName('ID_ANIMAL').AsInteger  := IDAnimal;
        IBQSPEventoInd.ParamByName('TIPO_ANIMAL').AsString  := 'I';

        if (JvENroEyaculacion.Text <> '') then
            IBQSPEventoInd.ParamByName('NRO_EYACULACION').AsInteger  := StrToInt(JvENroEyaculacion.Text)
        else
            IBQSPEventoInd.ParamByName('NRO_EYACULACION').AsInteger  := 0;

        IBQSPEventoInd.ParamByName('HORA_EYACULACION').AsTime := DTPHoraEyaculacion.Time;

        if (JvEVolumenEyaculacion.Text <> '') then
            IBQSPEventoInd.ParamByName('VOLUMEN_EYACULACION').AsFloat := PasarAFloat(JvEVolumenEyaculacion.Text)
        else
            IBQSPEventoInd.ParamByName('VOLUMEN_EYACULACION').Value := null;

        if (color_semen <> -1) then
            IBQSPEventoInd.ParamByName('COLOR_SEMEN').AsInteger := color_semen
        else
            IBQSPEventoInd.ParamByName('COLOR_SEMEN').Value := null;

        if (vigor_semen <> -1) then
            IBQSPEventoInd.ParamByName('VIGOR_SEMEN').AsInteger := vigor_semen
        else
            IBQSPEventoInd.ParamByName('VIGOR_SEMEN').Value := null;

        if (JvEMillonesEyaculacion.Text <> '') then
            IBQSPEventoInd.ParamByName('MILLONES_ESPERM').AsInteger := StrToInt(JvEMillonesEyaculacion.Text)
        else
            IBQSPEventoInd.ParamByName('MILLONES_ESPERM').Value := null;

        IBQSPEventoInd.ParamByName('CC_TOTAL').Value := null;

        if (not(NoCongela) and (Diluye)) then
            IBQSPEventoInd.ParamByName('FECHA_CONGELACION').AsDate := DTPFechaCongelacion.Date
        else
            IBQSPEventoInd.ParamByName('FECHA_CONGELACION').Value := null;


        IBQSPEventoInd.ParamByName('HORA_CONGELACION').AsTime := DTPHoraCongelacion.Time;

        if not(NoCongela) then
        begin
            if (JvENroDS.Text <> '') then
                IBQSPEventoInd.ParamByName('NRO_DS').AsInteger := StrToInt(JvENroDS.Text)
            else
                IBQSPEventoInd.ParamByName('NRO_DS').Value := null;
        end
        else
        begin
            if (JvEDosisCompra.Text <> '') then
                IBQSPEventoInd.ParamByName('NRO_DS').AsInteger := StrToInt(JvEDosisCompra.Text)
            else
                IBQSPEventoInd.ParamByName('NRO_DS').Value := null;
        end;

        if (JvEDescongelCeroPorcViv.Text <> '') then
            IBQSPEventoInd.ParamByName('DESCONGEL_CERO_HS_PORC_VIV').AsFloat := PasarAFloat(JvEDescongelCeroPorcViv.Text)
        else
            IBQSPEventoInd.ParamByName('DESCONGEL_CERO_HS_PORC_VIV').Value := null;

        if (vigor_desc_cero <> -1) then
            IBQSPEventoInd.ParamByName('DESCONGEL_CERO_HS_VIG').AsInteger := vigor_desc_cero
        else
            IBQSPEventoInd.ParamByName('DESCONGEL_CERO_HS_VIG').Value := null;

        if (JvEDescongelDosPorcViv.Text <> '') then
            IBQSPEventoInd.ParamByName('DESCONGEL_DOS_HS_PORC_VIV').AsFloat := PasarAFloat(JvEDescongelDosPorcViv.Text)
        else
            IBQSPEventoInd.ParamByName('DESCONGEL_DOS_HS_PORC_VIV').Value := null;

        if (vigor_desc_dos <> -1) then
            IBQSPEventoInd.ParamByName('DESCONGEL_DOS_HS_VIG').AsInteger := vigor_desc_dos
        else
            IBQSPEventoInd.ParamByName('DESCONGEL_DOS_HS_VIG').Value := null;

        if not(NoCongela) then
        begin
            if (JvEPartida.Text <> '') then
                IBQSPEventoInd.ParamByName('PARTIDA').AsString := JvEPartida.Text
            else
                IBQSPEventoInd.ParamByName('PARTIDA').AsString := 'No Definida';
        end
        else
        begin
            if (JvEPartidaCompra.Text <> '') then
                IBQSPEventoInd.ParamByName('PARTIDA').AsString := JvEPartidaCompra.Text
            else
                IBQSPEventoInd.ParamByName('PARTIDA').AsString := 'No Definida';
        end;

        if ((DBLCBAMetodoToma.KeyValue <> null)) then
            IBQSPEventoInd.ParamByName('METODO_TOMA').AsInteger := DBLCBAMetodoToma.KeyValue
        else
            IBQSPEventoInd.ParamByName('METODO_TOMA').Value := null;

        if not(NoCongela) then
        begin
            if ((DBLCBAResultado.KeyValue <> null))then
            begin
                if (DBLCBAResultado.KeyValue = 0)then  //si es NO DEFINIDA se pasa como partida por aprobar
                begin
                  IBQSPEventoInd.ParamByName('RESULTADO').Value := null;
                  IBQSPEventoInd.ParamByName('ID_RESULTADO').Value := null;
                end
                else
                begin
                  IBQSPEventoInd.ParamByName('RESULTADO').AsString := DBLCBAResultado.Text;
                  IBQSPEventoInd.ParamByName('ID_RESULTADO').AsInteger := DBLCBAResultado.KeyValue;
                end;
            end
            else
            begin
              if (Diluye) then   //si congela y diluye se pasa a partidas por aprobar
              begin
                IBQSPEventoInd.ParamByName('RESULTADO').Value := null;
                IBQSPEventoInd.ParamByName('ID_RESULTADO').Value := null;
              end
              else
              begin // si congela y no diluye se carga como rechazo
                IBQSPEventoInd.ParamByName('RESULTADO').AsString := 'RECHAZO';
                IBQSPEventoInd.ParamByName('ID_RESULTADO').AsInteger := 4;
              end;
            end;
        end
        else //si no congela entonces se carga como apto
        begin
          IBQSPEventoInd.ParamByName('RESULTADO').AsString := 'APTO';
          IBQSPEventoInd.ParamByName('ID_RESULTADO').AsInteger := 2;
        end;

        if (estable_extrac <> -1) then
            IBQSPEventoInd.ParamByName('EXTRACCION_CAMPO').AsInteger := estable_extrac
        else
            IBQSPEventoInd.ParamByName('EXTRACCION_CAMPO').Value := null;

        if (centro_extrac <> -1) then
            IBQSPEventoInd.ParamByName('EXTRACCION_CENTRO').AsInteger := centro_extrac
        else
            IBQSPEventoInd.ParamByName('EXTRACCION_CENTRO').Value := null;

        if (responsable <> -1) then
          IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := responsable
        else
          IBQSPEventoInd.ParamByName('RESPONSABLE').AsInteger := 0;

        if (responsable_extraccion <> -1) then
          IBQSPEventoInd.ParamByName('RESPONSABLE_EXTRACCION').AsInteger := responsable_extraccion
        else
          IBQSPEventoInd.ParamByName('RESPONSABLE_EXTRACCION').AsInteger := 0;

        if (JvECertificado.Text <> '') then
            IBQSPEventoInd.ParamByName('CERTIFICADO').AsInteger := StrToInt(JvECertificado.Text)
        else
            IBQSPEventoInd.ParamByName('CERTIFICADO').Value := null;

        if (JvEPrecio.Text <> '') then
            IBQSPEventoInd.ParamByName('PRECIO').AsFloat := PasarAFloat(JvEPrecio.Text)
        else
            IBQSPEventoInd.ParamByName('PRECIO').Value := null;

        if (MAObservacion.Text <> '') then
            IBQSPEventoInd.ParamByName('OBSERVACION').AsString := MAObservacion.Text
        else
            IBQSPEventoInd.ParamByName('OBSERVACION').Value := null;

        if (MAObservacionLugarExtraccion.Text <> '') then
            IBQSPEventoInd.ParamByName('OBSERVA_LUGAR').AsString := MAObservacionLugarExtraccion.Text
        else
            IBQSPEventoInd.ParamByName('OBSERVA_LUGAR').Value := null;

        if (MAObservacionDatos.Text <> '') then
            IBQSPEventoInd.ParamByName('OBSERVA_DATOS').AsString := MAObservacionDatos.Text
        else
            IBQSPEventoInd.ParamByName('OBSERVA_DATOS').Value := null;

        if (Diluye) then
            IBQSPEventoInd.ParamByName('DILUYE_SN').AsString := 'S'
        else
            IBQSPEventoInd.ParamByName('DILUYE_SN').AsString := 'N';

        if (LDiluyenteNecesario.Caption <> '') then
            IBQSPEventoInd.ParamByName('DILUYENTE_NECESARIO').AsFloat := PasarAFloat(LDiluyenteNecesario.Caption)
        else
            IBQSPEventoInd.ParamByName('DILUYENTE_NECESARIO').Value := null;

        if (JvEDilusion.Text <> '') then
            IBQSPEventoInd.ParamByName('DILUCION').AsFloat := PasarAFloat(JvEDilusion.Text)
        else
            IBQSPEventoInd.ParamByName('DILUCION').Value := null;

        if (JvENombreTermo.Text <> '') then
            IBQSPEventoInd.ParamByName('TERMO').AsString := JvENombreTermo.Text
        else
            IBQSPEventoInd.ParamByName('TERMO').Value := null;

        if (canister <> '') then
            IBQSPEventoInd.ParamByName('CANISTER').AsString := canister
        else
            IBQSPEventoInd.ParamByName('CANISTER').Value := null;

        if (posicion <> '') then
            IBQSPEventoInd.ParamByName('POSICION_TERMO').AsString := posicion
        else
            IBQSPEventoInd.ParamByName('POSICION_TERMO').Value := null;

        if (JvENombreTermoProv.Text <> '') then
            IBQSPEventoInd.ParamByName('TERMO_PROVISORIO').AsString := JvENombreTermoProv.Text
        else
            IBQSPEventoInd.ParamByName('TERMO_PROVISORIO').Value := null;

        if (canister_prov <> '') then
            IBQSPEventoInd.ParamByName('CANISTER_PROVISORIO').AsString := canister_prov
        else
            IBQSPEventoInd.ParamByName('CANISTER_PROVISORIO').Value := null;

        if (posicion_prov <> '') then
            IBQSPEventoInd.ParamByName('POSICION_TERMO_PROVISORIO').AsString := posicion_prov
        else
            IBQSPEventoInd.ParamByName('POSICION_TERMO_PROVISORIO').Value := null;


        if (JvEEspermasPotencialesXPajuela.Text <> '') then
            IBQSPEventoInd.ParamByName('ESPERMAS_POTENCIALES_PAJUELA').AsInteger := StrToInt(JvEEspermasPotencialesXPajuela.Text)
        else
            IBQSPEventoInd.ParamByName('ESPERMAS_POTENCIALES_PAJUELA').Value := null;

        if (JVEEspermasXPajuela.Text <> '') then
            IBQSPEventoInd.ParamByName('ESPERMAS_POR_PAJUELA').AsInteger := StrToInt(JvEEspermasXPajuela.Text)
        else
            IBQSPEventoInd.ParamByName('ESPERMAS_POR_PAJUELA').Value := null;

        IBQSPEventoInd.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
        IBQSPEventoInd.ParamByName('LOG_FECHA_MODIFICADO').Value := now;

        if (NoCongela) then
            IBQSPEventoInd.ParamByName('CONGELO').AsString := 'N'
        else
          if (Diluye) then
            IBQSPEventoInd.ParamByName('CONGELO').AsString := 'S'
          else
            IBQSPEventoInd.ParamByName('CONGELO').AsString := 'N';

        if (GBDatosVenta.Visible) then
            IBQSPEventoInd.ParamByName('VENTA').AsString := 'S'
        else
            IBQSPEventoInd.ParamByName('VENTA').AsString := 'N';
end;


procedure TFEveExtraccionSemen.CargarResultadoPartida;
begin
  try
     IBSPAprobarPartida.Close;
     IBSPAprobarPartida.ParamByName('evento').AsInteger := evento;
     IBSPAprobarPartida.ParamByName('id_resultado').AsInteger := DBLCBAResultado.KeyValue;

     if (responsableAprob <> -1) then
         IBSPAprobarPartida.ParamByName('responsable').AsInteger := responsableAprob
     else
         IBSPAprobarPartida.ParamByName('responsable').AsInteger := 0;

     IBSPAprobarPartida.ParamByName('log_usuario').AsInteger := FPrincipal.UsuarioActual;
     IBSPAprobarPartida.ParamByName('log_fecha_modificado').AsDate := Now();

     if (hayCambioTermo) then
         IBSPAprobarPartida.ParamByName('termo').AsString := JvENombreTermo.Text
     else
         IBSPAprobarPartida.ParamByName('termo').Value := null;

     if (canister <> '') then
         IBSPAprobarPartida.ParamByName('canister').AsString := canister
     else
         IBSPAprobarPartida.ParamByName('canister').Value := null;

     if (posicion <> '') then
         IBSPAprobarPartida.ParamByName('posicion_termo').AsString := posicion
     else
         IBSPAprobarPartida.ParamByName('posicion_termo').Value := null;
         
     IBSPAprobarPartida.ExecProc;

     FPrincipal.IBTPrincipal.CommitRetaining;

     MostrarMensaje(tmInformacion,'Los datos han sido cargados correctamente.');

     Close();
  except
     FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

(*
  Agrega los datos del evento a la grilla
*)
procedure TFEveExtraccionSemen.CargarDatosGrilla;
begin
  inherited;
end;

(*
  carga los parametros de la grilla detalle para  el SP correspondiente
*)
Procedure TFEveExtraccionSemen.CargarParametrosMasivo;
begin
end;

procedure TFEveExtraccionSemen.LoadSQLStringList;
begin   
end;

procedure TFEveExtraccionSemen.FormShow(Sender: TObject);
var cadena : string;
begin
  inherited;

  if esMasivo then
    ModoEve := meMasivo
  else
    ModoEve := meIndividual;


  PDatosAnimal.Visible := false;
  if(self.ModoEve = meIndividual)then
  begin
       cadena := '';

       IBQDatosAnimal.Close;
       IBQDatosAnimal.ParamByName('animal').AsInteger := IDAnimal;
       IBQDatosAnimal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
       IBQDatosAnimal.Open;

       cadena := 'RP.: '+IBQDatosAnimal.FieldValues['id_rp'];

       if (IBQDatosAnimal.FieldValues['id_hba'] <> null) then
          cadena := cadena + ' / H.B.A.: ' + IBQDatosAnimal.FieldValues['id_hba'];
       if (IBQDatosAnimal.FieldValues['nombre'] <> null) then
          cadena := cadena + ' / Nombre: ' + IBQDatosAnimal.FieldValues['nombre'];
       if (IBQDatosAnimal.FieldValues['apodo'] <> null) then
          cadena := cadena + ' / Apodo: ' + IBQDatosAnimal.FieldValues['apodo'];

       LDatosDelAnimal.Caption := cadena;
       PDatosAnimal.Visible := true;
  end;

  CargarCombos(0);

  CargarDatosCliente;

  IBQColorSemen.Close;
  IBQColorSemen.Open;
  IBQColorSemen.Last;
  IBQColorSemen.First;

  IBQResultadoCalidadSeminal.Close;
  IBQResultadoCalidadSeminal.Open;
  IBQResultadoCalidadSeminal.Last;
  IBQResultadoCalidadSeminal.First;

  IBQTiposVigor.Close;
  IBQTiposVigor.Open;
  IBQTiposVigor.Last;
  IBQTiposVigor.First;

  IBQTiposVigorDescCero.Close;
  IBQTiposVigorDescCero.Open;
  IBQTiposVigorDescCero.Last;
  IBQTiposVigorDescCero.First;

  IBQTiposVigorDescDos.Close;
  IBQTiposVigorDescDos.Open;
  IBQTiposVigorDescDos.Last;
  IBQTiposVigorDescDos.First;

  IDiluyeOn.Visible := true;
  IDiluyeOff.Visible := false;

  INoDiluyeOn.Visible := false;
  INoDiluyeOff.Visible := true;

  ISemenCongelaOn.Visible := true;
  ISemenCongelaOff.Visible := false;

  NoCongela := false;

  ISemenNoCongelaOff.Visible := true;
  ISemenNoCongelaOn.Visible := false;

  GBDatosCongelacionDescongelacion.Enabled := true;
  Diluye := true;
  PuedeTerminar;

  GBDatosVenta.Visible := false;

  CBxNroCanister.ItemIndex := 0;

  modifica := false;
  editable := false;

  if (Owner is TFPartidasSemenAprobar) then
  begin
       //ActivarParaAprobar;
       modifica := true;

       editable := true;

       OcultarElementosNoEditables;

       ActivarParaAprobar;

       IBQGetIdSemen.Close;
       IBQGetIdSemen.ParamByName('partida').AsString := JvEPartida.Text;
       IBQGetIdSemen.Open;

       PartidaCambio := false;
  end;

  if (Owner is TFRepListadoExtracciones) then
  begin
       modifica := true;

       editable := true;

       OcultarElementosNoEditables;

       ActivarParaAprobar;

       IBQGetIdSemen.Close;
       IBQGetIdSemen.ParamByName('partida').AsString := JvEPartida.Text;
       IBQGetIdSemen.Open;

       PartidaCambio := false;
  end;

  if evento <> -1 then
  begin
    IPreview.Visible := true;
    LPreview.Visible := true;  
  end;

end;

procedure TFEveExtraccionSemen.CargarCombos(v : integer);
var i : integer;
    cadena :string;
begin
     if (v = 0) then
     begin
           IBQDatosEstablecimiento.Close;
           IBQDatosEstablecimiento.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQDatosEstablecimiento.Open;

           CBxEstablecimiento.Items.Insert(0,'ESTABLECIMIENTO');
           CBxEstablecimiento.Items.Insert(1,IBQDatosEstablecimiento.FieldValues['nombre']);
           CBxEstablecimiento.ItemIndex := 0;

           DMSoftvet.DSCentrosInsem.DataSet.Close;
           DMSoftvet.DSCentrosInsem.DataSet.Open;
           DMSoftvet.DSCentrosInsem.DataSet.First;


           CBxCentroExtraccion.Items.Insert(0,'CENTROS DE INSEMINACION');
           CBxCentroExtraccion.Items.Insert(1,'(TODOS)');
           i := 2;
           while not(DMSoftvet.DSCentrosInsem.DataSet.Eof) do
           begin
                CBxCentroExtraccion.Items.Insert(i,DMSoftvet.DSCentrosInsem.DataSet.FieldValues['nombre']);
                DMSoftvet.DSCentrosInsem.DataSet.Next;
                Inc(i);
           end;
           CBxCentroExtraccion.ItemIndex := 0;
           CBxCentroExtraccion.DropDownCount := i;

           IBQResponsable.Close;
           IBQResponsable.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQResponsable.Open;
           IBQResponsable.First;

           CBxResponsable.Items.Insert(0,'RESPONSABLE');
           CBxResponsable.Items.Insert(1,'(TODOS)');
           i := 2;
           while not(IBQResponsable.Eof) do
           begin
                cadena := '';
                cadena := IBQResponsable.FieldValues['nombre']+' '+IBQResponsable.FieldValues['apellido'];
                CBxResponsable.Items.Insert(i,cadena);
                Inc(i);
                IBQResponsable.Next;
           end;
           CBxResponsable.ItemIndex := 0;
           CBxResponsable.DropDownCount := i;


           IBQResponsableExtraccion.Close;
           IBQResponsableExtraccion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQResponsableExtraccion.Open;
           IBQResponsableExtraccion.First;

           CBxResponsableExtraccion.Items.Insert(0,'RESPONSABLE');
           CBxResponsableExtraccion.Items.Insert(1,'(TODOS)');
           i := 2;
           while not(IBQResponsableExtraccion.Eof) do
           begin
                cadena := '';
                cadena := IBQResponsableExtraccion.FieldValues['nombre']+' '+IBQResponsableExtraccion.FieldValues['apellido'];
                CBxResponsableExtraccion.Items.Insert(i,cadena);
                Inc(i);
                IBQResponsableExtraccion.Next;
           end;
           CBxResponsableExtraccion.ItemIndex := 0;
           CBxResponsableExtraccion.DropDownCount := i;

           IBQResponsableAprobacion.Close;
           IBQResponsableAprobacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQResponsableAprobacion.Open;
           IBQResponsableAprobacion.First;

           CBxResponsableAprob.Items.Insert(0,'RESPONSABLE');
           CBxResponsableAprob.Items.Insert(1,'(TODOS)');
           i := 2;
           while not(IBQResponsableAprobacion.Eof) do
           begin
                cadena := '';
                cadena := IBQResponsableAprobacion.FieldValues['nombre']+' '+IBQResponsableAprobacion.FieldValues['apellido'];
                CBxResponsableAprob.Items.Insert(i,cadena);
                Inc(i);
                IBQResponsableAprobacion.Next;
           end;
           CBxResponsableAprob.ItemIndex := 0;
           CBxResponsableAprob.DropDownCount := i;

           IBQColorSemen.Close;
           IBQColorSemen.Open;
           IBQColorSemen.First;

           CBxColor.Items.Insert(0,'COLOR SEMEN');
           CBxColor.Items.Insert(1,'(TODOS)');
           i := 2;
           while not(IBQColorSemen.Eof) do
           begin
                CBxColor.Items.Insert(i,IBQColorSemen.FieldValues['NOMBRE_COLOR_SEMEN']);
                Inc(i);
                IBQColorSemen.Next;
           end;
           CBxColor.ItemIndex := 0;
           CBxColor.DropDownCount := i-1;

           IBQTiposVigor.Close;
           IBQTiposVigor.Open;
           IBQTiposVigor.First;
           IBQTiposVigorDescCero.Close;
           IBQTiposVigorDescCero.Open;
           IBQTiposVigorDescCero.First;
           IBQTiposVigorDescDos.Close;
           IBQTiposVigorDescDos.Open;
           IBQTiposVigorDescDos.First;
           CBxVigor.Items.Insert(0,'VIGOR');
           CBxVigorDescCero.Items.Insert(0,'VIGOR');
           CBxVigorDescDos.Items.Insert(0,'VIGOR');
           CBxVigor.Items.Insert(1,'(TODOS)');
           CBxVigorDescCero.Items.Insert(1,'(TODOS)');
           CBxVigorDescDos.Items.Insert(1,'(TODOS)');
           i := 2;
           while not(IBQTiposVigor.Eof) do
           begin
                CBxVigor.Items.Insert(i,IBQTiposVigor.FieldValues['VALOR_TIPO_VIGOR']);
                CBxVigorDescCero.Items.Insert(i,IBQTiposVigorDescCero.FieldValues['VALOR_TIPO_VIGOR']);
                CBxVigorDescDos.Items.Insert(i,IBQTiposVigorDescDos.FieldValues['VALOR_TIPO_VIGOR']);
                Inc(i);
                IBQTiposVigor.Next;
                IBQTiposVigorDescCero.Next;
                IBQTiposVigorDescDos.Next;
           end;
           CBxVigor.ItemIndex := 0;
           CBxVigorDescCero.ItemIndex := 0;
           CBxVigorDescDos.ItemIndex := 0;
           CBxVigor.DropDownCount := i-1;
           CBxVigorDescCero.DropDownCount := i-1;
           CBxVigorDescDos.DropDownCount := i-1;
     end;

     if (v = 1) then
     begin
           IBQResponsableExtraccion.Close;
           IBQResponsableExtraccion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQResponsableExtraccion.Open;
           IBQResponsableExtraccion.First;

           CBxResponsableExtraccion.Items.Insert(0,'RESPONSABLE');
           CBxResponsableExtraccion.Items.Insert(1,'(TODOS)');
           i := 2;
           while not(IBQResponsableExtraccion.Eof) do
           begin
                cadena := '';
                cadena := IBQResponsableExtraccion.FieldValues['nombre']+' '+IBQResponsableExtraccion.FieldValues['apellido'];
                CBxResponsableExtraccion.Items.Insert(i,cadena);
                Inc(i);
                IBQResponsableExtraccion.Next;
           end;
           CBxResponsableExtraccion.ItemIndex := 0;
           CBxResponsableExtraccion.DropDownCount := i;
     end;

     if (v = 2) then
     begin
           DMSoftvet.DSCentrosInsem.DataSet.Close;
           DMSoftvet.DSCentrosInsem.DataSet.Open;
           DMSoftvet.DSCentrosInsem.DataSet.First;

           CBxCentroExtraccion.Items.Insert(0,'CENTROS DE INSEMINACION');
           CBxCentroExtraccion.Items.Insert(1,'(TODOS)');
           i := 2;
           while not(DMSoftvet.DSCentrosInsem.DataSet.Eof) do
           begin
                CBxCentroExtraccion.Items.Insert(i,DMSoftvet.DSCentrosInsem.DataSet.FieldValues['nombre']);
                DMSoftvet.DSCentrosInsem.DataSet.Next;
                Inc(i);
           end;
           CBxCentroExtraccion.ItemIndex := 0;
           CBxCentroExtraccion.DropDownCount := i;
     end;


     if (v = 3) then
     begin
           CBxResponsable.Items.Insert(0,'RESPONSABLE');
           CBxResponsable.Items.Insert(1,'(TODOS)');
           i := 2;
           while not(IBQResponsable.Eof) do
           begin
                cadena := '';
                cadena := IBQResponsable.FieldValues['nombre']+' '+IBQResponsable.FieldValues['apellido'];
                CBxResponsable.Items.Insert(i,cadena);
                Inc(i);
                IBQResponsable.Next;
           end;
           CBxResponsable.ItemIndex := 0;
           CBxResponsable.DropDownCount := i;
     end;

end;

procedure TFEveExtraccionSemen.LCentroExtraccionMouseLeave(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCentroExtraccion.Font.Color:= clWindowText;
      LCentroExtraccion.Font.Style:= [fsUnderline];
    end;

end;

procedure TFEveExtraccionSemen.LCentroExtraccionMouseEnter(
  Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LCentroExtraccion.Font.Color:= $00606C02;
      LCentroExtraccion.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFEveExtraccionSemen.LResponsableMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= $00606C02;
      LResponsable.Font.Style:= [fsBold,fsUnderline];
    end;

end;

procedure TFEveExtraccionSemen.LResponsableMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LResponsable.Font.Color:= clWindowText;
      LResponsable.Font.Style:= [fsUnderline];
    end;

end;

procedure TFEveExtraccionSemen.CBxEstablecimientoChange(Sender: TObject);
begin
  inherited;

  if (CBxEstablecimiento.Text <> 'ESTABLECIMIENTO') then
      estable_extrac := FPrincipal.EstablecimientoActual
  else
      estable_extrac := -1;
end;

procedure TFEveExtraccionSemen.CBxCentroExtraccionChange(Sender: TObject);
begin
  inherited;

  if ((CBxCentroExtraccion.Text <> 'CENTROS DE INSEMINACION') and (CBxCentroExtraccion.Text <> '(TODOS)')) then
  begin
       centro_extrac := DMSoftvet.DSCentrosInsem.DataSet.Lookup('nombre',CBxCentroExtraccion.Text,'id_centro');
  end
  else
  begin
       centro_extrac := -1;
       CBxCentroExtraccion.Items.Insert(0,'CENTROS DE INSEMINACION');
       CBxCentroExtraccion.ItemIndex := 0;
       DelCentro := false;
  end;
end;

procedure TFEveExtraccionSemen.CBxCentroExtraccionCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelCentro) then
  begin
       CBxCentroExtraccion.Items.Delete(0);
       DelCentro := true;
  end;
end;

procedure TFEveExtraccionSemen.CBxResponsableChange(Sender: TObject);
var pos_b : integer;
    nomb, ape, aux :string;
begin
  inherited;

  if ((CBxResponsable.Text <> 'RESPONSABLE') and (CBxResponsable.Text <> '(TODOS)')) then
  begin
       aux := CBxResponsable.Text;
       pos_b := LastDelimiter(' ',aux);
       nomb := Copy(aux,1,pos_b-1);
       Delete(aux, 1, pos_b);
       ape := aux;
       if IBQResponsable.Locate('nombre;apellido',VarArrayOf([nomb,ape]),[]) then
           responsable := IBQResponsable.FieldValues['id_empleado'];
  end
  else
  begin
       responsable := -1;
       CBxResponsable.Items.Insert(0,'RESPONSABLE');
       CBxResponsable.ItemIndex := 0;
       DelResponsable := false;
  end;

end;

procedure TFEveExtraccionSemen.CBxResponsableCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelResponsable) then
  begin
       CBxResponsable.Items.Delete(0);
       DelResponsable := true;
  end;
end;

procedure TFEveExtraccionSemen.ENroEyaculacionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['0' .. '9']) and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.EVolumenEyaculacionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (not(Key in ['0' .. '9']) and (Key <> ',') and (Key <> '.') and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.EColorEyaculacionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (not((Key in ['A' .. 'Z'])) and (not(Key in ['a' .. 'z'])) and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.EVigorEyaculacionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (not(Key in ['0' .. '9']) and (Key <> '+') and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.EMillonesEyaculacionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (not(Key in ['0' .. '9']) and (Key <> #13) and (Key <> #8)) then
     Key := #0;


end;

procedure TFEveExtraccionSemen.ECCTotalEyaculacionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (not(Key in ['0' .. '9']) and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.EPrecioKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (not(Key in ['0' .. '9']) and (Key <> ',') and (Key <> '.') and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.ECertificadoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['0' .. '9']) and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.ENroDSKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['0' .. '9']) and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.EDescongelCeroPorcVivKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['0' .. '9']) and (Key <> ',') and (Key <> '.') and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.EDescongelDosPorcVivKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (not(Key in ['0' .. '9']) and (Key <> ',') and (Key <> '.') and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

function TFEveExtraccionSemen.PasarAFloat(dato : string) : double;
var res : double;
    aux : string;
begin

     if (dato = '') then
        Result := 0
     else
     begin
       aux := Trim(dato);
       aux := StringReplace(aux,'.',',',[rfReplaceAll]);
       res := StrToFloat(aux);

       Result := res;
     end;
end;

procedure TFEveExtraccionSemen.LCentroExtraccionClick(Sender: TObject);
var F : TFABMCentrosInseminacion;
begin
  inherited;

  F := TFABMCentrosInseminacion.Create(self);
  F.ShowModal;
  F.Destroy;

  DMSoftvet.IBQCentrosInsem.Close;
  DMSoftvet.IBQCentrosInsem.Open;

  LimpiarCombos(2);
  CargarCombos(2);
end;

procedure TFEveExtraccionSemen.LResponsableClick(Sender: TObject);
begin
  inherited;

  LimpiarCombos(3);
  CargarCombos(3);
end;

procedure TFEveExtraccionSemen.LimpiarCombos(v : integer);
begin

     if (v = 0) then
     begin
         CBxCentroExtraccion.Clear;
         CBxEstablecimiento.Clear;
         CBxResponsable.Clear;
         CBxResponsableExtraccion.Clear;
         CBxResponsableAprob.Clear;
         CBxColor.Clear;
         CBxVigor.Clear;
         CBxVigorDescCero.Clear;
         CBxVigorDescDos.Clear;
     end;

     if (v = 1) then
        CBxResponsableExtraccion.Clear;

     if (v = 2 ) then
        CBxCentroExtraccion.Clear;

     if (v = 3) then
        CBxResponsable.Clear;
end;

procedure TFEveExtraccionSemen.IDiluyeOnClick(Sender: TObject);
begin
  inherited;

  if (IDiluyeOn.Visible) then
  begin
    GBDatosCongelacionDescongelacion.Enabled := false;
    RedibujarPanel(false);
    Diluye := false;
  end
  else
  begin
    GBDatosCongelacionDescongelacion.Enabled := true;
    RedibujarPanel(true);
    Diluye := true;
  end;

  IDiluyeOn.Visible := not(IDiluyeOn.Visible);
  IDiluyeOff.Visible := not(IDiluyeOff.Visible);
  INoDiluyeOn.Visible := not(INoDiluyeOn.Visible);
  INoDiluyeOff.Visible := not(INoDiluyeOff.Visible);

  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.IDiluyeOffClick(Sender: TObject);
begin
  inherited;

  if not(IDiluyeOn.Visible) then
  begin
    GBDatosCongelacionDescongelacion.Enabled := true;
    RedibujarPanel(true);
    Diluye := true;
  end
  else
  begin
    GBDatosCongelacionDescongelacion.Enabled := false;
    RedibujarPanel(false);
    Diluye := false;
  end;

  IDiluyeOn.Visible := not(IDiluyeOn.Visible);
  IDiluyeOff.Visible := not(IDiluyeOff.Visible);
  INoDiluyeOn.Visible := not(INoDiluyeOn.Visible);
  INoDiluyeOff.Visible := not(INoDiluyeOff.Visible);

  PuedeTerminar;

end;

procedure TFEveExtraccionSemen.RedibujarPanel(valor : boolean);
begin
     if not(valor) then
     begin
        GBDatosCongelacionDescongelacion.Font.Color := clInactiveBorder;
        GBDescongelacionCeroHs.Font.Color := clInactiveBorder;
        GBCalidadSeminal.Font.Color := clInactiveBorder;
     end
     else
     begin
        GBDatosCongelacionDescongelacion.Font.Color := clBlack;
        GBDescongelacionCeroHs.Font.Color := clBlack;
        GBCalidadSeminal.Font.Color := clBlack;
     end;

     LFechaCongelacion.Enabled := valor;
     DTPFechaCongelacion.Enabled := valor;
     LHoraCongelacion.Enabled := valor;
     DTPHoraCongelacion.Enabled := valor;
     LNroDosis.Enabled := valor;
     JvENroDS.Enabled := valor;
     LDescongelCeroPorcViv.Enabled := valor;
     JvEDescongelCeroPorcViv.Enabled := valor;
     CBxVigorDescCero.Enabled := valor;
     LDescongelDosPorcViv.Enabled := valor;
     JvEDescongelDosPorcViv.Enabled := valor;
     CBxVigorDescDos.Enabled := valor;
     LResultado.Enabled := valor;
     DBLCBAResultado.Enabled := valor;
     LPartida.Enabled := valor;
     JvEPartida.Enabled := valor;
     LTermo.Enabled := valor;
     JvENombreTermo.Enabled := valor;
     LCanister.Enabled := valor;
     CBxNroCanister.Enabled := valor;
     LPosicion.Enabled := valor;
     CBxPosicion.Enabled := valor;
     Label14.Enabled := valor;
end;

procedure TFEveExtraccionSemen.CBxResponsableExtraccionChange(Sender: TObject);
var pos_b : integer;
    nomb, ape, aux :string;
begin
  inherited;

  if ((CBxResponsableExtraccion.Text <> 'RESPONSABLE') and (CBxResponsableExtraccion.Text <> '(TODOS)')) then
  begin
       aux := CBxResponsableExtraccion.Text;
       pos_b := LastDelimiter(' ',aux);
       nomb := Copy(aux,1,pos_b-1);
       Delete(aux, 1, pos_b);
       ape := aux;
       if IBQResponsableExtraccion.Locate('nombre;apellido',VarArrayOf([nomb,ape]),[]) then
           responsable_extraccion := IBQResponsableExtraccion.FieldValues['id_empleado'];
  end
  else
  begin
       responsable_extraccion := -1;
       CBxResponsableExtraccion.Items.Insert(0,'RESPONSABLE');
       CBxResponsableExtraccion.ItemIndex := 0;
       DelResponsableExtraccion := false;
  end;

end;

procedure TFEveExtraccionSemen.CBxResponsableExtraccionCloseUp(Sender: TObject);
begin
  inherited;
  
  if not(DelResponsableExtraccion) then
  begin
       CBxResponsableExtraccion.Items.Delete(0);
       DelResponsableExtraccion := true;
  end;

end;

procedure TFEveExtraccionSemen.CBxColorChange(Sender: TObject);
begin
  inherited;
  if ((CBxColor.Text <> 'COLOR SEMEN') and (CBxColor.Text <> '(TODOS)') and (CBxColor.Text <> '')) then
  begin
       color_semen := IBQColorSemen.Lookup('nombre_color_semen',CBxColor.Text,'id_color_semen');
  end
  else
  begin
       color_semen := -1;
       CBxColor.Items.Insert(0,'COLOR SEMEN');
       CBxColor.ItemIndex := 0;
       DelColorSemen := false;
  end;

end;

procedure TFEveExtraccionSemen.CBxColorCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelColorSemen) then
  begin
       CBxColor.Items.Delete(0);
       DelColorSemen := true;
  end;
end;

procedure TFEveExtraccionSemen.CBxVigorChange(Sender: TObject);
begin
  inherited;
  if ((CBxVigor.Text <> 'VIGOR') and (CBxVigor.Text <> '(TODOS)') and (CBxVigor.Text <> '')) then
  begin
       vigor_semen := IBQTiposVigor.Lookup('valor_tipo_vigor',CBxVigor.Text,'id_tipo_vigor');
  end
  else
  begin
       vigor_semen := -1;
       CBxVigor.Items.Insert(0,'VIGOR');
       CBxVigor.ItemIndex := 0;
       DelVigor := false;
  end;

end;

procedure TFEveExtraccionSemen.CBxVigorCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelVigor) then
  begin
       CBxVigor.Items.Delete(0);
       DelVigor := true;
  end;

end;

procedure TFEveExtraccionSemen.CBxVigorDescCeroChange(Sender: TObject);
begin
  inherited;
  if ((CBxVigorDescCero.Text <> 'VIGOR') and (CBxVigorDescCero.Text <> '(TODOS)') and (CBxVigorDescCero.Text <> '')) then
  begin
       vigor_desc_cero := IBQTiposVigor.Lookup('valor_tipo_vigor',CBxVigorDescCero.Text,'id_tipo_vigor');
  end
  else
  begin
       vigor_desc_cero := -1;
       CBxVigorDescCero.Items.Insert(0,'VIGOR');
       CBxVigorDescCero.ItemIndex := 0;
       DelVigorDescCero := false;
  end;

end;

procedure TFEveExtraccionSemen.CBxVigorDescCeroCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelVigorDescCero) then
  begin
       CBxVigorDescCero.Items.Delete(0);
       DelVigorDescCero := true;
  end;

end;

procedure TFEveExtraccionSemen.CBxVigorDescDosChange(Sender: TObject);
begin
  inherited;
  if ((CBxVigorDescDos.Text <> 'VIGOR') and (CBxVigorDescDos.Text <> '(TODOS)') and (CBxVigorDescDos.Text <> '')) then
  begin
       vigor_desc_dos := IBQTiposVigor.Lookup('valor_tipo_vigor',CBxVigorDescDos.Text,'id_tipo_vigor');
  end
  else
  begin
       vigor_desc_dos := -1;
       CBxVigorDescDos.Items.Insert(0,'VIGOR');
       CBxVigorDescDos.ItemIndex := 0;
       DelVigorDescDos := false;
  end;

end;

procedure TFEveExtraccionSemen.CBxVigorDescDosCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelVigorDescDos) then
  begin
       CBxVigorDescDos.Items.Delete(0);
       DelVigorDescDos := true;
  end;

end;

procedure TFEveExtraccionSemen.EDilusionChange(Sender: TObject);
var dilucion, volumen, diluyente : double;
begin
  inherited;

  dilucion := PasarAFloat(JvEDilusion.Text);
  volumen := PasarAFloat(JvEVolumenEyaculacion.Text);
  diluyente := dilucion - volumen;

  LDiluyenteNecesario.Caption := FloatToStr(diluyente);

  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.EDescongelCeroPorcVivChange(Sender: TObject);
var valor : double;
begin
  inherited;

  valor := PasarAFloat(JvEDescongelCeroPorcViv.Text);

  if ((valor < 0) or (valor > 70)) then
  begin
       MostrarMensaje(tmAdvertencia,'El valor de porcentaje debe estar entre 0 y 70 porciento.');
       EDescongelCeroPorcViv.Text := '';
       valor := 0;
  end;

  if not(Owner is TFRepListadoExtracciones) then
    PuedeTerminar;
end;

procedure TFEveExtraccionSemen.EDescongelDosPorcVivChange(Sender: TObject);
var valor : double;
begin
  inherited;

  valor := PasarAFloat(JvEDescongelDosPorcViv.Text);

  if ((valor < 0) or (valor > 70)) then
  begin
       MostrarMensaje(tmAdvertencia,'El valor de porcentaje debe estar entre 0 y 70 porciento.');
       EDescongelDosPorcViv.Text := '';
       valor := 0;
  end;

  if not(Owner is TFRepListadoExtracciones) then
    PuedeTerminar;
end;

procedure TFEveExtraccionSemen.EPosicionTermoChange(Sender: TObject);
var text : string;
begin
  inherited;
{
  text := EPosicionTermo.Text;
  if ((text <> 'A') and (text <> 'B') and (text <> '')) then
  begin
      MostrarMensaje(tmAdvertencia,'Los valores predefinidos para esta propiedad son:'+#13+'A - Arriba'+#13+'B - Abajo');
      EPosicionTermo.Text := '';
  end;}
end;

procedure TFEveExtraccionSemen.CBxNroCanisterChange(Sender: TObject);
begin
  inherited;

  canister := CBxNroCanister.Text;
end;

procedure TFEveExtraccionSemen.CBxPosicionChange(Sender: TObject);
begin
  inherited;

  posicion := CBxPosicion.Text;
end;

procedure TFEveExtraccionSemen.JvEEspermasXPajuelaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (not(Key in ['0' .. '9']) and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.JvEEspermasPotencialesXPajuelaKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;

  if (not(Key in ['0' .. '9']) and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.JvEDilusionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (not(Key in ['0' .. '9']) and (Key <> #13) and (Key <> #8)) then
     Key := #0;

end;

procedure TFEveExtraccionSemen.PuedeTerminar;
var v1, v2 : boolean;
begin
     v1 := false;
     v2 := false;

     JvTerminar.Visible := false;
     LBBTerminar.Visible := false;

     if not(NoCongela)then
     begin
         if (Diluye) then
         begin
              v1 := (JvENroEyaculacion.Text <> '') and (JvEVolumenEyaculacion.Text <> '') and (JvEMillonesEyaculacion.Text <> '') and (JvEEspermasPotencialesXPajuela.Text <> '') and (JvEEspermasXPajuela.Text <> '');
              v2 := true;
              //v2 := (JvENroDS.Text <> '') and (JvEDescongelCeroPorcViv.Text <> '') and (JvEDescongelDosPorcViv.Text <> '') and (JvEPartida.Text <> '');
              JvTerminar.Visible := (v1 and v2);
              LBBTerminar.Visible := (v1 and v2);
         end
         else
         begin
              v1 := (JvENroEyaculacion.Text <> '') and (JvEVolumenEyaculacion.Text <> '') and (JvEMillonesEyaculacion.Text <> '') and (JvEEspermasPotencialesXPajuela.Text <> '') and (JvEEspermasXPajuela.Text <> '');
              JvTerminar.Visible := v1;
              LBBTerminar.Visible := v1;
         end;
     end
     else
     begin
          v1 := (JvENroEyaculacion.Text <> '') and (JvEVolumenEyaculacion.Text <> '') and (JvEMillonesEyaculacion.Text <> '') and (JvEEspermasPotencialesXPajuela.Text <> '') and (JvEEspermasXPajuela.Text <> '') and (JvEDosisCompra.Text <> '');
          JvTerminar.Visible := v1;
          LBBTerminar.Visible := v1;
     end;
end;

procedure TFEveExtraccionSemen.JvENroEyaculacionChange(Sender: TObject);
begin
  inherited;

  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.JvEVolumenEyaculacionChange(
  Sender: TObject);
begin
  inherited;
  CalcularDilucionTotal;
  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.JvEMillonesEyaculacionChange(
  Sender: TObject);
begin
  inherited;
  CalcularDilucionTotal;
  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.JvEEspermasPotencialesXPajuelaChange(Sender: TObject);
begin
  inherited;
  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.JvEEspermasXPajuelaChange(Sender: TObject);
begin
  inherited;
  CalcularDilucionTotal;
  JvEEspermasPotencialesXPajuela.Text := JvEEspermasXPajuela.Text;
  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.JvENroDSChange(Sender: TObject);
begin
  inherited;

  if not(Owner is TFRepListadoExtracciones) then
    PuedeTerminar;
  
end;

procedure TFEveExtraccionSemen.JvEPartidaChange(Sender: TObject);
begin
  inherited;

  if not(Owner is TFRepListadoExtracciones) then
  begin
    PartidaCambio := true;
    PuedeTerminar;
  end;
  
end;

procedure TFEveExtraccionSemen.ActivarParaAprobar;
var nombre, apellido : string;
begin
    IBQDatosDeSemen.Close;
    IBQDatosDeSemen.ParamByName('evento').AsInteger := evento;
    IBQDatosDeSemen.Open;

    if (IBQDatosDeSemen.FieldValues['nro_eyaculacion'] <> null) then
    begin
        if (IBQDatosDeSemen.FieldValues['nro_eyaculacion'] <> 0) then
        begin
             if (IBQDatosDeSemen.FieldValues['congelo'] <> null) then
             begin
                 if (IBQDatosDeSemen.FieldValues['congelo'] = 'S') then
                    NoCongela := false
                 else
                    NoCongela := true;
             end;

             if (IBQDatosDeSemen.FieldValues['diluye_sn'] <> null) then
             begin
                if (IBQDatosDeSemen.FieldValues['diluye_sn'] = 'S') then
                  Diluye := true
                else
                  Diluye := false;
             end;

             if (IBQDatosDeSemen.FieldValues['fecha'] <> null) then
                DTPFechaExtraccion.Date := IBQDatosDeSemen.FieldValues['fecha'];

             if (IBQDatosDeSemen.FieldValues['nro_eyaculacion'] <> null) then
                JvENroEyaculacion.Text := IBQDatosDeSemen.FieldValues['nro_eyaculacion'];

             if (IBQDatosDeSemen.FieldValues['metodo_toma'] <> null) then
                DBLCBAMetodoToma.KeyValue := IBQDatosDeSemen.FieldValues['metodo_toma'];

             if (IBQDatosDeSemen.FieldValues['volumen_eyaculacion'] <> null) then
                JvEVolumenEyaculacion.Text := IBQDatosDeSemen.FieldValues['volumen_eyaculacion'];

             if (IBQDatosDeSemen.FieldValues['color_semen'] <> null) then
             begin
                CBxColor.ItemIndex := CBxColor.Items.IndexOf(IBQColorSemen.Lookup('id_color_semen',IBQDatosDeSemen.FieldValues['color_semen'],'nombre_color_semen'));
                color_semen := IBQDatosDeSemen.FieldValues['color_semen'];
             end;

             if (IBQDatosDeSemen.FieldValues['millones_esperm'] <> null) then
                JvEMillonesEyaculacion.Text := IBQDatosDeSemen.FieldValues['millones_esperm'];

             if (IBQDatosDeSemen.FieldValues['vigor_semen'] <> null) then
             begin
                CBxVigor.ItemIndex := CBxVigor.Items.IndexOf(IBQTiposVigor.Lookup('id_tipo_vigor',IBQDatosDeSemen.FieldValues['vigor_semen'],'valor_tipo_vigor'));
                vigor_semen := IBQDatosDeSemen.FieldValues['vigor_semen'];
             end;

             if (IBQDatosDeSemen.FieldValues['responsable'] <> null) then
             begin
                nombre := IBQResponsable.Lookup('id_empleado',IBQDatosDeSemen.FieldValues['responsable'],'nombre');
                apellido := IBQResponsable.Lookup('id_empleado',IBQDatosDeSemen.FieldValues['responsable'],'apellido');
                CBxResponsable.ItemIndex := CBxResponsable.Items.IndexOf(nombre + ' ' + apellido);
                responsable := IBQDatosDeSemen.FieldValues['responsable'];
             end;

             if (IBQDatosDeSemen.FieldValues['precio'] <> null) then
                JvEPrecio.Text := FloatToStr(IBQDatosDeSemen.FieldValues['precio']);

             if (IBQDatosDeSemen.FieldValues['responsable_extraccion'] <> null) then
             begin
                nombre := IBQResponsable.Lookup('id_empleado',IBQDatosDeSemen.FieldValues['responsable_extraccion'],'nombre');
                apellido := IBQResponsable.Lookup('id_empleado',IBQDatosDeSemen.FieldValues['responsable_extraccion'],'apellido');
                CBxResponsableExtraccion.ItemIndex := CBxResponsableExtraccion.Items.IndexOf(nombre + ' ' + apellido);
                responsable_extraccion := IBQDatosDeSemen.FieldValues['responsable_extraccion'];
             end;

             if (IBQDatosDeSemen.FieldValues['extraccion_centro'] <> null) then
               if (IBQDatosDeSemen.FieldValues['extraccion_centro'] <> -1) then
               begin
                  CBxCentroExtraccion.ItemIndex := CBxCentroExtraccion.Items.IndexOf(DMSoftvet.IBQCentrosInsem.Lookup('id_centro',IBQDatosDeSemen.FieldValues['extraccion_centro'],'nombre'));
                  centro_extrac := IBQDatosDeSemen.FieldValues['extraccion_centro'];
               end;

             if (IBQDatosDeSemen.FieldValues['extraccion_campo'] <> null) then
               if (IBQDatosDeSemen.FieldValues['extraccion_campo'] <> -1) then
               begin
                  CBxEstablecimiento.ItemIndex := CBxEstablecimiento.Items.IndexOf(IBQDatosEstablecimiento.Lookup('id_establecimiento',IBQDatosDeSemen.FieldValues['extraccion_campo'],'nombre'));
                  estable_extrac := IBQDatosDeSemen.FieldValues['extraccion_campo'];
               end;

             if (IBQDatosDeSemen.FieldValues['dilucion'] <> null) then
                JvEDilusion.Text := IBQDatosDeSemen.FieldValues['dilucion'];

             if (IBQDatosDeSemen.FieldValues['diluyente_necesario'] <> null) then
                LDiluyenteNecesario.Caption := IBQDatosDeSemen.FieldValues['diluyente_necesario'];

             if (IBQDatosDeSemen.FieldValues['fecha_congelacion'] <> null) then
                DTPFechaCongelacion.Date := IBQDatosDeSemen.FieldValues['fecha_congelacion'];

             if (IBQDatosDeSemen.FieldValues['hora_congelacion'] <> null) then
                DTPHoraCongelacion.Time := IBQDatosDeSemen.FieldValues['hora_congelacion'];

             if (IBQDatosDeSemen.FieldValues['nro_ds'] <> null) then
                JvENroDS.Text := IBQDatosDeSemen.FieldValues['nro_ds'];

             if (IBQDatosDeSemen.FieldValues['descongel_cero_hs_porc_viv'] <> null) then
                JvEDescongelCeroPorcViv.Text := IBQDatosDeSemen.FieldValues['descongel_cero_hs_porc_viv'];

             if (IBQDatosDeSemen.FieldValues['descongel_cero_hs_vig'] <> null) then
             begin
                CBxVigorDescCero.ItemIndex := CBxVigorDescCero.Items.IndexOf(IBQTiposVigorDescCero.Lookup('id_tipo_vigor',IBQDatosDeSemen.FieldValues['descongel_cero_hs_vig'],'valor_tipo_vigor'));
                vigor_desc_cero := IBQDatosDeSemen.FieldValues['descongel_cero_hs_vig'];
             end;

             if (IBQDatosDeSemen.FieldValues['descongel_dos_hs_porc_viv'] <> null) then
                JvEDescongelDosPorcViv.Text := IBQDatosDeSemen.FieldValues['descongel_dos_hs_porc_viv'];

             if (IBQDatosDeSemen.FieldValues['descongel_dos_hs_vig'] <> null) then
             begin
                CBxVigorDescDos.ItemIndex := CBxVigorDescDos.Items.IndexOf(IBQTiposVigorDescDos.Lookup('id_tipo_vigor',IBQDatosDeSemen.FieldValues['descongel_dos_hs_vig'],'valor_tipo_vigor'));
                vigor_desc_dos := IBQDatosDeSemen.FieldValues['descongel_dos_hs_vig'];
             end;

             if (IBQDatosDeSemen.FieldValues['termo'] <> null) then
                JvENombreTermo.Text := IBQDatosDeSemen.FieldValues['termo'];

             if (IBQDatosDeSemen.FieldValues['canister'] <> null) then
             begin
                canister := IBQDatosDeSemen.FieldValues['canister'];
                CBxNroCanister.ItemIndex := CBxNroCanister.Items.IndexOf(IBQDatosDeSemen.FieldValues['canister']);
             end;

             if (IBQDatosDeSemen.FieldValues['posicion_termo'] <> null) then
             begin
                posicion := IBQDatosDeSemen.FieldValues['posicion_termo'];
                CBxPosicion.ItemIndex := CBxPosicion.Items.IndexOf(IBQDatosDeSemen.FieldValues['posicion_termo']);
             end;

             if (IBQDatosDeSemen.FieldValues['termo_provisorio'] <> null) then
             begin
                JvENombreTermoProv.Text := IBQDatosDeSemen.FieldValues['termo_provisorio'];
             end;

             if (IBQDatosDeSemen.FieldValues['canister_provisorio'] <> null) then
             begin
                canister_prov := IBQDatosDeSemen.FieldValues['canister_provisorio'];
                CBxNroCanisterProv.ItemIndex := CBxNroCanisterProv.Items.IndexOf(IBQDatosDeSemen.FieldValues['canister_provisorio']);
             end;

             if (IBQDatosDeSemen.FieldValues['posicion_termo_provisorio'] <> null) then
             begin
                posicion_prov := IBQDatosDeSemen.FieldValues['posicion_termo_provisorio'];
                CBxPosicionProv.ItemIndex := CBxPosicionProv.Items.IndexOf(IBQDatosDeSemen.FieldValues['posicion_termo_provisorio']);
             end;

             if (IBQDatosDeSemen.FieldValues['espermas_por_pajuela'] <> null) then
                JvEEspermasXPajuela.Text := IBQDatosDeSemen.FieldValues['espermas_por_pajuela'];

             if (IBQDatosDeSemen.FieldValues['espermas_potenciales_pajuela'] <> null) then
                JvEEspermasPotencialesXPajuela.Text := IBQDatosDeSemen.FieldValues['espermas_potenciales_pajuela'];

             if (IBQDatosDeSemen.FieldValues['partida'] <> null) then
                JvEPartida.Text := IBQDatosDeSemen.FieldValues['partida'];

             if (IBQDatosDeSemen.FieldValues['id_resultado_final'] <> null) then
                DBLCBAResultado.KeyValue := IBQDatosDeSemen.FieldValues['id_resultado_final'];

             if (IBQDatosDeSemen.FieldValues['observacion'] <> null) then
                MAObservacion.Text := IBQDatosDeSemen.FieldValues['observacion'];

             if (IBQDatosDeSemen.FieldValues['observa_datos'] <> null) then
                MAObservacionDatos.Text := IBQDatosDeSemen.FieldValues['observa_datos'];

             if (IBQDatosDeSemen.FieldValues['observa_lugar'] <> null) then
                MAObservacionLugarExtraccion.Text := IBQDatosDeSemen.FieldValues['observa_lugar'];

             LResponsableAprob.Visible := true;
             CBxResponsableAprob.Visible := true;
             GBCalidadSeminal.Height := 75;
        end;
    end;

//---------- Fragmento modificado
    
    if not(modifica) then
       BloquearNoEditables;

    if (editable) then
      BloquearColumnas;
      
end;

procedure TFEveExtraccionSemen.BloquearColumnas;
var i : integer;
begin
    for i := 0 to GBDatosExtraccion.ControlCount-1 do
    begin
         if (GBDatosExtraccion.Controls[i] is TLabel) then
            (GBDatosExtraccion.Controls[i] as TLabel).Enabled := false;

         if (GBDatosExtraccion.Controls[i] is TComboBox) then
            (GBDatosExtraccion.Controls[i] as TComboBox).Enabled := false;

         if (GBDatosExtraccion.Controls[i] is TJvEdit) then
            (GBDatosExtraccion.Controls[i] as TJvEdit).Enabled := false;

         if (GBDatosExtraccion.Controls[i] is TDBLookupComboBoxAuto) then
            (GBDatosExtraccion.Controls[i] as TDBLookupComboBoxAuto).Enabled := false;

         if (GBDatosExtraccion.Controls[i] is TDateTimePicker) then
            (GBDatosExtraccion.Controls[i] as TDateTimePicker).Enabled := false;
    end;

    for i := 0 to GBLugarExtraccion.ControlCount-1 do
    begin
         if (GBLugarExtraccion.Controls[i] is TLabel) then
            (GBLugarExtraccion.Controls[i] as TLabel).Enabled := false;

         if (GBLugarExtraccion.Controls[i] is TComboBox) then
            (GBLugarExtraccion.Controls[i] as TComboBox).Enabled := false;

         if (GBLugarExtraccion.Controls[i] is TJvEdit) then
            (GBLugarExtraccion.Controls[i] as TJvEdit).Enabled := false;

         if (GBLugarExtraccion.Controls[i] is TDBLookupComboBoxAuto) then
            (GBLugarExtraccion.Controls[i] as TDBLookupComboBoxAuto).Enabled := false;

         if (GBLugarExtraccion.Controls[i] is TDateTimePicker) then
            (GBLugarExtraccion.Controls[i] as TDateTimePicker).Enabled := false;

         if (GBLugarExtraccion.Controls[i] is TImage) then
            (GBLugarExtraccion.Controls[i] as TImage).Enabled := false;
    end;

    for i := 0 to GBUbicacionProvisoria.ControlCount-1 do
    begin
         if (GBUbicacionProvisoria.Controls[i] is TLabel) then
            (GBUbicacionProvisoria.Controls[i] as TLabel).Enabled := false;

         if (GBUbicacionProvisoria.Controls[i] is TComboBox) then
            (GBUbicacionProvisoria.Controls[i] as TComboBox).Enabled := false;

         if (GBUbicacionProvisoria.Controls[i] is TJvEdit) then
            (GBUbicacionProvisoria.Controls[i] as TJvEdit).Enabled := false;
    end;

    LDiluyenteNecesario.Enabled := false;
        
end;

procedure TFEveExtraccionSemen.BloquearNoEditables;
var i : integer;
begin
    for i := 0 to GBDatosExtraccion.ControlCount-1 do
    begin
         if (GBDatosExtraccion.Controls[i] is TLabel) then
            (GBDatosExtraccion.Controls[i] as TLabel).Enabled := false;

         if (GBDatosExtraccion.Controls[i] is TComboBox) then
            (GBDatosExtraccion.Controls[i] as TComboBox).Enabled := false;

         if (GBDatosExtraccion.Controls[i] is TJvEdit) then
            (GBDatosExtraccion.Controls[i] as TJvEdit).Enabled := false;

         if (GBDatosExtraccion.Controls[i] is TDBLookupComboBoxAuto) then
            (GBDatosExtraccion.Controls[i] as TDBLookupComboBoxAuto).Enabled := false;

         if (GBDatosExtraccion.Controls[i] is TDateTimePicker) then
            (GBDatosExtraccion.Controls[i] as TDateTimePicker).Enabled := false;
    end;

    for i := 0 to GBLugarExtraccion.ControlCount-1 do
    begin
         if (GBLugarExtraccion.Controls[i] is TLabel) then
            (GBLugarExtraccion.Controls[i] as TLabel).Enabled := false;

         if (GBLugarExtraccion.Controls[i] is TComboBox) then
            (GBLugarExtraccion.Controls[i] as TComboBox).Enabled := false;

         if (GBLugarExtraccion.Controls[i] is TJvEdit) then
            (GBLugarExtraccion.Controls[i] as TJvEdit).Enabled := false;

         if (GBLugarExtraccion.Controls[i] is TDBLookupComboBoxAuto) then
            (GBLugarExtraccion.Controls[i] as TDBLookupComboBoxAuto).Enabled := false;

         if (GBLugarExtraccion.Controls[i] is TDateTimePicker) then
            (GBLugarExtraccion.Controls[i] as TDateTimePicker).Enabled := false;

         if (GBLugarExtraccion.Controls[i] is TImage) then
            (GBLugarExtraccion.Controls[i] as TImage).Enabled := false;
    end;

    for i := 0 to GBDatosCongelacionDescongelacion.ControlCount-1 do
    begin
         if (GBDatosCongelacionDescongelacion.Controls[i] is TLabel) then
            (GBDatosCongelacionDescongelacion.Controls[i] as TLabel).Enabled := false;

         if (GBDatosCongelacionDescongelacion.Controls[i] is TComboBox) then
            (GBDatosCongelacionDescongelacion.Controls[i] as TComboBox).Enabled := false;

         if (GBDatosCongelacionDescongelacion.Controls[i] is TJvEdit) then
            (GBDatosCongelacionDescongelacion.Controls[i] as TJvEdit).Enabled := false;

         if (GBDatosCongelacionDescongelacion.Controls[i] is TDBLookupComboBoxAuto) then
            (GBDatosCongelacionDescongelacion.Controls[i] as TDBLookupComboBoxAuto).Enabled := false;

         if (GBDatosCongelacionDescongelacion.Controls[i] is TDateTimePicker) then
            (GBDatosCongelacionDescongelacion.Controls[i] as TDateTimePicker).Enabled := false;
    end;

    for i := 0 to GBDescongelacionCeroHs.ControlCount-1 do
    begin
         if (GBDescongelacionCeroHs.Controls[i] is TLabel) then
            (GBDescongelacionCeroHs.Controls[i] as TLabel).Enabled := false;

         if (GBDescongelacionCeroHs.Controls[i] is TComboBox) then
            (GBDescongelacionCeroHs.Controls[i] as TComboBox).Enabled := false;

         if (GBDescongelacionCeroHs.Controls[i] is TJvEdit) then
            (GBDescongelacionCeroHs.Controls[i] as TJvEdit).Enabled := false;

         if (GBDescongelacionCeroHs.Controls[i] is TDBLookupComboBoxAuto) then
            (GBDescongelacionCeroHs.Controls[i] as TDBLookupComboBoxAuto).Enabled := false;

         if (GBDescongelacionCeroHs.Controls[i] is TDateTimePicker) then
            (GBDescongelacionCeroHs.Controls[i] as TDateTimePicker).Enabled := false;
    end;

    for i := 0 to GBDescongelacionDosHs.ControlCount-1 do
    begin
         if (GBDescongelacionDosHs.Controls[i] is TLabel) then
            (GBDescongelacionDosHs.Controls[i] as TLabel).Enabled := false;

         if (GBDescongelacionDosHs.Controls[i] is TComboBox) then
            (GBDescongelacionDosHs.Controls[i] as TComboBox).Enabled := false;

         if (GBDescongelacionDosHs.Controls[i] is TJvEdit) then
            (GBDescongelacionDosHs.Controls[i] as TJvEdit).Enabled := false;

         if (GBDescongelacionDosHs.Controls[i] is TDBLookupComboBoxAuto) then
            (GBDescongelacionDosHs.Controls[i] as TDBLookupComboBoxAuto).Enabled := false;

         if (GBDescongelacionDosHs.Controls[i] is TDateTimePicker) then
            (GBDescongelacionDosHs.Controls[i] as TDateTimePicker).Enabled := false;
    end;

    for i := 0 to GBUbicacionProvisoria.ControlCount-1 do
    begin
         if (GBUbicacionProvisoria.Controls[i] is TLabel) then
            (GBUbicacionProvisoria.Controls[i] as TLabel).Enabled := false;

         if (GBUbicacionProvisoria.Controls[i] is TComboBox) then
            (GBUbicacionProvisoria.Controls[i] as TComboBox).Enabled := false;

         if (GBUbicacionProvisoria.Controls[i] is TJvEdit) then
            (GBUbicacionProvisoria.Controls[i] as TJvEdit).Enabled := false;
    end;

    LPartida.Enabled := false;
    JvEPartida.Enabled := false;

    LDiluyenteNecesario.Enabled := false;

    ISemenCongelaOff.Enabled := false;
    ISemenCongelaOn.Enabled := false;
    LSemenCongela.Enabled := false;
    ISemenNoCongelaOff.Enabled := false;
    ISemenNoCongelaOn.Enabled := false;
    LSemenNoCongela.Enabled := false;

end;

procedure TFEveExtraccionSemen.CBxResponsableAprobChange(Sender: TObject);
var pos_b : integer;
    nomb, ape, aux :string;
begin
  inherited;

  if ((CBxResponsableAprob.Text <> 'RESPONSABLE') and (CBxResponsableAprob.Text <> '(TODOS)')) then
  begin
       aux := CBxResponsableAprob.Text;
       pos_b := LastDelimiter(' ',aux);
       nomb := Copy(aux,1,pos_b-1);
       Delete(aux, 1, pos_b);
       ape := aux;
       if IBQResponsable.Locate('nombre;apellido',VarArrayOf([nomb,ape]),[]) then
           responsableAprob := IBQResponsable.FieldValues['id_empleado'];
  end
  else
  begin
       responsableAprob := -1;
       CBxResponsableAprob.Items.Insert(0,'RESPONSABLE');
       CBxResponsableAprob.ItemIndex := 0;
       DelResponsableAprob := false;
  end;
end;

procedure TFEveExtraccionSemen.CBxResponsableAprobCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelResponsableAprob) then
  begin
       CBxResponsableAprob.Items.Delete(0);
       DelResponsableAprob := true; 
  end;
end;

procedure TFEveExtraccionSemen.JvENombreTermoChange(Sender: TObject);
begin
  inherited;

  hayCambioTermo := true;
end;

procedure TFEveExtraccionSemen.ATerminarExecute(Sender: TObject);
var
  F : TFCertificadoCalidadOrig;
begin

  if not(Owner is TFPartidasSemenAprobar) then
  begin
         if not(Owner is TFRepListadoExtracciones) then
         begin
              if ((JvEDosisCompra.Text = '') and (GBDatosVenta.Visible)) then
                   MostrarMensaje(tmError,'No se indicó la cantidad de dosis vendidas.')
              else
              begin
                  CargarOtro := PuedeGrabar;
                  inherited;
                  if MostrarMensaje(tmConsulta,'Desea imprimir el certificado de calidad para la extración?') = mrYes then
                  begin
                    F := TFCertificadoCalidadOrig.Create(self);
                    F.id_extraccion := IBQSPEventoInd.FieldValues['evento'];
                    F.ShowModal;
                    F.Destroy;
                  end;
              end;
         end
         else  //si viene de listado de extracciones
         begin
              IBQRNModificarExtraccion.Close;
              IBQRNModificarExtraccion.ParamByName('partida').AsString := JvEPartida.Text;
              IBQRNModificarExtraccion.ParamByName('fecha_extraccion').AsDate := DTPFechaExtraccion.Date;
              IBQRNModificarExtraccion.ParamByName('animal').AsInteger := IDAnimal;
              IBQRNModificarExtraccion.Open;

              if ((IBQRNModificarExtraccion.FieldValues['mensaje'] = 'N') or not(PartidaCambio)) then
              begin
                   propaga := false;
                   Paso := true;
                   AplicarModificacion;
              end
              else
              begin
                   if (PartidaCambio) then
                   begin
                      if (MostrarMensaje(tmConsulta,'Esta partida ha intervenido en eventos de baja de semen.'+#13+'¿Desea modificar este número de partida?') = mrYes) then
                      begin
                          propaga := true;
                          Paso := true;
                          AplicarModificacion;
                      end;
                   end
                   else
                   begin
                       propaga := false;
                       Paso := true;
                       AplicarModificacion;
                   end;
              end;
         end;
  end
  else    //si viene de partidas por aprobar
  begin

      IBQRNModificarExtraccion.Close;
      IBQRNModificarExtraccion.ParamByName('partida').AsString := JvEPartida.Text;
      IBQRNModificarExtraccion.ParamByName('fecha_extraccion').AsDate := DTPFechaExtraccion.Date;
      IBQRNModificarExtraccion.ParamByName('animal').AsInteger := IDAnimal;
      IBQRNModificarExtraccion.Open;

      if ((IBQRNModificarExtraccion.FieldValues['mensaje'] = 'N') or not(PartidaCambio)) then
      begin
           propaga := false;
           Paso := true;
           AplicarModificacion;
      end
      else
      begin
           if (PartidaCambio) then
           begin
              if (MostrarMensaje(tmConsulta,'Esta partida ha intervenido en eventos de baja de semen.'+#13+'¿Desea modificar este número de partida?') = mrYes) then
              begin
                  propaga := true;
                  Paso := true;
                  AplicarModificacion;
              end;
           end
           else
           begin
               propaga := false;
               Paso := true;
               AplicarModificacion;
           end;
      end;
  end;


  if (GBDatosVenta.Visible) then
  begin
       if (JvEDosisCompra.Text <> '') then
       begin
            try
              IBQLimpiarAuxiliar.Close;
              IBQLimpiarAuxiliar.Open;

              FPrincipal.IBTPrincipal.CommitRetaining;
            except
              FPrincipal.IBTPrincipal.RollbackRetaining;
            end;

            try
              IBQInsertAuxiliar.Close;
              IBQInsertAuxiliar.ParamByName('animal').AsInteger := IDAnimal;
              IBQInsertAuxiliar.ParamByName('partida').AsString := JvEPartidaCompra.Text;
              IBQInsertAuxiliar.ParamByName('evento').AsInteger:= IBQSPEventoInd.FieldValues['evento'];
              IBQInsertAuxiliar.Open;

              FPrincipal.IBTPrincipal.CommitRetaining;
            except
              FPrincipal.IBTPrincipal.RollbackRetaining;
            end;

            GuardarDatosVenta;
            GenerarCertificadoPartida;
       end;
  end;

end;

procedure TFEveExtraccionSemen.LResponsableExtraccionClick(Sender: TObject);
begin
  inherited;

  LResponsableClick(sender);
  
  LimpiarCombos(1);
  CargarCombos(1);
end;

procedure TFEveExtraccionSemen.CalcularDilucionTotal;
var vol, dilu, tot_esp : double;
    concen, epp, aux: integer;
begin

     if (JvEVolumenEyaculacion.Text <> '') then
        vol := PasarAFloat(JvEVolumenEyaculacion.Text)
     else
        vol := 0;

     if (JvEMillonesEyaculacion.Text <> '') then
        concen := StrToInt(JvEMillonesEyaculacion.Text)
     else
        concen := 0;

     if (JvEEspermasXPajuela.Text <> '') then
        epp := StrToInt(JvEEspermasXPajuela.Text)
     else
        epp := 0;

     tot_esp := vol * concen;

     aux := 2 * epp;

     if (aux <> 0) then
        dilu := Trunc(tot_esp / aux)
     else
        dilu := 0;

     JvEDilusion.Text := FloatToStr(dilu);

     EDilusionChange(JvEDilusion);

end;

procedure TFEveExtraccionSemen.ISemenNoCongelaOffClick(Sender: TObject);
begin
  inherited;

  if (ISemenNoCongelaOff.Visible) then
  begin
      ISemenNoCongelaOff.Visible := false;
      ISemenNoCongelaOn.Visible := true;

      ISemenCongelaOn.Visible := false;
      ISemenCongelaOff.Visible := true;

      NoCongela := true;
  end
  else
  begin
      ISemenNoCongelaOff.Visible := true;
      ISemenNoCongelaOn.Visible := false;

      ISemenCongelaOn.Visible := true;
      ISemenCongelaOff.Visible := false;

      NoCongela := false;
  end;
  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.ISemenNoCongelaOnClick(Sender: TObject);
begin
  inherited;

  if (ISemenNoCongelaOn.Visible) then
  begin
      ISemenNoCongelaOn.Visible := false;
      ISemenNoCongelaOff.Visible := true;

      ISemenCongelaOn.Visible := true;
      ISemenCongelaOff.Visible := false;

      NoCongela := false;
  end
  else
  begin
      ISemenNoCongelaOn.Visible := true;
      ISemenNoCongelaOff.Visible := false;

      ISemenCongelaOn.Visible := false;
      ISemenCongelaOff.Visible := true;

      NoCongela := true;
  end;
  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.ISemenCongelaOffClick(Sender: TObject);
begin
  inherited;

  if (ISemenCongelaOff.Visible) then
  begin
       ISemenCongelaOn.Visible := true;
       ISemenCongelaOff.Visible := false;

       ISemenNoCongelaOn.Visible := false;
       ISemenNoCongelaOff.Visible := true;

       NoCongela := false;
  end
  else
  begin
       ISemenCongelaOn.Visible := false;
       ISemenCongelaOff.Visible := true;

       ISemenNoCongelaOn.Visible := true;
       ISemenNoCongelaOff.Visible := false;

       NoCongela := true;
  end;
  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.ISemenCongelaOnClick(Sender: TObject);
begin
  inherited;

  if (ISemenCongelaOn.Visible) then
  begin
       ISemenCongelaOn.Visible := false;
       ISemenCongelaOff.Visible := true;

       ISemenNoCongelaOn.Visible := true;
       ISemenNoCongelaOff.Visible := false;

       NoCongela := true;
  end
  else
  begin
       ISemenCongelaOn.Visible := true;
       ISemenCongelaOff.Visible := false;

       ISemenNoCongelaOn.Visible := false;
       ISemenNoCongelaOff.Visible := true;

       NoCongela := false;
  end;
  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.CargarDatosCliente;
var i : integer;
begin
    IBQDatosCliente.Close;
    IBQDatosCliente.Open;
    IBQDatosCliente.First;

    CBxCliente.Items.Insert(0,'CLIENTE');
    CBxCliente.Items.Insert(1,'(TODOS)');
    i := 2;
    while not(IBQDatosCliente.Eof) do
    begin
         CBxCliente.Items.Insert(i,IBQDatosCliente.FieldValues['nombre_cliente']+' '+IBQDatosCliente.FieldValues['apellido_cliente']);
         IBQDatosCliente.Next;
         Inc(i);
    end;
    CBxCliente.ItemIndex := 0;
    CBxCliente.DropDownCount := i;

end;

procedure TFEveExtraccionSemen.LClienteClick(Sender: TObject);
var F : TFDatosClienteComprador;
begin
  inherited;

  F := TFDatosClienteComprador.Create(self);
  F.ShowModal;
  F.Destroy;

  CBxCliente.Clear;
  CargarDatosCliente;

end;

procedure TFEveExtraccionSemen.LClienteMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LCliente.Font.Color:= $00606C02;
      LCliente.Font.Style:= [fsBold,fsUnderline];
  end;

end;

procedure TFEveExtraccionSemen.LClienteMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
      LCliente.Font.Color:= clWindowText;
      LCliente.Font.Style:= [fsUnderline];
  end;

end;

procedure TFEveExtraccionSemen.LSemenNoCongelaClick(Sender: TObject);
begin
  inherited;

  if (ISemenNoCongelaOff.Visible) then
  begin
      GBDatosCongelacionDescongelacion.Align := alNone;
      GBDatosCongelacionDescongelacion.Visible := false;

      GBDatosVenta.Align := alLeft;
      GBDatosVenta.Visible := true;

      ISemenNoCongelaOff.Visible := false;
      ISemenNoCongelaOn.Visible := true;
      ISemenCongelaOff.Visible := true;
      ISemenCongelaOn.Visible := false;

      NoCongela := true;

      IDiluyeOff.Visible := false;
      IDiluyeOn.Visible := false;
      LDiluye.Visible := false;

      INoDiluyeOff.Visible := false;
      INoDiluyeOn.Visible := false;
      LNoDiluye.Visible := false;

  end
  else
  begin
      GBDatosCongelacionDescongelacion.Align := alLeft;
      GBDatosCongelacionDescongelacion.Visible := true;

      GBDatosVenta.Align := alNone;
      GBDatosVenta.Visible := false;

      ISemenNoCongelaOff.Visible := true;
      ISemenNoCongelaOn.Visible := false;
      ISemenCongelaOff.Visible := false;
      ISemenCongelaOn.Visible := true;

      NoCongela := false;

      IDiluyeOff.Visible := false;
      IDiluyeOn.Visible := true;
      LDiluye.Visible := true;

      Diluye := true;

      INoDiluyeOff.Visible := true;
      INoDiluyeOn.Visible := false;
      LNoDiluye.Visible := true;

  end;

  PuedeTerminar;

end;

procedure TFEveExtraccionSemen.LSemenCongelaClick(Sender: TObject);
begin
  inherited;

  if (ISemenCongelaOff.Visible) then
  begin
      GBDatosCongelacionDescongelacion.Align := alLeft;
      GBDatosCongelacionDescongelacion.Visible := true;

      GBDatosVenta.Align := alNone;
      GBDatosVenta.Visible := false;

      ISemenCongelaOff.Visible := false;
      ISemenCongelaOn.Visible := true;
      ISemenNoCongelaOff.Visible := true;
      ISemenNoCongelaOn.Visible := false;

      NoCongela := false;

      IDiluyeOff.Visible := false;
      IDiluyeOn.Visible := true;
      LDiluye.Visible := true;

      Diluye := true;

      INoDiluyeOff.Visible := true;
      INoDiluyeOn.Visible := false;
      LNoDiluye.Visible := true;

  end
  else
  begin
      GBDatosCongelacionDescongelacion.Align := alNone;
      GBDatosCongelacionDescongelacion.Visible := false;

      GBDatosVenta.Align := alLeft;
      GBDatosVenta.Visible := true;

      ISemenCongelaOff.Visible := true;
      ISemenCongelaOn.Visible := false;
      ISemenNoCongelaOff.Visible := false;
      ISemenNoCongelaOn.Visible := true;

      NoCongela := true;

      IDiluyeOff.Visible := false;
      IDiluyeOn.Visible := false;
      LDiluye.Visible := false;

      INoDiluyeOff.Visible := false;
      INoDiluyeOn.Visible := false;
      LNoDiluye.Visible := false;

  end;
  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.GuardarDatosVenta;
begin
  IBQGetSemen.Close;
  IBQGetSemen.ParamByName('id').AsInteger := IDAnimal;
  IBQGetSemen.Open;

  IBSPDatosSemen.ParamByName('FECHA').Value := DTPFechaCompra.Date;

  if(JvEDosisCompra.Text = '')then
      IBSPDatosSemen.ParamByName('NUEVACANTIDAD').AsInteger := 0
  else
      IBSPDatosSemen.ParamByName('NUEVACANTIDAD').AsInteger := StrToInt(JvEDosisCompra.Text);

  if(JvECertificado.Text = '')then
      IBSPDatosSemen.ParamByName('NUEVOCERTIFICADO').AsInteger := 0
  else
      IBSPDatosSemen.ParamByName('NUEVOCERTIFICADO').AsInteger := StrToInt(JvECertificado.Text);

  if (JvEPrecioCompra.Visible) then
  begin
    if(JvEPrecioCompra.Text = '')then
        IBSPDatosSemen.ParamByName('PRECIO').Value := 0
    else
        IBSPDatosSemen.ParamByName('PRECIO').Value := StrToFloat(JvEPrecioCompra.Text);
  end
  else
    IBSPDatosSemen.ParamByName('PRECIO').Value := 0;

  IBSPDatosSemen.ParamByName('SEMEN').value := IBQGetSemen.FieldValues['id_semen'];
  IBSPDatosSemen.ParamByName('TIPO').Value := 2;

  IBSPDatosSemen.ParamByName('CENTRO_INSEMINACION').Value := Null;
  IBSPDatosSemen.ParamByName('OBSERVACION').value := Null;

  if (cliente <> -1) then
    IBSPDatosSemen.ParamByName('CLIENTE').Value := cliente
  else
    IBSPDatosSemen.ParamByName('CLIENTE').Value := Null;

  IBSPDatosSemen.ParamByName('TIPO_BAJA').Value := 1;

  if (NoCongela) then
    IBSPDatosSemen.ParamByName('CONGELO').AsString := 'N'
  else
    IBSPDatosSemen.ParamByName('CONGELO').AsString := 'S';


  IBSPDatosSemen.ExecProc;
end;

procedure TFEveExtraccionSemen.CBxClienteChange(Sender: TObject);
var pos_b : integer;
    nomb, ape, aux :string;
begin
  inherited;

  if ((CBxCliente.Text <> 'CLIENTE') and (CBxCliente.Text <> '(TODOS)') and (CBxCliente.Text <> '')) then
  begin
       aux := CBxCliente.Text;
       pos_b := LastDelimiter(' ',aux);
       nomb := Copy(aux,1,pos_b-1);
       Delete(aux, 1, pos_b);
       ape := aux;
       if IBQDatosCliente.Locate('nombre_cliente;apellido_cliente',VarArrayOf([nomb,ape]),[]) then
           cliente := IBQDatosCliente.FieldValues['id_cliente'];
  end
  else
  begin
       cliente := -1;
       CBxCliente.Items.Insert(0,'CLIENTE');
       CBxCliente.ItemIndex := 0;
       DelCliente := false;
  end;
end;

procedure TFEveExtraccionSemen.CBxClienteCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelCliente) then
  begin
       CBxCliente.Items.Delete(0);
       DelCliente := true
  end;
end;

procedure TFEveExtraccionSemen.GenerarCertificadoPartida;
var F : TFCertificadoPartida;
begin

    F := TFCertificadoPartida.Create(self);
    F.ShowModal;
    F.Destroy;
end;


procedure TFEveExtraccionSemen.DBLCBAMetodoTomaCloseUp(Sender: TObject);
begin
  inherited;

  PuedeTerminar;
end;

procedure TFEveExtraccionSemen.DTPFechaCongelacionExit(Sender: TObject);
var fec_con, fec_ext : integer;
begin
  inherited;

  fec_con := Trunc(DTPFechaCongelacion.Date);
  fec_ext := Trunc(DTPFechaExtraccion.Date);

  if (fec_con < fec_ext) then
    MostrarMensaje(tmAdvertencia,'Se ha generado una inconsistencia.'+#13+'La fecha de congelación es anterior a la fecha de extracción.');
end;

procedure TFEveExtraccionSemen.DTPFechaCompraExit(Sender: TObject);
var fec_com, fec_ext : integer;
begin
  inherited;

  fec_com := Trunc(DTPFechaCompra.Date);
  fec_ext := Trunc(DTPFechaExtraccion.Date);

  if (fec_com < fec_ext) then
    MostrarMensaje(tmAdvertencia,'Se ha generado una inconsistencia.'+#13+'La fecha de venta es anterior a la fecha de extracción.');
end;

procedure TFEveExtraccionSemen.AplicarModificacion;
begin
     try
        IBQModificarDatosExtraccion.Close;
        IBQModificarDatosExtraccion.ParamByName('FECHA_EXTRACCION').AsDate  := DTPFechaExtraccion.Date;
        IBQModificarDatosExtraccion.ParamByName('ESTABLECIMIENTO').AsInteger  := FPrincipal.EstablecimientoActual;
        IBQModificarDatosExtraccion.ParamByName('ID_ANIMAL').AsInteger  := IDAnimal;
        IBQModificarDatosExtraccion.ParamByName('TIPO_ANIMAL').AsString  := 'I';

        if (JvENroEyaculacion.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('NRO_EYACULACION').AsInteger  := StrToInt(JvENroEyaculacion.Text)
        else
            IBQModificarDatosExtraccion.ParamByName('NRO_EYACULACION').AsInteger  := 0;

        IBQModificarDatosExtraccion.ParamByName('HORA_EYACULACION').AsTime := DTPHoraEyaculacion.Time;

        if (JvEVolumenEyaculacion.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('VOLUMEN_EYACULACION').AsFloat := PasarAFloat(JvEVolumenEyaculacion.Text)
        else
            IBQModificarDatosExtraccion.ParamByName('VOLUMEN_EYACULACION').Value := null;

        if (color_semen <> -1) then
            IBQModificarDatosExtraccion.ParamByName('COLOR_SEMEN').AsInteger := color_semen
        else
            IBQModificarDatosExtraccion.ParamByName('COLOR_SEMEN').Value := null;

        if (vigor_semen <> -1) then
            IBQModificarDatosExtraccion.ParamByName('VIGOR_SEMEN').AsInteger := vigor_semen
        else
            IBQModificarDatosExtraccion.ParamByName('VIGOR_SEMEN').Value := null;

        if (JvEMillonesEyaculacion.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('MILLONES_ESPERM').AsInteger := StrToInt(JvEMillonesEyaculacion.Text)
        else
            IBQModificarDatosExtraccion.ParamByName('MILLONES_ESPERM').Value := null;

        IBQModificarDatosExtraccion.ParamByName('CC_TOTAL').Value := null;

        if (not(NoCongela) and (Diluye)) then
            IBQModificarDatosExtraccion.ParamByName('FECHA_CONGELACION').AsDate := DTPFechaCongelacion.Date
        else
            IBQModificarDatosExtraccion.ParamByName('FECHA_CONGELACION').Value := null;


        IBQModificarDatosExtraccion.ParamByName('HORA_CONGELACION').AsTime := DTPHoraCongelacion.Time;

        if not(NoCongela) then
        begin
            if (JvENroDS.Text <> '') then
                IBQModificarDatosExtraccion.ParamByName('NRO_DS').AsInteger := StrToInt(JvENroDS.Text)
            else
                IBQModificarDatosExtraccion.ParamByName('NRO_DS').Value := null;
        end
        else
        begin
            if (JvEDosisCompra.Text <> '') then
                IBQModificarDatosExtraccion.ParamByName('NRO_DS').AsInteger := StrToInt(JvEDosisCompra.Text)
            else
                IBQModificarDatosExtraccion.ParamByName('NRO_DS').Value := null;
        end;

        if (JvEDescongelCeroPorcViv.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('DESCONGEL_CERO_HS_PORC_VIV').AsFloat := PasarAFloat(JvEDescongelCeroPorcViv.Text)
        else
            IBQModificarDatosExtraccion.ParamByName('DESCONGEL_CERO_HS_PORC_VIV').Value := null;

        if (vigor_desc_cero <> -1) then
            IBQModificarDatosExtraccion.ParamByName('DESCONGEL_CERO_HS_VIG').AsInteger := vigor_desc_cero
        else
            IBQModificarDatosExtraccion.ParamByName('DESCONGEL_CERO_HS_VIG').Value := null;

        if (JvEDescongelDosPorcViv.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('DESCONGEL_DOS_HS_PORC_VIV').AsFloat := PasarAFloat(JvEDescongelDosPorcViv.Text)
        else
            IBQModificarDatosExtraccion.ParamByName('DESCONGEL_DOS_HS_PORC_VIV').Value := null;

        if (vigor_desc_dos <> -1) then
            IBQModificarDatosExtraccion.ParamByName('DESCONGEL_DOS_HS_VIG').AsInteger := vigor_desc_dos
        else
            IBQModificarDatosExtraccion.ParamByName('DESCONGEL_DOS_HS_VIG').Value := null;

        if not(NoCongela) then
        begin
            if (JvEPartida.Text <> '') then
                IBQModificarDatosExtraccion.ParamByName('PARTIDA').AsString := JvEPartida.Text
            else
                IBQModificarDatosExtraccion.ParamByName('PARTIDA').AsString := 'No Definida';
        end
        else
        begin
            if (JvEPartidaCompra.Text <> '') then
                IBQModificarDatosExtraccion.ParamByName('PARTIDA').AsString := JvEPartidaCompra.Text
            else
                IBQModificarDatosExtraccion.ParamByName('PARTIDA').AsString := 'No Definida';
        end;

        if ((DBLCBAMetodoToma.KeyValue <> null)) then
            IBQModificarDatosExtraccion.ParamByName('METODO_TOMA').AsInteger := DBLCBAMetodoToma.KeyValue
        else
            IBQModificarDatosExtraccion.ParamByName('METODO_TOMA').Value := null;

        if not(NoCongela) then
        begin
            if ((DBLCBAResultado.KeyValue <> null))then
            begin
                if (DBLCBAResultado.KeyValue = 0) then
                begin
                  IBQModificarDatosExtraccion.ParamByName('RESULTADO').Value := null;
                  IBQModificarDatosExtraccion.ParamByName('ID_RESULTADO_FINAL').Value := null;
                end
                else
                begin
                  IBQModificarDatosExtraccion.ParamByName('RESULTADO').AsString := DBLCBAResultado.Text;
                  IBQModificarDatosExtraccion.ParamByName('ID_RESULTADO_FINAL').AsInteger := DBLCBAResultado.KeyValue;
                end;
            end
            else
            begin
              if (Diluye) then
              begin
                IBQModificarDatosExtraccion.ParamByName('RESULTADO').Value := null;
                IBQModificarDatosExtraccion.ParamByName('ID_RESULTADO_FINAL').Value := null;
              end
              else
              begin
                IBQModificarDatosExtraccion.ParamByName('RESULTADO').AsString := 'RECHAZO';
                IBQModificarDatosExtraccion.ParamByName('ID_RESULTADO_FINAL').AsInteger := 4;
              end;
            end;
        end
        else
        begin
          IBQModificarDatosExtraccion.ParamByName('RESULTADO').AsString := 'APTO';
          IBQModificarDatosExtraccion.ParamByName('ID_RESULTADO_FINAL').AsInteger := 2;
        end;

        if (estable_extrac <> -1) then
            IBQModificarDatosExtraccion.ParamByName('EXTRACCION_CAMPO').AsInteger := estable_extrac
        else
            IBQModificarDatosExtraccion.ParamByName('EXTRACCION_CAMPO').Value := null;

        if (centro_extrac <> -1) then
            IBQModificarDatosExtraccion.ParamByName('EXTRACCION_CENTRO').AsInteger := centro_extrac
        else
            IBQModificarDatosExtraccion.ParamByName('EXTRACCION_CENTRO').Value := null;

        if (responsable <> -1) then
          IBQModificarDatosExtraccion.ParamByName('RESPONSABLE').AsInteger := responsable
        else
          IBQModificarDatosExtraccion.ParamByName('RESPONSABLE').AsInteger := 0;

        if (responsable_extraccion <> -1) then
          IBQModificarDatosExtraccion.ParamByName('RESPONSABLE_EXTRACCION').AsInteger := responsable_extraccion
        else
          IBQModificarDatosExtraccion.ParamByName('RESPONSABLE_EXTRACCION').AsInteger := 0;

        if (JvECertificado.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('CERTIFICADO').AsInteger := StrToInt(JvECertificado.Text)
        else
            IBQModificarDatosExtraccion.ParamByName('CERTIFICADO').Value := null;

        if (JvEPrecio.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('PRECIO').AsFloat := PasarAFloat(JvEPrecio.Text)
        else
            IBQModificarDatosExtraccion.ParamByName('PRECIO').Value := null;

        if (MAObservacion.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('OBSERVACION').AsString := MAObservacion.Text
        else
            IBQModificarDatosExtraccion.ParamByName('OBSERVACION').Value := null;

        if (MAObservacionLugarExtraccion.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('OBSERVA_LUGAR').AsString := MAObservacionLugarExtraccion.Text
        else
            IBQModificarDatosExtraccion.ParamByName('OBSERVA_LUGAR').Value := null;

        if (MAObservacionDatos.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('OBSERVA_DATOS').AsString := MAObservacionDatos.Text
        else
            IBQModificarDatosExtraccion.ParamByName('OBSERVA_DATOS').Value := null;

        if (Diluye) then
            IBQModificarDatosExtraccion.ParamByName('DILUYE_SN').AsString := 'S'
        else
            IBQModificarDatosExtraccion.ParamByName('DILUYE_SN').AsString := 'N';

        if (LDiluyenteNecesario.Caption <> '') then
            IBQModificarDatosExtraccion.ParamByName('DILUYENTE_NECESARIO').AsFloat := PasarAFloat(LDiluyenteNecesario.Caption)
        else
            IBQModificarDatosExtraccion.ParamByName('DILUYENTE_NECESARIO').Value := null;

        if (JvEDilusion.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('DILUCION').AsFloat := PasarAFloat(JvEDilusion.Text)
        else
            IBQModificarDatosExtraccion.ParamByName('DILUCION').Value := null;

        if (JvENombreTermo.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('TERMO').AsString := JvENombreTermo.Text
        else
            IBQModificarDatosExtraccion.ParamByName('TERMO').Value := null;

        if (canister <> '') then
            IBQModificarDatosExtraccion.ParamByName('CANISTER').AsString := canister
        else
            IBQModificarDatosExtraccion.ParamByName('CANISTER').Value := null;

        if (posicion <> '') then
            IBQModificarDatosExtraccion.ParamByName('POSICION_TERMO').AsString := posicion
        else
            IBQModificarDatosExtraccion.ParamByName('POSICION_TERMO').Value := null;

        if (JvENombreTermoProv.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('TERMO_PROVISORIO').AsString := JvENombreTermoProv.Text
        else
            IBQModificarDatosExtraccion.ParamByName('TERMO_PROVISORIO').Value := null;

        if (canister_prov <> '') then
            IBQModificarDatosExtraccion.ParamByName('CANISTER_PROVISORIO').AsString := canister_prov
        else
            IBQModificarDatosExtraccion.ParamByName('CANISTER_PROVISORIO').Value := null;

        if (posicion_prov <> '') then
            IBQModificarDatosExtraccion.ParamByName('POSICION_TERMO_PROVISORIO').AsString := posicion_prov
        else
            IBQModificarDatosExtraccion.ParamByName('POSICION_TERMO_PROVISORIO').Value := null;


        if (JvEEspermasPotencialesXPajuela.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('ESPERMAS_POTENCIALES_PAJUELA').AsInteger := StrToInt(JvEEspermasPotencialesXPajuela.Text)
        else
            IBQModificarDatosExtraccion.ParamByName('ESPERMAS_POTENCIALES_PAJUELA').Value := null;

        if (JVEEspermasXPajuela.Text <> '') then
            IBQModificarDatosExtraccion.ParamByName('ESPERMAS_POR_PAJUELA').AsInteger := StrToInt(JvEEspermasXPajuela.Text)
        else
            IBQModificarDatosExtraccion.ParamByName('ESPERMAS_POR_PAJUELA').Value := null;

        IBQModificarDatosExtraccion.ParamByName('LOG_USUARIO').Value :=  FPrincipal.UsuarioActual;
        IBQModificarDatosExtraccion.ParamByName('LOG_FECHA_MODIFICADO').Value := now;

        if (NoCongela) then
            IBQModificarDatosExtraccion.ParamByName('CONGELO').AsString := 'N'
        else
          if (Diluye) then
            IBQModificarDatosExtraccion.ParamByName('CONGELO').AsString := 'S'
          else
            IBQModificarDatosExtraccion.ParamByName('CONGELO').AsString := 'N';

       if (propaga) then
       begin
          IBQModificarDatosExtraccion.ParamByName('propaga').AsInteger := 1;
          IBQModificarDatosExtraccion.ParamByName('semen').Value := IBQGetIdSemen.FieldValues['id_eve_extraccion_semen'];
       end
       else
       begin
          IBQModificarDatosExtraccion.ParamByName('semen').Value := null;
          IBQModificarDatosExtraccion.ParamByName('propaga').AsInteger := 0;
       end;

       IBQModificarDatosExtraccion.ParamByName('id_evento_extraccion').AsInteger := evento;

       IBQModificarDatosExtraccion.Open;

       FPrincipal.IBTPrincipal.CommitRetaining;

       MostrarMensaje(tmInformacion,'Los datos han sido cargados correctamente.');

       Close();
    except
       FPrincipal.IBTPrincipal.RollbackRetaining;

       MostrarMensaje(tmInformacion,'Se produjo un error en la carga.');

       Close();
    end;

end;

procedure TFEveExtraccionSemen.OcultarElementosNoEditables;
begin
     ISemenCongelaOn.Visible := false;
     ISemenCongelaOff.Visible := false;
     LSemenCongela.Visible := false;

     ISemenNoCongelaOn.Visible := false;
     ISemenNoCongelaOff.Visible := false;
     LSemenNoCongela.Visible := false;

     IDiluyeOff.Visible := false;
     IDiluyeOn.Visible := false;
     LDiluye.Visible := false;

     INoDiluyeOff.Visible := false;
     INoDiluyeOn.Visible := false;
     LNoDiluye.Visible := false;
end;

procedure TFEveExtraccionSemen.INoDiluyeOnClick(Sender: TObject);
begin
  inherited;

  if not(INoDiluyeOn.Visible) then
  begin
    GBDatosCongelacionDescongelacion.Enabled := false;
    RedibujarPanel(false);
    Diluye := false;
  end
  else
  begin
    GBDatosCongelacionDescongelacion.Enabled := true;
    RedibujarPanel(true);
    Diluye := true;
  end;

  IDiluyeOn.Visible := not(IDiluyeOn.Visible);
  IDiluyeOff.Visible := not(IDiluyeOff.Visible);
  INoDiluyeOn.Visible := not(INoDiluyeOn.Visible);
  INoDiluyeOff.Visible := not(INoDiluyeOff.Visible);

  PuedeTerminar;

end;

procedure TFEveExtraccionSemen.LimpiarCampos;
begin

     DTPFechaExtraccion.Date := Now;
     DTPFechaCongelacion.Date := Now;
     DTPFechaCompra.Date := Now;
     DTPHoraCongelacion.Time := Time;
     DTPHoraEyaculacion.Time := Time;

     DBLCBAMetodoToma.KeyValue := 0;

     JvENroEyaculacion.Text := '';
     JvEMillonesEyaculacion.Text := '';
     JvEVolumenEyaculacion.Text := '';
     CBxColor.ItemIndex := 0;
     CBxColorChange(self);
     CBxVigor.ItemIndex := 0;
     CBxVigorChange(self);
     JvEEspermasPotencialesXPajuela.Text := '';
     JvEEspermasXPajuela.Text := '';
     JvEDilusion.Text := '';
     LDiluyenteNecesario.Caption := '';
     CBxResponsableExtraccion.ItemIndex := 0;
     CBxResponsableExtraccionChange(self);
     JvEPrecio.Text := '';
     MAObservacion.Text := '';

     ISemenCongelaOff.Visible := true;
     ISemenCongelaOn.Visible := false;
     ISemenCongelaOffClick(ISemenCongelaOff);

     CBxEstablecimiento.ItemIndex := 0;
     CBxEstablecimientoChange(self);
     CBxCentroExtraccion.ItemIndex := 0;
     CBxCentroExtraccionChange(self);
     CBxResponsable.ItemIndex := 0;
     JvECertificado.Text := '';
     JvENombreTermoProv.Text := '';
     CBxNroCanisterProv.ItemIndex := 0;
     CBxNroCanisterProvChange(self);
     CBxPosicionProv.ItemIndex := 0;
     CBxPosicionProvChange(self);

     IDiluyeOff.Visible := true;
     IDiluyeOn.Visible := false;
     IDiluyeOffClick(IDiluyeOff);

     GBDatosVenta.Align := alNone;
     GBDatosVenta.Visible := false;
     GBDatosCongelacionDescongelacion.Align := alLeft;
     GBDatosCongelacionDescongelacion.Visible := true;

     JvENroDS.Text := '';
     JvEDescongelCeroPorcViv.Text := '';
     JvEDescongelDosPorcViv.Text := '';
     CBxVigorDescCero.ItemIndex := 0;
     CBxVigorDescCeroChange(self);
     CBxVigorDescDos.ItemIndex := 0;
     CBxVigorDescDosChange(self);

     JvEPartida.Text := '';
     DBLCBAResultado.KeyValue := 0;
     CBxResponsable.ItemIndex := 0;
     JvENombreTermo.Text := '';
     CBxNroCanister.ItemIndex := 0;
     CBxNroCanisterChange(self);
     CBxPosicion.ItemIndex := 0;
     CBxPosicionChange(self);
     
end;

procedure TFEveExtraccionSemen.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;

  if CargarOtro then
  begin
    if (MostrarMensaje(tmConsulta, '¿Desea cargar otra Extracción?') = mrYes) then
    begin
      CanClose := False;
      LimpiarCampos;
    end
    else
      CanClose := True;
  end;
  
end;

procedure TFEveExtraccionSemen.CBxNroCanisterProvChange(Sender: TObject);
begin
  inherited;

  canister_prov := CBxNroCanisterProv.Text;
   
end;

procedure TFEveExtraccionSemen.CBxPosicionProvChange(Sender: TObject);
begin
  inherited;

  posicion_prov := CBxPosicionProv.Text;
  
end;

procedure TFEveExtraccionSemen.IPreviewClick(Sender: TObject);
var
  F : TFCertificadoCalidadOrig;
begin
  inherited;
  F := TFCertificadoCalidadOrig.Create(self);
  F.id_extraccion := evento;
  F.ShowModal;
  F.Destroy;
end;

procedure TFEveExtraccionSemen.JvEDosisCompraChange(Sender: TObject);
begin
  inherited;
  PuedeTerminar;
end;

end.

