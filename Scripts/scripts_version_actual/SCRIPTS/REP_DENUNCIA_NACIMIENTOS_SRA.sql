DROP PROCEDURE REP_DENUNCIA_NACIMIENTOS_SRA;

CREATE PROCEDURE REP_DENUNCIA_NACIMIENTOS_SRA(
  ESTABLECIMIENTO INTEGER,
  DESDE DATE,
  HASTA DATE,
  GRUPO INTEGER,
  POTRERO INTEGER,
  VACIO INTEGER,
  TIPOREG INTEGER,
  RAZA_A INTEGER)
RETURNS(
  RP VARCHAR(10) CHARACTER SET NONE,
  ID_RODEO INTEGER,
  ROD VARCHAR(50) CHARACTER SET NONE,
  ID_POTRERO INTEGER,
  POT VARCHAR(50) CHARACTER SET NONE,
  GRADO_DISTOCIA VARCHAR(50) CHARACTER SET NONE,
  CONDICION_CORPORAL DECIMAL(18, 1),
  RAZA VARCHAR(2) CHARACTER SET NONE,
  FRAME VARCHAR(1) CHARACTER SET NONE,
  AREA_PELVICA VARCHAR(15) CHARACTER SET NONE,
  PESO_NACIMIENTO_1 DOUBLE PRECISION,
  SEXO_1 INTEGER,
  PESO_NACIMIENTO_PROM DOUBLE PRECISION,
  NOMBRE_PADRE VARCHAR(100) CHARACTER SET NONE,
  NOMBRE_MADRE VARCHAR(100) CHARACTER SET NONE,
  MUERTO_7DIAS VARCHAR(1) CHARACTER SET NONE,
  MUERTO_7DIAS_DESPUES VARCHAR(1) CHARACTER SET NONE,
  FECHA_NAC DATE,
  NOMBRESEXO VARCHAR(50) CHARACTER SET NONE,
  RPMADRE VARCHAR(10) CHARACTER SET NONE,
  HBAMADRE VARCHAR(10) CHARACTER SET NONE,
  RPPADRE VARCHAR(10) CHARACTER SET NONE,
  HBAPADRE VARCHAR(10) CHARACTER SET NONE,
  MUERTO_NACER VARCHAR(1) CHARACTER SET NONE,
  CAUSA_DISTOCIA VARCHAR(50) CHARACTER SET NONE,
  ID_GRADO_DISTOCIA INTEGER,
  ID_CAUSA_DISTOCIA INTEGER,
  ID_CODIGO_DISTOCIA INTEGER,
  ORDEN INTEGER,
  HIJO INTEGER,
  MADRE INTEGER,
  PADRE INTEGER,
  OBSERVACION VARCHAR(255) CHARACTER SET NONE,
  FECHA_SERVICIO_REG DATE,
  DIAI INTEGER,
  MESI INTEGER,
  ANIOI INTEGER,
  DIAF INTEGER,
  MESF INTEGER,
  ANIOF INTEGER,
  TIPO_PARTO INTEGER,
  CRIA VARCHAR(1) CHARACTER SET NONE,
  PREFIJO VARCHAR(10) CHARACTER SET NONE,
  COLOR INTEGER,
  MELLIZO INTEGER,
  NOMBRE VARCHAR(150) CHARACTER SET NONE,
  NRO_REG_ASOC_M VARCHAR(10) CHARACTER SET NONE,
  NRO_REG_ASOC_P VARCHAR(10) CHARACTER SET NONE)
AS
DECLARE VARIABLE COND_CORP INTEGER;
DECLARE VARIABLE EVAL_PRESERV INTEGER;
DECLARE VARIABLE PARTO INTEGER;
DECLARE VARIABLE CANTIDAD INTEGER;
DECLARE VARIABLE GRADO INTEGER;
DECLARE VARIABLE ID_RAZA INTEGER;
DECLARE VARIABLE FECHA_PARTO DATE;
DECLARE VARIABLE SQLAUX_1 VARCHAR(255);
DECLARE VARIABLE SQLAUX_2 VARCHAR(255);
DECLARE VARIABLE SQLAUX_3 VARCHAR(255);
DECLARE VARIABLE SQLAUX_4 VARCHAR(255);
DECLARE VARIABLE SQLAUX_5 VARCHAR(255);
DECLARE VARIABLE AUX_FRAME FLOAT;
DECLARE VARIABLE AUX_AREAP FLOAT;
DECLARE VARIABLE VIVO VARCHAR(1);
DECLARE VARIABLE FECHA_7DIAS DATE;
DECLARE VARIABLE FECHA_NACIMIENTO DATE;
DECLARE VARIABLE CANT INTEGER;
DECLARE VARIABLE DISTOCIA INTEGER;
DECLARE VARIABLE CC INTEGER;
DECLARE VARIABLE MADREBIOLOGICAINTERNA INTEGER;
DECLARE VARIABLE MADRERECEPTORAINTERNA INTEGER;
DECLARE VARIABLE FECHA_POS_SERVICIO_DESDE DATE;
DECLARE VARIABLE FECHA_POS_SERVICIO_HASTA DATE;
DECLARE VARIABLE FECHA_PRE_PARTO DATE;
DECLARE VARIABLE VCRIADOR INTEGER;
DECLARE VARIABLE VCOLOR INTEGER;
DECLARE VARIABLE AUX_EVE INTEGER;
DECLARE VARIABLE AUX_TIPO_REG INTEGER;
DECLARE VARIABLE AUX_RAZA INTEGER;
BEGIN
ORDEN = 0;
OBSERVACION = '';
FECHA_SERVICIO_REG = NULL;
FECHA_POS_SERVICIO_DESDE = NULL;
FECHA_POS_SERVICIO_HASTA = NULL;

