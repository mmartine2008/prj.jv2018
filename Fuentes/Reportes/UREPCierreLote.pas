unit UREPCierreLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls,
  jpeg, PngImage, ExtCtrls, StdCtrls, JvGIF, Grids, DBGrids, UBDBGrid,
  QRCtrls, DateUtils, ImgList, PngImageList, JvExControls, JvLabel, DBCtrls,
  IBUpdateSQL, UREPCierreLotePrev, JvComponentBase, JvBalloonHint;

type
  TFREPCierreLote = class(TFUniversal)
    PTop: TPanel;
    PBottom: TPanel;
    Image1: TImage;
    PCli: TPanel;
    IBQEntradas: TIBQuery;
    IBQSalidas: TIBQuery;
    Button1: TButton;
    Button2: TButton;
    IBQRaciones: TIBQuery;
    IBQSanidad: TIBQuery;
    IBQAnimales: TIBQuery;
    DSAnimales: TDataSource;
    IPreview: TImage;
    LPreview: TLabel;
    ICancelar: TImage;
    LCancelar: TLabel;
    GBHotel: TGroupBox;
    EHotel: TEdit;
    Label2: TLabel;
    GBAnims: TGroupBox;
    BDBGAnimales: TBitDBGrid;
    IBQPotrero: TIBQuery;
    DSPotrero: TDataSource;
    DSRodeos: TDataSource;
    IBQRodeo: TIBQuery;
    GroupBox1: TGroupBox;
    DTPHasta: TDateTimePicker;
    Label5: TLabel;
    DTPDesde: TDateTimePicker;
    Label4: TLabel;
    GBCategoria: TGroupBox;
    DSDisponibles: TDataSource;
    IBQDisponibles: TIBQuery;
    IBQDisponiblesNOMBRE: TIBStringField;
    IBQDisponiblesID_CATEGORIA: TIntegerField;
    IBQDisponiblesSINONIMO: TIBStringField;
    IBQDisponiblesTIPO_SEXO: TIntegerField;
    IBQDisponiblesCODIGO: TIBStringField;
    IBUSeleccionados: TIBUpdateSQL;
    DSSeleccionados: TDataSource;
    IBQSeleccionados: TIBQuery;
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
    IBQMuertes: TIBQuery;
    IBQSalidasFECHA_BAJA: TDateField;
    IBQSalidasCANT_ANIMALES: TIntegerField;
    IBQSalidasPESO_SALIDA: TFloatField;
    IBQSalidasPESO: TFloatField;
    IBQSalidasPESO_DESTINO: TFloatField;
    IBQSalidasTIPO: TIntegerField;
    IBQMuertesFECHA_BAJA: TDateField;
    IBQMuertesCANT_ANIMALES: TIntegerField;
    IBQMuertesPESO_SALIDA: TFloatField;
    IBQMuertesPESO: TFloatField;
    IBQMuertesPESO_DESTINO: TFloatField;
    IBQMuertesTIPO: TIntegerField;
    IBQSanidadCANT_ANIMALES: TIntegerField;
    IBQSanidadNOMBRE: TIBStringField;
    IBQSanidadDOSIS: TIBBCDField;
    IBQSanidadFECHA_SANI: TDateField;
    IBQSanidadCOSTO_UNI: TIBBCDField;
    IBQSanidadCOSTO: TIBBCDField;
    IBQRepDiasCierre: TIBQuery;
    IBQRepDiasCierreSUMA: TLargeintField;
    IBQRepDiasCierrePROM: TLargeintField;
    IBQRepDiasCierreDetalle: TIBQuery;
    IBQRepDiasCierreDetalleRP: TIBStringField;
    IBQRepDiasCierreDetalleID_ANIMAL: TIntegerField;
    IBQRepDiasCierreDetalleFECHA_INGRESO: TDateField;
    IBQRepDiasCierreDetalleFECHA_EGRESO: TDateField;
    IBQRepDiasCierreDetalleDIAS: TIntegerField;
    IBQRepDiasCierreCANTIDAD: TIntegerField;
    IBQUltimoPeso: TIBQuery;
    IBQPrimerPeso: TIBQuery;
    PFiltrosCategs: TPanel;
    PMangaCategoria: TPanel;
    DBGDisponibles: TDBGrid;
    DBGSeleccionados: TDBGrid;
    BPasar1: TButton;
    BSacar1: TButton;
    Label6: TLabel;
    IAceptar: TImage;
    ICancelCateg: TImage;
    Label7: TLabel;
    Label8: TLabel;
    DBLCBPotrero: TDBLookupComboBox;
    Label3: TLabel;
    DBLCBRodeo: TDBLookupComboBox;
    Label1: TLabel;
    JvICategorias: TJvImage;
    IBQCargarCategorias: TIBQuery;
    IBQBorrarCategorias: TIBQuery;
    JvBHint: TJvBalloonHint;
    CBListado: TCheckBox;
    Button3: TButton;
    JvIBotonBuscar: TJvImage;
    IBQDetalleAlimentacion: TIBQuery;
    IBQDetalleAlimentacionSUM: TLargeintField;
    IBQDetalleAlimentacionCOUNT: TIntegerField;
    IBQDetalleAlimentacionRACION: TIntegerField;
    IBQDetalleAlimentacionSUM1: TFloatField;
    IBQDetalleAlimentacionGCIA: TFloatField;
    IBQDetalleAlimentacionCOSTO_KG: TFloatField;
    IBQDetalleAlimentacionDIAS: TLargeintField;
    IBQSanitarios: TIBQuery;
    IBQSanitariosFECHA: TDateField;
    IBQSanitariosID_GRUPO: TIntegerField;
    IBQSanitariosGRUPO: TIBStringField;
    IBQSanitariosID_TIPO_EVENTO: TIntegerField;
    IBQSanitariosEVENTO: TIBStringField;
    IBQSanitariosTIPO_DESCRIPCION: TIBStringField;
    IBQSanitariosID_RODEO: TIntegerField;
    IBQSanitariosRODEO: TIBStringField;
    IBQSanitariosPOTRERO: TIntegerField;
    IBQSanitariosID_CATEGORIA: TIntegerField;
    IBQSanitariosCATEGORIA: TIBStringField;
    IBQSanitariosRESPONSABLE: TIBStringField;
    IBQSanitariosCANT_ANIMALES: TIntegerField;
    IBQSanitariosCOSTO: TIBBCDField;
    IBQSanitariosCOSTO_TOTAL: TIBBCDField;
    IBQSanitariosCOSTO_KG: TIBBCDField;
    IBQSanitariosACTIVIDAD: TIBStringField;
    IBQSanitariosOBSERVACIONES: TIBStringField;
    IBQExistenciaPromedio: TIBQuery;
    IBQSalidasTIPO_SALIDA: TIBStringField;
    IBQPriemerAlimentacion: TIBQuery;
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
    IBQRacionesCOSTO: TIBBCDField;
    IBQEntradasFECHA_ALTA: TDateField;
    IBQEntradasCANT_ANIMALES: TIntegerField;
    IBQEntradasPESO_ENTRADA: TFloatField;
    IBQEntradasPESO: TFloatField;
    IBQEntradasTIPO: TIBStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EHotelChange(Sender: TObject);
    procedure IBuscarClick(Sender: TObject);
    procedure ICancelarClick(Sender: TObject);
    procedure ELoteKeyPress(Sender: TObject; var Key: Char);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure BDBGAnimalesDblClick(Sender: TObject);
    procedure DBLCBPotreroCloseUp(Sender: TObject);
    procedure DBLCBRodeoCloseUp(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure BPasar1Click(Sender: TObject);
    procedure BSacar1Click(Sender: TObject);
    procedure JvICategoriasClick(Sender: TObject);
    procedure IAceptarClick(Sender: TObject);
    procedure ICancelCategClick(Sender: TObject);
    procedure JvICategoriasMouseEnter(Sender: TObject);
    procedure JvICategoriasMouseLeave(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    rodeo, potrero : Variant;
    desde, hasta : TDate;
    CantE : Integer;
    KGIng : Double;
    KGPromE : Double;
    CantS : Integer;
    KGSal : Double;
    KGPromS : Double;
    PorcMS, ConsumoTotalTC : Double;
    fechaIngreso, fechaSalida : TDate;
    CantDias : Integer;
    Hotel : Double;
    CantMuertes : Integer;
    TotalAnimal : Double;
    sumatoriaTotalRacion : Double;
    ConCategoria : Boolean;
    costoTotalSanidad : double;
    existencia_promedio : double;
    procedure ActConsulta;
    procedure ArmarTablaEntradas(var F : TFREPCierreLotePrev);
    procedure ArmarTablaSalidas(var F : TFREPCierreLotePrev);
    procedure ArmarTablaRacion(var F : TFREPCierreLotePrev);
    procedure ArmarTablaSanidad(var F : TFREPCierreLotePrev);
    procedure PasarTodasLasCategs;
    procedure BorrarCategs;
  public
    { Public declarations }
  end;

var
  FREPCierreLote: TFREPCierreLote;

implementation

{$R *.dfm}
uses
  UPrincipal, URepFichaAnimal, UCartel, UMensajeHuella;

procedure TFREPCierreLote.PasarTodasLasCategs;
begin
  try
    IBQCargarCategorias.Close;
    IBQCargarCategorias.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFREPCierreLote.BorrarCategs;
begin
  try
    IBQBorrarCategorias.Close;
    IBQBorrarCategorias.Open;
    FPrincipal.IBTPrincipal.CommitRetaining;
  except
    FPrincipal.IBTPrincipal.RollbackRetaining;
  end;
end;

procedure TFREPCierreLote.ActConsulta;
var
  C : TCartel;
begin
  C := TCartel.getInstance;
  C.abrircartel('Cargando Informe de Cierre ...');

  IBQEntradas.Close;
  IBQEntradas.ParamByName('potrero').Value := potrero;
  IBQEntradas.ParamByName('rodeo').Value := rodeo;
  IBQEntradas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQEntradas.ParamByName('fecha_ini').AsDate := desde;
  IBQEntradas.ParamByName('fecha_fin').AsDate := hasta;
  IBQEntradas.Open;



  IBQPrimerPeso.Close;
  IBQPrimerPeso.ParamByName('potrero').Value := potrero;
  IBQPrimerPeso.ParamByName('rodeo').Value := rodeo;
  IBQPrimerPeso.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPrimerPeso.ParamByName('fecha_ini').AsDate := desde;
  IBQPrimerPeso.ParamByName('fecha_fin').AsDate := hasta;
  IBQPrimerPeso.Open;

  IBQSalidas.Close;
  IBQSalidas.ParamByName('potrero').Value := potrero;
  IBQSalidas.ParamByName('rodeo').Value := rodeo;
  IBQSalidas.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSalidas.ParamByName('fecha_ini').AsDate := desde;
  IBQSalidas.ParamByName('fecha_fin').AsDate := hasta;
  IBQSalidas.Open;       

  IBQUltimoPeso.Close;
  IBQUltimoPeso.ParamByName('potrero').Value := potrero;
  IBQUltimoPeso.ParamByName('rodeo').Value := rodeo;
  IBQUltimoPeso.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQUltimoPeso.ParamByName('fecha_ini').AsDate := desde;
  IBQUltimoPeso.ParamByName('fecha_fin').AsDate := hasta;
  IBQUltimoPeso.Open;

  IBQMuertes.Close;
  IBQMuertes.ParamByName('potrero').Value := potrero;
  IBQMuertes.ParamByName('rodeo').Value := rodeo;
  IBQMuertes.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQMuertes.ParamByName('fecha_ini').AsDate := desde;
  IBQMuertes.ParamByName('fecha_fin').AsDate := hasta;
  IBQMuertes.Open;

  IBQRaciones.Close;
  IBQRaciones.ParamByName('potrero').Value := potrero;
  IBQRaciones.ParamByName('rodeo').Value := rodeo;
  IBQRaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRaciones.ParamByName('fecha_ini').AsDate := desde;
  IBQRaciones.ParamByName('fecha_fin').AsDate := hasta;
  IBQRaciones.Open;

  IBQSanidad.Close;
  IBQSanidad.ParamByName('potrero').Value := potrero;
  IBQSanidad.ParamByName('rodeo').Value := rodeo;
  IBQSanidad.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSanidad.ParamByName('fecha_ini').AsDate := desde;
  IBQSanidad.ParamByName('fecha_fin').AsDate := hasta;
  IBQSanidad.Open;

  IBQRepDiasCierreDetalle.Close;
  IBQRepDiasCierreDetalle.ParamByName('potrero').Value := potrero;
  IBQRepDiasCierreDetalle.ParamByName('rodeo').Value := rodeo;
  IBQRepDiasCierreDetalle.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRepDiasCierreDetalle.ParamByName('fecha_ini').AsDate := desde;
  IBQRepDiasCierreDetalle.ParamByName('fecha_fin').AsDate := hasta;
  IBQRepDiasCierreDetalle.Open;

  IBQRepDiasCierre.Close;
  IBQRepDiasCierre.ParamByName('potrero').Value := potrero;
  IBQRepDiasCierre.ParamByName('rodeo').Value := rodeo;
  IBQRepDiasCierre.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRepDiasCierre.ParamByName('fecha_ini').AsDate := desde;
  IBQRepDiasCierre.ParamByName('fecha_fin').AsDate := hasta;
  IBQRepDiasCierre.Open;

  IBQAnimales.Close;
  IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.ParamByName('rodeo').Value := rodeo;
  IBQAnimales.ParamByName('potrero').Value := potrero;
  IBQAnimales.Open;

  IBQSanitarios.Close;
  IBQSanitarios.ParamByName('potrero').Value := potrero;
  IBQSanitarios.ParamByName('rodeo').Value := rodeo;
  IBQSanitarios.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQSanitarios.ParamByName('fecha_ini').AsDate := desde;
  IBQSanitarios.ParamByName('fecha_fin').AsDate := hasta;
  IBQSanitarios.open;

  C.cerrarcartel;
  C.FreeInstance;
end;

procedure TFREPCierreLote.Button1Click(Sender: TObject);
var
  F : TFREPCierreLotePrev;
  sumaDias, CantAnimales : Integer;
  Orig : String;
begin
  inherited;
//  if(DBLCBPotrero.Text <> 'INDEFINIDO') then
 // begin
  TotalAnimal := 0;
  F := TFREPCierreLotePrev.Create(self);
  ArmarTablaEntradas(F);
  ArmarTablaSalidas(F);
  ArmarTablaRacion(F);
  ArmarTablaSanidad(F);

  F.IBQRacionAux.Close;
  F.IBQRacionAux.ParamByName('potrero').Value := potrero;
  F.IBQRacionAux.ParamByName('rodeo').Value := rodeo;
  F.IBQRacionAux.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  F.IBQRacionAux.ParamByName('fecha_ini').AsDate := desde;
  F.IBQRacionAux.ParamByName('fecha_fin').AsDate := hasta;
  F.IBQRacionAux.Open;
  

  F.IBQRaciones.Close;
  F.IBQRaciones.ParamByName('potrero').Value := potrero;
  F.IBQRaciones.ParamByName('rodeo').Value := rodeo;
  F.IBQRaciones.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  F.IBQRaciones.ParamByName('fecha_ini').AsDate := desde;
  F.IBQRaciones.ParamByName('fecha_fin').AsDate := hasta;
  F.IBQRaciones.Open;


  F.IBQDetalleAlimentacion.Close;
  F.IBQDetalleAlimentacion.ParamByName('potrero').Value := potrero;
  F.IBQDetalleAlimentacion.ParamByName('rodeo').Value := rodeo;
  F.IBQDetalleAlimentacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  F.IBQDetalleAlimentacion.ParamByName('fecha_ini').AsDate := desde;
  F.IBQDetalleAlimentacion.ParamByName('fecha_fin').AsDate := hasta;
  F.IBQDetalleAlimentacion.Open;



  fechaSalida := DTPHasta.Date;

 { if IBQRepDiasCierre.FieldValues['prom'] <> null then
    CantDias := IBQRepDiasCierre.FieldValues['prom']
  else
    CantDias := 0; }

  if IBQRepDiasCierre.FieldValues['suma'] <> null then
    sumaDias := IBQRepDiasCierre.FieldValues['suma']
  else
    SumaDias := 0;

  if IBQRepDiasCierre.FieldValues['cantidad'] <> null then
    CantAnimales := IBQRepDiasCierre.FieldValues['cantidad']
  else
    CantAnimales := 0;

  IBQAnimales.First;

  F.Detalle := CBListado.Checked;

  if IBQAnimales.FieldValues['origen'] <> null then
    Orig := IBQAnimales.FieldValues['origen']
  else
    Orig := '-';

  if rodeo > 0 then
    F.QRLIngreso.Caption := Orig+ ' Rodeo: '+DBLCBRodeo.Text+' Entre el '+DateToStr(fechaIngreso)+' y el '+DateToStr(fechaSalida)
  else
    F.QRLIngreso.Caption := Orig+ ' Potrero: '+DBLCBPotrero.Text+' Entre el '+DateToStr(fechaIngreso)+' y el '+DateToStr(fechaSalida);

  if KGSal > 0 then
    F.QRLKgAumentado.Caption := FormatFloat('#0.##',KGSal-KGIng)+' Kg.';
  if CantS > 0 then
    F.QRLAumentoPromedio.Caption := FormatFloat('#0.##',(KGSal-KGIng)/existencia_promedio)+' Kg.';
  if (CantS > 0) and (CantDias > 0) then
    F.QRLAumentoDiario.Caption := FormatFloat('#0.##',((KGSal-KGIng)/existencia_promedio)/CantDias)+' Kg.';

  F.QRLDiasProm.Caption := floatToStr(CantDias);
  F.QRLDiasCabeza.Caption := FormatFloat('#0.##',CantDias * existencia_promedio);
  F.QRLValorHoteleria.Caption := FormatFloat('#0.##',Hotel);
  F.QRLTotalHotel.Caption := FormatFloat('#0.##',Hotel*(CantDias * existencia_promedio))+' $';
  if CantAnimales > 0 then
  begin
    F.QRLCostoHotelAni.Caption := FormatFloat('#0.##',(Hotel*(CantDias * existencia_promedio))/existencia_promedio) + ' $';
    TotalAnimal := TotalAnimal + ((Hotel*(CantDias * existencia_promedio))/existencia_promedio);
  end;

  //F.QRLIngreso1.Caption := 'Ingresaron '+IntToStr(CantAnimales)+' Animales';
  F.QRLCostoTotaAni.Caption := FormatFloat('#0.##',TotalAnimal)+' $';

  F.ShowModal;
  F.Destroy;
 // end
 // else
 //   MostrarMensaje(tmError,'Seleccione el potrero para continuar');
end;

procedure TFREPCierreLote.ArmarTablaEntradas(var F : TFREPCierreLotePrev);
var
  NextTop : Integer;
begin
  NextTop := 568;
  CantE := 0;
  KGIng := 0;
  F.Entradas := (not IBQEntradas.IsEmpty) or (not IBQPrimerPeso.IsEmpty);
  IBQEntradas.First;

  IBQPriemerAlimentacion.Close;
  IBQPriemerAlimentacion.ParamByName('potrero').Value := potrero;
  IBQPriemerAlimentacion.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPriemerAlimentacion.ParamByName('fecha_ini').AsDate := desde;
  IBQPriemerAlimentacion.ParamByName('fecha_fin').AsDate := hasta;
  IBQPriemerAlimentacion.Open;


  if IBQPriemerAlimentacion.FieldValues['fecha'] <> null then
      fechaIngreso := IBQPriemerAlimentacion.FieldValues['fecha']
    else
      fechaIngreso := desde;

  IBQExistenciaPromedio.Close;
  IBQExistenciaPromedio.ParamByName('potrero').Value := potrero;
  IBQExistenciaPromedio.ParamByName('fecha_ini').AsDate := fechaIngreso;
  IBQExistenciaPromedio.ParamByName('fecha_fin').AsDate := IncDay(hasta,-1);
  IBQExistenciaPromedio.Open;



  if IBQExistenciaPromedio.FieldValues['promedioexistencia'] <> null then
    existencia_promedio := IBQExistenciaPromedio.FieldValues['promedioexistencia']
  else
    existencia_promedio := 0;

  F.QRLExistenciaPromedio.Caption := FloatToStr(existencia_promedio);

  if not IBQEntradas.IsEmpty then
  begin
  {  if IBQEntradas.FieldValues['fecha_alta'] <> null then
      fechaIngreso := IBQEntradas.FieldValues['fecha_alta']
    else
      fechaIngreso := desde;
    ShowMessage(DateToStr(fechaIngreso));
   }
    while not IBQEntradas.Eof do
    begin
      NextTop := NextTop+23;
      if IBQEntradas.FieldValues['cant_animales'] <> null then
        CantE := CantE + IBQEntradas.FieldValues['cant_animales'];
      if IBQEntradas.FieldValues['peso_entrada'] <> null then
        KGIng := KGIng + IBQEntradas.FieldValues['peso_entrada'];
      if IBQEntradas.FieldValues['peso'] <> null then
        KGPromE := KGPromE + IBQEntradas.FieldValues['peso'];
      IBQEntradas.Next;

    end;

    F.QRLIngreso.Caption := IntToStr(CantE);
    F.QRLIngreso1.Caption := 'Ingresaron '+IntToStr(CantE)+' Animales';
    F.QRLIngresado.Caption := FormatFloat('#0.##',KGIng)+' Kg.';
    if CantE > 0 then
      F.QRLPromIng.Caption := FormatFloat('#0.##',KGIng/CantE)+' Kg.';
  end;
  //////////////
  if (not IBQPrimerPeso.IsEmpty) and (KGIng = 0) then
  begin
    if IBQPrimerPeso.FieldValues['fecha_alta'] <> null then
      fechaIngreso := IBQPrimerPeso.FieldValues['fecha_alta']
    else
      fechaIngreso := desde;

    while not IBQPrimerPeso.Eof do
    begin
      NextTop := NextTop+23;
      if IBQPrimerPeso.FieldValues['cant_animales'] <> null then
        CantE := CantE + IBQPrimerPeso.FieldValues['cant_animales'];
      if IBQPrimerPeso.FieldValues['peso_entrada'] <> null then
        KGIng := KGIng + IBQPrimerPeso.FieldValues['peso_entrada'];
      if IBQPrimerPeso.FieldValues['peso'] <> null then
        KGPromE := KGPromE + IBQPrimerPeso.FieldValues['peso'];
      IBQPrimerPeso.Next;

    end;

    F.QRLIngreso.Caption := IntToStr(CantE);
    F.QRLIngresado.Caption := FormatFloat('#0.##',KGIng)+' Kg.';
    if CantE > 0 then
      F.QRLPromIng.Caption := FormatFloat('#0.##',KGIng/CantE)+' Kg.';
  end;
end;

procedure TFREPCierreLote.ArmarTablaSalidas(var F : TFREPCierreLotePrev);
var
  NextTop, NextTopM : Integer;
  I : Integer;
  PesoBaja : Double;
begin
  NextTop := 760;
  NextTopM := 738;
  CantDias := 0;
  CantS := 0;
  CantMuertes := 0;
  PesoBaja := 0;
  KGSal := 0;
  IBQSalidas.First;
  I := 0;
  F.Salidas := (not IBQSalidas.IsEmpty) or (not IBQUltimoPeso.IsEmpty);
  if not IBQSalidas.IsEmpty and (IBQSalidas.FieldValues['fecha_baja'] <> null) then
  begin
    while not IBQSalidas.Eof do
    begin
     // if IBQSalidas.FieldValues['tipo'] <> 3 then
      //begin
      {  if IBQSalidas.FieldValues['fecha_baja'] <> fechaSalida then
        begin
          CantDias := CantDias + DaysBetween(IBQSalidas.FieldValues['fecha_baja'], fechaIngreso);
          Inc(I);
        end;     }
        NextTop := NextTop+23;

        if IBQSalidas.FieldValues['peso_destino'] <> null then
          PesoBaja := PesoBaja + IBQSalidas.FieldValues['peso_destino'];


        if IBQSalidas.FieldValues['cant_animales'] <> null then
          CantS := CantS + IBQSalidas.FieldValues['cant_animales'];

        if(IBQSalidas.FieldValues['tipo'] = 3 )then
          begin
            if IBQSalidas.FieldValues['cant_animales'] <> null then
              CantMuertes := CantMuertes + IBQSalidas.FieldValues['cant_animales'];
            CantS := CantS - IBQSalidas.FieldValues['cant_animales'];
          end;    
        if(IBQSalidas.FieldValues['tipo'] <> 3 )then
          if IBQSalidas.FieldValues['peso_salida'] <> null then
            KGSal := KGSal + IBQSalidas.FieldValues['peso_salida'];
        if IBQSalidas.FieldValues['peso'] <> null then
          KGPromS := KGPromS + IBQSalidas.FieldValues['peso'];
        fechaSalida := IBQSalidas.FieldValues['fecha_baja'];
     { end
      else
      begin
        if IBQSalidas.FieldValues['cant_animales'] <> null then
          CantMuertes := CantMuertes + IBQSalidas.FieldValues['cant_animales'];
      end;            }
      IBQSalidas.Next;
    end;

    F.QRLIngreso1.Caption := 'Ingresaron '+IntToStr(CantE) +' Animales';
    F.QRLAnimalesSalidos.Caption := IntToStr(CantS);
    F.QRLKGSalidos.Caption := FormatFloat('#0.##',KGSal)+' Kg.';
    if CantS > 0 then
      F.QRLKGPromSalidos.Caption := FormatFloat('#0.##',KGSal/CantS)+' Kg.';
    F.QRLMuertos.Caption := IntToStr(CantMuertes);
 {   if CantDias > 0 then
      CantDias := CantDias / I
    else
      CantDias := DaysBetween(fechaSalida,fechaIngreso);     }
  //  F.QRLDiasProm.Caption := FormatFloat('#0.##',CantDias);
  end
  else
    fechaSalida := hasta;
 ////
 {if not IBQUltimoPeso.IsEmpty and (IBQUltimoPeso.FieldValues['fecha_baja'] <> null) then
  begin
    while not IBQUltimoPeso.Eof do
    begin
      if IBQUltimoPeso.FieldValues['tipo'] <> 3 then
      begin
   {     if IBQUltimoPeso.FieldValues['fecha_baja'] <> fechaSalida then
        begin
          CantDias := CantDias + DaysBetween(IBQUltimoPeso.FieldValues['fecha_baja'], fechaIngreso);
          Inc(I);
        end;  }
        NextTop := NextTop+23;

      {  if IBQUltimoPeso.FieldValues['peso_destino'] <> null then
          PesoBaja := PesoBaja + IBQUltimoPeso.FieldValues['peso_destino'];
        if IBQUltimoPeso.FieldValues['cant_animales'] <> null then
          CantS := CantS + IBQUltimoPeso.FieldValues['cant_animales'];
        if IBQUltimoPeso.FieldValues['peso_salida'] <> null then
          KGSal := KGSal + IBQUltimoPeso.FieldValues['peso_salida'];
        if IBQUltimoPeso.FieldValues['peso'] <> null then
          KGPromS := KGPromS + IBQUltimoPeso.FieldValues['peso'];
        fechaSalida := IBQUltimoPeso.FieldValues['fecha_baja'];
      end
      else
      begin
        if IBQUltimoPeso.FieldValues['cant_animales'] <> null then
          CantMuertes := CantMuertes + IBQUltimoPeso.FieldValues['cant_animales'];
      end;
      IBQUltimoPeso.Next;
    end;

    F.QRLAnimalesSalidos.Caption := IntToStr(CantS);
    F.QRLKGSalidos.Caption := FormatFloat('#0.##',KGSal)+' Kg.';
    if CantS > 0 then
      F.QRLKGPromSalidos.Caption := FormatFloat('#0.##',KGSal/CantS)+' Kg.';
    F.QRLMuertos.Caption := IntToStr(CantMuertes);
  {  if CantDias > 0 then
      CantDias := CantDias / I
    else
      CantDias := DaysBetween(fechaSalida,fechaIngreso);  }
    F.QRLDiasProm.Caption := FormatFloat('#0.##',CantDias);
 { end
  else
    fechaSalida := hasta;   }

  F.Muertes := CantMuertes > 0;
end;

procedure TFREPCierreLote.ArmarTablaRacion(var F : TFREPCierreLotePrev);
var
  NextTop, NextLeft, TopAnt : Integer;
  Racion,RacionAux : Integer;
  Cant, CantR : Integer;
  CostoTotal, CostoUnitario : Double;
  ConsumoMS, ConsumoFinalTC, costo : Double;
  desde, hasta, desde_aux, hasta_aux : TDate;

begin
  NextTop := 64;
  TopAnt := 64;
  NextLeft := 14;
  PorcMS := 0;
  Cant := 0;
  CostoTotal := 0;
  CostoUnitario := 0;
  ConsumoTotalTC := 0;
  ConsumoFinalTC := 0;
  ConsumoMS := 0;
  CantDias := 0;
  IBQRaciones.First;
  CantR := 1;
  desde := fechaIngreso;
  hasta := fechaSalida;
  F.Alimentacion := not IBQRaciones.IsEmpty;
  if not IBQRaciones.IsEmpty and (IBQRaciones.FieldValues['racion'] <> null) then
  begin

    RacionAux := IBQRaciones.FieldValues['racion'];
    {IBQDetalleAlimentacion.Close;
    IBQRaciones.ParamByName('potrero').Value := potrero;
    IBQDetalleAlimentacion.ParamByName('rodeo').Value := rodeo;
    IBQDetalleAlimentacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
    IBQDetalleAlimentacion.ParamByName('fecha_ini').AsDate := desde;
    IBQDetalleAlimentacion.ParamByName('fecha_fin').AsDate := hasta;
    IBQDetalleAlimentacion.ParamByName('rac').Value := RacionAux;
    IBQDetalleAlimentacion.Open;  }
    CantDias := IBQRaciones.FieldValues['cant_dias'];

    while (not IBQRaciones.Eof)do//and (CantR <= 3) do
    begin
      Racion := IBQRaciones.FieldValues['racion'];
      if RacionAux <> Racion then
      begin
        if IBQRaciones.FieldValues['fecha_ingreso'] <> null then
          hasta := IBQRaciones.FieldValues['fecha_ingreso']
        else
          hasta := desde;
        desde := hasta;
     //   ConsumoTotalTC := 0;
     //   CostoUnitario := 0;
    //    CostoTotal := 0;
        RacionAux := Racion;
        TopAnt := NextTop;
        NextTop := NextTop+30;
        NextLeft := 381;
        CantR := CantR + 1;

        desde_aux := DTPDesde.Date;
        hasta_aux := DTPHasta.Date;

      {  IBQDetalleAlimentacion.Close;
        IBQDetalleAlimentacion.ParamByName('potrero').Value := potrero;
        IBQDetalleAlimentacion.ParamByName('rodeo').Value := rodeo;
        IBQDetalleAlimentacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
        IBQDetalleAlimentacion.ParamByName('fecha_ini').AsDate := desde_aux;
        IBQDetalleAlimentacion.ParamByName('fecha_fin').AsDate := hasta_aux;
        IBQDetalleAlimentacion.ParamByName('rac').Value := Racion;
        IBQDetalleAlimentacion.Open;  }

        CantDias := CantDias + IBQRaciones.FieldValues['cant_dias'];
      end;



      if (IBQRaciones.FieldValues['consumo_tc'] <> null) and (IBQRaciones.FieldValues['porc_ms'] <> null) then
          ConsumoMS := ConsumoMS + ( (IBQRaciones.FieldValues['consumo_tc']*(IBQRaciones.FieldValues['porc_ms']/100)) * IBQRaciones.FieldValues['cant_dias']);
      if IBQRaciones.FieldValues['precio'] <> null then
        CostoUnitario := CostoUnitario + IBQRaciones.FieldValues['precio'];
      if IBQRaciones.FieldValues['costo'] <> null then
        costo := costo + (IBQRaciones.FieldValues['costo'] * IBQRaciones.FieldValues['cant_dias']);
      if (IBQRaciones.FieldValues['costo'] <> null) and (IBQRaciones.FieldValues['cant_dias'] <> null)then
      CostoTotal := CostoTotal + (IBQRaciones.FieldValues['costo']*IBQRaciones.FieldValues['cant_dias']);
      Cant := Cant+1;
      if IBQRaciones.FieldValues['porc_ms'] <> null  then
          PorcMS := PorcMS + (IBQRaciones.FieldValues['KL_MS']*IBQRaciones.FieldValues['cant_dias']);
      if (IBQRaciones.FieldValues['consumo_tc'] <> null) and (IBQRaciones.FieldValues['cant_dias'] <> null)  then
      begin
        ConsumoTotalTC := ConsumoTotalTC + (IBQRaciones.FieldValues['consumo_tc']*IBQRaciones.FieldValues['cant_dias']);
        ConsumoFinalTC := ConsumoFinalTC + (IBQRaciones.FieldValues['consumo_tc']*IBQRaciones.FieldValues['cant_dias']);
      end;
      NextTop := NextTop+23;
      IBQRaciones.Next;
    end;

    hasta := fechaSalida;

    if Cant > 0 then

    F.QRLConsumoTotalTC.Caption := FormatFloat('#0.##',ConsumoTotalTC)+' Kg.';
    F.QRLConsumoTotalMS.Caption := FormatFloat('#0.##',PorcMS)+' Kg.';
    //F.QRLConsumoTotalMS.Caption := FormatFloat('#0.##',(PorcMS*(ConsumoFinalTC/CantR))/100)+' Kg.';
    if CantDias > 0 then
      F.QRLConsumoDiario.Caption := FormatFloat('#0.##',(PorcMS/CantDias))+' Kg.';
    if CantS > 0 then
      F.QRLConsumoDiarioCabMS.Caption := FormatFloat('#0.##',(((ConsumoMS/CantDias)/existencia_promedio)))+' Kg.';
    if CantS > 0 then                                                         
      F.QRLConsumoDiarioCabTC.Caption := FormatFloat('#0.##',(((ConsumoTotalTC/CantDias)/existencia_promedio)))+' Kg.';


    if (CantS > 0) and (CantDias > 0) then
     F.QRLConversion.Caption := FormatFloat('#0.##',((ConsumoMS/CantDias/existencia_promedio)/(((KGSal-KGIng)/existencia_promedio)/CantDias)))+' Kg MS';

    if (CantS > 0) and (CantDias > 0) then
    begin
      F.QRLPorcConsumo.Caption := FormatFloat('#0.##', (((ConsumoMS/CantDias)/existencia_promedio) * 100) /(((KGIng/CantE)+(KGSal/CantS))/2)  )+' %';
      F.QRLPromKgConv.Caption := FormatFloat('#0.##', (((KGIng/CantE)+(KGSal/CantS))/2))+' Kg.';
    end;
    if Cant > 0 then
      F.QRLPrecioAlimMT.Caption := FormatFloat('#0.##',  (costo/CantDias))+' $/Día';

    if cantS > 0 then
    begin
      F.QRLCostoAliAnimal.Caption := FormatFloat('#0.##',  ( (costo / existencia_promedio)) )+' $';
      TotalAnimal := TotalAnimal +  ((costo / existencia_promedio));
    end;
  end;
end;

procedure TFREPCierreLote.ArmarTablaSanidad(var F : TFREPCierreLotePrev);
var
  NextTop : Integer;
  CostoUnitario, CostoTotal : Double;
  Cant : Integer;
  ultimo : string;
  animales : Double;
begin
  NextTop := 450;
  Cant := 0;
  CostoUnitario := 0;
  CostoTotal := 0;

  //ultimo := '';
  animales := 0;

  IBQSanitarios.First;
  if not IBQSanitarios.IsEmpty then
  begin
      while not IBQSanitarios.Eof do
      begin
        //if(IBQSanitariosCATEGORIA.Value <> ultimo)then
        //  begin
          //  ultimo := IBQSanitariosCATEGORIA.Value;
          //  total := total + 1;
         // end;
        if (IBQSanitarios.FieldValues['costo'] <> null) then
          begin
           animales := animales + IBQSanitariosCANT_ANIMALES.Value;
           costoTotal := costoTotal + IBQSanitariosCOSTO_TOTAL.Value;
          end;
        IBQSanitarios.Next;                                    

      end;
      F.QRLCostoSaniAni.Caption := FormatFloat('#0.##', CostoTotal/existencia_promedio)+' $';
  end;
  if(CostoTotal/existencia_promedio = 0)then
    F.QRLCostoSaniAni.Caption := FormatFloat('#0.##', 0)+' $';

  if(animales > 0)then
  TotalAnimal := TotalAnimal + (CostoTotal/existencia_promedio);
 { F.Sanidad := not IBQSanidad.IsEmpty;
  IBQSanidad.First;
  if not IBQSanidad.IsEmpty and (IBQSanidad.FieldValues['fecha_sani'] <> null) then
  begin
    while not IBQSanidad.Eof do
    begin
      if (IBQSanidad.FieldValues['costo_uni'] <> null) and (IBQSanidad.FieldValues['costo_uni'] > 0) then
        CostoUnitario := CostoUnitario + IBQSanidad.FieldValues['costo_uni'];
      NextTop := NextTop+23;
      IBQSanidad.Next;
    end;

    if CantS > 0 then
    begin
      F.QRLCostoSaniAni.Caption := FormatFloat('#0.##', CostoTotal / CantS)+' $';
      TotalAnimal := TotalAnimal + (CostoTotal / CantS);
    end;
  end;  }
end;

procedure TFREPCierreLote.FormCreate(Sender: TObject);
begin
  inherited;
  PasarTodasLasCategs;
  rodeo := null;
  potrero := null;
  DTPHasta.Date := Date;
  DTPDesde.Date := IncMonth(Date,-1);
  desde := DTPDesde.Date;
  hasta := DTPHasta.Date;
  fechaSalida := hasta;
  fechaIngreso := desde;

  IBQPotrero.Close;
  IBQPotrero.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPotrero.Open;
  IBQPotrero.Last;
  IBQPotrero.First;
  if (DBLCBPotrero.KeyValue = NULL) then
    DBLCBPotrero.KeyValue := IBQPotrero.FieldValues['ID_POTRERO'];

  IBQRodeo.Close;
  IBQRodeo.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRodeo.Open;
  IBQRodeo.Last;
  IBQRodeo.First;
  if (DBLCBRodeo.KeyValue = NULL) then
    DBLCBRodeo.KeyValue := IBQRodeo.FieldValues['ID_RODEO'];
end;

procedure TFREPCierreLote.Button2Click(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFREPCierreLote.EHotelChange(Sender: TObject);
begin
  inherited;
  if not TryStrToFloat(EHotel.Text,hotel) then
    hotel := 0;
end;

procedure TFREPCierreLote.IBuscarClick(Sender: TObject);
begin
  inherited;
  Button2.Click;
end;

procedure TFREPCierreLote.ICancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFREPCierreLote.ELoteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    Button2.Click;
end;

procedure TFREPCierreLote.IBQAnimalesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Last;
  DataSet.First;
  GBAnims.Caption := 'Animales que se encuentran actualmente en el Potrero/Rodeo ['+IntToStr(DataSet.RecordCount)+']';
  IPreview.Visible := True; //  not DataSet.IsEmpty;
  LPreview.Visible := True; // not DataSet.IsEmpty;
end;

procedure TFREPCierreLote.BDBGAnimalesDblClick(Sender: TObject);
begin
  inherited;
  if (BDBGAnimales.SelectedIndex = 0) then
    if not(IBQAnimales.eof) then
     begin
      if (FREPFichaAnimal = nil) then
        Application.CreateForm(TFREPFichaAnimal, FREPFichaAnimal);
      FREPFichaAnimal.animal := IBQAnimales.fieldByName('id_animal').AsInteger;
      FREPFichaAnimal.ShowModal;
     end;
end;

procedure TFREPCierreLote.DBLCBPotreroCloseUp(Sender: TObject);
begin
  inherited;
  potrero := null;
  rodeo := null;
  if DBLCBPotrero.KeyValue <> null then
    potrero := DBLCBPotrero.KeyValue;
 // ActConsulta;
end;

procedure TFREPCierreLote.DBLCBRodeoCloseUp(Sender: TObject);
begin
  inherited;
  rodeo := null;
  potrero := null;
  if DBLCBRodeo.KeyValue <> null then
    rodeo := DBLCBRodeo.KeyValue;
//  ActConsulta;
end;

procedure TFREPCierreLote.DTPDesdeChange(Sender: TObject);
begin
  inherited;
  desde := DTPDesde.Date;
  if (rodeo <> null) or (potrero <> null) then
//    ActConsulta;
end;

procedure TFREPCierreLote.DTPHastaChange(Sender: TObject);
begin
  inherited;
  hasta := DTPHasta.Date;
  if (rodeo <> null) or (potrero <> null) then
  //  ActConsulta;
end;

procedure TFREPCierreLote.BPasar1Click(Sender: TObject);
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

  if (potrero <> null) or (rodeo <> null) then
  //  ActConsulta;

end;

procedure TFREPCierreLote.BSacar1Click(Sender: TObject);
begin
  inherited;
  if not IBQSeleccionados.IsEmpty then
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

  if (potrero <> null) or (rodeo <> null) then
  //  ActConsulta;
end;

procedure TFREPCierreLote.JvICategoriasClick(Sender: TObject);
begin
  inherited;
  BorrarCategs;
  IBQSeleccionados.Close;
  IBQSeleccionados.Open;
  IBQDisponibles.Close;
  IBQDisponibles.Open;
  PFiltrosCategs.Visible := true;
end;

procedure TFREPCierreLote.IAceptarClick(Sender: TObject);
begin
  inherited;
  PFiltrosCategs.Visible := false;
end;

procedure TFREPCierreLote.ICancelCategClick(Sender: TObject);
begin
  inherited;
  PasarTodasLasCategs;
  PFiltrosCategs.Visible := false;
end;

procedure TFREPCierreLote.JvICategoriasMouseEnter(Sender: TObject);
begin
  inherited;
  JvBHint.ActivateHint(JvICategorias,'Haga clic para seleccionar las categorías que desea evaluar','Filtro por Categoría',5000);
end;

procedure TFREPCierreLote.JvICategoriasMouseLeave(Sender: TObject);
begin
  inherited;
  JvBHint.CancelHint;
end;

procedure TFREPCierreLote.Button3Click(Sender: TObject);
begin
  inherited;
  ActConsulta();
end;

procedure TFREPCierreLote.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  potrero := DBLCBPotrero.KeyValue;
  Button3.OnClick(Sender)
end;

end.
