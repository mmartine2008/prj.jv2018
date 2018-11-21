unit UMapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, ComCtrls, JvExControls, JvLabel,
  StdCtrls, ExtCtrls, JvGIF, GISShape, GISImage, DynamicArrayUnit, DrawMarkUnit,
  SVOLegend, Buttons, SpeedButtonColor, Grids, SVODataGrid, DataFields,
  PngImage, JvExExtCtrls, JvExtComponent, JvCaptionPanel, jpeg, ImgList,
  PngImageList, ShapeFunctions, ProjectionsUnit, UTMUnit, GISReadWrite, UEveSimple,
  JvRollOut, JvImage, UEveNacimientos, UEveCambioUbicacion, UEveCastracion, UEveDeteccionCelo, UEveServicioNatural,
  UEveCondicionCorporal, UEveMedicionFrame, UEvePeso, UEveCalidadSeminal, UEveCapacidadServicio, UEveSuplementacion,
  UEveCircunferenciaEscrotal, UEveEgresoServicio, UEveEgresoToro, UEveIngresoServicio, UEveInseminacionArtificial, UEveIngresoToro,
  UEveServicioCorral, UEveAltaMasiva, UEveDiagnosticoGestacion, UEveDestete, UEveDiagnosticoEnfermedad,
  UEveTratamiento, UEveEnfermedadesMasivas, UEveIdentificacion, UEveEvaluacionPreservicio, UEveActividad,
  UEveBaja, UEveSincronizacionCelo, UEveFertilidadMacho, UEveRecursoForrajero, UEveCalidadCarne, UEveImportarPartosNacimientos,
  UEveCargaResultados, UEvePartoMasivo, UEveFlushing, UEveTransferenciaEmbrionaria;