IF (VACIO = 0) THEN
begin
      FOR SELECT TA.ID_ANIMAL, TA.RAZA, TA.FRAME, EE.ID_EVENTO, EE.POTRERO, EE.RODEO, EE.FECHA, TA.ID_HBA, TA.ID_RP, TA.NOMBRE
         FROM TAB_ANIMALES TA JOIN EVE_EVENTOS EE ON EE.ANIMAL = TA.ID_ANIMAL join cod_sexos cs on ta.sexo = cs.id_sexo
         WHERE (EE.TIPO = 24 OR EE.TIPO = 39) AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND EE.FECHA BETWEEN :DESDE AND :HASTA AND
         CS.TIPO = 2 AND (EE.POTRERO = :POTRERO OR :POTRERO = -1) AND (:GRUPO = -1 OR TA.ID_ANIMAL IN (SELECT ANIMAL FROM REL_PERTENECE_GRUPO WHERE
         ESTABLECIMIENTO = :ESTABLECIMIENTO AND GRUPO = :GRUPO))
       INTO :MADRE, :ID_RAZA, :AUX_FRAME, :PARTO, :ID_POTRERO, :ID_RODEO, :FECHA_PARTO, :HBAMADRE, :RPMADRE, :NOMBRE_MADRE
     DO
     BEGIN
            FECHA_SERVICIO_REG = NULL;
            FECHA_POS_SERVICIO_DESDE = :FECHA_PARTO - 365;
            FECHA_POS_SERVICIO_HASTA = :FECHA_PARTO - 182;
            FECHA_PRE_PARTO = :FECHA_PARTO - 270;
            
            SELECT COUNT(*) FROM EVE_EVENTOS WHERE ANIMAL = :MADRE AND FECHA < :FECHA_PRE_PARTO AND TIPO = 48
            INTO :AUX_EVE;
            IF (:AUX_EVE = 0) THEN
            BEGIN
       ---     FECHA_SERVICIO_REG ='2015/11/03';
            DIAI = EXTRACT(DAY FROM FECHA_SERVICIO_REG);
            MESI = EXTRACT(MONTH FROM FECHA_SERVICIO_REG);
            ANIOI = EXTRACT(YEAR FROM FECHA_SERVICIO_REG);

            DISTOCIA = NULL;
            GRADO_DISTOCIA = NULL;
            CAUSA_DISTOCIA = NULL;
            ID_GRADO_DISTOCIA = NULL;
            ID_CAUSA_DISTOCIA = NULL;
            ID_CODIGO_DISTOCIA = NULL;
            SELECT  ID_EVENTO FROM EVE_EVENTOS WHERE DISPARADOR = :PARTO AND TIPO = 14 INTO :DISTOCIA;
            IF (DISTOCIA IS NOT NULL) THEN
            BEGIN
             SELECT CGA.NOMBRE, CGA.ID_GRADO_ASISTENCIA,CCD.NOMBRE, CCD.ID_CAUSA_DISTOCIA
             FROM EVE_DISTOCIA ED JOIN COD_GRADOS_ASISTENCIA CGA ON ED.GRADO_ASISTENCIA = CGA.ID_GRADO_ASISTENCIA JOIN
                  COD_CAUSAS_DISTOCIA CCD ON ED.CAUSA = CCD.ID_CAUSA_DISTOCIA
             WHERE ED.ID_EVENTO = :DISTOCIA
             INTO :GRADO_DISTOCIA, :ID_GRADO_DISTOCIA, :CAUSA_DISTOCIA, :ID_CAUSA_DISTOCIA;

             ID_CODIGO_DISTOCIA = :ID_GRADO_DISTOCIA;
             if (:ID_CAUSA_DISTOCIA = 11) then
               ID_CODIGO_DISTOCIA = :ID_CAUSA_DISTOCIA;
            END
            
            TIPO_PARTO = ID_GRADO_DISTOCIA - 1;
          SELECT CODIGO FROM COD_RAZAS WHERE ID_RAZA = :ID_RAZA INTO :RAZA;
          SELECT NOMBRE FROM TAB_POTREROS WHERE ID_POTRERO = :ID_POTRERO AND ESTABLECIMIENTO = :ESTABLECIMIENTO INTO :POT;
          SELECT NOMBRE FROM TAB_RODEOS WHERE ID_RODEO = :ID_RODEO AND ESTABLECIMIENTO = :ESTABLECIMIENTO INTO :ROD;

          IF (AUX_FRAME IS NOT NULL) THEN
             FRAME = CAST(CAST(AUX_FRAME AS NUMERIC(9,0)) AS VARCHAR(1));
          ELSE
              FRAME = NULL;
          CONDICION_CORPORAL = NULL;
          SELECT CONDICION_CORPORAL FROM EVE_PARTO WHERE ID_EVENTO=:PARTO INTO :CONDICION_CORPORAL;
          IF (CONDICION_CORPORAL IS NULL) THEN
             SELECT CONDICION_CORPORAL FROM EVE_PARTO_MASIVO WHERE ID_EVENTO=:PARTO INTO :CONDICION_CORPORAL;
          IF (CONDICION_CORPORAL IS NOT NULL) THEN
          BEGIN
               SELECT  VALOR FROM REL_PARAMETROS_ESTABLECIMIENTO WHERE (ESTABLECIMIENTO = :ESTABLECIMIENTO) AND (PARAMETRO = 3) INTO :CC;
               IF (CC = 5) THEN
                  SELECT  VALOR_ESCALA_5 FROM COD_CONDICIONES_CORPORALES WHERE ID_CONDICION_CORPORAL = :CONDICION_CORPORAL INTO :CONDICION_CORPORAL;
               ELSE
                   SELECT  VALOR_ESCALA_10 FROM COD_CONDICIONES_CORPORALES WHERE ID_CONDICION_CORPORAL = :CONDICION_CORPORAL INTO :CONDICION_CORPORAL;
          END
          AREA_PELVICA = NULL;
          EVAL_PRESERV = NULL;
          SELECT FIRST 1 ID_EVENTO FROM EVE_EVENTOS WHERE ANIMAL=:MADRE AND TIPO=17 AND FECHA < :FECHA_PARTO
          ORDER BY FECHA DESC INTO :EVAL_PRESERV;
          IF (EVAL_PRESERV IS NOT NULL) THEN
          BEGIN
               SELECT  ALTO_PELVIS*ANCHO_PELVIS FROM EVE_EVALUACION_PRESERVICIO WHERE ID_EVENTO=:EVAL_PRESERV
               INTO :AUX_AREAP;
               IF (AUX_AREAP < 120) THEN AREA_PELVICA = '< 120 cm2';
               IF (AUX_AREAP BETWEEN 120 AND 130) THEN AREA_PELVICA = '120-130 cm2';
               IF (AUX_AREAP BETWEEN 130 AND 140) THEN AREA_PELVICA = '130-140 cm2';
               IF (AUX_AREAP BETWEEN 140 AND 150) THEN AREA_PELVICA = '140-150 cm2';
               IF (AUX_AREAP BETWEEN 150 AND 160) THEN AREA_PELVICA = '150-160 cm2';
               IF (AUX_AREAP BETWEEN 160 AND 170) THEN AREA_PELVICA = '160-170 cm2';
               IF (AUX_AREAP BETWEEN 170 AND 180) THEN AREA_PELVICA = '170-180 cm2';
               IF (AUX_AREAP BETWEEN 180 AND 190) THEN AREA_PELVICA = '180-190 cm2';
               IF (AUX_AREAP BETWEEN 190 AND 200) THEN AREA_PELVICA = '190-200 cm2';
               IF (AUX_AREAP > 200) THEN AREA_PELVICA = '> 200 cm2';
          END
          AUX_TIPO_REG = NULL;
          AUX_RAZA = NULL;
          VIVO = NULL;
          PESO_NACIMIENTO_1 = NULL;
          SEXO_1 = NULL;
          MUERTO_7DIAS = NULL;
          MUERTO_7DIAS_DESPUES = NULL;
          MUERTO_NACER = NULL;
          CANTIDAD = 1;
          OBSERVACION = NULL;
          HIJO = NULL;
          RP = NULL;
          MADREBIOLOGICAINTERNA = NULL;
          MADRERECEPTORAINTERNA = NULL;
          VCRIADOR = NULL;
          NOMBRE = NULL;
          VCOLOR = NULL;
          OBSERVACION = NULL;
          FOR SELECT  TA.ID_ANIMAL, TA.ID_RP, EN.VIVO, TA.MADRE_BIOLOGICA_INTERNA, TA.MADRE_RECEPTORA_INTERNA, TA.CRIADOR, TA.NOMBRE, TA.COLOR, TA.SUBCATEGORIA, TA.RAZA, EE.OBSERVACION
              FROM TAB_ANIMALES TA JOIN EVE_EVENTOS EE ON EE.ANIMAL=TA.ID_ANIMAL
              JOIN EVE_NACIMIENTO EN ON EE.ID_EVENTO = EN.ID_EVENTO WHERE EE.ESTABLECIMIENTO=:ESTABLECIMIENTO AND
              EE.FECHA=:FECHA_PARTO AND (TA.MADRE_BIOLOGICA_INTERNA=:MADRE or (TA.MADRE_RECEPTORA_INTERNA=:MADRE))
              INTO :HIJO, :RP, :VIVO, :MADREBIOLOGICAINTERNA, :MADRERECEPTORAINTERNA, :VCRIADOR, :NOMBRE, :VCOLOR, :AUX_TIPO_REG, :AUX_RAZA, :OBSERVACION
          DO
          BEGIN
          
               NRO_REG_ASOC_M = '';
               NRO_REG_ASOC_P = '';
          
               if (:MADRERECEPTORAINTERNA IS NOT NULL) then
                  SELECT  TA.ID_ANIMAL, TA.RAZA, TA.FRAME, TA.ID_HBA, TA.ID_RP, TA.NOMBRE
                  FROM TAB_ANIMALES TA
                  WHERE TA.ESTABLECIMIENTO = :ESTABLECIMIENTO AND TA.ID_ANIMAL = :MADREBIOLOGICAINTERNA
                  INTO :MADRE, :ID_RAZA, :AUX_FRAME, :HBAMADRE, :RPMADRE, :NOMBRE_MADRE;
               IF (CANTIDAD = 1) THEN
               BEGIN
                    SELECT PADRE_INTERNO FROM TAB_ANIMALES WHERE ID_ANIMAL=:HIJO AND ESTABLECIMIENTO = :ESTABLECIMIENTO INTO :PADRE;
                    IF (PADRE IS NULL) THEN
                    BEGIN
                         SELECT PADRE_EXTERNO FROM TAB_ANIMALES WHERE ID_ANIMAL=:HIJO AND ESTABLECIMIENTO = :ESTABLECIMIENTO INTO :PADRE;
                         IF (PADRE IS NULL) THEN
                         BEGIN
                              SELECT COUNT(*) FROM REL_PADRES_EXTERNOS WHERE ANIMAL=:HIJO AND ESTABLECIMIENTO=:ESTABLECIMIENTO INTO :CANT;
                              IF (CANT > 1) THEN
                                 BEGIN
                                   NOMBRE_PADRE = 'MULTIPLES';
                                   RPPADRE = NULL;
                                   HBAPADRE = NULL;
                                 END
                              ELSE
                                 BEGIN
                                  IF (CANT = 0) THEN
                                     BEGIN
                                       SELECT COUNT(*) FROM REL_PADRES_INTERNOS WHERE ANIMAL=:HIJO AND ESTABLECIMIENTO=:ESTABLECIMIENTO INTO :CANT;
                                       IF (CANT > 1) THEN
                                          begin
                                            NOMBRE_PADRE = 'MULTIPLES';
                                            RPPADRE = NULL;
                                            HBAPADRE = NULL;
                                          end
                                       ELSE
                                         BEGIN
                                            IF (CANT = 0) THEN
                                               begin
                                                 NOMBRE_PADRE = NULL;
                                                 RPPADRE = NULL;
                                                 HBAPADRE = NULL;
                                               end
                                             ELSE
                                                SELECT  TA.ID_ANIMAL, TA.NOMBRE, TA.ID_RP, TA.ID_HBA FROM REL_PADRES_INTERNOS RPI JOIN TAB_ANIMALES TA ON RPI.PADRE_INTERNO=TA.ID_ANIMAL
                                                WHERE RPI.ANIMAL = :HIJO AND RPI.ESTABLECIMIENTO = :ESTABLECIMIENTO INTO :PADRE, :NOMBRE_PADRE, :RPPADRE, :HBAPADRE;
                                         END
                                     END
                                   ELSE
                                      SELECT  TAE.NOMBRE, TAE.ID_RP, TAE.ID_HBA FROM REL_PADRES_EXTERNOS RPE JOIN TAB_ANIMALES_EXTERNOS TAE ON RPE.PADRE_EXTERNO=TAE.ID_ANIMAL_EXTERNO/* AND RPE.ESTABLECIMIENTO = TAE.ESTABLECIMIENTO*/
                                      WHERE RPE.ANIMAL = :HIJO AND RPE.ESTABLECIMIENTO = :ESTABLECIMIENTO INTO :NOMBRE_PADRE, :RPPADRE, :HBAPADRE;
                                 END

                        END
                       ELSE
                             SELECT NOMBRE, ID_RP, ID_HBA FROM TAB_ANIMALES_EXTERNOS WHERE ID_ANIMAL_EXTERNO = :PADRE /*AND ESTABLECIMIENTO = :ESTABLECIMIENTO*/ INTO :NOMBRE_PADRE, :RPPADRE, :HBAPADRE;
                    END
                    ELSE
                        SELECT  NOMBRE, ID_RP, ID_HBA FROM TAB_ANIMALES WHERE ID_ANIMAL = :PADRE AND ESTABLECIMIENTO = :ESTABLECIMIENTO INTO :NOMBRE_PADRE, :RPPADRE, :HBAPADRE;
