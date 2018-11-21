unit UEveServicioBasico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEveSimple, DB, IBCustomDataSet, IBQuery, ActnList, ComCtrls,
  Grids, DBGrids, UBDBGrid, StdCtrls, MemoAuto, Buttons,
  ExtCtrls, DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, IBDatabase,
  IBStoredProc, UFrameMangazo, DataExport, DataToXLS, Math, WinXP, EditAuto,
  ImgList, PngImageList, JvExControls, JvLabel, PngImage, JvExExtCtrls,
  JvImage, jpeg, JvGIF, JvComponentBase, JvBalloonHint, xmldom, XMLIntf,
  msxmldom, XMLDoc, Menus;

type
  TFEveServicioBasico = class(TFEveSimple)
    TSServicio: TTabSheet;
    LFecha: TLabel;
    LResponsable: TLabel;
    DTPAFecha: TDateTimePickerAuto;
    DBLCBAResponsable: TDBLookupComboBoxAuto;
    BDBGServicios: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure BDBGServiciosCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure PCBasicoChange(Sender: TObject);
    procedure TSMangaShow(Sender: TObject);
    procedure DTPAFechaChange(Sender: TObject);
  private
  protected
    FSQLInicial: String;
  public
    IDPotrero : Integer;
    IDServicio: Integer;
    IDGrupo: integer;
    ConServicio : Boolean;
  end;

var
  FEveServicioBasico: TFEveServicioBasico;

implementation

{$R *.dfm}
uses UPrincipal,uTiposGlobales,UDMSoftvet, UMensajeHuella;

(*
 Activa los queries sin necesidad de hacerlo en cada uno de los hijos
*)
procedure TFEveServicioBasico.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQResponsable.Close;
  DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').Value := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQResponsable.Open;
  DMSoftvet.IBQIngEgrServicio.Close;
  DMSoftvet.IBQIngEgrServicio.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQIngEgrServicio.Open;
  ConServicio := false;
  DTPAFecha.Date := now;
end;

procedure TFEveServicioBasico.BDBGServiciosCellClick(Column: TColumn);
begin
  inherited;
  IDPotrero := DMSoftvet.IBQIngEgrServicio.FieldValues['id_potrero'];
  IDServicio :=DMSoftvet.IBQIngEgrServicio.FieldValues['id_servicio'];
  IDGrupo:=DMSoftvet.IBQIngEgrServicio.FieldValues['grupo'];
end;

procedure TFEveServicioBasico.FormShow(Sender: TObject);

begin
  inherited;
  //DTPAFecha.MaxDate:= now;    
  BDBGServicios.DataSource.DataSet.First;
  if(TSServicio.TabVisible)then
     BDBGServicios.SetFocus;
  if not ConServicio then
    BDBGServiciosCellClick(BDBGServicios.Columns.Items[1]);
end;

procedure TFEveServicioBasico.PCBasicoChange(Sender: TObject);
begin
inherited;
 //  MSimple.RBTodas.Checked := false;   //fijarse si está bien
 //  MSimple.RBTodas.Checked := true;
end;

procedure TFEveServicioBasico.TSMangaShow(Sender: TObject);
begin
  inherited;
  //MSimpleRBTodasClick(self);
end;

procedure TFEveServicioBasico.DTPAFechaChange(Sender: TObject);
var
  fecha : TDateTimePickerAuto;
begin
  inherited;
  fecha := Sender as TDateTimePickerAuto;
  if(fecha.Date > now) then
      fecha.Date:=now;

end;

end.
