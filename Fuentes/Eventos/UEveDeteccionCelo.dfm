inherited FEveDeteccionCelo: TFEveDeteccionCelo
  Left = 210
  Top = 26
  HelpContext = 13000
  Caption = 'Evento Deteccion  de Celo'
  ClientHeight = 672
  ClientWidth = 1042
  Constraints.MinWidth = 689
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1042
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
    Top = 559
    Width = 1042
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1034
      end
    end
  end
  inherited PDatos: TPanel
    Width = 1042
    Height = 472
    inherited PCBasico: TPageControl
      Width = 1042
      Height = 390
      ActivePage = TSDatos
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 1034
          Height = 348
        end
        inherited MSimple: TMangazo
          Width = 1034
          Height = 348
          inherited GBFiltro: TGroupBox
            Width = 1034
          end
          inherited PSeleccion: TPanel
            Width = 1034
            Height = 42
            inherited GBDisponibles: TGroupBox
              Height = 215
              inherited IFondoDis: TImage
                Height = 196
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 196
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 155
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
                  end
                  item
                    Expanded = False
                    FieldName = 'SEXO'
                    Title.Caption = 'Sexo'
                    Visible = False
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
                    Width = 151
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
                    Width = 150
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
            Width = 1034
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 1034
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 1034
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
        Caption = 'Datos Celo'
        inherited GBDatos: TGroupBox
          Width = 1034
          Height = 87
          object LFecha: TLabel
            Left = 17
            Top = 17
            Width = 70
            Height = 23
            AutoSize = False
            Caption = 'Fecha:'
            Layout = tlCenter
          end
          object LObservador: TLabel
            Left = 17
            Top = 52
            Width = 76
            Height = 22
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
          object LHora: TLabel
            Left = 300
            Top = 17
            Width = 36
            Height = 23
            AutoSize = False
            Caption = 'Hora:'
            Layout = tlCenter
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 102
            Top = 17
            Width = 191
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
          object DTPAHora: TDateTimePickerAuto
            Left = 344
            Top = 17
            Width = 147
            Height = 21
            Date = 0.375000000000000000
            Format = 'hh:mm:ss tt'
            Time = 0.375000000000000000
            Color = 14679807
            DateMode = dmUpDown
            Kind = dtkTime
            TabOrder = 2
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object CBAObservador: TDBLookupComboBoxAuto
            Left = 102
            Top = 52
            Width = 191
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
        end
        inherited GBObservaciones: TGroupBox
          Top = 87
          Width = 1034
          Height = 261
          inherited MAObservacion: TMemoAuto
            Width = 1030
            Height = 242
            ISParam = True
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Width = 939
          Height = 348
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
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORA'
              Title.Caption = 'Hora'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 348
        end
        inherited PanelDer: TPanel
          Left = 986
          Height = 348
        end
      end
    end
    inherited PBotones: TPanel
      Top = 390
      Width = 1042
      inherited SBSelTodos: TSpeedButton
        Left = 1017
      end
      inherited IFondoB2: TImage
        Width = 616
      end
      inherited BBCancelar: TBitBtn
        Left = 981
      end
      inherited BBAnterior: TBitBtn
        Left = 1073
      end
      inherited BBSiguiente: TBitBtn
        Left = 1164
      end
      inherited BBTerminar: TBitBtn
        Left = 1257
      end
      inherited PL: TPanel
        Left = 616
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1042
    Caption = 'Detecci'#243'n de Celo'
    inherited LTitulo: TLabel
      Width = 638
    end
    inherited PILeft: TPanel
      Left = 834
    end
  end
  inherited Psocalo: TPanel
    Top = 537
    Width = 1042
    inherited JvSocalo: TJvImage
      Width = 1042
    end
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Top = 111
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  V9 = :OLD_V9 and'
      '  V8 = :OLD_V8 and'
      '  V10 = :OLD_V10 and'
      '  V7 = :OLD_V7 and'
      '  V6 = :OLD_V6 and'
      '  V5 = :OLD_V5 and'
      '  ID_SENASA = :OLD_ID_SENASA and'
      '  V11 = :OLD_V11 and'
      '  ID_RP = :OLD_ID_RP and'
      '  FECHA = :OLD_FECHA and'
      '  OBSERVACION = :OLD_OBSERVACION and'
      '  RESPONSABLE = :OLD_RESPONSABLE and'
      '  V1 = :OLD_V1 and'
      '  V2 = :OLD_V2 and'
      '  NOMBRE = :OLD_NOMBRE and'
      '  V3 = :OLD_V3 and'
      '  V4 = :OLD_V4 and'
      '  I1 = :OLD_I1 and'
      '  I2 = :OLD_I2 and'
      '  I3 = :OLD_I3 and'
      '  D1 = :OLD_D1 and'
      '  D2 = :OLD_D2 and'
      '  D3 = :OLD_D3 and'
      '  ID_ANIMAL = :OLD_ID_ANIMAL and'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO and'
      '  I4 = :OLD_I4 and'
      '  I5 = :OLD_I5 and'
      '  I6 = :OLD_I6 and'
      '  I7 = :OLD_I7 and'
      '  I8 = :OLD_I8 and'
      '  I9 = :OLD_I9 and'
      '  VUNO1 = :OLD_VUNO1 and'
      '  VUNO2 = :OLD_VUNO2 and'
      '  VUNO3 = :OLD_VUNO3 and'
      '  VUNO4 = :OLD_VUNO4 and'
      '  VUNO5 = :OLD_VUNO5 and'
      '  VUNO6 = :OLD_VUNO6 and'
      '  EW = :OLD_EW and'
      '  H1 = :OLD_H1')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (V9, V8, V10, V7, V6, V5, ID_SENASA, V11, ID_RP, FECHA, OBSERV' +
        'ACION, '
      
        '   RESPONSABLE, V1, V2, NOMBRE, V3, V4, I1, I2, I3, D1, D2, D3, ' +
        'ID_ANIMAL, '
      
        '   ID_AUX_EVENTO, I4, I5, I6, I7, I8, I9, VUNO1, VUNO2, VUNO3, V' +
        'UNO4, VUNO5, '
      '   VUNO6, EW, H1)'
      'values'
      
        '  (:V9, :V8, :V10, :V7, :V6, :V5, :ID_SENASA, :V11, :ID_RP, :FEC' +
        'HA, '
      ':OBSERVACION, '
      
        '   :RESPONSABLE, :V1, :V2, :NOMBRE, :V3, :V4, :I1, :I2, :I3, :D1' +
        ', :D2, '
      
        '   :D3, :ID_ANIMAL, :ID_AUX_EVENTO, :I4, :I5, :I6, :I7, :I8, :I9' +
        ', :VUNO1, '
      '   :VUNO2, :VUNO3, :VUNO4, :VUNO5, :VUNO6, :EW, :H1)')
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
      '  EW,'
      '  H1'
      'from AUX_EVENTOS '
      'where'
      '  V9 = :V9 and'
      '  V8 = :V8 and'
      '  V10 = :V10 and'
      '  V7 = :V7 and'
      '  V6 = :V6 and'
      '  V5 = :V5 and'
      '  ID_SENASA = :ID_SENASA and'
      '  V11 = :V11 and'
      '  ID_RP = :ID_RP and'
      '  FECHA = :FECHA and'
      '  OBSERVACION = :OBSERVACION and'
      '  RESPONSABLE = :RESPONSABLE and'
      '  V1 = :V1 and'
      '  V2 = :V2 and'
      '  NOMBRE = :NOMBRE and'
      '  V3 = :V3 and'
      '  V4 = :V4 and'
      '  I1 = :I1 and'
      '  I2 = :I2 and'
      '  I3 = :I3 and'
      '  D1 = :D1 and'
      '  D2 = :D2 and'
      '  D3 = :D3 and'
      '  ID_ANIMAL = :ID_ANIMAL and'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO and'
      '  I4 = :I4 and'
      '  I5 = :I5 and'
      '  I6 = :I6 and'
      '  I7 = :I7 and'
      '  I8 = :I8 and'
      '  I9 = :I9 and'
      '  VUNO1 = :VUNO1 and'
      '  VUNO2 = :VUNO2 and'
      '  VUNO3 = :VUNO3 and'
      '  VUNO4 = :VUNO4 and'
      '  VUNO5 = :VUNO5 and'
      '  VUNO6 = :VUNO6 and'
      '  EW = :EW and'
      '  H1 = :H1')
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION,H1 as HORA, D2 ' +
        'AS FECHA, V1 AS RESP, RESPONSABLE, EW from AUX_EVENTOS ')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  V9 = :V9,'
      '  V8 = :V8,'
      '  V10 = :V10,'
      '  V7 = :V7,'
      '  V6 = :V6,'
      '  V5 = :V5,'
      '  ID_SENASA = :ID_SENASA,'
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
      '  H1 = :H1'
      'where'
      '  V9 = :OLD_V9 and'
      '  V8 = :OLD_V8 and'
      '  V10 = :OLD_V10 and'
      '  V7 = :OLD_V7 and'
      '  V6 = :OLD_V6 and'
      '  V5 = :OLD_V5 and'
      '  ID_SENASA = :OLD_ID_SENASA and'
      '  V11 = :OLD_V11 and'
      '  ID_RP = :OLD_ID_RP and'
      '  FECHA = :OLD_FECHA and'
      '  OBSERVACION = :OLD_OBSERVACION and'
      '  RESPONSABLE = :OLD_RESPONSABLE and'
      '  V1 = :OLD_V1 and'
      '  V2 = :OLD_V2 and'
      '  NOMBRE = :OLD_NOMBRE and'
      '  V3 = :OLD_V3 and'
      '  V4 = :OLD_V4 and'
      '  I1 = :OLD_I1 and'
      '  I2 = :OLD_I2 and'
      '  I3 = :OLD_I3 and'
      '  D1 = :OLD_D1 and'
      '  D2 = :OLD_D2 and'
      '  D3 = :OLD_D3 and'
      '  ID_ANIMAL = :OLD_ID_ANIMAL and'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO and'
      '  I4 = :OLD_I4 and'
      '  I5 = :OLD_I5 and'
      '  I6 = :OLD_I6 and'
      '  I7 = :OLD_I7 and'
      '  I8 = :OLD_I8 and'
      '  I9 = :OLD_I9 and'
      '  VUNO1 = :OLD_VUNO1 and'
      '  VUNO2 = :OLD_VUNO2 and'
      '  VUNO3 = :OLD_VUNO3 and'
      '  VUNO4 = :OLD_VUNO4 and'
      '  VUNO5 = :OLD_VUNO5 and'
      '  VUNO6 = :OLD_VUNO6 and'
      '  EW = :OLD_EW and'
      '  H1 = :OLD_H1')
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
    object IBDSSimpleHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'AUX_EVENTOS.H1'
      OnSetText = IBDSSimpleHORASetText
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.D2'
      OnSetText = IBDSSimpleHORASetText
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleHORASetText
      Size = 100
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
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
        DataField = 'HORA'
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
    Title.Text = 'Evento Detecci'#243'n de Celo'
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from RN_DETECCION_CELO (:ANIMAL, :ESTABLECIMIENTO, :fec' +
        'ha) ')
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
      'EXECUTE  PROCEDURE SP_DETECCION_CELO('
      ' :FECHA , :ANIMAL , :OBSERVACION , :ESTABLECIMIENTO ,'
      
        ' :RESPONSABLE , :LOG_USUARIO , :LOG_FECHA_MODIFICADO, :HORA, :ID' +
        '_GRUPO)')
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
        Name = 'HORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end>
  end
end
