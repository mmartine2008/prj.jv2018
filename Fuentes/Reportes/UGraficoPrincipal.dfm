object FGraficoPrincipal: TFGraficoPrincipal
  Left = 157
  Top = 105
  Width = 800
  Height = 600
  Caption = 'FGraficoPrincipal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 502
    Width = 792
    Height = 64
    Align = alBottom
    TabOrder = 0
    object BAddSerie: TButton
      Left = 504
      Top = 12
      Width = 121
      Height = 30
      Caption = 'Agregar  serie'
      TabOrder = 0
      OnClick = BAddSerieClick
    end
    object Button1: TButton
      Left = 640
      Top = 12
      Width = 126
      Height = 30
      Caption = 'Salir'
      TabOrder = 1
      OnClick = Salir1Click
    end
    object BVerGrafico: TButton
      Left = 136
      Top = 12
      Width = 153
      Height = 30
      Caption = 'Personalizar Gr'#225'fico'
      TabOrder = 2
      OnClick = BVerGraficoClick
    end
    object BsetearSQL: TButton
      Left = 296
      Top = 12
      Width = 161
      Height = 30
      Caption = 'Probando SQL'
      TabOrder = 3
    end
    object BBAyuda: TBitBtn
      Left = 7
      Top = 12
      Width = 30
      Height = 30
      TabOrder = 4
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
    Height = 502
    Align = alClient
    TabOrder = 1
    object Label8: TLabel
      Left = 464
      Top = 144
      Width = 237
      Height = 37
      Caption = 'Aca va el grafico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -33
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 208
      Height = 500
      Align = alLeft
      Caption = ' Configurando Series '
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 14
        Width = 85
        Height = 13
        Caption = 'Tipo de Summarie'
      end
      object Label2: TLabel
        Left = 14
        Top = 57
        Width = 91
        Height = 13
        Caption = 'Seleccionar campo'
      end
      object Label3: TLabel
        Left = 6
        Top = 99
        Width = 147
        Height = 13
        Caption = 'Nombre que se va ver en chart'
      end
      object Label4: TLabel
        Left = 8
        Top = 168
        Width = 65
        Height = 13
        Caption = 'Agrupado Por'
      end
      object Label5: TLabel
        Left = 8
        Top = 248
        Width = 22
        Height = 13
        Caption = 'Filtro'
      end
      object Label6: TLabel
        Left = 8
        Top = 296
        Width = 153
        Height = 13
        Caption = 'Valores que puede llegar a tener'
      end
      object Label7: TLabel
        Left = 16
        Top = 344
        Width = 44
        Height = 13
        Caption = 'Operador'
      end
      object Label9: TLabel
        Left = 16
        Top = 408
        Width = 119
        Height = 13
        Caption = 'Seleccionar tipo de  serie'
      end
      object CBTipoSum: TComboBox
        Left = 8
        Top = 32
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'Contar'
        Items.Strings = (
          'Contar'
          'Sumar'
          'Promediar')
      end
      object CBCamposSum: TComboBox
        Left = 8
        Top = 72
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'Campo 1'
        Items.Strings = (
          'Campo 1'
          'Campo 2'
          '....'
          '....')
      end
      object ENombreSum: TEdit
        Left = 8
        Top = 120
        Width = 138
        Height = 21
        TabOrder = 2
      end
      object Panel3: TPanel
        Left = 3
        Top = 152
        Width = 203
        Height = 2
        TabOrder = 3
      end
      object CBCampoGrupo: TComboBox
        Left = 8
        Top = 192
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 4
        Text = 'Campo 1'
        Items.Strings = (
          'Campo 1'
          'Campo 2'
          '....'
          '....')
      end
      object Panel4: TPanel
        Left = 0
        Top = 234
        Width = 203
        Height = 2
        TabOrder = 5
      end
      object CBCampoFiltro: TComboBox
        Left = 8
        Top = 264
        Width = 169
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 6
        Text = 'Campo 1'
        OnChange = CBCampoFiltroChange
        Items.Strings = (
          'Campo 1'
          'Campo 2'
          '....'
          '....')
      end
      object CBValoresFiltro: TComboBox
        Left = 8
        Top = 312
        Width = 177
        Height = 21
        ItemHeight = 13
        TabOrder = 7
        Text = 'Depende del combo de arriba'
        Items.Strings = (
          'Campo 1'
          'Campo 2'
          '....'
          '....')
      end
      object CBOperadorFiltro: TComboBox
        Left = 8
        Top = 360
        Width = 177
        Height = 21
        ItemHeight = 13
        TabOrder = 8
        Items.Strings = (
          'Mayor'
          'Menor'
          'Igual'
          'Distinto'
          'Like')
      end
      object Panel5: TPanel
        Left = 0
        Top = 400
        Width = 203
        Height = 2
        TabOrder = 9
      end
      object CBTipoSeries: TComboBox
        Left = 16
        Top = 424
        Width = 169
        Height = 21
        ItemHeight = 13
        TabOrder = 10
        Text = 'Barras'
        Items.Strings = (
          'Barras'
          'Lineas'
          'Areas'
          'Torta')
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 512
    object Salir1: TMenuItem
      Caption = 'Salir'
      ShortCut = 27
      OnClick = Salir1Click
    end
  end
  object DSDatosFiltro: TDataSource
    DataSet = QConsultaDatosFiltro
    Left = 176
    Top = 16
  end
  object QConsultaDatosFiltro: TQuery
    Active = True
    AutoRefresh = True
    DatabaseName = 'DBDEMOS'
    RequestLive = True
    SQL.Strings = (
      'select distinct(state)as nombre from customer ')
    Left = 177
    Top = 49
  end
end
