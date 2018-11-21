unit UImpXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, xmldom,
  XMLIntf, msxmldom, XMLDoc, IBDatabase, IBQuery, UEveDiagnosticoGestacion,
  UEveAltaMasiva, UBDBGrid, Grids, DBGrids, UPrincipal,UDMSoftVet, UCartel,
  UFunctions,UImportacion;

type
TRegNuevos = record
    cadenaXML : String;
    seCorrespondeCon : String;
end;

Correspondencias = Array of TRegNuevos;

Type TFImpXML=class(TFImportacion)
  private
    procedure cargarCampos;
    procedure normalizarCampos;
    function setDefault(campo:string):Variant;
    function getCantToros(documento : TXMLDocument): integer;

//    procedure separarNombre(nomYap:string;var nombre:string;var apellido:string);
  public
  ArrCorrespondencias: Correspondencias;
  tipoDocumento: String;
  function getCorrespondencia(cadena : String): String;

  protected
    procedure ProcesarNodo(nodoAtrib : IXMLNode;i:integer);override;
    procedure agregarDatosGrales(gral:IXMLNode;i:integer);override;
    procedure buscarRodeo(var gral:IXMLNode);
    procedure buscarPotrero(var gral:IXMLNode);
    procedure buscarResp(var gral:IXMLNode);
    procedure cargar(arch:TFileName);override;
    procedure cargarAnimales(XMLDoc : TXMLDocument);
    function documentoValido:boolean;
    procedure procesarToroExterno(toro: IXMLNode);
  end;

implementation

uses UMensajeHuella,UAbmEmpleados,UAbmRodeos,UEvePeso,UMovCargarDatos,UAvanceTerminar,UTraduccion,UABMPotreros, UAbmPadresExternos;

var gral:IXMLNode;

procedure TFImpXML.cargar(arch:TFileName);
begin
      inherited;
      DMSoftvet.IBQParamEstablecimiento.Close;
      DMSoftvet.IBQParamEstablecimiento.ParamByName('ESTABLECIMIENTO').AsInteger:=FPrincipal.EstablecimientoActual;
      DMSoftvet.IBQParamEstablecimiento.Open;
      ReemplazarChar(arch,'ñ','n');
      ReemplazarChar(arch,'á','a');
      ReemplazarChar(arch,'é','e');
      ReemplazarChar(arch,'í','i');
      ReemplazarChar(arch,'ó','o');
      ReemplazarChar(arch,'ú','u');
      try
        XMLDoc.LoadFromFile(arch);
        if documentoValido then
          begin
          tipoDocumento :=  XMLDoc.DocumentElement.NodeName;
          cargaDeMovil:=true;
          cargarAnimales(XMLDoc);
          end
        else
          begin
          MostrarMensaje(tmError,'El documento no corresponde a este tipo de evento. Por favor verifique el archivo');
          cargaDeMovil:=false;
          end;
      XMLDoc.Free;
      except
        MostrarMensaje(tmError,'El documento no corresponde a este tipo de evento. Por favor verifique el archivo');
        cargaDeMovil:=false;
        end;
end;

function TFImpXML.getCantToros(documento : TXMLDocument): integer;
var animal : IXMLNode;
    total: integer;
begin
  total:=0;
  animal := documento.DocumentElement.ChildNodes.Get(0);
  while animal<>nil do
    begin
      if (animal.NodeName='Toro') then
        total:=total+1;
      animal:=animal.NextSibling;
    end;
  getCantToros:=total;
end;

procedure TFImpXML.procesarToroExterno(toro: IXMLNode);
var
  caravana, raza, categoria, apodo: string;
  atributo: IXMLNode;
  aext : TFABMPadresExternos;

