inherited FABMUsuarios: TFABMUsuarios
  Left = 243
  Top = 146
  Caption = 'Huella - Usuarios'
  ClientHeight = 449
  ClientWidth = 750
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 750
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
    Width = 356
  end
  inherited PBotones: TPanel
    Top = 331
    Width = 750
    inherited IFondo: TImage
      Width = 750
    end
    inherited BBGuardar: TBitBtn
      Left = 577
    end
    inherited BBCancelar: TBitBtn
      Left = 663
    end
    inherited BBSalir: TBitBtn
      Left = 663
    end
    inherited BBElegir: TBitBtn
      Left = 491
    end
  end
  inherited PEditar: TPanel
    Top = 231
    Width = 750
    object Label1: TLabel
      Left = 43
      Top = 34
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label2: TLabel
      Left = 43
      Top = 60
      Width = 18
      Height = 14
      Caption = 'Rol:'
    end
    object Label3: TLabel
      Left = 43
      Top = 86
      Width = 30
      Height = 14
      Caption = 'Clave:'
      Color = clBtnFace
      ParentColor = False
    end
    object Label4: TLabel
      Left = 44
      Top = 112
      Width = 111
      Height = 14
      Caption = 'Confirmaci'#243'n de Clave:'
    end
    object DBCBHabilitado: TDBCheckBox
      Left = 396
      Top = 113
      Width = 81
      Height = 18
      Caption = 'Habilitado.'
      DataField = 'HABILITADO'
      DataSource = DSAbmSimple
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBLCBARol: TDBLookupComboBoxAuto
      Left = 169
      Top = 57
      Width = 218
      Height = 22
      Color = clMoneyGreen
      DataField = 'ROL'
      DataSource = DSAbmSimple
      KeyField = 'ID_ROL'
      ListField = 'NOMBRE'
      ListSource = DSRol
      TabOrder = 1
      OnKeyPress = DBLCBARolKeyPress
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object EANombre: TEditAuto
      Left = 169
      Top = 30
      Width = 215
      Height = 22
      CharCase = ecUpperCase
      Color = clMoneyGreen
      MaxLength = 50
      TabOrder = 0
      OnExit = EANombreExit
      OnKeyPress = EANombreKeyPress
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object EAConfClave: TEditAutoMinuscula
      Left = 170
      Top = 111
      Width = 130
      Height = 22
      Color = clMoneyGreen
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 4
      OnExit = EAConfClaveExit
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEAClave: TDBEditMinuscula
      Left = 169
      Top = 83
      Width = 130
      Height = 22
      Color = clMoneyGreen
      DataField = 'CLAVE'
      DataSource = DSAbmSimple
      PasswordChar = '*'
      TabOrder = 3
      OnKeyPress = DBEAClaveKeyPress
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
  end
  inherited PNavegar: TPanel
    Width = 750
    inherited GBBuscar: TGroupBox
      Width = 746
      inherited EValorBuscar: TEdit
        Width = 518
      end
    end
    inherited GBFiltrar: TGroupBox
      Width = 746
      inherited EValorFiltrar: TEdit
        Width = 513
      end
    end
    inherited GBCantidad: TGroupBox
      Width = 746
      inherited BDBGAbm: TBitDBGrid
        Width = 742
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMUSR'
            Title.Alignment = taCenter
            Title.Caption = 'Nombre'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBREROL'
            Title.Alignment = taCenter
            Title.Caption = 'Rol'
            Width = 120
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Habilitado'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_USUARIO'
            Visible = False
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 750
    Caption = 'Usuarios'
    inherited LTitulo: TLabel
      Width = 366
    end
    inherited PILeft: TPanel
      Left = 562
    end
  end
  inherited Psocalo: TPanel
    Top = 408
    Width = 750
  end
  inherited ALUniversal: TActionList
    Left = 192
    Top = 0
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 212
    Top = 7
  end
  inherited IlAbmSimple: TImageList
    Left = 128
    Top = 0
  end
  inherited DSAbmSimple: TDataSource
    Left = 224
    Top = 0
  end
  inherited PMGrilla: TPopupMenu
    Left = 160
    Top = 0
  end
  inherited IBQAbmSimple: TIBQuery
    BeforeDelete = IBQAbmSimpleBeforeDelete
    SQL.Strings = (
      
        'select ID_USUARIO, U.NOMBRE AS NOMUSR, U.ROL,R.NOMBRE AS NOMBRER' +
        'OL, CLAVE, CATEGORIA, HABILITADO, G.VALOR'
      'from SYS_USUARIOS U, SYS_ROLES R, COD_GENERICOS G'
      
        'where (U.ROL= R.ID_ROL) and (G.tipo = '#39'SN'#39') and (HABILITADO = G.' +
        'ID_CODIGO)')
    GeneratorField.Field = 'ID_USUARIO'
    GeneratorField.Generator = 'GEN_ID_TABUSUARIOS'
    Left = 64
    Top = 0
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NOMBRE,'
      '  ID_USUARIO,'
      '  CLAVE,'
      '  HABILITADO,'
      '  ROL,'
      '  CATEGORIA,'
      '  LOGUEADO'
      'from SYS_USUARIOS '
      'where'
      '  ID_USUARIO = :ID_USUARIO')
    ModifySQL.Strings = (
      'update SYS_USUARIOS'
      'set'
      '  ID_USUARIO = :ID_USUARIO,'
      '  NOMBRE = :NOMUSR,'
      '  ROL = :ROL,'
      '  CLAVE = :CLAVE,'
      '  CATEGORIA = :CATEGORIA,'
      '  HABILITADO = :HABILITADO'
      'where'
      '  ID_USUARIO = :OLD_ID_USUARIO')
    InsertSQL.Strings = (
      'insert into SYS_USUARIOS'
      '  (ID_USUARIO, NOMBRE, ROL,  CLAVE, CATEGORIA, '
      'HABILITADO)'
      'values'
      '  (:ID_USUARIO, :NOMUSR, :ROL, :CLAVE, :CATEGORIA, '
      ':HABILITADO)')
    DeleteSQL.Strings = (
      'delete from SYS_USUARIOS'
      'where'
      '  ID_USUARIO = :OLD_ID_USUARIO')
    Left = 96
    Top = 0
  end
  object IBQRol: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_ROL, NOMBRE from SYS_ROLES where id_rol <> 0')
    Left = 376
    Top = 233
  end
  object DSRol: TDataSource
    DataSet = IBQRol
    Left = 416
    Top = 233
  end
  object IBQGen_Usuario: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_ID_TABUSUARIOS, 0)  AS IDNUEVOUSUARIO FROM RDB' +
        '$DATABASE')
    Left = 520
    Top = 235
  end
  object IBSPActualizarAcciones: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'SP_ASIGNAR_ACCIONES'
    Left = 520
    Top = 275
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_USUARIO_NUEVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_ROL_USUARIO'
        ParamType = ptInput
      end>
  end
  object IBQDelAccionUsuario: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from rel_usuario_accion where id_usuario=:usuario')
    Left = 616
    Top = 251
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usuario'
        ParamType = ptUnknown
      end>
  end
end
