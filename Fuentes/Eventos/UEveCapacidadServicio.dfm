inherited FEveCapacidadServicio: TFEveCapacidadServicio
  Left = 200
  Top = 11
  HelpContext = 8000
  Caption = 'Evento Capacidad de Servicio'
  Constraints.MinHeight = 624
  Constraints.MinWidth = 851
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
      TabOrder = 0
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
                    Width = 127
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
                    Width = 184
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
                    Width = 141
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
                    Width = 197
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
              
                'select  ID_AUX,ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otr' +
                'o, nombre, sexo from AUX_ANIMALES'
              'where id_animal > 0'
              ''
              ''
              '')
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
          Height = 173
          Caption = ' Datos '
          object LValor: TLabel
            Left = 150
            Top = 85
            Width = 31
            Height = 15
            Caption = 'Valor:'
          end
          object LObservador: TLabel
            Left = 411
            Top = 111
            Width = 76
            Height = 23
            Cursor = crHandPoint
            AutoSize = False
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
            Left = 439
            Top = 78
            Width = 37
            Height = 22
            AutoSize = False
            Caption = 'Fecha:'
            Layout = tlCenter
          end
          object LMetodologia: TLabel
            Left = 153
            Top = 40
            Width = 72
            Height = 22
            AutoSize = False
            Caption = 'Metodolog'#237'a: '
            Layout = tlCenter
          end
          object LTipo: TLabel
            Left = 122
            Top = 111
            Width = 57
            Height = 23
            AutoSize = False
            Caption = 'Resultado: '
            Layout = tlCenter
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 488
            Top = 111
            Width = 225
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 5
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 488
            Top = 78
            Width = 130
            Height = 21
            Date = 38657.411226122680000000
            Time = 38657.411226122680000000
            Color = 14679807
            TabOrder = 4
            OnChange = DTPAFechaChange
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBAValor: TDBLookupComboBoxAuto
            Left = 194
            Top = 80
            Width = 156
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_VALOR_CAPACIDAD'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSValorCapacidad
            TabOrder = 2
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object RB10: TRadioButton
            Left = 238
            Top = 43
            Width = 44
            Height = 18
            Caption = '10'#39
            TabOrder = 0
            OnEnter = GetEvent
          end
          object RB20: TRadioButton
            Left = 290
            Top = 43
            Width = 44
            Height = 18
            Caption = '20'#39
            TabOrder = 1
            OnEnter = GetEvent
          end
          object DBLCBATipo: TDBLookupComboBoxAuto
            Left = 194
            Top = 112
            Width = 165
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_CODIGO'
            ListField = 'VALOR'
            ListSource = DMSoftvet.DSCodigosGenericos
            TabOrder = 3
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 173
          Height = 227
          Caption = ' Observaciones '
          inherited MAObservacion: TMemoAuto
            Height = 208
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'METODOLOGIA'
              Title.Caption = 'Metodolog'#237'a'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Caption = 'Valor'
              Width = 241
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMTIPO'
              Title.Caption = 'Resultado'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 274
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      TabOrder = 1
      inherited SBSelTodos: TSpeedButton
        Left = 615
      end
      inherited BBCancelar: TBitBtn
        Left = 620
      end
      inherited BBAnterior: TBitBtn
        Left = 712
      end
      inherited BBSiguiente: TBitBtn
        Left = 803
      end
      inherited BBTerminar: TBitBtn
        Left = 937
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Capacidad de Servicio'
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 356
    Top = 103
  end
  inherited DSSimple: TDataSource
    Left = 296
    Top = 30
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_SENASA = :OLD_ID_SENASA and'
      '  ID_RP = :OLD_ID_RP and'
      '  FECHA = :OLD_FECHA and'
      '  OBSERVACION = :OLD_OBSERVACION and'
      '  RESPONSABLE = :OLD_RESPONSABLE and'
      '  ID_ANIMAL = :OLD_ID_ANIMAL and'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO and'
      '  EW = :OLD_EW')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (V6, V5, ID_SENASA, ID_RP, FECHA, OBSERVACION, RESPONSABLE, V1' +
        ', V2, '
      'NOMBRE, '
      '   V3, V4, I1, I2, I3, D1, ID_ANIMAL, I4, EW)'
      'values'
      
        '  (:V6, :V5, :ID_SENASA, :ID_RP, :FECHA, :OBSERVACION, :RESPONSA' +
        'BLE, :V1, '
      
        '   :V2, :NOMBRE, :V3, :V4, :I1, :I2, :I3, :D1, :ID_ANIMAL, :I4, ' +
        ':EW)')
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
      '  ID_SENASA = :ID_SENASA and'
      '  ID_RP = :ID_RP and'
      '  FECHA = :FECHA and'
      '  OBSERVACION = :OBSERVACION and'
      '  RESPONSABLE = :RESPONSABLE and'
      '  ID_ANIMAL = :ID_ANIMAL and'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO and'
      '  EW = :EW')
    SelectSQL.Strings = (
      
        'select ID_AUX_EVENTO, ID_ANIMAL, ID_RP, ID_SENASA, OBSERVACION, ' +
        'RESPONSABLE, V4 AS RESP, FECHA, I1 AS IDVALOR, V1 AS VALOR, V2 A' +
        'S METODOLOGIA, V5  ID_METODOLOGIA,  V3 AS TIPO, V4 AS NOMTIPO, E' +
        'W from AUX_EVENTOS')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  V6 = :V6,'
      '  V5 = :V5,'
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
      '  I4 = :I4,'
      '  EW = :EW'
      'where'
      '  ID_SENASA = :OLD_ID_SENASA and'
      '  ID_RP = :OLD_ID_RP and'
      '  FECHA = :OLD_FECHA and'
      '  OBSERVACION = :OLD_OBSERVACION and'
      '  RESPONSABLE = :OLD_RESPONSABLE and'
      '  ID_ANIMAL = :OLD_ID_ANIMAL and'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO and'
      '  EW = :OLD_EW')
    GeneratorField.Field = 'ID_AUX_EVENTO'
    GeneratorField.Generator = 'GEN_AUX_EVENTOS'
    Left = 268
    Top = 30
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
      OnSetText = IBDSSimpleID_RPSetText
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
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V4'
      OnSetText = IBDSSimpleVALORSetText
      Size = 100
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
      OnSetText = IBDSSimpleVALORSetText
    end
    object IBDSSimpleIDVALOR: TIntegerField
      FieldName = 'IDVALOR'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleVALOR: TIBStringField
      FieldName = 'VALOR'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleVALORSetText
      Size = 100
    end
    object IBDSSimpleMETODOLOGIA: TIBStringField
      FieldName = 'METODOLOGIA'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleVALORSetText
      Size = 100
    end
    object IBDSSimpleID_METODOLOGIA: TIBStringField
      FieldName = 'ID_METODOLOGIA'
      Origin = 'AUX_EVENTOS.V5'
      Size = 100
    end
    object IBDSSimpleTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'AUX_EVENTOS.V3'
      Size = 100
    end
    object IBDSSimpleNOMTIPO: TIBStringField
      FieldName = 'NOMTIPO'
      Origin = 'AUX_EVENTOS.V4'
      OnSetText = IBDSSimpleVALORSetText
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
  end
  inherited SDXLS: TSaveDialog
    Left = 262
    Top = 285
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
        DataField = 'METODOLOGIA'
        Title = 'Metodolog'#237'a'
      end
      item
        DataField = 'VALOR'
        Title = 'Valor'
      end
      item
        DataField = 'NOMTIPO'
        Title = 'Resultado'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end>
    Title.Text = 'Evento Capacidad de Servicio'
    Left = 208
    Top = 233
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 420
    Top = 311
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'SELECT * FROM RN_CAPACIDAD_SERVICIO(:ANIMAL, :ESTABLECIMIENTO, :' +
        'fecha) ')
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
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_Capacidad_Servicio'
      
        '( :FECHA , :ANIMAL, :DISPARADOR , :OBSERVACION , :ESTABLECIMIENT' +
        'O ,   :RESPONSABLE , :LOG_USUARIO ,  :LOG_FECHA_MODIFICADO ,  :M' +
        'ETODOLOGIA, :TIPO, :VALOR, :ID_GRUPO)'
      '')
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
        Name = 'DISPARADOR'
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
        Name = 'METODOLOGIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end>
  end
  inherited OpenDlg: TOpenDialog
    Top = 232
  end
  object IBQCodigosGenericos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo)')
    Left = 432
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
    Left = 472
    Top = 24
  end
end
