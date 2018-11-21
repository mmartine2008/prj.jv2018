unit UPlanillasMangaPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QuickRpt, ActnList, ComCtrls, ExtCtrls, QRCtrls, DB,
  IBCustomDataSet, IBQuery, StdCtrls, printers, jpeg, IBStoredProc,
  DataExport, DataToXLS, WinXP, QRExport, QRPDFFilt, ImgList, PngImageList,
  JvExControls, JvLabel, JvGIF, pngimage, JvExExtCtrls, JvImage;

type
  TFPlanillasMangaPreview = class(TFUniversal)
    QRCodigos: TQuickRep;
    QRCRPlanillas: TQRCompositeReport;
    QRBSumary: TQRBand;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRBand1: TQRBand;
    QRLCodigosParaEvento: TQRLabel;
    QRBand2: TQRBand;
    QRDBTCodigo: TQRDBText;
    QRShape3: TQRShape;
    IBQCodigos: TIBQuery;
    QRDBTTituloSinonimo: TQRDBText;
    QRSDPageCodigos: TQRSysData;
    QRLPagCodigos: TQRLabel;
    QRPlanilla: TQuickRep;
    QRBand4: TQRBand;
    QRSSumaryPlanilla: TQRShape;
    QRLabel4: TQRLabel;
    QRSDPagePlanilla: TQRSysData;
    QRLPagPlanilla: TQRLabel;
    QRBDatos: TQRBand;
    QRLValores: TQRLabel;
    QRMObservacion: TQRMemo;
    QRSTitlePlanilla3: TQRShape;
    QRSTitlePlanilla2: TQRShape;
    QRSTitlePlanilla4: TQRShape;
    IBQHeaders: TIBQuery;
    IBQCodigosCODIGO: TIBStringField;
    IBQCodigosTITULO_SINONIMO: TIBStringField;
    IBQCodigosTITULO: TIBStringField;
    IBQCantidadColumnas: TIBQuery;
    IBQSumarPesos: TIBQuery;
    IBQDetalleAnimales: TIBQuery;
    IBQColumnas: TIBQuery;
    QRBDetailPlanilla: TQRBand;
    QRDBText1: TQRDBText;
    QRSDetailPlanilla: TQRShape;
    QRRPs: TQuickRep;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRBand7: TQRBand;
    QRDBText2: TQRDBText;
    IBQDetalleAnimales2: TIBQuery;
    QRBColumnHeaderPlanilla: TQRGroup;
    QRLRPAnimal: TQRLabel;
    QRSColumnHeaderPlanilla: TQRShape;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRBand6: TQRBand;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRBEncabezadoRps: TQRBand;
    QRImage4: TQRImage;
    QRLTitulosRPs: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRLRenglon1: TQRLabel;
    Separador2: TQRShape;
    QRSysData2: TQRSysData;
    Separador1: TQRShape;
    QRLRenglon2: TQRLabel;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage3: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRLRenglon11: TQRLabel;
    Separador4: TQRShape;
    QRSysData3: TQRSysData;
    Separador3: TQRShape;
    QRLRenglon21: TQRLabel;
    QRBEncabezadoCodigos: TQRBand;
    QRImage2: TQRImage;
    QRLTituloCodigos: TQRLabel;
    QRLEstablecimientos2: TQRLabel;
    QRLRenglon12: TQRLabel;
    Separador6: TQRShape;
    QRSysData4: TQRSysData;
    Separador5: TQRShape;
    QRLRenglon22: TQRLabel;
    QRLabel3: TQRLabel;
    CantRPS: TQRLabel;
    QRLabel5: TQRLabel;
    CantRPS1: TQRLabel;
    QRLabel6: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure preparar();
    procedure QRBEncabezadoRpsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBEncabezadoCodigosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLNroPagPrint(sender: TObject; var Value: String);
  private
    Fila : Integer;
    Fevento: integer;
    FRPVisibles : boolean;
    FCodigosVisibles: boolean;
    FReporteRPsVisible: boolean;
    procedure GenerarValoresComunes();
    procedure VerCantidadColumnas();
    procedure ConfigurarApaisada();
    procedure ConfigurarNormal();
    procedure setEvento(const Value: integer);
    procedure setRPVisibles(const Value: boolean);
    procedure setCodigosVisibles(const Value: boolean);
    procedure setReporteRPsVisible(const Value: boolean);
    { Private declarations }
  public
    CantAnimalesPlanilla : Integer;
    procedure ConfigurarPlanilla();
    { Public declarations }
  published
    property evento : integer read Fevento write setEvento;
    property RPVisibles : boolean read FRPVisibles write setRPVisibles;
    property CodigosVisibles : boolean read FCodigosVisibles write setCodigosVisibles;
    property ReporteRPsVisible : boolean read FReporteRPsVisible write setReporteRPsVisible;
  end;

