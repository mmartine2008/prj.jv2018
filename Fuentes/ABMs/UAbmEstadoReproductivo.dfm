inherited FABMEstadoReproductivo: TFABMEstadoReproductivo
  Caption = 'Huella - Estados Reproductivos'
  ClientHeight = 409
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
  inherited PBotones: TPanel
    Top = 291
  end
  inherited PEditar: TPanel
    Top = 102
    Height = 189
    object LCodigo: TLabel
      Left = 9
      Top = 17
      Width = 56
      Height = 23
      AutoSize = False
      Caption = 'C'#243'digo:'
      Layout = tlCenter
    end
    object LNombre: TLabel
      Left = 9
      Top = 52
      Width = 56
      Height = 22
      AutoSize = False
      Caption = 'Nombre:'
      Layout = tlCenter
    end
    object LMensaje: TLabel
      Left = 9
      Top = 86
      Width = 56
      Height = 23
      AutoSize = False
      Caption = 'Mensaje:'
      Layout = tlCenter
    end
    object LEntraTacto: TLabel
      Left = 9
      Top = 121
      Width = 87
      Height = 22
      AutoSize = False
      Caption = 'Entra al Tacto:'
      Layout = tlCenter
    end
    object LEntraServicio: TLabel
      Left = 9
      Top = 155
      Width = 87
      Height = 23
      AutoSize = False
      Caption = 'Entra a Servicio:'
      Layout = tlCenter
    end
    object DBECodigo: TDBEditAuto
      Left = 112
      Top = 17
      Width = 79
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'CODIGO'
      DataSource = DSAbmSimple
      TabOrder = 0
      EsClave = True
      EsRequerido = True
      ISParam = False
    end
    object DBEditANombre: TDBEditAuto
      Left = 112
      Top = 52
      Width = 263
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 1
      EsClave = True
      EsRequerido = True
      ISParam = False
    end
    object DBEMensaje: TDBEditAuto
      Left = 112
      Top = 86
      Width = 263
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'MSG_ESTADO'
      DataSource = DSAbmSimple
      TabOrder = 2
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBLCBAEntraTacto: TDBLookupComboBoxAuto
      Left = 112
      Top = 121
      Width = 96
      Height = 22
      Color = clMoneyGreen
      DataField = 'AL_TACTO'
      DataSource = DSAbmSimple
      KeyField = 'ID_CODIGO'
      ListField = 'VALOR'
      ListSource = DMSoftvet.DSSiNo
      TabOrder = 3
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBLCBAEntraServicio: TDBLookupComboBoxAuto
      Left = 112
      Top = 155
      Width = 260
      Height = 22
      Color = clMoneyGreen
      DataField = 'PUEDE_SERVICIO'
      DataSource = DSAbmSimple
      KeyField = 'ID_CODIGO'
      ListField = 'VALOR'
      ListSource = DMSoftvet.DSEntraServicio
      TabOrder = 4
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
            FieldName = 'CODIGO'
            Title.Caption = 'Codigo'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Estados Reproductivos'
  end
  inherited Psocalo: TPanel
    Top = 368
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      
        'select id_estado_reproductivo, codigo, nombre, puede_servicio, a' +
        'l_tacto, msg_estado'
      'from cod_estados_reproductivos')
    GeneratorField.Field = 'ID_ESTADO_REPRODUCTIVO'
    GeneratorField.Generator = 'GEN_ID_CODESTADOREPRODUCTIVO'
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NOMBRE,'
      '  ID_ESTADO_REPRODUCTIVO,'
      '  MSG_ESTADO,'
      '  AL_TACTO,'
      '  PUEDE_SERVICIO,'
      '  CODIGO'
      'from COD_ESTADOS_REPRODUCTIVOS '
      'where'
      '  ID_ESTADO_REPRODUCTIVO = :ID_ESTADO_REPRODUCTIVO')
    ModifySQL.Strings = (
      'update COD_ESTADOS_REPRODUCTIVOS'
      'set'
      '  ID_ESTADO_REPRODUCTIVO = :ID_ESTADO_REPRODUCTIVO,'
      '  CODIGO = :CODIGO,'
      '  NOMBRE = :NOMBRE,'
      '  PUEDE_SERVICIO = :PUEDE_SERVICIO,'
      '  AL_TACTO = :AL_TACTO,'
      '  MSG_ESTADO = :MSG_ESTADO'
      'where'
      '  ID_ESTADO_REPRODUCTIVO = :OLD_ID_ESTADO_REPRODUCTIVO')
    InsertSQL.Strings = (
      'insert into COD_ESTADOS_REPRODUCTIVOS'
      '  (ID_ESTADO_REPRODUCTIVO, CODIGO, NOMBRE, PUEDE_SERVICIO, '
      'AL_TACTO, MSG_ESTADO)'
      'values'
      '  (:ID_ESTADO_REPRODUCTIVO, :CODIGO, :NOMBRE, :PUEDE_SERVICIO, '
      ':AL_TACTO, '
      '   :MSG_ESTADO)')
    DeleteSQL.Strings = (
      'delete from COD_ESTADOS_REPRODUCTIVOS'
      'where'
      '  ID_ESTADO_REPRODUCTIVO = :OLD_ID_ESTADO_REPRODUCTIVO')
  end
end
