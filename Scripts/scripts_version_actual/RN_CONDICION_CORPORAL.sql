CREATE OR ALTER PROCEDURE RN_CONDICION_CORPORAL(
  ANIMAL INTEGER,
  ESTABLECIMIENTO INTEGER,
  FECHA DATE)
RETURNS(
  RESULT VARCHAR(1) CHARACTER SET NONE,
  MENSAJE VARCHAR(150) CHARACTER SET NONE)
AS
BEGIN
    -- fecha del evento
  for select result, mensaje from RN_FECHA_EVENTO(:animal, :fecha, 9)
  into :result, :mensaje
    do if (result <> 'A') then
    suspend;

END;