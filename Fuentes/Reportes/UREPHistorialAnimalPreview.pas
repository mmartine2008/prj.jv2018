unit UREPHistorialAnimalPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QRCtrls, QuickRpt, ActnList, ComCtrls, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, jpeg, StdCtrls, IBStoredProc, UFunctions,
  DataExport, DataToXLS, QRPDFFilt, QRWebFilt, QRExport, WinXP,
  JvExControls, JvLabel, JvGIF, PngImage, ImgList, PngImageList, DateUtils,
  JvExExtCtrls, JvImage;

type
  TFREPHistorialAnimalPreview = class(TFUniversal)
    IBQConsultaEventos: TIBQuery;
    DSConsultaEventos: TDataSource;
    IBQAnimales: TIBQuery;
    DSAnimales: TDataSource;
    IBQAuxRazas: TIBQuery;
    IBQConsultaEventosFECHA: TDateField;
    IBQConsultaEventosTIPOEVENTO: TIBStringField;
    IBQConsultaEventosINFOEVENTO: TIBStringField;
    IBQConsultaEventosRESPONSABLE: TIBStringField;
    IBQConsultaEventosCATEGORIAEVENTO: TIBStringField;
    IBQConsultaEventosID_CATEGORIA: TIntegerField;
    IBQListadoAnimal: TIBQuery;
    IBQAux: TIBQuery;
    QRHTMLFilter1: TQRHTMLFilter;
    IBQAux2: TIBQuery;
    IBQAux3: TIBQuery;
    IBQPadres: TIBQuery;
    DSQPadres: TDataSource;
    IBQCoopropiedad: TIBQuery;
    IBQAuxDeps: TIBQuery;
    IBQListadoAnimalID_ANIMAL: TIntegerField;
    IBQListadoAnimalRP: TIBStringField;
    IBQListadoAnimalSENASA: TIBStringField;
    IBQListadoAnimalFECHA_NAC: TDateField;
    IBQListadoAnimalCATEGORIA: TIBStringField;
    IBQListadoAnimalESTADOACT: TIBStringField;
    IBQListadoAnimalRAZA: TIBStringField;
    IBQListadoAnimalACTIVO: TIBStringField;
    IBQListadoAnimalNOMBRE: TIBStringField;
    IBQListadoAnimalPESONACER: TFloatField;
    IBQListadoAnimalTS: TIBStringField;
    IBQListadoAnimalADN: TIBStringField;
    IBQListadoAnimalPADREI: TIntegerField;
    IBQListadoAnimalPADREE: TIntegerField;
    IBQListadoAnimalMBE: TIntegerField;
    IBQListadoAnimalMBI: TIntegerField;
    IBQListadoAnimalHBA: TIBStringField;
    IBQListadoAnimalRP_PADRE: TStringField;
    IBQListadoAnimalRP_MADRE: TStringField;
    IBQAnimalesInternos: TIBQuery;
    IBQAnimalesExternos: TIBQuery;
    IBQListadoAnimalHBA_PADRE: TStringField;
    IBQListadoAnimalHBA_MADRE: TStringField;
    IBQListadoAnimalTIPO_REGISTRO: TStringField;
    IBQTiposRegistros: TIBQuery;
    IBQListadoAnimalSUBCATEGO: TIntegerField;
    IBQRelPadresExternos: TIBQuery;
    IBQRelPadresInternos: TIBQuery;
    IBQPropietario: TIBQuery;
    IBQListadoAnimalCOLOR: TIBStringField;
    IBQListadoAnimalINFORMADO_AFIP: TIBStringField;
    IBQListadoAnimalIE: TIBStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    QRListadoAnimalesCabanias: TQuickRep;
    QRBand12: TQRBand;
    QRLRenglon13: TQRLabel;
    QRImage3: TQRImage;
    QRLabel29: TQRLabel;
    QRShape18: TQRShape;
    QRSysData5: TQRSysData;
    QRLEmpresa3: TQRLabel;
    QRLNombrePropietario3: TQRLabel;
    QRLRenglon23: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRImagenEmpresa4: TQRImage;
    QRShape44: TQRShape;
    QRShape19: TQRShape;
    QRBand11: TQRBand;
    QRShape16: TQRShape;
    QRLabel24: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel25: TQRLabel;
    QRLDatosAbajo3: TQRLabel;
    QRLDatosAbajo4: TQRLabel;
    QRBand9: TQRBand;
    QRBand14: TQRBand;
    QRDBText14: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText16: TQRDBText;
    nom1: TQRLabel;
    por1: TQRLabel;
    nom2: TQRLabel;
    por2: TQRLabel;
    nom3: TQRLabel;
    por3: TQRLabel;
    QRShape28: TQRShape;
    QRShape27: TQRShape;
    QRShape26: TQRShape;
    QRShape45: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape23: TQRShape;
    QRShape22: TQRShape;
    QRShape21: TQRShape;
    QRShape10: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape47: TQRShape;
    HbaPadre: TQRDBText;
    QRShape49: TQRShape;
    HbaMadre: TQRDBText;
    QRShape54: TQRShape;
    TipoRegistro: TQRDBText;
    QRShape46: TQRShape;
    QRShape51: TQRShape;
    QRBand13: TQRBand;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRBand10: TQRBand;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape48: TQRShape;
    QRLabel14: TQRLabel;
    QRShape50: TQRShape;
    QRShape53: TQRShape;
    QRLabel15: TQRLabel;
    QRLineSup: TQRShape;
    TabSheet3: TTabSheet;
    QRListadaAnimales: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRLRenglon1: TQRLabel;
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
    QRBColumnHeaderPlanilla: TQRGroup;
    QRLRPAnimal: TQRLabel;
    QRSColumnHeaderPlanilla: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRBDetailPlanilla: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRBGFgrilla: TQRBand;
    QRBand5: TQRBand;
    QRShape9: TQRShape;
    QRLabel1: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRBand8: TQRBand;
    QRShape14: TQRShape;
    QRLabel12: TQRLabel;
    QRLTotal: TQRLabel;
    QRHistorialAnimal: TQuickRep;
    QRBand2: TQRBand;
    LabelNacimiento: TQRLabel;
    LabelEdad: TQRLabel;
    LabelRaza: TQRLabel;
    LabelUbicacion: TQRLabel;
    LabelGrupos: TQRLabel;
    LabelPeso: TQRLabel;
    LabelCondCorporal: TQRLabel;
    QRLEdad: TQRLabel;
    QRLUbicacion: TQRLabel;
    QRLGrupos: TQRLabel;
    QRDBTCondicionCorporal: TQRDBText;
    QRLRaza: TQRLabel;
    QRLFechaNacimiento: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    LabelArbolGenealogicoReducido: TQRLabel;
    LabelAnimal: TQRLabel;
    QRLArbolRP_animal: TQRLabel;
    QRLArbolNombre: TQRLabel;
    LabelMadre: TQRLabel;
    LabelPadre: TQRLabel;
    QRArbolRP_animal_M: TQRLabel;
    QRLArbolNombre_M: TQRLabel;
    QRArbolRaza: TQRLabel;
    QRArbolRP_animal_P: TQRLabel;
    QRLArbolNombre_P: TQRLabel;
    QRLArbolRaza_M: TQRLabel;
    QRLArbolRaza_P: TQRLabel;
    QRShape8: TQRShape;
    LabelRP: TQRLabel;
    QRLRP: TQRLabel;
    QRLPesoNacimiento: TQRLabel;
    QRLabelTituloEstadoActual: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    LabelEstadoRepro: TQRLabel;
    QRLEstadoRepro: TQRLabel;
    LabelEstadoUltimoMes: TQRLabel;
    QRLEstadoUltimoMes: TQRLabel;
    LabelCategoria: TQRLabel;
    QRLabelCategoria: TQRLabel;
    LabelGeneaRPM: TQRLabel;
    LabelGeneaAlterM: TQRLabel;
    LabelGeneaNombreM: TQRLabel;
    LabelGeneaRazaM: TQRLabel;
    QRLArbolAlter_M: TQRLabel;
    LabelGeneaRPP: TQRLabel;
    LabelGeneaAlterP: TQRLabel;
    LabelGeneaNombreP: TQRLabel;
    LabelGeneaRazaP: TQRLabel;
    QRLArbolAlter_P: TQRLabel;
    QRLArbolAlter_Animal: TQRLabel;
    LabelGeneaRPAnimal: TQRLabel;
    LabelGeneaAlterAnimal: TQRLabel;
    LabelGeneaNombreAnimal: TQRLabel;
    LabelGeneaRazaAnimal: TQRLabel;
    QRShape6: TQRShape;
    QRLabel11: TQRLabel;
    QRLabelCronologia: TQRLabel;
    QRLabel16: TQRLabel;
    LabelAfip: TQRLabel;
    QRLabelAfip: TQRLabel;
    QRBand4: TQRBand;
    LabelEventosRelacionados: TQRLabel;
    QRLFechaEventos: TQRLabel;
    QRLTipoEventos: TQRLabel;
    QRLResponsableEventos: TQRLabel;
    QRLInfoEvento: TQRLabel;
    QRShape7: TQRShape;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape17: TQRShape;
    QRSTipoEve: TQRShape;
    QRSInfoEve: TQRShape;
    QRSResp: TQRShape;
    QRBand3: TQRBand;
    LabelCantidadDeEventos: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand6: TQRBand;
    QRShape13: TQRShape;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    QRLDatosAbajo12: TQRLabel;
    QRLDatosAbajo22: TQRLabel;
    QRBand7: TQRBand;
    QRLRenglon12: TQRLabel;
    QRImage2: TQRImage;
    QRLabel8: TQRLabel;
    QRShape12: TQRShape;
    QRShape20: TQRShape;
    QRSysData2: TQRSysData;
    QRLEmpresa12: TQRLabel;
    QRLNombrePropietario12: TQRLabel;
    QRLRenglon22: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRImagenEmpresa12: TQRImage;
    TabSheet4: TTabSheet;
    IBQListadoAnimales: TIBQuery;
    qrListadoCAB: TQuickRep;
    QRBand15: TQRBand;
    QRImage4: TQRImage;
    QRLabel19: TQRLabel;
    QRShape52: TQRShape;
    QRSysData6: TQRSysData;
    QRLEmpresa2: TQRLabel;
    QRLRenglon4: TQRLabel;
    QRLRenglon3: TQRLabel;
    QRLNombrePropietario4: TQRLabel;
    QRImage5: TQRImage;
    QRBand16: TQRBand;
    QRLabel39: TQRLabel;
    QRSysData7: TQRSysData;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRBand17: TQRBand;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRBand18: TQRBand;
    QRLabel54: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel62: TQRLabel;
    QRShape57: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape43: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRShape58: TQRShape;
    QRShape56: TQRShape;
    QRShape59: TQRShape;
    QRShape71: TQRShape;
    QRShape69: TQRShape;
    //******************************************************//
    //	INCIDENCIA: 405 y 408 					                    //
    //	FIN Declaración nuevos elementos en reporte.        //
    //	Carla Gareis							              12/12/2014  //
    //******************************************************//

    procedure autoConfigurar(id:integer; Filtros : String);
    procedure armarPrimerBanda();
    procedure calcularEdad;
    function retornarUbicacion: string;
    function retornarGrupos: string;
