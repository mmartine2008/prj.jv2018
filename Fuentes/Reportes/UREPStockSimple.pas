unit UREPStockSimple;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  Menus, DB, IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, jpeg,
  IBStoredProc, DataExport, DataToXLS, WinXP, QRPDFFilt, QRWebFilt,
  QRExport, UMensajeImpresora, PngImage, JvGIF, JvExControls, JvLabel,
  ImgList, PngImageList, JvExExtCtrls, JvImage;

type
  TFREPStockSimple = class(TFUniversal)
    ACSalir: TAction;
    PopupMenu1: TPopupMenu;
    Salir1: TMenuItem;
    Panel2: TPanel;
    GBCategoria: TGroupBox;
    GBEdadToros: TGroupBox;
    LabelCategoriaTernero: TLabel;
    LabelCategoriaNovillo: TLabel;
    LabelCategoriaToro: TLabel;
    LabelCategoriaTernera: TLabel;
    LabelCategoriaVaquillona: TLabel;
    LabelCategoriaVaca: TLabel;
    LabelEdad0: TLabel;
    LabelEdad1: TLabel;
    LabelEdad2: TLabel;
    LabelEdad3: TLabel;
    LabelEdad4: TLabel;
    LabelEdad5: TLabel;
    LabelCategoriaTerneroTotal: TLabel;
    LabelCategoriaNovilloTotal: TLabel;
    LabelCategoriaToroTotal: TLabel;
    LabelCategoriaTerneraTotal: TLabel;
    LabelCategoriaVaquillonaTotal: TLabel;
    LabelCategoriaVacaTotal: TLabel;
    LabelEdad0Total: TLabel;
    LabelEdad1Total: TLabel;
    LabelEdad2Total: TLabel;
    LabelEdad3Total: TLabel;
    LabelEdad4Total: TLabel;
    LabelEdad5Total: TLabel;
    IBQSPStockSimple: TIBQuery;
    QR: TQuickRep;
    QRBand1: TQRBand;
    LabelCantidadMachos: TQRLabel;
    QRLCantidadMachosTotal: TQRLabel;
    QRShape2: TQRShape;
    LabelCantidadHembras: TQRLabel;
    LabelCantidadVacias: TQRLabel;
    QRLCantidadHembrasTotal: TQRLabel;
    LabelCantidadPreniadas: TQRLabel;
    LabelCantidadDudosas: TQRLabel;
    QRShape4: TQRShape;
    LabelPorSexo: TQRLabel;
    LabelPorEstadoRepro: TQRLabel;
    QRLCantidadTotalVacias: TQRLabel;
    QRLCantidadTotalPreniadas: TQRLabel;
    QRLCantidadTotalNoDefinidas: TQRLabel;
    LabelPorEstadoLactacion: TQRLabel;
    LabelLacta0: TQRLabel;
    LabelLacta1: TQRLabel;
    LabelLacta2: TQRLabel;
    LabelLacta3: TQRLabel;
    LabelLactaMayor: TQRLabel;
    LabelLacta0Total: TQRLabel;
    LabelLacta1Total: TQRLabel;
    LabelLacta2Total: TQRLabel;
    LabelLacta3Total: TQRLabel;
    LabelLactaMayorTotal: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    LabelCateTernero: TQRLabel;
    LabelCateNovillo: TQRLabel;
    LabelCateToro: TQRLabel;
    LabelCateTernera: TQRLabel;
    LabelCateVaquillona: TQRLabel;
    LabelCateVaca: TQRLabel;
    LabelCateTerneroTotal: TQRLabel;
    LabelCateNovilloTotal: TQRLabel;
    LabelCateToroTotal: TQRLabel;
    LabelCateTerneraTotal: TQRLabel;
    LabelCateVaquillonaTotal: TQRLabel;
    LabelCateVacaTotal: TQRLabel;
    LabelEdadToros0: TQRLabel;
    LabelEdadToros0Total: TQRLabel;
    LabelEdadToros1: TQRLabel;
    LabelEdadToros1Total: TQRLabel;
    LabelEdadToros2: TQRLabel;
    LabelEdadToros2Total: TQRLabel;
    LabelEdadToros3: TQRLabel;
    LabelEdadToros3Total: TQRLabel;
    LabelEdadToros4: TQRLabel;
    LabelEdadToros4Total: TQRLabel;
    LabelEdadToros5: TQRLabel;
    LabelEdadToros5Total: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    ACImprimirReporte: TAction;
    IBQAux: TIBQuery;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    LabelTitulo1: TQRLabel;
    QRShape1: TQRShape;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLCantidadTotalEnServicio: TQRLabel;
    QRLCantidadTotalParidas: TQRLabel;
    QRLCantidadTotalServidas: TQRLabel;
    GBSexo: TGroupBox;
    LabelSexoMacho: TLabel;
    LabelSexoHembra: TLabel;
    LabelSexoMachoTotal: TLabel;
    LabelSexoHembraTotal: TLabel;
    QRShape10: TQRShape;
    QRLabel7: TQRLabel;
    QRLabelTotalGeneral: TQRLabel;
    QRLTotalGeneral: TQRLabel;
    QRHTMLFilter1: TQRHTMLFilter;
    Panel1: TPanel;
    GBEstadoRepro: TGroupBox;
    LabelEstadoReproVacia: TLabel;
    LabelEstadoReproPreniada: TLabel;
    LabelEstadoReproVaciaTotal: TLabel;
    LabelEstadoReproPreniadaTotal: TLabel;
    Label1: TLabel;
    LabelEstadoReproNoDefinidaTotal: TLabel;
    Label5: TLabel;
    LabelEstadoReproEnServicioTotal: TLabel;
    Label7: TLabel;
    LabelEstadoReproParidasTotal: TLabel;
    Label9: TLabel;
    LabelEstadoReproServidasTotal: TLabel;
    GBEstadoLactacion: TGroupBox;
    LabelLactacion0: TLabel;
    LabelLactacion1: TLabel;
    LabelLactacion2: TLabel;
    LabelLactacion0Total: TLabel;
    LabelLactacion1Total: TLabel;
    LabelLactacion2Total: TLabel;
    LabelLactacion3: TLabel;
    LabelLactacion3Total: TLabel;
    LabelLactacionMayor: TLabel;
    LabelLactacionMayorTotal: TLabel;
    GPTotalGeneral: TGroupBox;
    LabelTotalGeneral: TLabel;
    LTotalGeneral: TLabel;
    QRShape22: TQRShape;
    QRShape3: TQRShape;
    QRSysData1: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
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
    procedure FormShow(Sender: TObject);
    procedure ACSalirExecute(Sender: TObject);
    procedure ACImprimirReporteExecute(Sender: TObject);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure IBQSPStockSimpleAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure cargarDatosPropietario();
  public
    { Public declarations }
  end;

