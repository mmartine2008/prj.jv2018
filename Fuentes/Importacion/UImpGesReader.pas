unit UImpGesReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, xmldom,
  XMLIntf, msxmldom, XMLDoc, IBDatabase, IBQuery, UEveDiagnosticoGestacion,
  UEveAltaMasiva, UBDBGrid, Grids, DBGrids, UPrincipal,UDMSoftVet, UCartel,
  UFunctions,UImportacion, UAbmSimple, URPRepetidos, StrUtils;

type
  TFImpGesReader = class(TFImportacion)
    IBQParametros: TIBQuery;
    IBQEventos: TIBQuery;
    IBQColumnasEvento: TIBQuery;
  private
    OtrosCampos : Integer;
    fechaArchivo:TDateTime;
    _Archivo : TStringList;
    TipoEvento : Integer;
    Categoria : String;
    function getCol(campo:string):integer;
    function setDefault(campo:string):Variant;
    function esRequerido(campo:integer):boolean;
    function faltaRequerido(j:integer):boolean;
    procedure agregarIdImportacion;
    function armarID(fecha:TDateTime):string;
    function ObtenerValores(Cadena : String) : TStringList;
    function ObtenerValorParametros(Parametros : TStringList) : TStringList;
    function ArmarFecha(Fecha : String) : String;
    function VerificarEvento(Nombre : String) : Integer;
    function ExisteParametro(Parametros : TStringList; Valor : String) : Boolean;
  protected
    function cargarParametros:integer;
    procedure ProcesarNodo(fila:integer);override;
    procedure agregarDatosGrales(fila:integer);//override;
    procedure cargarAnimales;
    function documentoValido:boolean;
    procedure buscarEnCol(j:integer;campo:string;query:TIBQuery{;form:TFAbmSimple});
    procedure buscarEnGral(var dato:Variant;campo:string;query:TIBQuery{;form:TFAbmSimple});
  public
    procedure cargar(archivo:TFileName);override;
  end;

var
  FImpGesReader: TFImpGesReader;

implementation

{$R *.dfm}

uses UMensajeHuella,UAbmEmpleados,UAbmRodeos, UAbmPotreros,UEvePeso,UMovCargarDatos,UAvanceTerminar,
     ComObj, DateUtils, UImpDeps, UeveSimple, UABMActividad, UABMCentrosTransplantes,
     UABMCriador,UABMOrigen,UABMPropietarioAnimal, UABMFuentesDEPs, UABMDescMetodoSinc,
     UEveImportarPartosNacimientos, UAbmRechazosPreservicio, UTraduccion, UEveBaja, UMensajeCategoria;

var pag:OleVariant;
    j,datos,cantFilas,nombresCol,cantCampos:integer;
    datosGrales,arrCampos:array of Variant{arrGral};


function TFImpGesReader.VerificarEvento(Nombre : String) : Integer;
begin
  Result := -1;
  IBQEventos.Close;
  IBQEventos.Open;
  IBQEventos.First;
  while not IBQEventos.Eof do
  begin
    if UFunctions.LimpiarMultiByteChars(LowerCase(IBQEventos.FieldByName('nombre').AsString)) =  UFunctions.LimpiarMultiByteChars(LowerCase(Nombre)) then
    begin
      Result := IBQEventos.FieldValues['id_tipo_evento'];
      break;
    end;
    IBQEventos.Next;
  end;
end;

procedure TFImpGesReader.cargar(Archivo : TFileName);
var
  intFileAge, I, Max : integer;
  Evento, Aux : TStringList;
  F : TFMensajeCategoria;
  a : String;
