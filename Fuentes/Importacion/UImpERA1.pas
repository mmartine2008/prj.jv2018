unit UImpERA1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UImpERA, DB, IBCustomDataSet, VKDBFDataSet, IBQuery, WinXP,
  DataExport, DataToXLS, IBStoredProc, ActnList, jpeg, ComCtrls, StdCtrls,
  EditAuto, PngImage, JvExControls, JvLabel, UBDBGrid, Grids, DBGrids,
  ExtCtrls, JvGIF, DateUtils, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFImpERA1 = class(TFImpERA)
    GroupBox1: TGroupBox;
    EAAnio1: TEditAuto;
    IImportar1: TImage;
    procedure EAAnioChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  published
    constructor Create(Owner : TComponent; Archivo : String); reintroduce;
  end;

var
  FImpERA1: TFImpERA1;

implementation

{$R *.dfm}

constructor TFImpERA1.Create(Owner : TComponent; Archivo : String);
begin
  inherited Create(Owner);
  Abrio := false;
{ DEPRECATED
 VKDBF.Active := false;
  VKDBF.DBFFileName := Archivo;
  VKDBF.Active := true;
 }
  Abrio := true;
  IEra1.Visible := false;
  LEra1.Visible := false;
  LEra2.Visible := false;
  IEra2.Visible := false;
  GBBaseERA.Visible := true;
  GBDatosImp.Visible := true;
  Label1.Visible := true;
  Label3.Visible := true;
  Label4.Visible := true;
  LCant.Visible := true;
  LCantNuevos.Visible := true;

  EAAnio1.Text := IntToStr(YearOf(Today()));

  HabilitarCarga;
end;

procedure TFImpERA1.EAAnioChange(Sender: TObject);
var
  valor : Integer;
begin
  if TryStrToInt(EAAnio1.Text,valor) then
    Anio := valor;
  if Length(EAAnio1.Text) = 4 then
    HabilitarCarga;
end;

end.

