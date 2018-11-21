CREATE TRIGGER SET_DATOS_EVE FOR EVE_EVENTOS
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
  SELECT FIRST 1 * FROM GET_DATOS_ANIMAL_FECHA(new.animal,new.establecimiento,new.fecha)
  INTO NEW.potrero, NEW.rodeo, NEW.cronologia_dentaria, NEW.estado_reproductivo, NEW.categoria,
  NEW.condicion_corporal, NEW.gdr;
END