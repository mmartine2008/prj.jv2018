unit UImpXLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, Buttons, xmldom,
  XMLIntf, msxmldom, XMLDoc, IBDatabase, IBQuery, UEveDiagnosticoGestacion,
  UEveAltaMasiva, UBDBGrid, Grids, DBGrids, UPrincipal,UDMSoftVet, UCartel,
  UFunctions,UImportacion, UAbmSimple, URPRepetidos, StrUtils;

Type TFImpXLS=class(TFImportacion)
  private                                                   
    fechaArchivo:TDateTime;
    function getCol(campo:string):integer;
    function setDefault(campo:string):Variant;
    function esRequerido(campo:integer):boolean;
    function faltaRequerido(j:integer):boolean;
    procedure agregarIdImportacion;
    function armarID(fecha:TDateTime):string;
    {#1 INICIO 28/11/2014 Matias Rizzi}
    procedure AvanzarBarra(var i:integer; fin:integer);
    function VerificarXLSDiagGes(archivo : TFileName) : Boolean;
    function VerificarXLSEventos(archivo : TFileName) : Boolean;
    {#1 FIN 28/11/2014 Matias Rizzi}
  protected
    function cargarParametros:integer;
    procedure ProcesarNodo(fila:integer);override;
    procedure agregarDatosGrales(fila:integer);//override;
    procedure cargarAnimales(pag : OleVariant);
    function documentoValido:boolean;
    procedure buscarEnCol(j:integer;campo:string;query:TIBQuery{;form:TFAbmSimple});
    procedure buscarEnGral(var dato:Variant;campo:string;query:TIBQuery{;form:TFAbmSimple});
    function VerificarXLS(archivo : TFileName) : Boolean;
  public

    procedure cargar(archivo:TFileName);override;
  end;

implementation

uses UMensajeHuella,UAbmEmpleados,UAbmRodeos, UAbmPotreros,UEvePeso,UMovCargarDatos,UAvanceTerminar,
  ComObj, DateUtils, UImpDeps, UeveSimple, UABMActividad, UABMCentrosTransplantes,
  UABMCriador,UABMOrigen,UABMPropietarioAnimal, UABMFuentesDEPs, UABMDescMetodoSinc,
  UEveImportarPartosNacimientos, UAbmRechazosPreservicio, UVerificacionXLS, UTraduccion, UImportacionDepsRazasExcel;

var pag:OleVariant;
    j,datos,cantFilas,nombresCol,cantCampos,colRP:integer;
    datosGrales,arrCampos:array of Variant{arrGral};

{#1 INICIO 28/11/2014 Matias Rizzi}
procedure TFImpXLS.AvanzarBarra(var i:integer; fin:integer);
BEGIN
  while i<fin do
  Begin
    i:=i+1;
    FAvanceTerminar.Pos := i;
    Sleep(75);
    FAvanceTerminar.Update;
  END;
  Application.ProcessMessages;
END;
{#1 FIN 28/11/2014 Matias Rizzi}

{#1 INICIO 28/11/2014 Matias Rizzi}
function TFImpXLS.VerificarXLSDiagGes(archivo : TFileName) : Boolean;
var
  F : TFVerificacionXLS;
  i: integer;
begin
  i:=0;
  FAvanceTerminar := TFAvanceTerminar.Create(self);
  FAvanceTerminar.LTitulo.Caption:=Traducir('Abriendo Archivo');
  FAvanceTerminar.Max := 90;

  AvanzarBarra(i, 30);

  Application.ProcessMessages;
  F := TFVerificacionXLS.Create(self,archivo,TipoEv);
  AvanzarBarra(i, 60);
  F.VerificarPlanilla;
  F.ShowModal;

  if F.ModalResult=mrNo then
    begin
      F.Close;
      F.Destroy;
      FAvanceTerminar.Destroy;
      {#2 INICIO 02/12/2014 Matias Rizzi}
      raise Exception.Create('Cancelacion');
      {#2 INICIO 02/12/2014 Matias Rizzi}
    end;
 /// else
  //  F.ShowModal;
  //AvanzarBarra(i, 90);
 // FAvanceTerminar.Destroy;
  Result := F.ModalResult = mrOk;
 // F.Close;
  F.Destroy;
end;

function TFImpXLS.VerificarXLSEventos(archivo : TFileName) : Boolean;
var
  F : TFVerificacionXLS;
begin
  F := TFVerificacionXLS.Create(self,archivo,TipoEv);
  if not F.VerificarPlanilla then
  begin
    F.ShowModal;
    Result := F.Resultado = mrOk;
  end;
  F.Destroy;
  result := true;
end;

{#2 INICIO 02/12/2014 Matias Rizzi}
function TFImpXLS.VerificarXLS(archivo : TFileName) : Boolean;
begin
  IF ((FImportacion.owner is TFEveDiagnosticoGestacion)
      OR (FImportacion.owner is TFEveAltaMasiva)) THEN
    BEGIN
      Result:=VerificarXLSDiagGes(archivo);
    END
  ELSE
    BEGIN
      Result:=VerificarXLSEventos(archivo);
    END;
end;
{#2 FIN 02/12/2014 Matias Rizzi}
{#1 FIN 28/11/2014 Matias Rizzi}

procedure TFImpXLS.cargar(archivo:TFileName);
var xls,xlw: OleVariant;
    intFileAge:integer;
    //wndFile: Integer;
    //FStruct: TOFSTRUCT;
begin
    inherited;
    hayNuevos:=false;
    intFileAge := FileAge(archivo);
    if intFileAge = -1 then
      fechaArchivo := 0
    else
      fechaArchivo := FileDateToDateTime(intFileAge);
    ////Obtenemos la fecha de modificacion del archivo
   { wndFile := OpenFile(PChar(archivo), FStruct, OF_SHARE_DENY_NONE);
    fechaArchivo:= FileDateToDateTime(FileGetDate(wndFile)); }
    try
      {if documentoValido then
      begin}
        if VerificarXLS(archivo) then
          begin
            try
              xls := CreateOleObject('Excel.Application');
              xlw := xls.WorkBooks.Open(FileName := archivo);
              pag:=xlw.Sheets[1];
              cargaDeMovil:=true;
              cargarAnimales(pag);
            finally
               try
                 // xls.WorkBooks.Close;
                  if not VarIsEmpty(xls) then
                  begin
                    OleVariant(xls).DisplayAlerts := False;
                    OleVariant(xls).Quit;
                   // Add this line
                  end;
                 except

                 end;
              xlw := UnAssigned;
             { if not VarIsEmpty(xls) then
                begin
                  OleVariant(xls).DisplayAlerts := False;
                  OleVariant(xls).Quit;
                  // Add this line
                end;
             }
              //xls.Quit;
              OleVariant(xls) := UnAssigned;
          end;
        end
        else
          begin
            {#1 INICIO 28/11/2014 Matias Rizzi}
            //owner.;
            //self.Owner.;
            {#2 INICIO 02/12/2014 Matias Rizzi}
            IF NOT ((FImportacion.owner is TFEveDiagnosticoGestacion)
                OR (FImportacion.owner is TFEveAltaMasiva)) THEN
            {#2 FIN 02/12/2014 Matias Rizzi}
              BEGIN
                MostrarMensaje(tmError,'No se solucionaron todos los errores de la planilla, por lo que no podra iniciar la importación');
                cargaDeMovil := false;
              END
            ELSE
              exit;
              //abort;
            {#1 FIN 28/11/2014 Matias Rizzi}
          end;

      {end
      else
      begin
          MostrarMensaje(tmError,'El documento no corresponde a este tipo de evento. Por favor verifique el archivo');
          cargaDeMovil:=false;
      end;}
    except
        {#2 INICIO 02/12/2014 Matias Rizzi}
        on e:Exception do
          begin
            cargaDeMovil:=false;
            IF (FImportacion.owner is TFEveAltaMasiva)
             THEN
              raise e;
          END;
        {#2 FIN 02/12/2014 Matias Rizzi}
    end;
end;



procedure TFImpXLS.cargarAnimales(pag : OleVariant);
var
  row,res:integer;
begin
  j:=2;
  SetLength(datosGrales,0);
  SetLength(arrCampos,0);
//  SetLength(campos,0);
  campos.Clear();
  ////////////
  {#1 INICIO 28/11/2014 Matias Rizzi}
  IF NOT ((FImportacion.owner is TFEveDiagnosticoGestacion)
      OR (FImportacion.owner is TFEveAltaMasiva)) THEN
  BEGIN
    FAvanceTerminar.Pos := 1;
    FAvanceTerminar.Max := 30; //MSimple.FCantidadSeleccionados;
    FAvanceTerminar.Modo := maDetalle;
    FAvanceTerminar.LTitulo.Caption:=Traducir('Cargando Parámetros');
    FAvanceTerminar.PBTerminar.Orientation:=pbVertical;
    FAvanceTerminar.Update;
    Application.ProcessMessages;
  END;
  {#1 FIN 28/11/2014 Matias Rizzi}
  ////////////
  res:=cargarParametros;
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
      {#1 INICIO 28/11/2014 Matias Rizzi}
      {#2 INICIO 02/12/2014 Matias Rizzi}
      IF ((FImportacion.owner is TFEveDiagnosticoGestacion)
          OR (FImportacion.owner is TFEveAltaMasiva)) THEN
        BEGIN
          FAvanceTerminar := TFAvanceTerminar.Create(self);
        END;
      {#2 FIN 02/12/2014 Matias Rizzi}
      {#1 FIN 28/11/2014 Matias Rizzi}
      FAvanceTerminar.Pos := 1;
      FAvanceTerminar.Max := cantFilas; //MSimple.FCantidadSeleccionados;
      FAvanceTerminar.Modo := maDetalle;
      FAvanceTerminar.LTitulo.Caption:=Traducir('Importando Animales');
      FAvanceTerminar.PBTerminar.Orientation:=pbHorizontal;
      FAvanceTerminar.Update;
      Application.ProcessMessages;
      ////////////
      //setLength(anim,cantFilas);
      for row:=datos to cantFilas+datos-1 do
      begin
        ////////////
        FAvanceTerminar.Pos:=FAvanceTerminar.Pos+1;
        Application.ProcessMessages;
        ////////////
       // if(row = 276)then
       //   ShowMessage(IntToStr(row));
        ProcesarNodo(row);
        if (not cargaTemp) then //acelera muchisimo el tema de la carga de grillas sin terminar
        begin
          buscarEnCol(row,'descripción',DMSoftvet.IBQDescMetodoSinc);
          buscarEnCol(row,'potrero',DMSoftvet.IBQPotrero{,TFABMPotreros.Create(self)});              // -|
          buscarEnCol(row,'rechazo',DMSoftvet.IBQRechazo);
          buscarEnCol(row,'responsable',DMSoftvet.IBQResponsable{,TFABMEmpleados.Create(self)});     //Ref:01
          if (self.Owner is TFEveAltaMasiva) then
          begin
            buscarEnCol(row,'responsable',DMSoftvet.IBQResponsable{,TFABMEmpleados.Create(self)});            //  |
            buscarEnCol(row,'criador',DMSoftvet.IBQCodCriador{,TFABMCriador.Create(self)});                   //  |
            buscarEnCol(row,'rodeo',DMSoftvet.IBQRodeo{,TFABMRodeos.Create(self)});                           //  |-->TODO ESTO HACE MUY LENTO EL TEMA DE LA CARGA. DEFINIR CUALES CONVIENE DEJAR
            buscarEnCol(row,'orígen',DMSoftvet.IBQCodOrigen{,TFABMOrigen.Create(self)});                      //  |
            buscarEnCol(row,'propietario',DMSoftvet.IBQCodPropietario{,TFABMPropietarioAnimal.Create(self)}); // -|
          end
          else
          begin
            if getCol('Centro de Transplante')>0 then  buscarEnCol(row,'centro de transplante',DMSoftvet.IBQCentrosTransplante{,TFABMCentrosTransplantes.Create(self)}); //la busqueda de centro de transplantes es lentisima
            //if getCol('fuente')>0 then buscarEnCol(row,'fuente',DMSoftvet.IBQFuentesDeps);
            //lo mismo hay que hacer para ACTIVIDAD, TORO, TIPO DE SUPLEMENTACION. Con cada uno que se agregue aumenta el tiempo de carga considerablemente... asique...
          end;
        end;
      end;
      agregarIdImportacion;
     { SetLength(campos,Length(Campos)+1);
      campos[Length(Campos)-1] := 'id importacion';}
    end;//end del case 0
  end; //end del case
end;

procedure TFImpXLS.procesarNodo(fila:integer);
var indice,indDEP,columna,hba,indDatosDEP,indCampo,column, idsexo :integer;
    str, strRP, strSexo ,strIE,rowData :string;
    FRep : TFRpRepetidos;
    idAnimal : variant;
    idElectronico : string;
    tieneCampoIE : boolean;
begin
  if (pag.Cells[fila,getCol('RP')].Text<>'') or (pag.Cells[fila,getCol('HB')].Text<>'') then
  begin
    if (not(self.Owner is TFImpDeps) and not(self.Owner is TFImportacionDepsRazasExcel)) then
    begin
      indice:=fila-datos;
      setLength(anim,Length(anim)+1);
      agregarDatosGrales(indice);
      setLength(anim[indice].arrDEP,0);
      anim[indice].idImportacion:=armarID(fechaArchivo);
      // Se cargan los datos en la estructura de Animales
      for columna:=1 to cantCampos do
      begin
        if not(pag.columns[columna].Hidden) then
        begin
          setLength(anim[indice].datos,Length(anim[indice].datos)+1);
          setLength(anim[indice].errores,Length(anim[indice].datos)+1);
          indCampo:=Length(anim[indice].datos)-1; //columna-1+Length(datosGrales);
          if  pag.Cells[fila,columna].Text<>'' then
            if ansipos('cond',lowercase(pag.Cells[nombresCol,columna].Text))=1 then
            begin
              anim[indice].datos[indCampo] := normalizarCC(ansiuppercase(pag.Cells[fila,columna].Text),tipoCC);
              anim[indice].errores[indCampo].valor := normalizarCC(ansiuppercase(pag.Cells[fila,columna].Text),tipoCC);
              anim[indice].errores[indCampo].campo := campos[indCampo];
              anim[indice].errores[indCampo].colEx := columna;
              anim[indice].errores[indCampo].filaEx := fila;
              anim[indice].errores[indCampo].error := false;
            end
            else
            begin
              rowData :=pag.Cells[fila,columna].Text;
              anim[indice].datos[indCampo] := trim(ansiuppercase(sinAcento(rowData)));
              anim[indice].errores[indCampo].valor :=  anim[indice].datos[indCampo];
              anim[indice].errores[indCampo].campo := campos[indCampo];
              anim[indice].errores[indCampo].colEx := columna;
              anim[indice].errores[indCampo].filaEx := fila;
              anim[indice].errores[indCampo].error := false;
            end
          else
          begin
            anim[indice].datos[indCampo]:= setDefault(pag.Cells[nombresCol,columna].Text);
            anim[indice].errores[indCampo].valor := setDefault(pag.Cells[nombresCol,columna].Text);
            anim[indice].errores[indCampo].campo := campos[indCampo];
            anim[indice].errores[indCampo].colEx := columna;
            anim[indice].errores[indCampo].filaEx := fila;
            anim[indice].errores[indCampo].error := false;
          end;
        end;
      end;
     // Se añade un identificador de CARGA
      SetLength(anim[indice].datos,Length(anim[indice].datos)+1);
      anim[indice].datos[Length(anim[indice].datos)-1] := armarID(fechaArchivo);
      // Verifica con el Identificador Electronico
      if (getDato('ie',anim[indice])<>'')and
         (DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('ie',anim[indice]),'ID_ANIMAL')<>null) then
      begin
      // Asigna el ID a partir del identificador electronico
        anim[indice].id:=DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('ie',anim[indice]),'ID_ANIMAL');
         // Lee el RP que corresponde a este animal
        strRP :=   DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',getDato('ie',anim[indice]),'ID_RP');

        setDato('rp',strRP,anim[indice]);
      end
      else
      // Importa datos de eventos
      begin
        if self.Owner is TFEveImportarPartosNacimientos then
          str := 'rp (madre evento)'
        else
          str := 'rp';

        idAnimal :=  getDato(str,anim[indice]);
        // Es un ID Electronico , lo reemplazo por un ID_RP
        if (DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',idAnimal,'ID_ANIMAL')<>null) then
        begin
          idElectronico := idAnimal;
          idAnimal := DMSoftvet.IBQDatosAnimal.Lookup('ID_IE',idAnimal,'ID_RP');
          setDato( str, idAnimal, anim[indice] );
          setDato( 'ie', idElectronico, anim[indice] );
        end
        else
          idElectronico := '';
        // Seteo el ID interno y verifico si no esta repetido
          if (DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',idAnimal,'ID_ANIMAL')<>null) then
        begin
          DMSoftvet.IBQRpRepetidos.Close;
          DMSoftvet.IBQRpRepetidos.ParamByName('rp').AsString := idAnimal;
          DMSoftvet.IBQRpRepetidos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
          DMSoftvet.IBQRpRepetidos.Open;
          DMSoftvet.IBQRpRepetidos.Last;
          DMSoftvet.IBQRpRepetidos.Open;
          if (DMSoftvet.IBQRpRepetidos.RecordCount > 1)  then
          begin
            if self.Owner is TFEveAltaMasiva then
            begin
              anim[indice].id := -1;
              hayNuevos := hayNuevos or (anim[indice].id = -1);
            end
            else
            begin
             { FRep := TFRpRepetidos.Create(nil,idAnimal,GetVista(DMSoftvet.IBQRpRepetidos.SQL[0]) );
              FRep.ShowModal;
              anim[indice].id := FRep.Obtener_ID;
              hayNuevos := hayNuevos or (anim[indice].id = -1);
              FRep.Destroy;}
            end;
          end
          else
          begin
            if DMSoftvet.IBQRpRepetidos.RecordCount = 1 then
              anim[indice].id:=DMSoftvet.IBQRpRepetidos.Lookup('ID_RP',idAnimal,'ID_ANIMAL')
            else
              anim[indice].id:=DMSoftvet.IBQDatosAnimal.Lookup('ID_RP',idAnimal,'ID_ANIMAL')
          end;
        end
        else
        begin    //si el animal no existe, el id sera -1
          anim[indice].id:=-1;

          strRP :=getDato('rp',anim[indice]) ;
          // Este campo es muy extenso, es un IE
          if (length (strRP) > 10) then
          begin
             strIE := strRP;
             strRP := copy(strRP,length(strRP)-9,10);
             setDato('rp',strRP,anim[indice]);
             setDato('ie',strIE,anim[indice]);
          end ;
          hayNuevos:=true;       //se setea el parametro en true para que despues pregunte si se quieren agregar los animales nuevos
        end;
      end;
    end
    else
    // Busca POR HBA
    begin
      hba:=getCol('HBA*');
      indice:=getPosicion(pag.Cells[fila,hba].Text,anim,0);
      if indice=-1 then
      begin
        setLength(anim,Length(anim)+1);
        indice:=Length(anim)-1;
        setLength(anim[indice].arrDEP,1);
      end
      else
      begin
        setLength(anim,Length(anim)+1);
        indice := Length(anim)-1;
        setLength(anim[indice].arrDEP,1);
      end;

      indDEP:=Length(anim[indice].arrDEP)-1;
      setLength(anim[indice].arrDEP[indDEP].datosDEP,campos.count);
      agregarDatosGrales(indice);
      for column:=1 to campos.count do
        if not(pag.columns[column].Hidden) then
        begin
          indDatosDEP:=column-1;
          if (pag.Cells[fila,column].Value<>null) and (pag.Cells[fila,column].Text<>'') then
            anim[indice].arrDEP[indDEP].datosDEP[indDatosDEP]:=trim(pag.Cells[fila,column].Text)
          else
            anim[indice].arrDEP[indDEP].datosDEP[indDatosDEP]:=setDefault(pag.Cells[nombresCol,column].Text);
        end;

      str:=ansiuppercase(getDatoDEP('hb',anim[indice].arrDEP[indDEP]));
      strRP := ansiuppercase(getDatoDEP('rp',anim[indice].arrDEP[indDEP]));
      strSexo := ansiuppercase(getDatoDEP('sexo',anim[indice].arrDEP[indDEP]));

      if strSexo <> '' then
        idsexo := DMSoftvet.IBQSexo.Lookup('NOMBRE',strSexo,'id_sexo')
      else
        idsexo := 1;
      dmsoftvet.IBQDatosAnimal.Close;
      dmsoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
      dmsoftvet.IBQDatosAnimal.Open;

      DMSoftvet.IBQSexo.Close;
      DMSoftvet.IBQSexo.Open;

      //DMSoftvet.IBQDatosAnimal.Locate()
      if (strRP <> '') and (DMSoftvet.IBQDatosAnimal.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_RP')<>null) then
      begin
        if (DMSoftvet.IBQDatosAnimal.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_HBA')<>null) and (DMSoftvet.IBQDatosAnimal.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_HBA')<>'') then
        begin
          if (str <> '') and (DMSoftvet.IBQDatosAnimal.Lookup('ID_HBA',str,'ID_HBA') <> null) then
            anim[indice].id := DMSoftvet.IBQDatosAnimal.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_ANIMAL')
          else
          begin
            DMSoftvet.IBQAnimExt.Close;
            DMSoftvet.IBQAnimExt.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
            DMSoftvet.IBQAnimExt.Open;
            if (strRP <> '') and (DMSoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_RP')<>null) then
            begin
              if (DMSoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_HBA') <> null) and (DMSoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_HBA') <> '') then
              begin
                if (str <> '') and (DMSoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_HBA') <> null) then
                  anim[indice].id := DMsoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_ANIMAL_EXTERNO')
                else
                begin
                  anim[indice].id := -1;
                  hayNuevos := true;
                end
              end
              else
                anim[indice].id := DMSoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_ANIMAL_EXTERNO');
            end
            else
            begin
              anim[indice].id := -1;
              hayNuevos := true;
            end;
          end;
        end
        else
          anim[indice].id := DMSoftvet.IBQDatosAnimal.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_ANIMAL');
      end
      else
      begin
        DMSoftvet.IBQAnimExt.Close;
        DMSoftvet.IBQAnimExt.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
        DMSoftvet.IBQAnimExt.Open;
        if (strRP <> '') and (DMSoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_RP')<>null) then
        begin
          if (DMSoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_HBA') <> null) and (DMSoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_HBA') <> '') then
          begin
            if (str <> '') and (DMSoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_HBA') <> null) then
              anim[indice].id := DMsoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_ANIMAL_EXTERNO')
            else
            begin
              anim[indice].id := -1;
              hayNuevos := true;
            end
          end
          else
            anim[indice].id := DMSoftvet.IBQAnimExt.Lookup('ID_RP;SEXO',VarArrayOf([strRP,idsexo]),'ID_ANIMAL_EXTERNO');
        end
        else
        begin
          anim[indice].id := -1;
          hayNuevos := true;
        end;
      end;
    end;
  end;
end;

procedure TFImpXLS.agregarDatosGrales(fila:integer);
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

function TFImpXLS.cargarParametros:integer;
var i,j:integer;
    existe:boolean;
    existeIE : boolean;
begin
{DMSoftvet.IBQTipoSexo.Close;
DMSoftvet.IBQTipoSexo.Open;}
IBQImportacion.Close;
IBQImportacion.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
IBQImportacion.Open;
j:=2;
cargarParametros:=0;
existeIE := false;
//agregarIdImportacion;
existe:=IBQImportacion.Locate('ID_IMPORTACION',armarID(fechaArchivo),[loCaseInsensitive]);
if existe then
  if MostrarMensaje(tmConsulta,'Este archivo ya fue ingresado al sistema. Desea volver a cargarlo?')=mrNo then
    begin
    cargarParametros:=2;
    Exit;
    end;
  tipoCC:='';

  if pag.Cells[j,1].Text='Datos Obligatorios' then j:=j+1; //esto es para saltar la linea en alta masiva
  while (AnsiPos('RP',ansiuppercase(pag.cells[j,1].Text))<>1) and (AnsiPos('RP',ansiuppercase(pag.cells[j,2].Text))<>1) and (AnsiPos('RP',ansiuppercase(pag.cells[j,3].Text))<>1) do
        begin
          if (ansipos('*',pag.cells[j,1].Text)<>0) and ((pag.cells[j,2].Text='')and(pag.cells[j,3].Text='')) then //chequea campos obligatorios en los datos grales
            cargarParametros:=1;
          if (pag.cells[j,2].Text='Condición_1_5') or (pag.cells[j,3].Text='Condición_1_5') then tipoCC:='1-5';//Se fija si es hay CC, que tipo de CC es
          if (pag.cells[j,2].Text='Condición_1_9') or (pag.cells[j,3].Text='Condición_1_9') then tipoCC:='1-9';
          SetLength(datosGrales,Length(datosGrales)+1);
          //SetLength(campos,Length(campos)+1);
          //datosGrales[Length(datosGrales)-1].nomCampo:=pag.cells[j,1].Text;
          datosGrales[Length(datosGrales)-1]{.valorCampo}:=ansiuppercase(pag.cells[j,2].Text);
          //campos[Length(campos)-1]:=pag.cells[j,1].Text;
          campos.add(pag.cells[j,1].Text);
          if pag.cells[j,1].Text='Rodeo' then
            //buscarRodeo(datosGrales[Length(datosGrales)-1]{.valorCampo});
            buscarEnGral(datosGrales[Length(datosGrales)-1],'rodeo',DMSoftvet.IBQRodeo{,TFABMRodeos.Create(self)});
          if pag.cells[j,1].Text='Potrero' then
            buscarEnGral(datosGrales[Length(datosGrales)-1],'potrero',DMSoftvet.IBQPotrero{,TFABMRodeos.Create(self)});
          if (pag.cells[j,1].Text='Responsable') or (pag.cells[j,1].Text='Observador') then
            //buscarResp(datosGrales[Length(datosGrales)-1]{.valorCampo});
            buscarEnGral(datosGrales[Length(datosGrales)-1],'responsable',DMSoftvet.IBQResponsable{,TFABMEmpleados.Create(self)});
          if (pag.cells[j,1].Text='Fuente') then
            buscarEnGral(datosGrales[Length(datosGrales)-1],'fuente',DMSoftvet.IBQFuentesDEPs);

          {if (pag.cells[j,1].Text='Raza') then
            buscarEnGral(datosGrales[Length(datosGrales)-1],'raza',DMSoftvet.IBQRaza);}
          j:=j+1;
          {#1 INICIO 28/11/2014 Matias Rizzi}
          {#2 INICIO 02/12/2014 Matias Rizzi}
          IF NOT ((FImportacion.owner is TFEveDiagnosticoGestacion)
              OR (FImportacion.owner is TFEveAltaMasiva)) THEN
            BEGIN
              FAvanceTerminar.Pos:=FAvanceTerminar.Pos+1;
              Application.ProcessMessages;
            END;
          {#2 FIN 02/12/2014 Matias Rizzi}
          {#1 FIN 28/11/2014 Matias Rizzi}
       end;
    nombresCol:=j;//en esta fila estan los nombres de los campos
    datos:=j+1;//a partir de aca estan los datos
    i:=1;
    while pag.cells[nombresCol,i].Text<>'' do
      begin
      if not(pag.columns[i].Hidden) then
        begin
        if  AnsiPos('RP',ansiuppercase(pag.cells[nombresCol,i].Text))=1 then
          colRP:=i;
        //asignarColumna(nombresCol,i);
        SetLength(arrCampos,Length(arrCampos)+1);
       // SetLength(campos,Length(campos)+1);
        arrCampos[Length(arrCampos)-1]{.nomCampo}:=pag.cells[nombresCol,i].Text;
        //arrCampos[Length(arrCampos)-1].valorCampo:=i;
       // campos[Length(campos)-1]:=pag.cells[nombresCol,i].Text;
         campos.add(pag.cells[nombresCol,i].Text);
         if (ansiuppercase(pag.cells[nombresCol,i].Text)='IE') then
            existeIE := true;

        end;
      i:=i+1;
      {#1 INICIO 28/11/2014 Matias Rizzi}
      {#2 INICIO 02/12/2014 Matias Rizzi}
      IF NOT ((FImportacion.owner is TFEveDiagnosticoGestacion)
          OR (FImportacion.owner is TFEveAltaMasiva)) THEN
        BEGIN
          FAvanceTerminar.Pos:=FAvanceTerminar.Pos+1;
          Application.ProcessMessages;
        END;
      {#2 FIN 02/12/2014 Matias Rizzi}
      {#1 FIN 28/11/2014 Matias Rizzi}
      end;
    cantCampos:=i-1; //la cantidad de columnas que tendra la tabla
    j:=datos;
    cantfilas:=0;
    DMSoftvet.IBQDatosAnimal.Close;
    DMSoftvet.IBQDatosAnimal.ParamByName('establecimiento').AsInteger:=FPrincipal.EstablecimientoActual;
    DMSoftvet.IBQDatosAnimal.Open;
    {#1 INICIO 28/11/2014 Matias Rizzi}
    {#2 INICIO 02/12/2014 Matias Rizzi}
    IF NOT ((FImportacion.owner is TFEveDiagnosticoGestacion)
        OR (FImportacion.owner is TFEveAltaMasiva)) THEN
      FAvanceTerminar.Pos:=0;
    {#2 FIN 02/12/2014 Matias Rizzi}
    {#1 FIN 28/11/2014 Matias Rizzi}
    while (pag.cells[j,1].Text<>'') or (pag.cells[j,2].Text<>''){ or (pag.cells[j,3].Text<>'') or (pag.cells[j,4].Text<>'')}do
      begin
      {#1 INICIO 28/11/2014 Matias Rizzi}
      {#2 INICIO 02/12/2014 Matias Rizzi}
      IF NOT ((FImportacion.owner is TFEveDiagnosticoGestacion)
         OR (FImportacion.owner is TFEveAltaMasiva)) THEN
        BEGIN
          FAvanceTerminar.Max:=FAvanceTerminar.Max+1;
          FAvanceTerminar.Pos:=FAvanceTerminar.Pos+2;
          Application.ProcessMessages;
        END;
      {#2 FIN 02/12/2014 Matias Rizzi}
      {#1 FIN 28/11/2014 Matias Rizzi}
      if faltaRequerido(j) then
          begin
          cargarParametros:=1;
          Exit;
          end;
      j:=j+1;
      cantFilas:=cantFilas+1;
      end;
    j:=datos;
 //fuerzo que el campo exista
 if not existeIE then
 begin
   campos.Add('ie');
   cantCampos := cantCampos + 1;
  end;
//agregarIdImportacion;
end;

function TFImpXLS.documentoValido:boolean;
var
  s1,s2:string;
  res : boolean;
begin
  inherited;
  s1:=lowercase(tipoEv);
  s2:=lowercase(pag.cells[1,1].Text);
  if (ansipos(s1,s2)<>0) or (ansipos(s2,s1)<>0){or (StrPos(pag.cells[1,1].Text,self.Owner.Name)<>0)} then
    res:=true
  else
    res:=false;
  res := ((s1 = 'importación de partos y nacimientos') and (s2 = 'planilla de partos y nacimientos')) or res;
  documentoValido := res;
end;

function TFImpXLS.getCol(campo:string):integer;
var i:integer;
begin
i:=1;
getCol:=0;
while pag.Cells[nombresCol,i].Text <>'' do
  begin
  if  ansipos(lowercase(campo),lowercase(pag.Cells[nombresCol,i].Text))=1 then
    begin
    getCol:=i;
    break;
    end;
  i:=i+1;
  end;
end;

function TFImpXLS.setDefault(campo:string):Variant;  //setea el valor por defecto para el campo pasado como parametro
var str:string;
begin
inherited;
str := ansilowercase(campo);
setDefault := '';

if (str = 'actividad') or (ansipos('dist.',str) <> 0) or (str = 'descripción') or
   (str = 'enfermedad') or (ansipos('cronología',str) <> 0) or (ansipos('técnica de trat',str) <> 0) then
      setDefault := 'NO DEFINIDA';

if (str = 'diagnosticador') or (ansipos('estado re',str) <> 0) or (ansipos('orígen',str) <> 0) or
   (str = 'causa') or (str = 'gdr') or (ansipos('método',str) <> 0) or (ansipos('tipo des',str) <> 0) or
   (ansipos('suplementación',str) <> 0) or (ansipos('tipo de trat',str) <> 0) or
   (ansipos('centro',str) <> 0) then
      setDefault := 'NO DEFINIDO';

if (str = 'potrero') or (str = 'rodeo') or (str = 'responsable') or (str = 'observador') or (str = 'nuevo rodeo') or
   (str = 'nuevo potrero') then
      setDefault := 'INDEFINIDO';

if (str = 'raza') then
      setDefault := 'NN';

if ((ansipos('altura',str) <> 0) and (ansipos('altura dep',str) = 0) and ((ansipos('altura prec',str) = 0))) or
   (ansipos('alto',str) <> 0) or (ansipos('ancho',str) <> 0) or (ansipos('sangrado brucelosis',str) <> 0) or
   (str = 'evaluación manual') or (ansipos('preñez',str) <> 0) or (ansipos('area',str) <> 0) or (ansipos('frame',str) <> 0) or
   (ansipos('18 meses',str) <> 0) or (ansipos('cantidad im',str) <> 0) or (ansipos('circunferencia',str) <> 0) or (ansipos('cantidad imágenes o.p.b.e.g.d.',str) <> 0) or
   (ansipos('cantidad imágenes e.g.c.',str) <> 0) or (ansipos('cantidad imágenes g.i.',str) <> 0) then
      setDefault := 0;

if (ansipos('peso',str) <> 0) then
      setDefault := '0'; 

if (ansipos('peso al',str) <> 0) or (ansipos('aptitud',str) <> 0) or (ansipos('leche',str) <> 0) or
   (ansipos('circun.',str) <> 0) or (ansipos('area',str) <> 0) or (ansipos('grasa',str) <> 0) or (ansipos('peso final',str) <> 0) or
   (ansipos('%',str) <> 0) or (ansipos('peso',str) <> 0) or (ansipos('c.e.',str) <> 0) or (ansipos('pn',str) <> 0) or
   (ansipos('pd',str) <> 0) or (ansipos('pa',str) <> 0) or (ansipos('pf',str) <> 0) or (ansipos('lm',str) <> 0) or
   (ansipos('l&c',str) <> 0) or (ansipos('ce',str) <> 0) or (ansipos('aob',str) <> 0) or (ansipos('gd',str) <> 0) or
   (ansipos('altura',str) <> 0) or (ansipos('e.d.c.',str) <> 0) or (ansipos('e.g.d.',str) <> 0) or (ansipos('a.o.b.',str) <> 0) or
   (ansipos('gest.',str) <> 0) or (ansipos('dest.',str) <> 0) or (ansipos('nacer',str) <> 0) or (ansipos('final',str) <> 0) then
      setDefault := '';

if (ansipos('cant. dosis',str) <> 0) then
      setDefault := 1;

if (str = 'días') then
      setDefault := 'GENERAL';

if ((ansipos('fecha',str) <> 0) or (ansipos('hora',str) <> 0)) and ((ansipos('nac',str) = 0) and (ansipos('horas',str) = 0)) then
      setDefault := now;

if self.Owner is TFEveImportarPartosNacimientos then
  if (str = 'causa') or (str = 'grado') then
      setDefault := 'NO DEFINIDA';

end;

function TFImpXLS.faltaRequerido(j:integer):boolean;
var campo:integer;
begin
faltaRequerido:=false;
for campo:=1 to cantCampos do
  if (esRequerido(campo)) and (pag.cells[j,campo].Text='') then
    begin
    faltaRequerido:=true;
    break;
    end;
end;

function TFImpXLS.esRequerido(campo:integer):boolean;
begin
esRequerido:=false;
if ansipos('*',pag.Cells[nombresCol,campo])<>0 then
  esRequerido:=true;
end;

procedure TFImpXLS.buscarEnCol(j:integer;campo:string;query:TIBQuery{;form:TFAbmSimple});
var ap,nom,nomyap:string;
    col:integer;
    form:TFABMSimple;
begin
col:=getCol(campo);
if (col>0) and (pag.cells[j,col].Text<>'') and (ansiuppercase(pag.cells[j,col].Text)<>'INDEFINIDO') then
  begin
  str:=trim(ansiuppercase(pag.cells[j,col].Text));
  separarNombre(str,nom,ap);   //devuelve el nombre en nom y el apellido en ap
  nomyap:=trim(nom+' '+ap);
  query.close;
  query.open;
  if (not pertenece(nomyap,arrNuevos)) and (not query.Locate('nombre',nomyap,[])) then
    begin
    setLength(arrNuevos,Length(arrNuevos)+1);
    //nom:=pag.cells[j,col].Text;
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
        form.nom:= nomyap; //ansiuppercase(pag.cells[j,col].Text);
        FPrincipal.AbrirFormNormal(form);
        setDato(campo,arrNuevos[Length(arrNuevos)-1],anim[j-datos]);
        query.Close;
        query.Open;
        end
    else
        begin
        setDato(campo,setDefault(campo),anim[j-datos]);
        //form.Destroy;
        end;
    end
  else
    begin
      if query.Locate('nombre',nomyap,[]) then
        setDato(campo,nomyap,anim[j-datos])
      else
        setDato(campo,setDefault(campo),anim[j-datos]);
      //form.Destroy;
    end;
  end
else
  //form.Destroy;
end;

procedure TFImpXLS.buscarEnGral(var dato:Variant;campo:string;query:TIBQuery{;form:TFAbmSimple});
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
              if campo='rodeo' then form:= TFABMRodeos.Create(self);
              if campo='fuente' then form := TFABMFuentesDeps.Create(self);
              if campo='potrero' then form := TFABMPotreros.Create(self);
              form.nom:=ansiuppercase(dato);
              FPrincipal.AbrirFormNormal(form);
              //separarNombre(arrNuevos[Length(arrNuevos)-1],nom,ap);
              dato:=arrNuevos[Length(arrNuevos)-1];
              query.Close;
              query.Open;
              end;
          end
        else
          begin
          dato:=setDefault(campo);
          //form.Destroy;
          end;
        end
      else
        begin
          if query.Locate('nombre',nombre,[]) then
            dato:= ansiuppercase(nombre)
          else
            dato:=setDefault(campo);
        //form.Destroy;
        end;
      end
else
  //form.Destroy;
end;

procedure TFImpXLS.agregarIdImportacion;
begin
  setLength(datosGrales,Length(datosGrales)+1);
//  setLength(campos,Length(campos)+1);
//  campos[Length(campos)-1]:='id importacion';
  campos.add('id importacion');
  datosGrales[Length(datosGrales)-1]:=armarID(fechaArchivo);
end;

function TFImpXLS.armarID(fecha:TDateTime):string;
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
