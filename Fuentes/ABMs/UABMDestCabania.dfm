inherited FABMDestCabania: TFABMDestCabania
  Left = 228
  Top = 204
  Caption = 'FABMDestCabania'
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
      Top = 26
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label2: TLabel
      Left = 34
      Top = 56
      Width = 36
      Height = 14
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel
      Left = 34
      Top = 86
      Width = 46
      Height = 14
      Caption = 'Sinonimo:'
    end
    object DBEANombre: TDBEditAuto
      Left = 97
      Top = 22
      Width = 318
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
    object DBEACodigo: TDBEditAuto
      Left = 97
      Top = 52
      Width = 33
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
    object DBEASinonimo: TDBEditAuto
      Left = 97
      Top = 82
      Width = 318
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
            Width = 140
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
            Width = 170
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Destino de Caba'#241'a'
    inherited LTitulo: TLabel
      Caption = 'Destino de Caba'#241'a'
    end
  end
  inherited Psocalo: TPanel
    Top = 423
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select * from cod_dest_cabania')
    GeneratorField.Field = 'ID_DEST_CABANIA'
    GeneratorField.Generator = 'GEN_ID_DEST_CABANIA'
    Top = 24
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from cod_dest_cabania '
      'where'
      '  ID_DEST_CABANIA = :ID_DEST_CABANIA')
    ModifySQL.Strings = (
      'update cod_dest_cabania'
      'set'
      '  ID_DEST_CABANIA = :ID_DEST_CABANIA,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO'
      'where'
      '  ID_DEST_CABANIA = :OLD_ID_DEST_CABANIA')
    InsertSQL.Strings = (
      'insert into cod_dest_cabania'
      '  (ID_DEST_CABANIA, NOMBRE, CODIGO, SINONIMO)'
      'values'
      '  (:ID_DEST_CABANIA, :NOMBRE, :CODIGO, :SINONIMO)')
    DeleteSQL.Strings = (
      'delete from cod_dest_cabania'
      'where'
      '  ID_DEST_CABANIA = :OLD_ID_DEST_CABANIA')
    Top = 24
  end
end
