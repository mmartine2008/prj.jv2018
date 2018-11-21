inherited FEveDiagnosticoGestacion: TFEveDiagnosticoGestacion
  Left = 76
  Top = 97
  HelpContext = 15000
  Caption = ' '
  ClientHeight = 585
  ClientWidth = 1180
  Constraints.MinHeight = 518
  Constraints.MinWidth = 826
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1180
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
    Top = 472
    Width = 1180
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1172
      end
    end
  end
  inherited PDatos: TPanel
    Width = 1180
    Height = 385
    inherited PCBasico: TPageControl
      Width = 1180
      Height = 303
      TabOrder = 0
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 1172
          Height = 261
        end
        inherited MSimple: TMangazo
          Width = 1172
          Height = 261
          inherited GBFiltro: TGroupBox
            Width = 1172
          end
          inherited PSeleccion: TPanel
            Width = 1172
            inherited GBDisponibles: TGroupBox
              Height = 0
              inherited BDBGDisponibles: TBitDBGrid
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 122
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
              Width = 615
              Height = 0
              inherited IFondoSel: TImage
                Width = 611
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 611
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 171
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
              Height = 0
              inherited IFondo: TImage
                Height = 0
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
            Width = 1172
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 1172
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 1172
            inherited Image1: TImage
              Width = 1172
            end
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            FAWidth = 145
            FAHeight = 170
            FCWidth = 22
            FCHeight = 22
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select FIRST 1 id_aux, ID_RP, ID_SENASA,id_animal, id_pc, id_hba' +
                ', id_otro, sexo, CRONOLOGIA_DENTARIA, CONDICION_CORPORAL, GDR, n' +
                'ombre from AUX_ANIMALES'
              'where id_animal > 0'
              ''
              ''
              '')
          end
          inherited IBUSQLIntercambiarIzq: TIBUpdateSQL
            RefreshSQL.Strings = (
              'Select FIRST 1 '
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
              'Select FIRST 1 *'
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
          inherited IBQDisponiblesGrupos: TIBQuery
            SQL.Strings = (
              
                'select FIRST 1 id_aux,ID_RP, ID_SENASA, id_animal, sexo, fecha_n' +
                'acimiento, madre_biologica_interna from GEN_GRUPOS_MANGA( :ID_Gr' +
                'upo) '
              '')
          end
          inherited DSCalidadSeminal: TDataSource
            Top = 192
          end
          inherited DSCondCorp: TDataSource
            Left = 424
            Top = 208
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Width = 1172
          Height = 346
          object LResponsable: TLabel
            Left = 78
            Top = 52
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
          object LFecha: TLabel
            Left = 112
            Top = 24
            Width = 40
            Height = 15
            Caption = 'Fecha: '
            Layout = tlCenter
          end
          object LCondicionCorporal: TLabel
            Left = 48
            Top = 109
            Width = 113
            Height = 15
            Caption = 'Condici'#243'n Corporal: '
            Layout = tlCenter
          end
          object LCronologiaDentaria: TLabel
            Left = 44
            Top = 81
            Width = 115
            Height = 15
            Caption = 'Cronolog'#237'a dentaria: '
            Layout = tlCenter
          end
          object LEstadoReproductivo: TLabel
            Left = 42
            Top = 138
            Width = 115
            Height = 15
            Caption = 'Estado reproductivo: '
            Layout = tlCenter
          end
          object Label1: TLabel
            Left = 28
            Top = 168
            Width = 130
            Height = 15
            Caption = 'M'#233'todo de diagn'#243'stico: '
            Layout = tlCenter
          end
          object LChico: TLabel
            Left = 20
            Top = 265
            Width = 32
            Height = 15
            Caption = 'Chico'
            Layout = tlCenter
            Visible = False
          end
          object LMediano: TLabel
            Left = 73
            Top = 265
            Width = 47
            Height = 15
            Caption = 'Mediano'
            Layout = tlCenter
            Visible = False
          end
          object LGrande: TLabel
            Left = 137
            Top = 265
            Width = 41
            Height = 15
            Caption = 'Grande'
            Layout = tlCenter
            Visible = False
          end
          object LPeriodosPreniez: TLabel
            Left = 187
            Top = 277
            Width = 108
            Height = 15
            Caption = 'Per'#237'odos de Pre'#241#233'z'
            Layout = tlCenter
            Visible = False
          end
          object Label3: TLabel
            Left = 112
            Top = 229
            Width = 41
            Height = 15
            Caption = 'Precio: '
          end
          object DTPAFecha: TDateTimePickerAuto
            Tag = 1
            Left = 167
            Top = 17
            Width = 161
            Height = 21
            Date = 38657.411226122680000000
            Time = 38657.411226122680000000
            Color = 14679807
            TabOrder = 0
            OnCloseUp = RBDistClick
            OnChange = RBDistClick
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBACondicionCorporal: TDBLookupComboBoxAuto
            Left = 167
            Top = 102
            Width = 161
            Height = 23
            Color = clWhite
            DropDownRows = 20
            KeyField = 'ID_CONDICION_CORPORAL'
            ListField = 'ESCALA'
            ListSource = DSCondCorp
            TabOrder = 3
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 167
            Top = 45
            Width = 161
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
          object DBLCBACronologiaDentaria: TDBLookupComboBoxAuto
            Left = 167
            Top = 74
            Width = 161
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_CRONOLOGIA_DENTARIA'
            ListField = 'SINONIMO'
            ListSource = DMSoftvet.DSCronologiaDentaria
            TabOrder = 2
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object DBLCBAEstadoReproductivo: TDBLookupComboBoxAuto
            Left = 167
            Top = 131
            Width = 161
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_ESTADO_REPRODUCTIVO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSEstadoReproTacto
            TabOrder = 4
            OnCloseUp = DBLCBAEstadoReproductivoCloseUp
            OnExit = CapturarEvento
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object DBLCBAMetodoDiagnostico: TDBLookupComboBoxAuto
            Left = 167
            Top = 163
            Width = 161
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_METODO_DIAGNOSTICO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSMetodoDiagnostico
            TabOrder = 5
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object CBMustreo: TCheckBox
            Left = 96
            Top = 198
            Width = 104
            Height = 18
            Alignment = taLeftJustify
            BiDiMode = bdLeftToRight
            Caption = 'Sangrado'
            ParentBiDiMode = False
            TabOrder = 6
            OnExit = GetEvent
          end
          object GBDatosVacia: TGroupBox
            Left = 353
            Top = 17
            Width = 441
            Height = 131
            Caption = ' Datos si es vac'#237'a '
            TabOrder = 8
            Visible = False
            object LCondicionUtero: TLabel
              Left = 17
              Top = 26
              Width = 113
              Height = 15
              Caption = 'Condici'#243'n del '#250'tero: '
            end
            object LCondicionOvario: TLabel
              Left = 17
              Top = 52
              Width = 115
              Height = 15
              Caption = 'Condici'#243'n de ovario: '
            end
            object LCondicionCervix: TLabel
              Left = 17
              Top = 78
              Width = 112
              Height = 15
              Caption = 'Condici'#243'n de cervix: '
            end
            object CBRechazo: TCheckBox
              Left = 18
              Top = 103
              Width = 130
              Height = 19
              Alignment = taLeftJustify
              Caption = 'Rechazar animal'
              TabOrder = 3
              OnExit = GetEvent
            end
            object CBMuestreoMucus: TCheckBox
              Left = 170
              Top = 103
              Width = 129
              Height = 19
              Alignment = taLeftJustify
              Caption = 'Muestreo de mucus'
              TabOrder = 4
              Visible = False
              OnExit = GetEvent
            end
            object DBLCBACondicionUtero: TDBLookupComboBoxAuto
              Left = 138
              Top = 17
              Width = 161
              Height = 23
              Color = clWhite
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DMSoftvet.DSCodigosGenericos
              TabOrder = 0
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBACondicionOvario: TDBLookupComboBoxAuto
              Left = 138
              Top = 43
              Width = 161
              Height = 23
              Color = clWhite
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DMSoftvet.DSCodigosGenericos
              TabOrder = 1
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBACondicionCervix: TDBLookupComboBoxAuto
              Left = 138
              Top = 69
              Width = 161
              Height = 23
              Color = clWhite
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DMSoftvet.DSCodigosGenericos
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
          object TBDiasGestacion: TTrackBar
            Left = 34
            Top = 224
            Width = 294
            Height = 48
            BorderWidth = 1
            Max = 281
            Min = 25
            Frequency = 5
            Position = 281
            SelEnd = 281
            SelStart = 25
            TabOrder = 9
            Visible = False
          end
          object GBPreniadas: TGroupBox
            Left = 353
            Top = 17
            Width = 441
            Height = 311
            Caption = 'Datos si es pre'#241'ada'
            TabOrder = 10
            Visible = False
            object LDiasGestacion: TLabel
              Left = 13
              Top = 194
              Width = 106
              Height = 15
              Caption = 'D'#237'as de gestaci'#243'n: '
              Layout = tlCenter
            end
            object LDiasDist: TLabel
              Left = 13
              Top = 227
              Width = 127
              Height = 15
              Caption = 'Distribuci'#243'n de Pre'#241'ez:'
            end
            object LConfDist: TLabel
              Left = 14
              Top = 261
              Width = 83
              Height = 15
              Caption = 'Configuraci'#243'n: '
            end
            object Label2: TLabel
              Left = 15
              Top = 288
              Width = 156
              Height = 13
              Cursor = crHandPoint
              Caption = 'Parametros del Establecimiento...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = Label2Click
            end
            object LTransMasivo: TLabel
              Left = 34
              Top = 252
              Width = 363
              Height = 33
              Alignment = taCenter
              AutoSize = False
              Caption = 
                'Los d'#237'as de Gestaci'#243'n se calculan entre la fecha de tacto y la f' +
                'echa de transferencia. En la grilla de detalle se adicionar'#225'n lo' +
                's d'#237'as de gestaci'#243'n de cada uno de los embriones'
              Visible = False
              WordWrap = True
            end
            object LTransIndividual: TLabel
              Left = 34
              Top = 251
              Width = 363
              Height = 33
              Alignment = taCenter
              AutoSize = False
              Caption = 
                'Los d'#237'as de Gestaci'#243'n se calculan entre la fecha de tacto y la f' +
                'echa de transferencia m'#225's los d'#237'as de gestaci'#243'n del embri'#243'n'
              Visible = False
              WordWrap = True
            end
            object EADiasGestacion: TEditAuto
              Left = 116
              Top = 191
              Width = 148
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 0
              Text = '0'
              OnChange = EADiasGestacionChange
              OnExit = CapturarEvento
              OnKeyPress = EADiasGestacionKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object UDDiasGestacion: TUpDown
              Left = 264
              Top = 191
              Width = 16
              Height = 23
              Associate = EADiasGestacion
              Max = 10000
              TabOrder = 1
              OnChangingEx = UDDiasGestacionChangingEx
            end
            object GroupBox2: TGroupBox
              Left = 9
              Top = 17
              Width = 423
              Height = 165
              Caption = 'Datos del servicio'
              TabOrder = 2
              object LFIni: TLabel
                Left = 10
                Top = 29
                Width = 69
                Height = 15
                Caption = 'Fecha Inicio:'
              end
              object LFFin: TLabel
                Left = 224
                Top = 30
                Width = 74
                Height = 15
                Caption = 'Fecha de Fin:'
              end
              object LLinkEstServ: TLabel
                Left = 200
                Top = 145
                Width = 103
                Height = 13
                Cursor = crHandPoint
                Caption = 'Estado de Servicios...'
                Color = clHighlight
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
                OnClick = LLinkEstServClick
              end
              object LLinkDenServ: TLabel
                Left = 11
                Top = 144
                Width = 116
                Height = 13
                Cursor = crHandPoint
                Caption = 'Denuncia de Servicios...'
                Color = clHighlight
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
                OnClick = LLinkDenServClick
              end
              object LServicio: TLabel
                Left = 12
                Top = 67
                Width = 50
                Height = 15
                Caption = 'LServicio'
                Visible = False
              end
              object DTPAFechaIni: TDateTimePickerAuto
                Tag = 2
                Left = 84
                Top = 25
                Width = 120
                Height = 21
                Date = 39386.463239155090000000
                Time = 39386.463239155090000000
                Color = 14679807
                TabOrder = 0
                OnCloseUp = RBDistClick
                OnChange = RBDistClick
                OnExit = DTPAFechaIniExit
                EsClave = False
                EsRequerido = True
                ISParam = False
              end
              object DTPAFechaFin: TDateTimePickerAuto
                Tag = 3
                Left = 299
                Top = 26
                Width = 113
                Height = 21
                Date = 39363.425880347230000000
                Time = 39363.425880347230000000
                Color = 14679807
                TabOrder = 1
                OnCloseUp = RBDistClick
                OnExit = DTPAFechaFinExit
                EsClave = False
                EsRequerido = True
                ISParam = False
              end
              object MServicios: TMemo
                Left = 19
                Top = 59
                Width = 380
                Height = 76
                Alignment = taCenter
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                Color = clWhite
                Lines.Strings = (
                  'Memo1'
                  '2'
                  '3'
                  '4'
                  '5')
                TabOrder = 2
                Visible = False
              end
            end
            object DBLCBACACUCO: TDBLookupComboBoxAuto
              Left = 143
              Top = 224
              Width = 282
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_DIST_CACUCO'
              ListField = 'NOMBRE'
              ListSource = DSDistCACUCOIA
              TabOrder = 3
              OnCloseUp = DBLCBACACUCOCloseUp
              OnExit = CapturarEvento
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
          end
          object EAPrecio: TEditAuto
            Tag = 1
            Left = 167
            Top = 225
            Width = 153
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 10
            TabOrder = 7
            Text = '0'
            OnChange = EAPrecioChange
            OnExit = GetEvent
            OnKeyPress = ControlReales
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 346
          Width = 1172
          Height = 54
          inherited MAObservacion: TMemoAuto
            Width = 1168
            Height = 35
          end
        end
      end
      object TSUbicaciones: TTabSheet [2]
        Caption = 'Ubicaciones'
        ImageIndex = 7
        TabVisible = False
        object GBUbicacionVacias: TGroupBox
          Left = 0
          Top = 0
          Width = 457
          Height = 261
          Align = alLeft
          Caption = ' Nueva ubicaci'#243'n para vacias '
          TabOrder = 0
          object LNuevoPotreroVacia: TLabel
            Left = 17
            Top = 78
            Width = 71
            Height = 13
            Cursor = crHandPoint
            Caption = 'Nuevo potrero:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = LNuevoPotreroVaciaClick
            OnMouseEnter = LNuevoPotreroVaciaMouseEnter
            OnMouseLeave = LNuevoPotreroVaciaMouseLeave
          end
          object CBUbicacionVacias: TCheckBox
            Left = 43
            Top = 26
            Width = 268
            Height = 18
            Caption = 'Desea dar una ubicaci'#243'n para todas las vacias'
            TabOrder = 0
            OnClick = CBUbicacionVaciasClick
          end
          object DBLCBANuevoPotreroVacias: TDBLookupComboBoxAuto
            Left = 121
            Top = 73
            Width = 156
            Height = 23
            Color = clWhite
            DropDownRows = 20
            KeyField = 'ID_POTRERO'
            ListField = 'NOMBRE'
            ListSource = DSPotreroVacias
            TabOrder = 1
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
        end
        object GBUbicacionPreniadas: TGroupBox
          Left = 708
          Top = 0
          Width = 464
          Height = 261
          Align = alRight
          Caption = ' Nueva ubicaci'#243'n para pre'#241'adas '
          TabOrder = 1
          object LNuevoPotreroPreniada: TLabel
            Left = 17
            Top = 78
            Width = 71
            Height = 13
            Cursor = crHandPoint
            Caption = 'Nuevo potrero:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = LNuevoPotreroPreniadaClick
            OnMouseEnter = LNuevoPotreroPreniadaMouseEnter
            OnMouseLeave = LNuevoPotreroPreniadaMouseLeave
          end
          object CBUbicacionPreniadas: TCheckBox
            Left = 43
            Top = 26
            Width = 277
            Height = 18
            Caption = 'Desea dar una ubicaci'#243'n para todas las pre'#241'adas'
            TabOrder = 0
            OnClick = CBUbicacionPreniadasClick
          end
          object DBLCBANuevoPotreroPreniadas: TDBLookupComboBoxAuto
            Left = 121
            Top = 73
            Width = 156
            Height = 23
            Color = clWhite
            DropDownRows = 20
            KeyField = 'ID_POTRERO'
            ListField = 'NOMBRE'
            ListSource = DSPotreroPreniadas
            TabOrder = 1
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Width = 1077
          Height = 261
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              Title.Caption = 'RP Animal'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CRONOLOGIA_DENTARIA'
              Title.Caption = 'Cronolog'#237'a dentaria'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONDICION_CORPORAL'
              Title.Caption = 'Condici'#243'n corporal'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DISTCACUCO'
              Title.Caption = 'Distribuci'#243'n'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_REPRODUCTIVO'
              Title.Caption = 'Estado reproductivo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 100
              Visible = True
            end
            item
              Alignment = taLeftJustify
              Expanded = False
              FieldName = 'DIAS_GESTACION'
              Title.Caption = 'D'#237'as gestaci'#243'n'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MUESTREO'
              Title.Caption = 'Sangrado'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'METODO_DIAGNOSTICO'
              Title.Caption = 'M'#233'todo de diagn'#243'stico'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONDICION_UTERO'
              Title.Caption = #218'tero'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONDICION_OVARIO'
              Title.Caption = 'Ovario'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONDICION_CERVIX'
              Title.Caption = 'Cervix'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECHAZO'
              Title.Caption = 'Rechazo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MUESTREOMUCUS'
              Title.Caption = 'Mucus'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 261
        end
        inherited PanelDer: TPanel
          Left = 1124
          Height = 261
        end
      end
    end
    inherited PBotones: TPanel
      Top = 303
      Width = 1180
      TabOrder = 1
      inherited SBSelTodos: TSpeedButton
        Left = 624
      end
      inherited IFondoB2: TImage
        Width = 754
      end
      inherited JvIDispElect: TJvImage
        Left = 234
      end
      inherited LDispElect: TLabel
        Left = 211
      end
      inherited ISacarAnimal: TJvImage
        Left = 229
      end
      inherited BBCancelar: TBitBtn
        Left = 791
      end
      inherited BBAnterior: TBitBtn
        Left = 883
      end
      inherited BBSiguiente: TBitBtn
        Left = 974
      end
      inherited BBTerminar: TBitBtn
        Left = 1067
      end
      inherited PL: TPanel
        Left = 754
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1180
    Caption = 'Diagn'#243'stico de gestaci'#243'n'
    inherited LTitulo: TLabel
      Width = 776
    end
    inherited PILeft: TPanel
      Left = 972
    end
  end
  inherited Psocalo: TPanel
    Top = 450
    Width = 1180
    inherited JvSocalo: TJvImage
      Width = 1180
    end
  end
  inherited ALUniversal: TActionList
    Left = 451
    Top = 46
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 156
    Top = 65535
  end
  inherited DSSimple: TDataSource
    Top = 0
  end
  inherited IBDSSimple: TIBDataSet
    RefreshSQL.Strings = (
      'Select FIRST 1 '
      '  ID_ANIMAL,'
      '  ESTABLECIMIENTO,'
      '  ID_AUX,'
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
      '  APODO'
      'from AUX_ANIMALES '
      'where'
      '  ID_RP = :ID_RP'
      '')
    SelectSQL.Strings = (
      'select FIRST 1 ID_ANIMAL,'
      '          ID_AUX_EVENTO, '
      '          ID_RP, '
      '          ID_SENASA, '
      '          FECHA, '
      '          D1, '
      '          D2,'
      '          OBSERVACION, '
      '          RESPONSABLE, '
      '          V1 AS RESP,  '
      '          I2 AS ID_CONDICION_CORPORAL, '
      '          f1 as CONDICION_CORPORAL,'
      '          I3 as ID_Cronologia_dentaria,'
      '          V3 as Cronologia_dentaria,'
      '          I4 as ID_Estado_reproductivo,'
      '          V4 as Estado_reproductivo,'
      '          I5 as ID_Metodo_diagnostico,'
      '          V5 as Metodo_diagnostico,'
      '          I6 as Dias_Gestacion,'
      '          I7 as id_DistCACUCO,'
      '          nombre as DistCACUCO,'
      '          VUNO1 as ID_condicion_utero,'
      '          V7 as Condicion_utero,'
      '          VUNO2 as ID_condicion_ovario,'
      '          V8 as Condicion_ovario,'
      '          VUNO3 as ID_condicion_cervix,'
      '          V9 as Condicion_cervix,'
      '          VUNO4 as ID_Muestreo,'
      '          V10 as Muestreo,'
      '          VUNO5 as ID_Rechazo,'
      '          V11 as Rechazo,'
      '          VUNO6 as ID_MuestreoMucus,'
      '          V12 as MuestreoMucus,'
      '          EW'
      'from AUX_EVENTOS')
    GeneratorField.Field = 'ID_AUX_EVENTO'
    GeneratorField.Generator = 'GEN_AUX_EVENTOS'
    Left = 136
    Top = 208
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
    object IBDSSimpleID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_EVENTOS.ID_SENASA'
      Size = 9
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
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 100
    end
    object IBDSSimpleID_CONDICION_CORPORAL: TIntegerField
      FieldName = 'ID_CONDICION_CORPORAL'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleCONDICION_CORPORAL: TFloatField
      FieldName = 'CONDICION_CORPORAL'
      Origin = 'AUX_EVENTOS.F1'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
    end
    object IBDSSimpleID_CRONOLOGIA_DENTARIA: TIntegerField
      FieldName = 'ID_CRONOLOGIA_DENTARIA'
      Origin = 'AUX_EVENTOS.I3'
    end
    object IBDSSimpleCRONOLOGIA_DENTARIA: TIBStringField
      FieldName = 'CRONOLOGIA_DENTARIA'
      Origin = 'AUX_EVENTOS.V3'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 100
    end
    object IBDSSimpleID_ESTADO_REPRODUCTIVO: TIntegerField
      FieldName = 'ID_ESTADO_REPRODUCTIVO'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleESTADO_REPRODUCTIVO: TIBStringField
      FieldName = 'ESTADO_REPRODUCTIVO'
      Origin = 'AUX_EVENTOS.V4'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 100
    end
    object IBDSSimpleID_METODO_DIAGNOSTICO: TIntegerField
      FieldName = 'ID_METODO_DIAGNOSTICO'
      Origin = 'AUX_EVENTOS.I5'
    end
    object IBDSSimpleMETODO_DIAGNOSTICO: TIBStringField
      FieldName = 'METODO_DIAGNOSTICO'
      Origin = 'AUX_EVENTOS.V5'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 100
    end
    object IBDSSimpleDIAS_GESTACION: TIntegerField
      FieldName = 'DIAS_GESTACION'
      Origin = 'AUX_EVENTOS.I6'
      OnSetText = IBDSSimpleDIAS_GESTACIONSetText
    end
    object IBDSSimpleID_CONDICION_UTERO: TIBStringField
      FieldName = 'ID_CONDICION_UTERO'
      Origin = 'AUX_EVENTOS.VUNO1'
      Size = 1
    end
    object IBDSSimpleCONDICION_UTERO: TIBStringField
      FieldName = 'CONDICION_UTERO'
      Origin = 'AUX_EVENTOS.V7'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 100
    end
    object IBDSSimpleID_CONDICION_OVARIO: TIBStringField
      FieldName = 'ID_CONDICION_OVARIO'
      Origin = 'AUX_EVENTOS.VUNO2'
      Size = 1
    end
    object IBDSSimpleCONDICION_OVARIO: TIBStringField
      FieldName = 'CONDICION_OVARIO'
      Origin = 'AUX_EVENTOS.V8'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 100
    end
    object IBDSSimpleID_CONDICION_CERVIX: TIBStringField
      FieldName = 'ID_CONDICION_CERVIX'
      Origin = 'AUX_EVENTOS.VUNO3'
      Size = 1
    end
    object IBDSSimpleCONDICION_CERVIX: TIBStringField
      FieldName = 'CONDICION_CERVIX'
      Origin = 'AUX_EVENTOS.V9'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 100
    end
    object IBDSSimpleID_MUESTREO: TIBStringField
      FieldName = 'ID_MUESTREO'
      Origin = 'AUX_EVENTOS.VUNO4'
      Size = 1
    end
    object IBDSSimpleMUESTREO: TIBStringField
      FieldName = 'MUESTREO'
      Origin = 'AUX_EVENTOS.V10'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 100
    end
    object IBDSSimpleID_RECHAZO: TIBStringField
      FieldName = 'ID_RECHAZO'
      Origin = 'AUX_EVENTOS.VUNO5'
      Size = 1
    end
    object IBDSSimpleRECHAZO: TIBStringField
      FieldName = 'RECHAZO'
      Origin = 'AUX_EVENTOS.V11'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 100
    end
    object IBDSSimpleID_MUESTREOMUCUS: TIBStringField
      FieldName = 'ID_MUESTREOMUCUS'
      Origin = 'AUX_EVENTOS.VUNO6'
      Size = 1
    end
    object IBDSSimpleMUESTREOMUCUS: TIBStringField
      FieldName = 'MUESTREOMUCUS'
      Origin = 'AUX_EVENTOS.V12'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleID_DISTCACUCO: TIntegerField
      FieldName = 'ID_DISTCACUCO'
      Origin = 'AUX_EVENTOS.I7'
    end
    object IBDSSimpleDISTCACUCO: TIBStringField
      FieldName = 'DISTCACUCO'
      Origin = 'AUX_EVENTOS.NOMBRE'
      OnChange = Change
      OnSetText = SetText
      OnValidate = Validate
      Size = 50
    end
    object IBDSSimpleD1: TDateField
      FieldName = 'D1'
      Origin = 'AUX_EVENTOS.D1'
    end
    object IBDSSimpleD2: TDateField
      FieldName = 'D2'
      Origin = 'AUX_EVENTOS.D2'
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Top = 5
  end
  inherited IBQValidaciones: TIBQuery
    Left = 276
    Top = 6
  end
  inherited IBQEvento: TIBQuery
    Left = 244
    Top = 6
  end
  inherited SDXLS: TSaveDialog
    Left = 126
    Top = 65533
  end
  inherited DTXLS: TDataToXLS
    Tag = 1
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
        DataField = 'ESTADO_REPRODUCTIVO'
        Title = 'Estado Reproductivo'
      end
      item
        DataField = 'DISTCACUCO'
        Title = 'Distribuci'#243'n'
      end
      item
        DataField = 'DIAS_GESTACION'
        Title = 'D'#237'as Gestaci'#243'n'
      end
      item
        DataField = 'CRONOLOGIA_DENTARIA'
        Title = 'Cronolog'#237'a dentaria'
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
        DataField = 'MUESTREO'
        Title = 'Sangrado'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end
      item
        DataField = 'METODO_DIAGNOSTICO'
        Title = 'M'#233'todo de Diagn'#243'stico'
      end
      item
        DataField = 'CONDICION_UTERO'
        Title = 'Utero'
      end
      item
        DataField = 'CONDICION_OVARIO'
        Title = 'Ovario'
      end
      item
        DataField = 'CONDICION_CERVIX'
        Title = 'Cervix'
      end
      item
        DataField = 'RECHAZO'
        Title = 'Rechazo'
      end
      item
        DataField = 'MUESTREOMUCUS'
        Title = 'Mucus'
      end
      item
        DataField = 'D1'
        Title = 'Inicio Servicio'
      end
      item
        DataField = 'D2'
        Title = 'Fin Servicio'
      end>
    Title.RowHeight = 1
    Title.Text = 'Evento Diagn'#243'stico de Gestaci'#243'n'
    Header.RowHeight = 1
    Comment = 'a'
    Top = 9
  end
  inherited WinXP1: TWinXP
    Left = 96
    Top = 0
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Top = 31
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 332
    Top = 23
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 500
    Top = 263
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 444
    Top = 15
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select FIRST 1 * from rn_diagnostico_gestacion(:animal, :dias, :' +
        'fecha, :esta, :repro,:Ini,:Fin)')
    Left = 488
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'animal'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'dias'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'repro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Ini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fin'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 520
    Top = 22
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_DIAGNOSTICO_GESTACION ('
      '  :DIAS_GESTACION,       '
      '  :CRONOLOGIA_DENTARIA,'
      '  :CONDICION_CORPORAL,'
      '  :METODO_DIAGNOSTICO,'
      '  :ESTADO_REPRODUCTIVO,'
      '  :MUESTREO,'
      '  :MUCUS,'
      '  :CONDICION_UTERO,'
      '  :CONDICION_OVARIO,'
      '  :CONDICION_CERVIX,'
      '  :POTRERO,'
      '  :RECHAZO,'
      '  :FECHA,'
      '  :FECHA_INI,'
      '  :FECHA_FIN,'
      '  :ANIMAL,'
      '  :OBSERVACION,'
      '  :ESTABLECIMIENTO,'
      '  :RESPONSABLE,'
      '  :LOG_USUARIO,'
      '  :LOG_FECHA_MODIFICADO,'
      '  :DISPARADOR,'
      '  :GRUPO,'
      '  :DIAS_0,'
      '  :DISTRIBUCION_0,'
      '  :DIAS_1,'
      '  :DISTRIBUCION_1,'
      '  :DIAS_2,'
      '  :DISTRIBUCION_2,'
      '  :DIAS_3,'
      '  :DISTRIBUCION_3,'
      '  :PRECIO)')
    Left = 528
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DIAS_GESTACION'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CRONOLOGIA_DENTARIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONDICION_CORPORAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'METODO_DIAGNOSTICO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ESTADO_REPRODUCTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MUESTREO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MUCUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONDICION_UTERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONDICION_OVARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONDICION_CERVIX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'POTRERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RECHAZO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_INI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ESTABLECIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESPONSABLE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LOG_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'LOG_FECHA_MODIFICADO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DIAS_0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISTRIBUCION_0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIAS_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISTRIBUCION_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIAS_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISTRIBUCION_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIAS_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISTRIBUCION_3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 560
    Top = 6
  end
  object DSPotreroVacias: TDataSource [28]
    DataSet = IBQPotreroVacias
    Left = 220
    Top = 6
  end
  object DSPotreroPreniadas: TDataSource [29]
    DataSet = IBQPotreroPreniadas
    Left = 673
    Top = 342
  end
  object IBQPotreroVacias: TIBQuery [30]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQPotreroVaciasAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 id_potrero, nombre from tab_potreros where (estab' +
        'lecimiento = :esta)')
    Left = 300
    Top = 30
    ParamData = <
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
      end>
    object IBQPotreroVaciasID_POTRERO: TIntegerField
      FieldName = 'ID_POTRERO'
      Origin = 'TAB_POTREROS.ID_POTRERO'
      Required = True
    end
    object IBQPotreroVaciasNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'TAB_POTREROS.NOMBRE'
      Required = True
      Size = 30
    end
  end
  object IBQPotreroPreniadas: TIBQuery [31]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQPotreroVaciasAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 id_potrero, nombre from tab_potreros where (estab' +
        'lecimiento = :esta)')
    Left = 609
    Top = 342
    ParamData = <
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
      end>
  end
  object IBQConsultaGenericosSN: TIBQuery [32]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 ID_CODIGO, VALOR from COD_GENERICOS where (TIPO =' +
        ' '#39'SN'#39')')
    Left = 417
    Top = 30
  end
  object DSGenericosSN: TDataSource [33]
    DataSet = IBQConsultaGenericosSN
    Left = 393
    Top = 30
  end
  object IBQValidacion: TIBQuery [34]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 id_lote, nombre from tab_lotes where establecimie' +
        'nto = :esta')
    Left = 657
    Top = 294
    ParamData = <
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
      end>
  end
  object IBQAux: TIBQuery [35]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 ID_CODIGO, VALOR from COD_GENERICOS where (TIPO =' +
        ' '#39'SN'#39')')
    Left = 697
    Top = 6
  end
  object IBQDatosDiag: TIBQuery [36]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 * from get_datos_diag_gestacion(:establecimiento,' +
        ':fecha_tacto);')
    Left = 348
    Top = 474
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha_tacto'
        ParamType = ptUnknown
      end>
  end
  object IBQCodCACUCO: TIBQuery [37]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select FIRST 1 * from COD_CACUCO')
    Left = 108
    Top = 482
  end
  object IBQDiasRaza: TIBQuery [38]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 cr.dias_gestacion from tab_animales ta, cod_razas' +
        ' cr where ta.id_animal=:ID and cr.id_raza=ta.raza')
    Left = 444
    Top = 482
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object IBQVentanaGestacion: TIBQuery [39]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 valor from rel_parametros_establecimiento where p' +
        'arametro = 30 and  establecimiento = :esta')
    Left = 188
    Top = 482
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  inherited IBQRepetidos: TIBQuery
    Left = 708
    Top = 534
  end
  object IBQAuxAnimal: TIBQuery [57]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'insert into aux_animales (id_aux,id_animal) values (1,:id)')
    Left = 524
    Top = 470
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQDiasGestEmbrion: TIBQuery [58]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select first 1 te.dias_gestacion as dias from rel_grupos_evento ' +
        'rge'
      'join eve_eventos ee on  rge.evento = ee.id_evento'
      'join eve_transferencia et on ee.id_evento = et.id_evento'
      'join tab_embriones te on et.embrion = te.id_embrion'
      'where rge.grupo = :grupo and ee.animal = :id ')
    Left = 636
    Top = 470
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQDiasGestInd: TIBQuery [59]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 te.dias_gestacion from tab_embriones te join eve_' +
        'transferencia tr on tr.embrion = te.id_embrion where tr.id_event' +
        'o = :eve')
    Left = 588
    Top = 470
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'eve'
        ParamType = ptUnknown
      end>
  end
  object DSDistCACUCOIA: TDataSource [60]
    DataSet = IBQDistCACUCOIA
    Left = 180
    Top = 288
  end
  object IBQDistCACUCOIA: TIBQuery [61]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQDistCACUCOIAAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 * from get_dist_cacucoia(:animal,:fecha,:establec' +
        'imiento)')
    Left = 212
    Top = 288
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
      end
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
    object IBQDistCACUCOIAID_DIST_CACUCO: TIntegerField
      FieldName = 'ID_DIST_CACUCO'
      Origin = 'GET_DIST_CACUCOIA.ID_DIST_CACUCO'
    end
    object IBQDistCACUCOIANOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'GET_DIST_CACUCOIA.NOMBRE'
      Size = 50
    end
    object IBQDistCACUCOIAFECHA_SERV: TDateField
      FieldName = 'FECHA_SERV'
      Origin = 'GET_DIST_CACUCOIA.FECHA_SERV'
    end
  end
  object IBQServiciosAdicionales: TIBQuery [62]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select distinct(nombre) from get_datos_diag_serv_adicionales(:fe' +
        'cha_1,:fecha_2,:establecimiento) order by nombre')
    Left = 324
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
  end
  object IBQCondCorp: TIBQuery [63]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 id_condicion_corporal, valor_escala_10 as escala ' +
        'from cod_condiciones_corporales')
    Left = 852
    Top = 332
  end
  object IBQParametroCC: TIBQuery [64]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select FIRST 1 valor from rel_parametros_establecimiento where p' +
        'arametro = 3 and establecimiento = :esta')
    Left = 852
    Top = 364
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object DSCondCorp: TDataSource [65]
    DataSet = IBQCondCorp
    Left = 886
    Top = 334
  end
  object ODExcel: TOpenDialog [66]
    Left = 152
    Top = 513
  end
end
