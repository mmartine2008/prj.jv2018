inherited FREPStockSimple: TFREPStockSimple
  Left = 231
  Top = 98
  BorderStyle = bsDialog
  Caption = 'FREPStockSimple'
  ClientHeight = 539
  ClientWidth = 780
  OldCreateOrder = True
  PopupMenu = PopupMenu1
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 14
  inherited Image10: TImage [0]
    Left = 936
    Top = 112
  end
  inherited ITope: TImage [1]
    Width = 780
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
    Width = 386
  end
  object QR: TQuickRep [4]
    Left = 116
    Top = 80
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
    object QRBand1: TQRBand
      Left = 38
      Top = 145
      Width = 718
      Height = 365
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
        965.729166666666800000
        1899.708333333333000000)
      BandType = rbTitle
      object LabelCantidadMachos: TQRLabel
        Left = 11
        Top = 218
        Width = 128
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          29.104166666666670000
          576.791666666666800000
          338.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de machos: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLCantidadMachosTotal: TQRLabel
        Left = 146
        Top = 218
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          386.291666666666700000
          576.791666666666800000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object QRShape2: TQRShape
        Left = -1
        Top = -2
        Width = 719
        Height = 6
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          15.875000000000000000
          -2.645833333333333000
          -5.291666666666667000
          1902.354166666667000000)
        Shape = qrsHorLine
      end
      object LabelCantidadHembras: TQRLabel
        Left = 7
        Top = 244
        Width = 132
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          18.520833333333330000
          645.583333333333200000
          349.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de hembras: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelCantidadVacias: TQRLabel
        Left = 237
        Top = 36
        Width = 118
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          627.062500000000000000
          95.250000000000000000
          312.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de vacias: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLCantidadHembrasTotal: TQRLabel
        Left = 146
        Top = 244
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          386.291666666666700000
          645.583333333333200000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelCantidadPreniadas: TQRLabel
        Left = 220
        Top = 58
        Width = 135
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          582.083333333333200000
          153.458333333333300000
          357.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de pre'#241'adas: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelCantidadDudosas: TQRLabel
        Left = 203
        Top = 80
        Width = 151
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          537.104166666666700000
          211.666666666666700000
          399.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de no definidas: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape4: TQRShape
        Left = -1
        Top = 29
        Width = 719
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          -2.645833333333333000
          76.729166666666680000
          1902.354166666667000000)
        Shape = qrsHorLine
      end
      object LabelPorSexo: TQRLabel
        Left = 53
        Top = 172
        Width = 78
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          140.229166666666700000
          455.083333333333300000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Por sexo'
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
      object LabelPorEstadoRepro: TQRLabel
        Left = 202
        Top = 4
        Width = 226
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          534.458333333333300000
          10.583333333333330000
          597.958333333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Hembras por Est. Reprod.'
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
      object QRLCantidadTotalVacias: TQRLabel
        Left = 363
        Top = 36
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          960.437500000000000000
          95.250000000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object QRLCantidadTotalPreniadas: TQRLabel
        Left = 363
        Top = 58
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          960.437500000000000000
          153.458333333333300000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object QRLCantidadTotalNoDefinidas: TQRLabel
        Left = 363
        Top = 80
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          960.437500000000000000
          211.666666666666700000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelPorEstadoLactacion: TQRLabel
        Left = 482
        Top = 4
        Width = 197
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1275.291666666667000000
          10.583333333333330000
          521.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Por cantidad de partos'
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
      object LabelLacta0: TQRLabel
        Left = 513
        Top = 42
        Width = 138
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1357.312500000000000000
          111.125000000000000000
          365.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad con 0 Partos: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelLacta1: TQRLabel
        Left = 513
        Top = 66
        Width = 138
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1357.312500000000000000
          174.625000000000000000
          365.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad con 1 Partos: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelLacta2: TQRLabel
        Left = 513
        Top = 91
        Width = 138
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1357.312500000000000000
          240.770833333333300000
          365.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad con 2 Partos: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelLacta3: TQRLabel
        Left = 513
        Top = 116
        Width = 138
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1357.312500000000000000
          306.916666666666700000
          365.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad con 3 Partos: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelLactaMayor: TQRLabel
        Left = 466
        Top = 141
        Width = 185
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1232.958333333333000000
          373.062500000000000000
          489.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad con m'#225's de 3 Partos: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelLacta0Total: TQRLabel
        Left = 660
        Top = 42
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          111.125000000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelLacta1Total: TQRLabel
        Left = 660
        Top = 66
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          174.625000000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelLacta2Total: TQRLabel
        Left = 660
        Top = 91
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          240.770833333333300000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelLacta3Total: TQRLabel
        Left = 660
        Top = 114
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          301.625000000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelLactaMayorTotal: TQRLabel
        Left = 660
        Top = 140
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          370.416666666666700000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object QRShape5: TQRShape
        Left = 0
        Top = 197
        Width = 719
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          0.000000000000000000
          521.229166666666800000
          1902.354166666667000000)
        Shape = qrsHorLine
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 166
        Width = 718
        Height = 6
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          15.875000000000000000
          0.000000000000000000
          439.208333333333400000
          1899.708333333333000000)
        Shape = qrsHorLine
      end
      object QRLabel1: TQRLabel
        Left = 247
        Top = 172
        Width = 117
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          653.520833333333200000
          455.083333333333300000
          309.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Por categor'#237'a'
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
      object QRLabel2: TQRLabel
        Left = 504
        Top = 172
        Width = 155
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1333.500000000000000000
          455.083333333333300000
          410.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Por edad de toros'
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
      object LabelCateTernero: TQRLabel
        Left = 226
        Top = 210
        Width = 129
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          597.958333333333200000
          555.625000000000000000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de terneros: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelCateNovillo: TQRLabel
        Left = 231
        Top = 234
        Width = 124
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          611.187500000000000000
          619.125000000000000000
          328.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de novillos: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelCateToro: TQRLabel
        Left = 243
        Top = 259
        Width = 111
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          642.937500000000000000
          685.270833333333200000
          293.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de toros: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelCateTernera: TQRLabel
        Left = 225
        Top = 283
        Width = 129
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          595.312500000000000000
          748.770833333333200000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de terneras: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelCateVaquillona: TQRLabel
        Left = 209
        Top = 308
        Width = 145
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          552.979166666666700000
          814.916666666666800000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de vaquillonas: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelCateVaca: TQRLabel
        Left = 239
        Top = 333
        Width = 115
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          632.354166666666800000
          881.062500000000000000
          304.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de vacas: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelCateTerneroTotal: TQRLabel
        Left = 364
        Top = 210
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          963.083333333333200000
          555.625000000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelCateNovilloTotal: TQRLabel
        Left = 364
        Top = 234
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          963.083333333333200000
          619.125000000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelCateToroTotal: TQRLabel
        Left = 364
        Top = 259
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          963.083333333333200000
          685.270833333333200000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelCateTerneraTotal: TQRLabel
        Left = 364
        Top = 283
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          963.083333333333200000
          748.770833333333200000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelCateVaquillonaTotal: TQRLabel
        Left = 364
        Top = 308
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          963.083333333333200000
          814.916666666666800000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelCateVacaTotal: TQRLabel
        Left = 364
        Top = 333
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          963.083333333333200000
          881.062500000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelEdadToros0: TQRLabel
        Left = 477
        Top = 210
        Width = 172
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1262.062500000000000000
          555.625000000000000000
          455.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de toros de 0 a'#241'os: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelEdadToros0Total: TQRLabel
        Left = 660
        Top = 210
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          555.625000000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelEdadToros1: TQRLabel
        Left = 484
        Top = 234
        Width = 165
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1280.583333333333000000
          619.125000000000000000
          436.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de toros de 1 a'#241'o: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelEdadToros1Total: TQRLabel
        Left = 660
        Top = 234
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          619.125000000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelEdadToros2: TQRLabel
        Left = 477
        Top = 259
        Width = 172
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1262.062500000000000000
          685.270833333333200000
          455.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de toros de 2 a'#241'os: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelEdadToros2Total: TQRLabel
        Left = 660
        Top = 259
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          685.270833333333200000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelEdadToros3: TQRLabel
        Left = 477
        Top = 283
        Width = 172
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1262.062500000000000000
          748.770833333333200000
          455.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de toros de 3 a'#241'os: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelEdadToros3Total: TQRLabel
        Left = 660
        Top = 283
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1746.250000000000000000
          748.770833333333200000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelEdadToros4: TQRLabel
        Left = 477
        Top = 305
        Width = 172
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1262.062500000000000000
          806.979166666666800000
          455.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de toros de 4 a'#241'os: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelEdadToros4Total: TQRLabel
        Left = 661
        Top = 305
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1748.895833333333000000
          806.979166666666800000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object LabelEdadToros5: TQRLabel
        Left = 464
        Top = 325
        Width = 177
        Height = 36
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          95.250000000000000000
          1227.666666666667000000
          859.895833333333400000
          468.312500000000100000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Cantidad de toros con m'#225's de 4 a'#241'os: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object LabelEdadToros5Total: TQRLabel
        Left = 661
        Top = 341
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1748.895833333333000000
          902.229166666666800000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object QRShape7: TQRShape
        Left = 186
        Top = 1
        Width = 1
        Height = 168
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          444.500000000000000000
          492.124999999999900000
          2.645833333333333000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRShape8: TQRShape
        Left = 432
        Top = 1
        Width = 1
        Height = 168
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          444.500000000000000000
          1143.000000000000000000
          2.645833333333333000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRShape9: TQRShape
        Left = 432
        Top = 169
        Width = 1
        Height = 194
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          513.291666666666800000
          1143.000000000000000000
          447.145833333333400000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRShape1: TQRShape
        Left = -1
        Top = 363
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
          960.437499999999900000
          1902.354166666667000000)
        Shape = qrsHorLine
      end
      object QRLabel4: TQRLabel
        Left = 229
        Top = 102
        Width = 125
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          605.895833333333200000
          269.875000000000000000
          330.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad en servicio: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 230
        Top = 124
        Width = 124
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          608.541666666666800000
          328.083333333333300000
          328.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de paridas: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 225
        Top = 147
        Width = 129
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          595.312500000000000000
          388.937500000000000000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de servidas: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLCantidadTotalEnServicio: TQRLabel
        Left = 363
        Top = 102
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          960.437500000000000000
          269.875000000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object QRLCantidadTotalParidas: TQRLabel
        Left = 363
        Top = 124
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          960.437500000000000000
          328.083333333333300000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object QRLCantidadTotalServidas: TQRLabel
        Left = 363
        Top = 147
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          960.437500000000000000
          388.937500000000000000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
      object QRShape10: TQRShape
        Left = 186
        Top = 169
        Width = 1
        Height = 194
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          513.291666666666800000
          492.124999999999900000
          447.145833333333400000
          2.645833333333333000)
        Shape = qrsVertLine
      end
      object QRLabel7: TQRLabel
        Left = 37
        Top = 4
        Width = 120
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          97.895833333333320000
          10.583333333333330000
          317.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total General'
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
      object QRLabelTotalGeneral: TQRLabel
        Left = 31
        Top = 82
        Width = 82
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          82.020833333333320000
          216.958333333333300000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total General:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLTotalGeneral: TQRLabel
        Left = 117
        Top = 82
        Width = 29
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          309.562500000000000000
          216.958333333333300000
          76.729166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1000'
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
    end
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
      object LabelTitulo1: TQRLabel
        Left = 97
        Top = 58
        Width = 113
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          256.645833333333300000
          153.458333333333300000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Stock Simple'
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
      object QRShape3: TQRShape
        Left = 624
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
          1651.000000000000000000
          227.541666666666700000
          227.541666666666700000)
        Shape = qrsHorLine
      end
      object QRSysData1: TQRSysData
        Left = 665
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
          1759.479166666667000000
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
        Left = 661
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
          1748.895833333333000000
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
          288.395833333333300000)
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
      object QRLRenglon1: TQRLabel
        Left = 561
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
          1484.312500000000000000
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
        Left = 561
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
          1484.312500000000000000
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
      object QRLEstablecimientos: TQRLabel
        Left = 498
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
          1317.625000000000000000
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
        Left = 280
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
          740.833333333333400000
          13.229166666666670000
          343.958333333333400000)
        Stretch = True
      end
    end
    object QRBand5: TQRBand
      Left = 38
      Top = 510
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
      object QRLabel3: TQRLabel
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
        Left = 674
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
          1783.291666666667000000
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
        Left = 642
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
          1698.625000000000000000
          5.291666666666667000
          58.208333333333320000)
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
      object QRShape22: TQRShape
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
      object QRLDatosAbajo: TQRLabel
        Left = 370
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
          978.958333333333200000
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
        Left = 370
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
          978.958333333333200000
          42.333333333333330000
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
  object Panel1: TPanel [5]
    Left = -8
    Top = 69
    Width = 981
    Height = 161
    Align = alCustom
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 4
    object GBEstadoRepro: TGroupBox
      Left = 230
      Top = 0
      Width = 273
      Height = 161
      Align = alCustom
      Caption = ' Stock de Hembras por estado reproductivo '
      TabOrder = 0
      object LabelEstadoReproVacia: TLabel
        Left = 88
        Top = 19
        Width = 117
        Height = 16
        Caption = 'Cantidad de vac'#237'as: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEstadoReproPreniada: TLabel
        Left = 71
        Top = 42
        Width = 134
        Height = 16
        Caption = 'Cantidad de pre'#241'adas: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEstadoReproVaciaTotal: TLabel
        Left = 208
        Top = 19
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelEstadoReproPreniadaTotal: TLabel
        Left = 208
        Top = 40
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 55
        Top = 65
        Width = 150
        Height = 16
        Caption = 'Cantidad de no definidas: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEstadoReproNoDefinidaTotal: TLabel
        Left = 208
        Top = 63
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 81
        Top = 88
        Width = 124
        Height = 16
        Caption = 'Cantidad en servicio: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEstadoReproEnServicioTotal: TLabel
        Left = 208
        Top = 86
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 82
        Top = 111
        Width = 123
        Height = 16
        Caption = 'Cantidad de paridas: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEstadoReproParidasTotal: TLabel
        Left = 208
        Top = 109
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 80
        Top = 136
        Width = 128
        Height = 16
        Caption = 'Cantidad de servidas: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEstadoReproServidasTotal: TLabel
        Left = 208
        Top = 136
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
    end
    object GBEstadoLactacion: TGroupBox
      Left = 503
      Top = 0
      Width = 281
      Height = 161
      Align = alCustom
      Caption = ' Stock por cantidad de partos'
      TabOrder = 1
      object LabelLactacion0: TLabel
        Left = 73
        Top = 19
        Width = 135
        Height = 16
        Caption = 'Cantidad con 0 partos: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelLactacion1: TLabel
        Left = 79
        Top = 46
        Width = 128
        Height = 16
        Caption = 'Cantidad con 1 parto: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelLactacion2: TLabel
        Left = 73
        Top = 74
        Width = 135
        Height = 16
        Caption = 'Cantidad con 2 partos: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelLactacion0Total: TLabel
        Left = 226
        Top = 19
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelLactacion1Total: TLabel
        Left = 226
        Top = 46
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelLactacion2Total: TLabel
        Left = 226
        Top = 74
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelLactacion3: TLabel
        Left = 73
        Top = 101
        Width = 135
        Height = 16
        Caption = 'Cantidad con 3 partos: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelLactacion3Total: TLabel
        Left = 226
        Top = 101
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelLactacionMayor: TLabel
        Left = 26
        Top = 129
        Width = 182
        Height = 16
        Caption = 'Cantidad con m'#225's de 3 partos: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelLactacionMayorTotal: TLabel
        Left = 226
        Top = 129
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
    end
    object GPTotalGeneral: TGroupBox
      Left = 0
      Top = 0
      Width = 230
      Height = 161
      Align = alLeft
      Caption = 'Total General'
      TabOrder = 2
      object LabelTotalGeneral: TLabel
        Left = 52
        Top = 67
        Width = 85
        Height = 16
        Caption = 'Total General: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LTotalGeneral: TLabel
        Left = 138
        Top = 65
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
    end
  end
  object Panel2: TPanel [6]
    Left = -8
    Top = 228
    Width = 981
    Height = 276
    Align = alCustom
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 2
    object GBCategoria: TGroupBox
      Left = 230
      Top = 0
      Width = 273
      Height = 195
      Align = alCustom
      Caption = ' Stock por categor'#237'a '
      TabOrder = 0
      object LabelCategoriaTernero: TLabel
        Left = 48
        Top = 18
        Width = 128
        Height = 16
        Caption = 'Cantidad de terneros: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelCategoriaNovillo: TLabel
        Left = 53
        Top = 44
        Width = 123
        Height = 16
        Caption = 'Cantidad de novillos: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelCategoriaToro: TLabel
        Left = 66
        Top = 71
        Width = 110
        Height = 16
        Caption = 'Cantidad de toros: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelCategoriaTernera: TLabel
        Left = 48
        Top = 98
        Width = 128
        Height = 16
        Caption = 'Cantidad de terneras: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelCategoriaVaquillona: TLabel
        Left = 32
        Top = 125
        Width = 144
        Height = 16
        Caption = 'Cantidad de vaquillonas: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelCategoriaVaca: TLabel
        Left = 62
        Top = 152
        Width = 114
        Height = 16
        Caption = 'Cantidad de vacas: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelCategoriaTerneroTotal: TLabel
        Left = 184
        Top = 18
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelCategoriaNovilloTotal: TLabel
        Left = 184
        Top = 44
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelCategoriaToroTotal: TLabel
        Left = 184
        Top = 71
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelCategoriaTerneraTotal: TLabel
        Left = 184
        Top = 98
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelCategoriaVaquillonaTotal: TLabel
        Left = 184
        Top = 125
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelCategoriaVacaTotal: TLabel
        Left = 184
        Top = 152
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
    end
    object GBEdadToros: TGroupBox
      Left = 503
      Top = 0
      Width = 281
      Height = 195
      Align = alCustom
      Caption = ' Stock por edad de toros '
      TabOrder = 1
      object LabelEdad0: TLabel
        Left = 23
        Top = 22
        Width = 171
        Height = 16
        Caption = 'Cantidad de toros de 0 a'#241'os: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEdad1: TLabel
        Left = 30
        Top = 47
        Width = 164
        Height = 16
        Caption = 'Cantidad de toros de 1 a'#241'o: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEdad2: TLabel
        Left = 24
        Top = 74
        Width = 171
        Height = 16
        Caption = 'Cantidad de toros de 2 a'#241'os: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEdad3: TLabel
        Left = 24
        Top = 100
        Width = 171
        Height = 16
        Caption = 'Cantidad de toros de 3 a'#241'os: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEdad4: TLabel
        Left = 25
        Top = 125
        Width = 171
        Height = 16
        Caption = 'Cantidad de toros de 4 a'#241'os: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEdad5: TLabel
        Left = 7
        Top = 148
        Width = 225
        Height = 16
        Caption = 'Cantidad de toros con m'#225's de 4 a'#241'os: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelEdad0Total: TLabel
        Left = 201
        Top = 18
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelEdad1Total: TLabel
        Left = 202
        Top = 44
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelEdad2Total: TLabel
        Left = 202
        Top = 71
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelEdad3Total: TLabel
        Left = 202
        Top = 98
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelEdad4Total: TLabel
        Left = 202
        Top = 125
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelEdad5Total: TLabel
        Left = 236
        Top = 146
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
    end
    object GBSexo: TGroupBox
      Left = 0
      Top = 0
      Width = 230
      Height = 195
      Caption = ' Stock por sexo '
      TabOrder = 2
      object LabelSexoMacho: TLabel
        Left = 32
        Top = 59
        Width = 127
        Height = 16
        Caption = 'Cantidad de machos: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelSexoHembra: TLabel
        Left = 28
        Top = 94
        Width = 131
        Height = 16
        Caption = 'Cantidad de hembras: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object LabelSexoMachoTotal: TLabel
        Left = 160
        Top = 59
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object LabelSexoHembraTotal: TLabel
        Left = 160
        Top = 94
        Width = 9
        Height = 18
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
    end
  end
  object PBotones: TPanel [7]
    Left = 0
    Top = 402
    Width = 780
    Height = 96
    Align = alBottom
    Color = clWhite
    TabOrder = 5
    DesignSize = (
      780
      96)
    object IFondoBar: TImage
      Left = 1
      Top = 1
      Width = 778
      Height = 94
      Align = alClient
      Picture.Data = {
        0A544A504547496D616765C31A0000FFD8FFE1001845786966000049492A0008
        0000000000000000000000FFEC00114475636B7900010004000000500000FFE1
        0329687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
        3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
        656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
        786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
        3D2241646F626520584D5020436F726520352E302D633036302036312E313334
        3737372C20323031302F30322F31322D31373A33323A30302020202020202020
        223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
        772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
        7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
        222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F
        6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D22687474703A2F2F
        6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A
        73745265663D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F31
        2E302F73547970652F5265736F75726365526566232220786D703A4372656174
        6F72546F6F6C3D2241646F62652050686F746F73686F70204353352057696E64
        6F77732220786D704D4D3A496E7374616E636549443D22786D702E6969643A30
        4234444534463143363831313144463942363739423039313935343945373522
        20786D704D4D3A446F63756D656E7449443D22786D702E6469643A3042344445
        344632433638313131444639423637394230393139353439453735223E203C78
        6D704D4D3A4465726976656446726F6D2073745265663A696E7374616E636549
        443D22786D702E6969643A304234444534454643363831313144463942363739
        4230393139353439453735222073745265663A646F63756D656E7449443D2278
        6D702E6469643A30423444453446304336383131314446394236373942303931
        39353439453735222F3E203C2F7264663A4465736372697074696F6E3E203C2F
        7264663A5244463E203C2F783A786D706D6574613E203C3F787061636B657420
        656E643D2272223F3EFFEE000E41646F62650064C000000001FFDB0084000202
        0202020202020202030202020304030202030405040404040405060505050505
        05060607070807070609090A0A09090C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0103
        0303050405090606090D0B090B0D0F0E0E0E0E0F0F0C0C0C0C0C0F0F0C0C0C0C
        0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFF
        C0001108005503B703011100021101031101FFC4007200010101010101000000
        0000000000000000040503060901010100000000000000000000000000000001
        1000010203060700010301090100000000000113516103910204940515D214D4
        5516560711213144B3418112B273A3A4B4062211010100000000000000000000
        000000000011FFDA000C03010002110311003F00FB19A4FF00E3FF00F075B4AD
        32AD7FFC969156BD5C251BF5AADFC2515BD7AFDEA68B7AF2AADDFD5554A8D0F0
        BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE
        9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F9
        3A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F08
        0F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE
        7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA76
        8F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8
        F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C
        2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EF
        A768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E
        4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C2
        03C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF
        9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9D
        A3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A
        3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F
        0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7B
        E9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F
        93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F0
        80F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2F
        E7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA7
        68F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E
        8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203
        C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9E
        FA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3
        E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C
        203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0B
        F9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9
        DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93
        A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080
        F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7
        BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768
        F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F
        080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2
        FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA
        768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4
        E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C20
        3C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F081E774B
        D42A5DD334EBA9F9FC5DC2D144FEEB885176E35660371AB301B8D5980DC6ACC0
        6E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E3566
        0371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB
        301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D
        5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC
        6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06
        E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660
        371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB3
        01B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5
        980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6
        ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E
        35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E356603
        71AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB30
        1B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E3566072AFA8565A379
        6EDEBD7552FD15FCA7E8BF87AE22A7F7A7E841069949174DD3D6386A5FE4428B
        9A400D200690034801A400D200690034801A400D200690034801A400D2006900
        34801A400D200690034801A400D200690034801A400D200690034801A400D200
        690034801A400D200690034801A400D200690034801A400D200690034801A400
        D200690034801A400D200690034801A400D200690034801A400D200690034801
        A400D200690034801A400D200690034801A400D200690034801A400D20069003
        4801A400D200690034801A400D200690034801A400D200690034801A400D2006
        90034801A400D200690034801A400D200690034801A400D200690034801A400D
        200690034801A400D200690034801A400D200690034801A4038E2292250BFF00
        EA504FF7E981569549574BD356385A3FE4420D0694034A01A500D280694034A0
        1A500D280694034A01A500D280694034A01A500D280694034A01A500D2806940
        34A01A500D280694034A01A500D280694034A01A500D280694034A01A500D280
        694034A01A500D280694034A01A500D280694034A01A500D280694034A01A500
        D280694034A01A500D280694034A01A500D280694034A01A500D280694034A01
        A500D280694034A01A500D280694034A01A500D280694034A01A500D28069403
        4A01A500D280694034A01A500D280694034A01A500D280694034A01A500D2806
        94034A01A500D280694034A01A500D280694034A01A500D280694034A01A500D
        280694034A01A500D28069409B174D530EBFEB6193FE45302AD22922E93A5AFE
        3F8943FA7740D1692001A4800692001A4800692001A4800692001A4800692001
        A4800692001A4800692001A4800692001A4800692001A4800692001A48006920
        01A4800692001A4800692001A4800692001A4800692001A4800692001A480069
        2001A4800692001A4800692001A4800692001A4800692001A4800692001A4800
        692001A4800692001A4800692001A4800692001A4800692001A4800692001A48
        00692001A4800692001A4800692001A4800692001A4800692001A4800692001A
        4800692001A4800692001A4800692001A4800692001A4800692001A480069200
        1A4800692001A4800692001A4800692001A4800692001A4800692001A4800692
        001A4800692001A4800692001A4800692001A4800692001A4800692001A48006
        92001A4800692001A4800692001A4800692001A4800692001A4800692001A480
        0692001A480069200478EA68986FDBF9185FFB3480B345A5F9D1F495FC7F0E87
        F4EE81A4D48035200D48035200D48035200D48035200D48035200D48035200D4
        8035200D48035200D48035200D48035200D48035200D48035200D48035200D48
        035200D48035200D48035200D48035200D48035200D48035200D48035200D480
        35200D48035200D48035200D48035200D48035200D48035200D48035200D4803
        5200D48035200D48035200D48035200D48035200D48035200D48035200D48035
        200D48035200D48035200D48035200D48035200D48035200D48035200D480352
        00D48035200D48035200D48035200D48035200D48035200D48035200D4803520
        0D48035200D48035200D48035200D48035200D48035200D48035200D48035200
        D48035200D48035200D4808752A7F8C2DDFD3F95834FF95480B343A7F9D17475
        FC7EF82C3FF4EE81A8D48035200D48035200D48035200D48035200D48035200D
        48035200D48035200D48035200D48035200D48035200D48035200D48035200D4
        8035200D48035200D48035200D48035200D48035200D48035200D48035200D48
        035200D48035200D48035200D48035200D48035200D48035200D48035200D480
        35200D48035200D48035200D48035200D48035200D48035200D48035200D4803
        5200D48035200D48035200D48035200D48035200D48035200D48035200D48035
        200D48035200D48035200D48035200D48035200D48035200D48035200D480352
        00D48035200D48035200D48035200D48035200D48035200D48035200D4803520
        0D48035200D48035200D48035200D480CED569FE30973F4FE5E093FE55202CD0
        6E26C7A37E9FC1C3FF004AE856AB690400DA41003690400DA41003690400DA41
        003690400DA41003690400DA41003690400DA41003690400DA41003690400DA4
        1003690400DA41003690400DA41003690400DA41003690400DA41003690400DA
        41003690400DA41003690400DA41003690400DA41003690400DA41003690400D
        A41003690400DA41003690400DA41003690400DA41003690400DA41003690400
        DA41003690400DA41003690400DA41003690400DA41003690400DA4100369040
        0DA41003690400DA41003690400DA41003690400DA41003690400DA410036904
        00DA41003690400DA41003690400DA41003690400DA41003690400DA41003690
        400DA41003690400DA41003690400DA41003690400DA41003690400DA4100369
        0400DA41003690400DA41003690400DA41003690400DA41003690400DA410036
        90400DA41003690400DA41003690400DA41003690400DA41003690400DA41003
        690400DA41003690400DA41003690400DA41003690400DA41003690400DA4100
        3690400DA410036904033357B88983A7FA7F3703FF006E88199A26352EE8BA42
        7E7F6C161D3FDBBA11A7CF24414E79220A73C910539E48829CF24414E79220A7
        3C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C9105
        39E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539E488
        29CF24414E79220A73C910539E48829CF24414E79220A73C910539E48829CF24
        414E79220A73C910539E48829CF24414E79220A73C910539E48829CF24414E79
        220A73C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73
        C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C91053
        9E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539E4882
        9CF24414E79220A73C910539E48829CF24414E79220A73C910539E48829CF244
        14E79220A73C910539E48829CF24414E79220A73C910539E48829CF24414E792
        20A73C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C
        910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539
        E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539E48829
        CF24414E79220A73C910539E48829CF244159FAA6312F612E27E7F6C5E096CC5
        52503C3E958FBF774CD3AEFE17FF009C2D14FD97FB2E2145FB8DF82D8A0371BF
        05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6F
        C16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371B
        F05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6
        FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371
        BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC
        6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A037
        1BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280D
        C6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A03
        71BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280
        DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0
        371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B628
        0DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A
        0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B62
        80DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8
        A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6
        280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D
        8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B
        6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82
        D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0
        B6280DC6FC16C501B8DF82D8A04F8AC75EBF87BC9F85FD2AE1EF7ECBFD95E9A8
        1A3A5D4A7774CD3929E0B0B569A6168A53A953137EE5FBD77FC09F85BD71285F
        4BAABFDA89797F11520B9E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953
        A600F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A
        600F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A6
        00F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A60
        0F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600
        F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F
        276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F2
        76FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F27
        6FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276
        FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276F
        C1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC
        1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1
        672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC16
        72A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC167
        2A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672
        A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A
        74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A7
        4C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74
        C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C
        01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C0
        1E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01
        E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E
        4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4
        EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4E
        DF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4ED
        F82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF
        82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF8
        2CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF82
        CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF82C
        E54E980971952E5EA0897F0785A775EC3AFF008A9E26FDF5FCA57A6B753F0B42
        E7E9797F08ABF9FD13F2BF8BDF8FC287FFD9}
      Stretch = True
    end
    object ISalir: TImage
      Left = 704
      Top = 18
      Width = 51
      Height = 63
      Cursor = crHandPoint
      AutoSize = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000003300
        00003F08060000004D63F051000000097048597300000B1300000B1301009A9C
        1800000A4F6943435050686F746F73686F70204943432070726F66696C650000
        78DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A
        2109104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807
        E421A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C008
        0C9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173
        FD230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA4299
        5C01808401C07491384B08801400407A8E42A600404601809D98265300A00400
        60CB6362E300502D0060277FE6D300809DF8997B01005B94211501A091002013
        65884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0
        B700C0CE100BB200080C00305188852900047B0060C8232378008499001446F2
        573CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE4917
        2B14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE
        0EAECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C
        2FB31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370
        F87E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E
        3CFCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FC
        B70BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525
        D2FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F7
        0000F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E
        44242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC60
        36844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C0
        51688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA88
        01628A58238E08179985F821C14804128B2420C9881451224B91354831528A54
        2055481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB5
        43B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA
        8F3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB0
        56AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A8
        201C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C
        23D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E52
        23E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE4
        21F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52
        DDA8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D3
        1A681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D8615
        83C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F
        996F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB
        548FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67
        A86F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C21
        6B0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B3
        52F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB9
        31655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C7
        4A275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB44
        77BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C58
        06B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E1
        8491B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4D
        EE9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79B
        DFB7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB3
        46AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D8
        06DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB
        1D5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B6
        13CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8
        BDE44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F29
        9E593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F
        9157ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7
        C8B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02
        FBF87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8
        EC90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C278587855786
        3F8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A
        3EAA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBE
        DFFCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A9640
        4C884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D843
        5C2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B
        3A9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC65
        85B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B267
        655766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5
        864B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD5
        4FABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED
        5D4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCA
        BF99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB4
        0DDF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54
        A454F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BE
        DB5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D2
        03FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D
        558D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F
        6A429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C5979
        4AF354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A
        0F6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F
        6DEA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDD
        F4BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD977
        27EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47
        F7068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA7
        43CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7C
        A5FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4F
        E47C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB00000004
        67414D410000B18E7CFB519300000EE64944415478DAED9A0B905D4599C7BFEE
        3E8F7BEF3C93493279415249080A59629657148B50142AA020ABB5D912848515
        5D17D7628350D6E2028A3C54D62A758DA945CA451E8A1A829055CA2D20894064
        75D75254844DC86B1292C9CC642699997BEF7975EFFFEB3E77660293CC9D4962
        A5AC9CAACEEDD3E79C3EDFAFBF679F8930C6D09FCB214EC01CA7C70998E3F538
        0173BC1E27608ED743F4CC5E30DE6766A0AD405B86B60BED01B49F4EF0FDE7A0
        FD3DDA62B4A7D1FE1D6DE7099809C0B492318FA12DF3962CF461A13AFBEDA6AD
        38BF93A47C749CEFBE8232BD924A419B7FF6E95EB67D4FACB7EC7A823CF55912
        624240E381990CA1BF672AD50B832B2EF0830BCF26110614AFFF1F13AF59F77F
        64E86E08F2709D732DA72CFBBA68294D0FAFBE8CD4A973887AF753F4A3672BC9
        2FFFF0A4682C7D06F7BC71AC606600E43BA61ABD2FB8FC7C115C742E89B65612
        52903E3040E9BAFFA5E8F1675FC5C03DA4E4E1818CF90869738F98DC3837BCEA
        52F24E9F4F14F89004736DDB45F113EB2BC9C6977F2C5A1A6EC6E0B880EA8199
        4B5AAFC24A5EEC5F7A1E05172D2531A99970CE825941CC40999275BFA2F8C71B
        3643D0CF0368349383B4E6A34667B7ABF6C90B82BF792F79672C7457B4269829
        9127496F7D83E227D727C9C6DFAD164D2536B98EA30363E854BCE83E52E2B2E0
        3DE7927FC979241A1B86416A87EF11B446C933FF4DF14F5EDC4E71723B847888
        573B3F20A5BEDA64FA73EAA4A9A7841FBA90D499A71325094046CC0320E129CA
        B60368CD3A82C97D5F948AB76219B61D29CC0238E87D5408AE08962DA1E07204
        AF3074AB385A6E82100C193FBD91A17699FEF2AD10CE0169F3B7B8769B9CD33E
        3FFCE032F2962E2653AE8E3E8F05027B47277CE8194A7FBBE9312CD6E7716533
        5A36119846087DB32815EEF0CE7A1B85CBDF833BA50339DCC1A6E24B98C9064A
        7EFE9BDDE640F946AC6A113077CAD953E7041F388FFC772F21B37F708C79B000
        5291E9EAA6EA234F53B665F74394999B3057CF446016519CDE2717CCBCB870ED
        A5249A615AC9611765C48C824411516EED0B946CFCFD1ED3373055CC6A53FE25
        4BC95FBA88E84099CD77EC433A13D51DBB4DE5FE9F64548D4FC5D89689C0CCA3
        24BD4BCE6CFB88FFC177929ADD3EBA491C06880A3E256B5FA26CF34EF2969D41
        AC612A47F5CFC3734409A57FDC46F17FFE12FF24E703E6B0C1E0D03E63E87A32
        7AA56C9F14F87F751EC9D686FA6172614C9ABAAE521CCBEAD3480D04CF66AFEF
        A6E4A99762A3CDBF607415DAC0C46008B64EF4314CFC6FA2AD8982CB90249B1B
        EB178A059A4811ABE07799A66CD34E4A7EF66B1099EF63F45368FD63BE728C3C
        8384421F05C04A39B989BCF72D2139A9D15D3916D536071002C86B6F50B2FEF7
        29FCF6112CCA4D18ECADE7F17A92660B347115A45F29A7B69077C169C4BFC819
        471708A688AC0A1FD949E94B9B321A8CBF83247A07AEECAE778A7ACB991280AE
        83FABF2666B478DE3B17929CDE0ABBCEEAF783C31DAC116128FBE32E4A7FBD55
        9BFDD50744A0EEC6951DE399663C8526023FDD802877B79835A9C93B6B1EC919
        93C8D8907D04449C24F13C9B56FA9B1DA939500188F7655CD936DEA9C6BF9F31
        E646D8F267C5ECC933BC257349B086323DBE3986DECE414293DEB49BB2973B2A
        E640F5410ABC7B71A5EE7AECC8601CD06D00FA27004DF6169F8C7AA138767530
        DA81C4683ABA297D19B2979355E42BF691AE89ADCCC460421710E8560AD57C39
        A399C43404BD746230FAB53D640E44ACA5EB616FDFC568FAA782E1DCF361A8E6
        5FA918B4CBB61232BDE74A1D319E69F2835D0D3E637A0619680FCE3E87F6185A
        F958C304C43B4432DF40ED354930481120D91186B33C099B2E00F5573B31C040
        8FA045C70A065B41FA6BF8CA4A51F45BC59406A7117D94F20C0371DA620DF555
        77C1FCBE80916F1F0B1814567425560F1AF11C48E81DFD0A8081A065D35B31A6
        B7BC1DE677CF7881C682E1FAE21A48FE655108A6892930AD501D9D443916D0BE
        F256D4695F21F7F9E988610A79D4BA4394FC932C88AFC6295CCD21C609945A20
        6E00129C77EAD2D0E1B6001761E26FC347E65AD30AD4F84C8B7308A29CE05245
        89F1F9570DA8AFC23ED481F39B31B216AD32EA8261BB60BABA0E0933132FBF0B
        4E7E9D9CDEE440C6230CEF129177F4BE320938B6682D20F2F9E3AB14780E2C86
        E944508892FFC2E2C2DCA973F83A16A95221DDDD43B27D1A85FF7C0B89EE521B
        5ED662ABD6112BBF18C27F8D1A820BE4C9ADF56F996B2B9565A47BAB44FBABFB
        01D540CDA1276BDAAD77516A16DA5DE690BD05FD0BA856E6706EDAB78FE4FC79
        145CFC5E3253A750E1333792D8FFB14F52FA34C0FBFB4934E085BECF506D6837
        91EFDD2ADA8A180FEA87C1EAA3EA857944833430F04D0A029EF32AF8DD6C1709
        EB00AAF95A25753049FA10066F32E5728FADD4AB5512279F444568A370DDD594
        F023303591421B831FBF81CC8E0ED2DB7790EE84ED154216601122CB83E48933
        E5B44667266365F92CB7F3BD07064D1C3F2CFFF21DB75077CF80DED1F1291186
        B789D652BB9882B97C71E8A06039F04F2566106DE2F405ECFFAF3349B2559DB1
        C8C8E626D25D3DE4DFF0092A5E732569DE5EA32E945C7D274942C6F308998306
        6FFF22253F586D4DCEF4F4F0EFDB31FC2834B4584E6D94543A04108F25B946BA
        072A62F6CC874DDFFE15850D3F2B674FFD9492AF7E9D17E8E3A6ABFB2BD45C6A
        95ED8D6E7B7C28AD94139E2735E57823EE5B2E66CDECA4BE3E2AAD5D43E1A9A7
        D88F675CC0A9FC1BC341303A3F2140F182450F3C48D18A5BB0019B0E6B330BA0
        D63578C969727AA3A252F056905AE4E92D97A9587CB8F88BF52B68EA940A4591
        20A98CF03D4A7FB44644D77EE2EFC4E449DFA2820A647BD35B81D8E907738D24
        D9F330D1E514867B4BBF7A9E145C40C08415EEC9E09319F7F3E74787E18FD730
        BB2C8A4882DA0B434A376F11034BCF9F279A9BD7E0E9BF8010821AFC839CDDC0
        D94D577F554C9BFABDE2F3CFDC4CA5628C45406C667B71AA14BE9F652FBCD810
        FFE38A0F43EBABA854201B299518010259BA11BDBA7BD7A973CFBEBAB076F52E
        EB1FA512E413D88C0A52FCF9B66E18F4ED4568C9574AE83413D9E6D7FDE85BF7
        2F489F78F251CCB258CC6C21D15CB0E1D7F0CBF7F6C5E2F4D31E378FFCC7BDA2
        A5B96AB24C1AA3A5D55BCD37D87431285E79B591BEB9EA12F9DC863B4D2380B0
        85E03ACFF4476476F690081B36A86BAEBCC5FBF43FBC2A5B9AF9EF94192F9914
        22651CC0C04DD2B16138C1A1EFA1F978B167B40920AE6794F4938E5DC26C7C69
        91F8D257EFA5CEDD8BC5A426F7E1BBAFACD377BFEBA9EA97EEBA9F664C1F3095
        4A8165E6B5CE23BD5B7A3E51CAE0255A6EDB560C7EB07A59F0C3C73F2D7CE199
        6248A2AB97F4FC535E4CAFBFF61BE2F2F7FF4EB5B648114529644AA55409E44B
        6062FC1B0B21130138680BF10BB435F941291800AFF219426759A8B509A14A6E
        016E0C3437CFF37405B1F2B99F9F13FC70F5C56AEBB639BAA1548ECE39FBB5F2
        F20FFD422F3CA5CBF4F535616E86C092196915E3349453619DA534D257A9DAD3
        A9C267D79F5B786EFD3B54774F537ADADB374797BDFFD9EC5D4B5F914D8D24A3
        AA16422558FD58018461A49211FAB1545EE4A18F316E31593099023E6A82CAC2
        4C67058015B29461740D06E3BA76EE6752DA3FFDC9575E9945BB3BA7E920D0F1
        BCB9BDC9EC5989E8ED6BD216C4A8BC5933B3BE3314A86C570B89BA200C53AF5C
        8EFD4DAFB7ABFE015FCF39F90D3D77CE3EE17946264926958AAD3600C3027353
        4A458A21F0EB495985C9E1DCAB2AE9C6457F7FFF6CC0589034CB8A3944216FDC
        2FE6304196EA10A2055918C0808507F002CCAA88B2A268B08CCE44619646AB5C
        43C2258DE1EFA00042C1065716424BDF8FA950AC085FC52ACD8C4A133C443183
        28071359AD2855753000409F9BE77E23E57915D707CCBE7DBD6F63810163054F
        6D3F2B686DC16C9F61B32CB5700660A9832BE8D46A945B60FDCBB099A239188E
        F3529B6118FEFCCC100C04BB8753D7CC4724D67C24845656032C6C94C340602B
        6CD56A41A90AFA1525BDAAC7E39E57F658437856ECEDEA5E62B5C09A49D3A2D3
        8E464B6B30AC197BADA6B19A0601534CB51D2BE2F91082877AD8CF5C10C9CDCD
        C1D44020BCB24E1D39531A5E6DC982BA7E056E3AA4090BA03CBE86715991D2B3
        D70152B6E04A9545E7DEAEB3204031B13056C8126B6144BF989BE110549AF078
        5648745A0284EDE7D035E030EF73421AB909D2D23973940B09A12404F26A00E5
        1C6090C720686518C6F673187BAD5C3BF7F10C602A0C73666E666C4AC51A44FE
        9B6B48BBEB2C2034806BA59A498ED4E0085F43783661AE9D5161B8B1E02360AC
        F978CE94CA2360A291203518BEC7F547C07475F79C914314728D94DC2A3BF301
        4449B36658486826B3D0F9358CEBE1405133333F1B363135C2CC5C248399499B
        3B727F718E6D35C5A1D79335BF80A6AC39A91AF49B34E595DD3D437055B1AFB7
        7761BEF26196E6ABEC1C7E68A5B585B08ECE396848783CC7BE8131F889310802
        707E44338C290404644893E79BA103D1007E23E1FC527000B050CE87642C8723
        58D54533ABADC88567351CC93CEB3F43E6E74C5356C5C0C0E02C162C71208103
        E0D5D7C5A115B7D1CB0ACD3081159E41B87104CB356193AFFDCD4186B5520BCD
        C68665AB210754CBE610261D6182890DB5C2690D200ED285E668841F556D24F3
        9044399A4571DC6085D2D6EED91FACD09933B3C041B0E03681F2CA43701E67A8
        11A58F3529EDD534925701C2E59AE1D0ECA06C9EC99CC9D95FD4F2D29A1F0406
        902D5B22614B18678A79D070F907509E3D0784C7E60930BE3F4E122E67F0BC60
        FB762B0E18F61107A95DA8ADF90219974BB80F73B2703494F5F99CF7DF6F4E98
        7490A909FB6500DA21D64CEE47B69F0A6B7A1626CD21D057A92B65044A1B2F56
        9ECB3F5C09C06C132C22DFAF1966A8D094C2EE15942DC88560E179A57DAB0163
        813C6B6643266535C37FB751B9768476A625CD70B23CC867720DE95C3B7A44EE
        E1CA387305A44A84B45ACB3563CF135CB741C3B8BD99869632C88735CD5CA139
        12C67E83CBDC0538952DAD6D59A235D75898575AC7D6AC015B405AFF90398CB4
        918B7FEDDFC1783F436FDE4EB2BE380898210D5918F89035337BCD56CA5CBFB1
        6FE160F3CB6AE02C5BCA1F4C346F01DC07C93161F8C61C864CFE1B04815D6DED
        E0446E4EAE59E16BBE3204F3D64DF64130E46086C1F2E06085E6EADEC4716CAC
        6CFC9F25D0B8CF728D0AF367F57F344FC01CA7C7FF03DA0A0D1348AAF4A00000
        000049454E44AE426082}
      OnClick = ACSalirExecute
    end
    object LSalir: TLabel
      Left = 715
      Top = 71
      Width = 26
      Height = 16
      Cursor = crHandPoint
      Caption = 'Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = ACSalirExecute
    end
    object IExpExcel: TImage
      Left = 153
      Top = 15
      Width = 54
      Height = 54
      Cursor = crHandPoint
      AutoSize = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000003600
        00003608060000008C456ADD000000097048597300000B1300000B1301009A9C
        1800000A4D6943435050686F746F73686F70204943432070726F66696C650000
        78DA9D53775893F7163EDFF7650F5642D8F0B1976C81002223AC08C81059A210
        92006184101240C585880A561415119C4855C482D50A489D88E2A028B867418A
        885A8B555C38EE1FDCA7B57D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F80111226
        91E6A26A003952853C3AD81F8F4F48C4C9BD80021548E0042010E6CBC26705C5
        0000F00379787E74B03FFC01AF6F00020070D52E2412C7E1FF83BA5026570020
        9100E02212E70B01905200C82E54C81400C81800B053B3640A009400006C797C
        422200AA0D00ECF4493E0500D8A993DC1700D8A21CA908008D01009928472402
        40BB00605581522C02C0C200A0AC40222E04C0AE018059B632470280BD050076
        8E58900F4060008099422CCC0020380200431E13CD03204C03A030D2BFE0A95F
        7085B8480100C0CB95CD974BD23314B895D01A77F2F0E0E221E2C26CB1426117
        29106609E4229C979B231348E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E6
        66E76CEFF4C5A2FE6BF06F223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D603
        70C701B075BF6BA95B00DA560068DFF95D33DB09A05A0AD07AF98B7938FC401E
        9EA150C83C1D1C0A0B0BED2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB
        7AF000719A4099ADC0A383FD71616E76AE528EE7CB0442316EF7E723FEC7857F
        FD8E29D1E234B15C2C158AF15889B850224DC779B952914421C995E212E97F32
        F11F96FD0993770D00AC864FC04EB607B5CB6CC07EEE01028B0E58D27600407E
        F32D8C1A0B91001067343279F7000093BFF98F402B0100CD97A4E30000BCE818
        5CA894174CC608000044A0812AB041070CC114ACC00E9CC11DBCC01702610644
        400C24C03C104206E4801C0AA11896411954C03AD804B5B0031AA0119AE110B4
        C131380DE7E0125C81EB70170660189EC218BC86090441C8081361213A881162
        8ED822CE0817998E04226148349280A420E988145122C5C872A402A9426A915D
        4823F22D7214398D5C40FA90DBC820328AFC8ABC47319481B25103D4027540B9
        A81F1A8AC6A073D174340F5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D
        8A8E6380D1310E668CD9615C8C87456089581A26C71663E55835568F35631D58
        3776151BC09E61EF0824028B8013EC085E8410C26C82909047584C5843A825EC
        23B412BA085709838431C2272293A84FB4257A12F9C478623AB1905846AC26EE
        211E219E255E270E135F9348240EC992E44E0A21259032490B496B48DB482DA4
        53A43ED210699C4C26EB906DC9DEE408B280AC209791B7900F904F92FBC9C3E4
        B7143AC588E24C09A22452A494124A35653FE504A59F324299A0AA51CDA99ED4
        08AA883A9F5A496DA076502F5387A91334759A25CD9B1643CBA42DA3D5D09A69
        6769F7682FE974BA09DD831E4597D097D26BE807E9E7E983F4770C0D860D83C7
        486228196B197B19A718B7192F994CA605D39799C85430D7321B9967980F986F
        55582AF62A7C1591CA12953A9556957E95E7AA545573553FD579AA0B54AB550F
        AB5E567DA64655B350E3A909D416ABD5A91D55BBA936AECE5277528F50CF515F
        A3BE5FFD82FA630DB2868546A08648A35463B7C6198D2116C63265F15842D672
        5603EB2C6B984D625BB2F9EC4C7605FB1B762F7B4C534373AA66AC6691669DE6
        71CD010EC6B1E0F039D99C4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37
        DA7ADABEDA62ED72ED16EDEBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51
        BA85BADB75CFEA3ED363EB79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EF
        D11F373034083690196C313863F0CC9063E86B9869B8D1F084E1A811CB68BA91
        C468A3D149A327B826EE8767E33578173E66AC6F1C62AC34DE65DC6B3C616269
        32DBA4C4A4C5E4BE29CD946B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D5
        9C6B9E61BED9BCDBFC8D85A5459CC54A8B368BC796DA967CCB05964D96F7AC98
        563E567956F556D7AC49D65CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9B
        ADC4769B6DDF14E2148F29D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625
        F66DF6CF1DCC1C121DD63B743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E9
        57671B67A1739DF33517A64B90CB1297769717536DA78AA76E9F7ACB95E51AEE
        BAD2B5D3F5A39BBB9BDCADD96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4
        F0F758E271CCE39DA79BA7C2F390E72F5E765E595EFBBD1E4FB39C269ED6306D
        C8DBC45BE0BDCB7B603A3E3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE
        237ED67E997E07FC9EFB3BFACBFD8FF8BFE179F216F14E056001C101E501BD81
        1A81B3036B031F049904A50735058D05BB062F0C3E15420C090D591F72936FC0
        17F21BF96333DC672C9AD115CA089D155A1BFA30CC264C1ED6118E86CF08DF10
        7E6FA6F94CE9CCB60888E0476C88B81F69199917F97D14292A32AA2EEA51B453
        747174F72CD6ACE459FB67BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC
        9BB880B8AAB8817887F845F1971274132409ED89E4C4D8C43D89E37302E76C9A
        339CE49A54967463AEE5DCA2B917E6E9CECB9E773C593559907C3885981297B2
        3FE5832042502F184FE5A76E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92
        E69D5695F638DD3B7D43FA68864F4675C633094F522B79911992B923F34D5644
        D6DEACCFD971D92D39949C949CA3520D6996B42BD730B728B74F662B2B930DE4
        79E66DCA1B9387CAF7E423F973F3DB156C854CD1A3B452AE500E164C2FA82B78
        5B185B78B848BD485AD433DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859
        F1E022BF45BB16238B5317772E315D52BA647869F0D27DCB68CBB296FD50E258
        5255F26A79DCF28E5283D2A5A5432B82573495A994C9CB6EAEF45AB963156195
        6455EF6A97D55B567F2A17955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796D
        DADADE4AB7CAEDEB48EBA4EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE5
        1B5F6D4ADE74A17A6AF58ECDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A
        9D7F5DCB56FDADABB7BED926DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78
        576BBD457DF56ED2EE82DD8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F6
        45EFEB6A746F6CDCAFBFBFB2096D52368D1E483A70E59B806FDA9BED9A77B570
        5A2A0EC241E5C127DFA67C7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD2
        3ABF75AC2DA36DA03DA1BDEFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F
        579EA09D283DF1F9E48293E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515D
        BD6743CF9E3F1774EE4CB75FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3D
        AE3D477E70FDE148AF5B6FEB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D5
        73D7F8D72E5D9F79BDEFC6EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC
        5D7A8F78AFFCBEDAFDEA07FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E
        09879EFE94FFD387E1D247CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7
        B2A713CFCA7E56FF79EB73ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F3
        72EFABA9AF3AC723C71FBCCE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC
        40FE50F3D1FA63C7A7D04FF73EE77CFEFC2FF784F3FB25D29F33000000046741
        4D410000B18E7CFB5193000016E24944415478DADD9A79781455BAC6DFDE9274
        A7B36F24642109415004595456D94504041C74D471A41DC65D0461141D111766
        8671C5240401BD2ED73B731F679C1161144616414516150C108284AC2464EBA4
        93F4DED55D75BF73AAAAB7C49971EE3FF7B9CD13AABAAAABEAFCCEFB9D6FA973
        349224E1FFE347C3C0E6AE1996E1F7FB2738DDF6F15A20408795B36C2BEF6BD8
        36FCB07A83E0710D346147C37F11BC0E9187E5539AE013222F89F8F500F7ED77
        4AA7D7E93FA5BD6F3F7DB5C6C3C1663F5A7C8B5E67586E8E4F184F27641135B2
        92B2A092F2A76E24FAA7514F2224BA14DC97FAFD9E3D3B7854BE486DA7A409BF
        22EAB9D11B49BE4C92AF085D23690201F123DABE49604738D894FB076D2F2C18
        76F76DB7DCAF67DFFD8200510A2020D25F200049D98AA2487FCA71916E4AC702
        92C8CFCBC7693F20D231E5B7748E76F871769EDD9B5FC7F7457E1F89BEB3DFB1
        EF223BC7B722FF2DDFA7FB890C801D63CD67ED51BECBD7D13E8920FA45B477B4
        F4FA045FE9FED2BA6738D8E4FB065514150DB7DCF9D3074DECA61C4C0C81F17D
        F680809F8304BFF3064642AB40BC416180ECF750B6126F90722E408D82DC4051
        69B4FA1BF08EA0DFB1C62BD0F21FE46743ED00893F8FC0AC5EC1BBF94069FD73
        32D8FDD91585434A2CB7DE7C8F89F584E0F7F19BF21E6630ACD7691B6A644849
        F6DDCFF7C5906A2A80A2A4C8EFA33424A8B2D2EB903B410AFE465214535464ED
        60E7A12AAA002AA345549414453F3A3BDBAC3EC15BBEBFB4FEF920D8908212CB
        2D8BEF36B18BD9033C1E072EB6D4839C4AA8D1907B4E7E4020F860D63066F1A2
        D260D504F939A5E78366A3364C840CAADC536EB832D25433E38D67FBEAC05740
        68574B5ECE18171F1C8B4C59ABB5DD2A84834D6160F925969B17DD651295069D
        3B770A838D85185E308A838406BAEA5834A1412D7B1BEE2D2529E82FC2C73D22
        C28AEA74E8028DA8FA0E49F52161BF031F3F215FA3E11D10171B8393E78FE1F3
        B31FC114679681490C6B770781F908AC4E05CBA928C82BB62C5E78A729400AB1
        BEAAAE3E855B27DC8B2B8BC7E3DFFE44B1043DA6A47AB508CEFE1D2285F9E330
        6F6B326AB0EFF81E6CDEF504E28D09D4A15AAE64B78DC0FC42F9FED7C2C0F2F3
        8A2C37DDF833132367B29EBF701A8BC62CC3F8115311F0CB9E29E8BA15D308BA
        DBA8E34107AFBA6429F43DF29CA2D400AAAA2616020C9D33C725E3C0C9BFE0CD
        DD1B08CCCCED92B5DBD6D34560BE30B007722AF2720B2D0BAEFFA94976CD7ED4
        D455E1E671BFC0B8E153C99904205B0B3353D920A4B046CBE30BCA6FA4602345
        6EB57293221BADC2FF1B60B4311B9308ECAF78E393E7493D337169B9183D04E6
        27C5F685C00657E40D1E62993767A989BB78720CB5B5E7B0F46A054CF0871A17
        05D44F0DB5A1510D9642ADED17C4A5A8E388B68428534C30926227086CF773DC
        817053A44EEFEDEB96C136296053096C70CE10CBDCD94B4C220FB07ED4D59EC7
        2D137E496053E0F50A03343A2CCB0857205A95E86D18B4EC214357F6DF8FEC34
        39979314536460CFC2186BA6C31AEEB5EDF61EAB3FE02FDFBBA9361C2CDF3267
        C662939FC70C3FEAEBCF93F3B88F83FD3307A1B687CC1C142029AEF923FD4794
        AA6CC432838ED1C742A73344DE274AEDA003A1CEF60A1E1E33B96204B6ED6302
        8B3342AB2866B7F792627E324515ECC1C11539D9F99659D72D34A9A95443430D
        6E9FFC2046155F8B6FBFFF122E8F133A8D8EEC59C7A5670F0F7A6745C1D4842C
        E4650D431C3DCC47415E0EF4FD558A8B31414B5737B7D7E25277136F14BB9718
        9573CAF7D7F0319F684A4151EEE5D0D0F38D062381ED20B0F5F4AC78BA97968F
        7FBBA38F2BB66FD30519EC3A02CB1E9467993E65BE02E64753531D2CD357A3AE
        F53C0E7CBF03B9D943D0D4FE3D5A6D4D1044D6101D2B03E8861A325D0DCF260C
        A20145E622CCBA6231A65C350FF16633DC1E57D8B824333226A2A5BD1EEF1FDA
        82AF5BBE824BE3A11EA7BB69256E690C46A791B883D22A7191A7554E113931E3
        70D78D8F60DC8871F8FBB10FB095839938188BBD4E679F95920B324515ECA1DC
        8AECAC5CCBD4C97379E6218A0281D57330964ABD77B80C37CDBF1D6E9F0BDFD5
        7E89BAF6B3F0F16C424F40805F94E104326387DD8E40472FC6245F8BE5373D81
        6105C3E1A42C461EF489F8BEFE3BFC6EC71AB4683A90949E41E668201091C3E8
        0844C7C00892833215C9234BF4904B17DAF0F9BE1ABCBC6A1B1EB8E55EECFAF2
        03BCFEF1D3A47E3CF78A2C7D73BA1C041636C618D8A0CCC196C913AFE7B92253
        EC6273037E7E1DF5CEF0C9F860FF5BF8FCC2C75838EF76B2710195755FA2B683
        E01815F4F033C5C8B7FB593F6B0CF0506774D75C40BE58842796BD86114523F8
        3868BA741EEBDF7F102DB136A4A70F829692012D87A25044607A8DAC924EAB94
        3874FF0081796C6E1CDA5B89ACC4E17863FD1F30AAE44AEC394A607F7B1AB131
        71748D8E5B83CBED88546C1A816566E458264F986D524B8C969646FC7CFA4A8C
        BB6C32B7FA3FEED98A238D7BB168FECFE0F57950594F70EDD564964C0B03CFF3
        040550647185F6BB6A6A31D85F80A7976F4666721AD6BDB71C35BA16A4A56652
        2AE5972198C96965B554306E82AC83054AB0DD3E541EA94173A380ADEBDEC60D
        931612B49EDCFD5F086C1D81C9CE8371B8DDCE68B03C02CBB64CB8664608EC52
        23374506E6F2F8787EF6C73D15F8A6E51016DC701B7C829BE0BE52E08846A30F
        992483A3C7B3B0DE53D78422CD5098D24C382FD52131251D1A52949B9E1641B5
        B44C7B9DBCE5502CDBF1D258AFBE84E3C71AB1D6F21C56DCF62BEE754D31667C
        F6DD0EBCBEEB29C410988E2B26B2F1DC1F2C236390E59A71D34D72E9E1476B6B
        33EE9EB1869B629FD30DBD5E4B312316EF7C5C86CAD62F40E91729E7C677CC2C
        DBABB87220E5181C73F681008131374C7FBD171A782D9632BC889B9F4E353905
        2A38BE9484D7EF236741BD636BB1E1B37D55983B6129CAD66E8741AFE7608971
        2904F6215EDFF96BC418E2B8A7661582C7EBB6527251BEF75515EC61024B1B64
        B97AEC54132F24FD02DADA2EE1EE59BFE28AD9DD6E2EB55EA747AC21066F7FF2
        2AAA3A8FE1261A732C0C9CAA3FCC95F373A5C85B7238FA0BC819BC5FD2C27BC9
        4A8DD0222E27193A9129233B08158881B2F48B55C20CCC6D73E18BCFCE2023F1
        32BCF3EC1FC9D59730E7C0C1591C6360150A988EC098D3F312189553E59FAA60
        D31FCAAF484FCFB28C1D3DC9C4323C3FA9D6DED682E5B31EC71806E672F2B8C3
        5CAA4EA7439C819463705682BBE1677079ED0477847B4BA69C4866C91563708A
        59FA08562038639C16F1D9C9D0B27B41564BAB380B0E45E62738C9411DAF4177
        8716154FBE8559D7CE23287B307B312B605B7610180D112DBF13E0F379AC6471
        61600FE757A4A56458AEBA6A22F78A0CACB3BD15CBE7ACC5D8614C315730C155
        95636EFA8D9D2FA0CE710A0BAFBF032E9F83C61C538EE002CCA1E879C2CCC61B
        1B770C4E20381FC199E33448189CC4CB3ABD12B3D82B02BF8F4A268F1F0DE75A
        71E29B263C73DF8BB877E923F0D0F3592C0B66F7047690C036EF7892C6582C1F
        632CC8FB7C5E524C22B09A30B0D40CCBE82B27C8638C067787B51DBF9CF32481
        4D8283140BCFF358D215A38B259BD761FBCE8DA8B39FC2E2797792B2BD38DD70
        04B56DE450243514C860DCB170382D7C2D9D483601C9B92972851C604AD17309
        CCD6D2834307ABB1E8BA3BF1D2EA32DE689EC12895AEC44D3129086630A86012
        25EBD1602BF22B5293332CA3468E37B1EF3E02EB22B07BE73C85310466773B23
        4B12EEB9C8C9936A2C866CDBB901973C355838F70ED83D3D385D7F54564E5495
        233311B5FC750073283484B859A6C66B9038381182DB4F6E5D80BBC785C39F57
        233F7D14DE7CE63D0CCE2C903397F0BC938325E220A5549B3F0A070B109810AD
        5841454A729A65E4E5E34CCC6D0A2CC05A3B70EF0DEB088C8D31870216594630
        F90DFA180EF7CEEE9760F53560F6CC45E8233836E6381C934C338072012D84D6
        4E24C504604C3141B0FB70F2F879D83AF578F3D93F60DAD8D9F4DCBEC88458B1
        18E63C0E567E88F20FD77230354053C912093683144B4E4AB75C71F918131FC0
        9449777777E2DEB94F634CC96438DC76D91406280A59499E919C8CAFAB8FE0C9
        B79661E2D5D33077E64F60B377E04CC3516E963EC52C59A2C24C916D45C890BE
        D62E98036E72567D387DAA1DBF5EFE1BDCBF740529E5E6E38ABB729EBE05826F
        87CD0AD86606461582FA9B7E60331FC9AF4822B0E1C34699D8AB2E0E66EBC2FD
        739FE1A6E8208FC4325429542429AFC958526B46DDC52A6CD8B10A569317DA6E
        07A690CAD3A7CD47AFAB0B671A8FC9419CBFC952942338812BCE621D8587B62E
        9C3D7C0A132E5F84B227B6F3B73B1A3AAED7C5D0756E32353DAF287C54B60894
        D2F1315649A6F8D7C7A157DCFDC0602B0A2A1293522C97958C0AE68AB66E02BB
        F1395C55C2C6589FFC8628AC10645009F149B8D45E87F5FFFD001A0D56A46764
        536075C3DDD48EA923A661C68C85E8B577E154C357B84041DCCFBC25E59201D5
        2C959010A086DB1B2E62902F076B6E7F194505256868ADC6D7E7F6A1BAE10452
        13337155F175B8A2F01A2427A47260E63CCA1918ABE91430727AD18A1158428A
        65D8D02B83658BCDD68D07096C343745152C0465A23AA8B7CF8A0DEF3F8C53FE
        3AA4A567414F4520CB5002011F5C4D9D984C70D3A72DE06679BAF128C5B96AEE
        FE1115C403AC02A6C6F5D535235BC8464E760ECE9003B2F576513F6A798A6588
        D5233FE30A2CA0AA7ED1F45B71E0DBBFA2ECC35FD1F362E4948A673BFDC08654
        2426265B86165DC1C1D84BD2BE3E1B1EB87183AC98AB2FF85A9141C5526AE5A3
        D8B2F14FAB70DC791AA99939D09289B040AB6749AD5EC3EA0DF435B463D28859
        983AF506F438ACA86A3A26870251314BC591A870010276363553A7B4D2D889E7
        8D66501A529744C2C9AA0B98396629DE7EEE4F94047F88D2BFAC26F5E43106F9
        4DB2956C22122CC19C64292A1A61020FD0027A7B7BF1D0FCDF60F4D049544FF5
        72E7C1A058D24969375EF9F3E3D8D771101939F9D0D2355A25A995B7AC042185
        451FBAEBAC98387236A64DB91136073994C6A311413CA0E6966CCB02398B5B97
        BA20B458B9B932236156D0D3D78BE6162F4A1FFB0F2C21E7B4FBC89F51C64DD1
        10A658C08A48B042024BB4140DB9CCC4021DABB9EC74A30717FE966C9B8DB15E
        DE23CCB5C6D018D9BCE329ECA8DF8594BC7C1824252D520B44C82912CB050D94
        1B062869EDAAEB22B8EB096E2EBAFA3A6487D2763614C4832140A90AC8513038
        6F8B953B12AD4183E3276BF1931916BCB8AA1C462A2EF77FFB01813D468A512C
        D5EAF9D897C11005169F6829282831B17E648A3908ECA1051B319AC01CEE1E7E
        B129D644F1EA05FCA1EABF903438170656D2B3B497E57AAC50845282B0DA4AAB
        C05296EB717B60ADEDC2D471F33069C26C52AE93CCF23887F32B41DCA449418C
        3F097A29160EAD933AD68D445187A2945C7476F5915332E1F61BEE42DEA0027A
        9E1E55B5C7F1A7435BD0DD6BA5CE35D29837E162DFF75D42C05716025B595861
        8E4FB014E415071573DA1D78F82606368167F0E6B804BC7F6033DEF8660BCC79
        7988A5D66B25194A07B50C0925B57A8DFC8255E239A008478F1D7DAD7D987DDD
        6250A58EEE3EC52CDBE40C25452880B6239E0235653E062F1596CDB8E6DA4958
        346711BADB6D888F4B26EF980A6B670715946EEAC9004ED51DC337278FC2E710
        116F8E87CBDCDC63F3B66F8A04332558F219181B6354B6389D04B66823AE1A3A
        91177D7BBFF9334A0FFD16869C2CC4D3A0E6435D29E3B508D554BCC4574B7B6A
        30CB017D2E011EBB17BD9D3D744C8379739662E2F819B2593691B7640EA53601
        DE5A3D7ADA1D387FFE0205EC363CBA660D9E7B7E03ACD61E4A707DFCD5DBE36B
        5662DFFEBD78F6D90D5429C4E2A39D3BF8BC5D4BF325A414EB3DB1458E8D41B0
        5904164F60B93985BC6CF191BB763B1C5871D38BB8E68AC9B8D8DA80956FDF86
        EE1411E9C919E42CE4B25E1FE6307805AC099922AF12A804F1BAE85E3D14DB7A
        BC7C9E8BA56BECADD49C994B284B9949A1C04AA1E0181ABE6D83D01847AABA71
        EEDC39B412D8CA55ABF0CCFAF5E875787967FB053F1E7AE01EFCFDD33DF8FDEF
        5F849954FAAEF2245C0E17BEFEFA1B240DD1790D436CBF8B003319CD969C9C02
        135453743AB172D18B184BF5584F5F37DEDDFF0A76531AE3F6B14C409E126799
        B946AB51E7C9F9F45270B689D5610C84CA10BF971A45FB2C7B6085A1CFE3A5B8
        A4C582798B317DCA02AAE79CF8FC932FD15ED50BDB2507AAABABA9D06DC32A02
        5B4F601EBFC4AD86EA2DDCF38B65D8B367375E7AA914C92949282B7B957B468F
        C783ECE1F11E4F7AF3C6FE60D9053C0966BDE3A2AC7AE5A2177065F1442AB95D
        7CC07E75F2004ED79EE4E94EF45456F85B5F65124D7E7D06F9CDA79C30C7223B
        6D300CE4C9D8EBB2AAE64370E8BA307ECC647454DB51FBED45B43775E1F499D3
        1CECB1C71EC3BA75EB82F76745EB9D77FC14BB76EE42F996AD484B49C3EF363E
        4F69550CA9E9436689C9E3CD08075B55546134C65BB2B3724DF2D4AB002F0DD0
        4716BF8CD14513C9DDF7F03741EAAB2ED6583EC9274666DEE11540E87DBBB2AB
        092E44E0FB2CFF73523974F0C42E1CADFE14CE0E01524F2C9C64B25567AAD0DE
        DE0E8B6519D6AE7D026CCE8E4DFD0AD4B643070FA1A1AE01E3AEBE068D8DF578
        EF9DB7608831C0EDF52273A831126C3681C5C5992C5999B926D6C74C310F81AD
        5AF20A29362118A0F96B676562207ADD4BE4F287E8DDD00C9E3AABC6AE67F55C
        ACC188AE1E2B3ED9F321CE9FFD9EC28C1D5E6AA497CC9565382929C97CEA58F0
        09540209141B0D7C7AAA8F1288EE2E1BFDCE4D8A19F8D8CD2C8EF3780602CBCC
        C8E1638C55ACECE6AB96BC8C51648A0E772FC2E76AA57E00FF04AAFF26E263A0
        7CE9EB634770E4AB2F5057574B8DD72335358D7B423676E4544E9EC0E713FBCA
        120B3666D99BAB8EF60ED828EE665FC6C6D8C570B062028BB364A6E570531428
        400BD463AB6E7E05A3982992629AB05135A05AFD8E45A9F50350EAE7F8D1AF70
        F4F0619C3E7D0ACB962DC3E2C58B5945CC136F4DC452A0D09A1DE6B8F404565E
        568EB7DE7E1B43C7650D00166BB4A4A5672A8A09F0797D58FD93573192C09C54
        1147179AC1664BFD9B2C459EFCA750ECA40A56595989952B1FC1FCF9F3F1AF7E
        B6546C2667B20525E3060D041667494BCB92D779501C6336FDD41DDB28091E4B
        CE43082EF3096DFE9112120610F107A918FF975F7C862FBE388093274EE0E187
        5770C5FED54F696929B66EDF4A60D9FDC16219584ABA49E2EFE065C56E9D7A1F
        86E58D268FE30BAEF5FAC766177920E2F840EBBBC214ADAE3C8B53272A517DE6
        2C56AC78F44782BD866DDBB7A378EC20F28A516031317196D4943493FAEE90CD
        4AFA2836682216834921B081E69A83AE2F7AEA56E2F368F24754F6C3430255E3
        DE5CC0664647930DAB1EFD7160AFBDB6095BB76DC3B0F1D9D15E91C00C719694
        E454933A4127AFAAF1732F149C4417C5D084B8B2D4475D9AA482F03550614B21
        E4594A79954A64A784BD3F21B024DF10A027019D4DDD58BD7ACD8F02DBF41A53
        8CC09829F6572CD6929C946A52A1784E04284B86D477896208521A082C04143E
        8BA99A5DFF39E6D058648AF93B8D686DECC0136B9FFC71609B36A1B4BC0C2327
        15787C992D11606F1862622CC989A97A4959BB04490CAD0C50D744C9A4C1C52C
        7C25C70F82A8C7C320422C1150ECFF046F1EE23C19B0773AC9DDDF8D254B96FC
        CB60E565A5F8DBC71F23264BF079D39B5F20B0F51CECFAD525F750ACB85FABD5
        5DCEED8625B3923CB1DD6F212682AB1294B54F03658D50B294C8B51BD1E7C38F
        1398C1E8C9D4DBBB5C9A65775938983C0CFEF1874DD39611D8EEDD7B20C6BB2E
        6A86B42D27B0BD2A5831FD6626D56257D35608CFEB82795E18D5C04B64FF779F
        0C43618EDE9590DFD2D0913672E4C840616121CF7ED400CD52A9811EC7D2B2AA
        AA2A4D4DCD055D7C4AEC4E777AC3D304D6A3F9BFB2D8F9C5175E2AEEEEEA1C75
        BAAAAA303737D7979595C5532A15CC68343275587B43CB59343CF3909A9A9AB4
        1D1DED06B3D97CF4DD77FFF3303BF93F7B2DC085A752CE580000000049454E44
        AE426082}
      Visible = False
    end
    object IPreview: TImage
      Left = 309
      Top = 11
      Width = 64
      Height = 64
      Cursor = crHandPoint
      AutoSize = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000004000
        0000400806000000AA6971DE000000097048597300000B1300000B1301009A9C
        1800000A4F6943435050686F746F73686F70204943432070726F66696C650000
        78DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A
        2109104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807
        E421A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C008
        0C9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173
        FD230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA4299
        5C01808401C07491384B08801400407A8E42A600404601809D98265300A00400
        60CB6362E300502D0060277FE6D300809DF8997B01005B94211501A091002013
        65884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0
        B700C0CE100BB200080C00305188852900047B0060C8232378008499001446F2
        573CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE4917
        2B14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE
        0EAECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C
        2FB31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370
        F87E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E
        3CFCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FC
        B70BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525
        D2FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F7
        0000F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E
        44242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC60
        36844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C0
        51688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA88
        01628A58238E08179985F821C14804128B2420C9881451224B91354831528A54
        2055481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB5
        43B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA
        8F3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB0
        56AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A8
        201C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C
        23D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E52
        23E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE4
        21F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52
        DDA8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D3
        1A681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D8615
        83C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F
        996F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB
        548FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67
        A86F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C21
        6B0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B3
        52F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB9
        31655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C7
        4A275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB44
        77BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C58
        06B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E1
        8491B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4D
        EE9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79B
        DFB7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB3
        46AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D8
        06DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB
        1D5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B6
        13CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8
        BDE44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F29
        9E593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F
        9157ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7
        C8B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02
        FBF87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8
        EC90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C278587855786
        3F8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A
        3EAA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBE
        DFFCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A9640
        4C884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D843
        5C2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B
        3A9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC65
        85B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B267
        655766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5
        864B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD5
        4FABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED
        5D4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCA
        BF99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB4
        0DDF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54
        A454F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BE
        DB5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D2
        03FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D
        558D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F
        6A429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C5979
        4AF354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A
        0F6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F
        6DEA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDD
        F4BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD977
        27EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47
        F7068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA7
        43CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7C
        A5FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4F
        E47C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB00000004
        67414D410000B18E7CFB5193000019E24944415478DACD5B09705CD595BDBD6F
        EA6E49AD7DDF25CB9B8C771B6FD8D806B3180890E0A44866A6B24C261B068C31
        5E429854122A7B2A55A9908421336432934C48022113308140260683B558C636
        B6256B576B975AAD56B7BAFBCFB9EFBFDF6AB5245B965C35D3E5E7DFCBEFDFEF
        9E7BEEB9F7BEF7A5A3B93F74D770EEFF9787127BA228339E3017A37472E8E5D0
        9EEBF6ECD953413A9DE16A17D1E974FA85D9A19B32D3D97E4FAFD72BF82DC560
        3044AD562B399D4E93C562099E3B77EEC2CB2FBF3C361F00F873831C460C933C
        1A56AD5A55F1F5A79F7ED09EE4FE7BBD4E189930F8CBEA9160BF38E868F27DCD
        289D4E9D847C5F0236E548B1EF683396D78D4D7212205DDCBB269389C2E189C8
        33CF3CF3BDA79E7AEAA16B0540F3341B6CC6B0C961E5D7CFFFFB2FF7AF5CBBE1
        C170384C06BD9ED1879D3AD26366FC9C8FEA6BBD30447B1D7B3EE3904052E26B
        0D280D505D0CD0493034D06290C48873E6CC99C0E2C58BEDF301C0280DE62FBB
        30DC18490CC4333F7DF6531BB76CBB53894661B03454AFBB46C3130D9EFA1E4D
        03209E1D538D9FC28E38CB4C46239D6E6C1C5FBA6489ED5A01D04BCF3BA4E1E9
        72A46238BFFDDDEFDFBBE78EBD5BA23100120CD74F1A9568B87E2610E2689FE8
        E9E9C6CFECED44E3F995D168A0BA868640CDB2657362802EEE6890DE67E33D18
        39723008EEA7BFF9ADDD777DE8FE1A251A81E17A497DCD28FD0C9E8FD389193D
        2E0D8D37761A0057A77CDC2B527030190C545FDF1058BEFCEA00C42BBDE67DA6
        7B725555D5BAC79F38FC9181C1415B6F4FAF7960A0DFB479D366CFAA75EB0BE6
        45F9C4388FF77882D1F3325EA7E63F1DFE6306CC0500CD78F6BA491ACF5F7032
        E5BFFF831FEEBFF9D6DBEF86A2D2D8D8180DF4F5D2E24555148A44E3A83FBBC0
        69EF9178AE517836A1D38088CF0A09F19E606CA2D7491ACF0F01004260F9B2AB
        03A0A9BD557A9E452F99E9FFB5AF7FE393B7DF73DF2D84781F1BF3533F005852
        5D4D61BCD649CFF3A48CA09BC9641680B038221FABD921CECBEAF944AC1D46A3
        519DB43C57038C334B545C7B066F5FCD78258ED6724E0D0060D95500D04BCF6B
        6A9F2AE35E8C635F7EF2FE0F7FECE39B09F1EEF78F01801E5A5CBD88400075D2
        3098D5B6C7EB45CA69A48CCC4C4A4B4BA3C1C1418A709A642060383368626282
        929C4E4A4949C175FA847E783CA9343C384451254AE381712A2B2BA5CCAC2C8A
        44A2938217F7DF95281F6F9910B26B00C01A677C164636A982E739F4C4E15B3E
        FE0F9F5AC982E74708F4F5F6881088281AA5F56400D5464746A8B1B1913A3ADA
        A9B4B4942E373793D56623BBDD46DEEE6E4A4E4EA1603048A8CEA8A4A418E79E
        06A30294975F402D2D6DD48573F83A7B6EBD958A0A0B057DAD38D76236E17DA3
        00716A457865E3E91A003048EFB3E26762E461E44B203C8F1E38B8E9D39FFDDC
        E2A860805F00500D00A23419E36ABC19C96C368B8B466321A0C6BB5E86051FC7
        E0E54E6F2FF50F8E901FCF95A8224031C35066123305C5BBB836175936AB99DC
        4E0725BB92884B5C83C1283E8BC274F1DB8A5AEB8BD0E3639C817305C0280148
        959E2F92839F7B1E7EF4D135FFF4F987CA34007A7BBC02002556E2AAD55F08DE
        8D4422940A4A475920E3E29F67E9F3F9E8526B07B574F408AF252314D8308BC5
        4C669311930593F42A687A835E7C8F0D0A216C82C1096293F9FC14B75330CB02
        B043A109329A544038BCCC287F197CB5F9D1896BCE1500878CF95C8C628C1252
        F3BE67FFC38FACF8C2430F176B0070AC3300247B1CF68209DE6B6D69A1E3AFBE
        2ABC54515141972E5D1220B071A38110D9DC19A483F7323C296854EC62724618
        6CC4512F45D000E3553135C68451CB2261803B1E0CD1D0E000F94786E8E2850B
        303A24CE5BB26409D25D3DC2CD4EF7DE7B2F391C0E688A221834972CC00024C5
        01502A41C8150C78E4C0F22FEE7FB8281AD100E8A2455500406F88A5319E248B
        D61084AF0721C222C7CFD9F8F3CD6D74A9AD872ACBCB2835D925CEE558E7EF85
        4221F28FFA6914E21A180FD284EC2D6C560B25BBDD949D954669A9C942073854
        981913131184CF20F57577505E5E0E05F0DDB4F474712D9F6F94AAE01C0E4545
        03600E75C04C00C418F0C8A307967FE9E1470400A30C00C46A515525086088D5
        EBFC8317CE9FA7E3C78F0BA1636056AC5841B58D1F506A761165A5250B7A6A45
        5330388E2C31449D83A3D4331E26BF62A008AEC7938EC0AB91F1009942014A35
        E9290F202CA92AA7CAD20215082980C110535E0F46A50A06690FCE26F8273580
        01A80700CB1700C08103CBF73F7CA028C221303A0A45EF225487F8512347A9CA
        004C60786888C6E08DE1E12111D7EDDE41AA3FD74CE525051037B5266003C7A1
        FC177B06E972D848CECC2CAACACBA0923437A52759111200271C21AF2F401F74
        F5515DE3791A6ABD4C19FA085515E7D3960D2B292F3B43680C833936364E1680
        909A928C3034ABD64C2E8388F0583000071E3B58B3FF91470B59E018806E0140
        A55063A2C9E6847F8C996086B1A7CF5EA03FBCFE36E566A58B3010B4C760D53F
        D13D4CFD483C7BD72CA6DDCB2AC86D31AAB356B4D9EBB4CA873A8646E9A5FA0B
        74FC6423855B9BA8343D8576DDB481965695000415FC001867B7989066DD4244
        E3101073AA0300350B05E091038F15725133EA07005D00A0B252E4660D00BE10
        7BA0A1A11E754027B5F40590C3CDE474D8853156B3918213617A6B48A1DCDC4C
        FAC49A4ACA745A691CEF45A27186C77CA7A8DD1C286C36EAE9629F8F7EF26603
        35BFF336E51815BA6DE7665AB1B85CE80E7F93C5D09DE4A024889F76197E9F05
        B5AE0E00D42C0080C70E32000705007E00D02500A80000A61800EC614E57ED6D
        ADF45F2FBE4266571A65A77BC434EC1034AE117E79A685AA2A4AE9939B6B281C
        0A525896ADFC9922B38922AFC7298DC385577522486B66D0DD07F1FBC6AF5FA1
        EEC633549DE9A10FDDB19D8A2182ACF6A22D479A4C71BB8423340E5C37000E3C
        F678613812168ADDD5D541951595C8BFA6D845440AE3783B7D9A5EFECB29CA48
        4F432BAA1706647BDCF4665F9042B624FAD8CA5291E258B1F9FCC47E41910510
        0B59545162EF310846BC3F383E413F7DFD148D9DAE15DAF191BDBB44A1A463F3
        A15176AB4994DA3A592089F5808586C04106E0E021680042001AD0D5D9499595
        3300002FBD74FC4DAA7DBF9972A0DC9CB6723350E7EBCCF437BF916E5F5A40E9
        7678475678DA1A823E7EF12316026A7517C535A2F21889A89564F3F038BDF8EA
        5B6469F980766DDB401B572F959FF1351572BBC00266279E1BAF870630008F1D
        7A42D5000900173A4275B9E29221308ED4F5DCAFFF9B02484F4C7B1B34A0AC30
        975EE90D931BB9BC2637454CD22086BA5A237A707D7CA7A813F1AF35421A0061
        BC8EE039EBC868304C279ABDD4F3B737A834D541F7DFB9931C36AB040086A0F7
        B0D96DD72F040E3E7EA8E6E0A1432A0028343ABBC0808A72D1FA4A111046B4B4
        75D0BFFEE65572B91C82BA4510BB88D942CFD55EA29B562D250B8545DA844530
        5E2F52A31BC5CE186A0B376297330C7B3E2C3B46EE3CC701A61E400F23DD75F6
        F4937F3C84E7411A4465E9848E648D0DD09E9B375375799100CD6CE2060A6190
        94145B12ABADAB0BACA8A9993F008F1F3A54F3381810960CE8ECE8100C306B79
        5747C2AB27DE6BA097DF7847547B6CC94AA8F4D9D108BDDBE3A39AE21C522213
        A80F4CEABABA412796AB9253DC141A1F171DE3B8AC044318669B9D0686479025
        2234863E6002293880636F4F2FF04359AC335204E0B83A2ED2DA655574D3C655
        A20FE1FE80EB0297D325C28505F6BA008096380E807609802596AE987A2F1DFF
        2BBD5D7F4E746DDCD56DBC6109FDE62CDADCC00465253BC8012375D1308A1D1D
        6A753BC204B405104328A058602D569BA82E03810025B99CA2CE18621050FF47
        F01B81000042EE1FF1F949D11BC9078624F7B4D3D2A21CBA05B501D39D2B452B
        5890E44C12C6F33C6A6B01C08A0500708801387CA490A9C9007408069493192D
        AC58811102A6D07FFCFE556ABCD0220C7525D969030078EED4451A85C74C5178
        0BC0B03644D0EEE6E4648992976BFE81FE7E1CADA20DE6ACC1B16C0303980943
        43C3C2E30ADE1B1C1A214E765C29FA1106E3C8A3366F1B55A5BB4571C4D7E696
        DA2E42C0218490334E6D6D2D0058316F00D29E387C9819503005807209806480
        0E8AFBFC0B7FA23300C00E414A4B71D1BA954BE9C5363F858C1672D94C102AB3
        981C0F4E91EC29AE1A4D261643B5E363E5D73200C774187A1102B559FCC64330
        1C6130061DF08355234889C37527A8D861A2ED9BD79213A073BFE17258E104BB
        6893F9F5290070C33C0110DDE0610D0078C437EA8B01C08B183209880B31000D
        E79B04B519802DEB56D0EF5B7D140400C9760B3990A36D287B6D66F568E63A41
        0CB5AB14F500A9894500805A20148E0AE38338B20670E5E887E10CC03042C2D7
        70928A9D66DABC7EA5601E87803BC926428C19C08C780F00ACBC0600F2A4F153
        0078E2F091820991055400CAD1DA5A2CD6290CF8D54BAF090D6000D81BB76D5B
        0F0DE8A06E747B49663DD29315DE819710F73A142DAC151C021C0A3C798EFD09
        144846A3DA3572066006E8F17A0C4673E53838E283F1211A85F1634887E68E4B
        54999D2ED8C67467F625330082012A00A74E01801B1604C0919AC34700800801
        00D02E0180A11A035804FFF497B7E9E5D74FE2C7D5D2F7BEDD5BE895B397E944
        6B0F799CF008FA14A6BD13C6466174765686C8D9E348833939D9D47AF9B29851
        1831AEE7B5063043E10513B3151961184C88D0C8E89860C3080470686088CA0C
        61AA2E2BA2658BCAC53C5C887D95018E587376EAD4A9C0AA95372C0080232A00
        61D0CF2718D04EE565E562E547915537B7B1B58DE7E8B9DFBC22BA3F2E5EF66C
        5D4BBA2437FDF6BC97525D76B2C178935E21A7CD22748097B738238483E3E2FB
        BCDEC02B3ADC6471AFCFD4E7A577567B1FBAC820324058D1534F6F3FA190267F
        4F0FE5457C54515A4425F939A2504A47D9ED02D31800B15A8D5AA5B696015879
        CD00946A5980013872E46801ABB400A0BD9DCACA2500B25EE71FEBE9EDA31FFE
        FC051A45BFCF82C69ED9B6FE067AFA85D7C8ECC94026C0B49588301EBE45BDE0
        A6ACCC0CEAF776D30440E070B2D990415C6EEAF67AC98410E3CD17ABC3499DDD
        5ED14ADBDDA94203BA7B7BC9DCD74D2BF11BC54579003349146339191E8401C4
        D6EE1086690C58BD6A6E00A449AF4F01E0080370F4284280356084DA11026508
        011BF2B6587C94578942239EFBF51FA9F6EC45B4BF66117F0FDEB593CEF58ED0
        FF74F9C8693150465A2A59217C16E88001498DD3A585F3355E4FA0B2E3FEC18A
        143802A0C77865C9681642A8B7D8C807F5E7B81F8FEAA8BBE5327986BB291761
        9497938990E112D88E0E3459E800EB13CF4D0360CDEA55F307E0E8D1636A0830
        032042ED7121109521C0EBF25C799DAC6BA47FFBED7151197207B71A55DA9635
        CBE8993F9F22EF6880B23CC9A218D24742420BC2A17152005C6646BAA80578D7
        890B220758D0D4D48C4C0060A10345958B2982EA6F1499A07FD847E1A6F7A914
        C6A6A6A68835079E450E5AE414845A12BCCF2B54FC9E9606D72E088063C71002
        4704037C820100400B81E8E4EA0B8BD038BCF6EC7FFE01F5C065F1E30CCA0377
        EC201B6AF3DF9DE9207392935C6082CD8C9A1D5A6133F2AAB04E65019EB3AA72
        DCF3822BA7BC3154818110CA63BCC5850FF7014317DEA7F264ABA8F79D4EB5EF
        7020EE8B7233E07D8B6010919A4ACD5203D6AE593D7F008E1D63061C1585D008
        00E02C50CA212069A65D89BDCECB65AFBFF5369D3CD726D49C1F29C94EFAC43D
        B7501F18F0C6E521B2F0D6981D0591D908C30DA21E6031145D21AFFEE39A1388
        7D1E2180C1FDC0683042FD237E1AB97C81CADC6621725CE818450DA1A742345E
        A96E07D800EFF3028B5A4C888EB51621B06EED9A8501A06AC064089495964DC9
        023C7936B8A9A9895EFFF36B74B1DB47137AAB50765EADE1587DE08EED50F320
        BDD9D44321939572A0D869A8DAAC9205DADD587C45A6FE04BE37EC1FA7DED120
        44B18FA2FD9D5496E644056A5597CF0DEAFA1FAF0ABB6C46CAC9CE441B6C8F15
        523100C080F56BD72E1C004E83233204CA4A4BC5EE0CFF10D700FCD9305A653F
        EA84C60F9AE9ADF7CE0A011A02604220112A996929B477D726F240FDDF42C154
        DFD4469ECC2C4A4BB250A63B4914466C3D777EFD23A3D4DCE9A5F6AE1EA44F93
        580CCD867E0479590EADB1BAE546507F2795156523B398C9E972C5001425B542
        4288B917D8B06E81001C0500DC9CF84600405BBBD8C1E545075ED0E0BCFCE3E7
        5FA0B6CE1E94C04E1A45E5C7B999D7F1EBDFBF484DAD1DB125712B2A3F6E9256
        2DADA0317F809ABCFDC2502E6EB8BBE43547EE025970F52896F233D328333D55
        4CB56F6058EC2BEAD51D595147942305A6B81CA27E507F435D504D0460E3FA75
        D7230424001D2A03380EFBFAFAE99FBFFB13AA3D739E4A8A0AA8202F870A31CA
        4BF2A9B2389FFA0687E98FAF9FA0960EAF0811DEA8E0C9A5A5B869496529BC97
        83F2D8213286D81982F775B2BA642D1846EBDBD33F24D815DB70C5676950FFD2
        C26CF2B89DC278DE662769743C00BC655707006EDCB07EE10C98880B814A6401
        3F0A9EAF7CE7C774FAEC252A2F2DA45C94B3BC69918F5152902B163F7AFB8785
        F1DEBE01EAE8EE158688B09114E6ED6FA67E8A8B0DB18A159C4858DD03E4C12B
        CD62FBDDA0AE2172939397954E45799900311985935A8E87C0164D9055E3A702
        B069E386EB0740576707B99353E93B3F7E9EEACE7C00E38B518C64512E1B9FC3
        234B18E543DD7EEE52ABD8B4741A23E44635D8DC853236AA17E9526C9BCB1B2C
        5844D5F54283BA696A508F0679B40128DE2334EB239491EAA6FABA5342573815
        BA10FBDB77EC501751A5F86942A801B0F9C68DD70100162088DC99F7CFD22F7E
        F71A9DBDD80AE38BE0F9AC98E7F37355E30388552E58DAE17D8B2E24B6B493E1
        B111BC173158E8DCC516F2F60FA2E68F8849F37296DA54A9DE368BCECE26F2BA
        07E1920D1DE00DA4FE5E2F793C69E25EA5E19161B11CCEEB898BAAAB6362AB86
        00C5F615EAEA6A035B37DDB8700038A5B5B4B5D1D77EF02C5D6CE9449C17C53C
        CF001448E359A806864644EC7A7B072838EC458B6C24669003555A53D325B19B
        CB2B3D468B9DDA3ABA281DD9402719C0AD31EF6E8682010A8C8E505F8F175457
        579FECD08BBCBC3CDAB57BB7104BDE0B606D08064393D48FD7000050CF006CDE
        B47000BC3DBDF4D5EFFD84CE9C6FA6B29202189FAD1A0FDA17E44C37BE1331CF
        B1BF7575B5080B6E7078DB9C5326AF06F3E499F6FDFDFDA2B5D696D7B88FE775
        018E6BAE358278CEFB806C4C68228892D92E6EC21000F036701CE5E301E08292
        43A00121B06DEBE6F903F095279FACF9ECE73E5FF0E4377F440D672F88989F89
        F6F1C677A17069E9E8A6B5CBAB68E79675A2C5D572341F59F549EEFAB0200AEA
        0A1153623B429AA0114DE6767EF052196FD268DF89A77CE260301BEAEB02DBB7
        6E99FFA2E8E7BFF08565E694FCE253A7CF8B989F89F622E6138C5FB3AC9276DC
        B85A94A6AA319A2993CFB54A7AD2502576CF8F224F8C2F6C288EDE33515EE17B
        03E46751A9010CC08E6D5BE77F87487E717941D5EAED2B4A8AF2639E9F8DF66C
        7C2B846F350A9D1D9B570B9A2A4ACCECC95D7052660421D1684AC8EB2A40D341
        8826783E2ABFCB0CA80700BBB66F9B1F037081ECB4EC82AC3B3FFC772B62A92E
        5BA63AF774CFB7C2F3AB9656D2CD309E6FA0D00C980B03AE6CFCF4226726CA4F
        01222A43A0A13EB07BC74DB30220B6F667D0801293D95292955F5A7CEB3DFBD6
        CE85F6C278D0FEE64DB31B7F5D289F40FB44EF2BDA862AC2815786F92EB15B77
        6E9F15006EA9788F8B6F92E41B237949AC18C855E6162F5ABA7BEFFD37C5683F
        4BAA9B34BE42C43CDF379068F0BC292F8571268F47B5EF0931E4ED742DF6A331
        109801A7C180DB76DD3C2B00EC7DDE4AE5FB82F92649BE41B2A8A0AC7AE3EEBB
        1EB83B3F373B467B36DE3DA3E7BDA07D39627E4D2CE6AF647CBCD1533D3E73CC
        4F0981AB503E1A7B2F2AB2042FB1379EAE1FBBFD965D8ED900D06E8EE6F8E71B
        230B300A533CE94BB7EEBC6DF1ED7BEFAE9E56E1CDE0F99B6F5C23687F55CAC7
        D7EB33517E9AAA2B33C67D34C1E898E7E5BD048ABC6B84D978A6F174E0CE5B77
        CDCA0087A47F86A47FA16441D6BA8D5B96EFD8B9CBF3D18FEE2B88A77D2F1739
        309EDBDFD54C7B11F3A629749D49F167F37C220BA61A3EBBD24F355E3558DBA8
        88CACF1980F7DE3DE9BF77EF6D49B301C07F13C0F7086749C30B25101C0EEE7D
        1F7B70F1BE8FEE73572D5AEC9952E4B477D3B2AA42C4FC1A75015299C5F37122
        374DF494D83BB3E4F699953E1E8C98B7E5EB105AEADEFEBED85CF8FECD9FFFCB
        CF7EF4F3677FF6D9AB01A0DD245D2481C894EFDB1E3F74B8F29E0FEFCBF7F60D
        4ACF7BA93C3F83AA4B73519A86456596E8F1E9F97E2A081ADDAF140E53C192A0
        4427CFD1BCACBDCF779F9E7CE71DE5EB5F7DEA324E194559DD8C12FBF7BE9191
        17717EF76C00687F23A0658042A903D95218ED9FFECC672A1EF8F8278BCEA283
        EB450757B3A884D6DFB04494B35CD74765F515BB3F2F21FDCD4EFD0491939F47
        352D9821ED09969312BB1B349EFEBC1DF7D737DF8C7CF173FF781C57E8C27817
        E30D8C8B382F301B00162982BCEE94A38920A9F500D70549870F1F5EFCA587F6
        E7B7C3F37C07286703DEBBD34467D29039C67EDCF9F100D095E25D02A3C409DD
        64184425038CF4EEBB27C3FBEEBBE7007EA90DE302462BC608CE0BCF06005781
        B6381DD0C2A0400B83A3C78E2D3D866E50FB529C9D31AFCF98E6E24BD719BD4E
        578CF718C5A7C57D34CEF3EA6B1E7CBFC2C9B74F04EFBBFBCEEDF8B91E8C410C
        3F465051B4BB87A703A0FD859893262B410D000624C5E170788E7DF9CBA577DF
        757741542AFDD5629CE2637836E36375FDF47447092C8826A63B0D98A87C0D53
        1A4F37FCEAFBDFFED62F9A9B2F35B2D7A5F1BCE9185666F9EB69AD14E66AD021
        C320531AAFFDC5480AEB80C562B11BB49B836778CCF203CA1CCF9BF343C54D09
        41DE0398B80F4237A8D3EB7BCD66F380D56A1BECEEEAFC401ACF7F2C1D62E349
        54CBB3034034F947929A18B2006A7F2429845086CAFFF5838D884AC3D8BBC318
        FD18DDF2C894E78D0816BC09CDF82BE1FEBFA95BCF6294D63974000000004945
        4E44AE426082}
      OnClick = ACImprimirReporteExecute
    end
    object LPreview: TLabel
      Left = 306
      Top = 75
      Width = 69
      Height = 16
      Cursor = crHandPoint
      Caption = 'Vista Previa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = ACImprimirReporteExecute
    end
    object IAyuda: TImage
      Left = 16
      Top = 15
      Width = 42
      Height = 57
      AutoSize = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002A00
        00003908060000004081B96E000000097048597300000B1300000B1301009A9C
        1800000A4F6943435050686F746F73686F70204943432070726F66696C650000
        78DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A
        2109104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807
        E421A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C008
        0C9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173
        FD230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA4299
        5C01808401C07491384B08801400407A8E42A600404601809D98265300A00400
        60CB6362E300502D0060277FE6D300809DF8997B01005B94211501A091002013
        65884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0
        B700C0CE100BB200080C00305188852900047B0060C8232378008499001446F2
        573CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE4917
        2B14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE
        0EAECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C
        2FB31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370
        F87E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E
        3CFCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FC
        B70BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525
        D2FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F7
        0000F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E
        44242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC60
        36844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C0
        51688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA88
        01628A58238E08179985F821C14804128B2420C9881451224B91354831528A54
        2055481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB5
        43B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA
        8F3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB0
        56AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A8
        201C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C
        23D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E52
        23E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE4
        21F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52
        DDA8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D3
        1A681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D8615
        83C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F
        996F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB
        548FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67
        A86F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C21
        6B0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B3
        52F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB9
        31655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C7
        4A275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB44
        77BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C58
        06B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E1
        8491B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4D
        EE9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79B
        DFB7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB3
        46AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D8
        06DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB
        1D5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B6
        13CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8
        BDE44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F29
        9E593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F
        9157ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7
        C8B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02
        FBF87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8
        EC90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C278587855786
        3F8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A
        3EAA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBE
        DFFCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A9640
        4C884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D843
        5C2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B
        3A9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC65
        85B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B267
        655766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5
        864B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD5
        4FABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED
        5D4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCA
        BF99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB4
        0DDF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54
        A454F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BE
        DB5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D2
        03FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D
        558D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F
        6A429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C5979
        4AF354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A
        0F6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F
        6DEA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDD
        F4BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD977
        27EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47
        F7068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA7
        43CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7C
        A5FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4F
        E47C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB00000A86
        4944415478DAED9A7B7054D51DC7BFF7B59BCD66F322246B786D8220226A78A5
        C22206ADD84EB5CAF461B15A43EDC3569920C3945AB5A075FA506BB453F8A7B5
        60679CA95647D48AD5AA1BD4544134F888E1519B40851042C826BB9BECEE7D9C
        FECEBD77930DEC0D9B046198F6CEFCF67776F7DC733FF77B7EBFDF39371B8131
        86B3E110FE0FFA3F0B3AEA33EB82017AAD21BB98AC8AACD0F6A9A32DCDB69135
        E0D1C6B6D3075A17ACE5AF7466556A840BCB2A31A9A01417FA2B07BA1D0877E0
        40CF1134EEFF08484D1AC32E7A7D9480377F7EA07541AEDE2648080812B070F2
        2C2CBFE88BF8CA8C0528F2F82008D6503C94B819DC0C0386AEE3C5BD6FE3E57D
        3BF054730398419D745299E1DE910067075A175C4F70EBC41C01334B03F845CD
        77B168CA45B648C3C438C3401F6630B485DBB1FA958D78E7B34FC01274231AB6
        D0D72B08383C76D0BAE026AF1BB5F95E01DFBC6029D65E76CB20418AE7385696
        4E997648A20497E2C2D31FFF030F6C7B0CDDB1388E45190F872527831D1EB42E
        585FE2C1AA49050296CDFC32BE53BD7CA854E95869B4032179424561E625C7E5
        97E070B413F7BCF84B7C70F053EC3D76725867508AC9E21C84E6950AB8B47231
        AE9F7FE310E9D25B3C16759AC7743091D413F8F03C76191B02CF2F3AC53F1549
        3D81DB9EF83E9ADA3BB1BB9B3D42A0778C18D4B53AD87AE52404FC79455879F9
        DD5024978DC50628754385A6AB9438FAB01333089C1A815118C8A8386706FED5
        D18207B6FE14AFFE07E84EA0C2A9846506A51234A7149B668F07965EB01C33FC
        73062019A5ADC134CA666DA07B241EC6BE23BB7030BCDF7C3FA1700ACE290898
        36DCE1767930A1642A36BFF16B3CFFC94E6C3B685682F523017DF67BB3D8757E
        5F01AE9DBD923A897C82EDA91D1A774D075EC59EF61D66FB40C406A0F255964B
        963F05D59557C3EB2E70842DF2F9D1D97B004FEF78080FBF2FEC22D0D9D981D6
        050B0305E8BE79968169650B31DD1F74BC48DBD1F7D07CF07584F60BD8D92134
        F4A9781CD64A54559E87BAABA7B24065713E164FBF19B2E4761C675CFE243CD1
        B8067FFA5043DB7D8D19C5CB045A7355A5115A5AC93037F06DE4E594661C5CA7
        44D8FEE963F8DBBE245E6915579C50BCE98627E5B3A655D54620507209A6942C
        70042DC8F5E3F5E687F0C7A62EBC7B48984D63EDCA0674FD9A05DABAF34A18E6
        55AC741CBC2BD282E643AFE2EE90D21079B07149C64E54DEEE59ACAD9A317E1C
        664E58EE3896C755849DFFDE80273FEEC60B7B255EA61AB201AD5FB7445D357F
        A29F54B8D671F08E9E46BCD9FA31EE0D298E09C06F9AC65A3773BC41A03F721C
        CB2D17605FC713D8FCDE21FCB559CE1A34F4726DACC6AD9C037FC1571D073FDC
        F33C5E68E9C46FDF722FA381B73880363D7343ACAAC8330EE5455F771C4B967C
        683DF23B6CD80E6CF944C97AEA43BFBF3656832C8EADBB156CDDE3CAA80057F3
        5B1727D6D505E394F573E123733A0441467BCF46DCB6C58BF7D76ECF3A996AE9
        35900DA87D6C3EA148D3FEE04BD3D5DABB2EEFA785A20845B957D1855C8E03A8
        FA111CEBFB3BAEDEECDBD5F39B7F66599EC672D405F91E75D30FAB93555F9BA5
        22D75D8171DEC50412031C765902ED1BBBA20DD8F9D951AC79C933C2823F3AC8
        DAB23C567FFB02B5704E792EA696DD004928A4DDD147C39E96D48EA12BB61DEB
        5E73853F68172B9C3626A70694A67AEE04A3F6D66A1DFEFC895830ED3E74F5B6
        A03DBC7DD8D3B8D25DD15DD8BA97E1CF4DD28AE136D2630725C8859359ED2D73
        759417CEC3AC8937E1E0B1EDA4E4BE614FEB57BBD01BDF8FB7F61B78EC3D89C7
        F98AE1FA8F0DB42EB8EA0B1359FD4D550626175F828A92CBB0BFEB1DF427BB86
        3D2D96EC4434D18197F60978718FE85C874F09283D85167BD074E7625638CE1B
        4065C922AAAD2D88AB3D8EA7D0BE8B546C476FA21FCF3423FCC161E18E6C9F9B
        C602BA6AD9F9A89F3FD18D69B48E47E24710D77A1DBBAB7A92008FA2A5D3C073
        BBD1104B9ACF4A6DD95E6E2CA0A1D50B859AB2BCF1C8CF194FA09D8E5DFBB518
        7AE2319A6A846931E353FDC8482F376AD0829F04BB57CC110A4B68E7A3D14E5F
        3732EFF2937A1C91441CCFEE666DED112CCBB43C7EAEA0E5772F62D79C27A030
        A7D884713AFAD43E6C6931DA3A62989DCD63F129072DBB6B11BBF25C1105AE3C
        C429FE321D3A3DB6B476ABD8D66AAC18CD5F474E0968C9CF16B14B031281E622
        AAC6332E90FC19ABE5884E6664DEB89C0ED0E23B17B1F993E593F67BF7808663
        BF7A6BCC0BCBA80750560743451EF1A4FDBAFB0DA80F3B3C019C0ED0D37D8C0E
        D4DACED58FE08C3B465B96C60A5A53E6134365F9279FFA8E5E031D9133954C04
        EA2F144357042A30B3688A63B7CEFE1EFC6577130E87CF20682129BA704239CE
        F7F99D4113513CDFBA17E133A9A8C72B862EA6E7F519DE62C76E4793FD78EDD0
        67E88F9D4150D12384CE2DCCC7D41C9F63B76E2D811D478F82C5B1447FF88D06
        513C794C8F18D4FCFBBB61F09F77448331895926735FFDC80F163777B73E37DE
        9B835225C771F098A1A1AD378AD925D396BD79FB06AAFA822E08D00481BC28EA
        DC8B826090372449CA1E54D334138A001566182EF22EDDF28A611024F7CC907F
        BCA5BEFAE9966D7F90DC3224C97975A2FE50E3495C3FF3F25B1FBD66E5BBA205
        A889A2A08982A892C2DC929617B84F0A82A84992681CAFBEA0EB3A574E267353
        DBA3EBA6CFA16D9B8BB70D5D4F83B5ECC1C627AB36EE7CEE7E88C2C0AF211941
        993935B87DDE753F5FBDF01B1F9A0A1224C1A812079438A09424351304979044
        EEA538B5E322FF8C6E80DE9BDB08219148E471404DE3A6E56ABAE6D1353D47E3
        B0BAEEB66F807B976DCAE31FBE72FE036F3F55976D7CAD5D70FD861B675DB147
        185491004C2513920594906439CE216549EA9765994CEAA3F7FDDC787F211A8D
        96AB9AE63521551334D782E6EA9AC681730C43779B0AA701F398254FB10B9A27
        26323B946C8DCDD8B35414795CA60013968AA2AD9E69FD26A42CF711689FAC90
        A7B6229B3EC64D08877BA672505555F334D36B5EDD84E5F07AAE6EAA3C14DA02
        D62D609E60869968434109D28A493B1ECDA91593E970A41A015AEAD94003608A
        22471559E13E262B4A54E8EE0E4F4F9A906A1E419AC6DB046AB74DB5BD29702D
        0D9CE2D7CDE3973133D924AEAA1DFACC8E472B06538004264B1C464A41456DA8
        98DD8E2A04A5F0367997A244F877F4594408F7F4547235D5A4EA23601F81F854
        CB73509FADB4E949F93C8DDF8C96BA19DD0C192B340C3757D512D39C7275603A
        4D30256681C8260807A2F791416F7E16E16D1787E5902E85B723A6A2B1585F29
        87E090E4F34D20B36DC2E55BC0E6773ED5BE09FE9D3D03F60DA96642F21A9B02
        E5896243A494E23011D3CBB6B7C052DFF52A2940C5024C9D4337DC27D045249A
        CA5C4B29D552CE56320534A8A21902DCE7F2B8D6353B6E0DAE28A3E432A44145
        ADC449CBE481F8B3CD5497948EDA379052DABA01FE9D24C7680C3E3383059FA0
        449DD74C2A4F04CEE1BCEA607C5AB1C993CB4A284FAA74D91540B657AED4D49B
        314AA6A5329D97218AD7B895402780F7292930AB2C25E8E6F4F4A29FB15A1384
        40B012258B622E00C640B61F5FA6F80A2653B6F3D56CC81A38509A382C2FEC02
        2FF07659226091279728C6ED62CF934D2360C79FAAB3DE94A4D67E32BECC8A04
        28999E3101A6C7716B1ED5512BFB295EADF59CAFEF04C7482963A41B94B3E77F
        4ACE16D0FF02C3F45F516127121B0000000049454E44AE426082}
      OnClick = AAyudaExecute
    end
    object LAyuda: TLabel
      Left = 20
      Top = 72
      Width = 37
      Height = 16
      Cursor = crHandPoint
      Caption = 'Ayuda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = AAyudaExecute
    end
    object Label45: TLabel
      Left = 131
      Top = 71
      Width = 97
      Height = 16
      Cursor = crHandPoint
      Caption = 'Exportar a Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object BBImprimirReporte: TBitBtn
      Left = 279
      Top = 122
      Width = 122
      Height = 32
      Caption = 'Vista Preliminar'
      TabOrder = 0
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF6C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF6C6A
        6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E8E8E8E8E8E8E8E8EFF00FFFF00FF
        FF00FFFF00FF8E8E8E8E8E8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6AB0ADAD9692938E
        8A8B6C6A6A6C6A6A817E7F6C6A6ADDDCDCD0CFCF6C6A6A6C6A6A6C6A6AFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E8E
        8EBEBEBEABABABA6A6A68E8E8E8E8E8E9D9D9D8E8E8EDADADAD2D2D28E8E8E8E
        8E8E8E8E8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF6C6A6AD5D4D4C6C4C4A19F9FA19F9FA19F9F8381825C5B5BBCBCBCCECE
        CECFCFCFD1D1D1D3D3D3CAC9C96C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF8E8E8ED6D6D6CCCCCCB4B4B4B4B4B4B4B4B49F9F9F
        828282C6C6C6D2D2D2D2D2D2D4D4D4D5D5D5CECECE8E8E8E8E8E8E8E8E8EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6AD8D7D7E0DEDEC0BFBFA19F9FA1
        9F9FA19F9F6260600000000000001616165D5D5DA9A9A9CACACACACACACACACA
        CACACAC1C0C06C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FF8E8E8ED7D7D7DCDC
        DCC8C8C8B4B4B4B4B4B4B4B4B4868686242424242424444444848484BABABACF
        CFCFCFCFCFCFCFCFCFCFCFC9C9C98E8E8E8E8E8E8E8E8EFF00FFFF00FF6C6A6A
        D3D3D3D4D3D3CFCFCF8C8A8A817F7F817F7F817F7F6C6A6A1414140808080000
        000000000000001616165D5D5DA9A9A9CACACACACACAB7B6B6B7B6B66C6A6AFF
        00FFFF00FF8E8E8ED5D5D5D5D5D5D2D2D29E9E9E9E9E9E9E9E9E9E9E9E8E8E8E
        424242333333242424242424242424444444848484BABABACFCFCFCFCFCFC2C2
        C2C2C2C28E8E8EFF00FF6C6A6ACACACACACACAC6C6C68E8C8CB8B5B5B6B4B4A1
        9F9FA19F9F9F9D9D9997979390918280805250502B2A2A080808000000000000
        161616646464817E7F6C6A6AFF00FFFF00FF8E8E8ECFCFCFCFCFCFCDCDCD9E9E
        9EC2C2C2C2C2C2B4B4B4B4B4B4B2B2B2AEAEAEAAAAAA9E9E9E7A7A7A59595933
        33332424242424244444448989899D9D9D8E8E8EFF00FFFF00FF6C6A6ACACACA
        C5C5C58E8C8CD7D4D4F7F6F6F6F4F4F2F0F0E0DEDECAC7C7B6B5B5A5A3A3A19F
        9FA19F9F9E9A9C9390916865662322230303031919199997976C6A6AFF00FFFF
        00FF8E8E8ECFCFCFCCCCCC9E9E9ED6D6D6EAEAEAEAEAEAE7E7E7DCDCDCCECECE
        C2C2C2B6B6B6B4B4B4B4B4B4B1B1B1AAAAAA8A8A8A5151512B2B2B484848AEAE
        AE8E8E8EFF00FFFF00FF6C6A6AC5C5C58E8C8CE7E6E6F7F6F6F7F6F6F6F4F4F2
        F0F0EEEDEDEAEAEAE7E6E6E3E2E2D4D3D3C2C1C1AFADADA19F9FA19F9F999797
        8280806C6A6A9F9D9D6C6A6AFF00FFFF00FF8E8E8ECCCCCC9E9E9EE1E1E1EAEA
        EAEAEAEAEAEAEAE7E7E7E5E5E5E3E3E3E1E1E1DEDEDED5D5D5CACACABDBDBDB4
        B4B4B4B4B4AEAEAE9E9E9E8E8E8EB2B2B28E8E8EFF00FFFF00FF6C6A6A8E8C8C
        EFEEEEF7F6F6F7F6F6F7F6F6F6F4F4D5D3D4867B7E958B8EC1BFBFDDDCDCE0E0
        E0DCDCDCD8D8D8D1D1D1C2C1C1B2B0B0A19F9F9C99996C6A6A6C6A6AFF00FFFF
        00FF8E8E8E9E9E9EE6E6E6EAEAEAEAEAEAEAEAEAEAEAEAD6D6D69E9E9EA9A9A9
        C9C9C9DADADADDDDDDDADADAD8D8D8D4D4D4CACACABFBFBFB4B4B4B0B0B08E8E
        8E8E8E8EFF00FFFF00FF6C6A6ACECBCCF7F6F6F7F6F6F7F6F6F7F6F6CFCBCCAF
        ACADADABAB9E989883797B75696B898081ABA5A6C7C6C6D5D5D5D1D1D1CECECE
        C9C7C7BBBABAA6A4A46C6A6AFF00FFFF00FF8E8E8ED1D1D1EAEAEAEAEAEAEAEA
        EAEAEAEAD1D1D1BDBDBDBCBCBCB0B0B09C9C9C919191A1A1A1B9B9B9CDCDCDD6
        D6D6D4D4D4D2D2D2CECECEC5C5C5B7B7B78E8E8EFF00FFFF00FFFF00FF6C6A6A
        6C6A6ACECBCCEDEBEBAFA4A56B5D5F766A6C83787A9C9697ACAAAAB2B0B0ABA7
        A9989192817778847A7D938C8EBFBFBFCBCBCBCACACAC0C0C06C6A6AFF00FFFF
        00FFFF00FF8E8E8E8E8E8ED1D1D1E4E4E4BABABA8989899292929C9C9CAEAEAE
        BBBBBBBFBFBFBABABAACACAC9A9A9A9D9D9DA9A9A9C8C8C8D0D0D0CFCFCFC9C9
        C98E8E8EFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6ABD8281AF8A737D
        5E516654566554576D5E626D5E62898081A09A9CAFACADB2B0B0A49FA0CAC9CA
        CBCBCBB7B6B66C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E8E8E8E8E
        8EB2B2B2A9A9A98A8A8A8383838383838A8A8A8A8A8AA1A1A1B2B2B2BDBDBDBF
        BFBFB5B5B5CECECED0D0D0C2C2C28E8E8EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFBD8281FFD4ABFFD0A1FFCB98D5A57BA1785C7B665F6050
        536656596F62658E8687CECCCCCFCFCFA5A4A46C6A6AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B2B2D6D6D6D2D2D2CFCFCFB8B8B8
        9C9C9C9090908080808484848C8C8CA4A4A4D1D1D1D2D2D2B6B6B68E8E8EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFD9B2FF
        D4A9FFCFA0FFCA97FFC68EFFC186FFBF81FFC084BD82816C6A6A6C6A6A6C6A6A
        6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFB2B2B2D8D8D8D5D5D5D2D2D2CECECECBCBCBC9C9C9C7C7C7C8C8C8B2B2B28E
        8E8E8E8E8E8E8E8E8E8E8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFBD8281FFDDBAFFD8B1FFD3A7FFCE9EFFCA96FFC58CFFC0
        84FFC084BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B2B2DADADAD7D7D7D4D4D4D1D1D1
        CECECECBCBCBC8C8C8C8C8C8B2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE5CBFFE1C2FF
        DCB8FFD7AFFFD3A6FFCE9DFFC995FFC48BBD8281FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B2
        B2E0E0E0DDDDDDDADADAD6D6D6D4D4D4D1D1D1CECECECACACAB2B2B2FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFEAD4FFE5CAFFE0C0FFDAB7FFD7ADFFD1A5FFCC9CFFC7
        92BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFB2B2B2E2E2E2DFDFDFDCDCDCDADADAD6D6D6
        D3D3D3D0D0D0CDCDCDB2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFEEDCFFE9D1FF
        E3C9FFE0BFFFDAB6FFD5ACFFD0A3F7C297BD8281FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B2
        B2E5E5E5E2E2E2DFDFDFDCDCDCD9D9D9D6D6D6D2D2D2CCCCCCB2B2B2FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFBD8281FFF7EEFFF2E3FFEDDAFFE7D0FFE3C7FFDEBDFFD9B4FFD4ABBD82
        81FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFB2B2B2EAEAEAE7E7E7E5E5E5E2E2E2DEDEDEDBDBDB
        D8D8D8D6D6D6B2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFFAF3FFFAF3FFF6EDFFF0E2FF
        EBD9FFE7CFFFE2C5FFDDBCF2C7A9BD8281FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B2B2ECECECECEC
        ECEAEAEAE7E7E7E4E4E4E1E1E1DEDEDEDBDBDBD1D1D1B2B2B2FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        BD8281BD8281BD8281BD8281FFF4EBFFF0E1FFEBD7FFE6CEFBDCC0BD8281FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFB2B2B2B2B2B2B2B2B2B2B2B2EAEAEAE6E6E6E3E3E3E1E1E1
        DBDBDBB2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD
        8281BD8281BD8281BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
    end
    object BBSalir: TBitBtn
      Left = 671
      Top = 114
      Width = 104
      Height = 32
      Anchors = [akTop, akRight]
      Caption = 'Salir'
      TabOrder = 1
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
        F1F1F1CFCFCFCACACACBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB
        CBCBCBCBCBCBCBCACACAD2D2D2F6F6F6FFFFFFFFFFFFFFFFFFD8D8D96466A24A
        4DC4494CC7494CC9494DCB494DCD494CCF484AD14649D34649D4464AD44649D4
        474AD44A4DD34E51C86E6E98E7E7E7FFFFFFF3F3F35556AD2526D60C0BC00808
        C60808CC0808D20403D70000DC0000E20000E80506EA151AED1F27EF2630F12D
        39F33746F84B59FE7173A0F9F9F9CDCDD21313C50000B10000BA0000C00000C5
        0000C91515D55252E56F6FEC6C6CEF5153ED191DE80810E71B25EA232FEC2937
        ED3446F73C47D1D5D5D8C5C5CC0101B40000B30000B90000BE0202C57C7CE4EE
        EEFCFFFFFFFFFFFFFFFFFFFFFFFFE4E4FD7075F1141EE9222EEC2B39ED3446F4
        2B38D6C7C7CCC6C6CC0000AF0000B20000B70707BEB5B5EEFFFFFFFEFEFDA7A7
        E96666E06A6AE4B5B5F1FFFFFFFFFFFF989DF61824EA2937ED3345F42A37D0C9
        C9CEC6C6CC0202AB0606B30000B47878DBFFFFFFEFEFF93D3DD20000CE0000D7
        0000DE0000DF5F62E6FCFCFDFFFFFF666EF11C2AEB3142F42835CBC9C9CDC6C6
        CB0808A81313B52020BDEAEAF9FFFFFF6868D70A0ACD1515D60B0BD90000DD00
        00E30000E27E80EBFFFFFFD1D3FB202DEB2C3CF32531C6C9C9CDC6C6CB0D0DA3
        1A1AB45858CCFFFFFFE2E2F62828CB2B2BD23030D83131DD2A2AE01717E30000
        E41E21E6FAFAFEFAFBFF3640ED2331F1212CC3C9C9CDC6C6CA13139F2525B66D
        6DD0FFFFFFD4D4F33030CB3737D13838D63636DA3A3AE04343E53535E82426E8
        EDEDFDFFFFFF3941EC1C27EF1E26C0C9C9CDC6C6CA17179B3535B85F5FC8FFFF
        FEEEEEFA4949CE3E3ED04E4ED8CBCBF5A8A8F04747E14B4BE76D6DEEFDFDFFF1
        F1FD2227E7151DED181EBDC9C9CDC6C6CA1C1C984646BC4545BCE0E0F1FFFFFF
        A2A2E53D3DCC6C6CDBFFFFFFECECFB5757E14E4EE3C1C1F6FFFFFFC9C9F4080A
        E40A0FEB1114BBC9C9CDC6C6CA2222975454BD4A4ABC8C8CD0FFFFFFFEFEFF9B
        9BE37070D9FFFFFFE7E7FA6767E0BDBDF3FFFFFFFAFAFB8A8AE85757EC0708E8
        0708B8C9C9CDC6C6C92828976161BF5E5EC05959BFB6B6DCFFFFFFE3E3F47C7C
        D8FFFFFFE2E2F89D9DE7FFFFFFFFFFFDA7A7E36F6FE58383EB5252EA0606B2C9
        C9CDC6C6C93131996D6DC16A6AC16B6BC56767C39494CC8383CC8686D8FFFFFF
        EAEAF98383D9BDBDE19F9FDB7A7ADF8484E58686E69090ED2929B1C9C9CDC5C5
        C841419D7979C27575C17777C57979C97575CA7676CD9494D9FFFFFFF0F0FB86
        86DA7F7FD88686DD8E8EE09090E19292E29E9EE94C4CB5C9C9CDCBCBCE6565B1
        8282C28080C38383C68585C98787CC8888CF9393D2E9E9F1D2D2E88F8FD79595
        DB9797DC9999DE9C9CDF9E9EDFA6A6E47878C3CFCFD3F1F1F17979B09B9BCF8A
        8AC38D8DC78F8FC99191CC9494CF9494D09595CE9797D19C9CD79E9ED9A1A1DA
        A3A3DBA5A5DBA7A7DCC9C9F29696B7F7F7F7FFFFFFC6C6CC9999C7BABAE2B9B9
        E1BCBCE3BFBFE6C1C1E8C5C5EAC7C7EDCACAEECDCDEFD0D0F1D2D2F2D4D4F3D7
        D7F4DDDDF7ADADCDD9D9DCFFFFFFFFFFFFFFFFFFDDDDE0B8B8C0B7B7BDB7B7BD
        B7B7BDB8B8BDB8B8BEB9B9BEB9B9BEB9B9BEBABABEBABABEBBBBBFBBBBBFBCBC
        C2EAEAEBFFFFFFFFFFFF}
    end
    object BBAyuda: TBitBtn
      Left = 8
      Top = 130
      Width = 32
      Height = 32
      Action = AAyuda
      TabOrder = 2
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC303030303030303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC30
        303030303000A0AB00A0AB00A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC30303030303000A0AB00A0
        AB00F2FF00F2FF00F2FF00A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9EC30303030303000A0AB00A0AB00F2FF00F2FF633600
        63360000A0AB00F2FF00A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9EC63360000A0AB00A0AB00F2FF00F2FF6336007F5B00D9A77DD9A77D63
        360000A0AB00F2FF00A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        63360000F2FF00F2FF6336007F5B00BC7200BC7200BC7200BC7200D9A77D6336
        0000A0AB00F2FF00A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9EC63360063
        3600633600BC7200BC7200BC720000F2FFBC7200BC7200BC7200D9A77D633600
        00A0AB00F2FF00A0AB303030D8E9ECD8E9ECD8E9ECD8E9EC6336007F5B00A376
        00BC7200BC7200BC720068F5FFBC7200BC7200BC7200BC7200D9A77D63360000
        A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FF9F2AD9A77D
        BC7200BC7200BC7200BC720000F2FF00F2FFBC7200BC7200D9A77D6336003030
        30D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FF9F2AD9A77DBC
        7200BC7200BC7200BC720068F5FF00F2FF00F2FFBC7200D9A77D303030D8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FFFF7FD9A77DBC72
        0068F5FFBC7200BC720000F2FF00F2FFBC7200BC7200D9A77D303030D8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FFFF7FD9A77DBC7200
        68F5FF00F2FF00F2FFBC7200D9A77DFF9F2A7F5B00633600D8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FFFF7FD9A77DBC7200BC
        7200D9A77DFF9F2A7F5B00633600D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FFFF7FFFFF7FFFFF7F7F5B
        00633600D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600633600633600D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9EC}
    end
    object BBXls: TBitBtn
      Left = 78
      Top = 130
      Width = 45
      Height = 32
      Enabled = False
      ParentShowHint = False
      
      TabOrder = 3
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        20000000000000090000000000000000000000000000000000002F7A4E002874
        49002E794D002D774C002C774C002A764B002A764A0029754900297449002773
        4700297348001B6E3F00116F3900005C27000059240000592400005823000059
        230000572200005A2500116F3A00146D3A00246F4400277247002D784D002874
        48722C774BB52D774DAD2F794EAF2D784DAF2D774DAF2C764CAF2C764CAF2A75
        4AAF2B754AAF257346AF1F7243AF166738AF146637AF146537AF146536AF1466
        37AF136536AF136637AF1F7243AD207143B52370446A24704500398257002E78
        4DB9388156FF2F7B4EFF257446FF247345FF227244FF207142FF1E6F40FF1F6E
        41FF136938FF4C7F62FF74837AFF9DB2A6FFA5B9AEFFA4B8ADFFA6B9AEFFA5B9
        AEFFA7BBAFFF9FB4A8FF6A7B71FF658773FF207143B0106A37003E865C00337C
        51AC357F54FB5D9574F790B49DFA8AAE96FB8AAE96FB8AAE96FB89AD95FB88AC
        95FB88B197FB829387FB6F686DFBFCF8FBFBFFFFFFFBFFFFFFFBFFFFFFFBFFFF
        FFFBFFFFFFFBFBF8FAFB685E64F765766CFB237546A311703A00438A60003780
        55AF307D50FF94B6A0FAFFFBFDFEF4EDEBFEF7EFEDFEF7EEEDFEF6EEECFEF3EC
        E9FEFFF9F7FEB1ADABFE545756FFF1F3F2FEFCFDFCFFFBFCFBFFFCFDFCFFFBFC
        FBFFFCFDFCFFEEF0F0FE565253FB5E7367FF247648A613713C00488D63003980
        56AF358154FF8DB29AFBF9F0EEFEF1ECE9FFF6F0EDFFF5EEECFFF4EFEBFFF2EB
        E9FFFFF9F6FFB2B1AFFF5A5C5CFFF3F2F2FFFEFEFEFFFDFDFDFFFEFEFEFFFDFD
        FDFFFEFEFEFFF0F1F1FF585455FB5F7368FF247647A614703B004B9066003B82
        59AF388457FF91B49CFBF9F1F0FEB3C3B5FFA1B5A4FFA4B7A6FFA3B6A5FFA2B4
        A4FFA6BBA8FF8B958CFF656466FFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF2F3F3FF595557FB5F7368FF257748A613703C004F936A003D84
        5AAF3B865AFF9ABAA5FBD6DCD4FE288037FF338D42FF308E48FF2F8F4CFF3092
        53FF238A49FF4E7A5FFF71696EFFE3E5E3FFF4F4F4FFF1F2F2FFF3F2F2FFEFEF
        EFFFF3F3F3FFE6E7E7FF565254FB607469FF257648A614723C0053976D003F86
        5CAF418B5EFF91B69EFBFCF7FAFE91B797FF399442FF4BA458FF45A35BFF46A6
        63FF3EAB64FF5D9070FF655C62FF636463FF666666FF646565FF606060FF6566
        65FF5A5A5AFF515151FF423D3FFB64786CFF237546A614723C00589B72004288
        5EAF468F62FF94B8A1FBFCF5F4FEF7F0F2FF84AF8DFF34913EFF479F55FF43A0
        59FF349B56FF6A9179FF595256FF242625FF9D9D9CFFD1D1D0FFC0C0BEFF7776
        75FF8D8A89FF454545FF3B3638FB667A6EFF237546A615733D005E9F7600448A
        61AF4A9366FF96B9A2FBFCF5F5FEECEBE7FFF7F0F2FF74A87FFF379541FF3892
        4AFF70B787FF95B19EFF484648FF181C1AFFC0C1BEFFFFFFFFFFE7E4E1FF3838
        38FF94918FFF5E5E5DFE3A3638FB63786BFF247648A617743F0062A47B00478C
        63AF50986BFF98BBA4FBFEF6F7FEECECE8FFEEEDE8FFF8F0F2FF629C6FFF6BAD
        7EFF8AD5A2FF639273FF4E3F4DFF181417FFC1B6B9FFFFFFFFFFE1D9D9FF2A2A
        2AFF7D7B7BFF606362FF3C3339FB6A7970FF247747A616743E0069A980004A8F
        65AF559C70FF9ABCA6FBFFF7F8FEECECE8FFF7F3F1FFD8DDD6FF92BFA1FF88CD
        9EFF3DA45EFF4C955EFF48724CFF2B5737FF78AA89FF8BB697FF869A87FFAEA9
        A8FFBBBAB7FFA8A4A3FE5D7165FB508365FF267548A61C7040006FAD85004E91
        68AF5BA175FF9CBEA8FBFDF6F7FEF8F4F2FFDAE0DBFF88BB99FF80CA98FF40A3
        60FF3F9E57FF46A252FF3A9549FF3DA25BFF36A45CFF2C9554FF0F5F2AFFAAB8
        A7FFFEF9F6FFFFF9F7FD83B092FB176C3BFF2D764BA62A74490074B28A005194
        6BAF61A57AFF9BBEA8FBFFFEFFFEDAE1DDFF8BBC9CFF81CA99FF42A462FF419F
        58FF46A051FF2E843DFF3D934CFF45A059FF41A15EFF45A767FF38995DFF1B5B
        2EFFC5C8BEFFFCF6F7FE7AA389FB237244FF2C764CA6297449007BB790005397
        6EAF67AA7FFFA3C4AFFBEAEFEDFE8DBF9FFF84CB9AFF45A764FF43A159FF3E9C
        4AFF388645FF94B19DFF4D9A59FF3B9A48FF46A25BFF42A460FF46A968FF2D8C
        51FF376943FFEBE8E5FE80AA90FB227244FF2C774CA629764A0082BD96005699
        70AF6EB085FFA0C2ADFB93BDA2FE6EBB87FF3A9C5BFF35954EFF3A9549FF4C93
        58FFB2C3B5FFFFFBFDFFC2D1C5FF489556FF38944AFF379751FF359955FF39A0
        60FF116B32FFAAB3A5FE8DB39BFB227243FF2F784DA62C774B008AC39C005B9C
        74AF76B68CFFA1C5AFFBD8E6DDFEBED4C6FFC1D5C8FFC2D5C7FFC3D4C7FFEAEA
        E8FFFCF6F6FFEDEBE8FFF8F2F2FFE3E5E1FFBED0C0FFBECFC0FFBDCFC0FFBBCD
        BEFFC0D1C3FFF5EEECFE82AA90FB287749FF30794EA62E784C0090CAA3005EA0
        77AF7DBC92FFA4C9B2FBFFFFFFFEFEFAFBFFFFFAFCFFFEF9FAFFFCF8F8FFF3F3
        F0FFEEEEEBFFEFEFECFFECECE9FFF1EEECFFF7F2F1FFF6F1F0FFF6F0EEFFF5EF
        EDFFF0ECE9FFF9F1EFFE81AA8FFB2B794BFF317A4FA62E794E0098CFA90063A3
        7AAF84C197FFA9CAB6FAFFFFFFFEFFFAFDFEFFFBFDFEFFFAFCFEFFF9FAFEFFF9
        FBFEFFF9FAFEFFF7F9FEFFF7F8FEFDF6F6FEFBF4F3FEFBF3F3FEFAF3F2FEF9F2
        F1FEF5F0EEFEFFFBFEFE8AAF96FA2D7B4DFF327B51A6307A4F009FD5AF0064A5
        7CAC94CDA5FB8ABC9CF7A3C8B1FAA3C7B0FBA0C5ADFB9EC3ACFB9CC1A9FB9BBF
        A8FB98BEA6FB97BBA4FB95BAA2FB93B8A0FB91B79FFB90B59DFB8FB49CFB8DB3
        9AFB8AB197FB8EB49CFA5B9572F7398357FB307A50A3317C5000A5DBB40066A7
        7DBA9FD6AFFF94CEA6FF86C49AFF81BF95FF7BBA8FFF74B58AFF6EB085FF69AB
        81FF64A77CFF5EA377FF599E73FF549A6FFF4F976BFF4B9367FF479064FF438D
        60FF408A5DFF3B865AFF40885DFF42895FFF2F7A4FB0327C520064A67D00468C
        626D61A37AAC5FA178A45FA078A75C9D75A7599B72A756996FA753966DA75094
        6BA74E9269A74B9066A7498E64A7478C63A7448A60A743895FA740875DA73F86
        5CA73D845AA73B8359A7367F55A4327C51AC2A754A652B764B00A7DDB60066A7
        7E00A0D7B00099D1AB0095CDA7008EC7A10089C29B0083BE96007DB9920077B5
        8E0073B088006EAC830069A8800063A47B005FA177005B9E7400579A71005297
        6E004F946B004D916800488D630042895F00317A4F00327C5100}
    end
  end
  inherited PTitulo: TPanel
    Width = 780
    Caption = 'Stock simple'
    inherited LTitulo: TLabel
      Width = 376
    end
    inherited PILeft: TPanel
      Left = 572
    end
  end
  inherited Psocalo: TPanel
    Top = 498
    Width = 780
    inherited JvSocalo: TJvImage
      Width = 780
    end
  end
  inherited ALUniversal: TActionList
    Left = 747
    Top = 6
    object ACSalir: TAction
      Category = 'General'
      Caption = 'Salir'
      ShortCut = 27
      OnExecute = ACSalirExecute
    end
    object ACImprimirReporte: TAction
      Category = 'Reportes'
      Caption = 'Vista Preliminar'
      OnExecute = ACImprimirReporteExecute
    end
  end
  inherited SDXLS: TSaveDialog
    Left = 390
    Top = 69
  end
  inherited DTXLS: TDataToXLS
    Left = 312
    Top = 73
  end
  object PopupMenu1: TPopupMenu
    Left = 715
    Top = 5
    object Salir1: TMenuItem
      Action = ACSalir
    end
  end
  object IBQSPStockSimple: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQSPStockSimpleAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from get_stock_simple(:esta, '#39'TODAY'#39')')
    Left = 680
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
        Value = '1'
      end>
  end
  object IBQAux: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from get_stock_simple(:esta, :fechaActual)')
    Left = 584
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftDate
        Name = 'fechaActual'
        ParamType = ptInput
      end>
  end
  object QRHTMLFilter1: TQRHTMLFilter
    Left = 380
    Top = 544
  end
end
