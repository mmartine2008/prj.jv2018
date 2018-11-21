inherited FABMCodigosManejo: TFABMCodigosManejo
  Left = 215
  Top = 121
  Caption = 'FABMCodigosManejo'
  ClientHeight = 568
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
    Top = 450
  end
  inherited PEditar: TPanel
    Top = 265
    Height = 185
    object Label1: TLabel
      Left = 29
      Top = 22
      Width = 88
      Height = 14
      Caption = 'C'#243'digo de Manejo:'
    end
    object Label2: TLabel
      Left = 86
      Top = 56
      Width = 36
      Height = 14
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel
      Left = 76
      Top = 90
      Width = 46
      Height = 14
      Caption = 'Sinonimo:'
    end
    object Label4: TLabel
      Left = 51
      Top = 125
      Width = 71
      Height = 14
      Caption = 'Nro de C'#243'digo:'
    end
    object DBEANombre: TDBEditAuto
      Left = 146
      Top = 17
      Width = 191
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 0
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEACodigo: TDBEditAuto
      Left = 146
      Top = 52
      Width = 27
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
    object DBEASinonimo: TDBEditAuto
      Left = 146
      Top = 86
      Width = 191
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
    object DBEANroCodigo: TDBEditAuto
      Left = 146
      Top = 121
      Width = 191
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NRO_CODIGO'
      DataSource = DSAbmSimple
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
            Title.Caption = 'C'#243'digo de Manejo'
            Width = 166
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
            Width = 178
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRO_CODIGO'
            Title.Caption = 'Nro de C'#243'digo'
            Width = 103
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'C'#243'digos de Manejo'
    inherited LTitulo: TLabel
      Caption = 'C'#243'digos de Manejo'
    end
  end
  inherited Psocalo: TPanel
    Top = 527
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select * from cod_codigos_manejo')
    GeneratorField.Field = 'ID_CODIGO_MANEJO'
    GeneratorField.Generator = 'GEN_ID_CODIGO_MANEJO'
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from cod_codigos_manejo '
      'where'
      '  ID_CODIGO_MANEJO = :ID_CODIGO_MANEJO')
    ModifySQL.Strings = (
      'update cod_codigos_manejo'
      'set'
      '  ID_CODIGO_MANEJO = :ID_CODIGO_MANEJO,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO,'
      '  NRO_CODIGO = :NRO_CODIGO'
      'where'
      '  ID_CODIGO_MANEJO = :OLD_ID_CODIGO_MANEJO')
    InsertSQL.Strings = (
      'insert into cod_codigos_manejo'
      '  (ID_CODIGO_MANEJO, NOMBRE, CODIGO, SINONIMO, NRO_CODIGO)'
      'values'
      '  (:ID_CODIGO_MANEJO, :NOMBRE, :CODIGO, :SINONIMO, :NRO_CODIGO)')
    DeleteSQL.Strings = (
      'delete from cod_codigos_manejo'
      'where'
      '  ID_CODIGO_MANEJO = :OLD_ID_CODIGO_MANEJO')
  end
end
