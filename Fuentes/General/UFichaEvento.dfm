inherited FFichaEvento: TFFichaEvento
  Left = 200
  Top = 135
  Caption = 'FFichaEvento'
  ClientHeight = 444
  ClientWidth = 760
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 760
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
    Visible = False
  end
  inherited Image4: TImage
    Width = 376
  end
  object PDatos: TPanel [4]
    Left = 0
    Top = 65
    Width = 760
    Height = 317
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 3
    object GBDatosExtraccion: TGroupBox
      Left = 0
      Top = 177
      Width = 760
      Height = 224
      Align = alTop
      Caption = '  Datos Extracci'#243'n  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object GBCongelacion: TGroupBox
        Left = 392
        Top = 42
        Width = 180
        Height = 131
        Align = alLeft
        Caption = '  Congelaci'#243'n  '
        TabOrder = 0
        object LFechaCongelacion: TLabel
          Left = 5
          Top = 21
          Width = 37
          Height = 15
          Caption = 'Fecha:'
        end
        object LHora: TLabel
          Left = 5
          Top = 46
          Width = 30
          Height = 15
          Caption = 'Hora:'
        end
        object LNroDs: TLabel
          Left = 5
          Top = 72
          Width = 67
          Height = 15
          Caption = 'N'#186' de dosis:'
        end
        object LFechaCongelacionValue: TLabel
          Left = 75
          Top = 21
          Width = 79
          Height = 15
          AutoSize = False
          Caption = 'LFechaCongelacionValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LHoraValue: TLabel
          Left = 75
          Top = 46
          Width = 79
          Height = 15
          AutoSize = False
          Caption = 'LHoraValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LNroDsValue: TLabel
          Left = 75
          Top = 72
          Width = 79
          Height = 15
          AutoSize = False
          Caption = 'LNroDsValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object GBDescongelacion: TGroupBox
        Left = 572
        Top = 42
        Width = 186
        Height = 131
        Align = alClient
        Caption = '  Descongelaci'#243'n  '
        TabOrder = 1
        object LDescongelCeroPorcViv: TLabel
          Left = 5
          Top = 18
          Width = 71
          Height = 15
          Caption = '0hs. % vivos:'
        end
        object LDescongelCeroVig: TLabel
          Left = 5
          Top = 38
          Width = 58
          Height = 15
          Caption = '0hs. Vigor:'
        end
        object LDescongelDosPorcViv: TLabel
          Left = 5
          Top = 60
          Width = 71
          Height = 15
          Caption = '2hs. % vivos:'
        end
        object LDescongelDosVig: TLabel
          Left = 5
          Top = 80
          Width = 58
          Height = 15
          Caption = '2hs. Vigor:'
        end
        object LDescongelCeroPorcVivValue: TLabel
          Left = 77
          Top = 18
          Width = 74
          Height = 15
          AutoSize = False
          Caption = 'LDescongelCeroPorcVivValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LDescongelCeroVigValue: TLabel
          Left = 77
          Top = 38
          Width = 74
          Height = 15
          AutoSize = False
          Caption = 'LDescongelCeroVigValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LDescongelDosPorcVivValue: TLabel
          Left = 77
          Top = 60
          Width = 74
          Height = 15
          AutoSize = False
          Caption = 'LDescongelDosPorcVivValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LDescongelDosVigValue: TLabel
          Left = 77
          Top = 80
          Width = 74
          Height = 15
          AutoSize = False
          Caption = 'LDescongelDosVigValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object GBExtraccion: TGroupBox
        Left = 2
        Top = 42
        Width = 390
        Height = 131
        Align = alLeft
        Caption = '  Extracci'#243'n  '
        TabOrder = 2
        object LMillones: TLabel
          Left = 208
          Top = 21
          Width = 83
          Height = 15
          Caption = 'Concentraci'#243'n:'
        end
        object LCCTotal: TLabel
          Left = 208
          Top = 46
          Width = 48
          Height = 15
          Caption = 'Diluci'#243'n:'
        end
        object LNroEyaculacion: TLabel
          Left = 5
          Top = 21
          Width = 85
          Height = 15
          Caption = 'N'#186' Eyaculaci'#243'n:'
        end
        object LVolumen: TLabel
          Left = 5
          Top = 46
          Width = 52
          Height = 15
          Caption = 'Volumen:'
        end
        object LColor: TLabel
          Left = 5
          Top = 72
          Width = 33
          Height = 15
          Caption = 'Color:'
        end
        object LVigor: TLabel
          Left = 208
          Top = 72
          Width = 31
          Height = 15
          Caption = 'Vigor:'
        end
        object LNroEyaculacionValue: TLabel
          Left = 92
          Top = 22
          Width = 100
          Height = 15
          AutoSize = False
          Caption = 'LNroEyaculacionValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LVolumenValue: TLabel
          Left = 92
          Top = 47
          Width = 100
          Height = 15
          AutoSize = False
          Caption = 'LVolumenValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LColorValue: TLabel
          Left = 92
          Top = 73
          Width = 100
          Height = 15
          AutoSize = False
          Caption = 'LColorValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LMillonesValue: TLabel
          Left = 293
          Top = 22
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'LMillonesValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LDilucionValue: TLabel
          Left = 293
          Top = 47
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'LDilucionValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LVigorValue: TLabel
          Left = 293
          Top = 73
          Width = 90
          Height = 15
          AutoSize = False
          Caption = 'LVigorValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 5
          Top = 96
          Width = 79
          Height = 30
          AutoSize = False
          Caption = 'Espermas por pajuela:'
          WordWrap = True
        end
        object LEspermasPajuela: TLabel
          Left = 92
          Top = 98
          Width = 107
          Height = 15
          AutoSize = False
          Caption = 'LEspermasPajuela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LCongelo: TLabel
          Left = 208
          Top = 96
          Width = 50
          Height = 15
          Caption = 'Congel'#243':'
        end
        object LCongeloValue: TLabel
          Left = 293
          Top = 96
          Width = 85
          Height = 15
          Caption = 'LCongeloValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object GBDatosUbicacion: TGroupBox
        Left = 2
        Top = 173
        Width = 756
        Height = 49
        Align = alBottom
        Caption = '  Datos de Ubicaci'#243'n  '
        TabOrder = 3
        object LTermo: TLabel
          Left = 5
          Top = 20
          Width = 39
          Height = 15
          Caption = 'Termo:'
        end
        object LTermoValue: TLabel
          Left = 92
          Top = 20
          Width = 109
          Height = 15
          AutoSize = False
          Caption = 'LTermoValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LCanister: TLabel
          Left = 208
          Top = 20
          Width = 50
          Height = 15
          Caption = 'Canister:'
        end
        object LCanisterValue: TLabel
          Left = 293
          Top = 20
          Width = 87
          Height = 15
          AutoSize = False
          Caption = 'LCanisterValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LPosicion: TLabel
          Left = 395
          Top = 20
          Width = 51
          Height = 15
          Caption = 'Posici'#243'n:'
        end
        object LPosicionValue: TLabel
          Left = 467
          Top = 20
          Width = 88
          Height = 15
          AutoSize = False
          Caption = 'LPosicionValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object PSuperior: TPanel
        Left = 2
        Top = 17
        Width = 756
        Height = 25
        Align = alTop
        Color = clWhite
        TabOrder = 4
        object LPartidaValue: TLabel
          Left = 1
          Top = 1
          Width = 754
          Height = 23
          Align = alClient
          Alignment = taCenter
          Caption = 'LPartidaValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
      end
    end
    object GBDatosEvento: TGroupBox
      Left = 0
      Top = 0
      Width = 760
      Height = 177
      Align = alTop
      Caption = ' Datos del evento '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object LRPAnimal: TLabel
        Left = 384
        Top = 45
        Width = 65
        Height = 23
        AutoSize = False
        Caption = 'RP animal: '
        Layout = tlCenter
      end
      object LRPAnimalValue: TLabel
        Left = 447
        Top = 45
        Width = 129
        Height = 23
        AutoSize = False
        Caption = 'LRPAnimalValue'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LFecha: TLabel
        Left = 384
        Top = 71
        Width = 62
        Height = 23
        AutoSize = False
        Caption = 'Fecha: '
        Layout = tlCenter
      end
      object LFechaValue: TLabel
        Left = 447
        Top = 71
        Width = 129
        Height = 23
        AutoSize = False
        Caption = 'LRPAnimalValue'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LResponsable: TLabel
        Left = 5
        Top = 97
        Width = 81
        Height = 23
        AutoSize = False
        Caption = 'Responsable: '
        Layout = tlCenter
      end
      object LResponsableValue: TLabel
        Left = 86
        Top = 97
        Width = 442
        Height = 23
        AutoSize = False
        Caption = 'LRPAnimalValue'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LEvento: TLabel
        Left = 5
        Top = 45
        Width = 76
        Height = 23
        AutoSize = False
        Caption = 'Evento: '
        Layout = tlCenter
      end
      object LEventoValue: TLabel
        Left = 48
        Top = 45
        Width = 248
        Height = 23
        AutoSize = False
        Caption = 'LRPAnimalValue'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LCategoriaValue: TLabel
        Left = 123
        Top = 71
        Width = 248
        Height = 23
        AutoSize = False
        Caption = 'LRPAnimalValue'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LCategoria: TLabel
        Left = 5
        Top = 71
        Width = 115
        Height = 23
        AutoSize = False
        Caption = 'Categor'#237'a del evento: '
        Layout = tlCenter
      end
      object LDescripcion: TLabel
        Left = 5
        Top = 123
        Width = 72
        Height = 22
        AutoSize = False
        Caption = 'Descripci'#243'n: '
        Layout = tlCenter
      end
      object LDescripcionValue: TLabel
        Left = 76
        Top = 126
        Width = 536
        Height = 36
        AutoSize = False
        Caption = 'LDescripcionValue'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        
        WordWrap = True
      end
      object Label1: TLabel
        Left = 5
        Top = 23
        Width = 214
        Height = 15
        Caption = 'Evento aplicado en el establecimiento: '
      end
      object LEstaValue: TLabel
        Left = 218
        Top = 22
        Width = 79
        Height = 18
        Caption = 'LEstaValue'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BDBGEmbriones: TBitDBGrid
        Left = 10
        Top = 181
        Width = 633
        Height = 165
        Align = alCustom
        DataSource = DSEmbriones
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        AllowIncSearch = False
        ColumnVersion = 0
        DefaultColumns = True
        DrawingEllipse = True
        DrawReadOnly = False
        EnterKey = ekNone
        FillFields = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterType = foNone
        InternalDrag = False
        LongCaption = True
        MultiCaption = True
        RealTitleFont.Charset = DEFAULT_CHARSET
        RealTitleFont.Color = clWindowText
        RealTitleFont.Height = -8
        RealTitleFont.Name = 'MS Sans Serif'
        RealTitleFont.Style = []
        RunTimePropEditor = True
        ShowCellHint = True
        TitleBtn = tbNone
        Columns = <
          item
            Alignment = taCenter
            Color = 16113619
            Expanded = False
            FieldName = 'FECHA_COLECCION'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha de Colecta'
            Width = 92
            Visible = True
          end
          item
            Alignment = taCenter
            Color = 16113619
            Expanded = False
            FieldName = 'SERIE'
            Title.Alignment = taCenter
            Title.Caption = 'Serie'
            Width = 40
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NRO_ENVASE'
            Title.Alignment = taCenter
            Title.Caption = 'Envase'
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CANT_LAVAJES'
            Title.Alignment = taCenter
            Title.Caption = 'Cantidad de Lavajes'
            Width = 102
            Visible = True
          end
          item
            Alignment = taCenter
            Color = 16113619
            Expanded = False
            FieldName = 'VAL_ESTADIO'
            Title.Alignment = taCenter
            Title.Caption = 'Estadio'
            Width = 43
            Visible = True
          end
          item
            Alignment = taCenter
            Color = 16113619
            Expanded = False
            FieldName = 'VAL_CALIDAD'
            Title.Alignment = taCenter
            Title.Caption = 'Calidad'
            Width = 41
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VAL_DEST'
            Title.Alignment = taCenter
            Title.Caption = 'Destino'
            Width = 76
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VAL_CENTROS'
            Title.Alignment = taCenter
            Title.Caption = 'Centro de Transplante'
            Width = 115
            Visible = True
          end>
      end
      object BDBGDieta: TBitDBGrid
        Left = 10
        Top = 181
        Width = 633
        Height = 124
        Align = alCustom
        DataSource = DSDieta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        AllowIncSearch = False
        ColumnVersion = 0
        DefaultColumns = True
        DrawingEllipse = True
        DrawReadOnly = False
        EnterKey = ekNone
        FillFields = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterType = foNone
        InternalDrag = False
        LongCaption = True
        MultiCaption = True
        RealTitleFont.Charset = DEFAULT_CHARSET
        RealTitleFont.Color = clWindowText
        RealTitleFont.Height = -8
        RealTitleFont.Name = 'MS Sans Serif'
        RealTitleFont.Style = []
        RunTimePropEditor = True
        ShowCellHint = True
        TitleBtn = tbNone
        Columns = <
          item
            Alignment = taCenter
            Color = clWhite
            Expanded = False
            FieldName = 'ALIMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Alimento'
            Width = 193
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clWhite
            Expanded = False
            FieldName = 'PORC_RACION'
            Title.Alignment = taCenter
            Title.Caption = '% Usado en la raci'#243'n'
            Width = 115
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clWhite
            Expanded = False
            FieldName = 'PORC_MS'
            Title.Alignment = taCenter
            Title.Caption = '% MS'
            Width = 56
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clWhite
            Expanded = False
            FieldName = 'KG_MS_AUX'
            Title.Alignment = taCenter
            Title.Caption = 'KG MS'
            Width = 75
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clWhite
            Expanded = False
            FieldName = 'KG_TC_AUX'
            Title.Alignment = taCenter
            Title.Caption = 'KG (tal cual)'
            Width = 84
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clWhite
            Expanded = False
            FieldName = 'PRECIO_AUX'
            Title.Alignment = taCenter
            Title.Caption = '$ / d'#237'a'
            Width = 78
            Visible = True
          end>
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 401
      Width = 760
      Height = 1
      Align = alClient
      Caption = 'Observaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object MAObservacion: TMemoAuto
        Left = 2
        Top = 17
        Width = 756
        Height = 1
        Align = alClient
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
    end
  end
  object PBotones: TPanel [5]
    Left = 0
    Top = 382
    Width = 760
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 2
    DesignSize = (
      760
      40)
    object ISalir: TImage
      Left = 528
      Top = -8
      Width = 42
      Height = 48
      Cursor = crHandPoint
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002E00
        0000390806000000496A1914000000097048597300000B1300000B1301009A9C
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
        E47C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB00000779
        4944415478DAEDDA5B681D451800E07F66F6DC12D39E5E42B558A98DA2A8D42B
        FA204223161F140B52F18268EBED45C1FA24F852455F7C90B6EA83A0521535FA
        52BC2B586BF35485402BAD17C44BD17A4DA349EBB9EEEE8CFF3F97DD3DE9C939
        BB274951C881E9EC9E93EC7EF3CFBFFF4CD230A514FC1F5F6C01BE005F80FF37
        5F0BF005785A78962F9E38FDAC8BB0DB8AAD8C6D74D991EF1ECD7A43BCC63AEC
        1EB4D7D881D7786B5EE116FD295BD457CE5D7531F8FB0E82FAEBD84B78E3CD19
        AEB109BB9D7CC512F02E3B0FFC3D63A06A8DCD788D97E6059E4497B6DC06FCD4
        E5A0AA35A86D7B1DE42FE3A9F00E2D865642F1815B8015F2207FFA0D6A3BDEE8
        09DF15DE0EED5E69F1EDD0EED52BBE23BC133A2DBE137A36F819E169D0DDF069
        D0BDE2DBC2F186F4C4FFC8064AE5D283B77644B7E0B78F80FCF5A8C647E835A7
        41F1FE9B3BA223FCCF887FFA4DC437BBE267826F018F6F2BDE7D3D88A1555D6F
        98C4D79F7B0BE4EF7FEDC5D3757CF50A28DE7303B07C77B47B85DF1E86FA0BEF
        1F46F899BDC139DB56B8733D88D52B53DFD4E0EBD0D8F91140310785DBD7A78A
        740BFCFB23D0786577CFF0D5D8ED67A714CBF95B87812F1DC886AF3701040796
        F3327D1FCE1434DF1805D5F01F42F8F6CC708B370F677FA19CDF7825B072367C
        D697FC13D1BBF601348254EB42BA7288F8DC86CB812FEE9F27F42434DF1D0368
        A64377859F80BFEE12C0F238A768358EE80F0F203ACCB47DC8B6E4F7E5CBB96B
        2F447C694ED0727C0AFC8F0F01F8D9D0A9E1D3F1DE351700D6F859A1D55144EF
        F9BA277426F809F8E1F300AB4E6FE88963E08F7E8368D9133A33DCE21FC56E2B
        5BDE0FE29CD37A502B08C60E534E77ADD5730677CB381B28001B9C45856986B8
        35388649AEE63FE273869E237CDAAA32B7E839C0A7A9E3F3839E25BEDBCA39BF
        E859E03BED554E0EBA477CE7DDE140A1DC0B5A559AC04A39C0AD71AFF8C7BAFD
        EA6326387DD356BE666976F4F106EE3F2A0079017CE5A2CC783551053555DF8B
        F0E15EE09B807EFF71FA620DC88C06A05FF2ACC3EF2D67C5AB3FFEA119EB0D6E
        F1FBF18617E91BA7C027D0EE674EBD3DC882A7EFC7EB4CE2E1305EE340AFF0B2
        BE710AFC7474E21AA9F159D01DE169F133A1B3E0B3A2BBC2BBE12374B138D277
        68EC3EDC403165AEC940C577686CBC6DAD3C78E83DF0F8A2E9788B9E02CF1B5E
        F2C357FB39E769DCEDE1524A6A5C4A259492A2FEC49383C1AB231F42189CEFF0
        117A70F93B6AF7078F28A53836BC1EE295C5C737516CFB33E7F2D7DE7C1E049C
        E2F01A5DF18FF3F557DF94DBF1D4179C339F316C9C079C7AC6A5105CE260D48C
        F02008B8544A2038AF5B280B5286F9108FC350E6D5679F2FE30F3DFC22D46B67
        B38207AAE6833C63D5279591979F42B0B0700A1737BF7257EEDA7A12180359D8
        F5F69AD2B3CF3D8EA1E9D35197ACE2DFBB798BBCEB8EAF386139F7B13539174D
        81C7886ED873EC59D37E0D0D0498EFFB1E420B082C8641580CC3B080CDF4F43E
        F632340380EF7E585A7C61E7B5506F0CF843671E397EF7A60388F570563C0307
        61A20E36FA4866943D380A84E3B12C1CFC7249FFAEB7AFC06991B51B378C0697
        5DFAAB01335F83112B082BE858D4F5B9100D4F1F8B3ABE4F8369B06AB53A1804
        612908835260E0ED1A0E8066C0CE8239CED1CC101C7BCF0C208A7C6BAA2018FF
        D1704C81007B175D3F8E322768C34439026BACE7995E08AF8E03A8E1798D4D4E
        4E0D619AF461437C48F852888340AC6EE6DC0C409A59B0833183B0A985835039
        69228F0F80FE2F1A833791C688B3901A67162B78531870C3802D8ECE0DB4E69A
        E77935020BEA11ED09AFC6C68F4EAC257488781F9BC5624F83D1683DA86820D4
        9B99A1631A4C91528AD2490F228E3C33C136914E4499908436508BF41248D38B
        2A46D8F6FAB89ECB79153B802AFBE3CFF14B1D3A06EBB4E977F8C00CA82FB05F
        63D38A3EB783D4CDA555895287F2DC3D9C84B6514D46B1EAD91EF1788CE7D4D3
        B97B5F98F3C4FBD59CFE7A0BB7A912C12C38EA6D1AF587764041048E3F773342
        CDE67B04B7D5A0DE1A5107D3537F02703A5CD8814570932A7E0CB49134291320
        D6A4874991C0A54B9F4B175B7D8AAEF2D82A83A9D212F1D0E2930F613D7AF884
        46D66D5AB8C15930BDEF39387D56A1CFD9DF939367DB74D079DEEE01D548A91F
        C8695546A3A3875397455AB440473BAAE3F884EA74613CF170EA01E8B2D7B0F9
        EE52C9569428D76BD3674A57954AA5BAC2A40241A96E4765B114D7748CA88CB0
        EDCA614EE9C54BA305C4E5901A9542A5971BC631F2BABAF8AD0B8E1E0495C146
        A28F67C4F36C9A453354634DDFCF4B53158A511DD7480DA5F3BC2D837919B75C
        22CA42A7878DB4499168D9A71553D9D5332E89068FF59C27EA39A3146AB6A693
        6B9CEA775432E979616E6F8248BCA989A2296FB49A125A9F23362428A14D84A9
        8F4B9F8E361838B3CB7D721FA4F4220454165B224FF06841126E064CB96C9A5A
        8F2BA530F5DEA4190B11DF7E938551667A93A523A917955CCB2223313D5C3E27
        F6292A5EEA9370B7E4BBA8CB7831C23ECE7B7A06F4E68A069118143DD86AFAAE
        31F5CF5408A7C1E8153182625AE80751B9144119455B4DBB2E330FA8DBB3E8E5
        1FCC8A0A661BE0162985D14CF55711FFDFBF9E58809FE4D7BFDD7AE9F1A9BC60
        C70000000049454E44AE426082}
      OnClick = ASalirExecute
    end
    object Label2: TLabel
      Left = 575
      Top = 11
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
    end
    object BBSalir: TBitBtn
      Left = 684
      Top = 3
      Width = 71
      Height = 33
      Action = ASalir
      Anchors = [akTop, akRight]
      Caption = 'Salir'
      TabOrder = 0
      Visible = False
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
      Top = 100
      Width = 32
      Height = 27
      Action = AAyuda
      TabOrder = 1
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
  end
  inherited PTitulo: TPanel
    Width = 760
    Caption = 'Ficha de evento'
    inherited LTitulo: TLabel
      Width = 356
    end
    inherited PILeft: TPanel
      Left = 552
    end
  end
  inherited Psocalo: TPanel
    Top = 422
    Width = 760
    inherited JvSocalo: TJvImage
      Width = 760
    end
  end
  inherited ALUniversal: TActionList
    Left = 40
    Top = 8
    object ASalir: TAction
      Caption = 'Salir'
      ShortCut = 27
      OnExecute = ASalirExecute
    end
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 452
    Top = 399
  end
  inherited SDXLS: TSaveDialog
    Left = 262
    Top = 405
  end
  inherited DTXLS: TDataToXLS
    Left = 224
    Top = 401
  end
  inherited WinXP1: TWinXP
    Left = 448
    Top = 0
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 356
    Top = 399
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 388
    Top = 399
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 420
    Top = 399
  end
  inherited IBSPGeneradores: TIBStoredProc
    Top = 399
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 420
    Top = 65535
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 476
    Top = 65535
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 176
    Top = 400
  end
  object IBQDatosEvento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ee.fecha, ee.observacion, ee.tipo, ta.id_rp, cte.nombre a' +
        's evento, cce.nombre as categoria, te.nombre as nombre, te.apell' +
        'ido as apellido'
      
        'from eve_eventos ee, tab_animales ta, cod_tipos_evento cte, cod_' +
        'categorias_evento cce, tab_empleados te'
      
        'where (ee.id_evento = :eve) and (ee.animal=ta.id_animal) and (ee' +
        '.tipo=cte.id_tipo_evento)'
      
        '      and (cte.categoria=cce.id_categoria_evento) and (ee.respon' +
        'sable = te.id_empleado) and (ee.establecimiento = te.establecimi' +
        'ento)')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'eve'
        ParamType = ptInput
      end>
  end
  object IBQProcedureDescripcion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 72
    Top = 8
  end
  object IBQEmbriones: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_embriones where id_eve_trans = :evento')
    Left = 448
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento'
        ParamType = ptUnknown
      end>
    object IBQEmbrionesID_EMBRION: TIntegerField
      FieldName = 'ID_EMBRION'
      Origin = 'TAB_EMBRIONES.ID_EMBRION'
      Required = True
    end
    object IBQEmbrionesESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_EMBRIONES.ESTABLECIMIENTO'
    end
    object IBQEmbrionesFECHA_COLECCION: TDateField
      FieldName = 'FECHA_COLECCION'
      Origin = 'TAB_EMBRIONES.FECHA_COLECCION'
    end
    object IBQEmbrionesDESTINO: TIntegerField
      FieldName = 'DESTINO'
      Origin = 'TAB_EMBRIONES.DESTINO'
    end
    object IBQEmbrionesDESCRIPCION: TIntegerField
      FieldName = 'DESCRIPCION'
      Origin = 'TAB_EMBRIONES.DESCRIPCION'
    end
    object IBQEmbrionesSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'TAB_EMBRIONES.SERIE'
    end
    object IBQEmbrionesNRO_ENVASE: TIBStringField
      FieldName = 'NRO_ENVASE'
      Origin = 'TAB_EMBRIONES.NRO_ENVASE'
      Size = 25
    end
    object IBQEmbrionesESTADIO: TIntegerField
      FieldName = 'ESTADIO'
      Origin = 'TAB_EMBRIONES.ESTADIO'
    end
    object IBQEmbrionesCALIDAD: TIntegerField
      FieldName = 'CALIDAD'
      Origin = 'TAB_EMBRIONES.CALIDAD'
    end
    object IBQEmbrionesRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'TAB_EMBRIONES.RESPONSABLE'
    end
    object IBQEmbrionesOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'TAB_EMBRIONES.OBSERVACION'
      Size = 255
    end
    object IBQEmbrionesMADRE: TIntegerField
      FieldName = 'MADRE'
      Origin = 'TAB_EMBRIONES.MADRE'
    end
    object IBQEmbrionesPADRE_1: TIntegerField
      FieldName = 'PADRE_1'
      Origin = 'TAB_EMBRIONES.PADRE_1'
    end
    object IBQEmbrionesPADRE_EXTERNO_1: TIBStringField
      FieldName = 'PADRE_EXTERNO_1'
      Origin = 'TAB_EMBRIONES.PADRE_EXTERNO_1'
      Size = 1
    end
    object IBQEmbrionesPADRE_2: TIntegerField
      FieldName = 'PADRE_2'
      Origin = 'TAB_EMBRIONES.PADRE_2'
    end
    object IBQEmbrionesPADRE_EXTERNO_2: TIBStringField
      FieldName = 'PADRE_EXTERNO_2'
      Origin = 'TAB_EMBRIONES.PADRE_EXTERNO_2'
      Size = 1
    end
    object IBQEmbrionesMADRE_INTERNA: TIBStringField
      FieldName = 'MADRE_INTERNA'
      Origin = 'TAB_EMBRIONES.MADRE_INTERNA'
      Size = 1
    end
    object IBQEmbrionesUSADO: TIBStringField
      FieldName = 'USADO'
      Origin = 'TAB_EMBRIONES.USADO'
      Size = 1
    end
    object IBQEmbrionesCANT_LAVAJES: TIntegerField
      FieldName = 'CANT_LAVAJES'
      Origin = 'TAB_EMBRIONES.CANT_LAVAJES'
    end
    object IBQEmbrionesID_EVE_TRANS: TIntegerField
      FieldName = 'ID_EVE_TRANS'
      Origin = 'TAB_EMBRIONES.ID_EVE_TRANS'
    end
    object IBQEmbrionesPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'TAB_EMBRIONES.PRECIO'
    end
    object IBQEmbrionesCENTRO_TRANSPLANTE: TIntegerField
      FieldName = 'CENTRO_TRANSPLANTE'
      Origin = 'TAB_EMBRIONES.CENTRO_TRANSPLANTE'
    end
    object IBQEmbrionesVAL_DEST: TStringField
      FieldKind = fkLookup
      FieldName = 'VAL_DEST'
      LookupDataSet = IBQDestinos
      LookupKeyFields = 'ID_DESTINO_EMBRION'
      LookupResultField = 'NOMBRE'
      KeyFields = 'DESTINO'
      Size = 50
      Lookup = True
    end
    object IBQEmbrionesVAL_ESTADIO: TStringField
      FieldKind = fkLookup
      FieldName = 'VAL_ESTADIO'
      LookupDataSet = IBQEstadio
      LookupKeyFields = 'ID_ESTADIO'
      LookupResultField = 'VALOR'
      KeyFields = 'ESTADIO'
      Size = 50
      Lookup = True
    end
    object IBQEmbrionesVAL_CALIDAD: TStringField
      FieldKind = fkLookup
      FieldName = 'VAL_CALIDAD'
      LookupDataSet = IBQCalidad
      LookupKeyFields = 'ID_CALIDAD'
      LookupResultField = 'VALOR'
      KeyFields = 'CALIDAD'
      Size = 50
      Lookup = True
    end
    object IBQEmbrionesVAL_CENTROS: TStringField
      FieldKind = fkLookup
      FieldName = 'VAL_CENTROS'
      LookupDataSet = IBQCentros
      LookupKeyFields = 'ID_CENTRO_TRANSPLANTE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'CENTRO_TRANSPLANTE'
      Size = 50
      Lookup = True
    end
    object IBQEmbrionesDIAS_GESTACION: TIntegerField
      FieldName = 'DIAS_GESTACION'
      Origin = 'TAB_EMBRIONES.DIAS_GESTACION'
    end
    object IBQEmbrionesNRO_ORDEN: TIBStringField
      FieldName = 'NRO_ORDEN'
      Origin = 'TAB_EMBRIONES.NRO_ORDEN'
      Size = 12
    end
  end
  object DSEmbriones: TDataSource
    DataSet = IBQEmbriones
    Left = 416
    Top = 40
  end
  object IBQEstadio: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_estadios_embrion')
    Left = 496
    Top = 40
  end
  object IBQCalidad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_calidad_embrion')
    Left = 525
    Top = 40
  end
  object IBQDestinos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_destino_embrion')
    Left = 552
    Top = 40
  end
  object IBQCentros: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from centros_transplante')
    Left = 552
    Top = 8
  end
  object IBQGetEstablecimiento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select te.nombre from tab_establecimientos te join eve_eventos e' +
        'e on ee.establecimiento = te.id_establecimiento where ee.id_even' +
        'to = :eve')
    Left = 592
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'eve'
        ParamType = ptUnknown
      end>
  end
  object IBQDatosDeSemen: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from GET_DATOS_FICHA_EVENTO_EXT(:evento)'
      '')
    Left = 640
    Top = 81
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento'
        ParamType = ptUnknown
      end>
  end
  object IBQDatosCentros: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_centros_inseminacion where id_centro = :centro')
    Left = 640
    Top = 113
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'centro'
        ParamType = ptUnknown
      end>
  end
  object IBQDieta: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from get_datos_racion(:evento)')
    Left = 568
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento'
        ParamType = ptUnknown
      end>
    object IBQDietaALIMENTO: TIBStringField
      FieldName = 'ALIMENTO'
      Origin = 'GET_DATOS_RACION.ALIMENTO'
      Size = 50
    end
    object IBQDietaKG_MS_AUX: TIBBCDField
      FieldName = 'KG_MS_AUX'
      Origin = 'GET_DATOS_RACION.KG_MS_AUX'
      Precision = 9
      Size = 2
    end
    object IBQDietaKG_TC_AUX: TIBBCDField
      FieldName = 'KG_TC_AUX'
      Origin = 'GET_DATOS_RACION.KG_TC_AUX'
      Precision = 9
      Size = 2
    end
    object IBQDietaPRECIO_AUX: TIBBCDField
      FieldName = 'PRECIO_AUX'
      Origin = 'GET_DATOS_RACION.PRECIO_AUX'
      Precision = 9
      Size = 2
    end
    object IBQDietaPORC_RACION: TIBBCDField
      FieldName = 'PORC_RACION'
      Origin = 'GET_DATOS_RACION.PORC_RACION'
      Precision = 9
      Size = 2
    end
    object IBQDietaPORC_MS: TIBBCDField
      FieldName = 'PORC_MS'
      Origin = 'GET_DATOS_RACION.PORC_MS'
      Precision = 9
      Size = 2
    end
  end
  object DSDieta: TDataSource
    DataSet = IBQDieta
    Left = 568
    Top = 121
  end
end
