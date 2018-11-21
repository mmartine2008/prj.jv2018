inherited FVerAlarma: TFVerAlarma
  Left = 224
  Caption = 'FVerAlarma'
  ClientHeight = 505
  ClientWidth = 618
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 618
    Picture.Data = {
      0B544A76474946496D61676531010000474946383961B7030900A20000B5D4AD
      DADBDCEDEEEEFDFDFD47AA420000000000000000002C00000000B70309000003
      FE48BADCFE30CA49ABBD38EBCDBBFF60288E64699E68AAAE6CEBBE702CCF746D
      DF78AEEF7CEFFFC0A070482C1A8FC8A472C96C3A9FD0A8744AAD5AAFD8AC76CB
      ED7ABFE0B0784C2E9BCFE8B402C06EBBDFF0B87C4EAFDBEFF8BC7ECFEFFBFF80
      8182838485868788898A8B8C8D8E8F9091929394956F0198999A9B9C9D9E9FA0
      A1A2A3A4A5A6A7A8A9AAABACADAEAFB0B1B2B3B4B5B6B7B8B9BABBBCBDBEBFC0
      C19B02C4C5C6C7C8C9CACBCCCDCECFD0D1D2D3D4D5D6D7D8D9DADBDCDDDEDFE0
      E1E2E3E4E5E6E7E8E9EAEBECEDC703F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF00
      030A1C48B0A0C18308132A5CC8B0A1C38710234A9C48B1A2C58B1833CE4B0000
      3B}
  end
  inherited Image4: TImage
    Width = 234
  end
  object PDatosAlarma: TPanel [4]
    Left = 0
    Top = 65
    Width = 618
    Height = 232
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object GBDatosAlarma: TGroupBox
      Left = 0
      Top = 0
      Width = 618
      Height = 232
      Align = alClient
      Caption = ' Datos de la alarma  '
      TabOrder = 0
      object LFechaRegistracion: TLabel
        Left = 322
        Top = 56
        Width = 111
        Height = 14
        Caption = 'Fecha de registraci'#243'n: '
      end
      object LFechaAviso: TLabel
        Left = 353
        Top = 83
        Width = 80
        Height = 14
        Caption = 'Fecha de aviso: '
      end
      object LDisparador: TLabel
        Left = 339
        Top = 110
        Width = 99
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Evento disparador: '
      end
      object LRegistDatos: TLabel
        Left = 443
        Top = 56
        Width = 77
        Height = 13
        Caption = 'LRegistDatos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LAvisoDatos: TLabel
        Left = 443
        Top = 83
        Width = 39
        Height = 13
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LDisparadorValue: TLabel
        Left = 443
        Top = 110
        Width = 39
        Height = 13
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LEstado: TLabel
        Left = 38
        Top = 55
        Width = 39
        Height = 14
        Caption = 'Estado: '
      end
      object LNivelCritico: TLabel
        Left = 12
        Top = 83
        Width = 61
        Height = 14
        Caption = 'Nivel cr'#237'tico: '
      end
      object Label5: TLabel
        Left = 23
        Top = 110
        Width = 52
        Height = 14
        Caption = 'Categor'#237'a: '
      end
      object Label6: TLabel
        Left = 51
        Top = 138
        Width = 26
        Height = 14
        Caption = 'Tipo: '
      end
      object LNivelCriticoValue: TLabel
        Left = 89
        Top = 83
        Width = 105
        Height = 13
        Caption = 'LNivelCriticoValue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LCategoriaValue: TLabel
        Left = 89
        Top = 110
        Width = 205
        Height = 14
        AutoSize = False
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTipoValue: TLabel
        Left = 89
        Top = 138
        Width = 205
        Height = 14
        AutoSize = False
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LDescripcion: TLabel
        Left = 73
        Top = 19
        Width = 183
        Height = 16
        Caption = 'Descripci'#243'n de la alarma: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LDescripDatos: TLabel
        Left = 280
        Top = 19
        Width = 48
        Height = 16
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LEstadoValue: TLabel
        Left = 89
        Top = 57
        Width = 105
        Height = 13
        Caption = 'LNivelCriticoValue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBModificarAlarma: TGroupBox
        Left = 2
        Top = 165
        Width = 614
        Height = 65
        Align = alBottom
        Caption = ' Modificar alarma '
        TabOrder = 0
        object LNuevoAviso: TLabel
          Left = 432
          Top = 14
          Width = 109
          Height = 14
          Caption = 'Definir fecha de aviso '
          Visible = False
        end
        object BBAtender: TBitBtn
          Left = 57
          Top = 27
          Width = 131
          Height = 27
          Action = AAtenderAlarma
          Caption = 'Detener'
          TabOrder = 0
        end
        object BBDiferir: TBitBtn
          Left = 236
          Top = 27
          Width = 131
          Height = 27
          Action = ADiferirAlarma
          Caption = 'Diferir'
          TabOrder = 1
        end
        object DTPNuevaFecha: TDateTimePicker
          Left = 431
          Top = 31
          Width = 131
          Height = 21
          Date = 38722.396689270840000000
          Time = 38722.396689270840000000
          TabOrder = 2
          Visible = False
        end
      end
    end
  end
  object PEventosAlarma: TPanel [5]
    Left = 0
    Top = 297
    Width = 618
    Height = 130
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 0
      Top = 30
      Width = 618
      Height = 100
      Align = alClient
      DataSource = DSEventos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDblClick = AVerFichaEventoExecute
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'RP_ANIMAL'
          Title.Caption = 'RP animal'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INFOEVENTO'
          Title.Caption = 'Informaci'#243'n del evento'
          Width = 475
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 618
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LEventoDisparador: TLabel
        Left = 111
        Top = 8
        Width = 129
        Height = 14
        Caption = 'Tipo de evento disparador:'
      end
      object LEventoDisparadorValue: TLabel
        Left = 253
        Top = 8
        Width = 205
        Height = 14
        AutoSize = False
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object PBotones: TPanel [6]
    Left = 0
    Top = 427
    Width = 618
    Height = 37
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      618
      37)
    object BBSalir: TBitBtn
      Left = 474
      Top = 5
      Width = 131
      Height = 27
      Action = ASalir
      Anchors = [akTop, akRight]
      Caption = 'Terminar'
      TabOrder = 0
    end
    object BBAplicarCambios: TBitBtn
      Left = 172
      Top = 5
      Width = 132
      Height = 27
      Action = AAplicar
      Anchors = [akTop, akRight]
      Caption = 'Aplicar'
      TabOrder = 1
    end
    object BBCancelarCambios: TBitBtn
      Left = 323
      Top = 5
      Width = 131
      Height = 27
      Action = ACancelar
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 9
      Top = 5
      Width = 131
      Height = 27
      Action = AVerFichaEvento
      Anchors = [akTop, akRight]
      Caption = 'Ver ficha del evento'
      TabOrder = 3
    end
  end
  inherited PTitulo: TPanel
    Width = 618
    Caption = 'Vista y modificaciones de alarma'
    inherited LTitulo: TLabel
      Width = 214
    end
    inherited PILeft: TPanel
      Left = 410
    end
  end
  inherited Psocalo: TPanel
    Top = 483
    Width = 618
    inherited JvSocalo: TJvImage
      Width = 618
    end
  end
  inherited ALUniversal: TActionList
    Left = 531
    Top = 6
    object ASalir: TAction
      Caption = 'Terminar'
      ShortCut = 27
      OnExecute = ASalirExecute
    end
    object AAplicar: TAction
      Category = 'BotonesModificacion'
      Caption = 'Aplicar'
      OnExecute = AAplicarExecute
    end
    object ACancelar: TAction
      Category = 'BotonesModificacion'
      Caption = 'Cancelar'
      OnExecute = ACancelarExecute
    end
    object AAtenderAlarma: TAction
      Category = 'MoidificarEstado'
      Caption = 'Detener'
      OnExecute = AAtenderAlarmaExecute
    end
    object ADiferirAlarma: TAction
      Category = 'MoidificarEstado'
      Caption = 'Diferir'
      OnExecute = ADiferirAlarmaExecute
    end
    object AVerFichaEvento: TAction
      Category = 'BotonesModificacion'
      Caption = 'Ver ficha del evento'
      OnExecute = AVerFichaEventoExecute
    end
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPGeneradores: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  object IBQConsulta: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select sag.fecha_registracion, sag.fecha_aviso, sag.evento_Dispa' +
        'rador, sag.grupo,'
      
        '       sag.estado, sav.descripcion, sav.nivel_criticidad, sta.no' +
        'mbre as tipo, sca.nombre as categoria'
      
        ' from sys_agenda sag, sys_avisos sav, SYS_TIPOS_AVISO sta, SYS_C' +
        'ATEGORIAS_AVISO sca'
      
        'where (sag.id_agenda = :id) and (sag.aviso = sav.id_aviso) and (' +
        'sav.tipo = sta.id_tipo_aviso) and (sav.categoria = sca.id_catego' +
        'ria_aviso)')
    Left = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = '1'
      end>
  end
  object DSConsulta: TDataSource
    DataSet = IBQConsulta
    Left = 408
  end
  object IBUSQLConsulta: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from sys_agenda '
      'where'
      '  ID_AGENDA = :ID_AGENDA')
    ModifySQL.Strings = (
      'update sys_agenda'
      'set'
      '  ID_AGENDA = :ID_AGENDA,'
      '  AVISO = :AVISO,'
      '  ID_AGENDA_DIFERIDO = :ID_AGENDA_DIFERIDO,'
      '  FECHA_REGISTRACION = :FECHA_REGISTRACION,'
      '  FECHA_AVISO = :FECHA_AVISO,'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO,'
      '  EVENTO_DISPARADOR = :EVENTO_DISPARADOR,'
      '  GRUPO = :GRUPO,'
      '  ESTADO = :ESTADO'
      'where'
      '  ID_AGENDA = :OLD_ID_AGENDA')
    InsertSQL.Strings = (
      'insert into sys_agenda'
      '  (ID_AGENDA, AVISO, ID_AGENDA_DIFERIDO, FECHA_REGISTRACION, '
      'FECHA_AVISO, '
      '   ESTABLECIMIENTO, EVENTO_DISPARADOR, GRUPO, ESTADO)'
      'values'
      
        '  (:ID_AGENDA, :AVISO, :ID_AGENDA_DIFERIDO, :FECHA_REGISTRACION,' +
        ' '
      ':FECHA_AVISO, '
      '   :ESTABLECIMIENTO, :EVENTO_DISPARADOR, :GRUPO, :ESTADO)')
    DeleteSQL.Strings = (
      'delete from sys_agenda'
      'where'
      '  ID_AGENDA = :OLD_ID_AGENDA')
    Left = 456
    Top = 39
  end
  object IBQEventos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from GET_DATOS_EVENTOS_GRUPAL (:eve, :grupo, :esta)')
    Left = 64
    Top = 315
    ParamData = <
      item
        DataType = ftInteger
        Name = 'eve'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'grupo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
      end>
  end
  object DSEventos: TDataSource
    DataSet = IBQEventos
    Left = 32
    Top = 318
  end
  object IBQConsultaParaGuardar: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select * from sys_agenda where (id_agenda = :id)')
    UpdateObject = IBUSQLConsulta
    GeneratorField.Field = 'ID_AGENDA'
    GeneratorField.Generator = 'GEN_ID_SYSAGENDA'
    Left = 488
    Top = 38
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    object IBQConsultaParaGuardarID_AGENDA: TIntegerField
      FieldName = 'ID_AGENDA'
      Origin = 'SYS_AGENDA.ID_AGENDA'
      Required = True
    end
    object IBQConsultaParaGuardarAVISO: TIntegerField
      FieldName = 'AVISO'
      Origin = 'SYS_AGENDA.AVISO'
      Required = True
    end
    object IBQConsultaParaGuardarID_AGENDA_DIFERIDO: TIntegerField
      FieldName = 'ID_AGENDA_DIFERIDO'
      Origin = 'SYS_AGENDA.ID_AGENDA_DIFERIDO'
    end
    object IBQConsultaParaGuardarFECHA_REGISTRACION: TDateField
      FieldName = 'FECHA_REGISTRACION'
      Origin = 'SYS_AGENDA.FECHA_REGISTRACION'
      Required = True
    end
    object IBQConsultaParaGuardarFECHA_AVISO: TDateField
      FieldName = 'FECHA_AVISO'
      Origin = 'SYS_AGENDA.FECHA_AVISO'
      Required = True
    end
    object IBQConsultaParaGuardarESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'SYS_AGENDA.ESTABLECIMIENTO'
    end
    object IBQConsultaParaGuardarEVENTO_DISPARADOR: TIntegerField
      FieldName = 'EVENTO_DISPARADOR'
      Origin = 'SYS_AGENDA.EVENTO_DISPARADOR'
    end
    object IBQConsultaParaGuardarGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'SYS_AGENDA.GRUPO'
    end
    object IBQConsultaParaGuardarESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'SYS_AGENDA.ESTADO'
      FixedChar = True
      Size = 1
    end
  end
  object DSConsultaParaGuardar: TDataSource
    DataSet = IBQConsultaParaGuardar
    Left = 520
    Top = 40
  end
  object IBQGenericos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from cod_genericos where (tipo = :tipo) and (id_codigo ' +
        '= :codigo)')
    Left = 520
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'tipo'
        ParamType = ptInput
        Value = 'AC'
      end
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end>
    object IBQGenericosID_CODIGO: TIBStringField
      FieldName = 'ID_CODIGO'
      Origin = 'COD_GENERICOS.ID_CODIGO'
      Required = True
      Size = 1
    end
    object IBQGenericosTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'COD_GENERICOS.TIPO'
      Required = True
      Size = 2
    end
    object IBQGenericosVALOR: TIBStringField
      FieldName = 'VALOR'
      Origin = 'COD_GENERICOS.VALOR'
      Required = True
      Size = 50
    end
  end
end
