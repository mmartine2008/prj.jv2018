unit UFunctions;

interface

uses IBQuery, UBDBGrid, MemoAuto, IBCustomDataSet, Variants, DB, UAvanceTerminar,
     SysUtils, ExtCtrls, Types, Jpeg, ActiveX, ShlObj, ComObj, Windows, Graphics;

type
 IExtractImage = interface ['{BB2E617C-0920-11d1-9A0B-00C04FC2D6C1}'] // http://msdn2.microsoft.com/en-us/library/bb761848(VS.85).aspx
  function GetLocation(pszPathBuffer: LPWSTR; cchMax: DWORD; var pdwPriority: DWORD; const prgSize: SIZE; dwRecClrDepth: DWORD; var pdwFlags: DWORD): HRESULT; stdcall;
  function Extract(var phBmpImage: HBITMAP): HRESULT; stdcall;
 end;

function CantidadDias(Desde,Hasta: TDatetime): integer;

function CalcularFrameMachos(AlturaEnPulgadas: Double;  Dias: integer): Double;
function CalcularFrameHembras(AlturaEnPulgadas: Double;  Dias: integer): Double;

function CantidadMeses(desde: Tdatetime;  hasta: tdatetime): string;
function CantidadRepetidos(Campo: string; Valor: string; IBQRepetidos: TIBQuery; sentencia : string ): integer;
procedure BuscarRepetidosEnColumna(Columna: string; consulta : TDataSource; grilla : TBitDBGrid; IBQRepetidos : TIBQuery; MAErrors : TMemoAuto; actualizador : TDataSource; sentencia : string );
procedure MarcarError(ew:string; actualizacion : TIBDataSet );
function retornarEstado(IBQAux: TIBQuery ;id_animal:integer): string;
function encriptar(clave:string; tamanio:integer):string;
function IncrementarIdentificadorCUIG(Ultimo : String) : String;
function IncrementarIdentificadorCUIGX(Ultimo : String; cant : Integer) : String;
function CheckFormatoCUIG(Valor : String) : Boolean; //verifica el cuig entero
function CheckFormatoCUIGEncabezado(Valor : String) : Boolean;
function CheckFormatoCUIGUltimoIdent(Valor : String) : Boolean;

function CheckFormatoReidentificacion(Valor : String) : Boolean; //verifica la reidentificacion entero
function CheckFormatoReidentificacionEncabezado(Valor : String) : Boolean;
function CheckFormatoReidentificacionUltimoIdent(Valor : String) : Boolean;

function CheckSENASAViejo(Valor : String) : Boolean; //verifica el senasaviejo


function CrearDirectorio(dir: String):Boolean;

function EsUnEmailValido(EMail: string): Boolean;
//quicksort

procedure quicksort(var arreglo:array of variant;first,last: Integer );
function particion(var arreglo:array of variant;izquierda, derecha:Integer ):Integer;
procedure swap(var ptr1: variant; var ptr2: variant );

Function CompletarDigitosSenasa(idsenasa: String): String;

function verificarRol(usuario: Integer): String;

function DigitoVerificadorCaravana(caravana: String): Integer;

function VerificarRenspa(renspa: String): Boolean;

function normalizarCC(cc:string;tipo:string):string;

function sinAcento(str:string):string;

procedure separarNombre(nomYap:string;var nombre:string;var apellido:string);

function IsInteger(S: String): Boolean;

function IsFloat(S: String): Boolean;

procedure CambiarTamanioImagen(I: TImage; archivo: String);

procedure CargaJPGProporcionado( archivo: string;
                                const QueImage: TImage);

function GetThumbnail(lpPathName, lpFileName: PWideChar; Width, Height: Integer): TBitmap;

function FixDecimal(Valor : String) : String;

function VerificarCantEstablecimientosBase() : Boolean;

function VerificarCantAnimalesBase(mas : Integer) : Boolean;

function LimpiarMultiByteChars(Cadena : String) : String;

function LimpiarCadenadeCaracteres(Cadena : String) : String;

// Incidencia 639. Mariano Martinez. 25/05/2016
function generaCaravanaOficial(prefijo, mascara:string; indice:integer):string;


const dias_mes:integer = 30;

var letrasVerificador: array['A'..'Z'] of integer = (65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90);
var factorSecuenciaVerificador: array[1..12] of integer = (7,6,5,4,3,2,7,6,5,4,3,2);

