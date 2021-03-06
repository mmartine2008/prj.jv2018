inherited FABMValoresCapacidad: TFABMValoresCapacidad
  Left = 268
  Top = 186
  Caption = 'Valores de Capacidad de Servicio'
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
  inherited PNavegar: TPanel
    TabOrder = 1
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SINONIMO'
            Title.Caption = 'Sinonimo'
            Width = 270
            Visible = True
          end>
      end
    end
  end
  inherited PEditar: TPanel
    object LCodigo: TLabel
      Left = 17
      Top = 17
      Width = 56
      Height = 23
      AutoSize = False
      Caption = 'C'#243'digo:'
      Layout = tlCenter
    end
    object LNombre: TLabel
      Left = 17
      Top = 52
      Width = 56
      Height = 22
      AutoSize = False
      Caption = 'Nombre:'
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
    object DBECodigo: TDBEditAuto
      Left = 86
      Top = 17
      Width = 79
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'CODIGO'
      DataSource = DSAbmSimple
      TabOrder = 0
      EsClave = True
      EsRequerido = True
      ISParam = False
    end
    object DBENombre: TDBEditAuto
      Left = 86
      Top = 52
      Width = 263
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 1
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
      Color = 14679807
      DataField = 'SINONIMO'
      DataSource = DSAbmSimple
      TabOrder = 2
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Valores de Capacidad de Servicio'
  end
  inherited ALUniversal: TActionList
    Top = 56
  end
  inherited IlAbmSimple: TImageList
    Top = 54
  end
  inherited DSAbmSimple: TDataSource
    Top = 54
  end
  inherited PMGrilla: TPopupMenu
    Top = 54
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select id_valor_capacidad, codigo, nombre, sinonimo '
      'from cod_valores_capacidad tp')
    GeneratorField.Field = 'ID_VALOR_CAPACIDAD'
    GeneratorField.Generator = 'GEN_ID_CODVALORESCAPACIDAD'
    Top = 56
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from cod_valores_capacidad '
      'where'
      '  ID_VALOR_CAPACIDAD = :ID_VALOR_CAPACIDAD')
    ModifySQL.Strings = (
      'update cod_valores_capacidad'
      'set'
      '  ID_VALOR_CAPACIDAD = :ID_VALOR_CAPACIDAD,'
      '  CODIGO = :CODIGO,'
      '  NOMBRE = :NOMBRE,'
      '  SINONIMO = :SINONIMO'
      'where'
      '  ID_VALOR_CAPACIDAD = :OLD_ID_VALOR_CAPACIDAD')
    InsertSQL.Strings = (
      'insert into cod_valores_capacidad'
      '  (ID_VALOR_CAPACIDAD, CODIGO, NOMBRE, SINONIMO)'
      'values'
      '  (:ID_VALOR_CAPACIDAD, :CODIGO, :NOMBRE, :SINONIMO)')
    DeleteSQL.Strings = (
      'delete from cod_valores_capacidad'
      'where'
      '  ID_VALOR_CAPACIDAD = :OLD_ID_VALOR_CAPACIDAD')
    Top = 56
  end
end