type

  TPotrerosActivos = record
    id : integer;
    nombre : String;
    MedidasVisibles : Boolean;
    ProduccionVisible : Boolean;
    Visible : Boolean;
  end;

  TArrPotreros = Array of TPotrerosActivos;

  TCoordenada = record
    CoordNormalizada : TDoublePoint;
    Coord : TDoublePoint;
    Latitud : String;
    Longitud : String;
  end;

  TBoundingBox = record
    MinLat : Double;
    MaxLat : Double;
    MinLong : Double;
    MaxLong : Double;
  end;

  PMalla = ^TMalla;

  TTipoMalla = (ttmAgricola,ttmGanadero);

  TInfoMalla = record
    Nombre : String;
    UltimoEve : String;
    CabsHas : Double;
    Hs : String;
    Tipo : TTipoMalla;
    Teros, Teras, Novs, Vq, Vacas, Toros : String;
    Stroke : Cardinal;
    Fill : Cardinal;
    Area : Integer;
  end;

  TMalla = record
    Puntos : Array of TCoordenada;
    Vecinos : Array of PMalla;
    Info : TInfoMalla;
    Referencia : Boolean;
    _Ref_Pot : Integer;
  end;

  TMapa = record
    Mallas : Array of TMalla;
    BoundingBox : TBoundingBox;
  end;

  TFMapa = class(TFUniversal)
    IBQPuntos: TIBQuery;
    IBQPotrero: TIBQuery;
    PMapa: TPanel;
    PMenu: TPanel;
    SVOLeyenda: TSVOLegend;
    Mapa: TSVOGISImage;
    IZoomIn: TImage;
    IZoomOut: TImage;
    IDefault: TImage;
    ISelect: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    JvCPInfoPotrero: TJvCaptionPanel;
    GBDatos: TGroupBox;
    GBGeo: TGroupBox;
    SGCoordenadas: TStringGrid;
    IBQDatosPotrero: TIBQuery;
    ISalir: TImage;
    LSalir: TLabel;
    Image1: TImage;
    ILReferencias: TImageList;
    IPreview: TImage;
    LPreview: TLabel;
    PILCaja: TPngImageList;
    SVOGISReadWrite1: TSVOGISReadWrite;
    Label7: TLabel;
    LNombrePot: TLabel;
    LabelSup: TLabel;
    LHs: TLabel;
    LabelTeros: TLabel;
    CantTeros: TLabel;
    CantTeras: TLabel;
    LabelTeras: TLabel;
    LabelNovs: TLabel;
    CantNovs: TLabel;
    LabelToros: TLabel;
    CantToros: TLabel;
    CantVacas: TLabel;
    LabelVacas: TLabel;
    LabelVq: TLabel;
    CantVq: TLabel;
    PBottom: TPanel;
    IBottom: TImage;
    ISalirJVPan: TImage;
    LSalirJV: TLabel;
    PLReferencia: TPngImageList;
    IlRef: TPngImageList;
    JvROReferencias: TJvRollOut;
    PReferencias: TPanel;
    PTopRef: TPanel;
    LNombreEsta: TLabel;
    Label20: TLabel;
    SBReferencias: TScrollBox;
    IAppImagen: TJvImage;
    LabelUltimoEve: TLabel;
    LUltimoEve: TLabel;
    ALEventos: TActionList;
    AEveCastracion: TAction;
    AEveDestete: TAction;
    AEveFrame: TAction;
    AEveActividad: TAction;
    AEveSuplementacion: TAction;
    AEveIdentificacion: TAction;
    AEvePeso: TAction;
    AEveReidentifica: TAction;
    AEveExamenClinico: TAction;
    AEveCalidadSemen: TAction;
    AEveCircunferencia: TAction;
    AEveCondicionCorporal: TAction;
    AEveCalidadCarne: TAction;
    AEveImportarPartosNacimientos: TAction;
    AEvePartoMasivo: TAction;
    AEveNacimientos: TAction;
    AEveTratamiento: TAction;
    AEveDiagnosticoEnfermedad: TAction;
    AEveVenereas: TAction;
    AEveSangrado: TAction;
    AEveTuberculina: TAction;
    AEveCargaVenereas: TAction;
    AEveCargaBrucelosis: TAction;
    AEveCargaTuberculina: TAction;
    AEveServicioNatural: TAction;
    AEveIngresoHembra: TAction;
    AEveIngresoToro: TAction;
    AEveEgresoHembras: TAction;
    AEveEgresoToro: TAction;
    AEveInseminacionArtificial: TAction;
    AEveServicioCorral: TAction;
    AEveDeteccionCelo: TAction;
    AEveCapacidadServicio: TAction;
    AEveEvalPreservicio: TAction;
    AEveSincroCelo: TAction;
    AEveFlushing: TAction;
    AEveTransferencia: TAction;
    AEveAltaMasiva: TAction;
    AEveCambioUbicacion: TAction;
    AEveBaja: TAction;
    AEveDiagnosticoGestacion: TAction;
    PTransferencia: TPanel;
    JvImage37: TJvImage;
    JvImage38: TJvImage;
    JvLabel35: TJvLabel;
    JvLabel36: TJvLabel;
    Pservicios: TPanel;
    JvImage16: TJvImage;
    JvImage26: TJvImage;
    JvImage27: TJvImage;
    JvImage28: TJvImage;
    JvImage29: TJvImage;
    JvImage30: TJvImage;
    JvImage31: TJvImage;
    LServicioNatural: TJvLabel;
    JvLabel25: TJvLabel;
    JvLabel26: TJvLabel;
    JvLabel27: TJvLabel;
    JvLabel28: TJvLabel;
    JvLabel29: TJvLabel;
    JvLabel30: TJvLabel;
    PServicioNatural: TPanel;
    JvImage25: TJvImage;
    JvImage32: TJvImage;
    JvImage33: TJvImage;
    JvImage34: TJvImage;
    JvImage35: TJvImage;
    JvLabel23: TJvLabel;
    JvLabel24: TJvLabel;
    JvLabel32: TJvLabel;
    JvLabel33: TJvLabel;
    JvLabel34: TJvLabel;
    PSanitario: TPanel;
    JvImage14: TJvImage;
    JvImage15: TJvImage;
    JvLabel14: TJvLabel;
    JvImage18: TJvImage;
    JvImage19: TJvImage;
    JvImage20: TJvImage;
    JvImage21: TJvImage;
    JvImage22: TJvImage;
    JvImage23: TJvImage;
    JvLabel16: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel18: TJvLabel;
    JvLabel19: TJvLabel;
    JvLabel20: TJvLabel;
    JvLabel21: TJvLabel;
    JvLabel22: TJvLabel;
    PParto: TPanel;
    JvImage36: TJvImage;
    JvImage39: TJvImage;
    JvImage40: TJvImage;
    JvLabel39: TJvLabel;
    JvLabel40: TJvLabel;
    JvLabel41: TJvLabel;
    PMovimientos: TPanel;
    JvImage24: TJvImage;
    JvImage41: TJvImage;
    JvLabel31: TJvLabel;
    JvImage17: TJvImage;
    JvLabel37: TJvLabel;
    JvLabel38: TJvLabel;
    PGeneral: TPanel;
    JvImage13: TJvImage;
    JvImage12: TJvImage;
    JvImage11: TJvImage;
    JvImage6: TJvImage;
    JvLabel9: TJvLabel;
    JvImage7: TJvImage;
    JvImage8: TJvImage;
    JvImage9: TJvImage;
    JvImage10: TJvImage;
    JvImage4: TJvImage;
    JvImage5: TJvImage;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel13: TJvLabel;
    PCria: TPanel;
    JvImage3: TJvImage;
    JvImage2: TJvImage;
    JvImage1: TJvImage;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel42: TJvLabel;
    IAddEve: TImage;
    Label9: TLabel;
    LabelCateg: TLabel;
    PEventos: TPanel;
    SBEventos: TScrollBox;
    LGenerales: TJvLabel;
    LCria: TJvLabel;
    JvLabel15: TJvLabel;
    LPartos: TJvLabel;
    LSanitarios: TJvLabel;
    LServicios: TJvLabel;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image11: TImage;
    Image12: TImage;
    LTransferencia: TJvLabel;
    Image13: TImage;
    Lmovimientos: TJvLabel;
    Label6: TLabel;
    ISalirEves: TImage;
    LSalirEves: TLabel;
    JvLabel1: TJvLabel;
    procedure FormCreate(Sender: TObject);
    procedure MapaClick(Sender: TObject);
    procedure IZoomInClick(Sender: TObject);
    procedure IZoomOutClick(Sender: TObject);
    procedure IDefaultClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ICoordenadasClick(Sender: TObject);
    procedure ISelectClick(Sender: TObject);
    procedure Date(Sender: TObject;
      Button: TJvCapBtnStyle);
    procedure ISalirClick(Sender: TObject);
    procedure DibujarMarca(Sender: TObject; WhichCanvas: TCanvas; MarkSize: Integer; Loc: TPoint);
    procedure IPreviewClick(Sender: TObject);
    procedure ISiembraClick(Sender: TObject);
    procedure SVOLeyendaCheck(Sender: TObject; const Title: String;
      Data: TSVOGISObject; Checked: Boolean);
    procedure CheckClick(Sender: TObject);
    procedure CBMedidasClick(Sender: TObject);
    procedure CBRefClick(Sender: TObject);
    procedure ISalirJVPanClick(Sender: TObject);
    procedure JvROReferenciasExpand(Sender: TObject);
    procedure JvROReferenciasCollapse(Sender: TObject);
    procedure ISalirEvesClick(Sender: TObject);
    procedure LGeneralesClick(Sender: TObject);
    procedure LPartosClick(Sender: TObject);
    procedure LSanitariosClick(Sender: TObject);
    procedure LServiciosClick(Sender: TObject);
    procedure LTransferenciaClick(Sender: TObject);
    procedure LmovimientosClick(Sender: TObject);
    procedure JvCriaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvGeneralMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure JvDiagnosticoGestacionMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure JvServiciosMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvServicioNaturalMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvSanitarioMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvPartoMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvTransferenciaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure JvMovimientosMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AEveCastracionExecute(Sender: TObject);
    procedure AEveDesteteExecute(Sender: TObject);
    procedure AEveFrameExecute(Sender: TObject);
    procedure AEveActividadExecute(Sender: TObject);
    procedure AEveSuplementacionExecute(Sender: TObject);
    procedure AEveIdentificacionExecute(Sender: TObject);
    procedure AEvePesoExecute(Sender: TObject);
    procedure AEveReidentificaExecute(Sender: TObject);
    procedure AEveExamenClinicoExecute(Sender: TObject);
    procedure AEveCalidadSemenExecute(Sender: TObject);
    procedure AEveCircunferenciaExecute(Sender: TObject);
    procedure AEveCondicionCorporalExecute(Sender: TObject);
    procedure AEveCalidadCarneExecute(Sender: TObject);
    procedure AEveImportarPartosNacimientosExecute(Sender: TObject);
    procedure AEvePartoMasivoExecute(Sender: TObject);
    procedure AEveNacimientosExecute(Sender: TObject);
    procedure AEveTratamientoExecute(Sender: TObject);
    procedure AEveDiagnosticoEnfermedadExecute(Sender: TObject);
    procedure AEveVenereasExecute(Sender: TObject);
    procedure AEveSangradoExecute(Sender: TObject);
    procedure AEveTuberculinaExecute(Sender: TObject);
    procedure AEveCargaVenereasExecute(Sender: TObject);
    procedure AEveCargaBrucelosisExecute(Sender: TObject);
    procedure AEveCargaTuberculinaExecute(Sender: TObject);
    procedure AEveServicioNaturalExecute(Sender: TObject);
    procedure AEveIngresoHembraExecute(Sender: TObject);
    procedure AEveIngresoToroExecute(Sender: TObject);
    procedure AEveEgresoHembrasExecute(Sender: TObject);
    procedure AEveEgresoToroExecute(Sender: TObject);
    procedure AEveInseminacionArtificialExecute(Sender: TObject);
    procedure AEveServicioCorralExecute(Sender: TObject);
    procedure AEveDeteccionCeloExecute(Sender: TObject);
    procedure AEveCapacidadServicioExecute(Sender: TObject);
    procedure AEveEvalPreservicioExecute(Sender: TObject);
    procedure AEveSincroCeloExecute(Sender: TObject);
    procedure AEveFlushingExecute(Sender: TObject);
    procedure AEveTransferenciaExecute(Sender: TObject);
    procedure AEveAltaMasivaExecute(Sender: TObject);
    procedure AEveCambioUbicacionExecute(Sender: TObject);
    procedure AEveBajaExecute(Sender: TObject);
    procedure AEveDiagnosticoGestacionExecute(Sender: TObject);
    procedure LCriaClick(Sender: TObject);
    procedure IAddEveClick(Sender: TObject);
  private
    Map : TMapa;
    Vacio : Boolean;
    Potreros : TArrPotreros;
    SuperficieTotal : Integer;
    id_potrero_eve : Integer;
    _Ref_Pot : Integer;
    procedure ArmarEstructura;
    function ArmarBB : TBoundingBox;
    procedure TranspolarPuntos;
    function TranspolarPunto(Punto: TDoublePoint; BoundingBoxDest, BoundingBoxOrig : TBoundingBox) : TDoublePoint;
    procedure OrdenarMallas;
    procedure OrdenarPuntos(Malla : Integer);
    procedure BuscarMenorPunto(Malla : Integer; var P0 : TDoublePoint; var IndP0 :Integer);
    function ProductoVectorial(P1,P2,P3 : TDoublePoint) : Double;
    procedure DibujarMapa(Shape : String);
    procedure CargarDatosPotrero(AShapeIndex : Integer; AShapeList : TSVOShapeList);
    procedure AgregarLabels(Arr : TMapa; Shape : String);
    procedure AgregarReferencias;
    function BuscarPotrero(Nombre : String) : Integer;
    procedure GetInfoPot(var Info : TInfoMalla; Potrero : Integer);
    procedure InicPotrerosEvento;
    procedure AbrirEventos(Eve : TFEveSimple);
  public
    { Public declarations }
  end;

