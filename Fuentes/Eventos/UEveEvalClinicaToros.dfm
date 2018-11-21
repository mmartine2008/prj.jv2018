inherited FEveEvalClinicaToros: TFEveEvalClinicaToros
  Left = 52
  Top = 24
  Caption = 'FEveEvalClinicaToros'
  ClientHeight = 735
  ClientWidth = 1008
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1008
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
    Top = 600
    Width = 1008
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1000
      end
    end
  end
  inherited PDatos: TPanel
    Width = 1008
    Height = 535
    inherited PCBasico: TPageControl
      Width = 1008
      Height = 453
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 1000
          Height = 411
        end
        inherited MSimple: TMangazo
          Width = 1000
          Height = 411
          inherited GBFiltro: TGroupBox
            Width = 1000
          end
          inherited PSeleccion: TPanel
            Width = 1000
            Height = 105
            inherited GBDisponibles: TGroupBox
              Height = 105
              inherited IFondoDis: TImage
                Height = 86
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 86
                TitleFont.Height = -14
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Alignment = taCenter
                    Title.Caption = 'RP'
                    Width = 129
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE'
                    Title.Caption = 'Nombre'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Width = 213
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Width = 443
              Height = 105
              inherited IFondoSel: TImage
                Width = 439
                Height = 86
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 439
                Height = 86
                TitleFont.Height = -14
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
                    FieldName = 'NOMBRE'
                    Title.Caption = 'Nombre'
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
              Height = 105
              inherited IFondo: TImage
                Height = 105
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Width = 1000
          end
          inherited GBFiltros: TGroupBox
            Width = 1000
          end
          inherited Panel1: TPanel
            Width = 1000
            inherited Image1: TImage
              Width = 1000
            end
            inherited Label1: TLabel
              Width = 1000
              Height = 21
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
              
                'select  A.ID_AUX, A.ID_RP, A.ID_SENASA, A.ID_ANIMAL, A.ID_PC, A.' +
                'ID_HBA, A.ID_OTRO, A.FECHA_NACIMIENTO, A.NOMBRE from AUX_ANIMALE' +
                'S A')
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
              '  VUNO2,'
              '  SUBCATEGORIA,'
              '  V14,'
              '  INSPECCION,'
              '  V15,'
              '  DESTINO_CAB,'
              '  V16,'
              '  MOCHO,'
              '  V17,'
              '  COLOR,'
              '  NOMCOLOR'
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
              '  FECHA_NACIMIENTO = :FECHA_NACIMIENTO,'
              '  NOMBRE = :NOMBRE'
              'where'
              '  ID_ANIMAL = :OLD_ID_ANIMAL')
            InsertSQL.Strings = (
              'insert into AUX_ANIMALES'
              
                '  (ID_AUX, ID_RP, ID_SENASA, ID_ANIMAL, ID_PC, ID_HBA, ID_OTRO, ' +
                'FECHA_NACIMIENTO, '
              '   NOMBRE)'
              'values'
              
                '  (:ID_AUX, :ID_RP, :ID_SENASA, :ID_ANIMAL, :ID_PC, :ID_HBA, :ID' +
                '_OTRO, '
              '   :FECHA_NACIMIENTO, :NOMBRE)')
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
              '  NOMBRE = :NOMBRE,'
              '  SEXO = :SEXO'
              'where'
              '  ID_ANIMAL = :OLD_ID_ANIMAL')
            InsertSQL.Strings = (
              'insert into Tab_Animales'
              '  (ID_ANIMAL, ID_RP, ID_SENASA, NOMBRE, SEXO)'
              'values'
              '  (:ID_ANIMAL, :ID_RP, :ID_SENASA, :NOMBRE, :SEXO)')
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Width = 1000
          Height = 411
          Align = alClient
          object Label1: TLabel
            Left = 16
            Top = 32
            Width = 115
            Height = 15
            Caption = 'Fecha de la Revisi'#243'n'
          end
          object Label2: TLabel
            Left = 288
            Top = 32
            Width = 75
            Height = 15
            Caption = 'Responsable'
          end
          object DTPFechaEval: TDateTimePicker
            Left = 139
            Top = 29
            Width = 118
            Height = 23
            Date = 41431.410726909720000000
            Time = 41431.410726909720000000
            TabOrder = 0
            OnExit = GetEvent
          end
          object DBLCBAResponsableEval: TDBLookupComboBoxAuto
            Left = 368
            Top = 29
            Width = 169
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
          object GBExamenClinico: TJvGroupBox
            Left = 657
            Top = 58
            Width = 321
            Height = 161
            Caption = 'Ex'#225'men Cl'#237'nico'
            TabOrder = 2
            Checkable = True
            Checked = True
            PropagateEnable = True
            object Label3: TLabel
              Left = 10
              Top = 56
              Width = 40
              Height = 15
              Cursor = crHandPoint
              Caption = 'Metodo'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = Label3Click
            end
            object Label4: TLabel
              Left = 10
              Top = 81
              Width = 37
              Height = 15
              Cursor = crHandPoint
              Caption = 'Causa'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = Label4Click
            end
            object Label5: TLabel
              Left = 10
              Top = 105
              Width = 57
              Height = 15
              Caption = 'Resultado'
              Enabled = False
            end
            object DTPExamenClinico: TDateTimePicker
              Left = 8
              Top = 24
              Width = 94
              Height = 23
              Date = 41431.422253784720000000
              Time = 41431.422253784720000000
              Enabled = False
              TabOrder = 1
              OnExit = GetEvent
            end
            object DBLCBAMetodoExamenClinico: TDBLookupComboBoxAuto
              Left = 96
              Top = 53
              Width = 201
              Height = 23
              Color = clWhite
              Enabled = False
              KeyField = 'ID_METODO_EXAMEN'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSExamenSanitario
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBACausaExamenClinico: TDBLookupComboBoxAuto
              Left = 96
              Top = 77
              Width = 201
              Height = 23
              Color = clWhite
              Enabled = False
              KeyField = 'ID_EXAMEN_CLINICO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSExamenClinico
              TabOrder = 3
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAResultExamenClinico: TDBLookupComboBoxAuto
              Left = 96
              Top = 100
              Width = 201
              Height = 23
              Color = clWhite
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DMSoftvet.DSCodigosGenericos
              TabOrder = 4
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object MObsExamenClinico: TMemo
              Left = 8
              Top = 130
              Width = 305
              Height = 25
              Enabled = False
              TabOrder = 5
              OnExit = GetEvent
            end
          end
          object GBCircunferenciaEscrotal: TJvGroupBox
            Left = 332
            Top = 58
            Width = 321
            Height = 161
            Caption = 'Circunferencia Escrotal'
            TabOrder = 3
            Checkable = True
            Checked = True
            PropagateEnable = True
            object LValor: TLabel
              Left = 9
              Top = 60
              Width = 31
              Height = 15
              Caption = 'Valor:'
              Enabled = False
            end
            object Label6: TLabel
              Left = 130
              Top = 59
              Width = 59
              Height = 15
              Caption = '(0 - 60 cm)'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object DTPCircunferencia: TDateTimePicker
              Left = 8
              Top = 24
              Width = 94
              Height = 23
              Date = 41431.422253784720000000
              Time = 41431.422253784720000000
              Enabled = False
              TabOrder = 1
              OnExit = GetEvent
            end
            object EACircunferenciaE: TEditAuto
              Left = 46
              Top = 55
              Width = 78
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              Enabled = False
              MaxLength = 5
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object alos18meses: TCheckBox
              Left = 216
              Top = 57
              Width = 87
              Height = 18
              Caption = '18 meses'
              Enabled = False
              TabOrder = 3
              Visible = False
              OnEnter = GetEvent
              OnExit = GetEvent
            end
            object MObsCircunferencia: TMemo
              Left = 8
              Top = 92
              Width = 305
              Height = 54
              Enabled = False
              TabOrder = 4
              OnExit = GetEvent
            end
          end
          object GB1MuestreoToros: TJvGroupBox
            Left = 8
            Top = 219
            Width = 321
            Height = 161
            Caption = '1'#186' Muestreo de Toros por Venereas'
            TabOrder = 4
            Checkable = True
            Checked = True
            PropagateEnable = True
            object LResultadoTrico: TLabel
              Left = 10
              Top = 103
              Width = 145
              Height = 15
              Caption = 'Resultado Tricomoniasis: '
              Enabled = False
              Layout = tlCenter
            end
            object LResultadoCampi: TLabel
              Left = 10
              Top = 79
              Width = 174
              Height = 15
              Caption = 'Resultado Campilobacteriosis: '
              Enabled = False
              Layout = tlCenter
            end
            object LResultado: TLabel
              Left = 10
              Top = 57
              Width = 63
              Height = 15
              Caption = 'Resultado: '
              Enabled = False
              Layout = tlCenter
            end
            object DTP1Muestreo: TDateTimePicker
              Left = 9
              Top = 23
              Width = 94
              Height = 23
              Date = 41431.422253784720000000
              Time = 41431.422253784720000000
              Enabled = False
              TabOrder = 1
              OnExit = GetEvent
            end
            object DBLCBAResultado1Muestreo: TDBLookupComboBoxAuto
              Left = 185
              Top = 53
              Width = 129
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DSResult1Muestreo
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object DBLCBAResultadoCampi1Muestreo: TDBLookupComboBoxAuto
              Left = 185
              Top = 76
              Width = 129
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DSGenericosEspecial11
              TabOrder = 3
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object DBLCBAResultadoTrico1Muestreo: TDBLookupComboBoxAuto
              Left = 185
              Top = 99
              Width = 129
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DSGenericosEspecial12
              TabOrder = 4
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object MObs1Muestreo: TMemo
              Left = 8
              Top = 130
              Width = 305
              Height = 25
              Enabled = False
              TabOrder = 5
              OnExit = GetEvent
            end
          end
          object GB2MuestreoToros: TJvGroupBox
            Left = 332
            Top = 220
            Width = 321
            Height = 161
            Caption = '2'#186' Muestreo de Toros por Venereas'
            TabOrder = 5
            Checkable = True
            Checked = True
            PropagateEnable = True
            object Label7: TLabel
              Left = 11
              Top = 103
              Width = 145
              Height = 15
              Caption = 'Resultado Tricomoniasis: '
              Enabled = False
              Layout = tlCenter
            end
            object Label8: TLabel
              Left = 10
              Top = 79
              Width = 174
              Height = 15
              Caption = 'Resultado Campilobacteriosis: '
              Enabled = False
              Layout = tlCenter
            end
            object Label9: TLabel
              Left = 10
              Top = 57
              Width = 63
              Height = 15
              Caption = 'Resultado: '
              Enabled = False
              Layout = tlCenter
            end
            object DTP2Muestreo: TDateTimePicker
              Left = 9
              Top = 23
              Width = 94
              Height = 23
              Date = 41431.422253784720000000
              Time = 41431.422253784720000000
              Enabled = False
              TabOrder = 1
              OnExit = GetEvent
            end
            object DBLCBAResultadoTrico2Muestreo: TDBLookupComboBoxAuto
              Left = 185
              Top = 99
              Width = 129
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DSGenericosEspecial22
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object DBLCBAResultadoCampi2Muestreo: TDBLookupComboBoxAuto
              Left = 185
              Top = 76
              Width = 129
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DSGenericosEspecial21
              TabOrder = 3
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object DBLCBAResultado2Muestreo: TDBLookupComboBoxAuto
              Left = 185
              Top = 53
              Width = 129
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DSResult2Muestreo
              TabOrder = 4
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object MObs2Muestreo: TMemo
              Left = 8
              Top = 130
              Width = 305
              Height = 25
              Enabled = False
              TabOrder = 5
              OnExit = GetEvent
            end
          end
          object GBSangrado: TJvGroupBox
            Left = 658
            Top = 220
            Width = 321
            Height = 161
            Caption = 'Sangrado para Brucelosis'
            TabOrder = 6
            Checkable = True
            Checked = True
            PropagateEnable = True
            object Label10: TLabel
              Left = 10
              Top = 57
              Width = 63
              Height = 15
              Caption = 'Resultado: '
              Enabled = False
              Layout = tlCenter
            end
            object DTPSangrado: TDateTimePicker
              Left = 9
              Top = 23
              Width = 94
              Height = 23
              Date = 41431.422253784720000000
              Time = 41431.422253784720000000
              Enabled = False
              TabOrder = 1
              OnExit = GetEvent
            end
            object DBLCBAResultadoSangrado: TDBLookupComboBoxAuto
              Left = 111
              Top = 53
              Width = 202
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DSResultSangrado
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object MObsSangrado: TMemo
              Left = 8
              Top = 92
              Width = 305
              Height = 53
              Enabled = False
              TabOrder = 3
              OnExit = GetEvent
            end
          end
          object GBTuberculinizacion: TJvGroupBox
            Left = 8
            Top = 382
            Width = 321
            Height = 161
            Caption = 'Tuberculinizaci'#243'n'
            TabOrder = 7
            Checkable = True
            Checked = True
            PropagateEnable = True
            object Label11: TLabel
              Left = 10
              Top = 57
              Width = 63
              Height = 15
              Caption = 'Resultado: '
              Enabled = False
              Layout = tlCenter
            end
            object DTPTuberculina: TDateTimePicker
              Left = 9
              Top = 23
              Width = 94
              Height = 23
              Date = 41431.422253784720000000
              Time = 41431.422253784720000000
              Enabled = False
              TabOrder = 1
              OnExit = GetEvent
            end
            object DBLCBAResultadoTuberculina: TDBLookupComboBoxAuto
              Left = 111
              Top = 53
              Width = 202
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DSResultTuberculina
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object MObsTuberculina: TMemo
              Left = 8
              Top = 91
              Width = 305
              Height = 54
              Enabled = False
              TabOrder = 3
              OnExit = GetEvent
            end
          end
          object GBCapacidadServicio: TJvGroupBox
            Left = 333
            Top = 382
            Width = 321
            Height = 161
            Caption = 'Capacidad de Servicio'
            TabOrder = 8
            Checkable = True
            Checked = True
            PropagateEnable = True
            object LMetodologia: TLabel
              Left = 129
              Top = 24
              Width = 80
              Height = 22
              AutoSize = False
              Caption = 'Metodolog'#237'a: '
              Enabled = False
              Layout = tlCenter
            end
            object Label12: TLabel
              Left = 11
              Top = 66
              Width = 31
              Height = 15
              Caption = 'Valor:'
              Enabled = False
            end
            object LTipo: TLabel
              Left = 11
              Top = 83
              Width = 62
              Height = 23
              AutoSize = False
              Caption = 'Resultado: '
              Enabled = False
              Layout = tlCenter
            end
            object DTPCapacidadServicio: TDateTimePicker
              Left = 8
              Top = 24
              Width = 94
              Height = 23
              Date = 41431.422253784720000000
              Time = 41431.422253784720000000
              Enabled = False
              TabOrder = 1
              OnExit = GetEvent
            end
            object RB10: TRadioButton
              Left = 203
              Top = 27
              Width = 44
              Height = 18
              Caption = '10'#39
              Enabled = False
              TabOrder = 2
              OnEnter = GetEvent
            end
            object RB20: TRadioButton
              Left = 250
              Top = 27
              Width = 44
              Height = 18
              Caption = '20'#39
              Enabled = False
              TabOrder = 3
              OnEnter = GetEvent
            end
            object DBLCBAValorCapServicio: TDBLookupComboBoxAuto
              Left = 100
              Top = 61
              Width = 205
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_VALOR_CAPACIDAD'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSValorCapacidad
              TabOrder = 4
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBATipoCapServicio: TDBLookupComboBoxAuto
              Left = 100
              Top = 83
              Width = 205
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DSResultCapacidadServicio
              TabOrder = 5
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object MObsCapacidadServicio: TMemo
              Left = 8
              Top = 111
              Width = 305
              Height = 25
              Enabled = False
              TabOrder = 6
            end
          end
          object GBCalidadSeminal: TJvGroupBox
            Left = 658
            Top = 382
            Width = 321
            Height = 161
            Caption = 'Calidad Seminal'
            TabOrder = 9
            Checkable = True
            Checked = True
            PropagateEnable = True
            object Label13: TLabel
              Left = 13
              Top = 84
              Width = 63
              Height = 15
              Caption = 'Resultado: '
              Enabled = False
            end
            object LMetodoToma: TLabel
              Left = 12
              Top = 57
              Width = 78
              Height = 23
              AutoSize = False
              Caption = 'M'#233'todo Toma: '
              Enabled = False
              Layout = tlCenter
            end
            object DTPCalidadSeminal: TDateTimePicker
              Left = 8
              Top = 24
              Width = 94
              Height = 23
              Date = 41431.422253784720000000
              Time = 41431.422253784720000000
              Enabled = False
              TabOrder = 1
              OnExit = GetEvent
            end
            object DBLCBAResultadoCalidadSemen: TDBLookupComboBoxAuto
              Left = 96
              Top = 81
              Width = 209
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CODIGO'
              ListField = 'VALOR'
              ListSource = DSResultCalidadSemen
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAMetodoTomaCalidadSemen: TDBLookupComboBoxAuto
              Left = 96
              Top = 57
              Width = 209
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_METODO_TOMA'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSMetodo
              TabOrder = 3
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object MObsCalidadSeminal: TMemo
              Left = 8
              Top = 111
              Width = 305
              Height = 25
              Enabled = False
              TabOrder = 4
            end
          end
          object GBCC: TJvGroupBox
            Left = 8
            Top = 59
            Width = 321
            Height = 161
            Caption = 'Condici'#243'n Corporal'
            TabOrder = 10
            Checkable = True
            Checked = True
            PropagateEnable = True
            object Label14: TLabel
              Left = 10
              Top = 57
              Width = 113
              Height = 15
              Caption = 'Condici'#243'n Corporal: '
              Enabled = False
              Layout = tlCenter
            end
            object DTPCC: TDateTimePicker
              Left = 9
              Top = 23
              Width = 94
              Height = 23
              Date = 41431.422253784720000000
              Time = 41431.422253784720000000
              Enabled = False
              TabOrder = 0
              OnExit = GetEvent
            end
            object MObsCC: TMemo
              Left = 8
              Top = 91
              Width = 305
              Height = 54
              Enabled = False
              TabOrder = 1
              OnExit = GetEvent
            end
            object DBLCBACC: TDBLookupComboBoxAuto
              Left = 127
              Top = 53
              Width = 182
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_CONDICION_CORPORAL'
              ListField = 'VALOR'
              ListSource = DSCC
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
          end
          object CBCE: TCheckBox
            Left = 340
            Top = 57
            Width = 151
            Height = 17
            Caption = 'Circunferencia Escrotal'
            TabOrder = 11
            OnClick = CBCEClick
          end
          object CBExClinic: TCheckBox
            Left = 664
            Top = 57
            Width = 109
            Height = 17
            Caption = 'Examen Cl'#237'nico'
            TabOrder = 12
            OnClick = CBExClinicClick
          end
          object CB1Muest: TCheckBox
            Left = 16
            Top = 219
            Width = 212
            Height = 17
            Caption = '1'#186' Muestreo de Toros por Venereas'
            TabOrder = 13
            OnClick = CB1MuestClick
          end
          object CB2Muest: TCheckBox
            Left = 340
            Top = 219
            Width = 213
            Height = 17
            Caption = '2'#186' Muestreo de Toros por Venereas'
            TabOrder = 14
            OnClick = CB2MuestClick
          end
          object CBSangrado: TCheckBox
            Left = 666
            Top = 219
            Width = 167
            Height = 17
            Caption = 'Sangrado para Brucelosis'
            TabOrder = 15
            OnClick = CBSangradoClick
          end
          object CBTuberc: TCheckBox
            Left = 16
            Top = 381
            Width = 121
            Height = 17
            Caption = 'Tuberculinizaci'#243'n'
            TabOrder = 16
            OnClick = CBTubercClick
          end
          object CBCapServ: TCheckBox
            Left = 340
            Top = 382
            Width = 149
            Height = 17
            Caption = 'Capacidad de Servicio'
            TabOrder = 17
            OnClick = CBCapServClick
          end
          object CBCS: TCheckBox
            Left = 665
            Top = 382
            Width = 120
            Height = 17
            Caption = 'Calidad Seminal'
            TabOrder = 18
            OnClick = CBCSClick
          end
          object CBCC: TCheckBox
            Left = 15
            Top = 58
            Width = 130
            Height = 17
            Caption = 'Condici'#243'n Corporal'
            TabOrder = 19
            OnClick = CBCCClick
          end
        end
        inherited GBObservaciones: TGroupBox
          Left = 1080
          Top = 424
          Height = 33
          Align = alCustom
          Visible = False
          inherited MAObservacion: TMemoAuto
            Height = 14
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Width = 905
          Height = 411
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              Title.Caption = 'RP'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Caption = 'Fecha Revisaci'#243'n'
              Visible = False
            end
            item
              Color = clBlack
              Expanded = False
              Title.Caption = '-'
              Title.Color = clBackground
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'D8'
              Title.Caption = 'Fecha CC'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V17'
              Title.Caption = 'CC'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION8'
              Title.Caption = 'Observaci'#243'n'
              Visible = False
            end
            item
              Color = clBlack
              Expanded = False
              Title.Caption = '-'
              Title.Color = clBlack
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'D4'
              Title.Caption = 'Fecha Med. Circunferencia'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'VUNO1'
              Title.Caption = 'A los 18 Meses'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'F1'
              Title.Caption = 'C.E.'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION3'
              Title.Caption = 'Observaci'#243'n'
              Visible = False
            end
            item
              Color = clBlack
              Expanded = False
              Title.Caption = '-'
              Title.Color = clBlack
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'D1'
              Title.Caption = 'Fecha de Examen Clinico'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V2'
              Title.Caption = 'Examen Cl'#237'nico'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V1'
              Title.Caption = 'Metodo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V3'
              Title.Caption = 'Causa'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Visible = False
            end
            item
              Color = clBlack
              Expanded = False
              Title.Caption = '-'
              Title.Color = clBlack
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'D2'
              Title.Caption = 'Fecha 1'#186' Toma'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V4'
              Title.Caption = '1'#186' Muestreo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V5'
              Title.Caption = 'Campilobacteriosis'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V6'
              Title.Caption = 'Tricomoniasis'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION1'
              Title.Caption = 'Observaci'#243'n'
              Visible = False
            end
            item
              Color = clBlack
              Expanded = False
              Title.Caption = '-'
              Title.Color = clBlack
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'D3'
              Title.Caption = 'Fecha 2'#186' Toma'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V7'
              Title.Caption = '2'#186' Muestreo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V8'
              Title.Caption = 'Campilobacteriosis'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V9'
              Title.Caption = 'Tricomoniasis'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION2'
              Title.Caption = 'Observaci'#243'n'
              Visible = False
            end
            item
              Color = clBlack
              Expanded = False
              Title.Caption = '-'
              Title.Color = clBlack
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'D5'
              Title.Caption = 'Fecha Brucelosis'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V10'
              Title.Caption = 'Brucelosis'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION4'
              Title.Caption = 'Observaci'#243'n'
              Visible = False
            end
            item
              Color = clBlack
              Expanded = False
              Title.Caption = '-'
              Title.Color = clBlack
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'D6'
              Title.Caption = 'Fecha Tuberculinizaci'#243'n'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V11'
              Title.Caption = 'Tuberculosis'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION5'
              Title.Caption = 'Observaci'#243'n'
              Visible = False
            end
            item
              Color = clBlack
              Expanded = False
              Title.Caption = '-'
              Title.Color = clBlack
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'D7'
              Title.Caption = 'Fecha Cap. Servicio'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V13'
              Title.Caption = 'Cap. Servicio'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V16'
              Title.Caption = 'Metodo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V12'
              Title.Caption = 'Valor'
              Visible = False
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'OBSERVACION6'
              Title.Caption = 'Observaci'#243'n'
              Visible = False
            end
            item
              Color = clBlack
              Expanded = False
              Title.Caption = '-'
              Title.Color = clBlack
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'D8'
              Title.Caption = 'Fecha Calidad Semen'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V15'
              Title.Caption = 'Calidad Seminal'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V14'
              Title.Caption = 'Metodo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION7'
              Title.Caption = 'Observaci'#243'n'
              Visible = False
            end>
        end
        inherited PanelIzq: TPanel
          Height = 411
        end
        inherited PanelDer: TPanel
          Left = 952
          Height = 411
        end
      end
    end
    inherited PBotones: TPanel
      Top = 453
      Width = 1008
      inherited SBSelTodos: TSpeedButton
        Left = 458
      end
      inherited IFondoB2: TImage
        Width = 582
      end
      inherited BBCancelar: TBitBtn
        Left = 510
      end
      inherited BBAnterior: TBitBtn
        Left = 576
      end
      inherited BBSiguiente: TBitBtn
        Left = 682
      end
      inherited BBTerminar: TBitBtn
        Left = 780
      end
      inherited PL: TPanel
        Left = 582
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1008
    Caption = 'Revisaci'#243'n cl'#237'nica y sanitaria de toros'
    inherited LTitulo: TLabel
      Width = 604
      Caption = 'Revisaci'#243'n cl'#237'nica y sanitaria de toros'
    end
    inherited PILeft: TPanel
      Left = 800
    end
  end
  inherited Psocalo: TPanel
    Top = 713
    Width = 1008
    inherited JvSocalo: TJvImage
      Width = 1008
    end
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_RP, ID_ANIMAL, FECHA, D1, D2, D3, D4, D5, D6, D7, D8, I1, ' +
        'V1, VUNO2, '
      
        '   V2, I3, V3, VUNO4, V4, VUNO5, V5, VUNO6, V6, VUNO7, V7, VUNO8' +
        ', V8, VUNO9, '
      
        '   V9, VUNO10, V10, VUNO11, V11, I12, V12, VUNO13, V13, I14, V14' +
        ', VUNO12, '
      
        '   V15, OBSERVACION, OBSERVACION1, OBSERVACION2, OBSERVACION3, O' +
        'BSERVACION4, '
      
        '   OBSERVACION5, OBSERVACION6, OBSERVACION7, VUNO1, VUNO14, V16,' +
        ' RESPONSABLE, '
      '   NOMBRE, F1, D9, I16, V17, OBSERVACION8, EW)'
      'values'
      
        '  (:ID_RP, :ID_ANIMAL, :FECHA, :D1, :D2, :D3, :D4, :D5, :D6, :D7' +
        ', :D8, '
      
        '   :I1, :V1, :VUNO2, :V2, :I3, :V3, :VUNO4, :V4, :VUNO5, :V5, :V' +
        'UNO6, :V6, '
      
        '   :VUNO7, :V7, :VUNO8, :V8, :VUNO9, :V9, :VUNO10, :V10, :VUNO11' +
        ', :V11, '
      
        '   :I12, :V12, :VUNO13, :V13, :I14, :V14, :VUNO12, :V15, :OBSERV' +
        'ACION, '
      
        '   :OBSERVACION1, :OBSERVACION2, :OBSERVACION3, :OBSERVACION4, :' +
        'OBSERVACION5, '
      
        '   :OBSERVACION6, :OBSERVACION7, :VUNO1, :VUNO14, :V16, :RESPONS' +
        'ABLE, :NOMBRE, '
      '   :F1, :D9, :I16, :V17, :OBSERVACION8, :EW)')
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
      '  V14,'
      '  D4,'
      '  D5,'
      '  D6,'
      '  D7,'
      '  I11,'
      '  I12,'
      '  I13,'
      '  I14,'
      '  I15,'
      '  V15,'
      '  OBSERVACION1,'
      '  OBSERVACION6,'
      '  OBSERVACION7,'
      '  D8,'
      '  V16,'
      '  VUNO7,'
      '  VUNO8,'
      '  VUNO9,'
      '  VUNO10,'
      '  VUNO11,'
      '  VUNO12,'
      '  VUNO13,'
      '  VUNO14,'
      '  I16,'
      '  V17,'
      '  OBSERVACION8,'
      '  D9'
      'from AUX_EVENTOS '
      'where'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_ANIMAL, FECHA, D1, D2, D3, D4, D5, D6, D7,D8, ' +
        'I1, V1, vuno2, V2, I3,V3,vuno4,V4,vuno5,V5,vuno6,V6,vuno7,V7,vun' +
        'o8,V8,vuno9,V9,vuno10,V10,vuno11,V11,I12,V12,vuno13,V13,I14,V14,' +
        'vuno12,V15,OBSERVACION,OBSERVACION1,OBSERVACION2,OBSERVACION3,OB' +
        'SERVACION4,OBSERVACION5,OBSERVACION6,OBSERVACION7,VUNO1,VUNO14,V' +
        '16,RESPONSABLE,NOMBRE,F1,D9,I16,V17,OBSERVACION8,EW from AUX_EVE' +
        'NTOS '
      '')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_RP = :ID_RP,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  FECHA = :FECHA,'
      '  D1 = :D1,'
      '  D2 = :D2,'
      '  D3 = :D3,'
      '  D4 = :D4,'
      '  D5 = :D5,'
      '  D6 = :D6,'
      '  D7 = :D7,'
      '  D8 = :D8,'
      '  I1 = :I1,'
      '  V1 = :V1,'
      '  VUNO2 = :VUNO2,'
      '  V2 = :V2,'
      '  I3 = :I3,'
      '  V3 = :V3,'
      '  VUNO4 = :VUNO4,'
      '  V4 = :V4,'
      '  VUNO5 = :VUNO5,'
      '  V5 = :V5,'
      '  VUNO6 = :VUNO6,'
      '  V6 = :V6,'
      '  VUNO7 = :VUNO7,'
      '  V7 = :V7,'
      '  VUNO8 = :VUNO8,'
      '  V8 = :V8,'
      '  VUNO9 = :VUNO9,'
      '  V9 = :V9,'
      '  VUNO10 = :VUNO10,'
      '  V10 = :V10,'
      '  VUNO11 = :VUNO11,'
      '  V11 = :V11,'
      '  I12 = :I12,'
      '  V12 = :V12,'
      '  VUNO13 = :VUNO13,'
      '  V13 = :V13,'
      '  I14 = :I14,'
      '  V14 = :V14,'
      '  VUNO12 = :VUNO12,'
      '  V15 = :V15,'
      '  OBSERVACION = :OBSERVACION,'
      '  OBSERVACION1 = :OBSERVACION1,'
      '  OBSERVACION2 = :OBSERVACION2,'
      '  OBSERVACION3 = :OBSERVACION3,'
      '  OBSERVACION4 = :OBSERVACION4,'
      '  OBSERVACION5 = :OBSERVACION5,'
      '  OBSERVACION6 = :OBSERVACION6,'
      '  OBSERVACION7 = :OBSERVACION7,'
      '  VUNO1 = :VUNO1,'
      '  VUNO14 = :VUNO14,'
      '  V16 = :V16,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  NOMBRE = :NOMBRE,'
      '  F1 = :F1,'
      '  D9 = :D9,'
      '  I16 = :I16,'
      '  V17 = :V17,'
      '  OBSERVACION8 = :OBSERVACION8,'
      '  EW = :EW'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    object IBDSSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_EVENTOS.ID_RP'
      Size = 10
    end
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
    end
    object IBDSSimpleD1: TDateField
      FieldName = 'D1'
      Origin = 'AUX_EVENTOS.D1'
    end
    object IBDSSimpleD2: TDateField
      FieldName = 'D2'
      Origin = 'AUX_EVENTOS.D2'
    end
    object IBDSSimpleD3: TDateField
      FieldName = 'D3'
      Origin = 'AUX_EVENTOS.D3'
    end
    object IBDSSimpleD4: TDateField
      FieldName = 'D4'
      Origin = 'AUX_EVENTOS.D4'
    end
    object IBDSSimpleD5: TDateField
      FieldName = 'D5'
      Origin = 'AUX_EVENTOS.D5'
    end
    object IBDSSimpleD6: TDateField
      FieldName = 'D6'
      Origin = 'AUX_EVENTOS.D6'
    end
    object IBDSSimpleD7: TDateField
      FieldName = 'D7'
      Origin = 'AUX_EVENTOS.D7'
    end
    object IBDSSimpleD8: TDateField
      FieldName = 'D8'
      Origin = 'AUX_EVENTOS.D8'
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO2: TIBStringField
      FieldName = 'VUNO2'
      Origin = 'AUX_EVENTOS.VUNO2'
      Size = 1
    end
    object IBDSSimpleV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleI3: TIntegerField
      FieldName = 'I3'
      Origin = 'AUX_EVENTOS.I3'
    end
    object IBDSSimpleV3: TIBStringField
      FieldName = 'V3'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO4: TIBStringField
      FieldName = 'VUNO4'
      Origin = 'AUX_EVENTOS.VUNO4'
      Size = 1
    end
    object IBDSSimpleV4: TIBStringField
      FieldName = 'V4'
      Origin = 'AUX_EVENTOS.V4'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO5: TIBStringField
      FieldName = 'VUNO5'
      Origin = 'AUX_EVENTOS.VUNO5'
      Size = 1
    end
    object IBDSSimpleV5: TIBStringField
      FieldName = 'V5'
      Origin = 'AUX_EVENTOS.V5'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO6: TIBStringField
      FieldName = 'VUNO6'
      Origin = 'AUX_EVENTOS.VUNO6'
      Size = 1
    end
    object IBDSSimpleV6: TIBStringField
      FieldName = 'V6'
      Origin = 'AUX_EVENTOS.V6'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO7: TIBStringField
      FieldName = 'VUNO7'
      Origin = 'AUX_EVENTOS.VUNO7'
      Size = 1
    end
    object IBDSSimpleV7: TIBStringField
      FieldName = 'V7'
      Origin = 'AUX_EVENTOS.V7'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO8: TIBStringField
      FieldName = 'VUNO8'
      Origin = 'AUX_EVENTOS.VUNO8'
      Size = 1
    end
    object IBDSSimpleV8: TIBStringField
      FieldName = 'V8'
      Origin = 'AUX_EVENTOS.V8'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO9: TIBStringField
      FieldName = 'VUNO9'
      Origin = 'AUX_EVENTOS.VUNO9'
      Size = 1
    end
    object IBDSSimpleV9: TIBStringField
      FieldName = 'V9'
      Origin = 'AUX_EVENTOS.V9'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO10: TIBStringField
      FieldName = 'VUNO10'
      Origin = 'AUX_EVENTOS.VUNO10'
      Size = 1
    end
    object IBDSSimpleV10: TIBStringField
      FieldName = 'V10'
      Origin = 'AUX_EVENTOS.V10'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO11: TIBStringField
      FieldName = 'VUNO11'
      Origin = 'AUX_EVENTOS.VUNO11'
      Size = 1
    end
    object IBDSSimpleV11: TIBStringField
      FieldName = 'V11'
      Origin = 'AUX_EVENTOS.V11'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleI12: TIntegerField
      FieldName = 'I12'
      Origin = 'AUX_EVENTOS.I12'
    end
    object IBDSSimpleV12: TIBStringField
      FieldName = 'V12'
      Origin = 'AUX_EVENTOS.V12'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO13: TIBStringField
      FieldName = 'VUNO13'
      Origin = 'AUX_EVENTOS.VUNO13'
      Size = 1
    end
    object IBDSSimpleV13: TIBStringField
      FieldName = 'V13'
      Origin = 'AUX_EVENTOS.V13'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleI14: TIntegerField
      FieldName = 'I14'
      Origin = 'AUX_EVENTOS.I14'
    end
    object IBDSSimpleV14: TIBStringField
      FieldName = 'V14'
      Origin = 'AUX_EVENTOS.V14'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleVUNO12: TIBStringField
      FieldName = 'VUNO12'
      Origin = 'AUX_EVENTOS.VUNO12'
      Size = 1
    end
    object IBDSSimpleV15: TIBStringField
      FieldName = 'V15'
      Origin = 'AUX_EVENTOS.V15'
      OnSetText = IBDSSimpleV1SetText
      Size = 255
    end
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      Size = 255
    end
    object IBDSSimpleOBSERVACION1: TIBStringField
      FieldName = 'OBSERVACION1'
      Origin = 'AUX_EVENTOS.OBSERVACION1'
      Size = 255
    end
    object IBDSSimpleOBSERVACION2: TIBStringField
      FieldName = 'OBSERVACION2'
      Origin = 'AUX_EVENTOS.OBSERVACION2'
      Size = 255
    end
    object IBDSSimpleOBSERVACION3: TIBStringField
      FieldName = 'OBSERVACION3'
      Origin = 'AUX_EVENTOS.OBSERVACION3'
      Size = 255
    end
    object IBDSSimpleOBSERVACION4: TIBStringField
      FieldName = 'OBSERVACION4'
      Origin = 'AUX_EVENTOS.OBSERVACION4'
      Size = 255
    end
    object IBDSSimpleOBSERVACION5: TIBStringField
      FieldName = 'OBSERVACION5'
      Origin = 'AUX_EVENTOS.OBSERVACION5'
      Size = 255
    end
    object IBDSSimpleOBSERVACION6: TIBStringField
      FieldName = 'OBSERVACION6'
      Origin = 'AUX_EVENTOS.OBSERVACION6'
      Size = 255
    end
    object IBDSSimpleOBSERVACION7: TIBStringField
      FieldName = 'OBSERVACION7'
      Origin = 'AUX_EVENTOS.OBSERVACION7'
      Size = 255
    end
    object IBDSSimpleVUNO1: TIBStringField
      FieldName = 'VUNO1'
      Origin = 'AUX_EVENTOS.VUNO1'
      Size = 1
    end
    object IBDSSimpleVUNO14: TIBStringField
      FieldName = 'VUNO14'
      Origin = 'AUX_EVENTOS.VUNO14'
      Size = 1
    end
    object IBDSSimpleV16: TIBStringField
      FieldName = 'V16'
      Origin = 'AUX_EVENTOS.V16'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_EVENTOS.NOMBRE'
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleF1: TFloatField
      FieldName = 'F1'
      Origin = 'AUX_EVENTOS.F1'
    end
    object IBDSSimpleI16: TIntegerField
      FieldName = 'I16'
      Origin = 'AUX_EVENTOS.I16'
    end
    object IBDSSimpleV17: TIBStringField
      FieldName = 'V17'
      Origin = 'AUX_EVENTOS.V17'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleOBSERVACION8: TIBStringField
      FieldName = 'OBSERVACION8'
      Origin = 'AUX_EVENTOS.OBSERVACION8'
      Size = 255
    end
    object IBDSSimpleD9: TDateField
      FieldName = 'D9'
      Origin = 'AUX_EVENTOS.D9'
    end
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'ID_ANIMAL'
      end>
  end
  inherited WinXP1: TWinXP
    Left = 632
    Top = 72
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'select * from RN_REVISION_TOROS(:animal)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_REVISION_TOROS('
      ' :FECHA,'
      ' :ANIMAL,'
      ' :ESTABLECIMIENTO,'
      ' :RESPONSABLE,'
      ' :LOG_USUARIO,'
      ' :LOG_FECHA_MODIFICADO,'
      ' :ID_GRUPO,'
      ' NULL,'
      ' :HACE_EXAMEN,'
      ' :FECHA_EXAMEN,'
      ' :RESULTADO_EXAMEN,'
      ' :METODO_EXAMEN,'
      ' :CAUSA_EXAMEN,'
      ' :OBS_EXAMEN,'
      ' :HACE_MUESTREO_1,'
      ' :FECHA_MUESTREO_1,'
      ' :RESULTADO_RASPADO1,'
      ' :RESULTADOCAMPI1,'
      ' :RESULTADOTRICO1,'
      ' :OBS_MUESTREO1,'
      ' :HACE_MUESTREO_2,'
      ' :FECHA_MUESTREO_2,'
      ' :RESULTADO_RASPADO2,'
      ' :RESULTADOCAMPI2,'
      ' :RESULTADOTRICO2,'
      ' :OBS_MUESTREO2,'
      ' :HACE_CIRCUNFERENCIA,'
      ' :FECHA_CIRCUNFERENCIA,'
      ' :VALOR_CIRCUNFERENCIA,'
      ' :ALOS18MESES,'
      ' :OBS_CIRCUNFERENCIA,'
      ' :HACE_SANGRADO,'
      ' :FECHA_SANGRADO,'
      ' :RESULTADO_SANGRADO,'
      ' :OBS_SANGRADO,'
      ' :HACE_TUBERCULINA,'
      ' :FECHA_TUBERCULINA,'
      ' :RESULTADO_TUBERCULINA,'
      ' :OBS_TUBERCULINA,'
      ' :HACE_CALIDAD,'
      ' :FECHA_CALIDAD,'
      ' :RESULTADO_CALIDAD,'
      ' :ID_RESULTADO_CALIDAD,'
      ' :ID_METODO_TOMA,'
      ' :OBS_CALIDAD,'
      ' :HACE_CAPACIDAD,'
      ' :FECHA_CAPACIDAD,'
      ' :METODO_CAPACIDAD,'
      ' :TIPO_CAPACIDAD,'
      ' :VALOR_CAPACIDAD,'
      ' :OBS_CAPACIDAD,'
      ' :HACE_CC,'
      ' :FECHA_CC,'
      ' :ID_CC,'
      ' :OBS_CC)')
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
        Name = 'HACE_EXAMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_EXAMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESULTADO_EXAMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'METODO_EXAMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAUSA_EXAMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS_EXAMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HACE_MUESTREO_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_MUESTREO_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESULTADO_RASPADO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESULTADOCAMPI1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESULTADOTRICO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS_MUESTREO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HACE_MUESTREO_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_MUESTREO_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESULTADO_RASPADO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESULTADOCAMPI2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESULTADOTRICO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS_MUESTREO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HACE_CIRCUNFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CIRCUNFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_CIRCUNFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALOS18MESES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS_CIRCUNFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HACE_SANGRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_SANGRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESULTADO_SANGRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS_SANGRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HACE_TUBERCULINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_TUBERCULINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESULTADO_TUBERCULINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS_TUBERCULINA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HACE_CALIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CALIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESULTADO_CALIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_RESULTADO_CALIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_METODO_TOMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS_CALIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HACE_CAPACIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CAPACIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'METODO_CAPACIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_CAPACIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR_CAPACIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS_CAPACIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HACE_CC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBS_CC'
        ParamType = ptUnknown
      end>
  end
  inherited PLVersion: TPngImageList
    Left = 336
    Top = 40
  end
  inherited JvBHint: TJvBalloonHint
    Left = 425
    Top = 50
  end
  inherited ILVets: TImageList
    Left = 692
    Top = 60
  end
  inherited IBQCarElect: TIBQuery
    Left = 412
    Top = 31
  end
  object IBQResult1Muestreo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) ' +
        'and (ID_CODIGO <> '#39'S'#39') ')
    Left = 532
    Top = 191
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSResult1Muestreo: TDataSource
    DataSet = IBQResult1Muestreo
    Left = 564
    Top = 191
  end
  object IBQResult2Muestreo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) ' +
        'and (ID_CODIGO <> '#39'S'#39') ')
    Left = 860
    Top = 191
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSResult2Muestreo: TDataSource
    DataSet = IBQResult2Muestreo
    Left = 892
    Top = 191
  end
  object IBQResultSangrado: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo)')
    Left = 532
    Top = 351
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSResultSangrado: TDataSource
    DataSet = IBQResultSangrado
    Left = 564
    Top = 351
  end
  object IBQResultTuberculina: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo)')
    Left = 852
    Top = 351
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSResultTuberculina: TDataSource
    DataSet = IBQResultTuberculina
    Left = 884
    Top = 351
  end
  object IBQResultCalidadSemen: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo)')
    Left = 524
    Top = 471
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSResultCalidadSemen: TDataSource
    DataSet = IBQResultCalidadSemen
    Left = 556
    Top = 471
  end
  object IBQResultCapacidadServicio: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo)')
    Left = 228
    Top = 479
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSResultCapacidadServicio: TDataSource
    DataSet = IBQResultCapacidadServicio
    Left = 260
    Top = 479
  end
  object IBQGenericosEspecial11: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) ' +
        'and (ID_CODIGO <>'#39'I'#39') and (ID_CODIGO <> '#39'S'#39')')
    Left = 492
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSGenericosEspecial11: TDataSource
    DataSet = IBQGenericosEspecial11
    Left = 456
    Top = 208
  end
  object IBQGenericosEspecial12: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) ' +
        'and (ID_CODIGO <>'#39'I'#39') and (ID_CODIGO <> '#39'S'#39')')
    Left = 492
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSGenericosEspecial12: TDataSource
    DataSet = IBQGenericosEspecial12
    Left = 456
    Top = 240
  end
  object DSGenericosEspecial21: TDataSource
    DataSet = IBQGenericosEspecial21
    Left = 776
    Top = 216
  end
  object IBQGenericosEspecial21: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) ' +
        'and (ID_CODIGO <>'#39'I'#39') and (ID_CODIGO <> '#39'S'#39')')
    Left = 812
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSGenericosEspecial22: TDataSource
    DataSet = IBQGenericosEspecial22
    Left = 776
    Top = 248
  end
  object IBQGenericosEspecial22: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CODIGO, VALOR from COD_GENERICOS where (TIPO = :tipo) ' +
        'and (ID_CODIGO <>'#39'I'#39') and (ID_CODIGO <> '#39'S'#39')')
    Left = 812
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object IBQCC: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select valor_escala_5 as valor, id_condicion_corporal from cod_c' +
        'ondiciones_corporales')
    Left = 932
    Top = 504
  end
  object DSCC: TDataSource
    DataSet = IBQCC
    Left = 896
    Top = 504
  end
  object IBQMetodoCapServ: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_codigo, valor from cod_genericos where (tipo = '#39'DV'#39') ')
    Left = 734
    Top = 443
  end
  object DSMetodoCapServ: TDataSource
    DataSet = IBQMetodoCapServ
    Left = 766
    Top = 443
  end
end
