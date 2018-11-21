SET TERM ^ ;

CREATE OR ALTER PROCEDURE GET_DATOS_RACION(
  ID_EVENTO INTEGER)
RETURNS(
  ALIMENTO VARCHAR(50) CHARACTER SET NONE,
  KG_MS_AUX DECIMAL(18, 2),
  KG_TC_AUX DECIMAL(18, 2),
  PRECIO_AUX DECIMAL(18, 2),
  PORC_RACION DECIMAL(18, 2),
  PORC_MS DECIMAL(18, 2))
AS
DECLARE VARIABLE RACION INTEGER;
DECLARE VARIABLE KG_MS DECIMAL(18, 2);
DECLARE VARIABLE ID_ALIMENTO INTEGER;
DECLARE VARIABLE PRECIO_TON DECIMAL(18, 2);
DECLARE VARIABLE CANT INTEGER;
DECLARE VARIABLE PORC DECIMAL(18, 2);
DECLARE VARIABLE MS DECIMAL(18, 2);
DECLARE VARIABLE PORC_PROM_MS DECIMAL(18, 2);
BEGIN
     SELECT ES.CANT_RACION, ES.TIPO_SUPLEMENTACION
     FROM EVE_SUPLEMENTACION ES
     WHERE ES.ID_EVENTO = :ID_EVENTO INTO :KG_MS, :RACION;

     CANT = 0;
     KG_MS_AUX = 0;
     KG_TC_AUX = 0;
     PRECIO_AUX = 0;
     
     PORC_PROM_MS = 0;
     MS = 0;
     PORC = 0;
     
     FOR SELECT RRS.PORCENTAJE, CTS.PORC_MS FROM REL_RACION_SUPLEMENTO RRS
         JOIN COD_TIPOS_SUPLEMENTACIONES CTS ON RRS.ID_SUPLEMENTO = CTS.ID_TIPO_SUPLEMENTACION
         WHERE RRS.ID_RACION = :RACION INTO :PORC, :MS
     DO
     BEGIN
          PORC_PROM_MS = PORC_PROM_MS + (PORC * MS);
     END

     PORC_PROM_MS = PORC_PROM_MS / 100;
     
     --porc_prom_ms = porc;
     
     FOR SELECT ID_SUPLEMENTO, PORCENTAJE, PRECIO FROM REL_RACION_SUPLEMENTO WHERE ID_RACION = :RACION
         INTO :ID_ALIMENTO, :PORC_RACION, :PRECIO_TON
     DO
     BEGIN

          SELECT NOMBRE, PORC_MS FROM COD_TIPOS_SUPLEMENTACIONES WHERE ID_TIPO_SUPLEMENTACION = :ID_ALIMENTO
          INTO :ALIMENTO, :PORC_MS;

          KG_MS_AUX = ((PORC_RACION * KG_MS)/100);

          KG_TC_AUX = (100*KG_MS_AUX)/PORC_PROM_MS;

          PRECIO_AUX = ((KG_TC_AUX*PRECIO_TON)/1000);

          CANT = CANT + 1;
          SUSPEND;
     END
END ^ 

SET TERM ; ^ 
