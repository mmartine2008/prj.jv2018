unit UABMCentrosTransplantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMCentrosTransplantes = class(TFABMSimple)
    DBEANombre: TDBEditAuto;
    DBEAMatricula: TDBEditAuto;
    DBEAResponsable: TDBEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEAInscripcion: TDBEditAuto;
    procedure FormCreate(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function OpcionesDeCambio : Boolean; override;
  public
    { Public declarations }
  end;

var
  FABMCentrosTransplantes: TFABMCentrosTransplantes;

implementation

{$R *.dfm}

uses
  UImportacion;

procedure TFABMCentrosTransplantes.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := true;
  PermiteInsertar := true;
end;

function TFABMCentrosTransplantes.OpcionesDeCambio : Boolean;
begin
  Result := not IBQABMSimple.FieldByName('ID_CENTRO_TRANSPLANTE').AsInteger = 0;
end;

procedure TFABMCentrosTransplantes.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin
     DBEANombre.Text:=nom;
    end;
end;

procedure TFABMCentrosTransplantes.AcSalirExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:='NO DEFINIDO';
end;

procedure TFABMCentrosTransplantes.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
      TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:=DBEANombre.Text;
end;

procedure TFABMCentrosTransplantes.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin;
    AcInsertar.Visible:=true;
    AcInsertar.Enabled:=true;
    AcInsertarExecute(Sender);
    end;
end;

end.
