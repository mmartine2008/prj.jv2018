  unit UMensajeGuardarVincular;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, pngimage,
  JvExExtCtrls, JvImage, JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF,
  Buttons;

type
  TFMensajeGuardarVincular = class(TFUniversal)
    Label1: TLabel;
    bAltaElectronica: TBitBtn;
    bVincularExistente: TBitBtn;
    bCancelar: TBitBtn;
    LNumIe: TLabel;
    IBQActCaravana: TIBQuery;
    IAlta: TImage;
    IVincular: TImage;
    ICancelar: TImage;
    LAlta: TLabel;
    Label2: TLabel;
    LCancelar: TLabel;
    IBQAccion: TIBQuery;
    procedure bCancelarClick(Sender: TObject);
    procedure bAltaElectronicaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bVincularExistenteClick(Sender: TObject);
    procedure ActualizarCaravana(caravana: String);
  private

    { Private declarations }
  public
  { Public declarations }
  daDeAlta: Boolean;
  vincula: Boolean;
  idCargaElectronica : String;
  function agregoOvinculo(id_e : String): Boolean;
  end;

var
  FMensajeGuardarVincular: TFMensajeGuardarVincular;

implementation

uses UPrincipal, UPosiblesMadres, Math, UMensajeHuella;

{$R *.dfm}

function TFMensajeGuardarVincular.agregoOvinculo(id_e : String): Boolean;
begin
  IBQAccion.Close;
  IBQAccion.ParamByName('i').AsString := id_e;
  IBQAccion.ParamByName('e').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAccion.Open;
  if (IBQAccion.RecordCount = 1) then
    Result := true
  else
    Result := false;
end;

procedure TFMensajeGuardarVincular.bCancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFMensajeGuardarVincular.bAltaElectronicaClick(Sender: TObject);
begin
  inherited;
  daDeAlta := true;
  FPrincipal.JvICargaIndividualClick(self);
  if (FPrincipal.TimerLector.Enabled) then
    FPrincipal.TimerLector.Enabled := false;
  close;
end;

procedure TFMensajeGuardarVincular.FormShow(Sender: TObject);
begin
  inherited;
  LNumIe.Caption := lnumie.Caption + ' ' + idCargaElectronica;
  daDeAlta := false;
  vincula := false;
end;

procedure TFMensajeGuardarVincular.ActualizarCaravana(caravana : String);
var
  SQLInt : String;
  SQLExt : String;
  F : TFPosiblesMadres;
  id_madreB : Integer;
begin
  inherited;
  //FrameSeleccionPadres.IBQDisponibles.Close;
  //SQLInt := 'select id_animal as id, id_rp, id_hba, nombre, apodo, ''INTERNA'' as Tipo from tab_animales where (id_rp like :rp or id_hba like :rp or nombre like :nom or apodo like :nom) and Activo = ''S'' and establecimiento = :est and id_ie is not null and id_ie = :v';
  SQLInt := 'select id_animal as id, id_rp, id_hba, nombre, apodo, ''INTERNA'' as Tipo from tab_animales where establecimiento = :est and (nombre <> :nom or nombre is null) and (id_ie is null or id_ie = :v) and activo = :a and id_rp like :rp';
  F := TFPosiblesMadres.Create(self);
  F.IBQMBiologica.Close;
  F.IBQMBiologica.SQL.Clear;
  F.IBQMBiologica.SQL.Add(SQLInt);
  F.IBQMBiologica.ParamByName('est').AsInteger:= FPrincipal.EstablecimientoActual;
  F.IBQMBiologica.ParamByName('v').AsString := '';
  F.IBQMBiologica.ParamByName('nom').AsString := 'N/N';
  F.IBQMBiologica.ParamByName('a').AsString := 'S';
  F.IBQMBiologica.ParamByName('rp').AsString := '%';
  F.IBQMBiologica.Open;
  F.IBQMBiologica.Last;
  F.IBQMBiologica.First;
  if not F.IBQMBiologica.IsEmpty then
  begin
    if F.IBQMBiologica.RecordCount > 0 then
    begin
      F.LSeleccion.Caption := 'Seleccione el animal';
      F.LBuscarMBiolo.Caption := 'Buscar Animal';
      F.LTitulo.Caption := 'Seleccione el animal';
      F.PTitulo.Caption := 'Seleccione el animal';
      F.LElegir.Caption := 'Seleccionar animal';
      F.ShowModal;
      id_madreB := F.id_madre;
      if id_madreB > -1 then
      begin
          IBQActCaravana.Close;
          IBQActCaravana.ParamByName('caravana').AsString := caravana;
          IBQActCaravana.ParamByName('id').AsInteger := id_madreB;
          IBQActCaravana.ExecSQL;
          IBQActCaravana.Transaction.Commit;
          IBQActCaravana.Transaction.StartTransaction;
//          IBQActCaravana.Close;
//          IBQActCaravana.Open;
//          FPrincipal.IBTPrincipal.Commit;
//          FPrincipal.IBTPrincipal.StartTransaction;

//          FPrincipal.IBTPrincipal.Commit;
//          FPrincipal.IBTPrincipal..Active := True;
{
        try
          IBQActCaravana.Close;
          IBQActCaravana.ParamByName('caravana').AsString := caravana;
          IBQActCaravana.ParamByName('id').AsInteger := id_madreB;
          IBQActCaravana.Open;
          FPrincipal.IBTPrincipal.CommitRetaining;
        except;
          FPrincipal.IBTPrincipal.RollbackRetaining;
        end;
        }
      end;

   end;

  end
  else
    MostrarMensaje(tmInformacion,'No existen animales cargados en el sistema que no posean I.E.');
end;


procedure TFMensajeGuardarVincular.bVincularExistenteClick(
  Sender: TObject);
var caravana: String;
begin
  inherited;
  vincula := true;
  caravana := idCargaElectronica;
  ActualizarCaravana(caravana);
  close;
end;

end.
