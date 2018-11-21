unit UDOSRADenunciaNacimientosPorTransfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  Menus, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, QRCtrls, QuickRpt,
  jpeg, IBStoredProc, DataExport, DataToXLS, WinXP, QRExport, QRWebFilt,
  QRPDFFilt, UDMSoftvet, DBCtrls, UDBLookupComboBoxAuto, UMensajeImpresora,
  EditAuto, QRPrntr, PngImage, JvGIF, JvExControls, JvLabel, ImgList,
  PngImageList, UBDBGrid, JvExExtCtrls, JvImage;

type
  TFDOSRADenunciaNacimientosPorTransfer = class(TFUniversal)
    GBFechas: TGroupBox;
    LabelDesde: TLabel;
    LabelHasta: TLabel;
    DTPInicio: TDateTimePicker;
    DTPFin: TDateTimePicker;
    RGTipoReporte: TRadioGroup;
    GroupBox3: TGroupBox;
    LabelRaza: TLabel;
    Label2: TLabel;
    LabelCriadorNumero: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EARaza: TEditAuto;
    EACriador: TEditAuto;
    EACriadorNumero: TEditAuto;
    CBxRaza: TComboBox;
    EAFolio: TEdit;
    EALinea: TEdit;
    GroupBox1: TGroupBox;
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
    IBQRepDenunciaNacimientos: TIBQuery;
    IBQGetCodigoRazaSra: TIBQuery;
    IBQGetCodigoRazaSraCOD_RAZA_SRA: TIntegerField;
    IBQGetRazas: TIBQuery;
    DSDenunciaNacimientos: TDataSource;
    Panel1: TPanel;
    IBQRepDenunciaNacimientosIDMADRE: TIntegerField;
    IBQRepDenunciaNacimientosID_RAZA: TIntegerField;
    IBQRepDenunciaNacimientosRPMADRE: TIBStringField;
    IBQRepDenunciaNacimientosHBAMADRE: TIBStringField;
    IBQRepDenunciaNacimientosNOMBREMADRE: TIBStringField;
    IBQRepDenunciaNacimientosRPPADRE: TIBStringField;
    IBQRepDenunciaNacimientosHBAPADRE: TIBStringField;
    IBQRepDenunciaNacimientosNOMBREPADRE: TIBStringField;
    IBQRepDenunciaNacimientosRPRECEPTORA: TIBStringField;
    IBQRepDenunciaNacimientosDIAI: TIntegerField;
    IBQRepDenunciaNacimientosMESI: TIntegerField;
    IBQRepDenunciaNacimientosANIOI: TIntegerField;
    IBQRepDenunciaNacimientosDIAF: TIntegerField;
    IBQRepDenunciaNacimientosMESF: TIntegerField;
    IBQRepDenunciaNacimientosANIOF: TIntegerField;
    IBQRepDenunciaNacimientosDIAS: TIntegerField;
    IBQRepDenunciaNacimientosMESS: TIntegerField;
    IBQRepDenunciaNacimientosANIOS: TIntegerField;
    IBQRepDenunciaNacimientosIDHIJO: TIntegerField;
    IBQRepDenunciaNacimientosRPHIJO: TIBStringField;
    IBQRepDenunciaNacimientosNOMBRE: TIBStringField;
    IBQRepDenunciaNacimientosTIPO_PARTO: TIntegerField;
    IBQRepDenunciaNacimientosPESO_NACIMIENTO_1: TFloatField;
    IBQRepDenunciaNacimientosPESO_NACIMIENTO_PROM: TFloatField;
    IBQRepDenunciaNacimientosSEXO_1: TIntegerField;
    IBQRepDenunciaNacimientosNOMBRESEXO: TIBStringField;
    IBQRepDenunciaNacimientosFECHA_NAC: TDateField;
    IBQRepDenunciaNacimientosCOLOR: TIntegerField;
    IBQRepDenunciaNacimientosCRIA: TIBStringField;
    IBQRepDenunciaNacimientosMELLIZO: TIntegerField;
    IBQRepDenunciaNacimientosPREFIJO: TIBStringField;
    IBQRepDenunciaNacimientosNRO_REG_ASOC_M: TIBStringField;
    IBQRepDenunciaNacimientosNRO_REG_ASOC_P: TIBStringField;
    IBQRepDenunciaNacimientosCTRO_NRO: TIntegerField;
    IBQRepDenunciaNacimientosCTRO_NOMBRE: TIBStringField;
    IBQRepDenunciaNacimientosFECHA_TRANSFERENCIA: TDateField;
    IBQRepDenunciaNacimientosFECHA_SERVICIO: TDateField;
    BitDBGrid1: TBitDBGrid;
    IExportExcel: TImage;
    LExportarExcel: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    BConsulta: TButton;
    JvIBotonBuscar: TJvImage;
    IBQCodRaza: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure CBxRazaChange(Sender: TObject);
    procedure CBxRazaCloseUp(Sender: TObject);
    procedure IPreviewClick(Sender: TObject);
    procedure DTPInicioCloseUp(Sender: TObject);
    procedure DTPInicioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ISalirClick(Sender: TObject);
    procedure IExportExcelClick(Sender: TObject);
    procedure RGTipoReporteClick(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure JvIBotonBuscarClick(Sender: TObject);
    function  GetCodRaza(Raza : String) : Integer;
  private
    { Private declarations }
    procedure CargarCombo;
    procedure ActivarQuery;
  public
    { Public declarations }
    raza : Integer;
  end;

var
  FDOSRADenunciaNacimientosPorTransfer: TFDOSRADenunciaNacimientosPorTransfer;
  DelRaza : boolean;
  CodigoRaza, cantidadAnimales : integer;

implementation

uses UPrincipal,uTiposGlobales, DateUtils, UCartel, UDOSRADenunciaNacimientosPorTransferPreview, UTraduccion,
     UExpSRA;

{$R *.dfm}

function TFDOSRADenunciaNacimientosPorTransfer.GetCodRaza(Raza : String) : Integer;
begin
    IBQCodRaza.Close;
    IBQCodRaza.ParamByName('raza').AsString:= Raza;
    IBQCodRaza.Open;

    Result := IBQCodRaza.FieldValues['id_raza'];

end;

procedure TFDOSRADenunciaNacimientosPorTransfer.ActivarQuery;
begin
  IBQRepDenunciaNacimientos.Close;
  IBQRepDenunciaNacimientos.ParamByName('esta').AsInteger := FPrincipal.EstablecimientoActual;
  IBQRepDenunciaNacimientos.ParamByName('desde').AsDateTime := DTPInicio.DateTime;
  IBQRepDenunciaNacimientos.ParamByName('hasta').AsDateTime := DTPFin.DateTime;


  if (RGTipoReporte.ItemIndex = 0) then
    IBQRepDenunciaNacimientos.ParamByName('vacio').AsInteger := 0
  else
    IBQRepDenunciaNacimientos.ParamByName('vacio').AsInteger := 1;


  if ((CBxRaza.Text <> '(Todas)') and (CBxRaza.Text <> 'RAZAS') and (CBxRaza.Text <> 'RAZA')) then
    IBQRepDenunciaNacimientos.ParamByName('raza').AsInteger := GetCodRaza(CBxRaza.Text)
  else
     IBQRepDenunciaNacimientos.ParamByName('raza').AsInteger := -1;

  IBQRepDenunciaNacimientos.Open;

  IBQRepDenunciaNacimientos.Last;
  IBQRepDenunciaNacimientos.First;

  cantidadAnimales := IBQRepDenunciaNacimientos.RecordCount;

  GroupBox1.Caption := ' Animales [ ' + IntToStr(cantidadAnimales) + ' ] ';

  if (cantidadAnimales = 0) then
  begin
       IPreview.Enabled := false;
       LPreview.Enabled := false;
       IExportExcel.Enabled := false;
       LExportarExcel.Enabled := false;
  end
  else
  begin
       IPreview.Enabled := true;
       LPreview.Enabled := true;
       IExportExcel.Enabled := true;
       LExportarExcel.Enabled := true;
  end;

end;

procedure TFDOSRADenunciaNacimientosPorTransfer.CargarCombo;
begin
     CBxRaza.AddItem('RAZAS',nil);
     CBxRaza.AddItem('(TODAS)',nil);
     IBQGetRazas.First;
     while not(IBQGetRazas.Eof) do
     begin
       CBxRaza.AddItem(IBQGetRazas.FieldValues['sinonimo'],nil);
       IBQGetRazas.Next;
     end;
end;

procedure TFDOSRADenunciaNacimientosPorTransfer.FormShow(Sender: TObject);
begin
  inherited;

  DTPInicio.Date := IncYear(now,-1);
  DTPFin.Date := now;

  self.Caption := Traducir('Huella - Denuncia de Nacimientos');
  self.PTitulo.Caption := Traducir('Denuncia de Nacimientos por Transferencia');

  //ActivarQuery;

  IBQGetRazas.Close;
  IBQGetRazas.Open;

  CargarCombo;
  CBxRaza.ItemIndex := 0;
end;

procedure TFDOSRADenunciaNacimientosPorTransfer.CBxRazaChange(
  Sender: TObject);
begin
  inherited;
  if ((CBxRaza.Text <> 'RAZA') and (CBxRaza.Text <> '(TODAS)')) then
  begin
       IBQGetCodigoRazaSra.Close;
       IBQGetCodigoRazaSra.ParamByName('raza').AsInteger := IBQGetRazas.Lookup('sinonimo',CBxRaza.Text,'id_raza');
       IBQGetCodigoRazaSra.Open;

       if (IBQGetCodigoRazaSra.FieldValues['cod_raza_sra'] <> null) then
          CodigoRaza := IBQGetCodigoRazaSra.FieldValues['cod_raza_sra']
       else
          CodigoRaza := -1;
  end
  else
  begin
       CBxRaza.Items.Insert(0,'RAZA');
       CBxRaza.ItemIndex := 0;
       CodigoRaza := -1;
       DelRaza := false;
  end;
end;

procedure TFDOSRADenunciaNacimientosPorTransfer.CBxRazaCloseUp(
  Sender: TObject);
begin
  inherited;
  if not(DelRaza) then
  begin
       CBxRaza.Items.Delete(0);
       DelRaza := true;
  end;
end;

procedure TFDOSRADenunciaNacimientosPorTransfer.IPreviewClick(Sender: TObject);
var cartel : TCartel;
    F1 : TFDOSRADenunciaNacimientosPorTransferPreview;
begin
  inherited;

  MostrarMensajeImpresion();
  inherited;
  cartel := TCartel.getInstance();
  cartel.abrircartel('Generando Reporte de Denuncia de Nacimientos por Transferencia...');

  if (RGTipoReporte.ItemIndex = 0) then
  begin
              F1 := TFDOSRADenunciaNacimientosPorTransferPreview.Create(self);
              cartel.cerrarcartel;
              cartel.FreeInstance;

              F1.QRLNumeroCriadorValor.Caption := EACriadorNumero.Text;
              F1.QRLNombreCriadorValor.Caption := EACriador.Text;
              F1.QRLFolioValor.Caption := EAFolio.Text;
             // F1.QRLCantidad.Caption := IntToStr(cantidadAnimales);

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

              F1.ShowModal;
              F1.Destroy;
  end;

  if (RGTipoReporte.ItemIndex = 1) then
  begin
              F1 := TFDOSRADenunciaNacimientosPorTransferPreview.Create(self);
              cartel.cerrarcartel;
              cartel.FreeInstance;
              F1.QRLNumeroCriadorValor.Caption := EACriadorNumero.Text;
              F1.QRLNombreCriadorValor.Caption := EACriador.Text;
              F1.QRLFolioValor.Caption := EAFolio.Text;
             // F1.QRLCantidad.Caption := IntToStr(cantidadAnimales);

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

              F1.ShowModal;
              F1.Destroy;
  end;

end;

procedure TFDOSRADenunciaNacimientosPorTransfer.DTPInicioCloseUp(
  Sender: TObject);
begin
  inherited;

  //ActivarQuery;
end;

procedure TFDOSRADenunciaNacimientosPorTransfer.DTPInicioKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if not(TDateTimePicker(Sender).DroppedDown) then
    DTPInicioCloseUp(Sender);

end;

procedure TFDOSRADenunciaNacimientosPorTransfer.ISalirClick(
  Sender: TObject);
begin
  inherited;

  Close();
end;

procedure TFDOSRADenunciaNacimientosPorTransfer.IExportExcelClick(
  Sender: TObject);
var
  F : TFExpSRA;
begin
  inherited;

{  if (SDXLS.Execute) then
  begin
    DTXLS.Title.Text := 'Folio Nº: '+EAFolio.Text+' - '+'Raza: '+CBxRaza.Text+' - '+'Criador: '+EACriador.Text+' - '+'Criador Nº: '+EACriadorNumero.Text;
    DTXLS.SaveToFile(SDXLS.FileName);
  end;}
  F := TFExpSRA.Create(self,tpNacTransf,IBQRepDenunciaNacimientos);

  F.NroCriador := EACriadorNumero.Text;
  F.NomCriador := EACriador.Text;
  F.FolioNro := EAFolio.Text;

  if (CodigoRaza <> -1) then
  begin
    F.NomRaza := CBxRaza.Text;
    F.CodRaza := IntToStr(CodigoRaza);
  end;

  F.ShowModal;
  F.Destroy;

end;

procedure TFDOSRADenunciaNacimientosPorTransfer.RGTipoReporteClick(
  Sender: TObject);
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

procedure TFDOSRADenunciaNacimientosPorTransfer.BConsultaClick(
  Sender: TObject);
begin
  inherited;
  ActivarQuery;
end;

procedure TFDOSRADenunciaNacimientosPorTransfer.JvIBotonBuscarClick(
  Sender: TObject);
begin
  inherited;
  BConsulta.OnClick(Sender);
end;

end.
