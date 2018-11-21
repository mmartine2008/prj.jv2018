inherited FEveRecursoForrajero: TFEveRecursoForrajero
  Left = 117
  Top = 70
  Caption = 'Recurso Forrajero'
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
  inherited PError: TPageControl
    Top = 634
    Height = 90
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Height = 61
      end
    end
  end
  inherited PDatos: TPanel
    Height = 547
    inherited PCBasico: TPageControl
      Height = 465
      ActivePage = TSDatos
      TabOrder = 0
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Height = 423
        end
        inherited MSimple: TMangazo
          Height = 423
          inherited PSeleccion: TPanel
            Height = 117
            inherited GBDisponibles: TGroupBox
              Height = 219
              inherited IFondoDis: TImage
                Height = 200
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 200
              end
            end
            inherited GBSeleccionados: TGroupBox
              Height = 219
              inherited IFondoSel: TImage
                Height = 200
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Height = 200
              end
            end
            inherited PTransferencia: TPanel
              Height = 219
              inherited IFondo: TImage
                Height = 219
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
          end
          inherited GBFiltros: TGroupBox
            Top = 190
          end
          inherited Panel1: TPanel
            Top = 169
            inherited Label1: TLabel
              Width = 142
              Height = 16
            end
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Left = 534
          Top = 95
          Width = 284
          Height = 87
          Align = alNone
        end
        inherited GBObservaciones: TGroupBox
          Left = 646
          Top = 250
          Width = 190
          Height = 52
          Align = alNone
          Visible = False
          inherited MAObservacion: TMemoAuto
            Width = 186
            Height = 33
          end
        end
        object JvDatosPotrero: TJvRollOut
          Left = 0
          Top = 0
          Width = 1002
          Height = 139
          Align = alTop
          Caption = 'Datos Potrero'
          Colors.ButtonBottom = clGreen
          Colors.ButtonTop = clTeal
          Colors.ButtonColor = clMoneyGreen
          Colors.Color = clWhite
          Colors.FrameBottom = clWhite
          Colors.FrameTop = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          FAWidth = 145
          FAHeight = 139
          FCWidth = 22
          FCHeight = 22
          object GBDatosComunes: TGroupBox
            Left = 1
            Top = 21
            Width = 1000
            Height = 117
            Align = alClient
            Color = clWhite
            ParentColor = False
            TabOrder = 0
            object Shape2: TShape
              Left = 520
              Top = 28
              Width = 465
              Height = 85
              Brush.Style = bsClear
              Visible = False
            end
            object Shape1: TShape
              Left = 3
              Top = 39
              Width = 486
              Height = 74
              Brush.Style = bsClear
            end
            object Label1: TLabel
              Left = 19
              Top = 13
              Width = 51
              Height = 16
              Cursor = crHandPoint
              Caption = 'Potrero:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Layout = tlCenter
              OnClick = Label1Click
              OnMouseEnter = Label1MouseEnter
              OnMouseLeave = Label1MouseLeave
            end
            object LSupTotal: TLabel
              Left = 12
              Top = 43
              Width = 56
              Height = 15
              Caption = 'Sup. Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LSupGanadera: TLabel
              Left = 170
              Top = 43
              Width = 83
              Height = 15
              Caption = 'Sup. Ganadera'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LSupAgricola: TLabel
              Left = 340
              Top = 43
              Width = 75
              Height = 15
              Caption = 'Sup. Agr'#237'cola'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LRecursoForrajeroActual: TLabel
              Left = 12
              Top = 91
              Width = 103
              Height = 15
              Caption = 'Recurso Forrajero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LValorSupTotal: TLabel
              Left = 118
              Top = 43
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object LValorSupGanadera: TLabel
              Left = 260
              Top = 43
              Width = 4
              Height = 15
              Caption = '-'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object LValorSupAgricola: TLabel
              Left = 429
              Top = 43
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object LValorRecursoForrajeroActual: TLabel
              Left = 118
              Top = 91
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object LTerneros: TLabel
              Left = 526
              Top = 50
              Width = 52
              Height = 15
              Caption = 'Terneros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object LTerneras: TLabel
              Left = 526
              Top = 71
              Width = 52
              Height = 15
              Caption = 'Terneras'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object LVaquillonas: TLabel
              Left = 527
              Top = 91
              Width = 66
              Height = 15
              Caption = 'Vaquillonas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object LVacas: TLabel
              Left = 755
              Top = 50
              Width = 36
              Height = 15
              Caption = 'Vacas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object LNovillos: TLabel
              Left = 755
              Top = 71
              Width = 44
              Height = 15
              Caption = 'Novillos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object LToros: TLabel
              Left = 755
              Top = 91
              Width = 33
              Height = 15
              Caption = 'Toros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object LCantTerneros: TLabel
              Left = 638
              Top = 50
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCantTerneras: TLabel
              Left = 638
              Top = 71
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCantVaquillonas: TLabel
              Left = 638
              Top = 91
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCantVacas: TLabel
              Left = 860
              Top = 50
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCantNovillos: TLabel
              Left = 860
              Top = 71
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCantToros: TLabel
              Left = 860
              Top = 91
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCabTerneros: TLabel
              Left = 707
              Top = 50
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCabTerneras: TLabel
              Left = 707
              Top = 71
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCabVaquillonas: TLabel
              Left = 707
              Top = 91
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCabVacas: TLabel
              Left = 943
              Top = 50
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCabNovillos: TLabel
              Left = 943
              Top = 71
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object LCabToros: TLabel
              Left = 943
              Top = 91
              Width = 4
              Height = 15
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object Label4: TLabel
              Left = 615
              Top = 29
              Width = 50
              Height = 15
              Caption = 'Cantidad'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label5: TLabel
              Left = 690
              Top = 29
              Width = 38
              Height = 15
              Caption = 'cab/ha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label6: TLabel
              Left = 837
              Top = 29
              Width = 50
              Height = 15
              Caption = 'Cantidad'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label7: TLabel
              Left = 925
              Top = 29
              Width = 38
              Height = 15
              Caption = 'cab/ha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Shape3: TShape
              Left = 522
              Top = 45
              Width = 462
              Height = 2
              Brush.Style = bsClear
            end
            object Shape4: TShape
              Left = 675
              Top = 47
              Width = 2
              Height = 63
              Brush.Style = bsClear
              Visible = False
            end
            object Label8: TLabel
              Left = 527
              Top = 29
              Width = 55
              Height = 15
              Caption = 'Categor'#237'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label9: TLabel
              Left = 754
              Top = 29
              Width = 55
              Height = 15
              Caption = 'Categor'#237'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Shape5: TShape
              Left = 604
              Top = 47
              Width = 2
              Height = 64
              Brush.Style = bsClear
              Visible = False
            end
            object Shape6: TShape
              Left = 742
              Top = 30
              Width = 2
              Height = 80
              Brush.Style = bsClear
              Visible = False
            end
            object Shape7: TShape
              Left = 822
              Top = 45
              Width = 2
              Height = 67
              Brush.Style = bsClear
              Visible = False
            end
            object Shape8: TShape
              Left = 907
              Top = 46
              Width = 2
              Height = 65
              Brush.Style = bsClear
              Visible = False
            end
            object Lcabhatotal: TLabel
              Left = 12
              Top = 67
              Width = 66
              Height = 15
              Caption = 'cab/ha total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LValorcabhatotal: TLabel
              Left = 118
              Top = 67
              Width = 4
              Height = 15
              Caption = '-'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8420704
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label3: TLabel
              Left = 519
              Top = 8
              Width = 109
              Height = 16
              Caption = 'Existencia Actual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object DBLCBAPotrero: TDBLookupComboBoxAuto
              Left = 100
              Top = 10
              Width = 199
              Height = 24
              Color = 14679807
              DropDownRows = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              KeyField = 'ID_POTRERO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSPotrero
              ParentFont = False
              TabOrder = 0
              OnCloseUp = DBLCBAPotreroCloseUp
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
            object PExistencia: TPanel
              Left = 490
              Top = 10
              Width = 503
              Height = 103
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 1
              object DBExistencia: TDBGrid
                Left = 0
                Top = 0
                Width = 503
                Height = 103
                Align = alClient
                BorderStyle = bsNone
                DataSource = DSGetStockPotNuevo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = 'Arial'
                TitleFont.Style = [fsBold]
                Columns = <
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CAT_ANIM_1'
                    Title.Alignment = taCenter
                    Title.Caption = 'Categor'#237'a'
                    Title.Color = clWhite
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = [fsBold]
                    Width = 139
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CANTANIMALES_1'
                    Title.Alignment = taCenter
                    Title.Caption = 'Cantidad'
                    Title.Color = clWhite
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = [fsBold]
                    Width = 60
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CABANIMALES_1'
                    Title.Alignment = taCenter
                    Title.Caption = 'Cab/ha'
                    Title.Color = clWhite
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = [fsBold]
                    Width = 52
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    Title.Alignment = taCenter
                    Title.Color = clWhite
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = [fsBold]
                    Width = 16
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CAT_ANIM_2'
                    Title.Alignment = taCenter
                    Title.Caption = 'Categor'#237'a'
                    Title.Color = clWhite
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = [fsBold]
                    Width = 114
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CANTANIMALES_2'
                    Title.Alignment = taCenter
                    Title.Caption = 'Cantidad'
                    Title.Color = clWhite
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = [fsBold]
                    Width = 63
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CABANIMALES_2'
                    Title.Alignment = taCenter
                    Title.Caption = 'Cab/ha'
                    Title.Color = clWhite
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Arial'
                    Title.Font.Style = [fsBold]
                    Width = 54
                    Visible = True
                  end>
              end
            end
          end
        end
        object JVEventos: TJvRollOut
          Left = 0
          Top = 139
          Width = 1002
          Height = 224
          Align = alTop
          Caption = 'Eventos'
          Colors.ButtonBottom = clGreen
          Colors.ButtonTop = clTeal
          Colors.ButtonColor = clMoneyGreen
          Colors.Color = clWhite
          Colors.FrameBottom = clWhite
          Colors.FrameTop = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          FAWidth = 145
          FAHeight = 224
          FCWidth = 22
          FCHeight = 22
          object GBEventos: TGroupBox
            Left = 1
            Top = 21
            Width = 1000
            Height = 202
            Align = alClient
            Color = clWhite
            ParentColor = False
            TabOrder = 0
            object LFecha: TLabel
              Left = 11
              Top = 14
              Width = 46
              Height = 23
              AutoSize = False
              Caption = 'Fecha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object LResponsable: TLabel
              Left = 423
              Top = 18
              Width = 81
              Height = 16
              Cursor = crHandPoint
              Caption = 'Responsable'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Layout = tlCenter
              OnClick = LResponsableClick
              OnMouseEnter = LResponsableMouseEnter
              OnMouseLeave = LResponsableMouseLeave
            end
            object Label2: TLabel
              Left = 441
              Top = 52
              Width = 118
              Height = 16
              Cursor = crHandPoint
              Caption = 'Recurso Forrajero:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Layout = tlCenter
              OnClick = Label2Click
              OnMouseEnter = Label2MouseEnter
              OnMouseLeave = Label2MouseLeave
            end
            object Lha: TLabel
              Left = 359
              Top = 54
              Width = 32
              Height = 17
              AutoSize = False
              Caption = 'ha'
              Enabled = False
              Layout = tlCenter
            end
            object Lha2: TLabel
              Left = 360
              Top = 110
              Width = 35
              Height = 18
              AutoSize = False
              Caption = 'ha'
              Enabled = False
              Layout = tlCenter
            end
            object LCantidadha: TLabel
              Left = 46
              Top = 109
              Width = 97
              Height = 16
              Caption = 'Cantidad de ha'
              Enabled = False
            end
            object LKgMsHa: TLabel
              Left = 849
              Top = 88
              Width = 70
              Height = 22
              AutoSize = False
              Caption = 'Kg/MS/Ha'
              Enabled = False
              Layout = tlCenter
            end
            object Shape9: TShape
              Left = -7
              Top = 43
              Width = 1006
              Height = 2
              Brush.Style = bsClear
            end
            object LCantidadReservas: TLabel
              Left = 575
              Top = 156
              Width = 60
              Height = 18
              AutoSize = False
              Caption = 'Cantidad'
              Enabled = False
              Layout = tlCenter
            end
            object LProduccionReservasForrajeras: TLabel
              Left = 431
              Top = 119
              Width = 222
              Height = 16
              Cursor = crHandPoint
              Caption = 'Producci'#243'n de Reservas Forrajeras'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Layout = tlCenter
              OnClick = LProduccionReservasForrajerasClick
              OnMouseEnter = LProduccionReservasForrajerasMouseEnter
              OnMouseLeave = LProduccionReservasForrajerasMouseLeave
            end
            object LTratamientos: TLabel
              Left = 29
              Top = 144
              Width = 83
              Height = 16
              Cursor = crHandPoint
              Caption = 'Tratamientos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
              Layout = tlCenter
              OnClick = LTratamientosClick
              OnMouseEnter = LTratamientosMouseEnter
              OnMouseLeave = LTratamientosMouseLeave
            end
            object DTPAFecha: TDateTimePickerAuto
              Left = 186
              Top = 14
              Width = 168
              Height = 24
              Date = 38657.411226122680000000
              Time = 38657.411226122680000000
              Color = 14679807
              TabOrder = 0
              OnChange = DTPAFechaChange
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
            object DBLCBAResponsable: TDBLookupComboBoxAuto
              Left = 678
              Top = 14
              Width = 163
              Height = 24
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_EMPLEADO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSResponsable
              TabOrder = 1
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
            object DBLCBARecursoF: TDBLookupComboBoxAuto
              Left = 664
              Top = 50
              Width = 162
              Height = 24
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_RECURSO_FORRAJERO'
              ListField = 'SINONIMO'
              ListSource = DSRecursoF
              TabOrder = 2
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object CBModificacionSuperficie: TCheckBox
              Left = 10
              Top = 52
              Width = 170
              Height = 18
              Caption = 'Modificaci'#243'n Superficie'
              TabOrder = 3
              OnClick = CBModificacionSuperficieClick
            end
            object EASuperficie: TEditAuto
              Tag = 2
              Left = 186
              Top = 52
              Width = 168
              Height = 24
              CharCase = ecUpperCase
              Color = clWhite
              Enabled = False
              MaxLength = 6
              TabOrder = 4
              OnChange = EASuperficieChange
              OnExit = EASuperficieExit
              OnKeyPress = EASuperficieKeyPress
              OnKeyUp = EASuperficieKeyUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object CBCambioRecursoForrajero: TCheckBox
              Left = 406
              Top = 52
              Width = 15
              Height = 18
              Caption = 'Cambio Recurso Forrajero'
              TabOrder = 5
              OnClick = CBCambioRecursoForrajeroClick
            end
            object CBAsignacionHectareas: TCheckBox
              Left = 10
              Top = 83
              Width = 167
              Height = 18
              Caption = 'Asignaci'#243'n del Potrero'
              TabOrder = 6
              OnClick = CBAsignacionHectareasClick
            end
            object EACantidadha: TEditAuto
              Tag = 2
              Left = 184
              Top = 107
              Width = 169
              Height = 24
              CharCase = ecUpperCase
              Color = clWhite
              Enabled = False
              MaxLength = 6
              TabOrder = 7
              OnChange = EACantidadhaChange
              OnExit = EASuperficieExit
              OnKeyPress = EASuperficieKeyPress
              OnKeyUp = EACantidadhaKeyUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object CBAsignacionPotrero: TComboBox
              Left = 186
              Top = 81
              Width = 169
              Height = 24
              AutoComplete = False
              Style = csDropDownList
              Color = clWhite
              Enabled = False
              ItemHeight = 16
              ItemIndex = 0
              TabOrder = 8
              Text = 'Ganader'#237'a'
              OnChange = CBAsignacionPotreroChange
              OnKeyPress = CBAsignacionPotreroKeyPress
              Items.Strings = (
                'Ganader'#237'a'
                'Agricultura')
            end
            object CBTratamientosPotreros: TCheckBox
              Left = 10
              Top = 144
              Width = 15
              Height = 18
              Caption = 'Tratamientos'
              TabOrder = 9
              OnClick = CBTratamientosPotrerosClick
            end
            object DBLCBATratamientosPotreros: TDBLookupComboBoxAuto
              Left = 186
              Top = 142
              Width = 169
              Height = 24
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_POTREROS_TRATAMIENTOS'
              ListField = 'SINONIMO'
              ListSource = DSPotrerosTratamientos
              TabOrder = 10
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object CBMedicionMateriaSeca: TCheckBox
              Left = 406
              Top = 88
              Width = 195
              Height = 18
              Caption = 'Medici'#243'n de Materia Seca'
              TabOrder = 11
              OnClick = CBMedicionMateriaSecaClick
            end
            object EAMateriaSeca: TEditAuto
              Tag = 2
              Left = 664
              Top = 80
              Width = 162
              Height = 24
              CharCase = ecUpperCase
              Color = clWhite
              Enabled = False
              MaxLength = 6
              TabOrder = 12
              OnExit = EASuperficieExit
              OnKeyPress = EASuperficieKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object CBAnalisisSuelo: TCheckBox
              Left = 10
              Top = 175
              Width = 141
              Height = 19
              Caption = 'An'#225'lisis de Suelos'
              TabOrder = 13
              OnClick = CBAnalisisSueloClick
            end
            object MAnalisisSuelos: TMemo
              Left = 186
              Top = 170
              Width = 169
              Height = 27
              Enabled = False
              TabOrder = 14
            end
            object CBProdReservasForrajeras: TCheckBox
              Left = 406
              Top = 119
              Width = 16
              Height = 19
              Caption = 'Producci'#243'n de Reservas Forrajeras'
              TabOrder = 15
              OnClick = CBProdReservasForrajerasClick
            end
            object DBLCBAReservasForrajeras: TDBLookupComboBoxAuto
              Left = 664
              Top = 117
              Width = 162
              Height = 24
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_RESERVAS_FORRAJERAS'
              ListField = 'SINONIMO'
              ListSource = DSCodReservasForrajeras
              TabOrder = 16
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object EACantidadReservas: TEditAuto
              Tag = 2
              Left = 665
              Top = 153
              Width = 161
              Height = 24
              CharCase = ecUpperCase
              Color = clWhite
              Enabled = False
              MaxLength = 6
              TabOrder = 17
              OnExit = EASuperficieExit
              OnKeyPress = EASuperficieKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object CBUnidadesReservas: TComboBox
              Left = 835
              Top = 153
              Width = 118
              Height = 24
              AutoComplete = False
              Style = csDropDownList
              Color = clWhite
              Enabled = False
              ItemHeight = 16
              ItemIndex = 0
              TabOrder = 18
              Text = 'unidades'
              OnKeyPress = CBUnidadesReservasKeyPress
              Items.Strings = (
                'unidades'
                'kg')
            end
          end
        end
        object JVFichaPotrero: TJvRollOut
          Left = 0
          Top = 363
          Width = 1002
          Height = 60
          Align = alClient
          Caption = 'Ficha del potrero'
          Colors.ButtonBottom = clGreen
          Colors.ButtonTop = clTeal
          Colors.ButtonColor = clMoneyGreen
          Colors.Color = clWhite
          Colors.FrameBottom = clWhite
          Colors.FrameTop = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          FAWidth = 145
          FAHeight = 60
          FCWidth = 22
          FCHeight = 83
          object GBFichaPotrero: TGroupBox
            Left = 1
            Top = 21
            Width = 844
            Height = 38
            Align = alClient
            Color = clWhite
            ParentColor = False
            TabOrder = 0
            object BDBGAnimales: TBitDBGrid
              Left = 2
              Top = 18
              Width = 840
              Height = 18
              Align = alClient
              DataSource = DSRepFichaPotrero
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
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
                  FieldName = 'FECHA'
                  Title.Caption = 'Fecha'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EVENTOREALIZADO'
                  Title.Caption = 'Eventos Realizados'
                  Width = 604
                  Visible = True
                end>
            end
          end
          object PParaEliminar: TPanel
            Left = 845
            Top = 21
            Width = 156
            Height = 38
            Align = alRight
            Color = clWhite
            TabOrder = 1
            object JvIEliminar: TJvImage
              Left = 16
              Top = 20
              Width = 30
              Height = 30
              Cursor = crHandPoint
              AutoSize = True
              Center = True
              Picture.Data = {
                0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001E00
                00001E08060000003B30AEA20000001974455874536F6674776172650041646F
                626520496D616765526561647971C9653C0000057E4944415478DAED96DB6F54
                5514877FE77E663AEDCCF436ADEDD0A9147A715AA7A02001A440D01851AA2F24
                18130989896FE53FF0CD378B89894F86F2803E68407DD284488DA1C8A5B791DE
                B0B453DAD2FB65A6EDCCB91FD74CA96899A96D35F1C595AC9C3D67EFB3BEB5D6
                5E7BED61F01F09F33F7823F9A9B2B6D113304EB9FD7A03272220E558A9F76A8C
                85A921121D155A1723FCA52303BFB6FE2B600236F8AAB48B457BB8806377105C
                511D989CD25503820376621E56740CD6DC6F88F7DCC1DC7DA175BC5B3A4F0E74
                6D1B7C33146C2EDF9F68F21E3E04AE6C1FACD9086C35463336185E4CADB19525
                72200B9073C0E6FA61F47E8FC58E5E44EECAE75F6AEFB9B06570D7E1EA8BFEA0
                F65EF689D314D532ECA52970FE60E60F0C15E6783F18AF3F655969FB16C39D52
                4BE8E7BEB39B06B7D5059B77D6294DEE57DE80353108AE3800C695BB999D8135
                330A6B290AC6E142ECE60D447AA5B3FB3B7A5AFE169CDCD31D15EAF582501959
                3121D4EC05047153D035B1630B302746294B0B587C30B5F8A057AEA73D8F6C08
                EEDE5F733D10501B9263F1D0312A24CF96A06B620E0FC2E80BA7C6A3A3624BB0
                ED49CA9F0253B4217FB1D699EB36C0EDDA0D7E57E5B6A06BA2DF6AA36A9FC37C
                94C7E88458BE16753A70735D79BC09020FE9C8614AB1F08FC0D6FC3CC1EFA6C6
                E161E75902B7A405773D5F73BDCCAB3670811270D515B086E6C0384BB705B5CD
                49B0256E18B7BAC88128C6A2624B6DE76ABA9F02876BABED529706E140104C76
                16CCF01472AE5CDB1638D6780C5CA818D6C8248C81114CC785D6AAEEFEA369C1
                FDC12ABB5030C0D79681ABAF81793B82EC2FBEDB1678E9CC9BE0EA7CD07FB907
                EBE12CA226D75A1E1E480FEEA9A9B68B391DFCC14AB0F96E987DB3C8F9FA87ED
                45FCF609B0D5F914F13465EE21A216817B32803B2A6B86038C16E05F78166CA0
                0066D7185C9F5D065B5AB225A835368EE50FDEA15497C2B8F380E0B378688BAD
                A181DEF4E05B95CF5DAD30D54626D705F1E41EBA7A0C98F71E6D3D5C89A7E358
                9822A8576E039A81214EBAF0E240CFF9B4603A4E4D1586DA2CDB16C4D7F7807D
                66736D329318ED43303A86A0302C0679E92D3A4EDF64027BBCA6B950626854D5
                0E48A70F92F7DB3BCB762C0EEDEAEDE4088F1433121CEC2B5F9BCBD4AB9B2B15
                A549DE5D04703C8457435BA7AA3AB4AFDAC0EEC843A2670C030C9FBC9FFFB822
                33813D2ED31ADE19C85D6DD2D4BDC4D7F66E3E524583FE63188C5B8639308191
                65ADAB7EB0B7FECF6B325E8BC99EED35CCCE1D813CB0E5F9B0A757C0BF4C4D45
                DE38ED76344EE7B60FAC3F1746DB7D8C2FA98BF33C7F74FDBF918C60CBB27023
                B4EF9C279EF8B834D799C31FDC057B5925B04C059747D164FD75FDD422EC1952
                4DA12B4D8071BD17E3BA158DBADDC70FB5DF6C5F6F9F4907D4745DD434CDABAA
                6AFEC4E7970EA897BFFCC8178DE5E754F8A813F9A9E8E49413AC6F7527CC9119
                72C6032B32438D620C4B5351CC1417F539DF3FF761C1A9936149926645518C4A
                A2A8670413505454B5309148F81209C5977C2A8AE25BFAE4D346675738E85D58
                CCCA322D48C54FEE685BA3429A5BC10AC762C1EB59518E1FBDE17AF7CC355976
                4C391C32A963CA494F72605A1004332D58D5344955545F3C054E1425E14A72AC
                2845A485466F7F80E9EA2E6527275D5242E14DB2A07B3C9A555C1463AA2A1FF1
                35D5C30E594E011F832757C10EFA9D02EB69C1866140D70DA7AAA9F98AA21650
                B40594F23CD2DC64FA354D77D31A97699AB265D97C326096650C8EE31382C02F
                93E1A824890B14DD5C5265599E25E00CA57996E6148EE3362E2E8233BAAE4BBA
                A1BB689C6DE8BA5B378C2C023A57A19660DB76EA7B86612C96657532AAF03C1F
                272507F8188192BA22F0BC46EFEC4D55F57A21184360CEB62C9622E508CADA78
                0C4612CCD8E480C9729CC9B1ACB51EB45E7E0769399B3D0A45B0E20000000049
                454E44AE426082}
              Visible = False
              OnClick = AEliminarExecute
            end
            object LEliminar: TLabel
              Left = 53
              Top = 26
              Width = 53
              Height = 16
              Cursor = crHandPoint
              Caption = 'Eliminar'
              Visible = False
              OnClick = AEliminarExecute
            end
            object BEliminar: TBitBtn
              Left = 26
              Top = 19
              Width = 86
              Height = 33
              Action = AEliminar
              Caption = 'Eliminar'
              TabOrder = 0
              Glyph.Data = {
                62030000424D6203000000000000420000002800000014000000140000000100
                10000300000020030000120B0000120B00000000000000000000007C0000E003
                00001F000000FF7FFF7F5A6B3967396739673967396739673967396739673967
                39673967396739675A6BFF7FFF7FFF7FFF7F18637B6F5A6B5A6B5A6B5A6B5A6B
                5A6B5A6B5A6B5A6B5A6B5A6B5A6B7B6FF75EFF7FFF7FFF7FFF7F1863BD779C73
                9C739C739C739C739C739C739C739C739C739C739C73BD77F75EFF7FFF7FFF7F
                FF7F1863BD779C739C737B6F7B6F7B6F9C739C739C739C739C739C739C73BD77
                F75EFF7FFF7FFF7FFF7F1863BD779C739C739C739C739C739C6F9C6F9C6F9C6F
                7B6F7B6F7B6FBD77F75EFF7FFF7FFF7FFF7F1863DE7B9C739C739C739C737B6F
                08598454A55484548454635463548458315AFF7FFF7FFF7FFF7F1863DE7BBD77
                BD77BD77BD737B6FC66442606364636463646364636463643162FF7FFF7FFF7F
                FF7F1863DE7BBD77BD77BD77BD777B73947A947A947A947A947A947A947AB57E
                B56AFF7FFF7FFF7FFF7F1863DE7BBD77BD77BD77BD77BD775A735A7339733973
                5A735A735A737B7BD65EFF7FFF7FFF7FFF7F1863FF7FBD77BD77BD77BD77DE77
                BD77BD73BD73BD73BD73BD73BD73FF7BF75EFF7FFF7FFF7FFF7F1863FF7FDE7B
                DE7BDE7BDE7BDE7BBD77BD77BD77BD77BD77BD77BD77FF7FF75EFF7FFF7FFF7F
                FF7F1863FF7FDE7BDE7BDE7BDE7BDE7BDE7BBD77BD77BD77BD77BD77BD77FF7F
                F75EFF7FFF7FFF7FFF7F1863FF7FDE7BDE7BDE7BDE7BDE7BDE7BDE7BBD77BD77
                BD77BD77BD77FF7FF75EFF7FFF7FFF7FFF7F1863FF7FDE7BDE7BDE7BDE7BDE7B
                DE7BDE7BBD77BD77BD77BD77BD77FF7FF75EFF7FFF7FFF7FFF7F1863FF7FDE7B
                DE7BDE7BDE7BDE7BDE7BDE7BDE7BBD77BD77BD77DE7B39677B6FFF7FFF7FFF7F
                FF7F1863FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FBD77DE7BFF7F5A6B7B6F
                FF7FFF7FFF7FFF7FFF7F1863FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FBD77
                FF7F5A6B7B6FFF7FFF7FFF7FFF7FFF7FFF7F3967FF7FFF7FFF7FFF7FFF7FFF7F
                FF7FFF7FFF7FFF7F5A6B7B6FFF7FFF7FFF7FFF7FFF7FFF7FFF7F396718631863
                1863186318631863186318631863F75E5A6BFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                FF7FFF7FFF7F}
            end
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Height = 423
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ANIMAL'
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 423
        end
        inherited PanelDer: TPanel
          Height = 423
        end
      end
    end
    inherited PBotones: TPanel
      Top = 465
      TabOrder = 1
      inherited SBSelTodos: TSpeedButton
        Left = 538
      end
      inherited JvIExpExcel: TJvImage
        Top = 90
      end
      inherited LExpExcel: TLabel
        Top = 131
      end
      inherited LImpExcel: TLabel
        Left = 147
        Top = 151
      end
      inherited JvIImpExcel: TJvImage
        Top = 111
        Visible = False
      end
      object IPreview: TImage [12]
        Left = 144
        Top = 2
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
        OnClick = BBImprimirReporteClick
      end
      object LPreliminar: TLabel [13]
        Left = 142
        Top = 64
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
        OnClick = BBImprimirReporteClick
      end
      inherited BBCancelar: TBitBtn
        Left = 614
      end
      inherited BBAnterior: TBitBtn
        Left = 712
      end
      inherited BBSiguiente: TBitBtn
        Left = 810
      end
      inherited BBTerminar: TBitBtn
        Left = 908
      end
      inherited PL: TPanel
        TabOrder = 11
        inherited JvSiguiente: TJvImage
          Visible = False
        end
      end
      inherited BBXlsImport: TBitBtn
        Visible = False
      end
      inherited BBImpGesReader: TBitBtn
        TabOrder = 10
      end
      object BBImprimirReporte: TBitBtn
        Left = 428
        Top = 104
        Width = 121
        Height = 31
        Caption = 'Vista Preliminar'
        TabOrder = 9
        OnClick = BBImprimirReporteClick
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
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Potreros'
  end
  inherited Psocalo: TPanel
    Top = 612
  end
  inherited ALUniversal: TActionList
    Left = 459
    Top = 38
    object AEliminar: TAction
      Caption = 'Eliminar'
      OnExecute = AEliminarExecute
    end
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 204
  end
  inherited DSSimple: TDataSource
    Left = 64
    Top = 40
  end
  inherited IBDSSimple: TIBDataSet
    SelectSQL.Strings = (
      'select ID_ANIMAL from AUX_EVENTOS')
    Left = 36
    Top = 38
  end
  inherited IBQValidaciones: TIBQuery
    Left = 132
    Top = 46
  end
  inherited IBQEvento: TIBQuery
    Left = 100
    Top = 38
  end
  inherited SDXLS: TSaveDialog
    Left = 462
    Top = 73
  end
  inherited DTXLS: TDataToXLS
    Left = 432
    Top = 65
  end
  inherited WinXP1: TWinXP
    Left = 672
    Top = 32
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 340
    Top = 39
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 796
    Top = 47
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 828
    Top = 47
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 756
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 388
    Top = 31
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'execute procedure RN_POTRERO_RECURSOFORRAJERO')
    Left = 488
    Top = 38
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 520
    Top = 38
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_EVENTOS_POTREROS('
      '  :FECHA,'
      '  :OBSERVACION,'
      '  :ESTABLECIMIENTO,'
      '  :RESPONSABLE,'
      '  :POTRERO,'
      '  :RECURSO,'
      '  :SUPERFICIETOTAL,'
      '  :SUPERFICIEGANADERA,'
      '  :SUPERFICIEAGRICOLA,'
      '  :TRATAMIENTO,'
      '  :MATERIASECA,'
      '  :OBSERVACIOANALISISSUELO, '
      '  :RESERVAFORRAJERAS,'
      '  :CANTIDADRESERVA,'
      '  :UNIDADRESERVA,'
      '  :VISIBLE) ')
    Left = 552
    Top = 38
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
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
        Name = 'POTRERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUPERFICIETOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUPERFICIEGANADERA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUPERFICIEAGRICOLA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TRATAMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MATERIASECA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACIOANALISISSUELO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESERVAFORRAJERAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANTIDADRESERVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UNIDADRESERVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VISIBLE'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 584
    Top = 38
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 716
    Top = 31
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 168
    Top = 48
  end
  inherited JvBHint: TJvBalloonHint
    Left = 553
    Top = 82
  end
  inherited OpenDlg: TOpenDialog
    Left = 404
    Top = 48
  end
  object IBQRecursoF: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQRecursoFAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_RECURSO_FORRAJERO, SINONIMO from COD_RECURSOS_FORRAJER' +
        'OS')
    Left = 500
    Top = 64
  end
  object DSRecursoF: TDataSource
    DataSet = IBQRecursoF
    Left = 532
    Top = 48
  end
  object IBQPotrerosTratamientos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQRecursoFAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_POTREROS_TRATAMIENTOS, SINONIMO from COD_POTREROS_TRAT' +
        'AMIENTOS')
    Left = 572
    Top = 48
  end
  object DSPotrerosTratamientos: TDataSource
    DataSet = IBQPotrerosTratamientos
    Left = 604
    Top = 48
  end
  object IBQCodReservasForrajeras: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQRecursoFAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_RESERVAS_FORRAJERAS, SINONIMO from COD_RESERVAS_FORRAJ' +
        'ERAS')
    Left = 660
    Top = 48
  end
  object DSCodReservasForrajeras: TDataSource
    DataSet = IBQCodReservasForrajeras
    Left = 692
    Top = 48
  end
  object IBQStockPotrero: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQRecursoFAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from GET_STOCK_POTRERO(:ESTA,:POTRERO)')
    Left = 260
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end>
  end
  object DSStockPotrero: TDataSource
    DataSet = IBQStockPotrero
    Left = 292
    Top = 56
  end
  object DSRepFichaPotrero: TDataSource
    DataSet = IBQRepFichaPotrero
    Left = 920
    Top = 248
  end
  object IBQRepFichaPotrero: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQRepFichaPotreroAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from REP_FICHA_POTRERO(:ESTA,:POTRERO) order by fecha d' +
        'esc, id_evento_potrero desc')
    Left = 952
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end>
  end
  object IBQEliminarEventoPotrero: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select mje from UNDO_ELIMINAR_EVENTO_POTRERO (:IdEventoPotrero, ' +
        ':tipo,:establecimiento,:recurso,:potrero,:fecha)'
      '')
    Left = 928
    Top = 461
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdEventoPotrero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'recurso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'potrero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
    object IBQEliminarEventoPotreroMJE: TIBStringField
      FieldName = 'MJE'
      Origin = 'UNDO_ELIMINAR_EVENTO.MJE'
      Size = 50
    end
  end
  object IBQGetStockPotNuevo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from get_stock_potrero_nuevo(:esta,:pot)')
    Left = 724
    Top = 202
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pot'
        ParamType = ptUnknown
      end>
  end
  object DSGetStockPotNuevo: TDataSource
    DataSet = IBQGetStockPotNuevo
    Left = 756
    Top = 202
  end
end
