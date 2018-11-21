inherited FEveDestete: TFEveDestete
  Left = 5
  Top = 66
  HelpContext = 12000
  Caption = 'Evento Destete'
  Constraints.MinHeight = 715
  Constraints.MinWidth = 968
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
      inherited TSManga: TTabSheet
        inherited MSimple: TMangazo
          inherited PSeleccion: TPanel
            inherited GBDisponibles: TGroupBox
              Height = 215
              inherited IFondoDis: TImage
                Height = 196
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 196
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 160
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
                    Width = 151
                    Visible = True
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
                    Width = 146
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
                    Width = 147
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
          Height = 165
          object LFecha: TLabel
            Left = 112
            Top = 28
            Width = 36
            Height = 16
            AutoSize = False
            Caption = 'Fecha:'
            Layout = tlCenter
          end
          object LObservador: TLabel
            Left = 86
            Top = 123
            Width = 76
            Height = 16
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
          object LPeso: TLabel
            Left = 118
            Top = 61
            Width = 35
            Height = 15
            Caption = 'Peso: '
          end
          object Label1: TLabel
            Left = 79
            Top = 94
            Width = 76
            Height = 15
            Caption = 'Tipo Destete: '
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 164
            Top = 25
            Width = 190
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
          object CBAObservador: TDBLookupComboBoxAuto
            Left = 164
            Top = 121
            Width = 190
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 3
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object EAPeso: TEditAuto
            Left = 164
            Top = 57
            Width = 130
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            MaxLength = 7
            TabOrder = 1
            OnExit = EAPesoExit
            OnKeyPress = EAPesoKeyPress
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
          object DBLCBATipoDestete: TDBLookupComboBoxAuto
            Left = 164
            Top = 88
            Width = 216
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_TIPO_DESTETE'
            ListField = 'SINONIMO'
            ListSource = DMSoftvet.DSTipoDestete
            TabOrder = 2
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object GroupBox1: TGroupBox
            Left = 405
            Top = 26
            Width = 363
            Height = 122
            TabOrder = 4
            object Label2: TLabel
              Left = 70
              Top = 42
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
              OnClick = Label2Click
              OnMouseEnter = Label2MouseEnter
              OnMouseLeave = Label2MouseLeave
            end
            object Label3: TLabel
              Left = 70
              Top = 83
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
              OnClick = Label3Click
              OnMouseEnter = Label3MouseEnter
              OnMouseLeave = Label3MouseLeave
            end
            object CkBPotrero: TCheckBox
              Left = 11
              Top = 11
              Width = 162
              Height = 18
              Caption = 'Cambiar de Ubicaci'#243'n'
              TabOrder = 0
              OnClick = CkBPotreroClick
              OnExit = GetEvent
            end
            object DBLCBAPotrero: TDBLookupComboBoxAuto
              Left = 123
              Top = 37
              Width = 199
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_POTRERO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSPotParaGrilla
              TabOrder = 1
              OnCloseUp = DBLCBAPotreroCloseUp
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBARodeo: TDBLookupComboBoxAuto
              Left = 124
              Top = 80
              Width = 199
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_RODEO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSRodParaGrilla
              TabOrder = 2
              OnCloseUp = DBLCBARodeoCloseUp
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 165
          Height = 235
          inherited MAObservacion: TMemoAuto
            Height = 222
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          TitleFont.Height = -13
          OnKeyPress = BDBGSimpleKeyPress
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
              ReadOnly = True
              Title.Caption = 'Fecha'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STRTIPO'
              Title.Caption = 'Tipo Destete'
              Width = 157
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO'
              Title.Caption = 'Peso'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 226
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POTRERO'
              Title.Caption = 'Potrero'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RODEO'
              Title.Caption = 'Rodeo'
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 498
      end
      inherited BBCancelar: TBitBtn
        Left = 507
      end
      inherited BBAnterior: TBitBtn
        Left = 605
      end
      inherited BBSiguiente: TBitBtn
        Left = 703
      end
      inherited BBTerminar: TBitBtn
        Left = 801
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Destete'
  end
  inherited ALUniversal: TActionList
    Top = 30
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 124
    Top = 15
  end
  inherited IBDSSimple: TIBDataSet
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION,F1 AS PESO, I2 ' +
        'AS TIPO,I1 AS POT,I4 AS ROD,V3 AS RODEO,V4 AS POTRERO, V2 AS STR' +
        'TIPO, D2 AS FECHA, V1 AS RESP, RESPONSABLE, EW from AUX_EVENTOS '
      '')
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
    object IBDSSimplePESO: TFloatField
      FieldName = 'PESO'
      Origin = 'AUX_EVENTOS.F1'
      OnSetText = IBDSSimplePESOSetText
    end
    object IBDSSimpleTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleSTRTIPO: TIBStringField
      FieldName = 'STRTIPO'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimplePESOSetText
      Size = 100
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.D2'
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimplePESOSetText
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
    object IBDSSimplePOT: TIntegerField
      FieldName = 'POT'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleROD: TIntegerField
      FieldName = 'ROD'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleRODEO: TIBStringField
      FieldName = 'RODEO'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = IBDSSimplePESOSetText
      Size = 100
    end
    object IBDSSimplePOTRERO: TIBStringField
      FieldName = 'POTRERO'
      Origin = 'AUX_EVENTOS.V4'
      OnSetText = IBDSSimplePESOSetText
      Size = 100
    end
  end
  inherited IBQValidaciones: TIBQuery
    Left = 372
    Top = 14
  end
  inherited SDXLS: TSaveDialog
    Left = 294
    Top = 13
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
        DataField = 'STRTIPO'
        Title = 'Tipo Destete'
      end
      item
        DataField = 'PESO'
        Title = 'Peso'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end
      item
        DataField = 'POTRERO'
        Title = 'Potrero'
      end
      item
        DataField = 'RODEO'
        Title = 'Rodeo'
      end>
    Title.Text = 'Destete'
    Left = 80
    Top = 17
  end
  inherited WinXP1: TWinXP
    Left = 448
    Top = 32
  end
  object IBQuery1: TIBQuery [18]
    BufferChunks = 1000
    CachedUpdates = False
    Left = 220
    Top = 14
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 164
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from RN_DESTETE (:ANIMAL, :ESTABLECIMIENTO, :FECHA, :PE' +
        'SO) ')
    Left = 528
    Top = 22
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
        Name = 'PESO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Top = 30
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE  PROCEDURE SP_DESTETE('
      ' :FECHA , :ANIMAL , :OBSERVACION , :ESTABLECIMIENTO ,'
      
        ' :RESPONSABLE , :LOG_USUARIO , :LOG_FECHA_MODIFICADO,   :PESO, :' +
        'TIPO, :ID_GRUPO, :DISPARADOR, :POTRERO,:RODEO)')
    Top = 78
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
        Name = 'PESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
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
        Name = 'POTRERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RODEO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 608
    Top = 30
  end
  inherited ILVets: TImageList
    Left = 309
    Top = 250
  end
  inherited IBQCarElect: TIBQuery
    Left = 244
    Top = 247
  end
end
