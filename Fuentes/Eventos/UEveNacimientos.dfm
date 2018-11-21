inherited FEveNacimientos: TFEveNacimientos
  Left = 170
  Top = 82
  Caption = 'FEveNacimientos'
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
        TabVisible = False
        inherited MSimple: TMangazo
          inherited GBFiltro: TGroupBox
            Width = 1002
          end
          inherited PSeleccion: TPanel
            Width = 1002
            inherited GBSeleccionados: TGroupBox
              Left = 588
              Width = 414
              inherited IFondoSel: TImage
                Width = 410
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 410
              end
            end
            inherited PTransferencia: TPanel
              Width = 139
              inherited IFondo: TImage
                Width = 139
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
            Width = 1002
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 1002
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 1002
            inherited Label1: TLabel
              Height = 16
            end
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            FAWidth = 145
            FAHeight = 170
            FCWidth = 22
            FCHeight = 22
          end
        end
      end
      object TSPartos: TTabSheet [1]
        Caption = 'Partos Masivos'
        ImageIndex = 3
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 1002
          Height = 304
          Align = alClient
          Caption = 'Partos'
          TabOrder = 0
          object BDBGPartos: TBitDBGrid
            Left = 2
            Top = 17
            Width = 998
            Height = 285
            Align = alClient
            DataSource = DSPartos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = BDBGPartosCellClick
            AllowIncSearch = False
            ColumnVersion = 0
            DefaultColumns = True
            DrawingEllipse = True
            DrawReadOnly = False
            EnterKey = ekNone
            FillFields = False
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            FooterType = foNone
            InternalDrag = False
            LongCaption = True
            MultiCaption = True
            RealTitleFont.Charset = DEFAULT_CHARSET
            RealTitleFont.Color = clWindowText
            RealTitleFont.Height = -8
            RealTitleFont.Name = 'MS Sans Serif'
            RealTitleFont.Style = []
            RunTimePropEditor = True
            ShowCellHint = True
            TitleBtn = tbNone
            Columns = <
              item
                Expanded = False
                FieldName = 'NOMBRE'
                Title.Caption = 'Grupo de Parto Masivo'
                Width = 632
                Visible = True
              end>
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Height = 354
          Caption = ''
          object LPeso: TLabel
            Left = -90
            Top = 168
            Width = 35
            Height = 15
            Caption = 'Peso: '
            Layout = tlCenter
          end
          object LSexo: TLabel
            Left = -87
            Top = 125
            Width = 30
            Height = 15
            Caption = 'Sexo:'
            Layout = tlCenter
          end
          object CheckBox2: TCheckBox
            Left = -112
            Top = 164
            Width = 104
            Height = 18
            Alignment = taLeftJustify
            Caption = 'Identificar'
            TabOrder = 0
          end
          object GroupBox2: TGroupBox
            Left = 2
            Top = 269
            Width = 998
            Height = 189
            Align = alTop
            Caption = 'Ubicaci'#243'n'
            TabOrder = 1
            object Label8: TLabel
              Left = 34
              Top = 38
              Width = 43
              Height = 15
              Cursor = crHandPoint
              Caption = 'Potrero:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = Label8Click
              OnMouseEnter = Label8MouseEnter
              OnMouseLeave = Label8MouseLeave
            end
            object Label9: TLabel
              Left = 440
              Top = 39
              Width = 40
              Height = 15
              Cursor = crHandPoint
              Caption = 'Rodeo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = Label9Click
              OnMouseEnter = Label9MouseEnter
              OnMouseLeave = Label9MouseLeave
            end
            object DBLCBAPotreros: TDBLookupComboBoxAuto
              Left = 108
              Top = 34
              Width = 294
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_POTRERO'
              ListField = 'NOMBRE'
              ListSource = DataSourceSelPotreroEvento
              TabOrder = 0
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBARodeos: TDBLookupComboBoxAuto
              Left = 513
              Top = 34
              Width = 294
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_RODEO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSRodeo
              TabOrder = 1
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
          end
          object GroupBox3: TGroupBox
            Left = 2
            Top = 17
            Width = 998
            Height = 252
            Align = alTop
            Caption = 'Datos'
            TabOrder = 2
            object Label10: TLabel
              Left = 26
              Top = 38
              Width = 130
              Height = 15
              Caption = 'Fecha de Nacimientos: '
            end
            object Label6: TLabel
              Left = 26
              Top = 71
              Width = 30
              Height = 15
              Caption = 'Sexo:'
              Layout = tlCenter
            end
            object LVivo: TLabel
              Left = 26
              Top = 103
              Width = 28
              Height = 15
              Caption = 'Vivo: '
              Layout = tlCenter
            end
            object Label7: TLabel
              Left = 26
              Top = 138
              Width = 35
              Height = 15
              Caption = 'Peso: '
              Layout = tlCenter
            end
            object Label1: TLabel
              Left = 26
              Top = 172
              Width = 34
              Height = 15
              Caption = 'Raza: '
            end
            object Label11: TLabel
              Left = 26
              Top = 206
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
              OnClick = Label11Click
              OnMouseEnter = Label11MouseEnter
              OnMouseLeave = Label11MouseLeave
            end
            object LMadre: TLabel
              Left = 583
              Top = 215
              Width = 40
              Height = 15
              Caption = 'Madre: '
              Visible = False
            end
            object Madre: TLabel
              Left = 635
              Top = 215
              Width = 5
              Height = 13
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object LColor: TLabel
              Left = 370
              Top = 170
              Width = 36
              Height = 15
              Caption = 'Color: '
              Visible = False
            end
            object DTPAFecha: TDateTimePickerAuto
              Left = 159
              Top = 33
              Width = 201
              Height = 21
              Date = 39343.504478981480000000
              Time = 39343.504478981480000000
              Color = 14679807
              TabOrder = 0
              OnChange = DTPAFechaChange
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBASexo: TDBLookupComboBoxAuto
              Left = 159
              Top = 66
              Width = 201
              Height = 23
              Color = 14679807
              DataField = 'ID_SEXO'
              DropDownRows = 20
              KeyField = 'ID_TIPO_SEXO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSTipoSexo
              TabOrder = 1
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
            object DBLCBAVivoSN: TDBLookupComboBoxAuto
              Left = 159
              Top = 98
              Width = 201
              Height = 23
              Color = 14679807
              DataField = 'ID_VIVO'
              DropDownRows = 20
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DMSoftvet.DSCodigosGenericos
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
            object EAPESO: TEditAuto
              Left = 159
              Top = 131
              Width = 201
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 4
              TabOrder = 3
              OnExit = EAPESOExit
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBARaza: TDBLookupComboBoxAuto
              Left = 159
              Top = 165
              Width = 201
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_RAZA'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSRaza
              TabOrder = 4
              OnCloseUp = DBLCBARazaCloseUp
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBAResponsable: TDBLookupComboBoxAuto
              Left = 159
              Top = 200
              Width = 201
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
              ISParam = False
            end
            object CBIdentificacion: TCheckBox
              Left = 583
              Top = 38
              Width = 104
              Height = 18
              Alignment = taLeftJustify
              Caption = 'Identificar'
              TabOrder = 6
              OnClick = CBIdentificacionClick
            end
            object GBIdentificacion: TGroupBox
              Left = 581
              Top = 69
              Width = 388
              Height = 130
              Align = alCustom
              Caption = ' Identificaci'#243'n '
              Enabled = False
              TabOrder = 7
              object LRpInicial: TLabel
                Left = 144
                Top = 17
                Width = 36
                Height = 23
                AutoSize = False
                Caption = 'Inicial:'
                Layout = tlCenter
              end
              object LCUIGPropio: TLabel
                Left = 280
                Top = 60
                Width = 79
                Height = 23
                Cursor = crHandPoint
                AutoSize = False
                Caption = 'CUIG Propio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsUnderline]
                ParentFont = False
                Layout = tlCenter
                OnClick = LCUIGPropioClick
                OnMouseEnter = LCUIGPropioMouseEnter
                OnMouseLeave = LCUIGPropioMouseLeave
              end
              object RBRp: TRadioButton
                Left = 94
                Top = 20
                Width = 43
                Height = 19
                Caption = 'RP'
                Checked = True
                TabOrder = 0
                TabStop = True
                OnClick = RBRpClick
              end
              object RBSenasa: TRadioButton
                Left = 15
                Top = 20
                Width = 61
                Height = 19
                Caption = 'Senasa'
                TabOrder = 1
                OnClick = RBSenasaClick
              end
              object EAPrefijo: TEditAuto
                Left = 199
                Top = 17
                Width = 24
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                MaxLength = 2
                TabOrder = 2
                OnExit = GetEventIdent
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
              object EARpInicial: TEditAuto
                Left = 227
                Top = 17
                Width = 48
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                MaxLength = 6
                TabOrder = 3
                OnChange = EARpInicialChange
                OnExit = GetEventIdent
                OnKeyPress = EARpInicialKeyPress
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
              object EASufijo: TEditAuto
                Left = 280
                Top = 17
                Width = 24
                Height = 23
                CharCase = ecUpperCase
                Color = clWhite
                MaxLength = 2
                TabOrder = 4
                OnExit = GetEventIdent
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
              object RBCUIGSenasa: TRadioButton
                Left = 15
                Top = 72
                Width = 98
                Height = 18
                Caption = 'CUIG-Senasa'
                TabOrder = 5
                OnClick = RBCUIGSenasaClick
              end
              object EAEncabezado: TMaskEdit
                Left = 118
                Top = 71
                Width = 46
                Height = 23
                Color = 14679807
                EditMask = '>ll999;0;_'
                MaxLength = 5
                TabOrder = 6
                Visible = False
                OnChange = EAEncabezadoChange
                OnExit = GetEvent
              end
              object EAUltimoIdent: TMaskEdit
                Left = 169
                Top = 70
                Width = 59
                Height = 23
                Color = 14679807
                EditMask = '>l999;0;_'
                MaxLength = 4
                TabOrder = 7
                Visible = False
                OnChange = EAUltimoIdentChange
                OnExit = GetEvent
              end
              object CBCUIGPropio: TCheckBox
                Left = 258
                Top = 64
                Width = 16
                Height = 18
                Caption = 'CUIG Propio'
                TabOrder = 8
                Visible = False
                OnClick = CBCUIGPropioClick
              end
              object DBLCBACUIGPropio: TDBLookupComboBoxAuto
                Left = 258
                Top = 86
                Width = 105
                Height = 23
                Color = clWhite
                DropDownRows = 20
                KeyField = 'ID_CUIG'
                ListField = 'ENCABEZADO'
                ListFieldIndex = 1
                ListSource = DMSoftvet.DSCUIGActual
                TabOrder = 9
                Visible = False
                OnCloseUp = DBLCBACUIGPropioCloseUp
                EsClave = False
                EsRequerido = False
                ISParam = False
              end
            end
            object DBLCBAColor: TDBLookupComboBoxAuto
              Left = 423
              Top = 165
              Width = 138
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_COLOR'
              ListField = 'NOMBRE'
              ListSource = DSColor
              TabOrder = 8
              Visible = False
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 354
          Height = 46
          inherited MAObservacion: TMemoAuto
            Height = 27
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Caption = 'RP'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              ReadOnly = True
              Title.Caption = 'Nombre'
              Width = 127
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V10'
              Title.Caption = 'Madre'
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_SENASA'
              Title.Caption = 'SENASA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V6'
              Title.Caption = 'PC'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V7'
              Title.Caption = 'HBA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V8'
              Title.Caption = 'RA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V9'
              Title.Caption = 'Otro'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_IE'
              Title.Caption = 'IE'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Caption = 'Fecha Nacimiento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V2'
              Title.Caption = 'Sexo'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V3'
              Title.Caption = 'Vivo'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'I1'
              Title.Caption = 'Peso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V11'
              Title.Caption = 'Raza'
              Width = 134
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V12'
              Title.Caption = 'Color'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V4'
              Title.Caption = 'Potrero'
              Width = 116
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V5'
              Title.Caption = 'Rodeo'
              Width = 116
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V1'
              Title.Caption = 'Responsable'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 136
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 559
      end
      inherited BBCancelar: TBitBtn
        Left = 597
      end
      inherited BBAnterior: TBitBtn
        Left = 695
      end
      inherited BBSiguiente: TBitBtn
        Left = 793
        Enabled = False
      end
      inherited BBTerminar: TBitBtn
        Left = 891
        Enabled = False
      end
      inherited BBXlsImport: TBitBtn
        Left = 98
        Visible = False
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Nacimientos'
    inherited LTitulo: TLabel
      Caption = 'Nacimientos'
    end
  end
  inherited ALUniversal: TActionList
    Left = 355
    Top = 30
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 324
    Top = 31
  end
  inherited DSSimple: TDataSource
    Left = 200
    Top = 13
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from aux_eventos'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into aux_eventos'
      
        '  (ID_ANIMAL, NOMBRE, ID_RP, ID_SENASA, FECHA, RESPONSABLE, V1, ' +
        'I2, V2, '
      
        '   VUNO3, V3, I4, V4, I5, V5, V6, V7, V8, V9, I9, V10, I1, I3, V' +
        '11, OBSERVACION, '
      '   EW)'
      'values'
      
        '  (:ID_ANIMAL, :NOMBRE, :ID_RP, :ID_SENASA, :FECHA, :RESPONSABLE' +
        ', :V1, '
      
        '   :I2, :V2, :VUNO3, :V3, :I4, :V4, :I5, :V5, :V6, :V7, :V8, :V9' +
        ', :I9, '
      '   :V10, :I1, :I3, :V11, :OBSERVACION, :EW)')
    RefreshSQL.Strings = (
      'Select '
      'id_animal,'
      'nombre,'
      'id_rp,'
      'id_senasa,'
      'fecha,'
      'responsable,'
      'v1,'
      'i2,'
      'v2,'
      'vuno3,'
      'v3,'
      'i4,'
      'v4,'
      'i5,'
      'v5,'
      'v6,'
      'v7,'
      'v8,'
      'v9,'
      'i9,'
      'v10,'
      'i1,'
      'i3,'
      'v11,'
      'observacion,'
      'ew '
      'from aux_eventos '
      'where'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      'select '
      'id_animal,'
      'nombre,'
      'id_rp,'
      'id_senasa,'
      'fecha,'
      'responsable,'
      'v1,'
      'i2,'
      'v2,'
      'vuno3,'
      'v3,'
      'i4,'
      'v4,'
      'i5,'
      'v5,'
      'v6,'
      'v7,'
      'v8,'
      'v9,'
      'i9,'
      'v10,'
      'i1,'
      'i3,'
      'v11,'
      'i6,'
      'v12,'
      'observacion,'
      'ew,'
      'id_ie'
      'from aux_eventos')
    ModifySQL.Strings = (
      'update aux_eventos'
      'set'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  NOMBRE = :NOMBRE,'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  FECHA = :FECHA,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  V1 = :V1,'
      '  I2 = :I2,'
      '  V2 = :V2,'
      '  VUNO3 = :VUNO3,'
      '  V3 = :V3,'
      '  I4 = :I4,'
      '  V4 = :V4,'
      '  I5 = :I5,'
      '  V5 = :V5,'
      '  V6 = :V6,'
      '  V7 = :V7,'
      '  V8 = :V8,'
      '  V9 = :V9,'
      '  I9 = :I9,'
      '  V10 = :V10,'
      '  I1 = :I1,'
      '  I3 = :I3,'
      '  V11 = :V11,'
      '  OBSERVACION = :OBSERVACION,'
      '  EW = :EW'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 164
    Top = 13
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_EVENTOS.NOMBRE'
      Size = 50
    end
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
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
      OnSetText = SetText
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = SetTextExtendido
      Size = 100
    end
    object IBDSSimpleI2: TIntegerField
      FieldName = 'I2'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = SetTextExtendido
      Size = 100
    end
    object IBDSSimpleVUNO3: TIBStringField
      FieldName = 'VUNO3'
      Origin = 'AUX_EVENTOS.VUNO3'
      Size = 1
    end
    object IBDSSimpleV3: TIBStringField
      FieldName = 'V3'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = SetTextExtendido
      Size = 100
    end
    object IBDSSimpleI4: TIntegerField
      FieldName = 'I4'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleV4: TIBStringField
      FieldName = 'V4'
      Origin = 'AUX_EVENTOS.V4'
      OnSetText = SetTextExtendido
      Size = 100
    end
    object IBDSSimpleI5: TIntegerField
      FieldName = 'I5'
      Origin = 'AUX_EVENTOS.I5'
    end
    object IBDSSimpleV5: TIBStringField
      FieldName = 'V5'
      Origin = 'AUX_EVENTOS.V5'
      OnSetText = SetTextExtendido
      Size = 100
    end
    object IBDSSimpleV6: TIBStringField
      FieldName = 'V6'
      Origin = 'AUX_EVENTOS.V6'
      Size = 100
    end
    object IBDSSimpleV7: TIBStringField
      FieldName = 'V7'
      Origin = 'AUX_EVENTOS.V7'
      Size = 100
    end
    object IBDSSimpleV8: TIBStringField
      FieldName = 'V8'
      Origin = 'AUX_EVENTOS.V8'
      Size = 100
    end
    object IBDSSimpleV9: TIBStringField
      FieldName = 'V9'
      Origin = 'AUX_EVENTOS.V9'
      Size = 100
    end
    object IBDSSimpleI9: TIntegerField
      FieldName = 'I9'
      Origin = 'AUX_EVENTOS.I9'
    end
    object IBDSSimpleV10: TIBStringField
      FieldName = 'V10'
      Origin = 'AUX_EVENTOS.V10'
      OnSetText = SetTextExtendido
      Size = 100
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
      OnSetText = SetTextExtendido
    end
    object IBDSSimpleI3: TIntegerField
      FieldName = 'I3'
      Origin = 'AUX_EVENTOS.I3'
    end
    object IBDSSimpleV11: TIBStringField
      FieldName = 'V11'
      Origin = 'AUX_EVENTOS.V11'
      OnSetText = SetTextExtendido
      Size = 100
    end
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      OnSetText = SetText
      Size = 255
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleID_IE: TIBStringField
      FieldName = 'ID_IE'
      Origin = 'AUX_EVENTOS.ID_IE'
      Size = 15
    end
    object IBDSSimpleI6: TIntegerField
      FieldName = 'I6'
      Origin = 'AUX_EVENTOS.I6'
    end
    object IBDSSimpleV12: TIBStringField
      FieldName = 'V12'
      Origin = 'AUX_EVENTOS.V12'
      OnSetText = SetTextExtendido
      Size = 100
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 520
  end
  inherited IBQValidaciones: TIBQuery
    Left = 628
    Top = 30
  end
  inherited IBQEvento: TIBQuery
    Left = 700
    Top = 30
  end
  inherited SDXLS: TSaveDialog
    Left = 590
    Top = 29
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'ID_RP'
        Title = 'RP'
      end
      item
        DataField = 'NOMBRE'
        Title = 'Nombre'
      end
      item
        DataField = 'V10'
        Title = 'Madre'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha Nacimiento'
      end
      item
        DataField = 'V2'
        Title = 'Sexo'
      end
      item
        DataField = 'V3'
        Title = 'Vivo'
      end
      item
        DataField = 'I1'
        Title = 'Peso'
      end
      item
        DataField = 'V11'
        Title = 'Raza'
      end
      item
        DataField = 'V4'
        Title = 'Potrero'
      end
      item
        DataField = 'V5'
        Title = 'Rodeo'
      end
      item
        DataField = 'V1'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observacion'
      end
      item
        DataField = 'ID_IE'
        Title = 'IE'
      end>
    Title.Text = 'Evento Nacimientos'
    Left = 280
    Top = 33
  end
  inherited WinXP1: TWinXP
    Left = 768
    Top = 24
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 668
    Top = 31
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 556
    Top = 31
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 412
    Top = 143
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from rn_nacimientos_masivos(:animal,:fecha,:establecimi' +
        'ento,:sexo,:rp,:senasa,:pc,:hba,:ra,:otro,:grupo_parto,:madre,:p' +
        'eso,:rodeo,:ie,:co)')
    Left = 392
    Top = 30
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
      end
      item
        DataType = ftUnknown
        Name = 'sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senasa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hba'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'otro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo_parto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'madre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rodeo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'co'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 424
    Top = 30
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'execute procedure SP_NACIMIENTO_MASIVO (:animal,:fecha,:observac' +
        'ion,:esta,:responsable,:log_usuario,:log_fecha_modif,:potrero,:r' +
        'odeo,:sexo,:madre,:peso,:raza,:vivo,:nombre,:rp,:sen,:pc,:hba,:r' +
        'a,:otro,:id_grupo,:grupo_parto,:id_ie,:color, :co)')
    Left = 456
    Top = 30
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
        Name = 'observacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'responsable'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'log_usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'log_fecha_modif'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'potrero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rodeo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'madre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'peso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'raza'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sen'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hba'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'otro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo_parto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_ie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'color'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'co'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 488
    Top = 30
  end
  inherited IBQImportacion: TIBQuery
    Left = 100
    Top = 198
  end
  object DSPartos: TDataSource
    DataSet = IBQPartos
    Left = 240
    Top = 440
  end
  object IBQPartos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select tg.id_grupo, tg.nombre from tab_grupos tg, tab_grupos_par' +
        'to tgp where tg.tipo_evento=39 and tg.visible=1 and tg.estableci' +
        'miento=:esta and '
      'tg.id_grupo=tgp.grupo and tgp.tiene_nacimiento='#39'N'#39)
    Left = 268
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQBuscarCUIG: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ultimo_identificador from tab_cuig where establecimiento=' +
        ':esta and id_cuig=:id')
    Left = 156
    Top = 441
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQActCUIG: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update tab_cuig set ultimo_identificador=:UI where ID_CUIG=:cuig')
    Left = 196
    Top = 441
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cuig'
        ParamType = ptUnknown
      end>
  end
  object IBQCantCuigs: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(*)  as cantidad from tab_cuig')
    Left = 116
    Top = 440
  end
  object DSMadres: TDataSource
    DataSet = IBQSelMadres
    Left = 380
    Top = 448
  end
  object IBQMadres: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'execute procedure get_posibles_madres(:grupo,:esta)')
    Left = 412
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQDatosParto: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select count (*) as cant from rel_grupos_evento where (grupo=:id' +
        '_grupo and establecimiento=:esta)')
    Left = 500
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQGenAnimales: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into aux_animales (id_aux,id_animal,id_rp) values (:id_au' +
        'x,:id_animal,:rp)')
    Left = 588
    Top = 449
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_aux'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end>
  end
  object IBQGenIDAnimal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_ID_TABANIMAL, 1)  AS IDANIMAL FROM RDB$DATABAS' +
        'E')
    Left = 724
    Top = 441
  end
  object IBQSelMadres: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_animal_externo, id_rp from aux_animales_externos')
    Left = 444
    Top = 449
  end
  object IBQGrupoParto: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'UPDATE TAB_GRUPOS_PARTO SET TIENE_NACIMIENTO='#39'S'#39' WHERE GRUPO=:GR' +
        'UPO AND ESTABLECIMIENTO=:ESTA')
    Left = 652
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTA'
        ParamType = ptUnknown
      end>
  end
  object IBQDistosicos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ta.id_rp from eve_eventos ee, eve_parto_masivo epm, tab_a' +
        'nimales ta, rel_grupos_evento rge where rge.grupo = :grupo and r' +
        'ge.evento = ee.id_evento and ee.id_evento = epm.id_evento and ep' +
        'm.tipo=2 and ee. animal=ta.id_animal and ta.establecimiento=:est' +
        'a')
    Left = 28
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
    object IBQDistosicosID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES.ID_RP'
      Required = True
      Size = 10
    end
  end
  object IBQRodeoMadre: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select tr.nombre from tab_rodeos tr, tab_animales ta where tr.es' +
        'tablecimiento=:esta and ta.id_animal=:animal and tr.id_rodeo=ta.' +
        'rodeo')
    Left = 500
    Top = 596
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
  end
  object IBQRodeos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select epm.rodeo, epm.fecha_parto, epm.potrero from eve_parto_ma' +
        'sivo epm join rel_grupos_evento rge on rge.evento=epm.id_evento'
      
        'where rge.establecimiento=:esta and rge.grupo=:grupo group by ro' +
        'deo, fecha_parto, potrero')
    Left = 468
    Top = 596
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
  end
  object IBQLimpiarAux: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from aux_animales')
    Left = 776
    Top = 264
  end
  object IBQFechaParto: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select fecha from aux_animales_externos where id_animal_externo ' +
        '= :madre')
    Left = 260
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'madre'
        ParamType = ptUnknown
      end>
  end
  object IBQColor: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_colores')
    Left = 454
    Top = 325
  end
  object DSColor: TDataSource
    DataSet = IBQColor
    Left = 486
    Top = 325
  end
  object DataSourceSelPotreroEvento: TDataSource
    DataSet = IBQuerySelPotreroEvento
    Left = 302
    Top = 364
  end
  object IBQuerySelPotreroEvento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TAB_POTREROS'
      
        'where establecimiento = :ESTABLECIMIENTO and visible = 1 and id_' +
        'potrero = :id_potreroaux')
    Left = 270
    Top = 364
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_potreroaux'
        ParamType = ptUnknown
      end>
  end
end
