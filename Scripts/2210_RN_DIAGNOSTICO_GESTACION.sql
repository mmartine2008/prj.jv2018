SET TERM ^ ;

CREATE OR ALTER PROCEDURE RN_DIAGNOSTICO_GESTACION(
  ANIMAL INTEGER,
  DIAS_GESTACION INTEGER,
  ACTUAL DATE,
  ESTA INTEGER,
  REPRO INTEGER,
  INI DATE,
  FIN DATE)
RETURNS(
  RESULT VARCHAR(1) CHARACTER SET NONE,
  MENSAJE VARCHAR(255) CHARACTER SET NONE)
AS
DECLARE VARIABLE FECHA DATE;
DECLARE VARIABLE MESES FLOAT;
DECLARE VARIABLE AUXVALOR INTEGER;
DECLARE VARIABLE ERROR INTEGER;
DECLARE VARIABLE FECHA_ULTIMA DATE;
DECLARE VARIABLE DIAS INTEGER;
DECLARE VARIABLE EVEABORTO INTEGER;
DECLARE VARIABLE SERVICIO INTEGER;
DECLARE VARIABLE FECHAEGRESOSERVICIO DATE;
DECLARE VARIABLE DIAS_SERVICIO INTEGER;
DECLARE VARIABLE DIAGNOSTICO INTEGER;
DECLARE VARIABLE ER INTEGER;
DECLARE VARIABLE EA INTEGER;
DECLARE VARIABLE DPS INTEGER;
DECLARE VARIABLE DTS INTEGER;
DECLARE VARIABLE FECHA_PARTO DATE;
DECLARE VARIABLE FECHA_AUX DATE;
BEGIN
  error = 0;
  /* PARA LOS DIAS DE GESTACION */
  /* Nota los dos valores extremos deben ser rescatados de algun parametro del sistema */

 if (repro <> -1) then
    begin
      /* VACIA */
     if ((repro = 0) and (dias_gestacion <>0)) then
        begin
          result = 'W';
          mensaje = 'Los días de gestación ingresada, no se encuentran en el rango permitido';
          error = 1;
          suspend;
        end
       /* PREÑADA */
      if ((repro = 1) and (dias_gestacion <> 0))then
        begin
          select rpe.valor from sys_juego_parametros sjp join rel_parametros_establecimiento rpe on (sjp.id_parametro = rpe.parametro)
          where (rpe.establecimiento = :esta) and (sjp.nombre = 'MEDIASGES')
          into AuxValor;

          if ((dias_gestacion < AuxValor) or (dias_gestacion > 300) )  then
            begin
              result = 'W';
              mensaje = 'Los días de gestación ingresada, no se encuentran en el rango permitido';
              error = 1;
              suspend;
            end
        end

      /* INTERVALO ENTRE INICIO Y FIN DE SERVICIO */
      DIAS_SERVICIO = FIN-INI;
      if ((DIAS_SERVICIO/30) > 4) then
      BEGIN
           RESULT='W';
           MENSAJE='El rango de dias de servicio es superior a los parametros normales';
           ERROR=1;
           SUSPEND;
      END


      /* PARA LA EDAD DEL ANIMAL */
      SELECT fecha_nacimiento
      FROM tab_animales ta
      WHERE (ta.id_animal = :animal)
      INTO :fecha;
      meses = (actual - fecha - dias_gestacion) /30; /*CALCULO LA EDAD en meses*/

      /* FECHA LIMITE INFERIOR DE ERROR PARA INGRESO A SERVICIO */
      select rpe.valor from sys_juego_parametros sjp join rel_parametros_establecimiento rpe on (sjp.id_parametro = rpe.parametro)
      where (rpe.establecimiento = :esta) and (sjp.nombre = 'MSEDADSER1')
      into :AuxValor;

      if (auxValor > meses) then
        begin
          result = 'W';
          mensaje = 'Este animal es demasiado joven para realizar un diagnostico de gestación. Verifique la edad';
          error = 1;
          suspend;
        end
    end

  --Busco el ultimo diag. de gestacion en los ultimos 5 meses
  select First 1 id_evento,fecha
  from eve_eventos
  where (tipo = 13) and (animal = :ANIMAL)
  order by fecha desc
  into :diagnostico,:fecha_ultima;

  if (fecha_ultima is not null) then
    begin
      dias = actual-fecha_ultima;
      if (dias < 150) then -- 5 meses
        begin
             --Me fijo se en el diag anterior dio preñada y ahora se esta cargando como vacia
             select estado_reproductivo, estado_aux
             from eve_diagnostico_gestacion
             where id_evento=:diagnostico
             into :er, :ea;

             if ((ea = 2 or er = 2) and Repro = 0) then
             begin
                  Result = 'W';
                  mensaje = 'El animal fue diagnosticado preñada el dia '||cast (Extract(day from fecha_ultima) as varchar(2))||'/'||cast(Extract(month from fecha_ultima) as varchar(2))||'/'||cast(Extract(year from fecha_ultima) as varchar(4));
                  suspend;
             end
        end
    end

  -- me fijo si tiene algun aborto dentro de los ultimos nueve meses
  eveAborto = null;
  select first 1 id_evento
  from eve_eventos
  where (animal = :animal) and (tipo = 1) and (fecha between :actual - (9*30) and :actual)
  into :eveAborto;

  if (eveAborto is not null) then
    begin
      Result = 'W';
      mensaje = 'El animal tiene registrado un aborto dentro de los ultimos nueve meses';
      suspend;
    end

  /* ME FIJO SI EL ANIMAL ESTA EN SERVICIO*/
  SELECT FIRST 1 TS.ID_SERVICIO FROM EVE_EVENTOS EE join EVE_INGRESO_SERVICIO EIS ON EE.ID_EVENTO=EIS.ID_EVENTO JOIN
         TAB_SERVICIOS TS ON EIS.SERVICIO=TS.ID_SERVICIO
  WHERE (EE.TIPO = 20) AND (EE.ANIMAL=:ANIMAL) AND (TS.ACTIVO='S') AND (EE.FECHA < :ACTUAL)
  INTO :SERVICIO;

