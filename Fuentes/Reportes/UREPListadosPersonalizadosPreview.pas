unit UREPListadosPersonalizadosPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ImgList, PngImageList, IBQuery, WinXP, DataExport,
  DataToXLS, DB, IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, Printers,
  JvExControls, JvLabel, StdCtrls, ExtCtrls, JvGIF, jpeg, QRCtrls, QuickRpt,
  QRExport, QRPDFFilt, pngimage, JvExExtCtrls, JvImage, UBDBGrid;
const
{ Daiana - 01.12.2014 - Incidencia 402 - Inicio
  Se agrega Informado a AFIP, incrementa la cantidad de variables }
  _CANT_VARS = 72;
{ Daiana - 01.12.2014 - Incidencia 402 - Fin }

type
  TVariables = record
    Seleccionado : Boolean;
    Componete : TCheckBox;
    Variable : String;
    NomCol : String;
    Columna : Integer;
    Orden : Integer;
  end;

  TArrVars = Array [1.._CANT_VARS] of TVariables;

type
  TFREPListadosPersonalizadosPreview = class(TFUniversal)
    QRPlanilla: TQuickRep;
    QRBand4: TQRBand;
    QRSSumaryPlanilla: TQRShape;
    QRLabel4: TQRLabel;
    QRSDPagePlanilla: TQRSysData;
    QRLPagPlanilla: TQRLabel;
    QRBDatos: TQRBand;
    QRMObservacion: TQRMemo;
    QRSTitlePlanilla3: TQRShape;
    QRSTitlePlanilla2: TQRShape;
    QRLabel5: TQRLabel;
    CantRPS1: TQRLabel;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage3: TQRImage;
    QRLTituloPlanilla: TQRLabel;
    QRLEstablecimientos1: TQRLabel;
    QRLRenglon11: TQRLabel;
    Separador4: TQRShape;
    QRSysData3: TQRSysData;
    Separador3: TQRShape;
    QRLRenglon21: TQRLabel;
    QRBEncabezados: TQRBand;
    QRBDetailPlanilla: TQRBand;
    IBQAnchosColumnas: TIBQuery;
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    anchoImpresionFuente: integer;
    BDBGDetalle: TBitDBGrid;

    procedure ConfigurarPlanilla();
  public
    procedure setBDBGDetalle(BDBGDetalle: TBitDBGrid);

    procedure CargarColumnasEncabezado(anchoSeleccionado, anchoActual: real);
    procedure CargarColumnasDetail(anchoSeleccionado, anchoActual: real);
    procedure ConfigurarApaisada();
    function getAnchoColumna(Nombre : String):integer;
    function getAnchoColumnaEstatico(Nombre : String):integer;
    function getAnchoColumnaDinamico(Nombre : String):integer;
    function SumaAnchosColumnas: integer;
    function getNombreColumna(nombreColumna: String): string;
  end;

var
  FREPListadosPersonalizadosPreview: TFREPListadosPersonalizadosPreview;
  Variables : TArrVars;

implementation

uses UPlanillasManga, UPrincipal, URepGeneral, UTraduccion, UREPListadosPersonalizados,UTiposGlobales;

{$R *.dfm}

 
// configuro la planilla cuando tengo muchas columnas
procedure TFREPListadosPersonalizadosPreview.ConfigurarApaisada();
begin
  QRPlanilla.Page.Orientation := poLandScape;

  QRLEstablecimientos1.Left := QRBEncabezadoPlanilla.Width - QRLEstablecimientos1.Width - 5;
  QRLRenglon11.Left := QRBEncabezadoPlanilla.Width - QRLRenglon11.Width - 5;
  QRLRenglon21.Left := QRBEncabezadoPlanilla.Width - QRLRenglon21.Width - 5;
  QRSysData3.Left := QRBEncabezadoPlanilla.Width - QRSysData3.Width - 5;
  QRSDPagePlanilla.Left := QRBEncabezadoPlanilla.Width - QRSDPagePlanilla.Width - 5;
  QRLPagPlanilla.Left := QRBEncabezadoPlanilla.Width - QRSDPagePlanilla.Width - QRLPagPlanilla.Width - 10;

  QRBEncabezados.Width := QRBEncabezadoPlanilla.Width;
  QRBDetailPlanilla.Width := QRBEncabezadoPlanilla.Width;
  QRSSumaryPlanilla.Width := QRBEncabezadoPlanilla.Width;
  QRSTitlePlanilla2.Width := QRBEncabezadoPlanilla.Width;
  QRSTitlePlanilla3.Width := QRBEncabezadoPlanilla.Width;
  Separador3.Width := QRBEncabezadoPlanilla.Width;
  Separador4.Left := QRBEncabezadoPlanilla.Width - Separador4.Width;
