inherited FIngresoMasivoAlta: TFIngresoMasivoAlta
  Caption = 'FIngresoMasivoAlta'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTitulo: TPanel
    Caption = 'Alta Masiva'
  end
  inherited IBQSPEventoInd: TIBQuery
    SQL.Strings = (
      'Execute PROCEDURE SP_ALTA_DIRECTA_ANIMAL'
      ''
      ' ( :ID_RP , :ID_SENASA , :FECHA_NACIMIENTO , :PESO ,'
      '  :MADRE_BIOLOGICA_EXTERNA , :ESTADO_LACTACION ,'
      '  :RODEO , :RAZA , :POTRERO , :CATEGORIA ,'
      '  :CRONOLOGIA_DENTARIA , :CONDICION_CORPORAL ,'
      '  :GDR , :CIRCUNFERENCIA_ESCROTAL , :ESTADO_REPRODUCTIVO,'
      
        '  :ID_PC , :ID_HBA , :ID_RA , :ID_OTRO , :NOMBRE , :APODO, :SEXO' +
        ' ,'
      '  :MADRE_RECEPTORA_EXTERNA , :FECHA_EVENTO ,'
      '  :TIPO_ALTA , :PRECIO_BRUTO , :PRECIO_UNITARIO,'
      '  :OBSERVACION , :ESTABLECIMIENTO , :RESPONSABLE ,'
      '  :LOG_USUARIO , :LOG_FECHA_MODIFICADO , :ID_AUX ,'
      
        '  :ID_AUXPE , :PADRE_EXTERNO, :DISPARADOR, :ID_GRUPO, :GASTOS, n' +
        'ull, null, null,:DTA,:DIASPESO)'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_RP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SENASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_NACIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE_BIOLOGICA_EXTERNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADO_LACTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RODEO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RAZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CATEGORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRONOLOGIA_DENTARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONDICION_CORPORAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GDR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CIRCUNFERENCIA_ESCROTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADO_REPRODUCTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_HBA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_RA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_OTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE_RECEPTORA_EXTERNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_EVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_ALTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO_BRUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO_UNITARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESPONSABLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOG_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOG_FECHA_MODIFICADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AUX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AUXPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PADRE_EXTERNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GASTOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIASPESO'
        ParamType = ptUnknown
      end>
  end
end
