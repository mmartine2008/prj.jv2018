inherited FTraduccion: TFTraduccion
  Left = 706
  Top = 271
  Caption = 'FTraduccion'
  OldCreateOrder = True
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
  inherited ALUniversal: TActionList
    Left = 587
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 44
    Top = 15
  end
  inherited SDXLS: TSaveDialog
    Left = 78
    Top = 13
  end
  inherited DTXLS: TDataToXLS
    Left = 624
    Top = 41
  end
  inherited WinXP1: TWinXP
    Left = 616
    Top = 104
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 596
    Top = 39
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 628
    Top = 167
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 628
    Top = 135
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 580
    Top = 111
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 628
    Top = 199
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 620
    Top = 71
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 16
    Top = 16
  end
  object IBQTraduccion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 48
    Top = 144
  end
end
