inherited FMovCargarDatos: TFMovCargarDatos
  Left = 127
  Top = 160
  Caption = 'Huella - Cargar Datos desde Movil'
  ClientHeight = 489
  ClientWidth = 864
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 864
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
    Width = 832
    Height = 385
  end
  inherited Image4: TImage
    Width = 438
  end
  object GroupBox1: TGroupBox [4]
    Left = 9
    Top = 103
    Width = 879
    Height = 292
    Caption = 'Archivos'
    TabOrder = 4
    object ShellTreeView1: TShellTreeView
      Left = 9
      Top = 20
      Width = 244
      Height = 264
      ObjectTypes = [otFolders]
      Root = 'rfDesktop'
      UseShellImages = True
      AutoRefresh = True
      Indent = 19
      ParentColor = False
      RightClickSelect = True
      ShowRoot = False
      TabOrder = 0
      OnClick = ShellTreeView1Click
    end
    object SGArchivos2: TStringGrid
      Left = 258
      Top = 20
      Width = 613
      Height = 264
      ColCount = 4
      DefaultColWidth = 120
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goRowSelect]
      ParentFont = False
      TabOrder = 1
      Visible = False
      ColWidths = (
        192
        128
        240
        120)
    end
    object SGArchivos: TAdvStringGrid
      Left = 258
      Top = 20
      Width = 613
      Height = 264
      Cursor = crDefault
      BorderStyle = bsNone
      ColCount = 4
      DefaultRowHeight = 20
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLineWidth = 1
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goDrawFocusSelected, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 2
      OnDblClick = SGArchivosDblClick
      OnSelectCell = SGArchivosSelectCell
      GridLineColor = clSilver
      ActiveCellShow = False
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = clGray
      ActiveCellColorTo = clNone
      Bands.PrimaryColor = clInfoBk
      Bands.PrimaryLength = 1
      Bands.SecondaryColor = clWindow
      Bands.SecondaryLength = 1
      Bands.Print = False
      AutoNumAlign = False
      AutoSize = False
      VAlignment = vtaTop
      EnhTextSize = False
      EnhRowColMove = True
      SizeWithForm = False
      Multilinecells = False
      DragDropSettings.OleAcceptFiles = True
      DragDropSettings.OleAcceptText = True
      SortSettings.AutoColumnMerge = False
      SortSettings.Column = 0
      SortSettings.Show = False
      SortSettings.IndexShow = False
      SortSettings.IndexColor = clYellow
      SortSettings.Full = True
      SortSettings.SingleColumn = False
      SortSettings.IgnoreBlanks = False
      SortSettings.BlankPos = blFirst
      SortSettings.AutoFormat = True
      SortSettings.Direction = sdAscending
      SortSettings.InitSortDirection = sdAscending
      SortSettings.FixedCols = False
      SortSettings.NormalCellsOnly = False
      SortSettings.Row = 0
      SortSettings.UndoSort = False
      FloatingFooter.Color = clBtnFace
      FloatingFooter.Column = 0
      FloatingFooter.FooterStyle = fsFixedLastRow
      FloatingFooter.Visible = False
      ControlLook.Color = clBlack
      ControlLook.CheckSize = 15
      ControlLook.RadioSize = 10
      ControlLook.ControlStyle = csWinXP
      ControlLook.DropDownAlwaysVisible = False
      ControlLook.ProgressMarginX = 2
      ControlLook.ProgressMarginY = 2
      EnableBlink = False
      EnableHTML = True
      EnableWheel = True
      Flat = False
      Look = glXP
      HintColor = clInfoBk
      SelectionColor = 15387318
      SelectionTextColor = clTeal
      SelectionRectangle = False
      SelectionResizer = False
      SelectionRTFKeep = False
      HintShowCells = False
      HintShowLargeText = False
      HintShowSizing = False
      PrintSettings.FooterSize = 0
      PrintSettings.HeaderSize = 0
      PrintSettings.Time = ppNone
      PrintSettings.Date = ppNone
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.PageNr = ppNone
      PrintSettings.Title = ppNone
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.Borders = pbSingle
      PrintSettings.BorderStyle = psSolid
      PrintSettings.Centered = True
      PrintSettings.RepeatFixedRows = False
      PrintSettings.RepeatFixedCols = False
      PrintSettings.LeftSize = 0
      PrintSettings.RightSize = 0
      PrintSettings.ColumnSpacing = 0
      PrintSettings.RowSpacing = 0
      PrintSettings.TitleSpacing = 0
      PrintSettings.Orientation = poPortrait
      PrintSettings.PageNumberOffset = 0
      PrintSettings.MaxPagesOffset = 0
      PrintSettings.FixedWidth = 0
      PrintSettings.FixedHeight = 0
      PrintSettings.UseFixedHeight = False
      PrintSettings.UseFixedWidth = False
      PrintSettings.FitToPage = fpNever
      PrintSettings.PageNumSep = '/'
      PrintSettings.NoAutoSize = False
      PrintSettings.NoAutoSizeRow = False
      PrintSettings.PrintGraphics = False
      PrintSettings.UseDisplayFont = True
      HTMLSettings.Width = 100
      HTMLSettings.XHTML = False
      Navigation.AdvanceDirection = adLeftRight
      Navigation.InsertPosition = pInsertBefore
      Navigation.HomeEndKey = heFirstLastColumn
      Navigation.TabToNextAtEnd = False
      Navigation.TabAdvanceDirection = adLeftRight
      ColumnSize.Location = clRegistry
      CellNode.Color = clSilver
      CellNode.ExpandOne = False
      CellNode.NodeColor = clBlack
      CellNode.NodeIndent = 12
      CellNode.TreeColor = clSilver
      MaxEditLength = 0
      Grouping.HeaderColor = clNone
      Grouping.HeaderColorTo = clNone
      Grouping.HeaderTextColor = clNone
      Grouping.MergeHeader = False
      Grouping.MergeSummary = False
      Grouping.Summary = False
      Grouping.SummaryColor = clNone
      Grouping.SummaryColorTo = clNone
      Grouping.SummaryTextColor = clNone
      IntelliPan = ipVertical
      URLColor = clBlue
      URLShow = False
      URLFull = False
      URLEdit = False
      ScrollType = ssNormal
      ScrollColor = clNone
      ScrollWidth = 17
      ScrollSynch = False
      ScrollProportional = False
      ScrollHints = shNone
      OemConvert = False
      FixedFooters = 0
      FixedRightCols = 0
      FixedColWidth = 195
      FixedRowHeight = 20
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FixedAsButtons = False
      FloatFormat = '%.2f'
      IntegralHeight = False
      WordWrap = True
      Lookup = False
      LookupCaseSensitive = False
      LookupHistory = False
      BackGround.Top = 0
      BackGround.Left = 0
      BackGround.Display = bdTile
      BackGround.Cells = bcNormal
      Filter = <>
      Version = '2.8.3.0'
      ColWidths = (
        195
        130
        241
        2)
    end
  end
  object BBCargar: TBitBtn [5]
    Left = 664
    Top = 409
    Width = 92
    Height = 32
    Anchors = [akTop, akRight]
    Caption = 'Cargar'
    TabOrder = 5
    OnClick = BBCargarClick
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000A30F0000A30F00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A2
      4F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22
      A24F22A24F22A24F22A24F22FF00FFFF00FFFF00FFFF00FFC9762BF8F6F4B7A2
      93B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7
      A293B7A293B7A293B7A293B7A293B7A293A24F22FF00FFFF00FFFF00FFFF00FF
      C9762BFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DC
      D6E5D9D2E3D6CEE1D2CADFCFC6DDCCC2DBC9BFDBC9BFB7A293A24F22FF00FFFF
      00FFFF00FFFF00FFC9762BFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4
      EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CEE1D2CADFCFC6DDCCC2DBC9BFB7A2
      93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFDFCFBFAF9F8F8F6F4F6
      F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CEE1D2CA
      DFCFC6DDCCC2B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
      FFFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DD983000E7
      DCD6E5D9D2E3D6CEE1D2CADFCFC6B7A293A24F22FF00FFFF00FFFF00FFFF00FF
      C9762BFFFFFFFFFFFFFFFFFFFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8
      E4EEE5E0983000983000E7DCD6E5D9D2E3D6CEE1D2CAB7A293A24F22FF00FFFF
      00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBFAF9F8F8F6F4
      F6F2F0D76733983000983000983000C16E39983000E7DCD6E5D9D2E3D6CEB7A2
      93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFDFCFBFAF9F7F6D76733FBC4A1DF9C60DA904CDA904CC16E39983000
      E8DED8E6DBD4B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAD76733FBC4A1E8A977DF9C60DA
      904CDA904CC16E39983000E8DED8B7A293A24F22FF00FFFF00FFFF00FFFF00FF
      C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD76733FBC4
      A1FBC4A1FBC4A1FBC4A1C16E39983000EDE4DFEBE1DBB7A293A24F22FF00FFFF
      00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFD76733D76733D76733D76733E8A977983000F1EAE6EFE7E2EDE4DFB7A2
      93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAD76733983000F5F1EEF3EDEA
      F1EAE6EFE7E2B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFD983000F9
      F7F6F7F4F2F5F1EEF3EDEAF1EAE6B7A293A24F22FF00FFFF00FFFF00FFFF00FF
      C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEAF1EAE6A24F22FF00FFFF
      00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A24F22A24F22A24F22
      A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F
      22A24F22FF00FFFF00FFFF00FFFF00FFC9762BD06F01D06F01D06F01D06F01D0
      6F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01
      D06F01D06F01D06F01A24F22FF00FFFF00FFFF00FFFF00FFCE6300ED9733ED97
      33ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733F6
      CA9AF3AD61F6CA9AF3AD61306DF97F7488DA7B0DFF00FFFF00FFFF00FFFF00FF
      FF00FFDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B
      0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Layout = blGlyphRight
  end
  object BBCancelar: TBitBtn [6]
    Left = 765
    Top = 409
    Width = 92
    Height = 32
    Anchors = [akRight, akBottom]
    Caption = 'Cerrar'
    TabOrder = 3
    OnClick = BBCancelarClick
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000930F0000930F00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF000098FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
      0098FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF1B48FB000098FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF0000981B48FBFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A2
      4F22A24F22A24F22A24F22A24F22A24F22A24F221B48FB002EE4A24F22A24F22
      A24F22A24F22A24F220000981B48FB1B48FBFF00FFFF00FFC9762BF8F6F4B7A2
      93B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A2931B
      48FB000098B7A293B7A293B7A2930000981B48FB1B48FBFF00FFFF00FFFF00FF
      C9762BFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DC
      D6E5D9D2E3D6CEE1D2CA1B48FB000098DBC9BF0000981B48FB1B48FBFF00FFFF
      00FFFF00FFFF00FFC9762BFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4
      EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CE3056FC1B48FB1B48FB1B48FB1B48
      FBA24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFDFCFBFAF9F8F8F6F4F6
      F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CE1B48FB
      1B48FB1B48FBB7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
      FFFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7
      DCD60000981B48FB1B48FB1B48FB000098A24F22FF00FFFF00FFFF00FFFF00FF
      C9762BFFFFFFFFFFFFFFFFFFFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8
      E4EEE5E0ECE3DD0000987F97FD1B48FB3056FC7F97FD1B48FB000098FF00FFFF
      00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBFAF9F8F8F6F4
      F6F2F0F4EFECF2ECE8F0E8E40000987F97FD002EE4E7DCD6E5D9D23056FC7F97
      FD1B48FB000098FF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EE0000987F97FD002EE4EDE4DFEBE1DB
      E8DED8E6DBD43056FC7F97FD1B48FB000098FF00FFFF00FFC9762BFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2002EE4002EE4F1
      EAE6EFE7E2EDE4DFEBE1DBE8DED8B7A2933056FC1B48FB1B48FBFF00FFFF00FF
      C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9F7
      F6F7F4F2F5F1EEF3EDEAF1EAE6EFE7E2EDE4DFEBE1DBB7A293A24F22FF00FFFF
      00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEAF1EAE6EFE7E2EDE4DFB7A2
      93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEA
      F1EAE6EFE7E2B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9
      F7F6F7F4F2F5F1EEF3EDEAF1EAE6B7A293A24F22FF00FFFF00FFFF00FFFF00FF
      C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEAF1EAE6A24F22FF00FFFF
      00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A24F22A24F22A24F22
      A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F
      22A24F22FF00FFFF00FFFF00FFFF00FFC9762BD06F01D06F01D06F01D06F01D0
      6F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01
      D06F01D06F01D06F01A24F22FF00FFFF00FFFF00FFFF00FFCE6300ED9733ED97
      33ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733F6
      CA9AF3AD61F6CA9AF3AD61306DF97F7488DA7B0DFF00FFFF00FFFF00FFFF00FF
      FF00FFDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B
      0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object GBElegir: TGroupBox [7]
    Left = 9
    Top = 43
    Width = 878
    Height = 61
    Caption = 'Elegir tipo de Evento'
    TabOrder = 2
    Visible = False
    object CBEventos: TComboBox
      Left = 16
      Top = 25
      Width = 390
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 0
      OnChange = CBEventosChange
      OnCloseUp = CBEventosCloseUp
      Items.Strings = (
        'Todos'
        'Diagn'#243'stico de Gestaci'#243'n'
        'Peso'
        'Evaluaci'#243'n de Preservicio')
    end
    object checkAgregados: TCheckBox
      Left = 431
      Top = 26
      Width = 268
      Height = 18
      Caption = 'Mostrar archivos ya cargados en el sistema'
      TabOrder = 1
      OnClick = checkAgregadosClick
    end
  end
  inherited PTitulo: TPanel
    Width = 864
    Caption = 'Cargar Datos de Movil'
    inherited LTitulo: TLabel
      Width = 460
      Caption = 'Cargar Datos de Movil'
    end
    inherited PILeft: TPanel
      Left = 656
    end
  end
  inherited Psocalo: TPanel
    Top = 467
    Width = 864
    inherited JvSocalo: TJvImage
      Width = 864
    end
  end
  inherited ALUniversal: TActionList
    Left = 547
    Top = 86
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 108
    Top = 7
  end
  inherited SDXLS: TSaveDialog
    Left = 510
    Top = 85
  end
  inherited DTXLS: TDataToXLS
    Left = 584
    Top = 89
  end
  inherited WinXP1: TWinXP
    Left = 616
    Top = 88
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 268
    Top = 7
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 236
    Top = 7
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 204
    Top = 7
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 76
    Top = 7
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 172
    Top = 7
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 140
    Top = 7
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 472
    Top = 16
  end
  object DLGOpen: TOpenDialog
    Filter = 'Archivos XML (*.xml)|*.xml|Archivos Excel (*.xls)|*.xls'
    Left = 464
    Top = 88
  end
  object XMLDoc: TXMLDocument
    Left = 424
    Top = 88
    DOMVendorDesc = 'MSXML'
  end
  object IBQObtenerID: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_ANIMAL,ID_RP from tab_animales')
    Left = 576
    Top = 16
  end
  object IBQImportados: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from tab_importaciones where establecimiento=:estableci' +
        'miento')
    Left = 640
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
  end
  object IBTPrincipal: TIBTransaction
    Active = False
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 440
    Top = 16
  end
end