var
  FMapa: TFMapa;

implementation

{$R *.dfm}

uses
  UPrincipal, UCoordenadas, UDatosSiembra, UABMDatosSiembra, UREPMapaPreview,
  Math, StrUtils;

procedure TFMapa.OrdenarMallas;
var
  Mesh : Integer;
begin
  for Mesh := 0 to Length(Map.Mallas)-1 do
    OrdenarPuntos(Mesh);
end;

procedure TFMapa.BuscarMenorPunto(Malla : Integer; var P0 : TDoublePoint; var IndP0 :Integer);
var
  Point : Integer;
begin
  P0.x := 1000;
  P0.y := 1000;
  IndP0 := 0;
  for Point := 0 to Length(Map.Mallas[Malla].Puntos)-1 do
  begin
    if Map.Mallas[Malla].Puntos[Point].Coord.y < P0.y then
    begin
      P0 := Map.Mallas[Malla].Puntos[Point].Coord;
      IndP0 := Point;
    end;
    if Map.Mallas[Malla].Puntos[Point].Coord.y = P0.y then
      if P0.x > Map.Mallas[Malla].Puntos[Point].Coord.x then
      begin
        P0 := Map.Mallas[Malla].Puntos[Point].Coord;
        IndP0 := Point;
      end;
  end;
end;

function TFMapa.ProductoVectorial(P1, P2, P3 : TDoublePoint) : Double;
begin
  Result := (P3.x - P1.x)*(P2.y - P1.y) - (P3.y - P1.y)*(P2.x - P1.x);
end;

procedure TFMapa.OrdenarPuntos(Malla : Integer);
var
  Point, Ind : Integer;
  P0, Pi : TDoublePoint;
  IndP0 : Integer;
  Coord : TCoordenada;
begin
  BuscarMenorPunto(Malla,P0,IndP0);

  Coord := Map.Mallas[Malla].Puntos[IndP0];
  Map.Mallas[Malla].Puntos[IndP0] := Map.Mallas[Malla].Puntos[0];
  Map.Mallas[Malla].Puntos[0] := Coord;

  for Point := 1 to Length(Map.Mallas[Malla].Puntos)-1 do
  begin
    Pi := Map.Mallas[Malla].Puntos[Point].Coord;
    for Ind := Point+1 to Length(Map.Mallas[Malla].Puntos)-1 do
    begin
      if ProductoVectorial(P0,Pi,Map.Mallas[Malla].Puntos[Ind].Coord) > 0 then
      begin
        Coord := Map.Mallas[Malla].Puntos[Ind];
        Map.Mallas[Malla].Puntos[Ind] := Map.Mallas[Malla].Puntos[Point];
        Map.Mallas[Malla].Puntos[Point] := Coord;
        Pi := Coord.Coord;
      end;
    end;
  end;
end;

function TFMapa.ArmarBB : TBoundingBox;
var
  Mesh, Point : Integer;
begin
  Result.MaxLat := -10000;
  Result.MaxLong := -10000;
  Result.MinLat := 10000;
  Result.MinLong := 10000;
  for Mesh := 0 to Length(Map.Mallas)-1 do
    for Point := 0 to Length(Map.Mallas[Mesh].Puntos)-1 do
    begin
      if Map.Mallas[Mesh].Puntos[Point].Coord.x > Result.MaxLong then
        Result.MaxLong := Map.Mallas[Mesh].Puntos[Point].Coord.x;
      if Map.Mallas[Mesh].Puntos[Point].Coord.x < Result.MinLong then
        Result.MinLong := Map.Mallas[Mesh].Puntos[Point].Coord.x;

      if Map.Mallas[Mesh].Puntos[Point].Coord.y > Result.MaxLat then
        Result.MaxLat := Map.Mallas[Mesh].Puntos[Point].Coord.y;
      if Map.Mallas[Mesh].Puntos[Point].Coord.y < Result.MinLat then
        Result.MinLat := Map.Mallas[Mesh].Puntos[Point].Coord.y;
    end;

  Result.MaxLat := Result.MaxLat ;
  Result.MaxLong := Result.MaxLong ;
  Result.MinLat := Result.MinLat ;
  Result.MinLong := Result.MinLong ;
end;

function TFMapa.TranspolarPunto(Punto: TDoublePoint; BoundingBoxDest, BoundingBoxOrig : TBoundingBox) : TDoublePoint;
var
  DeltaX, DeltaY : Double;
  A : Double;
begin
  //X
  DeltaX := (BoundingBoxOrig.MinLong - Punto.x) / (Punto.x - BoundingBoxOrig.MaxLong);
  Result.x := (BoundingBoxDest.MinLong + (DeltaX * BoundingBoxDest.MaxLong)) / (DeltaX + 1);
  //Y
  DeltaY := (BoundingBoxOrig.MinLat - Punto.y) / (Punto.y - BoundingBoxOrig.MaxLat);
  Result.y := (BoundingBoxDest.MinLat + (DeltaY * BoundingBoxDest.MaxLat)) / (DeltaY + 1);

  Result.x := Result.x ;
  Result.y := Result.y ;
end;

procedure TFMapa.TranspolarPuntos;
var
  Mesh, Point : Integer;
  BBMapa : TBoundingBox;
