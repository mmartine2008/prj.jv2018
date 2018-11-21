unit USimulador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls,
  jpeg, PngImage, ExtCtrls, StdCtrls, JvGIF, Grids, BaseGrid, AdvGrid,
  DBCtrls, UDBLookupComboBoxAuto, JvExControls, JvEnterTab, JvExStdCtrls,
  JvEdit, ImgList, PngImageList, UREPSimulPrev, QRCtrls, JvLabel;

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

  TFSimulador = class(TFUniversal)
    PBotones: TPanel;
    IBQSuplementosRac: TIBQuery;
    DSRaciones: TDataSource;
    IBQRaciones: TIBQuery;
    IBottom: TImage;
    ICancelar: TImage;
    LCancelar: TLabel;
    PCSimulador: TPageControl;
    TSCompraVenta: TTabSheet;
    TSRacion: TTabSheet;
    TSDatosP: TTabSheet;
    TSConclusion: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EGuia: TJvEdit;
    EComision: TJvEdit;
    EFletes: TJvEdit;
    EKgPromedio: TJvEdit;
    ECantAnimales: TJvEdit;
    EPrecioCompra: TJvEdit;
    ECantAnimalesVenta: TJvEdit;
    EPrecioCompraVenta: TJvEdit;
    EKGPromVenta: TJvEdit;
    EComisionVenta: TJvEdit;
    EFletesVenta: TJvEdit;
    EGuiaVenta: TJvEdit;
    Label15: TLabel;
    LabelPrecio: TLabel;
    LabelComision: TLabel;
    LabelFlete: TLabel;
    LabelGuia: TLabel;
    LabelTotalAnimal: TLabel;
    LabelTotalKg: TLabel;
    LabelTotalLote: TLabel;
    LTotalLote: TLabel;
    LTotalKgs: TLabel;
    LTotalAnimal: TLabel;
    LGuiaAnimal: TLabel;
    LFelteAnimal: TLabel;
    LComisionAnimal: TLabel;
    LPrecioAnimal: TLabel;
    LPrecioAnimalVenta: TLabel;
    LComisionAnimalVenta: TLabel;
    LFleteAnimalVenta: TLabel;
    LGuiaAnimalVenta: TLabel;
    LTotalAnimalVenta: TLabel;
    LTotalKgsVenta: TLabel;
    LTotalLoteVenta: TLabel;
    Label1: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    LabelConversion: TLabel;
    EConvAlimenticia: TJvEdit;
    ECostoSaniAnimal: TJvEdit;
    EManoObraDiaria: TJvEdit;
    LabelAuemntoDiario: TLabel;
    LAumentoDePeso: TLabel;
    LSelRacion: TLabel;
    DBLCBATipoSuplementacion: TDBLookupComboBoxAuto;
    SG1: TAdvStringGrid;
    LabelPrecioDieta: TLabel;
    LPrecioDieta: TLabel;
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
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    SPrecio: TShape;
    SComision: TShape;
    SFlete: TShape;
    SGuia: TShape;
    STotalAnimal: TShape;
    STotalKg: TShape;
    STotalLote: TShape;
    SPrecioDieta: TShape;
    SPrecioDietaL: TShape;
    Shape23: TShape;
    Shape24: TShape;
    SLabelConversion: TShape;
    SConversion: TShape;
    Shape27: TShape;
    Shape28: TShape;
    SAumentoDiarioL: TShape;
    SAumentoDiario: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Shape39: TShape;
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
    Shape50: TShape;
    Shape51: TShape;
    Shape52: TShape;
    Shape53: TShape;
    JvSiguiente: TJvImage;
    LBBSiguiente: TLabel;
    LBBAnterior: TLabel;
    JvAnteriror: TJvImage;
    PngImageList1: TPngImageList;
    SPrecioC: TShape;
    SComisionC: TShape;
    SFleteC: TShape;
    SGuiaC: TShape;
    STotalLoteC: TShape;
    STotalKgC: TShape;
    STotalAnimalC: TShape;
    STotalKgV: TShape;
    STotalLoteV: TShape;
    STotalAnimalV: TShape;
    SGuiaV: TShape;
    SFleteV: TShape;
    SComisionV: TShape;
    SPrecioV: TShape;
    LabelCostoNutricion: TLabel;
    LCostoNutricion: TLabel;
    SCostoNutricionL: TShape;
    SCostoNutricion: TShape;
    LabelKgAuemntadoAnimal: TLabel;
    LabelKgAumentadoLote: TLabel;
    LKgAumentoLote: TLabel;
    LKgAumentados: TLabel;
    SKgAAnimalL: TShape;
    SKGALoteL: TShape;
    SKgALote: TShape;
    SKgAAnimal: TShape;
    Button1: TButton;
    JvEnterAsTab1: TJvEnterAsTab;
    JvEnterAsTab2: TJvEnterAsTab;
    LPreview: TLabel;
    IPreview: TImage;
    Label17: TLabel;
    EDiasEncierre: TJvEdit;
    Shape22: TShape;
    Shape29: TShape;
    Shape9: TShape;
    EKgTotalesConsumidos: TJvEdit;
    Shape10: TShape;
    Label8: TLabel;
    LConversion: TLabel;
    procedure ECantAnimalesChange(Sender: TObject);
    procedure ECantAnimalesVentaChange(Sender: TObject);
    procedure EPrecioCompraChange(Sender: TObject);
    procedure EPrecioCompraVentaChange(Sender: TObject);
    procedure EKgPromedioChange(Sender: TObject);
    procedure EKGPromVentaChange(Sender: TObject);
    procedure EComisionChange(Sender: TObject);
    procedure EcomisionVentaChange(Sender: TObject);
    procedure EFletesChange(Sender: TObject);
    procedure EFletesVentaChange(Sender: TObject);
    procedure EGuiaChange(Sender: TObject);
    procedure EGuiaVentaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLCBATipoSuplementacionCloseUp(Sender: TObject);
    procedure EDiasEncierreChange(Sender: TObject);
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
    procedure EKgTotalesConsumidosChange(Sender: TObject);
  private
    cantAnimalesCompra, cantAnimalesVenta : integer;
    precioCompra, precioVenta, kgPromedioCompra, kgPromedioVenta, comisionCompra, comisionVenta, FleteCompra, FleteVenta, guiaCompra, guiaVenta, PrecioKG, PrecioTotal, CantTotal : Double;
    DiasEncierre, ManoObra, CostoSanitario, ConvAlimenticia, TotalPorAnimalVenta, TotalPorAnimalCompra, ConsumoPorAnimal : Double;
    KgTotalesConsumido : Double;
    AlimentosRacion : TArrAlimentos;
    procedure ArmarTabla(var F : TFREPSimulPrev);
  public
    procedure RealizarCalculosCompra;
    procedure RealizarCalculosVenta;
    procedure RealizarCalculosProductivos;
    procedure ArmarGrillaAlimentacion;
  end;

