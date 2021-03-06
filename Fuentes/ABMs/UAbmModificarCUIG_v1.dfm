inherited FABMModificarCUIG: TFABMModificarCUIG
  Left = 197
  Top = 108
  Caption = 'FABMModificarCUIG'
  ClientHeight = 420
  ClientWidth = 786
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
    Width = 786
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
  inherited PNavegar: TPanel
    Width = 786
    TabOrder = 1
    inherited GBBuscar: TGroupBox
      Width = 782
      inherited EValorBuscar: TEdit
        Width = 555
      end
    end
    inherited GBFiltrar: TGroupBox
      Width = 782
      inherited EValorFiltrar: TEdit
        Width = 549
      end
    end
    inherited GBCantidad: TGroupBox
      Width = 782
      inherited BDBGAbm: TBitDBGrid
        Width = 778
        ParentFont = False
        TitleFont.Height = -13
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ENCABEZADO'
            Title.Alignment = taCenter
            Title.Caption = 'CUIG'
            Width = 177
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ULTIMO_IDENTIFICADOR'
            Title.Alignment = taCenter
            Title.Caption = #218'ltimo Identificador Utilizado'
            Width = 287
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACTIVO'
            Title.Caption = 'Activo'
            Visible = False
          end>
      end
    end
  end
  inherited PEditar: TPanel
    Top = 205
    Width = 786
    object Label1: TLabel
      Left = 26
      Top = 26
      Width = 30
      Height = 14
      Caption = 'CUIG: '
    end
    object Label2: TLabel
      Left = 26
      Top = 69
      Width = 163
      Height = 14
      Caption = 'N'#250'mero de Identificador siguiente:'
    end
    object Label3: TLabel
      Left = 60
      Top = 112
      Width = 317
      Height = 13
      Caption = 
        'Si no se especifica el n'#250'mero de Identificador siguiente comenza' +
        'r'#225' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6319106
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 60
      Top = 129
      Width = 107
      Height = 13
      Caption = 'la secuencia en '#39'A000'#39
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6319106
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 181
      Top = 26
      Width = 385
      Height = 13
      Caption = 
        'El CUIG debe respetar el formato de dos letras m'#225's 3 n'#250'meros  po' +
        'r ejemplo JC432'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6319106
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEACUIG: TDBEditAuto
      Left = 69
      Top = 22
      Width = 96
      Height = 22
      CharCase = ecUpperCase
      Color = 14679807
      DataField = 'ENCABEZADO'
      DataSource = DSAbmSimple
      MaxLength = 5
      TabOrder = 0
      OnChange = DBEACUIGChange
      EsClave = False
      EsRequerido = True
      ISParam = False
    end
    object DBEAUltimoIdent: TDBEditAuto
      Left = 213
      Top = 65
      Width = 83
      Height = 22
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'ULTIMO_IDENTIFICADOR'
      DataSource = DSAbmSimple
      MaxLength = 4
      TabOrder = 1
      EsClave = False
      EsRequerido = False
      ISParam = False
    end
    object CBActivar: TCheckBox
      Left = 345
      Top = 68
      Width = 294
      Height = 18
      Caption = 'Utilizar este Nro. de CUIG a partir de ahora'
      TabOrder = 2
    end
  end
  inherited PBotones: TPanel
    Top = 350
    Width = 786
    inherited IFondo: TImage
      Width = 786
    end
    inherited BBEliminar: TBitBtn
      Enabled = False
    end
    inherited BBGuardar: TBitBtn
      Left = 614
      Caption = '&Guardar'
    end
    inherited BBCancelar: TBitBtn
      Left = 700
    end
    inherited BBSalir: TBitBtn
      Left = 700
    end
    inherited BBElegir: TBitBtn
      Left = 528
    end
  end
  inherited PTitulo: TPanel
    Width = 786
    Caption = 'CUIG'
    inherited Image4: TImage
      Width = 392
    end
    inherited LTitulo: TLabel
      Width = 392
      Caption = 'CUIG'
    end
    inherited Image3: TImage
      Left = 588
    end
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Left = 268
    Top = 39
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Top = 175
  end
  inherited IBQAbmSimple: TIBQuery
    BeforeOpen = IBQAbmSimpleBeforeOpen
    SQL.Strings = (
      'select * from tab_cuig where establecimiento = :esta ')
    GeneratorField.Field = 'ID_CUIG'
    GeneratorField.Generator = 'GEN_ID_CUIG'
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  inherited IBUSQLAbmSimple: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from tab_cuig '
      'where'
      '  ID_CUIG = :ID_CUIG')
    ModifySQL.Strings = (
      'update tab_cuig'
      'set'
      '  ID_CUIG = :ID_CUIG,'
      '  ESTABLECIMIENTO = :ESTABLECIMIENTO,'
      '  ENCABEZADO = :ENCABEZADO,'
      '  ULTIMO_IDENTIFICADOR = :ULTIMO_IDENTIFICADOR,'
      '  ACTIVO = :ACTIVO'
      'where'
      '  ID_CUIG = :OLD_ID_CUIG')
    InsertSQL.Strings = (
      'insert into tab_cuig'
      '  (ID_CUIG, ESTABLECIMIENTO, ENCABEZADO, ULTIMO_IDENTIFICADOR, '
      'ACTIVO)'
      'values'
      
        '  (:ID_CUIG, :ESTABLECIMIENTO, :ENCABEZADO, :ULTIMO_IDENTIFICADO' +
        'R, '
      ':ACTIVO)')
    DeleteSQL.Strings = (
      'delete from tab_cuig'
      'where'
      '  ID_CUIG = :OLD_ID_CUIG')
  end
  object IBQVerificar: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select ID_CUIG, activo from TAB_CUIG where establecimiento=:esta' +
        ' and encabezado=:enc')
    Left = 544
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'enc'
        ParamType = ptUnknown
      end>
  end
end
