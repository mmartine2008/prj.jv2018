unit URepEntradasSalidasCarne;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, UBDBGrid, DateTimePickerAuto, DateUtils, IBQuery, UPrincipal,
  UMensajeHuella, UCartel, JvGIF, JvExControls,
  JvAnimatedImage, JvGIFCtrl, UMensajeImpresora, PngImage, jpeg, JvLabel,
  ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFRepEntradasSalidasCarne = class(TFUniversal)
    PFiltros: TPanel;
    PDatosEntrada: TPanel;
    GroupBox1: TGroupBox;
    GBDatosEntrada: TGroupBox;
    BDBGDatosEntrada: TBitDBGrid;
    Label1: TLabel;
    DTPADesde: TDateTimePickerAuto;
    Label2: TLabel;
    DTPAHasta: TDateTimePickerAuto;
    DSRepEntradas: TDataSource;
    IBDSEntradas: TIBDataSet;
    IBDSEntradasV7: TIBStringField;
    IBDSEntradasV10: TIBStringField;
    IBDSEntradasV6: TIBStringField;
    IBDSEntradasV5: TIBStringField;
    IBDSEntradasID_SENASA: TIBStringField;
    IBDSEntradasV9: TIBStringField;
    IBDSEntradasV8: TIBStringField;
    IBDSEntradasV11: TIBStringField;
    IBDSEntradasID_RP: TIBStringField;
    IBDSEntradasFECHA: TDateField;
    IBDSEntradasOBSERVACION: TIBStringField;
    IBDSEntradasRESPONSABLE: TIntegerField;
    IBDSEntradasV1: TIBStringField;
    IBDSEntradasV2: TIBStringField;
    IBDSEntradasNOMBRE: TIBStringField;
    IBDSEntradasV3: TIBStringField;
    IBDSEntradasV4: TIBStringField;
    IBDSEntradasI1: TIntegerField;
    IBDSEntradasI2: TIntegerField;
    IBDSEntradasI3: TIntegerField;
    IBDSEntradasD1: TDateField;
    IBDSEntradasD2: TDateField;
    IBDSEntradasD3: TDateField;
    IBDSEntradasID_ANIMAL: TIntegerField;
    IBDSEntradasID_AUX_EVENTO: TIntegerField;
    IBDSEntradasI4: TIntegerField;
    IBDSEntradasI5: TIntegerField;
    IBDSEntradasI6: TIntegerField;
    IBDSEntradasI7: TIntegerField;
    IBDSEntradasI8: TIntegerField;
    IBDSEntradasI9: TIntegerField;
    IBDSEntradasVUNO1: TIBStringField;
    IBDSEntradasVUNO2: TIBStringField;
    IBDSEntradasVUNO3: TIBStringField;
    IBDSEntradasVUNO4: TIBStringField;
    IBDSEntradasVUNO5: TIBStringField;
    IBDSEntradasVUNO6: TIBStringField;
    IBDSEntradasEW: TIBStringField;
    IBDSEntradasH1: TTimeField;
    IBDSEntradasV12: TIBStringField;
    IBDSEntradasF1: TFloatField;
    IBDSEntradasF2: TFloatField;
    IBDSEntradasF3: TFloatField;
    IBDSEntradasF4: TFloatField;
    IBDSEntradasF5: TFloatField;
    IBDSEntradasID_PC: TIBStringField;
    IBDSEntradasID_HBA: TIBStringField;
    IBDSEntradasID_RA: TIBStringField;
    IBDSEntradasID_OTRO: TIBStringField;
    IBDSEntradasAPODO: TIBStringField;
    IBDSEntradasDTA_BAJA: TIBStringField;
    PDatosSalida: TPanel;
    GBDatosSalida: TGroupBox;
    BDBGDatosSalida: TBitDBGrid;
    IBDSSalidas: TIBDataSet;
    DSRepSalidas: TDataSource;
    IBDSSalidasID_AUX: TIntegerField;
    IBDSSalidasESTABLECIMIENTO: TIntegerField;
    IBDSSalidasID_ANIMAL: TIntegerField;
    IBDSSalidasID_RP: TIBStringField;
    IBDSSalidasID_SENASA: TIBStringField;
    IBDSSalidasID_PC: TIBStringField;
    IBDSSalidasID_HBA: TIBStringField;
    IBDSSalidasID_RA: TIBStringField;
    IBDSSalidasID_OTRO: TIBStringField;
    IBDSSalidasNOMBRE: TIBStringField;
    IBDSSalidasFECHA_NACIMIENTO: TDateField;
    IBDSSalidasSEXO: TIntegerField;
    IBDSSalidasORIGEN: TIBStringField;
    IBDSSalidasESTADO_REPRODUCTIVO: TIntegerField;
    IBDSSalidasESTADO_LACTACION: TIntegerField;
    IBDSSalidasPOTRERO: TIntegerField;
    IBDSSalidasLOTE: TIntegerField;
    IBDSSalidasRAZA: TIntegerField;
    IBDSSalidasRODEO: TIntegerField;
    IBDSSalidasCATEGORIA: TIntegerField;
    IBDSSalidasACTIVO: TIBStringField;
    IBDSSalidasCRONOLOGIA_DENTARIA: TIntegerField;
    IBDSSalidasCONDICION_CORPORAL: TIntegerField;
    IBDSSalidasMADRE_BIOLOGICA_EXTERNA: TIntegerField;
    IBDSSalidasMADRE_RECEPTORA_EXTERNA: TIntegerField;
    IBDSSalidasGDR: TIntegerField;
    IBDSSalidasPADRE_EXTERNO: TIntegerField;
    IBDSSalidasMADRE_BIOLOGICA_INTERNA: TIntegerField;
    IBDSSalidasMADRE_RECEPTORA_INTERNA: TIntegerField;
    IBDSSalidasPADRE_INTERNO: TIntegerField;
    IBDSSalidasAPODO: TIBStringField;
    IBDSSalidasV1: TIBStringField;
    IBDSSalidasV2: TIBStringField;
    IBDSSalidasV3: TIBStringField;
    IBDSSalidasV4: TIBStringField;
    IBDSSalidasV5: TIBStringField;
    IBDSSalidasV6: TIBStringField;
    IBDSSalidasEW: TIBStringField;
    IBDSSalidasDTA: TIBStringField;
    IBDSSalidasV7: TIBStringField;
    IBDSSalidasV8: TIBStringField;
    IBDSSalidasV9: TIBStringField;
    IBDSSalidasVUNO1: TIBStringField;
    IBDSSalidasTIPO_ALTA: TIBStringField;
    IBDSSalidasFECHA_ALTA: TDateField;
    IBDSSalidasOBSERVACION: TIBStringField;
    IBDSSalidasRESPONSABLE: TIBStringField;
    IBDSSalidasPRECIO_UNITARIO: TFloatField;
    IBDSSalidasPRECIO_BRUTO: TFloatField;
    IBDSSalidasGASTOS: TFloatField;
    IBDSSalidasV10: TIBStringField;
    IBDSSalidasACTIVIDAD: TIntegerField;
    IBDSSalidasID_IE: TIBStringField;
    IBDSSalidasADN: TIBStringField;
    IBDSSalidasTIPIFICACION_SANGUINEA: TIBStringField;
    IBDSSalidasCRIADOR: TIntegerField;
    IBDSSalidasPROPIETARIO: TIntegerField;
    IBDSSalidasORIGEN_ANIMAL: TIntegerField;
    IBDSSalidasV11: TIBStringField;
    IBDSSalidasV12: TIBStringField;
    IBDSSalidasV13: TIBStringField;
    IBQRepEntradasSalidasCarne: TIBQuery;
    IBDSSalidasPESO: TFloatField;
    IBDSSalidasCIRCUNFERENCIA_ESCROTAL: TFloatField;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    LExpExcel: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    procedure BBSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure IBDSEntradasF1SetText(Sender: TField; const Text: String);
    procedure BDBGDatosEntradaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQCostosVeteAfterOpen(DataSet: TDataSet);
    procedure DTPACloseUp(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BDBGDatosSalidaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    Desde, Hasta : TDate;
    procedure ActConsulta();

  public
    { Public declarations }
    procedure GenerarGrillaEntradas(Q: TIBQuery);
    procedure GenerarGrillaSalidas(Q: TIBQuery);    
  end;

var
  FRepEntradasSalidasCarne: TFRepEntradasSalidasCarne;

implementation

uses
  UREPProduccionCarne;

{$R *.dfm}

procedure TFRepEntradasSalidasCarne.BBSalirClick(Sender: TObject);
begin
  inherited;
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  Close();
end;

procedure TFRepEntradasSalidasCarne.FormCreate(Sender: TObject);
begin
  inherited;
{  DTPADesde.Date := IncYear(Date(),-1);
  DTPAHasta.Date := Date();
  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;
  ActConsulta;}
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;   
end;

procedure TFRepEntradasSalidasCarne.ActConsulta();
var
  cartel : TCartel;
begin
  cartel := TCartel.getInstance();
  cartel.abrircartel('Obteniendo Entradas y Salidas de Producción de Carne...');

{  IBQCostosVete.Close;
  IBQCostosVete.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCostosVete.ParamByName('DESDE').AsDate := Desde;
  IBQCostosVete.ParamByName('HASTA').AsDate := Hasta;
  IBQCostosVete.Open;  }

 // GenerarGrillaEntradas();
 // GenerarGrillaSalidas();

  cartel.cerrarcartel;
  cartel.FreeInstance;
end;

procedure TFRepEntradasSalidasCarne.GenerarGrillaEntradas(Q: TIBQuery);
var
  id_aux : integer;
begin
{  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
}

  id_aux := 0;
  Q.First;
  IBDSEntradas.Close;
  IBDSEntradas.Open;
  while not Q.Eof do
  begin
    IBDSEntradas.Insert;
    Inc(id_aux,1);
    IBDSEntradas.FieldByName('ID_AUX_EVENTO').AsInteger := id_aux;
    IBDSEntradas.FieldByName('ID_ANIMAL').AsInteger := id_aux;
    IBDSEntradas.FieldByName('D1').Value := Q.FieldValues['FECHA'];
    IBDSEntradas.FieldByName('V2').Value := Q.FieldValues['TIPOBAJA'];
    IBDSEntradas.FieldByName('V3').Value := Q.FieldValues['CATEGORIA'];
    if  (Q.FieldValues['PROMPESOCAMPO'] <> null) then
        IBDSEntradas.FieldByName('F1').Value := StrToFloat(FormatFloat('###0.00',Q.FieldValues['PROMPESOCAMPO']));
    if (Q.FieldValues['PRECIOKILO'] <> null)  then
        IBDSEntradas.FieldByName('F3').Value := StrToFloat(FormatFloat('###0.00',Q.FieldValues['PRECIOKILO']));

    IBDSEntradas.FieldByName('I1').Value := Q.FieldValues['IDCATEGORIA'];
    IBDSEntradas.FieldByName('I2').Value := Q.FieldValues['CABEZAS'];
    IBDSEntradas.FieldByName('V4').Value := Q.FieldValues['TIPODETALLE'];
    IBDSEntradas.FieldByName('I3').Value := Q.FieldValues['IDALTABAJA'];
    IBDSEntradas.Post;
    Q.Next;
  end;
  FPrincipal.IBTPrincipal.CommitRetaining;
 // PaintRequired;
end;

procedure TFRepEntradasSalidasCarne.GenerarGrillaSalidas(Q:TIBQuery);
var
  id_aux : integer;
begin
{  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
}

  id_aux := 0;
  Q.First;
  IBDSSalidas.Close;
  IBDSSalidas.Open;
  while not Q.Eof do
  begin
    IBDSSalidas.Insert;
    Inc(id_aux,1);
    IBDSSalidas.FieldByName('ID_AUX').AsInteger := id_aux;
    IBDSSalidas.FieldByName('ID_ANIMAL').AsInteger := id_aux;
    IBDSSalidas.FieldByName('FECHA_ALTA').Value := Q.FieldValues['FECHA'];
    IBDSSalidas.FieldByName('V1').Value := Q.FieldValues['TIPOBAJA'];
    IBDSSalidas.FieldByName('V2').Value := Q.FieldValues['CATEGORIA'];
      //--- -- aca comienza parche para incorporar ultimo peso 01/03/2017
  //  if ((Q.FieldValues['PROMPESODESTINO'] = null) or (Q.FieldValues['PROMPESODESTINO'] =0 )) then
  //    IBDSSalidas.FieldByName('PRECIO_BRUTO').Value :=777;
      // StrToFloat(FormatFloat('###0.00',Q.FieldValues['PROMPESODESTINO']))

    if ((Q.FieldValues['PROMPESODESTINO'] <> null) and(Q.FieldValues['PROMPESODESTINO'] <> 0)) then
      IBDSSalidas.FieldByName('PRECIO_BRUTO').Value := StrToFloat(FormatFloat('###0.00',Q.FieldValues['PROMPESODESTINO']))
     else
       if ((Q.FieldValues['PROMPESOCAMPO'] <> null) and(Q.FieldValues['PROMPESOCAMPO'] <> 0)) then
         IBDSSalidas.FieldByName('PRECIO_BRUTO').Value := StrToFloat(FormatFloat('###0.00',Q.FieldValues['PROMPESOCAMPO']));
    IBDSSalidas.FieldByName('PRECIO_UNITARIO').Value := StrToFloat(FormatFloat('###0.00',Q.FieldValues['PRECIOKILO']));
    IBDSSalidas.FieldByName('ACTIVIDAD').Value := Q.FieldValues['IDCATEGORIA'];
    IBDSSalidas.FieldByName('CRIADOR').Value := Q.FieldValues['CABEZAS'];
    IBDSSalidas.FieldByName('V3').Value := Q.FieldValues['TIPODETALLE'];
    IBDSSalidas.FieldByName('PROPIETARIO').Value := Q.FieldValues['IDALTABAJA'];
    IBDSSalidas.Post;
    Q.Next;
  end;
  FPrincipal.IBTPrincipal.CommitRetaining;
 // PaintRequired;
end;

procedure TFRepEntradasSalidasCarne.BBImprimirReporteClick(Sender: TObject);
//var
 // F : TFRepCostosVetePreview;
 // cartel : TCartel;
begin
//  MostrarMensajeImpresion();
  inherited;
//  cartel := TCartel.getInstance;
//  cartel.abrircartel('Generando reporte de costos sanitarios...');
{  F := TFRepCostosVetePreview.Create(self);
  F.IBQCostos.Close;
  F.IBQCostos.Open;
  F.QRLDesde.Caption := DateToStr(Desde);
  F.QRLHasta.Caption := DateToStr(Hasta);  }
//  cartel.cerrarcartel;
//  cartel.FreeInstance;
 { F.ShowModal;
  F.Destroy; }

{  IBDSEntradas.First;
  FREPProduccionCarne.IBQREPProduccionEntradas.First;
  while not IBDSEntradas.Eof do
  begin
    FREPProduccionCarne.IBQREPProduccionEntradas.FieldByName('PROMPESOCAMPO').AsFloat:= IBDSEntradas.FieldByName('F1').AsFloat;
    FREPProduccionCarne.IBQREPProduccionEntradas.FieldByName('PRECIOKILO').AsFloat:= IBDSEntradas.FieldByName('F3').AsFloat;
    IBDSEntradas.Next;
    FREPProduccionCarne.IBQREPProduccionEntradas.Next;
  end; }


  if (MostrarMensaje(tmConsulta, 'Desea aplicar los valores de peso y precio a todos los animales involucrados en los grupos?') = mrYes)then
   begin
    try
     IBDSEntradas.First;
     while not IBDSEntradas.Eof do
      begin
        IBQRepEntradasSalidasCarne.Close;
        IBQRepEntradasSalidasCarne.ParamByName('peso').AsFloat:= IBDSEntradas.FieldByName('F1').AsFloat;
        IBQRepEntradasSalidasCarne.ParamByName('precio').AsFloat:= IBDSEntradas.FieldByName('F3').AsFloat;
        IBQRepEntradasSalidasCarne.ParamByName('tipo').AsString:= IBDSEntradas.FieldByName('V4').AsString;
        IBQRepEntradasSalidasCarne.ParamByName('idcategoria').AsString:= IBDSEntradas.FieldByName('I1').AsString;
        IBQRepEntradasSalidasCarne.ParamByName('fecha').AsDateTime:= IBDSEntradas.FieldByName('D1').AsDateTime;
        IBQRepEntradasSalidasCarne.ParamByName('idaltabaja').AsInteger:= IBDSEntradas.FieldByName('I3').AsInteger;
        IBQRepEntradasSalidasCarne.Open;
        IBDSEntradas.Next;
      end;
     FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
   end;

    try
     IBDSSalidas.First;
     while not IBDSSalidas.Eof do
      begin
        IBQRepEntradasSalidasCarne.Close;
        IBQRepEntradasSalidasCarne.ParamByName('peso').AsFloat:= IBDSSalidas.FieldByName('PRECIO_BRUTO').AsFloat;
        IBQRepEntradasSalidasCarne.ParamByName('precio').AsFloat:= IBDSSalidas.FieldByName('PRECIO_UNITARIO').AsFloat;
        IBQRepEntradasSalidasCarne.ParamByName('tipo').AsString:= IBDSSalidas.FieldByName('V3').AsString;
        IBQRepEntradasSalidasCarne.ParamByName('idcategoria').AsString:= IBDSSalidas.FieldByName('ACTIVIDAD').AsString;
        IBQRepEntradasSalidasCarne.ParamByName('fecha').AsDateTime:= IBDSSalidas.FieldByName('FECHA_ALTA').AsDateTime;
        IBQRepEntradasSalidasCarne.ParamByName('idaltabaja').AsInteger:= IBDSSalidas.FieldByName('PROPIETARIO').AsInteger;
        IBQRepEntradasSalidasCarne.Open;
        IBDSSalidas.Next;
      end;
     FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
   end;


   end;
  //FPrincipal.IBTPrincipal.CommitRetaining; ///
//  IBDSEntradas.ApplyUpdates;
  FPrincipal.IBDPrincipal.ApplyUpdates([IBDSEntradas,IBDSSalidas]);
  Close();
end;

procedure TFRepEntradasSalidasCarne.IBDSEntradasF1SetText(Sender: TField;
  const Text: String);
var
  valor : double;
begin

  inherited;
{  if ((IBDSEntradas.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text))) then
  begin
    if (Sender.FieldName = 'F1') then
      if TryStrToFloat(Text,valor) then
      begin
        Sender.Value := Text;
        IBDSEntradasF3.Value := IBDSEntradasI1.Value * valor;
      end;

    if (Sender.FieldName = 'F2') then
      if TryStrToFloat(Text,valor) then
        Sender.Value := Text;

    if (Sender.FieldName = 'F3') then
      if TryStrToFloat(Text,valor) then
      begin
        Sender.Value := Text;
        IBDSEntradasF1.Value := valor / IBDSEntradasI1.Value;
      end;
  end;    }
