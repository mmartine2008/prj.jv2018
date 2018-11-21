CREATE OR ALTER PROCEDURE SP_INGRESO_SERVICIO(
  FECHA DATE,
  ANIMAL INTEGER,
  OBSERVACION VARCHAR(255) CHARACTER SET NONE,
  ESTABLECIMIENTO INTEGER,
  RESPONSABLE INTEGER,
  LOG_USUARIO INTEGER,
  LOG_FECHA_MODIFICADO DATE,
  SERVICIO INTEGER,
  ID_GRUPO INTEGER,
  CONDICION_CORPORAL INTEGER,
  ID_POTRERO INTEGER)
AS
DECLARE VARIABLE FECHA_FIN DATE;
DECLARE VARIABLE TIPOEVE INTEGER;
DECLARE VARIABLE IDNUEVOEVENTO INTEGER;
DECLARE VARIABLE AUXANIMAL INTEGER;
DECLARE VARIABLE COMENTARIO VARCHAR(50);
DECLARE VARIABLE ERANT INTEGER;
DECLARE VARIABLE TIPO_SERVICIO INTEGER;
DECLARE VARIABLE CANTIDADEVENTOSPOSTERIORES INTEGER;
DECLARE VARIABLE AUX INTEGER;
BEGIN
    -- recupero que tipo de servicio
    select tipo, FECHA_FIN_ESTIMADA from tab_servicios where (id_servicio = :servicio)
    into :tipo_servicio, :FECHA_FIN;
    
    IF (FECHA BETWEEN FECHA_FIN AND FECHA_FIN+30) THEN
       UPDATE TAB_SERVICIOS SET FECHA_FIN = :FECHA, FECHA_FIN_ESTIMADA = :FECHA WHERE ID_SERVICIO = :SERVICIO;

    TIPOEVE = 20;
    SELECT ID_EVENTO FROM SP_CREACION_EVE_EVENTOS(:FECHA,:ANIMAL,null,:OBSERVACION,:TIPOEVE,:ESTABLECIMIENTO,:RESPONSABLE,
    :LOG_USUARIO,:LOG_FECHA_MODIFICADO)
    INTO :IDNUEVOEVENTO;

   /*crea ingreso a Servicio*/
   insert into EVE_INGRESO_SERVICIO
   (ID_EVENTO,SERVICIO)
   values
   (:IDNUEVOEVENTO,:SERVICIO);

    /*EVENTO CAMBIO DE UBICACION*/
      COMENTARIO = 'Evento CU disparado por Ingreso Hembra a Servicio';
      select * FROM SP_CAMBIO_UBICACION (:ID_POTRERO, NULL, NULL, :FECHA, :ANIMAL, :COMENTARIO,
                                             :ESTABLECIMIENTO, :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO, :IDNUEVOEVENTO) into aux;

    /*EVENTO CONDICION CORPORAL*/
      COMENTARIO = 'Evento CC disparado por Ingreso Hembra a Servicio';
      if (CONDICION_CORPORAL is Not Null) then
      EXECUTE PROCEDURE SP_CONDICION_CORPORAL(:CONDICION_CORPORAL, :FECHA, :ANIMAL, :COMENTARIO,:ESTABLECIMIENTO,
                                              :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO, :IDNUEVOEVENTO, NULL);

   /*cambio el estado Reproductivo de la Hembra*/
   select cantidad from gen_cambio_estado_reproductivo(:animal, :fecha)
   into :cantidadEventosPosteriores;
   if (cantidadEventosPosteriores = 0) then
     begin
       if (tipo_servicio = 1) then  -- servicio natural
         begin
           UPDATE TAB_ANIMALES SET ESTADO_REPRODUCTIVO = 3, ESTADO_ACTUAL = 'En Servicio' WHERE (ID_ANIMAL = :ANIMAL); -- en servicio
           UPDATE eve_ingreso_servicio SET ESTADO_REPRODUCTIVO = 3 WHERE (ID_evento  = :IDNUEVOEVENTO); 
         end
       else
         begin                       -- servicio corral
           UPDATE TAB_ANIMALES SET ESTADO_REPRODUCTIVO = 5, ESTADO_ACTUAL = 'Servida' WHERE (ID_ANIMAL = :ANIMAL); -- servida
           UPDATE eve_ingreso_servicio SET ESTADO_REPRODUCTIVO = 5 WHERE (ID_evento  = :IDNUEVOEVENTO); 
         end
     end

   -- guardo el valor por un supuesto borrado de eventos
   if (tipo_servicio = 1) then  -- servicio natural
     UPDATE eve_ingreso_servicio SET ESTADO_REPRODUCTIVO = 3 WHERE (ID_evento  = :IDNUEVOEVENTO);
   else
     UPDATE eve_ingreso_servicio SET ESTADO_REPRODUCTIVO = 5 WHERE (ID_evento  = :IDNUEVOEVENTO);

    /*genera le relación N-N*/

   select ANIMAL from REL_PERTENECE_GRUPO where (ANIMAL = :ANIMAL)and(GRUPO = :ID_GRUPO)AND(ESTABLECIMIENTO = :ESTABLECIMIENTO )
          into :AUXANIMAL;

   if (AUXANIMAL is not null)then
   begin
       UPDATE REL_PERTENECE_GRUPO
        SET GRUPO = :ID_GRUPO,
           ACTIVO = 'S'
       WHERE(GRUPO = :ID_GRUPO) AND (ESTABLECIMIENTO = :ESTABLECIMIENTO ) AND (ANIMAL = :ANIMAL);
   end
   else
     insert into REL_PERTENECE_GRUPO (GRUPO, ANIMAL, ESTABLECIMIENTO, ACTIVO)
       values   (:ID_GRUPO, :ANIMAL, :ESTABLECIMIENTO, 'S');
   SUSPEND;

END