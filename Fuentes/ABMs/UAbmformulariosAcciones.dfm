inherited FABMFormulariosAcciones: TFABMFormulariosAcciones
  Left = 157
  Top = 13
  Caption = 'Huella - Formularios Vs Acciones.'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTitulo: TPanel
    Caption = 'Formularios <-> Acciones'
  end
  inherited PNavegar: TPanel
    inherited BDBGAbm: TBitDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Title.Caption = 'Descripci'#243'n'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_FORMULARIO'
          Visible = True
        end>
    end
  end
  inherited PEditar: TPanel
    object Label6: TLabel [0]
      Left = 24
      Top = 32
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    object DBENombre: TDBEditAuto
      Left = 72
      Top = 28
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'DESCRIPCION'
      DataSource = DSAbmSimple
      TabOrder = 1
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
  end
  inherited PNN: TPanel
    inherited Panel1: TPanel
      inherited LBdelosDisponibles: TListBox
        Items.Strings = (
          'Accion')
      end
    end
  end
  inherited IBQAbmSimple: TIBQuery
    GeneratorField.Field = 'ID_FORMULARIO'
    GeneratorField.Generator = 'IDSYSFORMULARIOS_GEN'
  end
  inherited IBQdelosDisponibles: TIBQuery
    Active = True
    SQL.Strings = (
      'select DESCRIPCION, ID_ACCION from SYS_ACCIONES')
  end
end
