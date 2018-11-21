{ DAIANA - 12.12.2014 - Incidencia 412 - Inicio
  Reporte de Movimientos }

unit URepMovimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, IBQuery, WinXP, DataExport, DataToXLS, DB,
  IBCustomDataSet, IBStoredProc, ActnList, JvExExtCtrls, JvImage, ComCtrls, UFunctions,
  jpeg, pngimage, ExtCtrls, StdCtrls, JvGIF, Grids, DBGrids, UBDBGrid, DateUtils, Shlobj,
  ImgList, PngImageList, JvExControls, JvLabel, acPNG, MemoAuto;

type
  TFRepMovimientos = class(TFUniversal)
    Panel1: TPanel;
    GBFiltros: TGroupBox;
    LBuscar: TLabel;
    LDesde: TLabel;
    LHasta: TLabel;
    IBuscarPartida: TImage;
    EBuscar: TEdit;
    CBxTipoAlta: TComboBox;
    CBxTipoBaja: TComboBox;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    PBotones: TPanel;
    PGrilla: TPanel;
    GBDetalle: TGroupBox;
    BDBGDetalle: TBitDBGrid;
    Image1: TImage;      
    DSMovimientos: TDataSource;
    IBQMovimientos: TIBQuery;
    IBQMovimientosCANTIDAD: TIntegerField;
    IBQMovimientosFECHA: TDateField;
    IBQMovimientosPESO_PROMEDIO: TIntegerField;
    IBQMovimientosDTE_SI_NO: TIBStringField;
    IBQMovimientosNRO_DTE: TIntegerField;
    IBQMovimientosPATH: TIBStringField;
    IBQMovimientosDESTINO: TIBStringField;
    IBQMovimientosRESPONSABLE: TIBStringField;
    IBQTipoMovAlta: TIBQuery;
    DSTipoMovAlta: TDataSource;
    IBQTipoMovBaja: TIBQuery;
    DSTipoMovBaja: TDataSource;
    IPreview: TImage;
    LPreview: TLabel;
    ISalir: TImage;
    LSalir: TLabel;
    IBQCantidad: TIBQuery;
    GroupBox1: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    IExpExcel: TImage;
    LExpExcel: TLabel;
    IBQMovimientosTIPO_MOVIMIENTO: TIBStringField;
    IBQMovimientosID_GRUPO: TIntegerField;
    IBQMovimientosESTABLEC: TIntegerField;
    LVer: TLabel;
    Image5: TImage;
    Label1: TLabel;
    IExportarAnimales: TImage;
    LExportarAnimales: TLabel;
    SaveTxt: TSaveDialog;
    IBQAnimales: TIBQuery;
    IVer: TImage;
    MAuxCaravanas: TMemoAuto;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DTPDesdeChange(Sender: TObject);
    procedure DTPHastaChange(Sender: TObject);
    procedure CBxTipoAltaChange(Sender: TObject);
    procedure CBxTipoAltaCloseUp(Sender: TObject);
    procedure CBxTipoBajaChange(Sender: TObject);
    procedure CBxTipoBajaCloseUp(Sender: TObject);
    procedure HabilitarBusqueda(H: Boolean);
    procedure IPreviewClick(Sender: TObject);
    procedure ISalirClick(Sender: TObject);
    procedure EBuscarChange(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
    procedure IExpExcelClick(Sender: TObject);
    procedure BDBGDetalleCellClick(Column: TColumn);
    procedure BDBGDetalleDblClick(Sender: TObject);
    procedure IVerClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure IExportarAnimalesClick(Sender: TObject);
    procedure mostrarCaravanas;
    function  SpecialFolder(Folder: Integer): String;
    function  armar_nombre_archivo : String;

  private
    desde, hasta, nro_dte, tipo_alta, tipo_baja : Variant;
    DelTipoAlta, DelTipoBaja, Consulta : Boolean;
    PathClickeado: String;
    grupo : integer;
    CantAnim : Integer;
    nombre_mov : String;
    procedure ActConsulta;
    procedure CargarCombos;
    procedure CargarCombo(ibq : TIBQuery; text : string; combo : TComboBox);
    function getIndex(i : Integer): Integer;
  public
    { Public declarations }
  end;

var
  FRepMovimientos: TFRepMovimientos;

implementation

{$R *.dfm}

uses
  UPrincipal, URepMovimientosPreview, UMensajeHuella, UPdf, UCargarDte, UCartel, UPanelCaravanas;

procedure TFRepMovimientos.FormCreate(Sender: TObject);
begin
  inherited;
  DTPDesde.Date := IncYear(Date(),-1);
  DTPHasta.Date := Date();
  desde := DTPDesde.Date;
  hasta := DTPHasta.Date;
  grupo := 0;
  nro_dte := null;
  tipo_alta := null;
  tipo_baja := null;
  CargarCombos;
  Consulta := false;
  PathClickeado := '';
  IVer.Visible := false;
  LVer.Visible := false;
end;

procedure TFRepMovimientos.CargarCombos;
var
  I : Integer;
  tipoAlta, tipoBaja : String;
begin
  IBQTipoMovAlta.Close;
  IBQTipoMovAlta.Open;
  IBQTipoMovBaja.Close;
  IBQTipoMovBaja.Open;

  DelTipoAlta := false;
  DelTipoBaja := false;

  CargarCombo(IBQTipoMovAlta,'TIPOS DE ALTA',CBxTipoAlta);
  CargarCombo(IBQTipoMovBaja,'TIPOS DE BAJA',CBxTipoBaja);
       
  CBxTipoAlta.ItemIndex := 0;
  CBxTipoBaja.ItemIndex := 0;
end;

procedure TFRepMovimientos.ActConsulta;
begin
  IBQMovimientos.Close;
  IBQMovimientos.ParamByName('desde').AsDate := desde;
  IBQMovimientos.ParamByName('hasta').AsDate := hasta;
  IBQMovimientos.ParamByName('nro').Value := nro_dte;
  IBQMovimientos.ParamByName('tipoalta').Value := tipo_alta;
  IBQMovimientos.ParamByName('tipobaja').Value := tipo_baja;
  IBQMovimientos.ParamByName('e').Value := FPrincipal.EstablecimientoActual;
  IBQMovimientos.Open;
  IBQCantidad.Close;
  IBQCantidad.ParamByName('desde').AsDate := desde;
  IBQCantidad.ParamByName('hasta').AsDate := hasta;
  IBQCantidad.ParamByName('nro').Value := nro_dte;
  IBQCantidad.ParamByName('tipoalta').Value := tipo_alta;
  IBQCantidad.ParamByName('tipobaja').Value := tipo_baja;
  IBQCantidad.ParamByName('e').Value := FPrincipal.EstablecimientoActual;
  IBQCantidad.Open;
  Consulta := true;
end;

procedure TFRepMovimientos.DTPDesdeChange(Sender: TObject);
begin
  inherited;
  desde := DTPDesde.Date;
end;

procedure TFRepMovimientos.DTPHastaChange(Sender: TObject);
begin
  inherited;
  hasta := DTPHasta.Date;
end;

procedure TFRepMovimientos.CBxTipoAltaChange(Sender: TObject);
var i : integer;
begin
  inherited;
  if ((CBxTipoAlta.Text <> 'TIPOS DE ALTA') and (CBxTipoAlta.Text <> '(TODOS)') and (CBxTipoAlta.Text <> '')) then
  begin
       if (CBxTipoAlta.Text = '(NINGUNO)') then
          tipo_alta := -1
       else if (CBxTipoAlta.Text = 'NACIMIENTOS') then
          tipo_alta := 40 //Figura en la tabla Cod_tipos_evento (nacimientos)
       else
          tipo_alta := IBQTipoMovAlta.Lookup('nombre',CBxTipoAlta.Text,'id_tipo_alta');
       //Busqueda por Nro DTE: habilita solo para compra (1) y todos (null)
       if (tipo_alta = 1) then
          HabilitarBusqueda(true)
       else
          if ((tipo_baja <> 1) and (tipo_baja <> null)) then
             HabilitarBusqueda(false);
       CBxTipoAlta.Clear;
       CargarCombo(IBQTipoMovAlta,'TIPOS DE ALTA',CBxTipoAlta);
       CBxTipoAlta.ItemIndex := getIndex(tipo_alta);
  end
  else
  begin
       if CBxTipoAlta.Text = '(TODOS)' then
         i := 0
       else
         i := 0;
       tipo_alta := null;
       //if not (CBxTipoAlta.Items.IndexOf('TIPOS DE ALTA') = 0) then
       //  CBxTipoAlta.Items.Insert(0,'TIPOS DE ALTA');
       CBxTipoAlta.ItemIndex := i;
       DelTipoAlta := false;
       HabilitarBusqueda(true);
  end;
end;

procedure TFRepMovimientos.CBxTipoAltaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoAlta) and (CBxTipoAlta.Text <> 'TIPOS DE ALTA') then
  begin
       //CBxTipoAlta.Items.Delete(0);
       DelTipoAlta := true; 
  end;
