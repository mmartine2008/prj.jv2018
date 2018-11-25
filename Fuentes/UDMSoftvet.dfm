object DMSoftvet: TDMSoftvet
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 407
  Top = 165
  Height = 512
  Width = 688
  object IBQCatEve: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from  COD_CATEGORIAS_EVENTO')
    Left = 48
    Top = 16
  end
  object DSCatEve: TDataSource
    DataSet = IBQCatEve
    Left = 144
    Top = 16
  end
  object IBQSexo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select TIPO AS SEXO, ID_SEXO, NOMBRE, SINONIMO from  COD_SEXOS')
    Left = 296
    Top = 16
  end
  object DSSexo: TDataSource
    DataSet = IBQSexo
    Left = 344
    Top = 16
  end
  object IBQTipoAlta: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from COD_TIPOS_ALTA where (ID_TIPO_ALTA =1) or (ID_TIPO' +
        '_ALTA =2) or (ID_TIPO_ALTA =3)')
    Left = 248
    Top = 64
    object IBQTipoAltaNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_TIPOS_ALTA.NOMBRE'
      Size = 50
    end
    object IBQTipoAltaID_TIPO_ALTA: TIntegerField
      FieldName = 'ID_TIPO_ALTA'
      Origin = 'COD_TIPOS_ALTA.ID_TIPO_ALTA'
      Required = True
    end
  end
  object DSTipoAlta: TDataSource
    DataSet = IBQTipoAlta
    Left = 344
    Top = 64
  end
  object DSCategAnimal: TDataSource
    DataSet = IBQCategAnimal
    Left = 344
    Top = 112
  end
  object IBQCategAnimal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CATEGORIA, SINONIMO, NOMBRE, TIPO_SEXO, CODIGO  from C' +
        'OD_CATEGORIAS WHERE(TIPO_SEXO = :SEXO)')
    Left = 248
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SEXO'
        ParamType = ptUnknown
        Size = 4
      end>
  end
  object IBQResponsable: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select  ID_EMPLEADO, NOMBRE || '#39' '#39' || APELLIDO as nombre  from T' +
        'AB_EMPLEADOS where (establecimiento = :idestablecimiento)'
      '')
    Left = 48
    Top = 68
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idestablecimiento'
        ParamType = ptUnknown
      end>
  end
  object DSResponsable: TDataSource
    DataSet = IBQResponsable
    Left = 144
    Top = 64
  end
  object IBQEstablecimiento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_ESTABLECIMIENTO, NOMBRE, propietario, renspa, pais, ac' +
        'tividad from TAB_ESTABLECIMIENTOS ')
    Left = 48
    Top = 112
  end
  object DSEstablecimiento: TDataSource
    DataSet = IBQEstablecimiento
    Left = 144
    Top = 112
  end
  object IBQRodeo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_rodeo,nombre,establecimiento,descripcion from  TAB_ROD' +
        'EOS where (establecimiento = :esta) and (visible = 1)')
    Left = 48
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
      end>
  end
  object DSRodeo: TDataSource
    DataSet = IBQRodeo
    Left = 144
    Top = 160
  end
  object IBQRaza: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT id_raza, '
      '       sinonimo, '
      '       nombre, '
      '       dias_gestacion, '
      '       codigo '
      'FROM   cod_razas '
      'WHERE  visible = 1 '
      'ORDER  BY nombre ASC')
    Left = 248
    Top = 144
  end
  object DSRaza: TDataSource
    DataSet = IBQRaza
    Left = 344
    Top = 160
  end
  object IBQPotrero: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_POTREROS'
      'where establecimiento = :ESTABLECIMIENTO and visible = 1'
      '')
    Left = 48
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ESTABLECIMIENTO'
        ParamType = ptInput
      end>
  end
  object DSPotrero: TDataSource
    DataSet = IBQPotrero
    Left = 176
    Top = 208
  end
  object IBQGrupos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQGruposAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from TAB_GRUPOS where (establecimiento = :idestablecimi' +
        'ento) and visible=1'
      'order by upper(nombre) asc')
    Left = 248
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idestablecimiento'
        ParamType = ptUnknown
      end>
  end
  object DSGrupos: TDataSource
    DataSet = IBQGrupos
    Left = 344
    Top = 256
  end
  object IBQUsuario: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_usuario, nombre, clave, habilitado, rol, categoria,log' +
        'ueado'
      'from sys_usuarios where habilitado = '#39'S'#39)
    Left = 96
    Top = 184
  end
  object DSUsuario: TDataSource
    DataSet = IBQUsuario
    Left = 144
    Top = 256
  end
  object IBQPotrerosAll: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ESTABLECIMIENTO, NOMBRE, ID_POTRERO from TAB_POTREROS')
    Left = 48
    Top = 304
  end
  object DSPotrerosAll: TDataSource
    DataSet = IBQPotrerosAll
    Left = 144
    Top = 304
  end
  object IBQCondicionCorporal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQCondicionCorporalAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select ID_CONDICION_CORPORAL, VALOR_ESCALA_10  as escala from CO' +
        'D_CONDICIONES_CORPORALES')
    Left = 48
    Top = 352
    object IBQCondicionCorporalID_CONDICION_CORPORAL: TIntegerField
      FieldName = 'ID_CONDICION_CORPORAL'
      Origin = 'COD_CONDICIONES_CORPORALES.ID_CONDICION_CORPORAL'
      Required = True
    end
    object IBQCondicionCorporalESCALA: TFloatField
      FieldName = 'ESCALA'
      Origin = 'COD_CONDICIONES_CORPORALES.VALOR_ESCALA_10'
      Required = True
    end
  end
  object DSCondicionCorporal: TDataSource
    DataSet = IBQCondicionCorporal
    Left = 144
    Top = 352
  end
  object IBSPGrupoServicio: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'SP_SERVICIO_NATURAL'
    Left = 788
    Top = 55
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_SERVICIO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'ID_GRUPO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'NOMBRE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FECHA_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FECHA_FIN_ESTIMADA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ACTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ESTABLECIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'POTRERO'
        ParamType = ptInput
      end>
  end
  object IBQGDR: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_GDR, NOMBRE,SINONIMO,CODIGO from COD_GDR')
    Left = 248
    Top = 296
  end
  object DSGDR: TDataSource
    DataSet = IBQGDR
    Left = 344
    Top = 288
  end
  object IBQCronologiaDentaria: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CRONOLOGIA_DENTARIA, NOMBRE, SINONIMO, CODIGO from COD' +
        '_CRONOLOGIAS_DENTARIAS')
    Left = 440
    Top = 192
  end
  object DSCronologiaDentaria: TDataSource
    DataSet = IBQCronologiaDentaria
    Left = 528
    Top = 200
  end
  object DSEstadoReproductivo: TDataSource
    DataSet = IBQEstadoReproductivo
    Left = 528
    Top = 264
  end
  object IBQEstadoReproductivo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_ESTADO_REPRODUCTIVO, NOMBRE from COD_ESTADOS_REPRODUCT' +
        'IVOS')
    Left = 440
    Top = 240
  end
  object IBSP_IngresoServicio: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'SP_INGRESO_SERVICIO'
    Left = 828
    Top = 142
  end
  object IBSP_IngresoToro: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'SP_INGRESO_TORO'
    Left = 844
    Top = 190
    ParamData = <
      item
        DataType = ftDate
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ESTABLECIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESPONSABLE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LOG_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'LOG_FECHA_MODIFICADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERVICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_POTRERO'
        ParamType = ptInput
      end>
  end
  object IBQServicios: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from  TAB_SERVICIOS where (establecimiento = :estableci' +
        'miento)')
    Left = 248
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
  end
  object DSServicios: TDataSource
    DataSet = IBQServicios
    Left = 344
    Top = 208
  end
  object IBQCodigosGenericos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo)')
    Left = 440
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSCodigosGenericos: TDataSource
    DataSet = IBQCodigosGenericos
    Left = 528
    Top = 56
  end
  object IBQMetodo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_METODO_TOMA, NOMBRE,CODIGO,SINONIMO from COD_METODOS_T' +
        'OMA_PRUEBA')
    Left = 440
    Top = 320
  end
  object DSMetodo: TDataSource
    DataSet = IBQMetodo
    Left = 528
    Top = 328
  end
  object IBQValorCapacidad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select  ID_VALOR_CAPACIDAD, NOMBRE,CODIGO,SINONIMO from COD_VALO' +
        'RES_CAPACIDAD')
    Left = 440
    Top = 374
  end
  object DSValorCapacidad: TDataSource
    DataSet = IBQValorCapacidad
    Left = 528
    Top = 376
  end
  object IBQSeguridad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select RUA.ID_ACCION, RUA.ID_FORMULARIO, RUA.ID_USUARIO, SA.nomb' +
        're '
      
        'from REL_USUARIO_ACCION RUA join  SYS_ACCIONES SA on (RUA.ID_acc' +
        'ion = SA.id_accion)'
      'where RUA.id_usuario = :Usuario'
      ''
      ''
      '')
    Left = 1048
    Top = 206
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Usuario'
        ParamType = ptUnknown
      end>
  end
  object DSMetodoDiagnostico: TDataSource
    DataSet = IBQMetodoDiagnostico
    Left = 344
    Top = 375
  end
  object IBQMetodoDiagnostico: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_metodo_diagnostico, nombre,sinonimo,codigo'
      '           from cod_metodos_diagnostico_gestaci')
    Left = 248
    Top = 377
  end
  object IBQEstadoReproTacto: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_ESTADO_REPRODUCTIVO, NOMBRE,CODIGO from COD_ESTADOS_RE' +
        'PRODUCTIVOS where (al_tacto='#39'S'#39')')
    Left = 624
    Top = 96
  end
  object DSEstadoReproTacto: TDataSource
    DataSet = IBQEstadoReproTacto
    Left = 728
    Top = 96
  end
  object IBQMetodoToma: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_METODO_TOMA, NOMBRE from COD_METODOS_TOMA_PRUEBA ')
    Left = 248
    Top = 430
  end
  object DSMetodoToma: TDataSource
    DataSet = IBQMetodoToma
    Left = 344
    Top = 430
  end
  object IBQTipoSexo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_tipo_sexo, nombre'
      'from  cod_tipos_sexo')
    Left = 440
    Top = 472
  end
  object DSTipoSexo: TDataSource
    DataSet = IBQTipoSexo
    Left = 528
    Top = 472
  end
  object IBQTipoEnfermedad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select * from  cod_tipos_enfermedad')
    Left = 624
    Top = 344
  end
  object DSTipoEnfermedad: TDataSource
    DataSet = IBQTipoEnfermedad
    Left = 728
    Top = 344
  end
  object IBQSiNo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_codigo, valor'
      'from cod_genericos'
      'where tipo = '#39'SN'#39)
    Left = 48
    Top = 416
  end
  object DSSiNo: TDataSource
    DataSet = IBQSiNo
    Left = 144
    Top = 416
  end
  object IBQEntraServicio: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_codigo, valor'
      'from cod_genericos'
      'where tipo = '#39'PS'#39)
    Left = 48
    Top = 480
  end
  object DSEntraServicio: TDataSource
    DataSet = IBQEntraServicio
    Left = 144
    Top = 480
  end
  object IBQParamEstablecimiento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from REL_PARAMETROS_ESTABLECIMIENTO where (ESTABLECIMIE' +
        'NTO = :establecimiento)')
    Left = 624
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
  end
  object DSParamEstablecimiento: TDataSource
    Left = 728
    Top = 16
  end
  object DSTiposParto: TDataSource
    DataSet = IBQTiposParto
    Left = 344
    Top = 496
  end
  object IBQTiposParto: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_tipo_parto, sinonimo,codigo, nombre'
      'from  cod_tipos_parto')
    Left = 248
    Top = 496
  end
  object IBQCausaDistocia: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_causa_distocia, nombre,codigo,sinonimo'
      'from  cod_causas_distocia')
    Left = 248
    Top = 552
  end
  object DSCausaDistocia: TDataSource
    DataSet = IBQCausaDistocia
    Left = 344
    Top = 552
  end
  object DSGradoAsistencia: TDataSource
    DataSet = IBQGradoAsistencia
    Left = 344
    Top = 603
  end
  object IBQGradoAsistencia: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_grado_asistencia, nombre,codigo,sinonimo'
      'from  cod_grados_asistencia')
    Left = 248
    Top = 603
  end
  object IBQMetodoCastracion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_METODO_CASTRACION, SINONIMO, NOMBRE, CODIGO from COD_M' +
        'ETODOS_CASTRACION')
    Left = 632
    Top = 136
  end
  object DSMetodoCastracion: TDataSource
    DataSet = IBQMetodoCastracion
    Left = 728
    Top = 168
  end
  object IBQCentrosInsem: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from COD_CENTROS_INSEMINACION')
    Left = 624
    Top = 240
  end
  object DSCentrosInsem: TDataSource
    DataSet = IBQCentrosInsem
    Left = 728
    Top = 240
  end
  object DSEscalaCondCorp: TDataSource
    DataSet = IBQEscalaCondCorp
    Left = 728
    Top = 288
  end
  object IBQEscalaCondCorp: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select rpe.valor from sys_juego_parametros sjp, rel_parametros_e' +
        'stablecimiento rpe where (sjp.id_parametro = rpe.parametro) and ' +
        '(rpe.establecimiento = :ESTABLECIMIENTO) and (sjp.nombre = '#39'EGES' +
        'CCC'#39')')
    Left = 624
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
    object IBQEscalaCondCorpVALOR: TIBStringField
      FieldName = 'VALOR'
      Origin = 'REL_PARAMETROS_ESTABLECIMIENTO.VALOR'
      Size = 25
    end
  end
  object IBQEnfermedades: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_enfermedad, nombre,codigo'
      'from  cod_enfermedades'
      '')
    Left = 440
    Top = 528
  end
  object DSEnfermedades: TDataSource
    DataSet = IBQEnfermedades
    Left = 528
    Top = 528
  end
  object DSTecnicasTratamientos: TDataSource
    DataSet = IBQTecnicasTratamientos
    Left = 728
    Top = 392
  end
  object IBQTecnicasTratamientos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_tecnica, sinonimo, codigo'
      'from  cod_tecnicas_tratamiento'
      '')
    Left = 624
    Top = 392
  end
  object DSTipoTratamientos: TDataSource
    DataSet = IBQTiposTratamientos
    Left = 728
    Top = 440
  end
  object IBQTiposTratamientos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_tipo_tratamiento, sinonimo, medida, codigo'
      'from  cod_tipos_tratamiento'
      '')
    Left = 624
    Top = 440
  end
  object IBQTipoAborto: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_TIPO_ABORTO, SINONIMO, CODIGO, NOMBRE from COD_TIPOS_A' +
        'BORTO')
    Left = 624
    Top = 526
  end
  object DSTipoAborto: TDataSource
    DataSet = IBQTipoAborto
    Left = 728
    Top = 524
  end
  object IBQTipoDestete: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_TIPO_DESTETE, SINONIMO, NOMBRE, CODIGO from COD_TIPOS_' +
        'DESTETE')
    Left = 624
    Top = 574
  end
  object DSTipoDestete: TDataSource
    DataSet = IBQTipoDestete
    Left = 728
    Top = 574
  end
  object DSDiagnosticadores: TDataSource
    DataSet = IBQDiagnosticadores
    Left = 592
    Top = 640
  end
  object IBQDiagnosticadores: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_diagnosticador, sinonimo, codigo'
      'from  cod_diagnosticadores'
      '')
    Left = 432
    Top = 584
  end
  object IBQTiposBaja: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_TIPO_BAJA, SINONIMO from COD_TIPOS_BAJA')
    Left = 436
    Top = 14
    object IBQTiposBajaID_TIPO_BAJA: TIntegerField
      FieldName = 'ID_TIPO_BAJA'
      Origin = 'COD_TIPOS_BAJA.ID_TIPO_BAJA'
      Required = True
    end
    object IBQTiposBajaSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_TIPOS_BAJA.SINONIMO'
      Size = 50
    end
  end
  object DSTiposBaja: TDataSource
    DataSet = IBQTiposBaja
    Left = 512
    Top = 14
  end
  object IBQmetodosSincronizacion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from COD_METODOS_SINCRONIZACION')
    Left = 776
    Top = 300
    object IBQmetodosSincronizacionID_METODO: TIntegerField
      FieldName = 'ID_METODO'
      Origin = 'COD_METODOS_SINCRONIZACION.ID_METODO'
      Required = True
    end
    object IBQmetodosSincronizacionSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_METODOS_SINCRONIZACION.SINONIMO'
      Size = 50
    end
    object IBQmetodosSincronizacionNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_METODOS_SINCRONIZACION.NOMBRE'
      Required = True
      Size = 50
    end
    object IBQmetodosSincronizacionHORAS_DE_AVISO: TIntegerField
      FieldName = 'HORAS_DE_AVISO'
      Origin = 'COD_METODOS_SINCRONIZACION.HORAS_DE_AVISO'
    end
    object IBQmetodosSincronizacionCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_METODOS_SINCRONIZACION.CODIGO'
      Size = 2
    end
  end
  object DSmetodosSincronizacion: TDataSource
    DataSet = IBQmetodosSincronizacion
    Left = 852
    Top = 316
  end
  object IBQEventosPlanillas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from cod_tipos_evento where (tiene_planilla = '#39'S'#39') orde' +
        'r by nombre asc')
    Left = 48
    Top = 257
  end
  object DSEventosPlanillas: TDataSource
    DataSet = IBQEventosPlanillas
    Left = 144
    Top = 542
  end
  object IBQCategorias: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_categorias ')
    Left = 48
    Top = 542
  end
  object DSCategorias: TDataSource
    DataSet = IBQCategorias
    Left = 144
    Top = 598
  end
  object IBQExamenClinico: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_EXAMEN_CLINICO, SINONIMO, CODIGO, NOMBRE from COD_EXAM' +
        'ENES_FERTILIDAD')
    Left = 1068
    Top = 472
  end
  object IBQExamenSanitario: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_METODO_EXAMEN, SINONIMO, CODIGO, NOMBRE from COD_METOD' +
        'OS_EXAMEN_SANITARIO')
    Left = 788
    Top = 552
  end
  object DSExamenClinico: TDataSource
    DataSet = IBQExamenClinico
    Left = 836
    Top = 502
  end
  object DSExamenSanitario: TDataSource
    DataSet = IBQExamenSanitario
    Left = 836
    Top = 552
  end
  object IBQFormularios: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_formulario, nombre'
      'from sys_formularios'
      'where nombre = :form')
    Left = 784
    Top = 646
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'form'
        ParamType = ptUnknown
      end>
  end
  object IBQSemen: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(cantidad) as totalToros from TAB_SEMEN'
      'where (establecimiento = :establecimiento)')
    Left = 1012
    Top = 350
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
  end
  object DSSemen: TDataSource
    DataSet = IBQSemen
    Left = 844
    Top = 446
  end
  object DSEventos: TDataSource
    DataSet = IBQEventos
    Left = 912
    Top = 672
  end
  object IBQEventos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from cod_tipos_evento'
      '')
    Left = 1032
    Top = 576
  end
  object DSEventosListado: TDataSource
    DataSet = IBQEventosListado
    Left = 144
    Top = 646
  end
  object IBQEventosListado: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from cod_tipos_evento where (rep_generico = '#39'S'#39') order ' +
        'by nombre asc')
    Left = 48
    Top = 590
  end
  object IBQIngEgrServicio: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select TS.ID_SERVICIO, TS.POTRERO AS ID_POTRERO, TS.GRUPO, CTS.N' +
        'OMBRE AS TIPO, TS.NOMBRE, TP.NOMBRE AS POTRERO ,TS.FECHA_INICIO,' +
        ' TS.FECHA_FIN, TS.FECHA_FIN_ESTIMADA'
      ' from TAB_SERVICIOS TS, TAB_POTREROS TP, COD_TIPOS_SERVICIO CTS'
      
        'where (TS.TIPO = 1) AND (TS.ACTIVO = '#39'S'#39')AND (CTS.ID_TIPO_SERVIC' +
        'IO = TS.TIPO)'
      
        '     AND (TP.ESTABLECIMIENTO = TS.ESTABLECIMIENTO) and (TP.ID_PO' +
        'TRERO = TS.POTRERO) and (TS.ESTABLECIMIENTO = :establecimiento)')
    Left = 436
    Top = 148
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
  end
  object DSIngEgrServicio: TDataSource
    DataSet = IBQIngEgrServicio
    Left = 532
    Top = 142
  end
  object DSSexoPorSexo: TDataSource
    DataSet = IBQSexoPorSexo
    Left = 344
    Top = 656
  end
  object IBQSexoPorSexo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select TIPO AS SEXO, ID_SEXO, NOMBRE, SINONIMO from  COD_SEXOS w' +
        'here tipo = :sexo')
    Left = 248
    Top = 648
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sexo'
        ParamType = ptUnknown
      end>
  end
  object IBQPotrerosVacios: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_POTREROS TP'
      
        'where (TP.establecimiento = :ESTABLECIMIENTO) and (id_potrero<>0' +
        ')'
      '')
    Left = 796
    Top = 374
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ESTABLECIMIENTO'
        ParamType = ptInput
      end>
  end
  object DSPotrerosVacios: TDataSource
    DataSet = IBQPotrero
    Left = 852
    Top = 374
  end
  object IBQPotrerosSinServicio: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_POTREROS TP'
      'where (TP.establecimiento = :ESTABLECIMIENTO) and (TP.VISIBLE=1)'
      '')
    Left = 920
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
  end
  object DSPotrerosSinServicio: TDataSource
    DataSet = IBQPotrerosSinServicio
    Left = 912
    Top = 104
  end
  object IBQServiciosBorrables: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM LISTADO_SERVICIOS(:ESTABLECIMIENTO)')
    Left = 212
    Top = 90
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
    object IBQServiciosBorrablesID_SERVICIO: TIntegerField
      FieldName = 'ID_SERVICIO'
      Origin = 'LISTADO_SERVICIOS.ID_SERVICIO'
    end
    object IBQServiciosBorrablesNOMBRE_SERVICIO: TIBStringField
      FieldName = 'NOMBRE_SERVICIO'
      Origin = 'LISTADO_SERVICIOS.NOMBRE_SERVICIO'
      Size = 50
    end
    object IBQServiciosBorrablesGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'LISTADO_SERVICIOS.GRUPO'
    end
    object IBQServiciosBorrablesFECHA_INICIO: TDateField
      FieldName = 'FECHA_INICIO'
      Origin = 'LISTADO_SERVICIOS.FECHA_INICIO'
    end
    object IBQServiciosBorrablesFECHA_FIN: TDateField
      FieldName = 'FECHA_FIN'
      Origin = 'LISTADO_SERVICIOS.FECHA_FIN'
    end
    object IBQServiciosBorrablesFECHA_FIN_ESTIMADA: TDateField
      FieldName = 'FECHA_FIN_ESTIMADA'
      Origin = 'LISTADO_SERVICIOS.FECHA_FIN_ESTIMADA'
    end
    object IBQServiciosBorrablesPOTRERO: TIntegerField
      FieldName = 'POTRERO'
      Origin = 'LISTADO_SERVICIOS.POTRERO'
    end
    object IBQServiciosBorrablesTIPO_SERVICIO: TIBStringField
      FieldName = 'TIPO_SERVICIO'
      Origin = 'LISTADO_SERVICIOS.TIPO_SERVICIO'
      Size = 50
    end
    object IBQServiciosBorrablesRP_INT: TIBStringField
      FieldName = 'RP_INT'
      Origin = 'LISTADO_SERVICIOS.RP_INT'
      Size = 10
    end
    object IBQServiciosBorrablesNOM_TORO: TIBStringField
      FieldName = 'NOM_TORO'
      Origin = 'LISTADO_SERVICIOS.NOM_TORO'
      Size = 50
    end
  end
  object IBQEstadoParicion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select distinct(ta.estado_lactacion)'
      'from tab_animales ta, cod_sexos cs'
      'where (ta.establecimiento = :esta) and'
      '(ta.sexo = cs.id_sexo) and (cs.tipo = 2 ) and'
      '(ta.estado_lactacion is not null)')
    Left = 440
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object DSEstadoParicion: TDataSource
    DataSet = IBQEstadoParicion
    Left = 528
    Top = 424
  end
  object IBQGeneral: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from sys_roles')
    Left = 1004
    Top = 144
  end
  object DSGeneral: TDataSource
    DataSet = IBQGeneral
    Left = 852
    Top = 272
  end
  object IBQCUIG: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_cuig where (establecimiento=:esta)')
    Left = 408
    Top = 645
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object DSCUIG: TDataSource
    DataSet = IBQCUIG
    Left = 520
    Top = 565
  end
  object IBQCUIGActual: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_CUIG where establecimiento=:esta and activo=1')
    Left = 1028
    Top = 279
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object DSCUIGActual: TDataSource
    DataSet = IBQCUIGActual
    Left = 1020
    Top = 408
  end
  object IBQPotParaGrilla: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_potrero, nombre from tab_potreros where (establecimien' +
        'to=:esta)')
    Left = 488
    Top = 632
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQRodParaGrilla: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_rodeo, nombre from tab_rodeos where (establecimiento=:' +
        'esta)')
    Left = 820
    Top = 605
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object DSPotParaGrilla: TDataSource
    DataSet = IBQPotParaGrilla
    Left = 528
    Top = 608
  end
  object DSRodParaGrilla: TDataSource
    DataSet = IBQRodParaGrilla
    Left = 648
    Top = 624
  end
  object DSTratamiento: TDataSource
    DataSet = IBQTratamiento
    Left = 728
    Top = 480
  end
  object IBQTratamiento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'select id_tratamiento, sinonimo, codigo, periodoretirada, dosis,' +
        ' kg_dosis, laboratorio'
      'from  cod_tratamiento'
      'where id_tipo_tratamiento = :tipotratamiento order by nombre asc')
    Left = 624
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipotratamiento'
        ParamType = ptUnknown
      end>
  end
  object IBQDistCACUCO: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_dist_cacuco where grupo=:g')
    Left = 816
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'g'
        ParamType = ptUnknown
      end>
  end
  object DSDistCACUCO: TDataSource
    DataSet = IBQDistCACUCO
    Left = 1020
    Top = 64
  end
  object IBQHayNacimientos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select tg.id_grupo, tg.nombre from tab_grupos tg, tab_grupos_par' +
        'to tgp where tg.tipo_evento=39 and tg.visible=1 and tg.estableci' +
        'miento=:esta and '
      'tg.id_grupo=tgp.grupo and tgp.tiene_nacimiento='#39'N'#39)
    Left = 436
    Top = 108
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object DSHayNacimientos: TDataSource
    DataSet = IBQHayNacimientos
    Left = 516
    Top = 102
  end
  object IBQPais: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_PAIS where id_pais = :pais ')
    Left = 8
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pais'
        ParamType = ptUnknown
      end>
  end
  object DSPais: TDataSource
    DataSet = IBQPais
    Left = 104
    Top = 456
  end
  object IBQCC: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_condiciones_corporales')
    Left = 88
    Top = 524
  end
  object IBQDatosAnimal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_ANIMAL, ID_RP, ID_SENASA, ID_HBA,NOMBRE, SEXO, FECHA_N' +
        'ACIMIENTO,ID_IE from TAB_ANIMALES where ESTABLECIMIENTO=:estable' +
        'cimiento')
    Left = 8
    Top = 568
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
    object IBQDatosAnimalID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'TAB_ANIMALES.ID_ANIMAL'
      Required = True
    end
    object IBQDatosAnimalID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES.ID_RP'
      Required = True
      Size = 10
    end
    object IBQDatosAnimalID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'TAB_ANIMALES.ID_SENASA'
      Size = 9
    end
    object IBQDatosAnimalID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'TAB_ANIMALES.ID_HBA'
      Size = 10
    end
    object IBQDatosAnimalNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'TAB_ANIMALES.NOMBRE'
      Size = 100
    end
    object IBQDatosAnimalSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'TAB_ANIMALES.SEXO'
      Required = True
    end
    object IBQDatosAnimalFECHA_NACIMIENTO: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'TAB_ANIMALES.FECHA_NACIMIENTO'
      Required = True
    end
    object IBQDatosAnimalID_IE: TIBStringField
      FieldName = 'ID_IE'
      Origin = 'TAB_ANIMALES.ID_IE'
      Size = 64
    end
  end
  object IBQActividad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_ACTIVIDAD, SINONIMO, NOMBRE from COD_ACTIVIDAD')
    Left = 612
    Top = 62
    object IBQActividadID_ACTIVIDAD: TIntegerField
      FieldName = 'ID_ACTIVIDAD'
      Origin = 'COD_ACTIVIDAD.ID_ACTIVIDAD'
      Required = True
    end
    object IBQActividadSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_ACTIVIDAD.SINONIMO'
      Required = True
      Size = 50
    end
    object IBQActividadNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_ACTIVIDAD.NOMBRE'
      Required = True
      Size = 50
    end
  end
  object DSActividad: TDataSource
    DataSet = IBQActividad
    Left = 688
    Top = 62
  end
  object IBQAnimExt: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_ANIMAL_EXTERNO,ID_RP,ID_HBA,NOMBRE,ESTABLECIMIENTO,FEC' +
        'HA_NACIMIENTO, sexo from TAB_ANIMALES_EXTERNOS where ESTABLECIMI' +
        'ENTO=:establecimiento')
    Left = 88
    Top = 580
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
  end
  object IBQTipoSuplementacion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT ID_TIPO_SUPLEMENTACION, NOMBRE, CODIGO, SINONIMO, PORC_MS' +
        ' FROM COD_TIPOS_SUPLEMENTACIONES')
    Left = 944
    Top = 544
  end
  object DSTipoSuplementacion: TDataSource
    DataSet = IBQTipoSuplementacion
    Left = 944
    Top = 592
  end
  object IBQCodPropietario: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_propietario')
    Left = 928
    Top = 472
  end
  object IBQCodCriador: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_criador')
    Left = 928
    Top = 420
  end
  object IBQCodOrigen: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_origen')
    Left = 928
    Top = 376
  end
  object IBQCodDestino: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_destino')
    Left = 928
    Top = 328
  end
  object DSCodPropietario: TDataSource
    DataSet = IBQCodPropietario
    Left = 936
    Top = 288
  end
  object DSCodCriador: TDataSource
    DataSet = IBQCodCriador
    Left = 936
    Top = 256
  end
  object DSCodOrigen: TDataSource
    DataSet = IBQCodOrigen
    Left = 944
    Top = 224
  end
  object DSCodDestino: TDataSource
    DataSet = IBQCodDestino
    Left = 944
    Top = 184
  end
  object DSCentrosTransplante: TDataSource
    DataSet = IBQCentrosTransplante
    Left = 728
    Top = 206
  end
  object IBQCentrosTransplante: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CENTRO_TRANSPLANTE, MATRICULA, NOMBRE  from CENTROS_TR' +
        'ANSPLANTE')
    Left = 624
    Top = 206
  end
  object IBQFuentesDeps: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_fuentes_deps')
    Left = 8
    Top = 648
  end
  object DSFuentesDeps: TDataSource
    DataSet = IBQFuentesDeps
    Left = 56
    Top = 648
  end
  object IBQDescMetodoSinc: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_desc_metodos_sinc')
    Left = 248
    Top = 336
  end
  object DSDescMetodoSinc: TDataSource
    DataSet = IBQDescMetodoSinc
    Left = 336
    Top = 336
  end
  object IBQRechazo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQRechazoAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSCategAnimal
    SQL.Strings = (
      
        'select id_rechazo, nombre,sinonimo,codigo from COD_RECHAZOS_PRES' +
        'ERVICIO')
    Left = 710
    Top = 698
  end
  object DSRechazo: TDataSource
    DataSet = IBQRechazo
    Left = 1072
    Top = 648
  end
  object IBQSubCategoriaRaza: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select cs.*'
      
        'from cod_subcategorias cs join rel_subcategoria_raza rsr on cs.i' +
        'd_subcategoria = rsr.id_subcategoria'
      'where rsr.id_raza = :raza')
    Left = 848
    Top = 719
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'raza'
        ParamType = ptUnknown
      end>
  end
  object DSSubCategoriaRaza: TDataSource
    DataSet = IBQSubCategoriaRaza
    Left = 992
    Top = 712
  end
  object IBQCodigosManejo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_codigos_manejo')
    Left = 880
    Top = 71
  end
  object DSCodigosManejo: TDataSource
    DataSet = IBQCodigosManejo
    Left = 936
    Top = 72
  end
  object IBQRpRepetidos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_animal, id_rp from tab_animales where id_rp like :rp a' +
        'nd establecimiento = :esta and activo = '#39'S'#39)
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQInspeccion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_inspeccion')
    Left = 656
    Top = 601
  end
  object DSInspeccion: TDataSource
    DataSet = IBQInspeccion
    Left = 720
    Top = 642
  end
  object IBQCodDestCabania: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_dest_cabania')
    Left = 472
    Top = 593
  end
  object DSCodDestCabania: TDataSource
    DataSet = IBQCodDestCabania
    Left = 584
    Top = 600
  end
  object IBQMocho: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cm.* from cod_mocho cm join rel_mocho_raza rmr on rmr.moc' +
        'ho = cm.id_mocho where rmr.raza = :raza')
    Left = 104
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'raza'
        ParamType = ptUnknown
      end>
  end
  object DSMocho: TDataSource
    DataSet = IBQMocho
    Left = 112
    Top = 120
  end
  object IBQCantEstablecimientos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(*) as cant from tab_establecimientos ')
    Left = 200
    Top = 168
  end
  object IBQCantAnimalesActivos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(*) as cant from tab_animales where activo = '#39'S'#39)
    Left = 296
    Top = 168
  end
  object p: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'select id_tratamiento, sinonimo, codigo, periodoretirada, dosis,' +
        ' kg_dosis'
      'from  cod_tratamiento'
      '')
    Left = 464
    Top = 696
  end
  object IBQTratTodos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_POTREROS TP'
      'where (TP.establecimiento = :ESTABLECIMIENTO) and (visible = 1)'
      '')
    Left = 1040
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
  end
end
