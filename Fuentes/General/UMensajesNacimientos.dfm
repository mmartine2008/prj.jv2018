inherited FMensajeNacimientos: TFMensajeNacimientos
  Left = 277
  Top = 197
  Caption = 'FMensajeNacimientos'
  ClientHeight = 320
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited PBotones: TPanel
    Top = 268
  end
  inherited PTexto: TPanel
    Height = 211
    inherited GroupBox2: TGroupBox
      Height = 211
      inherited Panel1: TPanel
        TabOrder = 1
      end
      object MRps: TMemo
        Left = 2
        Top = 89
        Width = 527
        Height = 120
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
end