end;

procedure TFRepMovimientos.CBxTipoBajaChange(Sender: TObject);
var i : integer;
begin
  inherited;
  if ((CBxTipoBaja.Text <> 'TIPOS DE BAJA') and (CBxTipoBaja.Text <> '(TODOS)') and (CBxTipoBaja.Text <> '')) then
  begin
       if (CBxTipoBaja.Text = '(NINGUNO)') then
          tipo_baja := -1
       else tipo_baja := IBQTipoMovBaja.Lookup('nombre',CBxTipoBaja.Text,'id_tipo_baja');
       //Busqueda por Nro DTE: habilita solo para venta (1) y todos (null)
       if (tipo_baja = 1) then
          HabilitarBusqueda(true)
       else
          if ((tipo_alta <> 1) and (tipo_alta <> Null)) then
             HabilitarBusqueda(false);
       CBxTipoBaja.Clear;
       CargarCombo(IBQTipoMovBaja,'TIPOS DE BAJA',CBxTipoBaja);
       CBxTipoBaja.ItemIndex := getIndex(tipo_baja);
  end
  else
  begin
       if CBxTipoAlta.Text = '(TODOS)' then
         i := 0
       else
         i := 0;
       tipo_baja := null;
       //if not (CBxTipoBaja.Items.IndexOf('TIPOS DE BAJA') = 0) then
       //  CBxTipoBaja.Items.Insert(0,'TIPOS DE BAJA');
       CBxTipoBaja.ItemIndex := i;
       DelTipoBaja := false;
       HabilitarBusqueda(true);
  end;
