unit URepDenunciaServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  Menus, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, QRCtrls, QuickRpt,
  jpeg, IBStoredProc, DataExport, DataToXLS, WinXP, QRExport, QRWebFilt,
  QRPDFFilt, UDMSoftvet, DBCtrls, UDBLookupComboBoxAuto, UMensajeImpresora,
  EditAuto, QRPrntr, PngImage, JvGIF, JvExControls, JvLabel, ImgList,
  PngImageList, JvExExtCtrls, JvImage;

  
type
  TFREPDenunciaServicio = class(TFUniversal)
    ACSalir: TAction;
    PopupMenu1: TPopupMenu;
    Salir1: TMenuItem;
    GBFechas: TGroupBox;
    DTPInicio: TDateTimePicker;
    DTPFin: TDateTimePicker;
    LabelDesde: TLabel;
    LabelHasta: TLabel;
    DSDenunciaServicio: TDataSource;
    IBQDenunciaServicio: TIBQuery;
    QR: TQuickRep;
    QRBand2: TQRBand;
    QRLRPAnimal: TQRLabel;
    QRLTipoServicio: TQRLabel;
    QRLFechaInicio: TQRLabel;
    QRLFechaFin: TQRLabel;
    QRLNombreToro: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    ACImprimirReporte: TAction;
    IBQAux: TIBQuery;
    QRBEncabezadoPlanilla: TQRBand;
    QRImage2: TQRImage;
    LabelTitulo: TQRLabel;
    QRLEstablecimientos: TQRLabel;
    QRLRenglon1: TQRLabel;
    QRSEncabezadoPlanilla: TQRShape;
    QRSysDPlanilla: TQRSysData;
    QRShape2: TQRShape;
    QRLRenglon2: TQRLabel;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRSDPageRPs: TQRSysData;
    QRLPagRPs: TQRLabel;
    QRHTMLFilter1: TQRHTMLFilter;
    DBLCBATipodeServicio: TDBLookupComboBoxAuto;
    DSConsultaTiposServicios: TDataSource;
    IBQConsultaTiposServicios: TIBQuery;
    CBTipodeServicio: TCheckBox;
    QRBand1: TQRBand;
    QRLDesde: TQRLabel;
    QRLD: TQRLabel;
    QRLH: TQRLabel;
    QRLHasta: TQRLabel;
    QRLPeriodo: TQRLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    RGTipoReporte: TRadioGroup;
    GroupBox3: TGroupBox;
    LabelRaza: TLabel;
    Label2: TLabel;
    EARaza: TEditAuto;
    EACriador: TEditAuto;
    LabelCriadorNumero: TLabel;
    EACriadorNumero: TEditAuto;
    Label1: TLabel;
    EAFolio: TEditAuto;
    LActividad: TLabel;
    DBLCBAActividad: TDBLookupComboBoxAuto;
    CBActividad: TCheckBox;
    IBQDenunciaServicioRP_ANIMAL: TIBStringField;
    IBQDenunciaServicioSERVICIO: TIBStringField;
    IBQDenunciaServicioFINICIO: TDateField;
    IBQDenunciaServicioFFIN: TDateField;
    IBQDenunciaServicioTORO: TIBStringField;
    IBQDenunciaServicioID_ANIMAL: TIntegerField;
    IBQDenunciaServicioTIPO: TIntegerField;
    IBQDenunciaServicioORDEN: TIntegerField;
    IBQDenunciaServicioRP_TORO: TIBStringField;
    IBQDenunciaServicioHBA_TORO: TIBStringField;
    IBQDenunciaServicioOBSERVACION: TIBStringField;
    IBQDenunciaServicioHBA_ANIMAL: TIBStringField;
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
    IBQGetCodigoRazaSra: TIBQuery;
    IBQGetRazas: TIBQuery;
    IBQGetCodigoRazaSraCOD_RAZA_SRA: TIntegerField;
    IBQDenunciaServicioDIAINICIO: TIntegerField;
    IBQDenunciaServicioMESINICIO: TIntegerField;
    IBQDenunciaServicioANIOINICIO: TIntegerField;
    IBQDenunciaServicioDIAFIN: TIntegerField;
    IBQDenunciaServicioMESFIN: TIntegerField;
    IBQDenunciaServicioANIOFIN: TIntegerField;
    IBQDenunciaServicioTIPOSERVICIO: TIBStringField;
    CBxTipoServicio: TComboBox;
    CBxActividad: TComboBox;
    CBxRaza: TComboBox;
    IBQDenunciaServicioNRO_REG_ASOC: TIBStringField;
    IBQDenunciaServicioNRO_REG_ASOC_T: TIBStringField;
    CBxTipoRegistro: TComboBox;
    IBQGetTiposRegistro: TIBQuery;
    IBQTiposRegistro: TIBQuery;
    GroupBox2: TGroupBox;
    Button1: TButton;
    JvIBotonBuscar: TJvImage;
    procedure ACSalirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ACImprimirReporteExecute(Sender: TObject);
    procedure activarQuery;
    procedure calcularFechas;
    procedure QRBEncabezadoPlanillaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure IBQDenunciaServicioAfterOpen(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BBXlsClick(Sender: TObject);
    procedure CBTipodeServicioClick(Sender: TObject);
    procedure DBLCBATipodeServicioCloseUp(Sender: TObject);
    procedure DBLCBATipodeServicioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure TerminaThread(Sender : TObject);
    procedure DTPCloseUpFechas(Sender: TObject);
    procedure DTPInicioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGTipoReporteClick(Sender: TObject);
    procedure LActividadClick(Sender: TObject);
    procedure LActividadMouseEnter(Sender: TObject);
    procedure LActividadMouseLeave(Sender: TObject);
    procedure CBActividadClick(Sender: TObject);
    procedure DBLCBAActividadCloseUp(Sender: TObject);
    procedure DBLCBAActividadKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBxTipoServicioChange(Sender: TObject);
    procedure CBxTipoServicioCloseUp(Sender: TObject);
    procedure CBxActividadCloseUp(Sender: TObject);
    procedure CBxActividadChange(Sender: TObject);
    procedure CBxRazaChange(Sender: TObject);
    procedure CBxRazaCloseUp(Sender: TObject);
    procedure CBxTipoRegistroChange(Sender: TObject);
    procedure CBxTipoRegistroCloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
  private
    SQLBase : String;
    SQLGeneral : String;
    conServicio : Boolean;
    conActividad : Boolean;
    conTipoReg, conRaza : boolean;   
    cantidadAnimales: Integer;
    procedure CambioExportacionExcel;

    procedure CargarCombos;
    procedure ReiniciarCombos;
    function ExisteRegistro(cadena : string) : boolean;
  protected
    procedure ComponentesVisiblesPorPais(pais: Integer);override;    
  public
    { Public declarations }
  end;

var
  FREPDenunciaServicio: TFREPDenunciaServicio;
  DelTipoServicio, DelActividad, DelRaza, DelTipoRegistro : boolean;
  CodigoRaza, TipoRegistro, Raza : integer;

implementation

uses UPrincipal, DateUtils, UREPFichaAnimal, UCartel,UTiposGlobales, 
     UDOSRADenunciaServiciosPreview, UABMActividad, UABMSimple,
     UDOSRADenunciaServiciosNuevosPreview, UTraduccion, UExpSRA;

{$R *.dfm}

procedure TFREPDenunciaServicio.ACSalirExecute(Sender: TObject);
begin
  inherited;
  BBSalir.SetFocus;
  close;
end;

procedure TFREPDenunciaServicio.FormShow(Sender: TObject);
var cartel: TCartel;
    msje: String;
begin
  inherited;

  DTPInicio.Date := IncYear(now,-1);
  DTPFin.Date := now;

  self.Caption := Traducir('Huella - Denuncia de Servicio');
  self.PTitulo.Caption := Traducir('Denuncia de Servicio');
  LabelTitulo.Caption := Traducir('Denuncia de Servicio');

  IBQTiposRegistro.Close;
  IBQTiposRegistro.Open;

  IBQConsultaTiposServicios.Close;
  IBQConsultaTiposServicios.Open;

  IBQGetRazas.Close;
  IBQGetRazas.Open;

  DMSoftvet.IBQAfterOpen(IBQConsultaTiposServicios);

  CargarCombos;

  DelTipoServicio := false;
  DelActividad := false;
  DelRaza := false;
  DelTipoRegistro := false;

  conTipoReg := false;
  conRaza := false;

  CBxActividad.ItemIndex := 0;
  CBxTipoServicio.ItemIndex := 0;
  CBxRaza.ItemIndex := 0;
  CBxTipoRegistro.ItemIndex := 0;
  CodigoRaza := -1;

  SQLBase := 'select * from get_denuncia_servicio(:esta, :inicio, :fin, :tipo_serv,:sra, :vacio, :actividad, :tiporegistro, :raza_a)';
  SQLGeneral := SQLBase + ' order by rp_animal Asc';

  GroupBox3.Visible:= false;
  ComponentesVisiblesPorPais(FPrincipal.Pais);
  //activarQuery;
  TRadioButton(RGTipoReporte.Components[1]).Enabled := FPrincipal.FuncSRA;

end;

procedure TFREPDenunciaServicio.ACImprimirReporteExecute(Sender: TObject);
var
  cartel : TCartel;
  val : Integer;
  F : TFUniversal1;
  F1 : TFDOSRADenunciaServiciosNuevosPreview;
begin
  MostrarMensajeImpresion();
  inherited;
  cartel := TCartel.getInstance();
  cartel.abrircartel('Generando Reporte de Denuncia de Servicios...');

          if (RGTipoReporte.ItemIndex = 0) then
          begin
              F1 := TFDOSRADenunciaServiciosNuevosPreview.Create(self);
              cartel.cerrarcartel;
              cartel.FreeInstance;

              F1.QRLNumeroCriadorValor.Caption := EACriadorNumero.Text;
              F1.QRLNombreCriadorValor.Caption := EACriador.Text;
         //     F1.QRLFolioValor. Caption := EAFolio.Text;
        //      F1.QRLCantidad.Caption := IntToStr(cantidadAnimales);

              if (CodigoRaza <> -1) then
              begin
                F1.QRLNombreRazaValor.Caption := CBxRaza.Text;
                F1.QRLCodigoRazaValor.Caption := IntToStr(CodigoRaza);
              end
              else
              begin
                F1.QRLCodigoRazaValor.Caption := '';
                F1.QRLNombreRazaValor.Caption := '';
              end;

              if TryStrToInt(EAFolio.Text,val) then
                F1.nro_folio := val
              else
                F1.nro_folio := -1;

              F1.ShowModal;
              F1.Destroy;
          end;

          if (RGTipoReporte.ItemIndex = 1) then
          begin
              F1 := TFDOSRADenunciaServiciosNuevosPreview.Create(self);
              cartel.cerrarcartel;
              cartel.FreeInstance;
              {F1.QRLNumeroCriadorValor.Caption := EACriadorNumero.Text;
              F1.QRLNombreCriadorValor.Caption := EACriador.Text;
              F1.QRLFolioValor.Caption := EAFolio.Text;
              F1.QRLCantidad.Caption := IntToStr(cantidadAnimales);

              if (CodigoRaza <> -1) then
              begin
                F1.QRLNombreRazaValor.Caption := CBxRaza.Text;
                F1.QRLCodigoRazaValor.Caption := IntToStr(CodigoRaza);
              end
              else
              begin
                F1.QRLCodigoRazaValor.Caption := '';
                F1.QRLNombreRazaValor.Caption := '';
              end;

              if TryStrToInt(EAFolio.Text,val) then
                F1.nro_folio := val
              else
                F1.nro_folio := -1;   }

              F1.ShowModal;
              F1.Destroy;
        end;

        IBQDenunciaServicio.First;
end;

// calcula automaticamente las fechas
procedure TFREPDenunciaServicio.calcularFechas;
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
procedure TFREPDenunciaServicio.activarQuery;
var cartel: TCartel;
    msje: String;
begin
  cartel:= TCartel.getInstance();
  msje:= 'Calculando la denuncia de servicio ...';
  cartel.abrircartel(msje);

  IBQDenunciaServicio.Active := false;
  IBQDenunciaServicio.SQL.Clear;
  IBQDenunciaServicio.SQL.Add(SQLGeneral);

  if (conServicio) then
    IBQDenunciaServicio.ParamByName('tipo_serv').Value := DBLCBATipodeServicio.KeyValue
  else
    IBQDenunciaServicio.ParamByName('tipo_serv').Value := null;

  IBQDenunciaServicio.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQDenunciaServicio.ParamByName('inicio').AsDateTime := DTPInicio.DateTime;
  IBQDenunciaServicio.ParamByName('fin').AsDateTime := DTPFin.DateTime;

  if (conActividad) then
    IBQDenunciaServicio.ParamByName('actividad').Value := DBLCBAActividad.KeyValue
  else
      IBQDenunciaServicio.ParamByName('actividad').Value := null;

  if (conTipoReg) then
    IBQDenunciaServicio.ParamByName('tiporegistro').Value := TipoRegistro
  else
    IBQDenunciaServicio.ParamByName('tiporegistro').Value := null;

  if (conRaza) then
    IBQDenunciaServicio.ParamByName('raza_a').Value := Raza
  else
    IBQDenunciaServicio.ParamByName('raza_a').Value := null;

  if (RGTipoReporte.ItemIndex = 0) then
  begin
    IBQDenunciaServicio.ParamByName('sra').Value := 2;
    IBQDenunciaServicio.ParamByName('vacio').Value:= 0;
  end
  else
    if (RGTipoReporte.ItemIndex = 1) then
    begin
         IBQDenunciaServicio.ParamByName('sra').Value := 1;
         IBQDenunciaServicio.ParamByName('vacio').Value:= 1;
    end;

  cantidadAnimales := 0;
  IBQDenunciaServicio.Active := true;

  cartel.cerrarcartel();
  cartel.FreeInstance();
end;

// cuando cambian las fechas
procedure TFREPDenunciaServicio.QRBEncabezadoPlanillaBeforePrint(
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

end;

procedure TFREPDenunciaServicio.TerminaThread(Sender : TObject);
begin
 { DBGrid1.DataSource := DSDenunciaServicio;
  GroupBox1.Caption := 'Animales ['+IntToStr(IBQDenunciaServicio.RecordCount)+']';
  BBImprimirReporte.Enabled := not(IBQDenunciaServicio.IsEmpty);
  BBXls.Enabled := not(IBQDenunciaServicio.IsEmpty);}
end;

procedure TFREPDenunciaServicio.IBQDenunciaServicioAfterOpen(DataSet: TDataSet);
begin
  inherited;

  IBQDenunciaServicio.First;
  while (not IBQDenunciaServicio.Eof) do
  begin
      if (DataSet.FieldByName('rp_animal').value <> null) then
         inc(cantidadAnimales);

      IBQDenunciaServicio.Next;
  end;

  IBQDenunciaServicio.First;
  DBGrid1.DataSource := DSDenunciaServicio;
  GroupBox1.Caption := Traducir('Animales [')+IntToStr(cantidadAnimales){IntToStr(IBQDenunciaServicio.RecordCount)}+']';

  IPreview.Enabled := not(IBQDenunciaServicio.IsEmpty);
  LPreview.Enabled := not(IBQDenunciaServicio.IsEmpty);
  LExpExcel.Enabled := not(IBQDenunciaServicio.IsEmpty);
  IExpExcel.Enabled := not(IBQDenunciaServicio.IsEmpty);
end;

procedure TFREPDenunciaServicio.DBGrid1DblClick(Sender: TObject);
var
  F : TFREPFichaAnimal;
begin
  inherited;
  if (DBGrid1.SelectedIndex = 0) then
    if not(IBQDenunciaServicio.eof) then
     begin
      if (IBQDenunciaServicio.fieldByName('id_animal').AsInteger <> 0) then
        begin
          F := TFREPFichaAnimal.Create(self);
          F.animal := IBQDenunciaServicio.fieldByName('id_animal').AsInteger;
          F.ShowModal;
          F.Destroy;
        end;  
     end;
end;

procedure TFREPDenunciaServicio.BBXlsClick(Sender: TObject);
var
  F : TFExpSRA;
begin
  inherited;
  if (SDXLS.Execute) then
  begin
    DTXLS.Title.Text := 'Folio Nº: '+EAFolio.Text+' - '+'Raza: '+CBxRaza.Text+' - '+'Criador: '+EACriador.Text+' - '+'Criador Nº: '+EACriadorNumero.Text;
    DTXLS.SaveToFile(SDXLS.FileName);
  end;
 { F := TFExpSRA.Create(self,tpServicio,IBQDenunciaServicio);

  F.NroCriador := EACriadorNumero.Text;
  F.NomCriador := EACriador.Text;
  F.FolioNro := EAFolio.Text;

  if (CodigoRaza <> -1) then
  begin
    F.NomRaza := CBxRaza.Text;
    F.CodRaza := IntToStr(CodigoRaza);
  end;

  F.ShowModal;
  F.Destroy;    }
end;

procedure TFREPDenunciaServicio.CBTipodeServicioClick(Sender: TObject);
begin
  inherited;
  if (CBTipodeServicio.Checked) then
  begin
    DBLCBATipodeServicio.Enabled := true;
    conServicio := true;
  end
  else
  begin
    DBLCBATipodeServicio.Enabled := false;
    DBLCBATipodeServicio.KeyValue:=-1;
    conServicio := false;
   // activarQuery();
  end;

end;

procedure TFREPDenunciaServicio.DBLCBATipodeServicioCloseUp(
  Sender: TObject);
begin
  inherited;
  //activarQuery();
end;

procedure TFREPDenunciaServicio.DBLCBATipodeServicioKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBATipodeServicio.ListVisible) then
   //  activarQuery();
end;

procedure TFREPDenunciaServicio.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    DBGrid1DblClick(nil);
end;

procedure TFREPDenunciaServicio.DTPCloseUpFechas(Sender: TObject);
begin
  inherited;
 // activarQuery;
end;

procedure TFREPDenunciaServicio.DTPInicioKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(TDateTimePicker(Sender).DroppedDown) then
    DTPcloseUpFechas(Sender);
end;

procedure TFREPDenunciaServicio.RGTipoReporteClick(Sender: TObject);
begin
  inherited;
  CBTipodeServicio.Enabled := true;
  DTPInicio.Enabled := true;
  DTPFin.Enabled := true;
  CambioExportacionExcel;

  ReiniciarCombos;     

  if (RGTipoReporte.ItemIndex = 0) then
  begin
       SQLGeneral := SQLBase;
  end;

  if (RGTipoReporte.ItemIndex = 2) then
  begin
            SQLGeneral := SQLBase;
            DTPInicio.Enabled:= false;
            DTPFin.Enabled:= false;
  end;
  
 // activarQuery;
end;

procedure TFREPDenunciaServicio.ComponentesVisiblesPorPais(pais: Integer);
begin
  inherited;
  if (pais = 1) then //Argentina
   begin
      GroupBox3.Visible:= True;
   end
  else
    if (pais = 2) then //Uruguay
     begin
        GroupBox3.Visible:= False;
        RGTipoReporte.Items.Clear;
        RGTipoReporte.Items.add('Tradicional');
        RGTipoReporte.ItemIndex:= 0;
     end
   else
       begin
          GroupBox3.Visible:= False;
          RGTipoReporte.Items.Clear;
          RGTipoReporte.Items.add('Tradicional');
          RGTipoReporte.ItemIndex:= 0;          
       end;
end;

procedure TFREPDenunciaServicio.LActividadClick(Sender: TObject);
var abm:TFABMActividad;
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      abm:=TFABMActividad.Create(Self);
      abm.abrir(faAbm);
      DMSoftvet.IBQActividad.Close;
      DMSoftvet.IBQActividad.Open;
      if nroID>-1 then
      begin
        DBLCBAActividad.KeyValue:=nroID;
        nroID:=-1;
      end;
    end;
end;

procedure TFREPDenunciaServicio.LActividadMouseEnter(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LActividad.Font.Color:= $00606C02;
      LActividad.Font.Style:= [fsBold,fsUnderline];
    end;
end;

procedure TFREPDenunciaServicio.LActividadMouseLeave(Sender: TObject);
begin
  inherited;
  if (StrComp(PChar(FPrincipal.RolUsuarioActual), PChar('ADMINISTRADOR')) = 0) then
    begin
      LActividad.Font.Color:= clWindowText;
      LActividad.Font.Style:= [fsUnderline];
    end;
end;

procedure TFREPDenunciaServicio.CBActividadClick(Sender: TObject);
begin
  inherited;
  if (CBActividad.Checked) then
  begin
    DBLCBAActividad.Enabled := true;
    LActividad.Enabled:= true;
    conActividad:= true;
  end
  else
  begin
    DBLCBAActividad.Enabled := false;
    DBLCBAActividad.KeyValue:=-1;
    LActividad.Enabled:= false;
    conActividad:= false;
 //   activarQuery();
  end;
end;

procedure TFREPDenunciaServicio.DBLCBAActividadCloseUp(Sender: TObject);
begin
  inherited;
//  activarQuery();
end;

procedure TFREPDenunciaServicio.DBLCBAActividadKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not(DBLCBAActividad.ListVisible) then
 //    activarQuery();
end;

procedure TFREPDenunciaServicio.CambioExportacionExcel;
begin
  DTXLS.Columns.Clear;
  case RGTipoReporte.ItemIndex of
    0 : begin
          DTXLS.Columns.Add.DataField := 'RP_ANIMAL';
          DTXLS.Columns[0].Title := 'RP Animal';

          DTXLS.Columns.Add.DataField := 'SERVICIO';
          DTXLS.Columns[1].Title := 'Tipo Servicio';

          DTXLS.Columns.Add.DataField := 'FINICIO';
          DTXLS.Columns[2].Title := 'Fecha Inicio';

          DTXLS.Columns.Add.DataField := 'FFIN';
          DTXLS.Columns[3].Title := 'Fecha Fin';

          DTXLS.Columns.Add.DataField := 'TORO';
          DTXLS.Columns[4].Title := 'Toro';
        end;
    1,2 : begin
            DTXLS.Columns.Add.DataField := 'FINICIO';
            DTXLS.Columns[0].Title := 'Entrada';

            DTXLS.Columns.Add.DataField := 'FFIN';
            DTXLS.Columns[1].Title := 'Salida';

            DTXLS.Columns.Add.DataField := 'SERVICIO';
            DTXLS.Columns[2].Title := 'Tipo';

            DTXLS.Columns.Add.DataField := 'HBA_TORO';
            DTXLS.Columns[3].Title := 'HBA Toro';

            DTXLS.Columns.Add.DataField := 'RP_TORO';
            DTXLS.Columns[4].Title := 'RP Toro';

            DTXLS.Columns.Add.DataField := 'RP_ANIMAL';
            DTXLS.Columns[5].Title := 'Tatuaje';

            DTXLS.Columns.Add.DataField := 'OBSERVACION';
            DTXLS.Columns[6].Title := 'Observaciones';
          end;
    3 : begin
          DTXLS.Columns.Add.DataField := 'FINICIO';
          DTXLS.Columns[0].Title := 'Entrada';

          DTXLS.Columns.Add.DataField := 'FFIN';
          DTXLS.Columns[1].Title := 'Salida';

          DTXLS.Columns.Add.DataField := 'SERVICIO';
          DTXLS.Columns[2].Title := 'Tipo';

          DTXLS.Columns.Add.DataField := 'HBA_TORO';
          DTXLS.Columns[3].Title := 'HBA Toro';

          DTXLS.Columns.Add.DataField := 'RP_TORO';
          DTXLS.Columns[4].Title := 'RP Toro';

          DTXLS.Columns.Add.DataField := 'RP_ANIMAL';
          DTXLS.Columns[5].Title := 'RP Hembra';

          DTXLS.Columns.Add.DataField := 'HBA_ANIMAL';
          DTXLS.Columns[6].Title := 'HBA Hembra';

          DTXLS.Columns.Add.DataField := 'ORDEN';
          DTXLS.Columns[7].Title := 'Linea';
        end;
  end;
end;

procedure TFREPDenunciaServicio.CargarCombos;
begin

     CBxTipoServicio.AddItem('TIPO DE SERVICIO',nil);
     CBxTipoServicio.AddItem('(TODOS)',nil);

     IBQConsultaTiposServicios.First;
     while not(IBQConsultaTiposServicios.Eof) do
     begin
          CBxTipoServicio.AddItem(IBQConsultaTiposServicios.FieldValues['sinonimo'],nil);
          IBQConsultaTiposServicios.Next;
     end;

     CBxActividad.AddItem('ACTIVIDAD',nil);
     CBxActividad.AddItem('(TODAS)',nil);

     DMSoftvet.DSActividad.DataSet.Close;
     DMSoftvet.DSActividad.DataSet.Open;
     DMSoftvet.DSActividad.DataSet.First;
     while not(DMSoftvet.DSActividad.DataSet.Eof) do
     begin
          CBxActividad.AddItem(DMSoftvet.DSActividad.DataSet.FieldValues['sinonimo'],nil);
          DMSoftvet.DSActividad.DataSet.Next;
     end;

     CBxRaza.AddItem('RAZA',nil);
     CBxRaza.AddItem('(TODAS)',nil);

     CBxTipoRegistro.Items.Insert(0,'TIPO DE REGISTRO');
     CBxTipoRegistro.Items.Insert(1,'(TODOS)');

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

procedure TFREPDenunciaServicio.CBxTipoServicioChange(Sender: TObject);
begin
  inherited;
  DBLCBATipodeServicio.Enabled := true;

  if ((CBxTipoServicio.Text <> 'TIPO DE SERVICIO') and (CBxTipoServicio.Text <> '(TODOS)'))then
  begin
    DBLCBATipodeServicio.KeyValue := IBQConsultaTiposServicios.Lookup('sinonimo',CBxTipoServicio.Text,'id_tipo_servicio');
    conServicio := true;
  end
  else
  begin
    DBLCBATipodeServicio.KeyValue := -1;
    conServicio := false;
    CBxTipoServicio.Items.Insert(0,'TIPO DE SERVICIO');
    CBxTipoServicio.ItemIndex := 0;
    DelTipoServicio := false;
  end;
 // activarQuery();
    
end;

procedure TFREPDenunciaServicio.CBxTipoServicioCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTipoServicio) then
  begin
       CBxTipoServicio.Items.Delete(0);
       DelTipoServicio := true; 
  end;
end;

procedure TFREPDenunciaServicio.CBxActividadCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelActividad) then
  begin
       CBxActividad.Items.Delete(0);
       DelActividad := true; 
  end;
