CREATE OR ALTER PROCEDURE GET_EXISTENCIA_POTRERO_FECHA(
  POTRERO INTEGER,
  FECHA DATE)
RETURNS(
  ANIMAL INTEGER,
  PESO FLOAT)
AS
DECLARE VARIABLE FECHA_CAMBIO DATE;
DECLARE VARIABLE EVENTO INTEGER;
DECLARE VARIABLE POT INTEGER;
BEGIN

  FOR SELECT DISTINCT(ID_ANIMAL) FROM TAB_ANIMALES TA JOIN EVE_EVENTOS EE ON(TA.ID_ANIMAL=EE.ANIMAL) JOIN EVE_CAMBIO_UBICACION ECU ON(EE.ID_EVENTO=ECU.ID_EVENTO)
  WHERE EE.FECHA <= :FECHA AND ECU.POTRERO = :POTRERO INTO :ANIMAL
  DO
  BEGIN
      evento = null;

      SELECT FIRST 1 EE.FECHA, ECU.POTRERO FROM TAB_ANIMALES TA JOIN EVE_EVENTOS EE ON(TA.ID_ANIMAL=EE.ANIMAL) JOIN EVE_CAMBIO_UBICACION ECU ON(EE.ID_EVENTO=ECU.ID_EVENTO)
      WHERE EE.FECHA <= :FECHA  AND TA.ID_ANIMAL=:ANIMAL ORDER BY EE.FECHA DESC INTO :FECHA_CAMBIO,:POT;

      IF(POT = :POTRERO)THEN
        BEGIN
          SELECT FIRST 1 EE.ID_EVENTO FROM TAB_ANIMALES TA JOIN EVE_EVENTOS EE ON(TA.ID_ANIMAL=EE.ANIMAL) JOIN EVE_BAJA EB ON(EE.ID_EVENTO=EB.ID_EVENTO) WHERE EE.FECHA <= :FECHA AND EE.FECHA >= :FECHA_CAMBIO AND TA.ID_ANIMAL = :ANIMAL ORDER BY EE.FECHA DESC INTO EVENTO;

          IF(EVENTO IS NULL)THEN
             BEGIN
               SELECT FIRST 1 EP.PESO FROM TAB_ANIMALES TA JOIN EVE_EVENTOS EE ON(TA.ID_ANIMAL=EE.ANIMAL) JOIN EVE_PESO EP ON(EE.ID_EVENTO=EP.ID_EVENTO) WHERE TA.ID_ANIMAL=:ANIMAL and EE.FECHA <= :FECHA ORDER BY EE.FECHA DESC INTO PESO;
               SUSPEND;
             END
        END
  END
END