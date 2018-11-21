unit UTraduccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, UPrincipal,
  JvGIF, JvExControls, JvLabel, ImgList, PngImageList, pngimage,
  JvExExtCtrls, JvImage;

type
  TRecCorrespondencias = record
    Original : String;
    Traduccion : String;
  end;

  TArrCorrespondencias = Array of TRecCorrespondencias;

  TFTraduccion = class(TFUniversal)
    IBQTraduccion: TIBQuery;
    procedure FormCreate(Sender: TObject);
  private
    Correspondencias : TArrCorrespondencias;
    PuedeTraducir : Boolean;
    function Traduccion(Valor : String) : String;
    function Verificar(Valor1, Valor2 : String) : Boolean;
    function PreString(Valor : String) : String;
    function PosString(Valor : String) : String;
  public
    { Public declarations }
  end;

var
  FTraduccion: TFTraduccion;
  function Traducir(Valor : String) : String;

implementation

uses StrUtils;

{$R *.dfm}

function Traducir(Valor : String) : String;
var
  res : Variant;
begin
  //showmessage(Valor);
  if Assigned(FPrincipal) and Assigned(FTraduccion) then
  begin
    if FPrincipal.Idioma = 1 then
      Result := Valor
    else
    begin
      res := FTraduccion.Traduccion(Valor);
      if res <> null then
        Result := res
      else
        Result := Valor;
    end;
  end
  else
    Result := Valor;
end;

procedure TFTraduccion.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  inherited;
try
  PuedeTraducir := false;
  SetLength(Correspondencias,0);

  if FPrincipal.Idioma > 1 then
  begin
    IBQTraduccion.Close;
    IBQTraduccion.SQL.Clear;
    case FPrincipal.Idioma of
      2 : IBQTraduccion.SQL.Add('SELECT ARGENTINA AS REF, EEUU AS VAL FROM SYS_CORRESPONDENCIA_IDIOMA');
    end;
    IBQTraduccion.Open;
    IBQTraduccion.First;
    I := 0;
    while not IBQTraduccion.Eof do
    begin
      SetLength(Correspondencias,I+1);
      Correspondencias[I].Original := IBQTraduccion.FieldValues['REF'];
      Correspondencias[I].Traduccion := IBQTraduccion.FieldValues['VAL'];
      Inc(I);
      IBQTraduccion.Next;
    end;
    PuedeTraducir := Length(Correspondencias) > 0;
    IBQTraduccion.Close;
  end;
except
end;
end;

function TFTraduccion.Traduccion(Valor : String) : String;
var
  I : Integer;
begin
  Result := Valor;
  if PuedeTraducir then
  begin
    for I := 0 to Length(Correspondencias)-1 do
      if (Valor <> '') and (Verificar(Valor,Correspondencias[I].Original)) then
      begin
        Result := PreString(Valor)+Correspondencias[I].Traduccion+PosString(Valor);
        break;
      end;
  end;
end;

function TFTraduccion.PreString(Valor : String) : String;
var
  I : Integer;
  Pre : String;
begin
  I := 1;
  Pre := '';

  if AnsiContainsText(Valor,'Huella') then
    Pre := 'Huella';

  while (I < Length(Valor)) and ((Valor[I]=' ') or (Valor[I] = '[') or (Valor[I] = '(') or (Valor[I] = '-')) do
  begin
    Pre := Pre+Valor[I];
    Inc(I);
  end;
  Result := Pre;
end;

function TFTraduccion.PosString(Valor : String) : String;
var
  I : Integer;
  Pos : String;
begin
  I := Length(Valor);
  Pos := '';
  while (Valor[I] = ' ') or (Valor[I] = '.') or (Valor[I] = ':') or (Valor[I] = '/') or (Valor[I] = '-') or (Valor[I] = '[') or (Valor[I] = '(')
  or (Valor[I] = ']') or (Valor[I] = ')')do
  begin
    Pos := Pos+Valor[I];
    I := I-1;
  end;
  Result := ReverseString(Pos);
end;

function TFTraduccion.Verificar(Valor1, Valor2 : String) : Boolean;
var
  Aux : String;
begin
  Aux := StringReplace(Valor1,':','',[rfReplaceAll]);
  Aux := StringReplace(Aux,'.','',[rfReplaceAll]);
  Aux := StringReplace(Aux,'/','',[rfReplaceAll]);
  Aux := StringReplace(Aux,'-','',[rfReplaceAll]);
  Aux := StringReplace(Aux,'&','',[rfReplaceAll]);
  Aux := StringReplace(Aux,'[','',[rfReplaceAll]);
  Aux := StringReplace(Aux,']','',[rfReplaceAll]);
  Aux := StringReplace(Aux,'(','',[rfReplaceAll]);
  Aux := StringReplace(Aux,')','',[rfReplaceAll]);
  Aux := StringReplace(Aux,'Huella','',[rfReplaceAll]);
  Result := lowercase(Trim(Aux)) = lowercase(Valor2);
end;

end.
