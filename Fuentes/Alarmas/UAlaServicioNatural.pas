unit UAlaServicioNatural;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, UPrincipal, UEveServicioBasico,
  IBQuery, Grids, DBGrids, UBDBGrid, DateUtils, Buttons, DBCtrls, UEveEgresoToro,
  UDBLookupComboBoxAuto, UDMSoftvet, UMensajeHuella, UEveEgresoServicio, UEveSimple,
  ImgList, PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls,
  JvLabel, JvGIF;

type
  TFALAServicioNatural = class(TFUniversal)
    PAnimales: TPanel;
    IBQAnimales: TIBQuery;
    DSAnimales: TDataSource;
    DBGAnimales: TDBGrid;
    Label1: TLabel;
    IBSPCerrarServicio: TIBStoredProc;
    GBCerrarServicio: TGroupBox;
    CBCerrar: TCheckBox;
    BBEgresoHembra: TBitBtn;
    BBEgresoToro: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure CBCerrarClick(Sender: TObject);
    procedure BBEgresoHembraClick(Sender: TObject);
    procedure BBEgresoToroClick(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure DBGAnimalesCellClick(Column: TColumn);
  private
    Hoy : TDate;
    ID_Servicio : Integer;
    ID_Grupo : Integer;
    procedure EliminarServicio(F : TFEveServicioBasico);
    procedure HabilitarBotones;
    procedure FilterRecord(DataSet: TDataSet; var Accept: Boolean);
  public
    { Public declarations }
  end;

var
  FALAServicioNatural: TFALAServicioNatural;

implementation

{$R *.dfm}

procedure TFALAServicioNatural.FormShow(Sender: TObject);
begin
  inherited;
  IBQAnimales.Close;
  IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.Open;
  CBCerrarClick(nil);
  IBQAnimales.First;
  DBGAnimalesCellClick(nil);
end;

procedure TFALAServicioNatural.HabilitarBotones;
begin
  BBEgresoHembra.Enabled := CBCerrar.Checked;
  BBEgresoToro.Enabled := CBCerrar.Checked;
end;

procedure TFALAServicioNatural.CBCerrarClick(Sender: TObject);
begin
  inherited;
  if (CBCerrar.Checked) then
  begin
    GBCerrarServicio.Enabled := true;
    HabilitarBotones;
  end
  else
  begin
    GBCerrarServicio.Enabled := false;
    HabilitarBotones;
  end;
end;

procedure TFALAServicioNatural.BBEgresoHembraClick(Sender: TObject);
begin
  inherited;
  EliminarServicio(TFEveEgresoServicio.Create(self));
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFALAServicioNatural.BBEgresoToroClick(Sender: TObject);
begin
  inherited;
  EliminarServicio(TFEveEgresoToro.Create(self));
  try
    IBSPBorrarTablasAuxiliares.Close;
    IBSPBorrarTablasAuxiliares.ExecProc;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFALAServicioNatural.EliminarServicio(F : TFEveServicioBasico);
begin
  DMSoftvet.IBQIngEgrServicio.Close;
  DMSoftvet.IBQIngEgrServicio.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQIngEgrServicio.Open;
  DMSoftvet.IBQIngEgrServicio.Locate('ID_SERVICIO',ID_Servicio,[loCaseInsensitive]);
  F.Hide;
  F.ConManga := true;
  F.ModoEve := meMasivo;
  F.TSServicio.TabVisible := false;
  F.PCBasico.ActivePage := F.TSManga;

  F.MSimple.IBQDisponibles.Filtered := true;
  F.MSimple.IBQDisponibles.OnFilterRecord := FilterRecord;

  F.MSimple.IBQDisponibles.Close;
  F.MSimple.IBQDisponibles.Open;
  F.MSimple.IBQSeleccionados.Close;
  F.MSimple.IBQSeleccionados.Open;
  F.IDServicio := ID_Servicio;
  F.IDGrupo := ID_Grupo;
  F.ConServicio := true;
  F.BDBGServiciosCellClick(nil);
  F.ShowModal;
  F.Destroy;
  IBQAnimales.Close;
  IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.Open;
  if IBQAnimales.IsEmpty then
    Close;
end;

procedure TFALAServicioNatural.IBQAnimalesAfterOpen(DataSet: TDataSet);
begin
  inherited;
   BBEgresoHembra.Enabled:=not DataSet.IsEmpty;
   BBEgresoToro.Enabled:=not DataSet.IsEmpty;
end;

procedure TFALAServicioNatural.DBGAnimalesCellClick(Column: TColumn);
begin
  inherited;
  if IBQAnimales.FieldValues['id_servicio'] <> null then
  begin
    ID_Servicio := IBQAnimales.FieldValues['id_servicio'];
    ID_Grupo := IBQAnimales.FieldValues['grupo'];
  end;
end;

procedure TFALAServicioNatural.FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := DataSet.FieldByName('ID_SERVICIO').AsInteger = ID_Servicio; 
end;

end.
