inherited FABMDescMetodoSinc: TFABMDescMetodoSinc
  Left = 196
  Top = 180
  Caption = 'FABMDescMetodoSinc'
  ClientHeight = 420
  ClientWidth = 775
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 775
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
    Width = 381
  end
  inherited PBotones: TPanel
    Top = 302
    Width = 775
    inherited IFondo: TImage
      Width = 775
    end
    inherited BBEliminar: TBitBtn
      Enabled = False
    end
    inherited BBEditar: TBitBtn
      Enabled = False
    end
    inherited BBGuardar: TBitBtn
      Left = 603
    end
    inherited BBCancelar: TBitBtn
      Left = 689
    end
    inherited BBSalir: TBitBtn
      Left = 689
    end
    inherited BBElegir: TBitBtn
      Left = 517
    end
  end
  inherited PEditar: TPanel
    Top = 174
    Width = 775
    Height = 128
    object Label1: TLabel
      Left = 68
      Top = 25
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label2: TLabel
      Left = 72
      Top = 62
      Width = 36
      Height = 14
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel
      Left = 60
      Top = 100
      Width = 46
      Height = 14
      Caption = 'Sinonimo:'
    end
    object Label4: TLabel
      Left = 69
      Top = 135
      Width = 38
      Height = 14
      Caption = 'M'#233'todo:'
    end
    object DBENombre: TDBEditAuto
      Left = 129
      Top = 23
      Width = 225
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 0
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBECodigo: TDBEditAuto
      Left = 129
      Top = 58
      Width = 44
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'CODIGO'
      DataSource = DSAbmSimple
      TabOrder = 1
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBESinonimo: TDBEditAuto
      Left = 129
      Top = 95
      Width = 225
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
    object DBLCBAMetodosSinc: TDBLookupComboBoxAuto
      Left = 129
      Top = 129
      Width = 156
      Height = 22
      Color = clMoneyGreen
      DataField = 'METODO'
      DataSource = DSAbmSimple
      KeyField = 'ID_METODO'
      ListField = 'NOMBRE'
      ListSource = DSMetodosSinc
      TabOrder = 3
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
  end
  inherited PNavegar: TPanel
    Width = 775
    inherited GBBuscar: TGroupBox
      Width = 771
      inherited EValorBuscar: TEdit
        Width = 544
      end
    end
    inherited GBFiltrar: TGroupBox
      Width = 771
      inherited EValorFiltrar: TEdit
        Width = 538
      end
    end
    inherited GBCantidad: TGroupBox
      Width = 771
      inherited BDBGAbm: TBitDBGrid
        Width = 767
        ParentFont = False
        TitleFont.Height = -13
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 271
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SINONIMO'
            Title.Caption = 'Sinonimo'
            Width = 295
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 775
    Caption = 'Descripci'#243'n de M'#233'todos de Sincronizaci'#243'n'
    inherited LTitulo: TLabel
      Width = 391
      Caption = 'Descripci'#243'n de M'#233'todos de Sincronizaci'#243'n'
    end
    inherited PILeft: TPanel
      Left = 587
    end
  end
  inherited Psocalo: TPanel
    Top = 379
    Width = 775
  end
  inherited ALUniversal: TActionList
    Left = 224
    Top = 56
  end
  inherited IlAbmSimple: TImageList
    Top = 56
  end
  inherited DSAbmSimple: TDataSource
    Left = 264
    Top = 64
  end
  inherited PMGrilla: TPopupMenu
    Top = 56
  end
  inherited IBQAbmSimple: TIBQuery
    BeforePost = IBQAbmSimpleBeforePost
    SQL.Strings = (
      
        'select * from cod_desc_metodos_sinc where id_descripcion <> 0 an' +
        'd id_descripcion <> 1')
    GeneratorField.Field = 'ID_DESCRIPCION'
    GeneratorField.Generator = 'GEN_ID_DESC_METODO_SINC'
    Top = 56
    object IBQAbmSimpleID_DESCRIPCION: TIntegerField
      FieldName = 'ID_DESCRIPCION'
      Origin = 'COD_DESC_METODOS_SINC.ID_DESCRIPCION'
      Required = True
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_DESC_METODOS_SINC.NOMBRE'
      Size = 50
    end
    object IBQAbmSimpleCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_DESC_METODOS_SINC.CODIGO'
      Size = 2
    end
    object IBQAbmSimpleSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_DESC_METODOS_SINC.SINONIMO'
      Size = 50
    end
    object IBQAbmSimpleMETODO: TIntegerField
      FieldName = 'METODO'
      Origin = 'COD_DESC_METODOS_SINC.METODO'
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from cod_desc_metodos_sinc '
      'where'
      '  ID_DESCRIPCION = :ID_DESCRIPCION')
    ModifySQL.Strings = (
      'update cod_desc_metodos_sinc'
      'set'
      '  ID_DESCRIPCION = :ID_DESCRIPCION,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO,'
      '  METODO = :METODO'
      'where'
      '  ID_DESCRIPCION = :OLD_ID_DESCRIPCION')
    InsertSQL.Strings = (
      'insert into cod_desc_metodos_sinc'
      '  (ID_DESCRIPCION, NOMBRE, CODIGO, SINONIMO, METODO)'
      'values'
      '  (:ID_DESCRIPCION, :NOMBRE, :CODIGO, :SINONIMO, :METODO)')
    DeleteSQL.Strings = (
      'delete from cod_desc_metodos_sinc'
      'where'
      '  ID_DESCRIPCION = :OLD_ID_DESCRIPCION')
    Top = 56
  end
  object IBQMetodosSinc: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_metodos_sincronizacion where id_metodo > 0')
    Left = 440
    Top = 265
  end
  object DSMetodosSinc: TDataSource
    DataSet = IBQMetodosSinc
    Left = 480
    Top = 265
  end
end
