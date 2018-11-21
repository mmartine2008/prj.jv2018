inherited FEveServicioBasico: TFEveServicioBasico
  Left = 188
  Top = 207
  Caption = 'Evento de Servicio'
  PixelsPerInch = 96
  TextHeight = 14
  inherited ITope: TImage
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
  inherited PDatos: TPanel
    inherited PCBasico: TPageControl
      object TSServicio: TTabSheet [0]
        Caption = 'Servicios'
        ImageIndex = 3
        object BDBGServicios: TDBGrid
          Left = 0
          Top = 0
          Width = 938
          Height = 402
          Align = alClient
          DataSource = DMSoftvet.DSIngEgrServicio
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnCellClick = BDBGServiciosCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo Servicio'
              Width = 172
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Title.Caption = 'Nombre'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POTRERO'
              Title.Caption = 'Potrero'
              Width = 169
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INICIO'
              Title.Caption = 'Fecha Inicio'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FIN'
              Title.Caption = 'Fecha Fin'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FIN_ESTIMADA'
              Title.Caption = 'Fecha Fin Estimada'
              Width = 103
              Visible = True
            end>
        end
      end
      inherited TSManga: TTabSheet
        OnShow = TSMangaShow
        inherited MSimple: TMangazo
          inherited PSeleccion: TPanel
            inherited GBDisponibles: TGroupBox
              Height = 196
              inherited IFondoDis: TImage
                Height = 177
              end
              inherited BDBGDisponibles: TBitDBGrid
                Height = 177
              end
            end
            inherited GBSeleccionados: TGroupBox
              Height = 196
              inherited IFondoSel: TImage
                Height = 177
              end
              inherited BDBGSeleccionados: TBitDBGrid
                Height = 177
              end
            end
            inherited PTransferencia: TPanel
              Height = 196
              inherited IFondo: TImage
                Height = 196
              end
            end
          end
          inherited RGOrden: TRadioGroup
            Top = 115
          end
          inherited GBFiltros: TGroupBox
            Top = 190
          end
          inherited Panel1: TPanel
            Top = 169
            inherited Label1: TLabel
              Width = 142
              Height = 16
            end
          end
        end
      end
      inherited TSDatos: TTabSheet
        inherited GBDatos: TGroupBox
          Height = 165
          object LFecha: TLabel
            Left = 267
            Top = 26
            Width = 36
            Height = 22
            AutoSize = False
            Caption = 'Fecha:'
            Layout = tlCenter
          end
          object LResponsable: TLabel
            Left = 233
            Top = 55
            Width = 70
            Height = 23
            AutoSize = False
            Caption = 'Responsable:'
            Layout = tlCenter
          end
          object DTPAFecha: TDateTimePickerAuto
            Left = 310
            Top = 27
            Width = 105
            Height = 21
            Date = 38657.411226122680000000
            Time = 38657.411226122680000000
            Color = clWhite
            TabOrder = 0
            OnChange = DTPAFechaChange
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
          object DBLCBAResponsable: TDBLookupComboBoxAuto
            Left = 310
            Top = 56
            Width = 199
            Height = 23
            Color = clWhite
            DropDownRows = 20
            KeyField = 'ID_EMPLEADO'
            ListField = 'NOMBRE'
            ListSource = DMSoftvet.DSResponsable
            TabOrder = 1
            EsClave = False
            EsRequerido = False
            ISParam = True
          end
        end
        inherited GBObservaciones: TGroupBox
          Top = 165
          Height = 235
          inherited MAObservacion: TMemoAuto
            Width = 934
            Height = 59
          end
        end
      end
    end
    inherited PBotones: TPanel
      inherited JvIAyuda: TJvImage
        Top = 3
      end
      inherited BBCancelar: TBitBtn
        Left = 629
        Top = 8
      end
      inherited BBAnterior: TBitBtn
        Left = 720
        Top = 8
      end
      inherited BBSiguiente: TBitBtn
        Left = 812
        Top = 8
      end
      inherited BBTerminar: TBitBtn
        Left = 904
        Top = 8
      end
      inherited BBAyuda: TBitBtn
        Left = 13
        Top = 97
      end
      inherited BIngresoSecuenciado: TBitBtn
        Left = 269
        Top = 109
      end
      inherited BSacarAnimal: TBitBtn
        Left = 247
        Top = 109
        Width = 177
        Anchors = [akLeft, akTop, akRight]
      end
      inherited BBXls: TBitBtn
        Left = 57
        Top = 94
      end
      inherited BBXlsImport: TBitBtn
        Visible = False
      end
    end
  end
  inherited PTitulo: TPanel
    inherited LTipoVersionLicenciaDerecha: TJvLabel
      Left = 196
      Top = 34
    end
  end
end
