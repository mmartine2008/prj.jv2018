inherited FEveModifDatosAnimal: TFEveModifDatosAnimal
  Left = 13
  Top = 38
  Caption = 'FEveModifDatosAnimal'
  ClientHeight = 690
  ClientWidth = 1008
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1008
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
    Width = 624
  end
  inherited PDatos: TPanel
    Width = 1008
    Height = 503
    inherited PBotones: TPanel
      Top = 446
      Width = 1008
      inherited Image1: TImage
        Width = 582
      end
      inherited BBCancelar: TBitBtn
        Top = 83
      end
      inherited BBAnterior: TBitBtn
        Top = 83
      end
      inherited PL: TPanel
        Left = 582
        inherited Image6: TImage
          Align = alCustom
        end
      end
      inherited BBSiguiente: TBitBtn
        Top = 65
      end
    end
    inherited PCBasico: TPageControl
      Width = 1008
      Height = 446
      inherited TSHDatos: TTabSheet
        inherited GBDatosEve: TGroupBox
          Width = 1000
        end
        inherited Panel3: TPanel
          Width = 1000
          Height = 24
        end
        inherited PIdenficacion: TPanel
          Width = 1000
          inherited GBIdentificacion: TGroupBox
            Width = 735
          end
        end
        inherited GBDatosParticulares: TGroupBox
          Width = 1000
        end
        inherited GBDatosRaza: TGroupBox
          Left = 8
          Top = 0
          inherited LSubCategoria: TLabel
            Enabled = False
          end
          inherited DBLCBASubCategoria: TDBLookupComboBoxAuto
            Top = 77
          end
        end
        inherited GBDatosIdentificacionSecundaria: TGroupBox
          Left = 120
          Top = 112
          inherited EAIdHBA: TEditAuto
            ISParam = False
          end
        end
        inherited GBDatosEspecificos: TGroupBox [6]
          Left = 496
          Top = 26
          inherited LInspeccion: TLabel
            Enabled = False
          end
          inherited LDestino: TLabel
            Enabled = False
          end
          inherited DBLCBAInspeccion: TDBLookupComboBoxAuto
            Enabled = False
          end
          inherited DBLCBADestCabania: TDBLookupComboBoxAuto
            Enabled = False
          end
        end
        inherited GBDatosParticular: TGroupBox [7]
          Top = 248
          inherited LActividad: TLabel
            Enabled = False
          end
          inherited LCodigoManejo: TLabel
            Enabled = False
          end
          inherited DBLCBAActividad: TDBLookupComboBoxAuto
            Enabled = False
          end
          inherited DBLCBACodigoManejo: TDBLookupComboBoxAuto
            Enabled = False
          end
          inherited CBSanguinea: TCheckBox
            Width = 161
          end
          inherited EASanguinea: TEditAuto
            Left = 763
            Top = 49
          end
        end
        inherited GBDatosIdentificacion: TGroupBox [8]
          Left = 64
          Top = 144
        end
        inherited GBDatosAlta: TGroupBox [9]
          Left = 192
          Top = 232
        end
        inherited GBDatosGenerales: TGroupBox [10]
          Left = 24
          Top = 240
          inherited ICopropiedad: TImage
            Left = 15
          end
          inherited CBInformadoAfip: TComboBox
            ParentShowHint = False
          end
        end
      end
      inherited TSHMadres: TTabSheet
        inherited GBMadreBiologica: TGroupBox
          Width = 1000
          inherited LNombreMadre: TLabel
            Left = 111
          end
          inherited LApodoMadre: TLabel
            Left = 111
          end
          inherited LSenesaMadre: TLabel
            Left = 111
          end
          inherited LPCMadre: TLabel
            Left = 335
          end
          inherited LHBAMadre: TLabel
            Left = 335
          end
          inherited LRAMadre: TLabel
            Left = 335
          end
          inherited LOtroMadre: TLabel
            Left = 335
          end
          inherited LRPAnimalMadre: TLabel
            Left = 111
          end
          inherited SBMadreB: TSpeedButton
            Left = 535
          end
          inherited SBMadreIndefinida: TSpeedButton
            Left = 535
          end
          inherited DBLCBASenasaMadreB: TDBLookupComboBoxAuto
            Left = 175
          end
          inherited DBLCBAPCMadreB: TDBLookupComboBoxAuto
            Left = 375
          end
          inherited DBLCBAHBAMadreB: TDBLookupComboBoxAuto
            Left = 375
          end
          inherited DBLCBARAMadreB: TDBLookupComboBoxAuto
            Left = 375
          end
          inherited DBLCBAOtroMadreB: TDBLookupComboBoxAuto
            Left = 375
          end
          inherited DBLCBARPMadreB: TDBLookupComboBoxAuto
            Left = 175
            ListSource = nil
            OnCloseUp = nil
            OnKeyPress = nil
          end
          inherited DBLCBAApodoMadreB: TDBLookupComboBoxAuto
            Left = 175
          end
          inherited DBLCBANombreMadreB: TDBLookupComboBoxAuto
            Left = 175
          end
        end
        inherited PHabilitarMadreR: TPanel
          Width = 1000
          Height = 163
          inherited GBMadreReceptora: TGroupBox
            Width = 1000
            Height = 163
          end
        end
      end
      inherited TSHPadres: TTabSheet
        inherited GBPadres: TGroupBox
          Width = 1000
        end
      end
      inherited TSHEstadoGeneral: TTabSheet
        inherited GBestadoHembras: TGroupBox
          Width = 1000
        end
        inherited GBEstadoMachos: TGroupBox
          Width = 1000
        end
        inherited Panel4: TPanel
          Width = 1000
          Height = 187
        end
        inherited GroupBox1: TGroupBox
          Width = 1000
        end
      end
      inherited TSHUbicacion: TTabSheet
        inherited PCentro: TPanel
          Width = 1000
          Height = 404
          inherited GBFiltro: TGroupBox
            Width = 1000
          end
          inherited GBGrupos: TGroupBox
            Width = 1000
            Height = 356
            inherited FrameSeleccionGrupos: TFrameSeleccion
              Width = 996
              Height = 337
              inherited PSeleccion: TPanel
                Width = 996
                Height = 337
                inherited PBotones: TPanel
                  Width = 386
                  Height = 337
                  inherited IFondo: TImage
                    Width = 386
                    Height = 337
                  end
                  inherited BBAgregarTodos: TJvImage
                    Top = 103
                    Width = 315
                  end
                  inherited BBAgregarUno: TJvImage
                    Top = 137
                    Width = 315
                  end
                  inherited BBEliminarUno: TJvImage
                    Top = 179
                    Width = 315
                  end
                  inherited BBEliminarTodos: TJvImage
                    Top = 220
                    Width = 315
                  end
                end
                inherited GBSeleccionados: TGroupBox
                  Left = 682
                  Height = 337
                  inherited BDBGSeleccionados: TBitDBGrid
                    Height = 318
                  end
                end
                inherited GBDisponibles: TGroupBox
                  Height = 337
                  inherited BDBGDisponibles: TBitDBGrid
                    Height = 318
                  end
                end
              end
            end
          end
        end
      end
      inherited TSHEconomia: TTabSheet
        inherited GBPrecio: TGroupBox
          Width = 1000
          inherited EAPrecioB: TEditAuto
            OnChange = nil
            OnExit = nil
            OnKeyPress = nil
          end
          inherited EAPrecioU: TEditAuto
            OnChange = nil
            OnExit = nil
            OnKeyPress = nil
          end
          inherited EAPeso: TEditAuto
            Text = '0'
            OnExit = nil
            OnKeyPress = nil
          end
          inherited DBLCBATiposPeso: TDBLookupComboBoxAuto
            Enabled = False
          end
        end
        inherited GBGastos: TGroupBox
          Width = 1000
        end
        inherited Panel5: TPanel
          Width = 1000
          Height = 227
        end
      end
      inherited TSHObservacion: TTabSheet
        inherited MAObservacion: TMemoAuto
          Width = 1000
          Height = 404
        end
      end
    end
  end
  inherited PError: TPageControl
    Top = 590
    Width = 1008
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1000
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1008
    Caption = 'Modificaci'#243'n de Animal'
    inherited LTitulo: TLabel
      Width = 604
    end
    inherited PILeft: TPanel
      Left = 800
    end
  end
  inherited Psocalo: TPanel
    Top = 568
    Width = 1008
    inherited JvSocalo: TJvImage
      Width = 1008
    end
  end
  inherited SDXLS: TSaveDialog
    Left = 558
    Top = 261
  end
  inherited DTXLS: TDataToXLS
    Left = 696
    Top = 265
  end
  inherited WinXP1: TWinXP
    Left = 656
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 268
    Top = 263
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Top = 263
  end
  inherited IBQMadreB: TIBQuery
    SQL.Strings = (
      
        'select AE.APODO, AE.ID_ANIMAL_EXTERNO as ID, AE.ID_HBA, AE.ID_OT' +
        'RO, AE.ID_PC, AE.ID_RA, AE.ID_RP, AE.ID_SENASA, AE.NOMBRE, AE.RA' +
        'ZA '
      ''
      'from  TAB_ANIMALES_EXTERNOS AE, COD_SEXOS C'
      ''
      
        'where (C.tipo = 2) and (AE.sexo = C.id_sexo) and (establecimient' +
        'o = :establecimiento) ')
  end
  inherited IBDSUnSoloPadre: TIBDataSet
    Left = 612
    Top = 264
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 428
    Top = 263
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 308
    Top = 263
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Top = 263
  end
  inherited IBQSPEventoInd: TIBQuery
    SQL.Strings = (
      'Execute PROCEDURE SP_MODIFICACION_ANIMAL'
      
        '( :ID_AUX , :ID_ANIMAL, :ID_RP , :ID_SENASA , :FECHA_NACIMIENTO ' +
        ', :PESO ,'
      '  :MADRE_BIOLOGICA_EXTERNA , :ESTADO_LACTACION ,'
      
        '  :RODEO , :RAZA , :POTRERO , :CATEGORIA,   :CRONOLOGIA_DENTARIA' +
        ' , :CONDICION_CORPORAL ,'
      '  :GDR  , :ESTADO_REPRODUCTIVO, :CIRCUNFERENCIA_ESCROTAL,'
      
        '  :ID_PC , :ID_HBA , :ID_RA , :ID_OTRO , :NOMBRE , :APODO, :SEXO' +
        ' ,'
      '  :MADRE_RECEPTORA_EXTERNA , :FECHA_EVENTO,'
      '  :TIPO_ALTA , :PRECIO_BRUTO , :PRECIO_UNITARIO,'
      '  :OBSERVACION , :ESTABLECIMIENTO , :RESPONSABLE ,'
      
        '  :PADRE_EXTERNO,   :GASTOS,         :MADRE_BIOLOGICA_INTERNA , ' +
        '  '
      
        '  :MADRE_RECEPTORA_INTERNA , :PADRE_INTERNO, :DTA, :DIASPESO, :P' +
        'ROPIETARIO,:ORIGEN,:CRIADOR,:ADN,:TIPIFICACIONSANGUINEA,:ID_IE,:' +
        'MOCHO,:COLOR, :INFORMADO_AFIP)'
      ''
      ''
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AUX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_RP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SENASA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_NACIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE_BIOLOGICA_EXTERNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADO_LACTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RODEO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RAZA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CATEGORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRONOLOGIA_DENTARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONDICION_CORPORAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GDR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADO_REPRODUCTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CIRCUNFERENCIA_ESCROTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_HBA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_RA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_OTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE_RECEPTORA_EXTERNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_EVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO_ALTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO_BRUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO_UNITARIO'
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
        Name = 'PADRE_EXTERNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GASTOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE_BIOLOGICA_INTERNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE_RECEPTORA_INTERNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PADRE_INTERNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIASPESO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PROPIETARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORIGEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRIADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPIFICACIONSANGUINEA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_IE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MOCHO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INFORMADO_AFIP'
        ParamType = ptUnknown
      end>
  end
  inherited IBQGetMinServicio: TIBQuery
    Left = 228
    Top = 264
  end
  object IBSPGetDatosAnimal: TIBStoredProc [60]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'GET_DATOS_ANIMAL'
    Left = 76
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_RP'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'ID_SENASA'
        ParamType = ptOutput
      end
      item
        DataType = ftDate
        Name = 'FECHA_NACIMIENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PESO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'MADRE_BIOLOGICA_INTERNA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'MADRE_BIOLOGICA_EXTERNA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'MADRE_RECEPTORA_INTERNA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'MADRE_RECEPTORA_EXTERNA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'ESTADO_LACTACION'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'RODEO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'RAZA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'POTRERO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CATEGORIA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CRONOLOGIA_DENTARIA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CONDICION_CORPORAL'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'GDR'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'CIRCUNFERENCIA_ESCROTAL'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'ESTADO_REPRODUCTIVO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'ID_PC'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'ID_HBA'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'ID_RA'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'ID_OTRO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'NOMBRE'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'APODO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'SEXO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO_BRUTO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO_UNITARIO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'GASTOS'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'RESPONSABLE'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'DTA'
        ParamType = ptOutput
      end
      item
        DataType = ftDate
        Name = 'FECHA_ALTA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_ALTA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'PADRE_INTERNO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'PADRE_EXTERNO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'DIASPESO'
        ParamType = ptOutput
      end
      item
        DataType = ftDate
        Name = 'FECHA_PESO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'ACTIVIDAD'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'ORIGEN'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CRIADOR'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'ADN'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'TIPIFICACION_SANGUINEA'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'ID_IE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'SUBCATEGORIA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CODIGOMANEJO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'MOCHO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'COLOR'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'NACIDO'
        ParamType = ptOutput
      end
      item
        DataType = ftDate
        Name = 'PRIMER_EVENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'ID_ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ESTABLECIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PROPIETARIO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'INFORMADO_AFIP'
        ParamType = ptOutput
      end
      item
        DataType = ftUnknown
        Name = 'car_oficial'
        ParamType = ptUnknown
      end>
    object IBSPGetDatosAnimalID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'GET_DATOS_ANIMAL.ID_RP'
      Size = 10
    end
    object IBSPGetDatosAnimalID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'GET_DATOS_ANIMAL.ID_SENASA'
      Size = 9
    end
    object IBSPGetDatosAnimalFECHA_NACIMIENTO: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'GET_DATOS_ANIMAL.FECHA_NACIMIENTO'
    end
    object IBSPGetDatosAnimalPESO: TFloatField
      FieldName = 'PESO'
      Origin = 'GET_DATOS_ANIMAL.PESO'
    end
    object IBSPGetDatosAnimalMADRE_BIOLOGICA_INTERNA: TIntegerField
      FieldName = 'MADRE_BIOLOGICA_INTERNA'
      Origin = 'GET_DATOS_ANIMAL.MADRE_BIOLOGICA_INTERNA'
    end
    object IBSPGetDatosAnimalMADRE_BIOLOGICA_EXTERNA: TIntegerField
      FieldName = 'MADRE_BIOLOGICA_EXTERNA'
      Origin = 'GET_DATOS_ANIMAL.MADRE_BIOLOGICA_EXTERNA'
    end
    object IBSPGetDatosAnimalMADRE_RECEPTORA_INTERNA: TIntegerField
      FieldName = 'MADRE_RECEPTORA_INTERNA'
      Origin = 'GET_DATOS_ANIMAL.MADRE_RECEPTORA_INTERNA'
    end
    object IBSPGetDatosAnimalMADRE_RECEPTORA_EXTERNA: TIntegerField
      FieldName = 'MADRE_RECEPTORA_EXTERNA'
      Origin = 'GET_DATOS_ANIMAL.MADRE_RECEPTORA_EXTERNA'
    end
    object IBSPGetDatosAnimalESTADO_LACTACION: TIntegerField
      FieldName = 'ESTADO_LACTACION'
      Origin = 'GET_DATOS_ANIMAL.ESTADO_LACTACION'
    end
    object IBSPGetDatosAnimalRODEO: TIntegerField
      FieldName = 'RODEO'
      Origin = 'GET_DATOS_ANIMAL.RODEO'
    end
    object IBSPGetDatosAnimalRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'GET_DATOS_ANIMAL.RAZA'
    end
    object IBSPGetDatosAnimalPOTRERO: TIntegerField
      FieldName = 'POTRERO'
      Origin = 'GET_DATOS_ANIMAL.POTRERO'
    end
    object IBSPGetDatosAnimalCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Origin = 'GET_DATOS_ANIMAL.CATEGORIA'
    end
    object IBSPGetDatosAnimalCRONOLOGIA_DENTARIA: TIntegerField
      FieldName = 'CRONOLOGIA_DENTARIA'
      Origin = 'GET_DATOS_ANIMAL.CRONOLOGIA_DENTARIA'
    end
    object IBSPGetDatosAnimalCONDICION_CORPORAL: TIntegerField
      FieldName = 'CONDICION_CORPORAL'
      Origin = 'GET_DATOS_ANIMAL.CONDICION_CORPORAL'
    end
    object IBSPGetDatosAnimalGDR: TIntegerField
      FieldName = 'GDR'
      Origin = 'GET_DATOS_ANIMAL.GDR'
    end
    object IBSPGetDatosAnimalCIRCUNFERENCIA_ESCROTAL: TFloatField
      FieldName = 'CIRCUNFERENCIA_ESCROTAL'
      Origin = 'GET_DATOS_ANIMAL.CIRCUNFERENCIA_ESCROTAL'
    end
    object IBSPGetDatosAnimalESTADO_REPRODUCTIVO: TIntegerField
      FieldName = 'ESTADO_REPRODUCTIVO'
      Origin = 'GET_DATOS_ANIMAL.ESTADO_REPRODUCTIVO'
    end
    object IBSPGetDatosAnimalID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'GET_DATOS_ANIMAL.ID_PC'
      Size = 10
    end
    object IBSPGetDatosAnimalID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'GET_DATOS_ANIMAL.ID_HBA'
      Size = 10
    end
    object IBSPGetDatosAnimalID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'GET_DATOS_ANIMAL.ID_RA'
      Size = 10
    end
    object IBSPGetDatosAnimalID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'GET_DATOS_ANIMAL.ID_OTRO'
      Size = 10
    end
    object IBSPGetDatosAnimalNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'GET_DATOS_ANIMAL.NOMBRE'
      Size = 100
    end
    object IBSPGetDatosAnimalAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'GET_DATOS_ANIMAL.APODO'
      Size = 100
    end
    object IBSPGetDatosAnimalSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'GET_DATOS_ANIMAL.SEXO'
    end
    object IBSPGetDatosAnimalPRECIO_BRUTO: TFloatField
      FieldName = 'PRECIO_BRUTO'
      Origin = 'GET_DATOS_ANIMAL.PRECIO_BRUTO'
    end
    object IBSPGetDatosAnimalPRECIO_UNITARIO: TFloatField
      FieldName = 'PRECIO_UNITARIO'
      Origin = 'GET_DATOS_ANIMAL.PRECIO_UNITARIO'
    end
    object IBSPGetDatosAnimalGASTOS: TFloatField
      FieldName = 'GASTOS'
      Origin = 'GET_DATOS_ANIMAL.GASTOS'
    end
    object IBSPGetDatosAnimalOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'GET_DATOS_ANIMAL.OBSERVACION'
      Size = 255
    end
    object IBSPGetDatosAnimalRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'GET_DATOS_ANIMAL.RESPONSABLE'
    end
    object IBSPGetDatosAnimalDTA: TIBStringField
      FieldName = 'DTA'
      Origin = 'GET_DATOS_ANIMAL.DTA'
      Size = 255
    end
    object IBSPGetDatosAnimalFECHA_ALTA: TDateField
      FieldName = 'FECHA_ALTA'
      Origin = 'GET_DATOS_ANIMAL.FECHA_ALTA'
    end
    object IBSPGetDatosAnimalTIPO_ALTA: TIntegerField
      FieldName = 'TIPO_ALTA'
      Origin = 'GET_DATOS_ANIMAL.TIPO_ALTA'
    end
    object IBSPGetDatosAnimalPADRE_INTERNO: TIntegerField
      FieldName = 'PADRE_INTERNO'
      Origin = 'GET_DATOS_ANIMAL.PADRE_INTERNO'
    end
    object IBSPGetDatosAnimalPADRE_EXTERNO: TIntegerField
      FieldName = 'PADRE_EXTERNO'
      Origin = 'GET_DATOS_ANIMAL.PADRE_EXTERNO'
    end
    object IBSPGetDatosAnimalDIASPESO: TIBStringField
      FieldName = 'DIASPESO'
      Origin = 'GET_DATOS_ANIMAL.DIASPESO'
      Size = 1
    end
    object IBSPGetDatosAnimalFECHA_PESO: TDateField
      FieldName = 'FECHA_PESO'
      Origin = 'GET_DATOS_ANIMAL.FECHA_PESO'
    end
    object IBSPGetDatosAnimalACTIVIDAD: TIntegerField
      FieldName = 'ACTIVIDAD'
      Origin = 'GET_DATOS_ANIMAL.ACTIVIDAD'
    end
    object IBSPGetDatosAnimalORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'GET_DATOS_ANIMAL.ORIGEN'
    end
    object IBSPGetDatosAnimalCRIADOR: TIntegerField
      FieldName = 'CRIADOR'
      Origin = 'GET_DATOS_ANIMAL.CRIADOR'
    end
    object IBSPGetDatosAnimalADN: TIBStringField
      FieldName = 'ADN'
      Origin = 'GET_DATOS_ANIMAL.ADN'
      Size = 255
    end
    object IBSPGetDatosAnimalTIPIFICACION_SANGUINEA: TIBStringField
      FieldName = 'TIPIFICACION_SANGUINEA'
      Origin = 'GET_DATOS_ANIMAL.TIPIFICACION_SANGUINEA'
      Size = 255
    end
    object IBSPGetDatosAnimalID_IE: TIBStringField
      FieldName = 'ID_IE'
      Origin = 'GET_DATOS_ANIMAL.ID_IE'
      Size = 64
    end
    object IBSPGetDatosAnimalSUBCATEGORIA: TIntegerField
      FieldName = 'SUBCATEGORIA'
      Origin = 'GET_DATOS_ANIMAL.SUBCATEGORIA'
    end
    object IBSPGetDatosAnimalCODIGOMANEJO: TIntegerField
      FieldName = 'CODIGOMANEJO'
      Origin = 'GET_DATOS_ANIMAL.CODIGOMANEJO'
    end
    object IBSPGetDatosAnimalMOCHO: TIntegerField
      FieldName = 'MOCHO'
      Origin = 'GET_DATOS_ANIMAL.MOCHO'
    end
    object IBSPGetDatosAnimalCOLOR: TIntegerField
      FieldName = 'COLOR'
      Origin = 'GET_DATOS_ANIMAL.COLOR'
    end
    object IBSPGetDatosAnimalNACIDO: TIBStringField
      FieldName = 'NACIDO'
      Origin = 'GET_DATOS_ANIMAL.NACIDO'
      Size = 1
    end
    object IBSPGetDatosAnimalPRIMER_EVENTO: TDateField
      FieldName = 'PRIMER_EVENTO'
      Origin = 'GET_DATOS_ANIMAL.PRIMER_EVENTO'
    end
    object IBSPGetDatosAnimalPROPIETARIO: TIntegerField
      FieldName = 'PROPIETARIO'
      Origin = 'GET_DATOS_ANIMAL.PROPIETARIO'
    end
    object IBSPGetDatosAnimalINFORMADO_AFIP: TStringField
      FieldName = 'INFORMADO_AFIP'
      Size = 2
    end
    object IBSPGetDatosAnimalcar_oficial: TStringField
      FieldName = 'car_oficial'
    end
  end
  object IBQGetPadres: TIBQuery [61]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select padre_externo as padre, '#39'N'#39' as Tipo, padre_externo as ID '
      
        'from rel_padres_externos where (animal=:ID_ANIMAL and establecim' +
        'iento=:ESTABLECIMIENTO)'
      'union'
      'select padre_interno as padre, '#39'S'#39' as Tipo, padre_interno as ID'
      
        'from rel_padres_internos where (animal=:ID_ANIMAL and establecim' +
        'iento=:ESTABLECIMIENTO)')
    Left = 60
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
  end
  object DSPadres: TDataSource [62]
    DataSet = IBQGetPadres
    Left = 92
    Top = 440
  end
  object IBQUnPadre: TIBQuery [63]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT V2 FROM aux_animales WHERE (id_animal=:animal)')
    Left = 60
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
  end
  object IBQSeleccionGrupos: TIBQuery [64]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT rpg.grupo, tg.nombre '
      'FROM rel_pertenece_grupo rpg, tab_grupos tg'
      
        'WHERE (rpg.establecimiento=:est and rpg.animal=:animal and rpg.a' +
        'ctivo='#39'S'#39' and tg.id_grupo=rpg.grupo)')
    Left = 196
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'est'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
  end
  object IBSPDatosPadre: TIBStoredProc [65]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'GET_DATOS_PADRES_ANIMAL'
    Left = 156
    Top = 472
  end
  object IBQCoopropiedad: TIBQuery [66]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT cpi.*, '
      '       cp.nombre '
      'FROM   coopropiedad_interna cpi '
      '       JOIN cod_propietario cp '
      '         ON cpi.id_propietario = cp.id_propietario '
      'WHERE  id_animal = :id_animal'
      ''
      '')
    Left = 736
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_animal'
        ParamType = ptUnknown
      end>
  end
  object DSCoopropiedad: TDataSource [67]
    DataSet = IBQCoopropiedad
    Left = 776
    Top = 264
  end
  object IBQInsertCoopropiedad: TIBQuery [68]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'insert into aux_coopropiedad(ID_ANIMAL,ID_PROPIETARIO,NOMBRE,POR' +
        'CENTAJE)'
      ''
      'VALUES(:IDANIMAL,:PROPIETARIO,:NOMBRE,:PORCENTAJE);'
      '')
    Left = 816
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PROPIETARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PORCENTAJE'
        ParamType = ptUnknown
      end>
  end
  object IBQTipoAlta: TIBQuery [69]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select first 1 ee.tipo as tipo'
      ''
      'from eve_eventos ee'
      ''
      'where (ee.animal = :id_animal) and (ee.tipo = 23)'
      ''
      'order by ee.fecha asc'
      '')
    Left = 920
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_animal'
        ParamType = ptUnknown
      end>
  end
  object IBQLimpiarCoopropAux: TIBQuery [70]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from aux_coopropiedad;')
    Left = 920
    Top = 72
  end
  object IBQMadre: TIBQuery [71]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_animal as id, id_rp, id_hba, nombre, apodo, '#39'INTERNA'#39' ' +
        'as Tipo from tab_animales where (id_rp like :rp or id_hba like :' +
        'rp or nombre like :nom or apodo like :nom) and (categoria = 6 or' +
        ' categoria = 5) '
      'union'
      
        'select id_animal_externo as id, id_rp, id_hba, nombre, apodo, '#39'E' +
        'XTERNA'#39' as Tipo from tab_animales_externos where (id_rp like :rp' +
        ' or id_hba like :rp or nombre like :nom or apodo like :nom) and ' +
        '(sexo = 2) ')
    Left = 316
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nom'
        ParamType = ptUnknown
      end>
  end
  object IBQPadre: TIBQuery [72]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_animal as id, id_rp, id_hba, nombre, apodo, '#39'INTERNO'#39' ' +
        'as Tipo from tab_animales where (id_rp like :rp or id_hba like :' +
        'rp or nombre like :nom or apodo like :nom) and (categoria = 3)'
      'union'
      
        'select id_animal_externo as id, id_rp, id_hba, nombre, apodo, '#39'E' +
        'XTERNO'#39' as Tipo from tab_animales_externos where (id_rp like :rp' +
        ' or id_hba like :rp or nombre like :nom or apodo like :nom) and ' +
        '(sexo = 1)')
    Left = 468
    Top = 497
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nom'
        ParamType = ptUnknown
      end>
  end
  object IBQObservacionLarga: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT OBSERVACION FROM TAB_OBSERVACIONES WHERE ID_ANIMAL = :ID;')
    Left = 760
    Top = 129
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
