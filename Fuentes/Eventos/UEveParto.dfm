inherited FEveParto: TFEveParto
  Left = 109
  Top = 51
  HelpContext = 24000
  Caption = 'Evento Parto'
  ClientWidth = 998
  Constraints.MinHeight = 651
  Constraints.MinWidth = 792
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 998
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
    Width = 614
  end
  inherited PError: TPageControl
    Width = 998
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 990
      end
    end
  end
  inherited PDatos: TPanel
    Width = 998
    inherited PCBasico: TPageControl
      Width = 998
      ActivePage = TSNacimientos
      TabOrder = 0
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 990
        end
        inherited MSimple: TMangazo
          Width = 990
          inherited GBFiltro: TGroupBox
            Width = 990
          end
          inherited PSeleccion: TPanel
            Width = 990
            inherited GBSeleccionados: TGroupBox
              Width = 433
              inherited IFondoSel: TImage
                Width = 429
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 429
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
            Width = 990
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 990
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 990
            inherited Image1: TImage
              Width = 990
            end
          end
          inherited JvROBusquedaAvanzada: TJvRollOut
            FAWidth = 145
            FAHeight = 170
            FCWidth = 22
            FCHeight = 22
          end
        end
      end
      inherited TSDatos: TTabSheet
        Caption = 'Parto'
        ImageIndex = 8
        inherited GBDatos: TGroupBox
          Width = 990
          Height = 321
          object LFecha: TLabel
            Left = 64
            Top = 75
            Width = 40
            Height = 15
            Caption = 'Fecha: '
            Layout = tlCenter
          end
          object LResponsable: TLabel
            Left = 24
            Top = 109
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
            Layout = tlCenter
            OnClick = LResponsableClick
            OnMouseEnter = LResponsableMouseEnter
            OnMouseLeave = LResponsableMouseLeave
          end
          object LRPAnimal: TLabel
            Left = 43
            Top = 41
            Width = 64
            Height = 15
            Caption = 'RP Animal: '
            Layout = tlCenter
          end
          object LabelRPAnimalValor: TLabel
            Left = 117
            Top = 41
            Width = 92
            Height = 13
            Caption = 'RP Animal Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LTipoParto: TLabel
            Left = 43
            Top = 137
            Width = 62
            Height = 15
            Caption = 'Tipo Parto: '
            Layout = tlCenter
          end
          object LCantidad: TLabel
            Left = 51
            Top = 174
            Width = 56
            Height = 15
            Caption = 'Cantidad: '
            Layout = tlCenter
          end
          object LPadres: TLabel
            Left = 661
            Top = 83
            Width = 40
            Height = 15
            Caption = 'Padres'
            Layout = tlCenter
            Visible = False
          end
          object Label2: TLabel
            Left = 704
            Top = 62
            Width = 58
            Height = 15
            Caption = 'RP Animal'
            Layout = tlCenter
            Visible = False
          end
          object Label3: TLabel
            Left = 773
            Top = 62
            Width = 38
            Height = 15
            Caption = 'Interno'
            Layout = tlCenter
            Visible = False
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 117
            Top = 67
            Width = 162
            Height = 21
            Date = 38657.411226122680000000
            Time = 38657.411226122680000000
            Color = 14679807
            TabOrder = 0
            OnCloseUp = DTPAFechaCloseUp
            OnChange = DTPAFechaChange
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 117
            Top = 100
            Width = 162
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 1
            OnCloseUp = DBLCBAResponsableCloseUp
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBATipoParto: TDBLookupComboBoxAuto
            Left = 117
            Top = 131
            Width = 162
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_TIPO_PARTO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSTiposParto
            TabOrder = 3
            OnCloseUp = DBLCBATipoPartoCloseUp
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object EACantidadNacimientos: TEditAuto
            Left = 117
            Top = 166
            Width = 144
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            ReadOnly = True
            TabOrder = 4
            Text = '1'
            OnChange = EACantidadNacimientosChange
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object UDNacidos: TUpDown
            Left = 261
            Top = 166
            Width = 16
            Height = 23
            Associate = EACantidadNacimientos
            Min = 1
            Max = 3
            Position = 1
            TabOrder = 2
          end
          object GBPadres: TGroupBox
            Left = 806
            Top = 96
            Width = 217
            Height = 173
            Caption = ' Padres seleccionados '
            TabOrder = 6
            Visible = False
            object BDBGPadresAutoCalculados: TBitDBGrid
              Left = 2
              Top = 17
              Width = 213
              Height = 154
              Align = alClient
              DataSource = DSPadresAutoCalculados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Visible = False
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
              RealTitleFont.Height = -8
              RealTitleFont.Name = 'MS Sans Serif'
              RealTitleFont.Style = []
              RunTimePropEditor = True
              ShowCellHint = True
              TitleBtn = tbNone
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ID_RP'
                  Title.Caption = 'RP Animal'
                  Width = 99
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'INTERNO'
                  Title.Caption = 'Interno '
                  Width = 83
                  Visible = True
                end>
            end
          end
          object CBPadresAutoCalculados: TCheckBox
            Left = 289
            Top = 17
            Width = 216
            Height = 36
            Caption = 'Establecer padres manualmente'
            TabOrder = 5
            WordWrap = True
            OnClick = CBPadresAutoCalculadosClick
          end
          object DBLCBACondCorp: TDBLookupComboBoxAuto
            Left = 116
            Top = 199
            Width = 162
            Height = 23
            Color = 14679807
            DropDownRows = 20
            Enabled = False
            KeyField = 'ID_CONDICION_CORPORAL'
            ListField = 'ESCALA'
            ListSource = DMSoftvet.DSCondicionCorporal
            TabOrder = 7
            OnExit = GetEvent
            EsClave = False
            EsRequerido = True
            ISParam = False
          end
          object CBCondCorp: TCheckBox
            Left = 17
            Top = 205
            Width = 84
            Height = 18
            Caption = 'Cond. Corp.'
            TabOrder = 8
            OnClick = CBCondCorpClick
          end
          object GBMadreB: TGroupBox
            Left = 291
            Top = 232
            Width = 688
            Height = 81
            Caption = ' Madre Biol'#243'gica '
            TabOrder = 9
            object Label6: TLabel
              Left = 26
              Top = 43
              Width = 61
              Height = 15
              Caption = 'RP Animal:'
            end
            object Label7: TLabel
              Left = 235
              Top = 38
              Width = 41
              Height = 15
              Caption = 'Interna:'
            end
            object LRPMadreB: TLabel
              Left = 95
              Top = 43
              Width = 4
              Height = 15
              Caption = '-'
            end
            object LInternaMadreB: TLabel
              Left = 287
              Top = 38
              Width = 4
              Height = 15
              Caption = '-'
            end
          end
          object GBPadre: TGroupBox
            Left = 290
            Top = 61
            Width = 688
            Height = 169
            Align = alCustom
            Caption = ' Padre '
            TabOrder = 10
            Visible = False
            object LNombrePadre: TLabel
              Left = 825
              Top = 133
              Width = 55
              Height = 21
              AutoSize = False
              Caption = 'Nombre: '
              Layout = tlCenter
              Visible = False
            end
            object LApodoPadre: TLabel
              Left = 825
              Top = 101
              Width = 55
              Height = 21
              AutoSize = False
              Caption = 'Apodo: '
              Layout = tlCenter
              Visible = False
            end
            object LSenansaPadre: TLabel
              Left = 825
              Top = 69
              Width = 55
              Height = 21
              AutoSize = False
              Caption = 'Senasa: '
              Layout = tlCenter
              Visible = False
            end
            object LPCPadre: TLabel
              Left = 1121
              Top = 37
              Width = 55
              Height = 21
              AutoSize = False
              Caption = 'PC: '
              Layout = tlCenter
              Visible = False
            end
            object LHBAPadre: TLabel
              Left = 1121
              Top = 69
              Width = 55
              Height = 21
              AutoSize = False
              Caption = 'HBA: '
              Layout = tlCenter
              Visible = False
            end
            object LRAPadre: TLabel
              Left = 1121
              Top = 101
              Width = 55
              Height = 21
              AutoSize = False
              Caption = 'RA: '
              Layout = tlCenter
              Visible = False
            end
            object LOtroPadre: TLabel
              Left = 1121
              Top = 133
              Width = 55
              Height = 21
              AutoSize = False
              Caption = 'Otro: '
              Layout = tlCenter
              Visible = False
            end
            object LRPPadre: TLabel
              Left = 825
              Top = 37
              Width = 55
              Height = 21
              AutoSize = False
              Caption = 'RP Animal: '
              Layout = tlCenter
              Visible = False
            end
            object SBPadre: TSpeedButton
              Left = 839
              Top = 197
              Width = 91
              Height = 22
              Caption = 'Padres Externos'
              Visible = False
            end
            object JvFullColorLabel1: TJvFullColorLabel
              Tag = 1
              Left = 316
              Top = 141
              Width = 155
              Height = 23
              Cursor = crHandPoint
              LabelColor = 72789023
              Brush.Color = 5680159
              Shape = stRoundSquare
              Caption = 'Padre Interno'
              ShapeWidth = 22
              ShapeHeight = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object JvFullColorLabel2: TJvFullColorLabel
              Tag = 1
              Left = 316
              Top = 173
              Width = 155
              Height = 23
              Cursor = crHandPoint
              LabelColor = 72789023
              Brush.Color = 5680159
              Shape = stRoundSquare
              Caption = 'Padre Externo'
              ShapeWidth = 22
              ShapeHeight = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object LSeleccionP: TLabel
              Left = 13
              Top = 128
              Width = 150
              Height = 19
              Caption = 'Padre Sleccionado:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object LBusqueda: TLabel
              Left = 32
              Top = 53
              Width = 148
              Height = 15
              Caption = 'RP / HBA / Nombre / Apodo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object IBuscarP: TImage
              Left = 496
              Top = 16
              Width = 69
              Height = 60
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
              Visible = False
              OnClick = Button3Click
            end
            object LBuscarP: TLabel
              Left = 480
              Top = 80
              Width = 97
              Height = 33
              Cursor = crHandPoint
              Alignment = taCenter
              AutoSize = False
              Caption = 'Buscar Padre'
              Visible = False
              WordWrap = True
              OnClick = Button3Click
            end
            object IAgregarP: TImage
              Left = 600
              Top = 16
              Width = 69
              Height = 60
              Cursor = crHandPoint
              Picture.Data = {
                0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000004D00
                00003B08060000003E72076C000000097048597300000B1300000B1301009A9C
                1800000A4F6943435050686F746F73686F70204943432070726F66696C650000
                78DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A
                2109104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807
                E421A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C008
                0C9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173
                FD230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA4299
                5C01808401C07491384B08801400407A8E42A600404601809D98265300A00400
                60CB6362E300502D0060277FE6D300809DF8997B01005B94211501A091002013
                65884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0
                B700C0CE100BB200080C00305188852900047B0060C8232378008499001446F2
                573CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE4917
                2B14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE
                0EAECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C
                2FB31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370
                F87E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E
                3CFCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FC
                B70BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525
                D2FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F7
                0000F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E
                44242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC60
                36844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C0
                51688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA88
                01628A58238E08179985F821C14804128B2420C9881451224B91354831528A54
                2055481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB5
                43B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA
                8F3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB0
                56AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A8
                201C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C
                23D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E52
                23E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE4
                21F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52
                DDA8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D3
                1A681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D8615
                83C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F
                996F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB
                548FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67
                A86F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C21
                6B0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B3
                52F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB9
                31655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C7
                4A275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB44
                77BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C58
                06B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E1
                8491B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4D
                EE9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79B
                DFB7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB3
                46AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D8
                06DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB
                1D5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B6
                13CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8
                BDE44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F29
                9E593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F
                9157ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7
                C8B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02
                FBF87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8
                EC90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C278587855786
                3F8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A
                3EAA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBE
                DFFCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A9640
                4C884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D843
                5C2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B
                3A9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC65
                85B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B267
                655766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5
                864B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD5
                4FABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED
                5D4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCA
                BF99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB4
                0DDF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54
                A454F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BE
                DB5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D2
                03FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D
                558D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F
                6A429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C5979
                4AF354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A
                0F6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F
                6DEA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDD
                F4BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD977
                27EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47
                F7068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA7
                43CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7C
                A5FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4F
                E47C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB00000004
                67414D410000B18E7CFB5193000011B64944415478DAED9B09705CC59980FF7E
                D75CD28C2C8D648FB02CE343E060300BC68559700C36608359BC06CCC266A1CA
                81A5C86E0A13932A12886C190C59676109241CF15636610BB218B3840D60610C
                2440E183409C02E1036F626B2CC9E8D68CE67A57EFFFF77B339A112361C991EC
                AD724B3DEF987EFD5E7FFDFFFDFF7FF71BC63987536964899D8236F2740ADA28
                D22968A348A7A08D229D82368A24A031C68EBB1EFA58BBA4A44696603ED63799
                8EDDFE88626EAA7F3DDE4407EB96969C051C2EC2DDA0F89A43133EC307EBB725
                62271AC6B124C1EB2F008DD53BB0D6602D37E408629D0542EC1ED80E28C86DB8
                7890186E1A71BFFE8137878777F7259E20965F62DBFC22BCA6C6B6218A556F7A
                7297D17442A03D7875691037B331CFC7BC0373F4FED7E2D1E180AD45C99125B6
                85DB3C943B89BC98E0C1F2EF361CB4EC7ECCE6B07AC3F644E3E01BAD59E0A5FA
                6FC3B2B7DB9C07A93ADC0242C3ADA8FEFAA7771B1F8C2B3404D680E76E2F528E
                7A7013E64604582005379FA75C5A55AAFC7B7940F55BD40A1786C41C70304268
                54A437692A2D3DFA73CD7DFC471FB540DB8AB3B5F0F40A7939965983DF939409
                5883A161DEF1CC6EE3BA7183B6615970091EFF3CF785BB1DA4B404EC05DD822D
                EF1C48754D0FC30A94AE0727977BD39ACCB8DBDB2C2B6562CB462C696061819E
                A4A126754B8EA7EC8F2795A9E7F855C9746009508CCA6016CF8E1D643B000110
                5AF578425B83C7942163DA52C6E4129D571186AA48B6C218CFB69F1EBA236EA8
                5DFD86AAC8C0C3259A11F429A62D444570E6594973AE6123829605F3E78EB4CF
                AF49567989A25B1667F84C2C6DD872DAE02C95B16582E6D59855E6973332DE0B
                AF8B21B433C7131AA96503B56B67B3116CE9B3BC28253CE4E566A404F4CA12C9
                28F52A9607014A2C2788CE584282C573E30AC112591208472E69544F1A3BCEB4
                6CE691259B3AB13B61AA7D495B49A4B99C34402295A48E09E3B3A124A61409B5
                944323425B359ED06AF078173DF8EEA859DAF4855D925FD02373BBB68CA76786
                A5544540351489E5C0B96311B3B3631A73644B12C67374D0689F2810B8CE84A9
                B57699DEDE14C8065E4C52E55580877C605686948C4F61A6DB961362081EC373
                2B7140671F46ADD2CFDAEDC060706757598933267A9324710515894612218786
                90C691B91C45A0D9386E71164BDB4A67CCD4FAD3B64C5DA02ACC0EFA24C3EF91
                4C4D12D5916A6E7E6A97B17AAC81158346EEC64B98CF22A949E1F871A48F7B74
                D392345408AFCA78D02B9B211CBF24C678B1CA72C955CBE383C6DD419F838112
                6762A750C7D0C04F9D2239778CE1B94D3FDD693C321EC0BE048D523E38D140C7
                B4A3EA3956116145F181B7E25737620E165486599264FC57C888E085B6A3BA24
                3279504555E2868CA489DB166219048D9225DC09BABF03CEE5DE87C73BF0A809
                C5EB03DC7EFAC407C6B8461245230217DC9A3C30C2C905C74F6B74CB10D8F983
                A15192655596648C0FBE74B36C39EEC2E1DCD0751344C77C199AED422315B59D
                8B31DC82379CE716DD32D84F1B7074C575CE3D694BE7452758A23E778BE72C37
                9BCED674F74DCC065E9BC1AC936172F7D378F3B8C51F195518351C344A8AEA51
                D8A04A07433374B48B2EAD62D0E81C1660BA6993A4035A4834D38C0FE3DC8E35
                B458066055CCE21F8C093452535951E5A1A059A66963B6861AD3B29246C0E268
                08680CF3A14F269D38684D06026BB728CE1D65C08ED0DE0477DC2B06AD98B4E5
                A0618BF44CC6CC5D330434D3B6C972CA7D495DF5AA8A15F44A86CC4E08B4CDFF
                6BC2EA81768C1E5AABE3CC7231A0535B06D721CB0A899B3470331786890EBE69
                0D18D121ACA78152D69D34B5BEA4A184FCAA41D0C659D26208ACFE330336176A
                CCE8A0B10575BE5DBAC9E794FBC1985A06998087597E55B61479C01521292369
                CB87462DD6F5B409391514AE058B65B8FC093AD4491DE499152C3139C4D2C98C
                25B7C7740F5D575EA2EA7E959C5806E3042D6A7258F5071DBE34DD345A68D285
                D3BDDBDAFBF922A18638405F5CCBFB26962A3A81CB0F02F2555434D2326DC334
                2C70432E0A910EF5D8DEDD2DCEB412D535B79AF5454A21134F5B4A0FC6B71E55
                B2270454DD2333CB053FD6D01A717FF5EE34147565462D69EB9696DC73B8C7FA
                3E450D28716C76154F5497A99980265BF955913120A3908566A29459AE2E9265
                EC4730286181AE242799B46B43908E94CA6952F7DEA4A525D2A63CA144D34BD1
                FB971C16630A0DF3DAF7FAC434D89069D463DAFAAB4A97E2BD7F8E0824C3E492
                8412E253640B439C027B906F45C99135C9CD1077761A87D651D2D1DBB76C473E
                29F0265399C8D852472CE39130C6AD28D1325E85590CB2930263028D228B55EF
                74C157C6AEA386F6003AC078C53EE7E1F16231B34156A1B01E86418FA26A625C
                73DC0CC32A08A35C35B5B93BD10B8E04F6A64CA53BAE6B255EC52CF329864C31
                261F33684DB605D76D6F87638A2C8E6B8D60B0DB516C4D8B1E5AF37855DA2767
                9653D8940FCDFDC89FB9A569A1AE7E43D30D9B9505548326201964610D0FED8E
                9777459ADA3F85CFBB3E87685F337426BAC57DC28172A8094D81991533E1ACAA
                D9D070F1796D2EB44DAF47F9DAC1CF3D1C8FE38556303DFE55D0F474DAA052C3
                4123292003D0D5AF6BE8B0D8E5E86A68A89AC08787B6F257DB23BFFBD36F21CD
                5270FE94B930A37C2644FC112853CBC47D7A8D5E684BB6C1C1EECFE1A3E6DF83
                97FBE0EBD316C282A90B8A367C2CA1159D221F0C4D45F5643838E9E99441E786
                84865BD91794DBDABBC8A155827ED50C79154372BC8CA2D0EE7BE348E4A5A697
                E068BA0D16CD5C0C53CBA64273A619DA326DD0A97742DC7434AE540942580B43
                C41381299E2970A8F710BCF5F97671BC62F6755019A82C003096D02898DF772C
                D0689FD47338680484D605BE40DFCC42F1099778F500864EEE737E09DAEADFEC
                8F3CFBF1B35033B1062EA95D00FB929FC1DEFEBD18F264062A1EC090DB78252F
                CC0A9C0967FABF06EF1D7A17A2ED51B8E5BC5BA0B66C6A0EC2984173C1E562D0
                E3856658C200A89D715DF86695683569B2332B85F9D0EEDD1A8D3CBDEB29A83B
                AD0EA6544E818F621F41B7D19D9B6FEF8DF5424F5FAF98D6CB4EC19705CB2014
                0C81B0EF78A25C2D87F382E743B4A319F61FD90F775EF8AD9CC48D3534B1B6F0
                55D070F8E7966158434123C92129EB446796164D3002C0B049362437D61C0C6D
                C6C64723B25F8159D5B3E09DCE77D0329A8E18494EC587A3876175F86EF0783C
                18CE39F3060F4537406D75AD58BC202B4F168966B02E2DBF0CF6B6EE052B6912
                B8718126D6168E171AF96ADD0943ED46AB89EEB05D81615340937261533EB465
                FFB135B2F54FAFC34DE7DD0C6F77BF0D3D99EE811BBACD686E69867B277F0F2A
                2A2AC0E7F38973FFB4F35B507B5A6D6E1D239B2668E5701982FBD5C7CFC3D269
                57C1C2690BD9984273C109153D1E6869039D59F4CB7A13261A00D9448756D764
                77AD661034FFFDDF8D9C3B6D0EA4D50C7CDAF7491E3096ABB0B9350AF5A7D743
                241281D2D252F1F537DEF806D49C560379D1B17373DCCC0E9E0D5EDD0B7BFEBC
                07D65FBE7E5CA0ADC4CD63D9598F6C476657D8F3A189B97F9A3EB779AEC3A9A9
                198BA039BED90454CD00C6B0121B089BB2D06E7CEEFDC8A63F6C82BF9F77336C
                3BBA0D745BCF939AEC0E8768DB1158376D5D01B49B1B6F869A484DAE4CFE8AB8
                C634B862D215F0DCEEE7E1F6BFBA1DE64E9E3B2490BF08B486A5A521BC7C174A
                CB84946149185C3219C31F1AC469B1D9EBF548E4D4EA48C4B0B9848114CDC64A
                C2C5C0723E55AC6C710C9D648A0C482D35D959ED1A0C6DD6BFFE34D2617540F5
                C4D3E08FDD7B5C61C905133970478E1E8186190D05D06E7AFDEF60F2A4C92E32
                E60A2777AEC7FF3913E640EB172D502957C2AA0BBE39B6D0E8DEF5577A377A24
                FD6E64209310C533607627A50C86944630E0A1D6E39F8921AA4D5AA722444937
                81A54D0AFB9444995F3198EB8F21302EE5261B0BA1B1EF7E3B32736A1D74430F
                1C4DB541ACBF0FE2FDF1ACEC409681D080BA070BA0DDF8EACABC96D3F23F17E5
                E9FB60490822DE493001CAE1F3C30760E3B21F8D3934B9E14AF60486E5775AEE
                6AA8CC000657490028D6D34D0E1983B63896A176C53290290F69F1A0B77069B0
                18B443DF5C16B97ADE32D887FE58D24C41CBD116B8BFF6FE022B994D6400C810
                F8FD7E719C4C26A1ABAB0B52A95441B9FBF67D5F48AE4FF109FFEDB50F5F8317
                6FD9322ED0FE132DF94D7B3B24684F3298576D01099894F71A070125601DFD0C
                DE3FA2C219211302A8857D6930C2E54A7C6250D31D091B1ADAEE95F322FFB0E8
                16A19A169A94B62FDA60C3191B0AAC64EEA110623E4C0B7B2C93C9886D7EBAF5
                AD5B215215C18E96604EF9B9F0CBEDBF80F7FEF9FD318726ADBB823D88AAF9BD
                E61E063B5A540C8E6D985F63A1AA6567319C09BE4486C38E230AF4A4253827A4
                836E50140046F524A51FA165680DC01E06DACEEBE746962FF85B38183F481A0F
                47DB8FC2C6D91B0BD470A4E9DAFF5E0ED59511C1604670066C79770BECF8F68E
                B11FD37E7039BBC1ABC00B291D9DD40C888135E443CB29BB6A69D39C3F476800
                2DBDF8A549D333083189DF49A09F5EA3F687032469302CB483B72E89D4D5D541
                CC8EA16FA7C3179DEDF0C8398F1C17B46BB65C03932A278222A9109282B06FDF
                3E78E5B6FF19736894B48796B283D8B69AEC6AB82CB1DCFB66B4584763580AA1
                F5A731E3B0924800F4F60184AB59A276A2962CF5286676A271286899BBFE3112
                D362A0A1EEEB7606A127442E965E5CF662817A5EBDF9EAA2E502FE00047C25E0
                5134C8A0050B1A41787CC5E3E3028DFD6031BBC1AFC10B4EC5B9976204308306
                7DC38586C0E22E304302F36B33D418854D9AC4726EC610D09AA66DF8B7C5AF1E
                7A15AA23D590B2D2835F3ACCF97EED5D1DB0E9AF7F56600896FED75208575482
                E370B0414E0A06F2B2175A5A5BE09AD3AF813B2FBE735CA009E15A7B055B836A
                FA2FDC9D45355DB5246B99424B9920294B3AC0920658D3A7CBF14848D3D1A7B3
                B2AD1E02DA66FCAC5FF18B77FABEF39BEF40DD8C3AB0982962D6EC6C712E3AC2
                8FF6EE0EF8C9F94F14A8ED15CF5F099504CDF54D04383E004EC1BFBD07F6C28F
                FFE631987FFA45E3068D9272DF22761B814368418A017417188D7504AC8FA6B8
                14A647AAE54438A01AE8DC5AD946178146A5EB7FF8767273F6DC5D2FDFC5F7F7
                EF87F270052D3C83BB62EAF8B9C251E5D0D9D3094F5EF06401B4C5CF2D867059
                78C017E23C4759C2BFEECE4EA8F3D7C1E3D73F31F6615431895B7E169B38AD9C
                AF4237E46AF4C5A6E8068BA44D46EFE85925013955EA970D2F4602B2EB970DF1
                2E471477573DFC5632B7F648E51AF76EE5F58D6B215213010DC72CC8F3EAB330
                BA7ABAE1E90B9F2A8076D9B38BA0A2BC020642A88136673269381A3D0AEB9734
                C092594B4F08B4EC1339528F46E2DEC5818D8A042B24E6BCC492EB6CF7A308B4
                463CB7FAA1B792058B1D5927EEE16D0FF35FEF7F194EABA9C96BFBC0F445776F
                37FC6CFE3305D02EFDE54298505631502CBBC521241A6D86E575D7C27D4BEE1F
                FBA9A1634DEBAF2A5D82771353E3C7F052DF231BB6278ABEA49785D6D6D7C61F
                687C107EDFF1214CAA8EE49E3F2B74A9740AD299B43BE03BD7F8342F78C901CE
                8386E11CB4B6B6C10595E743FD5528BDA1C8C9034D805B5AD2FA15D062F8B1EA
                81371343AE3DE6BF6D79A0FD007F74FBA3B0F3E84EA8ACAA02AFD79B8B3B596E
                84CF7FE7170AC6BF543A0D9DED1D306FE23CB8E7F27BA0AEAA6E7CA6BB47088D
                246DC910D09A68FC7A605B62B85FC714BEA28AA9B5AF953FF3EE33F0C2279BA1
                A4340015681C145975ABE7035AC81C234172675A26747576413FFA3D379EBD12
                EEB8E40EA82EAB1E9F859551401353E345A06D6A78A37FEDB1D431181AADDA53
                2CF9CA1F5F8157F6FC1A7E7BE877E8AC9640B02C083EBF0FBC6828081D0DF4A9
                640A62BD317486FB61E1D4AFC3B5E72E876BE75C2B9C5F49924E5A68B4B0FC66
                1E34FA11597D4363FFE663AD231F1AC2E23473118FC7C5CC0505E33B0FEF843D
                AD7B606FFB5E38DC7B183A121DC2B3A82AA984DAB25A9855350BCEAD3E172EAC
                BD50440B14E493A1200718E19D7CEAE982DB85D06AE8E78A78B87A5D63FF887E
                39970FCD300CDE89BE557B7BBB98F6C163304D5364F13A3D4A60B63CB5CF9528
                50144564555505AC2A1C0FC3E1301D9FB4D01A5C68046CC46F650F2769BAAE8B
                9C05570C5A1698A66922FF7F91B460FDD691C33A99520EDAA934B2740ADA28D2
                2968A348FF072000A15DA2A970090000000049454E44AE426082}
              Visible = False
              OnClick = IAgregarPClick
            end
            object LAgregarP: TLabel
              Left = 593
              Top = 80
              Width = 88
              Height = 17
              Cursor = crHandPoint
              Alignment = taCenter
              AutoSize = False
              Caption = 'Agregar Padre'
              Visible = False
              WordWrap = True
            end
            object L1: TLabel
              Left = 520
              Top = 112
              Width = 14
              Height = 15
              Caption = 'L1'
            end
            object L2: TLabel
              Left = 536
              Top = 112
              Width = 14
              Height = 15
              Caption = 'L1'
            end
            object L3: TLabel
              Left = 520
              Top = 128
              Width = 14
              Height = 15
              Caption = 'L1'
            end
            object CBPInt: TCheckBox
              Left = 320
              Top = 175
              Width = 13
              Height = 17
              Checked = True
              Color = clGreen
              ParentColor = False
              State = cbChecked
              TabOrder = 0
              Visible = False
            end
            object CBPExt: TCheckBox
              Left = 320
              Top = 143
              Width = 13
              Height = 17
              Checked = True
              Color = clGreen
              ParentColor = False
              State = cbChecked
              TabOrder = 1
              Visible = False
            end
            object ERPPadre: TEdit
              Left = 192
              Top = 48
              Width = 281
              Height = 25
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Visible = False
              OnChange = ERPPadreChange
              OnKeyPress = ERPPadreKeyPress
            end
            object Button3: TButton
              Left = 528
              Top = 160
              Width = 75
              Height = 25
              Caption = 'Button1'
              TabOrder = 3
              Visible = False
              OnClick = Button3Click
            end
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 321
          Width = 990
          Height = 79
          inherited MAObservacion: TMemoAuto
            Width = 986
            Height = 60
          end
        end
      end
      object TSDistocia: TTabSheet [2]
        Caption = 'Distocia'
        ImageIndex = 9
        object GBObservacion: TGroupBox
          Left = 0
          Top = 225
          Width = 990
          Height = 68
          Align = alClient
          Caption = 'Observaciones:'
          TabOrder = 0
          object MAObservacionDistocia: TMemoAuto
            Left = 2
            Top = 17
            Width = 986
            Height = 49
            Align = alClient
            Color = clWhite
            TabOrder = 0
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 990
          Height = 225
          Align = alTop
          Caption = 'Datos:'
          TabOrder = 1
          object LCausaDistocia: TLabel
            Left = 20
            Top = 26
            Width = 91
            Height = 15
            Caption = 'Causa Distocia: '
            Layout = tlCenter
          end
          object LGradoDistocia: TLabel
            Left = 22
            Top = 52
            Width = 88
            Height = 15
            Caption = 'Grado Distocia: '
            Layout = tlCenter
          end
          object DBLCBACausaDistocia: TDBLookupComboBoxAuto
            Left = 112
            Top = 17
            Width = 372
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_CAUSA_DISTOCIA'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSCausaDistocia
            TabOrder = 0
            OnCloseUp = DBLCBACausaDistociaCloseUp
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBAGradoDistocia: TDBLookupComboBoxAuto
            Left = 112
            Top = 45
            Width = 242
            Height = 23
            Color = 14679807
            DropDownRows = 20
            KeyField = 'ID_GRADO_ASISTENCIA'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSGradoAsistencia
            TabOrder = 1
            OnCloseUp = DBLCBAGradoDistociaCloseUp
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
        end
      end
      object TSNacimientos: TTabSheet [3]
        Caption = 'Nacimientos'
        ImageIndex = 10
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 990
          Height = 305
          Align = alTop
          Caption = ' Nacidos '
          TabOrder = 0
          DesignSize = (
            990
            305)
          object LSexo: TLabel
            Left = 59
            Top = 168
            Width = 30
            Height = 15
            Caption = 'Sexo:'
            Layout = tlCenter
          end
          object LVivo: TLabel
            Left = 59
            Top = 194
            Width = 28
            Height = 15
            Caption = 'Vivo: '
            Layout = tlCenter
          end
          object LPeso: TLabel
            Left = 56
            Top = 220
            Width = 35
            Height = 15
            Caption = 'Peso: '
            Layout = tlCenter
          end
          object LColor: TLabel
            Left = 52
            Top = 277
            Width = 36
            Height = 15
            Caption = 'Color: '
            Layout = tlCenter
          end
          object DBLCBASexo: TDBLookupComboBoxAuto
            Left = 99
            Top = 160
            Width = 162
            Height = 23
            Color = 14679807
            DataField = 'ID_SEXO'
            DataSource = DSNacidos
            DropDownRows = 20
            KeyField = 'ID_TIPO_SEXO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSTipoSexo
            TabOrder = 0
            OnClick = DBLCBASexoClick
            OnCloseUp = DBLCBASexoCloseUp
            OnEnter = DBLCBASexoEnter
            OnKeyUp = DBLCBASexoKeyUp
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object DBLCBAVivoSN: TDBLookupComboBoxAuto
            Left = 99
            Top = 186
            Width = 162
            Height = 23
            Color = 14679807
            DataField = 'ID_VIVO'
            DataSource = DSNacidos
            DropDownRows = 20
            KeyField = 'ID_CODIGO'
            ListField = 'VALOR'
            ListSource = DMSoftvet.DSCodigosGenericos
            TabOrder = 1
            OnClick = DBLCBAVivoSNClick
            OnCloseUp = DBLCBAVivoSNCloseUp
            OnEnter = DBLCBAVivoSNEnter
            OnKeyUp = DBLCBAVivoSNKeyUp
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
          object CBIdentificacion: TCheckBox
            Left = 34
            Top = 246
            Width = 105
            Height = 18
            Alignment = taLeftJustify
            Caption = 'Identificar'
            TabOrder = 3
            OnClick = CBIdentificacionClick
          end
          object GBIdentificacion: TGroupBox
            Left = 392
            Top = 83
            Width = 485
            Height = 214
            Anchors = [akRight, akBottom]
            Caption = ' Identificaci'#243'n '
            Enabled = False
            TabOrder = 4
            object LabelIDPC: TLabel
              Left = 315
              Top = 75
              Width = 23
              Height = 15
              Caption = 'PC: '
              Visible = False
            end
            object LabelIDHBA: TLabel
              Left = 206
              Top = 87
              Width = 30
              Height = 15
              Caption = 'HBA: '
            end
            object LabelIDRA: TLabel
              Left = 318
              Top = 65
              Width = 22
              Height = 15
              Caption = 'RA: '
              Visible = False
            end
            object LabelIDOtro: TLabel
              Left = 207
              Top = 173
              Width = 29
              Height = 15
              Caption = 'Otro: '
              Visible = False
            end
            object LRP: TLabel
              Left = 6
              Top = 89
              Width = 23
              Height = 15
              Caption = 'RP: '
            end
            object LCUIGPropio: TLabel
              Left = 305
              Top = 15
              Width = 78
              Height = 23
              Cursor = crHandPoint
              AutoSize = False
              Caption = 'CUIG Propio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              Layout = tlCenter
              OnClick = LCUIGPropioClick
              OnMouseEnter = LCUIGPropioMouseEnter
              OnMouseLeave = LCUIGPropioMouseLeave
            end
            object LIdentificacionElectronica: TLabel
              Left = 6
              Top = 173
              Width = 26
              Height = 17
              AutoSize = False
              Caption = 'I.E.: '
            end
            object LabelNombre: TLabel
              Left = 6
              Top = 117
              Width = 47
              Height = 17
              AutoSize = False
              Caption = 'Nombre:'
            end
            object LabelApodo: TLabel
              Left = 6
              Top = 145
              Width = 47
              Height = 17
              AutoSize = False
              Caption = 'Apodo:'
            end
            object DBEARP: TDBEditAuto
              Left = 39
              Top = 60
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 0
              Visible = False
              OnChange = Change
              OnKeyPress = DBEARPKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEASen: TDBEditAuto
              Left = 121
              Top = 14
              Width = 129
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'ID_SENASA'
              DataSource = DSNacidos
              TabOrder = 12
              Visible = False
              OnChange = Change
              OnKeyPress = DBEASenKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEAPC: TDBEditAuto
              Left = 343
              Top = 71
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'ID_PC'
              DataSource = DSNacidos
              TabOrder = 1
              Visible = False
              OnChange = Change
              OnKeyPress = DBEAPCKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEAOtro: TDBEditAuto
              Left = 349
              Top = 63
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'ID_OTRO'
              DataSource = DSNacidos
              TabOrder = 4
              Visible = False
              OnChange = Change
              OnKeyPress = DBEAOtroKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEARA: TDBEditAuto
              Left = 237
              Top = 169
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'ID_RA'
              DataSource = DSNacidos
              TabOrder = 3
              Visible = False
              OnChange = Change
              OnKeyPress = DBEARAKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEAHBA: TDBEditAuto
              Left = 237
              Top = 83
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'ID_HBA'
              DataSource = DSNacidos
              TabOrder = 2
              OnChange = Change
              OnKeyPress = DBEAHBAKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object RBCUIGSenasa: TRadioButton
              Left = 17
              Top = 43
              Width = 105
              Height = 18
              Caption = 'CUIG - Senasa'
              Checked = True
              TabOrder = 5
              TabStop = True
              OnClick = RBCUIGSenasaClick
            end
            object CBCUIGPropio: TCheckBox
              Left = 285
              Top = 17
              Width = 18
              Height = 19
              Caption = 'CUIG Propio'
              TabOrder = 6
              OnClick = CBCUIGPropioClick
            end
            object DBLCBACUIGPropio: TDBLookupComboBoxAuto
              Left = 284
              Top = 41
              Width = 90
              Height = 23
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_CUIG'
              ListField = 'ENCABEZADO'
              ListSource = DMSoftvet.DSCUIGActual
              TabOrder = 7
              Visible = False
              OnCloseUp = DBLCBACUIGPropioCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAUltimoIdent: TMaskEdit
              Left = 177
              Top = 40
              Width = 39
              Height = 23
              EditMask = '>aaa9;0;_'
              MaxLength = 4
              TabOrder = 9
              OnChange = EAEncabezadoChange
              OnExit = EAUltimoIdentExit
              OnKeyPress = EAUltimoIdentKeyPress
            end
            object EAEncabezado: TMaskEdit
              Left = 121
              Top = 40
              Width = 50
              Height = 23
              EditMask = '>ll999;0;_'
              MaxLength = 5
              TabOrder = 8
              OnChange = EAEncabezadoChange
              OnExit = EAEncabezadoExit
              OnKeyPress = EAEncabezadoKeyPress
            end
            object EVerificador: TEdit
              Left = 224
              Top = 40
              Width = 26
              Height = 23
              ReadOnly = True
              TabOrder = 10
            end
            object RBSenasa: TRadioButton
              Left = 17
              Top = 17
              Width = 79
              Height = 19
              Caption = 'Senasa'
              TabOrder = 11
              OnClick = RBSenasaClick
            end
            object DBEAIdentificacionElectronica: TDBEditAuto
              Left = 55
              Top = 169
              Width = 130
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'ID_IE'
              DataSource = DSNacidos
              TabOrder = 13
              OnChange = Change
              OnKeyPress = DBEARPKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrefijo: TEditAuto
              Left = 55
              Top = 85
              Width = 34
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 2
              TabOrder = 14
              OnChange = EARPChange
              OnExit = EARPOnExit
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EARpInicial: TEditAuto
              Left = 88
              Top = 85
              Width = 70
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 6
              TabOrder = 15
              OnChange = EARPChange
              OnExit = EARPOnExit
              OnKeyPress = EARpInicialKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EASufijo: TEditAuto
              Left = 157
              Top = 85
              Width = 27
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 2
              TabOrder = 16
              OnChange = EARPChange
              OnExit = EARPOnExit
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEANombre: TDBEditAuto
              Left = 55
              Top = 113
              Width = 311
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'NOMBRE'
              DataSource = DSNacidos
              TabOrder = 17
              OnChange = Change
              OnKeyPress = DBEARPKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEAApodo: TDBEditAuto
              Left = 55
              Top = 141
              Width = 311
              Height = 23
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'APODO'
              DataSource = DSNacidos
              TabOrder = 18
              OnChange = Change
              OnKeyPress = DBEARPKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
          object DBEAPeso: TDBEditAuto
            Left = 99
            Top = 215
            Width = 162
            Height = 23
            CharCase = ecUpperCase
            Color = clWhite
            DataField = 'PESO'
            DataSource = DSNacidos
            TabOrder = 2
            OnChange = DBEAPesoChange
            OnEnter = DBEAPesoEnter
            OnKeyPress = DBEAPesoKeyPress
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
          object BitDBGrid2: TBitDBGrid
            Left = 2
            Top = 17
            Width = 986
            Height = 80
            Align = alTop
            DataSource = DSNacidos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = BDBGNacidosCellClick
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
            RealTitleFont.Height = -8
            RealTitleFont.Name = 'MS Sans Serif'
            RealTitleFont.Style = []
            RunTimePropEditor = True
            ShowCellHint = True
            TitleBtn = tbNone
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_RP'
                Title.Caption = 'RP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMBRE'
                Title.Caption = 'Nombre'
                Width = 228
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APODO'
                Title.Caption = 'Apodo'
                Width = 228
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMCOLOR'
                Title.Caption = 'Color'
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SEXO'
                Title.Caption = 'Sexo'
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VIVO'
                Title.Caption = 'Vivo'
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PESO'
                Title.Caption = 'Peso (KGs)'
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_SENASA'
                Title.Caption = 'Senasa'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_PC'
                Title.Caption = 'PC'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_HBA'
                Title.Caption = 'HBA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_RA'
                Title.Caption = 'RA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ID_OTRO'
                Title.Caption = 'OTRO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_IE'
                Title.Caption = 'IE'
                Visible = True
              end>
          end
          object DBLCBAColor: TDBLookupComboBoxAuto
            Left = 99
            Top = 274
            Width = 162
            Height = 23
            Color = 14679807
            DataField = 'COLOR'
            DataSource = DSNacidos
            DropDownRows = 20
            KeyField = 'ID_COLOR'
            ListField = 'NOMBRE'
            ListSource = DSColor
            TabOrder = 6
            OnCloseUp = DBLCBAColorCloseUp
            EsClave = False
            EsRequerido = True
            ISParam = True
          end
        end
        object GBObservacionNacimiento: TGroupBox
          Left = 0
          Top = 305
          Width = 990
          Height = 95
          Align = alClient
          Caption = 'Observaciones:'
          TabOrder = 1
          object MAObservacionNacimiento: TMemoAuto
            Left = 2
            Top = 17
            Width = 986
            Height = 76
            Align = alClient
            Color = clWhite
            TabOrder = 0
            EsClave = False
            EsRequerido = False
            ISParam = False
          end
        end
      end
      inherited TSGrilla: TTabSheet
        inherited BDBGSimple: TBitDBGrid
          Width = 895
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ANIMAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTABLECIMIENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_AUX'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_SENASA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_PC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_HBA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_OTRO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_NACIMIENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEXO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORIGEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIRCUNFERENCIA_ESCROTAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_REPRODUCTIVO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_LACTACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POTRERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RODEO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CATEGORIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CRONOLOGIA_DENTARIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONDICION_CORPORAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MADRE_BIOLOGICA_EXTERNA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MADRE_RECEPTORA_EXTERNA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GDR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PADRE_EXTERNO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MADRE_BIOLOGICA_INTERNA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MADRE_RECEPTORA_INTERNA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PADRE_INTERNO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APODO'
              Visible = True
            end>
        end
        inherited PanelDer: TPanel
          Left = 942
        end
      end
    end
    inherited PBotones: TPanel
      Width = 998
      TabOrder = 1
      inherited SBSelTodos: TSpeedButton
        Left = 666
      end
      inherited IFondoB2: TImage
        Width = 572
      end
      inherited JvIImpExcel: TJvImage
        Visible = False
      end
      inherited BBCancelar: TBitBtn
        Left = 627
        TabOrder = 1
      end
      inherited BBAnterior: TBitBtn
        Left = 718
        TabOrder = 2
      end
      inherited BBSiguiente: TBitBtn
        Left = 810
        TabOrder = 0
      end
      inherited BBTerminar: TBitBtn
        Left = 903
      end
      inherited BBAyuda: TBitBtn
        TabOrder = 7
      end
      inherited PL: TPanel
        Left = 572
      end
      inherited BIngresoSecuenciado: TBitBtn
        Left = 260
        TabOrder = 4
      end
      inherited BSacarAnimal: TBitBtn
        Left = 123
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 998
    Caption = 'Parto / Nacimientos'
    inherited LTitulo: TLabel
      Width = 594
    end
    inherited PILeft: TPanel
      Left = 790
    end
  end
  inherited Psocalo: TPanel
    Width = 998
    inherited JvSocalo: TJvImage
      Width = 998
    end
  end
  inherited ALUniversal: TActionList
    Left = 555
    Top = 448
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 196
    Top = 455
  end
  inherited DSSimple: TDataSource
    Left = 368
    Top = 440
  end
  inherited IBDSSimple: TIBDataSet
    SelectSQL.Strings = (
      'select * from  AUX_ANIMALES')
    Left = 404
    Top = 470
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_ANIMALES.ID_ANIMAL'
      Required = True
    end
    object IBDSSimpleESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'AUX_ANIMALES.ESTABLECIMIENTO'
    end
    object IBDSSimpleID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES.ID_AUX'
      Required = True
    end
    object IBDSSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES.ID_RP'
      Size = 10
    end
    object IBDSSimpleID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES.ID_SENASA'
      Size = 9
    end
    object IBDSSimpleID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES.ID_PC'
      Size = 10
    end
    object IBDSSimpleID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES.ID_HBA'
      Size = 10
    end
    object IBDSSimpleID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES.ID_RA'
      Size = 10
    end
    object IBDSSimpleID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES.ID_OTRO'
      Size = 10
    end
    object IBDSSimpleNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES.NOMBRE'
      Size = 50
    end
    object IBDSSimpleFECHA_NACIMIENTO: TDateField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'AUX_ANIMALES.FECHA_NACIMIENTO'
    end
    object IBDSSimpleSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES.SEXO'
    end
    object IBDSSimplePESO: TFloatField
      FieldName = 'PESO'
      Origin = 'AUX_ANIMALES.PESO'
    end
    object IBDSSimpleCIRCUNFERENCIA_ESCROTAL2: TFloatField
      FieldName = 'CIRCUNFERENCIA_ESCROTAL'
      Origin = 'AUX_ANIMALES.CIRCUNFERENCIA_ESCROTAL'
    end
    object IBDSSimpleORIGEN: TIBStringField
      FieldName = 'ORIGEN'
      Origin = 'AUX_ANIMALES.ORIGEN'
    end
    object IBDSSimpleESTADO_REPRODUCTIVO: TIntegerField
      FieldName = 'ESTADO_REPRODUCTIVO'
      Origin = 'AUX_ANIMALES.ESTADO_REPRODUCTIVO'
    end
    object IBDSSimpleESTADO_LACTACION: TIntegerField
      FieldName = 'ESTADO_LACTACION'
      Origin = 'AUX_ANIMALES.ESTADO_LACTACION'
    end
    object IBDSSimplePOTRERO: TIntegerField
      FieldName = 'POTRERO'
      Origin = 'AUX_ANIMALES.POTRERO'
    end
    object IBDSSimpleLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'AUX_ANIMALES.LOTE'
    end
    object IBDSSimpleRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES.RAZA'
    end
    object IBDSSimpleRODEO: TIntegerField
      FieldName = 'RODEO'
      Origin = 'AUX_ANIMALES.RODEO'
    end
    object IBDSSimpleCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Origin = 'AUX_ANIMALES.CATEGORIA'
    end
    object IBDSSimpleACTIVO: TIBStringField
      FieldName = 'ACTIVO'
      Origin = 'AUX_ANIMALES.ACTIVO'
      Size = 1
    end
    object IBDSSimpleCRONOLOGIA_DENTARIA: TIntegerField
      FieldName = 'CRONOLOGIA_DENTARIA'
      Origin = 'AUX_ANIMALES.CRONOLOGIA_DENTARIA'
    end
    object IBDSSimpleCONDICION_CORPORAL: TIntegerField
      FieldName = 'CONDICION_CORPORAL'
      Origin = 'AUX_ANIMALES.CONDICION_CORPORAL'
    end
    object IBDSSimpleMADRE_BIOLOGICA_EXTERNA: TIntegerField
      FieldName = 'MADRE_BIOLOGICA_EXTERNA'
      Origin = 'AUX_ANIMALES.MADRE_BIOLOGICA_EXTERNA'
    end
    object IBDSSimpleMADRE_RECEPTORA_EXTERNA: TIntegerField
      FieldName = 'MADRE_RECEPTORA_EXTERNA'
      Origin = 'AUX_ANIMALES.MADRE_RECEPTORA_EXTERNA'
    end
    object IBDSSimpleGDR: TIntegerField
      FieldName = 'GDR'
      Origin = 'AUX_ANIMALES.GDR'
    end
    object IBDSSimplePADRE_EXTERNO: TIntegerField
      FieldName = 'PADRE_EXTERNO'
      Origin = 'AUX_ANIMALES.PADRE_EXTERNO'
    end
    object IBDSSimpleMADRE_BIOLOGICA_INTERNA: TIntegerField
      FieldName = 'MADRE_BIOLOGICA_INTERNA'
      Origin = 'AUX_ANIMALES.MADRE_BIOLOGICA_INTERNA'
    end
    object IBDSSimpleMADRE_RECEPTORA_INTERNA: TIntegerField
      FieldName = 'MADRE_RECEPTORA_INTERNA'
      Origin = 'AUX_ANIMALES.MADRE_RECEPTORA_INTERNA'
    end
    object IBDSSimplePADRE_INTERNO: TIntegerField
      FieldName = 'PADRE_INTERNO'
      Origin = 'AUX_ANIMALES.PADRE_INTERNO'
    end
    object IBDSSimpleAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES.APODO'
      Size = 50
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 688
    Top = 462
  end
  inherited IBQValidaciones: TIBQuery
    Left = 756
    Top = 454
  end
  inherited IBQEvento: TIBQuery
    Left = 60
    Top = 430
  end
  inherited SDXLS: TSaveDialog
    Left = 502
    Top = 453
  end
  inherited DTXLS: TDataToXLS
    Left = 232
    Top = 1
  end
  inherited WinXP1: TWinXP
    Left = 528
    Top = 0
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 268
    Top = 431
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 452
    Top = 439
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 548
    Top = 471
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 316
    Top = 455
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 644
    Top = 479
  end
  inherited IBQSPRN: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'select * from rn_parto'
      ' (:animal,'
      '  :esta,'
      '  :p,'
      '  :p1, '
      '  :p2, '
      '  :fecha,'
      '  :rp, '
      '  :rp1, '
      '  :rp2, '
      '  :sen,'
      '  :sen1,'
      '  :sen2,'
      '  :pc,'
      '  :pc1,'
      '  :pc2,'
      '  :hba,'
      '  :hba1,'
      '  :hba2,'
      '  :ra,'
      '  :ra1,'
      '  :ra2,'
      '  :otro,'
      '  :otro1,'
      '  :otro2,'
      '  :ie,'
      '  :ie1,'
      '  :ie2,'
      '  :sexo,'
      '  :sexo1,'
      '  :sexo2,'
      '  :co)')
    Left = 672
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'esta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p2'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'rp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'rp1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'rp2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sen'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sen1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sen2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pc1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pc2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'hba'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'hba1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'hba2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ra'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ra1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ra2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'otro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'otro1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'otro2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ie1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ie2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sexo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sexo1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sexo2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'co'
        ParamType = ptUnknown
      end>
    object IBQSPRNRESULT: TIBStringField
      FieldName = 'RESULT'
      Origin = 'RN_PARTO.RESULT'
      Size = 1
    end
    object IBQSPRNMENSAJE: TIBStringField
      FieldName = 'MENSAJE'
      Origin = 'RN_PARTO.MENSAJE'
      Size = 150
    end
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 712
    Top = 472
  end
  inherited IBQSPEventoInd: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    SQL.Strings = (
      'EXECUTE PROCEDURE SP_PARTO_PRINCIPAL ('
      '  :FECHA,'
      '  :ESTABLECIMIENTO,'
      '  :RESPONSABLE,'
      '  :LOG_USUARIO,'
      '  :LOG_FECHA_MODIFICADO,'
      '  :DISPARADOR,'
      '  :ANIMAL,'
      '  :MADRE_BIOLOGICA,'
      '  :POTRERO,'
      '  :RODEO,'
      '  :OBSERVACION,'
      '  :CANTIDAD,'
      '  :CONDICION_CORPORAL,'
      '  :CAUSA,'
      '  :GRADO,'
      '  :OBSERVACION_DISTOCIA,'
      '  :SEXO0,'
      '  :SEXO1,'
      '  :SEXO2,'
      '  :VIVO0,'
      '  :VIVO1,'
      '  :VIVO2,'
      '  :PESO0,'
      '  :PESO1,'
      '  :PESO2,'
      '  :OBSERVACION_NACIMIENTOS,'
      '  :PADRE,'
      '  :RP0,'
      '  :RP1,'
      '  :RP2,'
      '  :SEN0,'
      '  :SEN1,'
      '  :SEN2,'
      '  :PC0,'
      '  :PC1,'
      '  :PC2,'
      '  :HBA0,'
      '  :HBA1,'
      '  :HBA2,'
      '  :RA0,'
      '  :RA1,'
      '  :RA2,'
      '  :OTRO0,'
      '  :OTRO1,'
      '  :OTRO2,'
      '  :IE0,'
      '  :IE1,'
      '  :IE2,'
      '  :COLOR0,'
      '  :COLOR1,'
      '  :COLOR2,'
      '  :NOMBRE0,'
      '  :NOMBRE1,'
      '  :NOMBRE2,'
      '  :APODO0,'
      '  :APODO1,'
      '  :APODO2)')
    Left = 592
    Top = 520
    ParamData = <
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
        Name = 'DISPARADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE_BIOLOGICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'POTRERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RODEO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANTIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CONDICION_CORPORAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CAUSA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION_DISTOCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VIVO0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VIVO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VIVO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION_NACIMIENTOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PADRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RP0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RP1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RP2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEN0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEN1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEN2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PC0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PC1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PC2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBA0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HBA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RA0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OTRO0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OTRO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OTRO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IE0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLOR0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLOR1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLOR2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APODO0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APODO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APODO2'
        ParamType = ptUnknown
      end>
  end
  inherited DSIBQ_SPEventoInd: TDataSource
    Left = 832
    Top = 456
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 588
    Top = 447
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 0
    Top = 448
  end
  inherited IBSPActEventos: TIBStoredProc
    Left = 220
    Top = 471
  end
  inherited OpenDlg: TOpenDialog
    Left = 68
    Top = 512
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 612
    Top = 440
  end
  inherited IBQRepetidos: TIBQuery
    Left = 316
    Top = 478
  end
  object IBQAnimal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_RP, raza, potrero, rodeo from tab_animales where (esta' +
        'blecimiento = :esta) and (id_animal = :animal)')
    Left = 736
    Top = 454
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end>
  end
  object IBDSNacidos: TIBDataSet
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from AUX_nacimientos'
      'where'
      '  ID_NACIMIENTO = :OLD_ID_NACIMIENTO')
    InsertSQL.Strings = (
      'insert into AUX_nacimientos'
      
        '  (ID_RP, ID_SENASA, ID_PC, ID_HBA, ID_RA, ID_OTRO, IDENTIFICO, ' +
        'PESO, '
      'SEXO, '
      '   VIVO, ID_IE, COLOR, NOMBRE,APODO)'
      'values'
      
        '  (:ID_RP, :ID_SENASA, :ID_PC, :ID_HBA, :ID_RA, :ID_OTRO, :IDENT' +
        'IFICO, '
      '   :PESO, :SEXO, :VIVO, :ID_IE, :COLOR, :NOMBRE,:APODO)')
    RefreshSQL.Strings = (
      'Select *'
      'from AUX_nacimientos '
      'where'
      '  ID_NACIMIENTO = :ID_NACIMIENTO')
    SelectSQL.Strings = (
      'select * from AUX_NACIMIENTOS ')
    ModifySQL.Strings = (
      'update AUX_nacimientos'
      'set'
      '  ID_RP = :ID_RP,'
      '  ID_SENASA = :ID_SENASA,'
      '  ID_PC = :ID_PC,'
      '  ID_HBA = :ID_HBA,'
      '  ID_RA = :ID_RA,'
      '  ID_OTRO = :ID_OTRO,'
      '  IDENTIFICO = :IDENTIFICO,'
      '  PESO = :PESO,'
      '  SEXO = :SEXO,'
      '  VIVO = :VIVO,'
      '  ID_IE = :ID_IE,'
      '  COLOR = :COLOR,'
      '  NOMBRE = :NOMBRE,'
      '  APODO =:APODO'
      'where'
      '  ID_NACIMIENTO = :OLD_ID_NACIMIENTO')
    Left = 252
    Top = 382
    object IBDSNacidosID_NACIMIENTO: TIntegerField
      FieldName = 'ID_NACIMIENTO'
      Origin = 'AUX_NACIMIENTOS.ID_NACIMIENTO'
    end
    object IBDSNacidosID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_NACIMIENTOS.ID_RP'
      Size = 10
    end
    object IBDSNacidosID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_NACIMIENTOS.ID_SENASA'
      Size = 9
    end
    object IBDSNacidosID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_NACIMIENTOS.ID_PC'
      Size = 10
    end
    object IBDSNacidosID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_NACIMIENTOS.ID_HBA'
      Size = 10
    end
    object IBDSNacidosID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_NACIMIENTOS.ID_RA'
      Size = 10
    end
    object IBDSNacidosID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_NACIMIENTOS.ID_OTRO'
      Size = 10
    end
    object IBDSNacidosIDENTIFICO: TIBStringField
      FieldName = 'IDENTIFICO'
      Origin = 'AUX_NACIMIENTOS.IDENTIFICO'
      Size = 1
    end
    object IBDSNacidosPESO: TFloatField
      FieldName = 'PESO'
      Origin = 'AUX_NACIMIENTOS.PESO'
      Required = True
    end
    object IBDSNacidosSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'AUX_NACIMIENTOS.SEXO'
      Size = 10
    end
    object IBDSNacidosVIVO: TIBStringField
      FieldName = 'VIVO'
      Origin = 'AUX_NACIMIENTOS.VIVO'
      Size = 2
    end
    object IBDSNacidosID_SEXO: TIntegerField
      FieldName = 'ID_SEXO'
      Origin = 'AUX_NACIMIENTOS.ID_SEXO'
    end
    object IBDSNacidosID_VIVO: TIBStringField
      FieldName = 'ID_VIVO'
      Origin = 'AUX_NACIMIENTOS.ID_VIVO'
      Size = 1
    end
    object IBDSNacidosID_IE: TIBStringField
      FieldName = 'ID_IE'
      Origin = 'AUX_NACIMIENTOS.ID_IE'
      Size = 15
    end
    object IBDSNacidosCOLOR: TIntegerField
      FieldName = 'COLOR'
      Origin = 'AUX_NACIMIENTOS.COLOR'
    end
    object IBDSNacidosNOMCOLOR: TIBStringField
      FieldName = 'NOMCOLOR'
      Origin = 'AUX_NACIMIENTOS.NOMCOLOR'
    end
    object IBDSNacidosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_NACIMIENTOS.NOMBRE'
      Size = 100
    end
    object IBDSNacidosAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_NACIMIENTOS.APODO'
      Size = 100
    end
  end
  object DSNacidos: TDataSource
    DataSet = IBDSNacidos
    Left = 152
    Top = 456
  end
  object IBQPadresAutocalculados: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_busqueda from sp_calcular_padres(:raza, :animal, :hoy)')
    Left = 40
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'raza'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'animal'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'hoy'
        ParamType = ptUnknown
      end>
    object IBQPadresAutocalculadosID_BUSQUEDA: TIntegerField
      FieldName = 'ID_BUSQUEDA'
      Origin = 'SP_CALCULAR_PADRES.ID_BUSQUEDA'
    end
  end
  object DSPadresAutoCalculados: TDataSource
    DataSet = IBQPadres
    Left = 392
    Top = 544
  end
  object IBQPadres: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select distinct * from aux_animales_externos where (id_aux = :id' +
        ') and (sexo = 1)')
    UpdateObject = IBUSQLPadres
    GeneratorField.Field = 'ID_AUX'
    Left = 360
    Top = 544
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    object IBQPadresID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQPadresID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQPadresID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQPadresID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQPadresID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQPadresID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQPadresID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQPadresID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQPadresNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQPadresAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQPadresRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQPadresSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQPadresINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQTodosPadres: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select cast('#39'0 No definido'#39' as varchar(14)) as KeyValue,'
      '       0 as id,'
      '       cast('#39'Indefinfo'#39' as varchar(10)) as ID_RP,'
      
        '       cast (cast('#39'No definido'#39' as varchar(12))|| '#39'     NN'#39' as v' +
        'archar(30)) as listField,'
      '       '#39'N'#39' as INTERNO'
      'from cod_estados_reproductivos cer'
      ''
      'union'
      ''
      'select'
      
        '      cast (tae.ID_ANIMAL_EXTERNO as varchar(12))|| '#39' N'#39' as KeyV' +
        'alue,'
      '      tae.ID_ANIMAL_EXTERNO as id,'
      '      cast (tae.ID_RP as Varchar(10)) as id_rp,'
      
        '      cast (cast (tae.ID_RP as Varchar(10))|| '#39'               No' +
        #39'as varchar(30)) as listField,'
      '      '#39'N'#39' AS INTERNO'
      'FROM  TAB_ANIMALES_EXTERNOS tae,'
      '            COD_SEXOS cs'
      'WHERE (tae.establecimiento = :establecimiento)  and'
      '      (cs.tipo = 1) and'
      '      (tae.sexo = cs.id_sexo)'
      'UNION'
      ''
      'select'
      '       cast (ta.ID_ANIMAL as varchar(12)) || '#39' S'#39' as KeyValue,'
      '       ta.ID_ANIMAL as id,'
      '       cast (ta.ID_RP as Varchar(10)) as id_rp,'
      
        '       cast (cast (ta.ID_RP as Varchar(10))|| '#39'               Si' +
        #39'as varchar(30)) as listField,'
      '       '#39'S'#39' as INTERNO'
      'FROM  TAB_ANIMALES ta,'
      '      COD_categorias cc'
      'WHERE (ta.establecimiento = :establecimiento) and'
      '               (cc.codigo = '#39'TO'#39') and'
      '               (ta.categoria = cc.id_categoria) and'
      '               (ta.activo <> '#39'N'#39')')
    Left = 376
    Top = 512
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
    object IBQTodosPadresKEYVALUE: TIBStringField
      FieldName = 'KEYVALUE'
      Required = True
      Size = 13
    end
    object IBQTodosPadresID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object IBQTodosPadresID_RP: TIBStringField
      FieldName = 'ID_RP'
      Required = True
      Size = 10
    end
    object IBQTodosPadresLISTFIELD: TIBStringField
      DisplayWidth = 30
      FieldName = 'LISTFIELD'
      Required = True
      Size = 30
    end
    object IBQTodosPadresINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DSTodosPadres: TDataSource
    DataSet = IBQTodosPadres
    Left = 344
    Top = 512
  end
  object IBUSQLPadres: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from aux_animales_externos '
      'where'
      '  ID_AUX = :ID_AUX')
    ModifySQL.Strings = (
      'update aux_animales_externos'
      'set'
      '  ID_ANIMAL_EXTERNO = :ID_ANIMAL_EXTERNO,'
      '  ID_AUX = :ID_AUX,'
      '  ID_RP = :ID_RP,'
      '  ID_HBA = :ID_HBA,'
      '  NOMBRE = :NOMBRE,'
      '  SEXO = :SEXO,'
      '  INTERNO = :INTERNO'
      'where'
      '  ID_AUX = :OLD_ID_AUX')
    InsertSQL.Strings = (
      'insert into aux_animales_externos'
      
        '  (ID_ANIMAL_EXTERNO, ID_AUX, ID_RP, ID_HBA, NOMBRE, SEXO, INTER' +
        'NO)'
      'values'
      
        '  (:ID_ANIMAL_EXTERNO, :ID_AUX, :ID_RP, :ID_HBA, :NOMBRE, :SEXO,' +
        ' :INTERNO)')
    DeleteSQL.Strings = (
      'delete from aux_animales_externos')
    Left = 444
    Top = 542
  end
  object IBQGenerador: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT GEN_ID(GEN_ID_AUXANIMALEXTERNO, 1)  AS IDAUXPE FROM RDB$D' +
        'ATABASE')
    GeneratorField.Field = 'ID_AUX'
    Left = 640
    Top = 456
  end
  object IBQBuscarCUIG: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ultimo_identificador from tab_cuig where establecimiento=' +
        ':esta and id_cuig=:id')
    Left = 116
    Top = 449
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQActCUIG: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update tab_cuig set ultimo_identificador=:UI where ID_CUIG=:cuig')
    Left = 196
    Top = 385
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cuig'
        ParamType = ptUnknown
      end>
  end
  object IBQCantCuigs: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(*)  as cantidad from tab_cuig')
    Left = 172
    Top = 448
  end
  object IBQMadre: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select first 1 * from aux_animales_externos where (id_aux = :id)' +
        ' and (sexo = 2)')
    Left = 420
    Top = 509
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQColor: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQColorAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_colores')
    Left = 308
    Top = 296
  end
  object DSColor: TDataSource
    DataSet = IBQColor
    Left = 340
    Top = 296
  end
  object IBQCriador: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_criador where establecimiento = :esta')
    Left = 558
    Top = 285
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
end
