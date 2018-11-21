inherited FEveBaja: TFEveBaja
  Left = 221
  Top = 104
  HelpContext = 5000
  Caption = 'Evento Baja'
  ClientHeight = 593
  ClientWidth = 999
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 999
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
    Top = 480
    Width = 999
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 991
      end
    end
  end
  inherited PDatos: TPanel
    Width = 999
    Height = 393
    inherited PCBasico: TPageControl
      Width = 999
      Height = 311
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 991
          Height = 269
        end
        inherited MSimple: TMangazo
          Width = 991
          Height = 269
          inherited GBFiltro: TGroupBox
            Width = 991
          end
          inherited PSeleccion: TPanel
            Width = 991
            inherited GBDisponibles: TGroupBox
              Width = 465
              Height = 0
              inherited IFondoDis: TImage
                Width = 461
              end
              inherited BDBGDisponibles: TBitDBGrid
                Width = 461
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 137
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
                    Width = 173
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Left = 573
              Width = 418
              Height = 0
              inherited IFondoSel: TImage
                Width = 414
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 414
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 106
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
                    Width = 186
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Left = 465
              Height = 0
              inherited IFondo: TImage
                Height = 0
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
            Width = 991
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 991
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 991
            inherited Image1: TImage
              Width = 991
            end
            inherited Label1: TLabel
              Width = 991
              Height = 21
            end
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            Left = 688
            Top = 25
            Height = 184
            FAWidth = 145
            FAHeight = 184
            FCWidth = 734
            FCHeight = 22
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select  ID_AUX,ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otr' +
                'o, sexo, nombre from AUX_ANIMALES'
              'where id_animal > 0'
              ''
              ''
              '')
            Top = 504
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
          Width = 991
          Height = 234
          object LResponsable: TLabel
            Left = 13
            Top = 61
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
          object LFecha: TLabel
            Left = 47
            Top = 25
            Width = 40
            Height = 15
            Caption = 'Fecha: '
            Layout = tlCenter
          end
          object Label1: TLabel
            Left = 483
            Top = 25
            Width = 27
            Height = 15
            Caption = 'Tipo:'
          end
          object LPeso: TLabel
            Left = 355
            Top = 61
            Width = 164
            Height = 15
            Caption = 'Peso (en el establecimiento): '
          end
          object LPrecio: TLabel
            Left = 473
            Top = 133
            Width = 41
            Height = 15
            Caption = 'Precio: '
          end
          object LDTA: TLabel
            Left = 56
            Top = 133
            Width = 29
            Height = 15
            Caption = 'DTA: '
          end
          object LPesoDestino: TLabel
            Left = 433
            Top = 97
            Width = 81
            Height = 15
            Caption = 'Peso Destino: '
          end
          object LDestino: TLabel
            Left = 39
            Top = 97
            Width = 39
            Height = 13
            Cursor = crHandPoint
            Caption = 'Destino:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            Layout = tlCenter
            OnClick = LDestinoClick
            OnMouseEnter = LResponsableMouseEnter
            OnMouseLeave = LResponsableMouseLeave
          end
          object LRemito: TLabel
            Left = 468
            Top = 169
            Width = 43
            Height = 15
            Caption = 'Remito:'
          end
          object LDTE: TLabel
            Left = 56
            Top = 169
            Width = 27
            Height = 15
            Caption = 'DTE:'
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 100
            Top = 55
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
            Left = 100
            Top = 19
            Width = 237
            Height = 21
            Date = 38657.411226122680000000
            Time = 38657.411226122680000000
            Color = 14679807
            TabOrder = 0
            OnChange = DTPAFechaChange
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBATipo: TDBLookupComboBoxAuto
            Left = 522
            Top = 19
            Width = 236
            Height = 23
            Color = clWhite
            DropDownRows = 20
            KeyField = 'ID_TIPO_BAJA'
            ListField = 'SINONIMO'
            ListSource = DMSoftvet.DSTiposBaja
            TabOrder = 6
            OnCloseUp = DBLCBATipoCloseUp
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object EAPeso: TEditAuto
            Left = 522
            Top = 55
            Width = 125
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 5
            TabOrder = 7
            Text = '0'
            OnExit = GetEvent
            OnKeyPress = EAPesoKeyPress
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
          object EAPrecio: TEditAuto
            Left = 522
            Top = 127
            Width = 125
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 6
            TabOrder = 9
            Text = '0'
            OnExit = GetEvent
            OnKeyPress = EAPrecioKeyPress
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
          object EADta: TEditAuto
            Left = 100
            Top = 127
            Width = 236
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 20
            TabOrder = 3
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object EAPesoDestino: TEditAuto
            Left = 522
            Top = 91
            Width = 125
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 5
            TabOrder = 8
            Text = '0'
            OnExit = GetEvent
            OnKeyPress = EAPesoKeyPress
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
          object DBLCBADestino: TDBLookupComboBoxAuto
            Left = 100
            Top = 91
            Width = 237
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_DESTINO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSCodDestino
            TabOrder = 2
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object EARemito: TEditAuto
            Left = 522
            Top = 163
            Width = 236
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 50
            TabOrder = 10
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object BAplicarDiagnostico: TButton
            Left = 811
            Top = 163
            Width = 109
            Height = 23
            Caption = 'Diagnosticar...'
            Enabled = False
            TabOrder = 11
            OnClick = BAplicarDiagnosticoClick
          end
          object EADTE: TEditAuto
            Left = 100
            Top = 163
            Width = 149
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 9
            TabOrder = 4
            OnKeyPress = EADTEKeyPress
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object BExaminarDTE: TButton
            Left = 248
            Top = 163
            Width = 89
            Height = 23
            Caption = 'Examinar'
            TabOrder = 5
            OnClick = BExaminarDTEClick
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 234
          Width = 991
          Height = 35
          inherited MAObservacion: TMemoAuto
            Width = 987
            Height = 16
          end
        end
      end
      inherited TSGrilla: TTabSheet
        object MAuxCaravanas: TMemoAuto [1]
          Left = 280
          Top = 16
          Width = 578
          Height = 401
          Align = alCustom
          Color = clWhite
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 3
          Visible = False
          EsClave = False
          EsRequerido = False
          ISParam = False
        end
        inherited BDBGSimple: TBitDBGrid
          Width = 896
          Height = 269
          TitleFont.Height = -13
          OnKeyPress = BDBGSimpleKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Caption = 'RP'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_SENASA'
              ReadOnly = True
              Title.Caption = 'Senasa'
              Width = 86
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DTA_BAJA'
              Title.Caption = 'DTA '
              Width = 176
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOBAJA'
              Title.Caption = 'Tipo de Baja'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSABLE'
              Title.Caption = 'idResponsable'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PESO'
              Title.Caption = 'Peso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Title.Caption = 'Precio'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsble'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDTIPOBAJA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PESODESTINO'
              Title.Caption = 'Peso Destino'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESTINO'
              Title.Caption = 'Destino'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REMITO'
              Title.Caption = 'Remito'
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 269
        end
        inherited PanelDer: TPanel
          Left = 943
          Height = 269
        end
      end
    end
    inherited PBotones: TPanel
      Top = 311
      Width = 999
      inherited SBSelTodos: TSpeedButton
        Left = 1048
      end
      inherited IFondoB2: TImage
        Width = 573
      end
      inherited ISelTodos: TJvImage
        Left = 328
      end
      inherited BBCancelar: TBitBtn
        Left = 1078
      end
      inherited BBAnterior: TBitBtn
        Left = 1169
      end
      inherited BBSiguiente: TBitBtn
        Left = 1261
      end
      inherited BBTerminar: TBitBtn
        Left = 1354
      end
      inherited PL: TPanel
        Left = 573
      end
      inherited BIngresoSecuenciado: TBitBtn
        Left = 188
      end
      inherited BSacarAnimal: TBitBtn
        Left = 190
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 999
    Caption = 'Baja'
    inherited LTitulo: TLabel
      Width = 595
    end
    inherited PILeft: TPanel
      Left = 791
    end
  end
  inherited Psocalo: TPanel
    Top = 458
    Width = 999
    inherited JvSocalo: TJvImage
      Width = 999
    end
  end
  inherited ALUniversal: TActionList
    Left = 467
    Top = 30
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Top = 119
  end
  inherited DSSimple: TDataSource
    Left = 64
    Top = 112
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_SENASA, ID_RP, FECHA, OBSERVACION, RESPONSABLE, V1, V2, V3' +
        ', I1, I2, '
      '   ID_ANIMAL, EW, F1,DTA_BAJA,I3,I4,V4,V5)'
      'values'
      
        '  (:ID_SENASA, :ID_RP, :FECHA, :OBSERVACION, :RESPONSABLE, :V1, ' +
        ':V2, :V3, '
      '   :I1, :I2, :ID_ANIMAL, :EW, :F1,:DTA,:I3,:I4,:V4,:V5)')
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
      '  F5,'
      '  DTA_BAJA'
      'from AUX_EVENTOS '
      'where'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO')
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, D1 AS FECHA, R' +
        'ESPONSABLE, v1 as RESP,  V2  as tipobaja, I1 as idTipoBaja , F2 ' +
        'as Peso, F1 as Precio, EW,DTA_BAJA, F3 as PesoDestino, I4 as idd' +
        'estino, v4 as destino, V5 as remito from AUX_EVENTOS '
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
      '  V3 = :V3,'
      '  I1 = :I1,'
      '  I2 = :I2,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  EW = :EW,'
      '  F1 = :F1,'
      '  DTA_BAJA = :DTA,'
      '  I3 = :I3,'
      '  I4 = :I4,'
      '  V4=:V4,'
      '  V5=:V5'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    Left = 28
    Top = 16
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
      Origin = 'AUX_EVENTOS.D1'
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleFECHASetText
      Size = 100
    end
    object IBDSSimpleTIPOBAJA: TIBStringField
      FieldName = 'TIPOBAJA'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleFECHASetText
      Size = 100
    end
    object IBDSSimpleIDTIPOBAJA: TIntegerField
      FieldName = 'IDTIPOBAJA'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimplePESO: TFloatField
      FieldName = 'PESO'
      Origin = 'AUX_EVENTOS.F2'
      OnSetText = IBDSSimpleFECHASetText
    end
    object IBDSSimplePRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'AUX_EVENTOS.F1'
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleDTA_BAJA: TIBStringField
      FieldName = 'DTA_BAJA'
      Origin = 'AUX_EVENTOS.DTA_BAJA'
      Size = 50
    end
    object IBDSSimplePESODESTINO: TFloatField
      FieldName = 'PESODESTINO'
      Origin = 'AUX_EVENTOS.F3'
      OnSetText = IBDSSimpleFECHASetText
    end
    object IBDSSimpleIDDESTINO: TIntegerField
      FieldName = 'IDDESTINO'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleDESTINO: TIBStringField
      FieldName = 'DESTINO'
      Origin = 'AUX_EVENTOS.V4'
      Size = 100
    end
    object IBDSSimpleREMITO: TIBStringField
      FieldName = 'REMITO'
      Origin = 'AUX_EVENTOS.V5'
      Size = 100
    end
  end
  inherited IBQValidaciones: TIBQuery
    Left = 748
    Top = 254
  end
  inherited IBQEvento: TIBQuery
    Left = 48
    Top = 190
  end
  inherited SDXLS: TSaveDialog
    Left = 227
    Top = 179
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
        DataField = 'DTA_BAJA'
        Title = 'DTA'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'TIPOBAJA'
        Title = 'Tipo de Baja'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observacion'
      end
      item
        DataField = 'PESO'
        Title = 'Peso'
      end
      item
        DataField = 'PRECIO'
        Title = 'Precio'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end>
    Title.Text = 'Baja'
    Left = 197
    Top = 180
  end
  inherited WinXP1: TWinXP
    Left = 464
    Top = 80
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 636
    Top = 311
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 436
    Top = 327
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 572
    Top = 327
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 332
    Top = 231
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 652
    Top = 303
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from RN_BAJA(:ANIMAL, :ESTABLECIMIENTO, :fecha,:tipobaj' +
        'a) ')
    Left = 496
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
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipobaja'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 528
    Top = 30
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_Baja'
      '( :FECHA,'
      ' :ANIMAL,'
      ' :OBSERVACION,'
      ' :ESTABLECIMIENTO,'
      ' :RESPONSABLE,'
      ' :LOG_USUARIO, '
      ' :LOG_FECHA_MODIFICADO,'
      ' :TIPO, '
      ' :PESO, '
      ' :PRECIO, '
      ' :ID_GRUPO, '
      ' :DISPARADOR, '
      ' :DTA, '
      ' :PESODESTINO,'
      ' :DESTINO, '
      ' :REMITO )')
    Left = 560
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
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO'
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
        Name = 'DTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESODESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REMITO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 592
    Top = 30
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 532
    Top = 87
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 128
    Top = 88
  end
  inherited IBSPActEventos: TIBStoredProc
    Left = 484
    Top = 327
  end
  inherited OpenDlg: TOpenDialog
    Top = 194
  end
  inherited IBQDelEventosAux: TIBQuery
    Top = 288
  end
  inherited IBQImportacion: TIBQuery
    Left = 13
    Top = 189
  end
  object IBQActBaja: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'update eve_eventos set disparador=:evento where animal = :animal' +
        ' and tipo = 3 ')
    Left = 380
    Top = 389
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
  end
  object IBQCheckFecha: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select MAX(EE.fecha) as fecha from EVE_EVENTOS EE where EE.anima' +
        'l = :ANIMAL')
    Left = 484
    Top = 490
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end>
  end
  object IBQEliminarEventos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM ELIMINAR_EVENTOS(:ANIMAL,:ESTA,:FECHA)')
    Left = 516
    Top = 490
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
  object ODExaminarDTE: TOpenDialog
    Filter = 'Archivos pdf|*.pdf'
    Left = 340
    Top = 263
  end
  object IBQActualizarDte: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ACTUALIZAR_DTE_GRUPO'
      '( :DTE,'
      '  :PDTE,'
      '  :ESTABLE,'
      '  :ID_GRUPO )')
    Left = 44
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DTE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PDTE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptInput
      end>
    object IBQActualizarDteDTE: TIntegerField
      FieldName = 'DTE'
      Origin = 'TAB_GRUPOS.NRO_DTE'
    end
    object IBQActualizarDtePATH: TIBStringField
      FieldName = 'PATH'
      Origin = 'TAB_GRUPOS.PATH_DTE'
      Size = 255
    end
  end
  object IBQTabAnimales: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = MSimple.DSAnimales
    SQL.Strings = (
      'SELECT INFORMADO_AFIP, ID_IE, ID_RP'
      'FROM TAB_ANIMALES'
      'WHERE id_animal = :id_animal')
    Left = 84
    Top = 303
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_animal'
        ParamType = ptInput
      end>
  end
  object SDEquivalencias: TSaveDialog
    Filter = 'Archivo de equivalencias(*.txt)|*.txt'
    Left = 84
    Top = 335
  end
end
