SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_MOVIMIENTOS(
  DESDE DATE,
  HASTA DATE,
  NRO INTEGER,
  TIPO_ALTA INTEGER,
  TIPO_BAJA INTEGER)
RETURNS(
  CANTIDAD INTEGER,
  FECHA DATE,
  DESTINO VARCHAR(50) CHARACTER SET NONE,
  RESPONSABLE VARCHAR(50) CHARACTER SET NONE,
  PESO_PROMEDIO INTEGER,
  DTE_SI_NO VARCHAR(2) CHARACTER SET NONE,
  NRO_DTE INTEGER,
  PATH VARCHAR(255) CHARACTER SET NONE,
  TIPO_MOVIMIENTO VARCHAR(50) CHARACTER SET NONE,
  ID_GRUPO INTEGER,
  ESTABLEC INTEGER,
  PRECIO FLOAT)
AS
DECLARE VARIABLE TIPO_EVENTO INTEGER;
DECLARE VARIABLE SUBTIPO_EVENTO INTEGER;
DECLARE VARIABLE ID_EVENTO INTEGER;
DECLARE VARIABLE ID_RESPONSABLE INTEGER;
DECLARE VARIABLE ID_DESTINO INTEGER;
DECLARE VARIABLE GUARDAR VARCHAR(1) CHARACTER SET NONE;
BEGIN

     FOR SELECT ID_GRUPO, ESTABLECIMIENTO, NRO_DTE, PATH_DTE
     FROM TAB_GRUPOS
     WHERE (TIPO_EVENTO = 2  -- ALTA DIRECTA
     OR TIPO_EVENTO = 3      -- BAJA
     OR TIPO_EVENTO = 40)    -- NACIMIENTO
     INTO :ID_GRUPO, :ESTABLEC, :NRO_DTE, :PATH
     DO
     BEGIN

          CANTIDAD=0;
          FECHA=NULL;
          RESPONSABLE=NULL;
          DESTINO = NULL;
          ID_RESPONSABLE=NULL;
          ID_DESTINO = NULL;
          PESO_PROMEDIO = NULL;

          FOR SELECT E.FECHA, E.RESPONSABLE, COUNT(*), E.TIPO
          FROM REL_GRUPOS_EVENTO R
          JOIN EVE_EVENTOS E
          ON (R.EVENTO = E.ID_EVENTO)
          WHERE R.GRUPO = :ID_GRUPO
          AND R.ESTABLECIMIENTO = :ESTABLEC
          GROUP BY E.FECHA, E.RESPONSABLE, E.TIPO
          INTO :FECHA, :ID_RESPONSABLE, :CANTIDAD, :TIPO_EVENTO
          DO
          BEGIN

               -- SETEO DESTINO Y PESO PROMEDIO
               IF (TIPO_EVENTO = 2) THEN
               BEGIN
                    --alta directa
                    SELECT FIRST 1 E.TIPO, C.NOMBRE, E.PRECIO_UNITARIO
                    FROM EVE_ALTA_DIRECTA E
                    JOIN COD_TIPOS_ALTA C
                    ON (E.TIPO = C.ID_TIPO_ALTA)
                    WHERE E.ID_EVENTO IN (SELECT E.ID_EVENTO
                                        FROM REL_GRUPOS_EVENTO R
                                        JOIN EVE_EVENTOS E
                                        ON (R.EVENTO = E.ID_EVENTO)
                                        WHERE R.GRUPO = :ID_GRUPO
                                        AND R.ESTABLECIMIENTO = :ESTABLEC )
                    INTO :SUBTIPO_EVENTO, :TIPO_MOVIMIENTO, :PRECIO;

               END ELSE IF (TIPO_EVENTO = 3) THEN
               BEGIN
                    --baja
                    SELECT FIRST 1 E.TIPO, E.DESTINO, E.PESODESTINO, C.NOMBRE, E.PRECIO
                    FROM EVE_BAJA E
                    JOIN COD_TIPOS_BAJA C
                    ON (E.TIPO = C.ID_TIPO_BAJA)
                    WHERE E.ID_EVENTO IN (SELECT E.ID_EVENTO
                                        FROM REL_GRUPOS_EVENTO R
                                        JOIN EVE_EVENTOS E
                                        ON (R.EVENTO = E.ID_EVENTO)
                                        WHERE R.GRUPO = :ID_GRUPO
                                        AND R.ESTABLECIMIENTO = :ESTABLEC )
                    INTO :SUBTIPO_EVENTO, :ID_DESTINO, :PESO_PROMEDIO, :TIPO_MOVIMIENTO, :PRECIO;

               END ELSE IF (TIPO_EVENTO = 40) THEN
               BEGIN
                    --nacimiento
                    SUBTIPO_EVENTO = 40;
                    TIPO_MOVIMIENTO = 'NACIMIENTO';
                    PRECIO = 0;
               END

               -- VERIFICO SI CUMPLE TIPO_EVENTO (Tipo alta o tipo baja) Y SUBTIPO_EVENTO (Requerido)
               GUARDAR = 'S';
               IF (TIPO_EVENTO = 2 OR TIPO_EVENTO = 40) THEN
               BEGIN
                    --alta
                    IF (TIPO_ALTA IS NOT NULL) THEN
                    BEGIN
                         IF (TIPO_ALTA <> SUBTIPO_EVENTO) THEN
                            GUARDAR = 'N';
                    END
                    ELSE IF (TIPO_ALTA = -1) THEN
                         GUARDAR = 'N';
               END ELSE IF (TIPO_EVENTO = 3) THEN
               BEGIN
                    --baja
                    IF (TIPO_BAJA IS NOT NULL) THEN
                    BEGIN
                         IF (TIPO_BAJA <> SUBTIPO_EVENTO) THEN
                            GUARDAR = 'N';
                    END
                    ELSE IF (TIPO_BAJA = -1) THEN
                         GUARDAR = 'N';
               END

               -- VERIFICO SI FECHA ESTA EN EL RANGO SOLICITADO
               IF (DESDE IS NOT NULL) THEN
               BEGIN
                    IF (FECHA < DESDE) THEN
                       GUARDAR = 'N';
               END
               IF (HASTA IS NOT NULL) THEN
               BEGIN
                    IF (HASTA < FECHA) THEN
                       GUARDAR = 'N';
               END

               -- VERIFICO SI NRO DTE CORRESPONDE
               IF (NRO IS NOT NULL) THEN
               BEGIN
                    IF ((NRO_DTE NOT LIKE '%'||NRO||'%') OR (NRO_DTE IS NULL)) THEN
                       GUARDAR = 'N';
               END

               IF (GUARDAR = 'S') THEN
               BEGIN
                    --COMPLETO DTE
                    IF (NRO_DTE IS NULL)
                       THEN DTE_SI_NO = 'NO';
                       ELSE DTE_SI_NO = 'SI';
                    IF (PATH IS NOT NULL)
                       THEN DTE_SI_NO = 'SI';
                    --COMPLETO RESPONSABLE
                    SELECT NOMBRE||' '||APELLIDO
                    FROM TAB_EMPLEADOS
                    WHERE ID_EMPLEADO = :ID_RESPONSABLE
                    AND ESTABLECIMIENTO = :ESTABLEC
                    INTO :RESPONSABLE;
                    --COMPLETO DESTINO
                    SELECT NOMBRE
                    FROM COD_DESTINO
                    WHERE ID_DESTINO = :ID_DESTINO
                    INTO :DESTINO;
                    --GUARDO
                    SUSPEND;
               END

          END

     END

END ^

SET TERM ; ^

