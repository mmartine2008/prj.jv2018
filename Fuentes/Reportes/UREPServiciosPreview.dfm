inherited FREPServiciosPreview: TFREPServiciosPreview
  Left = 280
  Top = 24
  Caption = 'FREPServiciosPreview'
  ClientHeight = 680
  ClientWidth = 855
  OldCreateOrder = True
  Scaled = False
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
    Width = 498
  end
  object QRServicioEventosToros: TQuickRep [4]
    Left = 48
    Top = 496
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand2: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        103.187500000000000000
        1899.708333333333000000)
      BandType = rbColumnHeader
      object LabelFecha: TQRLabel
        Left = 32
        Top = 20
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          52.916666666666670000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelRP2: TQRLabel
        Left = 248
        Top = 20
        Width = 19
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          656.166666666666800000
          52.916666666666670000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelEventosVinculados: TQRLabel
        Left = 8
        Top = 1
        Width = 139
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          21.166666666666670000
          2.645833333333333000
          367.770833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Din'#225'mica de toros'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object LabelEvento: TQRLabel
        Left = 120
        Top = 20
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          52.916666666666670000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Evento'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 232
        Top = 40
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          613.833333333333400000
          105.833333333333300000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'QRDBText5'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelNombre2: TQRLabel
        Left = 352
        Top = 20
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          931.333333333333500000
          52.916666666666670000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 77
      Width = 718
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      BandType = rbDetail
      object QRDBText3: TQRDBText
        Left = 27
        Top = 2
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          71.437500000000000000
          5.291666666666667000
          119.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'FECHA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 239
        Top = 2
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          632.354166666666800000
          5.291666666666667000
          238.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'ID_RP'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 96
        Top = 1
        Width = 140
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          2.645833333333333000
          370.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'NOMBREEVENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 332
        Top = 1
        Width = 350
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          878.416666666666800000
          2.645833333333333000
          926.041666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'NOMBREANIMAL'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand5: TQRBand
      Left = 38
      Top = 97
      Width = 718
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666680000
        1899.708333333333000000)
      BandType = rbSummary
      object LabelCantidadEventos: TQRLabel
        Left = 8
        Top = 8
        Width = 154
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          407.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de Movimientos: '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr2: TQRExpr
        Left = 169
        Top = 8
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          447.145833333333400000
          21.166666666666670000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Master = QRServicioEventosToros
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'COUNT'
        FontSize = 10
      end
    end
  end
  object QRSummary: TQuickRep [5]
    Left = 76
    Top = 580
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand6: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        92.604166666666680000
        1899.708333333333000000)
      BandType = rbPageFooter
      object QRShape1: TQRShape
        Left = 0
        Top = 0
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          0.000000000000000000
          1899.708333333333000000)
        Shape = qrsHorLine
      end
      object QRLabel5: TQRLabel
        Left = 8
        Top = 2
        Width = 195
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          5.291666666666667000
          515.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Huella - Todos los derechos reservados'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRSDPageRPs: TQRSysData
        Left = 664
        Top = 2
        Width = 39
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1756.833333333333000000
          5.291666666666667000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
      object QRLPagRPs: TQRLabel
        Left = 632
        Top = 2
        Width = 22
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1672.166666666667000000
          5.291666666666667000
          58.208333333333340000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pag.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLDatosAbajo13: TQRLabel
        Left = 362
        Top = 2
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          957.791666666666800000
          5.291666666666667000
          153.458333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos abajo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLDatosAbajo23: TQRLabel
        Left = 362
        Top = 16
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          957.791666666666800000
          42.333333333333340000
          153.458333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos abajo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object QRServicioEventosHembras: TQuickRep [6]
    Left = 76
    Top = 400
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand7: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1899.708333333333000000)
      BandType = rbColumnHeader
      object QRLabel1: TQRLabel
        Left = 32
        Top = 20
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          52.916666666666670000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 248
        Top = 20
        Width = 19
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          656.166666666666800000
          52.916666666666670000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 8
        Top = 1
        Width = 166
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          21.166666666666670000
          2.645833333333333000
          439.208333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Din'#225'mica de hembras'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel4: TQRLabel
        Left = 120
        Top = 20
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          52.916666666666670000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Evento'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText10: TQRDBText
        Left = 232
        Top = 40
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          613.833333333333400000
          105.833333333333300000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'QRDBText5'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape6: TQRShape
        Left = -1
        Top = 38
        Width = 719
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          -2.645833333333333000
          100.541666666666700000
          1902.354166666667000000)
        Shape = qrsHorLine
      end
    end
    object QRBand8: TQRBand
      Left = 38
      Top = 78
      Width = 718
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      BandType = rbDetail
      object QRDBText11: TQRDBText
        Left = 27
        Top = 2
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          71.437500000000000000
          5.291666666666667000
          119.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'FECHA'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText12: TQRDBText
        Left = 239
        Top = 2
        Width = 114
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          632.354166666666800000
          5.291666666666667000
          301.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'ID_RP'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText13: TQRDBText
        Left = 96
        Top = 1
        Width = 140
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          2.645833333333333000
          370.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'NOMBREEVENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand9: TQRBand
      Left = 38
      Top = 98
      Width = 718
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666680000
        1899.708333333333000000)
      BandType = rbSummary
      object QRLabel6: TQRLabel
        Left = 8
        Top = 8
        Width = 154
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          407.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de Movimientos: '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr3: TQRExpr
        Left = 168
        Top = 8
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          21.166666666666670000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Master = QRServicioEventosHembras
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'COUNT'
        FontSize = 10
      end
    end
    object QRBand10: TQRBand
      Left = 38
      Top = 130
      Width = 718
      Height = 36
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        95.250000000000000000
        1899.708333333333000000)
      BandType = rbPageFooter
      object QRShape2: TQRShape
        Left = 0
        Top = 0
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          0.000000000000000000
          1899.708333333333000000)
        Shape = qrsHorLine
      end
      object QRLabel7: TQRLabel
        Left = 8
        Top = 2
        Width = 195
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          5.291666666666667000
          515.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Huella - Todos los derechos reservados'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 664
        Top = 2
        Width = 39
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1756.833333333333000000
          5.291666666666667000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 632
        Top = 2
        Width = 22
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1672.166666666667000000
          5.291666666666667000
          58.208333333333340000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pag.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLDatosAbajo12: TQRLabel
        Left = 362
        Top = 2
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          957.791666666666800000
          5.291666666666667000
          153.458333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos abajo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLDatosAbajo22: TQRLabel
        Left = 362
        Top = 16
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          957.791666666666800000
          42.333333333333340000
          153.458333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos abajo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object QRServicioAnimales: TQuickRep [7]
    Left = 61
    Top = 17
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = IBQconsultaAnimal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBEncabezadoPlanilla: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 107
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBEncabezadoPlanillaBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        283.104166666666700000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QRLRenglon1: TQRLabel
        Left = 563
        Top = 45
        Width = 150
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1489.604166666667000000
          119.062500000000000000
          396.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre del Veterinario'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLRenglon2: TQRLabel
        Left = 563
        Top = 24
        Width = 150
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1489.604166666667000000
          63.500000000000000000
          396.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre del Veterinario'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRImage2: TQRImage
        Left = 8
        Top = 30
        Width = 80
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          21.166666666666670000
          79.375000000000000000
          211.666666666666700000)
        AutoSize = True
        Picture.Data = {
          0A544A504547496D6167651D610000FFD8FFE000104A46494600010201004800
          480000FFE107E34578696600004D4D002A000000080007011200030000000100
          010000011A00050000000100000062011B0005000000010000006A0128000300
          0000010002000001310002000000140000007201320002000000140000008687
          690004000000010000009C000000C80000004800000001000000480000000141
          646F62652050686F746F73686F7020372E3000323030363A30333A3237203134
          3A35353A34320000000003A00100030000000100010000A00200040000000100
          000050A003000400000001000000310000000000000006010300030000000100
          060000011A00050000000100000116011B0005000000010000011E0128000300
          000001000200000201000400000001000001260202000400000001000006B500
          00000000000048000000010000004800000001FFD8FFE000104A464946000102
          01004800480000FFED000C41646F62655F434D0001FFEE000E41646F62650064
          8000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518
          131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14
          110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0CFFC00011080031005003012200021101031101FFDD
          00040005FFC4013F000001050101010101010000000000000003000102040506
          0708090A0B010001050101010101010000000000000001000203040506070809
          0A0B1000010401030204020507060805030C3301000211030421123105415161
          1322718132061491A1B14223241552C16233347282D14307259253F0E1F16373
          3516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A4
          85B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7
          B7C7D7E7F7110002020102040403040506070706053501000211032131120441
          51617122130532819114A1B14223C152D1F0332462E1728292435315637334F1
          250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F346
          94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6273747576777
          8797A7B7C7FFDA000C03010002110311003F00F554924925296575BEB6CE9D5E
          C641BCB7712EFA2C6F1BDF1F4B77F83AD6AAF3E75AEEB7F5B4619334B2E7D968
          F16D27631BFD9DA955B0E7C8622223F34CF0C5375CBF3E9E91FB472EC7B9F7B8
          32863DC473EEDDE9336D6DF6B557A5BD7A9E894F5EE9596E2C009CAC63243769
          2CB1C18EDCCB2BF6FF005D6CFF008C2C5759D16AB59A371EE69737F92E06BFFA
          ADAADFD4CC535FD5BA6BB44B6EDEFDA7F75E784EA0220F8B5CC0CB98963B207B
          608983AF17EF33FAB1F596AEB741658D15665401B6B1F45C3FD2D5FC9FFA85B8
          BCDBA3D36F4AFAD871EB24331EF351F3AEC70AD9FF0046C6397A4A12ABD19794
          CB3C90227F3C24604FEF57E929249241B2FF00FFD0F55492492529709818E3A4
          7F8C0B197FB2BCCF51D438F07D5FD2340FFAE35F52EED6675DE8389D6B1C5771
          35DF56B45EDFA4C3FF007E6A20FE2C39F19908CA3ACB1CB8E23F7BBC51FD6D6B
          5DF5733C3BB5723E20B5CDFF00A4AE74A632BE9988C67D014B208FEA85C6F54E
          8BF5D6DAFEC97DBF6CC51C3D8E1AC71BD8EDB62B7D1FA3FD65AB1C623ED7B718
          0DA1963806347EEC30BEE737FE0FF468902B7628E599CA4FB331E911B3E0CB0F
          13ED7F592FC966A2EBC580F855447BFF00EBD7359B1760A9F4EE9B56056434FA
          975906DB4882E8FA200FCCAD9F98C571359F163E007BC8991FF094924924C8FF
          00FFD1EDB03AEF58C8A0BDDD26DBA2DB582DADF4B1AE6B2CB2A610CBEE6DBF45
          9F9C8747D65C8651D3F2FA931B898F936655792F70315BAA7B998B5B9E0B98DF
          51B5BFF9167E62DD16644C7A503C770FDEDBFF0051EF4CEB3241814070DA4CEE
          1CEE8DBAFF0023DE9238878FD85CDAFEB162E6753C4C4E9775794CB3D4765964
          BBD363587D376E1ED66FBFD367B972D5FD75EB8E6CDB751559243AA35D60B482
          46D3EAE75767F9F5AEC7AA64751A7A7E4D98744DEC6B8D51EE260801DB3FE2FF
          0049B571A3EB07D6C201365A0C191F666F23E87F83FCF4E1127B3066E6E18481
          28CE562FD23FEFB85E8EBFAC7F671D32DCFBAA662E663DB65B9246D6FAAD34FA
          55B1CC7DD5B7732CBBDBEA59FCDAB8DEBFD372E9C81D3326BCAC9AA97DADA987
          713B47B7DA3F97B57203EB07D6BEF65C3E8FFDA66F7FA7FE0FF312FF009C1F5A
          E5DFA4BB40769FB337520FB47F37F9CD47DB3DC30FFA4B17F9BC9F647FEF9E9F
          0FEB7F427E1D1664E7515DEEAD8EB9931B5E5A0D8CDA7E8ED7A6EBDD6F2A8346
          274AADF6E464016BEFAE9764369A75DB6BAAACB3D47DCF6FA75337FF00C22E64
          F5FF00AD7AFE92DFCD8FD59BDFE9FF0083FCC4BFE707D6C81FA4BA60923ECC39
          1F45BFCDFE725ED9EE15FE92C5FE6F27D91FFBE776FF00ACD9CDE935DCEC738D
          98CB998F9CD7B49151237FACD63B6EEAAD6EC7D7FF00A5152A3EB47563531FEA
          D37DE6D0CFB335A25CD2EDBECD8F73FE82B3D3BA9F59BBEAFE6E4F507BA8BA93
          38D7166D739C20B6BF4A1BEA35D67E8BE8FBF7ABBF6EEA6337A58F4B6DD9359F
          B6E1F2DAD823F59DFF0098E6BBDBFF0009FCDA5B6940AA529642324724E11901
          50AF978A5C1FBCFF00FFD2F55497CAA924A7EAA497CAA924A7EAA497CAA924A7
          EAA497CAA924A7EA4CAFE6DBFF00195FFD53530FE98EFF008B6FFD53D7CB8924
          B4FCDF67FDD3FFD9FFED2E9A50686F746F73686F7020332E30003842494D0425
          000000000010000000000000000000000000000000003842494D03EA00000000
          218E3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D22
          5554462D38223F3E0A3C21444F435459504520706C697374205055424C494320
          222D2F2F4170706C6520436F6D70757465722F2F44544420504C49535420312E
          302F2F454E222022687474703A2F2F7777772E6170706C652E636F6D2F445444
          732F50726F70657274794C6973742D312E302E647464223E0A3C706C69737420
          76657273696F6E3D22312E30223E0A3C646963743E0A093C6B65793E636F6D2E
          6170706C652E7072696E742E50616765466F726D61742E466F726D617474696E
          675072696E7465723C2F6B65793E0A093C646963743E0A09093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65
          793E0A09093C737472696E673E636F6D2E6170706C652E7072696E74696E676D
          616E616765723C2F737472696E673E0A09093C6B65793E636F6D2E6170706C65
          2E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909
          3C61727261793E0A0909093C646963743E0A090909093C6B65793E636F6D2E61
          70706C652E7072696E742E50616765466F726D61742E466F726D617474696E67
          5072696E7465723C2F6B65793E0A090909093C737472696E673E5374796C7573
          5F50686F746F5F313237303C2F737472696E673E0A090909093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E636C69656E743C2F6B6579
          3E0A090909093C737472696E673E636F6D2E6170706C652E7072696E74696E67
          6D616E616765723C2F737472696E673E0A090909093C6B65793E636F6D2E6170
          706C652E7072696E742E7469636B65742E6D6F64446174653C2F6B65793E0A09
          0909093C646174653E323030342D30362D32335431393A31373A30305A3C2F64
          6174653E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E7374617465466C61673C2F6B65793E0A090909093C696E74656765
          723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F617272
          61793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E707269
          6E742E50616765466F726D61742E504D486F72697A6F6E74616C5265733C2F6B
          65793E0A093C646963743E0A09093C6B65793E636F6D2E6170706C652E707269
          6E742E7469636B65742E63726561746F723C2F6B65793E0A09093C737472696E
          673E636F6D2E6170706C652E7072696E74696E676D616E616765723C2F737472
          696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B
          65742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A090909
          3C646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E
          50616765466F726D61742E504D486F72697A6F6E74616C5265733C2F6B65793E
          0A090909093C7265616C3E37323C2F7265616C3E0A090909093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E636C69656E743C2F6B6579
          3E0A090909093C737472696E673E636F6D2E6170706C652E7072696E74696E67
          6D616E616765723C2F737472696E673E0A090909093C6B65793E636F6D2E6170
          706C652E7072696E742E7469636B65742E6D6F64446174653C2F6B65793E0A09
          0909093C646174653E323030342D30362D32335431393A31373A30395A3C2F64
          6174653E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E7374617465466C61673C2F6B65793E0A090909093C696E74656765
          723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F617272
          61793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E707269
          6E742E50616765466F726D61742E504D4F7269656E746174696F6E3C2F6B6579
          3E0A093C646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E74
          2E7469636B65742E63726561746F723C2F6B65793E0A09093C737472696E673E
          636F6D2E6170706C652E7072696E74696E676D616E616765723C2F737472696E
          673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
          2E6974656D41727261793C2F6B65793E0A09093C61727261793E0A0909093C64
          6963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E5061
          6765466F726D61742E504D4F7269656E746174696F6E3C2F6B65793E0A090909
          093C696E74656765723E313C2F696E74656765723E0A090909093C6B65793E63
          6F6D2E6170706C652E7072696E742E7469636B65742E636C69656E743C2F6B65
          793E0A090909093C737472696E673E636F6D2E6170706C652E7072696E74696E
          676D616E616765723C2F737472696E673E0A090909093C6B65793E636F6D2E61
          70706C652E7072696E742E7469636B65742E6D6F64446174653C2F6B65793E0A
          090909093C646174653E323030342D30362D32335431393A31373A30305A3C2F
          646174653E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E74
          69636B65742E7374617465466C61673C2F6B65793E0A090909093C696E746567
          65723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F6172
          7261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E7072
          696E742E50616765466F726D61742E504D5363616C696E673C2F6B65793E0A09
          3C646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E63726561746F723C2F6B65793E0A09093C737472696E673E636F6D
          2E6170706C652E7072696E74696E676D616E616765723C2F737472696E673E0A
          09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974
          656D41727261793C2F6B65793E0A09093C61727261793E0A0909093C64696374
          3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E5061676546
          6F726D61742E504D5363616C696E673C2F6B65793E0A090909093C7265616C3E
          313C2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E
          742E7469636B65742E636C69656E743C2F6B65793E0A090909093C737472696E
          673E636F6D2E6170706C652E7072696E74696E676D616E616765723C2F737472
          696E673E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E6D6F64446174653C2F6B65793E0A090909093C646174653E323030
          342D30362D32335431393A31373A30305A3C2F646174653E0A090909093C6B65
          793E636F6D2E6170706C652E7072696E742E7469636B65742E7374617465466C
          61673C2F6B65793E0A090909093C696E74656765723E303C2F696E7465676572
          3E0A0909093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E
          0A093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61
          742E504D566572746963616C5265733C2F6B65793E0A093C646963743E0A0909
          3C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561
          746F723C2F6B65793E0A09093C737472696E673E636F6D2E6170706C652E7072
          696E74696E676D616E616765723C2F737472696E673E0A09093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
          6B65793E0A09093C61727261793E0A0909093C646963743E0A090909093C6B65
          793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D56
          6572746963616C5265733C2F6B65793E0A090909093C7265616C3E37323C2F72
          65616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E7469
          636B65742E636C69656E743C2F6B65793E0A090909093C737472696E673E636F
          6D2E6170706C652E7072696E74696E676D616E616765723C2F737472696E673E
          0A090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
          2E6D6F64446174653C2F6B65793E0A090909093C646174653E323030342D3036
          2D32335431393A31373A30395A3C2F646174653E0A090909093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F
          6B65793E0A090909093C696E74656765723E303C2F696E74656765723E0A0909
          093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C6B
          65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D
          566572746963616C5363616C696E673C2F6B65793E0A093C646963743E0A0909
          3C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561
          746F723C2F6B65793E0A09093C737472696E673E636F6D2E6170706C652E7072
          696E74696E676D616E616765723C2F737472696E673E0A09093C6B65793E636F
          6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
          6B65793E0A09093C61727261793E0A0909093C646963743E0A090909093C6B65
          793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D56
          6572746963616C5363616C696E673C2F6B65793E0A090909093C7265616C3E31
          3C2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E74
          2E7469636B65742E636C69656E743C2F6B65793E0A090909093C737472696E67
          3E636F6D2E6170706C652E7072696E74696E676D616E616765723C2F73747269
          6E673E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E746963
          6B65742E6D6F64446174653C2F6B65793E0A090909093C646174653E32303034
          2D30362D32335431393A31373A30305A3C2F646174653E0A090909093C6B6579
          3E636F6D2E6170706C652E7072696E742E7469636B65742E7374617465466C61
          673C2F6B65793E0A090909093C696E74656765723E303C2F696E74656765723E
          0A0909093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A
          093C6B65793E636F6D2E6170706C652E7072696E742E7375625469636B65742E
          70617065725F696E666F5F7469636B65743C2F6B65793E0A093C646963743E0A
          09093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61
          742E504D41646A757374656450616765526563743C2F6B65793E0A09093C6469
          63743E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B
          65742E63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E
          6170706C652E7072696E74696E676D616E616765723C2F737472696E673E0A09
          09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974
          656D41727261793C2F6B65793E0A0909093C61727261793E0A090909093C6469
          63743E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E5061
          6765466F726D61742E504D41646A757374656450616765526563743C2F6B6579
          3E0A09090909093C61727261793E0A0909090909093C7265616C3E302E303C2F
          7265616C3E0A0909090909093C7265616C3E302E303C2F7265616C3E0A090909
          0909093C7265616C3E313138323C2F7265616C3E0A0909090909093C7265616C
          3E3834323C2F7265616C3E0A09090909093C2F61727261793E0A09090909093C
          6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E636C69656E
          743C2F6B65793E0A09090909093C737472696E673E636F6D2E6170706C652E70
          72696E74696E676D616E616765723C2F737472696E673E0A09090909093C6B65
          793E636F6D2E6170706C652E7072696E742E7469636B65742E6D6F6444617465
          3C2F6B65793E0A09090909093C646174653E323030362D30332D32375431373A
          34323A30365A3C2F646174653E0A09090909093C6B65793E636F6D2E6170706C
          652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09
          090909093C696E74656765723E303C2F696E74656765723E0A090909093C2F64
          6963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65
          793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E504D41
          646A75737465645061706572526563743C2F6B65793E0A09093C646963743E0A
          0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E63
          726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E6170706C
          652E7072696E74696E676D616E616765723C2F737472696E673E0A0909093C6B
          65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D4172
          7261793C2F6B65793E0A0909093C61727261793E0A090909093C646963743E0A
          09090909093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F
          726D61742E504D41646A75737465645061706572526563743C2F6B65793E0A09
          090909093C61727261793E0A0909090909093C7265616C3E302E303C2F726561
          6C3E0A0909090909093C7265616C3E302E303C2F7265616C3E0A090909090909
          3C7265616C3E313139313C2F7265616C3E0A0909090909093C7265616C3E3834
          323C2F7265616C3E0A09090909093C2F61727261793E0A09090909093C6B6579
          3E636F6D2E6170706C652E7072696E742E7469636B65742E636C69656E743C2F
          6B65793E0A09090909093C737472696E673E636F6D2E6170706C652E7072696E
          74696E676D616E616765723C2F737472696E673E0A09090909093C6B65793E63
          6F6D2E6170706C652E7072696E742E7469636B65742E6D6F64446174653C2F6B
          65793E0A09090909093C646174653E323030362D30332D32375431373A34323A
          30365A3C2F646174653E0A09090909093C6B65793E636F6D2E6170706C652E70
          72696E742E7469636B65742E7374617465466C61673C2F6B65793E0A09090909
          093C696E74656765723E303C2F696E74656765723E0A090909093C2F64696374
          3E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C6B65793E63
          6F6D2E6170706C652E7072696E742E5061706572496E666F2E504D436F6E7374
          7261696E656450617065723C2F6B65793E0A09093C646963743E0A0909093C6B
          65793E636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F
          723C2F6B65793E0A0909093C737472696E673E435550535F43504C3C2F737472
          696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E746963
          6B65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A09
          0909093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E7072
          696E742E5061706572496E666F2E504D436F6E73747261696E65645061706572
          3C2F6B65793E0A09090909093C66616C73652F3E0A09090909093C6B65793E63
          6F6D2E6170706C652E7072696E742E7469636B65742E636C69656E743C2F6B65
          793E0A09090909093C737472696E673E435550535F43504C3C2F737472696E67
          3E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B
          65742E6D6F64446174653C2F6B65793E0A09090909093C646174653E32303034
          2D30362D32335431393A31363A35375A3C2F646174653E0A09090909093C6B65
          793E636F6D2E6170706C652E7072696E742E7469636B65742E7374617465466C
          61673C2F6B65793E0A09090909093C696E74656765723E313C2F696E74656765
          723E0A090909093C2F646963743E0A0909093C2F61727261793E0A09093C2F64
          6963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E50617065
          72496E666F2E504D50617065724E616D653C2F6B65793E0A09093C646963743E
          0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
          63726561746F723C2F6B65793E0A0909093C737472696E673E435550535F4350
          4C3C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E707269
          6E742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C6172
          7261793E0A090909093C646963743E0A09090909093C6B65793E636F6D2E6170
          706C652E7072696E742E5061706572496E666F2E504D50617065724E616D653C
          2F6B65793E0A09090909093C737472696E673E69736F2D61333C2F737472696E
          673E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E746963
          6B65742E636C69656E743C2F6B65793E0A09090909093C737472696E673E4355
          50535F43504C3C2F737472696E673E0A09090909093C6B65793E636F6D2E6170
          706C652E7072696E742E7469636B65742E6D6F64446174653C2F6B65793E0A09
          090909093C646174653E323030342D30362D32335431393A31363A35375A3C2F
          646174653E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E
          7469636B65742E7374617465466C61673C2F6B65793E0A09090909093C696E74
          656765723E313C2F696E74656765723E0A090909093C2F646963743E0A090909
          3C2F61727261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170
          706C652E7072696E742E5061706572496E666F2E504D556E61646A7573746564
          50616765526563743C2F6B65793E0A09093C646963743E0A0909093C6B65793E
          636F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F
          6B65793E0A0909093C737472696E673E435550535F43504C3C2F737472696E67
          3E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
          2E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A09090909
          3C646963743E0A09090909093C6B65793E636F6D2E6170706C652E7072696E74
          2E5061706572496E666F2E504D556E61646A757374656450616765526563743C
          2F6B65793E0A09090909093C61727261793E0A0909090909093C7265616C3E30
          2E303C2F7265616C3E0A0909090909093C7265616C3E302E303C2F7265616C3E
          0A0909090909093C7265616C3E313138323C2F7265616C3E0A0909090909093C
          7265616C3E3834323C2F7265616C3E0A09090909093C2F61727261793E0A0909
          0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E63
          6C69656E743C2F6B65793E0A09090909093C737472696E673E435550535F4350
          4C3C2F737472696E673E0A09090909093C6B65793E636F6D2E6170706C652E70
          72696E742E7469636B65742E6D6F64446174653C2F6B65793E0A09090909093C
          646174653E323030342D30362D32335431393A31363A35375A3C2F646174653E
          0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
          742E7374617465466C61673C2F6B65793E0A09090909093C696E74656765723E
          313C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F617272
          61793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E70
          72696E742E5061706572496E666F2E504D556E61646A75737465645061706572
          526563743C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E
          6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E
          0A0909093C737472696E673E435550535F43504C3C2F737472696E673E0A0909
          093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E697465
          6D41727261793C2F6B65793E0A0909093C61727261793E0A090909093C646963
          743E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E506170
          6572496E666F2E504D556E61646A75737465645061706572526563743C2F6B65
          793E0A09090909093C61727261793E0A0909090909093C7265616C3E302E303C
          2F7265616C3E0A0909090909093C7265616C3E302E303C2F7265616C3E0A0909
          090909093C7265616C3E313139313C2F7265616C3E0A0909090909093C726561
          6C3E3834323C2F7265616C3E0A09090909093C2F61727261793E0A0909090909
          3C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E636C6965
          6E743C2F6B65793E0A09090909093C737472696E673E435550535F43504C3C2F
          737472696E673E0A09090909093C6B65793E636F6D2E6170706C652E7072696E
          742E7469636B65742E6D6F64446174653C2F6B65793E0A09090909093C646174
          653E323030342D30362D32335431393A31363A35375A3C2F646174653E0A0909
          0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E73
          74617465466C61673C2F6B65793E0A09090909093C696E74656765723E313C2F
          696E74656765723E0A090909093C2F646963743E0A0909093C2F61727261793E
          0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E
          742E5061706572496E666F2E7070642E504D50617065724E616D653C2F6B6579
          3E0A09093C646963743E0A0909093C6B65793E636F6D2E6170706C652E707269
          6E742E7469636B65742E63726561746F723C2F6B65793E0A0909093C73747269
          6E673E435550535F43504C3C2F737472696E673E0A0909093C6B65793E636F6D
          2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F6B
          65793E0A0909093C61727261793E0A090909093C646963743E0A09090909093C
          6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F2E7070
          642E504D50617065724E616D653C2F6B65793E0A09090909093C737472696E67
          3E41333C2F737472696E673E0A09090909093C6B65793E636F6D2E6170706C65
          2E7072696E742E7469636B65742E636C69656E743C2F6B65793E0A0909090909
          3C737472696E673E435550535F43504C3C2F737472696E673E0A09090909093C
          6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6D6F644461
          74653C2F6B65793E0A09090909093C646174653E323030342D30362D32335431
          393A31363A35375A3C2F646174653E0A09090909093C6B65793E636F6D2E6170
          706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E
          0A09090909093C696E74656765723E313C2F696E74656765723E0A090909093C
          2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C
          6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E4150495665
          7273696F6E3C2F6B65793E0A09093C737472696E673E30302E32303C2F737472
          696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B
          65742E707269766174654C6F636B3C2F6B65793E0A09093C66616C73652F3E0A
          09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E7479
          70653C2F6B65793E0A09093C737472696E673E636F6D2E6170706C652E707269
          6E742E5061706572496E666F5469636B65743C2F737472696E673E0A093C2F64
          6963743E0A093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
          742E41504956657273696F6E3C2F6B65793E0A093C737472696E673E30302E32
          303C2F737472696E673E0A093C6B65793E636F6D2E6170706C652E7072696E74
          2E7469636B65742E707269766174654C6F636B3C2F6B65793E0A093C66616C73
          652F3E0A093C6B65793E636F6D2E6170706C652E7072696E742E7469636B6574
          2E747970653C2F6B65793E0A093C737472696E673E636F6D2E6170706C652E70
          72696E742E50616765466F726D61745469636B65743C2F737472696E673E0A3C
          2F646963743E0A3C2F706C6973743E0A3842494D03E900000000007800030000
          0048004800000000049E034A0000000004A7034A036707C1057B000200000048
          00480000000002D802280001000000640000000100030303000000017FFF0001
          0001000000000000000000000000680800190190000000000020000000000000
          00000000000000000000000000000000000000003842494D03ED000000000010
          004800000001000100480000000100013842494D042600000000000E00000000
          0000000000003F8000003842494D040D0000000000040000001E3842494D0419
          0000000000040000001E3842494D03F300000000000900000000000000000100
          3842494D040A00000000000100003842494D271000000000000A000100000000
          000000013842494D03F5000000000048002F66660001006C6666000600000000
          0001002F6666000100A1999A0006000000000001003200000001005A00000006
          000000000001003500000001002D000000060000000000013842494D03F80000
          000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E80000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D0408000000000010
          000000010000024000000240000000003842494D041E00000000000400000000
          3842494D041A0000000003530000000600000000000000000000003100000050
          0000000F005600450054004500520049004E004100520049004F002000350036
          0039000000010000000000000000000000000000000000000001000000000000
          0000000000500000003100000000000000000000000000000000010000000000
          000000000000000000000000000010000000010000000000006E756C6C000000
          0200000006626F756E64734F626A630000000100000000000052637431000000
          0400000000546F70206C6F6E6700000000000000004C6566746C6F6E67000000
          000000000042746F6D6C6F6E670000003100000000526768746C6F6E67000000
          5000000006736C69636573566C4C73000000014F626A63000000010000000000
          05736C6963650000001200000007736C69636549446C6F6E6700000000000000
          0767726F757049446C6F6E6700000000000000066F726967696E656E756D0000
          000C45536C6963654F726967696E0000000D6175746F47656E65726174656400
          00000054797065656E756D0000000A45536C6963655479706500000000496D67
          2000000006626F756E64734F626A630000000100000000000052637431000000
          0400000000546F70206C6F6E6700000000000000004C6566746C6F6E67000000
          000000000042746F6D6C6F6E670000003100000000526768746C6F6E67000000
          500000000375726C54455854000000010000000000006E756C6C544558540000
          00010000000000004D7367655445585400000001000000000006616C74546167
          544558540000000100000000000E63656C6C54657874497348544D4C626F6F6C
          010000000863656C6C546578745445585400000001000000000009686F727A41
          6C69676E656E756D0000000F45536C696365486F727A416C69676E0000000764
          656661756C740000000976657274416C69676E656E756D0000000F45536C6963
          6556657274416C69676E0000000764656661756C740000000B6267436F6C6F72
          54797065656E756D0000001145536C6963654247436F6C6F7254797065000000
          004E6F6E6500000009746F704F75747365746C6F6E67000000000000000A6C65
          66744F75747365746C6F6E67000000000000000C626F74746F6D4F7574736574
          6C6F6E67000000000000000B72696768744F75747365746C6F6E670000000000
          3842494D0414000000000004000000023842494D040C0000000006D100000001
          0000005000000031000000F000002DF0000006B500180001FFD8FFE000104A46
          494600010201004800480000FFED000C41646F62655F434D0001FFEE000E4164
          6F626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F
          0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E1414
          0E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080031005003012200021101
          031101FFDD00040005FFC4013F00000105010101010101000000000000000300
          01020405060708090A0B01000105010101010101000000000000000100020304
          05060708090A0B1000010401030204020507060805030C330100021103042112
          31054151611322718132061491A1B14223241552C16233347282D14307259253
          F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3
          F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6374757
          67778797A7B7C7D7E7F711000202010204040304050607070605350100021103
          213112044151617122130532819114A1B14223C152D1F0332462E17282924353
          15637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3
          D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F627
          37475767778797A7B7C7FFDA000C03010002110311003F00F554924925296575
          BEB6CE9D5EC641BCB7712EFA2C6F1BDF1F4B77F83AD6AAF3E75AEEB7F5B46193
          34B2E7D968F16D27631BFD9DA955B0E7C8622223F34CF0C5375CBF3E9E91FB47
          2EC7B9F7B832863DC473EEDDE9336D6DF6B557A5BD7A9E894F5EE9596E2C009C
          AC632437692CB1C18EDCCB2BF6FF005D6CFF008C2C5759D16AB59A371EE69737
          F92E06BFFAADAADFD4CC535FD5BA6BB44B6EDEFDA7F75E784EA0220F8B5CC0CB
          98963B207B608983AF17EF33FAB1F596AEB741658D15665401B6B1F45C3FD2D5
          FC9FFA85B8BCDBA3D36F4AFAD871EB24331EF351F3AEC70AD9FF0046C6397A4A
          12ABD19794CB3C90227F3C24604FEF57E929249241B2FF00FFD0F55492492529
          709818E3A47F8C0B197FB2BCCF51D438F07D5FD2340FFAE35F52EED6675DE838
          9D6B1C577135DF56B45EDFA4C3FF007E6A20FE2C39F19908CA3ACB1CB8E23F7B
          BC51FD6D6B5DF5733C3BB5723E20B5CDFF00A4AE74A632BE9988C67D014B208F
          EA85C6F54E8BF5D6DAFEC97DBF6CC51C3D8E1AC71BD8EDB62B7D1FA3FD65AB1C
          623ED7B7180DA1963806347EEC30BEE737FE0FF468902B7628E599CA4FB331E9
          11B3E0CB0F13ED7F592FC966A2EBC580F855447BFF00EBD7359B1760A9F4EE9B
          56056434FA975906DB4882E8FA200FCCAD9F98C571359F163E007BC8991FF094
          924924C8FF00FFD1EDB03AEF58C8A0BDDD26DBA2DB582DADF4B1AE6B2CB2A610
          CBEE6DBF459F9C8747D65C8651D3F2FA931B898F936655792F70315BAA7B998B
          5B9E0B98DF51B5BFF9167E62DD16644C7A503C770FDEDBFF0051EF4CEB324181
          4070DA4CEE1CEE8DBAFF0023DE9238878FD85CDAFEB162E6753C4C4E9775794C
          B3D4765964BBD363587D376E1ED66FBFD367B972D5FD75EB8E6CDB751559243A
          A35D60B48246D3EAE75767F9F5AEC7AA64751A7A7E4D98744DEC6B8D51EE2608
          01DB3FE2FF0049B571A3EB07D6C201365A0C191F666F23E87F83FCF4E1127B30
          66E6E1848128CE562FD23FEFB85E8EBFAC7F671D32DCFBAA662E663DB65B9246
          D6FAAD34FA55B1CC7DD5B7732CBBDBEA59FCDAB8DEBFD372E9C81D3326BCAC9A
          A97DADA987713B47B7DA3F97B57203EB07D6BEF65C3E8FFDA66F7FA7FE0FF312
          FF009C1F5AE5DFA4BB40769FB337520FB47F37F9CD47DB3DC30FFA4B17F9BC9F
          647FEF9E9F0FEB7F427E1D1664E7515DEEAD8EB9931B5E5A0D8CDA7E8ED7A6EB
          DD6F2A8346274AADF6E464016BEFAE9764369A75DB6BAAACB3D47DCF6FA75337
          FF00C22E64F5FF00AD7AFE92DFCD8FD59BDFE9FF0083FCC4BFE707D6C81FA4BA
          60923ECC391F45BFCDFE725ED9EE15FE92C5FE6F27D91FFBE776FF00ACD9CDE9
          35DCEC738D98CB998F9CD7B49151237FACD63B6EEAAD6EC7D7FF00A5152A3EB4
          7563531FEAD37DE6D0CFB335A25CD2EDBECD8F73FE82B3D3BA9F59BBEAFE6E4F
          507BA8BA9338D7166D739C20B6BF4A1BEA35D67E8BE8FBF7ABBF6EEA6337A58F
          4B6DD9359FB6E1F2DAD823F59DFF0098E6BBDBFF0009FCDA5B6940AA52964232
          4724E1190150AF978A5C1FBCFF00FFD2F55497CAA924A7EAA497CAA924A7EAA4
          97CAA924A7EAA497CAA924A7EA4CAFE6DBFF00195FFD53530FE98EFF008B6FFD
          53D7CB8924B4FCDF67FDD3FFD9003842494D0421000000000055000000010100
          00000F00410064006F00620065002000500068006F0074006F00730068006F00
          700000001300410064006F00620065002000500068006F0074006F0073006800
          6F007000200037002E003000000001003842494D040600000000000700060000
          00010100FFE11248687474703A2F2F6E732E61646F62652E636F6D2F7861702F
          312E302F003C3F787061636B657420626567696E3D27EFBBBF272069643D2757
          354D304D7043656869487A7265537A4E54637A6B633964273F3E0A3C3F61646F
          62652D7861702D66696C74657273206573633D224352223F3E0A3C783A786170
          6D65746120786D6C6E733A783D2761646F62653A6E733A6D6574612F2720783A
          786170746B3D27584D5020746F6F6C6B697420322E382E322D33332C20667261
          6D65776F726B20312E35273E0A3C7264663A52444620786D6C6E733A7264663D
          27687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264
          662D73796E7461782D6E73232720786D6C6E733A69583D27687474703A2F2F6E
          732E61646F62652E636F6D2F69582F312E302F273E0A0A203C7264663A446573
          6372697074696F6E2061626F75743D27757569643A33316137363936342D6266
          33322D313164612D393935302D396635313163396662373932270A2020786D6C
          6E733A7861704D4D3D27687474703A2F2F6E732E61646F62652E636F6D2F7861
          702F312E302F6D6D2F273E0A20203C7861704D4D3A446F63756D656E7449443E
          61646F62653A646F6369643A70686F746F73686F703A30303532633637652D62
          6633312D313164612D393935302D3966353131633966623739323C2F7861704D
          4D3A446F63756D656E7449443E0A203C2F7264663A4465736372697074696F6E
          3E0A0A3C2F7264663A5244463E0A3C2F783A7861706D6574613E0A2020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020202020200A
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020200A202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020200A20202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020200A2020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020200A202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020200A20202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020202020200A2020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20200A2020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020200A202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020200A20202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020200A2020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020200A202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020200A20202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          0A20202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020200A2020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020200A202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020200A20202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020200A2020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020200A202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020200A20
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020200A20202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020200A2020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020200A202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020200A20202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020200A2020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020200A202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          200A202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020200A20202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020200A2020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020200A202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020200A20202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020200A2020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020202020200A
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020200A202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020200A20202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020200A2020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020200A202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020200A20202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020202020200A2020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20200A2020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020200A3C3F787061
          636B657420656E643D2777273F3EFFE20C584943435F50524F46494C45000101
          00000C484C696E6F021000006D6E74725247422058595A2007CE000200090006
          00310000616373704D5346540000000049454320735247420000000000000000
          000000010000F6D6000100000000D32D48502020000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000001163707274000001500000003364657363000001840000006C77747074
          000001F000000014626B707400000204000000147258595A0000021800000014
          6758595A0000022C000000146258595A0000024000000014646D6E6400000254
          00000070646D6464000002C400000088767565640000034C0000008676696577
          000003D4000000246C756D69000003F8000000146D6561730000040C00000024
          74656368000004300000000C725452430000043C0000080C675452430000043C
          0000080C625452430000043C0000080C7465787400000000436F707972696768
          74202863292031393938204865776C6574742D5061636B61726420436F6D7061
          6E790000646573630000000000000012735247422049454336313936362D322E
          31000000000000000000000012735247422049454336313936362D322E310000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000058595A20000000000000F35100010000
          000116CC58595A200000000000000000000000000000000058595A2000000000
          00006FA2000038F50000039058595A2000000000000062990000B785000018DA
          58595A2000000000000024A000000F840000B6CF646573630000000000000016
          49454320687474703A2F2F7777772E6965632E63680000000000000000000000
          1649454320687474703A2F2F7777772E6965632E636800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000064657363000000000000002E4945432036313936362D322E31204465
          6661756C742052474220636F6C6F7572207370616365202D2073524742000000
          00000000000000002E4945432036313936362D322E312044656661756C742052
          474220636F6C6F7572207370616365202D207352474200000000000000000000
          00000000000000000000000064657363000000000000002C5265666572656E63
          652056696577696E6720436F6E646974696F6E20696E2049454336313936362D
          322E3100000000000000000000002C5265666572656E63652056696577696E67
          20436F6E646974696F6E20696E2049454336313936362D322E31000000000000
          000000000000000000000000000000000000000076696577000000000013A4FE
          00145F2E0010CF140003EDCC0004130B00035C9E0000000158595A2000000000
          004C09560050000000571FE76D65617300000000000000010000000000000000
          00000000000000000000028F0000000273696720000000004352542063757276
          000000000000040000000005000A000F00140019001E00230028002D00320037
          003B00400045004A004F00540059005E00630068006D00720077007C00810086
          008B00900095009A009F00A400A900AE00B200B700BC00C100C600CB00D000D5
          00DB00E000E500EB00F000F600FB01010107010D01130119011F0125012B0132
          0138013E0145014C0152015901600167016E0175017C0183018B0192019A01A1
          01A901B101B901C101C901D101D901E101E901F201FA0203020C0214021D0226
          022F02380241024B0254025D02670271027A0284028E029802A202AC02B602C1
          02CB02D502E002EB02F50300030B03160321032D03380343034F035A03660372
          037E038A039603A203AE03BA03C703D303E003EC03F9040604130420042D043B
          0448045504630471047E048C049A04A804B604C404D304E104F004FE050D051C
          052B053A05490558056705770586059605A605B505C505D505E505F606060616
          0627063706480659066A067B068C069D06AF06C006D106E306F507070719072B
          073D074F076107740786079907AC07BF07D207E507F8080B081F08320846085A
          086E0882089608AA08BE08D208E708FB09100925093A094F09640979098F09A4
          09BA09CF09E509FB0A110A270A3D0A540A6A0A810A980AAE0AC50ADC0AF30B0B
          0B220B390B510B690B800B980BB00BC80BE10BF90C120C2A0C430C5C0C750C8E
          0CA70CC00CD90CF30D0D0D260D400D5A0D740D8E0DA90DC30DDE0DF80E130E2E
          0E490E640E7F0E9B0EB60ED20EEE0F090F250F410F5E0F7A0F960FB30FCF0FEC
          1009102610431061107E109B10B910D710F511131131114F116D118C11AA11C9
          11E81207122612451264128412A312C312E31303132313431363138313A413C5
          13E5140614271449146A148B14AD14CE14F01512153415561578159B15BD15E0
          160316261649166C168F16B216D616FA171D17411765178917AE17D217F7181B
          18401865188A18AF18D518FA19201945196B199119B719DD1A041A2A1A511A77
          1A9E1AC51AEC1B141B3B1B631B8A1BB21BDA1C021C2A1C521C7B1CA31CCC1CF5
          1D1E1D471D701D991DC31DEC1E161E401E6A1E941EBE1EE91F131F3E1F691F94
          1FBF1FEA20152041206C209820C420F0211C2148217521A121CE21FB22272255
          228222AF22DD230A23382366239423C223F0241F244D247C24AB24DA25092538
          2568259725C725F726272657268726B726E827182749277A27AB27DC280D283F
          287128A228D429062938296B299D29D02A022A352A682A9B2ACF2B022B362B69
          2B9D2BD12C052C392C6E2CA22CD72D0C2D412D762DAB2DE12E162E4C2E822EB7
          2EEE2F242F5A2F912FC72FFE3035306C30A430DB3112314A318231BA31F2322A
          3263329B32D4330D3346337F33B833F1342B3465349E34D83513354D358735C2
          35FD3637367236AE36E937243760379C37D738143850388C38C839053942397F
          39BC39F93A363A743AB23AEF3B2D3B6B3BAA3BE83C273C653CA43CE33D223D61
          3DA13DE03E203E603EA03EE03F213F613FA23FE24023406440A640E74129416A
          41AC41EE4230427242B542F7433A437D43C044034447448A44CE45124555459A
          45DE4622466746AB46F04735477B47C04805484B489148D7491D496349A949F0
          4A374A7D4AC44B0C4B534B9A4BE24C2A4C724CBA4D024D4A4D934DDC4E254E6E
          4EB74F004F494F934FDD5027507150BB51065150519B51E65231527C52C75313
          535F53AA53F65442548F54DB5528557555C2560F565C56A956F75744579257E0
          582F587D58CB591A596959B85A075A565AA65AF55B455B955BE55C355C865CD6
          5D275D785DC95E1A5E6C5EBD5F0F5F615FB36005605760AA60FC614F61A261F5
          6249629C62F06343639763EB6440649464E9653D659265E7663D669266E8673D
          679367E9683F689668EC6943699A69F16A486A9F6AF76B4F6BA76BFF6C576CAF
          6D086D606DB96E126E6B6EC46F1E6F786FD1702B708670E0713A719571F0724B
          72A67301735D73B87414747074CC7528758575E1763E769B76F8775677B37811
          786E78CC792A798979E77A467AA57B047B637BC27C217C817CE17D417DA17E01
          7E627EC27F237F847FE5804780A8810A816B81CD8230829282F4835783BA841D
          848084E3854785AB860E867286D7873B879F8804886988CE8933899989FE8A64
          8ACA8B308B968BFC8C638CCA8D318D988DFF8E668ECE8F368F9E9006906E90D6
          913F91A89211927A92E3934D93B69420948A94F4955F95C99634969F970A9775
          97E0984C98B89924999099FC9A689AD59B429BAF9C1C9C899CF79D649DD29E40
          9EAE9F1D9F8B9FFAA069A0D8A147A1B6A226A296A306A376A3E6A456A4C7A538
          A5A9A61AA68BA6FDA76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5C
          ACD0AD44ADB8AE2DAEA1AF16AF8BB000B075B0EAB160B1D6B24BB2C2B338B3AE
          B425B49CB513B58AB601B679B6F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2E
          BBA7BC21BC9BBD15BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DB
          C358C3D4C451C4CEC54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7
          CB36CBB6CC35CCB5CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1
          D344D3C6D449D4CBD54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFB
          DB80DC05DC8ADD10DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE253E2DBE363
          E3EBE473E4FCE584E60DE696E71FE7A9E832E8BCE946E9D0EA5BEAE5EB70EBFB
          EC86ED11ED9CEE28EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3A7F434F4C2
          F550F5DEF66DF6FBF78AF819F8A8F938F9C7FA57FAE7FB77FC07FC98FD29FDBA
          FE4BFEDCFF6DFFFFFFEE000E41646F626500644000000001FFDB008400020202
          0202020202020203020202030403020203040504040404040506050505050505
          060607070807070609090A0A09090C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010303
          03050405090606090D0A090A0D0F0E0E0E0E0F0F0C0C0C0C0C0F0F0C0C0C0C0C
          0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0
          0011080031005003011100021101031101FFDD0004000AFFC401A20000000701
          010101010000000000000000040503020601000708090A0B0100020203010101
          010100000000000000010002030405060708090A0B1000020103030204020607
          030402060273010203110400052112314151061361227181143291A10715B142
          23C152D1E1331662F0247282F12543345392A2B26373C235442793A3B3361754
          6474C3D2E2082683090A181984944546A4B456D355281AF2E3F3C4D4E4F46575
          8595A5B5C5D5E5F566768696A6B6C6D6E6F637475767778797A7B7C7D7E7F738
          485868788898A8B8C8D8E8F82939495969798999A9B9C9D9E9F92A3A4A5A6A7A
          8A9AAABACADAEAFA110002020102030505040506040803036D01000211030421
          12314105511361220671819132A1B1F014C1D1E1234215526272F13324344382
          16925325A263B2C20773D235E2448317549308090A18192636451A2764745537
          F2A3B3C32829D3E3F38494A4B4C4D4E4F465758595A5B5C5D5E5F54656667686
          96A6B6C6D6E6F6475767778797A7B7C7D7E7F738485868788898A8B8C8D8E8F8
          39495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C03
          010002110311003F00FBF58ABB15762AF03FCECFCEBB2FCB1B07B2B27B77F30C
          B6C6EA59EEAAD6DA7DB1251679D54867676056289482E41DC019132AD86E5D3F
          6B76AC7471FE957C00FD24F41D5F0CFE77EB9E7BD0FF002947E6779C356D4AF6
          FF00CCB7B059795B4AD42EA588299434CD37D4EDCC70A2844238D36AFED52B97
          E9F01C92A27E4F29DB7A9CFA7D178F909E291A8827975BE1E4C5748B7FCF6D13
          F24FCB3FF390FF00943F9817B3E9D15BC93F9EBC96E5E64B46B399E1B9912DE6
          69229E15E1C9871575535526872D8C21199849C43FCA03410D768F2DD0B947DD
          CEBA5797C9F73FFCE32FFCE4A699F9F1A25C59EA36B1689E7DD0A14935BD2222
          4C1710B1E2B79685896F4CB6CCA49284804905491A9D31C27C8BD27B31ED3E3E
          D8C6411C3963F547F48F2FB9F52E633D53B15762AFFFD0FBF58ABB15762AFC7A
          9F559FF3E7FE72DA1F24CB2B4FA0D8F992FB52F3045D43DBE8AE61B685BD9162
          4DBC49CC8863E08199E6797B9F318E5FE54ED8F0B9C212323FE6ED1F957CDF45
          7FCFC2BCAB71A8FE4BF97F56B1012CFCA5E61B57BDB6514516F731496AA453A0
          57641F4E5BA19564AEF765FF00041D3CA5D9E271E5090BF7115F7D3D13FE70CB
          CAAFA67FCE38796B4ED5E059ED7CC4DA85F1B494555AD6FA56F8194F50CB5AFC
          F2AD54AF2921DAFB23A538BB2B1467BF1027E127C01F93BA2EA5F947FF00395F
          71E5DD36578ECBCA3E6793449FA9F5B4AD52E12D6056F1F82E2271EEA0E5FA9C
          DC50807CD7B1F4993B3BDA23081F4C4907CE322223FDD02FDB6CC07DC5D8ABB1
          57FFD1FBF58ABB15762AFC9DF2279793F267FE73FF005BB2D76963A57E627E95
          B9F2ADF4BF0C52FE9822EA24463B544D1C9053F9A83B8CCC91E3C22BA3E6FA1C
          43B3FDA09C67B0CA0989EFE2DFEFB0FB5FFE72DADADEEFFE71C7F3663B8E348F
          46F5E1E5FEFE8668A48A9EE5D401946135314F55ED3E313ECDCC0F77E90F4CFC
          AAB2B3D37F2CBF2FECEC590D941E5DD37D07420A956B646E408DB7AD7212DC97
          69A188869F181C8447DCF883CA3E525F397FCE48F99FCD766A2683CC7E668356
          8E651509A3797B82A5C3780BABA8A354F1153DB04A572AFE68FB5E3343A1F1FB
          4F2EA3F9F215FD4875FF003A4053F47B03DEBB15762AFF00FFD2FBF58ABB1576
          2AF0EFCF2FC86F29FE79F97EDB4FD69E5D23CC1A2BB4FE56F36D98FF004AB09C
          D0EDBAF38D8A82C848E8082AC01CB716538CBA5EDBEC3C3DA988467719C778C8
          7389FD5DE1F01FE68FE4C7FCE69EAF623C99AFEBCDF983E4E8CA88F51B1BA8CF
          AC13646B8825314E5A9D6A1B7FDAEF9998B36089BADDE13B4FB17B7F3C7C09E4
          13C7DE0FDE39DFC3E2F42FC9FF00C9EFF9C96D23CBD6FE4EBED7750B3F29C519
          B7834CD5AE6382CADA06AD625485E6BB91284D2306343D2A0662E7CBC72B88AF
          BDDC763763768E0C43164C84C4743B440EEE6644796C1F73FE5DFE5C693F97BA
          7DCA5BCEFAA6B9AA98DF5DD7E645492E1A205638D235F8628620488E35D9478B
          12C71C0AD9EC749A38E9C1EB23CCFE3901D03D130B98EC55D8ABFFD3FA8BE41F
          CF4FCE1F316853DFCFFF0038F9AEF987D2D735CD3ADF5BD2F51D12C2D2E20D3F
          55BAB38244B7D47528AE14FA70A862EA3935597E12314D24BA17FCE4A6BF61A1
          7E5179BFF3474EB2F21F957CE3AA79CF4AF3B6A17904A23D26EF49BF9A0D1EDA
          49D249628DA68EDE40CE4B248EBF01155AAB4CEEC7FE7223CADE78FCCAFCBAF2
          6FE53798B4AF3D586AADAB5CFE605C69E25B93A6585A58BB5ACCD325238BD5BB
          68A31CEA5AA428D890AD3E08B1FF009CD6FCEE9ED84BAB7993CAFA0EA7EA4C97
          BA24DA56951C96B2472BA185D2EFCD16D382BC687D4891BC54629A7D9761FF00
          391ABE5C87F23354FCC5F3268B61E4EFCC5F286B1A8EBBE757845B5A9D66D25D
          3BEA96D0C905D5E5BC7EA453DC1E1EAC9CBD3AAB514E28A7A6DBFE7EFE5CF9CB
          48F3743F955E75D1FCEFE6FD0B40BFD5EC742B090DCC8ED6D11F4EB1251994CA
          51680D4D698A1867943FE72EFF0023350F28795F52F34FE6AF96B49F325EE8F6
          573E63D2CCED09B5BE92DD1EE6131BD593D390B2F163514A1DF14D21FF003E3F
          3B7CD1A0CBE55F277E50E93A9EBBE67F35DBC7ACEABE6BD33CBF75E64B6D0741
          6E7E95EC9656D241EBC977227A50C7EAAFEDC8DF0A519501866BDFF392DE78B6
          FCA6D175C9FCA53793BCFBA7F996C7CB1F9AD697D672491E86F3C227FAFC50C8
          D1F382E2368E48999A8AAFC1CFA8A466469F10C9220F73CC7B55DAD9FB374F09
          E203D53119488B1089BF5558F76FB3CC745FF9CA0FCD7934CD2AFDB5CF2FF993
          CC32EBD069CFE47B3B38C4B7B6D35C2C61AD9A1B8925E4D1B73AD28A6BCBA1CC
          A969600F220573789D3FB63AF308CB8E1399988F8600B9027F86A44F2DFCBE0F
          FFD4FBB297FAF34A233A02471900994DD2501FACFA6760A4FF0073FBDFF85EBB
          E4A877B8A32E6BAE0FB7CEBFDCFABEC509F51F32248D1AF9623BA845B3CA255B
          D8C729C4FC121E2C83ED45FBCE5D07D9EBBE343BD8CB367076C77B7F3873BAAF
          96F7F060DF99FE62FCC4D0FF002FFCEDAA792FCAA92F9974DB1B993415465BB6
          91A39D11245B75505D8C2CF284DF75E3F1572CC51819004ECEBFB6357ACC3A4C
          B3C18EF2441E1FE2EA37AEFE1B95778ADDF99B17FCE40FFCE583C5134DAAEBF1
          CCD1DC34D1FF00846DD82BA2D6050DF52DFD46D89FD9F7CD9FE5F0770F9BE431
          F69FDA2A1739DEFF00E487C3F87AFD8A89FF003903FF00395ADC7D4D5FCC31AF
          2B60CBFE11B76A2C80FD6180FA9D3F747EC8FDAF6C7F2F83B87CD23DA7F687AC
          F274FF00251F8FF0F4FB5BFF0095FF00FF0039581AEC0D6BCC21638A66B371E4
          F801964490889180B3F803A7C44EFC4EDEF8FE5F0770F9A7FD137B4167D79391
          AFDD0DCF4FE1DAC39BF3FBFE72AC7ABC759D7DCAFD5BD23FE0EB701BD403EB15
          AD9EDE91D97F9BDB1FCBE0EE1F35FF0044DED0EFEBC9D3FC90F8FF000F4FB7C9
          AFFA181FF9CB0F4626FD35E61F59A099E58BFC250516546A45186FA9EE1C6E4F
          6C7F2F83B87CD8FF00A26F68687AE7747FC90E7D07D3D5F4AFE5CFE66FE72EBB
          F901F99FE68FCCABFBEF2CEBBE5F9D64F24F98DF4D5B5B9BA9E3E0F15B1B358E
          31324971C20A04F8C395EA33172E3C71C80437079BDAF6176AF68EA3B2F365D6
          C8C2513E8970D127A0E10071032A8D57AAEB9BD45BCEFF009969E74FC8A4FD03
          F56F3079CF4995BF343F2E432BDBE9566851BF4A89E9FB978E47281189F52BE9
          EEC9CB29E08F0CB7D8723FA1DE7E77543369BD153C91FDE63E908FFAA5FF0009
          89DABF8AF8798B7FFFD5FBF58ABB15762AEC55D8ABB15762AEC558D79ABFDE0B
          0FFB6B699FF517164A1CDC5D5FD31FEB47FDD0745FF298DF7FDB1AD7FEA22E31
          FE1F8A8FF183FD51F7C9FFD9}
        Stretch = True
      end
      object LabelTitulo: TQRLabel
        Left = 97
        Top = 56
        Width = 142
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          256.645833333333400000
          148.166666666666700000
          375.708333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Stock de Semen'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 104
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          275.166666666666700000
          1899.708333333333000000)
        Shape = qrsHorLine
      end
      object QRShape8: TQRShape
        Left = 626
        Top = 86
        Width = 86
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1656.291666666667000000
          227.541666666666700000
          227.541666666666700000)
        Shape = qrsHorLine
      end
      object QRSysData11: TQRSysData
        Left = 667
        Top = 87
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1764.770833333333000000
          230.187500000000000000
          100.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        FontSize = 10
      end
      object QRLEmpresa: TQRLabel
        Left = 663
        Top = 67
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1754.187500000000000000
          177.270833333333300000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Empresa'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLNombrePropietario: TQRLabel
        Left = 603
        Top = 47
        Width = 109
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1595.437500000000000000
          124.354166666666700000
          288.395833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Caption = 'Nombre Propietario'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLEstablecimientos: TQRLabel
        Left = 500
        Top = 2
        Width = 213
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          5.291666666666667000
          563.562500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Caption = 'Nombre del establecimiento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRImagenEmpresa: TQRImage
        Left = 342
        Top = 5
        Width = 130
        Height = 90
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          238.125000000000000000
          904.875000000000000000
          13.229166666666670000
          343.958333333333400000)
        Stretch = True
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 145
      Width = 718
      Height = 201
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        531.812500000000000000
        1899.708333333333000000)
      BandType = rbTitle
      object LabelServicio: TQRLabel
        Left = 26
        Top = 116
        Width = 84
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          68.791666666666680000
          306.916666666666700000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Servicio:  '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object LabelNombre: TQRLabel
        Left = 114
        Top = 115
        Width = 176
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          301.625000000000000000
          304.270833333333400000
          465.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre del servicio'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'LabelEstado'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object LabelEstado: TQRLabel
        Left = 106
        Top = 139
        Width = 55
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          280.458333333333400000
          367.770833333333400000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Activo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'LabelEstado'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRLabelEstado: TQRLabel
        Left = 34
        Top = 140
        Width = 71
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          89.958333333333340000
          370.416666666666700000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Estado: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRLabelTipo: TQRLabel
        Left = 56
        Top = 164
        Width = 49
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          148.166666666666700000
          433.916666666666700000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tipo: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object LabelTipo: TQRLabel
        Left = 104
        Top = 163
        Width = 64
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          275.166666666666700000
          431.270833333333400000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Natural'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'LabelEstado'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRShape3: TQRShape
        Left = -9
        Top = 104
        Width = 719
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          -23.812500000000000000
          275.166666666666700000
          1902.354166666667000000)
        Shape = qrsHorLine
      end
      object QRLabelTituloEstadoActual: TQRLabel
        Left = 10
        Top = 80
        Width = 157
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          26.458333333333330000
          211.666666666666700000
          415.395833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos del servicio'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'LabelEstado'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRLFechaIns: TQRLabel
        Left = 415
        Top = 148
        Width = 181
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          1098.020833333333000000
          391.583333333333400000
          478.895833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha Inseminacion: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRLFecha: TQRLabel
        Left = 608
        Top = 147
        Width = 56
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1608.666666666667000000
          388.937500000000000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'LabelEstado'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRShape7: TQRShape
        Left = -9
        Top = 72
        Width = 719
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          -23.812500000000000000
          190.500000000000000000
          1902.354166666667000000)
        Shape = qrsHorLine
      end
      object QRLD: TQRLabel
        Left = 32
        Top = 46
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          121.708333333333300000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Desde: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLDesde: TQRLabel
        Left = 88
        Top = 46
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          232.833333333333400000
          121.708333333333300000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLDesde'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLH: TQRLabel
        Left = 184
        Top = 46
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          121.708333333333300000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Hasta: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLHasta: TQRLabel
        Left = 240
        Top = 46
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          635.000000000000000000
          121.708333333333300000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLHasta'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLPeriodo: TQRLabel
        Left = 24
        Top = 14
        Width = 165
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          63.500000000000000000
          37.041666666666670000
          436.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Periodo Seleccionado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLG: TQRLabel
        Left = 24
        Top = 30
        Width = 57
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          63.500000000000000000
          79.375000000000000000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Grupo: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLGrupo: TQRLabel
        Left = 89
        Top = 31
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          235.479166666666700000
          82.020833333333340000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLGrupo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBEncabezado: TQRBand
      Left = 38
      Top = 346
      Width = 718
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        103.187500000000000000
        1899.708333333333000000)
      BandType = rbColumnHeader
      object LabelRP1: TQRLabel
        Left = 24
        Top = 20
        Width = 19
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          52.916666666666670000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelRaza: TQRLabel
        Left = 176
        Top = 20
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          52.916666666666670000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Raza'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelAnimalesVinculados: TQRLabel
        Left = 208
        Top = 1
        Width = 273
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          550.333333333333400000
          2.645833333333333000
          722.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Animales vinculados con el servicio'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object LabelSexo: TQRLabel
        Left = 243
        Top = 20
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          642.937500000000000000
          52.916666666666670000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sexo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelEntrada: TQRLabel
        Left = 300
        Top = 20
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          793.750000000000000000
          52.916666666666670000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cond. Corp.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelSalida: TQRLabel
        Left = 420
        Top = 20
        Width = 26
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1111.250000000000000000
          52.916666666666670000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Toro'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelCondCorporalEntrada: TQRLabel
        Left = 571
        Top = 19
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1510.770833333333000000
          50.270833333333330000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dosis'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelCondCorporalSalida: TQRLabel
        Left = 631
        Top = 19
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1669.520833333333000000
          50.270833333333330000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Responsable'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelNombre1: TQRLabel
        Left = 96
        Top = 20
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          52.916666666666670000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBAnimales: TQRBand
      Left = 38
      Top = 385
      Width = 718
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 2
        Top = 1
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          2.645833333333333000
          169.333333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQconsultaAnimal
        DataField = 'ID_RP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText1Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 172
        Top = 1
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          455.083333333333300000
          2.645833333333333000
          105.833333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQconsultaAnimal
        DataField = 'NOMBRE_RAZA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 228
        Top = 0
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          603.250000000000000000
          0.000000000000000000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQconsultaAnimal
        DataField = 'NOMBRE1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLEntrada: TQRLabel
        Left = 318
        Top = 0
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          841.375000000000000000
          0.000000000000000000
          156.104166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLEntrada'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRLEntradaPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLSalida: TQRLabel
        Left = 405
        Top = 0
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1071.562500000000000000
          0.000000000000000000
          134.937500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLSalida'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRLSalidaPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLCondCorpSalida: TQRLabel
        Left = 608
        Top = 0
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          0.000000000000000000
          169.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLCondCorpSalida'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLCondCorpEntrada: TQRLabel
        Left = 497
        Top = 0
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1314.979166666667000000
          0.000000000000000000
          169.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLCondCorpSalida'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 72
        Top = 1
        Width = 93
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          2.645833333333333000
          246.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = IBQconsultaAnimal
        DataField = 'NOMBRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBTDosis: TQRDBText
        Left = 578
        Top = 0
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1529.291666666667000000
          0.000000000000000000
          84.666666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatosInseminacion
        DataField = 'DOSIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBTCondCorp: TQRDBText
        Left = 328
        Top = 0
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          867.833333333333500000
          0.000000000000000000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBTResponsable: TQRDBText
        Left = 632
        Top = 0
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          0.000000000000000000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatosInseminacion
        DataField = 'RESPONSABLE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBTToro: TQRDBText
        Left = 384
        Top = 0
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          0.000000000000000000
          277.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = IBQToros
        DataField = 'NOMBRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand4: TQRBand
      Left = 38
      Top = 402
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1899.708333333333000000)
      BandType = rbSummary
      object LabelCantidadAnimales: TQRLabel
        Left = 8
        Top = 8
        Width = 134
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de animales: '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 144
        Top = 8
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          381.000000000000000000
          21.166666666666670000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Master = QRServicioAnimales
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'COUNT'
        FontSize = 10
      end
    end
    object QRBand11: TQRBand
      Left = 38
      Top = 442
      Width = 718
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        92.604166666666680000
        1899.708333333333000000)
      BandType = rbPageFooter
      object QRShape5: TQRShape
        Left = 0
        Top = 0
        Width = 718
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          0.000000000000000000
          1899.708333333333000000)
        Shape = qrsHorLine
      end
      object QRLabel9: TQRLabel
        Left = 8
        Top = 2
        Width = 195
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          5.291666666666667000
          515.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Huella - Todos los derechos reservados'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 664
        Top = 2
        Width = 39
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1756.833333333333000000
          5.291666666666667000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 632
        Top = 2
        Width = 22
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1672.166666666667000000
          5.291666666666667000
          58.208333333333340000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pag.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLDatosAbajo: TQRLabel
        Left = 362
        Top = 2
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          957.791666666666800000
          5.291666666666667000
          153.458333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos abajo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLDatosAbajo2: TQRLabel
        Left = 362
        Top = 16
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          957.791666666666800000
          42.333333333333340000
          153.458333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos abajo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 855
    inherited LTitulo: TLabel
      Width = 451
    end
    inherited PILeft: TPanel
      Left = 647
    end
  end
  inherited Psocalo: TPanel
    Top = 658
    Width = 855
    inherited JvSocalo: TJvImage
      Width = 855
    end
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 332
    Top = 87
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
  object QRHTMLFilter1: TQRHTMLFilter
    Left = 504
    Top = 160
  end
  object QRCRServicios: TQRCompositeReport
    OnAddReports = QRCRServiciosAddReports
    Options = []
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Orientation = poPortrait
    PrinterSettings.PaperSize = Letter
    Left = 20
    Top = 280
  end
  object IBQAux: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 45
    Top = 64
  end
  object IBQAuxCondicion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from  COD_TIPOS_SERVICIO'
      ''
      '')
    Left = 48
    Top = 32
  end
  object IBQDatosInseminacion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select eia.dosis, (select te.nombre||'#39' '#39'||te.apellido from tab_e' +
        'mpleados te where te.id_empleado=ee.responsable and te.estableci' +
        'miento = ee.establecimiento) as responsable, ts.fecha_inicio as ' +
        'fecha, ta.condicion_corporal from tab_servicios ts, eve_insemina' +
        'cion_artificial eia, tab_animales ta, eve_eventos ee where ts.id' +
        '_servicio=:id and eia.servicio=ts.id_servicio and ee.id_evento=e' +
        'ia.id_evento and ee.animal=ta.id_animal and ta.establecimiento=:' +
        'esta and ta.id_animal=:animal')
    Left = 120
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'esta'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
    object IBQDatosInseminacionDOSIS: TIntegerField
      FieldName = 'DOSIS'
      Origin = 'EVE_INSEMINACION_ARTIFICIAL.DOSIS'
      Required = True
    end
    object IBQDatosInseminacionRESPONSABLE: TIBStringField
      FieldName = 'RESPONSABLE'
      Size = 81
    end
    object IBQDatosInseminacionCONDICION_CORPORAL: TIntegerField
      FieldName = 'CONDICION_CORPORAL'
      Origin = 'TAB_ANIMALES.CONDICION_CORPORAL'
    end
    object IBQDatosInseminacionFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'TAB_SERVICIOS.FECHA_INICIO'
      Required = True
    end
  end
  object IBQToros: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    OnCalcFields = IBQTorosCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ta.nombre as n, ta.apodo as a, ta.id_rp as r from tab_ani' +
        'males ta, tab_semen ts, eve_inseminacion_artificial eia, eve_eve' +
        'ntos ee where ta.id_animal=ts.animal and ts.id_semen=eia.semen a' +
        'nd eia.servicio=:id and '
      'eia.id_evento=ee.id_evento and ee.animal=:animal'
      'union '
      
        'select tae.nombre as n, tae.apodo as a, tae.id_rp as r from tab_' +
        'animales_externos tae, tab_semen ts, eve_inseminacion_artificial' +
        ' eia, eve_eventos ee  where tae.id_animal_externo=ts.animal_exte' +
        'rno and ts.id_semen=eia.semen and eia.servicio=:id and eia.id_ev' +
        'ento=ee.id_evento and ee.animal=:animal')
    Left = 152
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
    object IBQTorosN: TIBStringField
      FieldName = 'N'
      Size = 100
    end
    object IBQTorosA: TIBStringField
      FieldName = 'A'
      Size = 100
    end
    object IBQTorosR: TIBStringField
      FieldName = 'R'
      Required = True
      Size = 10
    end
    object IBQTorosNOMBRE: TIBStringField
      FieldKind = fkCalculated
      FieldName = 'NOMBRE'
      Size = 100
      Calculated = True
    end
  end
  object IBQAuxCond: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 88
    Top = 32
  end
  object IBQconsultaAnimal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ta.*, cs.nombre, cr.codigo as nombre_raza from tab_animal' +
        'es ta, cod_sexos cs, cod_razas cr '
      
        'where (ta.sexo = cs.id_sexo) and (ta.raza = cr.id_raza) and (ta.' +
        'establecimiento = :esta) and (id_animal in (SELECT animal FROM R' +
        'EL_PERTENECE_GRUPO WHERE GRUPO = (SELECT GRUPO FROM TAB_SERVICIO' +
        'S WHERE ID_SERVICIO = :n))) order by ta.sexo')
    Left = 512
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'esta'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'n'
        ParamType = ptInput
        Value = '1'
      end>
  end
  object IBQBaja: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select '#39'Baja: '#39'||ctb.nombre as nombre from eve_eventos ee join e' +
        've_baja eb on ee.id_evento = eb.id_evento join cod_tipos_baja ct' +
        'b on eb.tipo = ctb.id_tipo_baja where ee.animal = :animal and ee' +
        '.establecimiento = :esta ')
    Left = 452
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
end