//    function retornarEstado(id_animal:integer): string;
    function retornarRaza(consulta, sexo : integer): string;
    procedure QRDBTPesoPrint(sender: TObject; var Value: String);
    procedure QRArbolRP_animal_MPrint(sender: TObject; var Value: String);
    procedure QRLPesoNacimientoPrint(sender: TObject; var Value: String);
    procedure QRLEstadoReproPrint(sender: TObject; var Value: String);
    procedure QRLabelCategoriaPrint(sender: TObject; var Value: String);
    procedure ImprimirIdAlternativo (label1, label2 :TQRLabel; IBQuery: TIBQuery);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabelCronologiaPrint(sender: TObject; var Value: String);
    procedure QRBDetailPlanillaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLTotalPrint(sender: TObject; var Value: String);
    procedure QRListadaAnimalesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormShow(Sender: TObject);
    procedure QRListadoAnimalesCabanias1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure IBQListadoAnimalCalcFields(DataSet: TDataSet);
    procedure QRBDetailPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure cargarDatosPropietario();

  end;

var
  FREPHistorialAnimalPreview: TFREPHistorialAnimalPreview;
  totalAnimales : integer;

implementation

uses uprincipal, UCartel, URepGeneral, UTraduccion , UTiposGlobales;

{$R *.dfm}