begin
 { if Mapa.Height > Mapa.Width then
  begin}
    BBMapa.MaxLat := 90;//Mapa.Width;
    BBMapa.MaxLong := 180;//(Map.BoundingBox.MaxLong-Map.BoundingBox.MinLong)*100;//Mapa.Width;
  //end
  //else
  //begin
  //  BBMapa.MaxLat := 100;//Mapa.Height;
  //  BBMapa.MaxLong := 100;//Mapa.Height;
  //end;
  BBMapa.MinLat := 0;
  BBMapa.MinLong := 0;
  for Mesh := 0 to Length(Map.Mallas) -1 do
    for Point := 0 to Length(Map.Mallas[Mesh].Puntos) -1 do
      Map.Mallas[Mesh].Puntos[Point].CoordNormalizada := TranspolarPunto(Map.Mallas[Mesh].Puntos[Point].Coord,BBMapa,Map.BoundingBox);
end;

procedure TFMapa.GetInfoPot(var Info : TInfoMalla; Potrero : Integer);
var
  cAuxFill, cAuxStroke : String;
  Datos, Datos1 : TStringList;
  I : Integer;
  S : String;
begin
  IBQDatosPotrero.Close;
  IBQDatosPotrero.ParamByName('potrero').AsInteger := Potrero;
  IBQDatosPotrero.Open;

  cAuxFill := StringReplace(IBQDatosPotrero.FieldValues['fill_color'],'#','',[]);
  cAuxStroke := StringReplace(IBQDatosPotrero.FieldValues['stroke_color'],'#','',[]);
  Info.Stroke := RGB(StrToInt('$'+Copy(cAuxStroke, 1, 2)),StrToInt('$'+Copy(cAuxStroke, 3, 2)),StrToInt('$'+Copy(cAuxStroke, 5, 2)));
  Info.Fill := RGB(StrToInt('$'+Copy(cAuxFill, 1, 2)),StrToInt('$'+Copy(cAuxFill, 3, 2)),StrToInt('$'+Copy(cAuxFill, 5, 2)));

  Info.Nombre := IBQDatosPotrero.FieldValues['nombre'];

  Datos := TStringList.Create;
  Datos.QuoteChar := '|';
  Datos.Delimiter := ' ';

  S := StringReplace(IBQDatosPotrero.FieldValues['info'],'<br><br>','<br>',[rfReplaceAll]);
  S := StringReplace(S,'<br>','|  |',[rfReplaceAll]);

  Datos.DelimitedText := '|'+S;
  for I := 0 to Datos.Count-1 do
  begin
    if AnsiContainsStr(Datos.Strings[I],'Superficie aprox. (Has.):') then
      Info.Hs := Datos.Strings[I];
    if AnsiContainsStr(Datos.Strings[I],'Terneras') then
      Info.Teras := Datos.Strings[I];
    if AnsiContainsStr(Datos.Strings[I],'Terneros') then
      Info.Teros := Datos.Strings[I];
    if AnsiContainsStr(Datos.Strings[I],'Novillos') then
      Info.Novs := Datos.Strings[I];
    if AnsiContainsStr(Datos.Strings[I],'Vaquillonas') then
      Info.Vq := Datos.Strings[I];
    if AnsiContainsStr(Datos.Strings[I],'Vacas') then
      Info.Vacas := Datos.Strings[I];
    if AnsiContainsStr(Datos.Strings[I],'Toros') then
      Info.Toros := Datos.Strings[I];
    if AnsiContainsStr(Datos.Strings[I],'Ultimo Evento:') then
      Info.UltimoEve := Datos.Strings[I];
  end;

end;

procedure TFMapa.ArmarEstructura;
var
  Mesh, Point : Integer;
  Potrero : Integer;
  B : TBevel;
  Cant : Integer;
  Check : TCheckBox;
  Top : Integer;
  S : TShape;
  TipoS : Integer;
  L : Tlabel;
  aux_ref : String;
  Img : TJvImage;
  NextTop : Integer;
  Im : TImage;
