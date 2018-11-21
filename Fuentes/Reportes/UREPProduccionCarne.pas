unit UREPProduccionCarne;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  DateTimePickerAuto, UPrincipal, DateUtils, Types, DBCtrls, UDBLookupComboBoxAuto,
  Buttons, UDMSoftvet, EditAuto, IBUpdateSQL, PngImage, jpeg, JvGIF,
  JvExControls, JvLabel, ImgList, PngImageList, Grids, DBGrids,
  JvExExtCtrls, JvImage;

type
  TFREPProduccionCarne = class(TFUniversal)
    PFiltros: TPanel;
    PDetalle: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Label4: TLabel;
    LProdHa: TLabel;
    LIngresoHa: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Shape26: TShape;
    Label21: TLabel;
    Shape27: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    LExistPromDiaria: TLabel;
    LSupGanadera: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape22: TShape;
    Label32: TLabel;
    Label33: TLabel;
    Shape23: TShape;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Label38: TLabel;
    Label39: TLabel;
    Shape37: TShape;
    IBQREPProduccionSalidas: TIBQuery;
    DSREPProduccionSalidas: TDataSource;
    IBQREPProduccionSalidasKGTOTALDESTINO: TFloatField;
    IBQREPProduccionSalidasFECHA: TDateField;
    IBQREPProduccionSalidasTIPOBAJA: TIBStringField;
    IBQREPProduccionSalidasCATEGORIA: TIBStringField;
    IBQREPProduccionSalidasCABEZAS: TIntegerField;
    IBQREPProduccionSalidasDESBASTE: TFloatField;
    DSREPProduccionEntradas: TDataSource;
    IBQREPProduccionEntradas: TIBQuery;
    IBQREPProduccionEntradasKGTOTALCAMPO: TFloatField;
    IBQREPProduccionEntradasFECHA: TDateField;
    IBQREPProduccionEntradasTIPOBAJA: TIBStringField;
    IBQREPProduccionEntradasCATEGORIA: TIBStringField;
    IBQREPProduccionEntradasCABEZAS: TIntegerField;
    IBQGetExistenciaFinal: TIBQuery;
    DSGetExistenciaFinal: TDataSource;
    DSGetExistenciaInicial: TDataSource;
    IBQGetExistenciaInicial: TIBQuery;
    LCabExistFinal: TLabel;
    LCabExistInicial: TLabel;
    LKGExistFinal: TLabel;
    LKGExistInicial: TLabel;
    LKGDifInventario: TLabel;
    LCabSalidas: TLabel;
    LCabEntradas: TLabel;
    LKgTotalDestino: TLabel;
    LKgTotalCampo: TLabel;
    LValorVenta: TLabel;
    LValorCompra: TLabel;
    LPesosDifInventario: TLabel;
    LKGProduccionCarne: TLabel;
    LNetoExistFinal: TLabel;
    LNetoExistInicial: TLabel;
    LIngresoNeto: TLabel;
    DSSupGanaderaEfectiva: TDataSource;
    LKgProduccionCarneHa: TLabel;
    Label42: TLabel;
    LIngresoNetoHa: TLabel;
    Label43: TLabel;
    IBQExistenciaPromedioTotal: TIBQuery;
    LCabExistHacienda: TLabel;
    LKGExistHacienda: TLabel;
    LEficienciaStock: TLabel;
    LEVExistHacienda: TLabel;
    Label41: TLabel;
    Label44: TLabel;
    IBQGetExistenciaInicialANIMAL: TIntegerField;
    IBQGetExistenciaInicialCATEGORIA: TIBStringField;
    IBQGetExistenciaFinalANIMAL: TIntegerField;
    IBQGetExistenciaFinalCATEGORIA: TIBStringField;
    IBQGetExistenciaInicialTOTALPRECIO: TFloatField;
    IBQGetExistenciaFinalTOTALPRECIO: TFloatField;
    GroupBox5: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    RBTodas: TRadioButton;
    RBActividad: TRadioButton;
    DBLCBAActividad: TDBLookupComboBoxAuto;
    GroupBox3: TGroupBox;
    CBDetalle: TCheckBox;
    LNombreSalidas: TLabel;
    Shape21: TShape;
    IBQREPProduccionSalidasIDCATEGORIA: TIntegerField;
    IBQREPProduccionEntradasIDCATEGORIA: TIntegerField;
    IBQGetExistenciaInicialIDCATEGORIA: TIntegerField;
    IBQGetExistenciaFinalIDCATEGORIA: TIntegerField;
    IBQGetExistenciaInicialEQUIV: TFloatField;
    IBQGetExistenciaFinalEQUIV: TFloatField;
    IBQGetExistenciaFinalEQUIVTOTAL: TFloatField;
    IBQGetExistenciaInicialEQUIVTOTAL: TFloatField;
    IBQExistPromEV: TIBQuery;
    IBQExistPromEVPROMEDIOEXISTENCIA: TFloatField;
    IBQExistPromEVTOTALEXISTENCIA: TFloatField;
    IBQDatosRefPesoPrecioSalidas: TIBQuery;
    BBEntradasSalidas: TBitBtn;
    IBQEntradasAuxEventos: TIBQuery;
    IBQSalidasAuxEventos: TIBQuery;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox7: TGroupBox;
    Label2: TLabel;
    DTPADesde: TDateTimePickerAuto;
    Label3: TLabel;
    DTPAHasta: TDateTimePickerAuto;
    BBCalcular: TBitBtn;
    IBQREPProduccionEntradasIDALTABAJA: TIntegerField;
    IBQREPProduccionEntradasTIPODETALLE: TIBStringField;
    IBQREPProduccionSalidasIDALTABAJA: TIntegerField;
    IBQREPProduccionSalidasTIPODETALLE: TIBStringField;
    BBCambiarSuperficieGanadera: TBitBtn;
    EACambiarSuperficieGanadera: TEditAuto;
    BBCancelarSuperficie: TBitBtn;
    IBQTABREFCAT: TIBQuery;
    LFechaSalidas: TLabel;
    LSaliads: TLabel;
    LEntradas: TLabel;
    LFechaEntradas: TLabel;
    LNombreEntradas: TLabel;
    LNombreExistenciaFinal: TLabel;
    LFechaExistenciaFinal: TLabel;
    LExistenciaFinal: TLabel;
    LExistenciaInicial: TLabel;
    LFechaExistenciaInicial: TLabel;
    LNombreExistenciaInicial: TLabel;
    Shape20: TShape;
    BBCambiar: TBitBtn;
    IBQDatosRefPesoPrecioEntradas: TIBQuery;
    IBQDatosRefPesoPrecioExistenciaFinal: TIBQuery;
    IBQDatosRefPesoPrecioExistenciaInicial: TIBQuery;
    IBQGetExistenciaInicialTOTALEXISTENCIA: TIBBCDField;
    IBQGetExistenciaInicialKILOSTOTAL: TIBBCDField;
    IBQGetExistenciaInicialPROMPESOCAMPO: TIBBCDField;
    IBQGetExistenciaInicialPRECIOUNITARIO: TIBBCDField;
    IBQGetExistenciaInicialPROMPRECIOUNITARIO: TIBBCDField;
    IBQGetExistenciaInicialGASTOS: TIBBCDField;
    IBQGetExistenciaFinalTOTALEXISTENCIA: TIBBCDField;
    IBQGetExistenciaFinalKILOSTOTAL: TIBBCDField;
    IBQGetExistenciaFinalPROMPESOCAMPO: TIBBCDField;
    IBQGetExistenciaFinalPRECIOUNITARIO: TIBBCDField;
    IBQGetExistenciaFinalPROMPRECIOUNITARIO: TIBBCDField;
    IBQGetExistenciaFinalGASTOS: TIBBCDField;
  //  IBQREPProduccionSalidasPROMPESODESTINO: TLargeintField;
    IBQREPProduccionSalidasPRECIOKILO: TIBBCDField;
    IBQREPProduccionSalidasPRECIO: TIBBCDField;
    IBQREPProduccionSalidasGASTOS: TIBBCDField;
    IBQREPProduccionEntradasPRECIOKILO: TIBBCDField;
    IBQREPProduccionEntradasPRECIO: TIBBCDField;
    IBQREPProduccionEntradasGASTOS: TIBBCDField;
    IBQREPProduccionEntradasVALORCOMPRA: TIBBCDField;
    IBQREPProduccionEntradasGASTOSCOMER: TIBBCDField;
    IBQREPProduccionSalidasGASTOSCOMER: TIBBCDField;
    IBQREPProduccionSalidasVALORVENTA: TIBBCDField;
    IBQExistenciaPromedioTotalPROMEDIOEXISTENCIA: TIBBCDField;
    IBQREPProduccionSalidasPROMPESOCAMPO: TFloatField;
    IBQREPProduccionSalidasPROMPESODESTINO2: TFloatField;
    IBQREPProduccionEntradasPROMPESOCAMPO: TFloatField;
    IBQREPProduccionEntradasPROMPESODESTINO: TFloatField;
    IBQGetExistenciaInicialPESOCAMPO: TFloatField;
    IBQGetExistenciaFinalPESOCAMPO: TFloatField;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    Label45: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    CBPrecio: TCheckBox;
    IBQSupGanaderaEfectiva: TIBQuery;
    CBEv: TCheckBox;
    GBCategoria: TGroupBox;
    PMangaCategoria: TPanel;
    DBGDisponibles: TDBGrid;
    DBGSeleccionados: TDBGrid;
    BPasar1: TButton;
    BSacar1: TButton;
    DSDisponibles: TDataSource;
    IBQDisponibles: TIBQuery;
    IBUSeleccionados: TIBUpdateSQL;
    DSSeleccionados: TDataSource;
    IBQSeleccionados: TIBQuery;
    IBQDisponiblesNOMBRE: TIBStringField;
    IBQDisponiblesID_CATEGORIA: TIntegerField;
    IBQDisponiblesSINONIMO: TIBStringField;
    IBQDisponiblesTIPO_SEXO: TIntegerField;
    IBQDisponiblesCODIGO: TIBStringField;
    IBQSeleccionadosID_ANIMAL_EXTERNO: TIntegerField;
    IBQSeleccionadosID_AUX: TIntegerField;
    IBQSeleccionadosID_OTRO: TIBStringField;
    IBQSeleccionadosID_PC: TIBStringField;
    IBQSeleccionadosID_HBA: TIBStringField;
    IBQSeleccionadosID_RA: TIBStringField;
    IBQSeleccionadosID_RP: TIBStringField;
    IBQSeleccionadosID_SENASA: TIBStringField;
    IBQSeleccionadosNOMBRE: TIBStringField;
    IBQSeleccionadosAPODO: TIBStringField;
    IBQSeleccionadosRAZA: TIntegerField;
    IBQSeleccionadosSEXO: TIntegerField;
    IBQSeleccionadosINTERNO: TIBStringField;
    IBQSeleccionadosFECHA: TDateField;
    IBQSeleccionadosCRIADOR: TIBStringField;
    IBQSeleccionadosPROPIETARIO: TIntegerField;
    IBQSeleccionadosADN: TIBStringField;
    IBQSeleccionadosTIPIFICACION_SANGUINEA: TIBStringField;
    JvIBotonBuscar: TJvImage;
    procedure BBSalirClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RBActividadClick(Sender: TObject);
    procedure RBTodasClick(Sender: TObject);
    procedure DTPADesdeChange(Sender: TObject);
    procedure IBQREPProduccionSalidasCalcFields(DataSet: TDataSet);
    procedure IBQREPProduccionEntradasCalcFields(DataSet: TDataSet);
    procedure IBQGetExistenciaInicialCalcFields(DataSet: TDataSet);
    procedure IBQGetExistenciaFinalCalcFields(DataSet: TDataSet);
    procedure closeUpFechas(Sender: TObject);
    procedure DTPAFechasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBAActividadCloseUp(Sender: TObject);
    procedure DBLCBAActividadKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BBCalcularClick(Sender: TObject);
    procedure BBEntradasSalidasClick(Sender: TObject);
    procedure BBCambiarSuperficieGanaderaClick(Sender: TObject);
    procedure BBCancelarSuperficieClick(Sender: TObject);
    procedure BBCambiarClick(Sender: TObject);
    procedure EACambiarSuperficieGanaderaKeyPress(Sender: TObject;
      var Key: Char);
    procedure CBPrecioClick(Sender: TObject);
    procedure DTPAHastaChange(Sender: TObject);
    procedure BPasar1Click(Sender: TObject);
    procedure BSacar1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    { Private declarations }
    Desde, Hasta : TDate;
    procedure ActualizarConsulta();
    procedure ArmarPreview();

    procedure ClearLabel();
    procedure CargarFechaTabPrecioPesoCat();
    procedure CompletarDatosFormulario();
    procedure CargarIBQTabRefCat();
    procedure SupGanaderaVisible();
  public
    { Public declarations }
  end;