// GENERO LA PRIMER BANDA DEL ANIMAL, SOLO PARA MEJOR ENTENDIMIENTO LO SEPARE
procedure TFREPHistorialAnimalPreview.armarPrimerBanda;
begin
  QRLFechaNacimiento.Caption := IBQAnimales.FieldByName('fecha_nacimiento').AsString;
  QRLRP.Caption := IBQAnimales.FieldByName('id_rp').AsString;
  calcularEdad;
  QRLRaza.Caption := retornarRaza(1,IBQAnimales.FieldByName('sexo').AsInteger);
  QRLUbicacion.Caption := retornarUbicacion;
  QRLGrupos.Caption := retornarGrupos;
  QRLEstadoUltimoMes.Caption := retornarEstado(IBQAux,IBQAnimales.fieldbyname('id_animal').AsInteger);

  //******************************************************//
  //	INCIDENCIA: 408									                    //
  //	INICIO Asignación valor a label informado AFIP.     //
  //	Carla Gareis							              05/12/2014  //
  //******************************************************//
  if (IBQAnimales.FieldByname('informado_afip').Value = 'S') then
    QRLabelAfip.Caption := 'SI'
  else
    QRLabelAfip.Caption := 'NO';
  //******************************************************//
  //	INCIDENCIA: 408									                    //
  //	FIN Asignación valor a label informado AFIP.        //
  //	Carla Gareis							              05/12/2014  //
  //******************************************************//

  // para el arbol genealogico
  QRLArbolRP_animal.Caption := IBQAnimales.fieldbyname('id_rp').AsString;
  QRLArbolNombre.Caption := IBQAnimales.fieldbyname('nombre').AsString;
  QRArbolRaza.Caption := retornarRaza(1,IBQAnimales.FieldByName('sexo').AsInteger);
  ImprimirIdAlternativo(LabelGeneaAlterAnimal, QRLArbolAlter_Animal, IBQAnimales);

end;

// CALCULO LA EDAD DEL ANIMAL QUE ESTA SELECCIONADO
procedure TFREPHistorialAnimalPreview.calcularEdad;
var value : variant;
    value2 : variant;
    intermedio : integer;
begin
  value2 := now;
  value := IBQAnimales.fieldByname('fecha_Nacimiento').Value;
  intermedio := TRUNC( (value2 - value) /365);
  if (intermedio < 2) then
    QRLEdad.Caption := intToStr(TRUNC( (value2 - value) /dias_mes))+Traducir(' meses')
  else
    QRLEdad.Caption := intToStr(TRUNC( (value2 - value) /365))+Traducir(' años');
end;

