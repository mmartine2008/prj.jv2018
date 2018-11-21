unit UImpVesta;

interface
{
IMPVesta :
  Unidad para importacion de archivos desde CSV y otras fuentes
}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, xmldom,
  XMLIntf, msxmldom, XMLDoc, IBDatabase, IBQuery, UEveDiagnosticoGestacion,
  UEveAltaMasiva, UBDBGrid, Grids, DBGrids, UPrincipal,UDMSoftVet, UCartel,
  UFunctions,UImportacion, UAbmSimple, URPRepetidos, UAvanceTerminar;

type
  TFImpVesta = class(TFImportacion)
    IBQParametros: TIBQuery;
    IBQEventos: TIBQuery;
    IBQColumnasEvento: TIBQuery;
  private
    OtrosCampos : Integer;
    fechaArchivo:TDateTime;
    _Archivo : TStringList;
    TipoEvento : Integer;
    _Inicio : Integer;
    TipoBalanza : String;
    FA : TFAvanceTerminar;
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
    procedure SepararParaDiagnostico(Valor : String; var R1,R2,R3 : String);
    function CompletarElectronica(S : String) : String;
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
  FImpVesta: TFImpVesta;

implementation

{$R *.dfm}

uses UMensajeHuella,UAbmEmpleados,UAbmRodeos, UAbmPotreros,UEvePeso,UMovCargarDatos,
     ComObj, DateUtils, UImpDeps, UeveSimple, UABMActividad, UABMCentrosTransplantes,
     UABMCriador,UABMOrigen,UABMPropietarioAnimal, UABMFuentesDEPs, UABMDescMetodoSinc,
     UEveImportarPartosNacimientos, UAbmRechazosPreservicio, UTraduccion,
  StrUtils;

var pag:OleVariant;
    j,datos,cantFilas,nombresCol,cantCampos,colRP:integer;
    datosGrales,arrCampos:array of Variant{arrGral};

function TFImpVesta.VerificarEvento(Nombre : String) : Integer;
begin
  Result := -1;
  IBQEventos.Close;
  IBQEventos.Open;
  IBQEventos.First;
  if Trim(Nombre) = 'ENTRADA' then
    Nombre := 'Alta Directa';
  if Trim(Nombre) = 'TACTO' then
    Nombre := 'Diagnostico de Gestacion';
  if Trim(Nombre) = 'INSEMINACION' then
    Nombre := 'Inseminacion Artificial';
  if Trim(Nombre) = 'PESO' then
    Nombre := 'Peso';
  while not IBQEventos.Eof do
  begin
    if UFunctions.LimpiarMultiByteChars(LowerCase(IBQEventos.FieldByName('nombre').AsString)) = LowerCase(Nombre) then
    begin
      Result := IBQEventos.FieldValues['id_tipo_evento'];
      break;
    end;
    IBQEventos.Next;
  end;
end;

procedure TFImpVesta.cargar(Archivo : TFileName);
var
  intFileAge : integer;
  Evento : TStringList;
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
    //Evento := ObtenerValores(_Archivo.Strings[0]);
    if LeftStr(_Archivo.Strings[0],4) = 'Oper' then
      TipoEvento := VerificarEvento(ObtenerValores(_Archivo.Strings[1]).Strings[3]);
    if LeftStr(_Archivo.Strings[0],4) = 'Arch' then
      TipoEvento := 25;
    //if TipoEvento <> -1 then
    cargarAnimales;
    {else
      cargaDeMovil := false;}
  except
    cargaDeMovil:=false;
  end;
end;


procedure TFImpVesta.cargarAnimales;
var
  row,res :integer;
  str:string;

begin
  j:=2;
  SetLength(datosGrales,0);
  SetLength(arrCampos,0);