end;

procedure TFREPDenunciaServicio.CBxActividadChange(Sender: TObject);
begin
  inherited;
  DBLCBAActividad.Enabled := true;

  if ((CBxActividad.Text <> 'ACTIVIDAD') and (CBxActividad.Text <> '(TODAS)')) then
  begin
    DBLCBAActividad.KeyValue := DMSoftvet.DSActividad.DataSet.Lookup('sinonimo',CBxActividad.Text,'id_actividad');
    conActividad:= true;
  end
  else
  begin
    DBLCBAActividad.KeyValue := -1;
    conActividad:= false;
    CBxActividad.Items.Insert(0,'ACTIVIDAD');
    CBxActividad.ItemIndex := 0;
    DelActividad := false;
  end;
 // activarQuery();

end;

procedure TFREPDenunciaServicio.CBxRazaChange(Sender: TObject);
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

procedure TFREPDenunciaServicio.CBxRazaCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelRaza) then
  begin
       CBxRaza.Items.Delete(0);
       DelRaza := true;
  end;
end;

procedure TFREPDenunciaServicio.ReiniciarCombos;
begin

     IBQConsultaTiposServicios.Close;
     IBQConsultaTiposServicios.Open;
     IBQConsultaTiposServicios.First;

     IBQGetRazas.Close;
     IBQGetRazas.Open;
     IBQGetRazas.First;

     DMSoftvet.DSActividad.DataSet.Close;
     DMSoftvet.DSActividad.DataSet.Open;
     DMSoftvet.DSActividad.DataSet.First;

     CBxActividad.Clear;
     CBxTipoServicio.Clear;
     CBxRaza.Clear;

     CargarCombos;

     CBxActividad.ItemIndex := 0;
     CBxTipoServicio.ItemIndex := 0;
     CBxRaza.ItemIndex := 0;

end;

procedure TFREPDenunciaServicio.CBxTipoRegistroChange(Sender: TObject);
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

procedure TFREPDenunciaServicio.CBxTipoRegistroCloseUp(Sender: TObject);
begin
  inherited;

  if not(DelTipoRegistro) then
  begin
       CBxTipoRegistro.Items.Delete(0);
       DelTipoRegistro := true; 
  end;
end;

function TFREPDenunciaServicio.ExisteRegistro(cadena : string) : boolean;
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

procedure TFREPDenunciaServicio.Button1Click(Sender: TObject);
begin
  inherited;
  activarQuery;
end;

procedure TFREPDenunciaServicio.JvIBotonBuscarClick(Sender: TObject);
begin
  inherited;
  Button1.OnClick(Sender);
end;

end.

