unit URepRankinsDeps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, DateTimePickerAuto, DBCtrls,
  UDBLookupComboBoxAuto, EditAuto, StrUtils, QuickRpt, QRCtrls, PngImage,
  jpeg, JvGIF, JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls,
  JvImage;

type
  TRegParametros = record
    usado : boolean;
    valor : double;
    es_minimo : boolean;
    parametro : String;
    filtro : String;
    entrada : String;
  end;

  TArrParametros = Array [1..36] of TRegParametros;

  TFRepRankinsDeps = class(TFUniversal)
    Ptop: TPanel;
    GroupBox1: TGroupBox;
    BBAgregar: TBitBtn;
    BBEliminar: TBitBtn;
    RGOrden: TRadioGroup;
    GroupBox3: TGroupBox;
    LBCamposSeleccionar: TListBox;
    GroupBox4: TGroupBox;
    SGSeleccionados: TStringGrid;
    DSAnimales: TDataSource;
    IBQDeps: TIBQuery;
    IBQDepsANIO: TIntegerField;
    IBQDepsANIMALRET: TIntegerField;
    IBQDepsANIMALEXTRET: TIntegerField;
    IBQDepsESTABLECIMIENTO: TIntegerField;
    IBQDepsNOMBRE_ANIMAL: TIBStringField;
    IBQDepsID_HBA: TIBStringField;
    IBQDepsNACIMIENTO: TIntegerField;
    IBQDepsGESTDEP: TIBBCDField;
    IBQDepsNACERDEP: TIBBCDField;
    IBQDepsDESTDEP: TIBBCDField;
    IBQDepsLECHEDEP: TIBBCDField;
    IBQDepsFINALDEP: TIBBCDField;
    IBQDepsCEDEP: TIBBCDField;
    IBQDepsALTURADEP: TIBBCDField;
    IBQDepsEGDDEP: TIBBCDField;
    IBQDepsEGCDEP: TIBBCDField;
    IBQDepsAOBDEP: TIBBCDField;
    IBQDepsPORGIDEP: TIBBCDField;
    IBQDepsPORCMDEP: TIBBCDField;
    IBQDepsGESTPREC: TIBBCDField;
    IBQDepsNACERPREC: TIBBCDField;
    IBQDepsDESTPREC: TIBBCDField;
    IBQDepsLECHEPREC: TIBBCDField;
    IBQDepsFINALPREC: TIBBCDField;
    IBQDepsCEPREC: TIBBCDField;
    IBQDepsALTURAPREC: TIBBCDField;
    IBQDepsEGDPREC: TIBBCDField;
    IBQDepsEGCPREC: TIBBCDField;
    IBQDepsAOBPREC: TIBBCDField;
    IBQDepsPORGIPREC: TIBBCDField;
    IBQDepsPORCMPREC: TIBBCDField;
    IBQDepsCRIAS: TIntegerField;
    IBQDepsRODEO: TIntegerField;
    IBQDepsCRIADOR: TIBStringField;
    IBQDepsCODIGO_PROPIETARIO: TIBStringField;
    IBQDepsNHIJ: TIntegerField;
    IBQDepsNHIJM: TIntegerField;
    IBQDepsNHIJU: TIntegerField;
    IBQDepsDATO_PD: TIBStringField;
    IBQDepsP18DEP: TIBBCDField;
    IBQDepsP18PREC: TIBBCDField;
    IBQDepsPADRE: TIBStringField;
    IBQDepsMADRE: TIBStringField;
    GBFiltro: TGroupBox;
    GBFiltros: TGroupBox;
    CBAnio: TCheckBox;
    EAAnio: TEditAuto;
    UDAnio: TUpDown;
    CBSexo: TCheckBox;
    CBoxSexo: TComboBox;
    CBTipoAnimal: TCheckBox;
    CBoxTipoAnimal: TComboBox;
    GroupBox5: TGroupBox;
    RBFiltrar: TRadioButton;
    RBTodas: TRadioButton;
    CBFuente: TCheckBox;
    DBLCBAFuentes: TDBLookupComboBoxAuto;
    IBQFuentes: TIBQuery;
    DSFuentes: TDataSource;
    IBQDepsSEXO: TIntegerField;
    IBQDepsFUENTE: TIBStringField;
    IBQDepsID_FUENTE: TIntegerField;
    PDEP: TPanel;
    GBCamposDEPs: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    MinNac: TEditAuto;
    MaxNac: TEditAuto;
    PrecNac: TEditAuto;
    PrecLeche: TEditAuto;
    MinDest: TEditAuto;
    PrecDest: TEditAuto;
    MinLeche: TEditAuto;
    MaxLeche: TEditAuto;
    MaxDest: TEditAuto;
    MinFinal: TEditAuto;
    MaxFinal: TEditAuto;
    PrecFinal: TEditAuto;
    MinCirc: TEditAuto;
    MaxCirc: TEditAuto;
    PrecCirc: TEditAuto;
    PrecAOB: TEditAuto;
    PrecCM: TEditAuto;
    MaxCM: TEditAuto;
    PrecEGC: TEditAuto;
    PrecGI: TEditAuto;
    MinCM: TEditAuto;
    MinEGD: TEditAuto;
    MaxGI: TEditAuto;
    MinGI: TEditAuto;
    MaxEGD: TEditAuto;
    MaxAOB: TEditAuto;
    MinAOB: TEditAuto;
    PrecEGD: TEditAuto;
    MaxEGC: TEditAuto;
    MinEGC: TEditAuto;
    MinGes: TEditAuto;
    MaxGes: TEditAuto;
    PrecGes: TEditAuto;
    PrecAltura: TEditAuto;
    MinAltura: TEditAuto;
    MaxAltura: TEditAuto;
    Caracteristicas: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label13: TLabel;
    LPromGest: TLabel;
    LPromNac: TLabel;
    LPromDest: TLabel;
    LPromLeche: TLabel;
    LPromFinal: TLabel;
    LPromCirc: TLabel;
    LPromAltura: TLabel;
    LPromEGD: TLabel;
    LPromEGC: TLabel;
    LPromAOB: TLabel;
    LPromGI: TLabel;
    LPromCM: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    LDepCM: TLabel;
    LPrecCM: TLabel;
    LDepGI: TLabel;
    LPrecGI: TLabel;
    LDepAOB: TLabel;
    LPrecAOB: TLabel;
    LDepEGC: TLabel;
    LPrecEGC: TLabel;
    LDepEGD: TLabel;
    LPrecEGD: TLabel;
    LDepAltura: TLabel;
    LPrecAltura: TLabel;
    LDepCE: TLabel;
    LPrecCE: TLabel;
    LDepFinal: TLabel;
    LPrecFinal: TLabel;
    LDepLeche: TLabel;
    LPrecLeche: TLabel;
    LDepDest: TLabel;
    LPrecDest: TLabel;
    LDepNacer: TLabel;
    LPrecNacer: TLabel;
    LDepGest: TLabel;
    LPrecGest: TLabel;
    LCrias: TLabel;
    LRodeo: TLabel;
    LNacimiento: TLabel;
    LHBA: TLabel;
    LNombre: TLabel;
    LPadre: TLabel;
    LMadre: TLabel;
    LAnio: TLabel;
    IBQEstabAnimalExt: TIBQuery;
    IBQDepsIDPADRE: TIntegerField;
    IBQDepsIDMADRE: TIntegerField;
    IBQDepsTIPOMADRE: TIBStringField;
    IBQDepsTIPOPADRE: TIBStringField;
    IBQDepsRP_ANIMAL: TIBStringField;
    Shape30: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Shape29: TShape;
    Shape31: TShape;
    Shape39: TShape;
    IBQPromediosDEPs: TIBQuery;
    PDEPsUruguay: TPanel;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Shape43: TShape;
    Shape44: TShape;
    Shape45: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Shape49: TShape;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Shape50: TShape;
    Shape51: TShape;
    Shape52: TShape;
    Shape53: TShape;
    Shape54: TShape;
    Shape55: TShape;
    Shape56: TShape;
    Shape57: TShape;
    Shape58: TShape;
    LAnioU: TLabel;
    LNombreU: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Shape59: TShape;
    Shape60: TShape;
    Shape61: TShape;
    Shape62: TShape;
    Shape63: TShape;
    Shape64: TShape;
    Label95: TLabel;
    Label96: TLabel;
    LCriadorU: TLabel;
    LPropU: TLabel;
    LNhij: TLabel;
    LNhijM: TLabel;
    LNhijU: TLabel;
    LDatoPD: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    LDepNacerU: TLabel;
    LPrecNacerU: TLabel;
    LDepEGCU: TLabel;
    LPrecEGCU: TLabel;
    LDepAOBU: TLabel;
    LPrecAOBU: TLabel;
    LDepCEU: TLabel;
    LPrecCEU: TLabel;
    LDepP18: TLabel;
    LPrecP18: TLabel;
    LPrecHL: TLabel;
    LDepHL: TLabel;
    LDepDestU: TLabel;
    LPrecDestU: TLabel;
    LHBU: TLabel;
    LNacimientoU: TLabel;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    Label87: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    Panel1: TPanel;
    GBAnimales: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    BBVerAnimales: TButton;
    IVerAnimales: TImage;
    Label88: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BBAgregarClick(Sender: TObject);
    procedure BBSalirClick(Sender: TObject);
    procedure BBEliminarClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure CBoxTipoAnimalKeyPress(Sender: TObject; var Key: Char);
    procedure RBFiltrarClick(Sender: TObject);
    procedure RBTodasClick(Sender: TObject);
    procedure CBAnioClick(Sender: TObject);
    procedure CBSexoClick(Sender: TObject);
    procedure CBTipoAnimalClick(Sender: TObject);
    procedure EAAnioKeyPress(Sender: TObject; var Key: Char);
    procedure CBFuenteClick(Sender: TObject);
    procedure IBQFuentesAfterOpen(DataSet: TDataSet);
    procedure ParametrosExit(Sender: TObject);
    procedure IBQDepsAfterOpen(DataSet: TDataSet);
    procedure BDBGAnimalesCellClick(Column: TColumn);
    procedure LNombreMouseEnter(Sender: TObject);
    procedure LNombreMouseLeave(Sender: TObject);
    procedure LNombreClick(Sender: TObject);
    procedure LPadreClick(Sender: TObject);
    procedure LMadreClick(Sender: TObject);
    procedure IBQDepsBeforeOpen(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure BBVerAnimalesClick(Sender: TObject);
  private
    { Private declarations }
    Parametros : TArrParametros;
    CantAnimales : Integer;
    procedure ComponentesPorPais;
    procedure ClearLabels;
    procedure AccederFichaPadres(ID : Integer; Externo : String);
    procedure InicPromedios();
    procedure InicParametros;
    procedure CargarDEPs;
    procedure CargarCamposSeleccionar();
    function armarOrder(): String;
    function armarFiltros(): String;
    procedure HabilitarFiltros(valor: Boolean);
    procedure ActualizarConsulta();
  public
    { Public declarations }
  end;

var
  FRepRankinsDeps: TFRepRankinsDeps;

implementation

Uses UPrincipal, URepRankinsDepsPreview, UABMPadresExternos, UREPFichaAnimal,
  IBDButtonABM, UABMSimple, UTraduccion;

{$R *.dfm}

procedure TFRepRankinsDeps.ComponentesPorPais;
begin
  if FPrincipal.Pais <> 1 then //Argentina
  begin
    case FPrincipal.Pais of   //Uruguay
      2 : begin
            BDBGAnimales.Columns[1].Title.Caption := Fprincipal.PaisHerdBook;
            PDEP.Visible := false;
            PDEPsUruguay.Visible := true;
            PDEP.Align := alNone;
            PDEPsUruguay.Align := alBottom;
{Gestacion} Label1.Visible := false; Label13.Visible := false; LPromGest.Visible := false; MinGes.Visible := false; MaxGes.Visible := false; PrecGes.Visible := false;
{Altura}    Label7.Visible := false; Label24.Visible := false; LPromAltura.Visible := false; MinAltura.Visible := false; MaxAltura.Visible := false; PrecAltura.Visible := false;
{EGD}       Label8.Visible := false; Label25.Visible := false; LPromEGD.Visible := false; MinEGD.Visible := false; MaxEGD.Visible := false; PrecEGD.Visible := false;
{% GI}      Label11.Visible := false; Label28.Visible := false; LPromGI.Visible := false; MinGI.Visible := false; MaxGI.Visible := false; PrecGI.Visible := false;
{% CM}      Label12.Visible := false; Label29.Visible := false; LPromCM.Visible := false; MinCM.Visible := false; MaxCM.Visible := false; PrecCM.Visible := false;
          end;
      else
      begin
        BDBGAnimales.Columns[1].Title.Caption := Fprincipal.PaisHerdBook;
        PDEP.Visible := false;
        PDEPsUruguay.Visible := true;
        PDEP.Align := alNone;
        PDEPsUruguay.Align := alBottom;
{Gestacion} Label1.Visible := false; Label13.Visible := false; LPromGest.Visible := false; MinGes.Visible := false; MaxGes.Visible := false; PrecGes.Visible := false;
{Altura}    Label7.Visible := false; Label24.Visible := false; LPromAltura.Visible := false; MinAltura.Visible := false; MaxAltura.Visible := false; PrecAltura.Visible := false;
{EGD}       Label8.Visible := false; Label25.Visible := false; LPromEGD.Visible := false; MinEGD.Visible := false; MaxEGD.Visible := false; PrecEGD.Visible := false;
{% GI}      Label11.Visible := false; Label28.Visible := false; LPromGI.Visible := false; MinGI.Visible := false; MaxGI.Visible := false; PrecGI.Visible := false;
{% CM}      Label12.Visible := false; Label29.Visible := false; LPromCM.Visible := false; MinCM.Visible := false; MaxCM.Visible := false; PrecCM.Visible := false;
      end
    end;
  end;
end;

procedure TFRepRankinsDeps.InicPromedios;
begin
  IBQPromediosDEPs.Close;
  IBQPromediosDEPS.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPromediosDEPs.Open;
  if not IBQPromediosDEPs.IsEmpty then
  begin
    if IBQPromediosDEPs.FieldByName('promgest').AsFloat > 0 then
      LPromGest.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promgest').AsFloat)
    else
      LPromGest.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promgest').AsFloat);
    if IBQPromediosDEPs.FieldByName('promnacer').AsFloat > 0 then
      LPromNac.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promnacer').AsFloat)
    else
      LPromNac.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promnacer').AsFloat);
    if IBQPromediosDEPs.FieldByName('promdest').AsFloat > 0 then
      LPromDest.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promdest').AsFloat)
    else
      LPromDest.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promdest').AsFloat);
    if IBQPromediosDEPs.FieldByName('promleche').AsFloat > 0 then
      LPromLeche.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promleche').AsFloat)
    else
      LPromLeche.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promleche').AsFloat);
    if IBQPromediosDEPs.FieldByName('promfinal').AsFloat > 0 then
      LPromFinal.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promfinal').AsFloat)
    else
      LPromFinal.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promfinal').AsFloat);
    if IBQPromediosDEPs.FieldByName('promce').AsFloat > 0 then
      LPromCirc.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promce').AsFloat)
    else
      LPromCirc.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promce').AsFloat);
    if IBQPromediosDEPs.FieldByName('promaltura').AsFloat > 0 then
      LPromAltura.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promaltura').AsFloat)
    else
      LPromAltura.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promaltura').AsFloat);
    if IBQPromediosDEPs.FieldByName('promegd').AsFloat > 0 then
      LPromEGD.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promegd').AsFloat)
    else
      LPromEGD.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promegd').AsFloat);
    if IBQPromediosDEPs.FieldByName('promegc').AsFloat > 0 then
      LPromEGC.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promegc').AsFloat)
    else
      LPromEGC.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promegc').AsFloat);
    if IBQPromediosDEPs.FieldByName('promaob').AsFloat > 0 then
      LPromAOB.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promaob').AsFloat)
    else
      LPromAOB.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promaob').AsFloat);
    if IBQPromediosDEPs.FieldByName('promcm').AsFloat > 0 then
      LPromCM.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promcm').AsFloat)
    else
      LPromCM.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promcm').AsFloat);
    if IBQPromediosDEPs.FieldByName('promgi').AsFloat > 0 then
      LPromGI.Caption := '+'+FloatToStr(IBQPromediosDEPs.FieldByName('promgi').AsFloat)
    else
      LPromGI.Caption := FloatToStr(IBQPromediosDEPs.FieldByName('promgi').AsFloat);
  end
  else
  begin
    LPromGest.Caption := '';
    LPromNac.Caption := '';
    LPromDest.Caption := '';
    LPromLeche.Caption := '';
    LPromFinal.Caption := '';
    LPromCirc.Caption := '';
    LPromAltura.Caption := '';
    LPromEGD.Caption := '';
    LPromEGC.Caption := '';
    LPromAOB.Caption := '';
    LPromGI.Caption := '';
    LPromCM.Caption := '';
  end
end;

procedure TFRepRankinsDeps.CargarCamposSeleccionar;
begin
  if (FPrincipal.Pais = 1) then  // Argentina
    begin
        LBCamposSeleccionar.Items.Add('GEST');
        LBCamposSeleccionar.Items.Add('NACER');
        LBCamposSeleccionar.Items.Add('DEST');
        LBCamposSeleccionar.Items.Add('LECHE');
        LBCamposSeleccionar.Items.Add('FINAL');
        LBCamposSeleccionar.Items.Add('CE');
        LBCamposSeleccionar.Items.Add('ALTURA');
        LBCamposSeleccionar.Items.Add('EGD');
        LBCamposSeleccionar.Items.Add('EGC');
        LBCamposSeleccionar.Items.Add('AOB');
        LBCamposSeleccionar.Items.Add('PORGI');
        LBCamposSeleccionar.Items.Add('PORCM');
    end
   else
    if (FPrincipal.Pais = 2) then  // Uruguay
      begin
          LBCamposSeleccionar.Items.Add('NACER');
          LBCamposSeleccionar.Items.Add('DEST');
          LBCamposSeleccionar.Items.Add('LECHE');
          LBCamposSeleccionar.Items.Add('P18');
          LBCamposSeleccionar.Items.Add('CE');
          LBCamposSeleccionar.Items.Add('AOB');
          LBCamposSeleccionar.Items.Add('EGC');
      end
       else
          begin
              LBCamposSeleccionar.Items.Add('NACER');
              LBCamposSeleccionar.Items.Add('DEST');
              LBCamposSeleccionar.Items.Add('LECHE');
              LBCamposSeleccionar.Items.Add('P18');
              LBCamposSeleccionar.Items.Add('CE');
              LBCamposSeleccionar.Items.Add('AOB');
              LBCamposSeleccionar.Items.Add('EGC');
          end;
end;

procedure TFRepRankinsDeps.FormShow(Sender: TObject);
begin
  inherited;
  //SGSeleccionados.Rows[0].Strings[0]:= 'Campo';
  //SGSeleccionados.Rows[0].Strings[1]:= 'Orden';
  ClearLabels;
  ComponentesPorPais;
  CargarCamposSeleccionar();
  InicParametros;
  InicPromedios;
  //LBCamposSeleccionar.SetFocus;
  //LBCamposSeleccionar.Selected[0]:= true;
  IBQFuentes.Close;
  IBQFuentes.Open;
end;

procedure TFRepRankinsDeps.BBAgregarClick(Sender: TObject);
var i, cant, ultimoselec: integer;
begin
  inherited;
  cant:= LBCamposSeleccionar.Count;
  i:= 0;
  ultimoselec:= 0;
  while (i < cant) do
   begin
     if (LBCamposSeleccionar.Selected[i]) then
       begin
         //LBCamposSeleccionar.Items.Delete();
         SGSeleccionados.Rows[SGSeleccionados.RowCount - 1].Strings[0]:= LBCamposSeleccionar.Items.Strings[i];
         if (RGOrden.ItemIndex = 0) then //ascendente
           SGSeleccionados.Rows[SGSeleccionados.RowCount - 1].Strings[1]:= 'ASC'
          else
           if (RGOrden.ItemIndex = 1) then //Uruguay
             SGSeleccionados.Rows[SGSeleccionados.RowCount - 1].Strings[1]:= 'DESC';

         LBCamposSeleccionar.DeleteSelected;
         cant:= cant - 1;
         SGSeleccionados.RowCount:= SGSeleccionados.RowCount + 1;
         ultimoselec:= i;
       end;
     inc(i);  
   end;

  if (ultimoselec = LBCamposSeleccionar.Count) then
     ultimoselec:= LBCamposSeleccionar.Count - 1;

  if (LBCamposSeleccionar.Count = 0) then
    BBAgregar.Enabled:= false
   else
     begin
       LBCamposSeleccionar.SetFocus;    
       LBCamposSeleccionar.Selected[ultimoselec]:= true;
     end;

  if (SGSeleccionados.RowCount >= 2) then
    BBEliminar.Enabled:= true;
end;

procedure TFRepRankinsDeps.BBSalirClick(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFRepRankinsDeps.BBEliminarClick(Sender: TObject);
var i, cant: Integer;
begin
  inherited;

  //showmessage(IntTostr(SGSeleccionados.Row));

  if ((SGSeleccionados.RowCount - 1) <> SGSeleccionados.Row) then
    begin
      LBCamposSeleccionar.Items.Add(SGSeleccionados.Rows[SGSeleccionados.Row].Strings[0]);

      i:= SGSeleccionados.Row;

      while (i < SGSeleccionados.RowCount) do
        begin
          SGSeleccionados.Rows[i].Strings[0]:= SGSeleccionados.Rows[i+1].Strings[0];
          SGSeleccionados.Rows[i].Strings[1]:= SGSeleccionados.Rows[i+1].Strings[1];
          inc(i);
        end;
      SGSeleccionados.RowCount:= SGSeleccionados.RowCount - 1;

      if (LBCamposSeleccionar.Count > 0) then
        BBAgregar.Enabled:= true
       else
         begin
//           SGSeleccionados.SetFocus;
//           SGSeleccionados.roSelected[0]:= true;
         end;


      if (SGSeleccionados.RowCount = 2) then
        BBEliminar.Enabled:= false;
    end;

//
end;

procedure TFRepRankinsDeps.BBImprimirReporteClick(Sender: TObject);
var
  query: String;
  function AgregarFiltros(Q : TQRBand) : Boolean;
  var
    ProxTop, ProxTopS : Integer;
    Indice : Integer;
    val1, val2, val3 : double;
  begin
    Result := False;
    ProxTop := 161;
    ProxTopS := 155;
    Indice := 1;
    while Indice <= 36 do
    begin
      if (Parametros[Indice].usado) or (Parametros[Indice+1].usado) or (Parametros[Indice+2].usado) then
      begin
        Result := true;
        with (TQRLabel(Q.AddPrintable(TQRLabel))) do
        begin
          AutoSize := false;
          Top := ProxTop;
          Left := 310;
          Width := 173;
          Height := 17;
          Alignment := taCenter;
          Caption := Parametros[Indice].filtro;
        end;
        val1 := -110;
        val2 := -110;
        val3 := -110;
        if Parametros[Indice].usado then
          val1 := Parametros[Indice].valor;
        if Parametros[Indice+1].usado then
          val2 := Parametros[Indice+1].valor;
        if Parametros[Indice+2].usado then
          val3 := Parametros[Indice+2].valor;

        if val1 > -100 then
        begin
          with (TQRLabel(Q.AddPrintable(TQRLabel))) do
          begin
            AutoSize := false;
            Top := ProxTop;
            Left := 499;
            Width := 41;
            Height := 17;
            Alignment := taCenter;
            Caption := FloatToStr(val1);
          end;
        end;
        if val2 > -100 then
        begin
          with (TQRLabel(Q.AddPrintable(TQRLabel))) do
          begin
            AutoSize := false;
            Top := ProxTop;
            Left := 557;
            Width := 41;
            Height := 17;
            Alignment := taCenter;
            Caption := FloatToStr(val2);
          end;
        end;
        if val3 > -100 then
        begin
          with (TQRLabel(Q.AddPrintable(TQRLabel))) do
          begin
            AutoSize := false;
            Top := ProxTop;
            Left := 610;
            Width := 41;
            Height := 17;
            Alignment := taCenter;
            Caption := FloatToStr(val3);
          end;
        end;


        with (TQRShape(Q.AddPrintable(TQRShape))) do
        begin
          Top := ProxTopS;
          Width := 361;
          Left := 304;
          Height := 7;
          Shape := qrsHorLine;
        end;
        with (TQRShape(Q.AddPrintable(TQRShape))) do
        begin
          Top := ProxTopS+23;
          Width := 361;
          Left := 304;
          Height := 7;
          Shape := qrsHorLine;
        end;

        with (TQRShape(Q.AddPrintable(TQRShape))) do
        begin
          Top := ProxTopS+3;
          Width := 7;
          Left := 301;
          Height := 24;
          Shape := qrsVertLine;
        end;
        with (TQRShape(Q.AddPrintable(TQRShape))) do
        begin
          Top := ProxTopS+3;
          Width := 7;
          Left := 488;
          Height := 24;
          Shape := qrsVertLine;
        end;
        with (TQRShape(Q.AddPrintable(TQRShape))) do
        begin
          Top := ProxTopS+3;
          Width := 7;
          Left := 546;
          Height := 24;
          Shape := qrsVertLine;
        end;
        with (TQRShape(Q.AddPrintable(TQRShape))) do
        begin
          Top := ProxTopS+3;
          Width := 7;
          Left := 599;
          Height := 24;
          Shape := qrsVertLine;
        end;
        with (TQRShape(Q.AddPrintable(TQRShape))) do
        begin
          Top := ProxTopS+3;
          Width := 7;
          Left := 661;
          Height := 24;
          Shape := qrsVertLine;
        end;
        Q.Height := Q.Height + 20;
        ProxTop := ProxTop+23;
        ProxTopS := ProxTopS+23;
      end;
      Indice := Indice+3;
    end;
  end;
begin
  inherited;
  HabilitarDesabilitarControles();

  ActualizarConsulta();
  Application.CreateForm(TFREPRankinsDepsPreview, FREPRankinsDepsPreview);
  FREPRankinsDepsPreview.Show;

  FREPRankinsDepsPreview.Hide;

  FREPRankinsDepsPreview.QRLAnimales.Caption := IntToStr(CantAnimales);

  if (FPrincipal.Pais = 1) then // Argentina
    begin
      if AgregarFiltros(FREPRankinsDepsPreview.QRBand1) then
      begin
        FREPRankinsDepsPreview.QRLT1.Enabled := true;
        FREPRankinsDepsPreview.QRLT2.Enabled := true;
        FREPRankinsDepsPreview.QRLT3.Enabled := true;
        FREPRankinsDepsPreview.QRLT4.Enabled := true;
      end;
      FREPRankinsDepsPreview.QRRankinsDepsArgentina.Preview;
    end
   else
    if (FPrincipal.Pais = 2) then // Uruguay
      begin
        if AgregarFiltros(FREPRankinsDepsPreview.QRBand4) then
        begin
          FREPRankinsDepsPreview.QRLT1.Enabled := true;
          FREPRankinsDepsPreview.QRLT2.Enabled := true;
          FREPRankinsDepsPreview.QRLT3.Enabled := true;
          FREPRankinsDepsPreview.QRLT4.Enabled := true;
        end;
        FREPRankinsDepsPreview.QRRankinsDepsUruguay.Preview;
      end
     else
        begin
          FREPRankinsDepsPreview.QRRankinsDepsUruguay.Preview;
        end;
  FREPRankinsDepsPreview.Close;

  HabilitarDesabilitarControles();
end;

function TFRepRankinsDeps.armarOrder: String;
var i :Integer;
    query: String;
begin
  i:= 1;
  query:= ' order by ';
  while (i <= SGSeleccionados.RowCount - 1) do
    begin
      if ((i <> 1) and (i <> (SGSeleccionados.RowCount - 1))) then
        query:= query + ',';

      if (SGSeleccionados.Rows[i].Strings[0] <> '') then
        query:= query +  SGSeleccionados.Rows[i].Strings[0] + 'DEP ' + SGSeleccionados.Rows[i].Strings[1];
      inc(i);
    end;
  if (query = ' order by ') then
    query:= '';
  result:= query;
end;

procedure TFRepRankinsDeps.CBoxTipoAnimalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := #0;
end;

procedure TFRepRankinsDeps.RBFiltrarClick(Sender: TObject);
begin
  inherited;
  HabilitarFiltros(RBFiltrar.Checked);
end;

procedure TFRepRankinsDeps.RBTodasClick(Sender: TObject);
begin
  inherited;
  HabilitarFiltros(not RBTodas.Checked);
end;

procedure TFRepRankinsDeps.HabilitarFiltros(valor: Boolean);
begin
  cbanio.Enabled:= valor;
  EAAnio.Enabled:= valor;
  UDAnio.Enabled:= valor;
  CBSexo.Enabled:= valor;
  CBoxSexo.Enabled:= valor;
  CBTipoAnimal.Enabled:= valor;
  CBoxTipoAnimal.Enabled:= valor;
  CBFuente.Enabled := valor;

  if (RBFiltrar.Checked) then
    begin
      EAAnio.Enabled:= CBAnio.Checked;
      UDAnio.Enabled:= CBAnio.Checked;
      CBoxSexo.Enabled:= CBSexo.Checked;
      CBoxTipoAnimal.Enabled:= CBTipoAnimal.Checked;
      DBLCBAFuentes.Enabled := CBFuente.Checked;
    end;
end;

procedure TFRepRankinsDeps.ActualizarConsulta;
var
  query : String;
  Indice : Integer;
begin
  query := 'SELECT * FROM REP_RANKING_DEPS(:ESTA,';
  query := query + ':MIN_GESTDEP,:MIN_NACERDEP,:MIN_DESTDEP,:MIN_LECHEDEP,:MIN_FINALDEP,:MIN_CEDEP,:MIN_ALTURADEP,:MIN_EGDDEP,:MIN_EGCDEP,';
  query := query + ':MIN_AOBDEP,:MIN_PORGIDEP,:MIN_PORCMDEP,:MAX_GESTDEP,:MAX_NACERDEP,:MAX_DESTDEP,:MAX_LECHEDEP,:MAX_FINALDEP,:MAX_CEDEP,';
  query := query + ':MAX_ALTURADEP,:MAX_EGDDEP,:MAX_EGCDEP,:MAX_AOBDEP,:MAX_PORGIDEP,:MAX_PORCMDEP,:GESTPREC_MIN,:NACERPREC_MIN,:DESTPREC_MIN,';
  query := query + ':LECHEPREC_MIN,:FINALPREC_MIN,:CEPREC_MIN,:ALTURAPREC_MIN,:EGDPREC_MIN,:EGCPREC_MIN,:AOBPREC_MIN,:PORGIPREC_MIN,:PORCMPREC_MIN)';
  for Indice := 1 to 36 do
    if Parametros[Indice].usado then
    begin
      if AnsiContainsText(query,'order by') then
        query := query+','+Parametros[Indice].parametro+' DESC'
      else
        query := query+' order by '+Parametros[Indice].parametro+' DESC';
    end;
  IBQDeps.Close;
  IBQDeps.SQL.Clear;
  IBQDeps.SQL.Add(query);
 //IBQDeps.SQL.Add(armarFiltros());
 //IBQDeps.SQL.Add(armarOrder());
  for Indice := 1 to 36 do
    if Parametros[Indice].usado then
      IBQDeps.ParamByName(Parametros[Indice].entrada).Value := Parametros[Indice].valor
    else
      IBQDeps.ParamByName(Parametros[Indice].entrada).Value := null;
  IBQDeps.ParamByName('ESTA').AsInteger := Fprincipal.EstablecimientoActual;
  IBQDeps.Open;
end;

function TFRepRankinsDeps.armarFiltros: String;
var query: String;
    sexo: String;
begin
  if (RBFiltrar.Checked) then
    begin
      if ((CBAnio.Checked) or (CBSexo.Checked) or (CBTipoAnimal.Checked) or (CBFuente.Checked)) then
        begin
          query:= ' where ';
          if (CBAnio.Checked) then
            query:= query + ' anio = ' + EAAnio.Text + ' and ';

          if (CBSexo.Checked) then
          begin
            if (CBoxSexo.Text = 'MACHOS') then
              query:= query + ' sexo = 1 and '
            else
              if (CBoxSexo.Text = 'HEMBRAS') then
                query:= query + ' sexo = 2 and ';
          end;

          if (CBTipoAnimal.Checked) then
          begin
            if (CBoxTipoAnimal.Text = 'INTERNOS') then
              query:= query + 'animalret is not null and '
            else
              if (CBoxTipoAnimal.Text = 'EXTERNOS') then
                query:= query + 'animalextret is not null and ';
          end;

          if (CBFuente.Checked) then
            if DBLCBAFuentes.KeyValue <> null then
              query := query + 'id_fuente = ' +IntToStr(DBLCBAFuentes.KeyValue)+' and ';

          query:= query + ' 1 = 1';
        end;
    end;
  result:= query;
end;

procedure TFRepRankinsDeps.CBAnioClick(Sender: TObject);
begin
  inherited;
  EAAnio.Enabled := CBAnio.Checked;
  UDAnio.Enabled := CBAnio.Checked;  
end;

procedure TFRepRankinsDeps.CBSexoClick(Sender: TObject);
begin
  inherited;
  CBoxSexo.Enabled:= CBSexo.Checked;
end;

procedure TFRepRankinsDeps.CBTipoAnimalClick(Sender: TObject);
begin
  inherited;
  CBoxTipoAnimal.Enabled:= CBTipoAnimal.Checked;
end;

procedure TFRepRankinsDeps.EAAnioKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((not (key in (['0'..'9'])) or (Length(TEditAuto(Sender).Text) >= 4)) and (key <> #8)) then
     key:=#0;
end;

procedure TFRepRankinsDeps.CBFuenteClick(Sender: TObject);
begin
  inherited;
  DBLCBAFuentes.Enabled := CBFuente.Checked;
end;

procedure TFRepRankinsDeps.IBQFuentesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
end;

procedure TFRepRankinsDeps.InicParametros;
var
  Indice : Integer;
begin
  for Indice := 1 to 36 do
  begin
    case Indice of
      1,2 : begin
              Parametros[Indice].parametro := 'GESTDEP';
              Parametros[Indice].es_minimo := Indice = 1;
              Parametros[Indice].filtro := 'Largo de Gestación:';
              if Indice = 1 then
                Parametros[Indice].entrada := 'MIN_GESTDEP'
              else
                Parametros[Indice].entrada := 'MAX_GESTDEP';
            end;
      3 : begin
            Parametros[Indice].parametro := 'GESTPREC';
            Parametros[Indice].es_minimo := true;
            Parametros[Indice].filtro := 'Largo de Gestación:';
            Parametros[Indice].entrada := 'GESTPREC_MIN';
          end;
      4,5 : begin
              Parametros[Indice].parametro := 'NACERDEP';
              Parametros[Indice].es_minimo := Indice = 4;
              Parametros[Indice].filtro := 'Peso al Nacer:';
              if Indice = 4 then
                Parametros[Indice].entrada := 'MIN_NACERDEP'
              else
                Parametros[Indice].entrada := 'MAX_NACERDEP';
            end;
      6 : begin
            Parametros[Indice].parametro := 'NACERPREC';
            Parametros[Indice].es_minimo := true;
            Parametros[Indice].filtro := 'Peso al Nacer:';
            Parametros[Indice].entrada := 'NACERPREC_MIN';
          end;
      7,8 : begin
              Parametros[Indice].parametro := 'DESTDEP';
              Parametros[Indice].es_minimo := Indice = 7;
              Parametros[Indice].filtro := 'Peso al Destete';
              if Indice = 7 then
                Parametros[Indice].entrada := 'MIN_DESTDEP'
              else
                Parametros[Indice].entrada := 'MAX_DESTDEP';
            end;
      9 : begin
            Parametros[Indice].parametro := 'DESTPREC';
            Parametros[Indice].es_minimo := true;
            Parametros[Indice].filtro := 'Peso al Destete';
            Parametros[Indice].entrada := 'DESTPREC_MIN';
          end;
      10,11 : begin
                Parametros[Indice].parametro := 'LECHEDEP';
                Parametros[Indice].es_minimo := Indice = 10;
                Parametros[Indice].filtro := 'Leche:';
                if Indice = 10 then
                Parametros[Indice].entrada := 'MIN_LECHEDEP'
              else
                Parametros[Indice].entrada := 'MAX_LECHEDEP';
              end;
      12 : begin
            Parametros[Indice].parametro := 'LECHEPREC';
            Parametros[Indice].es_minimo := true;
            Parametros[Indice].filtro := 'Leche:';
            Parametros[Indice].entrada := 'LECHEPREC_MIN';
           end;
      13,14 : begin
                Parametros[Indice].parametro := 'FINALDEP';
                Parametros[Indice].es_minimo := Indice = 13;
                Parametros[Indice].filtro := 'Peso Final:';
                if Indice = 13 then
                Parametros[Indice].entrada := 'MIN_FINALDEP'
              else
                Parametros[Indice].entrada := 'MAX_FINALDEP';
              end;
      15 : begin
            Parametros[Indice].parametro := 'FINALPREC';
            Parametros[Indice].es_minimo := true;
            Parametros[Indice].filtro := 'Peso Final:';
            Parametros[Indice].entrada := 'FINALPREC_MIN';
           end;
      16,17 : begin
                Parametros[Indice].parametro := 'CEDEP';
                Parametros[Indice].es_minimo := Indice = 16;
                Parametros[Indice].filtro := 'Circunferencia Escrotal:';
                if Indice = 16 then
                  Parametros[Indice].entrada := 'MIN_CEDEP'
                else
                  Parametros[Indice].entrada := 'MAX_CEDEP';
              end;
      18 : begin
            Parametros[Indice].parametro := 'CEPREC';
            Parametros[Indice].es_minimo := true;
            Parametros[Indice].filtro := 'Circunferencia Escrotal:';
            Parametros[Indice].entrada := 'CEPREC_MIN';
          end;
      19,20 : begin
                Parametros[Indice].parametro := 'ALTURADEP';
                Parametros[Indice].es_minimo := Indice = 19;
                Parametros[Indice].filtro := 'Altura:';
                if Indice = 19 then
                  Parametros[Indice].entrada := 'MIN_ALTURADEP'
                else
                  Parametros[Indice].entrada := 'MAX_ALTURADEP';
              end;
      21 : begin
            Parametros[indice].parametro := 'ALTURAPREC';
            Parametros[Indice].es_minimo := true;
            Parametros[Indice].filtro := 'Altura:';
            Parametros[Indice].entrada := 'ALTURAPREC_MIN';
          end;
      22,23 : begin
                Parametros[Indice].parametro := 'EGDDEP';
                Parametros[Indice].es_minimo := Indice = 22;
                Parametros[Indice].filtro := 'Espesor de Grasa Dorsal:';
                if Indice = 22 then
                  Parametros[Indice].entrada := 'MIN_EGDDEP'
                else
                  Parametros[Indice].entrada := 'MAX_EGDDEP';
              end;
      24 : begin
              Parametros[Indice].parametro := 'EGDPREC';
              Parametros[Indice].es_minimo := true;
              Parametros[Indice].filtro := 'Espesor de Grasa Dorsal:';
              Parametros[Indice].entrada := 'EGDPREC_MIN';
            end;
      25,26 : begin
                Parametros[Indice].parametro := 'EGCDEP';
                Parametros[Indice].es_minimo := Indice = 25;
                Parametros[Indice].filtro := 'Espesor de Grasa de Cadera:';
                if Indice = 25 then
                  Parametros[Indice].entrada := 'MIN_EGCDEP'
                else
                  Parametros[Indice].entrada := 'MAX_EGCDEP';
              end;
      27 : begin
            Parametros[Indice].parametro := 'EGCPREC';
            Parametros[Indice].es_minimo := true;
            Parametros[Indice].filtro := 'Espesor de Grasa de Cadera:';
            Parametros[Indice].entrada := 'EGCPREC_MIN';
            end;
      28,29 : begin
                Parametros[Indice].parametro := 'AOBDEP';
                Parametros[Indice].es_minimo := indice = 28;
                Parametros[Indice].filtro := 'Area Ojo de Bife:';
                if Indice = 28 then
                  Parametros[Indice].entrada := 'MIN_AOBDEP'
                else
                  Parametros[Indice].entrada := 'MAX_AOBDEP';
              end;
      30 : begin
            Parametros[Indice].parametro := 'AOBPREC';
            Parametros[Indice].es_minimo := true;
            Parametros[Indice].filtro := 'Area Ojo de Bife:';
            Parametros[Indice].entrada := 'AOBPREC_MIN';
          end;
      31,32 : begin
                Parametros[Indice].parametro := 'PORGIDEP';
                Parametros[Indice].es_minimo := Indice = 31;
                Parametros[Indice].filtro := '% Grasa Intramuscular:';
                if Indice = 31 then
                  Parametros[Indice].entrada := 'MIN_PORGIDEP'
                else
                  Parametros[Indice].entrada := 'MAX_PORGIDEP';
              end;
      33 : begin
              Parametros[Indice].parametro := 'PORGIPREC';
              Parametros[Indice].es_minimo := true;
              Parametros[Indice].filtro := '% Grasa Intramuscular:';
              Parametros[Indice].entrada := 'PORGIPREC_MIN';
          end;
      34,35 : begin
                Parametros[Indice].parametro := 'PORCMDEP';
                Parametros[Indice].es_minimo := Indice = 34;
                Parametros[Indice].filtro := '% Cortes Minoristas:';
                if Indice = 34 then
                  Parametros[Indice].entrada := 'MIN_PORCMDEP'
                else
                  Parametros[Indice].entrada := 'MAX_PORCMDEP';
              end;
      36 : begin
            Parametros[Indice].parametro := 'PORCMPREC';
            Parametros[Indice].es_minimo := true;
            Parametros[Indice].filtro := '% Cortes Minoristas:';
            Parametros[Indice].entrada := 'PORCMPREC_MIN';
            end;
    end;
    Parametros[Indice].usado := false;
    Parametros[indice].valor := -110;
  end;

end;

procedure TFRepRankinsDeps.ParametrosExit(Sender: TObject);
var
  valor : double;
begin
  inherited;
  if tryStrToFloat((Sender as TEditAuto).Text, valor) then
  begin
    Parametros[(Sender as TEditAuto).Tag].usado := true;
    Parametros[(Sender as TEditAuto).Tag].valor := valor;
    //ActualizarConsulta();
  end
  else
  begin
    (Sender as TEditAuto).Text := '';
    Parametros[(Sender as TEditAuto).Tag].usado := false;
    Parametros[(Sender as TEditAuto).Tag].valor := -110;
    //ActualizarConsulta();
  end;
end;

procedure TFRepRankinsDeps.IBQDepsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
  CantAnimales := DataSet.RecordCount;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(CantAnimales)+']';
  LPreview.Enabled := not DataSet.IsEmpty;
  IPreview.Enabled := not DataSet.IsEmpty;
end;

procedure TFRepRankinsDeps.CargarDEPs;
begin
  ClearLabels;
  case FPrincipal.Pais of
    1 : begin
          if IBQDeps.FieldValues['anio'] <> null then
            LAnio.Caption := IBQDeps.FieldValues['anio']
          else
            LAnio.Caption := '';
          if IBQDeps.FieldValues['nacimiento'] <> null then
            LNacimiento.Caption := IBQDeps.FieldValues['nacimiento']
          else
            LNacimiento.Caption := '';
          if IBQDeps.FieldValues['nombre_animal'] <> null then
            LNombre.Caption := IBQDeps.FieldValues['nombre_animal']
          else
            LNombre.Caption := '';
          if IBQDeps.FieldValues['id_hba'] <> null then
            LHBA.Caption := IBQDeps.FieldValues['id_hba']
          else
            LHBA.Caption := '';
          if IBQDeps.FieldValues['padre'] <> null then
            LPadre.Caption := IBQDeps.FieldValues['padre']
          else
            LPadre.Caption := '';
          if IBQDeps.FieldValues['madre'] <> null then
            LMadre.Caption := IBQDeps.FieldValues['madre']
          else
            LMadre.Caption := '';
          if IBQDeps.FieldValues['crias'] <> null then
            LCrias.Caption := IBQDeps.FieldValues['crias']
          else
            LCrias.Caption := '';
          if IBQDeps.FieldValues['rodeo'] <> null then
            LRodeo.Caption := IBQDeps.FieldValues['rodeo']
          else
            LRodeo.Caption := '';
          if IBQDeps.FieldValues['gestdep'] <> null then
          begin
            if IBQDeps.FieldByName('gestdep').AsFloat > 0 then
              LDepGest.Caption := '+'+FloatToStr(IBQDeps.FieldByName('gestdep').AsFloat)
            else
              LDepGest.Caption := IBQDeps.FieldValues['gestdep']
          end
          else
            LDepGest.Caption := '';
          if IBQDeps.FieldValues['gestprec'] <> null then
            LPrecGest.Caption := IBQDeps.FieldValues['gestprec']
          else
            LPrecGest.Caption := '';
          if IBQDeps.FieldValues['nacerdep'] <> null then
          begin
            if IBQDeps.FieldByName('nacerdep').AsFloat > 0 then
              LDepNacer.Caption := '+'+FloatToStr(IBQDeps.FieldByName('nacerdep').AsFloat)
            else
              LDepNacer.Caption := IBQDeps.FieldValues['nacerdep'];
          end
          else
            LDepNacer.Caption := '';
          if IBQDeps.FieldValues['nacerprec'] <> null then
            LPrecNacer.Caption := IBQDeps.FieldValues['nacerprec']
          else
            LPrecNacer.Caption := '';
          if IBQDeps.FieldValues['destdep'] <> null then
          begin
            if IBQDeps.FieldByName('destdep').AsFloat > 0 then
              LDepDest.Caption := '+'+FloatToStr(IBQDeps.FieldByName('destdep').AsFloat)
            else
              LDepDest.Caption := IBQDeps.FieldValues['destdep'];
          end
          else
            LDepDest.Caption := '';
          if IBQDeps.FieldValues['destprec'] <> null then
            LPrecDest.Caption := IBQDeps.FieldValues['destprec']
          else
            LPrecDest.Caption := '';
          if IBQDeps.FieldValues['lechedep'] <> null then
          begin
            if IBQDeps.FieldByName('lechedep').AsFloat > 0 then
              LDepLeche.Caption := '+'+FloatToStr(IBQDeps.FieldByName('lechedep').AsFloat)
            else
              LDepLeche.Caption := IBQDeps.FieldValues['lechedep'];
          end
          else
            LDepLeche.Caption := '';
          if IBQDeps.FieldValues['lecheprec'] <> null then
            LPrecLeche.Caption := IBQDeps.FieldValues['lecheprec']
          else
            LPrecLeche.Caption := '';
          if IBQDeps.FieldValues['finaldep'] <> null then
          begin
            if IBQDeps.FieldByName('finaldep').AsFloat > 0 then
              LDepFinal.Caption := '+'+FloatToStr(IBQDeps.FieldByName('finaldep').AsFloat)
            else
              LDepFinal.Caption := IBQDeps.FieldValues['finaldep'];
          end
          else
            LDepFinal.Caption := '';
          if IBQDeps.FieldValues['finalprec'] <> null then
            LPrecFinal.Caption := IBQDeps.FieldValues['finalprec']
          else
            LPrecFinal.Caption := '';
          if IBQDeps.FieldValues['cedep'] <> null then
          begin
            if IBQDeps.FieldByName('cedep').AsFloat > 0 then
              LDepCE.Caption := '+'+FloatToStr(IBQDeps.FieldByName('cedep').AsFloat)
            else
              LDepCE.Caption := IBQDeps.FieldValues['cedep'];
          end
          else
            LDepCE.Caption := '';
          if IBQDeps.FieldValues['ceprec'] <> null then
            LPrecCE.Caption := IBQDeps.FieldValues['ceprec']
          else
            LPrecCE.Caption := '';
          if IBQDeps.FieldValues['alturadep'] <> null then
          begin
            if IBQDeps.FieldByName('alturadep').AsFloat > 0 then
              LDepAltura.Caption := '+'+FloatToStr(IBQDeps.FieldByName('alturadep').AsFloat)
            else
              LDepAltura.Caption := IBQDeps.FieldValues['alturadep']
          end
          else
            LDepAltura.Caption := '';
          if IBQDeps.FieldValues['alturaprec'] <> null then
            LPrecAltura.Caption := IBQDeps.FieldValues['alturaprec']
          else
            LPrecAltura.Caption := '';
          if IBQDeps.FieldValues['egddep'] <> null then
          begin
            if IBQDeps.FieldByName('egddep').AsFloat > 0 then
              LDepEGD.Caption := '+'+FloatToStr(IBQDeps.FieldByName('egddep').AsFloat)
            else
              LDepEGD.Caption := IBQDeps.FieldValues['egddep'];
          end
          else
            LDepEGD.Caption := '';
          if IBQDeps.FieldValues['egdprec'] <> null then
            LPrecEGD.Caption := IBQDeps.FieldValues['egdprec']
          else
            LPrecEGD.Caption := '';
          if IBQDeps.FieldValues['egcdep'] <> null then
          begin
            if IBQDeps.FieldByName('egcdep').AsFloat > 0 then
              LDepEGC.Caption := '+'+FloatToStr(IBQDeps.FieldByName('egcdep').AsFloat)
            else
              LDepEGC.Caption := IBQDeps.FieldValues['egcdep']
          end
          else
            LDepEGC.Caption := '';
          if IBQDeps.FieldValues['egcprec'] <> null then
            LPrecEGC.Caption := IBQDeps.FieldValues['egcprec']
          else
            LPrecEGC.Caption := '';
          if IBQDeps.FieldValues['aobdep'] <> null then
          begin
            if IBQDeps.FieldByName('aobdep').AsFloat > 0 then
              LDepAOB.Caption := '+'+FloatToStr(IBQDeps.FieldByName('aobdep').AsFloat)
            else
              LDepAOB.Caption := IBQDeps.FieldValues['aobdep'];
          end
          else
            LDepAOB.Caption := '';
          if IBQDeps.FieldValues['aobprec'] <> null then
            LPrecAOB.Caption := IBQDeps.FieldValues['aobprec']
          else
            LPrecAOB.Caption := '';
          if IBQDeps.FieldValues['porcmdep'] <> null then
          begin
            if IBQDeps.FieldByName('porcmdep').AsFloat > 0 then
              LDepCM.Caption := '+'+FloatToStr(IBQDeps.FieldByName('porcmdep').AsFloat)
            else
              LDepCM.Caption := IBQDeps.FieldValues['porcmdep'];
          end
          else
            LDepCM.Caption := '';
          if IBQDeps.FieldValues['porcmprec'] <> null then
            LPrecCM.Caption := IBQDeps.FieldValues['porcmprec']
          else
            LPrecCM.Caption := '';
          if IBQDeps.FieldValues['porgidep'] <> null then
          begin
            if IBQDeps.FieldByName('porgidep').AsFloat > 0 then
              LDepGI.Caption := '+'+FloatToStr(IBQDeps.FieldByName('porgidep').AsFloat)
            else
              LDepGI.Caption := IBQDeps.FieldValues['porgidep'];
          end
          else
            LDepGI.Caption := '';
          if IBQDeps.FieldValues['porgiprec'] <> null then
            LPrecGI.Caption := IBQDeps.FieldValues['porgiprec']
          else
            LPrecGI.Caption := '';
        end;
    2 : begin
          if IBQDeps.FieldValues['anio'] <> null then
            LAnioU.Caption := IBQDeps.FieldValues['anio']
          else
            LAnioU.Caption := '';
          if IBQDeps.FieldValues['nacimiento'] <> null then
            LNacimientoU.Caption := IBQDeps.FieldValues['nacimiento']
          else
            LNacimientoU.Caption := '';
          if IBQDeps.FieldValues['nombre_animal'] <> null then
            LNombreU.Caption := IBQDeps.FieldValues['nombre_animal']
          else
            LNombreU.Caption := '';
          if IBQDeps.FieldValues['id_hba'] <> null then
            LHBU.Caption := IBQDeps.FieldValues['id_hba']
          else
            LHBU.Caption := '';
          if IBQDeps.FieldValues['criador'] <> null then
            LCriadorU.Caption := IBQDeps.FieldValues['criador']
          else
            LCriadorU.Caption := '';
          if IBQDeps.FieldValues['codigo_propietario'] <> null then
            LPropU.Caption := IBQDeps.FieldValues['codigo_propietario']
          else
            LPropU.Caption := '';
          if IBQDeps.FieldValues['nhij'] <> null then
            LNhij.Caption := IBQDeps.FieldValues['nhij']
          else
            LNhij.Caption := '';
          if IBQDeps.FieldValues['nhijm'] <> null then
            LNhijM.Caption := IBQDeps.FieldValues['nhijm']
          else
            LNhijM.Caption := '';
          if IBQDeps.FieldValues['nhiju'] <> null then
            LNhijU.Caption := IBQDeps.FieldValues['nhiju']
          else
            LNhijU.Caption := '';
          if IBQDeps.FieldValues['dato_pd'] <> null then
            LDatoPD.Caption := IBQDeps.FieldValues['dato_pd']
          else
            LDatoPD.Caption := '';
          if IBQDeps.FieldValues['nacerdep'] <> null then
          begin
            if IBQDeps.FieldByName('nacerdep').AsFloat > 0 then
              LDepNacerU.Caption := '+'+FloatToStr(IBQDeps.FieldByName('nacerdep').AsFloat)
            else
              LDepNacerU.Caption := IBQDeps.FieldValues['nacerdep'];
          end
          else
            LDepNacerU.Caption := '';
          if IBQDeps.FieldValues['nacerprec'] <> null then
            LPrecNacerU.Caption := IBQDeps.FieldValues['nacerprec']
          else
            LPrecNacerU.Caption := '';
          if IBQDeps.FieldValues['destdep'] <> null then
          begin
            if IBQDeps.FieldByName('destdep').AsFloat > 0 then
              LDepDestU.Caption := '+'+FloatToStr(IBQDeps.FieldByName('destdep').AsFloat)
            else
              LDepDestU.Caption := IBQDeps.FieldValues['destdep'];
          end
          else
            LDepDestU.Caption := '';
          if IBQDeps.FieldValues['destprec'] <> null then
            LPrecDestU.Caption := IBQDeps.FieldValues['destprec']
          else
            LPrecDestU.Caption := '';
          if IBQDeps.FieldValues['lechedep'] <> null then
          begin
            if IBQDeps.FieldByName('lechedep').AsFloat > 0 then
              LDepHL.Caption := '+'+FloatToStr(IBQDeps.FieldByName('lechedep').AsFloat)
            else
              LDepHL.Caption := IBQDeps.FieldValues['lechedep'];
          end
          else
            LDepHL.Caption := '';
          if IBQDeps.FieldValues['lecheprec'] <> null then
            LPrecHL.Caption := IBQDeps.FieldValues['lecheprec']
          else
            LPrecHL.Caption := '';
          if IBQDeps.FieldValues['finaldep'] <> null then
          begin
            if IBQDeps.FieldByName('finaldep').AsFloat > 0 then
              LDepP18.Caption := '+'+FloatToStr(IBQDeps.FieldByName('finaldep').AsFloat)
            else
              LDepP18.Caption := IBQDeps.FieldValues['finaldep'];
          end
          else
            LDepP18.Caption := '';
          if IBQDeps.FieldValues['finalprec'] <> null then
            LPrecP18.Caption := IBQDeps.FieldValues['finalprec']
          else
            LPrecP18.Caption := '';
          if IBQDeps.FieldValues['cedep'] <> null then
          begin
            if IBQDeps.FieldByName('cedep').AsFloat > 0 then
              LDepCEU.Caption := '+'+FloatToStr(IBQDeps.FieldByName('cedep').AsFloat)
            else
              LDepCEU.Caption := IBQDeps.FieldValues['cedep'];
          end
          else
            LDepCEU.Caption := '';
          if IBQDeps.FieldValues['ceprec'] <> null then
            LPrecCEU.Caption := IBQDeps.FieldValues['ceprec']
          else
            LPrecCEU.Caption := '';
          if IBQDeps.FieldValues['egcdep'] <> null then
          begin
            if IBQDeps.FieldByName('egcdep').AsFloat > 0 then
              LDepEGCU.Caption := '+'+FloatToStr(IBQDeps.FieldByName('egcdep').AsFloat)
            else
              LDepEGCU.Caption := IBQDeps.FieldValues['egcdep']
          end
          else
            LDepEGCU.Caption := '';
          if IBQDeps.FieldValues['egcprec'] <> null then
            LPrecEGCU.Caption := IBQDeps.FieldValues['egcprec']
          else
            LPrecEGCU.Caption := '';
          if IBQDeps.FieldValues['aobdep'] <> null then
          begin
            if IBQDeps.FieldByName('aobdep').AsFloat > 0 then
              LDepAOBU.Caption := '+'+FloatToStr(IBQDeps.FieldByName('aobdep').AsFloat)
            else
              LDepAOBU.Caption := IBQDeps.FieldValues['aobdep'];
          end
          else
            LDepAOBU.Caption := '';
          if IBQDeps.FieldValues['aobprec'] <> null then
            LPrecAOBU.Caption := IBQDeps.FieldValues['aobprec']
          else
            LPrecAOBU.Caption := '';
        end;
        else
        begin
          if IBQDeps.FieldValues['anio'] <> null then
            LAnioU.Caption := IBQDeps.FieldValues['anio']
          else
            LAnioU.Caption := '';
          if IBQDeps.FieldValues['nacimiento'] <> null then
            LNacimientoU.Caption := IBQDeps.FieldValues['nacimiento']
          else
            LNacimientoU.Caption := '';
          if IBQDeps.FieldValues['nombre_animal'] <> null then
            LNombreU.Caption := IBQDeps.FieldValues['nombre_animal']
          else
            LNombreU.Caption := '';
          if IBQDeps.FieldValues['id_hba'] <> null then
            LHBU.Caption := IBQDeps.FieldValues['id_hba']
          else
            LHBU.Caption := '';
          if IBQDeps.FieldValues['criador'] <> null then
            LCriadorU.Caption := IBQDeps.FieldValues['criador']
          else
            LCriadorU.Caption := '';
          if IBQDeps.FieldValues['codigo_propietario'] <> null then
            LPropU.Caption := IBQDeps.FieldValues['codigo_propietario']
          else
            LPropU.Caption := '';
          if IBQDeps.FieldValues['nhij'] <> null then
            LNhij.Caption := IBQDeps.FieldValues['nhij']
          else
            LNhij.Caption := '';
          if IBQDeps.FieldValues['nhijm'] <> null then
            LNhijM.Caption := IBQDeps.FieldValues['nhijm']
          else
            LNhijM.Caption := '';
          if IBQDeps.FieldValues['nhiju'] <> null then
            LNhijU.Caption := IBQDeps.FieldValues['nhiju']
          else
            LNhijU.Caption := '';
          if IBQDeps.FieldValues['dato_pd'] <> null then
            LDatoPD.Caption := IBQDeps.FieldValues['dato_pd']
          else
            LDatoPD.Caption := '';
          if IBQDeps.FieldValues['nacerdep'] <> null then
          begin
            if IBQDeps.FieldByName('nacerdep').AsFloat > 0 then
              LDepNacerU.Caption := '+'+FloatToStr(IBQDeps.FieldByName('nacerdep').AsFloat)
            else
              LDepNacerU.Caption := IBQDeps.FieldValues['nacerdep'];
          end
          else
            LDepNacerU.Caption := '';
          if IBQDeps.FieldValues['nacerprec'] <> null then
            LPrecNacerU.Caption := IBQDeps.FieldValues['nacerprec']
          else
            LPrecNacerU.Caption := '';
          if IBQDeps.FieldValues['destdep'] <> null then
          begin
            if IBQDeps.FieldByName('destdep').AsFloat > 0 then
              LDepDestU.Caption := '+'+FloatToStr(IBQDeps.FieldByName('destdep').AsFloat)
            else
              LDepDestU.Caption := IBQDeps.FieldValues['destdep'];
          end
          else
            LDepDestU.Caption := '';
          if IBQDeps.FieldValues['destprec'] <> null then
            LPrecDestU.Caption := IBQDeps.FieldValues['destprec']
          else
            LPrecDestU.Caption := '';
          if IBQDeps.FieldValues['lechedep'] <> null then
          begin
            if IBQDeps.FieldByName('lechedep').AsFloat > 0 then
              LDepHL.Caption := '+'+FloatToStr(IBQDeps.FieldByName('lechedep').AsFloat)
            else
              LDepHL.Caption := IBQDeps.FieldValues['lechedep'];
          end
          else
            LDepHL.Caption := '';
          if IBQDeps.FieldValues['lecheprec'] <> null then
            LPrecHL.Caption := IBQDeps.FieldValues['lecheprec']
          else
            LPrecHL.Caption := '';
          if IBQDeps.FieldValues['finaldep'] <> null then
          begin
            if IBQDeps.FieldByName('finaldep').AsFloat > 0 then
              LDepP18.Caption := '+'+FloatToStr(IBQDeps.FieldByName('finaldep').AsFloat)
            else
              LDepP18.Caption := IBQDeps.FieldValues['finaldep'];
          end
          else
            LDepP18.Caption := '';
          if IBQDeps.FieldValues['finalprec'] <> null then
            LPrecP18.Caption := IBQDeps.FieldValues['finalprec']
          else
            LPrecP18.Caption := '';
          if IBQDeps.FieldValues['cedep'] <> null then
          begin
            if IBQDeps.FieldByName('cedep').AsFloat > 0 then
              LDepCEU.Caption := '+'+FloatToStr(IBQDeps.FieldByName('cedep').AsFloat)
            else
              LDepCEU.Caption := IBQDeps.FieldValues['cedep'];
          end
          else
            LDepCEU.Caption := '';
          if IBQDeps.FieldValues['ceprec'] <> null then
            LPrecCEU.Caption := IBQDeps.FieldValues['ceprec']
          else
            LPrecCEU.Caption := '';
          if IBQDeps.FieldValues['egcdep'] <> null then
          begin
            if IBQDeps.FieldByName('egcdep').AsFloat > 0 then
              LDepEGCU.Caption := '+'+FloatToStr(IBQDeps.FieldByName('egcdep').AsFloat)
            else
              LDepEGCU.Caption := IBQDeps.FieldValues['egcdep']
          end
          else
            LDepEGCU.Caption := '';
          if IBQDeps.FieldValues['egcprec'] <> null then
            LPrecEGCU.Caption := IBQDeps.FieldValues['egcprec']
          else
            LPrecEGCU.Caption := '';
          if IBQDeps.FieldValues['aobdep'] <> null then
          begin
            if IBQDeps.FieldByName('aobdep').AsFloat > 0 then
              LDepAOBU.Caption := '+'+FloatToStr(IBQDeps.FieldByName('aobdep').AsFloat)
            else
              LDepAOBU.Caption := IBQDeps.FieldValues['aobdep'];
          end
          else
            LDepAOBU.Caption := '';
          if IBQDeps.FieldValues['aobprec'] <> null then
            LPrecAOBU.Caption := IBQDeps.FieldValues['aobprec']
          else
            LPrecAOBU.Caption := '';
        end;
    end;
end;

procedure TFRepRankinsDeps.BDBGAnimalesCellClick(Column: TColumn);
begin
  inherited;
  if BDBGAnimales.RowCount > 0 then
    CargarDEPs;
end;

procedure TFRepRankinsDeps.ClearLabels;
begin
  LNacimiento.Caption := '';
  LAnio.Caption := '';
  LNombre.Caption := '';
  LHBA.Caption := '';
  LPadre.Caption := '';
  LMadre.Caption := '';
  LCrias.Caption := '';
  LRodeo.Caption := '';
  LDepGest.Caption := '';
  LPrecGest.Caption := '';
  LDepNacer.Caption := '';
  LPrecNacer.Caption := '';
  LDepDest.Caption := '';
  LPrecDest.Caption := '';
  LDepLeche.Caption := '';
  LPrecLeche.Caption := '';
  LDepFinal.Caption := '';
  LPrecFinal.Caption := '';
  LDepCE.Caption := '';
  LPrecCE.Caption := '';
  LDepAltura.Caption := '';
  LPrecAltura.Caption := '';
  LDepEGD.Caption := '';
  LPrecEGD.Caption := '';
  LDepEGC.Caption := '';
  LPrecEGC.Caption := '';
  LDepAOB.Caption := '';
  LPrecAOB.Caption := '';
  LDepGI.Caption := '';
  LPrecGI.Caption := '';
  LDepCM.Caption := '';
  LPrecCM.Caption := '';

  LAnioU.Caption := '';
  LNombreU.Caption := '';
  LHBU.Caption := '';
  LNacimientoU.Caption := '';
  LCriadorU.Caption := '';
  LPropU.Caption := '';
  LNhij.Caption := '';
  LNhijM.Caption := '';
  LNhijU.Caption := '';
  LDatoPD.Caption := '';
  LDepNacerU.Caption := '';
  LPrecNacerU.Caption := '';
  LDepDestU.Caption := '';
  LPrecDestU.Caption := '';
  LDepHL.Caption := '';
  LPrecHL.Caption := '';
  LDepP18.Caption := '';
  LPrecP18.Caption := '';
  LDepCEU.Caption := '';
  LPrecCEU.Caption := '';
  LDepAOBU.Caption := '';
  LPrecAOBU.Caption := '';
  LDepEGCU.Caption := '';
  LPrecEGCU.Caption := '';
end;

procedure TFRepRankinsDeps.AccederFichaPadres(ID : Integer; Externo : String);
var
  F : TFREPFichaAnimal;
  E : TFAbmPadresExternos;
  Iabm : IButtonABM;
begin
  if (Externo = 'N') then
  begin
    F := TFREPFichaAnimal.Create(self);
    F.animal := ID;
    F.ShowModal;
    F.Destroy;
  end
  else
    if (Iabm = nil) then
    begin
      IBQEstabAnimalExt.Close;
      IBQEstabAnimalExt.ParamByName('animal').AsInteger := ID;
      IBQEstabAnimalExt.Open;
      E := TFABMPadresExternos.Create(self);
      E.EstabAux := IBQEstabAnimalExt.FieldValues['establecimiento'];
      E.nom := inttostr(ID);
      Iabm := IButtonABM(E);
      Iabm.ISetCampoRetorno('id_animal_externo');
      Iabm.IFitrate(-1,IBQEstabAnimalExt.FieldValues['establecimiento']);
      Iabm.IAbrir(faabm);
    end;
end;

procedure TFRepRankinsDeps.LNombreMouseEnter(Sender: TObject);
begin
  inherited;
  (Sender as TLabel).Font.Style := [fsBold];
  (Sender as TLabel).Cursor := crHandPoint;
end;

procedure TFRepRankinsDeps.LNombreMouseLeave(Sender: TObject);
begin
  inherited;
  (Sender as TLabel).Font.Style := [];
  (Sender as TLabel).Cursor := crDefault;
end;

procedure TFRepRankinsDeps.LNombreClick(Sender: TObject);
begin
  inherited;
  if IBQDeps.FieldValues['ANIMALRET'] <> null then
    AccederFichaPadres(IBQDeps.FieldValues['animalret'],'N')
  else
    AccederFichaPadres(IBQDeps.FieldValues['animalextret'],'S')
end;

procedure TFRepRankinsDeps.LPadreClick(Sender: TObject);
begin
  inherited;
  if IBQDeps.FieldValues['idpadre'] <> null then
  begin
    if IBQDeps.FieldValues['tipopadre'] = 'I' then
      AccederFichaPadres(IBQDeps.FieldValues['idpadre'],'N')
    else
      AccederFichaPadres(IBQDeps.FieldValues['idpadre'],'S');
  end;
end;

procedure TFRepRankinsDeps.LMadreClick(Sender: TObject);
begin
  inherited;
  if IBQDeps.FieldValues['idmadre'] <> null then
  begin
    if IBQDeps.FieldValues['tipomadre'] = 'I' then
      AccederFichaPadres(IBQDeps.FieldValues['idmadre'],'N')
    else
      AccederFichaPadres(IBQDeps.FieldValues['idmadre'],'S');
  end;
end;

procedure TFRepRankinsDeps.IBQDepsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  CantAnimales := 0;
end;

procedure TFRepRankinsDeps.BDBGAnimalesDblClick(Sender: TObject);
begin
  inherited;
  LNombreClick(nil);
end;

procedure TFRepRankinsDeps.BBVerAnimalesClick(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

end.