begin
  inherited;
  intFileAge := FileAge(Archivo);
  hayNuevos:=false;
  if intFileAge = -1 then
    fechaArchivo := 0
  else
    fechaArchivo := FileDateToDateTime(intFileAge);
  try
    cargaDeMovil := true;
    _Archivo := TStringList.Create;
    _Archivo.LoadFromFile(Archivo);
    a := _Archivo.Strings[0];
    if ((a = '') or (a[1] = '[')) and (a <> '[ALTA DIRECTA]') and (a <> '[BAJA]') then
    begin
      Aux := TStringList.Create;
      Max := _Archivo.Count-1;

      if self.Owner is TFEveAltaMasiva then
      begin
        F := TFMensajeCategoria.Create(self);
        F.ShowModal;
        Categoria := F.Categoria;
        F.Destroy;
        Aux.Add('[ALTA DIRECTA]');
      end;
      if self.Owner is TFEveBaja then
        Aux.Add('[BAJA]');
      i := 0;
      while i <= Max do
      begin
        if _Archivo.Strings[i] <> '' then
        begin
          Aux.Add(_Archivo.Strings[i]);
        end;
        inc(I);
      end;
      if self.Owner is TFEveAltaMasiva then
        Aux.Add('[01|00|02|65|78]');
      if self.Owner is TFEveBaja then
        Aux.Add('[01|00|02|57|78]');

      _Archivo.Clear;
      _Archivo.AddStrings(Aux);
    end;

    Evento := ObtenerValores(_Archivo.Strings[0]);
    TipoEvento := VerificarEvento(Evento.Strings[0]);
    if TipoEvento <> -1 then
      cargarAnimales
    else
      cargaDeMovil := false;
  except
    cargaDeMovil:=false;
  end;
end;


procedure TFImpGesReader.cargarAnimales;
var
  row,res, real_row:integer;
begin
  j:=2;
  SetLength(datosGrales,0);
  SetLength(arrCampos,0);
 // SetLength(campos,0);
  campos.clear();
  ////////////
  FAvanceTerminar.Pos := 1;
  FAvanceTerminar.Max := 30;
  FAvanceTerminar.Modo := maDetalle;
  FAvanceTerminar.LTitulo.Caption:=Traducir('Cargando Parámetros');
  FAvanceTerminar.PBTerminar.Orientation:=pbVertical;
  FAvanceTerminar.Update;
  Application.ProcessMessages;
  ////////////
  res := cargarParametros;


  case (res) of
  //faltan datos requeridos
    1:begin
        MostrarMensaje(tmError,'Faltan datos requeridos. Por favor compruebe la planilla y vuelva a intentarlo');
        cargaDeMovil:=false;
        Exit;
      end;
    //no se desea cargar de nuevo el mismo archivo
    2:begin
        cargaDeMovil:=false;
        Exit;
      end;
    //todo normal
    0:begin
      ////////////
        FAvanceTerminar.Pos := 1;
        FAvanceTerminar.Max := cantFilas; //MSimple.FCantidadSeleccionados;
        FAvanceTerminar.Modo := maDetalle;
        FAvanceTerminar.LTitulo.Caption:=Traducir('Importando Animales');
        FAvanceTerminar.PBTerminar.Orientation:=pbHorizontal;
        FAvanceTerminar.Update;
        Application.ProcessMessages;
        ////////////
        real_row := 1;
        for row := 1 to _Archivo.Count-2 do
        begin
          ////////////
          FAvanceTerminar.Pos:=FAvanceTerminar.Pos+1;
          Application.ProcessMessages;
          ////////////
            ProcesarNodo(row);
            //buscarEnCol(row,'descripción',DMSoftvet.IBQDescMetodoSinc);
            //buscarEnCol(row,'potrero',DMSoftvet.IBQPotrero{,TFABMPotreros.Create(self)});              // -|
            //buscarEnCol(row,'rechazo',DMSoftvet.IBQRechazo);
            //if (self.Owner is TFEveAltaMasiva) then
            //begin
              //buscarEnCol(row,'responsable',DMSoftvet.IBQResponsable{,TFABMEmpleados.Create(self));            //  |
              //buscarEnCol(row,'criador',DMSoftvet.IBQCodCriador{,TFABMCriador.Create(self)});                   //  |
              //buscarEnCol(row,'rodeo',DMSoftvet.IBQRodeo{,TFABMRodeos.Create(self)});                           //  |-->TODO ESTO HACE MUY LENTO EL TEMA DE LA CARGA. DEFINIR CUALES CONVIENE DEJAR
              //buscarEnCol(row,'orígen',DMSoftvet.IBQCodOrigen{,TFABMOrigen.Create(self)});                      //  |
              //buscarEnCol(row,'propietario',DMSoftvet.IBQCodPropietario{,TFABMPropietarioAnimal.Create(self)}); // -|
            //end
            //else
            //begin
            //  if getCol('Centro de Transplante')>0 then
            //    buscarEnCol(row,'centro de transplante',DMSoftvet.IBQCentrosTransplante); //la busqueda de centro de transplantes es lentisima
            //end;
        end;
        agregarIdImportacion;
    end;//end del case 0
  end; //end del case
