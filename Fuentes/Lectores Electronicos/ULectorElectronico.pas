unit ULectorElectronico;

interface

uses VaComm;

type arregloString = array of String;
   {  TBaudRate = (br110, br300, br600, br1200, br2400, br4800, br9600, br14400,
                  br19200, br38400, br56000, br57600, br115200, br128000, br256000);
     TParity   = (paEven, paMark, paNone, paOdd, paSpace);
     TStopBit  = (sb1, sb15, sb2);
     TDataBit  = (db4, db5, db6, db7, db8);}
type TLectorElectronico=class
  private
    _bluetooth: Boolean;
    _baudrate: TVaBaudRate;
    _comport: Integer;
    _parity: TVaParity;
    _StopBits: TVaStopBits;
    _databits:TVaDataBits;
    _flowcontrol:integer;
    _idFabricante: Integer;

    _vacomm: TVaComm;
    _abiertovacomm: Boolean; //si esta abierto o no
    _lectura: String; //ultima lectura del dispositivo


  protected
    _arrcomandosLector: arregloString;
    _arrcaravanasLeidas: arregloString;

    procedure VaCommRxChar(Sender: TObject; Count: Integer); virtual;
  public
    function getLectura():string; virtual;

    constructor Create();
    function configuracionComandos():arregloString;virtual;
    property Bluetooth:Boolean read _bluetooth write _bluetooth;
    property Baudrate:TVaBaudRate read _baudrate write _baudrate;
    property Comport:Integer read _comport write _comport;
    property Parity:TVaParity read _parity write _parity;
    property StopBits:TVaStopBits read _StopBits write _StopBits;
    property Databits :TVaDataBits read _databits write _databits;
    property Flowcontrol:Integer read _flowcontrol write _flowcontrol;
    property IdFabricante:Integer read _idFabricante write _idFabricante;
    property VAComm:TVaComm read _vacomm write _vacomm;
    property AbiertoVacomm:Boolean read _abiertovacomm write _abiertovacomm;
    property Lectura: String read getLectura write _lectura;

    function formatearCaravana(caravana:String):String;

    function retornarArregloComandosLector(): arregloString;
    procedure setearArregloComandosLector(arrcomandoslector: arregloString);
    procedure agregarComando(comando: String);

    function retornarArregloCaravanasLeidas(): arregloString;
    procedure setearArregloCaravanasLeidas(arrcaravanasleidas: arregloString);
    procedure agregarCaravanaLeida(caravana: String);

    procedure InicializarLectorElectronico(Btooth: Boolean; Brate: TVaBaudRate;
              CPort:Integer; Pari: TVaParity; SBits: TVaStopBits; DBits: TVaDataBits;
              FControl, IdFabri:Integer; arrcomLector, arrcarLeidas:arregloString);

    procedure ConfigurarVaComm();virtual;

    function OpenVAComm: Integer;         virtual;
    function CloseVAComm: Integer;        virtual;
    function ReadTextVAComm(): String;
    function WriteTextVAComm(Const s:String): Boolean;

    function Limpiar(caravana: String): String;
    function esUltraRFIG: boolean;  virtual ;
end;

implementation

uses SysUtils, UPrincipal;

{ TLectorElectronico }
function TLectorElectronico.getLectura():string;
begin
result := _lectura;
end;
//****************************************************************************\\
constructor TLectorElectronico.Create;
begin
    Bluetooth:= False;
    Baudrate:= TVaBaudRate(br9600);
    Comport:= 1;
    Parity:= TVaParity(0);
    StopBits:= TVaStopbits(sb1);
    Databits:= TVaDatabits(db8);
    Flowcontrol:= 0;
    IdFabricante:= 0;
    _arrcomandosLector:= nil;
    _arrcaravanasLeidas:= nil;
    _vacomm:= nil;
    _vacomm:= TVaComm.Create(nil);
    _vacomm.OnRxChar:= nil;
    _vacomm.OnRxChar:= VaCommRxChar;
    AbiertoVacomm:= false;
    Lectura:= '';
end;
//****************************************************************************\\
procedure TLectorElectronico.InicializarLectorElectronico(Btooth: Boolean;
  Brate: TVaBaudRate; CPort: Integer; Pari: TVaParity; SBits: TVaStopBits; DBits: TVaDataBits;
  FControl, IdFabri: Integer; arrcomLector, arrcarLeidas: arregloString);
begin
    Bluetooth:= Btooth;
    Baudrate:= Brate;
    Comport:= CPort;
    Parity:=Pari;
    StopBits:= SBits;
    Databits:= DBits;
    Flowcontrol:= FControl;
    IdFabricante:= IdFabri;
    setearArregloComandosLector(arrcomLector);
    setearArregloCaravanasLeidas(arrcarLeidas);

    AbiertoVacomm:= false;
    Lectura:= '';
end;
//****************************************************************************\\
procedure TLectorElectronico.ConfigurarVaComm();
begin
    VAComm.Baudrate:= Baudrate;
    VAComm.PortNum:= Comport;
    VAComm.Parity:= Parity;
    VAComm.Stopbits:= StopBits;
    VAComm.Databits:= Databits;
