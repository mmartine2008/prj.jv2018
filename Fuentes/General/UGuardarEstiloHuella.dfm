inherited FGuardarEstiloHuella: TFGuardarEstiloHuella
  Left = 268
  Top = 189
  Caption = 'Guardar archivo'
  ClientHeight = 487
  ClientWidth = 672
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 672
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
  object Label1: TLabel [2]
    Left = 8
    Top = 88
    Width = 486
    Height = 16
    Caption = 
      'Seleccione la carpeta donde desea que se guarden los archivos im' +
      'portados.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Image4: TImage
    Width = 288
  end
  object STVArbolSistema: TShellTreeView [5]
    Left = 8
    Top = 120
    Width = 233
    Height = 259
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    ShellListView = SLVDirectorios
    UseShellImages = True
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 2
  end
  object SLVDirectorios: TShellListView [6]
    Left = 248
    Top = 120
    Width = 417
    Height = 259
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    ShellTreeView = STVArbolSistema
    Sorted = True
    OnAddFolder = SLVDirectoriosAddFolder
    ReadOnly = False
    HideSelection = False
    TabOrder = 3
  end
  object PBotones: TPanel [7]
    Left = 0
    Top = 388
    Width = 672
    Height = 77
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 4
    object Image5: TImage
      Left = 0
      Top = 0
      Width = 672
      Height = 77
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
    object ISalir: TImage
      Left = 424
      Top = 8
      Width = 57
      Height = 57
      Cursor = crHandPoint
      Picture.Data = {
        0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000003500
        00003808060000005D78B0AE0000001974455874536F6674776172650041646F
        626520496D616765526561647971C9653C0000078B4944415478DAEDD85B681C
        551800E07FE6CCEC6E765B9B1AC46A5B51105B5B2A5141D0A2185BEB0D118B7D
        A8176CA5F4C1A78A22FA20220A5E40AC887D10515F44C10BBE48A1281514A528
        36A5547BD3D6365EAAC646DB4D7633E7E2FF9FCBEC6C9A7467662756A5038773
        32BB3BFB7FF39FF9CFD978F03F3CBC531DC069D469D4FFEC388DFAAF1CA751FF
        95A330D4F0BC0BCFC78EDA48DFD0FEC19CD7E8B7D718C46B1C3CA5280C660D76
        AF274E6DC4A01EC8780DFAFC9AC4A9B5788D374E09CA81D8C5F3A1B27E15A823
        C330F6E2DBA0C69A6F60506BB380C281CBA0BC6A05888343D078E91DBA462E58
        57A818B4F83CA8ACBB03BC72499F97877E4E0D9B08724737B0DCA8A940EE4803
        9B0AD42D2C17AA13280DAC13A81B5866545AD0C960694179619950184C2F7647
        D982B950597B1B4007500C3BFC0B3436BD0FAA31EE025A135EBD044A2B97A5FE
        6EF9C3108C6D7C77048717206CA448D4B5D86D2DDD7E1504972FCAF251903FFE
        0ACDD736836A46105C7931946E599AE9F32039345EFE00E4919101447D52248A
        3275C09FD3DB5BBEE77A8052982DAE9F7E07B17708C26BFBB381F0E083FB20FA
        F04B5AD867777A6FEE67CA9FD787D307EF7618640E30EB21767E0FD196419A72
        0369762B5D553F7FEE9950BAF50A80804D1F68D74188B6EE4A0DCA8D6A839D3B
        1BC21B2F9D1698F8F610F04FF7640275856A839DD30BE1F22585C2C4EE21E05F
        ECCF0CEA1AD5069B330B8281C5E031BF7BD0BE1F816F3B900B5408AA0D76F619
        105CB3B0AB8CC97D3F01FFEA87DCA0C25027C0965E04902363E2BB9F417C7D98
        8697E605158DD25B1FEFAC1A7833CBB9AEA18E3541FD56A761EA9F2DD3862A02
        5424AC88425118A82858B725BD705011B06E16DF6903750BCBBB4D9A765037B0
        3C1BDA17B0DBF04F802681A5FA2F55AE1F895E5F15BC5995ECC199C0806E48E6
        CFFED900353C4AC3D945FF48A41F42DBFD73CF00A864FBC94120BCE3144C2F65
        3833ACC1F1F7D85F34BAA0D33F3AF34CBFED5062FD1AE6A7FB780234808D6ECC
        EB99605219D0B8F80441039DDE9E074553706B5A5812E4B63E6E4B950AD6020D
        DA6B8C4087236FF54B059B0C94B84667580E506E541A98061D1FFFD39B3973D9
        8C1DDB764C768D630BFBEF8566F3D549613941B951524A4F08E9D557DDD927B6
        EFF818182C49C234A81E1DF36EBE61B5FFEC53BB4081AFCC2BF6FB3C33F0408A
        95AB57C19EBDCFB5C11C48C04ED67FC9B219EFBD35ECFBBEA25618CA20842F95
        0A715C92021BF55294C4475BFBD4238FBD09627C8137BB07E0F838A8A6A847EB
        EEDB10ADB97B3F427CA5F4F7784A598BE7292DF4900B9E2C3FF4E84DECB3CF1F
        F66A258019255047C7F0A74B698FF7CC9377B1E5D71168DC67D87CBF892DF23D
        3F62CC975321A7442102318A4945085111BAC93237E33282CAC2E260F79E332B
        0F3EFA843F3CBC4855ABC3C7EF5FBFB171D38A438860D80885BF1A55F2FB94CE
        16660A81D44465F396F93336BDF280373ADA27FBFABE693CFFF4E3B070C11F04
        424093F90C7BD6C4D6300D81D4FB1A2BB04D8DC2200914604FC1F7708E4DF00A
        F50616F765D3A406E2FB691C2AA5A121DD1004052D98F2EDF721467F6D0CC2C6
        31286C5EE4992C8C1B0CA3CC34DB31AC1104BA1F0B5840E3311A5B205DA71D85
        41D2B3820173C25439E755AEC7D8736191BCEAB016574194CEA2C92021A599A6
        52061646D9F2DB9EA956962CC8401C4667A70519732D0802DB9B31C246B11F35
        B860943EE7B581303B1874CD2078358A1040BD4121C69CC7F7562DBAC7660EB3
        893DB7D31491F4DC090BB4D962C967CA664868847D66DAB2E110D49BA031E080
        301A81AF8D86D4630BC380C6F5C0FE1DA330C01003ABF1282244CDA21CD0F6A2
        6650AD717C5ED00D1036B3A26AB084962E7B819D828492363BC96CE8BB4D779E
        992CE82003C65C264CD0CC9EB77F6B8C4685E67C18D4631402CA14184748C423
        13B01E27613A3B359BBD9A101A568B26BCCECD6BF1CDA031652C39D5A98A1948
        22483395EA88AA874190780D7BC674F01655B719AB1B5418672A4CA26CA63444
        67896011AF46276629197C0F17F6BC9DA2DC64B12751502AF47CB967CB658A9E
        2544D133D49A6EFA1971503BED1873300D67CC614D062DAA7513C2C4F473CF94
        70CF930B3A8AB3E20A869B7E143465A1E28A8748947E612A22160B152A9A7AAD
        F50A687DF2707DF26CC5F3A95CC75351F70E38969C9A06E4A6A37EBE1017EA73
        0E459F3BB1FA516936C1F7242A5F5C1412C5C19677E9CA7BC5563CB37E29A931
        D296753045A2B54ED972EE53C1B0D58FD1C26A4B78FBF3E6DB0AD82AE1091881
        7456094F4567D2750A1B33380DA3025031D58D57789C0D8D48AC556E7DA2A986
        18CA90AE78925139B795CFAD90D25440EA7DBB4E791CC7BC55D6CD0EC24C5193
        C1808041D0B0251DA72C616CB937BB0D71C23A3509CE17F1DD8F31E5E49A84BD
        5B93F4BA6430324894F1E4C29BD851E84538B9000B83A2E9E8BB4665DE96FCB6
        B54BF77ADBE4E91B204FBAA338C9960983D39988116202C6946D3D66495462DF
        17A35AFBBFB669D8B6BBD015D2E25CF3A847FC4448AABDDFC90E97454959906E
        8AC55B22DDD36B6077120A62D0C44CD10B7242C678ABA7E9A4C70498125108AA
        1398B2820D6C8640D73B98B8A1D6DB40BD0FB43B0C8D4D1BF83F8AFA371C7F03
        7F10006F91DD97510000000049454E44AE426082}
      OnClick = ISalirClick
    end
    object LSalir: TLabel
      Left = 429
      Top = 56
      Width = 51
      Height = 16
      Cursor = crHandPoint
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = ISalirClick
    end
    object IAceptar: TImage
      Left = 192
      Top = 14
      Width = 41
      Height = 44
      Cursor = crHandPoint
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
      OnClick = IAceptarClick
    end
    object LAceptar: TLabel
      Left = 190
      Top = 56
      Width = 45
      Height = 16
      Cursor = crHandPoint
      Caption = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = IAceptarClick
    end
  end
  inherited PTitulo: TPanel
    Width = 672
    Caption = 'Guardar archivo/s'
    inherited LTitulo: TLabel
      Width = 268
      Caption = 'Guardar archivo/s'
    end
    inherited PILeft: TPanel
      Left = 464
    end
  end
  inherited Psocalo: TPanel
    Top = 465
    Width = 672
    inherited JvSocalo: TJvImage
      Width = 672
    end
  end
  inherited ALUniversal: TActionList
    Left = 651
    Top = 54
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 580
    Top = 47
  end
  inherited SDXLS: TSaveDialog
    Left = 646
    Top = 85
  end
  inherited DTXLS: TDataToXLS
    Left = 648
    Top = 113
  end
  inherited WinXP1: TWinXP
    Left = 648
    Top = 16
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 580
    Top = 111
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 580
    Top = 15
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 580
    Top = 79
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 612
    Top = 15
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 612
    Top = 79
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 612
    Top = 47
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 616
    Top = 112
  end
end