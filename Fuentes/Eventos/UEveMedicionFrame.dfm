inherited FEveMedicionFrame: TFEveMedicionFrame
  Left = 219
  Top = 9
  HelpContext = 23000
  Caption = 'Medicion de Frame'
  Constraints.MinHeight = 653
  Constraints.MinWidth = 838
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
                    Width = 140
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
                    Width = 170
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
                    Width = 119
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
                    Width = 174
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
              
                'select  AX.ID_AUX, AX.ID_RP, AX.ID_SENASA, AX.id_animal, AX.id_p' +
                'c, AX.id_hba, AX.id_otro, AX. Fecha_Nacimiento, AX.POTRERO, AX.R' +
                'ODEO, AX.CATEGORIA, ax.sexo, ax.nombre  from AUX_ANIMALES AX')
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
          Height = 137
          object LObservador: TLabel
            Left = 117
            Top = 61
            Width = 76
            Height = 19
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
          object LFecha: TLabel
            Left = 144
            Top = 26
            Width = 37
            Height = 14
            AutoSize = False
            Caption = 'Fecha:'
            Layout = tlCenter
          end
          object LAltura: TLabel
            Left = 495
            Top = 26
            Width = 37
            Height = 15
            Caption = 'Altura: '
          end
          object LEdad: TLabel
            Left = 496
            Top = 65
            Width = 35
            Height = 15
            Caption = 'Edad: '
          end
          object Ldias: TLabel
            Left = 630
            Top = 65
            Width = 24
            Height = 15
            Caption = 'd'#237'as'
          end
          object LCm: TLabel
            Left = 626
            Top = 26
            Width = 20
            Height = 15
            Caption = 'cm.'
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 198
            Top = 20
            Width = 130
            Height = 21
            Date = 38657.411226122680000000
            Time = 38657.411226122680000000
            Color = 14679807
            TabOrder = 0
            OnCloseUp = DTPAFechaCloseUp
            OnChange = DTPAFechaChange
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object EAAltura: TEditAuto
            Left = 537
            Top = 20
            Width = 84
            Height = 23
            CharCase = ecUpperCase
            Color = 14679807
            MaxLength = 6
            TabOrder = 1
            OnChange = EAAlturaChange
            OnExit = GetEvent
            OnKeyPress = EAAlturaKeyPress
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 198
            Top = 59
            Width = 234
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 2
            OnCloseUp = DTPAFechaCloseUp
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object EAEdad: TEditAuto
            Left = 538
            Top = 59
            Width = 88
            Height = 23
            AutoSize = False
            CharCase = ecUpperCase
            Color = clWhite
            ReadOnly = True
            TabOrder = 3
            OnChange = EAEdadChange
            OnExit = GetEvent
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object STEdad: TStaticText
            Left = 663
            Top = 66
            Width = 4
            Height = 4
            TabOrder = 4
          end
          object STAltura: TStaticText
            Left = 668
            Top = 26
            Width = 4
            Height = 4
            TabOrder = 5
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 157
          Height = 243
          inherited MAObservacion: TMemoAuto
            Height = 228
          end
        end
        object PFrame: TPanel
          Left = 0
          Top = 137
          Width = 1002
          Height = 20
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
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 198
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 151
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALTURA'
              Title.Caption = 'Altura ( cm.)'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EDAD'
              ReadOnly = True
              Title.Caption = 'Edad (d'#237'as)'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FRAME'
              ReadOnly = True
              Title.Caption = 'Frame'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEXO'
              Title.Caption = 'Sexo'
              Visible = False
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 628
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
    Caption = 'Medici'#243'n de Frame'
  end
  inherited ALUniversal: TActionList
    Left = 435
    Top = 30
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (V9, V8, V10, V7, V6, V5, ID_SENASA, V11, ID_RP, FECHA, OBSERV' +
        'ACION, '
      
        '   RESPONSABLE, V1, V2, NOMBRE, V3, V4, I1, I2, I3, D1, D2, D3, ' +
        'ID_ANIMAL, '
      
        '   ID_AUX_EVENTO, I4, I5, I6, I7, I8, I9, VUNO1, VUNO2, VUNO3, V' +
        'UNO4, VUNO5, '
      '   VUNO6, EW, H1, V12, F1, F2, F3)'
      'values'
      
        '  (:V9, :V8, :V10, :V7, :V6, :V5, :ID_SENASA, :V11, :ID_RP, :FEC' +
        'HA, '
      ':OBSERVACION, '
      
        '   :RESPONSABLE, :V1, :V2, :NOMBRE, :V3, :V4, :I1, :I2, :I3, :D1' +
        ', :D2, '
      
        '   :D3, :ID_ANIMAL, :ID_AUX_EVENTO, :I4, :I5, :I6, :I7, :I8, :I9' +
        ', :VUNO1, '
      
        '   :VUNO2, :VUNO3, :VUNO4, :VUNO5, :VUNO6, :EW, :H1, :V12, :F1, ' +
        ':F2, :F3)')
    RefreshSQL.Strings = (
      'Select '
      '  V9,'
      '  V8,'
      '  V10,'
      '  V7,'
      '  V6,'
      '  V5,'
      '  ID_SENASA,'
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
      '  F3'
      'from AUX_EVENTOS '
      'where'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO')
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, D1 AS FECHA, R' +
        'ESPONSABLE, F2 AS altura, I2 AS edad, V2  AS RESP, F1 as frame, ' +
        'I3 AS SEXO, EW from AUX_EVENTOS ')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  V9 = :V9,'
      '  V8 = :V8,'
      '  V10 = :V10,'
      '  V7 = :V7,'
      '  V6 = :V6,'
      '  V5 = :V5,'
      '  ID_SENASA = :ID_SENASA,'
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
      '  F3 = :F3'
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
      OnSetText = SetText
      Size = 255
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.D1'
      OnChange = IBDSSimpleFECHAChange
      OnSetText = IBDSSimpleFECHASetText
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleALTURA: TFloatField
      FieldName = 'ALTURA'
      Origin = 'AUX_EVENTOS.F2'
      OnChange = IBDSSimpleALTURAChange
      OnSetText = IBDSSimpleALTURASetText
    end
    object IBDSSimpleEDAD: TIntegerField
      FieldName = 'EDAD'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = SetText
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleFRAME: TFloatField
      FieldName = 'FRAME'
      Origin = 'AUX_EVENTOS.F1'
      DisplayFormat = '00.00'
      Precision = 2
    end
    object IBDSSimpleSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_EVENTOS.I3'
    end
  end
  inherited IBQValidaciones: TIBQuery
    Left = 284
    Top = 174
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'ID_RP'
        Title = 'RP'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha'
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
        DataField = 'ALTURA'
        Title = 'Altura (cm.)'
      end
      item
        DataField = 'EDAD'
        Title = 'Edad (d'#237'as)'
      end
      item
        DataField = 'FRAME'
        Title = 'Frame'
      end
      item
        DataField = 'SEXO'
        Save = False
        Title = 'Sexo'
      end>
    Title.Text = 'Medici'#243'n de Frame'
  end
  inherited WinXP1: TWinXP
    Left = 464
    Top = 144
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'SELECT * FROM RN_MEDICION_FRAME(:ANIMAL, :FRAME, :ESTABLECIMIENT' +
        'O, :fecha) ')
    Left = 464
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
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 496
    Top = 30
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_MEDICION_FRAME(:FECHA,  :ANIMAL, :OBSERVACI' +
        'ON, :ESTABLECIMIENTO,'
      '  :RESPONSABLE,  :LOG_USUARIO,  :LOG_FECHA_MODIFICADO,'
      '  :ALTURA,  :EDAD,  :FRAME, :ID_GRUPO,:Disparador)')
    Left = 528
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
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Disparador'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 560
    Top = 30
  end
  object IBQFrame: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 572
    Top = 166
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
  object DSObtenerIDSexo: TDataSource
    DataSet = IBQObtenerIDSexo
    Left = 276
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
end
