inherited FRacionDatosAd: TFRacionDatosAd
  Left = 508
  Top = 176
  Caption = 'FRacionDatosAd'
  ClientHeight = 326
  ClientWidth = 578
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 578
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
  inherited Image10: TImage
    Left = 1048
    Top = 424
  end
  object Label3: TLabel [2]
    Left = 66
    Top = 145
    Width = 201
    Height = 49
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Porcentaje Utilizado en la raci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel [3]
    Left = 120
    Top = 89
    Width = 147
    Height = 22
    Caption = 'Precio / Tonelada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [4]
    Left = 405
    Top = 88
    Width = 11
    Height = 22
    Caption = '$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [5]
    Left = 405
    Top = 159
    Width = 17
    Height = 22
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbTotalRacion: TLabel [8]
    Left = 0
    Top = 207
    Width = 578
    Height = 24
    Align = alBottom
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Control'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  inherited PTitulo: TPanel
    Width = 578
    Caption = 'Datos'
    inherited LTitulo: TLabel
      Width = 174
    end
    inherited PILeft: TPanel
      Left = 370
    end
  end
  inherited Psocalo: TPanel
    Top = 285
    Width = 578
    inherited JvSocalo: TJvImage
      Width = 578
    end
  end
  object EPorc: TEdit [12]
    Left = 288
    Top = 157
    Width = 113
    Height = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnChange = EPorcChange
  end
  object EPrecio: TEdit [13]
    Left = 287
    Top = 85
    Width = 113
    Height = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnChange = EPrecioChange
  end
  object PBotones: TPanel [14]
    Left = 0
    Top = 231
    Width = 578
    Height = 54
    Align = alBottom
    TabOrder = 5
    object IFondoB: TImage
      Left = 1
      Top = 1
      Width = 576
      Height = 52
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
    object LAceptDatos: TLabel
      Left = 304
      Top = 20
      Width = 45
      Height = 16
      Cursor = crHandPoint
      Caption = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = IAceptDatosClick
    end
    object IAceptDatos: TImage
      Left = 248
      Top = 3
      Width = 45
      Height = 46
      Cursor = crHandPoint
      AutoSize = True
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000002D00
        00002E0806000000BC8E90340000001974455874536F6674776172650041646F
        626520496D616765526561647971C9653C00000A3D4944415478DAED990B5054
        D71980FFDDFBDA070BBB2BB0AB8080200AF8001FD5C8181FA9A6A6130DED4CDB
        C469228DCD4C621AEDD8C6CEB4534DDBC94C33E9A4E924B56DDA1ADB693A713A
        898DA6B1D318995A5FF800F18180B020B0202CECDD5DF671F73EB6FFB9175689
        ECB26B9A4767F2CF1CCEB9E79E7BF8CE7FFEC739A083FF43D17DDA009F437F96
        E573E8CFA13F51E8ED35ABEFE87BF944FD670B5A837CEC9E99E2EA4A875C64E1
        1428CB96E3AFFB037A70FB2968F3504DFF7631047E3F2EA2E9D381DE5EB3A53C
        47DEBDA942285A592C82DD64078EC90703960F4B44EC8590D00EB21282F75A59
        38DEC5349DE8669E43F8839F0CF4F69AAAFC4C65DFE34B22552B0A1136631964
        5BD68081CD87D1703B84A3BDA028E1F870869E0646360F8C5C3EF84317C11B3C
        03BE50335CECA7E195D3C6FA1BBCBE0EE1BB3E3E68D4EEDA59E2BEAD8B23E0CC
        2A81A29CCD208823E00934802C0780A56DA8ED6C75284767832079D47638EAC6
        32800B9B010EEB2A75513D9EB72014ED83FD8D1CFFD655AE2E1DADA70EBDBD66
        CFA355C2EE2F974511B6164C5C1EF40C1F01BD8E829C8CC5C0509629A70821FC
        50E03C5094094A9D8F402F7E3FE46F807A17037BCF1A08F8EBFF3B68D4F0B717
        09FB56A239CC99F10DD49A17FAF913906F5B85F0D3D3DA2C228170170CF8CEE2
        E237A09D87A1E3E6DFE1783703AF5DE052029F1A1AA3C38A7CE9585DB500B39D
        1B211071031FEC8059B91B80D2B169038F4B04CDAADB7314EC967215A29F3F07
        EFB43270A88DAD9E2ABA2487DE5E63CD36C55C3FA8095BF3ACB33032D8D0913A
        A024773D50FABB07E6835EB5B618CDD036F02E3AF25C18456504C26EF8CD7943
        53F30F4F577F14E8979E5E12D931DB2E034D1981D61B10F8BE8F04DCDC730116
        143E8826168041DF45C8CDB442E7E0517462B36A7623611D3C77DC44C2E19EF4
        A1B7D71495D864D7938B22F1AED98EF518BEAC770DDCD47D16EEADA88365B31F
        549FCFB41F822B37DE850C430C7A461AE2E3FE768DE34FF7D1C508CEA70BBDE7
        D17991DD15395A76CB45DBCBCD2CBF6BE04BBD17604DE5B7E2C0E342C09BBBDE
        0149E9037FA45FED2359F4E573C6844E9910DAB87385EB472BC245A4CDA069CC
        76DE77D7C02D7D1761EDFCAD77008F4BFD9537E06ACF7BC087AEC4FB7EDB6468
        BAF1D35393DAF6E4D098F5AA73A5C65A8CC9449C59F3C16ACA9B30645408A875
        06973C3EB70E5C82750B9E48084CA4B9BB1E0E9CFA19E4588CE00FF7A97DC76E
        30A4D826339144D05BEE2F8EEE5B3E5DC2E44143714E0D3A1F1D7FDD31D8022B
        CB1F51DB275B0F40494E25E874B7DE9384A3D3E9A0A5FF1C026F4D0ADC3BD20A
        BFFAC71330D35E8C31DF00378635DBEEC243D6FECBDC9AC94E8889A0F77CB342
        D85D9825838573A02DCF89BFEAF6B4C197AA9F9CE04CFF6979130AA7557C48C3
        E7E08B0BEA5202CEB54CC7B0E7D4E647684989001FD1C12B8DC649A34822E863
        8FCF8BAC769815DCB23230B1765573BDDE4E78A0FAA9499DE96CFB61706415C6
        81D7A500FCEB7F6E83A26995784E61F19C1254FB47825D98C006D4F6F3674CE9
        41EF5A1A5A4D9AB49EC3AD5B0C7C780456553E9C1084803720B82F3404EB16A6
        007C641B943A168199D342A82C47C133EAC2F47E15949816B17E7E364DE867AA
        C2AB0D740C6CA6028CA3B9A8E5EBF0ECA6BFE05174464218024E2425E0DC5BC0
        3150F0BCCDE381CA87E01D986434DF7BE15C7AD06F7FBD4C78A8C02223743ED8
        CCF9B8655E9C1CE099077E870966EA135D32E05939D52A30D16814CD4210832A
        38919BBE560846B534FFE2F9F4A0F76C9A25EC2EB5CA686F6628CC5EAC76F3C1
        9B10D3DD1D38017EF5C853686A95F8AD192459406865C2184591A073A801FB25
        E8095070A09DFB2E42FF3255E887EE718A6F2F9F2EAA8F25B94BF1B0A4418E04
        FBD55F960EF838709EB534E9377CA81FFABC2D6ABB719086FA3E36AD90579463
        545C9BE768E70EBB7906144C9B177F3D3CEAC6B024A6044E807FFFFE4E706416
        4E39B6C57D1CCD45BBAA1D7271D0F193D393F2253B7B34D65584AB32D998FA58
        E6580616C3B4F86BCF682F44718B93816BC0DFC3B05681C989490A3C1CEC852E
        4FB3DA16641DFCA9C57030F48B93B5E9426F59EE14F72D736A26626233615EFE
        AA0943FCE161188DFA61DBFDAFDE014E80FF70F4FB509C3D1F8FB53424134916
        E162CF5120714446BBBE3A42C3BF6EB0B589EE8DC9A0AD1C1573D5954748AD76
        E5DBE7AAE576090A3EF0868726808F0397E42EC4389F5CC3445AFBCFA0028630
        F316E10DE63AECBF66ECE25F38599C68FC5497801D5539D24B1B4BADAA060291
        114C084BE2996F5C46233E18090DA8E0C4DEFF78F4591C578D1A9E1AD8357811
        DC085A80CA20F5C97E1D9C19606A93DDCE53B923367EB544A85A9A5F8CA9368C
        507D50E65C8AE013154162ADDBE7526F24658EC5083CF5EDA6CFDB866799CB50
        842634E8EF864E2F0F7F6D331C44E0DA64DFA5025D84E6D1F89512C1BAB4A042
        D538D108F94579F6B20943896D124945C3ADEE063CF47BE2C06E9F1BDE6C3774
        F182AE3AD18D2575680DBC2AD7A81CDB502858E73A4A201B53B9DBDBA186BDF2
        BCE518C3CD294D43840F0E620269C68C98A586C1EB371BC18317DD839D1C3F18
        D6AF49E5EF7C29412B8A0299BBD62F9294F007B5C591AC629B15CFD85ADCBEE9
        EB0686E630D53BF144989F708EA140AFAA5112FA086C08A34ED7D065E80B08F0
        411FE70B88C6B5A1178F5E48852729B424493A5996594992CDA22466EE3ABC77
        E91B4DEF3F5F61F3977EC121A2C6F36086AD046FD2468408A88ECA617B3C4110
        3162A8248016831DC3A6451D437689D44D1E1A5AF8CCEBDF59F1F0D33BEEFD5A
        0BC3D0018AA683945E2FD2341D4B1B5A14450AA12DD1A898158D46AD58B2A2A2
        9879ED66F7F41F1F7B7D73EBF0B55504BCDC26A93056B303C16CAA264DB7C56C
        02A7461E3CDAF2A141D5993BF156D2E431454AED95C75EDBB8F3CF0CC3F85996
        F591C2B18C8FC11A637B0017A1A40C8DDAD5890458885A85A8601584A86D0C1C
        8BA8D6CD031D33F7361D5ED5C677CD2CCE0C33791932E4E1A5613CA6DF2E24C3
        79227AE8F451E00E1AC4727B79FB63F3D69D5AE82CE966598667189647609EE3
        B08CD5F8ECA589D6A93B274C04AD474D670A2A34820A824DD0A06DE3D05A3B6A
        1D1CE5B34FF5B7CCBC34DC95D313F464B4F9DDC66C2381D7E61A091B94027376
        04CBE8FC6945831B8A96B80810816319866739D64B80499FAA698EBCE3BCD8CF
        33349A4BAAD0C4F1D0340C089EA54147B51A4D4514D14CD45A2D16B238DC950C
        4994CC922C9B880FC46231060BDED07431BD5E27527A2A42D15418218234C304
        10966CBD1F358C85F1116DDF320F4DEB0C8B26C330425A363D06CEA84E8860C4
        9EE390A298214D00958CB2AC70F80D2B2B0A03B1987E6C6E42AEE8D1B1B008A8
        3552C264DB699A0A21F028B67101DA42109E2CC24F9C119FA5B41D7102BC2C53
        B22471A84513590402135823D6082B1B08AC22638929346A9814FDD8F4080D0A
        82CB7A9D5ED253FAE818784483A742081D42A70B929DA0F11D42CB5331A5FDEF
        0BE2A4C4E6119441EDD2A44658468555B00002C7401FD3268FE10FA26D5903D7
        118D8B3ABD5EA234ED4B08AF4C66B7C9E4BF6F7F497A51DBB1D6000000004945
        4E44AE426082}
      OnClick = IAceptDatosClick
    end
  end
  inherited DTXLS: TDataToXLS
    Left = 384
    Top = 113
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 444
  end
end