begin
  Mesh := 0;
  Point := 1;

  IBQPuntos.Close;
  IBQPuntos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQPuntos.Open;

  Top := 32;

  SuperficieTotal := 0;

  Vacio := true;
  Cant := 0;
  IBQPuntos.First;
  Potrero := -1;
  NextTop := 10;
  while not IBQPuntos.Eof do
  begin
    Vacio := false;
    if (IBQPuntos.FieldByName('potrero').AsInteger < 5000) then
    begin
      if (IBQPuntos.FieldByName('potrero').AsInteger <> Potrero) then  //No es una Referencia
      begin
        Setlength(Potreros,Cant+1);
        Potrero := IBQPuntos.FieldByName('potrero').AsInteger;
        Mesh := Mesh+1;
        SetLength(Map.Mallas,Mesh);

        GetInfoPot(Map.Mallas[Mesh-1].Info,Potrero);

        Potreros[Cant].id := Potrero;
        Potreros[Cant].MedidasVisibles := true;
        Potreros[Cant].nombre := Map.Mallas[Mesh-1].Info.Nombre;
        Potreros[Cant].ProduccionVisible := true;
        Potreros[Cant].Visible := true;

        Img := TJvImage.Create(self);
        Img.Parent := SBReferencias;
        Img.Cursor := crHandPoint;
        Img.Picture := IAppImagen.Picture;
        Img.Pictures.PicClicked1 := IAppImagen.Pictures.PicClicked1;
        Img.AutoSize := true;
        Img.Left := 10;
        Img.Top := NextTop + 2;
        Img.Tag := Potrero;
        //Img.OnClick := ClickCheckBoxPoly;
        Img.ShowHint := true;
        Img.Hint := 'Haga clic para no mostrar esta referencia en el mapa';

        S := TShape.Create(self);
        S.Parent := SBReferencias;
        S.Brush.Color :=  Map.Mallas[Mesh-1].Info.Fill;
        S.Pen.Color := Map.Mallas[Mesh-1].Info.Stroke;
        S.Pen.Width := 3;
        S.Width := 30;
        S.Height := 30;
        S.Top := NextTop;
        S.Left := Img.Left + Img.Width + 5;
        S.Tag := Potrero;
        S.Cursor := crHandPoint;
        //S.OnMouseUp := MouseUp;

        L := TLabel.Create(self);
        L.Parent := SBReferencias;
        L.Left := S.Left + S.Width + 5;
        L.Font.Name := 'Arial';
        L.Font.Size := 10;
        L.Caption := Map.Mallas[Mesh-1].Info.Nombre;
        L.Top := NextTop + 5;
        L.Tag := Potrero;
        L.Cursor := crHandPoint;
        //L.OnClick := Click;

        Point := 1;
        Inc(Cant);

        NextTop := NextTop + 40;
      end;
    end
    else
    begin
      if IBQPuntos.FieldByName('potrero').AsInteger <> Potrero then
      begin
        Potrero := IBQPuntos.FieldValues['potrero'];

        Point := 1;
        Mesh := Mesh+1;
        SetLength(Map.Mallas,Mesh);

        IBQDatosPotrero.Close;
        IBQDatosPotrero.ParamByName('potrero').AsInteger := Potrero;
        IBQDatosPotrero.Open;



        Map.Mallas[Mesh-1].Info.Nombre := IBQDatosPotrero.FieldValues['stroke_color'];

        Map.Mallas[Mesh-1].Info.Area := Potrero;
        Map.Mallas[Mesh-1].Referencia := true;

        Img := TJvImage.Create(PReferencias);
        Img.Parent := SBReferencias;
        Img.Cursor := crHandPoint;
        Img.Picture := IAppImagen.Picture;
        Img.Pictures.PicClicked1 := IAppImagen.Pictures.PicClicked1;
        Img.AutoSize := true;
        Img.Left := 10;
        Img.Top := NextTop + 2;
        Img.Tag := Potrero;
        //Img.OnClick := ClickCheckBoxRef;
        Img.ShowHint := true;
        Img.Hint := 'Haga clic para no mostrar esta referencia en el mapa';

        Im := TImage.Create(PReferencias);
        Im.Parent := SBReferencias;
        Im.Left := Img.Left + Img.Width + 5;
        Im.Top := NextTop;
        Im.AutoSize := true;
        Im.Cursor := crHandPoint;
        //Im.OnClick := ClickImg;
        Im.Tag := Potrero;
        if Map.Mallas[Mesh-1].Info.Nombre  = 'bebedero' then
          PLReferencia.GetBitmap(0, Im.Picture.Bitmap);
        if Map.Mallas[Mesh-1].Info.Nombre  = 'casa' then
          PLReferencia.GetBitmap(1, Im.Picture.Bitmap);
        if Map.Mallas[Mesh-1].Info.Nombre  = 'entrada' then
          PLReferencia.GetBitmap(2, Im.Picture.Bitmap);
        if Map.Mallas[Mesh-1].Info.Nombre  = 'galpon' then
          PLReferencia.GetBitmap(3, Im.Picture.Bitmap);
        if Map.Mallas[Mesh-1].Info.Nombre  = 'molino' then
          PLReferencia.GetBitmap(4, Im.Picture.Bitmap);
        if Map.Mallas[Mesh-1].Info.Nombre  = 'casilla' then
          PLReferencia.GetBitmap(5, Im.Picture.Bitmap);
        if Map.Mallas[Mesh-1].Info.Nombre  = 'silos' then
          PLReferencia.GetBitmap(6, Im.Picture.Bitmap);
        if Map.Mallas[Mesh-1].Info.Nombre  = 'tranquera' then
          PLReferencia.GetBitmap(7, Im.Picture.Bitmap);

        L := TLabel.Create(PReferencias);
        L.Parent := SBReferencias;
        L.Left := Im.Left + Im.Width + 5;
        L.Font.Name := 'Arial';
        L.Font.Size := 10;
        L.Caption := Map.Mallas[Mesh-1].Info.Nombre;
        L.Top := NextTop + 5;
        L.Tag := Potrero;
        L.Cursor := crHandPoint;
        //L.OnClick := Click;

        NextTop := NextTop + 40;
      end;
    end;
    B := TBevel.Create(PReferencias);
    B.Parent := SBReferencias;
    B.Shape := bsBottomLine;
    B.Height := 4;
    B.Width := SBReferencias.Width;
    B.Left := 0;
    B.Top := NextTop + 33;

    SetLength(Map.Mallas[Mesh-1].Puntos,Point);
    //Longitud
    Map.Mallas[Mesh-1].Puntos[Point-1].Coord.x := IBQPuntos.FieldValues['lng_decimal'];
    //Latitud
    Map.Mallas[Mesh-1].Puntos[Point-1].Coord.y := IBQPuntos.FieldValues['lat_decimal'];
    Point := Point+1;
    IBQPuntos.Next;
  end;
end;


procedure TFMapa.FormCreate(Sender: TObject);
begin
  inherited;
  ArmarEstructura;
end;

procedure TFMapa.DibujarMapa(Shape : String);
var
  Mesh, Point, Pot : Integer;
  Lista : TSVOShapeList;
  Arr : TSVOShapePointArray;
  Polygon : TSVOPolygonShape;
  Imagen : TSVOImageLayer;
  Punto : TSVOMultiPointShape;
  Lineas : TSVOLineShape;
  PuntoAnims : TSVOMultiPointShape;
  DP : TDoublePoint;
  Prod : Boolean;
  V : TSVOLabels;
  P : TPoint;
  Bounds : TMaxMin;
  G : TGraphicStyles;
  Dibujar : Boolean;
  procedure AgregarValores(var L : TSVOShapeList; Malla : Integer);
  var
    Campo : TSVODataField;
  begin
    Campo := L.DataFields.AddField;
    Campo.Caption := 'Nom_Pot';
    Campo.Value := Map.Mallas[Malla].Info.Nombre;
    Campo.FieldType := ctString;

    Campo := L.DataFields.AddField;
    Campo.Caption := 'Sup';
    Campo.Value := StringReplace(Map.Mallas[Malla].Info.Hs,'Superficie aprox (Has.):','',[rfReplaceAll]);
    Campo.FieldType := ctString;

    Campo := L.DataFields.AddField;
    Campo.Caption := 'Ultimo_Eve';
    Campo.Value := StringReplace(Map.Mallas[Malla].Info.UltimoEve,'Ultimo Evento:','',[rfReplaceAll]);
    Campo.FieldType := ctString;

    Campo := L.DataFields.AddField;
    Campo.Caption := 'Cant_Teras';
    Campo.Value := Map.Mallas[Malla].Info.Teras;
    Campo.FieldType := ctString;

    Campo := L.DataFields.AddField;
    Campo.Caption := 'Cant_Teros';
    Campo.Value := Map.Mallas[Malla].Info.Teros;
    Campo.FieldType := ctString;

    Campo := L.DataFields.AddField;
    Campo.Caption := 'Cant_Novs';
    Campo.Value := Map.Mallas[Malla].Info.Novs;
    Campo.FieldType := ctString;

    Campo := L.DataFields.AddField;
    Campo.Caption := 'Cant_VQ';
    Campo.Value := Map.Mallas[Malla].Info.Vq;
    Campo.FieldType := ctString;

    Campo := L.DataFields.AddField;
    Campo.Caption := 'Cant_Toro';
    Campo.Value := Map.Mallas[Malla].Info.Toros;
    Campo.FieldType := ctString;

    Campo := L.DataFields.AddField;
    Campo.Caption := 'Cant_Vacas';
    Campo.Value := Map.Mallas[Malla].Info.Vacas;
    Campo.FieldType := ctString;

    Campo := L.DataFields.AddField;
    Campo.Caption := 'Indice';
    Campo.Value :=Malla;
    Campo.FieldType := ctString;
  end;
