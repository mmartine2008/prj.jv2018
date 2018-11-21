unit USimuladorA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls,
  jpeg, PngImage, ExtCtrls, StdCtrls, JvGIF, DBCtrls,
  UDBLookupComboBoxAuto, Grids, BaseGrid, AdvGrid, JvExStdCtrls, JvEdit,
  JvExControls, JvEnterTab, ImgList, UREPSimulPrev, PngImageList, QRCtrls,
  JvLabel;

type
  TRegAlimentos = record
    Nombre : String;
    PorcUsado : Double;
    PorcMS : Double;
    PrecioPorTon : Double;
    PrecioPorKg : Double;
    KgTalCual : Double;
    KgMs : Double;
  end;

  TArrAlimentos = Array of TRegAlimentos;

  TRegDietas = record
    Alimentos : TArrAlimentos;
    CantDias : Integer;
    KGAumentados : Double;
    KGAumentadosLote : Double;
    Conversion : Double;
    CostoNutricion : Double;
    KGConsumidosPorAnimal : Double;
    CostoDieta : Double;
  end;

  TArrDietas = Array [1..3] of TRegDietas;

  TFSimuladorA = class(TFUniversal)
    PngImageList1: TPngImageList;
    PBotones: TPanel;
    IBottom: TImage;
    ICancelar: TImage;
    LCancelar: TLabel;
    JvSiguiente: TJvImage;
    LBBSiguiente: TLabel;
    LBBAnterior: TLabel;
    JvAnteriror: TJvImage;
    LPreview: TLabel;
    IPreview: TImage;
    Button1: TButton;
    IBQRaciones: TIBQuery;
    IBQSuplementosRac: TIBQuery;
    DSRaciones: TDataSource;
    PCSimulador: TPageControl;
    TSCompraVenta: TTabSheet;
    Shape1: TShape;
    Shape8: TShape;
    Shape7: TShape;
    Shape6: TShape;
    Shape4: TShape;
    Shape3: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    JvEnterAsTab2: TJvEnterAsTab;
    EGuia: TJvEdit;
    EComision: TJvEdit;
    EFletes: TJvEdit;
    ECantAnimales: TJvEdit;
    EPrecioCompra: TJvEdit;
    TSRacion: TTabSheet;
    TSDatosP: TTabSheet;
    Label16: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    EConvAlimenticia: TJvEdit;
    TSConclusion: TTabSheet;
    Shape53: TShape;
    Shape52: TShape;
    Shape51: TShape;
    Shape50: TShape;
    Shape49: TShape;
    Shape48: TShape;
    Shape47: TShape;
    Shape46: TShape;
    Shape45: TShape;
    Shape44: TShape;
    Shape43: TShape;
    Shape42: TShape;
    Shape41: TShape;
    Shape40: TShape;
    Shape39: TShape;
    Shape38: TShape;
    Shape37: TShape;
    Shape36: TShape;
    Label36: TLabel;
    LRentaCiclo: TLabel;
    Label35: TLabel;
    LRentaMensual: TLabel;
    LUU: TLabel;
    LUtilLote: TLabel;
    LI: TLabel;
    LUtilidadAnimal: TLabel;
    Label33: TLabel;
    LUtilNutricion: TLabel;
    Label31: TLabel;
    LCambioCateg: TLabel;
    Label30: TLabel;
    LCostoDiario: TLabel;
    Label28: TLabel;
    LCostoTotalAnim: TLabel;
    Label29: TLabel;
    LCostoTotalKg: TLabel;
    PTopRacion: TPanel;
    PCRaciones: TPageControl;
    TSRacion1: TTabSheet;
    TSRacion2: TTabSheet;
    PBottomRacion: TPanel;
    LKgAumentoLote: TLabel;
    LKgAumentados: TLabel;
    LPrecioDieta: TLabel;
    LabelPrecioDieta: TLabel;
    LabelKgAuemntadoAnimal: TLabel;
    LabelKgAumentadoLote: TLabel;
    SKgALote: TShape;
    SKgAAnimal: TShape;
    SPrecioDieta: TShape;
    SPrecioDietaL: TShape;
    SKgAAnimalL: TShape;
    SKGALoteL: TShape;
    JvEAumentoDiario: TJvEdit;
    Shape13: TShape;
    Label11: TLabel;
    TSRacion3: TTabSheet;
    Shape29: TShape;
    SLabelConversion: TShape;
    LConversion: TLabel;
    SConversion: TShape;
    LabelConversion: TLabel;
    LabelCostoNutricion: TLabel;
    SCostoNutricion: TShape;
    LCostoNutricion: TLabel;
    SCostoNutricionL: TShape;
    SPrecio: TShape;
    LPrecioAnimal: TLabel;
    SPrecioC: TShape;
    LComisionAnimal: TLabel;
    SComisionC: TShape;
    SComision: TShape;
    LabelComision: TLabel;
    LabelFlete: TLabel;
    SFlete: TShape;
    SFleteC: TShape;
    LFelteAnimal: TLabel;
    SGuiaC: TShape;
    LGuiaAnimal: TLabel;
    SGuia: TShape;
    LabelGuia: TLabel;
    LabelTotalAnimal: TLabel;
    STotalAnimal: TShape;
    STotalAnimalC: TShape;
    LTotalAnimal: TLabel;
    LTotalLote: TLabel;
    STotalLoteC: TShape;
    STotalKgC: TShape;
    LTotalKgs: TLabel;
    STotalKg: TShape;
    STotalLote: TShape;
    LabelTotalKg: TLabel;
    LabelTotalLote: TLabel;
    LabelPrecio: TLabel;
    EKgPromedio: TJvEdit;
    Label4: TLabel;
    Shape70: TShape;
    LKGPromVenta: TLabel;
    Label34: TLabel;
    Shape71: TShape;
    Shape72: TShape;
    Image1: TImage;
    Image5: TImage;
    Label32: TLabel;
    ECantAnimalesVenta: TJvEdit;
    EPrecioCompraVenta: TJvEdit;
    EComisionVenta: TJvEdit;
    EGuiaVenta: TJvEdit;
    EFletesVenta: TJvEdit;
    LPrecioAnimalVenta: TLabel;
    LComisionAnimalVenta: TLabel;
    LFleteAnimalVenta: TLabel;
    LGuiaAnimalVenta: TLabel;
    LTotalAnimalVenta: TLabel;
    LTotalKgsVenta: TLabel;
    LTotalLoteVenta: TLabel;
    SPrecioV: TShape;
    SComisionV: TShape;
    SFleteV: TShape;
    SGuiaV: TShape;
    STotalAnimalV: TShape;
    STotalKgV: TShape;
    STotalLoteV: TShape;
    Label45: TLabel;
    Shape2: TShape;
    Shape73: TShape;
    Label46: TLabel;
    Shape75: TShape;
    Label48: TLabel;
    Label50: TLabel;
    Shape76: TShape;
    Shape77: TShape;
    Label51: TLabel;
    LabelPrecioVenta: TLabel;
    SPrecioVenta: TShape;
    SComisionVenta: TShape;
    LabelComisionVenta: TLabel;
    LabelFleteVenta: TLabel;
    SFleteVenta: TShape;
    SGuiaVenta: TShape;
    LabelGuiaVenta: TLabel;
    LabelTotalVenta: TLabel;
    STotalVenta: TShape;
    StotalKGVenta: TShape;
    LabelKGTotalVenta: TLabel;
    LabelTotalLoteVenta: TLabel;
    STotalLoteVenta: TShape;
    Shape85: TShape;
    Label18: TLabel;
    Shape23: TShape;
    Shape24: TShape;
    Label19: TLabel;
    ECostoSaniAnimal: TJvEdit;
    EManoObraDiaria: TJvEdit;
    Shape28: TShape;
    Shape27: TShape;
    Label67: TLabel;
    Shape95: TShape;
    ECostoHoteleria: TJvEdit;
    Shape96: TShape;
    Shape78: TShape;
    JvECantRaciones: TJvEdit;
    Shape79: TShape;
    Label15: TLabel;
    PCompR1: TPanel;
    SG1: TAdvStringGrid;
    Label53: TLabel;
    Image9: TImage;
    PCantR1: TPanel;
    Shape65: TShape;
    Shape26: TShape;
    Shape5: TShape;
    Shape74: TShape;
    Label9: TLabel;
    Label60: TLabel;
    Label47: TLabel;
    Label59: TLabel;
    EPorcConsumo1: TJvEdit;
    EAKGMSR1: TJvEdit;
    EAKGTCR1: TJvEdit;
    PCantR2: TPanel;
    Shape67: TShape;
    Label49: TLabel;
    Label61: TLabel;
    EPorcConsumo2: TJvEdit;
    Shape88: TShape;
    Label62: TLabel;
    EAKGMSR2: TJvEdit;
    Shape89: TShape;
    Label63: TLabel;
    EAKGTCR2: TJvEdit;
    Shape90: TShape;
    PCompR2: TPanel;
    Label54: TLabel;
    SG2: TAdvStringGrid;
    Image12: TImage;
    PCantR3: TPanel;
    Label23: TLabel;
    Shape94: TShape;
    EPorcConsumo3: TJvEdit;
    Label64: TLabel;
    Shape92: TShape;
    Label65: TLabel;
    EAKGMSR3: TJvEdit;
    Shape93: TShape;
    Label66: TLabel;
    Shape69: TShape;
    EAKGTCR3: TJvEdit;
    PCompR3: TPanel;
    Label52: TLabel;
    SG3: TAdvStringGrid;
    Image7: TImage;
    Label10: TLabel;
    PResultRacion1: TPanel;
    Shape25: TShape;
    Shape22: TShape;
    Shape21: TShape;
    Shape19: TShape;
    Shape17: TShape;
    Label22: TLabel;
    LAumentoLoteR1: TLabel;
    Shape20: TShape;
    Label20: TLabel;
    Shape18: TShape;
    Label14: TLabel;
    Label12: TLabel;
    Shape10: TShape;
    Shape9: TShape;
    Shape16: TShape;
    Label8: TLabel;
    LAumentoAnimalR1: TLabel;
    LKGConsumoR1: TLabel;
    LConversionR1: TLabel;
    LCostoNutricionR1: TLabel;
    Label40: TLabel;
    ILRaciones: TImageList;
    PAlimentacionGral: TPanel;
    Label13: TLabel;
    JvEdit1: TJvEdit;
    Label17: TLabel;
    JvEdit2: TJvEdit;
    Image8: TImage;
    Label55: TLabel;
    PRacion1: TPanel;
    DBLookupComboBoxAuto1: TDBLookupComboBoxAuto;
    Label56: TLabel;
    Label57: TLabel;
    JvEdit3: TJvEdit;
    Image13: TImage;
    Label58: TLabel;
    PTopR1: TPanel;
    DBLCBATipoSuplementacion1: TDBLookupComboBoxAuto;
    EDiasEncierre1: TJvEdit;
    LDiasR1: TLabel;
    LSelRacion1: TLabel;
    SDiasR1: TShape;
    Shape86: TShape;
    PResultRacion2: TPanel;
    Shape11: TShape;
    Shape12: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Label21: TLabel;
    LAumentoLoteR2: TLabel;
    Shape33: TShape;
    Label24: TLabel;
    Shape34: TShape;
    Label25: TLabel;
    Label26: TLabel;
    Shape35: TShape;
    Shape54: TShape;
    Shape55: TShape;
    Label27: TLabel;
    LAumentoAnimalR2: TLabel;
    LKGConsumoR2: TLabel;
    LConversionR2: TLabel;
    LCostoNutricionR2: TLabel;
    Label38: TLabel;
    PTopR2: TPanel;
    LSelRacion2: TLabel;
    DBLCBATipoSuplementacion2: TDBLookupComboBoxAuto;
    LDiasR2: TLabel;
    EDiasEncierre2: TJvEdit;
    SDiasR2: TShape;
    Shape87: TShape;
    PRacion2: TPanel;
    Label68: TLabel;
    Label69: TLabel;
    Image11: TImage;
    Label70: TLabel;
    DBLookupComboBoxAuto2: TDBLookupComboBoxAuto;
    JvEdit4: TJvEdit;
    PResultRacion3: TPanel;
    Shape14: TShape;
    Shape15: TShape;
    Shape56: TShape;
    Shape57: TShape;
    Shape58: TShape;
    Label39: TLabel;
    LAumentoLoteR3: TLabel;
    Shape59: TShape;
    Label41: TLabel;
    Shape60: TShape;
    Label42: TLabel;
    Label43: TLabel;
    Shape61: TShape;
    Shape62: TShape;
    Shape63: TShape;
    Label44: TLabel;
    LAumentoAnimalR3: TLabel;
    LKGConsumoR3: TLabel;
    LConversionR3: TLabel;
    LCostoNutricionR3: TLabel;
    Label37: TLabel;
    PTopR3: TPanel;
    EDiasEncierre3: TJvEdit;
    LDiasR3: TLabel;
    SDiasR3: TShape;
    DBLCBATipoSuplementacion3: TDBLookupComboBoxAuto;
    LSelRacion3: TLabel;
    Shape91: TShape;
    PRacion3: TPanel;
    Label71: TLabel;
    Label72: TLabel;
    Image6: TImage;
    Label73: TLabel;
    DBLookupComboBoxAuto3: TDBLookupComboBoxAuto;
    JvEdit5: TJvEdit;
      procedure ECantAnimalesChange(Sender: TObject);
    procedure ECantAnimalesVentaChange(Sender: TObject);
    procedure EPrecioCompraChange(Sender: TObject);
    procedure EPrecioCompraVentaChange(Sender: TObject);
    procedure EKgPromedioChange(Sender: TObject);
    procedure EComisionChange(Sender: TObject);
    procedure EcomisionVentaChange(Sender: TObject);
    procedure EFletesChange(Sender: TObject);
    procedure EFletesVentaChange(Sender: TObject);
    procedure EGuiaChange(Sender: TObject);
    procedure EGuiaVentaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLCBATipoSuplementacion1CloseUp(Sender: TObject);
    procedure EDiasEncierre1Change(Sender: TObject);
    procedure EManoObraDiariaChange(Sender: TObject);
    procedure ECostoSaniAnimalChange(Sender: TObject);
    procedure EConvAlimenticiaChange(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure LSelRacionClick(Sender: TObject);
    procedure LSelRacionMouseEnter(Sender: TObject);
    procedure LSelRacionMouseLeave(Sender: TObject);
    procedure JvSiguienteClick(Sender: TObject);
    procedure JvAnterirorClick(Sender: TObject);
    procedure PCSimuladorChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IPreviewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvEAumentoDiarioChange(Sender: TObject);
    procedure EDiasEncierre2Change(Sender: TObject);
    procedure EDiasEncierre3Change(Sender: TObject);
    procedure EPorcConsumo1Change(Sender: TObject);
    procedure DBLCBATipoSuplementacion2CloseUp(Sender: TObject);
    procedure DBLCBATipoSuplementacion3CloseUp(Sender: TObject);
    procedure EPorcConsumo2Change(Sender: TObject);
    procedure EPorcConsumo3Change(Sender: TObject);
    procedure EAKGMSR1Change(Sender: TObject);
    procedure EAKGTCR1Change(Sender: TObject);
    procedure EAKGMSR2Change(Sender: TObject);
    procedure EAKGTCR2Change(Sender: TObject);
    procedure EAKGMSR3Change(Sender: TObject);
    procedure EAKGTCR3Change(Sender: TObject);
    procedure ECostoHoteleriaChange(Sender: TObject);
    procedure JvECantRacionesChange(Sender: TObject);
    procedure JvEdit1Change(Sender: TObject);
    procedure JvEdit2Change(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure DBLookupComboBoxAuto1CloseUp(Sender: TObject);
    procedure JvEdit3Change(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure DBLookupComboBoxAuto2CloseUp(Sender: TObject);
    procedure JvEdit4Change(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure DBLookupComboBoxAuto3CloseUp(Sender: TObject);
    procedure JvEdit5Change(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure LSelRacion2Click(Sender: TObject);
    procedure LSelRacion3Click(Sender: TObject);
    procedure Label56Click(Sender: TObject);
    procedure Label68Click(Sender: TObject);
    procedure Label71Click(Sender: TObject);
  private
    cantidadRaciones : Integer;
    cantAnimalesCompra, cantAnimalesVenta : integer;
    precioCompra, precioVenta, kgPromedioCompra, kgPromedioVenta, comisionCompra, comisionVenta, FleteCompra, FleteVenta, guiaCompra, guiaVenta, PrecioKG, PrecioTotal, CantTotal : Double;
    DiasEncierre, ManoObra, CostoSanitario, ConvAlimenticia, TotalPorAnimalVenta, TotalPorAnimalCompra, ConsumoPorAnimal, AumentoDiario, PorcRacion1, PorcRacion2, PorcRacion3 : Double;
    KgTotalesConsumido, Peso1, Peso2, Peso3, CostoNutricion, KGTCR1, KGTCR2, KGTCR3, KGMSR1, KGMSR2, KGMSR3, CostoHoteleria : Double;
    AlimentosRacion : TArrAlimentos;
    DiasEncierre1, DiasEncierre2, DiasEncierre3 : Integer;
    Dietas : TArrDietas;
    valorcompraporanimal, valorventaporanimal : Double;
    KGMS1, KGMS2, KGMS3, KGMSTotal, KGTC1, KGTC2, KGTC3, KGTCTotal, MS1, MS2, MS3, MSTotal, totalPesos1, totalPesos2, totalPesos3 : Double;
    procedure ArmarTabla(var F : TFREPSimulPrev);
    procedure CalcularDieta(Tab : Integer);
    procedure CalcularDatosAlimento(Dieta: Integer);
  public
    procedure RealizarCalculosCompra;
    procedure RealizarCalculosVenta;
    procedure RealizarCalculosProductivos;
    procedure ArmarGrillaAlimentacion1;
    procedure ArmarGrillaAlimentacion2;
    procedure ArmarGrillaAlimentacion3;
    procedure CalculosAlimentacion;
  end;

var
  FSimuladorA: TFSimuladorA;

implementation

{$R *.dfm}

uses
  UPrincipal, URacion, UMensajeHuella;

procedure TFSimuladorA.ECantAnimalesChange(Sender: TObject);
var
  I : Integer;
begin
  inherited;
  if TryStrToInt(ECantAnimales.Text, I) then
  begin
    cantAnimalesCompra := I;
    RealizarCalculosCompra;
  end;
end;

procedure TFSimuladorA.ECantAnimalesVentaChange(Sender: TObject);
var
  I : Integer;
begin
  inherited;
  if TryStrToInt(ECantAnimalesVenta.Text, I) then
  begin
    cantAnimalesVenta := I;
    RealizarCalculosVenta;
  end;
end;

procedure TFSimuladorA.EPrecioCompraChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EPrecioCompra.Text, I) then
  begin
    precioCompra := I;
    RealizarCalculosCompra;
  end;
end;

procedure TFSimuladorA.EPrecioCompraVentaChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EPrecioCompraVenta.Text, I) then
  begin
    precioVenta := I;
    RealizarCalculosVenta;
  end;
end;

procedure TFSimuladorA.EKgPromedioChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EKgPromedio.Text, I) then
  begin
    kgPromedioCompra := I;
    PCRaciones.Visible := (AumentoDiario > 0) and (I > 0);
    RealizarCalculosCompra;
  end;
end;

procedure TFSimuladorA.EComisionChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EComision.Text, I) then
  begin
    comisionCompra := I;
    RealizarCalculosCompra;
  end;
end;

procedure TFSimuladorA.EcomisionVentaChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EcomisionVenta.Text, I) then
  begin
    comisionVenta := I;
    RealizarCalculosVenta;
  end;