// RETORNO LA UBICACION (FISICA DENTRO DEL CAMPO) DEL ANIMAL SELECCIONADO
function TFREPHistorialAnimalPreview.retornarUbicacion: string;
begin
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select nombre from tab_rodeos where (id_rodeo = :n) and (establecimiento = :esta)');
  IBQAux.ParamByName('n').AsInteger := IBQAnimales.fieldbyname('rodeo').AsInteger;
  IBQAux.ParamByName('esta').AsInteger := IBQAnimales.fieldbyname('establecimiento').AsInteger;
  IBQAux.Active := true;
  result := 'Rodeo: '+ IBQAux.fieldByName('nombre').AsString;
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select nombre from tab_potreros where (id_potrero = :n) and (establecimiento = :esta)');
  IBQAux.ParamByName('n').AsInteger := IBQAnimales.fieldbyname('potrero').AsInteger;
  IBQAux.ParamByName('esta').AsInteger := IBQAnimales.fieldbyname('establecimiento').AsInteger;
  IBQAux.Active := true;
  result := result +' Potrero: '+ IBQAux.fieldByName('nombre').AsString;
  IBQAux.Active := false;
end;

// GENERO UN STRING CON LOS GRUPOS A LOS CUALES PERTENECE EL ANIMAL
function TFREPHistorialAnimalPreview.retornarGrupos: string;
begin
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select b.nombre from rel_pertenece_grupo a, tab_grupos b where (animal = :n) and (a.grupo = b.id_grupo)');
  IBQAux.ParamByName('n').AsInteger := IBQAnimales.fieldbyname('id_animal').AsInteger;
  IBQAux.Active := true;
  IBQAux.First;
  while not(IBQAux.Eof) do
    begin
      Result := Result + IBQAux.fieldbyname('nombre').AsString;
      IBQAux.Next;
      if not(IBQAux.Eof) then
        Result := result +', ';
   end;
end;

// RETORNO EL NOMBRE DE LA RAZA DEL ANIMAL SELECCIONADO
function TFREPHistorialAnimalPreview.retornarRaza(consulta, sexo : integer): string;
begin
  IBQAuxRazas.Active := false;
  IBQAuxRazas.SQL.Clear;
  IBQAuxRazas.SQL.Add('select cr.sinonimo as raza from tab_animales, cod_razas cr where tab_animales.raza = cr.id_raza and (id_animal = :n)');
  if (consulta = 1) then
    IBQAuxRazas.ParamByName('n').AsInteger := IBQAnimales.fieldbyname('id_animal').AsInteger
  else
    begin
      if (sexo = 1) then
       begin
        if (IBQAux2.fieldbyname('externo').AsString = 'S') then
          begin
           IBQAuxRazas.SQL.Clear;
           IBQAuxRazas.SQL.Add('select cr.sinonimo as raza from tab_animales_externos, cod_razas cr where tab_animales_externos.raza = cr.id_raza and (id_animal_externo = :n)');
           IBQAuxRazas.ParamByName('n').AsInteger := IBQAux2.fieldbyname('id_animal').AsInteger;
          end
         else
            if (IBQAux2.fieldbyname('externo').AsString = 'N') then
              begin
               IBQAuxRazas.ParamByName('n').AsInteger := IBQAux2.fieldbyname('id_animal').AsInteger;
              end
       end
      else
        if (sexo = 2) then
          if (IBQAux3.fieldbyname('externo').AsString = 'S') then
            begin
              IBQAuxRazas.SQL.Clear;
              IBQAuxRazas.SQL.Add('select cr.sinonimo as raza from tab_animales_externos, cod_razas cr where tab_animales_externos.raza = cr.id_raza and (id_animal_externo = :n)');
              IBQAuxRazas.ParamByName('n').AsInteger := IBQAux3.fieldbyname('id_animal').AsInteger;
            end
          else
            if (IBQAux3.fieldbyname('externo').AsString = 'N') then
              begin
                IBQAuxRazas.ParamByName('n').AsInteger := IBQAux3.fieldbyname('id_animal').AsInteger;
              end;
    end;
  IBQAuxRazas.Active := true;
  Result := IBQAuxRazas.fieldByName('raza').AsString ;
end;



// Solo renombro el peso pero despues tendre que ir a buscar en el evento nacimiento
procedure TFREPHistorialAnimalPreview.QRDBTPesoPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value +' KGs';
end;

// imprime los padres del animal en el mini arbol genealogico
procedure TFREPHistorialAnimalPreview.QRArbolRP_animal_MPrint(
  sender: TObject; var Value: String);
  var cantPadres : integer;
