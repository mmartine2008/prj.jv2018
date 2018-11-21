unit UABMOrigen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMOrigen = class(TFABMSimple)
    Label1: TLabel;
    DBEditAuto1: TDBEditAuto;
    Label2: TLabel;
    DBEditAuto2: TDBEditAuto;
    Label3: TLabel;
    DBEditAuto3: TDBEditAuto;
    IBQAbmSimpleID_ORIGEN: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
    procedure AcElegirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMOrigen: TFABMOrigen;

implementation

uses UImportacion,UDMSoftvet, UEveSImple;

{$R *.dfm}

procedure TFABMOrigen.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := true;
  PermiteInsertar := true;
end;

procedure TFABMOrigen.AcSalirExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:='NO DEFINIDO';
end;

procedure TFABMOrigen.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
      TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:=DBEditAuto1.Text;
end;

procedure TFABMOrigen.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin
     DBEditAuto1.Text:=nom;
     DBEditAuto3.Text:=nom;
     DBEditAuto2.Text:=nom[1]+nom[2];
    end;
end;

procedure TFABMOrigen.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin;
    AcInsertar.Visible:=true;
    AcInsertar.Enabled:=true;
    AcInsertarExecute(Sender);
    end;
end;

procedure TFABMOrigen.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_ORIGEN'];
end;

procedure TFABMOrigen.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
