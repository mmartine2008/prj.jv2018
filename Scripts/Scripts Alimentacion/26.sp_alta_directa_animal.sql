CREATE OR ALTER PROCEDURE SP_ALTA_DIRECTA_ANIMAL(
  IDNUEVOANIMAL INTEGER,
  ID_RP VARCHAR(10) CHARACTER SET NONE,
  ID_SENASA VARCHAR(9) CHARACTER SET NONE,
  FECHA_NACIMIENTO DATE,
  PESO DOUBLE PRECISION,
  MADRE_BIOLOGICA_EXTERNA INTEGER,
  ESTADO_LACTACION INTEGER,
  RODEO INTEGER,
  RAZA INTEGER,
  POTRERO INTEGER,
  CATEGORIA INTEGER,
  CRONOLOGIA_DENTARIA INTEGER,
  CONDICION_CORPORAL INTEGER,
  GDR INTEGER,
  CIRCUNFERENCIA_ESCROTAL DOUBLE PRECISION,
  ESTADO_REPRODUCTIVO INTEGER,
  ID_PC VARCHAR(10) CHARACTER SET NONE,
  ID_HBA VARCHAR(10) CHARACTER SET NONE,
  ID_RA VARCHAR(10) CHARACTER SET NONE,
  ID_OTRO VARCHAR(10) CHARACTER SET NONE,
  NOMBRE VARCHAR(100) CHARACTER SET NONE,
  APODO VARCHAR(100) CHARACTER SET NONE,
  SEXO INTEGER,
  MADRE_RECEPTORA_EXTERNA INTEGER,
  FECHA_EVENTO DATE,
  TIPO_ALTA INTEGER,
  PRECIO_BRUTO FLOAT,
  PRECIO_UNITARIO FLOAT,
  OBSERVACION VARCHAR(1000) CHARACTER SET NONE,
  ESTABLECIMIENTO INTEGER,
  RESPONSABLE INTEGER,
  LOG_USUARIO INTEGER,
  LOG_FECHA_MODIFICADO DATE,
  ID_AUX INTEGER,
  ID_AUXPE INTEGER,
  PADRE_EXTERNO INTEGER,
  DISPARADOR INTEGER,
  ID_GRUPO INTEGER,
  GASTOS FLOAT,
  MADRE_BIOLOGICA_INTERNA INTEGER,
  MADRE_RECEPTORA_INTERNA INTEGER,
  PADRE_INTERNO INTEGER,
  DTA VARCHAR(50) CHARACTER SET NONE,
  DIASPESO VARCHAR(1) CHARACTER SET NONE,
  ACTIVIDAD INTEGER,
  ID_IE VARCHAR(64) CHARACTER SET NONE,
  PROPIETARIO INTEGER,
  CRIADOR INTEGER,
  ORIGEN_ANIMAL INTEGER,
  ADN VARCHAR(255) CHARACTER SET NONE,
  TIPIFICACION_SANGUINEA VARCHAR(255) CHARACTER SET NONE,
  CASTRADO INTEGER,
  SUBCATEGORIA INTEGER,
  CODIGO_MANEJO INTEGER,
  INSPECCION INTEGER,
  DESTINO INTEGER,
  MOCHO INTEGER,
  COLOR INTEGER,
  INFORMADO_AFIP VARCHAR(1) CHARACTER SET NONE)
