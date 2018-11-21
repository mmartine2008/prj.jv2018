unit UImportacion;

interface

{
Importacion :
  Unidad para importacion de archivos desde XML y otras fuentes
}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, xmldom,
  XMLIntf, msxmldom, XMLDoc, IBDatabase, IBQuery, UEveDiagnosticoGestacion,
  UEveAltaMasiva, UBDBGrid, Grids, DBGrids, UPrincipal,UDMSoftVet, UCartel,
  UFunctions, UMensajeNuevos, OleServer, ExcelXP, StrUtils;

type
  TRegDEP = record
    datosDEP:array of Variant;
  end;

  TRegErrorDato = record
    filaEx : integer;
    colEx : integer;
    error : boolean;
    valor : Variant;
    campo : String;
  end;

  TRegAnimal = record
    id:integer;
    idImportacion:string;
    datos:array of string;
    errores:array of TRegErrorDato;
    arrDEP:array of TRegDEP;
  end;

  arrAnimales = array of TRegAnimal;

  arrSimple = array of String;

  regDato = record
    nomCampo:string;
    valorCampo:variant;
  end;

  arrGral = Array of regDato;


  TFImportacion = class(TFUniversal)
  XMLDoc: TXMLDocument;
  IBQImportacion: TIBQuery;
  private
    { Private declarations }
  protected
    function pertenece(valor:string;arreglo:arrSimple):boolean;
    procedure ProcesarNodo(Node : IXMLNode;i:integer);overload;virtual;
    procedure ProcesarNodo(fila:integer);overload;virtual;
    procedure ReemplazarChar(archi:string;old:string;new:string);
    procedure agregarDatosGrales(gral:IXMLNode;i:integer);overload;virtual;
    function obtenerRP(id:integer):string;
    function normalizarFecha(fecha:string):string;
    function mostrarCartel : Boolean;
    procedure swap(var ptr1: TRegAnimal; var ptr2: TRegAnimal );
    procedure cargarEnLista(var disp:TStringList;ds:TIBQuery;campo:string);
//    function documentoValido;virtual;
    procedure buscarCamposRequeridos(ts:TTabSheet);
    procedure chequearControl(control:TControl);
  public
    arrNuevos:arrSimple;
    hayNuevos:boolean;
    hayTorosNuevos: boolean;
    nuevoResp, nuevoPotrero, nuevoRodeo: String;
    function GetVista(SQL : String) : String;
    procedure cargar(arch:TFileName);overload;virtual;
    function getPosicion(str:string;arr:arrAnimales;evento:Integer):integer;
    procedure sort(var arreglo:arrAnimales;first,last: Integer );
    function particion(var arreglo:arrAnimales;izquierda, derecha:Integer ):Integer;
    function cantAnimales:integer;
    function cantRepes(i:integer;rp:string):integer;
  end;

procedure abrirArchivo(owner:TComponent;archivo:TFileName);
function getDato(campo:string;animal:TRegAnimal):Variant;
procedure setDato(campo:string;valor:Variant;var animal:TRegAnimal);
function getDatoDEP(campo:string;arrDEP:TRegDEP):Variant;
function existeCampo(campo:string):boolean;
function normalizarFloat(nro:string):double;

var
  FImportacion: TFImportacion;
  anim:arrAnimales;
  tipoCC,tipoEv:string;
  codEv: integer;
  deps:boolean;
  campos:TStringList;// array of String;
  cargaDeMovil,cargaTemp:boolean;

implementation

{$R *.dfm}
uses UMensajeHuella,UAbmEmpleados,UAbmRodeos,UEvePeso,UImpXML,UimpXLS,UAvanceTerminar, UImpGesReader,
  UEveSimple, UMensajeEdades, UImpDeps, UDBControl, UDBLookupComboBoxAuto, EditAuto, UImpVesta,
  DateTimePickerAuto,MemoAuto, UEveBaja, UEveImportarPartosNacimientos, UTraduccion;

procedure TFImportacion.cargar(arch:TFileName);begin end;
procedure TFImportacion.ProcesarNodo(fila:integer);begin end;
procedure TFImportacion.ProcesarNodo(Node : IXMLNode;i:integer);begin end;
procedure TFImportacion.agregarDatosGrales(gral:IXMLNode;i:integer);begin end;


