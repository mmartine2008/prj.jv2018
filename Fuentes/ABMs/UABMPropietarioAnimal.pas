unit UABMPropietarioAnimal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMPropietarioAnimal = class(TFABMSimple)
    IBQAbmSimpleID_PROPIETARIO: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    DBEditAuto1: TDBEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    DBEditAuto2: TDBEditAuto;
    DBEditAuto3: TDBEditAuto;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure AcInsertarExecute(Sender: TObject);
    procedure AcGuardarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AcSalirExecute(Sender: TObject);
    procedure AcElegirExecute(Sender: TObject);
    procedure BDBGAbmCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABMPropietarioAnimal: TFABMPropietarioAnimal;

implementation

uses UImportacion,UDMSoftvet;

{$R *.dfm}

procedure TFABMPropietarioAnimal.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := true;
  PermiteInsertar := true;
end;

procedure TFABMPropietarioAnimal.AcInsertarExecute(Sender: TObject);
begin
  inherited;
    if cargaDeMovil then
    begin
     DBEditAuto1.Text:=nom;
     DBEditAuto3.Text:=nom;
     DBEditAuto2.Text:=nom[1]+nom[2];
    end;
end;

procedure TFABMPropietarioAnimal.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
      TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:=DBEditAuto1.Text;
end;

procedure TFABMPropietarioAnimal.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin;
    AcInsertar.Visible:=true;
    AcInsertar.Enabled:=true;
    AcInsertarExecute(Sender);
    end;
end;

procedure TFABMPropietarioAnimal.AcSalirExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:='NO DEFINIDO';
end;

procedure TFABMPropietarioAnimal.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

procedure TFABMPropietarioAnimal.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
      desdeEvento:=IBQAbmSimple.FieldValues['ID_PROPIETARIO'];
end;

end.