//  SetLength(campos,0);
  campos.clear();
  ////////////
  FA := TFAvanceTerminar.Create(self);
  FA.Pos := 1;
  FA.Max := 30;
  FA.Modo := maDetalle;
  FA.LTitulo.Caption:=Traducir('Cargando Parámetros');
  FA.PBTerminar.Orientation:=pbVertical;
  FA.Update;
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
        FA.Pos := 1;
        FA.Max := cantFilas; //MSimple.FCantidadSeleccionados;
        FA.Modo := maDetalle;
        FA.LTitulo.Caption:=Traducir('Importando Animales');
        FA.PBTerminar.Orientation:=pbHorizontal;
        FA.Update;
        Application.ProcessMessages;
        ////////////
        if _Archivo.Strings[0][1] = 'A' then
          _Inicio := 5
        else
          _Inicio := 1;

        for row := 1 to _Archivo.Count-1 do
        begin
          ////////////
          FA.Pos:=FA.Pos+1;
          Application.ProcessMessages;
          ////////////
          ProcesarNodo(row);
          Inc(_Inicio);
        end;
        agregarIdImportacion;
    end;//end del case 0
  end; //end del case
end;

function TFImpVesta.ArmarFecha(Fecha : String) : String;
var
  A : String;
begin

  {Insert('2',Fecha,7);
  Insert('0',Fecha,8);}
  Result := Fecha;
end;

procedure TFImpVesta.SepararParaDiagnostico(Valor : String; var R1,R2,R3 : String);
begin
  R1 := Valor[1]+Valor[2];
  R2 := Valor[3]+Valor[4];
  R3 := Valor[5]+Valor[6];
end;

function TFImpVesta.CompletarElectronica(S : String) : String;
var
  I : Integer;
  a : String;
begin
  a := S;
  if Length(S) < 10 then
  begin
    for I := Length(S) to 9 do
      a := '0'+a;
  end;
  Result := a;
end;

procedure TFImpVesta.procesarNodo(fila : integer);
var
  indice,columna,hba,indDatosDEP,indCampo,column:integer;
  str, strRP :string;
  sexo : integer;
  FRep : TFRpRepetidos;
  Valores : TStringList;
  A1,A2,A3 : String;
  aux_ie, aux_rp : String;
  cat : String;
