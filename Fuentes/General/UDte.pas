{ DAIANA - 23.12.2014 - Incidencia 413 - Inicio
  Documentos de Tránsito Electrónicos }

unit UDte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  DBCtrls, UDBLookupComboBoxAuto, DateTimePickerAuto, Grids, DBGrids,
  UBDBGrid, DB, IBCustomDataSet, IBQuery, QuickRpt, QRCtrls, printers,
  IBStoredProc, DataExport, DataToXLS, WinXP, UMensajeImpresora, PngImage,
  jpeg, JvGIF, JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls,
  JvImage, acPNG;

type
  TFDte = class(TFUniversal)
    ASalir: TAction;
    GBSelectorEventos: TGroupBox;
    DBLCBAEventos: TDBLookupComboBoxAuto;
    PTop: TPanel;
    Splitter2: TSplitter;
    GBSeleccionFechas: TGroupBox;
    LDesde: TLabel;
    LHasta: TLabel;
    DTPADesde: TDateTimePickerAuto;
    DTPAHasta: TDateTimePickerAuto;
    GBNroDte: TGroupBox;
    RGTipo: TRadioGroup;
    PGrilla: TPanel;
    GBEventos: TGroupBox;
    BDBGEventos: TBitDBGrid;
    DSGrupos: TDataSource;
    IBQGrupos: TIBQuery;
    IBQColumnas: TIBQuery;
    AImprimirListado: TAction;
    IBQGeneral: TIBQuery;
    DSGeneral: TDataSource;
    IBQPromedios: TIBQuery;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IExpExcel: TImage;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    LExpExcel: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    JvIBotonBuscar: TJvImage;
    Button1: TButton;
    DSEventos: TDataSource;
    IBQEventos: TIBQuery;
    ENroDte: TEdit;
    DSTabla: TDataSource;
    IBQTabla: TIBQuery;
    LVer: TLabel;
    IBQPreview: TIBQuery;
    IVer: TImage;
    procedure FormCreate(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure controlarFechas;
    procedure Button1Click(Sender: TObject);
    procedure CargarParametros; 
    procedure closeUpFechas(Sender: TObject);
    procedure AImprimirListadoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BDBGEventosDblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure CBColumnasKeyPress(Sender: TObject; var Key: Char);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvIBotonBuscarClick(Sender: TObject);
    procedure ASalirExecute(Sender: TObject);
    procedure ENroDteChange(Sender: TObject);
    procedure IBQTablaAfterOpen(DataSet: TDataSet);
    procedure DTPADesdeChange(Sender: TObject);
    procedure DTPAHastaChange(Sender: TObject);
    procedure BDBGEventosCellClick(Column: TColumn);
    procedure IVerClick(Sender: TObject);
  private
    nro_dte, desde, hasta : Variant;
    PathClickeado : String;
    Consulta : Boolean;
    Grupo, Estab : Integer;
  protected
  public
  end;

var
  FDte: TFDte;

implementation

uses UPrincipal, UDtePreview, UCartel, UTraduccion, UCargarDte, UPdf, UMensajeHuella;
{$R *.dfm}

procedure TFDte.FormCreate(Sender: TObject);
begin
  inherited;
  IBQEventos.Close;
  IBQEventos.Open;
  IBQEventos.Last;
  IBQEventos.First;
  DBLCBAEventos.KeyValue := 1;
  DTPAHasta.DateTime := now;
  DTPADesde.DateTime := DTPAHasta.DateTime - 365;
  nro_dte:=null;
  desde:=null;
  hasta:=null;
  PathClickeado := '';
  IVer.Visible := false;
  LVer.Visible := false;
  IPreview.Visible := false;
  LPreview.Visible := false;
  Consulta := false;
end;

procedure TFDte.RGTipoClick(Sender: TObject);
begin
  inherited;
  if (RGTipo.ItemIndex = 0) then //Nro DTE
  begin
    GBNroDte.Enabled := true;
    ENroDte.Enabled := true;
    GBSeleccionFechas.Enabled := false;
    LDesde.Enabled:= false;
    LHasta.Enabled:= false;
    DTPADesde.Enabled:= false;
    DTPAHasta.Enabled:= false;
    desde:=null;
    hasta:=null;
  end
  else //Rango de fechas
  begin
    GBNroDte.Enabled := false;
    ENroDte.Enabled := false;
    GBSeleccionFechas.Enabled := true;
    LDesde.Enabled:= true;
    LHasta.Enabled:= true;
    DTPADesde.Enabled:= true;
    DTPAHasta.Enabled:= true;
    desde:= DTPADesde.Date;
    hasta:= DTPAHasta.Date;
    nro_dte:=null;
  end;
end;
  
procedure TFDte.controlarFechas;
begin
  if(DTPAHasta.Date > now) then
    DTPAHasta.Date:=now;

  if(DTPADesde.Date >= DTPAHasta.Date) then
    DTPADesde.Date:= DTPAHasta.Date;
end;

procedure TFDte.Button1Click(Sender: TObject);
begin
  inherited;
  CargarParametros;
end;

procedure TFDte.CargarParametros;
var cartel: TCartel;
    msje: String;
begin
  if (DBLCBAEventos.KeyValue <> Null) then
    begin
        IBQTabla.Close;
        IBQPreview.Close;
        IBQTabla.ParamByName('NRO').Value := nro_dte;
        IBQPreview.ParamByName('NRO').Value := nro_dte;

        if (desde <> null) then
        begin
          IBQTabla.ParamByName('DESDE').AsDate := desde;
          IBQPreview.ParamByName('DESDE').AsDate := desde;
        end
        else
        begin
          IBQTabla.ParamByName('DESDE').AsDate := StrToDate('01/01/0100');     //Min: 1-1-100
          IBQPreview.ParamByName('DESDE').AsDate := StrToDate('01/01/0100');
        end;

        if (hasta <> null) then
        begin
          IBQTabla.ParamByName('HASTA').AsDate := hasta;
          IBQPreview.ParamByName('HASTA').AsDate := hasta;
        end
        else
        begin
          IBQTabla.ParamByName('HASTA').AsDate := StrToDate('01/01/9999');     //Max: 1-1-9999
          IBQPreview.ParamByName('HASTA').AsDate := StrToDate('01/01/9999');
        end;

        if (DBLCBAEventos.KeyValue = 1) then //es compra
        begin
          IBQTabla.ParamByName('TIPO_ALTA').Value := 1;
          IBQPreview.ParamByName('TIPO_ALTA').Value := 1;
        end
        else
            if (DBLCBAEventos.KeyValue = 2) then //es cesión de alta
            begin
                IBQTabla.ParamByName('TIPO_ALTA').Value := 2;
                IBQPreview.ParamByName('TIPO_ALTA').Value := 2;
            end
            else
            begin
                IBQTabla.ParamByName('TIPO_ALTA').Value := -1;
                IBQPreview.ParamByName('TIPO_ALTA').Value := -1;
            end;




        if (DBLCBAEventos.KeyValue = 3) then //es venta
        begin
          IBQTabla.ParamByName('TIPO_BAJA').Value := 1;
          IBQPreview.ParamByName('TIPO_BAJA').Value := 1;
        end
        else
           if (DBLCBAEventos.KeyValue = 4) then //es cesion de baja
           begin
              IBQTabla.ParamByName('TIPO_BAJA').Value := 2;
              IBQPreview.ParamByName('TIPO_BAJA').Value := 2;
           end
           else
              begin
                  IBQTabla.ParamByName('TIPO_BAJA').Value := -1;
                  IBQPreview.ParamByName('TIPO_BAJA').Value := -1;
              end;
        

        cartel:= TCartel.getInstance();
        msje:= 'Cargando Datos ...';
        cartel.abrircartel(msje);
        IBQTabla.Open;
        cartel.cerrarcartel();
        cartel.FreeInstance();
        AImprimirListado.Enabled := not(IBQTabla.IsEmpty);
    end;
end;

procedure TFDte.closeUpFechas(Sender: TObject);
begin
  inherited;
  controlarFechas;
end;

procedure TFDte.AImprimirListadoExecute(Sender: TObject);
var  F : TFDtePreview;
  cartel: TCartel;
  msje: String;
begin
  inherited;
  F := TFDtePreview.Create(self);
  cartel := TCartel.getInstance();
  msje := 'Generando Reporte ...';
  cartel.abrircartel(msje);
  if (Consulta) then
  begin
    IBQPreview.Close;
    IBQPreview.ParamByName('grupo').Value := Grupo;
    IBQPreview.Open;
    if (IBQPreview.FieldValues['nombre'] <> null) then
      F.QRLGrupoT.Caption := IBQPreview.FieldValues['nombre']; 
    if (IBQPreview.FieldValues['nro_dte'] <> null) then
      F.QRLDTET.Caption := IBQPreview.FieldValues['nro_dte'];
    if (IBQPreview.FieldValues['cantidad'] <> null) then
      F.QRLCantidadT.Caption := IBQPreview.FieldValues['cantidad'];
    if (IBQPreview.FieldValues['responsable'] <> null) then
      F.QRLResponsableT.Caption := IBQPreview.FieldValues['responsable'];
    if (IBQPreview.FieldValues['fecha'] <> null) then
      F.QRLFechaT.Caption := IBQPreview.FieldValues['fecha'];
    if (IBQPreview.FieldValues['precio'] <> null) then
      F.QRLPrecioT.Caption := IBQPreview.FieldValues['precio'];
  end;
  F.IBQAnimales.Close;
  F.IBQAnimales.ParamByName('id_grupo').Value := Grupo;
  F.IBQAnimales.ParamByName('establec').Value := Estab;
  F.IBQAnimales.Open;
  cartel.cerrarcartel();
  cartel.FreeInstance();
  F.ShowModal;
  F.Destroy;
end;

procedure TFDte.FormShow(Sender: TObject);
begin
  inherited;
  GBSeleccionFechas.Enabled:= false;
  LDesde.Enabled:= false;
  LHasta.Enabled:= false;
  DTPADesde.Enabled:= false;
  DTPAHasta.Enabled:= false;
end;

procedure TFDte.BDBGEventosDblClick(Sender: TObject);
var
  F : TFCargarDte;
  grupo, estab : integer;
  path, dte : string;
begin
  inherited;
  path := '';
  dte := '';
  if (IBQTabla.RecordCount>0) then
  begin
    grupo := IBQTabla.FieldValues['ID_GRUPO'];
    estab := IBQTabla.FieldValues['ESTABLEC'];
    if (IBQTabla.FieldValues['PATH'] <> null) then
      path := IBQTabla.FieldValues['PATH'];
    if (IBQTabla.FieldValues['NRO_DTE'] <> null) then
      dte := IBQTabla.FieldValues['NRO_DTE'];
    if ((path='') and (dte='')) then
    begin
          //Pregunta: adjuntar Dte?
          if MostrarMensaje(tmConsulta,'El grupo no tiene un DTE asociado. Desea asociar uno?') = mrYes then
          begin
            F := TFCargarDte.Create(self);
            F.CargarParametros(grupo,estab,path,dte);
            F.ShowModal;
            F.Destroy;
            JvIBotonBuscar.OnClick(nil);
          end;
    end
    else
    begin
          //Pregunta: modificar Dte?
          if MostrarMensaje(tmConsulta,'El grupo ya tiene un DTE asociado. Desea modificarlo y/o adjuntar uno?') = mrYes then
          begin
            F := TFCargarDte.Create(self);
            F.CargarParametros(grupo,estab,path,dte);
            F.ShowModal;
            F.Destroy;
            JvIBotonBuscar.OnClick(nil);
          end;
    end;
  end;
end;

procedure TFDte.BDBGEventosCellClick(Column: TColumn);
var path : string;
begin
  inherited;
  path := '';
  if (IBQTabla.RecordCount>0) then
  begin
    IPreview.Visible := true;
    LPreview.Visible := true;
    if (IBQTabla.FieldValues['PATH'] <> null) then
      path := IBQTabla.FieldValues['PATH'];
    if (IBQTabla.FieldValues['ID_GRUPO'] <> null) then
      Grupo := IBQTabla.FieldValues['ID_GRUPO'];
    if (IBQTabla.FieldValues['ESTABLEC'] <> null) then
      Estab := IBQTabla.FieldValues['ESTABLEC'];
    if (path<>'') then
    begin
       PathClickeado := path;
       IVer.Visible := true;
       LVer.Visible := true;
    end
    else
    begin
       PathClickeado := path;
       IVer.Visible := false;
       LVer.Visible := false;
    end;
  end
  else
  begin
    IVer.Visible := false;
    LVer.Visible := false;
    IPreview.Visible := false;
    LPreview.Visible := false;
  end;
end;

procedure TFDte.IVerClick(Sender: TObject);
var F : TFPdf;
begin
  inherited;
  F := TFPdf.Create(self);
  F.PTitulo.Caption := 'Documento de Tránsito Electrónico';
  F.Path := ExtractFilePath(Application.ExeName)+PathClickeado;
  F.ShowModal;
  F.Destroy;
end;

procedure TFDte.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFDte.CBColumnasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key:= #0;
end;

procedure TFDte.DTPADesdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    closeUpFechas(Sender);
end;

procedure TFDte.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  PathClickeado := '';
  IVer.Visible := false;
  LVer.Visible := false;
  IPreview.Visible := false;
  LPreview.Visible := false;
  Button1.OnClick(Sender);
  Consulta := true;
end;

procedure TFDte.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  Close;
end;

procedure TFDte.ENroDteChange(Sender: TObject);
var nro: String;
begin
  inherited;
  if ENroDte.Text = '' then
    nro_dte := null
  else
  begin
    nro := Trim(ENroDte.Text);
    nro_dte := StringReplace(nro, '-', '', [rfReplaceAll, rfIgnoreCase]);
  end;
end;

procedure TFDte.IBQTablaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQTabla.Last;
  IBQTabla.First;
  //BDBGEventos.DataSource := DSTabla;
  GBEventos.Caption := Traducir('Grupos [')+IntToStr(IBQTabla.RecordCount)+']';
end;

procedure TFDte.DTPADesdeChange(Sender: TObject);
begin
  inherited;
  desde := DTPADesde.Date;
end;

procedure TFDte.DTPAHastaChange(Sender: TObject);
begin
  inherited;
  hasta := DTPAHasta.Date;
end;

end.

{ DAIANA - 23.12.2014 - Incidencia 413 - Fin }