var
  FREPProduccionCarne: TFREPProduccionCarne;

implementation

uses
  UREPProduccionCarnePreview, UCartel, UMensajeHuella, URepEntradasSalidasCarne, URepReferenciasPesosPrecios, UTraduccion;

{$R *.dfm}

procedure TFREPProduccionCarne.BBSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFREPProduccionCarne.BBImprimirReporteClick(Sender: TObject);
var
  F : TFREPProduccionCarnePreview;
  cartel: TCartel;
  msje : String;  
begin
  inherited;
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa del Reporte de Producción de Carne ...';
  cartel.abrircartel(msje);
  F := TFREPProduccionCarnePreview.Create(self);
  F.Detalle := CBDetalle.Checked;
  F.QRLFDesde.Caption:= DateToStr(Desde);
  F.QRLFHasta.Caption:= DateToStr(Hasta);

  F.QRLFDesde21.Caption:= F.QRLFDesde.Caption;
  F.QRLFHasta21.Caption:= F.QRLFHasta.Caption;

  F.QRLFDesdeEI.Caption:= F.QRLFDesde.Caption;
  F.QRLFHastaEI.Caption:= F.QRLFHasta.Caption;    
  if (RBTodas.Checked) then
    begin
      F.QRLActividad.Caption:= Traducir('Todas');
      F.QRLActividad21.Caption:= F.QRLActividad.Caption;
    end
   else
     begin
       F.QRLActividad.Caption:= DBLCBAActividad.Text;
       F.QRLActividad21.Caption:= F.QRLActividad.Caption;
     end;

//
  F.QRLCabSalidas.Caption:= LCabSalidas.Caption;
  F.QRLKgTotalDestino.Caption:= LKgTotalDestino.Caption;
  F.QRLValorVenta.Caption:= LValorVenta.Caption;

  F.QRLCabEntradas.Caption:= LCabEntradas.Caption;
  F.QRLKgTotalCampo.Caption:= LKgTotalCampo.Caption;
  F.QRLValorCompra.Caption:= LValorCompra.Caption;

  F.QRLCabExistFinal.Caption:= LCabExistFinal.Caption;
  F.QRLKGExistFinal.Caption:= LKGExistFinal.Caption;
  F.QRLNetoExistFinal.Caption:= LNetoExistFinal.Caption;

  F.QRLCabExistInicial.Caption:= LCabExistInicial.Caption;
  F.QRLKGExistInicial.Caption:= LKGExistInicial.Caption;
  F.QRLNetoExistInicial.Caption:= LNetoExistInicial.Caption;
  
  F.QRLKGDifInventario.Caption:= LKGDifInventario.Caption;
  F.QRLPesosDifInventario.Caption:= LPesosDifInventario.Caption;

  F.QRLKGDifInventario2.Caption:= LKGDifInventario.Caption;
  F.QRLPesosDifInventario2.Caption:= LPesosDifInventario.Caption;

  F.QRLExistPromDiaria.Caption:= LExistPromDiaria.Caption;
  F.QRLSupGanadera.Caption:= LSupGanadera.Caption;

  F.QRLabel33.Caption:= Label24.Caption;
  F.QRLabel35.Caption:= Label26.Caption;  

  //**//
  F.QRLabel8.Caption:= Label32.Caption;
  F.QRLabel9.Caption:= Label33.Caption;
  F.QRLabel107.Caption:= Label42.Caption;
  F.QRLabel108.Caption:= Label43.Caption;
  //**//

  F.QRLKGProduccionCarne.Caption:= LKGProduccionCarne.Caption;
  F.QRLIngresoNeto.Caption:= LIngresoNeto.Caption;

  F.QRLKgProduccionCarneHa.Caption:= LKgProduccionCarneHa.Caption;
  F.QRLIngresoNetoHa.Caption:= LIngresoNetoHa.Caption;

  F.QRLKGExistHacienda.Caption:= LKGExistHacienda.Caption;
  F.QRLCabExistHacienda.Caption:= LCabExistHacienda.Caption;
  if CBEv.Checked then
    F.QRLEVExistHacienda.Caption:= LEVExistHacienda.Caption
  else
    F.QRLEVExistHacienda.Enabled:= false;

  F.QRLEficienciaStock.Caption:= LEficienciaStock.Caption;

  F.QRLProdHa.Caption:= LProdHa.Caption;
  F.QRLIngresoHa.Caption:= LIngresoHa.Caption;