end;

procedure TFRepMovimientos.CBxTipoBajaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelTipoBaja) and (CBxTipoBaja.Text <> 'TIPOS DE BAJA') then
  begin
    //CBxTipoBaja.Items.Delete(0);
    DelTipoBaja := true;
  end;
end;

procedure TFRepMovimientos.CargarCombo(ibq : TIBQuery; text : string; combo : TComboBox);
var f : string;
    i : integer;
begin
  //combo.Items.Insert(0,text);
  combo.Items.Insert(0,'(TODOS)');
  combo.Items.Insert(1,'(NINGUNO)');
  i := 2;
  ibq.First;
  while not(ibq.Eof) do
  begin
       f := ibq.FieldValues['nombre'];
       {Si es 'de terceros' no lo usamos, aprovechamos a reemplazarlo por 'Nacimientos'}
       if (f = 'DE TERCEROS') then
          f := 'NACIMIENTOS';
       combo.Items.Insert(i,f);
       ibq.Next;
       Inc(i);
  end;
  //combo.ItemIndex := 0;
end;

procedure TFRepMovimientos.HabilitarBusqueda(H: Boolean);
begin
  LBuscar.Enabled := H;
  EBuscar.Enabled := H;
end;

procedure TFRepMovimientos.IPreviewClick(Sender: TObject);
var
  F : TFRepMovimientosPreview;
  cartel: TCartel;
  msje: String;
