inherited FABMSubCategorias: TFABMSubCategorias
  Left = 590
  Top = 48
  BorderStyle = bsDialog
  Caption = 'FABMSubCategorias'
  ClientHeight = 661
  ClientWidth = 731
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 731
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
    Width = 337
  end
  inherited PBotones: TPanel
    Top = 562
    Width = 731
    inherited IFondo: TImage
      Width = 731
    end
    inherited BBGuardar: TBitBtn
      Left = 559
    end
    inherited BBCancelar: TBitBtn
      Left = 645
    end
    inherited BBSalir: TBitBtn
      Left = 645
    end
    inherited BBElegir: TBitBtn
      Left = 473
    end
  end
  inherited PEditar: TPanel
    Top = 209
    Width = 731
    Height = 353
    object Label1: TLabel
      Left = 52
      Top = 22
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object Label2: TLabel
      Left = 52
      Top = 65
      Width = 36
      Height = 14
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel
      Left = 332
      Top = 18
      Width = 46
      Height = 14
      Caption = 'Sinonimo:'
    end
    object DBEANombre: TDBEditAuto
      Left = 112
      Top = 17
      Width = 199
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 0
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBECodigo: TDBEditAuto
      Left = 112
      Top = 60
      Width = 27
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'CODIGO'
      DataSource = DSAbmSimple
      TabOrder = 1
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEASinonimo: TDBEditAuto
      Left = 392
      Top = 15
      Width = 191
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'SINONIMO'
      DataSource = DSAbmSimple
      TabOrder = 2
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object GBRaza: TGroupBox
      Left = 37
      Top = 89
      Width = 559
      Height = 248
      Align = alCustom
      Caption = ' Razas'
      TabOrder = 3
      inline FrameSeleccion: TFrameSeleccion
        Left = 17
        Top = 17
        Width = 535
        Height = 216
        TabOrder = 0
        inherited PSeleccion: TPanel
          Width = 535
          Height = 217
          Align = alCustom
          inherited PBotones: TPanel
            Left = 212
            Top = 15
            Width = 96
            Height = 194
            Align = alCustom
            inherited IFondo: TImage
              Width = 96
              Height = 194
            end
            inherited BBAgregarTodos: TJvImage
              Left = 23
              Top = 2
              Width = 57
              Height = 55
              OnClick = FrameSeleccionBBAgregarTodosClick
            end
            inherited BBAgregarUno: TJvImage
              Left = 16
              Top = 45
              Width = 57
              Height = 60
              OnClick = FrameSeleccionBBAgregarUnoClick
            end
            inherited BBEliminarUno: TJvImage
              Left = 16
              Top = 88
              OnClick = FrameSeleccionBBEliminarUnoClick
            end
            inherited BBEliminarTodos: TJvImage
              Left = 16
              Top = 139
              Height = 62
              OnClick = FrameSeleccionBBEliminarTodosClick
            end
            inherited BBATodos: TBitBtn
              Top = 68
            end
            inherited BBAUno: TBitBtn
              Top = 110
            end
            inherited BBEUno: TBitBtn
              Top = 151
            end
            inherited BBETodos: TBitBtn
              Top = 192
            end
          end
          inherited GBSeleccionados: TGroupBox
            Left = 310
            Top = 9
            Width = 191
            Height = 200
            Align = alCustom
            inherited BDBGSeleccionados: TBitDBGrid
              Top = 16
              Width = 187
              Height = 182
              Font.Height = -12
              Options = [dgTitles, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              OnDblClick = FrameSeleccionBDBGSeleccionadosDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'RAZA'
                  Title.Caption = 'Raza'
                  Width = 160
                  Visible = True
                end>
            end
          end
          inherited GBDisponibles: TGroupBox
            Left = 9
            Top = 9
            Width = 199
            Height = 200
            Align = alCustom
            inherited BDBGDisponibles: TBitDBGrid
              Top = 16
              Width = 195
              Height = 182
              Font.Height = -12
              Options = [dgTitles, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              OnDblClick = FrameSeleccionBDBGDisponiblesDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SINONIMO'
                  Title.Caption = 'Razas'
                  Width = 161
                  Visible = True
                end>
            end
          end
        end
        inherited IBQDisponibles: TIBQuery
          SQL.Strings = (
            
              'select id_raza, sinonimo from cod_razas where id_raza not in (se' +
              'lect id_raza from aux_subcategorias) order by nombre asc')
          Left = 105
          Top = 113
        end
        inherited DSDisponibles: TDataSource
          Left = 145
          Top = 113
        end
        inherited IBUSQLIntercambiar: TIBUpdateSQL
          RefreshSQL.Strings = (
            'Select *'
            'from aux_subcategorias '
            'where'
            '  ID_SUBCATEGORIA = :ID_SUBCATEGORIA and'
            '  ID_RAZA = :ID_RAZA')
          ModifySQL.Strings = (
            'update aux_subcategorias'
            'set'
            '  ID_SUBCATEGORIA = :ID_SUBCATEGORIA,'
            '  ID_RAZA = :ID_RAZA,'
            '  RAZA = :RAZA,'
            '  SUBCATEGORIA = :SUBCATEGORIA'
            'where'
            '  ID_SUBCATEGORIA = :OLD_ID_SUBCATEGORIA and'
            '  ID_RAZA = :OLD_ID_RAZA')
          InsertSQL.Strings = (
            'insert into aux_subcategorias'
            '  (ID_SUBCATEGORIA, ID_RAZA, RAZA, SUBCATEGORIA)'
            'values'
            '  (:ID_SUBCATEGORIA, :ID_RAZA, :RAZA, :SUBCATEGORIA)')
          DeleteSQL.Strings = (
            'delete from aux_subcategorias'
            'where'
            '  ID_SUBCATEGORIA = :OLD_ID_SUBCATEGORIA and'
            '  ID_RAZA = :OLD_ID_RAZA')
          Left = 325
          Top = 82
        end
        inherited IBQSeleccionados: TIBQuery
          SQL.Strings = (
            'select * from aux_subcategorias order by raza asc')
          Left = 368
          Top = 105
        end
        inherited DSSeleccionados: TDataSource
          Left = 400
          Top = 105
        end
      end
    end
  end
  inherited PNavegar: TPanel
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        ParentFont = False
        TitleFont.Height = -13
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Tipo de registro'
            Width = 132
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RAZAS'
            Title.Caption = 'Razas'
            Width = 432
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 731
    Caption = 'Tipos de registros'
    inherited LTitulo: TLabel
      Width = 327
      Caption = 'Tipos de registro'
    end
    inherited PILeft: TPanel
      Left = 523
    end
  end
  inherited Psocalo: TPanel
    Top = 639
    Width = 731
    inherited JvSocalo: TJvImage
      Width = 731
    end
  end
  inherited ALUniversal: TActionList
    Left = 256
    Top = 80
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Top = 103
  end
  inherited IlAbmSimple: TImageList
    Left = 152
    Top = 0
  end
  inherited DSAbmSimple: TDataSource
    Left = 256
    Top = 80
  end
  inherited PMGrilla: TPopupMenu
    Left = 184
    Top = 96
  end
  inherited IBQAbmSimple: TIBQuery
    OnCalcFields = IBQAbmSimpleCalcFields
    SQL.Strings = (
      'SELECT * FROM COD_SUBCATEGORIAS order by nombre asc')
    GeneratorField.Field = 'ID_SUBCATEGORIA'
    GeneratorField.Generator = 'GEN_IDSUBCATEGORIA'
    Left = 88
    Top = 0
    object IBQAbmSimpleID_SUBCATEGORIA: TIntegerField
      FieldName = 'ID_SUBCATEGORIA'
      Origin = 'COD_SUBCATEGORIAS.ID_SUBCATEGORIA'
      Required = True
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_SUBCATEGORIAS.NOMBRE'
      Size = 50
    end
    object IBQAbmSimpleCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_SUBCATEGORIAS.CODIGO'
      Size = 2
    end
    object IBQAbmSimpleSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_SUBCATEGORIAS.SINONIMO'
      Size = 50
    end
    object IBQAbmSimpleRAZAS: TStringField
      FieldKind = fkCalculated
      FieldName = 'RAZAS'
      Size = 500
      Calculated = True
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_SUBCATEGORIA,'
      '  NOMBRE,'
      '  CODIGO,'
      '  SINONIMO'
      'from COD_SUBCATEGORIAS '
      'where'
      '  ID_SUBCATEGORIA = :ID_SUBCATEGORIA')
    ModifySQL.Strings = (
      'update COD_SUBCATEGORIAS'
      'set'
      '  ID_SUBCATEGORIA = :ID_SUBCATEGORIA,'
      '  NOMBRE = :NOMBRE,'
      '  CODIGO = :CODIGO,'
      '  SINONIMO = :SINONIMO'
      'where'
      '  ID_SUBCATEGORIA = :OLD_ID_SUBCATEGORIA')
    InsertSQL.Strings = (
      'insert into COD_SUBCATEGORIAS'
      '  (ID_SUBCATEGORIA, NOMBRE, CODIGO, SINONIMO)'
      'values'
      '  (:ID_SUBCATEGORIA, :NOMBRE, :CODIGO, :SINONIMO)')
    DeleteSQL.Strings = (
      'delete from COD_SUBCATEGORIAS'
      'where'
      '  ID_SUBCATEGORIA = :OLD_ID_SUBCATEGORIA')
    Left = 120
    Top = 0
  end
  object IBQSelectRazas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select rsr.id_subcategoria, cr.sinonimo as raza, rsr.id_raza, cs' +
        '.nombre as subcategoria'
      'from rel_subcategoria_raza rsr join cod_razas cr on'
      'rsr.id_raza = cr.id_raza join cod_subcategorias cs on'
      'cs.id_subcategoria = rsr.id_subcategoria'
      'where rsr.id_subcategoria = :subcat')
    Left = 434
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'subcat'
        ParamType = ptUnknown
      end>
  end
  object IBQInsertSubcat: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into aux_subcategorias values (:id_subcategoria,:id_raza,' +
        ':raza,:subcategoria)')
    Left = 466
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_subcategoria'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_raza'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'raza'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subcategoria'
        ParamType = ptUnknown
      end>
  end
  object IBQDelAux: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from aux_subcategorias')
    Left = 154
    Top = 432
  end
  object IBQInsertRelacion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_AGREGAR_RELAC_SUBCAT(:SUBCAT)')
    Left = 530
    Top = 456
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'subcat'
        ParamType = ptUnknown
      end>
  end
  object IBQEliminarRelacion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'delete from rel_subcategoria_raza where id_subcategoria = :subca' +
        't')
    Left = 530
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'subcat'
        ParamType = ptUnknown
      end>
  end
  object IBQRazasSubCat: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cr.nombre as raza from cod_razas cr join rel_subcategoria' +
        '_raza rsr on cr.id_raza = rsr.id_raza where rsr.id_subcategoria ' +
        '= :subcat')
    Left = 624
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'subcat'
        ParamType = ptUnknown
      end>
  end
  object IBSPFix_Generador_Maximo: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'AUX_CAMBIO_RAZA'
    Left = 256
    Top = 249
  end
end
