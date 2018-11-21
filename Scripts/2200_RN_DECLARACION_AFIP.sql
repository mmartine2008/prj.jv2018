SET TERM ^ ;

CREATE OR ALTER PROCEDURE RN_DECLARACION_AFIP(
  ANIMAL INTEGER,
  FEVENTO DATE,
  ESTABLECIMIENTO INTEGER)
RETURNS(
  RESULT VARCHAR(1) CHARACTER SET NONE,
  MENSAJE VARCHAR(150) CHARACTER SET NONE)
AS
BEGIN


  for select result, mensaje
      from RN_FECHA_EVENTO(:animal, :fevento, 58)
      into :result, :mensaje
  do if (result <> 'A') then
    suspend;

END ^

SET TERM ; ^