end;

procedure TFREPListadosPersonalizadosPreview.setBDBGDetalle(BDBGDetalle: TBitDBGrid);
begin
  Self.anchoImpresionFuente := 8;
  Self.BDBGDetalle := BDBGDetalle;
end;


function TFREPListadosPersonalizadosPreview.getNombreColumna(nombreColumna: String): string;
var
  i: integer;
  enc: boolean;
  nombreEncontrado: string;
begin

  nombreEncontrado := '';
  i := 1;
  enc := false;

  while (i < _CANT_VARS) and (not enc) do
  begin
    if (Variables[i].Variable = nombreColumna) then
    begin
         nombreEncontrado := Variables[i].NomCol;
         enc := true;
    end;
    Inc(i);
  end;
  Result := nombreEncontrado;
end;

procedure TFREPListadosPersonalizadosPreview.CargarColumnasEncabezado(anchoSeleccionado, anchoActual: real);
var
  I, WC, LeftPos: integer;
  mostrados: integer;
  lineaQr: TQRShape;

  nombreCampo, nombreCampoMostrar: String;

begin
  mostrados := 0;
  LeftPos := 0;

  for I := 0 to BDBGDetalle.Columns.Count-1 do
    if BDBGDetalle.Columns[I].Visible then
    begin
      nombreCampo := BDBGDetalle.Columns[I].FieldName;
      nombreCampoMostrar := getNombreColumna(nombreCampo);

      WC := getAnchoColumna(nombreCampo);
      with (TQRLabel(QRBEncabezados.AddPrintable(TQRLabel))) do
      begin
        Left := LeftPos;
        Width := WC;
        Height := QRBEncabezadoPlanilla.Height * 2;
        Top := 2;
        AutoSize := false;
        AutoStretch := false;
        WordWrap := true;
        Caption := ' '+nombreCampoMostrar;
        Transparent := true;
        Font.Style := [fsBold];
        Font.Size      := 8;

        // Muestra la linea de columna en el detalle
        if (mostrados > 0) then
        begin
          lineaQr := TQRShape(QRBEncabezados.AddPrintable(TQRShape));
          lineaQr.Shape := qrsVertLine;
          lineaQr.Top := 0;
          lineaQr.Width := 2;
          lineaQr.Left := LeftPos-2;
          lineaQr.Pen.Color := clBlack;
          lineaQr.Height := QRBEncabezados.Height;
       end;
       Inc(mostrados);

      end;

      LeftPos := LeftPos + WC;
    end;
end;

procedure TFREPListadosPersonalizadosPreview.CargarColumnasDetail(anchoSeleccionado, anchoActual: real);
var
  colName_0: String;
  nuevoQr: TQRDBText;
  lineaQr: TQRShape;
  detailLinea: TQRSysData;
  linea, leftPos, I, mostrados: integer;
  W, WC: integer;
begin

  mostrados := 0;
  linea := 0;
  leftPos := 0;
  for I := 0 to BDBGDetalle.Columns.Count-1 do
    if BDBGDetalle.Columns[I].Visible then
    begin
      WC := getAnchoColumna(BDBGDetalle.Columns[I].FieldName);
      nuevoQr := TQRDBText(QRBDetailPlanilla.AddPrintable(TQRDBText));
      colName_0 := BDBGDetalle.Columns[I].FieldName;

      nuevoQr.AutoSize  := false;
      nuevoQr.AutoStretch := false;
      nuevoQr.DataSet   := BDBGDetalle.DataSource.DataSet;
      nuevoQr.DataField := colName_0;
      nuevoQr.Font.Name := 'Courier New';
      nuevoQr.Font.Size := 8;
      nuevoQr.Left      := leftPos ;
      nuevoQr.Transparent := true;
      nuevoQr.Width     := WC;
      nuevoQr.WordWrap := true;
