SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_CIERRE_LOTE_ALIMENTACION(
  POTRERO INTEGER,
  RODEO INTEGER,
  ESTABLECIMIENTO INTEGER,
  FECHA_INI DATE,
  FECHA_FIN DATE)
RETURNS(
  RACION INTEGER,
  CANT_ANIMALES INTEGER,
  NOMBRE VARCHAR(100) CHARACTER SET NONE,
  PORC_MS DECIMAL(18, 2),
  KL_MS DECIMAL(18, 2),
  PRECIO DECIMAL(18, 2),
  FECHA_INGRESO DATE,
  CONSUMO_TC DECIMAL(18, 2),
  COSTO DECIMAL(18, 2),
  PORC_USADO DECIMAL(18, 2),
  CANT_DIAS INTEGER,
  NOMBRE_RACION VARCHAR(100) CHARACTER SET NONE)
AS
DECLARE VARIABLE ANIMAL INTEGER;
DECLARE VARIABLE RACION_AUX DATE;
DECLARE VARIABLE FECHA_X DATE;
DECLARE VARIABLE MAX_PESO FLOAT;
DECLARE VARIABLE SUPLEMENTO INTEGER;
DECLARE VARIABLE CONSUMO FLOAT;
DECLARE VARIABLE CONSUMO_AUX FLOAT;
DECLARE VARIABLE PORC_PROM FLOAT;
DECLARE VARIABLE PORC FLOAT;
DECLARE VARIABLE MS FLOAT;
BEGIN
     FECHA_X = NULL;
     IF (RODEO IS NULL) THEN
     BEGIN
     FOR SELECT COUNT(*), SUM(ES.CANT_RACION), ES.TIPO_SUPLEMENTACION, EE.FECHA FROM EVE_SUPLEMENTACION ES JOIN EVE_EVENTOS EE ON ES.ID_EVENTO = EE.ID_EVENTO
         JOIN TAB_ANIMALES TA ON EE.ANIMAL = TA.ID_ANIMAL WHERE TA.POTRERO = :POTRERO AND TA.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.TIPO = 45
         AND EE.FECHA BETWEEN :FECHA_INI AND :FECHA_FIN 
         GROUP BY ES.TIPO_SUPLEMENTACION, EE.FECHA
         INTO :CANT_ANIMALES, :CONSUMO, :RACION, :FECHA_INGRESO
     DO
       BEGIN
            PORC_PROM = 0;
            MS = 0;
            PORC = 0;
            FOR SELECT RRS.PORCENTAJE, CTS.PORC_MS FROM REL_RACION_SUPLEMENTO RRS
                JOIN COD_TIPOS_SUPLEMENTACIONES CTS ON RRS.ID_SUPLEMENTO = CTS.ID_TIPO_SUPLEMENTACION WHERE
                 RRS.ID_RACION = :RACION INTO :PORC, :MS
            DO
            BEGIN
                     PORC_PROM = PORC_PROM + (PORC * MS);
            END

            PORC_PROM = PORC_PROM / 100;
            
            SELECT NOMBRE FROM TAB_RACION WHERE ID_RACION = :RACION INTO :NOMBRE_RACION;
            
            FOR SELECT RRS.PRECIO, CTS.NOMBRE, CTS.PORC_MS, RRS.PORCENTAJE
                FROM REL_RACION_SUPLEMENTO RRS JOIN COD_TIPOS_SUPLEMENTACIONES CTS ON RRS.ID_SUPLEMENTO = CTS.ID_TIPO_SUPLEMENTACION
                WHERE RRS.ID_RACION = :RACION
                INTO :PRECIO, :NOMBRE, :PORC_MS, :PORC_USADO
            DO
            BEGIN
                 KL_MS = (CONSUMO * PORC_USADO) / 100;
                 CONSUMO_AUX = (CONSUMO * PORC_USADO) / 100;
                 CONSUMO_TC = (CONSUMO_AUX * 100) / PORC_PROM;
                 COSTO = (CONSUMO_TC * PRECIO) / 1000;
                 SUSPEND;
            END
       END
     END
     ELSE
     BEGIN
     FOR SELECT COUNT(*), SUM(ES.CANT_RACION), ES.TIPO_SUPLEMENTACION, EE.FECHA FROM EVE_SUPLEMENTACION ES JOIN EVE_EVENTOS EE ON ES.ID_EVENTO = EE.ID_EVENTO
         JOIN TAB_ANIMALES TA ON EE.ANIMAL = TA.ID_ANIMAL WHERE TA.RODEO = :RODEO AND TA.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.TIPO = 45
         AND EE.FECHA BETWEEN :FECHA_INI AND :FECHA_FIN 
         GROUP BY ES.TIPO_SUPLEMENTACION, EE.FECHA
         INTO :CANT_ANIMALES, :CONSUMO, :RACION, :FECHA_INGRESO
     DO
       BEGIN
            PORC_PROM = 0;
            MS = 0;
            PORC = 0;
            FOR SELECT RRS.PORCENTAJE, CTS.PORC_MS FROM REL_RACION_SUPLEMENTO RRS
                JOIN COD_TIPOS_SUPLEMENTACIONES CTS ON RRS.ID_SUPLEMENTO = CTS.ID_TIPO_SUPLEMENTACION WHERE
                 RRS.ID_RACION = :RACION INTO :PORC, :MS
            DO
            BEGIN
                     PORC_PROM = PORC_PROM + (PORC * MS);
            END

            PORC_PROM = PORC_PROM / 100;
       
            SELECT NOMBRE FROM TAB_RACION WHERE ID_RACION = :RACION INTO :NOMBRE_RACION;
            FOR SELECT RRS.PRECIO, CTS.NOMBRE, CTS.PORC_MS, RRS.PORCENTAJE
                FROM REL_RACION_SUPLEMENTO RRS JOIN COD_TIPOS_SUPLEMENTACIONES CTS ON RRS.ID_SUPLEMENTO = CTS.ID_TIPO_SUPLEMENTACION
                WHERE RRS.ID_RACION = :RACION
                INTO :PRECIO, :NOMBRE, :PORC_MS, :PORC_USADO
            DO
            BEGIN
                 KL_MS = (CONSUMO * PORC_USADO) / 100;
                 CONSUMO_AUX = (CONSUMO * PORC_USADO) / 100;
                 CONSUMO_TC = (CONSUMO_AUX * 100) / PORC_PROM;
                 COSTO = (CONSUMO_TC * PRECIO) / 1000;
                 SUSPEND;
            END
       END
     END
END ^

SET TERM ; ^
