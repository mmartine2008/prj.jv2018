
unit UDOSRADenunciaNacimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ExtCtrls, StdCtrls, DBCtrls, UDBLookupComboBoxAuto,
  ComCtrls, Grids, DBGrids, Buttons, IBQuery, WinXP, DataExport, DataToXLS,
  DB, IBCustomDataSet, IBStoredProc, ActnList, UMensajeImpresora, EditAuto,
  PngImage, jpeg, JvGIF, ImgList, PngImageList, JvExControls, JvLabel,
  UBDBGrid, UMensajeHuella, JvExExtCtrls, JvImage;

type
  TFDOSRADenunciaNacimientos = class(TFUniversal)
    GroupBox1: TGroupBox;
    GBFechas: TGroupBox;
    LabelDesde: TLabel;
    LabelHasta: TLabel;
    DTPInicio: TDateTimePicker;
    DTPFin: TDateTimePicker;
    RGTipoReporte: TRadioGroup;
    DSDenunciaNacimiento: TDataSource;
    IBQDenunciaNacimiento: TIBQuery;
    GroupBox3: TGroupBox;
    LabelRaza: TLabel;
    Label2: TLabel;
    LabelCriadorNumero: TLabel;
    EARaza: TEditAuto;
    EACriador: TEditAuto;
    EACriadorNumero: TEditAuto;
    PBotones: TPanel;
    IFondoBar: TImage;
    ISalir: TImage;
    LSalir: TLabel;
    IPreview: TImage;
    LPreview: TLabel;
    IAyuda: TImage;
    LAyuda: TLabel;
    BBImprimirReporte: TBitBtn;
    BBSalir: TBitBtn;
    BBAyuda: TBitBtn;
    BBXls: TBitBtn;
    Label1: TLabel;
    CBxRaza: TComboBox;
    IBQGetRazas: TIBQuery;
    IBQGetCodigoRazaSra: TIBQuery;
    IBQGetCodigoRazaSraCOD_RAZA_SRA: TIntegerField;
    Label3: TLabel;
    EAFolio: TEdit;
    Label4: TLabel;
    EALinea: TEdit;
    BDBGNacimientos: TBitDBGrid;
    IExportarExcel: TImage;
    LExportarExcel: TLabel;
    CBxTipoRegistro: TComboBox;
    IBQGetTiposRegistro: TIBQuery;
    IBQTiposRegistro: TIBQuery;
    GroupBox2: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    procedure DTPcloseUpFechas(Sender: TObject);
    procedure DTPInicioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure activarQuery;
    procedure calcularFechas;
    procedure IBQDenunciaNacimientoAfterOpen(DataSet: TDataSet);
    procedure BBXlsClick(Sender: TObject);
    procedure BBImprimirReporteClick(Sender: TObject);
    procedure RGTipoReporteClick(Sender: TObject);
    procedure CBxRazaChange(Sender: TObject);
    procedure CBxRazaCloseUp(Sender: TObject);
    procedure IExportarExcelClick(Sender: TObject);
    procedure CBxTipoRegistroChange(Sender: TObject);
    procedure CBxTipoRegistroCloseUp(Sender: TObject);
    procedure BDBGNacimientosDblClick(Sender: TObject);
    procedure BDBGNacimientosMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    { Private declarations }
    SQLBase : String;
    SQLGeneral : String;
    cantidadAnimales: Integer;
    TipoRegistro, Raza : integer;
    conTipoReg, conRaza : boolean;
    ColumnaActiva : Integer;
    procedure CargarCombos;
    function ExisteRegistro(cadena : string) : boolean;
  public
    { Public declarations }
  end;

var
  FDOSRADenunciaNacimientos: TFDOSRADenunciaNacimientos;
  DelRaza, DelTipoRegistro : boolean;
  CodigoRaza : integer;

implementation

uses UPrincipal,uTiposGlobales, DateUtils, UREPFichaAnimal, UCartel, UExpSRA,
     UDOSRADenunciaNacimientosPreview, UTraduccion;

{$R *.dfm}

procedure TFDOSRADenunciaNacimientos.DTPcloseUpFechas(Sender: TObject);
begin
  inherited;
 // activarQuery;
end;

procedure TFDOSRADenunciaNacimientos.DTPInicioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePicker(Sender).DroppedDown) then
    DTPcloseUpFechas(Sender);