---- iNICIO DE REPA FECHA SERVICIO 23/11

     IF (:PADRE IS NULL) THEN SELECT FIRST 1 ID_ANIMAL FROM TAB_ANIMALES WHERE ID_RP=:RPPADRE
       and  ESTABLECIMIENTO = :ESTABLECIMIENTO
        INTO :PADRE ;
  
       SELECT fecha from GET_DATOS_SERVICIO (:padre,:madre,:fecha_pos_servicio_desde,:fecha_pos_servicio_hasta,:establecimiento)
        into
        :FECHA_SERVICIO_REG ;
  
            DIAI = EXTRACT(DAY FROM FECHA_SERVICIO_REG);
            MESI = EXTRACT(MONTH FROM FECHA_SERVICIO_REG);
            ANIOI = EXTRACT(YEAR FROM FECHA_SERVICIO_REG);

                    SELECT ta.PESONACER, cs.tipo, ta.FECHA_NACIMIENTO, CTS.NOMBRE
                    FROM TAB_ANIMALES ta join cod_sexos cs on ta.sexo = cs.id_sexo join
                         cod_tipos_sexo cts on cs.tipo = cts.id_tipo_sexo
                    WHERE ta.ID_ANIMAL=:HIJO
                    INTO :PESO_NACIMIENTO_1, :SEXO_1, :FECHA_NACIMIENTO, :NOMBRESEXO;
                    PESO_NACIMIENTO_PROM = PESO_NACIMIENTO_1;
                    FECHA_NAC = FECHA_NACIMIENTO;
                    
                    DIAF = EXTRACT(DAY FROM FECHA_NAC);
                    MESF = EXTRACT(MONTH FROM FECHA_NAC);
                    ANIOF = EXTRACT(YEAR FROM FECHA_NAC);
                    
                    IF (VCOLOR = 0) THEN COLOR = 0;
                    IF (VCOLOR = 1) THEN COLOR = 7;
                    IF (VCOLOR = 2) THEN COLOR = 6;


                    IF (VIVO = 'S') THEN
                    BEGIN
                         FECHA_7DIAS = FECHA_NACIMIENTO + 7;
                         IF (EXISTS(SELECT EE.ID_EVENTO FROM EVE_EVENTOS EE JOIN EVE_BAJA EB ON EE.ID_EVENTO = EB.ID_EVENTO
                                    WHERE EE.ANIMAL = :HIJO AND EB.TIPO = 3 AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO
                                    AND EE.FECHA < :FECHA_7DIAS)) THEN
                         BEGIN
                              MUERTO_7DIAS = 'S';
                              MUERTO_7DIAS_DESPUES = 'N';
                              MUERTO_NACER = 'N';
                         END
                         ELSE
                         BEGIN
                              IF (EXISTS(SELECT EE.ID_EVENTO FROM EVE_EVENTOS EE JOIN EVE_BAJA EB ON EE.ID_EVENTO = EB.ID_EVENTO
                                    WHERE EE.ANIMAL = :HIJO AND EB.TIPO = 3 AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO
                                    AND EE.FECHA >= :FECHA_7DIAS)) THEN
                              BEGIN
                                   MUERTO_7DIAS = 'N';
                                   MUERTO_7DIAS_DESPUES = 'S';
                                   MUERTO_NACER = 'N';
                              END
                              ELSE
                              BEGIN
                                   MUERTO_7DIAS = 'N';
                                   MUERTO_7DIAS_DESPUES = 'N';
                                   MUERTO_NACER = 'N';
                              END
                         END
                    END
                    ELSE
                    BEGIN
                        MUERTO_7DIAS = 'N';
                        MUERTO_7DIAS_DESPUES = 'N';
                        MUERTO_NACER = 'S';
                    END
                    
                  IF (MUERTO_7DIAS = 'S') THEN
                  BEGIN
                       CRIA = 'B';
                  END
                  ELSE
                  BEGIN
                       IF (MUERTO_7DIAS_DESPUES = 'S') THEN
                       BEGIN
                            CRIA = 'C';
                       END
                       ELSE
                       BEGIN
                            IF (MUERTO_NACER = 'S') THEN
                            BEGIN
                                 CRIA = 'A';
                            END
                            ELSE
                            BEGIN
                                 CRIA = '';
                            END
                       END
                  END
                  
                  IF (SEXO_1 = 3) THEN MELLIZO = 1;
                  IF (SEXO_1 = 4) THEN MELLIZO = 2;
                  IF (SEXO_1 = 7) THEN MELLIZO = 3;
                  IF (SEXO_1 = 8) THEN MELLIZO = 4;
                  IF (SEXO_1 = 10) THEN MELLIZO = 5;

                  IF (VCRIADOR IS NOT NULL) THEN
                  BEGIN
                       SELECT  PREFIJO FROM COD_CRIADOR WHERE ID_CRIADOR = :VCRIADOR
                       INTO :PREFIJO;
                  END

                  IF ((HBAMADRE IS NULL) OR (HBAMADRE = '')) THEN
                      NRO_REG_ASOC_M = RPMADRE;
                      
                  IF ((HBAPADRE IS NULL) OR (HBAPADRE = '')) THEN
                  BEGIN
                      NRO_REG_ASOC_P = RPPADRE;
                  END

                  IF (NOMBRE_PADRE = 'MULTIPLES') THEN
                  BEGIN
                       RPPADRE = 'MULTIPLES';
                  END


                ORDEN = ORDEN + 1;
                if (ORDEN = 5) then
                  ORDEN = 1;
                  
                IF (TIPOREG IS NULL) THEN
                BEGIN
                   IF (RAZA_A IS NULL) THEN
                   BEGIN
                      SUSPEND;
                   END
                   ELSE
                   BEGIN
                        IF (RAZA_A = :AUX_RAZA) THEN
                           SUSPEND;
                   END
                END
                ELSE
                BEGIN
                     IF (RAZA_A IS NULL) THEN
                     BEGIN
                        IF (TIPOREG = :AUX_TIPO_REG) THEN
                        BEGIN
                           SUSPEND;
                        END
                     END
                     ELSE
                     BEGIN
                          IF ((RAZA_A = :AUX_RAZA) AND (TIPOREG = :AUX_TIPO_REG)) THEN
                          BEGIN
                               SUSPEND;
                          END
                     END
                END

               END
               IF (CANTIDAD = 2) THEN
               BEGIN
                  SELECT  ta.PESONACER, CS.TIPO, ta.FECHA_NACIMIENTO, CTS.NOMBRE
                  FROM TAB_ANIMALES ta join cod_sexos cs on ta.sexo = cs.id_sexo join
                       cod_tipos_sexo cts on cs.tipo = cts.id_tipo_sexo
                  WHERE TA.ID_ANIMAL=:HIJO AND ESTABLECIMIENTO = :ESTABLECIMIENTO
                  INTO :PESO_NACIMIENTO_1, :SEXO_1, :FECHA_NACIMIENTO, :NOMBRESEXO;
                  FECHA_NAC = FECHA_NACIMIENTO;
                  
                  IF (VCOLOR = 0) THEN COLOR = 0;
                  IF (VCOLOR = 1) THEN COLOR = 7;
                  IF (VCOLOR = 2) THEN COLOR = 6;
                  
                  DIAF = EXTRACT(DAY FROM FECHA_NAC);
                  MESF = EXTRACT(MONTH FROM FECHA_NAC);
                  ANIOF = EXTRACT(YEAR FROM FECHA_NAC);
                  
                  IF (VIVO = 'S') THEN
                  BEGIN
                       FECHA_7DIAS = FECHA_NACIMIENTO + 7;

                       IF (EXISTS(SELECT EE.ID_EVENTO FROM EVE_EVENTOS EE JOIN EVE_BAJA EB ON EE.ID_EVENTO = EB.ID_EVENTO
                          WHERE EE.ANIMAL = :HIJO AND EB.TIPO = 3 AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO
                          AND EE.FECHA < :FECHA_7DIAS)) THEN
                       BEGIN
                            MUERTO_7DIAS = 'S';
                            MUERTO_7DIAS_DESPUES = 'N';
                            MUERTO_NACER = 'N';
                       END
                       ELSE
                       BEGIN
                            IF (EXISTS(SELECT EE.ID_EVENTO FROM EVE_EVENTOS EE JOIN EVE_BAJA EB ON EE.ID_EVENTO = EB.ID_EVENTO
                               WHERE EE.ANIMAL = :HIJO AND EB.TIPO = 3 AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO
                               AND EE.FECHA >= :FECHA_7DIAS)) THEN
                            BEGIN
                                 MUERTO_7DIAS = 'N';
                                 MUERTO_7DIAS_DESPUES = 'S';
                                 MUERTO_NACER = 'N';
                            END
                            ELSE
                            BEGIN
                                 MUERTO_7DIAS = 'N';
                                 MUERTO_7DIAS_DESPUES = 'N';
                                 MUERTO_NACER = 'N';
                            END
                       END
                  END
                  ELSE
                  BEGIN
                       MUERTO_7DIAS = 'N';
                       MUERTO_7DIAS_DESPUES = 'N';
                       MUERTO_NACER = 'S';
                  END
                  IF (PESO_NACIMIENTO_1 IS NOT NULL) THEN
                     PESO_NACIMIENTO_PROM = (PESO_NACIMIENTO_PROM + PESO_NACIMIENTO_1) / 2;

                  IF (MUERTO_7DIAS = 'S') THEN
                  BEGIN
                       CRIA = 'B';
                  END
                  ELSE
                  BEGIN
                       IF (MUERTO_7DIAS_DESPUES = 'S') THEN
                       BEGIN
                            CRIA = 'C';
                       END
                       ELSE
                       BEGIN
                            IF (MUERTO_NACER = 'S') THEN
                            BEGIN
                                 CRIA = 'A';
                            END
                            ELSE
                            BEGIN
                                 CRIA = '';
                            END
                       END
                  END
                  IF (SEXO_1 = 3) THEN MELLIZO = 1;
                  IF (SEXO_1 = 4) THEN MELLIZO = 2;
                  IF (SEXO_1 = 7) THEN MELLIZO = 3;
                  IF (SEXO_1 = 8) THEN MELLIZO = 4;
                  IF (SEXO_1 = 10) THEN MELLIZO = 5;

                  IF (VCRIADOR IS NOT NULL) THEN
                  BEGIN
                       SELECT  PREFIJO FROM COD_CRIADOR WHERE ID_CRIADOR = :VCRIADOR
                       INTO :PREFIJO;
                  END

                  IF ((HBAMADRE IS NULL) OR (HBAMADRE = '')) THEN
                     NRO_REG_ASOC_M = RPMADRE;
                     
                  IF ((HBAPADRE IS NULL) OR (HBAPADRE = '')) THEN
                  BEGIN
                      NRO_REG_ASOC_P = RPPADRE;
                  END
                  
                  IF (NOMBRE_PADRE = 'MULTIPLES') THEN
                  BEGIN
                       RPPADRE = 'MULTIPLES';
                  END


                ORDEN = ORDEN + 1;
                if (ORDEN = 5) then
                  ORDEN = 1;
                  
                IF (TIPOREG IS NULL) THEN
                BEGIN
                   IF (RAZA_A IS NULL) THEN
                   BEGIN
                      SUSPEND;
                   END
                   ELSE
                   BEGIN
                        IF (RAZA_A = :AUX_RAZA) THEN
                           SUSPEND;
                   END
                END
                ELSE
                BEGIN
                     IF (RAZA_A IS NULL) THEN
                     BEGIN
                        IF (TIPOREG = :AUX_TIPO_REG) THEN
                        BEGIN
                           SUSPEND;
                        END
                     END
                     ELSE
                     BEGIN
                          IF ((RAZA_A = :AUX_RAZA) AND (TIPOREG = :AUX_TIPO_REG)) THEN
                          BEGIN
                               SUSPEND;
                          END
                     END
                END

               END
               IF (CANTIDAD = 3) THEN
               BEGIN
                  SELECT  TA.PESONACER, TA.SEXO, TA.FECHA_NACIMIENTO, CTS.NOMBRE
                  FROM TAB_ANIMALES ta join cod_sexos cs on ta.sexo = cs.id_sexo join
                         cod_tipos_sexo cts on cs.tipo = cts.id_tipo_sexo
                  WHERE TA.ID_ANIMAL=:HIJO AND TA.ESTABLECIMIENTO = :ESTABLECIMIENTO
                  INTO :PESO_NACIMIENTO_1, :SEXO_1, :FECHA_NACIMIENTO, :NOMBRESEXO;
                  FECHA_NAC = FECHA_NACIMIENTO;
                  
                  IF (VCOLOR = 0) THEN COLOR = 0;
                  IF (VCOLOR = 1) THEN COLOR = 7;
                  IF (VCOLOR = 2) THEN COLOR = 6;
                  
                  DIAF = EXTRACT(DAY FROM FECHA_NAC);
                  MESF = EXTRACT(MONTH FROM FECHA_NAC);
                  ANIOF = EXTRACT(YEAR FROM FECHA_NAC);

                  IF (VIVO = 'S') THEN
                  BEGIN
                       FECHA_7DIAS = FECHA_NACIMIENTO + 7;

                       IF (EXISTS(SELECT EE.ID_EVENTO FROM EVE_EVENTOS EE JOIN EVE_BAJA EB ON EE.ID_EVENTO = EB.ID_EVENTO
                          WHERE EE.ANIMAL = :HIJO AND EB.TIPO = 3 AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO
                          AND EE.FECHA < :FECHA_7DIAS)) THEN
                       BEGIN
                            MUERTO_7DIAS = 'S';
                            MUERTO_7DIAS_DESPUES = 'N';
                            MUERTO_NACER = 'N';
                       END
                       ELSE
                       BEGIN
                            IF (EXISTS(SELECT EE.ID_EVENTO FROM EVE_EVENTOS EE JOIN EVE_BAJA EB ON EE.ID_EVENTO = EB.ID_EVENTO
                               WHERE EE.ANIMAL = :HIJO AND EB.TIPO = 3 AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO
                               AND EE.FECHA >= :FECHA_7DIAS)) THEN
                            BEGIN
                                 MUERTO_7DIAS = 'N';
                                 MUERTO_7DIAS_DESPUES = 'S';
                                 MUERTO_NACER = 'N';
                            END
                            ELSE
                            BEGIN
                                 MUERTO_7DIAS = 'N';
                                 MUERTO_7DIAS_DESPUES = 'N';
                                 MUERTO_NACER = 'N';
                            END
                       END
                  END
                  ELSE
                  BEGIN
                       MUERTO_7DIAS = 'N';
                       MUERTO_7DIAS_DESPUES = 'N';
                       MUERTO_NACER = 'S';
                  END
                  IF (PESO_NACIMIENTO_1 IS NOT NULL) THEN
                     PESO_NACIMIENTO_PROM = (PESO_NACIMIENTO_PROM + PESO_NACIMIENTO_1) / 3;

                  IF (MUERTO_7DIAS = 'S') THEN
                  BEGIN
                       CRIA = 'B';
                  END
                  ELSE
                  BEGIN
                       IF (MUERTO_7DIAS_DESPUES = 'S') THEN
                       BEGIN
                            CRIA = 'C';
                       END
                       ELSE
                       BEGIN
                            IF (MUERTO_NACER = 'S') THEN
                            BEGIN
                                 CRIA = 'A';
                            END
                            ELSE
                            BEGIN
                                 CRIA = '';
                            END
                       END
                  END
                  
                  IF (SEXO_1 = 3) THEN MELLIZO = 1;
                  IF (SEXO_1 = 4) THEN MELLIZO = 2;
                  IF (SEXO_1 = 7) THEN MELLIZO = 3;
                  IF (SEXO_1 = 8) THEN MELLIZO = 4;
                  IF (SEXO_1 = 10) THEN MELLIZO = 5;
                   
                  IF (VCRIADOR IS NOT NULL) THEN
                  BEGIN
                       SELECT PREFIJO FROM COD_CRIADOR WHERE ID_CRIADOR = :VCRIADOR
                       INTO :PREFIJO;
                  END

                  IF ((HBAMADRE IS NULL) OR (HBAMADRE = '')) THEN
                     NRO_REG_ASOC_M = RPMADRE;
                     
                  IF ((HBAPADRE IS NULL) OR (HBAPADRE = '')) THEN
                  BEGIN
                      NRO_REG_ASOC_P = RPPADRE;
                  END
                  
                  IF (NOMBRE_PADRE = 'MULTIPLES') THEN
                  BEGIN
                       RPPADRE = 'MULTIPLES';
                  END


               ORDEN = ORDEN + 1;
               if (ORDEN = 5) then
                 ORDEN = 1;
                IF (TIPOREG IS NULL) THEN
                BEGIN
                   IF (RAZA_A IS NULL) THEN
                   BEGIN
                      SUSPEND;
                   END
                   ELSE
                   BEGIN
                        IF (RAZA_A = :AUX_RAZA) THEN
                           SUSPEND;
                   END
                END
                ELSE
                BEGIN
                     IF (RAZA_A IS NULL) THEN
                     BEGIN
                        IF (TIPOREG = :AUX_TIPO_REG) THEN
                        BEGIN
                           SUSPEND;
                        END
                     END
                     ELSE
                     BEGIN
                          IF ((RAZA_A = :AUX_RAZA) AND (TIPOREG = :AUX_TIPO_REG)) THEN
                          BEGIN
                               SUSPEND;
                          END
                     END
                END

               END
               CANTIDAD = CANTIDAD+1;
         END
         END
         -- SUSPEND
      END

