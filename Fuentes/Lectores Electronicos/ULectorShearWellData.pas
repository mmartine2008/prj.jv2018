unit ULectorShearWellData;

interface

uses ULectorElectronico, VaComm;

type TLectoShearWellData=class( TLectorElectronico )
  protected
    procedure VaCommRxChar(Sender: TObject; Count: Integer); override;
  public
    constructor Create();

    function formatearCaravana(caravana:String):String;
    procedure agregarCaravanaLeida(caravana: String);
    procedure Inicializar;
    function existeCaravanaLeida(caravana: String):boolean;
    function esCaravana(caravana: String):boolean;
end;

implementation

uses SysUtils, UPrincipal;

{ TLectoShearWellData }
//****************************************************************************\\
constructor TLectoShearWellData.Create;
begin
    inherited Create();
    AbiertoVacomm:= false;
    Lectura:= '';
    Inicializar;
end;
//****************************************************************************\\

procedure TLectoShearWellData.Inicializar;
begin
  Self.InicializarLectorElectronico(
    False,
    TVaBaudRate(br9600),
    FPrincipal._PUERTO_S.CPort,
    TVaParity(0),
    TVaStopbits(sb1),
    TVaDatabits(db8),
    0,
    0,
    nil,
    nil);
end;


//****************************************************************************\\
procedure TLectoShearWellData.agregarCaravanaLeida(caravana: String);
var
  size: integer;
begin
  size := Length(_arrcaravanasLeidas);
  SetLength(_arrcaravanasLeidas, size + 1);
  _arrcaravanasLeidas[size]:= caravana;
  
end;

function TLectoShearWellData.existeCaravanaLeida(caravana: String):boolean;
var
  i : integer;
  enc : boolean;
begin
  enc := false;
  i := 1;
  while ((i < Length(_arrcaravanasLeidas))
      AND not enc) do
  begin
      enc := _arrcaravanasLeidas[i] = caravana;
      i := i +1;
  end;

  existeCaravanaLeida := enc;
end;


//****************************************************************************\\
procedure TLectoShearWellData.VaCommRxChar(Sender: TObject; Count: Integer);
var
    aux, aux2: String;
begin
  aux:= ReadTextVAComm;
  aux2 := self.formatearCaravana(aux);
  if esCaravana(aux2)then
  begin
    Lectura:= aux2;
  end;
end;
//****************************************************************************\\
function TLectoShearWellData.formatearCaravana(caravana: String): String;
var i:Integer;
    aux,aux2:String;
begin
  aux := caravana;
  aux2 := '';

  for i:= 1 to Length(aux) do
    case aux[i] of
      #9:
         begin
          setlength(aux2,Length(aux2)+1);
          aux2[i]:= '_';
         end;
      #10:;
      #13:;
      #0: Break;  // Corta en 0
      else
        begin
          setlength(aux2,Length(aux2)+1);
          aux2[i]:= aux[i];
        end;

    end;

    if (length(aux2) > 1) and (aux2[1] = '0') then
    begin
      aux2 := copy(aux2, 2, length(aux2)-1);
    end;

    formatearCaravana := aux2;
end;

function TLectoShearWellData.esCaravana(caravana: String):boolean;
begin
  esCaravana := Length(caravana) = 15;
end;

end.
