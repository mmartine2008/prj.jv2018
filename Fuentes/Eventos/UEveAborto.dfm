inherited FEveAborto: TFEveAborto
  Left = 179
  Top = 59
  Caption = 'Evento Aborto'
  Constraints.MinHeight = 611
  Constraints.MinWidth = 785
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
              Height = 196
              inherited IFondoDis: TImage
                Height = 177
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 177
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 173
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
                    Width = 137
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Height = 196
              inherited IFondoSel: TImage
                Height = 177
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Height = 177
                TitleFont.Height = -13
                Visible = False
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 134
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
                    Width = 161
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Height = 196
              inherited IFondo: TImage
                Height = 196
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
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select  ID_AUX,ID_RP, ID_SENASA,id_animal, id_pc, id_hba, id_otr' +
                'o, sexo from AUX_ANIMALES'
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
          Height = 148
          object LFecha: TLabel
            Left = 78
            Top = 41
            Width = 70
            Height = 23
            AutoSize = False
            Caption = 'Fecha:'
            Layout = tlCenter
          end
          object LObservador: TLabel
            Left = 78
            Top = 76
            Width = 70
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
            OnClick = LObservadorClick
            OnMouseEnter = LObservadorMouseEnter
            OnMouseLeave = LObservadorMouseLeave
          end
          object Label1: TLabel
            Left = 396
            Top = 47
            Width = 68
            Height = 15
            Caption = 'Tipo Aborto: '
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 155
            Top = 41
            Width = 191
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
            Left = 155
            Top = 76
            Width = 191
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 1
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBATipoAborto: TDBLookupComboBoxAuto
            Left = 465
            Top = 41
            Width = 217
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_TIPO_ABORTO'
            ListField = 'SINONIMO'
            ListSource = DMSoftvet.DSTipoAborto
            TabOrder = 2
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object CBAplicarDiagnostico: TCheckBox
            Left = 396
            Top = 79
            Width = 227
            Height = 18
            Alignment = taLeftJustify
            BiDiMode = bdLeftToRight
            Caption = 'Diagnosticar enfermedad al terminar'
            ParentBiDiMode = False
            TabOrder = 3
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 148
          Height = 252
          inherited MAObservacion: TMemoAuto
            Height = 237
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'EW'
              Width = 141
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 681
      end
      inherited BBCancelar: TBitBtn
        Left = 616
      end
      inherited BBAnterior: TBitBtn
        Left = 708
      end
      inherited BBSiguiente: TBitBtn
        Left = 799
      end
      inherited BBTerminar: TBitBtn
        Left = 892
        ModalResult = 1
      end
      inherited BIngresoSecuenciado: TBitBtn
        Left = 258
      end
      inherited BSacarAnimal: TBitBtn
        Left = 156
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Aborto'
    inherited LTipoVersionLicenciaDerecha: TJvLabel
      Left = 196
      Top = 34
    end
  end
  inherited ALUniversal: TActionList
    Top = 70
  end
  inherited DSSimple: TDataSource
    Left = 40
    Top = 70
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  V8 = :OLD_V8 and'
      '  V10 = :OLD_V10 and'
      '  V7 = :OLD_V7 and'
      '  V6 = :OLD_V6 and'
      '  V5 = :OLD_V5 and'
      '  ID_SENASA = :OLD_ID_SENASA and'
      '  V9 = :OLD_V9 and'
      '  V11 = :OLD_V11 and'
      '  ID_RP = :OLD_ID_RP and'
      '  FECHA = :OLD_FECHA and'
      '  OBSERVACION = :OLD_OBSERVACION and'
      '  RESPONSABLE = :OLD_RESPONSABLE and'
      '  V1 = :OLD_V1 and'
      '  V2 = :OLD_V2 and'
      '  NOMBRE = :OLD_NOMBRE and'
      '  V3 = :OLD_V3 and'
      '  V4 = :OLD_V4 and'
      '  I1 = :OLD_I1 and'
      '  I2 = :OLD_I2 and'
      '  I3 = :OLD_I3 and'
      '  D1 = :OLD_D1 and'
      '  D2 = :OLD_D2 and'
      '  D3 = :OLD_D3 and'
      '  ID_ANIMAL = :OLD_ID_ANIMAL and'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO and'
      '  I4 = :OLD_I4 and'
      '  I5 = :OLD_I5 and'
      '  I6 = :OLD_I6 and'
      '  I7 = :OLD_I7 and'
      '  I8 = :OLD_I8 and'
      '  I9 = :OLD_I9 and'
      '  VUNO1 = :OLD_VUNO1 and'
      '  VUNO2 = :OLD_VUNO2 and'
      '  VUNO3 = :OLD_VUNO3 and'
      '  VUNO4 = :OLD_VUNO4 and'
      '  VUNO5 = :OLD_VUNO5 and'
      '  VUNO6 = :OLD_VUNO6 and'
      '  EW = :OLD_EW and'
      '  H1 = :OLD_H1 and'
      '  V12 = :OLD_V12 and'
      '  F1 = :OLD_F1 and'
      '  F2 = :OLD_F2 and'
      '  F3 = :OLD_F3 and'
      '  F4 = :OLD_F4 and'
      '  F5 = :OLD_F5')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      '  (ID_ANIMAL, ID_AUX_EVENTO, EW)'
      'values'
      '  (:ID_ANIMAL, :ID_AUX_EVENTO, :EW)')
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
      '  V8 = :V8 and'
      '  V10 = :V10 and'
      '  V7 = :V7 and'
      '  V6 = :V6 and'
      '  V5 = :V5 and'
      '  ID_SENASA = :ID_SENASA and'
      '  V9 = :V9 and'
      '  V11 = :V11 and'
      '  ID_RP = :ID_RP and'
      '  FECHA = :FECHA and'
      '  OBSERVACION = :OBSERVACION and'
      '  RESPONSABLE = :RESPONSABLE and'
      '  V1 = :V1 and'
      '  V2 = :V2 and'
      '  NOMBRE = :NOMBRE and'
      '  V3 = :V3 and'
      '  V4 = :V4 and'
      '  I1 = :I1 and'
      '  I2 = :I2 and'
      '  I3 = :I3 and'
      '  D1 = :D1 and'
      '  D2 = :D2 and'
      '  D3 = :D3 and'
      '  ID_ANIMAL = :ID_ANIMAL and'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO and'
      '  I4 = :I4 and'
      '  I5 = :I5 and'
      '  I6 = :I6 and'
      '  I7 = :I7 and'
      '  I8 = :I8 and'
      '  I9 = :I9 and'
      '  VUNO1 = :VUNO1 and'
      '  VUNO2 = :VUNO2 and'
      '  VUNO3 = :VUNO3 and'
      '  VUNO4 = :VUNO4 and'
      '  VUNO5 = :VUNO5 and'
      '  VUNO6 = :VUNO6 and'
      '  EW = :EW and'
      '  H1 = :H1 and'
      '  V12 = :V12 and'
      '  F1 = :F1 and'
      '  F2 = :F2 and'
      '  F3 = :F3 and'
      '  F4 = :F4 and'
      '  F5 = :F5')
    SelectSQL.Strings = (
      'select * from  AUX_EVENTOS')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO,'
      '  EW = :EW'
      'where'
      '  V8 = :OLD_V8 and'
      '  V10 = :OLD_V10 and'
      '  V7 = :OLD_V7 and'
      '  V6 = :OLD_V6 and'
      '  V5 = :OLD_V5 and'
      '  ID_SENASA = :OLD_ID_SENASA and'
      '  V9 = :OLD_V9 and'
      '  V11 = :OLD_V11 and'
      '  ID_RP = :OLD_ID_RP and'
      '  FECHA = :OLD_FECHA and'
      '  OBSERVACION = :OLD_OBSERVACION and'
      '  RESPONSABLE = :OLD_RESPONSABLE and'
      '  V1 = :OLD_V1 and'
      '  V2 = :OLD_V2 and'
      '  NOMBRE = :OLD_NOMBRE and'
      '  V3 = :OLD_V3 and'
      '  V4 = :OLD_V4 and'
      '  I1 = :OLD_I1 and'
      '  I2 = :OLD_I2 and'
      '  I3 = :OLD_I3 and'
      '  D1 = :OLD_D1 and'
      '  D2 = :OLD_D2 and'
      '  D3 = :OLD_D3 and'
      '  ID_ANIMAL = :OLD_ID_ANIMAL and'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO and'
      '  I4 = :OLD_I4 and'
      '  I5 = :OLD_I5 and'
      '  I6 = :OLD_I6 and'
      '  I7 = :OLD_I7 and'
      '  I8 = :OLD_I8 and'
      '  I9 = :OLD_I9 and'
      '  VUNO1 = :OLD_VUNO1 and'
      '  VUNO2 = :OLD_VUNO2 and'
      '  VUNO3 = :OLD_VUNO3 and'
      '  VUNO4 = :OLD_VUNO4 and'
      '  VUNO5 = :OLD_VUNO5 and'
      '  VUNO6 = :OLD_VUNO6 and'
      '  EW = :OLD_EW and'
      '  H1 = :OLD_H1 and'
      '  V12 = :OLD_V12 and'
      '  F1 = :OLD_F1 and'
      '  F2 = :OLD_F2 and'
      '  F3 = :OLD_F3 and'
      '  F4 = :OLD_F4 and'
      '  F5 = :OLD_F5')
    Top = 70
    object IBDSSimpleV8: TIBStringField
      FieldName = 'V8'
      Origin = 'AUX_EVENTOS.V8'
      Size = 100
    end
    object IBDSSimpleV10: TIBStringField
      FieldName = 'V10'
      Origin = 'AUX_EVENTOS.V10'
      Size = 100
    end
    object IBDSSimpleV7: TIBStringField
      FieldName = 'V7'
      Origin = 'AUX_EVENTOS.V7'
      Size = 100
    end
    object IBDSSimpleV6: TIBStringField
      FieldName = 'V6'
      Origin = 'AUX_EVENTOS.V6'
      Size = 100
    end
    object IBDSSimpleV5: TIBStringField
      FieldName = 'V5'
      Origin = 'AUX_EVENTOS.V5'
      Size = 100
    end
    object IBDSSimpleID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_EVENTOS.ID_SENASA'
      Size = 9
    end
    object IBDSSimpleV9: TIBStringField
      FieldName = 'V9'
      Origin = 'AUX_EVENTOS.V9'
      Size = 100
    end
    object IBDSSimpleV11: TIBStringField
      FieldName = 'V11'
      Origin = 'AUX_EVENTOS.V11'
      Size = 100
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
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      Size = 255
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_EVENTOS.V1'
      Size = 100
    end
    object IBDSSimpleV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_EVENTOS.V2'
      Size = 100
    end
    object IBDSSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_EVENTOS.NOMBRE'
      Size = 50
    end
    object IBDSSimpleV3: TIBStringField
      FieldName = 'V3'
      Origin = 'AUX_EVENTOS.V3'
      Size = 100
    end
    object IBDSSimpleV4: TIBStringField
      FieldName = 'V4'
      Origin = 'AUX_EVENTOS.V4'
      Size = 100
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleI2: TIntegerField
      FieldName = 'I2'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleI3: TIntegerField
      FieldName = 'I3'
      Origin = 'AUX_EVENTOS.I3'
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
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleID_AUX_EVENTO: TIntegerField
      FieldName = 'ID_AUX_EVENTO'
      Origin = 'AUX_EVENTOS.ID_AUX_EVENTO'
    end
    object IBDSSimpleI4: TIntegerField
      FieldName = 'I4'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleI5: TIntegerField
      FieldName = 'I5'
      Origin = 'AUX_EVENTOS.I5'
    end
    object IBDSSimpleI6: TIntegerField
      FieldName = 'I6'
      Origin = 'AUX_EVENTOS.I6'
    end
    object IBDSSimpleI7: TIntegerField
      FieldName = 'I7'
      Origin = 'AUX_EVENTOS.I7'
    end
    object IBDSSimpleI8: TIntegerField
      FieldName = 'I8'
      Origin = 'AUX_EVENTOS.I8'
    end
    object IBDSSimpleI9: TIntegerField
      FieldName = 'I9'
      Origin = 'AUX_EVENTOS.I9'
    end
    object IBDSSimpleVUNO1: TIBStringField
      FieldName = 'VUNO1'
      Origin = 'AUX_EVENTOS.VUNO1'
      Size = 1
    end
    object IBDSSimpleVUNO2: TIBStringField
      FieldName = 'VUNO2'
      Origin = 'AUX_EVENTOS.VUNO2'
      Size = 1
    end
    object IBDSSimpleVUNO3: TIBStringField
      FieldName = 'VUNO3'
      Origin = 'AUX_EVENTOS.VUNO3'
      Size = 1
    end
    object IBDSSimpleVUNO4: TIBStringField
      FieldName = 'VUNO4'
      Origin = 'AUX_EVENTOS.VUNO4'
      Size = 1
    end
    object IBDSSimpleVUNO5: TIBStringField
      FieldName = 'VUNO5'
      Origin = 'AUX_EVENTOS.VUNO5'
      Size = 1
    end
    object IBDSSimpleVUNO6: TIBStringField
      FieldName = 'VUNO6'
      Origin = 'AUX_EVENTOS.VUNO6'
      Size = 1
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleH1: TTimeField
      FieldName = 'H1'
      Origin = 'AUX_EVENTOS.H1'
    end
    object IBDSSimpleV12: TIBStringField
      FieldName = 'V12'
      Origin = 'AUX_EVENTOS.V12'
      Size = 100
    end
    object IBDSSimpleF1: TFloatField
      FieldName = 'F1'
      Origin = 'AUX_EVENTOS.F1'
    end
    object IBDSSimpleF2: TFloatField
      FieldName = 'F2'
      Origin = 'AUX_EVENTOS.F2'
    end
    object IBDSSimpleF3: TFloatField
      FieldName = 'F3'
      Origin = 'AUX_EVENTOS.F3'
    end
    object IBDSSimpleF4: TFloatField
      FieldName = 'F4'
      Origin = 'AUX_EVENTOS.F4'
    end
    object IBDSSimpleF5: TFloatField
      FieldName = 'F5'
      Origin = 'AUX_EVENTOS.F5'
    end
  end
  inherited IBQValidaciones: TIBQuery
    Left = 39
    Top = 98
  end
  inherited IBQEvento: TIBQuery
    Left = 11
    Top = 98
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 420
    Top = 238
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'select * from RN_ABORTO (:ANIMAL, :ESTABLECIMIENTO, :FECHA) ')
    Top = 70
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
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Top = 70
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'select id_evento_generado from SP_ABORTO('
      ' :FECHA , :ANIMAL , :OBSERVACION , :ESTABLECIMIENTO ,'
      
        ' :RESPONSABLE , :LOG_USUARIO , :LOG_FECHA_MODIFICADO, :ID_GRUPO,' +
        ' :DIAGNOSTICA, :TIPO)')
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
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIAGNOSTICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
    object IBQSPEventoIndID_EVENTO_GENERADO: TIntegerField
      FieldName = 'ID_EVENTO_GENERADO'
      Origin = 'SP_ABORTO.ID_EVENTO_GENERADO'
    end
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Top = 30
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 56
  end
  object IBDSActualizacionAborto: TIBDataSet [43]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from EVE_ABORTO'
      'where'
      '  ID_EVENTO = :OLD_ID_EVENTO')
    InsertSQL.Strings = (
      'insert into EVE_ABORTO'
      '  (TIPO, ID_EVENTO)'
      'values'
      '  (:TIPO, :ID_EVENTO)')
    RefreshSQL.Strings = (
      'Select '
      '  TIPO,'
      '  ID_EVENTO'
      'from EVE_ABORTO '
      'where'
      '  ID_EVENTO = :ID_EVENTO')
    SelectSQL.Strings = (
      'select * from EVE_ABORTO where (ID_EVENTO = :id_evento)')
    ModifySQL.Strings = (
      'update EVE_ABORTO'
      'set'
      '  TIPO = :TIPO,'
      '  ID_EVENTO = :ID_EVENTO'
      'where'
      '  ID_EVENTO = :OLD_ID_EVENTO')
    Left = 284
    Top = 70
  end
end