end;
//****************************************************************************\\
function TLectorElectronico.retornarArregloComandosLector: arregloString;
begin
    result:= _arrcomandosLector;
end;
//****************************************************************************\\
procedure TLectorElectronico.setearArregloComandosLector(
  arrcomandoslector: arregloString);
begin
    _arrcomandosLector:= arrcomandoslector;
end;
//****************************************************************************\\
function TLectorElectronico.retornarArregloCaravanasLeidas: arregloString;
begin
    result:= _arrcaravanasLeidas;
end;
//****************************************************************************\\
procedure TLectorElectronico.setearArregloCaravanasLeidas(
  arrcaravanasleidas: arregloString);
begin
    _arrcaravanasLeidas:= arrcaravanasleidas;
end;
//****************************************************************************\\
procedure TLectorElectronico.agregarCaravanaLeida(caravana: String);
begin
  SetLength(_arrcaravanasLeidas,Length(_arrcaravanasLeidas) + 1);
  _arrcaravanasLeidas[Length(_arrcaravanasLeidas)]:= caravana;
end;
//****************************************************************************\\
procedure TLectorElectronico.agregarComando(comando: String);
begin
  SetLength(_arrcomandosLector,Length(_arrcomandosLector) + 1);
  _arrcomandosLector[Length(_arrcomandosLector)]:= comando;
end;
//****************************************************************************\\
function TLectorElectronico.configuracionComandos:arregloString;
begin
  // Deben implementarlo los hijos
end;
//****************************************************************************\\
function TLectorElectronico.OpenVAComm: Integer;
begin
  try
    result:= 1;
    VAComm.Open;
    AbiertoVacomm:= true;
  except
     result:= 0;
     AbiertoVacomm:= false;
  end;
end;
//****************************************************************************\\
function TLectorElectronico.CloseVAComm: Integer;
begin
  try
    result:= 1;
    VAComm.Close;
  except
     result:= 0;
  end;
end;
//****************************************************************************\\
function TLectorElectronico.ReadTextVAComm: String;
begin
  try
    result:= VAComm.ReadText;//StringReplace(VAComm.ReadText,' ','',[rfReplaceAll]);
  except
     result:= '';
  end;
end;
//****************************************************************************\\
function TLectorElectronico.WriteTextVAComm(Const s:String): Boolean;
begin
  try
    result:= VAComm.WriteText(s);
  except
     result:= false;
  end;
end;
//****************************************************************************\\
procedure TLectorElectronico.VaCommRxChar(Sender: TObject; Count: Integer);
var aux, aux2: String;
    i: Integer;
begin
  //Lectura:= '';
 // Lectura:= Lectura + ReadTextVAComm;
  //Memo1.Lines.Text:= Memo1.Lines.Text + FLectorElectronico.Lectura;
//  FPrincipal.Memo1.Lines.Text:= FPrincipal.Memo1.Lines.Text + self.Lectura;


  aux:= ReadTextVAComm;

  for i:= 1 to Length(aux) do
    case aux[i] of
      #9:
         begin
          setlength(aux2,Length(aux2)+1);
          aux2[i]:= '_';
         end;
      #10:;
      #13:;
      else
        begin
          setlength(aux2,Length(aux2)+1);
          aux2[i]:= aux[i];
        end;
    end;

    Lectura:= Lectura + aux2;


//    FPrincipal.Memo1.Lines.Text:= FPrincipal.Memo1.Lines.Text + self.Lectura;
{  FPrincipal.Memo1.Lines.Text:= FPrincipal.Memo1.Lines.Text + self.Lectura;
  FPrincipal.Memo1.Lines.Text:= FPrincipal.Memo1.Lines.Text + #13; }



end;
//****************************************************************************\\
function TLectorElectronico.formatearCaravana(caravana: String): String;
var i:Integer;
    aux,aux2:String;
begin
  aux:= caravana;
  aux2:='';
  for i:= 1 to Length(aux) do
    case aux[i] of
      #9:
         begin
          setlength(aux2,Length(aux2)+1);
          aux2[i]:= '_';
         end;
      #10:;
      #13:;
      else
        begin
          setlength(aux2,Length(aux2)+1);
          aux2[i]:= aux[i];
        end;
    end;
  result:= aux2;
end;

// Esta funcion quita caracteres y si es neceario el 0 inicial.
function TLectorElectronico.Limpiar(caravana: String): String;
var
  auxlectura : string;
begin
    auxlectura := caravana;
    auxlectura := StringReplace(auxlectura, #9, '', [rfReplaceAll]);
    auxlectura := StringReplace(auxlectura, #32, '', [rfReplaceAll]);
    if (Length(auxlectura)=16) and (auxlectura[1]='0') then
    begin
      auxlectura := copy(auxlectura, 2, 15);
    end;
    Limpiar := auxlectura;
end;

    function TLectorElectronico.esUltraRFIG: boolean;  
    begin
        result := false;
    end;

end.