end;

procedure TFSimuladorA.EFletesChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EFletes.Text, I) then
  begin
    FleteCompra := I;
    RealizarCalculosCompra;
  end;
end;

procedure TFSimuladorA.EFletesVentaChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EFletesVenta.Text, I) then
  begin
    FleteVenta := I;
    RealizarCalculosVenta;
  end;
end;

procedure TFSimuladorA.EGuiaChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EGuia.Text, I) then
  begin
    guiaCompra := I;
    RealizarCalculosCompra;
  end;
end;

procedure TFSimuladorA.EGuiaVentaChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EGuiaVenta.Text, I) then
  begin
    guiaVenta := I;
    RealizarCalculosVenta;
  end;
end;

procedure TFSimuladorA.FormCreate(Sender: TObject);
var
  I : Integer;
  b1, b2, b3 : TBitmap;
begin
  inherited;
  cantAnimalesCompra := 0;
  cantAnimalesVenta := 0;
  precioCompra := 0;
  precioVenta := 0;
  kgPromedioCompra := 0;
  kgPromedioVenta := 0;
  comisionCompra := 0;
  comisionVenta := 0;
  FleteCompra := 0;
  FleteVenta := 0;
  guiaCompra := 0;
  guiaVenta := 0;
  PrecioKG := 0;
  PrecioTotal := 0;
  CantTotal := 0;
  TotalPorAnimalVenta := 0;
  TotalPorAnimalCompra := 0;
  KgTotalesConsumido := 0;
  ConsumoPorAnimal := 0;
  CostoNutricion := 0;
  KGMS1 := 0;
  KGMS2 := 0;
  KGMS3 := 0;
  KGTC1 := 0;
  KGTC2 := 0;
  KGTC3 := 0;
  MS1 := 0;
  MS2 := 0;
  MS3 := 0;
  MSTotal := 0;
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  IBQRaciones.First;
  for I := 1 to 3 do
  begin
    Dietas[I].CantDias := 0;
    Dietas[I].Conversion := 0;
    Dietas[I].CostoNutricion := 0;
    Dietas[I].KGAumentados := 0;
    Dietas[I].KGAumentadosLote := 0;
    Dietas[I].KGConsumidosPorAnimal := 0;
  end;
  try
    b1 := TBitmap.Create;
    b1.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\Rac1.bmp');
    b2 := TBitmap.Create;
    b2.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\Rac2.bmp');
    b3 := TBitmap.Create;
    b3.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenes\Rac3.bmp');
    ILRaciones.Add(b1,nil);
    ILRaciones.Add(b2,nil);
    ILRaciones.Add(b3,nil);
  except
  end;
end;

procedure TFSimuladorA.RealizarCalculosCompra;
var
  v1, v2, v3, v4, t1,t2,t3 : Double;
begin
  v1 := precioCompra*kgPromedioCompra;
  if v1 <> 0 then
  begin
    LPrecioAnimal.Visible := true;
    SPrecio.Visible := true;
    LabelPrecio.Visible := true;
    SPrecioC.Visible := true;
    LPrecioAnimal.Caption := '$'+FormatFloat('#0.##',v1);
    valorcompraporanimal := v1;
  end
  else
    LPrecioAnimal.Caption := '';

  v2 := (v1*comisionCompra)/100;
  if v2 <> 0 then
  begin
    LComisionAnimal.Visible := true;
    SComision.Visible := true;
    LabelComision.Visible := true;
    SComisionC.Visible := true;
    LComisionAnimal.Caption := '$'+FormatFloat('#0.##',v2);
    valorcompraporanimal := valorcompraporanimal + v2;
  end
  else
    LComisionAnimal.Caption := '';
  if cantAnimalesCompra > 0 then
  begin
    v3 := FleteCompra/cantAnimalesCompra;
    if v3 <> 0 then
    begin
      LFelteAnimal.Visible := true;
      SFlete.Visible := true;
      LabelFlete.Visible := true;
      SFleteC.Visible := true;
      LFelteAnimal.Caption := '$'+FormatFloat('#0.##',v3);
      valorcompraporanimal := valorcompraporanimal + v3;
    end
    else
      LFelteAnimal.Caption := '';
  end
  else
  begin
    v3 := 0;
    LFelteAnimal.Caption := '';
  end;
  if cantAnimalesCompra > 0 then
  begin
    v4 := guiaCompra/cantAnimalesCompra;
    if v4 <> 0 then
    begin
      LGuiaAnimal.Visible := true;
      SGuia.Visible := true;
      LabelGuia.Visible := true;
      SGuiaC.Visible := true;
      LGuiaAnimal.Caption := '$'+FormatFloat('#0.##',v4);
      valorcompraporanimal := valorcompraporanimal + v4;
    end
    else
      LGuiaAnimal.Caption := '';
  end
  else
  begin
    v4 := 0;
    LGuiaAnimal.Caption := '';
  end;
  t1 := v1+v2+v3+v4;
  TotalPorAnimalCompra := t1;
  if t1 <> 0 then
  begin
    LTotalAnimal.Visible := true;
    STotalAnimal.Visible := true;
    LabelTotalAnimal.Visible := true;
    STotalAnimalC.Visible := true;
    LTotalAnimal.Caption := '$'+FormatFloat('#0.##',t1);
  end
  else
    LTotalAnimal.Caption := '';
  if kgPromedioCompra > 0 then
    t2 := t1/kgPromedioCompra
  else
    t2 := 0;
  if t2 <> 0 then
  begin
    LTotalKgs.Visible := true;
    STotalKg.Visible := true;
    LabelTotalKg.Visible := true;
    STotalKgC.Visible := true;
    LTotalKgs.Caption := '$'+FormatFloat('#0.##',t2);
  end
  else
    LTotalKgs.Caption := '';

  t3 := t1 * cantAnimalesCompra;
  if t3 <> 0 then
  begin
    LTotalLote.Visible := true;
    STotalLote.Visible := true;
    LabelTotalLote.Visible := true;
    STotalLoteC.Visible := true;
    LTotalLote.Caption := '$'+FormatFloat('#0.##',t3);
  end
  else
    LTotalLote.Caption := '';
  CalculosAlimentacion;
