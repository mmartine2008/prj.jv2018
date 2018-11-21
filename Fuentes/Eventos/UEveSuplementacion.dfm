inherited FEveSuplementacion: TFEveSuplementacion
  Left = 147
  Top = 96
  Caption = 'FEveSuplementacion'
  ClientHeight = 674
  Constraints.MinHeight = 708
  Constraints.MinWidth = 990
  OnResize = nil
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Top = 56
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
  inherited PError: TPageControl
    Top = 561
  end
  inherited PDatos: TPanel
    Height = 474
    inherited PCBasico: TPageControl
      Height = 392
      ActivePage = TSDatos
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Height = 350
        end
        inherited MSimple: TMangazo
          Height = 350
          inherited GBFiltro: TGroupBox
            Width = 1002
            Height = 113
          end
          inherited PSeleccion: TPanel
            Top = 304
            Width = 1002
            Height = 46
            inherited GBDisponibles: TGroupBox
              Width = 457
              Height = 46
              inherited IFondoDis: TImage
                Width = 453
                Height = 27
              end
              inherited BDBGDisponibles: TBitDBGrid
                Width = 453
                Height = 27
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Alignment = taCenter
                    Title.Caption = 'RP'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = []
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE'
                    Title.Alignment = taCenter
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = []
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Alignment = taCenter
                    Title.Caption = 'SENASA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = []
                    Width = 141
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Left = 559
              Width = 443
              Height = 46
              inherited IFondoSel: TImage
                Width = 439
                Height = 27
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 439
                Height = 27
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Alignment = taCenter
                    Title.Caption = 'RP'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -12
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = []
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE'
                    Title.Alignment = taCenter
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -12
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = []
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Alignment = taCenter
                    Title.Caption = 'SENASA'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -12
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = []
                    Width = 145
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Left = 457
              Width = 102
              Height = 46
              inherited IFondo: TImage
                Width = 102
                Height = 46
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 250
            Width = 1002
          end
          inherited GBFiltros: TGroupBox
            Top = 134
            Width = 1002
            inherited DBLCBACondCorp: TDBLookupComboBoxAuto
              Left = 452
              Top = 39
            end
            inherited CBCondCorp: TCheckBox
              Left = 452
              Top = 16
            end
          end
          inherited Panel1: TPanel
            Top = 113
            Width = 1002
            inherited Image1: TImage
              Width = 1002
            end
            inherited Label1: TLabel
              Width = 1002
              Height = 21
            end
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            Top = 113
            Height = 91
            FAWidth = 145
            FAHeight = 91
            FCWidth = 734
            FCHeight = 22
          end
          inherited IBQPotrero: TIBQuery
            Left = 104
            Top = 16
          end
          inherited IBQRodeo: TIBQuery
            Left = 144
            Top = 16
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select  ID_AUX,ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otr' +
                'o,nombre,sexo from AUX_ANIMALES'
              'where id_animal > 0'
              ''
              ''
              '')
          end
          inherited IBUSQLIntercambiarIzq: TIBUpdateSQL
            RefreshSQL.Strings = (
              'Select '
              '  ID_AUX,'
              '  ESTABLECIMIENTO,'
              '  ID_ANIMAL,'
              '  ID_RP,'
              '  ID_SENASA,'
              '  ID_PC,'
              '  ID_HBA,'
              '  ID_RA,'
              '  ID_OTRO,'
              '  NOMBRE,'
              '  FECHA_NACIMIENTO,'
              '  SEXO,'
              '  PESO,'
              '  ORIGEN,'
              '  CIRCUNFERENCIA_ESCROTAL,'
              '  ESTADO_REPRODUCTIVO,'
              '  ESTADO_LACTACION,'
              '  POTRERO,'
              '  LOTE,'
              '  RAZA,'
              '  RODEO,'
              '  CATEGORIA,'
              '  ACTIVO,'
              '  CRONOLOGIA_DENTARIA,'
              '  CONDICION_CORPORAL,'
              '  MADRE_BIOLOGICA_EXTERNA,'
              '  MADRE_RECEPTORA_EXTERNA,'
              '  GDR,'
              '  PADRE_EXTERNO,'
              '  MADRE_BIOLOGICA_INTERNA,'
              '  MADRE_RECEPTORA_INTERNA,'
              '  PADRE_INTERNO,'
              '  APODO,'
              '  V1,'
              '  V2,'
              '  V3,'
              '  V4,'
              '  V5,'
              '  V6,'
              '  EW,'
              '  DTA,'
              '  V7,'
              '  V8,'
              '  V9,'
              '  VUNO1,'
              '  TIPO_ALTA,'
              '  FECHA_ALTA,'
              '  OBSERVACION,'
              '  RESPONSABLE,'
              '  PRECIO_UNITARIO,'
              '  PRECIO_BRUTO,'
              '  GASTOS,'
              '  V10,'
              '  ACTIVIDAD,'
              '  ID_IE,'
              '  ADN,'
              '  TIPIFICACION_SANGUINEA,'
              '  CRIADOR,'
              '  PROPIETARIO,'
              '  ORIGEN_ANIMAL,'
              '  V11,'
              '  V12,'
              '  V13,'
              '  VUNO2'
              'from AUX_ANIMALES '
              'where'
              '  ID_ANIMAL = :ID_ANIMAL')
            ModifySQL.Strings = (
              'update AUX_ANIMALES'
              'set'
              '  ID_AUX = :ID_AUX,'
              '  ID_RP = :ID_RP,'
              '  ID_SENASA = :ID_SENASA,'
              '  ID_ANIMAL = :ID_ANIMAL,'
              '  ID_PC = :ID_PC,'
              '  ID_HBA = :ID_HBA,'
              '  ID_OTRO = :ID_OTRO,'
              '  SEXO = :SEXO'
              'where'
              '  ID_ANIMAL = :OLD_ID_ANIMAL')
            InsertSQL.Strings = (
              'insert into AUX_ANIMALES'
              
                '  (ID_AUX, ID_RP, ID_SENASA, ID_ANIMAL, ID_PC, ID_HBA, ID_OTRO, ' +
                'SEXO)'
              'values'
              
                '  (:ID_AUX, :ID_RP, :ID_SENASA, :ID_ANIMAL, :ID_PC, :ID_HBA, :ID' +
                '_OTRO, '
              '   :SEXO)')
          end
          inherited IBUSQLIntercambiarDer: TIBUpdateSQL
            RefreshSQL.Strings = (
              'Select *'
              'from Tab_Animales '
              'where'
              '  ID_ANIMAL = :ID_ANIMAL')
            ModifySQL.Strings = (
              'update Tab_Animales'
              'set'
              '  ID_ANIMAL = :ID_ANIMAL,'
              '  ID_RP = :ID_RP,'
              '  ID_SENASA = :ID_SENASA,'
              '  ID_PC = :ID_PC,'
              '  ID_HBA = :ID_HBA,'
              '  ID_OTRO = :ID_OTRO,'
              '  SEXO = :SEXO'
              'where'
              '  ID_ANIMAL = :OLD_ID_ANIMAL')
            InsertSQL.Strings = (
              'insert into Tab_Animales'
              '  (ID_ANIMAL, ID_RP, ID_SENASA, ID_PC, ID_HBA, ID_OTRO, SEXO)'
              'values'
              
                '  (:ID_ANIMAL, :ID_RP, :ID_SENASA, :ID_PC, :ID_HBA, :ID_OTRO, :S' +
                'EXO)')
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Height = 278
          Align = alClient
          Caption = 'Datos'
          object GroupBox1: TGroupBox
            Left = 2
            Top = 17
            Width = 343
            Height = 259
            Align = alLeft
            TabOrder = 0
            object Label1: TLabel
              Left = 10
              Top = 24
              Width = 74
              Height = 15
              Caption = 'Fecha de Fin:'
            end
            object Label2: TLabel
              Left = 241
              Top = 298
              Width = 74
              Height = 15
              Caption = 'Fecha de Fin:'
              Visible = False
            end
            object Label3: TLabel
              Left = 34
              Top = 301
              Width = 97
              Height = 15
              Caption = 'Cantidad de d'#237'as:'
              Visible = False
            end
            object LResponsable: TLabel
              Left = 12
              Top = 63
              Width = 78
              Height = 15
              Cursor = crHandPoint
              Caption = 'Responsable:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LResponsableClick
              OnMouseEnter = LResponsableMouseEnter
              OnMouseLeave = LResponsableMouseLeave
            end
            object DTPAFechaIni: TDateTimePickerAuto
              Left = 108
              Top = 20
              Width = 101
              Height = 21
              Date = 39694.635452650460000000
              Time = 39694.635452650460000000
              Color = 14679807
              TabOrder = 0
              OnChange = DTPAFechaIniChange
              OnExit = CapturarEvento
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DTPAFechaFin: TDateTimePickerAuto
              Left = 397
              Top = 294
              Width = 96
              Height = 21
              Date = 39694.635452650460000000
              Time = 39694.635452650460000000
              Color = clWhite
              TabOrder = 1
              Visible = False
              OnChange = DTPAFechaFinChange
              OnExit = CapturarEvento
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EACantDias: TEditAuto
              Left = 142
              Top = 297
              Width = 56
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 2
              Text = '0'
              Visible = False
              OnChange = EACantDiasChange
              OnExit = CapturarEvento
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAResponsable: TDBLookupComboBoxAuto
              Left = 106
              Top = 58
              Width = 156
              Height = 23
              Color = 14679807
              KeyField = 'ID_EMPLEADO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSResponsable
              TabOrder = 3
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object GBCategorias: TGroupBox
              Left = 2
              Top = 38
              Width = 339
              Height = 219
              Align = alBottom
              Caption = 'Categor'#237'as'
              TabOrder = 4
              object Label15: TLabel
                Left = 14
                Top = 20
                Width = 213
                Height = 15
                Caption = 'Cargar el peso promedio por categor'#237'a'
              end
              object SBCategorias: TScrollBox
                Left = 2
                Top = 72
                Width = 335
                Height = 145
                Align = alBottom
                AutoScroll = False
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
              end
            end
          end
          object GroupBox3: TGroupBox
            Left = 345
            Top = 17
            Width = 655
            Height = 259
            Align = alClient
            TabOrder = 1
            object Shape3: TShape
              Left = 154
              Top = 75
              Width = 174
              Height = 49
              Visible = False
            end
            object Shape2: TShape
              Left = 431
              Top = 75
              Width = 126
              Height = 49
              Visible = False
            end
            object Shape1: TShape
              Left = 327
              Top = 75
              Width = 105
              Height = 49
              Visible = False
            end
            object Label6: TLabel
              Left = 334
              Top = 80
              Width = 90
              Height = 16
              Caption = 'Kg MS/Cab/D'#237'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object Label5: TLabel
              Left = 76
              Top = 86
              Width = 59
              Height = 28
              Alignment = taCenter
              AutoSize = False
              Caption = 'Cantidad raci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
              WordWrap = True
            end
            object LSuplementacion: TLabel
              Left = 2
              Top = 17
              Width = 651
              Height = 15
              Align = alTop
              Caption = 'SELECCIONAR RACIONES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = LSuplementacionClick
            end
            object Label13: TLabel
              Left = 158
              Top = 80
              Width = 170
              Height = 18
              Alignment = taCenter
              AutoSize = False
              Caption = 'Consumo MS (% Peso Vivo)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
              Visible = False
              WordWrap = True
            end
            object LCantAnimales: TLabel
              Left = 11
              Top = 154
              Width = 148
              Height = 16
              Caption = 'Cantidad de Animales: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LAnimales: TLabel
              Left = 163
              Top = 154
              Width = 4
              Height = 16
              Caption = '-'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label7: TLabel
              Left = 437
              Top = 80
              Width = 117
              Height = 16
              Caption = 'Kg Tal Cual/Cab/D'#237'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object Label8: TLabel
              Left = 12
              Top = 135
              Width = 146
              Height = 15
              Alignment = taCenter
              Caption = 'Precio por Animal por d'#237'a:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LPrecioPorAnimal: TLabel
              Left = 163
              Top = 135
              Width = 101
              Height = 15
              AutoSize = False
              Caption = '-'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object LPorcMS: TLabel
              Left = 259
              Top = 40
              Width = 100
              Height = 15
              Cursor = crHandPoint
              AutoSize = False
              Caption = '-'
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentColor = False
              ParentFont = False
            end
            object Label4: TLabel
              Left = 388
              Top = 38
              Width = 134
              Height = 15
              Cursor = crHandPoint
              Caption = '<<Modificar raciones>>'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              OnClick = LSuplementacionClick
            end
            object DBLCBATipoSuplementacion: TDBLookupComboBoxAuto
              Left = 17
              Top = 37
              Width = 230
              Height = 23
              Color = 14679807
              KeyField = 'ID_RACION'
              ListField = 'NOMBRE'
              ListSource = DSRaciones
              TabOrder = 0
              OnCloseUp = DBLCBATipoSuplementacionCloseUp
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object SG1: TAdvStringGrid
              Left = 16
              Top = 176
              Width = 609
              Height = 201
              Cursor = crDefault
              BorderStyle = bsNone
              ColCount = 6
              DefaultRowHeight = 21
              DefaultDrawing = False
              FixedColor = 10868145
              FixedCols = 0
              RowCount = 2
              FixedRows = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLineWidth = 1
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 1
              Visible = False
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
              Look = glClassic
              HintColor = clInfoBk
              SelectionColor = 15387318
              SelectionTextColor = clBlack
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
              FixedColWidth = 183
              FixedRowHeight = 21
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clBlack
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
                183
                86
                78
                100
                79
                67)
            end
            object EAPorcentaje: TJvEdit
              Left = 156
              Top = 100
              Width = 169
              Height = 23
              EmptyValue = '0.00'
              Alignment = taCenter
              Modified = False
              OnMouseEnter = EAPorcentajeMouseEnter
              OnMouseLeave = EAPorcentajeMouseLeave
              Color = 10868145
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Visible = False
              OnChange = EAPorcentaje1Change
              OnExit = CapturarEvento
            end
            object EARacion: TJvEdit
              Left = 330
              Top = 100
              Width = 100
              Height = 23
              Alignment = taCenter
              Modified = False
              OnMouseLeave = EARacionMouseLeave
              Color = 10868145
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Visible = False
              OnChange = EARacion11Change
              OnExit = CapturarEvento
              OnMouseMove = EARacionMouseMove
            end
            object EARacion1: TJvEdit
              Left = 433
              Top = 100
              Width = 123
              Height = 23
              Alignment = taCenter
              Modified = False
              OnMouseEnter = EARacion1MouseEnter
              OnMouseLeave = EARacion1MouseLeave
              Color = 10868145
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              Visible = False
              OnChange = EARacion12Change
              OnExit = CapturarEvento
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 278
          Height = 72
          Align = alBottom
          ParentColor = False
          inherited MAObservacion: TMemoAuto
            Height = 53
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Height = 350
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              Title.Caption = 'RP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D1'
              Title.Caption = 'Fecha Fin'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'I3'
              Title.Caption = 'Cant. Dias'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'F3'
              Title.Caption = 'Cant. Raci'#243'n'
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V1'
              Title.Caption = 'Nombre de la Raci'#243'n'
              Width = 156
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F1'
              Title.Caption = 'Costo Unitario'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'F2'
              Title.Caption = 'Costo Total'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V2'
              Title.Caption = 'Responsable'
              Width = 139
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 159
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 350
        end
        inherited PanelDer: TPanel
          Height = 350
        end
      end
    end
    inherited PBotones: TPanel
      Top = 392
      inherited SBSelTodos: TSpeedButton
        Left = 538
      end
      inherited BBCancelar: TBitBtn
        Left = 613
      end
      inherited BBAnterior: TBitBtn
        Left = 711
      end
      inherited BBSiguiente: TBitBtn
        Left = 809
      end
      inherited BBTerminar: TBitBtn
        Left = 907
      end
      inherited PL: TPanel
        object BitBtn1: TBitBtn
          Left = 16
          Top = 40
          Width = 75
          Height = 25
          Caption = 'BitBtn1'
          TabOrder = 0
          Visible = False
          OnClick = BitBtn1Click
        end
      end
    end
  end
  inherited PTitulo: TPanel
    Top = 0
    Caption = 'Alimentaci'#243'n'
    inherited LTitulo: TLabel
      Caption = 'Alimentaci'#243'n'
    end
  end
  inherited Psocalo: TPanel
    Top = 539
  end
  inherited ALUniversal: TActionList
    Left = 587
    Top = 694
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 196
    Top = 647
  end
  inherited DSSimple: TDataSource
    Left = 104
    Top = 0
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_ANIMAL, ID_RP, ID_SENASA, FECHA, D1, I3, I1, V1, F3, F1, F' +
        '2, F4, OBSERVACION, '
      '   RESPONSABLE, V2, EW)'
      'values'
      
        '  (:ID_ANIMAL, :ID_RP, :ID_SENASA, :FECHA, :D1, :I3, :I1, :V1, :' +
        'F3, :F1, '
      '   :F2, :F4, :OBSERVACION, :RESPONSABLE, :V2, :EW)')
    RefreshSQL.Strings = (
      'Select '
      '  V7,'
      '  V10,'
      '  V6,'
      '  V5,'
      '  ID_SENASA,'
      '  V9,'
      '  V8,'
      '  V11,'
      '  ID_RP,'
      '  FECHA,'
      '  OBSERVACION,'
      '  RESPONSABLE,'
      '  V1,'
      '  V2,'
      '  NOMBRE,'
      '  V3,'
      '  V4,'
      '  I1,'
      '  I2,'
      '  I3,'
      '  D1,'
      '  D2,'
      '  D3,'
      '  ID_ANIMAL,'
      '  ID_AUX_EVENTO,'
      '  I4,'
      '  I5,'
      '  I6,'
      '  I7,'
      '  I8,'
      '  I9,'
      '  VUNO1,'
      '  VUNO2,'
      '  VUNO3,'
      '  VUNO4,'
      '  VUNO5,'
      '  VUNO6,'
      '  EW,'
      '  H1,'
      '  V12,'
      '  F1,'
      '  F2,'
      '  F3,'
      '  F4,'
      '  F5,'
      '  ID_PC,'
      '  ID_HBA,'
      '  ID_RA,'
      '  ID_OTRO,'
      '  APODO,'
      '  DTA_BAJA,'
      '  ID_IE'
      'from AUX_EVENTOS '
      'where'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      'SELECT ID_ANIMAL, '
      '              ID_RP, '
      '              ID_SENASA, '
      '              FECHA, '
      '              D1,'
      '              I3,'
      '              I1,'
      '              V1,'
      '              F3,'
      '              F1,'
      '              F2,'
      '              OBSERVACION ,'
      '              RESPONSABLE,'
      '              V2,'
      '              F4,'
      '              EW'
      'FROM AUX_EVENTOS')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  FECHA = :FECHA,'
      '  D1 = :D1,'
      '  I3 = :I3,'
      '  I1 = :I1,'
      '  V1 = :V1,'
      '  F3 = :F3,'
      '  F1 = :F1,'
      '  F2 = :F2,'
      '  F4 = :F4,'
      '  OBSERVACION = :OBSERVACION,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  V2 = :V2,'
      '  EW = :EW'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 74
    Top = 0
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_EVENTOS.ID_RP'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 10
    end
    object IBDSSimpleID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_EVENTOS.ID_SENASA'
      Size = 9
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
    end
    object IBDSSimpleD1: TDateField
      FieldName = 'D1'
      Origin = 'AUX_EVENTOS.D1'
      OnSetText = IBDSSimpleSetText
    end
    object IBDSSimpleI3: TIntegerField
      FieldName = 'I3'
      Origin = 'AUX_EVENTOS.I3'
      OnSetText = IBDSSimpleSetText
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleSetText
      Size = 100
    end
    object IBDSSimpleF3: TFloatField
      FieldName = 'F3'
      Origin = 'AUX_EVENTOS.F3'
      OnSetText = IBDSSimpleSetText
    end
    object IBDSSimpleF1: TFloatField
      FieldName = 'F1'
      Origin = 'AUX_EVENTOS.F1'
      OnSetText = IBDSSimpleSetText
    end
    object IBDSSimpleF2: TFloatField
      FieldName = 'F2'
      Origin = 'AUX_EVENTOS.F2'
    end
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      Size = 255
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleSetText
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleF4: TFloatField
      FieldName = 'F4'
      Origin = 'AUX_EVENTOS.F4'
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 296
    Top = 686
  end
  inherited IBQValidaciones: TIBQuery
    Left = 268
    Top = 2
  end
  inherited IBQEvento: TIBQuery
    Left = 236
    Top = 1
  end
  inherited SDXLS: TSaveDialog
    Left = 262
    Top = 653
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'ID_RP'
        Title = 'RP Animal'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha Inicio'
      end
      item
        DataField = 'D1'
        Title = 'Fecha Fin'
      end
      item
        DataField = 'I3'
        Title = 'Cant. D'#237'as'
      end
      item
        DataField = 'F3'
        Title = 'Cant. Raci'#243'n'
      end
      item
        DataField = 'V1'
        Title = 'Tipo de Suplementaci'#243'n'
      end
      item
        DataField = 'F1'
        Title = 'Costo Unitario'
      end
      item
        DataField = 'F2'
        Title = 'Costo Total'
      end
      item
        DataField = 'V2'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end>
    Title.Text = 'Evento Suplementaci'#243'n'
    Left = 224
    Top = 649
  end
  inherited WinXP1: TWinXP
    Left = 552
    Top = 640
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 372
    Top = 655
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 412
    Top = 647
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 444
    Top = 639
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 332
    Top = 655
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 516
    Top = 639
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select result, mensaje from rn_suplementacion(:animal,:fecha,:es' +
        'tablecimiento)')
    Left = 560
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 656
    Top = 14
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_SUPLEMENTACION(:FECHA_INI,:FECHA_FIN,:ANIMA' +
        'L,:OBSERVACION,:ESTABLECIMIENTO,:RESPONSABLE,:LOG_USUARIO,:LOG_F' +
        'ECHA_MODIFICADO,:ID_GRUPO,:DISPARADOR,:CANT_DIAS,:TIPO_SUPLEMENT' +
        'ACION,:CANT_RACION,:COSTO_UNITARIO,:COSTO_TOTAL)')
    Left = 592
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_INI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESPONSABLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOG_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOG_FECHA_MODIFICADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANT_DIAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_SUPLEMENTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANT_RACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COSTO_UNITARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COSTO_TOTAL'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 624
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 476
    Top = 639
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 204
    Top = 1
  end
  inherited PLVersion: TPngImageList
    Left = 312
    Top = 120
  end
  inherited IBSPActEventos: TIBStoredProc
    Left = 300
    Top = 655
  end
  inherited OpenDlg: TOpenDialog
    Left = 148
    Top = 656
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 620
    Top = 656
  end
  inherited IBQRepetidos: TIBQuery
    Left = 692
    Top = 654
  end
  inherited IBQImportacion: TIBQuery
    Left = 404
  end
  inherited IBQIE: TIBQuery
    Left = 724
    Top = 661
  end
  inherited ODArchivoGes: TOpenDialog
    Top = 549
  end
  inherited ODVesta: TOpenDialog
    Top = 549
  end
  inherited ILVets: TImageList
    Left = 836
    Top = 76
  end
  inherited IBQCarElect: TIBQuery
    Left = 308
    Top = 215
  end
  object IBQAuxPorcMS: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select porc_ms from cod_tipos_suplementaciones where id_tipo_sup' +
        'lementacion = :id')
    Left = 892
    Top = 286
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQCantCategoria: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select count(ta.id_animal) as cant, ta.categoria as categ, cc.no' +
        'mbre as nombre from tab_animales ta join aux_animales aa on aa.i' +
        'd_animal = ta.id_animal join cod_categorias cc on ta.categoria =' +
        ' cc.id_categoria group by ta.categoria, cc.nombre')
    Left = 308
    Top = 180
  end
  object IBQRaciones: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQRacionesAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_racion where visible = '#39'S'#39' order by nombre')
    Left = 760
    Top = 657
  end
  object DSRaciones: TDataSource
    DataSet = IBQRaciones
    Left = 528
    Top = 89
  end
  object IBQSuplementosRac: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cts.id_tipo_suplementacion, rrs.id_suplemento, cts.precio' +
        ', rrs.porcentaje, cts.porc_ms, cts.nombre, cts.cantidad from rel' +
        '_racion_suplemento rrs join cod_tipos_suplementaciones cts on ct' +
        's.id_tipo_suplementacion = rrs.id_suplemento  where id_racion = ' +
        ':racion')
    Left = 560
    Top = 41
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'racion'
        ParamType = ptUnknown
      end>
  end
  object IBQPesoPromCateg: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select avg(peso) as prom from tab_animales  where categoria = :c' +
        'ategoria and activo = '#39'S'#39' and id_animal in (select id_animal fro' +
        'm aux_animales)')
    Left = 310
    Top = 149
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'categoria'
        ParamType = ptUnknown
      end>
  end
  object IBQInsertIndAux: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'insert into aux_animales (id_aux,id_animal) values (1,:animal)')
    Left = 592
    Top = 43
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
  end
  object IBQSPMovimientoAlimentacion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'execute procedure SP_MOVIMIENTO_ALIMENTACION(:ALIMENTO,:TIPO, :F' +
        'ECHA, :COSTO, :CANTIDAD, :TIPO_MOVIMIENTO)')
    Left = 928
    Top = 281
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ALIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANTIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_MOVIMIENTO'
        ParamType = ptUnknown
      end>
  end
  object IBQueryfecha: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1
    CachedUpdates = False
    SQL.Strings = (
      
        '  SELECT   first 1 EVE.FECHA   from AUX_ANIMALES aux ,tab_animal' +
        'es ani'
      
        '           JOIN EVE_EVENTOS EVE ON EVE.ANIMAL=AUX.ID_ANIMAL  and' +
        ' ani.id_animal=aux.id_animal'
      'join eve_suplementacion sup on sup.id_evento=eve.id_evento'
      '           AND (EVE.TIPO=45 ) '
      'and (ani.potrero=eve.potrero or eve.potrero=0) and'
      '( (eve.log_fecha_modificado< :diaact) or'
      '  (eve.log_fecha_modificado= :diaact and eve.fecha <:fectran))'
      '           order by   eve.fecha  desc'
      '           ')
    Left = 928
    Top = 329
    ParamData = <
      item
        DataType = ftDate
        Name = 'diaact'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'diaact'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fectran'
        ParamType = ptInput
      end>
  end
  object IBQuerying: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1
    CachedUpdates = False
    SQL.Strings = (
      'SELECT     EVE.FECHA ,eve.tipo, ani.potrero'
      '         FROM AUX_ANIMALES aux ,tab_animales ani'
      
        '           JOIN EVE_EVENTOS EVE ON EVE.ANIMAL=AUX.ID_ANIMAL  and' +
        ' ani.id_animal=aux.id_animal'
      '           AND (  eve.tipo=44'
      '                or eve.tipo= 5'
      '                 or eve.tipo=2)'
      'and'
      '( (eve.log_fecha_modificado< :dia2) or'
      '  (eve.log_fecha_modificado= :dia2 and eve.fecha <= :fect2))'
      ''
      '            order by    eve.fecha  desc ,eve.tipo desc'
      ''
      '           ')
    Left = 872
    Top = 337
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dia2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dia2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'fect2'
        ParamType = ptInput
      end>
  end
end
