inherited FMangaReceptoras: TFMangaReceptoras
  Left = 132
  Top = 62
  Caption = 'FMangaReceptoras'
  ClientHeight = 639
  ClientWidth = 841
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 841
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
    Width = 457
  end
  object PMensaje: TPanel [4]
    Left = 0
    Top = 65
    Width = 841
    Height = 62
    Align = alTop
    Color = clWhite
    TabOrder = 4
    object Label1: TLabel
      Left = 17
      Top = 20
      Width = 538
      Height = 13
      Caption = 
        'Los datos de la transferencia se cargaran una vez finalizada la ' +
        'colecta de todos los embriones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PBotones: TPanel [5]
    Left = 0
    Top = 544
    Width = 841
    Height = 54
    Align = alBottom
    Color = clWhite
    TabOrder = 3
    object BBCancelar: TBitBtn
      Left = 594
      Top = 10
      Width = 96
      Height = 34
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = BBCancelarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BBAceptar: TBitBtn
      Left = 715
      Top = 9
      Width = 96
      Height = 34
      Caption = 'Aceptar'
      Default = True
      TabOrder = 1
      OnClick = BBAceptarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  inline Manga: TMangazo [6]
    Left = 0
    Top = 127
    Width = 841
    Height = 417
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    inherited GBFiltro: TGroupBox
      Width = 841
      Height = 124
      inherited LCategoria: TLabel
        Left = 474
        Top = 215
        Width = 61
        Height = 23
      end
      inherited LBuscarAnimales: TLabel
        Left = 17
        Top = 23
        Width = 294
        Height = 17
        Font.Height = -15
      end
      inherited IBuscarAnimal: TImage
        Left = 103
        Top = 80
        Width = 105
        Height = 33
      end
      inherited JvIBotonBuscar: TJvImage
        Left = -108
        Top = 81
        Width = 105
        Height = 34
      end
      inherited RBTodas: TRadioButton
        Left = 112
        Top = 215
        Width = 61
        Height = 23
      end
      inherited RBPotrero: TRadioButton
        Left = 218
        Top = 215
        Width = 62
        Height = 23
      end
      inherited RBAnimales: TRadioButton
        Left = 10
        Top = 215
        Width = 70
        Height = 27
      end
      inherited RBGrupo: TRadioButton
        Left = 468
        Top = 215
        Width = 62
        Height = 23
      end
      inherited RBRodeo: TRadioButton
        Left = 218
        Top = 215
        Width = 70
        Height = 23
      end
      inherited DBEAnimal: TEdit
        Left = 69
        Top = 215
        Width = 104
      end
      inherited DBLCBGrupo: TDBLookupComboBoxAuto
        Left = 543
        Top = 215
        Width = 215
        Height = 23
      end
      inherited DBLCBRodeo: TDBLookupComboBoxAuto
        Left = 293
        Top = 215
        Width = 156
        Height = 23
      end
      inherited DBLCBCategoria: TDBLookupComboBoxAuto
        Left = 543
        Top = 215
        Width = 215
        Height = 23
      end
      inherited DBLCBPotrero: TDBLookupComboBoxAuto
        Left = 293
        Top = 215
        Width = 156
        Height = 23
      end
      inherited CBPotrero: TCheckBox
        Left = 216
        Top = 215
        Width = 70
        Height = 19
      end
      inherited CBRodeo: TCheckBox
        Left = 216
        Top = 215
        Width = 70
        Height = 19
      end
      inherited CBGrupo: TCheckBox
        Left = 470
        Top = 215
        Width = 61
        Height = 19
      end
      inherited CBCategoria: TCheckBox
        Left = 468
        Top = 215
        Width = 70
        Height = 19
      end
      inherited CBAnimal: TCheckBox
        Left = 9
        Top = 215
        Width = 57
        Height = 19
      end
      inherited CBATipoIdentificador: TComboBoxAuto
        Left = 69
        Top = 215
        Width = 130
        Height = 23
        ItemHeight = 15
      end
      inherited CBxRaza: TComboBox
        Left = 396
        Top = 17
        Width = 174
        Height = 23
        ItemHeight = 15
      end
      inherited CBxColor: TComboBox
        Left = 396
        Top = 55
        Width = 174
        Height = 23
        ItemHeight = 15
      end
      inherited CBxTipoRegistro: TComboBox
        Left = 396
        Top = 89
        Width = 174
        Height = 23
        ItemHeight = 15
      end
      inherited CBxPotrero: TComboBox
        Left = 620
        Top = 55
        Width = 156
        Height = 23
        ItemHeight = 15
      end
      inherited CBxRodeo: TComboBox
        Left = 827
        Top = 17
        Width = 237
        Height = 23
        ItemHeight = 15
      end
      inherited CBxGrupo: TComboBox
        Left = 827
        Top = 55
        Width = 237
        Height = 23
        ItemHeight = 15
      end
      inherited CBxCategoria: TComboBox
        Left = 620
        Top = 17
        Width = 156
        Height = 23
        ItemHeight = 15
      end
      inherited EBuscarAnimal: TEdit
        Left = 17
        Top = 48
        Width = 294
        Font.Height = -16
      end
    end
    inherited PSeleccion: TPanel
      Top = 185
      Width = 841
      Height = 232
      inherited GBDisponibles: TGroupBox
        Width = 431
        Height = 232
        Font.Height = -13
        inherited IFondoDis: TImage
          Top = 18
          Width = 427
          Height = 212
        end
        inherited BDBGDisponibles: TBitDBGrid
          Top = 18
          Width = 427
          Height = 212
          Font.Height = -12
          TitleFont.Height = -13
          OnCellClick = MangaBDBGDisponiblesCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              Title.Caption = 'RP Animal'
              Width = 135
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_SENASA'
              Title.Caption = 'SENASA'
              Width = 148
              Visible = True
            end>
        end
      end
      inherited GBSeleccionados: TGroupBox
        Left = 538
        Width = 303
        Height = 232
        Font.Height = -13
        inherited IFondoSel: TImage
          Top = 18
          Width = 299
          Height = 212
        end
        inherited BDBGSeleccionados: TBitDBGrid
          Top = 18
          Width = 299
          Height = 212
          Font.Height = -13
          ParentFont = False
          TitleFont.Height = -13
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              Title.Caption = 'RP Animal'
              Width = 154
              Visible = True
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
        Left = 431
        Width = 107
        Height = 232
        inherited IFondo: TImage
          Width = 107
          Height = 232
        end
        inherited BBAgregarTodos: TBitBtn
          Left = 9
          Top = 17
          Width = 86
          Height = 27
          Font.Height = -12
          Visible = False
        end
        inherited BBAgregarUno: TBitBtn
          Left = 9
          Top = 52
          Width = 87
          Height = 27
          Font.Height = -12
        end
        inherited BBEliminarUno: TBitBtn
          Left = 9
          Top = 86
          Width = 87
          Height = 27
          Font.Height = -12
        end
        inherited BBEliminarTodos: TBitBtn
          Left = 9
          Top = 121
          Width = 87
          Height = 27
          Font.Height = -12
          Visible = False
        end
      end
    end
    inherited JvROBusquedaAvanzada: TJvRollOut
      Top = 124
      Width = 841
      Height = 24
      Font.Height = -16
      FAWidth = 145
      FAHeight = 184
      FCWidth = 734
      FCHeight = 24
      inherited GBFiltros: TGroupBox
        Width = 839
        Height = 193
        Font.Height = -12
        inherited CBCircEsc: TCheckBox
          Left = 473
          Top = 215
          Width = 139
          Height = 19
        end
        inherited CBCantPartos: TCheckBox
          Left = 271
          Top = 215
          Width = 88
          Height = 19
        end
        inherited CBAnios: TCheckBox
          Left = 9
          Top = 215
          Width = 55
          Height = 19
        end
        inherited CBPeso: TCheckBox
          Left = 8
          Top = 215
          Width = 52
          Height = 19
        end
        inherited CBFrame: TCheckBox
          Left = 8
          Top = 215
          Width = 52
          Height = 19
        end
        inherited ComboAreaPelvica: TComboBox
          Left = 359
          Top = 215
          Width = 156
          Height = 23
          ItemHeight = 15
        end
        inherited CBAreaPelvica: TCheckBox
          Left = 264
          Top = 215
          Width = 99
          Height = 19
        end
        inherited DBLCBACondCorp: TDBLookupComboBoxAuto
          Left = 612
          Top = 215
          Width = 156
          Height = 23
        end
        inherited CBCondCorp: TCheckBox
          Left = 612
          Top = 215
          Width = 125
          Height = 19
        end
        inherited DBLCBAGDR: TDBLookupComboBoxAuto
          Left = 439
          Top = 215
          Width = 157
          Height = 23
        end
        inherited CBGDR: TCheckBox
          Left = 439
          Top = 215
          Width = 62
          Height = 19
        end
        inherited DBLCBACronoDent: TDBLookupComboBoxAuto
          Left = 439
          Top = 215
          Width = 157
          Height = 23
        end
        inherited CBCronoDent: TCheckBox
          Left = 439
          Top = 215
          Width = 139
          Height = 19
        end
        inherited CBRaza: TCheckBox
          Left = 272
          Top = 215
          Width = 62
          Height = 19
        end
        inherited DBLCBARaza: TDBLookupComboBoxAuto
          Left = 272
          Top = 215
          Width = 157
          Height = 23
        end
        inherited CBEstadoReproductivo: TCheckBox
          Left = 612
          Top = 215
          Width = 139
          Height = 19
        end
        inherited DBLCBAEstadoRepro: TDBLookupComboBoxAuto
          Left = 612
          Top = 215
          Width = 156
          Height = 23
        end
        inherited CBPreniesRobo: TCheckBox
          Left = 912
          Top = 19
          Width = 119
          Height = 19
        end
        inherited DBLCBARechazo: TDBLookupComboBoxAuto
          Left = 612
          Top = 215
          Width = 156
          Height = 23
        end
        inherited CBEdad: TCheckBox
          Left = 8
          Top = 215
          Width = 52
          Height = 19
        end
        inherited ECantPartos: TEdit
          Left = 374
          Top = 215
          Width = 55
        end
        inherited CBCapServ: TCheckBox
          Left = 612
          Top = 215
          Width = 142
          Height = 19
        end
        inherited CBExamenClinico: TCheckBox
          Left = 439
          Top = 215
          Width = 107
          Height = 19
        end
        inherited DBLCBAExamenClinico: TDBLookupComboBoxAuto
          Left = 439
          Top = 215
          Width = 157
          Height = 23
        end
        inherited CBCalidadSemen: TCheckBox
          Left = 612
          Top = 215
          Width = 139
          Height = 19
        end
        inherited DBLCBACalidadSemen: TDBLookupComboBoxAuto
          Left = 612
          Top = 215
          Width = 156
          Height = 23
        end
        inherited DBLCBACapServ: TDBLookupComboBoxAuto
          Left = 612
          Top = 215
          Width = 156
          Height = 23
        end
        inherited CBRechazo: TCheckBox
          Left = 775
          Top = 215
          Width = 105
          Height = 19
        end
        inherited CBPreservicio: TCheckBox
          Left = 439
          Top = 215
          Width = 143
          Height = 19
        end
        inherited CBAptas: TComboBox
          Left = 439
          Top = 215
          Width = 157
          Height = 23
          ItemHeight = 15
        end
        inherited CBDiasParto: TCheckBox
          Left = 249
          Top = 215
          Width = 131
          Height = 27
        end
        inherited CBDiasCelo: TCheckBox
          Left = 249
          Top = 215
          Width = 114
          Height = 29
        end
        inherited CBSubcategoria: TCheckBox
          Left = 272
          Top = 215
          Width = 107
          Height = 19
        end
        inherited DBLCBASubcategoria: TDBLookupComboBoxAuto
          Left = 272
          Top = 215
          Width = 157
          Height = 23
        end
        inherited CBxCondicionCorporal: TComboBox
          Left = 181
          Top = 19
          Width = 167
          Height = 23
          ItemHeight = 15
        end
        inherited CBxCalidadSeminal: TComboBox
          Left = 353
          Top = 19
          Width = 167
          Height = 23
          ItemHeight = 15
        end
        inherited CBxCapacidadServicio: TComboBox
          Left = 870
          Top = 19
          Width = 167
          Height = 23
          ItemHeight = 15
        end
        inherited CBxEstadoReproductivo: TComboBox
          Left = 353
          Top = 52
          Width = 167
          Height = 23
          ItemHeight = 15
        end
        inherited CBxCronologiaDentaria: TComboBox
          Left = 9
          Top = 19
          Width = 167
          Height = 23
          ItemHeight = 15
        end
        inherited CBxExamenClinico: TComboBox
          Left = 698
          Top = 19
          Width = 167
          Height = 23
          ItemHeight = 15
        end
        inherited CBxPreservicio: TComboBox
          Left = 9
          Top = 52
          Width = 167
          Height = 23
          ItemHeight = 15
        end
        inherited CBxAreaPelvica: TComboBox
          Left = 181
          Top = 52
          Width = 167
          Height = 23
          ItemHeight = 15
        end
        inherited GBPeso: TGroupBox
          Left = 918
          Top = 86
          Width = 199
          Height = 54
          Font.Height = -13
          inherited LDesdePeso: TLabel
            Left = 24
            Top = 39
            Width = 41
            Height = 16
          end
          inherited LHastaPeso: TLabel
            Left = 110
            Top = 39
            Width = 38
            Height = 16
          end
          inherited EHastaPeso: TEdit
            Left = 139
            Top = 30
            Width = 46
          end
          inherited EDesdePeso: TEdit
            Left = 68
            Top = 30
            Width = 46
          end
        end
        inherited GBFrame: TGroupBox
          Left = 183
          Top = 86
          Width = 199
          Height = 54
          Font.Height = -13
          inherited LDesdeFrame: TLabel
            Left = 9
            Top = 22
            Width = 41
            Height = 16
            Font.Height = -13
          end
          inherited LHastaFrame: TLabel
            Left = 98
            Top = 22
            Width = 38
            Height = 16
            Font.Height = -13
          end
          inherited EHastaFrame: TEdit
            Left = 132
            Top = 18
            Width = 47
            Font.Height = -13
          end
          inherited EDesdeFrame: TEdit
            Left = 47
            Top = 18
            Width = 47
            Font.Height = -13
          end
        end
        inherited GBNacidosEntre: TGroupBox
          Left = 13
          Top = 60
          Width = 307
          Height = 62
          Font.Height = -13
          inherited LDesdeAnios: TLabel
            Top = 25
            Width = 39
            Height = 16
            Font.Height = -13
          end
          inherited LHastaAnios: TLabel
            Left = 163
            Top = 25
            Width = 15
            Height = 16
            Font.Height = -13
          end
          inherited GBSeparadorHasta: TGroupBox
            Left = 180
            Top = 15
            Width = 104
            Height = 26
            inherited LSeparadorHasta: TLabel
              Top = 10
              Height = 18
              Font.Height = -15
            end
          end
          inherited GBSeparadorDesde: TGroupBox
            Left = 40
            Top = 15
            Width = 103
            Height = 26
            inherited LSeparadorDesde: TLabel
              Left = 12
              Top = 10
              Height = 18
              Font.Height = -15
            end
          end
          inherited EHastaAnios: TEdit
            Left = 127
            Top = 108
            Width = 46
          end
          inherited EDesdeAnios: TEdit
            Left = 99
            Top = 108
            Width = 46
          end
          inherited DTPDesde: TDateTimePicker
            Left = 142
            Top = 20
            Width = 16
            Height = 24
          end
          inherited DTPHasta: TDateTimePicker
            Left = 283
            Top = 20
            Width = 17
            Height = 24
          end
          inherited EADesdeDia: TEdit
            Left = 47
            Top = 25
            Width = 19
            Height = 18
          end
          inherited EADesdeMes: TEdit
            Left = 76
            Top = 25
            Width = 19
            Height = 18
          end
          inherited EADesdeAnio: TEdit
            Left = 104
            Top = 25
            Width = 35
            Height = 18
            Font.Height = -13
          end
          inherited EAHastaDia: TEdit
            Left = 190
            Top = 25
            Width = 17
            Height = 18
          end
          inherited EAHastaMes: TEdit
            Left = 219
            Top = 25
            Width = 17
            Height = 18
          end
          inherited EAHastaAnio: TEdit
            Left = 246
            Top = 25
            Width = 33
            Height = 18
            Font.Height = -13
          end
        end
        inherited CBxCantidadPartos: TComboBox
          Left = 526
          Top = 19
          Width = 166
          Height = 23
          ItemHeight = 15
        end
        inherited GBDiasAlParto: TGroupBox
          Left = 370
          Top = 26
          Width = 200
          Height = 54
          Font.Height = -13
          inherited LDesdePartos: TLabel
            Top = 25
            Width = 41
            Height = 16
            Font.Height = -13
          end
          inherited LHastaPartos: TLabel
            Left = 106
            Top = 25
            Width = 38
            Height = 16
            Font.Height = -13
          end
          inherited EHastaPartos: TEdit
            Left = 148
            Top = 22
            Width = 46
            Font.Height = -13
          end
          inherited EDesdePartos: TEdit
            Left = 50
            Top = 22
            Width = 46
            Font.Height = -13
          end
        end
        inherited GBDiasAlCelo: TGroupBox
          Left = 551
          Top = 86
          Width = 200
          Height = 54
          Font.Height = -13
          inherited LDiasCeloHasta: TLabel
            Left = 114
            Top = 39
            Width = 38
            Height = 16
            Font.Height = -13
          end
          inherited LDiasCeloDesde: TLabel
            Left = 8
            Top = 39
            Width = 41
            Height = 16
            Font.Height = -13
          end
          inherited EDiasCeloHasta: TEdit
            Left = 139
            Top = 30
            Width = 46
            Font.Height = -13
          end
          inherited EDiasCeloDesde: TEdit
            Left = 141
            Top = 30
            Width = 44
            Font.Height = -13
          end
        end
        inherited GBCircunferenciaEscrotal: TGroupBox
          Left = 732
          Top = 86
          Width = 200
          Height = 54
          Font.Height = -13
          inherited LDesdeCircEsc: TLabel
            Left = 16
            Top = 39
            Width = 41
            Height = 16
            Font.Height = -13
          end
          inherited LHastaCircEsc: TLabel
            Left = 106
            Top = 39
            Width = 38
            Height = 16
            Font.Height = -13
          end
          inherited EHastaCircEsc: TEdit
            Left = 50
            Top = 30
            Width = 46
            Font.Height = -13
          end
          inherited EDesdeCircEsc: TEdit
            Left = 50
            Top = 30
            Width = 46
            Font.Height = -13
          end
        end
        inherited EEdadDesde: TEdit
          Left = 939
          Top = 60
          Width = 130
        end
        inherited EEdadHasta: TEdit
          Left = 922
          Top = 60
          Width = 130
        end
      end
    end
    inherited RGOrden: TRadioGroup
      Top = 148
      Width = 841
      Height = 37
    end
    inherited LBSubcat: TListBox
      Left = 784
      Top = 43
      Width = 148
      Height = 113
      ItemHeight = 15
    end
    inherited IBQSeleccionados: TIBQuery
      BeforeOpen = MangaIBQSeleccionadosBeforeOpen
      BeforePost = MangaIBQSeleccionadosBeforePost
      SQL.Strings = (
        
          'select  ID_AUX,ID_RP, ID_SENASA,id_animal, sexo,VUNO1,ORIGEN_ANI' +
          'MAL,V1,V2,V3 from AUX_ANIMALES'
        'where id_animal > 0 and vuno1 = '#39'S'#39' and origen_animal = :id'
        ''
        ''
        '')
      ParamData = <
        item
          DataType = ftUnknown
          Name = 'id'
          ParamType = ptUnknown
        end>
    end
    inherited IBUSQLIntercambiarIzq: TIBUpdateSQL
      RefreshSQL.Strings = (
        'Select '
        '  ID_ANIMAL,'
        '  ID_AUX,'
        '  ESTABLECIMIENTO,'
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
        '  VUNO1,'
        '  ORIGEN_ANIMAL'
        'from AUX_ANIMALES '
        'where'
        '  ID_ANIMAL = :ID_ANIMAL'
        '')
      ModifySQL.Strings = (
        'update AUX_ANIMALES'
        'set'
        '  ID_RP = :ID_RP,'
        '  ID_SENASA = :ID_SENASA,'
        '  ID_ANIMAL = :ID_ANIMAL,'
        '  SEXO = :SEXO,'
        '  ID_AUX= :ID_AUX,'
        '  VUNO1=:VUNO1,'
        '  ORIGEN_ANIMAL=:ORIGEN_ANIMAL,'
        '  V1=:V1,'
        '  V2=:V2,'
        '  V3=:V3'
        'where'
        '  ID_ANIMAL = :OLD_ID_ANIMAL')
      InsertSQL.Strings = (
        'insert into AUX_ANIMALES'
        
          '  (ID_AUX,ID_RP, ID_SENASA, ID_ANIMAL, SEXO,VUNO1,ORIGEN_ANIMAL,' +
          'V1,V2,V3)'
        'values'
        
          '  (:ID_AUX,:ID_RP, :ID_SENASA, :ID_ANIMAL, :SEXO,:VUNO1,:ORIGEN_' +
          'ANIMAL,:V1,:V2,:V3)')
    end
  end
  inherited PTitulo: TPanel [7]
    Width = 841
    Caption = 'Selecci'#243'n de Receptora'
    inherited LTitulo: TLabel
      Width = 457
      Caption = 'Selecci'#243'n de Receptora'
    end
    inherited PILeft: TPanel
      Left = 653
    end
  end
  inherited Psocalo: TPanel [8]
    Top = 598
    Width = 841
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc [10]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc [11]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc [12]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPGeneradores: TIBStoredProc [13]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc [14]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 532
    Top = 95
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc [15]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
  inherited ALUniversal: TActionList [16]
    Left = 451
    Top = 86
  end
  inherited IBSPEstadisticas: TIBStoredProc [17]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    Left = 492
    Top = 87
  end
  inherited SDXLS: TSaveDialog [18]
  end
  inherited DTXLS: TDataToXLS [19]
  end
  inherited WinXP1: TWinXP [20]
  end
  inherited IBQGetCantAnimales: TIBQuery [21]
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
  end
end