end;

procedure TFSimuladorA.RealizarCalculosVenta;
var
  v1, v2, v3, v4, t1,t2,t3 : Double;
begin
  v1 := precioVenta*kgPromedioVenta;
  if v1 <> 0 then
  begin
    LPrecioAnimalVenta.Visible := true;
    SPrecioVenta.Visible := true;
    LabelPrecioVenta.Visible := true;
    SPrecioV.Visible := true;
    LPrecioAnimalVenta.Caption := '$'+FormatFloat('#0.##',v1);
    valorventaporanimal := v1;
  end
  else
    LPrecioAnimalVenta.Caption := '';
  v2 := (v1*comisionVenta)/100;
  if v2 <> 0 then
  begin
    LComisionAnimalVenta.Visible := true;
    SComisionVenta.Visible := true;
    LabelComisionVenta.Visible := true;
    SComisionV.Visible := true;
    LComisionAnimalVenta.Caption := '$'+FormatFloat('#0.##',v2);
    valorventaporanimal := valorventaporanimal - v2;
  end
  else
    LComisionAnimalVenta.Caption := '';
  if cantAnimalesVenta > 0 then
  begin
    v3 := FleteVenta/cantAnimalesVenta;
    if v3 <> 0 then
    begin
      LFleteAnimalVenta.Visible := true;
      SFleteVenta.Visible := true;
      LabelFleteVenta.Visible := true;
      SFleteV.Visible := true;
      LFleteAnimalVenta.Caption := '$'+FormatFloat('#0.##',v3);
      valorventaporanimal := valorventaporanimal - v3;
    end
    else
      LFleteAnimalVenta.Caption := '';
  end
  else
  begin
    v3 := 0;
    LFleteAnimalVenta.Caption := '';
  end;
  if cantAnimalesVenta > 0 then
  begin
    v4 := guiaVenta/cantAnimalesVenta;
    if v4 <> 0 then
    begin
      LGuiaAnimalVenta.Visible := true;
      SGuiaVenta.Visible := true;
      LabelGuiaVenta.Visible := true;
      SGuiaV.Visible := true;
      LGuiaAnimalVenta.Caption := '$'+FormatFloat('#0.##',v4);
      valorventaporanimal := valorventaporanimal - v4 ;
    end
    else
      LGuiaAnimalVenta.Caption := '';
  end
  else
  begin
    v4 := 0;
    LGuiaAnimalVenta.Caption := '';
  end;
  t1 := v1-v2-v3-v4;
  TotalPorAnimalVenta := t1;
  if t1 <> 0 then
  begin
    LTotalAnimalVenta.Visible := true;
    STotalVenta.Visible := true;
    LabelTotalVenta.Visible := true;
    STotalAnimalV.Visible := true;
    LTotalAnimalVenta.Caption := '$'+FormatFloat('#0.##',t1);
  end
  else
    LTotalAnimalVenta.Caption := '';

  if kgPromedioVenta > 0 then
    t2 := t1/kgPromedioVenta
  else
    t2 := 0;
  if t2 <> 0 then
  begin
    LTotalKgsVenta.Visible := true;
    StotalKGVenta.Visible := true;
    LabelKGTotalVenta.Visible := true;
    STotalKgV.Visible := true;
    LTotalKgsVenta.Caption := '$'+FormatFloat('#0.##',t2);
  end
  else
    LTotalKgsVenta.Caption := '';

  t3 := t1 * cantAnimalesVenta;
  if t3 <> 0 then
  begin
    LTotalLoteVenta.Visible := true;
    STotalLoteVenta.Visible := true;
    LabelTotalLoteVenta.Visible := true;
    STotalLoteV.Visible := true;
    LTotalLoteVenta.Caption := '$'+FormatFloat('#0.##',t3);
  end
  else
    LTotalLoteVenta.Caption := '';
  CalculosAlimentacion;
end;

procedure TFSimuladorA.DBLCBATipoSuplementacion1CloseUp(Sender: TObject);
var
  I : Integer;
  Indice : Integer;
begin
  inherited;
  if DBLCBATipoSuplementacion1.KeyValue <> null then
  begin
    //SG1.Visible := true;
    SDiasR1.Visible := true;
    LDiasR1.Visible := true;
    EDiasEncierre1.Visible := true;
    Indice := 0;
    SetLength(Dietas[1].Alimentos,Indice);
    IBQSuplementosRac.Close;
    IBQSuplementosRac.ParamByName('racion').Value := DBLCBATipoSuplementacion1.KeyValue;
    IBQSuplementosRac.Open;
    IBQSuplementosRac.First;
    I := 0;
    PrecioTotal := 0;
    PrecioKG := 0;
    MS1 := 0;
    while not IBQSuplementosRac.Eof do
    begin
      SetLength(Dietas[1].Alimentos,Indice+1);
      Dietas[1].Alimentos[Indice].Nombre := IBQSuplementosRac.FieldValues['nombre'];
      Dietas[1].Alimentos[Indice].PorcMS := IBQSuplementosRac.FieldValues['porc_ms'];
      Dietas[1].Alimentos[Indice].PorcUsado := IBQSuplementosRac.FieldValues['porcentaje'];
      Dietas[1].Alimentos[Indice].PrecioPorTon := IBQSuplementosRac.FieldValues['precio'];
      PrecioKg := PrecioKG + ((IBQSuplementosRac.FieldValues['precio'])/1000);
      MS1 := MS1 + IBQSuplementosRac.FieldValues['porc_ms'];
      Inc(Indice);
      I := I +1;
      IBQSuplementosRac.Next;
    end;
    ArmarGrillaAlimentacion1;
    if I > 0 then
      MS1 := MS1 / I;
    //PResultRacion1.Visible := true;
  end;
  RealizarCalculosProductivos;
end;

procedure TFSimuladorA.DBLCBATipoSuplementacion2CloseUp(Sender: TObject);
var
  I : Integer;
  Indice : Integer;
begin
  inherited;
  if DBLCBATipoSuplementacion2.KeyValue <> null then
  begin
    //SG2.Visible := true;
    LDiasR2.Visible := true;
    SDiasR2.Visible := true;
    EDiasEncierre2.Visible := true;
    Indice := 0;
    SetLength(Dietas[2].Alimentos,Indice);
    IBQSuplementosRac.Close;
    IBQSuplementosRac.ParamByName('racion').Value := DBLCBATipoSuplementacion2.KeyValue;
    IBQSuplementosRac.Open;
    IBQSuplementosRac.First;
    I := 0;
    MS2 := 0;
    PrecioTotal := 0;
    PrecioKG := 0;
    while not IBQSuplementosRac.Eof do
    begin
      SetLength(Dietas[2].Alimentos,Indice+1);
      Dietas[2].Alimentos[Indice].Nombre := IBQSuplementosRac.FieldValues['nombre'];
      Dietas[2].Alimentos[Indice].PorcMS := IBQSuplementosRac.FieldValues['porc_ms'];
      Dietas[2].Alimentos[Indice].PorcUsado := IBQSuplementosRac.FieldValues['porcentaje'];
      Dietas[2].Alimentos[Indice].PrecioPorTon := IBQSuplementosRac.FieldValues['precio'];
      PrecioKg := PrecioKG + ((IBQSuplementosRac.FieldValues['precio'])/1000);
      Inc(Indice);
      MS2 := MS2 + IBQSuplementosRac.FieldValues['porc_ms'];
      I := I +1;
      IBQSuplementosRac.Next;
    end;
    ArmarGrillaAlimentacion2;
    if I > 0 then
      MS2 := MS2 / I;
    //PResultRacion2.Visible := true;
  end;
  RealizarCalculosProductivos;
end;

procedure TFSimuladorA.DBLCBATipoSuplementacion3CloseUp(Sender: TObject);
var
  I : Integer;
  Indice : Integer;
begin
  inherited;
  if DBLCBATipoSuplementacion3.KeyValue <> null then
  begin
    //SG3.Visible := true;
    LDiasR3.Visible := true;
    SDiasR3.Visible := true;
    EDiasEncierre3.Visible := true;
    Indice := 0;
    SetLength(Dietas[3].Alimentos,Indice);
    IBQSuplementosRac.Close;
    IBQSuplementosRac.ParamByName('racion').Value := DBLCBATipoSuplementacion3.KeyValue;
    IBQSuplementosRac.Open;
    IBQSuplementosRac.First;
    I := 0;
    MS3 := 0;
    PrecioTotal := 0;
    PrecioKG := 0;
    while not IBQSuplementosRac.Eof do
    begin
      SetLength(Dietas[3].Alimentos,Indice+1);
      Dietas[3].Alimentos[Indice].Nombre := IBQSuplementosRac.FieldValues['nombre'];
      Dietas[3].Alimentos[Indice].PorcMS := IBQSuplementosRac.FieldValues['porc_ms'];
      Dietas[3].Alimentos[Indice].PorcUsado := IBQSuplementosRac.FieldValues['porcentaje'];
      Dietas[3].Alimentos[Indice].PrecioPorTon := IBQSuplementosRac.FieldValues['precio'];
      PrecioKg := PrecioKG + ((IBQSuplementosRac.FieldValues['precio'])/1000);
      Inc(Indice);
      MS3 := MS3 + IBQSuplementosRac.FieldValues['porc_ms'];
      I := I +1;
      IBQSuplementosRac.Next;
    end;
    ArmarGrillaAlimentacion3;
    if I > 0 then
      MS3 := MS3 / I;
    //PResultRacion3.Visible := true;
  end;
  RealizarCalculosProductivos;
end;

procedure TFSimuladorA.CalcularDatosAlimento(Dieta: Integer);
var
  I : Integer;
  porc_ms_racion : Double;
begin
  {KgsTotal := 0;
  KgMSTotal := 0;
  CostoTotal := 0;}
  for I := 0 to Length(Dietas[Dieta].Alimentos)-1 do
    Porc_ms_racion := Porc_ms_racion + ((Dietas[Dieta].Alimentos[I].PorcUsado * Dietas[Dieta].Alimentos[I].PorcMS) / 100);

  for I := 0 to Length(Dietas[Dieta].Alimentos)-1 do
  begin

    Dietas[Dieta].Alimentos[I].KgMs := (Dietas[Dieta].KGConsumidosPorAnimal * (Dietas[Dieta].Alimentos[I].PorcUsado / 100)) * cantAnimalesCompra;
    Dietas[Dieta].Alimentos[I].KgTalCual := (Dietas[Dieta].Alimentos[I].KgMs * 100) / Porc_ms_racion;
    Dietas[Dieta].Alimentos[I].PrecioPorKg := ((Dietas[Dieta].Alimentos[I].KgTalCual * Dietas[Dieta].Alimentos[I].PrecioPorTon) / 1000);

    {KgMSTotal := KgMSTotal + AlimentosRacion[I].KgMs;
    KgsTotal := KgsTotal + ALimentosRacion[I].KgTalCual;
    CostoTotal := CostoTotal + AlimentosRacion[I].PrecioPorKg;}
  end;
