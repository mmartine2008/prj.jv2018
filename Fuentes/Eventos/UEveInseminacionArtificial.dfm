inherited FEveInseminacionArtificial: TFEveInseminacionArtificial
  Left = 105
  Top = 62
  HelpContext = 28000
  Caption = 'SoftVet - Inseminación Artificial.'
  Constraints.MinHeight = 651
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
      ActivePage = TSManga
      inherited TSManga: TTabSheet
        inherited MSimple: TMangazo
          inherited GBFiltro: TGroupBox
            Width = 1050
          end
          inherited PSeleccion: TPanel
            Width = 1050
            inherited GBDisponibles: TGroupBox
              Width = 481
              Height = 0
              inherited IFondoDis: TImage
                Width = 477
                Height = 75
              end
              inherited BDBGDisponibles: TBitDBGrid
                Width = 477
                Height = 75
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
                    Width = 190
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Left = 589
              Width = 461
              Height = 0
              inherited IFondoSel: TImage
                Width = 457
                Height = 75
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 457
                Height = 75
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
                    Width = 190
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Left = 481
              Height = 0
              inherited IFondo: TImage
                Height = 0
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
            Width = 1050
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 1050
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 1050
            inherited Image1: TImage
              Width = 1050
            end
            inherited Label1: TLabel
              Width = 1050
              Height = 21
            end
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
              'Select first 1 *'
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
          Width = 1050
          Height = 297
          Caption = ''
          object GroupBox2: TGroupBox
            Left = 165
            Top = 17
            Width = 835
            Height = 280
            Align = alCustom
            Caption = 'Datos'
            TabOrder = 0
            object LNombre: TLabel
              Left = 20
              Top = 23
              Width = 48
              Height = 15
              Caption = 'Nombre:'
            end
            object LFecha: TLabel
              Left = 20
              Top = 49
              Width = 37
              Height = 15
              Caption = 'Fecha:'
            end
            object LHoraIni: TLabel
              Left = 20
              Top = 75
              Width = 62
              Height = 15
              Caption = 'Hora Inicio:'
            end
            object LHoraFin: TLabel
              Left = 20
              Top = 99
              Width = 50
              Height = 15
              Caption = 'Hora Fin:'
            end
            object LResponsable: TLabel
              Left = 389
              Top = 21
              Width = 85
              Height = 16
              Cursor = crHandPoint
              Caption = 'Responsable:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LResponsableClick
              OnMouseEnter = LResponsableMouseEnter
              OnMouseLeave = LResponsableMouseLeave
            end
            object LCondicionCorporal: TLabel
              Left = 410
              Top = 51
              Width = 167
              Height = 15
              Caption = 'Condición Corporal Promedio:'
            end
            object Label1: TLabel
              Left = 389
              Top = 223
              Width = 32
              Height = 16
              Cursor = crHandPoint
              Caption = 'Toro:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              PopupMenu = PMSemen
              OnClick = Label1Click
              OnMouseEnter = Label1MouseEnter
              OnMouseLeave = Label1MouseLeave
            end
            object LcantDosis: TLabel
              Left = 389
              Top = 251
              Width = 159
              Height = 15
              Caption = 'Cantidad Dosis (por Animal):'
            end
            object IBuscarAnimal: TImage
              Left = 744
              Top = 211
              Width = 73
              Height = 54
              Cursor = crHandPoint
              Picture.Data = {
                0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000004D00
                00003B08060000003E72076C0000001974455874536F6674776172650041646F
                626520496D616765526561647971C9653C00000BE24944415478DAED9B6B6C1C
                D515C7EF636676BD4FC7318458B8699B52AAF2A8545555835AA40A0A097C41D0
                50B5DFB0E043BF19A51FFAC28913A02D3415122D7D0421557D4858B4AA54B531
                044A2B50828328AAA801F549E3048413C7DEF7CCDC57CF9999DDAC37B6B1F731
                36926F727D6777EFDC9DFB9B73EEFD9F7B6729D94C6B4E74BD2FE0FD9836A1B5
                9136A1B59136A1B59136A1B591BA052D6867FFEECC30676417A5F4727C6D4CF0
                D90CE4E9B13F96A6F1C5813D99AB8821D7C1612EF8D8906963CCF183CF548AEB
                0D234E68742C84B50F1ADBDB6894D23AB430452F74088A340A831F9922149370
                3C76E8D8CAF0EEFD5C2207F5776B6DAE837386B52633D0F491C7A6C4F4BA40BB
                FFD66C0E8AAB21EF827C02F2CCB7FF509A59E9FCFD60399CD1A78C36F9C69BC0
                8B063C9A9A5F195AFDB8A80D197DE0D9CA64EB17EDBB3E89EDDF0D75EFD1C6E4
                B039280940833268FE8B3F39298EC70A0D808D4371CF1275F00E1E813C090017
                59C1573E697DFED2ACF5F840DA4E29EC450483D1101C592334ACB25095D69979
                FF57A70AE6E157CE90776EBFC619DCB995DF0675F6C1E7686501AC5668904FFC
                F4A4B8233668006C37144F34FAD74A344C08EC495F91A79EFF476D6EE720B91D
                ACEBFECB0792AEC3A989EE36AD5B5950D2355B1A515061BE2AECAAAF78A9A6FF
                7A59BF7D6DCA6632841580A2580732C5F7E006E9102021006D284E68FBA0C04C
                3CA999270DC30BB201866D316D516AEAFDC78B3E5B12F65C59D816276630E388
                5C9F2575602A417BA66E69E139744DD0EA60FE7BD6ED4B394C0D642C5F2943E1
                9AA82B347785A1354F73849674A8EA4F718FC377C1794580F6B138A1A15B8E63
                BF5E3A2572670A2A095662F24923B767887F4986896CD2520900C868C310C3B1
                040DCB34C61584156416205CBBA5613B2EDC38A9344D70A6F1269EAF48BB50D5
                56C535BC2A084397C41B3308D7069658B31878A92193006D244E68C3504CE185
                9F9C91D9E97775A6B952821BBDA3DFB8570CB2DAD6B42D2C461BE0A2B188EAFA
                9846C346593079B6070D8F9102823B5791CEDB7332B950235CC0C96855498B98
                7C1F9197E42DAFCFA292844DACCB44F0081477C2804E5F9E51D9D76775BA15DC
                3597AACA95DB9255B4B8E6CFC24E625B218DC01AD726399680A661DC32B4E86A
                EB5C513A655773BC58DBA23AD7C7442AC1A4C382E6D035277E3C2546E300D60A
                0DE5C66F205F85565383F1E374C1247CA998030E91B4A9C925B9CCC3F8C52835
                AD0D996642915B7606CD4483BE21022C4EC24DC11B83033FDE14167E6311DE3B
                F2A397C4E1B8802D82D60A2EE86038B583EB85B322C09A810B3E0A1F7D09726E
                1134C88C71F86FE1240227EAD075D1649AA0064D05D32A456B325A0196166898
                542027F0FB437011F702BC3E01AFA6C1BC8E43F9F7478F8BD823898B228208DC
                BE263081C825A14E9B8CEA20D85DADD030716E73C6213E6849A6615D2682638C
                F07D49821B7331341D414317D5E1C9106E91A743FEC16D69D56917846E705EF8
                9D58E2FBC14D50417B5109EFA928CBB094D1B1842CE05C0FB28F135374ECC297
                973539DC5618B512344C969DB0E82291763134E1C3BC18D15A0A1ABE0715A82F
                355A3A811912A6696A5610B7BD8656F40819296972BC27D0D04DB965F3E5A029
                293564B5DC9856B7340456828900C7B03ED0646CFDA04D0B0036AB028F6B2F60
                0768C74834EE2D056D296B6B40831EF99E271BE72C034D6A8D33272F547D3B69
                5B2A976482D3758136F16F4916CDCCED427B3B14B32618D0B12F2DDE08639B85
                E6D618DBEAD0A404812FD585497499D95380959DAF4AA75015563E650B8416B3
                A51501D8D8EB824CB4F6BF1D68F4FA8FF64DF9D27C622045C407FB89974E5095
                B2B9B2F80529825686D6D60C0D7BECFBAE240D170CA4052D7A86BF0682BAEA13
                7EC5565AB93C4FDDAAA7F86CD14FE0790319DB4FD92862298909DA8C3464E455
                9F2CB9DCD40E34F6999DC96766CBE686C00D6180FEEC0E53D896B57C04D7DC62
                B38B069D54520B291489422E0C91DE9AD7C99367C265256CEB5343B4B03D4BBC
                92ABAC79886F1336D35BD2B69FE05445E07B0D6D128E474FBA645929D396A51D
                D893F9DAFFE6D537316A008BA3575F6A2A43FDB69776B86AF6529C0C7052A843
                9360652AF2459C19CB00062C2C3D573568937A479EB8DBB3DC45775FA82AA7E2
                4ABE25E3F85950FF2C64D1536890F7BF500896C15606D0063472F096EC1EF8EE
                27000113D2300616D267710521CEA2F9A0791645212B51660404C3CEC1ECC87C
                50FB4A87D78181374E95154FB3B3452FC120C6DD9A71BCA4451556E821348C2C
                469E9F23AB8A5DDB82760804309CF86678F1605BC1CA06CE0A8B9BA310F458B6
                138C6BA1CC106A511815B9A936D1422F092D70A126ADF325DFC9242DD9DF6709
                8E31A6E919B469ADC81DCFCE925547166DEF11B4CA0EB3441DBC682791B4F118
                C5ACC1B0A9195AF4A779E5169785E6CAC2F185A6FD695BE0026440345A84EC32
                B423474F93FD6BED7B27D0162D8FBF1734DF7505D65A091A76082780B9B2EF80
                60D10320351C704D62BA0E0DF722C67EFFD6C572A2D7D0965C226F8566837B52
                189C7CB726F0BD65A141C9FB72FC9DD93914B4562E65CB7CD2122C5419DD8486
                C1FEE8EFFE43DADEBDEA041A06F36FAE061A1EA37BAE040D3B8BFB02EF823653
                D0CBC14CD24F43E8444857A14DC03963BFFDA7E96865A4A37DCFE618B4536842
                0513807DAEE407DAEC12983571B1B36E855D80B67FE20DF59E72220E68C1DEC2
                7B4183E1DF2821D472D0B0F36865E740CCE2A6094400103671C1A258B3436845
                28EFF8F5B4ECDA6672A7D082BD854EA1A1563B5F11F6799835410EEBAD1036A5
                1DD6089B3A8076020EEFFAE56BB2AB0B951D3F965077D14EA0B902C42CE8B285
                8A8409804B10B4BEC3A3BD9AF6A11DF9F9DFE49AE5445CD0EE84E291FAAA8789
                1AADEFB037430BD6FE71F95C1BD2A807A7790AA185DA6C0BB8661A6258462F84
                4D6B8456C4D9F18957E56427FDEA29B4F13DD93C009A026BD952138A41704939
                843F3888E36673329960286A7D2022B4611048E16A2C0B2406D4EBB3839D2D03
                A113C7C800DDD2E1E16E571BD070497CF4F1577AFB304C779E1ABA39F95082F9
                F702038E4654F2883C5F651E849422974E608FE09F841055A3D7D90091F99250
                5762D86755FA5396A0911E03608635161BD7046D025E8EFDECE5DE6FB474031A
                1FBF993E0A61F95755B41BCA29212D6B9241C730D6F3A5219EC012C6329FE0C2
                BB3790774AB9E4E2ADC1B54043EB7A6C4AB4A5EED713DA2F18215F7EE32C23B3
                554A3E3DA4081A186B7A8C038122B0B3654A5E3C6D932BF392A4C10B0B2E1183
                0356695BCEF1430B5B13347C366DE48727E27B36AD5BD0D8819BE8FDE09ADF38
                354FC989333619CE6BB26B5881ABD55731C205BE8A071AE0B445E65D46AECDFB
                C4171805103174995506681EEE01E8D543033961EEDA10FB9EEDB471DF17E8DE
                A4459EACF92052BDB0D57C1FCC9C3C724B8D6BFE06A0117266013E9418D200C4
                2A7CC688FFA161BB3C98464B23AB8576F89117FD5877D5BB0D0D93F3E01EFA2F
                E8D3707D379C33DA78DE0C37EB700CAB01B4B20BB906C02A842C1408191CA295
                1DDB9C6A3661C9FA42E30AD040DD9BD11FBCE0F54C4EC4098DDE7723DD9B72C8
                9361871B0FC504C0040EFA228206C04A1130C188FCF847EC22864D0EA30D99B1
                0CB4692846BEFF1777A6EDABDC60D030F1FD37D17DE0A6DF3391D094915BE26C
                598399B28256560D815505513B77F2D2F6BCE383A65321A965A14DC0DFB187FF
                EC6E8827C0BBFD3B02EB5B37D0BB111C40CB610CE047C070AC436005ECB645FD
                ED43BC3298B605885B15F15A0A1AD61EFBEE9FAAB1C989F5808689DF7615DDF6
                E101330232E456D0621FF005DDEE4A8ACFE8A94C9AD7B2292E921009F048972D
                F32CC70CBAE3779EABC62A27D60B5ABD5DCCB896E67CFDC6F4431623B7331A3E
                C45217BE2B3C96308903FE83CF5537843BC6056D513A784B7637900996C657F1
                50DFE1079EADAC9B9C584D8AEDB75107F764DEC672056845F83372E8582596E7
                663B497142434BDBBD0CB4404E1C7AA6B2EE726235294E68C1D2F812D08E8C3F
                5DEEC96261AF529CD07063F9581334FC11D9D8F8647943C989D5A4587FEF09E0
                A600DA30FE5C115E8E1E982C6F3839B19A1437B4F1081A02DB90726235296E68
                B9B1A3EF5F58F5B4F973EC36D226B436D226B436D2FF01904953F031E0CAFE00
                00000049454E44AE426082}
              OnClick = IBuscarAnimalClick
            end
            object Label3: TLabel
              Left = 424
              Top = 200
              Width = 297
              Height = 15
              Alignment = taCenter
              AutoSize = False
              Caption = 'Buscar por: RP / HBA / NOMBRE / APODO'
            end
            object Label5: TLabel
              Left = 738
              Top = 184
              Width = 89
              Height = 17
              Cursor = crHandPoint
              Alignment = taCenter
              AutoSize = False
              Caption = 'Buscar Toro'
              WordWrap = True
              OnClick = IBuscarAnimalClick
            end
            object EANombre: TEditAuto
              Left = 85
              Top = 18
              Width = 247
              Height = 23
              CharCase = ecUpperCase
              Color = 14679807
              MaxLength = 50
              TabOrder = 0
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DTPAFechaInicio: TDateTimePickerAuto
              Left = 85
              Top = 44
              Width = 182
              Height = 21
              Date = 38671.532356400470000000
              Time = 38671.532356400470000000
              Color = 14679807
              TabOrder = 1
              OnChange = DTPAFechaInicioChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DTPAHora: TDateTimePickerAuto
              Left = 86
              Top = 71
              Width = 182
              Height = 21
              Date = 0.375000000000000000
              Format = 'hh:mm:ss tt'
              Time = 0.375000000000000000
              Color = clWhite
              DateMode = dmUpDown
              Kind = dtkTime
              TabOrder = 2
              OnChange = MEHorasPostCeloChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object DTPAHoraFin: TDateTimePickerAuto
              Left = 86
              Top = 97
              Width = 182
              Height = 21
              Date = 0.375000000000000000
              Format = 'hh:mm:ss tt'
              Time = 0.375000000000000000
              Color = clWhite
              DateMode = dmUpDown
              Kind = dtkTime
              TabOrder = 3
              OnChange = MEHorasPostCeloChange
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = True
            end
            object DBLCBAResponsable: TDBLookupComboBoxAuto
              Left = 500
              Top = 18
              Width = 239
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_EMPLEADO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSResponsable
              TabOrder = 4
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object CBCondicionCorporal: TCheckBox
              Left = 389
              Top = 47
              Width = 17
              Height = 23
              TabOrder = 5
              OnClick = CBCondicionCorporalClick
              OnKeyPress = CBCondicionCorporalKeyPress
            end
            object DBLCBACondicionCorporal: TDBLookupComboBoxAuto
              Left = 583
              Top = 47
              Width = 156
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_CONDICION_CORPORAL'
              ListField = 'ESCALA'
              ListSource = DMSoftvet.DSCondicionCorporal
              TabOrder = 6
              OnExit = GetEvent
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAToros: TDBLookupComboBoxAuto
              Left = 752
              Top = 31
              Width = 305
              Height = 23
              Color = 14679807
              DropDownRows = 20
              KeyField = 'ID_SEMEN'
              ListField = 'NOM_COMPLETO'
              ListSource = DSToros
              TabOrder = 7
              Visible = False
              OnCloseUp = DBLCBATorosCloseUp
              OnExit = GetEvent
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object EACantDosis: TEditAuto
              Left = 549
              Top = 246
              Width = 36
              Height = 23
              CharCase = ecUpperCase
              Color = 14679807
              MaxLength = 1
              TabOrder = 8
              OnExit = EACantDosisExit
              OnKeyPress = EACantDosisKeyPress
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object CantidadDosis: TDBEdit
              Left = 617
              Top = 244
              Width = 36
              Height = 23
              DataField = 'CANTIDAD'
              DataSource = DSToros
              TabOrder = 9
              Visible = False
            end
            object GBCelo: TGroupBox
              Left = 9
              Top = 129
              Width = 311
              Height = 96
              Caption = 'Celo:'
              TabOrder = 10
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
              object Label2: TLabel
                Left = 13
                Top = 20
                Width = 86
                Height = 15
                Caption = 'Hora post Celo:'
              end
              object Label4: TLabel
                Left = 152
                Top = 20
                Width = 37
                Height = 15
                Caption = 'Horas.'
              end
              object CBRegistrarCelo: TCheckBox
                Left = 11
                Top = 43
                Width = 225
                Height = 18
                Caption = 'Registrar Celo.'
                Ctl3D = True
                ParentCtl3D = False
                TabOrder = 1
                OnClick = CBRegistrarCeloClick
              end
              object MEHorasPostCelo: TEdit
                Left = 112
                Top = 17
                Width = 36
                Height = 23
                MaxLength = 4
                TabOrder = 0
                Text = '00'
                OnChange = MEHorasPostCeloChange
                OnExit = MEHorasPostCeloExit
                OnKeyPress = MEHorasPostCeloKeyPress
              end
            end
            object EBuscarAnimal: TEdit
              Left = 426
              Top = 219
              Width = 305
              Height = 24
              CharCase = ecUpperCase
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 11
              OnKeyPress = EBuscarAnimalKeyPress
            end
            object GroupBox3: TGroupBox
              Left = 389
              Top = 78
              Width = 348
              Height = 103
              Caption = 'Cambio de Ubicacion'
              TabOrder = 12
              object LPotrero: TLabel
                Left = 55
                Top = 27
                Width = 43
                Height = 15
                Cursor = crHandPoint
                Caption = 'Potrero:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = Label6Click
              end
              object Label7: TLabel
                Left = 55
                Top = 64
                Width = 40
                Height = 15
                Cursor = crHandPoint
                Caption = 'Rodeo:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = Label7Click
              end
              object DBLCBAPotrero: TDBLookupComboBoxAuto
                Left = 122
                Top = 27
                Width = 198
                Height = 23
                Color = 14679807
                DropDownRows = 20
                Enabled = False
                KeyField = 'ID_POTRERO'
                ListField = 'NOMBRE'
                ListSource = DMSoftvet.DSPotrero
                TabOrder = 1
                OnExit = GetEvent
                EsClave = False
                EsRequerido = True
                ISParam = False
              end
              object DBLCBARodeos: TDBLookupComboBoxAuto
                Left = 122
                Top = 61
                Width = 198
                Height = 23
                Color = 14679807
                DropDownRows = 20
                Enabled = False
                KeyField = 'ID_RODEO'
                ListField = 'NOMBRE'
                ListSource = DMSoftvet.DSRodeo
                TabOrder = 3
                OnExit = GetEvent
                EsClave = False
                EsRequerido = True
                ISParam = False
              end
              object CBPotrero: TCheckBox
                Left = 32
                Top = 27
                Width = 15
                Height = 19
                TabOrder = 0
                OnClick = CBPotreroClick
              end
              object CBRodeo: TCheckBox
                Left = 32
                Top = 64
                Width = 18
                Height = 18
                TabOrder = 2
                OnClick = CBRodeoClick
              end
            end
          end
          object GroupBox1: TGroupBox
            Left = 2
            Top = 17
            Width = 163
            Height = 278
            Align = alLeft
            Caption = ' Eventos  '
            TabOrder = 1
            object LSincronizacion: TLabel
              Left = 14
              Top = 43
              Width = 117
              Height = 13
              Cursor = crHandPoint
              Caption = 'Sincronización de Celo...'
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
              Left = 14
              Top = 112
              Width = 132
              Height = 13
              Cursor = crHandPoint
              Caption = 'Aplicación de Tratamiento...'
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
              Left = 14
              Top = 185
              Width = 97
              Height = 13
              Cursor = crHandPoint
              Caption = 'Detección de Celo...'
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
        end
        inherited GBObservaciones: TGroupBox
          Top = 288
          Height = 112
          Align = alCustom
          inherited MAObservacion: TMemoAuto
            Height = 93
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Options = [dgEditing, dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TitleFont.Height = -1
          RealTitleFont.Height = -1
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Rp'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_SENASA'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Senasa'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Alignment = taCenter
              Title.Caption = 'Fecha'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'H1'
              Title.Alignment = taCenter
              Title.Caption = 'Hora Inicio'
              Width = 66
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'H2'
              Title.Alignment = taCenter
              Title.Caption = 'Hora Fin'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TORO'
              Title.Alignment = taCenter
              Title.Caption = 'Toro'
              Width = 199
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'I1'
              Title.Alignment = taCenter
              Title.Caption = 'Cant. Dosis.'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONDICION'
              Title.Alignment = taCenter
              Title.Caption = 'Condición Corporal'
              Width = 155
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V1'
              Title.Alignment = taCenter
              Title.Caption = 'Responsable'
              Width = 170
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Alignment = taCenter
              Title.Caption = 'Observación'
              Width = 200
              Visible = True
            end>
        end
      end
    end
    inherited PBotones: TPanel
      inherited SBSelTodos: TSpeedButton
        Left = 586
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
    Caption = 'Inseminación Artificial'
  end
  inherited ALUniversal: TActionList
    Left = 555
    Top = 14
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 140
    Top = 15
  end
  inherited DSSimple: TDataSource
    Left = 320
    Top = 32
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_RP = :OLD_ID_RP')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (FECHA, ID_RP, ID_SENASA, I1, I2, H1, RESPONSABLE, OBSERVACION' +
        ', H2)'
      'values'
      
        '  (:FECHA, :ID_RP, :ID_SENASA, :I1, :I2, :H1, :RESPONSABLE, :OBS' +
        'ERVACION, '
      '   :H2)')
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
      '  H2'
      'from AUX_EVENTOS '
      'where'
      '  ID_RP = :ID_RP')
    SelectSQL.Strings = (
      
        'select FECHA, ID_RP, ID_SENASA, V1, I1, I2, EW, H1, I3 as Hora_p' +
        'ost_celo, ID_ANIMAL,responsable,I4 as INCOND, V2 as CONDICION, I' +
        '5 as IDTORO, V3 as TORO, OBSERVACION, H2'
      ' from AUX_EVENTOS order by fecha')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  FECHA = :FECHA,'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  I1 = :I1,'
      '  I2 = :I2,'
      '  H1 = :H1,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  OBSERVACION = :OBSERVACION,'
      '  H2 = :H2'
      'where'
      '  ID_RP = :OLD_ID_RP')
    Left = 276
    Top = 30
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
    end
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
    object IBDSSimpleV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleCONDICIONSetText
      Size = 100
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
      OnSetText = IBDSSimpleI1SetText
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
    object IBDSSimpleHORA_POST_CELO: TIntegerField
      FieldName = 'HORA_POST_CELO'
      Origin = 'AUX_EVENTOS.I3'
    end
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleINCOND: TIntegerField
      FieldName = 'INCOND'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleCONDICION: TIBStringField
      FieldName = 'CONDICION'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleCONDICIONSetText
      Size = 100
    end
    object IBDSSimpleIDTORO: TIntegerField
      FieldName = 'IDTORO'
      Origin = 'AUX_EVENTOS.I5'
    end
    object IBDSSimpleTORO: TIBStringField
      FieldName = 'TORO'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = IBDSSimpleCONDICIONSetText
      Size = 100
    end
    object IBDSSimpleOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EVENTOS.OBSERVACION'
      OnSetText = SetText
      Size = 255
    end
    object IBDSSimpleH2: TTimeField
      FieldName = 'H2'
      Origin = 'AUX_EVENTOS.H2'
    end
    object IBDSSimpleH1: TTimeField
      FieldName = 'H1'
      Origin = 'AUX_EVENTOS.H1'
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 736
    Top = 70
  end
  inherited IBQValidaciones: TIBQuery
    Left = 404
    Top = 30
  end
  inherited IBQEvento: TIBQuery
    Left = 52
  end
  inherited SDXLS: TSaveDialog
    Left = 182
    Top = 13
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
        Title = 'Senasa'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'H1'
        Title = 'Hora Inicio'
      end
      item
        DataField = 'H2'
        Title = 'Hora Fin'
      end
      item
        DataField = 'TORO'
        Title = 'Toro'
      end
      item
        DataField = 'I1'
        Title = 'Cant. Dosis'
      end
      item
        DataField = 'CONDICION'
        Title = 'Cond. Corporal'
      end
      item
        DataField = 'V1'
        Title = 'Responsable'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observacion'
      end>
    Title.Text = 'Evento Inseminación Artificial'
    Left = 96
    Top = 17
  end
  inherited WinXP1: TWinXP
    Left = 448
    Top = 32
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 364
    Top = 31
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 396
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 524
    Top = 407
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 332
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      
        'select first 1 * from RN_INSEMINACION_ARTIFICIAL (:esta,:ANIMAL, :fecha,' +
        ' :semen,:nombre)')
    Left = 656
    Top = 70
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
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
        Name = 'semen'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 640
    Top = 14
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE  PROCEDURE SP_EVE_INSEMINACION('
      ' :FECHA , :CANTIDAD,  :OBSERVACION , :SEMEN, :PRECIO, '
      
        ' :RESPONSABLE, :TIPO, :ANIMAL,:ID_GRUPO, :ESTABLECIMIENTO, :LOG_' +
        'USUARIO ,  :SERVICIO, :CONDICION_CORPORAL, :HORA, :HORA_FIN,:HOR' +
        'A_POST_CELO, :LOG_FECHA_MODIFICADO,:RODEO,:POTRERO)')
    Left = 552
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANTIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESPONSABLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOG_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERVICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONDICION_CORPORAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA_FIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HORA_POST_CELO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOG_FECHA_MODIFICADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RODEO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end>
  end
  inherited IBSPActEventos: TIBStoredProc
    Left = 380
    Top = 407
  end
  inherited OpenDlg: TOpenDialog
    Left = 156
    Top = 344
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 588
    Top = 456
  end
  inherited IBQRepetidos: TIBQuery
    Left = 724
    Top = 406
  end
  inherited TimerLector: TTimer
    Left = 720
  end
  inherited IBQImportacion: TIBQuery
    Top = 54
  end
  inherited IBQIE: TIBQuery
    Left = 772
    Top = 405
  end
  inherited ILVets: TImageList
    Left = 484
    Top = 180
  end
  object IBQToros: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    OnCalcFields = IBQTorosCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select A.ID_RP, A.Apodo, S.cantidad, S.animal, S.animal_externo,' +
        ' S.id_semen, S.cantidad, cast(''I'' as varchar(1)) as tipo from ta' +
        'b_semen S'
      ''
      'JOIN Tab_animales A ON S.Animal = A.ID_ANIMAL'
      ''
      
        'where ((S.establecimiento = :idEstablecimiento) and (S.cantidad ' +
        '> 0))'
      ''
      'UNION'
      ''
      
        'select AE.ID_RP, AE.Apodo, S.cantidad, S.animal, S.animal_extern' +
        'o, S.id_semen, S.cantidad, cast(''E'' as varchar(1)) as tipo from ' +
        'tab_semen S'
      ''
      
        'JOIN Tab_animales_externos AE ON S.Animal_externo = AE.ID_ANIMAL' +
        '_externo'
      ''
      
        'where ((S.establecimiento = :idEstablecimiento) and (S.cantidad ' +
        '> 0))')
    Left = 548
    Top = 454
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idEstablecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idEstablecimiento'
        ParamType = ptUnknown
      end>
    object IBQTorosID_RP: TIBStringField
      FieldName = 'ID_RP'
      Required = True
      Size = 10
    end
    object IBQTorosAPODO: TIBStringField
      FieldName = 'APODO'
      Size = 50
    end
    object IBQTorosCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object IBQTorosANIMAL: TIntegerField
      FieldName = 'ANIMAL'
    end
    object IBQTorosANIMAL_EXTERNO: TIntegerField
      FieldName = 'ANIMAL_EXTERNO'
    end
    object IBQTorosID_SEMEN: TIntegerField
      FieldName = 'ID_SEMEN'
      Required = True
    end
    object IBQTorosCANTIDAD1: TIntegerField
      FieldName = 'CANTIDAD1'
    end
    object IBQTorosTIPO: TIBStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
    object IBQTorosNOM_COMPLETO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOM_COMPLETO'
      Size = 100
      Calculated = True
    end
  end
  object DSToros: TDataSource
    DataSet = IBQToros
    Left = 596
    Top = 406
  end
  object IBSPAjusteSemen: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    ForcedRefresh = True
    StoredProcName = 'SP_MOVIMIENTO_SEMEN'
    Left = 668
    Top = 406
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SEMEN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUEVACANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CENTRO_INSEMINACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end>
  end
  object IBSPRegistrarCelo: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'SP_DETECCION_CELO'
    Left = 940
    Top = 190
    ParamData = <
      item
        DataType = ftDate
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANIMAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ESTABLECIMIENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESPONSABLE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'LOG_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'LOG_FECHA_MODIFICADO'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'HORA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_GRUPO'
        ParamType = ptInput
      end>
  end
  object IBQAjusteSemen: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'EXECUTE  PROCEDURE SP_MOVIMIENTO_SEMEN( :SEMEN, :NUEVACANTIDAD, ' +
        ':FECHA, :PRECIO, :TIPO )')
    Left = 668
    Top = 454
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SEMEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUEVACANTIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
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
    Left = 628
    Top = 456
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
  object IBQTorosGrilla: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    OnCalcFields = IBQTorosGrillaCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select S.id_semen, A.id_rp,  A.apodo, S.cantidad from tab_semen ' +
        'S'
      'JOIN Tab_animales A ON S.Animal = A.ID_ANIMAL'
      'where S.establecimiento = :idEstablecimiento and S.cantidad > 0'
      'UNION'
      
        'select  S.id_semen, AE.id_rp, AE.apodo, S.cantidad from tab_seme' +
        'n S'
      
        'JOIN Tab_animales_externos AE ON S.Animal_externo = AE.ID_ANIMAL' +
        '_externo'
      'where S.establecimiento = :idEstablecimiento and S.cantidad > 0')
    Left = 188
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idEstablecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idEstablecimiento'
        ParamType = ptUnknown
      end>
    object IBQTorosGrillaID_SEMEN: TIntegerField
      FieldName = 'ID_SEMEN'
      Required = True
    end
    object IBQTorosGrillaNOM_COMPLETO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOM_COMPLETO'
      Size = 100
      Calculated = True
    end
    object IBQTorosGrillaID_RP: TIBStringField
      FieldName = 'ID_RP'
      Required = True
      Size = 10
    end
    object IBQTorosGrillaAPODO: TIBStringField
      FieldName = 'APODO'
      Size = 50
    end
    object IBQTorosGrillaCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
  end
  object DSTorosParaGrilla: TDataSource
    DataSet = IBQTorosGrilla
    Left = 228
    Top = 344
  end
  object IBQTipoCond: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select valor from rel_parametros_establecimiento where parametro' +
        '=3 and establecimiento=:esta')
    Left = 396
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQCantSemen: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select cantidad, animal from tab_semen where (id_semen=:id and e' +
        'stablecimiento=:esta)')
    Left = 436
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object PMSemen: TPopupMenu
    Left = 332
    Top = 240
    object Compra: TMenuItem
      Caption = 'Compra'
      OnClick = CompraClick
    end
    object Extraccion: TMenuItem
      Caption = 'Extración'
      OnClick = ExtraccionClick
    end
  end
  object IBQUpdateAuxEventos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update aux_eventos set V3=:toro where V3=:toro')
    Left = 484
    Top = 407
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'toro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'toro'
        ParamType = ptUnknown
      end>
  end
  object IBQValidacionGrilla: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    OnCalcFields = IBQValidacionGrillaCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select S.id_semen, A.id_rp,  A.apodo, S.cantidad from tab_semen ' +
        'S'
      'JOIN Tab_animales A ON S.Animal = A.ID_ANIMAL'
      'where S.establecimiento = :idEstablecimiento'
      'UNION'
      
        'select  S.id_semen, AE.id_rp, AE.apodo, S.cantidad from tab_seme' +
        'n S'
      
        'JOIN Tab_animales_externos AE ON S.Animal_externo = AE.ID_ANIMAL' +
        '_externo'
      'where S.establecimiento = :idEstablecimiento')
    Left = 188
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idEstablecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idEstablecimiento'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ID_SEMEN'
      Required = True
    end
    object IBQValidacionGrillaNOM_COMPLETO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOM_COMPLETO'
      Size = 100
      Calculated = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'ID_RP'
      Required = True
      Size = 10
    end
    object IBStringField2: TIBStringField
      FieldName = 'APODO'
      Size = 50
    end
    object IntegerField2: TIntegerField
      FieldName = 'CANTIDAD'
    end
  end
  object IBQTorosAux: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 985
    Top = 265
  end
  object IBQActualizarGrupo: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update tab_grupos set visible = 0 where id_grupo = :id')
    Left = 928
    Top = 89
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
