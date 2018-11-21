CREATE OR ALTER PROCEDURE GET_EXISTENCIA(
  ESTABLECIMIENTO INTEGER,
  ACTIVIDAD INTEGER,
  HASTA DATE,
  CON_PRECIO VARCHAR(1) CHARACTER SET NONE)
RETURNS(
  TOTALEXISTENCIA DECIMAL(18, 3),
  ANIMAL INTEGER,
  CATEGORIA VARCHAR(50) CHARACTER SET NONE,
  PESOCAMPO DOUBLE PRECISION,
  KILOSTOTAL DECIMAL(18, 3),
  PROMPESOCAMPO DECIMAL(18, 3),
  PRECIOUNITARIO DECIMAL(18, 3),
  PROMPRECIOUNITARIO DECIMAL(18, 3),
  IDCATEGORIA INTEGER,
  EQUIV FLOAT,
  GASTOS DECIMAL(18, 3))
AS
DECLARE VARIABLE TOTALPARCIALALTAS INTEGER;
DECLARE VARIABLE TOTALPARCIALNACIMIENTOS INTEGER;
DECLARE VARIABLE TOTALPARCIALBAJAS INTEGER;
DECLARE VARIABLE TOTALPARCIALALTASAUX INTEGER;
DECLARE VARIABLE TOTALPARCIALNACIMIENTOSAUX INTEGER;
DECLARE VARIABLE TOTALPARCIALBAJASAUX INTEGER;
DECLARE VARIABLE CAT_AUX INTEGER;
DECLARE VARIABLE AUX_PESO_CAMPO DOUBLE PRECISION;
DECLARE VARIABLE CANT_PESO_CAMPO INTEGER;
DECLARE VARIABLE AUXPRECIOUNITARIO FLOAT;
DECLARE VARIABLE CANTPRECIOUNITARIO INTEGER;
DECLARE VARIABLE DESDE DATE;
DECLARE VARIABLE AUXEQUIV FLOAT;
DECLARE VARIABLE CANTEQUIV INTEGER;
DECLARE VARIABLE SQLAUX_1 VARCHAR(255);
DECLARE VARIABLE SQLAUX_2 VARCHAR(255);
DECLARE VARIABLE SQLAUX_3 VARCHAR(255);
DECLARE VARIABLE SQLAUX_4 VARCHAR(255);
DECLARE VARIABLE SQLAUX_5 VARCHAR(255);
DECLARE VARIABLE AUXGASTOS FLOAT;
DECLARE VARIABLE ANIM INTEGER;
DECLARE VARIABLE AUX_CAT INTEGER;
DECLARE VARIABLE FECHABAJA DATE;
DECLARE VARIABLE FECHAALTA DATE;
DECLARE VARIABLE AUX_ACT VARCHAR(2);
DECLARE VARIABLE NROEVE INTEGER;
DECLARE VARIABLE NROEVEA INTEGER;
BEGIN

TOTALEXISTENCIA = 0;
TOTALPARCIALALTAS = 0;
TOTALPARCIALNACIMIENTOS = 0;
TOTALPARCIALBAJAS = 0;
EQUIV = 0;
AUXEQUIV = 0;
DESDE = NULL;
DESDE = :HASTA - 365;

FOR SELECT cc1.id_categoria, cc1.sinonimo, cc1.id_categoria FROM cod_categorias cc1
    INTO :CAT_AUX, :CATEGORIA, :IDCATEGORIA
