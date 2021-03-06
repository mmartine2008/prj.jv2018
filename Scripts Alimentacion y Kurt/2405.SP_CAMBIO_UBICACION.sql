SET TERM ^ ;

CREATE OR ALTER PROCEDURE SP_CAMBIO_UBICACION(
  ID_POTRERO INTEGER,
  ID_RODEO INTEGER,
  ID_GRUPO INTEGER,
  FECHA DATE,
  ANIMAL INTEGER,
  OBSERVACION VARCHAR(255) CHARACTER SET NONE,
  ESTABLECIMIENTO INTEGER,
  RESPONSABLE INTEGER,
  LOG_USUARIO INTEGER,
  LOG_FECHA_MODIFICADO DATE,
  DISPARADOR INTEGER)
RETURNS(
  IDNUEVOEVENTO INTEGER)
AS
DECLARE VARIABLE TIPOEVE INTEGER;
DECLARE VARIABLE ROD INTEGER;
DECLARE VARIABLE POT INTEGER;
DECLARE VARIABLE CANTIDADEVENTOSPOSTERIORES INTEGER;
DECLARE VARIABLE ROD_MADRE INTEGER;
DECLARE VARIABLE POT_MADRE INTEGER;
DECLARE VARIABLE FECHA_MIN DATE;
DECLARE VARIABLE PRUEBA INTEGER;
Begin
  TIPOEVE = 5;


  /* REGISTRO EL EVENTO EN EVE_EVENTOS */
  SELECT ID_EVENTO FROM SP_CREACION_EVE_EVENTOS(:FECHA, :ANIMAL, :DISPARADOR, :OBSERVACION, :TIPOEVE, :ESTABLECIMIENTO,
  :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO)
  INTO :IDNUEVOEVENTO;
  

  /*SI EL RODEO ES NULO PONGO EL QUE TENIA EL ANIMAL*/
  SELECT RODEO FROM TAB_ANIMALES WHERE (ID_ANIMAL = :ANIMAL)
  INTO :ROD_MADRE;
  if (id_rodeo is null) then
     ROD = ROD_MADRE;
  ELSE
    ROD = ID_RODEO;

  /*SI EL POTRERO ES NULO PONGO EL QUE TENIA EL ANIMAL*/
  SELECT POTRERO FROM TAB_ANIMALES WHERE (ID_ANIMAL = :ANIMAL)
  INTO :POT_MADRE;
  if (ID_POTRERO is null) then
     POT = POT_MADRE;
  ELSE
    POT = ID_POTRERO;

  /* REGISTRO EL EVENTO EN EVE_CAMBIO_UBICACION */
   INSERT INTO EVE_CAMBIO_UBICACION
     (ID_EVENTO, ESTABLECIMIENTO, RODEO, POTRERO)
   VALUES
     (:IDNUEVOEVENTO, :ESTABLECIMIENTO, :ROD, :POT);
     
   

     -- para saber si tiene que actualizar los datos actuales del animal me fijo si es el evento mas nuevo
  select count(*) from eve_eventos where (tipo = :TIPOEVE) and (fecha > :fecha) and (animal = :animal)
  into :cantidadEventosPosteriores;

  if (cantidadEventosPosteriores = 0) then
    begin
      /* ACTUALIZO LOS VALORES EN TAB_ANIMALES */
  if (id_rodeo is not null) then
        begin
          UPDATE TAB_ANIMALES
          SET rodeo = :ID_rodeo
          WHERE (ID_ANIMAL = :ANIMAL);
        end
      if (id_Potrero is not null) then
        begin
          UPDATE TAB_ANIMALES
          SET potrero = :ID_Potrero
          WHERE (ID_ANIMAL = :ANIMAL);
        end
    end

   EXECUTE PROCEDURE Gen_Agregar_En_Grupo (:ESTABLECIMIENTO ,:IDNUEVOEVENTO ,:ID_GRUPO );
   
   if (not(id_potrero=pot_madre and id_rodeo=rod_madre)) then
   begin
        FECHA_MIN = FECHA-210;
        EXECUTE PROCEDURE SP_CAMBIO_UBICACION_HIJOS (:ANIMAL,:ESTABLECIMIENTO,:POT_MADRE,:ROD_MADRE,
        :POT,:ROD,:RESPONSABLE,:FECHA,'Evento Cambio de Ubicacion disparado por Cambio de Ubicacion de la madre',
        :LOG_USUARIO,:LOG_FECHA_MODIFICADO,:IDNUEVOEVENTO,:FECHA_MIN);
   end
   suspend;
END ^

SET TERM ; ^ 