var
  FPlanillasMangaPreview: TFPlanillasMangaPreview;

implementation

uses UPlanillasManga, UPrincipal, URepGeneral, UTraduccion,UTiposGlobales;

{$R *.dfm}

// configuro la planilla cuando tengo muchas columnas
procedure TFPlanillasMangaPreview.ConfigurarApaisada();
begin
  // pocisiono los componentes al margen izquierdo
  QRPlanilla.Page.Orientation := poLandScape;
  QRCodigos.Page.Orientation := poLandScape;
  QRRPs.Page.Orientation := poLandScape;

  QRLEstablecimientos1.Left := QRBEncabezadoPlanilla.Width - QRLEstablecimientos1.Width - 5;
  QRLRenglon11.Left := QRBEncabezadoPlanilla.Width - QRLRenglon11.Width - 5;
  QRLRenglon21.Left := QRBEncabezadoPlanilla.Width - QRLRenglon21.Width - 5;
  QRSysData3.Left := QRBEncabezadoPlanilla.Width - QRSysData3.Width - 5;
  QRSDPagePlanilla.Left := QRBEncabezadoPlanilla.Width - QRSDPagePlanilla.Width - 5;
  QRLPagPlanilla.Left := QRBEncabezadoPlanilla.Width - QRSDPagePlanilla.Width - QRLPagPlanilla.Width - 10;

  // defino el nuevo tamaño de los separadores
//  QRSEncabezadoPlanilla.Width := QRBEncabezadoPlanilla.Width;
  QRSSumaryPlanilla.Width := QRBEncabezadoPlanilla.Width;
//  QRSTitlePlanilla1.Width := QRBEncabezadoPlanilla.Width;
  QRSTitlePlanilla2.Width := QRBEncabezadoPlanilla.Width;
  QRSTitlePlanilla3.Width := QRBEncabezadoPlanilla.Width;
  QRSTitlePlanilla4.Width := QRBEncabezadoPlanilla.Width;
  QRSColumnHeaderPlanilla.Width := QRBEncabezadoPlanilla.Width;
  QRSDetailPlanilla.Width := QRBEncabezadoPlanilla.Width;

end;

// configuro la planilla cuando tengon pocas columnas
procedure TFPlanillasMangaPreview.ConfigurarNormal();
var AnchoUnidad : integer;
    NewPosX : integer;
    auxPrintable : TQRLabel;