var
  FSimulador: TFSimulador;

implementation

{$R *.dfm}

uses
  UPrincipal, URacion;

procedure TFSimulador.ECantAnimalesChange(Sender: TObject);
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

procedure TFSimulador.ECantAnimalesVentaChange(Sender: TObject);
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

procedure TFSimulador.EPrecioCompraChange(Sender: TObject);
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

procedure TFSimulador.EPrecioCompraVentaChange(Sender: TObject);
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

procedure TFSimulador.EKgPromedioChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EKgPromedio.Text, I) then
  begin
    kgPromedioCompra := I;
    RealizarCalculosCompra;
  end;
end;

procedure TFSimulador.EKGPromVentaChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EKGPromVenta.Text, I) then
  begin
    kgPromedioVenta := I;
    RealizarCalculosVenta;
  end;
end;

procedure TFSimulador.EComisionChange(Sender: TObject);
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

procedure TFSimulador.EcomisionVentaChange(Sender: TObject);
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

procedure TFSimulador.EFletesChange(Sender: TObject);
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

procedure TFSimulador.EFletesVentaChange(Sender: TObject);
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

procedure TFSimulador.EGuiaChange(Sender: TObject);
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

procedure TFSimulador.EGuiaVentaChange(Sender: TObject);
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

procedure TFSimulador.FormCreate(Sender: TObject);
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
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  IBQRaciones.First;
end;

procedure TFSimulador.RealizarCalculosCompra;
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
  RealizarCalculosProductivos;
end;

procedure TFSimulador.RealizarCalculosVenta;
var
  v1, v2, v3, v4, t1,t2,t3 : Double;
