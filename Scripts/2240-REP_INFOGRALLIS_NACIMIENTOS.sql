SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_INFOGRALLIS_NACIMIENTOS(
  ESTABLECIMIENTO INTEGER,
  GRUPO INTEGER,
  INICIO DATE,
  FIN DATE,
  CANT_PARTOS INTEGER)
RETURNS(
  RP_MADRE VARCHAR(10) CHARACTER SET NONE,
  FECHA DATE,
  RESPONSABLE VARCHAR(85) CHARACTER SET NONE,
  TIPOPARTO VARCHAR(50) CHARACTER SET NONE,
  CAUSADISTOCIA VARCHAR(50) CHARACTER SET NONE,
  GRADOASISTENCIA VARCHAR(50) CHARACTER SET NONE,
  SEXO VARCHAR(20) CHARACTER SET NONE,
  VIVO VARCHAR(50) CHARACTER SET NONE,
  PESO DOUBLE PRECISION,
  RPNACIDO VARCHAR(10) CHARACTER SET NONE,
  SENASA VARCHAR(9) CHARACTER SET NONE,
  PC VARCHAR(10) CHARACTER SET NONE,
  HBA VARCHAR(10) CHARACTER SET NONE,
  RA VARCHAR(10) CHARACTER SET NONE,
  OTRO VARCHAR(10) CHARACTER SET NONE,
  CANTPARTOSNORMALES INTEGER,
  CANTPARTOSDISTOCICOS INTEGER,
  SEMANA INTEGER,
  DIA INTEGER,
  MES INTEGER,
  ANIO INTEGER,
  MODSEMANA INTEGER,
  POTRERO INTEGER,
  RODEO INTEGER,
  ID_ANIMAL INTEGER,
  ID_MADRE INTEGER,
  RANGOMES VARCHAR(10) CHARACTER SET NONE)