begin
  // lleno el column Header Calculado previamente los width de cada uno
  IBQSumarPesos.Close;
  IBQSumarPesos.ParamByName('evento').AsInteger := evento;
  IBQSumarPesos.Open;

  AnchoUnidad := QRBColumnHeaderPlanilla.Width div (IBQSumarPesos.fieldbyname('cantidad').AsInteger + 1);

  QRLRPAnimal.Width := AnchoUnidad;
  QRDBText1.Width := AnchoUnidad;

  IBQColumnas.Close;
  IBQColumnas.ParamByName('evento').AsInteger := evento;
  IBQColumnas.Open;
  IBQColumnas.First;



  NewPosX := AnchoUnidad;

  while not(IBQColumnas.Eof) do
    begin
      auxPrintable := TQRLabel(QRBColumnHeaderPlanilla.AddPrintable(TQRLabel));
      with  ( auxPrintable ) do
        begin
          Left := NewPosX+1;
          Top := 0;
          Height := 17;
          autoSize := false;
          Caption := IBQColumnas.fieldByName('titulo').AsString;
          alignment := taLeftJustify;
          Color := $00EFEFEF;
        end;
      auxPrintable.Width := (IBQColumnas.fieldbyname('peso').AsInteger * AnchoUnidad);
      auxPrintable.Height := 17;

      with  (TQRShape (QRBDetailPlanilla.AddPrintable(TQRShape))) do
        begin
          Left := NewPosX-1;
          Top := -2;
          Height := 23;
          Width := 1;
          Pen.Color := clBlack;
          Pen.Width := 1;
        end;

      NewPosX := NewPosX + (IBQColumnas.fieldbyname('peso').AsInteger * AnchoUnidad);
      IBQColumnas.Next;
    end;
end;

// solo configuro el reporte de las planillas
procedure TFPlanillasMangaPreview.ConfigurarPlanilla();
begin
  Fila := 1;
  GenerarValoresComunes();
  VerCantidadColumnas();
  preparar();
  IBQDetalleAnimales.Close;
  IBQDetalleAnimales.SQL.Clear;
  //if Evento = 38 then
    IBQDetalleAnimales.SQL.Add('select * from aux_planillas');
  {else
    IBQDetalleAnimales.SQL.Add('select * from aux_planillas order by rp');}
  IBQDetalleAnimales.Open;
  IBQDetalleAnimales.Last;
  IBQDetalleAnimales.First;
  CantRPS1.Caption := IntToStr(IBQDetalleAnimales.RecordCount);
  //IBQDetalleAnimales.First;
  IBQDetalleAnimales2.Open;
  IBQDetalleAnimales2.Last;
  IBQDetalleAnimales2.First;
  CantRPS.Caption := IntToStr(IBQDetalleAnimales2.RecordCount);
  //IBQDetalleAnimales2.First;
end;

// aca busco los campos del evento que seab header
procedure TFPlanillasMangaPreview.GenerarValoresComunes();
var auxTop : integer;
begin
  IBQHeaders.Close;
  IBQHeaders.ParamByName('evento').AsInteger := evento;
  IBQHeaders.Open;
  IBQHeaders.First;
  auxTop := 128;
  while not(IBQHeaders.Eof) do
    begin
      with  (TQRLabel (QRBDatos.AddPrintable(TQRLabel))) do
        begin
          Left := 25;
          Top := auxTop;
          Height := 20;
          autoSize := true;
          Caption := IBQHeaders.fieldByName('titulo').AsString+': ';
          alignment := taLeftJustify;
        end;
      IBQHeaders.Next;
      if not(IBQHeaders.Eof) then
        begin
          QRBDatos.Height := QRBDatos.Height + 20;
          QRSTitlePlanilla4.Top := QRSTitlePlanilla4.Top + 20;
        end;
      auxTop := auxTop + 20;
    end;
end;

