inherited FThreadEspera: TFThreadEspera
  Left = 325
  Top = 338
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FThreadEspera'
  ClientHeight = 107
  ClientWidth = 498
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object LLeyenda: TLabel [0]
    Left = 8
    Top = 40
    Width = 375
    Height = 16
    Caption = 'Espere un momento hasta que se cargen los animales'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object JvWGEspera: TJvWaitingGradient [1]
    Left = 10
    Top = 69
    Width = 482
    Height = 6
    Color = clMoneyGreen
    GradientWidth = 500
    EndColor = clGreen
    Interval = 0
    ParentColor = False
    AlwaysRestart = True
    StartColor = clMoneyGreen
  end
  inherited PTitulo: TPanel
    Width = 498
    Caption = 'Por favor espere...'
    inherited Image3: TImage
      Left = 300
    end
    inherited Image4: TImage
      Width = 141
    end
    inherited LTitulo: TLabel
      Width = 141
      Caption = 'Por favor espere...'
    end
  end
  inherited ALUniversal: TActionList
    Left = 91
    Top = 6
  end
  inherited IBSPEstadisticas: TIBStoredProc
    Transaction = FPrincipal.IBTPrincipal
    Left = 12
    Top = 7
  end
  inherited SDXLS: TSaveDialog
    Left = 62
    Top = 5
  end
  inherited DTXLS: TDataToXLS
    Left = 40
    Top = 9
  end
  inherited WinXP1: TWinXP
    Left = 8
    Top = 40
  end
  inherited IBSPBorrarTablasAuxiliares: TIBStoredProc
    Transaction = FPrincipal.IBTPrincipal
    Left = 100
    Top = 47
  end
  inherited IBSPFixEstadoLactacion: TIBStoredProc
    Transaction = FPrincipal.IBTPrincipal
    Left = 172
    Top = 31
  end
  inherited IBStoredFixIDTratamiento: TIBStoredProc
    Transaction = FPrincipal.IBTPrincipal
    Left = 68
    Top = 39
  end
  inherited IBSPGeneradores: TIBStoredProc
    Transaction = FPrincipal.IBTPrincipal
    Left = 132
    Top = 31
  end
  inherited IBSPFixTabEstablecimientoPais: TIBStoredProc
    Transaction = FPrincipal.IBTPrincipal
    Left = 116
    Top = 7
  end
  inherited IBSPFIXRelGruposEventos: TIBStoredProc
    Left = 36
    Top = 39
  end
end
