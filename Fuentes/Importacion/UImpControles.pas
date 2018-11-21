unit UImpControles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, 
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, ShellCtrls, pngimage,
  JvExExtCtrls, JvImage;

type
  TFImpControles = class(TFUniversal)
    Ptop: TPanel;
    PBottom: TPanel;
    PCli: TPanel;
    SLVControles: TShellListView;
    STVControles: TShellTreeView;
    procedure FormShow(Sender: TObject);
    function BuscarLector(): string;
  public
    { Public declarations }
  end;

var
  FImpControles: TFImpControles;

implementation

{$R *.dfm}

procedure TFImpControles.FormShow(Sender: TObject);
begin
  inherited;
  SLVControles.Root := BuscarLector;
end;

function TFImpControles.BuscarLector(): string;
var
  r: LongWord;
  Unidades: array[0..128] of char;
  pUnidad: pchar;
begin
  Result := '';
  r := GetLogicalDriveStrings(sizeof(Unidades), Unidades);
  if r = 0 then exit;
  if r > sizeof(Unidades) then
    raise Exception.Create(SysErrorMessage(ERROR_OUTOFMEMORY));
  pUnidad := Unidades;  // Apunta a la primera unidad
  while pUnidad^ <> #0 do
  begin
    if (GetDriveType(pUnidad) = DRIVE_REMOVABLE) and
        (StrUpper(pUnidad) <> 'A:\') and
        (StrUpper(pUnidad) <> 'B:\') and
        FileExists(StrUpper(pUnidad)+'DUID.txt') then
    begin
      Result := pUnidad;
      exit;
    end;
    inc(pUnidad, 4);  // Apunta a la siguiente unidad
  end;
end;



end.
