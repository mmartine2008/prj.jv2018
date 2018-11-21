inherited FMensajeEdades: TFMensajeEdades
  Left = 342
  Top = 116
  Caption = 'FMensajeEdades'
  ClientHeight = 408
  ClientWidth = 565
  FormStyle = fsNormal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited IbordeTop: TImage
    Width = 565
  end
  inherited PBotones: TPanel
    Top = 356
    Width = 565
    inherited IFondoBottom: TImage
      Width = 565
    end
    inherited ISiATodo: TImage
      OnClick = BBSiaTodoClick
    end
    inherited LSiATodo: TLabel
      OnClick = BBSiaTodoClick
    end
    inherited LSi: TLabel
      OnClick = BBSiClick
    end
    inherited Isi: TImage
      OnClick = BBSiClick
    end
    inherited INo: TImage
      OnClick = BBNoClick
    end
    inherited LNo: TLabel
      OnClick = BBNoClick
    end
    inherited ICancel: TImage
      OnClick = BBCancelarClick
    end
    inherited LCancel: TLabel
      OnClick = BBCancelarClick
    end
    inherited IAceptar: TImage
      OnClick = BBSiClick
    end
    inherited LAceptar: TLabel
      OnClick = BBSiClick
    end
    inherited BBAceptar: TBitBtn
      Visible = False
    end
    inherited BBSiaTodo: TBitBtn
      Left = 117
      OnClick = BBSiaTodoClick
    end
    inherited BBSi: TBitBtn
      Left = 17
      Width = 100
      OnClick = BBSiClick
    end
    inherited BBNo: TBitBtn
      OnClick = BBNoClick
    end
    inherited BBCancelar: TBitBtn
      Left = 445
      Anchors = [akRight, akBottom]
      OnClick = BBCancelarClick
    end
  end
  inherited PTitulo: TPanel
    Width = 565
    inherited Image3: TImage
      Left = 369
    end
    inherited Image4: TImage
      Width = 173
    end
    inherited LTitulo: TLabel
      Width = 173
    end
  end
  inherited PTexto: TPanel
    Width = 565
    Height = 315
    inherited GroupBox2: TGroupBox
      Width = 565
      Height = 315
      inherited Panel1: TPanel
        Width = 561
        inherited ImageAdvertencia: TImage
          Width = 53
          Align = alLeft
        end
        inherited LTextoMensaje: TStaticText
          Left = 225
          Width = 328
        end
      end
      object GBCats: TGroupBox
        Left = 70
        Top = 98
        Width = 113
        Height = 180
        Anchors = [akLeft, akBottom]
        Caption = 'Categor'#237'a'
        TabOrder = 1
        DesignSize = (
          113
          180)
        object Label1: TLabel
          Left = 72
          Top = 23
          Width = 32
          Height = 14
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Label1'
          Visible = False
        end
        object Label2: TLabel
          Left = 71
          Top = 46
          Width = 32
          Height = 14
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Label1'
          Visible = False
        end
        object Label3: TLabel
          Left = 71
          Top = 69
          Width = 32
          Height = 14
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Label1'
          Visible = False
        end
        object Label4: TLabel
          Left = 71
          Top = 93
          Width = 32
          Height = 14
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Label1'
          Visible = False
        end
        object Label5: TLabel
          Left = 71
          Top = 116
          Width = 32
          Height = 14
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Label1'
          Visible = False
        end
        object Label6: TLabel
          Left = 71
          Top = 139
          Width = 32
          Height = 14
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Label1'
          Visible = False
        end
      end
      object GBEdad: TGroupBox
        Left = 192
        Top = 98
        Width = 52
        Height = 180
        Anchors = [akLeft, akBottom]
        Caption = 'Edad'
        TabOrder = 2
        object Edit1: TEdit
          Left = 9
          Top = 17
          Width = 34
          Height = 22
          TabOrder = 0
          Text = 'Edit1'
          Visible = False
          OnChange = Edit1Change
          OnExit = Edit1Exit
        end
        object Edit2: TEdit
          Left = 9
          Top = 41
          Width = 34
          Height = 22
          TabOrder = 1
          Text = 'Edit1'
          Visible = False
          OnChange = Edit1Change
          OnExit = Edit1Exit
        end
        object Edit3: TEdit
          Left = 9
          Top = 65
          Width = 34
          Height = 22
          TabOrder = 2
          Text = 'Edit1'
          Visible = False
          OnChange = Edit1Change
          OnExit = Edit1Exit
        end
        object Edit4: TEdit
          Left = 9
          Top = 87
          Width = 34
          Height = 22
          TabOrder = 3
          Text = 'Edit1'
          Visible = False
          OnChange = Edit1Change
          OnExit = Edit1Exit
        end
        object Edit5: TEdit
          Left = 9
          Top = 110
          Width = 34
          Height = 22
          TabOrder = 4
          Text = 'Edit1'
          Visible = False
          OnChange = Edit1Change
          OnExit = Edit1Exit
        end
        object Edit6: TEdit
          Left = 9
          Top = 134
          Width = 34
          Height = 22
          TabOrder = 5
          Text = 'Edit1'
          Visible = False
          OnChange = Edit1Change
          OnExit = Edit1Exit
        end
      end
      object GBCond: TGroupBox
        Left = 246
        Top = 98
        Width = 242
        Height = 180
        Caption = 'Condicion'
        TabOrder = 3
        object Label7: TLabel
          Left = 10
          Top = 22
          Width = 32
          Height = 14
          Caption = 'Label7'
          Visible = False
        end
        object Label8: TLabel
          Left = 10
          Top = 44
          Width = 32
          Height = 14
          Caption = 'Label7'
          Visible = False
        end
        object Label9: TLabel
          Left = 10
          Top = 67
          Width = 32
          Height = 14
          Caption = 'Label7'
          Visible = False
        end
        object Label10: TLabel
          Left = 10
          Top = 90
          Width = 32
          Height = 14
          Caption = 'Label7'
          Visible = False
        end
        object Label11: TLabel
          Left = 10
          Top = 114
          Width = 32
          Height = 14
          Caption = 'Label7'
          Visible = False
        end
        object Label12: TLabel
          Left = 10
          Top = 138
          Width = 32
          Height = 14
          Caption = 'Label7'
          Visible = False
        end
      end
    end
  end
end
