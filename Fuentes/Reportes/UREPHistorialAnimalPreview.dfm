inherited FREPHistorialAnimalPreview: TFREPHistorialAnimalPreview
  Left = 132
  Top = 55
  Caption = 'FREPHistorialAnimalPreview'
  ClientHeight = 742
  ClientWidth = 1028
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Top = 56
    Width = 1028
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
  inherited Image10: TImage
    Top = 280
  end
  inherited Image4: TImage
    Width = 644
  end
  object PageControl1: TPageControl [4]
    Left = 0
    Top = 65
    Width = 1028
    Height = 655
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Reporte1'
      object QRHistorialAnimal: TQuickRep
        Left = 0
        Top = 0
        Width = 794
        Height = 1123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        BeforePrint = QRListadaAnimalesBeforePrint
        DataSet = IBQConsultaEventos
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
          Top = 149
          Width = 718
          Height = 533
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            1410.229166666667000000
            1899.708333333333000000)
          BandType = rbTitle
          object LabelNacimiento: TQRLabel
            Left = 12
            Top = 40
            Width = 74
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              31.750000000000000000
              105.833333333333300000
              195.791666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Nacimiento: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelEdad: TQRLabel
            Left = 12
            Top = 112
            Width = 39
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              31.750000000000000000
              296.333333333333400000
              103.187500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Edad: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelRaza: TQRLabel
            Left = 12
            Top = 64
            Width = 39
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              31.750000000000000000
              169.333333333333300000
              103.187500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Raza: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelUbicacion: TQRLabel
            Left = 12
            Top = 158
            Width = 66
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              31.750000000000000000
              418.041666666666700000
              174.625000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Ubicaci'#243'n: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelGrupos: TQRLabel
            Left = 12
            Top = 179
            Width = 104
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              31.750000000000000000
              473.604166666666700000
              275.166666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Grupos actuales: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelPeso: TQRLabel
            Left = 12
            Top = 88
            Width = 126
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              31.750000000000000000
              232.833333333333400000
              333.375000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Peso de Nacimiento: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelCondCorporal: TQRLabel
            Left = 12
            Top = 136
            Width = 116
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              31.750000000000000000
              359.833333333333400000
              306.916666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Condici'#243'n corporal: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLEdad: TQRLabel
            Left = 55
            Top = 112
            Width = 281
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              145.520833333333300000
              296.333333333333400000
              743.479166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLEdad'
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
          object QRLUbicacion: TQRLabel
            Left = 81
            Top = 158
            Width = 633
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              214.312500000000000000
              418.041666666666700000
              1674.812500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLUbicacion'
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
          object QRLGrupos: TQRLabel
            Left = 119
            Top = 179
            Width = 595
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              314.854166666666700000
              473.604166666666700000
              1574.270833333333000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLGrupos'
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
          object QRDBTCondicionCorporal: TQRDBText
            Left = 132
            Top = 136
            Width = 204
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              349.250000000000000000
              359.833333333333400000
              539.750000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQAnimales
            DataField = 'CONDICION_CORPORAL'
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
          object QRLRaza: TQRLabel
            Left = 60
            Top = 64
            Width = 277
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              158.750000000000000000
              169.333333333333300000
              732.895833333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLRaza'
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
          object QRLFechaNacimiento: TQRLabel
            Left = 90
            Top = 40
            Width = 65
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              238.125000000000000000
              105.833333333333300000
              171.979166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '10/10/2007'
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
          object QRShape1: TQRShape
            Left = 14
            Top = 355
            Width = 319
            Height = 75
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              198.437500000000000000
              37.041666666666670000
              939.270833333333400000
              844.020833333333500000)
            Shape = qrsRectangle
          end
          object QRShape2: TQRShape
            Left = 347
            Top = 449
            Width = 319
            Height = 75
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              198.437500000000000000
              918.104166666666800000
              1187.979166666667000000
              844.020833333333500000)
            Shape = qrsRectangle
          end
          object QRShape3: TQRShape
            Left = 348
            Top = 266
            Width = 319
            Height = 75
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              198.437500000000000000
              920.750000000000000000
              703.791666666666800000
              844.020833333333500000)
            Shape = qrsRectangle
          end
          object LabelArbolGenealogicoReducido: TQRLabel
            Left = 12
            Top = 210
            Width = 155
            Height = 24
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              63.500000000000000000
              31.750000000000000000
              555.625000000000000000
              410.104166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Datos Biogr'#225'ficos'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 14
          end
          object LabelAnimal: TQRLabel
            Left = 16
            Top = 335
            Width = 41
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              42.333333333333340000
              886.354166666666700000
              108.479166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Animal'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLArbolRP_animal: TQRLabel
            Left = 82
            Top = 357
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              216.958333333333400000
              944.562500000000000000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'RP_animal'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLArbolNombre: TQRLabel
            Left = 82
            Top = 391
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              216.958333333333400000
              1034.520833333333000000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Nombre'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelMadre: TQRLabel
            Left = 347
            Top = 431
            Width = 37
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              918.104166666666700000
              1140.354166666667000000
              97.895833333333340000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Madre'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelPadre: TQRLabel
            Left = 347
            Top = 247
            Width = 35
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              918.104166666666700000
              653.520833333333400000
              92.604166666666670000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Padre'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRArbolRP_animal_M: TQRLabel
            Left = 415
            Top = 452
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1098.020833333333000000
              1195.916666666667000000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'RP_madre'
            Color = clWhite
            OnPrint = QRArbolRP_animal_MPrint
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLArbolNombre_M: TQRLabel
            Left = 415
            Top = 486
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1098.020833333333000000
              1285.875000000000000000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Nombre padre'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRArbolRaza: TQRLabel
            Left = 82
            Top = 408
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              216.958333333333400000
              1079.500000000000000000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Raza'
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
          object QRArbolRP_animal_P: TQRLabel
            Left = 416
            Top = 269
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1100.666666666667000000
              711.729166666666800000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'RP_padre'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLArbolNombre_P: TQRLabel
            Left = 416
            Top = 302
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1100.666666666667000000
              799.041666666666800000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Nombre padre'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLArbolRaza_M: TQRLabel
            Left = 415
            Top = 503
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1098.020833333333000000
              1330.854166666667000000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Raza'
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
          object QRLArbolRaza_P: TQRLabel
            Left = 416
            Top = 319
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1100.666666666667000000
              844.020833333333500000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Raza'
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
          object QRShape8: TQRShape
            Left = 0
            Top = 197
            Width = 718
            Height = 14
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              37.041666666666670000
              0.000000000000000000
              521.229166666666800000
              1899.708333333333000000)
            Shape = qrsHorLine
          end
          object LabelRP: TQRLabel
            Left = 488
            Top = 4
            Width = 38
            Height = 23
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              60.854166666666670000
              1291.166666666667000000
              10.583333333333330000
              100.541666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'RP: '
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
          object QRLRP: TQRLabel
            Left = 529
            Top = 4
            Width = 116
            Height = 24
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              63.500000000000000000
              1399.645833333333000000
              10.583333333333330000
              306.916666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'RP_ANIMAL '
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
          object QRLPesoNacimiento: TQRLabel
            Left = 141
            Top = 88
            Width = 195
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              373.062500000000000000
              232.833333333333400000
              515.937500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLPesoNacimiento'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = QRLPesoNacimientoPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabelTituloEstadoActual: TQRLabel
            Left = 10
            Top = 4
            Width = 179
            Height = 24
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              63.500000000000000000
              26.458333333333330000
              10.583333333333330000
              473.604166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Informaci'#243'n General'
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
          object QRShape4: TQRShape
            Left = 0
            Top = 26
            Width = 718
            Height = 7
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              18.520833333333330000
              0.000000000000000000
              68.791666666666680000
              1899.708333333333000000)
            Shape = qrsHorLine
          end
          object QRShape5: TQRShape
            Left = 337
            Top = 40
            Width = 11
            Height = 113
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              298.979166666666700000
              891.645833333333200000
              105.833333333333300000
              29.104166666666670000)
            Shape = qrsVertLine
          end
          object LabelEstadoRepro: TQRLabel
            Left = 352
            Top = 64
            Width = 128
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              931.333333333333500000
              169.333333333333300000
              338.666666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Estado Reproductivo: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLEstadoRepro: TQRLabel
            Left = 488
            Top = 64
            Width = 226
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1291.166666666667000000
              169.333333333333300000
              597.958333333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLEstadoRepro'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = QRLEstadoReproPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelEstadoUltimoMes: TQRLabel
            Left = 352
            Top = 40
            Width = 118
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              931.333333333333500000
              105.833333333333300000
              312.208333333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Estado '#250'ltimo mes: '
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
          object QRLEstadoUltimoMes: TQRLabel
            Left = 478
            Top = 40
            Width = 236
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1264.708333333333000000
              105.833333333333300000
              624.416666666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLEstadoUltimoMes(!!!!!!!!)'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object LabelCategoria: TQRLabel
            Left = 352
            Top = 112
            Width = 64
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              931.333333333333500000
              296.333333333333400000
              169.333333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Categor'#237'a: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabelCategoria: TQRLabel
            Left = 424
            Top = 112
            Width = 290
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1121.833333333333000000
              296.333333333333400000
              767.291666666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLabelCategoria'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = QRLabelCategoriaPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelGeneaRPM: TQRLabel
            Left = 382
            Top = 452
            Width = 24
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1010.708333333333000000
              1195.916666666667000000
              63.500000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'RP: '
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
          object LabelGeneaAlterM: TQRLabel
            Left = 356
            Top = 469
            Width = 53
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              941.916666666666700000
              1240.895833333333000000
              140.229166666666700000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Senasa: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelGeneaNombreM: TQRLabel
            Left = 355
            Top = 486
            Width = 52
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              939.270833333333400000
              1285.875000000000000000
              137.583333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Nombre: '
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
          object LabelGeneaRazaM: TQRLabel
            Left = 377
            Top = 503
            Width = 35
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              997.479166666666900000
              1330.854166666667000000
              92.604166666666680000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Raza: '
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
          object QRLArbolAlter_M: TQRLabel
            Left = 415
            Top = 469
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1098.020833333333000000
              1240.895833333333000000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Id_Aternativo'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelGeneaRPP: TQRLabel
            Left = 383
            Top = 268
            Width = 24
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1013.354166666667000000
              709.083333333333300000
              63.500000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'RP: '
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
          object LabelGeneaAlterP: TQRLabel
            Left = 357
            Top = 285
            Width = 53
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              944.562500000000000000
              754.062500000000000000
              140.229166666666700000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Senasa: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelGeneaNombreP: TQRLabel
            Left = 356
            Top = 302
            Width = 52
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              941.916666666666700000
              799.041666666666700000
              137.583333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Nombre: '
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
          object LabelGeneaRazaP: TQRLabel
            Left = 378
            Top = 319
            Width = 35
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1000.125000000000000000
              844.020833333333500000
              92.604166666666670000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Raza: '
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
          object QRLArbolAlter_P: TQRLabel
            Left = 416
            Top = 285
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              1100.666666666667000000
              754.062500000000000000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Id_Aternativo'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLArbolAlter_Animal: TQRLabel
            Left = 82
            Top = 374
            Width = 245
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              216.958333333333400000
              989.541666666666800000
              648.229166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Id_Aternativo'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelGeneaRPAnimal: TQRLabel
            Left = 50
            Top = 357
            Width = 24
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              132.291666666666700000
              944.562500000000000000
              63.500000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'RP: '
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
          object LabelGeneaAlterAnimal: TQRLabel
            Left = 24
            Top = 374
            Width = 53
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              63.500000000000000000
              989.541666666666700000
              140.229166666666700000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Senasa: '
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
          object LabelGeneaNombreAnimal: TQRLabel
            Left = 23
            Top = 391
            Width = 52
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              60.854166666666670000
              1034.520833333333000000
              137.583333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Nombre: '
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
          object LabelGeneaRazaAnimal: TQRLabel
            Left = 45
            Top = 408
            Width = 35
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625000000000000000
              119.062500000000000000
              1079.500000000000000000
              92.604166666666680000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Raza: '
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
          object QRShape6: TQRShape
            Left = 0
            Top = 234
            Width = 718
            Height = 14
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              37.041666666666670000
              0.000000000000000000
              619.125000000000000000
              1899.708333333333000000)
            Shape = qrsHorLine
          end
          object QRLabel11: TQRLabel
            Left = 352
            Top = 88
            Width = 122
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              931.333333333333500000
              232.833333333333400000
              322.791666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Cronolog'#237'a Dentaria: '
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
          object QRLabelCronologia: TQRLabel
            Left = 482
            Top = 88
            Width = 231
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1275.291666666667000000
              232.833333333333400000
              611.187500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLabelCronologia'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = QRLabelCronologiaPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel16: TQRLabel
            Left = 352
            Top = 112
            Width = 64
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              931.333333333333500000
              296.333333333333400000
              169.333333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Categor'#237'a: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object LabelAfip: TQRLabel
            Left = 352
            Top = 136
            Width = 94
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              931.333333333333500000
              359.833333333333400000
              248.708333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Informado AFIP:'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabelAfip: TQRLabel
            Left = 456
            Top = 136
            Width = 121
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1206.500000000000000000
              359.833333333333300000
              320.145833333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLabelAFIP'
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
        object QRBand4: TQRBand
          Left = 38
          Top = 682
          Width = 718
          Height = 54
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            142.875000000000000000
            1899.708333333333000000)
          BandType = rbColumnHeader
          object LabelEventosRelacionados: TQRLabel
            Left = 5
            Top = 1
            Width = 181
            Height = 24
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              63.500000000000000000
              13.229166666666670000
              2.645833333333333000
              478.895833333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Hist'#243'rico de Eventos'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 14
          end
          object QRLFechaEventos: TQRLabel
            Left = 15
            Top = 32
            Width = 40
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              39.687500000000000000
              84.666666666666680000
              105.833333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Fecha'
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
          object QRLTipoEventos: TQRLabel
            Left = 72
            Top = 32
            Width = 44
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              190.500000000000000000
              84.666666666666680000
              116.416666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Evento'
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
          object QRLResponsableEventos: TQRLabel
            Left = 561
            Top = 32
            Width = 82
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1484.312500000000000000
              84.666666666666680000
              216.958333333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Responsable'
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
          object QRLInfoEvento: TQRLabel
            Left = 274
            Top = 33
            Width = 148
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              724.958333333333400000
              87.312500000000000000
              391.583333333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Informaci'#243'n del evento'
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
            Left = 0
            Top = 21
            Width = 718
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.104166666666670000
              0.000000000000000000
              55.562500000000000000
              1899.708333333333000000)
            Shape = qrsHorLine
          end
        end
        object QRBand1: TQRBand
          Left = 38
          Top = 736
          Width = 718
          Height = 50
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
            132.291666666666700000
            1899.708333333333000000)
          BandType = rbDetail
          object QRDBText1: TQRDBText
            Left = 16
            Top = 3
            Width = 35
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              42.333333333333340000
              7.937500000000000000
              92.604166666666680000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = IBQConsultaEventos
            DataField = 'FECHA'
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
          object QRDBText2: TQRDBText
            Left = 71
            Top = 3
            Width = 178
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              187.854166666666700000
              7.937500000000000000
              470.958333333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQConsultaEventos
            DataField = 'TIPOEVENTO'
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
          object QRDBText3: TQRDBText
            Left = 560
            Top = 3
            Width = 137
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1481.666666666667000000
              7.937500000000000000
              362.479166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = IBQConsultaEventos
            DataField = 'RESPONSABLE'
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
          object QRDBText4: TQRDBText
            Left = 274
            Top = 3
            Width = 263
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              724.958333333333400000
              7.937500000000000000
              695.854166666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = IBQConsultaEventos
            DataField = 'INFOEVENTO'
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
          object QRShape17: TQRShape
            Left = 0
            Top = 48
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
              127.000000000000000000
              1899.708333333333000000)
            Shape = qrsRectangle
          end
          object QRSTipoEve: TQRShape
            Left = 62
            Top = 0
            Width = 1
            Height = 51
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              134.937500000000000000
              164.041666666666700000
              0.000000000000000000
              2.645833333333333000)
            Shape = qrsRectangle
          end
          object QRSInfoEve: TQRShape
            Left = 265
            Top = 0
            Width = 1
            Height = 50
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              132.291666666666700000
              701.145833333333400000
              0.000000000000000000
              2.645833333333333000)
            Shape = qrsRectangle
          end
          object QRSResp: TQRShape
            Left = 553
            Top = 0
            Width = 1
            Height = 50
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              132.291666666666700000
              1463.145833333333000000
              0.000000000000000000
              2.645833333333333000)
            Shape = qrsRectangle
          end
        end
        object QRBand3: TQRBand
          Left = 38
          Top = 786
          Width = 718
          Height = 28
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
            74.083333333333340000
            1899.708333333333000000)
          BandType = rbSummary
          object LabelCantidadDeEventos: TQRLabel
            Left = 16
            Top = 8
            Width = 128
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              42.333333333333340000
              21.166666666666670000
              338.666666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Cantidad de Eventos: '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRExpr1: TQRExpr
            Left = 152
            Top = 8
            Width = 46
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              402.166666666666700000
              21.166666666666670000
              121.708333333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Color = clWhite
            Master = QRHistorialAnimal
            ParentFont = False
            ResetAfterPrint = False
            Transparent = False
            WordWrap = True
            Expression = 'COUNT'
            FontSize = 10
          end
        end
        object QRBand6: TQRBand
          Left = 38
          Top = 814
          Width = 718
          Height = 34
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
            89.958333333333330000
            1899.708333333333000000)
          BandType = rbPageFooter
          object QRShape13: TQRShape
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
          object QRLDatosAbajo12: TQRLabel
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
              978.958333333333300000
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
              978.958333333333300000
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
        object QRBand7: TQRBand
          Left = 38
          Top = 38
          Width = 718
          Height = 111
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          BeforePrint = QRBand7BeforePrint
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = True
          Size.Values = (
            293.687500000000000000
            1899.708333333333000000)
          BandType = rbPageHeader
          object QRLRenglon12: TQRLabel
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
          object QRLabel8: TQRLabel
            Left = 95
            Top = 56
            Width = 137
            Height = 23
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              60.854166666666670000
              251.354166666666700000
              148.166666666666700000
              362.479166666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Ficha del animal'
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
          object QRShape12: TQRShape
            Left = 0
            Top = 106
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
              280.458333333333400000
              1899.708333333333000000)
            Shape = qrsHorLine
          end
          object QRShape20: TQRShape
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
          object QRSysData2: TQRSysData
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
          object QRLEmpresa12: TQRLabel
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
              1748.895833333334000000
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
          object QRLNombrePropietario12: TQRLabel
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
          object QRLRenglon22: TQRLabel
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
          object QRLEstablecimientos1: TQRLabel
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
          object QRImagenEmpresa12: TQRImage
            Left = 322
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
              851.958333333333400000
              13.229166666666670000
              343.958333333333400000)
            Stretch = True
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Reporte2'
      ImageIndex = 1
      object QRListadoAnimalesCabanias: TQuickRep
        Left = -16
        Top = 0
        Width = 1123
        Height = 794
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        BeforePrint = QRListadoAnimalesCabanias1BeforePrint
        DataSet = IBQListadoAnimal
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
        Page.Orientation = poLandscape
        Page.PaperSize = A4
        Page.Values = (
          100.000000000000000000
          2100.000000000000000000
          100.000000000000000000
          2970.000000000000000000
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
        object QRBand12: TQRBand
          Left = 38
          Top = 38
          Width = 1047
          Height = 110
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
            291.041666666666700000
            2770.187500000000000000)
          BandType = rbPageHeader
          object QRLRenglon13: TQRLabel
            Left = 889
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
              2352.145833333333000000
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
          object QRImage3: TQRImage
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
          object QRLabel29: TQRLabel
            Left = 95
            Top = 56
            Width = 170
            Height = 23
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              60.854166666666680000
              251.354166666666700000
              148.166666666666700000
              449.791666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Listado de animales'
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
          object QRShape18: TQRShape
            Left = 952
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
              2518.833333333333000000
              227.541666666666700000
              227.541666666666700000)
            Shape = qrsHorLine
          end
          object QRSysData5: TQRSysData
            Left = 993
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
              2627.312500000000000000
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
          object QRLEmpresa3: TQRLabel
            Left = 989
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
              2616.729166666667000000
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
          object QRLNombrePropietario3: TQRLabel
            Left = 931
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
              2463.270833333333000000
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
          object QRLRenglon23: TQRLabel
            Left = 889
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
              2352.145833333333000000
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
          object QRLEstablecimientos2: TQRLabel
            Left = 826
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
              2185.458333333333000000
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
          object QRImagenEmpresa4: TQRImage
            Left = 480
            Top = 13
            Width = 130
            Height = 90
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              238.125000000000000000
              1270.000000000000000000
              34.395833333333330000
              343.958333333333300000)
            Stretch = True
          end
          object QRShape44: TQRShape
            Left = 1021
            Top = 86
            Width = 17
            Height = 1
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              2.645833333333333000
              2701.395833333333000000
              227.541666666666700000
              44.979166666666670000)
            Shape = qrsRectangle
          end
          object QRShape19: TQRShape
            Left = 0
            Top = 110
            Width = 972
            Height = 2
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              5.291666666666667000
              0.000000000000000000
              291.041666666666700000
              2571.750000000000000000)
            Shape = qrsRectangle
          end
        end
        object QRBand11: TQRBand
          Left = 38
          Top = 225
          Width = 1047
          Height = 34
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
            89.958333333333330000
            2770.187500000000000000)
          BandType = rbPageFooter
          object QRShape16: TQRShape
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
          object QRLabel24: TQRLabel
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
          object QRSysData4: TQRSysData
            Left = 1000
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
              2645.833333333333000000
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
          object QRLabel25: TQRLabel
            Left = 968
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
              2561.166666666667000000
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
          object QRLDatosAbajo3: TQRLabel
            Left = 514
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
              1359.958333333333000000
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
          object QRLDatosAbajo4: TQRLabel
            Left = 514
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
              1359.958333333333000000
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
        object QRBand9: TQRBand
          Left = 38
          Top = 259
          Width = 1047
          Height = 37
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            97.895833333333330000
            2770.187500000000000000)
          BandType = rbPageFooter
        end
        object QRBand14: TQRBand
          Left = 38
          Top = 165
          Width = 1047
          Height = 26
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
            68.791666666666670000
            2770.187500000000000000)
          BandType = rbDetail
          object QRDBText14: TQRDBText
            Left = 0
            Top = 7
            Width = 61
            Height = 14
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              37.041666666666670000
              0.000000000000000000
              18.520833333333330000
              161.395833333333300000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'RP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            OnPrint = QRDBText14Print
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText12: TQRDBText
            Left = 62
            Top = 7
            Width = 55
            Height = 14
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              37.041666666666670000
              164.041666666666700000
              18.520833333333330000
              145.520833333333300000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'HBA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText13: TQRDBText
            Left = 119
            Top = 1
            Width = 103
            Height = 21
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              55.562500000000000000
              314.854166666666700000
              2.645833333333333000
              272.520833333333300000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'NOMBRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText15: TQRDBText
            Left = 228
            Top = 6
            Width = 55
            Height = 14
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              37.041666666666670000
              603.250000000000000000
              15.875000000000000000
              145.520833333333300000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'FECHA_NAC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText18: TQRDBText
            Left = 343
            Top = 7
            Width = 33
            Height = 14
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              37.041666666666670000
              907.520833333333400000
              18.520833333333330000
              87.312500000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'PESONACER'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText22: TQRDBText
            Left = 381
            Top = 7
            Width = 85
            Height = 14
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              37.041666666666670000
              1008.062500000000000000
              18.520833333333330000
              224.895833333333300000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'TS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText21: TQRDBText
            Left = 473
            Top = 7
            Width = 72
            Height = 14
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              37.041666666666670000
              1251.479166666667000000
              18.520833333333330000
              190.500000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'ADN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText17: TQRDBText
            Left = 551
            Top = 7
            Width = 53
            Height = 14
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              37.041666666666670000
              1457.854166666667000000
              18.520833333333330000
              140.229166666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'RP_PADRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText16: TQRDBText
            Left = 692
            Top = 7
            Width = 54
            Height = 14
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              37.041666666666670000
              1830.916666666667000000
              18.520833333333330000
              142.875000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'RP_MADRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object nom1: TQRLabel
            Left = 828
            Top = 1
            Width = 42
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.104166666666670000
              2190.750000000000000000
              2.645833333333333000
              111.125000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'nom1'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object por1: TQRLabel
            Left = 828
            Top = 14
            Width = 42
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.104166666666670000
              2190.750000000000000000
              37.041666666666670000
              111.125000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'QRLabel13'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object nom2: TQRLabel
            Left = 880
            Top = 1
            Width = 39
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.104166666666670000
              2328.333333333333000000
              2.645833333333333000
              103.187500000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'QRLabel13'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object por2: TQRLabel
            Left = 880
            Top = 14
            Width = 39
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.104166666666670000
              2328.333333333333000000
              37.041666666666670000
              103.187500000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'QRLabel13'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object nom3: TQRLabel
            Left = 928
            Top = 1
            Width = 39
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.104166666666670000
              2455.333333333333000000
              2.645833333333333000
              103.187500000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'QRLabel13'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object por3: TQRLabel
            Left = 928
            Top = 14
            Width = 39
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.104166666666670000
              2455.333333333333000000
              37.041666666666670000
              103.187500000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'QRLabel13'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRShape28: TQRShape
            Left = -4
            Top = -3
            Width = 9
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              -10.583333333333330000
              -7.937500000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape27: TQRShape
            Left = 58
            Top = -3
            Width = 9
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              153.458333333333300000
              -7.937500000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape26: TQRShape
            Left = 113
            Top = -3
            Width = 9
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              298.979166666666700000
              -7.937500000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape45: TQRShape
            Left = 220
            Top = -3
            Width = 9
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              582.083333333333400000
              -7.937500000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape24: TQRShape
            Left = 336
            Top = -3
            Width = 9
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              889.000000000000000000
              -7.937500000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape25: TQRShape
            Left = 375
            Top = -3
            Width = 9
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              992.187500000000000000
              -7.937500000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape23: TQRShape
            Left = 464
            Top = -3
            Width = 9
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              1227.666666666667000000
              -7.937500000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape22: TQRShape
            Left = 539
            Top = -3
            Width = 9
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              1426.104166666667000000
              -7.937500000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape21: TQRShape
            Left = 611
            Top = -3
            Width = 2
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              1616.604166666667000000
              -7.937500000000000000
              5.291666666666667000)
            Shape = qrsVertLine
          end
          object QRShape10: TQRShape
            Left = 820
            Top = -1
            Width = 7
            Height = 26
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              68.791666666666680000
              2169.583333333333000000
              -2.645833333333333000
              18.520833333333330000)
            Pen.Mode = pmBlack
            Pen.Width = 2
            Shape = qrsVertLine
          end
          object QRShape29: TQRShape
            Left = 866
            Top = 0
            Width = 9
            Height = 26
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              68.791666666666680000
              2291.291666666667000000
              0.000000000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape30: TQRShape
            Left = 914
            Top = 0
            Width = 9
            Height = 26
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              68.791666666666680000
              2418.291666666667000000
              0.000000000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape31: TQRShape
            Left = 968
            Top = -2
            Width = 9
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              2561.166666666667000000
              -5.291666666666667000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape47: TQRShape
            Left = 680
            Top = -4
            Width = 1
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              1799.166666666667000000
              -10.583333333333330000
              2.645833333333333000)
            Shape = qrsRectangle
          end
          object HbaPadre: TQRDBText
            Left = 622
            Top = 7
            Width = 52
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1645.708333333333000000
              18.520833333333330000
              137.583333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'HBA_PADRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRShape49: TQRShape
            Left = 749
            Top = -4
            Width = 1
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              1981.729166666667000000
              -10.583333333333330000
              2.645833333333333000)
            Shape = qrsRectangle
          end
          object HbaMadre: TQRDBText
            Left = 760
            Top = 6
            Width = 57
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2010.833333333333000000
              15.875000000000000000
              150.812500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'HBA_MADRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRShape54: TQRShape
            Left = 286
            Top = -3
            Width = 1
            Height = 29
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              76.729166666666680000
              756.708333333333400000
              -7.937500000000000000
              2.645833333333333000)
            Shape = qrsRectangle
          end
          object TipoRegistro: TQRDBText
            Left = 288
            Top = 7
            Width = 46
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              762.000000000000000000
              18.520833333333330000
              121.708333333333300000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'TIPO_REGISTRO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRShape46: TQRShape
            Left = 1
            Top = 0
            Width = 971
            Height = 1
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              2.645833333333333000
              2.645833333333333000
              0.000000000000000000
              2569.104166666667000000)
            Shape = qrsRectangle
          end
          object QRShape51: TQRShape
            Left = 1
            Top = 25
            Width = 971
            Height = 1
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              2.645833333333333000
              2.645833333333333000
              66.145833333333320000
              2569.104166666667000000)
            Shape = qrsRectangle
          end
        end
        object QRBand13: TQRBand
          Left = 38
          Top = 191
          Width = 1047
          Height = 34
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
            89.958333333333330000
            2770.187500000000000000)
          BandType = rbSummary
          object QRLabel34: TQRLabel
            Left = 8
            Top = 8
            Width = 175
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
              463.020833333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Total de animales listados: '
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
          object QRLabel35: TQRLabel
            Left = 192
            Top = 8
            Width = 36
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              508.000000000000000000
              21.166666666666670000
              95.250000000000000000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '10000'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = QRLTotalPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
        end
        object QRBand10: TQRBand
          Left = 38
          Top = 148
          Width = 1047
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            44.979166666666670000
            2770.187500000000000000)
          BandType = rbColumnHeader
          object QRShape32: TQRShape
            Left = -3
            Top = 0
            Width = 7
            Height = 39
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              103.187500000000000000
              -7.937500000000000000
              0.000000000000000000
              18.520833333333330000)
            Shape = qrsVertLine
          end
          object QRShape33: TQRShape
            Left = 58
            Top = 0
            Width = 9
            Height = 39
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              103.187500000000000000
              153.458333333333300000
              0.000000000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape34: TQRShape
            Left = 113
            Top = 0
            Width = 9
            Height = 40
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              105.833333333333300000
              298.979166666666700000
              0.000000000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape35: TQRShape
            Left = 220
            Top = 0
            Width = 9
            Height = 39
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              103.187500000000000000
              582.083333333333200000
              0.000000000000000000
              23.812500000000000000)
            Shape = qrsVertLine
          end
          object QRShape36: TQRShape
            Left = 338
            Top = 0
            Width = 5
            Height = 38
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              100.541666666666700000
              894.291666666666800000
              0.000000000000000000
              13.229166666666670000)
            Shape = qrsVertLine
          end
          object QRShape37: TQRShape
            Left = 377
            Top = 0
            Width = 5
            Height = 39
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              103.187500000000000000
              997.479166666666800000
              0.000000000000000000
              13.229166666666670000)
            Shape = qrsVertLine
          end
          object QRShape38: TQRShape
            Left = 465
            Top = 0
            Width = 7
            Height = 39
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              103.187500000000000000
              1230.312500000000000000
              0.000000000000000000
              18.520833333333330000)
            Shape = qrsVertLine
          end
          object QRShape39: TQRShape
            Left = 540
            Top = 0
            Width = 7
            Height = 40
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              105.833333333333300000
              1428.750000000000000000
              0.000000000000000000
              18.520833333333330000)
            Shape = qrsVertLine
          end
          object QRShape40: TQRShape
            Left = 609
            Top = 0
            Width = 7
            Height = 40
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              105.833333333333300000
              1611.312500000000000000
              0.000000000000000000
              18.520833333333330000)
            Shape = qrsVertLine
          end
          object QRShape41: TQRShape
            Left = 820
            Top = 1
            Width = 7
            Height = 38
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              100.541666666666700000
              2169.583333333333000000
              2.645833333333333000
              18.520833333333330000)
            Pen.Mode = pmBlack
            Pen.Width = 2
            Shape = qrsVertLine
          end
          object QRShape42: TQRShape
            Left = 969
            Top = 0
            Width = 7
            Height = 40
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              105.833333333333300000
              2563.812500000000000000
              0.000000000000000000
              18.520833333333330000)
            Shape = qrsVertLine
          end
          object QRLabel26: TQRLabel
            Left = 79
            Top = 12
            Width = 23
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              209.020833333333300000
              31.750000000000000000
              60.854166666666680000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'HBA'
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
          object QRLabel27: TQRLabel
            Left = 152
            Top = 14
            Width = 45
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              402.166666666666700000
              37.041666666666670000
              119.062500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Nombre'
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
          object QRLabel30: TQRLabel
            Left = 390
            Top = 8
            Width = 71
            Height = 35
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              92.604166666666680000
              1031.875000000000000000
              21.166666666666670000
              187.854166666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Tipificaci'#243'n Sangu'#237'nea'
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
          object QRLabel31: TQRLabel
            Left = 493
            Top = 13
            Width = 23
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1304.395833333333000000
              34.395833333333340000
              60.854166666666680000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'ADN'
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
          object QRLabel21: TQRLabel
            Left = 11
            Top = 8
            Width = 42
            Height = 25
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              66.145833333333340000
              29.104166666666670000
              21.166666666666670000
              111.125000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'RP Animal'
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
          object QRLabel28: TQRLabel
            Left = 233
            Top = 8
            Width = 48
            Height = 26
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              68.791666666666680000
              616.479166666666800000
              21.166666666666670000
              127.000000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'Fecha Nac.'
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
          object QRLabel37: TQRLabel
            Left = 344
            Top = 8
            Width = 32
            Height = 26
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              68.791666666666680000
              910.166666666666600000
              21.166666666666670000
              84.666666666666680000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'Peso Nac.'
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
          object QRLabel33: TQRLabel
            Left = 560
            Top = 8
            Width = 37
            Height = 33
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              87.312500000000000000
              1481.666666666667000000
              21.166666666666670000
              97.895833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'RP Padre'
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
          object QRLabel32: TQRLabel
            Left = 700
            Top = 8
            Width = 36
            Height = 25
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              66.145833333333340000
              1852.083333333333000000
              21.166666666666670000
              95.250000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'RP Madre'
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
          object QRLabel36: TQRLabel
            Left = 852
            Top = 8
            Width = 91
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2254.250000000000000000
              21.166666666666670000
              240.770833333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '% Coopropiedad'
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
          object QRLabel7: TQRLabel
            Left = 629
            Top = 6
            Width = 34
            Height = 35
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              92.604166666666680000
              1664.229166666667000000
              15.875000000000000000
              89.958333333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Hba Padre'
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
          object QRShape48: TQRShape
            Left = 749
            Top = 1
            Width = 1
            Height = 38
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              100.541666666666700000
              1981.729166666667000000
              2.645833333333333000
              2.645833333333333000)
            Shape = qrsRectangle
          end
          object QRLabel14: TQRLabel
            Left = 764
            Top = 6
            Width = 45
            Height = 35
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              92.604166666666680000
              2021.416666666667000000
              15.875000000000000000
              119.062500000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Hba Madre'
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
          object QRShape50: TQRShape
            Left = 680
            Top = 1
            Width = 1
            Height = 38
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              100.541666666666700000
              1799.166666666667000000
              2.645833333333333000
              2.645833333333333000)
            Shape = qrsRectangle
          end
          object QRShape53: TQRShape
            Left = 286
            Top = 0
            Width = 1
            Height = 38
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              100.541666666666700000
              756.708333333333200000
              0.000000000000000000
              2.645833333333333000)
            Shape = qrsRectangle
          end
          object QRLabel15: TQRLabel
            Left = 290
            Top = 6
            Width = 49
            Height = 35
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              92.604166666666680000
              767.291666666666800000
              15.875000000000000000
              129.645833333333300000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Tipo Registro'
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
          object QRLineSup: TQRShape
            Left = 1
            Top = 0
            Width = 971
            Height = 1
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              2.645833333333333000
              2.645833333333333000
              0.000000000000000000
              2569.104166666667000000)
            Shape = qrsRectangle
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Reporte3'
      ImageIndex = 2
      object QRListadaAnimales: TQuickRep
        Left = -10
        Top = -33
        Width = 794
        Height = 1123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        BeforePrint = QRListadaAnimalesBeforePrint
        DataSet = IBQListadoAnimal
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
        object QRBEncabezadoPlanilla: TQRBand
          Left = 38
          Top = 38
          Width = 718
          Height = 110
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
            291.041666666666700000
            1899.708333333333000000)
          BandType = rbPageHeader
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
          object QRImage1: TQRImage
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
          object QRLTituloPlanilla: TQRLabel
            Left = 95
            Top = 56
            Width = 170
            Height = 23
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              60.854166666666670000
              251.354166666666700000
              148.166666666666700000
              449.791666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Listado de animales'
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
          object QRShape11: TQRShape
            Left = 0
            Top = 106
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
              280.458333333333400000
              1899.708333333333000000)
            Shape = qrsHorLine
          end
          object QRShape15: TQRShape
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
          object QRSysData3: TQRSysData
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
              1748.895833333334000000
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
            Left = 312
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
              825.500000000000100000
              13.229166666666670000
              343.958333333333400000)
            Stretch = True
          end
        end
        object QRBColumnHeaderPlanilla: TQRGroup
          Left = 38
          Top = 148
          Width = 718
          Height = 19
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
            50.270833333333330000
            1899.708333333333000000)
          FooterBand = QRBGFgrilla
          Master = QRListadaAnimales
          ReprintOnNewPage = True
          object QRLRPAnimal: TQRLabel
            Left = 1
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
              2.645833333333333000
              0.000000000000000000
              169.333333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'RP Animal'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRSColumnHeaderPlanilla: TQRShape
            Left = 0
            Top = 16
            Width = 718
            Height = 2
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              5.291666666666667000
              0.000000000000000000
              42.333333333333340000
              1899.708333333333000000)
            Shape = qrsHorLine
          end
          object QRLabel2: TQRLabel
            Left = 68
            Top = 0
            Width = 68
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              179.916666666666700000
              0.000000000000000000
              179.916666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Fecha Nac.'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel3: TQRLabel
            Left = 147
            Top = 0
            Width = 31
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              388.937500000000000000
              0.000000000000000000
              82.020833333333340000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Edad'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel4: TQRLabel
            Left = 209
            Top = 0
            Width = 56
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              552.979166666666700000
              0.000000000000000000
              148.166666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Categor'#237'a'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel5: TQRLabel
            Left = 290
            Top = 0
            Width = 42
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              767.291666666666700000
              0.000000000000000000
              111.125000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Estado'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel6: TQRLabel
            Left = 389
            Top = 0
            Width = 31
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1029.229166666667000000
              0.000000000000000000
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
          object QRLabel17: TQRLabel
            Left = 623
            Top = 0
            Width = 90
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1648.354166666667000000
              0.000000000000000000
              238.125000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Informado AFIP'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel18: TQRLabel
            Left = 496
            Top = 0
            Width = 82
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1312.333333333333000000
              0.000000000000000000
              216.958333333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'ID Electr'#243'nica'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
        end
        object QRBDetailPlanilla: TQRBand
          Left = 38
          Top = 167
          Width = 718
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AfterPrint = QRBDetailPlanillaAfterPrint
          AlignToBottom = False
          BeforePrint = QRBDetailPlanillaBeforePrint
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            39.687500000000000000
            1899.708333333333000000)
          BandType = rbDetail
          object QRDBText5: TQRDBText
            Left = 1
            Top = 0
            Width = 65
            Height = 15
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2.645833333333333000
              0.000000000000000000
              171.979166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'RP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText6: TQRDBText
            Left = 80
            Top = 0
            Width = 57
            Height = 15
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              211.666666666666700000
              0.000000000000000000
              150.812500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'FECHA_NAC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText8: TQRDBText
            Left = 207
            Top = 0
            Width = 61
            Height = 15
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              547.687500000000000000
              0.000000000000000000
              161.395833333333300000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'CATEGORIA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText9: TQRDBText
            Left = 281
            Top = 0
            Width = 66
            Height = 15
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              743.479166666666700000
              0.000000000000000000
              174.625000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'ESTADOACT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText10: TQRDBText
            Left = 365
            Top = 0
            Width = 108
            Height = 15
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              965.729166666666700000
              0.000000000000000000
              285.750000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'RAZA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel13: TQRLabel
            Left = 139
            Top = 0
            Width = 13
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              367.770833333333400000
              0.000000000000000000
              34.395833333333340000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'aaa'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText7: TQRDBText
            Left = 663
            Top = 0
            Width = 25
            Height = 15
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1754.187500000000000000
              0.000000000000000000
              66.145833333333330000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'INFORMADO_AFIP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRDBText11: TQRDBText
            Left = 480
            Top = 0
            Width = 129
            Height = 15
            Frame.Color = clGray
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1270.000000000000000000
              0.000000000000000000
              341.312500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimal
            DataField = 'IE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
        end
        object QRBGFgrilla: TQRBand
          Left = 38
          Top = 182
          Width = 718
          Height = 4
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
            10.583333333333330000
            1899.708333333333000000)
          BandType = rbGroupFooter
        end
        object QRBand5: TQRBand
          Left = 38
          Top = 215
          Width = 718
          Height = 34
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
            89.958333333333330000
            1899.708333333333000000)
          BandType = rbPageFooter
          object QRShape9: TQRShape
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
          object QRLabel1: TQRLabel
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
              978.958333333333300000
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
              978.958333333333300000
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
        object QRBand8: TQRBand
          Left = 38
          Top = 186
          Width = 718
          Height = 29
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
            76.729166666666670000
            1899.708333333333000000)
          BandType = rbSummary
          object QRShape14: TQRShape
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
          object QRLabel12: TQRLabel
            Left = 8
            Top = 8
            Width = 175
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
              463.020833333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Total de animales listados: '
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
          object QRLTotal: TQRLabel
            Left = 192
            Top = 8
            Width = 36
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              508.000000000000000000
              21.166666666666670000
              95.250000000000000000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '10000'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = QRLTotalPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Reporte4'
      ImageIndex = 3
      object qrListadoCAB: TQuickRep
        Left = -32
        Top = -16
        Width = 1100
        Height = 600
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = IBQListadoAnimales
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
        Page.Orientation = poLandscape
        Page.PaperSize = A4
        Page.Values = (
          100.000000000000000000
          2100.000000000000000000
          80.000000000000000000
          2970.000000000000000000
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
        object QRBand15: TQRBand
          Left = 38
          Top = 30
          Width = 1024
          Height = 91
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
            240.770833333333300000
            2709.333333333333000000)
          BandType = rbPageHeader
          object QRImage4: TQRImage
            Left = 8
            Top = 11
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
              29.104166666666670000
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
          object QRLabel19: TQRLabel
            Left = 95
            Top = 37
            Width = 170
            Height = 23
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              60.854166666666670000
              251.354166666666700000
              97.895833333333330000
              449.791666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Listado de animales'
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
          object QRShape52: TQRShape
            Left = 875
            Top = 70
            Width = 86
            Height = 1
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              2.645833333333333000
              2315.104166666667000000
              185.208333333333300000
              227.541666666666700000)
            Shape = qrsHorLine
          end
          object QRSysData6: TQRSysData
            Left = 916
            Top = 72
            Width = 38
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2423.583333333333000000
              190.500000000000000000
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
          object QRLEmpresa2: TQRLabel
            Left = 910
            Top = 53
            Width = 50
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2407.708333333333000000
              140.229166666666700000
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
          object QRLRenglon4: TQRLabel
            Left = 852
            Top = 36
            Width = 109
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2254.250000000000000000
              95.250000000000000000
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
          object QRLRenglon3: TQRLabel
            Left = 810
            Top = 20
            Width = 150
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2143.125000000000000000
              52.916666666666670000
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
          object QRLNombrePropietario4: TQRLabel
            Left = 747
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
              1976.437500000000000000
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
          object QRImage5: TQRImage
            Left = 416
            Top = 1
            Width = 129
            Height = 88
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              232.833333333333400000
              1100.666666666667000000
              2.645833333333333000
              341.312500000000000000)
            Stretch = True
          end
        end
        object QRBand16: TQRBand
          Left = 38
          Top = 191
          Width = 1024
          Height = 32
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
            84.666666666666670000
            2709.333333333333000000)
          BandType = rbPageFooter
          object QRLabel39: TQRLabel
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
          object QRSysData7: TQRSysData
            Left = 863
            Top = 8
            Width = 39
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2283.354166666667000000
              21.166666666666670000
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
          object QRLabel40: TQRLabel
            Left = 831
            Top = 8
            Width = 22
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2198.687500000000000000
              21.166666666666670000
              58.208333333333330000)
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
          object QRLabel41: TQRLabel
            Left = 471
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
              1246.187500000000000000
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
          object QRLabel42: TQRLabel
            Left = 471
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
              1246.187500000000000000
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
        object QRBand17: TQRBand
          Left = 38
          Top = 160
          Width = 1024
          Height = 31
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            82.020833333333340000
            2709.333333333333000000)
          BandType = rbDetail
          object QRShape69: TQRShape
            Left = 0
            Top = 0
            Width = 1020
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              82.020833333333340000
              0.000000000000000000
              0.000000000000000000
              2698.750000000000000000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
          object QRShape43: TQRShape
            Left = 546
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              1444.625000000000000000
              0.000000000000000000
              2.645833333333333000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
          object QRShape57: TQRShape
            Left = 0
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              0.000000000000000000
              0.000000000000000000
              2.645833333333333000)
            Shape = qrsRectangle
          end
          object QRDBText19: TQRDBText
            Left = 4
            Top = 4
            Width = 50
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              10.583333333333330000
              10.583333333333330000
              132.291666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'ID_RP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText20: TQRDBText
            Left = 55
            Top = 4
            Width = 120
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              145.520833333333300000
              10.583333333333330000
              317.500000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'NOMBRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText23: TQRDBText
            Left = 176
            Top = 4
            Width = 62
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              465.666666666666700000
              10.583333333333330000
              164.041666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'FECHA_NACIMIENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText24: TQRDBText
            Left = 240
            Top = 4
            Width = 60
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              635.000000000000000000
              10.583333333333330000
              158.750000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'PESO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = False
            FontSize = 7
          end
          object QRDBText29: TQRDBText
            Left = 486
            Top = 4
            Width = 58
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1285.875000000000000000
              10.583333333333330000
              153.458333333333300000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'RP_MADRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 964177
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText33: TQRDBText
            Left = 548
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1449.916666666667000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'NACERDEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText34: TQRDBText
            Left = 573
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1516.062500000000000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'NACERPREC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText35: TQRDBText
            Left = 599
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1584.854166666667000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'DESTDEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText36: TQRDBText
            Left = 625
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1653.645833333333000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'DESTPREC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText37: TQRDBText
            Left = 651
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1722.437500000000000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'GESTDEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText38: TQRDBText
            Left = 677
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1791.229166666667000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'GESTPREC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText39: TQRDBText
            Left = 702
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1857.375000000000000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'LECHEDEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText40: TQRDBText
            Left = 728
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1926.166666666667000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'LECHEPREC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText41: TQRDBText
            Left = 754
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1994.958333333334000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'FINALDEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText42: TQRDBText
            Left = 780
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              2063.750000000000000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'FINALPREC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText43: TQRDBText
            Left = 806
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              2132.541666666667000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'CEDEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText44: TQRDBText
            Left = 832
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              2201.333333333333000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'CEPREC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText46: TQRDBText
            Left = 426
            Top = 4
            Width = 59
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              1127.125000000000000000
              10.583333333333330000
              156.104166666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'RP_PADRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 964177
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRDBText47: TQRDBText
            Left = 301
            Top = 4
            Width = 60
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              796.395833333333400000
              10.583333333333330000
              158.750000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'RAZANOMBRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRDBText48: TQRDBText
            Left = 362
            Top = 4
            Width = 60
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              957.791666666666700000
              10.583333333333330000
              158.750000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'COLORNOMBRE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRShape63: TQRShape
            Left = 650
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              1719.791666666667000000
              0.000000000000000000
              2.645833333333333000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
          object QRShape64: TQRShape
            Left = 805
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              2129.895833333333000000
              0.000000000000000000
              2.645833333333333000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
          object QRShape65: TQRShape
            Left = 702
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              1857.375000000000000000
              0.000000000000000000
              2.645833333333333000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
          object QRShape66: TQRShape
            Left = 753
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              1992.312500000000000000
              0.000000000000000000
              2.645833333333333000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
          object QRShape67: TQRShape
            Left = 856
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              2264.833333333333000000
              0.000000000000000000
              2.645833333333333000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
          object QRShape68: TQRShape
            Left = 908
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              2402.416666666667000000
              0.000000000000000000
              2.645833333333333000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
          object QRDBText25: TQRDBText
            Left = 909
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              2405.062500000000000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'EGDDEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText26: TQRDBText
            Left = 935
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              2473.854166666667000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'EGDPREC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText27: TQRDBText
            Left = 961
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              2542.645833333333000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'AOBDEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText28: TQRDBText
            Left = 986
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              2608.791666666667000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'AOBPREC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText30: TQRDBText
            Left = 857
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              2267.479166666667000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'EGCDEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText31: TQRDBText
            Left = 883
            Top = 4
            Width = 25
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.916666666666660000
              2336.270833333333000000
              10.583333333333330000
              66.145833333333340000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = IBQListadoAnimales
            DataField = 'EGCPREC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRShape56: TQRShape
            Left = 598
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              1582.208333333333000000
              0.000000000000000000
              2.645833333333333000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
          object QRShape59: TQRShape
            Left = 422
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              1116.541666666667000000
              0.000000000000000000
              2.645833333333333000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
          object QRShape71: TQRShape
            Left = 960
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333340000
              2540.000000000000000000
              0.000000000000000000
              2.645833333333333000)
            Brush.Style = bsClear
            Shape = qrsRectangle
          end
        end
        object QRBand18: TQRBand
          Left = 38
          Top = 121
          Width = 1024
          Height = 39
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
            103.187500000000000000
            2709.333333333333000000)
          BandType = rbColumnHeader
          object QRShape58: TQRShape
            Left = 422
            Top = 0
            Width = 125
            Height = 38
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              100.541666666666700000
              1116.541666666667000000
              0.000000000000000000
              330.729166666666700000)
            Shape = qrsRectangle
          end
          object QRLabel58: TQRLabel
            Left = 427
            Top = 3
            Width = 118
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1129.770833333333000000
              7.937500000000000000
              312.208333333333400000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Datos Geneal'#243'gicos'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRShape62: TQRShape
            Left = 0
            Top = 0
            Width = 423
            Height = 38
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              100.541666666666700000
              0.000000000000000000
              0.000000000000000000
              1119.187500000000000000)
            Shape = qrsRectangle
          end
          object QRShape61: TQRShape
            Left = 546
            Top = 0
            Width = 467
            Height = 38
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              100.541666666666700000
              1444.625000000000000000
              0.000000000000000000
              1235.604166666667000000)
            Shape = qrsRectangle
          end
          object QRLabel54: TQRLabel
            Left = 150
            Top = 3
            Width = 105
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              396.875000000000000000
              7.937500000000000000
              277.812500000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Datos Individuales'
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
          object QRLabel61: TQRLabel
            Left = 646
            Top = 3
            Width = 91
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.333333333333340000
              1709.208333333333000000
              7.937500000000000000
              240.770833333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Datos Gen'#233'ticos'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel43: TQRLabel
            Left = 756
            Top = 5
            Width = 65
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333340000
              2000.250000000000000000
              13.229166666666670000
              171.979166666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'DEP'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 33023
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRLabel62: TQRLabel
            Left = 833
            Top = 5
            Width = 65
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333340000
              2203.979166666667000000
              13.229166666666670000
              171.979166666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'PREC'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRShape60: TQRShape
            Left = 464
            Top = -41
            Width = 121
            Height = 24
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              63.500000000000000000
              1227.666666666667000000
              -108.479166666666700000
              320.145833333333400000)
            Shape = qrsRectangle
          end
          object QRLabel45: TQRLabel
            Left = 4
            Top = 20
            Width = 50
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              10.583333333333330000
              52.916666666666660000
              132.291666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Rp Animal'
            Color = clActiveBorder
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
          object QRLabel46: TQRLabel
            Left = 55
            Top = 20
            Width = 120
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              145.520833333333300000
              52.916666666666660000
              317.500000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Nombre'
            Color = clActiveBorder
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
          object QRLabel47: TQRLabel
            Left = 176
            Top = 20
            Width = 62
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              465.666666666666700000
              52.916666666666660000
              164.041666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Fec. Nacim.'
            Color = clActiveBorder
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
          object QRLabel55: TQRLabel
            Left = 240
            Top = 20
            Width = 60
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              635.000000000000000000
              52.916666666666660000
              158.750000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Peso actual'
            Color = clActiveBorder
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
          object QRLabel80: TQRLabel
            Left = 301
            Top = 20
            Width = 60
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              796.395833333333400000
              52.916666666666660000
              158.750000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Raza'
            Color = clActiveBorder
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
          object QRLabel81: TQRLabel
            Left = 362
            Top = 20
            Width = 60
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              957.791666666666700000
              52.916666666666660000
              158.750000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Color'
            Color = clActiveBorder
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
          object QRLabel44: TQRLabel
            Left = 549
            Top = 20
            Width = 50
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1452.562500000000000000
              52.916666666666660000
              132.291666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'PN'
            Color = clActiveBorder
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = False
            FontSize = 8
          end
          object QRLabel63: TQRLabel
            Left = 600
            Top = 20
            Width = 50
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1587.500000000000000000
              52.916666666666660000
              132.291666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'PD'
            Color = clActiveBorder
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
          object QRLabel66: TQRLabel
            Left = 652
            Top = 20
            Width = 50
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1725.083333333334000000
              52.916666666666660000
              132.291666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'AM'
            Color = clActiveBorder
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
          object QRLabel69: TQRLabel
            Left = 704
            Top = 20
            Width = 50
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1862.666666666667000000
              52.916666666666660000
              132.291666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'L&C'
            Color = clActiveBorder
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
          object QRLabel72: TQRLabel
            Left = 756
            Top = 20
            Width = 50
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2000.250000000000000000
              52.916666666666660000
              132.291666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'PF'
            Color = clActiveBorder
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
          object QRLabel75: TQRLabel
            Left = 807
            Top = 20
            Width = 50
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2135.187500000000000000
              52.916666666666660000
              132.291666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'C.E.'
            Color = clActiveBorder
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
          object QRLabel20: TQRLabel
            Left = 859
            Top = 20
            Width = 50
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2272.770833333333000000
              52.916666666666660000
              132.291666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'EGC'
            Color = clActiveBorder
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
          object QRLabel22: TQRLabel
            Left = 911
            Top = 20
            Width = 50
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2410.354166666667000000
              52.916666666666660000
              132.291666666666700000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'EGD'
            Color = clActiveBorder
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
          object QRLabel23: TQRLabel
            Left = 963
            Top = 20
            Width = 49
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              2547.937500000000000000
              52.916666666666660000
              129.645833333333300000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'AOB'
            Color = clActiveBorder
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
          object QRLabel79: TQRLabel
            Left = 425
            Top = 20
            Width = 60
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1124.479166666667000000
              52.916666666666660000
              158.750000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Rp Padre'
            Color = clActiveBorder
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
          object QRLabel52: TQRLabel
            Left = 486
            Top = 20
            Width = 60
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.687500000000000000
              1285.875000000000000000
              52.916666666666660000
              158.750000000000000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Rp Madre'
            Color = clActiveBorder
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
        end
      end
    end
  end
  inherited PTitulo: TPanel
    Top = 0
    Width = 1028
    inherited LTitulo: TLabel
      Width = 624
    end
    inherited PILeft: TPanel
      Left = 820
    end
  end
  inherited Psocalo: TPanel
    Top = 720
    Width = 1028
    inherited JvSocalo: TJvImage
      Width = 1028
    end
  end
  inherited ALUniversal: TActionList
    Left = 435
    Top = 6
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 276
    Top = 15
  end
  inherited WinXP1: TWinXP
    Left = 472
    Top = 72
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 24
    Top = 312
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 20
    Top = 375
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 564
    Top = 71
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 20
    Top = 343
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Top = 71
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 72
    Top = 80
  end
  inherited PLVersion: TPngImageList
    Left = 144
    Top = 80
  end
  object IBQConsultaEventos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from get_datos_eventos(:n)')
    Left = 48
    Top = 536
    ParamData = <
      item
        DataType = ftInteger
        Name = 'n'
        ParamType = ptInput
        Value = '0'
      end>
    object IBQConsultaEventosFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'GET_DATOS_EVENTOS.FECHA'
    end
    object IBQConsultaEventosTIPOEVENTO: TIBStringField
      FieldName = 'TIPOEVENTO'
      Origin = 'GET_DATOS_EVENTOS.TIPOEVENTO'
      Size = 255
    end
    object IBQConsultaEventosINFOEVENTO: TIBStringField
      FieldName = 'INFOEVENTO'
      Origin = 'GET_DATOS_EVENTOS.INFOEVENTO'
      Size = 255
    end
    object IBQConsultaEventosRESPONSABLE: TIBStringField
      FieldName = 'RESPONSABLE'
      Origin = 'GET_DATOS_EVENTOS.RESPONSABLE'
      Size = 255
    end
    object IBQConsultaEventosCATEGORIAEVENTO: TIBStringField
      FieldName = 'CATEGORIAEVENTO'
      Origin = 'GET_DATOS_EVENTOS.CATEGORIAEVENTO'
      Size = 255
    end
    object IBQConsultaEventosID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'GET_DATOS_EVENTOS.ID_CATEGORIA'
    end
  end
  object DSConsultaEventos: TDataSource
    DataSet = IBQConsultaEventos
    Left = 24
    Top = 176
  end
  object IBQAnimales: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_animales where (id_animal = :n)')
    Left = 176
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'n'
        ParamType = ptInput
        Value = '1'
      end>
  end
  object DSAnimales: TDataSource
    DataSet = IBQAnimales
    Left = 144
    Top = 2
  end
  object IBQAuxRazas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 8
    Top = 112
  end
  object IBQListadoAnimal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    OnCalcFields = IBQListadoAnimalCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ta.id_animal as id_animal, ta.id_rp as rp, ta.id_hba as h' +
        'ba,'
      '       ta.id_senasa as senasa, ta.fecha_nacimiento as fecha_nac,'
      '       cc.sinonimo as categoria, ta.subcategoria as subcatego,'
      '       ta.estado_actual as estadoAct, cr.sinonimo as raza,'
      
        '       ta.activo as activo, ta.nombre as nombre, ta.pesonacer as' +
        ' pesonacer,'
      '       ta.tipificacion_sanguinea as ts, ta.adn as adn,'
      '       ta.padre_interno as padreI, ta.padre_externo as padreE,'
      
        '       ta.madre_biologica_externa as mbe, ta.madre_biologica_int' +
        'erna as mbi,'
      '       cco.nombre as color,'
      
        '       case ta.informado_afip when '#39'S'#39' then '#39'SI'#39' when '#39'N'#39' then '#39 +
        'NO'#39' end as informado_afip, ta.id_ie as ie'
      'from tab_animales ta join cod_categorias cc'
      '          on (ta.categoria = cc.id_categoria)'
      '     join cod_razas cr'
      '          on (ta.raza = cr.id_raza)'
      '     join cod_colores cco'
      '          on (ta.color = cco.id_color)'
      'where ta.establecimiento = :estable')
    Left = 16
    Top = 596
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'estable'
        ParamType = ptUnknown
      end>
    object IBQListadoAnimalID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'TAB_ANIMALES.ID_ANIMAL'
      Required = True
    end
    object IBQListadoAnimalRP: TIBStringField
      FieldName = 'RP'
      Origin = 'TAB_ANIMALES.ID_RP'
      Required = True
      Size = 10
    end
    object IBQListadoAnimalSENASA: TIBStringField
      FieldName = 'SENASA'
      Origin = 'TAB_ANIMALES.ID_SENASA'
      Size = 9
    end
    object IBQListadoAnimalFECHA_NAC: TDateField
      FieldName = 'FECHA_NAC'
      Origin = 'TAB_ANIMALES.FECHA_NACIMIENTO'
      Required = True
    end
    object IBQListadoAnimalCATEGORIA: TIBStringField
      FieldName = 'CATEGORIA'
      Origin = 'COD_CATEGORIAS.SINONIMO'
      Required = True
      Size = 50
    end
    object IBQListadoAnimalESTADOACT: TIBStringField
      FieldName = 'ESTADOACT'
      Origin = 'TAB_ANIMALES.ESTADO_ACTUAL'
      Size = 50
    end
    object IBQListadoAnimalRAZA: TIBStringField
      FieldName = 'RAZA'
      Origin = 'COD_RAZAS.SINONIMO'
      Required = True
      Size = 50
    end
    object IBQListadoAnimalACTIVO: TIBStringField
      FieldName = 'ACTIVO'
      Origin = 'TAB_ANIMALES.ACTIVO'
      Required = True
      Size = 1
    end
    object IBQListadoAnimalNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'TAB_ANIMALES.NOMBRE'
      Size = 100
    end
    object IBQListadoAnimalPESONACER: TFloatField
      FieldName = 'PESONACER'
      Origin = 'TAB_ANIMALES.PESONACER'
    end
    object IBQListadoAnimalTS: TIBStringField
      FieldName = 'TS'
      Origin = 'TAB_ANIMALES.TIPIFICACION_SANGUINEA'
      Size = 255
    end
    object IBQListadoAnimalADN: TIBStringField
      FieldName = 'ADN'
      Origin = 'TAB_ANIMALES.ADN'
      Size = 255
    end
    object IBQListadoAnimalPADREI: TIntegerField
      FieldName = 'PADREI'
      Origin = 'TAB_ANIMALES.PADRE_INTERNO'
    end
    object IBQListadoAnimalPADREE: TIntegerField
      FieldName = 'PADREE'
      Origin = 'TAB_ANIMALES.PADRE_EXTERNO'
    end
    object IBQListadoAnimalMBE: TIntegerField
      FieldName = 'MBE'
      Origin = 'TAB_ANIMALES.MADRE_BIOLOGICA_EXTERNA'
    end
    object IBQListadoAnimalMBI: TIntegerField
      FieldName = 'MBI'
      Origin = 'TAB_ANIMALES.MADRE_BIOLOGICA_INTERNA'
    end
    object IBQListadoAnimalHBA: TIBStringField
      FieldName = 'HBA'
      Origin = 'TAB_ANIMALES.ID_HBA'
      Size = 10
    end
    object IBQListadoAnimalRP_PADRE: TStringField
      FieldKind = fkCalculated
      FieldName = 'RP_PADRE'
      Calculated = True
    end
    object IBQListadoAnimalRP_MADRE: TStringField
      FieldKind = fkCalculated
      FieldName = 'RP_MADRE'
      Calculated = True
    end
    object IBQListadoAnimalHBA_PADRE: TStringField
      FieldKind = fkCalculated
      FieldName = 'HBA_PADRE'
      Calculated = True
    end
    object IBQListadoAnimalHBA_MADRE: TStringField
      FieldKind = fkCalculated
      FieldName = 'HBA_MADRE'
      Calculated = True
    end
    object IBQListadoAnimalTIPO_REGISTRO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TIPO_REGISTRO'
      Calculated = True
    end
    object IBQListadoAnimalSUBCATEGO: TIntegerField
      FieldName = 'SUBCATEGO'
      Origin = 'TAB_ANIMALES.SUBCATEGORIA'
    end
    object IBQListadoAnimalCOLOR: TIBStringField
      FieldName = 'COLOR'
      Origin = 'COD_COLORES.NOMBRE'
      Size = 50
    end
    object IBQListadoAnimalINFORMADO_AFIP: TIBStringField
      FieldName = 'INFORMADO_AFIP'
      FixedChar = True
      Size = 2
    end
    object IBQListadoAnimalIE: TIBStringField
      FieldName = 'IE'
      Origin = 'TAB_ANIMALES.ID_IE'
      Size = 64
    end
  end
  object IBQAux: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 8
    Top = 80
  end
  object QRHTMLFilter1: TQRHTMLFilter
    Left = 616
    Top = 48
  end
  object IBQAux2: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 40
    Top = 80
  end
  object IBQAux3: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 40
    Top = 112
  end
  object IBQPadres: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from REP_PADRES(:esta,:animal,:tipo_animal)'
      '')
    Left = 64
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo_animal'
        ParamType = ptUnknown
      end>
  end
  object DSQPadres: TDataSource
    DataSet = IBQPadres
    Left = 24
    Top = 256
  end
  object IBQCoopropiedad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select first 3 ci.porcentaje, cp.codigo from coopropiedad_intern' +
        'a ci join cod_propietario cp on ci.id_propietario = cp.id_propie' +
        'tario where ci.id_animal = :id order by ci.porcentaje desc')
    Left = 47
    Top = 567
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQAuxDeps: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from aux_datos_deps')
    Left = 16
    Top = 407
  end
  object IBQAnimalesInternos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_rp, id_hba from tab_animales where id_animal = :n')
    Left = 16
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'n'
        ParamType = ptUnknown
      end>
  end
  object IBQAnimalesExternos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_rp, id_hba '
      ''
      
        'from tab_animales_externos where id_animal_externo = :n and esta' +
        'blecimiento = :esta')
    Left = 16
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'n'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQTiposRegistros: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cs.id_subcategoria as id_subcategoria, cs.sinonimo as sin' +
        'onimo from cod_razas cr join rel_subcategoria_raza rsr on cr.id_' +
        'raza = rsr.id_raza join cod_subcategorias cs on cs.id_subcategor' +
        'ia = rsr.id_subcategoria'
      ''
      'where cr.visible = 1')
    Left = 16
    Top = 536
  end
  object IBQRelPadresExternos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select padre_externo from rel_padres_externos where animal = :a')
    Left = 24
    Top = 278
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'a'
        ParamType = ptUnknown
      end>
  end
  object IBQRelPadresInternos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select padre_interno from rel_padres_internos where animal = :a')
    Left = 16
    Top = 566
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'a'
        ParamType = ptUnknown
      end>
  end
  object IBQPropietario: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select first 1 *'
      'from  tab_propietario')
    Left = 16
    Top = 144
  end
  object IBQListadoAnimales: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select'
      '   ta.ID_ANIMAL,ta.ID_RP,'
      '   ta.NOMBRE, ta.FECHA_NACIMIENTO,'
      '  ta.PESO as PESO, '
      '  COD_COLORES.NOMBRE as COLORNOMBRE,'
      '   COD_RAZAS.NOMBRE as RAZANOMBRE,'
      '   tbMadre.ID_RP as RP_MADRE,'
      '   tbPadre.ID_RP as RP_PADRE,'
      '   TAB_DEP.*'
      'from TAB_ANIMALES ta'
      'left join COD_COLORES'
      'on'
      ' COD_COLORES.ID_COLOR = ta.Color'
      'left join COD_RAZAS'
      'on'
      ' COD_RAZAS.ID_RAZA = ta.RAZA'
      'left join TAB_DEP'
      'on'
      ' TAB_DEP.ANIMAL = TAB_ANIMALES.ID_ANIMAL'
      'left join TAB_ANIMALES tbMadre'
      'on'
      ' ta.MADRE_BIOLOGICA_INTERNA = tbMadre.ID_ANIMAL'
      'left join TAB_ANIMALES tbPadre'
      'on'
      ' ta.PADRE_INTERNO = tbPadre.ID_ANIMAL'
      'where'
      'ta.establecimiento =  :Estable'
      'and ta.activo = '#39'S'#39)
    Left = 104
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Estable'
        ParamType = ptUnknown
      end>
  end
end
