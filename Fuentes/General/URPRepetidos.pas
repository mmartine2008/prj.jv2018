unit URPRepetidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, DB, StdCtrls, IBQuery, WinXP, DataExport, DataToXLS,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, ExtCtrls, UPrincipal,
  Grids, DBGrids, UBDBGrid, UTraduccion, ImgList, PngImageList,
  JvExControls, JvLabel, JvGIF, PngImage, jpeg, JvExExtCtrls, JvImage;

type
  TFRpRepetidos = class(TFUniversal)
    PTop: TPanel;
    PBot: TPanel;
    PCli: TPanel;
    BAceptar: TButton;
    IBQRpRepetidos: TIBQuery;
    DSRpRepetidos: TDataSource;
    BDBGRpRepetidos: TBitDBGrid;
    LInfo: TLabel;
    RGOpciones: TRadioGroup;
    IBot: TImage;
    IAceptar: TImage;
    LAceptar: TLabel;
    procedure FormShow(Sender: TObject);
    procedure RGOpcionesClick(Sender: TObject);
    procedure BDBGRpRepetidosCellClick(Column: TColumn);
    procedure BAceptarClick(Sender: TObject);
  private
    RP_Animal : String;
    Resultado : Integer;
    Vista : String;
  public
    function Obtener_ID() : Integer;
  published
    constructor Create(Sender: TObject; RP, Vis : String); reintroduce;
  end;

var
  FRpRepetidos: TFRpRepetidos;

implementation

{$R *.dfm}

constructor TFRpRepetidos.Create(Sender: TObject; RP, Vis : String);
begin
  inherited Create(Sender as TComponent);
  RP_Animal := RP;
  Vista := Vis;
end;


procedure TFRpRepetidos.FormShow(Sender: TObject);
var
  SQL1, SQL2 : String;
begin
  inherited;
  try
    SQl1 := 'select v.id_animal, v.id_rp, v.id_hba, v.fecha_nacimiento, cc.nombre, cr.codigo from '+Vista+' v join cod_categorias cc on ';
    SQl2 := 'cc.id_categoria = v.categoria join cod_razas cr on cr.id_raza = v.raza where v.id_rp like :rp and v.establecimiento = :esta';
    Resultado := -1;
    LInfo.Caption := Traducir('El RP: ')+RP_Animal+Traducir(' se encuentra repetido, seleccione una opción');
    IBQRpRepetidos.Close;
    IBQRpRepetidos.SQL.Clear;
    IBQRpRepetidos.SQL.Add(SQL1+SQL2);
    IBQRpRepetidos.ParamByName('rp').AsString := RP_Animal;
    IBQRpRepetidos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQRpRepetidos.Open;
  except
  end;
end;

function TFRpRepetidos.Obtener_ID : Integer;
begin
  Result := Resultado;
end;

procedure TFRpRepetidos.RGOpcionesClick(Sender: TObject);
begin
  inherited;
  BDBGRpRepetidos.Enabled := RGOpciones.ItemIndex = 1;
  LAceptar.Visible := true;
  IAceptar.Visible := true;
  case RGOpciones.ItemIndex of
    0 : Resultado := -1;
    1 :begin
        IBQRpRepetidos.First;
        Resultado := IBQRpRepetidos.FieldValues['id_animal'];
        //BAceptar.Enabled := false;
        LAceptar.Visible := false;
        IAceptar.Visible := false;
      end;
    2 : Resultado := 0;
  end;
end;

procedure TFRpRepetidos.BDBGRpRepetidosCellClick(Column: TColumn);
begin
  inherited;
  IAceptar.Visible := true;
  LAceptar.Visible := true;
  Resultado := IBQRpRepetidos.FieldValues['id_animal'];
end;

procedure TFRpRepetidos.BAceptarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.

