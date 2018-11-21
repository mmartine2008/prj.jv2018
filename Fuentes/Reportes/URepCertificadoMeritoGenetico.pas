unit URepCertificadoMeritoGenetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QRCtrls, QuickRpt, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls,
  StdCtrls, ExtCtrls, jpeg, QRExport, QRPDFFilt, QRPrntr, ImgList,
  PngImageList, JvExControls, JvLabel, JvGIF, UTraduccion, pngimage,
  JvExExtCtrls, JvImage;

type
  TFRepCertificadoMeritoGenetico = class(TFUniversal)
    QRCertificadoMeritoGenetico: TQuickRep;
    QRBEncabezado: TQRBand;
    QRLabel1: TQRLabel;
    QRBDatosAnimal: TQRBand;
    QRLNombre: TQRLabel;
    QRLCabania: TQRLabel;
    QRLApodo: TQRLabel;
    QRLCriador: TQRLabel;
    QRLCategoria: TQRLabel;
    QRLRp: TQRLabel;
    QRLHba: TQRLabel;
    QRLFechaNac: TQRLabel;
    QRLTipSanguinea: TQRLabel;
    QRShape1: TQRShape;
    QRLTituloGenea: TQRLabel;
    QRShape2: TQRShape;
    QRSDatosBisaPaterno: TQRShape;
    QRSDatosBisaMater: TQRShape;
    QRLBisabueloP: TQRLabel;
    QRLBisabueloRpP: TQRLabel;
    QRLBisabueloHbaP: TQRLabel;
    QRLBisabueloAnioNacp: TQRLabel;
    QRLBisabuelaP: TQRLabel;
    QRLRpBisabuelaP: TQRLabel;
    QRLBisabuelaHbaP: TQRLabel;
    QRLBisabuelaAnioNacP: TQRLabel;
    QRSDatosAbueloPat: TQRShape;
    QRLAbueloPat: TQRLabel;
    QRLAbueloPatRp: TQRLabel;
    QRLAbueloPatHba: TQRLabel;
    QRLAbueloPatAnioNac: TQRLabel;
    QRSDatosAbuelaPat: TQRShape;
    QRLPadre: TQRLabel;
    QRLRpPadre: TQRLabel;
    QRLApodoPadre: TQRLabel;
    QRLHbaPadre: TQRLabel;
    QRLAnioNacPadre: TQRLabel;
    QRLAbuelaPat: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLAbuelaPatRp: TQRLabel;
    QRLAbuelaPatHba: TQRLabel;
    QRLAbuelaPatAnioNac: TQRLabel;
    QRLBisabueloM: TQRLabel;
    QRLBisabueloRpM: TQRLabel;
    QRLBisabuelaPatHba: TQRLabel;
    QRLBisabueloAnioNacM: TQRLabel;
    QRLBisabuelaM: TQRLabel;
    QRLBisabuelaRpM: TQRLabel;
    QRLBisabuelaHbaM: TQRLabel;
    QRLBisabuelaAnioNacM: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLBisabueloPatM: TQRLabel;
    QRLBisabueloPatRpM: TQRLabel;
    QRLBisabueloPatHbaM: TQRLabel;
    QRLBisabueloPatAnioNacM: TQRLabel;
    QRLBisabuelaPatM: TQRLabel;
    QRLBisabuelaPatRpM: TQRLabel;
    QRLBisabuelaPatHbaM: TQRLabel;
    QRLBisabuelaPatAnioNacM: TQRLabel;
    QRLAbueloMat: TQRLabel;
    QRLAbueloMatRp: TQRLabel;
    QRLAbueloMatHba: TQRLabel;
    QRLAbueloMatAnioNac: TQRLabel;
    QRShape9: TQRShape;
    QRLMadre: TQRLabel;
    QRLRpMadre: TQRLabel;
    QRLApodoMadre: TQRLabel;
    QRLHbaMadre: TQRLabel;
    QRLAnioNacMadre: TQRLabel;
    QRLAbuelaPatM: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLRpAbuelaMatM: TQRLabel;
    QRLHbaAbuelaMatM: TQRLabel;
    QRLAnioNacAbuelaMatM: TQRLabel;
    QRLBisabuelaMatP: TQRLabel;
    QRLBisabuelaMatRpP: TQRLabel;
    QRLBisabuelaMatHbaP: TQRLabel;
    QRLBisabuelaMatAnioNacP: TQRLabel;
    QRLBisabuelaMatM: TQRLabel;
    QRLBisabuelaMatRpM: TQRLabel;
    QRLBisabuelaMatHbaM: TQRLabel;
    QRLBisabuelaMatAnioNacM: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape14: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel6: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape20: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape21: TQRShape;
    QRLabel5: TQRLabel;
    QRShape22: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel14: TQRLabel;
    QRShape26: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape32: TQRShape;
    QRLabel31: TQRLabel;
    QRShape34: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape35: TQRShape;
    QRLabel35: TQRLabel;
    QRShape36: TQRShape;
    QRLabel36: TQRLabel;
    QRShape37: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape38: TQRShape;
    QRLabel39: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
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
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLNombreValue: TQRLabel;
    QRLCabaniaValue: TQRLabel;
    QRLCriadorValue: TQRLabel;
    QRLApodoValue: TQRLabel;
    QRLCategoriaValue: TQRLabel;
    QRLRpValue: TQRLabel;
    QRLHbaValue: TQRLabel;
    QRLAnioNacValue: TQRLabel;
    QRLTipSangValue: TQRLabel;
    QRLMPPValue: TQRLabel;
    QRLRpMPPValue: TQRLabel;
    QRLHbaMPPValue: TQRLabel;
    QRLAnioNacMPPValue: TQRLabel;
    QRLPPValue: TQRLabel;
    QRLRpMPValue: TQRLabel;
    QRLHbaMPValue: TQRLabel;
    QRLAnioNacMPValue: TQRLabel;
    QRLMPMValue: TQRLabel;
    QRLRpMPMValue: TQRLabel;
    QRLHbaMPMValue: TQRLabel;
    QRLAnioNacMPMValue: TQRLabel;
    QRLPadreValue: TQRLabel;
    QRLRpPadreValue: TQRLabel;
    QRLApodoPadreValue: TQRLabel;
    QRLHbaPadreValue: TQRLabel;
    QRLAnioNacPadreValue: TQRLabel;
    QRLMMPValue: TQRLabel;
    QRLRpMMPValue: TQRLabel;
    QRLHbaMMPValue: TQRLabel;
    QRLAnioNacMMPValue: TQRLabel;
    QRLPMValue: TQRLabel;
    QRLRpPMValue: TQRLabel;
    QRLHbaPMValue: TQRLabel;
    QRLAnioNacPMValue: TQRLabel;
    QRLMMMValue: TQRLabel;
    QRLRpMMMValue: TQRLabel;
    QRLHbaMMMValue: TQRLabel;
    QRLAnioNacMMMValue: TQRLabel;
    QRLPPPValue: TQRLabel;
    QRLRpPPPValue: TQRLabel;
    QRLHbaPPPValue: TQRLabel;
    QRLAnioNacPPPValue: TQRLabel;
    QRLMPValue: TQRLabel;
    QRLRpPPValue: TQRLabel;
    QRLHbaPPValue: TQRLabel;
    QRLAnioNacPPValue: TQRLabel;
    QRLMadreValue: TQRLabel;
    QRLRpMadreValue: TQRLabel;
    QRLPPMValue: TQRLabel;
    QRLRpPPMValue: TQRLabel;
    QRLHbaPPMValue: TQRLabel;
    QRLAnioNacPPMValue: TQRLabel;
    QRLApodoMadreValue: TQRLabel;
    QRLHbaMadreValue: TQRLabel;
    QRLAnioNacMadreValue: TQRLabel;
    QRLMMValue: TQRLabel;
    QRLPMPValue: TQRLabel;
    QRLRpMMValue: TQRLabel;
    QRLPMMValue: TQRLabel;
    QRLRpPMPValue: TQRLabel;
    QRLHbaMMValue: TQRLabel;
    QRLRpPMMValue: TQRLabel;
    QRLAnioNacMMValue: TQRLabel;
    QRLHbaPMPValue: TQRLabel;
    QRLHbaPMMValue: TQRLabel;
    QRLAnioNacPMPValue: TQRLabel;
    QRLAnioNacPMMValue: TQRLabel;
    QRLDep1: TQRLabel;
    QRLPrec1: TQRLabel;
    QRLDep2: TQRLabel;
    QRLPrec2: TQRLabel;
    QRLDep3: TQRLabel;
    QRLPrec3: TQRLabel;
    QRLDep4: TQRLabel;
    QRLPrec4: TQRLabel;
    QRLDep5: TQRLabel;
    QRLPrec5: TQRLabel;
    QRLDep6: TQRLabel;
    QRLPrec6: TQRLabel;
    QRLDep7: TQRLabel;
    QRLPrec7: TQRLabel;
    QRLDep8: TQRLabel;
    QRLPrec8: TQRLabel;
    QRLDep9: TQRLabel;
    QRLPrec9: TQRLabel;
    QRLDep10: TQRLabel;
    QRLPrec10: TQRLabel;
    QRLDep11: TQRLabel;
    QRLPrec11: TQRLabel;
    QRLDep12: TQRLabel;
    QRLPrec12: TQRLabel;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    IBQAux: TIBQuery;
    IBQArbolGenea: TIBQuery;
    IBQArbolGeneaID_ANIMAL: TIntegerField;
    IBQArbolGeneaNOMBRE: TIBStringField;
    IBQArbolGeneaAPODO: TIBStringField;
    IBQArbolGeneaRAZA: TIntegerField;
    IBQArbolGeneaEXTERNO: TIBStringField;
    IBQArbolGeneaMADRE: TIBStringField;
    IBQArbolGeneaID_RP: TIBStringField;
    IBQArbolGeneaID_SENASA: TIBStringField;
    IBQArbolGeneaID_PC: TIBStringField;
    IBQArbolGeneaID_HBA: TIBStringField;
    IBQArbolGeneaID_RA: TIBStringField;
    IBQArbolGeneaID_OTRO: TIBStringField;
    IBQArbolGeneaPADRES_DE: TIntegerField;
    IBQArbolGeneaNIVEL_ARBOL: TIntegerField;
    IBQArbolGeneaRELACION: TIBStringField;
    IBQGetDatos: TIBQuery;
    QRLGestValue: TQRLabel;
    QRLNacerValue: TQRLabel;
    QRLPesoDestValue: TQRLabel;
    QRLGCIADestValue: TQRLabel;
    QRLPesoFinalValue: TQRLabel;
    QRLGCIAFinalValue: TQRLabel;
    QRLCEValue: TQRLabel;
    QRLAlturaAltValue: TQRLabel;
    QRLAlturaFrameValue: TQRLabel;
    QRLAOBValue: TQRLabel;
    QRLGDValue: TQRLabel;
    QRLGIValue: TQRLabel;
    QRLCMValue: TQRLabel;
    QRLColorValue: TQRLabel;
    QRLTSValue: TQRLabel;
    QRLTipoPartoValue: TQRLabel;
    IBQDatosAnimal: TIBQuery;
    QRShape63: TQRShape;
    QRLabel23: TQRLabel;
    QRLGCValue: TQRLabel;
    IBQGetPesada: TIBQuery;
    IBQDatosFrame: TIBQuery;
    IBQCalidadCarne: TIBQuery;
    IBQDatosEstablecimiento: TIBQuery;
    IBQDatosCriador: TIBQuery;
    IBQTipoParto: TIBQuery;
    IBQGetTipoServicio: TIBQuery;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    IBQDEPS: TIBQuery;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure armarArbol(animal : integer);
    procedure retornarAlternativo(id : integer; externo : boolean; var identif: string; var value:string);
  public
    { Public declarations }
    animal_cte: integer;
    anio_cte: integer;
    procedure prepararReportes(id_animal : integer; establecimiento : integer);
    procedure prepararDeps;
    procedure prepararDatosAnimal(animal : integer);
    procedure InicializarLabels;
  end;

