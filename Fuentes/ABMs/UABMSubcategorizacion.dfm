inherited FABMSubcategorizacion: TFABMSubcategorizacion
  Caption = 'FABMSubcategorizacion'
  ClientHeight = 477
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
    Top = 359
  end
  inherited PEditar: TPanel
    Top = 202
    Height = 157
    object Label1: TLabel
      Left = 82
      Top = 22
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label2: TLabel
      Left = 86
      Top = 56
      Width = 36
      Height = 14
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel
      Left = 77
      Top = 90
      Width = 46
      Height = 14
      Caption = 'Sinonimo:'
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
    object DBEANombre: TDBEditAuto
      Left = 146
      Top = 17
      Width = 191
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
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
            Width = 204
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
            Width = 248
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Subcategorizaciones'
    inherited LTitulo: TLabel
      Caption = 'Subcategorizaciones'
    end
  end
  inherited Psocalo: TPanel
    Top = 436
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      
        'select * from cod_subcategorizacion where id_subcategorizacion >' +
        ' 1')
    GeneratorField.Field = 'ID_SUBCATEGORIZACION'
    GeneratorField.Generator = 'GEN_ID_SUBCATEGORIZACION'
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from cod_subcategorizacion '
      'where'
      '  ID_SUBCATEGORIZACION = :ID_SUBCATEGORIZACION')
    ModifySQL.Strings = (
      'update cod_subcategorizacion'
      'set'
      '  ID_SUBCATEGORIZACION = :ID_SUBCATEGORIZACION,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO'
      'where'
      '  ID_SUBCATEGORIZACION = :OLD_ID_SUBCATEGORIZACION')
    InsertSQL.Strings = (
      'insert into cod_subcategorizacion'
      '  (ID_SUBCATEGORIZACION, NOMBRE, CODIGO, SINONIMO)'
      'values'
      '  (:ID_SUBCATEGORIZACION, :NOMBRE, :CODIGO, :SINONIMO)')
    DeleteSQL.Strings = (
      'delete from cod_subcategorizacion'
      'where'
      '  ID_SUBCATEGORIZACION = :OLD_ID_SUBCATEGORIZACION')
  end
end
