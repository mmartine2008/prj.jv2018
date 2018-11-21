unit UREPCierreLotePrev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls,
  jpeg, PngImage, ExtCtrls, StdCtrls, JvGIF, QuickRpt, QRCtrls, ImgList,
  PngImageList, JvExControls, JvLabel;

type
  TFREPCierreLotePrev = class(TFUniversal)
    QRCierreLote: TQuickRep;
    QRBand1: TQRBand;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRAlimentacion: TQuickRep;
    QRBand3: TQRBand;
    QRImage1: TQRImage;
    QRLabel38: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresaAlimentacion: TQRLabel;
    QRLPropietarioAlimentacion: TQRLabel;
    QRLRenglon2Alimentacion: TQRLabel;
    QRLRenglon1Alimentacion: TQRLabel;
    QRLNomEstaAlimentacion: TQRLabel;
    QRImagenAlimentacion: TQRImage;
    QRBand4: TQRBand;
    QRShape10: TQRShape;
    QRLabel44: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel45: TQRLabel;
    QRLRenglon1AAlimentacion: TQRLabel;
    QRLRenglon2AAlimentacion: TQRLabel;
    QRCRCierreLote: TQRCompositeReport;
    QRBand2: TQRBand;
    QRShape68: TQRShape;
    QRShape67: TQRShape;
    QRShape66: TQRShape;
    QRShape65: TQRShape;
    QRShape64: TQRShape;
    QRShape63: TQRShape;
    QRShape62: TQRShape;
    QRShape61: TQRShape;
    QRShape60: TQRShape;
    QRShape6: TQRShape;
    QRShape59: TQRShape;
    QRShape51: TQRShape;
    QRShape50: TQRShape;
    QRShape49: TQRShape;
    QRShape48: TQRShape;
    QRShape47: TQRShape;
    QRShape46: TQRShape;
    QRShape45: TQRShape;
    QRShape44: TQRShape;
    QRShape43: TQRShape;
    QRShape42: TQRShape;
    QRShape41: TQRShape;
    QRShape40: TQRShape;
    QRShape39: TQRShape;
    QRShape38: TQRShape;
    QRShape37: TQRShape;
    QRShape34: TQRShape;
    QRShape33: TQRShape;
    QRShape32: TQRShape;
    QRShape2: TQRShape;
    QRLPromKgConv: TQRLabel;
    QRLPromIng: TQRLabel;
    QRLPrecioAlimMT: TQRLabel;
    QRLPorcConsumo: TQRLabel;
    QRLMuertos: TQRLabel;
    QRLKGSalidos: TQRLabel;
    QRLKGPromSalidos: TQRLabel;
    QRLKgAumentado: TQRLabel;
    QRLIngreso1: TQRLabel;
    QRLIngreso: TQRLabel;
    QRLIngresado: TQRLabel;
    QRLDiasProm: TQRLabel;
    QRLCostoTotaAni: TQRLabel;
    QRLCostoSaniAni: TQRLabel;
    QRLCostoHotelAni: TQRLabel;
    QRLCostoAliAnimal: TQRLabel;
    QRLConversion: TQRLabel;
    QRLConsumoTotalTC: TQRLabel;
    QRLConsumoTotalMS: TQRLabel;                                           
    QRLConsumoDiarioCabTC: TQRLabel;
    QRLConsumoDiarioCabMS: TQRLabel;
    QRLConsumoDiario: TQRLabel;
    QRLAumentoPromedio: TQRLabel;
    QRLAumentoDiario: TQRLabel;
    QRLAnimalesSalidos: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel19: TQRLabel;
    QREntradas: TQuickRep;
    QRBand7: TQRBand;
    QRImage3: TQRImage;
    QRLabel40: TQRLabel;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRSysData4: TQRSysData;
    QRLEmpresaEntrada: TQRLabel;
    QRLPropietarioEntrada: TQRLabel;
    QRLRenglon2Entrada: TQRLabel;
    QRLRenglon1Entrada: TQRLabel;
    QRLNomEstaEntrada: TQRLabel;
    QRImagenEntrada: TQRImage;
    QRBand8: TQRBand;
    QRShape71: TQRShape;
    QRLabel62: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel63: TQRLabel;
    QRLRenglon1AEntrada: TQRLabel;
    QRLRenglon2AEntrada: TQRLabel;
    QRBand9: TQRBand;
    QRLabel5: TQRLabel;
    QRShape11: TQRShape;
    QRLabel6: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel9: TQRLabel;
    QRShape14: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand10: TQRBand;
    QRShape5: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRSalidas: TQuickRep;
    QRBand11: TQRBand;
    QRImage5: TQRImage;
    QRLabel66: TQRLabel;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRSysData6: TQRSysData;
    QRLEmpresaSalida: TQRLabel;
    QRLPropietarioSalida: TQRLabel;
    QRLRenglon2Salida: TQRLabel;
    QRLRenglon1Salida: TQRLabel;
    QRLNomEstaSalida: TQRLabel;
    QRImagenSalida: TQRImage;
    QRBand12: TQRBand;
    QRShape77: TQRShape;
    QRLabel72: TQRLabel;
    QRSysData7: TQRSysData;
    QRLabel73: TQRLabel;
    QRLRenglon1ASalida: TQRLabel;
    QRLRenglon2ASalida: TQRLabel;
    QRBand13: TQRBand;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRShape80: TQRShape;
    QRLabel78: TQRLabel;
    QRLabel80: TQRLabel;
    QRBand14: TQRBand;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape86: TQRShape;
    QRLabel81: TQRLabel;
    QRShape87: TQRShape;
    QRDBText9: TQRDBText;
    QRShape89: TQRShape;
    QRSanidad: TQuickRep;
    QRBand15: TQRBand;
    QRImage7: TQRImage;
    QRLabel11: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRSysData8: TQRSysData;
    QRLEmpresaSanidad: TQRLabel;
    QRLPropietarioSanidad: TQRLabel;
    QRLRenglon2Sanidad: TQRLabel;
    QRLRenglon1Sanidad: TQRLabel;
    QRLNomEstaSanidad: TQRLabel;
    QRImagenSanidad: TQRImage;
    QRBand16: TQRBand;
    QRShape17: TQRShape;
    QRLabel17: TQRLabel;
    QRSysData9: TQRSysData;
    QRLabel83: TQRLabel;
    QRLRenglon1ASanidad: TQRLabel;
    QRLRenglon2ASanidad: TQRLabel;
    QRBand17: TQRBand;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRShape100: TQRShape;
    QRMuertes: TQuickRep;
    QRBand19: TQRBand;
    QRImage9: TQRImage;
    QRLabel7: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRSysData10: TQRSysData;
    QRLEmpresaMuerte: TQRLabel;
    QRLPropietarioMuerte: TQRLabel;
    QRLRenglon2Muerte: TQRLabel;
    QRLRenglon1Muerte: TQRLabel;
    QRLNomEstaMuerte: TQRLabel;
    QRImagenMuerte: TQRImage;
    QRBand20: TQRBand;
    QRShape31: TQRShape;
    QRLabel31: TQRLabel;
    QRSysData11: TQRSysData;
    QRLabel32: TQRLabel;
    QRLRenglon1AMuerte: TQRLabel;
    QRLRenglon2AMuerte: TQRLabel;
    QRBand21: TQRBand;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRBand22: TQRBand;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape90: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRBand24: TQRBand;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRShape99: TQRShape;
    QRShape52: TQRShape;
    QRShape36: TQRShape;
    QRShape35: TQRShape;
    QRShape108: TQRShape;
    QRShape107: TQRShape;
    QRShape106: TQRShape;
    QRLValorHoteleria: TQRLabel;
    QRLTotalHotel: TQRLabel;
    QRLDiasCabeza: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel110: TQRLabel;
    QRDias: TQuickRep;
    QRBand23: TQRBand;
    QRImage4: TQRImage;
    QRLabel8: TQRLabel;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRSysData12: TQRSysData;
    QRLEmpresaDias: TQRLabel;
    QRLPropietarioDias: TQRLabel;
    QRLRenglon2Dias: TQRLabel;
    QRLRenglon1Dias: TQRLabel;
    QRLNomEstaDias: TQRLabel;
    QRImagenDias: TQRImage;
    QRBand25: TQRBand;
    QRShape96: TQRShape;
    QRLabel18: TQRLabel;
    QRSysData13: TQRSysData;
    QRLabel24: TQRLabel;
    QRLRenglon1ADias: TQRLabel;
    QRLRenglon2ADias: TQRLabel;
    QRBand26: TQRBand;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape109: TQRShape;
    QRBand27: TQRBand;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRGroup1: TQRGroup;
    Racion1: TQRLabel;
    QRShape25: TQRShape;
    QRShape24: TQRShape;
    QRShape23: TQRShape;
    QRShape22: TQRShape;
    Precio1: TQRLabel;
    Costo1: TQRLabel;
    Consumo1: TQRLabel;
    IBQRaciones: TIBQuery;
    QRBand6: TQRBand;
    QRLabel48: TQRLabel;
    QRShape101: TQRShape;
    QRLabel12: TQRLabel;
    QRShape110: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText27: TQRDBText;
    IBQDetalleAlimentacion: TIBQuery;
    IBQDetalleAlimentacionSUM: TLargeintField;
    IBQDetalleAlimentacionAVG: TLargeintField;
    IBQDetalleAlimentacionCOUNT: TIntegerField;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel30: TQRLabel;
    IBQDetalleAlimentacionSUM1: TFloatField;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    IBQDetalleAlimentacionGCIA: TFloatField;
    IBQDetalleAlimentacionCOSTO_KG: TFloatField;
    QRLabel50: TQRLabel;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRShape124: TQRShape;
    QRShape126: TQRShape;
    QRShape127: TQRShape;
    QRExpr1: TQRExpr;
    IBQDetalleAlimentacionRACION: TIntegerField;
    QRLabel55: TQRLabel;
    QRDBText28: TQRDBText;
    QRShape128: TQRShape;
    QRLabel56: TQRLabel;
    QRShape130: TQRShape;
    QRDBText34: TQRDBText;
    QRLabel58: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape81: TQRShape;
    QRLabel64: TQRLabel;
    QRLExistenciaPromedio: TQRLabel;
    QRExpr2: TQRExpr;
    QRShape88: TQRShape;
    QRLabel42: TQRLabel;
    QRBand18: TQRBand;
    QRShape125: TQRShape;
    QRShape115: TQRShape;
    QRShape7: TQRShape;
    QRDBText11: TQRDBText;
    QRShape26: TQRShape;
    QRDBText12: TQRDBText;
    QRShape27: TQRShape;
    QRDBText13: TQRDBText;
    QRShape28: TQRShape;
    QRDBText14: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText10: TQRDBText;
    IBQRacionesRACION: TIntegerField;
    IBQRacionesCANT_ANIMALES: TIBBCDField;
    IBQRacionesNOMBRE: TIBStringField;
    IBQRacionesPORC_MS: TIBBCDField;
    IBQRacionesKL_MS: TIBBCDField;
    IBQRacionesPRECIO: TIBBCDField;
    IBQRacionesFECHA_INGRESO: TDateField;
    IBQRacionesCONSUMO_TC: TIBBCDField;
    IBQRacionesPORC_USADO: TIBBCDField;
    IBQRacionesCANT_DIAS: TIntegerField;
    IBQRacionesNOMBRE_RACION: TIBStringField;
    IBQRacionesFECHA_FIN_R: TDateField;
    IBQRacionesNRO_RACION: TIntegerField;
    IBQRacionesTOTAL_USADO: TIBBCDField;
    IBQRacionAux: TIBQuery;
    IBQRacionesUSADO: TFloatField;
    IBQRacionesCOSTAL_TOTAL: TFloatField;
    IBQRacionAuxNRO_RACION: TIntegerField;
    IBQRacionAuxCOSTUDO: TIBBCDField;
    IBQRacionAuxUSADO: TIBBCDField;
    IBQRacionesCOSTO: TIBBCDField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure QRCRCierreLoteAddReports(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  

  private
    procedure cargarDatosPropietario;
  public
    Muertes, Sanidad, Entradas, Salidas, Alimentacion, Detalle : Boolean;
  end;

var
  FREPCierreLotePrev: TFREPCierreLotePrev;

implementation

{$R *.dfm}

uses URepGeneral, UPrincipal, UREPCierreLote,UTiposGlobales;

procedure TFREPCierreLotePrev.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage5.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage7.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage9.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage4.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLNomEstaAlimentacion.Caption := FPrincipal.NombreEstablecimiento;
  QRLNomEstaEntrada.Caption := FPrincipal.NombreEstablecimiento;
  QRLNomEstaMuerte.Caption := FPrincipal.NombreEstablecimiento;
  QRLNomEstaSalida.Caption := FPrincipal.NombreEstablecimiento;
  QRLNomEstaSanidad.Caption := FPrincipal.NombreEstablecimiento;
  QRLNomEstaDias.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon2Alimentacion.Enabled := true;
      QRLRenglon1Alimentacion.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2Alimentacion.Caption := FPrincipal.Renspa;

      QRLRenglon2Entrada.Enabled := true;
      QRLRenglon1Entrada.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2Entrada.Caption := FPrincipal.Renspa;

      QRLRenglon2Salida.Enabled := true;
      QRLRenglon1Salida.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2Salida.Caption := FPrincipal.Renspa;

      QRLRenglon2Sanidad.Enabled := true;
      QRLRenglon1Sanidad.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2Sanidad.Caption := FPrincipal.Renspa;

      QRLRenglon2Muerte.Enabled := true;
      QRLRenglon1Muerte.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2Muerte.Caption := FPrincipal.Renspa;

      QRLRenglon2Dias.Enabled := true;
      QRLRenglon1Dias.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2Dias.Caption := FPrincipal.Renspa;

    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon2Alimentacion.Enabled := true;
      QRLRenglon1Alimentacion.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2Alimentacion.Caption := FPrincipal.Renspa;

      QRLRenglon2Entrada.Enabled := true;
      QRLRenglon1Entrada.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2Entrada.Caption := FPrincipal.Renspa;

      QRLRenglon2Salida.Enabled := true;
      QRLRenglon1Salida.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2Salida.Caption := FPrincipal.Renspa;

      QRLRenglon2Sanidad.Enabled := true;
      QRLRenglon1Sanidad.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2Sanidad.Caption := FPrincipal.Renspa;

      QRLRenglon2Muerte.Enabled := true;
      QRLRenglon1Muerte.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2Muerte.Caption := FPrincipal.Renspa;

      QRLRenglon2Dias.Enabled := true;
      QRLRenglon1Dias.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2Dias.Caption := FPrincipal.Renspa;
    end;
  cargarDatosPropietario();
end;

procedure TFREPCierreLotePrev.cargarDatosPropietario;
var
  repGeneral : TFRepGeneral;
begin
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();

  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';

  QRLPropietarioAlimentacion.Caption:= '';
  QRLEmpresaAlimentacion.Caption:= '';
  QRLRenglon1AAlimentacion.Caption:= '';
  QRLRenglon2AAlimentacion.Caption:= '';

  QRLPropietarioEntrada.Caption:= '';
  QRLEmpresaEntrada.Caption:= '';
  QRLRenglon1AEntrada.Caption:= '';
  QRLRenglon2AEntrada.Caption:= '';

  QRLPropietarioMuerte.Caption:= '';
  QRLEmpresaMuerte.Caption:= '';
  QRLRenglon1AMuerte.Caption:= '';
  QRLRenglon2AMuerte.Caption:= '';

  QRLPropietarioSalida.Caption:= '';
  QRLEmpresaSalida.Caption:= '';
  QRLRenglon1ASalida.Caption:= '';
  QRLRenglon2ASalida.Caption:= '';

  QRLPropietarioSanidad.Caption:= '';
  QRLEmpresaSanidad.Caption:= '';
  QRLRenglon1ASanidad.Caption:= '';
  QRLRenglon2ASanidad.Caption:= '';

  QRLPropietarioDias.Caption:= '';
  QRLEmpresaDias.Caption:= '';
  QRLRenglon1ADias.Caption:= '';
  QRLRenglon2ADias.Caption:= '';

  if (Trim(repGeneral.getNombrePropietario) <> '') then
    begin
      QRLRenglon1.Enabled:= false;
      QRLNombrePropietario.Enabled:= true;

      QRLRenglon1AAlimentacion.Enabled:= false;
      QRLPropietarioAlimentacion.Enabled:= true;

      QRLRenglon1AEntrada.Enabled:= false;
      QRLPropietarioEntrada.Enabled:= true;

      QRLRenglon1AMuerte.Enabled:= false;
      QRLPropietarioMuerte.Enabled:= true;

      QRLRenglon1ASalida.Enabled:= false;
      QRLPropietarioSalida.Enabled:= true;

      QRLRenglon1ASanidad.Enabled:= false;
      QRLPropietarioSanidad.Enabled:= true;

      QRLRenglon1ADias.Enabled:= false;
      QRLPropietarioDias.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;

       QRLRenglon1AAlimentacion.Enabled:= true;
       QRLPropietarioAlimentacion.Enabled:= false;

       QRLRenglon1AEntrada.Enabled:= true;
       QRLPropietarioEntrada.Enabled:= false;

       QRLRenglon1AMuerte.Enabled:= true;
       QRLPropietarioMuerte.Enabled:= false;

       QRLRenglon1ASalida.Enabled:= true;
       QRLPropietarioSalida.Enabled:= false;

       QRLRenglon1ASanidad.Enabled:= true;
       QRLPropietarioSanidad.Enabled:= false;

       QRLRenglon1ADias.Enabled:= true;
       QRLPropietarioDias.Enabled:= false;
     end;

  if (Trim(repGeneral.getDireccionPropietario) <> '') then
  begin
    QRLDatosAbajo.Caption := QRLDatosAbajo.Caption + repGeneral.getDireccionPropietario + ' - ';
    QRLRenglon1AAlimentacion.Caption := QRLRenglon1AAlimentacion.Caption + repGeneral.getDireccionPropietario + ' - ';
    QRLRenglon1AEntrada.Caption := QRLRenglon1AEntrada.Caption + repGeneral.getDireccionPropietario + ' - ';
    QRLRenglon1AMuerte.Caption := QRLRenglon1AMuerte.Caption + repGeneral.getDireccionPropietario + ' - ';
    QRLRenglon1ASalida.Caption := QRLRenglon1ASalida.Caption + repGeneral.getDireccionPropietario + ' - ';
    QRLRenglon1ASanidad.Caption := QRLRenglon1ASanidad.Caption + repGeneral.getDireccionPropietario + ' - ';
    QRLRenglon1ADias.Caption := QRLRenglon1ADias.Caption + repGeneral.getDireccionPropietario + ' - ';
  end;
  if (Trim(repGeneral.getTelefonoPropietario) <> '') then
  begin
    QRLDatosAbajo.Caption := QRLDatosAbajo.Caption + repGeneral.getTelefonoPropietario + ' - ';
    QRLRenglon1AAlimentacion.Caption := QRLRenglon1AAlimentacion.Caption + repGeneral.getTelefonoPropietario + ' - ';
    QRLRenglon1AEntrada.Caption := QRLRenglon1AEntrada.Caption + repGeneral.getTelefonoPropietario + ' - ';
    QRLRenglon1AMuerte.Caption := QRLRenglon1AMuerte.Caption + repGeneral.getTelefonoPropietario + ' - ';
    QRLRenglon1ASalida.Caption := QRLRenglon1ASalida.Caption + repGeneral.getTelefonoPropietario + ' - ';
    QRLRenglon1ASanidad.Caption := QRLRenglon1ASanidad.Caption + repGeneral.getTelefonoPropietario + ' - ';
    QRLRenglon1ADias.Caption := QRLRenglon1ADias.Caption + repGeneral.getDireccionPropietario + ' - ';
  end;
  if (Trim(repGeneral.getCelularPropietario) <> '') then
  begin
    QRLDatosAbajo.Caption := QRLDatosAbajo.Caption + repGeneral.getCelularPropietario + ' - ';
    QRLRenglon1AAlimentacion.Caption := QRLRenglon1AAlimentacion.Caption + repGeneral.getCelularPropietario + ' - ';
    QRLRenglon1AEntrada.Caption := QRLRenglon1AEntrada.Caption + repGeneral.getCelularPropietario + ' - ';
    QRLRenglon1AMuerte.Caption := QRLRenglon1AMuerte.Caption + repGeneral.getCelularPropietario + ' - ';
    QRLRenglon1ASalida.Caption := QRLRenglon1ASalida.Caption + repGeneral.getCelularPropietario + ' - ';
    QRLRenglon1ASanidad.Caption := QRLRenglon1ASanidad.Caption + repGeneral.getCelularPropietario + ' - ';
    QRLRenglon1ADias.Caption := QRLRenglon1ADias.Caption + repGeneral.getDireccionPropietario + ' - ';
  end;
  if (Trim(repGeneral.getEmailPropietario) <> '') then
  begin
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getEmailPropietario + ' - ';
    QRLRenglon2AAlimentacion.Caption := QRLRenglon2AAlimentacion.Caption + repGeneral.getEmailPropietario + ' - ';
    QRLRenglon2AEntrada.Caption := QRLRenglon2AEntrada.Caption + repGeneral.getEmailPropietario + ' - ';
    QRLRenglon2AMuerte.Caption := QRLRenglon2AMuerte.Caption + repGeneral.getEmailPropietario + ' - ';
    QRLRenglon2ASalida.Caption := QRLRenglon2ASalida.Caption + repGeneral.getEmailPropietario + ' - ';
    QRLRenglon2ASanidad.Caption := QRLRenglon2ASanidad.Caption + repGeneral.getEmailPropietario + ' - ';
    QRLRenglon2ADias.Caption := QRLRenglon2ADias.Caption + repGeneral.getDireccionPropietario + ' - ';
  end;
  if (Trim(repGeneral.getUrlPropietario) <> '') then
  begin
    QRLDatosAbajo2.Caption := QRLDatosAbajo2.Caption + repGeneral.getUrlPropietario + ' - ';
    QRLRenglon2AAlimentacion.Caption := QRLRenglon2AAlimentacion.Caption + repGeneral.getUrlPropietario + ' - ';
    QRLRenglon2AEntrada.Caption := QRLRenglon2AEntrada.Caption + repGeneral.getUrlPropietario + ' - ';
    QRLRenglon2AMuerte.Caption := QRLRenglon2AMuerte.Caption + repGeneral.getUrlPropietario + ' - ';
    QRLRenglon2ASalida.Caption := QRLRenglon2ASalida.Caption + repGeneral.getUrlPropietario + ' - ';
    QRLRenglon2ASanidad.Caption := QRLRenglon2ASanidad.Caption + repGeneral.getUrlPropietario + ' - ';
    QRLRenglon2ADias.Caption := QRLRenglon2ADias.Caption + repGeneral.getDireccionPropietario + ' - ';
  end;

  if (FileExists(repGeneral.getPathImage)) then
    begin
      QRImagenEmpresa.Picture.LoadFromFile(repGeneral.getPathImage);
      QRImagenAlimentacion.Picture.LoadFromFile(repGeneral.getPathImage);
      QRImagenEntrada.Picture.LoadFromFile(repGeneral.getPathImage);
      QRImagenMuerte.Picture.LoadFromFile(repGeneral.getPathImage);
      QRImagenSalida.Picture.LoadFromFile(repGeneral.getPathImage);
      QRImagenSanidad.Picture.LoadFromFile(repGeneral.getPathImage);
      QRImagenDias.Picture.LoadFromFile(repGeneral.getPathImage);
    end;
  repGeneral.Destroy;
end;

procedure TFREPCierreLotePrev.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  QRCRCierreLote.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPCierreLotePrev.QRCRCierreLoteAddReports(Sender: TObject);
begin
  inherited;
  QRCRCierreLote.Reports.Clear;
  QRCRCierreLote.Reports.Add(QRCierreLote);
  if Entradas then
    QRCRCierreLote.Reports.Add(QREntradas);
  if Salidas then
    QRCRCierreLote.Reports.Add(QRSalidas);
  if Alimentacion then
    QRCRCierreLote.Reports.Add(QRAlimentacion);
  if Sanidad then
    QRCRCierreLote.Reports.Add(QRSanidad);
  if Muertes then
    QRCRCierreLote.Reports.Add(QRMuertes);
  if Detalle then
    QRCRCierreLote.Reports.Add(QRDias);
end;

procedure TFREPCierreLotePrev.FormCreate(Sender: TObject);
begin
  inherited;
  Muertes := false;
  Sanidad := false;
  Entradas := false;
  Salidas := false;
  Alimentacion := false;
  Detalle := false;
end;

end.
