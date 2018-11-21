inherited FABMCriador: TFABMCriador
  Left = 509
  Top = 190
  Caption = 'FABMCriador'
  ClientHeight = 479
  ClientWidth = 701
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 701
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
    Top = 361
    Width = 701
    inherited IFondo: TImage
      Width = 701
    end
    inherited BBGuardar: TBitBtn
      Left = 528
    end
    inherited BBCancelar: TBitBtn
      Left = 567
    end
    inherited BBSalir: TBitBtn
      Left = 615
    end
    inherited BBElegir: TBitBtn
      Left = 450
    end
  end
  inherited PEditar: TPanel
    Top = 200
    Width = 701
    Height = 161
    object Label1: TLabel
      Left = 43
      Top = 34
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label2: TLabel
      Left = 43
      Top = 68
      Width = 36
      Height = 14
      Caption = 'Codigo:'
    end
    object Label3: TLabel
      Left = 43
      Top = 103
      Width = 46
      Height = 14
      Caption = 'Sinonimo:'
    end
    object Label4: TLabel
      Left = 11
      Top = 138
      Width = 78
      Height = 14
      Caption = 'N'#250'mero Criador:'
    end
    object DBEditAuto1: TDBEditAuto
      Left = 100
      Top = 32
      Width = 246
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
    object DBEditAuto2: TDBEditAuto
      Left = 100
      Top = 66
      Width = 48
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
    object DBEditAuto3: TDBEditAuto
      Left = 100
      Top = 101
      Width = 246
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
    object DBEditAuto4: TDBEditAuto
      Left = 100
      Top = 136
      Width = 246
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NUMEROCRIADOR'
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
            Title.Caption = 'Nombre'
            Width = 263
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'Codigo'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SINONIMO'
            Title.Caption = 'Sinonimo'
            Width = 293
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMEROCRIADOR'
            Title.Caption = 'N'#250'mero Criador'
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 701
    Caption = 'Criador'
    inherited LTitulo: TLabel
      Width = 297
    end
    inherited PILeft: TPanel
      Left = 493
    end
  end
  inherited Psocalo: TPanel
    Top = 438
    Width = 701
    inherited JvSocalo: TJvImage
      Width = 701
    end
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 340
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select * from cod_criador where id_criador <> 0')
    GeneratorField.Field = 'ID_CRIADOR'
    GeneratorField.Generator = 'GEN_ID_CRIADOR'
    object IBQAbmSimpleID_CRIADOR: TIntegerField
      FieldName = 'ID_CRIADOR'
      Origin = 'COD_CRIADOR.ID_CRIADOR'
      Required = True
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_CRIADOR.NOMBRE'
      Size = 100
    end
    object IBQAbmSimpleCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_CRIADOR.CODIGO'
      Size = 2
    end
    object IBQAbmSimpleSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_CRIADOR.SINONIMO'
      Size = 100
    end
    object IBQAbmSimpleNUMEROCRIADOR: TIntegerField
      FieldName = 'NUMEROCRIADOR'
      Origin = 'COD_CRIADOR.NUMEROCRIADOR'
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from cod_criador '
      'where'
      '  ID_CRIADOR = :ID_CRIADOR')
    ModifySQL.Strings = (
      'update cod_criador'
      'set'
      '  ID_CRIADOR = :ID_CRIADOR,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO,'
      '  NUMEROCRIADOR = :NUMEROCRIADOR'
      'where'
      '  ID_CRIADOR = :OLD_ID_CRIADOR')
    InsertSQL.Strings = (
      'insert into cod_criador'
      '  (ID_CRIADOR, NOMBRE, CODIGO, SINONIMO,NUMEROCRIADOR)'
      'values'
      '  (:ID_CRIADOR, :NOMBRE, :CODIGO, :SINONIMO,:NUMEROCRIADOR)')
    DeleteSQL.Strings = (
      'delete from cod_criador'
      'where'
      '  ID_CRIADOR = :OLD_ID_CRIADOR')
  end
end
