inherited FArbolGeneaExterno: TFArbolGeneaExterno
  Left = 257
  Top = -22
  BorderStyle = bsSingle
  Caption = 'FArbolGeneaExterno'
  ClientHeight = 740
  ClientWidth = 1024
  OldCreateOrder = True
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
  object PError: TPageControl [4]
    Left = 0
    Top = 587
    Width = 1024
    Height = 88
    ActivePage = TSHError
    Align = alBottom
    MultiLine = True
    TabOrder = 4
    Visible = False
    OnMouseDown = PErrorMouseDown
    object TSHError: TTabSheet
      Caption = 'Errores'
      object MAErrors: TMemoAuto
        Left = 0
        Top = 0
        Width = 1016
        Height = 59
        Align = alClient
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        EsClave = False
        EsRequerido = False
        ISParam = False
      end
    end
  end
  object PArbol: TPanel [5]
    Left = 0
    Top = 65
    Width = 1024
    Height = 522
    Align = alClient
    TabOrder = 2
    object Shape8: TShape
      Left = 406
      Top = 131
      Width = 13
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape26: TShape
      Left = 112
      Top = 131
      Width = 134
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape1: TShape
      Left = 418
      Top = 67
      Width = 122
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape5: TShape
      Left = 417
      Top = 67
      Width = 5
      Height = 136
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape6: TShape
      Left = 417
      Top = 318
      Width = 5
      Height = 129
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape7: TShape
      Left = 408
      Top = 383
      Width = 11
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape9: TShape
      Left = 727
      Top = 34
      Width = 147
      Height = 5
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape10: TShape
      Left = 724
      Top = 99
      Width = 147
      Height = 5
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape11: TShape
      Left = 727
      Top = 167
      Width = 147
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape12: TShape
      Left = 724
      Top = 232
      Width = 147
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape17: TShape
      Left = 714
      Top = 67
      Width = 13
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape18: TShape
      Left = 714
      Top = 201
      Width = 13
      Height = 5
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape19: TShape
      Left = 714
      Top = 319
      Width = 13
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape20: TShape
      Left = 714
      Top = 442
      Width = 13
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape21: TShape
      Left = 724
      Top = 34
      Width = 4
      Height = 68
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape22: TShape
      Left = 724
      Top = 167
      Width = 4
      Height = 68
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape23: TShape
      Left = 724
      Top = 289
      Width = 4
      Height = 63
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape24: TShape
      Left = 724
      Top = 411
      Width = 4
      Height = 75
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape25: TShape
      Left = 108
      Top = 131
      Width = 5
      Height = 70
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape27: TShape
      Left = 109
      Top = 383
      Width = 131
      Height = 5
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape28: TShape
      Left = 84
      Top = 444
      Width = 44
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
      Visible = False
    end
    object Shape29: TShape
      Left = 417
      Top = 200
      Width = 121
      Height = 5
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape33: TShape
      Left = 724
      Top = 288
      Width = 147
      Height = 5
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape13: TShape
      Left = 727
      Top = 348
      Width = 147
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape14: TShape
      Left = 724
      Top = 410
      Width = 147
      Height = 5
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape15: TShape
      Left = 727
      Top = 481
      Width = 147
      Height = 5
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape16: TShape
      Left = 419
      Top = 318
      Width = 123
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Shape3: TShape
      Left = 419
      Top = 443
      Width = 123
      Height = 4
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object LPP: TLabel
      Tag = 11
      Left = 433
      Top = 37
      Width = 100
      Height = 13
      Cursor = crHandPoint
      Caption = 'Abuelos Paternos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelMachoClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LPM: TLabel
      Tag = 11
      Left = 433
      Top = 170
      Width = 100
      Height = 13
      Cursor = crHandPoint
      Caption = 'Abuelas Paternas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelHembraClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LMP: TLabel
      Tag = 12
      Left = 433
      Top = 287
      Width = 102
      Height = 13
      Cursor = crHandPoint
      Caption = 'Abuelos Maternos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelMachoClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LMM: TLabel
      Tag = 12
      Left = 433
      Top = 411
      Width = 102
      Height = 13
      Cursor = crHandPoint
      Caption = 'Abuelas Maternas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelHembraClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LPPP: TLabel
      Tag = 111
      Left = 737
      Top = 3
      Width = 116
      Height = 13
      Cursor = crHandPoint
      Caption = 'Bisabuelos Paternos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelMachoClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LPPM: TLabel
      Tag = 111
      Left = 737
      Top = 69
      Width = 116
      Height = 13
      Cursor = crHandPoint
      Caption = 'Bisabuelas Paternas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelHembraClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LPMM: TLabel
      Tag = 112
      Left = 737
      Top = 200
      Width = 116
      Height = 13
      Cursor = crHandPoint
      Caption = 'Bisabuelas Paternas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelHembraClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LPMP: TLabel
      Tag = 112
      Left = 737
      Top = 136
      Width = 116
      Height = 13
      Cursor = crHandPoint
      Caption = 'Bisabuelos Paternos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelMachoClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LMPP: TLabel
      Tag = 121
      Left = 737
      Top = 259
      Width = 118
      Height = 13
      Cursor = crHandPoint
      Caption = 'Bisabuelos Maternos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelMachoClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LMPM: TLabel
      Tag = 121
      Left = 737
      Top = 323
      Width = 118
      Height = 13
      Cursor = crHandPoint
      Caption = 'Bisabuelas Maternas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelHembraClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LMMM: TLabel
      Tag = 122
      Left = 737
      Top = 452
      Width = 118
      Height = 13
      Cursor = crHandPoint
      Caption = 'Bisabuelas Maternas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelHembraClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LMMP: TLabel
      Tag = 122
      Left = 737
      Top = 386
      Width = 118
      Height = 13
      Cursor = crHandPoint
      Caption = 'Bisabuelos Maternos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelMachoClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LM: TLabel
      Tag = 1
      Left = 172
      Top = 352
      Width = 42
      Height = 13
      Cursor = crHandPoint
      Caption = 'Madres'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelHembraClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object LRP: TLabel
      Left = 95
      Top = 261
      Width = 25
      Height = 13
      Caption = 'LRP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LNombre: TLabel
      Left = 95
      Top = 281
      Width = 295
      Height = 16
      AutoSize = False
      Caption = 'LNombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label1: TLabel
      Left = 9
      Top = 259
      Width = 85
      Height = 16
      AutoSize = False
      Caption = 'RP Animal : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 279
      Width = 85
      Height = 16
      AutoSize = False
      Caption = 'Nombre: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LP: TLabel
      Tag = 1
      Left = 173
      Top = 101
      Width = 40
      Height = 13
      Cursor = crHandPoint
      Caption = 'Padres'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelMachoClick
      OnMouseEnter = LabelMouseEnter
      OnMouseLeave = LabelMouseLeave
    end
    object Shape2: TShape
      Left = 108
      Top = 329
      Width = 5
      Height = 59
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Image1: TImage
      Left = 73
      Top = 201
      Width = 73
      Height = 57
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
    end
    object Label4: TLabel
      Left = 9
      Top = 298
      Width = 85
      Height = 16
      AutoSize = False
      Caption = 'H.B.A.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LHba: TLabel
      Left = 95
      Top = 301
      Width = 31
      Height = 13
      Caption = 'LHba'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LBP1: TLabel
      Left = 173
      Top = 176
      Width = 67
      Height = 14
      Cursor = crHandPoint
      Caption = 'Eliminar Padre'
      Visible = False
      OnClick = LBP1Click
    end
    object LBM1: TLabel
      Left = 170
      Top = 432
      Width = 69
      Height = 14
      Cursor = crHandPoint
      Caption = 'Eliminar Madre'
      Visible = False
      OnClick = LBP1Click
    end
    object LBPP1: TLabel
      Left = 432
      Top = 96
      Width = 113
      Height = 14
      Caption = 'Eliminar Abuelo Paterno'
      Visible = False
      OnClick = LBP1Click
    end
    object LBPM1: TLabel
      Left = 440
      Top = 224
      Width = 113
      Height = 14
      Caption = 'Eliminar Abuela Paterna'
      Visible = False
      OnClick = LBP1Click
    end
    object LBMP1: TLabel
      Left = 440
      Top = 336
      Width = 115
      Height = 14
      Caption = 'Eliminar Abuelo Materno'
      Visible = False
      OnClick = LBP1Click
    end
    object LBMM1: TLabel
      Left = 440
      Top = 464
      Width = 115
      Height = 14
      Caption = 'Eliminar Abuela Materna'
      Visible = False
      OnClick = LBP1Click
    end
    object LBPPP1: TLabel
      Left = 584
      Top = 112
      Width = 126
      Height = 14
      Caption = 'Eliminar Bisabuelo Paterno'
      Visible = False
      OnClick = LBP1Click
    end
    object LBPPM1: TLabel
      Left = 568
      Top = 130
      Width = 126
      Height = 14
      Caption = 'Eliminar Bisabuela Paterna'
      Visible = False
      OnClick = LBP1Click
    end
    object LBPMP1: TLabel
      Left = 571
      Top = 236
      Width = 126
      Height = 14
      Caption = 'Eliminar Bisabuelo Paterno'
      Visible = False
      OnClick = LBP1Click
    end
    object LBPMM1: TLabel
      Left = 570
      Top = 253
      Width = 126
      Height = 14
      Caption = 'Eliminar Bisabuela Paterna'
      Visible = False
      OnClick = LBP1Click
    end
    object LBMPP1: TLabel
      Left = 560
      Top = 347
      Width = 128
      Height = 14
      Caption = 'Eliminar Bisabuelo Materno'
      Visible = False
      OnClick = LBP1Click
    end
    object LBMPM1: TLabel
      Left = 560
      Top = 369
      Width = 128
      Height = 14
      Caption = 'Eliminar Bisabuela Materna'
      Visible = False
      OnClick = LBP1Click
    end
    object LBMMP1: TLabel
      Left = 578
      Top = 472
      Width = 128
      Height = 14
      Caption = 'Eliminar Bisabuelo Materno'
      Visible = False
      OnClick = LBP1Click
    end
    object LBMMM1: TLabel
      Left = 570
      Top = 490
      Width = 128
      Height = 14
      Caption = 'Eliminar Bisabuela Materna'
      Visible = False
      OnClick = LBP1Click
    end
    object EDBLCBAP1: TEdit
      Left = 1008
      Top = 208
      Width = 220
      Height = 22
      AutoSelect = False
      HideSelection = False
      ReadOnly = True
      TabOrder = 28
      Visible = False
    end
    object MIBQP: TMemo
      Left = 1008
      Top = 84
      Width = 151
      Height = 79
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      Visible = False
      WordWrap = False
    end
    object MIBQM: TMemo
      Left = 1008
      Top = 402
      Width = 151
      Height = 78
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
      Visible = False
      WordWrap = False
    end
    object MIBQPP: TMemo
      Left = 1305
      Top = 15
      Width = 151
      Height = 79
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 2
      Visible = False
      WordWrap = False
    end
    object MIBQPM: TMemo
      Left = 1306
      Top = 161
      Width = 151
      Height = 78
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 3
      Visible = False
      WordWrap = False
    end
    object MIBQMP: TMemo
      Left = 1306
      Top = 298
      Width = 151
      Height = 79
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 4
      Visible = False
      WordWrap = False
    end
    object MIBQMM: TMemo
      Left = 1306
      Top = 433
      Width = 151
      Height = 79
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 5
      Visible = False
      WordWrap = False
    end
    object MIBQPPP: TMemo
      Left = 1641
      Top = -15
      Width = 151
      Height = 71
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 6
      Visible = False
      WordWrap = False
    end
    object MIBQPPM: TMemo
      Left = 1641
      Top = 54
      Width = 151
      Height = 70
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 7
      Visible = False
      WordWrap = False
    end
    object MIBQPMM: TMemo
      Left = 1641
      Top = 192
      Width = 151
      Height = 70
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 8
      Visible = False
      WordWrap = False
    end
    object MIBQPMP: TMemo
      Left = 1641
      Top = 124
      Width = 151
      Height = 71
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 9
      Visible = False
      WordWrap = False
    end
    object MIBQMPM: TMemo
      Left = 1641
      Top = 324
      Width = 151
      Height = 70
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 10
      Visible = False
      WordWrap = False
    end
    object MIBQMPP: TMemo
      Left = 1641
      Top = 255
      Width = 151
      Height = 71
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 11
      Visible = False
      WordWrap = False
    end
    object MIBQMMM: TMemo
      Left = 1641
      Top = 466
      Width = 151
      Height = 70
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 12
      Visible = False
      WordWrap = False
    end
    object MIBQMMP: TMemo
      Left = 1641
      Top = 389
      Width = 151
      Height = 71
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 13
      Visible = False
      WordWrap = False
    end
    object DBLCBAP: TDBLookupComboBoxAuto
      Tag = 1
      Left = 190
      Top = 900
      Width = 216
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListFieldIndex = -1
      ListSource = DSMachosExternos
      TabOrder = 14
      Visible = False
      OnCloseUp = DBLCBACloseUp
      OnKeyPress = DBLCBAKeyPress
      OnKeyUp = DBLCBAPKeyUp
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAM: TDBLookupComboBoxAuto
      Tag = 1
      Left = 184
      Top = 900
      Width = 217
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSHembrasExternas
      TabOrder = 15
      Visible = False
      OnCloseUp = DBLCBACloseUp
      OnKeyPress = DBLCBAKeyPress
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAPP: TDBLookupComboBoxAuto
      Tag = 11
      Left = 465
      Top = 900
      Width = 243
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSMachosExternos
      TabOrder = 16
      Visible = False
      OnCloseUp = DBLCBACloseUp
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAPM: TDBLookupComboBoxAuto
      Tag = 11
      Left = 465
      Top = 900
      Width = 243
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSHembrasExternas
      TabOrder = 17
      Visible = False
      OnCloseUp = DBLCBACloseUp
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAMP: TDBLookupComboBoxAuto
      Tag = 12
      Left = 465
      Top = 900
      Width = 243
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSMachosExternos
      TabOrder = 18
      Visible = False
      OnCloseUp = DBLCBACloseUp
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAMM: TDBLookupComboBoxAuto
      Tag = 12
      Left = 464
      Top = 900
      Width = 242
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSHembrasExternas
      TabOrder = 19
      Visible = False
      OnCloseUp = DBLCBACloseUp
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAPPP: TDBLookupComboBoxAuto
      Tag = 111
      Left = 750
      Top = 900
      Width = 242
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSMachosExternos
      TabOrder = 20
      Visible = False
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAPPM: TDBLookupComboBoxAuto
      Tag = 111
      Left = 751
      Top = 900
      Width = 242
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSHembrasExternas
      TabOrder = 21
      Visible = False
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAPMM: TDBLookupComboBoxAuto
      Tag = 112
      Left = 751
      Top = 900
      Width = 242
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSHembrasExternas
      TabOrder = 22
      Visible = False
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAPMP: TDBLookupComboBoxAuto
      Tag = 112
      Left = 750
      Top = 900
      Width = 242
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSMachosExternos
      TabOrder = 23
      Visible = False
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAMPM: TDBLookupComboBoxAuto
      Tag = 121
      Left = 753
      Top = 900
      Width = 242
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSHembrasExternas
      TabOrder = 24
      Visible = False
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAMPP: TDBLookupComboBoxAuto
      Tag = 121
      Left = 752
      Top = 900
      Width = 242
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSMachosExternos
      TabOrder = 25
      Visible = False
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAMMM: TDBLookupComboBoxAuto
      Tag = 122
      Left = 755
      Top = 900
      Width = 242
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSHembrasExternas
      TabOrder = 26
      Visible = False
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBLCBAMMP: TDBLookupComboBoxAuto
      Tag = 122
      Left = 753
      Top = 900
      Width = 242
      Height = 22
      Cursor = crHandPoint
      Color = clWhite
      KeyField = 'ID_ANIMAL_EXTERNO'
      ListField = 'NOMBRE'
      ListSource = DSMachosExternos
      TabOrder = 27
      Visible = False
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object EDBLCBAM1: TEdit
      Left = 1008
      Top = 616
      Width = 220
      Height = 22
      ReadOnly = True
      TabOrder = 29
      Visible = False
    end
    object EDBLCBAPP1: TEdit
      Left = 1289
      Top = 221
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 30
      Visible = False
    end
    object EDBLCBAPPP1: TEdit
      Left = 1574
      Top = 186
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 31
      Visible = False
    end
    object EDBLCBAPM1: TEdit
      Left = 1289
      Top = 351
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 32
      Visible = False
    end
    object EDBLCBAPPM1: TEdit
      Left = 1574
      Top = 252
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 33
      Visible = False
    end
    object EDBLCBAPMP1: TEdit
      Left = 1574
      Top = 318
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 34
      Visible = False
    end
    object EDBLCBAPMM1: TEdit
      Left = 1574
      Top = 378
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 35
      Visible = False
    end
    object EDBLCBAMP1: TEdit
      Left = 1289
      Top = 477
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 36
      Visible = False
    end
    object EDBLCBAMPP1: TEdit
      Left = 1574
      Top = 441
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 37
      Visible = False
    end
    object EDBLCBAMPM1: TEdit
      Left = 1574
      Top = 509
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 38
      Visible = False
    end
    object EDBLCBAMM1: TEdit
      Left = 1289
      Top = 610
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 39
      Visible = False
    end
    object EDBLCBAMMP1: TEdit
      Left = 1574
      Top = 574
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 40
      Visible = False
    end
    object EDBLCBAMMM1: TEdit
      Left = 1566
      Top = 644
      Width = 242
      Height = 22
      ReadOnly = True
      TabOrder = 41
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 172
      Top = 115
      Width = 238
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 42
      object EDBLCBAP: TLabel
        Tag = 100
        Left = 2
        Top = 8
        Width = 200
        Height = 22
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAPClick
      end
      object LBP: TImage
        Left = 212
        Top = 10
        Width = 24
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 172
      Top = 366
      Width = 238
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 43
      object EDBLCBAM: TLabel
        Tag = 200
        Left = 2
        Top = 7
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAMClick
      end
      object LBM: TImage
        Left = 212
        Top = 10
        Width = 25
        Height = 27
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox3: TGroupBox
      Left = 432
      Top = 51
      Width = 283
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 44
      object EDBLCBAPP: TLabel
        Tag = 100
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAPClick
      end
      object LBPP: TImage
        Left = 256
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox4: TGroupBox
      Left = 738
      Top = 17
      Width = 273
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 45
      object EDBLCBAPPP: TLabel
        Tag = 100
        Left = 2
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAPClick
      end
      object LBPPP: TImage
        Left = 248
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox5: TGroupBox
      Left = 738
      Top = 273
      Width = 273
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 46
      object EDBLCBAMPP: TLabel
        Tag = 100
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAPClick
      end
      object LBMPP: TImage
        Left = 248
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox6: TGroupBox
      Left = 738
      Top = 82
      Width = 273
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 47
      object EDBLCBAPPM: TLabel
        Tag = 200
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAMClick
      end
      object LBPPM: TImage
        Left = 248
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox7: TGroupBox
      Left = 738
      Top = 213
      Width = 273
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 48
      object EDBLCBAPMM: TLabel
        Tag = 200
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAMClick
      end
      object LBPMM: TImage
        Left = 248
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox8: TGroupBox
      Left = 738
      Top = 337
      Width = 273
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 49
      object EDBLCBAMPM: TLabel
        Tag = 200
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAMClick
      end
      object LBMPM: TImage
        Left = 248
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox9: TGroupBox
      Left = 738
      Top = 149
      Width = 273
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 50
      object EDBLCBAPMP: TLabel
        Tag = 100
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAPClick
      end
      object LBPMP: TImage
        Left = 248
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox10: TGroupBox
      Left = 432
      Top = 184
      Width = 283
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 51
      object EDBLCBAPM: TLabel
        Tag = 200
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAMClick
      end
      object LBPM: TImage
        Left = 256
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox11: TGroupBox
      Left = 432
      Top = 301
      Width = 283
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 52
      object EDBLCBAMP: TLabel
        Tag = 100
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAPClick
      end
      object LBMP: TImage
        Left = 256
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox12: TGroupBox
      Left = 432
      Top = 425
      Width = 283
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 53
      object EDBLCBAMM: TLabel
        Tag = 200
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAMClick
      end
      object LBMM: TImage
        Left = 256
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox13: TGroupBox
      Left = 738
      Top = 400
      Width = 273
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 54
      object EDBLCBAMMP: TLabel
        Tag = 100
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAPClick
      end
      object LBMMP: TImage
        Left = 248
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
    object GroupBox14: TGroupBox
      Left = 738
      Top = 464
      Width = 273
      Height = 34
      Color = clWhite
      ParentColor = False
      TabOrder = 55
      object EDBLCBAMMM: TLabel
        Tag = 200
        Left = 1
        Top = 8
        Width = 200
        Height = 24
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        ParentColor = False
        Transparent = False
        Layout = tlCenter
        OnClick = EDBLCBAMClick
      end
      object LBMMM: TImage
        Left = 248
        Top = 9
        Width = 25
        Height = 25
        Cursor = crHandPoint
        ParentShowHint = False
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000001700
          00001608060000002B760705000000097048597300000B1300000B1301009A9C
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
          67414D410000B18E7CFB51930000067F4944415478DA6D957B6C1CC51DC7BFB3
          CF7BFB7C67FBCE8E737EC584804D9A47835A8990849847490CB8499B026AA14A
          FF2845A2AA54A940719356116D550AC84269692B1A94474B0A020C88268E1B17
          2C0A2D1888B11D1CC73E5FECF3F97CAFBDC7DEEEEDCE74E294A829FD49A3D58E
          663FBFDFFCE63BDF258C3158F371247EFC23A48E1D81D0B80296DB8DA229F6B8
          E54A87CB616EF7D68BEB88DFE79183BEA4AB2DE4D0130B5E4BAEF9D09C9B308B
          9ABAE0F4955E94543CAF784578EFEE83BA662B2E06B908BFD0BB0FB92387A1C8
          802DC9215B600F89B07606424287127040AC72400E0720B7B5814936280594F6
          169426466098AE82B570D60133FB8020B1DF5906E0DBFD6B38D7DF0A72EED15E
          249EEE83D3E785C3E78600BB5714D8FEAAB00235128054ED06A9F6F01D3582A8
          6E30A643F23879121582A88312C0D429CCA9B761A4720F30CB3E584A18F0DFF3
          24C850DBD510741D4E8F9B888CED7053B3CFEF224DAEB5F5602A01F107214422
          201E0944E643E4B40A019D4D436CF541A892C03C5E54725964DF3D8DE2BC7E67
          3E567EC5CA14410656B440A9F28150DAE2A1F6A11A6ADEE0EB0C436CF081092A
          A4B59B6147E720B835DE8B0A88C07B27D483049B003D0BA2C421061DA0828DD2
          CC249B3F313AAC2FD93DCCAC24C9C9BA46C8D5D5BC44D2535F319EA9F34A2179
          DB1A3093426CDF04E5961EB0620166FF310E5DE2C30F69DD4D7CFE36581F8DC2
          1E7B877F3A0DC16381291212AFBCF4516A0C7B0D5DFC1799FFD3717CFA939F4A
          32436F4BA9F0B0A7AD5612B670F88201E7C38F436C6A5E3E79FBE38F61FEED24
          C4D04A485BB74108D52CCF1BCFFD11343E0C690DDFAD93223F325C38FB527207
          A3185A56CBC960BD541D083CBB8A59F78B5F6886B8B1052C5680D2731FE49BB6
          E3B3B0A7A621D6D5025ECFF23BCDE5601E7A1A608B10DB42FC11E5075EC4E81F
          3EFC2101FB15B139FC9F77EC12D5F18937DA1A7C37A38557705D042C9D055DD0
          A17EED7E285DB7E27F832616601C3D08968B42EAE04A9214D80BE7214814E75E
          78EF2F6689EC2615C6E4C5E177A4E49E7BDF6AED8C6C60E120A48D6D4041E380
          24685A81E7F12721844357C08D634761BEF85B889B9A20D4D64170A8A0C918DF
          9E8ED8A93303DA92D845D2F9FCEAF2DCBC11BF717B7FFBF55775207409CEB279
          3E8A5C6AAB2177DFC17B7AF5959547A33CC121C09901241384DF6A169BE2AD8A
          233A927D3E9712BE45A6CF4F77DBB264E676DD73A02D28AC175B5740BC762558
          22CBABBD06F2E62EAE9A551C200165137028FF956006C6F13F83952741022ED0
          B11158A9B83533A33E96CF893F279393E7F6941C6AB074E017BB5BDF3E7DA36B
          DB75FC7234F09E1B90B7EE86BCE586CB30F3CDD7F96E34A87BBE7179AE323404
          F3D5E740EAB8978C8EA0902916A2738E6FEB65F1389989C66E4EE5B5F5DA3FDE
          BD3EFCC4533B9BB6AC1259433DAF5481106C87DAB307104554FE3E00FDF06FB8
          1911A8777F07EA5DBB78A20C8CFE17608DBD0552D1604F9CB51359329CCC2A07
          CC827E82A4D2D9E685447CDB624EFBB2F444DFEDAB2F8C877D9B3B40C355FC22
          A95CD7ED109A56C17CED08280AFC0CDCA0335928B77F95C33E059D7C0FF08860
          73091413192DA92BFD89A9C45392DFFF3E314C534CA7529D73B9FC2D8B8343DD
          F5BF3FB4B1D957515C5FD9000BDC470C7EDDAB79A2780C422BF71BA30C2C6560
          CF2E71DFF101A50CF799242AF14CA5C048B96891674B0EFF2F238F3CB2C82D85
          C2300C3599CE6C8ACEC777165FEEDFB16260804B9E2AAE6B23A0D57E9E4007FC
          7E1087CC755D04E546079B822453A013B3D08B15BEC498AD64D2A72C59782CB8
          FFC05C70EF772FF9F9C5A1EB65F762A9F0C5D8F8E49DC553835DE1C1D34DB585
          943BB03A044B90A004BCB018672E699054EE84732958B12596D7F4B972959B58
          D43AE314E8A3BE07BFF781EFDEFB20FAAB2FC197654519D1F5927BD130D7C5C7
          27BAB3673EF952CD5F4F37BB4B8B81C0E479A7D2D1AA95C7A77C8E2A2F0445D2
          B4B8B6A80B42AC2449A3A6A6E524BDF4DACA871E7C3FB47F9FF599922EC32F25
          A0A45C361C29D3E88C9F9BEE2ADA5684BC71624DB52A67D9C404F35C88D7C3EF
          194C9E1C3458A0264F5DEA278CB2F35626938E7C7D57B2F107DF87DAD28CFF0B
          BF187C31314D43CA19E6554BE9F48672C50CF35F5FD1353925059A560E9746C7
          3F9052A9C6B3BDFB35C1E5CA32DEFF86BBBAC93507FBB848AF8CCFC19713FCE7
          1C52A974A4CC6873592BD4AB75B52985D179BFC733EB10C542F4F0518C7D732F
          EA76DC86F69FED836F6DE7E738FF06E1562B2F74B82C6F0000000049454E44AE
          426082}
        
        OnClick = LBP1Click
      end
    end
  end
  object PBotones: TPanel [6]
    Left = 0
    Top = 675
    Width = 1024
    Height = 43
    Align = alBottom
    TabOrder = 3
    object Image5: TImage
      Left = 1
      Top = 1
      Width = 1022
      Height = 41
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
    object IAceptarGenea: TImage
      Left = 888
      Top = 0
      Width = 33
      Height = 33
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
      OnClick = BBAceptarClick
    end
    object ICancelarGenea: TImage
      Left = 776
      Top = -5
      Width = 33
      Height = 33
      Cursor = crHandPoint
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002000
        00002808060000009F29F899000000097048597300000B1300000B1301009A9C
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
        67414D410000B18E7CFB5193000007E64944415478DAED587B6C5E65197F9EF7
        3D97EFDAAFEDD6D58DD66E2B06C145DD206E5EA2664CCD02066575235B660C51
        27754E8D061514045430991A8961449038B95AA971710C584C862CB343B74934
        BB806C2865AC5DDB75FD6EFDBE73DE8BCF73CED752596F933FF60FA779FB9EEF
        7CE7BCBFDFF37B7ECFF39E16ADB570210F7C8BC05B042E3881A1968BA7FB3E03
        4ADF0CAEF30E08C25FD0FCCCB4AB197B1958FB4D90A200DADC4EF3D09B212008
        74AB686FF9BABB7C09047B0E1CB57D431D44E2C8A4775BDB4AA08FB91F7CF707
        B03107C1533D0F10F92F1389CAFF45C056823BE5A2F9DF4EDCD00172710BE823
        2760F49EDF1DB5FDC36BC0778FBE21F21650EA7167E5E5CB131BAF06F45C089E
        DC07D54776DF4B616C0121C2F32180500DEF120B9B6F4CDEB016704113901200
        491FCCBF5E81CA3D8F1F36A7CF7480E71EAB45DE02817AD4BDF28A0FF91B5603
        4849840C80E340F8740F547FBBFB9760819550B3226095BA43B6CEFB6E625307
        8896E6187CECE684079A496CEB3E6206863F098ECC93CC7F743FB27485BFF12A
        4A9A004A432D81742E05A8DD3D50E9FAD336BA72232016A727A0CD12CC26F727
        3BAF4D8BB6F960ABE72A877E8DC4034F1C2212A1FBE1F72CF7D7AD8A231F031F
        BF19291D0E5477FC19825DFBD7516ABAA62760EC3B31E9EEF7D7AFCC89C51701
        84ACDA8432B5518200588963BDA05FEC05F7CA6551CE4989F8BB89F7B20A742D
        D8F59C55FB0E5F4B06FEC3CC1E50FA2B984BDDED5DB302B0751E3D3D59EA2C20
        474C0094B2FFE1387E08647F80DAFB4F503D2FDC47E9FA2A5D1D9D8D092972BD
        1973C99FBAAB97B9627E631CDDF91C8811C970DF31D0074F6C07477C81AE4D5A
        0953F701A5B7605DEAE7CEAA2520DE56CFA466073E16F981E304FEEF8729F24D
        9486D2945CA7ED844A7F8D4CF963E7A3977A38AF8E3D3243E410DDA30FBD0CFA
        1FAF3E0C12AFA7C883691F99A1153389EF91276E7756B403A47D72FA34242482
        79E114E8C327BBA92AD613A10066386622308752793FD6F99FC2A634802B2737
        DCF86A0876A80476B0B497EE6302AFBE1902046E1FC1FAE4C7710E8133F26C76
        4EAE8C4215EC40F1AF948E35446A5A1253116824BCDF607DE22A9C9B8AAF9CCF
        AECD46CC57C19C2EFE859EBB8E94E83D1F020D14E983548631389E27F8041276
        A4424A9498C467689DD766434012F876CC25364439079C5C7626356646895313
        642546488981E21EBA67033D772A56931EA8C6FEC4C1FAF980D94C7CD1DAF791
        D19E156DF5FE94B2D714A11C830D34F5882CED7C726A7FB0127D05F64507F9A1
        3BBA56A900BEBD15FC6F7D037064E3F510767503D6D7F386B280C6B3A239D30E
        69F75C02182B62FA0B0003852E22731CEA52DF110B725421E2DC3EC10A543511
        C80FDBD16095AD540E41A90CFE964E486CBD1378EBC2A05C06DDF31C546EB903
        CCF11360F38595984E75E1C2A639C824C616C5F8977D6510ECA8D929D7AE590F
        C56241ED7AEA36447B8B68A77DC3994082C14303E6A5BE3228588F731B77247F
        741BE09C4610EF5F1EED9E96DE1B3030242352E9D0CE57FDFD0ED03B7781F94F
        EF4AFDFCF38FC94B5A9A20E3D5D2436B1338E69A9E483EBAFD3AB8F49222BDD1
        A23EF8771B7CBEF3FB66A0EF56B1A8294E0793A5C8CD8B2787F1B2777DD6BDE6
        EA9DDEE62F81E3FB91A886309928BF10631004A42C4546F56B6850CCA04EBEC6
        8AACD64F3EFD1036A71B219300DB3B04B6E9A2BDE2C15F75E2A28543B6329AA4
        E705A692C6BE7442999B6EBD59FC6DFF1745DBDC68F332A7F225FCD8273AFDAD
        3F7C483436BA426B2551183A08D7C44D8B098461B44949BAEC69A57DAD754ABB
        4E42054168EEFFF5A7E5BDF7DD842A48856D8B8E8CDEF5839FE9C56D2366249F
        E51568013605623A1D88336754F227777F2EF1CC9E55C6F38360DDDA6D76F3A6
        6EE9F98E5461C5914EC5719C5129250D318A42701968AC542AD950A96C18F208
        D34AA978189B0CAD95F2E0A176DBD7DF5C59F6DE5361430340B99426F52481F3
        10357B18F0BD50D2428903071760B62EAF2E5FFA3245AC29D355022E398E1CE5
        D97579B8453A2FF28CC3C3672FA634E49840108619A5C23A3ACFF0673A4F2BD7
        F54222634AC59C0E82A4D6264139F4483D52CD30010A46F05EAD857402914E15
        A5105557A9C091B21C813A4ED9719D420D34CFC0AEE7163CC71DC1FED3034BC3
        20A8277022116649799EEBF83C9E2362758A3F2B4504A391D2C624C8C5322A4E
        444D246A9146800C5420903C9D17A2F31838EF79EE4834F367CF3B8B7DFDA7AF
        20051A188CC0193817F24C4A30A9A01AF05C572395AB11CB9257326428276E0F
        A829B7A51A5081161F89097823BE17018F4C416018070607971070C358F4247B
        362610459EA5C86BE988BC91515A2795561CBDC73E883D80864D452422A345D2
        BBA482C38426C8EE3AF937A87116F3F9426BF0BAE4199EC7C168E6AA08434DB9
        57498A3841D27B461B3732218C9990082057B10C85C02A116132643A5996D229
        D74C48C36513166232915279EA03A1478BA794D2E9508D5581E639C98340B934
        13347C3A77ADB11E994F720F18AF02E4AE8A548F42498921CD414C4230994A4C
        C6E1518E8DC8B324B33A65AC72238A7E6841B02EF509264480317044208A5AF1
        772E95A0636302DC0344ADEBDB8804351AEAAA8ABA70281D568348A0A80A4750
        1F90554164046295D2A5A80BE9A8118D11E0768BF424B9991A99E6CFF4EA2FB9
        7571A492C05972DEAE8589A34778FD4F111B3553442241E9E00643A529E2EA30
        E42B4E8FE5B569BDF1BF6F220217FC1F14179AC07F014D4AA8A20BE4F37F0000
        000049454E44AE426082}
      OnClick = ICancelarGeneaClick
    end
    object LAceptar: TLabel
      Left = 884
      Top = 27
      Width = 39
      Height = 14
      Cursor = crHandPoint
      Caption = 'Aceptar'
      Transparent = True
      OnClick = BBAceptarClick
    end
    object LCancelar: TLabel
      Left = 771
      Top = 27
      Width = 43
      Height = 14
      Cursor = crHandPoint
      Caption = 'Cancelar'
      Transparent = True
      OnClick = ICancelarGeneaClick
    end
    object BBCancelar: TBitBtn
      Left = 785
      Top = 90
      Width = 87
      Height = 27
      Caption = '&Cancelar'
      TabOrder = 0
      Kind = bkCancel
    end
    object BBAceptar: TBitBtn
      Left = 896
      Top = 90
      Width = 81
      Height = 27
      Caption = '&Aceptar'
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
  inherited PTitulo: TPanel
    Width = 1024
    Caption = #193'rbol Geneal'#243'gico de Animales Externos'
    inherited LTitulo: TLabel
      Width = 620
      Caption = 'Arbol Genealogico de Animales Externos'
    end
    inherited PILeft: TPanel
      Left = 816
    end
  end
  inherited Psocalo: TPanel
    Top = 718
    Width = 1024
    inherited JvSocalo: TJvImage
      Width = 1024
    end
  end
  inherited ALUniversal: TActionList
    Left = 179
    Top = 6
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 12
    Top = 7
  end
  inherited SDXLS: TSaveDialog
    Left = 46
    Top = 5
  end
  inherited DTXLS: TDataToXLS
    Left = 80
    Top = 9
  end
  inherited WinXP1: TWinXP
    Left = 256
    Top = 8
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 148
    Top = 7
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 356
    Top = 7
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 324
    Top = 7
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 108
    Top = 7
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 212
    Top = 7
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 292
    Top = 7
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 168
    Top = 568
  end
  object IBQP: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 1 AND ID_AUX = ' +
        '1')
    Left = 232
    Top = 536
    object IBQPID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQPID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQPID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQPID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQPID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQPID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQPID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQPID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQPNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQPAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQPRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQPSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQPINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQM: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 2 AND ID_AUX = ' +
        '1')
    Left = 240
    Top = 328
    object IBQMID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQMID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQMID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQMID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQMID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQMID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQMID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQMID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQMNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQMAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQMRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQMSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQMINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQPP: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 1 AND ID_AUX = ' +
        '11')
    Left = 472
    Top = 34
    object IBQPPID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQPPID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQPPID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQPPID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQPPID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQPPID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQPPID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQPPID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQPPNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQPPAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQPPRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQPPSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQPPINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQPM: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 2 AND ID_AUX = ' +
        '11')
    Left = 296
    Top = 538
    object IBQPMID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQPMID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQPMID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQPMID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQPMID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQPMID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQPMID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQPMID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQPMNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQPMAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQPMRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQPMSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQPMINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQMP: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 1 AND ID_AUX = ' +
        '12')
    Left = 472
    Top = 322
    object IBQMPID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQMPID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQMPID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQMPID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQMPID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQMPID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQMPID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQMPID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQMPNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQMPAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQMPRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQMPSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQMPINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQMM: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 2 AND ID_AUX = ' +
        '12')
    Left = 432
    Top = 466
    object IBQMMID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQMMID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQMMID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQMMID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQMMID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQMMID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQMMID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQMMID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQMMNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQMMAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQMMRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQMMSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQMMINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQPPP: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 1 AND ID_AUX = ' +
        '111')
    Left = 792
    Top = 42
    object IBQPPPID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQPPPID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQPPPID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQPPPID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQPPPID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQPPPID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQPPPID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQPPPID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQPPPNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQPPPAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQPPPRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQPPPSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQPPPINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQPPM: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 2 AND ID_AUX = ' +
        '111')
    Left = 880
    Top = 114
    object IBQPPMID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQPPMID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQPPMID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQPPMID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQPPMID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQPPMID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQPPMID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQPPMID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQPPMNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQPPMAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQPPMRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQPPMSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQPPMINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQPMP: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 1 AND ID_AUX = ' +
        '112')
    Left = 904
    Top = 178
    object IBQPMPID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQPMPID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQPMPID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQPMPID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQPMPID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQPMPID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQPMPID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQPMPID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQPMPNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQPMPAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQPMPRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQPMPSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQPMPINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQPMM: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 2 AND ID_AUX = ' +
        '112')
    Left = 936
    Top = 242
    object IBQPMMID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQPMMID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQPMMID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQPMMID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQPMMID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQPMMID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQPMMID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQPMMID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQPMMNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQPMMAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQPMMRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQPMMSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQPMMINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQMPP: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 1 AND ID_AUX = ' +
        '121')
    Left = 792
    Top = 346
    object IBQMPPID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQMPPID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQMPPID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQMPPID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQMPPID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQMPPID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQMPPID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQMPPID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQMPPNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQMPPAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQMPPRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQMPPSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQMPPINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQMPM: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 2 AND ID_AUX = ' +
        '121')
    Left = 792
    Top = 402
    object IBQMPMID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQMPMID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQMPMID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQMPMID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQMPMID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQMPMID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQMPMID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQMPMID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQMPMNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQMPMAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQMPMRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQMPMSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQMPMINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQMMP: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 1 AND ID_AUX = ' +
        '122')
    Left = 792
    Top = 482
    object IBQMMPID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQMMPID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQMMPID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQMMPID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQMMPID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQMMPID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQMMPID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQMMPID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQMMPNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQMMPAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQMMPRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQMMPSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQMMPINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object IBQMMM: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM AUX_ANIMALES_EXTERNOS WHERE SEXO = 2 AND ID_AUX = ' +
        '122')
    Left = 792
    Top = 546
    object IBQMMMID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQMMMID_AUX: TIntegerField
      FieldName = 'ID_AUX'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_AUX'
      Required = True
    end
    object IBQMMMID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_OTRO'
      Size = 10
    end
    object IBQMMMID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_PC'
      Size = 10
    end
    object IBQMMMID_HBA: TIBStringField
      FieldName = 'ID_HBA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_HBA'
      Size = 10
    end
    object IBQMMMID_RA: TIBStringField
      FieldName = 'ID_RA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RA'
      Size = 10
    end
    object IBQMMMID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_RP'
      Size = 10
    end
    object IBQMMMID_SENASA: TIBStringField
      FieldName = 'ID_SENASA'
      Origin = 'AUX_ANIMALES_EXTERNOS.ID_SENASA'
      Size = 9
    end
    object IBQMMMNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'AUX_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQMMMAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_ANIMALES_EXTERNOS.APODO'
      Size = 50
    end
    object IBQMMMRAZA: TIntegerField
      FieldName = 'RAZA'
      Origin = 'AUX_ANIMALES_EXTERNOS.RAZA'
    end
    object IBQMMMSEXO: TIntegerField
      FieldName = 'SEXO'
      Origin = 'AUX_ANIMALES_EXTERNOS.SEXO'
    end
    object IBQMMMINTERNO: TIBStringField
      FieldName = 'INTERNO'
      Origin = 'AUX_ANIMALES_EXTERNOS.INTERNO'
      Size = 1
    end
  end
  object DSP: TDataSource
    DataSet = IBQP
    Left = 264
    Top = 536
  end
  object DSM: TDataSource
    DataSet = IBQM
    Left = 280
    Top = 328
  end
  object DSPP: TDataSource
    DataSet = IBQPP
    Left = 504
    Top = 32
  end
  object DSPM: TDataSource
    DataSet = IBQPM
    Left = 328
    Top = 536
  end
  object DSMP: TDataSource
    DataSet = IBQMP
    Left = 504
    Top = 320
  end
  object DSMM: TDataSource
    DataSet = IBQMM
    Left = 464
    Top = 464
  end
  object DSPPP: TDataSource
    DataSet = IBQPPP
    Left = 816
    Top = 40
  end
  object DSPPM: TDataSource
    DataSet = IBQPPM
    Left = 912
    Top = 112
  end
  object DSPMP: TDataSource
    DataSet = IBQPMP
    Left = 936
    Top = 176
  end
  object DSPMM: TDataSource
    DataSet = IBQPMM
    Left = 968
    Top = 240
  end
  object DSMPP: TDataSource
    DataSet = IBQMPP
    Left = 824
    Top = 344
  end
  object DSMPM: TDataSource
    DataSet = IBQMPM
    Left = 824
    Top = 408
  end
  object DSMMP: TDataSource
    DataSet = IBQMMP
    Left = 824
    Top = 480
  end
  object DSMMM: TDataSource
    DataSet = IBQMMM
    Left = 824
    Top = 552
  end
  object IBQMachosExternos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select tae.id_animal_externo, tae.id_rp, tae.nombre as nom, cs.t' +
        'ipo ,tae.id_rp||'#39' '#39'||tae.nombre as nombre from tab_animales_exte' +
        'rnos tae join cod_sexos cs on cs.id_sexo=tae.sexo where cs.tipo ' +
        '= 1'
      'union'
      
        'select tac.id_animal_interno, tac.id_rp, tac.nombre as nom, cs.t' +
        'ipo ,tac.id_rp||'#39' '#39'||tac.nombre as nombre from tab_animales_comp' +
        'rados tac join cod_sexos cs on cs.id_sexo=tac.sexo where cs.tipo' +
        ' = 1')
    Left = 168
    Top = 536
    object IBQMachosExternosID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQMachosExternosID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RP'
      Required = True
      Size = 10
    end
    object IBQMachosExternosNOM: TIBStringField
      FieldName = 'NOM'
      Origin = 'TAB_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQMachosExternosTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'COD_SEXOS.TIPO'
      Required = True
    end
    object IBQMachosExternosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 61
    end
  end
  object IBQHembrasExternas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select tae.id_animal_externo, tae.id_rp, tae.nombre as nom, cs.t' +
        'ipo ,tae.id_rp||'#39' '#39'||tae.nombre as nombre from tab_animales_exte' +
        'rnos tae join cod_sexos cs on cs.id_sexo=tae.sexo where cs.tipo ' +
        '= 2'
      'union'
      
        'select tac.id_animal_interno, tac.id_rp, tac.nombre as nom, cs.t' +
        'ipo ,tac.id_rp||'#39' '#39'||tac.nombre as nombre from tab_animales_comp' +
        'rados tac join cod_sexos cs on cs.id_sexo=tac.sexo where cs.tipo' +
        ' = 2')
    Left = 200
    Top = 568
    object IBQHembrasExternasID_ANIMAL_EXTERNO: TIntegerField
      FieldName = 'ID_ANIMAL_EXTERNO'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_ANIMAL_EXTERNO'
      Required = True
    end
    object IBQHembrasExternasID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'TAB_ANIMALES_EXTERNOS.ID_RP'
      Required = True
      Size = 10
    end
    object IBQHembrasExternasNOM: TIBStringField
      FieldName = 'NOM'
      Origin = 'TAB_ANIMALES_EXTERNOS.NOMBRE'
      Size = 50
    end
    object IBQHembrasExternasTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'COD_SEXOS.TIPO'
      Required = True
    end
    object IBQHembrasExternasNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 61
    end
  end
  object DSMachosExternos: TDataSource
    DataSet = IBQMachosExternos
    Left = 200
    Top = 536
  end
  object DSHembrasExternas: TDataSource
    DataSet = IBQHembrasExternas
    Left = 232
    Top = 568
  end
  object IBQGuardar: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'insert into AUX_ANIMALES_EXTERNOS'
      '  (ID_ANIMAL_EXTERNO, ID_AUX, ID_OTRO, ID_RP, NOMBRE, SEXO)'
      'values'
      
        '  (:ID_ANIMAL_EXTERNO, :ID_AUX, :ID_OTRO, :ID_RP, :NOMBRE, :SEXO' +
        ')')
    Left = 136
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_ANIMAL_EXTERNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AUX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_OTRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_RP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO'
        ParamType = ptUnknown
      end>
  end
  object IBQGetPadre: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_animal as id_padre from get_padres(:id, :ext)')
    Left = 8
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ext'
        ParamType = ptUnknown
      end>
  end
  object IBQGetMadre: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_animal as id_madre from get_madres(:id,:ext)')
    Left = 40
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ext'
        ParamType = ptUnknown
      end>
  end
  object IBQRNArbolGenea: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM RN_GENEALOGIA_EXTERNA(:ANIMAL, '#39'1'#39') WHERE ERROR>0')
    Left = 72
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end>
    object IBQRNArbolGeneaTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'RN_GENEALOGIA_EXTERNA.TIPO'
      Size = 1
    end
    object IBQRNArbolGeneaMENSAGE: TIBStringField
      FieldName = 'MENSAGE'
      Origin = 'RN_GENEALOGIA_EXTERNA.MENSAGE'
      Size = 255
    end
    object IBQRNArbolGeneaERROR: TIntegerField
      FieldName = 'ERROR'
      Origin = 'RN_GENEALOGIA_EXTERNA.ERROR'
    end
  end
  object IBQBorrar: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'DELETE FROM AUX_ANIMALES_EXTERNOS WHERE ID_ANIMAL_EXTERNO = :ANI' +
        'MAL')
    Left = 104
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ANIMAL'
        ParamType = ptUnknown
      end>
  end
  object IBQExternos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select id_animal_externo from tab_animales_externos where id_ani' +
        'mal_externo = :id')
    Left = 40
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQFechaCompra: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select fecha from eve_eventos where animal = :id and tipo = 2')
    Left = 8
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
