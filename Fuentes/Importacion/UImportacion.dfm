object FImportacion: TFImportacion
  Left = 350
  Top = 246
  Width = 269
  Height = 146
  Caption = 'Importacion'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object XMLDoc: TXMLDocument
    Left = 24
    Top = 56
    DOMVendorDesc = 'MSXML'
  end
  object IBQImportacion: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from tab_importaciones where establecimiento=:estableci' +
        'miento')
    Left = 68
    Top = 46
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTABLECIMIENTO'
        ParamType = ptUnknown
      end>
  end
end