DO
BEGIN
    EQUIV = 0;
    AUXEQUIV = 0;
    CANTEQUIV = 0;
    TOTALEXISTENCIA = 0;
    TOTALPARCIALALTAS = 0;
    TOTALPARCIALNACIMIENTOS = 0;
    TOTALPARCIALBAJAS = 0;
    AUX_PESO_CAMPO = 0;
    CANT_PESO_CAMPO = 0;
    PESOCAMPO = 0;
    PROMPESOCAMPO = 0;
    PRECIOUNITARIO = 0;
    PROMPRECIOUNITARIO = 0;
    AUXPRECIOUNITARIO = 0;
    CANTPRECIOUNITARIO = 0;
    GASTOS = 0;
    AUXGASTOS = 0;

 FOR SELECT DISTINCT  ee.animal from eve_eventos ee join tab_animales an on (ee.animal=an.id_animal)

        where  ee.tipo = 2 and ee.establecimiento = :ESTABLECIMIENTO and ee.fecha < :HASTA
		and an.activo = 'S'
        and an.categoria= :CAT_AUX
        INTO :ANIMAL   ---, :AUXPRECIOUNITARIO, :AUXGASTOS
    DO
    BEGIN
       ANIM = NULL;
       --VerIFico si esta dado de baja ese animal
       -- parche para que cuente el animal cuando entro, salio y volvio a entrar al establecimiento

    --- CAMBIADO POR LOS 2 SELECT ANTERIORES 06/03/2017 tERESA


       ANIM=NULL;
       SELECT FIRST 1 ee.animal FROM eve_eventos ee JOIN eve_baja eb ON (ee.id_evento = eb.id_evento)
       WHERE ee.tipo = 3 AND ee.establecimiento = :establecimiento AND ee.fecha < :HASTA AND EE.ANIMAL = :ANIMAL
       ORDER BY EE.FECHA DESC
       INTO :ANIM;
    ---- if ((:anim is not null) AND (:anim='3259')) then
      if (:anim is not null)  then
         BEGIN
         fechabaja=null;
         fechaalta=null;
         nroevea=0;
         nroeve=0;
          SELECT FIRST 1 ee.animal,ee.fecha, ee.id_evento FROM eve_eventos ee
           WHERE ee.tipo = 3 AND ee.establecimiento = :establecimiento AND ee.fecha < :HASTA AND EE.ANIMAL = :ANIM
           ORDER BY EE.FECHA DESC ,ee.id_evento desc
           INTO :ANIM , :fechabaja, nroeve;


          SELECT FIRST 1 ee.animal,ee.fecha, ead.precio_unitario ,ead.gastos,ee.id_evento
           FROM eve_eventos ee join eve_alta_directa ead on (ee.id_evento = ead.id_evento)
           WHERE ee.tipo = 2 AND ee.establecimiento = :establecimiento AND ee.fecha < :HASTA AND EE.ANIMAL = :ANIM
           ORDER BY EE.FECHA DESC, ee.id_evento DESC
           INTO :ANIM , :fechaalta,:AUXPRECIOUNITARIO, :AUXGASTOS, nroevea;
           --if ((fechaalta >= fechabaja or (fechaalta=fechabaja and nroevea > nroeve))  and (fechaalta is not null) and (fechabaja is not null)) THEN

            IF (nroevea> nroeve) then
               anim =null;
          end
