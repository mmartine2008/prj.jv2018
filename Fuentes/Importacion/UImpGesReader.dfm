inherited FImpGesReader: TFImpGesReader
  Left = 0
  Top = 0
  Width = 480
  Height = 412
  Caption = 'FImpGesReader'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object IBQParametros: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cod_campos_gesreader')
    Left = 48
    Top = 192
  end
  object IBQEventos: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_tipo_evento, nombre from cod_tipos_evento')
    Left = 40
    Top = 256
  end
  object IBQColumnasEvento: TIBQuery
    Database = FPrincipal.IBDPrincipal
    Transaction = FPrincipal.IBTPrincipal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from sys_columnas_gesreader where id_evento = :e')
    Left = 152
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'e'
        ParamType = ptUnknown
      end>
  end
end
