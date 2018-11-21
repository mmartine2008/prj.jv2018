unit URepDetalleSemenAnimal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, WinXP, DataExport, DataToXLS, DB, IBCustomDataSet,
  IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls, DateTimePickerAuto,
  DBCtrls, UDBLookupComboBoxAuto, Grids, DBGrids, UBDBGrid, ComboBoxAuto,
  Buttons, Series, TeEngine, TeeProcs, Chart, DbChart, UPrincipal, IBQuery,
  UDMSoftvet, TeeFunci, UREPInfoGralGestPreview, QuickRpt, QRCtrls, UCartel,
  QRExport, QRPDFFilt, QRPrntr, DateUtils, Types, UMensajeImpresora, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFRepDetalleSemenAnimal = class(TFUniversal)
    QRDetalleSemenAnimal: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage1: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRShape11: TQRShape;
    QRShape15: TQRShape;
    QRSysData3: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRBand1: TQRBand;
    QRBand6: TQRBand;
    QRShape22: TQRShape;
    QRLabel20: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2B: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    IBQDatosIniciales: TIBQuery;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLDosisAportadasValue: TQRLabel;
    QRLDosisActualesValue: TQRLabel;
    QRLDosisVendidasValue: TQRLabel;
    QRLDosisBonificadasValue: TQRLabel;
    QRLDosisDesechadasValue: TQRLabel;
    QRLDosisIATFValue: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLRazaAnimalValue: TQRLabel;
    QRLColorAnimalValue: TQRLabel;
    IBQDatosAnimal: TIBQuery;
    IBQHistoricoExtraccion: TIBQuery;
    QRLabel35: TQRLabel;
    QRLDosisAjustadasValue: TQRLabel;
    QRLFechaAjuste: TQRLabel;
    QRLFechaAjusteValue: TQRLabel;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape54: TQRShape;
    QRShape53: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRLabel74: TQRLabel;
    QRLTotalExtraccionesValue: TQRLabel;
    QRDatosExtracciones: TQuickRep;
    QRBand2: TQRBand;
    QRSSuperior: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape25: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRShape29: TQRShape;
    QRShape42: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRShape37: TQRShape;
    QRShape33: TQRShape;
    QRShape41: TQRShape;
    QRShape26: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel34: TQRLabel;
    DBCResultadosExtraccion: TDBChart;
    DBCColorSemen: TDBChart;
    QRCRHistorico: TQRCompositeReport;
    QRGraficos: TQuickRep;
    QRBand4: TQRBand;
    QRBand3: TQRBand;
    QRImage2: TQRImage;
    QRLabel75: TQRLabel;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRSysData3B: TQRSysData;
    QRLEmpresaB: TQRLabel;
    QRLNombrePropietarioB: TQRLabel;
    QRLRenglon2B: TQRLabel;
    QRLEstablecimientosB: TQRLabel;
    QRImage3: TQRImage;
    DBCVigoresSemen: TDBChart;
    DBCConcentracionSemen: TDBChart;
    QRBand5: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLDatosAbajoB: TQRLabel;
    QRLDatosAbajo2B: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLElectroValue: TQRLabel;
    QRLMontaValue: TQRLabel;
    QRLOtroValue: TQRLabel;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRShape5: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape6: TQRShape;
    DBCMetodosToma: TDBChart;
    DBCGeneral: TDBChart;
    QRLabel4: TQRLabel;
    QRLDosisRechazadasValue: TQRLabel;
    QRShape7: TQRShape;
    QRSInferior: TQRShape;
    QRSLateral: TQRShape;
    QRSIATF: TQRShape;
    QRSApto: TQRShape;
    QRSCuestionable: TQRShape;
    QRSRechazados: TQRShape;
    QRSPendientes: TQRShape;
    QRSBM: TQRShape;
    QRSBCO: TQRShape;
    QRSAM: TQRShape;
    QRSAC: TQRShape;
    QRSDIL: TQRShape;
    QRSUC: TQRShape;
    QRSCS: TQRShape;
    QRSV1: TQRShape;
    QRSV1M: TQRShape;
    QRSV2: TQRShape;
    QRSV2M: TQRShape;
    QRSV3: TQRShape;
    QRSV3M: TQRShape;
    QRSV4: TQRShape;
    QRSV4M: TQRShape;
    QRSV5: TQRShape;
    QRSV5M: TQRShape;
    QRSC300: TQRShape;
    QRSC400: TQRShape;
    QRSC500: TQRShape;
    QRSC600: TQRShape;
    QRSC700: TQRShape;
    QRSC800: TQRShape;
    QRSC900: TQRShape;
    QRSC1000: TQRShape;
    QRSC1100: TQRShape;
    QRSC1200: TQRShape;
    QRSC1300: TQRShape;
    QRSC1400: TQRShape;
    QRSC1500: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLPendientesValue: TQRLabel;
    QRLabel146: TQRLabel;
    QRShape64: TQRShape;
    QRLAptoIATFValue: TQRLabel;
    QRLAptoValue: TQRLabel;
    QRLCuestionableValue: TQRLabel;
    QRLRechazosValue: TQRLabel;
    QRShape89: TQRShape;
    QRShape98: TQRShape;
    QRShape87: TQRShape;
    QRShape86: TQRShape;
    QRLabel145: TQRLabel;
    QRShape85: TQRShape;
    QRShape88: TQRShape;
    QRShape66: TQRShape;
    QRLabel90: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLBlancoMarfilValue: TQRLabel;
    QRLBlancoValue: TQRLabel;
    QRLAmarilloValue: TQRLabel;
    QRLAcuosoValue: TQRLabel;
    QRLDiluidoValue: TQRLabel;
    QRLConSangreValue: TQRLabel;
    QRLSucioValue: TQRLabel;
    QRShape107: TQRShape;
    QRShape65: TQRShape;
    QRShape71: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape106: TQRShape;
    QRShape108: TQRShape;
    QRLabel101: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLUnoValue: TQRLabel;
    QRLUnoMasValue: TQRLabel;
    QRLDosValue: TQRLabel;
    QRLDosMasValue: TQRLabel;
    QRLTresValue: TQRLabel;
    QRLTresMasValue: TQRLabel;
    QRLCuatroValue: TQRLabel;
    QRLCuatroMasValue: TQRLabel;
    QRLCincoValue: TQRLabel;
    QRLCincoMasValue: TQRLabel;
    QRShape74: TQRShape;
    QRShape84: TQRShape;
    QRShape83: TQRShape;
    QRShape82: TQRShape;
    QRShape81: TQRShape;
    QRShape80: TQRShape;
    QRShape79: TQRShape;
    QRShape78: TQRShape;
    QRShape77: TQRShape;
    QRShape76: TQRShape;
    QRShape75: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRLabel134: TQRLabel;
    QRShape102: TQRShape;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLCon300: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLCon400: TQRLabel;
    QRLCon500: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLCon600: TQRLabel;
    QRLCon700: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLCon800: TQRLabel;
    QRLCon900: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRLCon1000: TQRLabel;
    QRLCon1100: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLCon1200: TQRLabel;
    QRLCon1300: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLCon1400: TQRLabel;
    QRLCon1500: TQRLabel;
    QRLabel137: TQRLabel;
    QRShape105: TQRShape;
    QRShape104: TQRShape;
    QRShape103: TQRShape;
    QRShape63: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRBand7: TQRBand;
    QRShape10: TQRShape;
    QRLabel5: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel6: TQRLabel;
    QRLDatosAbajo1: TQRLabel;
    QRLDatosAbajo12: TQRLabel;
    QRBand8: TQRBand;
    QRImage4: TQRImage;
    QRLabel11: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRSysData5: TQRSysData;
    QRLEmpresa1: TQRLabel;
    QRLNombrePropietario1: TQRLabel;
    QRLRenglon21: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRImagenEmpresa2: TQRImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QRCRHistoricoAddReports(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }

    Resultados, Colores, Vigores, Concentracion, Metodos, Generales : TPieSeries;

    procedure cargarDatosPropietario;
    procedure ArmarDatosGenerales;

    procedure CrearSeries;
    procedure ArmarSeries;
    procedure GuardarGraficos;
  public
    { Public declarations }
    id_animal : integer;
  end;