begin
  atributo:=toro.ChildNodes.First;
  caravana := atributo.NodeValue;
  atributo:= atributo.NextSibling;
  raza := atributo.NodeValue;
  atributo:= atributo.NextSibling;
  categoria := atributo.NodeValue;
  atributo:= atributo.NextSibling;
  apodo := atributo.NodeValue;

  DMSoftVet.IBQAnimExt.close;
  DMSOftVet.IBQAnimExt.SQL.clear;
  DMSOftVet.IBQAnimExt.SQL.Add('select * from TAB_ANIMALES_EXTERNOS where upper(ID_RP) =:id and ESTABLECIMIENTO = :establecimiento');
  DMSoftVet.IBQAnimExt.ParamByName('id').AsString := UpperCase(caravana);
  DMSoftVet.IBQAnimExt.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  DMSoftvet.IBQAnimExt.Open;
  if (DMSoftVet.IBQAnimExt.RecordCount=0) then    // Si no está dado de alta en animales externos
    begin
      MostrarMensaje(tmInformacion,'Es necesario dar de alta el toro ' + apodo + ' para poder continuar con el evento.');
      aext:= TFABMPadresExternos.Create(self);
      aext.altaDesdeXml := true;
      aext.xmlCaravana := caravana;
      aext.xmlRaza:= raza;
      aext.xmlCategoria := categoria;
      aext.xmlApodo := apodo;
      aext.desdeEvento := -1;
      FPrincipal.AbrirFormNormal(aext);
      //aext.Destroy;
   end;
end;

procedure TFImpXML.cargarAnimales(XMLDoc : TXMLDocument);
var
  animal : IXMLNode;
  i,j:integer;
begin
  XMLDoc.Active := True;
  hayNuevos:=false;
  cargarCampos;

  gral := XMLDoc.DocumentElement.ChildNodes.First;//este seria el nodo donde estan los datos generales
  if gral.ChildValues['fec']<>null then tipoCC:=gral.ChildValues['fec'];
  animal := XMLDoc.DocumentElement.ChildNodes.Get(0); //a partir de aca estan los datos de cada animal
  ////////////
  FAvanceTerminar.Pos := 1;
  FAvanceTerminar.Max := XMLDoc.DocumentElement.ChildNodes.Count-1; //MSimple.FCantidadSeleccionados;
  FAvanceTerminar.Modo := maGuardando;
  FAvanceTerminar.LTitulo.Caption:=Traducir('Importando Animales');
  FAvanceTerminar.Update;
  ////////////

  setLength(anim,XMLDoc.DocumentElement.ChildNodes.Count);
  if (tipoDocumento= 'EventoInseminacion') then
     setLength(anim,Length(anim)-getCantToros(XMLDoc));  //No voy a almacenar los toros en anim

  i:=0;
  while animal <> nil do
    begin
    //////////
    FAvanceTerminar.Pos:= FAvanceTerminar.Pos+1;
    Application.ProcessMessages;
    //////////
    buscarRodeo(animal);
    buscarResp(animal);
    buscarPotrero(animal);
    /////////
    if (tipoDocumento= 'EventoInseminacion') and (animal.NodeName='Toro') then
      procesarToroExterno(animal)
    else
      ProcesarNodo(animal,i);

    animal:=animal.NextSibling;
    i:=i+1;
    end;
  //ShowMessage(getDato('toro',animal));
  XMLDoc.Active := False;
  normalizarCampos;
end;

procedure TFImpXML.ProcesarNodo(nodoAtrib : IXMLNode;i:integer);
var atrib,hijo:IXMLNode;
    strings:TStringList;
    strAux:PChar;
    j:integer;
    atributo: string;
