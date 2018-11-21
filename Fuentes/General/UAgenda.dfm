inherited FAgenda: TFAgenda
  Left = 68
  Top = 163
  Caption = 'FAgenda'
  ClientHeight = 450
  OldCreateOrder = True
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
  object PGeneral: TPanel [4]
    Left = 0
    Top = 65
    Width = 844
    Height = 307
    Align = alClient
    Color = clWhite
    TabOrder = 3
    object DBGAvisos: TBitDBGrid
      Left = 1
      Top = 1
      Width = 842
      Height = 305
      Align = alClient
      DataSource = DSAvisos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGAvisosDrawColumnCell
      OnDblClick = AVerAlarmaExecute
      OnTitleClick = DBGAvisosTitleClick
      AllowIncSearch = True
      ColumnVersion = 0
      DefaultColumns = True
      DrawingEllipse = True
      DrawReadOnly = False
      EnterKey = ekNone
      FillFields = True
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
      TitleBtn = tbSorted
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA_AVISO'
          Title.Caption = 'Fecha aviso'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CATEGORIA'
          Title.Caption = 'Categor'#237'a'
          Width = 121
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Caption = 'Tipo'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 240
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'NIVEL_CRITICIDAD'
          Title.Caption = 'Nivel cr'#237'tico'
          Width = 126
          Visible = True
        end>
    end
  end
  object PBotones: TPanel [5]
    Left = 0
    Top = 372
    Width = 844
    Height = 37
    Align = alBottom
    Color = clWhite
    TabOrder = 2
    DesignSize = (
      844
      37)
    object BBSalir: TBitBtn
      Left = 614
      Top = 5
      Width = 104
      Height = 27
      Action = ASalir
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
    object BBVerAlarma: TBitBtn
      Left = 457
      Top = 4
      Width = 118
      Height = 27
      Action = AVerAlarma
      Anchors = [akTop, akRight]
      Caption = 'Ver alarma'
      TabOrder = 1
    end
    object CBVerTodos: TCheckBox
      Left = 9
      Top = 9
      Width = 104
      Height = 18
      Caption = 'Ver todos'
      TabOrder = 2
      OnClick = CBVerTodosClick
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Alarmas activas hasta hoy'
  end
  inherited Psocalo: TPanel
    Top = 428
  end
  inherited ALUniversal: TActionList
    Left = 635
    Top = 6
    object ASalir: TAction
      Category = 'Botones'
      Caption = 'Salir'
      ShortCut = 27
      OnExecute = ASalirExecute
    end
    object AVerAlarma: TAction
      Category = 'Alarmas'
      Caption = 'Ver alarma'
      OnExecute = AVerAlarmaExecute
    end
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  object DSAvisos: TDataSource
    DataSet = IBQAvisos
    Left = 600
    Top = 8
  end
  object IBQAvisos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select sag.id_agenda, sag.fecha_aviso, sca.nombre as categoria, ' +
        'sta.nombre as tipo, sav.descripcion, sav.nivel_criticidad, sag.e' +
        'stado'
      
        'from sys_agenda sag, sys_avisos sav, sys_categorias_aviso sca, s' +
        'ys_tipos_aviso sta'
      
        'where (sag.aviso = sav.id_aviso) and (sav.categoria = sca.id_cat' +
        'egoria_aviso) and (sav.tipo = sta.id_tipo_aviso) and(establecimi' +
        'ento = :esta) and (sag.estado = '#39'A'#39') and ('#39'today'#39' >= sag.fecha_a' +
        'viso) order by fecha_aviso ')
    Left = 568
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
        Value = '1'
      end>
    object IBQAvisosID_AGENDA: TIntegerField
      FieldName = 'ID_AGENDA'
      Origin = 'SYS_AGENDA.ID_AGENDA'
      Required = True
    end
    object IBQAvisosFECHA_AVISO: TDateField
      FieldName = 'FECHA_AVISO'
      Origin = 'SYS_AGENDA.FECHA_AVISO'
      Required = True
    end
    object IBQAvisosCATEGORIA: TIBStringField
      FieldName = 'CATEGORIA'
      Origin = 'SYS_CATEGORIAS_AVISO.NOMBRE'
      Required = True
      FixedChar = True
      Size = 50
    end
    object IBQAvisosTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'SYS_TIPOS_AVISO.NOMBRE'
      Required = True
      FixedChar = True
      Size = 50
    end
    object IBQAvisosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'SYS_AVISOS.DESCRIPCION'
      FixedChar = True
      Size = 50
    end
    object IBQAvisosNIVEL_CRITICIDAD: TIntegerField
      FieldName = 'NIVEL_CRITICIDAD'
      Origin = 'SYS_AVISOS.NIVEL_CRITICIDAD'
    end
    object IBQAvisosESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'SYS_AGENDA.ESTADO'
      FixedChar = True
      Size = 1
    end
  end
end
