SET TERM ^ ; 

CREATE OR ALTER PROCEDURE REP_SUPLEMENTACION(
  DESDE DATE,
  HASTA DATE,
  ESTABLECIMIENTO INTEGER,
  RODEO_POTRERO VARCHAR(1) CHARACTER SET NONE)
RETURNS(
  FECHA_INI DATE,
  RACION VARCHAR(50) CHARACTER SET NONE,
  POTRERO VARCHAR(50) CHARACTER SET NONE,
  CANT_RACION DECIMAL(18, 2),
  CANT_RACION_TAL_CUAL DECIMAL(18, 2),
  CANT_RACION_A DECIMAL(18, 2),
  CANT_RACION_TC_A DECIMAL(18, 2),
  COSTO_UNITARIO DECIMAL(18, 2),
  COSTO_TOTAL DECIMAL(18, 2),
  CANTIDAD_ANIMALES INTEGER,
  COMP1 VARCHAR(100) CHARACTER SET NONE,
  COMP2 VARCHAR(100) CHARACTER SET NONE,
  COMP3 VARCHAR(100) CHARACTER SET NONE,
  COMP4 VARCHAR(100) CHARACTER SET NONE,
  PORC1 DECIMAL(18, 2),
  PORC2 DECIMAL(18, 2),
  PORC3 DECIMAL(18, 2),
  PORC4 DECIMAL(18, 2),
  MS1 DECIMAL(18, 2),
  MS2 DECIMAL(18, 2),
  MS3 DECIMAL(18, 2),
  MS4 DECIMAL(18, 2),
  TC1 DECIMAL(18, 2),
  TC2 DECIMAL(18, 2),
  TC3 DECIMAL(18, 2),
  TC4 DECIMAL(18, 2),
  COSTO_A1 DECIMAL(18, 2),
  COSTO_A2 DECIMAL(18, 2),
  COSTO_A3 DECIMAL(18, 2),
  COSTO_A4 DECIMAL(18, 2),
  COSTO1 DECIMAL(18, 2),
  COSTO2 DECIMAL(18, 2),
  COSTO3 DECIMAL(18, 2),
  COSTO4 DECIMAL(18, 2),
  TN1 DECIMAL(18, 2),
  TN2 DECIMAL(18, 2),
  TN3 DECIMAL(18, 2),
  TN4 DECIMAL(18, 2))
