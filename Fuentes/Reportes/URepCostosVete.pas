unit URepCostosVete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, UBDBGrid, DateTimePickerAuto, DateUtils, IBQuery, UPrincipal,
  URepCostosVetePreview, UMensajeHuella, UCartel, JvGIF, JvExControls,
  JvAnimatedImage, JvGIFCtrl, UMensajeImpresora, PngImage, jpeg, JvLabel,
  ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFRepCostosVete = class(TFUniversal)
    PFiltros: TPanel;
    PDatos: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BDBGDatos: TBitDBGrid;
    Label1: TLabel;
    DTPADesde: TDateTimePickerAuto;
    Label2: TLabel;
    DTPAHasta: TDateTimePickerAuto;
    DSRepCostosVete: TDataSource;
    IBDSCostosVete: TIBDataSet;
    IBQCostosVete: TIBQuery;
    IBQCostosVeteFECHA: TDateField;
    IBQCostosVeteID_GRUPO: TIntegerField;
    IBQCostosVeteGRUPO: TIBStringField;
    IBQCostosVeteID_TIPO_EVENTO: TIntegerField;
    IBQCostosVeteEVENTO: TIBStringField;
    IBQCostosVeteID_RODEO: TIntegerField;
    IBQCostosVeteRODEO: TIBStringField;
    IBQCostosVeteID_CATEGORIA: TIntegerField;
    IBQCostosVeteCATEGORIA: TIBStringField;
    IBQCostosVeteRESPONSABLE: TIBStringField;
    IBQCostosVeteCANT_ANIMALES: TIntegerField;
    IBQCostosVeteCOSTO: TIBBCDField;
    IBQCostosVeteCOSTO_TOTAL: TIBBCDField;
    IBQCostosVeteCOSTO_KG: TIBBCDField;
    IBQCostosVeteACTIVIDAD: TIBStringField;
    IBDSCostosVeteV7: TIBStringField;
    IBDSCostosVeteV10: TIBStringField;
    IBDSCostosVeteV6: TIBStringField;
    IBDSCostosVeteV5: TIBStringField;
    IBDSCostosVeteID_SENASA: TIBStringField;
    IBDSCostosVeteV9: TIBStringField;
    IBDSCostosVeteV8: TIBStringField;
    IBDSCostosVeteV11: TIBStringField;
    IBDSCostosVeteID_RP: TIBStringField;
    IBDSCostosVeteFECHA: TDateField;
    IBDSCostosVeteOBSERVACION: TIBStringField;
    IBDSCostosVeteRESPONSABLE: TIntegerField;
    IBDSCostosVeteV1: TIBStringField;
    IBDSCostosVeteV2: TIBStringField;
    IBDSCostosVeteNOMBRE: TIBStringField;
    IBDSCostosVeteV3: TIBStringField;
    IBDSCostosVeteV4: TIBStringField;
    IBDSCostosVeteI1: TIntegerField;
    IBDSCostosVeteI2: TIntegerField;
    IBDSCostosVeteI3: TIntegerField;
    IBDSCostosVeteD1: TDateField;
    IBDSCostosVeteD2: TDateField;
    IBDSCostosVeteD3: TDateField;
    IBDSCostosVeteID_ANIMAL: TIntegerField;
    IBDSCostosVeteID_AUX_EVENTO: TIntegerField;
    IBDSCostosVeteI4: TIntegerField;
    IBDSCostosVeteI5: TIntegerField;
    IBDSCostosVeteI6: TIntegerField;
    IBDSCostosVeteI7: TIntegerField;
    IBDSCostosVeteI8: TIntegerField;
    IBDSCostosVeteI9: TIntegerField;
    IBDSCostosVeteVUNO1: TIBStringField;
    IBDSCostosVeteVUNO2: TIBStringField;
    IBDSCostosVeteVUNO3: TIBStringField;
    IBDSCostosVeteVUNO4: TIBStringField;
    IBDSCostosVeteVUNO5: TIBStringField;
    IBDSCostosVeteVUNO6: TIBStringField;
    IBDSCostosVeteEW: TIBStringField;
    IBDSCostosVeteH1: TTimeField;
    IBDSCostosVeteV12: TIBStringField;
    IBDSCostosVeteF1: TFloatField;
    IBDSCostosVeteF2: TFloatField;
    IBDSCostosVeteF3: TFloatField;
    IBDSCostosVeteF4: TFloatField;
    IBDSCostosVeteF5: TFloatField;
    IBDSCostosVeteID_PC: TIBStringField;
    IBDSCostosVeteID_HBA: TIBStringField;
    IBDSCostosVeteID_RA: TIBStringField;
    IBDSCostosVeteID_OTRO: TIBStringField;
    IBDSCostosVeteAPODO: TIBStringField;
    IBDSCostosVeteDTA_BAJA: TIBStringField;
    IBQCostosVeteOBSERVACIONES: TIBStringField;
    IBQCostosVeteTIPO_DESCRIPCION: TIBStringField;
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
    GConsulta: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    procedure BBSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure IBDSCostosVeteF1SetText(Sender: TField; const Text: String);
    procedure BDBGDatosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBXlsClick(Sender: TObject);
    procedure IBQCostosVeteAfterOpen(DataSet: TDataSet);
    procedure DTPACloseUp(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    Desde, Hasta : TDate;
    procedure ActConsulta();
    procedure GenerarGrilla();
  public
    { Public declarations }
  end;

var
  FRepCostosVete: TFRepCostosVete;

implementation

{$R *.dfm}

procedure TFRepCostosVete.BBSalirClick(Sender: TObject);
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

procedure TFRepCostosVete.FormCreate(Sender: TObject);
begin
  inherited;
  DTPADesde.Date := IncYear(Date(),-1);
  DTPAHasta.Date := Date();
  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;
end;

procedure TFRepCostosVete.ActConsulta();
var
  cartel : TCartel;
begin
  cartel := TCartel.getInstance();
  cartel.abrircartel('Obteniendo costos sanitarios...');

  IBQCostosVete.Close;
  IBQCostosVete.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQCostosVete.ParamByName('DESDE').AsDate := Desde;
  IBQCostosVete.ParamByName('HASTA').AsDate := Hasta;
  IBQCostosVete.Open;

  GenerarGrilla();

  cartel.cerrarcartel;
  cartel.FreeInstance;
end;

procedure TFRepCostosVete.GenerarGrilla();
var
  id_aux : integer;
begin
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  id_aux := 0;
  IBQCostosVete.First;
  IBDSCostosVete.Close;
  IBDSCostosVete.Open;
  while not IBQCostosVete.Eof do
  begin
    IBDSCostosVete.Insert;
    Inc(id_aux,1);
    IBDSCostosVete.FieldByName('ID_AUX_EVENTO').AsInteger := id_aux;
    IBDSCostosVete.FieldByName('D1').Value := IBQCostosVete.FieldValues['FECHA'];
    IBDSCostosVete.FieldByName('V1').Value := IBQCostosVete.FieldValues['GRUPO'];
    IBDSCostosVete.FieldByName('V2').Value := IBQCostosVete.FieldValues['EVENTO'];
    IBDSCostosVete.FieldByName('V3').Value := IBQCostosVete.FieldValues['TIPO_DESCRIPCION'];
    IBDSCostosVete.FieldByName('V4').Value := IBQCostosVete.FieldValues['RODEO'];
    IBDSCostosVete.FieldByName('I2').Value := IBQCostosVete.FieldValues['ID_CATEGORIA'];
    IBDSCostosVete.FieldByName('V5').Value := IBQCostosVete.FieldValues['CATEGORIA'];
    IBDSCostosVete.FieldByName('V6').Value := IBQCostosVete.FieldValues['RESPONSABLE'];
    IBDSCostosVete.FieldByName('I1').Value := IBQCostosVete.FieldValues['CANT_ANIMALES'];
    IBDSCostosVete.FieldByName('F1').Value := IBQCostosVete.FieldValues['COSTO'];
    IBDSCostosVete.FieldByName('F3').Value := IBQCostosVete.FieldValues['COSTO_TOTAL'];
    IBDSCostosVete.FieldByName('F2').Value := IBQCostosVete.FieldValues['COSTO_KG'];
    IBDSCostosVete.FieldByName('V7').Value := IBQCostosVete.FieldValues['ACTIVIDAD'];
    IBDSCostosVete.FieldByName('OBSERVACION').Value := IBQCostosVete.FieldValues['OBSERVACIONES'];
    IBDSCostosVete.Post;
    IBQCostosVete.Next;
  end;
  IBDSCostosVete.First;
 // PaintRequired;
end;

procedure TFRepCostosVete.BBImprimirReporteClick(Sender: TObject);
var
  F : TFRepCostosVetePreview;
  cartel : TCartel;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  try
    FPrincipal.IBDPrincipal.ApplyUpdates([IBDSCostosVete]);
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;

  cartel := TCartel.getInstance;
  cartel.abrircartel('Generando reporte de costos sanitarios...');
  F := TFRepCostosVetePreview.Create(self);
  F.IBQCostos.Close;
  F.IBQCostos.Open;
  F.QRLDesde.Caption := DateToStr(Desde);
  F.QRLHasta.Caption := DateToStr(Hasta);
  cartel.cerrarcartel;
  cartel.FreeInstance;
  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFRepCostosVete.IBDSCostosVeteF1SetText(Sender: TField;
  const Text: String);
var
  valor : double;
begin

  inherited;
  if ((IBDSCostosVete.State <> dsInsert) and (UpperCase(Sender.AsString) <> UpperCase(Text))) then
  begin
    if (Sender.FieldName = 'F1') then
      if TryStrToFloat(Text,valor) then
      begin
        Sender.Value := Text;
        IBDSCostosVeteF3.Value := IBDSCostosVeteI1.Value * valor;
      end;

    if (Sender.FieldName = 'F2') then
      if TryStrToFloat(Text,valor) then
        Sender.Value := Text;

    if (Sender.FieldName = 'F3') then
      if TryStrToFloat(Text,valor) then
      begin
        Sender.Value := Text;
        IBDSCostosVeteF1.Value := valor / IBDSCostosVeteI1.Value;
      end;
  end;
end;

procedure TFRepCostosVete.BDBGDatosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.ReadOnly then
    BDBGDatos.Canvas.Brush.Color := clCream
  else
    BDBGDatos.Canvas.Brush.Color := clWindow;

  BDBGDatos.Canvas.FillRect(Rect);
  BDBGDatos.Canvas.Font.Color := clBlack;
  BDBGDatos.Canvas.TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text);
end;

procedure TFRepCostosVete.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFRepCostosVete.IBQCostosVeteAfterOpen(DataSet: TDataSet);
begin
  inherited;
  {BBXls.Enabled := not DataSet.IsEmpty;
  BBImprimirReporte.Enabled := not DataSet.IsEmpty;}
  IPreview.Enabled := not DataSet.IsEmpty;
  LPreview.Enabled := not DataSet.IsEmpty;
  LExpExcel.Enabled := not DataSet.IsEmpty;
  IExpExcel.Enabled := not DataSet.IsEmpty;
end;

procedure TFRepCostosVete.DTPACloseUp(Sender: TObject);
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
end;

procedure TFRepCostosVete.DTPADesdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUp(Sender);
end;

procedure TFRepCostosVete.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFRepCostosVete.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