begin
  inherited;
  IBQAux2.Close;
  IBQAux2.SQL.Clear;
  IBQAux2.SQL.Add('select * from get_padres(:id,:tipo)');
  IBQAux2.ParamByName('id').AsInteger := IBQAnimales.fieldbyname('id_animal').AsInteger;
  IBQAux2.ParamByName('tipo').AsString := 'N';
  IBQAux2.Open;

  IBQAux2.First;


  IBQAux3.Close;
  IBQAux3.SQL.Clear;
  IBQAux3.SQL.Add('select * from get_madres(:id,:tipo)');
  IBQAux3.ParamByName('id').AsInteger := IBQAnimales.fieldbyname('id_animal').AsInteger;
  IBQAux3.ParamByName('tipo').AsString := 'N';
  IBQAux3.Open;

  IBQAux3.First;


  with IBQAux do
    begin
      active := false;
      sql.Clear;
      sql.Add('select * from get_arbol_genealogico(2,:n,1) where (nivel_arbol = 1)');
      ParamByName('n').AsInteger := IBQAnimales.fieldbyname('id_animal').AsInteger;
      active := true;
    end;
  IBQAux.First;
  // MADRE
  if (IBQAux.fieldByName('id_rp').AsString <> '') then
    begin
      Value := IBQAux.fieldByName('id_rp').AsString;
      QRLArbolNombre_M.Caption := IBQAux.fieldByName('nombre').AsString;
      QRLArbolRaza_M.Caption := retornarRaza(2,2);
      ImprimirIdAlternativo(LabelGeneaAlterM, QRLArbolAlter_M, IBQAux);
    end
  else
    begin
      Value := Traducir('Desconocido');
      QRLArbolNombre_M.Caption := '';
      QRLArbolRaza_M.Caption := '';
      LabelGeneaAlterM.Caption := Traducir('Altern.: ');
      QRLArbolAlter_M.Caption := '';
    end;

  IBQAux.Next;
  //PADRE
  if (IBQAux.fieldByName('id_rp').AsString <> '') then
    begin
      QRArbolRP_animal_P.Caption := IBQAux.fieldByName('id_rp').AsString;
      QRLArbolNombre_P.Caption := IBQAux.fieldByName('nombre').AsString;
      QRLArbolRaza_P.Caption := retornarRaza(2,1);
      ImprimirIdAlternativo(LabelGeneaAlterP, QRLArbolAlter_P, IBQAux);
    end
  else
    begin
      QRArbolRP_animal_P.Caption := Traducir('Desconocido');
      QRLArbolNombre_P.Caption := '';
      QRLArbolRaza_P.Caption := '';
      LabelGeneaAlterP.Caption := Traducir('Altern.: ');
      QRLArbolAlter_P.Caption := '';
    end;

  // Esto es un parche: Cuando el animal tiene multiples padres el SP de arriba
  // devuelve '' y por lo tanto la etiqueta queda como desconocido. Aqui contamos
  // los padres, y si la cuenta es mayor que 1 la cambiamos por Multiples
  with IBQAux do begin
      Open;
      sql.Clear;
      sql.Add('select count(*) as cc from rel_padres_externos where animal = :animal union select count(*) as cc from rel_padres_internos where animal = :animal;');
      ParamByName('animal').AsInteger := IBQAnimales.fieldbyname('id_animal').AsInteger;
      active := true;
      First;
      cantPadres := FieldByName('cc').AsInteger;
      Next;
      cantPadres := cantPadres + FieldByName('cc').AsInteger;
      Close;
  end;
  if (cantPadres > 1) then
    QRArbolRP_animal_P.Caption := Traducir('Multiples');
end;

procedure TFREPHistorialAnimalPreview.autoConfigurar(id: integer; Filtros : String);
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Generando vista previa de los eventos del animal ...';
  cartel.abrircartel(msje);

  IBQAnimales.Active := false;
  IBQAnimales.ParamByName('n').AsInteger := id;
  IBQAnimales.Active := true;
  {IBQConsultaEventos.Active := false;
  IBQConsultaEventos.ParamByName('n').AsInteger := id;
  IBQConsultaEventos.Active := true;}
  IBQConsultaEventos.Close;
  IBQConsultaEventos.SQL.Clear;
  IBQConsultaEventos.SQL.Add('select * from get_datos_eventos(:n) '+Filtros+' order by fecha desc, ORDEN desc');
  IBQConsultaEventos.ParamByName('n').AsInteger := id;
  IBQConsultaEventos.Open;
  armarPrimerBanda;

  cartel.cerrarcartel();
  cartel.FreeInstance();

  QRHistorialAnimal.PreviewModal;
end;

procedure TFREPHistorialAnimalPreview.QRLPesoNacimientoPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select pesoNacer as peso from tab_animales where (id_animal = :n)');
  IBQAux.ParamByName('n').AsInteger := IBQAnimales.fieldbyname('id_animal').AsInteger;
  IBQAux.Active := true;
  if (IBQAux.fieldByName('peso').AsString <> '') then
    Value := IBQAux.fieldByName('peso').AsString + ' KGs'
  else
    Value := 'Peso desconocido';
end;

procedure TFREPHistorialAnimalPreview.QRLEstadoReproPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select nombre from cod_estados_reproductivos where (id_estado_reproductivo = :n)');
  IBQAux.ParamByName('n').AsInteger := IBQAnimales.fieldbyname('estado_reproductivo').AsInteger;
  IBQAux.Active := true;
  Value := IBQAux.fieldByName('nombre').AsString;
end;

procedure TFREPHistorialAnimalPreview.QRLabelCategoriaPrint(
  sender: TObject; var Value: String);
begin
  inherited;
  IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select nombre from cod_categorias where (id_categoria = :n)');
  IBQAux.ParamByName('n').AsInteger := IBQAnimales.fieldbyname('categoria').AsInteger;
  IBQAux.Active := true;
  Value := IBQAux.fieldByName('nombre').AsString;
end;

