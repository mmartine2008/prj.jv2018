CREATE OR ALTER TRIGGER SET_DATOS_EVE_UPDATE FOR EVE_EVENTOS
ACTIVE BEFORE UPDATE
POSITION 0
AS
BEGIN
  IF(OLD.TIPO <> 5)THEN
    SELECT FIRST 1 * FROM GET_DATOS_ANIMAL_FECHA(new.animal,new.establecimiento,new.fecha)
    INTO NEW.potrero, NEW.rodeo, NEW.cronologia_dentaria, NEW.estado_reproductivo, NEW.categoria,
    NEW.condicion_corporal, NEW.gdr;
END