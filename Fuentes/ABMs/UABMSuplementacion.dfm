inherited FABMSuplementacion: TFABMSuplementacion
  Left = 314
  Top = -12
  Caption = 'FABMSuplementacion'
  ClientHeight = 598
  ClientWidth = 742
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 742
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
    Top = 499
    Width = 742
    DesignSize = (
      742
      77)
    inherited IFondo: TImage
      Width = 742
    end
    inherited BBGuardar: TBitBtn
      Left = 570
    end
    inherited BBCancelar: TBitBtn
      Left = 656
    end
    inherited BBSalir: TBitBtn
      Left = 656
    end
    inherited BBElegir: TBitBtn
      Left = 484
    end
  end
  inherited PEditar: TPanel
    Top = 306
    Width = 742
    Height = 193
    object Label1: TLabel
      Left = 43
      Top = 22
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label2: TLabel
      Left = 43
      Top = 56
      Width = 36
      Height = 14
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel
      Left = 43
      Top = 90
      Width = 46
      Height = 14
      Caption = 'Sinonimo:'
    end
    object Label4: TLabel
      Left = 55
      Top = 124
      Width = 31
      Height = 14
      Caption = '% MS:'
    end
    object Label5: TLabel
      Left = 43
      Top = 158
      Width = 45
      Height = 14
      Caption = 'Cantidad:'
      Visible = False
    end
    object DBENombre: TDBEditAuto
      Left = 103
      Top = 17
      Width = 208
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 0
      OnChange = DBENombreChange
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBECodigo: TDBEditAuto
      Left = 103
      Top = 52
      Width = 88
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'CODIGO'
      DataSource = DSAbmSimple
      TabOrder = 1
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBESinonimo: TDBEditAuto
      Left = 103
      Top = 86
      Width = 208
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'SINONIMO'
      DataSource = DSAbmSimple
      TabOrder = 2
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEAPorcMS: TDBEditAuto
      Left = 103
      Top = 120
      Width = 208
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'PORC_MS'
      DataSource = DSAbmSimple
      TabOrder = 3
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEACantidad: TDBEditAuto
      Left = 103
      Top = 154
      Width = 208
      Height = 22
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'CANTIDAD'
      DataSource = DSAbmSimple
      TabOrder = 4
      Visible = False
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
  end
  inherited PNavegar: TPanel
    Top = 107
    Width = 742
    inherited GBBuscar: TGroupBox
      Width = 738
      inherited EValorBuscar: TEdit
        Width = 510
      end
    end
    inherited GBFiltrar: TGroupBox
      Width = 738
      inherited EValorFiltrar: TEdit
        Width = 505
      end
    end
    inherited GBCantidad: TGroupBox
      Width = 738
      inherited BDBGAbm: TBitDBGrid
        Width = 734
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Alignment = taCenter
            Title.Caption = 'Alimento'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 63
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PORC_MS'
            Title.Alignment = taCenter
            Title.Caption = '% MS'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CANTIDAD'
            Title.Alignment = taCenter
            Title.Caption = 'Stock (Kgs)'
            Visible = False
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 742
    Caption = 'Alimentaci'#243'n'
    inherited LTitulo: TLabel
      Width = 338
    end
    inherited PILeft: TPanel
      Left = 534
    end
  end
  inherited Psocalo: TPanel
    Top = 576
    Width = 742
    inherited JvSocalo: TJvImage
      Width = 742
    end
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      
        'SELECT ID_TIPO_SUPLEMENTACION, NOMBRE, CODIGO, SINONIMO, PORC_MS' +
        ', CANTIDAD, PRECIO FROM COD_TIPOS_SUPLEMENTACIONES WHERE ID_TIPO' +
        '_SUPLEMENTACION <> 0')
    GeneratorField.Field = 'ID_TIPO_SUPLEMENTACION'
    GeneratorField.Generator = 'GEN_ID_TIPOSUPLEMENTACION'
    object IBQAbmSimpleID_TIPO_SUPLEMENTACION: TIntegerField
      FieldName = 'ID_TIPO_SUPLEMENTACION'
      Origin = 'COD_TIPOS_SUPLEMENTACIONES.ID_TIPO_SUPLEMENTACION'
      Required = True
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_TIPOS_SUPLEMENTACIONES.NOMBRE'
      Size = 50
    end
    object IBQAbmSimpleCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_TIPOS_SUPLEMENTACIONES.CODIGO'
      Size = 2
    end
    object IBQAbmSimpleSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_TIPOS_SUPLEMENTACIONES.SINONIMO'
      Size = 50
    end
    object IBQAbmSimplePORC_MS: TFloatField
      FieldName = 'PORC_MS'
      Origin = 'COD_TIPOS_SUPLEMENTACIONES.PORC_MS'
    end
    object IBQAbmSimpleCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'COD_TIPOS_SUPLEMENTACIONES.CANTIDAD'
      DisplayFormat = '#0.##'
    end
    object IBQAbmSimplePRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'COD_TIPOS_SUPLEMENTACIONES.PRECIO'
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_TIPO_SUPLEMENTACION,'
      '  NOMBRE,'
      '  CODIGO,'
      '  SINONIMO,'
      '  PORC_MS,'
      '  CANTIDAD,'
      '  PRECIO'
      'from COD_TIPOS_SUPLEMENTACIONES '
      'where'
      '  ID_TIPO_SUPLEMENTACION = :ID_TIPO_SUPLEMENTACION')
    ModifySQL.Strings = (
      'update COD_TIPOS_SUPLEMENTACIONES'
      'set'
      '  ID_TIPO_SUPLEMENTACION = :ID_TIPO_SUPLEMENTACION,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO,'
      '  PORC_MS = :PORC_MS,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO'
      'where'
      '  ID_TIPO_SUPLEMENTACION = :OLD_ID_TIPO_SUPLEMENTACION')
    InsertSQL.Strings = (
      'insert into COD_TIPOS_SUPLEMENTACIONES'
      '  (ID_TIPO_SUPLEMENTACION, NOMBRE, CODIGO, SINONIMO, PORC_MS, '
      'CANTIDAD, '
      '   PRECIO)'
      'values'
      
        '  (:ID_TIPO_SUPLEMENTACION, :NOMBRE, :CODIGO, :SINONIMO, :PORC_M' +
        'S, 0, '
      '   0)')
    DeleteSQL.Strings = (
      'delete from COD_TIPOS_SUPLEMENTACIONES'
      'where'
      '  ID_TIPO_SUPLEMENTACION = :OLD_ID_TIPO_SUPLEMENTACION')
  end
end