//

  cartel.cerrarcartel();
  cartel.FreeInstance();

  F.ShowModal;
  F.Destroy;
  HabilitarDesabilitarControles();  
end;

procedure TFREPProduccionCarne.FormCreate(Sender: TObject);
begin
  inherited;
  DMSoftvet.IBQActividad.Close;
  DMSoftvet.IBQActividad.Open;
end;

procedure TFREPProduccionCarne.RBActividadClick(Sender: TObject);
begin
  inherited;
  DBLCBAActividad.Enabled := true;
  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;
  DBLCBAActividad.KeyValue:= 0;
//  ActualizarConsulta;
end;

procedure TFREPProduccionCarne.RBTodasClick(Sender: TObject);
begin
  inherited;
  DBLCBAActividad.Enabled := false;
  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;
//  ActualizarConsulta;
end;

procedure TFREPProduccionCarne.ActualizarConsulta;
var Cartel: TCartel;
    con_precio : String;
begin
  if CBPrecio.Checked then
    con_precio := 'S'
  else
    con_precio := 'N';

  Cartel := TCartel.getInstance();
  Cartel.abrircartel('Cargando Producción de Carne ...');

  IBQREPProduccionSalidas.Close;
  IBQREPProduccionSalidas.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQREPProduccionSalidas.ParamByName('ACTIVIDAD').Value := null;
  IBQREPProduccionSalidas.ParamByName('DESDE').AsDate := Desde;
  IBQREPProduccionSalidas.ParamByName('HASTA').AsDate := Hasta;
  IBQREPProduccionSalidas.ParamByName('FECHAREFERENCIA').Value := null;
  IBQREPProduccionSalidas.ParamByName('PRECIO').Value := con_precio;
  if (RBActividad.Checked) then
    IBQREPProduccionSalidas.ParamByName('ACTIVIDAD').AsInteger := DBLCBAActividad.KeyValue;

  IBQREPProduccionSalidas.Open;

  IBQREPProduccionEntradas.Close;
  IBQREPProduccionEntradas.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQREPProduccionEntradas.ParamByName('ACTIVIDAD').Value := null;
  IBQREPProduccionEntradas.ParamByName('DESDE').AsDate := Desde;
  IBQREPProduccionEntradas.ParamByName('HASTA').AsDate := Hasta;
  IBQREPProduccionEntradas.ParamByName('FECHAREFERENCIA').Value := null;
  IBQREPProduccionEntradas.ParamByName('PRECIO').Value := con_precio;
  if (RBActividad.Checked) then
    IBQREPProduccionEntradas.ParamByName('ACTIVIDAD').AsInteger := DBLCBAActividad.KeyValue;

  IBQREPProduccionEntradas.Open;


  IBQGetExistenciaInicial.Close;
  IBQGetExistenciaInicial.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetExistenciaInicial.ParamByName('ACTIVIDAD').Value := null;
  IBQGetExistenciaInicial.ParamByName('HASTA').AsDate := Desde;
  IBQGetExistenciaInicial.ParamByName('PRECIO').Value := con_precio;
  if (RBActividad.Checked) then
    IBQGetExistenciaInicial.ParamByName('ACTIVIDAD').AsInteger := DBLCBAActividad.KeyValue;

  IBQGetExistenciaInicial.Open;

  IBQGetExistenciaFinal.Close;
  IBQGetExistenciaFinal.ParamByName('ESTABLECIMIENTO').AsInteger := FPrincipal.EstablecimientoActual;
  IBQGetExistenciaFinal.ParamByName('ACTIVIDAD').Value := null;
  /// prueba de sacar el +1 ya que suma un dia mas cuando no corresponde 02/03/2017
  IBQGetExistenciaFinal.ParamByName('HASTA').AsDate := Hasta+1;
  IBQGetExistenciaFinal.ParamByName('PRECIO').Value := con_precio;
  if (RBActividad.Checked) then
    IBQGetExistenciaFinal.ParamByName('ACTIVIDAD').AsInteger := DBLCBAActividad.KeyValue;

  IBQGetExistenciaFinal.Open;

{  IBQSupGanaderaEfectiva.Close;
  IBQSupGanaderaEfectiva.ParamByName('ESTA').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSupGanaderaEfectiva.ParamByName('DESDE').AsDate := Desde;
  IBQSupGanaderaEfectiva.ParamByName('HASTA').AsDate := Hasta;

  IBQSupGanaderaEfectiva.Open;
  IBQSupGanaderaEfectiva.First;}


  IBQExistenciaPromedioTotal.Close;   //preguntar si es con actividad tambien
  IBQExistenciaPromedioTotal.ParamByName('desde').AsDate := Desde;
  IBQExistenciaPromedioTotal.ParamByName('hasta').AsDate := Hasta;
  IBQExistenciaPromedioTotal.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQExistenciaPromedioTotal.ParamByName('ACTIVIDAD').Value := null;
  if (RBActividad.Checked) then
    IBQExistenciaPromedioTotal.ParamByName('ACTIVIDAD').AsInteger := DBLCBAActividad.KeyValue;
  IBQExistenciaPromedioTotal.Open;
  IBQExistenciaPromedioTotal.First;


  if CBEv.Checked then
  begin
    IBQExistPromEV.Close;
    IBQExistPromEV.ParamByName('desde').AsDate := Desde;
    IBQExistPromEV.ParamByName('hasta').AsDate := Hasta;
    IBQExistPromEV.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
    IBQExistPromEV.ParamByName('ACTIVIDAD').Value := null;
    if (RBActividad.Checked) then
      IBQExistPromEV.ParamByName('ACTIVIDAD').AsInteger := DBLCBAActividad.KeyValue;
    IBQExistPromEV.Open;
    IBQExistPromEV.First;
  end;

  CompletarDatosFormulario();

  if (not(IBQREPProduccionSalidas.IsEmpty) or not(IBQREPProduccionEntradas.IsEmpty) or
      not(IBQGetExistenciaInicial.IsEmpty) or not(IBQGetExistenciaFinal.IsEmpty)) then
    begin
      {BBImprimirReporte.Enabled:= true;}
      LPreview.Enabled := true;
      IPreview.Enabled := true;
      BBEntradasSalidas.Enabled:= true;
    end
   else
     begin
       //BBImprimirReporte.Enabled:= false;
       IPreview.Enabled := false;
       LPreview.Enabled := false;
       BBEntradasSalidas.Enabled:= false;
     end;  
                    
  Cartel.cerrarcartel;
  Cartel.FreeInstance;
end;

procedure TFREPProduccionCarne.ArmarPreview;
begin
//
end;

procedure TFREPProduccionCarne.DTPADesdeChange(Sender: TObject);
begin
  inherited;
//  Fecha := StrToDate(IBQTipoServicios.FieldValues['VALOR']);
  //DecodeDate(Fecha,a,Mes,Dia);
  Desde := DTPADesde.Date;

  //Hasta := IncYear(Desde,1);
  //DTPAHasta.Date:= Hasta;
  //ActualizarConsulta;
end;