//      nuevoQr.Frame.DrawLeft := true;
//      nuevoQr.Frame.DrawRight := true;

      // Muestra la linea de columna en el detalle
      if (mostrados > 0) then
      begin
        lineaQr := TQRShape(QRBDetailPlanilla.AddPrintable(TQRShape));
        lineaQr.Shape := qrsVertLine;
        lineaQr.Top := 0;
        lineaQr.Width := 2;
        lineaQr.Left := leftPos-2;
        lineaQr.Pen.Color := clBlack;
        lineaQr.Pen.Width := 1;
        lineaQr.Height := QRBDetailPlanilla.Height;
     end;

      detailLinea := TQRSysData(QRBDetailPlanilla.AddPrintable(TQRSysData));
      detailLinea.Left := -17;
      detailLinea.Data := qrsDetailNo;
      detailLinea.Font.Size := 7;
      detailLinea.Alignment := taLeftJustify;

      Inc(mostrados);

      leftPos := leftPos + WC;
    end;
end;


procedure TFREPListadosPersonalizadosPreview.ConfigurarPlanilla();
begin

end;


procedure TFREPListadosPersonalizadosPreview.QRBEncabezadoPlanillaBeforePrint(
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

  repGeneral.Destroy;
end;

function TFREPListadosPersonalizadosPreview.getAnchoColumna(Nombre : String):integer;
var
  anchoEstatico, anchoDinamico: integer;
  mensaje: string;
begin
    anchoEstatico := getAnchoColumnaEstatico(Nombre);
    anchoDinamico := getAnchoColumnaDinamico(Nombre);

    if anchoDinamico > anchoEstatico then
    begin
      Result := anchoDinamico;
    end
    else
    begin
      Result := anchoEstatico;
    end;

end;

function TFREPListadosPersonalizadosPreview.getAnchoColumnaEstatico(Nombre : String):integer;
var
  i, ancho: integer;
  texto: String;

begin
  ancho := 0;
  for I := 1 to _CANT_VARS do
  begin
    if (Variables[I].Variable = Nombre) then
    begin
      texto := trim(Variables[I].NomCol);
      texto := PAnsiChar(texto);
      Canvas.Font := Self.Font;
      Canvas.Font.Size := 10;
      if ((texto = 'RP') or (texto = 'HBA') or (texto = 'SENASA')) then
        ancho := 80
      else if (texto = 'Ident. Electrónica') then
              ancho := 120
           else
              ancho := Canvas.TextWidth(texto);
      break;
    end;
  end;
  Result := ancho;// * anchoImpresionFuente;
end;

function TFREPListadosPersonalizadosPreview.getAnchoColumnaDinamico(Nombre : String):integer;
var
  pivote: string;
  maxAcumulado, maxActual: integer;
begin
    maxAcumulado := 0;
    maxActual := 0;

    BDBGDetalle.DataSource.DataSet.First;
    while not BDBGDetalle.DataSource.DataSet.Eof do
    begin

      pivote := BDBGDetalle.DataSource.DataSet.FieldByName(Nombre).AsString;
      pivote := PAnsiChar(Trim(pivote));

      Canvas.Font.Name := 'Courier New';
      Canvas.Font.Size := 8;

      maxActual := Canvas.TextWidth(pivote);

      if (maxActual > maxAcumulado) then
      begin
        maxAcumulado := maxActual;
      end;
      BDBGDetalle.DataSource.DataSet.Next;
    end;

    BDBGDetalle.DataSource.DataSet.First;
    Result := maxAcumulado +8;

end;


// Calcula la suma de todas las columnas visibles:
function TFREPListadosPersonalizadosPreview.SumaAnchosColumnas: integer;
var
  i, acum, ancho: integer;
begin
    ancho := 0;
    acum := 0;
    for I := 0 to BDBGDetalle.Columns.Count-1 do
    begin
      if BDBGDetalle.Columns[I].Visible then
      begin
        ancho := getAnchoColumna(BDBGDetalle.Columns[I].FieldName);
        acum := acum + ancho;
      end;
    end;

    SumaAnchosColumnas := acum;
end;



end.