end;

procedure TFSimuladorA.ArmarGrillaAlimentacion1;
var
  I : Integer;
  KGRacion, KGTc, KGTon, KGConsumo, KGConsumoTotal, T : Double;
  T1, T2, T3, Porc_ms_racion : Double;
begin

  SG1.RowCount := 2;
  KGRacion := 0;
  KGTc := 0;
  KGTon := 0;

  PResultRacion1.Visible := (KGMSR1 <> 0) or (KGTCR1 <> 0) or (PorcRacion1 <> 0);
  PCompR1.Visible := (KGMSR1 <> 0) or (KGTCR1 <> 0) or (PorcRacion1 <> 0);
  PBottomRacion.Visible := PCompR1.Visible;
  TSRacion2.TabVisible := ((cantidadRaciones = 2) or (cantidadRaciones = 3)) and PCompR1.Visible;

  Peso1 := kgPromedioCompra+(AumentoDiario * DiasEncierre1);
  for I := 0 to Length(Dietas[1].Alimentos)-1 do
    Porc_ms_racion := Porc_ms_racion + ((Dietas[1].Alimentos[I].PorcUsado * Dietas[1].Alimentos[I].PorcMS) / 100);


  if (KGMSR1 <> 0) and (KGTCR1 <> 0) and (PorcRacion1 <> 0) then
  begin
    KGTCR1 := ((Peso1+kgPromedioCompra)/2)*(PorcRacion1 / 100);
    EAKGMSR1.OnChange := nil;
    EAKGMSR1.Text := FormatFloat('#0.##',KGMSR1);
    EAKGMSR1.OnChange := EAKGTCR1Change;
    KGTCR1 := 0;
  end;

  if KGMSR1 = 0 then
  begin
    if PorcRacion1 = 0 then
    begin
        KGMSR1 := (KGTCR1 * Porc_ms_racion) / 100;
    end
    else
      KGMSR1 := ((Peso1+kgPromedioCompra)/2)*(PorcRacion1 / 100);
    EAKGMSR1.OnChange := nil;
    EAKGMSR1.Text := FormatFloat('#0.##',KGMSR1);
    EAKGMSR1.OnChange := EAKGMSR1Change;
  end;

  if PorcRacion1 = 0 then
  begin
    if ((Peso1+kgPromedioCompra)/2) > 0 then
      PorcRacion1 := (KGMSR1 * 100)/((Peso1+kgPromedioCompra)/2)
    else
      PorcRacion1 := 0;
    EPorcConsumo1.OnChange := nil;
    EPorcConsumo1.Text := FormatFloat('#0.##',PorcRacion1);
    EPorcConsumo1.OnChange := EPorcConsumo1Change;
  end;
  
  if KGTCR1 = 0 then
  begin
    if KGMSR1> 0 then
      begin
        KGTCR1 := (KGMSR1 * 100 )/Porc_ms_racion;
      end
    else
      KGTCR1 := 0;
    EAKGTCR1.OnChange := nil;
    EAKGTCR1.Text := FormatFloat('#0.##',KGTCR1);
    EAKGTCR1.OnChange := EAKGTCR1Change;
  end;

  KGConsumo := ((Peso1+kgPromedioCompra)/2)*(PorcRacion1 / 100);

  KGMS1 := 0;
  KGTC1 := 0;
  KGMS1 := KGMSR1 * cantAnimalesCompra * DiasEncierre1;
  KGTC1 := ((KGMSR1*100)/Porc_ms_racion) * cantAnimalesCompra * DiasEncierre1;

  KGConsumoTotal := KGConsumo * cantAnimalesCompra;

  Dietas[1].CantDias := DiasEncierre1;
  if AumentoDiario > 0 then
    Dietas[1].Conversion := KGConsumo/AumentoDiario
  else
    Dietas[1].Conversion := 0;
  Dietas[1].KGAumentados := AumentoDiario * DiasEncierre1;
  Dietas[1].KGAumentadosLote := (AumentoDiario * DiasEncierre1)*cantAnimalesCompra;
  Dietas[1].KGConsumidosPorAnimal := KGConsumo;


  CalcularDatosAlimento(1);

  SG1.Cells[0,0] := 'Alimento';
  SG1.Cells[2,0] := '% Usado';
  SG1.Cells[3,0] := 'Kg MS';
  SG1.Cells[4,0] := 'Kg Tal Cual';
  SG1.Cells[5,0] := '$';
  SG1.Cells[1,0] := '$/Tn.';
  SG1.CellProperties[0,0].Alignment := taCenter;
  SG1.CellProperties[1,0].Alignment := taCenter;
  SG1.CellProperties[2,0].Alignment := taCenter;
  SG1.CellProperties[3,0].Alignment := taCenter;
  SG1.CellProperties[4,0].Alignment := taCenter;
  SG1.CellProperties[5,0].Alignment := taCenter;
  T := 0;
  T1 := 0;
  T2 := 0;
  T3 := 0;
  for I := 0 to Length(Dietas[1].Alimentos)-1 do
  begin
    if I <= 5 then
    begin
      SG1.Cells[0,I+1] := Dietas[1].Alimentos[I].Nombre;
      SG1.Cells[2,I+1] := FormatFloat('#0.##',Dietas[1].Alimentos[I].PorcUsado)+' %';
      SG1.Cells[3,I+1] := FormatFloat('#0.##',Dietas[1].Alimentos[I].KgMs)+' Kg';
      SG1.Cells[4,I+1] := FormatFloat('#0.##',Dietas[1].Alimentos[I].KgTalCual)+' Kg';
      SG1.Cells[5,I+1] := '$ '+FormatFloat('#0.##',Dietas[1].Alimentos[I].PrecioPorKg);
      SG1.Cells[1,I+1] := '$ '+FormatFloat('#0.##',Dietas[1].Alimentos[I].PrecioPorTon);
      SG1.RowCount := SG1.RowCount + 1;
      SG1.Height := SG1.Height + 27;

      T := T + Dietas[1].Alimentos[I].PrecioPorTon;
      T1 := T1 + Dietas[1].Alimentos[I].KgMs;
      T2 := T2 + Dietas[1].Alimentos[I].KgTalCual;
      T3 := T3 + Dietas[1].Alimentos[I].PrecioPorKg;

      KGRacion := KGRacion + (KGConsumoTotal/cantAnimalesCompra)*(Dietas[1].Alimentos[I].PorcUsado/100);
      KGTon := KGTon + (Dietas[1].Alimentos[I].PrecioPorTon/1000)*(Dietas[1].Alimentos[I].PorcUsado/100);
      KGTc := KGTc + (((KGConsumoTotal/cantAnimalesCompra)*(Dietas[1].Alimentos[I].PorcUsado/100))*(Dietas[1].Alimentos[I].PrecioPorTon))/1000;

      SG1.CellProperties[0,I+1].Alignment := taCenter;
      SG1.CellProperties[1,I+1].Alignment := taCenter;
      SG1.CellProperties[2,I+1].Alignment := taCenter;
      SG1.CellProperties[3,I+1].Alignment := taCenter;
      SG1.CellProperties[4,I+1].Alignment := taCenter;
      SG1.CellProperties[5,I+1].Alignment := taCenter;
    end
    else
      break;
  end;
  PrecioKG := KGTon;
  PrecioTotal := PrecioKg;

  Dietas[1].CostoNutricion := (KGConsumo/AumentoDiario)*KGTon;
  Dietas[1].CostoDieta := KGTon{*KGConsumo};

  LKGConsumoR1.Caption := FormatFloat('##.##',KGConsumo)+' Kgs.';
  LConversionR1.Caption := FormatFloat('##.##',Dietas[1].Conversion)+' Kgs.';
  LCostoNutricionR1.Caption := '$'+FormatFloat('##.##',Dietas[1].CostoNutricion);
  LAumentoAnimalR1.Caption := FormatFloat('##.##',Dietas[1].KGAumentados)+' Kgs.';
  LAumentoLoteR1.Caption := FormatFloat('##.##',Dietas[1].KGAumentadosLote)+' Kgs.';

  if PrecioTotal > 0 then
  begin
    LabelPrecioDieta.Visible := true;
    LPrecioDieta.Visible := true;
    SPrecioDieta.Visible := true;
    SPrecioDietaL.Visible := true;
    LPrecioDieta.Caption := '$'+FormatFloat('##.##',PrecioKg);
  end;
  SG1.CellProperties[0,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[1,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[2,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[3,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[4,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[5,SG1.RowCount-1].Alignment := taCenter;
  SG1.CellProperties[0,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[1,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[2,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[3,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[4,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[5,SG1.RowCount-1].FontStyle := [fsBold];

  SG1.Cells[0,SG1.RowCount-1] := 'Total';
  SG1.Cells[3,SG1.RowCount-1] := FormatFloat('##.##',T1)+' Kg';
  SG1.Cells[4,SG1.RowCount-1] := FormatFloat('##.##',T2)+' Kg';
  SG1.Cells[5,SG1.RowCount-1] := '$ '+FormatFloat('##.##',T3);
  SG1.Cells[1,SG1.RowCount-1] := '$ '+FormatFloat('##.##',T);

  totalPesos1 := T3 * DiasEncierre1;

  if DiasEncierre > 0 then
    ConsumoPorAnimal := KGRacion/DiasEncierre
  else
    ConsumoPorAnimal := 0;

  SG1.Height := 140;
end;

procedure TFSimuladorA.ArmarGrillaAlimentacion2;
var
  I : Integer;
  KGRacion, KGTc, KGTon, KGConsumo, KGConsumoTotal, T : Double;
  T1, T2, T3, Porc_ms_racion : Double;
begin
  SG2.RowCount := 2;
  KGRacion := 0;
  KGTc := 0;
  KGTon := 0;
  Peso2 := Peso1+(AumentoDiario * DiasEncierre2);

  for I := 0 to Length(Dietas[2].Alimentos)-1 do
    Porc_ms_racion := Porc_ms_racion + ((Dietas[2].Alimentos[I].PorcUsado * Dietas[2].Alimentos[I].PorcMS) / 100);

  PResultRacion2.Visible := (KGMSR2 <> 0) or (KGTCR2 <> 0) or (PorcRacion2 <> 0);
  PCompR2.Visible := (KGMSR2 <> 0) or (KGTCR2 <> 0) or (PorcRacion2 <> 0);
  TSRacion3.TabVisible := (cantidadRaciones = 3) and PCompR2.Visible;

  if (KGMSR2 <> 0) and (KGTCR2 <> 0) and (PorcRacion2 <> 0) then
  begin
    KGTCR2 := ((Peso1+Peso2)/2)*(PorcRacion2 / 100);
    EAKGMSR2.OnChange := nil;
    EAKGMSR2.Text := FormatFloat('#0.##',KGMSR2);
    EAKGMSR2.OnChange := EAKGTCR2Change;
    KGTCR2 := 0;
  end;
  if KGMSR2 = 0 then
  begin
    if PorcRacion2 = 0 then
    begin
        KGMSR2 := (KGTCR2 * Porc_ms_racion) / 100;
    end
    else
      KGMSR2 := ((Peso1+Peso2)/2)*(PorcRacion2 / 100);
    EAKGMSR2.OnChange := nil;
    EAKGMSR2.Text := FormatFloat('#0.##',KGMSR2);
    EAKGMSR2.OnChange := EAKGMSR2Change;
  end;
  if PorcRacion2 = 0 then
  begin
    if ((Peso1+Peso2)/2) > 0 then
      PorcRacion2 := (KGMSR2 * 100)/((Peso1+Peso2)/2)
    else
      PorcRacion2 := 0;
    EPorcConsumo2.OnChange := nil;
    EPorcConsumo2.Text := FormatFloat('#0.##',PorcRacion2);
    EPorcConsumo2.OnChange := EPorcConsumo2Change;
  end;
  if KGTCR2 = 0 then
  begin
    if KGMSR2> 0 then
    begin
      KGTCR2 := (KGMSR2 * 100 )/Porc_ms_racion;
    end
    else
      KGTCR2 := 0;
    EAKGTCR2.OnChange := nil;
    EAKGTCR2.Text := FormatFloat('#0.##',KGTCR2);
    EAKGTCR2.OnChange := EAKGTCR2Change;
  end;

  KGMS2 := 0;
  KGTC2 := 0;
  KGMS2 := KGMSR2 * cantAnimalesCompra * DiasEncierre2;
  KGTC2 := ((KGMSR2*100)/Porc_ms_racion) * cantAnimalesCompra * DiasEncierre2;

  KGConsumo := ((Peso2+Peso1)/2)*(PorcRacion2 / 100);
  KGConsumoTotal := KGConsumo * cantAnimalesCompra;
 
  Dietas[2].CantDias := DiasEncierre2;
  if AumentoDiario > 0 then
    Dietas[2].Conversion := KGConsumo/AumentoDiario
  else
    Dietas[2].Conversion := 0;
  Dietas[2].KGAumentados := AumentoDiario * DiasEncierre2;
  Dietas[2].KGAumentadosLote := (AumentoDiario * DiasEncierre2)*cantAnimalesCompra;
  Dietas[2].KGConsumidosPorAnimal := KGConsumo;


  CalcularDatosAlimento(2);
  T1 := 0;
  T2 := 0;
  T3 := 0;
  SG2.Cells[0,0] := 'Alimento';
  SG2.Cells[2,0] := '% Usado';
  SG2.Cells[3,0] := 'Kg MS';
  SG2.Cells[4,0] := 'Kg Tal Cual';
  SG2.Cells[5,0] := '$';
  SG2.Cells[1,0] := '$/Tn.';
  SG2.CellProperties[0,0].Alignment := taCenter;
  SG2.CellProperties[1,0].Alignment := taCenter;
  SG2.CellProperties[2,0].Alignment := taCenter;
  SG2.CellProperties[3,0].Alignment := taCenter;
  SG2.CellProperties[4,0].Alignment := taCenter;
  SG2.CellProperties[5,0].Alignment := taCenter;
  T := 0;
  for I := 0 to Length(Dietas[2].Alimentos)-1 do
  begin
    if I <= 5 then
    begin
      SG2.Cells[0,I+1] := Dietas[2].Alimentos[I].Nombre;
      SG2.Cells[2,I+1] := FormatFloat('#0.##',Dietas[2].Alimentos[I].PorcUsado)+' %';
      SG2.Cells[3,I+1] := FormatFloat('#0.##',Dietas[2].Alimentos[I].KgMs)+' Kg';
      SG2.Cells[4,I+1] := FormatFloat('#0.##',Dietas[2].Alimentos[I].KgTalCual)+' Kg';
      SG2.Cells[5,I+1] := '$ '+FormatFloat('#0.##',Dietas[2].Alimentos[I].PrecioPorKg);
      SG2.Cells[1,I+1] := '$ '+FormatFloat('#0.##',Dietas[2].Alimentos[I].PrecioPorTon);
      SG2.RowCount := SG2.RowCount + 1;
      SG2.Height := SG2.Height + 27;

      T := T + Dietas[2].Alimentos[I].PrecioPorTon;

      T1 := T1 + Dietas[2].Alimentos[I].KgMs;
      T2 := T2 + Dietas[2].Alimentos[I].KgTalCual;
      T3 := T3 + Dietas[2].Alimentos[I].PrecioPorKg;

      KGRacion := KGRacion + (KGConsumoTotal/cantAnimalesCompra)*(Dietas[2].Alimentos[I].PorcUsado/100);
      KGTon := KGTon + (Dietas[2].Alimentos[I].PrecioPorTon/1000)*(Dietas[2].Alimentos[I].PorcUsado/100);
      KGTc := KGTc + (((KGConsumoTotal/cantAnimalesCompra)*(Dietas[2].Alimentos[I].PorcUsado/100))*(Dietas[2].Alimentos[I].PrecioPorTon))/1000;

      SG2.CellProperties[0,I+1].Alignment := taCenter;
      SG2.CellProperties[1,I+1].Alignment := taCenter;
      SG2.CellProperties[2,I+1].Alignment := taCenter;
      SG2.CellProperties[3,I+1].Alignment := taCenter;
      SG2.CellProperties[4,I+1].Alignment := taCenter;
      SG2.CellProperties[5,I+1].Alignment := taCenter;
    end
    else
      break;
  end;
  PrecioKG := KGTon;
  PrecioTotal := PrecioKg;

  Dietas[2].CostoNutricion := (KGConsumo/AumentoDiario)*KGTon;
  Dietas[2].CostoDieta := KGTon{*KGConsumo};

  LKGConsumoR2.Caption := FormatFloat('##.##',KGConsumo)+' Kgs.';
  LConversionR2.Caption := FormatFloat('##.##',Dietas[2].Conversion)+' Kgs.';
  LCostoNutricionR2.Caption := '$'+FormatFloat('##.##',Dietas[2].CostoNutricion);
  LAumentoAnimalR2.Caption := FormatFloat('##.##',Dietas[2].KGAumentados)+' Kgs.';
  LAumentoLoteR2.Caption := FormatFloat('##.##',Dietas[2].KGAumentadosLote)+' Kgs.';

  if PrecioTotal > 0 then
  begin
    LabelPrecioDieta.Visible := true;
    LPrecioDieta.Visible := true;
    SPrecioDieta.Visible := true;
    SPrecioDietaL.Visible := true;
    LPrecioDieta.Caption := '$'+FormatFloat('##.##',PrecioKg);
  end;
  SG2.CellProperties[0,SG2.RowCount-1].Alignment := taCenter;
  SG2.CellProperties[1,SG2.RowCount-1].Alignment := taCenter;
  SG2.CellProperties[2,SG2.RowCount-1].Alignment := taCenter;
  SG2.CellProperties[3,SG2.RowCount-1].Alignment := taCenter;
  SG2.CellProperties[4,SG2.RowCount-1].Alignment := taCenter;
  SG2.CellProperties[5,SG2.RowCount-1].Alignment := taCenter;
  SG2.CellProperties[0,SG2.RowCount-1].FontStyle := [fsBold];
  SG2.CellProperties[1,SG2.RowCount-1].FontStyle := [fsBold];
  SG2.CellProperties[2,SG2.RowCount-1].FontStyle := [fsBold];
  SG2.CellProperties[3,SG2.RowCount-1].FontStyle := [fsBold];
  SG2.CellProperties[4,SG2.RowCount-1].FontStyle := [fsBold];
  SG2.CellProperties[5,SG2.RowCount-1].FontStyle := [fsBold];

  SG2.Cells[0,SG2.RowCount-1] := 'Total';
  SG2.Cells[3,SG2.RowCount-1] := FormatFloat('##.##',T1)+' Kg';
  SG2.Cells[4,SG2.RowCount-1] := FormatFloat('##.##',T2)+' Kg';
  SG2.Cells[5,SG2.RowCount-1] := '$ '+FormatFloat('##.##',T3);
  SG2.Cells[1,SG2.RowCount-1] := '$ '+FormatFloat('##.##',T);

  totalPesos2 := T3 * DiasEncierre2;

  if DiasEncierre > 0 then
    ConsumoPorAnimal := KGRacion/DiasEncierre2
  else
    ConsumoPorAnimal := 0;

  SG2.Height := 140;

end;

procedure TFSimuladorA.ArmarGrillaAlimentacion3;
var
  I : Integer;
  KGRacion, KGTc, KGTon, KGConsumo, KGConsumoTotal, T : Double;
  T1, T2, T3, Porc_ms_racion : Double;
begin
  SG3.RowCount := 2;
  KGRacion := 0;
  KGTc := 0;
  KGTon := 0;
  Peso3 := Peso2+(AumentoDiario * DiasEncierre3);

  for I := 0 to Length(Dietas[3].Alimentos)-1 do
    Porc_ms_racion := Porc_ms_racion + ((Dietas[3].Alimentos[I].PorcUsado * Dietas[3].Alimentos[I].PorcMS) / 100);

  PResultRacion3.Visible := (KGMSR3 <> 0) or (KGTCR3 <> 0) or (PorcRacion3 <> 0);
  PCompR3.Visible := (KGMSR3 <> 0) or (KGTCR3 <> 0) or (PorcRacion3 <> 0);

  if (KGMSR3 <> 0) and (KGTCR3 <> 0) and (PorcRacion3 <> 0) then
  begin
    KGTCR3 := ((Peso2+Peso3)/2)*(PorcRacion3 / 100);
    EAKGMSR3.OnChange := nil;
    EAKGMSR3.Text := FormatFloat('#0.##',KGMSR3);
    EAKGMSR3.OnChange := EAKGTCR3Change;
    KGTCR3 := 0;
  end;
  if KGMSR3 = 0 then
  begin
    if PorcRacion3 = 0 then
    begin
      KGMSR3 := (KGTCR3 * Porc_ms_racion) / 100;
    end
    else
      KGMSR3 := ((Peso2+Peso3)/2)*(PorcRacion3 / 100);
    EAKGMSR3.OnChange := nil;
    EAKGMSR3.Text := FormatFloat('#0.##',KGMSR3);
    EAKGMSR3.OnChange := EAKGMSR3Change;
  end;
  if PorcRacion3 = 0 then
  begin
    if ((Peso3+kgPromedioCompra)/2) > 0 then
      PorcRacion3 := (KGMSR3 * 100)/((Peso2+Peso3)/2)
    else
      PorcRacion3 := 0;
    EPorcConsumo3.OnChange := nil;
    EPorcConsumo3.Text := FormatFloat('#0.##',PorcRacion3);
    EPorcConsumo3.OnChange := EPorcConsumo3Change;
  end;
  if KGTCR3 = 0 then
  begin
    if KGMSR3> 0 then
    begin
      KGTCR3 := (KGMSR3 * 100 )/Porc_ms_racion
    end
    else
      KGTCR3 := 0;
    EAKGTCR3.OnChange := nil;
    EAKGTCR3.Text := FormatFloat('#0.##',KGTCR3);
    EAKGTCR3.OnChange := EAKGTCR3Change;
  end;

  KGMS3 := 0;
  KGTC3 := 0;
  KGMS3 := KGMSR3 * cantAnimalesCompra * DiasEncierre3;
  KGTC3 := ((KGMSR3*100)/Porc_ms_racion) * cantAnimalesCompra * DiasEncierre3;

  KGConsumo := ((Peso3+Peso2)/2)*(PorcRacion3 / 100);
  KGConsumoTotal := KGConsumo * cantAnimalesCompra;

  Dietas[3].CantDias := DiasEncierre3;
  if AumentoDiario > 0 then
    Dietas[3].Conversion := KGConsumo/AumentoDiario
  else
    Dietas[3].Conversion := 0;
  Dietas[3].KGAumentados := AumentoDiario * DiasEncierre3;
  Dietas[3].KGAumentadosLote := (AumentoDiario * DiasEncierre3)*cantAnimalesCompra;
  Dietas[3].KGConsumidosPorAnimal := KGConsumo;


  CalcularDatosAlimento(3);

  SG3.Cells[0,0] := 'Alimento';
  SG3.Cells[2,0] := '% Usado';
  SG3.Cells[3,0] := 'Kg MS';
  SG3.Cells[4,0] := 'Kg Tal Cual';
  SG3.Cells[5,0] := '$';
  SG3.Cells[1,0] := '$/Tn.';
  SG3.CellProperties[0,0].Alignment := taCenter;
  SG3.CellProperties[1,0].Alignment := taCenter;
  SG3.CellProperties[2,0].Alignment := taCenter;
  SG3.CellProperties[3,0].Alignment := taCenter;
  SG3.CellProperties[4,0].Alignment := taCenter;
  SG3.CellProperties[5,0].Alignment := taCenter;
  T := 0;
  T1 := 0;
  T2 := 0;
  T3 := 0;
  for I := 0 to Length(Dietas[3].Alimentos)-1 do
  begin
    if I <= 5 then
    begin
      SG3.Cells[0,I+1] := Dietas[3].Alimentos[I].Nombre;
      SG3.Cells[2,I+1] := FormatFloat('#0.##',Dietas[3].Alimentos[I].PorcUsado)+' %';
      SG3.Cells[3,I+1] := FormatFloat('#0.##',Dietas[3].Alimentos[I].KgMs)+' Kg';
      SG3.Cells[4,I+1] := FormatFloat('#0.##',Dietas[3].Alimentos[I].KgTalCual)+' Kg';
      SG3.Cells[5,I+1] := '$ '+FormatFloat('#0.##',Dietas[3].Alimentos[I].PrecioPorKg);
      SG3.Cells[1,I+1] := '$ '+FormatFloat('#0.##',Dietas[3].Alimentos[I].PrecioPorTon);
      SG3.RowCount := SG3.RowCount + 1;
      SG3.Height := SG3.Height + 27;

      T := T + Dietas[2].Alimentos[I].PrecioPorTon;

      T1 := T1 + Dietas[3].Alimentos[I].KgMs;
      T2 := T2 + Dietas[3].Alimentos[I].KgTalCual;
      T3 := T3 + Dietas[3].Alimentos[I].PrecioPorKg;

      KGRacion := KGRacion + (KGConsumoTotal/cantAnimalesCompra)*(Dietas[3].Alimentos[I].PorcUsado/100);
      KGTon := KGTon + (Dietas[3].Alimentos[I].PrecioPorTon/1000)*(Dietas[3].Alimentos[I].PorcUsado/100);
      KGTc := KGTc + (((KGConsumoTotal/cantAnimalesCompra)*(Dietas[3].Alimentos[I].PorcUsado/100))*(Dietas[3].Alimentos[I].PrecioPorTon))/1000;

      SG3.CellProperties[0,I+1].Alignment := taCenter;
      SG3.CellProperties[1,I+1].Alignment := taCenter;
      SG3.CellProperties[2,I+1].Alignment := taCenter;
      SG3.CellProperties[3,I+1].Alignment := taCenter;
      SG3.CellProperties[4,I+1].Alignment := taCenter;
      SG3.CellProperties[5,I+1].Alignment := taCenter;
    end
    else
      break;
  end;
  PrecioKG := KGTon;
  PrecioTotal := PrecioKg;

  Dietas[3].CostoNutricion := (KGConsumo/AumentoDiario)*KGTon;
  Dietas[3].CostoDieta := KGTon{*KGConsumo};

  LKGConsumoR3.Caption := FormatFloat('##.##',KGConsumo)+' Kgs.';
  LConversionR3.Caption := FormatFloat('##.##',Dietas[3].Conversion)+' Kgs.';
  LCostoNutricionR3.Caption := '$'+FormatFloat('##.##',Dietas[3].CostoNutricion);
  LAumentoAnimalR3.Caption := FormatFloat('##.##',Dietas[3].KGAumentados)+' Kgs.';
  LAumentoLoteR3.Caption := FormatFloat('##.##',Dietas[3].KGAumentadosLote)+' Kgs.';

  if PrecioTotal > 0 then
  begin
    LabelPrecioDieta.Visible := true;
    LPrecioDieta.Visible := true;
    SPrecioDieta.Visible := true;
    SPrecioDietaL.Visible := true;
    LPrecioDieta.Caption := '$'+FormatFloat('##.##',PrecioKg);
  end;
  SG3.CellProperties[0,SG3.RowCount-1].Alignment := taCenter;
  SG3.CellProperties[1,SG3.RowCount-1].Alignment := taCenter;
  SG3.CellProperties[2,SG3.RowCount-1].Alignment := taCenter;
  SG3.CellProperties[3,SG3.RowCount-1].Alignment := taCenter;
  SG3.CellProperties[4,SG3.RowCount-1].Alignment := taCenter;
  SG3.CellProperties[5,SG3.RowCount-1].Alignment := taCenter;
  SG3.CellProperties[0,SG3.RowCount-1].FontStyle := [fsBold];
  SG3.CellProperties[1,SG3.RowCount-1].FontStyle := [fsBold];
  SG3.CellProperties[2,SG3.RowCount-1].FontStyle := [fsBold];
  SG3.CellProperties[3,SG3.RowCount-1].FontStyle := [fsBold];
  SG3.CellProperties[4,SG3.RowCount-1].FontStyle := [fsBold];
  SG3.CellProperties[5,SG3.RowCount-1].FontStyle := [fsBold];

  SG3.Cells[0,SG3.RowCount-1] := 'Total';
  SG3.Cells[3,SG3.RowCount-1] := FormatFloat('##.##',T1)+' Kg';
  SG3.Cells[4,SG3.RowCount-1] := FormatFloat('##.##',T2)+' Kg';
  SG3.Cells[5,SG3.RowCount-1] := '$ '+FormatFloat('##.##',T3);
  SG3.Cells[1,SG3.RowCount-1] := '$ '+FormatFloat('##.##',T);

  totalPesos3 := T3 * DiasEncierre3;

  if DiasEncierre3 > 0 then
    ConsumoPorAnimal := KGRacion/DiasEncierre3
  else
    ConsumoPorAnimal := 0;

  SG3.Height := 140;
end;

procedure TFSimuladorA.CalcularDieta(Tab : Integer);
var
  I, Cont : Integer;
begin
  kgPromedioVenta := kgPromedioCompra;
  for I := 1 to 3 do
    kgPromedioVenta := kgPromedioVenta + Dietas[I].KGAumentados;

  LKGPromVenta.Caption := FormatFloat('#0.##',kgPromedioVenta)+' Kgs.';

  DiasEncierre := 0;
  for I := 1 to 3 do
    DiasEncierre := DiasEncierre + Dietas[I].CantDias;

  ConsumoPorAnimal := 0;
  Cont := 0;
  for I := 1 to 3 do
  begin
    ConsumoPorAnimal := ConsumoPorAnimal + Dietas[I].KGConsumidosPorAnimal;
    if Dietas[I].KGConsumidosPorAnimal > 0 then
      Cont := Cont+1;
  end;
  if Cont > 0 then
    ConsumoPorAnimal := ConsumoPorAnimal / Cont;

  PrecioTotal := 0;
  Cont := 0;
  for I := 1 to 3 do
  begin
    PrecioTotal := PrecioTotal + Dietas[I].CostoDieta;
    if Dietas[I].CostoDieta > 0 then
      Cont := Cont + 1;
  end;
  if Cont > 0 then
    PrecioTotal := PrecioTotal / Cont;

  ConvAlimenticia := 0;
  Cont := 0;
  for I := 1 to 3 do
  begin
    ConvAlimenticia := ConvAlimenticia + Dietas[I].Conversion;
    if Dietas[I].Conversion > 0 then
      Cont := Cont+1;
  end;
  ConvAlimenticia := ConvAlimenticia / Cont;

  CostoNutricion := 0;
  Cont := 0;
  for I := 1 to 3 do
  begin
    CostoNutricion := CostoNutricion + Dietas[I].CostoNutricion;
    if Dietas[I].CostoNutricion > 0 then
      Cont := Cont+1;
  end;
  CostoNutricion := CostoNutricion / Cont;

end;

procedure TFSimuladorA.RealizarCalculosProductivos;
var
  v1,v2,v3,v4,v5 : Double;
  t1,t2,t3,t4,t5,t6,t7, t8,t9 : Double;
begin
  DiasEncierre := DiasEncierre1+DiasEncierre2+DiasEncierre3;
  CalcularDieta(0);
  v1 := kgPromedioVenta - kgPromedioCompra;
  if v1 <> 0 then
  begin
    LKgAumentados.Visible := true;
    SKgAAnimal.Visible := true;
    LabelKgAuemntadoAnimal.Visible := true;
    SKgAAnimalL.Visible := true;
    LKgAumentados.Caption := FormatFloat('#0.##',v1)+' Kgs';
  end
  else
    LKgAumentados.Caption := '';
  v2 := v1 * cantAnimalesCompra;
  if v2 <> 0 then
  begin
    LKgAumentoLote.Visible := true;
    SKgALote.Visible := true;
    LabelKgAumentadoLote.Visible := true;
    SKGALoteL.Visible := true;
    LKgAumentoLote.Caption := FormatFloat('#0.##',v2)+' Kgs';
  end
  else
    LKgAumentoLote.Caption := '';

  if DiasEncierre > 0 then
    v3 := v1 / DiasEncierre
  else
    v3 := 0;
  if v3 <> 0 then
  begin

    LConversion.Visible := true;
    LabelConversion.Visible := true;
    SConversion.Visible := true;
    SLabelConversion.Visible := true;
    LConversion.Caption := FormatFloat('#0.##',ConsumoPorAnimal/v3);
    ConvAlimenticia := ConsumoPorAnimal/v3;
  end
  else
  begin
    LConversion.Caption := '';
  end;

  //if CantTotal > 0 then
  v4 := PrecioTotal;// / CantTotal
  {else
    v4 := 0;}
  if v4 <> 0 then
  begin
    LPrecioDieta.Visible := true;
    SPrecioDieta.Visible := true;
    LabelPrecioDieta.Visible := true;
    SPrecioDietaL.Visible := true;
    LPrecioDieta.Caption := FormatFloat('#0.##',DiasEncierre)+' dias';

  end
  else
    LPrecioDieta.Caption := '';

  v5 := CostoNutricion;
  if v5 <> 0 then
  begin
    LCostoNutricion.Visible := true;
    SCostoNutricion.Visible := true;
    SCostoNutricionL.Visible := true;
    LabelCostoNutricion.Visible := true;
    LCostoNutricion.Caption := '$'+FormatFloat('#0.##',v5);
  end
  else
    LCostoNutricion.Caption := '';

  if v1 > 0 then
    t1 := (((ManoObra*DiasEncierre)/v1) + (CostoSanitario/v1) + v5) + (CostoHoteleria* AumentoDiario {cantAnimalesVenta}*DiasEncierre)
  else
    t1 := v5;
  if t1 <> 0 then
    LCostoTotalKg.Caption := '$'+FormatFloat('#0.##',t1)
  else
    LCostoTotalKg.Caption := '';

  t2 := t1 * v1;
  if t2 <> 0 then
    LCostoTotalAnim.Caption := '$'+FormatFloat('#0.##',t2)
  else
    LCostoTotalAnim.Caption := '';

  if DiasEncierre > 0 then
    t3 := t2 / DiasEncierre
  else
    t3 := 0;
  if t3 <> 0 then
    LCostoDiario.Caption := '$'+FormatFloat('#0.##',t3)
  else
    LCostoDiario.Caption := '';

  t4 := (precioVenta - precioCompra) * kgPromedioCompra;
  if t4 <> 0 then
    LCambioCateg.Caption := '$'+FormatFloat('#0.##',t4)
  else
    LCambioCateg.Caption := '';

  t5 := v1 * (precioVenta - t1);
  if t5 <> 0 then
    LUtilNutricion.Caption := '$'+FormatFloat('#0.##',t5)
  else
    LUtilNutricion.Caption := '';

  t6 := TotalPorAnimalVenta - TotalPorAnimalCompra - t2;
  if t6 <> 0 then
    LUtilidadAnimal.Caption := '$'+FormatFloat('#0.##',t6)
  else
    LUtilidadAnimal.Caption := '';

  t7 := t6 * cantAnimalesVenta;
  if t7 <> 0 then
    LUtilLote.Caption := '$'+FormatFloat('#0.##',t7)
  else
    LUtilLote.Caption := '';

  t8 := t6 / (t2+TotalPorAnimalCompra);
  if t8 <> 0 then
    LRentaCiclo.Caption := FormatFloat('#0.##',t8*100)+' %'
  else
    LRentaCiclo.Caption := '';

  if DiasEncierre > 0 then
    t9 := (t8 / DiasEncierre)*30.5
  else
    t9 := 0;
  if t9 <> 0 then
    LRentaMensual.Caption := FormatFloat('#0.##',t9*100)+' %'
  else
    LRentaMensual.Caption := '';

  MSTotal := 0;
  if MS1 > 0 then
    if MS2 > 0 then
      if MS3 > 0 then
        MSTotal := (MS1+MS2+MS3)///3
      else
        MSTotal := (MS1+MS2)///2
    else
      MSTotal := MS1
  else
    MSTotal := 0;

  KGMSTotal := 0;
  if KGMS1 > 0 then
    if KGMS2 > 0 then
      if KGMS3 > 0 then
        KGMSTotal := (KGMS1+KGMS2+KGMS3)///3
      else
        KGMSTotal := (KGMS1+KGMS2)///2
    else
      KGMSTotal := KGMS1
  else
    KGMSTotal := 0;

  KGTCTotal := 0;
  if KGTC1 > 0 then
    if KGTC2 > 0 then
      if KGTC3 > 0 then
        KGTCTotal := (KGTC1+KGTC2+KGTC3)///3
      else
        KGTCTotal := (KGTC1+KGTC2)///2
    else
      KGTCTotal := KGTC1
  else
    KGTCTotal := 0;

end;

procedure TFSimuladorA.EDiasEncierre1Change(Sender: TObject);
var
  I : Integer;
begin
  inherited;
  if TryStrToInt(EDiasEncierre1.Text,I) then
  begin
    DiasEncierre1 := I;
    //LSelRacion1.Visible := (I > 0) and (PorcRacion1 > 0);
    //DBLCBATipoSuplementacion1.Visible := (I > 0) and (PorcRacion1 > 0);
    //SG1.Visible := (I > 0) and (PorcRacion1 > 0);
    //PCantR1.Visible := true;
    ArmarGrillaAlimentacion1;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EManoObraDiariaChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EManoObraDiaria.Text,I) then
  begin
    ManoObra := I;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.ECostoSaniAnimalChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(ECostoSaniAnimal.Text,I) then
  begin
    CostoSanitario := I;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EConvAlimenticiaChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EConvAlimenticia.Text,I) then
  begin
    ConvAlimenticia := I;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.ICancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFSimuladorA.LSelRacionClick(Sender: TObject);
begin
  inherited;
  FPrincipal.AbrirFormNormal(TFRacion.Create(self));
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  DBLCBATipoSuplementacion1.KeyValue := IBQRaciones.FieldValues['id_racion'];
  DBLCBATipoSuplementacion1CloseUp(DBLCBATipoSuplementacion1);
end;

procedure TFSimuladorA.LSelRacionMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= $00606C02;
    (Sender as TLabel).Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFSimuladorA.LSelRacionMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    (Sender as TLabel).Font.Color:= clWindowText;
    (Sender as TLabel).Font.Style:= [fsUnderline];
  end;
end;

procedure TFSimuladorA.JvSiguienteClick(Sender: TObject);
begin
  inherited;

  JvSiguiente.Visible := PCSimulador.TabIndex < 3;
  JvAnteriror.Visible := PCSimulador.TabIndex > 0;
  LBBAnterior.Visible := JvAnteriror.Visible;
  LBBSiguiente.Visible := JvSiguiente.Visible;
  if PCSimulador.ActivePage = TSRacion then
  begin
    if (PCRaciones.Visible) and (PCRaciones.TabIndex < (cantidadRaciones-1)) then
      PCRaciones.TabIndex := PCRaciones.TabIndex + 1
    else
    begin
      PCSimulador.TabIndex := PCSimulador.TabIndex + 1;
      PCSimuladorChange(nil);
    end;
  end
  else
  begin
    PCSimulador.TabIndex := PCSimulador.TabIndex + 1;
    PCSimuladorChange(nil);
  end;
end;

procedure TFSimuladorA.JvAnterirorClick(Sender: TObject);
begin
  inherited;

  JvAnteriror.Visible := PCSimulador.TabIndex > 0;
  JvSiguiente.Visible := PCSimulador.TabIndex < 3;
  LBBAnterior.Visible := JvAnteriror.Visible;
  LBBSiguiente.Visible := JvSiguiente.Visible;
  if PCSimulador.ActivePage = TSRacion then
  begin
    if (PCRaciones.Visible) and (PCRaciones.TabIndex >0) then
      PCRaciones.TabIndex := PCRaciones.TabIndex - 1
    else
    begin
      PCSimulador.TabIndex := PCSimulador.TabIndex - 1;
      PCSimuladorChange(nil);
    end;
  end
  else
  begin
    PCSimulador.TabIndex := PCSimulador.TabIndex - 1;
    PCSimuladorChange(nil);
  end;
end;

procedure TFSimuladorA.PCSimuladorChange(Sender: TObject);
begin
  inherited;
  JvAnteriror.Visible := PCSimulador.TabIndex > 0;
  JvSiguiente.Visible := PCSimulador.TabIndex < 3;
  LBBAnterior.Visible := JvAnteriror.Visible;
  LBBSiguiente.Visible := JvSiguiente.Visible;

  TSCompraVenta.ImageIndex := 4;
  TSRacion.ImageIndex := 5;
  TSDatosP.ImageIndex := 6;
  TSConclusion.ImageIndex := 7;
  if PCSimulador.ActivePage = TSCompraVenta then
  begin
    TSCompraVenta.ImageIndex := 0;
    ECantAnimales.SetFocus;
  end;
  if PCSimulador.ActivePage = TSRacion then
  begin
    TSRacion.ImageIndex := 1;
    //JvEAumentoDiario.SetFocus;
    if not PTopRacion.Visible then
      JvEdit1.SetFocus;
  end;
  if PCSimulador.ActivePage = TSDatosP then
  begin
    TSDatosP.ImageIndex := 2;
    ECantAnimalesVenta.SetFocus;
  end;
  if PCSimulador.ActivePage = TSConclusion then
  begin
    TSConclusion.ImageIndex := 3;
    EManoObraDiaria.SetFocus;
  end;
end;

procedure TFSimuladorA.ArmarTabla(var F : TFREPSimulPrev);
var
  NextTL, NextTS : Integer;
  I : Integer;
begin
  NextTL := 10;
  NextTS := 10;
  I := 1;
  for I := 1 to SG1.RowCount do
  begin
    with (TQRShape(F.QRBand6.AddPrintable(TQRShape))) do
    begin
      Top := NextTS;
      Left := 8;
      Width := 185;
      Height := 21;
    end;
    with (TQRLabel(F.QRBand6.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      Transparent := true;
      Alignment := taCenter;
      Top := NextTL;
      Left := 14;
      Width := 173;
      Font.Size := 8;
      Caption :=SG1.Cells[0,I];
    end;

    with (TQRShape(F.QRBand6.AddPrintable(TQRShape))) do
    begin
      Top := NextTS;
      Left := 192;
      Width := 129;
      Height := 21;
    end;
    with (TQRLabel(F.QRBand6.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      Transparent := true;
      Alignment := taCenter;
      Top := NextTL;
      Left := 198;
      Width := 118;
      Font.Size := 8;
      Caption :=SG1.Cells[1,I];
    end;

    with (TQRShape(F.QRBand6.AddPrintable(TQRShape))) do
    begin
      Top := NextTS;
      Left := 320;
      Width := 121;
      Height := 21;
    end;
    with (TQRLabel(F.QRBand6.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      Transparent := true;
      Alignment := taCenter;
      Top := NextTL;
      Left := 326;
      Width := 110;
      Font.Size := 8;
      Caption :=SG1.Cells[2,I];
    end;

    with (TQRShape(F.QRBand6.AddPrintable(TQRShape))) do
    begin
      Top := NextTS;
      Left := 440;
      Width := 113;
      Height := 21;
    end;
    with (TQRLabel(F.QRBand6.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      Transparent := true;
      Alignment := taCenter;
      Top := NextTL;
      Left := 446;
      Width := 101;
      Font.Size := 8;
      Caption :=SG1.Cells[3,I];
    end;

    with (TQRShape(F.QRBand6.AddPrintable(TQRShape))) do
    begin
      Top := NextTS;
      Left := 552;
      Width := 113;
      Height := 21;
    end;
    with (TQRLabel(F.QRBand6.AddPrintable(TQRLabel))) do
    begin
      AutoSize := false;
      Transparent := true;
      Alignment := taCenter;
      Top := NextTL;
      Left := 558;
      Width := 103;
      Font.Size := 8;
      Caption :=SG1.Cells[3,I];
    end;

    NextTL := NextTL+20;
    NextTS := NextTS+20;

  end;
end;

procedure TFSimuladorA.Button1Click(Sender: TObject);
var
  F : TFREPSimulPrev;
begin
  inherited;
  F := TFREPSimulPrev.Create(self);

  F.QRLIngreso1.Caption := 'Ingresaron '+IntToStr(cantAnimalesCompra)+' cabezas';
  F.QRLIngresado.Caption := FormatFloat('#0.##',kgPromedioCompra*cantAnimalesCompra)+' Kg.';
  F.QRLPromIng.Caption := FormatFloat('#0.##',kgPromedioCompra)+' Kg.';
  F.QRLKgAumentado.Caption := LKgAumentoLote.Caption;
  F.QRLAumentoPromedio.Caption := LKgAumentados.Caption;
  F.QRLAumentoDiario.Caption := JvEAumentoDiario.Text + 'Kg.';
  F.QRLConsumoTotalTC.Caption := FormatFloat('#0.##',KGTCTotal)+' Kg.';
  F.QRLConsumoTotalMS.Caption := FormatFloat('#0.##',KGMSTotal)+' Kg.';
  F.QRLConsumoDiarioCabMS.Caption := FormatFloat('#0.##',(KGMSTotal/cantAnimalesCompra)/DiasEncierre)+' Kg.';
  F.QRLConsumoDiarioCabTC.Caption := FormatFloat('#0.##',(KGTCTotal/cantAnimalesCompra)/DiasEncierre)+' Kg.';
  F.QRLConsumoDiario.Caption := FormatFloat('#0.##',KGMSTotal/DiasEncierre)+' Kg.';
  F.QRLConversion.Caption := LConversion.Caption;
  F.QRLPrecioAlimMT.Caption := '$'+FormatFloat('#0.##',(totalPesos1+totalPesos2+totalPesos3)/(DiasEncierre1+DiasEncierre2+DiasEncierre3));
  F.QRLKGSalidos.Caption := FormatFloat('#0.##',kgPromedioVenta*cantAnimalesVenta)+' Kg.';
  F.QRLKGPromSalidos.Caption := FormatFloat('#0.##',kgPromedioVenta)+' Kg.';
  F.QRLAnimalesSalidos.Caption := IntToStr(cantAnimalesVenta);
  F.QRLDiasProm.Caption := LPrecioDieta.Caption;

  F.QRLCostoAliAnimal.Caption := '$'+FormatFloat('#0.##',(totalPesos1+totalPesos2+totalPesos3)/cantAnimalesVenta);
  F.QRLCostoHotelAni.Caption := '$'+FormatFloat('#0.##',CostoHoteleria*DiasEncierre);
  F.QRLCostoSaniAni.Caption := '$'+FormatFloat('#0.##',CostoSanitario);
  F.QRLCostoTotaAni.Caption := '$'+FormatFloat('#0.##',((totalPesos1+totalPesos2+totalPesos3)/cantAnimalesVenta)+(CostoHoteleria*DiasEncierre)+CostoSanitario);

  F.QRLValorHoteleria.Caption := '$'+FormatFloat('#0.##',CostoHoteleria);
  F.QRLCabingHotel.Caption := FormatFloat('#0.##',cantAnimalesCompra);
  F.QRLDiasHotel.Caption := FormatFloat('#0.##',DiasEncierre);
  F.QRLTotalHotel.Caption := '$'+FormatFloat('#0.##',CostoHoteleria*cantAnimalesVenta*DiasEncierre);

 // F.QRLUtilidadCab.Caption := '$'+FormatFloat('#0.##',valorventaporanimal - ((CostoNutricion*cantAnimalesCompra+(CostoHoteleria*DiasEncierre)+CostoNutricion) + valorcompraporanimal));
 // F.QRLUtilidadLote.Caption := '$'+FormatFloat('#0.##',(valorventaporanimal - ((CostoNutricion*cantAnimalesCompra+(CostoHoteleria*DiasEncierre)+CostoNutricion) + valorcompraporanimal))*cantAnimalesVenta);

  F.QRLUtilidadCab.Caption := '$'+FormatFloat('#0.##',valorventaporanimal - (((totalPesos1+totalPesos2+totalPesos3)/cantAnimalesVenta)+(CostoHoteleria * DiasEncierre) + CostoSanitario + valorcompraporanimal ));
  F.QRLUtilidadLote.Caption := '$'+FormatFloat('#0.##',(valorventaporanimal - (((totalPesos1+totalPesos2+totalPesos3)/cantAnimalesVenta)+(CostoHoteleria * DiasEncierre) + CostoSanitario + valorcompraporanimal))* cantAnimalesVenta);



  F.QRLPrecioCabCompra.Caption := LPrecioAnimal.Caption;
  F.QRLprecioCabVenta.Caption := LPrecioAnimalVenta.Caption;
  F.QRLComisionCabCompra.Caption := LComisionAnimal.Caption;
  F.QRLComisionCabVenta.Caption := LComisionAnimalVenta.Caption;
  f.QRLFleteCabCompra.Caption := LFelteAnimal.Caption;
  F.QRLFleteCabVenta.Caption := LFleteAnimalVenta.Caption;
  F.QRLGuiaCabCompra.Caption := LGuiaAnimal.Caption;
  F.QRLGuiaCabVenta.Caption := LGuiaAnimalVenta.Caption;
  F.QRLTotalCabCompra.Caption := FormatFloat('$#0.00',valorcompraporanimal);
  F.QRLTotalCabVenta.Caption := FormatFloat('$#0.00',valorventaporanimal);

  ArmarTabla(F);

  F.ShowModal;
  F.Destroy;
end;

procedure TFSimuladorA.IPreviewClick(Sender: TObject);
begin
  inherited;
  Button1.Click;
end;

procedure TFSimuladorA.FormShow(Sender: TObject);
begin
  inherited;
  ECantAnimales.SetFocus;
  cantidadRaciones := 0;
end;

procedure TFSimuladorA.JvEAumentoDiarioChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(JvEAumentoDiario.Text, I) then
  begin
    AumentoDiario := I;
    
    ArmarGrillaAlimentacion1;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EDiasEncierre2Change(Sender: TObject);
var
  I : Integer;
begin
  inherited;
  if TryStrToInt(EDiasEncierre2.Text,I) then
  begin
    DiasEncierre2 := I;
    //LSelRacion2.Visible := (I > 0) and (PorcRacion2 > 0);
    //DBLCBATipoSuplementacion2.Visible := (I > 0) and (PorcRacion2 > 0);
    //SG2.Visible := (I > 0) and (PorcRacion2 > 0);
    //PCantR2.Visible := true;
    ArmarGrillaAlimentacion2;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EDiasEncierre3Change(Sender: TObject);
var
  I : Integer;
begin
  inherited;
  if TryStrToInt(EDiasEncierre3.Text,I) then
  begin
    DiasEncierre3 := I;
    //LSelRacion3.Visible := (I > 0) and (PorcRacion3 > 0);
    //DBLCBATipoSuplementacion3.Visible := (I > 0) and (PorcRacion3 > 0);
    //SG3.Visible := (I > 0) and (PorcRacion3 > 0);
    //PCantR3.Visible := true;
    ArmarGrillaAlimentacion3;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EPorcConsumo1Change(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EPorcConsumo1.Text,I) then
  begin
    PorcRacion1 := I;
    KGMSR1 := 0;
    KGTCR1 := 0;
    //LSelRacion1.Visible := (I > 0) and (DiasEncierre1 > 0);
    //DBLCBATipoSuplementacion1.Visible := (I > 0) and (DiasEncierre1 > 0);
    ArmarGrillaAlimentacion1;
    RealizarCalculosProductivos;
  end;
end;


procedure TFSimuladorA.EPorcConsumo2Change(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EPorcConsumo2.Text,I) then
  begin
    PorcRacion2 := I;
    KGMSR2 := 0;
    KGTCR2 := 0;
    //LSelRacion2.Visible := (I > 0) and (DiasEncierre2 > 0);
    //DBLCBATipoSuplementacion2.Visible := (I > 0) and (DiasEncierre2 > 0);
    ArmarGrillaAlimentacion2;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EPorcConsumo3Change(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EPorcConsumo3.Text,I) then
  begin
    PorcRacion3 := I;
    KGMSR3 := 0;
    KGTCR3 := 0;
    //LSelRacion3.Visible := (I > 0) and (DiasEncierre3 > 0);
    //DBLCBATipoSuplementacion3.Visible := (I > 0) and (DiasEncierre3 > 0);
    ArmarGrillaAlimentacion3;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EAKGMSR1Change(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EAKGMSR1.Text,I) then
  begin
    KGMSR1 := I;
    PorcRacion1 := 0;
    KGTCR1 := 0;
    //LSelRacion1.Visible := (I > 0) and (DiasEncierre1 > 0);
    //DBLCBATipoSuplementacion1.Visible := (I > 0) and (DiasEncierre1 > 0);
    ArmarGrillaAlimentacion1;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EAKGTCR1Change(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EAKGTCR1.Text,I) then
  begin
    KGTCR1 := I;
    KGMSR1 := 0;
    PorcRacion1 := 0;
    //LSelRacion1.Visible := (I > 0) and (DiasEncierre1 > 0);
    //DBLCBATipoSuplementacion1.Visible := (I > 0) and (DiasEncierre1 > 0);
    ArmarGrillaAlimentacion1;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EAKGMSR2Change(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EAKGMSR2.Text,I) then
  begin
    KGMSR2 := I;
    PorcRacion2 := 0;
    KGTCR2 := 0;
    //LSelRacion2.Visible := (I > 0) and (DiasEncierre2 > 0);
    //DBLCBATipoSuplementacion2.Visible := (I > 0) and (DiasEncierre2 > 0);
    ArmarGrillaAlimentacion2;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EAKGTCR2Change(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EAKGTCR2.Text,I) then
  begin
    KGTCR2 := I;
    KGMSR2 := 0;
    PorcRacion2 := 0;
    //LSelRacion2.Visible := (I > 0) and (DiasEncierre2 > 0);
    //DBLCBATipoSuplementacion2.Visible := (I > 0) and (DiasEncierre2 > 0);
    ArmarGrillaAlimentacion2;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EAKGMSR3Change(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EAKGMSR3.Text,I) then
  begin
    KGMSR3 := I;
    PorcRacion3 := 0;
    KGTCR3 := 0;
    //LSelRacion3.Visible := (I > 0) and (DiasEncierre3 > 0);
    //DBLCBATipoSuplementacion3.Visible := (I > 0) and (DiasEncierre3 > 0);
    ArmarGrillaAlimentacion3;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.EAKGTCR3Change(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EAKGTCR3.Text,I) then
  begin
    KGTCR3 := I;
    KGMSR3 := 0;
    PorcRacion3 := 0;
    //LSelRacion3.Visible := (I > 0) and (DiasEncierre3 > 0);
    //DBLCBATipoSuplementacion3.Visible := (I > 0) and (DiasEncierre3 > 0);
    ArmarGrillaAlimentacion3;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.CalculosAlimentacion;
begin
  ArmarGrillaAlimentacion1;
  ArmarGrillaAlimentacion2;
  ArmarGrillaAlimentacion3;
  RealizarCalculosProductivos;
end;

procedure TFSimuladorA.ECostoHoteleriaChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(ECostoHoteleria.Text,I) then
  begin
    CostoHoteleria := I;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimuladorA.JvECantRacionesChange(Sender: TObject);
begin
  inherited;
  if TryStrToInt(JvECantRaciones.Text, cantidadRaciones) then
  begin
    PCRaciones.Visible := (kgPromedioCompra > 0) and (cantidadRaciones > 0) and (cantidadRaciones < 4) and PTopRacion.Visible;
    if PCRaciones.Visible then
    begin
      {TSRacion1.TabVisible := (I = 1) or (I = 2) or (I = 3);
      TSRacion2.TabVisible := (I = 2) or (I = 3);
      TSRacion3.TabVisible := (I = 3);}
      PCRaciones.Align := alClient;
      CalculosAlimentacion;
      RealizarCalculosCompra;
    end
    else
      if PTopRacion.Visible then
        MostrarMensaje(tmInformacion,'La cantidad de raciones debe ser entre 1 y 3');
  end;
end;

procedure TFSimuladorA.JvEdit1Change(Sender: TObject);
begin
  inherited;
  JvEAumentoDiario.Text := JvEdit1.Text;
end;

procedure TFSimuladorA.JvEdit2Change(Sender: TObject);
begin
  inherited;
  JvECantRaciones.Text := JvEdit2.Text;
end;

procedure TFSimuladorA.Image8Click(Sender: TObject);
begin
  inherited;
  PAlimentacionGral.Visible := false;
  PTopRacion.Visible := true;
  JvECantRacionesChange(nil);
end;

procedure TFSimuladorA.DBLookupComboBoxAuto1CloseUp(Sender: TObject);
begin
  inherited;
  DBLCBATipoSuplementacion1.KeyValue := DBLookupComboBoxAuto1.KeyValue;
  DBLCBATipoSuplementacion1CloseUp(DBLCBATipoSuplementacion1);
end;

procedure TFSimuladorA.JvEdit3Change(Sender: TObject);
begin
  inherited;
  EDiasEncierre1.Text := JvEdit3.Text;
  EDiasEncierre1Change(EDiasEncierre1);
end;

procedure TFSimuladorA.Image13Click(Sender: TObject);
begin
  inherited;
  PRacion1.Visible := false;
  PTopR1.Visible := true;
  PCantR1.Visible := true;
  EAKGMSR1.SetFocus;
end;

procedure TFSimuladorA.DBLookupComboBoxAuto2CloseUp(Sender: TObject);
begin
  inherited;
  DBLCBATipoSuplementacion2.KeyValue := DBLookupComboBoxAuto2.KeyValue;
  DBLCBATipoSuplementacion2CloseUp(DBLCBATipoSuplementacion2);
end;

procedure TFSimuladorA.JvEdit4Change(Sender: TObject);
begin
  inherited;
  EDiasEncierre2.Text := JvEdit4.Text;
  EDiasEncierre2Change(EDiasEncierre2);
end;

procedure TFSimuladorA.Image11Click(Sender: TObject);
begin
  inherited;
  PRacion2.Visible := false;
  PTopR2.Visible := true;
  PCantR2.Visible := true;
  EAKGMSR2.SetFocus;
end;

procedure TFSimuladorA.DBLookupComboBoxAuto3CloseUp(Sender: TObject);
begin
  inherited;
  DBLCBATipoSuplementacion3.KeyValue := DBLookupComboBoxAuto3.KeyValue;
  DBLCBATipoSuplementacion3CloseUp(DBLCBATipoSuplementacion3);
end;

procedure TFSimuladorA.JvEdit5Change(Sender: TObject);
begin
  inherited;
  EDiasEncierre3.Text := JvEdit5.Text;
  EDiasEncierre3Change(EDiasEncierre3);
end;

procedure TFSimuladorA.Image6Click(Sender: TObject);
begin
  inherited;
  PRacion3.Visible := false;
  PTopR3.Visible := true;
  PCantR3.Visible := true;
  EAKGMSR3.SetFocus;
end;

procedure TFSimuladorA.LSelRacion2Click(Sender: TObject);
begin
  inherited;
  FPrincipal.AbrirFormNormal(TFRacion.Create(self));
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  DBLCBATipoSuplementacion2.KeyValue := IBQRaciones.FieldValues['id_racion'];
  DBLCBATipoSuplementacion2CloseUp(DBLCBATipoSuplementacion2);
end;

procedure TFSimuladorA.LSelRacion3Click(Sender: TObject);
begin
  inherited;
  FPrincipal.AbrirFormNormal(TFRacion.Create(self));
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  DBLCBATipoSuplementacion3.KeyValue := IBQRaciones.FieldValues['id_racion'];
  DBLCBATipoSuplementacion3CloseUp(DBLCBATipoSuplementacion3);
end;

procedure TFSimuladorA.Label56Click(Sender: TObject);
begin
  inherited;
  FPrincipal.AbrirFormNormal(TFRacion.Create(self));
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  DBLookupComboBoxAuto1.KeyValue := IBQRaciones.FieldValues['id_racion'];
  DBLookupComboBoxAuto1CloseUp(DBLookupComboBoxAuto1);
end;

procedure TFSimuladorA.Label68Click(Sender: TObject);
begin
  inherited;
  FPrincipal.AbrirFormNormal(TFRacion.Create(self));
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  DBLookupComboBoxAuto2.KeyValue := IBQRaciones.FieldValues['id_racion'];
  DBLookupComboBoxAuto2CloseUp(DBLookupComboBoxAuto2);
end;

procedure TFSimuladorA.Label71Click(Sender: TObject);
begin
  inherited;
  FPrincipal.AbrirFormNormal(TFRacion.Create(self));
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  DBLookupComboBoxAuto3.KeyValue := IBQRaciones.FieldValues['id_racion'];
  DBLookupComboBoxAuto3CloseUp(DBLookupComboBoxAuto3);
end;

end.