begin
  inherited;
  F := TFRepMovimientosPreview.Create(self);
  if (Consulta) then
  begin
    cartel := TCartel.getInstance();
    msje := 'Generando Reporte ...';
    cartel.abrircartel(msje);
    IBQCantidad.First;
    F.QRLPeriodo.Caption := 'Desde el ' +DateToStr(DTPDesde.Date)+' a el '+DateToStr(DTPHasta.Date);
    while not IBQCantidad.Eof do
    begin
      if IBQCantidad.FieldValues['tipo_movimiento'] = 'COMPRA' then
        F.QRLAltaCompra.Caption := IBQCantidad.FieldValues['cant'];
      if IBQCantidad.FieldValues['tipo_movimiento'] = 'CESIÓN DE ALTA' then
        F.QRLAltaCesion.Caption := IBQCantidad.FieldValues['cant'];
      if IBQCantidad.FieldValues['tipo_movimiento'] = 'CARGA INICIAL' then
        F.QRLAltaCarga.Caption := IBQCantidad.FieldValues['cant'];
      if IBQCantidad.FieldValues['tipo_movimiento'] = 'NACIMIENTO' then
        F.QRLAltaNacimientos.Caption := IBQCantidad.FieldValues['cant'];
      if IBQCantidad.FieldValues['tipo_movimiento'] = 'VENTA' then
        F.QRLBajaVenta.Caption := IBQCantidad.FieldValues['cant'];
      if IBQCantidad.FieldValues['tipo_movimiento'] = 'CESIÓN DE BAJA' then
        F.QRLBajaCesion.Caption := IBQCantidad.FieldValues['cant'];
      if IBQCantidad.FieldValues['tipo_movimiento'] = 'MUERTE' then
        F.QRLBajaMuerte.Caption := IBQCantidad.FieldValues['cant'];
      IBQCantidad.Next;
    end;         
    cartel.cerrarcartel();
    cartel.FreeInstance();
  end;
  F.ShowModal;
  F.Destroy;
end;

procedure TFRepMovimientos.ISalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFRepMovimientos.EBuscarChange(Sender: TObject);
var nro: String;
begin
  inherited;
  if EBuscar.Text = '' then
    nro_dte := null
  else
  begin
    nro := Trim(EBuscar.Text);
    nro_dte := StringReplace(nro, '-', '', [rfReplaceAll, rfIgnoreCase]);
  end;
end;

procedure TFRepMovimientos.BConsultaClick(Sender: TObject);
begin
  inherited;
  ActConsulta;
end;

procedure TFRepMovimientos.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  PathClickeado := '';
  IVer.Visible := false;
  LVer.Visible := false;
  LExportarAnimales.Visible := true;
  IExportarAnimales.Visible := true;
  BConsulta.OnClick(Sender);

end;

function TFRepMovimientos.getIndex(i : Integer): Integer;
begin
  if (i = -1) then
  begin
    result := 1; exit;
  end
  else
  if (i = 40) then
  begin
    result := 5; exit;
  end
  else
  begin
    result := i+1; exit;
  end;
end;

procedure TFRepMovimientos.IExpExcelClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFRepMovimientos.BDBGDetalleCellClick(Column: TColumn);
var path : string;
begin
  inherited;
  MAuxCaravanas.Lines.Clear;
  CantAnim := 0;
  path := '';
  grupo := IBQMovimientos.FieldValues['id_grupo'];
  nombre_mov := IBQMovimientos.FieldValues['Tipo_movimiento'];
  if (IBQMovimientos.RecordCount>0) then
  begin
    if (IBQMovimientos.FieldValues['PATH'] <> null) then
      path := IBQMovimientos.FieldValues['PATH'];
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
  end;
end;

procedure TFRepMovimientos.IVerClick(Sender: TObject);
var F : TFPdf;
begin
  inherited;
  F := TFPdf.Create(self);
  F.PTitulo.Caption := 'Documento de Tránsito Electrónico';
  F.Path := ExtractFilePath(Application.ExeName)+PathClickeado;
  F.ShowModal;
  F.Destroy;
end;

procedure TFRepMovimientos.BDBGDetalleDblClick(Sender: TObject);
var m, path, dte : string;
    grupo, estab : integer;
    F : TFCargarDte;
begin
  inherited;
  m := '';
  path := ''; 
  dte := '';
  if (IBQMovimientos.RecordCount>0) then
  begin
      if (IBQMovimientos.FieldValues['TIPO_MOVIMIENTO'] <> null) then
        m := IBQMovimientos.FieldValues['TIPO_MOVIMIENTO'];
      if ((m = 'VENTA') or (m = 'COMPRA')) then
      begin
        grupo := IBQMovimientos.FieldValues['ID_GRUPO'];
        estab := IBQMovimientos.FieldValues['ESTABLEC'];
        if (IBQMovimientos.FieldValues['PATH'] <> null) then
          path := IBQMovimientos.FieldValues['PATH'];
        if (IBQMovimientos.FieldValues['NRO_DTE'] <> null) then
          dte := IBQMovimientos.FieldValues['NRO_DTE'];
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
end;

