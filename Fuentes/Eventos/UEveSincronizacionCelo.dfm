inherited FEveSincronizacionCelo: TFEveSincronizacionCelo
  Left = 177
  HelpContext = 26000
  Caption = 'Sincronizacion de Celo'
  Constraints.MinHeight = 655
  Constraints.MinWidth = 1001
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
      inherited TSManga: TTabSheet
        inherited MSimple: TMangazo
          inherited PSeleccion: TPanel
            inherited GBDisponibles: TGroupBox
              Height = 209
              inherited IFondoDis: TImage
                Height = 190
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 190
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 136
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
                    Width = 176
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Height = 209
              inherited IFondoSel: TImage
                Height = 190
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Height = 190
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 156
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
                    Width = 137
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Height = 209
              inherited IFondo: TImage
                Height = 209
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
            inherited Label1: TLabel
              Width = 142
              Height = 16
            end
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
          Height = 165
          object LFecha: TLabel
            Left = 108
            Top = 52
            Width = 40
            Height = 15
            Caption = 'Fecha: '
            Layout = tlCenter
          end
          object LMetodo: TLabel
            Left = 439
            Top = 51
            Width = 39
            Height = 13
            Cursor = crHandPoint
            Caption = 'M'#233'todo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = LMetodoClick
            OnMouseEnter = LResponsableMouseEnter
            OnMouseLeave = LResponsableMouseLeave
          end
          object LResponsable: TLabel
            Left = 73
            Top = 84
            Width = 65
            Height = 13
            Cursor = crHandPoint
            Caption = 'Responsable:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            Layout = tlCenter
            OnClick = LResponsableClick
            OnMouseEnter = LResponsableMouseEnter
            OnMouseLeave = LResponsableMouseLeave
          end
          object LDesc: TLabel
            Left = 420
            Top = 85
            Width = 59
            Height = 13
            Cursor = crHandPoint
            Caption = 'Descripci'#243'n:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = LDescClick
            OnMouseEnter = LResponsableMouseEnter
            OnMouseLeave = LResponsableMouseLeave
          end
          object LHora: TLabel
            Left = 456
            Top = 117
            Width = 30
            Height = 15
            Caption = 'Hora:'
            Layout = tlCenter
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 162
            Top = 44
            Width = 236
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
          object DBLCBAMetodo: TDBLookupComboBoxAuto
            Left = 503
            Top = 46
            Width = 219
            Height = 23
            Color = clWhite
            DropDownRows = 20
            KeyField = 'ID_METODO'
            ListField = 'SINONIMO'
            ListSource = DMSoftvet.DSmetodosSincronizacion
            TabOrder = 1
            OnCloseUp = DBLCBAMetodoCloseUp
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 162
            Top = 78
            Width = 236
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 2
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBADescMetodos: TDBLookupComboBoxAuto
            Left = 503
            Top = 81
            Width = 219
            Height = 23
            Color = clWhite
            DropDownRows = 20
            KeyField = 'ID_DESCRIPCION'
            ListField = 'SINONIMO'
            ListSource = DSDescMetodos
            TabOrder = 3
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object DBLCBACondCorp: TDBLookupComboBoxAuto
            Left = 162
            Top = 113
            Width = 158
            Height = 23
            Color = clWhite
            DropDownRows = 20
            Enabled = False
            KeyField = 'ID_CONDICION_CORPORAL'
            ListField = 'VALOR'
            ListSource = DSCondCorp
            TabOrder = 4
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
          object CBCondCorp: TCheckBox
            Left = 26
            Top = 117
            Width = 122
            Height = 19
            Caption = 'Condici'#243'n Corporal:'
            TabOrder = 5
            OnClick = CBCondCorpClick
          end
          object CBDeteccion: TCheckBox
            Left = 439
            Top = 138
            Width = 294
            Height = 18
            Caption = 'Realizar Detecci'#243'n de Celo al Terminar'
            TabOrder = 6
            Visible = False
          end
          object CBTratamiento: TCheckBox
            Left = 439
            Top = 138
            Width = 191
            Height = 18
            Caption = 'Aplicar Tratamiento al Terminar'
            TabOrder = 7
            Visible = False
          end
          object DTPAHora: TDateTimePickerAuto
            Left = 503
            Top = 113
            Width = 147
            Height = 21
            Date = 0.375000000000000000
            Format = 'hh:mm tt'
            Time = 0.375000000000000000
            Color = clWhite
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 8
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 165
          Height = 235
          inherited MAObservacion: TMemoAuto
            Height = 216
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
              Width = 77
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
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V4'
              Title.Caption = 'Cond. Corporal'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'METODO'
              ReadOnly = True
              Title.Caption = 'M'#233'todo'
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V3'
              ReadOnly = True
              Title.Caption = 'Descripci'#243'n'
              Width = 134
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'H1'
              Title.Caption = 'Hora'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 132
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 167
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 584
      end
      inherited BBCancelar: TBitBtn
        Left = 621
      end
      inherited BBAnterior: TBitBtn
        Left = 715
      end
      inherited BBSiguiente: TBitBtn
        Left = 811
      end
      inherited BBTerminar: TBitBtn
        Left = 907
      end
      inherited BIngresoSecuenciado: TBitBtn
        Left = 249
      end
      inherited BSacarAnimal: TBitBtn
        Left = 149
      end
      inherited BBXlsImport: TBitBtn
        Left = 97
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Sincronizaci'#243'n de Celo'
  end
  inherited ALUniversal: TActionList
    Left = 627
    Top = 30
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 100
    Top = 7
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_SENASA, ID_RP, FECHA, OBSERVACION, RESPONSABLE, V1, V2, I1' +
        ', I2, I3, '
      'V3, I4, V4, ID_ANIMAL,EW,H1)'
      'values'
      
        '  (:ID_SENASA, :ID_RP, :FECHA, :OBSERVACION, :RESPONSABLE, :V1, ' +
        ':V2, :I1, '
      ':I2, :I3, :V3, :I4, :V4, :ID_ANIMAL, :EW,:H1)')
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
        'ESPONSABLE, v1 as RESP, I1 AS IDMETODO, V2 AS METODO, i3, v3, i4' +
        ', v4, EW,H1 from AUX_EVENTOS '
      ''
      '')
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
      '  I1 = :I1,'
      '  I2 = :I2,'
      '  I3 = :I3,'
      '  V3 = :V3,'
      '  I4 = :I4,'
      '  V4 = :V4,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  EW = :EW,'
      '  H1 = :H1'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    Left = 42
    Top = 8
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
      OnSetText = IBDSSimpleID_RPSetText
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
      OnSetText = IBDSSimpleID_RPSetText
      Size = 100
    end
    object IBDSSimpleIDMETODO: TIntegerField
      FieldName = 'IDMETODO'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleMETODO: TIBStringField
      FieldName = 'METODO'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 1
    end
    object IBDSSimpleI3: TIntegerField
      FieldName = 'I3'
      Origin = 'AUX_EVENTOS.I3'
    end
    object IBDSSimpleV3: TIBStringField
      FieldName = 'V3'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 100
    end
    object IBDSSimpleI4: TIntegerField
      FieldName = 'I4'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleV4: TIBStringField
      FieldName = 'V4'
      Origin = 'AUX_EVENTOS.V4'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 100
    end
    object IBDSSimpleH1: TTimeField
      FieldName = 'H1'
      Origin = 'AUX_EVENTOS.H1'
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 592
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
      end
      item
        DataType = ftUnknown
        Name = 'NRO_DTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PATH_DTE'
        ParamType = ptUnknown
      end>
  end
  inherited IBQValidaciones: TIBQuery
    Left = 356
    Top = 198
  end
  inherited IBQEvento: TIBQuery
    Left = 20
    Top = 254
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
        DataField = 'V4'
        Title = 'Cond. Corporal'
      end
      item
        DataField = 'METODO'
        Title = 'M'#233'todo'
      end
      item
        DataField = 'V3'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'H1'
        Title = 'Hora'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end>
    Title.Text = 'Evento Sincronizaci'#243'n de Celo'
  end
  inherited WinXP1: TWinXP
    Left = 448
    Top = 32
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 388
    Top = 199
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 420
    Top = 199
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 452
    Top = 199
  end
  inherited IBSPGeneradores: TIBStoredProc
    Top = 199
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Top = 31
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from RN_SINCRONIZACION_CELO(:ANIMAL, :ESTABLECIMIENTO, ' +
        ':FECHA) ')
    Left = 656
    Top = 30
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
        Name = 'FECHA'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 688
    Top = 30
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_Sincronizacion_Celo '
      '( :FECHA, :ANIMAL, :OBSERVACION, :ESTABLECIMIENTO,'
      '  :RESPONSABLE,  :LOG_USUARIO,  :LOG_FECHA_MODIFICADO,'
      
        '  :METODO,  :DISPARADOR,  :ID_GRUPO,:CONDICION_CORPORAL,:DESC_ME' +
        'TODO,:HORA)')
    Left = 520
    Top = 30
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
        Name = 'METODO'
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
      end
      item
        DataType = ftUnknown
        Name = 'CONDICION_CORPORAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESC_METODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 552
    Top = 30
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 476
    Top = 31
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 136
    Top = 8
  end
  inherited IBSPActEventos: TIBStoredProc
    Top = 359
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 484
    Top = 200
  end
  inherited IBQImportacion: TIBQuery
    Left = 124
    Top = 30
  end
  object IBQDescMetodos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQDescMetodosAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_DESCRIPCION,SINONIMO,NOMBRE,CODIGO,METODO from cod_des' +
        'c_metodos_sinc where  METODO=:id')
    Left = 644
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object DSDescMetodos: TDataSource
    DataSet = IBQDescMetodos
    Left = 612
    Top = 184
  end
  object IBQCondCorp: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQCondCorpAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_condiciones_corporales')
    Left = 580
    Top = 321
  end
  object DSCondCorp: TDataSource
    DataSet = IBQCondCorp
    Left = 540
    Top = 321
  end
end