implementation
uses DateUtils, UDMSoftvet, UPrincipal, Classes, UMensajeHuella, StrUtils;

// marca los errores en la grilla
procedure MarcarError(ew:string; actualizacion : TIBDataSet );
begin

  if ((actualizacion.FieldByName('ew').AsString  = 'E') and (ew = 'M')) or (ew = 'E') or (ew = '') then
    begin
      actualizacion.Edit;
      actualizacion.FieldByName('ew').AsString := ew;
    end;
end;

function LimpiarCadenadeCaracteres(Cadena : String) : String;
var
  aux : String;
begin
  aux := StringReplace(Cadena,'"','',[rfReplaceAll]);
  aux := StringReplace(aux,'*','',[rfReplaceAll]);
  aux := StringReplace(aux,'<','',[rfReplaceAll]);
  aux := StringReplace(aux,'>','',[rfReplaceAll]);
  aux := StringReplace(aux,'/','',[rfReplaceAll]);
  aux := StringReplace(aux,'\','',[rfReplaceAll]);
  aux := StringReplace(aux,'?','',[rfReplaceAll]);
  aux := StringReplace(aux,':','',[rfReplaceAll]);
  aux := StringReplace(aux,'|','',[rfReplaceAll]);
  Result := aux;
end;

function VerificarCantEstablecimientosBase() : Boolean;
var
  cantEsta : Integer;
begin
  DMSoftvet.IBQCantEstablecimientos.Close;
  DMSoftvet.IBQCantEstablecimientos.Open;
  cantEsta := DMSoftvet.IBQCantEstablecimientos.FieldValues['cant'] + 1;
  if cantEsta <= FPrincipal.CantMaximaDeEstablecimientos then
    Result := true
  else
  begin
    MostrarMensaje(tmError,'Ha superado la cantidad permitida de establecimintos (maximo '+IntToStr(FPrincipal.CantMaximaDeEstablecimientos)+' establecimientos)');
    Result := False;
  end;
end;

function VerificarCantAnimalesBase(mas : Integer) : Boolean;
var
  cantAnimales : Integer;
begin

  DMSoftvet.IBQCantAnimalesActivos.Close;
  DMSoftvet.IBQCantAnimalesActivos.Open;
  cantAnimales := DMSoftvet.IBQCantAnimalesActivos.FieldValues['cant'];
  if cantAnimales+mas <= FPrincipal.CantMaximaDeAnimales then
    Result := true
  else
  begin
    MostrarMensaje(tmInformacion,'Se ha superado la cantidad de animales permitida (maximo '+IntToStr(FPrincipal.CantMaximaDeAnimales)+' animales)');
    Result := false;
  end;

end;

function FixDecimal(Valor : String) : String;
var
  Separador, Otro : String;
begin
  Separador := SysUtils.DecimalSeparator;
  if Separador = '.' then
    Otro := ','
  else
    Otro := '.';
  Result := StringReplace(Valor,Otro,Separador,[]);
end;


// busca en la columna de un grilla si existen repetidos
procedure BuscarRepetidosEnColumna(Columna: string; consulta : TDataSource; grilla : TBitDBGrid; IBQRepetidos : TIBQuery; MAErrors : TMemoAuto; actualizador : TDataSource; sentencia : string );
var
  bool : boolean;
begin

  consulta.DataSet.First;
  //if FAvanceTerminar=nil then
  FAvanceTerminar := TFAvanceTerminar.Create(nil);
  FAvanceTerminar.Pos := 1;
  FAvanceTerminar.Max := consulta.DataSet.RecordCount;
  FAvanceTerminar.Modo := maVerificando;
  FAvanceTerminar.Update;
  FAvanceTerminar.Pos := 1;

  while not(consulta.DataSet.Eof)do
    begin
      bool := false;
      if(grilla.DataSource.DataSet.FieldValues[columna] <> null)then
        begin
          bool := (bool) or (CantidadRepetidos(columna,grilla.DataSource.DataSet.FieldValues[columna], IBQRepetidos, sentencia)>1);
          if(bool)then
            begin
              MarcarError('W', TIBDataSet(actualizador.DataSet));
              //MAErrors.Lines.add('Ya existe el Identificador asignado: '+ grilla.ColumnByField(columna).Title.Caption+ ' = '+ grilla.DataSource.DataSet.FieldValues[columna]);
            end
          else
            MarcarError('', TIBDataSet(actualizador.DataSet));
        end;
      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
      FAvanceTerminar.Update;        
      consulta.DataSet.Next;
    end;
  //FAvanceTerminar.Close;
  FAvanceTerminar.Destroy;
end;


// en la identificacion y el alta masiva busca un identificador repetido
function CantidadRepetidos(Campo: string; Valor: string; IBQRepetidos: TIBQuery; sentencia : string ): integer;
begin
  IBQRepetidos.Close;
  IBQRepetidos.SQL.Text := sentencia;
  IBQRepetidos.SQL.Add('where ( '+Campo+'= '''+valor+''')');  
  IBQRepetidos.Open;
  result := IBQRepetidos.FieldValues['cantidad'];
end;

(*
  Calcula la cantidad de dias existentes entre 2 fechas
*)
function CantidadDias(Desde,Hasta: TDatetime): integer;
begin
    CantidadDias := DaysBetween(hasta,desde);
end;


(*
  Calcula en Frame de un Animal de acuerdo a sus dias de vida y Altura [en Pulgadas]
*)
function CalcularFrameMachos(AlturaEnPulgadas: Double;  Dias: integer): Double; 
var uno,dos,tres,cuatro,cinco,frame : Double;
    Meses: Integer;//agregue codigo
begin
   frame:=0; //agregue codigo
   Meses:= trunc(Dias / 30);   
   if ((AlturaEnPulgadas) >= 23) then //agregue codigo que la altura sea mayor a 60 cm o 23 pulgadas
     if ((Meses >= 5) and (Meses <= 21)) then//agregue codigo puse meses
      begin
        uno := -11.548;
        dos := 0.4878;
        tres := 0.0289;
        cuatro := 0.00001947;
        cinco := 0.0000334;
        frame := uno + (dos * AlturaEnPulgadas) - (tres * Dias) + (cuatro * (Dias * Dias)) + (cinco * AlturaEnPulgadas * Dias);
        //Result :=StrtoFloat(FormatFloat('000.00',frame));
      end;
   Result :=StrtoFloat(FormatFloat('000.00',frame));
end;


function CalcularFrameHembras(AlturaEnPulgadas: Double;  Dias: integer): Double;
var uno,dos,tres,cuatro,cinco,frame : Double;
    Meses: Integer;//agregue codigo
begin
   frame:=0; //agregue codigo
   Meses:= trunc(Dias / 30);
   if ((AlturaEnPulgadas) >= 23) then //agregue codigo que la altura sea mayor a 60 cm o 23 pulgadas
     if ((Meses >= 5) and (Meses <= 21)) then//agregue codigo puse meses
      begin
        uno := -11.7086;
        dos := 0.4723;
        tres := 0.0239;
        cuatro := 0.0000146;
        //cinco := 0.0000459;
        cinco := 0.0000759;//cambie codigo
        frame := uno + (dos * AlturaEnPulgadas) - (tres * Dias) + (cuatro * (Dias * Dias)) + (cinco * AlturaEnPulgadas * Dias);
        //Result :=StrtoFloat(FormatFloat('000.00',frame));
      end;
   Result :=StrtoFloat(FormatFloat('000.00',frame));
end;

function CantidadMeses(desde: Tdatetime;  hasta: tdatetime): string;
var
  edad : integer;
  res  : string;
begin
{ Asi esta en la base el calculo de edad
      edad = (actual - nacimiento)/365;
      if (edad < 2) then
        EdadCaption = cast(((actual - nacimiento)/30) as varchar(6))||' meses';
      else
        EdadCaption = cast(edad as varchar(6))||' años';
}
   edad := DaysBetween(hasta, desde) div 365;
   if (edad < 2) then
      res := IntToStr(DaysBetween(hasta, desde) div 30) + ' meses'
   else
      res := IntToStr(edad) + ' años';

  Result := res;
end;

// para mostrar el estado del animal
function retornarEstado(IBQAux: TIBQuery;id_animal:integer): string;
begin

  IBQAux.Close;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select estado_actual from GEN_estado_actual(:animal)');
  IBQAux.ParamByName('animal').AsInteger := id_animal;// animal
  IBQAux.Active := true;

  result := IBQAux.fieldByName('estado_actual').AsString;
end;

function encriptar(clave:string; tamanio : integer):string;
var i : integer;
    retorno : string;
    letra, ultima : char;
    letraConvert : byte;
begin
  retorno := '';
  ultima := clave[length(clave)];
  if (Length(clave) < tamanio) then
    for i := Length(clave) to tamanio do
      clave := clave + ultima;

  for i := 1 to Length(clave) do
    begin
      letra := clave[i];
      letraConvert := ((((ord(letra)*i)mod 255) xor ord(char(255))) mod 220) + 35;
      retorno := retorno + char(letraConvert);
    end;
  result := retorno;
end;

procedure quicksort(var arreglo:array of variant;first,last: Integer );
var posicionActual: Integer;
begin
   if ( first >= last ) then
      exit;
   posicionActual:= particion( arreglo, first, last );
   quicksort( arreglo, first, posicionActual - 1 );   
   quicksort( arreglo, posicionActual + 1, last );
end;

function particion(var arreglo:array of variant;izquierda, derecha:Integer ):Integer;
var posicion: Integer;
begin

   posicion:= izquierda;
   while ( true ) do
    begin
      while ((arreglo[posicion] <= arreglo[derecha]) AND (posicion <> derecha)) do
         dec(derecha);
      if (posicion = derecha) then
        begin
          result:= posicion;
          exit;
        end;
      if (arreglo[posicion] > arreglo[derecha]) then
       begin
         swap(arreglo[posicion], arreglo[derecha]);
         posicion:= derecha;
       end;
      while ((arreglo[izquierda] <= arreglo[posicion]) AND (izquierda <> posicion)) do
         inc(izquierda);
      if (posicion = izquierda) then
        begin
          result:=posicion;
          exit;
        end;
      if (arreglo[izquierda] > arreglo[posicion ]) then
       begin
         swap(arreglo[posicion], arreglo[izquierda]);
         posicion:= izquierda;   
       end;
    end;
end;

procedure swap(var ptr1: variant; var ptr2: variant );
var temp: variant;
begin
   temp:= ptr1;
   ptr1:= ptr2;
   ptr2:= temp;
end;

function CompletarDigitosSenasa(idsenasa: String): String;
var largoSenasa, aux: Integer;
    auxSenasa: String;
begin
  largoSenasa:= Length(idsenasa);
  auxSenasa:= idsenasa;
  if (largoSenasa <= 9) then
    begin
      aux:= 9 - largoSenasa;
      while (aux > 0) do
       begin
         auxSenasa:= '0'+auxsenasa;
         dec(aux);
       end;
      result:= auxSenasa;
    end
   else
     result:= idsenasa;
end;

function verificarRol(usuario: Integer): String;
var rol: Integer;
begin
  UDMSoftvet.DMSoftvet.IBQGeneral.Close;
  UDMSoftvet.DMSoftvet.IBQGeneral.SQL.Clear;
  UDMSoftvet.DMSoftvet.IBQGeneral.SQL.Add('select rol from sys_usuarios where id_usuario='+IntToStr(usuario));
  UDMSoftvet.DMSoftvet.IBQGeneral.Open;

  rol:= UDMSoftvet.DMSoftvet.IBQGeneral.FieldByName('ROL').AsInteger;

  UDMSoftvet.DMSoftvet.IBQGeneral.Close;
  UDMSoftvet.DMSoftvet.IBQGeneral.SQL.Clear;
  UDMSoftvet.DMSoftvet.IBQGeneral.SQL.Add('select * from sys_roles where id_rol='+IntToStr(rol));
  UDMSoftvet.DMSoftvet.IBQGeneral.Open;
  result:= UDMSoftvet.DMSoftvet.IBQGeneral.FieldByName('NOMBRE').AsString;
end;


function DigitoVerificadorCaravana(caravana: String): Integer;
var caravanaAux: String;
    i, sumaMultiplicacion, resto: Integer;
begin
//Convertir las letras a números según la tabla.
  caravanaAux:= '';
  for i:= 1 to Length(caravana) do
   begin
      if (caravana[i] in (['A'..'Z'])) then
        caravanaAux:=caravanaAux + IntToStr(letrasVerificador[caravana[i]])
       else
        caravanaAux:=caravanaAux + caravana[i]
   end;

//Se multiplican los términos por su correspondiente número de la secuencia.
  sumaMultiplicacion:= 0;
  for i:= 1 to Length(caravanaAux) do
     sumaMultiplicacion:= sumamultiplicacion + StrToInt(caravanaAux[i])*factorSecuenciaVerificador[i];

//  El resultado se divide por once y se obtiene el resto

  resto:= sumaMultiplicacion mod 11;

//Si el RESTO es cero, el dígito verificador es cero.

//Si el RESTO es uno, el dígito verificador es uno.

//Si el RESTO no es ni cero ni uno, el dígito verificador es 11 menos el resto.
  if ((resto = 0) or (resto = 1)) then
    result:= resto
   else
     result:= 11 - resto;
end;

function IncrementarIdentificadorCUIG(Ultimo : String) : String;
var
  actual, numero : String;
  letra : Char;
  num : Integer;
begin
if (ultimo <> '') then
 begin
  actual := Ultimo;
  letra := actual[1];
  numero := actual[2]+actual[3]+actual[4];
  num := StrToInt(numero);
  if (num < 999) then
  begin
    num := num+1;
    numero := IntToStr(num);
    if num<10 then numero := '00'+IntToStr(num)
    else if num<100 then numero := '0'+IntToStr(num);
    Result := letra+numero;
  end
  else
  begin
    if (letra = 'Z') then Result := ' '
    else
    begin
      letra := Chr(Ord(letra)+1);
      Result := letra+'000';
    end;
  end;
 end
else
 result:= ultimo; 
end;

function IncrementarIdentificadorCUIGX(Ultimo : String; cant : Integer) : String;
var
  actual, numero : String;
  letra : Char;
  num : Integer;
begin
 if (ultimo <> '') then
  begin
  actual := Ultimo;
  letra := actual[1];
  numero := actual[2]+actual[3]+actual[4];
  num := StrToInt(numero);
  while cant > 0 do
  begin
      if (num < 999) then
      begin
        num := num+1;
        numero := IntToStr(num);
        if num<10 then numero := '00'+IntToStr(num)
        else if num<100 then numero := '0'+IntToStr(num);
        ultimo := letra+numero;
     end
     else
     begin
        if (letra = 'Z') then Result := ' '
        else
        begin
          letra := Chr(Ord(letra)+1);
          ultimo := letra+'000';
        end;
     end;
     actual := Ultimo;
     letra := actual[1];
     numero := actual[2]+actual[3]+actual[4];
     num := StrToInt(numero);
     cant := cant - 1;
   end;
   result:= ultimo;
 end

else
 result:= ultimo;
end;

function VerificarRenspa(renspa: String): Boolean;
var valor: Extended;
    i,largo: Integer;
    RenspaAux: String;
begin
  i:= 1;
  RenspaAux:='';
  Result:= true;
  while (i <= Length(renspa)) do
   begin
     if (renspa[i] <> ' ') then
       RenspaAux:= RenspaAux + renspa[i];
     inc(i);
   end;
  largo:= Length(RenspaAux);
  if (largo = 0) then
    Result:= true
   else
    if (not(TryStrToFloat(RenspaAux, valor)) or (largo <> 13)) then
      Result:= false;
end;

function CheckFormatoCUIG(Valor : String) : Boolean;
begin
  Result := false;
  if (valor<>'') then
  begin
    if (Ord(Valor[1])>=65) and (Ord(Valor[1])<=90) and (Ord(Valor[2])>=65) and (Ord(Valor[2])<=90) then
      if (Ord(Valor[3])>=48) and (Ord(Valor[3])<=57) and (Ord(Valor[4])>=48) and (Ord(Valor[4])<=57) and (Ord(Valor[5])>=48) and (Ord(Valor[5])<=57)then
        if (Ord(Valor[6])>=65) and (Ord(Valor[6])<=90) then
          if (Ord(Valor[7])>=48) and (Ord(Valor[7])<=57) and (Ord(Valor[8])>=48) and (Ord(Valor[8])<=57) and (Ord(Valor[9])>=48) and (Ord(Valor[9])<=57)then
            Result := true;
  end
  else
    Result := true;

end;

function CheckFormatoCUIGEncabezado(Valor : String) : Boolean;
begin
  Result := false;
  if (valor<>'') then
    if (Ord(Valor[1])>=65) and (Ord(Valor[1])<=90) and (Ord(Valor[2])>=65) and (Ord(Valor[2])<=90) then
      if (Ord(Valor[3])>=48) and (Ord(Valor[3])<=57) and (Ord(Valor[4])>=48) and (Ord(Valor[4])<=57) and (Ord(Valor[5])>=48) and (Ord(Valor[5])<=57)then
         Result := true;
end;

function CheckFormatoCUIGUltimoIdent(Valor : String) : Boolean;
begin
  Result := false;
  if (valor<>'') then
    if (Ord(Valor[1])>=65) and (Ord(Valor[1])<=90) then
      if (Ord(Valor[2])>=48) and (Ord(Valor[2])<=57) and (Ord(Valor[3])>=48) and (Ord(Valor[3])<=57) and (Ord(Valor[4])>=48) and (Ord(Valor[4])<=57)then
       Result := true;
end;


function CheckFormatoReidentificacion(Valor : String) : Boolean; //verifica la reidentificacion entero
begin
  Result := false;
  if (valor<>'') then
  begin
    if (Valor[1]='R') then
      if (Ord(Valor[2])>=48) and (Ord(Valor[2])<=57) and (Ord(Valor[3])>=48) and
         (Ord(Valor[3])<=57) and (Ord(Valor[4])>=48) and (Ord(Valor[4])<=57) and
         (Ord(Valor[5])>=48) and (Ord(Valor[5])<=57) then
        if (Ord(Valor[6])>=48) and (Ord(Valor[6])<=57) and (Ord(Valor[7])>=48) and
           (Ord(Valor[7])<=57) and (Ord(Valor[8])>=48) and (Ord(Valor[8])<=57)then
           Result := true;
  end
  else
    Result := true;
end;

function CheckFormatoReidentificacionEncabezado(Valor : String) : Boolean;
begin
  Result := false;
  if (valor<>'') then
    if (Valor[1]='R') then
      if ((Ord(Valor[2])>=48) and (Ord(Valor[2])<=57) and (Ord(Valor[3])>=48) and
         (Ord(Valor[3])<=57) and (Ord(Valor[4])>=48) and (Ord(Valor[4])<=57) and
         (Ord(Valor[5])>=48) and (Ord(Valor[5])<=57)) then
         Result := true;
end;

function CheckFormatoReidentificacionUltimoIdent(Valor : String) : Boolean;
begin
  Result := false;
  if (valor<>'') then
    if ((Ord(Valor[1])>=48) and (Ord(Valor[1])<=57) and (Ord(Valor[2])>=48) and
       (Ord(Valor[2])<=57) and (Ord(Valor[3])>=48) and (Ord(Valor[3])<=57) and
       (Ord(Valor[4])>=48) and (Ord(Valor[4])<=57)) then
       Result := true;
end;

function CheckSENASAViejo(Valor : String) : Boolean;
var
  aux : integer;
begin
  Result := false;

  if (valor<>'') then
    begin
      if TryStrToInt(Valor,aux) then
        Result := true;
    end
  else
    Result := true;
end;

function EsUnEmailValido(EMail: string): Boolean;
var
  s: string;
  ETpos: Integer;
begin
  ETpos := pos('@', EMail);
  if ETpos > 1 then
  begin
    s := copy(EMail, ETpos + 1, Length(EMail));
    if (pos('.', s) > 1) and (pos('.', s) < length(s)) then
      Result := true
    else
      Result := false;
  end
  else
    Result := false;
end;


function CrearDirectorio(dir: String):Boolean;
begin
  Result:=false;
  if (not DirectoryExists(dir)) then
  begin
    MkDir(dir);
    Result:=true;
  end;
end;

function normalizarCC(cc:string;tipo:string):string;
begin
  //VER
  if (cc<>'') and (tipo<>'') then
    begin
    DMSoftvet.IBQParamEstablecimiento.Close;
    DMSoftvet.IBQParamEstablecimiento.ParamByName('establecimiento').Value:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQParamEstablecimiento.Open;
    DMSoftvet.IBQCC.Close;
    DMSoftvet.IBQCC.Open;
    if (DMSoftvet.IBQParamEstablecimiento.Lookup('PARAMETRO',3,'VALOR')='5') and (tipo='1-9') then
       normalizarCC:=DMSoftvet.IBQCC.Lookup('VALOR_ESCALA_10',cc,'VALOR_ESCALA_5')
    else if (DMSoftvet.IBQParamEstablecimiento.Lookup('PARAMETRO',3,'VALOR')='10') and (tipo='1-5') then
       normalizarCC:=DMSoftvet.IBQCC.Lookup('VALOR_ESCALA_5',cc,'VALOR_ESCALA_10')
    else
      normalizarCC:=cc;
    end
  else
    normalizarCC:=cc;
end;

function sinAcento(str:string):string;
var i:integer;
begin
  for i:=1 to Length(str) do
    begin
    if str[i]='á' then str[i]:='a';
    if str[i]='é' then str[i]:='e';
    if str[i]='í' then str[i]:='i';
    if str[i]='ó' then str[i]:='o';
    if str[i]='ú' then str[i]:='u';
    end;
  sinAcento:=str;
end;

procedure separarNombre(nomYap:string;var nombre:string;var apellido:string);
var strings:TStringlist;
    i, k:integer;
    strAux:pChar;
begin
  nombre:='';
  apellido:='';
  if ansipos(',',nomYap)<>0 then
    begin
    strings:=TStringList.Create;
    strAux:=pchar(nomYap);
    ExtractStrings([','],[' '],strAux,TStrings(strings));
    nombre:=trim(strings[1]);
    apellido:=trim(strings[0]);
    end
  else
  begin
    strings:=TStringList.Create;
    strAux:=pchar(nomYap);
    ExtractStrings([' '],[' '],strAux,TStrings(strings));
    case strings.Count of
      1:begin                                apellido:=strings[0]; end;
      2:begin nombre:=strings[0];            apellido:=strings[1]; end;
      3:begin nombre:=strings[0]+' '+strings[1]; apellido:=strings[2]; end;
      4:begin nombre:=strings[0]+' '+strings[1]; apellido:=strings[2]+' '+strings[3]; end;
      else
      begin
        for k := 0 to strings.Count-1 do
          nombre := nombre + strings[k]+' ';
        nombre := Trim(nombre);
      end;
    end;
  end;
end;

function IsInteger(S: String): Boolean;
begin
  try
    Result := True;
    StrToInt(S);
   except
     Result := False;
   end;
end;

function IsFloat(S: String): Boolean;
begin
  try
    Result := True;
    StrToFloat(S);
  except on E: EConvertError do
    Result := False;
  end;
end;

procedure CambiarTamanioImagen(I:TImage; archivo: String);
 var
   R: TRect;
   Image: TImage;
begin
   Image := TImage.Create(nil);

   // Aquí dimensionamos la nueva imagen....

   //porc:= trunc((161)/I.Picture.Graphic.Width);

   Image.Width  := 161;
   Image.Height := 161;
   //Image.Height := Image.Width*porc;

   // Preparamos para la función StretchDraw
    R.Left := 0;
    R.Top := 0;
    R.Bottom := Image.Height;
    R.Right := Image.Width;

   // Copiamos la imagen cambiada de tamaño a Image desde Image1...
   // Image1 esta definida en tiempo de diseño....
   Image.Canvas.StretchDraw(R, I.Picture.Graphic);

   // La salvamos para ver que ha pasado.
   I.Picture:= nil;
   Image.Picture.SaveToFile(archivo);



end;


procedure CargaJPGProporcionado( archivo: string;
                                const QueImage: TImage);
var
 ElJPG        : TJpegImage;
 Rectangulo   : TRect;

 EscalaX,
 EscalaY,
 Escala       : Single;

begin
 ElJPG:=TJPegImage.Create;

 try

   ElJPG.LoadFromFile( Archivo );

   //Por defecto, escala 1:1
   EscalaX := 1.0;
   EscalaY := 1.0;

   //Hallamos la escala de reducción Horizontal
   if QueImage.Width < ElJPG.Width then
     EscalaX := QueImage.Width / ElJPG.Width;

   //La escala vertical
   if QueImage.Height < ElJPG.Height then
     EscalaY := QueImage.Height / ElJPG.Height;

   //Escogemos la menor de las 2
   if EscalaY < EscalaX then Escala:=EscalaY else Escala:=EscalaX;


   //Y la usamos para reducir el rectangulo destino
   With Rectangulo do begin
     Right:=Trunc(ElJPG.Width * Escala);
     Bottom:=Trunc(ElJPG.Height * Escala);
     Left:=0;
     Top:=0;
   end;

   //Dibujamos el bitmap con el nuevo tamaño en el TImage destino
   with QueImage.Picture.Bitmap do begin
     Width  := Rectangulo.Right;
     Height := Rectangulo.Bottom;
     Canvas.StretchDraw( Rectangulo,ElJPG );
   end;
   //Image.Canvas.StretchDraw(R, I.Picture.Graphic);
   //ElJPG.SaveToFile(archivo);
 finally
   ElJPG.Free;
 end;

end;


function GetThumbnail(lpPathName, lpFileName: PWideChar; Width, Height: Integer): TBitmap;
var
 Desktop, Folder: IShellFolder;
 ItemIDList: PItemIDList;
 Flags, Priority: Cardinal;
 ExtractImage: IExtractImage;
 Res: HRESULT;
 hBitmap: Windows.HBITMAP;
 Buffer: array[0..MAX_PATH-1] of WideChar;
 Size: TSize;
begin
 Result := nil;
 SHGetDesktopFolder(Desktop);
 if LongBool(Desktop.ParseDisplayName(0, nil, lpPathName, PDWORD(0)^, ItemIDList, PDWORD(0)^)) then Exit;
 Desktop.BindToObject(ItemIDList, nil, IShellFolder, Folder);
 CoTaskMemFree(ItemIDList);
 if LongBool(Folder.ParseDisplayName(0, nil, lpFileName, PDWORD(0)^, ItemIDList, PDWORD(0)^)) then Exit;
 Folder.GetUIObjectOf(0, 1, ItemIDList, IExtractImage, nil, ExtractImage);
 CoTaskMemFree(ItemIDList);
 if not Assigned(ExtractImage) then Exit; // TODO
 Size.cx := Width; Size.cy := Height; Priority := 0;  
 Flags := $28{IEIFLAG_SCREEN+IEIFLAG_OFFLINE};
 Res := ExtractImage.GetLocation(Buffer, SizeOf(Buffer), Priority, Size, 24{pf32bit}, Flags);
 if (Res = NOERROR) or (Res = E_PENDING{IEIFLAG_ASYNC}) then
  begin
   if not LongBool(ExtractImage.Extract(hBitmap)) then
    begin
     Result := TBitmap.Create;
     Result.Handle := hBitmap;
    end;
  end;
end; 

function extractSimbolFromMultiByteChar(Text: PAnsiChar): Char;
var
  Buffer: Char;
  Size: Integer;
begin
  Size := MultiByteToWideChar(0,0,Text,-1,nil,0);
  if (Size > 0) then
  begin
    MultiByteToWideChar(0 ,MB_COMPOSITE , Text,-1, @Buffer, Size);
    result:=Buffer;
  end;
end;

function LimpiarMultiByteChars(Cadena : String) : String;
var
  i: Integer;
begin
  result:='';
  for I := 1 to Length(Cadena) do
    Result:=Result + extractSimbolFromMultiByteChar(PAnsiChar(AnsiString(Cadena[i])));
end;

{
Esta funcion permite generar una caravana oficial, a partir
de un prefijo tipo ABCD y una mascara 00001. Indice es el numero
que va iterando.
}
function generaCaravanaOficial(prefijo, mascara:string; indice:integer):string;
var
  strMascara, preCaravana: string;
  intMascara: integer;
  diferencia: integer;
  longitud : integer;
begin
  // Obtengo el valor entero de la mascara
  intMascara := StrToInt(mascara);
  // Obtengo el string del valor de la mascara
  strMascara := IntToStr(intMascara);
  longitud := length(mascara);

  // Si son distintos tengo qeu recuperar la diferencia
  //  98 <> 00098
  if (strMascara <> mascara) then
  begin
    diferencia := length(mascara) - length(strMascara);
    preCaravana := StringOfChar('0', diferencia) + intToStr(indice + intMascara);
    // 00098 00099 000100 --> Me tengo que quedar con los ultimos 5
    preCaravana := RightStr(preCaravana, longitud);
    generaCaravanaOficial := prefijo + preCaravana;
  end
  else
  begin
    generaCaravanaOficial := prefijo + intToStr(indice);
  end;

end;

end.
