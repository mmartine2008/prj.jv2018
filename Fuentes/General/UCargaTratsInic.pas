unit UCargaTratsInic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, PngImage, jpeg, Grids, BaseGrid, AdvGrid,
  JvExExtCtrls, JvImage, ImgList, PngImageList;

type

  TRecProductos = record
    id_prod : Integer;
    tipo_t : Integer;
    dosis : double;
    serie : String;
    Vencimiento : TDate;
  end;

  TArrProductos = Array of TRecProductos;
  
  TFCargaTratsInic = class(TFUniversal)
    PBotones: TPanel;
    Image1: TImage;
    IAceptar: TImage;
    K: TImage;
    LAceptar: TLabel;
    LCancelar: TLabel;
    PCli: TPanel;
    SG1: TAdvStringGrid;
    IBQSYSProInic: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    IModificar: TImage;
    LModificar: TLabel;
    CBCarabana: TCheckBox;
    RBExportacion: TRadioButton;
    RBConsumo: TRadioButton;
    CBBoton: TCheckBox;
    procedure IAceptarClick(Sender: TObject);
    procedure KClick(Sender: TObject);
    procedure IModificarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ActualizarGrilla;
    function CalcularDosis(peso : Double; trat : Integer) : Double;
  public
    Productos : TArrProductos;
    Resultado : Integer;
    Peso : Double;
  end;

var
  FCargaTratsInic: TFCargaTratsInic;

implementation

{$R *.dfm}

uses
  UPrincipal, UConfigProInic, UDMSoftvet, UMensajeHuella;

procedure TFCargaTratsInic.ActualizarGrilla;
var
  I : Integer;
begin
  inherited;
  IBQSYSProInic.Close;
  IBQSYSProInic.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSYSProInic.Open;
  IBQSYSProInic.First;
  MostrarMensaje(tmError,'BUG : IBQTratTodos Vacio. Retomar version anterior del SVN!');
  DMSoftvet.IBQTratTodos.Close;
  DMSoftvet.IBQTratTodos.Open;

  SG1.Height := 44;
  SG1.Clear;
  SG1.RowCount := 2;

  SG1.Cells[0,0] := 'TRATAMIENTO';
  SG1.CellProperties[0,0].Alignment := taCenter;
  SG1.CellProperties[0,0].FontStyle := [fsBold];
  SG1.CellProperties[0,0].ReadOnly := true;
  SG1.CellProperties[0,0].FontColor := clWhite;
  SG1.Cells[1,0] := 'DOSIS';
  SG1.CellProperties[1,0].Alignment := taCenter;
  SG1.CellProperties[1,0].FontStyle := [fsBold];
  SG1.CellProperties[1,0].ReadOnly := true;
  SG1.CellProperties[1,0].FontColor := clWhite;
  SG1.Cells[2,0] := 'SERIE';
  SG1.CellProperties[2,0].Alignment := taCenter;
  SG1.CellProperties[2,0].FontStyle := [fsBold];
  SG1.CellProperties[2,0].ReadOnly := true;
  SG1.CellProperties[2,0].FontColor := clWhite;
  SG1.Cells[3,0] := 'VENCIMIENTO';
  SG1.CellProperties[3,0].Alignment := taCenter;
  SG1.CellProperties[3,0].FontStyle := [fsBold];
  SG1.CellProperties[3,0].ReadOnly := true;
  SG1.CellProperties[3,0].FontColor := clWhite;

  I := 0;
  while not IBQSYSProInic.Eof do
  begin
    SetLength(Productos,I+1);
    Productos[I].id_prod := IBQSYSProInic.FieldValues['PRODUCTO'];
    Productos[I].tipo_t := IBQSYSProInic.FieldValues['TIPO_TRAT'];
    Productos[I].dosis := CalcularDosis(Peso,IBQSYSProInic.FieldValues['PRODUCTO']);
    Productos[I].serie := '';
    Productos[I].Vencimiento := Date;

    SG1.Cells[0,I+1] := IBQSYSProInic.FieldValues['NOMBRE'];
    SG1.Cells[1,I+1] := FormatFloat('##.##',Productos[I].dosis);
    SG1.Cells[2,I+1] := Productos[I].serie;
    SG1.Cells[3,I+1] := DateToStr(Productos[I].Vencimiento);

    SG1.CellProperties[0,I+1].ReadOnly := true;
    SG1.CellProperties[1,I+1].Alignment := taCenter;
    SG1.CellProperties[1,I+1].BrushColor := clMoneyGreen;
    SG1.CellProperties[1,I+1].ReadOnly := false;
    SG1.CellProperties[2,I+1].Alignment := taCenter;
    SG1.CellProperties[2,I+1].BrushColor := clMoneyGreen;
    SG1.CellProperties[2,I+1].ReadOnly := false;
    SG1.CellProperties[3,I+1].Alignment := taCenter;
    SG1.CellProperties[3,I+1].ReadOnly := false;
    SG1.CellProperties[3,I+1].BrushColor := clMoneyGreen;

    SG1.RowCount := SG1.RowCount + 1;
    Inc(I);
    IBQSYSProInic.Next;

    SG1.Height := SG1.Height + SG1.RowHeights[0];
  end;
  I := SG1.RowCount-1;
  SG1.RowCount := SG1.RowCount - 1;
  SG1.Height := SG1.Height - SG1.RowHeights[0];
  SG1.SelectRange(1,1,1,1);

  CBCarabana.Top := SG1.Top+SG1.Height+10;
  CBBoton.Top := CBCarabana.Top+CBCarabana.Height+5;
  RBExportacion.Top := CBBoton.Top+CBBoton.Height+5;
  RBConsumo.Top := RBExportacion.Top; 

end;

procedure TFCargaTratsInic.IAceptarClick(Sender: TObject);
var
  I : Integer;
begin
  inherited;
  for I := 0 to SG1.RowCount - 5 do
  begin
    if SG1.Cells[1,I+1] = '' then
      Productos[I].dosis := 0
    else
      Productos[I].dosis := StrToFloat(SG1.Cells[1,I+1]);
    Productos[I].serie := SG1.Cells[2,I+1];
    Productos[I].Vencimiento := StrToDate(SG1.Cells[3,I+1]);
  end;
  Resultado := 1;
  Close;
end;

procedure TFCargaTratsInic.KClick(Sender: TObject);
begin
  inherited;
  Resultado := 0;
  Close;
end;

procedure TFCargaTratsInic.IModificarClick(Sender: TObject);
var
  F : TFConfigProInic;
begin
  inherited;
  F := TFConfigProInic.Create(self);
  F.ShowModal;
  F.Destroy;
  ActualizarGrilla;
end;

function TFCargaTratsInic.CalcularDosis(peso : Double; Trat: Integer) : Double;
var
  dosis : Variant;
  kg : Variant;
  res : Double;
  I : Integer;
begin
  dosis := DMSoftvet.IBQTratTodos.Lookup('id_tratamiento',trat,'dosis');
  kg := DMSoftvet.IBQTratTodos.Lookup('id_tratamiento',trat,'kg_dosis');
  res := 0;
  if dosis <> null then
  begin
    if kg > 1 then
    begin
      res := (peso * dosis) / kg;
    end
    else
      res := dosis;
  end;
  Result := res;
end;

procedure TFCargaTratsInic.FormShow(Sender: TObject);
begin
  inherited;
  ActualizarGrilla;
end;

end.
