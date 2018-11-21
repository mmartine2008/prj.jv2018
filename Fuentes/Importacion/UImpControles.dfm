inherited FImpControles: TFImpControles
  Left = 342
  Top = 103
  Caption = 'FImpControles'
  ClientHeight = 586
  ClientWidth = 855
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 855
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
    Width = 471
  end
  object Ptop: TPanel [4]
    Left = 0
    Top = 65
    Width = 855
    Height = 72
    Align = alTop
    TabOrder = 2
  end
  object PBottom: TPanel [5]
    Left = 0
    Top = 466
    Width = 855
    Height = 79
    Align = alBottom
    TabOrder = 3
  end
  object PCli: TPanel [6]
    Left = 0
    Top = 137
    Width = 855
    Height = 329
    Align = alClient
    TabOrder = 4
    object SLVControles: TShellListView
      Left = 265
      Top = 1
      Width = 589
      Height = 327
      ObjectTypes = [otFolders, otNonFolders]
      Root = 'rfDesktop'
      ShellTreeView = STVControles
      Sorted = True
      Align = alClient
      ReadOnly = False
      HideSelection = False
      TabOrder = 0
    end
    object STVControles: TShellTreeView
      Left = 1
      Top = 1
      Width = 264
      Height = 327
      ObjectTypes = [otFolders]
      Root = 'rfDesktop'
      ShellListView = SLVControles
      UseShellImages = True
      Align = alLeft
      AutoRefresh = False
      Indent = 19
      ParentColor = False
      RightClickSelect = True
      ShowRoot = False
      TabOrder = 1
    end
  end
  inherited PTitulo: TPanel
    Width = 855
    inherited LTitulo: TLabel
      Width = 471
    end
    inherited PILeft: TPanel
      Left = 667
    end
  end
  inherited Psocalo: TPanel
    Top = 545
    Width = 855
  end
  inherited ALUniversal: TActionList
    Left = 627
    Top = 22
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 28
    Top = 23
  end
  inherited SDXLS: TSaveDialog
    Left = 486
    Top = 21
  end
  inherited DTXLS: TDataToXLS
    Left = 104
    Top = 25
  end
  inherited WinXP1: TWinXP
    Left = 592
    Top = 24
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 140
    Top = 23
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 708
    Top = 15
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 676
    Top = 15
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 204
    Top = 15
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 524
    Top = 23
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 556
    Top = 23
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 64
    Top = 24
  end
end
