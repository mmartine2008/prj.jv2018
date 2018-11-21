set terminator !! ;

CREATE OR ALTER PROCEDURE FIX_MAPAS_PERDIDOS
RETURNS(
  POTCOO SMALLINT,
  ESTABLECIMIENTO INTEGER,
  NOMBRE VARCHAR(50) CHARACTER SET NONE)
AS
DECLARE VARIABLE POTMAP SMALLINT;
DECLARE VARIABLE IDLOG INTEGER;
DECLARE VARIABLE POTAUX SMALLINT;
DECLARE VARIABLE FECHA DATE;
DECLARE VARIABLE HORA TIME;
DECLARE VARIABLE ENTRO SMALLINT;
BEGIN
     POTCOO=NULL;
     POTMAP=NULL;
     NOMBRE=NULL;
     ESTABLECIMIENTO=NULL;
     FOR SELECT DISTINCT tc.potrero, tim.potrero , tc.ESTABLECIMIENTO
         FROM TAB_INFO_MAPA tim FULL OUTER JOIN TAB_COORDENADAS tc
         ON tim.potrero=tc.potrero
         WHERE (tim.potrero IS NOT NULL AND tc.potrero IS NULL)--Lo que hago acá es XOR
         OR (tim.potrero IS NULL AND tc.potrero IS NOT NULL)--QUE ESTA EN UNA TABLA Y NO EN LA OTRA, PERO que no sean las dos null
         ORDER BY tc.potrero
         INTO :POTCOO, :POTMAP, :ESTABLECIMIENTO
     DO
       BEGIN
            IDLOG=NULL;
            POTAUX=NULL;
            IF (POTMAP IS NULL) THEN --Tengo las coordenadas del potrero, pero no los datos del mismo.
               BEGIN
                    SELECT MAX(lim.id_log_info_mapa), lim.potrero --Selecciono el último registro
                    FROM LOG_INFO_MAPA lim --de la tabla donde esta el historial de los datos del mapa
                    WHERE lim.potrero = :POTCOO
                    GROUP BY lim.potrero, lim.potrero
                    ORDER BY lim.potrero, lim.potrero
                    INTO :IDLOG, :POTAUX;
                    IF (IDLOG IS NOT NULL) THEN
                        --Insertamos en la tabla el último registro que tenemos en el historial, el cual lo encontramos en la consulta anterior.
                        INSERT INTO TAB_INFO_MAPA( POTRERO, ESTABLECIMIENTO, NOMBRE, INFO, STROKE_COLOR, STROKE_WEIGTH, STROKE_OPACITY, FILL_COLOR, FILL_OPACITY, OBSERVACION)
                        SELECT POTRERO, ESTABLECIMIENTO, NOMBRE, INFO, STROKE_COLOR, STROKE_WEIGTH, STROKE_OPACITY, FILL_COLOR, FILL_OPACITY, OBSERVACION
                        FROM LOG_INFO_MAPA log --Ver poner un indice
                        WHERE :IDLOG = log.ID_LOG_INFO_MAPA;
                    ELSE                                            -- PARA REGENERAR LOS DATOS, y quede mas cheto
                        BEGIN                                       -- PIDO EL NOMBRE DEL POTRERO, ASI LE QUEDA PUESTO Y TODO
                             SELECT NOMBRE
                             FROM TAB_POTREROS
                             WHERE ID_POTRERO = :POTCOO
                             INTO :NOMBRE;
                             SUSPEND;                               -- Entones, en el delphi se ponene los datos del potrero de manera genérica.
                        END                                         -- Y solo se pierden los colorcitos
               END
            ELSE                                                    -- Quiere decir que esta la info del potrero, pero no sus cordenadas.
                BEGIN
                     ENTRO=0;
                     FOR SELECT MAX(lc.ID_LOG_COORDENADA), lc.potrero --Por cada punto de coordenada, lo devuellvo a Tab_Coordenada
                         FROM LOG_COORDENADAS lc
                         WHERE lc.potrero = :POTMAP
                         GROUP BY lc.potrero
                         ORDER BY lc.potrero
                         INTO :IDLOG,:POTAUX
                     DO
                       BEGIN
                            ENTRO=1;                                        --Lo uso para saber si hay algun potrero, sino no hay manera de regenerar esta info y borro de Tab_Info_Mapa el potrero para liberarlo.
                            FECHA=NULL;
                            HORA=NULL;
                            SELECT fecha, hora
                            from LOG_COORDENADAS
                            where :IDLOG = ID_LOG_COORDENADA
                            into :FECHA, :HORA;

                            INSERT INTO TAB_COORDENADAS(ID_COORDENADA,GRADO_LONG,MIN_LONG,SEG_LONG,UBICACION_LONG,GRADO_LAT,MIN_LAT,SEG_LAT,UBICACION_LAT,POTRERO,ESTABLECIMIENTO,ORDEN,LAT_DECIMAL,LNG_DECIMAL)
                            SELECT ID_COORDENADA,GRADO_LONG,MIN_LONG,SEG_LONG,UBICACION_LONG,GRADO_LAT,MIN_LAT,SEG_LAT,UBICACION_LAT,POTRERO,ESTABLECIMIENTO,ORDEN,LAT_DECIMAL,LNG_DECIMAL
                            FROM LOG_COORDENADAS lc ---VER PONER UN INDICE EN LOG
                            WHERE lc.potrero= :POTAUX and lc.fecha=:FECHA and lc.hora BETWEEN (:HORA-1) AND (:HORA+1);
                       END
                       IF (ENTRO=0) THEN                                  --No estan las coordenadas, libero el potrero.
                          DELETE FROM TAB_INFO_MAPA
                          WHERE :POTMAP = POTRERO;
                END
     END
END !!