var
  FRepDetalleSemenAnimal: TFRepDetalleSemenAnimal;
  Dir : string;

implementation

uses URepGeneral, uTiposGlobales;

{$R *.dfm}

procedure TFRepDetalleSemenAnimal.CrearSeries;
begin
 
  Resultados := TPieSeries.Create(nil);
  Resultados.Marks.Style := smsPercent;

  Colores := TPieSeries.Create(nil);
  Colores.Marks.Style := smsPercent;

  Vigores := TPieSeries.Create(nil);
  Vigores.Marks.Style := smsPercent;

  Concentracion := TPieSeries.Create(nil);
  Concentracion.Marks.Style := smsPercent;

  Metodos := TPieSeries.Create(nil);
  Metodos.Marks.Style := smsPercent;

  Generales := TPieSeries.Create(nil);
  Generales.Marks.Style := smsPercent;

{  Resultados.Name := 'Resultados';
  Resultados.SeriesColor := $00D5F3FF;
  Resultados.Marks.Visible := true;
  Resultados.PercentFormat := '#0.# %';
  Resultados.Marks.Style := smsPercent;
  Resultados.Marks.Font.Size := 6;
  Resultados.Marks.Transparent := false;
  Resultados.Marks.Clip := true;
  Resultados.Marks.ArrowLength := 5;
  Resultados.Marks.BackColor := clWhite;
  Resultados.OnGetMarkText := GetMarkText;}

