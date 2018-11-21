unit UREPGananciaDiariaPeso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  DBCtrls, UDBLookupComboBoxAuto, EditAuto, Grids, DBGrids, UBDBGrid, DB,
  IBCustomDataSet, IBQuery, IBStoredProc, WinXP, DataExport, DataToXLS,
  DateTimePickerAuto, UMensajeImpresora, PngImage, jpeg,
  JvGIF, JvExControls, JvLabel, ImgList, PngImageList, JvExExtCtrls,
  JvImage;

type
  TFREPGananciaDiariaPeso = class(TFUniversal)
    ASalir: TAction;
    AImprimirReporte: TAction;
    Ptop: TPanel;
    GroupBox1: TGroupBox;
    EAEdadDesde: TEditAuto;
    DBLCBACategorias: TDBLookupComboBoxAuto;
    PGrilla: TPanel;
    DSAnimales: TDataSource;
    RBTodas: TRadioButton;
    IBQAnimales: TIBQuery;
    IBQAnimalesRP: TIBStringField;
    IBQAnimalesCATEGORIA: TIBStringField;
    IBQAnimalesEDAD: TIntegerField;
    IBQAnimalesEDADCAPTION: TIBStringField;
    IBQAnimalesID_ANIMAL: TIntegerField;
    IBQAnimalesFECHA_NACIMIENTO: TDateField;
    LDesde: TLabel;
    DTPADesde: TDateTimePickerAuto;
    LHasta: TLabel;
    DTPAHasta: TDateTimePickerAuto;
    DBLCBAPotreros: TDBLookupComboBoxAuto;
    //IBQAnimalesGANANCIAADULTO: TIBBCDField;
    DBLCBARodeos: TDBLookupComboBoxAuto;
    GBAnimales: TGroupBox;
    BDBGrilla: TBitDBGrid;
    CBCategoria: TCheckBox;
    CBEdad: TCheckBox;
    CBPotrero: TCheckBox;
    CBRodeo: TCheckBox;
    CBFecha: TCheckBox;
    RBFiltrar: TRadioButton;
    LDesde2: TLabel;
    Lhasta2: TLabel;
    EAEdadHasta: TEditAuto;
    IBQAnimalesGANANCIAULTIMA: TIBBCDField;
    IBQAnimalesGANANCIADESTETE: TIBBCDField;
    IBQAnimalesGANANCIAANIO: TIBBCDField;
    IBQAnimalesGANANCIAADULTO: TFloatField;
    IBQAnimalesRODEO: TIntegerField;
    IBQAnimalesPOTRERO: TIntegerField;
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
    GroupBox2: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    procedure ASalirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RBclick(Sender: TObject);
    procedure DBLCBACategoriasCloseUp(Sender: TObject);
    procedure DBLCBACategoriasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBACategoriasKeyPress(Sender: TObject; var Key: Char);
    procedure EAEdadDesdeKeyPress(Sender: TObject; var Key: Char);
    procedure AImprimirReporteExecute(Sender: TObject);
    procedure IBQAnimalesAfterOpen(DataSet: TDataSet);
    procedure BDBGrillaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBAPotrerosCloseUp(Sender: TObject);
    procedure DBLCBAPotrerosKeyPress(Sender: TObject; var Key: Char);
    procedure BBXlsClick(Sender: TObject);
    procedure DBLCBARodeosKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBARodeosCloseUp(Sender: TObject);
    procedure EAEdadDesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBAPotrerosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBARodeosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBCategoriaClick(Sender: TObject);
    procedure CBEdadClick(Sender: TObject);
    procedure CBFechaClick(Sender: TObject);
    procedure CBPotreroClick(Sender: TObject);
    procedure CBRodeoClick(Sender: TObject);
    procedure RBTodasClick(Sender: TObject);
    procedure RBFiltrarClick(Sender: TObject);
    procedure BDBGrillaKeyPress(Sender: TObject; var Key: Char);
    procedure DTPACloseUpFechas(Sender: TObject);
    procedure DTPADesdeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    PromUltGan,PromGanDest,PromGanAnio,PromGanAdulto:String;
   { procedure filtrarCategoria;
    procedure actualizarfechas;
    procedure filtrarPotrero;
    procedure filtrarRodeo;
    procedure ejecutarEdad; }
    procedure PromediosGanancias();
    procedure filtrar();
    procedure InicializarComponentes();
    procedure controlarFechas;
  public
  published
    property PromUltimaGanancia: String read PromUltGan write PromUltGan;
    property PromGananciaDestete: String read PromGanDest write PromGanDest;
    property PromGananciaAnio: String read PromGanAnio write PromGanAnio;
    property PromGananciaAdulto: String read PromGanAdulto write PromGanAdulto;
  end;

