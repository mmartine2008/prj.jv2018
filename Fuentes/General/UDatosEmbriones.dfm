inherited FDatosEmbriones: TFDatosEmbriones
  Left = 37
  Top = 16
  Caption = 'FDatosEmbriones'
  ClientHeight = 683
  ClientWidth = 938
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 938
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
    Width = 518
  end
  object PCDatosEmbriones: TPageControl [4]
    Left = 0
    Top = 65
    Width = 938
    Height = 509
    ActivePage = TSDatos
    Align = alClient
    Images = PngImageList1
    TabOrder = 2
    OnChange = PCDatosEmbrionesChange
    object TSDatos: TTabSheet
      ImageIndex = 14
      object GBDatos: TGroupBox
        Left = 0
        Top = 0
        Width = 930
        Height = 459
        Align = alClient
        TabOrder = 0
        object GBDonante: TGroupBox
          Left = 2
          Top = 16
          Width = 926
          Height = 140
          Align = alTop
          Caption = 'Datos Geneal'#243'gicos del Embri'#243'n'
          TabOrder = 0
          object LMadre: TLabel
            Left = 76
            Top = 26
            Width = 36
            Height = 13
            Caption = 'Madre: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LPadre1: TLabel
            Left = 76
            Top = 53
            Width = 31
            Height = 13
            Caption = 'Padre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LServicio1: TLabel
            Left = 76
            Top = 96
            Width = 41
            Height = 13
            Caption = 'Servicio:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LPadre2: TLabel
            Left = 76
            Top = 70
            Width = 31
            Height = 13
            Caption = 'Padre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object LServicio2: TLabel
            Left = 76
            Top = 111
            Width = 41
            Height = 13
            Caption = 'Servicio:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label8: TLabel
            Left = 25
            Top = 26
            Width = 44
            Height = 13
            Caption = 'Madre: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 27
            Top = 53
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
          object Label11: TLabel
            Left = 27
            Top = 70
            Width = 38
            Height = 13
            Caption = 'Padre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label12: TLabel
            Left = 16
            Top = 96
            Width = 51
            Height = 13
            Caption = 'Servicio:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 16
            Top = 111
            Width = 51
            Height = 13
            Caption = 'Servicio:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object GBCantEmbriones: TGroupBox
            Left = 552
            Top = 0
            Width = 458
            Height = 140
            Caption = ' Cantidad de embriones '
            TabOrder = 0
            object Label7: TLabel
              Left = 10
              Top = 36
              Width = 224
              Height = 22
              Caption = 'Cantidad de Embriones:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object IConfirma: TImage
              Left = 334
              Top = 87
              Width = 31
              Height = 27
              Cursor = crHandPoint
              Picture.Data = {
                0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001C00
                00001C0806000000720DDF94000000097048597300000B1300000B1301009A9C
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
                67414D410000B18E7CFB5193000006624944415478DABD96776C94651CC7BFCF
                BBEEEEBD49D7F55A6C6945667B226A350AC8086A0517A81847541C0412C08146
                5450902804A44011E3421CFF8869092361A340400C58A1200AB6A52DB3B4576E
                BD37DFE1EFEE8A688C0345DFCB7377CFF83D9FDFF35BCFCBA472C0E806B002C0
                E40038173533103F08200CD87A01723620184007F543D4528FA1D317C32F4FBA
                7FFEE16133CC9888201AF8045621356764A6D8DF05F2241448024A04D0E9578F
                D3BCD005A3A647E997EBEA4BB0C38C9908E010AFE1632341FBAB346E5C041024
                642DCA08859B81482B8DB932109D4E1AA6F5AA8DFAA40C8A31DA5162AF56DA94
                EFB5A8FE048EE00C0BD25CE222819642DA9C4EAA1C07A22768CC7901A81C2620
                C9193C2ABDA3CA96CCAE9CD5736BE397A8DEB6B406DB3085C570CAD02E25B01E
                48BA7177FF11BDAAAAC754170F73DF0C4557F0ECAEA9786FF9876B518F2988A3
                F9D200C98C7E1F1EBCF6DEB2F97347CEF3543807A133EA835D72204E769CFFED
                3CBCBBEEFD4DCA86C8D3BF0332274C04941307E18702E3AF801A992959802707
                7ABD6FBC36744E4E1FCB007444DA90D45351C250E22C457DC77E4CD8FD148E7E
                D4FCCA05A007101D300B856CA6E8E46E54766B33E0C30E7BDF3F0052D3EDE055
                2726DC30FACA394FF79BDEAD58EA0D5FEC2C545AC4C8992E53169AC34D585257
                853DAD7B105F6354658064462D17B2A51C332A070F7FAEC8ED1157ED5C7BE0D4
                E6E014672E76C8F9BF07861B218A0330A962B077F6F8BE931DF95C313A13BE4C
                1813CC2938D11A398E770E2FC6BEA387A0918CBA052F32A93F6DE284431A2CCC
                1A3AF2EAA98F5EFE38CB12F2B039548BDAEF6A8E9EAB53A65A4DD8C0F40BC040
                234CF47976D038EF2B632F7B4C7626F311503B88C5D2301B6FC709A5052B9B57
                A0BEE527441A81D84ED4E020A631BE3FDCE6116CE6B031D74CBAA7E80170499E
                1C1D815592519FDC8D8D47D6B5B6D787A7F0E7B05A2E212DA3B0E812A6570C2E
                7FE166CF589335998DA0E62798014E17280064B4D0F1379FADC5B1932711F891
                14DC8A2F8C7A3C4395E92473DE85C9F647B1F80AA92F1BE61E0197DC0D49C420
                301EB26846133B80AF9AB69C3AB93D34C96CC7165377BCEC2DEB37EDC69C5B45
                296945540BA76B1C6788100D139AA28DF8A67303DACFFAD04EB9E95B8F4FD57D
                789EAA521B953C30F7382CF43C82673A43805D706080BB0C3D1CA5B008324CBC
                405164C209F613F6B46C6FF007430DDED23E43AE74DD20F3BA9922310E8E144B
                25625C8DE158A401ADF17A447C21B4D631E3CC1AE383441D5E247D3A2175D552
                DB70CC2E7D1833ECB9A40DF95B273FE4D95C28940B9023E7A473C926DAD1C15A
                10D6FD28127B4124E9B811834A752CAA46E04F74E2788CF284299082028EEC8D
                AB2D35EAB2C45ECC247D02E91ACB7701856C5C9D350A6F97DC8AEB5C050C3EDD
                409C72CB2CA59A40BEB44096CC699F5A79191CD9C6A0F2AF91D9C35A90607E84
                B424B228A76C7E270EECEA4836D64617258FE175AD0321D22E73519C07F25470
                C9CF03B36FC3DB7DEF14AECF2A90D0AE2590305498A49446949FB4D82A5AE0A0
                50B7302B244E4C477FCC88226A84C90A76709D56ECD9DA1AFD6165E82DB51973
                295815AD3D73A3FC16E8CC5C6B64C9F2BC3BB074C07DF290BC223B4EEB01C4F4
                18050E0797E4A413E4C1C1774B87BCC84974429D4C1A874DB0C2D719C4C6CDFB
                9543CB0373928DA8A203C45366FC432047837A389D42BD0BC6A2BAE2A1AC9185
                C53968354E5360C4D0C352821CC103979005BBE882C844308ED1FF2C34B53762
                E5FA4DC1FDCBFCAF26BFC75232820A4BFA007F0E4CDD63E90897D083A04B868C
                F7DCDEB3A4183E4601C64CB8CCDC13B9623EEC246015ADC8118B51D7B6171FAC
                FBF45C5DB5FFA5C461BCC773D039DA8F8AC2DF0026BAA031627AD03D7F045B70
                D3F8A271D7F6AA802A6A041551682A818712B13B95A79DA7E9AE5BBBA86DDFE2
                E0F4C40F5891F20A651138FB450253578D2937BDA8307B28E68E9C58FA5065FF
                3B29802C14A51678E5E1D87B7617E6AD79FDCCBEAAD00BB1C3F8ECFC1BCB3F07
                BA337DBA61DC79B760CE2D534B1FBBCFFB04DFCF3A08DFF9B7A37AD582135F2F
                0C4C530EE1F35FBD3AFD3B2085213485C634B8F22A31EBDEE96593CA7B7A859A
                9AF5CDBB979D7B8EFC5D1B3E0A5C522005681AAAA9B096DC8F37B3AFC290864F
                F0AA16C76A8364C23FFE07404A352463A985C8A69643397EC49447D3C67F0CEC
                7A0BE5CDD988FF2B60EA1EFB3F9FFF1DF833A9DD33D5A1F80B88000000004945
                4E44AE426082}
              Visible = False
              OnClick = IConfirmaClick
            end
            object LConfirma: TLabel
              Left = 325
              Top = 114
              Width = 47
              Height = 14
              Caption = 'Confirmar'
              Layout = tlCenter
              Visible = False
            end
            object Label13: TLabel
              Left = 328
              Top = 127
              Width = 41
              Height = 14
              Cursor = crHandPoint
              Caption = 'cantidad'
              Visible = False
            end
            object EACantidadEmbriones: TEdit
              Left = 239
              Top = 33
              Width = 58
              Height = 32
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = EACantidadEmbrionesChange
            end
            object BConfirmarCantidad: TButton
              Left = 96
              Top = 96
              Width = 105
              Height = 25
              Caption = 'Confirmar cantidad'
              TabOrder = 1
              Visible = False
            end
          end
        end
        object Panel1: TPanel
          Left = 2
          Top = 368
          Width = 926
          Height = 89
          Align = alBottom
          Color = clWhite
          TabOrder = 1
          object BBEliminar: TBitBtn
            Left = 362
            Top = 6
            Width = 178
            Height = 35
            Cancel = True
            Caption = 'Eliminar Embri'#243'n'
            Enabled = False
            TabOrder = 1
            Visible = False
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333FFFFF333333000033333388888833333333333F888888FFF333
              000033338811111188333333338833FFF388FF33000033381119999111833333
              38F338888F338FF30000339119933331111833338F388333383338F300003391
              13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
              33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
              33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
              000039183811193333918338F8F833F83333838F000039118111933339118338
              F3833F83333833830000339111193333391833338F33F8333FF838F300003391
              11833338111833338F338FFFF883F83300003339111888811183333338FF3888
              83FF83330000333399111111993333333388FFFFFF8833330000333333999999
              3333333333338888883333330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object BBAgregar: TBitBtn
            Left = 672
            Top = 6
            Width = 178
            Height = 35
            Caption = 'Insertar Nuevo Embri'#243'n'
            Enabled = False
            TabOrder = 0
            Visible = False
            WordWrap = True
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
              33333333333F8888883F33330000324334222222443333388F3833333388F333
              000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
              F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
              223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
              3338888300003AAAAAAA33333333333888888833333333330000333333333333
              333333333333333333FFFFFF000033333333333344444433FFFF333333888888
              00003A444333333A22222438888F333338F3333800003A2243333333A2222438
              F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
              22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
              33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
              3333333333338888883333330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object BBCancelar: TBitBtn
            Left = 362
            Top = 45
            Width = 178
            Height = 35
            Caption = 'Cancelar'
            TabOrder = 2
            Visible = False
            Kind = bkCancel
          end
          object BBTerminar: TBitBtn
            Left = 672
            Top = 46
            Width = 178
            Height = 35
            Caption = 'Terminar'
            Enabled = False
            TabOrder = 3
            Visible = False
            Kind = bkOK
          end
        end
        object PEmbriones: TPanel
          Left = 2
          Top = 156
          Width = 926
          Height = 212
          Align = alClient
          Color = clWhite
          TabOrder = 2
          object GroupBox2: TGroupBox
            Left = 1
            Top = 1
            Width = 301
            Height = 210
            Align = alLeft
            Caption = 'Datos de Colecta'
            TabOrder = 0
            object Label1: TLabel
              Left = 44
              Top = 44
              Width = 90
              Height = 14
              Caption = 'Fecha de Colecta: '
            end
            object LResponsable: TLabel
              Left = 68
              Top = 81
              Width = 66
              Height = 14
              Cursor = crHandPoint
              Caption = 'Responsable:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LResponsableClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LPrecio: TLabel
              Left = 99
              Top = 116
              Width = 33
              Height = 14
              Caption = 'Precio:'
            end
            object LCentros: TLabel
              Left = 22
              Top = 150
              Width = 110
              Height = 14
              Cursor = crHandPoint
              Caption = 'Centro de Transplante:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LCentrosClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object DBDTPFecha: TDateTimePickerAuto
              Left = 139
              Top = 40
              Width = 129
              Height = 21
              Date = 39673.722869097220000000
              Time = 39673.722869097220000000
              Color = 14679807
              TabOrder = 0
              OnChange = Change
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBAResponsable: TDBLookupComboBoxAuto
              Left = 138
              Top = 76
              Width = 156
              Height = 22
              Color = clWhite
              DataField = 'ID_RESP'
              DataSource = DSEmbrion
              KeyField = 'ID_EMPLEADO'
              ListField = 'NOMBRE'
              ListSource = DMSoftvet.DSResponsable
              TabOrder = 1
              OnCloseUp = DBLCBAResponsableCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEAPrecio: TDBEditAuto
              Left = 138
              Top = 113
              Width = 104
              Height = 22
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'PRECIO'
              DataSource = DSEmbrion
              TabOrder = 2
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBACentrosTrans: TDBLookupComboBoxAuto
              Left = 138
              Top = 146
              Width = 156
              Height = 22
              Color = clWhite
              DataField = 'CENTRO_TRANSPLANTE'
              DataSource = DSEmbrion
              KeyField = 'ID_CENTRO_TRANSPLANTE'
              ListField = 'NOMBRE'
              ListSource = DSCentrosTransplante
              TabOrder = 3
              OnCloseUp = Change
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
          object GroupBox3: TGroupBox
            Left = 302
            Top = 1
            Width = 623
            Height = 210
            Align = alClient
            Caption = 'Datos del Embri'#243'n'
            TabOrder = 1
            object Label5: TLabel
              Left = 23
              Top = 135
              Width = 101
              Height = 14
              Caption = 'Cantidad de Lavajes:'
            end
            object LCalidad: TLabel
              Left = 478
              Top = 26
              Width = 38
              Height = 14
              Cursor = crHandPoint
              Caption = 'Calidad:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LCalidadClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LEstadio: TLabel
              Left = 393
              Top = 26
              Width = 38
              Height = 14
              Cursor = crHandPoint
              Caption = 'Estadio:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LEstadioClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object Label4: TLabel
              Left = 97
              Top = 36
              Width = 28
              Height = 14
              Caption = 'Serie:'
            end
            object Label6: TLabel
              Left = 61
              Top = 104
              Width = 62
              Height = 14
              Caption = 'Nro. Envase:'
            end
            object Label2: TLabel
              Left = 54
              Top = 70
              Width = 71
              Height = 14
              Caption = 'Nro. de Orden:'
            end
            object LDestino: TLabel
              Left = 329
              Top = 97
              Width = 39
              Height = 14
              Cursor = crHandPoint
              Caption = 'Destino:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LDestinoClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object LDesc: TLabel
              Left = 308
              Top = 134
              Width = 60
              Height = 14
              Cursor = crHandPoint
              Caption = 'Descripci'#243'n:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsUnderline]
              ParentFont = False
              Visible = False
              OnClick = LDescClick
              OnMouseEnter = LabelMouseEnter
              OnMouseLeave = LabelMouseLeave
            end
            object Label10: TLabel
              Left = 449
              Top = 51
              Width = 15
              Height = 14
              Alignment = taCenter
              AutoSize = False
              Caption = ':'
            end
            object Label3: TLabel
              Left = 41
              Top = 166
              Width = 81
              Height = 14
              Caption = 'D'#237'as desde Celo:'
            end
            object DBEALavajes: TDBEditAuto
              Left = 138
              Top = 131
              Width = 130
              Height = 22
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'CANT_LAVAJES'
              DataSource = DSEmbrion
              TabOrder = 4
              OnChange = Change
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBACalidad: TDBLookupComboBoxAuto
              Left = 465
              Top = 47
              Width = 70
              Height = 22
              Color = clWhite
              KeyField = 'ID_CALIDAD'
              ListField = 'VALOR'
              ListSource = DSCalidad
              TabOrder = 5
              OnCloseUp = Change
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAEstadio: TDBLookupComboBoxAuto
              Left = 379
              Top = 47
              Width = 70
              Height = 22
              Color = clWhite
              KeyField = 'ID_ESTADIO'
              ListField = 'VALOR'
              ListSource = DSEstadios
              TabOrder = 6
              OnCloseUp = Change
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEASerie: TDBEditAuto
              Left = 138
              Top = 32
              Width = 130
              Height = 22
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'SERIE'
              DataSource = DSEmbrion
              TabOrder = 0
              OnChange = Change
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEAEnvase: TDBEditAuto
              Left = 138
              Top = 99
              Width = 130
              Height = 22
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'NRO_ENVASE'
              DataSource = DSEmbrion
              TabOrder = 3
              OnChange = Change
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEAOrden: TDBEditAuto
              Left = 138
              Top = 67
              Width = 130
              Height = 22
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'NRO_ORDEN'
              DataSource = DSEmbrion
              TabOrder = 2
              Visible = False
              OnChange = Change
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBADestino: TDBLookupComboBoxAuto
              Left = 379
              Top = 90
              Width = 156
              Height = 22
              Color = 14679807
              KeyField = 'ID_DESTINO_EMBRION'
              ListField = 'NOMBRE'
              ListSource = DSDestino
              TabOrder = 7
              OnCloseUp = DBLCBADestinoCloseUp
              EsClave = False
              EsRequerido = True
              ISParam = False
            end
            object DBLCBADescripcion: TDBLookupComboBoxAuto
              Left = 379
              Top = 130
              Width = 156
              Height = 22
              Color = clWhite
              KeyField = 'ID_DESCRIPCION'
              ListField = 'NOMBRE'
              ListSource = DSDescDestino
              TabOrder = 8
              Visible = False
              OnCloseUp = Change
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBEADiasGestacion: TDBEditAuto
              Left = 138
              Top = 163
              Width = 53
              Height = 22
              CharCase = ecUpperCase
              Color = clWhite
              DataField = 'DIAS_GESTACION'
              DataSource = DSEmbrion
              TabOrder = 9
              OnChange = Change
              OnExit = DBEADiasGestacionExit
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EANroOrden: TEditAuto
              Left = 138
              Top = 67
              Width = 130
              Height = 22
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 6
              TabOrder = 1
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object BReceptora: TButton
              Left = 388
              Top = 168
              Width = 139
              Height = 37
              Caption = 'Seleccione Receptora'
              Enabled = False
              TabOrder = 10
              Visible = False
              OnClick = BReceptoraClick
            end
          end
        end
      end
    end
    object TSDetalle: TTabSheet
      ImageIndex = 15
      OnShow = TSDetalleShow
      object GBDetalle: TGroupBox
        Left = 0
        Top = 8
        Width = 892
        Height = 465
        Caption = 'Detalle'
        TabOrder = 0
        object IEliminarEmbrion: TImage
          Left = 771
          Top = 48
          Width = 107
          Height = 66
          Cursor = crHandPoint
          Picture.Data = {
            0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000006500
            0000440806000000988CFB5C0000000467414D410000AFC837058AE900000019
            74455874536F6674776172650041646F626520496D616765526561647971C965
            3C000015D34944415478DAED9C097C16C5DDC77F7B3E670E0E21912B48384521
            68AD560ED15240D18A82487D5B095A6D95435E5104DA57AC221E15013FA85594
            7802A2822828A8359C0A55C24D42120892908424E47EF2ECF3ECD1FFCC3ECF93
            D0EA2B848024643E99CCEE3CCFCEEECC77FFD7ECEC23589685E6746E25A119CA
            B9979AA19C83A919CA39989AA19C83A919CA39989AA19C83A919CA39989AA19C
            83E9AC401104E18CB45B3672502C157D7FE8B3D815EB53CF547FCEF498352A28
            04E11A2A581E142A7F2AE550DE41793DE595042AA721AEE3BC87422012A8984C
            791CE5D8D3BC1406E80DCA2904A8ACBE8D9CB75042301E850D2392C43671902F
            268D2559086EFE0CCEDF4F803A6C34FFAC66FE4CE8E93BE07E643EACAA2AE8DB
            3642FBF403C060237962F394E7539E571F38E71D94909D60301EA86D80B24C40
            623C887A6575A4BAFAB1F170DE3E095277DBAC04562D869E9106F7430B22DFA9
            4C1E04C7ED1320B48883BE7533025F7D76C2E9284F213029A7D29FF30A0A0161
            A3BB8272023FCEE38563C428A894CD9202D43C3B09DE17D644BE5F3DF336C0ED
            85F3B649B06A2A10F8240596AF0AAEFF5D00B12541D8B911350B6712C80DB5C7
            CC9E0C7DD74E2078C2A957524E3E59A9396FA0109071542C8E5428F4D7A70FDC
            33E647AA2AFF34904B85D42111FAEE8DB08E17D852144A62BB4408AE28987999
            1C0E5359AC7B9EE98B21B64F247055F0CD1A0FE5BAD190FB0E40CD0B4F41DFBB
            237C780EE5910466C74F5DEB79018580CC82ADB2B874B8264D832001DAB217E0
            9AF02484D67108AC7E1DC1F5CB6D0822E0BC6B36E44B06F281AE993B0E529724
            525333797BFA9E0DF0BF3E03D24549BC5EDFB5D106545D0DB3A800512FD74A4E
            D5B4BB606466472E85F2E09F02D3E4A11090E711B61F34D8D16F7CC2C1B0E49B
            3B0946561A07A40E4F86D4AD1F8CECEF10F86231BCCF6E8AB4E17F6502440220
            5F7A031F74ABF228B415B3E199B5962427D4D6E3A3611693649920E82F40EADA
            974B53F5436380983898470A095AD5498169D2504E50590444705BF0CE5D0691
            24C324D55433271956A08A0FA06BC20B91E3AAA75F0DF54632F05D7EC19090A7
            550CA9533C0D7800DC58582C6B3072F221786399F8C1FFDE6B101C6E489D9348
            32767020CC43932FE90FC718829F9385EABF3E7052609A2C945020F815DB9612
            12E19AFC088C0369A4A648FFD3BE559A0FE5CAE1300EA5C12ACF877BFAFBFC38
            B32013352FDE49E3DC86BCAC97688474AAD5EDF23FA0C064652092CDE20A2A5A
            92ED217BF2E283241D59E44E2743BD613C6F3BB8FE53F8163C1D769F732827FD
            90F16F9250426EEF21CAB12CEEF03EB728A2B22AEF1BC0D595E7B1E510C88362
            C9F7CCAD440EDCA3320E6FE777BB9CF45BC8BD2F3D2528769DC6A541DF7708DA
            DA1D10BDADE0BC7B0E3F97FFB539086EDD445214B95E360B30F27C81C2DCDE9B
            D9B6D4B12DBCF396F17AA6566A164CA49884D4D8F3B536C337F7165815A48A44
            BA56CAAEA95FC2CCCF2695D5A65E50786969DCF007BFCE446043162CB23572EF
            0170907B1D58F53EB44FDE0F9F9E79642B9B349413D45622B9B04E8B43602ACC
            C84E837801D993C24C288346D3E7FD68D0967220EAB007B8E31558F337A8B73E
            03F3D831C8BDBA9C1614BBCE0F23F738B495FBE1B8E3296EBF5862F625E42E33
            F5D5B9AE1A6B8A5018906B98DA8A7A7929AF635E9679902271164F50AC61E693
            DD5878279F4A61AACC79E742889DFAF1EFEA5B5E819EB60452AF9B09DC6D0D02
            C5DEF643CFED0AB9DFBDFC3C352FCF4160DDDAF0653F46506635492875A5C435
            611AD46B87F37AFF5B4FC22ACB876B621D0FEBD15F1110938371DCF634DDC174
            A85609EDFD7B61956450A314ED8F238FCAED6830285C6A8EB5857EC0410EC76A
            98D54238F23F415A9A1A14DB96D0AE3A6C285C7F9C0E33378B22EB89348E9570
            4F2549B9B02BC5184F907A3A00E7ED4F73CF2BF0D15408715D29D23B0A21269E
            67337315C4DE13A15C35A441A1C0F4515903B3320146517792E294703792C373
            644D064A68D697795CA4A2DA426A4F9E14A92C81EC095365026506027A25B731
            EEC91F42888DE7C70796DF4B2AED5BC857DE03F90A5BBDE8DB5E82187729B5D5
            F18C40212F80B6AB50F34E10816D123BE50E8292D4D4A0B0A89D45EF887ECB8E
            DAB5E50BA0EFD908F7238B79E4ADA7AD26833B9B409964475E84D8B19FADB252
            6EA431AF803AF25592A4CB789BC6A15DE47D5DD0A036E587A00477FAE17B5D0D
            7785A9B09CA60485AB2EE58AFE04E1095ECFE6B398B4846D8991BE1EFE658F70
            280C9AD463202C9210AB3A2F2451DD20FFEA21B23FFB49F707A0F4BFFE8C4381
            55898AE96EAAE22A984DF3CF6B4A504A693356EA9A08CFA3F3F8C4A2FF9519DC
            6670282429DA926924098950874EE1AA4C7BE777105BC4C1317609E08882FEE5
            0330F3FE496EB40762CFF1902E1E7156A0F816C908EE610E851D4C360928E5B7
            5CC39CFF347E42B7158A4D685BA13294F9364983EBCF6F426CDB951F17F8E01E
            881D2E8BD81173FFDB30762F843C6431790AED69BC0E515C137BC6A1689F5AF0
            AFE5330E3904A5735381720D42AEB077DE223EE1E87F93DCE0824CB8A62DE652
            A3BD3B0DC691ED708EA500AEDB201E306A2923C8151E0465F85CDE8EBE2E9947
            F4F2AF536C488539D49674C6A1E8997E542F6CC5CF4950CEF8989D2D28B3A878
            9445EDDEB98B785DF0ABF7F8B310F5FAD064E0578B10DC487187D7C35598759C
            6211A39C4B90D0229EDB14F88F9043E0863C6C058D974883567C5624C52CA944
            E5E371E1EE24C57C98FA930FC21A0F94CE897CF29125EDFD05F4AF0A8E3B66D8
            FB2C3639F21DC52F93F9347EF0F3C748D579A00C798C76CA617CFD571AA4325E
            27C806848B9FA228BFF759B129B04A513EA57DB83B83094A6A9381C2667A95CB
            FA507C4151F3BF3EE58F7CC58E5DB83498C59914E18F8732E86E7E4C70DD2C1E
            A784ED89F1EDD3DCEB62AA8B3DFB903A46832F53698672FA501C236F85C09607
            31287A1594C1A342FBCB08CA5D1128DCC8331778C0541BCA96BF40888A8778C9
            FD7CA250EE796133948680C2D66B791E9FC7EBB8FA2235E5B86592BD4FEACBC8
            5A0FE5CADB685C2B61EC7A97BC311372BFB11C9A99F136840BFB458CBC55BA1B
            424CEB6628A70BA5AEA167812383A20EAF6BE817F145124A9FEB61647C0CCB97
            C78348B9EF58525DE9B08E7E4120E2C8D87B60593D21FDF28F0D3E21F943502C
            5F392A665CD8E4A0B0075A2CA287E72F8FD3404741FB802425500975D4440E27
            F0D93C5855F9703FFC39C5315EDB257E6304D4117F87D879306F475F39947B60
            E2A57F86D86B228C437BC8B6C49C71284DD525AE0D1E3D16A4C42E3476557CE0
            59C028447BB8CB6B1995704FB3A1B0E49F7F1994A1648A7ADC644359371E56F1
            565B85797AD2781D269738FA8C43D1520DF857B2F3A08CA0B468125042D32CFC
            44CAAFAE867BEA6C5E5FFDE868FEA491AD54B1FC55D0964EE3D32ACAD02930F6
            7D0C7DC3737CB9A932F0411E34EA9BFF0F028B5D5A7523697994E299869D902C
            599F0B5FFA5188E525A4B23438A24D7E9D5A85481FCBD00A9C0579D9C6D86B0E
            EC49FDB1BE36C4789E4D28FC89A33A78185C131FE1F58135AFF368BEAE5D09B0
            00920C3C5B1C2175EE07237D150DD0516EEC959B5E85D8AA3BB9C74FD10DDD1A
            CAB5B7370894B2EFF2707CD956B4EAA4C1D5AD37A4B84BC976D9865D505C2438
            C72944CAA5203213BEBDFF42C901253577A7630AC1F9AF20B2B141E153F7CC70
            B3A97B967CCF93E7C5960FCD5ACEF7B50F9E80BE7B35448AEA5D53BFB03B5974
            8024682CC40EFDA0DEFC6AA44D7DF35CC8578D3D6D2887177E0D67DE4EB418D0
            1F52A72B285ECAA18F2AD899E9E6B0A7EC2D7F25C1F100CE68882D3B40DFF719
            CAB6EF43CEB7CE29576EDF37AF31434940F821574BB2212EB2216457C20FB910
            451E5551A66D633C0465F28A5ADB32EF724032E118BB94BCB36EDC41D052AE27
            C979F1B4A6598ECCFF129E637B1135640C9FF2B12A0B2175E8FDE31DD1351879
            E9A4523BD8B3DC5B3EC2A134474ADF4DE9C98D120A4B048619FBBE2C8874DD7D
            3FD4A1A3F9E360DF33C904A62D5C0FA6F0875D7E665BA894936E8091990AE360
            2AB7356C3E4CA08012D5A4CEA229DA1FFC247D5FAB17949C1752E13EF02D627E
            7323CCFC2C48F10910BC2D4FAA3F66D1119895E5FC5A2BBEDE8C9C7D8EE45FA6
            ED4B69AC50C621B44C950591FCE51FB0977D26917A4A8C0492464E1AFC29F771
            3BC2A4C679FF4A088E285B952D19CB8DBED0A21B94EB66D64B52CABE3D88B2E7
            97E182BE9D68DF80D2EB32F240D453EA9355510A23FF08495729CAB20BCBB2F6
            3993C8C634C853C99F638911536109E1E89EADE9F53D399EAB24375B1549775F
            70F3328A5BE67355C65645BA26AE881CEF5F74135F94275E3484BCB2D1F5B229
            071F5A82D615F64A7BB5FFB52475F57B6BCF3894057DFF2EBE7DE4889AD2FBEB
            F4E4C60A651C42D22275A778A5321FF2E5FDF9B254364929764AA4BBF0289CEC
            B506C182467064B64CB52F5B519F01FDBBA570DEFB11F43D9BEAB518AF2A3D17
            450FBF8696313AA4AEDD2077ED7E5A7D0B6EDD425E59098E97CBF83E5FED3C28
            63774EA3831202C3DD63EE0E0F1D0AD73DD3793D7391036B17F3494AC7CD9379
            1D57658BEFE38BF298DA921292E0F89F97EA0D25FBB9B568B57513A92B198E41
            03A8544EAB6FE6F1E304E65BBEBDF3903B99A0A4345628CC983030B175E7C3F8
            5AE2F91321764C84FB61FB0D0963DF06F8DF7D84BFFCC39EE73329624B58C576
            3D21C69FFA5AE2EC896FA0D56132EC09ED20F54C8479B00482BBFD29F5279C2C
            A380AE2306FAD61D04A71CB9E5A4C2D2F627D7ABB19F1B4A08CC3884D4180B28
            D521C3A07DFC3A7F1F45F47A796C20F719007DFB1AC8BF184E9FDFC58FF32F99
            06236303D99A8BE09AF0F75386B2FBEAC7D1DE1B8072556F08E4861BBB0A11BD
            E2CB7AF5ABE2B78321F58D8779B8007AC6611CF329A9DD77A60F6EB450426018
            94717C87B4884C36C6F3B7D7F8AEBE750DFCEFCCE1CB569D773D09B9F7405ECF
            DE57D1DE990675F86488EDBBC0AA2AA2BBBEFD8F42310E1FA1865DE43C7C0EE5
            CABB9135EA0F68A3E8902FE90429A9178C6D39885AF271BDFA5539F6464897B6
            45F09B3D30BF2F46B921A526ECCA68DC50FE138CD48554D9B38B6A3B7DDF40DB
            D3227759BD3E99D44C14B455F3EDF71B6FB26D0E9B33AB9E3914EE29FF2055D2
            99050A046029D19320260CE0ABF9ADD202543F318ABF5AF7FDDA12C44B41C857
            7787D83A06C6FE62447FB0AE5EFDAA18F96B883D5B93A41C2389FB1EE52641D9
            DB04A0FC17181A44E7DD13C8BEA4F11748DD5317F0B780FD6FCDE6411EF3C8A4
            AE4970DD6F2FE0338F66C2376F1C3CD33FE093972C691FCD87B17723D49B2641
            70462198FA1EF4DD9B38949C6D1ADA951F278FEF228276018C1DB9F0BEFC2E49
            5DBB53EA93999B87AA3FFD8ED4577BF21AB3094C31BEB7D4D43E19FB1A3714D3
            346118A66859A6E2FBFD88C5086863ED03E8CFC156DB8F232FCCB69BCC096073
            65123901829B6CCEF17C08ADE2084A16B73F6C61387BE9874D9704372C077F45
            8E329BAA71DC3A1142CB0B11DCB20639EFAE439BEC5CDAF7421DC196C5EA30F6
            1C3DF54E3964BA39DAD8CBA33EDC46AEA38E839263DEE5197BA7344A28866108
            86692AA66138088A4B377427D5B93067C618313BE3218AB2F9A4175BFDE21C3F
            8147FE818F169387930F67B2BDFA25F80DD99C37E740E93B80BF23CFA66B9864
            89EDBA42BD611CFF0EFBB103F6129063B43D53C002D583B75C075766299C9649
            DFEB47304F6E6AE5C792FEDD4172460EC22F88C8941D23C9255E795A0D9E6D28
            2419020DBE42D9A9EB868760B8A8A4CC4ADDCDC08869DB3AB957BC35452A2FED
            113E5E6C1BC7DD61F5865170DE31D1067B80DCE78533E09D5FE717289E180FC7
            8DC9DC6BE303B6632302EB96937BBD80BFE7A8BDB718BE55EF236F7711DAE901
            F2BE5C708CB99AEEFAFAC52A56850F8115DBD8168EFA8D9CDED9E90DB27AF2AC
            41094987D3A0C10F5266108241DD53BB6F10141B0CFB2CFA93F7067A776E1B22
            F97D3191763C5EB005E2D2C57DA0EFDCC473D48BABB93A63A9EAA131E43A8F82
            FA1BFB07747C736792BEDFC417F399050591EB395A508D9679657076231B24C9
            5086F63DC51E51D282082CDF4231552BD4ECCD45BA20B3E72B0DB2F8FBAC4061
            E72035A5926478740211D4831E06410F06699BEA6C48761D950C0E932406ABF5
            C6B549D107F6F4709514B6F9A1B6D9B43F7B7AC95493F17D96DD299797BF23FF
            43A9BC53D7C3A5093DB28C7FBCDDBFCB855EBE6A9B45F5EAF0CB4EBE3FFE0082
            FFDC0521C64931533E0E5705762465EF6FB07757CE161441E72AAB160A9312B6
            4F2593108F0D259C0D4F58926C80BA472D2A68DD32734F87D823D96DA28B0BBC
            277B6E5D51CD8AD6F155A51D138F1577BB845CADE80A5996AAE58C03CE16CF3E
            3FB263422B889D5BC33A560D79200594CEFF5F9559E53EB267FBC94D6F097DCB
            01E4556A6525B23C38FC14B23141811186C2408406DC86120C490A07614B09FB
            CC3042DF094624286483B89AF3161E8D11B51A67ABC25C177F919BC0836B4AC1
            221046798B369A3F3AB6468B6959254B924F92E51A82E19365B95A96641F0323
            AEFAE4A2988F570F6A1FA53AE4ABBB92746904C549C6BF154981E7843E988565
            B08A2807FC80AA40FF6A1FF2826679594CCC7503B67FF35DDDBE360A28CCA6D0
            A08A6453DC4644026CBBA2D7AA2F77180EB32BEC7B04C645DF63DB2E06898165
            D9344C07B5A592E3A05AA6299B96C5A62B853AE73328EBA228EA9228064449D4
            2449F287B34355034EA7C3545555D077EC6A1B786EDEB0B645C59EE8C4B614A1
            772007C0C901896DED297DE37011818A8599534441622E2A0BCB51141FB7DF7D
            CF5DB32EB8F9C65D0E87A398DA2AA776838D0A0A4B2130DCD8F3BB9FDDF9B654
            843D301707529B0982C94038380C93D92506C308C3902DD3922C58227BA41E02
            63D1E94C3A276591C030385290C0040890A6288A4E404860D80378C1416D3949
            5ADDE52FBD92E4FA665BC71625C79D1EC38423BEF6198B1520A35E528D6A4944
            698BD8EA9AEB066F8EFAC31D5F389DAE4297CB49D955E8A692E01CA3768D4605
            85251A5CE61ACB0C8EC961F0BB9FC72ACC3D0E4B830DC26483C64A2E1521C950
            6C18267B3942A2EB0FA92ECA0C0CA92F1B0C83C225C62089098A4C72080C0D9A
            4583E7A27A17B5C76D5A40F347D5F8B5986A9F2F3AB02F3D0EDBD3DA08F9F96E
            478D9F46D8B282B1B101333EAE42E8D1FDA8DCABE7A130841094027BDF45FB1C
            4AB0FE23F53341092716CD5316292B5C1571C9606A894B451884C364718D0D44
            A16B9543A514CAA29DD91ACBBAE7E3F17C485AEA480C95822804554511255972
            9BA6E52529F10603018F5FD33C1AE54020C84A66FF14FA9CA9458B1D2B49728D
            AA2A552469E50E875A4A604B58763A9DC504A3885457317DE6A71BE0F4C7EB5C
            98FB6289C53134E0129322D39606C50CC330F9B61C91100261DB911010929470
            2F04FB1F9B6009490B98B49821208668030A327B436A4D302D528941DD190804
            58BCC454A833A42A9590F3007E3C491BB3472409CC59203872054160B95A9165
            2E81ECBB8DCEA69C6A62A0D8C0984C1A4C3647066E3F1814D812C27F27CFB27F
            0BAAD6D023A2C2D8EFE18525C60087234424283C90E1731114C9E2D21B924284
            A08041E1900D51920CB24D271C5B37351A28CDE9D4D2BF012615B2694E8E1E88
            0000000049454E44AE426082}
          OnClick = IEliminarEmbrionClick
        end
        object LEliminarEmbrion: TLabel
          Left = 777
          Top = 112
          Width = 96
          Height = 15
          Cursor = crHandPoint
          Caption = 'Eliminar Embri'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object BDBGEmbriones: TBitDBGrid
          Left = 2
          Top = 16
          Width = 759
          Height = 447
          DataSource = DSEmbrion
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = BDBGEmbrionesCellClick
          OnDrawColumnCell = BDBGEmbrionesDrawColumnCell
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
              Alignment = taCenter
              Expanded = False
              FieldName = 'FECHA_COLECCION'
              Title.Alignment = taCenter
              Title.Caption = 'Fecha de Colecta'
              Width = 102
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NRO_ORDEN'
              Title.Alignment = taCenter
              Title.Caption = 'Nro. de Orden'
              Width = 98
              Visible = True
            end
            item
              Alignment = taCenter
              Color = 16113619
              Expanded = False
              FieldName = 'DESTINO'
              Title.Alignment = taCenter
              Title.Caption = 'Destino'
              Width = 81
              Visible = True
            end
            item
              Alignment = taCenter
              Color = 16113619
              Expanded = False
              FieldName = 'SERIE'
              Title.Alignment = taCenter
              Title.Caption = 'Serie'
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NRO_ENVASE'
              Title.Alignment = taCenter
              Title.Caption = 'Envase N'#186
              Width = 91
              Visible = True
            end
            item
              Alignment = taCenter
              Color = 16113619
              Expanded = False
              FieldName = 'ESTADIO'
              Title.Alignment = taCenter
              Title.Caption = 'Estadio'
              Width = 67
              Visible = True
            end
            item
              Alignment = taCenter
              Color = 16113619
              Expanded = False
              FieldName = 'CALIDAD'
              Title.Alignment = taCenter
              Title.Caption = 'Calidad'
              Width = 69
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DIAS_GESTACION'
              Title.Alignment = taCenter
              Title.Caption = 'Dias de Gestaci'#243'n'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USADO'
              Title.Caption = 'Usado'
              Visible = True
            end>
        end
      end
    end
  end
  object PBotones: TPanel [5]
    Left = 0
    Top = 574
    Width = 938
    Height = 68
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 3
    object SBSelTodos: TSpeedButton
      Left = 551
      Top = 8
      Width = 74
      Height = 32
      AllowAllUp = True
      GroupIndex = 2
      Caption = 'Todos'
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C11E0000C11E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBA1CCB5BCD6C8FEFEFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF9F9F986C3A134C77836C475ABCFBAFDFDFDFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7
        F775BB9232C67484EFB5A4F3CB3EC2769CC7ADFCFCFCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F364B28228C068
        51E58D64EC9E89F4BDA7F5CF3ABD6F8BBE9EFAFAFAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEEED52AA711BBA5C1BD9602BDE6D4E
        E68B6AEDA278F0AF7FEEB030B96679B58DF7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE6E9E744A0610EB54F08CD4B00D14712D8582FDF7145E4
        834FE78C4CE68949E28625B45968AB7DF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDEE3DF36954F02AE4202C13D00C53C00CB4201D1470DD7541DDB6226DD69
        23DC6716D95C13D65916AD4C57A16BF0F0F0FFFFFFFFFFFFFFFFFFFFFFFF4197
        5400A43500B43001BA3418C64B30D1613ED76F34D86A40DD7548DF7C40DD762F
        D96817D25407CB480CA741489659E8EAE8FFFFFFFFFFFFFFFFFF2BA84B00A825
        25BA4858CE7664D58264D88542D36E11CE4F18D05553DB7E64DF8B64DE8A64DC
        8856D67C1AC54D01A033398A45E0E4E0FFFFFFFFFFFF8CD09727B0417CD28F7D
        D6927DD8944ACC6D02C43E15D85A25DB6814CB4E61D9857DDF9A7DDE997DDC97
        78D89128BF4F0097282D7F34D6DCD6FFFFFF96BD9F04952740B95794DAA34DC5
        6910BD3F1FD25927D86330DB6B33DC6E1DC7506BD68896E1AA96E0A996DEA793
        DBA33FBC59008E1C237225D2DAD250AB6700AA2D03A82721AD3B31BD525AD67F
        56D97E20D15827D46055DE8259DE842BC45471D288B0E5BCB0E4BBB0E2BAAFE1
        B750BA6100851179A97977C98612A92F65CB7B6ED08474D68D6BD78928C756BA
        EEC9D8F6E136D16669DD8C74DE943DC15D73CC84C9EBCFCAEACFCAE9CEC9E8CD
        47AD5085C38AFCFEFC6FC87E58C26D8DD89D7DD6922FC054CAF0D4FFFFFFFFFF
        FFE4F8E940CD6778DB948DDFA353C26A70C57CE3F3E5E3F3E58CCA9116851BDD
        E3DDFFFFFFFEFEFE7FCD8D4EBD6333B851D8F2DEFFFFFFFFFFFFFFFFFFFFFFFF
        ECF9EF4BC96B86DA9BA7E3B56EC57C6ABD7285C689169723007D0F619761FFFF
        FFFFFFFFFFFFFFACDFB4E4F4E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5
        FBF657C57090D89FC1E8C88DCC936DBB73BAE2C040AD4D52A359FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFD
        FA67C57793D59EDAF0DDDAEFDDCCE8CF41A84AB9DDBBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFD
        77C58193D09ADBEEDC42A748C6E3C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89
        C88E36A03CD5EAD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      
    end
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 512
      Height = 68
      Align = alClient
      Picture.Data = {
        0A544A504547496D616765C31A0000FFD8FFE1001845786966000049492A0008
        0000000000000000000000FFEC00114475636B7900010004000000500000FFE1
        0329687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
        3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
        656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
        786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
        3D2241646F626520584D5020436F726520352E302D633036302036312E313334
        3737372C20323031302F30322F31322D31373A33323A30302020202020202020
        223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
        772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
        7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
        222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F
        6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D22687474703A2F2F
        6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A
        73745265663D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F31
        2E302F73547970652F5265736F75726365526566232220786D703A4372656174
        6F72546F6F6C3D2241646F62652050686F746F73686F70204353352057696E64
        6F77732220786D704D4D3A496E7374616E636549443D22786D702E6969643A30
        4234444534463143363831313144463942363739423039313935343945373522
        20786D704D4D3A446F63756D656E7449443D22786D702E6469643A3042344445
        344632433638313131444639423637394230393139353439453735223E203C78
        6D704D4D3A4465726976656446726F6D2073745265663A696E7374616E636549
        443D22786D702E6969643A304234444534454643363831313144463942363739
        4230393139353439453735222073745265663A646F63756D656E7449443D2278
        6D702E6469643A30423444453446304336383131314446394236373942303931
        39353439453735222F3E203C2F7264663A4465736372697074696F6E3E203C2F
        7264663A5244463E203C2F783A786D706D6574613E203C3F787061636B657420
        656E643D2272223F3EFFEE000E41646F62650064C000000001FFDB0084000202
        0202020202020202030202020304030202030405040404040405060505050505
        05060607070807070609090A0A09090C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0103
        0303050405090606090D0B090B0D0F0E0E0E0E0F0F0C0C0C0C0C0F0F0C0C0C0C
        0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFF
        C0001108005503B703011100021101031101FFC4007200010101010101000000
        0000000000000000040503060901010100000000000000000000000000000001
        1000010203060700010301090100000000000113516103910204940515D214D4
        5516560711213144B3418112B273A3A4B4062211010100000000000000000000
        000000000011FFDA000C03010002110311003F00FB19A4FF00E3FF00F075B4AD
        32AD7FFC969156BD5C251BF5AADFC2515BD7AFDEA68B7AF2AADDFD5554A8D0F0
        BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE
        9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F9
        3A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F08
        0F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE
        7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA76
        8F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8
        F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C
        2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EF
        A768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E
        4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C2
        03C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF
        9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9D
        A3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A
        3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F
        0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7B
        E9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F
        93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F0
        80F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2F
        E7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA7
        68F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E
        8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203
        C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9E
        FA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3
        E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C
        203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0B
        F9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9
        DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93
        A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080
        F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7
        BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768
        F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F
        080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2
        FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA
        768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4
        E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C20
        3C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F081E774B
        D42A5DD334EBA9F9FC5DC2D144FEEB885176E35660371AB301B8D5980DC6ACC0
        6E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E3566
        0371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB
        301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D
        5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC
        6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06
        E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660
        371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB3
        01B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5
        980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6
        ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E
        35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E356603
        71AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB30
        1B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E3566072AFA8565A379
        6EDEBD7552FD15FCA7E8BF87AE22A7F7A7E841069949174DD3D6386A5FE4428B
        9A400D200690034801A400D200690034801A400D200690034801A400D2006900
        34801A400D200690034801A400D200690034801A400D200690034801A400D200
        690034801A400D200690034801A400D200690034801A400D200690034801A400
        D200690034801A400D200690034801A400D200690034801A400D200690034801
        A400D200690034801A400D200690034801A400D200690034801A400D20069003
        4801A400D200690034801A400D200690034801A400D200690034801A400D2006
        90034801A400D200690034801A400D200690034801A400D200690034801A400D
        200690034801A400D200690034801A400D200690034801A4038E2292250BFF00
        EA504FF7E981569549574BD356385A3FE4420D0694034A01A500D280694034A0
        1A500D280694034A01A500D280694034A01A500D280694034A01A500D2806940
        34A01A500D280694034A01A500D280694034A01A500D280694034A01A500D280
        694034A01A500D280694034A01A500D280694034A01A500D280694034A01A500
        D280694034A01A500D280694034A01A500D280694034A01A500D280694034A01
        A500D280694034A01A500D280694034A01A500D280694034A01A500D28069403
        4A01A500D280694034A01A500D280694034A01A500D280694034A01A500D2806
        94034A01A500D280694034A01A500D280694034A01A500D280694034A01A500D
        280694034A01A500D28069409B174D530EBFEB6193FE45302AD22922E93A5AFE
        3F8943FA7740D1692001A4800692001A4800692001A4800692001A4800692001
        A4800692001A4800692001A4800692001A4800692001A4800692001A48006920
        01A4800692001A4800692001A4800692001A4800692001A4800692001A480069
        2001A4800692001A4800692001A4800692001A4800692001A4800692001A4800
        692001A4800692001A4800692001A4800692001A4800692001A4800692001A48
        00692001A4800692001A4800692001A4800692001A4800692001A4800692001A
        4800692001A4800692001A4800692001A4800692001A4800692001A480069200
        1A4800692001A4800692001A4800692001A4800692001A4800692001A4800692
        001A4800692001A4800692001A4800692001A4800692001A4800692001A48006
        92001A4800692001A4800692001A4800692001A4800692001A4800692001A480
        0692001A480069200478EA68986FDBF9185FFB3480B345A5F9D1F495FC7F0E87
        F4EE81A4D48035200D48035200D48035200D48035200D48035200D48035200D4
        8035200D48035200D48035200D48035200D48035200D48035200D48035200D48
        035200D48035200D48035200D48035200D48035200D48035200D48035200D480
        35200D48035200D48035200D48035200D48035200D48035200D48035200D4803
        5200D48035200D48035200D48035200D48035200D48035200D48035200D48035
        200D48035200D48035200D48035200D48035200D48035200D48035200D480352
        00D48035200D48035200D48035200D48035200D48035200D48035200D4803520
        0D48035200D48035200D48035200D48035200D48035200D48035200D48035200
        D48035200D48035200D4808752A7F8C2DDFD3F95834FF95480B343A7F9D17475
        FC7EF82C3FF4EE81A8D48035200D48035200D48035200D48035200D48035200D
        48035200D48035200D48035200D48035200D48035200D48035200D48035200D4
        8035200D48035200D48035200D48035200D48035200D48035200D48035200D48
        035200D48035200D48035200D48035200D48035200D48035200D48035200D480
        35200D48035200D48035200D48035200D48035200D48035200D48035200D4803
        5200D48035200D48035200D48035200D48035200D48035200D48035200D48035
        200D48035200D48035200D48035200D48035200D48035200D48035200D480352
        00D48035200D48035200D48035200D48035200D48035200D48035200D4803520
        0D48035200D48035200D48035200D480CED569FE30973F4FE5E093FE55202CD0
        6E26C7A37E9FC1C3FF004AE856AB690400DA41003690400DA41003690400DA41
        003690400DA41003690400DA41003690400DA41003690400DA41003690400DA4
        1003690400DA41003690400DA41003690400DA41003690400DA41003690400DA
        41003690400DA41003690400DA41003690400DA41003690400DA41003690400D
        A41003690400DA41003690400DA41003690400DA41003690400DA41003690400
        DA41003690400DA41003690400DA41003690400DA41003690400DA4100369040
        0DA41003690400DA41003690400DA41003690400DA41003690400DA410036904
        00DA41003690400DA41003690400DA41003690400DA41003690400DA41003690
        400DA41003690400DA41003690400DA41003690400DA41003690400DA4100369
        0400DA41003690400DA41003690400DA41003690400DA41003690400DA410036
        90400DA41003690400DA41003690400DA41003690400DA41003690400DA41003
        690400DA41003690400DA41003690400DA41003690400DA41003690400DA4100
        3690400DA410036904033357B88983A7FA7F3703FF006E88199A26352EE8BA42
        7E7F6C161D3FDBBA11A7CF24414E79220A73C910539E48829CF24414E79220A7
        3C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C9105
        39E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539E488
        29CF24414E79220A73C910539E48829CF24414E79220A73C910539E48829CF24
        414E79220A73C910539E48829CF24414E79220A73C910539E48829CF24414E79
        220A73C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73
        C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C91053
        9E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539E4882
        9CF24414E79220A73C910539E48829CF24414E79220A73C910539E48829CF244
        14E79220A73C910539E48829CF24414E79220A73C910539E48829CF24414E792
        20A73C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C
        910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539
        E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539E48829
        CF24414E79220A73C910539E48829CF244159FAA6312F612E27E7F6C5E096CC5
        52503C3E958FBF774CD3AEFE17FF009C2D14FD97FB2E2145FB8DF82D8A0371BF
        05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6F
        C16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371B
        F05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6
        FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371
        BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC
        6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A037
        1BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280D
        C6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A03
        71BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280
        DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0
        371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B628
        0DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A
        0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B62
        80DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8
        A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6
        280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D
        8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B
        6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82
        D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0
        B6280DC6FC16C501B8DF82D8A04F8AC75EBF87BC9F85FD2AE1EF7ECBFD95E9A8
        1A3A5D4A7774CD3929E0B0B569A6168A53A953137EE5FBD77FC09F85BD71285F
        4BAABFDA89797F11520B9E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953
        A600F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A
        600F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A6
        00F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A60
        0F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600
        F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F
        276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F2
        76FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F27
        6FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276
        FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276F
        C1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC
        1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1
        672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC16
        72A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC167
        2A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672
        A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A
        74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A7
        4C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74
        C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C
        01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C0
        1E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01
        E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E
        4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4
        EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4E
        DF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4ED
        F82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF
        82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF8
        2CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF82
        CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF82C
        E54E980971952E5EA0897F0785A775EC3AFF008A9E26FDF5FCA57A6B753F0B42
        E7E9797F08ABF9FD13F2BF8BDF8FC287FFD9}
      Stretch = True
    end
    object JvIAyuda: TJvImage
      Left = 32
      Top = 7
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Center = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002300
        000024080600000003DC83E1000000097048597300000B1300000B1301009A9C
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
        67414D410000B18E7CFB519300000ABD4944415478DACD98797055F515C7CFDD
        DF7D4B92978D2C04B200291A4508608044AA953AB5431DADDA4EA78EB8755C40
        5C709B32565BEDA8B575A9D6AAF40F952AADA33238AD54C5583422CA16C32220
        26083C42B6F7F2B6BBDFDBEFEFBEA40981222E7FF4652E77FF9DCFEF9CEF39E7
        77E13CCFA3FF971F370CC32D6939C1532EFEC1731E47C463B30D22410C936DCD
        22C73A9378BE8E789CBB5E865CAB8B78E16392021B702F496280C8757263706C
        303E37CE989FF778DBD781C16066662A99DA7C0035AB81704341385A292BA1A0
        69EA5A2A9388A5B3C99DE4981B49525B49097500C6F9B6617872B92AB292BF90
        43E1052D35D3ABCEAE9B19995A56A31685F2790190366C26B269774F6FA7B67E
        DF96F4BACFB774EB83FD1B498C3C45A2F009F19EFB0D613C164C893C6F2E47D9
        E50D55754D97375E105E3069368D8F9652500A90C0F198746E1CC77529631914
        4BF6D2470777D0AA6D6BADF57B36EF300C7A98447935715CE69B79869CC6B062
        3DD15C3BA5E9AAA69FD2FCEA991492553260D4746C72D96CF173993670268B02
        36993C80ED4BF6D0EA8EB5F4DC47FFF8E2407FF266E2D5578F3BE5938371C7E7
        29F66FBF575D7CD975F3AEA669558D94B574D2CC2CBC21E08FC872A05BCF2249
        0822980A9910B8E73924F12295E61593244BF4D47BCFD0936D6FAE3B98B06E25
        416AFF1298E6E3E07298A1797153A5F0F23533CFA5E62997220419DF233CC734
        92A2C389CFE9407C3F3C645151A8982A0BAA295F2D877F3C003AD0AE4DB5E3EA
        29ADC7E8BEB79EA697DA772C356CF5F121678E82F960042670CB9C63580C87C6
        95879CE5574D2F5EBCB0E167A428E5649819849D831738FAB4BB8DD6EC6C1B68
        8FC53799367FA8382C4E39AB7AC2CC73EBCF510A2393C803A08BF199858A6819
        BDB973353DF86EEB0B7B7B9CDBE0B62347C36C1C8129BEB369AC6C3173B7B1A1
        947FE6F69629336A4A2FF4C5C9DC2F0B2AC2F4193DBF798DFE627BEF2303F1F0
        EF119F7E92AC19A7569A0F2C9E5DB3604EDD250091997F88D9082B797430FE21
        FD7ADDFA77D6EF1EBC950F88DB8E52E5631F9F40332E4701C568B9E85461E59D
        67CF9AA0C8F32050D3875445950E25DEA6DFBCBDEDDDD64EF366DB96B7B936C7
        EA48B8A2D0BDE18EB39407CE99743E714295AF250614942294CC6EA6E5FFDAD0
        FA46C7E0325115B78C36673D3A1AE6C631300E47F961E3FB57CCF49EBB716E6D
        99E14C765C32D9931440B6F4A4DA85FB5A8FBCD97ED85D96C92A1DF1344FA262
        D6CDA870EFBFE7BCE04FEA4B7E88F914C22B36B1DA1210154A6A1BE9AE37DAFF
        F9FA367399A4F2BB469B331FF96814CC4D63048CCBB2484DE5116F4951C8CBB7
        5D4E1BBEC5CA96EBBA8587335CDBC020BFC231F90370654D4D45FADE65F3E9B2
        F3A6344057B331843DF4864811C5A1DD3DEFD32FD776FDE5BD5DF2ED5C80068E
        0AC4631B4E0C2389249586DC5081EA71B63BD251C55C26F0FBFB856C7A50D489
        D31734D669F72C6EA998DB5C3D0DD91621C72F6CAE1F56810F5181F205BDB875
        2B3DB63E737DAC4F7D8AA4A31BB4F7E4FB5F0A43E3422E458398A39BBBCCAE75
        F6F0A825C8365DE02429BD64E169FC4DD7CE9B5733B56C16F525BB29A5F5F87D
        88830F05D49A7C3945EDDDBBE90FEF27566EEAE497B379D098227CF230A19159
        74F5F194D650FC21582560DCFAE3D3C5DBAE9C7DE6B8F1D153E9C8600F7A538C
        B50F620D42115116B924EDEC8DD1CA2DE9355B0ED1DD96251C53F04E0E06E5B5
        22CFA5BC80475D03BCBF7A486601C25EF1DCF9E7D6BB7FBCBCB1FEB409D13AEA
        4D2521D0C368EA001024927987927A8A36C71299D64E6DC5BE1EEE6987F84F39
        98F4BBC60961AE9CCA9A0B51280FCA55FDE3804414553DD22DA2788ACB2D0178
        5F0A1409590F5DDD987FDDACF1D5E141DDA18CD1072D097E583CA4F3E174D6F9
        F040E683F66EE7B98124FFAA2478710E93B36DDE3773429865AB9FA0881AA2BF
        6F789D767EB615D60A490C06A13397341D14C2E8B427A9AED479E94753A31795
        45025C1A2DD9C5738200104CBB3BAD69EBF79BAFC692EEA3694DD88A1AECC882
        E74FC6760472351D82CBE09CE565CEBEF7FC8E1198E1DF9FDB5EA3757BB750E7
        E14EDABC0775295C948BD95135880ABF53C1AD6A9EA82CC85304B48D5CD68808
        5116CAFEF00B73DBF618FD2012F4BAD316975B9799E9DC8A4F33E91464DC9C7A
        345C43435879DFE12F2CBA7B04C6618B31F49CE1EDF5ED6D74CDCAFBE9483F04
        198CFC7706B9A240D18925DCCAD3CBA4F38312C77A98CB2C4A9055CA708D0FBA
        9C55C9ACB7C87705F3687690664F9E4EC5F0F6A1C400DDD072315DD3BCF09850
        1D03C3F6EC9A2CCBF4F6EE4D74E18A3B299D8EB3352F366958DC91BC207F47A1
        4A730401F5CF23367FBC4F8A6973FA91A4F79A693A2B86C94BF20A69ED758FD0
        8CAAFADC1588C6B22CFF054914479C703C98E1B048924C1BBAB6D3598FDF40C5
        E17CEA1EECCBC519ED098F4C037501F6232F3079736C8DEA1DC01A79B77F055E
        D9F9E05B34B5BC96B25AAE888B82309CB02707C38ED1B51166D6E464EA43CC2B
        965F40966BB3DB350561FED9F2487096C20B9AE3792E5306F34CD6B2CDFDF1EC
        2B56565FE21BC4DAA7E3DED7A8A1721269102E5B507C2D180720966DFB7A5155
        150BA42C4DB8EB3C4AA61293CB2614BDBC70F229D32AD502D21CDB13E131A6C5
        5D03DDFAEA5D9FBE52192CFF395B92B6DDF22C4D2CC2628BC5D2B2BE2D98A09F
        0DDFFDD352F41EB3766FAAF3957925A567D486A3A4E31D06E3A1F26E8FF7E81B
        BB7BFFB6B8E9D2454B5B2EA18AFC2244D657D4B708839A83DAC9ED8B1DF0F626
        8E4CB976CD03AB783B3DBD0A19624390029EB7001BD3D24659FEC497D75EF5F0
        6545C17CD1766C145E0E6D9323D332FDE4F88A30EC5B8DE30023627527E31B2C
        C0128CEDF30221E3DF9F7F72C6157FBDEB89CEC4C11A3E989783C79FEB62E6B6
        63CDA99EF54EEBD58F2ECD5A06624716CF0B163CA7E3E34AE778DEC437165B18
        396C21704218C496735D5B0148D8B4EC085C1BB66D7F1FC4336A088BA44D87F6
        D4FEEA9D6717ED8DC7AA1449B1B9A116ECB80E1A025973AB4EEBF8DD82EB5762
        245CE00DC0E8A22066F095909624B689694110D8968197ECE3C1C0171C07C341
        C330A28669460DC38C9AA6590090FC21A890E7B82ABE1AF33B7ABBC6A7F44C84
        1FCA75C6E38F05879686A2830DC5D5314EE00C18D34449CA88929842A9482AB2
        38A8280ADBE28A2CF7032E092813A6BDD130ACA2F1260C6B9A5682342C665080
        29340DA3D034AD02C3B20B701C756D27846F2211610B02508537A5A1D03A022F
        182EE759A66BDB309492652981023A888DEDE38A220D288A3C1008A803C8D05E
        2510E893E0A5B1304C551CBE9799678AB4AC5EAAE95A89AE1B0CAA845D334CAB
        D0DF6B7AA16D5B511DC70C9279D3678116D84CB1256418546465C8B0D20F4FF4
        E1B88FED0381406F109B1A547BF16C1C9EB1C6C2D0D0310FD1066024DF307418
        338B18906FD830018373438F5A00635ED2E149A625E43D1CC39B22F38624230C
        725C96FD50E480184C20D0AF040023034A068428A60062FBCD72AC80D931EB1B
        EC0613010B1DB6E0B088E1B5083C12314D3BEC387628172257423D1373BD001F
        043C67C380817069106C06C729E62D91ED216091899713B45C66E34564D3FF84
        193E673B76CDB22DFFBF57E05EAC5750308813513A147CE403C293A11711EFF8
        22C678AC9E0088B750770CCC1C69CD5918C7CE66B15C1078FFBB5BE4593AE79A
        D9578661750BAEF65FE241847311F71884884515DB0F0DED273944CC3B80B0A1
        71160238D3F2585FFA3298FF0098AB7E13538855960000000049454E44AE4260
        82}
      OnClick = AAyudaExecute
    end
    object LAyuda: TLabel
      Left = 34
      Top = 45
      Width = 37
      Height = 16
      Cursor = crHandPoint
      Caption = 'Ayuda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = AAyudaExecute
    end
    object BBSiguiente: TBitBtn
      Left = 813
      Top = 8
      Width = 92
      Height = 33
      BiDiMode = bdLeftToRight
      Caption = 'Siguiente'
      ParentBiDiMode = False
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000A30F0000A30F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A2
        4F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22
        A24F22A24F22A24F22A24F22FF00FFFF00FFFF00FFFF00FFC9762BF8F6F4B7A2
        93B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7
        A293B7A293B7A293B7A293B7A293B7A293A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DC
        D6E5D9D2E3D6CEE1D2CADFCFC6DDCCC2DBC9BFDBC9BFB7A293A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4
        EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CEE1D2CADFCFC6DDCCC2DBC9BFB7A2
        93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFDFCFBFAF9F8F8F6F4F6
        F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CEE1D2CA
        DFCFC6DDCCC2B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
        FFFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DD983000E7
        DCD6E5D9D2E3D6CEE1D2CADFCFC6B7A293A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8
        E4EEE5E0983000983000E7DCD6E5D9D2E3D6CEE1D2CAB7A293A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBFAF9F8F8F6F4
        F6F2F0D76733983000983000983000C16E39983000E7DCD6E5D9D2E3D6CEB7A2
        93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFDFCFBFAF9F7F6D76733FBC4A1DF9C60DA904CDA904CC16E39983000
        E8DED8E6DBD4B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAD76733FBC4A1E8A977DF9C60DA
        904CDA904CC16E39983000E8DED8B7A293A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD76733FBC4
        A1FBC4A1FBC4A1FBC4A1C16E39983000EDE4DFEBE1DBB7A293A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD76733D76733D76733D76733E8A977983000F1EAE6EFE7E2EDE4DFB7A2
        93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAD76733983000F5F1EEF3EDEA
        F1EAE6EFE7E2B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFD983000F9
        F7F6F7F4F2F5F1EEF3EDEAF1EAE6B7A293A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEAF1EAE6A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A24F22A24F22A24F22
        A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F
        22A24F22FF00FFFF00FFFF00FFFF00FFC9762BD06F01D06F01D06F01D06F01D0
        6F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01
        D06F01D06F01D06F01A24F22FF00FFFF00FFFF00FFFF00FFCE6300ED9733ED97
        33ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733F6
        CA9AF3AD61F6CA9AF3AD61306DF97F7488DA7B0DFF00FFFF00FFFF00FFFF00FF
        FF00FFDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B
        0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphRight
    end
    object BitBtn1: TBitBtn
      Left = 630
      Top = 8
      Width = 91
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 0
      Visible = False
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000930F0000930F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF000098FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0098FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF1B48FB000098FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0000981B48FBFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A2
        4F22A24F22A24F22A24F22A24F22A24F22A24F221B48FB002EE4A24F22A24F22
        A24F22A24F22A24F220000981B48FB1B48FBFF00FFFF00FFC9762BF8F6F4B7A2
        93B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A2931B
        48FB000098B7A293B7A293B7A2930000981B48FB1B48FBFF00FFFF00FFFF00FF
        C9762BFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DC
        D6E5D9D2E3D6CEE1D2CA1B48FB000098DBC9BF0000981B48FB1B48FBFF00FFFF
        00FFFF00FFFF00FFC9762BFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4
        EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CE3056FC1B48FB1B48FB1B48FB1B48
        FBA24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFDFCFBFAF9F8F8F6F4F6
        F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CE1B48FB
        1B48FB1B48FBB7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
        FFFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7
        DCD60000981B48FB1B48FB1B48FB000098A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8
        E4EEE5E0ECE3DD0000987F97FD1B48FB3056FC7F97FD1B48FB000098FF00FFFF
        00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBFAF9F8F8F6F4
        F6F2F0F4EFECF2ECE8F0E8E40000987F97FD002EE4E7DCD6E5D9D23056FC7F97
        FD1B48FB000098FF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EE0000987F97FD002EE4EDE4DFEBE1DB
        E8DED8E6DBD43056FC7F97FD1B48FB000098FF00FFFF00FFC9762BFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2002EE4002EE4F1
        EAE6EFE7E2EDE4DFEBE1DBE8DED8B7A2933056FC1B48FB1B48FBFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9F7
        F6F7F4F2F5F1EEF3EDEAF1EAE6EFE7E2EDE4DFEBE1DBB7A293A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEAF1EAE6EFE7E2EDE4DFB7A2
        93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEA
        F1EAE6EFE7E2B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9
        F7F6F7F4F2F5F1EEF3EDEAF1EAE6B7A293A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEAF1EAE6A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A24F22A24F22A24F22
        A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F
        22A24F22FF00FFFF00FFFF00FFFF00FFC9762BD06F01D06F01D06F01D06F01D0
        6F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01
        D06F01D06F01D06F01A24F22FF00FFFF00FFFF00FFFF00FFCE6300ED9733ED97
        33ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733F6
        CA9AF3AD61F6CA9AF3AD61306DF97F7488DA7B0DFF00FFFF00FFFF00FFFF00FF
        FF00FFDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B
        0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BitBtn2: TBitBtn
      Tag = 1
      Left = 906
      Top = 8
      Width = 92
      Height = 33
      Caption = 'Terminar'
      TabOrder = 3
      Visible = False
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000930F0000930F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A2
        4F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22
        A24F22A24F22A24F22A24F22FF00FFFF00FFFF00FFFF00FFC9762BF8F6F4B7A2
        93B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7
        A293B7A293B7A293B7A293B7A293B7A293A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DC
        D6E5D9D2E3D6CEE1D2CADFCFC6DDCCC2DBC9BFDBC9BFB7A293A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4
        EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CEE1D2CADFCFC6DDCCC2DBC9BFB7A2
        93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFDFCFBFAF9F8F8F6F4F6
        F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DCD6B7A293694731694731
        694731694731694731694731FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
        FFFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAB7
        A293FFFFFF92A6FF7189FFEAEDFFFFFFFF694731FF00FFFF00FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8
        E4EEE5E0ECE3DDB7A293DBE2FF4A62FF0030F89CA8FFF9FAFF694731FF00FFFF
        00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBFAF9F8F8F6F4
        F6F2F0F4EFECF2ECE8F0E8E4EEE5E0B7A2938A9EFF0030F80030F80030F8E4E6
        FF694731FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEAF1EAE6B7A2930030F80030F8
        D7DFFF0030F87090FF694731FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEAB7
        A293E7EBFF7090FFFFFFFFE4E6FF0030F89CA8FFFF00FFFF00FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9F7
        F6F7F4F2F5F1EEB7A293B7A293B7A293B7A293B7A2939CA8FF0030F8FF00FFFF
        00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEAF1EAE6EFE7E2EDE4DFB7A2
        939CA8FF0030F8FF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9F7F6B7A293694731694731
        6947316947316947316947319CA8FF0030F8FF00FFFF00FFC9762BFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAB7
        A293FFFFFF92A6FF7189FFEAEDFFFFFFFF694731FF00FF9CA8FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFDB7A293DBE2FF4A62FF0030F89CA8FFF9FAFF694731FF00FFFF
        00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A24F22A24F22A24F22
        A24F22A24F22A24F22A24F22A24F22B7A2938A9EFF0030F80030F80030F8E4E6
        FF694731FF00FFFF00FFFF00FFFF00FFC9762BD06F01D06F01D06F01D06F01D0
        6F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01B7A2930030F80030F8
        D7DFFF0030F87090FF694731FF00FFFF00FFFF00FFFF00FFCE6300ED9733ED97
        33ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733B7
        A293E7EBFF7090FFFFFFFFE4E6FF0030F89CA8FFFF00FFFF00FFFF00FFFF00FF
        FF00FFDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B
        0DDA7B0DDA7B0DB7A293B7A293B7A293B7A293B7A2939CA8FF0030F8FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF9CA8FF0030F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF9CA8FF0030F8FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9CA8FF}
      Layout = blGlyphRight
    end
    object BBAnterior: TBitBtn
      Left = 722
      Top = 8
      Width = 92
      Height = 33
      Caption = 'Anterior'
      TabOrder = 1
      Visible = False
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000A30F0000A30F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A2
        4F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22
        A24F22A24F22A24F22A24F22FF00FFFF00FFFF00FFFF00FFC9762BF8F6F4B7A2
        93B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7
        A293B7A293B7A293B7A293B7A293B7A293A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DC
        D6E5D9D2E3D6CEE1D2CADFCFC6DDCCC2DBC9BFDBC9BFB7A293A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BFDFCFBFAF9F8F8F6F4F6F2F0F4EFECF2ECE8F0E8E4
        EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CEE1D2CADFCFC6DDCCC2DBC9BFB7A2
        93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFDFCFBFAF9F8F8F6F4F6
        F2F0F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CEE1D2CA
        DFCFC6DDCCC2B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
        FFFDFCFBFAF9F8F8F6F4983000F4EFECF2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7
        DCD6E5D9D2E3D6CEE1D2CADFCFC6B7A293A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFDFCFB983000983000F6F2F0F4EFECF2ECE8F0E8
        E4EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CEE1D2CAB7A293A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFF983000C16E39983000983000
        983000983000F2ECE8F0E8E4EEE5E0ECE3DDEAE0DAE7DCD6E5D9D2E3D6CEB7A2
        93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFFFF983000DA904CDA
        904CC16E39C16E39C16E39983000F5F1EEF3EDEAF1EAE6EFE7E2EDE4DFEBE1DB
        E8DED8E6DBD4B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFF9830
        00FBC4A1E8A977DF9C60DF9C60DA904CC16E39983000F7F4F2F5F1EEF3EDEAF1
        EAE6EFE7E2EDE4DFEBE1DBE8DED8B7A293A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFD76733FBC4A1E8A977FBC4A1FBC4A1FBC4A1983000F9F7
        F6F7F4F2F5F1EEF3EDEAF1EAE6EFE7E2EDE4DFEBE1DBB7A293A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFD76733FBC4A1D76733D76733
        D76733D76733FCFBFAF9F7F6F7F4F2F5F1EEF3EDEAF1EAE6EFE7E2EDE4DFB7A2
        93A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFFFFFFFFFFFFFFFFD7
        6733D76733FFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEA
        F1EAE6EFE7E2B7A293A24F22FF00FFFF00FFFF00FFFF00FFC9762BFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD76733FFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAF9
        F7F6F7F4F2F5F1EEF3EDEAF1EAE6B7A293A24F22FF00FFFF00FFFF00FFFF00FF
        C9762BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFDFCFBFAF9F7F6F7F4F2F5F1EEF3EDEAF1EAE6A24F22FF00FFFF
        00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A24F22A24F22A24F22
        A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F
        22A24F22FF00FFFF00FFFF00FFFF00FFC9762BD06F01D06F01D06F01D06F01D0
        6F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01
        D06F01D06F01D06F01A24F22FF00FFFF00FFFF00FFFF00FFCE6300ED9733ED97
        33ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733ED9733F6
        CA9AF3AD61F6CA9AF3AD61306DF97F7488DA7B0DFF00FFFF00FFFF00FFFF00FF
        FF00FFDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B
        0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BBAyuda: TBitBtn
      Left = 11
      Top = 80
      Width = 32
      Height = 32
      Action = AAyuda
      TabOrder = 8
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC303030303030303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC30
        303030303000A0AB00A0AB00A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC30303030303000A0AB00A0
        AB00F2FF00F2FF00F2FF00A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9EC30303030303000A0AB00A0AB00F2FF00F2FF633600
        63360000A0AB00F2FF00A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9EC63360000A0AB00A0AB00F2FF00F2FF6336007F5B00D9A77DD9A77D63
        360000A0AB00F2FF00A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        63360000F2FF00F2FF6336007F5B00BC7200BC7200BC7200BC7200D9A77D6336
        0000A0AB00F2FF00A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9EC63360063
        3600633600BC7200BC7200BC720000F2FFBC7200BC7200BC7200D9A77D633600
        00A0AB00F2FF00A0AB303030D8E9ECD8E9ECD8E9ECD8E9EC6336007F5B00A376
        00BC7200BC7200BC720068F5FFBC7200BC7200BC7200BC7200D9A77D63360000
        A0AB303030D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FF9F2AD9A77D
        BC7200BC7200BC7200BC720000F2FF00F2FFBC7200BC7200D9A77D6336003030
        30D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FF9F2AD9A77DBC
        7200BC7200BC7200BC720068F5FF00F2FF00F2FFBC7200D9A77D303030D8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FFFF7FD9A77DBC72
        0068F5FFBC7200BC720000F2FF00F2FFBC7200BC7200D9A77D303030D8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FFFF7FD9A77DBC7200
        68F5FF00F2FF00F2FFBC7200D9A77DFF9F2A7F5B00633600D8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FFFF7FD9A77DBC7200BC
        7200D9A77DFF9F2A7F5B00633600D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600FFFF7FFFFF7FFFFF7F7F5B
        00633600D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC633600633600633600D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9EC}
    end
    object PL: TPanel
      Left = 512
      Top = 0
      Width = 426
      Height = 68
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 5
      object Image6: TImage
        Left = 0
        Top = 0
        Width = 426
        Height = 68
        Align = alClient
        Picture.Data = {
          0A544A504547496D616765C31A0000FFD8FFE1001845786966000049492A0008
          0000000000000000000000FFEC00114475636B7900010004000000500000FFE1
          0329687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D2241646F626520584D5020436F726520352E302D633036302036312E313334
          3737372C20323031302F30322F31322D31373A33323A30302020202020202020
          223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
          772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
          7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
          222220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F
          6D2F7861702F312E302F2220786D6C6E733A786D704D4D3D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A
          73745265663D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F31
          2E302F73547970652F5265736F75726365526566232220786D703A4372656174
          6F72546F6F6C3D2241646F62652050686F746F73686F70204353352057696E64
          6F77732220786D704D4D3A496E7374616E636549443D22786D702E6969643A30
          4234444534463143363831313144463942363739423039313935343945373522
          20786D704D4D3A446F63756D656E7449443D22786D702E6469643A3042344445
          344632433638313131444639423637394230393139353439453735223E203C78
          6D704D4D3A4465726976656446726F6D2073745265663A696E7374616E636549
          443D22786D702E6969643A304234444534454643363831313144463942363739
          4230393139353439453735222073745265663A646F63756D656E7449443D2278
          6D702E6469643A30423444453446304336383131314446394236373942303931
          39353439453735222F3E203C2F7264663A4465736372697074696F6E3E203C2F
          7264663A5244463E203C2F783A786D706D6574613E203C3F787061636B657420
          656E643D2272223F3EFFEE000E41646F62650064C000000001FFDB0084000202
          0202020202020202030202020304030202030405040404040405060505050505
          05060607070807070609090A0A09090C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0103
          0303050405090606090D0B090B0D0F0E0E0E0E0F0F0C0C0C0C0C0F0F0C0C0C0C
          0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFF
          C0001108005503B703011100021101031101FFC4007200010101010101000000
          0000000000000000040503060901010100000000000000000000000000000001
          1000010203060700010301090100000000000113516103910204940515D214D4
          5516560711213144B3418112B273A3A4B4062211010100000000000000000000
          000000000011FFDA000C03010002110311003F00FB19A4FF00E3FF00F075B4AD
          32AD7FFC969156BD5C251BF5AADFC2515BD7AFDEA68B7AF2AADDFD5554A8D0F0
          BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE
          9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F9
          3A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F08
          0F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE
          7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA76
          8F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8
          F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C
          2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EF
          A768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E
          4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C2
          03C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF
          9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9D
          A3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A
          3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F
          0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7B
          E9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F
          93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F0
          80F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2F
          E7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA7
          68F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E
          8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203
          C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9E
          FA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3
          E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C
          203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0B
          F9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9
          DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93
          A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080
          F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7
          BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768
          F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F
          080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2
          FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA
          768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4
          E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C20
          3C2FE7BE9DA3E4E8F080F0BF9EFA768F93A3C203C2FE7BE9DA3E4E8F081E774B
          D42A5DD334EBA9F9FC5DC2D144FEEB885176E35660371AB301B8D5980DC6ACC0
          6E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E3566
          0371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB
          301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D
          5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC
          6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06
          E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660
          371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB3
          01B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5
          980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6
          ACC06E35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E
          35660371AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E356603
          71AB301B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E35660371AB30
          1B8D5980DC6ACC06E35660371AB301B8D5980DC6ACC06E3566072AFA8565A379
          6EDEBD7552FD15FCA7E8BF87AE22A7F7A7E841069949174DD3D6386A5FE4428B
          9A400D200690034801A400D200690034801A400D200690034801A400D2006900
          34801A400D200690034801A400D200690034801A400D200690034801A400D200
          690034801A400D200690034801A400D200690034801A400D200690034801A400
          D200690034801A400D200690034801A400D200690034801A400D200690034801
          A400D200690034801A400D200690034801A400D200690034801A400D20069003
          4801A400D200690034801A400D200690034801A400D200690034801A400D2006
          90034801A400D200690034801A400D200690034801A400D200690034801A400D
          200690034801A400D200690034801A400D200690034801A4038E2292250BFF00
          EA504FF7E981569549574BD356385A3FE4420D0694034A01A500D280694034A0
          1A500D280694034A01A500D280694034A01A500D280694034A01A500D2806940
          34A01A500D280694034A01A500D280694034A01A500D280694034A01A500D280
          694034A01A500D280694034A01A500D280694034A01A500D280694034A01A500
          D280694034A01A500D280694034A01A500D280694034A01A500D280694034A01
          A500D280694034A01A500D280694034A01A500D280694034A01A500D28069403
          4A01A500D280694034A01A500D280694034A01A500D280694034A01A500D2806
          94034A01A500D280694034A01A500D280694034A01A500D280694034A01A500D
          280694034A01A500D28069409B174D530EBFEB6193FE45302AD22922E93A5AFE
          3F8943FA7740D1692001A4800692001A4800692001A4800692001A4800692001
          A4800692001A4800692001A4800692001A4800692001A4800692001A48006920
          01A4800692001A4800692001A4800692001A4800692001A4800692001A480069
          2001A4800692001A4800692001A4800692001A4800692001A4800692001A4800
          692001A4800692001A4800692001A4800692001A4800692001A4800692001A48
          00692001A4800692001A4800692001A4800692001A4800692001A4800692001A
          4800692001A4800692001A4800692001A4800692001A4800692001A480069200
          1A4800692001A4800692001A4800692001A4800692001A4800692001A4800692
          001A4800692001A4800692001A4800692001A4800692001A4800692001A48006
          92001A4800692001A4800692001A4800692001A4800692001A4800692001A480
          0692001A480069200478EA68986FDBF9185FFB3480B345A5F9D1F495FC7F0E87
          F4EE81A4D48035200D48035200D48035200D48035200D48035200D48035200D4
          8035200D48035200D48035200D48035200D48035200D48035200D48035200D48
          035200D48035200D48035200D48035200D48035200D48035200D48035200D480
          35200D48035200D48035200D48035200D48035200D48035200D48035200D4803
          5200D48035200D48035200D48035200D48035200D48035200D48035200D48035
          200D48035200D48035200D48035200D48035200D48035200D48035200D480352
          00D48035200D48035200D48035200D48035200D48035200D48035200D4803520
          0D48035200D48035200D48035200D48035200D48035200D48035200D48035200
          D48035200D48035200D4808752A7F8C2DDFD3F95834FF95480B343A7F9D17475
          FC7EF82C3FF4EE81A8D48035200D48035200D48035200D48035200D48035200D
          48035200D48035200D48035200D48035200D48035200D48035200D48035200D4
          8035200D48035200D48035200D48035200D48035200D48035200D48035200D48
          035200D48035200D48035200D48035200D48035200D48035200D48035200D480
          35200D48035200D48035200D48035200D48035200D48035200D48035200D4803
          5200D48035200D48035200D48035200D48035200D48035200D48035200D48035
          200D48035200D48035200D48035200D48035200D48035200D48035200D480352
          00D48035200D48035200D48035200D48035200D48035200D48035200D4803520
          0D48035200D48035200D48035200D480CED569FE30973F4FE5E093FE55202CD0
          6E26C7A37E9FC1C3FF004AE856AB690400DA41003690400DA41003690400DA41
          003690400DA41003690400DA41003690400DA41003690400DA41003690400DA4
          1003690400DA41003690400DA41003690400DA41003690400DA41003690400DA
          41003690400DA41003690400DA41003690400DA41003690400DA41003690400D
          A41003690400DA41003690400DA41003690400DA41003690400DA41003690400
          DA41003690400DA41003690400DA41003690400DA41003690400DA4100369040
          0DA41003690400DA41003690400DA41003690400DA41003690400DA410036904
          00DA41003690400DA41003690400DA41003690400DA41003690400DA41003690
          400DA41003690400DA41003690400DA41003690400DA41003690400DA4100369
          0400DA41003690400DA41003690400DA41003690400DA41003690400DA410036
          90400DA41003690400DA41003690400DA41003690400DA41003690400DA41003
          690400DA41003690400DA41003690400DA41003690400DA41003690400DA4100
          3690400DA410036904033357B88983A7FA7F3703FF006E88199A26352EE8BA42
          7E7F6C161D3FDBBA11A7CF24414E79220A73C910539E48829CF24414E79220A7
          3C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C9105
          39E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539E488
          29CF24414E79220A73C910539E48829CF24414E79220A73C910539E48829CF24
          414E79220A73C910539E48829CF24414E79220A73C910539E48829CF24414E79
          220A73C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73
          C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C91053
          9E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539E4882
          9CF24414E79220A73C910539E48829CF24414E79220A73C910539E48829CF244
          14E79220A73C910539E48829CF24414E79220A73C910539E48829CF24414E792
          20A73C910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C
          910539E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539
          E48829CF24414E79220A73C910539E48829CF24414E79220A73C910539E48829
          CF24414E79220A73C910539E48829CF244159FAA6312F612E27E7F6C5E096CC5
          52503C3E958FBF774CD3AEFE17FF009C2D14FD97FB2E2145FB8DF82D8A0371BF
          05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6F
          C16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371B
          F05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6
          FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371
          BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC
          6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A037
          1BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280D
          C6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A03
          71BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280
          DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0
          371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B628
          0DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A
          0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B62
          80DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8
          A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6
          280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D
          8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B
          6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82
          D8A0371BF05B1406E37E0B6280DC6FC16C501B8DF82D8A0371BF05B1406E37E0
          B6280DC6FC16C501B8DF82D8A04F8AC75EBF87BC9F85FD2AE1EF7ECBFD95E9A8
          1A3A5D4A7774CD3929E0B0B569A6168A53A953137EE5FBD77FC09F85BD71285F
          4BAABFDA89797F11520B9E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953
          A600F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A
          600F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A6
          00F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A60
          0F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600
          F276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F
          276FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F2
          76FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F27
          6FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276
          FC1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276F
          C1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC
          1672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1
          672A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC16
          72A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC167
          2A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672
          A74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A
          74C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A7
          4C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74
          C01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C
          01E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C0
          1E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01
          E4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E
          4EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4
          EDF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4E
          DF82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4ED
          F82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF
          82CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF8
          2CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF82
          CE54E9803C9DBF059CA9D300793B7E0B3953A600F276FC1672A74C01E4EDF82C
          E54E980971952E5EA0897F0785A775EC3AFF008A9E26FDF5FCA57A6B753F0B42
          E7E9797F08ABF9FD13F2BF8BDF8FC287FFD9}
        Stretch = True
      end
      object LBBCancelar: TLabel
        Left = 59
        Top = 44
        Width = 51
        Height = 16
        Cursor = crHandPoint
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object LBBAnterior: TLabel
        Left = 150
        Top = 44
        Width = 45
        Height = 16
        Cursor = crHandPoint
        Caption = 'Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object LBBSiguiente: TLabel
        Left = 219
        Top = 44
        Width = 54
        Height = 16
        Cursor = crHandPoint
        Caption = 'Siguiente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object LBBTerminar: TLabel
        Left = 315
        Top = 44
        Width = 50
        Height = 16
        Cursor = crHandPoint
        Caption = 'Terminar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object JvTerminar: TJvImage
        Left = 320
        Top = 6
        Width = 41
        Height = 41
        Cursor = crHandPoint
        Center = True
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002900
          0000290806000000A86000F6000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB5193000009EE4944415478DAED98099014D519C7FF3D
          DD3D33BD73ECECC1ECC19EB3C3B5B05872088268216B0966458DA8C14A443C4A
          B1628C4A0C489506AC044C52B104D42488584630218965A951400DA0B282C02A
          BBEC297BB0077BB2B3D7DCDD33F977EF9A1005638CBAA6CA37FBB677BA5FBFF7
          EBEF7DDFFFFB7A85783C8E6F7A13BE85FCB220C534C094008819803C95476DF8
          7BB81948B80CD0EA8081E779DE0698F3782E87E3AC80AD0018AA04922FE07811
          08B602211FC71E05AC1300299BE7AA396E26CF9F62AFE25C2120DA0EC4380FD2
          D95321A8012CC5587CC754832D82807D02AF69FB79AD9CF38EE358DF68432623
          4B15B191C7B968C20E69106BE045E09B0199CF8593302EEAC193F3A65F583CDB
          7D219E38FC542CD010DC26D9F1807600BDA30BD9C68533305D2DC613974F9F3F
          6BF3FCDF22C79E8BE7AA9EC5036FAD82AFA7EF456117EE41155A4DE3470152ED
          637763813A0F9B975C5032F1D1598F11300F21350CABA4E08FB5DBB172EF4AB4
          5775ED135EC70A931535B1C1AF0B92D60B1D83299286ABA56271E38D45D78D5D
          35651D122D49F04787F4F8856892E090ED78A369375695AE464355D3311C89AD
          88D5E1D0570F3983E75B200F0DE216FB65E6F5CB8A9625ADF0ACE43D12022A01
          E30211B9AD86140A4855D270ACE328EE7DEF5E5436D6D699FE80EBCF0919AA27
          D042146A35E818780EBD52D217843C1FCA9086FB5D85B6876E2EBC555E9A7507
          5468188A0E10C94448E387BFE210051976B303E55D1F625DE9CF503B540BED69
          2C3B3BA4045348C55DE699B84FE8C6D1D00EDCA776A3C55A48C8ECCF09C987F1
          1F85D3B2080FBB3D89F7DDE4BD03978F5982403C886034403CD308DCB0152DA2
          055631017F6FDE834DE51BD133D00D5337E77801CB3F052985204533F0D3D4C9
          CA9A39597394AAC031B454F5BC197A013FE2BCD5F6491C67F90F9013792E1963
          A20EAC2FB878CCADDFCBB91DB35C97C2AF0D21A24520EA802316D4F88759301B
          807B9A5FC3D6DA2DF00FD00DE8C783FD1CB3FB4CC84C2E3E0109AA15EBDC97D8
          EE5EEA596A9E9FB608157D47B0B3EB1934D7741E8EEEC3DDDCA0439664427ACE
          02C9E8ED3F48B7C8415E42091EF716652DBE36653926DAA619806A2C4AAC912D
          269C0EAA6FB104197BDBF66067D30E4486828836003ECE156F44190E7C0CA9B0
          BB90245D8DDFA44F70FEE0BAF13788335D730CDF31D3C11BFC3578A5F77934B6
          B6D646DFA5860D62B7A3F0D390410A75D88722FB423C3165B667DEA2C41B9125
          EB29C44F8BA906E0B0058D3D269C05317EF6B7EDC6DECE5DD0FC61F433504FEB
          8075388852FC0401940A622AB7380B39CA55D8E8993976F115198B05AF6D02A2
          F1302155482693A161DDE136BC39F0579C686F680B1FC0FD9644FCC95FF72FC8
          009F5E9570917201364F1D3FF1BC4B6CD7C025A521AC06893152C41816241F01
          658A609889FBAD53BB50317010E680864E6AE969BA8C5681376207B10A615A92
          8617E45CE43B6FC716CB042C98619F89E2AC126A9680082105535C5705F02B41
          AD18A21A1FF0FF0D759D75FDEAC9F8AAFEFD783A652E54160642B81F25B619C2
          E3453945F9B3AD8BE863764462417C5C64C54700490C59B06230DA8FB7DA5F43
          73A81AB600D04225E8ED414C7B1F7F891CC643B44FAD71A30EE99C8D1B331FC4
          F6213AA989345E971733DCB391A2B87935A6BB362FC42108712E6C4534164259
          682F1A22D591533B620F33A3FD9EF27445428EF8D894B15353A7CA1743146506
          48E80C7911863B57D4FDAF37DC8D77BADF445FAC150EC64843057DB01B914829
          9E0DBD8FB51C78EA9F759A0E692BC2CDE357625BDCC581413DDAB8858A151393
          0B99B23CB0CB0E6EB9CCC10416549825FA515C434DF8109AA255E1BE8FB4FD89
          D9D2B449A95353C749D38D49A3B1C8B006F2B7101F3EC6B9C53AF829A69FE303
          47F8207E283E11B5952A7ADBE27E3EF793A10AAC671CF9E291338A491DD23219
          B7A42FC7D60C1A4E643F4D03A8E491C8E5B2389069CB84DB9A4EC173C1424093
          60A2A6996959A031528E4ED3498C3515204F9E8498A04165800C03C2F0459592
          1364E0F8223D680BB4A22BDA858C040572871915D57E9C6E527DFEDDF855B816
          9B78CBD0A72A5EC327D33037650976D8BCC819CB4837532FBB82C3DBA40784EE
          930966E6558B93A00E382487E19F5659312CACD2EF6C9293BB29D0C251235A35
          FA732816A00F0F527AFA995D02188804A0C7B7D79E8678B384B2DA2E9CAE8FB6
          0FBC8CB5E1266CA31F448C016783E44136A7A124F91AFCD23919DE2C823AB24C
          680B72395AD44C8B7282E100223479215396245124AC19094CEA922052A0255A
          57CF22316E77982B0611D2820873EBC3746B511430C1E2C1E009E0687D0BBA8F
          471AFA5EC69AC829EC2448CC30FEB920393FE8629093B130F5BBD8E09A86F372
          DC1292732D680987E8471AADC645A4E11B7450AA1241294DA20285226B653690
          9935F44A46CF261A27343E14EF218AB8264690278D434F5D1887EB3F42D70791
          E3BE97B03AD28D573F06F96C482E1E1FB9C85D9BE3BE0A1B92E708F3B2DD0AB2
          3D4ED4477B11A43514790490DD623233A01269453B6C26DB08A48516950C9F35
          20631AFC7A3168D2E8B379A8A96EC1A19395E879375ADAF312565181DE3913E4
          73431A6F666614665E8D0DA90B84925C77A2E0F1BAD110EB402FAB16C54C4046
          94534C442275C72E3A0D5085A0668AB3A45726FCA884D47D52E6D814351DA5C7
          8FE0606359BC676F6C57270119E4E59F04F9AF20475A7EE6623C925E821B72D2
          52A529DE5CD48B8CCC48279259982631DA9C52221CA20B36D16174BD409005D9
          705E3D5BD9587299432EBC56FE0A0ED61FD67A5EC7CEF697F1503C86136703F9
          22907ACB482FC683994B705B7EB6DB3ACD33051D4A1B7A28C4A9523A922D6E46
          BA0B0E1361E9278AC94E48C99834C59289D000F042C5561CAA3B12EE7A11DBDA
          77E3917F13E92F09526FAE3173707FEE4DB8C75390E6989B7D1142AE103AC2AD
          4891DC48A12C38C5245A35090AA35CA17EA633BF769F1EC4D6EAF5385CF5A1BF
          7D3B3676BE8D5F73AEDE73AEF2BF408E44BE92723EEECCBB0D6B0A26B9532ECD
          BA02B614273AA34D70B2684CA5D51269C924CA439E3C038D3D2DD85CB31A65E5
          55BE96AD78B4B70C9B28A701A34AFB0A21F526B926E166CF1D585B707E72E6A2
          CCEB919556804EAD11090C9A0C4B160A2D97A2A1FB24369DF8318EBC7FA2A375
          0BD6FA2AF10C1789E8F2A54570EEF625411AC31DB9B876DC0AFCBC609E63DCA2
          B4EF634AE65CF8F97EE1B5CCC249026E3DF900CAF6B534343E8535038DF833EF
          D18411D9FABA208DA68C4171E10FB1217F81327DA17B192ECB5E8E2ADF7BD8DE
          BC0E956FF47E50BB09AB035DD8839102685420F5C6143E6BF25D583FFE4A797E
          36CBA8CED047287F65F0ED9A27F1205F210E7C728E518134EE356372D19DF845
          FE95286E7A15FB2A7F87D5D14F8AF468431AF74B189FE4C5457DF5784F8BA2FA
          5C738C2A2486EB23BE6BC20FA384FF8A20FF2FFED3FB2DE4B790DFB0F60FD076
          E5590851D6970000000049454E44AE426082}
        OnClick = JvTerminarClick
      end
      object JvSiguiente: TJvImage
        Left = 224
        Top = 6
        Width = 41
        Height = 41
        Cursor = crHandPoint
        Center = True
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002100
          0000250806000000CC7580790000001974455874536F6674776172650041646F
          626520496D616765526561647971C9653C000005674944415478DACDD65B6C14
          551800E07FE6CC9CD9D92DEDEEF6424B81DE1004893611A322895B234421B11A
          13434C4CA88921EA1331064808CF181E44129E4C0441121E4CE0C54B0C501235
          042FE122C420A1D0EEB2A5976DF7BE3B3367E6F89F69BBB43AB52BBB8293FC39
          336777E7FFF6CCF9CF1909FE078774BF3FACFBF0743B36C1D4FE172F3D4C4404
          9B93183D95422A42D4EB6A7FA260252B855484D8D215EE0FFB5438766D4440FA
          1072EAA1203677D5C3F9781ABEB83A02D390230F14B11911BDAB1AC1620E5C1A
          CBB990A265FF6B48C588AD8F37432ACFDCBE68C680833FC7046407420E3C10C4
          CB9DE1FEF736B4C1CDE15CA93F9A35E0D02F2EE40842FAEE0B8137EF86A9D26B
          5FE8C79B3AC2B0E7A51570E1C6E49CFE58D684C35786219D37CB8278214EBEDD
          DDFA6A47482F7D8112097C94804F954173836048401519562E09C0891F87FF76
          E302CE934F2FC7612C5D5C10E285E8DFB3A133C265B9D447F054458882278A2C
          814E6568AAA52E82391C2EDECE78DEBC603B70F4B7388CA78BE7F0F235C424CB
          467CF04C7BC49985A8E428DA1C4EFC7E1726D305B198F578413C11DBD7B5451C
          521DC40CE487D824DCBA9BF2847822DEEC5E16B109A91A42FC1D0D1FE7E9C109
          888DB890BED9CBBC2762F363AD114BA91E421C1D388770FAC0A93FC6607C3435
          67BFF1443CB9AA25525095AA22C4B165F922203822872E8E40FA4E222971EE42
          3C112D9DCD91EC7F8010C7BE67174316CB77F7B928D8718438BCC71391AB0F46
          9846AB0E5813D6E0DBDE0E78EBBB289CBF91003D997627AA37A2315C75C40A9C
          13C75E68858FAF26E0D4E511D027EF558A376271435511CBFD0AECEDAE876303
          19F8E95A1C682E3FA754BD11CD8D11E6D3AA0268D408BCD3B9088E0F65617470
          1468362F5E7CFA66AF15DE88258BAB82F029126C6CD2E142C2804C0C01999CE7
          3EE28D686D8E30BFAF6204D50938790BB43BA3A014E6DFC8BC11CB5A10A1DFEB
          C48DAA0537AD659A0CEB1B3468C667DC142050AFE306861FBF7E66D41321E106
          1688C68118E60104EC980FEB85386C3484B7CD41CC7370DC5F8E6F6C85ADDF8F
          7B006C080C21A0682CF8BAE7850862731823B88021C8027AF7DEDEB5B0F3726A
          CE07B269813F5A1EC01351CEE1380E84779D8D587E7FFFF3CFAD84AFEF164B9F
          918201818121311265BFF0CE8BB071383188ED388A633BD4766C8AC93138E5DC
          51B67F7973FD37C3EC68CD135D3092B3A70105A81D18CCF6B4D7BCFBD91B2BCF
          CA4436654936896809610A21B83913FE8F08C618FE015B65CCF6339BD5308B05
          2CC602D81FB099AD639F2E2036A23EBF945C7BF03ADB955BDD85620E245F80D0
          CDDB859D4FD7EEEB5D5D771D131731A18189F38AA2E41555C9619BC5C8B94188
          892D2F21C4BF66B64D3169AD699975A629C2AAB32CAB1663910884D45888C2EF
          EA22CE0C9A6D1FDDA0AFE41EED023A3E01A1A1A8B5FB29FAD5BA161A2332292A
          CA74724CACAA4A46555511694A698A526C559AC4FEB480BA084CAA61A250D130
          83A661840C135BD30C996E6B89730112E7B533B05FC778D3FE587895D5500F5D
          C3036C5BA771E791A0342192AB8A9B3083C952D862529A9C0AD56D354A27A9A6
          2535CDED9F94707825BC698D4858348CB0619821C3304462F77C1AE386215AD1
          6799C12B0968FCE45630BC5429C2FBED098E4B079B4988AD4830514A8881D7A2
          9DEAD334BCD62634F71C11958CC4895BEAD29D6B72F180C2B92449CC9D03F733
          12E5CE099C0F35EE04B56D3F866F3C6F071CCED520E56E6920C2911122CBA21A
          C49C50E69B136981C339814025559A130B548748EEC77027243E3E4D54872853
          CE39E11C665ECBC568D8B22C59B24CACD9D54110A38A8A985D217FAD8E05D609
          15D70975CE3A817D53005E2A7A697A34C46391E4A91171A38C75E24FD8948EE3
          C5E324A50000000049454E44AE426082}
        OnClick = JvSiguienteClick
      end
      object JvAnteriror: TJvImage
        Left = 152
        Top = 6
        Width = 41
        Height = 41
        Cursor = crHandPoint
        Center = True
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002100
          0000250806000000CC7580790000001974455874536F6674776172650041646F
          626520496D616765526561647971C9653C000005654944415478DACD965D6C14
          5514C7CF7CCF7E7467B6DDB6DB96960A25250A710113E04123C4078104341AC4
          F8919517793268A26F1A78F0017DA80483311AF7C144C283A1240663D0148C12
          210525480D29D96EFAC916D8EEB6BBEDCECCBD339E3BCCF26117BA1B97EA4DFE
          393367EEDEF3DB7BCF39331CFC0F0657AB85B4777FD4D1C4721F3F73EA3F81F0
          00FA50C71162DFA24320400CCDB1069FD47973CEDABFE8101E40DF86D690BEA1
          B50E3EE91F5B5C8812C00B2B1BF5CD1D3A0C66E6106274F12010E03934895756
          45F58DB803AA24C0A5741E0E2E160402C41D06B03A0A1B5B43AEAF5953E0D7E4
          D4E2403000FCD7895DABA2108B046EFBBBDB8270E2D2241C3AFF902118808200
          7BD62D812541F99E67EB5784E1C8D931F8ECC258254B65516F206C6F55100890
          902521BE7B4D1BB405E479CFB7AD6D8474CE048BD86058775474455D6B3BB7E6
          4ECC1870B87FE414426CAA188201888A147F7D750BB4F8E5B273BA9A7DD05027
          81491C984498599302C5A8843A6079BA7B7CF8F3D5CA2118407D9D1A7FE9D116
          50859A7578E839935C18C26BC3C7B43AF5E9EDDDD19A02B0F1C5D9A1074394DE
          03C1903FB66D4513483C0796ED541564A171F47CEAFE1025002D128A6DE98A40
          5816E06ACEA829001B272F0E978740804E34C7FC8D5AECB5352DD0AD2BF0E540
          A6E6006C0CFC59A63A3C80DFED88A6EF5CDB026FAD6E809D3F0C43C1AAED3194
          C6CC95D1B210EE31987E35D68D79F0FD8E4760EFE971383A987B2810DAF8E47D
          8F8381F4987E5F7C39827CBDA90DDE3F3709DF0DE76B0F317A6DC1EA4898017F
          BC6359131C58D7083D9733703A3D575B88E1F18AFA4482A84ABC695914767586
          E0C478012E66CDDA41A4462BEB9808D24365792F6D6F86ADAD41389329C2C41C
          AD0D4472B8AAB61DA78A9C30DBA3100C2990992500F4DF578C3698AAFA05E682
          CC451B81FA1480320C3DEBEB61A526C1D49C0DD76729A4511732060CA14DE2CB
          CC32ED7B7EA75DA9E0DD510EC411F844A1A30DA8AACC7B7EF4A908BCFCD304F0
          2659702DDEB2C03731D98B10CF5705E181C410A4AFD0D9AEFF13E4A3C735F8E0
          641294EB3753789B5A6029F651C3BEC0FEA81AE20E88D05758D6A1BB47E38DDD
          4BFDF0CDB96150D237F64F1DD8BC8FE7F96A96BD3F04A59449A0B62DDAD496A9
          4D65DBB6E5B78F27D71DBF9C39925FD21234EBC3EEDC15610946FE1A83AEE2F4
          A7A7F73C7690E339C273BCC90B28B402B382404441A08220380F842084701858
          2284FA092541629180454800FD014AA80F7D3E06D23B905B79B83FFBE658736B
          9BD98020F8BDA18EA4E1493ED77B684BD3B73C2F5818B888010D0C3C2B8AE2AC
          288905B47954C1952098689DDB10EC5F134A650C1A322D53334D264BB32C2B84
          AAB32C52478815441BC0B93EA6EB05127AEF97E28E5473BB6E46EA411D4FC356
          FE46FF3B4FA8BF09BC5014452F3806962471469224A669599673B28C5692B3E8
          9F66A02E0406553058B86898BA691861C3446B9A61D3B51683D2F139BB0E95C0
          7057FCB9A21D3C70595D3EA445451045D8EE8C8CBFDA65272551CAB3A0182C87
          1683CAD95B925CABC8F294AC28594571FD531C6E2F878B0659A0A261D41B8619
          360C8341B8D71E8C2B8359E6B35C38E6D3B07FC95F8DD47383860F9E8DE4F32F
          2E25D730300B9029055414650A01509E0FEF5119C5BD46880A76825D6BF37682
          E50AA5AAE338225BE3F3ABFE8606D531702786702766AADA89CA72C2CD8BA09B
          A094FA512AC58AB11D5B4408C14D2E8EB353339CDCA5F3593CE7A2970FE57262
          9AC1CDCB89075447D0AB0E3FCA4D483C3E8501381E80E340A929380842799EB3
          BCEA305C18AC0E0161245611A50A11181C56CEDDD5B1409F90B04F48A53E61DB
          8EECA0CF0500874708AEB410DB0D1471FB048FBD81AFAC4FFC0DBC8D8023C093
          8AAB0000000049454E44AE426082}
        OnClick = JvAnterirorClick
      end
      object JvCancelar: TJvImage
        Left = 64
        Top = 6
        Width = 41
        Height = 41
        Cursor = crHandPoint
        Center = True
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002100
          0000250806000000CC7580790000001974455874536F6674776172650041646F
          626520496D616765526561647971C9653C000004B54944415478DAD5D6DF6B1C
          451C00F0F9B5B3975CD25E5AB5ED5969A9565A04B95841A55092871A54C4FA50
          2DA8983CF826B482E083FF80A050FB1724059582858828B40F7ACD835241492A
          FE78508A98625BABF692CBE56E777EF99DD9DD34CDEDEDEDB51175616E76F76E
          E6FBD999EFCC1E46FF8103FFDB80FF0FE2CFEDF755A03A0AE50294A9CD977EAE
          E5E918DA95A03A0665079493D0EEDC2D21A0A371A826D9BE3D08318AE457DFCF
          C1F56837480CA8E252B1E2EDAF20F1F9D7C83483096837D513220178A30F21FF
          F0E3EE9EF8720E05EF9DC98424007A6FB95278F508C23E47FAD7CBA879E25447
          08CE0B488E2C481A2039B220B8174016240BD00D82D7000E4135ED8D0C23FFB9
          B1AC6947E28B5914BC7FD641E25B55BACB029E47B8E0776CB70AF22C403E4A43
          CCB287EFAFF847B201C921CF7F8B82D3331682C8CE2D95BE57E0195246A00D32
          6F21A7E700319C8E786C6F858F3D920BE120DFFC88E4858BC87FF120C2BC3BC0
          1EA6D140CDB73FEC881847044FF2671E4574F7F6DC905E0E9806149E9A41FADA
          C24A5EA4272640BC27F621BA6BEBFA025A00983E8FCC1FF5CE89D90639F82022
          3BEE5A1F412B44E127B069FDD5E8BE44DB20A30F2072CF1DB73702418804AC68
          737D39FF66B516C20EEC41E4EE4DB73C02E2B3EF90A9357BDFB6DB20FB772352
          EE116247A0FA03320BAD8E80BC08BB13CEE28D859D74EF368428CD6DD0177F47
          FAF2E22F703A9CF5D2EB361DD1DB70D0AFE03B8BBD8D427C986B0D64EA41E64B
          2F2B316F1B9017D26989AE1B200F246DB35A774037C8DA6DFB1F036441D62226
          71918FE32D03F97B0D5554F3FCABC65C5D82975868FFAF4EA421AA001801486E
          80FE6DD19D92F286FC9096B4EDCE0162340D711C3A3AE63A245DB69004A0CD44
          A4C093B920DA44ED42F52E205E6B43C49049E8683C13B20A90EC84C9CE9A09B9
          0158998A544457480A6055BBCE900E808E888E900C402624039089883B9C828E
          5E761D5AC0953A42E5F2517AF6E30F8C36C400CF1863FBC0F061E0D3108C957A
          EAD00B68FED271B275D0411C40E8939BE77F1A4F8B7313424A89A5529E92B220
          A42A425D34634F9FC057AE3E693CB61C8E1C986ABCF9465529CD8DD19ED6061E
          D590B82B0312853151949070E0AD77467975E6252C44BF296F3BA33F9D7E9D31
          B6C41885C29A8CB200CE1521244228A5B0B08185D8188661290C5DED0ADCDB20
          84842206E1370352C8A254B21FDAF85A5B8CA1D1D300826049090D28A54D08B0
          EC799E0DB804F5A22D9CBBB2C039B7A5C63D6F81795EDD21206801020E056130
          14045007C190BD76F7028B0A37C5B85210DDB73807B490784415045CB61D7B49
          10EED57CCEAFF3A8D46CEDFBD1B5AD7DDF77C521A0331E21C2920D7A03214A31
          261A1D11D5D1E88841A5641F4C8DEF720272211A01D6E0F6C9ED537B16E3D512
          D0CD10BFE62070BD92131088414E14EDD04330980A17289A062107A51403F67B
          291504560518013B1D1E4C0724A74368980E970F84D280C55312E5810753C2EA
          30257537151172C163AC0EDFB7DA56874D4E0862411C92D406EC5352F5BB5AEB
          02D43CCE0566F3C122E2A6C6413096906C024A082363F3A34529B189D8B0E700
          836B2692A4ECBA44DB705A13001004CB321E01B2FA37B03A8CDD1530210E04A3
          A221B0816026ABEFBF011136542ADC35D5500000000049454E44AE426082}
        OnClick = JvCancelarClick
      end
    end
    object BSacarAnimal: TBitBtn
      Left = 313
      Top = 80
      Width = 114
      Height = 32
      Caption = 'Sacar Animal'
      TabOrder = 4
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFDFDD8D8D9CDCDCFCECED0CECED0CECED0CECED0CECED0CECED0CECED0
        CECED0CECED0CECED0CECED0CECED0CECED0CECED0CDCDCFDADADBFAFAFAE5E5
        E6595A92494A924A4B924A4C954A4D964A4D974A4D984A4E994A4E994A4E994A
        4E994A4E994A4D984A4D974A4C964A4C954849935D5E94D6D6D9BEBEC8000EC6
        0014D10017D2001AD4001DD6001FD80021D90022DA0022DA0022DA0022DA0021
        D9001FD8001DD6001BD50018D20015D1000FC7A2A3B9C1C1CB1837D54165E73E
        65E73E68EA3E6AED3E6DEE3E6EEF3E6FF03E6FF13E6FF03E6FF03E6DEF3E6CED
        3E69EB3E66E93E63E64163E52842D6A5A6BCC1C1CB1539D92454E82256EA225A
        EE225EF12261F42264F52265F72265F72265F72264F52261F4225EF1225AEE22
        56EA2251E6244EE31434D5A5A6BDBEBECA354EDD607DEA5B7CEA5B7EED5B81EF
        5B83F15B84F25B85F25B85F35B85F25B84F15B82F05B80EE5B7EED5B7BEA5B78
        E76078E6344BD9A2A4BCE4E4E74A58CC5569E1536BE2536FE55372E85375EA53
        78EC537AED537BEE537BEF537AEE537AED5378EC5375E95372E7536EE4556CE3
        5666D3D2D3DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
    object BBXlsImport: TBitBtn
      Left = 160
      Top = 81
      Width = 45
      Height = 31
      ParentShowHint = False
      
      TabOrder = 6
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        20000000000000090000000000000000000000000000000000002F7A4E002874
        49002E794D002D774C002C774C002A764B002A764A0029754900297449002773
        4700277346002672470025724700267145002571460024714500247044002571
        45002470440024704500237045002371440023704400247145002D784D002874
        48722C774BB52D774DAD2F794EAF2D784DAF2D774DAF2C764CAF2C764CAF2B75
        4AAF2A7549AF2A7449AF297449AF2A7348AF297449AF287348AF297348AF2672
        48AF247147AF287348AF257146AD237044B52370446A24714500398257002E78
        4DB9388156FF2F7B4EFF257446FF247345FF227244FF207142FF1E6F40FF1D6E
        3FFF1B6D3EFF1A6C3DFF196B3CFF186A3CFF16693AFF13683AFF14693BFF1B6D
        3CFF1E6C3BFF146637FF1C6C3FFF237144FF237044B0237044003E865C00337C
        51AC357F54FB5D9574F790B49DFA8AAE96FB8AAE96FB8AAE96FB89AD95FB88AD
        96FB87AC94FB88AD94FB85AB93FB85AC94FB8DAF95FB95B093FB90AA8FFB6896
        87FB539087FB8AAF97FA4C8864F71C6B3EFB267146A323704400438A60003780
        55AF307D50FF94B6A0FAFFFBFDFEF4EDEBFEF7EFEDFEF7EEEDFEF6EEECFEF6EE
        ECFEF6EDECFEF5EEEBFEFFF3EEFEFFEDE9FEDADCE3FE9BC7E1FE5AB8E6FE25B8
        F7FE26A7E2FEFFF2F8FE85AC92FA136638FF287348A623704400488D63003980
        56AF358154FF8DB29AFBF9F0EEFEF1ECE9FFF6F0EDFFF5EEECFFF4EFEBFFF4EE
        EBFFF2EDEBFFFBF0EBFFA4C7D6FF39ABD9FF12ACE6FF04B3F2FF0DBCF7FF20C7
        FBFF1099CFFFB0BFC0FE77A182FB16693BFF287247A6247044004B9066003B82
        59AF388457FF91B49CFBF9F1F0FEB3C3B5FFA1B5A4FFA4B7A6FFA3B6A5FFA2B6
        A5FFA2B6A4FFA2AF9FFF26ADE0FF0EC1FFFF26C5FAFF2FC7F7FF37CBF7FF36C5
        F0FF14A5DBFF337867FE618D68FB1B6C40FF267145A6247045004F936A003D84
        5AAF3B865AFF9ABAA5FBD6DCD4FE288037FF338D42FF308E48FF2F8F4CFF2E92
        52FF2A8A4BFF1F734BFF2FB8E5FF38CEFAFF3DCCF4FF47D2F8FF55DCFBFF33B6
        E1FF21B9E7FF93C2D3FE88A98AFB14683AFF297348A62471450053976D003F86
        5CAF418B5EFF91B69EFBFCF7FAFE91B797FF399442FF4BA458FF45A35BFF45A7
        64FF42A75FFF44A183FF54D0F9FF4BD4F5FF5ADBF8FF54D3F2FF3FBCE2FF3AB9
        E3FF41D3F7FF8AC9E6FE86A788FB15683BFF297449A624714500589B72004288
        5EAF468F62FF94B8A1FBFCF5F4FEF7F0F2FF84AF8DFF34913FFF479F55FF43A2
        5BFF34934CFF5AB0ADFF7DE6FEFF63DDF5FF44BFE5FF3AB7E1FF48C6EBFF5FDA
        F7FF58DCF7FF73C9E9FE7DA186FB186B3DFF297449A6257146005E9F7600448A
        61AF4A9366FF96B9A2FBFCF5F5FEECEBE7FFF7F0F2FF74A87FFF369541FF3C96
        4BFF60A385FF8EE1FBFF7DDFF8FF44BBE2FF4BC6EBFF63DFF8FF68E1F7FF6CE0
        F6FF6FE3F7FF6FD5F5FE689884FB1E6E3FFF277449A62572460062A47B00478C
        63AF50986BFF98BBA4FBFEF6F7FEECECE8FFEEEDE8FFF8F0F1FF629C6FFF6BAE
        7BFF88CBABFF46ABA1FF379573FF54C4D7FF72EBFFFF74E8FFFF75E6FFFF6DE0
        F4FF7DEBF8FF71E2FFFE4E9185FB24713FFF267349A62672460069A980004A8F
        65AF559C70FF9ABCA6FBFFF7F8FEECECE8FFF7F3F1FFD8DDD6FF92BFA1FF87CD
        9FFF41A45EFF3E9C4FFF41973DFF52B2ADFF71DCF3FF4AADAFFF5D928BFFADD7
        E5FF6ED5E9FF9AD9EEFE739F88FB1F6F40FF29744AA6277348006FAD85004E91
        68AF5BA175FF9CBEA8FBFDF6F7FEF8F4F2FFDAE0DBFF88BB99FF80CA98FF40A3
        60FF3F9E57FF49A155FF3B8F49FF3A965EFF3E9F6EFF369655FF18612AFFA3AC
        9AFFE6E6EAFFF6EAE7FE81A88DFB1F6F41FF2C764BA62874480074B28A005194
        6BAF61A57AFF9BBEA8FBFFFEFFFEDAE1DDFF8BBC9CFF81CA99FF42A462FF419F
        58FF46A051FF2E843DFF3C944DFF45A358FF3FA259FF42A766FF36995EFF1C5E
        31FFCACDC1FFFFFAFAFE7BA58AFB217142FF2D764CA62A7549007BB790005397
        6EAF67AA7FFFA3C4AFFBEAEFEDFE8DBF9FFF84CB9AFF45A764FF43A159FF3E9C
        4AFF388645FF94B19DFF4D9A59FF3B9A49FF46A25CFF42A460FF46A968FF2D8C
        51FF366843FFEBE8E5FE80AA90FB227244FF2C774CA629764A0082BD96005699
        70AF6EB085FFA0C2ADFB93BDA2FE6EBB87FF3A9C5BFF35954EFF3A9549FF4C93
        58FFB2C3B5FFFFFBFDFFC2D1C5FF489556FF38944AFF379751FF359955FF39A0
        60FF116B32FFAAB3A5FE8DB39BFB227243FF2F784DA62C774B008AC39C005B9C
        74AF76B68CFFA1C5AFFBD8E6DDFEBED4C6FFC1D5C8FFC2D5C7FFC3D4C7FFEAEA
        E8FFFCF6F6FFEDEBE8FFF8F2F2FFE3E5E1FFBED0C0FFBECFC0FFBDCFC0FFBBCD
        BEFFC0D1C3FFF5EEECFE82AA90FB287749FF30794EA62E784C0090CAA3005EA0
        77AF7DBC92FFA4C9B2FBFFFFFFFEFEFAFBFFFFFAFCFFFEF9FAFFFCF8F8FFF3F3
        F0FFEEEEEBFFEFEFECFFECECE9FFF1EEECFFF7F2F1FFF6F1F0FFF6F0EEFFF5EF
        EDFFF0ECE9FFF9F1EFFE81AA8FFB2B794BFF317A4FA62E794E0098CFA90063A3
        7AAF84C197FFA9CAB6FAFFFFFFFEFFFAFDFEFFFBFDFEFFFAFCFEFFF9FAFEFFF9
        FBFEFFF9FAFEFFF7F9FEFFF7F8FEFDF6F6FEFBF4F3FEFBF3F3FEFAF3F2FEF9F2
        F1FEF5F0EEFEFFFBFEFE8AAF96FA2D7B4DFF327B51A6307A4F009FD5AF0064A5
        7CAC94CDA5FB8ABC9CF7A3C8B1FAA3C7B0FBA0C5ADFB9EC3ACFB9CC1A9FB9BBF
        A8FB98BEA6FB97BBA4FB95BAA2FB93B8A0FB91B79FFB90B59DFB8FB49CFB8DB3
        9AFB8AB197FB8EB49CFA5B9572F7398357FB307A50A3317C5000A5DBB40066A7
        7DBA9FD6AFFF94CEA6FF86C49AFF81BF95FF7BBA8FFF74B58AFF6EB085FF69AB
        81FF64A77CFF5EA377FF599E73FF549A6FFF4F976BFF4B9367FF479064FF438D
        60FF408A5DFF3B865AFF40885DFF42895FFF2F7A4FB0327C520064A67D00468C
        626D61A37AAC5FA178A45FA078A75C9D75A7599B72A756996FA753966DA75094
        6BA74E9269A74B9066A7498E64A7478C63A7448A60A743895FA740875DA73F86
        5CA73D845AA73B8359A7367F55A4327C51AC2A754A652B764B00A7DDB60066A7
        7E00A0D7B00099D1AB0095CDA7008EC7A10089C29B0083BE96007DB9920077B5
        8E0073B088006EAC830069A8800063A47B005FA177005B9E7400579A71005297
        6E004F946B004D916800488D630042895F00317A4F00327C5100}
    end
    object BAgregarAnimal: TBitBtn
      Left = 435
      Top = 82
      Width = 132
      Height = 32
      Caption = 'Agregar Animales'
      TabOrder = 7
      Visible = False
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8CBCDCBC8CAC8C8CAC8CBCDCBF8F8
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFDADCDA628F675E8D665E8D66628F68DCDEDCFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFA2B6A503C04A03CC5E03CD5F03C34CA4B9A6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA6BAAA61ECA36EF1B66DF1B668EFA7A9BDABFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5
        BCAB03F58205F08704F08704F47FA6BDABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5BBAA00ED
        7500E77800E77800EB72A6BDAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAABEAF00E56900DF6C
        00DF6D00E468ABBFAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
        FCD4D5D4BDC1BDBFC2BFBFC2BFBFC2BFC5C8C57D9E8319E16F21DD7620DD7619
        E06D7E9F83C5C8C5BFC2BFBFC2BFBFC2BFBDC1BDD0D2D0F4F4F4DBDDDB268B3C
        009B30009D3400A23800A43B00A33A00AA3C2AD77035D97832D97726D56D00A7
        3B00A43B00A43B00A239009E35009A31138C2DA2B4A3D5D8D52C9F4B23C36321
        C56620CA6B20CE6F1FCE6F20CD6B3DD5733ED5753BD57439D37120CC6C1CCD6D
        1BCD6B1BC9671AC3611BBE5C14A13796AD98D6D9D64BA6547AD88871D38470D5
        866DD6886DD88B5CD68149D27548D27545D27348D2745FD7835ED47F5CD17A5A
        CE7458CB6E5ACB6B2CA53898AE99D5D8D53D9F4574D5816CD17D6AD37F67D480
        65D68165D98358D17953D07551CF7451CF7359D57956D17554CE7052CB6A4FC6
        6351C66026A02F93AA94F0F0F074AA7865B86D64B56C63B56D63B66E63B86F52
        A86054CB6E60CF795ECE7754CB6D52A95F61B86C60B66B5FB5695FB56860B867
        65A968CED5CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACB8AC54CC
        666DCE7D6ACD7B53CA66ADBAADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5B4A65ECA6878CE81
        75CD7E5EC968A6B6A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5B4A566C86A84CE8681CD8367
        C86AA6B6A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5B3A56ECA6F8ED28E8BD08B6FC970A5B5
        A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA4B3A581D382A5DDA4A2DCA183D384A6B5A8FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE2E4E26FAC7A71AB7B71AB7B70AC7BE5E7E5FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
  end
  inherited PTitulo: TPanel
    Width = 938
    Caption = 'Datos de los Embriones'
    inherited LTitulo: TLabel
      Width = 534
      Caption = 'Datos de los Embriones'
    end
    inherited PILeft: TPanel
      Left = 730
    end
  end
  inherited Psocalo: TPanel
    Top = 642
    Width = 938
    inherited JvSocalo: TJvImage
      Width = 938
    end
  end
  inherited ALUniversal: TActionList
    Left = 115
    Top = 65534
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 28
    Top = 1
  end
  inherited SDXLS: TSaveDialog
    Left = 86
    Top = 65533
  end
  inherited DTXLS: TDataToXLS
    Left = 56
    Top = 1
  end
  inherited WinXP1: TWinXP
    Left = 712
    Top = 0
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 660
    Top = 65535
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 580
    Top = 65535
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 732
    Top = 65535
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 612
    Top = 65535
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 636
    Top = 65535
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 684
    Top = 65535
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 0
    Top = 0
  end
  object IBQDatosServicios: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from sp_obtener_datos_ia(:fecha,:esta,:madre)')
    Left = 16
    Top = 465
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'madre'
        ParamType = ptUnknown
      end>
  end
  object IBQCalidad: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQEstadiosAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_calidad_embrion')
    Left = 840
    Top = 40
    object IBQCalidadID_CALIDAD: TIntegerField
      FieldName = 'ID_CALIDAD'
      Origin = 'COD_CALIDAD_EMBRION.ID_CALIDAD'
      Required = True
    end
    object IBQCalidadNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_CALIDAD_EMBRION.NOMBRE'
      Size = 50
    end
    object IBQCalidadCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_CALIDAD_EMBRION.CODIGO'
      Size = 2
    end
    object IBQCalidadSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_CALIDAD_EMBRION.SINONIMO'
      Size = 50
    end
    object IBQCalidadVALOR: TIntegerField
      FieldName = 'VALOR'
      Origin = 'COD_CALIDAD_EMBRION.VALOR'
    end
  end
  object DSCalidad: TDataSource
    DataSet = IBQCalidad
    Left = 842
    Top = 80
  end
  object IBQEstadios: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQEstadiosAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_estadios_embrion')
    Left = 728
    Top = 40
    object IBQEstadiosID_ESTADIO: TIntegerField
      FieldName = 'ID_ESTADIO'
      Origin = 'COD_ESTADIOS_EMBRION.ID_ESTADIO'
      Required = True
    end
    object IBQEstadiosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COD_ESTADIOS_EMBRION.NOMBRE'
      Size = 50
    end
    object IBQEstadiosCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'COD_ESTADIOS_EMBRION.CODIGO'
      Size = 2
    end
    object IBQEstadiosSINONIMO: TIBStringField
      FieldName = 'SINONIMO'
      Origin = 'COD_ESTADIOS_EMBRION.SINONIMO'
      Size = 50
    end
    object IBQEstadiosVALOR: TIntegerField
      FieldName = 'VALOR'
      Origin = 'COD_ESTADIOS_EMBRION.VALOR'
    end
  end
  object DSEstadios: TDataSource
    DataSet = IBQEstadios
    Left = 760
    Top = 40
  end
  object IBQDestino: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQEstadiosAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_destino_embrion')
    Left = 776
    Top = 80
  end
  object DSDestino: TDataSource
    DataSet = IBQDestino
    Left = 808
    Top = 80
  end
  object IBQDescDestino: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQEstadiosAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_dest_desc_embrion')
    Left = 696
    Top = 80
  end
  object DSDescDestino: TDataSource
    DataSet = IBQDescDestino
    Left = 728
    Top = 80
  end
  object IBQEmbriones: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterInsert = IBQEmbrionesAfterInsert
    BeforePost = IBQEmbrionesBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from aux_embriones where madre = :id and usado = '#39'N'#39' an' +
        'd fecha_coleccion = :fecha order by nro_orden asc')
    UpdateObject = IBUSQLEmbrion
    GeneratorField.Field = 'ID_EMBRION'
    GeneratorField.Generator = 'GEN_ID_EMBRION'
    Left = 666
    Top = 41
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
    object IBQEmbrionesID_EMBRION: TIntegerField
      FieldName = 'ID_EMBRION'
      Origin = 'AUX_EMBRIONES.ID_EMBRION'
    end
    object IBQEmbrionesESTABLECIMIENTO: TIntegerField
      FieldName = 'ESTABLECIMIENTO'
      Origin = 'AUX_EMBRIONES.ESTABLECIMIENTO'
    end
    object IBQEmbrionesFECHA_COLECCION: TDateField
      FieldName = 'FECHA_COLECCION'
      Origin = 'AUX_EMBRIONES.FECHA_COLECCION'
    end
    object IBQEmbrionesID_DESTINO: TIntegerField
      FieldName = 'ID_DESTINO'
      Origin = 'AUX_EMBRIONES.ID_DESTINO'
    end
    object IBQEmbrionesDESTINO: TIBStringField
      FieldName = 'DESTINO'
      Origin = 'AUX_EMBRIONES.DESTINO'
      OnSetText = IBQEmbrionesVALORCALIDADSetText
      Size = 50
    end
    object IBQEmbrionesID_DESCRIPCION: TIntegerField
      FieldName = 'ID_DESCRIPCION'
      Origin = 'AUX_EMBRIONES.ID_DESCRIPCION'
    end
    object IBQEmbrionesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'AUX_EMBRIONES.DESCRIPCION'
      Size = 50
    end
    object IBQEmbrionesSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'AUX_EMBRIONES.SERIE'
    end
    object IBQEmbrionesNRO_ENVASE: TIBStringField
      FieldName = 'NRO_ENVASE'
      Origin = 'AUX_EMBRIONES.NRO_ENVASE'
      Size = 25
    end
    object IBQEmbrionesID_ESTADIO: TIntegerField
      FieldName = 'ID_ESTADIO'
      Origin = 'AUX_EMBRIONES.ID_ESTADIO'
    end
    object IBQEmbrionesESTADIO: TIBStringField
      FieldName = 'ESTADIO'
      Origin = 'AUX_EMBRIONES.ESTADIO'
      OnSetText = IBQEmbrionesVALORCALIDADSetText
      Size = 50
    end
    object IBQEmbrionesID_CALIDAD: TIntegerField
      FieldName = 'ID_CALIDAD'
      Origin = 'AUX_EMBRIONES.ID_CALIDAD'
    end
    object IBQEmbrionesCALIDAD: TIBStringField
      FieldName = 'CALIDAD'
      Origin = 'AUX_EMBRIONES.CALIDAD'
      OnSetText = IBQEmbrionesVALORCALIDADSetText
      Size = 50
    end
    object IBQEmbrionesID_RESP: TIntegerField
      FieldName = 'ID_RESP'
      Origin = 'AUX_EMBRIONES.ID_RESP'
    end
    object IBQEmbrionesRESPONSABLE: TIBStringField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EMBRIONES.RESPONSABLE'
      Size = 50
    end
    object IBQEmbrionesOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'AUX_EMBRIONES.OBSERVACION'
      Size = 255
    end
    object IBQEmbrionesMADRE: TIntegerField
      FieldName = 'MADRE'
      Origin = 'AUX_EMBRIONES.MADRE'
    end
    object IBQEmbrionesPADRE_1: TIntegerField
      FieldName = 'PADRE_1'
      Origin = 'AUX_EMBRIONES.PADRE_1'
    end
    object IBQEmbrionesPADRE_2: TIntegerField
      FieldName = 'PADRE_2'
      Origin = 'AUX_EMBRIONES.PADRE_2'
    end
    object IBQEmbrionesPADRE_EXTERNO_1: TIBStringField
      FieldName = 'PADRE_EXTERNO_1'
      Origin = 'AUX_EMBRIONES.PADRE_EXTERNO_1'
      Size = 1
    end
    object IBQEmbrionesPADRE_EXTERNO_2: TIBStringField
      FieldName = 'PADRE_EXTERNO_2'
      Origin = 'AUX_EMBRIONES.PADRE_EXTERNO_2'
      Size = 1
    end
    object IBQEmbrionesMADRE_INTERNA: TIBStringField
      FieldName = 'MADRE_INTERNA'
      Origin = 'AUX_EMBRIONES.MADRE_INTERNA'
      Size = 1
    end
    object IBQEmbrionesUSADO: TIBStringField
      FieldName = 'USADO'
      Origin = 'AUX_EMBRIONES.USADO'
      Size = 1
    end
    object IBQEmbrionesCANT_LAVAJES: TIntegerField
      FieldName = 'CANT_LAVAJES'
      Origin = 'AUX_EMBRIONES.CANT_LAVAJES'
    end
    object IBQEmbrionesPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'AUX_EMBRIONES.PRECIO'
      Precision = 5
    end
    object IBQEmbrionesCENTRO_TRANSPLANTE: TIntegerField
      FieldName = 'CENTRO_TRANSPLANTE'
      Origin = 'AUX_EMBRIONES.CENTRO_TRANSPLANTE'
    end
    object IBQEmbrionesDIAS_GESTACION: TIntegerField
      FieldName = 'DIAS_GESTACION'
      Origin = 'AUX_EMBRIONES.DIAS_GESTACION'
    end
    object IBQEmbrionesNRO_ORDEN: TIBStringField
      FieldName = 'NRO_ORDEN'
      Origin = 'AUX_EMBRIONES.NRO_ORDEN'
      Size = 12
    end
  end
  object IBUSQLEmbrion: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from aux_embriones '
      'where'
      '  ID_EMBRION = :ID_EMBRION')
    ModifySQL.Strings = (
      'update aux_embriones'
      'set'
      '  ID_EMBRION = :ID_EMBRION,'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO,'
      '  FECHA_COLECCION = :FECHA_COLECCION,'
      '  NRO_ORDEN = :NRO_ORDEN,'
      '  ID_DESTINO = :ID_DESTINO,'
      '  DESTINO = :DESTINO,'
      '  ID_DESCRIPCION = :ID_DESCRIPCION,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  SERIE = :SERIE,'
      '  NRO_ENVASE = :NRO_ENVASE,'
      '  ID_ESTADIO = :ID_ESTADIO,'
      '  ESTADIO = :ESTADIO,'
      '  ID_CALIDAD = :ID_CALIDAD,'
      '  CALIDAD = :CALIDAD,'
      '  ID_RESP = :ID_RESP,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  OBSERVACION = :OBSERVACION,'
      '  MADRE = :MADRE,'
      '  PADRE_1 = :PADRE_1,'
      '  PADRE_2 = :PADRE_2,'
      '  PADRE_EXTERNO_1 = :PADRE_EXTERNO_1,'
      '  PADRE_EXTERNO_2 = :PADRE_EXTERNO_2,'
      '  MADRE_INTERNA = :MADRE_INTERNA,'
      '  USADO = :USADO,'
      '  CANT_LAVAJES = :CANT_LAVAJES,'
      '  PRECIO = :PRECIO,'
      '  CENTRO_TRANSPLANTE = :CENTRO_TRANSPLANTE,'
      '  DIAS_GESTACION = :DIAS_GESTACION'
      'where'
      '  ID_EMBRION = :OLD_ID_EMBRION')
    InsertSQL.Strings = (
      'insert into aux_embriones'
      '  (ID_EMBRION, ESTABLECIMIENTO, FECHA_COLECCION, NRO_ORDEN, '
      'ID_DESTINO, '
      '   DESTINO, ID_DESCRIPCION, DESCRIPCION, SERIE, NRO_ENVASE, '
      'ID_ESTADIO, '
      
        '   ESTADIO, ID_CALIDAD, CALIDAD, ID_RESP, RESPONSABLE, OBSERVACI' +
        'ON, '
      'MADRE, '
      '   PADRE_1, PADRE_2, PADRE_EXTERNO_1, PADRE_EXTERNO_2, '
      'MADRE_INTERNA, USADO, '
      '   CANT_LAVAJES, PRECIO, CENTRO_TRANSPLANTE, DIAS_GESTACION)'
      'values'
      '  (:ID_EMBRION, :ESTABLECIMIENTO, :FECHA_COLECCION, :NRO_ORDEN, '
      ':ID_DESTINO, '
      
        '   :DESTINO, :ID_DESCRIPCION, :DESCRIPCION, :SERIE, :NRO_ENVASE,' +
        ' '
      ':ID_ESTADIO, '
      '   :ESTADIO, :ID_CALIDAD, :CALIDAD, :ID_RESP, :RESPONSABLE, '
      ':OBSERVACION, '
      
        '   :MADRE, :PADRE_1, :PADRE_2, :PADRE_EXTERNO_1, :PADRE_EXTERNO_' +
        '2, '
      ':MADRE_INTERNA, '
      '   :USADO, :CANT_LAVAJES, :PRECIO, :CENTRO_TRANSPLANTE, '
      ':DIAS_GESTACION)')
    DeleteSQL.Strings = (
      'delete from aux_embriones'
      'where'
      '  ID_EMBRION = :OLD_ID_EMBRION')
    Left = 698
    Top = 41
  end
  object DSEmbrion: TDataSource
    DataSet = IBQEmbriones
    Left = 802
    Top = 39
  end
  object IBQDatosAnimal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 784
  end
  object DSCentrosTransplante: TDataSource
    DataSet = IBQCentrosTransplante
    Left = 616
    Top = 39
  end
  object IBQCentrosTransplante: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    AfterOpen = IBQEstadiosAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from centros_transplante')
    Left = 584
    Top = 39
  end
  object IBQUpdateDel: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'update aux_embriones set usado = '#39'S'#39' where id_embrion = :id')
    Left = 666
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQDelAuxEmbriones: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'update aux_embriones set usado = '#39'S'#39' where id_embrion > :id and ' +
        'madre = :id_madre')
    Left = 554
    Top = 83
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_madre'
        ParamType = ptUnknown
      end>
  end
  object PngImageList1: TPngImageList
    Height = 37
    ImageType = itMask
    Width = 106
    PngImages = <
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445B4DAD4C3E9E563
          C0B6BFE5E040B2A548BCB157BFB475C3B941B9AD41B6A9C0E6E262B7AD8CC8BF
          A0D1CAABD6CF91CAC2A6D4CC86C6BD73BDB36EBBB10094805DB6AA7CC1B89BCF
          C768B9AF82C4BA77BFB696CCC5AFD8D2DBEDEA009A8810A798019E8D029F8F00
          9886019D8B1AA89A03A39425A99B00978406A59502A191009582009683019B8A
          02A292009987FFFFFF37ADA02EAB9E4BB0A452B2A657B4A841AEA1D6ECE9E8F4
          F2B9DCD7F1F8F7FAFDFC30A9998FD1C8D8EFED00937FFFFFFF40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFFBB024A59000000
          4074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00C27BB1440000019B4944415478DAED944D4FC2401086DFB9781062
          14888A123FA2224AAB316D1310227F1E4C13E4243186B367FF826EA7D36EB71F
          448DD91393CCF4997767E74D49284D602BC8A2D5F02BB46234DC2274ECBCD3C7
          8476ED3801F77460CBAA47C7B6AC2EA96ECBCAA3B62DAB2EEDDBB2BAA1862D2B
          979AB6AC1CAAE113C99B693283752951ACFF25922DB96D3EF99861249D263358
          8FCA2CEE475817B225BFAC461E9EF1289D263352BD6AE02751A700538C154D81
          714AF21CC798546EF353884568A962CB363D20C40090CF7B4A5AC220E43E8C21
          AA255319292CDFB2435DBCC255992B2E6292D32248C74A51CAED8BB4369D6285
          2E27D653119258A9CC48155BCEE80A4B389C108AC3D49C32E0589AE3D91B261D
          918B17F89C1092BF81A1F965003E4E463352E16E541B748E77F43891214897D1
          8A503204A331E8842EF0865B9546114D81A61C48274A5E3215BED321070B7850
          8523250655B82EC0C54B46335372CF944AB734E90E7304AA9903414AF24C6A74
          2610681DFA6948155BF6E8FACF5F9A5FC621F56D59B5A865CBAA4F4FB6AC6863
          B5B1DA58FDBFD537D449D641DD403A0E0000000049454E44AE426082}
        Name = 'PngImage0'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445B4DAD4C3E9E563
          C0B6BFE5E040B2A548BCB157BFB475C3B941B9AD41B6A9C0E6E262B7AD8CC8BF
          A0D1CAABD6CF91CAC2A6D4CC86C6BD73BDB36EBBB10094805DB6AA7CC1B89BCF
          C768B9AF82C4BA77BFB696CCC5AFD8D2DBEDEA009A8810A798019E8D029F8F00
          9886019D8B1AA89A03A39425A99B00978406A59502A191009582009683019B8A
          02A292009987FFFFFF37ADA02EAB9E4BB0A452B2A657B4A841AEA1D6ECE9E8F4
          F2B9DCD7F1F8F7FAFDFC30A9998FD1C8D8EFED00937FFFFFFF40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFFBB024A59000000
          4074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00C27BB1440000017F4944415478DAED944B4F02411084AB2F1E8418
          05A2A2C447544458306697441E913F8F86443D498CE1ECD9BFA033D3B33043B6
          0F24A64F54B6BBBF999AA560938526D01229460D7E672A41831D4243E7377D4F
          685F2709B8A723ADA8169D6A455D53592B2AA5BA5654930EB5A2EEA8A215D5A5
          AA56544225C1F9012AEB14D99B3E8E8C32C17936358A60CD1E61339528159C17
          53C308D6EC21365399FA823335350EC1CEE5CE786A70CA233ECA54A05D7A109C
          191ECD154EA79066C1888F14698F9A42D407BAE65A4EC7608A5A8E7CD4B722D5
          E95C885AA069AED5745BE69D07AF1611E56B485FDCE8826E04678E04F304B62C
          9AE6E4576C7BCA1D8789147542C2CFC51B325B7E98C292B295ED8895F15D90DE
          9E0A5D0ACE175AB6FC700591C2DBA265A033BA12A23ED1B6E5872BD31CAD5A1B
          7E333CD32EFEC00649CFF61DA96DDC534B4EBCC9E48EE4EBD02854957A42D42B
          FAB6716744DF91DBB5C42B6FE500E93FE1806EA1A463EA6845D5A8A615D5A127
          AD28DA466DA3B651FF1FF50751B37E415C691D830000000049454E44AE426082}
        Name = 'PngImage1'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445B4DAD4C3E9E563
          C0B6BFE5E040B2A548BCB157BFB475C3B941B9AD41B6A9C0E6E262B7AD8CC8BF
          A0D1CAABD6CF91CAC2A6D4CC86C6BD73BDB36EBBB10094805DB6AA7CC1B89BCF
          C768B9AF82C4BA77BFB696CCC5AFD8D2DBEDEA009A8810A798019E8D029F8F00
          9886019D8B1AA89A03A39425A99B00978406A59502A191009582009683019B8A
          02A292009987FFFFFF37ADA02EAB9E4BB0A452B2A657B4A841AEA1D6ECE9E8F4
          F2B9DCD7F1F8F7FAFDFC30A9998FD1C8D8EFED00937FFFFFFF40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFFBB024A59000000
          4074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00C27BB144000001694944415478DAED944B4FC2501085E76C5C0831
          0A4445898FA815A1604CDB4484C89FAF860459411AE3DAB57F41DBFBA0B77A67
          416266C559CC7C33E736A76DD2624A528260D4E87B261234DA0175649EE9738A
          7D9924A27B1C494575712A15758DBA545484B654548043A9A83B34A4A206684A
          4585A871D697E90DAFB7F9CB881173D68B85B1CF1BD3A6AA21E2AC577AD24D77
          9FB791EA48382BA589D3D302277AA649B14B75538E350C79B58B07CE9AD163D9
          CDDFDFA599D3AA47FCDA43C0594B1AE89677CD4B4595E2D865F1AB8D73CEFAB0
          10947390D740B14B7626F6B60B5DE086B356A687CE10E610AAB1A4F5A9953DEC
          D709D8077EA3D8E1FCBB501BBD75492B36C7D86F871AB8E4AC77EAFEE2A2FAC8
          BDA6325674862BCECAA857E58CF2EA961E99A5E2CC02A30ED8B7BBA0C861AD68
          8D91F5177F0C464D0C396B4E893B10257A3337647D655920F68F4007B825211D
          A32F15D5424B2AAA8F67A9286CA3B651DBA8FF8FFA01187B65415AFA50760000
          000049454E44AE426082}
        Name = 'PngImage2'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445B4DAD4C3E9E563
          C0B6BFE5E040B2A548BCB157BFB475C3B941B9AD41B6A9C0E6E262B7AD8CC8BF
          A0D1CAABD6CF91CAC2A6D4CC86C6BD73BDB36EBBB10094805DB6AA7CC1B89BCF
          C768B9AF82C4BA77BFB696CCC5AFD8D2DBEDEA009A8810A798019E8D029F8F00
          9886019D8B1AA89A03A39425A99B00978406A59502A191009582009683019B8A
          02A292009987FFFFFF37ADA02EAB9E4BB0A452B2A657B4A841AEA1D6ECE9E8F4
          F2B9DCD7F1F8F7FAFDFC30A9998FD1C8D8EFED00937FFFFFFF40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFFBB024A59000000
          4074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00C27BB144000001624944415478DAED944B4BC3501085E76C5CD822
          9A16B55A7CA0C66A534592426A82FDF3550A8D2B8B94AE5DFB1734B9B9B97975
          505066950399FB9D39218764114C494A10AC9A7CCD458A265BA0BECC3B7D4CB1
          2BD344748F03A9AA018EA5AA2ED196AA72D193AAB2B12F5575034BAA6A848E54
          9583169B7D1AB28A4B6BD39DBFF8361E3C367B36141497C1A63B03FA512DB86C
          F6428F7F5956D5C698CD6614164DAC501D616E530A676617B24FA36D3CB0D99C
          FC022BF9C9E9E7B64E3EFBB81DD86CF696C128613D0C64B63E18F570CA56AD33
          B015DB7A69E7A9ADEDBA448CCE70C5562DC9291A5276A9A792636C91181D817D
          618AC82BDBC447E94838D2175588918573B66A45838A8F176A9926ABCC5688D1
          092ED8AA77BA2D73320CC443D9FA60D407FB6DE9D5909BB102E362CA034DFC1F
          A1833B365B181A6B939EDA8D1709A98521E27F08B4876B12D2218652555D74A5
          AA867892AA4253D5543555FF5FF50D0ED966418B9CE4860000000049454E44AE
          426082}
        Name = 'PngImage3'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445B4DAD4C3E9E563
          C0B6BFE5E040B2A548BCB157BFB475C3B941B9AD41B6A9C0E6E262B7AD8CC8BF
          A0D1CAABD6CF91CAC2A6D4CC86C6BD73BDB36EBBB10094805DB6AA7CC1B89BCF
          C768B9AF82C4BA77BFB696CCC5AFD8D2DBEDEA009A8810A798019E8D029F8F00
          9886019D8B1AA89A03A39425A99B00978406A59502A191009582009683019B8A
          02A292009987FFFFFF37ADA02EAB9E4BB0A452B2A657B4A841AEA1D6ECE9E8F4
          F2B9DCD7F1F8F7FAFDFC30A9998FD1C8D8EFED00937FFFFFFF40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFFBB024A59000000
          4074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00C27BB144000001774944415478DAED94CB4EC2601085E76C5C0831
          0A44458997A888D0624C210125F2F26848D015C618D7AE7D052DFD2FF34FDBB0
          22B3E2244CBF3333CC4959802969098A51E3BFB94AD07807D4D279A79F29F675
          9288EE71A415D5C1A956D435AA5A51099A5A516D1C6A45DDA1A61515A3AE1515
          A122FC2FD518BC09A85C6EBE6E6F8081F02FF4C4E04D40E5B2F3B56B1524C2BF
          D22383371B511543E1673461483F33CA1A335B8DCB8069929F9BEFB94B4EBB78
          107E4E2306FB973FB2ED393B49A3F2B93B65B587B6F04B8A1996C445402C17E2
          C2F66AC39FB26AE25CF86F6A3318E3C88FCC98C256719BE47EAA0BDC08FF4111
          83318EFC28A54CD1BAEDE094D509E45BBED180C11847C1888AADFC7670CAAA86
          4BE1BFA8C3608C2331A2622BDFF643AB335C09FF49D4F5CFB008E8526196DF26
          5B592DC81F94DE1D249E33F236F12BA21518E36C65D5D1A79C16AB3234345C18
          5CD84AFC14ADFC9C2BEB00B7A4A463F4B4A21A686845F5F0AC15856DD4366A1B
          B5F9A87FB5529D4108DE60520000000049454E44AE426082}
        Name = 'PngImage4'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445B4DAD4C3E9E563
          C0B6BFE5E040B2A548BCB157BFB475C3B941B9AD41B6A9C0E6E262B7AD8CC8BF
          A0D1CAABD6CF91CAC2A6D4CC86C6BD73BDB36EBBB10094805DB6AA7CC1B89BCF
          C768B9AF82C4BA77BFB696CCC5AFD8D2DBEDEA009A8810A798019E8D029F8F00
          9886019D8B1AA89A03A39425A99B00978406A59502A191009582009683019B8A
          02A292009987FFFFFF37ADA02EAB9E4BB0A452B2A657B4A841AEA1D6ECE9E8F4
          F2B9DCD7F1F8F7FAFDFC30A9998FD1C8D8EFED00937FFFFFFF40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFFBB024A59000000
          4074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00C27BB1440000016F4944415478DAED904F4FC24010C5E75D3C0831
          0A4445897FA256048A312D4951225F1E0C0970D210E3D9335F41B77477BB43D9
          0B9A3931495F7E6F66775EB61892544130AAFF331109EAEF811A326FFA1EE250
          2689E8112752514D9C4B45DDA22C1515A12E1515E0582AEA0115A9A81055A9A8
          0E4ACC2F2D6DFDDAA5E76A8C98F9B1A5972D93C6BE9B2544CCBFD1F39FFF94A7
          CAE8313FA201739479036AECE90D6864AD1EB25544FB78627E42896BD24A0AB0
          A9974CACCDCF25EEEA03042CEADD40B8E2504968C0C8A69E3DAB872191565B75
          5CB2A82F0341CA8169065ABDB4267A137BC615EE58D407758A9C41AA5E2AC8AA
          3AEEEA33B047D28CE2226790AA97B8CCD42866BB545570CDA23EA959E40C52F5
          12977CE8D4056E58D4825A0E2BB3587DB9B4F4A1B51E170DCE2E550DB0FF4973
          4B91311C22D2CA7B5CE6F98EBCAAE8B2A8A9A59E763D7260CAD4E91544CDB263
          B68E704F42758AB654540D35A9A8365EA5A2B08BDA45EDA2FE3FEA174C519041
          603347480000000049454E44AE426082}
        Name = 'PngImage5'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445B4DAD4C3E9E563
          C0B6BFE5E040B2A548BCB157BFB475C3B941B9AD41B6A9C0E6E262B7AD8CC8BF
          A0D1CAABD6CF91CAC2A6D4CC86C6BD73BDB36EBBB10094805DB6AA7CC1B89BCF
          C768B9AF82C4BA77BFB696CCC5AFD8D2DBEDEA009A8810A798019E8D029F8F00
          9886019D8B1AA89A03A39425A99B00978406A59502A191009582009683019B8A
          02A292009987FFFFFF37ADA02EAB9E4BB0A452B2A657B4A841AEA1D6ECE9E8F4
          F2B9DCD7F1F8F7FAFDFC30A9998FD1C8D8EFED00937FFFFFFF40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFFBB024A59000000
          4074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00C27BB144000001AC4944415478DAED54CB4E024110ACBE78106214
          888A121F511165576376370121F2F32B21014E10623C7BF617741E3D33FBBA41
          E6C424F454555777311CA0097C1DF21835FC9B79091A1E103A7EDEF433A1633F
          49C02B9DF98AEAD1A5AFA87BAAFB8A8AA8ED2BAA4BA7BEA29EA8E12B2AA4A6AF
          A8806A1AFCCAD2D068AB879AF1D29A9862797D321D293CDA268AC7CB5B6A1489
          3A05DEED355578F7A74E89A829C68AA95B94145A4865B1680CD334DAB8C292B2
          AFE43FA437608601274BC47FF40394504EAA360FF4B2A25FC223EA022B84AC48
          B4822B614E52CC68DC0851B01457587F9BAE816F74394A22CD34E2465632C84E
          09976D54ACB0FE1B7A00D608384A22CD545D0BA0893E8566603B81DB915F91F1
          5F9078DA0231EF924833D61690F782DBB193E38569C499A9D28ACCB206DD0AF8
          859EB2A95B132709608895C555F05A8B2379842BBA1370033CDB4B552E8A3EDB
          064BD989D2C0C611EB57B543EA275EF2978E1C8ECA4881083C10E5E78C6559E1
          57B5492FDA3C179F845132672C458712DD647FE2C6E6DC52961CB14CD4137A84
          A7734E7D5F512D6AF98AEAD387AF28DA47EDA3F651BB8FFA0726B4B64160F26E
          320000000049454E44AE426082}
        Name = 'PngImage6'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445DAEDEA9FD1CAC6
          E4DFB3DAD5A8D5CFB7DCD7F8FBFB95CCC4D0E8E58BC7BFFFFFFF0B0B0B0C0C0C
          0D0D0D0E0E0E0F0F0F1010101111111212121313131414141515151616161717
          171818181919191A1A1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F20202021212122
          22222323232424242525252626262727272828282929292A2A2A2B2B2B2C2C2C
          2D2D2D2E2E2E2F2F2F3030303131313232323333333434343535353636363737
          373838383939393A3A3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFF995AE9B0000000
          0B74524E53FFFFFFFFFFFFFFFFFFFF004A4F01F2000000E64944415478DAED95
          CB0E02210C454B8293E88AFFFF4AF6C6E8CCF0E803186412D198B2C04B53EEB1
          A546738359CB4C442D4F3B05F4B0C65EE6D4745FCC750E69ED9FA214F5759407
          174FA8F8DAE371DB963BF44C2EC26D101548EFA1A4D900EA2861AC81EB177659
          C54F1764DAF7A3CC0A9566953A5DBA6414B6C6730108A428994542BEEE92501E
          C41692F21395229E52092224FCB618A2F0464395029F1268A8E15243016D4417
          E579FA075158D119141FFD2EAAB8D84515CFD841D15AF83C493F81AA0F7B75B8
          F83063BF9BC32E51F59F701B45B2E4C586CBFFFE89284A518A52D46FA15E9C17
          CE98901E712B0000000049454E44AE426082}
        Name = 'PngImage7'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445DAEDEA9FD1CAC6
          E4DFB3DAD5A8D5CFB7DCD7F8FBFB95CCC4D0E8E58BC7BFFFFFFF0B0B0B0C0C0C
          0D0D0D0E0E0E0F0F0F1010101111111212121313131414141515151616161717
          171818181919191A1A1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F20202021212122
          22222323232424242525252626262727272828282929292A2A2A2B2B2B2C2C2C
          2D2D2D2E2E2E2F2F2F3030303131313232323333333434343535353636363737
          373838383939393A3A3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFF995AE9B0000000
          0B74524E53FFFFFFFFFFFFFFFFFFFF004A4F01F2000000C94944415478DAED93
          DD0AC3200C8523B8C27695F77F4AEF4BD92ACEFC58269B9630B678A1A1D57C9E
          93186E603582216AB94713D01643BCD8685A9770B521EDFE39CA51DF894A00D8
          46EA37C287A3872AD928F849545EE90B66542A8BDEFAFA0A1D54CDC3F94A228A
          9258F49629547A2AC3D2253CD510414C73AAC84A09AD91B8C450ADF6B3194557
          26DB5A94B21607516C1E2BEAA0A02BEC7DD4D13669201F1BAAD501D57404A942
          907B86502A8DAA88A8DA29CD2E51A558AC830D9C7FC2E70F4739CA518EFA6BD4
          03A5D276989ED4FB510000000049454E44AE426082}
        Name = 'PngImage8'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445DAEDEA9FD1CAC6
          E4DFB3DAD5A8D5CFB7DCD7F8FBFB95CCC4D0E8E58BC7BFFFFFFF0B0B0B0C0C0C
          0D0D0D0E0E0E0F0F0F1010101111111212121313131414141515151616161717
          171818181919191A1A1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F20202021212122
          22222323232424242525252626262727272828282929292A2A2A2B2B2B2C2C2C
          2D2D2D2E2E2E2F2F2F3030303131313232323333333434343535353636363737
          373838383939393A3A3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFF995AE9B0000000
          0B74524E53FFFFFFFFFFFFFFFFFFFF004A4F01F2000000C94944415478DAED93
          DD0EC2300885695297E815EFFF94DC2F8B3AED0FD4D9D48E102FE845E946B38F
          7360E106562B18A2967B34016D31C48B8DA67509571BD2D33F4739CA514029E2
          610EE1D735803AFAAA3A0A1311BFE594512952D1B7B3F777F40EAF4C4E40A784
          5114152FCB895890574E199895617ECC1B4BD76D0205A24E82168A006D11B3BD
          6224665B8B12D6766003BD928A3A28E80B1B467DDAC60D64259D188B7A6E26A2
          A842869E1D0B6920EB08EB9AE6B0B366551DD540955F587B39CA518E72D4FFA1
          1E4CB65D985CBDE2630000000049454E44AE426082}
        Name = 'PngImage9'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445DAEDEA9FD1CAC6
          E4DFB3DAD5A8D5CFB7DCD7F8FBFB95CCC4D0E8E58BC7BFFFFFFF0B0B0B0C0C0C
          0D0D0D0E0E0E0F0F0F1010101111111212121313131414141515151616161717
          171818181919191A1A1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F20202021212122
          22222323232424242525252626262727272828282929292A2A2A2B2B2B2C2C2C
          2D2D2D2E2E2E2F2F2F3030303131313232323333333434343535353636363737
          373838383939393A3A3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFF995AE9B0000000
          0B74524E53FFFFFFFFFFFFFFFFFFFF004A4F01F2000000BC4944415478DAED93
          D10AC330084513C80AED93FFFF95BE8FB2954E4D68B32E25560AD387A2A178B8
          5E8D53B08A68881A5EC90434A7981E369A9E431C6D48CBFC1CE5A8DBA2503228
          1FA1F627849F711B546B575D147ED421694411BB6480F276806C45D13081DA71
          B9CFBEB39ABC02C2E22A8B2B2AF79F6E14F510A94803CD500887AE9DF22AF792
          B15D816261C8B6C006A0896237365EA9A32A6B51DB88EEB5A07B0A65472AB597
          5D1A4176AC3CDCFE13560E4739CA518EFA6BD41BE46C5E987795D38A00000000
          49454E44AE426082}
        Name = 'PngImage10'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445DAEDEA9FD1CAC6
          E4DFB3DAD5A8D5CFB7DCD7F8FBFB95CCC4D0E8E58BC7BFFFFFFF0B0B0B0C0C0C
          0D0D0D0E0E0E0F0F0F1010101111111212121313131414141515151616161717
          171818181919191A1A1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F20202021212122
          22222323232424242525252626262727272828282929292A2A2A2B2B2B2C2C2C
          2D2D2D2E2E2E2F2F2F3030303131313232323333333434343535353636363737
          373838383939393A3A3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFF995AE9B0000000
          0B74524E53FFFFFFFFFFFFFFFFFFFF004A4F01F2000000C14944415478DAED93
          C10EC320088631714DB613EFFF94DC97A56DBA15058DDAA5254B86078BF0EB27
          16C203AC4630444D733401BD6288379B9C9E53B8DB90D6F77394A37E0B4580C9
          E04566D5C71E6FE84E46B564A3288B0724D81CF49961BF7D6EA18EBFF7A97BF6
          5000D9519456D2C27A5CB2BA289E84815280853A657AE85F9120B00E7257A93E
          09C50F78392A65648092677E8DE2226E97858E69751FC585AA8B5A54B65294C5
          3E8492FD596FE1ED2B5C450B8FA12E1A8E7294A31CF5D7A80503899598399191
          730000000049454E44AE426082}
        Name = 'PngImage11'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445DAEDEA9FD1CAC6
          E4DFB3DAD5A8D5CFB7DCD7F8FBFB95CCC4D0E8E58BC7BFFFFFFF0B0B0B0C0C0C
          0D0D0D0E0E0E0F0F0F1010101111111212121313131414141515151616161717
          171818181919191A1A1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F20202021212122
          22222323232424242525252626262727272828282929292A2A2A2B2B2B2C2C2C
          2D2D2D2E2E2E2F2F2F3030303131313232323333333434343535353636363737
          373838383939393A3A3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFF995AE9B0000000
          0B74524E53FFFFFFFFFFFFFFFFFFFF004A4F01F2000000CD4944415478DAED93
          DB0EC320088635B14DB62BDEFF29B95F96ADD926523C91CE9A25830B83A87CF2
          8BFEEA66999F885A1F610AE81E7C58E6D4745BFD650E69D3CF5086FA57149207
          475362E5E878548D54401DAEA6676D14C6EAA2B32D5762E090A6511DD0A3302A
          299C520C90A6691FB451BB64F03A992E8D944DC468EF67115CF6186D14F052F7
          398427062EBE46C02F503A0147A0DE1575051C8352BD154715DA2201B2661028
          D47660A99F797D22960BA86F76FA88F2BBB2D17170D616D011F0443394A10C65
          A8DF433D018D358898F56BA0B00000000049454E44AE426082}
        Name = 'PngImage12'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445DAEDEA9FD1CAC6
          E4DFB3DAD5A8D5CFB7DCD7F8FBFB95CCC4D0E8E58BC7BFFFFFFF0B0B0B0C0C0C
          0D0D0D0E0E0E0F0F0F1010101111111212121313131414141515151616161717
          171818181919191A1A1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F20202021212122
          22222323232424242525252626262727272828282929292A2A2A2B2B2B2C2C2C
          2D2D2D2E2E2E2F2F2F3030303131313232323333333434343535353636363737
          373838383939393A3A3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFF995AE9B0000000
          0B74524E53FFFFFFFFFFFFFFFFFFFF004A4F01F2000000F64944415478DAED94
          DD0E83200C85217126DB55DFFF297BBF2C9B283F3D2D413337B264788115CBF9
          E8B1E86FAED7E53BA2E6E7D405F498FC74E953D37DF6D73EA4C5BF811AA8BF43
          7118688BE88C625A6E64228AE3237D0C655536142748B89D44ED1808452F0367
          2F9D8862C9ECA4D32685D3AE75FE8A2A758488B3973A82A97A32890D88FC10D6
          5179209822F098D31CA668899C5F45C1F2F28DF1A5703D6FA42691F39B28E1B8
          93F60814E38BF751C530A5B87E6D92151D44990E8429A96351A8790405E7AADE
          16A0C80E6C6EB48542A9BF45B3D9156AB7D935AA74C0FE118EF9A2FDE0D49A23
          6C50DFBF066AA0066AA07E0FF502748DAE9820C3B2DF0000000049454E44AE42
          6082}
        Name = 'PngImage13'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445B4DAD4C3E9E563
          C0B6BFE5E040B2A548BCB157BFB475C3B941B9AD41B6A9C0E6E262B7AD8CC8BF
          A0D1CAABD6CF91CAC2A6D4CC86C6BD73BDB36EBBB10094805DB6AA7CC1B89BCF
          C768B9AF82C4BA77BFB696CCC5AFD8D2DBEDEA009A8810A798019E8D029F8F00
          9886019D8B1AA89A03A39425A99B00978406A59502A191009582009683019B8A
          02A292009987FFFFFF37ADA02EAB9E4BB0A452B2A657B4A841AEA1D6ECE9E8F4
          F2B9DCD7F1F8F7FAFDFC30A9998FD1C8D8EFED00937FFFFFFF40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFFBB024A59000000
          4074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00C27BB1440000015C4944415478DAED554D4FC240147C83D204689A
          0A4445891F114103680C78E0227FDF1FC1D11F400C2909DAD6B6DBEDD6267DA6
          8979A7CEA133F3E66527ED1E8A3549018255ABF05DA46865818632EFF4B1862B
          D344F48C33A9AA075C4A558D604B552D3090AA1AE354AAEA115DA9AA397A5255
          3374D87C94F2A638DE50552CB164F32F2D9A857193AAA283059B7FD3B122C585
          7125D87865F303592927E2106B2B216D2D3273166DBCB079408D9C08946EC49C
          D9DC9C3DCAC198CD5BB43742994CB52851C6EED9A306B8667397B6BF45FC23D8
          2AA7466E62F51A831BDCF31F98BC9C682BED69E7E503EF8FAA0BCCD9BC61EE41
          5D5B90AA4067E986B9B1327471CBE60E7DA61C09651CAD8CCD36385CE18ECD6D
          DA298AD9568FE89957C6EED8A38698B1F991167ECEF8B1F2B5CF44B2538E1E9E
          D81C2987990B1119A8097402B3538A134C4808E7984A55F5D197AA9AE24DAA0A
          75555D5557FD7FD50FD3805A4167E5ADF50000000049454E44AE426082}
        Name = 'PngImage14'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445B4DAD4C3E9E563
          C0B6BFE5E040B2A548BCB157BFB475C3B941B9AD41B6A9C0E6E262B7AD8CC8BF
          A0D1CAABD6CF91CAC2A6D4CC86C6BD73BDB36EBBB10094805DB6AA7CC1B89BCF
          C768B9AF82C4BA77BFB696CCC5AFD8D2DBEDEA009A8810A798019E8D029F8F00
          9886019D8B1AA89A03A39425A99B00978406A59502A191009582009683019B8A
          02A292009987FFFFFF37ADA02EAB9E4BB0A452B2A657B4A841AEA1D6ECE9E8F4
          F2B9DCD7F1F8F7FAFDFC30A9998FD1C8D8EFED00937FFFFFFF40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFFBB024A59000000
          4074524E53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00C27BB144000001694944415478DAED515D4FC24010DCA942023404
          81A828F1232268008D011F7891BFEF8FE0D11F600C8144A595DE6D7BEDA5FB66
          F68949EE66666793497B589216A058B588DF558A1655505FE79B3E9668E93411
          3DE34CABEA01975A5503845A5533F4B4AA8638D5AA7A445BAB6A8A8E56D5040D
          311B30AFFCF1CAB7037FA70C73CCC5EC2715156F5CF1AD372A47033331FBA563
          4B96BD71DE7AA372847815B36FAA321BB1A784990C5B5FE5CD341150C78B9845
          14E44464646038B3C607C505094D0CC5AC465B276A64AE2DE52E0EB6DE82801E
          AEC5AC459F4E58E39431C4B6B820E006F7F2CFA58D13751E6E785CCFDBE28280
          0B4CC5AAA0F820EEDD22FB2451EEA5F20B02DAB895DF91BE98F722353CB6B6C9
          41B3B020E00A776216D2DA52C2E9BDB6E3309B85D9C9E6E5E86322561DA562E7
          DCCE885D9625CA1EB720A08327310373EC6C6C396687BD4A8F5B1070821129E1
          1C63ADAA2EBA5A5563BC6955E15075A83A54FD7FD51F1F287241DFF51E880000
          000049454E44AE426082}
        Name = 'PngImage15'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445DAEDEA9FD1CAC6
          E4DFB3DAD5A8D5CFB7DCD7F8FBFB95CCC4D0E8E58BC7BFFFFFFF0B0B0B0C0C0C
          0D0D0D0E0E0E0F0F0F1010101111111212121313131414141515151616161717
          171818181919191A1A1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F20202021212122
          22222323232424242525252626262727272828282929292A2A2A2B2B2B2C2C2C
          2D2D2D2E2E2E2F2F2F3030303131313232323333333434343535353636363737
          373838383939393A3A3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFF995AE9B0000000
          0B74524E53FFFFFFFFFFFFFFFFFFFF004A4F01F2000000BA4944415478DAEDD4
          CD0A83300C00E0143AC1BCFFB3E63286134D6AA842ED4CC30EE9C19F1EF2991F
          9B10BC5672A4A625BB409F9CF2CB27A7F794661F69AD5F504105C58BF88EF576
          F781769BAA428FA19045BCD81E4189457B8204C7AB7C0A34F4DBD4FEC0E54426
          484A2BFB7614712A5860940B368BDA9955A9998A4DE235D68F05ACA9A3697605
          14A6A6A09D58DF049E7A85709AD1C7144189ADE7C0782C40FAA34F291A32EC3A
          CAD62C3572A6BFB0DD0A2AA8A082FA3FEA0B3EA252985C21FFD6000000004945
          4E44AE426082}
        Name = 'PngImage16'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D494844520000006A0000002508030000009DF18C
          1C000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB00000300504C5445DAEDEA9FD1CAC6
          E4DFB3DAD5A8D5CFB7DCD7F8FBFB95CCC4D0E8E58BC7BFFFFFFF0B0B0B0C0C0C
          0D0D0D0E0E0E0F0F0F1010101111111212121313131414141515151616161717
          171818181919191A1A1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F20202021212122
          22222323232424242525252626262727272828282929292A2A2A2B2B2B2C2C2C
          2D2D2D2E2E2E2F2F2F3030303131313232323333333434343535353636363737
          373838383939393A3A3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F40404041414142
          42424343434444444545454646464747474848484949494A4A4A4B4B4B4C4C4C
          4D4D4D4E4E4E4F4F4F5050505151515252525353535454545555555656565757
          575858585959595A5A5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162
          62626363636464646565656666666767676868686969696A6A6A6B6B6B6C6C6C
          6D6D6D6E6E6E6F6F6F7070707171717272727373737474747575757676767777
          777878787979797A7A7A7B7B7B7C7C7C7D7D7D7E7E7E7F7F7F80808081818182
          82828383838484848585858686868787878888888989898A8A8A8B8B8B8C8C8C
          8D8D8D8E8E8E8F8F8F9090909191919292929393939494949595959696969797
          979898989999999A9A9A9B9B9B9C9C9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2
          A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACAC
          ADADADAEAEAEAFAFAFB0B0B0B1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7
          B7B8B8B8B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2
          C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCC
          CDCDCDCECECECFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7
          D7D8D8D8D9D9D9DADADADBDBDBDCDCDCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2
          E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECEC
          EDEDEDEEEEEEEFEFEFF0F0F0F1F1F1F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7
          F7F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFEFEFEFFFFFF995AE9B0000000
          0B74524E53FFFFFFFFFFFFFFFFFFFF004A4F01F2000000C34944415478DAED94
          D10AC33008450D6485F9FFDFEACB18DB202655DBB2D0A4D207F3D0345672B857
          6D42F05AC911B57CB20BE89D537EF8687A2DE9E943FAF917A840050A8078471B
          467B24E8F8BDF5A0CC3DD7A09089B813BE02555954F4F15634A344D52F03A8F2
          42ECA520F21975C2308A60BDB23E1A46278CA3104C6148A95A1326A8128EED18
          78301AE3A8ADA229285385C35AFD69F8EEB922DDD9D462AA2DCED74A7AD27A99
          60E3E7846657EE8BD9ADC5B2DD777A8427AF40052A5081BA1FEA0B05306A986A
          2EB0960000000049454E44AE426082}
        Name = 'PngImage17'
        Background = clWindow
      end>
    Left = 620
    Top = 77
    Bitmap = {}
  end
  object IBQExisteMadre: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from aux_embriones where madre = :id_madre')
    Left = 486
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_madre'
        ParamType = ptUnknown
      end>
  end
  object IBQInsAuxEmbriones: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'insert into aux_embriones'
      
        '  (ID_EMBRION, ESTABLECIMIENTO, FECHA_COLECCION, NRO_ORDEN, ID_D' +
        'ESTINO, '
      
        '   DESTINO, ID_DESCRIPCION, DESCRIPCION, SERIE, NRO_ENVASE, ID_E' +
        'STADIO, '
      
        '   ESTADIO, ID_CALIDAD, CALIDAD, ID_RESP, RESPONSABLE, OBSERVACI' +
        'ON, MADRE, '
      
        '   PADRE_1, PADRE_2, PADRE_EXTERNO_1, PADRE_EXTERNO_2, MADRE_INT' +
        'ERNA, USADO, '
      '   CANT_LAVAJES, PRECIO, CENTRO_TRANSPLANTE, DIAS_GESTACION)'
      'values'
      
        '  (:ID_EMBRION, :ESTABLECIMIENTO, :FECHA_COLECCION, :NRO_ORDEN, ' +
        ':ID_DESTINO, '
      
        '   :DESTINO, :ID_DESCRIPCION, :DESCRIPCION, :SERIE, :NRO_ENVASE,' +
        ' :ID_ESTADIO, '
      
        '   :ESTADIO, :ID_CALIDAD, :CALIDAD, :ID_RESP, :RESPONSABLE, :OBS' +
        'ERVACION, '
      
        '   :MADRE, :PADRE_1, :PADRE_2, :PADRE_EXTERNO_1, :PADRE_EXTERNO_' +
        '2, :MADRE_INTERNA, '
      
        '   :USADO, :CANT_LAVAJES, :PRECIO, :CENTRO_TRANSPLANTE, :DIAS_GE' +
        'STACION)')
    Left = 440
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_EMBRION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_COLECCION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NRO_ORDEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_DESCRIPCION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPCION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SERIE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NRO_ENVASE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ESTADIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTADIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_CALIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALIDAD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_RESP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RESPONSABLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PADRE_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PADRE_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PADRE_EXTERNO_1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PADRE_EXTERNO_2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MADRE_INTERNA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'USADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CANT_LAVAJES'
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
        Name = 'DIAS_GESTACION'
        ParamType = ptUnknown
      end>
  end
  object IBQGenIdEmbrion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT GEN_ID(GEN_ID_EMBRION, 1)  AS ID FROM RDB$DATABASE')
    Left = 400
    Top = 80
  end
  object IBQEliminarAux: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from aux_embriones')
    Left = 280
    Top = 88
  end
  object IBSPEliminarEmbrion: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'SP_ELIMINAR_EMBRIONES'
    Left = 780
    Top = 275
  end
end