end;

procedure TFRepEntradasSalidasCarne.BDBGDatosEntradaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.ReadOnly then
    BDBGDatosEntrada.Canvas.Brush.Color := clCream
  else
    BDBGDatosEntrada.Canvas.Brush.Color := clWindow;

  BDBGDatosEntrada.Canvas.FillRect(Rect);
  BDBGDatosEntrada.Canvas.Font.Color := clBlack;
  BDBGDatosEntrada.Canvas.TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
end;

procedure TFRepEntradasSalidasCarne.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFRepEntradasSalidasCarne.IBQCostosVeteAfterOpen(DataSet: TDataSet);
begin
  inherited;
  {BBXls.Enabled := not DataSet.IsEmpty;
  BBImprimirReporte.Enabled := not DataSet.IsEmpty;}
  IPreview.Enabled := not DataSet.IsEmpty;
  LPreview.Enabled := not DataSet.IsEmpty;
  LExpExcel.Enabled := not DataSet.IsEmpty;
  IExpExcel.Enabled := not DataSet.IsEmpty;
end;

procedure TFRepEntradasSalidasCarne.DTPACloseUp(Sender: TObject);
begin
  inherited;
  if (TDateTimePickerAuto(Sender).Name = 'DTPADesde') then
    begin
      if DTPADesde.Date > DTPAHasta.Date then
         DTPADesde.Date := DTPAHasta.Date;

      Desde := DTPADesde.Date;
    end
   else
    if (TDateTimePickerAuto(Sender).Name = 'DTPAHasta') then
      begin
        if DTPAHasta.Date < DTPADesde.Date then
          DTPAHasta.Date := DTPADesde.Date;

        Hasta := DTPAHasta.Date;
      end;
  ActConsulta();      
end;

procedure TFRepEntradasSalidasCarne.DTPADesdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUp(Sender);
end;

procedure TFRepEntradasSalidasCarne.BDBGDatosSalidaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.ReadOnly then
    BDBGDatosSalida.Canvas.Brush.Color := clCream
  else
    BDBGDatosSalida.Canvas.Brush.Color := clWindow;

  BDBGDatosSalida.Canvas.FillRect(Rect);
  BDBGDatosSalida.Canvas.Font.Color := clBlack;
  BDBGDatosSalida.Canvas.TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
end;

end.
