inherited FEveIngresoServicio: TFEveIngresoServicio
  Left = 254
  Top = 26
  HelpContext = 21000
  Constraints.MinWidth = 943
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
      inherited TSServicio: TTabSheet
        ImageIndex = 6
        inherited BDBGServicios: TDBGrid
          Width = 1000
          Height = 404
          OnExit = GetEvent
        end
      end
      inherited TSManga: TTabSheet
        ImageIndex = 3
        inherited MSimple: TMangazo
          inherited PSeleccion: TPanel
            inherited GBDisponibles: TGroupBox
              inherited BDBGDisponibles: TBitDBGrid
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 131
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
                    Width = 180
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              inherited BDBGSeleccionados: TBitDBGrid
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
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Width = 221
                    Visible = True
                  end>
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
          inherited LFecha: TLabel
            Left = 258
            Top = 76
          end
          inherited LResponsable: TLabel
            Left = 224
            Top = 115
            Width = 87
            Cursor = crHandPoint
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = LResponsableClick
            OnMouseEnter = LResponsableMouseEnter
            OnMouseLeave = LResponsableMouseLeave
          end
          object LCondicionCorporal: TLabel [2]
            Left = 187
            Top = 40
            Width = 110
            Height = 22
            AutoSize = False
            Caption = 'Condicion Corporal:'
            Layout = tlCenter
          end
          inherited DTPAFecha: TDateTimePickerAuto
            Left = 318
            Top = 78
            Color = 14679807
            OnExit = GetEvent
            EsRequerido = True
          end
          inherited DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 318
            Top = 116
            Color = 14679807
            OnExit = GetEvent
            EsRequerido = True
          end
          object DBLCBACondicionCorporal: TDBLookupComboBoxAuto
            Left = 318
            Top = 39
            Width = 164
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_CONDICION_CORPORAL'
            ListField = 'ESCALA'
            ListSource = DMSoftvet.DSCondicionCorporal
            TabOrder = 2
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object CBCondicionCorporal: TCheckBox
            Left = 165
            Top = 40
            Width = 19
            Height = 22
            TabOrder = 3
            OnClick = CBCondicionCorporalClick
            OnKeyPress = CBCondicionCorporalKeyPress
          end
        end
        inherited GBObservaciones: TGroupBox
          inherited MAObservacion: TMemoAuto
            Width = 998
            Height = 216
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          TitleFont.Height = -13
          Columns = <
            item
              Color = clWhite
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Caption = 'RP'
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'ID_SENASA'
              ReadOnly = True
              Title.Caption = 'Senasa'
              Width = 61
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'CONDICIONCORPORAL'
              Title.Caption = 'Condicion Corporal'
              Width = 99
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observacion'
              Width = 173
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'SERVICIO'
              ReadOnly = True
              Title.Caption = 'Servicio'
              Width = 170
              Visible = True
            end
            item
              Color = clWhite
              Expanded = False
              FieldName = 'RESP'
              Title.Caption = 'Responsable'
              Width = 139
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 539
      end
      inherited BBCancelar: TBitBtn
        Left = 637
      end
      inherited BBAnterior: TBitBtn
        Left = 728
      end
      inherited BBSiguiente: TBitBtn
        Left = 820
      end
      inherited BBTerminar: TBitBtn
        Left = 912
      end
      inherited BIngresoSecuenciado: TBitBtn
        Left = 285
      end
      inherited BSacarAnimal: TBitBtn
        Left = 155
        Width = 195
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Ingreso de Hembra a un servicio'
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 92
  end
  inherited DSSimple: TDataSource
    Left = 376
    Top = 64
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_ANIMAL, ID_AUX_EVENTO, ID_RP, ID_SENASA, FECHA, OBSERVACIO' +
        'N, '
      'RESPONSABLE, '
      '   EW)'
      'values'
      
        '  (:ID_ANIMAL, :ID_AUX_EVENTO, :ID_RP, :ID_SENASA, :FECHA, :OBSE' +
        'RVACION, '
      '   :RESPONSABLE, :EW)')
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
      '  EW'
      'from AUX_EVENTOS '
      'where'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO')
    SelectSQL.Strings = (
      
        'select ID_ANIMAL, ID_AUX_EVENTO, ID_RP, ID_SENASA, FECHA, I1 as ' +
        'IDSERVICIO, OBSERVACION, RESPONSABLE, V1 AS SERVICIO, I2 AS IDCO' +
        'NDCORPORAL, F1 CONDICIONCORPORAL, V3 AS RESP, EW  from AUX_EVENT' +
        'OS')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO,'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  FECHA = :FECHA,'
      '  OBSERVACION = :OBSERVACION,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  EW = :EW'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    GeneratorField.Field = 'ID_AUX_EVENTO'
    GeneratorField.Generator = 'GEN_AUX_EVENTOS'
    Left = 124
    Top = 94
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleID_AUX_EVENTO: TIntegerField
      FieldName = 'ID_AUX_EVENTO'
      Origin = 'AUX_EVENTOS.ID_AUX_EVENTO'
    end
    object IBDSSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_EVENTOS.ID_RP'
      OnSetText = IBDSSimpleFECHASetText
      Size = 10
    end
    object IBDSSimpleID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_EVENTOS.ID_SENASA'
      OnSetText = IBDSSimpleFECHASetText
      Size = 9
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
      OnSetText = IBDSSimpleFECHASetText
    end
    object IBDSSimpleIDSERVICIO: TIntegerField
      FieldName = 'IDSERVICIO'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      OnSetText = SetText
      Size = 255
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleSERVICIO: TIBStringField
      FieldName = 'SERVICIO'
      Origin = 'AUX_EVENTOS.V1'
      Size = 100
    end
    object IBDSSimpleIDCONDCORPORAL: TIntegerField
      FieldName = 'IDCONDCORPORAL'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleCONDICIONCORPORAL: TFloatField
      FieldName = 'CONDICIONCORPORAL'
      Origin = 'AUX_EVENTOS.F1'
      OnSetText = IBDSSimpleCONDICIONCORPORALSetText
    end
    object IBDSSimpleRESP: TIBStringField
      FieldName = 'RESP'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = IBDSSimpleFECHASetText
      Size = 100
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
  end
  inherited IBQValidaciones: TIBQuery
    Left = 68
    Top = 166
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
        DataField = 'CONDICIONCORPORAL'
        Title = 'Condici'#243'n Corporal'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end
      item
        DataField = 'SERVICIO'
        Title = 'Servicio'
      end
      item
        DataField = 'RESP'
        Title = 'Responsable'
      end>
    Title.Text = 'Ingreso de Hembra a un servicio'
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from  RN_INGRESO_SERVICIO(:ANIMAL, :fecha, :ESTA,:servi' +
        'cio) ')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'servicio'
        ParamType = ptUnknown
      end>
    object IBQSPRNRESULT: TIBStringField
      FieldName = 'RESULT'
      Origin = 'RN_INGRESO_SERVICIO.RESULT'
      Size = 1
    end
    object IBQSPRNMENSAJE: TIBStringField
      FieldName = 'MENSAJE'
      Origin = 'RN_INGRESO_SERVICIO.MENSAJE'
      Size = 150
    end
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_INGRESO_SERVICIO(:FECHA,:ANIMAL, :OBSERVACI' +
        'ON,   :ESTABLECIMIENTO,  :RESPONSABLE,  :LOG_USUARIO,'
      
        '  :LOG_FECHA_MODIFICADO, :SERVICIO, :ID_GRUPO, :CONDICION_CORPOR' +
        'AL,:ID_POTRERO)'
      ''
      '')
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
        Name = 'SERVICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONDICION_CORPORAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_POTRERO'
        ParamType = ptUnknown
      end>
  end
  object IBQEdadAnimal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        '         select rpe.valor from sys_juego_parametros sjp, rel_par' +
        'ametros_establecimiento rpe'
      
        '         where (sjp.id_parametro = rpe.parametro) and (rpe.estab' +
        'lecimiento = :establecimiento) and (sjp.nombre = :nombreparametr' +
        'o)')
    Left = 776
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombreparametro'
        ParamType = ptUnknown
      end>
    object IBQEdadAnimalVALOR: TIBStringField
      FieldName = 'VALOR'
      Origin = 'REL_PARAMETROS_ESTABLECIMIENTO.VALOR'
      Size = 25
    end
  end
  object IBSPVerificarAnimalServ: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'SP_VERIFICAR_ANIMAL_EN_SERVICIO'
    Left = 676
    Top = 152
  end
  object IBQDeleteServicios: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from ala_servicio_natural where (establecimiento=:esta)')
    Left = 692
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
end
