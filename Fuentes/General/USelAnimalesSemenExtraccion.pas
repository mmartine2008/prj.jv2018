unit USelAnimalesSemenExtraccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, PngImage, jpeg, ExtCtrls, Grids, DBGrids, UBDBGrid, ImgList,
  PngImageList, JvGIF, JvExExtCtrls, JvImage;

type
  TFSelAnimalesSemenExtraccion = class(TFUniversal)
    Ptop: TPanel;
    LSeleccion: TLabel;
    IBuscar: TImage;
    LBuscar: TLabel;
    EBuscar: TEdit;
    PCli: TPanel;
    LCantidad: TLabel;
    BDBGAnimales: TBitDBGrid;
    PBottom: TPanel;
    IFondoB: TImage;
    IElegir: TImage;
    ICancelar: TImage;
    LCancelar: TLabel;
    LElegir: TLabel;
    IAgregarAnimal: TImage;
    LAgregarAnimal: TLabel;
    IBQSelAnimalesInternos: TIBQuery;
    DSSelecAnimales: TDataSource;
    LBuscarPor: TLabel;
    procedure IBuscarClick(Sender: TObject);
    procedure BDBGAnimalesCellClick(Column: TColumn);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure IElegirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure IAgregarAnimalClick(Sender: TObject);
    procedure EBuscarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure ActivarQuery(query : string);
  public
    { Public declarations }
    id_animal : integer;
  end;

var
  FSelAnimalesSemenExtraccion: TFSelAnimalesSemenExtraccion;
  consulta : string;

implementation

uses UPrincipal,uTiposGlobales, UEveAltaDirecta;

{$R *.dfm}

procedure TFSelAnimalesSemenExtraccion.IBuscarClick(Sender: TObject);
var sql2, sql1 : string;
begin
  inherited;
  if (EBuscar.Text <> '') then
  begin
    sql2 := ' and ((A.ID_RP LIKE ''%' +EBuscar.Text+ '%'') OR (A.NOMBRE LIKE ''%' +EBuscar.Text+ '%'') OR (A.APODO LIKE ''%' +EBuscar.Text+ '%'') OR (A.ID_HBA LIKE ''%' +EBuscar.Text+ '%''))';
    sql1 := consulta + sql2;
    ActivarQuery(sql1);
  end
  else
    ActivarQuery(consulta);

end;

procedure TFSelAnimalesSemenExtraccion.ActivarQuery(query : string);
begin
  IBQSelAnimalesInternos.Close;
  IBQSelAnimalesInternos.SQL.Clear;
  IBQSelAnimalesInternos.SQL.Add(query);
  // Juan 3Oct2013 : Error al añadir el order by id_rp
//  IBQSelAnimalesInternos.SQL.Append(' order by id_rp');
  IBQSelAnimalesInternos.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSelAnimalesInternos.Open;
  IBQSelAnimalesInternos.Last;
  IBQSelAnimalesInternos.First;

  LCantidad.Caption := 'Cantidad de Animales: '+IntToStr(IBQSelAnimalesInternos.RecordCount);
end;

procedure TFSelAnimalesSemenExtraccion.BDBGAnimalesCellClick(Column: TColumn);
begin
  inherited;

  id_animal := IBQSelAnimalesInternos.FieldValues['id_animal'];
end;

procedure TFSelAnimalesSemenExtraccion.BDBGAnimalesDblClick(Sender: TObject);
begin
  inherited;
  BDBGAnimalesCellClick(nil);
  close();
end;

procedure TFSelAnimalesSemenExtraccion.IElegirClick(Sender: TObject);
begin
  inherited;
  BDBGAnimalesCellClick(nil);
  close();
end;

procedure TFSelAnimalesSemenExtraccion.FormShow(Sender: TObject);
begin
  inherited;

  id_animal := -1;

  consulta := IBQSelAnimalesInternos.SQL.GetText;

  ActivarQuery(consulta);
end;

procedure TFSelAnimalesSemenExtraccion.ICancelarClick(Sender: TObject);
begin
  inherited;
  close();
end;

procedure TFSelAnimalesSemenExtraccion.IAgregarAnimalClick(Sender: TObject);
var F : TFEveAltaDirecta;
begin
  inherited;

  F := TFEveAltaDirecta.Create(self);
  F.ShowModal;

  ActivarQuery(consulta);

  try
    id_animal := F.ID_Animal;
    if (id_animal <> -1) then
      IBQSelAnimalesInternos.Locate('id_animal',id_animal,[loCaseInsensitive]);
  except
  end;

  F.Destroy;

end;

procedure TFSelAnimalesSemenExtraccion.EBuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  if (key = #13) then
  begin
       IBuscarClick(sender);
       key := #0; 
  end;
end;

end.