var
  FRepCertificadoMeritoGenetico: TFRepCertificadoMeritoGenetico;

implementation

uses UPrincipal,uTiposGlobales, URepFichaAnimal;

{$R *.dfm}

procedure TFRepCertificadoMeritoGenetico.FormShow(Sender: TObject);
var
  H : HWND;
begin
  inherited;

  QRCertificadoMeritoGenetico.PrevInitialZoom:= qrZoomOther;
  QRCertificadoMeritoGenetico.PrevInitialZoom:= qrZoomToWidth;
  QRCertificadoMeritoGenetico.Preview;
  H := FindWindow(nil,'Print Preview');
  if H <> 0 then
    PostMessage(H,WM_CLOSE,0,0);
  PostMessage(Handle,WM_CLOSE,0,0);
end;

procedure TFRepCertificadoMeritoGenetico.prepararReportes(id_animal: integer; establecimiento : integer);
var alter:string;
    valor:string;
begin

   IBQDatosEstablecimiento.Close;
   IBQDatosEstablecimiento.ParamByName('esta').AsInteger := establecimiento;
   IBQDatosEstablecimiento.Open;

   if (IBQDatosEstablecimiento.FieldValues['nombre'] <> null) then
     QRLCabaniaValue.Caption := IBQDatosEstablecimiento.FieldValues['nombre'];

   IBQDatosCriador.Close;
   IBQDatosCriador.ParamByName('esta').AsInteger := establecimiento;
   IBQDatosCriador.ParamByName('animal').AsInteger := id_animal;
   IBQDatosCriador.Open;

   if (IBQDatosCriador.FieldValues['nombre'] <> null) then
      QRLCriadorValue.Caption := IBQDatosCriador.FieldValues['nombre'];


  //************** PARA EL ARBOL GENEALOGICO *************

  IBQAux.Active := false;
  IBQAux.sql.Clear;
  IBQAux.sql.Add('select A.*, CS.tipo from tab_animales A join cod_sexos CS on A.sexo = CS.id_Sexo where id_animal = :n');
  IBQAux.ParamByName('n').AsInteger := id_animal;
  IBQAux.Active := true;

  if IBQAux.FieldByName('sexo').AsInteger = 1 then
  begin
    QRLMadreValue.Caption := Traducir('Madre');
  end
  else
  begin
    QRLPadreValue.Caption := Traducir('Padre');
  end;

  armarArbol(id_animal);

