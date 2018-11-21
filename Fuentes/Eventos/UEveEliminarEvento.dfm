inherited FEveEliminarEvento: TFEveEliminarEvento
  Left = 209
  Top = 2
  Caption = 'FEveEliminarEvento'
  ClientHeight = 746
  ClientWidth = 1045
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1045
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
    Top = 633
    Width = 1045
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1037
      end
    end
  end
  inherited PDatos: TPanel
    Width = 1045
    Height = 546
    inherited PCBasico: TPageControl
      Width = 1045
      Height = 464
      ActivePage = TSNacimientosNoRelac
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Top = 61
          Width = 1037
          Height = 361
        end
        inherited MSimple: TMangazo
          Top = 61
          Width = 1037
          Height = 361
          Enabled = False
          inherited GBFiltro: TGroupBox
            Width = 1037
            Height = 122
            inherited LCategoria: TLabel
              Left = 405
              Top = 52
            end
            inherited RBTodas: TRadioButton
              Left = 9
              Top = 34
            end
            inherited RBPotrero: TRadioButton
              Left = 414
              Top = 86
            end
            inherited RBAnimales: TRadioButton
              Left = 9
            end
            inherited RBGrupo: TRadioButton
              Left = 215
              Top = 17
            end
            inherited RBRodeo: TRadioButton
              Left = 181
              Top = 86
            end
            inherited DBLCBGrupo: TDBLookupComboBoxAuto
              Left = 292
              Top = 17
              Width = 322
              Font.Style = [fsBold]
              ParentFont = False
              OnCloseUp = MSimpleDBLCBGrupoCloseUp
            end
            inherited DBLCBRodeo: TDBLookupComboBoxAuto
              Left = 112
              Top = 86
            end
            inherited DBLCBCategoria: TDBLookupComboBoxAuto
              Left = 491
              Top = 50
            end
            inherited DBLCBPotrero: TDBLookupComboBoxAuto
              Left = 491
              Top = 86
            end
            inherited CBPotrero: TCheckBox
              Left = 405
              Top = 88
            end
            inherited CBRodeo: TCheckBox
              Left = 43
              Top = 88
              Width = 65
            end
            inherited CBGrupo: TCheckBox
              Left = 215
              Top = 19
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited CBCategoria: TCheckBox
              Left = 404
              Top = 53
            end
            inherited CBAnimal: TCheckBox
              Width = 61
            end
          end
          inherited PSeleccion: TPanel
            Top = 313
            Width = 1037
            Height = 48
            inherited GBDisponibles: TGroupBox
              Width = 473
              Height = 167
              inherited IFondoDis: TImage
                Width = 469
                Height = 148
              end
              inherited BDBGDisponibles: TBitDBGrid
                Width = 469
                Height = 148
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 158
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
              Left = 581
              Width = 421
              Height = 167
              inherited IFondoSel: TImage
                Width = 417
                Height = 148
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 417
                Height = 148
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
              Left = 473
              Height = 167
              inherited IFondo: TImage
                Height = 167
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 143
            Width = 1037
          end
          inherited GBFiltros: TGroupBox
            Top = 197
            Width = 1037
          end
          inherited Panel1: TPanel
            Top = 122
            Width = 1037
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            FAWidth = 145
            FAHeight = 170
            FCWidth = 22
            FCHeight = 22
          end
          inherited IBQAnimales: TIBQuery
            Left = 160
            Top = 200
          end
          inherited IBQPotrero: TIBQuery
            Left = 112
            Top = 144
          end
          inherited IBQGrupo: TIBQuery
            Left = 520
            Top = 248
          end
          inherited IBQRodeo: TIBQuery
            Left = 48
            Top = 144
          end
          inherited DSAnimales: TDataSource
            Left = 224
            Top = 256
          end
          inherited DSPotrero: TDataSource
            Left = 256
            Top = 256
          end
          inherited DSGrupo: TDataSource
            Left = 240
            Top = 144
          end
          inherited DSRodeo: TDataSource
            Top = 256
          end
          inherited DSSeleccionados: TDataSource
            Left = 456
            Top = 248
          end
          inherited IBQDisponibles: TIBQuery
            AfterOpen = MSimpleIBQDisponiblesAfterOpen
            BeforeOpen = MSimpleIBQDisponiblesBeforeOpen
            OnFilterRecord = nil
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select  ID_AUX,ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otr' +
                'o, nombre, sexo from AUX_ANIMALES'
              'where id_animal > 0'
              ''
              ''
              '')
            Top = 288
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
            Left = 488
            Top = 288
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
            Top = 256
          end
          inherited IBQDisponiblesGrupos: TIBQuery
            Left = 24
            Top = 272
          end
          inherited IBQCatAnimales: TIBQuery
            Left = 96
            Top = 232
          end
          inherited DSCatAnimales: TDataSource
            Left = 208
            Top = 144
          end
          inherited IBQRechazo: TIBQuery
            Left = 144
            Top = 144
          end
          inherited DSRechazo: TDataSource
            Left = 176
            Top = 144
          end
          inherited IBQExamenClinico: TIBQuery
            Left = 512
            Top = 168
          end
          inherited DSExamenClinico: TDataSource
            Left = 128
            Top = 200
          end
          inherited IBQCalidadSEminal: TIBQuery
            Left = 96
            Top = 200
          end
          inherited DSCalidadSeminal: TDataSource
            Left = 480
            Top = 168
          end
          inherited IBQCondCorp: TIBQuery
            Left = 448
            Top = 168
          end
          inherited DSCondCorp: TDataSource
            Left = 488
            Top = 248
          end
        end
        inherited EABusqueda: TEditAuto
          Left = 672
          Top = 345
        end
        object PFiltros: TPanel
          Left = 0
          Top = 0
          Width = 1037
          Height = 61
          Align = alTop
          Color = clWhite
          TabOrder = 2
          object Label1: TLabel
            Left = 274
            Top = 24
            Width = 111
            Height = 15
            Caption = 'Seleccionar Evento: '
          end
          object DBLCBAEventos: TDBLookupComboBoxAuto
            Left = 386
            Top = 20
            Width = 320
            Height = 23
            Color = 14679807
            KeyField = 'ID_TIPO_EVENTO'
            ListField = 'NOMBRE'
            ListSource = DSEventos
            TabOrder = 0
            OnCloseUp = DBLCBAEventosCloseUp
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBObservaciones: TGroupBox
          Height = 201
          inherited MAObservacion: TMemoAuto
            Height = 182
          end
        end
      end
      object TSNacimientosNoRelac: TTabSheet [2]
        Caption = 'Nacimientos'
        ImageIndex = 3
        TabVisible = False
        OnShow = TSNacimientosNoRelacShow
        object GBNacimientos: TGroupBox
          Left = 0
          Top = 0
          Width = 1037
          Height = 422
          Align = alClient
          Caption = 'Nacimientos'
          TabOrder = 0
          object Label2: TLabel
            Left = 26
            Top = 32
            Width = 269
            Height = 15
            Caption = 'Nacimientos correspondientes al grupo de parto:'
          end
          object LGrupoParto: TLabel
            Left = 284
            Top = 32
            Width = 70
            Height = 15
            Caption = 'LGrupoParto'
          end
          object LCantHijosNoRelac: TLabel
            Left = 26
            Top = 69
            Width = 110
            Height = 15
            Caption = 'LCantHijosNoRelac'
          end
          object PSeleccion: TPanel
            Left = 2
            Top = 113
            Width = 1033
            Height = 307
            Align = alBottom
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 0
            inline FSeleccion: TFrameSeleccion
              Left = 0
              Top = 0
              Width = 1033
              Height = 307
              Align = alClient
              TabOrder = 0
              inherited PSeleccion: TPanel
                Width = 1033
                Height = 307
                inherited PBotones: TPanel
                  Left = 345
                  Width = 353
                  Height = 307
                  inherited IFondo: TImage
                    Width = 353
                    Height = 307
                  end
                  inherited BBAgregarTodos: TJvImage
                    Left = 120
                    Top = 37
                    Width = 73
                    Height = 68
                    OnClick = FSeleccionBBAgregarTodosClick
                  end
                  inherited BBAgregarUno: TJvImage
                    Left = 120
                    Top = 106
                    Width = 73
                    Height = 55
                    OnClick = FSeleccionBBAgregarUnoClick
                  end
                  inherited BBEliminarUno: TJvImage
                    Left = 120
                    Top = 165
                    Width = 73
                    Height = 60
                    OnClick = FSeleccionBBEliminarUnoClick
                  end
                  inherited BBEliminarTodos: TJvImage
                    Left = 120
                    Top = 226
                    Width = 73
                    Height = 63
                    OnClick = FSeleccionBBEliminarTodosClick
                  end
                  inherited BBATodos: TBitBtn
                    Left = -19
                    Top = 90
                    Width = 84
                  end
                  inherited BBAUno: TBitBtn
                    Left = -21
                    Top = 122
                    Width = 86
                  end
                  inherited BBEUno: TBitBtn
                    Left = -21
                    Top = 154
                    Width = 86
                  end
                  inherited BBETodos: TBitBtn
                    Left = -21
                    Top = 186
                    Width = 86
                  end
                end
                inherited GBSeleccionados: TGroupBox
                  Left = 698
                  Width = 335
                  Height = 307
                  inherited BDBGSeleccionados: TBitDBGrid
                    Top = 17
                    Width = 331
                    Height = 288
                    Font.Height = -12
                    TitleFont.Height = 0
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'ID_RP'
                        Title.Caption = 'RP Animal'
                        Width = 155
                        Visible = True
                      end>
                  end
                end
                inherited GBDisponibles: TGroupBox
                  Width = 345
                  Height = 307
                  inherited BDBGDisponibles: TBitDBGrid
                    Top = 17
                    Width = 341
                    Height = 288
                    Font.Height = -12
                    TitleFont.Height = 0
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'ID_RP'
                        Title.Caption = 'RP Animal'
                        Width = 153
                        Visible = True
                      end>
                  end
                end
              end
              inherited IBQDisponibles: TIBQuery
                SQL.Strings = (
                  
                    'select ta.id_rp, ta.id_animal from tab_animales ta join eve_even' +
                    'tos ee on ta.id_animal = ee.animal'
                  
                    'join eve_nacimiento en on ee.id_evento = en.id_evento where en.g' +
                    'rupo = :grupo and ee.establecimiento = :esta and ta.id_animal no' +
                    't in (select id_animal from aux_animales) and ((ta.madre_biologi' +
                    'ca_interna is null))')
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
              inherited IBUSQLIntercambiar: TIBUpdateSQL
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
                  '  V13'
                  'from AUX_ANIMALES '
                  'where'
                  '  ID_ANIMAL = :ID_ANIMAL')
                ModifySQL.Strings = (
                  'update AUX_ANIMALES'
                  'set'
                  '  ID_AUX = :ID_AUX,'
                  '  ID_RP = :ID_RP,'
                  '  ID_ANIMAL = :ID_ANIMAL,'
                  '  ESTABLECIMIENTO = :ESTABLECIMIENTO'
                  'where'
                  '  ID_ANIMAL = :OLD_ID_ANIMAL')
                InsertSQL.Strings = (
                  'insert into AUX_ANIMALES'
                  '  (ID_AUX, ID_RP, ID_ANIMAL, ESTABLECIMIENTO)'
                  'values'
                  '  (:ID_AUX, :ID_RP, :ID_ANIMAL, :ESTABLECIMIENTO)')
                DeleteSQL.Strings = (
                  'delete from AUX_ANIMALES'
                  'where'
                  '  ID_ANIMAL = :OLD_ID_ANIMAL')
              end
              inherited IBQSeleccionados: TIBQuery
                SQL.Strings = (
                  
                    'select  ID_AUX,ID_RP,id_animal, establecimiento from AUX_ANIMALE' +
                    'S where establecimiento = -1')
                Filtered = True
              end
            end
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Width = 942
          Height = 422
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Caption = 'RP Animal'
              Width = 144
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              ReadOnly = True
              Title.Caption = 'Nombre del Evento'
              Width = 482
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 422
        end
        inherited PanelDer: TPanel
          Left = 989
          Height = 422
        end
      end
    end
    inherited PBotones: TPanel
      Top = 464
      Width = 1045
      inherited SBSelTodos: TSpeedButton
        Left = 887
      end
      inherited IFondoB2: TImage
        Width = 619
      end
      inherited BBCancelar: TBitBtn
        Left = 962
      end
      inherited BBAnterior: TBitBtn
        Left = 1060
      end
      inherited BBSiguiente: TBitBtn
        Left = 1158
      end
      inherited BBTerminar: TBitBtn
        Left = 1256
      end
      inherited PL: TPanel
        Left = 619
      end
      inherited BBXls: TBitBtn
        Visible = False
      end
      inherited BBXlsImport: TBitBtn
        Visible = False
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1045
    Caption = 'Eliminar Evento'
    inherited LTitulo: TLabel
      Width = 641
      Caption = 'Eliminar Evento'
    end
    inherited PILeft: TPanel
      Left = 837
    end
  end
  inherited Psocalo: TPanel
    Top = 611
    Width = 1045
    inherited JvSocalo: TJvImage
      Width = 1045
    end
  end
  inherited ALUniversal: TActionList
    Left = 547
    Top = 65534
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Top = 65535
  end
  inherited DSSimple: TDataSource
    Left = 32
    Top = 0
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      '  (ID_RP, FECHA, I1, OBSERVACION)'
      'values'
      '  (:ID_RP, :FECHA, :I1, :OBSERVACION)')
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
      '  ID_ANIMAL = :ID_ANIMAL'
      'ORDER BY I1 DESC')
    SelectSQL.Strings = (
      
        'SELECT ID_ANIMAL, ID_RP, FECHA, I1, OBSERVACION, EW FROM AUX_EVE' +
        'NTOS ORDER BY I1 DESC')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_RP = :ID_RP,'
      '  FECHA = :FECHA,'
      '  I1 = :I1,'
      '  OBSERVACION = :OBSERVACION'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 252
    Top = 518
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_EVENTOS.ID_RP'
      Size = 10
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      Size = 255
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 680
    Top = 65534
  end
  inherited IBQValidaciones: TIBQuery
    Left = 452
    Top = 30
  end
  inherited IBQEvento: TIBQuery
    Left = 84
    Top = 518
  end
  inherited SDXLS: TSaveDialog
    Left = 150
    Top = 65533
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Left = 120
    Top = 1
  end
  inherited WinXP1: TWinXP
    Left = 224
    Top = 0
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 452
    Top = 65535
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 644
    Top = 65535
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 612
    Top = 65535
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 484
    Top = 65535
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 516
    Top = 65535
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'SELECT * FROM RN_ELIMINAR_EVENTO(:ANIMAL,:EVENTO)')
    Left = 680
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EVENTO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 712
    Top = 62
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'SELECT * FROM UNDO_ELIMINAR_EVENTO(:EVENTO)')
    Left = 680
    Top = 30
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EVENTO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 712
    Top = 30
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 580
    Top = 65535
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 64
    Top = 0
  end
  inherited IBSPActEventos: TIBStoredProc
    Left = 484
    Top = 31
  end
  inherited OpenDlg: TOpenDialog
    Left = 92
    Top = 0
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 516
    Top = 32
  end
  inherited IBQRepetidos: TIBQuery
    Left = 548
    Top = 32
  end
  inherited TimerLector: TTimer
    Left = 744
    Top = 0
  end
  inherited GuardarGrillaTemporal: TTimer
    Left = 712
    Top = 0
  end
  inherited IBQImportacion: TIBQuery
    Left = 52
    Top = 518
  end
  object IBQEventos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQEventosAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from cod_tipos_evento where id_tipo_evento <> 15 and id' +
        '_tipo_evento <> 16 and id_tipo_evento <> 20 and id_tipo_evento <' +
        '> 21 and id_tipo_evento <> 2 and id_tipo_evento <>-1 and id_tipo' +
        '_evento <> 23 and id_tipo_evento <>28 and id_tipo_evento <>29 an' +
        'd id_tipo_evento <>37 and id_tipo_evento <>38 and id_tipo_evento' +
        ' <>40 and id_tipo_evento <>42 and id_tipo_evento <>43 and id_tip' +
        'o_evento <>46'
      'order by nombre asc')
    Left = 120
    Top = 520
  end
  object DSEventos: TDataSource
    DataSet = IBQEventos
    Left = 152
    Top = 520
  end
  object IBQFiltrarAnimales: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select first 1 id_evento from eve_eventos where animal = :animal' +
        ' and tipo = :evento and establecimiento = :esta and disparador i' +
        's null order by fecha desc')
    Left = 184
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'evento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQSPDatosEvento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM SP_OBTENER_EVE_ANIMALES(:TIPO)')
    Left = 220
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
  end
  object IBQChekEstadoMadres: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from SP_CHEK_ESTADO_MADRES(:grupo)')
    Filtered = True
    Left = 524
    Top = 553
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
  end
  object IBQSPAsociarNoRelac: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from SP_ASOCIAR_NO_RELACIONADOS(:grupo)')
    Left = 556
    Top = 553
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end>
  end
end