var
  FREPGananciaDiariaPeso: TFREPGananciaDiariaPeso;

implementation

uses UPrincipal,uTiposGlobales, UDMSoftvet, UREPGananciaDiariaPesoPreview, UMensajeHuella,
     UREPFichaAnimal, UCartel, UTraduccion;

{$R *.dfm}

procedure TFREPGananciaDiariaPeso.ASalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFREPGananciaDiariaPeso.controlarFechas;
begin
  if(DTPAHasta.Date > now) then
    DTPAHasta.Date:=now;

  if(DTPADesde.Date >= DTPAHasta.Date) then
    DTPADesde.Date:= DTPAHasta.Date;
end;

procedure TFREPGananciaDiariaPeso.FormCreate(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  inherited;
{  cartel:= TCartel.getInstance();
  msje:= 'Cargando Ganancia Diaria de Peso ...';
  cartel.abrircartel(msje);
  inherited;
  IBQAnimales.Close;
  IBQAnimales.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQAnimales.Open;

  cartel.cerrarcartel();
  cartel.FreeInstance(); }
  InicializarComponentes();
end;

procedure TFREPGananciaDiariaPeso.RBclick(Sender: TObject);
var s:TShiftState;
    cartel: TCartel;
    msje: String;
begin
  inherited;
  //DBLCBACategorias.Enabled := RBCategoria.Checked;
  //EAEdad.Enabled := RBEdad.Checked;
  //LDesde.Enabled := RBFecha.Checked;
  //LHasta.Enabled := RBFecha.Checked;
  //DTPADesde.Enabled := RBFecha.Checked;
  //DTPAHasta.Enabled := RBFecha.Checked;
  //DBLCBAPotreros.Enabled := RBPotrero.Checked;
  //DBLCBARodeos.Enabled := RBRodeo.Checked;

 { if (RBTodas.Checked) then
    begin
      cartel:= TCartel.getInstance();
      msje:= 'Cargando Ganancia Diaria de Peso ...';
      cartel.abrircartel(msje);
      IBQAnimales.Close;
      IBQAnimales.SQL.Clear;
      IBQAnimales.SQL.Add('select * from REP_Ganancia_Diaria (:esta,''today'') ORDER BY FECHA_NACIMIENTO ASC');
      IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
      IBQAnimales.Open;

      cartel.cerrarcartel();
      cartel.FreeInstance();
    end;

  if (RBFecha.Checked) then
    actualizarfechas;

  if (RBCategoria.Checked) then
    begin
      if (DBLCBACategorias.KeyValue = null) then
       DBLCBACategorias.KeyValue:= 1;
      filtrarCategoria;
    end;

  if (RBPotrero.Checked) then
    begin
      if (DBLCBAPotreros.KeyValue = null) then
       DBLCBAPotreros.KeyValue:= 0;
      DMSoftvet.IBQPotrero.Close;
      DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := fprincipal.EstablecimientoActual;
      DMSoftvet.IBQPotrero.Open;
      filtrarPotrero;
    end;

  if (RBRodeo.Checked) then
    begin
      if (DBLCBARodeos.KeyValue = null) then
       DBLCBARodeos.KeyValue:= 0;
      DMSoftvet.IBQRodeo.Close;
      DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
      DMSoftvet.IBQRodeo.Open;
      filtrarRodeo;
    end;


  if (RBEdad.Checked) then
    begin
      ejecutarEdad;
      EAEdad.SetFocus;
      EAEdad.SelectAll;
    end;  }
end;

procedure TFREPGananciaDiariaPeso.DBLCBACategoriasCloseUp(Sender: TObject);
begin
  inherited;
  // codigo
  //filtrarCategoria;
 // filtrar();
end;

procedure TFREPGananciaDiariaPeso.DBLCBACategoriasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBACategorias.ListVisible) then
   // filtrar();
    //filtrarCategoria;
end;

procedure TFREPGananciaDiariaPeso.DBLCBACategoriasKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #0;
end;

// filtro por categoria
{procedure TFREPGananciaDiariaPeso.filtrarCategoria;
var cartel: TCartel;
    msje: String;
begin
  if (DBLCBACategorias.KeyValue <> null) then
    begin
      cartel:= TCartel.getInstance();
      msje:= 'Calculando Ganancia Diaria de Peso ...';
      cartel.abrircartel(msje);
      IBQAnimales.Close;
      IBQAnimales.SQL.Clear;
      IBQAnimales.SQL.Add('select * from REP_Ganancia_Diaria (:esta,''today'') where categoria = :cate'  ORDER BY FECHA_NACIMIENTO ASC);
      IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
      IBQAnimales.ParamByName('cate').AsString := DBLCBACategorias.Text;
      IBQAnimales.Open;

      cartel.cerrarcartel();
      cartel.FreeInstance();
    end;
end; }