// metodo para imprimir el identificador alternativo dependiendo de una prioridad preestablecida
procedure TFREPHistorialAnimalPreview.ImprimirIdAlternativo(label1, label2: TQRLabel; IBQuery: TIBQuery);
begin
  if (IBQAnimales.fieldbyname('id_hba').AsString <> '') then
    begin
      label1.Caption := Traducir('HBA: ');
      label2.Caption := IBQuery.fieldbyname('id_hba').AsString;
    end
  else
    if (IBQAnimales.fieldbyname('id_pc').AsString <> '') then
      begin
        label1.Caption := Traducir('PC: ');
        label2.Caption := IBQuery.fieldbyname('id_pc').AsString;
      end
    else
      if (IBQAnimales.fieldbyname('id_ra').AsString <> '') then
        begin
          label1.Caption := Traducir('RA: ');
          label2.Caption := IBQuery.fieldbyname('id_ra').AsString;
        end
      else
        if (IBQAnimales.fieldbyname('id_senasa').AsString <> '') then
          begin                                                                                         
            label1.Caption := Traducir('Senasa: ');
            label2.Caption := IBQuery.fieldbyname('id_senasa').AsString;
          end
        else
          begin
            label1.Caption := Traducir('Altern.: ');
            label2.Caption := '';
          end;
end;


procedure TFREPHistorialAnimalPreview.QRBand7BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon22.Enabled := true;
      QRLRenglon12.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon22.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon22.Enabled := true;
      QRLRenglon12.Caption := FPrincipal.NombrePropietario;
      QRLRenglon22.Caption := FPrincipal.Renspa;
    end;

  cargarDatosPropietario();
end;

procedure TFREPHistorialAnimalPreview.QRLabelCronologiaPrint(sender: TObject; var Value: String);
begin
  inherited;
    IBQAux.Active := false;
  IBQAux.SQL.Clear;
  IBQAux.SQL.Add('select sinonimo from cod_cronologias_dentarias where (id_cronologia_dentaria = :n)');
  IBQAux.ParamByName('n').AsInteger := IBQAnimales.fieldbyname('cronologia_dentaria').AsInteger;
  IBQAux.Active := true;
  Value := IBQAux.fieldByName('sinonimo').AsString;

end;

procedure TFREPHistorialAnimalPreview.QRBDetailPlanillaAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  inc(totalAnimales);
end;

procedure TFREPHistorialAnimalPreview.QRLTotalPrint(sender: TObject; var Value: String);
begin
  inherited;
//  Value := IntToStr(totalAnimales);
  Value := IntToStr(IBQListadoAnimal.RecordCount);
end;

procedure TFREPHistorialAnimalPreview.QRListadaAnimalesBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  totalAnimales := 0;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
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

{
 Para seleccionar el tipo de reporte elegido, se almacena en la variable TAG del
 formulario que lo invoca:
   TAG 1 )    ListadaAnimales
   TAG 2 )    ListadoAnimalesCabanias
   TAG 3 )    ListadaAnimalesDEPS

}


procedure TFREPHistorialAnimalPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
  if (self.Owner.Tag = 1) then
    QRListadaAnimales.Preview
  else
      if (self.Owner.Tag = 2) then
      begin
          QRListadoAnimalesCabanias.Preview;
     end
     else
      if (self.Owner.Tag = 3) then
      begin
          qrListadoCAB.Preview;
     end;



  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPHistorialAnimalPreview.cargarDatosPropietario();