procedure TFPlanillasMangaPreview.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if (IBQCodigos.FieldByName('titulo').AsString='S') then // es titulo de tabla
    begin
      Sender.Font.Size := 12;
      Sender.Font.Style := [fsBold];
      Sender.Color := $00EFEFEF;
      QRDBTCodigo.Color := $00EFEFEF;
      QRDBTTituloSinonimo.Color := $00EFEFEF;
      Sender.Height := 19;
    end
  else
    if (IBQCodigos.FieldByName('titulo').AsString='N') then  // es codigo de tabla
      begin
        Sender.Font.Size := 8;
        Sender.Font.Style := [];
        Sender.Color := clWhite;
        QRDBTCodigo.Color := clWhite;
        QRDBTTituloSinonimo.Color := clWhite;
        Sender.Height := 15;
      end
    else  // es linea separadora de dos tablas
      begin
        Sender.Font.Size := 8;
        Sender.Font.Style := [];
        Sender.Color := clWhite;
        QRDBTCodigo.Color := clWhite;
        QRDBTTituloSinonimo.Color := clWhite;
        Sender.Height := 10;
      end;
  QRDBTCodigo.Font := Sender.Font;
  QRDBTTituloSinonimo.Font := Sender.Font;
end;

// en este procedure establezco como va la pagina y la configuro
procedure TFPlanillasMangaPreview.setEvento(const Value: integer);
begin
  Fevento := Value;
end;

procedure TFPlanillasMangaPreview.setRPVisibles(const Value: boolean);
begin
  FRPVisibles := Value;
end;

procedure TFPlanillasMangaPreview.VerCantidadColumnas();
begin
  IBQCantidadColumnas.Close;
  IBQCantidadColumnas.ParamByName('evento').AsInteger := evento;
  IBQCantidadColumnas.Open;
  if ((IBQCantidadColumnas.FieldByName('cantidad').AsInteger > 4) and (evento <> 38))then
    begin // apaiso
      ConfigurarApaisada;
      ConfigurarNormal();
    end
  else
    ConfigurarNormal();
end;

procedure TFPlanillasMangaPreview.QRDBText1Print(sender: TObject;  var Value: String);
begin
  inherited;
  if (not(RPVisibles) and (evento<>38)) then
    Value := '';
end;

// me fijo que reporte debo mostrar
procedure TFPlanillasMangaPreview.setCodigosVisibles(const Value: boolean);
begin
  FCodigosVisibles := Value;
end;

procedure TFPlanillasMangaPreview.setReporteRPsVisible(
  const Value: boolean);
begin
  FReporteRPsVisible := Value;
end;

procedure TFPlanillasMangaPreview.preparar();
begin
  inherited;
  QRLEstablecimientos2.Left := QRBEncabezadoCodigos.Width - QRLEstablecimientos2.Width - 5;
  QRLRenglon12.Left  := QRBEncabezadoCodigos.Width - QRLRenglon12.Width - 5;
  QRLRenglon22.Left  := QRBEncabezadoCodigos.Width - QRLRenglon22.Width - 5;
  QRSysData4.Left := QRBEncabezadoCodigos.Width - QRSysData4.Width - 5;
  QRSDPageCodigos.Left := QRBEncabezadoCodigos.Width - QRSDPageCodigos.Width - 5;
  Separador6.Left := QRBEncabezadoCodigos.Width - Separador6.Width - 5;
  QRLPagCodigos.Left := QRBEncabezadoCodigos.Width - QRSDPageCodigos.Width - QRLPagCodigos.Width - 10;

  QRShape3.Width := QRBEncabezadoCodigos.Width;
  QRShape1.Width := QRBEncabezadoCodigos.Width;


  QRLEstablecimientos.Left := QRBEncabezadoRps.Width - QRLEstablecimientos.Width - 5;
  QRLRenglon1.Left := QRBEncabezadoRps.Width - QRLRenglon1.Width - 5;
  QRLRenglon2.Left := QRBEncabezadoRps.Width - QRLRenglon2.Width - 5;
  QRSysData2.Left := QRBEncabezadoRps.Width - QRSysData2.Width - 5;
  QRSDPageRPs.Left := QRBEncabezadoRps.Width - QRSDPageRPs.Width - 5;
  Separador2.Left := QRBEncabezadoRps.Width - Separador2.Width - 5;
  Separador4.Left := QRBEncabezadoPlanilla.Width - Separador4.Width - 5;
  QRLPagRPs.Left := QRBEncabezadoRps.Width - QRSDPageRPs.Width - QRLPagRPs.Width -10;


  Separador1.Width := QRBEncabezadoRps.Width;
  Separador3.Width := QRBEncabezadoPlanilla.Width;
  Separador5.Width := QRBEncabezadoCodigos.Width;
  QRShape5.Width := QRBEncabezadoRps.Width;
  QRShape4.Width := QRBEncabezadoRps.Width;
