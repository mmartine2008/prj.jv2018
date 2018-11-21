SET TERM ^ ;

CREATE OR ALTER PROCEDURE SP_CALCULA_FRAME_MACHO(
  ALTURA INTEGER,
  DIAS INTEGER)
RETURNS(
  FRAME FLOAT)
AS
DECLARE VARIABLE UNO FLOAT;
DECLARE VARIABLE DOS FLOAT;
DECLARE VARIABLE TRES FLOAT;
DECLARE VARIABLE CUATRO FLOAT;
DECLARE VARIABLE CINCO FLOAT;
DECLARE VARIABLE CINCO_MESES FLOAT;
DECLARE VARIABLE VEINTIUN_MESES FLOAT;
DECLARE VARIABLE ALTURA_PULGADAS FLOAT;
BEGIN
  /* Procedure body */
   uno = -11.548;
   dos = 0.4878;
   tres = 0.0289;
   cuatro = 0.00001947;
   cinco = 0.0000334;

  /*Pasar la altura de centimetros a pulgadas 2.54 cm = 1 pulgadas*/
  altura_pulgadas = (:ALTURA / 2.54);
  /*Promeido entre (3 dias de 31, 2 de 30) y (2 dias de 31, 3 de 30)*/
  cinco_meses = 152.5;
  /*Promeido entre (5 dias de 31, 4 de 30) y (4 dias de 31, 5 de 30)*/
  /*Para los segundos 9 meses*/
  veintiun_meses = 365 + 274.5;

  FRAME = 0;

  if ((:DIAS >= :cinco_meses) and (:DIAS <= :veintiun_meses)) then
	FRAME = :uno + (:dos * :altura_pulgadas) - (:tres * :DIAS) + (:cuatro * (:DIAS * :DIAS)) + (:cinco * :altura_pulgadas * :DIAS);
  SUSPEND;
END ^

SET TERM ; ^

