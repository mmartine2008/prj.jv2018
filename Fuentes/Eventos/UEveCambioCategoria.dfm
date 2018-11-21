inherited FEveCambioCategoria: TFEveCambioCategoria
  Left = 29
  Top = 89
  Caption = 'FEveCambioCategoria'
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
              inherited BDBGDisponibles: TBitDBGrid
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Alignment = taCenter
                    Title.Caption = 'RP'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE'
                    Title.Caption = 'Nombre'
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              inherited BDBGSeleccionados: TBitDBGrid
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_HBA'
                    Title.Caption = 'SENASA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE'
                    Visible = True
                  end>
              end
            end
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select  ID_AUX,ID_RP, ID_SENASA,id_animal, sexo, categoria, nomb' +
                're, id_hba from AUX_ANIMALES'
              'where id_animal > 0'
              ''
              ''
              '')
          end
          inherited IBUSQLIntercambiarIzq: TIBUpdateSQL
            ModifySQL.Strings = (
              'update AUX_ANIMALES'
              'set'
              '  ID_RP = :ID_RP,'
              '  ID_SENASA = :ID_SENASA,'
              '  ID_ANIMAL = :ID_ANIMAL,'
              '  SEXO = :SEXO,'
              '  ID_AUX= :ID_AUX,'
              '  CATEGORIA = :CATEGORIA'
              'where'
              '  ID_ANIMAL = :OLD_ID_ANIMAL')
            InsertSQL.Strings = (
              'insert into AUX_ANIMALES'
              '  (ID_AUX,ID_RP, ID_SENASA, ID_ANIMAL, SEXO, CATEGORIA)'
              'values'
              '  (:ID_AUX,:ID_RP, :ID_SENASA, :ID_ANIMAL, :SEXO, :CATEGORIA)')
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
              '  SEXO = :SEXO,'
              '  CATEGORIA = :CATEGORIA'
              'where'
              '  ID_ANIMAL = :OLD_ID_ANIMAL')
            InsertSQL.Strings = (
              'insert into Tab_Animales'
              '  (ID_ANIMAL, ID_RP, ID_SENASA, SEXO,CATEGORIA)'
              'values'
              '  (:ID_ANIMAL, :ID_RP, :ID_SENASA, :SEXO,:CATEGORIA)')
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          object LFecha: TLabel
            Left = 106
            Top = 33
            Width = 36
            Height = 23
            AutoSize = False
            Caption = 'Fecha:'
            Layout = tlCenter
          end
          object LObservador: TLabel
            Left = 67
            Top = 77
            Width = 75
            Height = 22
            Cursor = crHandPoint
            AutoSize = False
            Caption = 'Responsable:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
            Layout = tlCenter
            OnClick = LObservadorClick
            OnMouseEnter = LObservadorMouseEnter
            OnMouseLeave = LObservadorMouseLeave
          end
          object LCategoria: TLabel
            Left = 49
            Top = 129
            Width = 96
            Height = 22
            Cursor = crHandPoint
            AutoSize = False
            Caption = 'Nueva Categor'#237'a:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
            Layout = tlCenter
            OnClick = LCategoriaClick
            OnMouseEnter = LCategoriaMouseEnter
            OnMouseLeave = LCategoriaMouseLeave
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 167
            Top = 33
            Width = 130
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
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 167
            Top = 78
            Width = 233
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
            ISParam = False
          end
          object DBLCBACategoria: TDBLookupComboBoxAuto
            Left = 167
            Top = 128
            Width = 233
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_CATEGORIA'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSCategorias
            TabOrder = 2
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              Title.Caption = 'RP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Caption = 'Fecha'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V2'
              ReadOnly = True
              Title.Caption = 'Categor'#237'a Anterior'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V1'
              Title.Caption = 'Categor'#237'a Nueva'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V3'
              Title.Caption = 'Responsable'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observaci'#243'n'
              Width = 200
              Visible = True
            end>
        end
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Cambio de Categor'#237'a'
    inherited LTitulo: TLabel
      Caption = 'Cambio de Categor'#237'a'
    end
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, FECHA, RESPONSABLE,' +
        ' V1, I1, '
      '   V2, I2, V3, EW)'
      'values'
      
        '  (:ID_RP, :ID_SENASA, :ID_ANIMAL, :OBSERVACION, :FECHA, :RESPON' +
        'SABLE, '
      '   :V1, :I1, :V2, :I2, :V3, :EW)')
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
      '  V14'
      'from AUX_EVENTOS '
      'where'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      
        'select  ID_RP, ID_SENASA, ID_ANIMAL, OBSERVACION, D1 AS FECHA, R' +
        'ESPONSABLE, V1, I1, V2, I2, V3, EW from AUX_EVENTOS ')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  OBSERVACION = :OBSERVACION,'
      '  FECHA = :FECHA,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  V1 = :V1,'
      '  I1 = :I1,'
      '  V2 = :V2,'
      '  I2 = :I2,'
      '  V3 = :V3,'
      '  EW = :EW'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
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
    object IBDSSimpleV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_EVENTOS.V2'
      Size = 100
    end
    object IBDSSimpleI2: TIntegerField
      FieldName = 'I2'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleV3: TIBStringField
      FieldName = 'V3'
      Origin = 'AUX_EVENTOS.V3'
      Size = 100
    end
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
        DataField = 'V2'
        Title = 'Categor'#237'a Anterior'
      end
      item
        DataField = 'V1'
        Title = 'Categor'#237'a Nueva'
      end
      item
        DataField = 'V3'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end>
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from RN_CAMBIO_CATEGORIA(:ANIMAL , :FECHA ,  :ESTABLECI' +
        'MIENTO,:CATEGORIA_ANTERIOR, :CATEGORIA_NUEVA)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CATEGORIA_ANTERIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CATEGORIA_NUEVA'
        ParamType = ptUnknown
      end>
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_CAMBIO_CATEGORIA('
      
        '  :FECHA,  :ANIMAL,  :OBSERVACION,  :ESTABLECIMIENTO,         :R' +
        'ESPONSABLE,  :LOG_USUARIO,  :LOG_FECHA_MODIFICADO,'
      
        '  :CATEGORIA_ANTERIOR, :CATEGORIA_NUEVA,  :ID_GRUPO, :DISPARADOR' +
        ')')
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
        Name = 'CATEGORIA_ANTERIOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CATEGORIA_NUEVA'
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
      end>
  end
  object IBQCategoria: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_categoria, nombre from cod_categorias')
    Left = 588
    Top = 180
  end
  object DSCategoria: TDataSource
    DataSet = IBQCategoria
    Left = 628
    Top = 180
  end
  object IBQGetCatEdad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM SP_RECALCULAR_CATEGORIA(:FECHA,:ANIMAL)')
    Left = 596
    Top = 252
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
      end>
  end
end
