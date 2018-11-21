inherited FEveCalidadSeminal: TFEveCalidadSeminal
  Left = 132
  Top = 30
  HelpContext = 6000
  Caption = 'Evento Calidad Seminal'
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
      ActivePage = TSDatos
      inherited TSManga: TTabSheet
        inherited MSimple: TMangazo
          inherited PSeleccion: TPanel
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
                    Width = 154
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
                    Width = 156
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
                    Width = 132
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
                    Width = 230
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
          end
          inherited GBFiltros: TGroupBox
            Top = 190
          end
          inherited Panel1: TPanel
            Top = 169
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select A.ID_AUX, A.ID_RP, A.ID_SENASA, A.ID_ANIMAL, A.id_pc, a.i' +
                'd_hba, a.id_otro, A.SEXO, A.LOTE, A.POTRERO,A.RODEO, A.nombre, A' +
                '.CATEGORIA from AUX_ANIMALES A')
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
          Height = 148
          object LResultado: TLabel
            Left = 89
            Top = 82
            Width = 63
            Height = 15
            Caption = 'Resultado: '
          end
          object LObservador: TLabel
            Left = 419
            Top = 79
            Width = 79
            Height = 22
            Cursor = crHandPoint
            AutoSize = False
            Caption = 'Observador:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            Layout = tlCenter
            OnClick = LResponsableClick
            OnMouseEnter = LObservadorMouseEnter
            OnMouseLeave = LObservadorMouseLeave
          end
          object LFecha: TLabel
            Left = 443
            Top = 41
            Width = 36
            Height = 23
            AutoSize = False
            Caption = 'Fecha:'
            Layout = tlCenter
          end
          object LMetodoToma: TLabel
            Left = 70
            Top = 41
            Width = 78
            Height = 23
            AutoSize = False
            Caption = 'M'#233'todo Toma: '
            Layout = tlCenter
          end
          object CBAObservador: TDBLookupComboBoxAuto
            Left = 499
            Top = 75
            Width = 190
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 3
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 499
            Top = 37
            Width = 130
            Height = 21
            Date = 38657.411226122680000000
            Time = 38657.411226122680000000
            Color = 14679807
            TabOrder = 2
            OnChange = DTPAFechaChange
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBAMetodoToma: TDBLookupComboBoxAuto
            Left = 163
            Top = 37
            Width = 217
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_METODO_TOMA'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSMetodo
            TabOrder = 0
            OnCloseUp = DBLCBAMetodoTomaCloseUp
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object DBLCBAResultado: TDBLookupComboBoxAuto
            Left = 163
            Top = 75
            Width = 182
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_CODIGO'
            ListField = 'VALOR'
            ListSource = DMSoftvet.DSCodigosGenericos
            TabOrder = 1
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 148
          Height = 252
          inherited MAObservacion: TMemoAuto
            Height = 233
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Caption = 'RP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_SENASA'
              ReadOnly = True
              Title.Caption = 'Senasa'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'METODO'
              Title.Caption = 'M'#233'todo'
              Width = 126
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESULTADO'
              Title.Caption = 'Resultado'
              Width = 126
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 272
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 167
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 598
      end
      inherited BBCancelar: TBitBtn
        Left = 614
      end
      inherited BBAnterior: TBitBtn
        Left = 706
      end
      inherited BBSiguiente: TBitBtn
        Left = 801
      end
      inherited BBTerminar: TBitBtn
        Left = 896
      end
      inherited BIngresoSecuenciado: TBitBtn
        Left = 51
      end
      inherited BSacarAnimal: TBitBtn
        Left = 176
      end
      inherited BBXls: TBitBtn
        Left = 48
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Calidad Seminal'
  end
  inherited ALUniversal: TActionList
    Left = 251
    Top = 14
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Top = 79
  end
  inherited DSSimple: TDataSource
    Left = 64
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_SENASA, ID_RP, FECHA, OBSERVACION, RESPONSABLE, V1, V2, NO' +
        'MBRE, '
      'V3, '
      '   V4, I1, I2, I3, D1, ID_ANIMAL, ID_AUX_EVENTO, I4, I5, EW)'
      'values'
      
        '  (:ID_SENASA, :ID_RP, :FECHA, :OBSERVACION, :RESPONSABLE, :V1, ' +
        ':V2, '
      ':NOMBRE, '
      
        '   :V3, :V4, :I1, :I2, :I3, :D1, :ID_ANIMAL, :ID_AUX_EVENTO, :I4' +
        ', :I5, '
      '   :EW)')
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
        'ESPONSABLE, I1 AS ID_METODO_TOMA, V1 AS METODO, V2 AS RESULTADO,' +
        ' V4 AS ID_RESULTADO, V3  AS RESP, EW from AUX_EVENTOS ')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_SENASA = :ID_SENASA,'
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
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO,'
      '  I4 = :I4,'
      '  I5 = :I5,'
      '  EW = :EW'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    Left = 32
    Top = 80
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
      OnSetText = IBDSSimpleFECHASetText
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleID_METODO_TOMA: TIntegerField
      FieldName = 'ID_METODO_TOMA'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleMETODO: TIBStringField
      FieldName = 'METODO'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleFECHASetText
      Size = 100
    end
    object IBDSSimpleRESULTADO: TIBStringField
      FieldName = 'RESULTADO'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleFECHASetText
      Size = 100
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = SetText
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleID_RESULTADO: TIBStringField
      FieldName = 'ID_RESULTADO'
      Origin = 'AUX_EVENTOS.V4'
      Size = 100
    end
  end
  inherited IBQValidaciones: TIBQuery
    Top = 158
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
        DataField = 'METODO'
        Title = 'M'#233'todo'
      end
      item
        DataField = 'RESULTADO'
        Title = 'Resultado'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end>
    Title.Text = 'Evento Calidad Seminal'
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'SELECT * FROM RN_CALIDAD_SEMINAL(:ANIMAL, :ESTABLECIMIENTO, :fec' +
        'ha) ')
    Left = 280
    Top = 14
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
    Left = 312
    Top = 14
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_Calidad_Seminal'
      
        '( :FECHA , :ANIMAL , :OBSERVACION , :ESTABLECIMIENTO ,   :RESPON' +
        'SABLE , :LOG_USUARIO ,  :LOG_FECHA_MODIFICADO ,    :RESULTADO, N' +
        'ULL,:ID_METODO_TOMA, :ID_GRUPO,:DISPARADOR)')
    Left = 344
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
        Name = 'RESULTADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_METODO_TOMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 376
  end
  object IBQCodigosGenericos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo)')
    Left = 456
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSCodigosGenericos: TDataSource
    DataSet = IBQCodigosGenericos
    Left = 496
    Top = 24
  end
end
