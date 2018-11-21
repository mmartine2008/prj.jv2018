inherited FABMServicios: TFABMServicios
  Left = 273
  Top = 166
  Caption = 'Huella - Servicios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTitulo: TPanel
    Caption = 'Servicios'
  end
  inherited PNavegar: TPanel
    inherited BDBGAbm: TBitDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Caption = 'Nombre'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_INICIO'
          Title.Caption = 'Fecha de Inicio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_FIN'
          Title.Caption = 'Fecha de Fin'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_FIN_ESTIMADA'
          Title.Caption = 'Fecha de Fin Estimada'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'Estado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Caption = 'Tipo'
          Width = 100
          Visible = True
        end>
    end
  end
  inherited PEditar: TPanel
    object Label5: TLabel
      Left = 16
      Top = 32
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    object Label6: TLabel
      Left = 16
      Top = 56
      Width = 76
      Height = 13
      Caption = 'Fecha de Inicio:'
    end
    object Label7: TLabel
      Left = 16
      Top = 80
      Width = 65
      Height = 13
      Caption = 'Fecha de Fin:'
    end
    object Label9: TLabel
      Left = 16
      Top = 104
      Width = 117
      Height = 13
      Caption = 'Fecha de Fin (Estimada):'
    end
    object Label10: TLabel
      Left = 349
      Top = 29
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object DBLCBTipos: TDBLookupComboBox
      Left = 390
      Top = 29
      Width = 153
      Height = 21
      KeyField = 'ID_TIPO_SERVICIO'
      ListField = 'NOMBRE'
      ListSource = IBDSTipos
      TabOrder = 4
      OnEnter = DBLCBTiposEnter
      OnExit = DBLCBTiposExit
    end
    object DBEANombre: TDBEditAuto
      Left = 143
      Top = 29
      Width = 178
      Height = 21
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 0
      EsClave = True
      EsRequerido = True
      ISParam = False
    end
    object DBDateTimePicker1: TDBDateTimePicker
      Left = 142
      Top = 53
      Width = 92
      Height = 21
      Date = 38650.568967731480000000
      Time = 38650.568967731480000000
      Color = 14679807
      TabOrder = 1
      DataField = 'FECHA_INICIO'
      DataSource = DSAbmSimple
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBDateTimePicker2: TDBDateTimePicker
      Left = 142
      Top = 77
      Width = 92
      Height = 21
      Date = 38650.568998657410000000
      Time = 38650.568998657410000000
      Color = 14679807
      TabOrder = 2
      DataField = 'FECHA_FIN'
      DataSource = DSAbmSimple
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBDateTimePicker3: TDBDateTimePicker
      Left = 142
      Top = 101
      Width = 92
      Height = 21
      Date = 38650.569029756950000000
      Time = 38650.569029756950000000
      Color = clBackground
      TabOrder = 3
      DataField = 'FECHA_FIN_ESTIMADA'
      DataSource = DSAbmSimple
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      
        'select FECHA_FIN, FECHA_FIN_ESTIMADA, FECHA_INICIO, ID_SERVICIO,' +
        ' NOMBRE, TIPO from TAB_SERVICIOS'
      'where ESTABLECIMIENTO = :ESTABLECIMIENTO')
    GeneratorField.Field = 'ID_SERVICIO'
    GeneratorField.Generator = 'GEN_ID_TABSERVICIO'
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NOMBRE,'
      '  ID_SERVICIO,'
      '  FECHA_INICIO,'
      '  FECHA_FIN,'
      '  FECHA_FIN_ESTIMADA,'
      '  ACTIVO,'
      '  TIPO,'
      '  GRUPO,'
      '  ESTABLECIMIENTO,'
      '  LOTE,'
      '  POTRERO'
      'from TAB_SERVICIOS '
      'where'
      '  ID_SERVICIO = :ID_SERVICIO')
    ModifySQL.Strings = (
      'update TAB_SERVICIOS'
      'set'
      '  FECHA_FIN = :FECHA_FIN,'
      '  FECHA_FIN_ESTIMADA = :FECHA_FIN_ESTIMADA,'
      '  FECHA_INICIO = :FECHA_INICIO,'
      '  ID_SERVICIO = :ID_SERVICIO,'
      '  NOMBRE = :NOMBRE,'
      '  TIPO = :TIPO'
      'where'
      '  ID_SERVICIO = :OLD_ID_SERVICIO')
    InsertSQL.Strings = (
      'insert into TAB_SERVICIOS'
      
        '  (FECHA_FIN, FECHA_FIN_ESTIMADA, FECHA_INICIO, ID_SERVICIO, NOM' +
        'BRE, '
      'TIPO)'
      'values'
      
        '  (:FECHA_FIN, :FECHA_FIN_ESTIMADA, :FECHA_INICIO, :ID_SERVICIO,' +
        ' '
      ':NOMBRE, '
      '   :TIPO)')
    DeleteSQL.Strings = (
      'delete from TAB_SERVICIOS'
      'where'
      '  ID_SERVICIO = :OLD_ID_SERVICIO')
  end
  object IBQTipos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_TIPO_SERVICIO, NOMBRE from COD_TIPOS_SERVICIO')
    Left = 512
    Top = 278
    object IBQTiposID_TIPO_SERVICIO: TIntegerField
      FieldName = 'ID_TIPO_SERVICIO'
      Origin = 'COD_TIPOS_SERVICIO.ID_TIPO_SERVICIO'
      Required = True
    end
    object IBQTiposNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_TIPOS_SERVICIO.NOMBRE'
      Required = True
      Size = 50
    end
  end
  object IBDSTipos: TDataSource
    DataSet = IBQTipos
    Left = 544
    Top = 278
  end
end
