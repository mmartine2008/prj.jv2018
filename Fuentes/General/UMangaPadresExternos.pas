unit UMangaPadresExternos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, UFrameDBSeleccion, UPrincipal,
  Buttons, IBQuery, UTraduccion, ImgList, PngImageList, pngimage,
  JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFMangaPadresExternos = class(TFUniversal)
    FSPadres: TFrameSeleccion;
    PBotones: TPanel;
    BBAceptar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SeleccionarUnPadre(Sender : TObject);
    procedure BBAceptarClick(Sender: TObject);
  private
    Tipo, Nivel : Integer; //Tipo=(1 macho, 2 hembra) Nivel=(1 Padre, 2 Abuelo, 3 BisAbuelo)
  public

  published
    constructor Create(Owner : TComponent; Sexo, Relacion : integer); reintroduce;
  end;

var
  FMangaPadresExternos: TFMangaPadresExternos;

implementation

{$R *.dfm}

constructor TFMangaPadresExternos.Create(Owner : TComponent; Sexo, Relacion : integer);
begin
  inherited Create(Owner);
  Tipo := Sexo;
  Nivel := Relacion;
end;


procedure TFMangaPadresExternos.FormShow(Sender: TObject);
begin
  inherited;
  case Tipo of
    1 : LTitulo.Caption := Traducir('Manga de Padres');
    2 : LTitulo.Caption := Traducir('Manga de Madres');
  end;
  FSPadres.OnSelectItem := SeleccionarUnPadre;
  FSPadres.IBQDisponibles.Close;
  FSPadres.IBQDisponibles.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  FSPadres.IBQDisponibles.ParamByName('SEXO').AsInteger := Tipo;
  FSPadres.IBQDisponibles.Open;
  FSPadres.IBQSeleccionados.Close;
  FSPadres.IBQSeleccionados.ParamByName('NIVEL').AsInteger := Nivel;
  FSPadres.IBQSeleccionados.ParamByName('SEXO').AsInteger := Tipo;
  FSPadres.IBQSeleccionados.Open;
end;

procedure TFMangaPadresExternos.SeleccionarUnPadre(Sender : TObject);
begin
  if not FSPadres.IBQSeleccionados.Active then
    FSPadres.IBQSeleccionados.Open;
  FSPadres.IBQSeleccionados.Insert;
  FSPadres.IBQSeleccionados.FieldByName('ID_ANIMAL_EXTERNO').Value := FSPadres.IBQDisponibles.FieldValues['ID_ANIMAL_EXTERNO'];
  FSPadres.IBQSeleccionados.FieldByName('ID_AUX').Value := Nivel;
  FSPadres.IBQSeleccionados.FieldByName('ID_RP').Value := FSPadres.IBQDisponibles.FieldValues['ID_RP'];
  FSPadres.IBQSeleccionados.FieldByName('NOMBRE').Value := FSPadres.IBQDisponibles.FieldValues['NOMBRE'];
  FSPadres.IBQSeleccionados.FieldByName('SEXO').Value := FSPadres.IBQDisponibles.FieldValues['SEXO'];
end;

procedure TFMangaPadresExternos.BBAceptarClick(Sender: TObject);
begin
  inherited;
  Close();
end;

end.