begin
  if nodoAtrib<>nil then
  begin
    setLength(anim[i].datos,0);
    atrib:=nodoAtrib.ChildNodes.First;
    //agregarDatosGrales(gral,i);
    while atrib<>nil do
    begin
    //SetLength(anim[i].datos,Length(campos));
    //En este WHILE lo que hace es acomodar los datos de entrada, segun el campo y el valor.

    //Codigo Ivan XML Nacimientos
      if (atrib.NodeName='Terneros') and (tipoDocumento= 'EventoNacimiento') then
      begin
        hijo := atrib.ChildNodes.First.ChildNodes.First;
        while hijo<>nil do
        begin
          atributo := LowerCase(hijo.NodeName);
          if (atributo = 'caravana') then atributo :='RP (Ternero)*';
          if (atributo = 'nombre') then atributo := 'Nombre (Ternero)';
          if (atributo = 'peso') then atributo := 'Peso (Ternero)';
          SetLength(anim[i].datos,campos.Count);
          setDato(atributo,hijo.NodeValue,anim[i]);
          hijo:= hijo.NextSibling;
        end;
        atrib:= atrib.NextSibling;
      end
      else
    // Fin Codigo Ivan XML Nacimientos

      SetLength(anim[i].datos,campos.Count);
      setDato(LowerCase(atrib.NodeName),atrib.NodeValue,anim[i]);

      if (atrib.NodeName = 'Fecha') then
        setDato('fecha',StringReplace(atrib.NodeValue,'-','/',[rfReplaceAll]),anim[i]);
      if (atrib.NodeName = 'FechaIniServ') then
        setDato('fechainiserv',StringReplace(atrib.NodeValue,'-','/',[rfReplaceAll]),anim[i]);
      if (atrib.NodeName = 'FechaFinServ') then
        setDato('fechafinserv',StringReplace(atrib.NodeValue,'-','/',[rfReplaceAll]),anim[i]);
      if (atrib.NodeName = 'Raza') then
      begin
        if (lowerCase(atrib.NodeValue) = 'angus negro') then
          setDato('raza', 'ABERDEEN ANGUS NEGRO', anim[i]);
        if (lowerCase(atrib.NodeValue) = 'angus colorado') then
          setDato('raza', 'ABERDEEN ANGUS COLORADO', anim[i]);
      end;

      if atrib.NodeName = 'TipoPeso' then
      begin
        setDato('tipopeso','G',anim[i]);
        if atrib.NodeValue = 'GENERAL' then
          setDato('tipopeso','G',anim[i]);
        if atrib.NodeValue = 'AL NACER' then
          setDato('tipopeso','N',anim[i]);
        if atrib.NodeValue = 'AL AÑO' then
          setDato('tipopeso','A',anim[i]);
        if atrib.NodeValue = 'ADULTO' then
          setDato('tipopeso','T',anim[i]);
      end;
      if atrib.NodeName = 'Peso' then
      begin
        setDato('peso',StringReplace(atrib.NodeValue,'.',SysUtils.DecimalSeparator,[rfReplaceAll]),anim[i]);
      end;
      atrib := atrib.NextSibling;
    end;  //end del while

    if (tipoDocumento= 'EventoEvaluacionPreServicio') then
      begin
        SetLength(anim[i].datos,length(anim[i].datos)+1);
        campos.Add('categoria');
        setDato('categoria','VAQUILLONA',anim[i]);
       end;

    if (tipoDocumento= 'EventoNacimiento') then
      begin
        SetLength(anim[i].datos,length(anim[i].datos)+1);
        campos.Add('categoria');
        setDato('categoria','VACA',anim[i]);
      end;

    //DMSOftVet.IBQAnimExt.First;

       //showmessage (DMSoftVet.IBQAnimExt.Lookup('ID_RP','TORO00024,'ID_ANIMAL'));
