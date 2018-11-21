inherited FEveCalidadCarne: TFEveCalidadCarne
  Left = 391
  Top = 125
  Caption = 'Calidad de Carne'
  Constraints.MinWidth = 881
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
              Width = 481
              Height = 215
              inherited IFondoDis: TImage
                Width = 477
                Height = 196
              end
              inherited BDBGDisponibles: TBitDBGrid
                Width = 477
                Height = 196
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'Senasa'
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Left = 589
              Width = 413
              Height = 215
              inherited IFondoSel: TImage
                Width = 409
                Height = 196
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 409
                Height = 196
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
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
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Left = 481
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
                'o, sexo, FECHA_NACIMIENTO, nombre from AUX_ANIMALES'
              ''
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
          Height = 290
          object LFecha: TLabel
            Left = 44
            Top = 32
            Width = 70
            Height = 23
            AutoSize = False
            Caption = 'Fecha:'
          end
          object LObservador: TLabel
            Left = 44
            Top = 64
            Width = 70
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
          object LPeso: TLabel
            Left = 44
            Top = 126
            Width = 35
            Height = 15
            Caption = 'Peso: '
          end
          object Label1: TLabel
            Left = 44
            Top = 159
            Width = 29
            Height = 15
            Caption = 'D'#237'as:'
          end
          object LAltura: TLabel
            Left = 382
            Top = 32
            Width = 37
            Height = 15
            Caption = 'Altura: '
            Layout = tlCenter
          end
          object LCm: TLabel
            Left = 511
            Top = 34
            Width = 20
            Height = 15
            Caption = 'cm.'
            Layout = tlCenter
          end
          object LEdad: TLabel
            Left = 382
            Top = 64
            Width = 35
            Height = 15
            Caption = 'Edad: '
            Layout = tlCenter
          end
          object Ldias: TLabel
            Left = 511
            Top = 65
            Width = 24
            Height = 15
            Caption = 'd'#237'as'
            Layout = tlCenter
          end
          object LValor: TLabel
            Left = 44
            Top = 96
            Width = 59
            Height = 15
            Caption = 'Circ. Escr.:'
          end
          object Label2: TLabel
            Left = 204
            Top = 95
            Width = 50
            Height = 13
            Caption = '(0 - 60 cm)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object JvEnterAsTab1: TJvEnterAsTab
            Left = 688
            Top = 16
            Width = 28
            Height = 28
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 110
            Top = 31
            Width = 90
            Height = 21
            Date = 38657.411226122680000000
            Time = 38657.411226122680000000
            Color = 14679807
            TabOrder = 0
            OnCloseUp = DTPAFechaCloseUp
            OnChange = DTPAFechaChange
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 110
            Top = 61
            Width = 233
            Height = 23
            Color = 14679807
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 1
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object EAPeso: TEditAuto
            Left = 110
            Top = 122
            Width = 90
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 3
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
          object DBLCBADias: TDBLookupComboBoxAuto
            Left = 110
            Top = 156
            Width = 150
            Height = 23
            Color = clWhite
            DropDownRows = 20
            KeyField = 'ID_CODIGO'
            ListField = 'VALOR'
            ListSource = DMSoftvet.DSCodigosGenericos
            TabOrder = 4
            OnCloseUp = DBLCBADiasCloseUp
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object EAAltura: TEditAuto
            Left = 420
            Top = 30
            Width = 90
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 3
            TabOrder = 5
            OnChange = EAAlturaChange
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
          object EAEdad: TEditAuto
            Left = 420
            Top = 60
            Width = 90
            Height = 23
            AutoSize = False
            CharCase = ecUpperCase
            Color = clWhite
            ReadOnly = True
            TabOrder = 6
            OnChange = EAEdadChange
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object SEvalor: TSpinEdit
            Left = 110
            Top = 90
            Width = 90
            Height = 24
            Color = clInfoBk
            MaxLength = 2
            MaxValue = 60
            MinValue = 0
            TabOrder = 2
            Value = 0
            OnChange = SEvalorChange
            OnExit = GetEvent
            OnKeyPress = SEvalorKeyPress
          end
          object alos18meses: TCheckBox
            Left = 267
            Top = 94
            Width = 80
            Height = 18
            Caption = '18 meses'
            TabOrder = 7
            OnEnter = GetEvent
          end
          object STEdad: TStaticText
            Left = 616
            Top = 65
            Width = 4
            Height = 4
            TabOrder = 8
          end
          object STAltura: TStaticText
            Left = 668
            Top = 37
            Width = 4
            Height = 4
            TabOrder = 9
          end
          object GroupBox1: TGroupBox
            Left = 382
            Top = 95
            Width = 595
            Height = 90
            Caption = '  Datos de Ecograf'#237'a  '
            TabOrder = 10
            object GroupBox2: TGroupBox
              Left = 2
              Top = 17
              Width = 201
              Height = 71
              Align = alLeft
              Caption = '  Cantidad de Im'#225'genes  '
              TabOrder = 0
              object Label3: TLabel
                Left = 5
                Top = 19
                Width = 68
                Height = 15
                Caption = 'A.O.B.E.G.D.'
              end
              object Label5: TLabel
                Left = 88
                Top = 19
                Width = 35
                Height = 15
                Caption = 'E.G.C.'
              end
              object Label4: TLabel
                Left = 153
                Top = 19
                Width = 18
                Height = 15
                Caption = 'G.I.'
              end
              object SpinEdit1: TSpinEdit
                Left = 15
                Top = 37
                Width = 50
                Height = 24
                MaxLength = 2
                MaxValue = 60
                MinValue = 0
                TabOrder = 0
                Value = 0
                OnChange = SEvalorChange
                OnExit = GetEvent
                OnKeyPress = SEvalorKeyPress
              end
              object SpinEdit3: TSpinEdit
                Left = 140
                Top = 37
                Width = 50
                Height = 24
                MaxLength = 2
                MaxValue = 60
                MinValue = 0
                TabOrder = 2
                Value = 0
                OnChange = SEvalorChange
                OnExit = GetEvent
                OnKeyPress = SEvalorKeyPress
              end
              object SpinEdit2: TSpinEdit
                Left = 81
                Top = 37
                Width = 50
                Height = 24
                MaxLength = 2
                MaxValue = 60
                MinValue = 0
                TabOrder = 1
                Value = 0
                OnChange = SEvalorChange
                OnExit = GetEvent
                OnKeyPress = SEvalorKeyPress
              end
            end
            object GroupBox3: TGroupBox
              Left = 203
              Top = 17
              Width = 83
              Height = 71
              Align = alLeft
              Caption = '  Pelado  '
              TabOrder = 1
              object DBLCBAPeladoSN: TDBLookupComboBoxAuto
                Left = 4
                Top = 37
                Width = 75
                Height = 23
                Color = 14679807
                DataField = 'ID_VIVO'
                DropDownRows = 20
                KeyField = 'ID_CODIGO'
                ListField = 'VALOR'
                ListSource = DSCodigoGenSINO
                TabOrder = 0
                OnExit = GetEvent
                EsClave = False
                EsRequerido = True
                ISParam = True
              end
            end
            object GroupBox4: TGroupBox
              Left = 286
              Top = 17
              Width = 60
              Height = 71
              Align = alLeft
              Caption = '  A.O.B.  '
              TabOrder = 2
              object EAAreaOjoBifeValue: TEditAuto
                Left = 4
                Top = 36
                Width = 50
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                TabOrder = 0
                OnExit = GetEvent
                OnKeyPress = EAreaOjoBifeValueKeyPress
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
            end
            object GroupBox5: TGroupBox
              Left = 346
              Top = 17
              Width = 60
              Height = 71
              Align = alLeft
              Caption = '  E.G.  '
              TabOrder = 3
              object EAEGValue: TEditAuto
                Left = 4
                Top = 36
                Width = 50
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                TabOrder = 0
                OnExit = GetEvent
                OnKeyPress = EEGValueKeyPress
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
            end
            object GroupBox6: TGroupBox
              Left = 406
              Top = 17
              Width = 60
              Height = 71
              Align = alLeft
              Caption = '  G.I.  '
              TabOrder = 4
              object EAGIValue: TEditAuto
                Left = 4
                Top = 36
                Width = 50
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                TabOrder = 0
                OnExit = GetEvent
                OnKeyPress = EGIValueKeyPress
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
            end
            object GroupBox7: TGroupBox
              Left = 466
              Top = 17
              Width = 60
              Height = 71
              Align = alLeft
              Caption = '  G.C.  '
              TabOrder = 5
              object EAGCValue: TEditAuto
                Left = 4
                Top = 36
                Width = 50
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                TabOrder = 0
                OnExit = GetEvent
                OnKeyPress = EGCValueKeyPress
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
            end
            object GroupBox8: TGroupBox
              Left = 526
              Top = 17
              Width = 67
              Height = 71
              Align = alClient
              Caption = '  PCMA  '
              TabOrder = 6
              object EAPCMAValue: TEditAuto
                Left = 6
                Top = 36
                Width = 50
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                TabOrder = 0
                OnExit = GetEvent
                OnKeyPress = EPCMAValueKeyPress
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 333
          Height = 67
          inherited MAObservacion: TMemoAuto
            Height = 48
          end
        end
        object PFrame: TPanel
          Left = 0
          Top = 290
          Width = 1002
          Height = 43
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuHighlight
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          TitleFont.Height = -26
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
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'AOB'
              Title.Alignment = taCenter
              Title.Caption = 'A.O.B.'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'EG'
              Title.Alignment = taCenter
              Title.Caption = 'E.G.'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'GI'
              Title.Alignment = taCenter
              Title.Caption = 'G.I.'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'GC'
              Title.Alignment = taCenter
              Title.Caption = 'G.C.'
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PCMA'
              Title.Alignment = taCenter
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTAOPBEGD'
              Title.Caption = 'Cant. Imag. A.O.B.E.G.D.'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTEGC'
              Title.Caption = 'Cant. Imag. E.G.C.'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTGI'
              Title.Caption = 'Cant. Imag. G.I.'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO'
              Title.Caption = 'Peso'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALTURA'
              Title.Caption = 'Altura (cm.)'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EDAD'
              Title.Caption = 'Edad (D'#237'as)'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FRAME'
              Title.Caption = 'Frame'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Caption = 'Circunferencia Escrotal'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PELADO'
              Title.Caption = 'Pelado'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 287
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 522
      end
      inherited BBCancelar: TBitBtn
        Left = 598
      end
      inherited BBAnterior: TBitBtn
        Left = 696
      end
      inherited BBSiguiente: TBitBtn
        Left = 794
      end
      inherited BBTerminar: TBitBtn
        Left = 892
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Calidad de Carne'
  end
  inherited ALUniversal: TActionList
    Top = 70
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Top = 103
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, FECHA, RESPONSABLE,' +
        ' EW)'
      'values'
      
        '  (:ID_RP, :ID_SENASA, :ID_ANIMAL, :OBSERVACION, :FECHA, :RESPON' +
        'SABLE, '
      '   :EW)')
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
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO')
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, D1 AS FECHA, R' +
        'ESPONSABLE, ID_AUX_EVENTO, V1 as CODDIAS, F2 AS PESO,V2  AS RESP' +
        ', V3 as DIAS, EW, D1 AS FECHA_NACIMIENTO, F3 as ALTURA, F4 AS VA' +
        'LOR, V3  as alos18meses, F1 AS FRAME, I4 as EDAD,I5 as CANTAOPBE' +
        'GD, I6 as CANTEGC, I7 as CANTGI, VUNO1, V4 as PELADO, I9 as SEXO' +
        ', F1 as aob, F2 as eg, F3 as gi, F4 as gc, F5 as pcma from AUX_E' +
        'VENTOS ')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  OBSERVACION = :OBSERVACION,'
      '  FECHA = :FECHA,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  EW = :EW'
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
      Size = 255
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.D1'
      OnChange = IBDSSimpleFECHAChange
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleID_AUX_EVENTO: TIntegerField
      FieldName = 'ID_AUX_EVENTO'
      Origin = 'AUX_EVENTOS.ID_AUX_EVENTO'
    end
    object IBDSSimpleCODDIAS: TIBStringField
      FieldName = 'CODDIAS'
      Origin = 'AUX_EVENTOS.V1'
      Size = 100
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V2'
      Size = 100
    end
    object IBDSSimpleDIAS: TIBStringField
      FieldName = 'DIAS'
      Origin = 'AUX_EVENTOS.V3'
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleFECHA_NACIMIENTO: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'AUX_EVENTOS.D1'
    end
    object IBDSSimpleALOS18MESES: TIBStringField
      FieldName = 'ALOS18MESES'
      Origin = 'AUX_EVENTOS.V3'
      Size = 100
    end
    object IBDSSimpleFRAME: TFloatField
      FieldName = 'FRAME'
      Origin = 'AUX_EVENTOS.F1'
    end
    object IBDSSimpleEDAD: TIntegerField
      FieldName = 'EDAD'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleCANTAOPBEGD: TIntegerField
      FieldName = 'CANTAOPBEGD'
      Origin = 'AUX_EVENTOS.I5'
    end
    object IBDSSimpleCANTEGC: TIntegerField
      FieldName = 'CANTEGC'
      Origin = 'AUX_EVENTOS.I6'
    end
    object IBDSSimpleCANTGI: TIntegerField
      FieldName = 'CANTGI'
      Origin = 'AUX_EVENTOS.I7'
    end
    object IBDSSimpleVUNO1: TIBStringField
      FieldName = 'VUNO1'
      Origin = 'AUX_EVENTOS.VUNO1'
      Size = 1
    end
    object IBDSSimplePELADO: TIBStringField
      FieldName = 'PELADO'
      Origin = 'AUX_EVENTOS.V4'
      Size = 100
    end
    object IBDSSimpleSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_EVENTOS.I9'
    end
    object IBDSSimplePESO: TFloatField
      FieldName = 'PESO'
      Origin = 'AUX_EVENTOS.F2'
    end
    object IBDSSimpleALTURA: TFloatField
      FieldName = 'ALTURA'
      Origin = 'AUX_EVENTOS.F3'
    end
    object IBDSSimpleVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'AUX_EVENTOS.F4'
    end
    object IBDSSimpleAOB: TFloatField
      FieldName = 'AOB'
      Origin = 'AUX_EVENTOS.F1'
    end
    object IBDSSimpleEG: TFloatField
      FieldName = 'EG'
      Origin = 'AUX_EVENTOS.F2'
    end
    object IBDSSimpleGI: TFloatField
      FieldName = 'GI'
      Origin = 'AUX_EVENTOS.F3'
    end
    object IBDSSimpleGC: TFloatField
      FieldName = 'GC'
      Origin = 'AUX_EVENTOS.F4'
    end
    object IBDSSimplePCMA: TFloatField
      FieldName = 'PCMA'
      Origin = 'AUX_EVENTOS.F5'
    end
  end
  inherited SDXLS: TSaveDialog
    Left = 214
    Top = 309
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
        DataField = 'PESO'
        Title = 'Peso'
      end
      item
        DataField = 'ALTURA'
        Title = 'Altura'
      end
      item
        DataField = 'EDAD'
        Title = 'Edad (D'#237'as)'
      end
      item
        DataField = 'FRAME'
        Title = 'Frame'
      end
      item
        DataField = 'VALOR'
        Title = 'Circunferencia Escrotal'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end
      item
        DataField = 'CANTAOPBEGD'
        Title = 'Cantidad Im'#225'genes O.P.B.E.G.D.'
      end
      item
        DataField = 'CANTEGC'
        Title = 'Cantidad Im'#225'genes E.G.C.'
      end
      item
        DataField = 'CANTGI'
        Title = 'Cantidad Im'#225'genes G.I.'
      end
      item
        DataField = 'PELADO'
        Title = 'Pelado'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end>
    Title.Text = 'Evento Calidad de Carne'
    Left = 184
    Top = 313
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 372
    Top = 95
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 780
    Top = 119
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 740
    Top = 119
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from RN_CALIDAD_CARNE (:ANIMAL, :FRAME, :VALOR, :PESO, ' +
        ':EDAD_PESADO ,  :ESTABLECIMIENTO , :FECHA)')
    Top = 70
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EDAD_PESADO'
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
    Top = 78
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_CALIDAD_CARNE('
      
        '  :FECHA,  :ANIMAL,  :OBSERVACION,  :ESTABLECIMIENTO,         :R' +
        'ESPONSABLE,  :LOG_USUARIO,  :LOG_FECHA_MODIFICADO,'
      
        '  :DIAS,  :PESO, :ALTURA, :EDAD, :FRAME, :VALOR, :ALOS18MESES, :' +
        'CANTAOPBEGD, :CANTEGC, :CANTGI,:AOB,:EG,:GI,:GC,:PCMA, :PELADO, ' +
        ':ID_GRUPO, :DISPARADOR)'
      ''
      '')
    Top = 38
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
        Name = 'DIAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALTURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALOS18MESES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANTAOPBEGD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANTEGC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANTGI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PCMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PELADO'
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
    Left = 696
    Top = 38
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 892
    Top = 119
  end
  inherited OpenDlg: TOpenDialog
    Left = 148
    Top = 320
  end
  object IBQSexo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select TIPO AS SEXO,NOMBRE, SINONIMO from  COD_SEXOS '
      'where ( ID_SEXO = :id)')
    Left = 140
    Top = 402
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object IBQSexoSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'COD_SEXOS.TIPO'
      Required = True
    end
    object IBQSexoNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_SEXOS.NOMBRE'
      Required = True
      Size = 50
    end
    object IBQSexoSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_SEXOS.SINONIMO'
      Required = True
      Size = 50
    end
  end
  object DSSexo: TDataSource
    DataSet = DMSoftvet.IBQSexo
    Left = 180
    Top = 402
  end
  object IBQObtenerIDSexo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select SEXO, FECHA_NACIMIENTO from  TAB_ANIMALES'
      'where ( ID_ANIMAL = :id)')
    Left = 236
    Top = 402
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object IBQObtenerIDSexoSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'TAB_ANIMALES.SEXO'
      Required = True
    end
    object IBQObtenerIDSexoFECHA_NACIMIENTO: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'TAB_ANIMALES.FECHA_NACIMIENTO'
      Required = True
    end
  end
  object DSObtenerIDSexo: TDataSource
    DataSet = IBQObtenerIDSexo
    Left = 276
    Top = 402
  end
  object IBQCodigoGenSINO: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo)')
    Left = 380
    Top = 402
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSCodigoGenSINO: TDataSource
    DataSet = IBQCodigoGenSINO
    Left = 420
    Top = 402
  end
end
