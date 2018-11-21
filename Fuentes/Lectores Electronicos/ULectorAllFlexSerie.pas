unit ULectorAllFlexSerie;

interface

uses ULectorElectronico, VaComm;

type TLectorAllFlexSerie=class (TLectorElectronico)
  private

  public
     constructor Create();reintroduce;//overload;
    {Constructor Create(Btooth: Boolean; Brate:TVaBaudRate; CPort :Integer;
                       Pari: TVaParity; SBits: TVaStopBits; DBits: TVaDataBits;
                       FControl, IdFabri:Integer; arrcarLeidas:arregloString);overload;
     }
    function configuracionComandos():arregloString;override;
end;

implementation

uses SysUtils, UPrincipal;

{ TLectorAllFlexSerie }
//****************************************************************************\\
constructor TLectorAllFlexSerie.Create;
var arrcomlector, arrcarLeidas : arregloString;
begin
  inherited Create();
  arrcomlector:= configuracionComandos();
  arrcarLeidas:= nil;
  InicializarLectorElectronico(
  FPrincipal._PUERTO_S.Btooth,
  FPrincipal._PUERTO_S.Brate,
  FPrincipal._PUERTO_S.CPort,
  FPrincipal._PUERTO_S.Pari,
  Fprincipal._PUERTO_S.SBits,
  FPrincipal._PUERTO_S.DBits,
  FPrincipal._PUERTO_S.FControl,
  FPrincipal._PUERTO_S.IdFabri,
  arrcomLector,
  arrcarLeidas);
end;
//****************************************************************************\\
{constructor TLectorAllFlexSerie.Create(Btooth: Boolean; Brate: TVaBaudRate;
                                       CPort: Integer; Pari: TVaParity;
                                       SBits: TVaStopBits; DBits: TVaDataBits;
                                       FControl, IdFabri: Integer; arrcarLeidas: arregloString);
var arrcomlector : arregloString;
begin
  arrcomlector:= configuracionComandos();
  InicializarLectorElectronico(Btooth,Brate, CPort, Pari, SBits, DBits, FControl, IdFabri, arrcomLector, arrcarLeidas);
end;     }
//****************************************************************************\\
function TLectorAllFlexSerie.configuracionComandos: arregloString;
var arrcomlector : arregloString;
begin
  arrcomlector:= nil;
  SetLength(arrcomlector, 6);
  arrcomlector[0]:= '[CSW]';//transmite todos las caravanas almacenadas
  {arrcomlector[1]:= 'R';// Inicia la lectura
  arrcomlector[2]:= 'C#13';//Borra todas las caravanas almacenadas en el lector
  arrcomlector[3]:= 'r';//devuelve la ultima caravana leida
  arrcomlector[4]:= 'P';//ping w/settings
  arrcomlector[5]:= 'V';}//version
  result:= arrcomlector;
end;
//****************************************************************************\\

end.