end;

procedure TFRepDetalleSemenAnimal.ArmarSeries;
begin

 { Resultados.Clear;
  DBCResultadosExtraccion.AddSeries(Resultados);
  Resultados.Marks.BackColor := clWhite;
  Resultados.Marks.Font.Name := 'Arial';
  Resultados.Marks.Font.Size := 10;
  Resultados.Add(IBQDatosIniciales.FieldValues['porc_apto_iatf'],'Apto IATF',RGB(150, 200, 200));
  QRSIATF.Brush.Color := RGB(150, 200, 200);
  Resultados.Add(IBQDatosIniciales.FieldValues['porc_apto'],'Apto',RGB(100, 200, 150));
  QRSApto.Brush.Color := RGB(100, 200, 150);
  Resultados.Add(IBQDatosIniciales.FieldValues['porc_cuestionable'],'Cuestionable',RGB(185, 230, 210));
  QRSCuestionable.Brush.Color := RGB(185, 230, 210);
  Resultados.Add(IBQDatosIniciales.FieldValues['porc_rechazado'],'Rechazado',RGB(200, 215, 200));
  QRSRechazados.Brush.Color := RGB(200, 215, 200);
  Resultados.Add(IBQDatosIniciales.FieldValues['porc_pendientes'],'Pendientes',RGB(200, 225, 190));
  QRSPendientes.Brush.Color := RGB(200, 225, 190);


  Colores.Clear;
  DBCColorSemen.AddSeries(Colores);
  Colores.Marks.BackColor := clWhite;
  Colores.Marks.Font.Name := 'Arial';
  Colores.Marks.Font.Size := 10;
  Colores.Add(IBQDatosIniciales.FieldValues['porc_col_bm'],'Blanco Marfil',RGB(150, 200, 200));
  QRSBM.Brush.Color := RGB(150, 200, 200);
  Colores.Add(IBQDatosIniciales.FieldValues['porc_col_bco'],'Blanco',RGB(100, 200, 150));
  QRSBCO.Brush.Color := RGB(100, 200, 150);
  Colores.Add(IBQDatosIniciales.FieldValues['porc_col_am'],'Amarillo',RGB(185, 230, 210));
  QRSAM.Brush.Color := RGB(185, 230, 210);
  Colores.Add(IBQDatosIniciales.FieldValues['porc_col_ac'],'Acuoso',RGB(200, 215, 200));
  QRSAC.Brush.Color := RGB(200, 215, 200);
  Colores.Add(IBQDatosIniciales.FieldValues['porc_col_dil'],'Diluido',RGB(200, 225, 190));
  QRSDIL.Brush.Color := RGB(200, 225, 190);
  Colores.Add(IBQDatosIniciales.FieldValues['porc_col_suc'],'Sucio',RGB(200, 235, 180));
  QRSUC.Brush.Color := RGB(200, 235, 180);
  Colores.Add(IBQDatosIniciales.FieldValues['porc_col_san'],'Con sangre',RGB(150, 200, 170));
  QRSCS.Brush.Color := RGB(150, 200, 170);

  Vigores.Clear;
  DBCVigoresSemen.AddSeries(Vigores);
  Vigores.Marks.BackColor := clWhite;
  Vigores.Marks.Font.Name := 'Arial';
  Vigores.Marks.Font.Size := 10;
  Vigores.Add(IBQDatosIniciales.FieldValues['porc_vig_1'],'1',RGB(150, 200, 200));
  QRSV1.Brush.Color := RGB(150, 200, 200);
  Vigores.Add(IBQDatosIniciales.FieldValues['porc_vig_1M'],'1+',RGB(100, 200, 150));
  QRSV1M.Brush.Color := RGB(100, 200, 150);
  Vigores.Add(IBQDatosIniciales.FieldValues['porc_vig_2'],'2',RGB(185, 230, 210));
  QRSV2.Brush.Color := RGB(185, 230, 210);
  Vigores.Add(IBQDatosIniciales.FieldValues['porc_vig_2M'],'2+',RGB(200, 215, 200));
  QRSV2M.Brush.Color := RGB(200, 215, 200);
  Vigores.Add(IBQDatosIniciales.FieldValues['porc_vig_3'],'3',RGB(200, 225, 190));
  QRSV3.Brush.Color := RGB(200, 225, 190);
  Vigores.Add(IBQDatosIniciales.FieldValues['porc_vig_3M'],'3+',RGB(200, 235, 180));
  QRSV3M.Brush.Color := RGB(200, 235, 180);
  Vigores.Add(IBQDatosIniciales.FieldValues['porc_vig_4'],'4',RGB(150, 200, 170));
  QRSV4.Brush.Color := RGB(150, 200, 170);
  Vigores.Add(IBQDatosIniciales.FieldValues['porc_vig_4M'],'4+',RGB(150, 200, 120));
  QRSV4M.Brush.Color := RGB(150, 200, 120);
  Vigores.Add(IBQDatosIniciales.FieldValues['porc_vig_5'],'5',RGB(150, 200, 130));
  QRSV5.Brush.Color := RGB(150, 200, 130);
  Vigores.Add(IBQDatosIniciales.FieldValues['porc_vig_5M'],'5+',RGB(100, 200, 100));
  QRSV5M.Brush.Color := RGB(100, 200, 100);


  Concentracion.Clear;
  DBCConcentracionSemen.AddSeries(Concentracion);
  Concentracion.Marks.BackColor := clWhite;
  Concentracion.Marks.Font.Name := 'Arial';
  Concentracion.Marks.Font.Size := 10;
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_300'],'300',RGB(150, 200, 200));
  QRSC300.Brush.Color := RGB(150, 200, 200);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_400'],'400',RGB(100, 200, 150));
  QRSC400.Brush.Color := RGB(100, 200, 150);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_500'],'500',RGB(185, 230, 210));
  QRSC500.Brush.Color := RGB(185, 230, 210);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_600'],'600',RGB(200, 215, 200));
  QRSC600.Brush.Color := RGB(200, 215, 200);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_700'],'700',RGB(200, 225, 190));
  QRSC700.Brush.Color := RGB(200, 225, 190);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_800'],'800',RGB(200, 235, 180));
  QRSC800.Brush.Color := RGB(200, 235, 180);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_900'],'900',RGB(150, 200, 170));
  QRSC900.Brush.Color := RGB(150, 200, 170);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_1000'],'1000',RGB(150, 200, 120));
  QRSC1000.Brush.Color := RGB(150, 200, 120);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_1100'],'1100',RGB(150, 200, 130));
  QRSC1100.Brush.Color := RGB(150, 200, 130);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_1200'],'1200',RGB(100, 200, 100));
  QRSC1200.Brush.Color := RGB(100, 200, 100);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_1300'],'1300',RGB(100, 235, 100));
  QRSC1300.Brush.Color := RGB(100, 235, 100);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_1400'],'1400',RGB(100, 235, 150));
  QRSC1400.Brush.Color := RGB(100, 235, 150);
  Concentracion.Add(IBQDatosIniciales.FieldValues['cant_con_1500'],'1500',RGB(100, 235, 200));
  QRSC1500.Brush.Color := RGB(100, 235, 200);

  Metodos.Clear;
  DBCMetodosToma.AddSeries(Metodos);
  Metodos.Marks.BackColor := clWhite;
  Metodos.Marks.Font.Name := 'Arial';
  Metodos.Marks.Font.Size := 10;
  Metodos.Add(IBQDatosIniciales.FieldValues['porc_metodo_ele'],'Eléctroeyaculador',RGB(150, 200, 200));
  //QRSElectro.Brush.Color := RGB(150, 200, 200);
  Metodos.Add(IBQDatosIniciales.FieldValues['porc_metodo_vag'],'Monta vaginal',RGB(100, 200, 150));
  //QRSMonta.Brush.Color := RGB(100, 200, 150);
  Metodos.Add(IBQDatosIniciales.FieldValues['porc_metodo_otro'],'Otro método',RGB(185, 230, 210));
  //QRSOtro.Brush.Color := RGB(185, 230, 210);

  Generales.Clear;
  DBCGeneral.AddSeries(Generales);
  Generales.Marks.BackColor := clWhite;
  Generales.Marks.Font.Name := 'Arial';
  Generales.Marks.Font.Size := 10;
  Generales.Add(IBQDatosIniciales.FieldValues['porc_d_dado'],'Aportadas',RGB(150, 200, 200));
  //QRSAportadas.Brush.Color := RGB(150, 200, 200);
  Generales.Add(IBQDatosIniciales.FieldValues['porc_d_hoy'],'Actuales',RGB(100, 200, 150));
  //QRSActuales.Brush.Color := RGB(100, 200, 150);
  Generales.Add(IBQDatosIniciales.FieldValues['porc_d_vend'],'Vendidas',RGB(185, 230, 210));
  //QRSVendidas.Brush.Color := RGB(185, 230, 210);
  Generales.Add(IBQDatosIniciales.FieldValues['porc_d_boni'],'Bonificadas',RGB(200, 215, 200));
  QRSBonificadas.Brush.Color := RGB(200, 215, 200);
  Generales.Add(IBQDatosIniciales.FieldValues['porc_d_tira'],'Eliminadas',RGB(200, 225, 190));
  QRSEliminadas.Brush.Color := RGB(200, 225, 190);
  Generales.Add(IBQDatosIniciales.FieldValues['porc_d_iatf'],'Uso propio',RGB(200, 235, 180));
  QRSUsoPropio.Brush.Color := RGB(200, 235, 180);
  Generales.Add(IBQDatosIniciales.FieldValues['porc_d_recha'],'Rechazadas',RGB(150, 200, 170));
  QRSRechazadas.Brush.Color := RGB(150, 200, 170);
  Generales.Add(IBQDatosIniciales.FieldValues['porc_d_ajus'],'Ajustadas',RGB(150, 200, 120));
  QRSAjustadas.Brush.Color := RGB(150, 200, 120);                                                 }

