inherited FEveFlushing: TFEveFlushing
  Left = 5
  Top = 29
  Caption = 'FEveFlushing'
  Constraints.MinWidth = 986
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
  inherited PError: TPageControl
    Top = 645
    Height = 79
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Height = 50
      end
    end
  end
  inherited PDatos: TPanel
    Height = 558
    inherited PCBasico: TPageControl
      Height = 476
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Height = 434
        end
        inherited MSimple: TMangazo
          Height = 434
          inherited PSeleccion: TPanel
            Height = 128
            inherited GBDisponibles: TGroupBox
              Height = 249
              inherited IFondoDis: TImage
                Height = 230
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 230
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 72
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE'
                    Title.Caption = 'Nombre'
                    Width = 110
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Width = 72
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_HBA'
                    Title.Caption = 'HBA'
                    Width = 73
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Height = 249
              inherited IFondoSel: TImage
                Height = 230
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Height = 230
                TitleFont.Height = -13
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Title.Caption = 'RP'
                    Width = 68
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE'
                    Title.Caption = 'Nombre'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_SENASA'
                    Title.Caption = 'SENASA'
                    Width = 67
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ID_HBA'
                    Title.Caption = 'HBA'
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Height = 249
              inherited IFondo: TImage
                Height = 249
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
            inherited Label1: TLabel
              Width = 142
              Height = 16
            end
          end
          inherited IBQSeleccionados: TIBQuery
            SQL.Strings = (
              
                'select  ID_AUX,ID_RP, ID_SENASA,id_animal, id_pc, id_otro, sexo,' +
                ' ID_HBA, NOMBRE from AUX_ANIMALES'
              'where id_animal > 0 and vuno1 <> '#39'S'#39
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
              '  ID_OTRO = :ID_OTRO,'
              '  SEXO = :SEXO,'
              '  ID_HBA = :ID_HBA'
              'where'
              '  ID_ANIMAL = :OLD_ID_ANIMAL')
            InsertSQL.Strings = (
              'insert into AUX_ANIMALES'
              
                '  (ID_AUX, ID_RP, ID_SENASA, ID_ANIMAL, ID_PC, ID_OTRO, SEXO, ID' +
                '_HBA)'
              'values'
              
                '  (:ID_AUX, :ID_RP, :ID_SENASA, :ID_ANIMAL, :ID_PC, :ID_OTRO, :S' +
                'EXO, :ID_HBA)')
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
          inherited DSCalidadSeminal: TDataSource
            Top = 320
          end
          inherited IBQCondCorp: TIBQuery
            Left = 520
            Top = 392
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Height = 277
          object GroupBox1: TGroupBox
            Left = 2
            Top = 17
            Width = 206
            Height = 258
            Align = alLeft
            Caption = ' Eventos  '
            TabOrder = 0
            object LSincronizacion: TLabel
              Left = 34
              Top = 43
              Width = 135
              Height = 15
              Cursor = crHandPoint
              Caption = 'Sincronizaci'#243'n de Celo...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LSincronizacionClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LTratamiento: TLabel
              Left = 34
              Top = 95
              Width = 151
              Height = 15
              Cursor = crHandPoint
              Caption = 'Aplicaci'#243'n de Tratamiento...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LTratamientoClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LDeteccion: TLabel
              Left = 34
              Top = 142
              Width = 110
              Height = 15
              Cursor = crHandPoint
              Caption = 'Detecci'#243'n de Celo...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LDeteccionClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LInseminacion: TLabel
              Left = 34
              Top = 194
              Width = 129
              Height = 15
              Cursor = crHandPoint
              Caption = 'Inseminaci'#243'n Artificial...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LInseminacionClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
          end
          object GroupBox2: TGroupBox
            Left = 208
            Top = 17
            Width = 792
            Height = 258
            Align = alClient
            Caption = ' Datos del Animal '
            TabOrder = 1
            object Label5: TLabel
              Left = 52
              Top = 34
              Width = 112
              Height = 15
              Caption = 'Fecha de Colecci'#243'n:'
            end
            object Label6: TLabel
              Left = 84
              Top = 88
              Width = 78
              Height = 15
              Cursor = crHandPoint
              Caption = 'Responsable:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LResponsableClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LCantEmbrionesValue: TLabel
              Left = 388
              Top = 145
              Width = 9
              Height = 16
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object LCentros: TLabel
              Left = 39
              Top = 146
              Width = 126
              Height = 15
              Cursor = crHandPoint
              Caption = 'Centro de Transplante:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LCentrosClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object Label8: TLabel
              Left = 388
              Top = 215
              Width = 41
              Height = 15
              Caption = 'Precio: '
            end
            object Label1: TLabel
              Left = 405
              Top = 34
              Width = 166
              Height = 15
              Caption = 'Cant. Embriones Sin Fertilizar:'
            end
            object Label2: TLabel
              Left = 405
              Top = 88
              Width = 175
              Height = 15
              Caption = 'Cant. Embriones Degenerados:'
            end
            object ICargarEmbriones: TImage
              Left = 4
              Top = 173
              Width = 97
              Height = 73
              Cursor = crHandPoint
              Picture.Data = {
                0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000006500
                0000440806000000988CFB5C0000000467414D410000AFC837058AE900000019
                74455874536F6674776172650041646F626520496D616765526561647971C965
                3C000017644944415478DAED9C097C4E57DEC77F7779F66CB24942242A49ABA5
                04D3A90E428D5D5B6D2D35A62D6ABA586BCA28DAB1155DA6C632B4A3A668475B
                C5502D5A6D5FFB683B55513A411821249144449667BDCBFB3FE73ECF93C4EBFD
                B42A4C84C371EE3DCF5DCFF7FED77B2E41D775DC2C75AB0837A1D4BD72134A1D
                2C37A1D4C172134A1D2C37A1D4C172134A1D2C37A1D4C172134A1D2CD7048A20
                0857E5B8A50F664450D3FA52BF45ACDFB1FD6ADDCFD51EB3EB0A0A41E84C0DAB
                19FEF6C74A0ED54CAA3BA86E205039B5711D373C1402914CCD38AA43A9465CE1
                A530402BA9AE2040A53FF720372C143F8C693060048B181B07F90ED258920EDF
                9E4F617D7434CC3D07F0DF5C0BA642399C09FBF30BA0575440F966173C5BD601
                2A1BC99A87A7BA80EAFC9F03E78683E2B7130CC6B35507A02A1390700742976E
                0A7657CE180EEB236321DD6A9815EFC6E5508EEC877DE2C2E036E5C332607964
                3484067150BEDE03EFB64F6B9C8EEA7802B3E272EEE786824240D8E8AEA79ACC
                F77384C0D2B73FCC54B5730570BD3616218B3607B7AF9C3A10B087C03A702C74
                5719BC9FAC80EEAC80EDF70B2146128403BBE05A3C9540EEACDA67F63828DF1F
                007C354EBD81EAB09F2A35370C140232949AE5C10E13FD6DD50AF6290B825DE5
                4F77E2522125A64039B80B7A49812145FE22364A81600B8576269BC3612A8BDD
                9E63F272888D53085C059CD387C3D47500E4D61DE15AF432941F3203BBE7507D
                90C064FED8B5DE105008C874182A8B4B876DEC240812E059BD08B6D1732044C7
                C1BBE96DF876AC31208880F589D9905B76E203ED9A371452B374525353F9F194
                433BE17E7B0AA45BD279BFF2FD2E03506525B4A20284BE59253915939E809A7D
                3C782954BBFC18987A0F8580FC1901FB41831DB6F2130E8615E7BCB1508FEDE7
                80CCBD86414A6B03F5F83E78BF588E90D776078FE15E3A1A220190EFECC3075D
                2FCF8367FD6C38A67F4692E33FD6AC01D08A49B23410F44590525B7369AA9C38
                08088F83967B96A055FC2430F51A4A0D95454004BB8E9079AB21926468A49A5C
                738741F756F001B48D5E14DCAF72F2AF60BE8F0C7CB35F3024E46915434A8AA7
                01F7821B0B9D550FD49C7C0821114CFCE0FEF06F102C76484DD34932323910E6
                A1C92D3BC03288E0E71C43E58BCFFE2430F5168A3F10DCC696A5E414D8C63D0F
                F5E87E5253A4FF695D3F9F0FD3DDBDA09ED80FFD423EEC93D7F2FDB4826CB896
                3C4EE31C4B5ED61B34420AF52A467B111468ACF506AB565C464D24D91EB2274B
                9E23E93846EEF43098FB0CE7C7F6EDD802E7C25702EE730ED5F44B19FF7A09C5
                EFF69EA01AC1E28E90D797055556F9C88E5C5D3966AC81401E142BCE571F2672
                E01E957AF23BFEB4CBE90F406E71E7654131FA3C5C1A947F9F80E7B34C882151
                B08E98CBCFE5FEDB5CF8BEDE4D5214BC5E960578F04681C2DCDE7E6C596AD210
                21F357F37EA6565C0BC7504C426AECCF5536C339EF21E865A48A44BA56AAB609
                5F42CB3F4E2A2BF66741E1ADEEE186DFB7371BDE9DC7A093AD915B748485DC6B
                EFC6B5F07CB236707AE6916DA8D7506AA8AD147261AD3A87C054987A7C3FC418
                B22767B361CA1840BFB7A141FB800331F77C963B5EDECD33617EF85568858590
                6F6F7645508C3E37D4D325F06CC88265C8CBDC7EB1C2EC8BDF5D66EAAB697535
                561FA130209D99DA0A7DF303DEC7BC2CED3F1489B37882620D2D9FECC6E2C779
                2A85A932EBE38B2126B5E1DB2AFF5C0A65FFFB906EEF47E006D60A1463D90DE5
                742AE4364FF1F3B8DE9C0BEFD6CF02973D83A04CAF9750AA4B896DF42498EFED
                C5FBDDEFCE815E9A0FDB986A1ED6B47B0888C6C15806BE424F30EDEA298767ED
                53D0CF1DA18352B43F943C2ABBA5D6A070A9296C08E5A8851C8E4DD02A8540E4
                5F435AEA1B14C396D0AAB9670FD87E3719DAE96314598FA1712C877D02494A42
                2AC5182F917A3A0AEB23AF70CFCBFBD1040871A914E9E541088FE755CBDE08B1
                C51898DA77AB5528D09CD4BAA09527432DBA95A47845E03686057264F5068A3F
                EBCB3C2E52510D2135264F8A549640F684A932812A0301A59CDB18FBB87F4088
                88E7FB7BD73C452AED5BC8773F09F92E43BD28DFBC0131EE4E3A5693AB0285BC
                005AAE806B950FDE6F2476CA4C82925EDFA0B0A89D45EF087BD788DA3D6B1642
                39B40BF6E797F3C85BD9BF890CEE6C02A5911D5902B1491B4365ADB88FC6BC0C
                E607DF22496ACB8FA99EF89EBCAF985AB5299782E23BE086F36D73E056980ACB
                A94F50B8EA32DDD58120BCC4FB593E8B494BC096A88777C0BDFA790E8541936E
                EB049D2444AF3CE397A834C8F74C24FB9345BADF0B5387DE571D0AF472944DB6
                531757C12CCD3FBF3E41394F8B11526A0A1CD3E6F3C4A27BE9146E3338149214
                CFFB9348125260EE319EAB32CFAADF406C1007CBE0F7014B28942F9F8576E67F
                C88D76406C3E1CD21D7DAF0914E73219BE43CCA13082C97A01E5C2439D99F3BF
                9F9FD0AEFB63135A3651EBAF7C99A4C1F6CC3B101BA6F2FDBCEB9E8498D83668
                47B4ACBF433DB81872B7E5E42934A6F13A41714DC45587E2D9A2C3FD19CF38E4
                1094A6F5054A67F85DE190F9CB78C2D1FD0EB9C105D9B04D5ACEA5C6F3DE24A8
                B9DFC13A9802B8B40C1E307A56F425573803A65EF3F87194ADC378442FFF7A85
                01E96C0E1D4BBAEA50946C372A1747F1731294AB3E66D70ACA746AA6B1A83D64
                DE32DEE7DBF6217F1762EEED4F066E5B06DF2E8A3B421C5C85E925148BA817B8
                04090DE2B94D813B971C023BE49EEB69BC441AB4E26B2229DAB97294CF8A0BDC
                4E7AF83FB6FFE88BB0EB074AD3149E7C64C5B37621FD5301CB9029C63A8B4D72
                F751FC328EA7F17D9FCF2055E780A9DB0C5AB90075EF8B3448A5BC4F90550877
                BC4C517E8B6B6253A09FC785F18D03B7D385A06CAF375058A6D7D4B615C51714
                35FF6B0B7FE52B3669C6A5412BCEA6087F384C1923F83EBEADD3799C12B027EA
                B7AF70AF8BA92EF6EE436A12063E4DE526942B876279F061086C7A1083A254C0
                D4A5BF7F7D3541792208851B79E602779C6040F9E70B1042E321B61CC5138572
                F3849B506A030A9BAFE598359FF771F5456ACAF2D058639DD4977A6C074C770F
                A4712D87FAFD7BE48D6990DB0CE6D0B4237F8790D02668E4F5F307218447DF84
                72A550AA1B7A16383228E65ED50DFD323E49C2D4AA37D4231F43779EE141A4DC
                7A30A9AEC3D0F3BE20107164EC1DD0F5E6907EF9BB5A4F485E0A8AEEBC80B229
                09F50E0A7BA1C5227A385E9845031D0ACF3A92146F39CCFDC77038DE4FE743AF
                C887FD0F9F531C1362B8C42BFBC2DCF74F109B76E1C75136F4E01E9878E73310
                6F1F03F5C421B22DE1571D4A7D7589AB8247870E29A5198D5D051F7816300A61
                0EEEF2EA6A39EC930C28ACB817B485A90799A2DBEE37A06C1D0EBDF86B438539
                9AD3789D249738ECAA43F16C57E1DEC0CE835282D2A05E40F1A759F8894CF7FC
                0AF609B3797FE5B401FC4D239BA9A2BB2BE0F960124FAB987A8C87FAEF8FA1EC
                7C9D4F3735757A8E078DCA9E3F4260B14B541A49CB348A67AE6E4272BF300387
                0A0F229B3CC3DC0BA7505C59C2AF3BDA1189C4F026488D4E458BD896484F48AF
                D56F3DAE2514FEC6D1DCA5276C639EE7FDDECD6FF368BEBA5DF1B200920C3C9B
                1C21356D03F5F046D2E979DCD89BEE7F0B62D4ADE41EBF4C63170DD3BD8F5C15
                283B3C8F63C7F1ED700B2EB44D6A87D4C834C4DBE311613226FD97FA4A91EFCC
                4776C951EC3BF92DACBA0D19CD3A232339A356E05CF3D43D33DC2C75CF8AF3CF
                E479B1E943D3D7F075CFBA97A01CDC0491A27ADB842F789F5E7494246830C4C4
                3630F77B2B784C65CF3CC8ED07D72A9422C724ACFD612D0A5CF9E89AF66B348D
                688A939E93C8F7E4A3D85B8C72A58C9F3B540E43B4391AF1967824599270A2F4
                04BE3CFA05E2ADF178B8457FC43862AE08CE7FE7255724D9101BD910B22B8197
                5C08258FAA28DBB0310E82326E7D956D99DF0E903458067F40DE591A77103C2B
                7A93E42CA9B534CB49D308ACDCB712897189E89494812CE70FC8AAC8829B6FC7
                1F8FEA77146CACA215CD1DB7A1B9FD0EECCCD981DCB3B978BCEDE3488A48FED9
                60AEF5EB6066EC5BB320D2366214CC3D06F0D7C1CE5787119886B03DB782BFEC
                7233DB42AD9CDE076AF676A8FFD9CE6D0DCB87091450A292D4591845FB5DE6D0
                F69E2B8652647B1A6F7CB504698DD3D024A609F695ED43898FEC071B1BF64095
                95E27C69295B0C7421223C02E161E13480FC0611698A449BB0B6C82D3A8523B9
                4730B2FDA89F2D31D71ACA50F8A7A9B220927FFC03F6B1CF58524F29C14052CD
                D90FF78A91DC8E30A9B18EDA00C1126AA8B2F70773A32F344883A9EBD45A9194
                25C72221D965344F688E6DC5DBA0729528F0F3B072F2D4498C8FF93D2C160B24
                89BF1AC6EC532F21A9519231DD96FEB079639224A24BE4BDC8CACB82EA5430F2
                EE51751F8A1F0C5361C981E89ECDE975CE19CE55929DCD8A2409F1ED594D71CB
                02AECAD8AC48DB98F5C1FDDDCBEEE793F2C45BBA915736E08A6DCAB60BEDB0E5
                F866FCA6ED107C59F225CE7B4AAA5DB8D19C3A7D0A9313A7202A2A0A369B8DF7
                8DDCFB0C921A27195AADDAD0373047A26B6457BCB76F157A35EB8D2EB774B96C
                30FF0D2843E19716E9568A57CAF321B7EBC0A7A5B224A5989442F14B1EACECB3
                06D20D1E8223B369AAADD98CFA2350F67D00EB531F4139B4BB5626E3BDB8AF0C
                AD9BB582DBE4C1A10B07AB5F74D0969C3A938B69B74C437C7C3C424343F9CF43
                3E1D82C4C68986FA0A12D479D322AC25AC5E2B32FF938959DD67D57D287E30DC
                3DE6EE708F1EB03D3999F73317D9FBD9729EA4B4F41BC7FBB82A5B3E924FCA63
                EA444A4E87E5B76FD40A947DAE0E58FADD520CF9E56FB0B5602BBC6CFFE0A506
                1674E4E69DC68C66336A4019BC653012131283DB04FD00764F8219DDE3BA63D5
                D7EFE1C9364FA26DA3B69705E6BF058519130626A27A3E8CCF255E3006629314
                D8FF607C21A1FE7B27DCEF3DCF3FFE61EFF39914B129AC62A3E610E37FFE5C62
                F5D819AC149251A41621A161231C28C9F43FECFE27BE1A98D3F9A7313375660D
                288F6C1A84C6F18DFD4804FF7DEAC6FEF4B7558356C83B7B0631520C86B77BA2
                EE43F183190ABF1A6301A5B95B4F783E7E9B7F8F22868490FD2D87DCAA2394EF
                3643FE452FFAFD09BE9FFBFD49508FEC245B730B6CA3FF74D950D4D31E0811AD
                E1FCD318CCBCB73D529BA6A104E7796C52567E01E515E5FE81E6DAD3604465F6
                ADB36B4019F8F180AA9BA18D74DA986DCF7E0F0B0DA798250E0D1089EC9CA378
                B5EF6BD707143F180665285F31915D271BE398F937BEAA7CBD19EE5573F9B455
                EB137320B7E8C4FBD9F72A9E559360EE350E62E366D02B8A48A535FE7FA1A827
                73E9C036721E3E87E9EE1164B36E87F71F0BE1FB7A0B86B56B883EBFEC8BC314
                8F381517CEE49FC18BC92FD6F0B20285197866E8ED763B5F773A9D3877EE1C5C
                2E578DEDA6644D46425C23D8E89C2C7ED9F4CD26AC796CEDF503E56230523352
                65AF2D0BFE563EB293E16991BB6CEE3D0C823D149E8D0B8CEF1BEF376C0ECB99
                554EED01FBF8BF924A6BCA0309DF9E0F889E0431B9239FCDAF9F2F40E54BFDF9
                A775D004B257A4222926B977EB583CFAEBC770E05C2654FA31FF6C3EE6DC36A7
                869715280C527558AAAAC2E3F1F0B67A79EC8BC7101F1B0F4910D12AAA35567E
                BE02BB46EFBEBEA0FC1F303488D611A3C9BEECE71F90DA272CE45F01BBDF9D0D
                2DFF18D729526A3A6CA38C097C5A5E369CF387C231791D4F5EB2E2F96801D41F
                76C17CFF5808D650F8B67F08E5E06E0E45BEAB17AC8F1AF3023A2EEA807E190F
                E258D931681468141416E0B596AFD55053975BEE5FF7001262E2F93DA784A760
                ED8EB5D83B66EFF50345D3347AD23451D73593F3D1BECBE1F50C3676A0BF1636
                DB7E283DD5C37817730258AE4C222740B093CD29C987101547508E71FBC32686
                B38F7ED80C19DFCE358651601EAA35049687C740884C80EF9F9BF987AA1C7465
                051E5AFD5BA4A5A5A14C2B8357F5E26C7121E6B59A774550FAAEE98BB8988690
                4513C2C5301C3E7C181F8DD858F7A190C80BAAA6993455B510149BA22A56EAB3
                61EE9441E2F12313A1A93CE9C566BF58878FE691BFF7A3E5D008847598F194FB
                BE229BF3CE5C985A77E4DFC8B3740D932CB1512ACC7D86F26DD87F76C03E02B2
                0C3032052C50AD18D50742435269A59598DA3D1665E632981D1672873DA87456
                F27AA9B2F6BEB535D457EFD5BD2FB99DC3EE808302608B6C86A7DC83305F1816
                3EB4B0EE4221C91068F04D54AD8AA23A08868D5AAAAC55EC0C8CB8FF9B24FBFA
                77C74B17CEDF16D85F6C18C7DD61739FFEB00E1963803D4AEEF3E229085950ED
                7FA07869382CF70DE35E1B2B4AE62E78B7AE21F7DA900CCF87CBE1D9B4CEB02D
                54DEFBFD207C92F30912E213E052DDB878E402C17AE1B9222CEBF0560D43DFF3
                FD9E888E8A81E1100B1739D18055B2E24CDE19DCD7F43E3CD3E199BA09C52F1D
                569506DF479541F0F91447D5BA4A500C30ECB7B04F3EEC1472E09B6E92DB191E
                3C8E23046C82B874472B280776F31ABA64135767AC544C1C44AE737F98BB1BEE
                AA73DE5428FFDACD27F369050535AEC91B1973EAF88BCF3519BF713CD252D2A0
                0A0AD9156380AB0361FF1496146171BBBFD4506BDD5675470C83E2F79D3918BD
                0A8C4C7FB28E6661E103F37177F23D750F0A3B07A9293349864321103EC5E760
                10149F8F96A9CF8064F451CBE0304962B0A2777D961E76F4D06DB67367632F75
                6C96F6676F2F996A524F1D336E8AD407FB46FE52E54252EAC9D2DBD3B3CAEE68
                7BDC244BCE55A7DF9978A4E20822A3A3E83A351A633D38B03A0F0475149F2FC6
                1B77BD51034AD7BF77457444B4918E316E324851A43F25C5C548B3A761D180BF
                D4CD340B9D4350B8CAAA82C2A484AD53CB24C461400954D511902403A0E23017
                154447661F4A8CC83D1E1B565C10F253CFAD98CC5A59747CC5F9262985C5692D
                4F2324AC4C96A54A59962B6593A9F24278F1B83F6E9986F8C47898C966A05A54
                1E18EC73E74BF0D7F66FD680D265E5BD888A649329022996AAB1F778DC28C82D
                C0CC5E33D0AB79EF3A0B056A000A03E11F70038ACF2F291C842125EC3755F56F
                E30B4A90DF0671351772362F5CF4B8AC51674FDBF887DCFCB1669A52D009847A
                A141ACC71D16E1F2844756C892E49464D945309C1C86243B191893C9C4D69D5B
                8BB7BCB0E1C87A344A4CAC36B655E9DF92D212BC75CFD21A503AAFC8408388A8
                AACD022DD9ABDCDC53E897F6005EE8F562DD4EDDD3A08A6453EC6A50020CBBA2
                54A92F7B000EB32B6C3B0263A3EDD8B28D41626059D554CD42C73293E360D635
                4D265B20A17A2A511054AA8A288A8A248A5E51123DE435B90395A00400B968DD
                D93039FA95995B66E1DBA27F212E213EE8980484C6E576C1ED71FB0DBA315E36
                B315561660568342D782BCBC7CFC22A62DA6F5998EF8F0F8BA0D85153F186EEC
                F9D3CF9E7C432A021E988D03A9AA044163202C1C86C6EC1283A10660C8BAA64B
                3450A23F2B68A414058ADB0581AA4860181CC94760BC0488C1A12A7AA8CF0024
                F3D6A587A9AB5EFFFC757C55F01562626361B55A83792F2168C1AB8D31D75A55
                F6C7E576A3B8B0087735BC0B13BB4F445A6CDAF5F13A98159696A0C195191C8D
                C3E04F3F8F55987B1C90060384662100ACE552E1970C930143631F474874FD7E
                D5C5B282EC61E66F3874030A97189524C62732C921307C59E4AD1F104161CBB2
                ECD66DEA9E3777BC89D5073F4448A8035164FC65C9E41F7ABD4A4B098613C04E
                48D78D73C5E750515E89412D07E2E94E4F232122E1FA9838717161D13C5591AA
                89AB222E194C2D71A90880B0682CAE318098E85A657F2BF9AB6854F652B6FAF9
                F8D8F9A5A59AC4502B88824F6260248981F14A5C82381C4F4888E3047B68361C
                D8808FF66FC0F69C1D140C86202C220C36BB0D567204181A66C85D4E17CA4ACB
                28D8AC40E7E40C3C90DE0FFD5AF5E3C1251DF7FA84727161710C0DB8C4A44833
                A4C1A40560687C590E4A088130EC881F88AE0B3582370E45F04B0B98B4687E20
                AA6800F2F925C62730A911441F33FC2CF35B5E5ECE33BF2CD9B837672F32F332
                9155988593A527515C59CC3DDF989068244524A1796C73B44E688DF6C9ED79B4
                CF9298CC11600126C1B97ED4D7E514068AA9268D4983C67264E0F68341812121
                FCFFC9D32FF2490504551837BF0155060E47084A100D5CF0E6C90BD48B29B628
                2C2C4425FB8F747C3E6603793572746AF0FB79763F7E8900390BBC92270787C3
                8158B247D1D1D16CBD6E43B91E0A0DBA5E5D52BC5E2FAF0130AC56871280C1AA
                D96CE6B5B624E57F01AC2A247830BB2F2F0000000049454E44AE426082}
              OnClick = BBCargarEmbrionesClick
            end
            object LCargarEmbriones: TLabel
              Left = 11
              Top = 237
              Width = 102
              Height = 15
              Cursor = crHandPoint
              Caption = 'Cargar Embriones'
              Transparent = True
              OnClick = BBCargarEmbrionesClick
            end
            object DTPAFechaColeccion: TDateTimePickerAuto
              Left = 171
              Top = 31
              Width = 105
              Height = 21
              Date = 39673.424201747690000000
              Time = 39673.424201747690000000
              Color = 14679807
              TabOrder = 0
              OnChange = DTPAFechaColeccionChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBAResponsable: TDBLookupComboBoxAuto
              Left = 170
              Top = 85
              Width = 156
              Height = 23
              Color = 14679807
              KeyField = 'ID_EMPLEADO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSResponsable
              TabOrder = 1
              OnCloseUp = DBLCBACloseUp
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBACentrosTrans: TDBLookupComboBoxAuto
              Left = 170
              Top = 143
              Width = 156
              Height = 23
              Color = 14679807
              KeyField = 'ID_CENTRO_TRANSPLANTE'
              ListField = 'NOMBRE'
              ListSource = DSCentrosTransplante
              TabOrder = 2
              OnCloseUp = DBLCBACloseUp
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object EAPrecio: TEditAuto
              Left = 431
              Top = 212
              Width = 104
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 3
              OnChange = EAPrecioChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object BBCargarEmbriones: TBitBtn
              Left = 137
              Top = 400
              Width = 156
              Height = 34
              Caption = 'Cargar Embriones'
              Enabled = False
              TabOrder = 4
              Visible = False
              OnClick = BBCargarEmbrionesClick
            end
            object EACant: TEditAuto
              Left = 569
              Top = 215
              Width = 44
              Height = 23
              CharCase = ecUpperCase
              Color = 14679807
              TabOrder = 5
              Visible = False
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object EASinFertilizar: TEditAuto
              Left = 579
              Top = 30
              Width = 56
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 6
              Text = '0'
              OnChange = EASinFertilizarChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EADegenerados: TEditAuto
              Left = 598
              Top = 85
              Width = 56
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 7
              Text = '0'
              OnChange = EADegeneradosChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object CBSinEmbriones: TCheckBox
              Left = 207
              Top = 215
              Width = 104
              Height = 19
              Caption = 'Sin Embriones'
              TabOrder = 8
              OnClick = CBSinEmbrionesClick
              OnExit = GetEvent
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 277
          Height = 157
          inherited MAObservacion: TMemoAuto
            Height = 142
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Height = 434
          TitleFont.Height = -8
          MultiCaption = False
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'I3'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Datos de Embriones'
              Width = 57
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Caption = 'RP Animal'
              Width = 79
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NOMBRE'
              ReadOnly = True
              Title.Caption = 'Nombre'
              Width = 195
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_HBA'
              ReadOnly = True
              Title.Caption = 'HBA'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FECHA'
              ReadOnly = True
              Title.Caption = 'Fecha de Colecta'
              Width = 63
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VUNO1'
              Title.Alignment = taCenter
              Title.Caption = 'Sin Embriones'
              Width = 77
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'I2'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Embriones Transferibles'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'I5'
              Title.Caption = 'Sin Fertilizar'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'I6'
              Title.Caption = 'Degenerados'
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TOTAL'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Total Embriones'
              Width = 92
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'F1'
              Title.Caption = 'Precio'
              Width = 46
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'V4'
              Title.Caption = 'Centro de Transplante'
              Width = 147
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'V1'
              Title.Caption = 'Responsable'
              Width = 82
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observacion'
              Width = 140
              Visible = True
            end>
        end
        inherited PanelIzq: TPanel
          Height = 434
        end
        inherited PanelDer: TPanel
          Height = 434
        end
      end
    end
    inherited PBotones: TPanel
      Top = 476
      inherited SBSelTodos: TSpeedButton
        Left = 539
      end
      inherited BBCancelar: TBitBtn
        Left = 614
      end
      inherited BBAnterior: TBitBtn
        Left = 712
      end
      inherited BBSiguiente: TBitBtn
        Left = 810
      end
      inherited BBTerminar: TBitBtn
        Left = 908
      end
    end
  end
  inherited PTitulo: TPanel
    Caption = 'Flushing y Colecta de Embriones'
    inherited LTitulo: TLabel
      Caption = 'Flushing y Colecta de Embriones'
    end
    inherited LTipoVersionLicenciaDerecha: TJvLabel
      Left = 199
      Top = 36
    end
  end
  inherited Psocalo: TPanel
    Top = 623
  end
  inherited ALUniversal: TActionList
    Left = 35
    Top = 454
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 620
    Top = 455
  end
  inherited DSSimple: TDataSource
    Top = 0
  end
  inherited IBDSSimple: TIBDataSet
    OnCalcFields = IBDSSimpleCalcFields
    DeleteSQL.Strings = (
      'delete from aux_eventos'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into aux_eventos'
      
        '  (ID_ANIMAL, ID_RP, ID_SENASA, ID_HBA, NOMBRE, FECHA, I1, V1, I' +
        '2, I3, '
      '   I4, V4, F1, I5, I6,VUNO1, OBSERVACION, EW)'
      'values'
      
        '  (:ID_ANIMAL, :ID_RP, :ID_SENASA, :ID_HBA, :NOMBRE, :FECHA, :I1' +
        ', :V1, '
      '   :I2, :I3, :I4, :V4, :F1, :I5, :I6,:VUNO1, :OBSERVACION, :EW)')
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
      '          I3,'
      '          I4,'
      '          V4,'
      '          F1,'
      '          I5,'
      '          I6,'
      '          VUNO1,'
      '          observacion,'
      '          ew'
      'from aux_eventos'
      '')
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
      '  I3 = :I3,'
      '  I4 = :I4,'
      '  V4 = :V4,'
      '  F1 = :F1,'
      '  I5 = :I5,'
      '  I6 = :I6,'
      '  VUNO1 = :VUNO1,'
      '  OBSERVACION = :OBSERVACION,'
      '  EW = :EW'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 492
    Top = 6
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
      OnSetText = IBDSSimpleV1SetText
      Size = 100
    end
    object IBDSSimpleI2: TIntegerField
      FieldName = 'I2'
      Origin = 'AUX_EVENTOS.I2'
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
    object IBDSSimpleI3: TIntegerField
      FieldName = 'I3'
      Origin = 'AUX_EVENTOS.I3'
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
    object IBDSSimpleI4: TIntegerField
      FieldName = 'I4'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleV4: TIBStringField
      FieldName = 'V4'
      Origin = 'AUX_EVENTOS.V4'
      Size = 100
    end
    object IBDSSimpleF1: TFloatField
      FieldName = 'F1'
      Origin = 'AUX_EVENTOS.F1'
    end
    object IBDSSimpleI5: TIntegerField
      FieldName = 'I5'
      Origin = 'AUX_EVENTOS.I5'
      OnSetText = IBDSSimpleV1SetText
    end
    object IBDSSimpleI6: TIntegerField
      FieldName = 'I6'
      Origin = 'AUX_EVENTOS.I6'
      OnSetText = IBDSSimpleV1SetText
    end
    object IBDSSimpleTOTAL: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      Calculated = True
    end
    object IBDSSimpleVUNO1: TIBStringField
      FieldName = 'VUNO1'
      Origin = 'AUX_EVENTOS.VUNO1'
      Size = 1
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 584
    Top = 454
  end
  inherited IBQValidaciones: TIBQuery
    Left = 140
    Top = 454
  end
  inherited IBQEvento: TIBQuery
    Left = 36
    Top = 65534
  end
  inherited SDXLS: TSaveDialog
    Left = 254
    Top = 445
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'I3'
        Save = False
        Title = 'Datos de'
      end
      item
        DataField = 'ID_RP'
        Title = 'RP'
      end
      item
        DataField = 'ID_HBA'
        Title = 'HBA'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha de Colecci'#243'n'
      end
      item
        DataField = 'I2'
        Save = False
        Title = 'Cant. Embriones'
      end
      item
        DataField = 'F1'
        Title = 'Precio'
      end
      item
        DataField = 'V4'
        Title = 'Centro de Transplante'
      end
      item
        DataField = 'V1'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observaci'#243'n'
      end>
    Title.Text = 'Flushing'
    Left = 224
    Top = 441
  end
  inherited WinXP1: TWinXP
    Left = 64
    Top = 456
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 444
    Top = 455
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 404
    Top = 455
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 556
    Top = 455
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 316
    Top = 455
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 484
    Top = 455
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'SELECT RESULT, MENSAJE FROM RN_FLUSHING(:ESTA,:ANIMAL,:FECHA)')
    Left = 560
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTA'
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
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 640
    Top = 6
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'SELECT EVENTO FROM SP_FLUSHING (:FECHA,:ANIMAL,:OBSERVACION,:EST' +
        'ABLECIMIENTO,:RESPONSABLE,:LOG_USUARIO,:LOG_FECHA_MODIFICACION,:' +
        'ID_GRUPO,:DISPARADOR,:CANT_EMBRIONES,:PRECIO,:CENTRO_TRANSPLANTE' +
        ',:SIN_FERTILIZAR, :DEGENERADOS)')
    Left = 536
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
        Name = 'LOG_FECHA_MODIFICACION'
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
      end
      item
        DataType = ftUnknown
        Name = 'CANT_EMBRIONES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CENTRO_TRANSPLANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIN_FERTILIZAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEGENERADOS'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Top = 6
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 652
    Top = 463
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 104
    Top = 0
  end
  inherited IBSPActEventos: TIBStoredProc
    Left = 524
    Top = 455
  end
  inherited OpenDlg: TOpenDialog
    Left = 188
    Top = 448
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 364
    Top = 456
  end
  inherited ILVets: TImageList
    Left = 732
    Top = 188
  end
  object ILEmbriones: TImageList
    DrawingStyle = dsTransparent
    Height = 46
    Masked = False
    ShareImages = True
    Width = 50
    Left = 400
    Top = 16
    Bitmap = {
      494C010102000400040032002E00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000C80000002E0000000100200000000000C08F
      000000000000000000000000000000000000FCFDFF00FCFDFF00FBFEFF00FBFE
      FF00FDFDFF00FDFDFF00FFFEFF00FFFEFF00FFFEF900FFFFFB00FFFFFB00FFFF
      FB00F9FBFB00F3F5F500EBF5FC00EFF9FF00DBFFF100D7FBED00CCF5EE00C6EF
      E800E3DFEA00E0DCE700EDD8E700ECD7E600C6D8D900CADCDD00D1E5D900D6EA
      DE00EDEDDD00F1F1E100E6F9E400E8FBE600FFF1FF00FFF4FF00FFFDFB00FFFE
      FC00FFFFF200FFFFF200FFFFF700FFFFF700FFFBFF00FFFBFF00FFF8FF00FFF8
      FF00FFFBFF00FFFBFF00FDFFFC00FDFFFC000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFEFF00FDFEFF00FBFEFF00FBFE
      FF00FDFDFF00FDFDFF00FFFEFF00FFFEFF00FFFBF600FFFEF900FFFFFB00FFFF
      FB00FAFCFC00F2F4F400E1EBF200DCE6ED00B8DCCE00B3D7C900A4CDC6009BC4
      BD00B5B1BC00B0ACB700BCA7B600BBA6B500A4B6B700A7B9BA00ACC0B400AFC3
      B700C8C8B800D4D4C400D3E6D100DEF1DC00FCE5F400FFEBFA00FFF6F400FFF9
      F700FEFFED00FFFFEF00FFFFF700FFFFF700FFFBFF00FFFBFF00FFF8FF00FFF8
      FF00FFFBFF00FFFBFF00FDFFFC00FDFFFC000000000000000000FDFFFE00FDFF
      FE00FEFFFE00FEFFFE00FFFFFE00FFFFFE00FFFFFD00FFFFFD00FFFEFD00FFFF
      FE00FFFEFF00FFFEFE00FDFDFE00FEFEFF00FEFEFF00FEFDFF00FEFBFF00FFFB
      FF00FFFFFD00FFFFFD00FFFFFB00FEFFFB00FFFDFF00FFFEFF00FFFDFF00FFFD
      FF00FFFEFF00FFFEFF00FFFEFF00FFFEFF00FFFCFF00FEFBFF00FFFDFF00FFFD
      FF00FFFDFF00FFFDFF00FEFEFF00FEFEFF00FDFFFF00FDFFFF00FDFFFF00FDFF
      FF00FEFFFE00FEFFFE00FFFEFE00FFFEFE00FFFEFE00FFFEFE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFE00FFFEFE00FAFAFF00FAFA
      FF00F3F8FF00F3F8FF00FFFBFF00FFFBFF00FFFFF400FFFCEF00FAF1E700FDF4
      EA00D9F3FF00D0EAFF008DC7FF0075AFEA0042A5E9003EA1E5002BA0DD00279C
      D9003495D7003495D7002F95DE003096DF00089BE1000A9DE300229EDA0024A0
      DC0061A4CB006BAED50089C2D10093CCDB00D2CFE500DDDAF000F5EBF100FFF5
      FB00FFFFF300FFFFF400FFFFF400FFFFF400FBFFFE00FBFFFE00F8FCFF00F8FC
      FF00FFF9FF00FFF9FF00FFF7FF00FFF7FF000000000000000000F8FFFE00F8FF
      FE00FBFFFC00FBFFFC00FFFFF900FFFFF900FFFFF800FFFFF800FEFCF400FFFE
      F800FFFDFE00FFFAFB00F8F5FE00FDFAFF00FCF9FF00FBF8FF00FBE9FF00FFEC
      FF00FFFFF400FFFFF300FFFFE800FEFFE700FFF6FF00FFF9FF00FFF4FF00FFF3
      FF00FFFDFF00FFFEFF00FFFDFF00FFFCFF00FFEEFF00FCEBFF00FFF5FF00FFF4
      FF00FFF5FF00FFF7FF00F8FBFD00F7FAFC00F5FEFE00F6FFFF00F6FFFF00F6FF
      FF00FBFFFE00FBFFFE00FFFEFE00FFFEFE00FFFDFE00FFFDFE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFE00FFFEFE00FAFAFF00FAFA
      FF00F3F8FF00F3F8FF00FFFAFF00FFFAFF00FFFFF300FFFEF100FFF6EC00F0E7
      DD00B3CDE5009FB9D1006AA4DF00629CD7003EA1E5003C9FE3002CA1DE002BA0
      DD003B9CDE003C9DDF00399FE8003AA0E900089BE1000A9DE300239FDB0024A0
      DC005DA0C7005EA1C8006FA8B70070A9B800B7B4CA00C4C1D700E4DAE000F6EC
      F200FFFCF000FFFFF300FFFFF100FFFFF000FBFFFE00FBFFFE00F8FCFF00F8FC
      FF00FFF9FF00FFF9FF00FFF7FF00FFF7FF000000000000000000F8FFFD00F8FF
      FD00FBFFFC00FBFFFC00FFFFFA00FFFFFA00FFFEFA00FFFEFA00FEFCF700FEFC
      F700FDFAFB00FFFDFE00FCFAFE00FCFAFE00F9F9FC00F8F8FB00FCF3FF00FAF0
      FF00F8FEEC00F8FFEC00FBFFE500FCFFE600FCFAFA00FAFBF800FCF5FB00FCF6
      FB00FCFDF500FAFEF300F9FDF200F9FCF300FBF3FC00FCF3FD00FFF5FD00FFF9
      FC00FDFAFC00FFFAFD00F4F7FA00F2F5F800F3FCFC00F2FAFA00F7FFFF00F7FF
      FF00FBFFFE00FBFFFE00FFFEFE00FFFEFE00FFFDFE00FFFDFE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFC00FFFFFC00FFFDFF00FFFD
      FF00FDFBFF00FCFAFF00FCFBFF00FCFBFF00E2EBF500E3ECF600B8DEFE009DC3
      E3004E9CE1003F8DD2001D8CF2002998FE00008CFF00008BFF00078DFF00058B
      FF000094FB000093FA000097FE000097FE000096FF000096FF000094FF000095
      FF000097FF000095FF002A90F000278DED005AA2D10061A9D80092B8D800A4CA
      EA00DDDDE900EBEBF700FFF6F200FFF9F500FFFFF800FFFFF800FAFFFE00FAFF
      FE00FDFCFF00FDFCFF00FFF9FF00FFF9FF000000000000000000FBFFFC00FBFF
      FC00FDFFFE00FDFFFE00FFFFFE00FFFFFE00FFFEFF00FFFEFF00FFFEFF00FEFA
      FB00FBF9F900FDFCFC00FAFCFB00FCFFFD00F7FBFA00F4F8F700F5F8FF00F3F6
      FF00EFFEE000E0F4D100CCDCB300B7C59E00ACB7A500A7B5A0009EA79B00A2AB
      9F00A7B69200AEBF9900B9CCA500CADDB600E0EAE100EDF5EE00FFFFF800FFFF
      F700FAFCF600FBFCF700F6FBF900F8FDFB00F7FCFD00F0F5F600FAFFFF00FAFF
      FF00FDFFFF00FDFFFF00FFFEFF00FFFEFF00FFFEFE00FFFEFE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFC00FFFFFC00FFFDFF00FFFD
      FF00FDFBFF00FCFAFF00FCFBFF00FBFAFF00E8F1FB00CAD3DD0086ACCC007399
      B9004593D8004B99DE002594FA002190F600008BFF00008BFF00098FFF000A90
      FF00009AFF00009AFF00009EFF00009EFF000098FF000094FF00008DFF00008E
      FF000094FF000098FF003197F7003197F700539BCA005199C800759BBB0082A8
      C800BFBFCB00D9D9E500FEF2EE00FFFDF900FFFFF800FFFFF800FAFFFE00FAFF
      FE00FDFCFF00FDFCFF00FFF9FF00FFF9FF000000000000000000FCFFFB00FCFF
      FB00FDFFFE00FDFFFE00FFFDFE00FFFDFE00FFFCFF00FFFCFF00FBF8FD00FFFD
      FF00FEFEFC00F7F8F500F2F9EE00FAFFF600F9FFF400F6FFF100D0E8D700B5CD
      B90092B180006E936400527A3D003D6621002F51200026481800214212002545
      15002A540F00315A1B003E672D00557E43007391650087A57900BDCEB100D7E8
      CC00F2FDEA00F4FBEC00F0F9EF00EFF9ED00F7FBFA00FBFFFE00FCFDFF00FCFD
      FF00FDFDFF00FDFDFF00FEFEFF00FEFEFF00FDFEFE00FDFEFE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFFFB00FCFFFA00FFFFF200FFFF
      F500FFFFF700FFFFF600E2F0FF00DAE8FA0081BDF9006BA7E300238BEE001E86
      E9000086FC000389FF00008EFF000295FF000091F80000A4FF00529DF900418C
      E80045A6E00055B6F00042AFE20045B2E5006999E7005F8FDD00359BFB00278D
      ED0000A9FF000099FC000790FE000F98FF0000A4F10000A0ED002A99DF002C9B
      E1007BA4D50090B9EA00D6D3E900E5E2F800FFF6F200FFFDF900FFFFF400FFFF
      F100F9FFF500FBFFF700F4FFFC00F2FFFA000000000000000000FFFFFB00FFFF
      FB000000000000000000FFFBFF00FFFBFF00FFFAFF00FFFAFF00FBF6FD00FFFA
      FF00FBFFF900F9FCF700F4FDEB00F6FFED00D4E2C600AFC0A1005B895B00406E
      400020580B00124A05001B550200276108002C6215002A601400306613003167
      14002E6C070027650500225F0300205D0100275A0A002D601000426632006E92
      5E00AAC39E00D2E6C600F3FFED00F1FBEB00F9FBFA00F0F2F100FFFCFF00FFFC
      FF00FFFCFF00FFFCFF00FDFFFF00FDFFFF00FBFFFE00FBFFFE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFFFB00FDFFFB00FFFFF300FFFF
      F200FFFFF700FFFDF300D4E2F400BDCBDD0064A0DC005894D0001E86E9002189
      EC00058BFF00048AFF000089FF00008BFF0000A7FF000085EC003A85E1005DA8
      FF0071D2FF0087E8FF0086F3FF0088F5FF00BDEDFF0091C1FF0040A6FF002E94
      F40000A0FF000096F900048DFB000C95FF00009FEC0000A0ED002D9CE2002C9B
      E100749DCE0081AADB00C5C2D800D4D1E700FAEEEA00FFF7F300FFFFF300FFFF
      F200F9FFF500FBFFF700F4FFFC00F2FFFA000000000000000000FFFFF900FFFF
      F900FFFEFF00FFFEFF00FFF9FF00FFF9FF00FFF8FF00FFF8FF00FFFBFF00FBF8
      FE00F3FFEF00F7FFF200E6FBD600BDD5AD0075975C003E602700155C0A00185F
      0A001E680200256F05002B7708002F7B0C00307B0E00307B0D00348009003682
      0B003889040037880300328302002D7D000028710600266F0600225C0B001F5A
      1000325E27005E8B4B00B1C7A500E6FBD900FDFFF800F3F7EE00FFFDFF00FFFD
      FF00FFFCFF00FFFCFF00FBFFFF00FBFFFF00F7FFFE00F7FFFE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFFF700FBFFF800FFFFF400FFFF
      F100F5FAFD00E9EEF10095C1F600729ED3001A7DEF00177AEC000076FF00007D
      FF000086FF000085FF000088FF000089FF003F99D9003E98D800A1C6FF00CAEF
      FF008ADFFF006BC0F00058BBDB0042A5C500B1C7F100CAE0FF00A1DDFF0082BE
      F9000797E9000F9FF1001F96FF00148BFF000098FE00009CFF00009BFD000098
      FA002C92E4003197E90081A9DA008EB6E700DEDCE800ECEAF600FFFCF000FFFF
      F400FDFFF000FEFFF100ECFFF600EBFFF5000000000000000000FFFFF900FFFF
      F900FFFEFF00FFFEFF00FFF9FF00FFF9FF00FFF8FF00FFF8FF00FAF8FD00FCFA
      FE00F5FFEF00E1EFDB0096B582004766330025500D00305B1300207506002277
      0700277C04002C81070030860A0033890D00338A0A00338A0A003A9308003992
      0700389400003894000036910100338E00002F8405002C81040029700F00276E
      1000245A11001F5508004A673A008DAA7D00D9DFD100FCFFF400FFFEFF00FFFE
      FF00FFFCFF00FFFCFF00FAFFFF00FAFFFF00F6FFFF00F6FFFF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFFF800FAFFF700FFFFF400FFFF
      F400ECF1F400CDD2D50074A0D5005A86BB00197CEE00177AEC000075FF000078
      FF00007FFF000082FF00008BFF00008EFF002C86C60067C1FF00BCE1FF00AACF
      FF004DA2D2003388B8003194B4002285A5005C729C009EB4DE009DD9FF00A6E2
      FF0019A9FB0013A3F5001F96FF00188FFF000099FF00009CFF00009BFD000098
      FA002C92E4002C92E400739BCC0079A1D200CECCD800DFDDE900FFF6EA00FFFF
      F400FEFFF100FDFFF000ECFFF600EDFFF7000000000000000000FFFCF700FDFB
      F500FFFEFF00FFFEFF00FAF3FF00FFF9FF00FFFAFF00F6F1FB00F0F8F100F9FE
      FA00D0EBC3006D89600026571400245405002E6D070035730C00298C01003295
      0200349209003D9A12002C8704002C88050046A816002E8F0200369C0200369B
      0100349C0000349C000034980200339802003394070032940600237F0300308B
      0D002D780E001D68000029560F002F5D1600788D6800D5E9C500FDFEF700F6FB
      EF00EFF0EF00F8FAF900FAFFFF00EAEFEF00F6FFFF00F2FCFC00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFF200FFFFEE00EFFBFF00EFFB
      FF00AAD3FF0079A2E0002A79E8002574E3000878FF000777FF000076FF000074
      FF00007AFF00007EFF000185FA000286FB008093CC00C6D9FF0068C2FF003A94
      E800008EF700008FF8000A9FFA00089DF8001D92CF00168BC8003F92C90093E6
      FF0075CDFF004199ED000A84F6001E98FF000094FF000093FF000094FF000094
      FF000098FB000098FB00329AE1003098DF009BBADB00ACCBEC00F5E7ED00FFF7
      FD00FFFEFC00FFFCFA00F5FFFE00F6FFFF000000000000000000FFFCF700FEFE
      FA00FFFBFD00FFFAFC00FEF9FF00FFF9FF00F9F5FF00FDF9FE00F6FEF700CCD6
      CD0078986900365627001E53000032671000397D0E0035790A00319800003BA2
      01002F8F030039990D002D8A050033900B003B9F090033970200359E0000359E
      0000339E0000339E0000339A0300339A030033980700339807002B8C07003697
      11003383120027770700316315001A4C0000374F2500748C6200D3DACB00FBFE
      F300F9FCFA00FCFEFD00F2F7F700F7FCFC00F3FDFD00F5FEFE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFF200FFFFEF00ECF8FF00E0EC
      F8008FB8F6005F88C6001E6DDC002776E5000171FF000474FF000076FF000076
      FF00007CFF00007DFF00007CF1000074E9009AADE600CFE2FF0055AFFF003993
      E70016A6FF000292FB000092ED00069BF60037ACE9001C91CE002679B0007ACD
      FF0089E1FF004FA7FB000F89FB001892FF000296FF000092FF000092FF000094
      FF00009BFE00009CFF00349CE3002F97DE008BAACB009BBADB00E6D8DE00FEF0
      F600FFFCFA00FFFCFA00F5FFFE00F6FFFF000000000000000000FFFBF900FFFF
      FD00FAF7F900F7F4F600FDFEFF00FCFDFF00ECF8ED00F8FEF800E1FBD8006D89
      6300164C03001D5306002A77020034810C0034900000328E0000469D0500479E
      06003F8C1C004693230040892400458F29002C8700003F991000359E0000359E
      0000339C0000339C00002F9806002F9806002E9904002E9904002C9A000032A0
      03002F9003002C8E01003D871900246F0100194A020022530600728E6200D6F2
      C600F8FFF200F7FFF200EAEFED00FAFEFD00F3F6FB00FAFDFF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFEC00FFFFED00D6EDFF00B3CA
      F000448DFF002972E6000064FF00066AFF000066FF00036AFF000E73F8000F74
      F900147DF200167FF4000777E700006ADA00AEC6E400C5DDFB0000A3F1000096
      E400008BFF000077FF001185FF001F93FF000895E60017A4F5003E8CBA0068B6
      E400B0E3FF0082B5F30000ACF500009EE700348EFD00328CFB000091FF000092
      FF00009CFF00009DFF00049FEE00039EED005B9BCB0069A9D900CEC4DB00EBE1
      F800FFF1FF00FFF3FF00FFF5FF00FFF8FF000000000000000000FEFCFB00FEFE
      FD00FDFBFD00F8F5F700FAFDFC00FCFFFE00F4FFF300EDFAEC0089A87D003150
      25000E480000356F1C0038880F0036860D003998050038970500469807004193
      04006EB64E006AB14A005BA04300498E3100328A05003C930E00369E0000369E
      0000339B0000339B00002F9807002F9807002E9A03002E9A03002C9B0000309F
      00002D9000002D900100459420003E8D190031671500255B09002E4E1D007999
      6800F1FAEA00F1FFEA00F6FAF800F6FBF800F8FAFF00F8FAFF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFE800FFFFED00D4EBFF009DB4
      DA002F78EC002871E500066AFF000468FF000067FF000168FF00086DF200086D
      F2001079EE00167FF4000A7AEA00006DDD00B7CFED00BBD3F10000A1EF0000A0
      EE00008FFF000087FF002397FF00097DFF00119EEF0018A5F600317FAD0055A3
      D100B5E8FF007BAEEC0000A9F20000A3EC00318BFA00328CFB000193FF000091
      FF000097FE000098FF00039EED0006A1F0005393C3005F9FCF00C4BAD100E4DA
      F100FFEEFE00FFF2FF00FFF4FF00FFF7FF000000000000000000FEFDFF00F9F8
      FC00FDFFFF00FBFDFD00E9F3E600FAFFF700EFFEE500AEC8A40034631E001D4C
      070024700300408C1D00309301003194020035A600002D9E00004D801E00598C
      2A00B7DCAE00A9CEA0008AB18B0061886200549833003D811C003C9902003C99
      0200369804003698040031980700319807002E9E00002E9E00002FA1000032A4
      00002E9B000028950000339507003597090030800F00247403001A500300285E
      1100B1CCA500F0FFE400FEFEFA00F6F8F200FEF7FE00FFF7FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFCFF00EDECF500AADBFF006293
      E1001E78FB001A74F7000D6AF5000D6AF5000F6BF8000965F2000065FF000068
      FF000067FF00006CFF000E70F4000060E400BBCEE300C7DAEF000698FF00008D
      FF001286FB00198DFF00077EFF000B82FF002C98E6002995E3002081CB003B9C
      E600B8E8FF0092C2DE00009FFC00009CF9000892FF000892FF00009BF500009B
      F5000A96FA000A96FA000690FF000690FF0016A0FA000C96F0006FA4BF00A4D9
      F400FEE4DD00FFFEF700FFFFF200FFFFF4000000000000000000FEFDFF00F5F4
      F900FCFFFE00FCFFFE00E7F3E300F7FFF300D2EEC50067845B001B4E0300275A
      0F0032810D003C8B17002C930000349A050033A80000289C00004F7A26008CB7
      6300E1FDDE00D6F3D400B6D5BD008BAB920070AF520048872A003D9703003D97
      0300379704003797040031980600319806002E9F00002E9F00002D9E00002FA1
      000032A000002E9C00002E9402003197040034891200297E0700296411001752
      000063805600DBF3CE00FCFEF700FFFFFA00FEF0FE00FFF9FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFAFF00EFEEF70093C4FF005C8D
      DB001E78FB001C76F900116EF900126FFA00126EFB000C68F5000067FF000069
      FF000067FF00006BFF000C6EF200005EE200B5C8DD00BED1E600008BFF000080
      F700087CF1001589FE000980FF000F86FF00309CEA00309CEA002889D30040A1
      EB00B9E9FF008FBFDB00009DFA00009CF9000892FF000892FF00009BF500009B
      F5000A96FA000A96FA000690FF000690FF00159FF9000C96F0006DA2BD009BD0
      EB00F9DFD800FFFAF300FFFEF000FFFFF4000000000000000000FDFCFF00F8F7
      FE00F9FDFC00F9FDFC00F1FEEA00EEFCE7009CC08A002F531D00225F0500306D
      130030880600368E0C002F9E00002F9E000028A5000029A600005D734200D7E7
      BC00F0F7FE00F1F8FF00DDE9F200C5D1DB0084B76D0061944A00419409004194
      09003A9706003A97060033990400339904002FA200002FA2000030A000002C9C
      00002D9F000030A200002D9C0000309F010034950F00288903002E7514001960
      01002D511D0099BD8900FFFFF700FDFEF700FFEDFE00FFF7FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F4FE00EFF0FA0073A7F400578B
      D800227AFC00237BFD001C75FB001E77FD001E76F9001870F300096DFF000A6E
      FF00046CFB00066EFD00146EEA00025CD800DBCAEB00E0CFF0000090FF000084
      FF000083F100028FFD000088FF00028CFF0000A0EA0000A3ED00058ED3001EA7
      EC00CCE6FF00A3BDDB00009BFF00009CFF000892FF000892FF00009BF500009B
      F5000696FB000696FB000390FF000390FF000E9DF9000796F200639EBE0086C1
      E100EAD9D600FFF4F100FDFBF300FFFFF9000000000000000000FDFCFB00FDFD
      FC00F7F8F500F9FCF900FAFFF100E2EFD80062894E001F460B002B710A003278
      11002F8C040037950C00379D0700309704002E950900389F0C0089977B00F8FD
      E900F0F5FA00F3F8FA00F1F9FE00EBF4F9009BC28A007DA46B004D941D004087
      10003F9B08003D9906002D950200329A02002B9C01002E9F0400329F04002C99
      04002C9B01002F9E01002F9B0000309C0000359509002E8E0200327C11001F68
      02002952150050783B00F0F8EA00F9FDF200FDF5FF00FBF7FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F1FB00EDEEF8005E92DF005B8F
      DC002B83FF002A82FF00217AFF00227BFF00257DFF001E76F9001074FF001074
      FF000870FF000971FF00156FEB00035DD900D4C3E400DAC9EA00008CFF000081
      FE00007FED000088F600007CF700007DF80000A1EB0000A2EC00038CD1001EA7
      EC00CFE9FF00A5BFDD00009BFF000098FF000892FF000892FF00009BF500009B
      F5000696FB000696FB000390FF000390FF000D9CF8000A99F500629DBD0078B3
      D300E6D5D200FFEFEC00FCFAF200FFFFF9000000000000000000FFFDF800FFFF
      FA00FCF9F400FFFEF900FAFFEE00C9D2BD00325E1B00224E0B002A7C05002F81
      0A0031960500389D0C0037930C00308C0500408B18004F9A2700D2D5D300FAFD
      FB00EDEFF000F7F9F900BEC4C200F6FCFA00C4DCBA009FB79500659C3F00447B
      1E00459F0A00409A050028940000329E000029980600309F0D002E9609002E96
      09002E9903002E990300329A0000329A0000379703003797030038840E00236F
      000036641C0023510900CCDEC700F3FFEE00F9FBFF00F7F9FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDF3FF00DEE4F1005A8EDB006498
      E5003A8EFF00368AFF003383FE003080FB003B88FD003481F6002681FF002681
      FF001F7CFB001F7CFB002979E4001666D100D5BEEB00DBC4F100008BFD00007E
      F000026DFF000C77FF000E66FF00126AFF000090FF00008EFF000F7BE0002C98
      FD00CBDDFF00A2B4FB00009DF5000096EE000693FF000693FF00009CF500009C
      F5000397FB000397FB000090FF000090FF00049BFD00059CFE00599EC50061A6
      CD00D8D2D700F1EBF000EDF9F900F4FFFF000000000000000000FFFDFB00FDFC
      FA00FFFEFA00FDFCF800F6FFE9009BA78E0023520A0023520A002A7F03003186
      0900359C070039A00C00328F08002F8C05005AA5350084CF5F00EAF6ED00F2FD
      F500E1F6CD00CFE5BB00667F5000C8E2B300DDF5D700BAD2B4007FA972005681
      490046951C00418F170031980000389F00002C980300309C06002D9606002D96
      06002D9901002D990100309B0000309B0000359801003598010037860B002B7A
      010030601400194A02009EB39900EFFFE900F7FAFE00F9FCFF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F7FF00CBD1DE006397E4006CA0
      ED004094FF003B8FFF003B8BFF003787FF00428FFF003C89FE002F8AFF002F8A
      FF002986FF002986FF003282ED001F6FDA00DDC6F300E2CBF800008DFF000079
      EB000062F900006BFF00065EFF000E66FF00007DF300007FF5000470D5002692
      F700C9DBFF00A3B5FC0000A0F800009BF3000693FF000693FF00009CF500009C
      F5000397FB000397FB000090FF000090FF000299FB00089FFF005A9FC600569B
      C200D8D2D700EFE9EE00EDF9F900F4FFFF000000000000000000FFFDFD00FAF8
      F800FFFFFC00FBFAF600F9FFEB00707E6200205105002F60140032890900348B
      0B0030990200329B04002F8D06003F9D16008BD76800C9F9A600EFFEF300E4F5
      E800CCF0AA00739751005A8034007FA55900CDE6CA00D7F0D400A0C2A4007294
      76004B912C0040862100399D00003CA001002E9800002A9400002C9603002C96
      03002C9900002D9A00002F9C00002F9C0000359A0000359A0000398A0C003788
      0A0030621400164800006F856900F0FFEA00F7FAFE00FBFEFF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4FBFF00B2B9C80071A4ED0071A4
      ED004797FF004393FF005298FF004F95FF005899FC005394F7004894FF004A96
      FF004392FF004392FF004C8FEB00397CD800BCBEF800C8CAFF00499ADE003889
      CD002F6BE600336FEA004062F500486AFD004B82CB00538AD3005182C6006FA0
      E400A9DBFF007EB0FF0011A3EB0011A3EB000693FF000693FF00009CF500009C
      F5000197FC000197FC000090FF000090FF000096FA0004A0FF0052A0CB004593
      BE00CED0DA00E3E5EF00E1F7FD00E9FFFF000000000000000000FFFDFE00F6F4
      F900FFFFFD00F8F9F600F8FFE9004E603F0021580100376E170033920600308F
      02002A9800002C9B00003190070046A51C0091DC7100D1FFB100E3FFD700CFFA
      C3008BC65A0046801500508D150056941B0089B37600D7FDC400BCDBCD0094B2
      A4005A885D0043724600428F180046931B0041A400003B9E00002E9701002E97
      01002E9B00002E9B00002E9F00002E9F0000329D0000329D0000378D09003D93
      0F0031691500174F000049614100F2FFEA00F6FBFB00FAFEFF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4FBFF00A2A9B80079ACF50070A3
      EC004494FF004292FF00599FFF00569CFF005C9DFF005798FB004D99FF004F9B
      FF004897FF004998FF005295F1003F82DE00C2C4FE00DADCFF006CBDFF0068B9
      FD00639FFF0067A3FF007193FF007698FF0071A8F1007BB2FB0077A8EC0089BA
      FE00B2E4FF007AACFF000B9DE5000C9EE6000693FF000693FF00009CF500009C
      F5000197FC000197FC000090FF000090FF000094F80004A0FF0052A0CB00408E
      B900CED0DA00E1E3ED00E0F6FC00E7FDFF000000000000000000FFFDFF00FAF8
      FE00FCFDFB00F8F9F700F8FFE900354926001D560000366F14002C8D00002E8F
      00002C9C000031A1000034940A0038980E005DA83E007CC35D00A6D6950087BA
      760052941D0054961F00498E0800488D070054843C0098C78000CEEBE200C0DD
      D40080A78E00547B6200458B200042881D0046A7000041A20000319A0300319A
      0300309D0000309D00002EA000002EA00000329E0000319D0000358C06003A91
      0B00346D180019520000314A2800F3FFEA00F4FAF900F9FFFE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6FCFF00A2A8B30084B3F7007BAA
      EE0060A8FF005CA4FF0067A0FB0070A9FF007BACFC0079AAFA006CABFF0069A8
      FF005DA0FD005EA1FE00639BE8004B83D000B2C2E600DAEAFF00ABE0FF00BCF1
      FF0098DDFF00A5EAFF00CBFCFE00CDFEFF00B5EEFD00C2FBFF00A4D7E100CAFD
      FF008EE3FF006ABFE70020A5FF000C91F2000993FF000993FF00009BF700009B
      F7000297FF000297FF000091FF000092FF000098FC00009DFF0056A4D2003B89
      B700D1D7E200D8DEE900E0FAFF00E5FFFF000000000000000000FBFBFF00FBFA
      FF00F7F9F900F9FBFB00F1FFE200253B160018570000337210002A8E00003095
      00002DA1000030A3000032970B002F95080037871C0038881D004BA216003991
      08003F8D1600499821004B9B16003B8B06004493060052A01300A9DC9800D0FC
      BF00B2C5D3007F93A0005C835A00486F450051A000004A990000399B0700399B
      0700359F0000349E00002EA100002EA000002F9E00002F9E000035910500338F
      02003673190019550000243E1A00F2FFE800F4FBF900F7FEFB00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6FCFF00A7ADB80084B3F7007DAC
      F00061A9FF005FA7FF006AA3FE0073ACFF007BACFC0079AAFA006CABFF006BAA
      FF0063A6FF0066A9FF006AA2EF005189D600B1C1E500C8D8FC006FA4DD00598E
      C7004489B10063A8D000AEDFE1009DCED000629BAA005F98A7004D808A0093C6
      D000A2F7FF0065BAE2001196F7001499FA000993FF000993FF00009CF800009B
      F7000297FF000297FF000090FF000091FF000099FD00009CFF0055A3D1003D8B
      B900CFD5E000D9DFEA00E0FAFF00E5FFFF000000000000000000F6F6FF00FAFA
      FE00F7F9F900FCFEFE00EEFFDF00213812001C5C00003777140032970000359A
      02002CA00000299D000032980A003AA01300449429003F8F2300369200004FAB
      170043941D003E8E170041920E004C9D19004698030053A510005E954700B2E9
      9B00C6D9E600A5B8C500789C7900567A57005DA90800529D02003C9D0A003C9D
      0B0037A10100369F000030A200002FA200002F9F00002E9E000039950800328E
      010039761C0019560000233D1900F3FFE900F7FDFB00F8FFFC00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFEFF00B6B9BE008CB6F10088B2
      ED0070AEFF006FADFF007CACF40085B5FD0091B6F4008DB2F0007EB2FE007EB2
      FE0075B0FF0078B3FF0079ABED005E90D200C9D5C900E4F0E40060A1FF00397A
      DD002675BE002E7DC600ADDFF30096C8DC000054E2000466F400256AB3004F94
      DD00A1F9FF0066BED6000290FF000391FF000B92FF000B92FF00009BF900009B
      F9000497FF000396FE00008FFF00008FFF000098FD000099FE0056A2CC004793
      BD00D3D5DD00E0E2EA00E7FCFE00EBFFFF000000000000000000FBFCFF00F0F1
      FB00FDFFFF00FAFCFC00F1FFE4002E4421002A69090029680800329600003195
      0000299D00002CA0000032980A0032980A003D8F1E00419322003CA700003CA7
      00003F98200040992100449C1A00449C1A0049AB000048AA00004C9A100059A7
      1D00BBDFBB00D3F7D30095B19A006B87700076A34C004F7C250041971300469C
      180042A110003D9C0B0036A1000037A20000319F00002A9800002F8C01003895
      0A002E6B11000F4C0000354D2A00F4FFE900F0F2F200FCFEFE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFDFF00C3C6CB008DB7F2008CB6
      F10073B1FF0075B3FF0081B1F90089B9FF0099BEFC0094B9F70083B7FF0083B7
      FF0079B4FF007CB7FF007BADEF006092D400C4D0C400E0ECE0006FB0FF005495
      F8004493DC002776BF00B8EAFE0099CBDF000F71FF001274FF00397EC70062A7
      F00096EEFF0065BDD500018FFF00018FFF000B92FF000B92FF00009BF900009B
      F9000497FF000396FE00008EFF00008EFF000099FE000097FC0056A2CC00509C
      C600D3D5DD00E3E5ED00E8FDFF00EBFFFF000000000000000000FBFCFF00F5F5
      FE00FDFEFE00F6F8F800F4FFE7004A5F3E001F5B0000326E12002E9100002F92
      0000299C00002C9F000034990A00369B0C0042942100459724003EA605003EA6
      0500419C1F00429D200047A01B0047A01B004AAB05004AAB050053A3170056A6
      1B00608D5200ADDA9F00C3E0C000A4C4A100628A44006D944F00449518004597
      1A00419D11003F9B0F0037A00300379F020035A1010036A20100328E0500318D
      0400306C13001B5700003F563400F4FFE900F9FAFB00F9F9FA00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFDFC00D9D7D60098BBED009ABD
      EF0080B6FF0085BBFF0092B7F3009ABFFB00A5C3F400A1BFF00091BDFD0091BD
      FD0083B8FF0087BCFF0086B5F2006D9CD900B1C6C300D1E6E30085BCFF00639A
      EB004C88F900306CDD00CFD9FF009EA8FC001D68FF000040FF003263D70095C6
      FF007DD6FF00469FEF000081F8000294FF00098EFF00098EFF000099FA00009A
      FB000795FF000694FF00008DFF00008CFF00059AFC000196F8005DA3C80064AA
      CF00DCD7D800F0EBEC00F2FFFC00F3FFFD000000000000000000FDFBFF00FEFC
      FF00FCFCFC00F4F4F400F8FFEE0074856A0014490000366B1B002A8900002F8E
      04002C9C00002E9E0000389B09003B9E0C00499A1F004C9D2200419F180042A0
      190044A4170045A5180048A7170048A717004AA617004AA6170055AC1C004DA4
      1400559F1D005CA62400B8DD9D00ACDA910091A899006F867700579933005395
      2F004B9A21004D9C230043A211003D9C0B00379C0400389D0500358D0B002B83
      0200306815001A52020066785B00F3FFE800FFFDFF00FAF4F900000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFDFC00E8E6E5009BBEF0009FC2
      F40083B9FF008AC0FF0096BBF7009DC2FE00A3C1F200A1BFF00094C0FF0093BF
      FF0085BAFF008CC1FF0092C1FE007EADEA0095AAA700D2E7E400AEE5FF0082B9
      FF00528EFF003C78E900D4DEFF00A4AEFF000E59FF00105BFF006FA0FF00B0E1
      FF0059B2FF00348DDD00007FF6000091FF00068BFF00078CFF000098F900009A
      FB000896FF000795FF00008EFF00008DFF00059AFC000095F7005FA5CA0071B7
      DC00E0DBDC00F6F1F200F4FFFE00F2FFFC000000000000000000FCFAFD00FFFD
      FE00FDFCFC00F6F5F500F9FFF0009FAE9700134504002D5F150028820100308A
      08002E9B01002F9D0100379A07003DA00C004B9D1E004D9F2000469F1F0047A0
      200048A7180049A81A004CAA1C004CAA1C004DA524004DA5240057AD240053A8
      200053A3150064B52700659B4000A0D67B00ACC8B00093AF970068A247005C96
      3B004D9527004F97290049A41B00449F16003A9B09003698060033880A00287D
      01002B61110010460000A3B39900EDFCE200FFFBFF00FCF6FB00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFA00F7F3EE00A0C1EE00A6C7
      F4008ABCFF0092C4FF009FBFF400A6C6FB00ABC3ED00ACC4EE009CC6FF009AC4
      FF0089BDFF0091C5FF009CCAFF008DBBF5006B91C7008DB3E900D7F0EC00D3EC
      E80092BFEB0077A4D000F1EEF700D5D2DB008AABC500B7D8F200D9F5FF00B3CF
      EE000F79FF000B75FE000087FB000087FB000587FF000789FF000096F9000099
      FC000A96FF000A96FF00048FFF00038EFF000A9AF9000494F30067A7C90082C2
      E400EADFDB00FFF7F300FBFFF900F8FFF6000000000000000000FEFCFB00FFFF
      FE00FFFDFD00FBF9F900FBFFF500C7D1C100305D1E00214E0F00247802003084
      0D003099020030990200369903003EA10B004DA01B004EA11C004C9D29004E9F
      2B004DAA19004FAC1B004FAB220050AC230050A2370050A237005BAF31004CA0
      220061BB1B005DB7170062A62F0069AD36009ABF9900A8CDA70086B46B0075A3
      5A0059973900508E3000499D21004A9E2200409C130038940B00308009002878
      010027580E001D4E0A00DFEAD500ECF8E200FFF9FF00FFF8FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFA00FDF9F400A1C2EF00A8C9
      F6008BBDFF0094C6FF00A0C0F500A6C6FB00B1C9F300B3CBF500A2CCFF009DC7
      FF0089BDFF0091C5FF009ECCFF0092C0FA009CC2F800678DC30099B2AE00D2EB
      E700C1EEFF00A8D5FF00FFFCFF00ECE9F200CFF0FF00CEEFFF00B8D4F3006B87
      A6000771FA000B75FE000086FA000085F9000486FF000688FF000096F9000099
      FC000A96FF000A96FF00048FFF00038EFF000A9AF9000393F20068A8CA0089C9
      EB00EDE2DE00FFFBF700FBFFF900F7FFF5000000000000000000FFFEF900FFFF
      FB00FFFDFD00FEFBFC00FBFFF600E8EFE300658E5700204911001C6C00002C7D
      0D002F9602002F9602003698020042A40E0052A51B0052A51B0054A5290055A6
      2A0055AB260057AD280055AC310056AD320056A83E0056A83E0050A52C0064B9
      40005DB5230058AF1E0063AC300063AC3000699D50008ABE71009EC7880093BC
      7E0075AE59005E9742004D9D28004F9E2A00429B1700328B08002D7B08002270
      000026540D0055833C00FBFFF000F2FBE800FFF6FF00FFF7FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFDFF00F0F2FA00D4E0F200CAD6
      E800B2CCF100AEC8ED00A0C6FC00A5CBFF009BC8FF009CC9FF009EC8FF009BC5
      FF00A2C7FB00A5CAFE00AACBF900A8C9F700A5C6E70099BADB007AA3D4007099
      CA0078A1DF008DB6F400A5C2F500A3C0F300B9CFF800D5EBFF009ECCFF0089B7
      ED003592F9002A87EE000067F6000080FF00008DF0000092F5000B8CFF000C8D
      FF00098CFF000B8EFF000097FF000094FF002CA4DF00249CD70085AFC200ADD7
      EA00FEF7F400FFFDFA00FFFFF500FFFFF7000000000000000000FFFFF800FFFD
      F600FFFAFB00FFFCFD00FAFEF600F9FCF50097BD8B00274D1B00146200002775
      0A002D9200002D9200003798020045A6100057AB1D0057AB1D005AAA29005CAC
      2B005BAC31005DAE33005BAD3D005CAE3E005BAD44005BAD440054AA340064BA
      44005FB42E005AAF29006EBB3B0066B333005E9F32006FB043008EB27C0097BB
      850087BB6D006FA3550057A3340055A1320042991A002B8203002D7909001B67
      000028540F0099C58000FDFFF200FAFEEF00FFF5FF00FFF3FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFCFF00F9FBFF00E0ECFE00CBD7
      E900AFC9EE00B2CCF100A4CAFF00A1C7FD009AC7FF009BC8FF009FC9FF009EC8
      FF00A5CAFE00A4C9FD00A6C7F500A3C4F200AFD0F100ADCEEF0093BCED007BA4
      D500658ECC006089C7006D8ABD006C89BC007F95BE008AA0C90099C7FD00B8E6
      FF0052AFFF002986ED000077FF000087FF00008FF2000092F5000788FF00098A
      FF000689FF00088BFF000095FF000093FF00259DD8002DA5E00097C1D400B9E3
      F600FFF8F500FFFBF800FFFFF400FFFFF7000000000000000000FCFCFD00F6F5
      F700FFFCFD00FFFCFE00F3F2F300FEFDFD00DAEAD2006C7C65001E4A0C002B56
      1500327C0F003B8517002F9001003C9C0E004CB614004EB917005BAA2B0060AF
      2F0062B0360062B0360062AF3C0065B2400067B1470066B1460066B2440066B2
      440066B23F0066B23F006BB6420064AF3A0064AC3A0069B13F006CAE580067A9
      530078BB5F0082C568006FB253005A9D3D0049872B00306E120038681F001647
      010065805500E1F4D200FBFFF500F4FBEE00FFFCFF00FAF7FA00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAF9FD00FFFEFF00F1FAFF00D5DE
      EC00B5CAEA00BACFEF00ACCDFE00A4C5F6009FC7FF00A0C8FF00A1C9FF00A3CB
      FF00A8CDFF00A5CAFE00A5C6F400A1C2F0007EB8FA0083BDFF0077BAFF0073B6
      FF0067ACFF005DA2FF005F95EA005288DD00698DC9004C70AC005C84B90092BA
      EF0095D9FF006EB2FD002585E9001070D4000D85FD000C84FC000087FF00008A
      FF000092FF000094FF001D98F2001D98F2005996C80073B0E200C5D8E500DDF0
      FD00F8FBF900F8FBF900FCFDF900FFFFFC000000000000000000FCFCFF00F4F4
      FA00FFFDFF00FFFDFF00F3EFF400FFFDFF00FAFDF400B6BDB00032501F00304E
      1D002C6C0C00397919002C8C000038980C0045B80F004FC219005DAC2D0062B1
      320065B2380066B3390067B23F006BB643006BB3480068B045006BB349006AB2
      48006CB449006DB54A006CB6460069B3430068B33F006AB54100509D3B0060AD
      4B0061AA480064AD4B0073B3590056963C00386C1E00386C1E001D4309004167
      2D00ABC09F00F6FFEA00FBFFF700F1FAED00FCFCFC00FCFCFC00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFAFE00FFFEFF00F3FCFF00E1EA
      F800BDD2F200B7CCEC00A8C9FA00A7C8F900A1C9FF00A0C8FF00A0C8FF00A3CB
      FF00A8CDFF00A5CAFE00A9CAF800ABCCFA0090CAFF008CC6FF0076B9FF006CAF
      FF0061A6FF0060A5FF0072A8FD0073A9FE006F93CF006D91CD004B73A800547C
      B1009ADEFF007EC2FF002888EC002C8CF0000A82FA000981F9000085FF00008A
      FF000093FF000094FF001E99F300209BF50064A1D30086C3F500D8EBF800E5F8
      FF00F9FCFA00FBFEFC00FEFFFB00FDFEFA000000000000000000FDFEFF00F6F8
      FA00FBFAFE00FFFDFF00FBF7FA00FFFDFF00FDFFF700F0F6EB0090A881002D45
      1E00134601004377260033840C003080080041A314004DAF200067B43B006AB8
      3E006BB6410069B440006CB5470072BB4C0072BA50006FB74C006EB54E006FB6
      4F0071B94F0072BA500071B94E006FB74C006CB646006BB544006FBB4C0069B5
      460066AD470062A942005D9A42004D8A32003F6B28002B581500223E140095B2
      8800ECF8E600F6FFF000FBFBFE00FBFBFC00F9F3FE00FEF9FE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFE00FFFEFD00F9FCFF00F4F7
      FF00D2E2F900BECEE500ADC8ED00B5D0F500AACEFE00A7CBFB00A4C9FB00A6CB
      FD00A6CAFA00A5C9F900AFD2FE00BADDFF00FCF3E600FFF8EB00DCEFFF00D0E3
      FE008DBEFF0075A6F4005093FA004D90F700488AF0004486EC002467C4002C6F
      CC0089D6FF006FBCFF002C86EB002F89EE002174FF001F72FF000085FD00008C
      FF000097F2000096F1004898D5004F9FDC00B8B8D600D4D4F200F9F3F800FFF9
      FE00F3FEFC00F6FFFF00F8FEFF00F4FAFF000000000000000000F8FAFB00F9FB
      FC00FCFCFE00FEFDFE00FEFDFE00FEFBFD00F8FDF300FCFEF700EBFBDC00748B
      66001849030026570A0034810D00327F0B002E8D030042A117006AB63E006EBB
      420070BA47006CB743006BB4460071BA4C0075BD540077BF550076BD570077BE
      580076BD540073BA510072BA4F0072BA4F006FB949006AB4440077C252005FAB
      3B0069AF480069AF480047832C00306C14002F591900174204007B956E00DBF5
      CE00F9FEF500EDF8E900FAF8FD00FEFDFF00FEF7FF00FCF5FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFE00FDF9F800F5F8FF00FAFD
      FF00E1F1FF00C7D7EE00B0CBF000B9D4F900A9CDFD00A6CAFA00A5CAFC00A4C9
      FB00A0C4F4009FC3F300B2D5FF00C7EAFF00ECE3D600E5DCCF00C2D5F000D3E6
      FF00B5E6FF00ADDEFF007DC0FF0068ABFF0061A3FF003C7EE4004689E60075B8
      FF008BD8FF0062AFFF002882E700116BD0002174FF001E71FF000084FC000089
      FF000091EC00008FEA004999D60058A8E500D2D2F000E2E2FF00FCF6FB00FFF9
      FE00F4FFFD00F6FFFF00F8FEFF00F5FBFF000000000000000000F0F5F300FBFF
      FE00FEFEFE00FAFAFA00FFFDFE00FFFEFF00F9F8F400FDFCF800F0FCE600ECF7
      E2007C9A69001E3C0B0026580B003C6E20003070100047872700579D320067AD
      420075BA510077BC530074B8530075B9540078BB5A007ABD5C007FC2610080C3
      62007CBF5E0077BA590077BA57007DC05D007BBF5A0074B853006BAE3B0077BA
      47006BA7430055912D0045732B0023510900314F26006D8B6200DCE8DB00F3FE
      F200FCFDFF00F6F7FB00FAF3FF00FEF9FF00FFF8FF00FFF4FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFB00FFFCF700FAFCFD00FDFF
      FF00F3FCFF00E2EBF900C7DBF400C2D6EF00B2CCF000B2CCF000AFCDF600AECC
      F500A0C0E9009CBCE500B1D1FA00CEEEFF008FC3FF006FA3E600608CC9006995
      D2009FB7E500BBD3FF00DEE6FF00E3EBFF00C0C7E200C0C7E200B7DAFF00CCEF
      FF0065B3FF003886F0000173FF000C7EFF001A73FF001871FF000982F0000D86
      F4002190D4002594D80086B0CD00A1CBE800F9E9F000FFF1F800FFFBF800FFFD
      FA00FEFDFF00FFFEFF00F6FCFF00F6FCFF000000000000000000F6FAF800FBFF
      FD00FDFDFD00F5F5F500FEFBFD00FFFEFF00FFFEFC00FEFDFA00F6FFEE00F8FB
      EF00D6EFC500839D7200285514001D4A07002D660F002C660F003F821B005598
      31006EB14C007CBE590081C3610082C4620081C263007EBF610080C1630084C5
      670081C264007BBC5E007EBF5F0085C6660083C4630078B9580081C052006FAE
      4000568E3000356D0F001F490700335E1B0086A17D00D3EECA00F8FEF800F1FC
      F200FBFBFF00FDFDFF00FCF6FF00FAF2FE00FFF8FE00FFF8FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFB00FFFFFB00FDFFFF00FDFF
      FF00F3FCFF00F1FAFF00D2E6FF00BFD3EC00AFC9ED00B1CBEF00B1CFF800AFCD
      F6009DBDE60096B6DF00ADCDF600CCECFF0086BAFD0084B8FB0087B3F00077A3
      E000778FBD007189B7009BA3C000B9C1DE00CFD6F100E2E9FF0098BBF30080A3
      DB003684EE00317FE9000061F1000678FF001871FF00166FFF000881EF000E87
      F5002493D700309FE3009CC6E300C0EAFF00FFF1F800FFF5FC00FFFEFB00FFFE
      FB00FFFEFF00FCFBFF00F4FAFF00F6FCFF000000000000000000FDFFFB00FBFD
      F900FCFDFB00FAFBF900FCF9FB00FDFCFD00FFFDFE00FFFDFE00FDFDF800F3F3
      EE00F6FFEC00E6F2DC0098AB890050674100304E1D002A4817002E6712003D76
      2100528B3600669F4A0078B05D0086BE6B0089C16E0086BE6B0085BD6C008AC2
      710088C06D0083BB680084BC690088C06D007FB764006FA754006D9D45004979
      2100345C15002E560F004863380092AB8200DDE8DC00F2FFF100FBFCFE00FAFB
      FF00FDF7FF00FBF7FD00FFFCFF00FFF8FE00FEF7FA00FFFDFF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFB00FFFFFB00FFFFFE00FFFF
      FE00FAFEFF00F8FCFF00EBF7FF00E9F5FF00C0D1E600CFE0F500BCD3ED00B2C9
      E300AFC8E8009CB5D500A3BEE000D9F4FF00BED2F100B2C6E50098B9E70096B7
      E5007CACF4006C9CE4004582DF003875D200357DE3002D75DB001B6AD9001766
      D5001167E100176DE7001271F0001473F2001585F5000F7FEF00407DD3004986
      DC0090A5D200AEC3F000D7EAEF00E6F9FE00FBFFF800FBFFF800FFFFF900FFFF
      F900FFFBFF00FFFBFF00FAFCFF00FAFCFF000000000000000000FDFFFA00F9FB
      F500FDFDFB00FFFFFD00FEFCFD00FBF9FB00FFFCFD00FFFCFD00FBF9F600FFFD
      FB00F6FEEE00F7FFEF00F8FFED00B7C7AB00607551005469450023550B002759
      0F002F6116003E70260055873D006C9E540079AB60007CAF640085B76D0088BA
      700089BC710086B86D007EB0660071A359005E9147004E803600335A14003D64
      1E0043622B0066864E00B8CDAE00EFFFE500F9FEF900F2F9F300FBFAFE00FDFD
      FF00FDF9FF00F7F3FB00FFFDFC00FFFDFC00FEF8F500FFFDF900000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFB00FFFFFB00FFFFFE00FFFF
      FE00FAFEFF00F8FCFF00ECF8FF00EBF7FF00DDEEFF00CFE0F500B5CCE600BED5
      EF00BAD3F3008FA8C80087A2C400BFDAFC00E0F4FF00CBDFFE00A6C7F5009EBF
      ED0085B5FD007BABF3005B98F500518EEB00448CF2004189EF003281F0002E7D
      EC002076F0001C72EC000F6EED000D6CEB000373E3000C7CEC005390E6006AA7
      FD00B3C8F500C8DDFF00E3F6FB00E9FCFF00FBFFF800FBFFF800FFFFF900FFFF
      F900FFFBFF00FFFBFF00FAFCFF00FAFCFF000000000000000000FFFFF900FFFF
      F900FFFFFC00FFFFFC00FFFEFF00FFFEFF00FFFEFF00FFFEFF00FFFCFD00FFFC
      FD00FCFBF700FAF9F500FAFEF500F6FBF100D8DFD200B5BCAF00618850004970
      38002D541C001F460E00274F150038602600477033004E773A0060894C005B84
      47005C8548005E874A0051793F00396127002C541A002E561C004E653F00738A
      6400AABBA000D8E5CE00F5FDF400F6FDF500FBFBFF00F6F6FA00FFFCFF00FFFC
      FF00FFFEFF00FFFEFF00FFFFF700FFFFF700FFFFF100FFFFF100000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFFFD00FFFFFE00FFFFFE00FFFF
      FE00FDFFFF00FDFFFF00F8FCFD00F7FBFC00F1F9FF00F2FAFF00D5E2F000C6D3
      E100C1D2E500ABBCCF0091A6BC0099AEC400C4DCFA00CFE7FF00CCECFF00C4E4
      FF0093C3FF0078A8E8005499F600579CF900247FF800237EF7000A77FF000673
      FF00006AFF000068FF000066FF000066FF002B89CA003E9CDD00A8B6E600C5D3
      FF00FFECFE00FFF5FF00FCFFFA00FBFFF900EDFFF900EDFFF900FFFFFE00FFFF
      FE00FFFBFF00FFFBFF0000000000000000000000000000000000FFFFFA00FFFF
      FA00FFFFFC00FFFFFC00FFFEFE00FFFEFE00FFFEFF00FFFEFF00FDFBFD00FFFE
      FF00FCFBFA00F8F6F500FAFBF700FEFEFB00FAFDF700F1F3EE00D4EBC900BBD4
      B00092AF87006D8A620055724700426035003251220027461800294818002645
      16002B4A1B00385728004361350053714500708E63008CAA7F00BCCAB700D6E4
      D100EFF9EC00F9FEF600FBFDFB00F6FAF800FAF8FF00FEFBFF00FFFDFF00FFFD
      FF00FFFEFC00FFFEFC00FFFFF400FFFFF400FFFFEE00FFFFEE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFEFC00FEFFFD00FFFFFE00FFFF
      FE00FDFFFF00FDFFFF00FBFFFF00FAFEFF00F0F8FF00F6FEFF00E9F6FF00CEDB
      E900C9DAED00C5D6E900A6BBD10090A5BB007890AE0093ABC900A8C8F300B0D0
      FB0088B8F80072A2E2005499F6005EA3FF003994FF00348FFF001380FF000774
      FF000069FF000069FF00006FFF000077FF0059B7F80068C6FF00C9D7FF00DAE8
      FF00FFF5FF00FFF6FF00FBFFF900FBFFF900EDFFF900EDFFF900FFFFFE00FFFF
      FE00FFFBFF00FFFBFF0000000000000000000000000000000000FFFFFB00FFFF
      FB00FFFFFC00FFFFFC00FFFFFE00FFFFFE00FFFEFF00FFFEFF00F8F5F700FFFE
      FF00FFFEFF00FDFBFD00FEFBFD00FEFCFD00FDFAFD00FAF7FB00F1FFEC00F3FF
      EE00ECF9E600DBECD500C5D9BC00B2C6A900A9B99D00A2B096009CAF8F009BB0
      8E00A1B49500ABBE9F00B5C9AA00C3D7B800DDEAD400ECFAE300F4F9F800F6FB
      FA00F1F4F700F3F6F900FDFCFF00FCFBFF00FDF9FF00FAF6FE00FFFEFF00FFFE
      FF00FFFFFB00FFFFFB00FFFFF200FFFFF200FFFFED00FFFFED00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7FEFF00F7FEFF00FBFFFF00FBFF
      FF00FFFFFC00FFFFFC00FFFFFB00FFFFFB00FFFFFC00FEFDF900F4F8F900F8FC
      FD00F0F9FF00DCE5EE00C7D3DF00C6D2DE00A1BDDB0098B4D20082ABD80087B0
      DD0071AFF6006DABF2004E9DFE004A99FA003B8BF0003A8AEF004E8ADC004C88
      DA007895C20086A3D000B7BBCD00C5C9DB00D1E6FB00D8EDFF00F5F8FC00F9FC
      FF00FFFFF500FFFEF300FFFFF500FFFFF600FAFFFF00FAFFFF00FDFCFF00FDFC
      FF00FFFFFE00FFFFFE00FFFFF400FFFFF4000000000000000000FFFEFD00FFFE
      FD00FFFFFD00FFFFFD00FFFFFC00FFFFFC00FFFEFC00FFFEFC00F9F9F800FFFE
      FE00FEFEFE00FCFBFC00FBFAFD00FEFCFE00FEFBFE00FCFAFD00F7FBF700F8FA
      F900FAFCF900FAFEF800F7FDF200F7FDF200F8FFF000F3F8EA00F7FFEE00F6FF
      ED00F9FFF000F9FFF000F8FFF200F8FFF100F6FAF100F4F8EF00F9F9FF00F9F9
      FD00F7F5FA00F7F5FC00F9F7FC00FAF8FD00FEFCFF00FCFAFE00FFFEFE00FFFE
      FE00FFFFFB00FFFFFB00FFFFF800FFFFF800FFFFF600FFFFF600000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8FFFF00F8FFFF00FBFFFF00FBFF
      FF00FFFFFC00FFFFFC00FFFFFB00FFFFFB00FBFAF600FFFEFA00FBFFFF00FBFF
      FF00F4FDFF00F3FCFF00EAF6FF00E2EEFA00C7E3FF00B3CFED008FB8E50086AF
      DC0068A6ED00609EE500408FF0003B8AEB003F8FF4004494F90064A0F20070AC
      FE00A7C4F100B9D6FF00E8ECFE00F2F6FF00DEF3FF00E1F6FF00FBFEFF00FBFE
      FF00FFFFF700FFFFF700FFFFF700FFFFF700FAFFFF00FAFFFF00FDFCFF00FDFC
      FF00FFFFFE00FFFFFE00FFFFF400FFFFF4000000000000000000FFFEFE00FFFE
      FE00FFFFFE00FFFFFE00FFFFFC00FFFFFC00FFFFFC00FFFFFC00FEFEFD00FEFF
      FD00FBFBFB00FBFBFB00FDFCFE00FEFDFF00FFFDFF00FFFDFF00FDFBFF00FBF9
      FF00F7F6F800F5F4F600F6F7F300F8F8F500FAFEF300F9FCF200F9FDF100F7FB
      EF00F7FAF000FBFEF400FFFFFB00FEFFFA00FDFDFA00FAFBF700F8F6FF00FCFA
      FF00FEFAFF00FEFAFF00F9F7FD00F6F4FA00FBFAFC00FFFEFF00FFFFFE00FFFF
      FE00FFFFFC00FFFFFC00FFFFFC00FFFFFC00FFFFFB00FFFFFB00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4FEFF00F4FEFF00FAFFFF00FAFF
      FF00FFFFFB00FFFFFB00FFFFF800FFFFF800FCF8ED00FFFFF700FFFFFB00FCFC
      F600F2F6F700FBFFFF00F6FFFF00ECF5F900E5F4FD00E7F6FF00F7FCFA00F7FC
      FA00FCF7E800F4EFE000F6EFDE00FDF6E500F4F2EA00F5F3EB00F3F2F400F7F6
      F800FDFAFC00FFFCFE00FFFCFC00FFFBFB00FFF8F400FFF8F400FAFFED00FBFF
      EE00EAFFED00EAFFED00FFFFF800FFFFF700FFF7FF00FFF7FF00FAFAFF00FAFA
      FF00F4FFFC00F4FFFC00FFFFEB00FFFFEB000000000000000000FFFDFE00FFFD
      FE00FFFEFE00FFFEFE00FFFFFB00FFFFFB00FFFFF900FFFFF900FBFFF900FAFE
      F800FAFEFC00FBFEFD00FDFEFF00FDFEFF00F8F7FD00F4F4F900FEF2FF00FEF6
      FF00FDF8FD00FDF7FD00FDFAFC00FDF7FD00FEFDFD00FEFDFD00FEFDFC00FDFD
      FC00FDFBFB00FDF9F900FFF9FE00FFFCFE00FFFBFE00FEFBFE00FDFBFF00FBF8
      FF00F9F8FC00FBFAFE00FEFDFE00FDFDFD00FAFDF800F7FAF500FDFFFC00FDFF
      FC00FDFFFE00FDFFFE00FDFBFE00FDFBFE00FDF9FE00FDF9FE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4FEFF00F4FEFF00FAFFFF00FAFF
      FF00FFFFFB00FFFFFB00FFFFF800FFFFF800FFFFF700FFFBF000FCFCF600FFFF
      FB00FAFEFF00F5F9FA00F5FEFF00F6FFFF00EFFEFF00ECFBFF00F3F8F600F7FC
      FA00FFFFF400FFFFF100FFFBEA00FFF9E800FFFDF500FDFBF300F7F6F800FAF9
      FB00FFFDFF00FFFEFF00FFFEFE00FFFDFD00FFFBF700FFFBF700F9FFEC00F8FF
      EB00EAFFED00EAFFED00FFFFF800FFFFF500FFF7FF00FFF7FF00FAFAFF00FAFA
      FF00F4FFFC00F4FFFC00FFFFEB00FFFFEB000000000000000000FFFDFF00FFFD
      FF00FFFEFE00FFFEFE00FFFFFB00FFFFFB00FFFFF900FFFFF900FCFFFA00FBFE
      F900F7FCFA00F8FDFB00FAFCFD00FAFCFD00FBFBFE00FCFCFE00FEF5FF00FFF3
      FF00FBF1FF00FEF4FF00FFFBFF00FFFAFF00FFFCFF00FAF4F900FAF5F600FFFB
      FC00FFFDFE00FEFDFE00FFF9FF00FFFAFF00FFFAFF00FFF9FF00FFFCFF00FEFB
      FF00FDFCFE00FDFCFE00FFFFFE00FFFFFE00FBFEF900F9FDF700FDFFFC00FDFF
      FC00FDFFFF00FDFFFF00FDFBFF00FDFBFF00FDF9FF00FDF9FF00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000C80000002E0000000100010000000000080500000000000000000000
      000000000000000000000000FFFFFF00000000000000FFFFFFFFFFFFF0000000
      000000000000000000000000000000000000C000000000003000000000000000
      0000000000000000000000000000C00000000000300000000000000000000000
      00000000000000000000C0000000000030000000000000000000000000000000
      000000000000C000000000003000000000000000000000000000000000000000
      0000C0000000000030000000000000000000000000000000000000000000CC00
      0000000030000000000000000000000000000000000000000000C00000000000
      30000000000000000000000000000000000000000000C0000000000030000000
      000000000000000000000000000000000000C000000000003000000000000000
      0000000000000000000000000000C00000000000300000000000000000000000
      00000000000000000000C0000000000030000000000000000000000000000000
      000000000000C000000000003000000000000000000000000000000000000000
      0000C0000000000030000000000000000000000000000000000000000000C000
      0000000030000000000000000000000000000000000000000000C00000000000
      30000000000000000000000000000000000000000000C0000000000030000000
      000000000000000000000000000000000000C000000000003000000000000000
      0000000000000000000000000000C00000000000300000000000000000000000
      00000000000000000000C0000000000030000000000000000000000000000000
      000000000000C000000000003000000000000000000000000000000000000000
      0000C0000000000030000000000000000000000000000000000000000000C000
      0000000030000000000000000000000000000000000000000000C00000000000
      30000000000000000000000000000000000000000000C0000000000030000000
      000000000000000000000000000000000000C000000000003000000000000000
      0000000000000000000000000000C00000000000300000000000000000000000
      00000000000000000000C0000000000030000000000000000000000000000000
      000000000000C000000000003000000000000000000000000000000000000000
      0000C0000000000030000000000000000000000000000000000000000000C000
      0000000030000000000000000000000000000000000000000000C00000000000
      30000000000000000000000000000000000000000000C0000000000030000000
      000000000000000000000000000000000000C000000000003000000000000000
      0000000000000000000000000000C00000000000300000000000000000000000
      00000000000000000000C0000000000030000000000000000000000000000000
      000000000000C000000000003000000000000000000000000000000000000000
      0000C0000000000030000000000000000000000000000000000000000000C000
      0000000030000000000000000000000000000000000000000000C00000000000
      30000000000000000000000000000000000000000003C0000000000030000000
      000000000000000000000000000000000003C000000000003000000000000000
      0000000000000000000000000000C00000000000300000000000000000000000
      00000000000000000000C0000000000030000000000000000000000000000000
      000000000000C000000000003000000000000000000000000000000000000000
      0000C00000000000300000000000000000000000000000000000000000000000
      0000000000000000000000000000}
  end
  object IBQActCantidad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select count(*) as cant from aux_embriones where madre = :id and' +
        ' fecha_coleccion = :fecha and usado = '#39'N'#39)
    Left = 12
    Top = 359
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  object IBQCentrosTransplante: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQCentrosTransplanteAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CENTRO_TRANSPLANTE, NOMBRE, MATRICULA,RESPONSABLE from' +
        ' centros_transplante')
    Left = 45
    Top = 359
  end
  object DSCentrosTransplante: TDataSource
    DataSet = IBQCentrosTransplante
    Left = 77
    Top = 359
  end
  object IBQSPGuardarEmbriones: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'EXECUTE PROCEDURE SP_GUARDAR_EMBRIONES(:MADRE,:INTERNA,:EVENTO,:' +
        'CENTRO_TRANSPLANTE,'#39'A'#39')')
    Left = 780
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MADRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CENTRO_TRANSPLANTE'
        ParamType = ptUnknown
      end>
  end
  object IBQVerificarTransferencia: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(*) as cant from aux_animales where VUNO1 = '#39'S'#39)
    Left = 532
    Top = 288
  end
  object IBQSelReceptora: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_animal from aux_animales where VUNO1 = '#39'S'#39)
    Left = 804
    Top = 320
  end
  object IBQExisteDatos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from aux_embriones where madre = :id_madre')
    Left = 148
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_madre'
        ParamType = ptUnknown
      end>
  end
end
