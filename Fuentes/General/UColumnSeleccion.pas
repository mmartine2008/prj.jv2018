unit UColumnSeleccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  ImgList, PngImageList, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, pngimage, JvExExtCtrls, JvImage,
  JvExControls, JvLabel, JvGIF;

type
  TFColumSeleccion = class(TFUniversal)
    PBotones: TPanel;
    PSelectores: TPanel;
    BBTerminar: TBitBtn;
    BBCancelar: TButton;
    ATerminar: TAction;
    ACancelar: TAction;
    BBAyuda: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ATerminarExecute(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
  private
    checks : TStringList;
  public
    function canEdit(field:string):boolean;
    procedure addColumnSelector(lab:string; column:string; checked:boolean);
  end;

var
  FColumSeleccion: TFColumSeleccion;

implementation

{$R *.dfm}

{ TFColumSeleccion }

procedure TFColumSeleccion.FormCreate(Sender: TObject);
begin
  inherited;
  checks := TStringList.Create();
end;

procedure TFColumSeleccion.addColumnSelector(lab:string; column: string; checked: boolean);
var
  check : TCheckBox;
begin
  check := TCheckBox.Create(self);
  with check do begin
    Caption := lab;
    Checked := checked;
    Left    := 16;
    Top     := 8 + (checks.Count * 25);
    Parent  := PSelectores;
  end;
  checks.AddObject(column, check);
  Height := 124 + (checks.Count * 25);
end;

procedure TFColumSeleccion.ATerminarExecute(Sender: TObject);
begin
  inherited;
  {todo 2 -omartin: Ver que hacemos cuando acepta las columnas}
end;

procedure TFColumSeleccion.ACancelarExecute(Sender: TObject);
begin
  inherited;
  {todo 2 -omartin: Ver que hacemos cuando cancela las columnas}
end;

function TFColumSeleccion.canEdit(field: string): boolean;
begin
  result := checks.IndexOf(field) >= 0;
  result := result and TCheckBox(checks.Objects[checks.IndexOf(field)]).Checked;
end;

end.
