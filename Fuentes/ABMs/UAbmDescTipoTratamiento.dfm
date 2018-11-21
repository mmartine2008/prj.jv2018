inherited FABMDescTipoTratamiento: TFABMDescTipoTratamiento
  Left = 264
  Caption = 'Huella - Descripci'#243'n de Tipos de Tratamiento'
  ClientHeight = 489
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
    Top = 371
  end
  inherited PEditar: TPanel
    Top = 226
    Height = 145
    object LCodigo: TLabel
      Left = 17
      Top = 17
      Width = 56
      Height = 23
      AutoSize = False
      Caption = 'C'#243'digo:'
      Layout = tlCenter
    end
    object LNombre: TLabel
      Left = 17
      Top = 52
      Width = 56
      Height = 22
      AutoSize = False
      Caption = 'Nombre:'
      Layout = tlCenter
    end
    object LSinonimo: TLabel
      Left = 17
      Top = 86
      Width = 56
      Height = 23
      AutoSize = False
      Caption = 'Sin'#243'nimo:'
      Layout = tlCenter
    end
    object LTipo: TLabel
      Left = 17
      Top = 121
      Width = 56
      Height = 22
      AutoSize = False
      Caption = 'Tipo:'
      Layout = tlCenter
    end
    object DBECodigo: TDBEditAuto
      Left = 86
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
    object DBENombre: TDBEditAuto
      Left = 86
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
    object DBESinonimo: TDBEditAuto
      Left = 86
      Top = 86
      Width = 263
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      DataField = 'SINONIMO'
      DataSource = DSAbmSimple
      TabOrder = 2
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBLCBATipo: TDBLookupComboBoxAuto
      Left = 86
      Top = 121
      Width = 156
      Height = 22
      Color = clMoneyGreen
      DataField = 'ID_TIPO_TRATAMIENTO'
      DataSource = DSAbmSimple
      DropDownRows = 20
      KeyField = 'ID_TIPO_TRATAMIENTO'
      ListField = 'SINONIMO'
      ListSource = DSTipoTratamientos
      TabOrder = 3
      OnCloseUp = DBLCBATipoCloseUp
      EsClave = True
      EsRequerido = True
      ISParam = False
    end
  end
  inherited PNavegar: TPanel
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        ParentFont = False
        TitleFont.Height = -26
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SINONIMO'
            Title.Caption = 'Sin'#243'nimo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCIONTRATAMIENTO'
            Title.Caption = 'Descripci'#243'n Tratamiento'
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Descripci'#243'n de Tipos de Tratamiento'
  end
  inherited Psocalo: TPanel
    Top = 448
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      'select tp.id_tratamiento, tp.codigo, tp.nombre, tp.sinonimo,'
      
        '       ctt.id_tipo_tratamiento, ctt.sinonimo as DESCRIPCIONTRATA' +
        'MIENTO'
      'from cod_tratamiento tp join cod_tipos_tratamiento ctt'
      '     on tp.id_tipo_tratamiento=ctt.id_tipo_tratamiento'
      'where tp.id_tipo_tratamiento <> 0')
    GeneratorField.Field = 'ID_TRATAMIENTO'
    GeneratorField.Generator = 'GEN_ID_CODTRATAMIENTO'
    object IBQAbmSimpleID_TRATAMIENTO: TIntegerField
      FieldName = 'ID_TRATAMIENTO'
      Origin = 'COD_TRATAMIENTO.ID_TRATAMIENTO'
      Required = True
    end
    object IBQAbmSimpleCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_TRATAMIENTO.CODIGO'
      Size = 2
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_TRATAMIENTO.NOMBRE'
      Size = 50
    end
    object IBQAbmSimpleSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_TRATAMIENTO.SINONIMO'
      Size = 50
    end
    object IBQAbmSimpleID_TIPO_TRATAMIENTO: TIntegerField
      FieldName = 'ID_TIPO_TRATAMIENTO'
      Origin = 'COD_TIPOS_TRATAMIENTO.ID_TIPO_TRATAMIENTO'
      Required = True
    end
    object IBQAbmSimpleDESCRIPCIONTRATAMIENTO: TIBStringField
      FieldName = 'DESCRIPCIONTRATAMIENTO'
      Origin = 'COD_TIPOS_TRATAMIENTO.SINONIMO'
      Size = 50
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select * '
      'from cod_tratamiento '
      'where'
      '  ID_TRATAMIENTO = :ID_TRATAMIENTO')
    ModifySQL.Strings = (
      'update cod_tratamiento'
      'set'
      '  ID_TRATAMIENTO = :ID_TRATAMIENTO,'
      '  CODIGO = :CODIGO,'
      '  NOMBRE = :NOMBRE,'
      '  SINONIMO = :SINONIMO,'
      '  ID_TIPO_TRATAMIENTO = :ID_TIPO_TRATAMIENTO'
      'where'
      '  ID_TRATAMIENTO = :OLD_ID_TRATAMIENTO')
    InsertSQL.Strings = (
      'insert into cod_tratamiento'
      
        '  (ID_TRATAMIENTO, CODIGO, NOMBRE, SINONIMO, ID_TIPO_TRATAMIENTO' +
        ')'
      'values'
      
        '  (:ID_TRATAMIENTO, :CODIGO, :NOMBRE, :SINONIMO, :ID_TIPO_TRATAM' +
        'IENTO)')
    DeleteSQL.Strings = (
      'delete from cod_tratamiento'
      'where'
      '  ID_TRATAMIENTO = :OLD_ID_TRATAMIENTO')
  end
  object IBQTiposTratamientos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQTiposTratamientosAfterOpen
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select id_tipo_tratamiento, sinonimo'
      'from  cod_tipos_tratamiento where id_tipo_tratamiento <> 0'
      '')
    Left = 473
    Top = 230
  end
  object DSTipoTratamientos: TDataSource
    DataSet = IBQTiposTratamientos
    Left = 513
    Top = 230
  end
end
