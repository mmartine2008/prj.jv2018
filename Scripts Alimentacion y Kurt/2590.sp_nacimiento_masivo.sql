SET TERM ^ ;

CREATE OR ALTER PROCEDURE SP_NACIMIENTO_MASIVO(
  ANIMAL INTEGER,
  FECHA DATE,
  OBSERVACION VARCHAR(255) CHARACTER SET NONE,
  ESTABLECIMIENTO INTEGER,
  RESPONSABLE INTEGER,
  LOG_USUARIO INTEGER,
  LOG_FECHA_MODIFICADO DATE,
  POTRERO INTEGER,
  RODEO INTEGER,
  SEXO INTEGER,
  MADRE INTEGER,
  PESO INTEGER,
  RAZA INTEGER,
  VIVO VARCHAR(1) CHARACTER SET NONE,
  NOMBRE VARCHAR(100) CHARACTER SET NONE,
  RP VARCHAR(10) CHARACTER SET NONE,
  SEN VARCHAR(9) CHARACTER SET NONE,
  PC VARCHAR(10) CHARACTER SET NONE,
  HBA VARCHAR(10) CHARACTER SET NONE,
  RA VARCHAR(10) CHARACTER SET NONE,
  OTRO VARCHAR(10) CHARACTER SET NONE,
  ID_GRUPO INTEGER,
  GRUPO_PARTO INTEGER,
  IE VARCHAR(64) CHARACTER SET NONE,
  COLOR INTEGER)
AS
DECLARE VARIABLE CAT INTEGER;
DECLARE VARIABLE TIPOEVE INTEGER;
DECLARE VARIABLE ID_EVENTO INTEGER;
DECLARE VARIABLE AUX INTEGER;
BEGIN

  if (SEXO = 1) then --SI ES MACHO ENTONCES LA CATEGORIA ES
     CAT=1;          --TERNERO
  ELSE               --SINO
      CAT=4;         --TERNERA

  INSERT INTO TAB_ANIMALES (ID_ANIMAL,ID_RP,NOMBRE,ESTABLECIMIENTO,FECHA_NACIMIENTO,SEXO,CRONOLOGIA_DENTARIA,GDR,ESTADO_REPRODUCTIVO,
  RECHAZADO,RAZA,CATEGORIA,POTRERO,RODEO,ACTIVO,MADRE_BIOLOGICA_INTERNA, ESTADO_ACTUAL, COLOR)
  VALUES (:ANIMAL,:RP,:NOMBRE,:ESTABLECIMIENTO, :FECHA,:SEXO,0,0,0,'N',:RAZA,:CAT,:POTRERO,:RODEO,:VIVO,:MADRE,'Activo/a', :COLOR);

  TIPOEVE = 23; -- NACIMIENTO

  -- REGISTRO EL EVENTO EN EVE_EVENTOS
  SELECT ID_EVENTO FROM SP_CREACION_EVE_EVENTOS(:FECHA, :ANIMAL, null, :OBSERVACION, :TIPOEVE, :ESTABLECIMIENTO,
  :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO)
  INTO :ID_EVENTO;

  -- REGISTRO EL EVENTO EN EVE_nacimiento
  INSERT INTO EVE_NACIMIENTO (ID_EVENTO, VIVO, GRUPO) VALUES (:ID_EVENTO, :VIVO, :GRUPO_PARTO);

  if (peso <> 0) then -- registro el peso
    EXECUTE PROCEDURE SP_Peso (:FECHA, :animal, 'Evento Peso disparado por nacimiento', :ESTABLECIMIENTO, :responsable, :log_usuario,
    :LOG_FECHA_MODIFICADO, 'N', :peso, null, :ID_EVENTO);
  else  --si no registro el peso agrego una alarma en la agenda
    if (vivo = 'S') then
      execute procedure ala_pesar_nacidos(:fecha, :establecimiento, :id_evento, null);

  if (RP <> 'N/N') then -- registro la identificacion con identificadores + nombre = rp  + apodo = rp
    EXECUTE PROCEDURE SP_IDENTIFICACION (:FECHA, :ANIMAL, 'Evento Identificacion disparado por nacimiento', :ESTABLECIMIENTO, :RESPONSABLE,
    :LOG_USUARIO, :LOG_FECHA_MODIFICADO, null, :RP, :SEN, :PC, :HBA, :RA, :OTRO, :NOMBRE, :RP, :id_evento,'I', :IE);
  else -- si no identifico el animal disparo una alarma en la agenda
    if (vivo = 'S') then
      execute procedure ala_identificar_nacidos(:fecha, :establecimiento, :id_evento, null);

  -- registro evento cambio ubicacion
  if ((potrero is not null) or (rodeo is not null)) then
    select * from  SP_cambio_ubicacion(:potrero, :rodeo, null, :fecha, :animal, 'Evento CU disparado por nacimiento', :establecimiento,
                     :responsable, :log_usuario, :log_fecha_modificado, :ID_EVENTO) into aux;

/*
  EXECUTE PROCEDURE sp_actividad(:FECHA, :ANIMAL,'EVENTO ACTIVIDAD DISPARADO POR NACIMIENTO DE ANIMAL', :ESTABLECIMIENTO,
          :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO, 0, null, :ID_EVENTO, 0, 0, null, null);
*/
  update tab_animales ta set ta.actividad = 0, ta.subcategoria = 0 where ta.id_animal = :animal and ta.establecimiento = :establecimiento;
  -- registro la alarma para la primer vacunacion de brucelosis para dentro de 8 meses
  if (vivo = 'S') then
    execute procedure ala_vacunacion_brucelosis(:fecha, :establecimiento, :id_evento, null);


  if (id_grupo is not null) then
     EXECUTE PROCEDURE Gen_Agregar_En_Grupo(:ESTABLECIMIENTO,:ID_EVENTO,:ID_GRUPO);

  SUSPEND;
END ^ 

SET TERM ; ^

