SET TERM ^ ;

CREATE OR ALTER PROCEDURE GET_DATOS_ANIMAL_FECHA(
  ID_ANIMAL INTEGER,
  ESTABLECIMIENTO INTEGER,
  FECHA DATE)
RETURNS(
  POTRERO INTEGER,
  RODEO INTEGER,
  CRONOLOGIA_DENTARIA INTEGER,
  ESTADO_REPRODUCTIVO INTEGER,
  CATEGORIA INTEGER,
  COND_CORP INTEGER,
  GDR INTEGER)
AS
DECLARE VARIABLE EVENTO INTEGER;
DECLARE VARIABLE TIPO INTEGER;
DECLARE VARIABLE FECHA_NAC DATE;
DECLARE VARIABLE EDAD INTEGER;
DECLARE VARIABLE SEXO INTEGER;
DECLARE VARIABLE CAT_AUX INTEGER;
DECLARE VARIABLE F DATE;
BEGIN
  --Estado Reproductivo
  EVENTO = NULL;
  SELECT FIRST 1 ID_EVENTO, TIPO FROM EVE_EVENTOS WHERE FECHA <= :FECHA AND ANIMAL = :ID_ANIMAL AND ESTABLECIMIENTO = :ESTABLECIMIENTO AND
  (TIPO = 1 OR TIPO = 2 OR TIPO = 11 OR TIPO = 13 OR TIPO = 15 OR TIPO = 17 OR TIPO = 20 OR TIPO = 28 OR TIPO = 24 OR TIPO = 39)
  ORDER BY FECHA/*, ID_EVENTO*/ DESC INTO :EVENTO, :TIPO;
  IF (EVENTO IS NOT NULL) THEN
  BEGIN
       -- aborto
       if (tipo = 1 ) then
       begin
            select first 1 estado_reproductivo from eve_aborto where (id_evento = :EVENTO)
            into :estado_reproductivo;
       end
       -- alta
       if (tipo = 2) then
       begin
            select first 1 estado_reproductivo from eve_alta_directa where (id_evento = :evento)
            into :estado_reproductivo;
       end
       -- deteccion de celo
       if (tipo = 11) then
       begin
            select first 1 estado_reproductivo from eve_deteccion_celo where (id_evento = :evento)
            into :estado_reproductivo;
       end
       -- diagnostico de gestacion
       if (tipo = 13) then
       begin
            select first 1 estado_reproductivo from eve_diagnostico_gestacion where (id_evento = :evento)
            into :estado_reproductivo;
       end
       -- Egreso Servicio
       if (tipo = 15) then
       begin
            select first 1 estado_reproductivo from eve_egreso_servicio where (id_evento = :evento)
            into :estado_reproductivo;
       end
       -- Evaluacion Preservicio
       if (tipo = 17) then
       begin
            select first 1 estado_reproductivo from eve_evaluacion_preservicio where (id_evento = :evento)
            into :estado_reproductivo;
       end
       -- Ingreso Servicio
       if (tipo = 20) then
       begin
            select first 1 estado_reproductivo from eve_ingreso_servicio where (id_evento = :evento)
            into :estado_reproductivo;
       end
       -- Parto
       if (tipo = 24) then
       begin
            select first 1 estado_reproductivo from eve_parto where (id_evento = :evento)
            into :estado_reproductivo;
       end
       -- Parto Masivo
       if (tipo = 39) then
          estado_reproductivo = 4; -- Siempre esta como parida
       -- Inseminacion Artificial
       if (tipo = 28) then
       begin
            select first 1 estado_reproductivo from eve_inseminacion_artificial where (id_evento = :evento)
            into :estado_reproductivo;
       end
  END
  --Camibio de Ubicacion
  EVENTO = NULL;

  SELECT FIRST 1 EE.ID_EVENTO, ee.fecha, ECU.POTRERO FROM EVE_EVENTOS EE JOIN EVE_CAMBIO_UBICACION ECU ON EE.ID_EVENTO = ECU.ID_EVENTO
  WHERE EE.FECHA <= :FECHA AND EE.TIPO = 5 AND EE.ANIMAL = :ID_ANIMAL AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND ECU.ESTABLECIMIENTO_ANTERIOR IS NULL
  ORDER BY ee.FECHA DESC,ee.ID_EVENTO DESC  INTO :EVENTO,:f,:POTRERO;
  --IF (EVENTO IS NOT NULL) THEN
  --   SELECT FIRST 1 POTRERO, RODEO FROM EVE_CAMBIO_UBICACION WHERE ID_EVENTO = :EVENTO ORDER BY  INTO :POTRERO, :RODEO;
  ---Cronologia Dentaria
  EVENTO = NULL;
 


  SELECT FIRST 1 ID_EVENTO, TIPO FROM EVE_EVENTOS WHERE FECHA <= :FECHA AND (TIPO = 2 OR TIPO = 13) AND ANIMAL = :ID_ANIMAL AND ESTABLECIMIENTO = :ESTABLECIMIENTO
  ORDER BY FECHA/*, ID_EVENTO*/ DESC INTO :EVENTO, :TIPO;
  IF (EVENTO IS NOT NULL) THEN
  BEGIN
       IF (TIPO = 2) THEN
          SELECT CRONOLOGIA_DENTARIA FROM EVE_ALTA_DIRECTA WHERE ID_EVENTO = :EVENTO INTO :CRONOLOGIA_DENTARIA;
       ELSE
           SELECT CRONOLOGIA_DENTARIA FROM EVE_DIAGNOSTICO_GESTACION WHERE ID_EVENTO = :EVENTO INTO :CRONOLOGIA_DENTARIA;
  END
  --GDR
  EVENTO = NULL;

  SELECT FIRST 1 ID_EVENTO, TIPO FROM EVE_EVENTOS WHERE FECHA <= :FECHA AND (TIPO = 2 OR TIPO = 17) AND ANIMAL = :ID_ANIMAL AND ESTABLECIMIENTO = :ESTABLECIMIENTO
  ORDER BY FECHA/*, ID_EVENTO*/ DESC INTO :EVENTO, :TIPO;
  IF (EVENTO IS NOT NULL) THEN
  BEGIN
       IF (TIPO = 2) THEN
          SELECT GDR FROM EVE_ALTA_DIRECTA WHERE ID_EVENTO = :EVENTO INTO :GDR;
       ELSE
           SELECT GDR FROM EVE_EVALUACION_PRESERVICIO WHERE ID_EVENTO = :EVENTO INTO :GDR;
  END
  --Condicion Corporal
  EVENTO = NULL;

  SELECT FIRST 1 ECC.CONDICION_CORPORAL FROM EVE_CONDICION_CORPORAL ECC JOIN EVE_EVENTOS EE ON EE.ID_EVENTO=ECC.ID_EVENTO
  WHERE EE.FECHA <= :FECHA AND EE.ANIMAL = :ID_ANIMAL AND ESTABLECIMIENTO = :ESTABLECIMIENTO
  ORDER BY EE.FECHA/*, EE.ID_EVENTO*/ DESC INTO :COND_CORP;

  --Categoria
  EVENTO = NULL;

  SELECT TA.FECHA_NACIMIENTO, CS.TIPO
  FROM TAB_ANIMALES TA join COD_SEXOS CS ON TA.SEXO = CS.ID_SEXO
  WHERE TA.ID_ANIMAL = :ID_ANIMAL AND TA.ESTABLECIMIENTO = :ESTABLECIMIENTO
  INTO :FECHA_NAC, :SEXO;
  EDAD = (FECHA-FECHA_NAC)/30;
  IF (SEXO = 1) THEN --Macho
  BEGIN
       SELECT FIRST 1 ID_EVENTO FROM EVE_EVENTOS WHERE ANIMAL = :ID_ANIMAL AND ESTABLECIMIENTO = :ESTABLECIMIENTO
       AND FECHA <= :FECHA AND TIPO = 7 ORDER BY FECHA DESC INTO :EVENTO;
       IF (EDAD < 7) THEN
          CATEGORIA = 1; --Ternero
       ELSE
       BEGIN
            IF (EVENTO IS NOT NULL) THEN
               CATEGORIA = 2; --Novillo
            ELSE
            BEGIN
                 SELECT FIRST 1 ALD.CATEGORIA FROM EVE_ALTA_DIRECTA ALD JOIN EVE_EVENTOS EE ON EE.ID_EVENTO=ALD.ID_EVENTO
                 WHERE EE.ANIMAL =:ID_ANIMAL AND ESTABLECIMIENTO = :ESTABLECIMIENTO ORDER BY EE.FECHA DESC INTO :CAT_AUX;
                 IF (CAT_AUX = 2) THEN
                    CATEGORIA = 2;
                 ELSE
                 BEGIN
                      IF (EDAD < 9) THEN
                         CATEGORIA = 1; -- Ternero
                      ELSE
                          CATEGORIA = 3; --Toro
                 END
            END
       END
  END
  ELSE --Hembra
  BEGIN
       IF (EDAD < 9) THEN
          CATEGORIA = 4; --Ternera
       ELSE
       BEGIN
            SELECT FIRST 1 ID_EVENTO FROM EVE_EVENTOS WHERE ANIMAL = :ID_ANIMAL AND ESTABLECIMIENTO = :ESTABLECIMIENTO
            AND FECHA <= :FECHA AND (TIPO = 24 OR TIPO = 39) ORDER BY FECHA, ID_EVENTO DESC INTO :EVENTO;
            IF (EVENTO IS NOT NULL) THEN
                 CATEGORIA = 6;
            ELSE
            BEGIN
                 SELECT FIRST 1 ALD.CATEGORIA FROM EVE_ALTA_DIRECTA ALD JOIN EVE_EVENTOS EE ON EE.ID_EVENTO=ALD.ID_EVENTO
                 WHERE EE.ANIMAL =:ID_ANIMAL AND ESTABLECIMIENTO = :ESTABLECIMIENTO ORDER BY EE.FECHA DESC INTO :CAT_AUX;

                 IF (CAT_AUX = 6) THEN
                    CATEGORIA = 6; --Vaca
                 ELSE
                     CATEGORIA =5;
            END
       END
  END

  SUSPEND;
END ^ 

SET TERM ; ^ 

