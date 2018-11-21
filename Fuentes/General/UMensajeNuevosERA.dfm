inherited FMensajeNuevosERA: TFMensajeNuevosERA
  Left = 196
  Top = 291
  Caption = 'FMensajeNuevosERA'
  ClientHeight = 730
  ClientWidth = 1008
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  inherited IbordeTop: TImage
    Width = 1008
  end
  inherited PBotones: TPanel
    Top = 678
    Width = 1008
    inherited IFondoBottom: TImage
      Width = 1008
    end
    inherited ISiATodo: TImage
      Left = 288
    end
    inherited LSiATodo: TLabel
      Left = 336
    end
    inherited LSi: TLabel
      Left = 448
      Width = 54
      Caption = 'Aceptar'
    end
    inherited Isi: TImage
      Left = 400
    end
    inherited INo: TImage
      Left = 560
    end
    inherited LNo: TLabel
      Left = 608
      Width = 63
      Caption = 'Cancelar'
    end
    inherited ICancel: TImage
      Left = 656
    end
    inherited LCancel: TLabel
      Left = 704
    end
    inherited IAceptar: TImage
      Left = 480
    end
    inherited LAceptar: TLabel
      Left = 528
    end
  end
  inherited PTitulo: TPanel
    Width = 1008
    inherited Image4: TImage
      Width = 810
    end
    inherited LTitulo: TLabel
      Width = 810
    end
  end
  inherited PTexto: TPanel
    Width = 1008
    Height = 621
    inherited GroupBox2: TGroupBox
      Width = 1008
      Height = 621
      object LNuevos: TLabel [0]
        Left = 11
        Top = 61
        Width = 112
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'Animales nuevos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LNroNuevos: TLabel [1]
        Left = 130
        Top = 61
        Width = 76
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'LNroNuevos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited Panel1: TPanel
        Width = 1004
        inherited ImageAdvertencia: TImage
          Width = 824
        end
        inherited LTextoMensaje: TStaticText
          Width = 824
        end
      end
      object Grilla: TBitDBGrid
        Left = 7
        Top = 95
        Width = 986
        Height = 462
        DataSource = DSNuevos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -48
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnCellClick = GrillaCellClick
        OnDrawColumnCell = GrillaDrawColumnCell
        AllowIncSearch = False
        ColumnVersion = 0
        DefaultColumns = True
        DrawingEllipse = True
        DrawReadOnly = False
        EnterKey = ekNone
        FillFields = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterType = foNone
        InternalDrag = False
        LongCaption = True
        MultiCaption = True
        RealTitleFont.Charset = DEFAULT_CHARSET
        RealTitleFont.Color = clWindowText
        RealTitleFont.Height = -13
        RealTitleFont.Name = 'Arial'
        RealTitleFont.Style = []
        RunTimePropEditor = True
        ShowCellHint = True
        TitleBtn = tbNone
        Columns = <
          item
            Expanded = False
            FieldName = 'V1'
            Title.Alignment = taCenter
            Title.Caption = 'Acci'#243'n'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACION'
            Title.Alignment = taCenter
            Title.Caption = 'Descripci'#243'n'
            Width = 497
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_RP'
            Title.Alignment = taCenter
            Title.Caption = 'RP ERA'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_PC'
            Title.Alignment = taCenter
            Title.Caption = 'RP Huella'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_HBA'
            Title.Alignment = taCenter
            Title.Caption = 'HBA ERA'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_RA'
            Title.Alignment = taCenter
            Title.Caption = 'HBA Huella'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_NACIMIENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha de Nacimiento ERA'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_ALTA'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha de Nacimiento Huella'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'V16'
            Title.Alignment = taCenter
            Title.Caption = 'Sexo ERA'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'V17'
            Title.Alignment = taCenter
            Title.Caption = 'Sexo Huella'
            Width = 65
            Visible = True
          end>
      end
      object RGAccion: TRadioGroup
        Left = 2
        Top = 560
        Width = 1004
        Height = 59
        Align = alBottom
        Caption = 'Accion'
        Columns = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 3
        Items.Strings = (
          'Todos de alta'
          'Actualizar todos'
          'Ignorar todos'
          'Personalizado')
        ParentFont = False
        TabOrder = 2
        OnClick = RGAccionClick
      end
    end
  end
  object DataSetNuevos: TIBDataSet
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from AUX_ANIMALES'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_ANIMALES'
      
        '  (ID_AUX, ESTABLECIMIENTO, ID_ANIMAL, ID_RP, ID_PC, ID_HBA, ID_' +
        'RA, '
      'FECHA_NACIMIENTO, '
      
        '   FECHA_ALTA, SEXO, LOTE, CATEGORIA, RAZA, OBSERVACION, V1, V16' +
        ', V17)'
      'values'
      
        '  (:ID_AUX, :ESTABLECIMIENTO, :ID_ANIMAL, :ID_RP, :ID_PC, :ID_HB' +
        'A, :ID_RA, '
      
        '   :FECHA_NACIMIENTO, :FECHA_ALTA, :SEXO, :LOTE, :CATEGORIA, :RA' +
        'ZA, '
      ':OBSERVACION, '
      '   :V1, :V16, :V17)')
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
      '  V17'
      'from AUX_ANIMALES '
      'where'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      
        'select id_aux, establecimiento, id_animal, id_rp, id_pc, id_hba,' +
        ' id_ra, fecha_nacimiento, fecha_alta, sexo, lote, categoria, raz' +
        'a, observacion,V1, V16,V17  from AUX_ANIMALES')
    ModifySQL.Strings = (
      'update AUX_ANIMALES'
      'set'
      '  ID_AUX = :ID_AUX,'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_RP = :ID_RP,'
      '  ID_PC = :ID_PC,'
      '  ID_HBA = :ID_HBA,'
      '  ID_RA = :ID_RA,'
      '  FECHA_NACIMIENTO = :FECHA_NACIMIENTO,'
      '  FECHA_ALTA = :FECHA_ALTA,'
      '  SEXO = :SEXO,'
      '  LOTE = :LOTE,'
      '  CATEGORIA = :CATEGORIA,'
      '  RAZA = :RAZA,'
      '  OBSERVACION = :OBSERVACION,'
      '  V1 = :V1,'
      '  V16 = :V16,'
      '  V17 = :V17'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Filtered = True
    Left = 28
    Top = 112
    object DataSetNuevosID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES.ID_AUX'
      Required = True
    end
    object DataSetNuevosESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'AUX_ANIMALES.ESTABLECIMIENTO'
    end
    object DataSetNuevosID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_ANIMALES.ID_ANIMAL'
      Required = True
    end
    object DataSetNuevosID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES.ID_RP'
      Size = 10
    end
    object DataSetNuevosID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES.ID_PC'
      Size = 10
    end
    object DataSetNuevosID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES.ID_HBA'
      Size = 10
    end
    object DataSetNuevosID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES.ID_RA'
      Size = 10
    end
    object DataSetNuevosFECHA_NACIMIENTO: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'AUX_ANIMALES.FECHA_NACIMIENTO'
    end
    object DataSetNuevosFECHA_ALTA: TDateField
      FieldName = 'FECHA_ALTA'
      Origin = 'AUX_ANIMALES.FECHA_ALTA'
    end
    object DataSetNuevosSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES.SEXO'
    end
    object DataSetNuevosLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'AUX_ANIMALES.LOTE'
    end
    object DataSetNuevosCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Origin = 'AUX_ANIMALES.CATEGORIA'
    end
    object DataSetNuevosRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES.RAZA'
    end
    object DataSetNuevosOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_ANIMALES.OBSERVACION'
      Size = 300
    end
    object DataSetNuevosV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_ANIMALES.V1'
      OnSetText = DataSetNuevosV1SetText
      Size = 50
    end
    object DataSetNuevosV16: TIBStringField
      FieldName = 'V16'
      Origin = 'AUX_ANIMALES.V16'
      Size = 50
    end
    object DataSetNuevosV17: TIBStringField
      FieldName = 'V17'
      Origin = 'AUX_ANIMALES.V17'
      Size = 50
    end
  end
  object DSNuevos: TDataSource
    DataSet = DataSetNuevos
    Left = 72
    Top = 112
  end
end
