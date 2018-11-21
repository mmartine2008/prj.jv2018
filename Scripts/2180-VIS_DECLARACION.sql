CREATE OR ALTER VIEW VIS_DECLARACION(
  ID_RP,
  ID_SENASA,
  ID_ANIMAL,
  ID_PC,
  ID_HBA,
  ID_OTRO,
  ID_IE,
  SEXO,
  POTRERO,
  RODEO,
  CATEGORIA,
  GDR,
  CONDICION_CORPORAL,
  FRAME,
  ESTADO_LACTACION,
  CIRCUNFERENCIA_ESCROTAL,
  CRONOLOGIA_DENTARIA,
  RAZA,
  ESTADO_REPRODUCTIVO,
  FECHA_NACIMIENTO,
  ESTABLECIMIENTO,
  PESO,
  COLOR,
  NOMBRE,
  APODO)
AS
SELECT A.ID_RP, A.ID_SENASA, A.ID_ANIMAL, A.ID_PC, A.ID_HBA, A.ID_OTRO, A.ID_IE, A.SEXO, A.POTRERO,A.RODEO, A.CATEGORIA,
       A.GDR, A.CONDICION_CORPORAL, A.FRAME, A.ESTADO_LACTACION,
       A.CIRCUNFERENCIA_ESCROTAL, A.CRONOLOGIA_DENTARIA, A.RAZA, A.ESTADO_REPRODUCTIVO,
       A.FECHA_NACIMIENTO, A.ESTABLECIMIENTO, A.PESO, A.COLOR, A.NOMBRE, A.APODO
FROM Tab_Animales A
WHERE (A.ACTIVO = 'S' AND A.INFORMADO_AFIP = 'N' AND ((A.ID_SENASA <> '') OR (A.ID_IE <> '')));