procedure TFREPProduccionCarne.IBQREPProduccionSalidasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if (IBQREPProduccionSalidas.FieldByName('PROMPESOCAMPO').AsFloat = 0) then
    begin
     //IBQDatosTabPesoPrecioCat.Locate('categoria',IBQREPProduccionSalidas.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
     //IBQREPProduccionSalidas.FieldByName('PROMPESOCAMPO').AsFloat:= IBQDatosTabPesoPrecioCat.fieldbyname('pesoprom').AsFloat;

     if not(IBQDatosRefPesoPrecioSalidas.Eof) then
       begin
         IBQDatosRefPesoPrecioSalidas.Locate('categoria',IBQREPProduccionSalidas.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
         IBQREPProduccionSalidas.FieldByName('PROMPESOCAMPO').AsFloat:= IBQDatosRefPesoPrecioSalidas.fieldbyname('pesoprom').AsFloat;
       end;
    end;

//  if (IBQREPProduccionSalidas.FieldByName('PRECIOKILO').AsFloat = 0) then
//    begin
     //IBQDatosTabPesoPrecioCat.Locate('categoria',IBQREPProduccionSalidas.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
     //IBQREPProduccionSalidas.FieldByName('PRECIOKILO').AsFloat:= IBQDatosTabPesoPrecioCat.fieldbyname('precioprom').AsFloat;

     if not(IBQDatosRefPesoPrecioSalidas.Eof) then
       begin
         IBQDatosRefPesoPrecioSalidas.Locate('categoria',IBQREPProduccionSalidas.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
         //IBQREPProduccionSalidas.FieldByName('PRECIOKILO').AsFloat:= IBQDatosRefPesoPrecioSalidas.fieldbyname('precioprom').AsFloat;
         IBQREPProduccionSalidas.FieldByName('PRECIO').AsFloat:= IBQDatosRefPesoPrecioSalidas.fieldbyname('precioprom').AsFloat;

         if (IBQDatosRefPesoPrecioSalidas.FieldByName('pesoprom').AsFloat <> 0) then
           begin
              IBQREPProduccionSalidas.FieldByName('PRECIOKILO').AsFloat:= IBQDatosRefPesoPrecioSalidas.fieldbyname('precioprom').AsFloat/IBQDatosRefPesoPrecioSalidas.FieldByName('pesoprom').AsFloat;
           end;
       end;
//    end;

///    esto es una prueba
  IBQSalidasAuxEventos.Close;
  IBQSalidasAuxEventos.ParamByName('FECHA').AsDateTime := IBQREPProduccionSalidas.FieldByName('FECHA').AsDateTime;
  IBQSalidasAuxEventos.ParamByName('TIPOBAJA').AsString := IBQREPProduccionSalidas.FieldByName('TIPOBAJA').AsString;
  IBQSalidasAuxEventos.ParamByName('CATEGORIA').AsString := IBQREPProduccionSalidas.FieldByName('CATEGORIA').AsString;
  IBQSalidasAuxEventos.ParamByName('IDCATEGORIA').AsInteger := IBQREPProduccionSalidas.FieldByName('IDCATEGORIA').AsInteger;

  IBQSalidasAuxEventos.Open;
  IBQSalidasAuxEventos.First;

  if (not IBQSalidasAuxEventos.Eof) then
    IBQREPProduccionSalidas.FieldByName('PROMPESODESTINO').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQSalidasAuxEventos.FieldByName('PESO').AsFloat));
////

  if (IBQREPProduccionSalidas.FieldByName('PROMPESODESTINO').AsFloat <> 0) then
    IBQREPProduccionSalidas.FieldByName('KGTOTALDESTINO').AsFloat:= IBQREPProduccionSalidas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionSalidas.FieldByName('PROMPESODESTINO').AsFloat
   else
     if (IBQREPProduccionSalidas.FieldByName('PROMPESOCAMPO').AsFloat <> 0) then
       IBQREPProduccionSalidas.FieldByName('KGTOTALDESTINO').AsFloat:= IBQREPProduccionSalidas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionSalidas.FieldByName('PROMPESOCAMPO').AsFloat
      else
        begin
          //IBQDatosTabPesoPrecioCat.Locate('categoria',IBQREPProduccionSalidas.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
          //IBQREPProduccionSalidas.FieldByName('PROMPESODESTINO').AsFloat:= IBQDatosTabPesoPrecioCat.fieldbyname('pesoprom').AsFloat;
        end;



///
  if (not IBQSalidasAuxEventos.Eof) then
    IBQREPProduccionSalidas.FieldByName('PRECIOKILO').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQSalidasAuxEventos.FieldByName('PRECIO').AsFloat));
//


  //IBQREPProduccionSalidas.FieldByName('GASTOSCOMER').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionSalidas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionSalidas.FieldByName('PROMPESODESTINO').AsFloat * IBQREPProduccionSalidas.FieldByName('PRECIOKILO').AsFloat)*0.03));
  //IBQREPProduccionSalidas.FieldByName('GASTOSCOMER').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionSalidas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionSalidas.FieldByName('PRECIO').AsFloat)));
  IBQREPProduccionSalidas.FieldByName('GASTOSCOMER').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionSalidas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionSalidas.FieldByName('GASTOS').AsFloat)));


  //IBQREPProduccionSalidas.FieldByName('VALORVENTA').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionSalidas.FieldByName('PRECIOKILO').AsFloat * IBQREPProduccionSalidas.FieldByName('KGTOTALDESTINO').AsFloat) - IBQREPProduccionSalidas.FieldByName('GASTOSCOMER').AsFloat));
  IBQREPProduccionSalidas.FieldByName('VALORVENTA').AsFloat:= StrToFloat(FormatFloat('###0.00',( IBQREPProduccionSalidas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionSalidas.FieldByName('PRECIO').AsFloat - IBQREPProduccionSalidas.FieldByName('GASTOSCOMER').AsFloat)));
  //IBQREPProduccionSalidas.FieldByName('VALORVENTA').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionSalidas.FieldByName('PRECIOKILO').AsFloat * IBQREPProduccionSalidas.FieldByName('KGTOTALDESTINO').AsFloat) - IBQREPProduccionSalidas.FieldByName('GASTOSCOMER').AsFloat));

  if (IBQREPProduccionSalidas.FieldByName('PROMPESOCAMPO').AsFloat > 0) then
    IBQREPProduccionSalidas.FieldByName('DESBASTE').AsFloat:= (StrToFloat(FormatFloat('###0.00',(IBQREPProduccionSalidas.FieldByName('PROMPESOCAMPO').AsFloat - IBQREPProduccionSalidas.FieldByName('PROMPESODESTINO').AsFloat) / IBQREPProduccionSalidas.FieldByName('PROMPESOCAMPO').AsFloat)))*100
   else
     IBQREPProduccionSalidas.FieldByName('DESBASTE').AsFloat:= 0;

  IBQREPProduccionSalidas.FieldByName('PRECIOKILO').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQREPProduccionSalidas.FieldByName('PRECIOKILO').AsFloat));
  IBQREPProduccionSalidas.FieldByName('PRECIO').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQREPProduccionSalidas.FieldByName('PRECIO').AsFloat));
end;

procedure TFREPProduccionCarne.IBQREPProduccionEntradasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if (IBQREPProduccionEntradas.FieldByName('PROMPESOCAMPO').AsFloat = 0) then
    begin
     //IBQDatosTabPesoPrecioCat.Locate('categoria',IBQREPProduccionEntradas.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
     //IBQREPProduccionEntradas.FieldByName('PROMPESOCAMPO').AsFloat:= IBQDatosTabPesoPrecioCat.fieldbyname('pesoprom').AsFloat;

     if not(IBQDatosRefPesoPrecioEntradas.Eof) then
       begin
         IBQDatosRefPesoPrecioEntradas.Locate('categoria',IBQREPProduccionEntradas.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
         IBQREPProduccionEntradas.FieldByName('PROMPESOCAMPO').AsFloat:= IBQDatosRefPesoPrecioEntradas.fieldbyname('pesoprom').AsFloat;
       end;
    end;

///    esto es una prueba
  IBQEntradasAuxEventos.Close;
  IBQEntradasAuxEventos.ParamByName('FECHA').AsDateTime := IBQREPProduccionEntradas.FieldByName('FECHA').AsDateTime;
  IBQEntradasAuxEventos.ParamByName('TIPOBAJA').AsString := IBQREPProduccionEntradas.FieldByName('TIPOBAJA').AsString;
  IBQEntradasAuxEventos.ParamByName('CATEGORIA').AsString := IBQREPProduccionEntradas.FieldByName('CATEGORIA').AsString;
  IBQEntradasAuxEventos.ParamByName('IDCATEGORIA').AsInteger := IBQREPProduccionEntradas.FieldByName('IDCATEGORIA').AsInteger;

  IBQEntradasAuxEventos.Open;
  IBQEntradasAuxEventos.First;

  if (not IBQEntradasAuxEventos.Eof) then
    IBQREPProduccionEntradas.FieldByName('PROMPESOCAMPO').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQEntradasAuxEventos.FieldByName('PESO').AsFloat));
////


