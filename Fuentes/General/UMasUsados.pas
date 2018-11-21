unit UMasUsados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, IniFiles,
  dximctrl, ImgList, JvComponentBase, JvFormTransparent, JvExControls,
  JvgHoleShape, JvExExtCtrls, JvExtComponent, JvRollOut, JvGIF;

type
  TRegAcciones = record
    cantidad : Integer;
    Caption : String;
    Name : String;
    Categoria : Integer;
  end;

  TArrAcciones = Array of TRegAcciones;

  TFMasUsados = class(TFUniversal)
    ImageList1: TImageList;
    JvRollOut1: TJvRollOut;
    JvRollOut2: TJvRollOut;
    JvRollOut3: TJvRollOut;
    JvRollOut4: TJvRollOut;
    ILBAccesosA: TdxImageListBox;
    ILBAccesosE: TdxImageListBox;
    ILBAccesosR: TdxImageListBox;
    ILBAccesosH: TdxImageListBox;
    procedure FormCreate(Sender: TObject);
    procedure ILBAccesosAClick(Sender: TObject);
  private
    Arreglo : TArrAcciones;
    Item : Integer;
    procedure Ordenar;
    function Buscar(Cap : String) : TRegAcciones;
    procedure Clasificar;
    procedure LimpiarIBLS;
  public
    procedure Refresh;
  end;

var
  FMasUsados: TFMasUsados;

implementation

{$R *.dfm}

uses
  UPrincipal, UTraduccion;

procedure TFMasUsados.FormCreate(Sender: TObject);
begin
  inherited;
  Refresh;
end;

procedure TFMasUsados.Refresh;
var
  Usados : TIniFile;
  Indice, IndArr : Integer;
begin
  LimpiarIBLS;
  try
    IndArr := 0;
    Usados := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Favoritos.ini');
    for Indice := 0 to FPrincipal.ALUniversal.ActionCount-1 do
      if Usados.SectionExists(Fprincipal.ALUniversal.Actions[Indice].Name) then
      begin
        SetLength(Arreglo,IndArr+1);
        Arreglo[IndArr].cantidad := Usados.ReadInteger(Fprincipal.ALUniversal.Actions[Indice].Name,'cantidad',0);
        Arreglo[IndArr].Caption := Traducir(Usados.ReadString(Fprincipal.ALUniversal.Actions[Indice].Name,'namecaption',''));
        Arreglo[IndArr].Name := Usados.ReadString(Fprincipal.ALUniversal.Actions[Indice].Name,'nameaction','');
        Arreglo[IndArr].Categoria := Usados.ReadInteger(Fprincipal.ALUniversal.Actions[Indice].Name,'tipo',0);
        Inc(IndArr);
      end;
    Ordenar;
    Clasificar;
  finally
    Usados.Free;
  end;
end;

procedure TFMasUsados.LimpiarIBLS;
begin
  ILBAccesosA.Clear;
  ILBAccesosE.Clear;
  ILBAccesosR.Clear;
  ILBAccesosH.Clear;
end;

procedure TFMasUsados.Clasificar;
var
  IndArr, Categ, Cant : Integer;
begin
  for Categ := 1 to 4 do
  begin
    Cant := 0;
    for IndArr := 0 to Length(Arreglo) -1 do
    begin
      if (Arreglo[IndArr].Categoria = Categ) and (Cant <= 5) then
      begin
        case Categ of
          1 : ILBAccesosA.AddItem(Arreglo[IndArr].Caption,9);
          2 : ILBAccesosE.AddItem(Arreglo[IndArr].Caption,5);
          3 : ILBAccesosR.AddItem(Arreglo[IndArr].Caption,7);
          4 : ILBAccesosH.AddItem(Arreglo[IndArr].Caption,4);
        end;
        Inc(Cant);
      end;
    end;
  end;
end;

procedure TFMasUsados.Ordenar;
var
  Indice, K : Integer;
  Reg : TRegAcciones;
begin
  Reg.cantidad := -1;
  for Indice := 0 to Length(Arreglo)-1 do
    for K := Indice+1 to Length(Arreglo)-1 do
      if Arreglo[Indice].cantidad < Arreglo[K].cantidad then
      begin
        Reg := Arreglo[Indice];
        Arreglo[Indice] := Arreglo[K];
        Arreglo[K] := Reg;
      end;
end;

procedure TFMasUsados.ILBAccesosAClick(Sender: TObject);
var Reg : TRegAcciones;
    accion: TComponent;
begin
  inherited;
  try
    Reg := Buscar(TListBox(Sender).Items.Strings[TListBox(Sender).ItemIndex]);
    Item := TListBox(Sender).ItemIndex;
    accion := FPrincipal.FindComponent(Reg.Name);
    TBasicAction(accion).Execute;
  except
  end;
end;

function TFMasUsados.Buscar(Cap : String) : TRegAcciones;
var
  I : Integer;
begin
  for I := 0 to Length(Arreglo)-1 do
    if Arreglo[I].Caption = Cap then
    begin
      Result := Arreglo[I];
      break;
    end
end;

end.
