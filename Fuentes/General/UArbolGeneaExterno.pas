unit UArbolGeneaExterno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, UPrincipal, IBQuery,
  DBCtrls, UDBLookupComboBoxAuto, UMangaPadresExternos, Grids, DBGrids,
  UBDBGrid, UDMSoftvet, Buttons, UMensajeHuella, MemoAuto, IBDButtonABM, UAbmPadresExternos, UAbmSimple,
  Menus, UTraduccion, JvExControls, JvLabel, PngImage, jpeg, ImgList,
  PngImageList, JvGIF, JvExExtCtrls, JvImage;

type
  TTipoArbol = (taExterno, taInterno);

  TRegGen = record
    id_animal : integer;
    nivel : string;
    sexo : integer;
  end;

  TFArbolGeneaExterno = class(TFUniversal)
    PArbol: TPanel;
    Shape1: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
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
    Shape29: TShape;
    Shape33: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape3: TShape;
    LPP: TLabel;
    LPM: TLabel;
    LMP: TLabel;
    LMM: TLabel;
    LPPP: TLabel;
    LPPM: TLabel;
    LPMM: TLabel;
    LPMP: TLabel;
    LMPP: TLabel;
    LMPM: TLabel;
    LMMM: TLabel;
    LMMP: TLabel;
    IBQP: TIBQuery;
    IBQM: TIBQuery;
    IBQPP: TIBQuery;
    IBQPM: TIBQuery;
    IBQMP: TIBQuery;
    IBQMM: TIBQuery;
    IBQPPP: TIBQuery;
    IBQPPM: TIBQuery;
    IBQPMP: TIBQuery;
    IBQPMM: TIBQuery;
    IBQMPP: TIBQuery;
    IBQMPM: TIBQuery;
    IBQMMP: TIBQuery;
    IBQMMM: TIBQuery;
    DSP: TDataSource;
    DSM: TDataSource;
    DSPP: TDataSource;
    DSPM: TDataSource;
    DSMP: TDataSource;
    DSMM: TDataSource;
    DSPPP: TDataSource;
    DSPPM: TDataSource;
    DSPMP: TDataSource;
    DSPMM: TDataSource;
    DSMPP: TDataSource;
    DSMPM: TDataSource;
    DSMMP: TDataSource;
    DSMMM: TDataSource;
    IBQPID_ANIMAL_EXTERNO: TIntegerField;
    IBQPID_AUX: TIntegerField;
    IBQPID_OTRO: TIBStringField;
    IBQPID_PC: TIBStringField;
    IBQPID_HBA: TIBStringField;
    IBQPID_RA: TIBStringField;
    IBQPID_RP: TIBStringField;
    IBQPID_SENASA: TIBStringField;
    IBQPNOMBRE: TIBStringField;
    IBQPAPODO: TIBStringField;
    IBQPRAZA: TIntegerField;
    IBQPSEXO: TIntegerField;
    IBQPINTERNO: TIBStringField;
    IBQMID_ANIMAL_EXTERNO: TIntegerField;
    IBQMID_AUX: TIntegerField;
    IBQMID_OTRO: TIBStringField;
    IBQMID_PC: TIBStringField;
    IBQMID_HBA: TIBStringField;
    IBQMID_RA: TIBStringField;
    IBQMID_RP: TIBStringField;
    IBQMID_SENASA: TIBStringField;
    IBQMNOMBRE: TIBStringField;
    IBQMAPODO: TIBStringField;
    IBQMRAZA: TIntegerField;
    IBQMSEXO: TIntegerField;
    IBQMINTERNO: TIBStringField;
    IBQPPID_ANIMAL_EXTERNO: TIntegerField;
    IBQPPID_AUX: TIntegerField;
    IBQPPID_OTRO: TIBStringField;
    IBQPPID_PC: TIBStringField;
    IBQPPID_HBA: TIBStringField;
    IBQPPID_RA: TIBStringField;
    IBQPPID_RP: TIBStringField;
    IBQPPID_SENASA: TIBStringField;
    IBQPPNOMBRE: TIBStringField;
    IBQPPAPODO: TIBStringField;
    IBQPPRAZA: TIntegerField;
    IBQPPSEXO: TIntegerField;
    IBQPPINTERNO: TIBStringField;
    IBQPMID_ANIMAL_EXTERNO: TIntegerField;
    IBQPMID_AUX: TIntegerField;
    IBQPMID_OTRO: TIBStringField;
    IBQPMID_PC: TIBStringField;
    IBQPMID_HBA: TIBStringField;
    IBQPMID_RA: TIBStringField;
    IBQPMID_RP: TIBStringField;
    IBQPMID_SENASA: TIBStringField;
    IBQPMNOMBRE: TIBStringField;
    IBQPMAPODO: TIBStringField;
    IBQPMRAZA: TIntegerField;
    IBQPMSEXO: TIntegerField;
    IBQPMINTERNO: TIBStringField;
    IBQMPID_ANIMAL_EXTERNO: TIntegerField;
    IBQMPID_AUX: TIntegerField;
    IBQMPID_OTRO: TIBStringField;
    IBQMPID_PC: TIBStringField;
    IBQMPID_HBA: TIBStringField;
    IBQMPID_RA: TIBStringField;
    IBQMPID_RP: TIBStringField;
    IBQMPID_SENASA: TIBStringField;
    IBQMPNOMBRE: TIBStringField;
    IBQMPAPODO: TIBStringField;
    IBQMPRAZA: TIntegerField;
    IBQMPSEXO: TIntegerField;
    IBQMPINTERNO: TIBStringField;
    IBQMMID_ANIMAL_EXTERNO: TIntegerField;
    IBQMMID_AUX: TIntegerField;
    IBQMMID_OTRO: TIBStringField;
    IBQMMID_PC: TIBStringField;
    IBQMMID_HBA: TIBStringField;
    IBQMMID_RA: TIBStringField;
    IBQMMID_RP: TIBStringField;
    IBQMMID_SENASA: TIBStringField;
    IBQMMNOMBRE: TIBStringField;
    IBQMMAPODO: TIBStringField;
    IBQMMRAZA: TIntegerField;
    IBQMMSEXO: TIntegerField;
    IBQMMINTERNO: TIBStringField;
    IBQPPPID_ANIMAL_EXTERNO: TIntegerField;
    IBQPPPID_AUX: TIntegerField;
    IBQPPPID_OTRO: TIBStringField;
    IBQPPPID_PC: TIBStringField;
    IBQPPPID_HBA: TIBStringField;
    IBQPPPID_RA: TIBStringField;
    IBQPPPID_RP: TIBStringField;
    IBQPPPID_SENASA: TIBStringField;
    IBQPPPNOMBRE: TIBStringField;
    IBQPPPAPODO: TIBStringField;
    IBQPPPRAZA: TIntegerField;
    IBQPPPSEXO: TIntegerField;
    IBQPPPINTERNO: TIBStringField;
    IBQPPMID_ANIMAL_EXTERNO: TIntegerField;
    IBQPPMID_AUX: TIntegerField;
    IBQPPMID_OTRO: TIBStringField;
    IBQPPMID_PC: TIBStringField;
    IBQPPMID_HBA: TIBStringField;
    IBQPPMID_RA: TIBStringField;
    IBQPPMID_RP: TIBStringField;
    IBQPPMID_SENASA: TIBStringField;
    IBQPPMNOMBRE: TIBStringField;
    IBQPPMAPODO: TIBStringField;
    IBQPPMRAZA: TIntegerField;
    IBQPPMSEXO: TIntegerField;
    IBQPPMINTERNO: TIBStringField;
    IBQPMPID_ANIMAL_EXTERNO: TIntegerField;
    IBQPMPID_AUX: TIntegerField;
    IBQPMPID_OTRO: TIBStringField;
    IBQPMPID_PC: TIBStringField;
    IBQPMPID_HBA: TIBStringField;
    IBQPMPID_RA: TIBStringField;
    IBQPMPID_RP: TIBStringField;
    IBQPMPID_SENASA: TIBStringField;
    IBQPMPNOMBRE: TIBStringField;
    IBQPMPAPODO: TIBStringField;
    IBQPMPRAZA: TIntegerField;
    IBQPMPSEXO: TIntegerField;
    IBQPMPINTERNO: TIBStringField;
    IBQPMMID_ANIMAL_EXTERNO: TIntegerField;
    IBQPMMID_AUX: TIntegerField;
    IBQPMMID_OTRO: TIBStringField;
    IBQPMMID_PC: TIBStringField;
    IBQPMMID_HBA: TIBStringField;
    IBQPMMID_RA: TIBStringField;
    IBQPMMID_RP: TIBStringField;
    IBQPMMID_SENASA: TIBStringField;
    IBQPMMNOMBRE: TIBStringField;
    IBQPMMAPODO: TIBStringField;
    IBQPMMRAZA: TIntegerField;
    IBQPMMSEXO: TIntegerField;
    IBQPMMINTERNO: TIBStringField;
    IBQMPPID_ANIMAL_EXTERNO: TIntegerField;
    IBQMPPID_AUX: TIntegerField;
    IBQMPPID_OTRO: TIBStringField;
    IBQMPPID_PC: TIBStringField;
    IBQMPPID_HBA: TIBStringField;
    IBQMPPID_RA: TIBStringField;
    IBQMPPID_RP: TIBStringField;
    IBQMPPID_SENASA: TIBStringField;
    IBQMPPNOMBRE: TIBStringField;
    IBQMPPAPODO: TIBStringField;
    IBQMPPRAZA: TIntegerField;
    IBQMPPSEXO: TIntegerField;
    IBQMPPINTERNO: TIBStringField;
    IBQMPMID_ANIMAL_EXTERNO: TIntegerField;
    IBQMPMID_AUX: TIntegerField;
    IBQMPMID_OTRO: TIBStringField;
    IBQMPMID_PC: TIBStringField;
    IBQMPMID_HBA: TIBStringField;
    IBQMPMID_RA: TIBStringField;
    IBQMPMID_RP: TIBStringField;
    IBQMPMID_SENASA: TIBStringField;
    IBQMPMNOMBRE: TIBStringField;
    IBQMPMAPODO: TIBStringField;
    IBQMPMRAZA: TIntegerField;
    IBQMPMSEXO: TIntegerField;
    IBQMPMINTERNO: TIBStringField;
    IBQMMPID_ANIMAL_EXTERNO: TIntegerField;
    IBQMMPID_AUX: TIntegerField;
    IBQMMPID_OTRO: TIBStringField;
    IBQMMPID_PC: TIBStringField;
    IBQMMPID_HBA: TIBStringField;
    IBQMMPID_RA: TIBStringField;
    IBQMMPID_RP: TIBStringField;
    IBQMMPID_SENASA: TIBStringField;
    IBQMMPNOMBRE: TIBStringField;
    IBQMMPAPODO: TIBStringField;
    IBQMMPRAZA: TIntegerField;
    IBQMMPSEXO: TIntegerField;
    IBQMMPINTERNO: TIBStringField;
    IBQMMMID_ANIMAL_EXTERNO: TIntegerField;
    IBQMMMID_AUX: TIntegerField;
    IBQMMMID_OTRO: TIBStringField;
    IBQMMMID_PC: TIBStringField;
    IBQMMMID_HBA: TIBStringField;
    IBQMMMID_RA: TIBStringField;
    IBQMMMID_RP: TIBStringField;
    IBQMMMID_SENASA: TIBStringField;
    IBQMMMNOMBRE: TIBStringField;
    IBQMMMAPODO: TIBStringField;
    IBQMMMRAZA: TIntegerField;
    IBQMMMSEXO: TIntegerField;
    IBQMMMINTERNO: TIBStringField;
    PBotones: TPanel;
    LP: TLabel;
    LM: TLabel;
    MIBQP: TMemo;
    MIBQM: TMemo;
    MIBQPP: TMemo;
    MIBQPM: TMemo;
    MIBQMP: TMemo;
    MIBQMM: TMemo;
    MIBQPPP: TMemo;
    MIBQPPM: TMemo;
    MIBQPMM: TMemo;
    MIBQPMP: TMemo;
    MIBQMPM: TMemo;
    MIBQMPP: TMemo;
    MIBQMMM: TMemo;
    MIBQMMP: TMemo;
    LRP: TLabel;
    LNombre: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    DBLCBAP: TDBLookupComboBoxAuto;
    IBQMachosExternos: TIBQuery;
    IBQHembrasExternas: TIBQuery;
    DSMachosExternos: TDataSource;
    DSHembrasExternas: TDataSource;
    DBLCBAM: TDBLookupComboBoxAuto;
    DBLCBAPP: TDBLookupComboBoxAuto;
    DBLCBAPM: TDBLookupComboBoxAuto;
    DBLCBAMP: TDBLookupComboBoxAuto;
    DBLCBAMM: TDBLookupComboBoxAuto;
    DBLCBAPPP: TDBLookupComboBoxAuto;
    DBLCBAPPM: TDBLookupComboBoxAuto;
    DBLCBAPMM: TDBLookupComboBoxAuto;
    DBLCBAPMP: TDBLookupComboBoxAuto;
    DBLCBAMPM: TDBLookupComboBoxAuto;
    DBLCBAMPP: TDBLookupComboBoxAuto;
    DBLCBAMMM: TDBLookupComboBoxAuto;
    DBLCBAMMP: TDBLookupComboBoxAuto;
    BBCancelar: TBitBtn;
    BBAceptar: TBitBtn;
    IBQGuardar: TIBQuery;
    IBQGetPadre: TIBQuery;
    IBQGetMadre: TIBQuery;
    IBQRNArbolGenea: TIBQuery;
    IBQRNArbolGeneaTIPO: TIBStringField;
    IBQRNArbolGeneaMENSAGE: TIBStringField;
    IBQRNArbolGeneaERROR: TIntegerField;
    PError: TPageControl;
    TSHError: TTabSheet;
    MAErrors: TMemoAuto;
    IBQBorrar: TIBQuery;
    IBQMachosExternosID_ANIMAL_EXTERNO: TIntegerField;
    IBQMachosExternosID_RP: TIBStringField;
    IBQMachosExternosNOM: TIBStringField;
    IBQMachosExternosTIPO: TIntegerField;
    IBQMachosExternosNOMBRE: TIBStringField;
    IBQHembrasExternasID_ANIMAL_EXTERNO: TIntegerField;
    IBQHembrasExternasID_RP: TIBStringField;
    IBQHembrasExternasNOM: TIBStringField;
    IBQHembrasExternasTIPO: TIntegerField;
    IBQHembrasExternasNOMBRE: TIBStringField;
    IBQExternos: TIBQuery;
    IBQFechaCompra: TIBQuery;
    IAceptarGenea: TImage;
    ICancelarGenea: TImage;
    LAceptar: TLabel;
    LCancelar: TLabel;
    EDBLCBAP1: TEdit;
    EDBLCBAM1: TEdit;
    EDBLCBAPP1: TEdit;
    EDBLCBAPPP1: TEdit;
    EDBLCBAPM1: TEdit;
    EDBLCBAPPM1: TEdit;
    EDBLCBAPMP1: TEdit;
    EDBLCBAPMM1: TEdit;
    EDBLCBAMP1: TEdit;
    EDBLCBAMPP1: TEdit;
    EDBLCBAMPM1: TEdit;
    EDBLCBAMM1: TEdit;
    EDBLCBAMMP1: TEdit;
    EDBLCBAMMM1: TEdit;
    EDBLCBAP: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    EDBLCBAM: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    EDBLCBAPP: TLabel;
    EDBLCBAPM: TLabel;
    EDBLCBAMP: TLabel;
    EDBLCBAMM: TLabel;
    EDBLCBAMMM: TLabel;
    EDBLCBAMMP: TLabel;
    EDBLCBAMPM: TLabel;
    EDBLCBAMPP: TLabel;
    EDBLCBAPMM: TLabel;
    EDBLCBAPMP: TLabel;
    EDBLCBAPPM: TLabel;
    EDBLCBAPPP: TLabel;
    Shape2: TShape;
    Image1: TImage;
    Label4: TLabel;
    LHba: TLabel;
    LBP1: TLabel;
    LBM1: TLabel;
    LBPP1: TLabel;
    LBPM1: TLabel;
    LBMP1: TLabel;
    LBMM1: TLabel;
    LBPPP1: TLabel;
    LBPPM1: TLabel;
    LBPMP1: TLabel;
    LBPMM1: TLabel;
    LBMPP1: TLabel;
    LBMPM1: TLabel;
    LBMMP1: TLabel;
    LBMMM1: TLabel;
    LBP: TImage;
    LBM: TImage;
    LBPP: TImage;
    LBPM: TImage;
    LBMP: TImage;
    LBMM: TImage;
    LBPPP: TImage;
    LBPPM: TImage;
    LBPMP: TImage;
    LBPMM: TImage;
    LBMPP: TImage;
    LBMPM: TImage;
    LBMMP: TImage;
    LBMMM: TImage;
    Image5: TImage;
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LabelMachoClick(Sender: TObject);
    procedure LabelHembraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBACloseUp(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure PErrorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LabelClickExtMachos(Sender : TObject);
    procedure LabelClickExtHembras(Sender : TObject);
    procedure DBLCBAKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBAPKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ICancelarGeneaClick(Sender: TObject);
    procedure EDBLCBAPClick(Sender: TObject);
    procedure EDBLCBAMClick(Sender: TObject);
    procedure LBP1Click(Sender: TObject);
  private
    FTipoArbol : TTipoArbol;
    procedure ActualizarQuerysInternos();
    procedure ActualizarQuerysExternos();
    procedure ActivarTipoDeArbol();
    procedure CargarGenealogia();
    procedure ObtenerGenealogiaExternos(ID_Animal : Integer; Nivel : String);
    procedure GuardarDatosExternos();
    function ChequearArbol() : Boolean;
    procedure BorrarAnimales();
    procedure GuardarDatosTemp();
    procedure InicializarArrGenealog;
    procedure InicializarGenealog(comp : TLabel);
    procedure ActivarEliminar;
    procedure LimpiarArbol(c : string; nivel : integer);
  public
    RP, Nombre, HBA : String;
    Animal : Variant;
    Gen : TArrAuxiliar;
    arrGenealogia : array of TRegGen;
//    procedure GuardarGenealog;
  published
    constructor Create(Owner : TComponent; TipoArbol : TTipoArbol; Padres : TArrAuxiliar); reintroduce;
    property TipoArbol  : TTipoArbol read FTipoArbol;
  end;

var
  FArbolGeneaExterno: TFArbolGeneaExterno;
  BloqCargaMadre, BloqCargaPadre : boolean;


implementation

uses USelAnimalesEmbriones;

{$R *.dfm}

constructor TFArbolGeneaExterno.Create(Owner : TComponent; TipoArbol : TTipoArbol; Padres : TArrAuxiliar);
begin
  inherited Create(Owner);
  FTipoArbol := TipoArbol;
  Gen := Padres;
end;

procedure TFArbolGeneaExterno.LabelMouseEnter(Sender: TObject);
begin
  inherited;
  (Sender as TLabel).Font.Style := [fsBold,fsUnderline];
  (Sender as TLabel).Font.Color := clTeal;
  (Sender as TLabel).Cursor := crHandPoint;
end;

procedure TFArbolGeneaExterno.LabelMouseLeave(Sender: TObject);
begin
  inherited;
  (Sender as TLabel).Font.Style := [fsBold];
  (Sender as TLabel).Font.Color := clGreen;
  (Sender as TLabel).Cursor := crDefault;
end;

procedure TFArbolGeneaExterno.LabelMachoClick(Sender: TObject);
var
  F : TFMangaPadresExternos;
  Iabm: IButtonABM;
  form:TFABMPadresExternos;
begin
  inherited;

    form := TFABMPadresExternos.Create(self);
    Iabm := IButtonABM(form);
    Iabm.IFitrate(1,FPrincipal.EstablecimientoActual);
    Iabm.ISetCampoRetorno('id_animal_externo');
    Iabm.IAbrir(faAbm);
  {BorrarAuxPadres;
  BorrarTablasAuxiliares();
  ActualizarPadres();}
 { if nroID>-1 then
  begin
      Result := nroID;
      nroID:=-1;
  end;

  F := TFMangaPadresExternos.Create(self,1,(Sender as TLabel).Tag);
  F.ShowModal;
  F.Destroy;}
    ActualizarQuerysInternos;
end;

procedure TFArbolGeneaExterno.LabelHembraClick(Sender: TObject);
var
  F : TFMangaPadresExternos;
begin
  inherited;

    F := TFMangaPadresExternos.Create(self,2,(Sender as TLabel).Tag);
    F.ShowModal;
    F.Destroy;
    ActualizarQuerysInternos;

end;

procedure TFArbolGeneaExterno.ActualizarQuerysInternos();
var
  indice : integer;
  Nombre : String;
  Memos : TComponent;
begin
  for indice := 0 to ComponentCount-1 do
    if (Components[indice] is TIBQuery) then
    begin
      Nombre := Components[indice].Name;
      Memos := TComponent.Create(nil);
      (Components[indice] as TIBQuery).Close;
      (Components[indice] as TIBQuery).Open;
      Memos := FindComponent('M'+Nombre);
      if Memos <> nil then
      begin
        (Memos as TMemo).Lines.Clear;
        (Components[indice] as TIBQuery).First;
        while not (Components[indice] as TIBQuery).Eof do
        begin
          (Memos as TMemo).Lines.Add((Components[indice] as TIBQuery).FieldValues['ID_RP']+' -- '+
          (Components[indice] as TIBQuery).FieldValues['NOMBRE']);
          (Components[indice] as TIBQuery).Next;
        end;
      end;
    end;
end;

procedure TFArbolGeneaExterno.FormShow(Sender: TObject);
begin
  inherited;
  if FTipoArbol = taExterno then
    ActualizarQuerysExternos()
  else
    ActualizarQuerysInternos();

  SetLength(arrGenealogia,14);
  InicializarArrGenealog;

  LRP.Caption := RP;
  LNombre.Caption := Nombre;
  LHba.Caption := HBA;
  ActivarTipoDeArbol();
  CargarGenealogia();

  ActivarEliminar;

end;

procedure TFArbolGeneaExterno.LabelClickExtMachos(Sender : TObject);
var F : TFSelAnimalesEmbriones;
    id_animal : integer;
    C, E : TComponent;
    Nombre_C : String;
begin
  inherited;

  F := TFSelAnimalesEmbriones.Create(self);
  F.sexo := 1;
  F.SQLconsulta := 'select * from rep_animales_genea_externos(:sexo)';
  F.ShowModal;
  id_animal := F.id_animal;
  F.Destroy;

  ActualizarQuerysExternos;

  if (id_animal <> -1) then
  begin
    Nombre_C := StringReplace((Sender as TLabel).Name,'L','DBLCBA',[rfReplaceAll]);
    C := FindComponent(Nombre_C);
    (C as TDBLookUpComboBoxAuto).KeyValue := id_animal;
    DBLCBACloseUp(C);
    Nombre_C := StringReplace((Sender as TLabel).Name,'L','EDBLCBA',[rfReplaceAll]);
    E := FindComponent(Nombre_C);
    (E as TLabel).Caption := (C as TDBLookUpComboBoxAuto).Text;
  end
  else
  begin
    Nombre_C := StringReplace((Sender as TLabel).Name,'L','DBLCBA',[rfReplaceAll]);
    C := FindComponent(Nombre_C);
    (C as TDBLookUpComboBoxAuto).KeyValue := null;
    DBLCBACloseUp(C);
    Nombre_C := StringReplace((Sender as TLabel).Name,'L','EDBLCBA',[rfReplaceAll]);
    E := FindComponent(Nombre_C);
    (E as TLabel).Caption := '';
  end;


{var
  F : TFAbmPadresExternos;
    Iabm: IButtonABM;
  form:TFABMPadresExternos;
  C : TComponent;
  Nombre_C : String;
begin
  {F := TFAbmPadresExternos.Create(self);
  F.CampoRetorno := 'ID_ANIMAL_EXTERNO';
  F.sexoAbm := 1;
  F.Abrir(faAbm);
  ActualizarQuerysExternos();}


{    form := TFABMPadresExternos.Create(self);
    Iabm := IButtonABM(form);
    Iabm.IFitrate(1,FPrincipal.EstablecimientoActual);
    Iabm.ISetCampoRetorno('id_animal_externo');
    Iabm.IAbrir(faAbm);
    ActualizarQuerysExternos();  }


  {if ((F.ValorRetorno <> null) and (F.ModalResult <> 2)) then
  begin
    (Sender as TLabel).Enabled := false;
    Nombre_C := StringReplace((Sender as TLabel).Name,'L','DBLCBA',[rfReplaceAll]);
    C := FindComponent(Nombre_C);
    (C as TDBLookUpComboBoxAuto).KeyValue := F.ValorRetorno; //B.IValorRetorno;
    DBLCBACloseUp(C);
  end;}


{    if (form.ID_Animal <> 0) then
    begin
    (Sender as TLabel).Enabled := false;
    Nombre_C := StringReplace((Sender as TLabel).Name,'L','DBLCBA',[rfReplaceAll]);
    C := FindComponent(Nombre_C);
    (C as TDBLookUpComboBoxAuto).KeyValue := Form.ID_Animal; //F.ValorRetorno; //B.IValorRetorno;
    DBLCBACloseUp(C);
    end;      }

  //Form.Destroy;
end;

procedure TFArbolGeneaExterno.LabelClickExtHembras(Sender : TObject);
var F : TFSelAnimalesEmbriones;
    id_animal : integer;
    C, E : TComponent;
    Nombre_C, aux : string;
begin
  inherited;

  F := TFSelAnimalesEmbriones.Create(self);
  F.sexo := 2;
  F.SQLconsulta := 'select * from rep_animales_genea_externos(:sexo)';
  F.ShowModal;
  id_animal := F.id_animal;
  F.Destroy;

  ActualizarQuerysExternos;

  if (id_animal <> -1) then
  begin
    Nombre_C := StringReplace((Sender as TLabel).Name,'L','DBLCBA',[rfReplaceAll]);
    C := FindComponent(Nombre_C);
    (C as TDBLookUpComboBoxAuto).KeyValue := id_animal;
    aux := (C as TDBLookUpComboBoxAuto).Text;
    DBLCBACloseUp(C);

    Nombre_C := StringReplace((Sender as TLabel).Name,'L','EDBLCBA',[rfReplaceAll]);
    E := FindComponent(Nombre_C);
    (E as TLabel).Caption := aux;
  end
  else
  begin
    Nombre_C := StringReplace((Sender as TLabel).Name,'L','DBLCBA',[rfReplaceAll]);
    C := FindComponent(Nombre_C);
    (C as TDBLookUpComboBoxAuto).KeyValue := null;
    aux := (C as TDBLookUpComboBoxAuto).Text;
    DBLCBACloseUp(C);

    Nombre_C := StringReplace((Sender as TLabel).Name,'L','EDBLCBA',[rfReplaceAll]);
    E := FindComponent(Nombre_C);
    (E as TLabel).Caption := '';
  end;
{var
  F : TFAbmPadresExternos;
  C : TComponent;
  Iabm: IButtonABM;
  form:TFABMPadresExternos;
  Nombre_C : String;
begin
  {F := TFAbmPadresExternos.Create(self);
  F.CampoRetorno := 'ID_ANIMAL_EXTERNO';
  F.sexoAbm := 2;
  F.Abrir(faElegir);
  ActualizarQuerysExternos();}

{    form := TFABMPadresExternos.Create(self);
    Iabm := IButtonABM(form);
    Iabm.IFitrate(2,FPrincipal.EstablecimientoActual);
    Iabm.ISetCampoRetorno('id_animal_externo');
    Iabm.IAbrir(faAbm);
    ActualizarQuerysExternos();

    if ((Form.ID_Animal <> 0)) then
    begin
      (Sender as TLabel).Enabled := false;
      Nombre_C := StringReplace((Sender as TLabel).Name,'L','DBLCBA',[rfReplaceAll]);
      C := FindComponent(Nombre_C);
      (C as TDBLookUpComboBoxAuto).KeyValue := Form.ID_Animal; //F.ValorRetorno; //B.IValorRetorno;
      DBLCBACloseUp(C);
    end;           }
  //Form.Destroy;
end;

procedure TFArbolGeneaExterno.ActivarTipoDeArbol();
var
  indice : Integer;
  nombre : String;
begin
  if FTipoArbol = taExterno then
  begin
    for indice := 0 to ComponentCount-1 do
    begin
      if Components[indice] is TMemo then
        (Components[indice] as TMemo).Visible := false;
      if Components[indice] is TDBLookUpComboBoxAuto then
        (Components[indice] as TDBLookUpComboBoxAuto).Visible := false;

      if Components[indice] is TLabel then
      begin
        nombre := (Components[indice] as TLabel).Name;
        if nombre[Length(nombre)] = 'P' then
          (Components[indice] as TLabel).OnClick := LabelClickExtMachos
        else
          (Components[indice] as TLabel).OnClick := LabelClickExtHembras;

        if (Components[indice] as TLabel).Tag = 100 then
          (Components[indice] as TLabel).OnClick := EDBLCBAPClick;

        if (Components[indice] as TLabel).Tag = 200 then
          (Components[indice] as TLabel).OnClick := EDBLCBAMClick;

      end;
    end;
  end
  else
  begin
    for indice := 0 to ComponentCount-1 do
    begin
      if Components[indice] is TMemo then
        (Components[indice] as TMemo).Visible := true;
      if Components[indice] is TDBLookUpComboBoxAuto then
        (Components[indice] as TDBLookUpComboBoxAuto).Visible := false;
      if Components[indice] is TLabel then
      begin
        nombre := (Components[indice] as TLabel).Name;
        if nombre[Length(nombre)] = 'P' then
          (Components[indice] as TLabel).OnClick := LabelMachoClick
        else
          (Components[indice] as TLabel).OnClick := LabelHembraClick;
      end;
    end;
  end;
end;

procedure TFArbolGeneaExterno.ActualizarQuerysExternos();
begin
  IBQMachosExternos.Close;
//  IBQMachosExternos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQMachosExternos.Open;
  IBQHembrasExternas.Close;
//  IBQHembrasExternas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQHembrasExternas.Open;
  DMSoftvet.IBQAfterOpen(IBQMachosExternos);
  DMSoftvet.IBQAfterOpen(IBQHembrasExternas);
end;

procedure TFArbolGeneaExterno.DBLCBACloseUp(Sender: TObject);
var
  Padre, Madre, L_P, L_M, L, EPadre, EMadre : TComponent;
  nombre, ext : String;
  Valor, ID_P, ID_M : Variant;
begin
  inherited;

  if ((Sender as TDBLookUpComboBoxAuto).Text <> '') then
  begin
    IBQExternos.Close;
    IBQExternos.ParamByName('id').AsInteger := (Sender as TDBLookUpComboBoxAuto).KeyValue;
    IBQExternos.Open;
    if IBQExternos.IsEmpty then
      Ext := 'N'
    else
      Ext := 'S';

    if Ext = 'N' then
    begin
      IBQFechaCompra.Close;
      IBQFechaCompra.ParamByName('id').AsInteger := (Sender as TDBLookUpComboBoxAuto).KeyValue;
      IBQFechaCompra.Open;
      L := FindComponent(StringReplace((Sender as TDBLookUpComboBoxAuto).Name,'DBLCBA','L',[rfReplaceAll]));
      if L <> nil then
      begin
        (L as TLabel).Enabled := false;
        (L as TLabel).Caption := (L as TLabel).Caption+Traducir(' (Interno, Fecha de Compra: ')+DateToStr(IBQFechaCompra.FieldValues['fecha'])+')';
      end;
      (Sender as TDBLookUpComboBoxAuto).Enabled := false;
      (Sender as TDBLookUpComboBoxAuto).Font.Color := clGreen;
    end;
    IBQGetMadre.Close;
    IBQGetMadre.ParamByName('id').Value := (Sender as TDBLookUpComboBoxAuto).KeyValue;
    IBQGetMadre.ParamByName('ext').Value := Ext;
    IBQGetMadre.Open;
    IBQGetPadre.Close;
    IBQGetPadre.ParamByName('id').Value := (Sender as TDBLookUpComboBoxAuto).KeyValue;
    IBQGetPadre.ParamByName('ext').Value := Ext;
    IBQGetPadre.Open;
    ID_P := IBQGetPadre.FieldValues['id_padre'];
    ID_M := IBQGetMadre.FieldValues['id_madre'];
    Padre := FindComponent((Sender as TDBLookUpComboBoxAuto).Name+'P');
    EPadre := FindComponent('E'+(Sender as TDBLookUpComboBoxAuto).Name+'P');
    Madre := FindComponent((Sender as TDBLookUpComboBoxAuto).Name+'M');
    EMadre := FindComponent('E'+(Sender as TDBLookUpComboBoxAuto).Name+'M');
    (EPadre as TLabel).Caption := '';
    (EMadre as TLabel).Caption := '';
    if Padre <> nil then
    begin
      nombre := StringReplace((Padre as TDBLookUpComboBoxAuto).Name,'DBLCBA','L',[rfReplaceAll]);
      L_P := FindComponent(nombre);
      if ID_P <> null then
      begin
        (Padre as TDBLookUpComboBoxAuto).KeyValue := ID_P;
        (Padre as TDBLookupComboBoxAuto).ReadOnly := true;
        (EPadre as TLabel).Caption := (Padre as TDBLookUpComboBoxAuto).Text;
      end
      else
      begin
        if (Padre as TDBLookUpComboBoxAuto).Text <> '' then
        begin
          (Padre as TDBLookUpComboBoxAuto).KeyValue := null;
          (Padre as TDBLookupComboBoxAuto).OnCloseUp := DBLCBACloseUp;
          (Padre as TDBLookupComboBoxAuto).ReadOnly := false;
          (EPadre as TLabel).Caption := '';
        end;
        (L_P as TLabel).OnClick := LabelClickExtMachos;
        (EPadre as TLabel).OnClick := EDBLCBAPClick;
      end;
      DBLCBACloseUp(Padre);
    end;
    if Madre <> nil then
    begin
      nombre := StringReplace((Madre as TDBLookUpComboBoxAuto).Name,'DBLCBA','L',[rfReplaceAll]);
      L_M := FindComponent(nombre);
      if ID_M <> null then
      begin
        (Madre as TDBLookUpComboBoxAuto).KeyValue := ID_M;
        (Madre as TDBLookupComboBoxAuto).ReadOnly := true;
        (EMadre as TLabel).Caption := (Madre as TDBLookUpComboBoxAuto).Text;
      end
      else
      begin
        (L_M as TLabel).OnClick := LabelClickExtHembras;
        (EMadre as TLabel).OnClick := EDBLCBAMClick;
        if (Madre as TDBLookUpComboBoxAuto).Text <> '' then
        begin
          (Madre as TDBLookupComboBoxAuto).OnCloseUp := DBLCBACloseUp;
          (Madre as TDBLookupComboBoxAuto).ReadOnly := false;
          (Madre as TDBLookUpComboBoxAuto).KeyValue := null;
          (EMadre as TLabel).Caption := '';
        end;
      end;
      DBLCBACloseUp(Madre);
    end;
  end
  else
  begin
    Padre := FindComponent((Sender as TDBLookUpComboBoxAuto).Name+'P');
    EPadre := FindComponent('E'+(Sender as TDBLookUpComboBoxAuto).Name+'P');
    Madre := FindComponent((Sender as TDBLookUpComboBoxAuto).Name+'M');
    EMadre := FindComponent('E'+(Sender as TDBLookUpComboBoxAuto).Name+'M');
    (EPadre as TLabel).Caption := '';
    (EMadre as TLabel).Caption := '';
    if Padre <> nil then
    begin
      nombre := StringReplace((Padre as TDBLookUpComboBoxAuto).Name,'DBLCBA','L',[rfReplaceAll]);
      L_P := FindComponent(nombre);
      if (Padre as TDBLookUpComboBoxAuto).Text <> '' then
        (Padre as TDBLookUpComboBoxAuto).KeyValue := null;
      (Padre as TDBLookUpComboBoxAuto).Enabled := false;
    end;
    if Madre <> nil then
    begin
      nombre := StringReplace((Madre as TDBLookUpComboBoxAuto).Name,'DBLCBA','L',[rfReplaceAll]);
      L_M := FindComponent(nombre);
      if (Madre as TDBLookUpComboBoxAuto).Text <> '' then
        (Madre as TDBLookUpComboBoxAuto).KeyValue := null;
      (Madre as TDBLookUpComboBoxAuto).Enabled := false;
    end;
  end;
end;

procedure TFArbolGeneaExterno.BorrarAnimales();
var
  indice : integer;
begin
  for indice := 0 to ComponentCount-1 do
    if Components[indice] is TDBLookUpComboBoxAuto then
      if (Components[indice] as TDBLookUpComboBoxAuto).KeyValue <> null then
      begin
        try
          IBQBorrar.Close;
          IBQBorrar.ParamByName('animal').Value := (Components[indice] as TDBLookUpComboBoxAuto).KeyValue;
          IBQBorrar.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.CommitRetaining;
        end;
      end;
end;

procedure TFArbolGeneaExterno.GuardarDatosTemp();
var
  Indice, I : integer;
begin
  I := 1;
  for Indice := 0 to ComponentCount-1 do
  begin
    if Components[Indice] is TDBLookUpComboBoxAuto then
      if (((Components[Indice] as TDBLookUpComboBoxAuto).KeyValue <> -1) and ((Components[Indice] as TDBLookUpComboBoxAuto).KeyValue <> null))then
      begin
        SetLength(Gen,I);
        Gen[I-1].id_comp := (Components[Indice] as TDBLookUpComboBoxAuto).KeyValue;
        Gen[I-1].nombre_comp := (Components[Indice] as TDBLookUpComboBoxAuto).Name;
        Inc(I);
      end
  end;
end;

procedure TFArbolGeneaExterno.BBAceptarClick(Sender: TObject);
begin
  inherited;
  if FTipoArbol = taExterno then
  begin
    GuardarDatosTemp();
    BorrarAnimales();
    GuardarDatosExternos();
  end;

  if ChequearArbol() then
  begin
    (Owner as TFAbmPadresExternos).Genealogia := Gen;

    Close();
  end
  else
  begin
    MostrarMensaje(tmError,'Se produjeron inconsistencias.'#13'Verifique el listado de errores para saber de que se trata.');
    BorrarAnimales();
    PError.Visible := true;
    MAErrors.Visible := true;
  end;
end;

function TFArbolGeneaExterno.ChequearArbol() : Boolean;
begin
  Result := true;
  IBQRNArbolGenea.Close;
  IBQRNArbolGenea.ParamByName('ANIMAL').Value := Animal;
 // IBQRNArbolGenea.ParamByName('ESTA').Value := FPrincipal.EstablecimientoActual;
  IBQRNArbolGenea.Open;
  if not IBQRNArbolGenea.IsEmpty then
  begin
    Result := false;
    IBQRNArbolGenea.First;
    MAErrors.Clear;
    while not IBQRNArbolGenea.Eof do
    begin
      MAErrors.Lines.Add(IBQRNArbolGenea.FieldValues['TIPO']+': - '+IBQRNArbolGenea.FieldValues['MENSAGE']);
      IBQRNArbolGenea.Next;
    end;
  end;
end;

procedure TFArbolGeneaExterno.GuardarDatosExternos();
var
  indice, i : integer;
  TIBQ : TIBQuery;
begin

//  SetLength(arrGenealogia,14);
//  InicializarArrGenealog;
  i := 0;

  for indice := 0 to ComponentCount-1 do
    if Components[indice] is TDBLookUpComboBoxAuto then
    begin
      if (Components[indice] as TDBLookUpComboBoxAuto).Text <> '' then
      begin
        TIBQ := TIBQuery.Create(nil);
        TIBQ := IBQHembrasExternas;
        if (Components[indice] as TDBLookUpComboBoxAuto).ListSource = DSMachosExternos then
          TIBQ := IBQMachosExternos;
        TIBQ.Locate('id_animal_externo',(Components[indice] as TDBLookUpComboBoxAuto).KeyValue,[loCaseInsensitive]);
        try

          arrGenealogia[i].id_animal := TIBQ.fieldByName('ID_ANIMAL_EXTERNO').Value;
          arrGenealogia[i].sexo := TIBQ.fieldByName('TIPO').Value;
          arrGenealogia[i].nivel := IntToStr((Components[indice] as TDBLookUpComboBoxAuto).Tag);

          IBQGuardar.Close;
          IBQGuardar.ParamByName('ID_ANIMAL_EXTERNO').Value := TIBQ.fieldByName('ID_ANIMAL_EXTERNO').Value;
          IBQGuardar.ParamByName('ID_AUX').Value := (Components[indice] as TDBLookUpComboBoxAuto).Tag;
          IBQGuardar.ParamByName('ID_OTRO').Value := IntToStr((Components[indice] as TDBLookUpComboBoxAuto).Tag);
          IBQGuardar.ParamByName('ID_RP').Value := TIBQ.fieldByName('ID_RP').Value;
          IBQGuardar.ParamByName('NOMBRE').Value := TIBQ.fieldByName('NOM').Value;
          IBQGuardar.ParamByName('SEXO').Value := TIBQ.fieldByName('TIPO').Value;
          IBQGuardar.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
        //TIBQ.Destroy;
      end;
      Inc(i);
    end;
end;

procedure TFArbolGeneaExterno.ObtenerGenealogiaExternos(ID_Animal : Integer; Nivel : String);
var
  madre, padre : Variant;
  Combo, E : TComponent;
begin
  if Length(Nivel) <= 3 then
  begin
  try

    IBQGetPadre.Close;
    IBQGetPadre.ParamByName('id').Value := ID_Animal;
    IBQGetPadre.ParamByName('ext').Value := 'S';
    IBQGetPadre.Open;
    IBQGetMadre.Close;
    IBQGetMadre.ParamByName('id').Value := ID_Animal;
    IBQGetMadre.ParamByName('ext').Value := 'S';
    IBQGetMadre.Open;
    madre := IBQGetMadre.FieldValues['ID_MADRE'];
    padre := IBQGetPadre.FieldValues['ID_PADRE'];
    if madre <> null then
    begin
      Combo := FindComponent('DBLCBA'+Nivel+'M');
      E := FindComponent('EDBLCBA'+Nivel+'M');
      if Combo <> nil then
      begin
        (Combo as TDBLookUpComboBoxAuto).KeyValue := madre;
        (E as TLabel).Caption := (Combo as TDBLookUpComboBoxAuto).Text;
        DBLCBACloseUp(Combo);
      end;
      //ObtenerGenealogiaExternos(madre,Nivel+'M');
    end;
    if padre <> null then
    begin
      Combo := FindComponent('DBLCBA'+Nivel+'P');
      E := FindComponent('EDBLCBA'+Nivel+'P');
      if Combo <> nil then
      begin
        (Combo as TDBLookUpComboBoxAuto).KeyValue := padre;
        (E as TLabel).Caption := (Combo as TDBLookUpComboBoxAuto).Text;
        DBLCBACloseUp(Combo);
      end;
      //ObtenerGenealogiaExternos(padre,Nivel+'P');
    end;
  except
    madre := null;
    padre := null;
  end;
  end;
end;

procedure TFArbolGeneaExterno.CargarGenealogia();
var
  Comp, E : TComponent;
  Indice : integer;
begin
  if Length(Gen) > 0 then
  begin
    for indice := 0 to Length(Gen)-1 do
    begin
      Comp := FindComponent(Gen[Indice].nombre_comp);
      E := FindComponent('E'+Gen[Indice].nombre_comp);
      if Comp <> nil then
      begin
        (Comp as TDBLookUpComboBox).KeyValue := Gen[Indice].id_comp;
        (E as TLabel).Caption := (Comp as TDBLookUpComboBox).Text;
        DBLCBACloseUp(Comp);
      end;
    end;
  end
  else
  begin
    if FTipoArbol = taExterno then
      ObtenerGenealogiaExternos(Animal,'');
  end;
end;

procedure TFArbolGeneaExterno.PErrorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if PArbol.Height = 457 then
    PArbol.Height := 561
  else
  begin
    PArbol.Height := 457;
    MAErrors.Height := 104;
    MAErrors.Visible := true;
  end;
end;

procedure TFArbolGeneaExterno.DBLCBAKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #8 then
  begin
    (Sender as TDBLookUpComboBoxAuto).KeyValue := null;
    DBLCBACloseUp(Sender);
  end;
end;

procedure TFArbolGeneaExterno.DBLCBAPKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
  begin
    (Sender as TDBLookUpComboBoxAuto).KeyValue := null;
    DBLCBACloseUp(Sender);
  end;
end;

procedure TFArbolGeneaExterno.ICancelarGeneaClick(Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFArbolGeneaExterno.InicializarArrGenealog;
var i : integer;
begin

     for i := 0 to 14-1 do
     begin
          arrGenealogia[i].id_animal := 0;
          arrGenealogia[i].nivel := '';
          arrGenealogia[i].sexo := 0;
     end;
end;


procedure TFArbolGeneaExterno.InicializarGenealog(comp : TLabel);
begin


end;

procedure TFArbolGeneaExterno.EDBLCBAPClick(Sender: TObject);
var F : TFSelAnimalesEmbriones;
    id_animal : integer;
    C, E : TComponent;
    Nombre_C : String;
begin
  inherited;

  F := TFSelAnimalesEmbriones.Create(self);
  F.sexo := 1;
  F.SQLconsulta := 'select * from rep_animales_genea_externos(:sexo)';
  F.ShowModal;
  id_animal := F.id_animal;
  F.Destroy;

  ActualizarQuerysExternos;

  if (id_animal <> -1) then
  begin
    Nombre_C := StringReplace((Sender as TLabel).Name,'E','',[rfReplaceAll]);
    C := FindComponent(Nombre_C);
    (C as TDBLookUpComboBoxAuto).KeyValue := id_animal;
    DBLCBACloseUp(C);
    (Sender as TLabel).Caption := (C as TDBLookUpComboBoxAuto).Text;
  end
  else
  begin
    Nombre_C := StringReplace((Sender as TLabel).Name,'E','',[rfReplaceAll]);
    C := FindComponent(Nombre_C);
    (C as TDBLookUpComboBoxAuto).KeyValue := null;
    DBLCBACloseUp(C);
    (Sender as TLabel).Caption := '';
  end;

end;

procedure TFArbolGeneaExterno.EDBLCBAMClick(Sender: TObject);
var F : TFSelAnimalesEmbriones;
    id_animal : integer;
    C, E : TComponent;
    Nombre_C, aux : string;
begin
  inherited;

  F := TFSelAnimalesEmbriones.Create(self);
  F.sexo := 2;
  F.SQLconsulta := 'select * from rep_animales_genea_externos(:sexo)';
  F.ShowModal;
  id_animal := F.id_animal;
  F.Destroy;

  ActualizarQuerysExternos;

  if (id_animal <> -1) then
  begin
    Nombre_C := StringReplace((Sender as TLabel).Name,'E','',[rfReplaceAll]);
    C := FindComponent(Nombre_C);
    (C as TDBLookUpComboBoxAuto).KeyValue := id_animal;
    aux := (C as TDBLookUpComboBoxAuto).Text;
    DBLCBACloseUp(C);
    (Sender as TLabel).Caption := aux;
  end
  else
  begin
    Nombre_C := StringReplace((Sender as TLabel).Name,'E','',[rfReplaceAll]);
    C := FindComponent(Nombre_C);
    (C as TDBLookUpComboBoxAuto).KeyValue := null;
    aux := (C as TDBLookUpComboBoxAuto).Text;
    DBLCBACloseUp(C);
    (Sender as TLabel).Caption := '';
  end;
end;

procedure TFArbolGeneaExterno.LBP1Click(Sender: TObject);
var C : TComponent;
    Nombre_C : string;
begin
  inherited;

  Nombre_C := StringReplace((Sender as TImage).Name,'LB','DBLCBA',[rfReplaceAll]);

  C := FindComponent(Nombre_C);
  (C as TDBLookUpComboBoxAuto).KeyValue := null;
  DBLCBACloseUp(C);


  Nombre_C := StringReplace((Sender as TImage).Name,'LB','',[rfReplaceAll]);
  LimpiarArbol(Nombre_C,Length(Nombre_C));

end;

procedure TFArbolGeneaExterno.ActivarEliminar;
begin

    LBP.OnClick := LBP1Click;
    LBM.OnClick := LBP1Click;
    LBMM.OnClick := LBP1Click;
    LBMMM.OnClick := LBP1Click;
    LBMMP.OnClick := LBP1Click;
    LBMP.OnClick := LBP1Click;
    LBMPM.OnClick := LBP1Click;
    LBMPP.OnClick := LBP1Click;
    LBPM.OnClick := LBP1Click;
    LBPMM.OnClick := LBP1Click;
    LBPMP.OnClick := LBP1Click;
    LBPP.OnClick := LBP1Click;
    LBPPM.OnClick := LBP1Click;
    LBPPP.OnClick := LBP1Click;

end;

procedure TFArbolGeneaExterno.LimpiarArbol(c : string; nivel : integer);
var i : integer;
    E, D : TComponent;
    Nom_E, Nom_D, a : string;
begin

     a := c; 

     for i := nivel to 3 do
     begin

          Nom_E := 'EDBLCBA'+a;
          Nom_D := 'DBLCBA'+a;

          E := FindComponent(Nom_E);
          D := FindComponent(Nom_D);

          (E as TLabel).Caption := '';
          (D as TDBLookupComboBoxAuto).KeyValue := null;

          LimpiarArbol(c+'P',nivel+1);
          LimpiarArbol(c+'M',nivel+1);
     end;

end;

end.