procedure TFImportacion.ReemplazarChar(archi:string;old:string;new:string);   //Para poder cargar el xml, reemplaza el caracter old por new (para las ñ)
 var
   fileData : TStringList;
   lines, i : Integer;
 begin
   fileData := TStringList.Create;
   fileData.LoadFromFile(archi);
   lines := fileData.Count;
   for i:=0 to lines-1 do
      filedata[i]:= StringReplace(filedata[i],old,new,[rfIgnoreCase,rfReplaceAll]);
    filedata.SaveToFile(archi);
end;

function TFImportacion.GetVista(SQL : String) : String;
var
  pos : Integer;
  Buf : String;
begin
  Result := SearchBuf(PAnsiChar(SQL),Length(SQL),0,0,'VIS_',[soDown]);
  pos := PosEx(' ',Result);
  if pos > 0 then
  begin
    SetLength(Buf,pos);
    StrLCopy(PAnsiChar(Buf),PAnsiChar(Result),pos);
    Result := Buf;
  end;
end;

function TFImportacion.obtenerRP(id:integer):string;
begin
    if DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',id,'ID_RP') <> null then
      obtenerRP:=DMSoftvet.IBQDatosAnimal.Lookup('ID_ANIMAL',id,'ID_RP')
    else
      obtenerRP:='';
end;

function TFImportacion.normalizarFecha(fecha:string):string;
var dia,mes,anio:string;
    strings:TStringList;
    strAux:PChar;
begin
  strings:=TStringList.Create;
  strAux:=pchar(fecha);
  ExtractStrings(['-'],[' '],strAux,TStrings(strings));
  anio:=strings[0];
  mes:=strings[1];
  dia:=strings[2];
  normalizarFecha:=dia+'/'+mes+'/'+anio;
  {i:=1;
  while fecha[i]<>'-' do
    begin
    anio:=anio+fecha[i];
    i:=i+1;
    end;
  i:=i+1;
  while fecha[i]<>'-' do
    begin
    mes:=mes+fecha[i];
    i:=i+1;
    end;
  i:=i+1;
  while fecha[i]<>'' do
    begin
    dia:=dia+fecha[i];
    i:=i+1;
    end;
  normalizarFecha:=dia+'/'+mes+'/'+anio;}
end;

function normalizarFloat(nro:string):double;
var
    flt:double;
    aux : String;
begin
   { if nro<>'' then
      begin
      GetLocaleFormatSettings(LOCALE_SDECIMAL,fs);
      Decimalseparator:=fs.DecimalSeparator;
      i:=1;
      if (ansipos(',',nro)<>0) or (ansipos('.',nro)<>0) then
       while nro[i]<>'' do
        begin
        if (nro[i]=',') or (nro[i]='.') then
          nro[i]:=Decimalseparator;
        i:=i+1;
        end;
      flt:=strtofloat(nro);
      normalizarFloat:=flt;
      end;   }
   aux := FixDecimal(nro);
   if tryStrToFloat(aux,flt) then
    Result := flt
   else
    Result := 0;