end;


procedure TFRepCertificadoMeritoGenetico.armarArbol(animal : integer);
var alter : string;
    valor : string;
    externo : boolean;
    fecha : TDate;
    aNo, Mes, Dia : Word;
begin
  IBQArbolGenea.Active := false;
  IBQArbolGenea.ParamByName('n').AsInteger := animal;
  IBQArbolGenea.ParamByName('EXT').AsString := 'N';
  IBQArbolGenea.Active := true;

  IBQArbolGenea.First;
  while not IBQArbolGenea.Eof do
  begin
    externo := IBQArbolGenea.FieldByName('externo').AsString = 'S';

    if IBQArbolGenea.FieldByName('relacion').AsString = 'P' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLPadreValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpPadreValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (IBQArbolGenea.fieldByName('apodo').Value <> null) then
        QRLApodoPadreValue.Caption := IBQArbolGenea.fieldByName('apodo').AsString
      else
        QRLApodoPadreValue.Caption := '';

      if (alter = 'HBA') then
        QRLHbaPadreValue.Caption := valor
      else
        QRLHbaPadreValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacPadreValue.Caption := IntToStr(aNo);
      end
      else
        QRLAnioNacMadreValue.Caption := '';
    end;

    if IBQArbolGenea.FieldByName('relacion').AsString = 'M' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLMadreValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpMadreValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (IBQArbolGenea.fieldByName('apodo').Value <> null) then
        QRLApodoMadreValue.Caption := IBQArbolGenea.fieldByName('apodo').AsString
      else
        QRLApodoMadreValue.Caption := '';

      if (alter = 'HBA') then
        QRLHbaMadreValue.Caption := valor
      else
        QRLHbaMadreValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        //DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacMadreValue.Caption := DateToStr(fecha);
      end
      else
        QRLAnioNacMadreValue.Caption := '';
    end;


    if IBQArbolGenea.FieldByName('relacion').AsString = 'PP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLPPValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpPPValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaPPValue.Caption := valor
      else
        QRLHbaPPValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacPPValue.Caption := IntToStr(aNo);
      end
      else
        QRLAnioNacPPValue.Caption := '';
    end;


    if IBQArbolGenea.FieldByName('relacion').AsString = 'PM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLPMValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpPMValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaPMValue.Caption := valor
      else
        QRLHbaPMValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        //DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacPMValue.Caption := DateToStr(fecha);
      end
      else
        QRLAnioNacPMValue.Caption := '';
    end;


    if IBQArbolGenea.FieldByName('relacion').AsString = 'MP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLMPValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpMPValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaMPValue.Caption := valor
      else
        QRLHbaMPValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacMPValue.Caption := IntToStr(aNo);
      end
      else
        QRLAnioNacMPValue.Caption := '';
    end;


    if IBQArbolGenea.FieldByName('relacion').AsString = 'MM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLMMValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpMMValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaMMValue.Caption := valor
      else
        QRLHbaMMValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        //DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacMMValue.Caption := DateToStr(fecha);
      end
      else
        QRLAnioNacMMValue.Caption := '';
    end;


    if IBQArbolGenea.FieldByName('relacion').AsString = 'PPP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLPPPValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpPPPValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaPPPValue.Caption := valor
      else
        QRLHbaPPPValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacPPPValue.Caption := IntToStr(aNo);
      end
      else
        QRLAnioNacPPPValue.Caption := '';
    end;


    if IBQArbolGenea.FieldByName('relacion').AsString = 'PPM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLPPMValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpPPMValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaPPMValue.Caption := valor
      else
        QRLHbaPPMValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        //DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacPPMValue.Caption := DateToStr(fecha);
      end
      else
        QRLAnioNacPPMValue.Caption := '';
    end;


    if IBQArbolGenea.FieldByName('relacion').AsString = 'PMP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLPMPValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpPMPValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaPMPValue.Caption := valor
      else
        QRLHbaPMPValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacPMPValue.Caption := IntToStr(aNo);
      end
      else
        QRLAnioNacMMValue.Caption := '';
    end;

    
    if IBQArbolGenea.FieldByName('relacion').AsString = 'PMM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLPMMValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpPMMValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaPMMValue.Caption := valor
      else
        QRLHbaPMMValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        //DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacPMMValue.Caption := DateToStr(fecha);
      end
      else
        QRLAnioNacPMMValue.Caption := '';
    end;


    if IBQArbolGenea.FieldByName('relacion').AsString = 'MPP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLMPPValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpMPPValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaMPPValue.Caption := valor
      else
        QRLHbaMPPValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacMPPValue.Caption := IntToStr(aNo);
      end
      else
        QRLAnioNacMPPValue.Caption := '';
    end;

    
    if IBQArbolGenea.FieldByName('relacion').AsString = 'MPM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLMPMValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpMPMValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaMPMValue.Caption := valor
      else
        QRLHbaMPMValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        //DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacMPMValue.Caption := DateToStr(fecha);
      end
      else
        QRLAnioNacMPMValue.Caption := '';
    end;


    if IBQArbolGenea.FieldByName('relacion').AsString = 'MMP' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLMMPValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpMMPValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaMMPValue.Caption := valor
      else
        QRLHbaMMPValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacMMPValue.Caption := IntToStr(aNo);
      end
      else
        QRLAnioNacMMPValue.Caption := '';
    end;


    if IBQArbolGenea.FieldByName('relacion').AsString = 'MMM' then
    begin
      retornarAlternativo(IBQArbolGenea.FieldByName('id_animal').AsInteger,externo, alter, valor);
      QRLMMMValue.Caption := IBQArbolGenea.fieldByName('nombre').AsString;
      QRLRpMMMValue.Caption := IBQArbolGenea.fieldByName('id_rp').AsString;

      if (alter = 'HBA') then
        QRLHbaMMMValue.Caption := valor
      else
        QRLHbaMMMValue.Caption := '';

      if (externo) then
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales_externos where id_animal_externo = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end
      else
      begin
           IBQGetDatos.Close;
           IBQGetDatos.SQL.Clear;
           IBQGetDatos.SQL.Add('select * from tab_animales where id_animal = :animal and establecimiento = :esta');
           IBQGetDatos.ParamByName('animal').AsInteger := IBQArbolGenea.FieldByName('id_animal').AsInteger;
           IBQGetDatos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
           IBQGetDatos.Open;
      end;

      if (IBQGetDatos.FieldValues['fecha_nacimiento'] <> null) then
      begin
        fecha := IBQGetDatos.FieldValues['fecha_nacimiento'];
        //DecodeDate(fecha, aNo, Mes, Dia);
        QRLAnioNacMMMValue.Caption := DateToStr(fecha);
      end
      else
        QRLAnioNacMMMValue.Caption := '';
    end;


    //////////////
    IBQArbolGenea.Next;
  end;