end;

function TFImpGesReader.ArmarFecha(Fecha : String) : String;
begin
  Insert('/',Fecha,3);
  Insert('/',Fecha,6);
  Result := Fecha;
end;

procedure TFImpGesReader.procesarNodo(fila : integer);
var
  indice,columna,indCampo :integer;
  str:string;
  FRep : TFRpRepetidos;
  Valores : TStringList;
  FechaNac : TDate;
begin

      setLength(anim,Length(anim)+1);
      anim[fila-1].idImportacion := armarID(fechaArchivo);

      Valores := ObtenerValores(_Archivo.Strings[fila]);

      for columna := 0 to cantCampos-1 do
      begin
          SetLength(anim[fila-1].datos,Length(anim[fila-1].datos)+1);
          indCampo := Length(anim[fila-1].datos)-1;
          anim[fila-1].datos[indCampo] := trim(ansiuppercase(sinAcento(Valores.Strings[columna])));
      end;

      for columna := cantCampos to OtrosCampos-1 do
      begin
        SetLength(anim[fila-1].datos,Length(anim[fila-1].datos)+1);
        indCampo := Length(anim[fila-1].datos)-1;
        anim[fila-1].datos[indCampo] := setDefault(campos[columna]);
      end;

      if getDato('rp',anim[fila-1]) = '' then
        setDato('rp',RightStr(getDato('ie',anim[fila-1]),10),anim[fila-1]);

      if getDato('fecha',anim[fila-1]) <> '' then
        setDato('fecha',ArmarFecha(getDato('fecha',anim[fila-1])),anim[fila-1]);

      if getDato('fecha N',anim[fila-1]) <> '' then
      begin
        FechaNac := StrToDateTime(getDato('fecha N',anim[fila-1]));
        if (getDato('edad',anim[fila-1]) <> '') then
        begin
          FechaNac := IncDay(Date(),-StrToInt(getDato('edad',anim[fila-1]))*30);
          setDato('fecha N',DateToStr(FechaNac),anim[fila-1]);
        end
        else
        if DateOf(FechaNac) = Date() then
          setDato('fecha N','',anim[fila-1]);
      end;

      if (Categoria = '') and (TipoEvento = 13) then
        Categoria := 'VAQUILLONA';

      if getDato('inicio servicio',anim[fila-1]) <> null then
        setDato('inicio servicio',ArmarFecha(getDato('inicio servicio',anim[fila-1])),anim[fila-1]);
      if getDato('fin servicio',anim[fila-1]) <> null then
        setDato('fin servicio',ArmarFecha(getDato('fin servicio',anim[fila-1])),anim[fila-1]);
      if getDato('categoría',anim[fila-1]) = '' then
        setDato('categoría',Categoria,anim[fila-1]);

      if getDato('hba',anim[fila-1]) <> null then
        setDato('hba','',anim[fila-1]);
      if getDato('dta',anim[fila-1]) <> null then
        setDato('dta','',anim[fila-1]);

      SetLength(anim[fila-1].datos,Length(anim[fila-1].datos)+1);
      anim[fila-1].datos[Length(anim[fila-1].datos)-1] := armarID(fechaArchivo);

      if (getDato('ie',anim[fila-1])<>'') and (DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('ie',anim[fila-1]),'ID_ANIMAL')<>null) then
      begin
        anim[fila-1].id := DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('ie',anim[fila-1]),'ID_ANIMAL');
        setDato('rp',DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('ie',anim[fila-1]),'ID_RP'),anim[fila-1]);
      end
      else
      begin
        if self.Owner is TFEveImportarPartosNacimientos then
          str := 'rp (madre evento)'
        else
            str := 'rp';
        if (DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',getDato(str,anim[fila-1]),'ID_ANIMAL')<>null) then
        begin
          DMSoftvet.IBQRpRepetidos.Close;
          DMSoftvet.IBQRpRepetidos.ParamByName('rp').AsString := getDato(str,anim[fila-1]);
          DMSoftvet.IBQRpRepetidos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          DMSoftvet.IBQRpRepetidos.Open;
          DMSoftvet.IBQRpRepetidos.Last;
          DMSoftvet.IBQRpRepetidos.First;
          if DMSoftvet.IBQRpRepetidos.RecordCount >= 1 then
          begin
            FRep := TFRpRepetidos.Create(nil,getDato(str,anim[fila-1]),GetVista(DMSoftvet.IBQRpRepetidos.SQL[0]));
            FRep.ShowModal;
            anim[fila-1].id := FRep.Obtener_ID;
            hayNuevos := hayNuevos or (anim[fila-1].id = -1);
            FRep.Destroy;
          end
          else
          begin
            if DMSoftvet.IBQRpRepetidos.RecordCount = 1 then
              anim[fila-1].id:=DMSoftvet.IBQRpRepetidos.Lookup('ID_RP',getDato(str,anim[fila-1]),'ID_ANIMAL')
            else
              anim[fila-1].id:=DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',getDato(str,anim[fila-1]),'ID_ANIMAL')
          end;
        end
        else
        begin    //si el animal no existe, el id sera -1
          anim[fila-1].id:=-1;
          hayNuevos:=true;       //se setea el parametro en true para que despues pregunte si se quieren agregar los animales nuevos
        end;
      end;

end;

procedure TFImpGesReader.agregarDatosGrales(fila:integer);
var i:integer;
begin
    for i:=0 to Length(datosGrales)-1 do
      begin
      setLength(anim[fila].datos,Length(anim[fila].datos)+1);
      if datosGrales[i]<>'' then
        anim[fila].datos[i]:=ansiuppercase(datosGrales[i])
      else
        anim[fila].datos[i]:=setDefault(campos[i]);
      end;
end;

function TFImpGesReader.ObtenerValores(Cadena : String) : TStringList;
var
  Valor : String;
  Ind : Integer;
begin
  Result := TStringList.Create;
  for Ind := 2 to Length(Cadena) do
  begin
    if (Cadena[Ind] = '|') or (Cadena[Ind] = ']') then
    begin
      Result.Add(Valor);
      Valor := '';
    end
    else
      Valor := Valor + Cadena[Ind];
  end;

  if Trim(Result.Strings[0]) = 'GESTACION' then
    Result.Strings[0] := 'DIAGNOSTICO DE GESTACION';
  if Trim(Result.Strings[0]) = 'INSEMINACION' then
    Result.Strings[0] := 'INSEMINACION ARTIFICIAL';
end;

function TFImpGesReader.ObtenerValorParametros(Parametros : TStringList) : TStringList;
var
  Ind, Valor : Integer;
  Resultado : String;
begin
  IBQParametros.Close;
  IBQParametros.Open;
  Result := TStringList.Create;
  for Ind := 0 to Parametros.Count-1 do
  begin
    Valor := StrToInt(Parametros.Strings[Ind]);
    if IBQParametros.Lookup('id_gesreader',Valor,'campo') <> null then
      Resultado := IBQParametros.Lookup('id_gesreader',Valor,'campo')
    else
      Resultado := '';
    Result.Add(Resultado);
  end;
end;

function TFImpGesReader.ExisteParametro(Parametros : TStringList; Valor : String) : Boolean;
var
  I : Integer;
begin
  Result := false;
  for I := 0 to Parametros.Count-1 do
    if LowerCase(Parametros.Strings[I]) = LowerCase(Valor) then
    begin
      Result := true;
      break;
    end;
end;

function TFImpGesReader.cargarParametros:integer;
var
  Parametros : TStringList;
  Indice : Integer;
  existe : boolean;
  Col : String;
begin
  IBQImportacion.Close;
  IBQImportacion.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQImportacion.Open;
  j:=2;
  cargarParametros:=0;
  existe:=IBQImportacion.Locate('ID_IMPORTACION',armarID(fechaArchivo),[loCaseInsensitive]);
  if existe then
    if MostrarMensaje(tmConsulta,'Este archivo ya fue ingresado al sistema. Desea volver a cargarlo?')=mrNo then
    begin
      cargarParametros:=2;
      Exit;
    end;

  Parametros := ObtenerValorParametros(ObtenerValores(_Archivo.Strings[_Archivo.Count-1]));
  cantCampos := Parametros.Count;

  for Indice := 0 to Parametros.Count-1 do
  begin
    SetLength(arrCampos,Length(arrCampos)+1);
//    SetLength(campos,Length(campos)+1);
    arrCampos[Length(arrCampos)-1] := Parametros.Strings[Indice];
  //  campos[Length(campos)-1] := Parametros.Strings[Indice];
    campos.add(Parametros.Strings[Indice]);
    FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
    Application.ProcessMessages;
  end;

  //Completar los parametros que no estan en el archivo
  IBQColumnasEvento.Close;
  IBQColumnasEvento.ParamByName('e').AsInteger := TipoEvento;
  IBQColumnasEvento.Open;
  IBQColumnasEvento.First;
  while not IBQColumnasEvento.Eof do
  begin
    Col := IBQColumnasEvento.FieldValues['columna'];
    if not ExisteParametro(Parametros,Col) then
    begin
      SetLength(arrCampos,Length(arrCampos)+1);
//      SetLength(campos,Length(campos)+1);
      arrCampos[Length(arrCampos)-1] := Col;
  //    campos[Length(campos)-1] := Col;
      campos.add(col);
      Parametros.Add(Col);
      FAvanceTerminar.Pos := FAvanceTerminar.Pos + 1;
      Application.ProcessMessages;
    end;
    IBQColumnasEvento.Next;
  end;
  OtrosCampos := Parametros.Count;
end;

function TFImpGesReader.documentoValido:boolean;
var
  s1,s2:string;
  res : boolean;
begin
  inherited;
  s1:=lowercase(tipoEv);
  s2:=lowercase(pag.cells[1,1].Text);
  if (ansipos(s1,s2)<>0) or (ansipos(s2,s1)<>0) then
    res:=true
  else
    res:=false;
  res := ((s1 = 'importación de partos y nacimientos') and (s2 = 'planilla de partos y nacimientos')) or res;
  documentoValido := res;
end;

function TFImpGesReader.getCol(campo:string):integer;
var i:integer;
begin
  i:=1;
  getCol:=0;
  for i := 0 to campos.count-1 do //Length(campos)-1 do
  begin
    if  ansipos(lowercase(campo),lowercase(campos[i]))=1 then
    begin
      getCol:=i;
      break;
    end;
  end;
end;

function TFImpGesReader.setDefault(campo:string):Variant;  //setea el valor por defecto para el campo pasado como parametro
var
  str:string;
begin
  inherited;
  str:=ansilowercase(campo);
  setDefault:='';

  if (str='actividad') or (ansipos('dist.',str)<>0) or (str='descripción')
  or (str='enfermedad') or (ansipos('cronología',str)<>0) or (ansipos('cronología dentaria',str)<>0)
  or (ansipos('técnica de trat',str)<>0) then
    setDefault:='NO DEFINIDA';
  if (str='diagnosticador') or (ansipos('estado re',str)<>0) or (ansipos('orígen',str)<>0)
  or (str='causa') or (str='gdr') or (ansipos('método',str)<>0) or (ansipos('tipo des',str)<>0)
  or (ansipos('suplementación',str)<>0) or (ansipos('tipo de trat',str)<>0)
  or (ansipos('centro',str)<>0) then
    setDefault:='NO DEFINIDO';
  if (str='potrero') or (str='rodeo') or (str='responsable') or (str='observador')
  or (str='nuevo rodeo') or (str='nuevo potrero') then
    setDefault:='INDEFINIDO';
  if (str='raza') then
    setDefault:='NN';
  if (ansipos('peso',str)<>0) or ((ansipos('altura',str)<>0)and(ansipos('altura dep',str)=0)and((ansipos('altura prec',str)=0))) or (ansipos('alto',str)<>0) or (ansipos('ancho',str)<>0)
  or (ansipos('sangrado brucelosis',str)<>0) or (str='evaluación manual') or (ansipos('preñez',str)<>0)
  or (ansipos('area',str)<>0) or (ansipos('frame',str)<>0) or (ansipos('18 meses',str)<>0)
  or (ansipos('cantidad im',str)<>0) or (ansipos('circunferencia',str)<>0) then
    setDefault:=0;
  if (ansipos('cant. dosis',str)<>0) then
    setDefault:=1;
  if (str='días') then
    setDefault:='GENERAL';
  if ((ansipos('fecha',str)<>0) or (ansipos('hora',str)<>0)) and ((ansipos('nac',str)=0)and(ansipos('horas',str)=0)) then
    setDefault:=now;
  if self.Owner is TFEveImportarPartosNacimientos then
    if (str = 'causa') or (str='grado') then
      setDefault := 'NO DEFINIDA';

end;

function TFImpGesReader.faltaRequerido(j:integer):boolean;
var
  campo:integer;
begin
  faltaRequerido:=false;
  for campo:=1 to cantCampos do
  if (esRequerido(campo)) and (pag.cells[j,campo].Text='') then
  begin
    faltaRequerido:=true;
    break;
  end;
end;

function TFImpGesReader.esRequerido(campo:integer):boolean;
begin
  esRequerido:=false;
  if ansipos('*',pag.Cells[nombresCol,campo])<>0 then
    esRequerido:=true;
end;

procedure TFImpGesReader.buscarEnCol(j:integer; campo:string; query:TIBQuery);
var ap,nom,nomyap:string;
    col:integer;
    form:TFABMSimple;
    Valores : TStringList;
begin
  col := getCol(campo);

  Valores := ObtenerValores(_Archivo.Strings[j]);

  if (col>0) and (anim[j-1].datos[col] <> '') and (ansiuppercase(anim[j-1].datos[col])<>'INDEFINIDO') then
  begin
    str:=trim(ansiuppercase(Valores.Strings[col]));
    separarNombre(str,nom,ap);   //devuelve el nombre en nom y el apellido en ap
    nomyap:=trim(nom+' '+ap);
    query.close;
    query.open;
    if (not pertenece(nomyap,arrNuevos)) and (not query.Locate('nombre',nomyap,[])) then
    begin
      setLength(arrNuevos,Length(arrNuevos)+1);
      arrNuevos[Length(arrNuevos)-1]:=nomyap;
      if  MostrarMensaje(tmConsulta,Traducir('El ')+campo+' '+nomyap+Traducir(' no existe en el sistema. Desea ingresarlo?'))=mrYes then
      begin
        if campo='responsable' then form:= TFABMEmpleados.Create(self);
        if campo='rodeo' then form:= TFABMRodeos.Create(self);
        if campo='potrero' then form:= TFABMPotreros.Create(self);
        if campo='criador' then form:= TFABMCriador.Create(self);
        if campo='orígen' then form:= TFABMOrigen.Create(self);
        if campo='propietario' then form:= TFABMPropietarioAnimal.Create(self);
        if campo='centro de transplante' then form:= TFABMCentrosTransplantes.Create(self);
        if campo='rechazo' then form:= TFAbmRechazosPreservicio.Create(self);
        if campo='descripción' then
        begin
          form := TFABMDescMetodoSinc.Create(self);
          (form as TFABMDescMetodoSinc).Metodo := DMSoftvet.IBQmetodosSincronizacion.Lookup('nombre',GetDato('método',anim[j-datos-1]),'id_metodo');
        end;
        form.nom:=ansiuppercase(Valores.Strings[col]);
        FPrincipal.AbrirFormNormal(form);
        setDato(campo,arrNuevos[Length(arrNuevos)-1],anim[j-datos-1]);
        query.Close;
        query.Open;
      end
      else
      begin
        setDato(campo,setDefault(campo),anim[j-datos-1]);
      end;
    end;
  end
  else
  begin
    if query.Locate('nombre',nomyap,[]) then
      setDato(campo,nomyap,anim[j-datos])
    else
      setDato(campo,setDefault(campo),anim[j-datos-1]);
  end;
end;

procedure TFImpGesReader.buscarEnGral(var dato:Variant;campo:string;query:TIBQuery{;form:TFAbmSimple});
var nombre,ap:string;
    var form:TFABMSimple;
begin
  if dato<>'' then
  begin
    separarNombre(String(dato),nombre,ap);
    nombre:=ansiuppercase(trim(nombre+' '+ap));
    if (query.Lookup('nombre',nombre,'nombre')=null) and (not pertenece(nombre,arrNuevos)) then  //si no existe el empleado, pregunta si se desea crear
    begin
      setLength(arrNuevos,Length(arrNuevos)+1);
      arrNuevos[Length(arrNuevos)-1]:=nombre;
      if campo <> 'raza' then
      begin
        if(MostrarMensaje(tmConsulta,Traducir('El ')+campo+' '+nombre+Traducir(' no existe en el sistema, desea ingresarlo?')) = mrYes)then
        begin
          if campo='responsable' then form:= TFABMEmpleados.Create(self);
          if campo='rodeo' then
            form:= TFABMRodeos.Create(self);
          if campo='fuente' then
            form := TFABMFuentesDeps.Create(self);
          if campo='potrero' then
            form := TFABMPotreros.Create(self);
          form.nom:=ansiuppercase(dato);
          FPrincipal.AbrirFormNormal(form);
          dato:=arrNuevos[Length(arrNuevos)-1];
          query.Close;
          query.Open;
        end;
      end
      else
      begin
        dato:=setDefault(campo);
      end;
    end
    else
    begin
      if query.Locate('nombre',nombre,[]) then
        dato:= ansiuppercase(nombre)
      else
        dato:=setDefault(campo);
    end;
  end;
end;

procedure TFImpGesReader.agregarIdImportacion;
begin
  setLength(datosGrales,Length(datosGrales)+1);
//  setLength(campos,Length(campos)+1);
//  campos[Length(campos)-1]:='id importacion';
  campos.add('id importacion');
  datosGrales[Length(datosGrales)-1]:=armarID(fechaArchivo);
end;

function TFImpGesReader.armarID(fecha:TDateTime):string;
var id:string;
    strings:TStrings;
    aux:PChar;
    anio,mes,dia,hora,min:string;
begin
  id:=datetimetostr(fecha);
  strings:=TStringList.Create;
  aux:=pchar(id);
  ExtractStrings(['/',' ',':'],[' '],aux,TStrings(strings));
  anio:=strings[0];
  mes:=strings[1];
  dia:=strings[2];
  hora:=strings[3];
  min:=strings[4];
  id:=TFEveSimple(Owner).PTitulo.Caption+'-'+anio+'-'+mes+'-'+dia+'-'+hora+'-'+min+'.XLS';
  armarID:=id;
end;

end.
