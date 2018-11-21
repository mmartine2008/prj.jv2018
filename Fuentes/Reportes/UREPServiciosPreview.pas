unit UREPServiciosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  QuickRpt, QRPDFFilt, QRWebFilt, QRExport, QRCtrls, jpeg, UPrincipal, QRPrntr,
  ImgList, PngImageList, pngimage, JvExExtCtrls, JvImage, JvExControls,
  JvLabel, JvGIF;

type
  TFREPServiciosPreview = class(TFUniversal)
    QRServicioAnimales: TQuickRep;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    LabelTitulo: TQRLabel;
    QRShape4: TQRShape;
    QRBand1: TQRBand;
    LabelServicio: TQRLabel;
    LabelNombre: TQRLabel;
    LabelEstado: TQRLabel;
    QRLabelEstado: TQRLabel;
    QRLabelTipo: TQRLabel;
    LabelTipo: TQRLabel;
    QRShape3: TQRShape;
    QRLabelTituloEstadoActual: TQRLabel;
    QRLFechaIns: TQRLabel;
    QRLFecha: TQRLabel;
    QRShape7: TQRShape;
    QRLD: TQRLabel;
    QRLDesde: TQRLabel;
    QRLH: TQRLabel;
    QRLHasta: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLG: TQRLabel;
    QRLGrupo: TQRLabel;
    QRBEncabezado: TQRBand;
    LabelRP1: TQRLabel;
    LabelRaza: TQRLabel;
    LabelAnimalesVinculados: TQRLabel;
    LabelSexo: TQRLabel;
    LabelEntrada: TQRLabel;
    LabelSalida: TQRLabel;
    LabelCondCorporalEntrada: TQRLabel;
    LabelCondCorporalSalida: TQRLabel;
    LabelNombre1: TQRLabel;
    QRBAnimales: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRLEntrada: TQRLabel;
    QRLSalida: TQRLabel;
    QRLCondCorpSalida: TQRLabel;
    QRLCondCorpEntrada: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBTDosis: TQRDBText;
    QRDBTCondCorp: TQRDBText;
    QRDBTResponsable: TQRDBText;
    QRDBTToro: TQRDBText;
    QRBand4: TQRBand;
    LabelCantidadAnimales: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand11: TQRBand;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel10: TQRLabel;
    QRServicioEventosHembras: TQuickRep;
    QRBand7: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape6: TQRShape;
    QRBand8: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRBand9: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand10: TQRBand;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    QRServicioEventosToros: TQuickRep;
    QRBand2: TQRBand;
    LabelFecha: TQRLabel;
    LabelRP2: TQRLabel;
    LabelEventosVinculados: TQRLabel;
    LabelEvento: TQRLabel;
    QRDBText5: TQRDBText;
    LabelNombre2: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand5: TQRBand;
    LabelCantidadEventos: TQRLabel;
    QRExpr2: TQRExpr;
    QRSummary: TQuickRep;
    QRBand6: TQRBand;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRHTMLFilter1: TQRHTMLFilter;
    QRCRServicios: TQRCompositeReport;
    IBQAux: TIBQuery;
    IBQAuxCondicion: TIBQuery;
    IBQDatosInseminacion: TIBQuery;
    IBQDatosInseminacionDOSIS: TIntegerField;
    IBQDatosInseminacionRESPONSABLE: TIBStringField;
    IBQDatosInseminacionCONDICION_CORPORAL: TIntegerField;
    IBQDatosInseminacionFECHA: TDateField;
    IBQToros: TIBQuery;
    IBQAuxCond: TIBQuery;
    IBQconsultaAnimal: TIBQuery;
    IBQBaja: TIBQuery;
    IBQTorosN: TIBStringField;
    IBQTorosA: TIBStringField;
    IBQTorosR: TIBStringField;
    IBQTorosNOMBRE: TIBStringField;
    QRShape8: TQRShape;
    QRSysData11: TQRSysData;
    QRLEmpresa: TQRLabel;
    QRLNombrePropietario: TQRLabel;
    QRLRenglon2: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRImagenEmpresa: TQRImage;
    QRLDatosAbajo: TQRLabel;
    QRLDatosAbajo2: TQRLabel;
    QRLDatosAbajo12: TQRLabel;
    QRLDatosAbajo22: TQRLabel;
    QRLDatosAbajo13: TQRLabel;
    QRLDatosAbajo23: TQRLabel;
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRCRServiciosAddReports(Sender: TObject);
    procedure QRLEntradaPrint(sender: TObject;  var Value: String);
    procedure QRLSalidaPrint(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
    procedure IBQTorosCalcFields(DataSet: TDataSet);
  private
    function retornarCondicion(evento: integer): string;
    procedure cargarDatosPropietario();    
  public
    Toros, Hembras : Boolean;
    servicio : Integer;
    tipo_servicio : string;
  end;

var
  FREPServiciosPreview: TFREPServiciosPreview;

implementation

uses UREPServicios, URepGeneral, uTiposGlobales;

{$R *.dfm}

procedure TFREPServiciosPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
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

procedure TFREPServiciosPreview.QRCRServiciosAddReports(Sender: TObject);
begin
  inherited;
  QRCRServicios.Reports.Clear;
  QRCRServicios.Reports.Add(QRServicioAnimales);
  if (Toros)then
    QRCRServicios.Reports.Add(QRServicioEventosToros); // toros
  if (Hembras) then
    QRCRServicios.Reports.Add(QRServicioEventosHembras); // hembras
  QRCRServicios.Reports.Add(QRSummary);
end;

procedure TFREPServiciosPreview.QRLEntradaPrint(sender: TObject;  var Value: String);
Var sexo : integer;
begin
  inherited;
  if (tipo_servicio = 'R') then
  begin
    sexo := IBQconsultaAnimal.FieldByName('sexo').AsInteger;
    case sexo of
      1, 3, 4, 7, 8 : begin
                        IBQAux.Active := false;
                        IBQAux.SQL.Clear;
                        IBQAux.SQL.Add('select * from eve_ingreso_toro eet, eve_eventos ee where (eet.id_evento = ee.id_evento) and (eet.servicio = :s) and (ee.animal = :a) and (ee.establecimiento = '+intToStr(establecimiento)+')');
                        IBQAux.ParamByName('s').AsInteger := servicio;
                        IBQAux.ParamByName('a').AsInteger := IBQConsultaAnimal.FieldByName('id_animal').AsInteger;
                        IBQAux.Active := true;
                        if (IBQAux.RecordCount >0) then
                          begin
                            Value := IBQAux.FieldByName('fecha').AsString;
                            QRLCondCorpEntrada.Caption := '';
                          end
                        else
                          begin
                            Value := '';
                            QRLCondCorpEntrada.Caption := '';
                          end;
                      end;
      2, 5, 6, 9, 10: begin
                        IBQAux.Active := false;
                        IBQAux.SQL.Clear;
                        IBQAux.SQL.Add('select * from eve_ingreso_servicio eet, eve_eventos ee where (eet.id_evento = ee.id_evento) and (eet.servicio = :s) and (ee.animal = :a) and (ee.establecimiento = '+intToStr(establecimiento)+')');
                        IBQAux.ParamByName('s').AsInteger := servicio;
                        IBQAux.ParamByName('a').AsInteger := IBQConsultaAnimal.FieldByName('id_animal').AsInteger;
                        IBQAux.Active := true;
                        if (IBQAux.RecordCount >0) then
                          begin
                            Value := IBQAux.FieldByName('fecha').AsString;
                            QRLCondCorpEntrada.Caption := retornarCondicion(IBQAux.fieldByName('id_evento').AsInteger);
                          end
                        else
                          begin
                            Value := '';
                            QRLCondCorpEntrada.Caption := '';
                          end;
                      end;
    end;
  end
  else
  begin
    QRLCondCorpEntrada.Caption := '';
    Value := '';
  end;
end;

procedure TFREPServiciosPreview.QRLSalidaPrint(sender: TObject; var Value: String);
Var sexo : integer;
begin
  inherited;
  if (tipo_servicio = 'R') then
  begin
    sexo := IBQconsultaAnimal.FieldByName('sexo').AsInteger;
    case sexo of
      1, 3, 4, 7, 8 : begin
                        //codigo
                        IBQAux.Active := false;
                        IBQAux.SQL.Clear;
                        IBQAux.SQL.Add('select * from eve_egreso_toro eet, eve_eventos ee where (eet.id_evento = ee.id_evento) and (eet.servicio = :s) and (ee.animal = :a)and (ee.establecimiento = '+intToStr(establecimiento)+')');
                        IBQAux.ParamByName('s').AsInteger := servicio;
                        IBQAux.ParamByName('a').AsInteger := IBQConsultaAnimal.FieldByName('id_animal').AsInteger;
                        IBQAux.Active := true;
                        if (IBQAux.RecordCount >0) then
                          begin
                            Value := IBQAux.FieldByName('fecha').AsString;
                            QRLCondCorpSalida.Caption := '';
                          end
                        else
                          begin
                            Value := '';
                            QRLCondCorpSalida.Caption := '';
                          end;
                      end;
      2, 5, 6, 9, 10: begin
                        //codigo
                        IBQAux.Active := false;
                        IBQAux.SQL.Clear;
                        IBQAux.SQL.Add('select * from eve_egreso_servicio eet, eve_eventos ee where (eet.id_evento = ee.id_evento) and (eet.servicio = :s) and (ee.animal = :a)and (ee.establecimiento = '+intToStr(establecimiento)+')');
                        IBQAux.ParamByName('s').AsInteger := servicio;
                        IBQAux.ParamByName('a').AsInteger := IBQConsultaAnimal.FieldByName('id_animal').AsInteger;
                        IBQAux.Active := true;
                        if (IBQAux.RecordCount >0) then
                          begin
                            Value := IBQAux.FieldByName('fecha').AsString;
                            QRLCondCorpSalida.Caption := retornarCondicion(IBQAux.fieldByName('id_evento').AsInteger);
                          end
                        else
                          begin
                            Value := '';
                            QRLCondCorpSalida.Caption := '';
                          end;
                      end;
    end;
    if Value = '' then
    begin
      IBQBaja.Close;
      IBQBaja.ParamByName('Animal').AsInteger := IBQConsultaAnimal.FieldValues['id_animal'];
      IBQBaja.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQBaja.Open;
      if IBQBaja.FieldValues['nombre'] <> null then
        Value := IBQBaja.FieldValues['nombre']
      else
        Value := '';
    end;
  end
  else
  begin
    QRLCondCorpSalida.Caption := '';
    Value := '';
  end;
end;

function TFREPServiciosPreview.retornarCondicion(evento: integer): string;
begin
// codigo
  IBQAuxCondicion.Close;
  IBQAuxCondicion.sql.Clear;
  IBQAuxCondicion.SQL.Add('select ccc.'+FPrincipal.StringEscalaCC+' as condicion from eve_eventos ee, eve_condicion_corporal ecc, cod_condiciones_corporales ccc ');
  IBQAuxCondicion.SQL.Add('where (ee.disparador = :id) and (ee.id_evento = ecc.id_evento) and (ecc.condicion_corporal = ccc.id_condicion_corporal)');
  IBQAuxCondicion.ParamByName('id').AsInteger := evento;
  IBQAuxCondicion.Open;
  result := IBQAuxCondicion.fieldByName('condicion').AsString;
end;

procedure TFREPServiciosPreview.QRDBText1Print(sender: TObject; var Value: String);
var
  Cond, valor : String;
begin
  inherited;
  IBQDatosInseminacion.Close;
  IBQDatosInseminacion.ParamByName('id').AsInteger := servicio;
  IBQDatosInseminacion.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDatosInseminacion.ParamByName('animal').AsInteger := IBQConsultaAnimal.FieldByName('id_animal').AsInteger;
  IBQDatosInseminacion.Open;

  IBQToros.Close;
  IBQToros.ParamByName('id').AsInteger := servicio;
  IBQToros.ParamByName('animal').AsInteger := IBQConsultaAnimal.FieldByName('id_animal').AsInteger;
  IBQToros.Open;

  QRDBTToro.DataSet := IBQToros;
  QRDBTToro.DataField := 'nombre';

  IBQAuxCond.Close;
  IBQAuxCond.SQL.Clear;
  IBQAuxCond.SQL.Add('select valor from rel_parametros_establecimiento where parametro=3 and establecimiento=:esta');
  IBQAuxCond.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAuxCond.Open;

  Cond := IBQAuxCond.fieldByName('valor').AsString;

  IBQAuxCond.Close;
  IBQAuxCond.SQL.Clear;
  if (Cond = '5') then
    valor := 'valor_escala_5'
  else
    valor := 'valor_escala_10';

  IBQAuxCond.SQL.Add('select '+valor+' from cod_condiciones_corporales where id_condicion_corporal=:id');
  IBQAuxCond.ParamByName('id').AsInteger := IBQDatosInseminacion.fieldByName('condicion_corporal').AsInteger;
  IBQAuxCond.Open;

  QRDBTCondCorp.DataSet := IBQAuxCond;
  QRDBTCondCorp.DataField := valor;
end;

procedure TFREPServiciosPreview.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;
{  QRServicioAnimales.PrevInitialZoom:= qrZoomOther;
  QRServicioAnimales.PrevInitialZoom:= qrZoomToWidth;

  QRServicioEventosToros.PrevInitialZoom:= qrZoomOther;
  QRServicioEventosToros.PrevInitialZoom:= qrZoomToWidth;

  QRServicioEventosHembras.PrevInitialZoom:= qrZoomOther;
  QRServicioEventosHembras.PrevInitialZoom:= qrZoomToWidth;

  QRSummary.PrevInitialZoom:= qrZoomOther;
  QRSummary.PrevInitialZoom:= qrZoomToWidth;
 }


  QRCRServicios.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFREPServiciosPreview.IBQTorosCalcFields(DataSet: TDataSet);
var
  Nombre : String;
begin
  inherited;
  if DataSet.FieldByName('A').Value <> null then
    Nombre := DataSet.FieldValues['A']
  else if DataSet.FieldByName('N').Value <> null then
        Nombre := DataSet.FieldValues['N']
       else
        Nombre := DataSet.FieldValues['R'];
  IBQTorosNOMBRE.Value := Nombre;
end;

procedure TFREPServiciosPreview.cargarDatosPropietario;
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

  QRLDatosAbajo12.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo22.Caption:= QRLDatosAbajo2.Caption;

  QRLDatosAbajo13.Caption:= QRLDatosAbajo.Caption;
  QRLDatosAbajo23.Caption:= QRLDatosAbajo2.Caption;

  repGeneral.Destroy;
end;

end.

