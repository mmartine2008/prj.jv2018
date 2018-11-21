object FREPGrafico: TFREPGrafico
  Left = 173
  Top = 88
  Width = 800
  Height = 600
  Caption = 'Formulario generico para grafico de un dimension'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 17
    Top = 112
    Width = 25
    Height = 13
    Caption = 'Eje Y'
  end
  object Panel1: TPanel
    Left = 0
    Top = 505
    Width = 792
    Height = 61
    Align = alBottom
    TabOrder = 0
    object Button2: TButton
      Left = 656
      Top = 9
      Width = 121
      Height = 30
      Caption = 'Salir'
      TabOrder = 0
      OnClick = Button2Click
    end
    object BBAyuda: TBitBtn
      Left = 7
      Top = 9
      Width = 30
      Height = 30
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 505
    Align = alClient
    TabOrder = 1
    object Grafico: TDBChart
      Left = 1
      Top = 1
      Width = 790
      Height = 291
      AnimatedZoomSteps = 6
      BackWall.Brush.Color = clWhite
      Gradient.Direction = gdFromCenter
      Gradient.Visible = True
      LeftWall.Color = clSilver
      MarginBottom = 3
      MarginTop = 3
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -13
      Title.Font.Name = 'Arial'
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        '')
      BottomAxis.LabelsAngle = 270
      BottomAxis.LabelsSeparation = 0
      BottomAxis.LabelStyle = talText
      BottomAxis.MinorTickCount = 0
      BottomAxis.MinorTickLength = 0
      BottomAxis.TickInnerLength = 1
      BottomAxis.TickLength = 1
      BottomAxis.TickOnLabelsOnly = False
      BottomAxis.TicksInner.Width = 100
      BottomAxis.TicksInner.Visible = False
      Chart3DPercent = 45
      DepthAxis.ExactDateTime = False
      DepthAxis.Increment = 1.000000000000000000
      LeftAxis.LabelsOnAxis = False
      LeftAxis.LabelStyle = talValue
      LeftAxis.MinorGrid.Style = psDot
      LeftAxis.MinorGrid.SmallDots = True
      LeftAxis.MinorTickCount = 13
      LeftAxis.MinorTickLength = 12
      LeftAxis.MinorTicks.Color = clWhite
      LeftAxis.MinorTicks.Visible = False
      LeftAxis.TickLength = 0
      LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
      LeftAxis.Title.Font.Color = clBlack
      LeftAxis.Title.Font.Height = -13
      LeftAxis.Title.Font.Name = 'Arial'
      LeftAxis.Title.Font.Style = [fsBold]
      Legend.LegendStyle = lsValues
      Legend.TextStyle = ltsPlain
      Legend.TopPos = 11
      View3DOptions.Elevation = 355
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 355
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 1
      Top = 292
      Width = 790
      Height = 212
      Align = alBottom
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 1
        Top = 1
        Width = 264
        Height = 210
        Align = alLeft
        Caption = ' Configuraci'#243'n del gr'#225'fico '
        TabOrder = 0
        object Label2: TLabel
          Left = 13
          Top = 68
          Width = 25
          Height = 13
          Caption = 'Eje Y'
        end
        object Label1: TLabel
          Left = 13
          Top = 26
          Width = 78
          Height = 13
          Caption = 'Titulo del gr'#225'fico'
        end
        object CBSummaries: TComboBox
          Left = 10
          Top = 85
          Width = 169
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSummariesChange
        end
        object CHBbyn: TCheckBox
          Left = 11
          Top = 145
          Width = 177
          Height = 17
          Caption = 'Blanco y negro para impresion'
          TabOrder = 1
          OnClick = CHBbynClick
        end
        object CHBTresD: TCheckBox
          Left = 11
          Top = 119
          Width = 97
          Height = 17
          Caption = '3D'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = CHBTresDClick
        end
        object Etitulo: TEdit
          Left = 11
          Top = 44
          Width = 169
          Height = 21
          TabOrder = 3
          OnChange = EtituloChange
        end
      end
      object GroupBox3: TGroupBox
        Left = 265
        Top = 1
        Width = 262
        Height = 210
        Align = alLeft
        Caption = ' Series '
        TabOrder = 1
        object LBSeries: TListBox
          Left = 2
          Top = 15
          Width = 258
          Height = 193
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
          OnClick = LBSeriesClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 527
        Top = 1
        Width = 262
        Height = 210
        Align = alRight
        Caption = ' Configuraci'#243'n de la serie '
        TabOrder = 2
        object Label3: TLabel
          Left = 18
          Top = 101
          Width = 105
          Height = 13
          Caption = 'Ver Marcas de la serie'
        end
        object Label6: TLabel
          Left = 16
          Top = 18
          Width = 88
          Height = 13
          Caption = 'Nombre de la serie'
        end
        object Label5: TLabel
          Left = 16
          Top = 60
          Width = 122
          Height = 13
          Caption = 'Tipo de gr'#225'fico de la serie'
        end
        object CBMarcas: TComboBox
          Left = 16
          Top = 118
          Width = 169
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBMarcasChange
          Items.Strings = (
            'Sin marcas'
            'Valor'
            'Porcentaje')
        end
        object ENombreSerie: TEdit
          Left = 16
          Top = 37
          Width = 169
          Height = 21
          TabOrder = 1
          OnChange = ENombreSerieChange
          OnEnter = ENombreSerieEnter
          OnKeyPress = ENombreSerieKeyPress
        end
        object CBTipoGrafico: TComboBox
          Left = 16
          Top = 77
          Width = 169
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Text = 'Barras'
          OnChange = CBTipoGraficoChange
          Items.Strings = (
            'Barra'
            'Torta'
            'Linea'
            'Area')
        end
        object CHBSerieVisible: TCheckBox
          Left = 16
          Top = 155
          Width = 97
          Height = 17
          Caption = 'Visible'
          TabOrder = 3
          OnClick = CHBSerieVisibleClick
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 752
    Top = 260
    object Salir1: TMenuItem
      Caption = 'Salir'
      ShortCut = 27
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = query
    Left = 713
    Top = 33
  end
  object query: TQuery
    Active = True
    DatabaseName = 'DBDEMOS'
    SQL.Strings = (
      
        'select count(*)/2 as cuenta,  sum (custNo) as suma, country from' +
        ' customer group by country')
    Left = 745
    Top = 33
  end
  object DG: TDatosGenericos
    CantSeries = 0
    Left = 721
    Top = 261
  end
end
