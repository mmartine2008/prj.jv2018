set terminator !! ;

CREATE PROCEDURE REP_INFO_PESADAS_MANGA(
  ESTABLECIMIENTO INTEGER,
  IDAUXPE INTEGER,
  GRUPO INTEGER,
  DESDE DATE,
  HASTA DATE)
RETURNS(
  ANIMAL INTEGER,
  IDRP VARCHAR(10) CHARACTER SET NONE,
  NOMBREANIMAL VARCHAR(100) CHARACTER SET NONE,
  CATEGORIA INTEGER,
  POTRERO INTEGER,
  EDAD INTEGER,
  PESO DOUBLE PRECISION)
AS
DECLARE VARIABLE S1 VARCHAR(255);
DECLARE VARIABLE S2 VARCHAR(255);
DECLARE VARIABLE S3 VARCHAR(255);
DECLARE VARIABLE S4 VARCHAR(255);
DECLARE VARIABLE S5 VARCHAR(255);
DECLARE VARIABLE SA1 VARCHAR(255);
DECLARE VARIABLE SA2 VARCHAR(255);
DECLARE VARIABLE SA3 VARCHAR(255);
DECLARE VARIABLE SA4 VARCHAR(255);
DECLARE VARIABLE CANTPESADAS INTEGER;
DECLARE VARIABLE GRUPOAUX INTEGER;
DECLARE VARIABLE GRUPOAUX2 INTEGER;
DECLARE VARIABLE FECHA_NACIMIENTO DATE;
DECLARE VARIABLE FECHA_PESO DATE;
BEGIN

    /*
     S1 = 'SELECT EE.ANIMAL ';
     S2 = 'FROM EVE_EVENTOS EE JOIN EVE_PESO EP ON (EE.ID_EVENTO = EP.ID_EVENTO) JOIN TAB_ANIMALES TA ON EE.ANIMAL = TA.ID_ANIMAL ';
     S3 = 'WHERE (EE.TIPO = 25) AND (TA.ESTABLECIMIENTO = '||ESTABLECIMIENTO||') ';
     IF (DESDE IS NOT NULL) THEN
        S4 = 'AND EE.FECHA BETWEEN '''||CAST(DESDE AS VARCHAR(10))||''' AND '''||CAST(HASTA AS VARCHAR(10))||'''';
     ELSE
         S4 = '';
     S5 = ' GROUP BY EE.ANIMAL HAVING COUNT(EE.ANIMAL)>=2';
     
     FOR EXECUTE STATEMENT S1||S2||S3||S4||S5
     */
     FOR SELECT EE.ANIMAL
     FROM EVE_EVENTOS EE JOIN EVE_PESO EP ON (EE.ID_EVENTO = EP.ID_EVENTO) JOIN TAB_ANIMALES TA ON EE.ANIMAL = TA.ID_ANIMAL
     WHERE (EE.TIPO = 25) AND (TA.ESTABLECIMIENTO = :ESTABLECIMIENTO)
     AND (:DESDE IS NULL OR (EE.FECHA BETWEEN :DESDE AND :HASTA))
     GROUP BY EE.ANIMAL
     --HAVING COUNT(EE.ANIMAL)>=2
     
         INTO :ANIMAL
     DO
     BEGIN
         FOR SELECT A.ID_RP,A.NOMBRE, A.FECHA_NACIMIENTO, A.POTRERO, A.CATEGORIA
              FROM TAB_ANIMALES A
              WHERE A.ID_ANIMAL NOT IN (SELECT AA.ID_ANIMAL
                                        FROM AUX_ANIMALES AA
                                        WHERE (AA.ID_AUX=:IDAUXPE)) AND
                    A.ESTABLECIMIENTO=:ESTABLECIMIENTO AND
                    A.ID_ANIMAL = :ANIMAL
              INTO :IDRP, :NOMBREANIMAL, :FECHA_NACIMIENTO, :POTRERO, :CATEGORIA
         DO
              BEGIN
                   SA1 = 'SELECT FIRST 1 EP.PESO, EE.FECHA FROM EVE_EVENTOS EE JOIN EVE_PESO EP ON EE.ID_EVENTO= EP.ID_EVENTO ';
                   SA2 = 'WHERE EE.ANIMAL = '||ANIMAL||' ';
                   IF (DESDE IS NOT NULL) THEN
                      SA3 = 'AND EE.FECHA BETWEEN '''||CAST(DESDE AS VARCHAR(10))||''' AND '''||CAST(HASTA AS VARCHAR(10))||'''';
                   ELSE
                       SA3 = ' ';
                   S4 = ' ORDER BY EP.PESO DESC';

                   EXECUTE STATEMENT SA1||SA2||SA3||S4 INTO :PESO,:FECHA_PESO;
                   
                   IF (DESDE IS NOT NULL) THEN
                      EDAD = (FECHA_PESO - FECHA_NACIMIENTO)/30;
                   ELSE
                       EDAD = (CURRENT_DATE - FECHA_NACIMIENTO)/30;

                   GRUPOAUX = NULL;
                   GRUPOAUX2 = NULL;
                   IF (GRUPO IS NOT NULL) THEN
                   BEGIN
                        SELECT DISTINCT RGE.GRUPO
                        FROM REL_GRUPOS_EVENTO RGE, EVE_EVENTOS EE
                        WHERE(EE.ANIMAL=:ANIMAL AND EE.ESTABLECIMIENTO=:ESTABLECIMIENTO AND
                              EE.ID_EVENTO=RGE.EVENTO AND RGE.ESTABLECIMIENTO=EE.ESTABLECIMIENTO AND
                              RGE.GRUPO = :GRUPO)
                        INTO :GRUPOAUX;
                        SELECT DISTINCT RPG.GRUPO
                        FROM REL_PERTENECE_GRUPO RPG
                        WHERE(RPG.ANIMAL=:ANIMAL AND RPG.ESTABLECIMIENTO=:ESTABLECIMIENTO AND
                               RPG.ACTIVO='S' AND RPG.GRUPO = :GRUPO)
                        INTO :GRUPOAUX2;
                        IF ((:GRUPOAUX IS NOT NULL) OR (:GRUPOAUX2 IS NOT NULL))THEN
                           SUSPEND;
                   END
                   ELSE
                       SUSPEND;
              END
     END
END !!

