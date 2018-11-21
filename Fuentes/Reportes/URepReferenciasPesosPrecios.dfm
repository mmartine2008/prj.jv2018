inherited FRepReferenciasPesosPrecios: TFRepReferenciasPesosPrecios
  Left = 236
  Top = 166
  BorderStyle = bsDialog
  Caption = 'FRepReferenciasPesosPrecios'
  ClientHeight = 561
  ClientWidth = 765
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 765
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
    Width = 371
  end
  object PBoton: TPanel [4]
    Left = 0
    Top = 469
    Width = 765
    Height = 51
    Align = alBottom
    Color = clWhite
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 763
      Height = 49
      Align = alClient
      TabOrder = 0
      DesignSize = (
        763
        49)
      object Label1: TLabel
        Left = 9
        Top = 17
        Width = 171
        Height = 13
        Caption = 'Los precios deben ser netos.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object BBAceptar: TBitBtn
        Left = 514
        Top = 12
        Width = 90
        Height = 29
        Caption = 'Aceptar'
        TabOrder = 0
        OnClick = BBAceptarClick
        Glyph.Data = {
          E6040000424DE604000000000000360000002800000014000000140000000100
          180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF8F8F8F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF80A38E5D9B76F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB6A9A7C4C
          DB8D78EFAF469B69E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F759946F3FD7817DF3B1A2FC
          CF94F1C035985AE2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFEBEBEB4A90632BD17144E68354E9907AF2B0A0FCCF
          85EDB4309855CED1CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFDEDFDE338C511BCD620ED85517DB5D3EE37D59EA9568EDA170F1A864
          E79B259B4DB9BFBAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D4D2
          2888470CC35206CC4600CE4003D54B1ADB6031E0733DE37D3CE37C35E47736DC
          761B9844ACB5AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C7C315843401BA4300
          BF3600C03503C9410FD14F1CD85C28DC672CDD6B26DC6710D85600D54711D156
          0D963893A396FFFFFFFFFFFFFFFFFFFFFFFF59906700B23400B02612BB3D3BCC
          6453D67A5FDC862EDB6522DA5E5BE38859E08653DE8148DA7620D05607C74801
          932B849787FFFFFFFFFFFFFFFFFF70A47B0BB62B50C56973D48A76D88F76DC92
          32D8628BBB98BCCCC030CF6170E59474E09572DE9277DD9458D47909BE3F008D
          1F6D8870FAFAFAFFFFFFF5F5F55CA66765D27A98DDA88BDD9F2DCB559FBDA5FF
          FFFFFFFFFFD4DBD536C15D83E79F91E1A789DEA08FDEA47CD79117B73F008613
          527853F0F0F0FFFFFFFFFFFF67A67162D17639BD56AAC0ADFFFFFFFFFFFFFFFF
          FFFFFFFFDFE3DF41B85E91E7A7ADE6BBA2E1B0A9E2B59ADBA622AE3D007D0560
          8060FFFFFFFFFFFFFFFFFF93C098C0D1C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF1F2F152AE6496E5A7CBEDD1BEE7C5C3E8C9BCE4C141B64F38823AFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFBFBFB5BA5669DE5A9E8F6EADCF1DFE3F5E558BB5F90AD90FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFDFDFD71A4759ADDA2F3FCF44EB255A5B7A5FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF85AA88319D38C1CAC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4
          E6E48BB78BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
      end
      object BBSalir: TBitBtn
        Left = 636
        Top = 12
        Width = 91
        Height = 29
        Anchors = [akTop, akRight]
        Caption = 'Salir'
        TabOrder = 1
        OnClick = BBSalirClick
        Glyph.Data = {
          E6040000424DE604000000000000360000002800000014000000140000000100
          180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
          F1F1F1CFCFCFCACACACBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB
          CBCBCBCBCBCBCBCACACAD2D2D2F6F6F6FFFFFFFFFFFFFFFFFFD8D8D96466A24A
          4DC4494CC7494CC9494DCB494DCD494CCF484AD14649D34649D4464AD44649D4
          474AD44A4DD34E51C86E6E98E7E7E7FFFFFFF3F3F35556AD2526D60C0BC00808
          C60808CC0808D20403D70000DC0000E20000E80506EA151AED1F27EF2630F12D
          39F33746F84B59FE7173A0F9F9F9CDCDD21313C50000B10000BA0000C00000C5
          0000C91515D55252E56F6FEC6C6CEF5153ED191DE80810E71B25EA232FEC2937
          ED3446F73C47D1D5D5D8C5C5CC0101B40000B30000B90000BE0202C57C7CE4EE
          EEFCFFFFFFFFFFFFFFFFFFFFFFFFE4E4FD7075F1141EE9222EEC2B39ED3446F4
          2B38D6C7C7CCC6C6CC0000AF0000B20000B70707BEB5B5EEFFFFFFFEFEFDA7A7
          E96666E06A6AE4B5B5F1FFFFFFFFFFFF989DF61824EA2937ED3345F42A37D0C9
          C9CEC6C6CC0202AB0606B30000B47878DBFFFFFFEFEFF93D3DD20000CE0000D7
          0000DE0000DF5F62E6FCFCFDFFFFFF666EF11C2AEB3142F42835CBC9C9CDC6C6
          CB0808A81313B52020BDEAEAF9FFFFFF6868D70A0ACD1515D60B0BD90000DD00
          00E30000E27E80EBFFFFFFD1D3FB202DEB2C3CF32531C6C9C9CDC6C6CB0D0DA3
          1A1AB45858CCFFFFFFE2E2F62828CB2B2BD23030D83131DD2A2AE01717E30000
          E41E21E6FAFAFEFAFBFF3640ED2331F1212CC3C9C9CDC6C6CA13139F2525B66D
          6DD0FFFFFFD4D4F33030CB3737D13838D63636DA3A3AE04343E53535E82426E8
          EDEDFDFFFFFF3941EC1C27EF1E26C0C9C9CDC6C6CA17179B3535B85F5FC8FFFF
          FEEEEEFA4949CE3E3ED04E4ED8CBCBF5A8A8F04747E14B4BE76D6DEEFDFDFFF1
          F1FD2227E7151DED181EBDC9C9CDC6C6CA1C1C984646BC4545BCE0E0F1FFFFFF
          A2A2E53D3DCC6C6CDBFFFFFFECECFB5757E14E4EE3C1C1F6FFFFFFC9C9F4080A
          E40A0FEB1114BBC9C9CDC6C6CA2222975454BD4A4ABC8C8CD0FFFFFFFEFEFF9B
          9BE37070D9FFFFFFE7E7FA6767E0BDBDF3FFFFFFFAFAFB8A8AE85757EC0708E8
          0708B8C9C9CDC6C6C92828976161BF5E5EC05959BFB6B6DCFFFFFFE3E3F47C7C
          D8FFFFFFE2E2F89D9DE7FFFFFFFFFFFDA7A7E36F6FE58383EB5252EA0606B2C9
          C9CDC6C6C93131996D6DC16A6AC16B6BC56767C39494CC8383CC8686D8FFFFFF
          EAEAF98383D9BDBDE19F9FDB7A7ADF8484E58686E69090ED2929B1C9C9CDC5C5
          C841419D7979C27575C17777C57979C97575CA7676CD9494D9FFFFFFF0F0FB86
          86DA7F7FD88686DD8E8EE09090E19292E29E9EE94C4CB5C9C9CDCBCBCE6565B1
          8282C28080C38383C68585C98787CC8888CF9393D2E9E9F1D2D2E88F8FD79595
          DB9797DC9999DE9C9CDF9E9EDFA6A6E47878C3CFCFD3F1F1F17979B09B9BCF8A
          8AC38D8DC78F8FC99191CC9494CF9494D09595CE9797D19C9CD79E9ED9A1A1DA
          A3A3DBA5A5DBA7A7DCC9C9F29696B7F7F7F7FFFFFFC6C6CC9999C7BABAE2B9B9
          E1BCBCE3BFBFE6C1C1E8C5C5EAC7C7EDCACAEECDCDEFD0D0F1D2D2F2D4D4F3D7
          D7F4DDDDF7ADADCDD9D9DCFFFFFFFFFFFFFFFFFFDDDDE0B8B8C0B7B7BDB7B7BD
          B7B7BDB8B8BDB8B8BEB9B9BEB9B9BEB9B9BEBABABEBABABEBBBBBFBBBBBFBCBC
          C2EAEAEBFFFFFFFFFFFF}
      end
    end
  end
  object PPanel: TPanel [5]
    Left = 0
    Top = 65
    Width = 765
    Height = 404
    Align = alClient
    Color = clWhite
    TabOrder = 2
    object Panel1: TPanel
      Left = 1
      Top = 179
      Width = 763
      Height = 224
      Align = alBottom
      Color = clWhite
      TabOrder = 0
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 371
        Height = 222
        Align = alLeft
        Color = clWhite
        TabOrder = 0
        object JvExistenciaFinal: TJvRollOut
          Left = 1
          Top = 1
          Width = 368
          Height = 24
          Caption = 'Existencia Final'
          Collapsed = True
          Colors.ButtonBottom = clGreen
          Colors.ButtonTop = clTeal
          Colors.ButtonColor = clMoneyGreen
          Colors.Color = clWhite
          Colors.FrameBottom = clWhite
          Colors.FrameTop = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          FAWidth = 145
          FAHeight = 199
          FCWidth = 22
          FCHeight = 24
          object GBExistenciaFinal: TGroupBox
            Left = 1
            Top = 21
            Width = 366
            Height = 2
            Align = alClient
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            object Shape9: TShape
              Left = 8
              Top = 100
              Width = 356
              Height = 91
            end
            object Shape10: TShape
              Left = 10
              Top = 134
              Width = 354
              Height = 1
            end
            object Shape11: TShape
              Left = 88
              Top = 101
              Width = 1
              Height = 89
            end
            object Shape12: TShape
              Left = 10
              Top = 162
              Width = 354
              Height = 1
            end
            object Shape13: TShape
              Left = 140
              Top = 101
              Width = 1
              Height = 89
            end
            object Shape14: TShape
              Left = 200
              Top = 101
              Width = 1
              Height = 89
            end
            object Shape15: TShape
              Left = 254
              Top = 101
              Width = 1
              Height = 89
            end
            object Shape16: TShape
              Left = 310
              Top = 101
              Width = 1
              Height = 89
            end
            object LTernerosExistenciaFinal: TLabel
              Left = 26
              Top = 107
              Width = 42
              Height = 13
              Caption = 'Terneros'
            end
            object LTernerasExistenciaFinal: TLabel
              Left = 26
              Top = 139
              Width = 42
              Height = 13
              Caption = 'Terneras'
            end
            object LVaquillonasExistenciaFinal: TLabel
              Left = 26
              Top = 167
              Width = 54
              Height = 13
              Caption = 'Vaquillonas'
            end
            object LTorosExistenciaFinal: TLabel
              Left = 209
              Top = 167
              Width = 27
              Height = 13
              Caption = 'Toros'
            end
            object LNovillosExistenciaFinal: TLabel
              Left = 209
              Top = 139
              Width = 37
              Height = 13
              Caption = 'Novillos'
            end
            object LVacasExistenciaFinal: TLabel
              Left = 209
              Top = 107
              Width = 30
              Height = 13
              Caption = 'Vacas'
            end
            object Label12: TLabel
              Left = 319
              Top = 86
              Width = 36
              Height = 13
              Caption = '$/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 261
              Top = 86
              Width = 44
              Height = 13
              Caption = 'Kg/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 154
              Top = 86
              Width = 36
              Height = 13
              Caption = '$/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 89
              Top = 86
              Width = 44
              Height = 13
              Caption = 'Kg/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 24
              Top = 86
              Width = 57
              Height = 13
              Caption = 'Categor'#237'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LReferenciasExistenciaFinal: TLabel
              Left = 11
              Top = 25
              Width = 71
              Height = 13
              Caption = 'Referencias al:'
            end
            object Label19: TLabel
              Left = 11
              Top = 59
              Width = 40
              Height = 13
              Caption = 'Nombre:'
            end
            object EAPesoPromVaquillonasExistenciaFinal: TEditAuto
              Left = 93
              Top = 164
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 0
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTernerasExistenciaFinal: TEditAuto
              Left = 93
              Top = 137
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 1
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTernerosExistenciaFinal: TEditAuto
              Left = 93
              Top = 108
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 2
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTernerosExistenciaFinal: TEditAuto
              Left = 151
              Top = 108
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 3
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTernerasExistenciaFinal: TEditAuto
              Left = 151
              Top = 137
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 4
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromVaquillonasExistenciaFinal: TEditAuto
              Left = 151
              Top = 164
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 5
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromVacasExistenciaFinal: TEditAuto
              Left = 265
              Top = 108
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 6
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromNovillosExistenciaFinal: TEditAuto
              Left = 265
              Top = 137
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 7
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTorosExistenciaFinal: TEditAuto
              Left = 265
              Top = 164
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 8
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTorosExistenciaFinal: TEditAuto
              Left = 317
              Top = 164
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 9
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromNovillosExistenciaFinal: TEditAuto
              Left = 317
              Top = 137
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 10
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromVacasExistenciaFinal: TEditAuto
              Left = 317
              Top = 108
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 11
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAFechaTabPesoPrecioCatExistenciaFinal: TDBLookupComboBoxAuto
              Left = 94
              Top = 23
              Width = 90
              Height = 21
              Color = clWhite
              DropDownRows = 20
              KeyField = 'FECHA'
              ListField = 'FECHA'
              ListSource = DSQFechaTabPesoPrecioCatExistenciaFinal
              TabOrder = 12
              OnCloseUp = DBLCBAFechaTabPesoPrecioCatExistenciaFinalCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DTPAFechaReferenciaExistenciaFinal: TDateTimePickerAuto
              Left = 128
              Top = 25
              Width = 105
              Height = 21
              Date = 39333.689785150460000000
              Time = 39333.689785150460000000
              Color = clWhite
              TabOrder = 13
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object BBNuevaExistenciaFinal: TBitBtn
              Left = 303
              Top = 8
              Width = 61
              Height = 22
              Caption = 'Nueva'
              TabOrder = 14
              OnClick = BBNuevaExistenciaFinalClick
            end
            object BBModificarExistenciaFinal: TBitBtn
              Left = 303
              Top = 33
              Width = 61
              Height = 23
              Caption = 'Modificar'
              TabOrder = 15
              OnClick = BBModificarExistenciaFinalClick
            end
            object BBEliminarExistenciaFinal: TBitBtn
              Left = 303
              Top = 59
              Width = 61
              Height = 23
              Caption = 'Eliminar'
              TabOrder = 16
              OnClick = BBEliminarExistenciaFinalClick
            end
            object EANombreExistenciaFinal: TEditAuto
              Left = 94
              Top = 55
              Width = 187
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 50
              TabOrder = 17
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBANombreReferenciaExistenciaFinal: TDBLookupComboBoxAuto
              Left = 94
              Top = 55
              Width = 174
              Height = 21
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_TAB_REF_CAT'
              ListField = 'NOMBRE'
              ListSource = DSNombreReferenciaExistenciaFinal
              TabOrder = 18
              OnCloseUp = DBLCBANombreReferenciaExistenciaFinalCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
        end
      end
      object Panel6: TPanel
        Left = 372
        Top = 1
        Width = 390
        Height = 222
        Align = alClient
        Color = clWhite
        TabOrder = 1
        object JvExistenciaInicial: TJvRollOut
          Left = 1
          Top = 1
          Width = 388
          Height = 24
          Caption = 'Existencia Inicial'
          Collapsed = True
          Colors.ButtonBottom = clGreen
          Colors.ButtonTop = clTeal
          Colors.ButtonColor = clMoneyGreen
          Colors.Color = clWhite
          Colors.FrameBottom = clWhite
          Colors.FrameTop = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          FAWidth = 145
          FAHeight = 199
          FCWidth = 22
          FCHeight = 24
          object GBExistenciaInicial: TGroupBox
            Left = 1
            Top = 21
            Width = 386
            Height = 2
            Align = alClient
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            object Shape17: TShape
              Left = 8
              Top = 100
              Width = 356
              Height = 91
            end
            object Shape18: TShape
              Left = 10
              Top = 134
              Width = 354
              Height = 1
            end
            object Shape19: TShape
              Left = 88
              Top = 101
              Width = 1
              Height = 89
            end
            object Shape22: TShape
              Left = 10
              Top = 162
              Width = 354
              Height = 1
            end
            object Shape23: TShape
              Left = 140
              Top = 101
              Width = 1
              Height = 89
            end
            object Shape24: TShape
              Left = 200
              Top = 101
              Width = 1
              Height = 89
            end
            object Shape25: TShape
              Left = 254
              Top = 101
              Width = 1
              Height = 89
            end
            object Shape26: TShape
              Left = 310
              Top = 101
              Width = 1
              Height = 89
            end
            object LTernerosExistenciaInicial: TLabel
              Left = 26
              Top = 107
              Width = 42
              Height = 13
              Caption = 'Terneros'
            end
            object LTernerasExistenciaInicial: TLabel
              Left = 26
              Top = 139
              Width = 42
              Height = 13
              Caption = 'Terneras'
            end
            object LVaquillonasExistenciaInicial: TLabel
              Left = 26
              Top = 167
              Width = 54
              Height = 13
              Caption = 'Vaquillonas'
            end
            object LTorosExistenciaInicial: TLabel
              Left = 209
              Top = 167
              Width = 27
              Height = 13
              Caption = 'Toros'
            end
            object LNovillosExistenciaInicial: TLabel
              Left = 209
              Top = 139
              Width = 37
              Height = 13
              Caption = 'Novillos'
            end
            object LVacasExistenciaInicial: TLabel
              Left = 209
              Top = 107
              Width = 30
              Height = 13
              Caption = 'Vacas'
            end
            object Label18: TLabel
              Left = 318
              Top = 86
              Width = 36
              Height = 13
              Caption = '$/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 258
              Top = 86
              Width = 44
              Height = 13
              Caption = 'Kg/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 152
              Top = 86
              Width = 36
              Height = 13
              Caption = '$/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 89
              Top = 86
              Width = 44
              Height = 13
              Caption = 'Kg/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 24
              Top = 86
              Width = 57
              Height = 13
              Caption = 'Categor'#237'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LReferenciasExistenciaInicial: TLabel
              Left = 11
              Top = 25
              Width = 71
              Height = 13
              Caption = 'Referencias al:'
            end
            object Label25: TLabel
              Left = 11
              Top = 59
              Width = 40
              Height = 13
              Caption = 'Nombre:'
            end
            object EAPesoPromVaquillonasExistenciaInicial: TEditAuto
              Left = 93
              Top = 164
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 0
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTernerasExistenciaInicial: TEditAuto
              Left = 93
              Top = 137
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 1
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTernerosExistenciaInicial: TEditAuto
              Left = 93
              Top = 108
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 2
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTernerosExistenciaInicial: TEditAuto
              Left = 151
              Top = 108
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 3
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTernerasExistenciaInicial: TEditAuto
              Left = 151
              Top = 137
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 4
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromVaquillonasExistenciaInicial: TEditAuto
              Left = 151
              Top = 164
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 5
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromVacasExistenciaInicial: TEditAuto
              Left = 265
              Top = 108
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 6
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromNovillosExistenciaInicial: TEditAuto
              Left = 265
              Top = 137
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 7
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTorosExistenciaInicial: TEditAuto
              Left = 265
              Top = 164
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 8
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTorosExistenciaInicial: TEditAuto
              Left = 317
              Top = 164
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 9
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromNovillosExistenciaInicial: TEditAuto
              Left = 317
              Top = 137
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 10
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromVacasExistenciaInicial: TEditAuto
              Left = 317
              Top = 108
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 11
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAFechaTabPesoPrecioCatExistenciaInicial: TDBLookupComboBoxAuto
              Left = 94
              Top = 23
              Width = 90
              Height = 21
              Color = clWhite
              DropDownRows = 20
              KeyField = 'FECHA'
              ListField = 'FECHA'
              ListSource = DSQFechaTabPesoPrecioCatExistenciaInicial
              TabOrder = 12
              OnCloseUp = DBLCBAFechaTabPesoPrecioCatExistenciaInicialCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DTPAFechaReferenciaExistenciaInicial: TDateTimePickerAuto
              Left = 128
              Top = 25
              Width = 105
              Height = 21
              Date = 39333.689785150460000000
              Time = 39333.689785150460000000
              Color = clWhite
              TabOrder = 13
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object BBNuevaExistenciaInicial: TBitBtn
              Left = 303
              Top = 8
              Width = 61
              Height = 22
              Caption = 'Nueva'
              TabOrder = 14
              OnClick = BBNuevaExistenciaInicialClick
            end
            object BBModificarExistenciaInicial: TBitBtn
              Left = 303
              Top = 33
              Width = 61
              Height = 23
              Caption = 'Modificar'
              TabOrder = 15
              OnClick = BBModificarExistenciaInicialClick
            end
            object BBEliminarExistenciaInicial: TBitBtn
              Left = 303
              Top = 59
              Width = 61
              Height = 23
              Caption = 'Eliminar'
              TabOrder = 16
              OnClick = BBEliminarExistenciaInicialClick
            end
            object EANombreExistenciaInicial: TEditAuto
              Left = 94
              Top = 55
              Width = 187
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 50
              TabOrder = 17
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBANombreReferenciaExistenciaInicial: TDBLookupComboBoxAuto
              Left = 94
              Top = 55
              Width = 174
              Height = 21
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_TAB_REF_CAT'
              ListField = 'NOMBRE'
              ListSource = DSNombreReferenciaExistenciaInicial
              TabOrder = 18
              OnCloseUp = DBLCBANombreReferenciaExistenciaInicialCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 763
      Height = 178
      Align = alClient
      Color = clWhite
      TabOrder = 1
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 371
        Height = 176
        Align = alLeft
        Color = clWhite
        TabOrder = 0
        object JvSalidas: TJvRollOut
          Left = 1
          Top = 1
          Width = 368
          Height = 24
          Caption = 'Salidas'
          Collapsed = True
          Colors.ButtonBottom = clGreen
          Colors.ButtonTop = clTeal
          Colors.ButtonColor = clMoneyGreen
          Colors.Color = clWhite
          Colors.FrameBottom = clWhite
          Colors.FrameTop = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          FAWidth = 145
          FAHeight = 209
          FCWidth = 22
          FCHeight = 24
          object GBSalidas: TGroupBox
            Left = 1
            Top = 21
            Width = 366
            Height = 2
            Align = alClient
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            object Shape20: TShape
              Left = 8
              Top = 107
              Width = 356
              Height = 87
            end
            object Shape21: TShape
              Left = 10
              Top = 134
              Width = 354
              Height = 1
            end
            object Shape39: TShape
              Left = 88
              Top = 108
              Width = 1
              Height = 85
            end
            object Shape38: TShape
              Left = 10
              Top = 162
              Width = 354
              Height = 1
            end
            object Shape40: TShape
              Left = 140
              Top = 108
              Width = 1
              Height = 85
            end
            object Shape41: TShape
              Left = 200
              Top = 108
              Width = 1
              Height = 85
            end
            object Shape42: TShape
              Left = 254
              Top = 108
              Width = 1
              Height = 85
            end
            object Shape43: TShape
              Left = 310
              Top = 108
              Width = 1
              Height = 85
            end
            object LTernerosSalidas: TLabel
              Left = 26
              Top = 108
              Width = 42
              Height = 13
              Caption = 'Terneros'
            end
            object LTernerasSalidas: TLabel
              Left = 26
              Top = 137
              Width = 42
              Height = 13
              Caption = 'Terneras'
            end
            object LVaquillonasSalidas: TLabel
              Left = 26
              Top = 170
              Width = 54
              Height = 13
              Caption = 'Vaquillonas'
            end
            object LTorosSalidas: TLabel
              Left = 209
              Top = 170
              Width = 27
              Height = 13
              Caption = 'Toros'
            end
            object LNovillosSalidas: TLabel
              Left = 209
              Top = 137
              Width = 37
              Height = 13
              Caption = 'Novillos'
            end
            object LVacasSalidas: TLabel
              Left = 209
              Top = 108
              Width = 30
              Height = 13
              Caption = 'Vacas'
            end
            object Label56: TLabel
              Left = 317
              Top = 90
              Width = 36
              Height = 13
              Caption = '$/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label55: TLabel
              Left = 261
              Top = 90
              Width = 44
              Height = 13
              Caption = 'Kg/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label54: TLabel
              Left = 154
              Top = 90
              Width = 36
              Height = 13
              Caption = '$/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label53: TLabel
              Left = 94
              Top = 90
              Width = 44
              Height = 13
              Caption = 'Kg/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label46: TLabel
              Left = 24
              Top = 90
              Width = 57
              Height = 13
              Caption = 'Categor'#237'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LReferenciasSalidas: TLabel
              Left = 11
              Top = 25
              Width = 71
              Height = 13
              Caption = 'Referencias al:'
            end
            object Label37: TLabel
              Left = 11
              Top = 59
              Width = 40
              Height = 13
              Caption = 'Nombre:'
            end
            object EAPesoPromVaquillonasSalidas: TEditAuto
              Left = 93
              Top = 167
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 4
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTernerasSalidas: TEditAuto
              Left = 93
              Top = 137
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 5
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTernerosSalidas: TEditAuto
              Left = 93
              Top = 110
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 6
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTernerosSalidas: TEditAuto
              Left = 151
              Top = 110
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 7
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTernerasSalidas: TEditAuto
              Left = 151
              Top = 137
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 8
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromVaquillonasSalidas: TEditAuto
              Left = 151
              Top = 167
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 9
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromVacasSalidas: TEditAuto
              Left = 265
              Top = 110
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 10
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromNovillosSalidas: TEditAuto
              Left = 265
              Top = 137
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 11
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTorosSalidas: TEditAuto
              Left = 265
              Top = 167
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 12
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTorosSalidas: TEditAuto
              Left = 317
              Top = 167
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 13
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromNovillosSalidas: TEditAuto
              Left = 317
              Top = 137
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 14
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromVacasSalidas: TEditAuto
              Left = 317
              Top = 110
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 15
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAFechaTabPesoPrecioCatSalidas: TDBLookupComboBoxAuto
              Left = 94
              Top = 23
              Width = 90
              Height = 21
              Color = clWhite
              DropDownRows = 20
              KeyField = 'FECHA'
              ListField = 'FECHA'
              ListSource = DSQFechaTabPesoPrecioCatSalidas
              TabOrder = 0
              OnCloseUp = DBLCBAFechaTabPesoPrecioCatSalidasCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DTPAFechaReferenciaSalidas: TDateTimePickerAuto
              Left = 128
              Top = 25
              Width = 105
              Height = 21
              Date = 39333.689785150460000000
              Time = 39333.689785150460000000
              Color = clWhite
              TabOrder = 1
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object BBNuevaSalidas: TBitBtn
              Left = 303
              Top = 8
              Width = 61
              Height = 22
              Caption = 'Nueva'
              TabOrder = 16
              OnClick = BBNuevaSalidasClick
            end
            object BBModificarSalidas: TBitBtn
              Left = 303
              Top = 33
              Width = 61
              Height = 23
              Caption = 'Modificar'
              TabOrder = 17
              OnClick = BBModificarSalidasClick
            end
            object BBEliminarSalidas: TBitBtn
              Left = 303
              Top = 59
              Width = 61
              Height = 23
              Caption = 'Eliminar'
              TabOrder = 18
              OnClick = BBEliminarSalidasClick
            end
            object EANombreSalidas: TEditAuto
              Left = 94
              Top = 55
              Width = 187
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 50
              TabOrder = 3
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBANombreReferenciaSalidas: TDBLookupComboBoxAuto
              Left = 94
              Top = 55
              Width = 174
              Height = 21
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_TAB_REF_CAT'
              ListField = 'NOMBRE'
              ListSource = DSNombreReferenciaSalidas
              TabOrder = 2
              OnCloseUp = DBLCBANombreReferenciaSalidasCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
        end
      end
      object Panel4: TPanel
        Left = 372
        Top = 1
        Width = 390
        Height = 176
        Align = alClient
        Color = clWhite
        TabOrder = 1
        object JvEntradas: TJvRollOut
          Left = 1
          Top = 1
          Width = 388
          Height = 24
          Caption = 'Entradas'
          Collapsed = True
          Colors.ButtonBottom = clGreen
          Colors.ButtonTop = clTeal
          Colors.ButtonColor = clMoneyGreen
          Colors.Color = clWhite
          Colors.FrameBottom = clWhite
          Colors.FrameTop = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          FAWidth = 145
          FAHeight = 209
          FCWidth = 22
          FCHeight = 24
          object GBEntradas: TGroupBox
            Left = 1
            Top = 21
            Width = 386
            Height = 2
            Align = alClient
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            object Shape1: TShape
              Left = 8
              Top = 107
              Width = 356
              Height = 87
            end
            object Shape2: TShape
              Left = 10
              Top = 134
              Width = 354
              Height = 1
            end
            object Shape3: TShape
              Left = 88
              Top = 108
              Width = 1
              Height = 85
            end
            object Shape4: TShape
              Left = 10
              Top = 162
              Width = 354
              Height = 1
            end
            object Shape5: TShape
              Left = 140
              Top = 108
              Width = 1
              Height = 85
            end
            object Shape6: TShape
              Left = 200
              Top = 108
              Width = 1
              Height = 85
            end
            object Shape7: TShape
              Left = 254
              Top = 108
              Width = 1
              Height = 85
            end
            object Shape8: TShape
              Left = 310
              Top = 108
              Width = 1
              Height = 85
            end
            object LTernerosEntradas: TLabel
              Left = 26
              Top = 108
              Width = 42
              Height = 13
              Caption = 'Terneros'
            end
            object LTernerasEntradas: TLabel
              Left = 26
              Top = 137
              Width = 42
              Height = 13
              Caption = 'Terneras'
            end
            object LVaquillonasEntradas: TLabel
              Left = 26
              Top = 170
              Width = 54
              Height = 13
              Caption = 'Vaquillonas'
            end
            object LTorosEntradas: TLabel
              Left = 209
              Top = 170
              Width = 27
              Height = 13
              Caption = 'Toros'
            end
            object LNovillosEntradas: TLabel
              Left = 209
              Top = 137
              Width = 37
              Height = 13
              Caption = 'Novillos'
            end
            object LVacasEntradas: TLabel
              Left = 209
              Top = 108
              Width = 30
              Height = 13
              Caption = 'Vacas'
            end
            object Label7: TLabel
              Left = 318
              Top = 90
              Width = 36
              Height = 13
              Caption = '$/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 261
              Top = 90
              Width = 44
              Height = 13
              Caption = 'Kg/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 153
              Top = 90
              Width = 36
              Height = 13
              Caption = '$/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 93
              Top = 90
              Width = 44
              Height = 13
              Caption = 'Kg/Cab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 24
              Top = 90
              Width = 57
              Height = 13
              Caption = 'Categor'#237'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LReferenciasEntradas: TLabel
              Left = 11
              Top = 25
              Width = 71
              Height = 13
              Caption = 'Referencias al:'
            end
            object Label13: TLabel
              Left = 11
              Top = 59
              Width = 40
              Height = 13
              Caption = 'Nombre:'
            end
            object EAPesoPromVaquillonasEntradas: TEditAuto
              Left = 93
              Top = 167
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 0
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTernerasEntradas: TEditAuto
              Left = 93
              Top = 137
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 1
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTernerosEntradas: TEditAuto
              Left = 93
              Top = 110
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 2
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTernerosEntradas: TEditAuto
              Left = 151
              Top = 110
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 3
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTernerasEntradas: TEditAuto
              Left = 151
              Top = 137
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 4
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromVaquillonasEntradas: TEditAuto
              Left = 151
              Top = 167
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 5
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromVacasEntradas: TEditAuto
              Left = 265
              Top = 110
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 6
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromNovillosEntradas: TEditAuto
              Left = 265
              Top = 137
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 7
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPesoPromTorosEntradas: TEditAuto
              Left = 265
              Top = 167
              Width = 40
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 8
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromTorosEntradas: TEditAuto
              Left = 317
              Top = 167
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 9
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromNovillosEntradas: TEditAuto
              Left = 317
              Top = 137
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 10
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object EAPrecioPromVacasEntradas: TEditAuto
              Left = 317
              Top = 110
              Width = 39
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              TabOrder = 11
              Text = 'EDITAUTO1'
              OnExit = EAPesoPromExit
              OnKeyPress = EAPesoPromKeyPress
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBAFechaTabPesoPrecioCatEntradas: TDBLookupComboBoxAuto
              Left = 94
              Top = 23
              Width = 90
              Height = 21
              Color = clWhite
              DropDownRows = 20
              KeyField = 'FECHA'
              ListField = 'FECHA'
              ListSource = DSQFechaTabPesoPrecioCatEntradas
              TabOrder = 12
              OnCloseUp = DBLCBAFechaTabPesoPrecioCatEntradasCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DTPAFechaReferenciaEntradas: TDateTimePickerAuto
              Left = 128
              Top = 25
              Width = 105
              Height = 21
              Date = 39333.689785150460000000
              Time = 39333.689785150460000000
              Color = clWhite
              TabOrder = 13
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object BBNuevaEntradas: TBitBtn
              Left = 303
              Top = 8
              Width = 61
              Height = 22
              Caption = 'Nueva'
              TabOrder = 14
              OnClick = BBNuevaEntradasClick
            end
            object BBModificarEntradas: TBitBtn
              Left = 303
              Top = 33
              Width = 61
              Height = 23
              Caption = 'Modificar'
              TabOrder = 15
              OnClick = BBModificarEntradasClick
            end
            object BBEliminarEntradas: TBitBtn
              Left = 303
              Top = 59
              Width = 61
              Height = 23
              Caption = 'Eliminar'
              TabOrder = 16
              OnClick = BBEliminarEntradasClick
            end
            object EANombreEntradas: TEditAuto
              Left = 94
              Top = 55
              Width = 187
              Height = 21
              CharCase = ecUpperCase
              Color = clWhite
              MaxLength = 50
              TabOrder = 17
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
            object DBLCBANombreReferenciaEntradas: TDBLookupComboBoxAuto
              Left = 94
              Top = 55
              Width = 174
              Height = 21
              Color = clWhite
              DropDownRows = 20
              KeyField = 'ID_TAB_REF_CAT'
              ListField = 'NOMBRE'
              ListSource = DSNombreReferenciaEntradas
              TabOrder = 18
              OnCloseUp = DBLCBANombreReferenciaEntradasCloseUp
              EsClave = False
              EsRequerido = False
              ISParam = False
            end
          end
        end
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 765
    Caption = 'Valores Pesos - Precios'
    inherited LTitulo: TLabel
      Width = 361
    end
    inherited PILeft: TPanel
      Left = 557
    end
  end
  inherited Psocalo: TPanel
    Top = 539
    Width = 765
  end
  inherited SDXLS: TSaveDialog
    Left = 606
    Top = 77
  end
  inherited DTXLS: TDataToXLS
    Left = 568
    Top = 97
  end
  inherited WinXP1: TWinXP
    Top = 96
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 460
    Top = 55
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 444
    Top = 87
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 516
    Top = 87
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 644
    Top = 95
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 532
    Top = 63
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 592
    Top = 72
  end
  object IBQUpdateUltimoRefCat: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Execute PROCEDURE SP_UPDATE_ULT_REF_CAT'
      ''
      ' (  :IDTABREFCATSALIDAS,'
      '    :IDTABREFCATENTRADAS,'
      '    :IDTABREFCATEF,'
      '    :IDTABREFCATEI,'
      '    :ESTABLECIMIENTO)')
    Left = 16
    Top = 233
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDTABREFCATSALIDAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTABREFCATENTRADAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTABREFCATEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTABREFCATEI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
  end
  object IBQUpdateDatosTabPesoPrecioCat: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Execute PROCEDURE SP_ABM_REF_PESO_PRECIO'
      ''
      ' ( :FECHA , :NOMBRE ,  :TIPO , :ESTABLECIMIENTO ,'
      '  :PESOTERNERO , :PRECIOTERNERO ,'
      '  :PESONOVILLO , :PRECIONOVILLO ,'
      '  :PESOTORO , :PRECIOTORO ,'
      '  :PESOTERNERA , :PRECIOTERNERA ,'
      '  :PESOVAQUILLONA , :PRECIOVAQUILLONA ,'
      '  :PESOVACA , :PRECIOVACA, :IDTABREFCAT,NULL)')
    Left = 40
    Top = 273
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESOTERNERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIOTERNERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESONOVILLO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIONOVILLO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESOTORO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIOTORO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESOTERNERA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIOTERNERA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESOVAQUILLONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIOVAQUILLONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESOVACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIOVACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTABREFCAT'
        ParamType = ptUnknown
      end>
  end
  object IBQInsertDatosTabPesoPrecioCat: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Execute PROCEDURE SP_ABM_REF_PESO_PRECIO'
      ''
      ' ( :FECHA , :NOMBRE ,  :TIPO , :ESTABLECIMIENTO ,'
      '  :PESOTERNERO , :PRECIOTERNERO ,'
      '  :PESONOVILLO , :PRECIONOVILLO ,'
      '  :PESOTORO , :PRECIOTORO ,'
      '  :PESOTERNERA , :PRECIOTERNERA ,'
      '  :PESOVAQUILLONA , :PRECIOVAQUILLONA ,'
      '  :PESOVACA , :PRECIOVACA, NULL, NULL)')
    Left = 72
    Top = 274
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESOTERNERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIOTERNERO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESONOVILLO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIONOVILLO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESOTORO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIOTORO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESOTERNERA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIOTERNERA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESOVAQUILLONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIOVAQUILLONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PESOVACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRECIOVACA'
        ParamType = ptUnknown
      end>
  end
  object IBQDatosTabPesoPrecioCatSalidas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select tpp.* from tab_ref_cat tc, tab_ref_peso_precio tpp'
      
        'where tpp.id_tab_ref_cat = :id_tab_ref_cat  and tc.id_tab_ref_ca' +
        't = tpp.id_tab_ref_cat'
      'order by categoria asc')
    Left = 78
    Top = 170
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_tab_ref_cat'
        ParamType = ptUnknown
      end>
  end
  object DSDatosTabPesoPrecioCatSalidas: TDataSource
    DataSet = IBQDatosTabPesoPrecioCatSalidas
    Left = 46
    Top = 170
  end
  object DSQFechaTabPesoPrecioCatSalidas: TDataSource
    DataSet = IBQFechaTabPesoPrecioCatSalidas
    Left = 128
    Top = 172
  end
  object IBQFechaTabPesoPrecioCatSalidas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select distinct fecha from tab_ref_cat'
      'where establecimiento = :esta and tipo = :tipo'
      'order by fecha desc')
    Left = 160
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSNombreReferenciaSalidas: TDataSource
    DataSet = IBQNombreReferenciaSalidas
    Left = 224
    Top = 172
  end
  object IBQNombreReferenciaSalidas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_ref_cat'
      
        'where establecimiento = :esta and tipo = :tipo and fecha = :fech' +
        'a'
      'order by nombre asc')
    Left = 256
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  object IBQDeleteDatosTabPesoPrecioCat: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Execute PROCEDURE SP_ABM_REF_PESO_PRECIO'
      ''
      ' ( NULL , NULL ,  NULL, :ESTABLECIMIENTO ,'
      '  NULL, NULL ,'
      '  NULL ,NULL ,'
      '  NULL , NULL ,'
      '  NULL , NULL ,'
      '  NULL , NULL ,'
      ' NULL , NULL,:IDTABREFCAT, :IDTABREFPESOPRECIOPARAM)')
    Left = 8
    Top = 273
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTABREFCAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTABREFPESOPRECIOPARAM'
        ParamType = ptUnknown
      end>
  end
  object DSDatosTabPesoPrecioCatEntradas: TDataSource
    DataSet = IBQDatosTabPesoPrecioCatEntradas
    Left = 406
    Top = 162
  end
  object IBQDatosTabPesoPrecioCatEntradas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select tpp.* from tab_ref_cat tc, tab_ref_peso_precio tpp'
      
        'where tpp.id_tab_ref_cat = :id_tab_ref_cat  and tc.id_tab_ref_ca' +
        't = tpp.id_tab_ref_cat'
      'order by categoria asc')
    Left = 438
    Top = 162
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_tab_ref_cat'
        ParamType = ptUnknown
      end>
  end
  object DSQFechaTabPesoPrecioCatEntradas: TDataSource
    DataSet = IBQFechaTabPesoPrecioCatEntradas
    Left = 488
    Top = 164
  end
  object IBQFechaTabPesoPrecioCatEntradas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select distinct fecha from tab_ref_cat'
      'where establecimiento = :esta and tipo = :tipo'
      'order by fecha desc')
    Left = 528
    Top = 164
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSNombreReferenciaEntradas: TDataSource
    DataSet = IBQNombreReferenciaEntradas
    Left = 560
    Top = 164
  end
  object IBQNombreReferenciaEntradas: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_ref_cat'
      
        'where establecimiento = :esta and tipo = :tipo and fecha = :fech' +
        'a'
      'order by nombre asc')
    Left = 592
    Top = 164
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  object DSDatosTabPesoPrecioCatExistenciaFinal: TDataSource
    DataSet = IBQDatosTabPesoPrecioCatExistenciaFinal
    Left = 46
    Top = 370
  end
  object IBQDatosTabPesoPrecioCatExistenciaFinal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select tpp.* from tab_ref_cat tc, tab_ref_peso_precio tpp'
      
        'where tpp.id_tab_ref_cat = :id_tab_ref_cat  and tc.id_tab_ref_ca' +
        't = tpp.id_tab_ref_cat'
      'order by categoria asc')
    Left = 78
    Top = 370
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_tab_ref_cat'
        ParamType = ptUnknown
      end>
  end
  object DSQFechaTabPesoPrecioCatExistenciaFinal: TDataSource
    DataSet = IBQFechaTabPesoPrecioCatExistenciaFinal
    Left = 128
    Top = 372
  end
  object IBQFechaTabPesoPrecioCatExistenciaFinal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select distinct fecha from tab_ref_cat'
      'where establecimiento = :esta and tipo = :tipo'
      'order by fecha desc')
    Left = 168
    Top = 372
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSNombreReferenciaExistenciaFinal: TDataSource
    DataSet = IBQNombreReferenciaExistenciaFinal
    Left = 200
    Top = 372
  end
  object IBQNombreReferenciaExistenciaFinal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_ref_cat'
      
        'where establecimiento = :esta and tipo = :tipo and fecha = :fech' +
        'a'
      'order by nombre asc')
    Left = 232
    Top = 372
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  object DSDatosTabPesoPrecioCatExistenciaInicial: TDataSource
    DataSet = IBQDatosTabPesoPrecioCatExistenciaInicial
    Left = 454
    Top = 354
  end
  object IBQDatosTabPesoPrecioCatExistenciaInicial: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select tpp.* from tab_ref_cat tc, tab_ref_peso_precio tpp'
      
        'where tpp.id_tab_ref_cat = :id_tab_ref_cat  and tc.id_tab_ref_ca' +
        't = tpp.id_tab_ref_cat'
      'order by categoria asc')
    Left = 486
    Top = 354
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_tab_ref_cat'
        ParamType = ptUnknown
      end>
  end
  object DSQFechaTabPesoPrecioCatExistenciaInicial: TDataSource
    DataSet = IBQFechaTabPesoPrecioCatExistenciaInicial
    Left = 536
    Top = 356
  end
  object IBQFechaTabPesoPrecioCatExistenciaInicial: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select distinct fecha from tab_ref_cat'
      'where establecimiento = :esta and tipo = :tipo'
      'order by fecha desc')
    Left = 576
    Top = 356
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end>
  end
  object DSNombreReferenciaExistenciaInicial: TDataSource
    DataSet = IBQNombreReferenciaExistenciaInicial
    Left = 608
    Top = 356
  end
  object IBQNombreReferenciaExistenciaInicial: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_ref_cat'
      
        'where establecimiento = :esta and tipo = :tipo and fecha = :fech' +
        'a'
      'order by nombre asc')
    Left = 640
    Top = 356
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  object IBQTABREFCAT: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tab_ref_cat'
      'where establecimiento = :establecimiento and ultimo = 1'
      'order by nombre asc')
    Left = 64
    Top = 233
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptUnknown
      end>
  end
end