//    if (getDato('CaravanaElectronica',anim[i])<>'') and (DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('CaravanaElectronica',anim[i]),'ID_ANIMAL')<>null) and (DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('CaravanaElectronica',anim[i]),'ID_ANIMAL')<>'') then
    if (getDato('CaravanaElectronica',anim[i])<>'') and (DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('CaravanaElectronica',anim[i]),'ID_ANIMAL')<>null) then
    begin
      anim[i].id:=DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('CaravanaElectronica',anim[i]),'ID_ANIMAL');
      setDato('Caravana',DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('CaravanaElectronica',anim[i]),'ID_RP'),anim[i]);
    end
    else
    if (DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',getDato('Caravana',anim[i]),'ID_ANIMAL')<>null) then
      anim[i].id:=DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',getDato('Caravana',anim[i]),'ID_ANIMAL')
    else
     begin    //si el animal no existe, el id sera -1
        anim[i].id:=-1;
        //setDato('IE',getDato('CaravanaElectronica',anim[i]),anim[i]);
        //setDato('rp',getDato('Caravana',anim[i]),anim[i]);
        hayNuevos:=true;       //se setea el parametro en true para que despues pregunte si se quieren agregar los animales nuevos
    end;
    //end;

  (*  if (getDato('ie',anim[i])<>'') and (DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('ie',anim[i]),'ID_ANIMAL')<>null) and (DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('ie',anim[i]),'ID_ANIMAL')<>'') then
    begin
      anim[i].id:=DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('ie',anim[i]),'ID_ANIMAL');
      setDato('rp',DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('ie',anim[i]),'ID_RP'),anim[i]);
    end
    else
    begin
      if (DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',getDato('rp',anim[i]),'ID_ANIMAL')<>null) then
        anim[i].id:=DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',getDato('rp',anim[i]),'ID_ANIMAL')
      else
      begin    //si el animal no existe, el id sera -1
        anim[i].id:=-1;
        hayNuevos:=true;       //se setea el parametro en true para que despues pregunte si se quieren agregar los animales nuevos
      end;
    end; *)
  end;
  ShowMessage(getDato('nombretoro',anim[i]));
end;

procedure TFImpXML.agregarDatosGrales(gral:IXMLNode;i:integer);
var atrib:IXMLNode;
    nombre,apellido:string;
begin
    anim[i].idImportacion:=gral.NodeName;
    atrib:=gral.ChildNodes.First;
    while atrib<>nil do
    begin
      setLength(anim[i].datos,Length(anim[i].datos)+1);
      if atrib.NodeValue<>null then
        if ansipos('-',atrib.nodevalue)=5 then
          anim[i].datos[Length(anim[i].datos)-1]:=ansiuppercase(normalizarfecha(atrib.NodeValue))
        else
          if atrib.NodeName='cc' then
            anim[i].datos[Length(anim[i].datos)-1]:=ansiuppercase(normalizarCC(atrib.NodeValue,gral.ChildValues['cc']))
          else
            anim[i].datos[Length(anim[i].datos)-1]:=ansiuppercase(atrib.NodeValue)
      else
        anim[i].datos[Length(anim[i].datos)-1]:=setDefault(atrib.NodeName);
      atrib:=atrib.NextSibling;
    end;
    if gral.ChildValues['rno']<>null then nombre:=gral.ChildValues['rno'];
    if gral.ChildValues['rap']<>null then apellido:=gral.ChildValues['rap'];
    if (nombre<>'') or (apellido<>'') then
      setDato('responsable',ansiuppercase(gral.ChildValues['rno']+' '+gral.ChildValues['rap']),anim[i]);
end;

procedure TFImpXML.buscarRodeo(var gral:IXMLNode);
var rod:TFABMRodeos;
    str:string;
begin
    if not (gral.ChildValues['Rodeo']=null) then
    begin
      str:=trim(ansiuppercase(gral.ChildValues['Rodeo']));
      if (DMSoftvet.IBQRodeo.Lookup('NOMBRE',str,'NOMBRE')=null) and (not pertenece(str,arrNuevos)) then
      begin
        setLength(arrNuevos,Length(arrNuevos)+1);
        arrNuevos[Length(arrNuevos)-1]:=str;
        if(MostrarMensaje(tmConsulta, Traducir('El rodeo ')+str+Traducir(' no existe en el sistema, desea ingresarlo?')) = mrYes)then
        begin
          rod:=TFABMRodeos.Create(self);
          rod.nombre:=str;
          FPrincipal.AbrirFormNormal(rod);
          gral.ChildValues['Rodeo']:=arrNuevos[Length(arrNuevos)-1];
        end
        else
          gral.ChildValues['Rodeo']:='INDEFINIDO';
      end;
    end;
