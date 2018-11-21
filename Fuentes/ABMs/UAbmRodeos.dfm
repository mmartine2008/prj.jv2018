inherited FABMRodeos: TFABMRodeos
  Left = 296
  Top = 126
  Caption = 'Huella - Rodeos'
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
  inherited PEditar: TPanel
    object Label5: TLabel
      Left = 26
      Top = 43
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label7: TLabel
      Left = 25
      Top = 69
      Width = 60
      Height = 14
      Caption = 'Descripci'#243'n:'
    end
    object DBENombre: TDBEditAuto
      Left = 116
      Top = 37
      Width = 131
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
    object DBEDescripcion: TDBEditAuto
      Left = 115
      Top = 62
      Width = 423
      Height = 22
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'DESCRIPCION'
      DataSource = DSAbmSimple
      TabOrder = 1
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object CBVisible: TCheckBox
      Left = 115
      Top = 95
      Width = 105
      Height = 18
      Caption = 'Visible'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  inherited PNavegar: TPanel
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_RODEO'
            Visible = False
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Rodeos'
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      
        'select tp.ID_RODEO, tp.ESTABLECIMIENTO, tp.DESCRIPCION, tp.NOMBR' +
        'E, tp.visible from TAB_RODEOS tp where (tp.ESTABLECIMIENTO = :ES' +
        'TABLECIMIENTO) and (tp.id_rodeo <> 0)')
    GeneratorField.Field = 'ID_RODEO'
    GeneratorField.Generator = 'GEN_ID_TABRODEO'
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
    object IBQAbmSimpleID_RODEO: TIntegerField
      FieldName = 'ID_RODEO'
      Origin = 'TAB_RODEOS.ID_RODEO'
      Required = True
    end
    object IBQAbmSimpleESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_RODEOS.ESTABLECIMIENTO'
      Required = True
    end
    object IBQAbmSimpleDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TAB_RODEOS.DESCRIPCION'
      Size = 255
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'TAB_RODEOS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBQAbmSimpleVISIBLE: TIntegerField
      FieldName = 'VISIBLE'
      Origin = 'TAB_RODEOS.VISIBLE'
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ESTABLECIMIENTO,'
      '  ID_RODEO,'
      '  NOMBRE,'
      '  DESCRIPCION,'
      '  VISIBLE'
      'from TAB_RODEOS '
      'where'
      '  ID_RODEO = :ID_RODEO and'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO')
    ModifySQL.Strings = (
      'update TAB_RODEOS'
      'set'
      '  ID_RODEO = :ID_RODEO,'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  NOMBRE = :NOMBRE,'
      '  VISIBLE = :VISIBLE'
      'where'
      '  ID_RODEO = :OLD_ID_RODEO and'
      '  ESTABLECIMIENTO = :OLD_ESTABLECIMIENTO')
    InsertSQL.Strings = (
      'insert into TAB_RODEOS'
      '  (ID_RODEO, ESTABLECIMIENTO, DESCRIPCION, NOMBRE, VISIBLE)'
      'values'
      '  (:ID_RODEO, :ESTABLECIMIENTO, :DESCRIPCION, :NOMBRE, :VISIBLE)')
    DeleteSQL.Strings = (
      'delete from TAB_RODEOS'
      'where'
      '  ID_RODEO = :OLD_ID_RODEO and'
      '  ESTABLECIMIENTO = :OLD_ESTABLECIMIENTO')
  end
  object IBQUltimo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(id_rodeo)  as ultimo from TAB_RODEOS')
    Left = 608
    Top = 297
  end
end
