SET TERM ^ ;

CREATE OR ALTER PROCEDURE SP_CASTRACION(
  FECHA DATE,
  ANIMAL INTEGER,
  OBSERVACION VARCHAR(255) CHARACTER SET NONE,
  ESTABLECIMIENTO INTEGER,
  RESPONSABLE INTEGER,
  LOG_USUARIO INTEGER,
  LOG_FECHA_MODIFICADO DATE,
  ID_METODO_CASTRACION INTEGER,
  ID_GRUPO INTEGER,
  DISPARADOR INTEGER)
AS
DECLARE VARIABLE TIPOEVE INTEGER;
DECLARE VARIABLE IDNUEVOEVENTO INTEGER;
DECLARE VARIABLE CANTIDADEVENTOSPOSTERIORES INTEGER;
DECLARE VARIABLE HOY DATE;
BEGIN
    HOY = CAST ('TODAY' AS DATE);
    TIPOEVE = 7;
    SELECT ID_EVENTO FROM SP_CREACION_EVE_EVENTOS(:FECHA,:ANIMAL, :DISPARADOR, :OBSERVACION,:TIPOEVE,:ESTABLECIMIENTO,:RESPONSABLE,
    :LOG_USUARIO,:LOG_FECHA_MODIFICADO)
    INTO :IDNUEVOEVENTO;

   insert into EVE_CASTRACION
     (ID_EVENTO, METODO_CASTRACION)
   values
     (:IDNUEVOEVENTO, :ID_METODO_CASTRACION);

   -- para saber si tiene que actualizar los datos actuales del animal me fijo si es el evento mas nuevo
   select count(*) from eve_eventos
   where (tipo = :TIPOEVE) and (fecha > :fecha) and (animal = :animal)
   into :cantidadEventosPosteriores;

   if (cantidadEventosPosteriores = 0) then
     begin
       UPDATE TAB_ANIMALES
         SET CATEGORIA = 2 /* Una vez castrado, se cambia la categoria del Macho a Novillo*/
         WHERE (ID_ANIMAL = :ANIMAL) and (((:HOY - fecha_nacimiento)/30) > 7);
     end

   EXECUTE PROCEDURE Gen_Agregar_En_Grupo (:ESTABLECIMIENTO ,:IDNUEVOEVENTO ,:ID_GRUPO );
   SUSPEND;
END ^

SET TERM ; ^

