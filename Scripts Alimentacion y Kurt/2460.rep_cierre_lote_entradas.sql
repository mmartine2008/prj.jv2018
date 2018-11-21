SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_CIERRE_LOTE_ENTRADAS(
  POTRERO INTEGER,
  RODEO INTEGER,
  ESTABLECIMIENTO INTEGER,
  FECHA_INI DATE,
  FECHA_FIN DATE)
RETURNS(
  FECHA_ALTA DATE,
  CANT_ANIMALES INTEGER,
  PESO_ENTRADA FLOAT,
  PESO FLOAT,
  TIPO VARCHAR(60) CHARACTER SET NONE)
AS
DECLARE VARIABLE ANIMAL INTEGER;
DECLARE VARIABLE FECHA_AUX DATE;
DECLARE VARIABLE FECHA_X DATE;
DECLARE VARIABLE MIN_PESO FLOAT;
DECLARE VARIABLE AUX_PESO FLOAT;
DECLARE VARIABLE FECH DATE;
DECLARE VARIABLE ID_EVENT INTEGER;
DECLARE VARIABLE DISPAR INTEGER;
DECLARE VARIABLE TIPO_EVENTO INTEGER;
DECLARE VARIABLE AUX_FECH DATE;
DECLARE VARIABLE AUX_FECH_FIN DATE;
DECLARE VARIABLE TIPO_ANTERIOR VARCHAR(60);
BEGIN
     FECHA_AUX = NULL;
     PESO_ENTRADA = 0;
     aux_peso = NULL;
     IF (RODEO IS NULL) THEN
     BEGIN

     fech = FECHA_INI;
     SELECT count(*),AVG(peso),sum(peso) from GET_EXISTENCIA_POTRERO_FECHA(:potrero,:fech) into :cant_animales,:peso,:peso_entrada;
     fecha_alta = :fech;
     IF(PESO > 0)THEN
       BEGIN
         TIPO = 'EXISTENCIA INICIAL';
         suspend;
       END


     PESO_ENTRADA = 0;
    tipo_anterior = null;
    aux_fech = FECHA_INI + 1;
    AUX_FECH_FIN = FECHA_FIN - 1;
     FOR SELECT EE.FECHA, TA.ID_ANIMAL, EE.ID_EVENTO FROM EVE_EVENTOS EE join EVE_CAMBIO_UBICACION ECU ON(EE.ID_EVENTO=ECU.ID_EVENTO) JOIN TAB_ANIMALES TA ON EE.ANIMAL = TA.ID_ANIMAL
         WHERE ECU.POTRERO = :POTRERO AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.FECHA BETWEEN :aux_fech AND :AUX_FECH_FIN
         ORDER BY EE.FECHA ASC
         INTO :FECHA_ALTA, :ANIMAL, :ID_EVENT
     DO
       BEGIN
            SELECT EE.DISPARADOR FROM EVE_EVENTOS EE WHERE EE.ID_EVENTO= :ID_EVENT INTO :DISPAR;
            if(tipo is not null)then
              tipo_anterior = tipo;
            
            tipo = NULL;
            IF(DISPAR IS NULL)THEN
              TIPO = 'CAMBIO UBICACIÓN';
            ELSE
               BEGIN
                 SELECT TIPO FROM EVE_EVENTOS WHERE ID_EVENTO = :DISPAR INTO :TIPO_EVENTO;
                 IF(TIPO_EVENTO = 23)THEN
                    TIPO = 'NACIMIENTO';
                 IF(TIPO_EVENTO = 2)THEN
                    BEGIN
                      SELECT NOMBRE FROM EVE_ALTA_DIRECTA EA JOIN COD_TIPOS_ALTA CA ON(EA.TIPO=CA.ID_TIPO_ALTA) WHERE EA.ID_EVENTO = :DISPAR INTO :TIPO;
                    END
               END

            SELECT FIRST 1 EP.PESO FROM EVE_PESO EP JOIN EVE_EVENTOS EE ON EP.ID_EVENTO = EE.ID_EVENTO
            WHERE EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.ANIMAL = :ANIMAL AND EE.FECHA <= :FECHA_ALTA--AND EE.FECHA BETWEEN :FECHA_INI AND :FECHA_FIN
            ORDER BY EE.FECHA DESC INTO :MIN_PESO;

            IF (FECHA_AUX IS NULL) THEN
            BEGIN
                 IF (AUX_PESO IS NULL) THEN
                 BEGIN
                    AUX_PESO = MIN_PESO;
                    PESO = MIN_PESO;
                 END
               FECHA_AUX = FECHA_ALTA;
               CANT_ANIMALES = 0;
            END
            ELSE
            BEGIN
               IF ((FECHA_AUX <> FECHA_ALTA)/* OR (AUX_PESO <> MIN_PESO)*/) THEN
               BEGIN
                    tipo = tipo_anterior;
                    FECHA_X = FECHA_ALTA;
                    FECHA_ALTA = FECHA_AUX;
                    PESO = PESO_ENTRADA / CANT_ANIMALES;
                    SUSPEND;
                    AUX_PESO = MIN_PESO;
                    PESO_ENTRADA = 0;
                    FECHA_ALTA = FECHA_X;
                    FECHA_AUX = FECHA_ALTA;
                    CANT_ANIMALES = 0;
               END
          END


          PESO_ENTRADA = PESO_ENTRADA + MIN_PESO;

          CANT_ANIMALES = CANT_ANIMALES + 1;
     END
     if(cant_animales > 0)then
       PESO = PESO_ENTRADA / CANT_ANIMALES;
     else
       peso = 0;
 END
    ELSE
    BEGIN
    FOR SELECT EE.FECHA, TA.ID_ANIMAL FROM EVE_EVENTOS EE JOIN TAB_ANIMALES TA ON EE.ANIMAL = TA.ID_ANIMAL
         WHERE TA.RODEO = :RODEO AND TA.ESTABLECIMIENTO = :ESTABLECIMIENTO AND (EE.TIPO = 2 OR EE.TIPO = 23) AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.FECHA BETWEEN :FECHA_INI AND :FECHA_FIN
         AND TA.CATEGORIA IN (select id_animal_externo from aux_animales_externos) ORDER BY EE.FECHA ASC
         INTO :FECHA_ALTA, :ANIMAL
     DO
       BEGIN
            SELECT FIRST 1 EP.PESO FROM EVE_PESO EP JOIN EVE_EVENTOS EE ON EP.ID_EVENTO = EE.ID_EVENTO
            WHERE EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.ANIMAL = :ANIMAL --AND EE.FECHA BETWEEN :FECHA_INI AND :FECHA_FIN
            ORDER BY EE.FECHA ASC INTO :MIN_PESO;

            IF (FECHA_AUX IS NULL) THEN
            BEGIN
                 IF (AUX_PESO IS NULL) THEN
                 BEGIN
                    AUX_PESO = MIN_PESO;
                    PESO = MIN_PESO;
                 END
               FECHA_AUX = FECHA_ALTA;
               CANT_ANIMALES = 0;
            END
            ELSE
            BEGIN
               IF ((FECHA_AUX <> FECHA_ALTA)/* OR (AUX_PESO <> MIN_PESO)*/) THEN
               BEGIN
                    FECHA_X = FECHA_ALTA;
                    FECHA_ALTA = FECHA_AUX;
                    PESO = PESO_ENTRADA / CANT_ANIMALES;
                    SUSPEND;
                    AUX_PESO = MIN_PESO;
                    PESO_ENTRADA = 0;
                    FECHA_ALTA = FECHA_X;
                    FECHA_AUX = FECHA_ALTA;
                    CANT_ANIMALES = 0;
               END
          END


          PESO_ENTRADA = PESO_ENTRADA + MIN_PESO;

          CANT_ANIMALES = CANT_ANIMALES + 1;
       END
     PESO = PESO_ENTRADA / CANT_ANIMALES;
 END
    SUSPEND;
END ^

SET TERM ; ^