end;

procedure TFPlanillasMangaPreview.QRBEncabezadoRpsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  repGeneral : TFRepGeneral;
begin
  inherited;
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();

  QRImage4.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon2.Enabled := true;
      if (Trim(repGeneral.getNombrePropietario) <> '') then
         QRLRenglon1.Caption := repGeneral.getNombrePropietario
       else
         QRLRenglon1.Caption := FPrincipal.NombreVeterinario;

      QRLRenglon2.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon2.Enabled := true;
      if (Trim(repGeneral.getNombrePropietario) <> '') then
         QRLRenglon1.Caption := repGeneral.getNombrePropietario
       else
         QRLRenglon1.Caption := FPrincipal.NombrePropietario;

      QRLRenglon2.Caption := FPrincipal.Renspa;
    end;

  repGeneral.Destroy;
end;

procedure TFPlanillasMangaPreview.QRBEncabezadoPlanillaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  repGeneral : TFRepGeneral;
begin
  inherited;
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();

  QRImage3.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos1.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon21.Enabled := true;
      if (Trim(repGeneral.getNombrePropietario) <> '') then
         QRLRenglon11.Caption := repGeneral.getNombrePropietario
       else
         QRLRenglon11.Caption := FPrincipal.NombreVeterinario;

      QRLRenglon21.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon21.Enabled := true;
      if (Trim(repGeneral.getNombrePropietario) <> '') then
         QRLRenglon11.Caption := repGeneral.getNombrePropietario
       else
         QRLRenglon11.Caption := FPrincipal.NombrePropietario;
         
      QRLRenglon21.Caption := FPrincipal.Renspa;
    end;
  if evento=38 then
    QRLRPAnimal.Caption := Traducir('Nro. Tubo');
  if (evento=27) or (evento=39)  then
    QRLRPAnimal.Caption := Traducir('RP Animal / Cant.');
  if (evento = 24) then
    QRLRPAnimal.Caption := Traducir('Fecha');

  repGeneral.Destroy;
end;

procedure TFPlanillasMangaPreview.QRBEncabezadoCodigosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  repGeneral : TFRepGeneral;
begin
  inherited;
  repGeneral := TFRepGeneral.Create(self);
  repGeneral.retDatosPropietario();

  QRImage2.Picture.LoadFromFile(pathDirExe+'imagenes\logo_80x50.jpg');
  QRLEstablecimientos2.Caption := FPrincipal.NombreEstablecimiento;
  if (FPrincipal.TipoVersion = TVveterinario) then
    begin
      QRLRenglon22.Enabled := true;
      if (Trim(repGeneral.getNombrePropietario) <> '') then
         QRLRenglon12.Caption := repGeneral.getNombrePropietario
       else
         QRLRenglon12.Caption := FPrincipal.NombreVeterinario;
         
      QRLRenglon22.Caption := FPrincipal.Renspa;
    end
  else
    begin
      QRLRenglon22.Enabled := true;
      if (Trim(repGeneral.getNombrePropietario) <> '') then
         QRLRenglon12.Caption := repGeneral.getNombrePropietario
       else
         QRLRenglon12.Caption := FPrincipal.NombrePropietario;

      QRLRenglon22.Caption := FPrincipal.Renspa;
    end;

  repGeneral.Destroy;
end;

procedure TFPlanillasMangaPreview.QRLNroPagPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  if Fila >= (CantAnimalesPlanilla) then
    Fila := 1;
  Value := IntToStr(Fila);
  Inc(Fila);
end;

end.
