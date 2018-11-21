SET TERM ^ ;

CREATE OR ALTER PROCEDURE GET_DATOS_ANIMAL(
  ID_ANIMAL INTEGER,
  ESTABLECIMIENTO INTEGER)
RETURNS(
  ID_RP VARCHAR(10) CHARACTER SET NONE,
  ID_SENASA VARCHAR(9) CHARACTER SET NONE,
  FECHA_NACIMIENTO DATE,
  PESO DOUBLE PRECISION,
  MADRE_BIOLOGICA_INTERNA INTEGER,
  MADRE_BIOLOGICA_EXTERNA INTEGER,
  MADRE_RECEPTORA_INTERNA INTEGER,
  MADRE_RECEPTORA_EXTERNA INTEGER,
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
  PRECIO_BRUTO FLOAT,
  PRECIO_UNITARIO FLOAT,
  GASTOS FLOAT,
  OBSERVACION VARCHAR(255) CHARACTER SET NONE,
  RESPONSABLE INTEGER,
  DTA VARCHAR(255) CHARACTER SET NONE,
  FECHA_ALTA DATE,
  TIPO_ALTA INTEGER,
  PADRE_INTERNO INTEGER,
  PADRE_EXTERNO INTEGER,
  DIASPESO VARCHAR(1) CHARACTER SET NONE,
  FECHA_PESO DATE,
  ACTIVIDAD INTEGER,
  ORIGEN INTEGER,
  CRIADOR INTEGER,
  ADN VARCHAR(255) CHARACTER SET NONE,
  TIPIFICACION_SANGUINEA VARCHAR(255) CHARACTER SET NONE,
  ID_IE VARCHAR(64) CHARACTER SET NONE,
  SUBCATEGORIA INTEGER,
  CODIGOMANEJO INTEGER,
  MOCHO INTEGER,
  COLOR INTEGER,
  NACIDO VARCHAR(1) CHARACTER SET NONE,
  PRIMER_EVENTO DATE,
  PROPIETARIO INTEGER,
  INFORMADO_AFIP VARCHAR(2) CHARACTER SET NONE)