begin
  if Vacio then
    Exit;
  Dibujar := false;
  Mapa.ClearShapes;
  Lineas := TSVOLineShape.Create(nil,nil);
  for Mesh := 0 to Length(Map.Mallas) -1 do
  begin
    if Map.Mallas[Mesh].Referencia then
    begin
      Arr := TSVOShapePointArray.Create(0);
      for Point := 0 to Length(Map.Mallas[Mesh].Puntos)-1 do
        Arr.AddPoint(Map.Mallas[Mesh].Puntos[Point].Coord);
      Lista := TSVOShapeList.Create;
      Lista.Source := Map.Mallas[Mesh].Info.Nombre;
      Mapa.AddShapeList(Lista);
      Punto := TSVOMultiPointShape.Create(nil,nil);
      Punto.SetShape(Arr);
      Punto.Tag := Mesh;
      Punto.GraphicStyles.Mark := ptCustom;
      Punto.GraphicStyles.OnDrawCustomMark := DibujarMarca;
      Lista.Add(Punto);
      Lista.GraphicStyles.Assign(Punto.GraphicStyles);
    end
    else
    begin
      if Potreros[Map.Mallas[Mesh]._Ref_Pot].Visible then
        begin
          Arr := TSVOShapePointArray.Create(0);
          for Point := 0 to Length(Map.Mallas[Mesh].Puntos) -1 do
            Arr.AddPoint(Map.Mallas[Mesh].Puntos[Point].Coord);
          Lista := TSVOShapeList.Create;
          Lista.Source := Map.Mallas[Mesh].Info.Nombre;
          Mapa.AddShapeList(Lista);
          Polygon := TSVOPolygonShape.Create(nil,nil);
          Polygon.SetShape(Arr);

          Polygon.GraphicStyles.Pen.Width := 2;
          Lista.Add(Polygon);
          Lista.GraphicStyles.Assign(Polygon.GraphicStyles);
          AgregarValores(Lista,Mesh);
          Polygon.GraphicStyles.Brush.Style := bsSolid;
          Polygon.GraphicStyles.Brush.Color := Map.Mallas[Mesh].Info.Fill;
          Polygon.GraphicStyles.Pen.Color := Map.Mallas[Mesh].Info.Stroke;
          Polygon.GraphicStyles.Pen.Width := 3;

          {if ((Map.Mallas[Mesh].Info.Teras+Map.Mallas[Mesh].Info.Teros+Map.Mallas[Mesh].Info.Toros+Map.Mallas[Mesh].Info.Vacas+Map.Mallas[Mesh].Info.Vq+
              Map.Mallas[Mesh].Info.Novs) > 0) then
          begin
            Arr := TSVOShapePointArray.Create(0);
            Arr.AddPoint(Polygon.Centroid);
            Lista := TSVOShapeList.Create;
            Mapa.AddShapeList(Lista);
            PuntoAnims := TSVOMultiPointShape.Create(Lista,Arr);
            PuntoAnims.Tag := -10;
            PuntoAnims.GraphicStyles.Mark := ptCustom;
            PuntoAnims.GraphicStyles.OnDrawCustomMark := DibujarMarca;
            Lista.Add(PuntoAnims);
            Lista.GraphicStyles.Assign(PuntoAnims.GraphicStyles);
          end;   }

        end;
    end;
  end;
  //AgregarLabels(Map,Shape);
  //AgregarReferencias;
  Mapa.Boundary := Lista.BoundaryBox;
  Mapa.Draw;
end;

procedure TFMapa.AgregarReferencias;
begin
end;

procedure TFMapa.AgregarLabels(Arr : TMapa; Shape : String);
begin
end;

procedure TFMapa.MapaClick(Sender: TObject);
var
  AShapeList : TSVOShapeList;
  ShapeIndex, I : Integer;
  PA, PE : TPoint;
begin
  inherited;
  Mapa.UpdateCanvas;
  AShapeList := Mapa.SelectedShapeList;
  IF AShapeList.SelectedShapes.Count > 0 THEN
  BEGIN
    FOR i := 0 TO AShapeList.SelectedShapes.Count - 1 DO
    BEGIN
      ShapeIndex := AShapeList.IndexOfShape(AShapeList.SelectedShapes[i]);
      CargarDatosPotrero(ShapeIndex, AShapeList);
    END;
  END;
  {ELSE
  BEGIN
    ShapeIndex := AShapeList.IndexOfShape(Mapa.SelectedShape);
    CargarDatosPotrero(ShapeIndex, AShapeList);
  END;}

  PE.X := Trunc(Mapa.MouseXYPoint.x);
  PE.Y := Trunc(Mapa.MouseXYPoint.y);
  PA := ScreenToClient(PE);

  if ((Mapa.Mode = moCross) or (Mapa.Mode = moDefault)) and (AShapeList.SelectedShapes.Count > 0) then
  begin
    JvCPInfoPotrero.Top := PA.X;

    JvCPInfoPotrero.Visible := true;
  end;
end;

procedure TFMapa.IZoomInClick(Sender: TObject);
begin
  inherited;
  Mapa.Mode := moZoomIn;
end;

procedure TFMapa.IZoomOutClick(Sender: TObject);
begin
  inherited;
  Mapa.Mode := moZoomOut;
end;

procedure TFMapa.IDefaultClick(Sender: TObject);
begin
  inherited;
  Mapa.Mode := moOpenHand;
end;

procedure TFMapa.FormShow(Sender: TObject);
begin
  inherited;
  //TranspolarPuntos;

  self.WindowState := wsMaximized;
  Application.ProcessMessages;
  DibujarMapa('Todos');
end;

procedure TFMapa.ICoordenadasClick(Sender: TObject);
var
  F : TFCoordenadas;
begin
  inherited;
  F := TFCoordenadas.Create(self);
  F.ShowModal;
  F.Destroy;
  ArmarEstructura;
  DibujarMapa('Todos');
end;

procedure TFMapa.ISelectClick(Sender: TObject);
begin
  inherited;
  Mapa.Mode := moCross;
end;

procedure TFMapa.CargarDatosPotrero(AShapeIndex : Integer; AShapeList : TSVOShapeList);
var
  I : Integer;
  P, M : Integer;
