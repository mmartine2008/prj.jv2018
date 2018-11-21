unit UABMCriador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UAbmSimple, IBCustomDataSet, IBUpdateSQL, Menus, DB, ImgList,
  IBQuery, WinXP, DataExport, DataToXLS, IBStoredProc, ActnList, StdCtrls,
  Buttons, Grids, DBGrids, UBDBGrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  UDBEditAuto, JvExControls, JvLabel, PngImage, jpeg, JvGIF, PngImageList,
  JvExExtCtrls, JvImage;

type
  TFABMCriador = class(TFABMSimple)
    IBQAbmSimpleID_CRIADOR: TIntegerField;
    IBQAbmSimpleNOMBRE: TIBStringField;
    IBQAbmSimpleCODIGO: TIBStringField;
    IBQAbmSimpleSINONIMO: TIBStringField;
    DBEditAuto1: TDBEditAuto;
    Label1: TLabel;
    Label2: TLabel;
    DBEditAuto2: TDBEditAuto;
    DBEditAuto3: TDBEditAuto;
    Label3: TLabel;
    IBQAbmSimpleNUMEROCRIADOR: TIntegerField;
    Label4: TLabel;
    DBEditAuto4: TDBEditAuto;
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
  FABMCriador: TFABMCriador;

implementation

uses UImportacion,UDMSoftvet,UEveSimple;
{$R *.dfm}

procedure TFABMCriador.FormCreate(Sender: TObject);
begin
  inherited;
  PermiteCambio := true;
  PermiteInsertar := true;
end;

procedure TFABMCriador.AcSalirExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:='NO DEFINIDO';
end;

procedure TFABMCriador.AcGuardarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
      TFImportacion(self.Owner).arrNuevos[Length(TFImportacion(self.Owner).arrNuevos)-1]:=DBEditAuto1.Text;
end;

procedure TFABMCriador.AcInsertarExecute(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin
     DBEditAuto1.Text:=nom;
     DBEditAuto3.Text:=nom;
     DBEditAuto2.Text:=nom[1]+nom[2];
    end;
end;

procedure TFABMCriador.FormShow(Sender: TObject);
begin
  inherited;
  if cargaDeMovil then
    begin;
    AcInsertar.Visible:=true;
    AcInsertar.Enabled:=true;
    AcInsertarExecute(Sender);
    end;
end;

procedure TFABMCriador.BDBGAbmCellClick(Column: TColumn);
begin
  inherited;
  if desdeEvento>-1 then
    desdeEvento:=IBQAbmSimple.FieldValues['ID_CRIADOR'];
end;

procedure TFABMCriador.AcElegirExecute(Sender: TObject);
begin
  BDBGAbmCellClick(nil);
  inherited;
end;

end.
