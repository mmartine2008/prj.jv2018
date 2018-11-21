inherited FMensajeImpresora: TFMensajeImpresora
  Left = 296
  Top = 262
  Caption = 'FMensajeImpresora'
  ClientHeight = 244
  ClientWidth = 585
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited IbordeTop: TImage
    Width = 585
  end
  inherited PBotones: TPanel
    Top = 192
    Width = 585
    inherited IFondoBottom: TImage
      Width = 585
    end
  end
  inherited PTitulo: TPanel
    Width = 585
    inherited Image4: TImage
      Width = 387
    end
    inherited LTitulo: TLabel
      Width = 387
    end
  end
  inherited PTexto: TPanel
    Width = 585
    Height = 135
    inherited GroupBox2: TGroupBox
      Width = 585
      Height = 135
      object Label1: TLabel [0]
        Left = 52
        Top = 138
        Width = 139
        Height = 13
        Cursor = crHandPoint
        Caption = 'Agregar una nueva impresora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = Label1Click
      end
      inherited Panel1: TPanel
        Width = 581
        inherited ImageAdvertencia: TImage
          Width = 401
        end
        inherited LTextoMensaje: TStaticText
          Width = 401
          Caption = ''
        end
      end
    end
  end
end