var
  FREPStockSimple: TFREPStockSimple;

implementation

uses UPrincipal, UCartel, URepGeneral, UTraduccion, uTiposGlobales;

{$R *.dfm}

procedure TFREPStockSimple.FormShow(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando Stock Simple ...';
  cartel.abrircartel(msje);
  inherited;
  self.Caption := Traducir('Huella - Stock Simple');
  self.PTitulo.Caption := Traducir('Stock Simple');

  //  ******* los ejecuto el store procedure get_stock_simple que esta paremetrizado
  IBQSPStockSimple.Active := false;
  IBQSPStockSimple.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSPStockSimple.Active := true;

// por sexo
  LabelSexoMachoTotal.Caption := IBQSPStockSimple.fieldByName('machos').AsString;
  LabelSexoHembraTotal.Caption := IBQSPStockSimple.fieldByName('hembras').AsString;
  ///***** en el reporte
  QRLCantidadMachosTotal.Caption := IBQSPStockSimple.fieldByName('machos').AsString;;
  QRLCantidadHembrasTotal.Caption := IBQSPStockSimple.fieldByName('hembras').AsString;

// total general
  LTotalGeneral.Caption := IntToStr(StrToInt(QRLCantidadMachosTotal.Caption)+StrToInt(QRLCantidadHembrasTotal.Caption));
  //***** en el reporte
  QRLTotalGeneral.Caption := LTotalGeneral.Caption ;

// por estado reproductivo
  LabelEstadoReproVaciaTotal.Caption := IBQSPStockSimple.fieldByName('reproVacia').AsString;
  LabelEstadoReproPreniadaTotal.Caption := IBQSPStockSimple.fieldByName('reproPreniada').AsString;
  LabelEstadoReproNoDefinidaTotal.Caption := IBQSPStockSimple.fieldByName('reproNoDefinida').AsString;
  LabelEstadoReproEnServicioTotal.Caption := IBQSPStockSimple.fieldByName('reproEnServicio').AsString;
  LabelEstadoReproParidasTotal.Caption := IBQSPStockSimple.fieldByName('reproParida').AsString;
  LabelEstadoReproServidasTotal.Caption := IBQSPStockSimple.fieldByName('reproServida').AsString;

  ///***** en el reporte
  QRLCantidadTotalVacias.Caption := IBQSPStockSimple.fieldByName('reproVacia').AsString;
  QRLCantidadTotalPreniadas.Caption := IBQSPStockSimple.fieldByName('reproPreniada').AsString;
  QRLCantidadTotalNoDefinidas.Caption := IBQSPStockSimple.fieldByName('reproNoDefinida').AsString;
  QRLCantidadTotalEnServicio.Caption := IBQSPStockSimple.fieldByName('reproEnServicio').AsString;
  QRLCantidadTotalParidas.Caption := IBQSPStockSimple.fieldByName('reproParida').AsString;
  QRLCantidadTotalServidas.Caption := IBQSPStockSimple.fieldByName('reproServida').AsString;

// por estado de lactacion
  LabelLactacion0Total.Caption := IBQSPStockSimple.fieldByName('Lacta0').AsString;
  LabelLactacion1Total.Caption := IBQSPStockSimple.fieldByName('Lacta1').AsString;
  LabelLactacion2Total.Caption := IBQSPStockSimple.fieldByName('Lacta2').AsString;
  LabelLactacion3Total.Caption := IBQSPStockSimple.fieldByName('Lacta3').AsString;
  LabelLactacionMayorTotal.Caption := IBQSPStockSimple.fieldByName('LactaMayor').AsString;
  ///***** en el reporte
  LabelLacta0Total.Caption := IBQSPStockSimple.fieldByName('Lacta0').AsString;
  LabelLacta1Total.Caption := IBQSPStockSimple.fieldByName('Lacta1').AsString;
  LabelLacta2Total.Caption := IBQSPStockSimple.fieldByName('Lacta2').AsString;
  LabelLacta3Total.Caption := IBQSPStockSimple.fieldByName('Lacta3').AsString;
  LabelLactaMayorTotal.Caption := IBQSPStockSimple.fieldByName('LactaMayor').AsString;

// por categoria
  LabelCategoriaTerneroTotal.Caption := IBQSPStockSimple.fieldByName('CateTernero').AsString;
  LabelCategoriaNovilloTotal.Caption := IBQSPStockSimple.fieldByName('CateNovillo').AsString;
  LabelCategoriaToroTotal.Caption := IBQSPStockSimple.fieldByName('CateToro').AsString;
  LabelCategoriaTerneraTotal.Caption := IBQSPStockSimple.fieldByName('CateTernera').AsString;
  LabelCategoriaVaquillonaTotal.Caption := IBQSPStockSimple.fieldByName('CateVaquillona').AsString;
  LabelCategoriaVacaTotal.Caption := IBQSPStockSimple.fieldByName('CateVaca').AsString;
  ///***** en el reporte
  LabelCateTerneroTotal.Caption := IBQSPStockSimple.fieldByName('CateTernero').AsString;
  LabelCateNovilloTotal.Caption := IBQSPStockSimple.fieldByName('CateNovillo').AsString;
  LabelCateToroTotal.Caption := IBQSPStockSimple.fieldByName('CateToro').AsString;
  LabelCateTerneraTotal.Caption := IBQSPStockSimple.fieldByName('CateTernera').AsString;
  LabelCateVaquillonaTotal.Caption := IBQSPStockSimple.fieldByName('CateVaquillona').AsString;
  LabelCateVacaTotal.Caption := IBQSPStockSimple.fieldByName('CateVaca').AsString;

// por edad de toros jovenes
  LabelEdad0Total.Caption := IBQSPStockSimple.fieldByName('Edad0').AsString;
  LabelEdad1Total.Caption := IBQSPStockSimple.fieldByName('Edad1').AsString;
  LabelEdad2Total.Caption := IBQSPStockSimple.fieldByName('Edad2').AsString;
  LabelEdad3Total.Caption := IBQSPStockSimple.fieldByName('Edad3').AsString;
  LabelEdad4Total.Caption := IBQSPStockSimple.fieldByName('Edad4').AsString;
  LabelEdad5Total.Caption := IBQSPStockSimple.fieldByName('Edad5').AsString;
  ///***** en el reporte
  LabelEdadToros0Total.Caption := IBQSPStockSimple.fieldByName('Edad0').AsString;
  LabelEdadToros1Total.Caption := IBQSPStockSimple.fieldByName('Edad1').AsString;
  LabelEdadToros2Total.Caption := IBQSPStockSimple.fieldByName('Edad2').AsString;
  LabelEdadToros3Total.Caption := IBQSPStockSimple.fieldByName('Edad3').AsString;
  LabelEdadToros4Total.Caption := IBQSPStockSimple.fieldByName('Edad4').AsString;
  LabelEdadToros5Total.Caption := IBQSPStockSimple.fieldByName('Edad5').AsString;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

// accion de salir
procedure TFREPStockSimple.ACSalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

// accion para mostrar el reporte para imprimir
procedure TFREPStockSimple.ACImprimirReporteExecute(Sender: TObject);
begin
  MostrarMensajeImpresion();
  inherited;
  QR.Preview;
end;

procedure TFREPStockSimple.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
{  QRLEstablecimientos.Top:= 3;
  QRLRenglon1.Top:= 24;
  QRLRenglon2.Top:= 42;
  QRSEncabezadoPlanilla.Top:= 60;
  QRSysDPlanilla.Top:= 62;
  QRLabel24.Enabled:= false;
  QRLabel25.Enabled:= false;
  QRBEncabezadoPlanilla.Height:= 82;
  LabelTitulo1.Top:= 56;
  LabelTitulo1.Left:= 95;
  QRImage3.Enabled:= false;   }

//  {$IFDEF UCC}
{    QRImage3.Enabled:= true;
    QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo UNICEN2.jpg');
    QRLEstablecimientos.Top:= 91;
    QRLRenglon1.Top:= 112;
    QRLRenglon2.Top:= 130;
    QRSEncabezadoPlanilla.Top:= 148;
    QRSysDPlanilla.Top:= 150;
    QRLabel24.Enabled:= true;
    QRLabel25.Enabled:= true;

    QRBEncabezadoPlanilla.Height:= 179;
    LabelTitulo1.Top:= 146;
    LabelTitulo1.Left:= 281; }
//  {$ENDIF}



  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;
    end;

  cargarDatosPropietario();
end;

procedure TFREPStockSimple.cargarDatosPropietario;
var
  repGeneral : TFRepGeneral;
begin
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();
  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';

  QRLNombrePropietario.Caption:= repGeneral.getNombrePropietario;
  QRLEmpresa.Caption:= repGeneral.getEmpresaPropietario;

  if (Trim(repGeneral.getNombrePropietario) <> '') then
    begin
      QRLRenglon1.Enabled:= false;
      QRLNombrePropietario.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;
     end;

  if (Trim(repGeneral.getDireccionPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getDireccionPropietario + ' - ';

  if (Trim(repGeneral.getTelefonoPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getTelefonoPropietario + ' - ';

  if (Trim(repGeneral.getCelularPropietario) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + repGeneral.getCelularPropietario + ' - ';

  if (Trim(repGeneral.getEmailPropietario) <> '') then
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getEmailPropietario + ' - ';

  if (Trim(repGeneral.getUrlPropietario) <> '') then
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + repGeneral.getUrlPropietario + ' - ';

  if (FileExists(repGeneral.getPathImage)) then
    begin
       QRImagenEmpresa.Picture.LoadFromFile(repGeneral.getPathImage);
    end;

  repGeneral.Destroy;
end;

procedure TFREPStockSimple.IBQSPStockSimpleAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IPreview.Enabled := not DataSet.IsEmpty;
  LPreview.Enabled := not DataSet.IsEmpty;
end;

end.
