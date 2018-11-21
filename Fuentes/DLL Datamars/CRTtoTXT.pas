unit CRTtoTXT;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, ControlesSubscription_TLB, StdVcl, IDEBinDll_TLB;

type
  TControles = class(TAutoObject, _clsRCTtoTXT)
  protected
    function Get_archivoDestino: WideString; safecall;
    function Get_ArchivoOrigen: WideString; safecall;
    function Get_CantidadControles: Integer; safecall;
    function Get_CarpetaDestino: WideString; safecall;
    function Get_Encabezado: WordBool; safecall;
    function Get_Formato: tFormato; safecall;
    function Get_IncluirControlesBorrados: WordBool; safecall;
    function Get_separador: WideString; safecall;
    procedure EjecutarConversion; safecall;
    procedure Set_ArchivoOrigen(const Param1: WideString); safecall;
    procedure Set_CantidadControles(Param1: Integer); safecall;
    procedure Set_CarpetaDestino(const Param1: WideString); safecall;
    procedure Set_Encabezado(Param1: WordBool); safecall;
    procedure Set_Formato(Param1: tFormato); safecall;
    procedure Set_IncluirControlesBorrados(Param1: WordBool); safecall;
    procedure Set_separador(const Param1: WideString); safecall;
  end;

implementation

uses ComServ;

function TControles.Get_archivoDestino: WideString;
begin

end;

function TControles.Get_ArchivoOrigen: WideString;
begin

end;

function TControles.Get_CantidadControles: Integer;
begin

end;

function TControles.Get_CarpetaDestino: WideString;
begin

end;

function TControles.Get_Encabezado: WordBool;
begin

end;

function TControles.Get_Formato: tFormato;
begin

end;

function TControles.Get_IncluirControlesBorrados: WordBool;
begin

end;

function TControles.Get_separador: WideString;
begin

end;

procedure TControles.EjecutarConversion;
begin

end;

procedure TControles.Set_ArchivoOrigen(const Param1: WideString);
begin

end;

procedure TControles.Set_CantidadControles(Param1: Integer);
begin

end;

procedure TControles.Set_CarpetaDestino(const Param1: WideString);
begin

end;

procedure TControles.Set_Encabezado(Param1: WordBool);
begin

end;

procedure TControles.Set_Formato(Param1: tFormato);
begin

end;

procedure TControles.Set_IncluirControlesBorrados(Param1: WordBool);
begin

end;

procedure TControles.Set_separador(const Param1: WideString);
begin

end;

initialization
  TAutoObjectFactory.Create(ComServer, TControles, Class_Controles,
    ciMultiInstance, tmApartment);
end.
