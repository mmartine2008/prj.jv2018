inherited FEveEvaluacionPreservicio: TFEveEvaluacionPreservicio
  Left = 22
  Top = 45
  HelpContext = 18000
  Caption = 'Evaluaci'#243'n Preservicio.'
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
      TabOrder = 0
      inherited TSManga: TTabSheet
        inherited MSimple: TMangazo
          inherited PSeleccion: TPanel
            inherited GBDisponibles: TGroupBox
              Width = 441
              Height = 209
              inherited IFondoDis: TImage
                Width = 437
                Height = 190
              end
              inherited BDBGDisponibles: TBitDBGrid
                Width = 437
                Height = 190
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 180
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_NACIMIENTO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'GDR'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Width = 100
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Left = 549
              Width = 453
              Height = 209
              inherited IFondoSel: TImage
                Width = 449
                Height = 190
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 449
                Height = 190
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'FECHA_NACIMIENTO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'GDR'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Width = 161
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SINONIMO'
                    Visible = False
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Left = 441
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
          inherited IBQPotrero: TIBQuery
            Left = 360
          end
          inherited DSPotrero: TDataSource
            Left = 392
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select id_aux, id_Rp , id_senasa , id_Animal, a.id_pc, a.id_hba,' +
                ' a.id_otro, fecha_nacimiento , a.GDR, a.nombre, c.sinonimo as si' +
                'nonimo from AUX_ANIMALES  A  join cod_gdr C on C.id_gdr = A.gdr')
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
              '  ID_OTRO = :ID_OTRO'
              'where'
              '  ID_ANIMAL = :OLD_ID_ANIMAL')
            InsertSQL.Strings = (
              'insert into AUX_ANIMALES'
              '  (ID_AUX, ID_RP, ID_SENASA, ID_ANIMAL, ID_PC, ID_HBA, ID_OTRO)'
              'values'
              
                '  (:ID_AUX, :ID_RP, :ID_SENASA, :ID_ANIMAL, :ID_PC, :ID_HBA, :ID' +
                '_OTRO)')
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
          inherited IBQDisponiblesGrupos: TIBQuery
            SQL.Strings = (
              
                'select  id_Rp , id_senasa , id_Animal, fecha_nacimiento ,  GDR, ' +
                'SINONIMO,  sexo '
              ' from GEN_GRUPOS_MANGA( :ID_Grupo) '
              '')
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Height = 406
          object PAprueba: TPanel
            Left = 2
            Top = 17
            Width = 576
            Height = 387
            Align = alLeft
            BevelInner = bvLowered
            Color = clWhite
            TabOrder = 0
            object PDatosGrales: TPanel
              Left = 2
              Top = 2
              Width = 572
              Height = 44
              Align = alTop
              Color = clWhite
              TabOrder = 0
              object LFecha: TLabel
                Left = 11
                Top = 15
                Width = 37
                Height = 15
                Caption = 'Fecha:'
              end
              object LResponsable: TLabel
                Left = 197
                Top = 15
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
                OnClick = LResponsableClick
                OnMouseEnter = LResponsableMouseEnter
                OnMouseLeave = LResponsableMouseLeave
              end
              object DBLCBAResponsable: TDBLookupComboBoxAuto
                Left = 285
                Top = 10
                Width = 239
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
                ISParam = False
              end
              object DTPAFecha: TDateTimePickerAuto
                Left = 55
                Top = 10
                Width = 104
                Height = 21
                Date = 38763.406731041660000000
                Time = 38763.406731041660000000
                Color = 14679807
                TabOrder = 0
                OnCloseUp = DTPAFechaCloseUp
                OnChange = DTPAFechaChange
                OnExit = GetEvent
                EsClave = False
                EsRequerido = True
                ISParam = False
              end
            end
            object PPeso: TPanel
              Left = 2
              Top = 201
              Width = 572
              Height = 39
              Align = alTop
              Color = clWhite
              TabOrder = 4
              object LPeso: TLabel
                Left = 74
                Top = 13
                Width = 32
                Height = 15
                Caption = 'Peso:'
                Enabled = False
              end
              object LKilos: TLabel
                Left = 205
                Top = 13
                Width = 31
                Height = 15
                Caption = 'Kilos.'
                Enabled = False
              end
              object MEPeso: TEditAuto
                Left = 112
                Top = 9
                Width = 84
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                Enabled = False
                MaxLength = 5
                TabOrder = 0
                OnKeyPress = MEPesoKeyPress
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
              object CBPeso: TCheckBox
                Tag = 4
                Left = 30
                Top = 10
                Width = 23
                Height = 18
                TabOrder = 1
                OnClick = CBClick
              end
            end
            object PGDR: TPanel
              Left = 2
              Top = 108
              Width = 572
              Height = 44
              Align = alTop
              Color = clWhite
              TabOrder = 2
              object LGDR: TLabel
                Left = 75
                Top = 14
                Width = 30
                Height = 15
                Caption = 'GDR:'
                Enabled = False
              end
              object DBLCBGDR: TDBLookupComboBoxAuto
                Left = 111
                Top = 9
                Width = 182
                Height = 23
                Color = clWhite
                DropDownRows = 20
                Enabled = False
                KeyField = 'ID_GDR'
                ListField = 'NOMBRE'
                ListSource = DMSoftvet.DSGDR
                TabOrder = 0
                OnClick = DBLCBGDRClick
                OnDropDown = DBLCBGDRDropDown
                OnExit = DBLCBGDRExit
                OnKeyDown = DBLCBGDRKeyDown
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
              object CBGDR: TCheckBox
                Tag = 2
                Left = 30
                Top = 12
                Width = 23
                Height = 18
                TabOrder = 1
                OnClick = CBClick
              end
            end
            object Pbrucelosis: TPanel
              Left = 2
              Top = 240
              Width = 572
              Height = 44
              Align = alTop
              Color = clWhite
              TabOrder = 5
              object CBbrucelosis: TCheckBox
                Left = 30
                Top = 13
                Width = 161
                Height = 18
                Caption = 'Sangrado por Brucelosis.'
                TabOrder = 0
                OnExit = GetEvent
              end
            end
            object PAreaPelvica: TPanel
              Left = 2
              Top = 152
              Width = 572
              Height = 49
              Align = alTop
              Color = clWhite
              TabOrder = 3
              object LAreaPelvica: TLabel
                Left = 372
                Top = 23
                Width = 5
                Height = 13
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LAlto: TLabel
                Left = 74
                Top = 23
                Width = 23
                Height = 15
                Caption = 'Alto:'
                Enabled = False
              end
              object LAncho: TLabel
                Left = 202
                Top = 23
                Width = 37
                Height = 15
                Caption = 'Ancho:'
                Enabled = False
              end
              object Lcm1: TLabel
                Left = 170
                Top = 23
                Width = 23
                Height = 15
                Caption = 'Cm.'
                Enabled = False
              end
              object Lcm2: TLabel
                Left = 321
                Top = 23
                Width = 23
                Height = 15
                Caption = 'Cm.'
                Enabled = False
              end
              object LTituloPelv: TLabel
                Left = 75
                Top = 3
                Width = 319
                Height = 15
                Caption = 
                  '----------------------------- Pelvimetr'#237'a ----------------------' +
                  '------------'
                Enabled = False
              end
              object AreaPelvica: TEdit
                Left = 500
                Top = 17
                Width = 44
                Height = 23
                TabOrder = 2
                Visible = False
              end
              object MEAlto: TEditAuto
                Left = 106
                Top = 19
                Width = 58
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                Enabled = False
                MaxLength = 5
                TabOrder = 0
                OnChange = MEAltoChange
                OnKeyPress = MEPesoKeyPress
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
              object MEAncho: TEditAuto
                Left = 248
                Top = 19
                Width = 66
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                Enabled = False
                MaxLength = 5
                TabOrder = 1
                OnChange = MEAnchoChange
                OnKeyPress = MEPesoKeyPress
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
              object CBPelvimetria: TCheckBox
                Tag = 3
                Left = 30
                Top = 15
                Width = 23
                Height = 18
                TabOrder = 3
                OnClick = CBClick
              end
            end
            object PFrame: TPanel
              Left = 2
              Top = 46
              Width = 572
              Height = 62
              Align = alTop
              Color = clWhite
              TabOrder = 1
              object LAltura: TLabel
                Left = 75
                Top = 12
                Width = 77
                Height = 15
                Caption = 'Altura al anca:'
                Enabled = False
              end
              object LUnidadMedida: TLabel
                Left = 195
                Top = 12
                Width = 23
                Height = 15
                Caption = 'Cm.'
                Enabled = False
              end
              object LEdad: TLabel
                Left = 257
                Top = 12
                Width = 88
                Height = 15
                Caption = 'Edad:  0 Meses.'
                Enabled = False
              end
              object LPulgadas: TLabel
                Left = 138
                Top = 37
                Width = 56
                Height = 13
                Caption = '0 Pulgadas.'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LDias: TLabel
                Left = 296
                Top = 38
                Width = 33
                Height = 13
                Caption = '0 Dias.'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LFrame: TLabel
                Left = 386
                Top = 13
                Width = 5
                Height = 13
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Frame: TEdit
                Left = 500
                Top = 34
                Width = 44
                Height = 23
                TabOrder = 1
                Visible = False
              end
              object MEAltura: TEditAuto
                Left = 154
                Top = 8
                Width = 39
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                Enabled = False
                MaxLength = 5
                TabOrder = 0
                OnChange = MEAlturaChange
                OnExit = MEAlturaExit
                OnKeyPress = MEPesoKeyPress
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
              object CBFrame: TCheckBox
                Tag = 1
                Left = 30
                Top = 20
                Width = 23
                Height = 19
                TabOrder = 2
                OnClick = CBClick
              end
            end
            object Panel1: TPanel
              Left = 2
              Top = 284
              Width = 572
              Height = 53
              Align = alTop
              Color = clWhite
              TabOrder = 6
              object LRechazo: TLabel
                Left = 74
                Top = 18
                Width = 46
                Height = 13
                Cursor = crHandPoint
                Caption = 'Rechazo:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = LRechazoClick
                OnMouseEnter = LRechazoMouseEnter
                OnMouseLeave = LRechazoMouseLeave
              end
              object DBLCBARechazo: TDBLookupComboBoxAuto
                Left = 140
                Top = 13
                Width = 173
                Height = 23
                Color = clWhite
                DropDownRows = 20
                Enabled = False
                KeyField = 'ID_RECHAZO'
                ListField = 'NOMBRE'
                ListSource = DMSoftvet.DSRechazo
                TabOrder = 0
                OnClick = DBLCBGDRClick
                OnDropDown = DBLCBGDRDropDown
                OnExit = DBLCBGDRExit
                OnKeyDown = DBLCBGDRKeyDown
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
              object CBRechazo: TCheckBox
                Tag = 5
                Left = 30
                Top = 15
                Width = 23
                Height = 18
                TabOrder = 1
                OnClick = CBClick
              end
            end
            object PPrenezRobo: TPanel
              Left = 2
              Top = 337
              Width = 572
              Height = 48
              Align = alClient
              Color = clWhite
              TabOrder = 7
              object CBPrenez: TCheckBox
                Left = 30
                Top = 15
                Width = 165
                Height = 18
                Caption = 'Pre'#241'ez por Robo.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = CBPrenezClick
                OnExit = GetEvent
              end
            end
          end
          object PResultado: TPanel
            Left = 578
            Top = 17
            Width = 422
            Height = 387
            Align = alClient
            BevelInner = bvLowered
            Color = clWhite
            TabOrder = 1
            object LResultado: TLabel
              Left = 62
              Top = 126
              Width = 5
              Height = 13
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MCausaRechazo: TMemo
              Left = 60
              Top = 154
              Width = 182
              Height = 70
              BevelInner = bvLowered
              BevelKind = bkFlat
              BevelOuter = bvNone
              BorderStyle = bsNone
              Color = clWhite
              TabOrder = 0
              OnKeyPress = MCausaRechazoKeyPress
            end
            object CBAprobarManual: TCheckBox
              Left = 85
              Top = 255
              Width = 105
              Height = 19
              Caption = 'Aprobar Manual.'
              TabOrder = 1
            end
            object CBDesaprobarManual: TCheckBox
              Left = 84
              Top = 256
              Width = 150
              Height = 19
              Caption = 'Desaprobar Manual'
              TabOrder = 2
              OnExit = GetEvent
            end
            object MCausaAprobado: TMemo
              Left = 60
              Top = 155
              Width = 182
              Height = 70
              BevelInner = bvLowered
              BevelKind = bkFlat
              BevelOuter = bvNone
              BorderStyle = bsNone
              Color = clWhite
              TabOrder = 3
              OnKeyPress = MCausaAprobadoKeyPress
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 406
          Height = 0
          inherited MAObservacion: TMemoAuto
            Height = 10
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          TitleFont.Height = -16
          OnKeyPress = BDBGSimpleKeyPress
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Fecha'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Rp'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 63
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'D1'
              Title.Caption = 'Fecha Nac.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'V6'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Evaluaci'#243'n'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 138
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'V1'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Criterios'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 158
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'F6'
              Title.Alignment = taCenter
              Title.Caption = 'Altura (Cm.)'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'F4'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Frame'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'V2'
              Title.Alignment = taCenter
              Title.Caption = 'GDR'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 158
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'F1'
              Title.Alignment = taCenter
              Title.Caption = 'Alto (Cm.)'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'F2'
              Title.Alignment = taCenter
              Title.Caption = 'Ancho (Cm.)'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 85
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'F5'
              Title.Alignment = taCenter
              Title.Caption = 'Area P'#233'lvica (Cm2)'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 130
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'F3'
              Title.Alignment = taCenter
              Title.Caption = 'Peso (Kgs.)'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VUNO5'
              Title.Alignment = taCenter
              Title.Caption = 'Sangrado Brucelosis'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'V3'
              Title.Alignment = taCenter
              Title.Caption = 'Rechazo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VUNO1'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#241'ez por Robo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 140
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VUNO4'
              Title.Alignment = taCenter
              Title.Caption = 'Eval. Manual'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 90
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 123
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 233
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      TabOrder = 1
      inherited SBSelTodos: TSpeedButton
        Left = 568
      end
      inherited BBCancelar: TBitBtn
        Left = 612
      end
      inherited BBAnterior: TBitBtn
        Left = 707
      end
      inherited BBSiguiente: TBitBtn
        Left = 802
      end
      inherited BBTerminar: TBitBtn
        Left = 897
      end
      inherited BIngresoSecuenciado: TBitBtn
        Left = 234
      end
      inherited BSacarAnimal: TBitBtn
        Left = 142
      end
      inherited BBXls: TBitBtn
        Left = 51
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Evaluaci'#243'n de Preservicio'
  end
  inherited ALUniversal: TActionList
    Left = 787
    Top = 30
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 212
    Top = 65535
  end
  inherited DSSimple: TDataSource
    Left = 256
    Top = 24
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      '')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (FECHA, D1, ID_RP, ID_SENASA, ID_ANIMAL, RESPONSABLE, EW, I1, ' +
        'I2, I3, '
      
        '   F1, F2, F3, VUNO1, F4, F5, VUNO2, VUNO3, V1, VUNO4, V2, V3, V' +
        'UNO5, '
      'V6,V7,F6)'
      'values'
      
        '  (:FECHA, :D1, :ID_RP, :ID_SENASA, :ID_ANIMAL, :RESPONSABLE, :E' +
        'W, :I1, '
      
        '   :I2, :I3, :F1, :F2, :F3, :VUNO1, :F4, :F5, :VUNO2, :VUNO3, :V' +
        '1, :VUNO4, '
      '   :V2, :V3, :VUNO5, :V6,:V7,:F6)')
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
      '  F6'
      'from AUX_EVENTOS '
      'where'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      
        'select FECHA, D1 , ID_RP, ID_SENASA, ID_ANIMAL,responsable,EW,I1' +
        ',I2,I3,F1,F2,F3,VUNO1, F4,F5,VUNO2,VUNO3,V1,Vuno4,V2,V3, Vuno5, ' +
        'V6, OBSERVACION, V7 as RESP, F6'
      ' from AUX_EVENTOS'
      '')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  FECHA = :FECHA,'
      '  D1 = :D1,'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  EW = :EW,'
      '  I1 = :I1,'
      '  I2 = :I2,'
      '  I3 = :I3,'
      '  F1 = :F1,'
      '  F2 = :F2,'
      '  F3 = :F3,'
      '  VUNO1 = :VUNO1,'
      '  F4 = :F4,'
      '  F5 = :F5,'
      '  VUNO2 = :VUNO2,'
      '  VUNO3 = :VUNO3,'
      '  V1 = :V1,'
      '  VUNO4 = :VUNO4,'
      '  V2 = :V2,'
      '  V3 = :V3,'
      '  VUNO5 = :VUNO5,'
      '  V6 = :V6,'
      '  V7 = :V7,'
      '  F6 = :F6'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 28
    Top = 65534
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
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
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
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
    object IBDSSimpleF6: TFloatField
      FieldName = 'F6'
      Origin = 'AUX_EVENTOS.F6'
      OnChange = Change
      OnSetText = IBDSSimpleF6SetText
    end
    object IBDSSimpleI2: TIntegerField
      FieldName = 'I2'
      Origin = 'AUX_EVENTOS.I2'
      OnChange = Change
    end
    object IBDSSimpleI3: TIntegerField
      FieldName = 'I3'
      Origin = 'AUX_EVENTOS.I3'
      OnChange = Change
    end
    object IBDSSimpleF1: TFloatField
      FieldName = 'F1'
      Origin = 'AUX_EVENTOS.F1'
      OnChange = Change
      OnSetText = IBDSSimpleF1SetText
      MaxValue = 99.000000000000000000
    end
    object IBDSSimpleF2: TFloatField
      FieldName = 'F2'
      Origin = 'AUX_EVENTOS.F2'
      OnChange = Change
      OnSetText = IBDSSimpleF2SetText
      MaxValue = 99.000000000000000000
    end
    object IBDSSimpleF3: TFloatField
      FieldName = 'F3'
      Origin = 'AUX_EVENTOS.F3'
      OnChange = Change
      OnSetText = IBDSSimpleF3SetText
      MaxValue = 9999.000000000000000000
    end
    object IBDSSimpleVUNO1: TIBStringField
      FieldName = 'VUNO1'
      Origin = 'AUX_EVENTOS.VUNO1'
      OnChange = Change
      Size = 1
    end
    object IBDSSimpleF4: TFloatField
      FieldName = 'F4'
      Origin = 'AUX_EVENTOS.F4'
    end
    object IBDSSimpleF5: TFloatField
      FieldName = 'F5'
      Origin = 'AUX_EVENTOS.F5'
      Precision = 7
    end
    object IBDSSimpleVUNO2: TIBStringField
      FieldName = 'VUNO2'
      Origin = 'AUX_EVENTOS.VUNO2'
      ReadOnly = True
      Size = 1
    end
    object IBDSSimpleVUNO3: TIBStringField
      FieldName = 'VUNO3'
      Origin = 'AUX_EVENTOS.VUNO3'
      Size = 1
    end
    object IBDSSimpleV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_EVENTOS.V1'
      Size = 100
    end
    object IBDSSimpleVUNO4: TIBStringField
      FieldName = 'VUNO4'
      Origin = 'AUX_EVENTOS.VUNO4'
      OnChange = Change
      Size = 1
    end
    object IBDSSimpleV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_EVENTOS.V2'
      OnChange = Change
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleV3: TIBStringField
      FieldName = 'V3'
      Origin = 'AUX_EVENTOS.V3'
      OnChange = Change
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleVUNO5: TIBStringField
      FieldName = 'VUNO5'
      Origin = 'AUX_EVENTOS.VUNO5'
      OnChange = Change
      Size = 1
    end
    object IBDSSimpleV6: TIBStringField
      FieldName = 'V6'
      Origin = 'AUX_EVENTOS.V6'
      Size = 100
    end
    object IBDSSimpleD1: TDateField
      FieldName = 'D1'
      Origin = 'AUX_EVENTOS.D1'
      ReadOnly = True
    end
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      Visible = False
      Size = 255
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V7'
      OnSetText = SetText
      Size = 100
    end
  end
  object IBQCriteriosPreservicio: TIBQuery [12]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select SJP.ID_PARAMETRO, SJP.NOMBRE, RPE.VALOR from SYS_JUEGO_PA' +
        'RAMETROS SJP join REL_PARAMETROS_ESTABLECIMIENTO RPE ON (RPE.par' +
        'ametro = SJP.id_parametro)'
      'where (RPE.establecimiento = :Establecimiento and SJP.tipo = 7 )')
    Left = 700
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Establecimiento'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource [13]
    DataSet = IBQCriteriosPreservicio
    Left = 780
    Top = 78
  end
  object IBQRechazo: TIBQuery [14]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_rechazo, nombre,sinonimo,codigo from COD_RECHAZOS_PRES' +
        'ERVICIO')
    Left = 734
    Top = 66
  end
  object DSRechazo: TDataSource [15]
    DataSet = IBQRechazo
    Left = 734
    Top = 2
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Top = 65534
  end
  inherited IBQValidaciones: TIBQuery
    Left = 612
    Top = 30
  end
  inherited IBQEvento: TIBQuery
    Left = 180
    Top = 6
  end
  inherited SDXLS: TSaveDialog
    Left = 254
    Top = 65533
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
        DataField = 'D1'
        Title = 'Fecha Nac.'
      end
      item
        DataField = 'V6'
        Title = 'Evaluaci'#243'n'
      end
      item
        DataField = 'VUNO4'
        Title = 'Evaluaci'#243'n Manual'
      end
      item
        DataField = 'V1'
        Title = 'Criterios'
      end
      item
        DataField = 'F6'
        Title = 'Altura (cm.)'
      end
      item
        DataField = 'V2'
        Title = 'GDR'
      end
      item
        DataField = 'V3'
        Title = 'Rechazo'
      end
      item
        DataField = 'F1'
        Title = 'Alto (Cm.)'
      end
      item
        DataField = 'F2'
        Title = 'Ancho (Cm.)'
      end
      item
        DataField = 'F3'
        Title = 'Peso (Kgs.)'
      end
      item
        DataField = 'VUNO1'
        Title = 'Pre'#241'ez por Robo'
      end
      item
        DataField = 'F4'
        Title = 'Frame'
      end
      item
        DataField = 'F5'
        Title = 'Area P'#233'lvica (Cm2)'
      end
      item
        DataField = 'VUNO5'
        Title = 'Sangrado Brucelosis'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end>
    Title.Text = 'Evento Evaluaci'#243'n de Preservicio'
    Left = 288
    Top = 1
  end
  inherited WinXP1: TWinXP
    Left = 544
    Top = 0
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 612
    Top = 65535
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 516
    Top = 31
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Top = 65535
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 580
    Top = 32
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 580
    Top = 65535
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from RN_EVALUACION_PRESERVICIO (:ANIMAL, :FRAME, :ESTAB' +
        'LECIMIENTO, :fecha,:PESO)')
    Left = 728
    Top = 30
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
        Name = 'PESO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 752
    Top = 30
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'EXECUTE  PROCEDURE SP_EVE_PRESERVICIO(:FECHA,  :ANIMAL,  :OBSERV' +
        'ACION, :ESTABLECIMIENTO,'
      '  :RESPONSABLE,  :LOG_USUARIO, :LOG_FECHA_MODIFICADO,'
      '  :ANCHO, :ALTO, :ALTURA,  :ROBO, :PESO, :GDR, :RECHAZO,'
      
        '  :AP_MANUAL, :EVAL_CALCULADA, :EDAD, :FRAME, :ID_GRUPO, :MUESTR' +
        'EO,:CRITERIO)')
    Left = 648
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
        Name = 'ANCHO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALTURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ROBO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GDR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECHAZO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AP_MANUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EVAL_CALCULADA'
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
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MUESTREO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRITERIO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 680
    Top = 30
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 668
    Top = 65535
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 64
    Top = 0
  end
  inherited IBSPActEventos: TIBStoredProc
    Left = 812
    Top = 71
  end
  inherited OpenDlg: TOpenDialog
    Left = 100
    Top = 0
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 460
    Top = 16
  end
  inherited IBQImportacion: TIBQuery
    Left = 340
    Top = 182
  end
  object IBQFechaNac: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_ANIMAL, ID_RP, ID_SENASA, FECHA_NACIMIENTO, GDR from T' +
        'AB_ANIMALES where ID_animal = :IDANIMAL;')
    Left = 133
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDANIMAL'
        ParamType = ptUnknown
      end>
  end
end