AS
DECLARE VARIABLE ID INTEGER;
DECLARE VARIABLE NOM_POT_ROD VARCHAR(50);
DECLARE VARIABLE ID_RACION INTEGER;
DECLARE VARIABLE CANT INTEGER;
DECLARE VARIABLE SUP VARCHAR(100);
DECLARE VARIABLE MS FLOAT;
DECLARE VARIABLE TC FLOAT;
DECLARE VARIABLE PORC FLOAT;
DECLARE VARIABLE COSTO FLOAT;
DECLARE VARIABLE MS_PROM FLOAT;
DECLARE VARIABLE KG_MS_COMP FLOAT;
DECLARE VARIABLE PORC_PROM FLOAT;
BEGIN
     FOR SELECT ID_ANIMAL, NOMBRE FROM AUX_ANIMALES INTO :ID, :NOM_POT_ROD
     DO
       BEGIN
            POTRERO = NOM_POT_ROD;
            FOR SELECT COUNT(EE.ID_EVENTO), SUM(ES.CANT_RACION), ES.TIPO_SUPLEMENTACION, EE.FECHA FROM EVE_EVENTOS EE JOIN EVE_SUPLEMENTACION ES
                ON EE.ID_EVENTO = ES.ID_EVENTO
                WHERE EE.POTRERO = :ID AND EE.FECHA BETWEEN :DESDE AND :HASTA GROUP BY ES.TIPO_SUPLEMENTACION, EE.FECHA
                INTO :CANTIDAD_ANIMALES, :CANT_RACION, :ID_RACION, :FECHA_INI
            DO
            BEGIN
                 CANT = 1;
                 COSTO_UNITARIO = 0;
                 COSTO_TOTAL = 0;
                 MS_PROM = 0;
                 CANT_RACION_TAL_CUAL = 0;
                 PORC_PROM = 0;
                 
                 FOR SELECT RRS.PORCENTAJE, CTS.PORC_MS FROM REL_RACION_SUPLEMENTO RRS
                     JOIN COD_TIPOS_SUPLEMENTACIONES CTS ON RRS.ID_SUPLEMENTO = CTS.ID_TIPO_SUPLEMENTACION WHERE
                     RRS.ID_RACION = :ID_RACION INTO :PORC, :MS
                 DO
                 BEGIN
                     PORC_PROM = PORC_PROM + (PORC * MS);
                 END
                 
                 PORC_PROM = PORC_PROM / 100;
                 
                 SELECT NOMBRE FROM TAB_RACION WHERE ID_RACION = :ID_RACION INTO RACION;
                 
                 FOR SELECT RRS.PORCENTAJE, RRS.PRECIO, CTS.PORC_MS, CTS.NOMBRE FROM REL_RACION_SUPLEMENTO RRS
                     JOIN COD_TIPOS_SUPLEMENTACIONES CTS ON RRS.ID_SUPLEMENTO = CTS.ID_TIPO_SUPLEMENTACION WHERE
                     RRS.ID_RACION = :ID_RACION INTO :PORC, :COSTO, :MS, :SUP
                 DO
                 BEGIN
                      IF (CANT = 1) THEN
                      BEGIN
                           TN1 = COSTO;
                           KG_MS_COMP = (CANT_RACION*PORC)/100;
                           TC1 = (KG_MS_COMP*100)/PORC_PROM;
                           COMP1 = SUP;
                           PORC1 = PORC;
                           MS1 = MS;
                           --TC1 = 100 - MS;
                           COSTO1 = ((TC1*COSTO)/1000);
                           COSTO_A1 = COSTO1 / CANTIDAD_ANIMALES;
                           COSTO_UNITARIO = COSTO_UNITARIO + COSTO_A1;
                           COSTO_TOTAL = COSTO_TOTAL + COSTO1;
                           CANT_RACION_TAL_CUAL = CANT_RACION_TAL_CUAL + TC1;
                      END
                      IF (CANT = 2) THEN
                      BEGIN
                           TN2 = COSTO;
                           KG_MS_COMP = (CANT_RACION*PORC)/100;
                           TC2 = (KG_MS_COMP*100)/PORC_PROM;
                           COMP2 = SUP;
                           PORC2 = PORC;
                           MS2 = MS;
                           --TC2 = 100 - MS;
                           COSTO2 = ((TC2*COSTO)/1000);
                           COSTO_A2 = COSTO2 / CANTIDAD_ANIMALES;
                           COSTO_UNITARIO = COSTO_UNITARIO + COSTO_A2;
                           COSTO_TOTAL = COSTO_TOTAL + COSTO2;
                           CANT_RACION_TAL_CUAL = CANT_RACION_TAL_CUAL + TC2;
                      END
                      IF (CANT = 3) THEN
                      BEGIN
                           TN3 = COSTO;
                           KG_MS_COMP = (CANT_RACION*PORC)/100;
                           TC3 = (KG_MS_COMP*100)/PORC_PROM;
                           COMP3 = SUP;
                           PORC3 = PORC;
                           MS3 = MS;
                           --TC3 = 100 - MS;
                           COSTO3 = ((TC3*COSTO)/1000);
                           COSTO_A3 = COSTO3 / CANTIDAD_ANIMALES;
                           COSTO_UNITARIO = COSTO_UNITARIO + COSTO_A3;
                           COSTO_TOTAL = COSTO_TOTAL + COSTO3;
                           CANT_RACION_TAL_CUAL = CANT_RACION_TAL_CUAL + TC3;
                      END
                      IF (CANT = 4) THEN
                      BEGIN
                           TN4 = COSTO;
                           KG_MS_COMP = (CANT_RACION*PORC)/100;
                           TC4 = (KG_MS_COMP*100)/PORC_PROM;
                           COMP4 = SUP;
                           PORC4 = PORC;
                           MS4 = MS;
                           --TC4 = 100 - MS;
                           COSTO4 = ((TC4*COSTO)/1000);
                           COSTO_A4 = COSTO4 / CANTIDAD_ANIMALES;
                           COSTO_UNITARIO = COSTO_UNITARIO + COSTO_A4;
                           COSTO_TOTAL = COSTO_TOTAL + COSTO4;
                           CANT_RACION_TAL_CUAL = CANT_RACION_TAL_CUAL + TC4;
                      END
                      CANT = CANT + 1;
                      MS_PROM = MS_PROM + MS;
                 END
                 COSTO_TOTAL = COSTO_TOTAL;
                 COSTO_UNITARIO = COSTO_UNITARIO;
                 MS_PROM = MS_PROM / (CANT-1);
                 CANT_RACION_A = CANT_RACION / CANTIDAD_ANIMALES;
                 CANT_RACION_TC_A = CANT_RACION_TAL_CUAL / CANTIDAD_ANIMALES;
                 SUSPEND;
            END
       END
END ^ 

SET TERM ; ^

