inherited FABMDestino: TFABMDestino
  Left = 280
  Top = 221
  Caption = 'FABMDestino'
  ClientWidth = 640
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 640
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
    Width = 246
  end
  inherited PBotones: TPanel
    Top = 346
    Width = 640
    inherited IFondo: TImage
      Width = 640
    end
    inherited IElegir: TImage
      Left = 432
    end
    inherited LElegir: TLabel
      Left = 435
    end
    inherited ITerminar: TImage
      Left = 512
    end
    inherited LTerminar: TLabel
      Left = 513
    end
    inherited ISalir: TImage
      Left = 584
    end
    inherited LSalir: TLabel
      Left = 596
    end
    inherited ICancelar: TImage
      Left = 584
    end
    inherited LCancelar: TLabel
      Left = 585
    end
    inherited IBuscar: TImage
      Left = 295
    end
    inherited LBuscar: TLabel
      Left = 294
    end
    inherited IFiltro: TImage
      Left = 335
    end
    inherited LFiltro: TLabel
      Left = 340
    end
    inherited BBGuardar: TBitBtn
      Left = 468
    end
    inherited BBCancelar: TBitBtn
      Left = 554
    end
    inherited BBSalir: TBitBtn
      Left = 554
    end
    inherited BBElegir: TBitBtn
      Left = 382
    end
  end
  inherited PEditar: TPanel
    Top = 246
    Width = 640
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
    object DBEditAuto1: TDBEditAuto
      Left = 100
      Top = 32
      Width = 254
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
    object DBEditAuto2: TDBEditAuto
      Left = 100
      Top = 66
      Width = 48
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
    object DBEditAuto3: TDBEditAuto
      Left = 100
      Top = 101
      Width = 254
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
    Width = 605
    inherited GBBuscar: TGroupBox
      Width = 601
      inherited EValorBuscar: TEdit
        Width = 374
      end
    end
    inherited GBFiltrar: TGroupBox
      Width = 601
      inherited EValorFiltrar: TEdit
        Width = 368
      end
    end
    inherited GBCantidad: TGroupBox
      Width = 601
      inherited BDBGAbm: TBitDBGrid
        Width = 597
        ParentFont = False
        TitleFont.Height = -13
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'Codigo'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SINONIMO'
            Title.Caption = 'Sinonimo'
            Width = 192
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 640
    Caption = 'Destino'
    inherited LTitulo: TLabel
      Width = 256
    end
    inherited PILeft: TPanel
      Left = 452
    end
  end
  inherited Psocalo: TPanel
    Top = 423
    Width = 640
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select * from cod_destino where id_destino <> 0')
    GeneratorField.Field = 'ID_DESTINO'
    GeneratorField.Generator = 'GEN_ID_DESTINO'
    object IBQAbmSimpleID_DESTINO: TIntegerField
      FieldName = 'ID_DESTINO'
      Origin = 'COD_DESTINO.ID_DESTINO'
      Required = True
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_DESTINO.NOMBRE'
      Size = 100
    end
    object IBQAbmSimpleCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_DESTINO.CODIGO'
      Size = 2
    end
    object IBQAbmSimpleSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_DESTINO.SINONIMO'
      Size = 100
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from cod_destino '
      'where'
      '  ID_DESTINO = :ID_DESTINO')
    ModifySQL.Strings = (
      'update cod_destino'
      'set'
      '  ID_DESTINO = :ID_DESTINO,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO'
      'where'
      '  ID_DESTINO = :OLD_ID_DESTINO')
    InsertSQL.Strings = (
      'insert into cod_destino'
      '  (ID_DESTINO, NOMBRE, CODIGO, SINONIMO)'
      'values'
      '  (:ID_DESTINO, :NOMBRE, :CODIGO, :SINONIMO)')
    DeleteSQL.Strings = (
      'delete from cod_destino'
      'where'
      '  ID_DESTINO = :OLD_ID_DESTINO')
  end
end