begin
    if (_Inicio <= (_Archivo.Count-1)) and (_Archivo.Strings[_Inicio][1] <> '') then
    begin

    setLength(anim,Length(anim)+1);
    anim[fila-1].idImportacion := armarID(fechaArchivo);

    _Archivo.Strings[_Inicio] := _Archivo.Strings[_Inicio] + ';';
    Valores := ObtenerValores(_Archivo.Strings[_Inicio]);
    SetLength(anim[fila-1].datos, cantCampos);
   // TipoEvento := 2;
    ShowMessage(valores.GetText);
    for columna := 0 to cantCampos-1 do
    begin
        //SetLength(anim[fila-1].datos,Length(anim[fila-1].datos)+1);
       // indCampo := Length(anim[fila-1].datos)-1;
       if(FPrincipal.MarcaLector = 'Allflex')then
        begin
          aux_rp := RightStr(Valores.Strings[0],8);
          ShowMessage(aux_rp);
          anim[fila-1].datos[getCol('rp')] := aux_rp;
          anim[fila-1].datos[getCol('fecha')] := Trim(Valores.Strings[1]);
          //ShowMessage(anim[fila-1].datos[getCol('rp')]);
         // ShowMessage(anim[fila-1].datos[getCol('fecha')]);
        end
        else
        case TipoEvento of
          2 : begin
                if columna = 2 then
                begin
                  cat := RightStr(Valores.Strings[5],2);
                  anim[fila-1].datos[getCol('categoría')] := Trim(cat);
                  if (cat ='TH') or (cat='VQ') or (cat='VA') then
                    sexo := 2
                  else
                    sexo := 1;
                  strRP := LeftStr(Valores.Strings[5],Length(Valores.Strings[5])-2);
                  anim[fila-1].datos[getCol('rp')] := Trim(strRP);
                end;
                if columna = 4 then
                begin
                  anim[fila-1].datos[getCol('peso')] := Trim(StringReplace(Valores.Strings[7],'.',',',[]));
                end;
                if columna = 3 then
                begin
                  aux_ie := Trim(Valores.Strings[6]);
                  if length(aux_ie) < 10 then
                  begin
                    case FPrincipal.Pais of
                      1 : aux_ie := 'A000000096400100'+aux_ie;          //A0000000964001002847643
                      2 : aux_ie := 'A000000085800100'+aux_ie;          //A0000000964001002847643
                      else
                        aux_ie := 'A000000096400100'+aux_ie;
                    end;
                  end
                  else
                  begin
                    case FPrincipal.Pais of
                      1 : aux_ie := 'A000000096400'+aux_ie;
                      2 : aux_ie := 'A000000085800'+aux_ie;
                      else
                        aux_ie := 'A000000096400'+aux_ie;
                    end;
                  end;
                  anim[fila-1].datos[getCol('ie')] := aux_ie;
                end;
                if columna = 0 then
                begin
                  anim[fila-1].datos[getCol('fecha')] := Trim(Valores.Strings[1]);
                end;
              end;
          13 : begin
                  if columna = 5 then
                  begin
                    SepararParaDiagnostico(trim(ansiuppercase(sinAcento(Valores.Strings[columna]))),A1,A2,A3);
                    anim[fila-1].datos[getCol('estado reproductivo')] := A1;
                    anim[fila-1].datos[getCol('cronología dentaria')] := A2;
                    anim[fila-1].datos[getCol('condición corporal')] := A3;
                  end;
                  if columna = 6 then
                  begin
                    aux_ie := Trim(Valores.Strings[columna]);
                    if length(aux_ie) < 10 then
                    begin
                      case FPrincipal.Pais of
                        1 : aux_ie := 'A000000096400100'+aux_ie;          //A0000000964001002847643
                        2 : aux_ie := 'A000000085800100'+aux_ie;          //A0000000964001002847643
                        else
                          aux_ie := 'A000000096400100'+aux_ie;
                      end;
                    end
                    else
                    begin
                      case FPrincipal.Pais of
                        1 : aux_ie := 'A000000096400'+aux_ie;
                        2 : aux_ie := 'A000000085800'+aux_ie;
                        else
                          aux_ie := 'A000000096400'+aux_ie;
                      end;
                    end;
                    anim[fila-1].datos[getCol('ie')] := aux_ie;
                  end;
                  if columna = 1 then
                  begin
                    anim[fila-1].datos[getCol('fecha')] := Trim(Valores.Strings[columna]);
                  end;
               end;
          28 : begin
                  if columna = 5 then
                  begin
                    anim[fila-1].datos[getCol('toro')] := trim(ansiuppercase(sinAcento(Valores.Strings[columna])));
                  end;
               end;
          25 : begin
                 if TipoBalanza = 'B' then
                 begin
                    if columna = 2 then
                      anim[fila-1].datos[getCol('fecha')] := Trim(StringReplace(_Archivo.Strings[2],'Fecha:','',[]));
                    if columna = 1 then
                      anim[fila-1].datos[getCol('ie')] := CompletarElectronica(anim[fila-1].datos[getCol('rp')]);
                    if columna = 3 then
                      anim[fila-1].datos[getCol('peso')] := trim(ansiuppercase(sinAcento(Valores.Strings[columna-2])));
                    if columna = 0 then
                      anim[fila-1].datos[columna] := trim(CompletarElectronica(ansiuppercase(sinAcento(Valores.Strings[columna]))));
                 end;
                 if TipoBalanza = 'V' then
                 begin
                  if columna = 1 then
                    anim[fila-1].datos[getCol('fecha')] := Trim(Valores.Strings[columna]);
                  if columna = 2 then
                    anim[fila-1].datos[getCol('hora')] := Trim(Valores.Strings[columna]);
                  if columna = 4 then
                  begin
                    aux_ie := Trim(Valores.Strings[6]);
                    anim[fila-1].datos[getCol('ie')] := aux_ie;
                  end;
                  if columna = 5 then
                    anim[fila-1].datos[getCol('peso')] := trim(ansiuppercase(sinAcento(Valores.Strings[7])));
                 end;
               end;
        end;
        if (columna < Valores.Count) and (anim[fila-1].datos[columna] = '') then
          anim[fila-1].datos[columna] := trim(ansiuppercase(sinAcento(Valores.Strings[columna])))
        else
          if (columna >= Valores.Count) then
            break;
    end;

    for columna := cantCampos to OtrosCampos-1 do
    begin
      SetLength(anim[fila-1].datos,Length(anim[fila-1].datos)+1);
      indCampo := Length(anim[fila-1].datos)-1;
      anim[fila-1].datos[indCampo] := setDefault(campos[columna]);
      if (campos[columna] = 'inicio servicio') then
        anim[fila-1].datos[indCampo] := DateToStr(IncMonth(StrToDate(getDato('fecha',anim[fila-1])),-5));
      if (campos[columna] = 'fin servicio') then
        anim[fila-1].datos[indCampo] := DateToStr(IncMonth(StrToDate(getDato('fecha',anim[fila-1])),-2));
    end;

    if getDato('fecha',anim[fila-1]) <> null then
      setDato('fecha',ArmarFecha(getDato('fecha',anim[fila-1])),anim[fila-1]);

    case TipoEvento of
      2 : begin
            anim[fila-1].datos[getCol('fecha n')] := '';
          end;
      28: begin
            anim[fila-1].datos[getCol('cant. dosis')] := '1';
            anim[fila-1].datos[getCol('nombre del servicio')] := 'INSEMINACION '+getDato('fecha',anim[fila-1]);
          end;
      25: begin
            if anim[fila-1].datos[getCol('categoría')] = '' then
              anim[fila-1].datos[getCol('categoría')] := '3';

            case StrToInt(anim[fila-1].datos[getCol('categoría')]) of
              1 : anim[fila-1].datos[getCol('categoría')] := 'TERNERO';
              2 : anim[fila-1].datos[getCol('categoría')] := 'TERNERA';
              3 : anim[fila-1].datos[getCol('categoría')] := 'NOVILLO';
              4 : anim[fila-1].datos[getCol('categoría')] := 'VAQUILLONA';
              5 : anim[fila-1].datos[getCol('categoría')] := 'VACA';
              6 : anim[fila-1].datos[getCol('categoría')] := 'TORO';
            end;

            if getDato('rp',anim[fila-1]) = '' then
            begin
              setDato('rp',getDato('ie',anim[fila-1]),anim[fila-1]);
              setDato('ie','',anim[fila-1]);
            end
            else
            begin
              aux_ie := getDato('ie',anim[fila-1]);
              if length(aux_ie) < 10 then
              begin
                case FPrincipal.Pais of
                  1 : aux_ie := 'A000000096400100'+aux_ie;          //A0000000964001002847643
                  2 : aux_ie := 'A000000085800100'+aux_ie;          //A0000000964001002847643
                  else
                    aux_ie := 'A000000096400100'+aux_ie;
                end;
              end
              else
              begin
                case FPrincipal.Pais of
                  1 : aux_ie := 'A000000096400'+aux_ie;
                  2 : aux_ie := 'A000000085800'+aux_ie;
                  else
                    aux_ie := 'A000000096400'+aux_ie;
                end;
              end;
              setDato('ie',aux_ie,anim[fila-1]);
            end;

          end;
    end;

    SetLength(anim[fila-1].datos,Length(anim[fila-1].datos)+1);
    anim[fila-1].datos[Length(anim[fila-1].datos)-1] := armarID(fechaArchivo);
    // Verifica que el ID electronico exista
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
              anim[indice].id:=DMSoftvet.IBQRpRepetidos.Lookup('ID_RP',getDato(str,anim[indice]),'ID_ANIMAL')
            else
              anim[indice].id:=DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',getDato(str,anim[indice]),'ID_ANIMAL')
          end;
      end
      else
      begin    //si el animal no existe, el id sera -1
        anim[fila-1].id:=-1;
        hayNuevos:=true;       //se setea el parametro en true para que despues pregunte si se quieren agregar los animales nuevos
      end;
    end;

  end;