end;

procedure TFRepDetalleSemenAnimal.GuardarGraficos;
begin

  { DBCResultadosExtraccion.SaveToMetafile(Dir+'resultados.wmf');
   DBCColorSemen.SaveToMetafile(Dir+'colores.wmf');
   DBCVigoresSemen.SaveToMetafile(Dir+'vigores.wmf');
   DBCConcentracionSemen.SaveToMetafile(Dir+'concentracion.wmf');
   DBCMetodosToma.SaveToMetafile(Dir+'metodos.wmf');
   DBCGeneral.SaveToMetafile(Dir+'general.wmf');

   QRIResultados.Picture.LoadFromFile(Dir+'resultados.wmf');
   QRIColores.Picture.LoadFromFile(Dir+'colores.wmf');
   QRIVigores.Picture.LoadFromFile(Dir+'vigores.wmf');
   QRIConcentracion.Picture.LoadFromFile(Dir+'concentracion.wmf');
   QRIMetodosToma.Picture.LoadFromFile(Dir+'metodos.wmf');
   QRITablaGeneral.Picture.LoadFromFile(Dir+'general.wmf'); }

end;

procedure TFRepDetalleSemenAnimal.cargarDatosPropietario;
var repGeneral : TFRepGeneral;
begin
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();
  QRLNombrePropietario.Caption:= '';
  QRLNombrePropietario1.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLEmpresa1.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo12.Caption:= '';
  QRLDatosAbajo2.Caption:= '';
  QRLDatosAbajo1.Caption:= '';

  QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;

  if (Trim(repGeneral.getDireccionPropietario) <> '') then
  begin
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getDireccionPropietario + ' - ';
    QRLDatosAbajo1.Caption:= QRLDatosAbajo.Caption + repGeneral.getDireccionPropietario + ' - ';
  end;
  if (Trim(repGeneral.getTelefonoPropietario) <> '') then
  begin
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getTelefonoPropietario + ' - ';
    QRLDatosAbajo1.Caption:= QRLDatosAbajo.Caption + repGeneral.getTelefonoPropietario + ' - ';
  end;
  if (Trim(repGeneral.getCelularPropietario) <> '') then
  begin
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getCelularPropietario + ' - ';
    QRLDatosAbajo1.Caption:= QRLDatosAbajo.Caption + repGeneral.getCelularPropietario + ' - ';
  end;
  if (Trim(repGeneral.getEmailPropietario) <> '') then
  begin
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getEmailPropietario + ' - ';
    QRLDatosAbajo12.Caption:= QRLDatosAbajo2.Caption + repGeneral.getEmailPropietario + ' - ';
  end;
  if (Trim(repGeneral.getUrlPropietario) <> '') then
  begin
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getUrlPropietario + ' - ';
    QRLDatosAbajo12.Caption:= QRLDatosAbajo2.Caption + repGeneral.getUrlPropietario + ' - ';
  end;
  if (FileExists(repGeneral.getPathImage)) then
  begin
    QRImagenEmpresa.Picture.LoadFromFile(repGeneral.getPathImage);
    QRImagenEmpresa2.Picture.LoadFromFile(repGeneral.getPathImage);
  end;
  repGeneral.Destroy;