AS
DECLARE VARIABLE ACTIVO VARCHAR(1);
BEGIN
  SELECT ID_RP, ID_SENASA, FECHA_NACIMIENTO, PESO,
     MADRE_BIOLOGICA_EXTERNA, ESTADO_LACTACION, RODEO, RAZA, POTRERO,CATEGORIA,
     CRONOLOGIA_DENTARIA, CONDICION_CORPORAL, GDR, CIRCUNFERENCIA_ESCROTAL,ESTADO_REPRODUCTIVO,
     ID_PC, ID_HBA, ID_RA,ID_OTRO, NOMBRE, SEXO, ACTIVO, MADRE_RECEPTORA_EXTERNA,
     APODO, MADRE_BIOLOGICA_INTERNA, MADRE_RECEPTORA_INTERNA, DTA, ACTIVIDAD,
     CRIADOR, ORIGEN_ANIMAL, ADN, TIPIFICACION_SANGUINEA, ID_IE, SUBCATEGORIA, CODIGO_MANEJO, MOCHO, COLOR, PROPIETARIO,
     case INFORMADO_AFIP when 'S' then 'SI' when 'N' then 'NO' end as INFORMADO_AFIP
  FROM tab_animales WHERE (ID_ANIMAL = :ID_ANIMAL AND ESTABLECIMIENTO = :ESTABLECIMIENTO)
  INTO:Id_RP, :Id_Senasa, :Fecha_Nacimiento,
      :Peso, :Madre_Biologica_Externa, :Estado_Lactacion, :Rodeo,
      :Raza,:Potrero, :Categoria, :Cronologia_Dentaria, :Condicion_Corporal,
      :GDR, :CIRCUNFERENCIA_ESCROTAL, :Estado_Reproductivo, :Id_PC, :Id_HBA, :Id_RA,
      :ID_otro,:Nombre, :Sexo, :Activo, :Madre_Receptora_Externa,
      :APODO,:MADRE_BIOLOGICA_INTERNA,:MADRE_RECEPTORA_INTERNA, :DTA, :ACTIVIDAD,
      :CRIADOR, :ORIGEN, :ADN, :TIPIFICACION_SANGUINEA, :ID_IE, :SUBCATEGORIA, :CODIGOMANEJO, :MOCHO, :COLOR, :PROPIETARIO, :INFORMADO_AFIP;

   select first 1 padre_externo from REL_PADRES_EXTERNOS where animal = :id_animal and establecimiento = :establecimiento
   into :padre_externo;
   select first 1 padre_interno from REL_PADRES_INTERNOS where animal = :id_animal and establecimiento = :establecimiento
   into :padre_interno;

   select first 1 ep.peso, ep.dias, ee.fecha from eve_peso ep join eve_eventos ee on ee.id_evento=ep.id_evento
   where ee.animal=:id_animal and ee.establecimiento=:establecimiento
   order by ee.fecha desc, ee.id_evento desc into :peso, :diaspeso, :fecha_peso;

   NACIDO = 'N';

   SELECT first 1 ead.precio_bruto, ead.precio_unitario, ead.gastos, ee.observacion, ee.responsable, ead.tipo, ee.fecha
   FROM EVE_ALTA_DIRECTA ead, EVE_EVENTOS ee
   where (ee.establecimiento = :establecimiento and ee.animal = :ID_ANIMAL and ee.id_evento = ead.id_evento) order by fecha desc
   INTO :PRECIO_BRUTO, :PRECIO_UNITARIO, :GASTOS, :OBSERVACION, :RESPONSABLE, :TIPO_ALTA, :FECHA_ALTA;

   if (FECHA_ALTA is NULL) then
   begin
        SELECT ee.observacion, ee.responsable, ee.fecha
        FROM eve_nacimiento en, EVE_EVENTOS ee
        where (ee.establecimiento = :establecimiento and ee.animal = :ID_ANIMAL and ee.id_evento = en.id_evento)
        INTO :OBSERVACION, :RESPONSABLE, :FECHA_ALTA;
        TIPO_ALTA = 3;
        NACIDO = 'S';
   end

   PRIMER_EVENTO = NULL;
   SELECT FIRST 1 FECHA FROM EVE_EVENTOS WHERE ANIMAL = :ID_ANIMAL AND TIPO <> 2 AND DISPARADOR IS NULL
   INTO :PRIMER_EVENTO;

   IF (ID_RP IS NULL) THEN
      ID_RP = ' ';
   IF(ID_SENASA IS NULL) THEN
      ID_SENASA = ' ';
   if (PESO IS NULL) then
      PESO = 0;
   if (MADRE_BIOLOGICA_INTERNA IS NULL) then
      MADRE_BIOLOGICA_INTERNA = -1;
   if (MADRE_BIOLOGICA_EXTERNA IS NULL) then
      MADRE_BIOLOGICA_EXTERNA = -1;
   if (MADRE_RECEPTORA_INTERNA IS NULL) then
      MADRE_RECEPTORA_INTERNA = -1;
   if (MADRE_RECEPTORA_EXTERNA IS NULL) then
      MADRE_RECEPTORA_EXTERNA = -1;
   if (ESTADO_LACTACION IS NULL) then
      ESTADO_LACTACION = -1;
   if (RODEO IS NULL) then
      RODEO = -1;
   if (RAZA IS NULL) then
      RAZA = -1;
   if (POTRERO IS NULL) then
      POTRERO = -1;
   if (CATEGORIA IS NULL) then
      CATEGORIA = -1;
   if (CRONOLOGIA_DENTARIA IS NULL) then
      CRONOLOGIA_DENTARIA = -1;

   if (CONDICION_CORPORAL IS NULL) then
      CONDICION_CORPORAL = -1;
   if (GDR IS NULL) then
      GDR = -1;
   if (CIRCUNFERENCIA_ESCROTAL IS NULL) then
      CIRCUNFERENCIA_ESCROTAL = 0;
   if (ESTADO_REPRODUCTIVO IS NULL) then
      ESTADO_REPRODUCTIVO = -1;
   if (ID_PC IS NULL) then
      ID_PC = ' ';
   if (ID_HBA IS NULL) then
      ID_HBA = ' ';
   if (ID_RA IS NULL) then
      ID_RA = ' ';
   if (ID_OTRO IS NULL) then
      ID_OTRO = ' ';
   if (ID_IE IS NULL) then
      ID_IE = ' ';
   if (NOMBRE IS NULL) then
      NOMBRE = ' ';
   if (APODO IS NULL) then
      APODO = ' ';
   if (SEXO IS NULL) then
      SEXO = -1;
   if (PRECIO_BRUTO IS NULL) then
      PRECIO_BRUTO = 0;
   if (PRECIO_UNITARIO IS NULL) then
      PRECIO_UNITARIO = 0;
   if (GASTOS IS NULL) then
      GASTOS = 0;
   if (OBSERVACION IS NULL) then
      OBSERVACION = ' ';
   if (RESPONSABLE IS NULL) then
      RESPONSABLE = -1;
   if (DTA IS NULL) then
      DTA = ' ';
   if (TIPO_ALTA IS NULL) then
      TIPO_ALTA = -1;
   if (PADRE_INTERNO IS NULL) then
      PADRE_INTERNO = -1;
   if (PADRE_EXTERNO IS NULL) then
      PADRE_EXTERNO = -1;
   if (ACTIVIDAD IS NULL) then
      ACTIVIDAD = -1;
   if (SUBCATEGORIA IS NULL) then
      SUBCATEGORIA = -1;
   if (CODIGOMANEJO IS NULL) then
      CODIGOMANEJO = -1;
   if (MOCHO IS NULL) then
      MOCHO = -1;
   if (COLOR IS NULL) then
      COLOR = -1;
   if (PROPIETARIO IS NULL) then
      PROPIETARIO = 0;   
  SUSPEND;

END ^

SET TERM ; ^

