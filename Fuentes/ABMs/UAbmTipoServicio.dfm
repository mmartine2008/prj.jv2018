inherited FABMTipoServicio: TFABMTipoServicio
  Caption = 'Huella - Tipo Servicio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTitulo: TPanel
    Caption = 'Tipos de Servicio'
  end
  inherited PNavegar: TPanel
    inherited BDBGAbm: TBitDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Caption = 'Nombre'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_TIPO_SERVICIO'
          Visible = False
        end>
    end
  end
  inherited PEditar: TPanel
    object Label5: TLabel
      Left = 24
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    object DBENombre: TDBEditAuto
      Left = 70
      Top = 19
      Width = 219
      Height = 21
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 0
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select ID_TIPO_SERVICIO, NOMBRE from COD_TIPOS_SERVICIO')
    GeneratorField.Field = 'ID_TIPO_SERVICIO'
    GeneratorField.Generator = 'GEN_ID_CODTIPOSERVICIO'
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NOMBRE,'
      '  ID_TIPO_SERVICIO'
      'from COD_TIPOS_SERVICIO '
      'where'
      '  ID_TIPO_SERVICIO = :ID_TIPO_SERVICIO')
    ModifySQL.Strings = (
      'update COD_TIPOS_SERVICIO'
      'set'
      '  ID_TIPO_SERVICIO = :ID_TIPO_SERVICIO,'
      '  NOMBRE = :NOMBRE'
      'where'
      '  ID_TIPO_SERVICIO = :OLD_ID_TIPO_SERVICIO')
    InsertSQL.Strings = (
      'insert into COD_TIPOS_SERVICIO'
      '  (ID_TIPO_SERVICIO, NOMBRE)'
      'values'
      '  (:ID_TIPO_SERVICIO, :NOMBRE)')
    DeleteSQL.Strings = (
      'delete from COD_TIPOS_SERVICIO'
      'where'
      '  ID_TIPO_SERVICIO = :OLD_ID_TIPO_SERVICIO')
  end
end