begin
  for I := 0 to AShapeList.DataFields.Count-1 do
  begin
       if AShapeList.DataFields[I].Caption = 'Sup' then
       begin
        if AShapeList.DataFields[I].Value <> null then
        begin
          LHs.Caption := StringReplace(AShapeList.DataFields[I].Value,'Superficie aprox. (Has.):','',[rfReplaceAll]);
          LabelSup.Visible := true;
        end
        else
        begin
          LHs.Caption := '';
          LabelSup.Visible := false;
        end;
       end;

       if AShapeList.DataFields[I].Caption = 'Nom_Pot' then
       begin
        if AShapeList.DataFields[I].Value <> null then
          LNombrePot.Caption := AShapeList.DataFields[I].Value
        else
          LNombrePot.Caption := '';
       end;

       if AShapeList.DataFields[I].Caption = 'Cant_Teras' then
       begin
        if AShapeList.DataFields[I].Value <> null then
        begin
          CantTeras.Caption := AShapeList.DataFields[I].Value;
          LabelTeras.Visible := true;
        end
        else
        begin
          CantTeras.Caption := '';
          LabelTeras.Visible := false;
        end;
       end;

       if AShapeList.DataFields[I].Caption = 'Cant_Teros' then
       begin
        if AShapeList.DataFields[I].Value <> null then
        begin
          CantTeros.Caption := AShapeList.DataFields[I].Value;
          LabelTeros.Visible := true;
        end
        else
        begin
          LabelTeros.Visible := false;
          CantTeros.Caption := '';
        end;
       end;

       if AShapeList.DataFields[I].Caption = 'Cant_Novs' then
       begin
        if AShapeList.DataFields[I].Value <> null then
        begin
          CantNovs.Caption := AShapeList.DataFields[I].Value;
          LabelNovs.Visible := true;
        end
        else
        begin
          LabelNovs.Visible := false;
          CantNovs.Caption := '';
        end;
       end;

       if AShapeList.DataFields[I].Caption = 'Cant_VQ' then
       begin
        if AShapeList.DataFields[I].Value <> null then
        begin
          CantVq.Caption := AShapeList.DataFields[I].Value;
          LabelVq.Visible := true;
        end
        else
        begin
          LabelVq.Visible := false;
          CantVq.Caption := '';
        end;
       end;

       if AShapeList.DataFields[I].Caption = 'Cant_Toro' then
       begin
        if AShapeList.DataFields[I].Value <> null then
        begin
          CantToros.Caption := AShapeList.DataFields[I].Value;
          LabelToros.Visible := true;
        end
        else
        begin
          CantToros.Caption := '';
          LabelToros.Visible := false;
        end;
       end;

       if AShapeList.DataFields[I].Caption = 'Cant_Vacas' then
       begin
        if AShapeList.DataFields[I].Value <> null then
        begin
          CantVacas.Caption := AShapeList.DataFields[I].Value;
          LabelVacas.Visible := true;
        end
        else
        begin
          CantVacas.Caption := '';
          LabelVacas.Visible := false;
        end;
       end;

       if AShapeList.DataFields[I].Caption = 'Ultimo_Eve' then
       begin
        if AShapeList.DataFields[I].Value <> null then
        begin
          LUltimoEve.Caption := AShapeList.DataFields[I].Value;
          LabelUltimoEve.Visible := true;
        end
        else
        begin
          LUltimoEve.Caption := '';
          LabelUltimoEve.Visible := false;
        end;
       end;


       if AShapeList.DataFields[I].Caption = 'Indice' then
       begin
          _Ref_Pot := AShapeList.DataFields[I].Value;
          id_potrero_eve := Potreros[Map.Mallas[M]._Ref_Pot].id;
       end;

  end;
end;

procedure TFMapa.Date(Sender: TObject;
  Button: TJvCapBtnStyle);
begin
  inherited;
  if Button = capClose then
    JvCPInfoPotrero.Visible := false;
end;

procedure TFMapa.DibujarMarca(Sender: TObject; WhichCanvas: TCanvas; MarkSize: Integer; Loc: TPoint);
var
  Imagen : Integer;
  ref : String;
begin
  Imagen := (Sender as TSVOMultiPointShape).Tag;

  ref := Map.Mallas[Imagen].Info.Nombre;
  if ref = 'bebedero' then
    PLReferencia.Draw(WhichCanvas,Loc.X,Loc.Y,0,true);
  if ref = 'casa' then
    PLReferencia.Draw(WhichCanvas,Loc.X,Loc.Y,1,true);
  if ref = 'entrada' then
    PLReferencia.Draw(WhichCanvas,Loc.X,Loc.Y,2,true);
  if ref = 'galpon' then
    PLReferencia.Draw(WhichCanvas,Loc.X,Loc.Y,3,true);
  if ref = 'molino' then
    PLReferencia.Draw(WhichCanvas,Loc.X,Loc.Y,4,true);
  if ref = 'casilla' then
    PLReferencia.Draw(WhichCanvas,Loc.X,Loc.Y,5,true);
  if ref = 'silos' then
    PLReferencia.Draw(WhichCanvas,Loc.X,Loc.Y,6,true);
  if ref = 'tranquera' then
    PLReferencia.Draw(WhichCanvas,Loc.X,Loc.Y,7,true);
end;

procedure TFMapa.ISalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFMapa.IPreviewClick(Sender: TObject);
var
  F : TFREPMapaPreview;
begin
  inherited;
  //Mapa.PrintPreview;
 { F := TFREPMapaPreview.Create(self);
  Mapa.SaveAsBitmap(ExtractFilePath(Application.ExeName)+'Mapa.bmp',821,589);
  F.QRIMapa.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Mapa.bmp');
  F.QRLNomEsta.Caption := FPrincipal.NombreEstablecimiento;
  F.QRLSup.Caption := IntToStr(SuperficieTotal)+' hs.';
  F.ShowModal;
  F.Destroy; }
end;

procedure TFMapa.ISiembraClick(Sender: TObject);
var
  F : TFDatosSiembra;
begin
  inherited;
  F := TFDatosSiembra.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFMapa.SVOLeyendaCheck(Sender: TObject; const Title: String;
  Data: TSVOGISObject; Checked: Boolean);
begin
  inherited;
  //DibujarMapa(Title);
 // AgregarLabels(Map,'Title');
 // AgregarReferencias;
end;

function TFMapa.BuscarPotrero(Nombre : String) : Integer;
var
  I : Integer;
begin
  Result := -1;
  for I := 0 to Length(Potreros)-1 do
    if Potreros[I].nombre = Nombre then
    begin
      Result := I;
      break;
    end;
end;

procedure TFMapa.CheckClick(Sender: TObject);
begin
  inherited;
  Potreros[(Sender as TCheckBox).Tag].Visible := not Potreros[(Sender as TCheckBox).Tag].Visible;
  DibujarMapa(Potreros[(Sender as TCheckBox).Tag].nombre);
end;

procedure TFMapa.CBMedidasClick(Sender: TObject);
begin
  inherited;
  DibujarMapa('Todos');
end;

procedure TFMapa.CBRefClick(Sender: TObject);
begin
  inherited;
  DibujarMapa('Todos');
end;

procedure TFMapa.ISalirJVPanClick(Sender: TObject);
begin
  inherited;
  JvCPInfoPotrero.Visible := false;
end;

procedure TFMapa.JvROReferenciasExpand(Sender: TObject);
begin
  inherited;
  JvROReferencias.Height := Mapa.Height;
end;

procedure TFMapa.JvROReferenciasCollapse(Sender: TObject);
begin
  inherited;
  JvROReferencias.Height := 30;
end;

procedure TFMapa.ISalirEvesClick(Sender: TObject);
begin
  inherited;
  PEventos.Visible := false;
end;

procedure TFMapa.LGeneralesClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := true;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  PGeneral.Top := PEventos.Top+LGenerales.Top;
  PGeneral.Left := LGenerales.Left + LGenerales.Width + 3;
end;

procedure TFMapa.LPartosClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := true;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  PParto.Top := PEventos.Top+LPartos.Top;
  PParto.Left := LPartos.Left + LPartos.Width + 3;
end;

procedure TFMapa.LSanitariosClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := true;
  PTransferencia.Visible := false;
  PSanitario.Top := PEventos.Top+LSanitarios.Top;
  PSanitario.Left := LSanitarios.Left + LSanitarios.Width + 3;
end;