end;

procedure TFImpXML.buscarPotrero(var gral:IXMLNode);
var rod:TFABMPotreros;
    str:string;
begin
    if not (gral.ChildValues['Potrero']=null) then
    begin
      str:=trim(ansiuppercase(gral.ChildValues['Potrero']));
      if (DMSoftvet.IBQPotrero.Lookup('NOMBRE',str,'NOMBRE')=null) and (not pertenece(str,arrNuevos)) then
      begin
        setLength(arrNuevos,Length(arrNuevos)+1);
        arrNuevos[Length(arrNuevos)-1]:=str;
        if(MostrarMensaje(tmConsulta, Traducir('El potrero ')+str+Traducir(' no existe en el sistema, desea ingresarlo?')) = mrYes)then
        begin
          rod:=TFABMPotreros.Create(self);
          rod.nombre:=str;
          FPrincipal.AbrirFormNormal(rod);
          gral.ChildValues['Potrero']:=arrNuevos[Length(arrNuevos)-1];
        end
        else
          gral.ChildValues['Potrero']:='INDEFINIDO';
      end;
    end;
end;

function TFImpXml.getCorrespondencia(cadena : String): String;
var i: integer;
begin
  Result := '';
  for i:=0 to length(arrCorrespondencias)-1 do
    if (arrCorrespondencias[i].cadenaXML = cadena) then
      Result := arrCorrespondencias[i].seCorrespondeCon;

end;

procedure TFImpXML.buscarResp(var gral:IXMLNode);
var ap,nom,nomyap:string;
    emp:TFABMEmpleados;
    i: integer;
begin
  if gral.ChildValues['Responsable']<>null then
  begin
    separarNombre(gral.ChildValues['Responsable'],nom,ap);
    nomyap:=UpperCase(nom+' '+ap);

    if (getCorrespondencia(nomyap) <> '') then
          gral.ChildValues['Responsable']:=getCorrespondencia(nomyap)
    else
    if (DMSoftvet.IBQResponsable.Lookup('nombre',nomyap,'nombre')=null) and (not pertenece(nomyap,arrNuevos)) and (trim(nomyap)<>'') then  //si no existe el empleado, pregunta si se desea crear
    begin
      setLength(arrNuevos,Length(arrNuevos)+1);
      arrNuevos[Length(arrNuevos)-1]:=nomyap;
      if(MostrarMensaje(tmConsulta,Traducir('El responsable ')+nomyap+Traducir(' no existe en el sistema, desea ingresarlo?')) = mrYes)then
      begin
        emp:=TFABMEmpleados.Create(self);
        emp.nom:=nomyap;
        FPrincipal.AbrirFormNormal(emp);
        setLength(arrCorrespondencias,Length(arrCorrespondencias)+1);
        arrCorrespondencias[length(arrCorrespondencias)-1].cadenaXml := nomyap;
        arrCorrespondencias[length(arrCorrespondencias)-1].seCorrespondeCon := nuevoResp;
        gral.ChildValues['Responsable']:=nuevoResp;
        DMSoftvet.IBQResponsable.Close;
        DMSoftvet.IBQResponsable.Open;
      end
      else
      begin
        gral.ChildValues['Responsable']:=null;
      end;
    end;
  end;
end;

function TFImpXML.documentoValido:boolean;
var str:Pansichar;
begin
  inherited;
  documentoValido := (XMLDoc.DocumentElement.NodeName = 'EventoGestacion') or (XMLDoc.DocumentElement.NodeName = 'EventoPeso') or
                     (XMLDoc.DocumentElement.NodeName = 'EventoCargaMasiva') or (XMLDoc.DocumentElement.NodeName = 'EventoInseminacion') or
                     (XMLDoc.DocumentElement.NodeName = 'EventoEvaluacionPreServicio') or (XMLDoc.DocumentElement.NodeName ='EventoNacimiento');
  end;