end;

procedure TFDOSRADenunciaNacimientos.BBSalirClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFDOSRADenunciaNacimientos.FormShow(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  inherited;
  //calcularFechas;

  DelRaza := false;
  DelTipoRegistro := false;

  CodigoRaza := -1;
  TipoRegistro := -1;
  
  conTipoReg := false;
  conRaza := false;

  IBQGetRazas.Close;
  IBQGetRazas.Open;

  IBQTiposRegistro.Close;
  IBQTiposRegistro.Open;

  CargarCombos;
  CBxRaza.ItemIndex := 0;
  CBxTipoRegistro.ItemIndex := 0;

  DTPInicio.Date := IncYear(now,-1);
  DTPFin.Date := now;

  self.Caption := Traducir('Huella - Denuncia de Servicio');
  self.PTitulo.Caption := Traducir('Denuncia de Nacimientos - SRA');

  SQLBase := 'select * from REP_DENUNCIA_NACIMIENTOS_SRA(:esta, :inicio, :fin, :grupo, :potrero, :vacio, :tiporeg, :raza_a)';
  SQLGeneral := SQLBase + ' order by rp Asc';

 // activarQuery;
end;


// calcula automaticamente las fechas
procedure TFDOSRADenunciaNacimientos.calcularFechas;
var anio : integer;
    mes : integer;
begin
  anio := YearOf(now);
  mes := MonthOf(now);
  if (mes <=6 ) then
    begin
      DTPInicio.DateTime := StrToDateTime('1/7/'+intToStr(anio-1));
      DTPFin.DateTime := StrToDateTime('30/6/'+intToStr(anio));
    end
  else
    begin
      DTPInicio.DateTime := StrToDateTime('1/7/'+intToStr(anio));
      DTPFin.DateTime := StrToDateTime('30/6/'+intToStr(anio+1));
    end;
end;

// cuando se necesita actualizar el query
procedure TFDOSRADenunciaNacimientos.activarQuery;
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando la denuncia de nacimientos ...';
  cartel.abrircartel(msje);

  IBQDenunciaNacimiento.Active := false;
  IBQDenunciaNacimiento.SQL.Clear;
  IBQDenunciaNacimiento.SQL.Add(SQLGeneral);

  IBQDenunciaNacimiento.ParamByName('grupo').Value := -1;
  IBQDenunciaNacimiento.ParamByName('potrero').Value := -1;
  IBQDenunciaNacimiento.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDenunciaNacimiento.ParamByName('inicio').AsDateTime := DTPInicio.DateTime;
  IBQDenunciaNacimiento.ParamByName('fin').AsDateTime := DTPFin.DateTime;

  IBQDenunciaNacimiento.ParamByName('vacio').Value:= 0;
  if RGTipoReporte.ItemIndex = 1 then
  begin
      IBQDenunciaNacimiento.ParamByName('vacio').Value:= 1;
  end;

  if (conTipoReg) then
    IBQDenunciaNacimiento.ParamByName('tiporeg').AsInteger := TipoRegistro
  else
    IBQDenunciaNacimiento.ParamByName('tiporeg').Value := null;

  if (conRaza) then
    IBQDenunciaNacimiento.ParamByName('raza_a').AsInteger := Raza
  else
    IBQDenunciaNacimiento.ParamByName('raza_a').Value := null;

  cantidadAnimales := 0;
  IBQDenunciaNacimiento.Active := true;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

procedure TFDOSRADenunciaNacimientos.IBQDenunciaNacimientoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  IBQDenunciaNacimiento.First;
  while (not IBQDenunciaNacimiento.Eof) do
  begin
      if (DataSet.FieldByName('rp').value <> null) then
         inc(cantidadAnimales);

      IBQDenunciaNacimiento.Next;
  end;
  IBQDenunciaNacimiento.First;

  GroupBox1.Caption := Traducir(' Animales [ ')+IntToStr(cantidadAnimales) +' ] ';

  if (RGTipoReporte.ItemIndex = 0) then
  begin
    IPreview.Enabled := not(IBQDenunciaNacimiento.IsEmpty);
    LPreview.Enabled := not(IBQDenunciaNacimiento.IsEmpty);
  end
  else
  begin
    IPreview.Enabled := true;
    LPreview.Enabled := true;
  end;

  IExportarExcel.Enabled := not(IBQDenunciaNacimiento.IsEmpty);
  LExportarExcel.Enabled := not(IBQDenunciaNacimiento.IsEmpty);

end;

procedure TFDOSRADenunciaNacimientos.BBXlsClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFDOSRADenunciaNacimientos.BBImprimirReporteClick(Sender: TObject);
var F : TFDOSRADenunciaNacimientosPreview;
    cartel : TCartel;
begin
  MostrarMensajeImpresion();
  inherited;

  cartel := TCartel.getInstance();
  cartel.abrircartel('Generando Reporte de Denuncia de Nacimientos - SRA...');

  F := TFDOSRADenunciaNacimientosPreview.Create(self);

  F.QRLNumeroCriadorValor.Caption := EACriadorNumero.Text;
  F.QRLNombreCriadorValor.Caption := EACriador.Text;

  if (CodigoRaza <> -1) then
  begin
    F.QRLCodigoRazaValor.Caption := IntToStr(CodigoRaza);
    F.QRLNombreRazaValor.Caption := CBxRaza.Text;
  end
  else
  begin
    F.QRLCodigoRazaValor.Caption := '';
    F.QRLNombreRazaValor.Caption := '';
  end;

  F.QRLFolio.Caption := EAFolio.Text;
  F.QRLLinea.Caption := EALinea.Text;

  cartel.cerrarcartel;
  cartel.FreeInstance;

  F.ShowModal;
  F.Destroy;

end;

procedure TFDOSRADenunciaNacimientos.RGTipoReporteClick(Sender: TObject);
begin
  inherited;
  DTPInicio.Enabled:= true;
  DTPFin.Enabled:= true;
  if (RGTipoReporte.ItemIndex = 1) then
    begin
      DTPInicio.Enabled:= false;
      DTPFin.Enabled:= false;
    end;

  //activarQuery;
end;

procedure TFDOSRADenunciaNacimientos.CargarCombos;
begin

     CBxRaza.AddItem('RAZAS',nil);
     CBxRaza.AddItem('(TODAS)',nil);
     CBxTipoRegistro.AddItem('TIPOS DE REGISTRO',nil);
     CBxTipoRegistro.AddItem('(TODOS)',nil);
     IBQGetRazas.First;
     while not(IBQGetRazas.Eof) do
     begin
       IBQGetTiposRegistro.Close;
       IBQGetTiposRegistro.ParamByName('raza').AsInteger := IBQGetRazas.FieldValues['id_raza'];
       IBQGetTiposRegistro.Open;
       IBQGetTiposRegistro.First;

       while not(IBQGetTiposRegistro.Eof) do
       begin
           if not(ExisteRegistro(IBQGetTiposRegistro.FieldValues['sinonimo'])) then
             CBxTipoRegistro.AddItem(IBQGetTiposRegistro.FieldValues['sinonimo'],nil);

           IBQGetTiposRegistro.Next;
       end;

       CBxRaza.AddItem(IBQGetRazas.FieldValues['sinonimo'],nil);
       IBQGetRazas.Next;
     end;
end;


procedure TFDOSRADenunciaNacimientos.CBxRazaChange(Sender: TObject);
begin
  inherited;
  if ((CBxRaza.Text <> 'RAZA') and (CBxRaza.Text <> '(TODAS)')) then
  begin
       Raza := IBQGetRazas.Lookup('sinonimo',CBxRaza.Text,'id_raza');
       IBQGetCodigoRazaSra.Close;
       IBQGetCodigoRazaSra.ParamByName('raza').AsInteger := Raza;
       IBQGetCodigoRazaSra.Open;
       conRaza := true;

       if (IBQGetCodigoRazaSra.FieldValues['cod_raza_sra'] <> null) then
          CodigoRaza := IBQGetCodigoRazaSra.FieldValues['cod_raza_sra']
       else
          CodigoRaza := -1;
  end
  else
  begin
       conRaza := false;
       CBxRaza.Items.Insert(0,'RAZA');
       CBxRaza.ItemIndex := 0;
       CodigoRaza := -1;
       DelRaza := false;
  end;
 // activarQuery;
end;

procedure TFDOSRADenunciaNacimientos.CBxRazaCloseUp(Sender: TObject);
begin
  inherited;
  if not(DelRaza) then
  begin
       CBxRaza.Items.Delete(0);
       DelRaza := true;
  end;
end;

procedure TFDOSRADenunciaNacimientos.IExportarExcelClick(Sender: TObject);
begin
  inherited;
  if (SDXLS.Execute) then
    DTXLS.SaveToFile(SDXLS.FileName);
end;

procedure TFDOSRADenunciaNacimientos.CBxTipoRegistroChange(
  Sender: TObject);
begin
  inherited;

  if ((CBxTipoRegistro.Text <> 'TIPO DE REGISTRO') and (CBxTipoRegistro.Text <> '(TODOS)')) then
  begin
    TipoRegistro := IBQTiposRegistro.Lookup('sinonimo',CBxTipoRegistro.Text,'id_subcategoria');
    conTipoReg := true;
  end
  else
  begin
    conTipoReg := false;
    TipoRegistro := -1;
    CBxTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
    CBxTipoRegistro.ItemIndex := 0;
    DelTipoRegistro := false;
  end;
 // activarQuery();
end;

procedure TFDOSRADenunciaNacimientos.CBxTipoRegistroCloseUp(
  Sender: TObject);
begin
  inherited;
  if not(DelTipoRegistro) then
  begin
       CBxTipoRegistro.Items.Delete(0);
       DelTipoRegistro := true; 
  end;
end;

function TFDOSRADenunciaNacimientos.ExisteRegistro(cadena : string) : boolean;
var i : integer;
    repetido : boolean;
begin

     i := 0;
     repetido := false;

     while ((i < CBxTipoRegistro.Items.Count) and not(repetido)) do
     begin
          if (CBxTipoRegistro.Items.Strings[i] = cadena) then
            repetido := true;

          Inc(i);
     end;

     Result := repetido;
end;


procedure TFDOSRADenunciaNacimientos.BDBGNacimientosDblClick(
  Sender: TObject);
var
  cartel : TCartel;
  F : TFREPFichaAnimal;
  Column : TColumn;
  campo, campo1, padre : Integer;
  nombre : String;


begin
  inherited;
  campo := ColumnaActiva;

  if  (ColumnaActiva <= 2) then
  begin
    F := TFREPFichaAnimal.Create(self);
    F.animal := BDBGNacimientos.DataSource.DataSet.FieldValues['hijo'];
    F.ShowModal;
    F.Destroy;
  end
  else
     if  (ColumnaActiva >= 3) and (ColumnaActiva <= 5) then
     begin
        F := TFREPFichaAnimal.Create(self);
        F.animal := BDBGNacimientos.DataSource.DataSet.FieldValues['madre'];
        F.ShowModal;
        F.Destroy;
     end
     else
        if (ColumnaActiva >= 6) then
        begin
            if (BDBGNacimientos.DataSource.DataSet.FieldValues['padre'] <> null) then
            begin
                F := TFREPFichaAnimal.Create(self);
                F.animal := BDBGNacimientos.DataSource.DataSet.FieldValues['padre'];
                F.ShowModal;
                F.Destroy;
            end;
        end;
end;


procedure TFDOSRADenunciaNacimientos.BDBGNacimientosMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  Celda : TGridCoord;
  Columna : Integer;

begin
  inherited;
  Celda := (Sender as TBitDBGrid).MouseCoord(X,Y);
  ColumnaActiva := Celda.X;
  (Sender as TBitDBGrid).Cursor := crHandPoint;

 if (Celda.X <= 2) then
  begin
      (Sender as TBitDBGrid).ShowHint := true;
      (Sender as TBitDBGrid).Hint := 'Datos Animal';
  end
  else
  begin
     if (Celda.X >= 3) and (Celda.X <= 5) then
     begin
       (Sender as TBitDBGrid).ShowHint  := true;
      (Sender as TBitDBGrid).Hint := 'Datos de la Madre';

     end
     else
       if (Celda.X >= 6)then
       begin
          (Sender as TBitDBGrid).ShowHint  := true;
          (Sender as TBitDBGrid).Hint := 'Datos del Padre';


       end
  end;

end;

procedure TFDOSRADenunciaNacimientos.Button1Click(Sender: TObject);
begin
  inherited;
  activarQuery;
end;

procedure TFDOSRADenunciaNacimientos.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  activarQuery;
end;

end.