procedure TFRepMovimientos.Image5Click(Sender: TObject);
begin
  inherited;
  Close;
end;

function TFRepMovimientos.SpecialFolder(Folder: Integer): String;
var
  SFolder : pItemIDList;
  SpecialPath : Array[0..MAX_PATH] Of Char;
begin
  SHGetSpecialFolderLocation(Self.Handle, Folder, SFolder);
  SHGetPathFromIDList(SFolder, SpecialPath);
  Result := StrPas(SpecialPath);
end;

function  TFRepMovimientos.armar_nombre_archivo : String;
var nombre_archivo_nuevo,formattedDateTime, fechasola : string;
    msje: String;
begin
  DateTimeToString(fechasola, 'ddddd', now);
  DateSeparator := '_';
  TimeSeparator := '_';
  DateTimeToString(formattedDateTime, 'ddddd', now);
  nombre_archivo_nuevo := nombre_mov+'_'+ formattedDateTime +'_'+ TimeToStr(now);
  DateSeparator := '/';
  TimeSeparator := ':';
  Result := nombre_archivo_nuevo;

end;

procedure TFRepMovimientos.mostrarCaravanas;
var F : TFPanelCaravanas;
begin

  F := TFPanelCaravanas.Create(self);
  F.MACaravanas.Lines.Text := MAuxCaravanas.Lines.Text;
  
  F.LAnimales.Caption := 'Animales('+ inttostr(CantAnim)+')';
  F.ShowModal;

end;

procedure TFRepMovimientos.IExportarAnimalesClick(Sender: TObject);
var  archAnimales : TextFile;

     lineatxt, extension, escritorio, nom_archivo : String;
begin
  inherited;
  if (grupo = 0) then
     MostrarMensaje(tmInformacion,'No ha seleccionado ningún grupo')
  else
  begin
    escritorio := SpecialFolder(CSIDL_DESKTOP);
    escritorio := escritorio+'\AFIP_SIFTA';
     if not(DirectoryExists(escritorio)) then
         CreateDir(escritorio);
    SaveTxt.InitialDir := escritorio;
    nom_archivo := armar_nombre_archivo;
    SaveTxt.FileName := nom_archivo;
    if (SaveTxt.Execute) then
       extension:= SaveTxt.FileName+'.txt';
       AssignFile(archAnimales, extension);
       Rewrite(archAnimales);
       Writeln(archAnimales, 'RP | Identificación electrónica');
       IBQAnimales.Close;
       IBQAnimales.ParamByName('ID_GRUPO').Value := grupo;
       IBQAnimales.ParamByName('ESTABLEC').Value := FPrincipal.EstablecimientoActual;
       IBQAnimales.Open;

       IBQAnimales.First;
       while not IBQAnimales.Eof do
       begin
           if (IBQAnimales.FieldByName('ID_IE').asString <> '') then
           begin
                lineatxt := '['+IBQAnimales.FieldByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBQAnimales.FieldByName('ID_SENASA').asString))+'|'+IBQAnimales.FieldByName('ID_IE').asString+']';
           end
           else
           begin
                lineatxt := '['+IBQAnimales.FieldByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBQAnimales.FieldByName('ID_SENASA').asString))+'| - ]';

           end;

          MAuxCaravanas.Lines.Add(IBQAnimales.FieldByName('ID_SENASA').asString+IntToStr(UFunctions.DigitoVerificadorCaravana('00'+IBQAnimales.FieldByName('ID_SENASA').asString)));
          CantAnim := CantAnim + 1;
          Append(archAnimales);
          Writeln(archAnimales, lineatxt);

          IBQAnimales.Next;
       end;
       MostrarMensaje(tmInformacion,'El archivo se guardó correctamente');


    end;
    CloseFile(archAnimales);
    grupo := 0;
    

end;



end.

{ DAIANA - 12.12.2014 - Incidencia 412 - Fin }
