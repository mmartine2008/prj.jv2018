inherited FEvePartoMasivo: TFEvePartoMasivo
  Left = 218
  Top = 108
  Caption = 'FEvePartoMasivo'
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
      ActivePage = TSManga
      inherited TSManga: TTabSheet
        inherited MSimple: TMangazo
          inherited PSeleccion: TPanel
            inherited GBDisponibles: TGroupBox
              Width = 457
              Height = 94
              inherited IFondoDis: TImage
                Width = 453
                Height = 75
              end
              inherited BDBGDisponibles: TBitDBGrid
                Width = 453
                Height = 75
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 152
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
                    Width = 151
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Left = 565
              Width = 437
              Height = 94
              inherited IFondoSel: TImage
                Width = 433
                Height = 75
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 433
                Height = 75
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 152
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
                    Width = 144
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Left = 457
              Height = 94
              inherited IFondo: TImage
                Height = 94
              end
              inherited BBAgregarTodos: TJvImage
                OnClick = MSimpleBBAgregarTodosClick
              end
              inherited BBAgregarUno: TJvImage
                OnClick = MSimpleBBAgregarUnoClick
              end
              inherited BBEliminarUno: TJvImage
                OnClick = MSimpleBBEliminarUnoClick
              end
              inherited BBEliminarTodos: TJvImage
                OnClick = MSimpleBBEliminarTodosClick
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
            inherited Image1: TImage
              Width = 1002
            end
            inherited Label1: TLabel
              Width = 1002
            end
          end
          inherited IBQAnimales: TIBQuery
            Left = 208
          end
          inherited IBQPotrero: TIBQuery
            Left = 176
          end
          inherited IBQGrupo: TIBQuery
            Left = 240
            Top = 8
          end
          inherited IBQRodeo: TIBQuery
            Left = 144
            Top = 8
          end
          inherited DSAnimales: TDataSource
            Top = 40
          end
          inherited DSPotrero: TDataSource
            Top = 40
          end
          inherited DSGrupo: TDataSource
            Left = 712
          end
          inherited DSRodeo: TDataSource
            Left = 144
            Top = 40
          end
          inherited DSSeleccionados: TDataSource
            Left = 456
            Top = 192
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select  ID_AUX,ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otr' +
                'o, nombre, sexo from AUX_ANIMALES'
              'where id_animal > 0'
              ''
              ''
              '')
            Left = 488
            Top = 192
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
          inherited IBQCatAnimales: TIBQuery
            Left = 712
            Top = 48
          end
          inherited DSCatAnimales: TDataSource
            Left = 240
          end
        end
        inherited EABusqueda: TEditAuto
          Left = 560
          Top = -9
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Height = 234
          object Label1: TLabel
            Left = 52
            Top = 43
            Width = 102
            Height = 15
            Caption = 'Fecha de Parici'#243'n:'
          end
          object Label2: TLabel
            Left = 52
            Top = 155
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
            OnClick = Label2Click
            OnMouseEnter = Label2MouseEnter
            OnMouseLeave = Label2MouseLeave
          end
          object Label3: TLabel
            Left = 52
            Top = 103
            Width = 76
            Height = 15
            Caption = 'Tipo de Parto:'
          end
          object DTPAFechaParto: TDateTimePickerAuto
            Left = 162
            Top = 39
            Width = 200
            Height = 21
            Date = 39338.484192708330000000
            Time = 39338.484192708330000000
            Color = 14679807
            TabOrder = 0
            OnChange = DTPAFechaPartoChange
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 162
            Top = 153
            Width = 199
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 4
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object DBLCBATipoParto: TDBLookupComboBoxAuto
            Left = 162
            Top = 99
            Width = 199
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_TIPO_PARTO'
            ListField = 'SINONIMO'
            ListSource = DMSoftvet.DSTiposParto
            TabOrder = 3
            OnCloseUp = DBLCBATipoPartoCloseUp
            OnExit = DBLCBATipoPartoExit
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object DBLCBACondCorp: TDBLookupComboBoxAuto
            Left = 520
            Top = 39
            Width = 199
            Height = 23
            Color = 14679807
            DropDownRows = 20
            Enabled = False
            KeyField = 'ID_CONDICION_CORPORAL'
            ListField = 'ESCALA'
            ListSource = DMSoftvet.DSCondicionCorporal
            TabOrder = 2
            OnCloseUp = DBLCBACondCorpCloseUp
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object CBCondCorp: TCheckBox
            Left = 388
            Top = 41
            Width = 121
            Height = 18
            Caption = 'Condici'#243'n Corporal'
            TabOrder = 1
            OnClick = CBCondCorpClick
          end
          object GroupBox2: TGroupBox
            Left = 431
            Top = 78
            Width = 371
            Height = 130
            Caption = 'Cambio de Ubicacion'
            TabOrder = 5
            object Label5: TLabel
              Left = 55
              Top = 34
              Width = 43
              Height = 15
              Cursor = crHandPoint
              Caption = 'Potrero:'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = Label5Click
              OnMouseEnter = Label5MouseEnter
              OnMouseLeave = Label5MouseLeave
            end
            object Label4: TLabel
              Left = 55
              Top = 86
              Width = 40
              Height = 15
              Cursor = crHandPoint
              Caption = 'Rodeo:'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = Label4Click
              OnMouseEnter = Label4MouseEnter
              OnMouseLeave = Label4MouseLeave
            end
            object DBLCBAPotrero: TDBLookupComboBoxAuto
              Left = 122
              Top = 34
              Width = 198
              Height = 23
              Color = 14679807
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_POTRERO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSPotrero
              TabOrder = 1
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBARodeos: TDBLookupComboBoxAuto
              Left = 122
              Top = 86
              Width = 198
              Height = 23
              Color = 14679807
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_RODEO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSRodeo
              TabOrder = 3
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object CBPotrero: TCheckBox
              Left = 32
              Top = 34
              Width = 15
              Height = 19
              TabOrder = 0
              OnClick = CBPotreroClick
            end
            object CBRodeo: TCheckBox
              Left = 32
              Top = 86
              Width = 18
              Height = 18
              TabOrder = 2
              OnClick = CBRodeoClick
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 234
          Height = 166
          inherited MAObservacion: TMemoAuto
            Height = 147
          end
        end
      end
      object TSDistocia: TTabSheet [2]
        Caption = 'Distocia'
        ImageIndex = 4
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 1002
          Height = 225
          Align = alTop
          Caption = 'Datos:'
          TabOrder = 0
          object LCausaDistocia: TLabel
            Left = 20
            Top = 26
            Width = 91
            Height = 15
            Caption = 'Causa Distocia: '
            Layout = tlCenter
          end
          object LGradoDistocia: TLabel
            Left = 22
            Top = 52
            Width = 88
            Height = 15
            Caption = 'Grado Distocia: '
            Layout = tlCenter
          end
          object DBLCBACausaDistocia: TDBLookupComboBoxAuto
            Left = 112
            Top = 17
            Width = 372
            Height = 23
            Color = clWhite
            KeyField = 'ID_CAUSA_DISTOCIA'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSCausaDistocia
            TabOrder = 0
            OnCloseUp = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
          object DBLCBAGradoDistocia: TDBLookupComboBoxAuto
            Left = 112
            Top = 45
            Width = 242
            Height = 23
            Color = clWhite
            KeyField = 'ID_GRADO_ASISTENCIA'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSGradoAsistencia
            TabOrder = 1
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
        end
        object GBObservacion: TGroupBox
          Left = 0
          Top = 225
          Width = 1002
          Height = 175
          Align = alClient
          Caption = 'Observaciones:'
          TabOrder = 1
          object MAObservacionDistocia: TMemoAuto
            Left = 2
            Top = 17
            Width = 998
            Height = 156
            Align = alClient
            Color = clWhite
            TabOrder = 0
            EsClave = False
            EsRequerido = False
            ISParam = False
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
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_SENASA'
              ReadOnly = True
              Title.Caption = 'SENASA'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Caption = 'Fecha Parici'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V1'
              Title.Caption = 'Responsable'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V6'
              Title.Caption = 'Potrero'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V5'
              Title.Caption = 'Rodeo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V7'
              Title.Caption = 'Condici'#243'n Corporal'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V2'
              Title.Caption = 'Tipo de Parto'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V3'
              Title.Caption = 'Causa Dist.'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V4'
              Title.Caption = 'Grado Dist.'
              Visible = False
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 555
      end
      inherited BBCancelar: TBitBtn
        Left = 614
      end
      inherited BBAnterior: TBitBtn
        Left = 712
      end
      inherited BBSiguiente: TBitBtn
        Left = 810
      end
      inherited BBTerminar: TBitBtn
        Left = 908
        Enabled = False
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Parto Masivo'
    inherited LTitulo: TLabel
      Caption = 'Parto Masivo'
    end
  end
  inherited ALUniversal: TActionList
    Left = 643
    Top = 65534
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Top = 65535
  end
  inherited DSSimple: TDataSource
    Left = 120
    Top = 0
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, FECHA, RESPONSABLE,' +
        ' V1, I1, '
      'V2, '
      '   I3, V3, I4, V4, I5, V5, I6, V6, EW,I7,V7)'
      'values'
      
        '  (:ID_RP, :ID_SENASA, :ID_ANIMAL, :OBSERVACION, :FECHA, :RESPON' +
        'SABLE, :V1, '
      '   :I1, :V2, :I3, :V3, :I4, :V4, :I5, :V5, :I6, :V6,:EW,:I7,:V7)')
    RefreshSQL.Strings = (
      'Select '
      '  V7,'
      '  V10,'
      '  V6,'
      '  V5,'
      '  ID_SENASA,'
      '  V9,'
      '  V8,'
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
      '  F5,'
      '  ID_PC,'
      '  ID_HBA,'
      '  ID_RA,'
      '  ID_OTRO,'
      '  APODO,'
      '  DTA_BAJA'
      'from AUX_EVENTOS '
      'where'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, Fecha, RESPONS' +
        'ABLE, V1, I1, V2, I3,V3, I4,V4,I5,V5,I6,V6,EW,I7,V7 from AUX_EVE' +
        'NTOS ')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  OBSERVACION = :OBSERVACION,'
      '  FECHA = :FECHA,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  V1 = :V1,'
      '  I1 = :I1,'
      '  V2 = :V2,'
      '  I3 = :I3,'
      '  V3 = :V3,'
      '  I4 = :I4,'
      '  V4 = :V4,'
      '  I5 = :I5,'
      '  V5 = :V5,'
      '  I6 = :I6,'
      '  V6 = :V6,'
      '  EW = :EW,'
      '  I7 = :I7,'
      '  V7 = :V7'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 244
    Top = 6
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
      Size = 255
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleI3: TIntegerField
      FieldName = 'I3'
      Origin = 'AUX_EVENTOS.I3'
    end
    object IBDSSimpleV3: TIBStringField
      FieldName = 'V3'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI4: TIntegerField
      FieldName = 'I4'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleV4: TIBStringField
      FieldName = 'V4'
      Origin = 'AUX_EVENTOS.V4'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI5: TIntegerField
      FieldName = 'I5'
      Origin = 'AUX_EVENTOS.I5'
    end
    object IBDSSimpleV5: TIBStringField
      FieldName = 'V5'
      Origin = 'AUX_EVENTOS.V5'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI6: TIntegerField
      FieldName = 'I6'
      Origin = 'AUX_EVENTOS.I6'
    end
    object IBDSSimpleV6: TIBStringField
      FieldName = 'V6'
      Origin = 'AUX_EVENTOS.V6'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI7: TIntegerField
      FieldName = 'I7'
      Origin = 'AUX_EVENTOS.I7'
    end
    object IBDSSimpleV7: TIBStringField
      FieldName = 'V7'
      Origin = 'AUX_EVENTOS.V7'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 608
    Top = 65534
  end
  inherited IBQValidaciones: TIBQuery
    Left = 532
    Top = 65534
  end
  inherited IBQEvento: TIBQuery
    Left = 84
    Top = 65534
  end
  inherited SDXLS: TSaveDialog
    Left = 174
    Top = 65533
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
        Title = 'Fecha Parici'#243'n'
      end
      item
        DataField = 'V1'
        Title = 'Responsable'
      end
      item
        DataField = 'V6'
        Title = 'Potrero'
      end
      item
        DataField = 'V7'
        Title = 'Condicion Corporal'
      end
      item
        DataField = 'V5'
        Title = 'Rodeo'
      end
      item
        DataField = 'V2'
        Title = 'Tipo de Parto'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end
      item
        DataField = 'V3'
        Title = 'Causa Dist.'
      end
      item
        DataField = 'V4'
        Title = 'Grado Dist.'
      end>
    Title.Text = 'Evento Parto Masivo'
    Left = 48
    Top = 1
  end
  inherited WinXP1: TWinXP
    Left = 568
    Top = 65528
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 468
    Top = 65535
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 500
    Top = 65535
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 700
    Top = 31
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 668
    Top = 31
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 420
    Top = 39
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'SELECT * FROM RN_PARTO_MASIVO (:ANIMAL,:ESTA,:FECHA)')
    Left = 384
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 680
    Top = 65534
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_PARTO_MASIVO (:FECHA,:ANIMAL,:OBSERVACION,:' +
        'ESTABLECIMIENTO,:RESPONSABLE,:LOG_USUARIO,:LOG_FECHA_MODIFICADO,' +
        ':ID_GRUPO,:DISPARADOR,:TIPO_PARTO,:CAUSA,:GRADO,:OBS_DISTOCIA,:R' +
        'ODEO,:POTRERO,:FECHA_PARTO,:CONDICION_CORPORAL)')
    Left = 712
    Top = 65534
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
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_PARTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAUSA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS_DISTOCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RODEO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_PARTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONDICION_CORPORAL'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 432
    Top = 65534
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 460
    Top = 39
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 732
    Top = 32
  end
  object IBQGrupoParto: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'INSERT INTO TAB_GRUPOS_PARTO VALUES (:ID_GRUPO,:ESTA,'#39'N'#39')')
    Left = 304
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTA'
        ParamType = ptUnknown
      end>
  end
end