END
ELSE
BEGIN
   ORDEN = 0;
   WHILE (ORDEN < 2) DO
   BEGIN
        ORDEN = ORDEN + 1;

        RP = NULL;
        ID_RODEO = NULL;
        ROD = NULL;
        ID_POTRERO = NULL;
        POT = NULL;
        GRADO_DISTOCIA = NULL;
        CONDICION_CORPORAL = NULL;
        RAZA = NULL;
        FRAME = NULL;
        AREA_PELVICA = NULL;
        PESO_NACIMIENTO_1 = NULL;
        SEXO_1 = NULL;
        PESO_NACIMIENTO_PROM = NULL;
        NOMBRE_PADRE = NULL;
        NOMBRE_MADRE = NULL;
        MUERTO_7DIAS = NULL;
        MUERTO_7DIAS_DESPUES = NULL;
        FECHA_NAC = NULL;
        NOMBRESEXO = NULL;
        RPMADRE = NULL;
        HBAMADRE = NULL;
        RPPADRE = NULL;
        HBAPADRE = NULL;
        MUERTO_NACER = NULL;
        CAUSA_DISTOCIA = NULL;
        ID_GRADO_DISTOCIA = NULL;
        ID_CAUSA_DISTOCIA = NULL;
        ID_CODIGO_DISTOCIA = NULL;
        HIJO = NULL;
        MADRE = NULL;
        PADRE = NULL;
        OBSERVACION = NULL;
        FECHA_SERVICIO_REG = NULL;
        SUSPEND;
    END
END
END;