------ se puso >= fechabaja 2104
       IF (:ANIM IS NULL) THEN --Si no esta dado de baja
       BEGIN
          AUX_CAT = -1;
          AUX_ACT = 'N';
       ---   SELECT TA.CATEGORIA, TA.ACTIVO FROM TAB_ANIMALES  TA WHERE TA.ID_ANIMAL = :ANIMAL AND TA.ESTABLECIMIENTO = :ESTABLECIMIENTO
       ---   INTO :AUX_CAT, :AUX_ACT;
       --- CONTROLABA X ESTABLECIMIENTO PERO NO DEBE PARA QUE TOME  EL STOCK EN ESA FECHA EN CASO DE CAMBIO DE ESTABLECIMIENTO
       --- Jose- Teresa 02-2017
         SELECT TA.CATEGORIA, TA.ACTIVO FROM TAB_ANIMALES  TA WHERE TA.ID_ANIMAL = :ANIMAL
         INTO :AUX_CAT, :AUX_ACT;

         --- IF ((:AUX_CAT = :CAT_AUX) AND (:AUX_ACT = 'S')) THEN
         -- SE QUITO CHEQUEO DE ACTIVO
          IF (:AUX_CAT = :CAT_AUX)  THEN
          BEGIN

              TOTALPARCIALALTAS = :TOTALPARCIALALTAS + 1;
              GASTOS = :AUXGASTOS;

              SELECT FIRST 1 ep.peso
              FROM eve_eventos ee1 JOIN eve_peso ep ON ee1.id_evento = ep.id_evento
              WHERE ee1.tipo = 25 AND ee1.fecha < :HASTA AND ee1.animal = :ANIMAL
              ORDER BY ee1.fecha DESC, ee1.id_evento DESC
              INTO :AUX_PESO_CAMPO;

              IF (:AUX_PESO_CAMPO <> 0) THEN
              BEGIN
                   PESOCAMPO = :PESOCAMPO + :AUX_PESO_CAMPO;
                   CANT_PESO_CAMPO = :CANT_PESO_CAMPO + 1;
              END

              IF (:AUXPRECIOUNITARIO <> 0) THEN
              BEGIN
                   PRECIOUNITARIO = :PRECIOUNITARIO + :AUXPRECIOUNITARIO;
                   CANTPRECIOUNITARIO = :CANTPRECIOUNITARIO + 1;
              END

              AUXEQUIV = 0;
              IF ((:CAT_AUX <> 1) AND (:CAT_AUX <> 4)) THEN
              BEGIN
                   SELECT PROMEV FROM GET_EQUIV_GAN_ANIMAL(:ESTABLECIMIENTO,:ANIMAL,:ACTIVIDAD,:DESDE,:HASTA)
                   INTO :AUXEQUIV;

                   IF (:AUXEQUIV <> 0) THEN
                   BEGIN
                        EQUIV = EQUIV + AUXEQUIV;
                        CANTEQUIV = CANTEQUIV + 1;
                   END
              END
          END
       END
    END

    --NACIMIENTOS
    /*SQLAUX_1 = 'SELECT ee.animal from eve_eventos ee join eve_nacimiento en on (ee.id_evento = en.id_evento)';
    SQLAUX_2 = ' join tab_animales ta on ee.animal = ta.id_animal';
    SQLAUX_3 = ' where  ee.tipo = 23 and ee.establecimiento = '||:establecimiento||' and ee.fecha < '''||CAST(:HASTA AS VARCHAR(10))||'''';
    SQLAUX_4 = ' and ta.categoria = '||:CAT_AUX||' and ta.categoria in (select id_animal_externo from aux_animales_externos)';
    FOR EXECUTE STATEMENT SQLAUX_1||SQLAUX_2||SQLAUX_3||SQLAUX_4||SQLAUX_5
        INTO :ANIMAL
    DO*/
    FOR SELECT ee.animal from eve_eventos ee join eve_nacimiento en on (ee.id_evento = en.id_evento)
        join tab_animales ta on ee.animal = ta.id_animal
        where
        ee.tipo = 23 and ee.establecimiento = :establecimiento and ee.fecha < :HASTA
        AND ta.activo = 'S'
        and ta.categoria = :CAT_AUX /*and ta.categoria in (select id_animal_externo from aux_animales_externos)*/
        INTO :ANIMAL
    DO
    BEGIN
       ANIM = NULL;

       SELECT FIRST 1 ee.animal FROM eve_eventos ee JOIN eve_baja eb ON (ee.id_evento = eb.id_evento)
       WHERE ee.tipo = 3 AND ee.establecimiento = :establecimiento AND ee.fecha < :HASTA AND EE.ANIMAL = :ANIMAL
       ORDER BY EE.FECHA DESC
       INTO :ANIM;

       IF (:ANIM IS NULL) THEN
       BEGIN

          SELECT TA.CATEGORIA, TA.ACTIVO FROM TAB_ANIMALES   TA WHERE TA.ID_ANIMAL = :ANIMAL
         ---- AND TA.ESTABLECIMIENTO = :ESTABLECIMIENTO
          INTO :AUX_CAT, :AUX_ACT;

         --- IF ((:AUX_CAT = :CAT_AUX) AND (:AUX_ACT = 'S')) THEN
         ---  SACAMOS AUX_ACT Y ESTABLECIMIENTO


        IF (:AUX_CAT = :CAT_AUX)  THEN
         BEGIN

               TOTALPARCIALNACIMIENTOS = :TOTALPARCIALNACIMIENTOS + 1;

               SELECT FIRST 1 ep.peso
               FROM eve_eventos ee1 JOIN eve_peso ep ON ee1.id_evento = ep.id_evento
               WHERE ee1.tipo = 25 AND ee1.fecha < :HASTA AND ee1.animal = :ANIMAL
               ORDER BY ee1.fecha DESC, ee1.id_evento DESC
               INTO :AUX_PESO_CAMPO;

               IF (:AUX_PESO_CAMPO <> 0) THEN
               BEGIN
                    PESOCAMPO = :PESOCAMPO + :AUX_PESO_CAMPO;
                    CANT_PESO_CAMPO = :CANT_PESO_CAMPO + 1;
               END

               AUXEQUIV = 0;

               IF ((:CAT_AUX <> 1) and (:CAT_AUX <> 4)) THEN
               BEGIN
                    SELECT PROMEV FROM GET_EQUIV_GAN_ANIMAL(:ESTABLECIMIENTO,:ANIMAL,:ACTIVIDAD,:DESDE,:HASTA)
                    INTO :AUXEQUIV;

                    IF (:AUXEQUIV <> 0) THEN
                    BEGIN
                         EQUIV = EQUIV + AUXEQUIV;
                         CANTEQUIV = CANTEQUIV + 1;
                    END
               END
        END
       END
    END

    IF (:CANT_PESO_CAMPO <> 0) THEN
      PROMPESOCAMPO = :PESOCAMPO / :CANT_PESO_CAMPO;

    IF (:CANTPRECIOUNITARIO <> 0) THEN
      PROMPRECIOUNITARIO = :PRECIOUNITARIO / :CANTPRECIOUNITARIO;

    TOTALEXISTENCIA = :TOTALEXISTENCIA + :TOTALPARCIALALTAS + :TOTALPARCIALNACIMIENTOS - :TOTALPARCIALBAJAS;
    KILOSTOTAL = :TOTALEXISTENCIA * :PROMPESOCAMPO;

    IF ((:CANTEQUIV) <> 0) THEN
       EQUIV = :EQUIV / (:CANTEQUIV);

    IF (CON_PRECIO = 'N') THEN
    BEGIN
     PRECIOUNITARIO = 0;
        PROMPRECIOUNITARIO = 0;
        GASTOS = 0;
    END

    SUSPEND;

END

END;