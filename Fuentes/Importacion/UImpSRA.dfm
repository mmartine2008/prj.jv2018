object Form2: TForm2
  Left = 247
  Top = 94
  BorderStyle = bsDialog
  Caption = 'Importaci'#243'n de Genealog'#237'a de SRA'
  ClientHeight = 590
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 767
    Height = 105
    Align = alTop
    Caption = 'Genealog'#237'a y Baja'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 59
      Width = 88
      Height = 13
      Caption = 'N'#250'mero de Criador'
    end
    object Label2: TLabel
      Left = 288
      Top = 11
      Width = 89
      Height = 13
      Caption = 'Cant Nac Machos:'
    end
    object Label3: TLabel
      Left = 288
      Top = 35
      Width = 93
      Height = 13
      Caption = 'Cant Nac Hembras:'
    end
    object Label4: TLabel
      Left = 288
      Top = 59
      Width = 110
      Height = 13
      Caption = 'Cant Altas Ext Machos:'
    end
    object Label5: TLabel
      Left = 288
      Top = 83
      Width = 114
      Height = 13
      Caption = 'Cant Altas Ext Hembras:'
    end
    object Label6: TLabel
      Left = 472
      Top = 11
      Width = 108
      Height = 13
      Caption = 'Cant Altas Dir Machos:'
    end
    object Label7: TLabel
      Left = 472
      Top = 35
      Width = 112
      Height = 13
      Caption = 'Cant Altas Dir Hembras:'
    end
    object LCantNacMachos: TLabel
      Left = 423
      Top = 11
      Width = 6
      Height = 13
      Caption = '0'
    end
    object LCantNacHembras: TLabel
      Left = 423
      Top = 35
      Width = 6
      Height = 13
      Caption = '0'
    end
    object LCantAltasExtMachos: TLabel
      Left = 423
      Top = 59
      Width = 6
      Height = 13
      Caption = '0'
    end
    object LCantAltasExtHembras: TLabel
      Left = 423
      Top = 83
      Width = 6
      Height = 13
      Caption = '0'
    end
    object LCantAltasDirHembras: TLabel
      Left = 609
      Top = 35
      Width = 6
      Height = 13
      Caption = '0'
    end
    object LCantAltasDirMachos: TLabel
      Left = 609
      Top = 11
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label8: TLabel
      Left = 608
      Top = 59
      Width = 111
      Height = 13
      Caption = 'Cant Animales Internos:'
    end
    object LCantAnimInternos: TLabel
      Left = 734
      Top = 59
      Width = 6
      Height = 13
      Caption = '0'
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 24
      Width = 105
      Height = 25
      Caption = 'Generar Genealog'#237'a'
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object Edit1: TEdit
      Left = 112
      Top = 56
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object BitBtn7: TBitBtn
      Left = 136
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Generar Baja'
      TabOrder = 2
      OnClick = BitBtn7Click
    end
    object BitBtn5: TBitBtn
      Left = 656
      Top = 16
      Width = 105
      Height = 25
      Caption = 'Convertir a Firebird'
      TabOrder = 3
      OnClick = BitBtn5Click
    end
    object BitBtn1: TBitBtn
      Left = 456
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Generar LOG'
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object ProgressBar1: TProgressBar
      Left = 568
      Top = 80
      Width = 185
      Height = 17
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 105
    Width = 767
    Height = 485
    Align = alClient
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 765
      Height = 240
      Align = alTop
      Caption = 'Altas - Nacimientos y Bajas'
      TabOrder = 0
      object MAltas: TMemo
        Left = 2
        Top = 15
        Width = 401
        Height = 223
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object MBaja: TMemo
        Left = 403
        Top = 15
        Width = 360
        Height = 223
        Align = alRight
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 241
      Width = 765
      Height = 243
      Caption = 'Errores'
      TabOrder = 1
      object MErrorAltas: TMemo
        Left = 2
        Top = 15
        Width = 401
        Height = 226
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object MErrorBaja: TMemo
        Left = 403
        Top = 15
        Width = 360
        Height = 226
        Align = alRight
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DSN=dBASE Files;DBQ=C:\CD RURAL 28 - 03 - 2011;DefaultDir=C:' +
      '\CD RURAL 28 - 03 - 2011;DriverId=533;MaxBufferSize=2048;PageTim' +
      'eout=5;"'
    DefaultDatabase = 'C:\CD Rural 28 - 03 - 2011'
    Provider = 'MSDASQL.1'
    Left = 624
    Top = 96
  end
  object ADOTPadreSRA: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'PDRE'
    Left = 600
    Top = 128
  end
  object DSPadreSRA: TDataSource
    DataSet = ADOTPadreSRA
    Left = 632
    Top = 128
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'cria'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from pdre where cria = :cria order by fnac asc')
    Left = 604
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 644
    Top = 168
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 652
    Top = 208
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'hbae'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from pdre where hbae = :hbae')
    Left = 604
    Top = 208
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'hbae'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from exis where hbae = :hbae')
    Left = 604
    Top = 248
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 652
    Top = 248
  end
  object IBQSPEventoIndParto: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_PARTO_PRINCIPAL ('
      '  :FECHA,'
      '  :ESTABLECIMIENTO,'
      '  :RESPONSABLE,'
      '  :LOG_USUARIO,'
      '  :LOG_FECHA_MODIFICADO,'
      '  :DISPARADOR,'
      '  :ANIMAL,'
      '  :MADRE_BIOLOGICA,'
      '  :POTRERO,'
      '  :RODEO,'
      '  :OBSERVACION,'
      '  :CANTIDAD,'
      '  :CONDICION_CORPORAL,'
      '  :CAUSA,'
      '  :GRADO,'
      '  :OBSERVACION_DISTOCIA,'
      '  :SEXO0,'
      '  :SEXO1,'
      '  :SEXO2,'
      '  :VIVO0,'
      '  :VIVO1,'
      '  :VIVO2,'
      '  :PESO0,'
      '  :PESO1,'
      '  :PESO2,'
      '  :OBSERVACION_NACIMIENTOS,'
      '  :PADRE,'
      '  :RP0,'
      '  :RP1,'
      '  :RP2,'
      '  :SEN0,'
      '  :SEN1,'
      '  :SEN2,'
      '  :PC0,'
      '  :PC1,'
      '  :PC2,'
      '  :HBA0,'
      '  :HBA1,'
      '  :HBA2,'
      '  :RA0,'
      '  :RA1,'
      '  :RA2,'
      '  :OTRO0,'
      '  :OTRO1,'
      '  :OTRO2,'
      '  :IE0,'
      '  :IE1,'
      '  :IE2,'
      '  0,0,0,null,null,null)')
    Left = 600
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
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
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE_BIOLOGICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RODEO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANTIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONDICION_CORPORAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAUSA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION_DISTOCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VIVO0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VIVO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VIVO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION_NACIMIENTOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PADRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RP0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RP1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RP2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEN0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PC0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PC1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PC2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBA0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RA0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OTRO0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OTRO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OTRO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IE0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IE2'
        ParamType = ptUnknown
      end>
  end
  object IBQGenId: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_ID_TABANIMALEXTERNO, 1)  AS IDEXT FROM RDB$DAT' +
        'ABASE')
    Left = 624
    Top = 408
  end
  object IBQAbmSimple: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'insert into TAB_ANIMALES_EXTERNOS'
      
        '  (APODO, ID_ANIMAL_EXTERNO, ID_HBA, SEXO, ID_OTRO, ID_PC, ID_RA' +
        ', '
      'ID_RP, '
      '   ID_SENASA, RAZA, ESTABLECIMIENTO, CRIADOR, '
      
        'PROPIETARIO, FECHA_NACIMIENTO, NOMBRE, ADN, TIPIFICACION_SANGUIN' +
        'EA)'
      'values'
      
        '  (:APODO, :ID_ANIMAL_EXTERNO, :ID_HBA, :SEXO, :ID_OTRO, :ID_PC,' +
        ' :ID_RA, '
      '   :ID_RP, :ID_SENASA, :RAZA, :ESTABLECIMIENTO, :CRIADOR, '
      
        ':PROPIETARIO, :FECHA_NACIMIENTO, :NOMBRE_ANIMAL, :ADN, :TIPIFICA' +
        'CION_SANGUINEA)')
    Filtered = True
    GeneratorField.Field = 'ID_ANIMAL_EXTERNO'
    GeneratorField.Generator = 'GEN_ID_TABANIMALEXTERNO'
    Left = 608
    Top = 358
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'APODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ANIMAL_EXTERNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_HBA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_OTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_RA'
        ParamType = ptUnknown
      end
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
        Name = 'RAZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Establecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PROPIETARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_NACIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE_ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPIFICACION_SANGUINEA'
        ParamType = ptUnknown
      end>
    object IBQAbmSimpleAPODO: TIBStringField
      DisplayWidth = 50
      FieldName = 'APODO'
      Origin = 'TAB_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQAbmSimpleID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQAbmSimpleID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQAbmSimpleSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'TAB_ANIMALES_EXTERNOS.SEXO'
      Required = True
    end
    object IBQAbmSimpleNOMSEX: TIBStringField
      FieldName = 'NOMSEX'
      Origin = 'COD_SEXOS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBQAbmSimpleNOMRAZ: TIBStringField
      FieldName = 'NOMRAZ'
      Origin = 'COD_RAZAS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBQAbmSimpleID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQAbmSimpleID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQAbmSimpleID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQAbmSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RP'
      Required = True
      Size = 10
    end
    object IBQAbmSimpleID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQAbmSimpleRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'TAB_ANIMALES_EXTERNOS.RAZA'
      Required = True
    end
    object IBQAbmSimpleESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ESTABLECIMIENTO'
      Required = True
    end
    object IBQAbmSimpleKEYVALUE: TIBStringField
      FieldName = 'KEYVALUE'
      Required = True
      Size = 13
    end
    object IBQAbmSimpleNOMBRE_ANIMAL: TIBStringField
      FieldName = 'NOMBRE_ANIMAL'
      Origin = 'TAB_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQAbmSimpleCRIADOR: TIBStringField
      FieldName = 'CRIADOR'
      Origin = 'TAB_ANIMALES_EXTERNOS.CRIADOR'
      Size = 50
    end
    object IBQAbmSimpleNOM_PROP: TIBStringField
      FieldName = 'NOM_PROP'
      Origin = 'COD_PROPIETARIO.NOMBRE'
      Size = 100
    end
    object IBQAbmSimplePROPIETARIO: TIntegerField
      FieldName = 'PROPIETARIO'
      Origin = 'TAB_ANIMALES_EXTERNOS.PROPIETARIO'
    end
    object IBQAbmSimpleFECHA_NACIMIENTO: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.FECHA_NACIMIENTO'
    end
    object IBQAbmSimpleADN: TIBStringField
      FieldName = 'ADN'
      Origin = 'TAB_ANIMALES_EXTERNOS.ADN'
      Size = 255
    end
    object IBQAbmSimpleTIPIFICACION_SANGUINEA: TIBStringField
      FieldName = 'TIPIFICACION_SANGUINEA'
      Origin = 'TAB_ANIMALES_EXTERNOS.TIPIFICACION_SANGUINEA'
      Size = 255
    end
  end
  object DSAbmSimple: TDataSource
    DataSet = IBQAbmSimple
    Left = 672
    Top = 358
  end
  object IBQVerificarHBAInterno: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from tab_animales where id_hba = :hba and sexo = :sexo ' +
        'and establecimiento = :esta')
    Left = 448
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'hba'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQVerificarHBAExterno: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from tab_animales_externos where id_hba = :hba and sexo' +
        ' = :sexo and establecimiento = :esta')
    Left = 448
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'hba'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'hbex'
        Size = -1
        Value = Null
      end
      item
        Name = 'sexo'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from extr where hbex = :hbex and sexo = :sexo')
    Left = 604
    Top = 288
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 668
    Top = 296
  end
  object IBQGenIDAnimal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_ID_TABANIMAL, 1)  AS IDANIMAL FROM RDB$DATABAS' +
        'E')
    Left = 464
    Top = 320
  end
  object IBQSPEventoIndAltaDirecta: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Execute PROCEDURE SP_ALTA_DIRECTA_ANIMAL'
      
        ' ( :IDNUEVOANIMAL, :ID_RP , :ID_SENASA , :FECHA_NACIMIENTO , :PE' +
        'SO ,  :MADRE_BIOLOGICA_EXTERNA , :ESTADO_LACTACION ,'
      '  :RODEO , :RAZA , :POTRERO , :CATEGORIA ,'
      '  :CRONOLOGIA_DENTARIA , :CONDICION_CORPORAL ,'
      '  :GDR , :CIRCUNFERENCIA_ESCROTAL , :ESTADO_REPRODUCTIVO,'
      
        '  :ID_PC , :ID_HBA , :ID_RA , :ID_OTRO , :NOMBRE , :APODO, :SEXO' +
        ' ,'
      '  :MADRE_RECEPTORA_EXTERNA , :FECHA_EVENTO ,'
      '  :TIPO_ALTA , :PRECIO_BRUTO , :PRECIO_UNITARIO,'
      '  :OBSERVACION , :ESTABLECIMIENTO , :RESPONSABLE ,'
      '  :LOG_USUARIO , :LOG_FECHA_MODIFICADO , :ID_AUX ,'
      
        '  :ID_AUXPE , :PADRE_EXTERNO, :DISPARADOR, :ID_GRUPO,   :GASTOS,' +
        ' :MADRE_BIOLOGICA_INTERNA ,  '
      
        '  :MADRE_RECEPTORA_INTERNA , :PADRE_INTERNO, :DTA,:DIASPESO, :AC' +
        'TIVIDAD,:ID_IE,:PROPIETARIO,:CRIADOR,:ORIGEN,:ADN,:TIPIFICACIONS' +
        'ANGUINEA,:CASTRADO,0,0,0,0,0,0)'
      ''
      ''
      '')
    Left = 440
    Top = 254
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDNUEVOANIMAL'
        ParamType = ptUnknown
      end
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
        Name = 'MADRE_BIOLOGICA_INTERNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE_RECEPTORA_INTERNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PADRE_INTERNO'
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
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PROPIETARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORIGEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPIFICACIONSANGUINEA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CASTRADO'
        ParamType = ptUnknown
      end>
  end
  object DSIBQ_SPEventoIndAltaDirecta: TDataSource
    DataSet = IBQSPEventoIndAltaDirecta
    Left = 472
    Top = 254
  end
  object IBTSRA: TIBTransaction
    Active = False
    DefaultDatabase = IBDSRA
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 112
    Top = 96
  end
  object IBDSRA: TIBDatabase
    DatabaseName = 'C:\CD Rural 28 - 03 - 2011\SRAPADRES.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTSRA
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = [tfError, tfTransact]
    Left = 72
    Top = 88
  end
  object IBQInsertPDRE: TIBQuery
    Database = IBDSRA
    Transaction = IBTSRA
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'insert into PADRES'
      
        '    (IDPADRE, RAZA, RGST, VARI, ASOC, HBAE, CDPX, RPEX, NOMB, CB' +
        'AJ,'
      
        '    OBSI, DADO, PROP, CRIA, TRAN, ANLS, RANA, CALG, APRB, SIET, ' +
        'DONA, MELL,'
      
        '    TRNS, TSER, EMBA, COLO, RGSP, VARP, ASOP, HBAP, RPPD, RGSM, ' +
        'VARM, ASOM,'
      
        '    HBAM, RPMD, RPTI, FNAC, FBAJ, FESB, FOBS, FTRF, FSER, CPEL, ' +
        'CCUE, CCAB,'
      
        '    CMIE, RPNU, APDO, PENA, PEDE, PEFI, EPNA, EPDE, EPFI, NROC, ' +
        'SIGLA, SIGPA,'
      '    SIGMA, PURE, TANA)'
      'values'
      
        '    (:IDPADRE, :RAZA, :RGST, :VARI, :ASOC, :HBAE, :CDPX, :RPEX, ' +
        ':NOMB, :CBAJ,'
      
        '    :OBSI, :DADO, :PROP, :CRIA, :TRAN, :ANLS, :RANA, :CALG, :APR' +
        'B, :SIET, :DONA, :MELL,'
      
        '    :TRNS, :TSER, :EMBA, :COLO, :RGSP, :VARP, :ASOP, :HBAP, :RPP' +
        'D, :RGSM, :VARM, :ASOM,'
      
        '    :HBAM, :RPMD, :RPTI, :FNAC, :FBAJ, :FESB, :FOBS, :FTRF, :FSE' +
        'R, :CPEL, :CCUE, :CCAB,'
      
        '    :CMIE, :RPNU, :APDO, :PENA, :PEDE, :PEFI, :EPNA, :EPDE, :EPF' +
        'I, :NROC, :SIGLA, :SIGPA,'
      '    :SIGMA, :PURE, :TANA)')
    Filtered = True
    Left = 80
    Top = 134
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPADRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RAZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RGST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VARI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ASOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBAE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CDPX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RPEX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CBAJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TRAN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANLS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RANA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APRB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIET'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MELL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TRNS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TSER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMBA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RGSP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VARP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ASOP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBAP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RPPD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RGSM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VARM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ASOM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBAM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RPMD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RPTI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FNAC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FBAJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FESB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FOBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FTRF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FSER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CPEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CCUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CCAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CMIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RPNU'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PENA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PEDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PEFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EPNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EPDE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EPFI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGLA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGPA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PURE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TANA'
        ParamType = ptUnknown
      end>
    object IBStringField1: TIBStringField
      DisplayWidth = 50
      FieldName = 'APODO'
      Origin = 'TAB_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBStringField2: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IntegerField2: TIntegerField
      FieldName = 'SEXO'
      Origin = 'TAB_ANIMALES_EXTERNOS.SEXO'
      Required = True
    end
    object IBStringField3: TIBStringField
      FieldName = 'NOMSEX'
      Origin = 'COD_SEXOS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBStringField4: TIBStringField
      FieldName = 'NOMRAZ'
      Origin = 'COD_RAZAS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBStringField5: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBStringField6: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBStringField7: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBStringField8: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RP'
      Required = True
      Size = 10
    end
    object IBStringField9: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IntegerField3: TIntegerField
      FieldName = 'RAZA'
      Origin = 'TAB_ANIMALES_EXTERNOS.RAZA'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ESTABLECIMIENTO'
      Required = True
    end
    object IBStringField10: TIBStringField
      FieldName = 'KEYVALUE'
      Required = True
      Size = 13
    end
    object IBStringField11: TIBStringField
      FieldName = 'NOMBRE_ANIMAL'
      Origin = 'TAB_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBStringField12: TIBStringField
      FieldName = 'CRIADOR'
      Origin = 'TAB_ANIMALES_EXTERNOS.CRIADOR'
      Size = 50
    end
    object IBStringField13: TIBStringField
      FieldName = 'NOM_PROP'
      Origin = 'COD_PROPIETARIO.NOMBRE'
      Size = 100
    end
    object IntegerField5: TIntegerField
      FieldName = 'PROPIETARIO'
      Origin = 'TAB_ANIMALES_EXTERNOS.PROPIETARIO'
    end
    object DateField1: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.FECHA_NACIMIENTO'
    end
    object IBStringField14: TIBStringField
      FieldName = 'ADN'
      Origin = 'TAB_ANIMALES_EXTERNOS.ADN'
      Size = 255
    end
    object IBStringField15: TIBStringField
      FieldName = 'TIPIFICACION_SANGUINEA'
      Origin = 'TAB_ANIMALES_EXTERNOS.TIPIFICACION_SANGUINEA'
      Size = 255
    end
  end
  object DSInsertPDRE: TDataSource
    DataSet = IBQInsertPDRE
    Left = 144
    Top = 134
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from EXIS where (hbae<> 517287) and (hbae<> 363199) and' +
        '(hbae<> 269518) and(hbae<> 732132) and'
      '(hbae<> 748271) and(hbae<> 749287) and'
      '(hbae<> 731856) and(hbae<> 731848) and'
      '         (hbae<> 721798) and(hbae<> 713502) and'
      '         (hbae<> 710277) and(hbae<> 753661) and'
      '         (hbae<> 741890) and(hbae<> 755520) and'
      '         (hbae<> 717138) and(hbae<> 730854)')
    Left = 156
    Top = 296
  end
  object DataSource5: TDataSource
    DataSet = ADOQuery5
    Left = 204
    Top = 304
  end
  object IBQGenIdPadre: TIBQuery
    Database = IBDSRA
    Transaction = IBTSRA
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_ID_TAB_PADRES, 1)  AS IDPADRE FROM RDB$DATABAS' +
        'E')
    Left = 32
    Top = 144
  end
  object IBQRelPadres: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'insert into REL_ANIMALES_PADRES_EXT'
      '    (ID_PADRE, ID_HIJO, ESTABLECIMIENTO)'
      'values'
      '    (:ID_PADRE, :ID_HIJO,:ESTABLECIMIENTO)')
    Filtered = True
    Left = 664
    Top = 398
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PADRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_HIJO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
    object IBStringField16: TIBStringField
      DisplayWidth = 50
      FieldName = 'APODO'
      Origin = 'TAB_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IntegerField6: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBStringField17: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IntegerField7: TIntegerField
      FieldName = 'SEXO'
      Origin = 'TAB_ANIMALES_EXTERNOS.SEXO'
      Required = True
    end
    object IBStringField18: TIBStringField
      FieldName = 'NOMSEX'
      Origin = 'COD_SEXOS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBStringField19: TIBStringField
      FieldName = 'NOMRAZ'
      Origin = 'COD_RAZAS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBStringField20: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBStringField21: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBStringField22: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBStringField23: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RP'
      Required = True
      Size = 10
    end
    object IBStringField24: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IntegerField8: TIntegerField
      FieldName = 'RAZA'
      Origin = 'TAB_ANIMALES_EXTERNOS.RAZA'
      Required = True
    end
    object IntegerField9: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ESTABLECIMIENTO'
      Required = True
    end
    object IBStringField25: TIBStringField
      FieldName = 'KEYVALUE'
      Required = True
      Size = 13
    end
    object IBStringField26: TIBStringField
      FieldName = 'NOMBRE_ANIMAL'
      Origin = 'TAB_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBStringField27: TIBStringField
      FieldName = 'CRIADOR'
      Origin = 'TAB_ANIMALES_EXTERNOS.CRIADOR'
      Size = 50
    end
    object IBStringField28: TIBStringField
      FieldName = 'NOM_PROP'
      Origin = 'COD_PROPIETARIO.NOMBRE'
      Size = 100
    end
    object IntegerField10: TIntegerField
      FieldName = 'PROPIETARIO'
      Origin = 'TAB_ANIMALES_EXTERNOS.PROPIETARIO'
    end
    object DateField2: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.FECHA_NACIMIENTO'
    end
    object IBStringField29: TIBStringField
      FieldName = 'ADN'
      Origin = 'TAB_ANIMALES_EXTERNOS.ADN'
      Size = 255
    end
    object IBStringField30: TIBStringField
      FieldName = 'TIPIFICACION_SANGUINEA'
      Origin = 'TAB_ANIMALES_EXTERNOS.TIPIFICACION_SANGUINEA'
      Size = 255
    end
  end
  object IBQRelMadres: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'insert into REL_ANIMALES_MADRES_EXT'
      '    (ID_MADRE, ID_HIJO, ESTABLECIMIENTO)'
      'values'
      '    (:ID_MADRE, :ID_HIJO,:ESTABLECIMIENTO)')
    Filtered = True
    Left = 696
    Top = 398
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_MADRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_HIJO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
    object IBStringField31: TIBStringField
      DisplayWidth = 50
      FieldName = 'APODO'
      Origin = 'TAB_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IntegerField11: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBStringField32: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IntegerField12: TIntegerField
      FieldName = 'SEXO'
      Origin = 'TAB_ANIMALES_EXTERNOS.SEXO'
      Required = True
    end
    object IBStringField33: TIBStringField
      FieldName = 'NOMSEX'
      Origin = 'COD_SEXOS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBStringField34: TIBStringField
      FieldName = 'NOMRAZ'
      Origin = 'COD_RAZAS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBStringField35: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBStringField36: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBStringField37: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBStringField38: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RP'
      Required = True
      Size = 10
    end
    object IBStringField39: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IntegerField13: TIntegerField
      FieldName = 'RAZA'
      Origin = 'TAB_ANIMALES_EXTERNOS.RAZA'
      Required = True
    end
    object IntegerField14: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ESTABLECIMIENTO'
      Required = True
    end
    object IBStringField40: TIBStringField
      FieldName = 'KEYVALUE'
      Required = True
      Size = 13
    end
    object IBStringField41: TIBStringField
      FieldName = 'NOMBRE_ANIMAL'
      Origin = 'TAB_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBStringField42: TIBStringField
      FieldName = 'CRIADOR'
      Origin = 'TAB_ANIMALES_EXTERNOS.CRIADOR'
      Size = 50
    end
    object IBStringField43: TIBStringField
      FieldName = 'NOM_PROP'
      Origin = 'COD_PROPIETARIO.NOMBRE'
      Size = 100
    end
    object IntegerField15: TIntegerField
      FieldName = 'PROPIETARIO'
      Origin = 'TAB_ANIMALES_EXTERNOS.PROPIETARIO'
    end
    object DateField3: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.FECHA_NACIMIENTO'
    end
    object IBStringField44: TIBStringField
      FieldName = 'ADN'
      Origin = 'TAB_ANIMALES_EXTERNOS.ADN'
      Size = 255
    end
    object IBStringField45: TIBStringField
      FieldName = 'TIPIFICACION_SANGUINEA'
      Origin = 'TAB_ANIMALES_EXTERNOS.TIPIFICACION_SANGUINEA'
      Size = 255
    end
  end
  object IBQInsAuxAnimExternos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'insert into AUX_ANIMALES_EXTERNOS'
      '    (ID_ANIMAL_EXTERNO, INTERNO, SEXO, ID_AUX)'
      'values'
      '    (:ID_ANIMAL_EXTERNO, :INTERNO, :SEXO, :ID_AUX)')
    Filtered = True
    Left = 528
    Top = 406
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_ANIMAL_EXTERNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AUX'
        ParamType = ptUnknown
      end>
    object IBStringField46: TIBStringField
      DisplayWidth = 50
      FieldName = 'APODO'
      Origin = 'TAB_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IntegerField16: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBStringField47: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IntegerField17: TIntegerField
      FieldName = 'SEXO'
      Origin = 'TAB_ANIMALES_EXTERNOS.SEXO'
      Required = True
    end
    object IBStringField48: TIBStringField
      FieldName = 'NOMSEX'
      Origin = 'COD_SEXOS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBStringField49: TIBStringField
      FieldName = 'NOMRAZ'
      Origin = 'COD_RAZAS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBStringField50: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBStringField51: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBStringField52: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBStringField53: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RP'
      Required = True
      Size = 10
    end
    object IBStringField54: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IntegerField18: TIntegerField
      FieldName = 'RAZA'
      Origin = 'TAB_ANIMALES_EXTERNOS.RAZA'
      Required = True
    end
    object IntegerField19: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ESTABLECIMIENTO'
      Required = True
    end
    object IBStringField55: TIBStringField
      FieldName = 'KEYVALUE'
      Required = True
      Size = 13
    end
    object IBStringField56: TIBStringField
      FieldName = 'NOMBRE_ANIMAL'
      Origin = 'TAB_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBStringField57: TIBStringField
      FieldName = 'CRIADOR'
      Origin = 'TAB_ANIMALES_EXTERNOS.CRIADOR'
      Size = 50
    end
    object IBStringField58: TIBStringField
      FieldName = 'NOM_PROP'
      Origin = 'COD_PROPIETARIO.NOMBRE'
      Size = 100
    end
    object IntegerField20: TIntegerField
      FieldName = 'PROPIETARIO'
      Origin = 'TAB_ANIMALES_EXTERNOS.PROPIETARIO'
    end
    object DateField4: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.FECHA_NACIMIENTO'
    end
    object IBStringField59: TIBStringField
      FieldName = 'ADN'
      Origin = 'TAB_ANIMALES_EXTERNOS.ADN'
      Size = 255
    end
    object IBStringField60: TIBStringField
      FieldName = 'TIPIFICACION_SANGUINEA'
      Origin = 'TAB_ANIMALES_EXTERNOS.TIPIFICACION_SANGUINEA'
      Size = 255
    end
  end
  object IBQDelAuxAnimExternos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'delete from aux_animales_externos')
    Filtered = True
    Left = 528
    Top = 438
    object IBStringField61: TIBStringField
      DisplayWidth = 50
      FieldName = 'APODO'
      Origin = 'TAB_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IntegerField21: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBStringField62: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IntegerField22: TIntegerField
      FieldName = 'SEXO'
      Origin = 'TAB_ANIMALES_EXTERNOS.SEXO'
      Required = True
    end
    object IBStringField63: TIBStringField
      FieldName = 'NOMSEX'
      Origin = 'COD_SEXOS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBStringField64: TIBStringField
      FieldName = 'NOMRAZ'
      Origin = 'COD_RAZAS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBStringField65: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBStringField66: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBStringField67: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBStringField68: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RP'
      Required = True
      Size = 10
    end
    object IBStringField69: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IntegerField23: TIntegerField
      FieldName = 'RAZA'
      Origin = 'TAB_ANIMALES_EXTERNOS.RAZA'
      Required = True
    end
    object IntegerField24: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ESTABLECIMIENTO'
      Required = True
    end
    object IBStringField70: TIBStringField
      FieldName = 'KEYVALUE'
      Required = True
      Size = 13
    end
    object IBStringField71: TIBStringField
      FieldName = 'NOMBRE_ANIMAL'
      Origin = 'TAB_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBStringField72: TIBStringField
      FieldName = 'CRIADOR'
      Origin = 'TAB_ANIMALES_EXTERNOS.CRIADOR'
      Size = 50
    end
    object IBStringField73: TIBStringField
      FieldName = 'NOM_PROP'
      Origin = 'COD_PROPIETARIO.NOMBRE'
      Size = 100
    end
    object IntegerField25: TIntegerField
      FieldName = 'PROPIETARIO'
      Origin = 'TAB_ANIMALES_EXTERNOS.PROPIETARIO'
    end
    object DateField5: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'TAB_ANIMALES_EXTERNOS.FECHA_NACIMIENTO'
    end
    object IBStringField74: TIBStringField
      FieldName = 'ADN'
      Origin = 'TAB_ANIMALES_EXTERNOS.ADN'
      Size = 255
    end
    object IBStringField75: TIBStringField
      FieldName = 'TIPIFICACION_SANGUINEA'
      Origin = 'TAB_ANIMALES_EXTERNOS.TIPIFICACION_SANGUINEA'
      Size = 255
    end
  end
  object IBQGenerador: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_ID_AUXANIMALEXTERNO, 1)  AS IDAUXPE FROM RDB$D' +
        'ATABASE')
    GeneratorField.Field = 'ID_AUX'
    Left = 552
    Top = 328
  end
  object IBQuery1: TIBQuery
    Database = IBDSRAPADRES
    Transaction = IBTSRAPADRES
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from padres where prop = :cria order by fnac asc'
      ''
      ''
      '')
    Left = 352
    Top = 102
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cria'
        ParamType = ptUnknown
      end>
  end
  object DataSource6: TDataSource
    DataSet = IBQuery1
    Left = 384
    Top = 102
  end
  object IBQuery2: TIBQuery
    Database = IBDSRAPADRES
    Transaction = IBTSRAPADRES
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from padres where hbae = :hbae'
      ''
      ''
      ''
      '')
    Left = 352
    Top = 142
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'hbae'
        ParamType = ptUnknown
      end>
  end
  object DataSource7: TDataSource
    DataSet = IBQuery2
    Left = 384
    Top = 142
  end
  object IBQuery3: TIBQuery
    Database = IBDSRAMADRES
    Transaction = IBTSRAMADRES
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from padres where hbae = :hbae'
      ''
      ''
      ''
      ''
      '')
    Left = 352
    Top = 182
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'hbae'
        ParamType = ptUnknown
      end>
  end
  object DataSource8: TDataSource
    DataSet = IBQuery3
    Left = 384
    Top = 182
  end
  object IBDSRAPADRES: TIBDatabase
    DatabaseName = 'C:\CD Rural 28 - 03 - 2011\SRAPADRES.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTSRAPADRES
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = [tfError, tfTransact]
    Left = 248
    Top = 80
  end
  object IBTSRAPADRES: TIBTransaction
    Active = False
    DefaultDatabase = IBDSRAPADRES
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 288
    Top = 88
  end
  object IBDSRAMADRES: TIBDatabase
    DatabaseName = 'C:\CD Rural 28 - 03 - 2011\SRAMADRES.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTSRAMADRES
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = [tfError, tfTransact]
    Left = 248
    Top = 136
  end
  object IBTSRAMADRES: TIBTransaction
    Active = False
    DefaultDatabase = IBDSRAMADRES
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 288
    Top = 144
  end
  object IBQuery4: TIBQuery
    Database = IBDPADRESEXTERNOS
    Transaction = IBTPADRESEXTERNOS
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from PADRESEXTERNOS where hbex = :hbex and sexo = :sexo' +
        ' and hbex <> hbap and hbex <> hbam and hbex <> '#39'0'#39
      ''
      ''
      ''
      ''
      '')
    Left = 352
    Top = 230
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'hbex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sexo'
        ParamType = ptUnknown
      end>
  end
  object DataSource9: TDataSource
    DataSet = IBQuery4
    Left = 384
    Top = 230
  end
  object IBDPADRESEXTERNOS: TIBDatabase
    DatabaseName = 'C:\CD Rural 28 - 03 - 2011\PADRESEXTERNOS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTPADRESEXTERNOS
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = [tfError, tfTransact]
    Left = 248
    Top = 184
  end
  object IBTPADRESEXTERNOS: TIBTransaction
    Active = False
    DefaultDatabase = IBDPADRESEXTERNOS
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 288
    Top = 192
  end
  object IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_RP,'
      '  ESTABLECIMIENTO,'
      '  ID_ANIMAL_EXTERNO,'
      '  ID_SENASA,'
      '  ID_PC,'
      '  ID_HBA,'
      '  ID_RA,'
      '  ID_OTRO,'
      '  NOMBRE,'
      '  APODO,'
      '  RAZA,'
      '  SEXO,'
      '  CRIADOR,'
      '  PROPIETARIO,'
      '  FECHA_NACIMIENTO,'
      '  NOMBRE,'
      '  ADN,'
      '  TIPIFICACION_SANGUINEA'
      'from TAB_ANIMALES_EXTERNOS '
      'where'
      '  ID_ANIMAL_EXTERNO = :ID_ANIMAL_EXTERNO')
    ModifySQL.Strings = (
      'update TAB_ANIMALES_EXTERNOS'
      'set'
      '  APODO = :APODO,'
      '  ID_ANIMAL_EXTERNO = :ID_ANIMAL_EXTERNO,'
      '  ID_HBA = :ID_HBA,'
      '  SEXO = :SEXO,'
      '  ID_OTRO = :ID_OTRO,'
      '  ID_PC = :ID_PC,'
      '  ID_RA = :ID_RA,'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  RAZA = :RAZA,'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO,'
      '  CRIADOR = :CRIADOR,'
      '  PROPIETARIO = :PROPIETARIO,'
      '  FECHA_NACIMIENTO = :FECHA_NACIMIENTO,'
      '  NOMBRE = :NOMBRE_ANIMAL,'
      '  ADN=:ADN, '
      '  TIPIFICACION_SANGUINEA=:TIPIFICACION_SANGUINEA'
      'where'
      '  ID_ANIMAL_EXTERNO = :OLD_ID_ANIMAL_EXTERNO')
    InsertSQL.Strings = (
      'insert into TAB_ANIMALES_EXTERNOS'
      
        '  (APODO, ID_ANIMAL_EXTERNO, ID_HBA, SEXO, ID_OTRO, ID_PC, ID_RA' +
        ', '
      'ID_RP, '
      '   ID_SENASA, RAZA, ESTABLECIMIENTO, CRIADOR, '
      
        'PROPIETARIO, FECHA_NACIMIENTO, NOMBRE, ADN, TIPIFICACION_SANGUIN' +
        'EA)'
      'values'
      
        '  (:APODO, :ID_ANIMAL_EXTERNO, :ID_HBA, :SEXO, :ID_OTRO, :ID_PC,' +
        ' :ID_RA, '
      '   :ID_RP, :ID_SENASA, :RAZA, :ESTABLECIMIENTO, :CRIADOR, '
      
        ':PROPIETARIO, :FECHA_NACIMIENTO, :NOMBRE_ANIMAL, :ADN, :TIPIFICA' +
        'CION_SANGUINEA)')
    DeleteSQL.Strings = (
      'delete from TAB_ANIMALES_EXTERNOS'
      'where'
      '  ID_ANIMAL_EXTERNO = :OLD_ID_ANIMAL_EXTERNO')
    Left = 640
    Top = 360
  end
  object IBQSPEventoIndBaja: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_Baja'
      '( :FECHA,  :ANIMAL,  :OBSERVACION,  :ESTABLECIMIENTO,'
      '  :RESPONSABLE,  :LOG_USUARIO,  :LOG_FECHA_MODIFICADO,'
      
        '  :TIPO,  :PESO,  :PRECIO,  :ID_GRUPO,  :DISPARADOR, :DTA,:PESOD' +
        'ESTINO, :DESTINO, :REMITO)')
    Left = 232
    Top = 414
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
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
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESODESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REMITO'
        ParamType = ptUnknown
      end>
  end
  object DSIBQ_SPEventoIndBaja: TDataSource
    DataSet = IBQSPEventoIndBaja
    Left = 264
    Top = 414
  end
  object IBQuery5: TIBQuery
    Database = IBDSRAMADRES
    Transaction = IBTSRAMADRES
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from padres where prop = :cria order by fnac asc'
      ''
      ''
      '')
    Left = 432
    Top = 102
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cria'
        ParamType = ptUnknown
      end>
  end
  object DataSource10: TDataSource
    DataSet = IBQuery5
    Left = 464
    Top = 102
  end
end