//  if (IBQREPProduccionEntradas.FieldByName('PRECIOKILO').AsFloat = 0) then
//    begin
     //IBQDatosTabPesoPrecioCat.Locate('categoria',IBQREPProduccionEntradas.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
     //IBQREPProduccionEntradas.FieldByName('PRECIOKILO').AsFloat:= IBQDatosTabPesoPrecioCat.fieldbyname('precioprom').AsFloat;



     if not(IBQDatosRefPesoPrecioEntradas.Eof) then
       begin
         IBQDatosRefPesoPrecioEntradas.Locate('categoria',IBQREPProduccionEntradas.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
         //IBQREPProduccionEntradas.FieldByName('PRECIOKILO').AsFloat:= IBQDatosRefPesoPrecioEntradas.fieldbyname('precioprom').AsFloat;
         IBQREPProduccionEntradas.FieldByName('PRECIO').AsFloat:= IBQDatosRefPesoPrecioEntradas.fieldbyname('precioprom').AsFloat;

         if (IBQDatosRefPesoPrecioEntradas.FieldByName('pesoprom').AsFloat <> 0) then
           begin
              IBQREPProduccionEntradas.FieldByName('PRECIOKILO').AsFloat:= IBQDatosRefPesoPrecioEntradas.fieldbyname('precioprom').AsFloat/IBQDatosRefPesoPrecioEntradas.FieldByName('pesoprom').AsFloat;
           end;

       end;
//    end;



///
  if (not IBQEntradasAuxEventos.Eof) then
    IBQREPProduccionEntradas.FieldByName('PRECIOKILO').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQEntradasAuxEventos.FieldByName('PRECIO').AsFloat));
//


  IBQREPProduccionEntradas.FieldByName('KGTOTALCAMPO').AsFloat:= IBQREPProduccionEntradas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionEntradas.FieldByName('PROMPESOCAMPO').AsFloat;

//  IBQREPProduccionEntradas.FieldByName('GASTOSCOMER').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionEntradas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionEntradas.FieldByName('PROMPESOCAMPO').AsFloat * IBQREPProduccionEntradas.FieldByName('PRECIOKILO').AsFloat)*0.04));
  //IBQREPProduccionEntradas.FieldByName('GASTOSCOMER').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionEntradas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionEntradas.FieldByName('PROMPESOCAMPO').AsFloat * IBQREPProduccionEntradas.FieldByName('PRECIOKILO').AsFloat)));
//  IBQREPProduccionEntradas.FieldByName('GASTOSCOMER').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionEntradas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionEntradas.FieldByName('PRECIO').AsFloat)));
  IBQREPProduccionEntradas.FieldByName('GASTOSCOMER').AsFloat:= IBQREPProduccionEntradas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionEntradas.FieldByName('GASTOS').AsFloat;

  //IBQREPProduccionEntradas.FieldByName('VALORCOMPRA').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionEntradas.FieldByName('PRECIOKILO').AsFloat * IBQREPProduccionEntradas.FieldByName('KGTOTALCAMPO').AsFloat) + IBQREPProduccionEntradas.FieldByName('GASTOSCOMER').AsFloat));
  IBQREPProduccionEntradas.FieldByName('VALORCOMPRA').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionEntradas.FieldByName('CABEZAS').AsFloat * IBQREPProduccionEntradas.FieldByName('PRECIO').AsFloat + IBQREPProduccionEntradas.FieldByName('GASTOSCOMER').AsFloat)));


  IBQREPProduccionEntradas.FieldByName('GASTOSCOMER').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQREPProduccionEntradas.FieldByName('GASTOSCOMER').AsFloat)));

  IBQREPProduccionEntradas.FieldByName('PRECIO').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQREPProduccionEntradas.FieldByName('PRECIO').AsFloat));



end;

procedure TFREPProduccionCarne.CompletarDatosFormulario;
var cabSalidas, cabEntradas, kgTotalDestino,  kgTotalCampo,valorVenta,
    valorCompra, cabExistFinal, cabExistInicial, kilosTotalExistFinal,
    KilosTotalExistInicial, netoExistFinal, netoExistInicial,
    supganaderaefectiva, existenciapromedio,kgexisthacienda,evexistenciaprom: Extended;
