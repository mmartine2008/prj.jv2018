inherited FREPIndividual: TFREPIndividual
  Left = 7
  Top = 52
  Caption = 'FREPIndividual'
  ClientHeight = 728
  ClientWidth = 934
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 934
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
    Width = 577
  end
  object QRDatosEspecificos: TQuickRep [4]
    Left = 65
    Top = 56
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = IBQDatos
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
      Top = 185
      Width = 718
      Height = 464
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
        1227.666666666667000000
        1899.708333333333000000)
      BandType = rbTitle
      object QRShape1: TQRShape
        Left = -1
        Top = 146
        Width = 719
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          -2.645833333333333000
          386.291666666666700000
          1902.354166666667000000)
        Pen.Width = 2
        Shape = qrsHorLine
      end
      object QRLabelTituloEstadoActual: TQRLabel
        Left = 30
        Top = 115
        Width = 294
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          79.375000000000000000
          304.270833333333300000
          777.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos Fenot'#237'picos y Geneal'#243'gicos'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'LabelEstado'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object LabelPesoNacer: TQRLabel
        Left = 19
        Top = 209
        Width = 96
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          50.270833333333330000
          552.979166666666700000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Peso al nacer: '
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
      object LabelPesoDestete: TQRLabel
        Left = 19
        Top = 234
        Width = 177
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          50.270833333333330000
          619.125000000000000000
          468.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Peso al destete ( 200 d'#237'as ): '
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
      object LabelCircunfEscrotal: TQRLabel
        Left = 19
        Top = 384
        Width = 112
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          50.270833333333330000
          1016.000000000000000000
          296.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Circunf. Escrotal: '
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
      object LabelCapacidadServicio: TQRLabel
        Left = 19
        Top = 410
        Width = 153
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          50.270833333333330000
          1084.791666666667000000
          404.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Capacidad de Servicio: '
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
        Left = 416
        Top = 147
        Width = 3
        Height = 311
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          822.854166666666600000
          1100.666666666667000000
          388.937500000000000000
          7.937500000000000000)
        Pen.Width = 2
        Shape = qrsRectangle
      end
      object LabelCantMachos: TQRLabel
        Left = 458
        Top = 195
        Width = 109
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1211.791666666667000000
          515.937500000000000000
          288.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'GDPV al Destete:'
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
      object LabelCantHembras: TQRLabel
        Left = 481
        Top = 255
        Width = 87
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1272.645833333333000000
          674.687500000000000000
          230.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'GDPV al A'#241'o:'
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
      object LabelTotalDistocias: TQRLabel
        Left = 476
        Top = 317
        Width = 91
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1259.416666666667000000
          838.729166666666800000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'GDPV Adulto: '
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
      object LabelFechaNacimiento: TQRLabel
        Left = 19
        Top = 160
        Width = 124
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          50.270833333333330000
          423.333333333333300000
          328.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha Nacimiento: '
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
      object LabelEstadoLactacion: TQRLabel
        Left = 19
        Top = 185
        Width = 117
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          50.270833333333330000
          489.479166666666700000
          309.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Edad de la Madre:'
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
      object LabelFechaAlPrimerParto: TQRLabel
        Left = 19
        Top = 260
        Width = 152
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          50.270833333333330000
          687.916666666666800000
          402.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Peso al A'#241'o ( 400 d'#237'as ):'
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
      object QRLabel4: TQRLabel
        Left = 470
        Top = 115
        Width = 179
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1243.541666666667000000
          304.270833333333300000
          473.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos de Producci'#243'n'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'LabelEstado'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRLabel5: TQRLabel
        Left = 19
        Top = 287
        Width = 152
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          50.270833333333330000
          759.354166666666800000
          402.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Peso Adulto ( 600 d'#237'as ):'
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
      object QRLabel7: TQRLabel
        Left = 19
        Top = 336
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          50.270833333333330000
          889.000000000000000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Alzada:'
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
      object LF: TQRLabel
        Left = 19
        Top = 360
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          50.270833333333330000
          952.500000000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Frame:'
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
      object QRDBText3: TQRDBText
        Left = 202
        Top = 160
        Width = 131
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          423.333333333333300000
          346.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'FECHA_NACIMIENTO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 202
        Top = 209
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          552.979166666666700000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'PESO_NAC'
        OnPrint = PonerPesos
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 202
        Top = 234
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          619.125000000000000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'PESO_DEST'
        OnPrint = PonerPesos
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 202
        Top = 260
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          687.916666666666800000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'PESO_ANIO'
        OnPrint = PonerPesos
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 202
        Top = 287
        Width = 96
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          759.354166666666800000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'PESO_ADULTO'
        OnPrint = PonerPesos
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 202
        Top = 384
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          1016.000000000000000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'CIRC_ESC'
        OnPrint = PonerCentimetros
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 290
        Top = 385
        Width = 110
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          767.291666666666800000
          1018.645833333333000000
          291.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'FECHA_MED_CIR_ESC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = PonerFecha
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 202
        Top = 410
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          1084.791666666667000000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'CAP_SERV'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText11: TQRDBText
        Left = 290
        Top = 411
        Width = 123
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          767.291666666666800000
          1087.437500000000000000
          325.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'FECHA_MED_CAP_SERV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = PonerFecha
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 202
        Top = 434
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          1148.291666666667000000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'EDAD_MED'
        OnPrint = PonerMeses
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText13: TQRDBText
        Left = 202
        Top = 336
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          889.000000000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'ALZADA'
        OnPrint = PonerCentimetros
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText14: TQRDBText
        Left = 290
        Top = 337
        Width = 112
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          767.291666666666800000
          891.645833333333200000
          296.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'FECHA_MED_ALZADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = PonerFecha
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 290
        Top = 361
        Width = 103
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          767.291666666666800000
          955.145833333333200000
          272.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'FECHA_MED_FRAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = PonerFecha
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText17: TQRDBText
        Left = 585
        Top = 195
        Width = 104
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1547.812500000000000000
          515.937500000000000000
          275.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'GDPV_DESTETE'
        OnPrint = PonerPesos
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText18: TQRDBText
        Left = 585
        Top = 255
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1547.812500000000000000
          674.687500000000000000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'GDPV_ANIO'
        OnPrint = PonerPesos
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText19: TQRDBText
        Left = 585
        Top = 317
        Width = 96
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1547.812500000000000000
          838.729166666666800000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'GDPV_ADULTO'
        OnPrint = PonerPesos
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText20: TQRDBText
        Left = 202
        Top = 185
        Width = 91
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          489.479166666666700000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'EDAD_MADRE'
        OnPrint = QRDBText20Print
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText15: TQRDBText
        Left = 202
        Top = 360
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          952.500000000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'FRAME'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBTRp: TQRDBText
        Left = 120
        Top = 8
        Width = 34
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333320000
          317.500000000000000000
          21.166666666666670000
          89.958333333333320000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'RP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
      object QRShape21: TQRShape
        Left = 0
        Top = 457
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
          1209.145833333333000000
          1899.708333333333000000)
        Pen.Width = 2
        Shape = qrsHorLine
      end
      object QRShape23: TQRShape
        Left = -1
        Top = 100
        Width = 718
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          -2.645833333333333000
          264.583333333333400000
          1899.708333333333000000)
        Pen.Width = 2
        Shape = qrsHorLine
      end
      object QRLNom: TQRLabel
        Left = 272
        Top = 9
        Width = 79
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          719.666666666666800000
          23.812500000000000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre: '
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
      object QRDBText1: TQRDBText
        Left = 354
        Top = 10
        Width = 359
        Height = 53
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          140.229166666666700000
          936.625000000000100000
          26.458333333333330000
          949.854166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'NOMBRE'
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
      object QRLabel8: TQRLabel
        Left = 19
        Top = 312
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          50.270833333333330000
          825.500000000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Peso Actual: '
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
      object QRDBText2: TQRDBText
        Left = 202
        Top = 312
        Width = 95
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          825.500000000000000000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'PESO_ACTUAL'
        OnPrint = PonerPesos
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText22: TQRDBText
        Left = 290
        Top = 312
        Width = 68
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          767.291666666666800000
          825.500000000000000000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'FECHA_PESO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = PonerFecha
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 453
        Top = 381
        Width = 115
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1198.562500000000000000
          1008.062500000000000000
          304.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Ultima Ganancia: '
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
      object QRDBText23: TQRDBText
        Left = 585
        Top = 381
        Width = 91
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1547.812500000000000000
          1008.062500000000000000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'GDPV_ULTIMA'
        OnPrint = PonerPesos
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText24: TQRDBText
        Left = 8
        Top = 8
        Width = 102
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333320000
          21.166666666666670000
          21.166666666666670000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = IBQDatos
        DataField = 'TIPO_RP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
      object QRLabel91: TQRLabel
        Left = 7
        Top = 44
        Width = 148
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          18.520833333333330000
          116.416666666666700000
          391.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tipo de Registro:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'LabelEstado'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRLInspeccion: TQRLabel
        Left = 7
        Top = 75
        Width = 91
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          18.520833333333330000
          198.437500000000000000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Inspecci'#243'n:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'LabelEstado'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLDestino: TQRLabel
        Left = 351
        Top = 74
        Width = 66
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          928.687500000000000000
          195.791666666666700000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Destino:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'LabelEstado'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLInspeccionV: TQRLabel
        Left = 103
        Top = 75
        Width = 79
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          272.520833333333300000
          198.437500000000000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Inspecci'#243'n:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'LabelEstado'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLDestinoV: TQRLabel
        Left = 423
        Top = 74
        Width = 59
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1119.187500000000000000
          195.791666666666700000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Destino:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'LabelEstado'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLRegistro: TQRLabel
        Left = 162
        Top = 45
        Width = 64
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          428.625000000000000000
          119.062500000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Registro:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'LabelEstado'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    object QRBand8: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 147
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand8BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        388.937500000000000000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QRImage1: TQRImage
        Left = 8
        Top = 23
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
          60.854166666666680000
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
      object QRLabel6: TQRLabel
        Left = 260
        Top = 116
        Width = 154
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          687.916666666666800000
          306.916666666666700000
          407.458333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Reporte Individual'
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
      object QRLEstablecimientos: TQRLabel
        Left = 531
        Top = 89
        Width = 180
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1404.937500000000000000
          235.479166666666700000
          476.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre del establecimiento'
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
      object QRSysData3: TQRSysData
        Left = 673
        Top = 126
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          333.375000000000000000
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
      object QRShape9: TQRShape
        Left = 0
        Top = 86
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
          227.541666666666700000
          1899.708333333333000000)
        Shape = qrsHorLine
      end
      object QRLRenglon1: TQRLabel
        Left = 561
        Top = 109
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
          288.395833333333300000
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
      object QRShape2: TQRShape
        Left = 0
        Top = 145
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
          383.645833333333400000
          1899.708333333333000000)
        Pen.Width = 2
        Shape = qrsHorLine
      end
      object QRLabel2: TQRLabel
        Left = 262
        Top = 11
        Width = 173
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333320000
          693.208333333333200000
          29.104166666666670000
          457.729166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Unidad de Control '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRImage3: TQRImage
        Left = 585
        Top = 3
        Width = 128
        Height = 76
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          201.083333333333300000
          1547.812500000000000000
          7.937500000000000000
          338.666666666666700000)
        AutoSize = True
        Stretch = True
      end
      object QRLabel9: TQRLabel
        Left = 223
        Top = 39
        Width = 237
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333320000
          590.020833333333200000
          103.187500000000000000
          627.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'de Procesos Productivos'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
    end
    object QRGenealogia: TQuickRep
      Left = 32
      Top = 752
      Width = 794
      Height = 1123
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      DataSet = IBQArbolGenea
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
      PrintIfEmpty = False
      SnapToGrid = True
      Units = MM
      Zoom = 100
      object QRBand4: TQRBand
        Left = 38
        Top = 449
        Width = 718
        Height = 18
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
          47.625000000000000000
          1899.708333333333000000)
        BandType = rbPageFooter
        object QRShape6: TQRShape
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
        object QRLabel3: TQRLabel
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
      end
      object QRBand2: TQRBand
        Left = 38
        Top = 38
        Width = 718
        Height = 411
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
          1087.437500000000000000
          1899.708333333333000000)
        BandType = rbTitle
        object QRShape8: TQRShape
          Left = 4
          Top = 46
          Width = 248
          Height = 57
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            150.812500000000000000
            10.583333333333330000
            121.708333333333400000
            656.166666666666800000)
          Shape = qrsRectangle
        end
        object Succ6: TQRShape
          Left = 398
          Top = 261
          Width = 267
          Height = 57
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            150.812500000000000000
            1053.041666666667000000
            690.562500000000000000
            706.437500000000000000)
          Shape = qrsRectangle
        end
        object Succ5: TQRShape
          Left = 75
          Top = 261
          Width = 270
          Height = 57
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            150.812500000000000000
            198.437500000000000000
            690.562500000000000000
            714.375000000000000000)
          Shape = qrsRectangle
        end
        object QRShape7: TQRShape
          Left = -1
          Top = 31
          Width = 719
          Height = 3
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            7.937500000000000000
            -2.645833333333333000
            82.020833333333340000
            1902.354166666667000000)
          Pen.Width = 2
          Shape = qrsHorLine
        end
        object QRLabel12: TQRLabel
          Left = 12
          Top = 5
          Width = 103
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            31.750000000000000000
            13.229166666666670000
            272.520833333333400000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Genealog'#237'a'
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
        object QRLabel16: TQRLabel
          Left = 10
          Top = 39
          Width = 33
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            26.458333333333330000
            103.187500000000000000
            87.312500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Animal'
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
        object Succ1: TQRShape
          Left = 73
          Top = 117
          Width = 272
          Height = 57
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            150.812500000000000000
            193.145833333333300000
            309.562500000000000000
            719.666666666666800000)
          Shape = qrsRectangle
        end
        object P1ucc: TQRMemo
          Left = 78
          Top = 123
          Width = 31
          Height = 46
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            121.708333333333300000
            206.375000000000000000
            325.437500000000000000
            82.020833333333340000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
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
        object P1: TQRLabel
          Left = 79
          Top = 109
          Width = 29
          Height = 15
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            209.020833333333300000
            288.395833333333400000
            76.729166666666680000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Padre'
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
        object Succ2: TQRShape
          Left = 395
          Top = 117
          Width = 270
          Height = 57
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            150.812500000000000000
            1045.104166666667000000
            309.562500000000000000
            714.375000000000000000)
          Shape = qrsRectangle
        end
        object P2ucc: TQRMemo
          Left = 399
          Top = 124
          Width = 31
          Height = 46
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            121.708333333333300000
            1055.687500000000000000
            328.083333333333400000
            82.020833333333340000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
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
        object P2: TQRLabel
          Left = 404
          Top = 109
          Width = 29
          Height = 15
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1068.916666666667000000
            288.395833333333400000
            76.729166666666680000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Padre'
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
        object Succ3: TQRShape
          Left = 74
          Top = 189
          Width = 270
          Height = 57
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            150.812500000000000000
            195.791666666666700000
            500.062500000000100000
            714.375000000000000000)
          Shape = qrsRectangle
        end
        object P3ucc: TQRMemo
          Left = 78
          Top = 196
          Width = 31
          Height = 46
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            121.708333333333300000
            206.375000000000000000
            518.583333333333400000
            82.020833333333340000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
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
        object P3: TQRLabel
          Left = 80
          Top = 181
          Width = 29
          Height = 15
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            211.666666666666700000
            478.895833333333400000
            76.729166666666680000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Padre'
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
        object Succ4: TQRShape
          Left = 398
          Top = 189
          Width = 267
          Height = 57
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            150.812500000000000000
            1053.041666666667000000
            500.062500000000100000
            706.437500000000000000)
          Shape = qrsRectangle
        end
        object P4ucc: TQRMemo
          Left = 406
          Top = 195
          Width = 31
          Height = 46
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            121.708333333333300000
            1074.208333333333000000
            515.937500000000000000
            82.020833333333340000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
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
        object P4: TQRLabel
          Left = 407
          Top = 181
          Width = 29
          Height = 15
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1076.854166666667000000
            478.895833333333400000
            76.729166666666680000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Padre'
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
        object P5: TQRLabel
          Left = 83
          Top = 254
          Width = 29
          Height = 15
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            219.604166666666700000
            672.041666666666800000
            76.729166666666680000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Padre'
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
        object P5ucc: TQRMemo
          Left = 79
          Top = 268
          Width = 31
          Height = 46
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            121.708333333333300000
            209.020833333333300000
            709.083333333333400000
            82.020833333333340000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
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
        object P6ucc: TQRMemo
          Left = 402
          Top = 269
          Width = 31
          Height = 44
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            116.416666666666700000
            1063.625000000000000000
            711.729166666666800000
            82.020833333333340000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
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
        object P6: TQRLabel
          Left = 408
          Top = 253
          Width = 29
          Height = 15
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1079.500000000000000000
            669.395833333333400000
            76.729166666666680000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Padre'
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
        object SuccM: TQRShape
          Left = 74
          Top = 333
          Width = 272
          Height = 57
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            150.812500000000000000
            195.791666666666700000
            881.062500000000000000
            719.666666666666800000)
          Shape = qrsRectangle
        end
        object Mucc: TQRMemo
          Left = 78
          Top = 340
          Width = 27
          Height = 46
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            121.708333333333300000
            206.375000000000000000
            899.583333333333400000
            71.437500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
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
        object Ma: TQRLabel
          Left = 83
          Top = 326
          Width = 31
          Height = 15
          Enabled = False
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            219.604166666666700000
            862.541666666666900000
            82.020833333333340000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Madre'
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
        object Aucc: TQRMemo
          Left = 8
          Top = 51
          Width = 27
          Height = 48
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            127.000000000000000000
            21.166666666666670000
            134.937500000000000000
            71.437500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
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
        object LVert: TQRShape
          Left = 32
          Top = 103
          Width = 9
          Height = 114
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            301.625000000000000000
            84.666666666666680000
            272.520833333333400000
            23.812500000000000000)
          Shape = qrsVertLine
        end
        object LHor: TQRShape
          Left = 37
          Top = 212
          Width = 37
          Height = 9
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            23.812500000000000000
            97.895833333333340000
            560.916666666666800000
            97.895833333333340000)
          Shape = qrsHorLine
        end
        object QRShape20: TQRShape
          Left = 36
          Top = 141
          Width = 37
          Height = 9
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            23.812500000000000000
            95.250000000000000000
            373.062500000000000000
            97.895833333333340000)
          Shape = qrsHorLine
        end
      end
    end
  end
  object QRGenealogiaCompleta: TQuickRep [5]
    Left = 576
    Top = 197
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
    object QRBand5: TQRBand
      Left = 38
      Top = 1002
      Width = 718
      Height = 76
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        201.083333333333300000
        1899.708333333333000000)
      BandType = rbDetail
      object LabelLinea1: TQRDBText
        Left = 460
        Top = 16
        Width = 250
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          42.333333333333340000
          1217.083333333333000000
          42.333333333333340000
          661.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'ID_RP'
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
      object LabelCategoriaPadre: TQRLabel
        Left = 460
        Top = 2
        Width = 101
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1217.083333333333000000
          5.291666666666667000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LabelCategoriaPadre'
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
      object labelLinea2: TQRDBText
        Left = 460
        Top = 31
        Width = 250
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          42.333333333333340000
          1217.083333333333000000
          82.020833333333340000
          661.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'ID_HBA'
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
      object labelLinea3: TQRDBText
        Left = 460
        Top = 46
        Width = 250
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          42.333333333333340000
          1217.083333333333000000
          121.708333333333300000
          661.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'RAZA'
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
      object QRSPadres: TQRShape
        Left = 50
        Top = 0
        Width = 10
        Height = 70
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          185.208333333333300000
          132.291666666666700000
          0.000000000000000000
          26.458333333333330000)
        Pen.Color = clGray
        Shape = qrsVertLine
      end
      object QRSAbuelos: TQRShape
        Left = 250
        Top = 0
        Width = 10
        Height = 70
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          185.208333333333300000
          661.458333333333400000
          0.000000000000000000
          26.458333333333330000)
        Pen.Color = clGray
        Shape = qrsVertLine
      end
      object QRSBisAbuelos: TQRShape
        Left = 150
        Top = 0
        Width = 10
        Height = 70
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          185.208333333333300000
          396.875000000000000000
          0.000000000000000000
          26.458333333333330000)
        Pen.Color = clGray
        Shape = qrsVertLine
      end
      object QRSHorizontal: TQRShape
        Left = 255
        Top = 31
        Width = 34
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          674.687500000000000000
          82.020833333333340000
          89.958333333333340000)
        Pen.Color = clGray
        Shape = qrsHorLine
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 1078
      Width = 718
      Height = 18
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
        47.625000000000000000
        1899.708333333333000000)
      BandType = rbPageFooter
      object QRShape3: TQRShape
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
      object QRLabel26: TQRLabel
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
      object QRLabel27: TQRLabel
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
    end
    object QRBand9: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 147
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        388.937500000000000000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QRSysData4: TQRSysData
        Left = 672
        Top = 126
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1778.000000000000000000
          333.375000000000000000
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
      object QRLRenglon3: TQRLabel
        Left = 560
        Top = 104
        Width = 150
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1481.666666666667000000
          275.166666666666700000
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
      object QRLEstablecimiento1: TQRLabel
        Left = 530
        Top = 83
        Width = 180
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          219.604166666666700000
          476.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre del establecimiento'
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
        Left = 585
        Top = 3
        Width = 128
        Height = 76
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          201.083333333333300000
          1547.812500000000000000
          7.937500000000000000
          338.666666666666700000)
        AutoSize = True
        Stretch = True
      end
      object QRShape27: TQRShape
        Left = 0
        Top = 86
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
          227.541666666666700000
          1899.708333333333000000)
        Shape = qrsHorLine
      end
      object QRImage4: TQRImage
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
      object QRLabel32: TQRLabel
        Left = 262
        Top = 11
        Width = 173
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333320000
          693.208333333333200000
          29.104166666666670000
          457.729166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Unidad de Control '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel33: TQRLabel
        Left = 223
        Top = 39
        Width = 237
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333320000
          590.020833333333200000
          103.187500000000000000
          627.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'de Procesos Productivos'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel11: TQRLabel
        Left = 260
        Top = 116
        Width = 154
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          687.916666666666800000
          306.916666666666700000
          407.458333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Reporte Individual'
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
    end
    object banda: TQRBand
      Left = 38
      Top = 185
      Width = 718
      Height = 817
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = True
      ForceNewPage = True
      Size.Values = (
        2161.645833333333000000
        1899.708333333333000000)
      BandType = rbTitle
      object QRShape108: TQRShape
        Left = 0
        Top = 388
        Width = 369
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          1026.583333333333000000
          976.312500000000000000)
        Shape = qrsRectangle
      end
      object Linea3: TQRLabel
        Left = 11
        Top = 392
        Width = 242
        Height = 16
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          29.104166666666670000
          1037.166666666667000000
          640.291666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelLinea3'
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
      object LabelGenealogia: TQRLabel
        Left = 12
        Top = 2
        Width = 103
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          31.750000000000000000
          5.291666666666667000
          272.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Genealog'#237'a'
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
      object QRShape16: TQRShape
        Left = -1
        Top = 26
        Width = 719
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          -2.645833333333333000
          68.791666666666680000
          1902.354166666667000000)
        Pen.Width = 2
        Shape = qrsHorLine
      end
      object InfPPP: TQRMemo
        Left = 300
        Top = 76
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          793.750000000000000000
          201.083333333333300000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object LVPPP: TQRShape
        Left = 207
        Top = 79
        Width = 70
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          547.687500000000000000
          209.020833333333300000
          185.208333333333300000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object LHPPP: TQRShape
        Left = 204
        Top = 83
        Width = 9
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666666700000
          539.750000000000000000
          219.604166666666700000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object InfPP: TQRMemo
        Left = 200
        Top = 123
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          325.437500000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object LVPP: TQRShape
        Left = 106
        Top = 128
        Width = 71
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          280.458333333333400000
          338.666666666666700000
          187.854166666666700000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object LHPP: TQRShape
        Left = 103
        Top = 132
        Width = 9
        Height = 71
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          187.854166666666700000
          272.520833333333400000
          349.250000000000000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object InfP: TQRMemo
        Left = 100
        Top = 207
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          264.583333333333300000
          547.687500000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object LVPPM: TQRShape
        Left = 207
        Top = 172
        Width = 70
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          547.687500000000000000
          455.083333333333300000
          185.208333333333300000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object LHPPM: TQRShape
        Left = 204
        Top = 140
        Width = 9
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666666700000
          539.750000000000000000
          370.416666666666700000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object InfPPM: TQRMemo
        Left = 300
        Top = 168
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          793.750000000000000000
          444.500000000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfPMP: TQRMemo
        Left = 300
        Top = 248
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          793.750000000000000000
          656.166666666666800000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object LVPMP: TQRShape
        Left = 207
        Top = 252
        Width = 70
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          547.687500000000000000
          666.750000000000000000
          185.208333333333300000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object LHPMP: TQRShape
        Left = 203
        Top = 256
        Width = 9
        Height = 37
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          97.895833333333340000
          537.104166666666800000
          677.333333333333400000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object InfPM: TQRMemo
        Left = 200
        Top = 297
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          785.812500000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object LVPM: TQRShape
        Left = 106
        Top = 300
        Width = 71
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          280.458333333333400000
          793.750000000000000000
          187.854166666666700000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object LHPM: TQRShape
        Left = 103
        Top = 227
        Width = 9
        Height = 78
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          206.375000000000000000
          272.520833333333400000
          600.604166666666800000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object LHPMM: TQRShape
        Left = 203
        Top = 309
        Width = 9
        Height = 37
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          97.895833333333340000
          537.104166666666800000
          817.562500000000000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object LVPMM: TQRShape
        Left = 208
        Top = 340
        Width = 70
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          550.333333333333400000
          899.583333333333400000
          185.208333333333300000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object InfPMM: TQRMemo
        Left = 300
        Top = 337
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          793.750000000000000000
          891.645833333333200000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Linea1: TQRLabel
        Left = 28
        Top = 393
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          74.083333333333340000
          1039.812500000000000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LabelLinea1'
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
      object Linea2: TQRLabel
        Left = 211
        Top = 393
        Width = 242
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          558.270833333333400000
          1039.812500000000000000
          640.291666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LabelLinea2'
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
      object LHP: TQRShape
        Left = 13
        Top = 214
        Width = 9
        Height = 172
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          455.083333333333300000
          34.395833333333340000
          566.208333333333400000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object LVP: TQRShape
        Left = 17
        Top = 210
        Width = 60
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          44.979166666666670000
          555.625000000000000000
          158.750000000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object InfMPP: TQRMemo
        Left = 300
        Top = 443
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          793.750000000000000000
          1172.104166666667000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object LVMPP: TQRShape
        Left = 207
        Top = 446
        Width = 70
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          547.687500000000000000
          1180.041666666667000000
          185.208333333333300000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object LHMPP: TQRShape
        Left = 203
        Top = 450
        Width = 9
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          537.104166666666800000
          1190.625000000000000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object InfMP: TQRMemo
        Left = 200
        Top = 485
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          529.166666666666800000
          1283.229166666667000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object LHMPM: TQRShape
        Left = 203
        Top = 503
        Width = 9
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333340000
          537.104166666666800000
          1330.854166666667000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object LVMPM: TQRShape
        Left = 206
        Top = 530
        Width = 70
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          545.041666666666800000
          1402.291666666667000000
          185.208333333333300000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object InfMPM: TQRMemo
        Left = 300
        Top = 529
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          793.750000000000000000
          1399.645833333333000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfMMP: TQRMemo
        Left = 300
        Top = 641
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          793.750000000000000000
          1695.979166666667000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object LVMMP: TQRShape
        Left = 207
        Top = 645
        Width = 70
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          547.687500000000000000
          1706.562500000000000000
          185.208333333333300000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object LHMMP: TQRShape
        Left = 204
        Top = 649
        Width = 9
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666666700000
          539.750000000000000000
          1717.145833333333000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object InfM: TQRMemo
        Left = 100
        Top = 575
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          264.583333333333400000
          1521.354166666667000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object LHMP: TQRShape
        Left = 100
        Top = 491
        Width = 9
        Height = 82
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          216.958333333333400000
          264.583333333333400000
          1299.104166666667000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object LVMP: TQRShape
        Left = 104
        Top = 488
        Width = 71
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          275.166666666666700000
          1291.166666666667000000
          187.854166666666700000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object LHM: TQRShape
        Left = 13
        Top = 414
        Width = 9
        Height = 170
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          449.791666666666700000
          34.395833333333340000
          1095.375000000000000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object LVM: TQRShape
        Left = 17
        Top = 578
        Width = 60
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          44.979166666666670000
          1529.291666666667000000
          158.750000000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object LHMM: TQRShape
        Left = 100
        Top = 592
        Width = 9
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.812500000000000000
          264.583333333333400000
          1566.333333333333000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object LVMM: TQRShape
        Left = 104
        Top = 691
        Width = 71
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          275.166666666666700000
          1828.270833333333000000
          187.854166666666700000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object InfMM: TQRMemo
        Left = 200
        Top = 688
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          529.166666666666800000
          1820.333333333333000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object LHMMM: TQRShape
        Left = 204
        Top = 706
        Width = 9
        Height = 43
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          113.770833333333300000
          539.750000000000000000
          1867.958333333333000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object LVMMM: TQRShape
        Left = 208
        Top = 744
        Width = 70
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          550.333333333333400000
          1968.500000000000000000
          185.208333333333300000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object InfMMM: TQRMemo
        Left = 300
        Top = 742
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          793.750000000000000000
          1963.208333333333000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfMMMM: TQRMemo
        Left = 400
        Top = 766
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          2026.708333333333000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfMMMP: TQRMemo
        Left = 400
        Top = 718
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          1899.708333333333000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfMMPM: TQRMemo
        Left = 400
        Top = 662
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          1751.541666666667000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfMMPP: TQRMemo
        Left = 400
        Top = 619
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          1637.770833333333000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfMPMM: TQRMemo
        Left = 400
        Top = 550
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          1455.208333333333000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfMPMP: TQRMemo
        Left = 400
        Top = 510
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          1349.375000000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfMPPM: TQRMemo
        Left = 400
        Top = 463
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          1225.020833333333000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfMPPP: TQRMemo
        Left = 400
        Top = 426
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          1127.125000000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfPMMM: TQRMemo
        Left = 400
        Top = 358
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          947.208333333333400000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfPMMP: TQRMemo
        Left = 400
        Top = 317
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          838.729166666666800000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfPMPM: TQRMemo
        Left = 400
        Top = 269
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          711.729166666666800000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfPMPP: TQRMemo
        Left = 400
        Top = 229
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          605.895833333333400000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfPPMM: TQRMemo
        Left = 400
        Top = 187
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          494.770833333333400000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfPPMP: TQRMemo
        Left = 400
        Top = 149
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          394.229166666666700000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfPPPM: TQRMemo
        Left = 400
        Top = 93
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          246.062500000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object InfPPPP: TQRMemo
        Left = 400
        Top = 53
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          140.229166666666700000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'RP: Desconocido')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape76: TQRShape
        Left = 308
        Top = 56
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          814.916666666666800000
          148.166666666666700000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape77: TQRShape
        Left = 304
        Top = 60
        Width = 9
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          158.750000000000000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape78: TQRShape
        Left = 304
        Top = 158
        Width = 9
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          804.333333333333200000
          418.041666666666700000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape79: TQRShape
        Left = 308
        Top = 154
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          814.916666666666800000
          407.458333333333400000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape80: TQRShape
        Left = 304
        Top = 238
        Width = 9
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          804.333333333333200000
          629.708333333333400000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape81: TQRShape
        Left = 308
        Top = 235
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          814.916666666666800000
          621.770833333333400000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape82: TQRShape
        Left = 306
        Top = 327
        Width = 9
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          809.625000000000000000
          865.187500000000000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape83: TQRShape
        Left = 309
        Top = 323
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          817.562500000000000000
          854.604166666666800000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape84: TQRShape
        Left = 305
        Top = 433
        Width = 9
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          26.458333333333330000
          806.979166666666800000
          1145.645833333333000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape85: TQRShape
        Left = 308
        Top = 429
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          814.916666666666800000
          1135.062500000000000000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape86: TQRShape
        Left = 306
        Top = 516
        Width = 9
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          809.625000000000000000
          1365.250000000000000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape87: TQRShape
        Left = 309
        Top = 512
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          817.562500000000000000
          1354.666666666667000000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape88: TQRShape
        Left = 306
        Top = 627
        Width = 9
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          809.625000000000000000
          1658.937500000000000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape89: TQRShape
        Left = 309
        Top = 623
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          817.562500000000000000
          1648.354166666667000000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape90: TQRShape
        Left = 309
        Top = 721
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          817.562500000000000000
          1907.645833333333000000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape91: TQRShape
        Left = 306
        Top = 725
        Width = 9
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          1918.229166666667000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape92: TQRShape
        Left = 306
        Top = 757
        Width = 9
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          2002.895833333333000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape93: TQRShape
        Left = 309
        Top = 769
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          817.562500000000000000
          2034.645833333333000000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape94: TQRShape
        Left = 309
        Top = 666
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          817.562500000000000000
          1762.125000000000000000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape95: TQRShape
        Left = 306
        Top = 656
        Width = 9
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          1735.666666666667000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape96: TQRShape
        Left = 309
        Top = 554
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          817.562500000000000000
          1465.791666666667000000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape97: TQRShape
        Left = 306
        Top = 544
        Width = 9
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          1439.333333333333000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape98: TQRShape
        Left = 308
        Top = 466
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          814.916666666666800000
          1232.958333333333000000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape99: TQRShape
        Left = 305
        Top = 456
        Width = 9
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          806.979166666666800000
          1206.500000000000000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape100: TQRShape
        Left = 309
        Top = 365
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          817.562500000000000000
          965.729166666666800000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape101: TQRShape
        Left = 306
        Top = 355
        Width = 9
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          809.625000000000000000
          939.270833333333400000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape102: TQRShape
        Left = 304
        Top = 267
        Width = 9
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          804.333333333333200000
          706.437500000000000000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape103: TQRShape
        Left = 308
        Top = 277
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          814.916666666666800000
          732.895833333333400000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape104: TQRShape
        Left = 304
        Top = 187
        Width = 9
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          804.333333333333200000
          494.770833333333400000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape105: TQRShape
        Left = 308
        Top = 193
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          814.916666666666800000
          510.645833333333300000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object QRShape106: TQRShape
        Left = 304
        Top = 91
        Width = 9
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          804.333333333333200000
          240.770833333333300000
          23.812500000000000000)
        Pen.Color = clGreen
        Shape = qrsVertLine
      end
      object QRShape107: TQRShape
        Left = 308
        Top = 98
        Width = 69
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          814.916666666666800000
          259.291666666666700000
          182.562500000000000000)
        Pen.Color = clGreen
        Shape = qrsHorLine
      end
      object IP: TQRImage
        Left = 81
        Top = 207
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          214.312500000000000000
          547.687500000000000000
          44.979166666666670000)
      end
      object IM: TQRImage
        Left = 80
        Top = 575
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          1521.354166666667000000
          44.979166666666670000)
      end
      object IPP: TQRImage
        Left = 180
        Top = 123
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          476.250000000000000000
          325.437500000000000000
          44.979166666666670000)
      end
      object IPM: TQRImage
        Left = 181
        Top = 297
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          478.895833333333400000
          785.812500000000000000
          44.979166666666670000)
      end
      object IPPP: TQRImage
        Left = 280
        Top = 76
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          201.083333333333300000
          44.979166666666670000)
      end
      object IPPM: TQRImage
        Left = 280
        Top = 168
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          444.500000000000000000
          44.979166666666670000)
      end
      object IPMP: TQRImage
        Left = 280
        Top = 248
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          656.166666666666800000
          44.979166666666670000)
      end
      object IPMM: TQRImage
        Left = 280
        Top = 337
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          891.645833333333200000
          44.979166666666670000)
      end
      object IMP: TQRImage
        Left = 181
        Top = 485
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          478.895833333333400000
          1283.229166666667000000
          44.979166666666670000)
      end
      object IMM: TQRImage
        Left = 181
        Top = 688
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          478.895833333333400000
          1820.333333333333000000
          44.979166666666670000)
      end
      object IMPP: TQRImage
        Left = 282
        Top = 443
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          746.125000000000000000
          1172.104166666667000000
          44.979166666666670000)
      end
      object IMPM: TQRImage
        Left = 282
        Top = 529
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          746.125000000000000000
          1399.645833333333000000
          44.979166666666670000)
      end
      object IMMP: TQRImage
        Left = 282
        Top = 641
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          746.125000000000000000
          1695.979166666667000000
          44.979166666666670000)
      end
      object IMMM: TQRImage
        Left = 281
        Top = 742
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          743.479166666666800000
          1963.208333333333000000
          44.979166666666670000)
      end
      object IPPPP: TQRImage
        Left = 381
        Top = 52
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          137.583333333333300000
          44.979166666666670000)
      end
      object IPPMP: TQRImage
        Left = 381
        Top = 148
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          391.583333333333400000
          44.979166666666670000)
      end
      object IPMPP: TQRImage
        Left = 381
        Top = 229
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          605.895833333333400000
          44.979166666666670000)
      end
      object IPMMP: TQRImage
        Left = 381
        Top = 317
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          838.729166666666800000
          44.979166666666670000)
      end
      object IPPPM: TQRImage
        Left = 381
        Top = 93
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          246.062500000000000000
          44.979166666666670000)
      end
      object IPPMM: TQRImage
        Left = 381
        Top = 187
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          494.770833333333400000
          44.979166666666670000)
      end
      object IPMPM: TQRImage
        Left = 381
        Top = 269
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          711.729166666666800000
          44.979166666666670000)
      end
      object IPMMM: TQRImage
        Left = 381
        Top = 358
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          947.208333333333400000
          44.979166666666670000)
      end
      object IMPPP: TQRImage
        Left = 381
        Top = 425
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          1124.479166666667000000
          44.979166666666670000)
      end
      object IMPPM: TQRImage
        Left = 381
        Top = 463
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          1225.020833333333000000
          44.979166666666670000)
      end
      object IMPMP: TQRImage
        Left = 381
        Top = 510
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          1349.375000000000000000
          44.979166666666670000)
      end
      object IMPMM: TQRImage
        Left = 381
        Top = 550
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          1455.208333333333000000
          44.979166666666670000)
      end
      object IMMPP: TQRImage
        Left = 381
        Top = 620
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          1640.416666666667000000
          44.979166666666670000)
      end
      object IMMPM: TQRImage
        Left = 381
        Top = 661
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          1748.895833333334000000
          44.979166666666670000)
      end
      object IMMMP: TQRImage
        Left = 381
        Top = 717
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          1897.062500000000000000
          44.979166666666670000)
      end
      object IMMMM: TQRImage
        Left = 381
        Top = 765
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          2024.062500000000000000
          44.979166666666670000)
      end
      object IAnimal: TQRImage
        Left = 4
        Top = 392
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          1037.166666666667000000
          44.979166666666670000)
      end
    end
  end
  object QRDep: TQuickRep [6]
    Left = 48
    Top = 45
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = FREPFichaAnimal.IBQRegDep
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
    PrintIfEmpty = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand6: TQRBand
      Left = 38
      Top = 505
      Width = 718
      Height = 18
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
        47.625000000000000000
        1899.708333333333000000)
      BandType = rbPageFooter
      object QRShape4: TQRShape
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
      object QRLabel13: TQRLabel
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
      object QRSysData5: TQRSysData
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
      object QRLabel14: TQRLabel
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
    end
    object QRBand7: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 251
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
        664.104166666666800000
        1899.708333333333000000)
      BandType = rbTitle
      object QRShape13: TQRShape
        Left = -1
        Top = 31
        Width = 719
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          -2.645833333333333000
          82.020833333333340000
          1902.354166666667000000)
        Pen.Width = 2
        Shape = qrsHorLine
      end
      object QRLabel15: TQRLabel
        Left = 12
        Top = 5
        Width = 146
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          31.750000000000000000
          13.229166666666670000
          386.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos Gen'#233'ticos'
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
      object QRShape17: TQRShape
        Left = 8
        Top = 80
        Width = 705
        Height = 121
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          320.145833333333400000
          21.166666666666670000
          211.666666666666700000
          1865.312500000000000000)
        Shape = qrsRectangle
      end
      object QRShape5: TQRShape
        Left = 67
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          177.270833333333300000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape11: TQRShape
        Left = 141
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          373.062500000000000000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape22: TQRShape
        Left = 189
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          500.062500000000100000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape12: TQRShape
        Left = 233
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          616.479166666666800000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape24: TQRShape
        Left = 276
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          730.250000000000000000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape25: TQRShape
        Left = 322
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          851.958333333333400000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape26: TQRShape
        Left = 367
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          971.020833333333400000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape14: TQRShape
        Left = 415
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1098.020833333333000000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape28: TQRShape
        Left = 466
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1232.958333333333000000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape29: TQRShape
        Left = 516
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1365.250000000000000000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape30: TQRShape
        Left = 562
        Top = 81
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1486.958333333333000000
          214.312500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape31: TQRShape
        Left = 609
        Top = 81
        Width = 16
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1611.312500000000000000
          214.312500000000000000
          42.333333333333340000)
        Shape = qrsVertLine
      end
      object QRShape32: TQRShape
        Left = 657
        Top = 81
        Width = 15
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1738.312500000000000000
          214.312500000000000000
          39.687500000000000000)
        Shape = qrsVertLine
      end
      object QRShape19: TQRShape
        Left = 70
        Top = 80
        Width = 75
        Height = 46
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          121.708333333333300000
          185.208333333333300000
          211.666666666666700000
          198.437500000000000000)
        Brush.Color = clBlack
        Shape = qrsRectangle
      end
      object QRShape18: TQRShape
        Left = 145
        Top = 80
        Width = 568
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          383.645833333333400000
          211.666666666666700000
          1502.833333333333000000)
        Brush.Color = clBlack
        Shape = qrsRectangle
      end
      object QRLabel17: TQRLabel
        Left = 152
        Top = 83
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666700000
          219.604166666666700000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Gest.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 204
        Top = 83
        Width = 30
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          539.750000000000000000
          219.604166666666700000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nacer'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel29: TQRLabel
        Left = 248
        Top = 83
        Width = 26
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          656.166666666666800000
          219.604166666666700000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dest.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel30: TQRLabel
        Left = 289
        Top = 83
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          764.645833333333200000
          219.604166666666700000
          82.020833333333320000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Leche'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel31: TQRLabel
        Left = 340
        Top = 83
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          899.583333333333200000
          219.604166666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Final'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 387
        Top = 83
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1023.937500000000000000
          219.604166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.E.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 430
        Top = 83
        Width = 30
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1137.708333333333000000
          219.604166666666700000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Altura'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel34: TQRLabel
        Left = 483
        Top = 83
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1277.937500000000000000
          219.604166666666700000
          82.020833333333320000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'E.G.D.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel35: TQRLabel
        Left = 531
        Top = 83
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1404.937500000000000000
          219.604166666666700000
          82.020833333333320000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'E.G.C.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel36: TQRLabel
        Left = 577
        Top = 83
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1526.645833333333000000
          219.604166666666700000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'A.O.B.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel37: TQRLabel
        Left = 623
        Top = 83
        Width = 30
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1648.354166666667000000
          219.604166666666700000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '% G.I.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel38: TQRLabel
        Left = 667
        Top = 83
        Width = 35
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1764.770833333333000000
          219.604166666666700000
          92.604166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '% C.M.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 89
        Top = 105
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          235.479166666666700000
          277.812500000000000000
          84.666666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Rodeo'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 92
        Top = 83
        Width = 26
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          243.416666666666700000
          219.604166666666700000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cr'#237'as'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel39: TQRLabel
        Left = 159
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          420.687500000000000000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape33: TQRShape
        Left = 146
        Top = 121
        Width = 567
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          386.291666666666700000
          320.145833333333400000
          1500.187500000000000000)
        Shape = qrsHorLine
      end
      object QRLabel40: TQRLabel
        Left = 207
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          547.687500000000000000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel41: TQRLabel
        Left = 251
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          664.104166666666800000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel42: TQRLabel
        Left = 292
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          772.583333333333200000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel43: TQRLabel
        Left = 340
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          899.583333333333200000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel44: TQRLabel
        Left = 385
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1018.645833333333000000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel45: TQRLabel
        Left = 433
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1145.645833333333000000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel46: TQRLabel
        Left = 486
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1285.875000000000000000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel47: TQRLabel
        Left = 534
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1412.875000000000000000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel48: TQRLabel
        Left = 580
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1534.583333333333000000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel49: TQRLabel
        Left = 630
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1666.875000000000000000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel50: TQRLabel
        Left = 678
        Top = 107
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1793.875000000000000000
          283.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape34: TQRShape
        Left = 146
        Top = 141
        Width = 567
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          386.291666666666700000
          373.062500000000000000
          1500.187500000000000000)
        Shape = qrsHorLine
      end
      object QRLabel51: TQRLabel
        Left = 159
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          420.687500000000000000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel52: TQRLabel
        Left = 207
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          547.687500000000000000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel53: TQRLabel
        Left = 251
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          664.104166666666800000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel54: TQRLabel
        Left = 292
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          772.583333333333200000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel55: TQRLabel
        Left = 340
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          899.583333333333200000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel56: TQRLabel
        Left = 385
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1018.645833333333000000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel57: TQRLabel
        Left = 433
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1145.645833333333000000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel58: TQRLabel
        Left = 486
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1285.875000000000000000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel59: TQRLabel
        Left = 534
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1412.875000000000000000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel60: TQRLabel
        Left = 580
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1534.583333333333000000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel61: TQRLabel
        Left = 630
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1666.875000000000000000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel62: TQRLabel
        Left = 678
        Top = 128
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1793.875000000000000000
          338.666666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape35: TQRShape
        Left = 146
        Top = 169
        Width = 567
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          386.291666666666700000
          447.145833333333400000
          1500.187500000000000000)
        Shape = qrsHorLine
      end
      object QRDBText21: TQRDBText
        Left = 158
        Top = 153
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          418.041666666666700000
          404.812500000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'GESTDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText25: TQRDBText
        Left = 22
        Top = 135
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          58.208333333333320000
          357.187500000000000000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'ANIO'
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
      object QRDBText26: TQRDBText
        Left = 249
        Top = 153
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          658.812500000000000000
          404.812500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'DESTDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText27: TQRDBText
        Left = 209
        Top = 153
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          552.979166666666700000
          404.812500000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'NACERDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText28: TQRDBText
        Left = 290
        Top = 153
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          767.291666666666800000
          404.812500000000000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'LECHEDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText29: TQRDBText
        Left = 337
        Top = 153
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          891.645833333333200000
          404.812500000000000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'FINALDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText30: TQRDBText
        Left = 383
        Top = 153
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1013.354166666667000000
          404.812500000000000000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'CEDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText31: TQRDBText
        Left = 434
        Top = 153
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1148.291666666667000000
          404.812500000000000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'ALTURADEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText32: TQRDBText
        Left = 486
        Top = 153
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1285.875000000000000000
          404.812500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'EGDDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText33: TQRDBText
        Left = 531
        Top = 153
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1404.937500000000000000
          404.812500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'EGCDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText34: TQRDBText
        Left = 577
        Top = 153
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1526.645833333333000000
          404.812500000000000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'AOBDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText35: TQRDBText
        Left = 625
        Top = 153
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1653.645833333333000000
          404.812500000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'PORGIDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText36: TQRDBText
        Left = 674
        Top = 153
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          404.812500000000000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'PORCMDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText37: TQRDBText
        Left = 158
        Top = 179
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          418.041666666666700000
          473.604166666666700000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'GESTPREC'
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
      object QRDBText38: TQRDBText
        Left = 209
        Top = 179
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          552.979166666666700000
          473.604166666666700000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'NACERPREC'
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
      object QRDBText39: TQRDBText
        Left = 250
        Top = 179
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          661.458333333333200000
          473.604166666666700000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'DESTPREC'
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
      object QRDBText40: TQRDBText
        Left = 292
        Top = 179
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          772.583333333333200000
          473.604166666666700000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'LECHEPREC'
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
      object QRDBText41: TQRDBText
        Left = 337
        Top = 179
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          891.645833333333200000
          473.604166666666700000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'FINALPREC'
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
      object QRDBText42: TQRDBText
        Left = 386
        Top = 179
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1021.291666666667000000
          473.604166666666700000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'CEPREC'
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
      object QRDBText43: TQRDBText
        Left = 434
        Top = 179
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1148.291666666667000000
          473.604166666666700000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'ALTURAPREC'
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
      object QRDBText44: TQRDBText
        Left = 489
        Top = 179
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1293.812500000000000000
          473.604166666666700000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'EGDPREC'
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
      object QRDBText45: TQRDBText
        Left = 532
        Top = 179
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1407.583333333333000000
          473.604166666666700000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'EGCPREC'
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
      object QRDBText46: TQRDBText
        Left = 580
        Top = 179
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1534.583333333333000000
          473.604166666666700000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'AOBPREC'
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
      object QRDBText47: TQRDBText
        Left = 628
        Top = 179
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1661.583333333333000000
          473.604166666666700000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'PORGIPREC'
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
      object QRDBText48: TQRDBText
        Left = 674
        Top = 179
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          473.604166666666700000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'PORCMPREC'
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
      object QRDBText49: TQRDBText
        Left = 91
        Top = 137
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          240.770833333333300000
          362.479166666666700000
          84.666666666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'CRIAS'
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
      object QRDBText50: TQRDBText
        Left = 91
        Top = 168
        Width = 37
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          240.770833333333300000
          444.500000000000000000
          97.895833333333320000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'RODEO'
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
      object QRDBText72: TQRDBText
        Left = 56
        Top = 209
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          552.979166666666700000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'FUENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel89: TQRLabel
        Left = 8
        Top = 209
        Width = 41
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          552.979166666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fuente: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand10: TQRBand
      Left = 38
      Top = 289
      Width = 718
      Height = 216
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
        571.500000000000000000
        1899.708333333333000000)
      BandType = rbDetail
      object QRShape15: TQRShape
        Left = -1
        Top = 31
        Width = 719
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          -2.645833333333333000
          82.020833333333340000
          1902.354166666667000000)
        Pen.Width = 2
        Shape = qrsHorLine
      end
      object QRLabel23: TQRLabel
        Left = 12
        Top = 5
        Width = 146
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          31.750000000000000000
          13.229166666666670000
          386.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Datos Gen'#233'ticos'
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
      object QRShape55: TQRShape
        Left = 8
        Top = 56
        Width = 705
        Height = 121
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          320.145833333333400000
          21.166666666666670000
          148.166666666666700000
          1865.312500000000000000)
        Shape = qrsRectangle
      end
      object QRShape56: TQRShape
        Left = 66
        Top = 57
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          174.625000000000000000
          150.812500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape57: TQRShape
        Left = 165
        Top = 96
        Width = 9
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          436.562499999999900000
          254.000000000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape58: TQRShape
        Left = 471
        Top = 57
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1246.187500000000000000
          150.812500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape59: TQRShape
        Left = 512
        Top = 57
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1354.666666666667000000
          150.812500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape60: TQRShape
        Left = 549
        Top = 57
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1452.562500000000000000
          150.812500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape61: TQRShape
        Left = 588
        Top = 57
        Width = 9
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1555.750000000000000000
          150.812500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape62: TQRShape
        Left = 625
        Top = 57
        Width = 16
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1653.645833333333000000
          150.812500000000000000
          42.333333333333340000)
        Shape = qrsVertLine
      end
      object QRShape63: TQRShape
        Left = 668
        Top = 57
        Width = 15
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          1767.416666666667000000
          150.812500000000000000
          39.687500000000000000)
        Shape = qrsVertLine
      end
      object QRShape64: TQRShape
        Left = 70
        Top = 56
        Width = 370
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666666700000
          185.208333333333300000
          148.166666666666700000
          978.958333333333200000)
        Brush.Color = clBlack
        Shape = qrsRectangle
      end
      object QRShape65: TQRShape
        Left = 440
        Top = 56
        Width = 273
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1164.166666666667000000
          148.166666666666700000
          722.312500000000000000)
        Brush.Color = clBlack
        Shape = qrsRectangle
      end
      object QRLabel24: TQRLabel
        Left = 450
        Top = 59
        Width = 14
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1190.625000000000000000
          156.104166666666700000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PN'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 491
        Top = 59
        Width = 14
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1299.104166666667000000
          156.104166666666700000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PD'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 529
        Top = 59
        Width = 14
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1399.645833333333000000
          156.104166666666700000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'HL'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel63: TQRLabel
        Left = 563
        Top = 59
        Width = 19
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1489.604166666667000000
          156.104166666666700000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'P18'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel64: TQRLabel
        Left = 605
        Top = 59
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1600.729166666667000000
          156.104166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.E.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel65: TQRLabel
        Left = 681
        Top = 59
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1801.812500000000000000
          156.104166666666700000
          82.020833333333320000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'E.G.C.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel66: TQRLabel
        Left = 638
        Top = 59
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1688.041666666667000000
          156.104166666666700000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'A.O.B.'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel67: TQRLabel
        Left = 445
        Top = 83
        Width = 20
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1177.395833333333000000
          219.604166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel68: TQRLabel
        Left = 486
        Top = 83
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1285.875000000000000000
          219.604166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel69: TQRLabel
        Left = 524
        Top = 83
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1386.416666666667000000
          219.604166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel70: TQRLabel
        Left = 563
        Top = 83
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1489.604166666667000000
          219.604166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel71: TQRLabel
        Left = 603
        Top = 83
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1595.437500000000000000
          219.604166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel72: TQRLabel
        Left = 686
        Top = 83
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1815.041666666667000000
          219.604166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel73: TQRLabel
        Left = 645
        Top = 83
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          219.604166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel74: TQRLabel
        Left = 445
        Top = 104
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1177.395833333333000000
          275.166666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel75: TQRLabel
        Left = 486
        Top = 104
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1285.875000000000000000
          275.166666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel76: TQRLabel
        Left = 524
        Top = 104
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1386.416666666667000000
          275.166666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel77: TQRLabel
        Left = 563
        Top = 104
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1489.604166666667000000
          275.166666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel78: TQRLabel
        Left = 603
        Top = 104
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1595.437500000000000000
          275.166666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel81: TQRLabel
        Left = 686
        Top = 104
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1815.041666666667000000
          275.166666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel82: TQRLabel
        Left = 645
        Top = 104
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          275.166666666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prec'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText51: TQRDBText
        Left = 22
        Top = 111
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          58.208333333333320000
          293.687500000000000000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'ANIO'
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
      object QRDBText52: TQRDBText
        Left = 484
        Top = 129
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1280.583333333333000000
          341.312500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'DESTDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText53: TQRDBText
        Left = 447
        Top = 129
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1182.687500000000000000
          341.312500000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'NACERDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText54: TQRDBText
        Left = 522
        Top = 129
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1381.125000000000000000
          341.312500000000000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'LECHEDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText55: TQRDBText
        Left = 560
        Top = 129
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          341.312500000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'P18DEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText56: TQRDBText
        Left = 601
        Top = 129
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1590.145833333333000000
          341.312500000000000000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'CEDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText57: TQRDBText
        Left = 685
        Top = 129
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1812.395833333333000000
          341.312500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'EGCDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText58: TQRDBText
        Left = 638
        Top = 129
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1688.041666666667000000
          341.312500000000000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'AOBDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText21Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText59: TQRDBText
        Left = 447
        Top = 155
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1182.687500000000000000
          410.104166666666700000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'NACERPREC'
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
      object QRDBText60: TQRDBText
        Left = 485
        Top = 155
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1283.229166666667000000
          410.104166666666700000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'DESTPREC'
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
      object QRDBText61: TQRDBText
        Left = 524
        Top = 155
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1386.416666666667000000
          410.104166666666700000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'LECHEPREC'
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
      object QRDBText62: TQRDBText
        Left = 560
        Top = 155
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          410.104166666666700000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'P18PREC'
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
      object QRDBText63: TQRDBText
        Left = 604
        Top = 155
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1598.083333333333000000
          410.104166666666700000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'CEPREC'
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
      object QRDBText64: TQRDBText
        Left = 686
        Top = 155
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1815.041666666667000000
          410.104166666666700000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'EGCPREC'
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
      object QRDBText65: TQRDBText
        Left = 641
        Top = 155
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1695.979166666667000000
          410.104166666666700000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'AOBPREC'
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
      object QRDBText66: TQRDBText
        Left = 94
        Top = 128
        Width = 47
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          248.708333333333300000
          338.666666666666700000
          124.354166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'CRIADOR'
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
      object QRShape66: TQRShape
        Left = 435
        Top = 96
        Width = 9
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          1150.937500000000000000
          254.000000000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRLabel79: TQRLabel
        Left = 409
        Top = 59
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1082.145833333333000000
          156.104166666666700000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dato'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel80: TQRLabel
        Left = 412
        Top = 75
        Width = 14
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1090.083333333333000000
          198.437500000000000000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PD'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel83: TQRLabel
        Left = 370
        Top = 59
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          978.958333333333200000
          156.104166666666700000
          66.145833333333320000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NhijU'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel84: TQRLabel
        Left = 325
        Top = 59
        Width = 26
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          859.895833333333200000
          156.104166666666700000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NhijM'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel85: TQRLabel
        Left = 277
        Top = 59
        Width = 18
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          732.895833333333200000
          156.104166666666700000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nhij'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel86: TQRLabel
        Left = 192
        Top = 59
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          508.000000000000000000
          156.104166666666700000
          89.958333333333320000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel87: TQRLabel
        Left = 96
        Top = 59
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          156.104166666666700000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Criador'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel88: TQRLabel
        Left = 186
        Top = 75
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          492.125000000000000000
          198.437500000000000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Propietario'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape67: TQRShape
        Left = 397
        Top = 96
        Width = 9
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          1050.395833333333000000
          254.000000000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape68: TQRShape
        Left = 354
        Top = 96
        Width = 9
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          936.625000000000100000
          254.000000000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape69: TQRShape
        Left = 304
        Top = 96
        Width = 9
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          804.333333333333200000
          254.000000000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape70: TQRShape
        Left = 248
        Top = 96
        Width = 9
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          656.166666666666800000
          254.000000000000000000
          23.812500000000000000)
        Shape = qrsVertLine
      end
      object QRShape71: TQRShape
        Left = 439
        Top = 117
        Width = 274
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1161.520833333333000000
          309.562500000000000000
          724.958333333333400000)
        Shape = qrsHorLine
      end
      object QRDBText67: TQRDBText
        Left = 173
        Top = 128
        Width = 113
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          457.729166666666700000
          338.666666666666700000
          298.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'CODIGO_PROPIETARIO'
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
      object QRDBText68: TQRDBText
        Left = 269
        Top = 128
        Width = 22
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          711.729166666666800000
          338.666666666666700000
          58.208333333333320000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'NHIJ'
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
      object QRDBText69: TQRDBText
        Left = 321
        Top = 128
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          849.312500000000000000
          338.666666666666700000
          79.375000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'NHIJM'
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
      object QRDBText70: TQRDBText
        Left = 361
        Top = 128
        Width = 29
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          955.145833333333200000
          338.666666666666700000
          76.729166666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'NHIJU'
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
      object QRDBText71: TQRDBText
        Left = 404
        Top = 128
        Width = 49
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1068.916666666667000000
          338.666666666666700000
          129.645833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'DATO_PD'
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
      object QRShape72: TQRShape
        Left = 439
        Top = 97
        Width = 274
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1161.520833333333000000
          256.645833333333400000
          724.958333333333400000)
        Shape = qrsHorLine
      end
      object QRShape73: TQRShape
        Left = 439
        Top = 145
        Width = 274
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1161.520833333333000000
          383.645833333333400000
          724.958333333333400000)
        Shape = qrsHorLine
      end
      object QRDBText73: TQRDBText
        Left = 56
        Top = 185
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          489.479166666666700000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = FREPFichaAnimal.IBQRegDep
        DataField = 'FUENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel90: TQRLabel
        Left = 8
        Top = 185
        Width = 41
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          489.479166666666700000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fuente: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 934
    inherited LTitulo: TLabel
      Width = 530
    end
    inherited PILeft: TPanel
      Left = 726
    end
  end
  inherited Psocalo: TPanel
    Top = 687
    Width = 934
    inherited JvSocalo: TJvImage
      Width = 934
    end
  end
  inherited ALUniversal: TActionList
    Left = 819
    Top = 146
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 820
    Top = 115
  end
  inherited SDXLS: TSaveDialog
    Left = 830
    Top = 257
  end
  inherited DTXLS: TDataToXLS
    Left = 840
    Top = 277
  end
  inherited WinXP1: TWinXP
    Left = 832
    Top = 220
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 820
    Top = 171
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 828
    Top = 83
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
    Left = 60
    Top = 47
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Top = 159
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 72
    Top = 184
  end
  object QRCRIndividual: TQRCompositeReport
    OnAddReports = QRCRIndividualAddReports
    Options = []
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Orientation = poPortrait
    PrinterSettings.PaperSize = Letter
    Left = 16
    Top = 232
  end
  object IBQDatos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from rep_individual(:animal,:esta)')
    Left = 824
    Top = 272
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
    object IBQDatosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'REP_INDIVIDUAL.NOMBRE'
      Size = 100
    end
    object IBQDatosRP: TIBStringField
      FieldName = 'RP'
      Origin = 'REP_INDIVIDUAL.RP'
    end
    object IBQDatosTIPO_RP: TIBStringField
      FieldName = 'TIPO_RP'
      Origin = 'REP_INDIVIDUAL.TIPO_RP'
      Size = 10
    end
    object IBQDatosFECHA_NACIMIENTO: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'REP_INDIVIDUAL.FECHA_NACIMIENTO'
    end
    object IBQDatosEDAD_MADRE: TIntegerField
      FieldName = 'EDAD_MADRE'
      Origin = 'REP_INDIVIDUAL.EDAD_MADRE'
    end
    object IBQDatosPESO_NAC: TIBBCDField
      FieldName = 'PESO_NAC'
      Origin = 'REP_INDIVIDUAL.PESO_NAC'
      Precision = 9
      Size = 3
    end
    object IBQDatosPESO_DEST: TIBBCDField
      FieldName = 'PESO_DEST'
      Origin = 'REP_INDIVIDUAL.PESO_DEST'
      Precision = 9
      Size = 3
    end
    object IBQDatosPESO_ANIO: TIBBCDField
      FieldName = 'PESO_ANIO'
      Origin = 'REP_INDIVIDUAL.PESO_ANIO'
      Precision = 9
      Size = 3
    end
    object IBQDatosPESO_ADULTO: TIBBCDField
      FieldName = 'PESO_ADULTO'
      Origin = 'REP_INDIVIDUAL.PESO_ADULTO'
      Precision = 9
      Size = 3
    end
    object IBQDatosPESO_ACTUAL: TIBBCDField
      FieldName = 'PESO_ACTUAL'
      Origin = 'REP_INDIVIDUAL.PESO_ACTUAL'
      Precision = 9
      Size = 3
    end
    object IBQDatosFECHA_PESO: TDateField
      FieldName = 'FECHA_PESO'
      Origin = 'REP_INDIVIDUAL.FECHA_PESO'
    end
    object IBQDatosCIRC_ESC: TIBBCDField
      FieldName = 'CIRC_ESC'
      Origin = 'REP_INDIVIDUAL.CIRC_ESC'
      Precision = 9
      Size = 3
    end
    object IBQDatosFECHA_MED_CIR_ESC: TDateField
      FieldName = 'FECHA_MED_CIR_ESC'
      Origin = 'REP_INDIVIDUAL.FECHA_MED_CIR_ESC'
    end
    object IBQDatosCAP_SERV: TIBStringField
      FieldName = 'CAP_SERV'
      Origin = 'REP_INDIVIDUAL.CAP_SERV'
    end
    object IBQDatosFECHA_MED_CAP_SERV: TDateField
      FieldName = 'FECHA_MED_CAP_SERV'
      Origin = 'REP_INDIVIDUAL.FECHA_MED_CAP_SERV'
    end
    object IBQDatosEDAD_MED: TIntegerField
      FieldName = 'EDAD_MED'
      Origin = 'REP_INDIVIDUAL.EDAD_MED'
    end
    object IBQDatosALZADA: TIBBCDField
      FieldName = 'ALZADA'
      Origin = 'REP_INDIVIDUAL.ALZADA'
      Precision = 9
      Size = 3
    end
    object IBQDatosFECHA_MED_ALZADA: TDateField
      FieldName = 'FECHA_MED_ALZADA'
      Origin = 'REP_INDIVIDUAL.FECHA_MED_ALZADA'
    end
    object IBQDatosFRAME: TIBBCDField
      FieldName = 'FRAME'
      Origin = 'REP_INDIVIDUAL.FRAME'
      Precision = 9
      Size = 2
    end
    object IBQDatosFECHA_MED_FRAME: TDateField
      FieldName = 'FECHA_MED_FRAME'
      Origin = 'REP_INDIVIDUAL.FECHA_MED_FRAME'
    end
    object IBQDatosGDPV_DESTETE: TIBBCDField
      FieldName = 'GDPV_DESTETE'
      Origin = 'REP_INDIVIDUAL.GDPV_DESTETE'
      Precision = 9
      Size = 3
    end
    object IBQDatosGDPV_ANIO: TIBBCDField
      FieldName = 'GDPV_ANIO'
      Origin = 'REP_INDIVIDUAL.GDPV_ANIO'
      Precision = 9
      Size = 3
    end
    object IBQDatosGDPV_ADULTO: TIBBCDField
      FieldName = 'GDPV_ADULTO'
      Origin = 'REP_INDIVIDUAL.GDPV_ADULTO'
      Precision = 9
      Size = 3
    end
    object IBQDatosGDPV_ULTIMA: TIBBCDField
      FieldName = 'GDPV_ULTIMA'
      Origin = 'REP_INDIVIDUAL.GDPV_ULTIMA'
      Precision = 9
      Size = 3
    end
    object IBQDatosRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'REP_INDIVIDUAL.RAZA'
    end
    object IBQDatosINSPECCION: TIBStringField
      FieldName = 'INSPECCION'
      Origin = 'REP_INDIVIDUAL.INSPECCION'
      Size = 50
    end
    object IBQDatosDESTINO: TIBStringField
      FieldName = 'DESTINO'
      Origin = 'REP_INDIVIDUAL.DESTINO'
      Size = 50
    end
    object IBQDatosREGISTRO: TIBStringField
      FieldName = 'REGISTRO'
      Origin = 'REP_INDIVIDUAL.REGISTRO'
      Size = 50
    end
  end
  object IBQArbolGenea: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from get_arbol_genea_multi_padres(1,:n,1,'#39#39',:EXT)')
    Left = 824
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'n'
        ParamType = ptResult
        Value = 3
      end
      item
        DataType = ftUnknown
        Name = 'EXT'
        ParamType = ptUnknown
      end>
    object IBQArbolGeneaID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_ANIMAL'
    end
    object IBQArbolGeneaNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.NOMBRE'
      Size = 100
    end
    object IBQArbolGeneaAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.APODO'
      Size = 100
    end
    object IBQArbolGeneaRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.RAZA'
    end
    object IBQArbolGeneaEXTERNO: TIBStringField
      FieldName = 'EXTERNO'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.EXTERNO'
      Size = 1
    end
    object IBQArbolGeneaMADRE: TIBStringField
      FieldName = 'MADRE'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.MADRE'
      Size = 1
    end
    object IBQArbolGeneaID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_RP'
      Size = 10
    end
    object IBQArbolGeneaID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_SENASA'
      Size = 10
    end
    object IBQArbolGeneaID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_PC'
      Size = 10
    end
    object IBQArbolGeneaID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_HBA'
      Size = 10
    end
    object IBQArbolGeneaID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_RA'
      Size = 10
    end
    object IBQArbolGeneaID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_OTRO'
      Size = 10
    end
    object IBQArbolGeneaPADRES_DE: TIntegerField
      FieldName = 'PADRES_DE'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.PADRES_DE'
    end
    object IBQArbolGeneaNIVEL_ARBOL: TIntegerField
      FieldName = 'NIVEL_ARBOL'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.NIVEL_ARBOL'
    end
    object IBQArbolGeneaRELACION: TIBStringField
      FieldName = 'RELACION'
      Origin = 'GET_ARBOL_GENEA_3_PADRES.RELACION'
      Size = 5
    end
  end
  object IBQAux: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 824
    Top = 352
  end
  object IBQArbolGenea3: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from get_arbol_genea_3_padres(4,:n,1,'#39#39',:EXT)')
    Left = 32
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'n'
        ParamType = ptResult
        Value = 3
      end
      item
        DataType = ftUnknown
        Name = 'EXT'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_ANIMAL'
    end
    object IBStringField1: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.NOMBRE'
      Size = 100
    end
    object IBStringField2: TIBStringField
      FieldName = 'APODO'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.APODO'
      Size = 100
    end
    object IntegerField2: TIntegerField
      FieldName = 'RAZA'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.RAZA'
    end
    object IBStringField3: TIBStringField
      FieldName = 'EXTERNO'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.EXTERNO'
      Size = 1
    end
    object IBStringField4: TIBStringField
      FieldName = 'MADRE'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.MADRE'
      Size = 1
    end
    object IBStringField5: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_RP'
      Size = 10
    end
    object IBStringField6: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_SENASA'
      Size = 10
    end
    object IBStringField7: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_PC'
      Size = 10
    end
    object IBStringField8: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_HBA'
      Size = 10
    end
    object IBStringField9: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_RA'
      Size = 10
    end
    object IBStringField10: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.ID_OTRO'
      Size = 10
    end
    object IntegerField3: TIntegerField
      FieldName = 'PADRES_DE'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.PADRES_DE'
    end
    object IntegerField4: TIntegerField
      FieldName = 'NIVEL_ARBOL'
      Origin = 'GET_ARBOL_GENEA_MULTI_PADRES.NIVEL_ARBOL'
    end
    object IBStringField11: TIBStringField
      FieldName = 'RELACION'
      Origin = 'GET_ARBOL_GENEA_3_PADRES.RELACION'
      Size = 5
    end
  end
  object ImSexo: TImageList
    Left = 672
    Top = 293
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008040000080400000CC663300FFFFCC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC99
      6600804000008040000000000000804000008040000080400000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008040
      0000000000000000000000000000000000000000000080400000FFFFCC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000804000008040
      0000000000000000000000000000000000000000000080400000FF6600000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000804000008040
      0000000000000000000000000000000000000000000080400000804000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000CC000000FF000000FF000000FF00330099000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008040
      0000000000000000000000000000000000000000000080400000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000CC9933003300
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008040
      0000804000000000000000000000000000008040000080400000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000804000008040000080400000804000008040000099663300804000000000
      0000000000008040000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000804000008040
      000000000000CC33000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CCCC
      CC00804000008040000000000000000000000000000000000000000000000000
      000033009900FFFFCC0000000000000000000000000000000000FFFFCC000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000804000008040
      0000CC3300008040000000000000000000000000000000000000000000000000
      0000000000000000FF000000CC000000FF000000FF000000CC000000CC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFE7F00000000
      F87FFE7F00000000E23FF81F00000000EF9FFE7F00000000CF9FFC3F00000000
      CF9FF81F00000000EFBFF3CF00000000E73FF7EF00000000F01BF7EF00000000
      FFCBF7EF00000000FFE3F3CF00000000FFC3F81F00000000FFFFFE7F00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