var nombre, empresa, direccion, telefono, celular, email, url : String;
begin
  IBQPropietario.Close;
  IBQPropietario.Open;
  QRLNombrePropietario.Caption:= '';
  QRLEmpresa.Caption:= '';
  QRLDatosAbajo.Caption:= '';
  QRLDatosAbajo2.Caption:= '';

  nombre := '';
  empresa := '';
  direccion := '';
  telefono := '';
  celular := '';
  email := '';
  url := '';

  if not (IBQPropietario.IsEmpty) then
  begin
    if (IBQPropietario.FieldValues['nombre'] <> null) then
      nombre := IBQPropietario.FieldValues['nombre'];
    if (IBQPropietario.FieldValues['empresa'] <> null) then
      empresa := IBQPropietario.FieldValues['empresa'];
    if (IBQPropietario.FieldValues['direccion'] <> null) then
      direccion := IBQPropietario.FieldValues['direccion'];
    if (IBQPropietario.FieldValues['telefono'] <> null) then
      telefono := IBQPropietario.FieldValues['telefono'];
    if (IBQPropietario.FieldValues['celular'] <> null) then
      celular := IBQPropietario.FieldValues['celular'];
    if (IBQPropietario.FieldValues['email'] <> null) then
      email := IBQPropietario.FieldValues['email'];
    if (IBQPropietario.FieldValues['url'] <> null) then
      url := IBQPropietario.FieldValues['url'];
  end;

  QRLNombrePropietario.Caption:= nombre;
  QRLEmpresa.Caption:= empresa;

  if (Trim(nombre) <> '') then
    begin
      QRLRenglon1.Enabled:= false;
      QRLNombrePropietario.Enabled:= true;

      QRLRenglon12.Enabled:= false;
      QRLNombrePropietario12.Enabled:= true;

      QRLRenglon13.Enabled:= false;
      QRLNombrePropietario3.Enabled:= true;
    end
   else
     begin
       QRLRenglon1.Enabled:= true;
       QRLNombrePropietario.Enabled:= false;
       QRLRenglon12.Enabled:= true;
       QRLNombrePropietario12.Enabled:= false;

       QRLRenglon13.Enabled:= true;
       QRLNombrePropietario3.Enabled:= false;
     end;

  if (Trim(direccion) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + direccion + ' - ';

  if (Trim(telefono) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + telefono + ' - ';

  if (Trim(celular) <> '') then
    QRLDatosAbajo.Caption:= QRLDatosAbajo.Caption + celular + ' - ';

  if (Trim(email) <> '') then
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + email + ' - ';

  if (Trim(url) <> '') then
    QRLDatosAbajo2.Caption:= QRLDatosAbajo2.Caption + url + ' - ';

  if (FileExists(ExtractFilePath(Application.ExeName)+'imagenempresa.jpg')) then
    begin
       QRImagenEmpresa.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenempresa.jpg');
       QRImagenEmpresa12.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenempresa.jpg');
       QRImagenEmpresa4.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenempresa.jpg');
       QRImage5.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagenempresa.jpg');

    end;


  QRLNombrePropietario12.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa12.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo12.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo22.Caption:= QRLDatosAbajo2.Caption;

  QRLNombrePropietario3.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa3.Caption:= QRLEmpresa.Caption;
  QRLDatosAbajo3.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo4.Caption:= QRLDatosAbajo2.Caption;
// Reporte 4
  QRLNombrePropietario4.Caption:= QRLNombrePropietario.Caption;
  QRLEmpresa2.Caption:= QRLEmpresa.Caption;
  QRLRenglon4.Caption:= QRLDatosAbajo.Caption;
  QRLEmpresa2.Caption:= QRLDatosAbajo2.Caption;
  QRLRenglon13.Caption := FPrincipal.NombrePropietario;
end;

procedure TFREPHistorialAnimalPreview.QRListadoAnimalesCabanias1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  totalAnimales := 0;
  QRImage1.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon23.Enabled := true;
      QRLRenglon13.Caption := FPrincipal.NombreVeterinario;
      QRLRenglon23.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      QRLRenglon1.Caption := FPrincipal.NombrePropietario;
      QRLRenglon2.Caption := FPrincipal.Renspa;

      QRLRenglon23.Enabled := true;
      QRLRenglon13.Caption := FPrincipal.NombrePropietario;
      QRLRenglon23.Caption := FPrincipal.Renspa;
    end;

    cargarDatosPropietario();
end;

procedure TFREPHistorialAnimalPreview.QRDBText14Print(sender: TObject;
  var Value: String);
var
  i : integer;
begin
  inherited;
  IBQCoopropiedad.Close;
  IBQCoopropiedad.ParamByName('id').AsInteger := IBQListadoAnimal.FieldValues['id_animal'];
  IBQCoopropiedad.Open;
  IBQCoopropiedad.First;
  i := 0;
  while not IBQCoopropiedad.Eof do
  begin
    case i of
      0 : begin
            nom1.Caption := IBQCoopropiedad.FieldValues['codigo'];
            por1.Caption := IBQCoopropiedad.FieldValues['porcentaje'];
            por1.Caption := por1.Caption + '%';
          end;
      1 : begin
            nom2.Caption := IBQCoopropiedad.FieldValues['codigo'];
            por2.Caption := IBQCoopropiedad.FieldValues['porcentaje'];
            por2.Caption := por2.Caption + '%';
          end;
      2 : begin
            nom3.Caption := IBQCoopropiedad.FieldValues['codigo'];
            por3.Caption := IBQCoopropiedad.FieldValues['porcentaje'];
            por3.Caption := por3.Caption + '%';
          end;
    end;
    IBQCoopropiedad.Next;
    Inc(i);
  end;
  case i of
    0 : begin
          nom1.Caption := ''; por1.Caption := '';
          nom2.Caption := ''; por2.Caption := '';
          nom3.Caption := ''; por3.Caption := '';
        end;
    1 : begin
          nom2.Caption := ''; por2.Caption := '';
          nom3.Caption := ''; por3.Caption := '';
        end;
    2 : begin
          nom3.Caption := ''; por3.Caption := '';
        end;
  end;
end;


procedure TFREPHistorialAnimalPreview.IBQListadoAnimalCalcFields(DataSet: TDataSet);
begin
     IBQTiposRegistros.Close;
     IBQTiposRegistros.Open;

     if (IBQListadoAnimal.FieldValues['subcatego'] <> null) then
      if (IBQTiposRegistros.Lookup('ID_SUBCATEGORIA',IBQListadoAnimal.FieldValues['subcatego'],'SINONIMO') <> null) then
         IBQListadoAnimalTIPO_REGISTRO.AsString := IBQTiposRegistros.Lookup('ID_SUBCATEGORIA',IBQListadoAnimal.FieldValues['subcatego'],'SINONIMO');

     if (IBQListadoAnimal.FieldValues['padreI'] <> null) then
     begin
      IBQAnimalesInternos.Close;
      IBQAnimalesInternos.ParamByName('n').AsInteger := IBQListadoAnimal.FieldValues['padreI'];
      IBQAnimalesInternos.Open;

      if (IBQAnimalesInternos.FieldValues['id_rp'] <> null ) then
        IBQListadoAnimalRP_PADRE.AsString := IBQAnimalesInternos.FieldValues['id_rp'];

      if (IBQAnimalesInternos.FieldValues['id_hba'] <> null) then
        IBQListadoAnimalHBA_PADRE.AsString := IBQAnimalesInternos.FieldValues['id_hba'];
     end
     else
     begin
          if (IBQListadoAnimal.FieldValues['padreE'] <> null) then
          begin
            IBQAnimalesExternos.Close;
            IBQAnimalesExternos.ParamByName('n').AsInteger := IBQListadoAnimal.FieldValues['padreE'];
            IBQAnimalesExternos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
            IBQAnimalesExternos.Open;

            if (IBQAnimalesExternos.FieldValues['id_rp'] <> null ) then
             IBQListadoAnimalRP_PADRE.AsString := IBQAnimalesExternos.FieldValues['id_rp'];

            if (IBQAnimalesExternos.FieldValues['id_hba'] <> null) then
              IBQListadoAnimalHBA_PADRE.AsString := IBQAnimalesExternos.FieldValues['id_hba'];
          end
          else
          begin
            IBQRelPadresExternos.Close;
            IBQRelPadresExternos.ParamByName('a').AsInteger := IBQListadoAnimal.FieldValues['id_animal'];
            IBQRelPadresExternos.Open;
            if not IBQRelPadresExternos.IsEmpty then
            begin
              IBQAnimalesExternos.Close;
              IBQAnimalesExternos.ParamByName('n').AsInteger := IBQRelPadresExternos.FieldValues['padre_externo'];
              IBQAnimalesExternos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
              IBQAnimalesExternos.Open;

              if (IBQAnimalesExternos.FieldValues['id_rp'] <> null ) then
               IBQListadoAnimalRP_PADRE.AsString := IBQAnimalesExternos.FieldValues['id_rp'];

              if (IBQAnimalesExternos.FieldValues['id_hba'] <> null) then
                IBQListadoAnimalHBA_PADRE.AsString := IBQAnimalesExternos.FieldValues['id_hba'];
            end
            else
            begin
              IBQRelPadresInternos.Close;
              IBQRelPadresInternos.ParamByName('a').AsInteger := IBQListadoAnimal.FieldValues['id_animal'];
              IBQRelPadresInternos.Open;
              if not IBQRelPadresInternos.IsEmpty then
              begin
                IBQAnimalesInternos.Close;
                IBQAnimalesInternos.ParamByName('n').AsInteger := IBQRelPadresInternos.FieldValues['padre_interno'];
                IBQAnimalesInternos.Open;

                if (IBQAnimalesInternos.FieldValues['id_rp'] <> null ) then
                  IBQListadoAnimalRP_PADRE.AsString := IBQAnimalesInternos.FieldValues['id_rp'];

                if (IBQAnimalesInternos.FieldValues['id_hba'] <> null) then
                  IBQListadoAnimalHBA_PADRE.AsString := IBQAnimalesInternos.FieldValues['id_hba'];
              end;
            end;
          end;
     end;

     if (IBQListadoAnimal.FieldValues['mbi'] <> null) then
     begin
      IBQAnimalesInternos.Close;
      IBQAnimalesInternos.ParamByName('n').AsInteger := IBQListadoAnimal.FieldValues['mbi'];
      IBQAnimalesInternos.Open;

      if (IBQAnimalesInternos.FieldValues['id_rp'] <> null) then
        IBQListadoAnimalRP_MADRE.AsString := IBQAnimalesInternos.FieldValues['id_rp'];

      if (IBQAnimalesInternos.FieldValues['id_hba'] <> null) then
        IBQListadoAnimalHBA_MADRE.AsString := IBQAnimalesInternos.FieldValues['id_hba'];
     end
     else
     begin
          if (IBQListadoAnimal.FieldValues['mbe'] <> null) then
          begin
            IBQAnimalesExternos.Close;
            IBQAnimalesExternos.ParamByName('n').AsInteger := IBQListadoAnimal.FieldValues['mbe'];
            IBQAnimalesExternos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
            IBQAnimalesExternos.Open;

            if (IBQAnimalesExternos.FieldValues['id_rp'] <> null) then
              IBQListadoAnimalRP_MADRE.AsString := IBQAnimalesExternos.FieldValues['id_rp'];

            if (IBQAnimalesExternos.FieldValues['id_hba'] <> null) then
              IBQListadoAnimalHBA_MADRE.AsString := IBQAnimalesExternos.FieldValues['id_hba'];
          end;
     end;

end;


procedure TFREPHistorialAnimalPreview.QRBDetailPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var value1 : Tdate;
    value2 : Tdate;
    intermedio, total, meses : integer;
    completo : Double;

begin
  value2 := now;
  value1 := IBQListadoAnimal.fieldByname('fecha_Nac').Value;
  intermedio := TRUNC((value2 - value1) /365);
  total := DaysBetween(value2,value1);
  meses := total - (intermedio * 365);
  if (intermedio < 2) then
    QRLabel13.Caption := intToStr(TRUNC( (value2 - value1) /dias_mes))+Traducir(' meses')
  else
    if (meses > 30) then
        QRLabel13.Caption := intToStr(TRUNC( (value2 - value1) /365))+Traducir(' años y ') + intToStr(TRUNC(meses/dias_mes)) + Traducir(' meses')
    else
        QRLabel13.Caption := intToStr(TRUNC( (value2 - value1) /365))+Traducir(' años');
end;

end.
