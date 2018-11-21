inherited FMensajeAnimalesNuevos: TFMensajeAnimalesNuevos
  Left = 224
  Top = 141
  Caption = 'FMensajeAnimalesNuevos'
  ClientHeight = 533
  ClientWidth = 650
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited IbordeTop: TImage
    Width = 650
  end
  inherited PBotones: TPanel
    Top = 481
    Width = 650
    inherited IFondoBottom: TImage
      Width = 650
    end
  end
  inherited PTitulo: TPanel
    Width = 650
    inherited Image3: TImage
      Left = 454
    end
    inherited Image4: TImage
      Width = 258
    end
    inherited LTitulo: TLabel
      Width = 452
    end
  end
  inherited PTexto: TPanel
    Width = 650
    Height = 440
    inherited GroupBox2: TGroupBox
      Width = 650
      Height = 440
      object Label1: TLabel [0]
        Left = 52
        Top = 233
        Width = 463
        Height = 16
        Caption = 'Nota: Estos animales ser'#225'n dados de alta como animales externos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited Panel1: TPanel
        Width = 646
        inherited ImageAdvertencia: TImage
          Width = 466
        end
        inherited LTextoMensaje: TStaticText
          Left = 168
          Width = 476
          Align = alNone
          Caption = 
            'Los siguientes animales no existen en el sistema. Desea Ingresar' +
            'los?'
        end
      end
      object MAnimales: TMemo
        Left = 112
        Top = 85
        Width = 389
        Height = 139
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object MErrores: TMemo
        Left = 9
        Top = 274
        Width = 587
        Height = 95
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
  end
  object IBQGenId: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_ID_TABANIMALEXTERNO, 1)  AS IDANIMAL FROM RDB$' +
        'DATABASE')
    Left = 528
    Top = 72
  end
  object IBQInsertExterno: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into TAB_ANIMALES_EXTERNOS (id_animal_externo, establecim' +
        'iento, id_rp, id_hba, nombre, raza, sexo, propietario) values (:' +
        'id,:establecimiento,:rp,:hba,:nombre,:raza,:sexo,0)')
    Left = 576
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hba'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'raza'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sexo'
        ParamType = ptUnknown
      end>
  end
  object IBQRNIdentificacionExternos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from RN_IDENTIFICACION_EXTERNA(:animal,:esta,:rp,:senas' +
        'a,:pc,:hba,:ra,:otro)')
    Left = 576
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senasa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hba'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'otro'
        ParamType = ptUnknown
      end>
  end
end
