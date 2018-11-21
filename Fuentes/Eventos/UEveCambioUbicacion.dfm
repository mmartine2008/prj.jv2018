inherited FEveCambioUbicacion: TFEveCambioUbicacion
  Left = 170
  Top = 17
  Caption = 'Cambio de Ubicaci'#243'n'
  ClientHeight = 671
  ClientWidth = 1083
  Constraints.MinWidth = 702
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1083
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
  inherited Image4: TImage
    Width = 614
  end
  inherited PError: TPageControl
    Top = 558
    Width = 1083
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1075
      end
    end
  end
  inherited PDatos: TPanel
    Width = 1083
    Height = 471
    inherited PCBasico: TPageControl
      Width = 1083
      Height = 389
      ActivePage = TSManga
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 1075
          Height = 347
        end
        inherited MSimple: TMangazo
          Width = 1075
          Height = 347
          inherited GBFiltro: TGroupBox
            Width = 1075
          end
          inherited PSeleccion: TPanel
            Width = 1075
            Height = 41
            inherited GBDisponibles: TGroupBox
              Height = 41
              inherited IFondoDis: TImage
                Height = 22
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 22
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 104
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
                    Width = 206
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Width = 518
              Height = 41
              inherited IFondoSel: TImage
                Width = 514
                Height = 22
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 514
                Height = 22
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 169
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
                    Width = 224
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Height = 41
              inherited IFondo: TImage
                Height = 41
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
            Width = 1075
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 1075
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 1075
            inherited Image1: TImage
              Width = 1075
            end
            inherited Label1: TLabel
              Width = 1075
              Height = 21
            end
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            Top = 169
            Width = 990
            Height = 184
            FAWidth = 145
            FAHeight = 184
            FCWidth = 734
            FCHeight = 22
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select A.ID_AUX, A.ID_RP, A.ID_SENASA, A.ID_ANIMAL, a.id_pc, a.i' +
                'd_hba, a.id_otro, a.nombre  from AUX_ANIMALES A')
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
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Width = 1075
          Height = 247
          object GBPotRod: TGroupBox
            Left = 2
            Top = 97
            Width = 1071
            Height = 76
            Align = alTop
            TabOrder = 0
            object Label1: TLabel
              Left = 150
              Top = 31
              Width = 35
              Height = 13
              Cursor = crHandPoint
              Caption = 'Rodeo:'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = Label1Click
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object Label2: TLabel
              Left = 587
              Top = 29
              Width = 37
              Height = 13
              Cursor = crHandPoint
              Caption = 'Potrero:'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = Label2Click
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object DBLCBARodeo: TDBLookupComboBoxAuto
              Left = 207
              Top = 28
              Width = 199
              Height = 23
              Color = 14679807
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_RODEO'
              ListField = 'NOMBRE'
              ListSource = DSRodeo
              TabOrder = 1
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object CkBRodeo: TCheckBox
              Left = 11
              Top = 30
              Width = 130
              Height = 16
              Caption = 'Cambiar de Rodeo'
              TabOrder = 0
              OnClick = CkBRodeoClick
              OnExit = GetEvent
            end
            object CkBPotrero: TCheckBox
              Left = 454
              Top = 29
              Width = 129
              Height = 18
              Caption = 'Cambiar de Potrero'
              TabOrder = 2
              OnClick = CkBPotreroClick
              OnExit = GetEvent
            end
            object DBLCBAPotrero: TDBLookupComboBoxAuto
              Left = 642
              Top = 26
              Width = 199
              Height = 23
              Color = 14679807
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_POTRERO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSPotrerosSinServicio
              TabOrder = 3
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
          end
          object GroupBox3: TGroupBox
            Left = 2
            Top = 173
            Width = 1071
            Height = 72
            Align = alClient
            TabOrder = 1
            object CKBEstablecimiento: TCheckBox
              Left = 13
              Top = 30
              Width = 173
              Height = 18
              Caption = 'Cambiar de Establecimiento'
              TabOrder = 0
              OnClick = TF
              OnExit = GetEvent
            end
          end
          object GroupBox5: TGroupBox
            Left = 2
            Top = 17
            Width = 1071
            Height = 80
            Align = alTop
            TabOrder = 2
            object LObservador: TLabel
              Left = 229
              Top = 33
              Width = 80
              Height = 23
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
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LFecha: TLabel
              Left = 24
              Top = 33
              Width = 50
              Height = 23
              AutoSize = False
              Caption = 'Fecha:'
              Layout = tlCenter
            end
            object DBLCBAResponsable: TDBLookupComboBoxAuto
              Left = 310
              Top = 33
              Width = 191
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_EMPLEADO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSResponsable
              TabOrder = 0
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
            object DTPAFecha: TDateTimePickerAuto
              Left = 78
              Top = 33
              Width = 130
              Height = 21
              Date = 38657.411226122680000000
              Time = 38657.411226122680000000
              Color = 14679807
              TabOrder = 1
              OnChange = DTPAFechaChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 247
          Width = 1075
          Height = 100
          inherited MAObservacion: TMemoAuto
            Width = 1071
            Height = 81
          end
        end
      end
      object TSCambioEstablecimiento: TTabSheet [2]
        Caption = 'Cambio de Establecimiento'
        ImageIndex = 3
        TabVisible = False
        OnShow = TSCambioEstablecimientoShow
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 1075
          Height = 397
          Align = alTop
          Caption = 'Datos:'
          TabOrder = 0
          object GBBaja: TGroupBox
            Left = 2
            Top = 97
            Width = 318
            Height = 298
            Align = alLeft
            Caption = 'Datos Baja'
            TabOrder = 1
            object LDestino: TLabel
              Left = 23
              Top = 60
              Width = 39
              Height = 13
              Cursor = crHandPoint
              Alignment = taRightJustify
              Caption = 'Destino:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              Layout = tlCenter
              OnClick = LDestinoClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LDTA: TLabel
              Left = 28
              Top = 221
              Width = 29
              Height = 15
              Caption = 'DTA: '
            end
            object Label3: TLabel
              Left = 37
              Top = 28
              Width = 24
              Height = 13
              Cursor = crHandPoint
              Alignment = taRightJustify
              Caption = 'Tipo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = Label3Click
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LPeso: TLabel
              Left = 6
              Top = 131
              Width = 164
              Height = 15
              Caption = 'Peso (en el establecimiento): '
            end
            object LPesoDestino: TLabel
              Left = 77
              Top = 164
              Width = 81
              Height = 15
              Caption = 'Peso Destino: '
            end
            object LPrecio: TLabel
              Left = 23
              Top = 252
              Width = 41
              Height = 15
              Caption = 'Precio: '
            end
            object DBLCBADestino: TDBLookupComboBoxAuto
              Left = 74
              Top = 55
              Width = 237
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_DESTINO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSCodDestino
              TabOrder = 1
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
            object EADtaBaja: TEditAuto
              Left = 66
              Top = 218
              Width = 236
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 20
              TabOrder = 4
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBATipo: TDBLookupComboBoxAuto
              Left = 75
              Top = 24
              Width = 217
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_TIPO_BAJA'
              ListField = 'SINONIMO'
              ListSource = DSTiposBaja
              TabOrder = 0
              OnCloseUp = DBLCBATipoCloseUp
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object EAPeso: TEditAuto
              Left = 172
              Top = 124
              Width = 131
              Height = 23
              CharCase = ecUpperCase
              Color = 14679807
              MaxLength = 5
              TabOrder = 2
              Text = '0'
              OnExit = GetEvent
              OnKeyPress = EAPesoKeyPress
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
            object EAPesoDestino: TEditAuto
              Left = 172
              Top = 158
              Width = 131
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 5
              TabOrder = 3
              Text = '0'
              OnExit = GetEvent
              OnKeyPress = EAPesoKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object EAPrecio: TEditAuto
              Left = 66
              Top = 249
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 6
              TabOrder = 5
              Text = '0'
              OnChange = PrecioChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
          end
          object GBDatosAlta: TGroupBox
            Left = 320
            Top = 97
            Width = 753
            Height = 298
            Align = alClient
            Caption = 'Datos de Alta'
            TabOrder = 2
            object LActividad: TLabel
              Left = 55
              Top = 185
              Width = 51
              Height = 15
              Cursor = crHandPoint
              Alignment = taRightJustify
              Caption = 'Actividad:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LActividadClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LOrigen: TLabel
              Left = 353
              Top = 185
              Width = 62
              Height = 14
              Cursor = crHandPoint
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Origen:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              Layout = tlCenter
              OnClick = LOrigenClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LCriador: TLabel
              Left = 353
              Top = 222
              Width = 64
              Height = 16
              Cursor = crHandPoint
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Criador:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              Layout = tlCenter
              OnClick = LCriadorClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LPropietario: TLabel
              Left = 26
              Top = 222
              Width = 84
              Height = 15
              Cursor = crHandPoint
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Propietario:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              Layout = tlCenter
              Visible = False
              OnClick = LPropietarioClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object Label4: TLabel
              Left = 15
              Top = 33
              Width = 107
              Height = 23
              AutoSize = False
              Caption = 'Fecha de Ingreso:'
              Layout = tlCenter
            end
            object Label7: TLabel
              Left = 70
              Top = 255
              Width = 36
              Height = 23
              AutoSize = False
              Caption = 'DTA: '
              Layout = tlCenter
            end
            object Label6: TLabel
              Left = 69
              Top = 111
              Width = 40
              Height = 15
              Caption = 'Rodeo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 68
              Top = 138
              Width = 43
              Height = 15
              Caption = 'Potrero:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object LValor: TLabel
              Left = 379
              Top = 86
              Width = 42
              Height = 16
              AutoSize = False
              Caption = 'Gastos: '
              Layout = tlCenter
            end
            object PrecioKg: TLabel
              Left = 327
              Top = 56
              Width = 100
              Height = 23
              AutoSize = False
              Caption = 'Precio Kilogramo: '
              Layout = tlCenter
            end
            object LPrecioCabeza: TLabel
              Left = 320
              Top = 31
              Width = 107
              Height = 23
              AutoSize = False
              Caption = 'Precio por Cabeza:'
              Layout = tlCenter
            end
            object Label8: TLabel
              Left = 43
              Top = 59
              Width = 65
              Height = 23
              AutoSize = False
              Caption = 'Observador:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
            object DBLCBAActividad: TDBLookupComboBoxAuto
              Left = 121
              Top = 180
              Width = 188
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_ACTIVIDAD'
              ListField = 'SINONIMO'
              ListSource = DMSoftvet.DSActividad
              TabOrder = 3
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAOrigen: TDBLookupComboBoxAuto
              Left = 429
              Top = 180
              Width = 188
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_ORIGEN'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSCodOrigen
              TabOrder = 6
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBACriador: TDBLookupComboBoxAuto
              Left = 429
              Top = 219
              Width = 188
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_CRIADOR'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSCodCriador
              TabOrder = 7
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAPropietario: TDBLookupComboBoxAuto
              Left = 121
              Top = 219
              Width = 188
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_PROPIETARIO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSCodPropietario
              TabOrder = 4
              Visible = False
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DTPAFechaIngreso: TDateTimePickerAuto
              Left = 121
              Top = 33
              Width = 130
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
            object EADTAAlta: TEditAuto
              Left = 121
              Top = 256
              Width = 185
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 20
              TabOrder = 5
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBARodeoEsta: TDBLookupComboBoxAuto
              Left = 121
              Top = 104
              Width = 199
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_RODEO'
              ListField = 'NOMBRE'
              ListSource = DSRodeo
              TabOrder = 1
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBAPotreroEsta: TDBLookupComboBoxAuto
              Left = 121
              Top = 132
              Width = 199
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_POTRERO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSPotrerosSinServicio
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object EAValor: TEditAuto
              Tag = 64
              Left = 429
              Top = 83
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 10
              TabOrder = 10
              Text = '0'
              OnChange = PrecioChange
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioB: TEditAuto
              Tag = 62
              Left = 429
              Top = 58
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 6
              TabOrder = 9
              Text = '0'
              OnChange = PrecioChange
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object EAPrecioU: TEditAuto
              Tag = 63
              Left = 429
              Top = 32
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 10
              TabOrder = 8
              Text = '0'
              OnChange = PrecioChange
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object DBLCBAEmpleadoAlta: TDBLookupComboBoxAuto
              Left = 121
              Top = 59
              Width = 190
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_EMPLEADO'
              ListField = 'NOMBRE'
              ListSource = DSEmpleadoAlta
              TabOrder = 11
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
          end
          object GroupBox7: TGroupBox
            Left = 2
            Top = 17
            Width = 1071
            Height = 80
            Align = alTop
            Caption = 'Establecimiento'
            TabOrder = 0
            object LEstablecimiento: TLabel
              Left = 37
              Top = 33
              Width = 136
              Height = 15
              Caption = 'Establecimiento destino:'
            end
            object DBLCBAEstablecimiento: TDBLookupComboBoxAuto
              Left = 182
              Top = 29
              Width = 199
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_ESTABLECIMIENTO'
              ListField = 'NOMBRE'
              ListSource = DSEstablecimiento
              TabOrder = 0
              OnCloseUp = DBLCBAEstablecimientoCloseUp
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Width = 980
          Height = 347
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Caption = 'RP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POTRERO'
              Title.Caption = 'Nuevo Potrero'
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RODEO'
              Title.Caption = 'Nuevo Rodeo'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTA'
              ReadOnly = True
              Title.Caption = 'Nuevo Establecimiento'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHAINGRESO'
              Title.Caption = 'Fecha de Ingreso'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESTINO'
              Title.Caption = 'Destino'
              Width = 116
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVIDAD'
              Title.Caption = 'Actividad'
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CRIADOR'
              Title.Caption = 'Criador'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROPIETARIO'
              Title.Caption = 'Propietario'
              Width = 118
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORIGEN'
              Title.Caption = 'Origen'
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTA_ALTA'
              Title.Caption = 'DTA Alta'
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTA_BAJA'
              Title.Caption = 'DTA Baja'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable Baja'
              Width = 147
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPALTA'
              Title.Caption = 'Responsable Alta'
              Width = 132
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 230
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 347
        end
        inherited PanelDer: TPanel
          Left = 1027
          Height = 347
        end
      end
    end
    inherited PBotones: TPanel
      Top = 389
      Width = 1083
      inherited SBSelTodos: TSpeedButton
        Left = 664
      end
      inherited IFondoB2: TImage
        Width = 657
      end
      inherited BBCancelar: TBitBtn
        Left = 712
      end
      inherited BBAnterior: TBitBtn
        Left = 803
      end
      inherited BBSiguiente: TBitBtn
        Left = 895
      end
      inherited BBTerminar: TBitBtn
        Left = 987
      end
      inherited PL: TPanel
        Left = 657
      end
      inherited BIngresoSecuenciado: TBitBtn
        Left = 286
      end
      inherited BSacarAnimal: TBitBtn
        Left = 176
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1083
    Caption = 'Evento Cambio de Ubicaci'#243'n'
    inherited LTitulo: TLabel
      Width = 679
    end
    inherited PILeft: TPanel
      Left = 875
    end
  end
  inherited Psocalo: TPanel
    Top = 536
    Width = 1083
    inherited JvSocalo: TJvImage
      Width = 1083
    end
  end
  inherited ALUniversal: TActionList
    Left = 315
    Top = 6
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 132
    Top = 65535
  end
  inherited DSSimple: TDataSource
    Left = 88
    Top = 0
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_RP = :OLD_ID_RP and'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      '  (ID_RP, ID_ANIMAL)'
      'values'
      '  (:ID_RP, :ID_ANIMAL)')
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
      '  H2'
      'from AUX_EVENTOS '
      'where'
      '  ID_RP = :ID_RP and'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, D1 AS FECHA, R' +
        'ESPONSABLE, D1 as FechaIngreso,v1 as RESP, V3 Potrero, I2 as IdP' +
        'otrero, V4 Rodeo,  I3 as idRodeo, I4 as idEsta, V5 as Esta, I5 a' +
        's idActividad, V6 as Actividad,I6 as idCriador, V7 as Criador, I' +
        '7 as idOrigen, V8 as Origen, I8 as idPropietario, V9 as Propieta' +
        'rio, i9 as idDestino, V10 as Destino, V11 as DTA_Alta, DTA_Baja,' +
        ' EW, I1 as IDRESPALTA, V2 AS RESPALTA from AUX_EVENTOS '
      ''
      '')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_RP = :ID_RP,'
      '  ID_ANIMAL = :ID_ANIMAL'
      'where'
      '  ID_RP = :OLD_ID_RP and'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 28
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
      OnSetText = SetText
      Size = 255
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.D1'
      OnSetText = IBDSSimpleFECHASetText
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
    object IBDSSimplePOTRERO: TIBStringField
      FieldName = 'POTRERO'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = IBDSSimpleFECHASetText
      Size = 100
    end
    object IBDSSimpleIDPOTRERO: TIntegerField
      FieldName = 'IDPOTRERO'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleRODEO: TIBStringField
      FieldName = 'RODEO'
      Origin = 'AUX_EVENTOS.V4'
      OnSetText = IBDSSimpleFECHASetText
      Size = 100
    end
    object IBDSSimpleIDRODEO: TIntegerField
      FieldName = 'IDRODEO'
      Origin = 'AUX_EVENTOS.I3'
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleIDESTA: TIntegerField
      FieldName = 'IDESTA'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = 'AUX_EVENTOS.V5'
      Size = 100
    end
    object IBDSSimpleIDACTIVIDAD: TIntegerField
      FieldName = 'IDACTIVIDAD'
      Origin = 'AUX_EVENTOS.I5'
    end
    object IBDSSimpleACTIVIDAD: TIBStringField
      FieldName = 'ACTIVIDAD'
      Origin = 'AUX_EVENTOS.V6'
      Size = 100
    end
    object IBDSSimpleIDCRIADOR: TIntegerField
      FieldName = 'IDCRIADOR'
      Origin = 'AUX_EVENTOS.I6'
    end
    object IBDSSimpleCRIADOR: TIBStringField
      FieldName = 'CRIADOR'
      Origin = 'AUX_EVENTOS.V7'
      Size = 100
    end
    object IBDSSimpleIDORIGEN: TIntegerField
      FieldName = 'IDORIGEN'
      Origin = 'AUX_EVENTOS.I7'
    end
    object IBDSSimpleORIGEN: TIBStringField
      FieldName = 'ORIGEN'
      Origin = 'AUX_EVENTOS.V8'
      Size = 100
    end
    object IBDSSimpleIDPROPIETARIO: TIntegerField
      FieldName = 'IDPROPIETARIO'
      Origin = 'AUX_EVENTOS.I8'
    end
    object IBDSSimplePROPIETARIO: TIBStringField
      FieldName = 'PROPIETARIO'
      Origin = 'AUX_EVENTOS.V9'
      Size = 100
    end
    object IBDSSimpleIDDESTINO: TIntegerField
      FieldName = 'IDDESTINO'
      Origin = 'AUX_EVENTOS.I9'
    end
    object IBDSSimpleDESTINO: TIBStringField
      FieldName = 'DESTINO'
      Origin = 'AUX_EVENTOS.V10'
      Size = 100
    end
    object IBDSSimpleDTA_ALTA: TIBStringField
      FieldName = 'DTA_ALTA'
      Origin = 'AUX_EVENTOS.V11'
      Size = 100
    end
    object IBDSSimpleDTA_BAJA: TIBStringField
      FieldName = 'DTA_BAJA'
      Origin = 'AUX_EVENTOS.DTA_BAJA'
      Size = 50
    end
    object IBDSSimpleFECHAINGRESO: TDateField
      FieldName = 'FECHAINGRESO'
      Origin = 'AUX_EVENTOS.D1'
    end
    object IBDSSimpleIDRESPALTA: TIntegerField
      FieldName = 'IDRESPALTA'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleRESPALTA: TIBStringField
      FieldName = 'RESPALTA'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleFECHASetText
      Size = 100
    end
  end
  inherited IBQValidaciones: TIBQuery
    Left = 388
    Top = 390
  end
  inherited IBQEvento: TIBQuery
    Left = 524
    Top = 374
  end
  inherited SDXLS: TSaveDialog
    Left = 702
    Top = 373
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
        DataField = 'POTRERO'
        Title = 'Nuevo Potrero'
      end
      item
        DataField = 'RODEO'
        Title = 'Nuevo Rodeo'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observacion'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end>
    Title.Text = 'Cambio de Ubicaci'#243'n'
    Left = 176
    Top = 1
  end
  inherited WinXP1: TWinXP
    Left = 656
    Top = 480
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 420
    Top = 479
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 508
    Top = 479
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 564
    Top = 471
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 460
    Top = 367
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 580
    Top = 471
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'SELECT * FROM RN_Cambio_Ubicacion(:ANIMAL, :ESTABLECIMIENTO, :fe' +
        'cha) ')
    Left = 344
    Top = 6
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
  inherited DSIBQ_SPRN: TDataSource
    Left = 376
    Top = 6
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'execute procedure SP_CAMBIO_UBICACION ('
      '  :ID_POTRERO,  '
      '  :ID_RODEO, '
      '  :ID_GRUPO, '
      '  :FECHA,'
      '  :ANIMAL,'
      '  :OBSERVACION,'
      '  :ESTABLECIMIENTO,'
      '  :RESPONSABLE,'
      '  :LOG_USUARIO,'
      '  :LOG_FECHA_MODIFICADO, '
      '  :DISPARADOR)')
    Left = 408
    Top = 0
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_POTRERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_RODEO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
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
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 440
    Top = 6
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 612
    Top = 479
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 552
    Top = 376
  end
  inherited IBSPActEventos: TIBStoredProc
    Left = 396
    Top = 351
  end
  inherited OpenDlg: TOpenDialog
    Left = 668
    Top = 384
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 732
    Top = 496
  end
  inherited IBQImportacion: TIBQuery
    Left = 588
    Top = 366
  end
  object IBQRodeo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQRodeoAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_RODEO, NOMBRE from  TAB_RODEOS where (establecimiento ' +
        '= :esta) and visible = 1')
    Left = 512
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
      end>
  end
  object DSRodeo: TDataSource
    DataSet = IBQRodeo
    Left = 760
    Top = 520
  end
  object IBQEstablecimiento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQRodeoAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_ESTABLECIMIENTO, NOMBRE from  TAB_ESTABLECIMIENTOS whe' +
        're (id_establecimiento <> :esta)')
    Left = 360
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
      end>
  end
  object DSEstablecimiento: TDataSource
    DataSet = IBQEstablecimiento
    Left = 360
    Top = 504
  end
  object IBSPCambioHijos: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'SP_CAMBIO_UBICACION_HIJOS'
    Left = 692
    Top = 500
  end
  object IBQUbicacionVieja: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select first 2 ecu.rodeo, ecu.potrero from eve_cambio_ubicacion ' +
        'ecu join eve_eventos ee on ee.id_evento = ecu.id_evento where ee' +
        '.animal=:animal and ee.establecimiento=:esta order by ee.fecha d' +
        'esc')
    Left = 484
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQTipoBajas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQTipoBajasAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_tipos_baja where id_tipo_baja <> 3')
    Left = 637
    Top = 337
  end
  object DSTiposBaja: TDataSource
    DataSet = IBQTipoBajas
    Left = 669
    Top = 337
  end
  object IBQBuscarFotos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_imagen from tab_imagen where animal = :animal')
    Left = 829
    Top = 281
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
  end
  object IBQEmpleadoAlta: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQEmpleadoAltaAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select  ID_EMPLEADO, NOMBRE || '#39' '#39' || APELLIDO as nombre  from T' +
        'AB_EMPLEADOS where (establecimiento = :idestablecimiento)')
    Left = 526
    Top = 103
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idestablecimiento'
        ParamType = ptUnknown
      end>
  end
  object DSEmpleadoAlta: TDataSource
    DataSet = IBQEmpleadoAlta
    Left = 558
    Top = 103
  end
  object IBQInserEveCambioUbic: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update eve_eventos set potrero = :pot where id_evento = :eve')
    Left = 764
    Top = 167
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'POT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'eve'
        ParamType = ptUnknown
      end>
  end
  object IBQUltimoPotrero: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        '  SELECT FIRST 1 EE.ID_EVENTO, ee.fecha, ECU.POTRERO FROM EVE_EV' +
        'ENTOS EE JOIN EVE_CAMBIO_UBICACION ECU ON EE.ID_EVENTO = ECU.ID_' +
        'EVENTO'
      
        '  WHERE EE.FECHA <= :FECHA AND EE.TIPO = 5 AND EE.ANIMAL = :ID_A' +
        'NIMAL AND EE.ESTABLECIMIENTO = :ESTABLECIMIENTO AND ECU.ESTABLEC' +
        'IMIENTO_ANTERIOR IS NULL'
      '  ORDER BY ee.FECHA DESC, ee.ID_EVENTO desc')
    Left = 764
    Top = 207
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
  end
end
