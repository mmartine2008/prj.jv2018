unit UREPABSospechozasAborto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons,
  Grids, DBGrids, UBDBGrid, DB, IBCustomDataSet, IBQuery, IBStoredProc,
  DataExport, DataToXLS, WinXP, UMensajeImpresora, JvGIF,
  PngImage, jpeg, JvExControls, JvLabel, ImgList, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFREPABSospechozasAborto = class(TFUniversal)
    ASalir: TAction;
    AImprimirReporte: TAction;
    GBAnimales: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    DSAnimales: TDataSource;
    IBQAnimales: TIBQuery;
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
    procedure ASalirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure BDBGAnimalesKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREPABSospechozasAborto: TFREPABSospechozasAborto;

implementation

uses UPrincipal, uTiposGlobales, UREPABSospechozasAbortoPreview, UREPFichaAnimal, UCartel, UTraduccion;

{$R *.dfm}

procedure TFREPABSospechozasAborto.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close;
end;

procedure TFREPABSospechozasAborto.FormCreate(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  inherited;
  cartel:= TCartel.getInstance();
  msje:= 'Calculando Sospechosas de Aborto ...';
  cartel.abrircartel(msje);
  IBQAnimales.Close;
  IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.Open;
  cartel.cerrarcartel();
  cartel.FreeInstance(); 
end;

procedure TFREPABSospechozasAborto.AImprimirReporteExecute(Sender: TObject);
var
  cartel : TCartel;
begin
  MostrarMensajeImpresion();
  inherited;
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  cartel.abrircartel('Generando Reporte de Sospechosas de Aborto ...');

  cartel.cerrarcartel();
  cartel.FreeInstance();

  Application.CreateForm(TFREPABSospechozasAbortoPreview, FREPABSospechozasAbortoPreview);
  FREPABSospechozasAbortoPreview.ShowModal;
  HabilitarDesabilitarControles();
end;

procedure TFREPABSospechozasAborto.IBQAnimalesAfterOpen(DataSet: TDataSet);

begin
  inherited;

  IBQAnimales.Last;
  IBQAnimales.First;
  BDBGAnimales.DataSource := DSAnimales;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQAnimales.RecordCount)+']';
  {AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);}
  IPreview.Enabled := not(IBQAnimales.IsEmpty);
  LPreview.Enabled := not(IBQAnimales.IsEmpty);
  LExpExcel.Enabled := not(IBQAnimales.IsEmpty);
  IExpExcel.Enabled := not(IBQAnimales.IsEmpty);
end;

procedure TFREPABSospechozasAborto.BDBGAnimalesDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if BDBGAnimales.SelectedIndex = 0 then
    if not(IBQAnimales.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQAnimales.fieldByName('ID_ANIMAL').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPABSospechozasAborto.BBXlsClick(Sender: TObject);
begin
  inherited;
  if SDXLS.Execute then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPABSospechozasAborto.BDBGAnimalesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BDBGAnimalesDblClick(nil);
end;

end.
