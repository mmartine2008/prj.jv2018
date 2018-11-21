inherited FABMEstablecimientos: TFABMEstablecimientos
  Left = 162
  Top = 92
  Caption = 'Huella - Establecimientos'
  ClientHeight = 543
  ClientWidth = 769
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 769
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
    Width = 382
  end
  inherited PEditar: TPanel [4]
    Left = -64
    Top = 124
    Width = 921
    Height = 325
    Align = alNone
    object Label5: TLabel
      Left = 43
      Top = 32
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label6: TLabel
      Left = 35
      Top = 67
      Width = 54
      Height = 14
      Caption = 'Propietario:'
    end
    object Label7: TLabel
      Left = 36
      Top = 101
      Width = 48
      Height = 14
      Caption = 'Direcci'#243'n:'
    end
    object Label8: TLabel
      Left = 353
      Top = 32
      Width = 45
      Height = 14
      Caption = 'Tel'#233'fono:'
    end
    object Label9: TLabel
      Left = 353
      Top = 67
      Width = 31
      Height = 14
      Caption = 'e-Mail:'
    end
    object Label10: TLabel
      Left = 353
      Top = 101
      Width = 60
      Height = 14
      Caption = 'P'#225'gina Web:'
    end
    object Label1: TLabel
      Left = 43
      Top = 132
      Width = 40
      Height = 14
      Caption = 'Renspa:'
    end
    object LPais: TLabel
      Left = 353
      Top = 127
      Width = 56
      Height = 23
      AutoSize = False
      Caption = 'Pa'#237's:'
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 702
      Top = 30
      Width = 126
      Height = 16
      Caption = 'Raza Predominante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object LActividad: TLabel
      Left = 36
      Top = 162
      Width = 53
      Height = 17
      AutoSize = False
      Caption = 'Actividad:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 52
      Top = 194
      Width = 53
      Height = 17
      AutoSize = False
      Caption = 'Prefijo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object DBEditAuto1: TDBEditAuto
      Left = 103
      Top = 26
      Width = 225
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 0
      EsClave = False
      EsRequerido = True
      ISParam = True
    end
    object DBEditAuto2: TDBEditAuto
      Left = 103
      Top = 60
      Width = 225
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'PROPIETARIO'
      DataSource = DSAbmSimple
      TabOrder = 1
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEditAuto3: TDBEditAuto
      Left = 103
      Top = 95
      Width = 225
      Height = 22
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'DIRECCION'
      DataSource = DSAbmSimple
      TabOrder = 2
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBEditAuto4: TDBEditAuto
      Left = 425
      Top = 26
      Width = 131
      Height = 22
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'TELEFONO'
      DataSource = DSAbmSimple
      TabOrder = 3
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBEditAuto5: TDBEditAuto
      Left = 425
      Top = 60
      Width = 257
      Height = 22
      CharCase = ecLowerCase
      Color = clWhite
      DataField = 'EMAIL'
      DataSource = DSAbmSimple
      TabOrder = 4
      OnExit = DBEditAuto5Exit
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBEditAuto6: TDBEditAuto
      Left = 425
      Top = 95
      Width = 257
      Height = 22
      CharCase = ecLowerCase
      Color = clWhite
      DataField = 'URL'
      DataSource = DSAbmSimple
      TabOrder = 5
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBEditAuto7: TDBEditAuto
      Left = 103
      Top = 126
      Width = 225
      Height = 22
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'RENSPA'
      DataSource = DSAbmSimple
      TabOrder = 6
      OnChange = DBEditAuto7Change
      OnExit = DBEditAuto7Exit
      OnKeyPress = DBEditAuto7KeyPress
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAPais: TDBLookupComboBoxAuto
      Left = 425
      Top = 127
      Width = 157
      Height = 22
      Color = 14679807
      DataField = 'PAIS'
      DataSource = DSAbmSimple
      KeyField = 'ID_PAIS'
      ListField = 'NOMBRE'
      ListSource = DSPais
      TabOrder = 7
      OnCloseUp = DBLCBAPaisCloseUp
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object CBxRazaPredom: TComboBox
      Left = 702
      Top = 60
      Width = 210
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 8
      Visible = False
    end
    object DBLCBAActividad: TDBLookupComboBoxAuto
      Left = 104
      Top = 158
      Width = 224
      Height = 22
      Color = 14679807
      DataField = 'ACTIVIDAD'
      DataSource = DSAbmSimple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      KeyField = 'ID_ACTIVIDAD_ESTABLECIMIENTO'
      ListField = 'NOMBRE'
      ListSource = DSActividades
      ParentFont = False
      TabOrder = 9
      OnCloseUp = DBLCBAPaisCloseUp
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEPrefijo: TDBEdit
      Left = 104
      Top = 192
      Width = 225
      Height = 22
      DataField = 'PREFIJO'
      DataSource = DSPrefijo
      TabOrder = 10
    end
  end
  inherited PBotones: TPanel [5]
    Top = 444
    Width = 769
    inherited IFondo: TImage
      Width = 769
    end
    inherited BBGuardar: TBitBtn
      Left = 596
    end
    inherited BBCancelar: TBitBtn
      Left = 635
    end
    inherited BBSalir: TBitBtn
      Left = 683
    end
    inherited BBElegir: TBitBtn
      Left = 518
    end
  end
  inherited PNavegar: TPanel
    Left = 64
    Top = 164
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        OnKeyPress = nil
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROPIETARIO'
            Title.Caption = 'Propietario'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIRECCION'
            Title.Caption = 'Direcci'#243'n'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONO'
            Title.Caption = 'Tel'#233'fono'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RENSPA'
            Title.Caption = 'Renspa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBREPAIS'
            Title.Caption = 'Pa'#237's '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_ESTABLECIMIENTO'
            Visible = False
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 769
    Caption = 'Establecimientos'
    inherited LTitulo: TLabel
      Width = 365
    end
    inherited PILeft: TPanel
      Left = 561
    end
  end
  inherited Psocalo: TPanel
    Top = 521
    Width = 769
    inherited JvSocalo: TJvImage
      Width = 769
    end
  end
  inherited ALUniversal: TActionList
    Left = 136
    Top = 16
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 44
    Top = 47
  end
  inherited SDXLS: TSaveDialog
    Left = 110
    Top = 53
  end
  inherited DTXLS: TDataToXLS
    Left = 168
    Top = 17
  end
  inherited WinXP1: TWinXP
    Left = 456
    Top = 16
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 588
    Top = 15
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 556
    Top = 15
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 524
    Top = 15
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 620
    Top = 15
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 140
    Top = 47
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 492
    Top = 15
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 80
    Top = 48
  end
  inherited IlAbmSimple: TImageList
    Left = 72
    Top = 16
  end
  inherited DSAbmSimple: TDataSource
    Left = 8
    Top = 48
  end
  inherited PMGrilla: TPopupMenu
    Left = 104
    Top = 16
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      
        'select tp.ID_ESTABLECIMIENTO, tp.DIRECCION, tp.EMAIL, tp.NOMBRE,' +
        ' tp.PROPIETARIO, tp.TELEFONO, tp.URL, tp.RENSPA,tp.PAIS, tpa.NOM' +
        'BRE as NOMBREPAIS, tp.actividad, cae.NOMBRE'
      
        'from TAB_ESTABLECIMIENTOS tp join TAB_PAIS tpa on tp.pais = tpa.' +
        'id_pais left join COD_ACTIVIDAD_ESTABLECIMIENTO CAE on (tp.activ' +
        'idad = cae.id_actividad_establecimiento)')
    GeneratorField.Field = 'ID_ESTABLECIMIENTO'
    GeneratorField.Generator = 'GEN_ID_ESTABLECIMIENTO'
    Left = 8
    Top = 16
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NOMBRE,'
      '  ID_ESTABLECIMIENTO,'
      '  DIRECCION,'
      '  TELEFONO,'
      '  EMAIL,'
      '  URL,'
      '  PROPIETARIO,'
      '  RENSPA,'
      '  PAIS,'
      '  ACTIVIDAD'
      'from TAB_ESTABLECIMIENTOS '
      'where'
      '  ID_ESTABLECIMIENTO = :ID_ESTABLECIMIENTO')
    ModifySQL.Strings = (
      'update TAB_ESTABLECIMIENTOS'
      'set'
      '  ID_ESTABLECIMIENTO = :ID_ESTABLECIMIENTO,'
      '  DIRECCION = :DIRECCION,'
      '  EMAIL = :EMAIL,'
      '  NOMBRE = :NOMBRE,'
      '  PROPIETARIO = :PROPIETARIO,'
      '  TELEFONO = :TELEFONO,'
      '  URL = :URL,'
      '  RENSPA = :RENSPA,'
      '  PAIS = :PAIS,'
      '  ACTIVIDAD = :ACTIVIDAD'
      'where'
      '  ID_ESTABLECIMIENTO = :OLD_ID_ESTABLECIMIENTO')
    InsertSQL.Strings = (
      'insert into TAB_ESTABLECIMIENTOS'
      '  (ID_ESTABLECIMIENTO, DIRECCION, EMAIL, NOMBRE, PROPIETARIO, '
      'TELEFONO, '
      '   URL, RENSPA, PAIS, ACTIVIDAD)'
      'values'
      
        '  (:ID_ESTABLECIMIENTO, :DIRECCION, :EMAIL, :NOMBRE, :PROPIETARI' +
        'O, '
      ':TELEFONO, '
      '   :URL, :RENSPA, :PAIS, :ACTIVIDAD)')
    DeleteSQL.Strings = (
      'delete from TAB_ESTABLECIMIENTOS'
      'where'
      '  ID_ESTABLECIMIENTO = :OLD_ID_ESTABLECIMIENTO')
    Left = 40
    Top = 16
  end
  object IBSPEliminarEstablecimiento: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'GEN_ELIMINAR_ESTABLECIMIENTO2'
    Left = 520
    Top = 48
  end
  object IBQPais: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQPaisAfterOpen
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_pais, nombre'
      'from  tab_pais'
      '')
    Left = 457
    Top = 46
  end
  object DSPais: TDataSource
    DataSet = IBQPais
    Left = 489
    Top = 46
  end
  object IBQActDesactTriggerEve_Evento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQPaisAfterOpen
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'ALTER TRIGGER set_datos_eve INACTIVE')
    Left = 177
    Top = 46
  end
  object IBQRazaPredom: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_razas_predom')
    Left = 592
    Top = 188
  end
  object DSRazaPredom: TDataSource
    DataSet = IBQRazaPredom
    Left = 552
    Top = 188
  end
  object IBQActualizarVisibilidad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update cod_razas set visible = 1 where id_raza = :raza')
    Left = 592
    Top = 228
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'raza'
        ParamType = ptUnknown
      end>
  end
  object IBQInsertRazaByEstable: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into rel_establecimiento_razapred values(:establecimiento' +
        ',:razapredom,:razaelegida)')
    Left = 555
    Top = 227
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'razapredom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'razaelegida'
        ParamType = ptUnknown
      end>
  end
  object IBQExisteRazaEst: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from rel_establecimiento_razapred where establecimiento' +
        ' = :esta')
    Left = 592
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object DSActividades: TDataSource
    DataSet = IBQActividades
    Left = 88
    Top = 292
  end
  object IBQActividades: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_actividad_establecimiento')
    Left = 128
    Top = 292
  end
  object DSPrefijo: TDataSource
    DataSet = IBQueryPrefijo
    Left = 280
    Top = 316
  end
  object IBQueryPrefijo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from cod_criador where establecimiento = :establecimien' +
        'to')
    UpdateObject = IBUpdatePrefijo
    GeneratorField.Field = 'ID_CRIADOR'
    GeneratorField.Generator = 'GEN_ID_CRIADOR'
    Left = 320
    Top = 316
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
    object IBQueryPrefijoID_CRIADOR: TIntegerField
      FieldName = 'ID_CRIADOR'
      Origin = 'COD_CRIADOR.ID_CRIADOR'
      Required = True
    end
    object IBQueryPrefijoNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_CRIADOR.NOMBRE'
      Size = 100
    end
    object IBQueryPrefijoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_CRIADOR.CODIGO'
      Size = 2
    end
    object IBQueryPrefijoSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_CRIADOR.SINONIMO'
      Size = 100
    end
    object IBQueryPrefijoNUMEROCRIADOR: TIntegerField
      FieldName = 'NUMEROCRIADOR'
      Origin = 'COD_CRIADOR.NUMEROCRIADOR'
    end
    object IBQueryPrefijoRAZON_SOCIAL: TIBStringField
      FieldName = 'RAZON_SOCIAL'
      Origin = 'COD_CRIADOR.RAZON_SOCIAL'
      Size = 50
    end
    object IBQueryPrefijoPREFIJO: TIBStringField
      FieldName = 'PREFIJO'
      Origin = 'COD_CRIADOR.PREFIJO'
      Size = 100
    end
    object IBQueryPrefijoESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'COD_CRIADOR.ESTABLECIMIENTO'
    end
  end
  object IBUpdatePrefijo: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from cod_criador '
      'where'
      '  ID_CRIADOR = :ID_CRIADOR')
    ModifySQL.Strings = (
      'update cod_criador'
      'set'
      '  ID_CRIADOR = :ID_CRIADOR,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO,'
      '  NUMEROCRIADOR = :NUMEROCRIADOR,'
      '  RAZON_SOCIAL = :RAZON_SOCIAL,'
      '  PREFIJO = :PREFIJO,'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO'
      'where'
      '  ID_CRIADOR = :OLD_ID_CRIADOR')
    InsertSQL.Strings = (
      'insert into cod_criador'
      '  (ID_CRIADOR, NOMBRE, CODIGO, SINONIMO, NUMEROCRIADOR, '
      'RAZON_SOCIAL, PREFIJO, '
      '   ESTABLECIMIENTO)'
      'values'
      '  (:ID_CRIADOR, :NOMBRE, :CODIGO, :SINONIMO, :NUMEROCRIADOR, '
      ':RAZON_SOCIAL, '
      '   :PREFIJO, :ESTABLECIMIENTO)')
    DeleteSQL.Strings = (
      'delete from cod_criador'
      'where'
      '  ID_CRIADOR = :OLD_ID_CRIADOR')
    Left = 360
    Top = 316
  end
end
