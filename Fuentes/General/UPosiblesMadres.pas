unit UPosiblesMadres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, PngImage, jpeg, ExtCtrls, Grids, DBGrids, UBDBGrid, ImgList,
  PngImageList, JvGIF, JvExExtCtrls, JvImage, StrUtils;

type
  TFPosiblesMadres = class(TFUniversal)
    IBQMBiologica: TIBQuery;
    DSMBiologica: TDataSource;
    Ptop: TPanel;
    PBottom: TPanel;
    IFondoB: TImage;
    PCli: TPanel;
    BDBGBiologica: TBitDBGrid;
    LSeleccion: TLabel;
    IElegir: TImage;
    ICancelar: TImage;
    LCancelar: TLabel;
    LElegir: TLabel;
    Label4: TLabel;
    EBiologica: TEdit;
    IBuscarMBio: TImage;
    LBuscarMBiolo: TLabel;
    LCantBio: TLabel;
    procedure BDBGBiologicaCellClick(Column: TColumn);
    procedure IElegirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure IBuscarMBioClick(Sender: TObject);
    procedure EBiologicaChange(Sender: TObject);
    procedure EBiologicaKeyPress(Sender: TObject; var Key: Char);
    procedure IBQMBiologicaAfterOpen(DataSet: TDataSet);
    procedure BDBGBiologicaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    RPMadre : String;
  public
    id_madre : Integer;
    RP, HBA, Nombre, TipoM : String;
    consulta: String;
  end;

var
  FPosiblesMadres: TFPosiblesMadres;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TFPosiblesMadres.BDBGBiologicaCellClick(Column: TColumn);
begin
  inherited;
  id_madre := IBQMBiologica.FieldValues['id'];
  RP := IBQMBiologica.FieldValues['id_rp'];
  HBA := '';
  if IBQMBiologica.FieldValues['id_hba'] <> null then
    HBA := IBQMBiologica.FieldValues['id_hba'];
  Nombre := '';
  if IBQMBiologica.FieldValues['nombre'] <> null then
    Nombre := IBQMBiologica.FieldValues['nombre'];
  TipoM := IBQMBiologica.FieldValues['Tipo'];
end;

procedure TFPosiblesMadres.IElegirClick(Sender: TObject);
begin
  inherited;
  BDBGBiologicaCellClick(nil);
  Close;
end;

procedure TFPosiblesMadres.FormCreate(Sender: TObject);
begin
  inherited;
  id_madre := -1;
  RPMadre := '%';
end;

procedure TFPosiblesMadres.ICancelarClick(Sender: TObject);
begin
  inherited;
  id_madre := -1;
  RP := '';
  HBA := '';
  Nombre := '';
  TipoM := '';

  Close;
end;

procedure TFPosiblesMadres.IBuscarMBioClick(Sender: TObject);
begin
  inherited;
  IBQMBiologica.Close;


  IBQMBiologica.sql.Clear;
  IBQMBiologica.sql.Add(consulta);
  (*if EBiologica.Text <> '' then
    begin
      //RPMadre := '%'+EBiologica.Text+'%';
      IBQMBiologica.sql.Add(' and id_rp like :rp');
    end;*)

  if Length(RPMadre) > 10 then
    IBQMBiologica.ParamByName('rp').Value := null
  else
    IBQMBiologica.ParamByName('rp').AsString := RPMadre;  //Incicencia 494 y 589
   if (not (AnsiContainsText(consulta,'nombre <> :nom ')) and AnsiContainsText(consulta,':nom')) then
    begin
      IBQMBiologica.ParamByName('nom').AsString := RPMadre; //Agregado porque no tomaba los apodos y los nombres
      IBQMBiologica.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;  //pero algunas veces no existe nom en la consulta SQL y se rompería.
    end
  else
     begin
      IBQMBiologica.ParamByName('nom').AsString :='N/N'; //Y esto, es por el vincular IE 
      IBQMBiologica.ParamByName('est').AsInteger:= FPrincipal.EstablecimientoActual;
      IBQMBiologica.ParamByName('v').AsString := '';
      IBQMBiologica.ParamByName('a').AsString := 'S';
     end;
  IBQMBiologica.Open;
  IBQMBiologica.Last;
  IBQMBiologica.First;
end;

procedure TFPosiblesMadres.EBiologicaChange(Sender: TObject);
begin

  inherited;
  if EBiologica.Text <> '' then
      RPMadre := '%'+Uppercase(EBiologica.Text)+'%'
  else
      RPMadre := '%';

end;

procedure TFPosiblesMadres.EBiologicaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) then
  begin
    IBuscarMBioClick(nil);
    key:= #0;
  end;
end;

procedure TFPosiblesMadres.IBQMBiologicaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
  LCantBio.Caption := 'Cantidad de Animales ['+IntToStr(DataSet.RecordCount)+']';
end;

procedure TFPosiblesMadres.BDBGBiologicaDblClick(Sender: TObject);
begin
  inherited;
  BDBGBiologicaCellClick(nil);
  Close;
end;

procedure TFPosiblesMadres.FormShow(Sender: TObject);

begin
  inherited;

  id_madre := -1;
  RP := '';
  HBA := '';
  Nombre := '';
  TipoM := '';
  consulta := IBQMBiologica.SQL.GetText;
end;

end.
