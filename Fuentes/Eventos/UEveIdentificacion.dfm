inherited FEveIdentificacion: TFEveIdentificacion
  Left = 218
  Top = 5
  HelpContext = 20000
  Caption = 'Identificaci'#243'n'
  ClientHeight = 729
  ClientWidth = 1042
  Constraints.MinHeight = 726
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
    Top = 594
    Width = 1042
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1034
      end
    end
  end
  inherited PDatos: TPanel
    Width = 1042
    Height = 529
    inherited PCBasico: TPageControl
      Width = 1042
      Height = 447
      ActivePage = TSDatos
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 1034
          Height = 405
        end
        inherited MSimple: TMangazo
          Width = 1034
          Height = 405
          inherited GBFiltro: TGroupBox
            Width = 1034
          end
          inherited PSeleccion: TPanel
            Width = 1034
            Height = 99
            inherited GBDisponibles: TGroupBox
              Width = 441
              Height = 99
              inherited IFondoDis: TImage
                Width = 437
                Height = 80
              end
              inherited BDBGDisponibles: TBitDBGrid
                Width = 437
                Height = 80
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'V1'
                    Title.Caption = 'RP Madre'
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CARAVANA_OFICIAL'
                    Visible = False
                  end
                  item
                    Expanded = False
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Left = 553
              Width = 449
              Height = 99
              inherited IFondoSel: TImage
                Width = 445
                Height = 80
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 445
                Height = 80
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                TitleFont.Height = -13
                OnKeyPress = MSimpleBDBGSeleccionadosKeyPress
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'V1'
                    Title.Caption = 'RP Madre'
                    Width = 127
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Width = 109
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'CARAVANA_OFICIAL'
                    Visible = False
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Left = 441
              Width = 112
              Height = 99
              inherited IFondo: TImage
                Width = 112
                Height = 99
              end
              inherited BBAgregarTodos: TJvImage
                Left = 12
                Top = 98
              end
              inherited BBAgregarUno: TJvImage
                Left = 12
                Top = 132
              end
              inherited BBEliminarUno: TJvImage
                Left = 12
                Top = 167
              end
              inherited BBEliminarTodos: TJvImage
                Left = 12
                Top = 201
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
              
                'select  ID_AUX, V1,ID_RP, ID_SENASA, id_animal, MADRE_BIOLOGICA_' +
                'INTERNA AS ID_MBI, ID_PC, ID_HBA, ID_RA, ID_OTRO, NOMBRE, APODO,' +
                ' ID_IE, SEXO, CARAVANA_OFICIAL'
              'from AUX_ANIMALES')
            Left = 546
            Top = 494
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
              '  V1 = :V1,'
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
              
                '  (ID_AUX, V1, ID_RP, ID_SENASA, ID_ANIMAL, ID_PC, ID_HBA, ID_OT' +
                'RO, SEXO)'
              'values'
              
                '  (:ID_AUX, :V1, :ID_RP, :ID_SENASA, :ID_ANIMAL, :ID_PC, :ID_HBA' +
                ', :ID_OTRO, '
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
          Width = 1034
          Height = 199
          Caption = ''
          object GBPrincipal: TGroupBox
            Left = 2
            Top = 17
            Width = 421
            Height = 180
            Align = alLeft
            BiDiMode = bdLeftToRight
            Caption = ' Identificaci'#243'n Principal '
            ParentBiDiMode = False
            TabOrder = 0
            object LRPAnimal: TLabel
              Left = 55
              Top = 60
              Width = 64
              Height = 15
              Caption = 'RP Animal: '
            end
            object LNombre: TLabel
              Left = 68
              Top = 88
              Width = 51
              Height = 15
              Caption = 'Nombre: '
            end
            object Label1: TLabel
              Left = 68
              Top = 116
              Width = 41
              Height = 15
              Caption = 'Apodo: '
            end
            object EAIdRP: TEditAuto
              Left = 97
              Top = 142
              Width = 149
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 10
              TabOrder = 0
              Visible = False
              OnKeyPress = EAIdRPKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object EANombre: TEditAuto
              Left = 131
              Top = 84
              Width = 191
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 100
              TabOrder = 1
              OnKeyPress = EANombreKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object EAApodo: TEditAuto
              Left = 131
              Top = 112
              Width = 191
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 100
              TabOrder = 2
              OnKeyPress = EAApodoKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object EAPrefijo: TEditAuto
              Left = 131
              Top = 56
              Width = 35
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 2
              TabOrder = 3
              OnChange = EARPOnChange
              OnExit = EARPOnExit
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EARpInicial: TEditAuto
              Left = 165
              Top = 56
              Width = 78
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 6
              TabOrder = 4
              OnChange = EARPOnChange
              OnExit = EARPOnExit
              OnKeyPress = EARpInicialKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EASufijo: TEditAuto
              Left = 242
              Top = 56
              Width = 27
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 2
              TabOrder = 5
              OnChange = EARPOnChange
              OnExit = EARPOnExit
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
          object GBIdentificacion: TGroupBox
            Left = 589
            Top = 17
            Width = 443
            Height = 180
            Align = alRight
            Caption = ' Identificaci'#243'n Alternativa '
            TabOrder = 1
            object LPC: TLabel
              Left = 265
              Top = 123
              Width = 23
              Height = 15
              Caption = 'PC: '
            end
            object LHBA: TLabel
              Left = 29
              Top = 122
              Width = 30
              Height = 15
              Caption = 'HBA: '
            end
            object LRA: TLabel
              Left = 37
              Top = 152
              Width = 22
              Height = 15
              Caption = 'RA: '
            end
            object LOtro: TLabel
              Left = 260
              Top = 153
              Width = 29
              Height = 15
              Caption = 'Otro: '
            end
            object LCUIGPropio: TLabel
              Left = 219
              Top = 55
              Width = 78
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
              Visible = False
              OnClick = LCUIGPropioClick
              OnMouseEnter = LCUIGPropioMouseEnter
              OnMouseLeave = LCUIGPropioMouseLeave
            end
            object LIdentificacionElectronica: TLabel
              Left = 264
              Top = 94
              Width = 25
              Height = 17
              AutoSize = False
              Caption = 'I.E.: '
            end
            object Lr: TLabel
              Left = 181
              Top = 41
              Width = 15
              Height = 17
              AutoSize = False
              Caption = 'R'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object EAPrefijoCO: TEditAuto
              Left = 200
              Top = 19
              Width = 90
              Height = 23
              CharCase = ecUpperCase
              Color = clFuchsia
              MaxLength = 10
              TabOrder = 21
              Visible = False
              OnKeyPress = EAPrefijoCOKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAIdSenasa: TEditAuto
              Left = 210
              Top = 19
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 9
              TabOrder = 0
              Visible = False
              OnChange = EAIdSenasaChange
              OnExit = EAIdSenasaExit
              OnKeyPress = EAIdSenasaKeyPress
              OnKeyUp = EAIdSenasaKeyUp
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object EAEncabezado: TMaskEdit
              Left = 198
              Top = 19
              Width = 51
              Height = 23
              EditMask = '>ll999;0;_'
              MaxLength = 5
              TabOrder = 7
              OnChange = EAUltimoIdentExit
              OnExit = EAUltimoIdentExit
              OnKeyPress = EAEncabezadoKeyPress
            end
            object EAIdPC: TEditAuto
              Left = 296
              Top = 120
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 10
              TabOrder = 1
              OnKeyPress = EAIdPCKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object EAIdHBA: TEditAuto
              Left = 64
              Top = 117
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 10
              TabOrder = 2
              OnKeyPress = EAIdHBAKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object EAIdRA: TEditAuto
              Left = 64
              Top = 149
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 10
              TabOrder = 3
              OnKeyPress = EAIdRAKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object EAOtro: TEditAuto
              Left = 296
              Top = 149
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 10
              TabOrder = 4
              OnKeyPress = EAOtroKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object RBSenasa: TRadioButton
              Left = 34
              Top = 26
              Width = 139
              Height = 18
              Caption = 'Senasa'
              TabOrder = 5
              OnClick = RBSenasaClick
            end
            object RBCUIGSenasa: TRadioButton
              Left = 34
              Top = 59
              Width = 122
              Height = 19
              Caption = 'CUIG - Senasa'
              Checked = True
              TabOrder = 6
              TabStop = True
              OnClick = RBCUIGSenasaClick
            end
            object EAUltimoIdent: TMaskEdit
              Left = 267
              Top = 19
              Width = 42
              Height = 23
              EditMask = '>AAA9;0;_'
              MaxLength = 4
              TabOrder = 8
              Visible = False
              OnChange = EAUltimoIdentExit
              OnExit = EAUltimoIdentExit
              OnKeyPress = EAUltimoIdentKeyPress
            end
            object EVerificador: TEdit
              Left = 327
              Top = 19
              Width = 26
              Height = 23
              ReadOnly = True
              TabOrder = 9
              Visible = False
              OnKeyPress = EVerificadorKeyPress
            end
            object CBCUIGPropio: TCheckBox
              Left = 199
              Top = 58
              Width = 17
              Height = 19
              Caption = 'CUIG Propio'
              TabOrder = 10
              Visible = False
              OnClick = CBCUIGPropioClick
            end
            object DBLCBACUIGPropio: TDBLookupComboBoxAuto
              Left = 302
              Top = 56
              Width = 91
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_CUIG'
              ListField = 'ENCABEZADO'
              ListSource = DMSoftvet.DSCUIGActual
              TabOrder = 11
              Visible = False
              OnCloseUp = DBLCBACUIGPropioCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAIdentificacionElectronica: TEditAuto
              Left = 296
              Top = 89
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 15
              TabOrder = 12
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object RBReidentificacionSenasa: TRadioButton
              Left = 34
              Top = 94
              Width = 157
              Height = 18
              Caption = 'Reidentificaci'#243'n Senasa'
              TabOrder = 13
              OnClick = RBReidentificacionSenasaClick
            end
            object EAUltimoIdentReidentificacion: TMaskEdit
              Left = 267
              Top = 37
              Width = 31
              Height = 23
              EditMask = '>AAA9;0;_'
              MaxLength = 4
              TabOrder = 15
              Visible = False
              OnChange = EAEncabezadoReidentificacionExit
              OnExit = EAEncabezadoReidentificacionExit
            end
            object EAEncabezadoReidentificacion: TMaskEdit
              Left = 198
              Top = 37
              Width = 47
              Height = 23
              EditMask = '>ll999;0;_'
              MaxLength = 5
              TabOrder = 14
              Visible = False
              OnChange = EAEncabezadoReidentificacionExit
              OnExit = EAEncabezadoReidentificacionExit
            end
            object EVerificadorReidentificacion: TEdit
              Left = 327
              Top = 37
              Width = 26
              Height = 23
              MaxLength = 1
              ReadOnly = True
              TabOrder = 16
              Visible = False
            end
            object RBRPAnimal: TRadioButton
              Left = 34
              Top = 127
              Width = 113
              Height = 17
              Caption = 'RP Animal'
              TabOrder = 17
              OnClick = RBRPAnimalClick
            end
            object EARpInicialMasivo: TEditAuto
              Left = 244
              Top = 126
              Width = 78
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 6
              TabOrder = 19
              OnChange = EAPrefijoMasivoChange
              OnExit = EARpInicialMasivoExit
              OnKeyPress = EARpInicialKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrefijoMasivo: TEditAuto
              Left = 198
              Top = 126
              Width = 35
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 2
              TabOrder = 18
              OnChange = EAPrefijoMasivoChange
              OnExit = EARpInicialMasivoExit
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EASufijoMasivo: TEditAuto
              Left = 335
              Top = 126
              Width = 27
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 2
              TabOrder = 20
              OnChange = EAPrefijoMasivoChange
              OnExit = EARpInicialMasivoExit
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
        end
        object GBResponsable: TGroupBox [1]
          Left = 0
          Top = 199
          Width = 1034
          Height = 32
          Align = alClient
          TabOrder = 1
          object LFecha: TLabel
            Left = 112
            Top = 11
            Width = 36
            Height = 22
            AutoSize = False
            Caption = 'Fecha:'
            Layout = tlCenter
          end
          object LObservador: TLabel
            Left = 405
            Top = 11
            Width = 83
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
          object DTPAFecha: TDateTimePickerAuto
            Left = 164
            Top = 11
            Width = 190
            Height = 21
            Date = 38657.411226122680000000
            Time = 38657.411226122680000000
            Color = 14679807
            TabOrder = 0
            OnChange = DTPAFechaChange
            OnExit = GetEvent
            OnKeyPress = DTPAFechaKeyPress
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object CBAObservador: TDBLookupComboBoxAuto
            Left = 491
            Top = 11
            Width = 191
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 1
            OnExit = GetEvent
            OnKeyPress = CBAObservadorKeyPress
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 231
          Width = 1034
          Height = 174
          Align = alBottom
          TabOrder = 2
          inherited MAObservacion: TMemoAuto
            Width = 1030
            Height = 155
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Width = 939
          Height = 405
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
              FieldName = 'V2'
              ReadOnly = True
              Title.Caption = 'RP Madre'
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RP'
              Title.Caption = 'RP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_SENASA'
              Title.Caption = 'Senasa'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_HBA'
              Title.Caption = 'HBA'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_PC'
              Title.Caption = 'PC'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RA'
              Title.Caption = 'RA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_OTRO'
              Title.Caption = 'Otro'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Title.Caption = 'Nombre'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APODO'
              Title.Caption = 'Apodo'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_IE'
              Title.Caption = 'IE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CARAVANA_OFICIAL'
              Title.Caption = 'Caravana oficial'
              Visible = False
            end>
        end
        inherited PanelIzq: TPanel
          Height = 405
        end
        inherited PanelDer: TPanel
          Left = 986
          Height = 405
        end
      end
    end
    inherited PBotones: TPanel
      Top = 447
      Width = 1042
      inherited SBSelTodos: TSpeedButton
        Left = 918
      end
      inherited IFondoB2: TImage
        Width = 616
      end
      inherited LExpExcel: TLabel
        Left = 120
        Top = 29
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
      inherited BSacarAnimal: TBitBtn
        Left = 151
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1042
    Caption = 'Identificaci'#243'n del Animal'
    inherited LTitulo: TLabel
      Width = 638
    end
    inherited PILeft: TPanel
      Left = 834
    end
  end
  inherited Psocalo: TPanel
    Top = 707
    Width = 1042
    inherited JvSocalo: TJvImage
      Width = 1042
    end
  end
  inherited ALUniversal: TActionList
    Left = 475
    Top = 46
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 132
    Top = 79
  end
  inherited DSSimple: TDataSource
    Left = 64
  end
  inherited IBDSSimple: TIBDataSet
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_RP, ID_SENASA, ID_ANIMAL, ID_HBA, ID_OTRO, ID_PC, ID_RA, A' +
        'PODO, '
      'NOMBRE, '
      
        '   FECHA, OBSERVACION, RESPONSABLE, EW,V2,ID_IE,I1, CARAVANA_OFI' +
        'CIAL)'
      'values'
      
        '  (:ID_RP, :ID_SENASA, :ID_ANIMAL, :ID_HBA, :ID_OTRO, :ID_PC, :I' +
        'D_RA, '
      ':APODO, '
      
        '   :NOMBRE, :FECHA, :OBSERVACION, :RESPONSABLE, :EW,:V2,:ID_IE,:' +
        'I1, :CARAVANA_OFICIAL)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_SENASA,'
      '  ID_RP,'
      '  FECHA,'
      '  OBSERVACION,'
      '  RESPONSABLE,'
      '  NOMBRE,'
      '  ID_ANIMAL,'
      '  ID_AUX_EVENTO,'
      '  EW,'
      '  H1,'
      '  ID_PC,'
      '  ID_HBA,'
      '  ID_RA,'
      '  ID_OTRO,'
      '  APODO,'
      '  V2,'
      '  ID_IE,'
      '  I1,'
      '  CARAVANA_OFICIAL'
      'from AUX_EVENTOS '
      'where'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      
        'select ID_RP, ID_SENASA, ID_ANIMAL, ID_HBA, ID_OTRO, ID_PC, ID_R' +
        'A, APODO, NOMBRE, FECHA, OBSERVACION, V1  as RESP , RESPONSABLE,' +
        ' EW, V2, ID_IE, I1, CARAVANA_OFICIAL'
      'FROM AUX_EVENTOS')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_HBA = :ID_HBA,'
      '  ID_OTRO = :ID_OTRO,'
      '  ID_PC = :ID_PC,'
      '  ID_RA = :ID_RA,'
      '  APODO = :APODO,'
      '  NOMBRE = :NOMBRE,'
      '  FECHA = :FECHA,'
      '  OBSERVACION = :OBSERVACION,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  EW = :EW,'
      '  V2 = :V2,'
      '  ID_IE = :ID_IE,'
      '  I1 = :I1,'
      '  CARAVANA_OFICIAL = :CARAVANA_OFICIAL'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 20
    object IBDSSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_EVENTOS.ID_RP'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 10
    end
    object IBDSSimpleID_SENASA: TIBStringField
      DisplayWidth = 9
      FieldName = 'ID_SENASA'
      Origin = 'AUX_EVENTOS.ID_SENASA'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 9
    end
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_EVENTOS.ID_HBA'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 10
    end
    object IBDSSimpleID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_EVENTOS.ID_OTRO'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 10
    end
    object IBDSSimpleID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_EVENTOS.ID_PC'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 10
    end
    object IBDSSimpleID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_EVENTOS.ID_RA'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 10
    end
    object IBDSSimpleAPODO: TIBStringField
      DisplayWidth = 100
      FieldName = 'APODO'
      Origin = 'AUX_EVENTOS.APODO'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 100
    end
    object IBDSSimpleNOMBRE: TIBStringField
      DisplayWidth = 100
      FieldName = 'NOMBRE'
      Origin = 'AUX_EVENTOS.NOMBRE'
      OnSetText = IBDSSimpleID_RPSetText
      Size = 100
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
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = SetText
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
    object IBDSSimpleV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_EVENTOS.V2'
      Size = 100
    end
    object IBDSSimpleID_IE: TIBStringField
      FieldName = 'ID_IE'
      Origin = 'AUX_EVENTOS.ID_IE'
      Size = 64
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleCARAVANA_OFICIAL: TIBStringField
      FieldName = 'CARAVANA_OFICIAL'
      Origin = 'AUX_EVENTOS.CARAVANA_OFICIAL'
      OnSetText = IBDSSimpleID_RPSetText
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 632
    Top = 6
  end
  inherited IBQValidaciones: TIBQuery
    Left = 316
    Top = 110
  end
  inherited SDXLS: TSaveDialog
    Left = 286
    Top = 109
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
        DataField = 'ID_SENASA'
        Title = 'SENASA'
      end
      item
        DataField = 'ID_HBA'
        Title = 'HBA'
      end
      item
        DataField = 'ID_PC'
        Title = 'PC'
      end
      item
        DataField = 'ID_RA'
        Title = 'RA'
      end
      item
        DataField = 'ID_OTRO'
        Title = 'Otro'
      end
      item
        DataField = 'NOMBRE'
        Title = 'Nombre'
      end
      item
        DataField = 'APODO'
        Title = 'Apodo'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end
      item
        DataField = 'ID_IE'
        Title = 'IE'
      end>
    Title.Text = 'Evento Identificaci'#243'n de Animal'
  end
  inherited WinXP1: TWinXP
    Left = 416
    Top = 64
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'select * from  RN_IDENTIFICACION('
      
        '  :ANIMAL, :ESTA,:SEXO,  :RP, :SENASA, :PC, :HBA, :RA, :OTRO, :f' +
        'echa, :IE, :CO)')
    Left = 504
    Top = 6
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
        Name = 'SEXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SENASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 552
    Top = 46
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'execute PROCEDURE SP_IDENTIFICACION ('
      '  :FECHA, :ANIMAL,  :OBSERVACION, :ESTABLECIMIENTO,'
      '  :RESPONSABLE, :LOG_USUARIO, :LOG_FECHA_MODIFICADO,'
      '  :ID_GRUPO, :RP, :SEN, :PC, :HBA, :RA, :OTRO, :NOMBRE,'
      '  :APODO, :DISPARADOR,:TIPOEVENTO,:ID_IE, :CO)')
    Left = 576
    Top = 6
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
        Name = 'RP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPOEVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Top = 54
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 96
    Top = 80
  end
  inherited IBQImportacion: TIBQuery
    Left = 68
    Top = 190
  end
  object IBQDeleteAuxEventos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from AUX_EVENTOS')
    Left = 668
    Top = 22
  end
  object IBQActCUIG: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update tab_cuig set ultimo_identificador=:UI where ID_CUIG=:cuig')
    Left = 484
    Top = 393
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
  object IBQBuscarCUIG: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ultimo_identificador from tab_cuig where establecimiento=' +
        ':esta and id_cuig=:id')
    Left = 452
    Top = 393
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
  object IBQObtenerSexo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cs.tipo as sexo from tab_animales ta join cod_sexos cs on' +
        ' ta.sexo = cs.id_sexo where ta.id_animal = :id and establecimien' +
        'to = :esta')
    Left = 316
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQDatosAnimal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_animales where id_animal = :animal')
    Left = 468
    Top = 247
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
    object IBQDatosAnimalID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'TAB_ANIMALES.ID_ANIMAL'
      Required = True
    end
    object IBQDatosAnimalESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'TAB_ANIMALES.ESTABLECIMIENTO'
    end
    object IBQDatosAnimalID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES.ID_RP'
      Required = True
      Size = 10
    end
    object IBQDatosAnimalID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'TAB_ANIMALES.ID_SENASA'
      Size = 9
    end
    object IBQDatosAnimalID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'TAB_ANIMALES.ID_PC'
      Size = 10
    end
    object IBQDatosAnimalID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'TAB_ANIMALES.ID_HBA'
      Size = 10
    end
    object IBQDatosAnimalID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'TAB_ANIMALES.ID_RA'
      Size = 10
    end
    object IBQDatosAnimalID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'TAB_ANIMALES.ID_OTRO'
      Size = 10
    end
    object IBQDatosAnimalNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'TAB_ANIMALES.NOMBRE'
      Size = 100
    end
    object IBQDatosAnimalFECHA_NACIMIENTO: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'TAB_ANIMALES.FECHA_NACIMIENTO'
      Required = True
    end
    object IBQDatosAnimalSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'TAB_ANIMALES.SEXO'
      Required = True
    end
    object IBQDatosAnimalORIGEN: TIBStringField
      FieldName = 'ORIGEN'
      Origin = 'TAB_ANIMALES.ORIGEN'
    end
    object IBQDatosAnimalCIRCUNFERENCIA_ESCROTAL: TFloatField
      FieldName = 'CIRCUNFERENCIA_ESCROTAL'
      Origin = 'TAB_ANIMALES.CIRCUNFERENCIA_ESCROTAL'
    end
    object IBQDatosAnimalESTADO_LACTACION: TIntegerField
      FieldName = 'ESTADO_LACTACION'
      Origin = 'TAB_ANIMALES.ESTADO_LACTACION'
    end
    object IBQDatosAnimalPOTRERO: TIntegerField
      FieldName = 'POTRERO'
      Origin = 'TAB_ANIMALES.POTRERO'
      Required = True
    end
    object IBQDatosAnimalRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'TAB_ANIMALES.RAZA'
      Required = True
    end
    object IBQDatosAnimalRODEO: TIntegerField
      FieldName = 'RODEO'
      Origin = 'TAB_ANIMALES.RODEO'
      Required = True
    end
    object IBQDatosAnimalCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Origin = 'TAB_ANIMALES.CATEGORIA'
      Required = True
    end
    object IBQDatosAnimalACTIVO: TIBStringField
      FieldName = 'ACTIVO'
      Origin = 'TAB_ANIMALES.ACTIVO'
      Required = True
      Size = 1
    end
    object IBQDatosAnimalCRONOLOGIA_DENTARIA: TIntegerField
      FieldName = 'CRONOLOGIA_DENTARIA'
      Origin = 'TAB_ANIMALES.CRONOLOGIA_DENTARIA'
    end
    object IBQDatosAnimalCONDICION_CORPORAL: TIntegerField
      FieldName = 'CONDICION_CORPORAL'
      Origin = 'TAB_ANIMALES.CONDICION_CORPORAL'
    end
    object IBQDatosAnimalMADRE_BIOLOGICA_EXTERNA: TIntegerField
      FieldName = 'MADRE_BIOLOGICA_EXTERNA'
      Origin = 'TAB_ANIMALES.MADRE_BIOLOGICA_EXTERNA'
    end
    object IBQDatosAnimalMADRE_RECEPTORA_EXTERNA: TIntegerField
      FieldName = 'MADRE_RECEPTORA_EXTERNA'
      Origin = 'TAB_ANIMALES.MADRE_RECEPTORA_EXTERNA'
    end
    object IBQDatosAnimalGDR: TIntegerField
      FieldName = 'GDR'
      Origin = 'TAB_ANIMALES.GDR'
    end
    object IBQDatosAnimalESTADO_REPRODUCTIVO: TIntegerField
      FieldName = 'ESTADO_REPRODUCTIVO'
      Origin = 'TAB_ANIMALES.ESTADO_REPRODUCTIVO'
    end
    object IBQDatosAnimalPADRE_EXTERNO: TIntegerField
      FieldName = 'PADRE_EXTERNO'
      Origin = 'TAB_ANIMALES.PADRE_EXTERNO'
    end
    object IBQDatosAnimalAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'TAB_ANIMALES.APODO'
      Size = 100
    end
    object IBQDatosAnimalPESO: TFloatField
      FieldName = 'PESO'
      Origin = 'TAB_ANIMALES.PESO'
    end
    object IBQDatosAnimalPESONACER: TFloatField
      FieldName = 'PESONACER'
      Origin = 'TAB_ANIMALES.PESONACER'
    end
    object IBQDatosAnimalPESO205: TFloatField
      FieldName = 'PESO205'
      Origin = 'TAB_ANIMALES.PESO205'
    end
    object IBQDatosAnimalPESO365: TFloatField
      FieldName = 'PESO365'
      Origin = 'TAB_ANIMALES.PESO365'
    end
    object IBQDatosAnimalPESO550: TFloatField
      FieldName = 'PESO550'
      Origin = 'TAB_ANIMALES.PESO550'
    end
    object IBQDatosAnimalRECHAZADO: TIBStringField
      FieldName = 'RECHAZADO'
      Origin = 'TAB_ANIMALES.RECHAZADO'
      Size = 1
    end
    object IBQDatosAnimalMADRE_BIOLOGICA_INTERNA: TIntegerField
      FieldName = 'MADRE_BIOLOGICA_INTERNA'
      Origin = 'TAB_ANIMALES.MADRE_BIOLOGICA_INTERNA'
    end
    object IBQDatosAnimalMADRE_RECEPTORA_INTERNA: TIntegerField
      FieldName = 'MADRE_RECEPTORA_INTERNA'
      Origin = 'TAB_ANIMALES.MADRE_RECEPTORA_INTERNA'
    end
    object IBQDatosAnimalPADRE_INTERNO: TIntegerField
      FieldName = 'PADRE_INTERNO'
      Origin = 'TAB_ANIMALES.PADRE_INTERNO'
    end
    object IBQDatosAnimalFRAME: TFloatField
      FieldName = 'FRAME'
      Origin = 'TAB_ANIMALES.FRAME'
    end
    object IBQDatosAnimalDTA: TIBStringField
      FieldName = 'DTA'
      Origin = 'TAB_ANIMALES.DTA'
      Size = 50
    end
    object IBQDatosAnimalDTA_BAJA: TIBStringField
      FieldName = 'DTA_BAJA'
      Origin = 'TAB_ANIMALES.DTA_BAJA'
      Size = 50
    end
    object IBQDatosAnimalESTADO_ACTUAL: TIBStringField
      FieldName = 'ESTADO_ACTUAL'
      Origin = 'TAB_ANIMALES.ESTADO_ACTUAL'
      Size = 50
    end
    object IBQDatosAnimalULTIMO_EVENTO: TIntegerField
      FieldName = 'ULTIMO_EVENTO'
      Origin = 'TAB_ANIMALES.ULTIMO_EVENTO'
    end
    object IBQDatosAnimalULTIMO_PESO: TFloatField
      FieldName = 'ULTIMO_PESO'
      Origin = 'TAB_ANIMALES.ULTIMO_PESO'
    end
    object IBQDatosAnimalACTIVIDAD: TIntegerField
      FieldName = 'ACTIVIDAD'
      Origin = 'TAB_ANIMALES.ACTIVIDAD'
    end
    object IBQDatosAnimalID_IE: TIBStringField
      FieldName = 'ID_IE'
      Origin = 'TAB_ANIMALES.ID_IE'
      Size = 64
    end
    object IBQDatosAnimalPROPIETARIO: TIntegerField
      FieldName = 'PROPIETARIO'
      Origin = 'TAB_ANIMALES.PROPIETARIO'
    end
    object IBQDatosAnimalCRIADOR: TIntegerField
      FieldName = 'CRIADOR'
      Origin = 'TAB_ANIMALES.CRIADOR'
    end
    object IBQDatosAnimalORIGEN_ANIMAL: TIntegerField
      FieldName = 'ORIGEN_ANIMAL'
      Origin = 'TAB_ANIMALES.ORIGEN_ANIMAL'
    end
    object IBQDatosAnimalADN: TIBStringField
      FieldName = 'ADN'
      Origin = 'TAB_ANIMALES.ADN'
      Size = 255
    end
    object IBQDatosAnimalTIPIFICACION_SANGUINEA: TIBStringField
      FieldName = 'TIPIFICACION_SANGUINEA'
      Origin = 'TAB_ANIMALES.TIPIFICACION_SANGUINEA'
      Size = 255
    end
    object IBQDatosAnimalSUBCATEGORIA: TIntegerField
      FieldName = 'SUBCATEGORIA'
      Origin = 'TAB_ANIMALES.SUBCATEGORIA'
    end
    object IBQDatosAnimalCODIGO_MANEJO: TIntegerField
      FieldName = 'CODIGO_MANEJO'
      Origin = 'TAB_ANIMALES.CODIGO_MANEJO'
    end
    object IBQDatosAnimalFOLIO_DENUNCIA: TIBStringField
      FieldName = 'FOLIO_DENUNCIA'
      Origin = 'TAB_ANIMALES.FOLIO_DENUNCIA'
      Size = 50
    end
    object IBQDatosAnimalLINEA_DENUNCIA: TIntegerField
      FieldName = 'LINEA_DENUNCIA'
      Origin = 'TAB_ANIMALES.LINEA_DENUNCIA'
    end
    object IBQDatosAnimalMOCHO: TIntegerField
      FieldName = 'MOCHO'
      Origin = 'TAB_ANIMALES.MOCHO'
    end
    object IBQDatosAnimalINSPECCION: TIntegerField
      FieldName = 'INSPECCION'
      Origin = 'TAB_ANIMALES.INSPECCION'
    end
    object IBQDatosAnimalDESTINO_CABANIA: TIntegerField
      FieldName = 'DESTINO_CABANIA'
      Origin = 'TAB_ANIMALES.DESTINO_CABANIA'
    end
    object IBQDatosAnimalCOLOR: TIntegerField
      FieldName = 'COLOR'
      Origin = 'TAB_ANIMALES.COLOR'
    end
    object IBQDatosAnimalINFORMADO_AFIP: TIBStringField
      FieldName = 'INFORMADO_AFIP'
      Origin = 'TAB_ANIMALES.INFORMADO_AFIP'
      Size = 1
    end
    object IBQDatosAnimalCARAVANA_OFICIAL: TIBStringField
      FieldName = 'CARAVANA_OFICIAL'
      Origin = 'TAB_ANIMALES.CARAVANA_OFICIAL'
    end
  end
end
