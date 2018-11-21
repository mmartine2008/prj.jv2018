inherited FMensajeNuevos: TFMensajeNuevos
  Left = 172
  Top = 79
  Caption = 'FMensajeNuevos'
  ClientHeight = 531
  ClientWidth = 664
  FormStyle = fsNormal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited IbordeTop: TImage
    Width = 664
  end
  inherited PBotones: TPanel
    Top = 479
    Width = 664
    inherited IFondoBottom: TImage
      Width = 664
    end
    inherited LSi: TLabel
      Left = 152
      Width = 126
      Height = 19
      Caption = 'Cargar Animales'
      Font.Height = -16
      OnClick = BBAceptarClick
    end
    inherited Isi: TImage
      Left = 104
      OnClick = BBAceptarClick
    end
    inherited INo: TImage
      Left = 456
    end
    inherited LNo: TLabel
      Left = 504
      Width = 68
      Height = 19
      Caption = 'Cancelar'
      Font.Height = -16
    end
    inherited ICancel: TImage
      Left = 352
      Visible = True
    end
    inherited LCancel: TLabel
      Left = 400
      Visible = True
    end
    inherited IAceptar: TImage
      Left = 304
    end
    inherited LAceptar: TLabel
      Left = 352
      Width = 115
      Caption = 'Cargar Animales'
    end
  end
  inherited PTitulo: TPanel
    Width = 664
    inherited Image2: TImage
      Picture.Data = {00}
    end
    inherited Image3: TImage
      Left = 468
    end
    inherited Image4: TImage
      Width = 272
    end
    inherited LTitulo: TLabel
      Width = 466
    end
  end
  inherited PTexto: TPanel
    Width = 664
    Height = 438
    inherited GroupBox2: TGroupBox
      Width = 664
      Height = 438
      object LTotales: TLabel [0]
        Left = 210
        Top = 60
        Width = 66
        Height = 19
        Caption = 'LTotales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited Panel1: TPanel
        Width = 660
        inherited ImageError: TImage
          Left = 90
        end
        inherited Image1: TImage
          Left = 131
        end
        inherited ImageConsulta: TImage
          Left = 8
        end
        inherited ImageInfo: TImage
          Left = 49
        end
        inherited ImageAdvertencia: TImage
          Width = 480
        end
        inherited LTextoMensaje: TStaticText
          Width = 480
        end
      end
      object BAlta: TButton
        Left = 458
        Top = 2
        Width = 114
        Height = 27
        Caption = 'Todos de Alta'
        TabOrder = 1
        Visible = False
        OnClick = BAltaClick
      end
      object BIgnorar: TButton
        Left = 578
        Top = 2
        Width = 114
        Height = 27
        Caption = 'Ignorar Todos'
        TabOrder = 2
        Visible = False
        OnClick = BIgnorarClick
      end
      object DBGrid: TDBGrid
        Left = 17
        Top = 120
        Width = 632
        Height = 281
        DataSource = DSNuevos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnCellClick = DBGridCellClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_RP'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'RP'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 193
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'V1'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Categor'#237'a'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 248
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'V2'
            Title.Alignment = taCenter
            Title.Caption = 'Raza'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 165
            Visible = True
          end
          item
            Alignment = taCenter
            DropDownRows = 20
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -16
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = False
          end>
      end
    end
  end
  object DSNuevos: TDataSource
    DataSet = DataSetNuevos
    Left = 128
    Top = 56
  end
  object DataSetNuevos: TIBDataSet
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from AUX_ANIMALES'
      'where'
      '  ID_AUX = :OLD_ID_AUX')
    InsertSQL.Strings = (
      'insert into AUX_ANIMALES'
      
        '  (ID_AUX, ESTABLECIMIENTO, ID_ANIMAL, ID_RP, ID_SENASA, ID_PC, ' +
        'ID_HBA, '
      
        '   ID_RA, ID_OTRO, NOMBRE, FECHA_NACIMIENTO, SEXO, PESO, ORIGEN,' +
        ' '
      'CIRCUNFERENCIA_ESCROTAL, '
      '   ESTADO_REPRODUCTIVO, ESTADO_LACTACION, POTRERO, LOTE, RAZA, '
      'RODEO, CATEGORIA, '
      '   ACTIVO, CRONOLOGIA_DENTARIA, CONDICION_CORPORAL, '
      'MADRE_BIOLOGICA_EXTERNA, '
      '   MADRE_RECEPTORA_EXTERNA, GDR, PADRE_EXTERNO, '
      'MADRE_BIOLOGICA_INTERNA, '
      
        '   MADRE_RECEPTORA_INTERNA, PADRE_INTERNO, APODO, V1, V2, V3, V4' +
        ', '
      'V5, V6, '
      
        '   EW, DTA, V7, V8, V9, VUNO1, TIPO_ALTA, FECHA_ALTA, OBSERVACIO' +
        'N, '
      'RESPONSABLE, '
      
        '   PRECIO_UNITARIO, PRECIO_BRUTO, GASTOS, V10, ACTIVIDAD, ID_IE,' +
        ' ADN, '
      'TIPIFICACION_SANGUINEA, '
      '   CRIADOR, PROPIETARIO, ORIGEN_ANIMAL, V11, V12, V13, VUNO2, '
      'SUBCATEGORIA, '
      '   V14, INSPECCION, V15, DESTINO_CAB, V16, MOCHO, V17, COLOR, '
      'NOMCOLOR)'
      'values'
      
        '  (:ID_AUX, :ESTABLECIMIENTO, :ID_ANIMAL, :ID_RP, :ID_SENASA, :I' +
        'D_PC, '
      ':ID_HBA, '
      
        '   :ID_RA, :ID_OTRO, :NOMBRE, :FECHA_NACIMIENTO, :SEXO, :PESO, :' +
        'ORIGEN, '
      '   :CIRCUNFERENCIA_ESCROTAL, :ESTADO_REPRODUCTIVO, '
      ':ESTADO_LACTACION, :POTRERO, '
      
        '   :LOTE, :RAZA, :RODEO, :CATEGORIA, :ACTIVO, :CRONOLOGIA_DENTAR' +
        'IA, '
      ':CONDICION_CORPORAL, '
      '   :MADRE_BIOLOGICA_EXTERNA, :MADRE_RECEPTORA_EXTERNA, :GDR, '
      ':PADRE_EXTERNO, '
      '   :MADRE_BIOLOGICA_INTERNA, :MADRE_RECEPTORA_INTERNA, '
      ':PADRE_INTERNO, '
      
        '   :APODO, :V1, :V2, :V3, :V4, :V5, :V6, :EW, :DTA, :V7, :V8, :V' +
        '9, :VUNO1, '
      '   :TIPO_ALTA, :FECHA_ALTA, :OBSERVACION, :RESPONSABLE, '
      ':PRECIO_UNITARIO, '
      '   :PRECIO_BRUTO, :GASTOS, :V10, :ACTIVIDAD, :ID_IE, :ADN, '
      ':TIPIFICACION_SANGUINEA, '
      
        '   :CRIADOR, :PROPIETARIO, :ORIGEN_ANIMAL, :V11, :V12, :V13, :VU' +
        'NO2, '
      ':SUBCATEGORIA, '
      
        '   :V14, :INSPECCION, :V15, :DESTINO_CAB, :V16, :MOCHO, :V17, :C' +
        'OLOR, '
      ':NOMCOLOR)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_AUX,'
      '  ESTABLECIMIENTO,'
      '  ID_ANIMAL,'
      '  ID_RP,'
      '  ID_SENASA,'
      '  ID_PC,'
      '  ID_HBA,'
      '  ID_RA,'
      '  ID_OTRO,'
      '  NOMBRE,'
      '  FECHA_NACIMIENTO,'
      '  SEXO,'
      '  PESO,'
      '  ORIGEN,'
      '  CIRCUNFERENCIA_ESCROTAL,'
      '  ESTADO_REPRODUCTIVO,'
      '  ESTADO_LACTACION,'
      '  POTRERO,'
      '  LOTE,'
      '  RAZA,'
      '  RODEO,'
      '  CATEGORIA,'
      '  ACTIVO,'
      '  CRONOLOGIA_DENTARIA,'
      '  CONDICION_CORPORAL,'
      '  MADRE_BIOLOGICA_EXTERNA,'
      '  MADRE_RECEPTORA_EXTERNA,'
      '  GDR,'
      '  PADRE_EXTERNO,'
      '  MADRE_BIOLOGICA_INTERNA,'
      '  MADRE_RECEPTORA_INTERNA,'
      '  PADRE_INTERNO,'
      '  APODO,'
      '  V1,'
      '  V2,'
      '  V3,'
      '  V4,'
      '  V5,'
      '  V6,'
      '  EW,'
      '  DTA,'
      '  V7,'
      '  V8,'
      '  V9,'
      '  VUNO1,'
      '  TIPO_ALTA,'
      '  FECHA_ALTA,'
      '  OBSERVACION,'
      '  RESPONSABLE,'
      '  PRECIO_UNITARIO,'
      '  PRECIO_BRUTO,'
      '  GASTOS,'
      '  V10,'
      '  ACTIVIDAD,'
      '  ID_IE,'
      '  ADN,'
      '  TIPIFICACION_SANGUINEA,'
      '  CRIADOR,'
      '  PROPIETARIO,'
      '  ORIGEN_ANIMAL,'
      '  V11,'
      '  V12,'
      '  V13,'
      '  VUNO2,'
      '  SUBCATEGORIA,'
      '  V14,'
      '  INSPECCION,'
      '  V15,'
      '  DESTINO_CAB,'
      '  V16,'
      '  MOCHO,'
      '  V17,'
      '  COLOR,'
      '  NOMCOLOR'
      'from AUX_ANIMALES '
      'where'
      '  ID_AUX = :ID_AUX')
    SelectSQL.Strings = (
      'select * from AUX_ANIMALES where ID_ANIMAL=-1')
    ModifySQL.Strings = (
      'update AUX_ANIMALES'
      'set'
      '  ID_AUX = :ID_AUX,'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  ID_PC = :ID_PC,'
      '  ID_HBA = :ID_HBA,'
      '  ID_RA = :ID_RA,'
      '  ID_OTRO = :ID_OTRO,'
      '  NOMBRE = :NOMBRE,'
      '  FECHA_NACIMIENTO = :FECHA_NACIMIENTO,'
      '  SEXO = :SEXO,'
      '  PESO = :PESO,'
      '  ORIGEN = :ORIGEN,'
      '  CIRCUNFERENCIA_ESCROTAL = :CIRCUNFERENCIA_ESCROTAL,'
      '  ESTADO_REPRODUCTIVO = :ESTADO_REPRODUCTIVO,'
      '  ESTADO_LACTACION = :ESTADO_LACTACION,'
      '  POTRERO = :POTRERO,'
      '  LOTE = :LOTE,'
      '  RAZA = :RAZA,'
      '  RODEO = :RODEO,'
      '  CATEGORIA = :CATEGORIA,'
      '  ACTIVO = :ACTIVO,'
      '  CRONOLOGIA_DENTARIA = :CRONOLOGIA_DENTARIA,'
      '  CONDICION_CORPORAL = :CONDICION_CORPORAL,'
      '  MADRE_BIOLOGICA_EXTERNA = :MADRE_BIOLOGICA_EXTERNA,'
      '  MADRE_RECEPTORA_EXTERNA = :MADRE_RECEPTORA_EXTERNA,'
      '  GDR = :GDR,'
      '  PADRE_EXTERNO = :PADRE_EXTERNO,'
      '  MADRE_BIOLOGICA_INTERNA = :MADRE_BIOLOGICA_INTERNA,'
      '  MADRE_RECEPTORA_INTERNA = :MADRE_RECEPTORA_INTERNA,'
      '  PADRE_INTERNO = :PADRE_INTERNO,'
      '  APODO = :APODO,'
      '  V1 = :V1,'
      '  V2 = :V2,'
      '  V3 = :V3,'
      '  V4 = :V4,'
      '  V5 = :V5,'
      '  V6 = :V6,'
      '  EW = :EW,'
      '  DTA = :DTA,'
      '  V7 = :V7,'
      '  V8 = :V8,'
      '  V9 = :V9,'
      '  VUNO1 = :VUNO1,'
      '  TIPO_ALTA = :TIPO_ALTA,'
      '  FECHA_ALTA = :FECHA_ALTA,'
      '  OBSERVACION = :OBSERVACION,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  PRECIO_UNITARIO = :PRECIO_UNITARIO,'
      '  PRECIO_BRUTO = :PRECIO_BRUTO,'
      '  GASTOS = :GASTOS,'
      '  V10 = :V10,'
      '  ACTIVIDAD = :ACTIVIDAD,'
      '  ID_IE = :ID_IE,'
      '  ADN = :ADN,'
      '  TIPIFICACION_SANGUINEA = :TIPIFICACION_SANGUINEA,'
      '  CRIADOR = :CRIADOR,'
      '  PROPIETARIO = :PROPIETARIO,'
      '  ORIGEN_ANIMAL = :ORIGEN_ANIMAL,'
      '  V11 = :V11,'
      '  V12 = :V12,'
      '  V13 = :V13,'
      '  VUNO2 = :VUNO2,'
      '  SUBCATEGORIA = :SUBCATEGORIA,'
      '  V14 = :V14,'
      '  INSPECCION = :INSPECCION,'
      '  V15 = :V15,'
      '  DESTINO_CAB = :DESTINO_CAB,'
      '  V16 = :V16,'
      '  MOCHO = :MOCHO,'
      '  V17 = :V17,'
      '  COLOR = :COLOR,'
      '  NOMCOLOR = :NOMCOLOR'
      'where'
      '  ID_AUX = :OLD_ID_AUX')
    Filtered = True
    Left = 92
    Top = 56
    object DataSetNuevosID_RP: TIBStringField
      DisplayWidth = 10
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES.ID_RP'
      Size = 10
    end
    object DataSetNuevosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES.NOMBRE'
      OnSetText = DataSetNuevosNOMBRESetText
      Size = 50
    end
    object DataSetNuevosID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_ANIMALES.ID_ANIMAL'
      Required = True
    end
    object DataSetNuevosID_IE: TIBStringField
      FieldName = 'ID_IE'
      Origin = 'AUX_ANIMALES.ID_IE'
      Size = 64
    end
    object DataSetNuevosID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES.ID_AUX'
      Required = True
    end
    object DataSetNuevosESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'AUX_ANIMALES.ESTABLECIMIENTO'
    end
    object DataSetNuevosID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES.ID_SENASA'
      Size = 9
    end
    object DataSetNuevosID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES.ID_PC'
      Size = 10
    end
    object DataSetNuevosID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES.ID_HBA'
      Size = 10
    end
    object DataSetNuevosID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES.ID_RA'
      Size = 10
    end
    object DataSetNuevosID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES.ID_OTRO'
      Size = 10
    end
    object DataSetNuevosFECHA_NACIMIENTO: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'AUX_ANIMALES.FECHA_NACIMIENTO'
    end
    object DataSetNuevosSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES.SEXO'
    end
    object DataSetNuevosPESO: TFloatField
      FieldName = 'PESO'
      Origin = 'AUX_ANIMALES.PESO'
    end
    object DataSetNuevosORIGEN: TIBStringField
      FieldName = 'ORIGEN'
      Origin = 'AUX_ANIMALES.ORIGEN'
    end
    object DataSetNuevosCIRCUNFERENCIA_ESCROTAL: TFloatField
      FieldName = 'CIRCUNFERENCIA_ESCROTAL'
      Origin = 'AUX_ANIMALES.CIRCUNFERENCIA_ESCROTAL'
    end
    object DataSetNuevosESTADO_REPRODUCTIVO: TIntegerField
      FieldName = 'ESTADO_REPRODUCTIVO'
      Origin = 'AUX_ANIMALES.ESTADO_REPRODUCTIVO'
    end
    object DataSetNuevosESTADO_LACTACION: TIntegerField
      FieldName = 'ESTADO_LACTACION'
      Origin = 'AUX_ANIMALES.ESTADO_LACTACION'
    end
    object DataSetNuevosPOTRERO: TIntegerField
      FieldName = 'POTRERO'
      Origin = 'AUX_ANIMALES.POTRERO'
    end
    object DataSetNuevosLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'AUX_ANIMALES.LOTE'
    end
    object DataSetNuevosRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES.RAZA'
    end
    object DataSetNuevosRODEO: TIntegerField
      FieldName = 'RODEO'
      Origin = 'AUX_ANIMALES.RODEO'
    end
    object DataSetNuevosCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Origin = 'AUX_ANIMALES.CATEGORIA'
    end
    object DataSetNuevosACTIVO: TIBStringField
      FieldName = 'ACTIVO'
      Origin = 'AUX_ANIMALES.ACTIVO'
      Size = 1
    end
    object DataSetNuevosCRONOLOGIA_DENTARIA: TIntegerField
      FieldName = 'CRONOLOGIA_DENTARIA'
      Origin = 'AUX_ANIMALES.CRONOLOGIA_DENTARIA'
    end
    object DataSetNuevosCONDICION_CORPORAL: TIntegerField
      FieldName = 'CONDICION_CORPORAL'
      Origin = 'AUX_ANIMALES.CONDICION_CORPORAL'
    end
    object DataSetNuevosMADRE_BIOLOGICA_EXTERNA: TIntegerField
      FieldName = 'MADRE_BIOLOGICA_EXTERNA'
      Origin = 'AUX_ANIMALES.MADRE_BIOLOGICA_EXTERNA'
    end
    object DataSetNuevosMADRE_RECEPTORA_EXTERNA: TIntegerField
      FieldName = 'MADRE_RECEPTORA_EXTERNA'
      Origin = 'AUX_ANIMALES.MADRE_RECEPTORA_EXTERNA'
    end
    object DataSetNuevosGDR: TIntegerField
      FieldName = 'GDR'
      Origin = 'AUX_ANIMALES.GDR'
    end
    object DataSetNuevosPADRE_EXTERNO: TIntegerField
      FieldName = 'PADRE_EXTERNO'
      Origin = 'AUX_ANIMALES.PADRE_EXTERNO'
    end
    object DataSetNuevosMADRE_BIOLOGICA_INTERNA: TIntegerField
      FieldName = 'MADRE_BIOLOGICA_INTERNA'
      Origin = 'AUX_ANIMALES.MADRE_BIOLOGICA_INTERNA'
    end
    object DataSetNuevosMADRE_RECEPTORA_INTERNA: TIntegerField
      FieldName = 'MADRE_RECEPTORA_INTERNA'
      Origin = 'AUX_ANIMALES.MADRE_RECEPTORA_INTERNA'
    end
    object DataSetNuevosPADRE_INTERNO: TIntegerField
      FieldName = 'PADRE_INTERNO'
      Origin = 'AUX_ANIMALES.PADRE_INTERNO'
    end
    object DataSetNuevosAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES.APODO'
      Size = 100
    end
    object DataSetNuevosV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_ANIMALES.V1'
      Size = 50
    end
    object DataSetNuevosV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_ANIMALES.V2'
      Size = 50
    end
    object DataSetNuevosV3: TIBStringField
      FieldName = 'V3'
      Origin = 'AUX_ANIMALES.V3'
      Size = 50
    end
    object DataSetNuevosV4: TIBStringField
      FieldName = 'V4'
      Origin = 'AUX_ANIMALES.V4'
      Size = 50
    end
    object DataSetNuevosV5: TIBStringField
      FieldName = 'V5'
      Origin = 'AUX_ANIMALES.V5'
      Size = 50
    end
    object DataSetNuevosV6: TIBStringField
      FieldName = 'V6'
      Origin = 'AUX_ANIMALES.V6'
      Size = 50
    end
    object DataSetNuevosEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_ANIMALES.EW'
      Size = 1
    end
    object DataSetNuevosDTA: TIBStringField
      FieldName = 'DTA'
      Origin = 'AUX_ANIMALES.DTA'
      Size = 50
    end
    object DataSetNuevosV7: TIBStringField
      FieldName = 'V7'
      Origin = 'AUX_ANIMALES.V7'
      Size = 50
    end
    object DataSetNuevosV8: TIBStringField
      FieldName = 'V8'
      Origin = 'AUX_ANIMALES.V8'
      Size = 50
    end
    object DataSetNuevosV9: TIBStringField
      FieldName = 'V9'
      Origin = 'AUX_ANIMALES.V9'
      Size = 50
    end
    object DataSetNuevosVUNO1: TIBStringField
      FieldName = 'VUNO1'
      Origin = 'AUX_ANIMALES.VUNO1'
      Size = 1
    end
    object DataSetNuevosTIPO_ALTA: TIBStringField
      FieldName = 'TIPO_ALTA'
      Origin = 'AUX_ANIMALES.TIPO_ALTA'
    end
    object DataSetNuevosFECHA_ALTA: TDateField
      FieldName = 'FECHA_ALTA'
      Origin = 'AUX_ANIMALES.FECHA_ALTA'
    end
    object DataSetNuevosOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_ANIMALES.OBSERVACION'
      Size = 300
    end
    object DataSetNuevosRESPONSABLE: TIBStringField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_ANIMALES.RESPONSABLE'
      Size = 80
    end
    object DataSetNuevosPRECIO_UNITARIO: TFloatField
      FieldName = 'PRECIO_UNITARIO'
      Origin = 'AUX_ANIMALES.PRECIO_UNITARIO'
    end
    object DataSetNuevosPRECIO_BRUTO: TFloatField
      FieldName = 'PRECIO_BRUTO'
      Origin = 'AUX_ANIMALES.PRECIO_BRUTO'
    end
    object DataSetNuevosGASTOS: TFloatField
      FieldName = 'GASTOS'
      Origin = 'AUX_ANIMALES.GASTOS'
    end
    object DataSetNuevosV10: TIBStringField
      FieldName = 'V10'
      Origin = 'AUX_ANIMALES.V10'
      Size = 50
    end
    object DataSetNuevosACTIVIDAD: TIntegerField
      FieldName = 'ACTIVIDAD'
      Origin = 'AUX_ANIMALES.ACTIVIDAD'
    end
    object DataSetNuevosADN: TIBStringField
      FieldName = 'ADN'
      Origin = 'AUX_ANIMALES.ADN'
      Size = 255
    end
    object DataSetNuevosTIPIFICACION_SANGUINEA: TIBStringField
      FieldName = 'TIPIFICACION_SANGUINEA'
      Origin = 'AUX_ANIMALES.TIPIFICACION_SANGUINEA'
      Size = 255
    end
    object DataSetNuevosCRIADOR: TIntegerField
      FieldName = 'CRIADOR'
      Origin = 'AUX_ANIMALES.CRIADOR'
    end
    object DataSetNuevosPROPIETARIO: TIntegerField
      FieldName = 'PROPIETARIO'
      Origin = 'AUX_ANIMALES.PROPIETARIO'
    end
    object DataSetNuevosORIGEN_ANIMAL: TIntegerField
      FieldName = 'ORIGEN_ANIMAL'
      Origin = 'AUX_ANIMALES.ORIGEN_ANIMAL'
    end
    object DataSetNuevosV11: TIBStringField
      FieldName = 'V11'
      Origin = 'AUX_ANIMALES.V11'
      Size = 50
    end
    object DataSetNuevosV12: TIBStringField
      FieldName = 'V12'
      Origin = 'AUX_ANIMALES.V12'
      Size = 50
    end
    object DataSetNuevosV13: TIBStringField
      FieldName = 'V13'
      Origin = 'AUX_ANIMALES.V13'
      Size = 50
    end
    object DataSetNuevosVUNO2: TIBStringField
      FieldName = 'VUNO2'
      Origin = 'AUX_ANIMALES.VUNO2'
      Size = 1
    end
    object DataSetNuevosSUBCATEGORIA: TIntegerField
      FieldName = 'SUBCATEGORIA'
      Origin = 'AUX_ANIMALES.SUBCATEGORIA'
    end
    object DataSetNuevosV14: TIBStringField
      FieldName = 'V14'
      Origin = 'AUX_ANIMALES.V14'
      Size = 50
    end
    object DataSetNuevosINSPECCION: TIntegerField
      FieldName = 'INSPECCION'
      Origin = 'AUX_ANIMALES.INSPECCION'
    end
    object DataSetNuevosV15: TIBStringField
      FieldName = 'V15'
      Origin = 'AUX_ANIMALES.V15'
      Size = 50
    end
    object DataSetNuevosDESTINO_CAB: TIntegerField
      FieldName = 'DESTINO_CAB'
      Origin = 'AUX_ANIMALES.DESTINO_CAB'
    end
    object DataSetNuevosV16: TIBStringField
      FieldName = 'V16'
      Origin = 'AUX_ANIMALES.V16'
      Size = 50
    end
    object DataSetNuevosMOCHO: TIntegerField
      FieldName = 'MOCHO'
      Origin = 'AUX_ANIMALES.MOCHO'
    end
    object DataSetNuevosV17: TIBStringField
      FieldName = 'V17'
      Origin = 'AUX_ANIMALES.V17'
      Size = 50
    end
    object DataSetNuevosCOLOR: TIntegerField
      FieldName = 'COLOR'
      Origin = 'AUX_ANIMALES.COLOR'
    end
    object DataSetNuevosNOMCOLOR: TIBStringField
      FieldName = 'NOMCOLOR'
      Origin = 'AUX_ANIMALES.NOMCOLOR'
      Size = 50
    end
  end
  object IBQDeleteAuxAnimales: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from Aux_animales')
    Left = 740
    Top = 606
  end
end
