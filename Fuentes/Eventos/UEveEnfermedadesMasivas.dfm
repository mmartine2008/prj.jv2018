inherited FEveEnfermedadesMasivas: TFEveEnfermedadesMasivas
  Left = -7
  Top = 17
  HelpContext = 36000
  Caption = 'FEveEnfermedadesMasivas'
  Constraints.MinHeight = 652
  Constraints.MinWidth = 808
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
              Height = 215
              inherited IFondoDis: TImage
                Height = 196
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 196
                TitleFont.Height = -14
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 86
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
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
                    Width = 93
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
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
          object LFecha: TLabel
            Left = 182
            Top = 24
            Width = 40
            Height = 15
            Caption = 'Fecha: '
            Layout = tlCenter
          end
          object LResponsable: TLabel
            Left = 148
            Top = 55
            Width = 78
            Height = 15
            Cursor = crHandPoint
            Caption = 'Responsable:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
            Layout = tlCenter
            OnClick = LResponsableClick
            OnMouseEnter = LResponsableMouseEnter
            OnMouseLeave = LResponsableMouseLeave
          end
          object LResultado: TLabel
            Left = 163
            Top = 89
            Width = 63
            Height = 15
            Caption = 'Resultado: '
            Layout = tlCenter
          end
          object LResultadoCampi: TLabel
            Left = 66
            Top = 124
            Width = 174
            Height = 15
            Caption = 'Resultado Campilobacteriosis: '
            Layout = tlCenter
          end
          object LResultadoTrico: TLabel
            Left = 88
            Top = 158
            Width = 145
            Height = 15
            Caption = 'Resultado Tricomoniasis: '
            Layout = tlCenter
          end
          object LPToma: TLabel
            Left = 508
            Top = 121
            Width = 76
            Height = 15
            Caption = 'Precio Toma: '
          end
          object LPLab: TLabel
            Left = 510
            Top = 155
            Width = 104
            Height = 15
            Caption = 'Precio Laboratorio:'
          end
          object LPrecio: TLabel
            Left = 508
            Top = 155
            Width = 41
            Height = 15
            Caption = 'Precio: '
            Visible = False
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 240
            Top = 47
            Width = 237
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
            ISParam = True
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 240
            Top = 15
            Width = 237
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
          object DBLCBAResultado: TDBLookupComboBoxAuto
            Left = 240
            Top = 82
            Width = 237
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_CODIGO'
            ListField = 'VALOR'
            ListSource = DMSoftvet.DSCodigosGenericos
            TabOrder = 2
            OnClick = DBLCBAResultadoClick
            OnCloseUp = DBLCBAResultadoClick
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBAResultadoCampi: TDBLookupComboBoxAuto
            Left = 240
            Top = 116
            Width = 237
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_CODIGO'
            ListField = 'VALOR'
            ListSource = DSGenericosEspecial
            TabOrder = 3
            OnClick = DBLCBAResultadoCampiClick
            OnCloseUp = DBLCBAResultadoCampiCloseUp
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBAResultadoTrico: TDBLookupComboBoxAuto
            Left = 240
            Top = 151
            Width = 237
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_CODIGO'
            ListField = 'VALOR'
            ListSource = DSGenericosEspecial
            TabOrder = 4
            OnClick = DBLCBAResultadoTricoClick
            OnCloseUp = DBLCBAResultadoTricoCloseUp
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object EPToma: TEdit
            Left = 629
            Top = 117
            Width = 96
            Height = 23
            TabOrder = 5
            OnChange = EPTomaChange
            OnExit = GetEvent
          end
          object EPLab: TEdit
            Left = 627
            Top = 150
            Width = 96
            Height = 23
            TabOrder = 6
            OnChange = EPLabChange
            OnExit = GetEvent
          end
          object EPrecio: TEdit
            Left = 552
            Top = 150
            Width = 95
            Height = 23
            TabOrder = 7
            Visible = False
            OnChange = EPrecioChange
            OnExit = GetEvent
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
              Title.Caption = 'RP Animal'
              Width = 86
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
              FieldName = 'RESULTADO'
              Title.Caption = 'Resultado'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESULTADO_CAMPI'
              Title.Caption = 'Resultado Campi'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESULTADO_TRICO'
              Title.Caption = 'Resultado Trico'
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 658
      end
      inherited BBCancelar: TBitBtn
        Left = 597
      end
      inherited BBAnterior: TBitBtn
        Left = 695
      end
      inherited BBSiguiente: TBitBtn
        Left = 793
      end
      inherited BBTerminar: TBitBtn
        Left = 891
      end
    end
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 156
    Top = 111
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_ANIMAL, ID_AUX_EVENTO, ID_RP, FECHA, OBSERVACION, RESPONSA' +
        'BLE, EW)'
      'values'
      
        '  (:ID_ANIMAL, :ID_AUX_EVENTO, :ID_RP, :FECHA, :OBSERVACION, :RE' +
        'SPONSABLE, '
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
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      'select ID_ANIMAL,'
      '          ID_AUX_EVENTO, '
      '          ID_RP, '
      '          FECHA, '
      '          OBSERVACION, '
      '          RESPONSABLE, '
      '          V1 as RESP,  '
      '          VUNO4 as ID_Resultado,'
      '          V10 as Resultado,'
      '          EW,'
      '          VUNO5 as ID_Resultado_Campi,'
      '          V8 as Resultado_Campi,'
      '          VUNO6 as ID_Resultado_Trico,'
      '          V9 as Resultado_Trico'
      'from AUX_EVENTOS')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO,'
      '  ID_RP = :ID_RP,'
      '  FECHA = :FECHA,'
      '  OBSERVACION = :OBSERVACION,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  EW = :EW'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleID_AUX_EVENTO: TIntegerField
      FieldName = 'ID_AUX_EVENTO'
      Origin = 'AUX_EVENTOS.ID_AUX_EVENTO'
    end
    object IBDSSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_EVENTOS.ID_RP'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 10
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
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
      Origin = 'AUX_EVENTOS.V1'
      OnChange = change
      OnSetText = SetText
      Size = 100
    end
    object IBDSSimpleID_RESULTADO: TIBStringField
      FieldName = 'ID_RESULTADO'
      Origin = 'AUX_EVENTOS.VUNO4'
      OnChange = IBDSSimpleID_RESULTADOChange
      Size = 1
    end
    object IBDSSimpleRESULTADO: TIBStringField
      FieldName = 'RESULTADO'
      Origin = 'AUX_EVENTOS.V10'
      OnChange = change
      OnSetText = SetText
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleID_RESULTADO_CAMPI: TIBStringField
      FieldName = 'ID_RESULTADO_CAMPI'
      Origin = 'AUX_EVENTOS.VUNO5'
      Size = 1
    end
    object IBDSSimpleRESULTADO_CAMPI: TIBStringField
      FieldName = 'RESULTADO_CAMPI'
      Origin = 'AUX_EVENTOS.V8'
      OnChange = change
      OnSetText = SetText
      Size = 100
    end
    object IBDSSimpleID_RESULTADO_TRICO: TIBStringField
      FieldName = 'ID_RESULTADO_TRICO'
      Origin = 'AUX_EVENTOS.VUNO6'
      Size = 1
    end
    object IBDSSimpleRESULTADO_TRICO: TIBStringField
      FieldName = 'RESULTADO_TRICO'
      Origin = 'AUX_EVENTOS.V9'
      OnChange = change
      OnSetText = SetText
      Size = 100
    end
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'ID_RP'
        Title = 'RP Animal'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'RESULTADO'
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
    Left = 304
    Top = 185
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 420
    Top = 31
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 476
    Top = 31
  end
  inherited IBSPGeneradores: TIBStoredProc
    Top = 215
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  object IBQGenericosEspecial: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) ' +
        'and (ID_CODIGO <>'#39'I'#39') and (ID_CODIGO <> '#39'S'#39')')
    Left = 564
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSGenericosEspecial: TDataSource
    DataSet = IBQGenericosEspecial
    Left = 536
    Top = 32
  end
end
