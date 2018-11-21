inherited FABMEmpleados: TFABMEmpleados
  Top = 98
  Caption = 'Huella - Empleados'
  ClientHeight = 580
  ClientWidth = 707
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 707
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
    Width = 640
  end
  inherited PBotones: TPanel
    Top = 481
    Width = 707
    inherited IFondo: TImage
      Width = 707
    end
    inherited BBGuardar: TBitBtn
      Left = 534
    end
    inherited BBCancelar: TBitBtn
      Left = 573
    end
    inherited BBSalir: TBitBtn
      Left = 621
    end
    inherited BBElegir: TBitBtn
      Left = 448
    end
  end
  inherited PEditar: TPanel
    Top = 381
    Width = 707
    object LNombre: TLabel
      Left = 25
      Top = 23
      Width = 43
      Height = 14
      Caption = 'Nombre: '
    end
    object LApellido: TLabel
      Left = 25
      Top = 47
      Width = 41
      Height = 14
      Caption = 'Apellido:'
    end
    object LTipo: TLabel
      Left = 25
      Top = 70
      Width = 36
      Height = 23
      AutoSize = False
      Caption = 'Tipo:'
      Layout = tlCenter
    end
    object DBEANombre: TDBEditAuto
      Left = 79
      Top = 19
      Width = 233
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 0
      OnExit = DBEANombreExit
      OnKeyPress = DBEANombreKeyPress
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEAApellido: TDBEditAuto
      Left = 79
      Top = 45
      Width = 233
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'APELLIDO'
      DataSource = DSAbmSimple
      TabOrder = 1
      OnExit = DBEAApellidoExit
      OnKeyPress = DBEAApellidoKeyPress
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBLCBATipo: TDBLookupComboBoxAuto
      Left = 79
      Top = 71
      Width = 156
      Height = 22
      Color = 14679807
      DataField = 'ID_TIPOS_EMPLEADOS'
      DataSource = DSAbmSimple
      KeyField = 'ID_TIPOS_EMPLEADOS'
      ListField = 'SINONIMO'
      ListSource = DSTipoEmpleados
      TabOrder = 2
      OnCloseUp = DBLCBATipoCloseUp
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
  end
  inherited PNavegar: TPanel
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'APELLIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Apellido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Alignment = taCenter
            Title.Caption = 'Nombre'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 707
    Caption = 'Empleados'
    inherited LTitulo: TLabel
      Width = 303
    end
    inherited PILeft: TPanel
      Left = 499
    end
  end
  inherited Psocalo: TPanel
    Top = 558
    Width = 707
    inherited JvSocalo: TJvImage
      Width = 707
    end
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      
        'select tp.APELLIDO, tp.ESTABLECIMIENTO, tp.ID_EMPLEADO, tp.NOMBR' +
        'E, cte.ID_TIPOS_EMPLEADOS, cte.SINONIMO as TIPO from TAB_EMPLEAD' +
        'OS tp join COD_TIPOS_EMPLEADOS cte ON tp.ID_TIPOS_EMPLEADO = CTE' +
        '.ID_TIPOS_EMPLEADOS where (tp.establecimiento = :esta)and(tp.id_' +
        'empleado <> 0)')
    GeneratorField.Field = 'ID_EMPLEADO'
    GeneratorField.Generator = 'GEN_ID_TABEMPLEADO'
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
    object IBQAbmSimpleAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'TAB_EMPLEADOS.APELLIDO'
      Required = True
      Size = 30
    end
    object IBQAbmSimpleESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_EMPLEADOS.ESTABLECIMIENTO'
      Required = True
    end
    object IBQAbmSimpleID_EMPLEADO: TIntegerField
      FieldName = 'ID_EMPLEADO'
      Origin = 'TAB_EMPLEADOS.ID_EMPLEADO'
      Required = True
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'TAB_EMPLEADOS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBQAbmSimpleID_TIPOS_EMPLEADOS: TIntegerField
      FieldName = 'ID_TIPOS_EMPLEADOS'
      Origin = 'COD_TIPOS_EMPLEADOS.ID_TIPOS_EMPLEADOS'
      Required = True
    end
    object IBQAbmSimpleTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'COD_TIPOS_EMPLEADOS.SINONIMO'
      Size = 50
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from TAB_EMPLEADOS '
      'where'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO and'
      '  ID_EMPLEADO = :ID_EMPLEADO')
    ModifySQL.Strings = (
      'update TAB_EMPLEADOS'
      'set'
      '  APELLIDO = :APELLIDO,'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO,'
      '  ID_EMPLEADO = :ID_EMPLEADO,'
      '  NOMBRE = :NOMBRE,'
      '  ID_TIPOS_EMPLEADO = :ID_TIPOS_EMPLEADOS'
      'where'
      '  ESTABLECIMIENTO = :OLD_ESTABLECIMIENTO and'
      '  ID_EMPLEADO = :OLD_ID_EMPLEADO')
    InsertSQL.Strings = (
      'insert into TAB_EMPLEADOS'
      '  (APELLIDO, ESTABLECIMIENTO, ID_EMPLEADO, NOMBRE, '
      'ID_TIPOS_EMPLEADO)'
      'values'
      '  (:APELLIDO, :ESTABLECIMIENTO, :ID_EMPLEADO, :NOMBRE, '
      ':ID_TIPOS_EMPLEADOS)')
    DeleteSQL.Strings = (
      'delete from TAB_EMPLEADOS'
      'where'
      '  ESTABLECIMIENTO = :OLD_ESTABLECIMIENTO and'
      '  ID_EMPLEADO = :OLD_ID_EMPLEADO')
  end
  object IBQTiposEmpleados: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQTiposEmpleadosAfterOpen
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_tipos_empleados, sinonimo'
      'from  cod_tipos_empleados'
      '')
    Left = 433
    Top = 262
  end
  object DSTipoEmpleados: TDataSource
    DataSet = IBQTiposEmpleados
    Left = 473
    Top = 262
  end
end