end;
{#1 INICIO 28/11/2014 Matias Rizzi}
{#2 INICIO 02/12/2014 Matias Rizzi}
procedure abreBarra();
BEGIN
 // IF NOT ((FImportacion.owner is TFEveDiagnosticoGestacion)
 //       OR (FImportacion.owner is TFEveAltaMasiva)) THEN
 //  BEGIN
    try
      FAvanceTerminar:=TFAvanceTerminar.Create(FImportacion.owner);
      FAvanceTerminar.Modo:=maDetalle;
      FAvanceTerminar.LTitulo.Caption:=Traducir('Abriendo Archivo');
    except
    end;  
  //  END;
END;

procedure cierraBarra();
BEGIN
  IF NOT ((FImportacion.owner is TFEveDiagnosticoGestacion)
      OR (FImportacion.owner is TFEveAltaMasiva)) THEN
    BEGIN
      FAvanceTerminar.Destroy;
    END;
END;
{#2 FIN 02/12/2014 Matias Rizzi}
{#1 FIN 28/11/2014 Matias Rizzi}

procedure abrirArchivo(owner:TComponent ;archivo:TFileName);
begin
  //aca se define que subclase se instancia de acuerdo al tipo de archivo
  if (uppercase(ExtractFileExt(archivo))='.XLS') or (uppercase(ExtractFileExt(archivo))='.XLSX') then FImportacion:=TFImpXLS.Create(owner);
  if uppercase(ExtractFileExt(archivo))='.XML' then FImportacion:=TFImpXML.Create(owner);
  if uppercase(ExtractFileExt(archivo))='.TXT' then FImportacion:=TFImpGesReader.Create(owner);
  if uppercase(ExtractFileExt(archivo))='.CSV' then FImportacion:=TFImpVesta.Create(owner);


    DMSoftvet.IBQDatosAnimal.Close;
    DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQDatosAnimal.Open;
    DMSoftvet.IBQParamEstablecimiento.Close;
    DMSoftvet.IBQParamEstablecimiento.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQParamEstablecimiento.Open;
    DMSoftvet.IBQRodeo.Close;
    DMSoftvet.IBQRodeo.ParamByName('esta').Value:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQRodeo.Open;
    DMSoftvet.IBQPotrero.Close;
    DMSoftvet.IBQPotrero.ParamByName('establecimiento').Value:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQPotrero.Open;
    DMSoftvet.IBQResponsable.Close;
    DMSoftvet.IBQResponsable.ParamByName('idestablecimiento').Value:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQResponsable.Open;

  cargaDeMovil:=true;
  deps:=false;
{#1 INICIO 28/11/2014 Matias Rizzi}
  abreBarra();
{#1 FIN 28/11/2014 Matias Rizzi}
  SetLength(anim,0);
  SetLength(arrNuevos,0);
//  setLength(campos,0);
  campos.clear();

  FImportacion.cargar(archivo);

  {#1 INICIO 28/11/2014 Matias Rizzi}
  cierraBarra();

{#1 FIN 28/11/2014 Matias Rizzi}
  try
    if (FImportacion.hayNuevos) and ((FImportacion.owner is TFEveSimple)) then

      if not FImportacion.mostrarCartel then
         raise Exception.Create('Se cancelo la accion');
    except
    end;
end;

function TFImportacion.pertenece(valor:string;arreglo:arrSimple):boolean;
var i:integer;
begin
  pertenece:=false;
  for i:=0 to Length(arreglo)-1 do
    if valor=arreglo[i] then
      begin
      pertenece:=true;
      break;
      end;
end;

function TFImportacion.mostrarCartel : Boolean;
var lista,listaIE,disp, ListaCat, ListaRaza:TStringList;
    i,aux_eve:integer;
    rpmadre: string;
begin
        disp:=TStringList.Create;
        lista:=TStringList.Create;
        listaIE:=TStringList.Create;
        ListaCat:=TStringList.Create;
        ListaRaza := TStringList.Create;

        disp.Add('Dar de alta');
        disp.Add('Ignorar');
        if owner is TFImpDeps then
        begin
          deps:=true;
          cargarEnLista(disp,dmsoftvet.IBQDatosAnimal,'ID_RP');
          //cargarEnLista(disp,dmsoftvet.IBQAnimExt,'ID_RP');
         end;
        if owner is TFEveSimple then
          with Owner as TFEveSimple do
          begin
            if TipoEvento = 49 then
              cargarEnLista(disp,msimple.IBQDisponibles,'ID_RP')
            else
            begin
              MSimple.BDBGDisponibles.Hide;
              cargarEnLista(disp,msimple.IBQDisponibles,'ID_RP');
              MSimple.BDBGDisponibles.Show;
            end;
          end;
        for i:=0 to Length(anim)-1 do
          if anim[i].id=-1 then
                begin
                if Owner is TFEveSimple then
                  if (Owner as TFEveSimple).TipoEvento = 49 then
                    begin
                      rpmadre:=getDato('RP (Madre Evento)',anim[i]);
                      if rpmadre='' then rpmadre:= getDato('caravana',anim[i]); //SOLO DEBE OCURRIR EN IMPORTACION NACIMIENTOS XML
                      lista.Add(rpmadre);
                    end
                  else
                    lista.Add(getDato('RP',anim[i]))
                else
                  lista.Add(getDato('RP',anim[i]));
                listaIE.Add(getDato('IE',anim[i]));
                ListaCat.Add(getDato('categoría',anim[i]));
                ListaRaza.Add(getDato('raza',anim[i]));
                end;
          if Owner is TFEveSimple then
            if (Owner as TFEveSimple).TipoEvento = 49 then
              aux_eve := 49
            else
              aux_eve := 0
          else
            aux_eve := 0;

        LogMensaje('Existen animales que no se encuentran cargados en Huella. Cierre el evento y verifique su planilla');
        LogMensaje('Clase [lista]');
        for i := 0 to Lista.Count -1 do
        begin
          LogMensaje(Lista.Strings[i]);
        end;
        LogMensaje('Clase [disp]');        
        for i := 0 to disp.Count -1 do
        begin
          LogMensaje(disp.Strings[i]);
        end;
        MostrarMensaje(tmError, 'Existen animales que no se encuentran cargados en Huella. Cierre el evento y verifique su planilla');


        Result := False;
end;

function TFImportacion.getPosicion(str:string;arr:arrAnimales;evento:Integer):integer;
var
  i:integer;
  aux_rp : String;
begin
  getPosicion:=-1;
  case evento of
    0 : aux_rp := 'RP';
    49 : aux_rp := 'rp (Madre Evento)';
  end;
  for i:=0 to length(arr)-1 do
    begin
    if (length(arr[i].datos)>0) and (Length(arr[i].arrDEP)=0) and ((String(getDato(aux_rp,arr[i]))=str) or (String(getDato('IE',arr[i]))=str)) then
      begin
      getPosicion:=i;
      break;
      end;
    if (length(arr[i].arrDEP)>0) and (getDatoDEP('HB',arr[i].arrDEP[0])=str) then
      begin
      getPosicion:=i;
      break;
      end;
    end;
end;

function TFImportacion.cantRepes(i:integer;rp:string):integer;
var ind,cant,j:integer;
    animal,str:string;
begin
cant:=0;
for ind:=0 to i do
  begin
  j:=1;
  str:='';
  animal:=getDato('rp',anim[ind]);
  while (animal[j]<>'(') and (animal[j]<>'') do
    begin
    str:=str+animal[j];
    j:=j+1;
    end;
  if str=rp then
    cant:=cant+1;
  end;
  cantRepes:=cant;
end;

procedure TFImportacion.sort(var arreglo:arrAnimales;first,last: Integer );
var posicionActual: Integer;
begin
   if ( first >= last ) then
      exit;
   posicionActual:= particion( arreglo, first, last );
   sort( arreglo, first, posicionActual - 1 );
   sort( arreglo, posicionActual + 1, last );
end;

function TFImportacion.particion(var arreglo:arrAnimales;izquierda, derecha:Integer ):Integer;
var posicion: Integer;
begin

   posicion:= izquierda;
   while ( true ) do
    begin
      while ((getDato('rp',arreglo[posicion]))<= getDato('rp',arreglo[derecha]) AND (posicion <> derecha)) do
         dec(derecha);
      if (posicion = derecha) then
        begin
          result:= posicion;
          exit;
        end;
      if (getDato('rp',arreglo[posicion]) > getDato('rp',arreglo[derecha])) then
       begin
         swap(arreglo[posicion], arreglo[derecha]);
         posicion:= derecha;
       end;
      while ((getDato('rp',arreglo[izquierda]) <= getDato('rp',arreglo[posicion])) AND (izquierda <> posicion)) do
         inc(izquierda);
      if (posicion = izquierda) then
        begin
          result:=posicion;
          exit;
        end;
      if (getDato('rp',arreglo[izquierda]) > getDato('rp',arreglo[posicion])) then
       begin
         swap(arreglo[posicion], arreglo[izquierda]);
         posicion:= izquierda;
       end;
    end;
end;

procedure TFImportacion.swap(var ptr1: TRegAnimal; var ptr2: TRegAnimal );
var temp: TRegAnimal;
begin
   temp:= ptr1;
   ptr1:= ptr2;
   ptr2:= temp;
end;

procedure TFImportacion.cargarEnLista(var disp:TStringList;ds:TIBQuery;campo:string);
begin
  ds.Close;
  ds.Open;
  ds.First;
  while not ds.eof do
    begin
    if (ds.FieldValues[campo]<>null) then
      disp.Add(ds.FieldValues[campo])
    else
      disp.Add(ds.FieldValues['ID_RP']);
    ds.Next;
    end;
  ds.First;
end;

procedure TFImportacion.buscarCamposRequeridos(ts:TTabSheet);
var i:integer;
begin
for i:=0 to ts.ControlCount-1 do
    begin
    chequearControl(ts.Controls[i]);
    end;
end;

procedure TFImportacion.chequearControl(control:TControl);
var j:integer;
begin
  if  control.ClassType = TGroupBox then
    for j:=0 to TGroupBox(control).ControlCount-1 do
      chequearControl(TGroupBox(control).Controls[j])
  else
    begin
      if control.ClassType = TDBLookupComboBoxAuto then
        if TDBLookupComboBoxAuto(control).EsRequerido then
          showmessage(TDBLookupComboBoxAuto(control).Name);
      if (control).ClassType = TDateTimePickerAuto then
        if TDateTimePickerAuto(control).EsRequerido then
          showmessage(TDateTimePickerAuto(control).Name);
      if (control).ClassType = TEditAuto then
        if TEditAuto(control).EsRequerido then
          showmessage(TEditAuto(control).Name);
      if (control).ClassType = TMemoAuto then
        if TMemoAuto(control).EsRequerido then
          showmessage(TMemoAuto(control).Name);
    end;
end;

///////////////////////////////////////////////////////////
// BUSCA ENTRE TODOS LOS CAMPOS POR NOMBRE
///////////////////////////////////////////////////////////
function getDato(campo:string;animal:TRegAnimal):Variant;
var i:integer;
    tipo:integer;
begin
  result:='';

  for i:=0 to campos.count-1 do //Length(campos)-1 do
    begin
    ///  if(campo = 'RP Madre Biológica' )then
     //   ShowMessage('Itera por: ' + campos[i]);
  // Busco el campo dentro del listado de campos posibles
    //if ansipos(lowerCase(campo),lowerCase(campos[i]))=1 then
    // PARA EL CASO DEL XML, QUE LOS CAMPOS ESTAN CON OTROS NOMBRES, NO SON IE Y RP
    if (lowerCase(campo)='peso') and( tipoEv= 'Importación de Partos y Nacimientos') then
      begin
        result := '';
        Break;
      end
    else
    if (lowerCase(campo)='nombre') and( tipoEv= 'Importación de Partos y Nacimientos') then
      begin
        result := '';
        Break;
      end
    else
    if (lowerCase(campo)='rp (madre evento)') and (lowerCase(campos[i])='caravana')  and( tipoEv= 'Importación de Partos y Nacimientos') then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (lowerCase(campo)='tipo parto') and (lowerCase(campos[i])='tipoparto') then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (lowerCase(campo)='fecha de nacimiento') and (lowerCase(campos[i])='fechaparto') then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (lowerCase(campo)='observación') and (lowerCase(campos[i])='observaciones') then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (lowerCase(campo)='cond. corp') and (lowerCase(campos[i])='condicionc') then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (lowerCase(campo)='cant. dosis') and (lowerCase(campos[i])='cantidaddosis') then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (lowerCase(campo)='ie') and ( (lowerCase(campos[i])='caravanaelectronica') or
                                     (lowerCase(campos[i])='ie') ) then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if ((lowerCase(campo)+'*') = lowerCase(campos[i])) then
      begin
        result := animal.datos[i];
        break;
      end
    else
    // RP o Caravana... Puede venir con diferentes nombres del XLS
    if ( (lowerCase(campo)='rp') or (lowerCase(campo)='caravana') ) and
       ( (lowerCase(campos[i])='caravana') or (lowerCase(campos[i])='rp animal*')
         or (lowerCase(campos[i])='rp*')  or (lowerCase(campos[i])='rp') ) then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (lowerCase(campo)='fecha n') and (lowerCase(campos[i])='edad') then
      begin
        result := IncMonth(now(),-getDato('edad',animal));
        Break;
      end
    else
    if (lowerCase(campo)='condición corporal') and (lowerCase(campos[i])='condicionc') then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (lowerCase(campo)='cronología dentaria') and (lowerCase(campos[i])='cronologiad') then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (lowerCase(campo)='método') and (lowerCase(campos[i])='metododiagnostico') then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (lowerCase(campo)='estado reproductivo') and (lowerCase(campos[i])='estadorep') then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    //if ansipos(lowerCase(campo),lowerCase(campos[i]))=1 then
    //  result := animal.datos[i]
    //else
    if (lowerCase(campo)=lowerCase(campos[i])) then
      begin
        result := animal.datos[i];
        Break;
      end
    else
    if (ansipos(lowerCase(campo),lowerCase(campos[i]))=1) and (not((lowercase(campo)='peso') and (lowercase(campos[i])='pesoactivo'))) and (not((lowercase(campo)='gdr') and (lowercase(campos[i])='gdractivo'))) and (not((lowercase(campo)='fecha') and (lowercase(campos[i])='fechanac'))) then
      begin
        //ShowMessage('campo: '+campo + ' campos['+IntToStr(i)+']' +campos[i] );
        if (lowerCase(campo)='nombre') and (lowerCase(campos[i])='nombre del servicio') then
          result := ''
        else
          begin
            tipo:=varType(animal.datos[i]);
            case tipo of
              varInteger : result:=strtoint(animal.datos[i]);
              varDouble : result:=normalizarfloat(animal.datos[i]);
              varDate : result:=strtodatetime(animal.datos[i]);
            else
              result:=animal.datos[i];
            end;
          end;
        break;
      end;
    end
end;

procedure setDato(campo:string;valor:variant;var animal:TRegAnimal);
var i:integer;
begin
for i:=0 to campos.count-1 do //Length(campos)-1 do
  //if ansipos(lowerCase(campo),lowerCase(campos[i]))=1 then // FALLA EN CARAVANA PORQUE EMPIEZA IGUAL
 // RP o Caravana... Puede venir con diferentes nombres del XLS
    if ( (lowerCase(campo)='rp') or (lowerCase(campo)='caravana') ) and
       ( (lowerCase(campos[i])='caravana') or (lowerCase(campos[i])='rp animal*')
         or (lowerCase(campos[i])='rp*')  or (lowerCase(campos[i])='rp') ) then
       begin
       animal.datos[i]:=valor;
       break;
    end
    else
    if (lowerCase(campo)=lowerCase(campos[i])) then
    begin
    if valor<>null then
      begin
      animal.datos[i]:=valor;
      end;
    break;
    end;
end;

function getDatoDEP(campo:string;arrDEP:TRegDEP):Variant;
var i,tipo:integer;
begin
//getDatoDEP:='';
for i:=0 to campos.count-1 do //Length(campos)-1 do
  if ansipos(lowerCase(campo),lowerCase(campos[i]))=1 then
    begin
    tipo:=varType(arrDEP.datosDEP[i-1]);
    case tipo of
      varInteger  :getDatoDEP:=strtoint(arrDEP.datosDEP[i-1]);
      varDouble   :getDatoDEP:=normalizarfloat(arrDEP.datosDEP[i-1]);
      varDate     :getDatoDEP:=strtodatetime(arrDEP.datosDEP[i-1]);
      else         getDatoDEP:=arrDEP.datosDEP[i-1];
      end;
    //getDatoDEP:=arrDEP.datosDEP[i];
    break;
    end;
end;

function TFImportacion.cantAnimales:integer;
var i:integer;
begin
i:=0;
while anim[i].id<>0 do
  i:=i+1;
cantAnimales:=i;
end;

function existeCampo(campo:string):boolean;
var i:integer;
begin
existeCampo:=false;

for i:=0 to campos.count-1 do //Length(campos)-1 do
  if ansipos(ansilowercase(campo),ansilowercase(campos[i]))=1 then
    begin
    existeCampo:=true;
    break;
    end;
end;

end.