end;


procedure TFRepCertificadoMeritoGenetico.retornarAlternativo(id: integer; externo: boolean; var identif, value: string);
var rz : Integer;
begin
  IBQAux.Close;
  IBQAux.sql.Clear;
  if (externo) then
    IBQAux.sql.add('select * from tab_animales_externos where (id_animal_externo = :n)')
  else
    IBQAux.sql.add('select * from tab_animales where (id_animal = :n)');
  IBQAux.ParamByName('n').AsInteger := id;
  IBQAux.Open;

  if IBQAux.FieldValues['raza'] <> null then
    rz := IBQAux.FieldValues['raza']
  else
    rz := 0;

  if ((IBQAux.fieldbyname('id_hba').AsString <> '') and (IBQAux.fieldbyname('id_hba').Value <> null))then
  begin
      identif := 'HBA';
      value := IBQAux.fieldbyname('id_hba').AsString;
  end
  else
  begin
      identif := '';
      value := '';
  end;
end;

procedure TFRepCertificadoMeritoGenetico.InicializarLabels;
begin

  QRLPadreValue.Caption := '';
  QRLRpPadreValue.Caption := '';
  QRLApodoPadreValue.Caption := '';
  QRLHbaPadreValue.Caption := '';
  QRLAnioNacPadreValue.Caption := '';

  QRLPPValue.Caption := '';
  QRLRpPPValue.Caption := '';
  QRLHbaPPValue.Caption := '';
  QRLAnioNacPPValue.Caption := '';

  QRLPPMValue.Caption := '';
  QRLRpPPMValue.Caption := '';
  QRLHbaPPMValue.Caption := '';
  QRLAnioNacPPMValue.Caption := '';

  QRLPPPValue.Caption := '';
  QRLRpPPPValue.Caption := '';
  QRLHbaPPPValue.Caption := '';
  QRLAnioNacPPPValue.Caption := '';

  QRLPMValue.Caption := '';
  QRLRpPMValue.Caption := '';
  QRLHbaPMValue.Caption := '';
  QRLAnioNacPMValue.Caption := '';

  QRLPMMValue.Caption := '';
  QRLRpPMMValue.Caption := '';
  QRLHbaPMMValue.Caption := '';
  QRLAnioNacPMMValue.Caption := '';

  QRLPMPValue.Caption := '';
  QRLRpPMPValue.Caption := '';
  QRLHbaPMPValue.Caption := '';
  QRLAnioNacPMPValue.Caption := '';

  QRLMadreValue.Caption := '';
  QRLApodoMadreValue.Caption := '';
  QRLRpMadreValue.Caption := '';
  QRLHbaMadreValue.Caption := '';
  QRLAnioNacMadreValue.Caption := '';

  QRLMMValue.Caption := '';
  QRLRpMMValue.Caption := '';
  QRLHbaMMValue.Caption := '';
  QRLAnioNacMMValue.Caption := '';

  QRLMMPValue.Caption := '';
  QRLRpMMPValue.Caption := '';
  QRLHbaMMPValue.Caption := '';
  QRLAnioNacMMPValue.Caption := '';

  QRLMMMValue.Caption := '';
  QRLRpMMMValue.Caption := '';
  QRLHbaMMMValue.Caption := '';
  QRLAnioNacMMMValue.Caption := '';

  QRLMPMValue.Caption := '';
  QRLRpMPMValue.Caption := '';
  QRLHbaMPMValue.Caption := '';
  QRLAnioNacMPMValue.Caption := '';

  QRLMPPValue.Caption := '';
  QRLRpMPPValue.Caption := '';
  QRLHbaMPPValue.Caption := '';
  QRLAnioNacMPPValue.Caption := '';

  QRLMPValue.Caption := '';
  QRLRpMPValue.Caption := '';
  QRLHbaMPValue.Caption := '';
  QRLAnioNacMPValue.Caption := '';

  QRLDep1.Caption := '';
  QRLDep2.Caption := '';
  QRLDep3.Caption := '';
  QRLDep4.Caption := '';
  QRLDep5.Caption := '';
  QRLDep6.Caption := '';
  QRLDep7.Caption := '';
  QRLDep8.Caption := '';
  QRLDep9.Caption := '';
  QRLDep10.Caption := '';
  QRLDep11.Caption := '';
  QRLDep12.Caption := '';

  QRLPrec1.Caption := '';
  QRLPrec2.Caption := '';
  QRLPrec3.Caption := '';
  QRLPrec4.Caption := '';
  QRLPrec5.Caption := '';
  QRLPrec6.Caption := '';
  QRLPrec7.Caption := '';
  QRLPrec8.Caption := '';
  QRLPrec9.Caption := '';
  QRLPrec10.Caption := '';
  QRLPrec11.Caption := '';
  QRLPrec12.Caption := '';

  QRLGestValue.Caption := '';
  QRLNacerValue.Caption := '';
  QRLPesoDestValue.Caption := '';
  QRLGCIADestValue.Caption := '';
  QRLPesoFinalValue.Caption := '';
  QRLGCIAFinalValue.Caption := '';
  QRLCEValue.Caption := '';
  QRLAlturaAltValue.Caption := '';
  QRLAlturaFrameValue.Caption := '';
  QRLAOBValue.Caption := '';
  QRLGDValue.Caption := '';
  QRLGCValue.Caption := '';
  QRLGIValue.Caption := '';
  QRLCMValue.Caption := '';
  QRLColorValue.Caption := '';
  QRLTSValue.Caption := '';
  QRLTipoPartoValue.Caption := '';
  
