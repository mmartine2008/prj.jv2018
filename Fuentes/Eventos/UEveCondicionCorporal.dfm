inherited FEveCondicionCorporal: TFEveCondicionCorporal
  Left = 220
  Top = 103
  HelpContext = 11000
  Caption = 'Condicion Corporal'
  ClientHeight = 590
  ClientWidth = 1032
  Constraints.MinHeight = 518
  Constraints.MinWidth = 689
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1032
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
  inherited PError: TPageControl
    Top = 477
    Width = 1032
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1024
      end
    end
  end
  inherited PDatos: TPanel
    Width = 1032
    Height = 390
    inherited PCBasico: TPageControl
      Width = 1032
      Height = 308
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 1024
          Height = 266
        end
        inherited MSimple: TMangazo
          Width = 1024
          Height = 266
          inherited GBFiltro: TGroupBox
            Width = 1024
          end
          inherited PSeleccion: TPanel
            Width = 1024
            inherited GBDisponibles: TGroupBox
              Height = 215
              inherited IFondoDis: TImage
                Height = 196
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 196
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 121
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
                    Width = 189
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Height = 215
              inherited IFondoSel: TImage
                Height = 196
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Height = 196
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 131
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
                    Width = 162
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Height = 215
              inherited IFondo: TImage
                Height = 215
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
            Width = 1024
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 1024
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 1024
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            FAWidth = 145
            FAHeight = 170
            FCWidth = 22
            FCHeight = 22
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select  A.ID_AUX,A.ID_RP, A.ID_SENASA, A.ID_ANIMAL, a.id_pc, a.i' +
                'd_hba, a.id_otro, A.SEXO, A.LOTE, A.POTRERO,A.RODEO, A.nombre, A' +
                '.CATEGORIA  from AUX_ANIMALES A')
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
          Width = 1024
          Height = 156
          object LObservador: TLabel
            Left = 48
            Top = 92
            Width = 67
            Height = 15
            Cursor = crHandPoint
            Caption = 'Observador:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
            Layout = tlCenter
            OnClick = LResponsableClick
            OnMouseEnter = LObservadorMouseEnter
            OnMouseLeave = LObservadorMouseLeave
          end
          object LFecha: TLabel
            Left = 74
            Top = 56
            Width = 37
            Height = 14
            AutoSize = False
            Caption = 'Fecha:'
            Layout = tlCenter
          end
          object LCondicionCorporal: TLabel
            Left = 367
            Top = 56
            Width = 99
            Height = 14
            AutoSize = False
            Caption = 'Condicion Corporal:'
            Layout = tlCenter
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 130
            Top = 51
            Width = 131
            Height = 21
            Date = 38657.411226122680000000
            Time = 38657.411226122680000000
            Color = 14679807
            TabOrder = 0
            OnChange = DTPAFechaChange
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 130
            Top = 86
            Width = 234
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 1
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object DBLCBACondicionCorporal: TDBLookupComboBoxAuto
            Left = 484
            Top = 51
            Width = 164
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_CONDICION_CORPORAL'
            ListField = 'ESCALA'
            ListSource = DMSoftvet.DSCondicionCorporal
            TabOrder = 2
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 156
          Width = 1024
          Height = 110
          inherited MAObservacion: TMemoAuto
            Height = 229
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Width = 929
          Height = 266
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Caption = 'RP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONDICION_CORPORAL'
              Title.Caption = 'Cond. Corporal'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 346
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 142
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 266
        end
        inherited PanelDer: TPanel
          Left = 976
          Height = 266
        end
      end
    end
    inherited PBotones: TPanel
      Top = 308
      Width = 1032
      inherited SBSelTodos: TSpeedButton
        Left = 1014
      end
      inherited IFondoB2: TImage
        Width = 606
      end
      inherited BBCancelar: TBitBtn
        Left = 949
      end
      inherited BBAnterior: TBitBtn
        Left = 1047
      end
      inherited BBSiguiente: TBitBtn
        Left = 1145
      end
      inherited BBTerminar: TBitBtn
        Left = 1243
      end
      inherited PL: TPanel
        Left = 606
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1032
    Caption = 'Condici'#243'n Corporal'
    inherited LTitulo: TLabel
      Width = 628
    end
    inherited PILeft: TPanel
      Left = 824
    end
  end
  inherited Psocalo: TPanel
    Top = 455
    Width = 1032
    inherited JvSocalo: TJvImage
      Width = 1032
    end
  end
  inherited ALUniversal: TActionList
    Left = 475
    Top = 22
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 244
    Top = 71
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (V8, V10, V7, V6, V5, ID_SENASA, V9, V11, ID_RP, FECHA, OBSERV' +
        'ACION, '
      
        '   RESPONSABLE, V1, V2, NOMBRE, V3, V4, I1, I2, I3, D1, D2, D3, ' +
        'ID_ANIMAL, '
      
        '   ID_AUX_EVENTO, I4, I5, I6, I7, I8, I9, VUNO1, VUNO2, VUNO3, V' +
        'UNO4, VUNO5, '
      '   VUNO6, EW, H1, V12, F1, F2, F3, F4, F5)'
      'values'
      
        '  (:V8, :V10, :V7, :V6, :V5, :ID_SENASA, :V9, :V11, :ID_RP, :FEC' +
        'HA, :OBSERVACION, '
      
        '   :RESPONSABLE, :V1, :V2, :NOMBRE, :V3, :V4, :I1, :I2, :I3, :D1' +
        ', :D2, '
      
        '   :D3, :ID_ANIMAL, :ID_AUX_EVENTO, :I4, :I5, :I6, :I7, :I8, :I9' +
        ', :VUNO1, '
      
        '   :VUNO2, :VUNO3, :VUNO4, :VUNO5, :VUNO6, :EW, :H1, :V12, :F1, ' +
        ':F2, :F3, '
      '   :F4, :F5)')
    RefreshSQL.Strings = (
      'Select '
      '  V8,'
      '  V10,'
      '  V7,'
      '  V6,'
      '  V5,'
      '  ID_SENASA,'
      '  V9,'
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
      '  EW,'
      '  H1,'
      '  V12,'
      '  F1,'
      '  F2,'
      '  F3,'
      '  F4,'
      '  F5'
      'from AUX_EVENTOS '
      'where'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO')
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, D1 AS FECHA, R' +
        'ESPONSABLE, v1 as RESP,  F1 as condicion_corporal,   I1 as idcon' +
        'dicion_corporal, EW from AUX_EVENTOS ')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  V8 = :V8,'
      '  V10 = :V10,'
      '  V7 = :V7,'
      '  V6 = :V6,'
      '  V5 = :V5,'
      '  ID_SENASA = :ID_SENASA,'
      '  V9 = :V9,'
      '  V11 = :V11,'
      '  ID_RP = :ID_RP,'
      '  FECHA = :FECHA,'
      '  OBSERVACION = :OBSERVACION,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  V1 = :V1,'
      '  V2 = :V2,'
      '  NOMBRE = :NOMBRE,'
      '  V3 = :V3,'
      '  V4 = :V4,'
      '  I1 = :I1,'
      '  I2 = :I2,'
      '  I3 = :I3,'
      '  D1 = :D1,'
      '  D2 = :D2,'
      '  D3 = :D3,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO,'
      '  I4 = :I4,'
      '  I5 = :I5,'
      '  I6 = :I6,'
      '  I7 = :I7,'
      '  I8 = :I8,'
      '  I9 = :I9,'
      '  VUNO1 = :VUNO1,'
      '  VUNO2 = :VUNO2,'
      '  VUNO3 = :VUNO3,'
      '  VUNO4 = :VUNO4,'
      '  VUNO5 = :VUNO5,'
      '  VUNO6 = :VUNO6,'
      '  EW = :EW,'
      '  H1 = :H1,'
      '  V12 = :V12,'
      '  F1 = :F1,'
      '  F2 = :F2,'
      '  F3 = :F3,'
      '  F4 = :F4,'
      '  F5 = :F5'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    object IBDSSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_EVENTOS.ID_RP'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 10
    end
    object IBDSSimpleID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_EVENTOS.ID_SENASA'
      Size = 9
    end
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      OnSetText = SetText
      Size = 255
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.D1'
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleRESPSetText
      Size = 100
    end
    object IBDSSimpleCONDICION_CORPORAL: TFloatField
      FieldName = 'CONDICION_CORPORAL'
      Origin = 'AUX_EVENTOS.F1'
      OnSetText = IBDSSimpleRESPSetText
      MaxValue = 10.000000000000000000
      MinValue = 1.000000000000000000
      Precision = 2
    end
    object IBDSSimpleIDCONDICION_CORPORAL: TIntegerField
      FieldName = 'IDCONDICION_CORPORAL'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
  end
  inherited IBQValidaciones: TIBQuery
    Left = 356
    Top = 240
  end
  inherited SDXLS: TSaveDialog
    Left = 230
    Top = 237
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'ID_RP'
        Title = 'RP'
      end
      item
        DataField = 'CONDICION_CORPORAL'
        Title = 'Condici'#243'n Corporal'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end>
    Title.Text = 'Evento Condici'#243'n Corporal'
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 372
    Top = 231
  end
  inherited IBSPGeneradores: TIBStoredProc
    Top = 239
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'SELECT * FROM RN_CONDICION_CORPORAL (:ANIMAL, :ESTABLECIMIENTO, ' +
        ':fecha)')
    Left = 504
    Top = 22
    ParamData = <
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
  inherited DSIBQ_SPRN: TDataSource
    Left = 536
    Top = 22
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_CONDICION_CORPORAL '
      '( :CONDICION_CORPORAL,'
      '  :FECHA,'
      '  :ANIMAL,'
      '  :OBSERVACION,'
      '  :ESTABLECIMIENTO,'
      '  :RESPONSABLE,'
      '  :LOG_USUARIO,'
      '  :LOG_FECHA_MODIFICADO,'
      '  :DISPARADOR,'
      '  :ID_GRUPO)')
    Top = 22
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CONDICION_CORPORAL'
        ParamType = ptUnknown
      end
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
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Top = 22
  end
  inherited OpenDlg: TOpenDialog
    Top = 216
  end
  object IBQTipoCond: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select valor from rel_parametros_establecimiento where parametro' +
        '=3 and establecimiento=:esta')
    Left = 332
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
end