/**//**/
   if (SERVICIO IS NOT NULL) then
   BEGIN
       SELECT EE.FECHA
       FROM EVE_EVENTOS EE join EVE_EGRESO_SERVICIO EES on EE.ID_EVENTO=EES.ID_EVENTO join
            TAB_SERVICIOS TS on EES.SERVICIO=TS.ID_SERVICIO
       WHERE EE.TIPO = 15 AND EE.ANIMAL=:ANIMAL AND TS.ID_SERVICIO=:SERVICIO
       INTO :FECHAEGRESOSERVICIO;

       if (FECHAEGRESOSERVICIO IS NULL) then
       BEGIN
          RESULT = 'W';
          MENSAJE = 'El Animal se Encuentra en Servicio, su Estado Reproductivo no se Modificara hasta que el Servicio se Cierre';
          suspend;
       END
       ELSE
           if (FECHAEGRESOSERVICIO > :ACTUAL) then
             BEGIN
                 RESULT = 'W';
                 MENSAJE = 'El Animal se Encuentra en Servicio, su Estado Reproductivo no se Modificara hasta que el Servicio se Cierre';
                 suspend;
             END
   END
/**//**/

  if (SERVICIO IS NOT NULL) then
  BEGIN
      RESULT = 'W';
      MENSAJE = 'El Animal se Encuentra en Servicio, su Estado Reproductivo no se Modificara hasta que el Servicio se Cierre';
      suspend;
  END

  /*ME FIJO SI EL ANIMAL TUVO UN PARTO*/
  SELECT CAST(VALOR AS INTEGER)
  FROM REL_PARAMETROS_ESTABLECIMIENTO
  WHERE ESTABLECIMIENTO = :ESTA AND PARAMETRO = 35
  INTO :DPS;

  SELECT CAST(VALOR AS INTEGER)
  FROM REL_PARAMETROS_ESTABLECIMIENTO
  WHERE ESTABLECIMIENTO = :ESTA AND PARAMETRO = 40
  INTO :DTS;

  SELECT FIRST 1 FECHA
  FROM EVE_EVENTOS
  WHERE ANIMAL = :ANIMAL AND (TIPO = 39 OR TIPO = 24)
  ORDER BY FECHA DESC
  INTO :FECHA_PARTO;

 IF (FECHA_PARTO IS NOT NULL) THEN
  BEGIN
       FECHA_AUX = FECHA_PARTO+DTS+DPS;
       IF ((FECHA_PARTO+DTS+DPS) > ACTUAL) THEN
       BEGIN
            RESULT = 'E';
            MENSAJE = 'El Animal tiene registrado un parto el '||EXTRACT(DAY FROM FECHA_PARTO)||'/'||EXTRACT(MONTH FROM FECHA_PARTO)||'/'||EXTRACT(YEAR FROM FECHA_PARTO)
            ||' no se le podra realizar un diagnostico de gestacion hasta el '||EXTRACT(DAY FROM FECHA_AUX)||'/'||EXTRACT(MONTH FROM FECHA_AUX)||'/'||EXTRACT(YEAR FROM FECHA_AUX)
            ||' segun los parametros del establecimiento';
            SUSPEND;
       END
  END

  /*--------------*/

  if (error = 0) then
    begin
      result = 'A';
      mensaje = '';
      suspend;
    end
  -- fecha del evento
  for select result, mensaje from RN_FECHA_EVENTO(:animal, :actual, 13)
  into :result, :mensaje
    do if (result <> 'A') then
    suspend;

END ^

SET TERM ; ^

