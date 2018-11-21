inherited FABMLaboratorios: TFABMLaboratorios
  Left = 281
  Top = 167
  Caption = 'FABMLaboratorios'
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
      Left = 26
      Top = 34
      Width = 43
      Height = 14
      Caption = 'Nombre: '
    end
    object DBEANombre: TDBEditAuto
      Left = 78
      Top = 30
      Width = 268
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
  end
  inherited PNavegar: TPanel
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Laboratorio'
            Width = 247
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Laboratorios'
    inherited LTitulo: TLabel
      Caption = 'Laboratorios'
    end
  end
  inherited Psocalo: TPanel
    Top = 423
  end
  inherited SDXLS: TSaveDialog
    Left = 350
    Top = 45
  end
  inherited DTXLS: TDataToXLS
    Left = 320
    Top = 41
  end
  inherited WinXP1: TWinXP
    Left = 456
    Top = 32
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 524
    Top = 31
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 596
    Top = 39
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 564
    Top = 39
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 388
    Top = 39
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 420
    Top = 31
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 492
    Top = 31
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select * from tab_laboratorios where id_laboratorio <> 0')
    GeneratorField.Field = 'ID_LABORATORIO'
    GeneratorField.Generator = 'GEN_ID_LABORATORIO'
    object IBQAbmSimpleID_LABORATORIO: TIntegerField
      FieldName = 'ID_LABORATORIO'
      Origin = 'TAB_LABORATORIOS.ID_LABORATORIO'
      Required = True
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'TAB_LABORATORIOS.NOMBRE'
      Size = 50
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from tab_laboratorios'
      'where'
      '  ID_LABORATORIO = :ID_LABORATORIO')
    ModifySQL.Strings = (
      'update tab_laboratorios'
      'set'
      '  ID_LABORATORIO = :ID_LABORATORIO,'
      '  NOMBRE = :NOMBRE'
      'where'
      '  ID_LABORATORIO = :OLD_ID_LABORATORIO')
    InsertSQL.Strings = (
      'insert into tab_laboratorios'
      '  (ID_LABORATORIO, NOMBRE)'
      'values'
      '  (:ID_LABORATORIO, :NOMBRE)')
    DeleteSQL.Strings = (
      'delete from tab_laboratorios'
      'where'
      '  ID_LABORATORIO = :OLD_ID_LABORATORIO')
  end
end