end;

procedure TFRepCertificadoMeritoGenetico.prepararDeps;
begin

// PRUEBA DE IVAN
          IBQDEPS.Close;
          IBQDEPS.SQL.Clear;
          IBQDEPS.SQL.Add('select * from tab_dep where anio = :anio and animal = :animal');
          IBQDEPS.ParamByName('animal').AsInteger := animal_cte;
          IBQDEPS.ParamByName('anio').AsInteger := anio_cte;
          IBQDEPS.Open;
// FIN PRUEBA

  if (IBQDEPS.FieldValues['GESTDEP'] <> null) then
    QRLDep1.Caption := IBQDEPS.FieldValues['GESTDEP']
  else
    QRLDep1.Caption := '';

  if (IBQDEPS.FieldValues['NACERDEP'] <> null) then
    QRLDep2.Caption := IBQDEPS.FieldValues['NACERDEP']
  else
    QRLDep2.Caption := '';

  if (IBQDEPS.FieldValues['DESTDEP'] <> null) then
    QRLDep3.Caption := IBQDEPS.FieldValues['DESTDEP']
  else
    QRLDep3.Caption := '';

  if (IBQDEPS.FieldValues['LECHEDEP'] <> null) then
    QRLDep4.Caption := IBQDEPS.FieldValues['LECHEDEP']
  else
    QRLDep4.Caption := '';

  if (IBQDEPS.FieldValues['FINALDEP'] <> null) then
    QRLDep5.Caption := IBQDEPS.FieldValues['FINALDEP']
  else
    QRLDep5.Caption := '';

  if (IBQDEPS.FieldValues['CEDEP'] <> null) then
    QRLDep6.Caption := IBQDEPS.FieldValues['CEDEP']
  else
    QRLDep6.Caption := '';

  if (IBQDEPS.FieldValues['ALTURADEP'] <> null) then
    QRLDep7.Caption := IBQDEPS.FieldValues['ALTURADEP']
  else
    QRLDep7.Caption := '';

  if (IBQDEPS.FieldValues['AOBDEP'] <> null) then
    QRLDep8.Caption := IBQDEPS.FieldValues['AOBDEP']
  else
    QRLDep8.Caption := '';

  if (IBQDEPS.FieldValues['EGDDEP'] <> null) then
    QRLDep9.Caption := IBQDEPS.FieldValues['EGDDEP']
  else
    QRLDep9.Caption := '';

  if (IBQDEPS.FieldValues['EGCDEP'] <> null) then
    QRLDep10.Caption := IBQDEPS.FieldValues['EGCDEP']
  else
    QRLDep10.Caption := '';

  if (IBQDEPS.FieldValues['PORGIDEP'] <> null) then
    QRLDep11.Caption := IBQDEPS.FieldValues['PORGIDEP']
  else
    QRLDep11.Caption := '';

  if (IBQDEPS.FieldValues['PORCMDEP'] <> null) then
    QRLDep12.Caption := IBQDEPS.FieldValues['PORCMDEP']
  else
    QRLDep12.Caption := '';

  if (IBQDEPS.FieldValues['GESTPREC'] <> null) then
    QRLPrec1.Caption := IBQDEPS.FieldValues['GESTPREC']
  else
    QRLPrec1.Caption := '';

  if (IBQDEPS.FieldValues['NACERPREC'] <> null) then
    QRLPrec2.Caption := IBQDEPS.FieldValues['NACERPREC']
  else
    QRLPrec2.Caption := '';

  if (IBQDEPS.FieldValues['DESTPREC'] <> null) then
    QRLPrec3.Caption := IBQDEPS.FieldValues['DESTPREC']
  else
    QRLPrec3.Caption := '';

  if (IBQDEPS.FieldValues['LECHEPREC'] <> null) then
    QRLPrec4.Caption := IBQDEPS.FieldValues['LECHEPREC']
  else
    QRLPrec4.Caption := '';

  if (IBQDEPS.FieldValues['FINALPREC'] <> null) then
    QRLPrec5.Caption := IBQDEPS.FieldValues['FINALPREC']
  else
    QRLPrec5.Caption := '';

  if (IBQDEPS.FieldValues['CEPREC'] <> null) then
    QRLPrec6.Caption := IBQDEPS.FieldValues['CEPREC']
  else
    QRLPrec6.Caption := '';

  if (IBQDEPS.FieldValues['ALTURAPREC'] <> null) then
    QRLPrec7.Caption := IBQDEPS.FieldValues['ALTURAPREC']
  else
    QRLPrec7.Caption := '';

  if (IBQDEPS.FieldValues['AOBPREC'] <> null) then
    QRLPrec8.Caption := IBQDEPS.FieldValues['AOBPREC']
  else
    QRLPrec8.Caption := '';

  if (IBQDEPS.FieldValues['EGDPREC'] <> null) then
    QRLPrec9.Caption := IBQDEPS.FieldValues['EGDPREC']
  else
    QRLPrec9.Caption := '';

  if (IBQDEPS.FieldValues['EGCPREC'] <> null) then
    QRLPrec10.Caption := IBQDEPS.FieldValues['EGCPREC']
  else
    QRLPrec10.Caption := '';

  if (IBQDEPS.FieldValues['PORGIPREC'] <> null) then
    QRLPrec11.Caption := IBQDEPS.FieldValues['PORGIPREC']
  else
    QRLPrec11.Caption := '';

  if (IBQDEPS.FieldValues['PORCMPREC'] <> null) then
    QRLPrec12.Caption := IBQDEPS.FieldValues['PORCMPREC']
  else
    QRLPrec12.Caption := '';