begin
  v1 := precioVenta*kgPromedioVenta;
  if v1 <> 0 then
  begin
    LPrecioAnimalVenta.Visible := true;
    SPrecio.Visible := true;
    LabelPrecio.Visible := true;
    SPrecioV.Visible := true;
    LPrecioAnimalVenta.Caption := '$'+FormatFloat('#0.##',v1);
  end
  else
    LPrecioAnimalVenta.Caption := '';
  v2 := (v1*comisionVenta)/100;
  if v2 <> 0 then
  begin
    LComisionAnimalVenta.Visible := true;
    SComision.Visible := true;
    LabelComision.Visible := true;
    SComisionV.Visible := true;
    LComisionAnimalVenta.Caption := '$'+FormatFloat('#0.##',v2);
  end
  else
    LComisionAnimalVenta.Caption := '';
  if cantAnimalesVenta > 0 then
  begin
    v3 := FleteVenta/cantAnimalesVenta;
    if v3 <> 0 then
    begin
      LFleteAnimalVenta.Visible := true;
      SFlete.Visible := true;
      LabelFlete.Visible := true;
      SFleteV.Visible := true;
      LFleteAnimalVenta.Caption := '$'+FormatFloat('#0.##',v3);
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
      SGuia.Visible := true;
      LabelGuia.Visible := true;
      SGuiaV.Visible := true;
      LGuiaAnimalVenta.Caption := '$'+FormatFloat('#0.##',v4);
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
    STotalAnimal.Visible := true;
    LabelTotalAnimal.Visible := true;
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
    STotalKg.Visible := true;
    LabelTotalKg.Visible := true;
    STotalKgV.Visible := true;
    LTotalKgsVenta.Caption := '$'+FormatFloat('#0.##',t2);
  end
  else
    LTotalKgsVenta.Caption := '';

  t3 := t1 * cantAnimalesVenta;
  if t3 <> 0 then
  begin
    LTotalLoteVenta.Visible := true;
    STotalLote.Visible := true;
    LabelTotalLote.Visible := true;
    STotalLoteV.Visible := true;
    LTotalLoteVenta.Caption := '$'+FormatFloat('#0.##',t3);
  end
  else
    LTotalLoteVenta.Caption := '';
  RealizarCalculosProductivos;
end;

procedure TFSimulador.DBLCBATipoSuplementacionCloseUp(Sender: TObject);
var
  I : Integer;
  Indice : Integer;
begin
  inherited;
  if DBLCBATipoSuplementacion.KeyValue <> null then
  begin
    SG1.Visible := true;
    Indice := 0;
    SetLength(AlimentosRacion,Indice);
    IBQSuplementosRac.Close;
    IBQSuplementosRac.ParamByName('racion').Value := DBLCBATipoSuplementacion.KeyValue;
    IBQSuplementosRac.Open;
    IBQSuplementosRac.First;
   
    //PorcMS := 0;
    PrecioTotal := 0;
    PrecioKG := 0;
    while not IBQSuplementosRac.Eof do
    begin
      //PorcMS := PorcMS + IBQSuplementosRac.FieldValues['porc_ms'];
      //PrecioTotal := PrecioTotal + (IBQSuplementosRac.FieldValues['precio']*(IBQSuplementosRac.FieldValues['porcentaje']/100));
      SetLength(AlimentosRacion,Indice+1);
      AlimentosRacion[Indice].Nombre := IBQSuplementosRac.FieldValues['nombre'];
      AlimentosRacion[Indice].PorcMS := IBQSuplementosRac.FieldValues['porc_ms'];
      AlimentosRacion[Indice].PorcUsado := IBQSuplementosRac.FieldValues['porcentaje'];
      AlimentosRacion[Indice].PrecioPorTon := IBQSuplementosRac.FieldValues['precio'];

      PrecioKg := PrecioKG + ((IBQSuplementosRac.FieldValues['precio'])/1000);

      Inc(Indice);
      I := I +1;
      IBQSuplementosRac.Next;
    end;
   { if I > 0 then
      PorcMS := PorcMS / I;}
    ArmarGrillaAlimentacion;
  end;
  RealizarCalculosProductivos;
end;

procedure TFSimulador.ArmarGrillaAlimentacion;
var
  I : Integer;
  KGRacion, KGTc, KGTon : Double;
