inherited FABMPotreros: TFABMPotreros
  Left = 307
  Top = 194
  Caption = 'Huella - Potreros'
  ClientHeight = 419
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
    Top = 320
  end
  inherited PEditar: TPanel
    Top = 220
    object LNombre: TLabel
      Left = 24
      Top = 18
      Width = 40
      Height = 14
      Caption = 'Nombre:'
    end
    object LHectareas: TLabel
      Left = 23
      Top = 48
      Width = 53
      Height = 14
      Caption = 'Hectareas:'
    end
    object LSuperficieGanadera: TLabel
      Left = 24
      Top = 76
      Width = 103
      Height = 14
      Caption = 'Superficie Ganadera:'
    end
    object Lha2: TLabel
      Left = 291
      Top = 78
      Width = 35
      Height = 18
      AutoSize = False
      Caption = 'ha'
      Layout = tlCenter
    end
    object Lha1: TLabel
      Left = 292
      Top = 44
      Width = 35
      Height = 18
      AutoSize = False
      Caption = 'ha'
      Layout = tlCenter
    end
    object LSuperficieAgricola: TLabel
      Left = 24
      Top = 111
      Width = 95
      Height = 14
      Caption = 'Superficie Agr'#237'cola:'
    end
    object Lha3: TLabel
      Left = 291
      Top = 112
      Width = 35
      Height = 18
      AutoSize = False
      Caption = 'ha'
      Layout = tlCenter
    end
    object DBEHectareas: TDBEditAuto
      Left = 149
      Top = 43
      Width = 130
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'HECTAREAS'
      DataSource = DSAbmSimple
      MaxLength = 6
      TabOrder = 1
      OnExit = DBEHectareasExit
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEANombre: TDBEditAuto
      Left = 149
      Top = 17
      Width = 235
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      TabOrder = 0
      OnKeyPress = DBEANombreKeyPress
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object EASuperficieGanadera: TEditAuto
      Tag = 2
      Left = 149
      Top = 74
      Width = 130
      Height = 22
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 6
      TabOrder = 2
      OnExit = EASuperficieGanaderaExit
      OnKeyPress = EASuperficieGanaderaKeyPress
      OnKeyUp = EASuperficieGanaderaKeyUp
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object EASuperficieAgricola: TEditAuto
      Tag = 2
      Left = 149
      Top = 109
      Width = 130
      Height = 22
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 6
      TabOrder = 3
      OnExit = EASuperficieGanaderaExit
      OnKeyPress = EASuperficieGanaderaKeyPress
      OnKeyUp = EASuperficieAgricolaKeyUp
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object CBVisible: TCheckBox
      Left = 150
      Top = 138
      Width = 104
      Height = 18
      Caption = 'Visible'
      Checked = True
      ParentShowHint = False
      ShowHint = False
      State = cbChecked
      TabOrder = 4
    end
  end
  inherited PNavegar: TPanel
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CRFSINONIMO'
            Title.Caption = 'Recurso Forrajero'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HECTAREAS'
            Title.Caption = 'Hect'#225'reas'
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Potreros'
  end
  inherited Psocalo: TPanel
    Top = 397
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Top = 71
  end
  inherited IBQAbmSimple: TIBQuery
    SQL.Strings = (
      
        'select tp.ESTABLECIMIENTO,  cast(tp.HECTAREAS as decimal(6,2)) a' +
        's HECTAREAS, tp.ID_POTRERO, tp.NOMBRE, tp.recurso_forrajero, crf' +
        '.sinonimo as crfSinonimo from TAB_POTREROS tp,  cod_recursos_for' +
        'rajeros crf where (tp.ESTABLECIMIENTO = :ESTABLECIMIENTO) and (t' +
        'p.id_potrero <> 0) and (tp.recurso_forrajero = crf.id_recurso_fo' +
        'rrajero)')
    GeneratorField.Field = 'ID_POTRERO'
    GeneratorField.Generator = 'GEN_ID_TABPOTRERO'
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
    object IBQAbmSimpleESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_POTREROS.ESTABLECIMIENTO'
      Required = True
    end
    object IBQAbmSimpleID_POTRERO: TIntegerField
      FieldName = 'ID_POTRERO'
      Origin = 'TAB_POTREROS.ID_POTRERO'
      Required = True
    end
    object IBQAbmSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'TAB_POTREROS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBQAbmSimpleRECURSO_FORRAJERO: TIntegerField
      FieldName = 'RECURSO_FORRAJERO'
      Origin = 'TAB_POTREROS.RECURSO_FORRAJERO'
    end
    object IBQAbmSimpleCRFSINONIMO: TIBStringField
      FieldName = 'CRFSINONIMO'
      Origin = 'COD_RECURSOS_FORRAJEROS.SINONIMO'
      Size = 50
    end
    object IBQAbmSimpleHECTAREAS: TIBBCDField
      FieldName = 'HECTAREAS'
      Precision = 9
      Size = 2
    end
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_POTRERO,'
      '  NOMBRE,'
      '  FECHA_RECURSO_FORRAJERO,'
      '  RECURSO_FORRAJERO,'
      '  HECTAREAS,'
      '  DESCRIPCION,'
      '  ESTABLECIMIENTO'
      'from TAB_POTREROS '
      'where'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO and'
      '  ID_POTRERO = :ID_POTRERO')
    ModifySQL.Strings = (
      'update TAB_POTREROS'
      'set'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO,'
      '  HECTAREAS = :HECTAREAS,'
      '  ID_POTRERO = :ID_POTRERO,'
      '  NOMBRE = :NOMBRE,'
      '  RECURSO_FORRAJERO = :RECURSO_FORRAJERO'
      'where'
      '  ESTABLECIMIENTO = :OLD_ESTABLECIMIENTO and'
      '  ID_POTRERO = :OLD_ID_POTRERO')
    InsertSQL.Strings = (
      'insert into TAB_POTREROS'
      '  (ESTABLECIMIENTO, HECTAREAS, ID_POTRERO, NOMBRE, '
      'RECURSO_FORRAJERO)'
      'values'
      '  (:ESTABLECIMIENTO, :HECTAREAS, :ID_POTRERO, :NOMBRE, '
      ':RECURSO_FORRAJERO)')
    DeleteSQL.Strings = (
      'delete from TAB_POTREROS'
      'where'
      '  ESTABLECIMIENTO = :OLD_ESTABLECIMIENTO and'
      '  ID_POTRERO = :OLD_ID_POTRERO')
  end
  object IBQSPEventosPotreros: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_EVENTOS_POTREROS('
      '  :FECHA,'
      '  :OBSERVACION,'
      '  :ESTABLECIMIENTO,'
      '  :RESPONSABLE,'
      '  :POTRERO,'
      '  :RECURSO,'
      '  :SUPERFICIETOTAL,'
      '  :SUPERFICIEGANADERA,'
      '  :SUPERFICIEAGRICOLA,'
      '  :TRATAMIENTO,'
      '  :MATERIASECA,'
      '  :OBSERVACIOANALISISSUELO, '
      '  :RESERVAFORRAJERAS,'
      '  :CANTIDADRESERVA,'
      '  :UNIDADRESERVA,'
      '  :VISIBLE) ')
    Left = 376
    Top = 262
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESPONSABLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECURSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUPERFICIETOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUPERFICIEGANADERA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUPERFICIEAGRICOLA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TRATAMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MATERIASECA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACIOANALISISSUELO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESERVAFORRAJERAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANTIDADRESERVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UNIDADRESERVA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VISIBLE'
        ParamType = ptUnknown
      end>
  end
  object DSIBQSPEventosPotreros: TDataSource
    DataSet = IBQSPEventosPotreros
    Left = 408
    Top = 262
  end
  object IBQUltimoIdPotrero: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Gen_Id(GEN_ID_TABPOTRERO,0) FROM RDB$DATABASE;')
    Left = 472
    Top = 262
  end
  object DSUltimoIdPotrero: TDataSource
    DataSet = IBQUltimoIdPotrero
    Left = 504
    Top = 262
  end
  object DSSuperficiesPotrero: TDataSource
    DataSet = IBQSuperficiesPotrero
    Left = 440
    Top = 296
  end
  object IBQSuperficiesPotrero: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select first 1 ps.superficietotal, ps.superficieganadera,'
      '       ps.superficieagricola'
      'from POTRERO_SUPERFICIE ps'
      'where ps.establecimiento = :ESTA and ps.potrero = :POTRERO'
      'order by ps.fecha desc, id_potrero_superficie desc')
    Left = 472
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end>
  end
  object IBQPotreroVisible: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT visible from tab_potreros where id_potrero = :potrero and' +
        ' establecimiento = :establecimiento')
    Left = 472
    Top = 230
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'potrero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
  end
  object DSPotreroVisible: TDataSource
    DataSet = IBQPotreroVisible
    Left = 504
    Top = 230
  end
  object IBQBorrarEventosPotreros: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from potrero_superficie where potrero = :potrero')
    Left = 482
    Top = 92
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'potrero'
        ParamType = ptUnknown
      end>
  end
  object IBQVerificarNombre: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT NOMBRE'
      'FROM TAB_POTREROS'
      'WHERE (UPPER(TAB_POTREROS.NOMBRE) = :nombre)'
      'AND (TAB_POTREROS.ESTABLECIMIENTO = :estab)'
      
        'AND ((TAB_POTREROS.ID_POTRERO <> :id_potrero) OR (:id_potrero = ' +
        '-1));')
    Left = 72
    Top = 236
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'estab'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_potrero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_potrero'
        ParamType = ptUnknown
      end>
  end
end
