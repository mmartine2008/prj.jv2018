inherited FEveActividad: TFEveActividad
  Left = 359
  Top = 22
  Caption = 'FEveActividad'
  Constraints.MinHeight = 746
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
          inherited GBFiltro: TGroupBox
            inherited DBLCBCategoria: TDBLookupComboBoxAuto
              OnCloseUp = MSimpleDBLCBCategoriaCloseUp
            end
            inherited CBCategoria: TCheckBox
              OnClick = MSimpleCBCategoriaClick
            end
            inherited CBxRaza: TComboBox
              OnChange = CBxRazaChange
            end
          end
          inherited PSeleccion: TPanel
            inherited GBDisponibles: TGroupBox
              Width = 457
              Height = 215
              inherited IFondoDis: TImage
                Width = 453
                Height = 196
              end
              inherited BDBGDisponibles: TBitDBGrid
                Width = 453
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
                    Title.Caption = 'SENASA'
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Left = 565
              Width = 437
              Height = 215
              inherited IFondoSel: TImage
                Width = 433
                Height = 196
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 433
                Height = 196
                TitleFont.Height = -14
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
              Left = 457
              Height = 215
              inherited IFondo: TImage
                Height = 215
              end
              inherited BBAgregarTodos: TJvImage
                OnClick = MSimpleBBAgregarTodosClick
              end
              inherited BBAgregarUno: TJvImage
                OnClick = MSimpleBBAgregarUnoClick
              end
            end
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
              '  VUNO2,'
              '  SUBCATEGORIA,'
              '  V14'
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
          Height = 337
          object LFecha: TLabel
            Left = 100
            Top = 31
            Width = 40
            Height = 15
            Caption = 'Fecha: '
            Layout = tlCenter
          end
          object LResponsable: TLabel
            Left = 65
            Top = 76
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
          object DTPAFecha: TDateTimePickerAuto
            Left = 153
            Top = 23
            Width = 236
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
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 153
            Top = 69
            Width = 236
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
          object GBSubcat: TGroupBox
            Left = 476
            Top = 13
            Width = 449
            Height = 104
            Caption = 'Cambio de Tipo de registro'
            TabOrder = 2
            object LSubCat: TLabel
              Left = 37
              Top = 44
              Width = 89
              Height = 15
              Cursor = crHandPoint
              Caption = 'Tipo de registro:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LSubCatClick
              OnMouseEnter = LSubCatMouseEnter
              OnMouseLeave = LSubCatMouseLeave
            end
            object DBLCBASubCategoria: TDBLookupComboBoxAuto
              Left = 141
              Top = 42
              Width = 237
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_SUBCATEGORIA'
              ListField = 'SINONIMO'
              ListSource = DSSubCategoriaRaza
              TabOrder = 0
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = True
            end
            object CBSubCat: TCheckBox
              Left = 17
              Top = 43
              Width = 17
              Height = 18
              Caption = 'SubCategor'#237'a '
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              State = cbChecked
              TabOrder = 1
              OnClick = CBSubCatClick
            end
          end
          object GBActividad: TGroupBox
            Left = 476
            Top = 116
            Width = 449
            Height = 104
            Caption = 'Cambio de Actividad'
            TabOrder = 3
            object LCodigoManejo: TLabel
              Left = 25
              Top = 73
              Width = 86
              Height = 15
              Cursor = crHandPoint
              Caption = 'C'#243'digo Manejo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              Layout = tlCenter
              Visible = False
              OnClick = LCodigoManejoClick
              OnMouseEnter = LResponsableMouseEnter
              OnMouseLeave = LResponsableMouseLeave
            end
            object LActividad: TLabel
              Left = 40
              Top = 36
              Width = 48
              Height = 15
              Cursor = crHandPoint
              Caption = 'Actividad'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LActividadClick
              OnMouseEnter = LActividadMouseEnter
              OnMouseLeave = LActividadMouseLeave
            end
            object DBLCBACodigoManejo: TDBLookupComboBoxAuto
              Left = 120
              Top = 69
              Width = 236
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_CODIGO_MANEJO'
              ListField = 'SINONIMO'
              ListSource = DMSoftvet.DSCodigosManejo
              TabOrder = 0
              Visible = False
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object DBLCBAActividad: TDBLookupComboBoxAuto
              Left = 106
              Top = 33
              Width = 216
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_ACTIVIDAD'
              ListField = 'SINONIMO'
              ListSource = DMSoftvet.DSActividad
              TabOrder = 1
              OnCloseUp = DBLCBAActividadCloseUp
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object CBActividad: TCheckBox
              Left = 19
              Top = 34
              Width = 17
              Height = 19
              Caption = 'Actividad'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              TabOrder = 2
              OnClick = CBSubCatClick
            end
          end
          object GBInspeccion: TGroupBox
            Left = 50
            Top = 116
            Width = 372
            Height = 104
            Caption = 'Inspecci'#243'n'
            TabOrder = 4
            object LDestino: TLabel
              Left = 30
              Top = 73
              Width = 46
              Height = 15
              Cursor = crHandPoint
              Caption = 'Destino:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              Layout = tlCenter
              OnClick = LDestinoClick
              OnMouseEnter = LDestinoMouseEnter
              OnMouseLeave = LDestinoMouseLeave
            end
            object LResult: TLabel
              Left = 45
              Top = 36
              Width = 60
              Height = 15
              Cursor = crHandPoint
              Caption = 'Resultado:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LResultClick
              OnMouseEnter = LResultMouseEnter
              OnMouseLeave = LResultMouseLeave
            end
            object DBLCBACodDestCabania: TDBLookupComboBoxAuto
              Left = 81
              Top = 69
              Width = 237
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_DEST_CABANIA'
              ListField = 'SINONIMO'
              ListSource = DMSoftvet.DSCodDestCabania
              TabOrder = 0
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object DBLCBAInspeccion: TDBLookupComboBoxAuto
              Left = 111
              Top = 33
              Width = 216
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_INSPECCION'
              ListField = 'SINONIMO'
              ListSource = DMSoftvet.DSInspeccion
              TabOrder = 1
              OnClick = DBLCBAInspeccionClick
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object CBInspeccion: TCheckBox
              Left = 24
              Top = 34
              Width = 17
              Height = 19
              Caption = 'Inspecci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              TabOrder = 2
              OnClick = CBSubCatClick
            end
          end
          object GBSubcategoria: TGroupBox
            Left = 477
            Top = 219
            Width = 448
            Height = 104
            Caption = 'Subcategor'#237'a'
            TabOrder = 5
            object LSubcategorizacion: TLabel
              Left = 45
              Top = 52
              Width = 76
              Height = 15
              Cursor = crHandPoint
              Caption = 'Subcategor'#237'a:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LSubcategorizacionClick
              OnMouseEnter = LSubcategorizacionMouseEnter
              OnMouseLeave = LSubcategorizacionMouseLeave
            end
            object DBLCBASubcategorizacion: TDBLookupComboBoxAuto
              Left = 135
              Top = 49
              Width = 216
              Height = 23
              Color = clWhite
              DropDownRows = 20
              Enabled = False
              KeyField = 'ID_SUBCATEGORIZACION'
              ListField = 'NOMBRE'
              ListSource = DSSubcategorizacion
              TabOrder = 0
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object CBSubcategorizacion: TCheckBox
              Left = 24
              Top = 50
              Width = 17
              Height = 19
              Caption = 'Inspecci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              TabOrder = 1
              OnClick = CBSubCatClick
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 344
          Height = 60
          Align = alNone
          inherited MAObservacion: TMemoAuto
            Height = 41
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Caption = 'Fecha'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RP'
              Title.Caption = 'RP'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVIDAD'
              Title.Caption = 'Actividad'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBCAT'
              Title.Caption = 'Tipo de registro'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODMAN'
              Title.Caption = 'C'#243'digo Manejo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'INSP'
              Title.Caption = 'Inspecci'#243'n'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DEST'
              Title.Caption = 'Destino'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V7'
              Title.Caption = 'Subcategorizaci'#243'n'
              Width = 114
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 151
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
    Caption = 'Actividad - Registro - Inspecci'#243'n'
    inherited LTitulo: TLabel
      Caption = 'Actividad - Registro - Inspecci'#243'n'
    end
  end
  inherited ALUniversal: TActionList
    Left = 707
    Top = 38
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Top = 65535
  end
  inherited DSSimple: TDataSource
    Left = 112
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (V8, V10, V7, V6, V5, ID_SENASA, V9, V11, ID_RP, FECHA, OBSERV' +
        'ACION, '
      
        '   RESPONSABLE, V1, V2, NOMBRE, V3, V4, I1, I2, I3, D1, D2, D3, ' +
        'ID_ANIMAL, '
      
        '   ID_AUX_EVENTO, I4, I5, I6, I7, I8, I9, VUNO1, VUNO2, VUNO3, V' +
        'UNO4, VUNO5, '
      '   VUNO6, EW, H1, V12, F1, F2, F3, F4, F5)'
      'values'
      
        '  (:V8, :V10, :V7, :V6, :V5, :ID_SENASA, :V9, :V11, :ID_RP, :FEC' +
        'HA, '
      ':OBSERVACION, '
      
        '   :RESPONSABLE, :V1, :V2, :NOMBRE, :V3, :V4, :I1, :I2, :I3, :D1' +
        ', :D2, '
      
        '   :D3, :ID_ANIMAL, :ID_AUX_EVENTO, :I4, :I5, :I6, :I7, :I8, :I9' +
        ', :VUNO1, '
      
        '   :VUNO2, :VUNO3, :VUNO4, :VUNO5, :VUNO6, :EW, :H1, :V12, :F1, ' +
        ':F2, :F3, '
      '   :F4, :F5)')
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
      '  F5'
      'from AUX_EVENTOS '
      'where'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO')
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, D1 AS FECHA, R' +
        'ESPONSABLE,  I1 AS ACT,V2  AS RESP, V3 as ACTIVIDAD, EW, I2 AS S' +
        'UBCATEGORIA, V1 AS SUBCAT, I4 AS CODIGOMANEJO, V4 AS CODMAN, I5 ' +
        'AS INSPECCION, V5 AS INSP, I6 AS DESTINO, V6 AS DEST, I7, V7 fro' +
        'm AUX_EVENTOS ')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  V8 = :V8,'
      '  V10 = :V10,'
      '  V7 = :V7,'
      '  V6 = :V6,'
      '  V5 = :V5,'
      '  ID_SENASA = :ID_SENASA,'
      '  V9 = :V9,'
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
      '  H1 = :H1,'
      '  V12 = :V12,'
      '  F1 = :F1,'
      '  F2 = :F2,'
      '  F3 = :F3,'
      '  F4 = :F4,'
      '  F5 = :F5'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    Left = 132
    Top = 78
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
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleACT: TIntegerField
      FieldName = 'ACT'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V2'
      OnChange = IBDSSimpleRESPChange
      OnSetText = IBDSSimpleRESPSetText
      Size = 100
    end
    object IBDSSimpleACTIVIDAD: TIBStringField
      FieldName = 'ACTIVIDAD'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = IBDSSimpleACTIVIDADSetText
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleSUBCATEGORIA: TIntegerField
      FieldName = 'SUBCATEGORIA'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleSUBCAT: TIBStringField
      FieldName = 'SUBCAT'
      Origin = 'AUX_EVENTOS.V1'
      OnChange = IBDSSimpleSUBCATChange
      OnSetText = IBDSSimpleSUBCATSetText
      Size = 100
    end
    object IBDSSimpleCODIGOMANEJO: TIntegerField
      FieldName = 'CODIGOMANEJO'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleCODMAN: TIBStringField
      FieldName = 'CODMAN'
      Origin = 'AUX_EVENTOS.V4'
      OnChange = IBDSSimpleCODMANChange
      OnSetText = IBDSSimpleCODMANSetText
      Size = 100
    end
    object IBDSSimpleINSPECCION: TIntegerField
      FieldName = 'INSPECCION'
      Origin = 'AUX_EVENTOS.I5'
    end
    object IBDSSimpleINSP: TIBStringField
      FieldName = 'INSP'
      Origin = 'AUX_EVENTOS.V5'
      OnChange = IBDSSimpleINSPChange
      OnSetText = IBDSSimpleINSPSetText
      Size = 100
    end
    object IBDSSimpleDESTINO: TIntegerField
      FieldName = 'DESTINO'
      Origin = 'AUX_EVENTOS.I6'
    end
    object IBDSSimpleDEST: TIBStringField
      FieldName = 'DEST'
      Origin = 'AUX_EVENTOS.V6'
      OnChange = IBDSSimpleDESTChange
      OnSetText = IBDSSimpleDESTSetText
      Size = 100
    end
    object IBDSSimpleI7: TIntegerField
      FieldName = 'I7'
      Origin = 'AUX_EVENTOS.I7'
    end
    object IBDSSimpleV7: TIBStringField
      FieldName = 'V7'
      Origin = 'AUX_EVENTOS.V7'
      OnChange = IBDSSimpleV7Change
      OnSetText = IBDSSimpleV7SetText
      Size = 100
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 672
    Top = 38
  end
  inherited IBQValidaciones: TIBQuery
    Left = 772
    Top = 8
  end
  inherited IBQEvento: TIBQuery
    Top = 6
  end
  inherited SDXLS: TSaveDialog
    Left = 222
    Top = 5
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
        DataField = 'ACTIVIDAD'
        Title = 'Actividad'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end>
    Title.Text = 'Evento Actividad'
    Left = 176
    Top = 9
  end
  inherited WinXP1: TWinXP
    Left = 48
    Top = 40
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 772
    Top = 39
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 636
    Top = 7
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 740
    Top = 7
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 700
    Top = 7
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 12
    Top = 39
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from RN_ACTIVIDAD (:ANIMAL ,  :ESTABLECIMIENTO ,  :FECH' +
        'A, :ACTIVIDAD,:SUBCATEGORIA,:CODIGOMANEJO,:RAZA)')
    Left = 808
    Top = 38
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
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUBCATEGORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGOMANEJO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RAZA'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 840
    Top = 38
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_ACTIVIDAD(:FECHA,  :ANIMAL,  :OBSERVACION, ' +
        ' :ESTABLECIMIENTO,         :RESPONSABLE,  :LOG_USUARIO,  :LOG_FE' +
        'CHA_MODIFICADO,'
      
        '  :ACTIVIDAD,  :ID_GRUPO, :DISPARADOR, :SUBCATEGORIA, :CODIGOMAN' +
        'EJO,:INSPECCION,:DESTINO,:SUBCATEGORIZACION)')
    Left = 808
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
        Name = 'ACTIVIDAD'
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
        Name = 'SUBCATEGORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODIGOMANEJO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INSPECCION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUBCATEGORIZACION'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 840
    Top = 6
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 668
    Top = 7
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 208
    Top = 80
  end
  inherited IBSPActEventos: TIBStoredProc
    Left = 740
    Top = 39
  end
  inherited OpenDlg: TOpenDialog
    Left = 260
    Top = 0
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 636
    Top = 40
  end
  inherited IBQRepetidos: TIBQuery
    Left = 876
    Top = 38
  end
  inherited TimerLector: TTimer
    Left = 120
    Top = 40
  end
  inherited GuardarGrillaTemporal: TTimer
    Left = 80
    Top = 40
  end
  inherited IBQImportacion: TIBQuery
    Left = 12
    Top = 6
  end
  inherited IBQIE: TIBQuery
    Left = 876
    Top = 5
  end
  inherited ILVets: TImageList
    Left = 156
    Top = 36
  end
  object IBQGetRaza: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select raza from tab_animales where id_animal = :id')
    Left = 236
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQSubcategorizacion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_subcategorizacion')
    Left = 396
    Top = 375
  end
  object DSSubcategorizacion: TDataSource
    DataSet = IBQSubcategorizacion
    Left = 436
    Top = 375
  end
  object IBQSubCategoriaRaza: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQSubCategoriaRazaAfterOpen
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select cs.*'
      
        'from cod_subcategorias cs join rel_subcategoria_raza rsr on cs.i' +
        'd_subcategoria = rsr.id_subcategoria'
      'where rsr.id_raza = :raza')
    Left = 864
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'raza'
        ParamType = ptUnknown
      end>
  end
  object DSSubCategoriaRaza: TDataSource
    DataSet = IBQSubCategoriaRaza
    Left = 896
    Top = 156
  end
end