end;


procedure TFRepDetalleSemenAnimal.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;

  ArmarDatosGenerales;
  cargarDatosPropietario;

  CrearSeries;
  ArmarSeries;

  Dir := ExtractFilePath(Application.ExeName);
  GuardarGraficos;

  QRDetalleSemenAnimal.PrevInitialZoom:= qrZoomOther;
  QRDetalleSemenAnimal.PrevInitialZoom:= qrZoomToWidth;
  QRCRHistorico.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);

end;

procedure TFRepDetalleSemenAnimal.ArmarDatosGenerales;
var cadena : string;
    qia, qa, qc, qr, qp, t : integer;
begin
     IBQHistoricoExtraccion.Close;
     IBQHistoricoExtraccion.ParamByName('animal').AsInteger := id_animal;
     IBQHistoricoExtraccion.Open;

     IBQDatosAnimal.Close;
     IBQDatosAnimal.ParamByName('animal').AsInteger := id_animal;
     IBQDatosAnimal.Open;

     cadena := '';


     if (IBQDatosAnimal.FieldValues['id_rp'] <> null) then
        cadena := 'RP:'+ cadena + IBQDatosAnimal.FieldValues['id_rp'];

     if (IBQDatosAnimal.FieldValues['id_hba'] <> null) then
        cadena := cadena + ' - H.B.A.: ' + IBQDatosAnimal.FieldValues['id_hba'];

     if (IBQDatosAnimal.FieldValues['id_pc'] <> null) then
        cadena := cadena + ' - ABA: ' + IBQDatosAnimal.FieldValues['id_pc'];

     if (IBQDatosAnimal.FieldValues['nombre'] <> null) then
        cadena := cadena + ' - Nombre: ' + IBQDatosAnimal.FieldValues['nombre'];

     if (IBQDatosAnimal.FieldValues['apodo'] <> null) then
        cadena := cadena + ' - Apodo: ' + IBQDatosAnimal.FieldValues['apodo'];

     QRLabel33.caption := cadena;

     if (IBQDatosAnimal.FieldValues['raza'] <> null) then
        QRLRazaAnimalValue.Caption := IBQDatosAnimal.FieldValues['raza']
     else
        QRLRazaAnimalValue.Caption := '';

     if (IBQDatosAnimal.FieldValues['color'] <> null) then
        QRLColorAnimalValue.Caption := IBQDatosAnimal.FieldValues['color']
     else
        QRLColorAnimalValue.Caption := '';

     IBQDatosIniciales.Close;
     IBQDatosIniciales.ParamByName('animal').AsInteger := id_animal;
     IBQDatosIniciales.Open;

     qia := 0;
     qa := 0;
     qc := 0;
     qr := 0;
     qp := 0;

     if (IBQDatosIniciales.FieldValues['cant_apto_iatf'] <> null) then
     begin
        QRLAptoIATFValue.Caption := IBQDatosIniciales.FieldValues['cant_apto_iatf'];
        qia := IBQDatosIniciales.FieldValues['cant_apto_iatf'];
     end
     else
       QRLAptoIATFValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_apto'] <> null) then
     begin
        QRLAptoValue.Caption := IBQDatosIniciales.FieldValues['cant_apto'];
        qa := IBQDatosIniciales.FieldValues['cant_apto'];
     end
     else
        QRLAptoValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_cuestionable'] <> null) then
     begin
        QRLCuestionableValue.Caption := IBQDatosIniciales.FieldValues['cant_cuestionable'];
        qc := IBQDatosIniciales.FieldValues['cant_cuestionable'];
     end
     else
        QRLCuestionableValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_rechazado'] <> null) then
     begin
        QRLRechazosValue.Caption := IBQDatosIniciales.FieldValues['cant_rechazado'];
        qr := IBQDatosIniciales.FieldValues['cant_rechazado'];
     end
     else
        QRLRechazosValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_pendientes'] <> null) then
     begin
        QRLPendientesValue.Caption := IBQDatosIniciales.FieldValues['cant_pendientes'];
        qp := IBQDatosIniciales.FieldValues['cant_pendientes'];
     end
     else
        QRLPendientesValue.Caption := '';

     t := qia + qa + qc + qr + qp;

     QRLTotalExtraccionesValue.Caption := IntToStr(t);

     if (IBQDatosIniciales.FieldValues['cant_col_bm'] <> null) then
        QRLBlancoMarfilValue.Caption := IBQDatosIniciales.FieldValues['cant_col_bm']
     else
        QRLBlancoMarfilValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_col_bco'] <> null) then
        QRLBlancoValue.Caption := IBQDatosIniciales.FieldValues['cant_col_bco']
     else
        QRLBlancoValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_col_am'] <> null) then
        QRLAmarilloValue.Caption := IBQDatosIniciales.FieldValues['cant_col_am']
     else
        QRLAmarilloValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_col_ac'] <> null) then
        QRLAcuosoValue.Caption := IBQDatosIniciales.FieldValues['cant_col_ac']
     else
        QRLAcuosoValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_col_dil'] <> null) then
        QRLDiluidoValue.Caption := IBQDatosIniciales.FieldValues['cant_col_dil']
     else
        QRLDiluidoValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_col_suc'] <> null) then
        QRLSucioValue.Caption := IBQDatosIniciales.FieldValues['cant_col_suc']
     else
        QRLSucioValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_col_san'] <> null) then
        QRLConSangreValue.Caption := IBQDatosIniciales.FieldValues['cant_col_san']
     else
        QRLConSangreValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_vig_1'] <> null) then
        QRLUnoValue.Caption := IBQDatosIniciales.FieldValues['cant_vig_1']
     else
        QRLUnoValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_vig_1m'] <> null) then
        QRLUnoMasValue.Caption := IBQDatosIniciales.FieldValues['cant_vig_1m']
     else
        QRLUnoMasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_vig_2'] <> null) then
        QRLDosValue.Caption := IBQDatosIniciales.FieldValues['cant_vig_2']
     else
        QRLDosValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_vig_2m'] <> null) then
        QRLDosMasValue.Caption := IBQDatosIniciales.FieldValues['cant_vig_2m']
     else
        QRLDosMasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_vig_3'] <> null) then
        QRLTresValue.Caption := IBQDatosIniciales.FieldValues['cant_vig_3']
     else
        QRLTresValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_vig_3m'] <> null) then
        QRLTresMasValue.Caption := IBQDatosIniciales.FieldValues['cant_vig_3m']
     else
        QRLTresMasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_vig_4'] <> null) then
        QRLCuatroValue.Caption := IBQDatosIniciales.FieldValues['cant_vig_4']
     else
        QRLCuatroValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_vig_4m'] <> null) then
        QRLCuatroMasValue.Caption := IBQDatosIniciales.FieldValues['cant_vig_4m']
     else
        QRLCuatroMasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_vig_5'] <> null) then
        QRLCincoValue.Caption := IBQDatosIniciales.FieldValues['cant_vig_5']
     else
        QRLCincoValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_vig_5m'] <> null) then
        QRLCincoMasValue.Caption := IBQDatosIniciales.FieldValues['cant_vig_5m']
     else
        QRLCincoMasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_300'] <> null) then
        QRLCon300.Caption := IBQDatosIniciales.FieldValues['cant_con_300']
     else
        QRLCon300.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_400'] <> null) then
        QRLCon400.Caption := IBQDatosIniciales.FieldValues['cant_con_400']
     else
        QRLCon400.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_500'] <> null) then
        QRLCon500.Caption := IBQDatosIniciales.FieldValues['cant_con_500']
     else
        QRLCon500.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_600'] <> null) then
        QRLCon600.Caption := IBQDatosIniciales.FieldValues['cant_con_600']
     else
        QRLCon600.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_700'] <> null) then
        QRLCon700.Caption := IBQDatosIniciales.FieldValues['cant_con_700']
     else
        QRLCon700.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_800'] <> null) then
        QRLCon800.Caption := IBQDatosIniciales.FieldValues['cant_con_800']
     else
        QRLCon800.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_900'] <> null) then
        QRLCon900.Caption := IBQDatosIniciales.FieldValues['cant_con_900']
     else
        QRLCon900.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_1000'] <> null) then
        QRLCon1000.Caption := IBQDatosIniciales.FieldValues['cant_con_1000']
     else
        QRLCon1000.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_1100'] <> null) then
        QRLCon1100.Caption := IBQDatosIniciales.FieldValues['cant_con_1100']
     else
        QRLCon1100.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_1200'] <> null) then
        QRLCon1200.Caption := IBQDatosIniciales.FieldValues['cant_con_1200']
     else
        QRLCon1200.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_1300'] <> null) then
        QRLCon1300.Caption := IBQDatosIniciales.FieldValues['cant_con_1300']
     else
        QRLCon1300.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_1400'] <> null) then
        QRLCon1400.Caption := IBQDatosIniciales.FieldValues['cant_con_1400']
     else
        QRLCon1400.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_con_1500'] <> null) then
        QRLCon1500.Caption := IBQDatosIniciales.FieldValues['cant_con_1500']
     else
        QRLCon1500.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_toma_electro'] <> null ) then
        QRLElectroValue.Caption := IBQDatosIniciales.FieldValues['cant_toma_electro']
     else
        QRLElectroValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_toma_vaginal'] <> null ) then
        QRLMontaValue.Caption := IBQDatosIniciales.FieldValues['cant_toma_vaginal']
     else
        QRLMontaValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_toma_otro'] <> null ) then
        QRLOtroValue.Caption := IBQDatosIniciales.FieldValues['cant_toma_otro']
     else
        QRLOtroValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cantidad_semen_dado'] <> null) then
        QRLDosisAportadasValue.Caption := IBQDatosIniciales.FieldValues['cantidad_semen_dado']
     else
        QRLDosisAportadasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cantidad_dosis_hoy'] <> null) then
        QRLDosisActualesValue.Caption := IBQDatosIniciales.FieldValues['cantidad_dosis_hoy']
     else
        QRLDosisActualesValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_dosis_vendidas'] <> null) then
        QRLDosisVendidasValue.Caption := IBQDatosIniciales.FieldValues['cant_dosis_vendidas']
     else
        QRLDosisVendidasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_dosis_bonificadas'] <> null) then
        QRLDosisBonificadasValue.Caption := IBQDatosIniciales.FieldValues['cant_dosis_bonificadas']
     else
        QRLDosisBonificadasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_dosis_tiradas'] <> null) then
        QRLDosisDesechadasValue.Caption := IBQDatosIniciales.FieldValues['cant_dosis_tiradas']
     else
        QRLDosisDesechadasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['dosis_rechazadas'] <> null) then
        QRLDosisRechazadasValue.Caption := IBQDatosIniciales.FieldValues['dosis_rechazadas']
     else
        QRLDosisRechazadasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['cant_dosis_iatf'] <> null) then
        QRLDosisIATFValue.Caption := IBQDatosIniciales.FieldValues['cant_dosis_iatf']
     else
        QRLDosisIATFValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['CANTIDAD_DOSIS_AJUSTADAS'] <> null) then
        QRLDosisAjustadasValue.Caption := IBQDatosIniciales.FieldValues['CANTIDAD_DOSIS_AJUSTADAS']
     else
        QRLDosisAjustadasValue.Caption := '';

     if (IBQDatosIniciales.FieldValues['FECHA_AJUSTE'] <> null) then
     begin
      if (IBQDatosIniciales.FieldValues['CANTIDAD_DOSIS_AJUSTADAS'] <> 0) then
        QRLFechaAjusteValue.Caption := IBQDatosIniciales.FieldValues['FECHA_AJUSTE']
      else
      begin
        QRLFechaAjusteValue.Visible := false;
        QRLFechaAjuste.Visible := false;
      end;
     end;
