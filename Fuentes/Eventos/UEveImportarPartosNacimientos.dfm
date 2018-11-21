inherited FEveImportarPartosNacimientos: TFEveImportarPartosNacimientos
  Left = 213
  Top = 99
  Caption = 'FEveImportarPartosNacimientos'
  ClientWidth = 1028
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 1028
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
    Width = 644
  end
  inherited PError: TPageControl
    Width = 1028
    inherited TSHError: TTabSheet
      inherited MAErrors: TMemoAuto
        Width = 1020
      end
    end
  end
  inherited PDatos: TPanel
    Width = 1028
    inherited PCBasico: TPageControl
      Width = 1028
      inherited TSManga: TTabSheet
        inherited Image5: TImage
          Width = 1020
        end
        inherited MSimple: TMangazo
          Width = 1020
          inherited GBFiltro: TGroupBox
            Width = 1020
          end
          inherited PSeleccion: TPanel
            Width = 1020
            inherited GBDisponibles: TGroupBox
              Height = 209
              inherited IFondoDis: TImage
                Height = 190
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 190
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = True
                  end>
              end
            end
            inherited GBSeleccionados: TGroupBox
              Width = 463
              Height = 209
              inherited IFondoSel: TImage
                Width = 459
                Height = 190
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Width = 459
                Height = 190
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_RP'
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = True
                  end
                  item
                    Expanded = False
                    Visible = True
                  end>
              end
            end
            inherited PTransferencia: TPanel
              Height = 209
              inherited IFondo: TImage
                Height = 209
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
            Width = 1020
          end
          inherited GBFiltros: TGroupBox
            Top = 190
            Width = 1020
          end
          inherited Panel1: TPanel
            Top = 169
            Width = 1020
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
        inherited GBDatos: TGroupBox
          Width = 1020
          Height = 400
          Align = alClient
          object BitBtn1: TBitBtn
            Left = 420
            Top = 164
            Width = 225
            Height = 52
            Caption = 'Seleccionar Planilla para Importar'
            TabOrder = 0
            OnClick = BitBtn1Click
            Glyph.Data = {
              36090000424D3609000000000000360000002800000018000000180000000100
              2000000000000009000000000000000000000000000000000000388156002D78
              4D00347E5300327C5100307B4F002E794E002D784C002C774B002A764A002975
              4900287448002773480026734700267246002571460024714500247144002471
              450023704400236F430024714500247145002471450024714500307A4F002975
              49742D784DB42F794EAF317A4FB22F794EB22E784EB22E784DB22D774CB22C76
              4CB22C764BB22B754BB22B754AB22A754AB22A7449B2297449B2297449B22A74
              49B2297449B2297349B2267247AF237044B42471456C237145003D855A002F79
              4EBB398257FF307C50FF277648FF267547FF237345FF227244FF207042FF1F6F
              41FF1D6E40FF1C6D3FFF1B6C3EFF1A6B3DFF196B3DFF196A3CFF186A3BFF176A
              3BFF18693BFF166839FF1D6D3FFF247145FF237044B32470450040885D00337D
              52AE368155FB609776F794B59FFB8CB098FB8CB099FB8CAF98FB8BAF97FB8AAF
              97FB8AAE96FB8AAE96FB8AAE96FB89AD96FB89AC95FB87AC93FB87AB93FB87AB
              93FB84AA91FB8DAF98FB4F8A67F71D6C3FFB267246A623714400448B60003880
              56B1327F52FF97B7A1FBFFFAFBFFF4EDEBFFF6EFEDFFF6EEEDFFF6EEECFFF6EE
              ECFFF5EDECFFF5EDEBFFF6EEEBFFF5EEEBFFF8F0EEFFFFF4F4FFFFF5F4FFFFF6
              F4FFFCF2F0FFFFFEFFFF83AA91FB16683AFF297449A923704400488E64003A81
              57B1378356FF8FB39CFBF6F0EEFFEFECE8FFF5F0EDFFF4EFECFFF3EEECFFF3EE
              EBFFF3EEEBFFF2EEEBFFF1ECE9FFF3EEEAFFE2E0DBFFC1C8BEFFBCC4B9FFBDC5
              BAFFBAC3B8FFCCCFC6FF739F82FB196B3DFF297349A9247044004C9168003C83
              59B13A8658FF93B69FFBF7F1EFFFB3C4B5FFA2B6A4FFA5B8A7FFA4B7A6FFA3B7
              A5FFA3B6A5FFA1B3A2FFACBBABFFA8BAABFF91BC9EFF5AA373FF318A4EFF378A
              4DFF308740FF387545FF618F72FB1C6E3FFF277247A92470440051956B003E85
              5BB13D885BFF9BBBA6FBD3DBD2FF288138FF328D42FF318D48FF30904DFF2F92
              52FF2B8C4FFF1F7441FF106031FF68A77EFF86CF9EFF49AB68FF43A45BFF48A5
              53FF3F8F4CFFB9C5B7FF84AA92FB17693AFF297449A924714500559970004087
              5DB1428D60FF94B7A0FBFDF7F9FF94B99AFF3B9544FF4CA558FF47A45CFF46A7
              63FF46AC6AFF318F55FF75B28BFF91D5A6FF41A361FF409D57FF4CA355FF2D82
              3FFF4A7656FFFFF6F7FF7AA58AFB1A6B3DFF2A754AA9257246005B9E74004389
              5FB1489164FF96B9A3FBFCF5F4FFF6F0F1FF85B08EFF369240FF48A056FF44A3
              5AFF349654FF73B48AFF8DD1A2FF3FA35FFF419F58FF449F4FFF2B813DFF2068
              3FFF085022FFA7B3A2FF89AF97FB186A3BFF2B744AA92672460060A27900458B
              61B14C9468FF99BBA5FBFCF5F5FFECECE7FFF9F1F3FF76A981FF399642FF3994
              4CFF73B388FF8ED1A3FF3FA35FFF409F58FF439F4EFF499253FF6A967BFF3677
              51FF34744EFFAFBCADFF86AD94FB1A6B3DFF2B754BA92673470066A77E00488D
              63B152996DFF9ABDA6FBFEF6F7FFEDECE9FFEFEEEAFFF9F2F3FF629D6FFF69AD
              7DFF8FD2A5FF40A360FF419F58FF48A052FF328844FF3A6E4AFFF6ECEAFFE3E4
              DDFFE3E3DDFFFFF6F6FF7DA68BFB1E6E40FF2C764BA9277348006CAC83004B8F
              66B1579D71FF9CBEA8FBFEF7F8FFECECE8FFF9F4F2FFD9DED7FF92C0A2FF87CD
              9EFF40A460FF419F58FF469E50FF3B8F4BFF3C9B60FF1C723CFF67866BFFFCF4
              F3FFE4E3DDFFF5EEECFF7FA88EFB1F6F41FF2C764BA92975490073B189004E92
              69B15DA276FF9EC0AAFBFDF7F7FFF7F4F2FFDDE1DCFF8ABC9BFF82CB99FF42A4
              62FF409F57FF49A153FF3B8F4AFF3C9A5AFF42A764FF40A365FF13612EFF9DAB
              9AFFF6F2EFFFF5EDEBFF80A98EFB217143FF2D774CA92A764A007AB78E005194
              6BB163A77BFF9EC0AAFBFFFEFFFFDDE2DDFF8EBE9EFF83CB9AFF43A562FF419F
              58FF46A051FF2F863EFF3D964DFF45A35AFF40A25DFF41A564FF38995DFF1F60
              33FFC4CABFFFFFF9F9FF7EA78DFB237245FF2E784DA92B774B0080BD95005497
              6EB168AB80FFA6C6B2FBEDEFEDFF8FC09FFF85CD9CFF47A866FF44A25AFF409D
              4CFF3A8846FF93B19DFF4D9B5AFF3C9B4AFF46A35CFF43A461FF47AA6AFF2E8C
              51FF3B6C47FFEBE7E4FF83AB91FB247446FF2F784EA92D784C0088C39B00579A
              71B16FB186FFA4C4B0FB93BEA2FF6CBA86FF399C5AFF35964EFF3B954AFF4D94
              5AFFB5C5B8FFFFFDFFFFC4D3C7FF499658FF38954BFF389852FF369956FF3AA0
              60FF126C33FFA7B2A3FF90B59DFB247445FF30794FA92E794E0090C9A1005B9D
              74B177B78DFFA5C7B2FBDAE7DFFFBFD5C7FFC2D5C8FFC3D5C8FFC5D5C8FFEBEA
              E9FFFEF8F8FFEDEDE9FFFAF4F4FFE4E5E2FFBFD0C2FFBFD0C2FFBED0C1FFBCCF
              BFFFC1D2C4FFF4EEECFF84AC92FB2A784AFF317A50A9317B500098CFA9005FA0
              78B17EBD93FFA8CAB4FBFFFFFFFFFDFAFBFFFFFBFBFFFDF9F9FFFCF8F8FFF3F2
              EFFFEEEEEBFFF0EFECFFEDEDE9FFF0EFEBFFF7F2F0FFF6F1EFFFF5F0EEFFF4EF
              EDFFEFECE8FFF7F1EFFF83AC92FB2D7B4DFF327B51A9337D5100A0D6B00063A3
              7BB185C399FFADCDBAFBFFFFFFFFFEFBFCFFFFFBFDFFFFFAFCFFFFF9FBFFFFF9
              FBFFFFF9FAFFFFF8F9FFFEF7F8FFFDF6F6FFFBF4F4FFFAF4F3FFFAF3F2FFF9F2
              F1FFF5F0EEFFFFFAFCFF8BB098FB2F7D4FFF347C52A9357E5300A9DEB80064A5
              7CAE95CFA6FB8DBE9FF7A6CAB4FBA4C8B1FBA3C6B0FBA0C4AEFB9EC2ABFB9CC1
              A9FB9ABFA8FB99BDA6FB97BBA4FB95BAA2FB93B9A1FB92B79FFB90B69EFB8FB5
              9CFB8CB29AFB91B59EFB5E9774F73A8458FB327C51A637805500B2E5BF0066A7
              7EBCA0D6B0FF95CFA7FF88C59BFF82C096FF7CBB90FF75B68BFF6FB186FF6AAD
              82FF65A87DFF60A479FF5AA074FF569C70FF51986CFF4D9569FF499165FF458E
              62FF418B5FFF3D885BFF418A5EFF428A5FFF317C50B33A8358006EAE8500458C
              626C63A57BA961A37AA661A27AA95E9F77A95B9D74A9589A72A955986FA95296
              6DA950936BA94D9168A94B9066A9488E64A9468B62A9448A60A942885FA94087
              5DA93E855BA93D845AA9388156A6337E52A92A764A652F7A4F00B6E9C30068A9
              8000A2D8B1009BD3AC0094CDA6008EC8A10088C39B0082BE96007CB9910076B4
              8C0071B088006CAC830067A87F0062A47B005EA077005A9D7300569A70005296
              6C004E9369004B906600478E630041895E00327C51003A845800}
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 302
          Width = 1052
          Height = 100
          Align = alCustom
          Visible = False
          inherited MAObservacion: TMemoAuto
            Width = 1048
            Height = 81
          end
        end
      end
      inherited TSGrilla: TTabSheet
        OnShow = TSGrillaShow
        inherited BDBGSimple: TBitDBGrid
          Width = 925
          TitleFont.Height = -26
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_PC'
              Title.Caption = 'RP (Ternero/a)'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_HBA'
              Title.Caption = 'HBA (Ternero)'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Title.Caption = 'Nombre (Ternero)'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Caption = 'Fecha de Nacimiento'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V9'
              Title.Caption = 'Sexo'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V10'
              Title.Caption = 'Vivo'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V13'
              Title.Caption = 'Color'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'I8'
              Title.Caption = 'Peso'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_RP'
              ReadOnly = True
              Title.Caption = 'RP (Madre Evento)'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V11'
              ReadOnly = True
              Title.Caption = 'Categoria'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V5'
              Title.Caption = 'Cond. Corp'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V1'
              Title.Caption = 'Tipo Parto'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V3'
              Title.Caption = 'Causa'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V4'
              Title.Caption = 'Grado'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'V2'
              Title.Caption = 'Responsable'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_OTRO'
              Title.Caption = 'RP (Madre Transf. Embr.)'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION2'
              Title.Caption = 'HBA (Madre Transf. Embr.)'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION3'
              Title.Caption = 'Nombre (Madre Transf. Embr.)'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V6'
              Title.Caption = 'RP (Padre)'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V7'
              Title.Caption = 'HBA (Padre)'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'V8'
              Title.Caption = 'Nombre (Padre)'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APODO'
              Title.Caption = 'Potrero'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTA_BAJA'
              Title.Caption = 'Rodeo'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACION'
              Title.Caption = 'Observacion'
              Width = 78
              Visible = True
            end>
        end
        inherited PanelDer: TPanel
          Left = 972
        end
      end
    end
    inherited PBotones: TPanel
      Width = 1028
      inherited SBSelTodos: TSpeedButton
        Left = 602
      end
      inherited IFondoB2: TImage
        Width = 602
      end
      inherited BBCancelar: TBitBtn
        Left = 677
      end
      inherited BBAnterior: TBitBtn
        Left = 775
      end
      inherited BBSiguiente: TBitBtn
        Left = 873
      end
      inherited BBTerminar: TBitBtn
        Left = 971
      end
      inherited PL: TPanel
        Left = 602
      end
      inherited BBXlsImport: TBitBtn
        Visible = False
      end
    end
  end
  inherited PTitulo: TPanel
    Width = 1028
    Caption = 'Importaci'#243'n de Partos y Nacimientos'
    inherited LTitulo: TLabel
      Width = 624
      Caption = 'Importaci'#243'n de Partos y Nacimientos'
    end
    inherited PILeft: TPanel
      Left = 820
    end
  end
  inherited Psocalo: TPanel
    Width = 1028
    inherited JvSocalo: TJvImage
      Width = 1028
    end
  end
  inherited ALUniversal: TActionList
    Left = 515
    Top = 358
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 164
    Top = 65535
  end
  inherited DSSimple: TDataSource
    Left = 96
    Top = 0
  end
  inherited IBDSSimple: TIBDataSet
    DeleteSQL.Strings = (
      'delete from AUX_EVENTOS'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    InsertSQL.Strings = (
      'insert into AUX_EVENTOS'
      
        '  (ID_RP, FECHA, RESPONSABLE, V2, I1, V1, I3, V3, I4, V4, I5, V5' +
        ', V6, V7, '
      
        '   V8, ID_PC, I6, V9, I7, V10, I8, V11, ID_HBA, I9, VUNO1, NOMBR' +
        'E, ID_OTRO, '
      
        '   OBSERVACION, EW, I2, APODO, ID_AUX_EVENTO, DTA_BAJA, I10, V13' +
        ', V14, '
      '   OBSERVACION2, OBSERVACION3)'
      'values'
      
        '  (:ID_RP, :FECHA, :RESPONSABLE, :V2, :I1, :V1, :I3, :V3, :I4, :' +
        'V4, :I5, '
      
        '   :V5, :V6, :V7, :V8, :ID_PC, :I6, :V9, :I7, :V10, :I8, :V11, :' +
        'ID_HBA, '
      
        '   :I9, :VUNO1, :NOMBRE, :ID_OTRO, :OBSERVACION, :EW, :I2, :APOD' +
        'O, '
      ':ID_AUX_EVENTO, '
      '   :DTA_BAJA, :I10, :V13, :V14, :OBSERVACION2, :OBSERVACION3)')
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
      '  H2,'
      '  OBSERVACION2,'
      '  OBSERVACION3,'
      '  OBSERVACION4,'
      '  OBSERVACION5,'
      '  F6,'
      '  I10,'
      '  V13,'
      '  V14'
      'from AUX_EVENTOS '
      'where'
      '  ID_ANIMAL = :ID_ANIMAL')
    SelectSQL.Strings = (
      
        'SELECT ID_ANIMAL, ID_RP, FECHA, RESPONSABLE, V2, I1,V1, I3, V3, ' +
        'I4, V4, I5, V5, V6, V7, V8, ID_PC,  I6, V9, I7, V10, I8, V11, ID' +
        '_HBA, I9, VUNO1, NOMBRE, ID_OTRO, OBSERVACION, EW, I2, APODO, ID' +
        '_AUX_EVENTO, DTA_BAJA, I10, V13, V14, observacion2, observacion3' +
        ' FROM AUX_EVENTOS')
    ModifySQL.Strings = (
      'update AUX_EVENTOS'
      'set'
      '  ID_RP = :ID_RP,'
      '  FECHA = :FECHA,'
      '  RESPONSABLE = :RESPONSABLE,'
      '  V2 = :V2,'
      '  I1 = :I1,'
      '  V1 = :V1,'
      '  I3 = :I3,'
      '  V3 = :V3,'
      '  I4 = :I4,'
      '  V4 = :V4,'
      '  I5 = :I5,'
      '  V5 = :V5,'
      '  V6 = :V6,'
      '  V7 = :V7,'
      '  V8 = :V8,'
      '  ID_PC = :ID_PC,'
      '  I6 = :I6,'
      '  V9 = :V9,'
      '  I7 = :I7,'
      '  V10 = :V10,'
      '  I8 = :I8,'
      '  V11 = :V11,'
      '  ID_HBA = :ID_HBA,'
      '  I9 = :I9,'
      '  VUNO1 = :VUNO1,'
      '  NOMBRE = :NOMBRE,'
      '  ID_OTRO = :ID_OTRO,'
      '  OBSERVACION = :OBSERVACION,'
      '  EW = :EW,'
      '  I2 = :I2,'
      '  APODO = :APODO,'
      '  ID_AUX_EVENTO = :ID_AUX_EVENTO,'
      '  DTA_BAJA = :DTA_BAJA,'
      '  I10 = :I10,'
      '  V13 = :V13,'
      '  V14 = :V14,'
      '  OBSERVACION2 = :OBSERVACION2,'
      '  OBSERVACION3 = :OBSERVACION3'
      'where'
      '  ID_ANIMAL = :OLD_ID_ANIMAL')
    Left = 60
    Top = 8
    object IBDSSimpleID_RP: TIBStringField
      FieldName = 'ID_RP'
      Origin = 'AUX_EVENTOS.ID_RP'
      Size = 10
    end
    object IBDSSimpleFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'AUX_EVENTOS.FECHA'
      OnSetText = IBDSSimpleV2SetText
    end
    object IBDSSimpleRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Origin = 'AUX_EVENTOS.RESPONSABLE'
    end
    object IBDSSimpleV2: TIBStringField
      FieldName = 'V2'
      Origin = 'AUX_EVENTOS.V2'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI1: TIntegerField
      FieldName = 'I1'
      Origin = 'AUX_EVENTOS.I1'
    end
    object IBDSSimpleV1: TIBStringField
      FieldName = 'V1'
      Origin = 'AUX_EVENTOS.V1'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI3: TIntegerField
      FieldName = 'I3'
      Origin = 'AUX_EVENTOS.I3'
    end
    object IBDSSimpleV3: TIBStringField
      FieldName = 'V3'
      Origin = 'AUX_EVENTOS.V3'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI4: TIntegerField
      FieldName = 'I4'
      Origin = 'AUX_EVENTOS.I4'
    end
    object IBDSSimpleV4: TIBStringField
      FieldName = 'V4'
      Origin = 'AUX_EVENTOS.V4'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI5: TIntegerField
      FieldName = 'I5'
      Origin = 'AUX_EVENTOS.I5'
    end
    object IBDSSimpleV5: TIBStringField
      FieldName = 'V5'
      Origin = 'AUX_EVENTOS.V5'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleV6: TIBStringField
      FieldName = 'V6'
      Origin = 'AUX_EVENTOS.V6'
      Size = 100
    end
    object IBDSSimpleV7: TIBStringField
      FieldName = 'V7'
      Origin = 'AUX_EVENTOS.V7'
      Size = 100
    end
    object IBDSSimpleV8: TIBStringField
      FieldName = 'V8'
      Origin = 'AUX_EVENTOS.V8'
      Size = 100
    end
    object IBDSSimpleID_PC: TIBStringField
      FieldName = 'ID_PC'
      Origin = 'AUX_EVENTOS.ID_PC'
      Size = 10
    end
    object IBDSSimpleI6: TIntegerField
      FieldName = 'I6'
      Origin = 'AUX_EVENTOS.I6'
    end
    object IBDSSimpleV9: TIBStringField
      FieldName = 'V9'
      Origin = 'AUX_EVENTOS.V9'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI7: TIntegerField
      FieldName = 'I7'
      Origin = 'AUX_EVENTOS.I7'
    end
    object IBDSSimpleV10: TIBStringField
      FieldName = 'V10'
      Origin = 'AUX_EVENTOS.V10'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
    end
    object IBDSSimpleI8: TIntegerField
      FieldName = 'I8'
      Origin = 'AUX_EVENTOS.I8'
    end
    object IBDSSimpleV11: TIBStringField
      FieldName = 'V11'
      Origin = 'AUX_EVENTOS.V11'
      OnSetText = IBDSSimpleV2SetText
      Size = 100
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
    object IBDSSimpleID_OTRO: TIBStringField
      FieldName = 'ID_OTRO'
      Origin = 'AUX_EVENTOS.ID_OTRO'
      Size = 10
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
    object IBDSSimpleID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'AUX_EVENTOS.ID_ANIMAL'
    end
    object IBDSSimpleI9: TIntegerField
      FieldName = 'I9'
      Origin = 'AUX_EVENTOS.I9'
    end
    object IBDSSimpleVUNO1: TIBStringField
      FieldName = 'VUNO1'
      Origin = 'AUX_EVENTOS.VUNO1'
      Size = 1
    end
    object IBDSSimpleI2: TIntegerField
      FieldName = 'I2'
      Origin = 'AUX_EVENTOS.I2'
    end
    object IBDSSimpleAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'AUX_EVENTOS.APODO'
      OnSetText = IBDSSimpleV2SetText
      Size = 50
    end
    object IBDSSimpleID_AUX_EVENTO: TIntegerField
      FieldName = 'ID_AUX_EVENTO'
      Origin = 'AUX_EVENTOS.ID_AUX_EVENTO'
    end
    object IBDSSimpleDTA_BAJA: TIBStringField
      FieldName = 'DTA_BAJA'
      Origin = 'AUX_EVENTOS.DTA_BAJA'
      OnSetText = IBDSSimpleV2SetText
      Size = 50
    end
    object IBDSSimpleI10: TIntegerField
      FieldName = 'I10'
      Origin = 'AUX_EVENTOS.I10'
    end
    object IBDSSimpleV13: TIBStringField
      FieldName = 'V13'
      Origin = 'AUX_EVENTOS.V13'
      Size = 100
    end
    object IBDSSimpleV14: TIBStringField
      FieldName = 'V14'
      Origin = 'AUX_EVENTOS.V14'
      Size = 100
    end
    object IBDSSimpleOBSERVACION2: TIBStringField
      FieldName = 'OBSERVACION2'
      Origin = 'AUX_EVENTOS.OBSERVACION2'
      Size = 255
    end
    object IBDSSimpleOBSERVACION3: TIBStringField
      FieldName = 'OBSERVACION3'
      Origin = 'AUX_EVENTOS.OBSERVACION3'
      Size = 255
    end
  end
  inherited IBSPCrearGrupo: TIBStoredProc
    Left = 392
    Top = 366
  end
  inherited IBQValidaciones: TIBQuery
    Left = 548
    Top = 0
  end
  inherited IBQEvento: TIBQuery
    Left = 204
    Top = 65534
  end
  inherited SDXLS: TSaveDialog
    Left = 422
    Top = 65533
  end
  inherited DTXLS: TDataToXLS
    DataSet = IBDSSimple
    Columns = <
      item
        DataField = 'ID_PC'
        Title = 'RP (Ternero/a)'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha de Nacimiento'
      end
      item
        DataField = 'V9'
        Title = 'Sexo'
      end
      item
        DataField = 'V10'
        Title = 'Vivo'
      end
      item
        DataField = 'I8'
        Title = 'Peso'
      end
      item
        DataField = 'ID_RP'
        Title = 'RP (Madre Evento)'
      end
      item
        DataField = 'V11'
        Title = 'Categor'#237'a'
      end
      item
        DataField = 'V5'
        Title = 'Cond. Corp.'
      end
      item
        DataField = 'V1'
        Title = 'Tipo de Parto'
      end
      item
        DataField = 'V3'
        Title = 'Causa'
      end
      item
        DataField = 'V4'
        Title = 'Grado'
      end
      item
        DataField = 'V2'
        Title = 'Responsable'
      end
      item
        DataField = 'ID_OTRO'
        Title = 'RP (Madre Transf. Embr.)'
      end
      item
        DataField = 'ID_HBA'
        Title = 'HBA (Madre Transf. Embr.)'
      end
      item
        DataField = 'NOMBRE'
        Title = 'Nombre (Madre Transf. Embr.)'
      end
      item
        DataField = 'V6'
        Title = 'RP (Padre)'
      end
      item
        DataField = 'V7'
        Title = 'HBA (Padre)'
      end
      item
        DataField = 'V8'
        Title = 'Nombre (Padre)'
      end
      item
        DataField = 'OBSERVACION'
        Title = 'Observacion'
      end>
    Title.Text = 'Planilla de Partos y Nacimientos'
    Left = 304
    Top = 1
  end
  inherited WinXP1: TWinXP
    Left = 624
    Top = 0
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Left = 516
    Top = 65527
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Left = 588
    Top = 65535
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Left = 580
    Top = 359
  end
  inherited IBSPGeneradores: TIBStoredProc
    Left = 492
    Top = 65535
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Left = 452
    Top = 65535
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
    Left = 552
    Top = 358
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'animal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'p'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'p1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'p2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rp2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sen'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sen1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sen2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hba'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hba1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hba2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ra1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ra2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'otro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'otro1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'otro2'
        ParamType = ptUnknown
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
  end
  inherited DSIBQ_SPRN: TDataSource
    Left = 672
    Top = 334
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
    Left = 488
    Top = 358
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
    Left = 440
    Top = 366
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 620
    Top = 335
  end
  inherited IBQGetCantAnimales: TIBQuery
    Left = 136
    Top = 0
  end
  inherited OpenDlg: TOpenDialog
    Left = 268
    Top = 0
  end
  inherited IBQDelEventosAux: TIBQuery
    Left = 708
    Top = 368
  end
  inherited IBQImportacion: TIBQuery
    Left = 236
    Top = 65534
  end
  object PopupMenu1: TPopupMenu
    Left = 20
  end
  object IBQCondicionCorporal: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    Left = 84
    Top = 112
  end
  object DSCondicionCorporal: TDataSource
    DataSet = IBQCondicionCorporal
    Left = 44
    Top = 80
  end
  object IBQCategorias: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from cod_categorias where id_categoria = 5 or id_catego' +
        'ria = 6')
    Left = 80
    Top = 80
  end
  object DSCategorias: TDataSource
    DataSet = IBQCategorias
    Left = 44
    Top = 112
  end
  object IBQAnimalInt: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select first 1 id_animal, id_rp, id_hba, nombre from tab_animale' +
        's where ((id_rp = :rp) or (id_hba = :hba) or (nombre = :nombre))' +
        ' and establecimiento = :esta')
    Left = 44
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hba'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQAnimalExt: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select first 1 id_animal_externo, id_rp, id_hba, nombre from tab' +
        '_animales_externos where ((id_rp = :rp) or (id_hba = :hba) or (n' +
        'ombre = :nombre)) and establecimiento = :esta')
    Left = 84
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'hba'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  object IBQAgregarPadre: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'insert into aux_animales_externos'
      '  (ID_ANIMAL_EXTERNO, ID_AUX, ID_RP, SEXO, INTERNO)'
      'values'
      '  (:ID_ANIMAL_EXTERNO, :ID_AUX, :ID_RP, :SEXO, :INTERNO)')
    Left = 68
    Top = 352
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
        Name = 'ID_RP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERNO'
        ParamType = ptUnknown
      end>
  end
  object IBQBorrarAuxExt: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from aux_animales_externos where id_animal_externo = :id')
    Left = 100
    Top = 352
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
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_colores')
    Left = 116
    Top = 244
  end
  object DSColor: TDataSource
    DataSet = IBQColor
    Left = 84
    Top = 244
  end
end
