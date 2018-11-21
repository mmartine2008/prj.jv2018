inherited FREPHistoriaAnimal: TFREPHistoriaAnimal
  Left = 243
  Top = -18
  Caption = 'Softvet - Reporte de animal'
  ClientHeight = 730
  ClientWidth = 1008
  Constraints.MaxHeight = 768
  Constraints.MaxWidth = 1032
  Constraints.MinHeight = 746
  Constraints.MinWidth = 1016
  OldCreateOrder = True
  Scaled = False
  WindowState = wsMaximized
  OnClick = FormClick
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1008
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
    Width = 624
  end
  object GBSeleccionAnimal: TGroupBox [4]
    Left = 0
    Top = 312
    Width = 1008
    Height = 300
    Align = alClient
    Caption = ' Animales Seleccionados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object BDBGAnimales: TBitDBGrid
      Left = 2
      Top = 18
      Width = 1004
      Height = 280
      Align = alClient
      DataSource = DSAnimales
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -14
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = BDBGAnimalesDrawColumnCell
      OnDblClick = BDBGAnimalesDblClick
      OnKeyPress = BDBGAnimalesKeyPress
      OnMouseMove = BDBGAnimalesMouseMove
      OnTitleClick = BDBGAnimalesTitleClick
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
          Expanded = False
          FieldName = 'RP'
          Title.Caption = 'RP Animal'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NACIMIENTO'
          Title.Caption = 'Fecha Nacimiento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EDADCAPTION'
          Title.Caption = 'Edad'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CATEGORIA_NOMBRE'
          Title.Caption = 'Categor'#237'a'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO_ACTUAL'
          Title.Caption = 'Estado Actual'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZA_NOMBRE'
          Title.Caption = 'Raza'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 255
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ULTIMO_EVENTO'
          Title.Caption = #218'ltimo Evento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ADN'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TIPIFICACION_SANGUINEA'
          Title.Caption = 'T.Sang.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Visible = False
        end>
    end
  end
  object Ptop: TPanel [5]
    Left = 0
    Top = 65
    Width = 1008
    Height = 247
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 4
    object GBComplejos: TGroupBox
      Left = 182
      Top = 0
      Width = 826
      Height = 247
      Align = alClient
      Caption = ' Filtros avanzados '
      Enabled = False
      TabOrder = 1
      object LDesde1: TLabel
        Left = 60
        Top = 212
        Width = 37
        Height = 14
        Caption = 'Desde: '
      end
      object LDesde2: TLabel
        Left = 324
        Top = 212
        Width = 37
        Height = 14
        Caption = 'Desde: '
      end
      object LDesde3: TLabel
        Left = 604
        Top = 212
        Width = 37
        Height = 14
        Caption = 'Desde: '
      end
      object Lhasta1: TLabel
        Left = 160
        Top = 212
        Width = 34
        Height = 14
        Caption = 'Hasta: '
      end
      object Lhasta2: TLabel
        Left = 444
        Top = 212
        Width = 34
        Height = 14
        Caption = 'Hasta: '
      end
      object Lhasta3: TLabel
        Left = 724
        Top = 213
        Width = 34
        Height = 14
        Caption = 'Hasta: '
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 313
        Height = 197
        TabOrder = 37
      end
      object GroupBox2: TGroupBox
        Left = 512
        Top = 0
        Width = 313
        Height = 197
        TabOrder = 36
      end
      object GroupBox1: TGroupBox
        Left = 253
        Top = 0
        Width = 310
        Height = 197
        TabOrder = 35
      end
      object CBSexo: TCheckBox
        Tag = 4
        Left = 6
        Top = 21
        Width = 97
        Height = 17
        Cursor = crHandPoint
        Caption = 'Sexo'
        TabOrder = 0
        OnClick = CheckClick
      end
      object CBRaza: TCheckBox
        Tag = 5
        Left = 6
        Top = 68
        Width = 97
        Height = 17
        Cursor = crHandPoint
        Caption = 'Raza'
        TabOrder = 1
        OnClick = CBRazaClick
      end
      object CBCategoria: TCheckBox
        Tag = 6
        Left = 6
        Top = 165
        Width = 97
        Height = 17
        Cursor = crHandPoint
        Caption = 'Categor'#237'a'
        TabOrder = 2
        OnClick = CheckClick
      end
      object CBCondCorp: TCheckBox
        Tag = 7
        Left = 263
        Top = 91
        Width = 75
        Height = 27
        Cursor = crHandPoint
        Caption = 'Cond. Corporal'
        TabOrder = 3
        WordWrap = True
        OnClick = CheckClick
      end
      object CBCronoDentaria: TCheckBox
        Tag = 8
        Left = 263
        Top = 54
        Width = 66
        Height = 26
        Cursor = crHandPoint
        Caption = 'Crono. Dentaria'
        TabOrder = 4
        WordWrap = True
        OnClick = CheckClick
      end
      object CBEstadoRepro: TCheckBox
        Tag = 9
        Left = 263
        Top = 13
        Width = 82
        Height = 28
        Cursor = crHandPoint
        Caption = 'Estado reproductivo'
        TabOrder = 5
        WordWrap = True
        OnClick = CheckClick
      end
      object CBGdr: TCheckBox
        Tag = 10
        Left = 263
        Top = 170
        Width = 58
        Height = 17
        Cursor = crHandPoint
        Caption = 'GDR'
        TabOrder = 6
        OnClick = CheckClick
      end
      object CBRodeo: TCheckBox
        Tag = 11
        Left = 568
        Top = 21
        Width = 97
        Height = 17
        Cursor = crHandPoint
        Caption = 'Rodeo'
        TabOrder = 7
        OnClick = CheckClick
      end
      object CBPotrero: TCheckBox
        Tag = 12
        Left = 569
        Top = 67
        Width = 97
        Height = 17
        Cursor = crHandPoint
        Caption = 'Potrero'
        TabOrder = 9
        OnClick = CheckClick
      end
      object DBLCBASexo: TDBLookupComboBoxAuto
        Tag = 16
        Left = 74
        Top = 19
        Width = 171
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ID_TIPO_SEXO'
        ListField = 'NOMBRE'
        ListSource = DMSoftvet.DSTipoSexo
        TabOrder = 10
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object DBLCBARaza: TDBLookupComboBoxAuto
        Tag = 17
        Left = 74
        Top = 64
        Width = 171
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ID_RAZA'
        ListField = 'NOMBRE'
        ListSource = DMSoftvet.DSRaza
        TabOrder = 11
        OnClick = DBLCBARazaCloseUp
        OnCloseUp = DBLCBARazaCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object DBLCBACategoria: TDBLookupComboBoxAuto
        Tag = 18
        Left = 74
        Top = 162
        Width = 171
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ID_CATEGORIA'
        ListField = 'NOMBRE'
        ListSource = DMSoftvet.DSCategorias
        TabOrder = 12
        OnCloseUp = ComboCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object DBLCBACondCorporal: TDBLookupComboBoxAuto
        Tag = 19
        Left = 350
        Top = 93
        Width = 205
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ID_CONDICION_CORPORAL'
        ListField = 'ESCALA'
        ListSource = DMSoftvet.DSCondicionCorporal
        TabOrder = 13
        OnCloseUp = ComboCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object DBLCBACronoDentaria: TDBLookupComboBoxAuto
        Tag = 20
        Left = 350
        Top = 54
        Width = 205
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ID_CRONOLOGIA_DENTARIA'
        ListField = 'SINONIMO'
        ListSource = DMSoftvet.DSCronologiaDentaria
        TabOrder = 14
        OnCloseUp = ComboCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object DBLCBAEstadoRepro: TDBLookupComboBoxAuto
        Tag = 21
        Left = 350
        Top = 16
        Width = 205
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        KeyField = 'ID_ESTADO_REPRODUCTIVO'
        ListField = 'NOMBRE'
        ListSource = DMSoftvet.DSEstadoReproductivo
        TabOrder = 15
        OnCloseUp = ComboCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object DBLCBAGdr: TDBLookupComboBoxAuto
        Tag = 22
        Left = 350
        Top = 167
        Width = 205
        Height = 22
        Cursor = crHandPoint
        HelpType = htKeyword
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ID_GDR'
        ListField = 'NOMBRE'
        ListSource = DMSoftvet.DSGDR
        TabOrder = 16
        OnCloseUp = ComboCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object DBLCBARodeo: TDBLookupComboBoxAuto
        Tag = 23
        Left = 625
        Top = 19
        Width = 192
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ID_RODEO'
        ListField = 'NOMBRE'
        ListSource = DMSoftvet.DSRodeo
        TabOrder = 17
        OnCloseUp = ComboCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object DBLCBAPotrero: TDBLookupComboBoxAuto
        Tag = 24
        Left = 625
        Top = 64
        Width = 192
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ID_POTRERO'
        ListField = 'NOMBRE'
        ListSource = DMSoftvet.DSPotrero
        TabOrder = 18
        OnCloseUp = ComboCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object CBAnios: TCheckBox
        Tag = 13
        Left = 6
        Top = 211
        Width = 52
        Height = 17
        Caption = 'A'#241'os'
        TabOrder = 20
        OnClick = CheckClick
      end
      object CBPeso: TCheckBox
        Tag = 14
        Left = 271
        Top = 211
        Width = 52
        Height = 17
        Caption = 'Peso'
        TabOrder = 21
        OnClick = CheckClick
      end
      object CBFrame: TCheckBox
        Tag = 15
        Left = 551
        Top = 211
        Width = 52
        Height = 17
        Caption = 'Frame'
        TabOrder = 22
        OnClick = CheckClick
      end
      object EAAniosDesde: TEditAuto
        Tag = 25
        Left = 102
        Top = 209
        Width = 54
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        TabOrder = 23
        OnChange = EAAniosDesdeChange
        OnKeyPress = KeyPress
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object EAPesoDesde: TEditAuto
        Tag = 27
        Left = 366
        Top = 209
        Width = 60
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        TabOrder = 25
        OnChange = EAPesoDesdeChange
        OnKeyPress = KeyPress
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object EAFrameDesde: TEditAuto
        Tag = 29
        Left = 646
        Top = 209
        Width = 60
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        TabOrder = 27
        OnChange = EAFrameDesdeChange
        OnKeyPress = KeyPress
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object EAAniosHasta: TEditAuto
        Tag = 26
        Left = 194
        Top = 209
        Width = 54
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        TabOrder = 24
        OnChange = EAAniosDesdeChange
        OnKeyPress = KeyPress
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object EAPesoHasta: TEditAuto
        Tag = 28
        Left = 478
        Top = 209
        Width = 60
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        MaxLength = 4
        TabOrder = 26
        OnChange = EAPesoDesdeChange
        OnKeyPress = KeyPress
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object EAFrameHasta: TEditAuto
        Tag = 30
        Left = 758
        Top = 209
        Width = 60
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        TabOrder = 28
        OnChange = EAFrameDesdeChange
        OnKeyPress = KeyPress
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object CBEstadoParicion: TCheckBox
        Tag = 16
        Left = 263
        Top = 128
        Width = 66
        Height = 29
        Cursor = crHandPoint
        Caption = 'Cantidad de Partos'
        TabOrder = 8
        WordWrap = True
        OnClick = CheckClick
      end
      object DBLCBAEstadoParicion: TDBLookupComboBoxAuto
        Tag = 40
        Left = 350
        Top = 130
        Width = 205
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ESTADO_LACTACION'
        ListField = 'ESTADO_LACTACION'
        ListSource = DMSoftvet.DSEstadoParicion
        TabOrder = 19
        OnCloseUp = ComboCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object CBOrigen: TCheckBox
        Tag = 17
        Left = 569
        Top = 116
        Width = 122
        Height = 17
        Cursor = crHandPoint
        Caption = 'Origen'
        TabOrder = 29
        OnClick = CheckClick
      end
      object DBLCBAOrigen: TDBLookupComboBoxAuto
        Tag = 41
        Left = 625
        Top = 113
        Width = 192
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ID_ORIGEN'
        ListField = 'NOMBRE'
        ListSource = DMSoftvet.DSCodOrigen
        TabOrder = 30
        OnCloseUp = ComboCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object DBLCBASubcategoria: TDBLookupComboBoxAuto
        Tag = 42
        Left = 74
        Top = 113
        Width = 171
        Height = 22
        Cursor = crHandPoint
        Color = clWhite
        DropDownRows = 20
        KeyField = 'ID_SUBCATEGORIA'
        ListField = 'NOMBRE'
        ListSource = DMSoftvet.DSSubCategoriaRaza
        TabOrder = 31
        OnCloseUp = ComboCloseUp
        OnKeyPress = ComboKeyPress
        OnKeyUp = ComboKeyUp
        OnMouseDown = DBLCBAMouseDown
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object CBSubcategoria: TCheckBox
        Tag = 18
        Left = 6
        Top = 103
        Width = 59
        Height = 41
        Cursor = crHandPoint
        Caption = 'Tipo de registro'
        Enabled = False
        TabOrder = 32
        WordWrap = True
        OnClick = CheckClick
      end
      object EARemito: TEditAuto
        Tag = 31
        Left = 625
        Top = 162
        Width = 192
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        MaxLength = 50
        TabOrder = 33
        OnChange = EARemitoChange
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
      object CBRemito: TCheckBox
        Tag = 19
        Left = 569
        Top = 165
        Width = 52
        Height = 17
        Caption = 'Remito'
        TabOrder = 34
        OnClick = CheckClick
      end
    end
    object Pizq: TPanel
      Left = 0
      Top = 0
      Width = 182
      Height = 247
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 0
      object RGBusqueda: TRadioGroup
        Left = 0
        Top = 0
        Width = 182
        Height = 41
        Align = alTop
        Caption = ' Seleccione tipo de busqueda '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Todos'
          'Filtrar')
        TabOrder = 0
        OnClick = RGBusquedaClick
      end
      object GBChecks: TGroupBox
        Left = 0
        Top = 89
        Width = 182
        Height = 158
        Align = alClient
        Caption = ' Filtros simples '
        Enabled = False
        TabOrder = 1
        object CBAnimalesActivos: TCheckBox
          Tag = 1
          Left = 10
          Top = 24
          Width = 154
          Height = 17
          Caption = 'Ver solo animales activos'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckClick
        end
        object CBRechazados: TCheckBox
          Tag = 2
          Left = 10
          Top = 45
          Width = 161
          Height = 17
          Caption = 'Ver solo animales rechazados'
          TabOrder = 1
          OnClick = CheckClick
        end
        object CBUltimoEvento: TCheckBox
          Tag = 3
          Left = 10
          Top = 66
          Width = 156
          Height = 17
          Caption = 'Ver '#250'ltimo evento del animal'
          TabOrder = 2
          OnClick = CheckClick
        end
      end
      object GBRP: TGroupBox
        Left = 0
        Top = 41
        Width = 182
        Height = 48
        Align = alTop
        Caption = 'Filtro RP'
        TabOrder = 2
        object EARP: TEditAuto
          Left = 48
          Top = 19
          Width = 122
          Height = 22
          CharCase = ecUpperCase
          Color = clWhite
          Enabled = False
          MaxLength = 10
          TabOrder = 0
          OnChange = EARPChange
          OnKeyPress = EARPKeyPress
          EsClave = False
          EsRequerido = False
          ISParam = False
        end
      end
    end
  end
  object PBotones: TPanel [6]
    Left = 0
    Top = 612
    Width = 1008
    Height = 96
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 3
    DesignSize = (
      1008
      96)
    object IFondoB: TImage
      Left = 0
      Top = 0
      Width = 1008
      Height = 96
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
    object IAyuda: TImage
      Left = 16
      Top = 16
      Width = 53
      Height = 56
      Cursor = crHandPoint
      AutoSize = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000003500
        00003808060000005D78B0AE0000001974455874536F6674776172650041646F
        626520496D616765526561647971C9653C00000A8C4944415478DAED9A7B7055
        C519C0BFF3BAEFBC08011292DC440529AD31017C9040BCA85375B03C9CDA3F18
        1D8376D0CEB4463BD6A2B50DB565C60E53914E1DA7D371D4D64E6D9B0A6D8701
        4A2188404114B411906702098F202697DCF73D6777FBED9E73939B78EFF512F2
        00C79DF9EE77F69C3DBBFB3BDFB7DF7EE724127C098B34D613F80A6ACCA11AEB
        F2F1B71AC58792671D2797769493281FA26C83353BFD572E54635D03FE2E4459
        94DC7B9DF78601CD3AFC5D70EAE279B3C2C42F875B83B2EE7201870FAAB16E11
        FEAE06052A2419A0B6FC1BB0A4EA4E98535905DE8249FDED1080320A9452E809
        076047FBFF60E3B1F7E0AF1FB7E005BC4CC18F6DD620D88AB18332DD6CB5A442
        8364936076D974F8CDDD8F43C5B8E27E0E66D1A4280C2F72C076FF39F8F5AEBF
        40F3A1EDC00C3C1F67DC724B11EEC3D18532815A725D52B5C7A9C0E3B50F4043
        F5FC94D367836B6CE0354596419515D873FA20FC68C38B70AEB71B7A43CC6F10
        7812C15E1F4DA8FD6579527521023D3BEF07706BC5CC4100835058D21536B825
        034992C0EDF00045BD6AEBCBB0E1E056B42083B00E359762B1A14335D6AD9E9A
        2F3DE1CD556059ED32A8299B614E910DB609335DCC5A477CE2A6C8E655D6DF2E
        61C01C670E941695C3CAF5CFC386035B606F176BD7A900CB2A800C0DAAB1CE57
        E48496B92512CC2CBB1516CF786020863551427520C4406DA41E1CC1244B273F
        00860FA0A4D00B1E571E2CFFDB63B0A7B3133E38CF7E9E6DF0182A54CBFDD781
        6F9CD309CBEA7F0A9A6AEF7FD2C22286004A9440D40FED9F7D0231230A76D501
        25F91550E89EF485C34C2EBA163ABA8FC12B5B56C0DF8F833FB06A67C1C84035
        D655947AA0EDBE290CAA4AEBA1A6FCF63EB7E3408CC765ABC48D18EC3EF12F38
        D57DF873DD78ECF9507BEDB760426E79DAA1640C1CA5E3A7C21BEFAE80B75A8F
        C3FE4F61315A6BDD48403DB1E03AB6BAAA08E0CEE98F82CB9E97B6E9AE637F86
        CE9E0ED87D56827D5DB00D17FC3BFC7C81031EBAC3CB2AA68D03B8F99AC53029
        6F4ADA3EF2DC13A0B56333FCA37513FCF18094950B0E05AAE5F97AE21BEF2EC2
        093D98B6D9B98B07E0E0994DB066AFE23F1D104F78DBA07E5E7BB486365C3FDE
        86167B0454C591B21F45D62014BF005B0FBD0A3FDBAEF0746ADEB043153D53DB
        F38B7946FEE4825BA014255D3974F66DD874F40CBCF191B234E53E837BDC8D13
        59CFF766193075D2BD50E0BA266D5F3A8DC0BEF6DFC363EBB591819AFECBD9EC
        B9DB74282FBC07F29CE927D2DAF932BCB84B83F7CFC805E94271A2AF09B937C1
        C4DC9BD3F6C524033EEEF81D2C69B68F00143EDD1B26929E17EE8A4149DE0270
        D84A52368B1B17702D35C3F24D76687D76B794A6AF8AD965A4EDB979318C84B5
        90E7AA4A3B2C61413879E14D98FF07D78840F91E9E156B7964561434653C4627
        5BCA6694C6412717E0FBFF74C3FE1FEF4907D5F2DB85215F4DB10145B94B3045
        CA493BC570FC207CD2B503BEFDA79C9710EAC9E186E2EF44AB2FE99EC14FD6CA
        177F322F523D7F5A1C9CB6A990E3A84D7BBB2CD9309BDF0C9B8F74C2F28D2E9E
        07BE34BC50975BD0D21E1B5BFB547D2C7F8ED7805C6715B86DD307EC6D9F2BB8
        F79DEB6D8655DBED1878B44A846ABF72A01AEB565416D0A6677D7128CD73C3B5
        9396423C1E8648BC2BE36DBDD183D0D6DD06DF7DDB91D57A1A1D28D3DDD6DE33
        95F81E9A4130CACD829995CBA1AD6B3D5C8CB465BC358CC0FEC82158B94DF5B7
        9E936BB2B1D2C84359EBE79199A47A8E97C1B492FBC15B783B1CEFDA08A1D8B9
        8CB70663A73167EC84573F9061C74939ABF468B4A05A1EACA6BE3AAF025F9BB4
        100A3D53E0F8F92D60D058DA5B1823087316BA23DDB0EE90EC7FB75D1AE597C4
        CC400D73BDECB5C5D365B8A6B016C6B92B31E3DE37207B1F5C386C2F5AB0E362
        0C9A0F48ED27FD22BD1AE5D7F90CC5F9545DDB0F6BA1A238A718CA0AAAA0ABF7
        28BE281A69DB47F420BEE1FA61D7290AEFB4C3BA605C7C9F18D257A59181C2FD
        AC6A22EC5F304D86F2FCAF438C04F15D2A9CB2297F290CEBBD70211485F547C0
        7FA247C064BD7E46136AD1EC32696DBDD70645EEC99865A77FE0C17800BA8206
        341F64FCD564F1707CD41C29A8150BA7C94DDE3C0D72ECB968A968CA6606BE21
        9FE98DC1FAA3F4F5D0AA9D4B876BF81183BA6B8ADC549AAB815B7341D4481DED
        E2240E5B4F10387591155CD99F9D2DA8DB2A95A6E21C159CAA0DC2463C653382
        E1BBB9D5C83A531873A85BCA95A642976C7E90C950367C72154115E7CA4D0E2D
        73F7519DC1D95E9AF5A7AFB1851AE33252966AC0DF8A2C5BB75F6A1A3456502D
        DE718A2F9BA627BBC955B3A65A66556A3E5FF18D199B7DF8D971F8CFE19EAB07
        6A4AA9EABBAF7466C666DB3F3D02FF3D7E1541154E507C8B265C9FB1D90E7F07
        1CEE0C5C3D501AAEA9BBF327676CF65EF053E83A1FB9B2A028A51217CCB4658A
        8229B7C28F3DCF7C7303F1B0B935AECC7FA4381A0D40344077F4AEDC782F4812
        9124894AA626B279CC144561594E67685084100EA150CA54CAA88D51AA51214C
        C3BA8AC72A42A9DE17BEF346488EDEE4B63933F617D563E024F6F74F3CFDD6C3
        16089164C99065599725D9D4B2149784E6E7B08D2C5394CB8342106E113E613B
        E142888312829ADA0825364AA89D83110B10A19419AF2C5BF5991EA892642563
        DF8C1218AFE57EBCF7D157969B401C44E2001C282ECB8AAE28724C919538D7B2
        A2E0B11CE51ADB1BAAAAA6FCB696162A09C6611886CB20C4490CE244ED20FD22
        E02887A35C9B56BBE3CDA79E3E1BEA9E9A8DF54BDC8547FFBDE457AB11C69024
        CB2208841071532388A2442D1D515525AAF2BAAA46B01E56CC36035C3425145F
        2738791B310CB70032884B378F9DBC4E382042E1790702211C5A8B039A60B66D
        A73E2AF747831ECC65151C40B6C6193C16E5FF5291EFF084EBCB6EE844F7D3F9
        046501635AC6828924345A8643854DAD8635550D211C078B245B2D25144E5C45
        F1E8BAE1D60D5D68C3E81397A93918029AD6735AA0C2452931E1F83A63B8FEB8
        4B62B69E3C16E341C172B97EEBC8022401930009731045113AA4695C6B5C0735
        D4AAA686102EC8DB27D65A4A2884B01B268C27AE73AD7B12F5042CD7034189DB
        B020856B52D33519132EC9C1F8887202480406B17E94040CBA9470ADB0092224
        C4415007CD632D286084681C2AA8D9B816D7C308C5B2B11442C57350A3E85CF8
        B91C0B30C7E075DE8E03EA5CEB420B5092B0267751114CD4242811D992ACC127
        CE9F387FF262927CD2AAD06A2001833AC0EB0208C5A661DD86A2AA016EE18C96
        E2FFEF8093D170720226CE81E29636A12C48C304358C5CC3AC7BC479EB3EF3C1
        08EDE6EE688D272C658104ACC9736D4ED804E8AB27810C105BDFB1008A26078B
        8C211D27A9A01B390DCB42962B0E9870BF4B9A93374CCB09B744577425A22577
        43C64C28743B743D73EDF4B99BB5368475B8D612D6E9B34CC0723B0E2E8E151E
        284C8B6717D207C1C9628DE0DAB15CCDADF7AF2957D2BA7289E041685FC8B7F6
        2EB1A618FF7313B714E09AE2211CF7A3A4E010B142366AB196C49A4208D3354D
        C0A0AAF08827F62B6330CC2541A50054CD0D5884736BEF12307601C2B5D8BB38
        8CC832F8E832FF4F1849EA8B7E663A941CFD841B7148B107092B625DEC51B8E1
        EA58275F944D0C092AD5FA4341502A63DA84EE4A150CE30A87A1562E883032F7
        BAA461797CA7220ACA567A24D22211E2095A41A443E92C31E2505762F95242FD
        1FFDCB83937FDE87D20000000049454E44AE426082}
      OnClick = AAyudaExecute
    end
    object LAyuda: TLabel
      Left = 23
      Top = 76
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
    object IFicha: TImage
      Left = 261
      Top = -8
      Width = 96
      Height = 96
      Cursor = crHandPoint
      AutoSize = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000006000
        0000600806000000E2987738000000097048597300000B1300000B1301009A9C
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
        67414D410000B18E7CFB5193000013204944415478DAED5D6B701C55763EDD33
        D2481A3D2CEB656CC9C806AF3171392B6B8160CBBB76C17A0514046157B2946B
        934A2A49153F367F08BF88531BE3D8B55E559184059CB0807939984A6DAA282A
        50B191D760B3C2F213CA711684243FF47E8E9EA379E67CB7FBF6DC6E8D58EBD9
        63985375D5AFD1A8FB7CF77CE7716F5F69F1789CD2E29E686900DC9534002E4B
        1A0097250D80CB9206C0654903E0B2A4017059D200B82C69005C9634002E4B1A
        0097250D80CB9206C065D1DCBE81457826ED6BAECDB7C4A7D94F76BC2837B498
        A225D9A2E949AECDE7B327533AB631731B4F726DDE6FC26D49A674340F2500D0
        95EB0B2152D931651B35B7D381F18D024055BC970CE5CBAD47B9A62FD03D4825
        479516711CCBCF90DC7E130050952F958E96F9C1071FD4141717FF3A10082CDA
        CD20A859B26409B5B5B5FD68E7CE9DE7F954D86C120C9B35DCEC00C8FB97CACF
        309B8F5BD6B163C7DA3C1E0FE5E7E713B60B2D50FEE4E4240D0F0F93AEEBC41D
        E0AEFAFAFAEB7C69925B880C10D02400F1E90070339298A9485A91CACFE2967D
        FCF8F1AFB8F7537979394D4C4C502C165BF01B010059595962BFA5A585060707
        A9B6B6F6363E9CE01624030458836509BF4FD1AA79ABE7927DDE0D91F703CA91
        3D3FFBC489137F9B9797F7D33BEFBC93BABABA686C6C6CF16E48D3A8A0A040B4
        CB972F0B8BA8A9A90108B80980006B80154C0120152289193DAB724F82F3C9EC
        FD0D0D0DE7376CD840D168D4A283C514589BDFEFA79C9C1C3A7FFE3C1D3D7AF4
        C17DFBF65DE24BE394B0044145C96267A974D9924512A90482E47E01C0850B17
        0E8742A135EBD6ADA3818101D76E0C74B474E952BA7AF52A0EFBD7AF5F7F2F6F
        47C9000156002A8A25EBF552E99253332E5EBCD8EEDA93CCE2C16FB9E516D1EB
        C1FD8BDDFBA5C00A9806851F40ABAEAE5ECFA747C8A022F804584154EDC9C922
        095F7373F315F940F201DD54EE8D7E0ED4030A02272FB6405700203B3B9B8686
        860861F04616BE8478585A81A021A7A395A6ECFBECB3CF0E8C8C8CFC399B0E65
        646488878944228BFE30B3956030B828914F3241C80B10BC5EAFA0417406D6FF
        DD6400304C0A0D39A9C7726467CF9EDD9F9999B96BF5EAD5567C9B6A82079DAE
        53E0BC5BD68AFB82F2D1BABBBB893B3200D8C49706C9004046446167EF07EDE4
        70F33736363EC3A1D48F2B2A2AACDE8F07924DCA623DA44A25D847C303CA8EE1
        06D54C272A0008834D0AAAE14B880A9202A0F67E3FB7DC93274FEE292A2ADAB9
        72E54A0A87C3A20108281CA68D26F7174360D25032B6721FD488FB92FEC90992
        DB0060DBD3D323688801D842090B801F9850019071743694CFAD8093997F282D
        2D7D0C99241E92433B6105720BC5031009C4428A54BCCAAD4C8F628BBFAD8292
        0AA202D0D7D7271A03F07D1300E9882D00D44426C7046009A7F2BB39FA7974C5
        8A156CE6411A1F9F10E60EE786ADD32A161A003C0C7A3C9ACFE713293F121D88
        7CD85405A0B7B73719002221530190FC9F0700389BFC7B06E08F972F5F2E940E
        1EC316312D527B6915D20A165264EF47AF87E2115F030400808C5302E356CCFF
        750040F93301C02F01F8F0C30F01C023C801C6C64659F143C29BAF29F1D0E0D5
        CF319A6CC4AFE207F6B1131784A699D7C8BA263F675C135BFEACA65CC70F5DB3
        9FD374B9AF7C2F6F9B4FBF40C1DB5E12554E3400010016A3E27923226972A600
        C001C302F24D009EE6DEFF485959192B7E98BFA44F24152BF5366A3DF9A65084
        A6284C978AC3793D6E5DD385C2C1D3EAF9B8D817E7B49850B4AE1BDF218FC567
        3C710314794D8F89DFA97FAB9B1EFEAB37898304517BCFCDCDB57C422A881300
        38E25903505252C2894480E3D91EC1676BFD5DD47AEA2DA33CAAC71520EC6048
        258B86DEAE93A5CC84F2E342F11640621B3380936009704C50740390FAB77AE8
        FE5DBF220E1204080000D4942A0040F1B2CD1900D4D4878606399EED165FB4A1
        7080DA3E79D3CA9F754A285F93CA9456A09B54A3F460A954039098A16809247A
        B854BEAE588AD2FB71FC8B377A69EB9F1E1400A083808690F6A70A00D267CD19
        00F8000940676797C8EA361607A8D504402A874C0BC0FEC0489042EC3322EC9C
        B3B2102E7A687C6C5228B8A83887F20B324D0B307AFD285F8B84A3545CECB32B
        5D9780252C4737813AF0662F6DD9F13C811E0182F40370CC6E4642322F520180
        F2E76C0183830302006475D5A5C374F9D8AF38B918144ACACBCFA5FC2539E4E1
        FD2FAF718484D47B2C64F67E4DF8E598C89E39CECDF05069791E55DE5648D170
        84AEB50DD2D5AB2334361EA13FAC2AA2AAAAA5963F907493F01FA675B0D5FCFC
        8D3EDA54F74B5AB66C990001831FB00084C76ED57FA07CF82174042700A2E3CE
        15809E9E5EEAE8E8A08D25013AFAEA1E6A691FA05084A838CF434585B93416D1
        189400E5FA1089680210D11BD12BC40D1A25DAE0649446F8F7B23C1AF5072669
        3CC47F348368CDEA3C7AE491F204DFDB1CB7E217B81D78BD8FEE7DF497A2EC0C
        0B282C2C140FDFDCDC2C4AD06E5801C271E86ACD9A35E25882306700C0B11280
        F6F676B680213A75E41774EC5C3BFDF64A847259791BCB755A5BE613C41E85A6
        E34446486E84A6317308DA30514EFFF866DB7A27A9B52722945F599A410F6C5F
        4E6BEFC833E946D29BDDF94A607ECE006C7AF4790100EE0F00807EDADADA44AE
        E21600188059B56A9538562D00CC3167001005C10200C057270F51CB57D7A899
        2967224C5451EAA76C6F9C268361335E37E2F1B8A1756396522C6E962DF86679
        7F82793F93AD6559898F56ACF4D3EA55B9A6A335B26AD51FC8280BA086F977FF
        F9703F6DFD938316052114954ED8CDF10A67AD6A5E01401424BEA87490AE34BE
        21A29B919131E6759DFC793E6AF9B283BA3A075961E8A640DF6B82C0CAE7DE11
        8D840520D04F38CA60310005F95E4EA00CAB094EA2B664801389A29C1CE36D8C
        336EFE3CD31427DD343816236F3E6799051EAAFBEB9708593AEE0F00807B4143
        6E8BAC4DCD0B002B56ACB00048386100F0BAC2CF062D349EB942A19151CAF0EA
        42E91E4F8600021E20CC1AC4D9C9B0610DE393110A4C44A828C7CB0A87A2E30C
        0A0900B00FDF020042E198507C70224E81409C6E5B9B457FF917C5F4EB8F4798
        820E0A00E0032400C8865341D4E221F87F4E00E001514EC5977476760A00AE9E
        7EDD8C501209D3A1FF6EA52F39AAD9B43A9396FA990A98B0750621168D88D615
        885023FB8CF5B77828530BF3EFE8E273E8E5E8F52A0061D302C20CC0D8380332
        49B46D6B01EDD8514859D944FB5FEDA7CD75FF6E39614441B226940AE204007A
        9B17000C0AEAA76B0C80ECF9BA59AF6969EBA3F3173BA8807B754EA6F096A47B
        33987A420C00F7E089288DB342FDCC123D43212ACDCF242F47421151D666DA89
        41E90605490B181D8D903FD74B3B1E2BA6EA8D39963FD8FFEA005B8001800C43
        0140AAE40172C0685E0190A65455DA47D70500712B34040063A313F4D9D9AB62
        CA97D90F3814F50AEE471E6000C6CA1F0E513014A592BC4C43F1F1A90080AAC6
        C7A374FBED59B4A3AE888A394AD2940C7BDF2B06002A05C1098F8F8F8B68C42D
        E5CB4AAD787AC50788F07D36009497979B00F48B28482009009A5EB30100A5E0
        06CE34B6D1182761BAC7A853E8BA876200C0BC4928FA4A7F900A733C6C091E8E
        6862223A8A98004077C813A2718DB6D4E4D356A61D6F06D9FF166FFFE9E501A6
        A0972C0B9079C0E79F7F2E4AE56E94A5013CA2324C629056202D60CE00C009A3
        1A7AFDFA75AA2E030087ACDA8FAED4819A7FD7436DAD8394010A8A6B82E763B1
        88310D9801EA1B09D3E068982A8A7D223C8A88D0342EB6E10887A6EC6C97147A
        A9F681A5A2F71BD974A25A2A81D8CB00D4D4BD6C01000B40EFC3242864C36ED0
        10948E8E8021DCB8B078C30FC002903FCD1980BEBE7E01C0C652FEC233AF390A
        65C6FE7020484D8DD7451D08BDDFEB35662D4438AE8455F40D87C5E70BD9F9C2
        1AA2266786220843E3B4E63B7EDABEBD9072F3751BB0BAAE94B919B9BD2F0FD2
        E6475FB651502A3961C8BC0050515121C25014E3AC4CB88CBFF0ECA18413D612
        D5CC38F3F96F1ABE6020C6B8DF7A29D3046098F93C14E5A8A7C047591CF7E38F
        A2D70B87CBFE406370EEB977097DEF7B79B65A90A8A4624C004F64D6825002DF
        FBD2105BC02B84E15299074800F0E06E2463CEBF2B1DF1BC016065C2CB787BE6
        50A2AE8F70D4ACF5C7188086FFB94C175B27696D093B25CE8EBB8635BADCA5F1
        17C7E88ED57ECACBF608CE870580EF971667D00FB62DA5E5E53EA30E44E6F739
        0775ACE21C0900369B00A4AA054810E60980212B9CAA2EEBA28E73AF9905B244
        C14C2AEC5453274D5CEFA46044138AEE1B266A6DE73FE0D3A9FA0F58497C5321
        11E3C7E9F6B57EDAF47D8E60B2ECE307CC5ECA204FA206A499D5D03DC2020E09
        0A923E20150180603C4050F75C0190E154F53206802948F7D8E94737075B402D
        BFFDB49D26BA38741D8852473FFFA5A887BEB32A8BB9DF23B83EC3A7D1C6BBF2
        69DD7A7FC287A874A628DCAA0551A248B7E7DF8668CB63AFD99CF0371E007C91
        00A0AC833ACF1F32E37FA34EEFD1ECB4816D7B4F902EFD5F8002D746C997CD59
        216B7322C8F17F998FFEA8A6908A8ABDD6672D859B3C6F53BC6DD89344CEF10C
        0350C30038F3000C9962A6865B51107200E86B610158D6415D175E9D32B86E1F
        B532B6414E694F1DEDA2C0685414E1D6DCE1A7AABB0A083533ABD7EB64FB2E35
        E152C78A494BF8803D0703B465C7EBB6621CB2E00B172E70F63CEA5A1E80FB41
        1E30EF00604E10BE083EA0AAEC3A759F7FC52A41E87ADCB2060FB6E6808A04E4
        E487DDD4DF1FA2BBEE2DA44A8EED55CAB194ED89DB38DFF88C39244989A92C32
        EBFE4706E0073BDFB2C603508A401E70EDDA35D7C603641E80B9B4F302C0471F
        7DB4971FF08730710000F346296243512B75B30558A1A239B544D7ECCE585A46
        77C738E5E4EAB4A4284380621F8457FD48826A5470D53944F2333F3B3844F7FD
        F888C83C310A0500500D4D9541F9B900604DCC920018F38246AC7AD0BAFCDF51
        F7C557ACE4C85068CCAAF5E84A6F36F665FC9E70D416ED3846BAE4CC08E75417
        A70F8005D4FEE4BF8403C62814B83795664538018065565757CF0E0098397855
        5A4165E605EA65004857E927AE0CA427A842774CAE52A79E686A0F779434E454
        16A97863D61C5913BF7EF66280EAFEE603ABF7635E107CC0CD0C807C37600A00
        487650659420F41EFB09FD47438F325D30A124A2A9118B38C625E7744493A613
        5315C9364D519CA7C4F9C43E515B478476D7375ACA97A361A93235713E002804
        00ECD5EFC7F4748476986D804A23E80860E0589DAABE90A24E4907D540E9A01D
        C4FE38C6F9549A9C3B5B006C4EF8934F3EA9678EAD912F6840D9A83442F1D8E2
        D88DE9E95036E8068AC7562A3F95A6A7CF0B004D4D4DFFCA0EEEEE5B6FBD55F4
        70A3AA997841038A77E3050D39F55B4EC6454BB51734E60380C2B367CFBEC009
        4E15E6B948254B85A7C22B4A1210794E02956A326B00CE9D3BF72203F0DDCACA
        4AEBCB52ED25BD547927ECEB64A600584E982DE045CEECBE2B677AA56576326B
        00CE9C39F33CFB808D6900E626B306E0D34F3FFD97929292BB670AC0175F7C41
        478E1C116F874364968A77CB1035C1696EDEBC991E7CF0C194091B715FEFBFFF
        3E3536368A2003F78B1C032137722008B2EEC71F7F5C0C022D0A00A74E9D3AC0
        89D8969900805AD1430F3D44EC3FC431E6EDAB224181F37CEEB9E7E889279E70
        5BF7C2871D3870809E7EFA69116438EF1920483FB769D3267AEFBDF744D16D1E
        00B0BDA63AC5091F3F7EFC190E41EF9F09000D0D0D74DF7DF759C7CE87C103CA
        C5931E7EF8617AF7DD77DDD6BFE8E1DBB66DA3D3A74F27BD6788EC38904B972E
        111682BA51510098F645EDA4A58813274EECADA8A8F8E14C0040D56FFBF6ED62
        A5A8640F830C5A86ADF5F5F5F4E4934FBAAC7EA38CBC7BF76EDABF7FBFE8E928
        6F3BD7C5900080360F1F3E2CE86916004CBB5481F33555BCA82D4A11E5E5E5DB
        67EA035A5B5B8599A26E042A42C28492012AA9F7DC738FE0500C5C00A854F201
        478F1E15E31DF003187E35A6E30C0ABAACAAAA126BCFD5D6D68A02E04C440160
        DAC53A92BE29FFF1C71FEF6365FD281D05CD4D000083F900EFF6731B2263D1A6
        29CBD5A86B45C00A6063852D2D2DBF412296AA49CECD2088AE98BAE018413FAA
        03B62DD824574B91CB15887A10F361E5B3CF3EFB67BB76EDAA75FB416E46613F
        7AEAA9A79EFACFA6A6267878D9FB25FDD8962C5357CB922BA6008402EEFD05EF
        BCF3CEDF6DDDBAB592F9AFDCED87BA198499E37F391FEAD9B973E70B1CF5F592
        C1FBE8FD72BD38DBA27DCEB537C58A5964802022221CD7D5D5DDCF51CB4F9158
        DD48FD27155E175A2841B2964C40D59814C0ACF1ECDB6FBF7D820C45AB918F5C
        B6D25ABCD5B9669C0A8258394B6939E6799FF9197509CB6FB3C895D2D1A05828
        1D4A86B2C794261DAF5C33D4B6706BB2252BC52AB48E06003229B196A8BAA2EE
        B751E24A93ABA543C10060C2D124EDD816F176AE1B2A1DB204412E63261D74A6
        795E2EE49A2A0BB8BA292A006850324098549A5C335A2A3FE9E2DDC940B02DE0
        AA9C93CA4F5390FD9F36482B400B937DE9FA29CAC72F3B95E7F409C9962F76AE
        259D96A9FF35C3F90F1CE4F929FF452359EF75FA85644D052A2DF65E1D9BA6A9
        9FB3643A056A49B64ECAD16EE07BBEE932A77FE003F97D8AD3BEE6F8DBAAF4E9
        64C6FFC20A92FE476E2E4B1A0097250D80CB9206C0654903E0B2A4017059D200
        B82C69005C9634002E4B1A0097E5FF01FA3822657AE37ECF0000000049454E44
        AE426082}
      OnClick = AVerFichaExecute
    end
    object LFicha: TLabel
      Left = 261
      Top = 76
      Width = 97
      Height = 16
      Cursor = crHandPoint
      Caption = 'Ficha del Animal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = AVerFichaExecute
    end
    object IPreview: TImage
      Left = 408
      Top = 10
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
      OnClick = AImprimirListadoExecute
    end
    object LPreliminar: TLabel
      Left = 406
      Top = 76
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
      OnClick = AImprimirListadoExecute
    end
    object IExcel: TImage
      Left = 141
      Top = 16
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
      OnClick = BBXlsClick
    end
    object LExcel: TLabel
      Left = 116
      Top = 76
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
      OnClick = BBXlsClick
    end
    object IEliminarAnim: TImage
      Left = 530
      Top = 9
      Width = 101
      Height = 68
      Cursor = crHandPoint
      AutoSize = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000006500
        0000440806000000988CFB5C0000001974455874536F6674776172650041646F
        626520496D616765526561647971C9653C000014F04944415478DAED9C79701C
        557AC0BF3E6746D2E8B66CF994B10D36064B86600EAB6C4C36816C6DC0CE8650
        B564C132C9528B61C1D93F36D766ED2CD9ADFC91C25C9B84646373EC6E12AA40
        6C8564972220731873D9B20D363E914D6CF9D0319ABBCF97EF7BDD3DD39A431A
        59B234247EA5A79EEE6975BFFE7EFD9DFD5A025C6A65D784A91EC0A596DF2E41
        29C376094A19B64B50CAB05D825286ED1294326C930925F75C6CAA2FBE5CDB64
        40F1CE213CBC4A5D2D0870076E588DEB6D9C0A8308FEEEC6BE8396B82DE2EE7F
        33637C3FDE98B373372E9F7DEA5DA3BBD08952BAD1828BF5D8BB683DA42A5D93
        2CCF0915D8843714100A9581699A437F7E5BAD208BF02FB8B9356F47567C95B1
        DCCFCCDBD685CB2D4FEF34BA7CE7DB8C8B1FE41C7D3982E9DE70ADD2827FB616
        FFE60EEC2DD86B716CFC182FEC330B029ECA5612944DABD5365CD47AEB8FEDD0
        BB8AED8BC27904170F636FA1F55387F7449EDAD85E4BD2F6642CF8CF7C6150F8
        127FB6FE5D57F2595CDD86BD2D772CEFBEF2D375BFF8DB8708C47AE6FD4DA633
        B09D83ADF9D93EABE8F54C451B110AC2588B8BC73C01E7B44EECAF20A0EDDE06
        D20E5CBCE9AD27631178FA91DBA0FFC47E603E89A3092B7AE2B140B1B1AFFAC6
        9FC1DAFBBF9F779CF7FFEB0578E1D16F6521406128F8D3FDF3FDD6F2A906E16F
        45A12090165C7C5EC231C8073CFEDDEDFB220DB3163CE66D4C20901F6EF80AE8
        E70F80220B791A211639F31835053483C1CC25EDD0B6EA7761EEE2563875641F
        1CDEF52A1CD9FD560684CD9C03DB2E0CEF0671A1004229AB287424289BC167A3
        6DF70ECBDCE539777BB0AA066E5CBB11662F6D876307F6C22BCFFC10AAA40404
        15016C5708CCAF2945B465AC50BCCF03510BA2491B9AEA6450F126B06D67CC36
        FE3271C5341958B40DBB8A639245918EF6E585421793D46C481B3648226017F0
        C244902501A41C01D39D9B48DB7C49DB6BABA48CA65C2C28493CDF60DC863AF7
        5CA6C5C0C09ED62CD00D32AB00BA09B80D00870D756180CAA0E41D278250EAA6
        1A44A950C861737334900478FBA4B32B4108C92880800DD32A18840302045591
        DF9DB92629632672A50D1367BEA819A8052252A66D042396B22096C4651A6F12
        84816CF8BE34F6FAA003A5229081D28950D64D358852A1B480EB53E8C25E3F8E
        77A09DBF5F25029A5B65C1F46A01AA4212BFF05C01670498A32985D2C70B355F
        D449A3E36913FA230CFAF046D2711D1901893F24E35815D25C02228248E6EB4B
        1A7D91A690C6C0400A33BB5E01627AFE7ED5B2058BEA4C68AA5541958A08D915
        E2B0703897028C1F0A99D841F42F09CD3157A4919823A1B902EEDFC8EC8A8233
        0074F45B11C8A6A98690DB468342B90985B83C07204D391363703EE138501125
        11146DA854114C850861D21431FF38ACC88959812FC703C576C198F84B47385E
        D425221989FB3F819FD90D89B73CBFD7DC3CD500C60C859A9B3812985A4F0016
        370B4E3443174D20C8E9A34518F98074D74A12079A49DE4A804242F5FE663428
        C37211DF315C4DA52C9E4A358F3FD76DF44CB5F02F188A0BA605172F434ED6EC
        CBD0E902B7502289FB12C09B8B1D4B51509B2429FBF76EBEE0135C7670EEE82C
        BAF3750B46D3940289E20EF429CFE172CFB3BB79BD6CC28AA0BFD9046D185ED7
        DA6E98EDF69B6DCBB12806E37D1EC6202DE8929D754CC2691D97111CD7BA0473
        6A741704C507673D2EEE00476BA8804830BA10468F6F9F11A1500B041414B850
        5042C34D96A31D1A461AA59A2F5FB218C1ABDBCB5816B67BB8DC8CDEFDEC9ECF
        766E12BEEE08BA8D91F0D930E13BDD2ABCCD83623277998542DBBA71BD63C886
        A235B7094F9A4A8142918FAACA2541D131C1704C5769502847B1F083248ADCC9
        97506619110AF3843D015070D989C3EB386F672AE1E503859AA2C82016880AFC
        504CD3028342A8CCF691A1D0AE6934730431806692FC5C1941D9F23F166C2E45
        865306859CB7A22A234249A7F56110468262BBE1701C1347BAA80ACCD855592C
        072811DCD471DCE405DC92DA458592C94B8A34D5F52D85A0F8B5A41428B83B24
        D294C9DB804A08E10A1994A9D714EE3F0E1B30A66736130EE5BE1BD437D12FDF
        5CA53A491B9D806CBB50205C26F34566AC10144DD3F945FAB77B2131ED329012
        202833A8501C61E8288168D284649A1245B7BA204E1D141C0EF71F9F1823FB8F
        C98022B42F0CBC793AE63CC66D0C31B8BCC1C2E45284802CE42796A8251489E5
        42B12C474BFC5AE124850C8E47043819754A3E754106D7353B824DA22F198ADB
        5C30D59522045569CA1C3D8E75CB475A69FE6332A0886B97A99B0F9E17BE6FB8
        777905DECD6DD34C6E4E30E01A5688244105D0AF08BE8D24244D33B2892273EE
        3C0D0FB8E7AC08112DBBEFA25A0BE6D638DA104D1A68BEF078C898B484FC8977
        BCB14099695766D76D67DFB3561A52CC2A054A04B775BC9F2ADD7F4C0614E1C1
        76B503CDD74F8FF633184421916816D79B508D50028A90074591D1CCC8D98219
        454E04C52F502ABB27F1D7813E894758AAC86046A50D0D150217BE8ED4A249D2
        2E345D21012A03122FAB1449288741519904F3AC2A585E1786A5F303503DCBCC
        BBA8049EB7E79C0E6F1D89C3A7F1180C5A7A2128DDD83BDE8B8FCD7F4C0614D8
        D8AECE47791C27416A26991372BC684EE8F98B98CDD23D28944F286AD6AF90D9
        2227EF41A19D2CD7915B782CCA4104109C7A96E8EC93D02C88266C0EBCA6D2D1
        12418051A12C35EBE1D6961A68B9C68440D82EE9FAFA0E2BF0F2AE38BCD6771E
        9266467B3A51AB3ADE898EDD7F4C0A146A8FAC560769C688FF6925D5C5725D0A
        098A2AB6AACFAF9096D836CB42816C39C62DB50FF3356426871206A434C77491
        464AAE3A168352692B707B45335CBB0203853A1F0C5905B1662608950DD9316A
        3160915EBEF49AA5E35DB74F86C73F3E0DC7B5C4961D0317EE3F260D0A86C5DB
        C0997F3562F3841D0CA91921526E92F97E942AB1CD9CA86B3066F240A02A2442
        C873F045A0D45941F86653332CB8CA0449750E2656D583D4B21CC48696A263B5
        877AC1EAD90D76E44C665BFF09197AF6043B561FDABFFDCB0085806C2B154A20
        E8E42B4EE1316BD3478362F2C7D48EE9A2C8BA2A287153E93D16C885421A726F
        780E2C6ECB82972F5F01F29C2B4BBE36ABEF241807DE4115758ED17F4A81139F
        04D621987139777FBB58505AA08499301E14325FE4230A278CFECFC3A168A825
        3174F0298D71075F11909DB09B158672973017AE5F867E0C23423255EAF25520
        D6CD70847DF41C88B36A4170B536B7D9A70669CA2588F59560C70640FFF075BC
        2B1C307DA7E5C8174702CB114C4FD94271C1EC810213E44682425A6259591B5F
        0C0A0FA52B6AA0BF7F9043213346A6AB024D57C6C1E74069D51BE1F717544155
        B5035DBDA61DC4A6D9C0D206A47FFE31A85F5D0BFA7F7642F01BD782101C9E3B
        69FFFE2148ADABC1ECDE03EAAAE92036D7028B0D82FEC11BC00C2752EC3912E8
        6A7DEFE09A728732AA5FF1A0C8543CC4B058D74C1E618D0AC52D3ED2F3F85882
        8182A136455D545611201F8A8261EF1F07E6C1C2398E6994162D0179E1120E44
        7B712F543DFE34484B9780F5E941883FBC110277B666C0682FED86C01F3E80DB
        7E0F58340AB17B3A40B9B111C41935609F3D0DC6EE5D7CBF785C84A347836B50
        5BBACA190ACDAE7C792C50FC05C891A038C54786BEC4C425D5B9DCDCC41F75F9
        A02CD1EBE1EE99D5100ADA20545783DABE9A0E005AE7A750F5C44F3810AF7130
        DF41086B9782FEDA0108DCF320079219870B46FE8D5A10A75783F1F18708C771
        FE274FAB9DCB3E3838EE993117130A3D081B1C1394943EEA337ADBCD59E229A7
        F8E8CD2D0B2862767A720E943BCD7970FD2CE760CA8A151865D5837D7200945B
        36807AEB57F2C6456062F7AC87D09F7E6F18103F98F8FD7F0072FB4260C914E8
        3B76F0ED835119BE38A7D6A1B68C2B5FB9A83303110C69CADA898462D9CE843F
        0A8369A25D28889A12726645E65690B9E9B2257810E6C3CC3A1D9D742D42B9C6
        D9074DA5B92B02E117B673ED2924F842DBA925FEE47B68FA0E83B4601A5F37F7
        1F04EB542F86E7027CD61B1A772476B1A1AC871142E30B81C27D49CA84489CF1
        C153F1914C9728FA80F8A04C372B60833403EA4398975CBD08A459D3B3C78C68
        601DD221FCFCB6A2000A02897E06E265D949952C1A0763A7535DD977AE620B42
        D95CCE50C88451685C5BE87B3F142AB7F042E42850A82C3684BE249E62A02AAE
        E992C561FBF9A12C467F72975C0395B205EA2DCBF1643266EC9520846B40A099
        356786C0DCDD57121847434E80DC3A179865610436042C91E0DFE96FECE676F5
        8BA4DAD9BA7F7C7EE5A24F6CF64761B6EFC194E05B12147A6EAFFBA07855DA0C
        3CBE2FE3B3356349939B309AA85D53210F2F72E64059A635C23A210C95A20DD2
        C266906FA4C82A346C8CF65904B3AB176A7EF5CBA2D791DCFC37609DDC0DF275
        0B867F61A219ECFE14CC3DC7F9EA494DED6A3B70605CA1F14587F288336F6C0F
        454C647A2C8BB9854867A238991D95431178486CB3EC0408D3DD17C0D9971482
        BE4BA62DA7C28B1BB8831786D7C3F2A0D80845C0ACFFB7AE06080640ACADE3DA
        E235FD3F7643B0636341A7EE351E953DB41194AF2DCB84CB2CAD011B1AC4651A
        CCAE03C0D0FC9E3411CAC13287024E39BFAB42B157A91266EC74A7A719F4C59D
        E7F4543D0E8568928308866639B3E50D1B5489812C3892A6B01753124CA81182
        2A650A96B20BD5835108CA1C230CF7A6A741B560817CC3221067BABE004D1769
        8CF1F6D15181E481B965119A2F9A17EB3E62486860FC7A2FFFFC991DDC7AD3A1
        4FC635157632A0483FF86DE189A00C0FE49AAE7E049332B87C78F4445A14C29B
        903A85BD048820EADC64017F3E531796F9EB0EDEAB14FE127D21285480DC109F
        0D4D608034BF09CDD7A2CCC0CC1D4720F8EDEF9604C40F26F6EDFB41699F0BE8
        CC9C6DFB4E82F9C9174053360E0AC14DE8E8B7963B14E5D1DB8437F1A65E4942
        A69B9C4FBA960ABC3AE17BEC4B0E3D9212381C9A2146EF989C4788F5B5222F3C
        4ABE97C3468242FDBED802B8C274B2F9C09D3780501502FBF420FA985510DAF4
        50C141A71E7B1282F7DD5BD0F91398C45F7E0713C8F97C5D7BF13D60F1344405
        094E4A2AD5C0C6F5A06B32A0C83FBC4DE842E9AC3C1111E18D1E05DAA69B70F5
        746BD83B2D5E29DEB29C6CFD7454805DBD2ACCAD346166C80234DF5C53A6D589
        98C18F0DCACA74337C3519000557A49626506E6DC3303685217115543DFD44DE
        8029CAB24EA039322A318FC98FCAB4175F02E3F55F6058DC04E647C7C0FCF818
        DFDE2B2B3D571D39387FBC029B0C28E25FDF2A3C89277A807CC947A765E8894A
        70EB653ACCAC7166BC78C2B36CC764D1B3F69DA7148869022C0EEBFCFD12F4A5
        80093C4C6F7467F78F010AE52ADF8CCD8426CBF101EADAEB419CDD00EC7C1425
        300B2A7FFCE83020F6D05190AE9CCDBFB70E468785CB0444FFD5CF32DFEB2FBF
        0F42431568672270480D8E3B47992C2802FA943F42FFFC0C69003D218CE90284
        830C6A82D947BADE6B0CF4D08AA07C3E2862366E03F97AF2A709345D0CB3F759
        4D6EB2380628D87BEE8E2F8C2C4D9B6D81798DC07A23A0DEBD1A849A10B07308
        86CDE0603890D8E7202D9D9D193C7D6F7D3AC8C1E8BF7E1DF4D7FED5F91EEDAB
        FEE24E10A894DF178353312D3220C9F3C75B62992C28B06185D0B4A8110EA38C
        6B4CDB2995F0D72744C761F3572B5C5F62F04912C0C11040325B949FC5D1D1D7
        360134D73B1330FC2F828D02A50B3FAEBB27B6B8A5DAB2F6B43463D2880E9A0D
        2641BDAB9D87B7F639CC53DEFD0CA4ABE682B4A8396FFC6C2809C61BFB33DF53
        7559FFB77740A8ABE0DF478F9E85CF0381713BF84985824D42BFB2054DD55F78
        02F34E6CB3E14028D2A227C234A98EC01090A118EEA762783B83A22F05BC04BE
        04285BFFF94323139EEEB8E2EA479A0CF3B1E6F98D206237771E05F5EB3781D8
        5453F2851020FDD58F405C388D0F36BEEB18F404D4CE95873F99B0F726270B0A
        9D47FAD1EF081FA3662CF384E74D7023ED314DF7A551DD799B97A0907644D1BA
        C4D17CCD418B515F2D63B8EC9B23561C4A04179BFEE903637BEE4010CCB6D99A
        BEBE7E4E3DC8372D02FB502F9AB13048ADF3516BD4112FC2FCE030D8E7316ABB
        7C0686C15F40E2086A4850EDB60461CD4498ADC986C2CF75DF0A61DA650DF03A
        9EF46A0F8A93B93B1A920142268B80C49C3CA601CDD6B45A89278FFE68AD0894
        1EECEB9EF920FF9FEAE88621998611EABEEDF647AB4E9D7EB8197D937A6D0BE6
        2FD3C0FAFC3C88E12ACCF4834EE2E4357A0D03EF0E164F80D8D288FE230EE69B
        07602869C0D9C6FAFFAEBBF3EB1B5A363DD42BCBB22149124C449BEC97FA856F
        5D2F3462D4B519A3A7073CB3C581188ED94AB9662B8640044C221B1A443E83DE
        F123D90A6511285D04E41FDF3786DDB586618AA6695469BA5EAF697A9DA669F5
        7DDB9E5BA5BFD4F9E0B4C8507D1D66AB2282115BB0CFCCAF9D32CC7229AF21ED
        D0E31A9CA9AC48A56F58F152F396BF7A5E0DA883C140604055D5014555A2AAA2
        9830CE3615FF6981D720EFB946B86246983DC46C58899AB29403D19C928AC904
        5055018201A7B6256526F18DF87ECAD67FD865E495376832206A48584B6B0DA9
        74BA319DD61A352D8D5D6B489FEE9D95FEE5ABEDF2AEF75BAB072315180840A5
        953F292F2D8AD8058856848C68EBB223EAED5F7B2B74E592638140A01F7B5F30
        18E80B0583FDB4541425825A53DACCBE3282E23F37E93B55F7D4F5D7290FA0BF
        F8117D4126CA335382CF5C158112C1CF9BFEFEBD7CFF9181A2EBD5694D6B4CA7
        D28D290E25D31B6849A0ACCF0ECD11BAF7CE12CF9C090B9A26B3EC7D609B2DF3
        A2307B56BFB0F2C6634117841F88D3837DC140B04F5595C12F3394DC71D03F69
        EB07DFB397D1A61831E79DCB753FD9698C58D6D0754346F3C5C1A0C6D43B664C
        AB4358D88D5A5CD6A0890BE33E61D3B282B665AB78260AD899280AE42BD228E8
        046A410CFB109AAA08F6C140807A60009703044BA16DAAAAC3385BB940E10DA1
        0C9B01330A1402B1E6E99D4649518F699A82695AAA81BEC5308C1A4337AAD1AC
        55E3F6B0699815A6655658961D44CD5218B325E63CD8A44AB6258AA2815D4330
        29599213B222C70910FA8F284152143926CB4A0A97AC94B18CD6CA0DCA7AF03D
        3E1E01CAF6A7DE353A2EF43C1C9065C91642B26CEC961DB06D0B3B5319633276
        11BB40B3365140B6200AA62838604449D450733459927449924D04312E5355A8
        951B9416F0CDAC2C02A503816CBF98E3B09DB967BC68208AE2388F36F6565650
        A82198CCCCCA1C2864A6D63CF98E5E76FFF371A25B3942C9FC931E1F14FAD71D
        0464C2B2E6726EE5082533B3D2F31F4FBCAD5FB0FFF832B6B283420DC1D0CCCA
        5AF21F0864FB548F67B25BB942D98C8BCEC7DFFABFEF3F0AB5B284F2FFBD5D82
        5286ED7F0126B097174B39083C0000000049454E44AE426082}
      OnClick = AEliminarAnimalExecute
    end
    object LEliminarAnimal: TLabel
      Left = 535
      Top = 76
      Width = 91
      Height = 16
      Cursor = crHandPoint
      Caption = 'Eliminar Animal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = AEliminarAnimalExecute
    end
    object ISalir: TImage
      Left = 928
      Top = 16
      Width = 46
      Height = 57
      Cursor = crHandPoint
      AutoSize = True
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
      OnClick = ACSalirExecute
    end
    object LSalir: TLabel
      Left = 935
      Top = 76
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
    object BitBtn3: TBitBtn
      Left = 1489
      Top = 8
      Width = 97
      Height = 25
      Action = ACSalir
      Anchors = [akTop, akRight]
      Caption = 'Salir'
      TabOrder = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000C6420000C6420000C6420000C6420000C6
        420000C6420000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000C6420000C6420000C6420000C6420000C6
        420000C6420000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000F7CEA500F7CEA500F7CEA500F7CEA500F7CE
        A500F7CEA50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000F7CEA500F7CEA500F7CEA500F7CEA500F7CE
        A500F7CEA50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000F7CEA500F7CEA500F7CEA500F7CEA500F7CE
        A500F7CEA50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000F7CEA500F7CEA500F7CEA500F7CEA500F7CE
        A500F7CEA50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000F7CEA500F7CEA500F7CEA500F7CEA500F7CE
        A500F7CEA50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000F7CEA500F7CEA500F7CEA500F7CEA500F7CE
        A500F7CEA50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000F7CEA500F7CEA500F7CEA500F7CEA500F7CE
        A500F7CEA50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000F7CEA500F7CEA500F7CEA500F7CEA500F7CE
        A500F7CEA50000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BBAyuda: TBitBtn
      Left = 5
      Top = 99
      Width = 30
      Height = 29
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
    object BitBtn1: TBitBtn
      Left = 416
      Top = 104
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 2
      Visible = False
      OnClick = BitBtn1Click
    end
    object BBXls: TBitBtn
      Left = 336
      Top = 99
      Width = 41
      Height = 29
      ParentShowHint = False
      
      TabOrder = 3
      OnClick = BBXlsClick
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
    object BBSalir: TBitBtn
      Left = 904
      Top = 99
      Width = 97
      Height = 29
      Action = ACSalir
      Anchors = [akTop, akRight]
      Caption = 'Salir'
      TabOrder = 4
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
    object BBImprimirListado: TBitBtn
      Left = 216
      Top = 99
      Width = 114
      Height = 29
      Action = AImprimirListado
      Caption = 'Vista Preliminar'
      TabOrder = 5
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
      Spacing = 10
    end
    object BBFichaAnimal: TBitBtn
      Left = 104
      Top = 99
      Width = 97
      Height = 29
      Action = AVerFicha
      Caption = 'Ver Ficha'
      TabOrder = 6
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F7F7EBEBEBEDEDEDF6F6F6FCFCFCFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E29C9C9C959595A4A4A4C3C3C3
        DADADAEBEBEBF4F4F4FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC9C9C9CECECEFF
        FFFFE9EAEBB6B7B79A9A9A959595A6A6A6C2C2C2DADADAEBEBEBF4F4F4FBFBFB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB
        FBAEAEAEEDEEEED2C1B3D9C9BBFDFAF5FFFFFFFFFFFFE7E9EAC2C2C2A3A4A493
        9393A3A3A3BFBFBFD8D8D8E9E9E9F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F3F39D9D9DFFFBF995AFB1838784C0B4ABE1D4C7DDCBB8EEE2
        D6FDF7F0FFFFFDFFFFFFE5E6E8C0C1C2A3A3A4959595B7B7B7F1F1F1FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E99C9C9CFFFFFF95BCC000A8CC717879
        BEBAB7EFE9E3F6F1EBEFE6DEDECDBDDCC9B7EFE4D9FDF6EEFFFEFCFFFFFFEEEE
        EED8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9B8B9B9FDF8F3D5
        CBC3468E8CBD915B846751A0968BDBCCBEEBE1D7E9DFD5EFE8E0F4EEE9ECE3DA
        DECEBEEFE6DCF0F1F1EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDBDBD
        BDDEDEDEF6F2EFEEE8E2D7B79ED29558CD8D52866B5AAAAAAAEBE7E3EBE2D9E6
        DBD0E7DCD1DECEBEE5D8CCFFFFFED1D1D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF8F8F8A8A8A8F0F0F1E7DFD6DDCFC2D9CBBDB5885CE1A669C07E427450
        39A6A099DACBBDE3D6CAF0EBE5EFE9E3E6DCD1FFFEFBC5C5C5FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF0F0F09B9C9CFAF8F5E3DAD0EAE5DFEAE4DEE1D8D0
        CC9967EBB072BC783D826B5EBBBBBAEAE3DCECE5DEDED0C3D9C7B7FFFFFFDADA
        DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4A8A8A8FAF8F6E6E0D9E0
        D6CDD4C3B2DED3C9C5A484DAA26BEEB273AF6E36766050B2A699E3D8CEE7DED6
        EDE7E1ECECECF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFECECECECBCC
        CCE6DED6D5C6B8E0D7CEE1D7CEE7E2DCE9E7E4CBA784E9B37DEAAD6BA6683387
        7F79D2D1CEE8E0D9E8DED5E3E3E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F9F9F9B5B5B5DDDDDCDED3C9E3DDD7E4DED9DBD0C5D8CCBFDDD3C9D0BFAEBB88
        56F1BC86E5A662975D2A83786FCCC1B7F0EDEAF6F6F6FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF2F2F2A1A1A1EEEEEDDED6CFDDD5CDD5C8BBCEBDABD9CEC3
        E5E0DBE4DFDBDBD2C9C99868F9C58FDC9A5593643A969697E6E5E4F0F0F0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E99E9E9EF3F0EECDBCACD6CABFDE
        D7D0DCD3CBDCD3CBDDD5CDD3C5B7D3C5B8C6AF98CD965FFAC58ECD8B44835A36
        A9ACAFE3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADAB8B8B8EBE8
        E5D8D0C7DBD4CDDCD4CDD0C0B2CCBAA9D7CDC2DDD5CEDDD6CEE4E2DFC7AF97DF
        A975F6C088C47F38816852C7C8C8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
        BFBFBFDADADBE2DFDDD4CBC0CDBFB0D4C9BED4C8BCD4C8BCDBD5CEDBD3CBD0C2
        B4D4C8BCD7CDC4B0855AEBB47EEEB77EB775307D7369DADADAFEFEFEFFFFFFFF
        FFFFFFFFFFF8F8F8AAAAAAE7E7E7D1C7BCD0C5B9D0C4B8DAD3CDDAD4CFD1C5B9
        CEC0B2D5CAC0D3C7BCD6CCC2DED8D3D6CFC8C0966DF8C38EE3AA6DA66A2A8884
        80E4E4E4FFFFFFFFFFFFFFFFFFFAFAFAACACACF2F2F2E1E2E2DCDAD8D3CAC1D0
        C5BACEC1B5C8B8A7D2C7BDDAD3CED7CEC6D4CAC0D6CDC4D0C4B7C1AD99C18F5C
        FAC693D89D5E9860289D9C9BF1F1F1FEFEFEFFFFFFFFFFFFC9C9C9DBDBDBDEDE
        DEEFEFEFECEDEEE1E3E4DEDFDFDBD9D7D8D2CCD3CAC0C7B6A5C6B4A2D2C8BED9
        D2CBDCD7D4D3C8BECE9C68FFC88FB88E5B476573E1E1E1FBFBFBFFFFFFFFFFFF
        FFFFFFFEFEFEEEEEEED4D4D4CFCFCFE7E7E7EDEDEDE4E4E4DFDFE0DEDFE0DFE0
        E2DBD9D7D7D2CDD1C7BCCEC2B7F5F6F7ECDDCFA6A69277E5F34C8CA7F6F6F6FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FCFCFCF4F4F4EBEBEBE4E4E4DFDFE0DEDFE1DDDFE0FDFEFFFFFFFFCAD0D496BD
        C5F1F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF7F7F7EFEFEFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object BBEliminarAnimal: TBitBtn
      Left = 512
      Top = 99
      Width = 129
      Height = 29
      Action = AEliminarAnimal
      Caption = 'Eliminar Animal...'
      TabOrder = 7
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA
        BCBCBFBFBFC1BFBFC2BFBFC2BFBFC2BFBFC2BFBFC2BFBFC2BFBFC2BFBFC2BFBF
        C2BFBFC2BFBFC2BFBFC2BFBFC2BFBFC2BFBFC2BFBFC2BFBFC2BCBCBFDFDFDFFD
        FDFDE7E7E832349B0007B50008B2000AB5000BB8000DBA000DBC000FBE000FBF
        0010C00010C00010C00010C00010C0000FBF000EBE000DBC000BBA000AB80009
        B50007B936389CC8C8CFDCDCDF222DB40A23D20924CF0927D10929D3092BD509
        2DD6092ED7092FD80930D90931D90931D90930D90930D8092FD7092DD6092CD5
        092AD40927D20925D00A24D21C26B7ADADC0DDDDE0283FBE4368EC476CE9476F
        EB4771ED4774EF4775F04777F24778F34779F44779F44779F34778F34777F247
        76F14774EF4772EE476FEC476DEA476AE74A6CEA3241C1B0B0C2DDDDE02B42C1
        2050EA1E50E81E55EB1E58EE1E5CF11E5EF31E61F51E62F61E63F71E63F81E63
        F71E62F61E60F51E5EF31E5BF11E58EE1E54EA1E50E71E4BE3204AE42235C1B0
        B0C3DCDCDF3446C14668E94266E64269E9426CEB426FED4270EF4272F04273F1
        4274F24274F24274F24273F14272F04270EF426EED426CEB4269E84265E54262
        E34663E42B3CC3AEAEC2E7E7E92F3FBE6B81EA7086E86F88EA6F8AEC6F8CED6F
        8DEF6F8EF06F8FF06F90F16F90F16F90F16F8FF06F8EF06F8DEE6F8CED6F8AEC
        6F88EA6F85E86F83E67283E83E4DC5C2C2D0FDFDFD969ACD6978E56C7DE36B80
        E56B83E86B86EA6B89EC6B8AEE6B8CEF6B8EF16B8EF16B8FF16B8FF16B8EF16B
        8DF06B8BEE6B89ED6B87EB6B84E96B81E76C7FEAA2A8D0F5F5F6FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Spacing = 10
    end
    object PListados: TPanel
      Left = 448
      Top = 8
      Width = 250
      Height = 90
      TabOrder = 8
      Visible = False
      object IListadoAnimales: TImage
        Left = 1
        Top = 1
        Width = 248
        Height = 88
        Align = alClient
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000013700
          0000670802000000EAB99226000000097048597300000B1300000B1301009A9C
          180000000467414D410000B18E7CFB519300002B944944415478DAED7D0963DC
          C6912EBA7103730F0F9D3E1227BFFFC5D95D27D95C6FDFAEEDD8B193AC93EC6E
          6CEB3E299273613038BA8157550D60C043126F46D9FE448D28890486687CF8EA
          EA2AF6ABCF7F61D7B06CCBB4B849E09C33C60C0D0D8DCB445996CD2700296551
          140221452EF2348717F69B2F7EE538B643B02C642937B966A986C6D5E0104B0B
          89BFA410792EF32CCFB20CB8CA7EFBFB5F828ABAAE8B2C452DAD84B462A9E6A9
          86C615A0449616048924059A8A2CCB73FC0D5AFA7BB0781D97F414580AE096E2
          28BE5CF77BD7D0F80787B258154595C55BB114788A2C453965BFFEF2174A4B95
          6B6ADAA8A58C33C5526DF46A685C018E65A9C8404E494B81A5CA29ADA347A68E
          1E69685C195EABA539B8A6A8A5154B819F354B6D62E93A7AA489AAA171054096
          D22F0A1DE12F60E95A4B7FF5C5CF558CB7A5A5ED18AF66A986C62542E960A968
          5A508C97788A1918E59566C8D29F355A0A3C557E6913E3D55AAAA1710528AB3C
          8C51B1142D5EB476D334452DFDE5EF3EB12B2D7574558386C615A3D1D2A2304A
          D252B18EF1665526E65FBFF8A4E597A296F25A4CB5966A685C0D4A03CDDD5296
          B2D25229297844166F7698A5DCE2DAE2D5D0B86294350EE44BC1DA4DD137653F
          FBEC9F80A22A5F8AA123ED975E2BCAD6E7ED4B0FA690C000209A43F85A14B22C
          19FE3B82190C960BBE19968B4A3C39ACA4FAC46C95A6BCEEE01AD78E86A5EDDA
          2324684A5AAA59FA7702A4109574AA6B0EB4CC6591E4F92ACFE135C5B03CF094
          A2F5C4364615A08C3E4383897ED1A7F801AB67320E1E8C635ABEE304B0C46031
          D1D2AECFA557F7EF066D9656691855D550B3F4A79489711BBF9448AAF3A55784
          43E404A98CF33C4AD3659A023F61CDE0BF412A4D2AD7C435318E5915C55BAADB
          A6DF44E5825C1D49FE0EFC2FAC2BD0B5E3BA1DCF03D2C23A2B2956A7D6CB7CBD
          A819BAB67865557B942B967E8C5A0A2C75484B2D135D53CDD24BC621E3138CD8
          38CBA6ABD5224D40365949862B636A19EA9550AB41BFABC06075B0B2AC5E4BF5
          4A2F45597D8E15DC0658CBA5C008220A2E3C927B9E3F0C7C202DD095C85DAE8F
          AE71E56884546929254CA9E05E69E9279FFE04F859B314B4943231354BF5A25D
          381A6629D2811D3B4B92FD388EB314D4D2E61C56808AA819F1135781ABA725BD
          C0B71746B3DFA962A6D1E2274969FD70AEE415FF28AAB4B9010E6D4E9E2D1C0E
          583A0AC25110048E6D6869BD0E288E558B058F51B56F8DFC52B5BF14A347FFF2
          F9C72AC65BEF5CD331DE4B44E310C29FE06DEEC7CBFD659C4BE170EEA019B3D6
          4F562D80D1BC30E2A7443D2CE49A8968D9D2AF8A8D0718ACFEB1FE2FBA15145D
          4B89025E0A14D7D2B3ACCD4EB8D9E900699519AC17FE8A7134C69BD71582F039
          FBE7CF7EB2AE3D720EEF2FD58B7551689BB8A9C8F796F15E14C173131882E60B
          E72A24CB5AD7BDACAF3D692C5839169843AB3C8D659E83055B56CEE75A4E411E
          8564EAC1CC58C931F45BC596CAEA4D948662297EA28E60206FB1E2C533ADAD6E
          67BBDBED384E6303EBE5BF1A1C9389C9A9485055DB7FF2D9C7166D30B5287A64
          E9DAA34B801235B89E6067EE2D973B8B05B0C2354D157405FFC2AA9F8BCAC528
          559A9BD6CC90C064A7EFF702D7877F992CE7AFA2C9B294393350186BCD043BC9
          29CA9B61BFE306603C2FD278992519B08FF3D2E4B5236B506C58096F5B7E89CB
          E416F99675B3D7BDD1EDBA96A545F5CAF09A7C695D6DFF3362A9AD597A3968F8
          090B304F9317F3F9324D3DD374AB2B4DA1BA3A74ABFC4AAAE5C4CE3785901633
          BB5ED8F53B60EAC0972459B6BB98EE26D1CA2832AC54A96C5D3C4F2E7AA675AB
          BF0947CE69131418D271BA5AA6F10A2C274CA45A256B72A76BD256EFB07EBF2A
          F0D473DDBB83C13808E09D69AE5E01DEC252F04B2DB278354B2F1C0D4573295F
          2E16BBD102DC4E30711DB3DE7AA462442A260466A741750BD8F146B8A89F5DDF
          F5819C9914700458C25596EEC5914011351652509E46811922F7181F863D1F16
          D3C45300EFE168F08D71962C561148AB041BD824AE562B5BBFD6112D7A549032
          17D264C6CD5EEF4EBFEFD5A26AE808F0A5E1752CADEA787FFABB8F0FEC89D12C
          BD209475BC7499654FA7D3384DC098B41545EB089D61348E6221CA4215583BCC
          1A86FDD00B0AA46596807752942EAC0CE3AF927837893BA6092C9AE679D3D80A
          CF23052F64CF0F37BAFD81EFDB16A3709191CB22CD6522F2385BCDE2C52ACF4A
          20307015838B6C4DD4EAB5F25F55D811CCF2A1E7BD3F1AC201D54FC4F52D7139
          38DE2FC54D3158DFA0597A2928552017DCC8387E369B020903DC626FA2B15277
          ACA9F4B3207E164596A6A59003BF37EA0E8040CB2C058A0251C182F5C8C64985
          FC7E3A83C7EBC8B2E659B61479EB84A08105C8A96FDB3707E38D6EE03916BD0D
          839C5B387099E4028E395B468B04D4B82C2D9B0CE09AAB87D61AC553B9AAE83F
          BF371880B3AAEC766DFD5E06DEC2D28F3F6FC7786D4B6762CE87C6CA057ABC5A
          2C5ECC6716673E955FDA64E82A092D94710B166921C128CD92D436F81630D40F
          13AA3D1218FEB54317A49781F801DF76A2D5BDD9ACC74DC730F6D2242F0BD60A
          1DE33A496196C5566F787300526C93A35BA924BC192190ABCB34DB5F46D3E53C
          93B961DB25B794E2D7BADA5EEE5299C2F02481777CABD7BB3BE8C3BBD16EEA65
          E058968A0C898A2CFDC9E7FFA7ADA596D5143554E9BAEB7EFFEF12DAB15CE0E7
          6E147996E9938AE295A56BAA52204042E4274828AC4592869673B3BF096B1025
          2918A5F0955DCF75A8BE411162958B47B3686FB5DAB0AC95C8675976D849C444
          67C144D6F7C3BBE38D5EE098475A4062484914595EEC45D1EE62BA12A9611151
          1B393DE0AFE20FC34854A978A9B8D9E9BC3F1CE8D8EF05A3EE7B541EE97BB466
          E93F7FF671BD0BDC3675F4E87C286B8A8295BBB78C02DBC67428A928C0201A8B
          12C41325340309C5E292B4E7F8B7069B70C1E749924B11386EE8C24A30BE0EEB
          94D324FB7E322FA5E8997C02C6B104216514DFADD708FF0EECCF7DD37C7F636B
          10FAAE6D9687C4B1AE465C6562B25CBD9C4D567902442D4CEBA0E97BE89B542D
          22562E6D87E187A3A18A27691FF562D0EAA872A4D327DC1E48539D89B918B455
          F4E96C3A892390508FC245361515C1FF4BA3141474CDE823C5205E3A70FCDBC3
          2DF8C679B2828769D7F77CAC4262CD61E133F8AE9D28B93F9B87CCB08C7242FE
          2AFDFF113995C22A8BDB838DAD7E2770ED63DFA72A7B58A6F92C4E9E4FF781A8
          E8A336F1A4CA596D1F1CC3509CBC54B07E6F743A1F0C079E56D40B85CE975E05
          1A3A3D9FCFF6960BDFB43C2CE5C2911E0D45919F20A142A6485199A7C9C0F6EE
          8CB63833E7E90A0ED1F7C1CC452BF7D0C113219FCD97CFA3A8C73988F0226FE2
          46ECE09F604F4B26F28D4EEFF67004AEE9D143ADDF7069C469BEBF8C5F0051D1
          F4754AD3AC933487C2BF959CF2AAD39DBCD9EDFC6038B4C947D58A7A21D02CBD
          7454E98BB27CB998C387679A3EF9F88D8A8AB2401794F413290A166F92744DFB
          BDD1365CF4055294F503CFB56933F7C123C3DF9759FE70164D5631B034162291
          92FEB3F595ACF9035CD3BCEBB860F4763CACF83CFE0D5711E8324AF2DD68F972
          B69F4961D84EC9CD722DA7AC16D5FA7BC84D35684BDC7BFDDE7BFDBE8A84E9BB
          E4FCD02CBD5C34A6E77EBC7C329D588C050E4674414839479248A228F253A928
          50344BBDD2787FB41DB87E942670E7BF81A2F03A5BA5F7668B2C4B03C6222132
          DCCED2FE4A56BD07F56F220B4CEBEE687310789E63BEE16D2B1F1588FA7C36DF
          8BA6483E0B896AB44CDF83B700150863D0573A9C7D381C82F5ABAB1D2E046FAB
          3DFAEC27AAF6C8C60092DE13733A34148DD2F4D174BF902254655C4A4519A868
          A91CD1A4A6A8C87353E4B7FBE3716710C33AC8020C5DCFE1FC35D62958957B71
          726F3A079FD38513C10A520B95FA0D1C5054CAC7E4F065B7061B1BDD8EEFBCE9
          51AB1415DEDE2CCE9E4C26511295262F4C070DE7DAF4ADE2FC2A0CA9C26320D7
          743385B6F5D16834F2FDE35C648DD3E1357B62B0F48862BCCDCEB54A4BF52EF0
          53A0AC0B0081A28B24EED8AA7109B86C2844B493135D50A068421485EB6FA4E9
          46D0B93DDC042736C9F3AEEF05AEF9060712BEECD532B93F9DD96561828D2A05
          D607AED7E5806B8ADA2B8553165BDDE18D7EDF7FE3911BAC32B07B9367B3BD34
          6F72335CC9698BA5EBED71A0A68C2A93367D1F880AE6BD7650CF89660245D3F7
          881A08AA3D31827DF2F9C7873A7D6A2D3D219A78E9CB68F17C3EF5D11DAD86C0
          C2756B289A12451350D1429659D6E1E67BE36DD0DB659A05AE0DDE6313D13DF6
          F8B92C5E46F1C3F9DCC19ECA658C6DC98CC389CD35671986790BB911F66E0D86
          C052DB7CFBE03CB83B16ABECE97CB1B798E266B8CA41E564F0F2A64984DA0087
          DB01E0D9447BE680AEEFF707E8A0B62A2834CE80E3AB1AD63BD73EFD89EE4E76
          063466DE224D1E4EF6E0E6EED895AD0B0A047247E122012ABA1264E8C2935208
          0B6CDDC1C6A8D38BF3CC64BCEFC3D391BFE114D8CC4116CF17CB47F3B94B057B
          49515456EED1A5511E62214D294641E7D66014BAE01E9F68BC6526E47E9C3E98
          EEA769CC80A275FD60AB9D4BB59F4EED5125A2A283EA9BD68FC6E3B1B67BCF87
          BA3719CD8969553554BBC0B1A34A3D1951B3F4E4A8532FF2C96C3A8D97A16D7B
          14D70567016824CA22AB0DDD158EFD00192CCA2C1D79FE9DD1366D2B93947761
          6F3014D529E0204FE7CBA7D1A262A9A249DBE23D70002013B0341F7AE1CDC1A8
          E3DAAE7DD221B48B247BB658BE984F782991A51846E2D810CD5817A1290D6D58
          4A5B608BED30F8E168ECEAC4CC39F0BA0AC18AA53FFBECE3032CD57EE909D0E8
          C6641583476A312350B62EDCD98C63DEA5A1A8C03240F4E5F21C4CD6BBC3CD0E
          56EA6681E304AEF53A5BB7390BA3DAC027C4528FF685674571B83CE860BC57B1
          74E005377BA38EEF78276629A83DC8E9BDC904E414B7955A36B57A686E0392D3
          164BAB8FA2B00CF6D1687CA3D3D1750EE7415163DD9D8C588ADDC97EFEF94F0F
          B294F35626465FF363517B8CF2611334C232231BECC3A276475775C40848CA80
          5A793AF6C35BC34D893433FABEEBBC8D3F2A06DBB0D4A112B25C75E17D8D9612
          930A2EB3811BDCE80D7BBEE3DAE6C9D7304AF327F3E8C5620A3673695925B714
          4BE9B5AABE2F59A1DAB7A87012A37D3D9B7E0076AF6759DA3B3D2DDAF34B0952
          54E1A3039D3EFF097CA39AA5550FC196C57BDD3FC4DF25CAB590EE815D08C2E8
          D0809D9214490575572AA85B14AABC16ECD5BBC3ADC0F3C182E9780E15C3BFE5
          E21E62A945011B519665A3A5EB5465537C847B58B8C8866EB0DD1B76514B4FC1
          5294D3657A6F5ACBA9691B9C6248C4D5526D93512CA55E2EF0A2EC5EC7E01F8D
          46DB9D8E66E9D95077FAA4AED9A2EEC79B8B93F4B637344B8FA229067C3C9B4C
          E2A843C3EAEC3AAE9B89425134A15111D85601D8956720A437071BF00560AC00
          796CEBED57B66DF13E59CC2DB4330D59D9DB874A6DD9FADF0AD4D291176E7507
          F038C04CEC69567191668F67CB97D1D42A446992775ACBA9C18EB0B454728ADB
          F06E849D1F8E468E696AA29E014D9347B99E8CA8597A0E947568F7FE64CF2864
          E850BB716E82AE088942BAA21A067447553B4E811EE91DF048BD008CE4AEE77A
          EE8998D38E1E3D5ECC792959C5D243315E7620235316A6C8477EB8D9E97789A5
          A7B288E01DBE4239DD9759D2F24EABDCA92A11845783C93A81CA38BC2B5184A6
          F9E3F1C69082BDFAAE392DEAE09121EB29C395C5AB58FAF3CFFE05F3A52E453F
          70E69AA563BC6F055CCE17D1FCF962EA712CD9056F1EEE625994992C54C4282B
          D0D6AD02A1793A70FDDBC34DB87BE1D2763DDB3E597644DDEE40FBE78BE5C3F9
          DC288451B5173CB811B425AAC45269897C1C74363AFD8E7B3A96AAA8D87C953E
          982D26CBB9099640D527A9222AED372DB12491A9D118069629614C09AD86F77A
          FDF7FA031DE63D25EAFDA5E5E1FDA5982C55F9D25F7CFE8962A94D2C35354B4F
          804C8A0793BD285D85D40A0CAE575132E5912A7794E62E51EBB0429852DCEC8D
          86610FBE004C50DF354F781F37550D2FA2F8C16C2A45669074196F6029A3DA23
          29B63AFD51D80D1CFBB45A6AA07A8BE78BF8D16CC2E08CD828B4212AEDBA5136
          6E455466C107560D6293FEA1E7FF683486C7D675AFCFBB87D77654512C3D767E
          A98EF1BE1960EEDEDB7F057A1952A3718EDDFAB0FC80B22F4556503BEB829409
          6BDF4D1052F05D39766070DE1ADA3D04ACE35D26F767B365B2E4705C72148F34
          5560EB0A41917638BFD51F078EEB3BD6A962BC86511501EEC7C977936992C61C
          E5D426BDAC7B70375ACAB09CD866DC2596C2130A5CEE8F46E371105CF7FABC7B
          682A04DBD5F6A2A9B6D72C3D2DE03EDE89E68F67FB2EE360BD6268B734403C53
          646991E2A40F9A29AAEA5D45360EBA5BFD21DCDD203281679DA4B0B67D2EB573
          EDC93C7A369FF14234B57BF4FF478A90E08C79B61D849B5DB03C79E09E85A5B4
          79207B3C8B5E443313634870C67A471B960CB658CA185C04DF3019FCF860E7CB
          E2FDC1F04EBFAF6F9AD342B3F48221CBE2D174B2BB9C07383C028414CC5D2343
          96D2AE34499308551FEA42D84571B33FEEFA015C4930774FCB190538E6ABE5EA
          FBC9448A14FB9E3173CDD243FBC6A4704B79BB370C5C1FD6EF0CD2DDA482C1CC
          BE3F9D82538D676C3688AB2224A02871154EE1733340968229219779BE15763E
          1C8E6CD33CD549354ECA5235CD49B1B49E5872BA05FE5F8244E4F7C9290DF07A
          9914372273976C5D455295FF2F45DEB1ACDB834DCBC2EDA61D0F0B084F7B3A15
          D199AED2FB93D96C1571A3367A0DE3401192EA8394A77DCB027317D6CEB5ACF0
          F5A5FC6F068EBA88D37BB359B48A2C3A63510929AB8C5E6229D80501B74266F2
          8265422EB2ACE3BA1F81CD6B3BD7BD4AEF1E8AA278BB5FAA597A42500E663715
          39B014AE9281712310D2126C5D51543100951101E3731C76377B43F8B2D0B5BD
          13C78DDA68654DA3A7F319031314BC44DA5F7E90A55867CF45B6E577363A3DF8
          3B50D477CC3358436BA3771E3D5FCCAC52C219E9D1506B29278B97E390D58E69
          7598C5317A24E7790E37CE8FC61B7DCFBBEE557AF7F02696FEE2CB9FE97EBCA7
          C27EBC04961665E19B38BB85A2BB65829D75D5756ECC5D6916F2667FD40B3A70
          413B9E0DE6EE994F4A0DCA56F726533083F0D8A67928D28BD15D213C65EE3A1E
          9DF1D4E66E1BE067626C793A31446628A3D738A0A5F08002A7BC075ACA6D3088
          71106B9AC9B2FC68BCB11186D7BD4AEF18F0A6C16619EBAA869C5059BCBF6CB3
          D4D62C7D3B76960BB07859597AD820934B744A0BB83D71A6280D005689446CBA
          C9F9CDC1868F03EDCE68EE2AAC8DDEE96CBA5A5646EFD1D64460EE9A163C174C
          CAE286A78C54B54FC7A869F0DE72F5DD649A662B13BB9E51008976C828731758
          EA98BC6F3A1D6EB15259BC698201A4C1ED5EFFBA57E91DC3312C1528A4C85291
          B35F7DD1B0547554319BE22343B3F4383C994F1FCDF6E1EAB8441551187951E6
          859A058ABF893A6599677DD7BF3118C3150D9D53A4498FA21DE97D1ACD19457A
          5B2D390D4315D9E7D956108EC21E98B9A1EB9CCDDC6D9F7196A4F7A6F349BC30
          4B9AB008676C588A7F639E690E2C07B414C415EEA6459A2D65FE7E7F74A7AF59
          7A52A815AADBF1B62B04494B5362E9AFBFFC455B4BF5CEB5B7E2D174FFE16C02
          0CB019E560F043F52557139CA8181EDBCC63C7CD71B76F738BEA69CF6EEEB6CA
          1B96F76760F4668CF103F9186AD16017E25677D0717DDB34DFD040F04467A442
          7F782E3C9E2F9E2D280384638BEB30AF62A9C942D322963A06B1749EA60B91BF
          D71FBC37185EF72ABD6368775411AAD6BE9E130382BA66A98A1E555AAA7B08BE
          1E8F67937B933DB8612DCA944ADC62691465334B94582AA555C8EDDEB01774C1
          1DEDB8CE09AB028F85626941C506F7A6B3088B0D8C2A9C832045CDB390F35BBD
          21AC2299BBF6D9CCDDF619C1887DB6583E984D0D99A26B5A85796938392FE11E
          E958C05237E0367C439AE7C8D23CBFD9EDFD6034BEEE557A67D0EC5C6B9A1EB5
          A347955F7A584B6D53E74BDF8CC7D3C977FBAF40CD4C1034B543441194286A54
          2DC2728FB1EDFE3874FDC0B900CEA8C3CE93ECE16C0E8E319604715315F4AA96
          448648478EB7D51D60DCD573CF63EE1AAD7D3FAFA2F8BBE954E40999D45CB9A6
          585FCF0DCBE23DCB1E5AAEC76DF0A9923C439666C4D2B166E9E9706CBE148554
          B3F46C78349D7CBFFF0A186292C55B368354E8CFEA8B44165AF6566F14BA5EE8
          DABE6B9DB306BDC9C73C5B440F9B7C4CD59A887A1D896C3BEC0D820E99BBCE79
          E2C9C641F5FE6E325DA6B1C9C088E7E873234B0DC3345C704A6DA76FB92EB70B
          59004BC18F8DF2EC566FF0C16874DDABF48EE1442C553BD768AA89D550541BBD
          C7E2C1FEDE83C91ECDCDE66A7FE57A3E61A5A554CF60DB9BBD51D7F53107E39C
          603BE90900E2F6328ABF9F4C84CC0FCC7491C2C1C11043704A5DDBA2BE841790
          EB861F6612AFBE9FCEE6C9126B1BD0E8C51D6C20A4F0880A2C60A9DBB35CF0CF
          A52C5619686912E5F9DDC1E8EE60705DABF38EE27896AA7C6996B3DFFCFE5FA9
          B5BD8BC952ECC78B850D9487D1550DC7E3E96CFAFDEE2B200CC74664ED7DD80D
          594B43E43DC7DDE80EFBBE1FB8E7CA94B651D5C14FA751BA329133F54C17724A
          6FF6469E6DAB8E4A6F6D04F19613D5B1C7C90A3DE1D96A6962404CB114849455
          4EA9ED7688A5704BC5590A5A1A4B71B73FBCA3597A62B43BAA1CAE6AC8AB644C
          CD52D76D478F74BEF40D78B9987FB7B39348C195675836DBC7EA9B1B23BF59CF
          F53681A5411060BBCD0B6069931DB93F9DEFC6AA70AF7E8CE6D9C071C129752D
          9BF6945A17B56E5364E97C8A7582C0524392C50B2C752CDEB7ED81E50596C30D
          9EE7629926B32449CBE283D1F846B7771D2BF30EE3D84E9FEBE811B0D4A9410D
          9F5BFB4BB5C17B1C26F1F26F2F5F465956B1D438CAD202B51458DA1B0D484BCF
          13E06DA00E1EE7F9E359F46431E36541A322D0BE06966C50A6D4C3DADDF33AA5
          EDD3D14361B617470E2BA4412C051137996F5943DBE9D9AEC71DDCAA9EE75192
          CCD204BEE6A3F1E648D71E9D1298C1A33DC987F3A5AA87609BA564F0B6778193
          0BA27110519A7CBBF3722F5E9AD881B64E5A56CF33F24B494BBB0EB274885A6A
          9FA4C1FC5B5137D196CF1611EE562905750CE3B4D15C6E77FA7D3FA41C8C7321
          A753982638FC627FB52496C229296806E6AE0D2CF53AE02A710B6E2F704A9749
          324956E038FD60BCD9D375BCA70485218BBAA8A1AA10CC1A96FEDFDFFFFAA0C5
          CB89A43AC6FB5AA4427CB7F312EC5EA3D1D2FA2AD5EE5CC1F2BCE338C0D27118
          061E48E985B1940A7AE3EFA7935C64382C9CF15208C7286F50E82874C1293D57
          D6E7E00F52FBA549ECB24218458E2CE560C0A3B9EB7881E9A0532A2538A55192
          4ED3A4E7FB3F1C6F7ABA5DC329D1E44B29658A650DF53427B479354B4F0D78E2
          3DDCDF7DB0B747E94ADE74216A8D6028AB4C4C7FB4D1E96277EC8B63298D60C3
          F2DA65B6B20CF4128B3CF7B9B98D2CF540487DE7BC599FE65C4D8C7799AE80A5
          29A83637E0F6086C8C1BA1B96B82538A75F6719ACC9364916537FA83F7872353
          C71D4F89D7B394A247FFF6D56F9A4C8CADA7399D0C3B8BF9DF765EA652828B46
          DD8D0E745B64C452DF34B77AE3CD6E37742F2C2FD2E8DBF793E93459DA54D70F
          2CED5ACE667710BA1E95225E4CD6C7A05B670FF3A59354A4C0D20458CA0C10D2
          2E096908770D99BBE0942ED3046C63B0C63F1C6F6EF774E8E8D4D02CBD782C92
          E46F3B2FF6E315BAA6EDF9F6A4A9F822729731B078B7BBBD10DBAE5C4C38C7A8
          2A9030A2B313478E0A3AE479CFF5373BC052F7FCF50CCDB9946EBF8AE26FC107
          9699C3CBB89425A649AD9EE3F46C8CEE5A64EEAED26C9925D3D5CAB2AC8F36B7
          7A9E7F8D4BF3EEE2B8FDA5F5040ACDD2332097F2FBDD9DA7D329660FA9A5FDE1
          A6B832B7CB72A333000B10F7795E4426C668F66767D9A3E9FC59B4B00C8983CF
          04CE6E1A77E0442EE8F605667DC0077EB158DE9B4DED528065BDC46DAD1C28DA
          B7DD10CD5D2CDFCDD1DC4DA33499A5E928EC7CB8B1E1E0863E8D53E34D2CFD7F
          5FFFF6004BCDAAEF91A95BD7BC11CFE7B36FC1E8A5DA8683835B0885B0A41C86
          BDDB8351D7C729321772D2563266F1783133B18F766108310ABAA3B0D7F5BC8B
          B5AE53219F2E160F67B30E9CC9286256F896D5779CAEED0654CC50E0A0E40C58
          0A4EE94A8A0F461B37FBBA9EE17458573590CD2BD75386295F9ABE8DA55A488F
          05ED2065519A82D1BB17C7BC327AD7DC50ADAB39A64C833BA3CDBEEFFACEC5C4
          3CD5E8F14488A7F3E8FE6C6A9602F323528E83DEA8032C052D75CE1FE0355A3B
          5A1F4CE7AFE245CF620918F1CCE8D9765F79A4D4A7026EA6559AA2539AA67003
          81B9DB713DDDDBFE5438507B54E54BC92F0592365AFAEF5FFD56550862BA9466
          2998EB7DE03A52770C1455B093E0FEFEBDBD57585B70584EA9053C06906C60E9
          B81302792EE6D495C4552CE5C052991BB2D8E8F441B77BA4A5E7AC0D6C9F68BA
          C252FB559E742D161B82713670DCAEE3F9E491AAB8519C26E0A547797E6B30BC
          4BD15DF514BBB6E579F7C0D64DB3154F9B7C699AA729D51E7D4A2C75EA4C8C9A
          40A159FA66A81B71BA8AFF67E705F86326B730D2BBEE1546ED1A4406027AB33F
          DEEEF741E52EC430690A1B9ECFA3EF67135608060A5714E0948E3B5DB0780360
          E905A56124868E96DF4E260E1ABA465C4A3277BD808414C3D852ACB214CCDD69
          9230CE7FBC75A3EF075A48CF868331DE8AA5AAD3276AE9A75FFF5B65F1B6EB78
          4D6CFFA159FA3AA8BDA4E0483CD8DBBDB7BF87FB44382F0F0C292C7921B8048F
          B1776734EEFBFE05BA8B587E445ACA0A10D29C49C552D052DC1173512C25BB7A
          F1683E1B3A703794F030E8D84EC746213519879B492560A2245DE4D9766FF0C1
          78C3D2427A0E1CDB4330535AFA1F7FF8F7B65F6AE918EFC9D092D397B334E1D4
          88A86C7D01A38188A1EDBC37DA1A75C20B714D5B2C5DA05F5A8852E46521C7E1
          60A3DB570EF03997ACF911E649FADD6412E7E9A66B09433293756D14529B5B14
          DACDD123C57D30093CD36B21551BF7F43D73161C62A98A1EA52A7AA4597A3654
          AD194AE3D164FFDEFE2ED88795778AA86B7AC1E82DCBEDDEF0E660D8F3BD8B52
          39F24B170FE653BB94C0D24216A3B0B7D91D204B5DE79CE7505E775E143B8BE8
          BBD90C3CD2BEC3D3B2F06C9BCA18306804B75192672BECCC902EF3FCCE707467
          A03DD2F3E24D2CFDAC61A9AAB66F584ADBC0F5257F03D44D1967D9FFBC7AB9B3
          8C4CD3A2092AD5446EBC5F0B618A3CB0BDBB18430AE046571C38FB19EB18EF93
          F9E2E17CEA1B85C431976210F4C0E6ECFBE0979E8BA5EBC28934BD3799CEB2F4
          56E070DC7D63840ED6032A5B37CBC1234DA234852F0B3CEFC79BDB81E36A8A9E
          11EA7E386E177896D5D1A3CFFFF81FEB3A5E9A608A39185EA9A98E05BC018D81
          B7132DFE7BE7C54A4ABE965383FEAB642237CB72A33BB83D180E02FF3C72DA50
          081324B3D9CB68D101775188244B7B7E7883F6DF84DE7959AA86C43C5F44F7E6
          B391630F5D2B2B25DC19BEE56237B6A2C4A0519AC6593ACF5251941F6D6E6F75
          7BDAD63D33AAEE01EB4E9F6B2DCD9AFDA5BFFBD3A74D0F41DB3EB4734D5BBC6F
          411346BABFBF777F7FB7ACB232C63AD85B4843E48EE5DC198CB7BADDAEE7B68A
          F24F7BAEEA1B27ABD5B793C92A4BFB9C2D4516A74960B937FAA34D3AFE797AF0
          D21FE56495C0F1E1B6B9157AD434C6F02D87DC51A06865EB4659B6C8B3DB83D1
          07A30D6DEB9E1FC7C67801698A1999432CB5354B4F0BA0285CA9559E7FBBBBF3
          7C31A76EE3BC4D542E73F0395CC7BF3B186D75C2C0714A6A777BDA2B5B091D56
          ED2D80451DCE3C664C72745C6CC31885FDDBC311C8F599F7A334E3611ECD66FB
          E9EA7618F83607AFD7316D07879DE3307945D198DA05F6831084D4B71D7505AE
          7B1DDE6DBC9EA5E9512DD52C3D3554AF6CB858B364050EEAFE2A060715BB28D4
          2D91C03DE522075EDAAEFF617FB8D5C1E661A7256A23A45869309DCCD3E486E3
          AC440E2C2DB143B7F06C17E49AB6E0D053C038DD734079BC71963F5B2C5E2E97
          5B8137F41DA028FC5C4451061405DB0B0CDD1551D4B19D1F6D6EF7FDA02869B2
          A916D2F3E1F52C5516EF1F3F077EAE63BCBAB7FDE9D17865BBCBE8BF5FBD88F2
          FC9083CACB824B2119B71DEF83DE001435044535AA1EF26FBDC40DEB9659F664
          3E7FB4586CBA0E08E9CB649548241256EF9565E0057771472B766C382151DBEF
          21CEB2178BE8C5321AFBDE46E0E1E01BC3C001AD38FA11B3A3490EEE68BE4813
          83F31F6DDED8E874B53B7A5168F7B6AF584ADBD680A5F039FBE24FBFD32C3D3F
          9AFBF5F96206A66F2C24D584B026FDC84B89C5E98C1B96733BECDEE8767A9E67
          A2E49607F7A636076C3EABC2C2608B82D03D5CCCFAB6B3E138BB493C018F05BF
          128E824F81C2606057BFD7EF6F8661E8BAEA7BE9A0ECCD0787BB6391A6CFE78B
          49B21AFBFE46E04B431665011455866E2672B47581A259224A030CDDED7A5E93
          A6E885E0942CD5F9D2338126225674783607A2BE029583875D517F01CD132C4C
          344F79C1B1D4EE4EB7D3F7B0F33D67ACD234C338B4B746050061A180454FE68B
          97AB78E43A5B8E37C956AF92A468F517C583ABA780696F07E1CD4EA7E3BA9E65
          32C6CA23EFB5115978D78910B35502FC07FB762B0846BE979738879506282345
          53A0689626793ECF5269B01F8C376FF406D4148D7E287D875C048EB178AB2DE0
          34BFF4CBFFFCE2084B75479533A2AC55EAF97CFEB7DD1D45D492D504A4DC8C49
          7FC1D2756E8E5C6F2B08BB48279C62A8AEB6221E76AAC2818B120CD1DDD56A67
          15C3BF6EFB7EDFB67757F1AB34A913B3D589E91B0B561406CD20B6B939F67C10
          C6103C4813EB3E9B8690EAE0F0914B19A5E9AB65BCC8B38E6D6F87602A9B9904
          B12C2D66E26C47295145B33C113803461AC60F37B69ABD695A452F1035490F69
          A9C09D6B60317DD1B0D4A1E6F68726505CF7BB7FE7A0A229809D68F1B7DD574B
          1C8F8DB999A60C9DA637941C2865304193407DCB0A2DDBC386E56B2289A25809
          01DF9E16D2E27C683B23D795857C112FE722A7391046798027AACDBE3A386ED0
          91F40FAE690698EDB4A967997A023038782AC512EE85A2E858D60690DF730B43
          E6E4E5D2FC1BE430DC1F20A140D105B535FDC1786B8BBAA5A868D9755FE97F10
          B477AE2145EB4D31550F412A3EAA587A28C6BB2E3FD28B717A343EEA5EBCFC6E
          6F079CBDAACAB71E260344B5197318B3A96E44225D71769B515991869AC6E270
          EE995660992E37F3424CD2640A4FD76A5D59DBE96D9DB9C48373E632F8C02EA4
          F0F5A22C45D9C8397EBB89915B1EE01E1737702CF846E024FC274828BC23D470
          ECB983FC4C72B1C852DF717FB8B13D0A3BED9FEEBA2FF33F1AD614AD6A8F5488
          9758FAD59FBEB01DDC5D4A3BD7EAB2066269355256E3F468D2335196DEDFDF7D
          11CD0B6C91B976530D4AD400575DA022E760C158589089179CD29D545F08EC02
          4525D14B0B6C5ACDD6FD0AD9211D55606A40A3815CB5700E32774D0E8F030C08
          521774DAEAC494A5A40A400B7A228085AC245414B8FF1824341522CE73D073EC
          9332C6EDDD3AE972A9407B571E988C08FC4CD5CEB5AFFEF34B65F192C18B345D
          5BBC7AE7DA39D01015EEFBC7B3E983C95E0A6EAA6952ADEF7ABC8C524F9ABD82
          5DE30DE5342A1308DB9D1BB5FFC9D6D34A8F654A33F4AD1AD0D88C822BAB99A3
          1C8ECF416641A241481D6E3A1885B01C6E6121044E612D7229C011057EC24794
          67F036EE0CC6770723F8324DD14B45D551E5C0FC5215E3555AFACDEF5FCB522D
          A4E78322AABA8A60FD0251F757B1C1D468C1F6EC2704AB634FE5E183182D7E1A
          6FA4E8FAB4EA13F57D38A180198A9FA4AEA66B223F6DAAD836E8161152626749
          A0A89420A1B1C87B5EF0C168A3B272E9A7D014BD543401DE56B57D56B3B4D652
          BB4E9836E5479AA5E747599524A0A866523C9DCF1ECF26AB3C27F39697C772D2
          385A15DBB42764AF3B4DFB2FCAB56DF4D9E606EA274A28B68804E3160D605C5D
          EC4028254A28AAA81409C5AB60E9EFF44737FB43D7B28BB29A9BAC6F864BC5D1
          59E04D8520B2F4EB5A4BED1A5A4B2F1C8DA8C2AF799A00515F2EE619F61FA4CA
          076255135B6A613D276A2DA4C7A226B50AE302332D0C056174CAC657346AD1F3
          44E793A9F0AC8A5508B81FA4CCA44CA580670788EF38EC8295DBF3FCF67BBEEE
          EBF78F8C6327231243851A130344657FF8F35747B554E54BF5F6D20B44B36B9C
          53ADCF2C593D994D7796584B40C461A4AB47C3B64625A0F5EFF6BFA8495295DB
          C930C5598B275624C02A5A182842669A55771C463BA4809F52808416987A0117
          349102F839F2C3DB8351DF0FAB8A85AAAC49DF03578176558310E2A8967EF53A
          2DD57D8F2E1CE5BA7216A344F32479B198BD5C2E56D84613F7DD5399BE625359
          93B14A9F70A20CAF877173E5E0022DE913E427579FB0E693752EAD6CE6EE1502
          3F809F9832052F14DC9B31562C0E7ABE0FDFD7E47BB5845E0D0EE74BD75ADA9A
          8CF8873F7FFD5A8B578BE9A5A18900C327CB2CDB5D463BD17C9624394EDCAE33
          A2D52F24246A23E3C840A3A2DF910F4560A6BEBDA2A6A19ED0A5A476CC404E41
          F54C19664759E8789B9DDEB8D3F56D47BD13F5CEB47E5E254EC4D23FFDF90F4E
          DDE95399BCF538705357085E2ADA36B0811B47E5224DF6E2E57E1C456992A197
          4215085412011E26B0D4A2C220E22457B464C4CF669DA82069DDDD55927D0BCC
          CC899F02378272E0E430E88C834EE87A366686D68168AD9FD787B2290FC4C2A3
          66C8B0EA7BF4CD5FFE485DB3A9F6488D036F59BC7AD9AE00ED38B041745D65D9
          2C5DCD56AB284B56795615EE19CAE144A2D64F50C6EB11C754CD802F456914B4
          E2822A81E1C0B096AE658372F6FDA0EBFAC052355DAA8ADFEAF8D0F5A2327B2A
          2D059B47104DA94230ABB4F4CF7FFD93DA05AE8C5EEB405503D3EB776520453B
          B0D1A4C47AF782CAF4B2984A6A33812D03116A975359B48FA0988B85449871B1
          5CCB02427AB603AF2EB65AAE9EB95A3CFF3ED1B278A98160DBE2552C7509D89C
          CC326B8BB7A2A9C655A29D8F69BB1BE0580A7CCA4A0AFCA0F90AFF928A5CA925
          008C61A0A249D179C7C465C4BC68B5D1A619555E1F5C3B9F7F4768A63935D34B
          656DF01EC752D054CB6AC778750F410D8DCB4513E8AB0D5EA0A9A45C29EE88C9
          D204FE647FF9EB378EEDA84E9FE0B070BB12532ACFD6D1230D8DCB4555CCD9AE
          3DA2E8116D89C9B284F2A5FFF55F7FB65B2C3DE897EAF2230D8DCB45D36DA351
          52F46B945FDAD4F1FEF5AF7FA9AAEDAB4C8CDDF8A53AB4A0A171B9689A6DD468
          E74BB3164BFFAA62BC4D85A09E05AEA171F538CAD2753FDE6FBEF9069879A851
          83AEB6D7D0B8621C2D3F52E327B087E0D75F7F8DE3616A8A52A9FDBA81A026AA
          86C6D5A0DDE9B35D730F7F659F7EFA697B4F691BD7FDB63534FEF1D108A16269
          63F436CD04E1F5FF0315F957B0F64CF2F40000000049454E44AE426082}
        Stretch = True
      end
      object LRepPedigree: TJvLabel
        Left = 61
        Top = 19
        Width = 113
        Height = 14
        Cursor = crHandPoint
        Caption = 'Listado de animales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        OnClick = ListadodeAnimales1Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Arial'
        HotTrackFont.Style = []
      end
      object LRepIndividual: TJvLabel
        Left = 61
        Top = 57
        Width = 173
        Height = 14
        Cursor = crHandPoint
        Caption = 'Listado de animales de Caba'#241'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        OnClick = ListadodeAnimalesCab1Click
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Arial'
        HotTrackFont.Style = []
      end
      object IRepIndividual: TImage
        Left = 13
        Top = 46
        Width = 32
        Height = 32
        Cursor = crHandPoint
        AutoSize = True
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002000
          0000200806000000737A7AF4000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000092D4944415478DA8D57796C93E719FF7DBE
          E3C44E7C24719C38C14930B9481CEC86000D84408E95694CEABA493BAA691BDA
          AA4D53A56987364DDD1FFD672ADBFE6805DAD4823A3A8AE880040251E9B6EE60
          033648070B37854249623B7612C738F1FDED795E3B108E049C3C7ABFF3FDFD9E
          FBF9243CFEA720912D168BC1E170D8D3E97466C13D094FFC49F3FFB44BEE5492
          6497CBA528282808EDDAB56B62B1CDF85C4392AF522AF5BF79FD8D9F776DEA79
          31994CC84AA5024A85048542098956A5A4A0638936E6955FCC9ED3052824BECE
          2280C5B6BCD29ED2E52B972FAE696FF72C4640495244524E527BF8D8FBDB5B57
          799CA954125902CAECAAA45591055448F7574991057A908042ACF36093535311
          B3C9647C988094139DD96C6E7976FD861766C2338E1FFEF8279DCD2D6E6B3A9D
          14A00A4140CA8233308329EE03F35FD60A10F7E6359772EE50AA54F0FBFC219B
          ADD4FA3001358981C4B465CB67BFB6E3CDDDAFF8C64661319BA1D6688489195C
          4D1B6441B31B672D91B5CA23519033BF9483906951D3F37EBF3F545AFA280136
          8993C4D5D3D3FBB99D6FEEFEEA647002C5C55668B53AC46273B87EED2A546A35
          928924ED9616D759FB687416E1991941D6DDDA0A8D5A45F734C24AC8B9820351
          966541F47104582C24AB48566FECDAD4B5FBF7EF748682C11C012D32E9341289
          38542AB508C44C2683B14008A1A919B1A98E00F53A1D74793AB19956A34691B1
          80C8A891CEA48515D87A7C7F3102A50C4EB27EE3C6AEF57BF6EEF3067316C8CB
          CB43F4EE5D0C9F1D467E7E1EA6C311DC4D00D6E21218E93C994C626636464019
          18F53A38CA4A505464C4DC5C0CB73EB941C64A893D2C560B96D72E878F08D896
          20B0A16BD3A68E3FECDBEF0D060244C0422FEBC9CC515C1C194164760EFE700C
          B6E26291E05702D390F30A602E3480636F22348DC0D8181ACB2CE85DDF46F1A3
          1605C56C2ACCA5AB049FCF4741685B9CC0A6CD9B3BF6EDFFA33710F0A1D86ABD
          E7EB0922F4CFE14BE44B0A26B51257A319B4D63BF16C7D350A342A41209E9671
          7D3C88778F9FA07C0B61DB0B7DC8D7EBC9FC0A14151AC53E4F24B09908EC3F70
          D01BF0FB61B558A023DFB29F0F0E1EC75830822A7B092EC724AC6E7661659919
          F15446041A173C8E0D1D918911911D078EC314BB8B6F3CFF194290454CB02B9E
          8AC08183FD5EBFDF072AC5C8230D528904F61C7A9FF691A1B29422692DC32A87
          1984038D4A2902935DC2D64965640ADA0C7CD10406FA87F025EF72785A1AC80A
          4A988A0A9F8240774FC7A1FE7E2F3D48A96581C150805B77C6B0B7FF389CE536
          DC90F2A02573166A28FAC9C705F97AB2808C38A527378CF06C1CC19928EE0426
          110A85B1D6A8C4179FDB883CAD8A2C6A1659B02481EE9E9E8E8181C3DEF1F171
          B28019854623CE9EBF8403437F43737D2DCE44494D7289A98022BB88CB07A768
          4254391515ADA919CA122231158961321C45556C1A2F6ED92002D16A31213831
          B12481CE9EDEDE8E81C3473CE314CD4CC06830E0F44723786FF043ACF634E1AA
          C602954E0B5B513E0AF3B5C827CD54DCA0248E0119512213994B211499C51D7F
          18CA1B23787E8317B6122B4A8BCD98080643658B1068670BF41281C347063D63
          4C80AA1BBBE0DC852B786BFF31ACF3ACC4E5B41A91640AB6423DCC061223A520
          197F8E52945321292B109E8BC3373983515F10D5F21CFAD67A506A35A18CD23F
          4016B097952D4DE0C8E051B2C028A83181FA37C6FC13D8FEBB77B1BCD20E5D79
          25CE4F84612BD0A0849A1A938851A1E2088F511CC42910FC53614CD381EFD6A7
          586333A2B9C185F2520BA5B545C44045B97D71027D7D7D1D83478F7A4647B304
          F494053295D39DEF0CE0E39B9FE2B99E0E9C180D537A6A60D22A50A055931BD4
          6293688CCC4FA23595C0373387F4ADAB7057DA5042E0358E3218289EFCE3BE90
          C351BE3481A3478F09022626409A7105FBC7C9FFE0ED431F60A5CB8916EF2AFC
          371883A5300F56BD167AAD5A6C9624ED27A331F82371CC8DDF46A58E5AACC108
          6745292ACB4BA9326AE11B1F0F55553A962670ECD890E7CEE81D8A5C33D57F3D
          D5F559FCFDC4297C70F2BC48B3B626179ADC2BF1F154145ACA8862633E4F3B08
          4C87C9F71168697E304A9C9612F9DE8CBA1A07113188724CF525E4ACAA7C3A02
          8E0A3BCE7C74016FED1B40457939D6B5B971E3F6284E0E5FC4327B315AEA6B28
          2374C850B34FA552A26D532A209D4A533CA450596183BBAE86DCA5058F951265
          0B95F8508D73D913080C0D79A642415CB87A136FEC7E0FCBAA1CE8EB5A8786E5
          CB307CEE12AEDDB829349D8D2745232AA24C5151BD97C9055C8CF4D4154B4D06
          E8D5322C261396553B459564026C01574DF5D2048688C09FFE7A023BDE3E80FA
          3A177A36B4C3555349D940A42E5C24936BA9F26544AA4D51BE672811F3484BEE
          034A2983423D0528112BB3978BA9C95E66A767643155F9A914D7B96A1727F0F9
          AD5B3B7EF68B573DAFEDDC835A6715BA3BD76005818FD30072F2CCFFC89F1568
          A0739E707858A1915D1420050189C12599A01921451D53237A090327E2093198
          080294868D75AEC54B71754D6D5B7BF717D63A9D5552F7FAD558514DE01321FC
          8BC0AB1D36610D0663020C3CDF84B813F235718C6C43E26185AF67E82213E576
          CC049A1BEB1F2160236923E9AA6DF2767FF9EBDBEABAD63D232D047712785F67
          3B18537CA73081ECB0C771278EE50C0B0366C431AF695A795ACA8820CC1258D5
          DCF80001FE10A9640B34B4B67FEB2BDF7CA9934BEE8A6A07814FDE03EF257079
          21B8D056BEAFB59CD5741E3893CE013389744658801B466022106A73373F4080
          5B5A03C9DABAA6D6ADBFDCFEEB35ED5EB77AD417C0A9B323A8A6F2DBDBB9FA9E
          E6B2503A730F7C9E08BB83AFF39ACE69CE5AB30B523417AA94DC2DB5B87DFB76
          E49996C6073E4C78226E21E92069FAF6775E726FFBEECBB5A78747A8E56AB1D6
          D3284CCCDA30BAF89B37794E63019C8B834C8E8438CE999F27A60FFFF2E7E4F5
          EBD77C017F60F7E0E1FE571612E00F92FA1C0177575757D3AF5EFFAD3B1E8FC3
          4DFD3F4EED953510EE061EABF9BCCF198CFBC6BCDFE77DCF83EDCBDFFFDE3902
          7E8DB63844EFCD2E24A0CEC540BB70435D9D7BEFDEBD9E72BB5DCB53CEBCC662
          CD699AD53CEBF307FCCEC0E92C70363D459E6468440FFCF4473F78F5DFA74FED
          218C5999377A280B4C248DC87E9C54516B2DA46154C966CCFDE4470FE47B870B
          7FB9AB34A4C964364CD237E427F4E8A54864E61C374CEE59F28277FF0FB92C9B
          FD8AB629A70000000049454E44AE426082}
        OnClick = ListadodeAnimalesCab1Click
      end
      object IRepPedigree: TImage
        Left = 13
        Top = 9
        Width = 32
        Height = 32
        Cursor = crHandPoint
        AutoSize = True
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002000
          0000200806000000737A7AF4000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000092D4944415478DA8D57796C93E719FF7DBE
          E3C44E7C24719C38C14930B9481CEC86000D84408E95694CEABA493BAA691BDA
          AA4D53A56987364DDD1FFD672ADBFE6805DAD4823A3A8AE880040251E9B6EE60
          033648070B37854249623B7612C738F1FDED795E3B108E049C3C7ABFF3FDFD9E
          FBF9243CFEA720912D168BC1E170D8D3E97466C13D094FFC49F3FFB44BEE5492
          6497CBA528282808EDDAB56B62B1CDF85C4392AF522AF5BF79FD8D9F776DEA79
          31994CC84AA5024A85048542098956A5A4A0638936E6955FCC9ED3052824BECE
          2280C5B6BCD29ED2E52B972FAE696FF72C4640495244524E527BF8D8FBDB5B57
          799CA954125902CAECAAA45591055448F7574991057A908042ACF36093535311
          B3C9647C988094139DD96C6E7976FD861766C2338E1FFEF8279DCD2D6E6B3A9D
          14A00A4140CA8233308329EE03F35FD60A10F7E6359772EE50AA54F0FBFC219B
          ADD4FA3001358981C4B465CB67BFB6E3CDDDAFF8C64661319BA1D6688489195C
          4D1B6441B31B672D91B5CA23519033BF9483906951D3F37EBF3F545AFA280136
          8993C4D5D3D3FBB99D6FEEFEEA647002C5C55668B53AC46273B87EED2A546A35
          928924ED9616D759FB687416E1991941D6DDDA0A8D5A45F734C24AC8B9820351
          966541F47104582C24AB48566FECDAD4B5FBF7EF748682C11C012D32E9341289
          38542AB508C44C2683B14008A1A919B1A98E00F53A1D74793AB19956A34691B1
          80C8A891CEA48515D87A7C7F3102A50C4EB27EE3C6AEF57BF6EEF3067316C8CB
          CB43F4EE5D0C9F1D467E7E1EA6C311DC4D00D6E21218E93C994C626636464019
          18F53A38CA4A505464C4DC5C0CB73EB941C64A893D2C560B96D72E878F08D896
          20B0A16BD3A68E3FECDBEF0D060244C0422FEBC9CC515C1C194164760EFE700C
          B6E26291E05702D390F30A602E3480636F22348DC0D8181ACB2CE85DDF46F1A3
          1605C56C2ACCA5AB049FCF4741685B9CC0A6CD9B3BF6EDFFA33710F0A1D86ABD
          E7EB0922F4CFE14BE44B0A26B51257A319B4D63BF16C7D350A342A41209E9671
          7D3C88778F9FA07C0B61DB0B7DC8D7EBC9FC0A14151AC53E4F24B09908EC3F70
          D01BF0FB61B558A023DFB29F0F0E1EC75830822A7B092EC724AC6E7661659919
          F15446041A173C8E0D1D918911911D078EC314BB8B6F3CFF194290454CB02B9E
          8AC08183FD5EBFDF072AC5C8230D528904F61C7A9FF691A1B29422692DC32A87
          1984038D4A2902935DC2D64965640ADA0C7CD10406FA87F025EF72785A1AC80A
          4A988A0A9F8240774FC7A1FE7E2F3D48A96581C150805B77C6B0B7FF389CE536
          DC90F2A02573166A28FAC9C705F97AB2808C38A527378CF06C1CC19928EE0426
          110A85B1D6A8C4179FDB883CAD8A2C6A1659B02481EE9E9E8E8181C3DEF1F171
          B28019854623CE9EBF8403437F43737D2DCE44494D7289A98022BB88CB07A768
          4254391515ADA919CA122231158961321C45556C1A2F6ED92002D16A31213831
          B12481CE9EDEDE8E81C3473CE314CD4CC06830E0F44723786FF043ACF634E1AA
          C602954E0B5B513E0AF3B5C827CD54DCA0248E0119512213994B211499C51D7F
          18CA1B23787E8317B6122B4A8BCD98080643658B1068670BF41281C347063D63
          4C80AA1BBBE0DC852B786BFF31ACF3ACC4E5B41A91640AB6423DCC061223A520
          197F8E52945321292B109E8BC3373983515F10D5F21CFAD67A506A35A18CD23F
          4016B097952D4DE0C8E051B2C028A83181FA37C6FC13D8FEBB77B1BCD20E5D79
          25CE4F84612BD0A0849A1A938851A1E2088F511CC42910FC53614CD381EFD6A7
          586333A2B9C185F2520BA5B545C44045B97D71027D7D7D1D83478F7A4647B304
          F494053295D39DEF0CE0E39B9FE2B99E0E9C180D537A6A60D22A50A055931BD4
          6293688CCC4FA23595C0373387F4ADAB7057DA5042E0358E3218289EFCE3BE90
          C351BE3481A3478F09022626409A7105FBC7C9FFE0ED431F60A5CB8916EF2AFC
          371883A5300F56BD167AAD5A6C9624ED27A331F82371CC8DDF46A58E5AACC108
          6745292ACB4BA9326AE11B1F0F55553A962670ECD890E7CEE81D8A5C33D57F3D
          D5F559FCFDC4297C70F2BC48B3B626179ADC2BF1F154145ACA8862633E4F3B08
          4C87C9F71168697E304A9C9612F9DE8CBA1A07113188724CF525E4ACAA7C3A02
          8E0A3BCE7C74016FED1B40457939D6B5B971E3F6284E0E5FC4327B315AEA6B28
          2374C850B34FA552A26D532A209D4A533CA450596183BBAE86DCA5058F951265
          0B95F8508D73D913080C0D79A642415CB87A136FEC7E0FCBAA1CE8EB5A8786E5
          CB307CEE12AEDDB829349D8D2745232AA24C5151BD97C9055C8CF4D4154B4D06
          E8D5322C261396553B459564026C01574DF5D2048688C09FFE7A023BDE3E80FA
          3A177A36B4C3555349D940A42E5C24936BA9F26544AA4D51BE672811F3484BEE
          034A2983423D0528112BB3978BA9C95E66A767643155F9A914D7B96A1727F0F9
          AD5B3B7EF68B573DAFEDDC835A6715BA3BD76005818FD30072F2CCFFC89F1568
          A0739E707858A1915D1420050189C12599A01921451D53237A090327E2093198
          080294868D75AEC54B71754D6D5B7BF717D63A9D5552F7FAD558514DE01321FC
          8BC0AB1D36610D0663020C3CDF84B813F235718C6C43E26185AF67E82213E576
          CC049A1BEB1F2160236923E9AA6DF2767FF9EBDBEABAD63D232D047712785F67
          3B18537CA73081ECB0C771278EE50C0B0366C431AF695A795ACA8820CC1258D5
          DCF80001FE10A9640B34B4B67FEB2BDF7CA9934BEE8A6A07814FDE03EF257079
          21B8D056BEAFB59CD5741E3893CE013389744658801B466022106A73373F4080
          5B5A03C9DABAA6D6ADBFDCFEEB35ED5EB77AD417C0A9B323A8A6F2DBDBB9FA9E
          E6B2503A730F7C9E08BB83AFF39ACE69CE5AB30B523417AA94DC2DB5B87DFB76
          E49996C6073E4C78226E21E92069FAF6775E726FFBEECBB5A78747A8E56AB1D6
          D3284CCCDA30BAF89B37794E63019C8B834C8E8438CE999F27A60FFFF2E7E4F5
          EBD77C017F60F7E0E1FE571612E00F92FA1C0177575757D3AF5EFFAD3B1E8FC3
          4DFD3F4EED953510EE061EABF9BCCF198CFBC6BCDFE77DCF83EDCBDFFFDE3902
          7E8DB63844EFCD2E24A0CEC540BB70435D9D7BEFDEBD9E72BB5DCB53CEBCC662
          CD699AD53CEBF307FCCEC0E92C70363D459E6468440FFCF4473F78F5DFA74FED
          218C5999377A280B4C248DC87E9C54516B2DA46154C966CCFDE4470FE47B870B
          7FB9AB34A4C964364CD237E427F4E8A54864E61C374CEE59F28277FF0FB92C9B
          FD8AB629A70000000049454E44AE426082}
        OnClick = ListadodeAnimales1Click
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1008
    Caption = 'Selector de animales'
    inherited LTitulo: TLabel
      Width = 604
    end
    inherited PILeft: TPanel
      Left = 800
    end
  end
  inherited Psocalo: TPanel
    Top = 708
    Width = 1008
    inherited JvSocalo: TJvImage
      Width = 1008
    end
  end
  inherited ALUniversal: TActionList
    Images = ImageList1
    Left = 40
    Top = 8
    object ACSalir: TAction
      Category = 'Salir'
      Caption = 'Salir'
      ShortCut = 27
      OnExecute = ACSalirExecute
    end
    object ACReportPrint: TAction
      Category = 'Reportes'
      Caption = 'Imprimir Reporte'
      OnExecute = ACReportPrintExecute
    end
    object ACReportPreview: TAction
      Category = 'Reportes'
      Caption = 'Ver Reporte'
    end
    object AVerFicha: TAction
      Category = 'Ficha Animal'
      Caption = 'Ver Ficha'
      OnExecute = AVerFichaExecute
    end
    object AImprimirListado: TAction
      Category = 'Reportes'
      Caption = 'Imprimir '
      ImageIndex = 0
      OnExecute = AImprimirListadoExecute
    end
    object AEliminarAnimal: TAction
      Caption = 'Eliminar Animal...'
      OnExecute = AEliminarAnimalExecute
    end
  end
  object IBQParametros: TIBQuery [10]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from REL_PARAMETROS_ESTABLECIMIENTO where (ESTABLECIMIE' +
        'NTO = :establecimiento) and ()')
    Left = 136
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
  end
  object ImageList1: TImageList [11]
    Left = 168
    Top = 8
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 12
    Top = 39
  end
  inherited SDXLS: TSaveDialog
    Left = 582
    Top = 65533
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBQAnimales
    Columns = <
      item
        DataField = 'RP'
        Title = 'RP'
      end
      item
        DataField = 'NACIMIENTO'
        Title = 'Nacimiento'
      end
      item
        DataField = 'EDAD'
        Title = 'Edad'
      end
      item
        DataField = 'CATEGORIA_NOMBRE'
        Title = 'Categor'#237'a'
      end
      item
        DataField = 'ESTADO_ACTUAL'
        Title = 'Estado Actual'
      end
      item
        DataField = 'RAZA_NOMBRE'
        Title = 'Raza'
      end
      item
        DataField = 'ULTIMO_EVENTO'
        Title = 'Ultimo Evento'
      end
      item
        DataField = 'ADN'
        Title = 'ADN'
      end
      item
        DataField = 'TIPIFICACION_SANGUINEA'
        Title = 'T.Sang.'
      end>
    Title.Text = 'Animales'
    Left = 608
    Top = 65529
  end
  inherited WinXP1: TWinXP
    Left = 448
    Top = 16
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 548
    Top = 65535
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 596
    Top = 23
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 740
    Top = 15
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 492
    Top = 23
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 420
    Top = 15
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 372
    Top = 15
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 96
  end
  object DSAnimales: TDataSource
    DataSet = IBQAnimales
    Left = 72
    Top = 8
  end
  object IBQAnimales: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterClose = IBQAnimalesAfterClose
    AfterOpen = IBQAnimalesAfterOpen
    BeforeOpen = IBQAnimalesBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from gen_animales (:establecimiento, '#39'TODAY'#39', :con_even' +
        'to)')
    Left = 104
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'con_evento'
        ParamType = ptUnknown
      end>
    object IBQAnimalesANIMAL: TIntegerField
      FieldName = 'ANIMAL'
      Origin = 'GEN_ANIMALES.ANIMAL'
    end
    object IBQAnimalesRP: TIBStringField
      FieldName = 'RP'
      Origin = 'GEN_ANIMALES.RP'
      Size = 10
    end
    object IBQAnimalesSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'GEN_ANIMALES.SEXO'
    end
    object IBQAnimalesRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'GEN_ANIMALES.RAZA'
    end
    object IBQAnimalesRAZA_NOMBRE: TIBStringField
      FieldName = 'RAZA_NOMBRE'
      Origin = 'GEN_ANIMALES.RAZA_NOMBRE'
      Size = 50
    end
    object IBQAnimalesRODEO: TIntegerField
      FieldName = 'RODEO'
      Origin = 'GEN_ANIMALES.RODEO'
    end
    object IBQAnimalesCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Origin = 'GEN_ANIMALES.CATEGORIA'
    end
    object IBQAnimalesCATEGORIA_NOMBRE: TIBStringField
      FieldName = 'CATEGORIA_NOMBRE'
      Origin = 'GEN_ANIMALES.CATEGORIA_NOMBRE'
      Size = 50
    end
    object IBQAnimalesCRONO_DENT: TIntegerField
      FieldName = 'CRONO_DENT'
      Origin = 'GEN_ANIMALES.CRONO_DENT'
    end
    object IBQAnimalesESTADO_REPRO: TIntegerField
      FieldName = 'ESTADO_REPRO'
      Origin = 'GEN_ANIMALES.ESTADO_REPRO'
    end
    object IBQAnimalesNACIMIENTO: TDateField
      FieldName = 'NACIMIENTO'
      Origin = 'GEN_ANIMALES.NACIMIENTO'
    end
    object IBQAnimalesEDAD: TIntegerField
      FieldName = 'EDAD'
      Origin = 'GEN_ANIMALES.EDAD'
    end
    object IBQAnimalesPOTRERO: TIntegerField
      FieldName = 'POTRERO'
      Origin = 'GEN_ANIMALES.POTRERO'
    end
    object IBQAnimalesACTIVO: TIBStringField
      FieldName = 'ACTIVO'
      Origin = 'GEN_ANIMALES.ACTIVO'
      Size = 1
    end
    object IBQAnimalesCOND_CORP: TIntegerField
      FieldName = 'COND_CORP'
      Origin = 'GEN_ANIMALES.COND_CORP'
    end
    object IBQAnimalesGDR: TIntegerField
      FieldName = 'GDR'
      Origin = 'GEN_ANIMALES.GDR'
    end
    object IBQAnimalesPESO: TFloatField
      FieldName = 'PESO'
      Origin = 'GEN_ANIMALES.PESO'
    end
    object IBQAnimalesRECHAZADO: TIBStringField
      FieldName = 'RECHAZADO'
      Origin = 'GEN_ANIMALES.RECHAZADO'
      Size = 1
    end
    object IBQAnimalesFRAME: TFloatField
      FieldName = 'FRAME'
      Origin = 'GEN_ANIMALES.FRAME'
    end
    object IBQAnimalesESTADO_ACTUAL: TIBStringField
      FieldName = 'ESTADO_ACTUAL'
      Origin = 'GEN_ANIMALES.ESTADO_ACTUAL'
      Size = 50
    end
    object IBQAnimalesULTIMO_EVENTO: TIBStringField
      FieldName = 'ULTIMO_EVENTO'
      Origin = 'GEN_ANIMALES.ULTIMO_EVENTO'
      Size = 255
    end
    object IBQAnimalesEDADCAPTION: TIBStringField
      FieldName = 'EDADCAPTION'
      Origin = 'GEN_ANIMALES.EDADCAPTION'
      Size = 12
    end
    object IBQAnimalesESTADO_LACTACION: TIntegerField
      FieldName = 'ESTADO_LACTACION'
      Origin = 'GEN_ANIMALES.ESTADO_LACTACION'
    end
    object IBQAnimalesORIGEN_ANIMAL: TIntegerField
      FieldName = 'ORIGEN_ANIMAL'
      Origin = 'GEN_ANIMALES.ORIGEN_ANIMAL'
    end
    object IBQAnimalesADN: TIBStringField
      FieldName = 'ADN'
      Origin = 'GEN_ANIMALES.ADN'
      Size = 255
    end
    object IBQAnimalesTIPIFICACION_SANGUINEA: TIBStringField
      FieldName = 'TIPIFICACION_SANGUINEA'
      Origin = 'GEN_ANIMALES.TIPIFICACION_SANGUINEA'
      Size = 255
    end
    object IBQAnimalesHBA: TIBStringField
      FieldName = 'HBA'
      Origin = 'GEN_ANIMALES.HBA'
      Size = 10
    end
    object IBQAnimalesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'GEN_ANIMALES.NOMBRE'
      Size = 10
    end
    object IBQAnimalesCODIGORAZA: TIBStringField
      FieldName = 'CODIGORAZA'
      Origin = 'GEN_ANIMALES.CODIGORAZA'
      Size = 2
    end
  end
  object IBQAux: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 8
    Top = 8
  end
  object PMListadoAnimales: TPopupMenu
    Left = 672
    Top = 17
    object ListadodeAnimales1: TMenuItem
      Caption = 'Listado de Animales...'
      ImageIndex = 5
      OnClick = ListadodeAnimales1Click
    end
    object ListadodeAnimalesCab1: TMenuItem
      Caption = 'Listado de Animales de Caba'#241'a...'
      OnClick = ListadodeAnimalesCab1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 384
  end
  object TPanel: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = TPanelTimer
    Left = 868
    Top = 23
  end
end
