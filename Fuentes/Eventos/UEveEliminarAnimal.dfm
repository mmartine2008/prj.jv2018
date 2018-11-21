inherited FEveEliminarAnimal: TFEveEliminarAnimal
  Left = 222
  Top = 102
  Caption = 'Eliminar Animales'
  ClientHeight = 596
  ClientWidth = 1030
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1030
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
    Top = 483
    Width = 1030
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1022
      end
    end
  end
  inherited PDatos: TPanel
    Width = 1030
    Height = 396
    inherited PCBasico: TPageControl
      Width = 1030
      Height = 314
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 1022
          Height = 272
        end
        inherited MSimple: TMangazo
          Width = 1022
          Height = 272
          inherited GBFiltro: TGroupBox
            Width = 1022
          end
          inherited PSeleccion: TPanel
            Width = 1022
            inherited GBDisponibles: TGroupBox
              Height = 196
              inherited IFondoDis: TImage
                Height = 177
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 177
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
              Height = 196
              inherited IFondoSel: TImage
                Height = 177
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Height = 177
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
              Height = 196
              inherited IFondo: TImage
                Height = 196
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
            Width = 1022
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 1022
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 1022
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            FAWidth = 145
            FAHeight = 170
            FCWidth = 22
            FCHeight = 22
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
          object LRPAnimal: TLabel
            Left = 17
            Top = 32
            Width = 35
            Height = 20
            Caption = 'RP: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
        end
        inherited GBObservaciones: TGroupBox
          Height = 179
          inherited MAObservacion: TMemoAuto
            Height = 160
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Width = 927
          Height = 272
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
              Title.Caption = 'SENASA'
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 272
        end
        inherited PanelDer: TPanel
          Left = 974
          Height = 272
        end
      end
    end
    inherited PBotones: TPanel
      Top = 314
      Width = 1030
      inherited SBSelTodos: TSpeedButton
        Left = 961
      end
      inherited IFondoB2: TImage
        Width = 604
      end
      inherited BBCancelar: TBitBtn
        Left = 947
      end
      inherited BBAnterior: TBitBtn
        Left = 1045
      end
      inherited BBSiguiente: TBitBtn
        Left = 1143
      end
      inherited BBTerminar: TBitBtn
        Left = 1241
      end
      inherited PL: TPanel
        Left = 604
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1030
    Caption = 'Eliminar Animales'
    inherited LTitulo: TLabel
      Width = 626
    end
    inherited PILeft: TPanel
      Left = 822
    end
  end
  inherited Psocalo: TPanel
    Top = 461
    Width = 1030
    inherited JvSocalo: TJvImage
      Width = 1030
    end
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      '  (ID_SENASA, ID_RP, ID_ANIMAL, ID_AUX_EVENTO, EW)'
      'values'
      '  (:ID_SENASA, :ID_RP, :ID_ANIMAL, :ID_AUX_EVENTO, :EW)')
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
      '  DTA_BAJA'
      'from AUX_EVENTOS '
      'where'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO')
    SelectSQL.Strings = (
      'select  ID_RP, ID_SENASA, ID_ANIMAL,EW from AUX_EVENTOS ')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_SENASA = :ID_SENASA,'
      '  ID_RP = :ID_RP,'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO,'
      '  EW = :EW'
      'where'
      '  ID_AUX_EVENTO = :OLD_ID_AUX_EVENTO')
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
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
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
        DataField = 'ID_SENASA'
        Title = 'SENASA'
      end>
    Title.Text = 'Eliminar Animales'
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select * from RN_ELIMINAR_ANIMAL(:ANIMAL, :ESTABLECIMIENTO, :fec' +
        'ha) ')
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
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_ELIMINAR_ANIMAL('
      '  :ANIMAL)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end>
  end
  object IBQImagen: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * from tab_imagen where animal = :animal')
    Left = 48
    Top = 217
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
  end
end