begin
  ClearLabel();
  cabSalidas:= 0;
  cabEntradas:= 0;
  kgTotalDestino:= 0;
  kgTotalCampo:= 0;
  valorVenta:= 0;
  valorCompra:= 0;
  cabExistFinal:= 0;
  cabExistInicial:= 0;
  kilosTotalExistFinal:= 0;
  KilosTotalExistInicial:= 0;
  netoExistFinal:= 0;
  netoExistInicial:= 0;
  supganaderaefectiva:= 0;
  existenciapromedio:= 0;
  kgexisthacienda:= 0;
  evexistenciaprom:= 0;

  IBQREPProduccionSalidas.First;
  while not(IBQREPProduccionSalidas.Eof) do
    begin
      cabSalidas:= cabSalidas + IBQREPProduccionSalidas.FieldByName('CABEZAS').AsFloat;
      kgTotalDestino:= kgTotalDestino + IBQREPProduccionSalidas.FieldByName('KGTOTALDESTINO').AsFloat;
      valorVenta:= valorVenta + IBQREPProduccionSalidas.FieldByName('VALORVENTA').AsFloat;
      IBQREPProduccionSalidas.Next;
    end;

  LCabSalidas.Caption:= FloatToStr(cabSalidas);

  LKgTotalDestino.Caption:= FloatToStr(kgTotalDestino);

  LValorVenta.Caption:= FloatToStr(valorVenta);


  IBQREPProduccionEntradas.First;
  while not(IBQREPProduccionEntradas.Eof) do
    begin
      cabEntradas:= cabEntradas + IBQREPProduccionEntradas.FieldByName('CABEZAS').AsFloat;
      kgTotalCampo:= kgTotalCampo + IBQREPProduccionEntradas.FieldByName('KGTOTALCAMPO').AsFloat;
      valorCompra:= valorCompra + IBQREPProduccionEntradas.FieldByName('VALORCOMPRA').AsFloat;
      IBQREPProduccionEntradas.Next;
    end;

  LCabEntradas.Caption:= FloatToStr(cabEntradas);
  LKgTotalCampo.Caption:= FormatFloat('###0.00',kgTotalCampo);
  LValorCompra.Caption:= FormatFloat('###0.00',valorCompra);


  IBQGetExistenciaFinal.First;
  while not(IBQGetExistenciaFinal.Eof) do
    begin
      cabExistFinal:= cabExistFinal + IBQGetExistenciaFinal.FieldByName('TOTALEXISTENCIA').AsFloat;
      kilosTotalExistFinal:= kilosTotalExistFinal + IBQGetExistenciaFinal.FieldByName('KILOSTOTAL').AsFloat;
      netoExistFinal:= netoExistFinal + IBQGetExistenciaFinal.FieldByName('TOTALPRECIO').AsFloat;  //O PRECIO UNITARIO
      IBQGetExistenciaFinal.Next;
    end;

  LCabExistFinal.Caption:= FloatToStr(cabExistFinal);
  LKGExistFinal.Caption:= FormatFloat('###0.00',kilosTotalExistFinal);
  LNetoExistFinal.Caption:= FormatFloat('###0.00',netoExistFinal);

  IBQGetExistenciaInicial.First;
  while not(IBQGetExistenciaInicial.Eof) do
    begin
      cabExistInicial:= cabExistInicial + IBQGetExistenciaInicial.FieldByName('TOTALEXISTENCIA').AsFloat;
      KilosTotalExistInicial:= KilosTotalExistInicial + IBQGetExistenciaInicial.FieldByName('KILOSTOTAL').AsFloat;
      netoExistInicial:= netoExistInicial + IBQGetExistenciaInicial.FieldByName('TOTALPRECIO').AsFloat;  //O PRECIO UNITARIO
      IBQGetExistenciaInicial.Next;
    end;

  existenciapromedio:= IBQExistenciaPromedioTotal.fieldbyname('promedioexistencia').AsFloat;
  LExistPromDiaria.Caption:= FloatToStr(existenciapromedio);
  LCabExistHacienda.Caption:= LExistPromDiaria.Caption   ;


  if CBEv.Checked then
  begin
    evexistenciaprom:= IBQExistPromEV.fieldbyname('totalexistencia').AsFloat;
    LEVExistHacienda.Caption:= FormatFloat('###0.00',evexistenciaprom);
  end
  else
  begin
    evexistenciaprom := 0;
    LEVExistHacienda.Visible := false;
  end;

  //supganaderaefectiva:= IBQSupGanaderaEfectiva.FieldByName('supganaderaefectiva').AsFloat;
  supganaderaefectiva := 1;
{  if ((supganaderaefectiva = 0) and (StrToFloat(LSupGanadera.Caption) <> 0)) then
    supganaderaefectiva:= StrToFloat(LSupGanadera.Caption);
 }
  LSupGanadera.Caption:= FloatToStr(supganaderaefectiva);

  SupGanaderaVisible();
  {if (LSupGanadera.Caption = '0') then
    begin
      {Label32.Caption:= '';
      Label33.Caption:= '';
      Label42.Caption:= 'Kg';
      Label43.Caption:= '$';}
      {Label32.Visible:= false;
      Label33.Visible:= false;
      Label42.Visible:= false;
      Label43.Visible:= false;
      Shape32.Visible:= false;
      Shape22.Visible:= false;
    end
  else
     begin
       {Label32.Caption:= 'Por Ha:';
       Label33.Caption:= 'Por Ha:';
       Label42.Caption:= 'Kg/ha';
       Label43.Caption:= '$/ha';}

       {Label32.Visible:= true;
       Label33.Visible:= true;
       Label42.Visible:= true;
       Label43.Visible:= true;
       Shape32.Visible:= true;
       Shape22.Visible:= true;
     end; }

  LCabExistInicial.Caption:= FloatToStr(cabExistInicial);
  LKGExistInicial.Caption:= FormatFloat('###0.00',KilosTotalExistInicial);
  LNetoExistInicial.Caption:= FormatFloat('###0.00',netoExistInicial);

  LKGDifInventario.Caption:= FormatFloat('###0.00',KilosTotalExistFinal - KilosTotalExistInicial);
  LPesosDifInventario.Caption:= FormatFloat('###0.00',netoExistFinal - netoExistInicial);

  LKGProduccionCarne.Caption:= FormatFloat('###0.00',kgTotalDestino - kgTotalCampo + KilosTotalExistFinal - KilosTotalExistInicial);


  LIngresoNeto.Caption:= FormatFloat('###0.00',valorVenta - valorCompra + netoExistFinal - netoExistInicial);


  kgexisthacienda:= kilosTotalExistFinal - KilosTotalExistInicial;
  LKGExistHacienda.Caption:=FormatFloat('###0.00',kgexisthacienda);


  if (supganaderaefectiva <> 0) then
    begin
      LKgProduccionCarneHa.Caption:= FormatFloat('###0.00',((kgTotalDestino - kgTotalCampo + KilosTotalExistFinal - KilosTotalExistInicial)/supganaderaefectiva));
      LIngresoNetoHa.Caption:= FormatFloat('###0.00',((valorVenta - valorCompra + netoExistFinal - netoExistInicial)/supganaderaefectiva));
    end
   else
     begin
       LKgProduccionCarneHa.Caption:= '0';
       LIngresoNetoHa.Caption:= '0';
     end;
   LProdHa.Caption:= LKgProduccionCarneHa.Caption;
   LIngresoHa.Caption:= LIngresoNetoHa.Caption;

   if (kgexisthacienda <> 0) then
     LEficienciaStock.Caption:=  FormatFloat('###0.00',StrToFloat(LKGProduccionCarne.Caption) / kgexisthacienda)
    else
      LEficienciaStock.Caption:= '0';
end;

procedure TFREPProduccionCarne.IBQGetExistenciaInicialCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  
  if (IBQGetExistenciaInicial.FieldByName('PROMPESOCAMPO').AsFloat = 0) then//peso respeto el que viene
  begin

     if not(IBQDatosRefPesoPrecioExistenciaInicial.Eof) then
     begin
         IBQDatosRefPesoPrecioExistenciaInicial.Locate('categoria',IBQGetExistenciaInicial.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
         IBQGetExistenciaInicial.FieldByName('PROMPESOCAMPO').AsFloat:= IBQDatosRefPesoPrecioExistenciaInicial.fieldbyname('pesoprom').AsFloat;
         IBQGetExistenciaInicial.FieldByName('KILOSTOTAL').AsFloat:= IBQGetExistenciaInicial.FieldByName('PROMPESOCAMPO').AsFloat*IBQGetExistenciaInicial.FieldByName('TOTALEXISTENCIA').AsFloat;
     end;
  end;

  if not(IBQDatosRefPesoPrecioExistenciaInicial.Eof) then
  begin
         IBQDatosRefPesoPrecioExistenciaInicial.Locate('categoria',IBQGetExistenciaInicial.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
         IBQGetExistenciaInicial.FieldByName('PROMPRECIOUNITARIO').AsFloat:= IBQDatosRefPesoPrecioExistenciaInicial.fieldbyname('precioprom').AsFloat;

         if (IBQDatosRefPesoPrecioExistenciaInicial.FieldByName('pesoprom').AsFloat <> 0) then
         begin
              IBQGetExistenciaInicial.FieldByName('PROMPRECIOUNITARIO').AsFloat:= IBQDatosRefPesoPrecioExistenciaInicial.fieldbyname('precioprom').AsFloat/IBQDatosRefPesoPrecioExistenciaInicial.FieldByName('pesoprom').AsFloat;
         end;
  end;

  IBQGetExistenciaInicial.FieldByName('TOTALPRECIO').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQGetExistenciaInicial.FieldByName('TOTALEXISTENCIA').AsFloat * IBQGetExistenciaInicial.FieldByName('PROMPRECIOUNITARIO').AsFloat + IBQGetExistenciaInicial.FieldByName('TOTALEXISTENCIA').AsFloat * IBQGetExistenciaInicial.FieldByName('GASTOS').AsFloat)));

  IBQGetExistenciaInicial.FieldByName('EQUIVTOTAL').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQGetExistenciaInicial.FieldByName('TOTALEXISTENCIA').AsFloat * IBQGetExistenciaInicial.FieldByName('EQUIV').AsFloat));

  IBQGetExistenciaInicial.FieldByName('EQUIV').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQGetExistenciaInicial.FieldByName('EQUIV').AsFloat));

  IBQGetExistenciaInicial.FieldByName('PROMPRECIOUNITARIO').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQGetExistenciaInicial.FieldByName('PROMPRECIOUNITARIO').AsFloat));

end;

procedure TFREPProduccionCarne.IBQGetExistenciaFinalCalcFields(
  DataSet: TDataSet);
begin
  inherited;

  if (IBQGetExistenciaFinal.FieldByName('PROMPESOCAMPO').AsFloat = 0) then
  begin

     if not(IBQDatosRefPesoPrecioExistenciaFinal.Eof) then
     begin
         IBQDatosRefPesoPrecioExistenciaFinal.Locate('categoria',IBQGetExistenciaFinal.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
         IBQGetExistenciaFinal.FieldByName('PROMPESOCAMPO').AsFloat:= IBQDatosRefPesoPrecioExistenciaFinal.fieldbyname('pesoprom').AsFloat;
         IBQGetExistenciaFinal.FieldByName('KILOSTOTAL').AsFloat:= IBQGetExistenciaFinal.FieldByName('PROMPESOCAMPO').AsFloat*IBQGetExistenciaFinal.FieldByName('TOTALEXISTENCIA').AsFloat;
     end;
  end;

  if not(IBQDatosRefPesoPrecioExistenciaFinal.Eof) then
  begin
         IBQDatosRefPesoPrecioExistenciaFinal.Locate('categoria',IBQGetExistenciaFinal.FieldByName('idcategoria').AsInteger, [loCaseInsensitive]);
         IBQGetExistenciaFinal.FieldByName('PROMPRECIOUNITARIO').AsFloat:= IBQDatosRefPesoPrecioExistenciaFinal.fieldbyname('precioprom').AsFloat;

         if (IBQDatosRefPesoPrecioExistenciaFinal.FieldByName('pesoprom').AsFloat <> 0) then
         begin
              IBQGetExistenciaFinal.FieldByName('PROMPRECIOUNITARIO').AsFloat:= IBQDatosRefPesoPrecioExistenciaFinal.fieldbyname('precioprom').AsFloat/IBQDatosRefPesoPrecioExistenciaFinal.FieldByName('pesoprom').AsFloat;
         end;
  end;

  IBQGetExistenciaFinal.FieldByName('TOTALPRECIO').AsFloat:= StrToFloat(FormatFloat('###0.00',(IBQGetExistenciaFinal.FieldByName('TOTALEXISTENCIA').AsFloat * IBQGetExistenciaFinal.FieldByName('PROMPRECIOUNITARIO').AsFloat + IBQGetExistenciaFinal.FieldByName('TOTALEXISTENCIA').AsFloat * IBQGetExistenciaFinal.FieldByName('GASTOS').AsFloat)));

  IBQGetExistenciaFinal.FieldByName('EQUIVTOTAL').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQGetExistenciaFinal.FieldByName('TOTALEXISTENCIA').AsFloat * IBQGetExistenciaFinal.FieldByName('EQUIV').AsFloat));

  IBQGetExistenciaFinal.FieldByName('EQUIV').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQGetExistenciaFinal.FieldByName('EQUIV').AsFloat));

  IBQGetExistenciaFinal.FieldByName('PROMPRECIOUNITARIO').AsFloat:= StrToFloat(FormatFloat('###0.00',IBQGetExistenciaFinal.FieldByName('PROMPRECIOUNITARIO').AsFloat));

