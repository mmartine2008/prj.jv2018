inherited FABMDatosSiembra: TFABMDatosSiembra
  Caption = 'FABMDatosSiembra'
  ClientHeight = 479
  ClientWidth = 653
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 653
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
    Width = 259
  end
  inherited PBotones: TPanel
    Top = 361
    Width = 653
    inherited IFondo: TImage
      Width = 653
    end
    inherited BBGuardar: TBitBtn
      Left = 480
    end
    inherited BBCancelar: TBitBtn
      Left = 519
    end
    inherited BBSalir: TBitBtn
      Left = 567
    end
    inherited BBElegir: TBitBtn
      Left = 402
    end
  end
  inherited PEditar: TPanel
    Top = 234
    Width = 653
    Height = 127
    TabOrder = 2
    object LSinonimo: TLabel
      Left = 17
      Top = 84
      Width = 56
      Height = 22
      AutoSize = False
      Caption = 'Sinonimo:'
      Layout = tlCenter
    end
    object LCodigo: TLabel
      Left = 17
      Top = 49
      Width = 56
      Height = 23
      AutoSize = False
      Caption = 'C'#243'digo:'
      Layout = tlCenter
    end
    object LNombre: TLabel
      Left = 17
      Top = 12
      Width = 56
      Height = 22
      AutoSize = False
      Caption = 'Nombre:'
      Layout = tlCenter
    end
    object DBESinonimo: TDBEditAuto
      Left = 86
      Top = 84
      Width = 263
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'SINONIMO'
      DataSource = DSAbmSimple
      TabOrder = 0
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBECodigo: TDBEditAuto
      Left = 86
      Top = 49
      Width = 79
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
    object DBENombre: TDBEditAuto
      Left = 86
      Top = 12
      Width = 263
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 2
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
  end
  inherited PNavegar: TPanel
    TabOrder = 3
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        ParentFont = False
        TitleFont.Height = -13
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 182
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SINONIMO'
            Title.Caption = 'Sinonimo'
            Width = 152
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 653
    inherited LTitulo: TLabel
      Width = 269
    end
    inherited PILeft: TPanel
      Left = 465
    end
  end
  inherited Psocalo: TPanel
    Top = 438
    Width = 653
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select * from cod_datos_siembra')
    GeneratorField.Field = 'ID_SIEMBRA'
    GeneratorField.Generator = 'GEN_ID_DATOS_SIEMBRA'
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from cod_datos_siembra '
      'where'
      '  ID_SIEMBRA = :ID_SIEMBRA')
    ModifySQL.Strings = (
      'update cod_datos_siembra'
      'set'
      '  ID_SIEMBRA = :ID_SIEMBRA,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO'
      'where'
      '  ID_SIEMBRA = :OLD_ID_SIEMBRA')
    InsertSQL.Strings = (
      'insert into cod_datos_siembra'
      '  (ID_SIEMBRA, NOMBRE, CODIGO, SINONIMO)'
      'values'
      '  (:ID_SIEMBRA, :NOMBRE, :CODIGO, :SINONIMO)')
    DeleteSQL.Strings = (
      'delete from cod_datos_siembra'
      'where'
      '  ID_SIEMBRA = :OLD_ID_SIEMBRA')
  end
end
