SET TERM ^ ;

CREATE OR ALTER PROCEDURE SP_CALCULAR_CATEGORIA_POR_ID(
  ID_ANIMAL INTEGER)
RETURNS(
  CATEGORIA INTEGER)
AS
DECLARE VARIABLE HOY DATE;
DECLARE VARIABLE FECHA_NAC DATE;
DECLARE VARIABLE SEXO INTEGER;
DECLARE VARIABLE NCRIAS INTEGER;
DECLARE VARIABLE CASTRADO INTEGER;
DECLARE VARIABLE ID_SEXO SMALLINT;
BEGIN
  HOY = CAST('today' AS DATE);
  select first 1 FECHA_NACIMIENTO from tab_animales where id_Animal = :ID_ANIMAL into :FECHA_NAC;
  select first 1 SEXO from tab_animales where id_Animal = :ID_ANIMAL into :ID_SEXO;
  select first 1 TIPO from COD_SEXOS where ID_SEXO = :ID_SEXO into :SEXO;

/**/
  IF ((((HOY - FECHA_NAC)/30) > 0) AND (((HOY - FECHA_NAC)/30) <= 9)) THEN
  BEGIN
       IF (SEXO = 1) THEN -- TERNERO
       BEGIN
            CATEGORIA = 1;
            SUSPEND;
       END
       IF (SEXO = 2) THEN --TERNERA
       BEGIN
            CATEGORIA = 4;
            SUSPEND;
       END
  END
/**/

  IF (((HOY - FECHA_NAC)/30) > 9) THEN
  BEGIN
       IF (SEXO = 1) THEN -- TORO
       BEGIN
           select count(*) from   eve_Castracion ECS , eve_Eventos EVE
           where    ECS.id_Evento = EVE.id_Evento    and EVE.ANIMAL=1 into :CASTRADO;

            IF (CASTRADO > 0) THEN --NOVILLO
              CATEGORIA = 2;
            ELSE
               CATEGORIA = 3; --TORO
            SUSPEND;
       END
       IF (SEXO = 2) THEN --VACA o VAQUILLONA
       BEGIN
            select count(*) from tab_animales TA_MAD where TA_MAD.madre_biologica_interna =:ID_ANIMAL into :NCRIAS;

            IF ( NCRIAS > 0) THEN --VACA con Crias
            BEGIN
             CATEGORIA = 6;
            END
            ELSE
            BEGIN -- VAQUILLONA
              CATEGORIA = 5;
            END

            SUSPEND;

       END
  END


END ^

SET TERM ; ^