procedure TFImpXML.cargarCampos;
var nodo,atrib,hijo:IXMLNode;
    i:integer;
    atributo: String;
begin
nodo:=XMLDoc.DocumentElement.ChildNodes.Get(0);
atrib:=nodo.ChildNodes.First;

while atrib<>nil do
  begin
//  setLength(campos,Length(campos)+1);
//  campos[Length(campos)-1]:=LowerCase(atrib.NodeName);
  if (atrib.NodeName='Terneros') and (tipoDocumento= 'EventoNacimiento') then
    begin
      hijo := atrib.ChildNodes.First.ChildNodes.First;
      while hijo<>nil do
      begin
        atributo := hijo.NodeName;
        if (atributo = 'Caravana') then atributo :='RP (Ternero)*';
        if (atributo = 'Nombre') then atributo := 'Nombre (Ternero)';
        if (atributo = 'Peso') then atributo := 'Peso (Ternero)';
        campos.Add(LowerCase(atributo));
        hijo:= hijo.NextSibling;
      end;
      atrib:= atrib.NextSibling;
    end
  else
    begin
      campos.Add(LowerCase(atrib.NodeName));
      atrib:=atrib.NextSibling;
    end;
  end;

  if (tipoDocumento= 'EventoNacimiento') then
    begin
      campos.Add('causa');
      campos.Add('grado');
  end;
end;

procedure TFImpXML.normalizarCampos;
var i:integer;
begin
for i:=0 to campos.count-1 do
  begin
  if campos[i] = 'categoria' then campos[i] := 'categoría';
  if campos[i] = 'tipopeso' then campos[i] := 'Días';
  if campos[i] = 'cronologiaD' then campos[i] := 'cronología dentaria';
  if campos[i] = 'condicionC' then campos[i] := 'condicion corporal';
  if campos[i] = 'fechainiserv' then campos[i] := 'inicio servicio';
  if campos[i] = 'fechafinserv' then campos[i] := 'fin servicio';
  if campos[i] = 'estadorep' then campos[i] := 'estado reproductivo';
  if campos[i] = 'metododiagnostico' then campos[i] := 'método';
  if campos[i] = 'caravanaelectronica' then campos[i] := 'ie';
  if campos[i] = 'nombretoro' then campos[i] := 'toro';
  {if campos[i]='ra' then campos[i]:='raza';
  if campos[i]='fig' then campos[i]:='inicio servicio';
  if campos[i]='ffg' then campos[i]:='fin servicio';
  if campos[i]='fmd' then campos[i]:='método de diagnóstico';
  if campos[i]='cc' then campos[i]:='condición corporal';
  if campos[i]='cd' then campos[i]:='cronología dentaria';
  if campos[i]='er' then campos[i]:='estado reproductivo';
  if campos[i]='obs' then campos[i]:='observación';
  if campos[i]='fec' then campos[i]:='tipo condición corporal';
  if campos[i]='rno' then campos[i]:='responsable';
  if campos[i]='aaa' then campos[i]:='altura';
  if campos[i]='alt' then campos[i]:='alto';
  if campos[i]='anc' then campos[i]:='ancho';
  if campos[i]='ppr' then campos[i]:='preñez';
  if campos[i]='rec' then campos[i]:='rechazo';
  if campos[i]='idp' then campos[i]:='id importacion';   }
  end;
end;

function TFImpXML.setDefault(campo:string):Variant;
begin
inherited;
setDefault:='';
if campo='rod' then setDefault:='INDEFINIDO';
if campo='fmd' then setDefault:='NO DEFINIDO';
if (campo='ra') or (campo='cd') then setDefault:='NN';  //terminar el setdefault
//if (campo='ca') and (tipoEv='Evaluación de Preservicio') then setDefault:='VAQUILLONA';
if (campo = 'raza') then setDefault:= 'NO DEFINIDA';
end;

initialization
 campos := TStringList.create();  
end.