end;

procedure TFRepCertificadoMeritoGenetico.prepararDatosAnimal(animal : integer);
var pesoNacer, pesoDestete, pesoAdulto, pesoAux, res : double;
    fecPesoNac, fecPesoDest, fecPesoAdul, fecAux : TDate;
begin

   IBQDatosAnimal.Close;
   IBQDatosAnimal.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
   IBQDatosAnimal.ParamByName('animal').AsInteger := animal;
   IBQDatosAnimal.Open;

   if (IBQDatosAnimal.FieldValues['pesonacer'] <> null) then
   begin
      QRLNacerValue.Caption := IntToStr(IBQDatosAnimal.FieldValues['pesonacer']);
      pesoNacer := IBQDatosAnimal.FieldValues['pesonacer'];

      IBQGetPesada.Close;
      IBQGetPesada.ParamByName('animal').AsInteger := animal;
      IBQGetPesada.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQGetPesada.ParamByName('dias').AsString := 'N';
      IBQGetPesada.Open;

      if (IBQGetPesada.FieldValues['fecha'] <> null) then
        fecPesoNac := IBQGetPesada.FieldValues['fecha']
      else
        fecPesoNac := 0;
   end;

   if (IBQDatosAnimal.FieldValues['peso205'] <> null) then
   begin
      QRLPesoDestValue.Caption := IntToStr(IBQDatosAnimal.FieldValues['peso205']);
      pesoDestete := IBQDatosAnimal.FieldValues['peso205'];

      IBQGetPesada.Close;
      IBQGetPesada.ParamByName('animal').AsInteger := animal;
      IBQGetPesada.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQGetPesada.ParamByName('dias').AsString := 'D';
      IBQGetPesada.Open;

      if (IBQGetPesada.FieldValues['fecha'] <> null) then
        fecPesoDest := IBQGetPesada.FieldValues['fecha']
      else
        fecPesoDest := 0;
   end;

   if ((fecPesoDest <> 0) and (fecPesoNac <> 0)) then
   begin
       fecAux := fecPesoDest - fecPesoNac;
       pesoAux := pesoDestete - pesoNacer;
       if (fecAux > 0) then
       begin
           res := (pesoAux / fecAux);
           QRLGCIADestValue.Caption := FormatFloat('0.00', res);
       end;
   end;

   if (IBQDatosAnimal.FieldValues['peso550'] <> null) then
   begin
      QRLPesoFinalValue.Caption := IntToStr(IBQDatosAnimal.FieldValues['peso550']);
      pesoAdulto := IBQDatosAnimal.FieldValues['peso205'];

      IBQGetPesada.Close;
      IBQGetPesada.ParamByName('animal').AsInteger := animal;
      IBQGetPesada.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
      IBQGetPesada.ParamByName('dias').AsString := 'T';
      IBQGetPesada.Open;

      if (IBQGetPesada.FieldValues['fecha'] <> null) then
        fecPesoAdul := IBQGetPesada.FieldValues['fecha']
      else
        fecPesoAdul := 0;
   end;

   if ((fecPesoAdul <> 0) and (fecPesoDest <> 0)) then
   begin
       fecAux := fecPesoAdul - fecPesoDest;
       pesoAux := pesoAdulto - pesoDestete;
       if (fecAux > 0) then
       begin
            res := (pesoAux / fecAux);
            QRLGCIAFinalValue.Caption := FormatFloat('0.00', res);
       end;
   end;

   if (IBQDatosAnimal.FieldValues['circunferencia_escrotal'] <> null) then
     QRLCEValue.Caption := IBQDatosAnimal.FieldValues['circunferencia_escrotal'];

   IBQDatosFrame.Close;
   IBQDatosFrame.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
   IBQDatosFrame.ParamByName('animal').AsInteger := animal;
   IBQDatosFrame.Open;

   if (IBQDatosFrame.FieldValues['altura'] <> null) then
      QRLAlturaAltValue.Caption := IntToStr(IBQDatosFrame.FieldValues['altura']);

   if (IBQDatosFrame.FieldValues['valor'] <> null) then
      QRLAlturaFrameValue.Caption := IntToStr(IBQDatosFrame.FieldValues['valor']);


   IBQCalidadCarne.Close;
   IBQCalidadCarne.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
   IBQCalidadCarne.ParamByName('animal').AsInteger := animal;
   IBQCalidadCarne.Open;

   if (IBQCalidadCarne.FieldValues['aob'] <> null) then
      QRLAOBValue.Caption := IntToStr(IBQCalidadCarne.FieldValues['aob']);

   if (IBQCalidadCarne.FieldValues['eg'] <> null) then
      QRLGDValue.Caption := IBQCalidadCarne.FieldValues['eg'];

   if (IBQCalidadCarne.FieldValues['gi'] <> null) then
      QRLGIValue.Caption := IBQCalidadCarne.FieldValues['gi'];

   if (IBQCalidadCarne.FieldValues['gc'] <> null) then
      QRLGCValue.Caption := IBQCalidadCarne.FieldValues['gc'];

   if (IBQCalidadCarne.FieldValues['pcma'] <> null) then
      QRLCMValue.Caption := IBQCalidadCarne.FieldValues['pcma'];

   if (IBQDatosAnimal.FieldValues['color'] <> null) then
   begin
    if (IBQDatosAnimal.FieldValues['color'] = 1) then
      QRLColorValue.Caption := 'N';
    if (IBQDatosAnimal.FieldValues['color'] = 2) then
      QRLColorValue.Caption := 'C';
   end;

   IBQTipoParto.Close;
   IBQTipoParto.ParamByName('animal').AsInteger := animal;
   IBQTipoParto.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
   IBQTipoParto.Open;

   if (IBQTipoParto.FieldValues['sinonimo'] <> null) then
      QRLTipoPartoValue.Caption := IBQTipoParto.FieldValues['sinonimo'];

   IBQGetTipoServicio.Close;
   IBQGetTipoServicio.ParamByName('id_animal').AsInteger := animal;
   IBQGetTipoServicio.ParamByName('establecimiento').AsInteger := FPrincipal.EstablecimientoActual;
   IBQGetTipoServicio.Open;

   if (IBQGetTipoServicio.FieldValues['tipo_servicio'] <> null) then
    QRLTSValue.Caption := IBQGetTipoServicio.FieldValues['tipo_servicio'];

end;

end.
