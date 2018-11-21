inherited FMangaPadresExternos: TFMangaPadresExternos
  Left = 104
  Top = 170
  Caption = 'FMangaPadresExternos'
  ClientHeight = 400
  ClientWidth = 886
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 886
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
  inherited Image4: TImage
    Width = 502
  end
  object PBotones: TPanel [4]
    Left = 0
    Top = 299
    Width = 886
    Height = 60
    Align = alBottom
    TabOrder = 3
    object BBAceptar: TBitBtn
      Left = 767
      Top = 17
      Width = 87
      Height = 27
      Caption = 'Terminar'
      TabOrder = 0
      OnClick = BBAceptarClick
      Kind = bkOK
    end
  end
  inline FSPadres: TFrameSeleccion [5]
    Left = 0
    Top = 65
    Width = 886
    Height = 234
    Align = alClient
    TabOrder = 2
    inherited PSeleccion: TPanel
      Width = 886
      Height = 234
      inherited PBotones: TPanel
        Left = 345
        Width = 206
        Height = 234
        inherited BBAgregarTodos: TBitBtn
          Left = 32
          Top = 78
          Width = 141
          Height = 26
          Font.Height = -12
        end
        inherited BBEliminarUno: TBitBtn
          Left = 32
          Top = 145
          Width = 144
          Height = 27
          Font.Height = -12
        end
        inherited BBEliminarTodos: TBitBtn
          Left = 32
          Top = 179
          Width = 144
          Height = 27
          Font.Height = -12
        end
        inherited BBAgregarUno: TBitBtn
          Left = 32
          Top = 111
          Width = 144
          Height = 27
          Font.Height = -12
        end
      end
      inherited GBSeleccionados: TGroupBox
        Left = 551
        Width = 335
        Height = 234
        inherited BDBGSeleccionados: TBitDBGrid
          Top = 16
          Width = 331
          Height = 216
          Font.Height = -12
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              Title.Caption = 'RP Animal'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Title.Caption = 'Nombre'
              Width = 211
              Visible = True
            end>
        end
      end
      inherited GBDisponibles: TGroupBox
        Width = 345
        Height = 234
        inherited BDBGDisponibles: TBitDBGrid
          Top = 16
          Width = 341
          Height = 216
          Font.Height = -12
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              Title.Caption = 'RP Animal'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Title.Caption = 'Nombre'
              Width = 214
              Visible = True
            end>
        end
      end
    end
    inherited IBQDisponibles: TIBQuery
      SQL.Strings = (
        
          'SELECT * FROM TAB_ANIMALES_EXTERNOS WHERE ESTABLECIMIENTO = :EST' +
          'A AND SEXO = :SEXO AND ID_ANIMAL_EXTERNO NOT IN (SELECT ID_ANIMA' +
          'L_EXTERNO FROM AUX_ANIMALES_EXTERNOS)')
      ParamData = <
        item
          DataType = ftUnknown
          Name = 'ESTA'
          ParamType = ptUnknown
        end
        item
          DataType = ftUnknown
          Name = 'SEXO'
          ParamType = ptUnknown
        end>
    end
    inherited IBUSQLIntercambiar: TIBUpdateSQL
      RefreshSQL.Strings = (
        'Select '
        '  ID_ANIMAL_EXTERNO,'
        '  ID_AUX,'
        '  ID_OTRO,'
        '  ID_PC,'
        '  ID_HBA,'
        '  ID_RA,'
        '  ID_RP,'
        '  ID_SENASA,'
        '  NOMBRE,'
        '  APODO,'
        '  RAZA,'
        '  SEXO,'
        '  INTERNO'
        'from AUX_ANIMALES_EXTERNOS '
        'where'
        '  ID_ANIMAL_EXTERNO = :ID_ANIMAL_EXTERNO')
      ModifySQL.Strings = (
        'update AUX_ANIMALES_EXTERNOS'
        'set'
        '  ID_ANIMAL_EXTERNO = :ID_ANIMAL_EXTERNO,'
        '  ID_AUX = :ID_AUX,'
        '  ID_RP = :ID_RP,'
        '  NOMBRE = :NOMBRE,'
        '  SEXO = :SEXO'
        'where'
        '  ID_ANIMAL_EXTERNO = :OLD_ID_ANIMAL_EXTERNO')
      InsertSQL.Strings = (
        'insert into AUX_ANIMALES_EXTERNOS'
        '  (ID_ANIMAL_EXTERNO, ID_AUX, ID_RP, NOMBRE, SEXO)'
        'values'
        '  (:ID_ANIMAL_EXTERNO, :ID_AUX, :ID_RP, :NOMBRE, :SEXO)')
      DeleteSQL.Strings = (
        'delete from AUX_ANIMALES_EXTERNOS'
        'where'
        '  ID_ANIMAL_EXTERNO = :OLD_ID_ANIMAL_EXTERNO')
      Left = 397
    end
    inherited IBQSeleccionados: TIBQuery
      SQL.Strings = (
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE '
        'ID_AUX = :NIVEL AND SEXO = :SEXO')
      ParamData = <
        item
          DataType = ftUnknown
          Name = 'NIVEL'
          ParamType = ptUnknown
        end
        item
          DataType = ftUnknown
          Name = 'SEXO'
          ParamType = ptUnknown
        end>
    end
  end
  inherited PTitulo: TPanel [6]
    Width = 886
    inherited LTitulo: TLabel
      Width = 502
    end
    inherited PILeft: TPanel
      Left = 698
    end
  end
  inherited Psocalo: TPanel [7]
    Top = 359
    Width = 886
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc [9]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 132
    Top = 65535
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc [10]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 636
    Top = 65535
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc [11]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 612
    Top = 65535
  end
  inherited IBSPGeneradores: TIBStoredProc [12]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 108
    Top = 65527
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc [13]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 508
    Top = 7
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc [14]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 580
    Top = 65535
  end
  inherited ALUniversal: TActionList [15]
    Left = 659
    Top = 65534
  end
  inherited IBSPEstadisticas: TIBStoredProc [16]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 20
    Top = 65535
  end
  inherited SDXLS: TSaveDialog [17]
    Left = 46
    Top = 65533
  end
  inherited DTXLS: TDataToXLS [18]
    Left = 80
    Top = 65529
  end
  inherited WinXP1: TWinXP [19]
    Left = 536
    Top = 0
  end
  inherited IBQGetCantAnimales: TIBQuery [20]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
end