end;

procedure TFREPProduccionCarne.closeUpFechas(Sender: TObject);
var anio, bisiesto, auxdias, anio2, bisiesto2, auxdias2: Integer;
begin
 { auxdias:= 364;
  if (TDateTimePickerAuto(Sender).Name = 'DTPADesde') then
    begin
      Desde := DTPADesde.Date;

      anio:= YearOf(Desde);
      bisiesto:= trunc(anio/4);
      bisiesto:= anio - 4*bisiesto;{A/B = A - B*trunc(A/B)}

    {  Hasta := IncYear(Desde,1);

      if ((bisiesto <> 0) or (MonthOf(Desde) <> 2) or (DayOf(Desde) <> 29)) then
        Hasta := IncDay(Hasta,-1);

      DTPAHasta.Date:= Hasta;
    end
   else
    if (TDateTimePickerAuto(Sender).Name = 'DTPAHasta') then
      begin
        Hasta := DTPAHasta.Date;

        anio:= YearOf(Hasta);
        bisiesto:= trunc(anio/4);
        bisiesto:= anio - 4*bisiesto;{A/B = A - B*trunc(A/B)}

   {     if (bisiesto = 0) then
          auxdias:= 364
         else
           auxdias:= 365;

        Desde := IncYear(Hasta,-1);

        if ((bisiesto <> 0) or (MonthOf(Hasta) <> 2) or (DayOf(Hasta) <> 29)) then
          Desde := IncDay(Desde,1);

        DTPADesde.Date:= Desde;
      end;         }

//  ActualizarConsulta;
end;

procedure TFREPProduccionCarne.DTPAFechasKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    closeUpFechas(Sender);
end;

procedure TFREPProduccionCarne.DBLCBAActividadCloseUp(Sender: TObject);
begin
  inherited;
  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;
//  ActualizarConsulta;
end;

procedure TFREPProduccionCarne.DBLCBAActividadKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBAActividad.ListVisible) then
    DBLCBAActividadCloseUp(nil);
end;

procedure TFREPProduccionCarne.ClearLabel;
begin
  LCabSalidas.Caption:= '0';
  LKgTotalDestino.Caption:= '0';
  LValorVenta.Caption:= '0';
  LCabEntradas.Caption:= '0';
  LKgTotalCampo.Caption:= '0';
  LValorCompra.Caption:= '0';
  LProdHa.Caption:= '0';
  LIngresoHa.Caption:= '0';
  LCabExistFinal.Caption:= '0';
  LKGExistFinal.Caption:= '0';
  LNetoExistFinal.Caption:= '0';
  LCabExistInicial.Caption:= '0';
  LKGExistInicial.Caption:= '0';
  LNetoExistInicial.Caption:= '0';
  LKGDifInventario.Caption:= '0';
  LPesosDifInventario.Caption:= '0';
  LExistPromDiaria.Caption:= '0';
  LSupGanadera.Caption:= '0';
  LKGProduccionCarne.Caption:= '0';
  LIngresoNeto.Caption:= '0';
  LKgProduccionCarneHa.Caption:= '0';
  LIngresoNetoHa.Caption:= '0';
  LKGExistHacienda.Caption:= '0';
  LCabExistHacienda.Caption:= '0';
  LEVExistHacienda.Caption:= '0';
  LEficienciaStock.Caption:= '0';
end;

procedure TFREPProduccionCarne.FormShow(Sender: TObject);
begin
  inherited;
  ClearLabel();
//  CargarFechaTabPrecioPesoCat();

  IBQSeleccionados.Close;
  IBQSeleccionados.Open;
  IBQDisponibles.Close;
  IBQDisponibles.Open;

  DTPADesde.DateTime := IncYear(Date,-1);
  DTPAHasta.DateTime := Date();
//  DTPAHasta.DateTime:= StrToDate('30/06/'+IntToStr(YearOf(now())));

  closeUpFechas(DTPADesde);

  Desde := DTPADesde.Date;
  Hasta := DTPAHasta.Date;

  //ActualizarConsulta;

  CargarIBQTabRefCat();

end;

procedure TFREPProduccionCarne.CargarFechaTabPrecioPesoCat;
begin
 { IBQFechaTabPesoPrecioCat.Close;
  IBQFechaTabPesoPrecioCat.ParamByName('ESTA').AsInteger:= FPrincipal.EstablecimientoActual;
  IBQFechaTabPesoPrecioCat.Open;
  DMSoftvet.IBQAfterOpen(IBQFechaTabPesoPrecioCat);
  IBQFechaTabPesoPrecioCat.First;
  CargarDatosTabPrecioPesoCat();   }
end;

procedure TFREPProduccionCarne.BBCalcularClick(Sender: TObject);
begin
  inherited;
  ActualizarConsulta;
end;

procedure TFREPProduccionCarne.BBEntradasSalidasClick(Sender: TObject);
var F: TFRepEntradasSalidasCarne;
begin
  inherited;

  F:= TFRepEntradasSalidasCarne.Create(self);
  F.GenerarGrillaEntradas(IBQREPProduccionEntradas);
  F.GenerarGrillaSalidas(IBQREPProduccionSalidas);
  F.ShowModal;
  F.Destroy;

  CompletarDatosFormulario;

end;

procedure TFREPProduccionCarne.BBCambiarSuperficieGanaderaClick(
  Sender: TObject);
begin
  inherited;
  if (BBCambiarSuperficieGanadera.Caption = Traducir('Cambiar Superficie')) then
    begin
      BBCambiarSuperficieGanadera.Caption:= Traducir('Confirmar');
      EACambiarSuperficieGanadera.Visible:= true;
      BBCancelarSuperficie.Visible:= True;
      EACambiarSuperficieGanadera.Text:= LSupGanadera.Caption;
      EACambiarSuperficieGanadera.SetFocus;
      EACambiarSuperficieGanadera.SelectAll;
    end
   else
    if (BBCambiarSuperficieGanadera.Caption = Traducir('Confirmar')) then
      begin
         LSupGanadera.Caption:= EACambiarSuperficieGanadera.Text;
         BBCancelarSuperficieClick(nil);

        SupGanaderaVisible();
        if (StrToFloat(LSupGanadera.Caption) <> 0) then
          begin
            LKgProduccionCarneHa.Caption:= FormatFloat('###0.00',((StrToFloat(LKgTotalDestino.Caption) - StrToFloat(LKgTotalCampo.Caption) + StrToFloat(LKGExistFinal.Caption) - StrToFloat(LKGExistInicial.Caption))/StrToFloat(LSupGanadera.Caption)));
            LIngresoNetoHa.Caption:= FormatFloat('###0.00',((StrToFloat(LValorVenta.Caption) - StrToFloat(LValorCompra.Caption) + StrToFloat(LNetoExistFinal.Caption) - StrToFloat(LNetoExistInicial.Caption))/StrToFloat(LSupGanadera.Caption)));
            Label32.Caption:= 'Por Ha:';
            Label33.Caption:= 'Por Ha:';
            Label42.Caption:= 'Kg/ha';
            Label43.Caption:= '$/ha';
          end
         else
           begin
             LKgProduccionCarneHa.Caption:= '0';
             LIngresoNetoHa.Caption:= '0';
             Label32.Caption:= '';
             Label33.Caption:= '';
             Label42.Caption:= 'Kg';
             Label43.Caption:= '$';
           end;

         LProdHa.Caption:= LKgProduccionCarneHa.Caption;
         LIngresoHa.Caption:= LIngresoNetoHa.Caption;

      end
end;

procedure TFREPProduccionCarne.BBCancelarSuperficieClick(Sender: TObject);
begin
  inherited;
  EACambiarSuperficieGanadera.Visible:= false;
  BBCambiarSuperficieGanadera.Caption:= Traducir('Cambiar Superficie');
  BBCancelarSuperficie.Visible:= false;
end;

procedure TFREPProduccionCarne.BBCambiarClick(Sender: TObject);
var F: TFRepReferenciasPesosPrecios;
begin
  inherited;

  F:= TFRepReferenciasPesosPrecios.Create(self);
  F.ShowModal;
  F.Destroy;

  CargarIBQTabRefCat();
end;

procedure TFREPProduccionCarne.CargarIBQTabRefCat;
begin
  try
    LFechaSalidas.Caption:= '';
    LFechaEntradas.Caption:= '';
    LFechaExistenciaFinal.Caption:= '';
    LFechaExistenciaInicial.Caption:= '';
    LNombreSalidas.Caption:= '';
    LNombreEntradas.Caption:= '';
    LNombreExistenciaFinal.Caption:= '';
    LNombreExistenciaInicial.Caption:= '';


    IBQDatosRefPesoPrecioSalidas.Close;
    IBQDatosRefPesoPrecioEntradas.Close;
    IBQDatosRefPesoPrecioExistenciaFinal.Close;
    IBQDatosRefPesoPrecioExistenciaInicial.Close;

    IBQTABREFCAT.Close;
    IBQTABREFCAT.ParamByName('Establecimiento').AsInteger:= FPrincipal.EstablecimientoActual;
    IBQTABREFCAT.Open;

    IBQTABREFCAT.First;
    while not(IBQTABREFCAT.Eof) do
      begin
        if (IBQTABREFCAT.fieldbyname('tipo').AsString = 'SALIDAS') then
          begin
               LFechaSalidas.Caption:= DateToStr(IBQTABREFCAT.fieldbyname('FECHA').AsDateTime);
               LNombreSalidas.Caption:= IBQTABREFCAT.fieldbyname('nombre').AsString;

               IBQDatosRefPesoPrecioSalidas.Close;
               IBQDatosRefPesoPrecioSalidas.ParamByName('idtabrefcat').AsInteger:= IBQTABREFCAT.fieldbyname('id_tab_ref_cat').AsInteger;
               IBQDatosRefPesoPrecioSalidas.Open;
               IBQDatosRefPesoPrecioSalidas.First;
          end
         else
            if (IBQTABREFCAT.fieldbyname('tipo').AsString = 'ENTRADAS') then
              begin
                 LFechaEntradas.Caption:= DateToStr(IBQTABREFCAT.fieldbyname('FECHA').AsDateTime);
                 LNombreEntradas.Caption:= IBQTABREFCAT.fieldbyname('nombre').AsString;

                 IBQDatosRefPesoPrecioEntradas.Close;
                 IBQDatosRefPesoPrecioEntradas.ParamByName('idtabrefcat').AsInteger:= IBQTABREFCAT.fieldbyname('id_tab_ref_cat').AsInteger;
                 IBQDatosRefPesoPrecioEntradas.Open;
                 IBQDatosRefPesoPrecioEntradas.First;
              end
             else
                if (IBQTABREFCAT.fieldbyname('tipo').AsString = 'EXISTENCIAFINAL') then
                  begin
                      LFechaExistenciaFinal.Caption:= DateToStr(IBQTABREFCAT.fieldbyname('FECHA').AsDateTime);
                      LNombreExistenciaFinal.Caption:= IBQTABREFCAT.fieldbyname('nombre').AsString;

                      IBQDatosRefPesoPrecioExistenciaFinal.Close;
                      IBQDatosRefPesoPrecioExistenciaFinal.ParamByName('idtabrefcat').AsInteger:= IBQTABREFCAT.fieldbyname('id_tab_ref_cat').AsInteger;
                      IBQDatosRefPesoPrecioExistenciaFinal.Open;
                      IBQDatosRefPesoPrecioExistenciaFinal.First;
                  end
                 else
                  if (IBQTABREFCAT.fieldbyname('tipo').AsString = 'EXISTENCIAINICIAL') then
                    begin
                       LFechaExistenciaInicial.Caption:= DateToStr(IBQTABREFCAT.fieldbyname('FECHA').AsDateTime);
                       LNombreExistenciaInicial.Caption:= IBQTABREFCAT.fieldbyname('nombre').AsString;

                       IBQDatosRefPesoPrecioExistenciaInicial.Close;
                       IBQDatosRefPesoPrecioExistenciaInicial.ParamByName('idtabrefcat').AsInteger:= IBQTABREFCAT.fieldbyname('id_tab_ref_cat').AsInteger;
                       IBQDatosRefPesoPrecioExistenciaInicial.Open;
                       IBQDatosRefPesoPrecioExistenciaInicial.First;
                    end;
         IBQTABREFCAT.Next;
      end;
  except on e:exception do
     FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFREPProduccionCarne.SupGanaderaVisible;
begin
  if (LSupGanadera.Caption = '0') then
    begin
      {Label32.Caption:= '';
      Label33.Caption:= '';
      Label42.Caption:= 'Kg';
      Label43.Caption:= '$';}
      Label32.Visible:= false;
      Label33.Visible:= false;
      Label42.Visible:= false;
      Label43.Visible:= false;
      Shape32.Visible:= false;
      Shape22.Visible:= false;
      LKgProduccionCarneHa.Visible:= false;
      LIngresoNetoHa.Visible:= false;
      Label24.Caption:= Traducir('Existencia Promedio diaria');
      Label26.Caption:= Traducir('Cab');
      LExistPromDiaria.Caption:= FormatFloat('###0.00',IBQExistenciaPromedioTotal.fieldbyname('promedioexistencia').AsFloat);
    end
  else
     begin
       {Label32.Caption:= 'Por Ha:';
       Label33.Caption:= 'Por Ha:';
       Label42.Caption:= 'Kg/ha';
       Label43.Caption:= '$/ha';}

       Label32.Visible:= true;
       Label33.Visible:= true;
       Label42.Visible:= true;
       Label43.Visible:= true;
       Shape32.Visible:= true;
       Shape22.Visible:= true;
       LKgProduccionCarneHa.Visible:= true;
       LIngresoNetoHa.Visible:= true;
       Label24.Caption:= Traducir('Carga Promedio diaria');
       Label26.Caption:= Traducir('Cab/ha');
       LExistPromDiaria.Caption:= FormatFloat('###0.00',(IBQExistenciaPromedioTotal.fieldbyname('promedioexistencia').AsFloat)/StrToFloat(LSupGanadera.Caption));
     end;
end;

procedure TFREPProduccionCarne.EACambiarSuperficieGanaderaKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
    begin
      BBCambiarSuperficieGanaderaClick(BBCambiarSuperficieGanadera);
      key:= #0;
    end;
end;

procedure TFREPProduccionCarne.CBPrecioClick(Sender: TObject);
begin
  inherited;
  //ActualizarConsulta;
end;

procedure TFREPProduccionCarne.DTPAHastaChange(Sender: TObject);
begin
  inherited;
  Hasta := DTPAHasta.Date;
  //ActualizarConsulta;
end;

procedure TFREPProduccionCarne.BPasar1Click(Sender: TObject);
begin
  inherited;
  if not IBQDisponibles.IsEmpty then
  begin
    try
      IBQSeleccionados.Insert;
      IBQSeleccionados.FieldByName('id_animal_externo').Value := IBQDisponibles.FieldValues['id_categoria'];
      IBQSeleccionados.FieldByName('id_aux').Value := 0;
      IBQSeleccionados.FieldByName('nombre').Value := IBQDisponibles.FieldValues['nombre'];
      IBQSeleccionados.Post;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
  IBQSeleccionados.Close;
  IBQSeleccionados.Open;
  IBQDisponibles.Close;
  IBQDisponibles.Open;

  BPasar1.Enabled := not IBQDisponibles.IsEmpty;
  BSacar1.Enabled := not IBQSeleccionados.IsEmpty;
end;

procedure TFREPProduccionCarne.BSacar1Click(Sender: TObject);
begin
  inherited;
  if not IBQDisponibles.IsEmpty then
  begin
    try
      IBQSeleccionados.Delete;
      FPrincipal.IBTPrincipal.CommitRetaining;
    except
      FPrincipal.IBTPrincipal.RollbackRetaining;
    end;
  end;
  IBQSeleccionados.Close;
  IBQSeleccionados.Open;
  IBQDisponibles.Close;
  IBQDisponibles.Open;

  BSacar1.Enabled := not IBQSeleccionados.IsEmpty;
  BPasar1.Enabled := not IBQDisponibles.IsEmpty;
end;

procedure TFREPProduccionCarne.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  BBCalcular.OnClick(Sender);
end;

end.