procedure TFREPGananciaDiariaPeso.EAEdadDesdeKeyPress(Sender: TObject; var Key: Char);
var valor : integer;
    cartel: TCartel;
    msje: String;
begin
  inherited;
  if (not (key in (['0'..'9']))  and (key <> #8)) then
    key:=#0;
{  else
  begin
    //if (Key = #13) then
    //  begin
        if (TryStrToInt(EAEdad.Text,valor)) then
          begin
            cartel:= TCartel.getInstance();
            msje:= 'Calculando Ganancia Diaria de Peso ...';
            cartel.abrircartel(msje);

            IBQAnimales.Close;
            IBQAnimales.SQL.Clear;
            IBQAnimales.SQL.Add('select * from REP_Ganancia_Diaria (:esta,''today'') where edad = :edad');
            IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
            IBQAnimales.ParamByName('edad').AsInteger := valor;
            IBQAnimales.Open;

            cartel.cerrarcartel();
            cartel.FreeInstance();
          end
        else
          begin
            MostrarMensaje(tmError, 'La edad no es válida');
            TEditAuto(Sender).SetFocus;
          end;
     // end;
   end;  }
end;

procedure TFREPGananciaDiariaPeso.AImprimirReporteExecute(Sender: TObject);
var cont : integer;
    paramName : string;
    cartel: TCartel;
    msje: String;
begin
  MostrarMensajeImpresion();
  HabilitarDesabilitarControles();
  cartel:= TCartel.getInstance();
  msje:= 'Generando Reporte de Ganancia Diaria de Peso ...';
  cartel.abrircartel(msje);
  inherited;
  Application.CreateForm(TFREPGananciaDiariaPesoPreview, FREPGananciaDiariaPesoPreview);
  {FREPGananciaDiariaPesoPreview.IBQAnimales.Close;
  FREPGananciaDiariaPesoPreview.IBQAnimales.SQL.Clear;
  FREPGananciaDiariaPesoPreview.IBQAnimales.SQL.Add(IBQAnimales.SQL.GetText);
  cont := 0;
  IBQAnimales.Close;
  while (cont < self.IBQAnimales.Params.Count) do
    begin
      paramName := self.IBQAnimales.Params.Items[cont].Name;
      FREPGananciaDiariaPesoPreview.IBQAnimales.ParamByName(paramName).Value := self.IBQAnimales.Params.Items[cont].Value;      inc(cont);
    end;
  IBQAnimales.Open;
  FREPGananciaDiariaPesoPreview.IBQAnimales.Open; 

  FREPGananciaDiariaPesoPreview.CargarPromedios(); }

  FREPGananciaDiariaPesoPreview.QRLG.Enabled := false;
  FREPGananciaDiariaPesoPreview.QRLGrupo.Enabled := false;

  FREPGananciaDiariaPesoPreview.QRLG1.Enabled := false;
  FREPGananciaDiariaPesoPreview.QRLGrupo1.Enabled := false;

  FREPGananciaDiariaPesoPreview.QRLG2.Enabled := false;
  FREPGananciaDiariaPesoPreview.QRLGrupo2.Enabled := false;

  FREPGananciaDiariaPesoPreview.QRLG3.Enabled := false;
  FREPGananciaDiariaPesoPreview.QRLGrupo3.Enabled := false;

  FREPGananciaDiariaPesoPreview.QRLD.Enabled := false;
  FREPGananciaDiariaPesoPreview.QRLDesde.Enabled := false;

  FREPGananciaDiariaPesoPreview.QRLH.Enabled := false;
  FREPGananciaDiariaPesoPreview.QRLHasta.Enabled := false;

  FREPGananciaDiariaPesoPreview.QRLPeriodo.Enabled := false;

  FREPGananciaDiariaPesoPreview.QRLG.Caption :='';
  FREPGananciaDiariaPesoPreview.QRLGrupo.Caption:='';

  FREPGananciaDiariaPesoPreview.QRLA.Enabled := false;
  FREPGananciaDiariaPesoPreview.QRLGrupo4.Enabled := false;

  if (RBTodas.Checked) then
  begin
     FREPGananciaDiariaPesoPreview.QRLG.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLG.Caption := Traducir('Categoría: ');
     FREPGananciaDiariaPesoPreview.QRLGrupo.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLGrupo.Caption := Traducir('Todos');
  end;
  if (CBCategoria.Checked) then
  begin
     FREPGananciaDiariaPesoPreview.QRLG.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLG.Caption := Traducir('Categoría: ');
     FREPGananciaDiariaPesoPreview.QRLGrupo.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLGrupo.Caption := DBLCBACategorias.Text;
  end;
  if (CBEdad.Checked) then
  begin
     FREPGananciaDiariaPesoPreview.QRLG1.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLG1.Caption := Traducir('Edad: ');
     FREPGananciaDiariaPesoPreview.QRLGrupo1.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLGrupo1.Caption := EAEdadDesde.Text;
     FREPGananciaDiariaPesoPreview.QRLA.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLGrupo4.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLGrupo4.Caption := EAEdadHasta.Text;     
  end;
  if (CBPotrero.Checked) then
  begin
     FREPGananciaDiariaPesoPreview.QRLG2.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLG2.Caption := Traducir('Potrero: ');
     FREPGananciaDiariaPesoPreview.QRLGrupo2.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLGrupo2.Caption := DBLCBAPotreros.Text;

  end;
  if (CBRodeo.Checked) then
  begin
     FREPGananciaDiariaPesoPreview.QRLG3.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLG3.Caption := Traducir('Rodeo: ');
     FREPGananciaDiariaPesoPreview.QRLGrupo3.Enabled := true;
     FREPGananciaDiariaPesoPreview.QRLGrupo3.Caption := DBLCBARodeos.Text;
  end;
  if (CBFecha.Checked) then
  begin
    FREPGananciaDiariaPesoPreview.QRLD.Enabled := true;
    FREPGananciaDiariaPesoPreview.QRLDesde.Enabled := true;
    FREPGananciaDiariaPesoPreview.QRLDesde.Caption := DateToStr(DTPADesde.Date);
    FREPGananciaDiariaPesoPreview.QRLHasta.Caption := DateToStr(DTPAHasta.Date);
    FREPGananciaDiariaPesoPreview.QRLH.Enabled := true;
    FREPGananciaDiariaPesoPreview.QRLHasta.Enabled := true;
    FREPGananciaDiariaPesoPreview.QRLPeriodo.Enabled := true;
  end;

  FREPGananciaDiariaPesoPreview.QRLUltimaGanancia.Caption:= PromUltimaGanancia;
  FREPGananciaDiariaPesoPreview.QRLGananciaDestete.Caption:= PromGananciaDestete;
  FREPGananciaDiariaPesoPreview.QRLGananciaAnio.Caption:= PromGananciaAnio;
  FREPGananciaDiariaPesoPreview.QRLGananciaAdulto.Caption:= PromGananciaAdulto;

  cartel.cerrarcartel();
  cartel.FreeInstance();
  FREPGananciaDiariaPesoPreview.ShowModal;
  FREPGananciaDiariaPesoPreview.Destroy;
  HabilitarDesabilitarControles();  

end;

procedure TFREPGananciaDiariaPeso.PromediosGanancias;
var
  totalug, totalgd, totalga, totalgad : Integer;
  prom_ug, prom_gd, prom_ga, prom_gad :real;
begin
  totalug := 0;
  totalgd := 0;
  totalga := 0;
  totalgad := 0;
  prom_ug := 0;
  prom_gd := 0;
  prom_ga := 0;
  prom_gad := 0;
  IBQAnimales.First;
  while not IBQAnimales.Eof do
  begin
    if IBQAnimales.FieldByName('GANANCIAULTIMA').Value <> 0 then
      begin
        Inc(totalug);
        prom_ug :=prom_ug + IBQAnimales.FieldByName('GANANCIAULTIMA').AsFloat;
      end;

    if IBQAnimales.FieldByName('GANANCIADESTETE').Value <> 0 then
      begin
        Inc(totalgd);
        prom_gd :=prom_gd + IBQAnimales.FieldByName('GANANCIADESTETE').AsFloat;
      end;

    if IBQAnimales.FieldByName('GANANCIAANIO').Value <> 0 then
      begin
        Inc(totalga);
        prom_ga :=prom_ga + IBQAnimales.FieldByName('GANANCIAANIO').AsFloat;
      end;

    if IBQAnimales.FieldByName('GANANCIAADULTO').Value <> 0 then
      begin
        Inc(totalgad);
        prom_gad :=prom_gad + IBQAnimales.FieldByName('GANANCIAADULTO').AsFloat;
      end;
    IBQAnimales.Next;
   // Application.ProcessMessages;
  end;

  if prom_ug = 0 then
    PromUltimaGanancia := ' '
  else
    PromUltimaGanancia := FormatFloat('###0.000',(prom_ug/totalug))+' Kgs.';

  if prom_gd = 0 then
    PromGananciaDestete := ' '
  else
    PromGananciaDestete := FormatFloat('###0.000',(prom_gd/totalgd))+' Kgs.';

  if prom_ga = 0 then
    PromGananciaAnio := ' '
  else
    PromGananciaAnio := FormatFloat('###0.000',(prom_ga/totalga))+' Kgs.';

  if prom_gad = 0 then
    PromGananciaAdulto := ' '
  else
    PromGananciaAdulto := FormatFloat('###0.000',(prom_gad/totalgad))+' Kgs.';
end;

procedure TFREPGananciaDiariaPeso.IBQAnimalesAfterOpen(DataSet: TDataSet);

begin
  inherited;


  PromediosGanancias();
  BDBGrilla.DataSource := DSAnimales;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(IBQAnimales.RecordCount)+']';
  AImprimirReporte.Enabled := not(IBQAnimales.IsEmpty);
  BBXls.Enabled := not(IBQAnimales.IsEmpty);  
end;

procedure TFREPGananciaDiariaPeso.BDBGrillaDblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (BDBGrilla.SelectedIndex = 0) then
    if not(IBQAnimales.eof) then
     begin
      F := TFREPFichaAnimal.Create(self);
      F.animal := IBQAnimales.fieldByName('id_animal').AsInteger;
      F.ShowModal;
      F.Destroy;
     end;
end;

procedure TFREPGananciaDiariaPeso.FormShow(Sender: TObject);
begin
  inherited;
  DTPADesde.Date:=now()-365;
  DTPAHasta.Date:=now;
  //filtrar();
end;
{
procedure TFREPGananciaDiariaPeso.actualizarfechas;
var cartel: TCartel;
    msje: String;
begin
    cartel:= TCartel.getInstance();
    msje:= 'Calculando Ganancia Diaria de Peso ...';
    cartel.abrircartel(msje);
    IBQAnimales.Close;
    IBQAnimales.SQL.Clear;
    IBQAnimales.SQL.Add('select * from REP_Ganancia_Diaria (:esta,''today'') where (FECHA_NACIMIENTO <= :hasta) and (FECHA_NACIMIENTO > :desde)' ORDER BY FECHA_NACIMIENTO ASC');
    IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
    IBQAnimales.ParamByName('desde').Value := DTPADesde.DateTime;
    IBQAnimales.ParamByName('hasta').Value := DTPAHasta.DateTime;
    IBQAnimales.Open;

    cartel.cerrarcartel();
    cartel.FreeInstance();
end;  }


{
procedure TFREPGananciaDiariaPeso.filtrarPotrero;
var query: String;
    cartel: TCartel;
    msje: String;
begin
   if (DBLCBAPotreros.KeyValue <> null) then
    begin
      cartel:= TCartel.getInstance();
      msje:= 'Calculando Ganancia Diaria de Peso ...';
      cartel.abrircartel(msje);
      IBQAnimales.Close;
      IBQAnimales.SQL.Clear;

      query:= 'select * from REP_Ganancia_Diaria (:esta,''today'') '+
              'where potrero = :potrero' ORDER BY FECHA_NACIMIENTO ASC ';
      IBQAnimales.SQL.Add(query);
      IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
      IBQAnimales.ParamByName('potrero').AsString := DBLCBAPotreros.KeyValue;
      IBQAnimales.Open;

      cartel.cerrarcartel();
      cartel.FreeInstance();
    end;
end;
 }
procedure TFREPGananciaDiariaPeso.DBLCBAPotrerosCloseUp(Sender: TObject);
begin
  inherited;
  //filtrarPotrero;
  //filtrar();
end;

procedure TFREPGananciaDiariaPeso.DBLCBAPotrerosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key:= #0;
end;

procedure TFREPGananciaDiariaPeso.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFREPGananciaDiariaPeso.DBLCBARodeosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:= #0;
end;
 {
procedure TFREPGananciaDiariaPeso.filtrarRodeo;
var query: String;
    cartel: TCartel;
    msje: String;
begin
   if (DBLCBARodeos.KeyValue <> null) then
    begin
      cartel:= TCartel.getInstance();
      msje:= 'Calculando Ganancia Diaria de Peso ...';
      cartel.abrircartel(msje);
      IBQAnimales.Close;
      IBQAnimales.SQL.Clear;

      query:= 'select * from REP_Ganancia_Diaria (:esta,''today'') '+
              'where rodeo = :rodeo ';
      IBQAnimales.SQL.Add(query);
      IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
      IBQAnimales.ParamByName('rodeo').AsString := DBLCBARodeos.KeyValue;
      IBQAnimales.Open;

      cartel.cerrarcartel();
      cartel.FreeInstance();
    end;
end;
 }
procedure TFREPGananciaDiariaPeso.DBLCBARodeosCloseUp(Sender: TObject);
begin
  inherited;
  //filtrarRodeo;
  //filtrar();
end;

procedure TFREPGananciaDiariaPeso.EAEdadDesdeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);

begin
  inherited;
   if (Key <> 13) then
     // filtrar();
end;


 {
procedure TFREPGananciaDiariaPeso.ejecutarEdad;
var valor : integer;
    cartel: TCartel;
    msje: String;
begin
        if (TryStrToInt(EAEdadDesde.Text,valor)) then
          begin
            cartel:= TCartel.getInstance();
            msje:= 'Calculando Ganancia Diaria de Peso ...';
            cartel.abrircartel(msje);

            IBQAnimales.Close;
            IBQAnimales.SQL.Clear;
            IBQAnimales.SQL.Add('select * from REP_Ganancia_Diaria (:esta,''today'') where edad = :edad' ORDER BY FECHA_NACIMIENTO ASC');
            IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
            IBQAnimales.ParamByName('edad').AsInteger := valor;
            IBQAnimales.Open;

            cartel.cerrarcartel();
            cartel.FreeInstance();
          end
        else
          begin
            MostrarMensaje(tmError, 'La edad no es válida');
          end;
end;
 }
procedure TFREPGananciaDiariaPeso.DBLCBAPotrerosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBAPotreros.ListVisible) then
      //filtrar();
      //filtrarPotrero;
end;

procedure TFREPGananciaDiariaPeso.DBLCBARodeosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBARodeos.ListVisible) then
   // filtrar();
    //filtrarRodeo;
end;

procedure TFREPGananciaDiariaPeso.filtrar;
var
    query: String;
    conwhere: boolean;
    valor, valor2: Integer;
    cartel: TCartel;
    msje: String;
begin
 { cartel:= TCartel.getInstance();
  msje:= 'Calculando Ganancia Diaria de Peso ...';
  cartel.abrircartel(msje);
  conwhere:= false;
  query:= 'select * from REP_Ganancia_Diaria (:esta,''today'') ';
  IBQAnimales.Close;
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add(query);
  query2:='';
  query3:='';
  InicializarComponentes();
  if (RBTodas.Checked) then
    begin
      IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
    end
   else
     begin
      if (CBCategoria.Checked) then
        if (DBLCBACategorias.KeyValue <> null) then
          begin
            query2:='';
            if (conwhere) then
              query2:= query2 + 'and categoria = :cate '
             else
              begin
                query2:= query2 + 'where categoria = :cate ';
                conwhere:= true;
              end;
            IBQAnimales.SQL.Add(query2);
            IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
            IBQAnimales.ParamByName('cate').AsString := DBLCBACategorias.Text;
          end;

      if (CBFecha.Checked) then
       begin
        query2:='';
        if (conwhere) then
          query2:= query2 + 'and (FECHA_NACIMIENTO <= :hasta) and (FECHA_NACIMIENTO > :desde) '
         else
          begin
            query2:= query2 + 'where (FECHA_NACIMIENTO <= :hasta) and (FECHA_NACIMIENTO > :desde) ';
            conwhere:= true;
          end;
        IBQAnimales.SQL.Add(query2);
        IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
        IBQAnimales.ParamByName('desde').Value := DTPADesde.DateTime;
        IBQAnimales.ParamByName('hasta').Value := DTPAHasta.DateTime;
       end;

       if (CBPotrero.Checked) then
         if (DBLCBAPotreros.KeyValue <> null) then
          begin
            query2:='';
            if (conwhere) then
              query2:= query2 + 'and potrero = :potrero '
             else
              begin
                query2:= query2 + 'where potrero = :potrero ';
                conwhere:= true;
              end;
            IBQAnimales.SQL.Add(query2);
            IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
            IBQAnimales.ParamByName('potrero').AsString := DBLCBAPotreros.KeyValue;
          end;

       if (CBRodeo.Checked) then
         if (DBLCBARodeos.KeyValue <> null) then
          begin
            query2:='';
            if (conwhere) then
              query2:= query2 + 'and rodeo = :rodeo '
             else
              begin
                query2:= query2 + 'where rodeo = :rodeo ';
                conwhere:= true;
              end;
            IBQAnimales.SQL.Add(query2);
            IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
            IBQAnimales.ParamByName('rodeo').AsString := DBLCBARodeos.KeyValue;
          end;

        if (CBEdad.Checked) then
         if ((EAEdadDesde.Text <> '') and (EAEdadHasta.Text <> '')) then
          if (TryStrToInt(EAEdadDesde.Text,valor) and TryStrToInt(EAEdadHasta.Text,valor2)) then
            begin
              query2:='';
              if (conwhere) then
                query2:= query2 + 'and edad >= :edaddesde and edad <= :edadhasta'
               else
                begin
                  query2:= query2 + 'where edad >= :edaddesde and edad <= :edadhasta ';
                  conwhere:= true;
                end;
              IBQAnimales.SQL.Add(query2);
              IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
              IBQAnimales.ParamByName('edaddesde').AsInteger := valor;
              IBQAnimales.ParamByName('edadhasta').AsInteger := valor2;
            end
          else
            begin
              MostrarMensaje(tmError, 'La edad no es válida');
            end;
     end;

 { query3:= query3 + 'ORDER BY FECHA_NACIMIENTO ASC';}
 { IBQAnimales.SQL.Add(query3);
  IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
  IBQAnimales.Open;

  cartel.cerrarcartel();
  cartel.FreeInstance(); }


  cartel:= TCartel.getInstance();
  msje:= 'Calculando Ganancia Diaria de Peso ...';
  cartel.abrircartel(msje);
  conwhere:= false;
  query:= 'select * from REP_GANANCIA_DIARIA (:esta,''today'' , :categoria, :potrero, :rodeo, :fecha_desde, :fecha_hasta, :edad_desde , :edad_hasta)';
  IBQAnimales.SQL.Clear;
  IBQAnimales.SQL.Add(query);
  IBQAnimales.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;

  InicializarComponentes();
  if (RBFiltrar.Checked) then
   begin
      if (CBCategoria.Checked) then
        if (DBLCBACategorias.KeyValue <> null) then
            IBQAnimales.ParamByName('categoria').AsInteger := DBLCBACategorias.KeyValue;

      if (CBFecha.Checked) then
      begin
        IBQAnimales.ParamByName('fecha_desde').Value := DTPADesde.DateTime;
        IBQAnimales.ParamByName('fecha_hasta').Value := DTPAHasta.DateTime;
      end;

      if (CBPotrero.Checked) then
        if (DBLCBAPotreros.KeyValue <> null) then
            IBQAnimales.ParamByName('potrero').AsInteger := DBLCBAPotreros.KeyValue;


      if (CBRodeo.Checked) then
        if (DBLCBARodeos.KeyValue <> null) then
            IBQAnimales.ParamByName('rodeo').AsInteger := DBLCBARodeos.KeyValue;


      if (CBEdad.Checked) then  //imposible de ponerlo dentro de SP
        if ((EAEdadDesde.Text <> '') and (EAEdadHasta.Text <> '')) then
          if (TryStrToInt(EAEdadDesde.Text,valor) and TryStrToInt(EAEdadHasta.Text,valor2)) then
          begin
              IBQAnimales.ParamByName('edad_desde').AsInteger := valor;
              IBQAnimales.ParamByName('edad_hasta').AsInteger := valor2;
          end
          else
          begin
              MostrarMensaje(tmError, 'La edad no es válida');
          end;
   end;
  GBAnimales.Caption := Traducir('Animales [')+IntToStr(0)+']';
  IBQAnimales.Open;

  cartel.cerrarcartel();
  cartel.FreeInstance();


end;

procedure TFREPGananciaDiariaPeso.CBCategoriaClick(Sender: TObject);
begin
  inherited;
  if (CBCategoria.Checked = true) then
     DBLCBACategorias.Enabled := true
  else
     DBLCBACategorias.Enabled := false;
     
  if (DBLCBACategorias.KeyValue = null) then
   DBLCBACategorias.KeyValue:= 1;
  //filtrar();
end;

procedure TFREPGananciaDiariaPeso.CBEdadClick(Sender: TObject);
begin
  inherited;
  //filtrar();
  if (CBEdad.Checked = true) then
  begin
      LDesde2.Enabled := true;
      Lhasta2.Enabled := true;
      EAEdadDesde.Enabled := true;
      EAEdadHasta.Enabled := true;
  end
  else
  begin
      LDesde2.Enabled := false;
      Lhasta2.Enabled := false;
      EAEdadDesde.Enabled := false;
      EAEdadHasta.Enabled := false;
  end;

  if (EAEdadDesde.Enabled) then
    begin
      EAEdadHasta.SetFocus;
      EAEdadHasta.SelectAll;
    end;  
end;

procedure TFREPGananciaDiariaPeso.CBFechaClick(Sender: TObject);
begin
  inherited;
  if (CBFecha.Checked = true) then
  begin
      LDesde.Enabled := true;
      LHasta.Enabled := true;
      DTPADesde.Enabled := true;
      DTPAHasta.Enabled := true;
  end
  else
  begin
      LDesde.Enabled := false;
      LHasta.Enabled := false;
      DTPADesde.Enabled := false;
      DTPAHasta.Enabled := false;
  end;
  //filtrar();
end;

procedure TFREPGananciaDiariaPeso.CBPotreroClick(Sender: TObject);
begin
  inherited;
  if (CBPotrero.Checked = true) then
      DBLCBAPotreros.Enabled := true
   else
      DBLCBAPotreros.Enabled := false;

  if (DBLCBAPotreros.KeyValue = null) then
   DBLCBAPotreros.KeyValue:= 0;
  DMSoftvet.IBQPotrero.Close;
  DMSoftvet.IBQPotrero.ParamByName('establecimiento').AsInteger := fprincipal.EstablecimientoActual;
  DMSoftvet.IBQPotrero.Open;
  //filtrar();
end;

procedure TFREPGananciaDiariaPeso.CBRodeoClick(Sender: TObject);
begin
  inherited;
  if (CBRodeo.Checked = true) then
      DBLCBARodeos.Enabled := true
  else
      DBLCBARodeos.Enabled := false;

  if (DBLCBARodeos.KeyValue = null) then
   DBLCBARodeos.KeyValue:= 0;
  DMSoftvet.IBQRodeo.Close;
  DMSoftvet.IBQRodeo.ParamByName('esta').AsInteger := fprincipal.EstablecimientoActual;
  DMSoftvet.IBQRodeo.Open;
  //filtrar();
end;

procedure TFREPGananciaDiariaPeso.RBTodasClick(Sender: TObject);
begin
  inherited;
  InicializarComponentes();
  //filtrar();
end;

procedure TFREPGananciaDiariaPeso.RBFiltrarClick(Sender: TObject);
begin
  inherited;
 // InicializarComponentes();  lo saque por que ya lo hace el filtrar
  if(CBCategoria.Checked or CBPotrero.Checked or CBFecha.Checked or CBRodeo.Checked or CBEdad.Checked) then
      //filtrar()
  else
    InicializarComponentes();
end;

procedure TFREPGananciaDiariaPeso.InicializarComponentes;
begin
  if (RBTodas.Checked) then
    begin
      DBLCBACategorias.Enabled := false;
      EAEdadDesde.Enabled := false;
      EAEdadHasta.Enabled := false;
      LDesde2.Enabled := false;
      LHasta2.Enabled := false;
      LDesde.Enabled := false;
      LHasta.Enabled := false;
      DTPADesde.Enabled := false;
      DTPAHasta.Enabled := false;
      DBLCBAPotreros.Enabled := false;
      DBLCBARodeos.Enabled := false;
      CBCategoria.Enabled:= false;
      CBPotrero.Enabled:= false;
      CBEdad.Enabled:= false;
      CBRodeo.Enabled:= false;
      CBFecha.Enabled:= false;
    end
  else
    if (RBFiltrar.Checked) then
      begin
        DBLCBACategorias.Enabled := CBCategoria.Checked;
        EAEdadDesde.Enabled := CBEdad.Checked;
        EAEdadHasta.Enabled := CBEdad.Checked;
        CBEdad.Enabled:= true;
        LDesde2.Enabled := CBEdad.Checked;
        LHasta2.Enabled := CBEdad.Checked;
        CBFecha.Enabled:= true;
        LDesde.Enabled := CBFecha.Checked;
        LHasta.Enabled := CBFecha.Checked;
        DTPADesde.Enabled := CBFecha.Checked;
        DTPAHasta.Enabled := CBFecha.Checked;
        DBLCBAPotreros.Enabled := CBPotrero.Checked;
        DBLCBARodeos.Enabled := CBRodeo.Checked;
        CBCategoria.Enabled:= true;
        CBPotrero.Enabled:= true;
        CBRodeo.Enabled:= true;
      end;
end;

procedure TFREPGananciaDiariaPeso.BDBGrillaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    BDBGrillaDblClick(nil);
end;

procedure TFREPGananciaDiariaPeso.DTPACloseUpFechas(Sender: TObject);
begin
  inherited;
  controlarFechas;
  //filtrar();
end;

procedure TFREPGananciaDiariaPeso.DTPADesdeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePickerAuto(Sender).DroppedDown) then
    DTPACloseUpFechas(Sender);
end;

procedure TFREPGananciaDiariaPeso.Button1Click(Sender: TObject);
begin
  inherited;
  filtrar();
end;

procedure TFREPGananciaDiariaPeso.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

end.


