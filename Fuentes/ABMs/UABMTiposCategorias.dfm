inherited FABMTiposCategorias: TFABMTiposCategorias
  Caption = 'FABMTiposCategorias'
  ClientHeight = 504
  ClientWidth = 709
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 709
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
    Width = 325
  end
  inherited PBotones: TPanel
    Top = 386
    Width = 709
    inherited IFondo: TImage
      Width = 709
    end
    inherited BBGuardar: TBitBtn
      Left = 536
    end
    inherited BBCancelar: TBitBtn
      Left = 575
    end
    inherited BBSalir: TBitBtn
      Left = 623
    end
    inherited BBElegir: TBitBtn
      Left = 458
    end
  end
  inherited PEditar: TPanel
    Top = 218
    Width = 709
    Height = 168
    TabOrder = 2
    object LTipo: TLabel
      Left = 17
      Top = 118
      Width = 56
      Height = 22
      AutoSize = False
      Caption = 'Categor'#237'a:'
      Layout = tlCenter
    end
    object LSinonimo: TLabel
      Left = 17
      Top = 86
      Width = 56
      Height = 23
      AutoSize = False
      Caption = 'Sin'#243'nimo:'
      Layout = tlCenter
    end
    object LNombre: TLabel
      Left = 17
      Top = 20
      Width = 56
      Height = 22
      AutoSize = False
      Caption = 'Nombre:'
      Layout = tlCenter
    end
    object LCodigo: TLabel
      Left = 17
      Top = 54
      Width = 56
      Height = 23
      AutoSize = False
      Caption = 'C'#243'digo:'
      Layout = tlCenter
    end
    object DBLCBATipo: TDBLookupComboBoxAuto
      Left = 86
      Top = 118
      Width = 156
      Height = 22
      Color = clMoneyGreen
      DataField = 'CATEGORIA'
      DataSource = DSAbmSimple
      DropDownRows = 20
      KeyField = 'ID_CATEGORIA'
      ListField = 'SINONIMO'
      ListSource = DSCategorias
      TabOrder = 0
      OnCloseUp = DBLCBATipoCloseUp
      EsClave = True
      EsRequerido = True
      ISParam = False
    end
    object DBESinonimo: TDBEditAuto
      Left = 86
      Top = 86
      Width = 263
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'SINONIMO'
      DataSource = DSAbmSimple
      TabOrder = 1
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBENombre: TDBEditAuto
      Left = 86
      Top = 20
      Width = 263
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 2
      EsClave = True
      EsRequerido = True
      ISParam = False
    end
    object DBECodigo: TDBEditAuto
      Left = 86
      Top = 54
      Width = 79
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'CODIGO'
      DataSource = DSAbmSimple
      TabOrder = 3
      EsClave = True
      EsRequerido = True
      ISParam = False
    end
  end
  inherited PNavegar: TPanel
    TabOrder = 3
    inherited GBBuscar: TGroupBox
      Top = 94
    end
    inherited GBFiltrar: TGroupBox
      Top = 145
      Height = 53
    end
    inherited GBCantidad: TGroupBox
      Height = 92
      inherited BDBGAbm: TBitDBGrid
        Height = 74
        ParentFont = False
        TitleFont.Height = -13
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Subcategor'#237'a'
            Width = 171
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CATEG'
            Title.Caption = 'Categor'#237'a'
            Width = 166
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 709
    inherited LTitulo: TLabel
      Width = 325
    end
    inherited PILeft: TPanel
      Left = 521
    end
  end
  inherited Psocalo: TPanel
    Top = 463
    Width = 709
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 12
    Top = 15
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select * from cod_tipos_categorias')
    GeneratorField.Field = 'ID_TIPOS_CATEGORIAS'
    GeneratorField.Generator = 'GEN_ID_TIPO_CATEGORIA'
    object IBQAbmSimpleID_TIPOS_CATEGORIAS: TIntegerField
      FieldName = 'ID_TIPOS_CATEGORIAS'
      Origin = 'COD_TIPOS_CATEGORIAS.ID_TIPOS_CATEGORIAS'
      Required = True
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_TIPOS_CATEGORIAS.NOMBRE'
      Size = 50
    end
    object IBQAbmSimpleCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Origin = 'COD_TIPOS_CATEGORIAS.CATEGORIA'
    end
    object IBQAbmSimpleCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_TIPOS_CATEGORIAS.CODIGO'
      Size = 2
    end
    object IBQAbmSimpleSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_TIPOS_CATEGORIAS.SINONIMO'
      Size = 50
    end
    object IBQAbmSimpleCATEG: TStringField
      FieldKind = fkLookup
      FieldName = 'CATEG'
      LookupDataSet = IBQCategorias
      LookupKeyFields = 'ID_CATEGORIA'
      LookupResultField = 'NOMBRE'
      KeyFields = 'CATEGORIA'
      Lookup = True
    end
    object IBQAbmSimpleESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'COD_TIPOS_CATEGORIAS.ESTABLECIMIENTO'
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from cod_tipos_categorias '
      'where'
      '  ID_TIPOS_CATEGORIAS = :ID_TIPOS_CATEGORIAS')
    ModifySQL.Strings = (
      'update cod_tipos_categorias'
      'set'
      '  ID_TIPOS_CATEGORIAS = :ID_TIPOS_CATEGORIAS,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO,'
      '  CATEGORIA = :CATEGORIA,'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO'
      'where'
      '  ID_TIPOS_CATEGORIAS = :OLD_ID_TIPOS_CATEGORIAS')
    InsertSQL.Strings = (
      'insert into cod_tipos_categorias'
      
        '  (ID_TIPOS_CATEGORIAS, NOMBRE, CODIGO, SINONIMO, CATEGORIA, EST' +
        'ABLECIMIENTO)'
      'values'
      
        '  (:ID_TIPOS_CATEGORIAS, :NOMBRE, :CODIGO, :SINONIMO, :CATEGORIA' +
        ', :ESTABLECIMIENTO)')
    DeleteSQL.Strings = (
      'delete from cod_tipos_categorias'
      'where'
      '  ID_TIPOS_CATEGORIAS = :OLD_ID_TIPOS_CATEGORIAS')
  end
  object IBQCategorias: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQCategoriasAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_categorias')
    Left = 248
    Top = 352
  end
  object DSCategorias: TDataSource
    DataSet = IBQCategorias
    Left = 288
    Top = 352
  end
end