procedure TFMapa.LServiciosClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := true;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  Pservicios.Top := PEventos.Top+LServicios.Top;
  Pservicios.Left := LServicios.Left + LServicios.Width + 3;
end;

procedure TFMapa.LTransferenciaClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := true;
  PTransferencia.Top := PEventos.Top+LTransferencia.Top;
  PTransferencia.Left := LTransferencia.Left + LTransferencia.Width + 3;
end;

procedure TFMapa.LmovimientosClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := true;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  PMovimientos.Top := PEventos.Top+Lmovimientos.Top;
  PMovimientos.Left := Lmovimientos.Left + Lmovimientos.Width + 3;
end;

procedure TFMapa.JvCriaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PCria.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
end;

procedure TFMapa.JvGeneralMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PGeneral.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
end;

procedure TFMapa.JvDiagnosticoGestacionMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := false;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
end;

procedure TFMapa.JvServiciosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Pservicios.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
end;

procedure TFMapa.JvServicioNaturalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PServicioNatural.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
end;

procedure TFMapa.JvSanitarioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PSanitario.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
end;

procedure TFMapa.JvPartoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PParto.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
end;

procedure TFMapa.JvTransferenciaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PTransferencia.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
end;

procedure TFMapa.JvMovimientosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  PMovimientos.Visible := false;
  PEventos.Visible := false;
  InicPotrerosEvento;
end;

procedure TFMapa.InicPotrerosEvento;
begin
end;

procedure TFMapa.AEveCastracionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCastracion.Create(self));
end;

procedure TFMapa.AEveDesteteExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveDestete.Create(self));
end;

procedure TFMapa.AEveFrameExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveMedicionFrame.Create(self));
end;

procedure TFMapa.AEveActividadExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveActividad.Create(self));
end;

procedure TFMapa.AEveSuplementacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveSuplementacion.Create(self));
end;

procedure TFMapa.AEveIdentificacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveIdentificacion.Create(self,true));
end;

procedure TFMapa.AEvePesoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEvePeso.Create(self));
end;

procedure TFMapa.AEveReidentificaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveIdentificacion.Create(self,false));
end;

procedure TFMapa.AEveExamenClinicoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveFertilidadMacho.Create(self));
end;

procedure TFMapa.AEveCalidadSemenExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCalidadSeminal.Create(self));
end;

procedure TFMapa.AEveCircunferenciaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCircunferenciaEscrotal.Create(self));
end;

procedure TFMapa.AEveCondicionCorporalExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCondicionCorporal.Create(self));
end;

procedure TFMapa.AEveCalidadCarneExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCalidadCarne.Create(self));
end;

procedure TFMapa.AEveImportarPartosNacimientosExecute(
  Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveImportarPartosNacimientos.Create(self));
end;

procedure TFMapa.AEvePartoMasivoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEvePartoMasivo.Create(self));
end;

procedure TFMapa.AEveNacimientosExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveNacimientos.Create(self));
end;

procedure TFMapa.AEveTratamientoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveTratamiento.Create(self));
end;

procedure TFMapa.AEveDiagnosticoEnfermedadExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveDiagnosticoEnfermedad.Create(self));
end;

procedure TFMapa.AEveVenereasExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEnfermedadesMasivas.Create(self,memRaspadoToro));
end;

procedure TFMapa.AEveSangradoExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEnfermedadesMasivas.Create(self,memSangradoBrucelosis));
end;

procedure TFMapa.AEveTuberculinaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEnfermedadesMasivas.Create(self,memTuberculinizacion));
end;

procedure TFMapa.AEveCargaVenereasExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCargaResultados.Create(self,memRaspadoToro));
end;

procedure TFMapa.AEveCargaBrucelosisExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCargaResultados.Create(self,memSangradoBrucelosis));
end;

procedure TFMapa.AEveCargaTuberculinaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCargaResultados.Create(self,memTuberculinizacion));
end;

procedure TFMapa.AEveServicioNaturalExecute(Sender: TObject);
var
  F : TFEveServicioNatural;
begin
  inherited;
  F := TFEveServicioNatural.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFMapa.AEveIngresoHembraExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveIngresoServicio.Create(self));
end;

procedure TFMapa.AEveIngresoToroExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveIngresoToro.Create(self));
end;

procedure TFMapa.AEveEgresoHembrasExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEgresoServicio.Create(self));
end;

procedure TFMapa.AEveEgresoToroExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEgresoToro.Create(self));
end;

procedure TFMapa.AEveInseminacionArtificialExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveInseminacionArtificial.Create(self));
end;

procedure TFMapa.AEveServicioCorralExecute(Sender: TObject);
var
  F : TFEveServicioCorral;
begin
  inherited;
  F := TFEveServicioCorral.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFMapa.AEveDeteccionCeloExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveDeteccionCelo.Create(self));
end;

procedure TFMapa.AEveCapacidadServicioExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCapacidadServicio.Create(self));
end;

procedure TFMapa.AEveEvalPreservicioExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveEvaluacionPreservicio.Create(self));
end;

procedure TFMapa.AEveSincroCeloExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveSincronizacionCelo.Create(self));
end;

procedure TFMapa.AEveFlushingExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveFlushing.Create(self));
end;

procedure TFMapa.AEveTransferenciaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveTransferenciaEmbrionaria.Create(self));
end;

procedure TFMapa.AEveAltaMasivaExecute(Sender: TObject);
var
  F : TFEveAltaMasiva;
begin
  inherited;
  F := TFEveAltaMasiva.Create(self);
  F.DBLCBAPotrero.KeyValue := id_potrero_eve;
  F.ShowModal;
  F.Destroy;
end;

procedure TFMapa.AbrirEventos(Eve : TFEveSimple);
begin
  Eve.Hide;
  Eve.ConManga := True;
  Eve.ModoEve  := meMasivo;
  Eve.NomPotreroMapa := Potreros[_Ref_Pot].nombre;
  Eve.IdPotreroMapa := id_potrero_eve;
  Eve.ShowModal;
  Eve.Destroy;
end;

procedure TFMapa.AEveCambioUbicacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveCambioUbicacion.Create(self));
end;

procedure TFMapa.AEveBajaExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveBaja.Create(self));
end;

procedure TFMapa.AEveDiagnosticoGestacionExecute(Sender: TObject);
begin
  inherited;
  AbrirEventos(TFEveDiagnosticoGestacion.Create(self));
end;

procedure TFMapa.LCriaClick(Sender: TObject);
begin
  inherited;
  PMovimientos.Visible := false;
  PCria.Visible := true;
  PGeneral.Visible := false;
  PParto.Visible := false;
  Pservicios.Visible := false;
  PServicioNatural.Visible := false;
  PSanitario.Visible := false;
  PTransferencia.Visible := false;
  PCria.Top := PEventos.Top+LCria.Top;
  PCria.Left := LCria.Left + LCria.Width + 3;
end;

procedure TFMapa.IAddEveClick(Sender: TObject);
begin
  inherited;
  PEventos.Visible := true;
  JvCPInfoPotrero.Visible := false;
end;

end.