begin
  SG1.RowCount := 2;
  KGRacion := 0;
  KGTc := 0;
  KGTon := 0;

  SG1.Cells[0,0] := 'Alimento';
  SG1.Cells[1,0] := 'Kg Usados x Cab';
  SG1.Cells[2,0] := '$ por Kg';
  SG1.Cells[3,0] := 'Precio x Cab';
  SG1.Cells[4,0] := '% MS';
  SG1.CellProperties[0,0].Alignment := taCenter;
  SG1.CellProperties[1,0].Alignment := taCenter;
  SG1.CellProperties[2,0].Alignment := taCenter;
  SG1.CellProperties[3,0].Alignment := taCenter;
  SG1.CellProperties[4,0].Alignment := taCenter;
  for I := 0 to Length(AlimentosRacion)-1 do
  begin
    if I <= 5 then
    begin
      SG1.Cells[0,I+1] := AlimentosRacion[I].Nombre;
      KGRacion := KGRacion + (KgTotalesConsumido/cantAnimalesCompra)*(AlimentosRacion[I].PorcUsado/100);
      SG1.Cells[1,I+1] := FormatFloat('##.##',(KgTotalesConsumido/cantAnimalesCompra)*(AlimentosRacion[I].PorcUsado/100))+' Kgs.';
      KGTon := KGTon + (AlimentosRacion[I].PrecioPorTon/1000)*(AlimentosRacion[I].PorcUsado/100);
      SG1.Cells[2,I+1] := '$'+FormatFloat('#0.##',(AlimentosRacion[I].PrecioPorTon/1000)*(AlimentosRacion[I].PorcUsado/100));
      KGTc := KGTc + (((KgTotalesConsumido/cantAnimalesCompra)*(AlimentosRacion[I].PorcUsado/100))*(AlimentosRacion[I].PrecioPorTon))/1000;
      SG1.Cells[3,I+1] := '$'+FormatFloat('#0.##',(((KgTotalesConsumido/cantAnimalesCompra)*(AlimentosRacion[I].PorcUsado/100))*(AlimentosRacion[I].PrecioPorTon))/1000);
      SG1.Cells[4,I+1] := FormatFloat('#0.##',AlimentosRacion[I].PorcMS)+' %';
      SG1.RowCount := SG1.RowCount + 1;
      SG1.Height := SG1.Height + 27;

      SG1.CellProperties[0,I+1].Alignment := taCenter;
      SG1.CellProperties[0,I+1].ReadOnly := true;
      SG1.CellProperties[1,I+1].Alignment := taCenter;
      SG1.CellProperties[1,I+1].ReadOnly := true;
      SG1.CellProperties[2,I+1].Alignment := taCenter;
      SG1.CellProperties[2,I+1].ReadOnly := true;
      SG1.CellProperties[3,I+1].Alignment := taCenter;
      SG1.CellProperties[3,I+1].ReadOnly := true;
      SG1.CellProperties[4,I+1].Alignment := taCenter;
      SG1.CellProperties[4,I+1].ReadOnly := true;
    end
    else
      break;
  end;

  PrecioKG := KGTon;
  PrecioTotal := PrecioKg;

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
  SG1.CellProperties[0,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[1,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[2,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[3,SG1.RowCount-1].FontStyle := [fsBold];
  SG1.CellProperties[4,SG1.RowCount-1].FontStyle := [fsBold];

  SG1.Cells[0,SG1.RowCount-1] := 'Total';
  SG1.Cells[1,SG1.RowCount-1] := FormatFloat('##.##',KGRacion)+' Kgs';
  SG1.Cells[2,SG1.RowCount-1] := '$'+FormatFloat('#0.##',KGTon);
  SG1.Cells[3,SG1.RowCount-1] := '$'+FormatFloat('##.##',KGTc);
  SG1.Cells[4,SG1.RowCount-1] := '';//FormatFloat('##.##',0);

  if DiasEncierre > 0 then
    ConsumoPorAnimal := KGRacion/DiasEncierre
  else
    ConsumoPorAnimal := 0;

  SG1.Height := 140;
end;

procedure TFSimulador.RealizarCalculosProductivos;
var
  v1,v2,v3,v4,v5 : Double;
  t1,t2,t3,t4,t5,t6,t7, t8,t9 : Double;
begin
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
  v2 := v1 * cantAnimalesVenta;
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
    LAumentoDePeso.Visible := true;
    SAumentoDiario.Visible := true;
    SAumentoDiarioL.Visible := true;
    LabelAuemntoDiario.Visible := true;

    LConversion.Visible := true;
    LabelConversion.Visible := true;
    SConversion.Visible := true;
    SLabelConversion.Visible := true;

    LAumentoDePeso.Caption := FormatFloat('#0.##',v3)+' Kgs';

    LConversion.Caption := FormatFloat('#0.##',ConsumoPorAnimal/v3);

    ConvAlimenticia := ConsumoPorAnimal/v3;
  end
  else
  begin
    LAumentoDePeso.Caption := '';
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
    LPrecioDieta.Caption := '$'+FormatFloat('#0.##',v4);
  end
  else
    LPrecioDieta.Caption := '';

  v5 := ConvAlimenticia * v4;
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
    t1 := ((ManoObra*DiasEncierre)/v1) + (CostoSanitario/v1) + v5
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
end;

procedure TFSimulador.EDiasEncierreChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EDiasEncierre.Text,I) then
  begin
    DiasEncierre := I;
    RealizarCalculosProductivos;
  end;
end;

procedure TFSimulador.EManoObraDiariaChange(Sender: TObject);
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

procedure TFSimulador.ECostoSaniAnimalChange(Sender: TObject);
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

procedure TFSimulador.EConvAlimenticiaChange(Sender: TObject);
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

procedure TFSimulador.ICancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFSimulador.LSelRacionClick(Sender: TObject);
begin
  inherited;
  FPrincipal.AbrirFormNormal(TFRacion.Create(self));
  IBQRaciones.Close;
  IBQRaciones.Open;
  IBQRaciones.Last;
  DBLCBATipoSuplementacion.KeyValue := IBQRaciones.FieldValues['id_racion'];
  DBLCBATipoSuplementacionCloseUp(DBLCBATipoSuplementacion);
end;

procedure TFSimulador.LSelRacionMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    LSelRacion.Font.Color:= $00606C02;
    LSelRacion.Font.Style:= [fsBold,fsUnderline];
  end;
end;

procedure TFSimulador.LSelRacionMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
  begin
    LSelRacion.Font.Color:= clWindowText;
    LSelRacion.Font.Style:= [fsUnderline];
  end;
end;

procedure TFSimulador.JvSiguienteClick(Sender: TObject);
begin
  inherited;
  PCSimulador.TabIndex := PCSimulador.TabIndex + 1;
  JvSiguiente.Visible := PCSimulador.TabIndex < 3;
  JvAnteriror.Visible := PCSimulador.TabIndex > 0;
  LBBAnterior.Visible := JvAnteriror.Visible;
  LBBSiguiente.Visible := JvSiguiente.Visible;
  PCSimuladorChange(nil);
end;

procedure TFSimulador.JvAnterirorClick(Sender: TObject);
begin
  inherited;
  PCSimulador.TabIndex := PCSimulador.TabIndex - 1;
  JvAnteriror.Visible := PCSimulador.TabIndex > 0;
  JvSiguiente.Visible := PCSimulador.TabIndex < 3;
  LBBAnterior.Visible := JvAnteriror.Visible;
  LBBSiguiente.Visible := JvSiguiente.Visible;
  PCSimuladorChange(nil);
end;

procedure TFSimulador.PCSimuladorChange(Sender: TObject);
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
    EDiasEncierre.SetFocus;
  end;
  if PCSimulador.ActivePage = TSDatosP then
  begin
    TSDatosP.ImageIndex := 2;
    EManoObraDiaria.SetFocus;
  end;
  if PCSimulador.ActivePage = TSConclusion then
    TSConclusion.ImageIndex := 3;

end;

procedure TFSimulador.ArmarTabla(var F : TFREPSimulPrev);
var
  NextTL, NextTS : Integer;
  I : Integer;
begin
  NextTL := 483;
  NextTS := 480;

  for I := 1 to SG1.RowCount do
  begin
    with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
    begin
      Top := NextTS;
      Left := 8;
      Width := 185;
      Height := 21;
    end;
    with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
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

    with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
    begin
      Top := NextTS;
      Left := 192;
      Width := 129;
      Height := 21;
    end;
    with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
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

    with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
    begin
      Top := NextTS;
      Left := 320;
      Width := 121;
      Height := 21;
    end;
    with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
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

    with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
    begin
      Top := NextTS;
      Left := 440;
      Width := 113;
      Height := 21;
    end;
    with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
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

    with (TQRShape(F.QRBand2.AddPrintable(TQRShape))) do
    begin
      Top := NextTS;
      Left := 552;
      Width := 113;
      Height := 21;
    end;
    with (TQRLabel(F.QRBand2.AddPrintable(TQRLabel))) do
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

procedure TFSimulador.Button1Click(Sender: TObject);
var
  F : TFREPSimulPrev;
begin
  inherited;
  F := TFREPSimulPrev.Create(self);
  {F.QRLCantCompra.Caption := ECantAnimales.Text;
  F.QRLCantVenta.Caption := ECantAnimalesVenta.Text;
  F.QRLPrecioCompra.Caption := EPrecioCompra.Text;
  F.QRLPrecioVenta.Caption := EPrecioCompraVenta.Text;
  F.QRLPesoCompra.Caption := EKgPromedio.Text;
  F.QRLPesoVenta.Caption := EKGPromVenta.Text;
  F.QRLComisionC.Caption := EComision.Text;
  F.QRLComisionV.Caption := EComisionVenta.Text;
  F.QRLFletesC.Caption := EFletes.Text;
  F.QRLFleteV.Caption := EFletesVenta.Text;
  F.QRLGuiaC.Caption := EGuia.Text;
  F.QRLGuiaV.Caption := EGuiaVenta.Text;
  F.QRLPrecioAnimalC.Caption := LPrecioAnimal.Caption;
  F.QRLPrecioAnimalV.Caption := LPrecioAnimalVenta.Caption;
  F.QRLComisionAC.Caption := LComisionAnimal.Caption;
  F.QRLCOmisionAV.Caption := LComisionAnimalVenta.Caption;
  F.QRLFleteAC.Caption := LFelteAnimal.Caption;
  F.QRLFleteAV.Caption := LFleteAnimalVenta.Caption;
  F.QRLGuiaAC.Caption := LGuiaAnimal.Caption;
  F.QRLGuiaAV.Caption := LGuiaAnimalVenta.Caption;
  F.QRLTotalAnimalC.Caption := LTotalAnimal.Caption;
  F.QRLTotalAnimalV.Caption := LTotalAnimalVenta.Caption;
  F.QRLTotalKgC.Caption := LTotalKgs.Caption;
  F.QRLTotalKgV.Caption := LTotalKgsVenta.Caption;
  F.QRLTotalLoteC.Caption := LTotalLote.Caption;
  F.QRLTotalLoteV.Caption := LTotalLoteVenta.Caption;

  F.QRLPrecioDieta.Caption := LPrecioDieta.Caption;
  F.QRLKgAumentadoAnimal.Caption := LKgAumentados.Caption;
  F.QRLKGAumentadolote.Caption := LKgAumentoLote.Caption;
  F.QRLDiasEncierre.Caption := EDiasEncierre.Text;
  F.QRLManoObra.Caption := EManoObraDiaria.Text;
  F.QRLSanitario.Caption := ECostoSaniAnimal.Text;
  F.QRLConvAlimento.Caption := FormatFloat('#0.##',ConvAlimenticia);
  F.QRLAumentoDiario.Caption := LAumentoDePeso.Caption;
  F.QRLCostoNutricion.Caption := LCostoNutricion.Caption;

  F.QRLTotalKG.Caption := LCostoTotalKg.Caption;
  F.QRLTotalAnimal.Caption := LCostoTotalAnim.Caption;
  F.QRLCostoDiario.Caption := LCostoDiario.Caption;
  F.QRLCAmbioCateg.Caption := LCambioCateg.Caption;
  F.QRLUtilNutricion.Caption := LUtilNutricion.Caption;
  F.QRLUtilAnimal.Caption := LUtilidadAnimal.Caption;
  F.QRLUtilLote.Caption := LUtilLote.Caption;
  F.QRLRentaMes.Caption := LRentaMensual.Caption;
  F.QRLRentaCiclo.Caption := LRentaCiclo.Caption;

  ArmarTabla(F);

              }
  F.ShowModal;
  F.Destroy;
end;

procedure TFSimulador.IPreviewClick(Sender: TObject);
begin
  inherited;
  Button1.Click;
end;

procedure TFSimulador.FormShow(Sender: TObject);
begin
  inherited;
  ECantAnimales.SetFocus;
end;

procedure TFSimulador.EKgTotalesConsumidosChange(Sender: TObject);
var
  I : Double;
begin
  inherited;
  if TryStrToFloat(EKgTotalesConsumidos.Text,I) then
  begin
    KgTotalesConsumido := I * DiasEncierre * cantAnimalesCompra;
    RealizarCalculosProductivos;
    if DBLCBATipoSuplementacion.Visible then
      DBLCBATipoSuplementacionCloseUp(nil);
    LSelRacion.Visible := true;
    DBLCBATipoSuplementacion.Visible := true;
  end;
end;

end.
