SET TERM ^ ;

CREATE OR ALTER PROCEDURE REP_CATEGORIAS_POTRERO(
  ID_POTRERO INTEGER,
  ESTABLECIMIENTO INTEGER)
RETURNS(
  CANT_TOROS INTEGER,
  CANT_VACAS INTEGER,
  CANT_TERNEROS INTEGER,
  CANT_NOVILLOS INTEGER,
  CANT_TERNERAS INTEGER,
  CANT_VAQUILLONAS INTEGER,
  RECURSO_FORRAJERO VARCHAR(50) CHARACTER SET NONE,
  FECHA_RECURSO DATE,
  TOTAL INTEGER)
AS
DECLARE VARIABLE FECHA_AUX DATE;
DECLARE VARIABLE RECURSO_AUX VARCHAR(50);
BEGIN
  select count(*)
  from tab_animales
  where (potrero=:ID_POTRERO and establecimiento=:ESTABLECIMIENTO and categoria=1 and activo='S')
  into :CANT_TERNEROS;

  select count(*)
  from tab_animales
  where (potrero=:ID_POTRERO and establecimiento=:ESTABLECIMIENTO and categoria=2 and activo='S')
  into :CANT_NOVILLOS;

  select count(*)
  from tab_animales
  where (potrero=:ID_POTRERO and establecimiento=:ESTABLECIMIENTO and categoria=3 and activo='S')
  into :CANT_TOROS;

  select count(*)
  from tab_animales
  where (potrero=:ID_POTRERO and establecimiento=:ESTABLECIMIENTO and categoria=4 and activo='S')
  into :CANT_TERNERAS;

  select count(*)
  from tab_animales
  where (potrero=:ID_POTRERO and establecimiento=:ESTABLECIMIENTO and categoria=5 and activo='S')
  into :CANT_VAQUILLONAS;

  select count(*)
  from tab_animales
  where (potrero=:ID_POTRERO and establecimiento=:ESTABLECIMIENTO and categoria=6 and activo='S')
  into :CANT_VACAS;

  TOTAL = CANT_VACAS+CANT_VAQUILLONAS+CANT_TERNERAS+CANT_TOROS+CANT_NOVILLOS+CANT_TERNEROS;

  fecha_aux = '01/01/1901';
  FECHA_RECURSO = '01/01/1902';
  RECURSO_FORRAJERO = 'NO DEFINIDO';

  for select CRF.nombre, RPR.fecha
      from cod_recursos_forrajeros CRF join rel_potrero_recursoforrajero RPR on RPR.RECURSO = CRF.id_recurso_forrajero
      where (RPR.potrero = :ID_POTRERO and establecimiento=:ESTABLECIMIENTO)
      into :recurso_aux, :fecha_aux
  do
    if (fecha_aux>FECHA_RECURSO) then
    begin
         FECHA_RECURSO = :fecha_aux;
         RECURSO_FORRAJERO = :recurso_aux;
    end

  if (RECURSO_FORRAJERO = 'NO DEFINIDO') then
     FECHA_RECURSO = NULL;

  SUSPEND;
END ^ 

SET TERM ; ^ 