AS
DECLARE VARIABLE AUX_GRUPO INTEGER;
DECLARE VARIABLE AUX_TIPO INTEGER;
DECLARE VARIABLE TIPO_EVENTO INTEGER;
DECLARE VARIABLE AUX_EVENTO INTEGER;
DECLARE VARIABLE AUX_NACIMIENTO INTEGER;
DECLARE VARIABLE NACIDO INTEGER;
DECLARE VARIABLE SQLAUX_1 VARCHAR(255);
DECLARE VARIABLE SQLAUX_2 VARCHAR(255);
DECLARE VARIABLE SQLAUX_3 VARCHAR(255);
DECLARE VARIABLE SQLAUX_4 VARCHAR(255);
DECLARE VARIABLE SQLAUX_5 VARCHAR(255);
DECLARE VARIABLE SQLAUX_6 VARCHAR(255);
DECLARE VARIABLE SQLAUX_11 VARCHAR(255);
DECLARE VARIABLE SQLAUX_21 VARCHAR(255);
DECLARE VARIABLE SQLAUX_31 VARCHAR(255);
DECLARE VARIABLE SQLAUX_41 VARCHAR(255);
DECLARE VARIABLE SQLAUX_51 VARCHAR(255);
BEGIN
     IF (GRUPO IS NULL) THEN
      BEGIN
        SQLAUX_1 = 'select ta.id_rp, ta.id_animal, ee.fecha, te.nombre||'' ''||te.apellido, ee.tipo, ee.id_evento, ee.potrero, ee.rodeo';
        SQLAUX_2 = ' from eve_eventos ee join tab_animales ta on (ee.animal = ta.id_animal) join';
        SQLAUX_3 = ' tab_empleados te on (ee.responsable = te.id_empleado and ee.establecimiento = te.establecimiento)';
        SQLAUX_4 = ' where ((ee.tipo = 24) or (ee.tipo = 39)) and (ee.establecimiento = '||ESTABLECIMIENTO||') and EE.FECHA BETWEEN '''||CAST(INICIO AS VARCHAR(10))||''' AND '''||CAST(FIN AS VARCHAR(10))||'''';
        SQLAUX_5 = ' order by ee.fecha asc';
      END
     ELSE
      BEGIN
      
        select FIRST 1 RGE.GRUPO
        FROM TAB_GRUPOS TG JOIN REL_GRUPOS_EVENTO RGE ON TG.ID_GRUPO = RGE.GRUPO AND TG.ESTABLECIMIENTO = RGE.ESTABLECIMIENTO
        WHERE TG.ID_GRUPO = :GRUPO AND TG.ESTABLECIMIENTO = :ESTABLECIMIENTO
        INTO :aux_grupo;
      
        if (:aux_grupo is not null) then
          begin
            SQLAUX_1 = 'select ta.id_rp, ta.id_animal, ee.fecha, te.nombre||'' ''||te.apellido, ee.tipo, ee.id_evento, ee.potrero, ee.rodeo';
            SQLAUX_2 = ' from eve_eventos ee join tab_animales ta on (ee.animal = ta.id_animal) join';
            SQLAUX_3 = ' tab_empleados te on (ee.responsable = te.id_empleado and ee.establecimiento = te.establecimiento) JOIN REL_GRUPOS_EVENTO RGE ON RGE.EVENTO = EE.ID_EVENTO';
            SQLAUX_4 = ' where ((ee.tipo = 24) or (ee.tipo = 39)) and (ee.establecimiento = '||ESTABLECIMIENTO||') and ee.animal = ta.id_animal and EE.FECHA BETWEEN '''||CAST(INICIO AS VARCHAR(10))||''' AND '''||CAST(FIN AS VARCHAR(10))||''' AND RGE.GRUPO = '||GRUPO;
            SQLAUX_5 = ' order by ee.fecha asc';
          end
         else
           begin
              SQLAUX_1 = 'select ta.id_rp, ta.id_animal, ee.fecha, te.nombre||'' ''||te.apellido, ee.tipo, ee.id_evento, ee.potrero, ee.rodeo';
              SQLAUX_2 = ' from eve_eventos ee join tab_animales ta on (ee.animal = ta.id_animal) join';
              SQLAUX_3 = ' tab_empleados te on (ee.responsable = te.id_empleado and ee.establecimiento = te.establecimiento) JOIN REL_PERTENECE_GRUPO RPG ON RPG.ANIMAL = TA.ID_ANIMAL';
              SQLAUX_4 = ' where ((ee.tipo = 24) or (ee.tipo = 39)) and (ee.establecimiento = '||ESTABLECIMIENTO||') and EE.FECHA BETWEEN '''||CAST(INICIO AS VARCHAR(10))||''' AND '''||CAST(FIN AS VARCHAR(10))||''' AND RPG.GRUPO = '||GRUPO;
              SQLAUX_5 = ' order by ee.fecha asc';
           end
      END

     SQLAUX_6 = ' ';

      IF ((CANT_PARTOS >= 1) AND (CANT_PARTOS <= 3)) THEN
          SQLAUX_6 = 'and ta.estado_lactacion = '||CANT_PARTOS;
     
      if (CANT_PARTOS = 4) THEN
          SQLAUX_6 = 'and ta.estado_lactacion >= '||CANT_PARTOS;


      FOR EXECUTE STATEMENT SQLAUX_1||SQLAUX_2||SQLAUX_3||SQLAUX_4||SQLAUX_6||SQLAUX_5
      into :rp_madre, :id_madre, :fecha, :Responsable, :tipo_evento, :aux_evento, :POTRERO, :RODEO
      do
        begin
          CausaDistocia = '';
          GradoAsistencia = '';
          SEXO = NULL;
          VIVO = NULL;
          if (:tipo_evento = 24) then
            begin
             select ep.tipo from eve_parto ep where ep.id_evento = :aux_evento
             into :aux_tipo;
             
             SQLAUX_11 = 'ee.animal, ee.id_evento, cg.valor';
             SQLAUX_21 = ' from eve_eventos ee join eve_nacimiento en on (ee.id_evento = en.id_evento), cod_genericos cg';
             SQLAUX_31 = ' where (ee.establecimiento = '||ESTABLECIMIENTO||') and (ee.tipo = 23) and (ee.disparador = '||aux_evento||' or ee.tipo = 39) and';
             SQLAUX_41 = ' (cg.tipo = ''SN'') and (cg.id_codigo = en.vivo) AND (ee.FECHA <= '||''''||CAST(FECHA AS VARCHAR(10))||''''||')';
             SQLAUX_51 = '';
            end
           else
             if (:tipo_evento = 39) then
              begin
                select ep.tipo from eve_parto_masivo ep where ep.id_evento = :aux_evento
                into :aux_tipo;
                
                SQLAUX_11 = 'ee.animal, ee.id_evento, cg.valor';
                SQLAUX_21 = ' from eve_eventos ee join eve_nacimiento en on (ee.id_evento = en.id_evento) join';
                SQLAUX_31 = ' tab_grupos_parto tgp on (en.grupo = tgp.grupo and tgp.establecimiento = ee.establecimiento) join tab_grupos tg on (tgp.grupo = tg.id_grupo and tg.establecimiento = tgp.establecimiento) join';
                SQLAUX_41 = ' rel_grupos_evento rge on rge.grupo = tg.id_grupo join eve_eventos ee1 on rge.evento = ee1.id_evento, cod_genericos cg, tab_animales ta';
                SQLAUX_51 = ' where (ee.establecimiento = '||ESTABLECIMIENTO||') and (ee.tipo = 23) and (ee1.animal = '||id_madre||') and (ee1.tipo = 39) and (cg.tipo = ''SN'') and (cg.id_codigo = en.vivo) and ta.id_animal = ee.animal and ta.madre_biologica_interna = ee1.animal AND (ee.FECHA <= '||''''||CAST(FECHA AS VARCHAR(10))||''''||')';
              end

          DIA = EXTRACT (DAY FROM fecha);
          MES = EXTRACT (MONTH FROM fecha);
          ANIO = EXTRACT (YEAR FROM fecha);
          SELECT RANGO from rango_mes(:fecha)
          into :RANGOMES;

          -- recupero el tipo de parto
          select sinonimo from cod_tipos_parto where (id_tipo_parto = :aux_tipo)
          into :TipoParto;

          -- busco si tuvo distocia
          select ccd.sinonimo, cga.sinonimo
          from eve_eventos ee join eve_distocia ed on (ee.id_evento = ed.id_evento) join
               cod_grados_asistencia cga on (ed.grado_asistencia = cga.id_grado_asistencia) join
               cod_causas_distocia ccd on (ed.causa = ccd.id_causa_distocia)
          where (ee.tipo = 14) and (ee.establecimiento = :establecimiento) and (ee.disparador = :aux_evento)
          into :CausaDistocia, :GradoAsistencia;

          CANTPARTOSNORMALES = 0;
          CANTPARTOSDISTOCICOS = 0;
          if (:CausaDistocia = '') then
            begin
               CANTPARTOSNORMALES = 1;
            end
           else
               CANTPARTOSDISTOCICOS = 1;

          nacido = null;
          EXECUTE STATEMENT 'select first 1 '||SQLAUX_11||SQLAUX_21||SQLAUX_31||SQLAUX_41||SQLAUX_51
          into :nacido, :aux_nacimiento, :Vivo;

          if (nacido is null) then
          begin
               RPNacido = 'N/N';
               Senasa = '';
               Pc = '';
               Hba = '';
               Ra = '';
               Otro = '';
               Peso = 0;
               suspend;
          end
          else
              FOR EXECUTE STATEMENT 'select '||SQLAUX_11||SQLAUX_21||SQLAUX_31||SQLAUX_41||SQLAUX_51
              into :nacido, :aux_nacimiento, :Vivo
              do
                begin
                  RPNacido = 'N/N';
                  Senasa = '';
                  Pc = '';
                  Hba = '';
                  Ra = '';
                  Otro = '';
                  Peso = 0;

                  -- busco si hubo evento peso
                  select first 1 ep.peso
                  from eve_peso ep join eve_eventos ee on (ee.id_evento = ep.id_evento)
                  where (ee.tipo = 25) and (ee.establecimiento = :establecimiento) and (ee.animal = :nacido) and (ep.dias = 'N')
                  order by ee.fecha asc
                  into :Peso;

                  Peso = cast(Peso as integer);

                  -- busco si hubo identificacion

                  --si se identifica al nacer, esto andaba, pero si hacia una identificacion
                  --o reidentificación posterior al nacimiento no andaba.

                  select id_rp, id_Senasa, id_Pc, id_Hba, id_Ra, id_Otro, id_animal
                  from  tab_animales
                  where  (establecimiento = :establecimiento) and (id_animal=:nacido)
                  order by id_rp
                  into :RPNacido, :Senasa, :Pc, :Hba, :Ra, :Otro, :id_animal;


                  -- busco el sexo del nacido
                  select cts.nombre
                  from tab_animales ta join cod_sexos cs on (ta.sexo = cs.id_sexo) join
                       cod_tipos_sexo cts on (cs.tipo = cts.id_tipo_sexo)
                  where (ta.id_animal = :nacido)
                  into :sexo;

                  suspend;
                end
       end
END ^

SET TERM ; ^

