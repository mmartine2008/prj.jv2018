unit UREPListadosPersonalizados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, UFrameMangazo, Grids,
  DBGrids, UBDBGrid, JvExExtCtrls, JvExtComponent, JvCaptionPanel, PngImage,
  JvComponentBase, JvBalloonHint, JvImage, AppEvnts, QuickRpt, QRCtrls,
  IniFiles;


type

  TFREPListadosPersonalizados = class(TFUniversal)
    PBotones: TPanel;
    PVariables: TPanel;
    PTop: TPanel;
    PDetalle: TPanel;
    PTopDetalle: TPanel;
    PAnimales: TPanel;
    Panel2: TPanel;
    PSeleccion: TPanel;
    BConAnimales: TButton;
    BSinAnimales: TButton;
    PConAnimales: TPanel;
    PSinAnimales: TPanel;
    BSiguiente: TButton;
    BAnterior: TButton;
    Manga: TMangazo;
    BDBGDetalle: TBitDBGrid;
    DSDetalle: TDataSource;
    IBQDetalle: TIBQuery;
    PILSubcatEve: TPngImageList;
    CPFenotipos: TJvCaptionPanel;
    GBFenotipos: TGroupBox;
    CBPesoAct: TCheckBox;
    CBFUltimaPesada: TCheckBox;
    CBPesoNac: TCheckBox;
    CBPesoDest: TCheckBox;
    CBFechaDestete: TCheckBox;
    CBPesoAnio: TCheckBox;
    CBFechaAnio: TCheckBox;
    CBFechaAdulto: TCheckBox;
    CBPesoAdulto: TCheckBox;
    CBCE: TCheckBox;
    CBAlzada: TCheckBox;
    CBFrame: TCheckBox;
    CBGDR: TCheckBox;
    CBCondCorp: TCheckBox;
    CPCaracteristicas: TJvCaptionPanel;
    GBCaracteristicas: TGroupBox;
    CBRaza: TCheckBox;
    CBColor: TCheckBox;
    CBTipoReg: TCheckBox;
    CBCriador: TCheckBox;
    CBPropietario: TCheckBox;
    CBOrigen: TCheckBox;
    CBCategoria: TCheckBox;
    CPIdentificacion: TJvCaptionPanel;
    GBIdentificacion: TGroupBox;
    CBRP: TCheckBox;
    CBSENASA: TCheckBox;
    CBIE: TCheckBox;
    CBHBA: TCheckBox;
    CBIdentRaza: TCheckBox;
    CPSanidad: TJvCaptionPanel;
    GBSanitario: TGroupBox;
    CPUbicacion: TJvCaptionPanel;
    GBUbicacion: TGroupBox;
    CBPotrero: TCheckBox;
    CBRodeo: TCheckBox;
    CBEstablecimiento: TCheckBox;
    CPGenealogia: TJvCaptionPanel;
    GBGenealogia: TGroupBox;
    CBPadre: TCheckBox;
    CBMadre: TCheckBox;
    CBAbueloPat: TCheckBox;
    CBAbuelaPat: TCheckBox;
    CBAbueloMat: TCheckBox;
    CBAbuelaMat: TCheckBox;
    CPGestacion: TJvCaptionPanel;
    GBTacto: TGroupBox;
    CPServicio: TJvCaptionPanel;
    GBServicio: TGroupBox;
    CPPartos: TJvCaptionPanel;
    GBPartos: TGroupBox;
    CBCantCrias: TCheckBox;
    CBFechaProbdeParto: TCheckBox;
    Image1: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    PPreview: TPanel;
    ECantAnimales: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BDBGPreview: TBitDBGrid;
    GroupBox1: TGroupBox;
    CBFechaUltimoTrat: TCheckBox;
    CBDescUltimoTrat: TCheckBox;
    CBUltimoTrat: TCheckBox;
    GroupBox2: TGroupBox;
    CBFechaAnteUltimoTrat: TCheckBox;
    CBDescAnteUltimoTrat: TCheckBox;
    CBAnteUltimoTrat: TCheckBox;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    CBUltimoTacto: TCheckBox;
    CBFechaUltimoTacto: TCheckBox;
    CBResultUltimoTacto: TCheckBox;
    GroupBox4: TGroupBox;
    CBFechaAnteUltimoTacto: TCheckBox;
    CBAnteUltimoTacto: TCheckBox;
    CBResultAnteUltimoTacto: TCheckBox;
    Label4: TLabel;
    GroupBox5: TGroupBox;
    CBToroUltimoServ: TCheckBox;
    CBTipoUltimoServ: TCheckBox;
    CBFechaUltimoServ: TCheckBox;
    CBUltimoServicio: TCheckBox;
    GroupBox6: TGroupBox;
    CBToroAnteUltimoServ: TCheckBox;
    CBTipoAnteUltimoServ: TCheckBox;
    CBFechaAnteUltimoServ: TCheckBox;
    CBAnteUltimoServ: TCheckBox;
    Label5: TLabel;
    GroupBox7: TGroupBox;
    CBUltimoParto: TCheckBox;
    CBFechaUltimoParto: TCheckBox;
    CBTipoUltimoParto: TCheckBox;
    GroupBox8: TGroupBox;
    CBTipoAnteUltimoParto: TCheckBox;
    CBFechaAnteUltimoParto: TCheckBox;
    CBAnteUltimoParto: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    JvBHint: TJvBalloonHint;
    AppEveHint: TApplicationEvents;
    IIDentificacion: TJvImage;
    ICaracteristicas: TJvImage;
    IFenotipos: TJvImage;
    IGenealogia: TJvImage;
    IUbicacion: TJvImage;
    ISanidad: TJvImage;
    IServicios: TJvImage;
    IGestacion: TJvImage;
    IPartos: TJvImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    PPlanillasModelos: TPanel;
    BPrint: TButton;
    Label22: TLabel;
    EnombrePlanilla: TEdit;
    Label23: TLabel;
    Label25: TLabel;
    MObs: TMemo;
    BGuardar: TButton;
    BAbrir: TButton;
    Label26: TLabel;
    TVPlanillasGuardadas: TTreeView;
    IGuardar: TImage;
    Image15: TImage;
    IAnterior: TImage;
    ISiguiente: TImage;
    ISalir: TImage;
    Image14: TImage;
    Label27: TLabel;
    Label24: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    IConAnimales: TImage;
    ISinAnimales: TImage;
    CBIdentNombre: TCheckBox;
    CBIdentApodo: TCheckBox;
    IGuardarExcel: TImage;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    CBFechaNac: TCheckBox;
    CBSubcategorizacion: TCheckBox;
    Label36: TLabel;
    Label37: TLabel;
    id_gen_rp: TCheckBox;
    id_gen_nombre: TCheckBox;
    id_gen_apodo: TCheckBox;
  { Daiana - 01.12.2014 - Incidencia 402 - Inicio
    Se agrega Informado a AFIP al reporte personalizado }
    CBInfoAfip: TCheckBox;
    CBCarOficial: TCheckBox;
    IBQDetalleID_RP: TIBStringField;
    IBQDetalleID_SENASA: TIBStringField;
    IBQDetalleID_IE: TIBStringField;
    IBQDetalleID_HBA: TIBStringField;
    IBQDetalleID_PC: TIBStringField;
    IBQDetalleCATEGORIA: TIBStringField;
    IBQDetalleRAZA: TIBStringField;
    IBQDetalleCOLOR: TIBStringField;
    IBQDetalleTIPO_REG: TIBStringField;
    IBQDetalleCRIADOR: TIBStringField;
    IBQDetallePROPIETARIO: TIBStringField;
    IBQDetalleORIGEN: TIBStringField;
    IBQDetallePOTRERO: TIBStringField;
    IBQDetalleRODEO: TIBStringField;
    IBQDetalleESTABLECIMIENTO: TIBStringField;
    IBQDetalleFECHA_ULTIMA_PESADA: TDateField;
    IBQDetalleFECHA_DEST: TDateField;
    IBQDetalleFECHA_ANIO: TDateField;
    IBQDetalleFECHA_18: TDateField;
    IBQDetallePADRE: TIBStringField;
    IBQDetalleMADRE: TIBStringField;
    IBQDetalleABUELO_PAT: TIBStringField;
    IBQDetalleABUELA_PAT: TIBStringField;
    IBQDetalleABUELO_MAT: TIBStringField;
    IBQDetalleABUELA_MAT: TIBStringField;
    IBQDetalleFECHA_ULTIMO_SERV: TDateField;
    IBQDetalleTIPO_ULTIMO_SERV: TIBStringField;
    IBQDetalleTORO_ULTIMO_SERV: TIBStringField;
    IBQDetalleFECHA_ANTEULTIMO_SERV: TDateField;
    IBQDetalleTIPO_ANTEULTIMO_SERV: TIBStringField;
    IBQDetalleTORO_ANTEULTIMO_SERV: TIBStringField;
    IBQDetalleFECHA_ULTIMO_TACTO: TDateField;
    IBQDetalleRESULT_ULTIMO_TACTO: TIBStringField;
    IBQDetalleFECHA_ANTEULTIMO_TACTO: TDateField;
    IBQDetalleRESULT_ANTEULTIMO_TACTO: TIBStringField;
    IBQDetalleFECHA_ULTIMO_PARTO: TDateField;
    IBQDetalleTIPO_ULTIMO_PARTO: TIBStringField;
    IBQDetalleFECHA_ANTEULTIMO_PARTO: TDateField;
    IBQDetalleTIPO_ANTEULTIMO_PARTO: TIBStringField;
    IBQDetalleCANT_CRIAS: TIntegerField;
    IBQDetalleFECHA_PROB_PARTO: TDateField;
    IBQDetalleFECHA_ULTIMO_TRAT: TDateField;
    IBQDetalleULTIMO_TRAT: TIBStringField;
    IBQDetalleFECHA_ANTEULTIMO_TRAT: TDateField;
    IBQDetalleANTEULTIMO_TRAT: TIBStringField;
    IBQDetalleNOMBRE: TIBStringField;
    IBQDetalleAPODO: TIBStringField;
    IBQDetalleFECHA_NAC: TDateField;
    IBQDetalleSUBCATEGORIZACION: TIBStringField;
    IBQDetalleINFO_AFIP: TIBStringField;
    IBQDetalleCARAVANA_OFICIAL: TIBStringField;
    CBCantDiasUltTrat: TCheckBox;
    CBCantDiasAUltimoTrat: TCheckBox;
    IBQDetalleCANT_DIAS_ULTIMO_SERV: TIntegerField;
    IBQDetalleCANT_DIAS_AULTIMO_SERV: TIntegerField;
    IBQDetallePESO_ACTUAL: TIBBCDField;
    IBQDetallePESO_NAC: TIBBCDField;
    IBQDetallePESO_205: TIBBCDField;
    IBQDetallePESO_365: TIBBCDField;
    IBQDetallePESO_505: TIBBCDField;
    IBQDetalleCE: TIBBCDField;
    IBQDetalleALZADA: TIBBCDField;
    IBQDetalleFRAME: TIBBCDField;
    IBQDetalleCOND_CORP: TIBBCDField;
    IBQDetalleGDR: TIBStringField;
  { Daiana - 01.12.2014 - Incidencia 402 - Fin }
    procedure BSiguienteClick(Sender: TObject);
    procedure BAnteriorClick(Sender: TObject);
    procedure BConAnimalesClick(Sender: TObject);
    procedure BSinAnimalesClick(Sender: TObject);
    procedure CBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IIDentificacionClick(Sender: TObject);
    procedure CPClick(Sender: TObject; Button: TJvCapBtnStyle);
    procedure ICaracteristicasClick(Sender: TObject);
    procedure IFenotiposClick(Sender: TObject);
    procedure IGenealogiaClick(Sender: TObject);
    procedure IUbicacionClick(Sender: TObject);
    procedure ISanidadClick(Sender: TObject);
    procedure IServiciosClick(Sender: TObject);
    procedure IGestacionClick(Sender: TObject);
    procedure IPartosClick(Sender: TObject);
    procedure ECantAnimalesChange(Sender: TObject);
    procedure IIDentificacionMouseEnter(Sender: TObject);
    procedure IIDentificacionMouseLeave(Sender: TObject);
    procedure ICaracteristicasMouseEnter(Sender: TObject);
    procedure ICaracteristicasMouseLeave(Sender: TObject);
    procedure IFenotiposMouseEnter(Sender: TObject);
    procedure IFenotiposMouseLeave(Sender: TObject);
    procedure IGenealogiaMouseEnter(Sender: TObject);
    procedure IGenealogiaMouseLeave(Sender: TObject);
    procedure IUbicacionMouseEnter(Sender: TObject);
    procedure IUbicacionMouseLeave(Sender: TObject);
    procedure ISanidadMouseEnter(Sender: TObject);
    procedure ISanidadMouseLeave(Sender: TObject);
    procedure IServiciosMouseEnter(Sender: TObject);
    procedure IServiciosMouseLeave(Sender: TObject);
    procedure IGestacionMouseEnter(Sender: TObject);
    procedure IGestacionMouseLeave(Sender: TObject);
    procedure IPartosMouseEnter(Sender: TObject);
    procedure IPartosMouseLeave(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure BAbrirClick(Sender: TObject);
    procedure IGuardarExcelClick(Sender: TObject);
    procedure EnombrePlanillaChange(Sender: TObject);
    procedure MangaBBAgregarUnoClick(Sender: TObject);
  private
    CantVars : Integer;
    CantAnimales : Integer;
    cantidadAnimalesRecuperados: integer;

    procedure InicVars;
    procedure ArmarDetalle;
    procedure CargarPlanillasGuardadas;
    procedure ActivarColumna(Nombre : String);
    procedure ArmarExcel;
    procedure AgregarColumnaExcel(var column: TxlColumn; alig: TAlignment; coldwidth: Integer; datafield,title:String; save: Boolean);
    procedure HabilitarSiguiente(Habilitar: Boolean);
    procedure HabilitarAnterior(Habilitar: Boolean);
    procedure HabilitarGuardarPlanilla(Habilitar: Boolean);

    procedure HabilitarVistaPrevia(Habilitar: Boolean);
    procedure HabilitarExportarExcel(Habilitar: Boolean);

    procedure CerrarPaneles();

  public
    { Public declarations }
  end;

var
  FREPListadosPersonalizados: TFREPListadosPersonalizados;

implementation

uses
  UPrincipal, UDMSoftvet, UMensajeHuella, UREPListadosPersonalizadosPreview,
  DateUtils, UCartel, Math;

{$R *.dfm}


procedure TFREPListadosPersonalizados.CerrarPaneles();
begin
    CPFenotipos.Visible := false;
    CPCaracteristicas.Visible := false;
    CPIdentificacion.Visible := false;
    CPSanidad.Visible := false;
    CPUbicacion.Visible := false;
    CPGenealogia.Visible := false;
    CPGestacion.Visible := false;
    CPServicio.Visible := false;
    CPPartos.Visible := false;
end;

procedure TFREPListadosPersonalizados.HabilitarSiguiente(Habilitar: Boolean);
begin
      ISiguiente.Visible :=  Habilitar;
      Label34.Visible :=  Habilitar;
end;

procedure TFREPListadosPersonalizados.HabilitarAnterior(Habilitar: Boolean);
begin
      IAnterior.Visible :=  Habilitar;
      Label33.Visible :=  Habilitar;
end;

procedure TFREPListadosPersonalizados.BSiguienteClick(Sender: TObject);


begin
  inherited;
  if PVariables.Visible then
  begin
    HabilitarGuardarPlanilla(false);
    HabilitarAnterior(true);
    CerrarPaneles();

    PVariables.Visible := false;
    PAnimales.Visible := true;
    PAnimales.Align := alClient;
    PSeleccion.Visible := true;
    PSeleccion.Align := alClient;
    Exit;
  end;
  if PAnimales.Visible then
  begin
    HabilitarSiguiente(false);
    HabilitarVistaPrevia(true);
    HabilitarExportarExcel(true);

    PAnimales.Visible := false;
    PDetalle.Visible := true;
    PDetalle.Align := alClient;
    ArmarDetalle;
    IBQDetalle.Close;

    if (id_gen_rp.Checked) then
      IBQDetalle.ParamByName('RP_GENEALOGIA').AsInteger := 1
    else
      IBQDetalle.ParamByName('RP_GENEALOGIA').AsInteger := 0;

    if (id_gen_nombre.Checked) then
      IBQDetalle.ParamByName('NOMBRE_GENEALOGIA').AsInteger := 1
    else
      IBQDetalle.ParamByName('NOMBRE_GENEALOGIA').AsInteger := 0;

    if (id_gen_apodo.Checked) then
      IBQDetalle.ParamByName('APODO_GENEALOGIA').AsInteger :=  1
    else
      IBQDetalle.ParamByName('APODO_GENEALOGIA').AsInteger :=  0;

    IBQDetalle.ParamByName('cant').AsInteger := CantAnimales;
    IBQDetalle.Open;

    cantidadAnimalesRecuperados := 0;
    cantidadAnimalesRecuperados := IBQDetalle.RecordCount;


    Exit;
  end;
end;

procedure TFREPListadosPersonalizados.BAnteriorClick(Sender: TObject);
begin
  inherited;
  if PDetalle.Visible then
  begin
    HabilitarVistaPrevia(false);
    HabilitarExportarExcel(false);

    HabilitarSiguiente(true);
    PDetalle.Visible := false;
    PAnimales.Visible := true;
    PAnimales.Align := alClient;
    IBQDetalle.Close;
    Exit;
  end;
  if PAnimales.Visible then
  begin
    HabilitarAnterior(false);
    if (Trim(EnombrePlanilla.Text) <> '') then
      HabilitarGuardarPlanilla(true);
    PAnimales.Visible := false;
    PVariables.Visible := true;
    PVariables.Align := alClient;
    Exit;
  end;
end;

procedure TFREPListadosPersonalizados.BConAnimalesClick(Sender: TObject);
begin
  inherited;
  PSeleccion.Visible := false;
  PConAnimales.Visible := true;
  PConAnimales.Align := alClient;

end;

procedure TFREPListadosPersonalizados.BSinAnimalesClick(Sender: TObject);
begin
  inherited;
  PSeleccion.Visible := false;
  PSinAnimales.Visible := true;
  PSinAnimales.Align := alClient;
end;

procedure TFREPListadosPersonalizados.InicVars;
var
  I : Integer;
begin
  for I := 1 to _CANT_VARS do
  begin
    case I of
      1 : begin
            Variables[I].Componete := CBRP;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'RP';
            Variables[I].Variable := 'ID_RP';
            Variables[I].Columna := 0;
          end;
      2 : begin
            Variables[I].Componete := CBSENASA;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'SENASA';
            Variables[I].Variable := 'ID_SENASA';
            Variables[I].Columna := 1;
          end;
      3 : begin
            Variables[I].Componete := CBIE;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Ident. Electrónica';
            Variables[I].Variable := 'ID_IE';
            Variables[I].Columna := 2;
          end;
      4 : begin
            Variables[I].Componete := CBHBA;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'HBA';
            Variables[I].Variable := 'ID_HBA';
            Variables[I].Columna := 3;
          end;
      5 : begin
            Variables[I].Componete := CBIdentRaza;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Asociación';
            Variables[I].Variable := 'ID_PC';
            Variables[I].Columna := 4;
          end;
      6 : begin
            Variables[I].Componete := CBCategoria;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Categoría';
            Variables[I].Variable := 'CATEGORIA';
            Variables[I].Columna := 5;
          end;
      7 : begin
            Variables[I].Componete := CBRaza;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Raza';
            Variables[I].Variable := 'RAZA';
            Variables[I].Columna := 6;
          end;
      8 : begin
            Variables[I].Componete := CBColor;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Color';
            Variables[I].Variable := 'COLOR';
            Variables[I].Columna := 7;
          end;
      9 : begin
            Variables[I].Componete := CBTipoReg;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'T. Reg.';
            Variables[I].Variable := 'TIPO_REG';
            Variables[I].Columna := 8;
          end;
      10 : begin
            Variables[I].Componete := CBCriador;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Criador';
            Variables[I].Variable := 'CRIADOR';
            Variables[I].Columna := 11;
          end;
      11 : begin
            Variables[I].Componete := CBPropietario;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Propietario';
            Variables[I].Variable := 'PROPIETARIO';
            Variables[I].Columna := 9;
          end;
      12 : begin
            Variables[I].Componete := CBOrigen;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Orígen';
            Variables[I].Variable := 'ORIGEN';
            Variables[I].Columna := 10;
          end;
      13 : begin
            Variables[I].Componete := CBPotrero;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Potrero';
            Variables[I].Variable := 'POTRERO';
            Variables[I].Columna := 12;
          end;
      14 : begin
            Variables[I].Componete := CBRodeo;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Rodeo';
            Variables[I].Variable := 'RODEO';
            Variables[I].Columna := 13;
          end;
      15 : begin
            Variables[I].Componete := CBEstablecimiento;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Establecimiento';
            Variables[I].Variable := 'ESTABLECIMIENTO';
            Variables[I].Columna := 14;
          end;
      16 : begin
            Variables[I].Componete := CBPesoAct;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'P. Actual';
            Variables[I].Variable := 'PESO_ACTUAL';
            Variables[I].Columna := 15;
          end;
      17 : begin
            Variables[I].Componete := CBFUltimaPesada;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Ult Pesada';
            Variables[I].Variable := 'FECHA_ULTIMA_PESADA';
            Variables[I].Columna := 16;
          end;
      18 : begin
            Variables[I].Componete := CBPesoNac;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'P. Nacer';
            Variables[I].Variable := 'PESO_NAC';
            Variables[I].Columna := 17;
          end;
      19 : begin
            Variables[I].Componete := CBPesoDest;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'P. Destete';
            Variables[I].Variable := 'PESO_205';
            Variables[I].Columna := 18;
          end;
      20 : begin
            Variables[I].Componete := CBFechaDestete;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Destete';
            Variables[I].Variable := 'FECHA_DEST';
            Variables[I].Columna := 19;
          end;
      21 : begin
            Variables[I].Componete := CBPesoAnio;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'P. al Año';
            Variables[I].Variable := 'PESO_365';
            Variables[I].Columna := 20;
          end;
      22 : begin
            Variables[I].Componete := CBFechaAnio;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Año';
            Variables[I].Variable := 'FECHA_ANIO';
            Variables[I].Columna := 21;
          end;
      23 : begin
            Variables[I].Componete := CBPesoAdulto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'P. 18 meses';
            Variables[I].Variable := 'PESO_505';
            Variables[I].Columna := 22;
          end;
      24 : begin
            Variables[I].Componete := CBFechaAdulto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. 18 meses';
            Variables[I].Variable := 'FECHA_18';
            Variables[I].Columna := 23;
          end;
      25 : begin
            Variables[I].Componete := CBCE;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Circ. Escrotal';
            Variables[I].Variable := 'CE';
            Variables[I].Columna := 24;
          end;
      26 : begin
            Variables[I].Componete := CBAlzada;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Alzada';
            Variables[I].Variable := 'ALZADA';
            Variables[I].Columna := 25;
          end;
      27 : begin
            Variables[I].Componete := CBFrame;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Frame';
            Variables[I].Variable := 'FRAME';
            Variables[I].Columna := 26;
          end;
      28 : begin
            Variables[I].Componete := CBPadre;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Padre';
            Variables[I].Variable := 'PADRE';
            Variables[I].Columna := 29;
          end;
      29 : begin
            Variables[I].Componete := CBMadre;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Madre';
            Variables[I].Variable := 'MADRE';
            Variables[I].Columna := 30;
          end;
      30 : begin
            Variables[I].Componete := CBAbueloPat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Abuelo Paterno';
            Variables[I].Variable := 'ABUELO_PAT';
            Variables[I].Columna := 31;
          end;
      31 : begin
            Variables[I].Componete := CBAbuelaPat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Abuela Paterna';
            Variables[I].Variable := 'ABUELA_PAT';
            Variables[I].Columna := 32;
          end;
      32 : begin
            Variables[I].Componete := CBAbueloMat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Abuelo Materno';
            Variables[I].Variable := 'ABUELO_MAT';
            Variables[I].Columna := 33;
          end;
      33 : begin
            Variables[I].Componete := CBAbuelaMat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Abuela Materna';
            Variables[I].Variable := 'ABUELA_MAT';
            Variables[I].Columna := 34;
          end;
      34 : begin
            Variables[I].Componete := CBUltimoServicio;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := '';
            Variables[I].Variable := 'ULTIMO_SERV';
            Variables[I].Columna := -1;
          end;
      35 : begin
            Variables[I].Componete := CBFechaUltimoServ;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. último serv.';
            Variables[I].Variable := 'FECHA_ULTIMO_SERV';
            Variables[I].Columna := 37;
          end;
      36 : begin
            Variables[I].Componete := CBTipoUltimoServ;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'T. Ult.Serv.';
            Variables[I].Variable := 'TIPO_ULTIMO_SERV';
            Variables[I].Columna := 38;
          end;
      37 : begin
            Variables[I].Componete := CBToroUltimoServ;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Toro Ult.Serv.';
            Variables[I].Variable := 'TORO_ULTIMO_SERV';
            Variables[I].Columna := -1;
          end;
      38 : begin
            Variables[I].Componete := CBAnteUltimoServ;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := '';
            Variables[I].Variable := 'ANTE_ULTIMO_SERV';
            Variables[I].Columna := -1;
          end;
      39 : begin
            Variables[I].Componete := CBFechaAnteUltimoServ;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Anteúlt. serv.';
            Variables[I].Variable := 'FECHA_ANTEULTIMO_SERV';
            Variables[I].Columna := 35;
          end;
      40 : begin
            Variables[I].Componete := CBTipoAnteUltimoServ;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'T. Anteúlt. serv.';
            Variables[I].Variable := 'TIPO_ANTEULTIMO_SERV';
            Variables[I].Columna := 36;
          end;
      41 : begin
            Variables[I].Componete := CBToroAnteUltimoServ;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Toro Anteúlt. serv.';
            Variables[I].Variable := 'TORO_ANTEULTIMO_SERV';
            Variables[I].Columna := -1;
          end;
      42 : begin
            Variables[I].Componete := CBUltimoTacto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := '';
            Variables[I].Variable := 'ULTIMO_TACTO';
            Variables[I].Columna := -1;
          end;
      43 : begin
            Variables[I].Componete := CBFechaUltimoTacto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Ult.Tacto';
            Variables[I].Variable := 'FECHA_ULTIMO_TACTO';
            Variables[I].Columna := 41;
          end;
      44 : begin
            Variables[I].Componete := CBResultUltimoTacto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Resultado';
            Variables[I].Variable := 'RESULT_ULTIMO_TACTO';
            Variables[I].Columna := 42;
          end;
      45 : begin
            Variables[I].Componete := CBAnteUltimoTacto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := '';
            Variables[I].Variable := 'ANTEULTIMO_TACTO';
            Variables[I].Columna := -1;
          end;
      46 : begin
            Variables[I].Componete := CBFechaAnteUltimoTacto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Anteúlt. tacto';
            Variables[I].Variable := 'FECHA_ANTEULTIMO_TACTO';
            Variables[I].Columna := 39;
          end;
      47 : begin
            Variables[I].Componete := CBResultAnteUltimoTacto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Resultado';
            Variables[I].Variable := 'RESULT_ANTEULTIMO_TACTO';
            Variables[I].Columna := 40;
          end;
      48 : begin
            Variables[I].Componete := CBUltimoParto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := '';
            Variables[I].Variable := 'ULTIMO_PARTO';
            Variables[I].Columna := -1;
          end;
      49 : begin
            Variables[I].Componete := CBFechaUltimoParto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Ult.Parto';
            Variables[I].Variable := 'FECHA_ULTIMO_PARTO';
            Variables[I].Columna := 45;
          end;
      50 : begin
            Variables[I].Componete := CBTipoUltimoParto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'T. Ult.Parto';
            Variables[I].Variable := 'TIPO_ULTIMO_PARTO';
            Variables[I].Columna := 46;
          end;
      51 : begin
            Variables[I].Componete := CBAnteUltimoParto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := '';
            Variables[I].Variable := 'ANTEULTIMO_PARTO';
            Variables[I].Columna := -1;
          end;
      52 : begin
            Variables[I].Componete := CBFechaAnteUltimoParto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Anteúlt. parto';
            Variables[I].Variable := 'FECHA_ANTEULTIMO_PARTO';
            Variables[I].Columna := 43;
          end;
      53 : begin
            Variables[I].Componete := CBTipoAnteUltimoParto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'T. Anteúlt. parto';
            Variables[I].Variable := 'TIPO_ANTEULTIMO_PARTO';
            Variables[I].Columna := 45;
          end;
      54 : begin
            Variables[I].Componete := CBCantCrias;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Cant. Partos';
            Variables[I].Variable := 'CANT_CRIAS';
            Variables[I].Columna := 47;
          end;
      55 : begin
            Variables[I].Componete := CBFechaProbdeParto;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Prob. de Parto';
            Variables[I].Variable := 'FECHA_PROB_PARTO';
            Variables[I].Columna := 48;
          end;
      56 : begin
            Variables[I].Componete := CBUltimoTrat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := '';
            Variables[I].Variable := 'VIS_ULTIMO_TRAT';
            Variables[I].Columna := -1;
          end;
      57 : begin
            Variables[I].Componete := CBFechaUltimoTrat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Ult.Tratamiento';
            Variables[I].Variable := 'FECHA_ULTIMO_TRAT';
            Variables[I].Columna := 51;
          end;
      58 : begin
            Variables[I].Componete := CBDescUltimoTrat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Ult Tratamiento';
            Variables[I].Variable := 'ULTIMO_TRAT';
            Variables[I].Columna := 52;
          end;
      59 : begin
            Variables[I].Componete := CBAnteUltimoTrat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := '';
            Variables[I].Variable := '_VIS_ANTEULTIMO_TRAT';
            Variables[I].Columna := -1;
          end;
      60 : begin
            Variables[I].Componete := CBFechaAnteUltimoTrat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. Anteúlt. trat.';
            Variables[I].Variable := 'FECHA_ANTEULTIMO_TRAT';
            Variables[I].Columna := 49;
          end;
      61 : begin
            Variables[I].Componete := CBDescAnteUltimoTrat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Anteúlt. trat.';
            Variables[I].Variable := 'ANTEULTIMO_TRAT';
            Variables[I].Columna := 50;
          end;
      62 : begin
            Variables[I].Componete := CBCondCorp;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Cond. Corporal';
            Variables[I].Variable := 'COND_CORP';
            Variables[I].Columna := 27;
          end;
      63 : begin
            Variables[I].Componete := CBGDR;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'GDR';
            Variables[I].Variable := 'GDR';
            Variables[I].Columna := 28;
          end;
      64 : begin
            Variables[I].Componete := CBIdentNombre;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Nombre';
            Variables[I].Variable := 'NOMBRE';
            Variables[I].Columna := 53;
          end;
      65 : begin
            Variables[I].Componete := CBIdentApodo;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Apodo';
            Variables[I].Variable := 'APODO';
            Variables[I].Columna := 54;
          end;
      66 : begin
            Variables[I].Componete := CBFechaNac;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'F. de Nacimiento';
            Variables[I].Variable := 'FECHA_NAC';
            Variables[I].Columna := 55;
           end;
      67 : begin
            Variables[I].Componete := CBSubcategorizacion;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Subcat.';
            Variables[I].Variable := 'SUBCATEGORIZACION';
            Variables[I].Columna := 56;
           end;
    { Daiana - 01.12.2014 - Incidencia 402 - Inicio
      Se agrega Informado a AFIP al reporte personalizado }
      68 : begin
            Variables[I].Componete := CBInfoAfip;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Informado Afip';
            Variables[I].Variable := 'INFO_AFIP';
            Variables[I].Columna := 57;
           end;
    { Daiana - 01.12.2014 - Incidencia 402 - Fin }
      69 : begin
            Variables[I].Componete := CBCarOficial;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Caravana Oficial';
            Variables[I].Variable := 'CARAVANA_OFICIAL';
            Variables[I].Columna := 58;
           end;
      70 : begin
            Variables[I].Componete := CBCantDiasUltTrat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Días último serv.';
            Variables[I].Variable := 'CANT_DIAS_ULTIMO_SERV';
            Variables[I].Columna := 59;
           end;
      71 : begin
            Variables[I].Componete := CBCantDiasAUltimoTrat;
            Variables[I].Seleccionado := false;
            Variables[I].NomCol := 'Días anteúlt. serv.';
            Variables[I].Variable := 'CANT_DIAS_AULTIMO_SERV';
            Variables[I].Columna := 60;
           end;
      end;
      if Variables[I].NomCol <> '' then
      begin
        Variables[I].Componete.Checked := false;
        CBClick(Variables[I].Componete);
      end;
  end;
  CantVars := 0;
end;

procedure TFREPListadosPersonalizados.CBClick(Sender: TObject);
begin
  inherited;
  if ((Sender as TCheckBox).Tag > 0) then
  begin
    if (CantVars < 10) then
    begin
      if (Sender as TCheckBox).Checked then
        CantVars := CantVars + 1
      else
        CantVars := CantVars - 1;
    end
    else
      CantVars := CantVars -1;
    BDBGPreview.Visible := CantVars > 0;

    Variables[(Sender as TCheckBox).Tag].Seleccionado := (Sender as TCheckBox).Checked;
      if Variables[(Sender as TCheckBox).Tag].Columna <> -1 then
      begin
        BDBGPreview.ColumnByField(Variables[(Sender as TCheckBox).Tag].Variable).Visible := (Sender as TCheckBox).Checked;
        if ((BDBGPreview.ColumnByField(Variables[(Sender as TCheckBox).Tag].Variable).FieldName = 'CANT_DIAS_ULTIMO_SERV') or
          (BDBGPreview.ColumnByField(Variables[(Sender as TCheckBox).Tag].Variable).FieldName = 'CANT_DIAS_AULTIMO_SERV')) then
          BDBGPreview.ColumnByField(Variables[(Sender as TCheckBox).Tag].Variable).Width := 150
        else
          BDBGPreview.ColumnByField(Variables[(Sender as TCheckBox).Tag].Variable).Width := 110;
      end
      else
      begin
        case (Sender as TCheckBox).Tag of
          34 : begin    //Ultimo Servicio
                  if Variables[(Sender as TCheckBox).Tag].Seleccionado then
                  begin
                    CantVars := CantVars + 1;
                    CBTipoUltimoServ.Checked := true;
                    CBFechaUltimoServ.Checked := true;
                    BDBGPreview.ColumnByField(Variables[CBTipoUltimoServ.Tag].Variable).FieldName := 'TIPO_ULTIMO_SERV';
                    BDBGPreview.ColumnByField(Variables[CBFechaUltimoServ.Tag].Variable).FieldName := 'FECHA_ULTIMO_SERV';
                  end
                  else
                  begin
                    BDBGPreview.ColumnByField('TIPO_ULTIMO_SERV').FieldName := Variables[CBTipoUltimoServ.Tag].Variable;
                    BDBGPreview.ColumnByField('FECHA_ULTIMO_SERV').FieldName := Variables[CBFechaUltimoServ.Tag].Variable;
                    CBTipoUltimoServ.Checked := false;
                    CBFechaUltimoServ.Checked := false;
                    CantVars := CantVars - 1;
                  end;
               end;
          38 : begin //Ante Ultimo Servicio
                  if Variables[(Sender as TCheckBox).Tag].Seleccionado then
                  begin
                    CantVars := CantVars + 1;
                    CBTipoAnteUltimoServ.Checked := true;
                    CBFechaAnteUltimoServ.Checked := true;
                    BDBGPreview.ColumnByField(Variables[CBTipoAnteUltimoServ.Tag].Variable).FieldName := 'TIPO_ANTEULTIMO_SERV';
                    BDBGPreview.ColumnByField(Variables[CBFechaAnteUltimoServ.Tag].Variable).FieldName := 'FECHA_ANTEULTIMO_SERV';
                  end
                  else
                  begin
                    BDBGPreview.ColumnByField('TIPO_ANTEULTIMO_SERV').FieldName := Variables[CBTipoAnteUltimoServ.Tag].Variable;
                    BDBGPreview.ColumnByField('FECHA_ANTEULTIMO_SERV').FieldName := Variables[CBFechaAnteUltimoServ.Tag].Variable;
                    CBTipoAnteUltimoServ.Checked := false;
                    CBFechaAnteUltimoServ.Checked := false;
                    CantVars := CantVars - 1;
                  end;
               end;
          42 : begin //Ultimo Tacto
                  if Variables[(Sender as TCheckBox).Tag].Seleccionado then
                  begin
                    CantVars := CantVars + 1;
                    CBResultUltimoTacto.Checked := true;
                    CBFechaUltimoTacto.Checked := true;
                    BDBGPreview.ColumnByField(Variables[CBResultUltimoTacto.Tag].Variable).FieldName := 'RESULT_ULTIMO_TACTO';
                    BDBGPreview.ColumnByField(Variables[CBFechaUltimoTacto.Tag].Variable).FieldName := 'FECHA_ULTIMO_TACTO';
                  end
                  else
                  begin
                    BDBGPreview.ColumnByField('RESULT_ULTIMO_TACTO').FieldName := Variables[CBResultUltimoTacto.Tag].Variable;
                    BDBGPreview.ColumnByField('FECHA_ULTIMO_TACTO').FieldName := Variables[CBFechaUltimoTacto.Tag].Variable;
                    CBResultUltimoTacto.Checked := false;
                    CBFechaUltimoTacto.Checked := false;
                    CantVars := CantVars - 1;
                  end;
               end;
          45 : begin //Ante Ultimo Tacto
                  if Variables[(Sender as TCheckBox).Tag].Seleccionado then
                  begin
                    CantVars := CantVars + 1;
                    CBResultAnteUltimoTacto.Checked := true;
                    CBFechaAnteUltimoTacto.Checked := true;
                    BDBGPreview.ColumnByField(Variables[CBResultAnteUltimoTacto.Tag].Variable).FieldName := 'RESULT_ANTEULTIMO_TACTO';
                    BDBGPreview.ColumnByField(Variables[CBFechaAnteUltimoTacto.Tag].Variable).FieldName := 'FECHA_ANTEULTIMO_TACTO';
                  end
                  else
                  begin
                    BDBGPreview.ColumnByField('RESULT_ANTEULTIMO_TACTO').FieldName := Variables[CBResultAnteUltimoTacto.Tag].Variable;
                    BDBGPreview.ColumnByField('FECHA_ANTEULTIMO_TACTO').FieldName := Variables[CBFechaAnteUltimoTacto.Tag].Variable;
                    CBResultAnteUltimoTacto.Checked := false;
                    CBFechaAnteUltimoTacto.Checked := false;
                    CantVars := CantVars - 1;
                  end;
               end;
          48 : begin //Ultimo Parto
                  if Variables[(Sender as TCheckBox).Tag].Seleccionado then
                  begin
                    CantVars := CantVars + 1;
                    CBTipoUltimoParto.Checked := true;
                    CBFechaUltimoParto.Checked := true;
                    BDBGPreview.ColumnByField(Variables[CBTipoUltimoParto.Tag].Variable).FieldName := 'TIPO_ULTIMO_PARTO';
                    BDBGPreview.ColumnByField(Variables[CBFechaUltimoParto.Tag].Variable).FieldName := 'FECHA_ULTIMO_PARTO';
                  end
                  else
                  begin
                    BDBGPreview.ColumnByField('TIPO_ULTIMO_PARTO').FieldName := Variables[CBTipoUltimoParto.Tag].Variable;
                    BDBGPreview.ColumnByField('FECHA_ULTIMO_PARTO').FieldName := Variables[CBFechaUltimoParto.Tag].Variable;
                    CBTipoUltimoParto.Checked := false;
                    CBFechaUltimoParto.Checked := false;
                    CantVars := CantVars - 1;
                  end;
               end;
          51 : begin //AnteUltimo Parto
                  if Variables[(Sender as TCheckBox).Tag].Seleccionado then
                  begin
                    CantVars := CantVars + 1;
                    CBTipoAnteUltimoParto.Checked := true;
                    CBFechaAnteUltimoParto.Checked := true;
                    BDBGPreview.ColumnByField(Variables[CBTipoAnteUltimoParto.Tag].Variable).FieldName := 'TIPO_ANTEULTIMO_PARTO';
                    BDBGPreview.ColumnByField(Variables[CBFechaAnteUltimoParto.Tag].Variable).FieldName := 'FECHA_ANTEULTIMO_PARTO';
                  end
                  else
                  begin
                    BDBGPreview.ColumnByField('TIPO_ANTEULTIMO_PARTO').FieldName := Variables[CBTipoAnteUltimoParto.Tag].Variable;
                    BDBGPreview.ColumnByField('FECHA_ANTEULTIMO_PARTO').FieldName := Variables[CBFechaAnteUltimoParto.Tag].Variable;
                    CBTipoAnteUltimoParto.Checked := false;
                    CBFechaAnteUltimoParto.Checked := false;
                    CantVars := CantVars - 1;
                  end;
               end;
          56 : begin //Ultimo Tratamiento
                  if Variables[(Sender as TCheckBox).Tag].Seleccionado then
                  begin
                    CantVars := CantVars + 1;
                    CBDescUltimoTrat.Checked := true;
                    CBFechaUltimoTrat.Checked := true;
                    BDBGPreview.ColumnByField(Variables[CBDescUltimoTrat.Tag].Variable).FieldName := 'ULTIMO_TRAT';
                    BDBGPreview.ColumnByField(Variables[CBFechaUltimoTrat.Tag].Variable).FieldName := 'FECHA_ULTIMO_TRAT';
                  end
                  else
                  begin
                    BDBGPreview.ColumnByField('ULTIMO_TRAT').FieldName := Variables[CBDescUltimoTrat.Tag].Variable;
                    BDBGPreview.ColumnByField('FECHA_ULTIMO_TRAT').FieldName := Variables[CBFechaUltimoTrat.Tag].Variable;
                    CBDescUltimoTrat.Checked := false;
                    CBFechaUltimoTrat.Checked := false;
                    CantVars := CantVars - 1;
                  end;
               end;
          59 : begin //Ante Ultimo Tratamiento
                  if Variables[(Sender as TCheckBox).Tag].Seleccionado then
                  begin
                    CantVars := CantVars + 1;
                    CBDescAnteUltimoTrat.Checked := true;
                    CBFechaAnteUltimoTrat.Checked := true;
                    BDBGPreview.ColumnByField(Variables[CBDescAnteUltimoTrat.Tag].Variable).FieldName := 'ANTEULTIMO_TRAT';
                    BDBGPreview.ColumnByField(Variables[CBFechaAnteUltimoTrat.Tag].Variable).FieldName := 'FECHA_ANTEULTIMO_TRAT';
                  end
                  else
                  begin
                    BDBGPreview.ColumnByField('ANTEULTIMO_TRAT').FieldName := Variables[CBDescAnteUltimoTrat.Tag].Variable;
                    BDBGPreview.ColumnByField('FECHA_ANTEULTIMO_TRAT').FieldName := Variables[CBFechaAnteUltimoTrat.Tag].Variable;
                    CBDescAnteUltimoTrat.Checked := false;
                    CBFechaAnteUltimoTrat.Checked := false;
                    CantVars := CantVars - 1;
                  end;
               end;
        end;
      end;
  end;
end;

procedure TFREPListadosPersonalizados.ArmarDetalle;
var
  i : Integer;
begin
  BDBGDetalle.Columns.Clear;
  for i := 0 to BDBGPreview.Columns.Count-1 do
  begin
    with BDBGDetalle.Columns.Add do
    begin
      FieldName := BDBGPreview.Columns[i].FieldName;
      Visible := BDBGPreview.Columns[i].Visible;
      Width := BDBGPreview.Columns[i].Width;
      Title.Font.Style := [fsBold];
      Title.Alignment := taCenter;
      Title.Caption := BDBGPreview.Columns[i].Title.Caption;
    end;
  end;
end;

procedure TFREPListadosPersonalizados.FormCreate(Sender: TObject);
begin
  inherited;
  if (FPrincipal.Pais <> 1) then
    begin
      CBSENASA.Visible := false;
      CBCarOficial.Visible := True;
      CBCarOficial.Top := 55;
    end
  else
    begin
      CBSENASA.Visible := true;
      CBCarOficial.Visible := false;
    end;

  InicVars;
  Manga.CBxTipoRegistro.Visible := FPrincipal.FuncDEPs;
  Manga.SQLBasico := 'select id_rp, id_senasa, id_animal, id_hba, id_pc, id_otro, fecha_nacimiento, nombre, apodo from VIS_ANIMALES';
  Manga.PasarParametros(0,0);
  Manga.IBQDisponibles.Close;
  Manga.IBQDisponibles.Open;
  Manga.IBQSeleccionados.Close;
  Manga.IBQSeleccionados.Open;
  Manga.RBTodas.Checked := true;
  CantVars := 0;
  CantAnimales := 0;
  CargarPlanillasGuardadas;
  HabilitarGuardarPlanilla(false);

end;

procedure TFREPListadosPersonalizados.IIDentificacionClick(
  Sender: TObject);
begin
  inherited;
  CPIdentificacion.Visible := true;
end;

procedure TFREPListadosPersonalizados.CPClick(Sender: TObject;
  Button: TJvCapBtnStyle);
begin
  inherited;
  if Button = capClose then
    (Sender as TJvCaptionPanel).Visible := false;
end;

procedure TFREPListadosPersonalizados.ICaracteristicasClick(
  Sender: TObject);
begin
  inherited;
  CPCaracteristicas.Visible := true;
end;

procedure TFREPListadosPersonalizados.IFenotiposClick(Sender: TObject);
begin
  inherited;
  CPFenotipos.Visible := true;
end;

procedure TFREPListadosPersonalizados.IGenealogiaClick(Sender: TObject);
begin
  inherited;
  CPGenealogia.Visible := true;
end;

procedure TFREPListadosPersonalizados.IUbicacionClick(Sender: TObject);
begin
  inherited;
  CPUbicacion.Visible := true;
end;

procedure TFREPListadosPersonalizados.ISanidadClick(Sender: TObject);
begin
  inherited;
  CPSanidad.Visible := true;
end;

procedure TFREPListadosPersonalizados.IServiciosClick(Sender: TObject);
begin
  inherited;
  CPServicio.Visible := true;
end;

procedure TFREPListadosPersonalizados.IGestacionClick(Sender: TObject);
begin
  inherited;
  CPGestacion.Visible := true;
end;

procedure TFREPListadosPersonalizados.IPartosClick(Sender: TObject);
begin
  inherited;
  CPPartos.Visible := true;
end;

procedure TFREPListadosPersonalizados.ECantAnimalesChange(Sender: TObject);
begin
  inherited;
  TryStrToInt(ECantAnimales.Text,CantAnimales);
end;

procedure TFREPListadosPersonalizados.IIDentificacionMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(IIDentificacion,'RP'+#13+'SENASA'+#13+'Ident. Electrónica'+#13+'HBA'+#13+'Asociación'+#13+'Nombre'+#13+'Apodo','Identificadores');
end;

procedure TFREPListadosPersonalizados.IIDentificacionMouseLeave(
  Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFREPListadosPersonalizados.ICaracteristicasMouseEnter(
  Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(ICaracteristicas,'Categoría'+#13+'Raza'+#13+'Color'+#13+'Tipo de Registro'+#13+'Subcategorización','Caracteristicas');
end;

procedure TFREPListadosPersonalizados.ICaracteristicasMouseLeave(
  Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFREPListadosPersonalizados.IFenotiposMouseEnter(
  Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(IFenotipos,'Peso'+#13+'Circunferencia Escrotal'+#13+'Cond. Corporal'+#13+'GDR'+#13+'Alzada'+#13+'Frame','Fenotípos');
end;

procedure TFREPListadosPersonalizados.IFenotiposMouseLeave(
  Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFREPListadosPersonalizados.IGenealogiaMouseEnter(
  Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(IGenealogia,'Padre'+#13+'Madre'+#13+'Abuelo Paterno'+#13+'Abuela Paterna'+#13+'Abuelo Materno'+#13+'Abuela Materna','Genealogía');
end;

procedure TFREPListadosPersonalizados.IGenealogiaMouseLeave(
  Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFREPListadosPersonalizados.IUbicacionMouseEnter(
  Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(IUbicacion,'Potrero'+#13+'Rodeo'+#13+'Establecimiento','Ubicación');
end;

procedure TFREPListadosPersonalizados.IUbicacionMouseLeave(
  Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFREPListadosPersonalizados.ISanidadMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(ISanidad,'Ultimo Tratamiento'+#13+'Ante Ultimo Tratamiento','Sanidad');
end;

procedure TFREPListadosPersonalizados.ISanidadMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFREPListadosPersonalizados.IServiciosMouseEnter(
  Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(IServicios,'Ultimo Servicio'+#13+'Ante Ultimo Servicio','Servicios');
end;

procedure TFREPListadosPersonalizados.IServiciosMouseLeave(
  Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFREPListadosPersonalizados.IGestacionMouseEnter(
  Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(IGestacion,'Ultimo Tacto'+#13+'Ante Ultimo Tacto','Gestación');
end;

procedure TFREPListadosPersonalizados.IGestacionMouseLeave(
  Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFREPListadosPersonalizados.IPartosMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(IPartos,'Cant. Partos'+#13+'Fecha Probable de Parto'+#13+'Ultimo Parto'+#13+'Ante Ultimo Parto','Partos');
end;

procedure TFREPListadosPersonalizados.IPartosMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;


procedure TFREPListadosPersonalizados.BPrintClick(Sender: TObject);
var
  F : TFREPListadosPersonalizadosPreview;
  W, WC, I, L, j : Integer;
  qText: TQRDBText;

  anchoActual: real;
  anchoSeleccionado, anchoVertical, anchoHorizontal: real;

begin
  inherited;
  F := TFREPListadosPersonalizadosPreview.Create(self);
  F.setBDBGDetalle(BDBGDetalle);

  anchoVertical := 718;
  anchoHorizontal := 1123;
  anchoActual := F.SumaAnchosColumnas;

  if (anchoActual > anchoHorizontal) then
  begin
    MostrarMensaje(tmAdvertencia, 'La cantidad de variables seleccionadas excede el ancho de la hoja');
  end;

  if (anchoActual > anchoVertical) then
  begin
    F.ConfigurarApaisada;
    anchoSeleccionado := anchoHorizontal;
  end
  else
  begin
    anchoSeleccionado := anchoVertical;
  end;

  // Carga los encabezados

  F.CargarColumnasEncabezado(anchoSeleccionado, anchoActual);
  F.CargarColumnasDetail(anchoSeleccionado, anchoActual);


  F.QRLTituloPlanilla.Caption := EnombrePlanilla.Text;
  F.QRMObservacion.Lines.AddStrings(Mobs.Lines);
  if Manga.FCantidadSeleccionados= 0 then
     F.CantRPS1.Caption:= IntToStr(CantAnimales)
  else
     F.CantRPS1.Caption := IntToStr(Manga.FCantidadSeleccionados);
  F.QRPlanilla.Preview;
  F.Destroy;
end;

procedure TFREPListadosPersonalizados.BGuardarClick(Sender: TObject);
var
  Archivo, ArchivoTodos : TIniFile;
  I : Integer;
begin
  inherited;
  //Si el nombre de la planilla tiene "_" los elimino, porque generan conflicto para mostrar
  EnombrePlanilla.Text := StringReplace(EnombrePlanilla.Text,'_',' ',[rfReplaceAll]);
  //Agregar la planilla al indice
  try
    ArchivoTodos := TIniFile.Create(ExtractFilePath(Application.ExeName)+'IniPlanillas.ini');
    ArchivoTodos.WriteString('NOM_PLANILLA',StringReplace(EnombrePlanilla.Text,' ','_',[rfReplaceAll]),EnombrePlanilla.Text);
    ArchivoTodos.WriteString('PLANILLAS',EnombrePlanilla.Text,ExtractFilePath(Application.ExeName)+EnombrePlanilla.Text+'.ini');
  finally
    ArchivoTodos.Destroy;
  end;
  //Crear la planilla
  try
    Archivo := TIniFile.Create(ExtractFilePath(Application.ExeName)+EnombrePlanilla.Text+'.ini');
    for I := 0 to BDBGPreview.Columns.Count-1 do
    begin
      Archivo.WriteBool(IntToStr(I),'Seleccionado',BDBGPreview.Columns[I].Visible);
      Archivo.WriteString(IntToStr(I),'Nombre',BDBGPreview.Columns[I].Title.Caption);
      Archivo.WriteString(IntToStr(I),'Variable',BDBGPreview.Columns[I].FieldName);
    end;
  finally
    Archivo.Destroy;
  end;
  //Guardamos el orden de las columnas en un archivo
  BDBGPreview.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+EnombrePlanilla.Text+'_orden');
  //Refrescar planillas guardadas
  CargarPlanillasGuardadas;
end;

procedure TFREPListadosPersonalizados.CargarPlanillasGuardadas;
var
  Archivo, ArchivoTodos : TIniFile;
  I, K : Integer;
  NombrePlanilla, AuxValor : TStringList;
  DirPlanilla, Valor : String;
  Item : TTreeNode;
  Seleccionado : Boolean;
  Section : String;
begin
  TVPlanillasGuardadas.Items.Clear;
  try
    NombrePlanilla := TStringList.Create;
    AuxValor := TStringList.Create;
    AuxValor.Delimiter := '=';
    ArchivoTodos := TIniFile.Create(ExtractFilePath(Application.ExeName)+'IniPlanillas.ini');
    ArchivoTodos.ReadSectionValues('NOM_PLANILLA',NombrePlanilla);
    for I := 0 to NombrePlanilla.Count - 1 do
    begin
      AuxValor.DelimitedText := NombrePlanilla.Strings[I];
      Item := TVPlanillasGuardadas.Items.Add(nil,StringReplace(AuxValor.Strings[0],'_',' ',[rfReplaceAll]));
      DirPlanilla := ArchivoTodos.ReadString('PLANILLAS',StringReplace(AuxValor.Strings[0],'_',' ',[rfReplaceAll]),'');
      try
        Archivo := TIniFile.Create(DirPlanilla);
        for K := 1 to _CANT_VARS do
        begin
          Section := IntToStr(K-1);
          Seleccionado := Archivo.ReadBool(Section,'Seleccionado',false);
          if Seleccionado then
          begin
            Valor := Archivo.ReadString(Section,'Nombre','');
            TVPlanillasGuardadas.Items.AddChild(Item,Valor);
          end;
        end;
      finally
        Archivo.Destroy;
      end;
    end;
  finally
    ArchivoTodos.Destroy;
  end;
end;

procedure TFREPListadosPersonalizados.ISalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFREPListadosPersonalizados.ActivarColumna(Nombre : String);
var
  I : Integer;
begin
  for I := 1 to _CANT_VARS do
    if Variables[I].NomCol = Nombre then
    begin
      Variables[I].Seleccionado := true;
      Variables[I].Componete.Checked := true;
      exit;
    end;
end;

procedure TFREPListadosPersonalizados.BAbrirClick(Sender: TObject);
var
  T : TTreeNode;
  I : IntegeR;
  nombre : String;
begin
  inherited;
  InicVars;
  T := TVPlanillasGuardadas.Selected;
  for I := 0 to T.Count-1 do
  begin
    nombre := T.Item[I].Text;
    ActivarColumna(nombre);
  end;

  //Ordenamos columnas
  BDBGPreview.Columns.LoadFromFile(ExtractFilePath(Application.ExeName) + T.Text + '_orden');

end;

procedure TFREPListadosPersonalizados.ArmarExcel;
var
  I : Integer;
  column : TxlColumn;
begin
  DTXLS.Columns.Clear;
  DTXLS.DataSet:= IBQDetalle;
  DTXLS.Title.Text := EnombrePlanilla.Text;
  for I := 0 to BDBGDetalle.Columns.Count -1 do
    if BDBGDetalle.Columns[I].Visible then
      AgregarColumnaExcel(column,taCenter,0,BDBGDetalle.Columns[I].FieldName,BDBGDetalle.Columns[I].Title.Caption,true);
end;

procedure TFREPListadosPersonalizados.AgregarColumnaExcel(var column: TxlColumn;
  alig: TAlignment; coldwidth: Integer; datafield, title: String;
  save: Boolean);
  begin
    column:= TxlColumn.Create(nil);
    column:= DTXLS.Columns.Add;
    column.Alignment:= taCenter;
    column.ColWidth:= coldwidth;
    column.DataField:= datafield;
    column.Save:= save;
    column.Title:= title;
    if ((title = 'P. Actual') or (title = 'P. Nacer') or (title = 'P. Destete') or
        (title = 'P. al Año') or (title = 'P. 18 meses') or (title = 'Cric. Escrotal') or
        (title = 'Cond. Corporal') or (title = 'Alzada') or (title = 'Frame')) then
      column.DataType := FieldToCellType(ftFloat);
end;

procedure TFREPListadosPersonalizados.IGuardarExcelClick(Sender: TObject);
var
  cartel : TCartel;
begin
  inherited;
  if SDXLS.Execute then
  begin
    cartel := TCartel.getInstance;
    cartel.abrircartel('Exportando datos a Excel...');
    ArmarExcel();
    DTXLS.SaveToFile(SDXLS.FileName);
    cartel.cerrarcartel;
    cartel.FreeInstance;
  end;
end;

procedure TFREPListadosPersonalizados.HabilitarGuardarPlanilla(Habilitar: Boolean);
begin
   IGuardar.Visible := Habilitar;
   Label31.Visible := Habilitar;
end;


procedure TFREPListadosPersonalizados.EnombrePlanillaChange(
  Sender: TObject);
begin
  inherited;
  if Trim(EnombrePlanilla.Text) <> '' then
  begin
      Self.HabilitarGuardarPlanilla(true);
  end
  else
  begin
      Self.HabilitarGuardarPlanilla(false);
  end;
end;

procedure TFREPListadosPersonalizados.HabilitarVistaPrevia(Habilitar: Boolean);
begin

  Image14.Visible := Habilitar;
  Label30.Visible := Habilitar;

end;

procedure TFREPListadosPersonalizados.HabilitarExportarExcel(Habilitar: Boolean);
begin

  IGuardarExcel.Visible := Habilitar;
  Label32.Visible := Habilitar;

end;


procedure TFREPListadosPersonalizados.MangaBBAgregarUnoClick(
  Sender: TObject);
begin
  inherited;
  Manga.BBAgregarUnoClick(Sender);

end;

end.
