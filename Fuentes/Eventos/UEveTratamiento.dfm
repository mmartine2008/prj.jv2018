inherited FEveTratamiento: TFEveTratamiento
  Left = 68
  Top = -10
  HelpContext = 27000
  Caption = 'Evento Tratamiento'
  Constraints.MinHeight = 635
  Constraints.MinWidth = 885
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
              Height = 89
              inherited IFondoDis: TImage
                Height = 70
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 70
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 103
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
              Height = 89
              inherited IFondoSel: TImage
                Height = 70
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Height = 70
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 103
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
              Height = 89
              inherited IFondo: TImage
                Height = 89
              end
            end
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            Top = 169
            Height = 184
            FAWidth = 145
            FAHeight = 184
            FCWidth = 734
            FCHeight = 22
          end
          inherited RGOrden: TRadioGroup
            Top = 115
          end
          inherited GBFiltros: TGroupBox
            Top = 191
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
          Height = 311
          object LFecha: TLabel
            Left = 92
            Top = 55
            Width = 40
            Height = 15
            Caption = 'Fecha: '
            Layout = tlCenter
          end
          object LResponsable: TLabel
            Left = 52
            Top = 121
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
          object LTipo: TLabel
            Left = 100
            Top = 160
            Width = 30
            Height = 15
            Caption = 'Tipo: '
            Layout = tlCenter
          end
          object LTecnica: TLabel
            Left = 12
            Top = 228
            Width = 125
            Height = 15
            Caption = 'V'#237'a de Administraci'#243'n: '
            Layout = tlCenter
          end
          object LDescripcion: TLabel
            Left = 58
            Top = 195
            Width = 69
            Height = 15
            Cursor = crHandPoint
            Caption = 'Descripci'#243'n:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
            Layout = tlCenter
            OnClick = LDescripcionClick
            OnMouseEnter = LDescripcionMouseEnter
            OnMouseLeave = LDescripcionMouseLeave
          end
          object LHora: TLabel
            Left = 97
            Top = 88
            Width = 30
            Height = 15
            Caption = 'Hora:'
            Layout = tlCenter
          end
          object LTempCorp: TLabel
            Left = 7
            Top = 195
            Width = 125
            Height = 15
            Caption = 'Temperatura Corporal:'
            Visible = False
          end
          object LPeso: TLabel
            Left = 240
            Top = 87
            Width = 32
            Height = 15
            Caption = 'Peso:'
            Visible = False
          end
          object LGrad: TLabel
            Left = 198
            Top = 193
            Width = 13
            Height = 15
            Caption = #186'C'
            Visible = False
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 138
            Top = 50
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
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 138
            Top = 119
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
          object DBLCBATipo: TDBLookupComboBoxAuto
            Left = 138
            Top = 156
            Width = 237
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_TIPO_TRATAMIENTO'
            ListField = 'SINONIMO'
            ListSource = DMSoftvet.DSTipoTratamientos
            TabOrder = 2
            OnCloseUp = DBLCBATipoCloseUp
            OnExit = DBLCBATipoExit
            OnKeyUp = DBLCBATipoKeyUp
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBATecnica: TDBLookupComboBoxAuto
            Left = 138
            Top = 223
            Width = 237
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_TECNICA'
            ListField = 'SINONIMO'
            ListSource = DMSoftvet.DSTecnicasTratamientos
            TabOrder = 4
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBATratamiento: TDBLookupComboBoxAuto
            Left = 138
            Top = 191
            Width = 237
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_TRATAMIENTO'
            ListField = 'SINONIMO'
            ListSource = DMSoftvet.DSTratamiento
            TabOrder = 3
            OnCloseUp = DBLCBATratamientoCloseUp
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object GBDatosEconomicos: TGroupBox
            Left = 449
            Top = 8
            Width = 372
            Height = 296
            Caption = 'Datos'
            TabOrder = 7
            Visible = False
            object Label1: TLabel
              Left = 13
              Top = 38
              Width = 39
              Height = 15
              Caption = 'Dosis: '
            end
            object LMedida: TLabel
              Left = 122
              Top = 38
              Width = 31
              Height = 15
              Caption = 'dosis'
            end
            object Label2: TLabel
              Left = 12
              Top = 82
              Width = 38
              Height = 15
              Caption = 'Precio:'
            end
            object LPMedida: TLabel
              Left = 122
              Top = 81
              Width = 211
              Height = 15
              Caption = 'Inyectable: precio/ml. Sales: precio/mg'
            end
            object LLaboratorios: TLabel
              Left = 12
              Top = 125
              Width = 66
              Height = 15
              Cursor = crHandPoint
              Caption = 'Laboratorio:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LLaboratoriosClick
              OnMouseEnter = LLaboratoriosMouseEnter
              OnMouseLeave = LLaboratoriosMouseLeave
            end
            object Label5: TLabel
              Left = 15
              Top = 165
              Width = 75
              Height = 15
              Caption = 'Nro. de Serie:'
            end
            object Label6: TLabel
              Left = 15
              Top = 233
              Width = 125
              Height = 15
              Caption = 'Fecha de Vencimiento:'
            end
            object LNroDosis: TLabel
              Left = 172
              Top = 39
              Width = 79
              Height = 15
              Caption = 'Nro. de Dosis:'
            end
            object LPeriodoRetirada: TLabel
              Left = 13
              Top = 201
              Width = 113
              Height = 15
              Caption = 'Periodo de Retirada:'
            end
            object LDias: TLabel
              Left = 204
              Top = 201
              Width = 26
              Height = 15
              Caption = 'D'#237'as'
            end
            object EADosis: TEditAuto
              Tag = 1
              Left = 53
              Top = 34
              Width = 61
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 5
              TabOrder = 0
              OnExit = EAChange
              OnKeyPress = EADosisKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecio: TEditAuto
              Tag = 2
              Left = 53
              Top = 78
              Width = 61
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 5
              TabOrder = 2
              OnChange = EAChange
              OnExit = EAChange
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBALaboratorios: TDBLookupComboBoxAuto
              Left = 84
              Top = 121
              Width = 251
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_LABORATORIO'
              ListField = 'NOMBRE'
              ListSource = DSLaboratorios
              TabOrder = 3
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EANroSerie: TEditAuto
              Left = 95
              Top = 160
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 20
              TabOrder = 4
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DTPAFechaVencimiento: TDateTimePickerAuto
              Left = 134
              Top = 228
              Width = 151
              Height = 21
              Date = 0.452270324072742400
              Time = 0.452270324072742400
              Color = clWhite
              TabOrder = 6
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object CBNroDosis: TComboBox
              Left = 253
              Top = 34
              Width = 108
              Height = 23
              ItemHeight = 15
              ItemIndex = 0
              TabOrder = 1
              Text = '1'#186' Dosis'
              OnKeyPress = CBNroDosisKeyPress
              Items.Strings = (
                '1'#186' Dosis'
                '2'#186' Dosis'
                '3'#186' Dosis'
                '4'#186' Dosis')
            end
            object EAPeriodoRetirada: TEditAuto
              Tag = 1
              Left = 130
              Top = 198
              Width = 62
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 6
              TabOrder = 5
              OnKeyPress = EAPeriodoRetiradaKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
          object CBDiagnosticar: TCheckBox
            Left = 95
            Top = 258
            Width = 182
            Height = 18
            Caption = 'Diagnosticar Enfermedad'
            TabOrder = 6
          end
          object DTPAHora: TDateTimePickerAuto
            Left = 138
            Top = 84
            Width = 87
            Height = 21
            Date = 0.375000000000000000
            Format = 'hh:mm tt'
            Time = 0.375000000000000000
            Color = clWhite
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 5
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
          object ETempCorporal: TEdit
            Left = 138
            Top = 191
            Width = 55
            Height = 23
            TabOrder = 8
            Text = '0'
            Visible = False
            OnChange = ETempCorporalChange
            OnExit = GetEvent
          end
          object EAPeso: TEditAuto
            Left = 280
            Top = 83
            Width = 79
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 9
            Visible = False
            OnChange = EAPesoChange
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 311
          Height = 89
          inherited MAObservacion: TMemoAuto
            Height = 70
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
              Width = 85
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
              FieldName = 'H1'
              Title.Caption = 'Hora'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F2'
              Title.Caption = 'Peso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F3'
              Title.Caption = 'Dosis'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              ReadOnly = True
              Title.Caption = 'Tipo de tratamiento'
              Width = 142
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TECNICA'
              ReadOnly = True
              Title.Caption = 'V'#237'a de Administraci'#243'n'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCIONTRATAMIENTO'
              ReadOnly = True
              Title.Caption = 'Descripci'#243'n Tratamiento'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F1'
              Title.Caption = 'Temp. Corporal'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 200
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 542
      end
      inherited BBCancelar: TBitBtn
        Left = 613
      end
      inherited BBAnterior: TBitBtn
        Left = 711
        TabOrder = 2
      end
      inherited BBSiguiente: TBitBtn
        Left = 809
        TabOrder = 1
      end
      inherited BBTerminar: TBitBtn
        Left = 907
        ModalResult = 1
        TabOrder = 6
      end
      inherited BBAyuda: TBitBtn
        TabOrder = 3
      end
      inherited BSacarAnimal: TBitBtn
        TabOrder = 4
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Tratamientos'
  end
  inherited ALUniversal: TActionList
    Left = 18
    Top = 3
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 212
    Top = 31
  end
  inherited DSSimple: TDataSource
    Left = 24
    Top = 400
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_ANIMAL, ID_AUX_EVENTO, ID_RP, FECHA, OBSERVACION, RESPONSA' +
        'BLE, EW, '
      '   H1, F1, F2, F3)'
      'values'
      
        '  (:ID_ANIMAL, :ID_AUX_EVENTO, :ID_RP, :FECHA, :OBSERVACION, :RE' +
        'SPONSABLE, '
      '   :EW, :H1, :F1, :F2, :F3)')
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
      '  DTA_BAJA,'
      '  ID_IE,'
      '  H2,'
      '  OBSERVACION2,'
      '  OBSERVACION3,'
      '  OBSERVACION4,'
      '  OBSERVACION5,'
      '  F6,'
      '  I10,'
      '  V13,'
      '  V14'
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
      '          V2 as tipo,'
      '          I1 as id_tipo,'
      '          V3 as tecnica,'
      '          I2 as id_tecnica, '
      '          EW,'
      '          V4 as descripciontratamiento,'
      '          I4 as id_tratamiento,'
      '          H1,'
      '          F1,'
      '          F2,'
      '          F3'
      'from AUX_EVENTOS'
      '')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO,'
      '  ID_RP = :ID_RP,'
      '  FECHA = :FECHA,'
      '  OBSERVACION = :OBSERVACION,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  EW = :EW,'
      '  H1 = :H1,'
      '  F1 = :F1,'
      '  F2 = :F2,'
      '  F3 = :F3'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 52
    Top = 398
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
      OnChange = IBDSSimpleRESPChange
      OnSetText = IBDSSimpleRESPSetText
      Size = 100
    end
    object IBDSSimpleTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'AUX_EVENTOS.V2'
      OnChange = change
      OnSetText = SetText
      Size = 100
    end
    object IBDSSimpleID_TIPO: TIntegerField
      FieldName = 'ID_TIPO'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleTECNICA: TIBStringField
      FieldName = 'TECNICA'
      Origin = 'AUX_EVENTOS.V3'
      OnChange = change
      OnSetText = SetText
      Size = 100
    end
    object IBDSSimpleID_TECNICA: TIntegerField
      FieldName = 'ID_TECNICA'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleDESCRIPCIONTRATAMIENTO: TIBStringField
      FieldName = 'DESCRIPCIONTRATAMIENTO'
      Origin = 'AUX_EVENTOS.V4'
      OnChange = change
      OnSetText = SetText
      Size = 100
    end
    object IBDSSimpleID_TRATAMIENTO: TIntegerField
      FieldName = 'ID_TRATAMIENTO'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleH1: TTimeField
      FieldName = 'H1'
      Origin = 'AUX_EVENTOS.H1'
    end
    object IBDSSimpleF1: TFloatField
      FieldName = 'F1'
      Origin = 'AUX_EVENTOS.F1'
    end
    object IBDSSimpleF2: TFloatField
      FieldName = 'F2'
      Origin = 'AUX_EVENTOS.F2'
      OnSetText = IBDSSimpleF2SetText
    end
    object IBDSSimpleF3: TFloatField
      FieldName = 'F3'
      Origin = 'AUX_EVENTOS.F3'
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
    Left = 372
    Top = 30
  end
  inherited IBQEvento: TIBQuery
    Left = 116
    Top = 390
  end
  inherited SDXLS: TSaveDialog
    Left = 158
    Top = 389
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'ID_RP'
        Title = 'Rp Animal'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'TIPO'
        Title = 'Tipo de Tratamiento'
      end
      item
        DataField = 'TECNICA'
        Title = 'T'#233'cnica de tratamiento'
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
    Title.Text = 'Evento Tratamientos'
    Left = 80
    Top = 393
  end
  inherited WinXP1: TWinXP
    Left = 560
    Top = 32
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 332
    Top = 31
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 460
    Top = 31
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 492
    Top = 31
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 412
    Top = 31
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 260
    Top = 31
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'select * from rn_tratamiento(:animal, :fecha)')
    Left = 47
    Top = 3
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 79
    Top = 3
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_tratamiento ('
      '  :tipo,'
      '  :tecnica,'
      '  :FECHA,'
      '  :ANIMAL,'
      '  :OBSERVACION,'
      '  :ESTABLECIMIENTO,'
      '  :RESPONSABLE,'
      '  :LOG_USUARIO,'
      '  :LOG_FECHA_MODIFICADO,'
      '  :DISPARADOR,'
      '  :grupo,'
      '  :ID_TRATAMIENTO,'
      '  :HORA,'
      '  :TEMPERATURA,'
      '  :PESO,'
      '  :DOSIS)')
    Left = 111
    Top = 3
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tecnica'
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
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TRATAMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TEMPERATURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOSIS'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 143
    Top = 3
  end
  object IBQLaboratorios: TIBQuery [27]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQLaboratoriosAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM TAB_LABORATORIOS')
    Left = 276
    Top = 384
  end
  object DSLaboratorios: TDataSource [28]
    DataSet = IBQLaboratorios
    Left = 244
    Top = 384
  end
  object IBQInsertarDatos: TIBQuery [29]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'INSERT INTO TAB_DATOS_TRATAMIENTO VALUES(:GRUPO, :ESTABLECIMIENT' +
        'O, :ANIMAL, :DOSIS, :PRECIO, :NRO_SERIE, :LABORATORIO, :FECHA_VE' +
        'NCIMIENTO, :NRO_DOSIS,:EVENTO,:PERIODORETIRADA)')
    Left = 212
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOSIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NRO_SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LABORATORIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_VENCIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NRO_DOSIS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PERIODORETIRADA'
        ParamType = ptUnknown
      end>
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 292
    Top = 31
  end
  inherited PLVersion: TPngImageList
    Left = 432
    Top = 344
  end
  inherited OpenDlg: TOpenDialog
    Left = 316
    Top = 104
  end
  object IBQUltimoEvento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select max(id_evento) as ultimoevento'
      'from eve_eventos ee'
      'where tipo = 27')
    Left = 311
    Top = 383
  end
  object IBQPesoGrupo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select count(id_animal), peso from aux_animales where peso is no' +
        't null group by peso ')
    Left = 820
    Top = 230
  end
  object IBQCantCategoria: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select count(ta.id_animal) as cant, ta.categoria as categ from t' +
        'ab_animales ta join aux_animales aa on aa.id_animal = ta.id_anim' +
        'al group by ta.categoria')
    Left = 308
    Top = 180
  end
  object IBQPesoPromCateg: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select peso from tab_animales  where id_animal = :categoria and ' +
        'activo = '#39'S'#39)
    Left = 310
    Top = 149
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'categoria'
        ParamType = ptUnknown
      end>
  end
end
