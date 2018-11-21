unit USelTipoRepMapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls,
  jpeg, PngImage, ExtCtrls, StdCtrls, JvGIF, UMapaGoogle, ImgList,
  PngImageList, JvExControls, JvLabel;

type
  TFSelTipoRepMapa = class(TFUniversal)
    PCli: TPanel;
    IPlotter: TImage;
    IMapaSolo: TImage;
    IMapaDetalle: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    IBQDatosEstaGlobal: TIBQuery;
    IBQDatosEstaGlobalHAS: TFloatField;
    IBQDatosEstaGlobalCAB_HAS: TFloatField;
    IBQDatosEstaGlobalCANT_ANIMALES: TIntegerField;
    IBQDatosEstaGlobalTOTAL_POTREROS: TIntegerField;
    SDImagen: TSaveDialog;
    procedure IPlotterClick(Sender: TObject);
    procedure IMapaSoloClick(Sender: TObject);
    procedure IMapaDetalleClick(Sender: TObject);
  private
    Mapa : TFMapaGoogle;
  public
    { Public declarations }
  published
    constructor Create(Owner : TComponent; M : TFMapaGoogle); reintroduce;
  end;

var
  FSelTipoRepMapa: TFSelTipoRepMapa;

implementation

{$R *.dfm}

uses
  URepMapaPreview, UMapa, UPrincipal, UCartel;

constructor TFSelTipoRepMapa.Create(Owner : TComponent; M : TFMapaGoogle);
begin
  inherited Create(Owner);
  Mapa := M;
end;

procedure TFSelTipoRepMapa.IPlotterClick(Sender: TObject);
var
  C : TCartel;
begin
  inherited;
  if SDImagen.Execute then
  begin
    C := TCartel.getInstance;
    C.abrircartel('Se está generando el archivo');
    Mapa.ArmarImagenesGlobal(3000,3000,SDImagen.FileName);
    C.cerrarcartel;
    C.FreeInstance;
  end;
  Close;
end;

procedure TFSelTipoRepMapa.IMapaSoloClick(Sender: TObject);
var
  F : TFREPMapaPreview;
  C : TCartel;
  has : double;
begin
  inherited;
  C := TCartel.getInstance;
  C.abrircartel('Generando mapa simple del establecimiento');
  F := TFREPMapaPreview.Create(self);
  F.Tipo := 1;
  Mapa.ArmarImagenesGlobal(1033,505,ExtractFilePath(Application.ExeName)+FPrincipal.NombreEstablecimiento+'.bmp');
  F.IBQImagenes.Close;
  F.IBQImagenes.Open;
  F.QRIMapaGlobal.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+FPrincipal.NombreEstablecimiento+'.bmp');
  F.QRLNomEstab.Caption := FPrincipal.NombreEstablecimiento;
  IBQDatosEstaGlobal.Close;
  IBQDatosEstaGlobal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosEstaGlobal.Open;
  if not IBQDatosEstaGlobal.IsEmpty then
  begin
    F.QRLCabTotal.Caption := IntToStr(IBQDatosEstaGlobal.FieldValues['cant_animales']);
    F.QRLCabHasTotal.Caption := FormatFloat('#0.##',IBQDatosEstaGlobal.FieldValues['cab_has']);
    if VarIsNull(IBQDatosEstaGlobal.FieldValues['has']) then
         has := 0
      else
         has := IBQDatosEstaGlobal.FieldValues['has'];
    F.QRLSupAproxTotal.Caption := floatToStr(has);
    F.QRLTotalPots.Caption := IntToStr(IBQDatosEstaGlobal.FieldValues['total_potreros']);
  end;
  C.cerrarcartel;
  C.FreeInstance;
  F.ShowModal;
  F.Destroy;
  Close;
end;

procedure TFSelTipoRepMapa.IMapaDetalleClick(Sender: TObject);
var
  F : TFREPMapaPreview;
  C : TCartel;
begin
  inherited;
  C := TCartel.getInstance;
  C.abrircartel('Generando mapa detallado del establecimiento');
  F := TFREPMapaPreview.Create(self);
  F.Tipo := 0;
  Mapa.ArmarImagenes;
  Mapa.ArmarImagenesGlobal(1033,505,ExtractFilePath(Application.ExeName)+FPrincipal.NombreEstablecimiento+'.bmp');
  F.IBQImagenes.Close;
  F.IBQImagenes.Open;
  F.QRIMapaGlobal.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+FPrincipal.NombreEstablecimiento+'.bmp');
  F.QRLNomEstab.Caption := FPrincipal.NombreEstablecimiento;
  IBQDatosEstaGlobal.Close;
  IBQDatosEstaGlobal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosEstaGlobal.Open;
  if not IBQDatosEstaGlobal.IsEmpty then
  begin
    F.QRLCabTotal.Caption := IntToStr(IBQDatosEstaGlobal.FieldValues['cant_animales']);
    F.QRLCabHasTotal.Caption := FormatFloat('#0.##',IBQDatosEstaGlobal.FieldValues['cab_has']);
    F.QRLSupAproxTotal.Caption := IntToStr(IBQDatosEstaGlobal.FieldValues['has']);
    F.QRLTotalPots.Caption := IntToStr(IBQDatosEstaGlobal.FieldValues['total_potreros']);
  end;
  C.cerrarcartel;
  C.FreeInstance;
  F.ShowModal;
  F.Destroy;
  Close;
end;

end.
