inherited FABMDescDestEmbrion: TFABMDescDestEmbrion
  Left = 250
  Top = 144
  Caption = 'FABMDescDestEmbrion'
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
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
  inherited PBotones: TPanel
    Top = 346
  end
  inherited PEditar: TPanel
    Top = 246
    object Label1: TLabel
      Left = 34
      Top = 20
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label2: TLabel
      Left = 39
      Top = 57
      Width = 36
      Height = 14
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel
      Left = 30
      Top = 93
      Width = 46
      Height = 14
      Caption = 'Sin'#243'nimo:'
    end
    object Label4: TLabel
      Left = 47
      Top = 127
      Width = 28
      Height = 14
      Caption = 'Valor:'
    end
    object DBEANombre: TDBEditAuto
      Left = 95
      Top = 17
      Width = 371
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 0
      EsClave = True
      EsRequerido = True
      ISParam = False
    end
    object DBEditAuto1: TDBEditAuto
      Left = 95
      Top = 54
      Width = 70
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'CODIGO'
      DataSource = DSAbmSimple
      TabOrder = 1
      EsClave = True
      EsRequerido = True
      ISParam = False
    end
    object DBEditAuto2: TDBEditAuto
      Left = 95
      Top = 89
      Width = 371
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'SINONIMO'
      DataSource = DSAbmSimple
      TabOrder = 2
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBLCBADestino: TDBLookupComboBoxAuto
      Left = 95
      Top = 122
      Width = 156
      Height = 22
      Color = clMoneyGreen
      DataField = 'DESTINO'
      DataSource = DSAbmSimple
      KeyField = 'ID_DESTINO_EMBRION'
      ListField = 'NOMBRE'
      ListSource = DSDestinos
      TabOrder = 3
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
  end
  inherited PNavegar: TPanel
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        ParentFont = False
        TitleFont.Height = -13
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 265
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAL_DESTINO'
            Title.Caption = 'Destino'
            Width = 221
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Descripci'#243'n de Destino de Embri'#243'n'
    inherited LTitulo: TLabel
      Caption = 'Descripci'#243'n de Detino de Embri'#243'n'
    end
  end
  inherited Psocalo: TPanel
    Top = 423
  end
  inherited DTXLS: TDataToXLS
    Top = 129
  end
  inherited IlAbmSimple: TImageList
    Left = 144
    Top = 56
  end
  inherited IBQAbmSimple: TIBQuery
    BeforePost = IBQAbmSimpleBeforePost
    SQL.Strings = (
      'select * from cod_dest_desc_embrion')
    GeneratorField.Field = 'ID_DESCRIPCION'
    GeneratorField.Generator = 'GEN_ID_DESC_DEST_EMBRION'
    Left = 80
    Top = 48
    object IBQAbmSimpleVAL_DESTINO: TStringField
      FieldKind = fkLookup
      FieldName = 'VAL_DESTINO'
      LookupDataSet = IBQDestinos
      LookupKeyFields = 'ID_DESTINO_EMBRION'
      LookupResultField = 'NOMBRE'
      KeyFields = 'DESTINO'
      Lookup = True
    end
    object IBQAbmSimpleID_DESCRIPCION: TIntegerField
      FieldName = 'ID_DESCRIPCION'
      Origin = 'COD_DEST_DESC_EMBRION.ID_DESCRIPCION'
      Required = True
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_DEST_DESC_EMBRION.NOMBRE'
      Size = 50
    end
    object IBQAbmSimpleCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_DEST_DESC_EMBRION.CODIGO'
      Size = 2
    end
    object IBQAbmSimpleSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_DEST_DESC_EMBRION.SINONIMO'
      Size = 50
    end
    object IBQAbmSimpleDESTINO: TIntegerField
      FieldName = 'DESTINO'
      Origin = 'COD_DEST_DESC_EMBRION.DESTINO'
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from cod_dest_desc_embrion '
      'where'
      '  ID_DESCRIPCION = :ID_DESCRIPCION')
    ModifySQL.Strings = (
      'update cod_dest_desc_embrion'
      'set'
      '  ID_DESCRIPCION = :ID_DESCRIPCION,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO,'
      '  DESTINO = :DESTINO'
      'where'
      '  ID_DESCRIPCION = :OLD_ID_DESCRIPCION')
    InsertSQL.Strings = (
      'insert into cod_dest_desc_embrion'
      '  (ID_DESCRIPCION, NOMBRE, CODIGO, SINONIMO, DESTINO)'
      'values'
      '  (:ID_DESCRIPCION, :NOMBRE, :CODIGO, :SINONIMO, :DESTINO)')
    DeleteSQL.Strings = (
      'delete from cod_dest_desc_embrion'
      'where'
      '  ID_DESCRIPCION = :OLD_ID_DESCRIPCION')
    Top = 56
  end
  object IBQDestinos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_destino_embrion')
    Left = 304
    Top = 104
  end
  object DSDestinos: TDataSource
    DataSet = IBQDestinos
    Left = 338
    Top = 107
  end
end
