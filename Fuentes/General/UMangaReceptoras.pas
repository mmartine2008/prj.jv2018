unit UMangaReceptoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, UFrameMangazo, IBQuery, WinXP, DataExport, DBGrids,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  StdCtrls, ExtCtrls, Buttons, ImgList, PngImageList, pngimage,
  JvExExtCtrls, JvImage, JvExControls, JvLabel, JvGIF;

type
  TFMangaReceptoras = class(TFUniversal)
    Manga: TMangazo;
    PBotones: TPanel;
    BBCancelar: TBitBtn;
    BBAceptar: TBitBtn;
    PMensaje: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure MangaBDBGDisponiblesCellClick(Column: TColumn);
    procedure MangaIBQSeleccionadosBeforePost(DataSet: TDataSet);
    procedure BBAceptarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure MangaIBQSeleccionadosBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Embrion : Integer;
    RPMadre, Padres, Info : String;
  end;

var
  FMangaReceptoras: TFMangaReceptoras;

implementation

{$R *.dfm}

uses
  UPrincipal;

procedure TFMangaReceptoras.FormCreate(Sender: TObject);
begin
  inherited;
  Manga.SQLBasico := 'select id_animal, id_rp, id_senasa from vis_transferencia';
  Manga.PasarParametros(5,5);
  Manga.EsSimple := true;
  Manga.IBQDisponibles.Close;
  Manga.IBQDisponibles.Open;
  Manga.IBQSeleccionados.Close;
  Manga.IBQSeleccionados.Open;
  Manga.RBTodasClick(nil);
end;

procedure TFMangaReceptoras.FormShow(Sender: TObject);
begin
  inherited;
  Manga.IBQSeleccionados.Close;
  Manga.IBQSeleccionados.Open;
end;

procedure TFMangaReceptoras.MangaBDBGDisponiblesCellClick(Column: TColumn);
begin
  inherited;
  Manga.BDBGDisponiblesCellClick(Column);
  Manga.BBAgregarUno.Enabled := Manga.IBQSeleccionados.IsEmpty;
end;

procedure TFMangaReceptoras.MangaIBQSeleccionadosBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  Manga.IBQSeleccionados.FieldValues['VUNO1'] := 'S';
  Manga.IBQSeleccionados.FieldValues['ORIGEN_ANIMAL'] := Embrion;
  Manga.IBQSeleccionados.FieldValues['V1'] := RPMadre;
  Manga.IBQSeleccionados.FieldValues['V2'] := Padres;
  Manga.IBQSeleccionados.FieldValues['V3'] := Info;
end;

procedure TFMangaReceptoras.BBAceptarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFMangaReceptoras.BBCancelarClick(Sender: TObject);
begin
  inherited;
  try
    Manga.IBQSeleccionados.Delete;
    FPrincipal.IBDPrincipal.ApplyUpdates([Manga.IBQSeleccionados]);
  except
  end;
  Close;
end;

procedure TFMangaReceptoras.MangaIBQSeleccionadosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  Manga.IBQSeleccionados.ParamByName('id').AsInteger := Embrion;
end;

end.
