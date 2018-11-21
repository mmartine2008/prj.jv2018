inherited FABMInspeccion: TFABMInspeccion
  Left = 185
  Top = 144
  Caption = 'FABMInspeccion'
  ClientWidth = 705
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 705
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
    Width = 311
  end
  inherited PBotones: TPanel
    Top = 346
    Width = 705
    inherited IFondo: TImage
      Width = 705
    end
    inherited BBGuardar: TBitBtn
      Left = 533
    end
    inherited BBCancelar: TBitBtn
      Left = 619
    end
    inherited BBSalir: TBitBtn
      Left = 619
    end
    inherited BBElegir: TBitBtn
      Left = 447
    end
  end
  inherited PEditar: TPanel
    Top = 246
    Width = 705
    object LNombre: TLabel
      Left = 26
      Top = 24
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label1: TLabel
      Left = 26
      Top = 55
      Width = 36
      Height = 14
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 26
      Top = 84
      Width = 46
      Height = 14
      Caption = 'Sinonimo:'
    end
    object DBEANombre: TDBEditAuto
      Left = 86
      Top = 20
      Width = 242
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
      Left = 86
      Top = 52
      Width = 36
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
      Left = 86
      Top = 82
      Width = 242
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
            Width = 131
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
            Width = 165
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 705
    Caption = 'Inspecci'#243'n'
    inherited LTitulo: TLabel
      Width = 321
      Caption = 'Inspecci'#243'n'
    end
    inherited PILeft: TPanel
      Left = 517
    end
  end
  inherited Psocalo: TPanel
    Top = 423
    Width = 705
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select * from cod_inspeccion')
    GeneratorField.Field = 'ID_INSPECCION'
    GeneratorField.Generator = 'GEN_ID_INSPECCION'
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from cod_inspeccion '
      'where'
      '  ID_INSPECCION = :ID_INSPECCION')
    ModifySQL.Strings = (
      'update cod_inspeccion'
      'set'
      '  ID_INSPECCION = :ID_INSPECCION,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO'
      'where'
      '  ID_INSPECCION = :OLD_ID_INSPECCION')
    InsertSQL.Strings = (
      'insert into cod_inspeccion'
      '  (ID_INSPECCION, NOMBRE, CODIGO, SINONIMO)'
      'values'
      '  (:ID_INSPECCION, :NOMBRE, :CODIGO, :SINONIMO)')
    DeleteSQL.Strings = (
      'delete from cod_inspeccion'
      'where'
      '  ID_INSPECCION = :OLD_ID_INSPECCION')
  end
end
