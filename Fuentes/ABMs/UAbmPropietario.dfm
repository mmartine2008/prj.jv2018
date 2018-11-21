inherited FABMPropietario: TFABMPropietario
  Left = 109
  Top = 44
  Caption = 'Huella - Establecimientos'
  ClientHeight = 653
  ClientWidth = 879
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 879
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
    Width = 495
  end
  inherited PBotones: TPanel
    Top = 554
    Width = 879
    inherited IFondo: TImage
      Width = 879
    end
    inherited BBGuardar: TBitBtn
      Left = 706
    end
    inherited BBCancelar: TBitBtn
      Left = 745
    end
    inherited BBSalir: TBitBtn
      Left = 793
    end
    inherited BBElegir: TBitBtn
      Left = 628
    end
  end
  inherited PEditar: TPanel
    Top = 213
    Width = 879
    Height = 341
    object Label5: TLabel
      Left = 12
      Top = 32
      Width = 54
      Height = 16
      Caption = 'Nombre:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 12
      Top = 67
      Width = 59
      Height = 16
      Caption = 'Empresa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 12
      Top = 101
      Width = 64
      Height = 16
      Caption = 'Direcci'#243'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 316
      Top = 32
      Width = 60
      Height = 16
      Caption = 'Tel'#233'fono:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 316
      Top = 98
      Width = 43
      Height = 16
      Caption = 'e-Mail:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 316
      Top = 132
      Width = 82
      Height = 16
      Caption = 'P'#225'gina Web:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 316
      Top = 65
      Width = 50
      Height = 16
      Caption = 'Celular:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object APPreview: TAdvPicture
      Left = 511
      Top = -45
      Width = 155
      Height = 103
      Animate = False
      Picture.Stretch = False
      Picture.Frame = 0
      PicturePosition = bpCenter
      StretchMode = smShrink
      Version = '1.3.0.0'
    end
    object Label2: TLabel
      Left = 12
      Top = 136
      Width = 52
      Height = 16
      Caption = 'Im'#225'gen:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image1: TImage
      Left = 151
      Top = 123
      Width = 140
      Height = 140
    end
    object DBEditAuto1: TDBEditAuto
      Left = 80
      Top = 26
      Width = 225
      Height = 24
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'NOMBRE'
      DataSource = DSAbmSimple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEditAuto2: TDBEditAuto
      Left = 80
      Top = 60
      Width = 225
      Height = 24
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'EMPRESA'
      DataSource = DSAbmSimple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBEditAuto3: TDBEditAuto
      Left = 80
      Top = 95
      Width = 225
      Height = 24
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'DIRECCION'
      DataSource = DSAbmSimple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBEditAuto4: TDBEditAuto
      Left = 402
      Top = 26
      Width = 131
      Height = 24
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'TELEFONO'
      DataSource = DSAbmSimple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBEditAuto5: TDBEditAuto
      Left = 402
      Top = 92
      Width = 219
      Height = 24
      CharCase = ecLowerCase
      Color = 14679807
      DataField = 'EMAIL'
      DataSource = DSAbmSimple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEditAuto6: TDBEditAuto
      Left = 402
      Top = 126
      Width = 219
      Height = 24
      CharCase = ecLowerCase
      Color = clWhite
      DataField = 'URL'
      DataSource = DSAbmSimple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object DBEditAuto7: TDBEditAuto
      Left = 402
      Top = 58
      Width = 131
      Height = 24
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'CELULAR'
      DataSource = DSAbmSimple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object BBAgregarImagen: TBitBtn
      Left = 80
      Top = 123
      Width = 42
      Height = 32
      TabOrder = 7
      OnClick = BBAgregarImagenClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCECC
        9CA69CA0A9A0A0A9A09CA69CCFD1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF44955300AC3A00B14200B24200AE3B3D944BFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF4BA66332D37F2FDA862FDB8632D58141A556FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5BB5786EFABC68F4B668F4
        B66EFABC52B169FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3DB76C
        00F58400EE8100EE8000F48433B15AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF3DB46A00EF7E00E87A00E77900EE7D33AF58FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF3EB26700E87300E16F00E16F00E87234AC56FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40AD650BE4710CDC6D0DDC
        6E0DE47236A855FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF8F8F8ADB7AE5C846363886A63896B638A6B638A6C638A6C67886C20A94D
        2EE27D2DDC792BDB782BE17B1FA54566886B638A6C638A6C638A6B638A6A6389
        6A5E86649BAA9CDADCDADEE0DE48965300AA3900AB3D00B14300B64700B84900
        B94A00B64708C25237D97735D87633D87533D9750CBE5300B64700B94B00B84A
        00B64800B24400AC3F00AA3B27933A98AE99DDDFDD4C985829C36328C36527C8
        6A26CC6E26CE7026CF7223CE702CD06D41D5763ED5753CD5743CD4722DCF6F21
        CD6F21CE6E21CD6D20CA6920C66420C05F1EBE592A943B98AD98DDDFDD55995A
        76D88372D28370D3846FD5866DD6886CD88969D88A4FD37949D27547D27446D2
        7442D17057D57E60D6825DD47E5BD17959CF7558CC6F57C96B51C9622E933598
        AD98DCDEDC51965664CF7060CA715ECC735CCE745ACF7558D07757D17757D279
        52D07650D0754FD0744DCF724BCF7049CD6C47CB6845C86443C55F41C25940BF
        533FC04E2F923698AC98EAEBEA609A6365C66C6AC47468C57467C67666C77764
        C87865CD795ACC745ACF765ACF7658CE7556CD735BCB745CCB735BC56F5AC36C
        59C26958C06658BE6351BE593A923FA7B7A7FFFFFFE6EAE6A8D4ABACD3B0ACD3
        B0ACD3B0ACD3B0ADD6B1B0C4B136954565D47B64CE7961CD7764D37A389546AE
        C4AFADD7B1ACD4B0ACD4B0ACD5B0ACD5AFA8D6ABDEE7DEFBFBFBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D9B576FD47D6DCD7B6BCC
        796DD37C4B9856FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A9752
        78D48076CD7E74CC7C77D27F4A9552FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF4B945181D3837FCD827DCC8081D3834C9352FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF4C93508AD58988CE8886CE858AD4894D9254FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E95529BDD9A98D69896D6
        969BDD9A519357FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D9462
        80CC8281C68380C58282CC845D9464FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFA9BDAD65A9706DAA776DAA7766AA71ADBFB1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object BBEliminarImagen: TBitBtn
      Left = 80
      Top = 158
      Width = 42
      Height = 27
      TabOrder = 8
      OnClick = BBEliminarImagenClick
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
  end
  inherited PNavegar: TPanel
    Left = 96
    Top = 194
    inherited GBBuscar: TGroupBox
      Top = 147
    end
    inherited GBFiltrar: TGroupBox
      Top = 97
    end
    inherited GBCantidad: TGroupBox
      inherited BDBGAbm: TBitDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMPRESA'
            Title.Caption = 'Empresa'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIRECCION'
            Title.Caption = 'Direcci'#243'n'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONO'
            Title.Caption = 'Tel'#233'fono'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_ESTABLECIMIENTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CELULAR'
            Title.Caption = 'Celular'
            Width = 100
            Visible = True
          end>
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 879
    Caption = 'Propietario Huella'
    inherited LTitulo: TLabel
      Width = 475
    end
    inherited PILeft: TPanel
      Left = 671
    end
  end
  inherited Psocalo: TPanel
    Top = 631
    Width = 879
    inherited JvSocalo: TJvImage
      Width = 879
    end
  end
  inherited ALUniversal: TActionList
    Left = 216
    Top = 48
  end
  inherited IlAbmSimple: TImageList
    Top = 48
  end
  inherited PMGrilla: TPopupMenu
    Top = 48
  end
  inherited IBQAbmSimple: TIBQuery
    AfterInsert = IBQAbmSimpleAfterInsert
    SQL.Strings = (
      'select * from TAB_PROPIETARIO')
    GeneratorField.Field = 'ID_PROPIETARIO'
    GeneratorField.Generator = 'GEN_ID_TABPROPIETARIO'
    Left = 64
    Top = 48
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      ' *'
      'from TAB_PROPIETARIO '
      'where'
      '  ID_PROPIETARIO = :ID_PROPIETARIO')
    ModifySQL.Strings = (
      'update TAB_PROPIETARIO'
      'set'
      '  ID_PROPIETARIO = :ID_PROPIETARIO,'
      '  DIRECCION = :DIRECCION,'
      '  EMAIL = :EMAIL,'
      '  NOMBRE = :NOMBRE,'
      '  EMPRESA = :EMPRESA,'
      '  CELULAR = :CELULAR,'
      '  TELEFONO = :TELEFONO,'
      '  URL = :URL'
      'where'
      '  ID_PROPIETARIO = :OLD_ID_PROPIETARIO')
    InsertSQL.Strings = (
      'insert into TAB_PROPIETARIO'
      '  (ID_PROPIETARIO, DIRECCION, NOMBRE, EMPRESA, TELEFONO, '
      'CELULAR, EMAIL,'
      '   URL)'
      'values'
      '  (:ID_PROPIETARIO, :DIRECCION, :NOMBRE, :EMPRESA, :TELEFONO, '
      ':CELULAR, :EMAIL,'
      '   :URL)')
    DeleteSQL.Strings = (
      'delete from TAB_PROPIETARIO'
      'where'
      '  ID_PROPIETARIO = :OLD_ID_PROPIETARIO')
    Top = 48
  end
  object IBSPEliminarEstablecimiento: TIBStoredProc
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    StoredProcName = 'GEN_ELIMINAR_ESTABLECIMIENTO2'
    Left = 136
    Top = 312
  end
  object ODFotos: TOpenDialog
    DefaultExt = '*.jpg'
    Filter = 'Archivos JPG(*.jpg)|*.jpg'
    Left = 580
    Top = 8
  end
end
