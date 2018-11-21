inherited FEveTransferenciaEmbrionaria: TFEveTransferenciaEmbrionaria
  Left = 12
  Top = 60
  Caption = 'FEveTransferenciaEmbrionaria'
  ClientHeight = 742
  ClientWidth = 1024
  Constraints.MinHeight = 653
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1024
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
    Width = 640
  end
  inherited PError: TPageControl
    Top = 629
    Width = 1024
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1016
      end
    end
  end
  inherited PDatos: TPanel
    Width = 1024
    Height = 542
    inherited PCBasico: TPageControl
      Width = 1024
      Height = 460
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 1016
          Height = 418
        end
        inherited MSimple: TMangazo
          Width = 1016
          Height = 418
          inherited GBFiltro: TGroupBox
            Width = 1016
          end
          inherited PSeleccion: TPanel
            Width = 1016
            Height = 112
            inherited GBDisponibles: TGroupBox
              Height = 227
              inherited IFondoDis: TImage
                Height = 208
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 208
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 125
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
                    Width = 135
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Width = 459
              Height = 227
              inherited IFondoSel: TImage
                Width = 455
                Height = 208
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 455
                Height = 208
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 132
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
                    Width = 126
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Height = 227
              inherited IFondo: TImage
                Height = 227
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
            Width = 1016
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 1016
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 1016
            inherited Label1: TLabel
              Width = 142
              Height = 16
            end
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select  ID_AUX,ID_RP,ID_SENASA,id_animal, id_pc, id_hba, id_otro' +
                ', nombre, sexo from AUX_ANIMALES'
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
          Width = 1016
          Height = 331
          object GroupBox1: TGroupBox
            Left = 2
            Top = 17
            Width = 206
            Height = 312
            Align = alLeft
            Caption = ' Eventos  '
            TabOrder = 0
            object LSincronizacion: TLabel
              Left = 34
              Top = 43
              Width = 117
              Height = 13
              Cursor = crHandPoint
              Caption = 'Sincronizaci'#243'n de Celo...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LSincronizacionClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LTratamiento: TLabel
              Left = 34
              Top = 129
              Width = 132
              Height = 13
              Cursor = crHandPoint
              Caption = 'Aplicaci'#243'n de Tratamiento...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LTratamientoClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LDeteccion: TLabel
              Left = 34
              Top = 220
              Width = 97
              Height = 13
              Cursor = crHandPoint
              Caption = 'Detecci'#243'n de Celo...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LDeteccionClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
          end
          object GBDatosAnimal: TGroupBox
            Left = 208
            Top = 17
            Width = 806
            Height = 312
            Align = alClient
            Caption = 'Datos del Animal'
            TabOrder = 1
            object Label1: TLabel
              Left = 31
              Top = 30
              Width = 133
              Height = 15
              Caption = 'Fecha de Transferencia:'
            end
            object LResp: TLabel
              Left = 84
              Top = 64
              Width = 65
              Height = 13
              Cursor = crHandPoint
              Caption = 'Responsable:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LRespClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object Label5: TLabel
              Left = 38
              Top = 96
              Width = 108
              Height = 13
              Cursor = crHandPoint
              Caption = 'Centro de Transplante:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = Label5Click
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object Label6: TLabel
              Left = 458
              Top = 30
              Width = 78
              Height = 15
              Caption = 'Cuerpo L'#250'teo:'
            end
            object LUtero: TLabel
              Left = 500
              Top = 64
              Width = 29
              Height = 13
              Cursor = crHandPoint
              Caption = #218'tero:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LUteroClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LUbicacion: TLabel
              Left = 477
              Top = 131
              Width = 51
              Height = 13
              Cursor = crHandPoint
              Caption = 'Ubicaci'#243'n:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LUbicacionClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LDificultad: TLabel
              Left = 482
              Top = 169
              Width = 47
              Height = 13
              Cursor = crHandPoint
              Caption = 'Dificultad:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LDificultadClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object Label10: TLabel
              Left = 452
              Top = 96
              Width = 87
              Height = 15
              Caption = 'Cuerno Uterino:'
            end
            object Label14: TLabel
              Left = 121
              Top = 169
              Width = 38
              Height = 15
              Caption = 'Precio:'
            end
            object DTPAFecha: TDateTimePickerAuto
              Left = 167
              Top = 26
              Width = 122
              Height = 21
              Date = 39687.497588425930000000
              Time = 39687.497588425930000000
              Color = 14679807
              TabOrder = 0
              OnChange = DTPAFechaChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBAResponsable: TDBLookupComboBoxAuto
              Left = 167
              Top = 58
              Width = 156
              Height = 23
              Color = 14679807
              KeyField = 'ID_EMPLEADO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSResponsable
              TabOrder = 1
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBACentroTrans: TDBLookupComboBoxAuto
              Left = 167
              Top = 92
              Width = 156
              Height = 23
              Color = 14679807
              KeyField = 'ID_CENTRO_TRANSPLANTE'
              ListField = 'NOMBRE'
              ListSource = DSCentros
              TabOrder = 2
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object CBCondCorp: TCheckBox
              Left = 38
              Top = 131
              Width = 121
              Height = 19
              Caption = 'Condici'#243'n Corporal:'
              TabOrder = 3
              OnClick = CBCondCorpClick
            end
            object DBLCBACondCorp: TDBLookupComboBoxAuto
              Left = 167
              Top = 127
              Width = 156
              Height = 23
              Color = clWhite
              Enabled = False
              KeyField = 'ID_CONDICION_CORPORAL'
              ListField = 'VALOR'
              ListSource = DSCondCorp
              TabOrder = 4
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EACuerpoLuteo: TEditAuto
              Left = 542
              Top = 26
              Width = 156
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 6
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAUtero: TDBLookupComboBoxAuto
              Left = 543
              Top = 58
              Width = 156
              Height = 23
              Color = clWhite
              KeyField = 'ID_UTERO_TRANSFERENCIA'
              ListField = 'NOMBRE'
              ListSource = DSUtero
              TabOrder = 7
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAUbicacion: TDBLookupComboBoxAuto
              Left = 543
              Top = 127
              Width = 156
              Height = 23
              Color = clWhite
              KeyField = 'ID_UBICACION_TRANSFERENCIA'
              ListField = 'NOMBRE'
              ListSource = DSUbicacion
              TabOrder = 9
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBADificultad: TDBLookupComboBoxAuto
              Left = 543
              Top = 164
              Width = 156
              Height = 23
              Color = clWhite
              KeyField = 'ID_DIFICULTAD_TRANSFERENCIA'
              ListField = 'NOMBRE'
              ListSource = DSDificultad
              TabOrder = 10
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBACuernoUterino: TDBLookupComboBoxAuto
              Left = 543
              Top = 92
              Width = 156
              Height = 23
              Color = clWhite
              KeyField = 'TIPO'
              ListField = 'VALOR'
              ListSource = DSCuernoUterino
              TabOrder = 8
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object Panel1: TPanel
              Left = 2
              Top = 197
              Width = 802
              Height = 113
              Align = alBottom
              BevelInner = bvLowered
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 11
              object GBCelo: TGroupBox
                Left = 1
                Top = 1
                Width = 260
                Height = 111
                Align = alLeft
                Caption = 'Celo:'
                TabOrder = 0
                object LmensajeEventoCelo: TLabel
                  Left = 9
                  Top = 71
                  Width = 3
                  Height = 16
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label3: TLabel
                  Left = 39
                  Top = 29
                  Width = 86
                  Height = 15
                  Caption = 'Hora post Celo:'
                end
                object Label4: TLabel
                  Left = 178
                  Top = 29
                  Width = 37
                  Height = 15
                  Caption = 'Horas.'
                end
                object CBRegistrarCelo: TCheckBox
                  Left = 39
                  Top = 62
                  Width = 102
                  Height = 19
                  Caption = 'Registrar Celo.'
                  Ctl3D = True
                  ParentCtl3D = False
                  TabOrder = 1
                  OnExit = GetEvent
                end
                object MEHorasPostCelo: TEdit
                  Left = 138
                  Top = 26
                  Width = 35
                  Height = 23
                  MaxLength = 4
                  TabOrder = 0
                  Text = '00'
                  OnExit = GetEvent
                end
              end
              object GBEmbrion: TGroupBox
                Left = 261
                Top = 1
                Width = 540
                Height = 111
                Align = alClient
                Caption = 'Embri'#243'n'
                TabOrder = 1
                Visible = False
                object Label11: TLabel
                  Left = 26
                  Top = 22
                  Width = 40
                  Height = 13
                  Caption = 'Madre:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label12: TLabel
                  Left = 26
                  Top = 47
                  Width = 38
                  Height = 13
                  Caption = 'Padre:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label13: TLabel
                  Left = 16
                  Top = 73
                  Width = 50
                  Height = 13
                  Caption = 'Embri'#243'n:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object LMadre: TLabel
                  Left = 78
                  Top = 22
                  Width = 4
                  Height = 15
                  Caption = '-'
                end
                object LPadre: TLabel
                  Left = 78
                  Top = 47
                  Width = 4
                  Height = 15
                  Caption = '-'
                end
                object LEmbrion: TLabel
                  Left = 78
                  Top = 73
                  Width = 4
                  Height = 15
                  Caption = '-'
                end
                object ISeleccionarEmbrion: TImage
                  Left = 328
                  Top = 8
                  Width = 89
                  Height = 65
                  Cursor = crHandPoint
                  Picture.Data = {
                    0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000006500
                    0000440806000000988CFB5C0000000467414D410000AFC837058AE900000019
                    74455874536F6674776172650041646F626520496D616765526561647971C965
                    3C000016D94944415478DAED9C097C54D5BDC77F73EFDCB9B3658724AC6149D8
                    9104B08B95AD2D0F01B56005A5762160EB5359A4C522D83E4305712B05FCB0D4
                    2249A58880082288BB61910A5609822884253C2009D927B3CFDCE5FDCFB93303
                    945868353C18381FFE9C7BCFDCE5CCF9CE7F3BF7DC98745DC7F5726515D37528
                    575EB90EE50A2CD7A15C81E53A942BB05C87720596EB50AEC0721DCA1558AE43
                    B902CB65816232999AE5BA0DA307255395DBD467C91BB61537D7F769EE31BBAA
                    A01084C154311914A92F56CA484A48B6916C245065DF443FAE792804A2035553
                    49C693247FCDAE30407F252922400DFFE945AE592811188FC180112B427A26CC
                    3DC962893AC21FBE09EBCF26C172CB18FE997FE1A350BE2C81FD9185D03D1E28
                    7B7620B8753DA0B2913CFFF2240B4916FC2770AE3928113FC1603C74F6022466
                    0292E440C2F35B62CDDED91360BD7B0AC4AE865B096D2A8472682FEC0F2F8A1D
                    E3CE1F04F9EE4930A56442D9FD21421FBC79DEED48A61198A27FE7FB5C535008
                    081BDD0D241DF8790E27E45BEF848544ABAD84FF9929703EF746EC78EFA36301
                    BB13D6B153A0FB1B11DA5C04DDE781EDD78B20A412847D3BE05FFC2881DC7EF6
                    9CB953A17CB60F089F77EB8D24F997AA35D70C1402329EAAC2588344FFFAF481
                    7DD6C25893FBBF0772AD10DB6543D9BF037A5DA5A1459122B4C986C99600ED74
                    2987C34C16FB7A8E998510DA6613380F7C051320FD600CCCB903E07FEE49289F
                    97444F2F23194D604A2ED6D76B020A01298061B2B876D8A6CC804904826B9E83
                    6DD21330B5C84468CB0A84B7AD3320088075E25C987B0FE403ED9F3F1E62E73C
                    32538FF2EB2907B623B06216C44E79BC5DF96C8701C8EB85565D8984656735C7
                    336322D4D2A3B1AE900CB91898B8874240FE84A8FFA0C14EFCEB660E8615DFFC
                    29508FECE5802CC3F32176E90BF5E82708BD5B08E7333B63D7083C3F09020130
                    DF30920FBAEE2E4770C35C380ADE22CD895CEBF131D06A48B33410F4E720E6E4
                    726DF23E7C17909409EDE41982E6B92430710DE53C9345404C761DCEF96B2090
                    6668649AFCF3F2A1873C7C006D939E8B9DE79DF93D586E2307DFF946868422AD
                    1A8859AD68C043E0CE426712845A5601933399A91F026B5F8049B643EC98479A
                    51C281B008CDDCFB66C87711FCB223F0FEFEA14B0213B7502289E0076C5BEC90
                    0DDBD447A01EDE4B668AEC3FEDEBF51590BE331CEAF1BDD05D15B0CF7C859FA7
                    5596C2BFE41734CEE914652DA51152A85531EA7F82028DD5A19868358D54A592
                    EF217FB2E437A41D47289CCE8765E4047EEDF0B6ADF02D7A2A1A3E9791E435E5
                    FCE3124A24EC3D4E92CCF20EE71F97C74C96FB8101DC5C3966AF83892228567C
                    4FFF98C8814754EA894FF9AFDD9CF723987BDDF06F4131DA825C1B9483C7117C
                    AB0482330DD67BE7F17B055E9887F0EE9DA445B1FEB25980D1D70A1416F68E62
                    DB62FB0C3817ACE1EDCCACF8174DA69C84CCD89FCEFA0CDFFC3BA037922912A8
                    AF24B6E9EF41AB384A262BFD3F82C26B3DC81D7FF8EFA5086D3F029D7C8DB9D7
                    00C8145E8736BD82E0E657A2B76711D9C6B886729ED9CAA610D6AA7308CC84A9
                    47F7426849FEE44C29A44163E8F3BE34682F7320965B1EE28157E88D3FC0F2E3
                    A7A15555C1DCA3F3D78262B405A09EAA4370E31790EF7992FB2F56987F8984CB
                    CC7C753CD78CC52314066430335B09CB5EE66D2CCAD28E5126CEF209CA35B40A
                    F21B8B7FC1A7529829B3FE623184ACBEFC5865D7F350F6AE86D86314811BFB8D
                    4031B603504EE5C0DCF73E7E1FFFB27908BDFD56B4DBB3094A415C4239574B6C
                    9366C0F2FDE1BC3DB0F209E80D15B04D3E27C27AEC2602A27130F2D8A7E8174C
                    A706DD08BE721FF4DA437451CAF6C753446597BF31285C6BAA32A01C9629E0D8
                    02CD6B8A66FEE7694BBC41317C09ED5A6E1906DB2F67423B758432EBC9348E6E
                    D8A793A6B4CEA11C630E99A7C3B0DEFD148FBC42AF4D8729338732BD7298925A
                    71D14A3741E83519D277877EA350A0F9A8F6437377805ADD95B4B828FA35F2A3
                    736471032532EBCB222E32511910DB52244526CB44FE84993213090301C5CD7D
                    8C7DEAAB3025B7E2E787D6DD4726ED1F307FE757307FCB302FCA9EA510326FA0
                    6BB56F16281405D0B607FE556184F688EC962504252FDEA0B0AC9D65EF485C69
                    64EDC1758BA01CD801FB23853CF356F66E21873B974069E447964068DFD73059
                    45B7D19837C232FA2FA449FDF835D5E39F51F4D5F21BF5294D4109EF0BC0B7C2
                    12FD2ACC8495C513146EBAA46FDD4C10E6F076369FC5B425EA4BD42FB721B0E6
                    110E854113BB0D844E1AA27B4F4734AA0BCC373D4CFEE70BB2FD2148378F6876
                    28D0DD689C69A7266E82D934FF827882524F9BC9624E361C8F2DE0138B81E767
                    719FC1A190A60457CF204DC88665D8346ECA82AB7E02212513F2B8D5809C00E5
                    BD87A09D7E9FC2680784EE1320F6BCF5B240F12D37237C80051446321917505C
                    770C66C1FF5E7E43BB1EC94D685BA23A227C9BB4C176FF8B103272F879A1F5BF
                    82D0AE5FCC8F685FFC0DEAFEC5300F2DA448A12D8DD771CA6B929B1D4A70AB8E
                    C05B7CC6A18CA0748C1728831109859D0B96F309C7C08B14065796C236A3906B
                    4DF0A519504F7E0AEB384AE0BA0CE20963B0E8560A8507411A3E9F5F47793B9F
                    67F4E61F161990CE94D1B5C46687A29406E05D9CC6EF49509A7DCC2E179402AA
                    1E6359BB73FE72DE16FE602D7F16621911990CFC6039C23B28EF703AB809D3EB
                    2817515D5C834C29ADB84F41E024050476986FD940E325D0A0D55C164DD16ADD
                    703F9E19FD3A7949AF165FF441D8D503A563369F7C6425F8CA22FACF03F99E59
                    C63ECB4D4E7E42F9CB543E8D1F7E6736993A07A4A1B369C705F5EFBFA7416AE0
                    6D26B30A53CF2729CBEF75597C0AF47AB8A6B58D7E9D2104A5386EA0B0995EA9
                    5F1FCA2F286BFE782B7FE42BB4EFCCB541AB29A50C7F02A441F7F273C26F17F0
                    3C25EA4FD47F3CC5A32E66BAD8B30FB17D22F83295EB50BE3E1479F48F6162CB
                    831814C50369C89D91FD350465620C0A77F22C041E30DD80B2EB773025B482D0
                    FB413E5168EEDEFA3A946F020A5BAFE5787C016FE3E68BCC947CC714639FCC97
                    7A641BA4EF8CA5717543FDEC258AC63498FB8EE3D0B4437F83A975DF9893D7EB
                    F7C394D4E23A94AF0BE55C47CF124706C532FC5C47BF9C2F9290FA8C807AE875
                    E8BED33C8934E78E23D3F525F4F277094426397B0774BD3BC46FFFF2DF9E900C
                    05BCA8ACACC1E7C75C707915BA4E18DFEEAAC3615390D15268128AEE73A17156
                    EB18945DA30B8A87FF6CF0550F853DD062193D1CBF7B9C063A01C1F5A4292137
                    2C774EE670426F2E80EEA980FDB7EF501EE33442E2BFDE0ACBADCF42E838845F
                    47D9388C4760C20DF743E83119EAF103E45B922E0A4509F9B0E1DDC3D8EFEB80
                    F4B659A850DAA24776CB58FFCA4E372055FB023515A790E6DE85517D2BD0BA95
                    DA64484C404C237E3EA459E7BF2E7FF2E8D0216677A6B1F3F0816709A329D1C1
                    435E5D75C33EC380C24A60613F48C3C81575BBDD80F2F604E835BB0D13E6E84E
                    E3758242E2C47F0965D5E60328D1F2D0A25D37D86CE64BEAAF5EB51D031D2F23
                    AF43A5913C16AB086C64F74103E52929FC98AB1D4A649A85DF48BAE97BB04F9F
                    CBDBBD8F8DE14F1AD94A153DE041F0E5197C5A451A360DEAC1D7A16CFF235F6E
                    2A0DFC0D4F1A950FFF072696BBA475216D798CF299AF9E906C6CA8C16FD7B8D1
                    3BB737AA95D4585F9C1611C9561166816D0BF08434281A8D7640A56D35765C1B
                    EB71349EDA83BBB25622ED7D11A18FADACB998A00C892728FC89A365C82DB04D
                    7E84B787DE58C1B3F973FD4A882590E4E0D9E208B1635FA85F6E229B5ECE9DBD
                    74FB5F20A475A5F0F84932FD2D207DFFEE26A13436D462DABA1012DAF58AF521
                    95B4A46B0B9943F9AA12203AC7EA8238ED3EBBA6B51576A1D7A6CDB8B9EE24DB
                    8D3D818C17287CEA9E396E3675CF8AEF4F1479B1E54305EBF87E70FD1C28FBB7
                    40A0ACDE36FD5DDEA6571F260D1A07A15D5F5846FD25764DE5C3F9307F77DC05
                    503C8D75B86F15F9AA8CAEFC3849302137D38E0CA774C9FDADF329F8B8DC8BB0
                    668C4D4D830FB7172FC5D8D0C1BCE85AB07881D201D1875CA9E4436CE443C8AF
                    441F72218122AAEA52C3C73808CAD40D677DCB82FE80A8411EF73245675D7880
                    102C1A419AB3E48269967B161C8427FD067E9E85800C6EE7A41C55C7FE13B5E8
                    9D9506BB7C69707C6115BB084C7DD03069274ED660DFBE1379587F4FFC406185
                    C030679FCB9248DBBD0FC2326C0C7F1CEC7B3A9FC064C0F69B22FEB02BC07C0B
                    D5E6BC91504B8BA11E2BE6BE86CD879928A18497CC592265FB439EA0E3833128
                    2F6ED8852DBE1B5019B0702043DB252045167188A2AB677FDA037F7EE728FEB7
                    2E8C0EE98997D46F6F58C396138D084534E640C9F192BA65B735FBD3C7CB0D65
                    3C22CB545912C95FFE017BD9670A99A7EC5822A996ED45A0E801EE4798D6581F
                    DC08939C6098B2D5E3B8D337A57481F48347CFD3941B9F3C0925D1085D07643A
                    909DC49F81A0D61DC4E8FE69C8ED9082B26A2FE66F2E456AA213A94EF9A27DAF
                    2453B6F56423DF0E054238B8A7349FB4A5286EA044C03013D6219ADDB335BDBE
                    272670936467AB224943C21FAEA1BC652137656C55A46DF286D8F981E5B7F345
                    7942A7A114958D89F994A2F53BF1E7CAAEA80D9B91494E7D44BBA4F3FA9099A0
                    63FCE00EB1FD37F755E2A59DA7D1A37D8B8BF67F7BA507471A837CBBEA5865B1
                    6BC9C821F106653C22DA2276A57CC55D0173FF9BF9B254364929646553FE520E
                    2B7BADC1A4234870CC6C996A2E5B517F08CA272FC37ADF6B500EEC3C6F31DEF0
                    397BF099DC91DF632C6984533A3FCAB28961CC1AD5F5BCB6066F0805EBBE8026
                    5890E4F86AAD09A91AD696D57333E6AB694443595547FD959F94C50D9408181E
                    1EF37078D830D87E35D3F8F2142287DE2AE49394F2A8A9BC8D9BB2C207F8A23C
                    66B6C40E79907FBAF43C285E4F03B2E796C39798841C324903D39D17F4C1EFF7
                    61E9C43E4DF66F6B492556EE3885CCB4247C55F9A8D68BCF5D01BA9D0AF78113
                    F904A5A8D9C6EBFF090A73260C4CF2B9F3617C2DF1C2C910DA67C3FE5BE30D09
                    F5E076045E7A84BFFCC39EE7332D624B588536DD21B432D61297EC3B807EAB2D
                    E47FACF80101C9B2C7569FC02A09B08802CA6B3D5832BE27921D9626FBC8B466
                    E93BC7505A15425A920D41CA5902E4E8A3A59612CBD7CA5D469F0E9D9EADAF1E
                    5B1057502260C62362C6584269197A0B82AFAFE0EFA3084E2765F86E98FB0C80
                    F2E91B30DF389C3E9FC8CF0BAC9E4183B29D7C4D27D8263DCBA16C7CF3EF18FD
                    3E65ED7619E3DAA580022F24C966384984736EFD5F3D1331A467FA057D2921D3
                    54EF0DE38BD36E7C74B80E6DD2F94C0A58D0E5092A7091B0ED4D152E7859FA7F
                    BAB6585F316A48DC4189806150C6F31D4A1FCCE4631C7F7881EF2ABBDF4060D5
                    3CBE6CD53AF109987B0DE4EDEC7D95E0AA19B00C9F0AA16D67E89E6ABCFE6505
                    46BF9BC2A1F44EB66148EB2458D93CCA3F95AC64131E18D6F982F63BE7EF46E7
                    36695FD9FF30F9945D956EEC2613C64B3941291C1D9F505839178CD8994CD933
                    CB639FB91F1868445A142E5B46E4C3644F4070D342E3FDC6DB0D9FC3E6CCD6DE
                    3F1A77273D4CDE5CC66D6D92B976A493994A90CF9F80B49AC2987B770FE3BE64
                    AEA2A6EC83CFAB50B8BD022D93ED17F42F404964952FCCCDD97B952EF8541AAF
                    8ABA62BD288EA15C00867C8CF5DE49E45FF6F21748EDD317F1B780032BE742AB
                    38C2233231270FB6078D057C5A7929DE2EF82586DB6672283FCC4C424A647E4B
                    243A768AC2627E8522A73553FB73084F6D2AC5B27B73D1A1A5831F3BF7D52F51
                    E337B44B21CD0892B8299B57238923335B6F9447DE8638595DA4AF1A931F9750
                    344D83AA6A82AE6B92EF67B71622141C679C40FF64B6DA7E3C4561C677674100
                    9B2B13290830D9C9E7D455C0949649508EA0CAE5421FFD61B81392D12941C64D
                    E9094DDECFE50960D1CF7B60CEAB8720485604FC5EBCF8E08DC60F8334277FD9
                    5E389DF626CFDD57E7C3FE7A1FEB3450766636455F05710545555593AA6992A6
                    AA3241B129AA62A5361BE6CDBA4B387AE861682A8F69D9EA17EB84493CF30FBD
                    56088D4058F38DD52FE18FC8E7BC380F52EE00FE8E7C9BF54ED4A41A89E0988E
                    6948909A9E0D76BB5D902941B598458428BCFD6E2707F9996CFE1973F8B3D61C
                    46AB54C705E7AD3D5E0B0F9932F828893C533F84A014C70514D20C130DBE4462
                    5514D541306C5493B05AB13330C2DE3D59F60D2BA789AEFA6ED1F3858C4C1E0E
                    5B46DE09EB3D930DB087297C5E3C0BCE85C65FA02858B611B30F134B32595DC8
                    D97FBF75D33987DB1F4682EDECA464799D17B3EFCCE15330AC3CFBFA211C2C0F
                    423E07EAC7D55E7C52ED3676EADC65281CDDACAB242F1B94887658551AFC3009
                    83100E2B8EB3FB2A4131C0B0CF1237AF1DE8DCB767A818F0C546974DFBB305E2
                    62CF3E50F6EDE492B0640B3767478F1C46BFA73E832BC918DC3B485BDA3A2E3E
                    B7C58ACBEB43D183FD62FBE317FF83327C435BAA09E2ABA425997609271AC87C
                    9DAA998DF5F7145CF550D83DC84C5948331C0A81082B610783A084C3B44D6D06
                    24A38D6A0687691283D562C75B7989870F74B3D59E496FEADA6CDA9F3DBD6473
                    68B79DEC86E236B9C84AB2A29222A689DD33208BC245FB1724B3D4395DC2AF6F
                    EBC27DCBA3AB0F42B658B9B35F7BB486070EF594ABD496D7B91255A5A36BE5D8
                    FA78806252B8C93A0B856909DBA79A6988C3801215D511D52403A0E2B05457B6
                    482D3DD02EF9E4D1F4C49A4A6753F7D98D0C0C738E454E7606FB6A6808291897
                    937E4960AA5C7E24D97454BB55B44D4BE04056975621D9C2C26A1DA567DC48F1
                    7867D614DEF18C288A6A3C40811A85C2404406DC80128E680A07616809FB4C55
                    23C784631A14F141DCCC39CF94270941BF35EDCC291B7F919BC0B3EFB3B4B68D
                    F4829663C9699B8AD664BE3EA788E976326519F64B7FF2D840A1F0EB64B23A27
                    1ADAF2D1C97AD85DEEADF52B468D358BA28FA068573D14E653685005F2297635
                    A601865F51CE9A2F7B140EF32BEC380263A3E3D8B68D4162609968AA26D3B52C
                    143858744D33D30831AF1C0BF19EDEE6CFFAC86B6B91D33A197D5B387180C064
                    12A05CCA49ACFF426B020460CF190FEAFD21F44CB1E3D31A0F4AAB3DB0D4357E
                    3E6D78CEC839E37A574892148AFED0AE7A28AC44C07067CF7FFDEC976F684534
                    02B37120678520680C84CC6168CC2F31186A148659D77451872E90853145C0E8
                    220DFC9C77EAFBBF775ACB4E689180BCF4446451FEC2FC0C4B24D9E209F33961
                    BA8F1243363DDF487EA3BD53C60977107B0988BBD187D460F0835F8FEC72EF8C
                    1F753F2549E650F49CB881C20A0D2E0B8DCD0C8EC661F05F3FCF5558781CD506
                    03842613005673AD88688664C0D0D8CB1122F53F62BA7493288816B324C98220
                    9098E4973EAACA5EB6A3AA7F8D59B627243BD09EC06439AD68D58429AB2060B5
                    C1300E5292E8264DB178BCFE41ED1DEB5FBC3FF705D28E6AD962A9A3BAC16C36
                    0748F4B882122D2C9B271148246E8AB86630B3C4B5220A42D6585E630091A8AF
                    E6482D46443004220D944C1AC25279271DE354B94F0A3B2AEAFCA9CB8A2B7ABE
                    7FD4D7B64E37CB6CD2124D2D9EA0A0006105D67028F4AD74B134FF7B2DDFEDDF
                    29E5882C5B6A6559AEB55A49646BAD6C956B24B3D943E0E30FCA3F1796C7D060
                    8A4C8B34431B242D0A43E3DBE698861008C38F70206CFE91944424207A1299C0
                    64F25949C1602829140A511D48F4F982C981803FA9E4A42763E7317FE6897AC5
                    E60BC5FC105DC2A4764B17DD9DD2E4EAE13D9DA55659AEB15AADB5AC66106463
                    9F8B8D41218D61CE3EEEA17C1528669A34A60D9AC6354287A11D303484FF9D3C
                    9D391493C94E01406A30144C212024C1648292120804199C647F2090140E8513
                    68DBA9F02455931854EA9D461A16224DF34A66C96DB1482E82504FE6AADE225B
                    EA68BB8E6B0AAB495BA8BD96A0F89BEB0F605F3628CD5DD800317348919A4409
                    290D7C3839482098A690094B6412CD7F2201039940A671EC5C268242E62844BF
                    7E3FC1F17140929900595C0C9245E2753DF92B0F99AE30335DCD396EFF0790DB
                    E15A6731A2D40000000049454E44AE426082}
                  OnClick = BBEmbrionClick
                end
                object Label2: TLabel
                  Left = 328
                  Top = 72
                  Width = 115
                  Height = 15
                  Cursor = crHandPoint
                  Caption = 'Seleccionar Embri'#243'n'
                  Transparent = True
                  OnClick = BBEmbrionClick
                end
                object BBEmbrion: TBitBtn
                  Left = 435
                  Top = 85
                  Width = 130
                  Height = 27
                  Caption = 'Seleccionar Embri'#243'n'
                  TabOrder = 0
                  Visible = False
                  OnClick = BBEmbrionClick
                end
                object EAEmbrion: TEditAuto
                  Left = 431
                  Top = 43
                  Width = 78
                  Height = 23
                  CharCase = ecUpperCase
                  Color = 14679807
                  TabOrder = 1
                  Visible = False
                  EsClave = False
                  EsRequerido = True
                  ISParam = False
                end
              end
            end
            object EAPrecio: TEditAuto
              Left = 166
              Top = 164
              Width = 156
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 5
              OnChange = EAPrecioChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 331
          Width = 1016
          Height = 87
          inherited MAObservacion: TMemoAuto
            Width = 1012
            Height = 66
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Width = 921
          Height = 418
          TitleFont.Height = -26
          Columns = <
            item
              Expanded = False
              FieldName = 'I8'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = '-'
              Width = 48
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FECHA'
              Title.Alignment = taCenter
              Title.Caption = 'Fecha de Transferencia'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'RP Receptora'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V8'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -7
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'RP Donante'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V9'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -7
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'RP Padre/s'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V10'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -7
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Datos del Embrion'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V7'
              Title.Alignment = taCenter
              Title.Caption = 'Cuerno Uterino'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V3'
              Title.Alignment = taCenter
              Title.Caption = #218'tero'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V4'
              Title.Alignment = taCenter
              Title.Caption = 'Ubicaci'#243'n'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F2'
              Title.Alignment = taCenter
              Title.Caption = 'Cuerpo L'#250'teo'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V5'
              Title.Alignment = taCenter
              Title.Caption = 'Dificultad'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V2'
              Title.Alignment = taCenter
              Title.Caption = 'Condici'#243'n Corporal'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'VUNO1'
              Title.Alignment = taCenter
              Title.Caption = 'Registrar Celo'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F1'
              Title.Alignment = taCenter
              Title.Caption = 'Horas Post Celo'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F3'
              Title.Alignment = taCenter
              Title.Caption = 'Precio'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V1'
              Title.Alignment = taCenter
              Title.Caption = 'Centro Transplante'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V6'
              Title.Alignment = taCenter
              Title.Caption = 'Responsable'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Alignment = taCenter
              Title.Caption = 'Observaciones'
              Width = 79
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 418
        end
        inherited PanelDer: TPanel
          Left = 968
          Height = 418
        end
      end
    end
    inherited PBotones: TPanel
      Top = 460
      Width = 1024
      inherited SBSelTodos: TSpeedButton
        Left = 555
      end
      inherited IFondoB2: TImage
        Width = 598
      end
      inherited BBCancelar: TBitBtn
        Left = 630
      end
      inherited BBAnterior: TBitBtn
        Left = 728
      end
      inherited BBSiguiente: TBitBtn
        Left = 826
      end
      inherited BBTerminar: TBitBtn
        Left = 924
      end
      inherited PL: TPanel
        Left = 598
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1024
    Caption = 'Transferencia Embrionaria'
    inherited LTitulo: TLabel
      Width = 620
      Caption = 'Transferencia Embrionaria'
    end
    inherited PILeft: TPanel
      Left = 816
    end
  end
  inherited Psocalo: TPanel
    Top = 607
    Width = 1024
    inherited JvSocalo: TJvImage
      Width = 1024
    end
  end
  inherited ALUniversal: TActionList
    Left = 195
    Top = 65534
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 68
    Top = 65535
  end
  inherited DSSimple: TDataSource
    Left = 312
    Top = 30
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from aux_eventos'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into aux_eventos'
      
        '  (ID_ANIMAL, ID_RP, ID_SENASA, ID_HBA, NOMBRE, FECHA, I1, V1, I' +
        '2, V2, '
      
        '   I3, V3, I4, V4, I5, V5, I6, V6, V11, V7, V8, V9, V10, F1, F2,' +
        ' I8, I9, '
      '   VUNO1, F3, OBSERVACION, EW)'
      'values'
      
        '  (:ID_ANIMAL, :ID_RP, :ID_SENASA, :ID_HBA, :NOMBRE, :FECHA, :I1' +
        ', :V1, '
      
        '   :I2, :V2, :I3, :V3, :I4, :V4, :I5, :V5, :I6, :V6, :V11, :V7, ' +
        ':V8, :V9, '
      '   :V10, :F1, :F2, :I8, :I9, :VUNO1, :F3, :OBSERVACION, :EW)')
    RefreshSQL.Strings = (
      'Select *'
      'from aux_eventos '
      'where'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      'select id_animal,'
      '          id_rp,'
      '          id_senasa,'
      '          id_hba,'
      '          nombre,'
      '          fecha,'
      '          I1,'
      '          V1,'
      '          I2,'
      '          V2,'
      '          I3,'
      '          V3,'
      '          I4,'
      '          V4,'
      '          I5,'
      '          V5,'
      '          I6,'
      '          V6,'
      '          V11,'
      '          V7,'
      '          V8,'
      '          V9,'
      '          V10,'
      '          F1,'
      '          F2,'
      '          I8,'
      '          I9,'
      '          VUNO1,'
      '          F3,'
      '          observacion,'
      '          ew'
      'from aux_eventos')
    ModifySQL.Strings = (
      'update aux_eventos'
      'set'
      '  ID_ANIMAL = :ID_ANIMAL,'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  ID_HBA = :ID_HBA,'
      '  NOMBRE = :NOMBRE,'
      '  FECHA = :FECHA,'
      '  I1 = :I1,'
      '  V1 = :V1,'
      '  I2 = :I2,'
      '  V2 = :V2,'
      '  I3 = :I3,'
      '  V3 = :V3,'
      '  I4 = :I4,'
      '  V4 = :V4,'
      '  I5 = :I5,'
      '  V5 = :V5,'
      '  I6 = :I6,'
      '  V6 = :V6,'
      '  V11 = :V11,'
      '  V7 = :V7,'
      '  V8 = :V8,'
      '  V9 = :V9,'
      '  V10 = :V10,'
      '  F1 = :F1,'
      '  F2 = :F2,'
      '  I8 = :I8,'
      '  I9 = :I9,'
      '  VUNO1 = :VUNO1,'
      '  F3 = :F3,'
      '  OBSERVACION = :OBSERVACION,'
      '  EW = :EW'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 276
    Top = 30
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
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
    object IBDSSimpleID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_EVENTOS.ID_HBA'
      Size = 10
    end
    object IBDSSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_EVENTOS.NOMBRE'
      Size = 50
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleSetText
      Size = 100
    end
    object IBDSSimpleI2: TIntegerField
      FieldName = 'I2'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleSetText
      Size = 100
    end
    object IBDSSimpleI3: TIntegerField
      FieldName = 'I3'
      Origin = 'AUX_EVENTOS.I3'
    end
    object IBDSSimpleV3: TIBStringField
      FieldName = 'V3'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = IBDSSimpleSetText
      Size = 100
    end
    object IBDSSimpleI4: TIntegerField
      FieldName = 'I4'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleV4: TIBStringField
      FieldName = 'V4'
      Origin = 'AUX_EVENTOS.V4'
      OnSetText = IBDSSimpleSetText
      Size = 100
    end
    object IBDSSimpleI5: TIntegerField
      FieldName = 'I5'
      Origin = 'AUX_EVENTOS.I5'
    end
    object IBDSSimpleV5: TIBStringField
      FieldName = 'V5'
      Origin = 'AUX_EVENTOS.V5'
      OnSetText = IBDSSimpleSetText
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
    object IBDSSimpleI8: TIntegerField
      FieldName = 'I8'
      Origin = 'AUX_EVENTOS.I8'
    end
    object IBDSSimpleI9: TIntegerField
      FieldName = 'I9'
      Origin = 'AUX_EVENTOS.I9'
    end
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      Size = 255
    end
    object IBDSSimpleEW: TIBStringField
      FieldName = 'EW'
      Origin = 'AUX_EVENTOS.EW'
      Size = 1
    end
    object IBDSSimpleI6: TIntegerField
      FieldName = 'I6'
      Origin = 'AUX_EVENTOS.I6'
    end
    object IBDSSimpleV6: TIBStringField
      FieldName = 'V6'
      Origin = 'AUX_EVENTOS.V6'
      OnSetText = IBDSSimpleSetText
      Size = 100
    end
    object IBDSSimpleV11: TIBStringField
      FieldName = 'V11'
      Origin = 'AUX_EVENTOS.V11'
      Size = 100
    end
    object IBDSSimpleV7: TIBStringField
      FieldName = 'V7'
      Origin = 'AUX_EVENTOS.V7'
      OnSetText = IBDSSimpleSetText
      Size = 100
    end
    object IBDSSimpleV8: TIBStringField
      FieldName = 'V8'
      Origin = 'AUX_EVENTOS.V8'
      Size = 100
    end
    object IBDSSimpleV9: TIBStringField
      FieldName = 'V9'
      Origin = 'AUX_EVENTOS.V9'
      Size = 100
    end
    object IBDSSimpleV10: TIBStringField
      FieldName = 'V10'
      Origin = 'AUX_EVENTOS.V10'
      Size = 100
    end
    object IBDSSimpleVUNO1: TIBStringField
      FieldName = 'VUNO1'
      Origin = 'AUX_EVENTOS.VUNO1'
      Size = 1
    end
    object IBDSSimpleF3: TFloatField
      FieldName = 'F3'
      Origin = 'AUX_EVENTOS.F3'
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 624
    Top = 65534
  end
  inherited IBQValidaciones: TIBQuery
    Left = 132
    Top = 65534
  end
  inherited IBQEvento: TIBQuery
    Left = 36
    Top = 65534
  end
  inherited SDXLS: TSaveDialog
    Left = 158
    Top = 497
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'I8'
        Save = False
        Title = 'Embrion'
      end
      item
        DataField = 'ID_RP'
        Title = 'RP Receptora'
      end
      item
        DataField = 'V8'
        Save = False
        Title = 'RP Donante'
      end
      item
        DataField = 'V9'
        Save = False
        Title = 'RP Padre/s'
      end
      item
        DataField = 'V10'
        Save = False
        Title = 'Datos Embri'#243'n'
      end
      item
        DataField = 'V1'
        Title = 'Centro Transplante'
      end
      item
        DataField = 'VUNO1'
        Title = 'Registrar Celo'
      end
      item
        DataField = 'F1'
        Title = 'Horas Post Celo'
      end
      item
        DataField = 'V2'
        Title = 'Condici'#243'n Corporal'
      end
      item
        DataField = 'F2'
        Title = 'Cuerpo L'#250'teo'
      end
      item
        DataField = 'V3'
        Title = 'Utero'
      end
      item
        DataField = 'V7'
        Title = 'Cuerno Uterino'
      end
      item
        DataField = 'V4'
        Title = 'Ubicaci'#243'n'
      end
      item
        DataField = 'V5'
        Title = 'Dificultad'
      end
      item
        DataField = 'F3'
        Title = 'Precio'
      end
      item
        DataField = 'V6'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end>
    Title.Text = 'Transferencia Embrionaria'
    Left = 128
    Top = 497
  end
  inherited WinXP1: TWinXP
    Left = 656
    Top = 0
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 164
    Top = 65535
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 596
    Top = 65535
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 684
    Top = 65535
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 100
    Top = 65535
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 532
    Top = 65535
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'SELECT RESULT, MENSAJE FROM RN_TRANSFERENCIA(:ESTABLECIMIENTO,:A' +
        'NIMAL,:FECHA,:EMBRION,:FECHA_CELO)')
    Left = 776
    Top = 38
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
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
        Name = 'EMBRION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CELO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 808
    Top = 38
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'SELECT * FROM SP_TRANSFERENCIA (:FECHA,:ANIMAL,:OBSERVACION,:EST' +
        'ABLECIMIENTO,:RESPONSABLE,:LOG_USUARIO,:LOG_FECHA_MODIFICADO,:GR' +
        'UPO,:DISPARADOR,:FECHA_CELO,:HORAS_POSCELO,:CUERPO_LUTEO,:UTERO,' +
        ':CUERNO_UTERINO,:UBICACION,:DIFICULTAD,:EMBRION,:CENTRO_TRANSPLA' +
        'NTE,:COND_CORP,:REG_CELO,:PRECIO)')
    Left = 776
    Top = 6
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
        Name = 'GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CELO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORAS_POSCELO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUERPO_LUTEO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UTERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUERNO_UTERINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UBICACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIFICULTAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMBRION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CENTRO_TRANSPLANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COND_CORP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REG_CELO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 808
    Top = 6
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 564
    Top = 65535
  end
  inherited IBQGetCantAnimales: TIBQuery
    Top = 0
  end
  inherited OpenDlg: TOpenDialog
    Left = 100
    Top = 496
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 716
    Top = 0
  end
  object IBQUbicacion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_ubicacion_transferencia')
    Left = 388
    Top = 495
  end
  object IBQUtero: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_utero_transferencia')
    Left = 468
    Top = 495
  end
  object IBQDificultad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_dificultad_transferencia')
    Left = 548
    Top = 495
  end
  object IBQCondCorp: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_condicion_corporal, valor_escala_5 as valor from cod_c' +
        'ondiciones_corporales')
    Left = 620
    Top = 495
  end
  object IBQCentros: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CENTRO_TRANSPLANTE,NOMBRE,MATRICULA,RESPONSABLE from c' +
        'entros_transplante')
    Left = 692
    Top = 495
  end
  object DSCentros: TDataSource
    DataSet = IBQCentros
    Left = 660
    Top = 495
  end
  object DSCondCorp: TDataSource
    DataSet = IBQCondCorp
    Left = 588
    Top = 495
  end
  object DSDificultad: TDataSource
    DataSet = IBQDificultad
    Left = 516
    Top = 495
  end
  object DSUtero: TDataSource
    DataSet = IBQUtero
    Left = 436
    Top = 495
  end
  object DSUbicacion: TDataSource
    DataSet = IBQUbicacion
    Left = 356
    Top = 495
  end
  object IBQCuernoUterino: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_codigo,valor, tipo from cod_genericos where id_codigo ' +
        '= '#39'L'#39)
    Left = 772
    Top = 495
  end
  object DSCuernoUterino: TDataSource
    DataSet = IBQCuernoUterino
    Left = 740
    Top = 495
  end
  object ILEmbriones: TImageList
    Height = 46
    Width = 50
    Left = 256
    Top = 480
    Bitmap = {
      494C010103000400040032002E00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000C80000002E0000000100200000000000C08F
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FDFDFD00FBFBFB00F9F9
      F900F7F6F600F4F3F300F1F1F000EEEDED00EAE9E900E6E5E500E3E2E100E0DE
      DE00DCDBDA00DAD8D600D9D7D300D8D5D000D7D5CE00D6D4CE00D6D4CE00D7D5
      D000D8D6D300D9D7D600DCDBDA00DEDDDD00E2E1E000E6E5E400EAE9E800EDED
      EC00F0F0F000F4F3F300F6F6F600F9F9F800FBFBFB00FDFDFC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFDFF00FCFDFF00FBFEFF00FBFEFF00FDFDFF00FDFDFF00FFFEFF00FFFE
      FF00FFFEF900FFFFFB00FFFFFB00FFFFFB00F9FBFB00F3F5F500EBF5FC00EFF9
      FF00DBFFF100D7FBED00CCF5EE00C6EFE800E3DFEA00E0DCE700EDD8E700ECD7
      E600C6D8D900CADCDD00D1E5D900D6EADE00EDEDDD00F1F1E100E6F9E400E8FB
      E600FFF1FF00FFF4FF00FFFDFB00FFFEFC00FFFFF200FFFFF200FFFFF700FFFF
      F700FFFBFF00FFFBFF00FFF8FF00FFF8FF00FFFBFF00FFFBFF00FDFFFC00FDFF
      FC00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FDFDFC00FBFBFA00F8F8F800F5F5
      F500F2F2F100EEEEED00EAE9E900E6E5E400E1E0DF00DBDAD900D7D5D300D5D3
      CC00D2CFC400C7C4C000B9B8BF00AAABC300A7A8C100A7A8C100A7A8C100ADAD
      C000BDBABD00CAC7BE00D1CEC400D2D0CB00D5D4D300DBD9D900E0DFDE00E5E4
      E400EAE9E900EEEEED00F2F1F100F5F5F400F8F8F700FAFAFA00FCFCFC00FEFE
      FE00000000000000000000000000000000000000000000000000FDFFFE00FDFF
      FE00FEFFFE00FEFFFE00FFFFFE00FFFFFE00FFFFFD00FFFFFD00FFFEFD00FFFF
      FE00FFFEFF00FFFEFE00FDFDFE00FEFEFF00FEFEFF00FEFDFF00FEFBFF00FFFB
      FF00FFFFFD00FFFFFD00FFFFFB00FEFFFB00FFFDFF00FFFEFF00FFFDFF00FFFD
      FF00FFFEFF00FFFEFF00FFFEFF00FFFEFF00FFFCFF00FEFBFF00FFFDFF00FFFD
      FF00FFFDFF00FFFDFF00FEFEFF00FEFEFF00FDFFFF00FDFFFF00FDFFFF00FDFF
      FF00FEFFFE00FEFFFE00FFFEFE00FFFEFE00FFFEFE00FFFEFE00000000000000
      0000FDFEFF00FDFEFF00FBFEFF00FBFEFF00FDFDFF00FDFDFF00FFFEFF00FFFE
      FF00FFFBF600FFFEF900FFFFFB00FFFFFB00FAFCFC00F2F4F400E1EBF200DCE6
      ED00B8DCCE00B3D7C900A4CDC6009BC4BD00B5B1BC00B0ACB700BCA7B600BBA6
      B500A4B6B700A7B9BA00ACC0B400AFC3B700C8C8B800D4D4C400D3E6D100DEF1
      DC00FCE5F400FFEBFA00FFF6F400FFF9F700FEFFED00FFFFEF00FFFFF700FFFF
      F700FFFBFF00FFFBFF00FFF8FF00FFF8FF00FFFBFF00FFFBFF00FDFFFC00FDFF
      FC00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFE00FEFEFD00FCFCFC00FAFAF900F7F7F600F4F4
      F300F0F0EF00ECECEB00E7E6E600E3E2E100DEDDDB00DAD8D300CBCACE00A3A7
      D1007C85D800636FDD005967E1004A5AE6004858E7004A59E6004B5AE7004D5C
      E4005B68DE006C76DA00878DD200B1B2CB00D2CFCB00D8D6D300DDDBDA00E1E0
      E000E7E6E500ECEBEA00F0EFEF00F3F3F300F7F6F600F9F9F900FCFCFB00FDFD
      FD00FFFFFE000000000000000000000000000000000000000000F8FFFE00F8FF
      FE00FBFFFC00FBFFFC00FFFFF900FFFFF900FFFFF800FFFFF800FEFCF400FFFE
      F800FFFDFE00FFFAFB00F8F5FE00FDFAFF00FCF9FF00FBF8FF00FBE9FF00FFEC
      FF00FFFFF400FFFFF300FFFFE800FEFFE700FFF6FF00FFF9FF00FFF4FF00FFF3
      FF00FFFDFF00FFFEFF00FFFDFF00FFFCFF00FFEEFF00FCEBFF00FFF5FF00FFF4
      FF00FFF5FF00FFF7FF00F8FBFD00F7FAFC00F5FEFE00F6FFFF00F6FFFF00F6FF
      FF00FBFFFE00FBFFFE00FFFEFE00FFFEFE00FFFDFE00FFFDFE00000000000000
      0000FFFEFE00FFFEFE00FAFAFF00FAFAFF00F3F8FF00F3F8FF00FFFBFF00FFFB
      FF00FFFFF400FFFCEF00FAF1E700FDF4EA00D9F3FF00D0EAFF008DC7FF0075AF
      EA0042A5E9003EA1E5002BA0DD00279CD9003495D7003495D7002F95DE003096
      DF00089BE1000A9DE300229EDA0024A0DC0061A4CB006BAED50089C2D10093CC
      DB00D2CFE500DDDAF000F5EBF100FFF5FB00FFFFF300FFFFF400FFFFF400FFFF
      F400FBFFFE00FBFFFE00F8FCFF00F8FCFF00FFF9FF00FFF9FF00FFF7FF00FFF7
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FCFCFC00FAFAFA00F8F7F700F5F4
      F400F1F1F000EEEDEC00EDECE900E6E5E400CECFDF008991E3005665EA004153
      ED003D50F3003C4FF4003A4EF3005F6EF500707EF7004D60F4004056F3005163
      F5004255F500374BF400374AF0004052EC006672E500A7ACDE00D8D8DD00E6E5
      E300EBEAE700EDECEC00F1F0F000F4F4F300F8F7F700FAFAFA00FCFCFC00FEFE
      FE00000000000000000000000000000000000000000000000000F8FFFD00F8FF
      FD00FBFFFC00FBFFFC00FFFFFA00FFFFFA00FFFEFA00FFFEFA00FEFCF700FEFC
      F700FDFAFB00FFFDFE00FCFAFE00FCFAFE00F9F9FC00F8F8FB00FCF3FF00FAF0
      FF00F8FEEC00F8FFEC00FBFFE500FCFFE600FCFAFA00FAFBF800FCF5FB00FCF6
      FB00FCFDF500FAFEF300F9FDF200F9FCF300FBF3FC00FCF3FD00FFF5FD00FFF9
      FC00FDFAFC00FFFAFD00F4F7FA00F2F5F800F3FCFC00F2FAFA00F7FFFF00F7FF
      FF00FBFFFE00FBFFFE00FFFEFE00FFFEFE00FFFDFE00FFFDFE00000000000000
      0000FFFEFE00FFFEFE00FAFAFF00FAFAFF00F3F8FF00F3F8FF00FFFAFF00FFFA
      FF00FFFFF300FFFEF100FFF6EC00F0E7DD00B3CDE5009FB9D1006AA4DF00629C
      D7003EA1E5003C9FE3002CA1DE002BA0DD003B9CDE003C9DDF00399FE8003AA0
      E900089BE1000A9DE300239FDB0024A0DC005DA0C7005EA1C8006FA8B70070A9
      B800B7B4CA00C4C1D700E4DAE000F6ECF200FFFCF000FFFFF300FFFFF100FFFF
      F000FBFFFE00FBFFFE00F8FCFF00F8FCFF00FFF9FF00FFF9FF00FFF7FF00FFF7
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FCFCFC00FAFAFA00F8F8
      F700F7F6F500F6F5F300E2E3ED00959DEB004252EE003246F0003348F1006172
      F400B7BDFA00B1BBF9005371F300F7F7FE00000000009AADF8009FB1F8000000
      0000DBDFFC00566FF2007383F4006574F4004254F2003A4CF0005F6CED00B6BB
      E900ECEDEF00F6F5F200F5F5F400F8F8F700FAFAFA00FCFCFC00FDFDFD00FEFE
      FE00000000000000000000000000000000000000000000000000FBFFFC00FBFF
      FC00FDFFFE00FDFFFE00FFFFFE00FFFFFE00FFFEFF00FFFEFF00FFFEFF00FEFA
      FB00FBF9F900FDFCFC00FAFCFB00FCFFFD00F7FBFA00F4F8F700F5F8FF00F3F6
      FF00EFFEE000E0F4D100CCDCB300B7C59E00ACB7A500A7B5A0009EA79B00A2AB
      9F00A7B69200AEBF9900B9CCA500CADDB600E0EAE100EDF5EE00FFFFF800FFFF
      F700FAFCF600FBFCF700F6FBF900F8FDFB00F7FCFD00F0F5F600FAFFFF00FAFF
      FF00FDFFFF00FDFFFF00FFFEFF00FFFEFF00FFFEFE00FFFEFE00000000000000
      0000FFFFFC00FFFFFC00FFFDFF00FFFDFF00FDFBFF00FCFAFF00FCFBFF00FCFB
      FF00E2EBF500E3ECF600B8DEFE009DC3E3004E9CE1003F8DD2001D8CF2002998
      FE00008CFF00008BFF00078DFF00058BFF000094FB000093FA000097FE000097
      FE000096FF000096FF000094FF000095FF000097FF000095FF002A90F000278D
      ED005AA2D10061A9D80092B8D800A4CAEA00DDDDE900EBEBF700FFF6F200FFF9
      F500FFFFF800FFFFF800FAFFFE00FAFFFE00FDFCFF00FDFCFF00FFF9FF00FFF9
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FEFDFD00FDFD
      FC00FBFBFB00CBCFF4006372F000374AF1005767F2009DA6F700778CF600A3B4
      F90000000000F4F7FF005C80F400BFCEFB00D6E0FD007293F600829EF700F1F4
      FE00CED9FC00849EF700FEFFFF00000000008495F600354EF0003C4FF0003648
      F1008E98F000E8E9F700FDFDFB00FCFCFC00FDFDFD00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000FCFFFB00FCFF
      FB00FDFFFE00FDFFFE00FFFDFE00FFFDFE00FFFCFF00FFFCFF00FBF8FD00FFFD
      FF00FEFEFC00F7F8F500F2F9EE00FAFFF600F9FFF400F6FFF100D0E8D700B5CD
      B90092B180006E936400527A3D003D6621002F51200026481800214212002545
      15002A540F00315A1B003E672D00557E43007391650087A57900BDCEB100D7E8
      CC00F2FDEA00F4FBEC00F0F9EF00EFF9ED00F7FBFA00FBFFFE00FCFDFF00FCFD
      FF00FDFDFF00FDFDFF00FEFEFF00FEFEFF00FDFEFE00FDFEFE00000000000000
      0000FFFFFC00FFFFFC00FFFDFF00FFFDFF00FDFBFF00FCFAFF00FCFBFF00FBFA
      FF00E8F1FB00CAD3DD0086ACCC007399B9004593D8004B99DE002594FA002190
      F600008BFF00008BFF00098FFF000A90FF00009AFF00009AFF00009EFF00009E
      FF000098FF000094FF00008DFF00008EFF000094FF000098FF003197F7003197
      F700539BCA005199C800759BBB0082A8C800BFBFCB00D9D9E500FEF2EE00FFFD
      F900FFFFF800FFFFF800FAFFFE00FAFFFE00FDFCFF00FDFCFF00FFF9FF00FFF9
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ACB4F6003F51F2003549F0003E56F000B3BEF90000000000DBE3FD005E83
      F40097B1F80082A2F7005A83F5004A79F4005481F4006F93F6007A9BF700628B
      F5004D7AF4004B78F400C3D2FB00DBE3FD007F9AF600ABBBF900C9CDFA006170
      F3003245F100606FF300DDE0FB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFB00FFFF
      FB00FFFFFF00FFFFFF00FFFBFF00FFFBFF00FFFAFF00FFFAFF00FBF6FD00FFFA
      FF00FBFFF900F9FCF700F4FDEB00F6FFED00D4E2C600AFC0A1005B895B00406E
      400020580B00124A05001B550200276108002C6215002A601400306613003167
      14002E6C070027650500225F0300205D0100275A0A002D601000426632006E92
      5E00AAC39E00D2E6C600F3FFED00F1FBEB00F9FBFA00F0F2F100FFFCFF00FFFC
      FF00FFFCFF00FFFCFF00FDFFFF00FDFFFF00FBFFFE00FBFFFE00000000000000
      0000FDFFFB00FCFFFA00FFFFF200FFFFF500FFFFF700FFFFF600E2F0FF00DAE8
      FA0081BDF9006BA7E300238BEE001E86E9000086FC000389FF00008EFF000295
      FF000091F80000A4FF00529DF900418CE80045A6E00055B6F00042AFE20045B2
      E5006999E7005F8FDD00359BFB00278DED0000A9FF000099FC000790FE000F98
      FF0000A4F10000A0ED002A99DF002C9BE1007BA4D50090B9EA00D6D3E900E5E2
      F800FFF6F200FFFDF900FFFFF400FFFFF100F9FFF500FBFFF700F4FFFC00F2FF
      FA00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ACB4
      F8003144EF005161F200AEB7F9009CAEF8008FA7F700E7EDFE008AA7F8003D6F
      F3003B70F300B7CBFA00F1F5FE00A5BEF900618EF600F6F8FE00F6F9FE006E97
      F600759BF600CBD6FB008FABF8003F6FF3004774F300DFE7FD0000000000A5B3
      F9003B54F1003C4DF0004556F100E1E4FC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFF900FFFF
      F900FFFEFF00FFFEFF00FFF9FF00FFF9FF00FFF8FF00FFF8FF00FFFBFF00FBF8
      FE00F3FFEF00F7FFF200E6FBD600BDD5AD0075975C003E602700155C0A00185F
      0A001E680200256F05002B7708002F7B0C00307B0E00307B0D00348009003682
      0B003889040037880300328302002D7D000028710600266F0600225C0B001F5A
      1000325E27005E8B4B00B1C7A500E6FBD900FDFFF800F3F7EE00FFFDFF00FFFD
      FF00FFFCFF00FFFCFF00FBFFFF00FBFFFF00F7FFFE00F7FFFE00000000000000
      0000FDFFFB00FDFFFB00FFFFF300FFFFF200FFFFF700FFFDF300D4E2F400BDCB
      DD0064A0DC005894D0001E86E9002189EC00058BFF00048AFF000089FF00008B
      FF0000A7FF000085EC003A85E1005DA8FF0071D2FF0087E8FF0086F3FF0088F5
      FF00BDEDFF0091C1FF0040A6FF002E94F40000A0FF000096F900048DFB000C95
      FF00009FEC0000A0ED002D9CE2002C9BE100749DCE0081AADB00C5C2D800D4D1
      E700FAEEEA00FFF7F300FFFFF300FFFFF200F9FFF500FBFFF700F4FFFC00F2FF
      FA00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9FE00959FF7003447
      EF003147EF00BAC3FA0000000000E3E9FE002A5DF1005781F500C5D4FB00D3E0
      FC00759FF600C2D5FB00F8FAFF00C8DBFC008BB3F900EFFFFF00EBFEFF00A9D2
      FC00BCD9FC00E8F4FE00CCE0FD004679F4006D90F50091ACF8009FB6F9007995
      F600C6D1FB00A7AFF9004455F1005161F200D0D4FB0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFF900FFFF
      F900FFFEFF00FFFEFF00FFF9FF00FFF9FF00FFF8FF00FFF8FF00FAF8FD00FCFA
      FE00F5FFEF00E1EFDB0096B582004766330025500D00305B1300207506002277
      0700277C04002C81070030860A0033890D00338A0A00338A0A003A9308003992
      0700389400003894000036910100338E00002F8405002C81040029700F00276E
      1000245A11001F5508004A673A008DAA7D00D9DFD100FCFFF400FFFEFF00FFFE
      FF00FFFCFF00FFFCFF00FAFFFF00FAFFFF00F6FFFF00F6FFFF00000000000000
      0000FAFFF700FBFFF800FFFFF400FFFFF100F5FAFD00E9EEF10095C1F600729E
      D3001A7DEF00177AEC000076FF00007DFF000086FF000085FF000088FF000089
      FF003F99D9003E98D800A1C6FF00CAEFFF008ADFFF006BC0F00058BBDB0042A5
      C500B1C7F100CAE0FF00A1DDFF0082BEF9000797E9000F9FF1001F96FF00148B
      FF000098FE00009CFF00009BFD000098FA002C92E4003197E90081A9DA008EB6
      E700DEDCE800ECEAF600FFFCF000FFFFF400FDFFF000FEFFF100ECFFF600EBFF
      F500FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A9B1F8003D4FF0005C6B
      F200758AF500869FF700B6C7FA0081A0F8004E7DF5007AA0F700000000000000
      00007BA9F7004B87F500CCE4FD00DAF2FE00E6FFFF00D4FAFF00CCF9FF00CCFC
      FF00C4FBFF00AEE9FE00A4E0FD0098D4FC00D3F2FF00BDD1FC002F62F2006389
      F50000000000000000006D7FF400374AF0005767F200E1E4FD00000000000000
      0000000000000000000000000000000000000000000000000000FFFCF700FDFB
      F500FFFEFF00FFFEFF00FAF3FF00FFF9FF00FFFAFF00F6F1FB00F0F8F100F9FE
      FA00D0EBC3006D89600026571400245405002E6D070035730C00298C01003295
      0200349209003D9A12002C8704002C88050046A816002E8F0200369C0200369B
      0100349C0000349C000034980200339802003394070032940600237F0300308B
      0D002D780E001D68000029560F002F5D1600788D6800D5E9C500FDFEF700F6FB
      EF00EFF0EF00F8FAF900FAFFFF00EAEFEF00F6FFFF00F2FCFC00000000000000
      0000FBFFF800FAFFF700FFFFF400FFFFF400ECF1F400CDD2D50074A0D5005A86
      BB00197CEE00177AEC000075FF000078FF00007FFF000082FF00008BFF00008E
      FF002C86C60067C1FF00BCE1FF00AACFFF004DA2D2003388B8003194B4002285
      A5005C729C009EB4DE009DD9FF00A6E2FF0019A9FB0013A3F5001F96FF00188F
      FF000099FF00009CFF00009BFD000098FA002C92E4002C92E400739BCC0079A1
      D200CECCD800DFDDE900FFF6EA00FFFFF400FEFFF100FDFFF000ECFFF600EDFF
      F700FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CED3FB004859F1004D5DF100DCDE
      FC00F9FBFF007393F6004371F300CBD9FB00E4ECFE00709EF7007CA9F80078A9
      F8005593F6009CC0FA00DDF5FE00E7FFFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BCF6FF00B5F6FF00B0F9FF009BEBFF00A8EEFF006EB3FA004D81
      F50094ADF800B4C4FA006D8AF5007080F4003D4FF0007380F400FDFDFF000000
      0000000000000000000000000000000000000000000000000000FFFCF700FEFE
      FA00FFFBFD00FFFAFC00FEF9FF00FFF9FF00F9F5FF00FDF9FE00F6FEF700CCD6
      CD0078986900365627001E53000032671000397D0E0035790A00319800003BA2
      01002F8F030039990D002D8A050033900B003B9F090033970200359E0000359E
      0000339E0000339E0000339A0300339A030033980700339807002B8C07003697
      11003383120027770700316315001A4C0000374F2500748C6200D3DACB00FBFE
      F300F9FCFA00FCFEFD00F2F7F700F7FCFC00F3FDFD00F5FEFE00000000000000
      0000FFFFF200FFFFEE00EFFBFF00EFFBFF00AAD3FF0079A2E0002A79E8002574
      E3000878FF000777FF000076FF000074FF00007AFF00007EFF000185FA000286
      FB008093CC00C6D9FF0068C2FF003A94E800008EF700008FF8000A9FFA00089D
      F8001D92CF00168BC8003F92C90093E6FF0075CDFF004199ED000A84F6001E98
      FF000094FF000093FF000094FF000094FF000098FB000098FB00329AE1003098
      DF009BBADB00ACCBEC00F5E7ED00FFF7FD00FFFEFC00FFFCFA00F5FFFE00F6FF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F8F8FE006876F300374AF0005D73F300F2F5
      FE00E8EEFD005983F5005D89F500000000000000000072A4F700337DF4003381
      F5009EC5FB00F4F3FE00DDF3FE00E3FEFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F1FF0098EFFF0092EFFF0087E2
      FE0063A6F8003E6CF300D9DFFC00F6F7FE007885F400374AEF00AAB2F8000000
      0000000000000000000000000000000000000000000000000000FFFBF900FFFF
      FD00FAF7F900F7F4F600FDFEFF00FCFDFF00ECF8ED00F8FEF800E1FBD8006D89
      6300164C03001D5306002A77020034810C0034900000328E0000469D0500479E
      06003F8C1C004693230040892400458F29002C8700003F991000359E0000359E
      0000339C0000339C00002F9806002F9806002E9904002E9904002C9A000032A0
      03002F9003002C8E01003D871900246F0100194A020022530600728E6200D6F2
      C600F8FFF200F7FFF200EAEFED00FAFEFD00F3F6FB00FAFDFF00000000000000
      0000FFFFF200FFFFEF00ECF8FF00E0ECF8008FB8F6005F88C6001E6DDC002776
      E5000171FF000474FF000076FF000076FF00007CFF00007DFF00007CF1000074
      E9009AADE600CFE2FF0055AFFF003993E70016A6FF000292FB000092ED00069B
      F60037ACE9001C91CE002679B0007ACDFF0089E1FF004FA7FB000F89FB001892
      FF000296FF000092FF000092FF000094FF00009BFE00009CFF00349CE3002F97
      DE008BAACB009BBADB00E6D8DE00FEF0F600FFFCFA00FFFCFA00F5FFFE00F6FF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A7B0F8003B4DF0006B7AF300889EF700708F
      F600698DF50082A2F700719DF60093B6F9007AAAF80078A9F800D7E7FD00B3D3
      FB0078B3F900C9DBFC00DCF4FE00E4FEFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EEFF008AEF
      FF007FEDFF0061BDFB00C8E0FD00FFFAFF009EA9F7003348EF004E5EF100E9EB
      FD00000000000000000000000000000000000000000000000000FEFCFB00FEFE
      FD00FDFBFD00F8F5F700FAFDFC00FCFFFE00F4FFF300EDFAEC0089A87D003150
      25000E480000356F1C0038880F0036860D003998050038970500469807004193
      04006EB64E006AB14A005BA04300498E3100328A05003C930E00369E0000369E
      0000339B0000339B00002F9807002F9807002E9A03002E9A03002C9B0000309F
      00002D9000002D900100459420003E8D190031671500255B09002E4E1D007999
      6800F1FAEA00F1FFEA00F6FAF800F6FBF800F8FAFF00F8FAFF00000000000000
      0000FFFFEC00FFFFED00D6EDFF00B3CAF000448DFF002972E6000064FF00066A
      FF000066FF00036AFF000E73F8000F74F900147DF200167FF4000777E700006A
      DA00AEC6E400C5DDFB0000A3F1000096E400008BFF000077FF001185FF001F93
      FF000895E60017A4F5003E8CBA0068B6E400B0E3FF0082B5F30000ACF500009E
      E700348EFD00328CFB000091FF000092FF00009CFF00009DFF00049FEE00039E
      ED005B9BCB0069A9D900CEC4DB00EBE1F800FFF1FF00FFF3FF00FFF5FF00FFF8
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EEEFFE005767F1004F60F100DBDEFC00000000007293
      F60093ADF80000000000E1EBFD00337AF4001970F300B1CFFB0000000000E3EF
      FE002B8CF7004B9DF700C9E6FD00E6FFFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0077EFFF0073DEFE008DC6FB006C93F500616DF2004252F000959F
      F700000000000000000000000000000000000000000000000000FEFDFF00F9F8
      FC00FDFFFF00FBFDFD00E9F3E600FAFFF700EFFEE500AEC8A40034631E001D4C
      070024700300408C1D00309301003194020035A600002D9E00004D801E00598C
      2A00B7DCAE00A9CEA0008AB18B0061886200549833003D811C003C9902003C99
      0200369804003698040031980700319807002E9E00002E9E00002FA1000032A4
      00002E9B000028950000339507003597090030800F00247403001A500300285E
      1100B1CCA500F0FFE400FEFEFA00F6F8F200FEF7FE00FFF7FF00000000000000
      0000FFFFE800FFFFED00D4EBFF009DB4DA002F78EC002871E500066AFF000468
      FF000067FF000168FF00086DF200086DF2001079EE00167FF4000A7AEA00006D
      DD00B7CFED00BBD3F10000A1EF0000A0EE00008FFF000087FF002397FF00097D
      FF00119EEF0018A5F600317FAD0055A3D100B5E8FF007BAEEC0000A9F20000A3
      EC00318BFA00328CFB000193FF000091FF000097FE000098FF00039EED0006A1
      F0005393C3005F9FCF00C4BAD100E4DAF100FFEEFE00FFF2FF00FFF4FF00FFF7
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ABB3F8003B4EF0005165F200DFE5FC00F5F8FE005580
      F50085A7F800FEFEFF00B0CDFA0076A8F8009CC2FA0074AEF80082BAFA0065AE
      F9004DA4F90046A2F800C7E1FC00E8FEFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF0068EAFF0051D8FE0056D6FD0059CEFD00415CF1005F6D
      F200E9EBFD000000000000000000000000000000000000000000FEFDFF00F5F4
      F900FCFFFE00FCFFFE00E7F3E300F7FFF300D2EEC50067845B001B4E0300275A
      0F0032810D003C8B17002C930000349A050033A80000289C00004F7A26008CB7
      6300E1FDDE00D6F3D400B6D5BD008BAB920070AF520048872A003D9703003D97
      0300379704003797040031980600319806002E9F00002E9F00002D9E00002FA1
      000032A000002E9C00002E9402003197040034891200297E0700296411001752
      000063805600DBF3CE00FCFEF700FFFFFA00FEF0FE00FFF9FF00000000000000
      0000FDFCFF00EDECF500AADBFF006293E1001E78FB001A74F7000D6AF5000D6A
      F5000F6BF8000965F2000065FF000068FF000067FF00006CFF000E70F4000060
      E400BBCEE300C7DAEF000698FF00008DFF001286FB00198DFF00077EFF000B82
      FF002C98E6002995E3002081CB003B9CE600B8E8FF0092C2DE00009FFC00009C
      F9000892FF000892FF00009BF500009BF5000A96FA000A96FA000690FF000690
      FF0016A0FA000C96F0006FA4BF00A4D9F400FEE4DD00FFFEF700FFFFF200FFFF
      F400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFF007A87F5004052F000657BF4005F80F5004571F400658E
      F6006B98F6004986F5004186F500EAF1FD00000000008FC1FB00258BF600CAE3
      FE00F9FCFF008AC4FB00AED6FC00E7FEFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0061E8FF0052E8FF0041E6FF003D87F500404E
      F000BDC3FA000000000000000000000000000000000000000000FDFCFF00F8F7
      FE00F9FDFC00F9FDFC00F1FEEA00EEFCE7009CC08A002F531D00225F0500306D
      130030880600368E0C002F9E00002F9E000028A5000029A600005D734200D7E7
      BC00F0F7FE00F1F8FF00DDE9F200C5D1DB0084B76D0061944A00419409004194
      09003A9706003A97060033990400339904002FA200002FA2000030A000002C9C
      00002D9F000030A200002D9C0000309F010034950F00288903002E7514001960
      01002D511D0099BD8900FFFFF700FDFEF700FFEDFE00FFF7FF00000000000000
      0000FBFAFF00EFEEF70093C4FF005C8DDB001E78FB001C76F900116EF900126F
      FA00126EFB000C68F5000067FF000069FF000067FF00006BFF000C6EF200005E
      E200B5C8DD00BED1E600008BFF000080F700087CF1001589FE000980FF000F86
      FF00309CEA00309CEA002889D30040A1EB00B9E9FF008FBFDB00009DFA00009C
      F9000892FF000892FF00009BF500009BF5000A96FA000A96FA000690FF000690
      FF00159FF9000C96F0006DA2BD009BD0EB00F9DFD800FFFAF300FFFEF000FFFF
      F400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFAFF00DFE2FC005464F2006473F30000000000CED9FC00678CF600F6F8
      FE00F4F7FE005993F6002377F400C0DAFC00DFEEFE005DA9F9003498F800F8FB
      FF00FEFFFF00A2CEFB00CCECFE00E6FFFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E5FF0043E7FF0038BEFB00404D
      EF008F9AF600FDFDFF0000000000000000000000000000000000FDFCFB00FDFD
      FC00F7F8F500F9FCF900FAFFF100E2EFD80062894E001F460B002B710A003278
      11002F8C040037950C00379D0700309704002E950900389F0C0089977B00F8FD
      E900F0F5FA00F3F8FA00F1F9FE00EBF4F9009BC28A007DA46B004D941D004087
      10003F9B08003D9906002D950200329A02002B9C01002E9F0400329F04002C99
      04002C9B01002F9E01002F9B0000309C0000359509002E8E0200327C11001F68
      02002952150050783B00F0F8EA00F9FDF200FDF5FF00FBF7FF00000000000000
      0000F3F4FE00EFF0FA0073A7F400578BD800227AFC00237BFD001C75FB001E77
      FD001E76F9001870F300096DFF000A6EFF00046CFB00066EFD00146EEA00025C
      D800DBCAEB00E0CFF0000090FF000084FF000083F100028FFD000088FF00028C
      FF0000A0EA0000A3ED00058ED3001EA7EC00CCE6FF00A3BDDB00009BFF00009C
      FF000892FF000892FF00009BF500009BF5000696FB000696FB000390FF000390
      FF000E9DF9000796F200639EBE0086C1E100EAD9D600FFF4F100FDFBF300FFFF
      F900FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFF1FE00BCC3FA003C4EF0008390F50000000000CAD7FB007498F6000000
      0000E9F1FD00639CF7008AB7F9007FB6F900489CF8005CA9F9007FC0FB0079C2
      FA006BC0FC0082C0FB00E4F7FF00E4FEFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0043E6FF0035D4FE003C64
      F200626DF200EEEFFE0000000000000000000000000000000000FFFDF800FFFF
      FA00FCF9F400FFFEF900FAFFEE00C9D2BD00325E1B00224E0B002A7C05002F81
      0A0031960500389D0C0037930C00308C0500408B18004F9A2700D2D5D300FAFD
      FB00EDEFF000F7F9F900BEC4C200F6FCFA00C4DCBA009FB79500659C3F00447B
      1E00459F0A00409A050028940000329E000029980600309F0D002E9609002E96
      09002E9903002E990300329A0000329A0000379703003797030038840E00236F
      000036641C0023510900CCDEC700F3FFEE00F9FBFF00F7F9FF00000000000000
      0000F0F1FB00EDEEF8005E92DF005B8FDC002B83FF002A82FF00217AFF00227B
      FF00257DFF001E76F9001074FF001074FF000870FF000971FF00156FEB00035D
      D900D4C3E400DAC9EA00008CFF000081FE00007FED000088F600007CF700007D
      F80000A1EB0000A2EC00038CD1001EA7EC00CFE9FF00A5BFDD00009BFF000098
      FF000892FF000892FF00009BF500009BF5000696FB000696FB000390FF000390
      FF000D9CF8000A99F500629DBD0078B3D300E6D5D200FFEFEC00FCFAF200FFFF
      F900FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D4D8FC009FA8F7003E50F0004D66F200839CF6005D83F500396EF3006C99
      F600518EF5008BB6F90000000000DDEDFE004199F800DCEDFE00000000004BB0
      FA0043B0FA00E6F2FE00E4F0FE00E0FBFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0044E4FF0034DBFE00387F
      F500434DEF00E1E4FD0000000000000000000000000000000000FFFDFB00FDFC
      FA00FFFEFA00FDFCF800F6FFE9009BA78E0023520A0023520A002A7F03003186
      0900359C070039A00C00328F08002F8C05005AA5350084CF5F00EAF6ED00F2FD
      F500E1F6CD00CFE5BB00667F5000C8E2B300DDF5D700BAD2B4007FA972005681
      490046951C00418F170031980000389F00002C980300309C06002D9606002D96
      06002D9901002D990100309B0000309B0000359801003598010037860B002B7A
      010030601400194A02009EB39900EFFFE900F7FAFE00F9FCFF00000000000000
      0000EDF3FF00DEE4F1005A8EDB006498E5003A8EFF00368AFF003383FE003080
      FB003B88FD003481F6002681FF002681FF001F7CFB001F7CFB002979E4001666
      D100D5BEEB00DBC4F100008BFD00007EF000026DFF000C77FF000E66FF00126A
      FF000090FF00008EFF000F7BE0002C98FD00CBDDFF00A2B4FB00009DF5000096
      EE000693FF000693FF00009CF500009CF5000397FB000397FB000090FF000090
      FF00049BFD00059CFE00599EC50061A6CD00D8D2D700F1EBF000EDF9F900F4FF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6BDF9008792F6003D4FEF00B4BEFA00B9C7FB00547DF400A4BCF900BED2
      FB004084F50080AFF800ECF4FE00BFDCFC004BA0F800D8ECFE00F1F9FF0043AF
      FB0037AFFB00C3E7FD00DEE7FD00E0FAFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0044E4FF0032E4FF003395
      F7004249EF00D5D9FC0000000000000000000000000000000000FFFDFD00FAF8
      F800FFFFFC00FBFAF600F9FFEB00707E6200205105002F60140032890900348B
      0B0030990200329B04002F8D06003F9D16008BD76800C9F9A600EFFEF300E4F5
      E800CCF0AA00739751005A8034007FA55900CDE6CA00D7F0D400A0C2A4007294
      76004B912C0040862100399D00003CA001002E9800002A9400002C9603002C96
      03002C9900002D9A00002F9C00002F9C0000359A0000359A0000398A0C003788
      0A0030621400164800006F856900F0FFEA00F7FAFE00FBFEFF00000000000000
      0000F1F7FF00CBD1DE006397E4006CA0ED004094FF003B8FFF003B8BFF003787
      FF00428FFF003C89FE002F8AFF002F8AFF002986FF002986FF003282ED001F6F
      DA00DDC6F300E2CBF800008DFF000079EB000062F900006BFF00065EFF000E66
      FF00007DF300007FF5000470D5002692F700C9DBFF00A3B5FC0000A0F800009B
      F3000693FF000693FF00009CF500009CF5000397FB000397FB000090FF000090
      FF000299FB00089FFF005A9FC600569BC200D8D2D700EFE9EE00EDF9F900F4FF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009CA5F700707DF4005565F200FAF9FE00F9FCFF0094AFF800ECF1FE000000
      00007FADF9003D88F50081B6F9003F97F7002D93F70071BAFA005BB5FB0042AF
      FA008AD3FD008CCEFC00CFEDFE00E5FEFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0044E3FF0031EAFF002EA8
      F9004247EF00B6BDF90000000000000000000000000000000000FFFDFE00F6F4
      F900FFFFFD00F8F9F600F8FFE9004E603F0021580100376E170033920600308F
      02002A9800002C9B00003190070046A51C0091DC7100D1FFB100E3FFD700CFFA
      C3008BC65A0046801500508D150056941B0089B37600D7FDC400BCDBCD0094B2
      A4005A885D0043724600428F180046931B0041A400003B9E00002E9701002E97
      01002E9B00002E9B00002E9F00002E9F0000329D0000329D0000378D09003D93
      0F0031691500174F000049614100F2FFEA00F6FBFB00FAFEFF00000000000000
      0000F4FBFF00B2B9C80071A4ED0071A4ED004797FF004393FF005298FF004F95
      FF005899FC005394F7004894FF004A96FF004392FF004392FF004C8FEB00397C
      D800BCBEF800C8CAFF00499ADE003889CD002F6BE600336FEA004062F500486A
      FD004B82CB00538AD3005182C6006FA0E400A9DBFF007EB0FF0011A3EB0011A3
      EB000693FF000693FF00009CF500009CF5000197FC000197FC000090FF000090
      FF000096FA0004A0FF0052A0CB004593BE00CED0DA00E3E5EF00E1F7FD00E9FF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009FA8F7007380F400475AF100B3BEF900AEC1FA00547FF400A0BAF900BBD1
      FB005693F600AECDFB00D9E9FD0057A4F90087C1FB00D9EDFE0070C0FC0093D2
      FC00FFFCFE00EAF2FE00E6FEFF00E2FCFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0044E2FF0030EBFF002EAC
      F9004246EF00B7BEF90000000000000000000000000000000000FFFDFF00FAF8
      FE00FCFDFB00F8F9F700F8FFE900354926001D560000366F14002C8D00002E8F
      00002C9C000031A1000034940A0038980E005DA83E007CC35D00A6D6950087BA
      760052941D0054961F00498E0800488D070054843C0098C78000CEEBE200C0DD
      D40080A78E00547B6200458B200042881D0046A7000041A20000319A0300319A
      0300309D0000309D00002EA000002EA00000329E0000319D0000358C06003A91
      0B00346D180019520000314A2800F3FFEA00F4FAF900F9FFFE00000000000000
      0000F4FBFF00A2A9B80079ACF50070A3EC004494FF004292FF00599FFF00569C
      FF005C9DFF005798FB004D99FF004F9BFF004897FF004998FF005295F1003F82
      DE00C2C4FE00DADCFF006CBDFF0068B9FD00639FFF0067A3FF007193FF007698
      FF0071A8F1007BB2FB0077A8EC0089BAFE00B2E4FF007AACFF000B9DE5000C9E
      E6000693FF000693FF00009CF500009CF5000197FC000197FC000090FF000090
      FF000094F80004A0FF0052A0CB00408EB900CED0DA00E1E3ED00E0F6FC00E7FD
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009FA8F7007481F4003C50F0006E85F4007694F6003264F2005887F4005F93
      F600498AF500DCE9FE000000000087BEFA00BBDBFC0000000000A5D8FD007FCA
      FC00EBEEFD00D6E8FD00EAFFFF00E2FCFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0044E2FF0030EBFF002EAC
      F9004246EF00B7BEF90000000000000000000000000000000000FBFBFF00FBFA
      FF00F7F9F900F9FBFB00F1FFE200253B160018570000337210002A8E00003095
      00002DA1000030A3000032970B002F95080037871C0038881D004BA216003991
      08003F8D1600499821004B9B16003B8B06004493060052A01300A9DC9800D0FC
      BF00B2C5D3007F93A0005C835A00486F450051A000004A990000399B0700399B
      0700359F0000349E00002EA100002EA000002F9E00002F9E000035910500338F
      02003673190019550000243E1A00F2FFE800F4FBF900F7FEFB00000000000000
      0000F6FCFF00A2A8B30084B3F7007BAAEE0060A8FF005CA4FF0067A0FB0070A9
      FF007BACFC0079AAFA006CABFF0069A8FF005DA0FD005EA1FE00639BE8004B83
      D000B2C2E600DAEAFF00ABE0FF00BCF1FF0098DDFF00A5EAFF00CBFCFE00CDFE
      FF00B5EEFD00C2FBFF00A4D7E100CAFDFF008EE3FF006ABFE70020A5FF000C91
      F2000993FF000993FF00009BF700009BF7000297FF000297FF000091FF000092
      FF000098FC00009DFF0056A4D2003B89B700D1D7E200D8DEE900E0FAFF00E5FF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009BA4F700707DF4005061F100EAECFE00EBF0FE0084A2F800D6E1FD00F8FA
      FF0073A5F80071A7F800ADCFFC003F96F70066B0F900B1D9FD004CAEFB0023A2
      FA003BB5FC0098D3FD00E4F6FF00E3FDFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0044E2FF0030EBFF002EA9
      F9004246EF00B6BDF90000000000000000000000000000000000F6F6FF00FAFA
      FE00F7F9F900FCFEFE00EEFFDF00213812001C5C00003777140032970000359A
      02002CA00000299D000032980A003AA01300449429003F8F2300369200004FAB
      170043941D003E8E170041920E004C9D19004698030053A510005E954700B2E9
      9B00C6D9E600A5B8C500789C7900567A57005DA90800529D02003C9D0A003C9D
      0B0037A10100369F000030A200002FA200002F9F00002E9E000039950800328E
      010039761C0019560000233D1900F3FFE900F7FDFB00F8FFFC00000000000000
      0000F6FCFF00A7ADB80084B3F7007DACF00061A9FF005FA7FF006AA3FE0073AC
      FF007BACFC0079AAFA006CABFF006BAAFF0063A6FF0066A9FF006AA2EF005189
      D600B1C1E500C8D8FC006FA4DD00598EC7004489B10063A8D000AEDFE1009DCE
      D000629BAA005F98A7004D808A0093C6D000A2F7FF0065BAE2001196F7001499
      FA000993FF000993FF00009CF800009BF7000297FF000297FF000090FF000091
      FF000099FD00009CFF0055A3D1003D8BB900CFD5E000D9DFEA00E0FAFF00E5FF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AEB5F9007F8BF5004556F000EAEBFD00FAFCFF0080A0F700DEE6FD000000
      000073A5F800478CF50099C3FB007CB7F900288FF70069B5FA0092CDFC0038AA
      FA0086CFFD00FFFBFF00DDE9FD00E0FAFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0044E3FF0031E6FF00319B
      F8004248EF00CBD0FB0000000000000000000000000000000000FBFCFF00F0F1
      FB00FDFFFF00FAFCFC00F1FFE4002E4421002A69090029680800329600003195
      0000299D00002CA0000032980A0032980A003D8F1E00419322003CA700003CA7
      00003F98200040992100449C1A00449C1A0049AB000048AA00004C9A100059A7
      1D00BBDFBB00D3F7D30095B19A006B87700076A34C004F7C250041971300469C
      180042A110003D9C0B0036A1000037A20000319F00002A9800002F8C01003895
      0A002E6B11000F4C0000354D2A00F4FFE900F0F2F200FCFEFE00000000000000
      0000FBFEFF00B6B9BE008CB6F10088B2ED0070AEFF006FADFF007CACF40085B5
      FD0091B6F4008DB2F0007EB2FE007EB2FE0075B0FF0078B3FF0079ABED005E90
      D200C9D5C900E4F0E40060A1FF00397ADD002675BE002E7DC600ADDFF30096C8
      DC000054E2000466F400256AB3004F94DD00A1F9FF0066BED6000290FF000391
      FF000B92FF000B92FF00009BF900009BF9000497FF000396FE00008FFF00008F
      FF000098FD000099FE0056A2CC004793BD00D3D5DD00E0E2EA00E7FCFE00EBFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CDD2FB009AA3F7003B4DEF006D81F4006F8DF5003B68F2006890F60078A1
      F7002E76F30084B1F80000000000F3F9FE0059A6F800DBECFD000000000087CA
      FC007CC8FB00FFFEFF00E1ECFD00DFFAFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0044E5FF0033DDFE003784
      F600434DEF00E2E5FD0000000000000000000000000000000000FBFCFF00F5F5
      FE00FDFEFE00F6F8F800F4FFE7004A5F3E001F5B0000326E12002E9100002F92
      0000299C00002C9F000034990A00369B0C0042942100459724003EA605003EA6
      0500419C1F00429D200047A01B0047A01B004AAB05004AAB050053A3170056A6
      1B00608D5200ADDA9F00C3E0C000A4C4A100628A44006D944F00449518004597
      1A00419D11003F9B0F0037A00300379F020035A1010036A20100328E0500318D
      0400306C13001B5700003F563400F4FFE900F9FAFB00F9F9FA00000000000000
      0000FAFDFF00C3C6CB008DB7F2008CB6F10073B1FF0075B3FF0081B1F90089B9
      FF0099BEFC0094B9F70083B7FF0083B7FF0079B4FF007CB7FF007BADEF006092
      D400C4D0C400E0ECE0006FB0FF005495F8004493DC002776BF00B8EAFE0099CB
      DF000F71FF001274FF00397EC70062A7F00096EEFF0065BDD500018FFF00018F
      FF000B92FF000B92FF00009BF900009BF9000497FF000396FE00008EFF00008E
      FF000099FE000097FC0056A2CC00509CC600D3D5DD00E3E5ED00E8FDFF00EBFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E9EBFD00B5BCF9003E50F000586DF200D2DAFC00A6BBF9004374F300B3C9
      FB00B5CFFA0071A4F700E0ECFE00CAE1FD003491F700A4CFFC00F4FAFF0075C0
      FB0032A6F90082C7FB00DCF4FF00E4FEFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0043E6FF0035D6FE003C69
      F3005A66F200EBEDFD0000000000000000000000000000000000FDFBFF00FEFC
      FF00FCFCFC00F4F4F400F8FFEE0074856A0014490000366B1B002A8900002F8E
      04002C9C00002E9E0000389B09003B9E0C00499A1F004C9D2200419F180042A0
      190044A4170045A5180048A7170048A717004AA617004AA6170055AC1C004DA4
      1400559F1D005CA62400B8DD9D00ACDA910091A899006F867700579933005395
      2F004B9A21004D9C230043A211003D9C0B00379C0400389D0500358D0B002B83
      0200306815001A52020066785B00F3FFE800FFFDFF00FAF4F900000000000000
      0000FFFDFC00D9D7D60098BBED009ABDEF0080B6FF0085BBFF0092B7F3009ABF
      FB00A5C3F400A1BFF00091BDFD0091BDFD0083B8FF0087BCFF0086B5F2006D9C
      D900B1C6C300D1E6E30085BCFF00639AEB004C88F900306CDD00CFD9FF009EA8
      FC001D68FF000040FF003263D70095C6FF007DD6FF00469FEF000081F8000294
      FF00098EFF00098EFF000099FA00009AFB000795FF000694FF00008DFF00008C
      FF00059AFC000196F8005DA3C80064AACF00DCD7D800F0EBEC00F2FFFC00F3FF
      FD00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F8FE00D4D8FC004A5BF100707DF40000000000E6ECFE006E92F600F8F9
      FF00000000007DABF8002C7CF40066A4F7008FC2FA004CA0F8002D94F8007EC1
      FC00CBE9FE00A6CDFB00DBF3FE00E5FFFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0053E4FF0043E7FF0038C6FC004050
      F000828DF500F9FAFF0000000000000000000000000000000000FCFAFD00FFFD
      FE00FDFCFC00F6F5F500F9FFF0009FAE9700134504002D5F150028820100308A
      08002E9B01002F9D0100379A07003DA00C004B9D1E004D9F2000469F1F0047A0
      200048A7180049A81A004CAA1C004CAA1C004DA524004DA5240057AD240053A8
      200053A3150064B52700659B4000A0D67B00ACC8B00093AF970068A247005C96
      3B004D9527004F97290049A41B00449F16003A9B09003698060033880A00287D
      01002B61110010460000A3B39900EDFCE200FFFBFF00FCF6FB00000000000000
      0000FFFDFC00E8E6E5009BBEF0009FC2F40083B9FF008AC0FF0096BBF7009DC2
      FE00A3C1F200A1BFF00094C0FF0093BFFF0085BAFF008CC1FF0092C1FE007EAD
      EA0095AAA700D2E7E400AEE5FF0082B9FF00528EFF003C78E900D4DEFF00A4AE
      FF000E59FF00105BFF006FA0FF00B0E1FF0059B2FF00348DDD00007FF6000091
      FF00068BFF00078CFF000098F900009AFB000896FF000795FF00008EFF00008D
      FF00059AFC000095F7005FA5CA0071B7DC00E0DBDC00F6F1F200F4FFFE00F2FF
      FC00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFF00F3F4FE006978F3004254F000BAC3FA0098ADF8003A69F200A2BA
      FA00B9CEFB004C88F5002474F300DCEAFD0000000000ABD1FC00268CF700C1DF
      FD0000000000E3ECFD00D0EBFD00E2FDFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006BE8FF0060E6FF0051E6FF003CE6FF003B99F700404D
      EF00B1B8F9000000000000000000000000000000000000000000FEFCFB00FFFF
      FE00FFFDFD00FBF9F900FBFFF500C7D1C100305D1E00214E0F00247802003084
      0D003099020030990200369903003EA10B004DA01B004EA11C004C9D29004E9F
      2B004DAA19004FAC1B004FAB220050AC230050A2370050A237005BAF31004CA0
      220061BB1B005DB7170062A62F0069AD36009ABF9900A8CDA70086B46B0075A3
      5A0059973900508E3000499D21004A9E2200409C130038940B00308009002878
      010027580E001D4E0A00DFEAD500ECF8E200FFF9FF00FFF8FF00000000000000
      0000FFFFFA00F7F3EE00A0C1EE00A6C7F4008ABCFF0092C4FF009FBFF400A6C6
      FB00ABC3ED00ACC4EE009CC6FF009AC4FF0089BDFF0091C5FF009CCAFF008DBB
      F5006B91C7008DB3E900D7F0EC00D3ECE80092BFEB0077A4D000F1EEF700D5D2
      DB008AABC500B7D8F200D9F5FF00B3CFEE000F79FF000B75FE000087FB000087
      FB000587FF000789FF000096F9000099FC000A96FF000A96FF00048FFF00038E
      FF000A9AF9000494F30067A7C90082C2E400EADFDB00FFF7F300FBFFF900F8FF
      F600FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009FA8F7003D4FF0004158F10095AAF700B4C5FA004574
      F4005283F400B9D0FB0080ADF80092BAF900FAFCFF0093C1FB004196F70063AB
      F900A5D0FC0072B9FA008DBFFA00E2FBFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEAFF0076E9FF006AE8FF005AE7FF0060E3FF007FD4FC004463F1005665
      F200E2E5FD000000000000000000000000000000000000000000FFFEF900FFFF
      FB00FFFDFD00FEFBFC00FBFFF600E8EFE300658E5700204911001C6C00002C7D
      0D002F9602002F9602003698020042A40E0052A51B0052A51B0054A5290055A6
      2A0055AB260057AD280055AC310056AD320056A83E0056A83E0050A52C0064B9
      40005DB5230058AF1E0063AC300063AC3000699D50008ABE71009EC7880093BC
      7E0075AE59005E9742004D9D28004F9E2A00429B1700328B08002D7B08002270
      000026540D0055833C00FBFFF000F2FBE800FFF6FF00FFF7FF00000000000000
      0000FFFFFA00FDF9F400A1C2EF00A8C9F6008BBDFF0094C6FF00A0C0F500A6C6
      FB00B1C9F300B3CBF500A2CCFF009DC7FF0089BDFF0091C5FF009ECCFF0092C0
      FA009CC2F800678DC30099B2AE00D2EBE700C1EEFF00A8D5FF00FFFCFF00ECE9
      F200CFF0FF00CEEFFF00B8D4F3006B87A6000771FA000B75FE000086FA000085
      F9000486FF000688FF000096F9000099FC000A96FF000A96FF00048FFF00038E
      FF000A9AF9000393F20068A8CA0089C9EB00EDE2DE00FFFBF700FBFFF900F7FF
      F500FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E6E8FD004D5DF1004F60F100E1E4FC000000000083A1
      F70084A4F70000000000000000004687F5003B85F5007BB0F800EDF5FE00D0E5
      FD00469BF700288AF700B2D8FD00E7FEFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF0089EC
      FF007FEBFF0077EEFF0070E6FF008ED4FC006A93F6004E62F100414FF0008994
      F600000000000000000000000000000000000000000000000000FFFFF800FFFD
      F600FFFAFB00FFFCFD00FAFEF600F9FCF50097BD8B00274D1B00146200002775
      0A002D9200002D9200003798020045A6100057AB1D0057AB1D005AAA29005CAC
      2B005BAC31005DAE33005BAD3D005CAE3E005BAD44005BAD440054AA340064BA
      44005FB42E005AAF29006EBB3B0066B333005E9F32006FB043008EB27C0097BB
      850087BB6D006FA3550057A3340055A1320042991A002B8203002D7909001B67
      000028540F0099C58000FDFFF200FAFEEF00FFF5FF00FFF3FF00000000000000
      0000FBFDFF00F0F2FA00D4E0F200CAD6E800B2CCF100AEC8ED00A0C6FC00A5CB
      FF009BC8FF009CC9FF009EC8FF009BC5FF00A2C7FB00A5CAFE00AACBF900A8C9
      F700A5C6E70099BADB007AA3D4007099CA0078A1DF008DB6F400A5C2F500A3C0
      F300B9CFF800D5EBFF009ECCFF0089B7ED003592F9002A87EE000067F6000080
      FF00008DF0000092F5000B8CFF000C8DFF00098CFF000B8EFF000097FF000094
      FF002CA4DF00249CD70085AFC200ADD7EA00FEF7F400FFFDFA00FFFFF500FFFF
      F700FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949EF700394CEF00919BF600DCE2FC006889
      F5005B83F500D2DDFC00CBDBFC00568EF6004185F40074A7F800FCFDFF00F9FC
      FF0072AFF9007CB2F900DCF4FE00E5FFFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0091EDFF008AEE
      FF0082F0FF006CD6FD00B2DAFC0000000000C3C9FA004254F1004557F100D7DA
      FC00000000000000000000000000000000000000000000000000FCFCFD00F6F5
      F700FFFCFD00FFFCFE00F3F2F300FEFDFD00DAEAD2006C7C65001E4A0C002B56
      1500327C0F003B8517002F9001003C9C0E004CB614004EB917005BAA2B0060AF
      2F0062B0360062B0360062AF3C0065B2400067B1470066B1460066B2440066B2
      440066B23F0066B23F006BB6420064AF3A0064AC3A0069B13F006CAE580067A9
      530078BB5F0082C568006FB253005A9D3D0049872B00306E120038681F001647
      010065805500E1F4D200FBFFF500F4FBEE00FFFCFF00FAF7FA00000000000000
      0000FAFCFF00F9FBFF00E0ECFE00CBD7E900AFC9EE00B2CCF100A4CAFF00A1C7
      FD009AC7FF009BC8FF009FC9FF009EC8FF00A5CAFE00A4C9FD00A6C7F500A3C4
      F200AFD0F100ADCEEF0093BCED007BA4D500658ECC006089C7006D8ABD006C89
      BC007F95BE008AA0C90099C7FD00B8E6FF0052AFFF002986ED000077FF000087
      FF00008FF2000092F5000788FF00098AFF000689FF00088BFF000095FF000093
      FF00259DD8002DA5E00097C1D400B9E3F600FFF8F500FFFBF800FFFFF400FFFF
      F700FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E9EBFD004F5FF1004254F0004F68F200A5B7
      F900B8C8FA00648BF500366EF300C8DAFC00E3EDFD007BAAF80070A4F7006DA5
      F80080B4F900EFF1FD00DEF3FE00E3FDFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ACF2FF00A3F0FF009AEEFF0094F2FF008AEC
      FF005FB3FA00326AF300AFBEF900F9FAFF008D97F6003B4EEF00909BF6000000
      0000000000000000000000000000000000000000000000000000FCFCFF00F4F4
      FA00FFFDFF00FFFDFF00F3EFF400FFFDFF00FAFDF400B6BDB00032501F00304E
      1D002C6C0C00397919002C8C000038980C0045B80F004FC219005DAC2D0062B1
      320065B2380066B3390067B23F006BB643006BB3480068B045006BB349006AB2
      48006CB449006DB54A006CB6460069B3430068B33F006AB54100509D3B0060AD
      4B0061AA480064AD4B0073B3590056963C00386C1E00386C1E001D4309004167
      2D00ABC09F00F6FFEA00FBFFF700F1FAED00FCFCFC00FCFCFC00000000000000
      0000FAF9FD00FFFEFF00F1FAFF00D5DEEC00B5CAEA00BACFEF00ACCDFE00A4C5
      F6009FC7FF00A0C8FF00A1C9FF00A3CBFF00A8CDFF00A5CAFE00A5C6F400A1C2
      F0007EB8FA0083BDFF0077BAFF0073B6FF0067ACFF005DA2FF005F95EA005288
      DD00698DC9004C70AC005C84B90092BAEF0095D9FF006EB2FD002585E9001070
      D4000D85FD000C84FC000087FF00008AFF000092FF000094FF001D98F2001D98
      F2005996C80073B0E200C5D8E500DDF0FD00F8FBF900F8FBF900FCFDF900FFFF
      FC00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5BCF9003C4EF000495BF100F4F4
      FF00000000009CB3F9002258F100E6ECFE0000000000ADC8FB003076F3003E83
      F4005090F600B6CFFA00E2F7FE00E4FEFF00DDFCFF00D6FAFF00CFF9FF00C9F8
      FF00C2F6FF00BBF4FF00B3F3FF00ADF4FF00A4F2FF0098ECFF007ACAFC004D8B
      F6007C9CF700BCC8FB007B96F600697CF3004253F0005B6BF200F2F3FE000000
      0000000000000000000000000000000000000000000000000000FDFEFF00F6F8
      FA00FBFAFE00FFFDFF00FBF7FA00FFFDFF00FDFFF700F0F6EB0090A881002D45
      1E00134601004377260033840C003080080041A314004DAF200067B43B006AB8
      3E006BB6410069B440006CB5470072BB4C0072BA50006FB74C006EB54E006FB6
      4F0071B94F0072BA500071B94E006FB74C006CB646006BB544006FBB4C0069B5
      460066AD470062A942005D9A42004D8A32003F6B28002B581500223E140095B2
      8800ECF8E600F6FFF000FBFBFE00FBFBFC00F9F3FE00FEF9FE00000000000000
      0000FBFAFE00FFFEFF00F3FCFF00E1EAF800BDD2F200B7CCEC00A8C9FA00A7C8
      F900A1C9FF00A0C8FF00A0C8FF00A3CBFF00A8CDFF00A5CAFE00A9CAF800ABCC
      FA0090CAFF008CC6FF0076B9FF006CAFFF0061A6FF0060A5FF0072A8FD0073A9
      FE006F93CF006D91CD004B73A800547CB1009ADEFF007EC2FF002888EC002C8C
      F0000A82FA000981F9000085FF00008AFF000093FF000094FF001E99F300209B
      F50064A1D30086C3F500D8EBF800E5F8FF00F9FCFA00FBFEFC00FEFFFB00FDFE
      FA00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C97F6003F50F0007480
      F400CCD4FB007F99F7006487F5007B9CF60095B1F8005B8AF600CBDBFC00F3F7
      FE0097BCFA00387AF400CBE6FD00E5FCFF00E0FEFF00D7FCFF00CEFBFF00CDFD
      FF00C4F8FF00B6F0FF00B2F0FF00A3E6FE00A5DAFC00CCE3FD005E89F500436D
      F300DCE4FD00000000009FABF8003147EF004455F000CFD4FB00000000000000
      0000000000000000000000000000000000000000000000000000F8FAFB00F9FB
      FC00FCFCFE00FEFDFE00FEFDFE00FEFBFD00F8FDF300FCFEF700EBFBDC00748B
      66001849030026570A0034810D00327F0B002E8D030042A117006AB63E006EBB
      420070BA47006CB743006BB4460071BA4C0075BD540077BF550076BD570077BE
      580076BD540073BA510072BA4F0072BA4F006FB949006AB4440077C252005FAB
      3B0069AF480069AF480047832C00306C14002F591900174204007B956E00DBF5
      CE00F9FEF500EDF8E900FAF8FD00FEFDFF00FEF7FF00FCF5FF00000000000000
      0000FFFFFE00FFFEFD00F9FCFF00F4F7FF00D2E2F900BECEE500ADC8ED00B5D0
      F500AACEFE00A7CBFB00A4C9FB00A6CBFD00A6CAFA00A5C9F900AFD2FE00BADD
      FF00FCF3E600FFF8EB00DCEFFF00D0E3FE008DBEFF0075A6F4005093FA004D90
      F700488AF0004486EC002467C4002C6FCC0089D6FF006FBCFF002C86EB002F89
      EE002174FF001F72FF000085FD00008CFF000097F2000096F1004898D5004F9F
      DC00B8B8D600D4D4F200F9F3F800FFF9FE00F3FEFC00F6FFFF00F8FEFF00F4FA
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2F3FE007481F4003D4F
      F0002D46EF0098A8F80000000000E5EBFD003F6EF3003166F200C7D5FC000000
      0000A5C1FA0078A4F700E5EDFE00D7E7FD00B4D5FB00D6F3FE00D0EFFE00B8E2
      FD00AEDAFC00D2EDFD00D9EEFD005A87F5006E94F60088A4F70089A4F8007995
      F700AEBEF900C6CBFA004E5EF1004455F000B7BEF90000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F5F300FBFF
      FE00FEFEFE00FAFAFA00FFFDFE00FFFEFF00F9F8F400FDFCF800F0FCE600ECF7
      E2007C9A69001E3C0B0026580B003C6E20003070100047872700579D320067AD
      420075BA510077BC530074B8530075B9540078BB5A007ABD5C007FC2610080C3
      62007CBF5E0077BA590077BA57007DC05D007BBF5A0074B853006BAE3B0077BA
      47006BA7430055912D0045732B0023510900314F26006D8B6200DCE8DB00F3FE
      F200FCFDFF00F6F7FB00FAF3FF00FEF9FF00FFF8FF00FFF4FF00000000000000
      0000FFFFFE00FDF9F800F5F8FF00FAFDFF00E1F1FF00C7D7EE00B0CBF000B9D4
      F900A9CDFD00A6CAFA00A5CAFC00A4C9FB00A0C4F4009FC3F300B2D5FF00C7EA
      FF00ECE3D600E5DCCF00C2D5F000D3E6FF00B5E6FF00ADDEFF007DC0FF0068AB
      FF0061A3FF003C7EE4004689E60075B8FF008BD8FF0062AFFF002882E700116B
      D0002174FF001E71FF000084FC000089FF000091EC00008FEA004999D60058A8
      E500D2D2F000E2E2FF00FCF6FB00FFF9FE00F4FFFD00F6FFFF00F8FEFF00F5FB
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3E6FD006E7B
      F400384AF0006A78F400D9DDFC00DFE6FD006A8AF50093ADF8008EA9F80082A2
      F7004175F3009AB5F80000000000E8EFFD005E8EF600DBE3FD00FAF5FE009AB3
      F800608CF500D6DFFC00AEC2FA004A78F400275BF100BACAFA0000000000DBE1
      FD003F5AF1003D50F0004454F000B5BCF9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6FAF800FBFF
      FD00FDFDFD00F5F5F500FEFBFD00FFFEFF00FFFEFC00FEFDFA00F6FFEE00F8FB
      EF00D6EFC500839D7200285514001D4A07002D660F002C660F003F821B005598
      31006EB14C007CBE590081C3610082C4620081C263007EBF610080C1630084C5
      670081C264007BBC5E007EBF5F0085C6660083C4630078B9580081C052006FAE
      4000568E3000356D0F001F490700335E1B0086A17D00D3EECA00F8FEF800F1FC
      F200FBFBFF00FDFDFF00FCF6FF00FAF2FE00FFF8FE00FFF8FF00000000000000
      0000FFFFFB00FFFCF700FAFCFD00FDFFFF00F3FCFF00E2EBF900C7DBF400C2D6
      EF00B2CCF000B2CCF000AFCDF600AECCF500A0C0E9009CBCE500B1D1FA00CEEE
      FF008FC3FF006FA3E600608CC9006995D2009FB7E500BBD3FF00DEE6FF00E3EB
      FF00C0C7E200C0C7E200B7DAFF00CCEFFF0065B3FF003886F0000173FF000C7E
      FF001A73FF001871FF000982F0000D86F4002190D4002594D80086B0CD00A1CB
      E800F9E9F000FFF1F800FFFBF800FFFDFA00FEFDFF00FFFEFF00F6FCFF00F6FC
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEF
      FE007F8BF500374AEF005364F200596FF20096A7F80000000000EEF3FE003F6B
      F2006287F4007497F6007295F600638BF5003C6FF3007598F60098B3F9006189
      F5003769F3004673F300A4BBFA00D5DFFC0087A1F7009AAEF800E8EAFD00838F
      F6003E51F0004657F100B7BEF900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFFFB00FBFD
      F900FCFDFB00FAFBF900FCF9FB00FDFCFD00FFFDFE00FFFDFE00FDFDF800F3F3
      EE00F6FFEC00E6F2DC0098AB890050674100304E1D002A4817002E6712003D76
      2100528B3600669F4A0078B05D0086BE6B0089C16E0086BE6B0085BD6C008AC2
      710088C06D0083BB680084BC690088C06D007FB764006FA754006D9D45004979
      2100345C15002E560F004863380092AB8200DDE8DC00F2FFF100FBFCFE00FAFB
      FF00FDF7FF00FBF7FD00FFFCFF00FFF8FE00FEF7FA00FFFDFF00000000000000
      0000FFFFFB00FFFFFB00FDFFFF00FDFFFF00F3FCFF00F1FAFF00D2E6FF00BFD3
      EC00AFC9ED00B1CBEF00B1CFF800AFCDF6009DBDE60096B6DF00ADCDF600CCEC
      FF0086BAFD0084B8FB0087B3F00077A3E000778FBD007189B7009BA3C000B9C1
      DE00CFD6F100E2E9FF0098BBF30080A3DB003684EE00317FE9000061F1000678
      FF001871FF00166FFF000881EF000E87F5002493D700309FE3009CC6E300C0EA
      FF00FFF1F800FFF5FC00FFFEFB00FFFEFB00FFFEFF00FCFBFF00F4FAFF00F6FC
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFAFF009EA7F7004255F1003549EF006271F300C7CDFB00D6DCFC006C89
      F50000000000F8FAFF006A8CF5006E8FF500CCD8FC00819FF700567CF400DCE5
      FD00E6ECFD005B7EF400DCE3FD0000000000B9C3FA00435BF0004B5CF1003D4F
      F0006271F300D1D6FB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFFFA00F9FB
      F500FDFDFB00FFFFFD00FEFCFD00FBF9FB00FFFCFD00FFFCFD00FBF9F600FFFD
      FB00F6FEEE00F7FFEF00F8FFED00B7C7AB00607551005469450023550B002759
      0F002F6116003E70260055873D006C9E540079AB60007CAF640085B76D0088BA
      700089BC710086B86D007EB0660071A359005E9147004E803600335A14003D64
      1E0043622B0066864E00B8CDAE00EFFFE500F9FEF900F2F9F300FBFAFE00FDFD
      FF00FDF9FF00F7F3FB00FFFDFC00FFFDFC00FEF8F500FFFDF900000000000000
      0000FFFFFB00FFFFFB00FFFFFE00FFFFFE00FAFEFF00F8FCFF00EBF7FF00E9F5
      FF00C0D1E600CFE0F500BCD3ED00B2C9E300AFC8E8009CB5D500A3BEE000D9F4
      FF00BED2F100B2C6E50098B9E70096B7E5007CACF4006C9CE4004582DF003875
      D200357DE3002D75DB001B6AD9001766D5001167E100176DE7001271F0001473
      F2001585F5000F7FEF00407DD3004986DC0090A5D200AEC3F000D7EAEF00E6F9
      FE00FBFFF800FBFFF800FFFFF900FFFFF900FFFBFF00FFFBFF00FAFCFF00FAFC
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CCD1FB00727FF4004052F0003B4EF000374DF000586E
      F300D6DAFC00E6E9FD00768EF500D1DBFC0000000000CBD5FC006C89F5000000
      0000F9F9FF00748AF5007689F500949FF7005665F2003A4CEF005262F200939D
      F700F1F2FE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFF900FFFF
      F900FFFFFC00FFFFFC00FFFEFF00FFFEFF00FFFEFF00FFFEFF00FFFCFD00FFFC
      FD00FCFBF700FAF9F500FAFEF500F6FBF100D8DFD200B5BCAF00618850004970
      38002D541C001F460E00274F150038602600477033004E773A0060894C005B84
      47005C8548005E874A0051793F00396127002C541A002E561C004E653F00738A
      6400AABBA000D8E5CE00F5FDF400F6FDF500FBFBFF00F6F6FA00FFFCFF00FFFC
      FF00FFFEFF00FFFEFF00FFFFF700FFFFF700FFFFF100FFFFF100000000000000
      0000FFFFFB00FFFFFB00FFFFFE00FFFFFE00FAFEFF00F8FCFF00ECF8FF00EBF7
      FF00DDEEFF00CFE0F500B5CCE600BED5EF00BAD3F3008FA8C80087A2C400BFDA
      FC00E0F4FF00CBDFFE00A6C7F5009EBFED0085B5FD007BABF3005B98F500518E
      EB00448CF2004189EF003281F0002E7DEC002076F0001C72EC000F6EED000D6C
      EB000373E3000C7CEC005390E6006AA7FD00B3C8F500C8DDFF00E3F6FB00E9FC
      FF00FBFFF800FBFFF800FFFFF900FFFFF900FFFBFF00FFFBFF00FAFCFF00FAFC
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C6FA00808CF5004152F0003D4F
      F0004758F0005C6DF3004258F1007382F40099A2F7007282F500455CF1008491
      F5007482F400485AF1003649EF003649EF005869F20098A2F700DADDFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFA00FFFF
      FA00FFFFFC00FFFFFC00FFFEFE00FFFEFE00FFFEFF00FFFEFF00FDFBFD00FFFE
      FF00FCFBFA00F8F6F500FAFBF700FEFEFB00FAFDF700F1F3EE00D4EBC900BBD4
      B00092AF87006D8A620055724700426035003251220027461800294818002645
      16002B4A1B00385728004361350053714500708E63008CAA7F00BCCAB700D6E4
      D100EFF9EC00F9FEF600FBFDFB00F6FAF800FAF8FF00FEFBFF00FFFDFF00FFFD
      FF00FFFEFC00FFFEFC00FFFFF400FFFFF400FFFFEE00FFFFEE00000000000000
      0000FEFFFD00FFFFFE00FFFFFE00FFFFFE00FDFFFF00FDFFFF00F8FCFD00F7FB
      FC00F1F9FF00F2FAFF00D5E2F000C6D3E100C1D2E500ABBCCF0091A6BC0099AE
      C400C4DCFA00CFE7FF00CCECFF00C4E4FF0093C3FF0078A8E8005499F600579C
      F900247FF800237EF7000A77FF000673FF00006AFF000068FF000066FF000066
      FF002B89CA003E9CDD00A8B6E600C5D3FF00FFECFE00FFF5FF00FCFFFA00FBFF
      F900EDFFF900EDFFF900FFFFFE00FFFFFE00FFFBFF00FFFBFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFF00D7DBFC00ACB4
      F8007B88F5004658F0003F50F0003649EF003044EF003749EF003F50F0003346
      EF003C4FF0006271F300919BF600C5CAFA00E6E8FD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFB00FFFF
      FB00FFFFFC00FFFFFC00FFFFFE00FFFFFE00FFFEFF00FFFEFF00F8F5F700FFFE
      FF00FFFEFF00FDFBFD00FEFBFD00FEFCFD00FDFAFD00FAF7FB00F1FFEC00F3FF
      EE00ECF9E600DBECD500C5D9BC00B2C6A900A9B99D00A2B096009CAF8F009BB0
      8E00A1B49500ABBE9F00B5C9AA00C3D7B800DDEAD400ECFAE300F4F9F800F6FB
      FA00F1F4F700F3F6F900FDFCFF00FCFBFF00FDF9FF00FAF6FE00FFFEFF00FFFE
      FF00FFFFFB00FFFFFB00FFFFF200FFFFF200FFFFED00FFFFED00000000000000
      0000FDFEFC00FEFFFD00FFFFFE00FFFFFE00FDFFFF00FDFFFF00FBFFFF00FAFE
      FF00F0F8FF00F6FEFF00E9F6FF00CEDBE900C9DAED00C5D6E900A6BBD10090A5
      BB007890AE0093ABC900A8C8F300B0D0FB0088B8F80072A2E2005499F6005EA3
      FF003994FF00348FFF001380FF000774FF000069FF000069FF00006FFF000077
      FF0059B7F80068C6FF00C9D7FF00DAE8FF00FFF5FF00FFF6FF00FBFFF900FBFF
      F900EDFFF900EDFFF900FFFFFE00FFFFFE00FFFBFF00FFFBFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F9FE00EEEFFE00E3E5FD00C5CBFA00C5CBFA00C5CBFA00C3C9FA00CED2
      FB00ECEEFE00F3F4FE00FDFDFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFEFD00FFFE
      FD00FFFFFD00FFFFFD00FFFFFC00FFFFFC00FFFEFC00FFFEFC00F9F9F800FFFE
      FE00FEFEFE00FCFBFC00FBFAFD00FEFCFE00FEFBFE00FCFAFD00F7FBF700F8FA
      F900FAFCF900FAFEF800F7FDF200F7FDF200F8FFF000F3F8EA00F7FFEE00F6FF
      ED00F9FFF000F9FFF000F8FFF200F8FFF100F6FAF100F4F8EF00F9F9FF00F9F9
      FD00F7F5FA00F7F5FC00F9F7FC00FAF8FD00FEFCFF00FCFAFE00FFFEFE00FFFE
      FE00FFFFFB00FFFFFB00FFFFF800FFFFF800FFFFF600FFFFF600000000000000
      0000F7FEFF00F7FEFF00FBFFFF00FBFFFF00FFFFFC00FFFFFC00FFFFFB00FFFF
      FB00FFFFFC00FEFDF900F4F8F900F8FCFD00F0F9FF00DCE5EE00C7D3DF00C6D2
      DE00A1BDDB0098B4D20082ABD80087B0DD0071AFF6006DABF2004E9DFE004A99
      FA003B8BF0003A8AEF004E8ADC004C88DA007895C20086A3D000B7BBCD00C5C9
      DB00D1E6FB00D8EDFF00F5F8FC00F9FCFF00FFFFF500FFFEF300FFFFF500FFFF
      F600FAFFFF00FAFFFF00FDFCFF00FDFCFF00FFFFFE00FFFFFE00FFFFF400FFFF
      F400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFEFE00FFFE
      FE00FFFFFE00FFFFFE00FFFFFC00FFFFFC00FFFFFC00FFFFFC00FEFEFD00FEFF
      FD00FBFBFB00FBFBFB00FDFCFE00FEFDFF00FFFDFF00FFFDFF00FDFBFF00FBF9
      FF00F7F6F800F5F4F600F6F7F300F8F8F500FAFEF300F9FCF200F9FDF100F7FB
      EF00F7FAF000FBFEF400FFFFFB00FEFFFA00FDFDFA00FAFBF700F8F6FF00FCFA
      FF00FEFAFF00FEFAFF00F9F7FD00F6F4FA00FBFAFC00FFFEFF00FFFFFE00FFFF
      FE00FFFFFC00FFFFFC00FFFFFC00FFFFFC00FFFFFB00FFFFFB00000000000000
      0000F8FFFF00F8FFFF00FBFFFF00FBFFFF00FFFFFC00FFFFFC00FFFFFB00FFFF
      FB00FBFAF600FFFEFA00FBFFFF00FBFFFF00F4FDFF00F3FCFF00EAF6FF00E2EE
      FA00C7E3FF00B3CFED008FB8E50086AFDC0068A6ED00609EE500408FF0003B8A
      EB003F8FF4004494F90064A0F20070ACFE00A7C4F100B9D6FF00E8ECFE00F2F6
      FF00DEF3FF00E1F6FF00FBFEFF00FBFEFF00FFFFF700FFFFF700FFFFF700FFFF
      F700FAFFFF00FAFFFF00FDFCFF00FDFCFF00FFFFFE00FFFFFE00FFFFF400FFFF
      F400FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFDFE00FFFD
      FE00FFFEFE00FFFEFE00FFFFFB00FFFFFB00FFFFF900FFFFF900FBFFF900FAFE
      F800FAFEFC00FBFEFD00FDFEFF00FDFEFF00F8F7FD00F4F4F900FEF2FF00FEF6
      FF00FDF8FD00FDF7FD00FDFAFC00FDF7FD00FEFDFD00FEFDFD00FEFDFC00FDFD
      FC00FDFBFB00FDF9F900FFF9FE00FFFCFE00FFFBFE00FEFBFE00FDFBFF00FBF8
      FF00F9F8FC00FBFAFE00FEFDFE00FDFDFD00FAFDF800F7FAF500FDFFFC00FDFF
      FC00FDFFFE00FDFFFE00FDFBFE00FDFBFE00FDF9FE00FDF9FE00000000000000
      0000F4FEFF00F4FEFF00FAFFFF00FAFFFF00FFFFFB00FFFFFB00FFFFF800FFFF
      F800FCF8ED00FFFFF700FFFFFB00FCFCF600F2F6F700FBFFFF00F6FFFF00ECF5
      F900E5F4FD00E7F6FF00F7FCFA00F7FCFA00FCF7E800F4EFE000F6EFDE00FDF6
      E500F4F2EA00F5F3EB00F3F2F400F7F6F800FDFAFC00FFFCFE00FFFCFC00FFFB
      FB00FFF8F400FFF8F400FAFFED00FBFFEE00EAFFED00EAFFED00FFFFF800FFFF
      F700FFF7FF00FFF7FF00FAFAFF00FAFAFF00F4FFFC00F4FFFC00FFFFEB00FFFF
      EB00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFDFF00FFFD
      FF00FFFEFE00FFFEFE00FFFFFB00FFFFFB00FFFFF900FFFFF900FCFFFA00FBFE
      F900F7FCFA00F8FDFB00FAFCFD00FAFCFD00FBFBFE00FCFCFE00FEF5FF00FFF3
      FF00FBF1FF00FEF4FF00FFFBFF00FFFAFF00FFFCFF00FAF4F900FAF5F600FFFB
      FC00FFFDFE00FEFDFE00FFF9FF00FFFAFF00FFFAFF00FFF9FF00FFFCFF00FEFB
      FF00FDFCFE00FDFCFE00FFFFFE00FFFFFE00FBFEF900F9FDF700FDFFFC00FDFF
      FC00FDFFFF00FDFFFF00FDFBFF00FDFBFF00FDF9FF00FDF9FF00000000000000
      0000F4FEFF00F4FEFF00FAFFFF00FAFFFF00FFFFFB00FFFFFB00FFFFF800FFFF
      F800FFFFF700FFFBF000FCFCF600FFFFFB00FAFEFF00F5F9FA00F5FEFF00F6FF
      FF00EFFEFF00ECFBFF00F3F8F600F7FCFA00FFFFF400FFFFF100FFFBEA00FFF9
      E800FFFDF500FDFBF300F7F6F800FAF9FB00FFFDFF00FFFEFF00FFFEFE00FFFD
      FD00FFFBF700FFFBF700F9FFEC00F8FFEB00EAFFED00EAFFED00FFFFF800FFFF
      F500FFF7FF00FFF7FF00FAFAFF00FAFAFF00F4FFFC00F4FFFC00FFFFEB00FFFF
      EB00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000C80000002E0000000100010000000000080500000000000000000000
      000000000000000000000000FFFFFF00FF000000001FC0FFFFFFFFFFF0000000
      000000000000000000000000FE000000000FC000000000003000000000000000
      0000000000000000FC0000000007C00000000000300000000000000000000000
      00000000FE000000000FC0000000000030000000000000000000000000000000
      FF000090000FC0000000000030000000000000000000000000000000FF800801
      003FC0000000000030000000000000000000000000000000FFF0400001FFC000
      0000000030000000000000000000000000000000FFE0000020FFC00000000000
      30000000000000000000000000000000FF820000007FC0000000000030000000
      000000000000000000000000FF8030000C3FC000000000003000000000000000
      0000000000000000FF000000001FC00000000000300000000000000000000000
      00000000FE018000001FC0000000000030000000000000000000000000000000
      FE000000000FC0000000000030000000000000000000000000000000FC242000
      000FC0000000000030000000000000000000000000000000FC0000000007C000
      0000000030000000000000000000000000000000F80080000007C00000000000
      30000000000000000000000000000000F08000000003C0000000000030000000
      000000000000000000000000F09000000003C000000000003000000000000000
      0000000000000000F00220000003C00000000000300000000000000000000000
      00000000F00000000003C0000000000030000000000000000000000000000000
      F01000000003C0000000000030000000000000000000000000000000F0000000
      0003C0000000000030000000000000000000000000000000F00240000003C000
      0000000030000000000000000000000000000000F00000000003C00000000000
      30000000000000000000000000000000F01000000003C0000000000030000000
      000000000000000000000000F00220000003C000000000003000000000000000
      0000000000000000F00000000003C00000000000300000000000000000000000
      00000000F08800000003C0000000000030000000000000000000000000000000
      F00088000007C0000000000030000000000000000000000000000000FC000000
      0007C0000000000030000000000000000000000000000000FC260000000FC000
      0000000030000000000000000000000000000000FE000000010FC00000000000
      30000000000000000000000000000000FE000000001FC0000000000030000000
      000000000000000000000000FF088000001FC000000000003000000000000000
      0000000000000000FF800000043FC00000000000300000000000000000000000
      00000000FF821000007FC0000000000030000000000000000000000000000000
      FFC0020020FFC0000000000030000000000000000000000000000000FFE04000
      01FFC0000000000030000000000000000000000000000000FFF0080103FFC000
      0000000030000000000000000000000000000000FFFC009007FFC00000000000
      30000000000000000000000000000000FFFF00001FFFC0000000000030000000
      000000000000000000000000FFFF80007FFFC000000000003000000000000000
      0000000000000000FFFFF001FFFFC00000000000300000000000000000000000
      00000000FFFFFFFFFFFFC0000000000030000000000000000000000000000000
      FFFFFFFFFFFFC0000000000030000000000000000000000000000000FFFFFFFF
      FFFFC00000000000300000000000000000000000000000000000000000000000
      0000000000000000000000000000}
  end
  object IBQActEmbriones: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update tab_embriones set usado = '#39'N'#39' where id_embrion = :id')
    Left = 212
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQDatosEmbrion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ORIGEN_ANIMAL as embrion,V1, V2, V3 from aux_animales whe' +
        're id_animal = :id')
    Left = 428
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
