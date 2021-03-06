unit uLectorUHFRfid;
interface

uses ULectorElectronico,classes;

type TLectorUHFrfid=class( TLectorElectronico )
  public

    listaDeAnimalesPorGuardar , listadeAnimalesLeidos : TStringList;
  protected
    _lectura: String; //ultima lectura del dispositivo

  public
    constructor Create();

    function formatearCaravana(caravana:String):String;
    procedure agregarCaravanaLeida(caravana: String);
    procedure Inicializar;
    function existeCaravanaLeida(caravana: String):boolean;
    function esCaravana(caravana: String):boolean;

    procedure ConfigurarVaComm();virtual;
//    function OpenVAComm: Integer;         virtual;
//    function CloseVAComm: Integer;        virtual;
    function getLectura():string;   override ;
    function esUltraRFIG: boolean;  override ;
    function tieneLecturas: boolean; override;

end;

implementation

uses SysUtils, UPrincipal,Forms,Registry, windows,dialogs;

type

  TTestDLL = function ( v1: integer; v2 : integer) : integer; stdcall;
  TGetVersion = function(): PChar; stdcall;
   TGetError = function(): PChar; stdcall;
 //  public static int openfromNetwork(string str)
  TOpenFromNetwork = function(str : Pchar): integer; stdcall;

  //  public static int openfromNetwork(string str)
  TStartReading = function(): integer; stdcall;

  TStopReading = function(): integer; stdcall;
 //   public static int getSensorsFoundCount()
   TgetSensorsFoundCount = function(): integer; stdcall;

  //   public static string getSensorDetail(int index)
  TgetSensorDetail = function(index : integer): PChar; stdcall;

   //   public static string getSensorDetail(int index)
  TgetFieldsHeader = function(): PChar; stdcall;

var
 dllHandle : cardinal;
 test0 : TTestDLL;
 dllVersion :  TGetVersion;
 openFromNetwork : TopenFromNetwork;
 getSensorsFoundCount: TgetSensorsFoundCount;
  getSensorDetail : TgetSensorDetail;
  startReading : TStartReading;
 getError :  TGetError;
 getFieldsHeader : TgetFieldsHeader;
  stopReading : TStopReading;

  firstRead : boolean = false;




  
{ TLectorUHFrfid }
   function TLectorUHFrfid.getLectura():string;
  var
          str , caravana : string;
          strL : TStringList;
          i: integer;
   begin
      try
		if assigned(@openFromNetwork)  then
		begin
			if not firstRead then
			begin
				firstRead := true;
				// BUG - Setear el puerto desde archivo
				if (openFromNetwork(  '192.168.1.10') = 0 ) then
				begin
					startReading();
				end
				else
				begin
					showMessage(getError() );
				end
			end;
		end
		else
		begin
			showMessage( 'UHRFID DLL : No pudo encontrar la Funcion openFromNetwork');
		end;
	except
	on e:exception do
	  showMessage( 'UHRFID DLL ' + e.Message );
	end;

      IF  getSensorsFoundCount() > 0 THEN
      begin
       strL :=  TStringList.Create();
       for i :=0 to  getSensorsFoundCount()-1 do
       begin
          str := getSensorDetail(i);
          strL.DelimitedText := str;
           caravana := strL[0];
          // si este animal es la primer vez que pasa
           if listadeAnimalesLeidos.IndexOf(caravana) < 0 then
           begin
           // si no lo actualice
             if listaDeAnimalesPorGuardar.IndexOf(caravana) < 0 then
              listaDeAnimalesPorGuardar.Add(caravana);
           end;
       end;
       // voy desapilando
       if (listaDeAnimalesPorGuardar.Count > 0) then
       begin
         result := listaDeAnimalesPorGuardar[0]    ;
         listadeAnimalesLeidos.add(result);
         listaDeAnimalesPorGuardar.Delete(0);
       end
       else
          result := '';
       strL.Destroy();
      end
       else
        result := '';
   end;
//****************************************************************************\\
constructor TLectorUHFrfid.Create;
begin
    inherited Create();

    _Lectura:= '';
    Inicializar;
    listaDeAnimalesPorGuardar := TStringList.create;
    listadeAnimalesLeidos := TStringList.create;
end;
procedure TLectorUHFrfid.ConfigurarVaComm();
begin
end;
{
function TLectorUHFrfid.OpenVAComm: Integer;
begin
    result:= 1;
    AbiertoVacomm:= true;
end;

function TLectorUHFrfid.CloseVAComm: Integer;
begin
    result:= 1;
end;
 }
//****************************************************************************\\

procedure TLectorUHFrfid.Inicializar;
var
 s : string;
begin
// Inicializa la DLL
SetCurrentDir(extractFilePath(Application.ExeName ));
 dllHandle := LoadLibrary('rFIDConnector.dll') ;
 dllVersion := nil;
 if dllHandle <> 0 then
 begin
   @dllVersion := GetProcAddress(dllHandle, 'getVersion') ;
   @openFromNetwork := GetProcAddress(dllHandle, 'openFromNetwork') ;
   @getSensorsFoundCount := GetProcAddress(dllHandle, 'getSensorsFoundCount') ;
   @getSensorDetail := GetProcAddress(dllHandle, 'getSensorDetail') ;
   @startReading := GetProcAddress(dllHandle, 'startReading') ;
   @getError := GetProcAddress(dllHandle, 'getError') ;
   @stopReading := GetProcAddress(dllHandle, 'stopReading') ;
    @getFieldsHeader := GetProcAddress(dllHandle, 'getFieldsHeader') ;
end
 else
 begin
      ShowMessage('rFIDConnector.dll not found / not loaded') ;
 end;

end;


//****************************************************************************\\
procedure TLectorUHFrfid.agregarCaravanaLeida(caravana: String);
var
  size: integer;
begin
  size := Length(_arrcaravanasLeidas);
  SetLength(_arrcaravanasLeidas, size + 1);
  _arrcaravanasLeidas[size]:= caravana;

end;

function TLectorUHFrfid.existeCaravanaLeida(caravana: String):boolean;
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
function TLectorUHFrfid.formatearCaravana(caravana: String): String;
var i:Integer;
    aux,aux2:String;
begin
 result := caravana;
end;

function TLectorUHFrfid.esCaravana(caravana: String):boolean;
begin
  result := true;
end;

function TLectorUHFrfid.esUltraRFIG: boolean;
begin
     result := true;
end;

function TLectorUHFrfid.tieneLecturas: boolean;
begin
  if (getSensorsFoundCount() > 0) then
  begin
     result := true;
  end
  else
  begin
     result := false;
  end

end;


end.
