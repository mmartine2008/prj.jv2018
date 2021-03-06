SET TERM ^ ;

CREATE OR ALTER PROCEDURE GET_DATOS_EVE_SUPLEMENTACION(
  ID INTEGER)
RETURNS(
  DATOS VARCHAR(255) CHARACTER SET NONE)
AS
DECLARE VARIABLE TIPO VARCHAR(50);
DECLARE VARIABLE CANT_DIAS INTEGER;
DECLARE VARIABLE CANT_RACION DECIMAL(18, 2);
DECLARE VARIABLE COSTO_UNITARIO DECIMAL(18, 2);
DECLARE VARIABLE COSTO_TOTAL DECIMAL(18, 2);
DECLARE VARIABLE PORC_RACION DECIMAL(18, 2);
DECLARE VARIABLE PORC_MS DECIMAL(18, 2);
DECLARE VARIABLE PRECIO_TON DECIMAL(18, 2);
DECLARE VARIABLE KG_MS DECIMAL(18, 2);
DECLARE VARIABLE KG_TC DECIMAL(18, 2);
DECLARE VARIABLE RACION INTEGER;
DECLARE VARIABLE ALIMENTO INTEGER;
DECLARE VARIABLE CANT INTEGER;
DECLARE VARIABLE KG_MS_AUX DECIMAL(18, 2);
DECLARE VARIABLE KG_TC_AUX DECIMAL(18, 2);
DECLARE VARIABLE PRECIO_AUX DECIMAL(18, 2);
DECLARE VARIABLE PORC DECIMAL(18, 2);
DECLARE VARIABLE MS DECIMAL(18, 2);
DECLARE VARIABLE PORC_PROM DECIMAL(18, 2);
BEGIN
     SELECT ES.COSTO_UNITARIO_RACION, ES.COSTO_TOTAL_SUPLEMENTADO, ES.CANT_RACION, TR.NOMBRE, ES.TIPO_SUPLEMENTACION
     FROM EVE_SUPLEMENTACION ES JOIN TAB_RACION TR ON ES.TIPO_SUPLEMENTACION = TR.ID_RACION
     WHERE ES.ID_EVENTO = :ID INTO :COSTO_UNITARIO, :COSTO_TOTAL, :KG_MS, :TIPO, :RACION;

     CANT = 0;
     KG_MS_AUX = 0;
     KG_TC_AUX = 0;
     PRECIO_AUX = 0;
     PORC = 0;
     MS=0;
     PORC_PROM = 0;
     
     FOR SELECT RRS.PORCENTAJE, CTS.PORC_MS FROM REL_RACION_SUPLEMENTO RRS
          JOIN COD_TIPOS_SUPLEMENTACIONES CTS ON RRS.ID_SUPLEMENTO = CTS.ID_TIPO_SUPLEMENTACION WHERE
          RRS.ID_RACION = :RACION INTO :PORC, :MS
          DO
          BEGIN
               PORC_PROM = PORC_PROM + (PORC * MS);
          END

     PORC_PROM = PORC_PROM / 100;
     
     FOR SELECT ID_SUPLEMENTO, PORCENTAJE, PRECIO FROM REL_RACION_SUPLEMENTO WHERE ID_RACION = :RACION
         INTO :ALIMENTO, :PORC_RACION, :PRECIO_TON
     DO
     BEGIN
          SELECT PORC_MS FROM COD_TIPOS_SUPLEMENTACIONES WHERE ID_TIPO_SUPLEMENTACION = :ALIMENTO
          INTO :PORC_MS;

          KG_MS_AUX = KG_MS_AUX + ((PORC_RACION * KG_MS)/100);

          KG_TC_AUX = KG_TC_AUX + ((100*((PORC_RACION * KG_MS)/100))/PORC_PROM);

          PRECIO_AUX = PRECIO_AUX + ((((100*((PORC_RACION * KG_MS)/100))/PORC_PROM)*PRECIO_TON)/1000);

          CANT = CANT + 1;
     END

     KG_TC = cast(KG_TC_AUX as decimal(3,2));
     KG_MS = cast(KG_MS_AUX as decimal(3,2));
     COSTO_TOTAL = PRECIO_AUX;

     DATOS = 'Raci�n '||TIPO||'. Kg MS: '||CAST(KG_MS AS DECIMAL(3,2))||'. Kg (tal cual): '||CAST(KG_TC AS DECIMAL(3,2))||'. Precio/d�a $'||CAST(COSTO_TOTAL AS DECIMAL(3,2));
     SUSPEND;

END ^ 

SET TERM ; ^ 