end;

procedure TFImpVesta.agregarDatosGrales(fila:integer);
var i:integer;
begin
    for i:=0 to Length(datosGrales)-1 do
      begin
      setLength(anim[fila].datos,Length(anim[fila].datos)+1);
      if datosGrales[i]{.valorCampo}<>'' then
        anim[fila].datos[i]:=ansiuppercase(datosGrales[i]{.valorCampo})
      else
        anim[fila].datos[i]:=setDefault(campos[i]{datosGrales[i].nomCampo});
      end;
end;

function TFImpVesta.ObtenerValores(Cadena : String) : TStringList;
var
  Valor : String;
  Ind : Integer;
begin
  Result := TStringList.Create;
  for Ind := 1 to Length(Cadena) do
  begin
    if ((Cadena[Ind] = ';') or (Cadena[Ind] = ','))then
    begin
      Result.Add(Valor);
      Valor := '';
    end
    else
      Valor := Valor + Cadena[Ind];
  end;
end;

function TFImpVesta.ObtenerValorParametros(Parametros : TStringList) : TStringList;
var
  Ind, Valor, aux : Integer;
  Resultado, val : String;
begin
  IBQParametros.Close;
  IBQParametros.Open;
  Result := TStringList.Create;
  for Ind := 0 to Parametros.Count-1 do
  begin
    val := Parametros.Strings[ind];
    if val = 'ESTADO' then
      Parametros.Strings[ind] := 'categoría';
    if val = 'LOTE' then
      Parametros.Strings[ind] := 'POTRERO';
    if (val = 'CARAVAN') or (val = 'Num-Car') or (val = 'Id. Electrónica') or (val = 'EID') then
      Parametros.Strings[ind] := 'IE';
    if (val = 'OBSERVACION') or (val = 'Num-Car') or (val = 'Id. Visual') then
      Parametros.Strings[ind] := 'RP';
    if (val = 'Date Time')then
      Parametros.Strings[ind] := 'fecha';

    if IBQParametros.Lookup('campo',lowercase(Parametros.Strings[ind]),'id_gesreader') <> null then
      Valor := IBQParametros.Lookup('campo',lowercase(Parametros.Strings[ind]),'id_gesreader')
    else
      Valor := -1;

    if IBQParametros.Lookup('id_gesreader',Valor,'campo') <> null then
    begin
      Resultado := IBQParametros.Lookup('id_gesreader',Valor,'campo');
      Result.Add(Resultado);
      if val = 'Num-Car' then
        Result.Add('ie');
    end;
  end;