end;



procedure TFRepDetalleSemenAnimal.FormCreate(Sender: TObject);
begin
  inherited;
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientosB.Caption := FPrincipal.NombreEstablecimiento;

  if (FPrincipal.TipoVersion = TVveterinario) then
  begin
      QRLRenglon2.Enabled := true;
      QRLRenglon2B.Enabled := true;
      QRLRenglon2.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2B.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
      QRLRenglon2B.Caption := FPrincipal.Renspa;
      QRLRenglon21.Enabled := true;
      QRLRenglon21.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon21.Caption := FPrincipal.Renspa;
  end
  else
  begin
      QRLRenglon2.Enabled := true;
      QRLRenglon2B.Enabled := true;
      QRLRenglon2.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2B.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
      QRLRenglon2B.Caption := FPrincipal.Renspa;
      QRLRenglon21.Enabled := true;
      QRLRenglon21.Caption := FPrincipal.NombrePropietario;
      QRLRenglon21.Caption := FPrincipal.Renspa;
  end;
  cargarDatosPropietario;
end;

procedure TFRepDetalleSemenAnimal.QRCRHistoricoAddReports(Sender: TObject);
begin
  inherited;

  QRCRHistorico.Reports.Clear;
  QRCRHistorico.Reports.Add(QRDetalleSemenAnimal);
  //QRCRHistorico.Reports.Add(QRGraficos);
  QRCRHistorico.Reports.Add(QRDatosExtracciones);

end;

procedure TFRepDetalleSemenAnimal.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if (IBQHistoricoExtraccion.FieldValues['resultado'] = null) then
  begin
       QRSInferior.Pen.Style := psClear;
       QRSInferior.BringToFront;
       QRSLateral.Pen.Style := psClear;
  end
  else
  begin
       QRSInferior.SendToBack;
       QRSInferior.Pen.Style := psSolid;
       QRSLateral.Pen.Style := psSolid;
  end;

  if (IBQHistoricoExtraccion.FieldValues['diluyo'] = 'N') then
  begin
       QRSLateral.BringToFront;
       QRSLateral.Visible := true;
  end
  else
  begin
       QRSLateral.SendToBack;
       QRSLateral.Visible := false;
  end;

end;

end.
