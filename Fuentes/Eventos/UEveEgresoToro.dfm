inherited FEveEgresoToro: TFEveEgresoToro
  Left = 201
  Top = 206
  HelpContext = 17000
  Caption = 'Evento Egreso de Toro'
  Constraints.MinHeight = 662
  Constraints.MinWidth = 943
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
  inherited PDatos: TPanel
    inherited PCBasico: TPageControl
      ActivePage = TSServicio
      TabOrder = 0
      inherited TSServicio: TTabSheet
        ImageIndex = 6
        inherited BDBGServicios: TDBGrid
          Width = 1002
          Height = 304
          OnExit = GetEvent
        end
      end
      inherited TSManga: TTabSheet
        ImageIndex = 3
        inherited MSimple: TMangazo
          inherited PSeleccion: TPanel
            inherited GBDisponibles: TGroupBox
              inherited BDBGDisponibles: TBitDBGrid
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 128
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Width = 134
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              inherited BDBGSeleccionados: TBitDBGrid
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 109
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Width = 224
                    Visible = True
                  end>
              end
            end
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            FAWidth = 145
            FAHeight = 170
            FCWidth = 22
            FCHeight = 22
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select  ID_AUX,ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otr' +
                'o, nombre, sexo from AUX_ANIMALES')
          end
          inherited IBUSQLIntercambiarIzq: TIBUpdateSQL
            RefreshSQL.Strings = (
              'Select '
              '  ID_AUX,'
              '  ESTABLECIMIENTO,'
              '  ID_ANIMAL,'
              '  ID_RP,'
              '  ID_SENASA,'
              '  ID_PC,'
              '  ID_HBA,'
              '  ID_RA,'
              '  ID_OTRO,'
              '  NOMBRE,'
              '  FECHA_NACIMIENTO,'
              '  SEXO,'
              '  PESO,'
              '  ORIGEN,'
              '  CIRCUNFERENCIA_ESCROTAL,'
              '  ESTADO_REPRODUCTIVO,'
              '  ESTADO_LACTACION,'
              '  POTRERO,'
              '  LOTE,'
              '  RAZA,'
              '  RODEO,'
              '  CATEGORIA,'
              '  ACTIVO,'
              '  CRONOLOGIA_DENTARIA,'
              '  CONDICION_CORPORAL,'
              '  MADRE_BIOLOGICA_EXTERNA,'
              '  MADRE_RECEPTORA_EXTERNA,'
              '  GDR,'
              '  PADRE_EXTERNO,'
              '  MADRE_BIOLOGICA_INTERNA,'
              '  MADRE_RECEPTORA_INTERNA,'
              '  PADRE_INTERNO,'
              '  APODO,'
              '  V1,'
              '  V2,'
              '  V3,'
              '  V4,'
              '  V5,'
              '  V6,'
              '  EW,'
              '  DTA,'
              '  V7,'
              '  V8,'
              '  V9,'
              '  VUNO1,'
              '  TIPO_ALTA,'
              '  FECHA_ALTA,'
              '  OBSERVACION,'
              '  RESPONSABLE,'
              '  PRECIO_UNITARIO,'
              '  PRECIO_BRUTO,'
              '  GASTOS,'
              '  V10,'
              '  ACTIVIDAD,'
              '  ID_IE,'
              '  ADN,'
              '  TIPIFICACION_SANGUINEA,'
              '  CRIADOR,'
              '  PROPIETARIO,'
              '  ORIGEN_ANIMAL,'
              '  V11,'
              '  V12,'
              '  V13,'
              '  VUNO2'
              'from AUX_ANIMALES '
              'where'
              '  ID_ANIMAL = :ID_ANIMAL')
            ModifySQL.Strings = (
              'update AUX_ANIMALES'
              'set'
              '  ID_AUX = :ID_AUX,'
              '  ID_RP = :ID_RP,'
              '  ID_SENASA = :ID_SENASA,'
              '  ID_ANIMAL = :ID_ANIMAL,'
              '  ID_PC = :ID_PC,'
              '  ID_HBA = :ID_HBA,'
              '  ID_OTRO = :ID_OTRO,'
              '  SEXO = :SEXO'
              'where'
              '  ID_ANIMAL = :OLD_ID_ANIMAL')
            InsertSQL.Strings = (
              'insert into AUX_ANIMALES'
              
                '  (ID_AUX, ID_RP, ID_SENASA, ID_ANIMAL, ID_PC, ID_HBA, ID_OTRO, ' +
                'SEXO)'
              'values'
              
                '  (:ID_AUX, :ID_RP, :ID_SENASA, :ID_ANIMAL, :ID_PC, :ID_HBA, :ID' +
                '_OTRO, '
              '   :SEXO)')
          end
          inherited IBUSQLIntercambiarDer: TIBUpdateSQL
            RefreshSQL.Strings = (
              'Select *'
              'from Tab_Animales '
              'where'
              '  ID_ANIMAL = :ID_ANIMAL')
            ModifySQL.Strings = (
              'update Tab_Animales'
              'set'
              '  ID_ANIMAL = :ID_ANIMAL,'
              '  ID_RP = :ID_RP,'
              '  ID_SENASA = :ID_SENASA,'
              '  ID_PC = :ID_PC,'
              '  ID_HBA = :ID_HBA,'
              '  ID_OTRO = :ID_OTRO,'
              '  SEXO = :SEXO'
              'where'
              '  ID_ANIMAL = :OLD_ID_ANIMAL')
            InsertSQL.Strings = (
              'insert into Tab_Animales'
              '  (ID_ANIMAL, ID_RP, ID_SENASA, ID_PC, ID_HBA, ID_OTRO, SEXO)'
              'values'
              
                '  (:ID_ANIMAL, :ID_RP, :ID_SENASA, :ID_PC, :ID_HBA, :ID_OTRO, :S' +
                'EXO)')
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Height = 130
          inherited LFecha: TLabel
            Left = 152
            Top = 40
          end
          inherited LResponsable: TLabel
            Left = 117
            Top = 76
            Width = 82
            Cursor = crHandPoint
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = LResponsableClick
            OnMouseEnter = LResponsableMouseEnter
            OnMouseLeave = LResponsableMouseLeave
          end
          object Label1: TLabel [2]
            Left = 445
            Top = 80
            Width = 43
            Height = 15
            Cursor = crHandPoint
            Caption = 'Potrero:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = Label1Click
            OnMouseEnter = Label1MouseEnter
            OnMouseLeave = Label1MouseLeave
          end
          inherited DTPAFecha: TDateTimePickerAuto
            Left = 211
            Top = 41
            Color = 14679807
            OnCloseUp = DTPAFechaCloseUp
            OnExit = GetEvent
            EsRequerido = True
          end
          inherited DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 211
            Top = 78
            Color = 14679807
            OnExit = GetEvent
            EsRequerido = True
          end
          object DBLCBAPotrero: TDBLookupComboBoxAuto
            Left = 510
            Top = 76
            Width = 200
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_POTRERO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSPotrero
            TabOrder = 2
            OnCloseUp = DBLCBAPotreroCloseUp
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 130
          Height = 174
          inherited MAObservacion: TMemoAuto
            Width = 998
            Height = 251
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_AUX_EVENTO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_ANIMAL'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Caption = 'RP'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_SENASA'
              ReadOnly = True
              Title.Caption = 'Senasa'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 262
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSABLE'
              Title.Caption = 'Responsable'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 178
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERVICIO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IDSERVICIO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'EW'
              Visible = False
            end>
        end
      end
    end
    inherited PBotones: TPanel
      TabOrder = 1
      inherited SBSelTodos: TSpeedButton
        Left = 539
      end
      inherited BBCancelar: TBitBtn
        TabOrder = 2
      end
      inherited BBAnterior: TBitBtn
        Left = 721
      end
      inherited BBSiguiente: TBitBtn
        TabOrder = 0
      end
      inherited BBTerminar: TBitBtn
        Left = 905
      end
      inherited BSacarAnimal: TBitBtn
        Width = 189
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Egreso Toro'
  end
  inherited DSSimple: TDataSource
    Left = 272
    Top = 64
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      '  (ID_AUX_EVENTO, ID_ANIMAL, ID_RP, ID_SENASA, OBSERVACION, '
      'RESPONSABLE, '
      '   FECHA, EW)'
      'values'
      
        '  (:ID_AUX_EVENTO, :ID_ANIMAL, :ID_RP, :ID_SENASA, :OBSERVACION,' +
        ' '
      ':RESPONSABLE, '
      '   :FECHA, :EW)')
    RefreshSQL.Strings = (
      'Select '
      '  V9,'
      '  V8,'
      '  V10,'
      '  V7,'
      '  V6,'
      '  V5,'
      '  ID_SENASA,'
      '  V11,'
      '  ID_RP,'
      '  FECHA,'
      '  OBSERVACION,'
      '  RESPONSABLE,'
      '  V1,'
      '  V2,'
      '  NOMBRE,'
      '  V3,'
      '  V4,'
      '  I1,'
      '  I2,'
      '  I3,'
      '  D1,'
      '  D2,'
      '  D3,'
      '  ID_ANIMAL,'
      '  ID_AUX_EVENTO,'
      '  I4,'
      '  I5,'
      '  I6,'
      '  I7,'
      '  I8,'
      '  I9,'
      '  VUNO1,'
      '  VUNO2,'
      '  VUNO3,'
      '  VUNO4,'
      '  VUNO5,'
      '  VUNO6,'
      '  EW'
      'from AUX_EVENTOS '
      'where'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO')
    SelectSQL.Strings = (
      
        'select ID_AUX_EVENTO, ID_ANIMAL, ID_RP, ID_SENASA, OBSERVACION, ' +
        'RESPONSABLE, FECHA, V1 AS RESP, V2 AS SERVICIO, I1 AS IDSERVICIO' +
        ',EW from AUX_EVENTOS')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  OBSERVACION = :OBSERVACION,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  FECHA = :FECHA,'
      '  EW = :EW'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    GeneratorField.Field = 'ID_AUX_EVENTO'
    GeneratorField.Generator = 'GEN_AUX_EVENTOS'
    Left = 236
    Top = 62
    object IBDSSimpleID_AUX_EVENTO: TIntegerField
      FieldName = 'ID_AUX_EVENTO'
      Origin = 'AUX_EVENTOS.ID_AUX_EVENTO'
    end
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_EVENTOS.ID_RP'
      Size = 10
    end
    object IBDSSimpleID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_EVENTOS.ID_SENASA'
      Size = 9
    end
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      OnSetText = SetText
      Size = 255
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleRESPSetText
      Size = 100
    end
    object IBDSSimpleSERVICIO: TIBStringField
      FieldName = 'SERVICIO'
      Origin = 'AUX_EVENTOS.V2'
      Size = 100
    end
    object IBDSSimpleIDSERVICIO: TIntegerField
      FieldName = 'IDSERVICIO'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDNUEVOGRUPO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'ESTABLECIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBREGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCIONGRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_EVENTO'
        ParamType = ptInput
      end>
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'ID_RP'
        Title = 'RP'
      end
      item
        DataField = 'ID_SENASA'
        Title = 'SENASA'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end>
    Title.Text = 'Egreso de Toro de servicio'
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from RN_EGRESO_TORO(:servicio,:ANIMAL, :ESTABLECIMIENTO' +
        ', :fecha) ')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'servicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_EGRESO_TORO ('
      '  :FECHA,  :ANIMAL,  :OBSERVACION,  :ESTABLECIMIENTO,'
      '  :RESPONSABLE,  :LOG_USUARIO,  :LOG_FECHA_MODIFICADO,'
      ' :SERVICIO,  :ID_GRUPO, :POTRERO, :DISPARADOR,:TIPOEGRESO)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
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
        Name = 'LOG_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOG_FECHA_MODIFICADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERVICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPOEGRESO'
        ParamType = ptUnknown
      end>
  end
  object SPCerrar_Servicio: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'SP_CERRAR_SERVICIO'
    Left = 660
    Top = 70
    ParamData = <
      item
        DataType = ftDate
        Name = 'FECHA_FIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERVICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ESTABLECIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESPONSABLE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LOG_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'LOG_FECHA_MODIFICADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'POTRERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DISPARADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONDICION_CORPORAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOEGRESO'
        ParamType = ptInput
      end>
  end
  object IBQFechaIngresoServicio: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select distinct E.FECHA'
      'from EVE_INGRESO_TORO IT, EVE_EVENTOS E, REL_PERTENECE_GRUPO PG'
      
        'where (IT.SERVICIO= :idservicio) and (IT.ID_EVENTO = E.ID_EVENTO' +
        ') ')
    Left = 12
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idservicio'
        ParamType = ptUnknown
      end>
  end
  object IBQRNCerrarServicio: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from RN_CERRAR_SERVICIO(:servicio,:grupo,:esta)')
    Left = 732
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'servicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
end
