SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_CIERRE_LOTE_SALIDAS(
  POTRERO INTEGER,
  RODEO INTEGER,
  ESTABLECIMIENTO INTEGER,
  FECHA_INI DATE,
  FECHA_FIN DATE)
RETURNS(
  FECHA_BAJA DATE,
  CANT_ANIMALES INTEGER,
  PESO_SALIDA FLOAT,
  PESO FLOAT,
  PESO_DESTINO FLOAT,
  TIPO INTEGER,
  TIPO_SALIDA VARCHAR(60) CHARACTER SET NONE)
AS
DECLARE VARIABLE ANIMAL INTEGER;
DECLARE VARIABLE FECHA_AUX DATE;
DECLARE VARIABLE FECHA_X DATE;
DECLARE VARIABLE MAX_PESO FLOAT;
DECLARE VARIABLE AUX_PESO FLOAT;
DECLARE VARIABLE PESO_DEST FLOAT;
DECLARE VARIABLE TIPO_AUX INTEGER;
DECLARE VARIABLE AUX INTEGER;
DECLARE VARIABLE FECHA_CAMBIO DATE;
DECLARE VARIABLE FECHA_CAMBIO_AUX DATE;
DECLARE VARIABLE CANT_CAMBIO INTEGER;
DECLARE VARIABLE PESO_CAMBIO FLOAT;
DECLARE VARIABLE ENTRO INTEGER;
DECLARE VARIABLE AUX_FECHA DATE;
DECLARE VARIABLE FECHA_FIN_AUX DATE;
DECLARE VARIABLE FECHA_AUXILIAR_ANTERIOR DATE;
BEGIN
     FECHA_AUX = NULL;
     FECHA_CAMBIO_AUX = NULL;
     PESO_SALIDA = 0;
     PESO_CAMBIO = 0;
     CANT_CAMBIO = 0;
     aux_peso = NULL;
     IF (RODEO IS NULL) THEN
     BEGIN
     
     FECHA_FIN_AUX = FECHA_FIN - 1;

     SELECT count(*),AVG(peso),sum(peso) from GET_EXISTENCIA_POTRERO_FECHA(:potrero,:FECHA_FIN_AUX) into :cant_animales,:peso,:peso_salida;
     FECHA_BAJA = :FECHA_FIN;
     IF(PESO > 0)THEN
       begin
         TIPO_SALIDA = 'EXISTENCIA FINAL';
         peso_destino = peso;
         tipo = 0;
         SUSPEND;
       end

     
     AUX_FECHA = FECHA_INI + 1;
     FOR SELECT EE.FECHA, TA.ID_ANIMAL FROM EVE_CAMBIO_UBICACION ECU JOIN EVE_EVENTOS EE ON ECU.ID_EVENTO = EE.ID_EVENTO JOIN TAB_ANIMALES TA ON EE.ANIMAL = TA.ID_ANIMAL
     WHERE EE.POTRERO = :POTRERO AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND ECU.POTRERO <> EE.POTRERO AND EE.FECHA BETWEEN :AUX_FECHA AND :FECHA_FIN_AUX
     ORDER BY EE.FECHA ASC
     INTO :FECHA_BAJA, :ANIMAL
     DO
     BEGIN
          ENTRO = 0;
          SELECT FIRST 1 EP.PESO FROM EVE_PESO EP JOIN EVE_EVENTOS EE ON EP.ID_EVENTO = EE.ID_EVENTO
          WHERE EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.ANIMAL = :ANIMAL AND EE.FECHA <= :FECHA_BAJA
          ORDER BY EE.FECHA DESC INTO :MAX_PESO;

          IF((FECHA_CAMBIO_AUX IS NULL))THEN
            BEGIN
              PESO_CAMBIO = PESO_CAMBIO + MAX_PESO;
              FECHA_CAMBIO_AUX = FECHA_BAJA;
              CANT_CAMBIO = CANT_CAMBIO + 1;
            END
          ELSE
            IF(FECHA_BAJA = FECHA_CAMBIO_AUX)THEN
              BEGIN
                 PESO_CAMBIO = PESO_CAMBIO + MAX_PESO;
                 FECHA_CAMBIO_AUX = FECHA_BAJA;
                 CANT_CAMBIO = CANT_CAMBIO + 1;
              END
            ELSE
              BEGIN
                 ENTRO = 1;
                 PESO = PESO_CAMBIO / CANT_CAMBIO;
                 PESO_DESTINO = PESO_CAMBIO / CANT_CAMBIO;
                 PESO_SALIDA = PESO_DESTINO * CANT_CAMBIO;
                 CANT_ANIMALES = CANT_CAMBIO;
                 TIPO_SALIDA = 'CAMBIO UBICACI�N';
                 FECHA_BAJA = FECHA_CAMBIO_AUX;
                 SUSPEND;
                 PESO_CAMBIO = 0;
                 CANT_CAMBIO = 0;
                 FECHA_CAMBIO_AUX = NULL;
                 PESO_CAMBIO = PESO_CAMBIO + MAX_PESO;
                 CANT_CAMBIO = CANT_CAMBIO + 1;
              END
     END

     IF(ENTRO = 0)THEN
       BEGIN
         ENTRO = 1;
         PESO_DESTINO = PESO_CAMBIO / CANT_CAMBIO;
         PESO_SALIDA = PESO_DESTINO * CANT_CAMBIO;
         CANT_ANIMALES = CANT_CAMBIO;
         TIPO_SALIDA = 'CAMBIO UBICACI�N';
         SUSPEND;
       END


     peso_destino = 0;
     PESO_SALIDA = 0;

     FOR SELECT EE.FECHA, TA.ID_ANIMAL, EB.PESODESTINO, EB.TIPO FROM EVE_BAJA EB JOIN EVE_EVENTOS EE ON EB.ID_EVENTO = EE.ID_EVENTO JOIN TAB_ANIMALES TA ON EE.ANIMAL = TA.ID_ANIMAL
         WHERE ee.POTRERO = :POTRERO AND TA.ESTABLECIMIENTO = :ESTABLECIMIENTO  AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.FECHA BETWEEN :AUX_FECHA AND :FECHA_FIN_AUX
         ORDER BY EE.FECHA ASC
         INTO :FECHA_BAJA, :ANIMAL, :PESO_DEST, :TIPO_AUX
     DO
       BEGIN

          ENTRO = 0;

          SELECT FIRST 1 EP.PESO FROM EVE_PESO EP JOIN EVE_EVENTOS EE ON EP.ID_EVENTO = EE.ID_EVENTO
          WHERE EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.ANIMAL = :ANIMAL AND EE.FECHA BETWEEN :FECHA_INI AND :FECHA_FIN
          ORDER BY EE.FECHA DESC INTO :MAX_PESO;

          IF (FECHA_AUX IS NULL) THEN
          BEGIN
               IF (AUX_PESO IS NULL) THEN
                 BEGIN
                    AUX_PESO = MAX_PESO;
                    PESO = MAX_PESO;
                    PESO_DESTINO = PESO_DEST;
                 END
               FECHA_AUX = FECHA_BAJA;
               CANT_ANIMALES = 0;
               TIPO = TIPO_AUX;
               SELECT NOMBRE FROM COD_TIPOS_BAJA WHERE ID_TIPO_BAJA = :TIPO_AUX INTO :TIPO_SALIDA;
          END
          ELSE
          BEGIN
               IF (FECHA_AUX <> FECHA_BAJA) THEN
               BEGIN
                    FECHA_X = FECHA_BAJA;
                    FECHA_BAJA = FECHA_AUX;
                    PESO = PESO_SALIDA / CANT_ANIMALES;
                    ENTRO = 1;
                    SUSPEND;
                    SELECT NOMBRE FROM COD_TIPOS_BAJA WHERE ID_TIPO_BAJA = :TIPO_AUX INTO :TIPO_SALIDA;
                    TIPO = TIPO_AUX;
                    PESO_DESTINO = PESO_DEST;
                    AUX_PESO = MAX_PESO;
                    PESO_SALIDA = 0;
                    FECHA_BAJA = FECHA_X;
                    FECHA_AUX = FECHA_BAJA;
                    CANT_ANIMALES = 0;
               END
          END

          PESO_SALIDA = PESO_SALIDA + MAX_PESO;

          CANT_ANIMALES = CANT_ANIMALES + 1;
       END
       PESO_DESTINO = PESO_DEST;
     if(cant_animales > 0)then
       PESO = PESO_SALIDA / CANT_ANIMALES;
     else
       peso = 0;
     END
     ELSE
     BEGIN
     FOR SELECT EE.FECHA, TA.ID_ANIMAL, EB.PESODESTINO, EB.TIPO FROM EVE_BAJA EB JOIN EVE_EVENTOS EE ON EB.ID_EVENTO = EE.ID_EVENTO JOIN TAB_ANIMALES TA ON EE.ANIMAL = TA.ID_ANIMAL
         WHERE TA.RODEO = :RODEO AND TA.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.TIPO = 3 AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.FECHA BETWEEN :FECHA_INI AND :FECHA_FIN
         AND TA.CATEGORIA IN (select id_animal_externo from aux_animales_externos) ORDER BY EE.FECHA ASC
         INTO :FECHA_BAJA, :ANIMAL, :PESO_DEST, :TIPO_AUX
     DO
       BEGIN

          SELECT FIRST 1 EP.PESO FROM EVE_PESO EP JOIN EVE_EVENTOS EE ON EP.ID_EVENTO = EE.ID_EVENTO
          WHERE EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.ANIMAL = :ANIMAL AND EE.FECHA BETWEEN :FECHA_INI AND :FECHA_FIN
          ORDER BY EE.FECHA DESC INTO :MAX_PESO;

          IF (FECHA_AUX IS NULL) THEN
          BEGIN
               IF (AUX_PESO IS NULL) THEN
                 BEGIN
                    AUX_PESO = MAX_PESO;
                    PESO = MAX_PESO;
                    PESO_DESTINO = PESO_DEST;
                 END
               FECHA_AUX = FECHA_BAJA;
               CANT_ANIMALES = 0;
               TIPO = TIPO_AUX;
          END
          ELSE
          BEGIN
               IF (FECHA_AUX <> FECHA_BAJA) THEN
               BEGIN
                    FECHA_X = FECHA_BAJA;
                    FECHA_BAJA = FECHA_AUX;
                    PESO = PESO_SALIDA / CANT_ANIMALES;
                    SUSPEND;
                    TIPO = TIPO_AUX;
                    PESO_DESTINO = PESO_DEST;
                    AUX_PESO = MAX_PESO;
                    PESO_SALIDA = 0;
                    FECHA_BAJA = FECHA_X;
                    FECHA_AUX = FECHA_BAJA;
                    CANT_ANIMALES = 0;
               END
          END

          PESO_SALIDA = PESO_SALIDA + MAX_PESO;

          CANT_ANIMALES = CANT_ANIMALES + 1;
       END
       PESO_DESTINO = PESO_DEST;
     PESO = PESO_SALIDA / CANT_ANIMALES;
     END

     IF(ENTRO = 0)THEN
     SUSPEND;
END ^ 

SET TERM ; ^
