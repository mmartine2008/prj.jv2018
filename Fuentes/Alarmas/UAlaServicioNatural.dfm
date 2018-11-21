inherited FALAServicioNatural: TFALAServicioNatural
  Left = 386
  Top = 184
  Caption = 'Alarma de Servicio'
  ClientHeight = 342
  ClientWidth = 526
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 9
    Top = 50
    Width = 483
    Height = 14
    Caption = 
      'Los siguientes servicios se encuentran cerca o se han pasado de ' +
      'la fecha estimada de finalizaci'#243'n '
  end
  inherited ITope: TImage
    Width = 526
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
    Width = 141
  end
  object CBCerrar: TCheckBox [5]
    Left = 32
    Top = 78
    Width = 105
    Height = 18
    Caption = 'Cerrar Servicios '
    TabOrder = 4
    OnClick = CBCerrarClick
  end
  object GBCerrarServicio: TGroupBox [6]
    Left = 0
    Top = 93
    Width = 526
    Height = 76
    Align = alBottom
    Caption = ' Cerrar Servicio '
    Enabled = False
    TabOrder = 3
    object BBEgresoHembra: TBitBtn
      Left = 95
      Top = 26
      Width = 121
      Height = 27
      Caption = 'Egreso de Hembras...'
      Enabled = False
      TabOrder = 0
      OnClick = BBEgresoHembraClick
    end
    object BBEgresoToro: TBitBtn
      Left = 302
      Top = 26
      Width = 121
      Height = 27
      Caption = 'Egreso de Toros...'
      Enabled = False
      TabOrder = 1
      OnClick = BBEgresoToroClick
    end
  end
  object PAnimales: TPanel [7]
    Left = 0
    Top = 169
    Width = 526
    Height = 151
    Align = alBottom
    Caption = 'PAnimales'
    TabOrder = 2
    object DBGAnimales: TDBGrid
      Left = 1
      Top = 1
      Width = 524
      Height = 149
      Align = alClient
      DataSource = DSAnimales
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnCellClick = DBGAnimalesCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Caption = 'Servicio'
          Width = 158
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_INICIO'
          Title.Caption = 'Fecha de Inicio '
          Width = 146
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_FIN_ESTIMADA'
          Title.Caption = 'Fecha de Fin Estimada'
          Width = 164
          Visible = True
        end>
    end
  end
  inherited PTitulo: TPanel
    Width = 526
    Caption = 'Alarma de Servicio'
    Font.Color = clRed
    inherited LTitulo: TLabel
      Width = 122
      Caption = 'Alarma de Servicio'
      Font.Color = clRed
    end
    inherited PILeft: TPanel
      Left = 318
    end
  end
  inherited Psocalo: TPanel
    Top = 320
    Width = 526
    inherited JvSocalo: TJvImage
      Width = 526
    end
    inherited LDerechos: TLabel
      Left = 48
    end
  end
  inherited ALUniversal: TActionList
    Left = 115
    Top = 65533
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 4
    Top = 65533
  end
  inherited SDXLS: TSaveDialog
    Left = 59
    Top = 65533
  end
  inherited DTXLS: TDataToXLS
    Left = 32
    Top = 65533
  end
  inherited WinXP1: TWinXP
    Left = 143
    Top = 65533
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 87
    Top = 65533
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPGeneradores: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  object IBQAnimales: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQAnimalesAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from tab_servicios where (establecimiento=:esta) and ((' +
        'fecha_fin_estimada-cast('#39'Today'#39' as Date))<=2) and (Activo='#39'S'#39')')
    Left = 88
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTA'
        ParamType = ptUnknown
      end>
  end
  object DSAnimales: TDataSource
    DataSet = IBQAnimales
    Left = 56
    Top = 263
  end
  object IBSPCerrarServicio: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'SP_CERRAR_SERVICIO'
    Left = 24
    Top = 264
  end
end