end;

function TFImpVesta.ExisteParametro(Parametros : TStringList; Valor : String) : Boolean;
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

function TFImpVesta.cargarParametros:integer;
var
  Parametros : TStringList;
  Indice, I, IndInic : Integer;
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

  if _Archivo.Strings[0][1] = 'A' then
  begin
    IndInic := 4;
    TipoBalanza := 'B';
  end
  else
  begin
    TipoBalanza := 'V';
    IndInic := 0;
  end;

  _Archivo.Strings[IndInic] := _Archivo.Strings[IndInic]+';';
  showmessage (_Archivo.Strings[IndInic]);
  Parametros := ObtenerValorParametros(ObtenerValores(_Archivo.Strings[IndInic]));
  showmessage (Parametros.GetText);
  if(FPrincipal.MarcaLector = 'Allflex')then
    begin
      cantCampos := Parametros.Count;
        for Indice := 0 to Parametros.Count-1 do
          begin
            SetLength(arrCampos,Length(arrCampos)+1);
            if trim(Parametros.Strings[Indice]) = trim('ie') then
              Parametros.Strings[Indice] := 'rp';
            if trim(Parametros.Strings[Indice]) = trim('fecha') then
              Parametros.Strings[Indice] := 'fecha';
            arrCampos[Length(arrCampos)-1] := Parametros.Strings[Indice];
            campos.add(Parametros.Strings[Indice]);
            FA.Pos := FA.Pos + 1;
            Application.ProcessMessages;
          end;
    end
  else
  begin
  case TipoEvento of
    2 : begin
          Parametros.Add('categoría');
        end;
    13 : begin
            Parametros.Add('estado reproductivo');
            Parametros.Add('cronología dentaria');
            Parametros.Add('condición corporal');
         end;
    28 : begin
            Parametros.Add('toro');
            Parametros.Add('cant. dosis');
            Parametros.Add('nombre del servicio');
         end;
    25 : begin
            Parametros.Add('fecha');
         end;
  end;
  showmessage(Parametros.GetText);
  cantCampos := Parametros.Count;

  for Indice := 0 to Parametros.Count-1 do
  begin
    SetLength(arrCampos,Length(arrCampos)+1);
