inherited FIntro: TFIntro
  Left = 222
  Top = 0
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Intro'
  ClientHeight = 566
  ClientWidth = 792
  Color = clTeal
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTitulo: TPanel
    Width = 792
    Caption = 'Introducci'#243'n'
    inherited Image3: TImage
      Left = 594
    end
    inherited Image4: TImage
      Width = 435
    end
    inherited LTitulo: TLabel
      Width = 435
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 65
    Width = 25
    Height = 452
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 32
    Width = 792
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object Panel3: TPanel [4]
    Left = 767
    Top = 65
    Width = 25
    Height = 452
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 4
  end
  object Panel4: TPanel [5]
    Left = 0
    Top = 517
    Width = 792
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    object ChkBMostrarIntro: TCheckBox
      Left = 512
      Top = 9
      Width = 217
      Height = 16
      Caption = 'No mostrar en el pr'#243'ximo inicio de sesi'#243'n'
      TabOrder = 0
      OnClick = ChkBMostrarIntroClick
    end
  end
  object Panel5: TPanel [6]
    Left = 25
    Top = 65
    Width = 742
    Height = 452
    Align = alClient
    TabOrder = 6
    object SWFIntro: TShockwaveFlash
      Left = 1
      Top = 1
      Width = 740
      Height = 450
      Align = alClient
      TabOrder = 0
      ControlData = {
        67556655000300007B4C0000822E000008000200000000000800B20000004300
        3A005C0044006F00630075006D0065006E0074007300200061006E0064002000
        530065007400740069006E00670073005C00410064006D0069006E0069007300
        74007200610064006F0072005C004500730063007200690074006F0072006900
        6F005C00500052005500450042004100530050005000540054004F0053005700
        46005C006100750074006F006300610070006100630069007400610063006900
        6F006E0032002E0073007700660000000800B200000043003A005C0044006F00
        630075006D0065006E0074007300200061006E00640020005300650074007400
        69006E00670073005C00410064006D0069006E00690073007400720061006400
        6F0072005C004500730063007200690074006F00720069006F005C0050005200
        5500450042004100530050005000540054004F005300570046005C0061007500
        74006F0063006100700061006300690074006100630069006F006E0032002E00
        730077006600000008000E000000570069006E0064006F00770000000B00FFFF
        0B00FFFF08000A0000004800690067006800000008000200000000000B000000
        080002000000000008000E00000061006C007700610079007300000008001000
        0000530068006F00770041006C006C0000000B0000000B000000080002000000
        00000800020000000000}
    end
  end
end
