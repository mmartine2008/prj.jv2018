inherited FConfigIdioma: TFConfigIdioma
  Left = 424
  Top = 201
  Caption = 'FConfigIdioma'
  ClientHeight = 394
  ClientWidth = 479
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 479
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
    Width = 95
  end
  object Panel3: TPanel [4]
    Left = 0
    Top = 127
    Width = 479
    Height = 171
    Align = alClient
    TabOrder = 4
    object DBGIdiomas: TDBGrid
      Left = 9
      Top = 17
      Width = 449
      Height = 182
      DataSource = DSIdiomas
      Options = [dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnCellClick = DBGIdiomasCellClick
      OnDrawColumnCell = DBGIdiomasDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'NOM'
          Title.Caption = 'Idioma'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACTIVO'
          Visible = True
        end>
    end
  end
  object Panel2: TPanel [5]
    Left = 0
    Top = 298
    Width = 479
    Height = 55
    Align = alBottom
    TabOrder = 3
    object BBAceptar: TBitBtn
      Left = 69
      Top = 9
      Width = 87
      Height = 35
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = BBAceptarClick
    end
    object BBCancelar: TBitBtn
      Left = 310
      Top = 9
      Width = 87
      Height = 35
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BBCancelarClick
    end
  end
  object Panel1: TPanel [6]
    Left = 0
    Top = 65
    Width = 479
    Height = 62
    Align = alTop
    Caption = 'Seleccione el idioma que desea utilizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  inherited PTitulo: TPanel
    Width = 479
    inherited LTitulo: TLabel
      Width = 95
    end
    inherited PILeft: TPanel
      Left = 291
    end
  end
  inherited Psocalo: TPanel
    Top = 353
    Width = 479
    inherited JvSocalo: TJvImage
      Left = -15
    end
    inherited LDerechos: TLabel
      Left = 40
      Top = 11
    end
  end
  inherited ALUniversal: TActionList
    Left = 275
    Top = 334
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 60
    Top = 65535
  end
  inherited SDXLS: TSaveDialog
    Left = 14
    Top = 333
  end
  inherited DTXLS: TDataToXLS
    Left = 88
    Top = 1
  end
  inherited WinXP1: TWinXP
    Left = 240
    Top = 336
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 76
    Top = 335
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 108
    Top = 335
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 140
    Top = 335
  end
  inherited IBSPGeneradores: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 44
    Top = 335
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 204
    Top = 335
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 172
    Top = 335
  end
  inherited IBQGetCantAnimales: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 24
    Top = 0
  end
  object IBQIdiomas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_idioma, nombre||'#39' - '#39'||descripcion as nom, activo from' +
        ' sys_idioma')
    UpdateObject = IBUpdateIdioma
    Left = 24
    Top = 48
  end
  object DSIdiomas: TDataSource
    DataSet = IBQIdiomas
    Left = 56
    Top = 48
  end
  object IBUpdateIdioma: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from sys_idioma '
      'where'
      '  ID_IDIOMA = :ID_IDIOMA')
    ModifySQL.Strings = (
      'update sys_idioma'
      'set'
      '  ACTIVO = :ACTIVO'
      'where'
      '  ID_IDIOMA = :OLD_ID_IDIOMA')
    InsertSQL.Strings = (
      'insert into sys_idioma'
      '  (ACTIVO)'
      'values'
      '  (:ACTIVO)')
    DeleteSQL.Strings = (
      'delete from sys_idioma'
      'where'
      '  ID_IDIOMA = :OLD_ID_IDIOMA')
    Left = 368
    Top = 48
  end
end