//    SetLength(campos,Length(campos)+1);
    {case Indice of
      5 : Parametros.Strings[Indice] := 'rp';
      6 : Parametros.Strings[Indice] := 'ie';
    end;}
    if Parametros.Strings[Indice] = 'ie' then
      Parametros.Strings[Indice] := 'rp';
    arrCampos[Length(arrCampos)-1] := Parametros.Strings[Indice];
 //   campos[Length(campos)-1] := Parametros.Strings[Indice];
    campos.add(Parametros.Strings[Indice]);
    FA.Pos := FA.Pos + 1;
    Application.ProcessMessages;
  end;
  end;


  //Completar los parametros que no estan en el archivo
  IBQColumnasEvento.Close;
  IBQColumnasEvento.ParamByName('e').AsInteger := TipoEvento;
  IBQColumnasEvento.Open;
  IBQColumnasEvento.First;
  while not IBQColumnasEvento.Eof do
  begin
    Col := IBQColumnasEvento.FieldValues['columna'];
    ShowMessage(col);
    if not ExisteParametro(Parametros,Col) then
    begin
      SetLength(arrCampos,Length(arrCampos)+1);
   //   SetLength(campos,Length(campos)+1);
      arrCampos[Length(arrCampos)-1] := Col;
     // campos[Length(campos)-1] := Col;
      campos.add(col);
      Parametros.Add(Col);
      FA.Pos := FA.Pos + 1;
      Application.ProcessMessages;
    end;
    IBQColumnasEvento.Next;
  end;

  OtrosCampos := Parametros.Count;
end;

function TFImpVesta.documentoValido:boolean;
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

function TFImpVesta.getCol(campo:string):integer;
var i:integer;
begin
  i:=1;
  getCol:=0;
  for i := 0 to campos.count-1 do // Length(campos)-1 do
  begin
    if  ansipos(lowercase(campo),lowercase(campos[i]))=1 then
    begin
      getCol:=i;
      break;
    end;
  end;
end;

function TFImpVesta.setDefault(campo:string):Variant;  //setea el valor por defecto para el campo pasado como parametro
var
  str:string;
begin
  inherited;
  str:=ansilowercase(campo);
  setDefault:='';

  if (str='actividad') or (ansipos('dist.',str)<>0) or (str='descripción')
  or (str='enfermedad') or (ansipos('cronología',str)<>0)
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

function TFImpVesta.faltaRequerido(j:integer):boolean;
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

function TFImpVesta.esRequerido(campo:integer):boolean;
begin
  esRequerido:=false;
  if ansipos('*',pag.Cells[nombresCol,campo])<>0 then
    esRequerido:=true;
end;

procedure TFImpVesta.buscarEnCol(j:integer; campo:string; query:TIBQuery);
var ap,nom,nomyap:string;
    col:integer;
    form:TFABMSimple;
    Valores : TStringList;
begin
  col := getCol(campo);

  Valores := ObtenerValores(_Archivo.Strings[j]);

  if (col>0) and (col < Valores.Count) and (Valores.Strings[col] <> '') and (ansiuppercase(Valores.Strings[col])<>'INDEFINIDO') then
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
          (form as TFABMDescMetodoSinc).Metodo := DMSoftvet.IBQmetodosSincronizacion.Lookup('nombre',GetDato('método',anim[j-datos]),'id_metodo');
        end;
        form.nom:=ansiuppercase(Valores.Strings[col]);
        FPrincipal.AbrirFormNormal(form);
        setDato(campo,arrNuevos[Length(arrNuevos)-1],anim[j-datos]);
        query.Close;
        query.Open;
      end
      else
      begin
        setDato(campo,setDefault(campo),anim[j-datos]);
      end;
    end;
  end
  else
  begin
    if query.Locate('nombre',nomyap,[]) then
      setDato(campo,nomyap,anim[j-datos])
    else
      setDato(campo,setDefault(campo),anim[j-datos]);
  end;
end;

procedure TFImpVesta.buscarEnGral(var dato:Variant;campo:string;query:TIBQuery{;form:TFAbmSimple});
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

procedure TFImpVesta.agregarIdImportacion;
begin
  setLength(datosGrales,Length(datosGrales)+1);
//  setLength(campos,Length(campos)+1);
//  campos[Length(campos)-1]:='id importacion';
  campos.add('id importacion');
  datosGrales[Length(datosGrales)-1]:=armarID(fechaArchivo);
end;

function TFImpVesta.armarID(fecha:TDateTime):string;
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