AS
DECLARE VARIABLE IDNUEVOEVENTO INTEGER;
DECLARE VARIABLE VARGRUPO INTEGER;
DECLARE VARIABLE VARPADRE INTEGER;
DECLARE VARIABLE COMENTARIO VARCHAR(255);
DECLARE VARIABLE CESCROTAL VARCHAR(50);
DECLARE VARIABLE CODIGORAZA VARCHAR(2);
DECLARE VARIABLE MADRE INTEGER;
DECLARE VARIABLE CANTIDADPADRES INTEGER;
DECLARE VARIABLE INTERNO VARCHAR(1);
DECLARE VARIABLE PROPIETARIOAUX INTEGER;
DECLARE VARIABLE PORCENTAJEAUX FLOAT;
DECLARE VARIABLE EST_ACTUAL VARCHAR(50);
DECLARE VARIABLE OBSERVACION_CORTA VARCHAR(255) CHARACTER SET NONE;
DECLARE VARIABLE AUX INTEGER;
BEGIN

  --IDNUEVOANIMAL = GEN_ID(GEN_ID_TABANIMAL,1);
  IDNUEVOEVENTO = GEN_ID(GEN_ID_TABEVENTO,1);

  if (ESTADO_REPRODUCTIVO is null) then
      ESTADO_REPRODUCTIVO = 0;

  CEscrotal = :Circunferencia_Escrotal;
  if(sexo = 2)then
    CEscrotal = null;

  if (color is null) then
     color = 0;
  if (condicion_corporal is not null) then
     if (condicion_corporal = 0) then
        condicion_corporal = null;

  OBSERVACION_CORTA = SUBSTRING(OBSERVACION FROM 1 FOR 255);

  SELECT MSG_ESTADO FROM COD_ESTADOS_REPRODUCTIVOS WHERE ID_ESTADO_REPRODUCTIVO = :ESTADO_REPRODUCTIVO INTO :EST_ACTUAL;

  INSERT INTO TAB_ANIMALES
     (ID_ANIMAL,ESTABLECIMIENTO, ID_RP, ID_SENASA, FECHA_NACIMIENTO, PESO,
     MADRE_BIOLOGICA_EXTERNA, ESTADO_LACTACION, RODEO, RAZA, POTRERO,CATEGORIA,
     CRONOLOGIA_DENTARIA, CONDICION_CORPORAL, GDR, CIRCUNFERENCIA_ESCROTAL,ESTADO_REPRODUCTIVO,
     ID_PC, ID_HBA, ID_RA,ID_OTRO,NOMBRE, SEXO, ACTIVO, MADRE_RECEPTORA_EXTERNA,
     APODO,MADRE_BIOLOGICA_INTERNA,MADRE_RECEPTORA_INTERNA, DTA, ACTIVIDAD, ID_IE,
     PROPIETARIO, ORIGEN_ANIMAL, CRIADOR, ADN, TIPIFICACION_SANGUINEA, SUBCATEGORIA,CODIGO_MANEJO,
     INSPECCION,DESTINO_CABANIA,MOCHO,ESTADO_ACTUAL,COLOR,INFORMADO_AFIP)
  VALUES
     (:IDNUEVOANIMAL,:ESTABLECIMIENTO, :ID_RP, :ID_SENASA, :FECHA_NACIMIENTO,
      :PESO, :MADRE_BIOLOGICA_EXTERNA, :ESTADO_LACTACION, :RODEO,
      :RAZA,:POTRERO, :CATEGORIA, :CRONOLOGIA_DENTARIA, :CONDICION_CORPORAL,
      :GDR,:CESCROTAL, :ESTADO_REPRODUCTIVO, :ID_PC, :ID_HBA, :ID_RA,
      :ID_OTRO,:NOMBRE, :SEXO, 'S', :MADRE_RECEPTORA_EXTERNA,
      :APODO,:MADRE_BIOLOGICA_INTERNA,:MADRE_RECEPTORA_INTERNA, :DTA, :ACTIVIDAD, :ID_IE,
      :PROPIETARIO, :ORIGEN_ANIMAL, :CRIADOR, :ADN, :TIPIFICACION_SANGUINEA, :SUBCATEGORIA, :CODIGO_MANEJO,
      :INSPECCION,:DESTINO,:MOCHO,:EST_ACTUAL,:COLOR,:INFORMADO_AFIP);
      
  INSERT INTO TAB_OBSERVACIONES(ID_ANIMAL, OBSERVACION) VALUES (:IDNUEVOANIMAL, :OBSERVACION);

  INSERT INTO  EVE_EVENTOS
      (ESTABLECIMIENTO, DISPARADOR,ID_EVENTO,ANIMAL,FECHA,RESPONSABLE, OBSERVACION, TIPO,
       LOG_USUARIO, LOG_FECHA_MODIFICADO)
  VALUES
      (:ESTABLECIMIENTO,:DISPARADOR,:IDNUEVOEVENTO,:IDNUEVOANIMAL,:FECHA_EVENTO,:RESPONSABLE,:OBSERVACION_CORTA, 2,
        :LOG_USUARIO,:LOG_FECHA_MODIFICADO);

  INSERT INTO  EVE_ALTA_DIRECTA
            (TIPO, CATEGORIA, ID_EVENTO, ESTADO_REPRODUCTIVO, CRONOLOGIA_DENTARIA,
            GDR, ESTADO_LACTACION, PRECIO_BRUTO, PRECIO_UNITARIO, GASTOS, ACTIVIDAD, CRIADOR, ORIGEN_ANIMAL, DTA)
     VALUES
           (:Tipo_Alta, :Categoria, :IDNUEVOEVENTO, :ESTADO_Reproductivo,
           :Cronologia_Dentaria, :GDR, :ESTADO_LACTACION, :PRECIO_BRUTO, :PRECIO_UNITARIO, :GASTOS,
           :ACTIVIDAD, :CRIADOR, :ORIGEN_ANIMAL, :DTA);

   EXECUTE PROCEDURE SP_IDENTIFICACION(:FECHA_EVENTO,:IDNUEVOANIMAL,:OBSERVACION_CORTA,:ESTABLECIMIENTO,:RESPONSABLE,
   :LOG_USUARIO,:LOG_FECHA_MODIFICADO,NULL,:ID_RP,:ID_SENASA,:ID_PC,:ID_HBA,:ID_RA,:ID_OTRO,:NOMBRE,:APODO,:IDNUEVOEVENTO,'I', :ID_IE);

  --cambio de Ubicacion
   COMENTARIO = 'Evento CU disparado por Alta Directa de Animal';
   if ((potrero is not null) or (rodeo is not null))then
          select * from SP_CAMBIO_UBICACION(:POTRERO, :Rodeo, NULL, :FECHA_EVENTO, :IDNUEVOANIMAL, :COMENTARIO,
             :ESTABLECIMIENTO, :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO, :IDNUEVOEVENTO) into :aux;

   --cambio la condicion corporal
     COMENTARIO = 'Evento CC disparado por Alta Directa de Animal';
   if ((CONDICION_CORPORAL is not null)and(CONDICION_CORPORAL <> 0))then
     EXECUTE PROCEDURE SP_CONDICION_CORPORAL( :CONDICION_CORPORAL, :FECHA_EVENTO, :IDNUEVOANIMAL,:COMENTARIO,
       :ESTABLECIMIENTO, :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO, :IDNUEVOEVENTO, null);

   -- ejecuto circunferencia_escrotal
  COMENTARIO = 'Evento CE disparado por Alta Directa de Animal';
  if ((CIRCUNFERENCIA_ESCROTAL is not null) and (CIRCUNFERENCIA_ESCROTAL <> 0))then
    EXECUTE PROCEDURE SP_Circunferencia_Escrotal(:FECHA_EVENTO, :IDNUEVOANIMAL, :COMENTARIO, :ESTABLECIMIENTO,
            :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO, :CIRCUNFERENCIA_ESCROTAL, 'N', null, :IDNUEVOEVENTO);

  -- ejecuto el evento peso
  COMENTARIO = 'Evento Peso disparado por Alta Directa de Animal';
  if (peso is not null) then
    EXECUTE PROCEDURE SP_peso(:FECHA_EVENTO, :IDNUEVOANIMAL, :COMENTARIO, :ESTABLECIMIENTO,
            :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO, :DIASPESO, :peso, null, :IDNUEVOEVENTO);

  -- ejecuto el evento actividad
  COMENTARIO = 'Evento Actividad disparado por Alta Directa de Animal';
  if ((ACTIVIDAD is not null) OR (SUBCATEGORIA IS NOT NULL) OR (CODIGO_MANEJO IS NOT NULL) OR (INSPECCION IS NOT NULL) OR (DESTINO IS NOT NULL))then
  BEGIN
       IF (ACTIVIDAD IS NULL) THEN
          ACTIVIDAD = 3;
       IF (SUBCATEGORIA IS NULL) THEN
          SUBCATEGORIA = 0;
       IF (CODIGO_MANEJO IS NULL) THEN
          CODIGO_MANEJO = 0;
       IF (INSPECCION IS NULL) THEN
          INSPECCION = 0;
       IF (DESTINO IS NULL) THEN
          DESTINO = 0;
    EXECUTE PROCEDURE sp_actividad(:FECHA_EVENTO, :IDNUEVOANIMAL, :COMENTARIO, :ESTABLECIMIENTO,
            :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO, :ACTIVIDAD, null, :IDNUEVOEVENTO, :SUBCATEGORIA, :CODIGO_MANEJO,:INSPECCION,:DESTINO,0);
  END
  else
      update tab_animales ta set ta.actividad = 0, ta.subcategoria = 0 where ta.id_animal = :idnuevoanimal and ta.establecimiento = :establecimiento;


  --cambio de Ubicacion
   COMENTARIO = 'Evento Cambio Ubicaci�n disparado por Alta Directa de Animal';
   if ((castrado is not null) and (categoria = 1))then
          EXECUTE PROCEDURE SP_CASTRACION(:FECHA_EVENTO, :IDNUEVOANIMAL, :COMENTARIO, :ESTABLECIMIENTO,
            :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO, 0, null, :IDNUEVOEVENTO);

  FOR SELECT GRUPO FROM AUX_GRUPOS
      WHERE (ID_AUX = :ID_AUX)
      INTO :VarGrupo
  DO
    INSERT INTO REL_PERTENECE_GRUPO (GRUPO,ANIMAL,ESTABLECIMIENTO,ACTIVO)
    VALUES  (:VarGrupo, :IDNUEVOANIMAL, :ESTABLECIMIENTO,'S');
    
  --evento declaraci�n AFIP
  IF (INFORMADO_AFIP = 'S') THEN
  begin
     COMENTARIO = 'Evento Declaraci�n AFIP disparado por Alta Directa de Animal';
     EXECUTE PROCEDURE SP_DECLARACION_AFIP (:FECHA_EVENTO, :IDNUEVOANIMAL, :COMENTARIO, :ESTABLECIMIENTO,
            :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO, null, :IDNUEVOEVENTO);
  end
  -- Verificar si hay un solo animal en la tab aux => no armar las relaciones (REL_PADRES_EXTERNOS, REL_PADRES_INTERNOS)
  /*select count(*) from AUX_ANIMALES_EXTERNOS where (id_aux =:ID_AUXPE)
  into :CantidadPadres;

  FOR SELECT DISTINCT ID_ANIMAL_EXTERNO, INTERNO FROM AUX_ANIMALES_EXTERNOS WHERE (ID_AUX = :ID_AUXPE) AND (SEXO = 1)
      INTO :VARPADRE, :INTERNO
  DO
    BEGIN
         IF (INTERNO = 'S') THEN  -- ACTUALIZO LOS DATOS DEL ANIMAL
            INSERT INTO REL_PADRES_INTERNOS (PADRE_INTERNO, ANIMAL, ESTABLECIMIENTO) VALUES (:VARPADRE, :IDNUEVOANIMAL, :ESTABLECIMIENTO);
         ELSE
             INSERT INTO REL_PADRES_EXTERNOS (PADRE_EXTERNO, ANIMAL, ESTABLECIMIENTO) VALUES (:VARPADRE, :IDNUEVOANIMAL, :ESTABLECIMIENTO);
    END*/

  IF (PADRE_INTERNO IS NOT NULL) THEN
     INSERT INTO REL_PADRES_INTERNOS (PADRE_INTERNO, ANIMAL, ESTABLECIMIENTO) VALUES (:PADRE_INTERNO, :IDNUEVOANIMAL, :ESTABLECIMIENTO);
  ELSE
      IF (PADRE_EXTERNO IS NOT NULL) THEN
         INSERT INTO REL_PADRES_EXTERNOS (PADRE_EXTERNO, ANIMAL, ESTABLECIMIENTO) VALUES (:PADRE_EXTERNO, :IDNUEVOANIMAL, :ESTABLECIMIENTO);


  -- Calculo la raza
  select codigo from cod_razas where (id_raza = :raza )
  into :codigoraza;

  IF((codigoraza = 'NN')OR (codigoraza = 'XX'))THEN
  if (MADRE_BIOLOGICA_INTERNA is not null) then --si la madre es interna paso el ultimo parametro = 0 lo cual indica esta caracterÃƒÆ’Ã‚Â­stica
  begin
     if(CantidadPadres > 1)then
       execute procedure sp_calcular_raza (:IDNUEVOANIMAL, :MADRE_BIOLOGICA_INTERNA, :ID_AUXPE, 1, :establecimiento,0);-- 1=> hay multiples padres Y LA MADRE ES INTERNA
     else
        execute procedure sp_calcular_raza (:IDNUEVOANIMAL, :MADRE_BIOLOGICA_INTERNA, :ID_AUXPE, 0, :establecimiento,0);-- 1=> hay padre unico Y LA MADRE ES INTERNA
  end
  else
    if (MADRE_BIOLOGICA_EXTERNA is not null)  then --si la madre es interna paso el ultimo parametro = 1 lo cual indica esta caracterÃƒÆ’Ã‚Â­stica
    begin
      if(CantidadPadres > 1)then
        execute procedure sp_calcular_raza (:IDNUEVOANIMAL, :MADRE_BIOLOGICA_EXTERNA, :ID_AUXPE, 1, :establecimiento,1);-- 1=> hay multiples padres Y LA MADRE ES EXTERNA
      else
        execute procedure sp_calcular_raza (:IDNUEVOANIMAL, :MADRE_BIOLOGICA_EXTERNA, :ID_AUXPE, 0, :establecimiento,1);-- 1=> hay padre unico Y LA MADRE ES EXTERNA
    end


  for select id_propietario, porcentaje
      from aux_coopropiedad
      into :PROPIETARIOAUX, :PORCENTAJEAUX
  DO
    begin
       insert into coopropiedad_interna(ID_ANIMAL,ID_PROPIETARIO,PORCENTAJE) VALUES(:IDNUEVOANIMAL,:PROPIETARIOAUX,:PORCENTAJEAUX);
    end

  IF (:PROPIETARIOAUX IS NULL) THEN
  BEGIN
     IF (PROPIETARIO IS NULL) THEN
       insert into coopropiedad_interna(ID_ANIMAL,ID_PROPIETARIO,PORCENTAJE) VALUES(:IDNUEVOANIMAL,0,100);
     ELSE
         insert into coopropiedad_interna(ID_ANIMAL,ID_PROPIETARIO,PORCENTAJE) VALUES(:IDNUEVOANIMAL,:PROPIETARIO,100);
  END

  DELETE FROM aux_coopropiedad;

  -- agrego a grupos de eventos cuando es alta masiva
  EXECUTE PROCEDURE Gen_Agregar_En_Grupo (:ESTABLECIMIENTO ,:IDNUEVOEVENTO ,:ID_GRUPO );
  SUSPEND;

END